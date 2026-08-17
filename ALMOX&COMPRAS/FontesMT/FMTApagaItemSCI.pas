unit FMTApagaItemSCI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, StdCtrls,
  ExtCtrls, wwdblook, CMDBLookupCombo, Buttons, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, DBClient, uCMClientDataSet,
  uCtrlApagaItemSCI, uCtrlArtigo, uCtrlGrupoProd, uFuncaoGeral, wwclient,
  uCmSqlParams;

type
  TFrmMTApagaItemSCI = class(TfrmSairAjuda)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    BtnSelecinar: TSpeedButton;
    BtnLimpar: TSpeedButton;
    dblcSCI: TCMDBLookupCombo;
    dblcGrupo: TCMDBLookupCombo;
    dblcArt: TwwDBLookupCombo;
    RgEmpresa: TRadioGroup;
    dsItem: TwwDataSource;
    GrdItem: TwwDBGrid;
    plnTitulo: TPanel;
    lbBar: TLabel;
    pgBar: TProgressBar;
    btnExcluir: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    cdsSCICombo: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    CdsArtigo: TCMClientDataSet;
    CdsItem: TwwClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSelecinarClick(Sender: TObject);
    procedure GrdItemDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ApagaItemSCI : TCtrlApagaItemSCI;
    Artigo       : TCtrlArtigo;
    GrupoProd    : TCtrlGrupoProd;
    //
    Procedure Progresso(Args : Array of Variant );
    Procedure MontaSel;

  public
    { Public declarations }
  end;

var
  FrmMTApagaItemSCI: TFrmMTApagaItemSCI;

implementation

{$R *.DFM}

uses uSistema, DBaseDados, uModulo, uMensErro;

procedure TFrmMTApagaItemSCI.FormCreate(Sender: TObject);
begin
  inherited;
  ApagaItemSCI := TCtrlApagaItemSCI.Create;
  ApagaItemSCI.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  ApagaItemSCI.Progresso := Progresso;
  ApagaItemSCI.cds := CdsItem;

  Artigo := TCtrlArtigo.Create;
  Artigo.InitializeAs(ApagaItemSCI);

  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.InitializeAs(ApagaItemSCI);

  CdsItem.Data := ApagaItemSCI.ListItensSCI(-1,0,'','');
  CdsItem.ControlType.Add('FLAG;CheckBox;1;0');
  
  CdsArtigo.Data     := Artigo.ListArtigo;
  CdsGrupoProd.Data  := GrupoProd.ListGrupoProd;
  cdsSCICombo.Data   := ApagaItemSCI.ListComboSCI;
end;

procedure TFrmMTApagaItemSCI.MontaSel;
begin
   CdsItem.Data := ApagaItemSCI.ListItensSCI(FuncaoGeral.Decode( RgEmpresa.ItemIndex,0,Sistema.IdEmpresa,0),
                                             FuncaoGeral.Decode( Trim(dblcSCI.Text),'',-1,dblcSCI.LookupValue),
                                             FuncaoGeral.Decode( Trim(dblcArt.Text),'','',dblcArt.LookupValue),
                                             FuncaoGeral.Decode( Trim(dblcGrupo.Text),'','',dblcGrupo.LookupValue));
  CdsItem.ControlType.Add('FLAG;CheckBox;1;0');
end;

procedure TFrmMTApagaItemSCI.BtnLimparClick(Sender: TObject);
begin
  inherited;
  dblcSCI.Clear;
  dblcArt.Clear;
  dblcGrupo.Clear;
end;

procedure TFrmMTApagaItemSCI.BtnSelecinarClick(Sender: TObject);
begin
  inherited;
  MontaSel;
end;

procedure TFrmMTApagaItemSCI.GrdItemDblClick(Sender: TObject);
begin
  inherited;
  CdsItem.Edit;
  CdsItem.FieldByName('FLAG').AsInteger := CdsItem.FieldByName('FLAG').AsInteger xor 1;
  CdsItem.Post;
end;

procedure TFrmMTApagaItemSCI.Progresso(Args: array of Variant);
begin
   pgBar.Max       := Args[1];
   pgBar.Position  := Args[2];
   LbBar.Caption   := Args[3];

   Self.Repaint;
end;

procedure TFrmMTApagaItemSCI.btnExcluirClick(Sender: TObject);
begin
  inherited;
  LbBar.Visible := True;
  pgBar.Visible := True;

  ApagaItemSCI.CreateThreadProgresso;

  If Not ApagaItemSCI.ApagarItem( ApagaItemSCI.ProgressFileName ) Then
     Begin
        ApagaItemSCI.FreeThreadProgresso;
        MsgDlg(ApagaItemSCI.MessageInfo,'Erro',mtError,[mbOk],0)
     End
  Else
     Begin
        ApagaItemSCI.FreeThreadProgresso;
        MsgDlg(ApagaItemSCI.MessageInfo,'Informação',mtInformation,[mbOk],0);
     End;
  LbBar.Visible := False;     
  pgBar.Visible := False;

end;

procedure TFrmMTApagaItemSCI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ApagaItemSCI.Free;
  Artigo.Free;
  GrupoProd.Free;

  inherited;
end;

end.
