unit uCtrlCalcRub;

interface

uses Classes, SysUtils, Controls, Forms, uCMTypes, uCmDbObject, uCmControlObject, IvDictio,
  uCMClientDataSet, FatExpression, uTiposRegraMT, uCtrlRegra, uCtrlIRRF_RH,
  uCtrlCustomRH, uCtrlDiasTrab, uCtrlParamRH;

const
  GERACAO_NORMAL = 0;
  GERACAO_RESCISAO = 1;
  GERACAO_RETROATIVO = 2;

  NUM_MAX_PARAMETROS = 9;

type
  TCtrlCalcRub = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    // Executa a Expressão indicada
    function ExecFormaCalc(Expressao: string): double;
    // Executa a Regra indicada (utilizada para cálculo sequencial)
    function ExecRegra(NumRegra: string): string;
    // Executa a Forma de Cálculo indicada
    function FormaCalculo(IdRegra: string): double;
    // Executa a Função indicada
    function RetornaFuncao(Texto: string): string;
    // Retorna a Soma das ocorrências da Rubrica Especificada
    // (se TipoFolha = -1 faz para todos os tipos)
    function SomaHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa: string): string;
    // Retorna a soma das ocorrências das Rubricas encontradas no período informado
    // (QtdeMeses) a partir de uma determinada data (DataRef) para trás
    function TotalHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha: string;
      IdEmpresa, IdEstab, IdCargo, CBO: integer; CodCentroCusto: string): string;
    // Retorna a Média das ocorrências da Rubrica Especificada
    // (se TipoFolha = -1 faz para todos os tipos)
    function MediaHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa: string): string;
    // Retorna a Quantidade de ocorrências da Rubrica Especificada
    // (se TipoFolha = -1 faz para todos os tipos)
    function QtdeHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa: string): string;
    // Retorna o valor gerado no processo atual da Rubrica passada como parâmetro
    // Retorna a Qtde de dias trabalhados Mes correspondente a DataRef, conforme a OpcaoDiasTrab
    // 1 = Desconta só Admissão e Demissão
    // 2 = Desconta Admissão, Demissão, Afastamento e Retorno
    // 3 = Desconta Admissão, Demissão e Férias
    // 4 = Desconta Admissão, Demissão, Afastamento, Retorno e Férias
    function DiasTrab(DataRef, OpcaoDiasTrab: string): string;
    // Retorna a Qtde de dias de ferias cujo inicio de gozo seja em InicioFerias
    // Se OpcaoFerias = 0 Sem adicionar os dias do Abono Pecuniário
    // Se OpcaoFerias = 1 Com adição dos dias do Abono Pecuniário
    function DiasFerias(InicioFerias, OpcaoFerias: string): string;
    // Retorna a Qtde de dias de gozo de férias no Mês correspondente a DataRef
    function DiasFeriasNoMes(DataRef: string): string;
    // Retorna o Valor da Coluna da Tabela Genérica
    function TabGenerica(NomeTabela, ValorChave, ColPesquisa, ColConsulta, Opcao: string): string;
    // Retorna o Valor da Linha da Tabela Longa
    function TabLonga(Linha: string): string;
    // Retorna o Tipo de um campo de uma Tabela Genérica
    function TpDadoCons(NomeTabGener, Campo: string): string;
    // Retorna o Índice de Cotação de uma determinada Moeda
    function Indice(Indexador, Data, Exato: string): string;
    // Retorna o valor do IRRF
    function IRRF(NumDep, DataNasc, ValorBase, DataRef, TipodeResultado: string): string;
    // Retorna o maior entre os números indicados
    function Maximo(Formula: string): string;
    // Retorna o menor entre os números indicados
    function Minimo(Formula: string): string;
    // Formula de Arredondamento
    function ExecFuncaoROUND(Param1, Param2: string): double;
    // Retorna a diferença de meses entre datas considerando os dias
    function DifMesesArred(DataIni, DataFin: string): integer;
    // Retorna a quantidade de dependentes
    function QtdeDepen(DataRef, TipoDepen, IdadeMin, IdadeMax, OpcaoTempo, OpcaoDeficiente: string): string;
    // Retorna a quantidade de inscritos no plano, conforme as opções
    // utilizadas nos parâmetros
    function PlanAssQtd(Plano, DataRef, TipoDepen, IdadeMin, IdadeMax: string): string;
    // Retorna o valor de Referência do Plano
    function PlanAssVal(Plano: string): string;
    // Retorna a quantidade de pessoas orçadas
    function OrcamPess(Data: TDate; IdCargo, IdEmpresa, IdEstab: integer;
      CodCentroCusto: string): string;
    // Retorna a avaliação do treinamento informado
    function Avaliacao(Data: TDate; Tipo: integer): string;
    // Retorna a Quantidade de pessoas ou a soma dos Salários das pessoas selecionadas
    function TotalPessoal(Salario: boolean; IdEmpresa, IdEstab, IdCargo: integer;
      CodCentroCusto: string; CBO: integer; TipoSituacao: integer): string;
  private
    FCtrlRegra: TCtrlRegra;
    FFormaCalc: TFatExpression;
    FCtrlIRRF: TCtrlIRRF;
    FCtrlDiasTrab: TCtrlDiasTrab;
    FCtrlParamRH: TCtrlParamRH;

    FCdsFormaCalc: TCMClientDataSet;
    FCdsDadosFunc: TCMClientDataSet;
    FCdsDadosFuncAtual: TCMClientDataSet;
    FCdsDadosAfast: TCMClientDataSet;
    FCdsParamRH: TCMClientDataSet;

    FIdEmpresa: integer;

    FValorSalvo: double;

    FErroExecucao: boolean;

    FTipoEmpresa: string;
    FExecucaoPassos: string;
    FIdPessoa: string;
    FListaIdPessoa: string;
    FNomeTabela: string;

    FMesRef: string;
    FTipoFolha: integer;

    FArqLOG: TextFile;
    FLOG: string;
    FUsaLOG: boolean;
    FMostrarPassosExecucao: boolean;

    procedure SetIdEmpresa(Valor: integer);

    function GetValor(Valor: string): string;
    function FormatValor(Expressao: string): string;
    function ExecFuncaoIF(Param1, Param2, Param3: string): double;
    function ExecFuncaoTRUNCA(Param1, Param2: string): double;
    function GetLOG: string;
  public
    iUltAno13: integer;
    iUltMes13: integer;
    iUltFlgOc13: integer;
    iUltFlgAbo: integer;
    iUltFlgOcor: integer;
    iUltNumSq: integer;
    iUltQtdParc: integer;
    iUltQtdParc2: integer;
    iUltDiasSaldoFerias: integer;
    Ano13: integer;
    Mes13: integer;
    FlgOc13: integer;
    FlgAbo: integer;
    FlgOcor: integer;
    NumSq: integer;
    QtdParcFer: integer;
    QtdParcFer2: integer;
    DiasSaldoFerias: integer;
    FContRegQryIn: integer;
    iTemLanc: integer;
    iQtdParc: integer;
    iQtdOcor: integer;
    FMesRetroativo: integer;

    ValInfRubrica: double;
    ValBaseRubrica: double;
    ValUltSalChefe: double;
    ValSalChefe: double;
    ValTotProventos: double;
    ValTotDescontos: double;
    ValSalFuncao: double;
    ValUltSalFuncao: double;
    ValUltSalChefe2: double;
    ValSalChefe2: double;
    FPercRetroativo: double;

    sUltDataFer1: string;
    sUltDataFer2: string;
    sUltDataFer22: string;
    sUltDataFer3: string;
    sUltDataFer32: string;
    UltDataProx: TDate;
    sValor: string;
    sDataFer1: string;
    sDataFer2: string;
    sDataFer22: string;
    sDataFer3: string;
    sDataFer32: string;
    DataProx: TDate;
    FSQL: string;

    constructor Create; override;
    destructor  Destroy; override;

    // Inicializar cálculo das Regras/Formas de Cálculo
    procedure IniFormaCalc(TipoGeracao: integer);
    // Finalizar cálculo das Regras/Formas de Cálculo
    procedure FinishFormaCalc;
    // Calcula um Benefício baseando-se em Regra/Forma de Cálculo
    procedure CalcBeneficio(TipoFolha: integer; IdRegra, IdPessoa: string; var ValBene: double;
      ValBase: double; TemLanc, QtdParc, QtdOcor: integer; TotProv, TotDesc: double);
    // Calcula um Benefício baseando-se em Regra
    procedure CalcBeneficioRegra(IdRegra, IdPessoa: string; var ValBeneficio: double);
    // Calcula o Retroativo
    procedure CalcRetroativo(TipoFolha: integer; IdRegra, IdPessoa: string; var Valor: double;
      ValBase, Percentual: double; Mes: integer; TotProv, TotDesc: double);
    // Calcula o Valor do Processo corrigido
    function ValorAtualProcesso(const ValHist: double; const DataHist, IdMoeda, NumRegra,
      NumProc: string; const TipoCalc: integer): double;
    // Retorna os Avos do 13º da Pessoa Atual
    function Avos13: integer;
    // Retorna os Avos das Férias da Pessoa Atual
    function AvosFerias: integer;
    // Retorna a Qtde de Avos Perdidos por Afastamento no Período Informado
    // Se CodigoMotivo = -1 Todos os tipos de afastamento
    // Se CodigoMotivo for válido, traz os avos perdidos só por esse tipo
    function AvosPerdidos(Data1, Data2, CodigoMotivo: string): integer;
    // Retorna o valor gerado no processo atual da Rubrica passada como parâmetro
    function ValorRubrica(CodProvDesc: string): string;
    // Retorna o CodProvDesc da rubrica indicada em uma CLT do tipo 99xxx
    function TrazCodProvDescCLT(CodRubCLT: string): string;

    property IdEmpresa: integer read FIdEmpresa write SetIdEmpresa;
    property IdPessoa: string read FIdPessoa write FIdPessoa;
    property ListaIdPessoa: string read FListaIdPessoa write FListaIdPessoa;
    property TipoEmpresa: string read FTipoEmpresa write FTipoEmpresa;
    property NomeTabela: string read FNomeTabela write FNomeTabela;
    property MesRef: string read FMesRef write FMesRef;
    property ErroExecucao: boolean read FErroExecucao;
    property MostrarPassosExecucao: boolean read FMostrarPassosExecucao write FMostrarPassosExecucao;
    property ExecucaoPassos: string read FExecucaoPassos;
    property CdsFormaCalc: TCMClientDataSet read FCdsFormaCalc;
    property UsaLOG: boolean read FUsaLOG write FUsaLOG;
    property LOG: string read GetLOG write FLOG;
  end;

implementation

uses  Math, uMensErro, uCtrlFuncoesRH;
 //*DateUtils,StrUtils, uCMTraduzSql,
{ TCtrlCalcRub }

constructor TCtrlCalcRub.Create;
begin
  inherited;
  FCtrlRegra := TCtrlRegra.Create;
  FCtrlIRRF := TCtrlIRRF.Create;
  FCtrlDiasTrab := TCtrlDiasTrab.Create;
  FCtrlParamRH := TCtrlParamRH.Create(MODFOL);

  FFormaCalc := TFatExpression.Create(nil);
  FFormaCalc.EvaluateOrder := eoInternalFirst;

  FCdsFormaCalc := TCMClientDataSet.Create(nil);
  FCdsDadosFunc := TCMClientDataSet.Create(nil);
  FCdsDadosFuncAtual := TCMClientDataSet.Create(nil);
  FCdsDadosAfast := TCMClientDataSet.Create(nil);
  FCdsParamRH := TCMClientDataSet.Create(nil);

  FCtrlDiasTrab.CdsAfastPessoa := FCdsDadosAfast;

  FMostrarPassosExecucao := false;
  FExecucaoPassos := '';
  FUsaLOG := false;
end;

destructor TCtrlCalcRub.Destroy;
begin
  FreeObject(FCtrlDiasTrab);
  FreeObject(FCtrlRegra);
  FreeObject(FCtrlIRRF);
  FreeObject(FCtrlParamRH);

  FreeObject(FFormaCalc);

  FreeObject(FCdsFormaCalc);
  FreeObject(FCdsDadosFunc);
  FreeObject(FCdsDadosFuncAtual);
  FreeObject(FCdsDadosAfast);
  FreeObject(FCdsParamRH);
  inherited;
end;

procedure TCtrlCalcRub.AfterInitialize;
begin
  inherited;
  FCtrlDiasTrab.InitializeAs(Self);
  FCtrlRegra.InitializeAs(Self);
  FCtrlIRRF.InitializeAs(Self);
  FCtrlParamRH.InitializeAs(Self);

  GetSeparadorDecimalWindows;
  //*case TTipoBDPadrao(iTipoBD_Padrao) of
  //*  tbdOracle                      : GetSeparadorDecimalORACLE;
  //*  tbdSQLServer, tbdSQLServerOdbc : SepDecORACLE := '.';
    //tbdPostGree:
 //* end;
end;

procedure TCtrlCalcRub.DoChangeDataBase;
begin
  inherited;
//*  FCtrlDiasTrab.DataBaseName := DataBaseName;
//*  FCtrlRegra.DataBaseName := DataBaseName;
//*  FCtrlIRRF.DataBaseName := DataBaseName;
//*  FCtrlParamRH.DataBaseName := DataBaseName;
end;

procedure TCtrlCalcRub.SetIdEmpresa(Valor: integer);
begin
  if (FIdEmpresa <> Valor) then
  begin
    FIdEmpresa := Valor;
    FCtrlIRRF.CarregaFaixas(Valor);
  end;
end;

procedure TCtrlCalcRub.IniFormaCalc(TipoGeracao: integer);
var
  bUsaIdTomador: boolean;
  _CdsAux: TCMClientDataSet;
begin
  if (FUsaLOG) then
  try
    AssignFile(FArqLOG, 'LOG_FOL_PAG.TXT');
    Rewrite(FArqLOG);
  except
    FUsaLOG := false;
  end;

  FCdsParamRH.Close;
  FCdsParamRH.Data := FCtrlParamRH.ListParamRH(FIdEmpresa,
    'LIMADM, LIMDEM, NORMALINI, NORMALFIM, FERIASINI, FERIASFIM, PGTO13INI');

  FCdsFormaCalc.Close;
  FCdsFormaCalc.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  IDREGRA, DESCRICAOREGRA' +CR_LF+
    'FROM' +CR_LF+
    '  REGRA R' +CR_LF+
    'WHERE' +CR_LF+
    '  NOT EXISTS (SELECT DISTINCT IDREGRA' +CR_LF+
    '              FROM   ALGREGRA A' +CR_LF+
    '              WHERE  (A.IDREGRA = R.IDREGRA))');

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  COUNT(*) AS NUM' +CR_LF+
      'FROM' +CR_LF+
      '  FUNCIONARIO F, PESSOA P' +CR_LF+
      'WHERE' +CR_LF+
      IFF(FListaIdPessoa='', '',
        IFF(Pos(',',FListaIdPessoa)>0,
          QuebrarListaFiltro(2, '(F.IDPESSOA ', FListaIdPessoa, 50)+ ' AND',
          '  (F.IDPESSOA  = ' +FListaIdPessoa+ ') AND')+CR_LF)+
      '  (F.IDPESSOA  = P.IDPESSOA) AND' +CR_LF+
      '  (P.IDGRUPO  IS NOT NULL)');
    bUsaIdTomador := (_CdsAux.FieldByName('NUM').asInteger > 0);
  finally
    _CdsAux.Free;
  end;

  FSQL :=
    'SELECT' +CR_LF+
    IFF(bUsaIdTomador, '  P.IDGRUPO', '  0') + ' AS IDTOMADOR,' +CR_LF+
    '  PF.*, F.*, SF.TIPOSIT,' +CR_LF+
    '  AGB.IDBANCO AS IDBANCOSALARIO,' +CR_LF+
    '  ' +FCdsParamRH.FieldByName('LIMADM').asString+ ' AS LIMADM,' +CR_LF+
    '  ' +FCdsParamRH.FieldByName('LIMDEM').asString+ ' AS LIMDEM,' +CR_LF+
    '  TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASINI').asString)+ ',''DD/MM/YYYY'') AS FERIASINI,' +CR_LF+
    '  TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASFIM').asString)+ ',''DD/MM/YYYY'') AS FERIASFIM,'+CR_LF+
    '  C.IDFAIXASALARIAL, C.CODGRPFUNC, C.CODGRPTREIN, C.CODNIVEL, C.PONTOSHAY, C.CBO2002,'+CR_LF;

  if (TipoGeracao = GERACAO_RESCISAO) then
    FSQL := FSQL +
      '  F.DATADESLIGAMENTO + 1 -'+CR_LF+
      '    TO_NUMBER(TO_CHAR(F.DATADESLIGAMENTO,''DD'')) AS NORMALINI,'+CR_LF+
      '  ADD_MONTHS(F.DATADESLIGAMENTO,1) -'+CR_LF+
      '    TO_NUMBER(TO_CHAR(ADD_MONTHS(F.DATADESLIGAMENTO,1),''DD'')) AS NORMALFIM,'+CR_LF
  else
    FSQL := FSQL +
      '  TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('NORMALINI').asString)+ ',''DD/MM/YYYY'') AS NORMALINI,' +CR_LF+
      '  TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('NORMALFIM').asString)+ ',''DD/MM/YYYY'') AS NORMALFIM,' +CR_LF;

  FSQL := FSQL +
    '  HT.JORNADAMENSAL, F.IDEMPRESA AS IDPESSJUR, F.IDPESSOA AS IDTITULAR,'+CR_LF+
    '  FE.INIPERIODOFERIAS, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS,'+CR_LF+
    '  FE.FLGOCORRIDA, FE.QTDPARCDEVOL, FE.QTDIASABONO,'+CR_LF+
    '  FE.FLGABONO, FE.FLGOCORRIDA, FE.NUMSEQ,'+CR_LF+
    '  TO_DATE(SYSDATE,''DD/MM/YYYY'') AS PROXAQUISFER,'+CR_LF+
    '  0.00 AS VALORRUBRICA,'+CR_LF+
    '  0.00 AS BSRUBRICA,'+CR_LF+
    '  0.00 AS SALCHEFE,'+CR_LF+
    '  0.00 AS SALCHEFE2,'+CR_LF+
    '  0.00 AS SALFUNCAO,'+CR_LF+
    '  0.00 AS TOTALPROVENTOS,'+CR_LF+
    '  0.00 AS TOTALDESCONTOS,'+CR_LF+
    '  0.00 AS PERCRETRO,'+CR_LF+
    '  0 AS MESRETRO,'+CR_LF+
    '  0 AS TIPOFOLHA,'+CR_LF+
    '  0 AS TEMLANCAMENTO,'+CR_LF+
    '  0 AS PARCELAS,'+CR_LF+
    '  0 AS NUMOCORRENCIAS,'+CR_LF+
    '  0 AS SALDOFERIAS,'+CR_LF+
    '  0 AS ANO,'+CR_LF+
    '  0 AS MES,'+CR_LF+
    '  0 AS FLGOCORR13'+CR_LF+
    'FROM'+CR_LF+
    IFF(bUsaIdTomador, '  PESSOA P, ', '  ')+ 'PESSOAFISICA PF, FUNCIONARIO F, CARGO C, SITFUNC SF,'+CR_LF+
    '  HORATRAB HT, AGENCIABANCARIA AGB,'+CR_LF+
    '  (SELECT'+CR_LF+
    '     INIPERIODOFERIAS, INIGOZOFERIAS, NUMSEQ,'+CR_LF+
    '     FIMGOZOFERIAS, FLGOCORRIDA, FLGABONO,'+CR_LF+
    '     QTDPARCDEVOL, QTDIASABONO, IDPESSOA'+CR_LF+
    '   FROM'+CR_LF+
    '     FERIAS'+CR_LF+
    '   WHERE'+CR_LF+
    IFF(FListaIdPessoa='', '',
      IFF(Pos(',',FListaIdPessoa)>0,
        QuebrarListaFiltro(2, '(IDPESSOA  ', FListaIdPessoa, 50)+ ' AND',    // ECF 20/07/05
        '     (IDPESSOA   = ' +FListaIdPessoa+ ') AND')+CR_LF)+
    '     (INIGOZOFERIAS >= TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASINI').asString)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
    '     (INIGOZOFERIAS <= TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASFIM').asString)+ ',''DD/MM/YYYY''))) FE'+CR_LF+
//    '     (PR.FERIASINI <= FR.INIGOZOFERIAS) AND'+CR_LF+
//    '     (PR.FERIASFIM >= FR.INIGOZOFERIAS)) FE'+CR_LF+
    'WHERE'+CR_LF+
    IFF(FListaIdPessoa='', '',
      IFF(Pos(',',FListaIdPessoa)>0,
        QuebrarListaFiltro(2, '(F.IDPESSOA         ', FListaIdPessoa, 50)+ ' AND',    // ECF 20/07/05
        '  (F.IDPESSOA         = ' +FListaIdPessoa+ ') AND')+CR_LF)+
    '  (F.IDSITFUNC        = SF.IDSITFUNC) AND'+CR_LF+
    '  (F.IDCARGO          = C.IDCARGO) AND'+CR_LF+
    '  (F.IDPESSOA         = PF.IDPESSOA) AND'+CR_LF+
    IFF(bUsaIdTomador,
      '  (F.IDPESSOA         = P.IDPESSOA) AND'+CR_LF, '')+
    '  (F.IDAGENCIASALARIO = AGB.IDPESSOA(+)) AND'+CR_LF+
    '  (F.IDHORARIO        = HT.IDHORARIO(+)) AND'+CR_LF+
    '  (F.IDPESSOA         = FE.IDPESSOA(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  F.IDPESSOA, INIGOZOFERIAS';

  FCdsDadosFunc.Close;
  FCdsDadosFunc.Data := GetDataPacket(FSQL);
  FCdsDadosFuncAtual.Close;
  FCdsDadosFuncAtual.Data := FCdsDadosFunc.Data;
end;

procedure TCtrlCalcRub.FinishFormaCalc;
begin
  if (FUsaLOG) then
  try
    CloseFile(FArqLOG);
  except
  end;
end;

procedure TCtrlCalcRub.CalcBeneficio(TipoFolha: integer; IdRegra, IdPessoa: string;
  var ValBene: double; ValBase: double; TemLanc, QtdParc, QtdOcor: integer;
  TotProv, TotDesc: double);
var
  c: integer;
  bAlgRegra: boolean;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  FTipoFolha := TipoFolha;

  if (FUsaLOG) then
  begin
    WriteLn(FArqLOG,
      ('-->> [IdPessoa:  ') +IdPessoa+ ']'+CR_LF+
      ('  :: [Num Regra: ') +IdRegra+ ']'+CR_LF+
      ('   . Tipo Folha: ') +IntToStr(TipoFolha)+CR_LF+
      ('   . Tem Lanc:   ') +IntToStr(TemLanc)+CR_LF+
      ('   . Qtd Parc:   ') +IntToStr(QtdParc)+CR_LF+
      ('   . Qtd Ocor:   ') +IntToStr(QtdOcor)+CR_LF+
      ('   . Val Bene:   ') +FloatToStr(ValBene)+CR_LF+
      ('   . Val Base:   ') +FloatToStr(ValBase)+CR_LF+
      ('   . Tot Prov:   ') +FloatToStr(TotProv)+CR_LF+
      ('   . Tot Desc:   ') +FloatToStr(TotDesc)+CR_LF);
  end;

  iTemLanc := TemLanc;
  iQtdParc := QtdParc;
  iQtdOcor := QtdOcor;
  ValInfRubrica := ValBene;
  ValBaseRubrica := ValBase;
  ValTotProventos := TotProv;
  ValTotDescontos := TotDesc;

  bAlgRegra := not(FCdsFormaCalc.Locate('IDREGRA', IdRegra, []));

  if (IdPessoa = FIdPessoa) then
  begin
    Ano13 := iUltAno13;
    Mes13 := iUltMes13;
    FlgOc13 := iUltFlgOc13;
    FlgAbo := iUltFlgAbo;
    FlgOcor := iUltFlgOcor;
    NumSq := iUltNumSq;
    sDataFer1 := sUltDataFer1;
    sDataFer2 := sUltDataFer2;
    sDataFer3 := sUltDataFer3;
    sDataFer22 := sUltDataFer22;
    sDataFer32 := sUltDataFer32;
    DataProx := UltDataProx;
    QtdParcFer := iUltQtdParc;
    QtdParcFer2 := iUltQtdParc2;
    DiasSaldoFerias := iUltDiasSaldoFerias;
    ValSalChefe := ValUltSalChefe;
    ValSalChefe2 := ValUltSalChefe2;
    ValSalFuncao := ValUltSalFuncao;
  end
  else
  begin
    FIdPessoa := IdPessoa;
    ValSalChefe := 0;
    ValSalChefe2 := 0;
    ValSalFuncao := 0;
    FValorSalvo := 0;

    // Pega o Salário Atual do Chefe
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  FC.SALARIOATUAL AS SALARIO'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO F, FUNCIONARIO FC'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA = ' +IdPessoa+ ') AND'+CR_LF+
      '  (F.IDCHEFE  = FC.IDPESSOA)');

    if (_CdsAux.IsEmpty) then
      ValSalChefe := 0
    else
      ValSalChefe := _CdsAux.FieldByName('SALARIO').asFloat;

    // Pega o Salário do Chefe de acordo com o nível da Função
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  DECODE(PR.FLGDOISCARGOS,0,'+CR_LF+
      '    FC.SALARIOATUAL,'+CR_LF+
      '    DECODE(FC.IDFUNCAO,NULL,'+CR_LF+
      '      FC.SALARIOATUAL,'+CR_LF+
      '      DECODE(PR.FLGNIVELINDIV,0,'+CR_LF+
      '        FX.STEP1 * FP.FATOR,'+CR_LF+
      '        DECODE(FC.NIVELINDIV2,'+CR_LF+
      '          1, FX.STEP1 * FP.FATOR,'+CR_LF+
      '          2, FX.STEP2 * FP.FATOR,'+CR_LF+
      '          3, FX.STEP3 * FP.FATOR,'+CR_LF+
      '          4, FX.STEP4 * FP.FATOR,'+CR_LF+
      '          5, FX.STEP5 * FP.FATOR,'+CR_LF+
      '          6, FX.STEP6 * FP.FATOR,'+CR_LF+
      '          7, FX.STEP7 * FP.FATOR,'+CR_LF+
      '          8, FX.STEP8 * FP.FATOR,'+CR_LF+
      '          FX.STEP9 * FP.FATOR)'+CR_LF+
      '      )'+CR_LF+
      '    )'+CR_LF+
      '  ) AS SALARIO'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO F, FUNCIONARIO FC, FAIXASAL FX, CARGO C, PARAMRH PR,'+CR_LF+
      '  (SELECT IDFILIALPESSOA, NVL(FATORFAIXA,1) AS FATOR FROM FILIALPESSOA) FP'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA         = ' +IdPessoa+ ') AND'+CR_LF+
      '  (F.IDESTAB          = FP.IDFILIALPESSOA) AND'+CR_LF+
      '  (F.IDCHEFE          = FC.IDPESSOA) AND'+CR_LF+
      '  (FX.IDFAIXASALARIAL = DECODE(PR.FLGNIVELINDIV,1,DECODE(FC.IDFAIXAFUNCAO,NULL,FC.IDFAIXACARGO,FC.IDFAIXAFUNCAO),C.IDFAIXASALARIAL)) AND'+CR_LF+
      '  (C.IDCARGO          = DECODE(PR.FLGDOISCARGOS,0,FC.IDCARGO,DECODE(FC.IDFUNCAO,NULL,FC.IDCARGO,FC.IDFUNCAO)))');

    if (_CdsAux.IsEmpty) then
      ValSalChefe2 := 0
    else
      ValSalChefe2 := _CdsAux.FieldByName('SALARIO').asFloat;

    // Pega o Salário da Pessoa de acordo com o nível da Função
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  DECODE(PR.FLGDOISCARGOS,0,'+CR_LF+
      '    F.SALARIOATUAL,'+CR_LF+
      '    DECODE(F.IDFUNCAO,NULL,'+CR_LF+
      '      F.SALARIOATUAL,'+CR_LF+
      '      DECODE(PR.FLGNIVELINDIV,0,'+CR_LF+
      '        FX.STEP1 * FP.FATOR,'+CR_LF+
      '        DECODE(F.NIVELINDIV2,'+CR_LF+
      '          1, FX.STEP1 * FP.FATOR,'+CR_LF+
      '          2, FX.STEP2 * FP.FATOR,'+CR_LF+
      '          3, FX.STEP3 * FP.FATOR,'+CR_LF+
      '          4, FX.STEP4 * FP.FATOR,'+CR_LF+
      '          5, FX.STEP5 * FP.FATOR,'+CR_LF+
      '          6, FX.STEP6 * FP.FATOR,'+CR_LF+
      '          7, FX.STEP7 * FP.FATOR,'+CR_LF+
      '          8, FX.STEP8 * FP.FATOR,'+CR_LF+
      '          FX.STEP9 * FP.FATOR)'+CR_LF+
      '      )'+CR_LF+
      '    )'+CR_LF+
      '  ) AS SALARIO'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO F, FAIXASAL FX, CARGO C, PARAMRH PR,'+CR_LF+
      '  (SELECT IDFILIALPESSOA, NVL(FATORFAIXA,1) AS FATOR FROM FILIALPESSOA) FP'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA         = ' +IdPessoa+ ') AND'+CR_LF+
      '  (F.IDESTAB          = FP.IDFILIALPESSOA) AND'+CR_LF+
      '  (FX.IDFAIXASALARIAL = DECODE(PR.FLGNIVELINDIV,1,DECODE(F.IDFAIXAFUNCAO,NULL,F.IDFAIXACARGO,F.IDFAIXAFUNCAO),C.IDFAIXASALARIAL)) AND'+CR_LF+
      '  (C.IDCARGO          = DECODE(PR.FLGDOISCARGOS,0,F.IDCARGO,DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO)))');

    if (_CdsAux.IsEmpty) then
      ValSalFuncao := 0
    else
      ValSalFuncao := _CdsAux.FieldByName('SALARIO').asFloat;

    // Período de férias entre o período de referência
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  INIPERIODOFERIAS, INIGOZOFERIAS, NUMSEQ,'+CR_LF+
      '  FIMGOZOFERIAS, FLGOCORRIDA, FLGABONO, QTDPARCDEVOL'+CR_LF+
      'FROM'+CR_LF+
      '  FERIAS'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA      = ' +IdPessoa+ ') AND'+CR_LF+
      '  (INIGOZOFERIAS >= TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASINI').asString)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
      '  (INIGOZOFERIAS <= TO_DATE(' +QuotedStr(FCdsParamRH.FieldByName('FERIASFIM').asString)+ ',''DD/MM/YYYY''))'+CR_LF+
//      '  (PR.FERIASINI <= FR.INIGOZOFERIAS) AND'+CR_LF+
//      '  (PR.FERIASFIM >= FR.INIGOZOFERIAS)'+CR_LF+
      'ORDER BY'+CR_LF+
      '  INIGOZOFERIAS');

    if (_CdsAux.IsEmpty) then
    begin
      sDataFer1 := '';
      sDataFer2 := '';
      sDataFer3 := '';
      FlgAbo := 0;
      FlgOcor := 0;
      NumSq := 0;
      QtdParcFer := 0;
      sDataFer22 := '';
      QtdParcFer2 := 0;
      sDataFer22 := '';
      sDataFer32 := '';
      QtdParcFer2 := 0;
    end
    else
    begin
      sDataFer1 := _CdsAux.FieldByName('INIPERIODOFERIAS').asString;
      sDataFer2 := _CdsAux.FieldByName('INIGOZOFERIAS').asString;
      sDataFer3 := _CdsAux.FieldByName('FIMGOZOFERIAS').asString;
      FlgAbo := _CdsAux.FieldByName('FLGABONO').asInteger;
      FlgOcor := _CdsAux.FieldByName('FLGOCORRIDA').asInteger;
      NumSq := _CdsAux.FieldByName('NUMSEQ').asInteger;
      QtdParcFer := _CdsAux.FieldByName('QTDPARCDEVOL').asInteger;

      sDataFer22 := '';
      QtdParcFer2 := 0;
      _CdsAux.Next;
      if not(_CdsAux.EOF) then
      begin
        sDataFer22 := _CdsAux.FieldByName('INIGOZOFERIAS').asString;
        sDataFer32 := _CdsAux.FieldByName('FIMGOZOFERIAS').asString;
        QtdParcFer2 := _CdsAux.FieldByName('QTDPARCDEVOL').asInteger;
      end;
    end;

    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  MIN(INIPERIODOFERIAS) AS PROXAQUISFER'+CR_LF+
      'FROM'+CR_LF+
      '  FERIAS'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA    = ' +IdPessoa+ ') AND'+CR_LF+
      '  (FLGOCORRIDA = 0)');

    if (_CdsAux.FieldByName('PROXAQUISFER').IsNull) then
    begin
      _CdsAux.Close;
      _CdsAux.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  MAX(INIPERIODOFERIAS) AS PROXAQUISFER'+CR_LF+
        'FROM'+CR_LF+
        '  FERIAS'+CR_LF+
        'WHERE'+CR_LF+
        '  (IDPESSOA    = ' +IdPessoa+ ') AND'+CR_LF+
        '  (FLGOCORRIDA = 1)');

      if not(_CdsAux.FieldByName('PROXAQUISFER').IsNull) then
      begin
        DataProx := _CdsAux.FieldByName('PROXAQUISFER').asDateTime;
        DataProx := IncData2(DataProx,0,0,1);
      end
      else
      begin
        _CdsAux.Close;
        _CdsAux.Data := GetDataPacket(
          'SELECT'+CR_LF+
          '  DATAADMISSAO AS PROXAQUISFER'+CR_LF+
          'FROM'+CR_LF+
          '  FUNCIONARIO'+CR_LF+
          'WHERE'+CR_LF+
          '  (IDPESSOA = ' +IdPessoa+ ')');

        if (_CdsAux.IsEmpty) then
          DataProx := 0
        else
          DataProx := _CdsAux.FieldByName('PROXAQUISFER').asDateTime;
      end;
    end
    else
      DataProx := _CdsAux.FieldByName('PROXAQUISFER').asDateTime;

    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM('+CR_LF+
      '    TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS) + 1 +'+CR_LF+
      '    TO_NUMBER(DECODE(FLGABONO,0,'+CR_LF+
      '      0,'+CR_LF+
      '      TO_NUMBER(DECODE(NVL(QTDIASABONO,0),0,'+CR_LF+
      '        TRUNC((TO_NUMBER(FIMGOZOFERIAS - INIGOZOFERIAS) + 1)/2),'+CR_LF+
      '        QTDIASABONO'+CR_LF+
      '      ))'+CR_LF+
      '    ))'+CR_LF+
      '  ) AS DIAS'+CR_LF+
      'FROM'+CR_LF+
      '  FERIAS'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA    = ' +IdPessoa+ ') AND'+CR_LF+
      '  (FLGOCORRIDA = 1)');

    if (_CdsAux.IsEmpty) then
      DiasSaldoFerias := 0
    else
      DiasSaldoFerias := (_CdsAux.FieldByName('DIAS').asInteger mod 30);
      
    if (DiasSaldoFerias > 0) then
      DiasSaldoFerias := 30 - DiasSaldoFerias;

    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  ANO, MES, FLGOCORRIDA'+CR_LF+
      'FROM'+CR_LF+
      '  ANTECIP13'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA = ' +IdPessoa+ ') AND'+CR_LF+
      '  (ANO      = ' +IntToStr(ExtraiAno(FCdsParamRH.FieldByName('PGTO13INI').asDateTime))+ ') AND'+CR_LF+
      '  (MES      = ' +IntToStr(ExtraiMes(FCdsParamRH.FieldByName('PGTO13INI').asDateTime))+ ')');
//      '  (A13.ANO      = TO_NUMBER(TO_CHAR(PR.PGTO13INI,''YYYY''))) AND'+CR_LF+
//      '  (A13.MES      = TO_NUMBER(TO_CHAR(PR.PGTO13INI,''MM'')))');

    if (_CdsAux.IsEmpty) then
    begin
      Ano13 := 0;
      Mes13 := 0;
      FlgOc13 := 0;
    end
    else
    begin
      Ano13 := _CdsAux.FieldByName('ANO').asInteger;
      Mes13 := _CdsAux.FieldByName('MES').asInteger;
      FlgOc13 := _CdsAux.FieldByName('FLGOCORRIDA').asInteger;
    end;
  end;

  FCdsDadosFunc.Locate('IDPESSOA', IdPessoa, []);
  FCdsDadosFuncAtual.EmptyDataSet;
  repeat
    FCdsDadosFunc.Edit;
    FCdsDadosFunc.FieldByName('BSRUBRICA').asFloat := ValBase;
    FCdsDadosFunc.FieldByName('TOTALPROVENTOS').asFloat := TotProv;
    FCdsDadosFunc.FieldByName('TOTALDESCONTOS').asFloat := TotDesc;
    FCdsDadosFunc.FieldByName('TIPOFOLHA').asInteger := TipoFolha;
    FCdsDadosFunc.FieldByName('PERCRETRO').asFloat := FPercRetroativo;
    FCdsDadosFunc.FieldByName('MESRETRO').asInteger := FMesRetroativo;
    FCdsDadosFunc.FieldByName('VALORRUBRICA').asFloat := ValBene;
    FCdsDadosFunc.FieldByName('PROXAQUISFER').asDateTime := DataProx;
    FCdsDadosFunc.FieldByName('SALCHEFE').asFloat := ValSalChefe;
    FCdsDadosFunc.FieldByName('SALCHEFE2').asFloat := ValSalChefe2;
    FCdsDadosFunc.FieldByName('SALFUNCAO').asFloat := ValSalFuncao;
    FCdsDadosFunc.FieldByName('TEMLANCAMENTO').asInteger := TemLanc;
    FCdsDadosFunc.FieldByName('PARCELAS').asInteger := QtdParc;
    FCdsDadosFunc.FieldByName('NUMOCORRENCIAS').asInteger := QtdOcor;
    FCdsDadosFunc.FieldByName('SALDOFERIAS').asInteger := DiasSaldoFerias;
    FCdsDadosFunc.FieldByName('ANO').asInteger := Ano13;
    FCdsDadosFunc.FieldByName('MES').asInteger := Mes13;
    FCdsDadosFunc.FieldByName('FLGOCORR13').asInteger := FlgOc13;
    FCdsDadosFunc.Post;

    FCdsDadosFuncAtual.Insert;
    for c:=0 to FCdsDadosFunc.FieldCount-1 do
      FCdsDadosFuncAtual.Fields[c].Value := FCdsDadosFunc.Fields[c].Value;
    FCdsDadosFuncAtual.Post;

    FCdsDadosFunc.Next;
  until (FCdsDadosFunc.EOF) or (IdPessoa <> FCdsDadosFunc.FieldByName('IDPESSOA').asString);

  if (bAlgRegra) then
  begin
    sValor := ExecRegra(IdRegra);

    if (sValor <> '') then
    begin
      sValor := ClienteNumero(sValor);
      ValBene := StringToFloat(sValor);
    end;
  end
  else
    ValBene := FormaCalculo(IdRegra);

  iUltAno13 := Ano13;
  iUltMes13 := Mes13;
  iUltFlgOc13 := FlgOc13;
  iUltFlgAbo := FlgAbo;
  iUltFlgOcor := FlgOcor;
  iUltNumSq := NumSq;
  sUltDataFer1 := sDataFer1;
  sUltDataFer2 := sDataFer2;
  sUltDataFer3 := sDataFer3;
  sUltDataFer22 := sDataFer22;
  sUltDataFer32 := sDataFer32;
  UltDataProx := DataProx;
  iUltQtdParc := QtdParcFer;
  iUltQtdParc2 := QtdParcFer2;
  iUltDiasSaldoFerias := DiasSaldoFerias;
  ValUltSalChefe := ValSalChefe;
  ValUltSalChefe2 := ValSalChefe2;
  ValUltSalFuncao := ValSalFuncao;

  if (FUsaLOG) then
  begin
    WriteLn(FArqLOG,
      ''+CR_LF+
      ('Valor: ') +FloatToStr(ValBene)+CR_LF+
      '*****************************');
  end;

  _CdsAux.Free;
end;

procedure TCtrlCalcRub.CalcBeneficioRegra(IdRegra, IdPessoa: string; var ValBeneficio: double);
var
  sValor: string;
begin
  if (IdPessoa = FIdPessoa) then
  begin
    FCdsDadosFuncAtual.Edit;
    FCdsDadosFuncAtual.FieldByName('BSRUBRICA').asFloat := ValBeneficio;
    FCdsDadosFuncAtual.Post;
  end
  else
  begin
    FIdPessoa := IdPessoa;

    FCdsDadosFuncAtual.Close;
    FCdsDadosFuncAtual.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  PF.*, F.*, (' +OraNumero(FloatToStr(ValBeneficio))+ ') AS BSRUBRICA'+CR_LF+
      'FROM'+CR_LF+
      '  PESSOAFISICA PF, FUNCIONARIO F'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA = ' +IdPessoa+ ') AND'+CR_LF+
      '  (F.IDPESSOA = PF.IDPESSOA)');
  end;

  sValor := ExecRegra(IdRegra);
  if (sValor <> '') then
  begin
    sValor := ClienteNumero(sValor);
    ValBeneficio := StringToFloat(sValor);
  end;
end;

procedure TCtrlCalcRub.CalcRetroativo(TipoFolha: integer; IdRegra, IdPessoa: string;
  var Valor: double; ValBase, Percentual: double; Mes: integer; TotProv, TotDesc: double);
begin
  FPercRetroativo := Percentual;
  FMesRetroativo := Mes;
  CalcBeneficio(TipoFolha, IdRegra, IdPessoa, Valor, ValBase, 0, 0, 0, TotProv, TotDesc);
end;

function TCtrlCalcRub.ValorAtualProcesso(const ValHist: double; const DataHist, IdMoeda,
  NumRegra, NumProc: string; const TipoCalc: integer): double;
var
  _CdsAux: TCMClientDataSet;
  sPercValor: string;
begin
  Result := ValHist;

  if (DataHist = '') or (TipoCalc = 2) then
    exit;

  if (IdMoeda <> '') and (TipoCalc = 0) then
  begin
    _CdsAux := TCMClientDataSet.Create(nil);
    _CdsAux.Data := GetDataPacket('SELECT FLGPERCVALOR FROM MOEDA WHERE MOECODIGO = ' +IdMoeda);
    sPercValor := _CdsAux.FieldByName('FLGPERCVALOR').asString;
    _CdsAux.Close;

    if (sPercValor = 'V') then
      _CdsAux.Data := GetDataPacket(
        'SELECT COTVALOR'+CR_LF+
        'FROM   COTACAOMOEDA' +CR_LF+
        'WHERE  (MOECODIGO = ' +IdMoeda+ ') AND' +CR_LF+
        '       (COTDATA  <= TO_DATE(' +QuotedStr(DataHist)+ ',''DD/MM/YYYY''))' +CR_LF+
        'ORDER BY COTDATA DESC')
    else
      _CdsAux.Data := GetDataPacket(
        'SELECT COTVALOR'+CR_LF+
        'FROM   COTACAOMOEDA'+CR_LF+
        'WHERE  (MOECODIGO = ' +IdMoeda+ ') AND'+CR_LF+
        '       (COTDATA  >= TO_DATE(' +QuotedStr(DataHist)+ ',''DD/MM/YYYY'')) AND' +CR_LF+
        '       (COTDATA  <= SYSDATE)' +CR_LF+
        'ORDER BY COTDATA');

    if not(_CdsAux.IsEmpty) then
    begin
      if (sPercValor = 'V') then
        Result := ValHist * _CdsAux.FieldByName('COTVALOR').asFloat
      else
      begin
        while not(_CdsAux.EOF) do
        begin
          Result := Result + ((Result * _CdsAux.FieldByName('COTVALOR').asFloat) / 100);
          _CdsAux.Next;
        end;
      end;
    end;
    _CdsAux.Free;
  end;

  if (TipoCalc = 1) and (NumRegra <> '') then
  begin
    FIdPessoa := '';
    FMostrarPassosExecucao := false;
    FCdsDadosFuncAtual.Close;
    FCdsDadosFuncAtual.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  P.*, ' +Float2String(ValHist)+ ' AS VALORHIST'+CR_LF+
      'FROM'+CR_LF+
      '  PROCESSOTRAB P'+CR_LF+
      'WHERE'+CR_LF+
      '  (P.NUMPROCTRAB = ' +NumProc+ ')');

    sValor := ExecRegra(NumRegra);
    if (sValor <> '') then
    begin
      sValor := ClienteNumero(sValor);
      Result := StringToFloat(sValor);
    end
    else
    if (FErroExecucao) then
      exit;
  end;
end;

function TCtrlCalcRub.FormaCalculo(IdRegra: string): double;
var
  I, J, K, iNumPasso: integer;
  sCodCampo, sFuncao, Expressao, sValorNovo, sResultFuncao, svExpressao: string;
begin
  FCdsFormaCalc.Locate('IDREGRA', IdRegra, []);

  Expressao := Trim(FCdsFormaCalc.FieldByName('DESCRICAOREGRA').asString);
  if (Pos('&', Expressao) > 0) then
    Expressao := Copy(Expressao, 1, Pos('&', Expressao) - 1);
  svExpressao := Expressao;

  if (FUsaLOG) then
  begin
    WriteLn(FArqLOG,
      ('Execução de Forma de Cálculo') +CR_LF+
      Expressao);
  end;

  Result := 0;
  Expressao := Trim(Expressao);
  if (Expressao = '') then
    exit;

  FContRegQryIn := 0;

  iNumPasso := 0;
  FCdsDadosFuncAtual.First;
  while not(FCdsDadosFuncAtual.EOF) do
  begin
    Inc(FContRegQryIn);
    Expressao := TrocaCaracter(Trim(svExpressao), CR_LF, '');

    if (FMostrarPassosExecucao) then
      FExecucaoPassos := Replicate('-', 16)+ (' [FORMA DE CÁLCULO COMPLETA] ')+
        Replicate('-', 15)+CR_LF+ Replicate('-', 60)+CR_LF+ Expressao +CR_LF+
        Replicate('-', 25)+ (' [CAMPOS] ') +Replicate('-', 25)+CR_LF+
        Replicate('-', 60)+CR_LF;

    I := 0;
    // Substituir Campos
    if (Pos('C(', Expressao) > 0) then
    begin
      while (I < Length(Expressao)) do
      begin
        if (Pos('C(', Expressao) = 0) then
          break;

        I := I + Pos('C(', Expressao);

        // Apanhar o valor do campo
        J := Pos(')', Copy(Expressao, I, Length(Expressao)-I+1));
        sCodCampo := Copy(Expressao, I+2, J-3);

        if (FUsaLOG) then
          WriteLn(FArqLOG, ('Campo: ') +sCodCampo);

        if (sCodCampo = 'TEMLANCAMENTO') then
          sValorNovo := IntToStr(iTemLanc)
        else
        if (sCodCampo = 'PARCELAS') then
          sValorNovo := IntToStr(iQtdParc)
        else
        if (sCodCampo = 'NUMOCORRENCIAS') then
          sValorNovo := IntToStr(iQtdOcor)
        else
        if (sCodCampo = 'VALORRUBRICA') then
          sValorNovo := FloatToStr(ValInfRubrica)
        else
        if (sCodCampo = 'BSRUBRICA') then
          sValorNovo := FloatToStr(ValBaseRubrica)
        else
        if (sCodCampo = 'MESRETRO') then
          sValorNovo := IntToStr(FMesRetroativo)
        else
        if (sCodCampo = 'PERCRETRO') then
          sValorNovo := FloatToStr(FPercRetroativo)
        else
        if (sCodCampo = 'TOTALPROVENTOS') then
          sValorNovo := FloatToStr(ValTotProventos)
        else
        if (sCodCampo = 'TOTALDESCONTOS') then
          sValorNovo := FloatToStr(ValTotDescontos)
        else
        begin
          if (FCdsDadosFuncAtual.FieldByName(sCodCampo).asString = '') then
            sValorNovo := '0'
          else
            sValorNovo := FCdsDadosFuncAtual.FieldByName(sCodCampo).asString;
        end;

        // Transformar o valor do campo obtido na forma que o componente FCompiler possa
        // reconhecer e tratar de maneira correta
        sValorNovo := FormatValor(GetValor(sValorNovo));

        // Trocar o campo pelo valor obtido
        if (FMostrarPassosExecucao) then
        begin
          Inc(iNumPasso);
          FExecucaoPassos := FExecucaoPassos +
            '[' +Alinha(IntToStr(iNumPasso), 3, 'D', '0')+ '] - C(' +sCodCampo+ ') --> ' +
            sValorNovo +CR_LF+ ('EXPRESSÃO:') +CR_LF;

          Expressao := TrocaCaracter(Expressao, 'C('+sCodCampo+')', sValorNovo);

          FExecucaoPassos := FExecucaoPassos+ Expressao +CR_LF+ Replicate('-', 60)+CR_LF;
        end
        else
          Expressao := TrocaCaracter(Expressao, 'C('+sCodCampo+')', sValorNovo);

        I := 0;
        if (FUsaLOG) then
        begin
          WriteLn(FArqLOG,
            ('  Valor: ') +sValorNovo+CR_LF+
            ('Expressão: ') +Expressao+CR_LF);
        end;
      end;
    end;

    if (FMostrarPassosExecucao) then
      FExecucaoPassos := FExecucaoPassos +
        Replicate('-', 25)+(' [FUNÇÕES] ') +Replicate('-', 24) +
        CR_LF+ Replicate('-', 60)+CR_LF;

    I := 0;
    // Substituir Funções
    if (Pos('F%', Expressao) > 0) then
    begin
      while (I < Length(Expressao)) do
      begin
        if (Pos('F%', Expressao) = 0) then
          break;

        I := I + Pos('F%', Expressao);

        // Rotina para apanhar o valor do campo
        repeat
          J := Pos(')', Copy(Expressao, I, Length(Expressao)-I+1));
          K := Pos('F%', Copy(Expressao, I+1, Length(Expressao)-I));
          if (K = 0) or (K+1 > J) then
            break
          else
            I := I + K;
        until (false);
        sFuncao := Copy(Expressao, I+2, J-2);

        if (FUsaLOG) then
          WriteLn(FArqLOG, ('Função: ')+ sFuncao);

        // Executa a Função Contida em sFuncao
        sResultFuncao := RetornaFuncao(sFuncao);

        if (FMostrarPassosExecucao) then
        begin
          Inc(iNumPasso);
          FExecucaoPassos := FExecucaoPassos +
            '[' +Alinha(IntToStr(iNumPasso), 3, 'D', '0')+ '] - F%' +sFuncao+ ' --> ' +
            sResultFuncao +CR_LF+ ('EXPRESSÃO:') +CR_LF;

          Expressao := StringReplace(Expressao, 'F%' + sFuncao,
            TrocaCaracter(sResultFuncao, ',', '.'), []);

          FExecucaoPassos := FExecucaoPassos + Expressao +CR_LF+ Replicate('-', 60)+CR_LF;
        end
        else
          Expressao := StringReplace(Expressao, 'F%' + sFuncao,
            TrocaCaracter(sResultFuncao, ',', '.'), []);

        I := 0;
        if (FUsaLOG) then
        begin
          WriteLn(FArqLOG,
            ('  Valor: ') +sResultFuncao+CR_LF+
            ('Expressão: ') +Expressao+CR_LF);
        end;
      end;
    end;

    if (Expressao <> '') then
    begin
      if (FUsaLOG) then
        WriteLn(FArqLOG, ('Expressão: ') +Expressao);

      Expressao := TrocaCaracter(Trim(Expressao), CR_LF, '');
      Result := ExecFormaCalc(Expressao);

      if (FMostrarPassosExecucao) then
        FExecucaoPassos := FExecucaoPassos +
          Replicate('-', 24)+ (' [RESULTADO] ') +Replicate('-', 23)+
          CR_LF+ FloatToStr(Result);
    end;

    FCdsDadosFuncAtual.Next;
  end;
end;

function TCtrlCalcRub.RetornaFuncao(Texto: string): string;
const
  TIPO_INT = 0;
  TIPO_REAL = 1;
  TIPO_DATA = 2;
var
  c: byte;
  NomeFuncao: string;
  NumDias, NumMeses, NumAnos: integer;
  Param: array[1..NUM_MAX_PARAMETROS] of string;
  iTamTexto: integer;

{-->}function eTipo(const Valor: string; const Tipo: integer): boolean;
     begin
       try
         if (Tipo = TIPO_INT) then
           StrToInt(Valor)
         else
         if (Tipo = TIPO_REAL) then
           StrToFloat(Valor)
         else
         if (Tipo = TIPO_DATA) then
           StrToDate(Valor);

         Result := true;
       except
         Result := false;
       end;
{-->}end;

{-->}function GetParametro(const Posicao: byte): string;
     begin
       if (Posicao <= ContaCaracter(Texto, ';')) then
         Result := Trim(Copy(Texto,
           PosicaoCar(';', Texto, Posicao-1)+1,
           PosicaoCar(';', Texto, Posicao) - PosicaoCar(';', Texto, Posicao-1)-1))
       else
       if (Posicao = ContaCaracter(Texto, ';')+1) then
       begin
         iTamTexto := Length(Texto);
        //* Result :=RightStr(Texto, iTamTexto - PosicaoCar(';', Texto, Posicao-1));
         if (Result = '') then
        //*   Result := RightStr(Texto, iTamTexto - PosicaoCar('(', Texto, Posicao));
       end
       else
         Result := '';
{-->}end;

begin
  Result := '0';
  NomeFuncao := UpperCase(Trim(Copy(Texto,1,Pos('(',Texto)-1)));

  // Obter somentes os parâmetros
  Texto := Copy(Texto, Pos('(',Texto)+1, Pos(')',Texto) - Pos('(',Texto) - 1);
  for c:=1 to NUM_MAX_PARAMETROS do
    Param[c] := Trim(GetParametro(c));

  // Caso a função não seja uma das abaixo, retire os caracteres especiais que indicam
  // se o valor é negativo
{  if (NomeFuncao <> 'ARITM') or (NomeFuncao <> 'SALVA') then
  for c:=1 to NUM_MAX_PARAMETROS do
  begin
    Param[c] := TrocaCaracter(Param[c], '[', '(');
    Param[c] := TrocaCaracter(Param[c], ']', ')');
  end;}

  try
    if (NomeFuncao = 'ABS') then
    begin
      Param[1] := FormatValor(TrocaCaracter(TrocaCaracter(Param[1], ']', ''), '[', ''));
      if not(eTipo(Param[1], TIPO_REAL)) then
        Result := ''
      else
        Result := FloatToStr(Abs(StrToFloat(Param[1])));
    end
    else
    if (NomeFuncao = 'DIASTRAB') then
      Result := DiasTrab(Param[1], Param[2])
    else
    if (NomeFuncao = 'SOMAHISTRUB') then
      Result := SomaHistRub(Param[1], Param[2], Param[3], Param[4], Param[5])
    else
    if (NomeFuncao = 'TOTALHISTRUB') then
    begin
      if not(eTipo(Param[5], TIPO_INT)) or not(eTipo(Param[6], TIPO_INT)) or
         not(eTipo(Param[7], TIPO_INT)) or not(eTipo(Param[8], TIPO_INT)) then
        Result := ''
      else
        Result := TotalHistRub(Param[1], Param[2], Param[3], Param[4],
          StrToInt(Param[5]), StrToInt(Param[6]), StrToInt(Param[7]),
          StrToInt(Param[8]), Param[9]);
    end
    else
    if (NomeFuncao = 'MEDIAHISTRUB') then
      Result := MediaHistRub(Param[1], Param[2], Param[3], Param[4], Param[5])
    else
    if (NomeFuncao = 'QTDEHISTRUB') then
      Result := QtdeHistRub(Param[1], Param[2], Param[3], Param[4], Param[5])
    else
    if (NomeFuncao = 'QTDEDEPEN') then
    begin
      if Param[6] = ''  then  Param[6] := '0';
      Result := QtdeDepen(Param[1], Param[2], Param[3], Param[4], Param[5], Param[6]);
    end
    else
    if (NomeFuncao = 'DIASFERIAS') then
      Result := DiasFerias(Param[1], Param[2])
    else
    if (NomeFuncao = 'DIASFERIASNOMES') then
      Result := DiasFeriasNoMes(Param[1])
    else
    if (NomeFuncao = 'DIFDIAS') then
    begin
      if (CalculaData(Param[1], Param[2], NumDias, NumMeses, NumAnos)) then
        Result := IntToStr(NumDias)
      else
        Result := '';
    end
    else
    if (NomeFuncao = 'DIFANOS') then
    begin
      if (CalculaData(Param[1], Param[2], NumDias, NumMeses, NumAnos)) then
        Result := IntToStr(NumAnos)
      else
        Result := '';
    end
    else
    if (NomeFuncao = 'DIFMESES') then
    begin
      if (Param[3] = '') or (Param[3] = '0') then
      begin
        if (CalculaData(Param[1], Param[2], NumDias, NumMeses, NumAnos)) then
          Result := IntToStr(NumMeses)
        else
          Result := '';
      end
      else
      if (Param[3] = '1') then
        Result := IntToStr(DifMesesArred(Param[1], Param[2]));
    end
    else
    if (NomeFuncao = 'INCDATA') then
    begin
      if not(eTipo(Param[2], TIPO_INT)) or not(eTipo(Param[3], TIPO_INT)) or
         not(eTipo(Param[4], TIPO_INT)) or not(eTipo(Param[1], TIPO_DATA)) then
        Result := ''
      else
        Result := DateToStr(IncData2(StrDate(Param[1]), StrToInt(Param[2]),
          StrToInt(Param[3]), StrToInt(Param[4])));
    end
    else
    if (NomeFuncao = 'TRAZULTDIAMES') or (NomeFuncao = 'TRAZULTDIADATA') or
       (NomeFuncao = 'RETORNAANOMES') or (NomeFuncao = 'ANOMES') or
       (NomeFuncao = 'EXTRAIDIA') or (NomeFuncao = 'EXTRAIMES') or
       (NomeFuncao = 'EXTRAIANO') or (NomeFuncao = 'DATANUM') then
    begin
      if not(eTipo(Param[1], TIPO_DATA)) then
        Result := ''
      else
      if (NomeFuncao = 'TRAZULTDIAMES') then
        Result := IntToStr(TrazUltDiaMes(ExtraiMes(StrToDate(Param[1])),
                                         ExtraiAno(StrToDate(Param[1]))))
      else
      if (NomeFuncao = 'TRAZULTDIADATA') then
        Result := DateToStr(TrazUltDiaData(StrToDate(Param[1])))
      else
      if (NomeFuncao = 'RETORNAANOMES') then
        Result := RetornaAnoMes(StrToDate(Param[1]))
      else
      if (NomeFuncao = 'ANOMES') then
        Result := AnoMes(StrToDate(Param[1]))
      else
      if (NomeFuncao = 'EXTRAIDIA') then
        Result := IntToStr(ExtraiDia(StrToDate(Param[1])))
      else
      if (NomeFuncao = 'EXTRAIMES') then
        Result := IntToStr(ExtraiMes(StrToDate(Param[1])))
      else
      if (NomeFuncao = 'EXTRAIANO') then
        Result := IntToStr(ExtraiAno(StrToDate(Param[1])))
      else
      if (NomeFuncao = 'DATANUM') then
        Result := FloatToStr(StrToDate(Param[1]));
    end
    else
    if (NomeFuncao = 'JUROCOMPOSTO') then
    begin
      if not(eTipo(Param[1], TIPO_REAL)) or not(eTipo(Param[2], TIPO_INT)) or
         not(eTipo(Param[3], TIPO_REAL)) then
        Result := ''
      else
        Result := FloatToStr(JuroComposto(StrToFloat(Param[1]),
                                          StrToInt(Param[2]), StrToFloat(Param[3])))
    end
    else
    if (NomeFuncao = 'INDICE') then
      Result := Indice(Param[1], Param[2], Param[3])
    else
    if (NomeFuncao = 'ARITM') then
      Result := FloatToStr(ExecFormaCalc(Param[1]))
    else
    if (NomeFuncao = 'SALVA') then
    begin
      FValorSalvo := ExecFormaCalc(Param[1]);
      Result := FloatToStr(FValorSalvo);
    end
    else
    if (NomeFuncao = 'RECUPERA') then
      Result := FloatToStr(FValorSalvo)
    else
    if (NomeFuncao = 'TABGENERICA') then
      Result := TabGenerica(Param[1], Param[2], Param[3], Param[4], Param[5])
    else
    if (NomeFuncao = 'TABLONGA') or (NomeFuncao = 'MAXIMO') or (NomeFuncao = 'MINIMO') then
    begin
      Param[1] := Trim(Copy(Texto, Pos('(',Texto)+1, Length(Texto)-Pos('(',Texto)));

      if (NomeFuncao = 'TABLONGA') then
        Result := TabLonga(Param[1])
      else
      if (NomeFuncao = 'MAXIMO') then
        Result := Maximo(Param[1])
      else
      if (NomeFuncao = 'MINIMO') then
        Result := Minimo(Param[1]);
    end
    else
    if (NomeFuncao = 'IRRF') then
      Result := IRRF(Param[1], Param[2], Param[3], Param[4], Param[5])
    else
    if (NomeFuncao = 'REGATU') then
      Result := IntToStr(FContRegQryIn)
    else
    if (NomeFuncao = 'TOTREGS') then
      Result := IntToStr(FCdsDadosFuncAtual.RecordCount)
    else
    if (NomeFuncao = 'AVOSFERIAS') then
      Result := IntToStr(AvosFerias)
    else
    if (NomeFuncao = 'AVOS13') then
      Result := IntToStr(Avos13)
    else
    if (NomeFuncao = 'AVOSPERDIDOS') then
      Result := IntToStr(AvosPerdidos(Param[1], Param[2], Param[3]))
    else
    if (NomeFuncao = 'SE') then
      Result := FloatToStr(ExecFuncaoIF(Param[1], Param[2], Param[3]))
    else
    if (NomeFuncao = 'TRUNCA') then
      Result := FloatToStr(ExecFuncaoTRUNCA(Param[1], Param[2]))
    else
    if (NomeFuncao = 'ROUND') then
      Result := FloatToStr(ExecFuncaoROUND(Param[1], Param[2]))
    else
    if (NomeFuncao = 'VALORRUBRICA') then
      Result := ValorRubrica(Param[1])
    else
    if (NomeFuncao = 'PLANASSQTD') then
      Result := PlanAssQtd(Param[1], Param[2], Param[3], Param[4], Param[5])
    else
    if (NomeFuncao = 'PLANASSVAL') then
      Result := PlanAssVal(Param[1])
    else
    if (NomeFuncao = 'ORCAMPESS') then
    begin
      if not(eTipo(Param[1], TIPO_DATA)) or not(eTipo(Param[2], TIPO_INT)) or
         not(eTipo(Param[3], TIPO_INT))  or not(eTipo(Param[4], TIPO_INT)) then
        Result := ''
      else
        Result := OrcamPess(StrToDate(Param[1]), StrToInt(Param[2]),
          StrToInt(Param[3]), StrToInt(Param[4]), Param[5]);
    end
    else
    if (NomeFuncao = 'AVALIACAO') then
    begin
      if not(eTipo(Param[1], TIPO_DATA)) or not(eTipo(Param[2], TIPO_INT)) then
        Result := ''
      else
        Result := Avaliacao(StrToDate(Param[1]), StrToInt(Param[2]));
    end
    else
    if (NomeFuncao = 'QUANTPESS') then
    begin
      if not(eTipo(Param[1], TIPO_INT)) or not(eTipo(Param[2], TIPO_INT)) or
         not(eTipo(Param[3], TIPO_INT)) or not(eTipo(Param[5], TIPO_INT)) or
         not(eTipo(Param[6], TIPO_INT)) then
        Result := ''
      else
        Result := TotalPessoal(false, StrToInt(Param[1]), StrToInt(Param[2]),
          StrToInt(Param[3]), Param[4], StrToInt(Param[5]), StrToInt(Param[6]));
    end
    else
    if (NomeFuncao = 'SALARIOTOTAL') then
    begin
      if not(eTipo(Param[1], TIPO_INT)) or not(eTipo(Param[2], TIPO_INT)) or
         not(eTipo(Param[3], TIPO_INT)) or not(eTipo(Param[5], TIPO_INT)) or
         not(eTipo(Param[6], TIPO_INT)) then
        Result := ''
      else
        Result := TotalPessoal(true, StrToInt(Param[1]), StrToInt(Param[2]),
          StrToInt(Param[3]), Param[4], StrToInt(Param[5]), StrToInt(Param[6]));
    end;

    // Transformar o valor do campo obtido na forma que o componente de
    // avaliação de expressões matemáticas possa reconhecer e tratar de maneira correta
    Result := FormatValor(GetValor(Result));
  except
    on E: Exception do
    begin
      Result := '';
      if (FUsaLOG) then
        WriteLn(FArqLOG, ('Erro na Função: ') + E.Message);
    end;
  end;
end;

function TCtrlCalcRub.ExecFormaCalc(Expressao: string): double;
begin
  Expressao := TrocaCaracter(Expressao, ' ', '');
  Expressao := TrocaCaracter(Expressao, '[', '(');
  Expressao := TrocaCaracter(Expressao, ']', ')');
  Expressao := FormatValor(Expressao);
  try
    FFormaCalc.Text := Expressao;
    Result := FFormaCalc.Value;
    FErroExecucao := false;
  except
    on E: Exception do
    begin
      Result := 0;
      FErroExecucao := true;
      MessageInfo := ('Erro na execução da Forma de Cálculo.') +CR_LF+
        ('Erro:') +CR_LF+ E.Message;
      if (FUsaLOG) then
        WriteLn(FArqLOG, ('Erro = ') + E.Message);
    end;
  end;
end;

function TCtrlCalcRub.ExecRegra(NumRegra: string): string;
begin
  if (FUsaLOG) then
    WriteLn(FArqLOG, ('Execução de Regra'));

  FErroExecucao := false;
  try
    FCtrlRegra.RuleNumber := NumRegra;
    FCtrlRegra.IdEmpresa := FIdEmpresa;
    FCtrlRegra.GravaCalculo := false;
    FCtrlRegra.ReloadRule := false;

    if (FTipoEmpresa = 'P') then
      FCtrlRegra.TipoCliente := tcFundacao
    else
      FCtrlRegra.TipoCliente := tcOutros;

    FCtrlRegra.PassoaPasso := false;
   //* FCtrlRegra.CopiaDataSet(FCdsDadosFuncAtual.Data);
    FCtrlRegra.Execute;

    if not(FCtrlRegra.Error) then
      Result := OraNumero(FCtrlRegra.Result)
    else
    begin
      FErroExecucao := true;
      MessageInfo := FCtrlRegra.MessageInfo;
    end;
  except
    on E: Exception do
    begin
      FErroExecucao := true;
      MessageInfo := E.Message;
    end;
  end;

  if (FErroExecucao) then
  begin
    if (FUsaLOG) then
      WriteLn(FArqLOG, ('Erro = ') + MessageInfo);
    MessageInfo := ('Erro na execução da Regra:') +CR_LF+ MessageInfo;
  end;
end;

function TCtrlCalcRub.GetValor(Valor: string): string;
begin
  if (StrFloat(Valor) < 0) then
    Result := '[' +Valor+ ']'
  else
    Result := Valor;
end;

function TCtrlCalcRub.FormatValor(Expressao: string): string;
begin
  // O separador decimal sempre será ponto
  Result := TrocaCaracter(Expressao, ',', '.');
end;

function TCtrlCalcRub.ExecFuncaoIF(Param1, Param2, Param3: string): double;
var
  Op1, Op2: variant;
  bCondicao: boolean;

{-->}procedure GetValCondicao;
     var
       c: byte;
       sOperador, sOp1, sOp2: string;
     begin
       sOperador := '';
       for c:=1 to NUM_OPERADORES do
         if (Pos(Operador[c], Param1) > 0) then
         begin
           sOperador := Copy(Param1, Pos(Operador[c], Param1), Length(Operador[c]));
           break;
         end;

       if (sOperador = '') then
         bCondicao := false
       else
       begin
         sOp1 := Trim(Copy(Param1, 1, Pos(sOperador, Param1)-1));
         sOp2 := Trim(Copy(Param1, Pos(sOperador, Param1) + Length(sOperador),
           Length(Param1) - (Pos(sOperador, Param1) + Length(sOperador)) + 1));

         if (Pos('"',sOp1) = 0) then // Se a condição NÃO for entre Strings
           Op1 := ExecFormaCalc(sOp1)
         else
           Op1 := sOp1;

         if (Pos('"',sOp2) = 0) then // Se a condição NÃO for entre Strings
           Op2 := ExecFormaCalc(sOp2)
         else
           Op2 := sOp2;

         if (sOperador = '=') then
           bCondicao := (Op1 = Op2)
         else
         if (sOperador = '>') then
           bCondicao := (Op1 > Op2)
         else
         if (sOperador = '<') then
           bCondicao := (Op1 < Op2)
         else
         if (sOperador = '>=') then
           bCondicao := (Op1 >= Op2)
         else
         if (sOperador = '<=') then
           bCondicao := (Op1 <= Op2)
         else
         if (sOperador = '<>') then
           bCondicao := (Op1 <> Op2)
         else
           bCondicao := false;
       end;
{-->}end;
begin
  Result := 0;
  // Se algum parâmetro estiver vazio, retornar erro
  Param1 := Trim(Param1);
  Param2 := Trim(Param2);
  Param3 := Trim(Param3);
  if (Param1 = '') then
    exit;

  GetValCondicao;

  if (bCondicao) then
    Result := ExecFormaCalc(Param2)
  else
    Result := ExecFormaCalc(Param3);
end;

function TCtrlCalcRub.ExecFuncaoTRUNCA(Param1, Param2: string): double;
var
  Val: double;
  Casas: integer;
begin
  Result := 0;
  // Se algum parâmetro estiver vazio, retornar erro
  if (Trim(Param1) = '') or (Trim(Param2) = '') then
    exit;

  // Obter o valor
  Val := ExecFormaCalc(Param1);
  if (FErroExecucao) then
  begin
    Result := 0;
    exit;
  end;

  // Obter o número de casas decimais
  try
    Casas := StrToInt(Param2);
  except
    Casas := 0;
  end;
  Result := Truncar(Val, Casas);
end;

function TCtrlCalcRub.SomaHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa: string): string;
var
  _CdsAux: TCMClientDataSet;
  iOpcaoEmpresa, iQtdeMeses, iTipoFolha: integer;
begin
  iOpcaoEmpresa := StrInt(OpcaoEmpresa);
  try
    StrToDate(DataRef);
    iQtdeMeses := StrToInt(QtdeMeses);
    iTipoFolha := StrToInt(TipoFolha);
    if (CodProvDesc = '') or (iQtdeMeses <= 0) or (iTipoFolha < -1) then
    begin
      Result := '0';
      exit;
    end;
  except
    Result := '0';
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT SUM(VALORPROVENTO) AS TOTAL'+CR_LF+
      'FROM   HISTRUBSAL'+CR_LF+
      'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
      '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
      '      (MES        >= ' +QuotedStr(IncDataAM(RetornaAnoMes(StrToDate(DataRef)),-iQtdeMeses))+') AND'+CR_LF+
      '      (MES        <= ' +QuotedStr(IncDataAM(RetornaAnoMes(StrToDate(DataRef)),-1))+') AND'+CR_LF+
      '      (IDMODULO    = 21) AND'+CR_LF+
      '      (MES  NOT LIKE ''%13'')'+
      IFF(iOpcaoEmpresa=-1, '', ' AND'+ CR_LF +
        '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ')')+
      IFF(iTipoFolha<>-1, ' AND'+ CR_LF +
        '      (IDMOTIVO = ' +TipoFolha+ ')', ''));

    Result := FloatToStr(_CdsAux.FieldByName('TOTAL').asFloat);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.TotalHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha: string;
  IdEmpresa, IdEstab, IdCargo, CBO: integer; CodCentroCusto: string): string;
var
  _CdsAux: TCMClientDataSet;
  iQtdeMeses, iTipoFolha: integer;
begin
  try
    StrToDate(DataRef);
    iQtdeMeses := StrToInt(QtdeMeses);
    iTipoFolha := StrToInt(TipoFolha);
    if (CodProvDesc = '') or (iQtdeMeses <= 0) or (iTipoFolha < -1) then
    begin
      Result := '0';
      exit;
    end;
  except
    Result := '0';
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  SUM(H.VALORPROVENTO) AS TOTAL' +CR_LF+
      'FROM' +CR_LF+
      '  HISTRUBSAL H, FUNCIONARIO F, CARGO C' +CR_LF+
      'WHERE' +CR_LF+
      '  (H.CODPROVDESC    = ' +QuotedStr(CodProvDesc)+ ') AND' +CR_LF+
      '  (H.MES           >= ' +QuotedStr(IncDataAM(RetornaAnoMes(StrToDate(DataRef)),-iQtdeMeses))+ ') AND' +CR_LF+
      '  (H.MES           <= ' +QuotedStr(IncDataAM(RetornaAnoMes(StrToDate(DataRef)),-1))+ ') AND' +CR_LF+
      '  (H.IDMODULO       = 21) AND' +CR_LF+
      IFF(iTipoFolha <> -1, '  (H.IDMOTIVO       = ' +TipoFolha+ ') AND'+CR_LF, '')+
      IFF(IdCargo <> -1, '  (F.IDCARGO        = ' +IntToStr(IdCargo)+ ') AND'+CR_LF, '')+
      IFF(IdEstab <> -1, '  (F.IDESTAB        = ' +IntToStr(IdEstab)+ ') AND'+CR_LF, '')+
      IFF(IdEmpresa <> -1, '  (F.IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF, '')+
      IFF(Trim(CodCentroCusto) <> '"-1"',
        '  (F.CODCENTROCUSTO = ' +QuotedStr(TiraCaracter(CodCentroCusto, '"'))+ ') AND'+CR_LF, '')+
      IFF(CBO <> -1, '  (C.CBO2002        = ' +IntToStr(CBO)+ ') AND'+CR_LF, '')+
      '  (F.IDCARGO        = C.IDCARGO) AND' +CR_LF+
      '  (F.IDPESSOA       = H.IDPESSOA)');

    Result := FloatToStr(_CdsAux.FieldByName('TOTAL').asFloat);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.MediaHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa: string): string;
var
  iQtdeMeses, iTipoFolha: integer;
begin
  try
    StrToDate(DataRef);
    iQtdeMeses := StrToInt(QtdeMeses);
    iTipoFolha := StrToInt(TipoFolha);
    if (CodProvDesc = '') or (iQtdeMeses <= 0) or (iTipoFolha < -1) then
    begin
      Result := '0';
      exit;
    end;
  except
    Result := '0';
    exit;
  end;

  Result := FloatToStr(StrToFloat(
    SomaHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa)) / iQtdeMeses);
end;

function TCtrlCalcRub.QtdeHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha, OpcaoEmpresa: string): string;
var
  _CdsAux: TCMClientDataSet;
  iOpcaoEmpresa, iQtdeMeses, iTipoFolha: integer;
begin
  iOpcaoEmpresa := StrInt(OpcaoEmpresa);
  try
    StrToDate(DataRef);
    iQtdeMeses := StrToInt(QtdeMeses);
    iTipoFolha := StrToInt(TipoFolha);
    if (CodProvDesc = '') or (iQtdeMeses <= 0) or (iTipoFolha < -1) then
    begin
      Result := '0';
      exit;
    end;
  except
    Result := '0';
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT COUNT(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
    'FROM   HISTRUBSAL'+CR_LF+
    'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
    '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
    '      (MES        >= ' +QuotedStr(IncDataAM(RetornaAnoMes(StrToDate(DataRef)),-iQtdeMeses))+') AND'+CR_LF+
    '      (MES        <= ' +QuotedStr(IncDataAM(RetornaAnoMes(StrToDate(DataRef)),-1))+') AND'+CR_LF+
    '      (IDMODULO    = 21) AND'+CR_LF+
    '      (MES  NOT LIKE ''%13'')'+
    IFF(iOpcaoEmpresa=-1, '', ' AND'+ CR_LF +
      '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ')')+
    IFF(iTipoFolha<>-1, ' AND'+ CR_LF +
      '      (IDMOTIVO    = ' +TipoFolha+ ')', ''));

  Result := FloatToStr(_CdsAux.FieldByName('VALORPROVENTO').asFloat);
  _CdsAux.Free;
end;

function TCtrlCalcRub.ValorRubrica(CodProvDesc: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  if (CodProvDesc = '') then
  begin
    Result := '0';
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT SUM(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
    'FROM   ' +FNomeTabela+CR_LF+
    'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
    '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
    '      (MES         = ' +QuotedStr(FMesRef)+') AND'+CR_LF+
    '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
    '      (IDMOTIVO    = ' +IntToStr(FTipoFolha)+ ')');

  Result := FloatToStr(_CdsAux.FieldByName('VALORPROVENTO').asFloat);
  _CdsAux.Free;
end;

function TCtrlCalcRub.TrazCodProvDescCLT(CodRubCLT: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  if (CodRubCLT = '43691') then  // valor do aviso previo indenizado
    _CdsAux.Data := GetDataPacket(
      'SELECT R.CODPROVDESC'+CR_LF+
      'FROM  RUBRICAXPESS R, PROVDESC P'+CR_LF+
      'WHERE (R.IDRUBRICA = P.IDPROVENTO)'+CR_LF+
      'AND   (R.IDPESSOA  = ' +IntToStr(FIdEmpresa)+ ')'+CR_LF+
      'AND   (P.CODRUBCLT = ' +QuotedStr(CodRubCLT)+')')
  else  // CLT 99xxx
    _CdsAux.Data := GetDataPacket(
      'SELECT TRIM(SUBSTR(DESCRICAO,INSTR(DESCRICAO,'+QuotedStr('''')+'),21)) AS CODPROVDESC'+CR_LF+
      'FROM  RUBRICACLT'+CR_LF+
      'WHERE '+CR_LF+
      '      (CODRUBCLT   = ' +QuotedStr(CodRubCLT)+')');

  Result := TrocaCaracter(_CdsAux.FieldByName('CODPROVDESC').asString, '''', '');
  _CdsAux.Free;
end;

function TCtrlCalcRub.DiasTrab(DataRef, OpcaoDiasTrab: string): string;
var
  iNumDias, iOpcao: integer;
  wDiaIni, wDiaFim, wMesFim, wDiaNormalFim: word;
  DatIni, DatFim: TDate;
  AnoMes: string;
begin
  try
    StrToDate(DataRef);
    iOpcao := StrToInt(OpcaoDiasTrab);
    if not(iOpcao in [1..5]) then
    begin
      Result := '0';
      exit;
    end;
  except
    Result := '0';
    exit;
  end;

  AnoMes := RetornaAnoMes(StrToDate(DataRef));
  DatIni := StrToDate('01/' + Copy(AnoMes,6,2) +'/'+ Copy(AnoMes,1,4));
  DatFim := IncData2(DatIni,-1,1,0);

  // Selecionar o objeto de Histórico de Situações somente quando for uma das opções pertinentes
  if (iOpcao in [2,4,5]) then
    FCdsDadosAfast.Data := FCtrlDiasTrab.ListDadosAfast(StrToFloat(FIdPessoa), DatIni, DatFim);

  if (iOpcao in [1..4]) then
  begin
    iNumDias := 30;
    wDiaIni := 1;

    // Admissao e Demissao Fora do Mes
    if (FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime > DatFim) or
       ((FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime < DatIni) and
        (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D'))  or
       ((FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime <= DatIni) and
        (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'F') and
        (iOpcao in [2,4])) then
      exit;

    // Admissao e Demissão no Mês
    if (FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime > DatIni) then
    begin
      wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime);
      if (wDiaIni = 31) then
        Dec(wDiaIni);
      iNumDias := iNumDias - wDiaIni + 1;
    end;

    if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime < DatFim) and
       (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D') then
    begin
      wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime);
      iNumDias := wDiaFim - wDiaIni + 1;
    end;

    // Afastamento e Retorno no Mes
    if (iOpcao in [2,4]) then
    begin
      if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime <= DatFim) and
         (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'F') then
        iNumDias := 0;

      while not(FCdsDadosAfast.EOF) do
      begin
        if (FCdsDadosAfast.FieldByName('TIPOSIT').asString <> 'A') or
           (FCdsDadosAfast.FieldByName('DATASITFUNC').asDateTime <>
            FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) then
        begin
          wDiaIni := ExtraiDia(FCdsDadosAfast.FieldByName('DATASITFUNC').asDateTime);
          if (FCdsDadosAfast.FieldByName('TIPOSIT').asString = 'A') then
            iNumDias := iNumDias - wDiaIni
          else
            iNumDias := iNumDias + wDiaIni - 1;
        end;
        FCdsDadosAfast.Next;
      end;
    end;

    // Férias no Mês
    if (iOpcao in [3,4]) and
       (FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime >= DatIni) and
       (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime <= DatFim) then
    begin
      wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime);
      wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime);
      wMesFim := ExtraiMes(FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime);
      wDiaNormalFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime);

      if (FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime > DatFim) then
      begin
        wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime);
        wMesFim := ExtraiMes(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime);
      end;

      if (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime < DatIni) then
        wDiaIni := 1;

      iNumDias := iNumDias - (wDiaFim - wDiaIni + 1);
      if (iNumDias > 0) and (wMesFim = 2) and (wDiaIni = 1) and (wDiaFim = wDiaNormalFim) then
        if (wDiaNormalFim = 28) then
          iNumDias := iNumDias - 2
        else
          iNumDias := iNumDias - 1;
    end;

    if (iNumDias < 0) then
      iNumDias := 0
    else
    if (iNumDias > 30) then
      iNumDias := 30;
  end
  else
    iNumDias := FCtrlDiasTrab.Calcular(
      FCdsDadosFuncAtual.FieldByName('IDPESSOA').asFloat,
      true, true, false, true, true, true, DatIni, DatFim,
      FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime,
      FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime);

  Result := IntToStr(iNumDias);
end;

function TCtrlCalcRub.DiasFerias(InicioFerias, OpcaoFerias: string): string;
var
  dValor: double;
  iOpcao: integer;
begin
  try
    StrToDate(InicioFerias);
    iOpcao := StrToInt(OpcaoFerias);
    if not(iOpcao in [0,1]) or
       (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asString= '') then
    begin
      Result := '0';
      exit;
    end;
  except
    Result := '0';
    exit;
  end;

  if (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asString = Trim(InicioFerias)) then
  begin
    dValor := FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime -
              FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime + 1;

    if (iOpcao = 1) and (FCdsDadosFuncAtual.FieldByName('FLGABONO').asInteger = 1) then
    begin
      if (FCdsDadosFuncAtual.FieldByName('QTDIASABONO').asInteger = 0) then
        dValor := Trunc(dValor * 1.5)
      else
        dValor := dValor + FCdsDadosFuncAtual.FieldByName('QTDIASABONO').asInteger;
    end;
  end
  else
    dValor := 0;

  Result := FloatToStr(dValor);
end;

function TCtrlCalcRub.DiasFeriasNoMes(DataRef: string): string;
var
  wDiaIni, wDiaFim: word;
  DatIni, DatFim: TDate;
  AnoMes: string;
  iValor: integer;
begin
  try
    StrToDate(DataRef);
  except
    Result := '0';
    exit;
  end;

  AnoMes := RetornaAnoMes(StrToDate(DataRef));
  DatIni := StrToDate('01/' + Copy(AnoMes,6,2) +'/'+ Copy(AnoMes,1,4));
  DatFim := IncData(DatIni,-1,1,0);

  if (RetornaAnoMes(FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime) >= AnoMes) and
     (RetornaAnoMes(FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime) <= AnoMes) then
  begin
    wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime);
    wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime);

    if (FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime > DatFim) then
      wDiaFim := ExtraiDia(DatFim);

    if (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime < DatIni) then
      wDiaIni := 1;

    iValor := (wDiaFim - wDiaIni + 1);
  end
  else
    iValor := 0;

  Result := IntToStr(iValor);
end;

function TCtrlCalcRub.TabGenerica(NomeTabela, ValorChave, ColPesquisa, ColConsulta,
  Opcao: string): string;
var
  sSQLValor, sTipoDado, sSqlAux2, sSqlAux,
  sValorAux, sCond, sOrder, sValorCampo, sLinha: string;
  bNumero, bErro: boolean;
  _CdsAux: TCMClientDataSet;
begin
  if (NomeTabela = '') or (ValorChave = '') then
  begin
    Result := '';
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);

  // Caso Tipo de Pesquisa inválido, pesquisa igual (0)
  if (Opcao <> '0') and (Opcao <> '1') and (Opcao <> '2') then
    Opcao := '0';

  // Monta Condicoes do SQL de acordo com o Tipo de Pesquisa
  if (Opcao = '0') or (Opcao = '') then
  begin
    sCond := ' = ';
    sOrder := '';
  end;

  if (Opcao = '1') then
  begin
    sCond := ' <= ';
    sOrder := ' ORDER BY 1 DESC ';
  end;

  if (Opcao = '2') then
  begin
    sCond := ' >= ';
    sOrder := ' ORDER BY VALOR' ;
  end;

  //------------------------------------------------------------------------------
  // Busca o Tipo de Dado do campo pesquisado na Tabela Genérica
  bNumero := false;
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT IDTIPODADO'+CR_LF+
      'FROM   CAMPOTABGENER'+CR_LF+
      'WHERE  (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
      '       (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ')');

    sTipoDado := _CdsAux.FieldByName('IDTIPODADO').asString;
    bErro := false;
  except
    bErro := true;
  end;

  if not(bErro) then
  begin
    sSQLValor := 'TO_NUMBER(REPLACE(REPLACE(VALOR,'','',''.''),''.'',''' +SepDecORACLE+ '''))';

    // Tipo de Dado NUMERICO
    if (sTipoDado = '1') then
    begin
      // Acertar Valor de pesquisa
      ValorChave := OraNumero(TiraCaracter(TiraCaracter(ValorChave,'['),']'));

      // Tipo de ordenação
      if (Opcao = '1') then
        sOrder := ' ORDER BY' +CR_LF+ sSQLValor+ ' DESC'
      else
      if (Opcao = '2') then
        sOrder := ' ORDER BY' +CR_LF+ sSQLValor;

      bNumero := true; // Indicador de valor numérico

      // Consultar Valor Desejado
      _CdsAux.Close;
      _CdsAux.Data := GetDataPacket(
        'SELECT /*+ INDEX (VALTABGENER XPKVALTABGENER)*/'+CR_LF+
        '  ' +sSQLValor+ ' AS VALOR, NUMLINHA'+CR_LF+
        'FROM'+CR_LF+
        '  VALTABGENER'+CR_LF+
        'WHERE'+CR_LF+
        '  (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
        '  (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ') AND'+CR_LF+
        '  (' +sSQLValor +' '+ sCond + ValorChave +')'+CR_LF+
        sOrder);
      // Guarda a linha do valor desejado
      sLinha := _CdsAux.FieldByName('NUMLINHA').asString;
    end
    else
    begin
      // Tipo de Dado ALFANUMERICO
      if (sTipoDado = '2') then
      begin
        sValorCampo := ' Valor ';
        ValorChave := QuotedStr(ValorChave);
      end
      else
      begin
        // Tipo de Dado DATA
        if (sTipoDado = '3') then
        begin
          sValorCampo := 'TO_DATE(VALOR,''DD/MM/YYYY'')';
          ValorChave := 'TO_DATE(' +ValorChave+ ',''DD/MM/YYYY'')';
        end
        else
        begin
          // Outro Tipo ERRO
          if (ColPesquisa <> '''NUMLINHA''') then
          begin
            bErro := true;
            Result := '-6010'
          end
          else
            sValorCampo := ' VALOR ';
        end;
      end;
    end;

    //------------------------------------------------------------------------------
    // Caso não seja número continua
    if not(bNumero) then
    begin
      if (ColPesquisa <> '''NUMLINHA''') then
      begin
        if not(bErro) then
        begin
          // Caso Dado tipo DATA
          if (sTipoDado = '3') then
            sSqlAux := 'SELECT TO_DATE(VALOR,''DD/MM/YYYY'') AS VALOR, NUMLINHA'+CR_LF+
                       'FROM   VALTABGENER'+CR_LF+
                       'WHERE (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
                       '      (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ') AND'+CR_LF+
                       sValorCampo + sCond + ValorChave +' '+ sOrder
          else
            sSqlAux := 'SELECT VALOR, NUMLINHA'+CR_LF+
                       'FROM   VALTABGENER'+CR_LF+
                       'WHERE (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
                       '      (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ') AND'+CR_LF+
                       sValorCampo + sCond + ValorChave +' '+ sOrder;

          if (sValorAux = '') then
            sValorAux := sValorCampo;

          if (sTipoDado = '1') then
            sSqlAux2 := 'SELECT ' +sSQLValor+ ' VALOR, NUMLINHA'+CR_LF+
                        'FROM   VALTABGENER'+CR_LF+
                        'WHERE (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
                        '      (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ') AND'+CR_LF+
                        sValorAux + sCond + ValorChave +' '+ sOrder;

          _CdsAux.Close;
          _CdsAux.Data := GetDataPacket(sSqlAux);
          sLinha := _CdsAux.FieldByName('NUMLINHA').asString;

          if (sLinha = '') and (sTipoDado = '1') then
          begin
            _CdsAux.Close;
            _CdsAux.Data := GetDataPacket(sSqlAux2); // SQL feito para acabar com o bug do Oracle 8.0
            sLinha := _CdsAux.FieldByName('NUMLINHA').asString;
          end;

          if (sLinha = '') then
          begin
            bErro := true;
            Result := '';
          end;
        end;
      end
      else
        slinha := ValorChave;
    end;

    if (sLinha = '') then
    begin
      if (sTipoDado = '1') then
        Result := '0'
      else
        Result := '';

      _CdsAux.Free;
      exit;
    end;

    if not(bErro) then
    begin
      _CdsAux.Close;
      _CdsAux.Data := GetDataPacket(
        'SELECT VALOR'+CR_LF+
        'FROM   VALTABGENER'+CR_LF+
        'WHERE (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
        '      (CODCAMPO  = ' +UpperCase(QuotedStr(ColConsulta))+ ') AND'+CR_LF+
        '      (NUMLINHA  = ' +sLinha+ ')');

      Result := _CdsAux.FieldByName('VALOR').asString;
    end;
  end;

  // Caso Resultado Nulo, Retorna 1 espaço.
  if (Result = '') then
    Result := ' ';

  _CdsAux.Free;
end;

function TCtrlCalcRub.TabLonga(Linha: string): string;
type
  TCampoTabLonga = record
    Campo: string;
    Op: string;
    Valor: string;
    Tipo: char;
  end;
var
  CampoTabLonga: TCampoTabLonga;
  i, c, iNumCampos: integer;
  bParamMenor_Ou_Igual: boolean;
  sFormula, sTipo, sTipoAux, sSQL, sTabela, sCampos, sCampoAtual, sCampoRet: string;
  _CdsAux: TCMClientDataSet;

{->}procedure GetDadosCampoAtual(NumOperador: byte);
    begin
      CampoTabLonga.Campo := Copy(sCampoAtual, 1, Pos(Operador[NumOperador],sCampoAtual)-1);
      CampoTabLonga.Valor := Copy(sCampoAtual,
        Length(CampoTabLonga.Campo)+Length(Operador[NumOperador])+1, Length(sCampoAtual));
      CampoTabLonga.Op := Operador[NumOperador];

      sTipoAux := TpDadoCons(sTabela, CampoTabLonga.Campo);
      if (sTipoAux <> '') then
        CampoTabLonga.Tipo := sTipoAux[1];

      bParamMenor_Ou_Igual := (CampoTabLonga.Op = '<=');
{->}end;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    Result := '0';
    // Retirar todos os espaços da fórmula
    sFormula := TrocaCaracter(Linha, ' ', '');

    sFormula := TiraCaracter(sFormula,'[');
    ExtraiString(sFormula, sCampos, ']'); // Campos
    ExtraiString(sFormula, sTabela, ';'); // Tabela
    ExtraiString(sFormula, sCampoRet, ';'); // Campo de Retorno

    if (sCampos = '') or (sCampoRet = '') or (sTabela = '') then
      Exception.Create(('Erro nos parâmetros da pesquisa para a função TABLONGA.'));

    // Tipo de Consulta
    sTipo := TiraCaracter(sFormula,'"');
    if (sTipo <> '1') then
      sTipo := '0';

    // Zerar valores da estrutura utilizada na captura dos valores dos campos
    FillChar(CampoTabLonga, SizeOf(CampoTabLonga), 0);

    iNumCampos := ContaCaracter(sCampos, ';') + 1;
    bParamMenor_Ou_Igual := false;
    if (sTipo = '1') then // Tipo igual a 1 faz consulta por CAMPOTABGENER (Tabela Genérica)
    begin
      sSQL := 'SELECT'+CR_LF+
              '  V.NUMLINHA, V.CODCAMPO, V.VALOR'+CR_LF+
              'FROM'+CR_LF+
              '  VALTABGENER V,';

      for i:=1 to ContaCaracter(sCampos,';')+1 do
      begin
        ExtraiString(sCampos, sCampoAtual, ';'); // Pega o campo atual

        for c:=1 to NUM_OPERADORES do
        begin
          if (Pos(Operador[c], sCampoAtual) > 0) then
          begin
            GetDadosCampoAtual(c);
            break;
          end;
        end;

        if (CampoTabLonga.Campo <> '') then
        begin
          case (CampoTabLonga.Tipo) of
            'N' :
            begin
              sSQL := sSQL +CR_LF+
                '(SELECT AUX.NUMLINHA, AUX.CODCAMPO, AUX.VALOR'+CR_LF+
                ' FROM  (SELECT NUMLINHA, CODCAMPO, CODTABELA,'+CR_LF+
                '               TO_NUMBER(VALOR,''99999999999.9999'') AS VALOR'+CR_LF+
                '        FROM   VALTABGENER) AUX'+CR_LF+
                ' WHERE (AUX.CODTABELA = ' +QuotedStr(sTabela)+ ') AND'+CR_LF+
                '       (AUX.CODCAMPO  = ' +QuotedStr(CampoTabLonga.Campo)+ ') AND'+CR_LF+
                '       (AUX.VALOR     '+CampoTabLonga.Op+
                CampoTabLonga.Valor+ ')) X'+ IntToStr(i);
            end;
            'A' :
            begin
              sSQL := sSQL +CR_LF+
                '(SELECT NUMLINHA, CODCAMPO, VALOR'+CR_LF+
                ' FROM   VALTABGENER'+CR_LF+
                ' WHERE (CODTABELA = ' +QuotedStr(sTabela)+ ') AND'+CR_LF+
                '       (CODCAMPO  = ' +QuotedStr(CampoTabLonga.Campo)+ ') AND'+CR_LF+
                '       (VALOR     ' +CampoTabLonga.Op+
                QuotedStr(CampoTabLonga.Valor)+ ')) X'+ IntToStr(i);
            end
            else
            begin
              sSQL := sSQL +CR_LF+
                '(SELECT NUMLINHA, CODCAMPO, VALOR'+CR_LF+
                ' FROM   VALTABGENER'+CR_LF+
                ' WHERE (CODTABELA = ' +QuotedStr(sTabela)+ ') AND'+CR_LF+
                '       (CODCAMPO  = ' +QuotedStr(CampoTabLonga.Campo)+ ') AND'+CR_LF+
                '       (TO_DATE(VALOR,''DD/MM/YYYY'') ' +CampoTabLonga.Op+
                'TO_DATE(' +QuotedStr(CampoTabLonga.Valor)+ ',''DD/MM/YYYY''))) X'+IntToStr(i);
            end;    
          end;

          if (sCampos <> '') then
            sSQL := sSQL + ', ';
        end;
      end;

      sSQL := sSQL +CR_LF+
        'WHERE'+CR_LF+
        '  (V.CODTABELA = ' +QuotedStr(sTabela)+ ') AND'+CR_LF+
        '  (V.CODCAMPO  = ' +QuotedStr(sCampoRet)+ ') AND'+CR_LF;

      for c:=1 to iNumCampos do
      begin
        if (c > 1) then
          sSQL := sSQL + '  (X1.NUMLINHA = X' +IntToStr(c)+ '.NUMLINHA) AND'+CR_LF;

        sSQL := sSQL + '  (V.NUMLINHA  = X' +IntToStr(c)+ '.NUMLINHA)'+
          IFF(c < iNumCampos,' AND','')+CR_LF;
      end;
      
      sSQL := sSQL + 'ORDER BY'+CR_LF+
                     '  V.NUMLINHA';

      _CdsAux.Close;
      _CdsAux.Data := GetDataPacket(sSQL);

      if (bParamMenor_Ou_Igual) then
        _CdsAux.Last;

      if not(_CdsAux.IsEmpty) then
        Result := _CdsAux.FieldByName('VALOR').asString
      else
        Result := '0';
    end
    else
    begin // Tipo diferente de 1 faz consulta por LONGTABGENER (Tabela Longa)
      _CdsAux.Close;
      _CdsAux.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  LC.IDTABELA, LC.IDCAMPO, LC.DESCRICAO AS DESCRICAO'+CR_LF+
        'FROM'+CR_LF+
        '  LONGCMPTABGENER LC,'+CR_LF+
        '  (SELECT IDTABELA, DESCRICAO'+CR_LF+
        '   FROM   LONGTABGENER'+CR_LF+
        '   WHERE  (DESCRICAO = ' +QuotedStr(sTabela)+ ')) L'+CR_LF+
        'WHERE'+CR_LF+
        '  (LC.IDTABELA = L.IDTABELA)');

      if (_CdsAux.Locate('DESCRICAO', sCampoRet, [])) then
        sCampoRet := 'C' +_CdsAux.FieldByName('IDCAMPO').asString
      else
        Exception.Create(('Erro nos parâmetros da pesquisa para a função TABLONGA.')+
          CR_LF+ ('O campo de retorno "') +sCampoRet+
          ('" não existe na tabela ') +sTabela);

      sSQL :=
        'SELECT'+CR_LF+
        '  IDTABELA, NUMLINHA,' +CR_LF+
        '  C1, C2, C3, C4, C5, C6, C7, C8, C9, C10,' +CR_LF+
        '  C11, C12, C13, C14, C15, C16, C17, C18, C19, C20,' +CR_LF+
        '  C21, C22, C23, C24, C25, C26, C27, C28, C29, C30,' +CR_LF+
        '  C31, C32, C33, C34, C35, C36, C37, C38, C39, C40,' +CR_LF+
        '  C41, C42, C43, C44, C45, C46, C47, C48, C49, C50,' +CR_LF+
        '  C51, C52, C53, C54, C55, C56, C57, C58, C59, C60,' +CR_LF+
        '  C61, C62, C63, C64, C65, C66, C67, C68, C69, C70,' +CR_LF+
        '  C71, C72, C73, C74, C75, C76, C77, C78, C79, C80,' +CR_LF+
        '  C81, C82, C83, C84, C85, C86, C87, C88, C89, C90,' +CR_LF+
        '  C91, C92, C93, C94, C95, C96, C97, C98, C99, C100' +CR_LF+
        'FROM' +CR_LF+
        '  LONGVALTABGENER' +CR_LF+
        'WHERE' +CR_LF+
        '  (IDTABELA = ' +_CdsAux.FieldByName('IDTABELA').asString+ ') AND' +CR_LF;

      // Verificar se os campos existem na Tabela
      for i:=1 to iNumCampos do
      begin
        ExtraiString(sCampos, sCampoAtual, ';'); // Pega o campo atual
        for c:=1 to NUM_OPERADORES do
        begin
          if (Pos(Operador[c], sCampoAtual) > 0) then
          begin
            GetDadosCampoAtual(c);
            if (_CdsAux.Locate('DESCRICAO', CampoTabLonga.Campo, [])) then
              CampoTabLonga.Campo := 'C'+ _CdsAux.FieldByName('IDCAMPO').asString
            else
              Exception.Create(
                ('Erro nos parâmetros da pesquisa para a função TABLONGA.')+CR_LF+
                ('O campo de pesquisa "') +CampoTabLonga.Campo+
                ('" não existe na tabela ') +sTabela);
            break;
          end;
        end;

        // Atribuir os campos à cláusula WHERE da Query de busca
        try
          StrToFloat(CampoTabLonga.Valor);
          sSQL := sSQL +'  ('+ CampoTabLonga.Campo +' '+ CampoTabLonga.Op+
            ' '+ CampoTabLonga.Valor +')'+
            IFF(i < iNumCampos,' AND','')+CR_LF;
        except
          sSQL := sSQL +'  ('+ CampoTabLonga.Campo +' '+ CampoTabLonga.Op+
            ' '+ QuotedStr(UpperCase(CampoTabLonga.Valor)) +')'+
            IFF(i < iNumCampos,' AND','')+CR_LF;
        end;
      end;

      _CdsAux.Close;
      _CdsAux.Data := GetDataPacket(sSQL);
      if (bParamMenor_Ou_Igual) then
        _CdsAux.Last;

      if not(_CdsAux.IsEmpty) then
        Result := _CdsAux.FieldByName(sCampoRet).asString
      else
        Result := '0';
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := '0';
    end;
  end;
  _CdsAux.Free;
end;

function TCtrlCalcRub.TpDadoCons(NomeTabGener, Campo: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  //A->Alfanumérico; D->Data; N->Numérico
  _CdsAux.Data := GetDataPacket(
    'SELECT UPPER(SUBSTR(T.NOMETIPODADO,1,1)) AS TIPO'+CR_LF+
    'FROM   CAMPOTABGENER C, TIPODADO T'+CR_LF+
    'WHERE  (C.CODTABELA  = ' +QuotedStr(NomeTabGener)+ ') AND'+CR_LF+
    '       (C.CODCAMPO   = ' +QuotedStr(Campo)+ ') AND'+CR_LF+
    '       (C.IDTIPODADO = T.IDTIPODADO)');

  Result := _CdsAux.FieldByName('TIPO').asString;
  _CdsAux.Free;
end;

function TCtrlCalcRub.Indice(Indexador, Data, Exato: string): string;
var
  sPer, sFiltro: string;
  iMoeCodigo: integer;
  _CdsAux: TCMClientDataSet;
begin
  if (Indexador = '') or (Data = '') then
  begin
    Result := '';
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);

  if (Data = 'HOJE') then
    Data := DateToStr(Date)
  else
    Data := TiraCaracter(Data, ''''); // Retirar pliques da Datas

  _CdsAux.Data := GetDataPacket(
    'SELECT 1 AS REGRA, MOECODIGO, MOEPERIODICIDADE'+CR_LF+
    'FROM   MOEDA'+CR_LF+
    'WHERE  (UPPER(MOESIGLA) = ' +QuotedStr(UpperCase(Indexador))+ ')');

  iMoeCodigo := StrInt(_CdsAux.FieldByName('MOECODIGO').asString);
  sPer := _CdsAux.FieldByName('MOEPERIODICIDADE').asString;

  _CdsAux.Close;
  if (Exato = '0') or (Exato = '') then
  begin
    if (sPer = 'A') or (sPer = 'M') then
      sFiltro := 'COTMESREF = ' +QuotedStr(Copy(Data,4,2) + Copy(Data,7,4))
    else
      sFiltro := 'COTDATA   = TO_DATE(' +QuotedStr(Data)+ ',''DD/MM/YYYY'')';

    _CdsAux.Data := GetDataPacket(
      'SELECT 1 AS REGRA, COTVALOR, COTDATA, COTMESREF'+CR_LF+
      'FROM   COTACAOMOEDA'+CR_LF+
      'WHERE  (MOECODIGO = ' +IntToStr(iMoeCodigo)+ ') AND'+CR_LF+
      '       (' +sFiltro+ ')');
  end
  else
  begin
    if (sPer = 'A') or (sPer = 'M') then
      sFiltro := 'SUBSTR(COTMESREF,3,4) || SUBSTR(COTMESREF,1,2) <= ' +
                 QuotedStr(Copy(Data,7,4) + Copy(Data,4,2))
    else
      sFiltro := 'COTDATA  <= TO_DATE(' +QuotedStr(Data)+ ',''DD/MM/YYYY'')';

    _CdsAux.Data := GetDataPacket(
      'SELECT 1 AS REGRA, COTVALOR, COTDATA, COTMESREF'+CR_LF+
      'FROM   COTACAOMOEDA'+CR_LF+
      'WHERE  (MOECODIGO = ' +IntToStr(iMoeCodigo)+ ') AND'+CR_LF+
      '       (' +sFiltro+ ')'+CR_LF+
      'ORDER BY'+CR_LF+
      '  COTDATA DESC');
  end;

  if (_CdsAux.IsEmpty) then
    Result := '0'
  else
    Result := _CdsAux.FieldByName('COTVALOR').asString;

  _CdsAux.Free;
end;

function TCtrlCalcRub.IRRF(NumDep, DataNasc, ValorBase, DataRef, TipodeResultado: string): string;
var
  Tipo: integer;
  dAliquota, dValorBase: double;
begin
  if (NumDep = '') then
    NumDep := '0';
  if (ValorBase = '') then
    ValorBase := '0';
  if (TipodeResultado = '') then
    TipodeResultado := '0';
  if (DataNasc = '') then
    DataNasc := DateToStr(Date);
  if (DataRef = '') then
    DataRef := DateToStr(Date);

  dValorBase := ExecFormaCalc(ValorBase);

  Tipo := StrToInt(TipodeResultado);

  case (Tipo) of
    0..2 : Result := FloatToStr(FCtrlIRRF.Calcular(StrToInt(NumDep), StrToDate(DataNasc),
      dValorBase, dAliquota, StrToDate(DataRef), StrToInt(TipodeResultado)));
    3 : Result := IntToStr(FCtrlIRRF.IdadeIdoso);
    4 : Result := FloatToStr(FCtrlIRRF.ValorIdoso);
    5 : Result := FloatToStr(FCtrlIRRF.ValorDependente);
  end;
end;

function TCtrlCalcRub.Maximo(Formula: string): string;
var
  FormulaAux: string;
  p, i: LongInt;
  Valor, Maior: real;
begin
  if (Formula = '') then
  begin
    Result := '';
    exit;
  end;

  FormulaAux := Formula + ';';
  p := 1;
  Maior := 0;
  repeat
    i := Pos(';',FormulaAux);
    if (i = 0) then
      FormulaAux := '';
    try
      Valor := ExecFormaCalc(Copy(FormulaAux, 1, i-1));
      if (p = 1) or (Valor > Maior) then
        Maior := Valor;
      Inc(p);
    except
    end;
    FormulaAux := Copy(FormulaAux, i+1, Length(FormulaAux));
  until (FormulaAux = '');

  Result := FloatToStr(Maior);
end;

function TCtrlCalcRub.Minimo(Formula: string): string;
var
  FormulaAux: string;
  p, i: LongInt;
  Valor, Menor: real;
begin
  if (Formula = '') then
  begin
    Result := '';
    exit;
  end;

  FormulaAux := Formula + ';';
  p := 1;
  Menor := 0;
  repeat
    i := Pos(';',FormulaAux);
    if (i = 0) then
      FormulaAux := '';
    try
      Valor := ExecFormaCalc(Copy(FormulaAux, 1, i-1));
      if (p = 1) or (Valor < Menor) then
        Menor := Valor;
      Inc(p);
    except
    end;
    FormulaAux := Copy(FormulaAux, i+1, Length(FormulaAux));
  until (FormulaAux = '');

  Result := FloatToStr(Menor);
end;

function TCtrlCalcRub.ExecFuncaoROUND(Param1, Param2: string): double;
var
  Val: double;
  Casas: integer;
begin
  Result := 0;
  // Se algum parâmetro estiver vazio, retornar erro
  if (Trim(Param1) = '') or (Trim(Param2) = '') then
    exit;

  // Obter o valor
  Val := ExecFormaCalc(Param1);
  if (FErroExecucao) then
  begin
    Result := 0;
    exit;
  end;

  // Obter o número de casas decimais
  try
    Casas := StrToInt(Param2);
  except
    Result := 0;
    exit;
  end;
  Result := Arredondar(Val, Casas);
end;

function TCtrlCalcRub.DifMesesArred(DataIni, DataFin: string): integer;
var
  D1, M1, A1, D2, M2, A2: integer;
begin
  try
    D1 := StrToInt(Copy(DataIni,1,2));
    M1 := StrToInt(Copy(DataIni,4,2));
    A1 := StrToInt(Copy(DataIni,7,4));
    D2 := StrToInt(Copy(DataFin,1,2));
    M2 := StrToInt(Copy(DataFin,4,2));
    A2 := StrToInt(Copy(DataFin,7,4));

    Result := (M2+12*A2)-(M1+12*A1);
    if (M2 = 2) and (D2 >= 28) then
      D2 := 30;

    if (M1 = 2) and (D1 >= 28) then
      D1 := 30;

    if ((D2 - D1) >= 14) then
      Inc(Result);

  //*  if ((D2 - D1) < 0) and (D2 + IFF(D1=31, 1, 31-D1) < 15) then
      Dec(Result);
  except
    Result := 0;
  end;
end;

function TCtrlCalcRub.Avos13: integer;
var
  dtAdm, dtDem, dtIni: TDate;
begin
  dtAdm := FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime;
  dtDem := FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime;
  dtIni := FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime;

  if (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D') and
     (FormatDateTime('YYYYMM', dtAdm) = FormatDateTime('YYYYMM', dtDem)) then
  begin
     if (dtAdm < 15) or  (dtDem < 15) then
      Result := 0
    else
      Result := 1;
  end
  else
  begin
    // considerar a diferença de meses e entrada até o dia 16
    // independente do número de dias nos meses inicial e final
    {Result :=
      IFF(FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString='D',
          ExtraiMes(dtDem), ExtraiMes(dtIni)) -
      IFF(ExtraiAno(dtAdm) = ExtraiAno(dtIni),
          ExtraiMes(dtAdm), 1) +
      1 -
      IFF((ExtraiAno(dtAdm) = ExtraiAno(dtIni)) and
          (ExtraiDia(dtAdm) > 16), 1, 0) -
      IFF((FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D') and
          (ExtraiDia(dtDem) < 15), 1, 0);      }

    if (Result < 0) then
      Result := 0;
  end;    
end;

function TCtrlCalcRub.AvosFerias: integer;
begin
  Result := DifMesesArred(FCdsDadosFuncAtual.FieldByName('PROXAQUISFER').asString,
    IFF(FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString='D',
        FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asString,
        FCdsDadosFuncAtual.FieldByName('NORMALFIM').asString));
end;

function TCtrlCalcRub.AvosPerdidos(Data1, Data2, CodigoMotivo: string): integer;
var
  sSQL, DataIni, DataFim: string;
  _CdsAux: TCMClientDataSet;
begin
  Result := 0;
  try
    StrToDate(Data1);
    StrToDate(Data2);
    StrToInt(CodigoMotivo);
    if (StrToDate(Data1) > StrToDate(Data2)) then
      exit;
  except
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);

  sSQL :=
    'SELECT'+CR_LF+
    '  H.DATASITFUNC, S.TIPOSIT'+CR_LF+
    'FROM'+CR_LF+
    '  HSTSITFUNC H, SITFUNC S'+CR_LF+
    'WHERE'+CR_LF+
    '  (H.IDPESSOA     = ' +FIdPessoa+ ') AND'+CR_LF+
    '  (H.DATASITFUNC BETWEEN NVL((SELECT MAX(H.DATASITFUNC) FROM HSTSITFUNC H, SITFUNC S'+CR_LF+
    '                              WHERE'+CR_LF+
    IFF(CodigoMotivo = '-1', '', '((S.TIPOSIT <> ''F'') OR (H.IDMOTIVOOFIC = '+CodigoMotivo+')) AND'+CR_LF)+
    '                              (H.IDPESSOA     = ' +FIdPessoa+ ') AND'+CR_LF+
    '  (H.IDSITFUNC = S.IDSITFUNC) AND'+CR_LF+
    '     (H.DATASITFUNC < TO_DATE('+QuotedStr(Data1)+',''DD/MM/YYYY''))),' +CR_LF+
    '      TO_DATE(''01/01/1900'',''DD/MM/YYYY''))'+CR_LF+
    '      AND TO_DATE('+QuotedStr(Data2)+',''DD/MM/YYYY'')) AND'+CR_LF+
    '  (H.IDSITFUNC = S.IDSITFUNC)'+CR_LF+
    IFF(CodigoMotivo = '-1', '', 'AND ((S.TIPOSIT <> ''F'') OR (H.IDMOTIVOOFIC = '+CodigoMotivo+'))'+CR_LF)+
    'ORDER BY H.DATASITFUNC';

  _CdsAux.Data := GetDataPacket(sSql);

  while not(_CdsAux.EOF) do
  begin
    if (_CdsAux.FieldByName('TIPOSIT').asString <> 'F') then
    begin
      _CdsAux.Next;
      continue;
    end
    else
    begin
      if (_CdsAux.FieldByName('DATASITFUNC').asDateTime < StrToDate(Data1)) then
        DataIni := Data1
      else
        DataIni := DateToStr(IncData(_CdsAux.FieldByName('DATASITFUNC').asDateTime,15,0,0));

      _CdsAux.Next;
      if (_CdsAux.EOF) then
        DataFim := Data2
      else
        DataFim := _CdsAux.FieldByName('DATASITFUNC').asString;

      Result := Result + DifMesesArred(DataIni, DataFim);
    end;
  end;

  _CdsAux.Free;
end;

function TCtrlCalcRub.QtdeDepen(DataRef, TipoDepen, IdadeMin, IdadeMax, OpcaoTempo, OpcaoDeficiente: string): string;
var
  Int1: integer;
  _CdsAux: TCMClientDataSet;
  dValor: double;
  iIdadeMin, iIdadeMax, iOpcao: integer;
begin
  Result := '0';
  try
    StrToDate(DataRef);
    iIdadeMin := StrToInt(IdadeMin);
    iIdadeMax := StrToInt(IdadeMax);
    iOpcao := StrToInt(OpcaoTempo);
    if (TipoDepen = '') or (iIdadeMin < 0) or (iIdadeMax < 0) or not(iOpcao in [1..4]) then
      exit;
  except
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);

  Int1 := iOpcao;
  if (Int1 > 2) then
    Int1 := Int1 - 2;

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS CONTAGEM'+CR_LF+
    'FROM'+CR_LF+
    '  DEPENTIT D, PESSOAFISICA P'+CR_LF+
    'WHERE'+CR_LF+
    '  (D.IDTITULAR     = ' +FIdPessoa+ ') AND'+CR_LF+
    IFF(OpcaoDeficiente = '0', '', IFF(OpcaoDeficiente = '1', '  (NVL(P.FLGDEFICIENTE, 2) = 1) AND'+CR_LF,
      '  (NVL(P.FLGDEFICIENTE, 2) <> 1) AND'+CR_LF))+
    '  (D.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
    '  (TRUNC('+CR_LF+
    '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC) /'+CR_LF+
    '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) BETWEEN ' +
       IdadeMin+ ' AND ' +IdadeMax +CR_LF+
    '  ) AND'+CR_LF+
    '  (D.IDPESSOA      = P.IDPESSOA)');

  dValor := _CdsAux.FieldByName('CONTAGEM').asFloat;

  if (dValor > 0) and (iOpcao = 3) then // Anos
  begin
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM('+CR_LF+
      '    ROUND('+CR_LF+
      '      ('+CR_LF+
      '        TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC)'+CR_LF+
      '      )/365.25 -'+CR_LF+
      '      TRUNC('+CR_LF+
      '        ('+CR_LF+
      '          TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC)'+CR_LF+
      '        )/365.25'+CR_LF+
      '      ),2'+CR_LF+
      '    )'+CR_LF+
      '  ) AS FRACAO,'+CR_LF+
      '  COUNT(*) AS CONTAGEM'+CR_LF+
      'FROM'+CR_LF+
      '  DEPENTIT D, PESSOAFISICA P'+CR_LF+
      'WHERE'+CR_LF+
      '  (D.IDTITULAR     = ' +FIdPessoa+ ') AND'+CR_LF+
      IFF(OpcaoDeficiente = '0', '', IFF(OpcaoDeficiente = '1', '  (NVL(P.FLGDEFICIENTE, 2) = 1) AND'+CR_LF,
        '  (NVL(P.FLGDEFICIENTE, 2) <> 1) AND'+CR_LF))+
      '  (D.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IdadeMin+CR_LF+
      '  ) AND'+CR_LF+
      '  (D.IDPESSOA      = P.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      dValor := dValor - _CdsAux.FieldByName('CONTAGEM').asInteger +
        _CdsAux.FieldByName('FRACAO').asFloat;

    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM('+CR_LF+
      '    ROUND('+CR_LF+
      '      ('+CR_LF+
      '        TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC)'+CR_LF+
      '      )/365.25 -'+CR_LF+
      '      TRUNC('+CR_LF+
      '        ('+CR_LF+
      '          TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC)'+CR_LF+
      '        )/365.25'+CR_LF+
      '      ),2'+CR_LF+
      '    )'+CR_LF+
      '  ) AS FRACAO,'+CR_LF+
      '  COUNT(*) AS CONTAGEM'+CR_LF+
      'FROM'+CR_LF+
      '  DEPENTIT D, PESSOAFISICA P'+CR_LF+
      'WHERE'+CR_LF+
      '  (D.IDTITULAR     = ' +FIdPessoa+ ') AND'+CR_LF+
      IFF(OpcaoDeficiente = '0', '', IFF(OpcaoDeficiente = '1', '  (NVL(P.FLGDEFICIENTE, 2) = 1) AND'+CR_LF,
        '  (NVL(P.FLGDEFICIENTE, 2) <> 1) AND'+CR_LF))+
      '  (D.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IdadeMax+CR_LF+
      '  ) AND'+CR_LF+
      '  (D.IDPESSOA      = P.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      dValor := dValor - _CdsAux.FieldByName('FRACAO').asFloat;
  end;

  if (dValor > 0) and (iOpcao = 4) then // Meses
  begin
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM(31 - TO_NUMBER(DECODE(TO_NUMBER(TO_CHAR(PF.DATANASC,''DD'')),31,30,'+CR_LF+
      '                            TO_NUMBER(TO_CHAR(PF.DATANASC,''DD''))'+CR_LF+
      '           ))'+CR_LF+
      '  )/30 AS FRACAO,'+CR_LF+
      '  COUNT(*) AS CONTAGEM'+CR_LF+
      'FROM'+CR_LF+
      '  DEPENTIT DT, PESSOAFISICA PF'+CR_LF+
      'WHERE'+CR_LF+
      '  (DT.IDTITULAR     = ' +FIdPessoa+ ') AND'+CR_LF+
      IFF(OpcaoDeficiente = '0', '', IFF(OpcaoDeficiente = '1', '  (NVL(P.FLGDEFICIENTE, 2) = 1) AND'+CR_LF,
        '  (NVL(P.FLGDEFICIENTE, 2) <> 1) AND'+CR_LF))+
      '  (DT.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - PF.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IdadeMin+CR_LF+
      '  ) AND'+CR_LF+
      '  (DT.IDPESSOA      = PF.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      dValor := dValor - _CdsAux.FieldByName('CONTAGEM').asInteger +
        _CdsAux.FieldByName('FRACAO').asFloat;

    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT' +CR_LF+
      '  SUM(31 - TO_NUMBER(DECODE(TO_NUMBER(TO_CHAR(PF.DATANASC,''DD'')),31,30,'+CR_LF+
      '                            TO_NUMBER(TO_CHAR(PF.DATANASC,''DD''))'+CR_LF+
      '           ))'+CR_LF+
      '  )/30 AS FRACAO,'+CR_LF+
      '  COUNT(*) AS CONTAGEM' +CR_LF+
      'FROM' +CR_LF+
      '  DEPENTIT DT, PESSOAFISICA PF' +CR_LF+
      'WHERE' +CR_LF+
      '  (DT.IDTITULAR     = ' +FIdPessoa+ ') AND' +CR_LF+
      IFF(OpcaoDeficiente = '0', '', IFF(OpcaoDeficiente = '1', '  (NVL(P.FLGDEFICIENTE, 2) = 1) AND'+CR_LF,
        '  (NVL(P.FLGDEFICIENTE, 2) <> 1) AND'+CR_LF))+
      '  (DT.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND' +CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - PF.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IdadeMax+CR_LF+
      '  ) AND'+CR_LF+
      '  (DT.IDPESSOA      = PF.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      dValor := dValor - _CdsAux.FieldByName('FRACAO').asFloat;
  end;

  Result := FloatToStr(dValor);

  _CdsAux.Free;
end;

function TCtrlCalcRub.PlanAssQtd(Plano, DataRef, TipoDepen, IdadeMin, IdadeMax: string): string;
var
  sDataIni, sDataFin: string;
  iIdadeMin, iIdadeMax, iQuantTitular, iQuantDepen: integer;
  _CdsAux: TCMClientDataSet;
begin
  Result := '0';
  try
    StrToDate(DataRef);
    iIdadeMin := StrToInt(IdadeMin);
    iIdadeMax := StrToInt(IdadeMax);
    if (Plano = '') or (TipoDepen = '') or (iIdadeMin < 0) or (iIdadeMax < 0) then
      exit;
  except
    exit;
  end;

  _CdsAux := TCMClientDataSet.Create(nil);
  iQuantTitular := 0;
  iQuantDepen := 0;
  try
    sDataIni := DateToStr(StrToDate(DataRef) - iIdadeMax * 365.25);
    sDataFin := DateToStr(StrToDate(DataRef) - iIdadeMin * 365.25);
    // Conta com o Titular
    if (TipoDepen = 'PRP') or (TipoDepen = 'TOD') then
    begin
      _CdsAux.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  PL.FLGPARTBENEF AS QUANT'+CR_LF+
        'FROM'+CR_LF+
        '  PARTASS PL, PESSOAFISICA PF'+CR_LF+
        'WHERE'+CR_LF+
        '  (PL.IDPLANASS         = ' +Plano+ ') AND'+CR_LF+
        '  (PL.IDPESSOA          = ' +FIdPessoa+ ') AND'+CR_LF+
        '  (PL.IDPESSOA          = PF.IDPESSOA) AND'+CR_LF+
        '  (PL.DATAENTRADA      <= TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  (PF.DATANASC         >= TO_DATE(' +QuotedStr(sDataIni)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  (PF.DATANASC         <= TO_DATE(' +QuotedStr(sDataFin)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  ((PL.FLGINSCRICAOCANC = 0) OR'+CR_LF+
        '   (PL.DATACANCELAMENTO > TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'')))');
      iQuantTitular := StrInt(_CdsAux.FieldByName('QUANT').asString);
    end;

    // Quantidade de Dependentes
    if (TipoDepen <> 'PRP') or (TipoDepen = 'TOD') then
    begin
      _CdsAux.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  COUNT(*) AS QUANT'+CR_LF+
        'FROM'+CR_LF+
        '  PARTASS PL, BENEFASS BA, PESSOAFISICA PF, DEPENTIT DT'+CR_LF+
        'WHERE'+CR_LF+
        '  (BA.IDPLANASS         = ' +Plano+ ') AND'+CR_LF+
        '  (PL.IDPLANASS         = ' +Plano+ ') AND'+CR_LF+
        '  (PL.IDPESSOA          = ' +FIdPessoa+ ') AND'+CR_LF+
        '  (PL.DATAENTRADA      <= TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  (BA.IDTITULAR         = PL.IDPESSOA) AND'+CR_LF+
        '  (BA.IDDEPENDENTE      = PF.IDPESSOA) AND'+CR_LF+
        '  (BA.IDTITULAR         = DT.IDTITULAR) AND'+CR_LF+
        '  (BA.IDDEPENDENTE      = DT.IDPESSOA) AND'+CR_LF+
        '  (BA.DATAENTRADA      <= TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  (PF.DATANASC         >= TO_DATE(' +QuotedStr(sDataIni)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  (PF.DATANASC         <= TO_DATE(' +QuotedStr(sDataFin)+ ',''DD/MM/YYYY'')) AND'+CR_LF+
        '  ((PL.FLGINSCRICAOCANC = 0) OR'+CR_LF+
        '   (PL.DATACANCELAMENTO > TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY''))) AND'+CR_LF+
        '  ((BA.FLGATIVO         = 1) OR'+CR_LF+
        '   (BA.DTCANCELAMENTO   > TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'')))'+
        IFF(TipoDepen='TOD', '', ' AND'+CR_LF+
          '  (DT.IDDEPENDENCIA     = ' +QuotedStr(TipoDepen)+ ')'));
      iQuantDepen := StrInt(_CdsAux.FieldByName('QUANT').asString);
    end;

    Result := IntToStr(iQuantTitular + iQuantDepen);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.PlanAssVal(Plano: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  Result := '0';
  if (Plano = '') then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM(PRECO) AS VALOR'+CR_LF+
      'FROM'+CR_LF+
      '  SERVPLANASS'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPLANASS = ' +Plano+ ')');

    Result := FloatToStr(_CdsAux.FieldByName('VALOR').asFloat);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.OrcamPess(Data: TDate; IdCargo, IdEmpresa, IdEstab: integer;
  CodCentroCusto: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  Result := '0';
  if (Data = 0) then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM(QTDEPESSOAL) AS QUANT'+CR_LF+
      'FROM'+CR_LF+
      '  ORCAMPESSOAL'+CR_LF+
      'WHERE'+CR_LF+
      IFF(IdCargo <> -1, '  (IDCARGO = ' +IntToStr(IdCargo)+ ') AND'+CR_LF, '')+
      IFF(IdEstab <> -1, '  (IDESTAB = ' +IntToStr(IdEstab)+ ') AND'+CR_LF, '')+
      IFF(IdEmpresa <> -1, '  (IDEMPRESA = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF, '')+
      IFF(Trim(CodCentroCusto) <> '"-1"',
        '  (CODCENTROCUSTO = ' +QuotedStr(TiraCaracter(CodCentroCusto, '"'))+ ') AND'+CR_LF, '')+
      '  (MES = ' +IntToStr(ExtraiMes(Data))+ ') AND'+CR_LF+
      '  (ANO = ' +IntToStr(ExtraiAno(Data))+ ')');

    Result := IntToStr(_CdsAux.FieldByName('QUANT').asInteger);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.Avaliacao(Data: TDate; Tipo: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  Result := '0';
  if (Data = 0) then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  H.AVALIACAO'+CR_LF+
      'FROM'+CR_LF+
      '  HSTAVAL H,'+CR_LF+
      '  (SELECT'+CR_LF+
      '     MAX(DATAREAL) AS DATA'+CR_LF+
      '   FROM'+CR_LF+
      '     HSTAVAL'+CR_LF+
      '   WHERE'+CR_LF+
      '     (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
      '     (CODTIPOAVAL = ' +IntToStr(Tipo)+ ') AND'+CR_LF+
      '     (DATAREAL   <= TO_DATE(' +QuotedStr(DateToStr(Data))+ ', ''DD/MM/YYYY''))) HST'+CR_LF+
      'WHERE'+CR_LF+
      '  (H.IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
      '  (H.CODTIPOAVAL = ' +IntToStr(Tipo)+ ') AND'+CR_LF+
      '  (H.DATAREAL    = HST.DATA)');

    Result := IntToStr(_CdsAux.FieldByName('AVALIACAO').asInteger);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.TotalPessoal(Salario: boolean; IdEmpresa, IdEstab, IdCargo: integer;
  CodCentroCusto: string; CBO: integer; TipoSituacao: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  Result := '0';
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  ' +IFF(Salario, 'SUM(F.SALARIOATUAL)', 'COUNT(*)') +' AS TOTAL'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO F, CARGO C, SITFUNC SF' +CR_LF+
      'WHERE'+CR_LF+
      IFF(TipoSituacao <> 1,
        '  (SF.TIPOSIT       = ''A'') AND',
        '  (SF.TIPOSIT      <> ''D'') AND')+CR_LF+
      IFF(IdCargo <> -1, '  (F.IDCARGO        = ' +IntToStr(IdCargo)+ ') AND'+CR_LF, '')+
      IFF(IdEstab <> -1, '  (F.IDESTAB        = ' +IntToStr(IdEstab)+ ') AND'+CR_LF, '')+
      IFF(IdEmpresa <> -1, '  (F.IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF, '')+
      IFF(Trim(CodCentroCusto) <> '"-1"',
        '  (F.CODCENTROCUSTO = ' +QuotedStr(TiraCaracter(CodCentroCusto, '"'))+ ') AND'+CR_LF, '')+
      IFF(CBO <> -1, '  (C.CBO2002        = ' +IntToStr(CBO)+ ') AND'+CR_LF, '')+
      '  (F.IDSITFUNC      = SF.IDSITFUNC) AND'+CR_LF+
      '  (F.IDCARGO        = C.IDCARGO)');

    Result := FloatToStr(_CdsAux.FieldByName('TOTAL').asFloat);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.GetLOG: string;
begin
  if (FUsaLOG) then
  begin
    with TStringList.Create do
    try
      LoadFromFile('LOG_FOL_PAG.TXT');
      Result := Text;
    finally
      Free;
    end
  end
  else
    Result := '';  
end;

end.
