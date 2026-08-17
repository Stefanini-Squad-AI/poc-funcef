{-------------------------------------------------------------------------------
 Data       : 04.07.2007
 Autor      : Antonio Marcos (amf)
 Pendência  : 25515 - Implementação
 Descrição  : Adicionada a coluna (no grid) de item que identifica os itens no estoque de
 apresentaram diferença.
--------------------------------------------------------------------------------
 Data       : 03.10.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22580 - Complemento para Homologação
 Descrição  : Acerto nas colunas do Grid para atender a solicitação
----------------------------------------------------------------------------------}

unit FMTConsDifInvent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, wwdblook, Grids, Wwdbigrd,
  Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker, ComCtrls, DBClient,
  uCMClientDataSet, uCtrlInventario, uCtrlAlmox, uCtrlArtigo, uCmSqlParams;

type
  TFrmMTConsDifInvent = class(TfrmSairAjuda)
    dsSel: TwwDataSource;
    Pg: TPageControl;
    TbConsulta: TTabSheet;
    lbArtigo: TLabel;
    grpPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edDataI: TCMDateTimePicker;
    EdDataF: TCMDateTimePicker;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    Panel1: TPanel;
    GrdSel: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    dblcArt: TwwDBLookupCombo;
    TbResult: TTabSheet;
    GrdResult: TwwDBGrid;
    plntot: TPanel;
    Label9: TLabel;
    LbTotDif: TLabel;
    LbArt: TLabel;
    cdsSel: TCMClientDataSet;
    dsAlmox: TwwDataSource;
    dsResult: TwwDataSource;
    cdsResult: TCMClientDataSet;
    cdsAlmox: TCMClientDataSet;
    BtnSel: TBitBtn;
    BtnLimpar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    cdsArtigo: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
  private
    { Private declarations }
    Inventario : TCtrlInventario;
    Almox      : TCtrlAlmox;
    Artigo     : TCtrlArtigo;
    //
    Procedure FazConsulta;

  public
    { Public declarations }
  end;

var
  FrmMTConsDifInvent: TFrmMTConsDifInvent;

implementation

{$R *.DFM}

Uses DBaseDados, uSistema, uMensErro;

procedure TFrmMTConsDifInvent.FormCreate(Sender: TObject);
begin
  inherited;
  Inventario := TCtrlInventario.Create;
  Inventario.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs(Inventario);

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(Inventario);

  BtnLimpar.Click;

  cdsArtigo.Data := Artigo.ListArtigo;
  
  Pg.ActivePage := TbConsulta;  
end;

procedure TFrmMTConsDifInvent.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If Not cdsAlmox.IsEmpty Then
     Begin
        With cdsSel Do
           Begin
              Append;
              FieldByName('CODALMOXARIFADO').asInteger := cdsAlmox.FieldByName('CODALMOXARIFADO').asInteger;
              FieldByName('DESCALMOX').asString        := cdsAlmox.FieldByName('DESCALMOX').asString;
            End;
        cdsAlmox.Delete;
     End;
end;

procedure TFrmMTConsDifInvent.BtnRemoveClick(Sender: TObject);
begin
  inherited;
   If Not cdsSel.IsEmpty Then
       Begin
          With cdsAlmox Do
             Begin
               Append;
               FieldByName('CODALMOXARIFADO').asInteger := cdsSel.FieldByName('CODALMOXARIFADO').asInteger;
               FieldByName('DESCALMOX').asString        := cdsSel.FieldByName('DESCALMOX').asString;
             End;
          cdsSel.Delete;
       End;
end;

procedure TFrmMTConsDifInvent.FazConsulta;
Var
  slistAlmox : String;
  rTotDif    : Double;
Begin
   rTotDif := 0;
   // Monta a Clausula IN com os códigos dos almoxarifado
   sListAlmox := '';
   cdsSel.First;
   While Not cdsSel.EOF Do
       Begin
           sListAlmox := sListAlmox + IntToStr(cdsSel.FieldByName('CODALMOXARIFADO').AsInteger) + ',';
           cdsSel.Next;
       End;
   sListAlmox := Copy(sListAlmox,1,Length(sListAlmox)- 1);

   cdsResult.Data := Inventario.ListDifInventArtigo(dblcArt.LookupValue,
                                                    edDataI.Date,edDataF.Date,
                                                    sListAlmox);

   If Not cdsResult.IsEmpty Then
      Begin
         cdsResult.DisableControls;
         cdsResult.First;
         While Not cdsResult.Eof Do
           Begin
               rTotDif := rTotDif + cdsResult.FieldByName('DIF').asFloat;
               cdsResult.Next;
           End;
         cdsResult.EnableControls;
      End;

   lbTotDif.Caption := Format('%15.4f',[rTotDif]);

end;

procedure TFrmMTConsDifInvent.BtnSelClick(Sender: TObject);
begin
  inherited;
  If Trim(edDataI.Text) = '' Then
     Begin
        MsgDlg('Data de início não preenchida','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
     End
  Else
  If Trim(edDataF.Text) = '' Then
     Begin
        MsgDlg('Data final não preenchida','Erro',mtError,[mbOk],0);
        edDataF.SetFocus;
     End
  Else
  If edDataI.Date > edDataF.Date Then
     Begin
        MsgDlg('Data de início não pode ser maior que a data final','Erro',mtError,[mbOk],0);
        edDataI.SetFocus;
     End
  Else

  If cdsSel.IsEmpty Then
     Begin
        MsgDlg('Não há nenhum almoxarifado selecionado','Erro',mtError,[mbOk],0);
     End
  Else
     Begin
        FazConsulta;
        Pg.ActivePage := TbResult;
     End;
end;

procedure TFrmMTConsDifInvent.BtnLimparClick(Sender: TObject);
begin
  inherited;
  edDataI.Text := '';
  edDataF.Text := '';

  cdsAlmox.Data := Almox.ListAlmox(Sistema.IdEmpresa);
  cdsSel.Data   := Almox.ListAlmox(-1);

  dblcArt.Text   := '';
  lbArt.Caption  := '';
  cdsResult.Close;
  lbTotDif.Caption := '';
  Pg.ActivePage := TbConsulta;

end;

end.
