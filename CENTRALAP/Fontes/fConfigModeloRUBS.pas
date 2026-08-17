unit fConfigModeloRUBS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FConfigRelatorio, ppCache, ppClass, ppBands, ppProd, ppReport, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Menus, ppComm, ppEndUsr, CmEventosCadastro,
  ImgList, Wwdatsrc, MontaSelect, DBTables, IvDictio, IvMulti, IvEMulti,
  Wwquery, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, StdCtrls, Buttons, Mask,
  wwdbedit, wwdblook, CMDBLookupCombo, ExtCtrls;

type
  TfrmConfigModeloRUBS = class(TFrmConfigRelatorio)
    QryCamposRub: TwwQuery;
    qryConfigRubs: TwwQuery;
    UpdConfigRubs: TUpdateSQL;
    qryConfigRubsIDCONFIGRUBS: TFloatField;
    qryConfigRubsDESCRUB: TStringField;
    qryConfigRubsIDREPORTS: TFloatField;
    qryConfigRubsORIGEMCM: TFloatField;
    qryIDCARTACOBRANCA: TFloatField;
    qryMODELOCARTA: TStringField;
    qryIDREPORTS: TFloatField;
    qryORIGEMCM: TFloatField;
    qryFLGTIPOCARTA: TStringField;
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
  private
    { Private declarations }
    sqlAux : string;
  public
    { Public declarations }
    bAplicaAlteracoesRubs :Boolean;
    procedure InsereQryPrincipal; Override;
    Procedure AbreQueryDados; Override;
    Procedure HabilitaImpressao(bImprime:Boolean); Override;
  end;

var
  frmConfigModeloRUBS: TfrmConfigModeloRUBS;

implementation
Uses uMensErro, uSistema, uDataBase, uRubs, datend;
{$R *.DFM}


procedure TfrmConfigModeloRUBS.InsereQryPrincipal;
Begin
  QryIdCartaCobranca.AsFloat := LeUltRegistro(nil,'CARTACOBRANCA');
  QryIDREPORTS.AsInteger     := LeUltRegistro(nil,'REPORTS');
  QryORIGEMCM.AsInteger      := 0;
  QryFLGTIPOCARTA.AsString   := 'Z';
  QryMODELOCARTA.asString    := QryConfigRubsDESCRUB.asString;
  QryConfigRubs.Edit;
  QryConfigRubsIDREPORTS.asInteger := QryIDREPORTS.AsInteger;
End;


procedure TfrmConfigModeloRUBS.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  if MontaSelect.RetornouValor then
  begin
    qry.Close;
    qry.ParamByName('IDREPORTS').asInteger := strToIntDef(MontaSelect.ValoresChave[2], 0);
    qry.Open;

    qryConfigRubs.Close;
    qryConfigRubs.ParamByName('IDCONFIGRUBS').asInteger := strToIntDef(MontaSelect.ValoresChave[0], 0);
    qryConfigRubs.Open;
    qry.Insert;

    qryCamposRUB.Close;
    qryCamposRUB.paramByName('IDCONFIGRUBS').asInteger:= strToIntDef(MontaSelect.ValoresChave[0], 0);
    qryCamposRUB.Open;

    qryDados.close;
    qryCamposRUB.First;
  end;
end;


procedure TfrmConfigModeloRUBS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
end;

procedure TfrmConfigModeloRUBS.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If DeRelatorio.CanFocus Then DeRelatorio.SetFocus;
end;

Procedure TfrmConfigModeloRUBS.AbreQueryDados;
var sSql : string;
begin
  sSql := '';
  while not qryCamposRUB.Eof do
  begin
    sSql := Ssql + qryCamposRUB.FieldByName('CAMPODETALHE').asString + ',';
    qryCamposRUB.Next;
  end;
  sSql[length(sSql)] := ' ';

  qryDados.Close;
  qryDados.SQL.text := 'SELECT ' + sSql + ' FROM ( '+ sqlAux + ' )';
  qryDados.Open;
end;

Procedure TfrmConfigModeloRUBS.HabilitaImpressao(bImprime:Boolean);
begin

end;


procedure TfrmConfigModeloRUBS.FormCreate(Sender: TObject);
begin
  inherited;
  sqlAux := qryDados.sql.text;
end;

procedure TfrmConfigModeloRUBS.sbtnInserirClick(Sender: TObject);
begin
  sbtnProcurarClick(sender);
  inherited;

end;

end.
