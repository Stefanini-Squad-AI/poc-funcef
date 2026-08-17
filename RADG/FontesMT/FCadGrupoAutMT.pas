// andre tavares - pendencia 17624 - 10/05/2005 - crítica de dados do detalhe para não deixar inserir
// registros com campos de filtragem diferents.
// André Tavares - pendência 17624 - 09/11/2004 - criado o relacionamento com a tabela TipoDocRecPag
unit FCadGrupoAutMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, Mask, wwdbedit, DBCtrls,
  DBCtrls2, DBTables, ComCtrls, FCadastroMestreDetMT, Grids,
  Wwdbigrd, Wwdbgrid, TabControlDetalhe, wwdbdatetimepicker,
  CMDateTimePicker,uCMTypes, CMDBLookupCombo, Wwdotdot, Wwdbcomb,
  uCtrlGrupoRespon, uCtrlGrupoAut, uCtrlCentroCusto, uCtrlMoeda,
  uCtrlCentRespon, uCtrlUnidNegocio, uCmSqlParams, Wwquery, jclMath;
type
  // início - andre tavares - pendência 17264 - 09/05/2005 -
  // este record servirá para não permitir que o usuário insira valores
  // diferentes para estes campos nos demais registros do detalhe.
  TCamposGrpResp = record
                     CODCENTRORESPON : string;
                     UNIDNEGOC       : integer;
                     VLRINICIAL      : double;
                     VLRFINAL        : double;
                     CODTIPDOC       : integer;
                     CODCENTROCUSTO  : string;
                     CODGRUPOPROD    : string;
                     MOECODIGO       : integer;
                   end; //record
  // fim - andre tavares - pendência 17264 - 09/05/2005

  TfrmCadGrupoAutMT = class(TFrmCadastroMestreDetMT)
    cdsDet: TCMClientDataSet;
    cdsGrupoProd: TCMClientDataSet;
    cdsMoeda: TCMClientDataSet;
    cdsGrupoRespon: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsCentroRespon: TCMClientDataSet;
    cdsAtivProj: TCMClientDataSet;
    Label1: TLabel;
    edDesc: TDBEdit;
    Label2: TLabel;
    dblcGrpResp: TCMDBLookupCombo;
    Label4: TLabel;
    dblcCentCust: TCMDBLookupCombo;
    Label6: TLabel;
    dblcCentResp: TCMDBLookupCombo;
    Label7: TLabel;
    dblcGrpProd: TCMDBLookupCombo;
    Label8: TLabel;
    dblcUnNegoc: TCMDBLookupCombo;
    Label13: TLabel;
    dbreNumAuto: TDBRealEdit;
    Label9: TLabel;
    edSeqAut: TDBRealEdit;
    Label5: TLabel;
    edValor: TDBRealEdit;
    Label10: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label11: TLabel;
    dblcMoeda: TCMDBLookupCombo;
    Label12: TLabel;
    sqlGrupoProd: TCMSqlParams;
    Label3: TLabel;
    sqlTipoDocRecPag: TCMSqlParams;
    cdsTipoDocRecPag: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    CMDBLookupCombo1: TCMDBLookupCombo;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormActivate(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure cdsDetAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    _GrupoRespon   : TCtrlGrupoRespon;
    _CentroCusto   : TCtrlCentroCusto;
    _CentRespon    : TCtrlCentRespon;
    _UnidNegocio   : TCtrlUnidNegocio;
    _Moeda         : TCtrlMoeda;
    _GrupoAut      : TCtrlGrupoAut;
    procedure SelecionaDet(idGrupoAut: Double);
  public
    { Public declarations }
  end;

var
  frmCadGrupoAutMT: TfrmCadGrupoAutMT;
  CamposGrpResp : TCamposGrpResp; // andre tavares - pendência 17264 - 09/05/2005

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmCadGrupoAutMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept := False;
   if trim(edDesc.Text)='' then begin
      MsgDlg('Obrigatório preencher a Descrição do Grupo de Autorização','Erro',mtError,[mbOk],0);
      edDesc.SetFocus;
      exit;
   end;
   Accept := True;
end;

procedure TfrmCadGrupoAutMT.FormCreate(Sender: TObject);
begin
  inherited;
  // inicio - andre tavares - pendencia 17624 - 09/05/2005
  CamposGrpResp.CODCENTRORESPON := '';
  CamposGrpResp.UNIDNEGOC       := 0;
  CamposGrpResp.VLRINICIAL      := 0;
  CamposGrpResp.VLRFINAL        := 0;
  CamposGrpResp.CODTIPDOC       := 0;
  CamposGrpResp.CODCENTROCUSTO  := '';
  CamposGrpResp.CODGRUPOPROD    := '';
  CamposGrpResp.MOECODIGO       := 0;
  // fim - andre tavares - pendencia 17624 - 09/05/2005


  sqlTipoDocRecPag.Open; // André Tavares - pendência 17624 - 09/11/2004

  _GrupoRespon := TCtrlGrupoRespon.Create;
  _GrupoRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _GrupoAut := TCtrlGrupoAut.Create;
  _GrupoAut.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _CentroCusto := TCtrlCentroCusto.Create;
  _CentroCusto.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _CentRespon := TCtrlCentRespon.Create;
  _CentRespon.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _Moeda      := TCtrlMoeda.Create;
  _Moeda.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  _UnidNegocio := TCtrlUnidNegocio.Create;
  _UnidNegocio.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _GrupoAut.CdsGrupoAut   := cds;
  _GrupoAut.CdsAutXRespon := cdsDet;
  
  cds.Data := _GrupoAut.Procurar(-1);
  SelecionaDet(-1);
  
end;

procedure TfrmCadGrupoAutMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GrupoRespon.Free;
  _GrupoAut.Free;
  _CentroCusto.Free;
  _CentRespon.Free;
  _UnidNegocio.Free;
  _Moeda.Free;
end;

procedure TfrmCadGrupoAutMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
  SelecionaDet(-1);
end;

procedure TfrmCadGrupoAutMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TfrmCadGrupoAutMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := _GrupoAut.Procurar(StrTointDef(MontaSelect.ValoresChave[0],0));
     SelecionaDet(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;
end;

procedure TfrmCadGrupoAutMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrupoAut.AplicaOperacao(opApagar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrupoAutMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrupoAut.AplicaOperacao(opAlterar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrupoAutMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrupoAut.AplicaOperacao(opInserir,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrupoAutMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _GrupoAut.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _GrupoAut.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadGrupoAutMT.FormActivate(Sender: TObject);
begin
  inherited;
  cdsCentroCusto.Data  := _CentroCusto.ListaCentCustCompleto(0,Sistema.idEmpresa,0,'',tccAmbos,toccCodigo);
  cdsCentroRespon.Data := _CentRespon.ListaCentRespon(Sistema.IdEmpresa);
  cdsAtivProj.Data     := _UnidNegocio.ListaUnidNegocio(Sistema.idEmpresa,0,'',tapAmbos,toapCodigo);
  cdsGrupoRespon.Data  := _GrupoRespon.ListaGrupoRespon;
  cdsMoeda.Data        := _Moeda.ListaMoeda;
  
  sqlGrupoProd.Prepare;
  sqlGrupoProd.Open;
  
end;

procedure TfrmCadGrupoAutMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  cds.Data := _GrupoAut.Procurar(cds.FieldByName('IDGRUPOAUTORIZA').AsFloat);
  SelecionaDet(cds.FieldByName('IDGRUPOAUTORIZA').AsFloat);
end;

procedure TfrmCadGrupoAutMT.SelecionaDet(idGrupoAut: Double);
begin
  cdsDet.Data := _GrupoAut.ProcurarAutxRespon(idGrupoAut,Sistema.IdEmpresa);
  // inicio - andre tavares - pendencia 17624 - 09/05/2005
  cdsDet.First;
  CamposGrpResp.CODCENTRORESPON := cdsdet.fieldByName('CODCENTRORESPON').asString;
  CamposGrpResp.UNIDNEGOC       := cdsdet.fieldByName('UNIDNEGOC').asInteger;
  CamposGrpResp.VLRINICIAL      := cdsdet.fieldByName('VLRINICIAL').asFloat;
  CamposGrpResp.VLRFINAL        := cdsdet.fieldByName('VLRFINAL').asFloat;
  CamposGrpResp.CODTIPDOC       := cdsdet.fieldByName('CODTIPDOC').asInteger;
  CamposGrpResp.CODCENTROCUSTO  := cdsdet.fieldByName('CODCENTROCUSTO').asString;
  CamposGrpResp.CODGRUPOPROD    := cdsdet.fieldByName('CODGRUPOPROD').asString;
  CamposGrpResp.MOECODIGO       := cdsdet.fieldByName('MOECODIGO').asInteger;
  // fim - andre tavares - pendencia 17624 - 09/05/2005
end;

procedure TfrmCadGrupoAutMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  if (pgctrlDetalhe.ActivePage.PageIndex = 0) then begin
     dblcGrpResp.SetFocus;
     cdsDet.FieldByName('NUMAUTORIZACAO').asInteger := 1;
  end;
end;

procedure TfrmCadGrupoAutMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if (pgctrlDetalhe.ActivePage.PageIndex = 0) then begin
     dblcGrpResp.SetFocus;
  end;
end;

procedure TfrmCadGrupoAutMT.bbtnOkDetClick(Sender: TObject);
begin
   //Somente porque o BeforeConfirmaDetalhe não está funcionando.
   if (cds.State in ([dsInsert,dsEdit])) then begin
      if (pgctrlDetalhe.ActivePage.PageIndex = 0) and ((sbtnInsDet.Down) or (sbtnAltDet.Down)) then begin
         if (trim(dblcGrpResp.Text) = '') then begin
            MsgDlg('Obrigatório preencher o Grupo de Responsabilidade','Erro',mtError,[mbOk],0);
            dblcGrpResp.setfocus;
            exit;
         end;
         If dbreNumAuto.Value < 1 Then begin
            MsgDlg('É obrigatório indicar pelo menos uma autorização','Erro',mtError,[mbOK],0);
            dbreNumAuto.SetFocus;
            Exit;
         End;
         cdsDet.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
         if trim(dblcCentCust.Text) = '' then
            cdsDet.FieldByName('IDEMPRESA').Clear
         else
            cdsDet.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;
         cdsDet.FieldByName('NOME').AsString := dblcCentCust.Text;
         cdsDet.FieldByName('DESCGRUPOPROD').AsString := dblcGrpProd.Text;
         cdsDet.FieldByName('DESCCENTRESP').AsString := dblcCentResp.Text;
         cdsDet.FieldByName('DESCUNIDNEG').AsString := dblcUnNegoc.Text;
         cdsDet.FieldByName('DESCGRPRESPON').AsString := dblcGrpResp.Text;
      end;

   end;

// inicio - andre tavares - pendencia 17624 - 09/05/2005

  if (not cdsDet.recordCount in [0, 1]) or ((cdsDet.state = dsInsert) and (cdsDet.recordCount = 1)) then
  begin
    cdsDet.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
    if trim(CamposGrpResp.CODCENTRORESPON) <> trim(dblcCentResp.LookupValue) then
    begin
      MsgDlg('O Centro de Responsabilidade tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      dblcCentResp.SetFocus;
      Exit;
    end;
    if CamposGrpResp.UNIDNEGOC <> strToIntDef(trim(dblcUnNegoc.lookupValue), 0) then
    begin
      MsgDlg('A Atividade/Projeto tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      dblcUnNegoc.SetFocus;
      Exit;
    end;
    if not floatsEqual(CamposGrpResp.VLRINICIAL, edValor.value) then
    begin
      MsgDlg('O Valor Inicial tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      edValor.SetFocus;
      Exit;
    end;
    if not floatsEqual(CamposGrpResp.VLRFINAL, DBRealEdit1.value) then
    begin
      MsgDlg('O Valor Final tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      DBRealEdit1.SetFocus;
      Exit;
    end;
    if CamposGrpResp.CODTIPDOC <> strToIntDef(CMDBLookupCombo1.lookupValue, 0) then
    begin
      MsgDlg('O Tipo de Documento tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      CMDBLookupCombo1.SetFocus;
      Exit;
    end;
    if trim(CamposGrpResp.CODCENTROCUSTO) <> trim(dblcCentCust.lookupValue) then
    begin
      MsgDlg('O Centro de Custo tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      dblcCentCust.SetFocus;
      Exit;
    end;
    if trim(CamposGrpResp.CODGRUPOPROD) <> trim(dblcGrpProd.lookupValue) then
    begin
      MsgDlg('O Grupo de Produto tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      dblcGrpProd.SetFocus;
      Exit;
    end;
    if CamposGrpResp.MOECODIGO <> strToIntDef(trim(dblcMoeda.lookupValue), 0) then
    begin
      MsgDlg('A Moeda tem que ser igual para todos os grupos de autorização','Erro',mtError,[mbOK],0);
      dblcMoeda.SetFocus;
      Exit;
    end;
  end;
// fim - andre tavares - pendencia 17624 - 09/05/2005


  inherited;

end;

procedure TfrmCadGrupoAutMT.cdsDetAfterPost(DataSet: TDataSet);
begin
  inherited;
  // inicio - andre tavares - pendencia 17624 - 09/05/2005
  if (cdsDet.recordCount = 1) then
  begin
    CamposGrpResp.CODCENTRORESPON := cdsdet.fieldByName('CODCENTRORESPON').asString;
    CamposGrpResp.UNIDNEGOC       := cdsdet.fieldByName('UNIDNEGOC').asInteger;
    CamposGrpResp.VLRINICIAL      := cdsdet.fieldByName('VLRINICIAL').asFloat;
    CamposGrpResp.VLRFINAL        := cdsdet.fieldByName('VLRFINAL').asFloat;
    CamposGrpResp.CODTIPDOC       := cdsdet.fieldByName('CODTIPDOC').asInteger;
    CamposGrpResp.CODCENTROCUSTO  := cdsdet.fieldByName('CODCENTROCUSTO').asString;
    CamposGrpResp.CODGRUPOPROD    := cdsdet.fieldByName('CODGRUPOPROD').asString;
    CamposGrpResp.MOECODIGO       := cdsdet.fieldByName('MOECODIGO').asInteger;
  end;
  // fim - andre tavares - pendencia 17624 - 09/05/2005
end;



end.

