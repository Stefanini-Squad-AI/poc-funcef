{-------------------------------------------------------------------------------
 Data       : 06.10.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22573
 Descrição  : Alterei a spListBaixa no DataModule DAlmoxarifado.dfm
              No Join havia a instrução FLGDESTINO = 'E'. Retirei esta linha.
----------------------------------------------------------------------------------}


unit FMTBaixaDir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, wwdblook, TREdit,
  Mask, DBCtrls, Db, Wwdatsrc, DBClient, uCMClientDataSet, uCtrlBaixaDireta,
  uCtrlAlmox, uCtrlCentroCusto, wwclient, uCmSqlParams;

type
  TFrmMTBaixaDir = class(TfrmSairAjuda)
    Panel1: TPanel;
    PlnDet: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblRequis: TLabel;
    RgBaixa: TRadioGroup;
    dbCodArt: TDBEdit;
    BtOk: TBitBtn;
    btCancela: TBitBtn;
    edDesc: TDBEdit;
    GrpQtde: TGroupBox;
    Label3: TLabel;
    edQtdeExt: TDBRealEdit;
    edUN: TDBEdit;
    grpAlmoxCC: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    dblcAlmox: TwwDBLookupCombo;
    dblcCCust: TwwDBLookupCombo;
    reRequis: TRealEdit;
    grdItem: TwwDBGrid;
    Panel2: TPanel;
    btnBaixaTodos: TBitBtn;
    BtnBaixar: TBitBtn;
    ds: TwwDataSource;
    CdsAlmox: TCMClientDataSet;
    CdsCentCust: TCMClientDataSet;
    edQtde: TDBRealEdit;
    Cds: TwwClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure RgBaixaClick(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure btnBaixaTodosClick(Sender: TObject);
    procedure BtnBaixarClick(Sender: TObject);
  private
    { Private declarations }
    sCodCentCust : String;
    BaixaDireta  : TCtrlBaixaDireta;
    Almox        : TCtrlAlmox;
    CentroCusto  : TCtrlCentroCusto;

    Procedure SetBaixa( BaixarTodas : boolean );
    Procedure Sel ( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTBaixaDir: TFrmMTBaixaDir;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uModulo, uCtrlPadroes;

procedure TFrmMTBaixaDir.FormCreate(Sender: TObject);
begin
  inherited;
  grdItem.BringToFront;

  BaixaDireta := TCtrlBaixaDireta.Create;
  BaixaDireta.InitializeAs( Padroes );
  BaixaDireta.Cds := Cds;

  Almox := TCtrlAlmox.Create;
  Almox.InitializeAs( BaixaDireta );

  CentroCusto := TCtrlCentroCusto.Create;
  CentroCusto.InitializeAs( BaixaDireta );

  CdsCentCust.Data := CentroCusto.ListaCentroCusto(Sistema.IdEmpresa,'',True,0,'A');

  Sel( Modulo.iIdNota );

end;

procedure TFrmMTBaixaDir.RgBaixaClick(Sender: TObject);
begin
  inherited;
    Case RgBaixa.ItemIndex Of
       1 : Begin
              dblcAlmox.Text := '';
              dblcAlmox.Enabled := False;
              dblcCCust.Enabled := True;
             If Trim(sCodCentCust) <> '' Then
                dblcCCust.LookupValue := sCodCentCust;
           End;
       0 : Begin
              dblcAlmox.Enabled := True;
              dblcCCust.Text := '';
              dblcCCust.Enabled := False;
           End;
    Else
        Begin
            dblcAlmox.Text := '';
            dblcAlmox.Enabled := False;
            dblcCCust.Enabled := True;
        End;
    End;

end;

procedure TFrmMTBaixaDir.btCancelaClick(Sender: TObject);
begin
  inherited;
  grdItem.BringToFront;
end;

procedure TFrmMTBaixaDir.SetBaixa(BaixarTodas: boolean);
Var
   x : Integer;
begin
  inherited;
  For x := 0 To Pred(ComponentCount) Do
     If (Components[x] is TControl) and ( TControl(Components[x]).Tag = 99 ) then
         TControl(Components[x]).Visible :=  Not BaixarTodas;

  grdItem.SendToBack;
  edQtde.Value      := 0;
  dblcAlmox.Text    := '';
  dblcCCust.Text    := '';
  RgBaixa.ItemIndex := 0;
  RgBaixa.SetFocus;

  cdsAlmox.Data  := Almox.ListAlmox(Sistema.IdEmpresa,Cds.FieldByName('CODALMOXARIFADO').asInteger);

  sCodCentCust   := BaixaDireta.GetCentroCustoSCI(Cds.FieldByName('IDITEMOC').asInteger);

  reRequis.Value := Cds.FieldByName('NUMNOTA').AsFloat;
end;

procedure TFrmMTBaixaDir.BtOkClick(Sender: TObject);
begin
  inherited;
  Try
     If edQtde.Value > edQtdeExt.Value Then
        Begin
            MsgDlg('Quantidade baixada não pode ser maior que a existente','Erro',mtError,[mbOK],0);
            edQtde.SetFocus;
            exit;
        End;
     if reRequis.Value = 0  then
        Begin
            MsgDlg('Requisição não preenchida','Erro',mtError,[mbOK],0);
            reRequis.SetFocus;
            exit;
        end;
     If ( RgBaixa.itemIndex = 0 ) And ( Trim(dblcAlmox.Text) = '' ) Then
        Begin
            MsgDlg('Almoxarifado não preenchido','Erro',mtError,[mbOK],0);
            dblcAlmox.SetFocus;
            exit;
        End;
     If ( RgBaixa.itemIndex = 1 ) And ( Trim(dblcCCust.Text) = '' ) Then
        Begin
            MsgDlg('Centro de Custo não preenchido','Erro',mtError,[mbOK],0);
            dblcCCust.SetFocus;
            exit;
        End;

     if (trim(dblcCCust.text) <> '') and (trim(dblcCCust.LookupValue) <> '') then
     begin

     end;

     If Not BaixaDireta.FazBaixarDireta( TTipoBaixaDir(RgBaixa.ItemIndex),
                                         Sistema.IdEmpresa)
     Then
        MsgDlg(BaixaDireta.MessageInfo,'Erro',mtError,[mbOk],0);

  Finally
       Cds.Filter   := '';
       Cds.Filtered := False;

       btCancela.Click;
  End;
end;

procedure TFrmMTBaixaDir.btnBaixaTodosClick(Sender: TObject);
begin
  inherited;
  SetBaixa( True );

  Cds.Filter   := '';
  Cds.Filtered := False;

  Cds.Edit;
end;

procedure TFrmMTBaixaDir.BtnBaixarClick(Sender: TObject);
begin
  inherited;
  SetBaixa( False );

  Cds.Filter   := 'IDITENSRECDEV = '+ Cds.FieldByName('IDITENSRECDEV').AsString;
  Cds.Filtered := True;

  Cds.Edit;
end;

procedure TFrmMTBaixaDir.Sel(n: Double);
begin
  Cds.Data := BaixaDireta.ListBaixaDireta( n );

  Cds.ControlType.Add('FLAG;CheckBox;1;0');

end;

end.
