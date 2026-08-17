unit fExecDecrescimoNovo;

{-------------------------------------------------------------------------------
//Rotina......: btnContinuarLancClick
//Nº SOL......: SIG 100808
//Data........: 06/07/2020
//Responsável.: Edilaine
//Descrição...: Não deixa fazer lançamentos com data igual da aquisição
//------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 172902/8222
Nº KINTANA..: 1577546
Data........: 28/03/2012
Responsável.: Wylliam Leite da Silva
Descrição...: Não deixar fazer lançamentos com Período contabil Bloqueado
-------------------------------------------------------------------------------}
interface

uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
     TB97Tlbr, TB97, ExtCtrls, ComCtrls, mImovelouMestre, TEdNum, TREdit,
     Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, CMDateTimePicker,
     wwdblook, fcButton, fcImgBtn, fcShapeBtn, fcLabel, Mask, DBCtrls,
     wwdbedit, Wwdbspin, Db, DBTables, Wwquery, UMensErro, Wwdatsrc,
     mClasseBem, mLocalizacao, mFornecedor, uCMClientDataSet,
     uCtrlMovAcrescimoValor, uCtrlBem, uCtrlDomBem,
     // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
     uCtrlContab;

type
  TfrmExecDecrescimoNovo = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    Bevel2: TBevel;
    Label1: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label14: TLabel;
    btnContinuaSelecao: TfcShapeBtn;
    btnAtualizar: TfcShapeBtn;
    DBcboTipoImovel: TwwDBLookupCombo;
    DBcboGrupo: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    Label52: TLabel;
    molLocalizacao1: TmolLocalizacao;
    molClasseBem1: TmolClasseBem;
    DBcboSituacao: TwwDBLookupCombo;
    meObsEvento: TMemo;
    edtVlrOper: TRealEdit;
    edtDataLanc: TCMDateTimePicker;
    dbCboBem: TwwDBLookupCombo;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel5: TBevel;
    btnVoltar: TfcShapeBtn;
    Panel3: TPanel;
    btnTotaliza: TfcShapeBtn;
    btnInsert: TfcShapeBtn;
    btnExclui: TfcShapeBtn;
    btnContinuarLanc: TfcShapeBtn;
    Panel1: TPanel;
    Label4: TLabel;
    edtTotalLanc: TRealEdit;
    OME: TwwDBGrid;
    edtTotalDecrescimo: TRealEdit;
    edtTotalBens: TRealEdit;
    Bevel1: TBevel;
    Label22: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    fcShapeBtn1: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    DBcboTipoRecDes: TwwDBLookupCombo;
    edtNumDocumento: TEdit;
    DBcboFormaRecPag: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    lblDataVencimento: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    edtDataLancamento: TCMDateTimePicker;
    edtDataVenc: TCMDateTimePicker;
    DBspnAno: TwwDBSpinEdit;
    edtVlrTotal: TRealEdit;
    cboMes: TComboBox;
    edtReferenciaAP: TEdit;
    DBcboCentroCusto: TwwDBLookupCombo;
    memObs: TMemo;
    fcShapeBtn5: TfcShapeBtn;
    updBens: TUpdateSQL;
    dsBens: TwwDataSource;
    qryLookBem: TwwQuery;
    qryLookBemIXBGRUPO: TStringField;
    qryLookBemPLACA: TFloatField;
    qryLookBemIDBEM: TFloatField;
    qryLookBemIDCONJUNTO: TFloatField;
    qryLookGrupoXImovel: TwwQuery;
    qryLookGrupoXImovelIDIMOVEL: TFloatField;
    qryLookGrupoXImovelGXIPERCENTRATEIO: TFloatField;
    qryLookGrupoXImovelIMOVEL_EXTENSO: TStringField;
    qryLookGrupoXImovelNOME_MESTRE: TStringField;
    qryGrupo: TwwQuery;
    qryGrupoNOME: TStringField;
    qryGrupoCLASSE: TStringField;
    qryGrupoIDGRUPO: TFloatField;
    qryGrupoFLGSEMPLACA: TFloatField;
    qryGrupoDEPRECIACAO: TFloatField;
    qryGrupoNOMECLASSE: TStringField;
    qryTipoImovel: TwwQuery;
    qryTipoImovelIDGRUPORATEIO: TFloatField;
    qryTipoImovelCODTIPIMOVEL: TStringField;
    qryTipoImovelCOUNT: TFloatField;
    qryBens: TwwQuery;
    qryBensNUM_MOVIMENTACAO: TFloatField;
    qryBensIMOVEL_EXTENSO: TStringField;
    qryBensIXBGRUPO: TStringField;
    qryBensNOME_BEM: TStringField;
    qryBensPLACA: TFloatField;
    qryBensVALOR: TFloatField;
    qryBensIDIMOVEL: TFloatField;
    qryBensIDBEM: TFloatField;
    qryBensNOME_MESTRE: TStringField;
    qryBensSLD_BEM: TFloatField;
    qryBensDSC_MOVIMENTACAO: TStringField;
    qryUpdImovel: TwwQuery;
    molFornecedor1: TmolFornecedor;
    QryVerificaMovimentacao: TwwQuery;
    procedure DBcboGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoImovelCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnContinuaSelecaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure btnTotalizaClick(Sender: TObject);
    procedure btnExcluiClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnContinuarLancClick(Sender: TObject);
    procedure fcShapeBtn1Click(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure fcShapeBtn5Click(Sender: TObject);
    procedure ntbPrincipalPageChanged(Sender: TObject);
  private
    { Private declarations }
    iDocumento : integer;
    iGrupoImoAnt, iGrupoBemAnt : integer;
    sTipoImoAnt : String;

    CtrlMovAcrescimoValor : TCtrlMovAcrescimoValor;
    CtrlBem               : TCtrlBem;
    CtrlDomBem            : TCtrlDomBem;
    CtrlContab  : TCtrlContab; // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    procedure AbreQueryGrupo;
    procedure AbreQueries;
    procedure AbreQueriesGR;
    procedure FechaQueriesGR;
    procedure FechaQueries;
    function VerificaPreenchimentoOper : boolean;
    procedure CalculaRateio;
    function RateiaValoresBens: boolean;
    function ConfereTotalBens : boolean;
    function VerificaPreenchimentoGR : boolean;
    function CadastraCAF: Boolean;
    function EntradaCAF(const iIdLancImovel: integer): Boolean;
    function AcrescimoCAF(const iIdLancImovel: integer): Boolean;
  public
    { Public declarations }
  end;

var frmExecDecrescimoNovo: TfrmExecDecrescimoNovo;

implementation
uses uDataBase, dLookImobiliario, uFuncoesImob, dImobiliario, uComunsImobiliario,
     uVerificaPreenchimento, uMolduras, uSistema, DCAF, uCAF, dLancImovel,
     uDiasInUteis, uDocumento, dMS, uModuloInvestImob, uModuloImobiliario,
     uEventoImovel, dBaseDados;

{$R *.DFM}

procedure TfrmExecDecrescimoNovo.AbreQueries;
begin
  dtmLookImobiliario.qryLookTipoImovel.Open;

  LimpaParametros(dtmLookImobiliario.qryLookGrupoRateio);
  dtmLookImobiliario.qryLookGrupoRateio.ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
  dtmLookImobiliario.qryLookGrupoRateio.Open;

  // SITUACAO
  dtmLookImobiliario.qryLookSituacao.Open;
  DBcboSituacao.LookupValue := inttostr(ModuloImobiliario.InvestImob.iIdSituacao);

  AbreQueryGrupo;
end;

procedure TfrmExecDecrescimoNovo.AbreQueryGrupo;
var
  sParametro, sSQL: String;
begin
  sParametro := '';
  if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull then
    sParametro := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOAR.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOUTILITARIO.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMAQUINA.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsString + ',';
  if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMOVEL.IsNull then
    sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMOVEL.AsString + ',';
  if sParametro = '' then
    sParametro := '-1'  // PARA ABRIR A QUERY EM BRANCO
  else
    sParametro := copy(sParametro,1,Length(sParametro)-1);

  sSql := 'SELECT '+ #13+
          '   G.IDGRUPO, G.NOME, G.CLASSE, C.DESCRICAO AS NOMECLASSE, G.FLGSEMPLACA, G.DEPRECIACAO ' + #13 +
          'FROM ' + #13 +
          '   GRUPO G, CLASSEDEBEM C ' + #13 +
          'WHERE  ( G.CLASSE = C.CODHIERARQ(+) ) ' + #13 +
          '   AND ( G.FLGIMOVEL = 1 ) ' + #13 +
          '   AND ( TIPO = ''A'' ) ' + #13 +
          '   AND ( G.IDGRUPO IN (' + sParametro + ') ) ' + #13 +
          'ORDER BY ' + #13 +
          '   G.NOME, G.CLASSE';
  qryGrupo.SQL.Clear;
  qryGrupo.SQL.Add(sSql);
  qryGrupo.Open;
end;

procedure TfrmExecDecrescimoNovo.DBcboGrupoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  LimpaParametros(qryTipoImovel);
  qryTipoImovel.ParamByName('PIDGRUPORATEIO').AsInteger := StrToIntDef(DBcboGrupo.LookupValue,-1);
  qryTipoImovel.Open;

  if qryTipoImovel.RecordCount > 1 then
  begin
    MsgDlg('Atenção, este grupo de lançamentos possui imóveis com tipos diferentes, Escolha outro!', 'Aviso',mtWarning, [mbok], 0);
    DBcboGrupo.Clear;
  end
  else
  begin
    DBcboTipoImovel.LookupValue := qryTipoImovelCODTIPIMOVEL.AsString;
    AbreQueryGrupo;
  end;
end;

procedure TfrmExecDecrescimoNovo.DBcboTipoImovelCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  DBcboGrupo.Clear;
  AbreQueryGrupo;
end;

procedure TfrmExecDecrescimoNovo.FechaQueries;
begin
  dtmLookImobiliario.qryLookTipoImovel.Close;
  dtmLookImobiliario.qryLookGrupoRateio.Close;
  dtmLookImobiliario.qryLookSituacao.Close;
  qryGrupo.Close;
end;

procedure TfrmExecDecrescimoNovo.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  FechaQueries;
  AbreQueries; 
end;

function TfrmExecDecrescimoNovo.VerificaPreenchimentoOper: boolean;
begin
  Result := False;
  try
    if DBcboTipoImovel.LookupValue = '' then
      raise EValidacao.CreateVal('É necessário indicar o Tipo do Imóvel!', DBcboTipoImovel);
    if DBcboBem.LookupValue = '' then
      raise EValidacao.CreateVal('É necessário indicar o Bem do Imóvel!', DBcboBem);
    if edtDataLanc.Date <= 0 then
      raise EValidacao.CreateVal('É necessário indicar a Data da Operação!', edtDataLanc);

    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
    if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataLanc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataLanc);
    // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546

    if edtVlrOper.Value = 0 then
      raise EValidacao.CreateVal('É necessário indicar o Valor da Operação!', edtVlrOper);
    if molLocalizacao1.edtLocalizacao.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar a Localização para o CAF!', molLocalizacao1.btnBuscaLocalizacao);
    if molClasseBem1.edtClasseBem.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar a Classe do Bem para o CAF!', molClasseBem1.btnBuscaClasseBem);
    if DBcboSituacao.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar a Situação do Bem para o CAF!', DBcboSituacao);
    if meObsEvento.Text = '' then
      raise EValidacao.CreateVal('É necessário indicar a Observação do Evento / CAF!', meObsEvento);
  except
    on ev : EValidacao do
    begin
      if ev.Show then
        MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      if ev.Control.CanFocus then
        ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

procedure TfrmExecDecrescimoNovo.btnContinuaSelecaoClick(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimentoOper then
  begin
    CalculaRateio;
    edtTotalDecrescimo.Value := edtVlrOper.Value;
    ntbPrincipal.PageIndex   := ntbPrincipal.PageIndex + 1;
  end;
end;

procedure TfrmExecDecrescimoNovo.CalculaRateio;
var
  sGrupoContabil: rGrupoBem;
  fTotGrupo, fBem: Extended;
begin
  if ( sTipoImoAnt  <> dtmLookImobiliario.qryLookTipoImovelCODTIPIMOVEL.AsString) or
      (iGrupoImoAnt <> dtmLookImobiliario.qryLookGrupoRateioIDGRUPORATEIO.AsInteger) or
      (iGrupoBemAnt <> qryGrupoIDGRUPO.AsInteger) then
  begin
    qryBens.Close;
    qryBens.Open;
  end;

  if DBcboGrupo.Text = '' then
    Exit;

  // define o grupo contábil
  sGrupoContabil := CAF.GrupoImobiliario(StrToIntDef(dbCboBem.LookupValue,-1), '');

  LimpaParametros(qryLookGrupoXImovel);
  qryLookGrupoXImovel.ParamByName('PIDGRUPORATEIO').AsInteger := StrToIntDef(DBcboGrupo.LookupValue, - 1);
  qryLookGrupoXImovel.Open;

  fTotGrupo := 0;
  qryLookGrupoXImovel.First;
  while not qryLookGrupoXImovel.Eof do
  begin
    qryBens.Append;
    qryBensIMOVEL_EXTENSO.AsString := qryLookGrupoXImovelIMOVEL_EXTENSO.AsString;
    qryBensNOME_MESTRE.AsString    := qryLookGrupoXImovelNOME_MESTRE.AsString;
    qryBensIDIMOVEL.AsInteger      := qryLookGrupoXImovelIDIMOVEL.AsInteger;
    qryBensIXBGRUPO.AsString       := sGrupoContabil.sTipoGrupo;
    qryBensNOME_BEM.AsString       := sGrupoContabil.sDescricao;

    //procurar se ja existe bem cadastrado
    LimpaParametros(qryLookBem);
    qryLookBem.ParamByName('PIDIMOVEL').AsInteger := qryLookGrupoXImovelIDIMOVEL.AsInteger;
    qryLookBem.ParamByName('PIXBGRUPO').AsString  := sGrupoContabil.sTipoGrupo;
    qryLookBem.Open;

    if qryLookBem.IsEmpty then   // não encontrei o bem cadastrado -- entrata com controle total
    begin
      qryBensNUM_MOVIMENTACAO.AsInteger := 1;
      qryBensDSC_MOVIMENTACAO.AsString  := 'Novo';
      qryBensPLACA.AsInteger := -1;
    end
    else
    begin                     // bem ja cadastrado anteriormente -- acrescimo de valor
      qryBensNUM_MOVIMENTACAO.AsInteger := 95;
      qryBensDSC_MOVIMENTACAO.AsString  := 'Decres';
      qryBensIDBEM.AsInteger := qryLookBemIDBEM.AsInteger;
      if not qryBensPLACA.IsNull then
        qryBensPLACA.AsInteger := qryLookBemPLACA.AsInteger;
    end;
    fBem := Arredonda(edtVlrOper.Value * qryLookGrupoXImovelGXIPERCENTRATEIO.AsFloat / 100, 2);
    fTotGrupo := fTotGrupo + fBem;
    qryBensVALOR.AsFloat := fBem;

    qryBens.Post;
    qryLookGrupoXImovel.Next;
  end;

  // acerta diferença do grupo
  if fTotGrupo <> edtVlrOper.Value then
  begin
    qryBens.Edit;
    qryBensVALOR.AsFloat := qryBensVALOR.AsFloat - (fTotGrupo - edtVlrOper.Value);
    qryBens.Post;
  end;
end;

procedure TfrmExecDecrescimoNovo.FormCreate(Sender: TObject);
begin
  inherited;
  // Inicializa os CtrlObjects dos objetos a serem utilizados
  CtrlBem    := TCtrlBem.Create;
  CtrlDomBem := TCtrlDomBem.Create;
  CtrlMovAcrescimoValor := TCtrlMovAcrescimoValor.Create;
  CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlDomBem.InitializeAs( CtrlBem );
  CtrlMovAcrescimoValor.InitializeAs( CtrlBem );

  ntbPrincipal.PageIndex := 0;
  sTipoImoAnt  := 'xx';
  iGrupoImoAnt := -1;
  iGrupoBemAnt := -1;

  if ModuloImobiliario.InvestImob.iIdLocalizacao > 0 then
  begin
     molLocalizacao1.iPessoaLoc   := ModuloImobiliario.InvestImob.iIdPessoaLocalizacao;
     molLocalizacao1.iLocalizacao := ModuloImobiliario.InvestImob.iIdLocalizacao;
     AtribuiMolLocalizacao(molLocalizacao1.iLocalizacao, molLocalizacao1.iPessoaLoc, molLocalizacao1.edtLocalizacao, molLocalizacao1.iResponsavel, molLocalizacao1.sCodCentroCusto);
  end;

  if ModuloImobiliario.InvestImob.iIdClasseBem > 0 then
  begin
    molClasseBem1.iClasseBem := ModuloImobiliario.InvestImob.iIdClasseBem;
    AtribuiMolClasseBem (molClasseBem1.iClasseBem, molClasseBem1.edtClasseBem);
  end;

  AbreQueries;
  AbreQueriesGR;
  // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  CtrlContab     := TCtrlContab.Create;
  CtrlContab.InitializeAs(CtrlBem);
end;

procedure TfrmExecDecrescimoNovo.AbreQueriesGR;
var
  sRecDesAnt, sFormaAnt, sCCAnt : string;
begin
  // Tipo de Despesa
  if DBcboTipoRecDes.LookupValue <> '' then
    sRecDesAnt := DBcboTipoRecDes.LookupValue;

  LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
  with dtmLookImobiliario.qryLookTipoRecDes do
  begin
    ParamByName('PRECCUSTO').AsString := 'R';
    ParamByName('PIDMODULO').AsInteger := Sistema.IdModulo;
    ParamByName('ACRESCIMO_VALOR').AsString := 'SIM';
//    ParamByName('NAO_ACRESCIMO_VALOR').AsString := 'SIM';
    Open;
  end;

  if length(trim(sRecDesAnt)) > 0 then
    DBcboTipoRecDes.LookupValue := sRecDesAnt;

  // Forma de Pagamento
  if DBcboFormaRecPag.LookupValue <> '' then
    sFormaAnt := DBcboFormaRecPag.LookupValue;

  LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
  dtmLookImobiliario.qryLookFormaRecPag.ParamByName('PIDPESSOA').AsInteger  := Sistema.idEmpresa;
  dtmLookImobiliario.qryLookFormaRecPag.ParamByName('PRECPAG').AsString     := 'R';
  dtmLookImobiliario.qryLookFormaRecPag.Open;

  if length(trim(sFormaAnt)) > 0 then
    DBcboFormaRecPag.LookupValue := sFormaAnt;

  // Centro de Custo
  if DBcboCentroCusto.LookupValue <> '' then
    sCCAnt := DBcboCentroCusto.LookupValue;

  LimpaParametros(dtmLookImobiliario.qryLookCentroCusto);
  dtmLookImobiliario.qryLookCentroCusto.ParamByName('PIDEMPRESA').AsInteger := Sistema.idEmpresa;
  dtmLookImobiliario.qryLookCentroCusto.Open;


  // Traz também o Centro de Custo default, de acordo com os parâmetros do Sistema
  if length(trim(sCCAnt)) > 0 then
    DBcboCentroCusto.LookupValue := sCCAnt
  else
    if ModuloImobiliario.InvestImob.sCodCentroCusto <> '' then
      DBcboCentroCusto.LookupValue := ModuloImobiliario.InvestImob.sCodCentroCusto;
end;

procedure TfrmExecDecrescimoNovo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FechaQueries;
  FechaQueriesGR;
end;

procedure TfrmExecDecrescimoNovo.FechaQueriesGR;
begin
  dtmLookImobiliario.qryLookTipoRecDes.Close;
  dtmLookImobiliario.qryLookFormaRecPag.Close;
  dtmLookImobiliario.qryLookCentroCusto.Close;
end;

procedure TfrmExecDecrescimoNovo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(CtrlBem);
  FreeAndNil(CtrlDomBem);
  FreeAndNil(CtrlMovAcrescimoValor);
  FreeAndNil(CtrlContab); // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546
  inherited;
end;

procedure TfrmExecDecrescimoNovo.btnTotalizaClick(Sender: TObject);
begin
  inherited;
  If MsgDlg('Altera os valores lançados, rateando pelo saldo contábil ' +#13 +
            'atual dos bens selecionados ?', 'Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes then
    RateiaValoresBens;
  ConfereTotalBens;
end;

function TfrmExecDecrescimoNovo.RateiaValoresBens: boolean;
var fSldImovel, fSldTotal,
    fPercent, fTotRateio, fSaldo : Extended;
begin
  Result    := True;
  fSldTotal := 0;

  qryBens.DisableControls;
  qryBens.First;
  while not qryBens.Eof do
  begin
    // Verifica o Saldo Contabil atual de cada bem
    qryBens.Edit;
    qryBensSLD_BEM.AsFloat := ComunsImobiliario.Arredonda(
                                    CtrlBem.SaldoContabil(Sistema.IdEmpresa,
                                                          qryBensIDBEM.AsInteger,
                                                          edtDataLanc.Date,
                                                          ModuloImobiliario.InvestImob.iIdMoedaCAF,
                                                          ModuloImobiliario.InvestImob.iIdPaisCAF) ,2);
    fSldTotal := fSldTotal + qryBensSLD_BEM.AsFloat;
    qryBens.Post;
    qryBens.Next;
  end;

  // Rateia o Valor do Acréscimo
  fTotRateio := 0;
  qryBens.First;
  while not qryBens.Eof do
  begin
    qryBens.Edit;
    fPercent   := (qryBensSLD_BEM.AsFloat * 100) / fSldTotal;
    qryBensVALOR.AsFloat := ComunsImobiliario.Arredonda(edtVlrOper.Value * ( fPercent / 100 ), 2);
    fTotRateio := fTotRateio + qryBensVALOR.AsFloat;
    qryBens.Post;
    qryBens.Next;
  end;

  // Ajusta centavos final no ultimo bem
  if (fTotRateio <> edtVlrOper.Value) then begin
     fSaldo := edtVlrOper.Value - fTotRateio;
     qryBens.Edit;
     qryBensVALOR.AsFloat := Arredonda(qryBensVALOR.AsFloat + fSaldo,2);
     qryBens.Post;
  end;

  qryBens.First;
  qryBens.EnableControls;
end;

function TfrmExecDecrescimoNovo.ConfereTotalBens: boolean;
var
  fTotBens: Extended;
begin
  qryBens.DisableControls;
  qryBens.First;
  fTotBens := 0;

  while not qryBens.Eof do
  begin
    if qryBensVALOR.AsFloat = 0 then
    begin
      MsgDlg('Não pode haver bens com valor zerado.', 'Aviso',  mtWarning, [mbOK], 0);
      Result := False;
    end;
    fTotBens := fTotBens + qryBensVALOR.AsFloat;
    qryBens.Next;
  end;
  qryBens.EnableControls;

  edtTotalBens.Value := fTotBens;
  if ComunsImobiliario.Arredonda(edtTotalDecrescimo.Value,2) <> ComunsImobiliario.Arredonda(fTotBens,2) then
  begin
    MsgDlg('Total de bens não confere com valor lançado.','Aviso',mtWarning,[mbok],0);
    Result := false;
  end
  else
    Result := true;
end;

procedure TfrmExecDecrescimoNovo.btnExcluiClick(Sender: TObject);
begin
  inherited;
  if not qryBens.IsEmpty then
    qryBens.Delete;
end;

procedure TfrmExecDecrescimoNovo.btnInsertClick(Sender: TObject);
var iImovel  : integer;
    sGrupoContabil: rGrupoBem;
begin
  inherited;
  dtmMS.MS_ImovelAtivo.MultiSelect := True;
  dtmMS.MS_ImovelAtivo.Executar;
  // redesenha o form na volta do MontaSelect
  Repaint;

  // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
  if dtmMS.MS_ImovelAtivo.RetornouValor then
  begin
    Screen.Cursor := crHourGlass;
    while dtmMS.MS_ImovelAtivo.GetNextSelected do
    begin
      // define o grupo contábil
      sGrupoContabil                 := CAF.GrupoImobiliario(StrToIntDef(dbCboBem.LookupValue,-1), '');
      iImovel                        := StrToIntDef(dtmMS.MS_ImovelAtivo.ValoresChave[1], -1);
      qryBens.Append;
      qryBensIDIMOVEL.AsInteger      := iImovel;
      qryBensIMOVEL_EXTENSO.AsString := dtmMS.MS_ImovelAtivo.ValoresChave[2] + ' - ' +
                                        dtmMS.MS_ImovelAtivo.ValoresChave[3];
      qryBensNOME_MESTRE.AsString    := dtmMS.MS_ImovelAtivo.ValoresChave[2];
      qryBensIXBGRUPO.AsString       := sGrupoContabil.sTipoGrupo;
      qryBensNOME_BEM.AsString       := sGrupoContabil.sDescricao;

      //procurar se ja existe bem cadastrado
      LimpaParametros(qryLookBem);
      qryLookBem.ParamByName('PIDIMOVEL').AsInteger := iImovel;
      qryLookBem.ParamByName('PIXBGRUPO').AsString  := sGrupoContabil.sTipoGrupo;
      qryLookBem.Open;

      if qryLookBem.IsEmpty then    // não encontrei o bem cadastrado
      begin                         // entrada com controle total
        qryBensNUM_MOVIMENTACAO.AsInteger := 1;
        qryBensDSC_MOVIMENTACAO.AsString  := 'Novo';
        qryBensPLACA.AsInteger := -1;
      end
      else  // bem ja cadastrado anteriormente
      begin // decréscimo de valor
        qryBensNUM_MOVIMENTACAO.AsInteger := 95;
        qryBensDSC_MOVIMENTACAO.AsString  := 'Decres';
        qryBensIDBEM.AsInteger := qryLookBemIDBEM.AsInteger;

        if not qryBensPLACA.IsNull then
          qryBensPLACA.AsInteger := qryLookBemPLACA.AsInteger;
      end;
      qryBensVALOR.AsFloat := 0;
      qryBens.Post;
    end;
    Screen.Cursor := crDefault;
  end;
  dtmMS.MS_ImovelAtivo.MultiSelect := False;
end;

procedure TfrmExecDecrescimoNovo.btnContinuarLancClick(Sender: TObject);
   //-----------------------------------------------------------------//
   function PesquisaBemCadastrado(oQuery   : TQuery;
                                  IdImovel : integer;
                                  IdBem    : integer;
                                  idGrupo  : String) : Boolean;
   begin
     with oQuery do
     begin
       Sql.Clear;
       Sql.Add('Select 1 from ImovelxBem');
       Sql.Add('Where IdImovel = '+IntToStr(IdImovel));
       Sql.Add('  and IdBem    = '+IntToStr(idBem));
       Sql.Add('  and IxBGrupo = '+QuotedStr(idGrupo));
       Open;
       Result := Not IsEmpty;
       Close;
     end;
   end;
   //-----------------------------------------------------------------//
   function AnalisaBens : Boolean;
   var oQuery : TQuery;
   begin
     // Criacao do Objeto
     Try
       oQuery := TQuery.Create(nil);
       oQuery.DatabaseName := 'BaseDados';

       Result := True;
       with qryBens do
       begin
         DisableControls;
         First;
         while not Eof do
         begin
           If Not PesquisaBemCadastrado(oQuery,
                                        qryBensIDIMOVEL.AsInteger,
                                        qryBensIDBEM.AsInteger,
                                        qryBensIXBGRUPO.AsString) then
           begin
             Result := False;
             Break;
           end;
           Next;
         end;
         EnableControls;
       end;
     Finally
       // Destroi o Objeto
      FreeAndNil(oQuery);
     end;
   end;
   //-----------------------------------------------------------------//
   function ExistemBemCadastrados : Boolean;
   begin
     Result := True;
     If Not AnalisaBens() then
     begin
       Result := Application.MessageBox('O imóvel não possui o bem selecionado.'+#13+#10+
                                        'Ao continuar esse lançamento, este bem será'+#13+#10+
                                        'criado e pode não haver parametrização contábil'+#13+#10+
                                        'para depreciação do mesmo. Deseja continuar?',
                                        'Atenção',
                                        MB_ICONWARNING or MB_YESNO) = IDYES;
     end;
   end;
   //-----------------------------------------------------------------//
begin
   inherited;

   if Not ExistemBemCadastrados then
   begin
     ntbPrincipal.PageIndex := 0;
     exit;
   end;


   //edilaine SIG100808 : fim
   if (ntbPrincipal.PageIndex = 1) and (qryBensIDBEM.AsInteger > 0) then
   begin
        QryVerificaMovimentacao.Close;
        QryVerificaMovimentacao.Sql.clear;
        QryVerificaMovimentacao.Sql.add('SELECT max(datamovimentacao) as datamovimentacao FROM historicomovimentacao where idbem = ' + IntToStr(qryBensIDBEM.AsInteger));
        QryVerificaMovimentacao.Open;
        if QryVerificaMovimentacao.FieldByName('datamovimentacao').AsDatetime > StrToDate(edtDataLanc.text) then         //edilaine SIG00808
        begin
           MsgDlg('A Data do Decréscimo não pode ser anterior a última atualização realizada!' + #13
                + 'O último movimento foi realizado em: ' + QryVerificaMovimentacao.FieldByName('datamovimentacao').AsString ,'Aviso',mtInformation,[mbok],0);
           ntbPrincipal.PageIndex := 0;
           exit;
        end;
   end;
   //edilaine SIG100808 : fim

   if ConfereTotalBens then
   begin
      ntbPrincipal.PageIndex     := ntbPrincipal.PageIndex + 1;
      // preenche os campos fixos
      edtDataLancamento.DateTime := edtDataLanc.DateTime;
      edtVlrTotal.Value          := edtVlrOper.Value;
      iDocumento                 := Documento.GetCodigo(dtmImobiliario.qryAux);
      edtNumDocumento.Text       := FormatFloat('#0', iDocumento);
      cboMes.ItemIndex           := DiasInUteis.ExtraiMes(edtDataLanc.DateTime) - 1;
      DBspnAno.Value             := DiasInUteis.ExtraiAno(edtDataLanc.DateTime);
      // fim preenche campos fixos
   end;
end;

function TfrmExecDecrescimoNovo.VerificaPreenchimentoGR : boolean;
begin
   Result := False;
   try
     if (DBcboTipoRecDes.LookupValue = '') then
        raise EValidacao.CreateVal('É necessário indicar o Tipo de Receita!', DBcboTipoRecDes);
     if ( molFornecedor1.edtNomeFantasia.Text = '' ) then
        raise EValidacao.CreateVal('É necessário indicar o Cliente!', molFornecedor1.btnBuscaForn);
     if edtNumDocumento.Text = '' then
        raise EValidacao.CreateVal('É necessário indicar o Número do Documento!', edtNumDocumento);
     if edtDataVenc.Text = '' then
        raise EValidacao.CreateVal('É necessário indicar a Data de Vencimento!', edtDataVenc);
     // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Inicio

     if not CtrlContab.TestaDataBloqueadaProc(Sistema.idEmpresa,Sistema.idModulo,edtDataVenc.Text) then
         raise EValidacao.CreateVal('Período bloqueado pela Contabilidade!', edtDataVenc);

     // Wylliam Leite da Silva - SOL: 172902/8222 KTN: 1577546 - Fim
     // verifica se o vencimento escolhido é um dia inútil
     if ModuloImobiliario.Adminimob.bFlgDiaUtilAP then
     begin
       if DayOfWeek(edtDataVenc.Date) in [1, 7] then
         raise EValidacao.CreateVal('A Data de Vencimento deve corresponder a um dia útil!', edtDataVenc);
     end;
     // verifica o preenchimento dos campos abrigatórios p/ APs
     if ModuloImobiliario.Adminimob.bFlgUsaAP then
     begin
       if (DBcboFormaRecPag.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar a Forma de Recebimento!', DBcboFormaRecPag);
       if (length(trim(edtReferenciaAP.Text)) = 0) then
         raise EValidacao.CreateVal('É necessário indicar a Referência / Processo!', edtReferenciaAP);
       if (DBcboCentroCusto.LookupValue = '') then
         raise EValidacao.CreateVal('É necessário indicar o Centro de Custo!', DBcboCentroCusto);
     end;
   except
     on ev : EValidacao do
     begin
       if ev.Show then
         MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
       Repaint;
       if ev.Control.CanFocus then
         ev.Control.SetFocus;
       Exit;
     end;
   end;
   Result := True;
end;

procedure TfrmExecDecrescimoNovo.fcShapeBtn1Click(Sender: TObject);
begin
  inherited;
  if VerificaPreenchimentoGR then
  begin
    StartTransacao;
    try
      if CadastraCAF then
      begin
        qryBens.CancelUpdates;
        CommitTransacao;
        MsgDlg('Decréscimo efetuado com sucesso!', 'Informação', mtInformation, [mbok], 0);
        ntbPrincipal.PageIndex := 0;
      end
      else
      begin
        RollBackTransacao;
        MsgDlg('Decréscimo não efetuado!', 'Aviso', mtWarning, [mbok], 0);
      end;
    except
      RollBackTransacao;
      MsgDlg('Decréscimo não efetuado!', 'Aviso', mtWarning, [mbok], 0);
    end;
  end;
end;

function TfrmExecDecrescimoNovo.CadastraCAF: Boolean;
var iIdLancImovel : integer;
begin
  Result := True;
  qryBens.DisableControls;
  try
    try
      qryBens.First;
      while not qryBens.Eof do
      begin
        // GRAVAR LANCAMENTOSIMOVEL
        iIdLancImovel := LeUltRegistro(nil,'LANCAMENTOSIMOVEL');
        LimpaParametros (dtmLancImovel.qryLancImovel);
        with dtmLancImovel.qryInsertLancImovel do
        begin
          ParamByName('PIDLANCIMOVEL').AsInteger      := iIdLancImovel;
          ParamByName('PIDPESSOA').AsInteger          := Sistema.IdEmpresa;
          ParamByName('PIDIMOVEL').AsInteger          := qryBensIDIMOVEL.AsInteger;
          ParamByName('PDATALANCAMENTO').AsDateTime   := edtDataLanc.DateTime;
          ParamByName('PDATAVENCIMENTO').AsDateTime   := edtDataVenc.DateTime;
          ParamByName('PMESCOMPETENCIA').AsInteger    := cboMes.ItemIndex + 1;
          ParamByName('PANOCOMPETENCIA').AsInteger    := word(trunc(DBspnAno.Value));
          ParamByName('PMESREFERENCIA').AsInteger     := DiasInUteis.ExtraiMes(edtDataLanc.DateTime);
          ParamByName('PANOREFERENCIA').AsInteger     := DiasInUteis.ExtraiAno(edtDataLanc.DateTime);
          ParamByName('PIDTIPOCUSTORECIMO').AsInteger := StrToInt(DBcboTipoRecDes.LookupValue);
          ParamByName('PRECPAG').AsString             := 'R';
          ParamByName('PMOEDAPAGAR').AsInteger        := Modulo.iMoedaCorrente;
          ParamByName('PIDFORCLI').AsInteger          := molFornecedor1.iFornecedor;
          ParamByName('PFLGINTEGRADO').AsInteger      := 0;
          ParamByName('PFLGORIGEMLANC').AsString      := 'X';
          ParamByName('PIDUSUARIOSISTEMA').AsInteger  := Sistema.IdUsuario;
          ParamByName('PIDDOCUMENTO').AsInteger       := iDocumento;
          ParamByName('PNODOCUMENTO').AsInteger       := StrToInt(edtNumDocumento.text);
          ParamByName('PIDMODULO').AsInteger          := Sistema.IdModulo;
          ParamByName('PVLRLANCRECEB').AsFloat        := qryBensVALOR.AsFloat;
          ParamByName('PVLRLANCOMRECEB').AsFloat      := qryBensVALOR.AsFloat;
          ParamByName('PCODFORMA').AsInteger          := StrToInt(DBcboFormaRecPag.LookupValue);
          ParamByName('PREFERENCIAAP').AsString       := edtReferenciaAP.Text;
          // Vinicius - Pend 24206
          if DBcboCentroCusto.Text <> '' then
            ParamByName('PCODCENTROCUSTO').AsString   := DBcboCentroCusto.LookupValue;
          ExecSQL;
        end;
        // Registra evento no Imóvel
        EventoImovel.RegistraEvento(qryBensIDIMOVEL.AsInteger,
                                    -1,
                                    Sistema.IdUsuario,
                                    -1,
                                    -1,
                                    edtDataLanc.DateTime,
                                    -1,
                                    'DC',
                                    'Decréscimo de Valor - ' + qryGrupoNOMECLASSE.AsString,
                                    meObsEvento.Text,
                                    0,
                                    0,
                                    (qryBensVALOR.AsFloat * -1),
                                    False);
        If ModuloImobiliario.InvestImob.bFlgIntegraAtivo then
        begin
          If qryBensNUM_MOVIMENTACAO.AsInteger = 1 then
          begin
            if not EntradaCAF(iIdLancImovel) then
              raise Exception.create('');
          end
          else
          begin                                        // acréscimo de valor
            if not AcrescimoCAF (iIdLancImovel) then
              raise Exception.create('');
          end;
        end;
        qryBens.Next;
      end;
      // insere a Observação na tabela ObsLancImovel
      if length(trim(memObs.Text)) > 0 then
        FuncoesImob.InsertObsLanc(iDocumento, memObs.Text);
    except
      on E : Exception do
      begin
        Result := False;
      end;
    end;
  finally
    qryBens.EnableControls;
  end;
end;

function TfrmExecDecrescimoNovo.EntradaCAF(const iIdLancImovel: integer) : Boolean;
var iIdBem, iPlanilha, iPlacaCAF : integer;
    cdsBem, cdsTaxasDep, cdsPlanoPatroxBem, cdsImagem : TCMClientDataSet;
    iPrefixo : Integer;
    iSeqPlaca : Integer;
begin
  Result    := True;
  iPlanilha := 0;
  iPrefixo  := 0;
  iSeqPlaca := 0;
  try
    try
      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) then
        Inc(iSeqPlaca);
      // preenche placaCAF
      iPlacaCAF := CAF.PlacaCaf(qryGrupoIDGRUPO.AsInteger,
                                qryBensIDIMOVEL.AsInteger,
                                Sistema.IdEmpresa,
                                qryGrupoFLGSEMPLACA.AsInteger,
                                iSeqPlaca);

      if (ModuloImobiliario.InvestImob.iFlgTipoNumeracao = 1) and (iPlacaCAF <> -1) then
      begin
        LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
        dtmLookImobiliario.qryLookTipoImovel.Close;
        dtmLookImobiliario.qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := DBcboTipoImovel.LookupValue;
        dtmLookImobiliario.qryLookTipoImovel.Open;
        if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull) and
           (dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsInteger = qryGrupoIDGRUPO.AsInteger) then
          iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumTer);
        if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull) and
           (dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsInteger = qryGrupoIDGRUPO.AsInteger) then
          iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumEdi);

        if (not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull) and
           (dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsInteger = qryGrupoIDGRUPO.AsInteger) then
          iPrefixo := StrToInt(ModuloImobiliario.InvestImob.sFlgPrefixoNumIns);

        iPlacaCAF := StrToInt(IntToStr(iPrefixo) + CompletaInicio(IntToStr(iPlacaCAF), '0',6));
      end;
      // buscar conjunto
      LimpaParametros(qryLookBem);
      qryLookBem.ParamByName('PIDIMOVEL').AsInteger := qryBensIDIMOVEL.AsInteger;
      qryLookBem.Open;
      if qryLookBem.IsEmpty then
        raise Exception.create('O imóvel: '+qryBensIMOVEL_EXTENSO.AsString+#13+'não possui nenhum bem no Ativo Fixo, executar Aquisição.');

      // Instancia os cds necessários para a inclusão do bem
      cdsBem            := TCMClientDataSet.Create( nil );
      cdsTaxasDep       := TCMClientDataSet.Create( nil );
      cdsPlanoPatroxBem := TCMClientDataSet.Create( nil );
      cdsImagem         := TCMClientDataSet.Create( nil );
      // Abre a estrutura do cds vazia
      cdsBem.Data            := CtrlDomBem.ListaBem(Sistema.IdEmpresa, -99);
      cdsTaxasDep.Data       := CtrlDomBem.ListaBemxDep(Sistema.IdEmpresa, -99);
      cdsPlanoPatroxBem.Data := CtrlDomBem.ListaPlanoPatroxBem(Sistema.IdEmpresa, -99);
      cdsImagem.Data         := CtrlDomBem.CarregaImagem(-99);
      // Associa os cds locais aos cds do Ctrl
      CtrlDomBem.cds               := cdsBem;
      CtrlDomBem.cdsTaxasDep       := cdsTaxasDep;
      CtrlDomBem.cdsPlanoPatroxBem := cdsPlanoPatroxBem;
      CtrlDomBem.cdsImagem         := cdsImagem;
      // Preenche o Cds de Bem
      cdsBem.EmptyDataSet;
      cdsBem.Insert;
      cdsBem.FieldByName('IDPESSOA').AsInteger       := Sistema.IdEmpresa;
      cdsBem.FieldByName('IDMODULO').AsInteger       := Sistema.IdModulo;
      cdsBem.FieldByName('IDCONJUNTO').AsInteger     := qryLookBemIDCONJUNTO.AsInteger;
      cdsBem.FieldByName('IDGRUPO').AsInteger        := qryGrupoIDGRUPO.AsInteger;
      cdsBem.FieldByName('IDCLASSEBEM').AsInteger    := molClasseBem1.iClasseBem;
      cdsBem.FieldByName('UNIDNEGOC').AsInteger      := ModuloImobiliario.InvestImob.iUnidNegoc;
      cdsBem.FieldByName('DESBEM').AsString          := qryBensIMOVEL_EXTENSO.AsString + ' - ' + qryBensNOME_BEM.AsString;
      cdsBem.FieldByName('IDFORNSERV').AsInteger     := molFornecedor1.iFornecedor;
      cdsBem.FieldByName('IDSITUACAO').AsInteger     := StrToInt(DBcboSituacao.LookupValue);
      cdsBem.FieldByName('VALHISTORICO').AsFloat     := (qryBensVALOR.AsFloat * -1);
      cdsBem.FieldByName('IDOPCIONAL').AsString      := qryBensNOME_MESTRE.AsString;
      cdsBem.FieldByName('REGISTRO').AsString        := 'I';
      cdsBem.FieldByName('CONTROLE').AsString        := 'T';
      cdsBem.FieldByName('BAIXATOTAL').AsString      := 'N';
      cdsBem.FieldByName('DTAINCLUSAO').AsDateTime   := edtDataLanc.DateTime;
      cdsBem.FieldByName('DTANOTA').AsDateTime       := edtDataLanc.DateTime;
      cdsBem.FieldByName('DATAINICIODEP').AsDateTime := edtDataLanc.DateTime;
      cdsBem.FieldByName('DTACONTAB').AsDateTime     := edtDataLanc.DateTime;
      cdsBem.Post;

      // Preenche o Cds da TaxaDep
      cdsTaxasDep.EmptyDataSet;
      cdsTaxasDep.Insert;
      cdsTaxasDep.FieldByName('IDPESSOA').AsInteger  := Sistema.IdEmpresa;
      cdsTaxasDep.FieldByName('MOECODIGO').AsInteger := ModuloImobiliario.InvestImob.iIdMoedaCAF;
      cdsTaxasDep.FieldByName('IDBEMXDEP').AsInteger := ModuloImobiliario.InvestImob.iIdPaisCAF;
      cdsTaxasDep.FieldByName('TAXADEP').AsFloat     := qryGrupoDEPRECIACAO.AsFloat;
      cdsTaxasDep.Post;

      CtrlDomBem.OpenTransaction := False;
      if CtrlDomBem.ExecutaCadastroBem(Sistema.IdModulo,
                                       Sistema.IdEmpresa,
                                       Sistema.IdUsuario,
                                       'I',
                                       qryBensVALOR.AsFloat,
                                       1 ) then
        iIdBem := CtrlDomBem.IdBem
      else
      begin
        iIdBem := -1;
        raise Exception.create(CtrlDomBem.MessageInfo);
      end;

      try
        LimpaParametros (dtmCAF.qryInsImovelxbem);
        dtmCAF.qryInsImovelxbem.ParamByName('PIDIMOVEL').AsInteger := qryBensIDIMOVEL.AsInteger;
        dtmCAF.qryInsImovelxbem.ParamByName('PIDBEM').AsInteger    := iIdBem;
        dtmCAF.qryInsImovelxbem.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
        dtmCAF.qryInsImovelxbem.ParamByName('PIXBGRUPO').AsString  := qryBensIXBGRUPO.AsString;
        dtmCAF.qryInsImovelxbem.ExecSQL;
      except
        raise Exception.create('Erro ao inserir na tabela IMOVELXBEM')
      end;

      // gravar LANCIMOVELXBEM
      try
        LimpaParametros (dtmCAF.qryInsertLancImovelxbem);
        dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
        dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDBEM').AsInteger        := iIdBem;
        dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
        dtmCAF.qryInsertLancImovelxbem.ParamByName('PVLRMOV').AsFloat         := -qryBensVALOR.AsFloat;
        dtmCAF.qryInsertLancImovelxbem.ParamByName('PFLGNUMMOV').AsFloat      := 1;
        dtmCAF.qryInsertLancImovelxbem.ExecSQL;
      except
        raise Exception.create('Erro ao inserir na tabela LANCIMOVELXBEM')
      end;
    except
      on E : Exception do
      begin
        Result := False;
        MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
      end;
    end;
  finally
    FreeAndNil( cdsBem );
    FreeAndNil( cdsTaxasDep );
    FreeAndNil( cdsPlanoPatroxBem );
    FreeAndNil( cdsImagem );
  end;
end;

function TfrmExecDecrescimoNovo.AcrescimoCAF(const iIdLancImovel: integer) : Boolean;
var iIdAcrescimo: Integer;
    fTaxaDep    : Double;
    sObs        : String;
begin
   Result := True;
   sObs   := copy(meObsEvento.Text,1,55);
   try
     CtrlMovAcrescimoValor.OpenTransaction := False;
     if CtrlMovAcrescimoValor.ExecutaAcrescimoValor(Sistema.IdModulo,
                                                    Sistema.IdEmpresa,
                                                    Sistema.IdUsuario,
                                                    qryBensIDBEM.AsInteger,
                                                    edtDataLanc.DateTime,
                                                    dtmLookImobiliario.qryLookTipoRecDesIDTIPODESPESA.AsInteger,
                                                    qryBensVALOR.AsFloat,
                                                    sObs,
                                                    True ) then     // Parametro que Indica Decréscimo
       iIdAcrescimo := CtrlMovAcrescimoValor.IdAcrescimo
     else
     begin
       iIdAcrescimo := -1;
       raise Exception.create(CtrlMovAcrescimoValor.MessageInfo);
     end;

     try
       // iIdAcrescimo vem da tabela ACRESCIMOVALOR, pegar IDMOVIMENTACAO da mesma
       LimpaParametros(dtmCAF.qryLookAcrescimoValor);
       dtmCAF.qryLookAcrescimoValor.ParamByName('PIDACRESCIMO').AsInteger := iIdAcrescimo;
       dtmCAF.qryLookAcrescimoValor.Open;

       // gravar LANCIMOVELXBEM
       LimpaParametros (dtmCAF.qryInsertLancImovelxbem);
       dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDLANCIMOVEL').AsInteger := iIdLancImovel;
       dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDBEM').AsInteger        := qryBensIDBEM.AsInteger;
       dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDPESSOA').AsInteger     := Sistema.IdEmpresa;
       dtmCAF.qryInsertLancImovelxbem.ParamByName('PVLRMOV').AsFloat         := (qryBensVALOR.AsFloat * -1);
       dtmCAF.qryInsertLancImovelxbem.ParamByName('PFLGNUMMOV').AsFloat      := 95;
       dtmCAF.qryInsertLancImovelxbem.ParamByName('PIDMOVIMENTACAO').AsFloat := dtmCAF.qryLookAcrescimoValorIDMOVIMENTACAO.AsInteger;
       dtmCAF.qryInsertLancImovelxbem.ExecSQL;
     except
       raise Exception.create('Erro ao atualizar a tabela LANCIMOVELXBEM');
     end;
   except
     on E : Exception do
     begin
       Result := False;
       MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
     end;
   end;
end;

procedure TfrmExecDecrescimoNovo.btnVoltarClick(Sender: TObject);
begin
  inherited;
  sTipoImoAnt  := dtmLookImobiliario.qryLookTipoImovelCODTIPIMOVEL.AsString;
  iGrupoImoAnt := dtmLookImobiliario.qryLookGrupoRateioIDGRUPORATEIO.AsInteger;
  iGrupoBemAnt := qryGrupoIDGRUPO.AsInteger;
  ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecDecrescimoNovo.fcShapeBtn5Click(Sender: TObject);
begin
  inherited;
  ntbPrincipal.PageIndex := ntbPrincipal.PageIndex - 1;
end;

procedure TfrmExecDecrescimoNovo.ntbPrincipalPageChanged(Sender: TObject);
begin
  inherited;
  case ntbPrincipal.PageIndex of
     0: lblTitulo.Caption := 'Decréscimo de Valor [ Seleção ]';
     1: lblTitulo.Caption := 'Decréscimo de Valor [ Bens ]';
     2: lblTitulo.Caption := 'Decréscimo de Valor [ GR ]';
  end;
end;

end.
