unit FCadClasFisXImpostoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, CMDBLookupCombo, Grids, Wwdbigrd, Wwdbgrid, DBTables, 
  uCtrlClasfisclifor, uCtrlClasfisxtipoagre;

type
  TFrmCadClasFisXImpostoMT = class(TFrmCadastroMT)
    PnlCadastro: TPanel;
    GrdTipoDesembAssoc: TwwDBGrid;
    PnlTitTipoAgreAssoc: TPanel;
    PblRamoForn: TPanel;
    Label1: TLabel;
    CmbClasFisclifor: TCMDBLookupCombo;
    PnlCtrls: TPanel;
    BtnIncluiDesemb: TSpeedButton;
    BtnIncluiTodosDesemb: TSpeedButton;
    BtnExcluiDesembAssoc: TSpeedButton;
    BtnExcluiAllDesembAssoc: TSpeedButton;
    PnlDesemb: TPanel;
    PnlTitDesemb: TPanel;
    GrdTipDesemb: TwwDBGrid;
    CdsImpAgreg: TCMClientDataSet;
    CdsCalass: TCMClientDataSet;
    dsImpAgreg: TwwDataSource;
    CdsAssoc: TCMClientDataSet;
    dsAssoc: TwwDataSource;
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluiDesembClick(Sender: TObject);
    procedure BtnIncluiTodosDesembClick(Sender: TObject);
    procedure BtnExcluiAllDesembAssocClick(Sender: TObject);
    procedure BtnExcluiDesembAssocClick(Sender: TObject);
    procedure CmbClasFiscliforCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlClasfisclifor    : TCtrlClasfisclifor;
    CtrlClasfisxtipoagre : TCtrlClasfisxtipoagre;
    procedure InsereDirEsq;
    procedure InsereEsqDir;
    procedure montagrid;
  public
    { Public declarations }
  end;

var
  FrmCadClasFisXImpostoMT: TFrmCadClasFisXImpostoMT;

implementation

uses uFuncaoGeral, uMensErro, uSistema, DBasedados, uCtrlParamIntegra;


{$R *.DFM}

procedure TFrmCadClasFisXImpostoMT.CmeCadastroAtualizaBotoes(
  Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := Not bbtnConfirmar.Enabled;
end;

procedure TFrmCadClasFisXImpostoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
     CmbClasFisclifor.LookupValue := MontaSelect.ValoresChave[0];
     montagrid;
  End;
end;

procedure TFrmCadClasFisXImpostoMT.FormCreate(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'P' then
  begin
    HelpContext           := 30068;
    bbtnAjuda.HelpContext := 30068;
  end
  else
  begin
    HelpContext           := 40076;
    bbtnAjuda.HelpContext := 40076;
  end;
  CtrlClasfisclifor    := TCtrlClasfisclifor.create;
  CtrlClasfisxtipoagre := TCtrlClasfisxtipoagre.create;

  CtrlClasfisclifor := TCtrlClasfisclifor.Create;
  CtrlClasfisclifor.Initialize(DtmBaseDados.dbBaseDados,false,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsCalass.data := CtrlClasfisclifor.ListClasfisclifor(0);

  CtrlClasfisxtipoagre := TCtrlClasfisxtipoagre.Create;
  CtrlClasfisxtipoagre.Initialize( DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlClasfisxtipoagre.cds := cds;
end;

procedure TFrmCadClasFisXImpostoMT.BtnIncluiDesembClick(Sender: TObject);
begin
  inherited;
  If Not CdsImpAgreg.IsEmpty Then InsereDirEsq;
end;

procedure TFrmCadClasFisXImpostoMT.BtnIncluiTodosDesembClick(
  Sender: TObject);
begin
  inherited;
  If Not CdsImpAgreg.IsEmpty Then
  Begin
    CdsImpAgreg.First;
    While Not CdsImpAgreg.Eof Do
          InsereDirEsq;
  End;
end;

procedure TFrmCadClasFisXImpostoMT.BtnExcluiAllDesembAssocClick(
  Sender: TObject);
begin
  inherited;
  If Not Cds.IsEmpty Then
  Begin
    Cds.First;
    While Not Cds.Eof Do
          InsereEsqDir;
  End;

end;

procedure TFrmCadClasFisXImpostoMT.BtnExcluiDesembAssocClick(
  Sender: TObject);
begin
  inherited;
  If Not Cds.IsEmpty Then InsereEsqDir;
end;

procedure TFrmCadClasFisXImpostoMT.InsereDirEsq;
Begin
   Cds.Append;
   Cds.FieldByName('DESCCUSTAGREG').value       := CdsImpAgreg.FieldByName('DESCCUSTAGREG').value;
   Cds.FieldByName('CODTIPOCUSTAGREG').value    := CdsImpAgreg.FieldByName('CODTIPOCUSTAGREG').value;
   Cds.FieldByName('IDCLASFISCLIFOR').AsInteger := CdsCalass.fieldbyname('IDCLASFISCLIFOR').value;
   Cds.FieldByName('RECPAG').AsString           := ParamIntegra.RecPag;
   Cds.Post;
   CdsImpAgreg.Delete;
   CmbClasFisclifor.Enabled := false;
end;

procedure TFrmCadClasFisXImpostoMT.InsereEsqDir;
Begin
   CdsImpAgreg.Append;
   CdsImpAgreg.FieldByName('DESCCUSTAGREG').value    := Cds.FieldByName('DESCCUSTAGREG').value;
   CdsImpAgreg.FieldByName('CODTIPOCUSTAGREG').value := Cds.FieldByName('CODTIPOCUSTAGREG').value;
   CdsImpAgreg.Post;
   Cds.Delete;
   CmbClasFisclifor.Enabled := false;
end;

procedure TFrmCadClasFisXImpostoMT.CmbClasFiscliforCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
montagrid;
end;

procedure TFrmCadClasFisXImpostoMT.montagrid;
begin
  inherited;
  if trim(CmbClasFisclifor.Lookupvalue) <> '' then
  begin
    Cds.data            := CtrlClasfisxtipoagre.ListClasfisxtipoagre(ParamIntegra.RecPag,CdsCalass.fieldbyname('idclasfisclifor').value) ;
    CdsImpAgreg.data    := CtrlClasfisxtipoagre.ListImpostosAgregados(ParamIntegra.RecPag,CdsCalass.fieldbyname('idclasfisclifor').value,
                                        FuncaoGeral.Decode(ParamIntegra.RecPag,'R','8','A'),
                                        FuncaoGeral.Decode(ParamIntegra.RecPag,'R','A','8') );
    CdsImpAgreg.open;
    Cds.open;
  end;
end;

procedure TFrmCadClasFisXImpostoMT.CmeCadastroEdit(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;
end;

procedure TFrmCadClasFisXImpostoMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
CmbClasFisclifor.Enabled := true;
if not CtrlClasfisxtipoagre.GravarClasfisxtipoagre(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario) then
   MsgDlg(CtrlClasfisxtipoagre.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmCadClasFisXImpostoMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
CmbClasFisclifor.Enabled := true;
montagrid;
end;

procedure TFrmCadClasFisXImpostoMT.CmeCadastroConfirma(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;

end;

procedure TFrmCadClasFisXImpostoMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;

end;

procedure TFrmCadClasFisXImpostoMT.CmeCadastroCancel(Sender: TObject);
begin
// Coloquei Como Commentario para ignorar o CmCadastro
//  inherited;

end;

end.
