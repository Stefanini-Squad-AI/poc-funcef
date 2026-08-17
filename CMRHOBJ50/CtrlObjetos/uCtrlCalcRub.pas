{-------------------------------------------------------------------------------
-------------------------------- ALTERAÇÃO -------------------------------------
--------------------------------------------------------------------------------
Autor(a)   : Everson Cunha
Data       : 03/01/2023
Nº SIG     : 119012 e 131525
Descricao  : Ajuste no cálculo da referência da função Avos13Indenizado
--------------------------------------------------------------------------------
Autor(a)   : Ewerton Beltramini
Data       : 25/03/2021
Nº SIG     : SIG92296
Descricao  : Alterações nas funções EXTRAIDIA e EXTRAIMES para acrescentar o primeiro digito do dia e do mês.
--------------------------------------------------------------------------------
Autor(a)   : Fábio Sampaio
Data       : 18/02/2020
Nº SIG     : 82785
Descricao  : Inclusão dos campos INIABONO e FIMABONO na consulta da IniFormaCalc
--------------------------------------------------------------------------------
Autor(a)   : Everson Cunha
Data       : 02/10/2020
Nº SIG     : 102705
Descricao  : Problemas na geração de férias
--------------------------------------------------------------------------------
Autor(a)   : Everson Cunha
Data       : 19/05/2020
Nº SIG     : 99768
Descricao  : Criar marcação para receber ou não adiantamento do pagamento
             de férias FLGADIANTAPAGTOFERIAS
--------------------------------------------------------------------------------
Autor(a)   : Darivaldo Alencar
Data       : 28/10/2019
Nº SIG     : 93310
Descricao  : Regra 2621 alterada
--------------------------------------------------------------------------------
Autor(a)   : Everson Cunha
Data       : 16/09/2019
Nº SIG     : 71744
Descricao  : Calculos para o campo Referência, para o Termo de Rescisão
--------------------------------------------------------------------------------
Autor(a)   : Everson Cunha
Data       : 16/05/2019
Nº SIG     : 86355
Descricao  : Correção no cálculo da rubrica PF - AVOS FERIAS
--------------------------------------------------------------------------------
Autor(a)   : Higor Nayde Ferreira
Data       : 18/08/2014
Pendência  : SOL: 210058 KTN 2053649.
Descricao  : Implementação da função F%VALORVTRANSP.
--------------------------------------------------------------------------------
Autor(a)   : FLávio Souza
Data       : 28/11/2013
Pendência  : SOL: 191875 KTN 2006833.
Descricao  : Implementação da função DIFDIAS utilizada na URegra.
--------------------------------------------------------------------------------
Autor(a)   : Marcio Sanches Spinosa SOL 218561 KTN 2050213
Data       : 15/10/2013
Pendência  : SOL 218561 KTN 2050213
Descricao  : Correção na formula de dias trabalhados para considerar meses
             com 31 dias.
--------------------------------------------------------------------------------
Autor(a)   : Fernando Xavier
Data       : 16/09/2013
Pendência  : SOL 216777 KTN 2045977
Descricao  : Correção do problema de insuficencia de memória na folha de
             pagamento.
--------------------------------------------------------------------------------
Autor(a)   : Fernando Xavier
Data       : 15/07/2013
Pendência  : SOL 207709/14838 KTN 1922810
Descricao  : Correção da fórmula DIASTRAB. Está calculando errado os
             dias trabalhados
--------------------------------------------------------------------------------
Autor(a)   : BRUNO AZEVEDO
Data       : 09/04/2013
Pendência  : SOL 144096 KTN 943873
Descricao  : Correção do erro Insuficient Memory.
--------------------------------------------------------------------------------
Autor(a)   : André Oliveira
Data       : 06/03/2012
Pendência  : SOL 202318 KTN 1955086.
Descricao  : Alterar a query da formula DEPENTITQTDE para considerar o
             tilular como dependente.
--------------------------------------------------------------------------------
Autor(a)   : André Oliveira
Data       : 08/02/2012
Pendência  : SOL 184873 KTN 1766549
Descricao  : Alterar a query de entrada das regras (formas de cálculo) abaixo
             para que a quantidade de dependentes de plano de saúde e
             odontológico seja buscada do banco de dados
             (hoje esses dados são buscados da tabela genérica DEPSEGSAUDE)...
--------------------------------------------------------------------------------
Rotina......: MediaHistRubCLT142
Nº SOL......: 191516
Nº KINTANA..: 1814263
Data........: 02/10/2012
Responsável.: Edilaine Ferraresi
Descrição...: Correção da clausula WHERE para seleção do periodo aquisitivo
              de ferias
--------------------------------------------------------------------------------
Rotina......: MediaHistRubCLT142
Nº SOL......: 161421
Nº KINTANA..: 1361375
Data........: 13/09/2012
Responsável.: Edilaine Ferraresi
Descrição...: Correção erro nao gerao ferias.
--------------------------------------------------------------------------------
Rotina......: CalcBeneficio
Nº SOL......: 171426
Nº KINTANA..: 1537613
Data........: 06/01/2012
Responsável.: Douglas.Siqueira
Descrição...: - Alteração do limite de faixas de 9 para 20.
--------------------------------------------------------------------------------
Rotina......: CalcBeneficio
Nº SOL......: 144468
Nº KINTANA..: 952342
Data........: 15/10/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: - Alteração para fechar o clientdataset caso esteja aberto.
--------------------------------------------------------------------------------
Rotina......: CalcBeneficio
Nº SOL......: 130502
Nº KINTANA..: 738531
Data........: 19/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção efetuada para trazer apenas as férias dentro do período
              do calculo.
--------------------------------------------------------------------------------
Rotina......: RetornaFuncao
Nº SOL......: 130513
Nº KINTANA..: 738480
Data........: 11/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação da funcionalidade MediaHistRubCLT142
--------------------------------------------------------------------------------}

unit uCtrlCalcRub;

interface

uses SysUtils, Controls, uCMTypes, uCmDbObject, uCmControlObject, uCMClientDataSet, VcF1,
  uTiposRegraMT, uCtrlRegra, uRegraMT, uCalcIRRFMT, uCtrlCustomRH, fPassoAPassoFormaCalc,
  uCtrlFuncoesRH, uFuncoesUteisRh, uCtrlDiasTrab, evalutor, uSistema, uCtrlPadroes, uCtrlFerias,classes;

const
  GERACAO_NORMAL = 0;
  GERACAO_RESCISAO = 1;
  GERACAO_RETROATIVO = 2;

type
  TTipoExecucaoFormaCalc = (texNormal, texPassoAPasso, texExecucaoPassos);

  TChave = record
    Campo: string[60];
    Op: string[02];
    Valor: string[60];
    Tipo: string[01];
  end;

  TCtrlCalcRub = class(TCtrlCustomRH)
  protected
    procedure AfterInitialize; override;
    procedure DoChangeDataBase; override;
    // Executa a Expressão indicada
    function ExecFormaCalc(Expressao: string): double;
    // Executa a Regra indicada (este método apenas executa ExecRegraMT quando
    // TipoExecucao = texPassoAPasso se não, executa ExecCtrlRegra)
    function ExecRegra(NumRegra: string): string;
    // Executa a Regra indicada (utilizada para cálculo sequencial)
    function ExecCtrlRegra(NumRegra: string): string;
    // Executa a Regra indicada
    function ExecRegraMT(NumRegra: string): string;
    // Executa a Forma de Cálculo indicada
    function FormaCalculo(IdRegra: string): double;
    // Executa a Função indicada
    function RetornaFuncao(Texto: string): string;
    //Retorna a quantidade de dependentes do titular
    function DEPENTITQTDE (sIdTitular, sFlgPesquisa, sValor: string): string; //André Oliveira SOL 184873 KTN 1766549
    // Retorna a Soma das ocorrências da Rubrica Especificada
    // (se TipoFolha = -1 faz para todos os tipos)
    function SomaHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses,
      TipoFolha: integer): double;
    // Retorna a Média das ocorrências da Rubrica Especificada
    // (se TipoFolha = -1 faz para todos os tipos)
    function MediaHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses,
      TipoFolha: integer): double;
    // Retorna a média dos valores das rubricas encontradas no último
    // período aquisitivo de férias anterior a uma determinada data (DATAREF).
    // (se TipoFolha = -1 faz para todos os tipos)
    function MediaHistRubCLT142(CodProvDesc: string; DataRef: TDate; TipoFolha: integer): double; // Alterado por FHBS - SOL: 130513 KTN: 738480
    // Retorna a Quantidade de ocorrências da Rubrica Especificada
    // (se TipoFolha = -1 faz para todos os tipos)
    function QtdeHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses,
      TipoFolha: integer): double;    
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
    function Arredonda(FormulaLoc: string): string;
    // Retorna a diferença de meses entre datas considerando os dias
    function DifMesesArred(DataIni, DataFin: string): integer;
    // Retorna a quantidade de dependentes
    function QtdeDepen(DataRef, TipoDepen: string; IdadeMin, IdadeMax,
      OpcaoTempo: integer; OpcaoDeficiente: integer = 0): double;
    // Retorna a quantidade de inscritos no plano, conforme as opções
    // utilizadas nos parâmetros
    function PlanAssQtd(Plano, DataRef, TipoDepen: string; IdadeMin,
      IdadeMax: integer): integer;
    // Retorna o valor de Referência do Plano
    function PlanAssVal(Plano: string): double;
    // Retorna o resultado da última avaliação informada
    function Avaliacao(Data: TDate; Tipo: integer): string;
    // Retorna a Quantidade de pessoas ou a soma dos Salários das pessoas selecionadas
    function TotalPessoal(Salario: boolean; IdEmpresa, IdEstab, IdCargo: integer;
      CodCentroCusto: string; TipoSituacao: integer): string;
    // Retorna o conteúdo do Valor Base informado, da Contribuição informada
    function ContribPrev(Contribuicao, IndValorBase: integer): string;

    function ValorTransporte(sIdpessoa : String):String; // Higor Nayde SOL 210058
  private
    FRegraMT  : TRegraMT;
    FCtrlRegra: TCtrlRegra; // FLávio Souza SOL: 191875 KTN 2006833.
    
    //BRUNO AZEVEDO SOL 144096
    //FFormaCalc: TF1Book;
    FCtrlDiasTrab: TCtrlDiasTrab;

    FCdsFormaCalc: TCMClientDataSet;
    FCdsDadosFunc: TCMClientDataSet;
    FCdsDadosFuncAtual: TCMClientDataSet;
    FCdsDadosAfast: TCMClientDataSet;

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

    FLOG: string;
    FUsaLOG: boolean;

    FPassoAPasso: TfrmPassoAPassoFormaCalc;
    FTipoExecucao: TTipoExecucaoFormaCalc;

    CtrlFerias: TCtrlFerias; //Everson Cunha - SIG86355

  public
    iUltAno13: integer;
    iUltMes13: integer;
    iUltFlgOc13: integer;
    iUltFlgAbo: integer;
    iUltFlgOcor: integer;
    iUltNumSq: integer;
    iUltQtdParc: integer;
    iUltQtdParc2: integer;
    iUltIndMes: integer;
    iUltIndMes2: integer;
    iUltDiasSaldoFerias: integer;
    Ano13: integer;
    Mes13: integer;
    FlgOc13: integer;
    FlgAbo: integer;
    FlgOcor: integer;
    NumSq: integer;
    QtdParcFer: integer;
    QtdParcFer2: integer;
    IndMesDevol: integer;
    IndMesDevol2: integer;
    DiasSaldoFerias: integer;
    iContRegQryIn: integer;
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

    dVlrInssOutrasEmp: double; //SIG93310

    sUltDataFer1, sUltDataFer2, sUltDataFer3, sUltDataProx, SValor, sDataFer1,
    sDataFer2, sDataFer3, DataProx, FSQL, sUltDataFer22, sDataFer22,
    sDataFer32, sUltDataFer32: string;

    constructor Create; override;
    destructor  Destroy; override;

    // Inicializar cálculo das Regras/Formas de Cálculo
    procedure IniFormaCalc(TipoGeracao: integer);
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
    // Retorna os Avos do 13º Indenizado
    function Avos13Indenizado: Integer; //Everson Cunha - SIG71744  
    // Retorna os Avos das Férias da Pessoa Atual
    function AvosFerias: integer;
    // Retorna os Avos de Férias indenizadas
    function AvosFeriasIndenizadas: Integer; //Everson Cunha - SIG71744     
    // Retorna a Qtde de Avos Perdidos por Afastamento no Período Informado
    // Se CodigoMotivo = -1 Todos os tipos de afastamento
    // Se CodigoMotivo for válido, traz os avos perdidos só por esse tipo
    function AvosPerdidos(Data1, Data2, CodigoMotivo: string): integer;
    // Retorna o valor gerado no processo atual da Rubrica passada como parâmetro
    function ValorRubrica(CodProvDesc: string): double;
    // Retorna o CodProvDesc da rubrica indicada em uma CLT do tipo 99xxx
    function TrazCodProvDescCLT(CodRubCLT: string): string;
    // Retorna a Qtde de dias trabalhados Mes correspondente a DataRef, conforme a OpcaoDiasTrab
    // 1 = Desconta só Admissão e Demissão
    // 2 = Desconta Admissão, Demissão, Afastamento e Retorno
    // 3 = Desconta Admissão, Demissão e Férias
    // 4 = Desconta Admissão, Demissão, Afastamento, Retorno e Férias
    // 5 = Dias Úteis no Mês (Desconta Admissão, Demissão, Afastamento, Retorno e Férias)
    function DiasTrab(DataRef: TDate; OpcaoDiasTrab: integer): double;
    // Retorna a Qtde de dias de ferias cujo inicio de gozo seja em InicioFerias
    // Se OpcaoFerias = 0 Sem adicionar os dias do Abono Pecuniário
    // Se OpcaoFerias = 1 Com adição dos dias do Abono Pecuniário
    function DiasFerias(InicioFerias: TDate; OpcaoFerias: integer): double;
    // Retorna a Qtde de dias de gozo de ferias no Mes correspondente a DataRef
    function DiasFeriasNoMes(DataRef: TDate): double;
    //Retorna a quantidade de dias de Aviso Prévio Indenizado
    function DiasAvisoPrevioIndenizado(DataAdm, DataDeslig: string): Integer; //Everson Cunha - SIG71744        

    property IdEmpresa: integer read FIdEmpresa write FIdEmpresa;
    property IdPessoa: string read FIdPessoa write FIdPessoa; 
    property ListaIdPessoa: string read FListaIdPessoa write FListaIdPessoa;
    property TipoEmpresa: string read FTipoEmpresa write FTipoEmpresa;
    property NomeTabela: string read FNomeTabela write FNomeTabela;
    property MesRef: string read FMesRef write FMesRef;
    property ErroExecucao: boolean read FErroExecucao;
    property TipoExecucao: TTipoExecucaoFormaCalc read FTipoExecucao write FTipoExecucao;
    property ExecucaoPassos: string read FExecucaoPassos;
    property CdsFormaCalc: TCMClientDataSet read FCdsFormaCalc;
    property UsaLOG: boolean read FUsaLOG write FUsaLOG;
    property LOG: string read FLOG write FLOG;
  end;

implementation

uses uMensErro;

{ TCtrlCalcRub }

constructor TCtrlCalcRub.Create;
begin
  inherited;
  FRegraMT   := TRegraMT.Create(nil);
  FCtrlRegra := TCtrlRegra.Create; // FLávio Souza SOL: 191875 KTN 2006833.
  FCtrlDiasTrab := TCtrlDiasTrab.Create;
  FCdsFormaCalc := TCMClientDataSet.Create(nil);
  FCdsDadosFunc := TCMClientDataSet.Create(nil);
  FCdsDadosFuncAtual := TCMClientDataSet.Create(nil);
  FCdsDadosAfast := TCMClientDataSet.Create(nil);

  //Everson Cunha - SIG86355 - Início
  CtrlFerias := TCtrlFerias.Create(Sistema.IdEmpresa, Sistema.UsaRAD, Sistema.IdUsuario);
  CtrlFerias.InitializeAs(Padroes);
  //Everson Cunha - SIG86355 - Fim

  FCtrlDiasTrab.CdsAfastPessoa := FCdsDadosAfast;

  FTipoExecucao := texNormal;
  FExecucaoPassos := '';
  FUsaLOG := false;
end;

destructor TCtrlCalcRub.Destroy;
begin
  FreeAndNil(FCtrlDiasTrab);
  FreeAndNil(FRegraMT);
  FreeAndNil(FCtrlRegra); // FLávio Souza SOL: 191875 KTN 2006833.
  FreeAndNil(FCdsFormaCalc);
  FreeAndNil(CtrlFerias); //Everson Cunha - SIG86355
  FreeAndNil(FCdsDadosFunc);
  FreeAndNil(FCdsDadosFuncAtual);
  FreeAndNil(FCdsDadosAfast);
  //BRUNO AZEVEDO SOL 144096
  //if (Assigned(FFormaCalc)) then
  //  FreeAndNil(FFormaCalc);
  if (Assigned(FPassoAPasso)) then
    FreeAndNil(FPassoAPasso);
  inherited;
end;

procedure TCtrlCalcRub.AfterInitialize;
begin
  inherited;
  FCtrlDiasTrab.InitializeAs(Self);
end;

procedure TCtrlCalcRub.DoChangeDataBase;
begin
  inherited;
  FRegraMT.DataBaseName := DataBaseName;
  FCtrlRegra.DataBase   := DataBase; // FLávio Souza SOL: 191875 KTN 2006833.
end;

procedure TCtrlCalcRub.IniFormaCalc(TipoGeracao: integer);
begin
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

  FSQL :=
    'SELECT'+CR_LF+
    '  PF.*, F.*, SF.TIPOSIT, PR.LIMADM, PR.LIMDEM, PR.FERIASINI, PR.FERIASFIM,'+CR_LF;

  if (TipoGeracao = GERACAO_RESCISAO) then
    FSQL := FSQL +
      '  F.DATADESLIGAMENTO + 1 -'+CR_LF+
      '    TO_NUMBER(TO_CHAR(F.DATADESLIGAMENTO,''DD'')) AS NORMALINI,'+CR_LF+
      '  ADD_MONTHS(F.DATADESLIGAMENTO,1) -'+CR_LF+
      '    TO_NUMBER(TO_CHAR(ADD_MONTHS(F.DATADESLIGAMENTO,1),''DD'')) AS NORMALFIM,'+CR_LF+
      '    F.DATATERMINOAVISO,'+CR_LF //Everson Cunha - SIG71744
  else
    FSQL := FSQL +
      '  PR.NORMALINI, PR.NORMALFIM,'+CR_LF;

  FSQL := FSQL +
    '  HT.JORNADAMENSAL, F.IDEMPRESA AS IDPESSJUR, F.IDPESSOA AS IDTITULAR,'+CR_LF+
    '  FE.INIPERIODOFERIAS, FE.INIGOZOFERIAS, FE.FIMGOZOFERIAS,'+CR_LF+
    '  FE.FLGOCORRIDA, FE.QTDPARCDEVOL, FE.QTDIASABONO, FE.INDMESDEVOL,'+CR_LF+
    '  FE.FLGABONO, FE.FLGOCORRIDA, FE.NUMSEQ,'+CR_LF+
    '  FE.INIABONO, FE.FIMABONO,'+CR_LF+ // Alterado por FHBS - 18/02/2020 - SIG82785
    //'  FE.FLGADIANTAPAGTOFERIAS, ' + CR_LF + //Everson Cunha - SIG99768                               //Everson Cunha - SIG119012
    '  NVL(FE.FLGADIANTAPAGTOFERIAS, -1) FLGADIANTAPAGTOFERIAS, ' + CR_LF + //Everson Cunha - SIG99768  //Everson Cunha - SIG119012
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
    '  PESSOAFISICA PF, FUNCIONARIO F, SITFUNC SF, HORATRAB HT, PARAMRH PR,'+CR_LF+
    '  (SELECT'+CR_LF+
    '     FR.INIPERIODOFERIAS, FR.INIGOZOFERIAS, FR.NUMSEQ,'+CR_LF+
    '     FR.FIMGOZOFERIAS, FR.FLGOCORRIDA, FR.FLGABONO,'+CR_LF+
    '     FR.QTDPARCDEVOL, FR.QTDIASABONO, FR.IDPESSOA, FR.INDMESDEVOL'+CR_LF+
    '    ,FR.INIABONO, FR.FIMABONO'+CR_LF+ // Alterado por FHBS - 18/02/2020 - SIG82785
    '     , FR.FLGADIANTAPAGTOFERIAS ' + CR_LF + //Everson Cunha - SIG99768
    '   FROM'+CR_LF+
    '     FERIAS FR, PARAMRH PR'+CR_LF+
    '   WHERE'+CR_LF+
    IFF(FListaIdPessoa='', '',
      IFF(Pos(',',FListaIdPessoa)>0,
        '     (FR.IDPESSOA  IN (' +FListaIdPessoa+ ')) AND',
        '     (FR.IDPESSOA   = ' +FListaIdPessoa+ ') AND')+CR_LF)+
    '     (PR.FERIASINI <= FR.INIGOZOFERIAS) AND'+CR_LF+
    '     (PR.FERIASFIM >= FR.INIGOZOFERIAS)) FE'+CR_LF+
    'WHERE'+CR_LF+
    IFF(FListaIdPessoa='', '',
      IFF(Pos(',',FListaIdPessoa)>0,
        '  (F.IDPESSOA IN (' +FListaIdPessoa+ ')) AND',
        '  (F.IDPESSOA  = ' +FListaIdPessoa+ ') AND')+CR_LF)+
    '  (F.IDPESSOA  = PF.IDPESSOA) AND'+CR_LF+
    '  (F.IDSITFUNC = SF.IDSITFUNC) AND'+CR_LF+
    '  (F.IDHORARIO = HT.IDHORARIO(+)) AND'+CR_LF+
    '  (F.IDPESSOA  = FE.IDPESSOA(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  F.IDPESSOA, INIGOZOFERIAS';

  FCdsDadosFunc.Close;
  FCdsDadosFunc.Data := GetDataPacket(FSQL);
  FCdsDadosFuncAtual.Close;
  FCdsDadosFuncAtual.Data := FCdsDadosFunc.Data;
end;

procedure TCtrlCalcRub.CalcBeneficio(TipoFolha: integer; IdRegra, IdPessoa: string;
  var ValBene: double; ValBase: double; TemLanc, QtdParc, QtdOcor: integer;
  TotProv, TotDesc: double);
var
  c : integer;
  bAlgRegra: boolean;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  FTipoFolha := TipoFolha;

  if (FUsaLOG) then
  begin
    FLOG := FLOG +
      '-->> [IdPessoa:  ' +IdPessoa+ ']'+CR_LF+
      '  :: [Num Regra: ' +IdRegra+ ']'+CR_LF+
      '   . Tipo Folha: ' +IntToStr(TipoFolha)+CR_LF+
      '   . Tem Lanc:   ' +IntToStr(TemLanc)+CR_LF+
      '   . Qtd Parc:   ' +IntToStr(QtdParc)+CR_LF+
      '   . Qtd Ocor:   ' +IntToStr(QtdOcor)+CR_LF+
      '   . Val Bene:   ' +FloatToStr(ValBene)+CR_LF+
      '   . Val Base:   ' +FloatToStr(ValBase)+CR_LF+
      '   . Tot Prov:   ' +FloatToStr(TotProv)+CR_LF+
      '   . Tot Desc:   ' +FloatToStr(TotDesc)+CR_LF;
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
    DataProx := sUltDataProx;
    QtdParcFer := iUltQtdParc;
    QtdParcFer2 := iUltQtdParc2;
    IndMesDevol := iUltIndMes;
    IndMesDevol2 := iUltIndMes2;
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
      '        DECODE(FC.NIVELINDIV2,'+CR_LF+
      '          1, FX.STEP1,'+CR_LF+
      '          2, FX.STEP2,'+CR_LF+
      '          3, FX.STEP3,'+CR_LF+
      '          4, FX.STEP4,'+CR_LF+
      '          5, FX.STEP5,'+CR_LF+
      '          6, FX.STEP6,'+CR_LF+
      '          7, FX.STEP7,'+CR_LF+
      '          8, FX.STEP8,'+CR_LF+
      '          9, FX.STEP9,'+CR_LF+
      '          10, FX.STEP10,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          11, FX.STEP11,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          12, FX.STEP12,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          13, FX.STEP13,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          14, FX.STEP14,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          15, FX.STEP15,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          16, FX.STEP16,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          17, FX.STEP17,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          18, FX.STEP18,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          19, FX.STEP19,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          FX.STEP20)'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '      )'+CR_LF+
      '  ) AS SALARIO'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO F, FUNCIONARIO FC, FAIXASAL FX, CARGO C, PARAMRH PR'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA         = ' +IdPessoa+ ') AND'+CR_LF+
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
      '        DECODE(F.NIVELINDIV2,'+CR_LF+
      '          1, FX.STEP1,'+CR_LF+
      '          2, FX.STEP2,'+CR_LF+
      '          3, FX.STEP3,'+CR_LF+
      '          4, FX.STEP4,'+CR_LF+
      '          5, FX.STEP5,'+CR_LF+
      '          6, FX.STEP6,'+CR_LF+
      '          7, FX.STEP7,'+CR_LF+
      '          8, FX.STEP8,'+CR_LF+
      '          9, FX.STEP9,'+CR_LF+
      '          10, FX.STEP10,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          11, FX.STEP11,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          12, FX.STEP12,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          13, FX.STEP13,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          14, FX.STEP14,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          15, FX.STEP15,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          16, FX.STEP16,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          17, FX.STEP17,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          18, FX.STEP18,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          19, FX.STEP19,'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '          FX.STEP20)'+CR_LF+//Douglas.Siqueira SOL 171426 Kintana 1537613
      '      )'+CR_LF+
      '  ) AS SALARIO'+CR_LF+
      'FROM'+CR_LF+
      '  FUNCIONARIO F, FAIXASAL FX, CARGO C, PARAMRH PR'+CR_LF+
      'WHERE'+CR_LF+
      '  (F.IDPESSOA         = ' +IdPessoa+ ') AND'+CR_LF+
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
      '  FR.INIPERIODOFERIAS, FR.INIGOZOFERIAS, FR.NUMSEQ, FR.INDMESDEVOL,'+CR_LF+
      '  FR.FIMGOZOFERIAS, FR.FLGOCORRIDA, FR.FLGABONO, FR.QTDPARCDEVOL'+CR_LF+
      'FROM'+CR_LF+
      '  FERIAS FR, PARAMRH PR'+CR_LF+
      'WHERE'+CR_LF+
      '  (FR.IDPESSOA   = ' +IdPessoa+ ') AND'+CR_LF+
      '  (PR.FERIASINI <= FR.INIGOZOFERIAS) AND'+CR_LF+
      '  (PR.FERIASFIM >= FR.INIGOZOFERIAS) AND'+CR_LF+
      // Alterado por FHBS - SOL: 130502 KTN: 738531
      '  (ADD_MONTHS(FR.INIGOZOFERIAS, FR.INDMESDEVOL) <= PR.NORMALFIM) AND'+CR_LF+
      '  (ADD_MONTHS(FR.INIGOZOFERIAS, FR.QTDPARCDEVOL + FR.INDMESDEVOL) >= PR.NORMALINI)'+CR_LF+
      // Fim - Alterado por FHBS
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
      IndMesDevol := 0;
      IndMesDevol2 := 0;
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
      IndMesDevol := _CdsAux.FieldByName('INDMESDEVOL').asInteger;

      sDataFer22 := '';
      QtdParcFer2 := 0;

      if (_CdsAux.RecordCount > 1) then // Alterado por FHBS - SOL: 130502 KTN: 738531
        _CdsAux.Next;

      if not(_CdsAux.EOF) then
      begin
        sDataFer22 := _CdsAux.FieldByName('INIGOZOFERIAS').asString;
        sDataFer32 := _CdsAux.FieldByName('FIMGOZOFERIAS').asString;
        QtdParcFer2 := _CdsAux.FieldByName('QTDPARCDEVOL').asInteger;
        IndMesDevol2 := _CdsAux.FieldByName('INDMESDEVOL').asInteger;
      end;
    end;

   //Everson Cunha - SIG71744 - Início
    if TipoFolha in [14, 15] then
    begin
      FCdsDadosFuncAtual.Filtered := False;
      FCdsDadosFuncAtual.Filter := ' IDPESSOA = ' + IdPessoa;
      FCdsDadosFuncAtual.Filtered := True;
    end;
    //Everson Cunha - SIG71744 - Fim   
    
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
    '  (INIGOZOFERIAS <= ' + QuotedStr(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asString) + ') AND'+CR_LF+ //Everson Cunha - SIG86355
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
      '  MIN(INIPERIODOFERIAS) AS PROXAQUISFER'+CR_LF+
      'FROM'+CR_LF+
      '  FERIAS'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA    = ' +IdPessoa+ ') AND'+CR_LF+
      '  (INIGOZOFERIAS <= ' + QuotedStr(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asString) + ') AND'+CR_LF+ //Everson Cunha - SIG86355
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
        '  (INIGOZOFERIAS <= ' + QuotedStr(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asString) + ') AND'+CR_LF+ //Everson Cunha - SIG86355
        '  (FLGOCORRIDA = 1)');

      if not(_CdsAux.FieldByName('PROXAQUISFER').IsNull) then
      begin
        DataProx := _CdsAux.FieldByName('PROXAQUISFER').asString;
        DataProx := IncData(DataProx,0,0,1);
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
          DataProx := ''
        else
          DataProx := _CdsAux.FieldByName('PROXAQUISFER').asString;
      end;
    end
    else
    begin
      DataProx := _CdsAux.FieldByName('PROXAQUISFER').asString;

      //Everson Cunha - SIG86355 - Início
      if DiasSaldoFerias <> 0 then
         DataProx := IncData(DataProx,0,0,1);
      //Everson Cunha - SIG86355 - Fim
    end;

    //Everson Cunha - SIG71744 - Início
    if TipoFolha in [14, 15] then
    begin
      FCdsDadosFuncAtual.Filter := '';
      FCdsDadosFuncAtual.Filtered := False;
    end;
    //Everson Cunha - SIG71744 - Fim    
   
    _CdsAux.Close;
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  A13.ANO, A13.MES, A13.FLGOCORRIDA'+CR_LF+
      'FROM'+CR_LF+
      '  ANTECIP13 A13, PARAMRH PR'+CR_LF+
      'WHERE'+CR_LF+
      '  (A13.IDPESSOA = ' +IdPessoa+ ') AND'+CR_LF+
      '  (A13.ANO      = TO_NUMBER(TO_CHAR(PR.PGTO13INI,''YYYY''))) AND'+CR_LF+
      '  (A13.MES      = TO_NUMBER(TO_CHAR(PR.PGTO13INI,''MM'')))');

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
    FCdsDadosFunc.FieldByName('PROXAQUISFER').asString := DataProx;
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
  sUltDataProx := DataProx;
  iUltQtdParc := QtdParcFer;
  iUltQtdParc2 := QtdParcFer2;
  iUltIndMes := IndMesDevol;
  iUltIndMes2 := IndMesDevol2;
  iUltDiasSaldoFerias := DiasSaldoFerias;
  ValUltSalChefe := ValSalChefe;
  ValUltSalChefe2 := ValSalChefe2;
  ValUltSalFuncao := ValSalFuncao;

  if (FUsaLOG) then
  begin
    FLOG := FLOG +
      ''+CR_LF+
      'Valor: ' +FloatToStr(ValBene)+CR_LF+
      '*****************************'+CR_LF;
  end;

  if _CdsAux.Active then _CdsAux.Close; // Alterado por FHBS - SOL: 144468 KTN: 952342
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
    TipoExecucao := texNormal;
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
  LogCalcRegra: TStringlist;
  bSalvarLogRegra: Boolean;
begin
  {Mudar para TRUE para ver o log de calculo na pasta Planus/Temp}
  bSalvarLogRegra:= True;//False;

  try
    LogCalcRegra:= TStringlist.create;
    FCdsFormaCalc.Locate('IDREGRA', IdRegra, []);

    Expressao := Trim(FCdsFormaCalc.FieldByName('DESCRICAOREGRA').asString);
    LogCalcRegra.add(Expressao);
  
    if pos('&', Expressao) > 0 then
      Expressao := Copy(Expressao, 1, pos('&', Expressao) - 1);
    svExpressao := Expressao;
    LogCalcRegra.add(Expressao);

    if (FUsaLOG) then
    begin
      FLOG := FLOG +
        ''+CR_LF+
        'Execução de Forma de Cálculo'+CR_LF+
        Expressao+CR_LF;
    end;

    Result := 0;
    Expressao := Trim(Expressao);
    LogCalcRegra.add(Expressao);
    if (Expressao = '') then
      exit;

    iContRegQryIn := 0;

    iNumPasso := 0;
    FCdsDadosFuncAtual.First;
    while not(FCdsDadosFuncAtual.EOF) do
    begin
      Inc(iContRegQryIn);
      Expressao := StringReplace(svExpressao, CR_LF, '', [rfReplaceAll]);
      LogCalcRegra.add(Expressao);

      case (FTipoExecucao) of
        texPassoAPasso :
        begin
          if not(Assigned(FPassoAPasso)) then
            FPassoAPasso := TfrmPassoAPassoFormaCalc.Create(nil);

          FPassoAPasso.NumeroRegra := StrToFloat(IdRegra);
          FPassoAPasso.Expressao := Expressao;
          if (FPassoAPasso.ShowModal = mrCancel) then
            exit;
        end;
        texExecucaoPassos :
          FExecucaoPassos := Replicate('-', 16)+' [FORMA DE CÁLCULO COMPLETA] '+
            Replicate('-', 15)+CR_LF+ Replicate('-', 60)+CR_LF+ Expressao +CR_LF+
            Replicate('-', 25)+' [CAMPOS] ' +Replicate('-', 25)+CR_LF+
            Replicate('-', 60)+CR_LF;
      end;

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
            FLOG := FLOG + 'Campo: ' +sCodCampo+ CR_LF;

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
            sValorNovo := FloatToStr(ValInfRubrica)//StringReplace(FloatToStr(ValInfRubrica), ',', '.', [rfReplaceAll])
          else
          if (sCodCampo = 'BSRUBRICA') then
            sValorNovo := FloatToStr(ValBaseRubrica)//StringReplace(FloatToStr(ValBaseRubrica), ',', '.', [rfReplaceAll])
          else
          if (sCodCampo = 'MESRETRO') then
            sValorNovo := IntToStr(FMesRetroativo)//StringReplace(IntToStr(FMesRetroativo), ',', '.', [rfReplaceAll])
          else
          if (sCodCampo = 'PERCRETRO') then
            sValorNovo := FloatToStr(FPercRetroativo)//StringReplace(FloatToStr(FPercRetroativo), ',', '.', [rfReplaceAll])
          else
          if (sCodCampo = 'TOTALPROVENTOS') then
            sValorNovo := FloatToStr(ValTotProventos)//StringReplace(FloatToStr(ValTotProventos), ',', '.', [rfReplaceAll])
          else
          if (sCodCampo = 'TOTALDESCONTOS') then
            sValorNovo := FloatToStr(ValTotDescontos)//StringReplace(FloatToStr(ValTotDescontos), ',', '.', [rfReplaceAll])
          else
          if (sCodCampo = 'VLRINSSCOMPOUTRASEMP') then  //SIG93310
            sValorNovo := FloatToStr(dVlrInssOutrasEmp) //SIG93310
          else
            sValorNovo := IFF(FCdsDadosFuncAtual.FieldByName(sCodCampo).asString = '', '0',
                              FCdsDadosFuncAtual.FieldByName(sCodCampo).asString);


          if(sCodCampo = 'IDPESSOA') then
            sValorNovo := (FIdPessoa);
  {          sValorNovo := StringReplace(
                            IFF(FCdsDadosFuncAtual.FieldByName(sCodCampo).asString = '', '0',
                                FCdsDadosFuncAtual.FieldByName(sCodCampo).asString),
                            ',', '.', [rfReplaceAll]);}

          if (FTipoExecucao <> texExecucaoPassos) then
            Expressao := StringReplace(Expressao, 'C('+sCodCampo+')', sValorNovo, [rfReplaceAll]);
            LogCalcRegra.add(Expressao);

          case (FTipoExecucao) of
            texPassoAPasso :
            begin
              FPassoAPasso.NumeroRegra := StrToFloat(IdRegra);
              FPassoAPasso.Expressao := Expressao;
              if (FPassoAPasso.ShowModal = mrCancel) then
                exit;
            end;
            texExecucaoPassos :
            begin
              Inc(iNumPasso);
              FExecucaoPassos := FExecucaoPassos +
                '[' +Alinha(IntToStr(iNumPasso), 3, 'D', '0')+ '] - C(' +sCodCampo+ ') --> ' +
                sValorNovo +CR_LF+ 'EXPRESSÃO:' +CR_LF;

              Expressao := StringReplace(Expressao, 'C('+sCodCampo+')', sValorNovo, [rfReplaceAll]);
              LogCalcRegra.add(Expressao);

              FExecucaoPassos := FExecucaoPassos+ Expressao +CR_LF+ Replicate('-', 60)+CR_LF;
            end;
          end;
          I := 0;
          if (FUsaLOG) then
          begin
            FLOG := FLOG +
              '  Valor: '+sValorNovo+CR_LF+
              'Expressão: ' +Expressao+CR_LF+
              ''+CR_LF;
          end;
        end;
      end;

      if (FTipoExecucao = texExecucaoPassos) then
        FExecucaoPassos := FExecucaoPassos +
          Replicate('-', 25)+' [FUNÇÕES] ' +Replicate('-', 24) +CR_LF+ Replicate('-', 60)+CR_LF;

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
            FLOG := FLOG + 'Função: '+ sFuncao +CR_LF;

          // Executa a Função Contida em sFuncao
          sResultFuncao := RetornaFuncao(sFuncao);

          if (FTipoExecucao <> texExecucaoPassos) then
            Expressao := StringReplace(Expressao, 'F%' + sFuncao, sResultFuncao
                         {StringReplace(sResultFuncao, ',', '.', [rfReplaceAll])}, []);
            LogCalcRegra.add(Expressao);

          case (FTipoExecucao) of
            texPassoAPasso :
            begin
              FPassoAPasso.NumeroRegra := StrToFloat(IdRegra);
              FPassoAPasso.Expressao := Expressao;
              if (FPassoAPasso.ShowModal = mrCancel) then
                exit;
            end;
            texExecucaoPassos :
            begin
              Inc(iNumPasso);
              FExecucaoPassos := FExecucaoPassos +
                '[' +Alinha(IntToStr(iNumPasso), 3, 'D', '0')+ '] - F%' +sFuncao+ ' --> ' +
                sResultFuncao +CR_LF+ 'EXPRESSÃO:' +CR_LF;

              Expressao := StringReplace(Expressao, 'F%' + sFuncao, sResultFuncao
                           {StringReplace(sResultFuncao, ',', '.', [rfReplaceAll])}, []);

              LogCalcRegra.add(Expressao);
              FExecucaoPassos := FExecucaoPassos + Expressao +CR_LF+ Replicate('-', 60)+CR_LF;
            end;
          end;
          I := 0;
          if (FUsaLOG) then
          begin
            FLOG := FLOG +
              '  Valor: '+sResultFuncao+CR_LF+
              'Expressão: ' +Expressao+CR_LF+
              ''+CR_LF;
          end;
        end;
      end;

      if (Expressao <> '') then
      begin
        if (FUsaLOG) then
          FLOG := FLOG + 'Expressão: ' +Expressao+ CR_LF;

        LogCalcRegra.add(Expressao);
        Result := ExecFormaCalc(Expressao);

        if (FTipoExecucao = texExecucaoPassos) then
        FExecucaoPassos := FExecucaoPassos +
          Replicate('-', 24)+' [RESULTADO] ' +Replicate('-', 23)+ CR_LF+ FloatToStr(Result);
      end;

      FCdsDadosFuncAtual.Next;
    end;
  finally
    if(bSalvarLogRegra) then
       LogCalcRegra.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CALCULO_REGRA_'+ IdRegra + '.TXT');
    FreeAndNil(LogCalcRegra);
  end;
end;

function TCtrlCalcRub.SomaHistRub(CodProvDesc: string; DataRef: TDate;
  QtdeMeses, TipoFolha: integer): double;
begin
  _Cds.Data := GetDataPacket(
    'SELECT SUM(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
    'FROM   HISTRUBSAL'+CR_LF+
    'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
    '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
    '      (MES   BETWEEN ' +QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-QtdeMeses))+' AND '+
                             QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-1))+') AND'+CR_LF+
    '      (IDMODULO    = 21) AND'+CR_LF+
    '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
    '      (MES  NOT LIKE ''%13'')'+CR_LF+
    IFF(TipoFolha<>-1, ' AND  (IDMOTIVO = ' +IntToStr(TipoFolha)+ ')', ''));

  Result := _Cds.FieldByName('VALORPROVENTO').asFloat;
end;

function TCtrlCalcRub.MediaHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses,
  TipoFolha: integer): double;
begin
  if (QtdeMeses <= 0) then
    Result := 0
  else
    Result := SomaHistRub(CodProvDesc, DataRef, QtdeMeses, TipoFolha) / QtdeMeses;
end;

// Alterado por FHBS - SOL: 130513 KTN: 738480
function TCtrlCalcRub.MediaHistRubCLT142(CodProvDesc: string; DataRef: TDate;
  TipoFolha: integer): double;
var
  _CdsAux: TCMClientDataSet;
  dDataIni, dDataFim: TDate;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT INIPERIODOFERIAS,'+CR_LF+
      '       (ADD_MONTHS(INIPERIODOFERIAS,12)-1) AS FIMPERIODOFERIAS'+CR_LF+
      'FROM FERIAS'+CR_LF+
      'WHERE (IDPESSOA = ' +FIdPessoa+ ') AND'+CR_LF+
      //'      ((ADD_MONTHS(INIPERIODOFERIAS,12)-1) < TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',DataRef))+ ',''DD/MM/YYYY'')) AND'+CR_LF+  // Edilaine - SOL 161421 / KTN 1361375 - comentado
      // Edilaine - SOL 191516 / KTN 1814263 - comentado
      //'      ((ADD_MONTHS(INIPERIODOFERIAS,12)-1) between TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',DataRef))+ ',''DD/MM/YYYY'')  AND'+CR_LF+  // Edilaine - SOL 161421 / KTN 1361375
      //'                                                   TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',IncMonth(DataRef,1)-1))+ ',''DD/MM/YYYY'')) AND'+CR_LF+  // Edilaine - SOL 161421 / KTN 1361375
      // Edilaine - SOL 191516 / KTN 1814263 - fim comentario

      // Edilaine - SOL 191516 / KTN 1814263 - alteração do campo para INIGOZOFERIAS
      '      (( INIGOZOFERIAS  between TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',DataRef))+ ',''DD/MM/YYYY'')  AND'+CR_LF+
      '                               TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',IncMonth(DataRef,1)-1))+ ',''DD/MM/YYYY'')) OR'+CR_LF+
      // Edilaine - SOL 191516 / KTN 1814263 - fim
      //Everson Cunha - SIG102705- Ini
      '      ( FIMGOZOFERIAS  between TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',DataRef))+ ',''DD/MM/YYYY'')  AND'+CR_LF+
      '                               TO_DATE(' +QuotedStr(FormatDateTime('dd/mm/yyyy',IncMonth(DataRef,1)-1))+ ',''DD/MM/YYYY''))) AND'+CR_LF+
      //Everson Cunha - SIG102705 - Fim
      '      (ROWNUM = 1)'+CR_LF+
      'ORDER BY INIPERIODOFERIAS DESC');

    _CdsAux.First;
    dDataIni := _CdsAux.FieldByName('INIPERIODOFERIAS').AsDateTime;
    dDataFim := _CdsAux.FieldByName('FIMPERIODOFERIAS').AsDateTime;

    if StrToInt(FormatDateTime('dd', dDataIni)) > 15 then
      dDataIni := IncMonth(dDataIni, 1);

    if StrToInt(FormatDateTime('dd', dDataFim)) < 15 then
      dDataFim := IncMonth(dDataFim, -1);

  finally
    _CdsAux.Free;
  end;

  if (dDataIni > 0) and (dDataFim > 0) then
  begin
    _Cds.Data := GetDataPacket(
      'SELECT SUM(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
      'FROM   HISTRUBSAL'+CR_LF+
      'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
      '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
      '      (MES   BETWEEN ' +QuotedStr(RetornaAnoMes(dDataIni))+' AND '+
                               QuotedStr(RetornaAnoMes(dDataFim))+') AND'+CR_LF+
      '      (IDMODULO    = 21) AND'+CR_LF+
      '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
      '      (MES  NOT LIKE ''%13'')'+CR_LF+
      IFF(TipoFolha<>-1, ' AND  (IDMOTIVO = ' +IntToStr(TipoFolha)+ ')', ''));

    Result := _Cds.FieldByName('VALORPROVENTO').asFloat / 12;
  end
  else
    Result := 0;

end;
// Fim - Alterado por FHBS

function TCtrlCalcRub.QtdeHistRub(CodProvDesc: string; DataRef: TDate; QtdeMeses,
  TipoFolha: integer): double;
begin
  _Cds.Data := GetDataPacket(
    'SELECT COUNT(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
    'FROM   HISTRUBSAL'+CR_LF+
    'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
    '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
    '      (MES   BETWEEN ' +QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-QtdeMeses))+' AND '+
                             QuotedStr(IncDataAM(RetornaAnoMes(DataRef),-1))+') AND'+CR_LF+
    '      (IDMODULO    = 21) AND'+CR_LF+
    '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
    '      (MES  NOT LIKE ''%13'')'+CR_LF+
    IFF(TipoFolha<>-1, ' AND  (IDMOTIVO = ' +IntToStr(TipoFolha)+ ')', ''));

  Result := _Cds.FieldByName('VALORPROVENTO').asFloat;
end;

function TCtrlCalcRub.ValorRubrica(CodProvDesc: string): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsAux.Data := GetDataPacket(
    'SELECT SUM(VALORPROVENTO) AS VALORPROVENTO'+CR_LF+
    'FROM   ' +FNomeTabela+CR_LF+
    'WHERE (IDPESSOA    = ' +FIdPessoa+ ') AND'+CR_LF+
    '      (CODPROVDESC = ' +QuotedStr(CodProvDesc)+ ') AND'+CR_LF+
    '      (MES         = ' +QuotedStr(FMesRef)+') AND'+CR_LF+
    '      (IDPESSJUR   = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
    '      (IDMOTIVO    = ' +IntToStr(FTipoFolha)+ ')');

  Result := _CdsAux.FieldByName('VALORPROVENTO').asFloat;
  _CdsAux.Free;
end;

function TCtrlCalcRub.TrazCodProvDescCLT(CodRubCLT: string): string;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  if CodRubCLT = '43691' then  // valor do aviso previo indenizado
    _CdsAux.Data := GetDataPacket(
      'SELECT R.CODPROVDESC'+CR_LF+
      'FROM  RUBRICAXPESS R, PROVDESC P'+CR_LF+
      'WHERE (R.IDRUBRICA = P.IDPROVENTO)'+CR_LF+
      'AND   (R.IDPESSOA  = ' +IntToStr(FIdEmpresa)+ ')'+CR_LF+
      'AND   (P.CODRUBCLT = ' +QuotedStr(CodRubCLT)+')')
  else  // CLT 99xxx
    _CdsAux.Data := GetDataPacket(
      'SELECT TRIM(SUBSTR(DESCRICAO,INSTR(DESCRICAO,'+QuotedStr('''')+'),17)) AS CODPROVDESC'+CR_LF+
      'FROM  RUBRICACLT'+CR_LF+
      'WHERE '+CR_LF+
      '      (CODRUBCLT   = ' +QuotedStr(CodRubCLT)+')');

  Result := StringReplace(_CdsAux.FieldByName('CODPROVDESC').asString,'''','', [rfReplaceAll]);
  _CdsAux.Free;
end;

function TCtrlCalcRub.DiasTrab(DataRef: TDate; OpcaoDiasTrab: integer): double;
var
  wDiaIni, wDiaFim, wMesFim, wDiaNormalFim: word;
  DatIni, DatFim: TDate;
  AnoMes, SitAntes: string;
  _CdsAux: TCMClientDataSet; // SOL 207709/14838 KTN 1922810
begin
   try // SOL 216777 KTN 2045977

      _CdsAux := TCMClientDataSet.Create(nil);   // SOL 207709/14838 KTN 1922810


      try
        DateToStr(DataRef);
        if not(OpcaoDiasTrab in [1..5]) or (DateToStr(DataRef) = '') then
        begin
          Result := 0;
          exit;
        end;
      except
        Result := 0;
        exit;
      end;
      // SOL 207709/14838 KTN 1922810 inicio
      // Pega aquantidade de dias do mes
        _CdsAux.Data := GetDataPacket(
          'SELECT'+CR_LF+
          ' to_number(to_char(last_day(to_date('+QuotedStr(DateToStr(DataRef))+',''dd/mm/yyyy'' ) ),''dd'')) AS QTDEDIASMES '+CR_LF+
          'FROM'+CR_LF+
          ' DUAL ');

      //Result := 30;
      if (_CdsAux.IsEmpty) then
         Result := 0
      else
         Result := _CdsAux.FieldByName('QTDEDIASMES').asFloat;
      // SOL 207709/14838 KTN 1922810 final

      wDiaIni := 1;
      AnoMes := RetornaAnoMes(DataRef);
      DatIni := StrToDate('01/' + Copy(AnoMes,6,2) + '/' + Copy(AnoMes,1,4));
      DatFim := StrToDate(IncData(DateToStr(DatIni), -1,1,0));

      // Selecionar o objeto de Histórico de Situações somente quando for uma das opções pertinentes
      if (OpcaoDiasTrab in [2,4,5]) then
      begin
        FCdsDadosAfast.Data := FCtrlDiasTrab.ListDadosAfast(StrToFloat(FIdPessoa), DatIni, DatFim);
        SitAntes := FCtrlDiasTrab.SitAfastAnterior(StrToFloat(FIdPessoa), DatIni);
      end;

      if (OpcaoDiasTrab in [1..4]) then
      begin
        // Admissao e Demissao Fora do Mes
        if (FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime > DatFim) or
           ((FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime < DatIni) and
            (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D'))  or
           ((FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime <= DatIni) and
            (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'F') and
            (OpcaoDiasTrab in [2,4])) then
        begin
          Result := 0;
          exit;
        end;

        // Admissao e Demissão no Mês
        if (FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime > DatIni) then
        begin
          wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime);
          if (wDiaIni = 31) then
            Dec(wDiaIni);
          Result := Result - wDiaIni + 1;
        end;

        if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime < DatFim) and
           (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D') then
        begin
          wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime);
          Result := wDiaFim - wDiaIni + 1;
        end;

    {    // Afastamento e Retorno no Mes (Substituí pelo abaixo em 27/12/06)
        if (OpcaoDiasTrab in [2,4]) then
        begin
          if (FCdsDadosFuncAtual.FieldByName('DATARETORNO').asDateTime > DatIni) and
             (FCdsDadosFuncAtual.FieldByName('DATARETORNO').asDateTime <= DatFim) and
             (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'A') then
          begin
            wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATARETORNO').asDateTime);
            Result := Result - wDiaIni + 1;
            if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime >= DatIni) then
            begin
              wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime);
              Result := Result + wDiaIni - 1;
            end;
          end;

          if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime <= DatFim) and
             (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime > DatIni) and
             (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'F') then
          begin
            wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime);
            Result := wDiaFim - wDiaIni;
          end;
        end;
    }
        // Afastamento e Retorno no Mes
        if (OpcaoDiasTrab in [2,4]) then
        begin
          if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime <= DatFim) and
             (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'F') then
            Result := 0;

          while not(FCdsDadosAfast.EOF) do
          begin
            if (FCdsDadosAfast.FieldByName('TIPOSIT').asString <> 'A') or
               ((SitAntes <> 'A') and (FCdsDadosAfast.FieldByName('DATASITFUNC').asDateTime <>
                FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime)) then
            begin
              wDiaIni := ExtraiDia(FCdsDadosAfast.FieldByName('DATASITFUNC').asDateTime);
              if (FCdsDadosAfast.FieldByName('TIPOSIT').asString = 'A') then
                Result := Result - wDiaIni + 1  // ALTEREI AQUI + 1
              else
                Result := Result + wDiaIni - 1;
            end;
            SitAntes := FCdsDadosAfast.FieldByName('TIPOSIT').asString;
            FCdsDadosAfast.Next;
          end;
        end;

        // Ferias no Mes
        if (OpcaoDiasTrab in [3,4]) and
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

          Result := Result - (wDiaFim - wDiaIni + 1);
          if (Result > 0) and (wMesFim = 2) and (wDiaIni = 1) and (wDiaFim = wDiaNormalFim) then
            if (wDiaNormalFim = 28) then
              Result := Result - 2
            else
              Result := Result - 1;
        end;
      end
      else
      begin
        Result := FCtrlDiasTrab.Calcular(
          FCdsDadosFuncAtual.FieldByName('IDPESSOA').asFloat,
          true, true, false, true, true, true, DatIni, DatFim,
          FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime,
          FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime);

        // Afastamento e Retorno no Mes
        if (FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime <= DatFim) and
           (FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'F') then
          Result := 0;

        while not(FCdsDadosAfast.EOF) do
        begin
          if (FCdsDadosAfast.FieldByName('TIPOSIT').asString <> 'A') or
             (FCdsDadosAfast.FieldByName('DATASITFUNC').asDateTime <>
              FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) then
          begin
            wDiaIni := ExtraiDia(FCdsDadosAfast.FieldByName('DATASITFUNC').asDateTime);
            if (FCdsDadosAfast.FieldByName('TIPOSIT').asString = 'A') then
              Result := Result - wDiaIni
            else
              Result := Result + wDiaIni - 1;
          end;
          FCdsDadosAfast.Next;
        end;
      end;

      if (Result < 0) then
        Result :=  0;
      //Marcio Sanches Spinosa SOL 218561 KTN 2050213 - Inicio
//      if (Result > 30) then
      if (Result > 31) then
        Result := 30;
      //Marcio Sanches Spinosa SOL 218561 KTN 2050213 - Fim
   finally // SOL 216777 KTN 2045977

      _CdsAux.free; // SOL 216777 KTN 2045977

   end; // SOL 216777 KTN 2045977
end;

function TCtrlCalcRub.DiasFerias(InicioFerias: TDate; OpcaoFerias: integer): double;
begin
  Result := 0;
  if (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asString <> '') then
    if (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime = InicioFerias) then
    begin
      Result := FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime -
                FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime + 1;
      if (OpcaoFerias = 1) and (FCdsDadosFuncAtual.FieldByName('FLGABONO').asInteger = 1) then
      begin
        if (FCdsDadosFuncAtual.FieldByName('QTDIASABONO').asInteger = 0) then
          Result := trunc(Result * 1.5)
        else
          Result := Result + FCdsDadosFuncAtual.FieldByName('QTDIASABONO').asInteger;
      end;
    end;
end;

function TCtrlCalcRub.DiasFeriasNoMes(DataRef: TDate): double;
var
  wDiaIni, wDiaFim: word;
  DatIni, DatFim: TDate;
  AnoMes: string;
begin
  Result := 0;
  AnoMes := RetornaAnoMes(DataRef);
  DatIni := StrToDate('01/'+ Copy(AnoMes,6,2) +'/'+ Copy(AnoMes,1,4));
  DatFim := StrToDate(IncData(DateToStr(DatIni),-1,1,0));

  if (RetornaAnoMes(FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime) >= AnoMes) and
     (RetornaAnoMes(FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime) <= AnoMes) then
  begin
    wDiaIni := ExtraiDia(FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime);
    wDiaFim := ExtraiDia(FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime);

    if (FCdsDadosFuncAtual.FieldByName('FIMGOZOFERIAS').asDateTime > DatFim) then
      wDiaFim := ExtraiDia(DatFim);

    if (FCdsDadosFuncAtual.FieldByName('INIGOZOFERIAS').asDateTime < DatIni) then
      wDiaIni := 1;

    Result := (wDiaFim - wDiaIni + 1);
  end;
end;

function TCtrlCalcRub.RetornaFuncao(Texto: string): string;
var
  NomeFuncao, Param1, Param2, Param3, Param4, Param5, Param6: string;
  I, J, NumDias, NumMeses, NumAnos: integer;
begin
  Result := '0';
  NomeFuncao := UpperCase(Trim(Copy(Texto,1,Pos('(',Texto)-1)));

  I := Pos('(',Texto)+1;
  J := Pos(';',Texto);
  if (J = 0) then
    J := Pos(')',Texto);
  Param1 := Trim(Copy(Texto,I,J-I));

  I := J + 1;
  J := I - 1 + Pos(';',Copy(Texto,I,Length(Texto)-I+1));
  if (J = I-1) then
    J := I -1 +  Pos(')',Copy(Texto,I,Length(Texto)-I+1));
  Param2 := Trim(Copy(Texto,I,J-I));

  I := J + 1;
  J := I - 1 + Pos(';',Copy(Texto,I,Length(Texto)-I+1));
  if (J = I-1) then
    J := I -1 +  Pos(')',Copy(Texto,I,Length(Texto)-I+1));
  Param3 := Trim(Copy(Texto,I,J-I));

  I := J + 1;
  J := I - 1 + Pos(';',Copy(Texto,I,Length(Texto)-I+1));
  if (J = I-1) then
    J := I -1 +  Pos(')',Copy(Texto,I,Length(Texto)-I+1));
  Param4 := Trim(Copy(Texto,I,J-I));

  I := J + 1;
  J := I - 1 + Pos(';',Copy(Texto,I,Length(Texto)-I+1));
  if (J = I-1) then
    J := I -1 +  Pos(')',Copy(Texto,I,Length(Texto)-I+1));
  Param5 := Trim(Copy(Texto,I,J-I));

  I := J + 1;
  J := I - 1 + Pos(';',Copy(Texto,I,Length(Texto)-I+1));
  if (J = I-1) then
    J := I -1 +  Pos(')',Copy(Texto,I,Length(Texto)-I+1));
  Param6 := Trim(Copy(Texto,I,J-I));

  if (NomeFuncao = 'DIASTRAB') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(DiasTrab(StrToDate(Param1), StrToInt(Param2)))
  else
  if (NomeFuncao = 'SOMAHISTRUB') then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(SomaHistRub(Param1, StrToDate(Param2), StrToInt(Param3), StrToInt(Param4)))
  else
  if (NomeFuncao = 'MEDIAHISTRUB') then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(MediaHistRub(Param1, StrToDate(Param2), StrToInt(Param3), StrToInt(Param4)))
  else
  // Alterado por FHBS - SOL: 130513 KTN: 738480
  if (NomeFuncao = 'MEDIAHISTRUBCLT142') then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(MediaHistRubCLT142(Param1, StrToDate(Param2), StrToInt(Param3)))
  else
  // Fim - Alterado por FHBS
  if (NomeFuncao = 'QTDEHISTRUB') then
    if (Param2 = '') or (Param2 = '0') then
      Result := '0'
    else
      Result := FloatToStr(QtdeHistRub(Param1, StrToDate(Param2), StrToInt(Param3), StrToInt(Param4)))
  else
  if (NomeFuncao = 'QTDEDEPEN') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
    begin
      if Param6 = ''  then  Param6 := '0';
      Result := FloatToStr(QtdeDepen(Param1, Param2, StrToInt(Param3), StrToInt(Param4), StrToInt(Param5),
        StrToInt(Param6)));
    end
  else
  if (NomeFuncao = 'DIASFERIAS') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(DiasFerias(StrToDate(Param1), StrToInt(Param2)))
  else
  if (NomeFuncao = 'DIASFERIASNOMES') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := FloatToStr(DiasFeriasNoMes(StrToDate(Param1)))
  else
  if (NomeFuncao = 'DIFDIAS') or (NomeFuncao = 'DIFANOS') then
  begin
    { Regra Antiga:
      CalculaData(Param1, Param2, NumDias, NumMeses, NumAnos);  // FLávio Souza SOL: 191875 KTN 2006833. }

    if (NomeFuncao = 'DIFDIAS') then
        Result := FCtrlRegra.CalculaData(Texto) // FLávio Souza SOL: 191875 KTN 2006833.

       {Regra Antiga:
        Result := IntToStr(NumDias) // FLávio Souza SOL: 191875 KTN 2006833. }

    else
    if (NomeFuncao = 'DIFANOS') then begin
       CalculaData(Param1, Param2, NumDias, NumMeses, NumAnos);
      Result := IntToStr(NumAnos);
    end;
  end
  else
  if (NomeFuncao = 'DIFMESES') then
  begin
    if (Param3 = '') or (Param3 = '0') then
    begin
      CalculaDifData(Param1, Param2, NumDias, NumMeses, NumAnos);
      Result := IntToStr(NumMeses);
    end
    else
      Result := IntToStr(DifMesesArred(Param1, Param2));
  end
  else
  if (NomeFuncao = 'INCDATA') then
    Result := IncData(Param1, StrToInt(Param2), StrToInt(Param3), StrToInt(Param4))
  else
  if (NomeFuncao = 'TRAZULTDIAMES') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := IntToStr(TrazUltDiaMes(StrToInt(Copy(Param1,4,2)), StrToInt(Copy(Param1,7,4))))
  else
  if (NomeFuncao = 'TRAZULTDIADATA') then
    if (Param1 = '') or (Param1 = '0') then
      Result := ''
    else
      Result := DateToStr(TrazUltDiaData(StrToDate(Param1)))
  else
  if (NomeFuncao = 'RETORNAANOMES') then
    if (Param1 = '') or (Param1 = '0') then
      Result := ''
    else
      Result := RetornaAnoMes(StrToDate(Param1))
  else
  if (NomeFuncao = 'ANOMES') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := AnoMes(StrToDate(Param1))
  else
  if (NomeFuncao = 'EXTRAIDIA') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := uFuncoesuteisrh.IFF(ExtraiDia(StrToDate(Param1)) <10, '0', '') + IntToStr(ExtraiDia(StrToDate(Param1)))
  else
  if (NomeFuncao = 'EXTRAIMES') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := uFuncoesuteisrh.IFF(ExtraiMes(StrToDate(Param1)) <10, '0', '') + IntToStr(ExtraiMes(StrToDate(Param1)))
  else
  if (NomeFuncao = 'EXTRAIANO') then
    if (Param1 = '') or (Param1 = '0') then
      Result := '0'
    else
      Result := IntToStr(ExtraiAno(StrToDate(Param1)))
  else
  if (NomeFuncao = 'JUROCOMPOSTO') then
    Result := FloatToStr(JuroComposto(StrToFloat(Param1), StrToInt(Param2), StrToFloat(Param3)))
  else
  if (NomeFuncao = 'INDICE') then
    Result := Indice(Param1, Param2, Param3)
  else
  if (NomeFuncao = 'ARITM') then
  begin
    Param1 := StringReplace(Param1,'[','(',[rfReplaceAll]);
    Param1 := StringReplace(Param1,']',')',[rfReplaceAll]);
    Result := FloatToStr(ExecFormaCalc(Param1));
  end
  else
  if (NomeFuncao = 'SALVA') then
  begin
    Param1 := StringReplace(Param1,'[','(',[rfReplaceAll]);
    Param1 := StringReplace(Param1,']',')',[rfReplaceAll]);
    FValorSalvo := ExecFormaCalc(Param1);
    Result := FloatToStr(FValorSalvo);
  end
  else
  if (NomeFuncao = 'RECUPERA') then
    Result := FloatToStr(FValorSalvo)
  else
  if (NomeFuncao = 'TABGENERICA') then
  begin
    if (Param2 = '') then
      Result := ''
    else
      Result := TabGenerica(Param1, Param2, Param3, Param4, Param5);
  end
  else
  if(NomeFuncao = 'DEPENTITQTDE') then
  begin
       Result := DEPENTITQTDE(Param1, Param2, Param3);
  end
  else
  if (NomeFuncao = 'TABLONGA') then
  begin
    Param1 := Trim(Copy(Texto, Pos('(',Texto)+1, Length(Texto)-Pos('(',Texto)-1));
    Result := TabLonga(Param1);
  end
  else
  if (NomeFuncao = 'MAXIMO') then
  begin
    Param1 := Trim(Copy(Texto, Pos('(',Texto)+1, Length(Texto)-Pos('(',Texto)-1));
    Result := Maximo(Param1);
  end
  else
  if (NomeFuncao = 'MINIMO') then
  begin
    Param1 := Trim(Copy(Texto, Pos('(',Texto)+1, Length(Texto)-Pos('(',Texto)-1));
    Result := Minimo(Param1);
  end
  else
  if (NomeFuncao = 'IRRF') then
    Result := IRRF(Param1, Param2, Param3, Param4, Param5)
  else
  if (NomeFuncao = 'REGATU') then
    Result := IntToStr(iContRegQryIn)
  else
  if (NomeFuncao = 'TOTREGS') then
    Result := IntToStr(FCdsDadosFuncAtual.RecordCount)
  else
  if (NomeFuncao = 'AVOSFERIAS') then
    Result := IntToStr(AVOSFERIAS)
  else
  if (NomeFuncao = 'AVOS13') then
    Result := IntToStr(AVOS13)
  else
  if (NomeFuncao = 'AVOSPERDIDOS') then
    Result := IntToStr(AvosPerdidos(Param1, Param2, Param3))
  else
  if (NomeFuncao = 'VALORRUBRICA') then
    Result := FloatToStr(ValorRubrica(Param1))
  else
  if (NomeFuncao = 'PLANASSQTD') then
    Result := IntToStr(PlanAssQtd(Param1, Param2, Param3, StrToInt(Param4), StrToInt(Param5)))
  else
  if (NomeFuncao = 'PLANASSVAL') then
    Result := FloatToStr(PlanAssVal(Param1))
  else
  if (NomeFuncao = 'AVALIACAO') then
    Result := Avaliacao(StrToDate(Param1), StrToInt(Param2))
  else
  if (NomeFuncao = 'QUANTPESS') then
    Result := TotalPessoal(false, StrToInt(Param1), StrToInt(Param2),
      StrToInt(Param3), Param4, StrToInt(Param5))
  else
  if (NomeFuncao = 'SALARIOTOTAL') then
    Result := TotalPessoal(true, StrToInt(Param1), StrToInt(Param2),
      StrToInt(Param3), Param4, StrToInt(Param5))
  else

  if (NomeFuncao = 'VALORVTRANSP') then
    Result := ValorTransporte(Param1)
  else


  if (NomeFuncao = 'CONTRIBPREV') then
    Result := ContribPrev(StrToInt(Param1), StrToInt(Param2))
  else
  begin
    if (NomeFuncao = 'SE') then
      Texto := StringReplace(Texto,'SE(','if(',[rfReplaceAll])
    else
    if (NomeFuncao = 'TRUNCA') then
      Texto := StringReplace(Texto,'TRUNCA(','TRUNC(',[rfReplaceAll])
    else
    if (NomeFuncao = 'DATANUM') then
      Texto := 'DATE(' + Copy(Param1,7,4) + ';' + Copy(Param1,4,2) + ';' + Copy(Param1,1,2) + ')';

    Result := FloatToStr(ExecFormaCalc(Texto));
    if (NomeFuncao = 'DATANUM') and (Result = '') then
      Result := '0';
  end;
end;

function TCtrlCalcRub.ExecFormaCalc(Expressao: string): double;
begin
  FErroExecucao := false;
  Expressao := StringReplace(Expressao,'.',',',[rfReplaceAll]);
  Expressao := StringReplace(Expressao,' ','',[rfReplaceAll]);
  try
    Result := evaluate(Expressao, False);
  except
    on E: Exception do
    begin
      if (FUsaLOG) then
        FLOG := FLOG + 'Erro = ' +E.Message+ CR_LF;

      Result := 0;
      FErroExecucao := true;
      MessageInfo := 'Erro na execução da Forma de Cálculo:' +CR_LF+ MessageInfo;
      DecimalSeparator := ',';
    end;
  end;
end;


function TCtrlCalcRub.ExecRegra(NumRegra: string): string;
begin
  FErroExecucao := false;

  if (FUsaLOG) then
    FLOG := FLOG +CR_LF+ 'Execução de Regra'+CR_LF;

  if (FTipoExecucao = texPassoAPasso) then
    Result := ExecRegraMT(NumRegra)
  else
    Result := ExecCtrlRegra(NumRegra);

  if (FErroExecucao) then
  begin
    if (FUsaLOG) then
      FLOG := FLOG + 'Erro = ' +MessageInfo+ CR_LF;
    MessageInfo := 'Erro na execução da Regra:' +CR_LF+ MessageInfo;
  end;
end;

function TCtrlCalcRub.ExecCtrlRegra(NumRegra: string): string;
begin
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
    //FCtrlRegra.CopiaDataSet(FCdsDadosFuncAtual.Data); // Hotal
    FCtrlRegra.CopiaData(FCdsDadosFuncAtual.Data); // TotalPrev
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
end;

function TCtrlCalcRub.ExecRegraMT(NumRegra: string): string;
begin
  try
    FRegraMT.RuleNumber := NumRegra;
    FRegraMT.IdEmpresa := FIdEmpresa;
    FRegraMT.GravaCalculo := false;
    FRegraMT.ReloadRule := false;

    if (FTipoEmpresa = 'P') then
      FRegraMT.TipoCliente := tcFundacao
    else
      FRegraMT.TipoCliente := tcOutros;

    FRegraMT.PassoaPasso := true;
    FRegraMT.GeraDataSet(FSQL);
    FRegraMT.Execute;

    if not(FRegraMT.Error) then
      Result := OraNumero(FRegraMT.Result)
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
end;

function TCtrlCalcRub.TabGenerica(NomeTabela, ValorChave, ColPesquisa, ColConsulta,
  Opcao: string): string;
var
  sTipoDado, sSqlAux2, sSqlAux, sValorAux, sCond, sOrder, sValorCampo, sLinha: string;
  Numero, FError: boolean;
begin
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
  Numero := false;
  try
    _Cds.Data := GetDataPacket(
      'SELECT IDTIPODADO'+CR_LF+
      'FROM   CAMPOTABGENER'+CR_LF+
      'WHERE  (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
      '       (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ')');

    sTipoDado := _Cds.FieldByName('IDTIPODADO').asString;
    FError := false;
  except
    FError := true;
  end;

  if not(FError) then
  begin
    // Tipo de Dado NUMERICO
    if (sTipoDado = '1') then
    begin
      // Acerta Valor de pesquisa
      ValorChave := OraNumero(ValorChave);
      // Acerda ordenacao
      if (Opcao = '1') then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','','')) DESC'
      else
      if (Opcao = '2') then
        sOrder := ' ORDER BY TO_NUMBER(REPLACE(VALOR,''.'','',''))';
      // Seta indicados de valor numerico
      Numero := true;
      // Monta e Executa a Consulta do Valor Desejado
      _Cds.Data := GetDataPacket(
        'SELECT'+CR_LF+
        '  VALOR, NUMLINHA'+CR_LF+
        'FROM'+CR_LF+
        '  (SELECT /*+ INDEX (VALTABGENER XPKVALTABGENER)*/'+CR_LF+
        '     REPLACE(VALOR,'','',''.'') AS VALOR, NUMLINHA'+CR_LF+
        '   FROM'+CR_LF+
        '     VALTABGENER'+CR_LF+
        '   WHERE'+CR_LF+
        '     (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
        '     (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ')) A'+CR_LF+
        'WHERE'+CR_LF+
        '  TO_NUMBER(REPLACE(VALOR,''.'','','')) '+ sCond +ValorChave+ sOrder);
      // Guarda a linha do valor desejado
      sLinha := _Cds.FieldByName('NUMLINHA').asString;
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
          ValorChave := 'TO_DATE(' +QuotedStr(ValorChave)+ ',''DD/MM/YYYY'')';
        end
        else
        begin
          // Outro Tipo ERRO
          if (ColPesquisa <> '''NUMLINHA''') then
          begin
            FError := true;
            Result := '-6010'
          end
          else
            sValorCampo := ' VALOR ';
        end;
      end;
    end;

    //------------------------------------------------------------------------------
    // Caso não seja Numero Continua Rotina
    if not(Numero) then
    begin
      if (ColPesquisa <> '''NUMLINHA''') then
      begin
        if not(FError) then
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
            sSqlAux2 := 'SELECT TO_NUMBER(REPLACE(VALOR,''.'','','')) VALOR, NUMLINHA'+CR_LF+
                        'FROM   VALTABGENER'+CR_LF+
                        'WHERE (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
                        '      (CODCAMPO  = ' +UpperCase(QuotedStr(ColPesquisa))+ ') AND'+CR_LF+
                        sValorAux + sCond + ValorChave +' '+ sOrder;

          _Cds.Data := GetDataPacket(sSqlAux);
          sLinha := _Cds.FieldByName('NUMLINHA').asString;

          if (sLinha = '') and (sTipoDado = '1') then
          begin
            _Cds.Data := GetDataPacket(sSqlAux2); // SQL feito para acabar com o bug do Oracle 8.0
            sLinha := _Cds.FieldByName('NUMLINHA').asString;
          end;

          if (sLinha = '') then
          begin
            FError := true;
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

      exit;
    end;

    if not(FError) then
    begin
      _Cds.Data := GetDataPacket(
        'SELECT VALOR'+CR_LF+
        'FROM   VALTABGENER'+CR_LF+
        'WHERE (CODTABELA = ' +QuotedStr(NomeTabela)+ ') AND'+CR_LF+
        '      (CODCAMPO  = ' +UpperCase(QuotedStr(ColConsulta))+ ') AND'+CR_LF+
        '      (NUMLINHA  = ' +sLinha+ ')');

      Result := _Cds.FieldByName('VALOR').asString;
    end;
  end;

  // Caso Resultado Nulo, Retorna 1 espaço.
  if (Result = '') then
    Result := ' ';
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
    sFormula := StringReplace(Linha, ' ', '', [rfReplaceAll]);

    sFormula := TiraCaracter(sFormula,'[');
    ExtraiString(sFormula, sCampos, ']'); // Campos
    ExtraiString(sFormula, sTabela, ';'); // Tabela
    ExtraiString(sFormula, sCampoRet, ';'); // Campo de Retorno

    if (sCampos = '') or (sCampoRet = '') or (sTabela = '') then
      Exception.Create('Erro nos parâmetros da pesquisa para a função TABLONGA.');

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
        Exception.Create('Erro nos parâmetros da pesquisa para a função TABLONGA.'+CR_LF+
                         'O campo de retorno "' +sCampoRet+ '" não existe na tabela ' +sTabela);

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
              Exception.Create('Erro nos parâmetros da pesquisa para a função TABLONGA.'+CR_LF+
                               'O campo de pesquisa "' +CampoTabLonga.Campo+
                               '" não existe na tabela ' +sTabela);
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

  //A->Alfanumerico; D->Data; N->Numerico
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
  IRRF: TIRRF;
  FSQL: string;
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

  dValorBase := ExecFormaCalc(ValorBase);//StringReplace(ValorBase, '.', ',', [rfReplaceAll]));

  Tipo := StrToInt(TipodeResultado);

  IRRF := TIrrf.Create;
  IRRF.CarregaFaixasIRRF(Self, TCMClientDataSet(_Cds), FIdEmpresa);
  case (Tipo) of
    0..2 : Result := FloatToStr(IRRF.CalculaIRRF(StrToInt(NumDep), StrToDate(DataNasc),
            dValorBase, dAliquota, DataRef, StrToInt(TipodeResultado)));
    3 : Result := IntToStr(IRRF.IdadeIdoso);
    4 : Result := FloatToStr(IRRF.ValorIdoso);
    5 : Result := FloatToStr(IRRF.ValorDependente);
  end;
  IRRF.Free;
end;

function TCtrlCalcRub.Maximo(Formula: string): string;
var
  FormulaAux: string;
  p, i: LongInt;
  Valor, Maior: real;
begin
  FormulaAux := Formula + ';';
  p := 1;
  Maior := 0;
  repeat
    i := Pos(';',FormulaAux);
    if (i = 0) then
      FormulaAux := '';
    try
      Valor := StrToFloat(Copy(FormulaAux, 1, i-1));
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
  FormulaAux := Formula + ';';
  p := 1;
  Menor := 0;
  repeat
    i := Pos(';',FormulaAux);
    if (i = 0) then
      FormulaAux := '';
    try
      Valor := StrToFloat(Copy(FormulaAux, 1, i-1));
      if (p = 1) or (Valor < Menor) then
        Menor := Valor;
      Inc(p);
    except
    end;
    FormulaAux := Copy(FormulaAux, i+1, Length(FormulaAux));
  until (FormulaAux = '');

  Result := FloatToStr(Menor);
end;

function TCtrlCalcRub.Arredonda(FormulaLoc: string): string;
var
  I: integer;
  N, Variavel: string;
  Var2: double;
begin
  // Guarda Valor a ser arredondado
  I := Pos(';', FormulaLoc);
  Variavel := Copy(FormulaLoc, 1, I-1);
  Variavel := Trim(Variavel);

  // Guarda Número de Casas a arredondar
  N := Copy(FormulaLoc, I+1, Length(FormulaLoc)-i);
  N := Trim(n);
  Var2 := StrToFloat(Variavel);
  I := StrToInt(N);

  Result := FloatToStrF(Var2, ffFixed, 12, I);
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

    //if ((D2 - D1) >= 14) then //Everson Cunha - SIG86355
    if ((D2 - D1) >= 15) then //Everson Cunha - SIG86355
      Inc(Result);

    if ((D2 - D1) < 0) and (D2 +  uFuncoesUteisRH.IFF(D1=31, 1, 31-D1) < 15) then
      Dec(Result);
  except
    Result := 0;
  end;
end;

function TCtrlCalcRub.Avos13: integer;
begin
  // considerar a diferença de meses e entrada até o dia 16
  // independente do número de dias nos meses inicial e final
  Result :=
    uFuncoesuteisrh.IFF(FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString='D',
        ExtraiMes(FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime),
        ExtraiMes(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime)) -
    uFuncoesuteisrh.IFF(ExtraiAno(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) =
        ExtraiAno(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime),
        ExtraiMes(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime),
        1) + 1 -
    uFuncoesuteisrh.IFF((ExtraiAno(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) =
         ExtraiAno(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime)) and
        (ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) > 16),
        1,
        0) -
    uFuncoesuteisrh.IFF((FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D') and
        (ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asDateTime) < 15),
        1,
        0);

  if (Result < 0) then
    Result := 0;
end;

function TCtrlCalcRub.AvosFerias: integer;
var
  DataProx : String;
  iQtdeDiasAfastado : Integer;
begin
  //Everson Cunha - SIG86355 - Início
  //Para os casos em que o empregado perdeu o período aquisitivo de férias por ter ficado afastado mais que 180 dias dentro do período aquisitivo
  result := 0;

  DataProx := FCdsDadosFuncAtual.FieldByName('PROXAQUISFER').asString;

  repeat
    iQtdeDiasAfastado := CtrlFerias.QtdeDiasAfastamento(StrToInt(IdPessoa), StrToDate(DataProx), StrToDate(IncData(DataProx, -1, 0, 1)));

    if (iQtdeDiasAfastado >= 180) then
    begin
      DataProx := DateToStr(CtrlFerias.dDtRetorno);
      Continue;
    end;

    Result := Result + DifMesesArred(IFF(strtodate(DataProx) > FCdsDadosFuncAtual.FieldByName('NORMALFIM').AsDateTime,
                                         FCdsDadosFuncAtual.FieldByName('NORMALFIM').AsString,
                                         DataProx),
                                         IFF(FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D',
                                             FCdsDadosFuncAtual.FieldByName('DATADESLIGAMENTO').asString,
                                             IFF(ExtraiAno(StrToDate(IncData(DataProx, -1, 0, 1))) < ExtraiAno(Date),
                                                 IncData(DataProx, -1, 0, 1),
                                                 FCdsDadosFuncAtual.FieldByName('NORMALFIM').asString)));

    DataProx := IncData(DataProx, 0, 0, 1);

  until (ExtraiAno(StrToDate(DataProx)) >= ExtraiAno(Date));
  //Everson Cunha - SIG86355 - Fim
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
        DataIni := IncData(_CdsAux.FieldByName('DATASITFUNC').asString,15,0,0);

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

function TCtrlCalcRub.QtdeDepen(DataRef, TipoDepen: string; IdadeMin, IdadeMax,
  OpcaoTempo, OpcaoDeficiente: integer): double;
var
  Int1: integer;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  Int1 := OpcaoTempo;
  if (Int1 > 2) then
    Int1 := Int1 - 2;

  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  COUNT(*) AS CONTAGEM'+CR_LF+
    'FROM'+CR_LF+
    '  DEPENTIT D, PESSOAFISICA P'+CR_LF+
    'WHERE'+CR_LF+
    '  (D.IDTITULAR     = ' +FIdPessoa+ ') AND'+CR_LF+
    IFF(OpcaoDeficiente = 0, '', IFF(OpcaoDeficiente = 1, '  (NVL(P.FLGDEFICIENTE, 2) <> 2) AND'+CR_LF,
      '  (NVL(P.FLGDEFICIENTE, 2) = 2) AND'+CR_LF))+
    '  (D.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
    '  (TRUNC('+CR_LF+
    '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC) /'+CR_LF+
    '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) BETWEEN ' +
       IntToStr(IdadeMin)+ ' AND ' +IntToStr(IdadeMax) +CR_LF+
    '  ) AND'+CR_LF+
    '  (D.IDPESSOA      = P.IDPESSOA)');

  Result := _CdsAux.FieldByName('CONTAGEM').asFloat;

  if (Result > 0) and (OpcaoTempo = 3) then // Anos
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
      IFF(OpcaoDeficiente = 0, '', IFF(OpcaoDeficiente = 1, '  (NVL(P.FLGDEFICIENTE, 2) <> 2) AND'+CR_LF,
        '  (NVL(P.FLGDEFICIENTE, 2) = 2) AND'+CR_LF))+
      '  (D.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IntToStr(IdadeMin)+CR_LF+
      '  ) AND'+CR_LF+
      '  (D.IDPESSOA      = P.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      Result := Result - _CdsAux.FieldByName('CONTAGEM').asInteger +
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
      IFF(OpcaoDeficiente = 0, '', IFF(OpcaoDeficiente = 1, '  (NVL(P.FLGDEFICIENTE, 2) <> 2) AND'+CR_LF,
        '  (NVL(P.FLGDEFICIENTE, 2) = 2) AND'+CR_LF))+
      '  (D.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - P.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IntToStr(IdadeMax)+CR_LF+
      '  ) AND'+CR_LF+
      '  (D.IDPESSOA      = P.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      Result := Result - _CdsAux.FieldByName('FRACAO').asFloat;
  end;

  if (Result > 0) and (OpcaoTempo = 4) then // Meses
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
      IFF(OpcaoDeficiente = 0, '', IFF(OpcaoDeficiente = 1, '  (NVL(PF.FLGDEFICIENTE, 2) <> 2) AND'+CR_LF,
        '  (NVL(PF.FLGDEFICIENTE, 2) = 2) AND'+CR_LF))+
      '  (DT.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND'+CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - PF.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IntToStr(IdadeMin)+CR_LF+
      '  ) AND'+CR_LF+
      '  (DT.IDPESSOA      = PF.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      Result := Result - _CdsAux.FieldByName('CONTAGEM').asInteger +
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
      IFF(OpcaoDeficiente = 0, '', IFF(OpcaoDeficiente = 1, '  (NVL(PF.FLGDEFICIENTE, 2) <> 2) AND'+CR_LF,
        '  (NVL(PF.FLGDEFICIENTE, 2) = 2) AND'+CR_LF))+
      '  (DT.IDDEPENDENCIA = ' +QuotedStr(TipoDepen)+ ') AND' +CR_LF+
      '  (TRUNC('+CR_LF+
      '     TO_NUMBER(TO_DATE(' +QuotedStr(DataRef)+ ',''DD/MM/YYYY'') - 1 - PF.DATANASC) /'+CR_LF+
      '     365.25 * TO_NUMBER(DECODE(' +IntToStr(Int1)+ ',2,12,1))) = ' +
         IntToStr(IdadeMax)+CR_LF+
      '  ) AND'+CR_LF+
      '  (DT.IDPESSOA      = PF.IDPESSOA)');

    if (_CdsAux.FieldByName('CONTAGEM').asInteger > 0) then
      Result := Result - _CdsAux.FieldByName('FRACAO').asFloat;
  end;
  _CdsAux.Free;
end;

function TCtrlCalcRub.PlanAssQtd(Plano, DataRef, TipoDepen: string;
  IdadeMin, IdadeMax: integer): integer;
var
  sDataIni, sDataFin: string;
  iQuantTitular, iQuantDepen: integer;
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  iQuantTitular := 0;
  iQuantDepen := 0;
  try
    sDataIni := DateToStr(StrToDate(DataRef) - IdadeMax * 365.25);
    sDataFin := DateToStr(StrToDate(DataRef) - IdadeMin * 365.25);
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

    Result := iQuantTitular + iQuantDepen;
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.PlanAssVal(Plano: string): double;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  SUM(PRECO) AS VALOR'+CR_LF+
      'FROM'+CR_LF+
      '  SERVPLANASS'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPLANASS = ' +Plano+ ')');
    Result := _CdsAux.FieldByName('VALOR').asFloat;
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
  CodCentroCusto: string; TipoSituacao: integer): string;
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
      '  FUNCIONARIO F, SITFUNC SF' +CR_LF+
      'WHERE'+CR_LF+
      IFF(TipoSituacao <> 1,
        '  (SF.TIPOSIT       = ''A'') AND',
        '  (SF.TIPOSIT      <> ''D'') AND')+CR_LF+
      IFF(IdCargo <> -1, '  (F.IDCARGO        = ' +IntToStr(IdCargo)+ ') AND'+CR_LF, '')+
      IFF(IdEstab <> -1, '  (F.IDESTAB        = ' +IntToStr(IdEstab)+ ') AND'+CR_LF, '')+
      IFF(IdEmpresa <> -1, '  (F.IDEMPRESA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF, '')+
      IFF(Trim(CodCentroCusto) <> '"-1"',
        '  (F.CODCENTROCUSTO = ' +QuotedStr(TiraCaracter(CodCentroCusto, '"'))+ ') AND'+CR_LF, '')+
      '  (F.IDSITFUNC      = SF.IDSITFUNC)');

    Result := FloatToStr(_CdsAux.FieldByName('TOTAL').asFloat);
  finally
    _CdsAux.Free;
  end;
end;

function TCtrlCalcRub.ContribPrev(Contribuicao, IndValorBase: integer): string;
var
  _CdsAux: TCMClientDataSet;
begin
  Result := '0';
  if (Contribuicao = 0) or (not IndValorBase in [1,2,3]) then
    exit;

  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  VALORBASE' + IntToStr(IndValorBase)+CR_LF+
      'FROM'+CR_LF+
      '  CONTRIBPREVPARTP'+CR_LF+
      'WHERE'+CR_LF+
      '  (IDPESSOA       = ' +FIdPessoa+ ') AND'+CR_LF+
      '  (FLGCOBRA       = 1) AND'+CR_LF+
      '  (IDCONTRIBUICAO = ' +IntToStr(Contribuicao)+ ')'+CR_LF+
      'ORDER BY TRGDTINCLUSAO DESC');

    Result := FloatToStr(_CdsAux.FieldByName('VALORBASE' + IntToStr(IndValorBase)).asFloat);
  finally
    _CdsAux.Free;
  end;
end;
//Inicio - André Oliveira SOL 184873 KTN 1766549

function TCtrlCalcRub.DEPENTITQTDE (sIdTitular, sFlgPesquisa, sValor: string): string;
var
   _CdsAux: TCMClientDataSet;
begin
     if(sIdTitular = '') or (sFlgPesquisa = '')or (sValor = '')then
     begin
          Result := '0';
          Exit;
     end;
     _CdsAux := TCMClientDataSet.Create(nil);
    try
       _CdsAux.Data := GetDataPacket(
          'SELECT'+CR_LF+
          'COUNT(*) QTDE'+CR_LF+
          'FROM   DEPENTIT D '+CR_LF+
          //'WHERE D.IDTITULAR <> D.IDPESSOA '+CR_LF+   // André Oliveira SOL 202318 KTN 1955086.
          //'AND ' +sFlgPesquisa+' = '+sValor+' '+CR_LF+ // André Oliveira SOL 202318 KTN 1955086.
          'WHERE ' +sFlgPesquisa+' = '+sValor+' '+CR_LF+  // André Oliveira SOL 202318 KTN 1955086.
          'AND IDTITULAR = '+sIdTitular);
        Result := _CdsAux.FieldByName('QTDE').AsString;
    finally
      FreeAndNil(_CdsAux);
    end;
end;
//Fim - André Oliveira SOL 184873 KTN 1766549
function TCtrlCalcRub.ValorTransporte(sIdpessoa: String): String;
var
 _CdsAux: TCMClientDataSet;
 fValorTrans : Double;
begin
    if(sIdpessoa = '')then
    begin
          Result := '0';
          Exit;
    end;
     _CdsAux := TCMClientDataSet.Create(nil);
     fValorTrans := 0;
    try
       _CdsAux.Data := GetDataPacket(' SELECT                               '+CR_LF+
                                     '   DISTINCT(VLRLINHATRANSP)           '+CR_LF+
                                     ' FROM                                 '+CR_LF+
                                     '   LINHAXPESS LP, LINHATRANSP LT      '+CR_LF+
                                     ' WHERE                                '+CR_LF+
                                     '  (LP.IDPESSOA      = '+ sIdPessoa+' ) '+
                                     ' AND                                  '+CR_LF+
                                     '  (LP.IDLINHATRANSP = LT.IDLINHATRANSP) ');

       while not(_CdsAux.Eof)do begin
         fValorTrans := _CdsAux.FieldByName('VLRLINHATRANSP').AsFloat + fValorTrans;
         _CdsAux.Next;
       end;

        Result := FloatToStr(fValorTrans);
    finally
      FreeAndNil(_CdsAux);
    end;
end;

function TCtrlCalcRub.DiasAvisoPrevioIndenizado(DataAdm,
  DataDeslig: string): Integer;
var
  qtdAnos, diasAviso: Integer;
begin

  qtdAnos := trunc(IntervaloMeses(DataDeslig, DataAdm) / 12);

  if qtdAnos >= 20 then
    diasAviso := 90
  else
  if qtdAnos = 19 then
    diasAviso := 87
  else
  if qtdAnos = 18 then
    diasAviso := 84
  else
  if qtdAnos = 17 then
    diasAviso := 81
  else
  if qtdAnos = 16 then
    diasAviso := 78
  else
  if qtdAnos = 15 then
    diasAviso := 75
  else
  if qtdAnos = 14 then
    diasAviso := 72
  else
  if qtdAnos = 13 then
    diasAviso := 69
  else
  if qtdAnos = 12 then
    diasAviso := 66
  else
  if qtdAnos = 11 then
    diasAviso := 63
  else
  if qtdAnos = 10 then
    diasAviso := 60
  else
  if qtdAnos = 9 then
    diasAviso := 57
  else
  if qtdAnos = 8 then
    diasAviso := 54
  else
  if qtdAnos = 7 then
    diasAviso := 51
  else
  if qtdAnos = 6 then
    diasAviso := 48
  else
  if qtdAnos = 5 then
    diasAviso := 45
  else
  if qtdAnos = 4 then
    diasAviso := 42
  else
  if qtdAnos = 3 then
    diasAviso := 39
  else
  if qtdAnos = 2 then
    diasAviso := 36
  else
  if qtdAnos = 1 then
    diasAviso := 33
  else
    diasAviso := 30;

  Result := diasAviso;
  
end;

function TCtrlCalcRub.AvosFeriasIndenizadas: Integer;
var
  DataProx : String;
  iQtdeDiasAfastado, Total : Integer;
begin
  result := 0;

  DataProx := FCdsDadosFuncAtual.FieldByName('PROXAQUISFER').asString;

  repeat
    iQtdeDiasAfastado := CtrlFerias.QtdeDiasAfastamento(StrToInt(IdPessoa), StrToDate(DataProx), StrToDate(IncData(DataProx, -1, 0, 1)));

    if (iQtdeDiasAfastado >= 180) then
    begin
      DataProx := DateToStr(CtrlFerias.dDtRetorno);
      Continue;
    end;

    Total := Total + DifMesesArred(IFF(strtodate(DataProx) > FCdsDadosFuncAtual.FieldByName('NORMALFIM').AsDateTime,
                                         FCdsDadosFuncAtual.FieldByName('NORMALFIM').AsString,
                                         DataProx),
                                         IFF(FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D',
                                             FCdsDadosFuncAtual.FieldByName('DATATERMINOAVISO').asString,
                                             IFF(ExtraiAno(StrToDate(IncData(DataProx, -1, 0, 1))) < ExtraiAno(Date),
                                                 IncData(DataProx, -1, 0, 1),
                                                 FCdsDadosFuncAtual.FieldByName('NORMALFIM').asString)));

    DataProx := IncData(DataProx, 0, 0, 1);

  until (ExtraiAno(StrToDate(DataProx)) >= ExtraiAno(Date));

  result := Total - AvosFerias;

end;

function TCtrlCalcRub.Avos13Indenizado: Integer;
var
  Total: Integer;
begin
  // considerar a diferença de meses e entrada até o dia 16
  // independente do número de dias nos meses inicial e final
  
  //Total := //Everson Cunha - SIG119012
  result :=  //Everson Cunha - SIG119012
    uFuncoesuteisrh.IFF(FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString='D',
        ExtraiMes(FCdsDadosFuncAtual.FieldByName('DATATERMINOAVISO').asDateTime),
        ExtraiMes(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime)) -
    uFuncoesuteisrh.IFF(ExtraiAno(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) =
        ExtraiAno(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime),
        ExtraiMes(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime),
        1) + 1 -
    uFuncoesuteisrh.IFF((ExtraiAno(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) =
         ExtraiAno(FCdsDadosFuncAtual.FieldByName('NORMALFIM').asDateTime)) and
        (ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATAADMISSAO').asDateTime) > 16),
        1,
        0) -
    uFuncoesuteisrh.IFF((FCdsDadosFuncAtual.FieldByName('TIPOSIT').asString = 'D') and
        (ExtraiDia(FCdsDadosFuncAtual.FieldByName('DATATERMINOAVISO').asDateTime) < 15),
        1,
        0);

  //result := Total - Avos13; //Everson Cunha - SIG119012

  if (result < 0) then
    result := 0;

end;

end.
