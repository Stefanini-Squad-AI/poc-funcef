unit uCtrlGeraFolPagNormal;

interface

uses SysUtils, Controls, Classes, Forms, uCmControlObject, uCmDbObject, IvDictio,
  uCMTranslate, uCmClientDataSet, uCMTypes, StringListEx, uCtrlGeraFolPag,
  uCtrlParamRH, uCtrlAntec13;

type
  TCtrlGeraFolPagNormal = class(TCtrlGeraFolPag)
  protected
    FCtrlParamRH: TCtrlParamRH;
    FCtrlAntec13: TCtrlAntec13;

    FCdsParamRH: TCMClientDataSet;
    FCdsAntec13: TCMClientDataSet;
    FCdsAux: TCMClientDataSet;
    FCdsRubXSit: TCMClientDataSet;

    FListaRubBase: TStringListEx;
    FListaRubComplem: TStringListEx;
    FListaRubResult: TStringListEx;
    FListaRubTipoCalc: TStringListEx;

    FListaResultSemBase: TStringList;

    FTotSemBase: integer;
    FQuantMesesRetroativo: integer;
    FIdMotivoPadrao: integer;
    FNumSeqFerias: integer;
    FNumRegProcessados: integer;

    FIdHotel: double;
    FPercRetroativo: double;

    FTempoDecorridoTotal: TTime;
    FTempoDecorridoPessoa: TTime;
    FHoraInicialPessoa: TTime;

    FDataFeriasIni: TDate;
    FDataFeriasFim: TDate;

    FGerarRetroativo: boolean;
    FSelTodasPessoasRetroativo: boolean;
    FUsaRAD: boolean;
    FForcarGeracao13: boolean;
    FGerouFerias: boolean;
    FPodeGerarFerias: boolean;
    FGerouAntec13: boolean;
    FPodeGerarAntec13: boolean;
    FRADFeriasOk: boolean;

    FMsgResult: string;
    FListaEmpregado: string;
    FListaIdEmpresa: string;
    FListaIdEstab: string;
    FListaIdRubrica: string;
    FListaTipoContrato: string;
    FListaIdFuncRetroativo: string;
    FDataFer1: string;
    FDataFer2: string;
    FDataFer3: string;

    function ListHistoricoPessoaMes: OleVariant;
    function ListRubXSit: OleVariant;

    procedure SelDadosEmpresaAtual;
    function  SelRubDependSomenteRegra: boolean;
    function  SelLancSemIncidencia: boolean;
    procedure InitRetroativo;

    function GetValorRubrica(ListaIdRubrica, AnoBarraMes: string): double;

    procedure SetFeriasParaProcessada(DataIniPer: TDate; NumSeqFerias: integer);
    procedure SetAntec13ParaProcessada;
    
    function PrepararFerias: boolean;
    function PrepararRubEspeciais: boolean; override;

    procedure SetReferenciaRubDelolucaoFerias1;
    procedure SetReferenciaRubDelolucaoFerias2;

    function AlimentarPrevia: boolean;
    function ApagarPrevia: boolean; override;
    function CalcRetroativo(IdRubrica: string; var ValBase: double): boolean;
    function GerarFolhaNormal: boolean;

    function  CriarObjetos_Geracao: boolean; override;
    procedure DestruirObjetos_Geracao; override;
    function  AbrirSQLFunc: boolean; override;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); override;
    destructor  Destroy; override;

    function GetLinhasArquivo_SERPROS(ArqEmprestimo: boolean): string;

    function ListFuncionarios(ListaIdEmpresa: string; AgrupaCCusto: boolean; ListaIdEstab,
      ListaCodCCusto, ListaIdSindicato, ListaSitFunc, ListaTipoContr: string;
      DataFeriasIni, DataFeriasFin: TDate): OleVariant;

    function Processar(const IAppCliente: OleVariant; Mes, Ano, TipoCliente: integer;
      TipoEmpresa: string; Processo: integer; DataProcessamento: TDateTime;
      TipoMotivo, IdMotivo, IdMotivoPadrao, OpcaoPrevia: integer; DataFeriasIni,
      DataFeriasFim: TDateTime; ListaIdEmpresa, ListaIdEstab, ListaEmpregado, ListaIdRubrica,
      ListaTipoContrato: string; GerarRetroativo: boolean; QuantMesesRetroativo: integer;
      PercRetroativo: double; ListaRubBaseRetroativo, ListaRubComplemRetroativo,
      ListaRubResultRetroativo, ListaTipoCalcRubRetroativo: string;
      SelTodasPessoasRetroativo: boolean; ListaIdFuncRetroativo: string;
      Integra_PagEletronico, Integra_CAP: boolean; DataPagamento, DataEmissao: TDateTime;
      RateioCC, CriarDocIndividual: boolean; const ContaPadrao_Favorecido: string;
      const IdPlano_ContaPadrao_Favorecido: integer; IdUsuario, CodTipDoc,
      CodPortForma: integer; DiretorioArqPag: string; UsaPlanoPatro, ObrigaAbc,
      ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer; ListaTipoDesemb: string;
      UsaRAD, ForcarGeracao13: boolean; UsaLOG: boolean = false): boolean;
      
    property NumRegProcessados: integer read FNumRegProcessados;
    property TempoDecorridoTotal: TTime read FTempoDecorridoTotal;
    property TempoDecorridoPessoa: TTime read FTempoDecorridoPessoa;
  end;

implementation

uses Variants, Db, fAguarde, uCtrlCalcRub, uCtrlFuncoesRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_ALOCA_MEM =
    '* Alocação de memória para os objetos :1'+
    'envolvidos no processo de Geração da Rescisão.';
  MSG_SEL_DADOS_PESSOA =
    '* Não foi possível selecionar os dados da(s) Pessoa(s). :1'+
    'Verifique-os e tente novamente.';

{ TCtrlGeraFolPagNormal }

constructor TCtrlGeraFolPagNormal.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create(IdEmpresa, IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlParamRH := TCtrlParamRH.Create(MODFOL);
  FCtrlAntec13 := TCtrlAntec13.Create;

  FIdHotel := IdHotel;

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlGeraFolPagNormal.Destroy;             
begin
  FreeAndNil(FCtrlParamRH);
  FreeAndNil(FCtrlAntec13);
  inherited;
end;

procedure TCtrlGeraFolPagNormal.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlGeraFolPagNormal.AfterInitialize;
begin
  inherited;
  FCtrlParamRH.InitializeAs(Self);
  FCtrlAntec13.InitializeAs(Self);
end;

procedure TCtrlGeraFolPagNormal.DoChangeDataBase;
begin
  inherited;
  FCtrlParamRH.DataBaseName := DataBaseName;
  FCtrlAntec13.DataBaseName := DataBaseName;
end;

function TCtrlGeraFolPagNormal.CriarObjetos_Geracao: boolean;
begin
  try
    Result := inherited CriarObjetos_Geracao;
    if (Result) then
    begin
      FCdsParamRH := TCMClientDataSet.Create(nil);
      FCdsAntec13 := TCMClientDataSet.Create(nil);
      FCdsRubXSit := TCMClientDataSet.Create(nil);

      if (FGerarRetroativo) then
      begin
        FListaRubBase := TStringListEx.Create;
        FListaRubComplem := TStringListEx.Create;
        FListaRubResult := TStringListEx.Create;
        FListaRubTipoCalc := TStringListEx.Create;
        FListaResultSemBase := TStringList.Create;
      end;
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CMTranslateMsg(MSG_ALOCA_MEM, [CR_LF]) +MSG_ERRO+ E.Message;
    end;
  end;
end;

procedure TCtrlGeraFolPagNormal.DestruirObjetos_Geracao;
begin
  try
    inherited;
    FreeAndNil(FCdsParamRH);
    FreeAndNil(FCdsAntec13);
    FreeAndNil(FCdsRubXSit);
    
    if (FGerarRetroativo) then
    begin
      FreeAndNil(FListaRubBase);
      FreeAndNil(FListaRubComplem);
      FreeAndNil(FListaRubResult);
      FreeAndNil(FListaRubTipoCalc);
      FreeAndNil(FListaResultSemBase);
    end;
  except
  end;
end;

function TCtrlGeraFolPagNormal.AbrirSQLFunc: boolean;
var
  _SQL: TStringList;
begin
  Result := inherited AbrirSQLFunc;
  try
    _SQL := TStringList.Create;
    with (_SQL) do
    begin
      Clear;
      Add('SELECT');
      Add('  F.IDSITFUNC, F.IDPESSOA, F.IDEMPRESA, F.MATRICULA, SF.TIPOSIT,');
      Add('  PF.NUMDEPIRRF, EP.NOMEEMPRESA, F.CODCENTROCUSTO, P.NOME, F.DATAADMISSAO');
      Add('FROM');
      Add('  PESSOA P, PESSOAFISICA PF, FUNCIONARIO F, SITFUNC SF, EMPRESAPROP EP');
      Add('WHERE');

      if (Pos(',',FListaIdEmpresa) > 0) then
        Add('  (EP.IDPESSOA    IN (' +FListaIdEmpresa+ ')) AND')
      else
        Add('  (EP.IDPESSOA     = ' +FListaIdEmpresa+ ') AND');

      Add('  (SF.TIPOSIT     <> ''D'') AND');
      Add('  (SF.IDSITFUNC    = F.IDSITFUNC) AND');

      if (Trim(FListaEmpregado) <> '') then
        if (Pos(',',FListaEmpregado) > 0) then
          //Add('  (F.IDPESSOA     IN (' +FListaEmpregado+ ')) AND')
          Add(QuebrarListaFiltro(2, '(F.IDPESSOA  ', FListaEmpregado, 50)+ ' AND')    // ECF 21/07/05
        else
          Add('  (F.IDPESSOA      = ' +FListaEmpregado+ ') AND');

      if (Trim(FListaTipoContrato) <> '') then
        if (Pos(',',FListaTipoContrato) > 0) then
          Add('  (F.TIPOCONTRATO IN (' +QuotedListaString(FListaTipoContrato, ',')+ ')) AND')
        else
          Add('  (F.TIPOCONTRATO  = ' +QuotedListaString(FListaTipoContrato, ',')+ ') AND');

      if (Pos(',',FListaIdEstab) > 0) then
        Add('  (F.IDESTAB      IN (' +FListaIdEstab+ ')) AND')
      else
        Add('  (F.IDESTAB       = ' +FListaIdEstab+ ') AND');

      Add('  (TO_CHAR(F.DATAADMISSAO,''YYYY/MM'') <= ' +QuotedStr(FMesRef)+ ') AND');
      Add('  (F.IDPESSOA      = PF.IDPESSOA) AND');
      Add('  (F.IDPESSOA      = P.IDPESSOA) AND');
      Add('  (EP.IDPESSOA     = F.IDEMPRESA)');
      Add('ORDER BY');
      Add('  IDEMPRESA, MATRICULA');
      if not(IsAppServer) then
        SaveToFile(DirTempLog + '\qry.txt');
    end;
    EnviarMensagem(CMTranslate('Selecionando dados das Pessoas...'));
    FCdsFunc.Close;
    FCdsFunc.Data := GetDataPacket(_SQL.Text);
    //OpenDataSet(_SQL.Text);
    EnviarMensagem('', GetTempoDecorrido, 0, '', FCdsFunc.RecordCount);

    Result := not(FCdsFunc.IsEmpty);
    if not(Result) then
      MessageInfo := CMTranslateMsg(MSG_SEL_DADOS_PESSOA, [CR_LF]);

    _SQL.Free;
  except
    on E: Exception do
      MessageInfo := CMTranslate('* Na seleção dos dados da(s) Pessoa(s).') +
        MSG_ERRO+ E.Message;
  end;
end;

function TCtrlGeraFolPagNormal.GetLinhasArquivo_SERPROS(ArqEmprestimo: boolean): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  LPAD(DP.NUMDOCUMENTO,9,''0'') ||' +CR_LF+
    '    SUBSTR(H.MES,6,2) || SUBSTR(H.MES,1,4) ||' +CR_LF+
    '    LPAD(H.CODPROVDESC,4,''0'') ||' +CR_LF+
    '    LPAD(TO_CHAR(H.VALORPROVENTO * 100),12,''0'') AS LINHA' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL H, DOCPESSOA DP, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (DP.IDDOCUMENTO = 145) AND' +CR_LF+
    '  (PD.CODRUBCLT   = '+ IFF(ArqEmprestimo, '89999', '89998')+ ') AND' +CR_LF+
    '  (H.MES          = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (H.IDMOTIVO     = ' +IntToStr(FIdMotivo)+ ') AND' +CR_LF+
    '  (H.IDRUBRICA    = PD.IDPROVENTO) AND' +CR_LF+
    '  (H.IDPESSOA     = DP.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  LINHA');

  Result := _CdsAux.FieldByName('LINHA').asString;
  _CdsAux.Free;
end;

function TCtrlGeraFolPagNormal.ListFuncionarios(ListaIdEmpresa: string;
  AgrupaCCusto: boolean; ListaIdEstab, ListaCodCCusto, ListaIdSindicato, ListaSitFunc,
  ListaTipoContr: string; DataFeriasIni, DataFeriasFin: TDate): OleVariant;
begin
  FSQL :=
    'SELECT' +CR_LF+
    '  F.IDPESSOA, F.MATRICULA, PF.NOME' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA PF,';

  if ((ListaIdSindicato <> '') and (AgrupaCCusto)) then
    FSQL := FSQL + ' PESSOAFISICA PFIS,';

  if (DataFeriasIni > 0) and (DataFeriasFin > 0) then
    FSQL := FSQL + ' FERIAS FE,';

  FSQL := FSQL +
    ' FUNCIONARIO F, SITFUNC ST' +CR_LF+
    'WHERE' +CR_LF+
    '  (ST.TIPOSIT        <> ''D'') AND' +CR_LF;

  if ((ListaIdSindicato <> '') and (AgrupaCCusto)) then
  begin
    FSQL := FSQL + '  (F.IDPESSOA        = PFIS.IDPESSOA) AND' +CR_LF;

    if (Pos(',', ListaIdSindicato) > 0) then
      FSQL := FSQL + '  (PFIS.IDSINDICATO IN (' +ListaIdSindicato+ ')) AND' +CR_LF
    else
      FSQL := FSQL + '  (PFIS.IDSINDICATO  = ' +ListaIdSindicato+ ') AND' +CR_LF;
  end;

  if (Pos(',', ListaIdEmpresa) > 0) then
    FSQL := FSQL + '  (F.IDEMPRESA      IN (' +ListaIdEmpresa+ ')) AND' +CR_LF
  else
    FSQL := FSQL + '  (F.IDEMPRESA       = ' +ListaIdEmpresa+ ') AND' +CR_LF;

  if (ListaIdEstab <> '') then
    if (Pos(',', ListaIdEstab) > 0) then
      FSQL := FSQL + '  (F.IDESTAB        IN (' +ListaIdEstab+ ')) AND' +CR_LF
    else
      FSQL := FSQL + '  (F.IDESTAB         = ' +ListaIdEstab+ ') AND' +CR_LF;

  if (Pos(',', ListaTipoContr) > 0) then
    FSQL := FSQL + '  (F.TIPOCONTRATO   IN (' +QuotedListaString(ListaTipoContr, ',')+ ')) AND' +CR_LF
  else
    FSQL := FSQL + '  (F.TIPOCONTRATO    = ' +QuotedListaString(ListaTipoContr, ',')+ ') AND' +CR_LF;

  if (AgrupaCCusto) then
  begin
    if (ListaSitFunc <> '') then
      if (Pos(',', ListaSitFunc) > 0) then
        FSQL := FSQL + '  (ST.TIPOSIT       IN (' +QuotedListaString(ListaSitFunc, ',')+ ')) AND' +CR_LF
      else
        FSQL := FSQL + '  (ST.TIPOSIT        = ' +QuotedListaString(ListaSitFunc, ',')+ ') AND' +CR_LF;

    if (ListaCodCCusto <> '') then
      if(Pos(',', ListaCodCCusto) > 0) then
        FSQL := FSQL + '  (F.CODCENTROCUSTO IN (' +QuotedListaString(ListaCodCCusto, ',')+ ')) AND' +CR_LF
      else
        FSQL := FSQL + '  (F.CODCENTROCUSTO  = ' +QuotedListaString(ListaCodCCusto, ',')+ ') AND' +CR_LF;
  end;

  if (DataFeriasIni > 0) and (DataFeriasFin > 0) then
    FSQL := FSQL +
      '  (F.IDPESSOA        = FE.IDPESSOA) AND' +CR_LF+
      '  (FE.FLGOCORRIDA    = 0) AND' +CR_LF+
      '  (FE.INIGOZOFERIAS >= TO_DATE(' +QuotedStr(DateToStr(DataFeriasIni))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
      '  (FE.INIGOZOFERIAS <= TO_DATE(' +QuotedStr(DateToStr(DataFeriasFin))+ ',''DD/MM/YYYY'')) AND' +CR_LF;

  FSQL := FSQL +
    '  (ST.IDSITFUNC      = F.IDSITFUNC) AND' +CR_LF+
    '  (F.IDPESSOA        = PF.IDPESSOA)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(NOME)';

  Result := GetDataPacket(FSQL);
end;

function TCtrlGeraFolPagNormal.SelLancSemIncidencia: boolean;
begin
  try
    FSQL :=
      'SELECT' +CR_LF+
      '  RI.IDPESSOA, RI.IDEMPRESA, RI.IDRUBRICA, RI.NUMOCORRENCIAS,' +CR_LF+
      '  RI.SEQRUBRICAINDIV, RI.IDFAVORECIDO, NVL(RI.VALORRUBRICA,0.00) AS VALORRUBRICA,' +CR_LF+
      '  RI.ANOMESINICIO, RI.FLGPERMANENTE, RI.PARCELAS,' +CR_LF;

    case (FTipoMotivo) of
      FOLHA_NORMAL,
      FOLHA_ESPECIAL : FSQL := FSQL + '  RI.IDREGRACALCULO,' +CR_LF;
      FOLHA_FERIAS   : FSQL := FSQL + '  NVL(PD.IDREGRAFERIAS, RI.IDREGRACALCULO) AS IDREGRACALCULO,' +CR_LF;
      FOLHA_13SAL    : FSQL := FSQL + '  NVL(PD.IDREGRA13, RI.IDREGRACALCULO) AS IDREGRACALCULO,' +CR_LF;
    end;

    FSQL := FSQL +
      '  PD.DESCRICAO, PD.FLGDECIMOTERCEIRO, PD.FLGFERIAS, PD.FLGSALFAMILIA,' +CR_LF+
      '  PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF, PD.FLGDESCONTO, PD.FLGIRRF,' +CR_LF+
      '  PD.IDREGRAFERIAS, PD.IDREGRA13, PD.CODRUBCLT, F.IDPESSOA, RP.CODPROVDESC' +CR_LF+
      'FROM' +CR_LF+
      '  FUNCIONARIO F, PROVDESC PD, RUBRICAINDIV RI, RUBRICAXPESS RP' +CR_LF+
      'WHERE' +CR_LF+
      '  (F.IDPESSOA         = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '  (RI.IDPESSOA        = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '  (RI.ANOMESINICIO   <= ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
      '  (RI.IDEMPRESA       = ' +FloatToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (PD.FLGCONSTAFOLHA  = 1) AND' +CR_LF+
      '  (RI.FLGTPRUBMANUT   = ''2'') AND' +CR_LF+
      '  ((RI.FLGPERMANENTE  = 1) OR' +CR_LF+
      '   (RI.NUMOCORRENCIAS < RI.PARCELAS)) AND' +CR_LF+
      '  (RP.IDPESSOA        = ' +FloatToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (RP.IDRUBRICA       = PD.IDPROVENTO) AND' +CR_LF+
      '  (RI.IDRUBRICA NOT  IN (SELECT DISTINCT IDRUBSECUND FROM RUBXRUB)) AND' +CR_LF+
      '  (RI.IDRUBRICA       = PD.IDPROVENTO)';

    if (FListaIdRubrica <> '') then
    begin
      FSQL := FSQL +' AND' +CR_LF;

      if (Pos(',',FListaIdRubrica) > 0) then
        FSQL := FSQL + '  ((RI.IDRUBRICA IN (' +FListaIdRubrica+ ')) OR' +CR_LF
      else
        FSQL := FSQL + '  ((RI.IDRUBRICA  = ' +FListaIdRubrica+ ') OR' +CR_LF;

      FSQL := FSQL +
        '   (RI.IDRUBRICA IN (SELECT DISTINCT IDRUBPRINC' +CR_LF+
        '                     FROM   RUBXRUB' +CR_LF;

      if (Pos(',',FListaIdRubrica) > 0) then
        FSQL := FSQL + '                     WHERE  (IDRUBSECUND IN (' +FListaIdRubrica+ ')))))'
      else
        FSQL := FSQL + '                     WHERE  (IDRUBSECUND  = ' +FListaIdRubrica+ '))))';
    end;

    FCdsAux.Close;
    FCdsAux.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := CMTranslate('* Ao preparar Lançamentos sem incidência.') +
        MSG_ERRO+ E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlGeraFolPagNormal.ListHistoricoPessoaMes: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  H.VALORPROVENTO, H.IDPESSJUR, H.IDPESSOA, H.MES,' +CR_LF+
    '  H.IDRUBRICA, H.SEQRUBRICA, H.' +CAMPO_SEQ_ORIGINAL+ ', PD.*' +CR_LF+
    'FROM' +CR_LF+
    '  ' +FNomeTabela+ ' H, PROVDESC PD' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.IDPESSOA  = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (H.MES       = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
    '  (H.IDMOTIVO  = ' +IntToStr(FIdMotivo)+ ') AND' +CR_LF+
    '  (H.IDPESSJUR = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
    '  (H.IDRUBRICA = PD.IDPROVENTO)');
end;

function TCtrlGeraFolPagNormal.ListRubXSit: OleVariant;
begin
  Result := GetDataPacket('SELECT IDPROVENTO, IDSITFUNC FROM RUBXSIT');
end;

procedure TCtrlGeraFolPagNormal.SelDadosEmpresaAtual;
begin
  if (FCdsFunc.FieldByName('IDEMPRESA').asInteger <> FIdEmpresa) then
  begin
    FIdEmpresa := FCdsFunc.FieldByName('IDEMPRESA').asInteger;

    SelDadosIntegracaoEmpresa;

    FMsgResult := CR_LF+
      CMTranslate('Empresa: ') +AnsiUpperCase(FCdsFunc.FieldByName('NOMEEMPRESA').asString) +
      CR_LF+ Replicate('-',50) +CR_LF;

    EnviarMensagem('', '', 0, '', 0, 0, FMsgResult);
  end;
end;

function TCtrlGeraFolPagNormal.SelRubDependSomenteRegra: boolean;
var
  sAux: string;
begin
  try
    FSQL :=
      'SELECT DISTINCT' +CR_LF+
      '  PD.IDPROVENTO AS IDRUBRICA, PD.NUMPRIORIDADE, PD.CODRUBCLT,' +CR_LF+
      '  PD.FLGCOMPOESALPART, PD.FLGCOMPOESALBENEF, PD.FLGDESCONTO, PD.FLGIRRF,' +CR_LF+
      '  PD.FLGESPECIAL, PD.FLGCONSTAFOLHA, PD.FLGDECIMOTERCEIRO, PD.FLGFERIAS,' +CR_LF+
      '  PD.FLGSALFAMILIA, PD.FLGRESCISAO, PD.IDREGRA, PD.IDREGRAFERIAS,' +CR_LF+
      '  PD.IDREGRA13, 0 AS FLGPERMANENTE, 1 AS PARCELAS, 0 AS NUMOCORRENCIAS,' +CR_LF+
      '  0.00 AS VALORRUBRICA, 1 AS SEQRUBRICAINDIV, RP.CODPROVDESC,' +CR_LF+
      '  ' +FloatToStr(FIdPessoa)+ ' AS IDPESSOA,' +CR_LF+
      '  ' +IntToStr(FIdEmpresa)+ ' AS IDEMPRESA,' +CR_LF+
      '  ' +QuotedStr(FMesRef)+ ' AS ANOMESINICIO,' +CR_LF;

    case (FTipoMotivo) of
      FOLHA_NORMAL,
      FOLHA_ESPECIAL : FSQL := FSQL + '  PD.IDREGRA AS IDREGRACALCULO' +CR_LF;
      FOLHA_FERIAS   : FSQL := FSQL + '  NVL(PD.IDREGRAFERIAS, PD.IDREGRA) AS IDREGRACALCULO' +CR_LF;
      FOLHA_13SAL    : FSQL := FSQL + '  NVL(PD.IDREGRA13, PD.IDREGRA) AS IDREGRACALCULO' +CR_LF;
    end;

    FSQL := FSQL +
      'FROM' +CR_LF+
      '  PROVDESC PD, RUBRICAXPESS RP' +CR_LF;

    case (FTipoMotivo) of
      FOLHA_FERIAS : sAux := 'FLGFERIAS';
      FOLHA_13SAL  : sAux := 'FLGDECIMOTERCEIRO';
    end;

    if (FTipoMotivo in [FOLHA_FERIAS, FOLHA_13SAL]) then
      FSQL := FSQL +
        ', (SELECT RR.IDRUBPRINC' +CR_LF+
        '   FROM   RUBXRUB RR, PROVDESC PD' +CR_LF+
        '   WHERE  (PD.' +sAux+ ' = 1) AND' +CR_LF+
        '          (PD.IDPROVENTO = RR.IDRUBSECUND)) RUB_RUB' +CR_LF;

    FSQL := FSQL + 'WHERE' +CR_LF;

    case (FTipoMotivo) of
      FOLHA_NORMAL,
      FOLHA_ESPECIAL : FSQL := FSQL + '  (PD.IDREGRA IS NOT NULL) AND' +CR_LF;
      FOLHA_FERIAS   : FSQL := FSQL + '  (NVL(PD.IDREGRAFERIAS, PD.IDREGRA) IS NOT NULL) AND' +CR_LF;
      FOLHA_13SAL    : FSQL := FSQL + '  (NVL(PD.IDREGRA13, PD.IDREGRA) IS NOT NULL) AND' +CR_LF;
    end;

    FSQL := FSQL +
      '  (RP.IDPESSOA        = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
      '  (PD.FLGESPECIAL     > 0) AND' +CR_LF+
      '  (PD.NUMPRIORIDADE  IS NOT NULL) AND' +CR_LF+
      '  (PD.IDPROVENTO      = RP.IDRUBRICA) AND' +CR_LF+
      '  (PD.IDPROVENTO NOT IN (SELECT DISTINCT IDRUBSECUND FROM RUBXRUB)) AND' +CR_LF;

    case (FTipoMotivo) of
      FOLHA_NORMAL,
      FOLHA_ESPECIAL :
      begin
        if (FIdMotivo = FIdMotivoPadrao) then
          FSQL := FSQL + '  (PD.FLGSALFAMILIA   = 1)'
        else
          FSQL := FSQL + '  (PD.FLGSALFAMILIA   = 0)';
      end;
      FOLHA_FERIAS,
      FOLHA_13SAL : FSQL := FSQL +
        '  ((PD.' +sAux+ '   = 1) OR' +CR_LF+
        '   (PD.IDPROVENTO   = RUB_RUB.IDRUBPRINC))';
    end;

    if (FListaIdRubrica <> '') then
    begin
      FSQL := FSQL +' AND' +CR_LF;

      if (Pos(',',FListaIdRubrica) > 0) then
        FSQL := FSQL + '  ((PD.IDPROVENTO    IN (' +FListaIdRubrica+ ')) OR' +CR_LF
      else
        FSQL := FSQL + '  ((PD.IDPROVENTO     = ' +FListaIdRubrica+ ') OR' +CR_LF;

      FSQL := FSQL +
        '   (PD.IDPROVENTO    IN (SELECT DISTINCT IDRUBPRINC' +CR_LF+
        '                         FROM   RUBXRUB' +CR_LF;

      if (Pos(',',FListaIdRubrica) > 0) then
        FSQL := FSQL + '                         WHERE  (IDRUBSECUND IN (' +FListaIdRubrica+ ')))))'
      else
        FSQL := FSQL + '                         WHERE  (IDRUBSECUND  = ' +FListaIdRubrica+ '))))';
    end;

    FSQL := FSQL +CR_LF+
      'ORDER BY' +CR_LF+
      '  NUMPRIORIDADE, IDPROVENTO';

    FCdsAux.Close;
    FCdsAux.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo :=
        CMTranslate('* Ao preparar Rubricas dependentes somente de Regras/Formas de Cálculo.') +
        MSG_ERRO+ E.Message;
      Result := false;
    end;
  end;
end;

procedure TCtrlGeraFolPagNormal.InitRetroativo;
var
  c: integer;
begin
  FTotSemBase := 0;
  if (FGerarRetroativo) then
  begin
    for c:=0 to FListaRubBase.Count-1 do
    begin
      if (Trim(FListaRubBase.GetFieldItem(c,2)) = 'XXXXXXXXXX') then
      begin
        Inc(FTotSemBase);
        FListaResultSemBase.Add(Trim(FListaRubResult.GetFieldItem(c,2)));
      end;
    end;
  end;
end;

function TCtrlGeraFolPagNormal.GetValorRubrica(ListaIdRubrica, AnoBarraMes: string): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  SUM(VALORPROVENTO) AS VALOR' +CR_LF+
    'FROM' +CR_LF+
    '  HISTRUBSAL' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA   = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '  (MES        = ' +QuotedStr(AnoBarraMes)+ ') AND' +CR_LF+
    IFF(Pos(',',ListaIdRubrica)>0,
      '  (IDRUBRICA IN (' +ListaIdRubrica+ '))',
      '  (IDRUBRICA  = ' +ListaIdRubrica+ ')'));

  Result := _CdsAux.FieldByName('VALOR').asFloat;
  _CdsAux.Free;
end;

procedure TCtrlGeraFolPagNormal.SetFeriasParaProcessada(DataIniPer: TDate;
  NumSeqFerias: integer);
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT FLGOCORRIDA' +CR_LF+
    'FROM   FERIAS' +CR_LF+
    'WHERE  (IDPESSOA         = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
    '       (INIPERIODOFERIAS = TO_DATE(' +QuotedStr(DateToStr(DataIniPer))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
    '       (NUMSEQ           = ' +IntToStr(NumSeqFerias)+ ')');

  if not(_CdsAux.IsEmpty) then
    ExecSQL(
      'UPDATE FERIAS' +CR_LF+
      'SET    FLGOCORRIDA = 1' +CR_LF+
      'WHERE  (IDPESSOA         = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '       (INIPERIODOFERIAS = TO_DATE(' +QuotedStr(DateToStr(DataIniPer))+ ',''DD/MM/YYYY'')) AND' +CR_LF+
      '       (NUMSEQ           = ' +IntToStr(NumSeqFerias)+ ')');

  _CdsAux.Free;
end;

procedure TCtrlGeraFolPagNormal.SetAntec13ParaProcessada;
begin
  if (FCdsAntec13.Locate('IDPESSOA', FIdPessoa, [])) then
    ExecSQL(
      'UPDATE ANTECIP13' +CR_LF+
      'SET    FLGOCORRIDA = 1' +CR_LF+
      'WHERE  (IDPESSOA = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '       (ANO      = ' +FCdsAntec13.FieldByName('ANO').asString+ ') AND' +CR_LF+
      '       (MES      = ' +FCdsAntec13.FieldByName('MES').asString+ ')');
end;

function TCtrlGeraFolPagNormal.PrepararFerias: boolean;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  try
    FSQL :=
      'SELECT' +CR_LF+
      '  FR.INIPERIODOFERIAS, FR.INIGOZOFERIAS,' +CR_LF+
      '  FR.FIMGOZOFERIAS, FR.NUMSEQ, FR.FLGOCORRIDA';

    if (FUsaRAD) then
      FSQL := FSQL + ', RAD.FLGOK'
    else
      FSQL := FSQL + ', ''N'' AS FLGOK';

    FSQL := FSQL +CR_LF+
      'FROM' +CR_LF+
      '  FERIAS FR';

    if (FUsaRAD) then
      FSQL := FSQL + ', RADINSTPROCESSO RAD';

    FSQL := FSQL +CR_LF+
      'WHERE' +CR_LF+
      '  (FR.IDPESSOA    = ' +FloatToStr(FIdPessoa)+ ') AND' +CR_LF+
      '  (FR.FLGOCORRIDA = 0) AND' +CR_LF;

    if (FDataFeriasIni > FCdsParamRH.FieldByName('FERIASINI').asDateTime) then
      FSQL := FSQL + '  (TO_DATE(' +QuotedStr(DateToStr(FDataFeriasIni))+
        ',''DD/MM/YYYY'') <= FR.INIGOZOFERIAS) AND' +CR_LF
    else
      FSQL := FSQL + '  (TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASINI').asString)+
        ',''DD/MM/YYYY'') <= FR.INIGOZOFERIAS) AND' +CR_LF;

    if (FDataFeriasFim < FCdsParamRH.FieldByName('FERIASFIM').asDateTime) then
      FSQL := FSQL + '  (TO_DATE(' +QuotedStr(DateToStr(FDataFeriasFim))+
        ',''DD/MM/YYYY'') >= FR.INIGOZOFERIAS)'
    else
      FSQL := FSQL + '  (TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASFIM').asString)+
        ',''DD/MM/YYYY'') >= FR.INIGOZOFERIAS)';

    if (FUsaRAD) then
      FSQL := FSQL + 'AND(FR.IDPROCESSO  = RAD.IDPROCESSO(+))' +CR_LF;

    _CdsAux.Data := GetDataPacket(FSQL);

    FRADFeriasOk := not(_CdsAux.FieldByName('FLGOK').asString = 'N');
    FDataFer1 := _CdsAux.FieldByName('INIPERIODOFERIAS').asString;
    FDataFer2 := _CdsAux.FieldByName('INIGOZOFERIAS').asString;
    FDataFer3 := _CdsAux.FieldByName('FIMGOZOFERIAS').asString;
    FNumSeqFerias := _CdsAux.FieldByName('NUMSEQ').asInteger;
    FGerouFerias := false;
    FGerouAntec13 := false;

    FPodeGerarFerias := (FTipoMotivo = FOLHA_FERIAS) and (FDataFer2 <> '') and
      (_CdsAux.FieldByName('FLGOCORRIDA').asInteger = 0);

    FPodeGerarAntec13 := (FTipoMotivo = FOLHA_13SAL) and
      ((FPodeGerarFerias) or (FForcarGeracao13) or
       FCdsAntec13.Locate('IDPESSOA', FIdPessoa, []));

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := CMTranslate('* Ao preparar os dados das férias do Empregado ') +
        CR_LF+ FCdsFunc.FieldByName('NOME').asString +MSG_ERRO+ E.Message;
      Result := false;
    end;
  end;
  _CdsAux.Free;
end;

function TCtrlGeraFolPagNormal.PrepararRubEspeciais: boolean;
var
  sAux: string;
begin
  Result := inherited PrepararRubEspeciais;
  try
    FSQL :=
      'SELECT DISTINCT' +CR_LF+
      '  PD.IDPROVENTO, PD.NUMPRIORIDADE, RP.CODPROVDESC, PD.CODRUBCLT,' +CR_LF+
      '  PD.FLGESPECIAL, PD.FLGCONSTAFOLHA, PD.FLGDECIMOTERCEIRO, PD.FLGFERIAS,' +CR_LF+
      '  PD.FLGSALFAMILIA, PD.FLGRESCISAO, PD.FLGDESCONTO, PD.IDREGRA, PD.IDREGRA13,' +CR_LF+
      '  PD.IDREGRAFERIAS, PD.IDREGRARESCISAO, RR.INDPERIODO, RR.FLGTIPOFOLHA,' +CR_LF+
      '  0.00 AS VALESPECIAIS' +CR_LF+
      'FROM' +CR_LF+
      '  PROVDESC PD, RUBXRUB RR, RUBRICAXPESS RP' +CR_LF;

    if (FTipoMotivo in [FOLHA_NORMAL,FOLHA_ESPECIAL]) and (FIdMotivo <> FIdMotivoPadrao) then
      FSQL := FSQL +
        ' ,(SELECT R.IDRUBSECUND AS IDRUB' +CR_LF+
        '   FROM   RUBXRUB R, PROVDESC P' +CR_LF+
        '   WHERE  (P.FLGFERIAS         = 0) AND' +CR_LF+
        '          (P.FLGDECIMOTERCEIRO = 0) AND' +CR_LF+
        '          (P.FLGSALFAMILIA     = 0) AND' +CR_LF+
        '          (P.IDPROVENTO        = R.IDRUBPRINC)) RUB_RUB_ESP' +CR_LF;

    case (FTipoMotivo) of
      FOLHA_FERIAS : sAux := 'FLGFERIAS';
      FOLHA_13SAL  : sAux := 'FLGDECIMOTERCEIRO';
    end;

    if (FTipoMotivo in [FOLHA_FERIAS, FOLHA_13SAL]) then
      FSQL := FSQL +
        ' ,(SELECT R.IDRUBPRINC AS IDRUB' +CR_LF+
        '   FROM   RUBXRUB R, PROVDESC P' +CR_LF+
        '   WHERE  (P.' +sAux+ ' = 1) AND' +CR_LF+
        '          (R.IDRUBSECUND = P.IDPROVENTO)' +CR_LF+
        '   UNION' +CR_LF+
        '   SELECT R.IDRUBSECUND AS IDRUB' +CR_LF+
        '   FROM   RUBXRUB R, PROVDESC P' +CR_LF+
        '   WHERE  (P.' +sAux+ ' = 1) AND' +CR_LF+
        '          (P.IDPROVENTO   = R.IDRUBPRINC) AND' +CR_LF+
        '          (R.FLGTIPOFOLHA = 1)) RUB_RUB' +CR_LF;

    FSQL := FSQL +
      'WHERE' +CR_LF;

    if (Pos(',',FListaIdEmpresa) > 0) then
      FSQL := FSQL + '  (RP.IDPESSOA      IN (' +FListaIdEmpresa+ ')) AND' +CR_LF
    else
      FSQL := FSQL + '  (RP.IDPESSOA       = ' +FListaIdEmpresa+ ') AND' +CR_LF;

    FSQL := FSQL +
      '  (RP.IDRUBRICA      = PD.IDPROVENTO) AND' +CR_LF+
      '  (PD.IDPROVENTO     = RR.IDRUBSECUND) AND' +CR_LF+
      '  (PD.FLGESPECIAL    > 0) AND' +CR_LF+
      '  (PD.NUMPRIORIDADE IS NOT NULL)';

    if (FTipoMotivo in [FOLHA_NORMAL,FOLHA_ESPECIAL]) and (FIdMotivo <> FIdMotivoPadrao) then
      FSQL := FSQL +' AND' +CR_LF+
        '  ((PD.FLGSALFAMILIA = 0) OR' +CR_LF+
        '   (PD.IDPROVENTO    = RUB_RUB_ESP.IDRUB))';

    if (FTipoMotivo in [FOLHA_FERIAS, FOLHA_13SAL]) then
      FSQL := FSQL +' AND' +CR_LF+
        '  ((PD.' +sAux+ ' = 1) OR' +CR_LF+
        '   (PD.IDPROVENTO = RUB_RUB.IDRUB))';

    // Será processada a Folha Normal que está no ParamRH
    if (FTipoMotivo in [FOLHA_NORMAL,FOLHA_ESPECIAL]) and (FIdMotivo = FIdMotivoPadrao) then
      FSQL := FSQL +' AND' +CR_LF+
        '  (PD.FLGSALFAMILIA  = 1)';

    if (Trim(FListaIdRubrica) <> '') then
    begin
      FSQL := FSQL +' AND' +CR_LF+
        '  NOT((RR.IDRUBPRINC IS NOT NULL) AND' +CR_LF;

      if (Pos(',',FListaIdRubrica) > 0) then
        FSQL := FSQL + '      (RR.IDRUBPRINC NOT IN (' +FListaIdRubrica+ ')) AND' +CR_LF
      else
        FSQL := FSQL + '      (RR.IDRUBPRINC     <> ' +FListaIdRubrica+ ') AND' +CR_LF;

      FSQL := FSQL + '      (RR.IDRUBSECUND IS NOT NULL) AND' +CR_LF;

      if (Pos(',',FListaIdRubrica) > 0) then
        FSQL := FSQL + '      (RR.IDRUBSECUND NOT IN (' +FListaIdRubrica+ ')))'
      else
        FSQL := FSQL + '      (RR.IDRUBSECUND     <> ' +FListaIdRubrica+ '))';
    end;

    FSQL := FSQL +CR_LF+
      'ORDER BY' +CR_LF+
      '  NUMPRIORIDADE, IDPROVENTO, INDPERIODO, FLGTIPOFOLHA';

    FCdsRubEsp.Close;
    FCdsRubEsp.Data := GetDataPacket(FSQL);
    Result := true;
  except
    on E: Exception do
      MessageInfo := CMTranslate('* Ao carregar a lista das Rubricas Especiais.') +
        MSG_ERRO+ E.Message;
  end;
end;

procedure TCtrlGeraFolPagNormal.SetReferenciaRubDelolucaoFerias1;
begin
  FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
    StrToDate(FCtrlCalcRub.sDataFer2)))) +'/'+ IntToStr(FCtrlCalcRub.QtdParcFer);

  if (FTipoCliente = REFER) and
     (Copy(FCtrlCalcRub.sDataFer2,4,2) <> Copy(FCtrlCalcRub.sDataFer3,4,2)) and
     (Copy(FCtrlCalcRub.sDataFer3,1,2) > '04') then
    FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
      StrToDate(FCtrlCalcRub.sDataFer2)))-1) +'/'+
      IntToStr(FCtrlCalcRub.QtdParcFer);
end;

procedure TCtrlGeraFolPagNormal.SetReferenciaRubDelolucaoFerias2;
begin
  FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
    StrToDate(FCtrlCalcRub.sDataFer22)))) +'/'+ IntToStr(FCtrlCalcRub.QtdParcFer2);

  if (FTipoCliente = REFER) and
     (Copy(FCtrlCalcRub.sDataFer22,4,2) <> Copy(FCtrlCalcRub.sDataFer32,4,2)) and
     (Copy(FCtrlCalcRub.sDataFer32,1,2) > '04') then
    FReferencia := IntToStr(DifDataAnoMes(FMesRef, RetornaAnoMes(
      StrToDate(FCtrlCalcRub.sDataFer22)))-1) +'/'+
      IntToStr(FCtrlCalcRub.QtdParcFer2);
end;

function TCtrlGeraFolPagNormal.AlimentarPrevia: boolean;
begin
  EnviarMensagem(CMTranslate('Alimentando Prévia com valores armazenados no mês...'));
  try
    Result := ExecSQL(
      'INSERT INTO PREVIAFOLPAG (' +CR_LF+
      '  IDPESSOA, MESCOBRANCA, IDMOTIVO, MES, IDPESSJUR, REFERENCIA, IDRUBRICA,' +CR_LF+
      '  CODPROVDESC, IDRETROATIVO, CODMOEDA, VALORPROVENTO, IDREGRACALCULO,' +CR_LF+
      '  FLGCOMPOESALPART, FLGCOMPOESALBENEF, FLGIRRF, VALORCOTAS, SEQRUBRICA,' +CR_LF+
      '  VLRANTRETROATIVO, IDPATRO, FLGCOMPOEREMTOTAL, FLGPREVIA, FLGSRB,' +CR_LF+
      '  IDRESPONSAVEL, IDLANCIRRF, FLGCONCESSAO)' +CR_LF+
      'SELECT' +CR_LF+
      '  H.IDPESSOA, H.MESCOBRANCA, H.IDMOTIVO, H.MES, H.IDPESSJUR, H.REFERENCIA,' +CR_LF+
      '  H.IDRUBRICA, H.CODPROVDESC, H.IDRETROATIVO, H.CODMOEDA, H.VALORPROVENTO,' +CR_LF+
      '  H.IDREGRACALCULO, H.FLGCOMPOESALPART, H.FLGCOMPOESALBENEF, H.FLGIRRF,' +CR_LF+
      '  H.VALORCOTAS, H.SEQRUBRICA, H.VLRANTRETROATIVO, H.IDPATRO, H.FLGCOMPOEREMTOTAL,' +CR_LF+
      '  H.FLGPREVIA, H.FLGSRB, H.IDRESPONSAVEL, H.IDLANCIRRF, H.FLGCONCESSAO' +CR_LF+
      'FROM' +CR_LF+
      '  HISTRUBSAL H, FUNCIONARIO F' +CR_LF+
      'WHERE' +CR_LF+
      '  (H.MES           = ' +QuotedStr(FMesRef)+ ') AND' +CR_LF+
      '  (H.IDMOTIVO      = ' +IntToStr(FIdMotivo)+ ') AND' +CR_LF+
      IFF(FListaEmpregado<>'',
        IFF(Pos(',', FListaEmpregado)>0,
          // '  (F.IDPESSOA     IN (' +FListaEmpregado+ ')',
          QuebrarListaFiltro(2, '(F.IDPESSOA  ', FListaEmpregado, 50)+ ' AND',    // ECF 20/07/05
          '  (F.IDPESSOA      = ' +FListaEmpregado+ ') AND') +CR_LF, '')+
      IFF(Pos(',', FListaTipoContrato)>0,
        '  (F.TIPOCONTRATO IN (' +QuotedListaString(FListaTipoContrato, ',')+ ')',
        '  (F.TIPOCONTRATO  = ' +QuotedStr(FListaTipoContrato))+ ') AND' +CR_LF+
      '  (F.IDPESSOA      = H.IDPESSOA)');

    if not(Result) then
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      MessageInfo := CMTranslate('* Não foi possível alimentar a Prévia.') +
        MSG_ERRO+ E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlGeraFolPagNormal.ApagarPrevia: boolean;
var
  sTiposFolha: string;
begin
  Result := inherited ApagarPrevia;
  try
    // Criação da Lista de Empregados Selecionados
    if (FIdMotivo > 0) then
      sTiposFolha := IntToStr(FIdMotivo)
    else
      sTiposFolha := IntToStr(FIdMotivoPadrao);

    FSQL := '';
    if (FOpcaoPrevia in [1,3]) or ((FOpcaoPrevia = 2) and (FListaEmpregado <> '')) then
    begin
      FSQL := 'WHERE ';

      if (FOpcaoPrevia in [1,3]) then
        if (Pos(',', sTiposFolha) = 0) then
          FSQL := FSQL + '(IDMOTIVO = ' +sTiposFolha+ ')'
        else
          FSQL := FSQL + '(IDMOTIVO IN (' +sTiposFolha+ '))';

      if (FOpcaoPrevia = 3) and (FListaEmpregado <> '') then
        FSQL := FSQL + ' AND ';

      if (FOpcaoPrevia in [2,3]) and (FListaEmpregado <> '') then
        if (Pos(',', FListaEmpregado) = 0) then
          FSQL := FSQL + '(IDPESSOA = ' +FListaEmpregado+ ')'
        else
          // FSQL := FSQL + '(IDPESSOA IN (' +FListaEmpregado+ '))';
          FSQL := FSQL + QuebrarListaFiltro(2, '(IDPESSOA  ', FListaEmpregado, 50); // ECF 20/07/05
    end;

    ExecSQL('DELETE FROM PREVIAFOLPAG ' + FSQL);
    Result := true;
  except
    on E: Exception do
      MessageInfo := CMTranslate('* Na eliminação da Prévia anterior.') +MSG_ERRO+ E.Message;
  end;
end;

function TCtrlGeraFolPagNormal.CalcRetroativo(IdRubrica: string; var ValBase: double): boolean;
var
  CdsAux: TCMClientDataSet;
  Ind, Ind1: integer;
  dValCalcRetro, dValorRub, dValRegra: double;
  sListaIdRubBase, sIdRubResult, sTipoCalc, sRubComp, sIdRegra: string;
begin
  CdsAux := TCMClientDataSet.Create(nil);
  Result := false;
  try
    try
      sRubComp := IdRubrica;
      for Ind1:=0 to FTotSemBase do
      begin
        if ((IdRubrica  = 'XXXXXXXXXX') and (Ind1 = FTotSemBase)) or
           ((IdRubrica <> 'XXXXXXXXXX') and (Ind1 > 0)) then
          break;

        sListaIdRubBase := '';
        sIdRubResult := '';
        dValCalcRetro := 0;

        if (IdRubrica = 'XXXXXXXXXX') then
          sRubComp := FListaResultSemBase[Ind1];

        // Montar Rubricas a serem processadas
        for Ind:=0 to FListaRubBase.Count-1 do
        begin
          if ((IdRubrica <> 'XXXXXXXXXX') and
               (Trim(FListaRubBase.GetFieldItem(Ind,2)) = sRubComp)) or
              ((IdRubrica = 'XXXXXXXXXX') and
               (Trim(FListaRubResult.GetFieldItem(Ind,2)) = sRubComp)) then
          begin
            sIdRubResult := Trim(FListaRubResult.GetFieldItem(Ind,2));
            sIdRegra := Trim(FListaRubResult.GetFieldItem(Ind,3));
            sTipoCalc := Trim(FListaRubTipoCalc[Ind]);

            if (IdRubrica <> 'XXXXXXXXXX') then
            begin
              if (Pos(',', sListaIdRubBase) = 0) then
                sListaIdRubBase := IdRubrica
              else
                sListaIdRubBase := sListaIdRubBase +','+ IdRubrica;
            end
            else
            if (FListaRubComplem.Count > 0) and
               (Trim(FListaRubComplem.GetFieldItem(Ind,2)) <> 'XXXXXXXXXX') then
            begin
              if (Pos(',', sListaIdRubBase) = 0) then
                sListaIdRubBase := Trim(FListaRubComplem.GetFieldItem(Ind,2))
              else
                sListaIdRubBase := sListaIdRubBase +','+ Trim(FListaRubComplem.GetFieldItem(Ind,2));
            end;
          end;
        end;

        // Não faz este ítem caso o usuário não selecione rubrica base alguma e o cálculo
        // não seja por Regra/Forma de Cálculo
        if (Trim(sListaIdRubBase) = '') and (sTipoCalc <> '3') then
          continue;

        for Ind:=1 to FQuantMesesRetroativo do
        begin
          if (Trim(sListaIdRubBase) <> '') then
          begin
            dValorRub := GetValorRubrica(sListaIdRubBase, IncDataAM(FMesRef, -Ind));

            if (dValorRub > 0) then
            begin
              case (sTipoCalc[1]) of
                '1' : if (dValorRub < ValBase) then
                        dValCalcRetro := dValCalcRetro + ValBase - dValorRub;
                '2' : dValCalcRetro := dValCalcRetro + Round(FPercRetroativo * dValorRub) / 100;
                '3' : ValBase := dValorRub;
              end;
            end;
          end;

          if (sTipoCalc = '3') then // Cálculo por Regra
          begin
            FCtrlCalcRub.CalcRetroativo(FIdMotivo, sIdRegra, FloatToStr(FIdPessoa), dValRegra,
              ValBase, FPercRetroativo, Ind, FTotalGeral_Prov, FTotalGeral_Desc);
            dValCalcRetro := dValCalcRetro + dValRegra;
          end;
        end;

        if (dValCalcRetro = 0) then
          continue;

        CdsAux.Close;
        CdsAux.Data := GetDataPacket(
          'SELECT' +CR_LF+
          '  RP.CODPROVDESC, PD.FLGDESCONTO, PD.CODRUBCLT' +CR_LF+
          'FROM' +CR_LF+
          '  RUBRICAXPESS RP, PROVDESC PD' +CR_LF+
          'WHERE' +CR_LF+
          '  (RP.IDRUBRICA = ' +sIdRubResult+ ') AND' +CR_LF+
          '  (RP.IDPESSOA  = ' +IntToStr(FIdEmpresa)+ ') AND' +CR_LF+
          '  (RP.IDRUBRICA = PD.IDPROVENTO)');

        if not(GravarRubrica(StrToFloat(sIdRubResult), CdsAux.FieldByName('CODPROVDESC').asString,
            FIdMotivo, FMesRef, FMesPagto, '***', 0, 0, 0, 1, 0, dValCalcRetro)) then
          raise Exception.Create(MessageInfo);

        SomarTotalGeral(CdsAux.FieldByName('FLGDESCONTO').asInteger, dValCalcRetro);
                
        if (FIntegra_PagEletronico) then
          SetUltValorLiquido(
            CdsAux.FieldByName('CODRUBCLT').asString, dValCalcRetro);

        if (FIntegra_CAP) then
          if not(GerarLinhaCAP(
                 StrToFloat(sIdRubResult), dValCalcRetro)) then
            raise Exception.Create(MessageInfo);

        // Acumula nas Rubricas Secundárias
        CdsAux.Close;
        CdsAux.Data := GetDataPacket(
          'SELECT' +CR_LF+
          '  IDRUBSECUND, FLGTIPOFOLHA, INDPERIODO, FLGACAOINCIDE' +CR_LF+
          'FROM' +CR_LF+
          '  RUBXRUB' +CR_LF+
          'WHERE' +CR_LF+
          '  (IDRUBPRINC  = ' +sIdRubResult+ ')');

        while not(CdsAux.EOF) do
        begin
          if (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
              VarArrayOf([CdsAux.FieldByName('IDRUBSECUND').asFloat,
                          CdsAux.FieldByName('FLGTIPOFOLHA').asInteger,
                          CdsAux.FieldByName('INDPERIODO').asInteger]), [])) then
          begin
            FCdsRubEsp.Edit;
            FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat :=
              FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat + dValCalcRetro *
              (1 - CdsAux.FieldByName('FLGACAOINCIDE').asInteger * 2);
            FCdsRubEsp.Post;
          end;
          CdsAux.Next;
        end;
      end;
      Result := true;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := CMTranslate('* No cálculo do Retroativo.') +MSG_ERRO+ E.Message;
      end;
    end;
  finally
    FreeAndNil(CdsAux);
  end;
end;

function TCtrlGeraFolPagNormal.GerarFolhaNormal: boolean;
var
  _ListaNumSeqRub: TStringList;
  bmMarca: TBookMark;

  sCodProvDescFGTS, sValor, sRefSal, sRefPto, sCodRubAux: string;
  bAchouBase, bProcRub, bTemParcelas, bBookMark: boolean;
  dIdRegraCalculo, dTotDesc, ValProv, dValBase, dValRubInd: double;
  IndTipoRub, c, TemLanc, QtdParc, QtdOcor: integer;
begin
  EnviarMensagem(CMTranslate('Processando dados da Pessoa indicada abaixo. Aguarde...'));
  Result := false;
  try
    FCdsAux := TCMClientDataSet.Create(nil);
    _ListaNumSeqRub := TStringList.Create;
    try
      FHoraInicialPessoa := Time;

      FNumRegProcessados := 0;
      FIdEmpresa := -1;
      dValBase := 0;

      while not(FCdsFunc.EOF) do
      begin                        
        Inc(FNumRegProcessados);
        FCdsRubEsp.CancelUpdates;

        // Mensagem do Empregado atual
        EnviarMensagem('', GetTempoDecorrido, FNumRegProcessados,
          CMTranslate('Matr: ') +Trim(FCdsFunc.FieldByName('MATRICULA').asString) +
          CMTranslate('  Nome: ') +Trim(FCdsFunc.FieldByName('NOME').asString));

        FIdPessoa := FCdsFunc.FieldByName('IDPESSOA').asInteger;
        dTotDesc := 0;
        FUltValorLiquido := 0;
        FTotalGeral_Prov := 0;
        FTotalGeral_Desc := 0;
        sRefSal := '';
        sRefPto := '';
        bTemParcelas := false;

        // Selecionar dados da Empresa do empregado atual se esta for diferente dos demais
        SelDadosEmpresaAtual;

        // Preparar Datas de Férias se for o caso
        if not(PrepararFerias) then
          raise Exception.Create(MessageInfo);

        // Próxima Pessoa para o caso de geração de férias mas a pessoa não possui
        if ((FTipoMotivo = FOLHA_FERIAS) and not(FPodeGerarFerias)) or
           ((FTipoMotivo = FOLHA_13SAL) and not(FPodeGerarAntec13)) then
        begin
          EnviarMensagem('', GetTempoDecorrido, 0, '', 0, 1);
          FCdsFunc.Next;
          continue;
        end;

        // Testar o RAD das Férias
        if (FPodeGerarFerias) and (FUsaRAD) and not(FRADFeriasOk) then
        begin
          FMsgResult :=
            CMTranslate('Processo RAD não está concluído. Férias não processadas.') +CR_LF+
            CMTranslate('Empregado.........: ') +FCdsFunc.FieldByName('NOME').asString +CR_LF+
            CMTranslate('Início Gozo Férias: ') +FDataFer2 +CR_LF+
            Replicate('-',50);

          EnviarMensagem('', GetTempoDecorrido, 0, '', 0, 1, FMsgResult);
          FCdsFunc.Next;
          continue;
        end;

        // Selecionar dados para a Integração CAP e geração do Arquivo de Pagamento Eletrônico
        SelDadosIntegracaoPessoa;

        for IndTipoRub:=1 to 2 do
        begin
          case (IndTipoRub) of
            1 : // Apanhar as Rubricas Lançadas (RUBRICAINDIV) que não dependem de outras
              if not(SelLancSemIncidencia) then
                raise Exception.Create(MessageInfo);

            2 : // Rubricas que só dependem da regra (não têm incidência, mas são especiais)
              if not(SelRubDependSomenteRegra) then
                raise Exception.Create(MessageInfo);
          end;

          // Geração do Histórico de Rubricas Salariais
          while not(FCdsAux.EOF) do
          begin
            bProcRub := (Trim(FListaIdRubrica) = '');

            if not(bProcRub) and
               (VerificaCodigoEm(FListaIdRubrica,
                FCdsAux.FieldByName('IDRUBRICA').asString, ',') = 1) then
            begin
              bProcRub := true;
            end;

            bProcRub := (bProcRub) and
              ((FTipoMotivo in [FOLHA_NORMAL, FOLHA_ESPECIAL]) and
               ((FIdMotivo = FIdMotivoPadrao) and
                (FCdsAux.FieldByName('FLGSALFAMILIA').asInteger = 1))  or
               ((FIdMotivo <> FIdMotivoPadrao) and
                (FCdsAux.FieldByName('FLGSALFAMILIA').asInteger = 0)))
              or
              ((FTipoMotivo = FOLHA_FERIAS) and
               (FCdsAux.FieldByName('FLGFERIAS').asInteger = 1))
              or
              ((FTipoMotivo = FOLHA_13SAL) and
               (FCdsAux.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1));

            // Verifica se o Afastado "tem" esta rubrica
            if (FCdsFunc.FieldByName('TIPOSIT').asString = 'F') and
               not(FCdsRubXSit.Locate('IDPROVENTO;IDSITFUNC',
                   VarArrayOf([FCdsAux.FieldByName('IDRUBRICA').asFloat,
                               FCdsFunc.FieldByName('IDSITFUNC').asInteger]), [])) then
            begin
              FCdsAux.Next;
              continue;
            end;

            bTemParcelas := (FCdsAux.FieldByName('FLGPERMANENTE').asInteger = 0) and
                            (FCdsAux.FieldByName('PARCELAS').asInteger > 1) and
                            (FCdsAux.FieldByName('CODRUBCLT').asString <> '90005');

            if (bTemParcelas) then
              FReferencia := Trim(IntToStr(FCdsAux.FieldByName('NUMOCORRENCIAS').asInteger + 1)) +
                '/' + Trim(FCdsAux.FieldByName('PARCELAS').asString)
            else
              FReferencia := '***';

            // CLT 90004 -> Anos Completos de Casa (Anuênio)
            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90004') then
            begin
              FReferencia := IntToStr(Round(Int((FNormalFim -
                FCdsFunc.FieldByName('DATAADMISSAO').asDateTime) / 365.25)));

              // Para a REFER estes anos não são calculados para a Referência mas
              // vêm de uma Tabela Genérica
              if (FTipoCliente = REFER) then
                CalcAnuenioREFER(FCdsFunc.FieldByName('MATRICULA').asString, FReferencia);
            end;

            if (FCdsAux.FieldByName('CODRUBCLT').asString = '40001') and (sRefSal <> '') then
              FReferencia := sRefSal;

            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90009') and (sRefPto <> '') then
              FReferencia := sRefPto;

            // CLT 90013 -> Avos para 13º
            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90013') then
              FReferencia := IntToStr(FCtrlCalcRub.Avos13) + '/12';

            // CLT 90014 -> Avos Integrais para Férias
            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90014') then
              FReferencia := IntToStr(FCtrlCalcRub.AvosFerias) + '/12';

            // CLT 90015 -> Avos para Férias (mod 12)
            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90015') then
              FReferencia := IntToStr(FCtrlCalcRub.AvosFerias mod 12 + IFF(StrFloat(
                FCtrlCalcRub.ValorRubrica(FCtrlCalcRub.TrazCodProvDescCLT('43691'))) > 0, 1,0))+
                '/12';

            // CLT 99xxx -> Raferencia com Valor da Rubrica indicada na CLT 99xxx
            if (Copy(FCdsAux.FieldByName('CODRUBCLT').asString,1,2) = '99') then
            begin
              sCodRubAux :=
                FCtrlCalcRub.TrazCodProvDescCLT(FCdsAux.FieldByName('CODRUBCLT').asString);

              FReferencia :=
                IFF(Pos('+', sCodRubAux) = 1, '', FCtrlCalcRub.ValorRubrica(
                  IFF(Pos('+', sCodRubAux) > 0,
                    copy(sCodRubAux, 1,
                      Pos('+', sCodRubAux)-1),
                    sCodRubAux))) +
                IFF(Pos('+', sCodRubAux) > 0,
                  trim(copy(sCodRubAux,Pos('+', sCodRubAux)+1,20)),
                  '');
            end;

            sValor := FCdsAux.FieldByName('VALORRUBRICA').asString;
            if (sValor = '') then
              ValProv := 0
            else
              ValProv := StrToFloat(sValor);

            // Testar se o valor deve ser recalculado
            dIdRegraCalculo := 0;
            if (Trim(FCdsAux.FieldByName('IDREGRACALCULO').asString) <> '') then
            begin
              if (ValProv <> 0) then
              begin
                if (FCdsAux.FieldByName('CODRUBCLT').asString <> '90005') and
                   not(bTemParcelas) then
                  FReferencia := sValor;

                if (StringEm(FCdsAux.FieldByName('CODRUBCLT').asString,
                         ['90002','40520','40530','40540']) <> -1) then
                  FReferencia := IntToStr(Trunc(ValProv/60)) + 'h:' +
                    IntToStr(Trunc((ValProv/60-Trunc(ValProv/60))*60)) + 'm';
              end;

              // Executa a Regra de Cálculo
              dIdRegraCalculo := FCdsAux.FieldByName('IDREGRACALCULO').asFloat;
              dValBase := 0;
              TemLanc := 2 - IndTipoRub;
              QtdParc := FCdsAux.FieldByName('PARCELAS').asInteger;
              QtdOcor := FCdsAux.FieldByName('NUMOCORRENCIAS').asInteger;
              FCtrlCalcRub.CalcBeneficio(FIdMotivo, FloatToStr(dIdRegraCalculo),
                FloatToStr(FIdPessoa), ValProv, dValBase, TemLanc, QtdParc, QtdOcor,
                FTotalGeral_Prov, FTotalGeral_Desc);

              if (ValProv <> 0) then
              begin
                ValProv := Round(ValProv*100)/100;
                sValor := FloatToStr(ValProv); // Regra/Forma de Cálculo retornou valor

                // CLT 90030 / 90031 -> Desconto Ferias Automatico (Devolução de Férias)
                // Referência = Diferença em meses entre a última férias e o mês de referência
                // da geração "/" Quantidade de Parcelas de Devolução das Férias
                if (FCdsAux.FieldByName('CODRUBCLT').asString = '90030') then
                  SetReferenciaRubDelolucaoFerias1;

                if (FCdsAux.FieldByName('CODRUBCLT').asString = '90031') then
                  SetReferenciaRubDelolucaoFerias2;
              end
              else
                sValor := '';
            end;

            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90006') then
              sRefSal := sValor;

            if (FCdsAux.FieldByName('CODRUBCLT').asString = '90008') then
              sRefPto := sValor;

            // Acumular nas Secundárias porque não vai gravar em HISTRUBSAL
            if not(bProcRub) then
            begin
              FCdsRubXRub.Filter := 'IDRUBPRINC = ' +FCdsAux.FieldByName('IDRUBRICA').asString;
              FCdsRubXRub.First;
              while not(FCdsRubXRub.EOF) do
              begin
                if (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                   VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                               FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                               FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), [])) then
                begin
                  if (FCdsAux.FieldByName('CODRUBCLT').asString = '90003') and
                     (FTipoMotivo in [FOLHA_NORMAL, FOLHA_ESPECIAL]) and
                     (FIdMotivo = FIdMotivoPadrao) then
                  begin
                    FCdsRubXRub.Next;
                    continue;
                  end;
                  SomarValorRubEspecial(ValProv, dValBase, true);
                end;
                FCdsRubXRub.Next;
              end;
              FCdsAux.Next;
              continue;
            end;

            // Não existe no Histórico -> 1o. preparo
            if (sValor = '') then
              sValor := '0';

            if (ValProv <> 0) then
            begin
              if not(GravarRubrica(FCdsAux.FieldByName('IDRUBRICA').asFloat,
                FCdsAux.FieldByName('CODPROVDESC').asString, FIdMotivo, FMesRef, FMesPagto,
                IFF(FReferencia='', '***', FReferencia), dIdRegraCalculo, 0, 0, 0,
                FCdsAux.FieldByName('SEQRUBRICAINDIV').asInteger, ValProv)) then
              begin
                raise Exception.Create(MessageInfo);
              end;

              // Somar valor ao Total Geral
              SomarTotalGeral(FCdsAux.FieldByName('FLGDESCONTO').asInteger, ValProv);

              if (FPodeGerarFerias) and
                 (FCdsAux.FieldByName('FLGFERIAS').asInteger = 1) then
                FGerouFerias := true;

              if (FPodeGerarAntec13) and
                 (FCdsAux.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1) then
                FGerouAntec13 := true;

              // Calcular Retroativo
              if (FGerarRetroativo) and ((FSelTodasPessoasRetroativo) or
                 (VerificaCodigoEm(FListaIdFuncRetroativo, FloatToStr(FIdPessoa), ',') = 1)) then
              begin
                if not(CalcRetroativo(FCdsAux.FieldByName('IDRUBRICA').asString, ValProv)) then
                  raise Exception.Create(MessageInfo);
              end;

              if (FIntegra_PagEletronico) then
                SetUltValorLiquido(
                  FCdsAux.FieldByName('CODRUBCLT').asString, ValProv);

              if (FIntegra_CAP) then
                if not(GerarLinhaCAP(
                       FCdsAux.FieldByName('IDRUBRICA').asFloat, ValProv)) then
                  raise Exception.Create(MessageInfo);
            end;
            FCdsAux.Next;
          end;
        end;

        // Cálculo dos Descontos Previdenciários(FLGATRASODEVOL <> N), Assistenciais e
        // Empréstimos. Tem que ser de algum plano existente
        if (FProcTmpDesc) then
        begin
          FCdsDescFolha.Close;
          FCdsDescFolha.Data := ListDescFolha(FLimDem, 'V');
          ProcDescFolha(FIdMotivo, 0, 'V', dTotDesc, dValBase);
          FCdsDescFolha.Close;
          FCdsDescFolha.Data := ListDescFolha(FLimDem, 'T');
        end;

        // Processamento do que já está preparado em HISTRUBSAL ou PREVIAFOLPAG (Cf. o caso)
        // ---------------------------------------------------------------------------------
        // Selecionar Histórico de Rubricas do mês
        FCdsAux.Close;
        FCdsAux.Data := ListHistoricoPessoaMes;

        if (FCdsAux.RecordCount > 0) then
        begin
          while not(FCdsAux.EOF) do
          begin
            ValProv := FCdsAux.FieldByName('VALORPROVENTO').asFloat;

            // Armazena o Valor Informado
            dValBase := 0;
            if (FCdsRubIndiv.Locate('IDPESSOA;IDEMPRESA;IDRUBRICA;SEQRUBRICAINDIV',
                VarArrayOf([FCdsAux.FieldByName('IDPESSOA').asFloat, FIdEmpresa,
                            FCdsAux.FieldByName('IDRUBRICA').asFloat,
                            FCdsAux.FieldByName(CAMPO_SEQ_ORIGINAL).asInteger]), [])) then
            begin
              repeat
                if (FCdsRubIndiv.FieldByName('ANOMESINICIO').asString <= FMesRef) then
                begin
                  dValBase := FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat;

                  // Atualizar Número de Ocorrências
                  if (FProcesso = FINAL) then
                  begin
                    if not(SetRubricaIndiv_JaProcessada(FIdMotivo,
                         FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat,
                         FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger)) then
                    begin
                      raise Exception.Create(MessageInfo);
                    end;
                  end;
                end;
                FCdsRubIndiv.Next;
              until (FCdsRubIndiv.EOF) or
                    ((FCdsRubIndiv.FieldByName('IDPESSOA').asFloat <>
                      FCdsAux.FieldByName('IDPESSOA').asFloat) or
                     (FCdsRubIndiv.FieldByName('IDEMPRESA').asFloat <>
                      FCdsAux.FieldByName('IDPESSJUR').asFloat) or
                     (FCdsRubIndiv.FieldByName('IDRUBRICA').asFloat <>
                      FCdsAux.FieldByName('IDRUBRICA').asFloat) or
                     (FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asInteger <>
                      FCdsAux.FieldByName(CAMPO_SEQ_ORIGINAL).asInteger));
            end;

            // Soma Esta Rubrica Nas Bases que Ela Compõe
            FCdsRubXRub.Filter := 'IDRUBPRINC = ' + FCdsAux.FieldByName('IDRUBRICA').asString;
            FCdsRubXRub.First;

            while not(FCdsRubXRub.EOF) do
            begin
              if FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                 VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                             FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                             FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), []) then
              begin
                SomarValorRubEspecial(ValProv, dValBase, true);
              end;
              FCdsRubXRub.Next;
            end;
            FCdsAux.Next;
          end;
        end;

        // Processa Retroativo sem Rubricas Base
        ValProv := 0;
        if (FGerarRetroativo) and (FTotSemBase > 0) and ((FSelTodasPessoasRetroativo) or
           (VerificaCodigoEm(FListaIdFuncRetroativo, FloatToStr(FIdPessoa), ',') = 1)) then
        begin
          if not(CalcRetroativo('XXXXXXXXXX', ValProv)) then
            raise Exception.Create(MessageInfo);
        end;

        // Calcula Valor das Rubricas "Secundárias"
        FCdsRubEsp.First;
        while not(FCdsRubEsp.EOF) do
        begin
          if ((FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat <> 0) or
              (FCdsRubEsp.FieldByName('FLGESPECIAL').asInteger = 1) or
              (FCdsRubEsp.FieldByName('FLGCONSTAFOLHA').asInteger = 0) or
              ((FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1) and
               (FPodeGerarAntec13)) or
              ((FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 1) and
               (FPodeGerarFerias))) then
          begin
            // Verifica se o Afastado "tem" esta rubrica
            if (FCdsFunc.FieldByName('TIPOSIT').asString = 'F') and
               not(FCdsRubXSit.Locate('IDPROVENTO;IDSITFUNC',
                   VarArrayOf([FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                               FCdsFunc.FieldByName('IDSITFUNC').asInteger]), [])) then
            begin
              FCdsRubEsp.Next;
              continue;
            end;

            FCdsRubXRub.Filter := 'IDRUBPRINC = ' + FCdsRubEsp.FieldByName('IDPROVENTO').asString;
            FCdsRubXRub.First;

            sCodProvDescFGTS := FCdsRubEsp.FieldByName('CODPROVDESC').asString;
            bAchouBase := false;
            dValBase := 0;
            FReferencia := '***';

            // Calculo dos Descontos Previdenciários(FLGATRASODEVOL = N)
            // Tem que ser de qualquer plano que haja
            if (FProcTmpDesc) then
            begin
              dTotDesc := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;

              // Rotina para verificar se esta secundária entra em outras
              if (ProcDescFolha(FIdMotivo, FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                  'T', dTotDesc, dValBase)) then
              begin
                if (dTotDesc <> 0) then
                begin
                  bmMarca := FCdsRubEsp.GetBookmark;
                  bBookMark := false;

                  // Arredonda valor da Rubrica
                  ValProv := Round(dTotDesc * 100) / 100;

                  if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90006') then
                    sRefSal := FloatToStr(ValProv);

                  if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90008') then
                    sRefPto := FloatToStr(ValProv);

                  // CLT 90030 / 90031 -> Desconto Ferias Automatico (Devolução de Férias)
                  // Referência = Diferença em meses entre a última férias e o mês de referência
                  // da geração "/" Quantidade de Parcelas de Devolução das Férias
                  if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90030') then
                    SetReferenciaRubDelolucaoFerias1;

                  if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90031') then
                    SetReferenciaRubDelolucaoFerias2;

                  while not(FCdsRubXRub.EOF) and
                       (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90001') do
                  begin
                    if FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                         VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asInteger,
                                     FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                     FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), []) then
                    begin
                      bBookMark := true;
                      SomarValorRubEspecial(ValProv, dValBase, true);
                    end;
                    FCdsRubXRub.Next;
                  end;

                  if (bBookMark) then
                    FCdsRubEsp.GotoBookmark(bmMarca);
                  FCdsRubEsp.FreeBookmark(bmMarca);
                end;
                FCdsRubEsp.Next;
                continue;
              end;
            end;

            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90004') then
            begin
              FReferencia := IntToStr(Round(Int((FNormalFim -
                FCdsFunc.FieldByName('DATAADMISSAO').asDateTime) / 365.25)));

              if (FTipoCliente = REFER) then
                CalcAnuenioREFER(FCdsFunc.FieldByName('MATRICULA').asString, FReferencia);
            end;

            // Referência
            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '40001') and (sRefSal <> '') then
              FReferencia := sRefSal;

            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90009') and (sRefPto <> '') then
              FReferencia := sRefPto;

            // CLT 90013 -> Avos para 13º
            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90013') then
              FReferencia := IntToStr(FCtrlCalcRub.Avos13) + '/12';

            // CLT 90014 -> Avos Integrias para Férias
            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90014') then
              FReferencia := IntToStr(FCtrlCalcRub.AvosFerias) + '/12';

            // CLT 90015 -> Avos para Férias (mod 12)
            if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90015') then
              FReferencia := IntToStr(FCtrlCalcRub.AvosFerias mod 12 + IFF(StrFloat(
                FCtrlCalcRub.ValorRubrica(FCtrlCalcRub.TrazCodProvDescCLT('43691'))) > 0, 1,0))+
                '/12';

            // CLT 99xxx -> Raferencia com Valor da Rubrica indicada na CLT 99xxx
            if (copy(FCdsRubEsp.FieldByName('CODRUBCLT').asString,1,2) = '99') then
            begin
              sCodRubAux :=
                FCtrlCalcRub.TrazCodProvDescCLT(FCdsRubEsp.FieldByName('CODRUBCLT').asString);

              FReferencia :=
                IFF(Pos('+', sCodRubAux) = 1, '', FCtrlCalcRub.ValorRubrica(
                  IFF(Pos('+', sCodRubAux) > 0,
                    copy(sCodRubAux, 1,
                      Pos('+', sCodRubAux)-1),
                    sCodRubAux))) +
                IFF(Pos('+', sCodRubAux) > 0,
                  trim(copy(sCodRubAux,Pos('+', sCodRubAux)+1,20)),
                  '');
            end;

            // Regra/Forma de Cálculo a ser executada
            dIdRegraCalculo := FCdsRubEsp.FieldByName('IDREGRA').asFloat;
            if (FTipoMotivo = FOLHA_FERIAS) and
               not(FCdsRubEsp.FieldByName('IDREGRAFERIAS').IsNull) then
              dIdRegraCalculo := FCdsRubEsp.FieldByName('IDREGRAFERIAS').asFloat;

            if (FTipoMotivo = FOLHA_13SAL) and
               not(FCdsRubEsp.FieldByName('IDREGRA13').IsNull) then
              dIdRegraCalculo := FCdsRubEsp.FieldByName('IDREGRA13').asFloat;

            _ListaNumSeqRub.Clear;
            dValRubInd := 0;
            if (FCdsRubIndiv.Locate('IDPESSOA;IDEMPRESA;IDRUBRICA',
                VarArrayOf([FIdPessoa, FIdEmpresa,
                            FCdsRubEsp.FieldByName('IDPROVENTO').asFloat]), [])) then
            begin
              while (FCdsRubIndiv.FieldByName('IDPESSOA').asFloat = FIdPessoa) and
                    (FCdsRubIndiv.FieldByName('IDEMPRESA').asInteger = FIdEmpresa) and
                    (FCdsRubIndiv.FieldByName('IDRUBRICA').asInteger =
                     FCdsRubEsp.FieldByName('IDPROVENTO').asInteger) and
                    not(FCdsRubIndiv.EOF) do
              begin
                if (FCdsRubIndiv.FieldByName('ANOMESINICIO').asString <= FMesRef) then
                begin
                  bAchouBase := true;
                  dValRubInd := dValRubInd + FCdsRubIndiv.FieldByName('VALORRUBRICA').asFloat;
                  dIdRegraCalculo := FCdsRubIndiv.FieldByName('IDREGRACALCULO').asFloat;
                  _ListaNumSeqRub.Add(FCdsRubIndiv.FieldByName('SEQRUBRICAINDIV').asString);

                  bTemParcelas :=
                    (FCdsRubIndiv.FieldByName('FLGPERMANENTE').asInteger = 0) and
                    (FCdsRubIndiv.FieldByName('PARCELAS').asInteger > 1) and
                    (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90005');

                  // Guardar a Regra de Cálculo para o caso de existir
                  if (bTemParcelas) then
                    FReferencia := Trim(IntToStr(
                      FCdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger + 1)) +'/'+
                      Trim(FCdsRubIndiv.FieldByName('PARCELAS').asString);
                end;
                FCdsRubIndiv.Next;
              end;
            end;

            // Considerar a Regra em RubIndiv se esta Existir ou da Rubrica
            if (dIdRegraCalculo = 0) then
              ValProv := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat
            else
            begin
              if (bAchouBase) then
              begin
                ValProv := dValRubInd;

                if (ValProv <> 0) then
                begin
                  if (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90005') and
                     not(bTemParcelas) then
                    FReferencia := FloatToStr(ValProv);

                  if (StringEm(FCdsRubEsp.FieldByName('CODRUBCLT').asString,
                      ['90002','40520','40530','40540']) <> -1) then
                    FReferencia := IntToStr(Trunc(ValProv/60)) + 'h:' +
                      IntToStr(Trunc((ValProv/60-Trunc(ValProv/60))*60)) + 'm';
                end;
                TemLanc := 1;
                QtdParc := FCdsRubIndiv.FieldByName('PARCELAS').asInteger;
                QtdOcor := FCdsRubIndiv.FieldByName('NUMOCORRENCIAS').asInteger;
              end
              else
              begin
                ValProv := 0;
                TemLanc := 0;
                QtdParc := 0;
                QtdOcor := 0;
              end;
              dValBase := FCdsRubEsp.FieldByName('VALESPECIAIS').asFloat;

              FCtrlCalcRub.CalcBeneficio(FIdMotivo, FloatToStr(dIdRegraCalculo),
                FloatToStr(FIdPessoa), ValProv, dValBase, TemLanc, QtdParc, QtdOcor,
                FTotalGeral_Prov, FTotalGeral_Desc);
            end;

            // Rotina para verificar se esta secundária entra em outras
            if (ValProv <> 0) then
            begin
              bmMarca := FCdsRubEsp.GetBookmark;
              bBookMark := false;

              // Arredondar valor da Rubrica
              ValProv := Round(ValProv * 100) / 100;

              // Referência
              if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90006') then
                sRefSal := FloatToStr(ValProv);

              if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90008') then
                sRefPto := FloatToStr(ValProv);

              // CLT 90030 / 90031 -> Desconto Ferias Automatico (Devolução de Férias)
              // Referência = Diferença em meses entre a última férias e o mês de referência
              // da geração "/" Quantidade de Parcelas de Devolução das Férias
              if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90030') then
                SetReferenciaRubDelolucaoFerias1;

              if (FCdsRubEsp.FieldByName('CODRUBCLT').asString = '90031') then
                SetReferenciaRubDelolucaoFerias2;

              while not(FCdsRubXRub.EOF) and
                    (FCdsRubEsp.FieldByName('CODRUBCLT').asString <> '90001') do
              begin
                if (FCdsRubEsp.Locate('IDPROVENTO;FLGTIPOFOLHA;INDPERIODO',
                    VarArrayOf([FCdsRubXRub.FieldByName('IDRUBSECUND').asFloat,
                                FCdsRubXRub.FieldByName('FLGTIPOFOLHA').asInteger,
                                FCdsRubXRub.FieldByName('INDPERIODO').asInteger]), [])) then
                begin
                  bBookMark := true;
                  SomarValorRubEspecial(ValProv, dValRubInd, bAchouBase);
                end;
                FCdsRubXRub.Next;
              end;
              if (bBookMark) then
                FCdsRubEsp.GotoBookmark(bmMarca);
              FCdsRubEsp.FreeBookmark(bmMarca);
            end;

            // Calcular só se for especial ou se tiver lançamento em RubricaIndiv
            // Ou se vai entrar nos cálculos de férias e/ou 13.o
            if (not(bAchouBase) and (FCdsRubEsp.FieldByName('FLGESPECIAL').asInteger = 0)) or
               (((ValProv = 0) and
                (((FIdMotivo <> FIdMotivoPadrao) and
                  (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 1))
                   or
                  ((FIdMotivo = FIdMotivoPadrao) and
                   (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 0))))
               and
               ((not(FPodeGerarAntec13) or
                 (FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 0)) and
                (not(FPodeGerarFerias) or
                 (FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 0)))) then
            begin
              FCdsRubEsp.Next;
              continue;
            end;

            // Gravar o valor em HISTRUBSAL (FLGSALFAMILIA SIGNIFICA: "ENTRA NA FOLHA NORMAL?")
            if ((ValProv <> 0) or (bAchouBase)) and
               (
                 (
                   (FIdMotivo <> FIdMotivoPadrao) and
                   (
                     (FCdsRubEsp.FieldByName('FLGTIPOFOLHA').asInteger = 1) or
                     (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 0)
                   )
                 ) or
                 (
                   (FIdMotivo = FIdMotivoPadrao) and
                   (FCdsRubEsp.FieldByName('FLGTIPOFOLHA').asInteger = 0) and
                   (FCdsRubEsp.FieldByName('FLGSALFAMILIA').asInteger = 1)
                 ) or
                 (
                   (FPodeGerarFerias) and
                   (FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 1)
                 ) or
                 (
                   (FPodeGerarAntec13) and
                   (FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1)
                 )
               ) then
            begin
              if (ValProv <> 0) then
              begin
                if not(GravarRubrica(
                  FCdsRubEsp.FieldByName('IDPROVENTO').asFloat, sCodProvDescFGTS,
                  IFF(FCdsRubEsp.FieldByName('FLGTIPOFOLHA').asInteger=0,
                    FIdMotivo, FIdMotivoPadrao),
                  IncDataAM(FMesRef, FCdsRubEsp.FieldByName('INDPERIODO').asInteger),
                  IncDataAM(FMesPagto, FCdsRubEsp.FieldByName('INDPERIODO').asInteger),
                  IFF(FReferencia='', '***', FReferencia), dIdRegraCalculo, 0, 0, 1, 0, ValProv)) then
                begin
                  raise Exception.Create(MessageInfo);
                end;

                // Somar valor ao Total Geral
                SomarTotalGeral(FCdsRubEsp.FieldByName('FLGDESCONTO').asInteger, ValProv);

                if (FPodeGerarFerias) and (FCdsRubEsp.FieldByName('FLGFERIAS').asInteger = 1) then
                  FGerouFerias := true;

                if (FPodeGerarAntec13) and (FCdsRubEsp.FieldByName('FLGDECIMOTERCEIRO').asInteger = 1) then
                  FGerouAntec13 := true;

                // Calcular Retroativo
                if (FGerarRetroativo) and ((FSelTodasPessoasRetroativo) or
                   (VerificaCodigoEm(FListaIdFuncRetroativo, FloatToStr(FIdPessoa), ',') = 1)) then
                begin
                  if not(CalcRetroativo(FCdsRubEsp.FieldByName('IDPROVENTO').asString, ValProv)) then
                    raise Exception.Create(MessageInfo);
                end;

                if (FIntegra_PagEletronico) then
                  SetUltValorLiquido(
                    FCdsRubEsp.FieldByName('CODRUBCLT').asString, ValProv);

                if (FIntegra_CAP) then
                  if not(GerarLinhaCAP(
                         FCdsRubEsp.FieldByName('IDPROVENTO').asFloat, ValProv)) then
                    raise Exception.Create(MessageInfo);
              end;

              // Atualizar Número de Ocorrências
              if (bAchouBase) and (FProcesso = FINAL) then
              begin
                for c:=0 to _ListaNumSeqRub.Count-1 do
                  if not(SetRubricaIndiv_JaProcessada(FIdMotivo,
                     FCdsRubEsp.FieldByName('IDPROVENTO').asFloat,
                     StrToInt(_ListaNumSeqRub[c]))) then
                  begin
                    raise Exception.Create(MessageInfo);
                  end;
              end;
            end;
          end;
          FCdsRubEsp.Next;
        end;

        // Atualizar Flag das Férias
        if (FProcesso = FINAL) and ((FGerouFerias) or ((FTipoCliente = SERPROS) and
           (FIdMotivo = FIdMotivoPadrao) and (FDataFer1 <> ''))) then
        begin
          SetFeriasParaProcessada(StrToDate(FDataFer1), FNumSeqFerias);
        end;

        // Atualiza Flag da Antecipação do 13.o Salário
        if (FProcesso = FINAL) and ((FGerouAntec13) or ((FTipoCliente = SERPROS) and
           (FIdMotivo = FIdMotivoPadrao))) then
        begin
          SetAntec13ParaProcessada;
        end;

        // Adicionar contaliquido na query apenas para forma de pagto eletronico
        if (FIntegra_PagEletronico) then
          SetDadosPagEletronico;

        // Próxima pessoa
        FCdsFunc.Next;
        EnviarMensagem('', GetTempoDecorrido, 0, '', 0, 1);
      end;

      // Gravar CAP
      FNumDocGerados := '';
      if (FIntegra_CAP) then
        if not(GerarIntegracaoCAP) then
          raise Exception.Create(MessageInfo);

      // Gravar no Banco o Pagamento Eletrônico
      if (FIntegra_PagEletronico) then
        if not(GerarPagEletronico) then
          raise Exception.Create(MessageInfo);

      Result := true;
    finally
      FCdsAux.Free;
      _ListaNumSeqRub.Free;
    end;
  except
    on E: Exception do
      MessageInfo := E.Message;
  end;
end;

function TCtrlGeraFolPagNormal.Processar(const IAppCliente: OleVariant; Mes, Ano,
  TipoCliente: integer; TipoEmpresa: string; Processo: integer; DataProcessamento: TDateTime;
  TipoMotivo, IdMotivo, IdMotivoPadrao, OpcaoPrevia: integer; DataFeriasIni,
  DataFeriasFim: TDateTime; ListaIdEmpresa, ListaIdEstab, ListaEmpregado, ListaIdRubrica,
  ListaTipoContrato: string; GerarRetroativo: boolean; QuantMesesRetroativo: integer;
  PercRetroativo: double; ListaRubBaseRetroativo, ListaRubComplemRetroativo,
  ListaRubResultRetroativo, ListaTipoCalcRubRetroativo: string; SelTodasPessoasRetroativo: boolean;
  ListaIdFuncRetroativo: string; Integra_PagEletronico, Integra_CAP: boolean; DataPagamento,
  DataEmissao: TDateTime; RateioCC, CriarDocIndividual: boolean;
  const ContaPadrao_Favorecido: string; const IdPlano_ContaPadrao_Favorecido: integer;
  IdUsuario, CodTipDoc, CodPortForma: integer; DiretorioArqPag: string; UsaPlanoPatro,
  ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer;
  ListaTipoDesemb: string; UsaRAD, ForcarGeracao13, UsaLOG: boolean): boolean;
var
//  dTempo1, dTempo2: double;
  bTransacaoAberta: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessarGeracaoFolPagNormal(IAppCliente,
      FUsuXFilial, FUsuXCCusto, FIdUsuarioGeral, Mes, Ano, TipoCliente, FIdEmpresa,
      TipoEmpresa, FIdHotel, Processo, DataProcessamento, TipoMotivo, IdMotivo,
      IdMotivoPadrao, OpcaoPrevia, DataFeriasIni, DataFeriasFim, ListaIdEmpresa,
      ListaIdEstab, ListaEmpregado, ListaIdRubrica, ListaTipoContrato, GerarRetroativo,
      QuantMesesRetroativo, PercRetroativo, ListaRubBaseRetroativo,
      ListaRubComplemRetroativo, ListaRubResultRetroativo, ListaTipoCalcRubRetroativo,
      SelTodasPessoasRetroativo, ListaIdFuncRetroativo, Integra_PagEletronico,
      Integra_CAP, DataPagamento, DataEmissao, RateioCC, CriarDocIndividual,
      ContaPadrao_Favorecido, IdPlano_ContaPadrao_Favorecido, IdUsuario, CodTipDoc,
      CodPortForma, DiretorioArqPag, UsaPlanoPatro, ObrigaAbc, ObrigaCRespon,
      PlanoPrevGlobal, PatroGlobal, ListaTipoDesemb, UsaRAD, ForcarGeracao13, UsaLOG,
      FNumRegProcessados, FNumDocGerados, {dTempo1, dTempo2,}FTempoDecorridoTotal,
      FTempoDecorridoPessoa, FLOG);
//    FTempoDecorridoTotal := dTempo1;
//    FTempoDecorridoPessoa := dTempo2;
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    bTransacaoAberta := false;
    MessageInfo := '';
    FTempoDecorridoTotal := 0;

    FHoraInicial := Time;
    try
      // Atribuir variáveis
      FGeracaoFolhaNormal := true;
      FIAppCliente := IAppCliente;
      FIntegra_CAP := Integra_CAP;
      FIntegra_PagEletronico := Integra_PagEletronico;
      FTipoCliente := TipoCliente;
      FTipoEmpresa := TipoEmpresa;
      FProcesso := Processo;
      FDataProcessamento := DataProcessamento;
      FTipoMotivo := TipoMotivo;
      FIdMotivo := IdMotivo;
      FIdMotivoPadrao := IdMotivoPadrao;
      FOpcaoPrevia := OpcaoPrevia;
      FDataFeriasIni := DataFeriasIni;
      FDataFeriasFim := DataFeriasFim;
      FListaIdEmpresa := ListaIdEmpresa;
      FListaIdEstab := ListaIdEstab;
      FListaEmpregado := ListaEmpregado;
      FListaIdRubrica := ListaIdRubrica;
      FListaTipoContrato := ListaTipoContrato;
      FGerarRetroativo := GerarRetroativo;
      FQuantMesesRetroativo := QuantMesesRetroativo;
      FPercRetroativo := PercRetroativo;
      FSelTodasPessoasRetroativo := SelTodasPessoasRetroativo;
      FListaIdFuncRetroativo := ListaIdFuncRetroativo;
      FDataPagamento := DataPagamento;
      FDataEmissao := DataEmissao;
      FRateioCC := RateioCC;
      FCriarDocIndividual := CriarDocIndividual;
      FCodPortForma := CodPortForma;
      FDiretorioArqPag := DiretorioArqPag;
      FUsaPlanoPatro := UsaPlanoPatro;
      FPlanoPrevGlobal := PlanoPrevGlobal;
      FPatroGlobal := PatroGlobal;
      FListaTipoDesemb := ListaTipoDesemb;
      FUsaRAD := UsaRAD;
      FForcarGeracao13 := ForcarGeracao13;
      FContaPadrao_Favorecido := ContaPadrao_Favorecido;
      FIdPlano_ContaPadrao_Favorecido := IdPlano_ContaPadrao_Favorecido;

      FMesRef := IntToStr(Ano) +'/'+ PoeZero(Mes);
      FMesPagto := IntToStr(ExtraiAno(FDataProcessamento)) +'/'+
        PoeZero(ExtraiMes(FDataProcessamento));

      // Criação dos objetos de armazenamento
      if not(CriarObjetos_Geracao) then
        raise Exception.Create(MessageInfo);

      FCdsAntec13.Close;
      FCdsAntec13.Data := FCtrlAntec13.ListAntecipacao13(0, Mes, Ano);
      FCdsParamRH.Close;
      FCdsParamRH.Data := FCtrlParamRH.ListParamRH(FIdEmpresa,
        'NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, LIMDEM');
      FNormalFim := FCdsParamRH.FieldByName('NORMALFIM').asDateTime;
      FLimDem := FCdsParamRH.FieldByName('LIMDEM').asInteger;

      if (FGerarRetroativo) then
      begin
        FListaRubBase.Text := ListaRubBaseRetroativo;
        FListaRubComplem.Text := ListaRubComplemRetroativo;
        FListaRubResult.Text := ListaRubResultRetroativo;
        FListaRubTipoCalc.Text := ListaTipoCalcRubRetroativo;
        InitRetroativo;
      end;

      FCtrlIntegraCAPCAR_RH.CdsDocumentos := FCdsDocumentos;
      FCtrlIntegraCAPCAR_RH.ObrigaAbc := ObrigaAbc;
      FCtrlIntegraCAPCAR_RH.ObrigaCRespon := ObrigaCRespon;
      FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
      FCtrlIntegraCAPCAR_RH.IdModulo := MODFOL;
      FCtrlIntegraCAPCAR_RH.IdUsuario := IdUsuario;
      FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

      if (UsaLOG) then
        FCtrlCalcRub.LOG := '';

      FCtrlCalcRub.IdEmpresa := FIdEmpresa;
      FCtrlCalcRub.TipoEmpresa := FTipoEmpresa;
      FCtrlCalcRub.MostrarPassosExecucao := false;

      EnviarMensagem(CMTranslate('Iniciando Processo...'));

      FCtrlCalcRub.ListaIdPessoa := FListaEmpregado;
      FCtrlCalcRub.UsaLOG := UsaLOG;
      FCtrlCalcRub.IniFormaCalc(IFF(GerarRetroativo, GERACAO_RETROATIVO, GERACAO_NORMAL));

      // Abrir Querys auxiliares
      FCdsRubIndiv.Close;
      FCdsRubIndiv.Data := ListRubricaIndiv;

      FCdsRubXRub.Filter := '';
      FCdsRubXRub.Close;
      FCdsRubXRub.Data := ListRubXRub;
      FCdsRubXRub.Filtered := true;

      FCdsRubXSit.Close;
      FCdsRubXSit.Data := ListRubXSit;

      EnviarMensagem('', GetTempoDecorrido);

      if not(Init_Integracao) or not(AbrirSQLFunc) then
        raise Exception.Create(MessageInfo);

      EnviarMensagem('', GetTempoDecorrido);

      // Verificar se há lançamentos na TMPDESC para a(s) pessoa(s) envolvida(s) no processo
      if (FTipoEmpresa = 'P') then
        FProcTmpDesc := ExisteRegistro_TmpDesc(FListaEmpregado)
      else
        FProcTmpDesc := false;  

      // Preparar Rubrica Especiais (Rubricas de Incidência)
      if (PrepararRubEspeciais) then
        EnviarMensagem('', GetTempoDecorrido)
      else
        raise Exception.Create(MessageInfo);

      // Início da Transação
      StartTransaction;
      bTransacaoAberta := true;

      if (FProcesso = PREVIA) then
      begin
        FNomeTabela := 'PREVIAFOLPAG';

        // Apagar Prévia anterior de acordo com os parâmetros especificados
        if (FOpcaoPrevia < 4) then
        begin
          if (ApagarPrevia) then
            EnviarMensagem('', GetTempoDecorrido)
          else
            raise Exception.Create(MessageInfo);
        end;

        // Alimentar Prévia com valores armazenados no mês para o Tipo de Folha especificado
        if (AlimentarPrevia) then
          EnviarMensagem('', GetTempoDecorrido)
        else
          raise Exception.Create(MessageInfo);
      end
      else
        FNomeTabela := 'HISTRUBSAL';

      FCtrlCalcRub.NomeTabela := FNomeTabela;
      FCtrlCalcRub.MesRef := FMesRef;

      if not(GerarFolhaNormal) then
        raise Exception.Create(MessageInfo);

      Commit;

      MessageInfo := CMTranslate('Geração da Folha de Pagamento efetuada com sucesso.');

      if (FNumDocGerados <> '') then
        MessageInfo := MessageInfo +CR_LF+CR_LF+
          Replicate('*',40) +CR_LF+
          CMTranslate('AP(s) gerada(s):') +CR_LF+CR_LF+
          FNumDocGerados;

      Result := true;

      FTempoDecorridoTotal := Time - FHoraInicial;
      FTempoDecorridoPessoa := Time - FHoraInicialPessoa;
      EnviarMensagem('', GetTempoDecorrido);

      FCtrlCalcRub.FinishFormaCalc;
    except
      on E: Exception do
      begin
        Result := false;

        if (bTransacaoAberta) then
          Rollback;

        if (FTipoRetorno = RETORNO_AVISO) then
          MessageInfo := CMTranslate('A Geração da Folha de Pagamento foi interrompida devido a uma inconsistência nos dados.') +
            CR_LF+CR_LF+ E.Message
        else
          MessageInfo := CMTranslate('Ocorreu um erro na Geração da Folha de Pagamento.') +
            CR_LF+CR_LF+ E.Message;
      end;
    end;
    // Destruição dos objetos de armazenamento
    DestruirObjetos_Geracao;

    if (UsaLOG) then
      FLOG := FCtrlCalcRub.LOG;
  end;
end;

end.
