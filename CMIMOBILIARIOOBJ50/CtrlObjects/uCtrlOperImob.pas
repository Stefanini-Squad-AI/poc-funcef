{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

     OBJETO DE CONTROLE DE LANCAMENTOS DE OPERAÇÕES CONTÁBEIS  ( MT )
            ( Previsões de Receitas / Perdas e Atualizações )

     Módulo          :  Comuns Imobiliário
     Autor           :  Vinícius Meyer Lana
     Data de Início  :  24/09/2003
     Data de Término :

 FUNÇÕES PUBLICADAS:
     AtualizaDocsVencidos    - Corrige documentos em aberto no CAR (multa,juros,cm)
     AtualizaAlteradores     - Atualiza alteradores nos documentos do CAR
     AtualizaProvisaoPerdas  - Atualiza Provisionamento de Perdas por Segmento
     AtualizaProvisaoReceita - Atualiza Provisionamento de receitas por contrato
     IntegraProvisao         - Integra lançamentos diários de provisão

//***************************************************************************************
//N. SIG..........   : 115072
//Data da Alteração: : 03/11/2021
//Alteração Form:    : Reprocessamento
//Responsável:       : Edilaine
//Descrição.......   : verificar se existe outro evento de recalculo
//***************************************************************************************
//Pendência   :  SIG 114623
//Responsável :  Ewerton Beltramini
//Data        :  29/01/2021
//Descrição   :  Implementação do comando Copy, para igualar as bases de produção.
//***************************************************************************************

//***************************************************************************************
//N. SIG..........   : SIG79081
//Data da Alteração: : 17/12/2018
//Alteração Form:    : uCtrlOperImob
//Responsável:       : Fábio Sampaio
//Descrição.......   : Criação do parametro bFatorMesAntDiasMesAtual e ajuste na
                       rotira de AtualizaDocsSemBaixa para utilizar o parametro criado
//***************************************************************************************

//***************************************************************************************
//Rotina             : ExecutouETL  
//N. SIG..........   : 59816
//Data da Alteração: : 15/12/2017
//Alteração Form:    : uCtrlOperImob
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Alteração da forma de verificação da execução do ETL.
//***************************************************************************************
{
SOL         : 227706
Kintana     : 2061380
Responsável : Marcio Sanches Spinosa SOL 227706 KINTANA 2061380
Data        : 07/03/2014
Descrição   :Ajuste para efetuar sempre o commit depois que executar a ETL
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
- FHBS - onde tiver "Tirar-para-Performance" tirar o comentário, para ganho de
  performance nos SOL's 69495/69496
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
Rotina......: LancaDadosOperacaoImob, GetRateioSegmento, AtualizaDocsSemBaixa,
              AtualizaDocsBaixaParcial
Nº SOL......: 170547-9382
Nº KINTANA..: 1654606
Data........: 22/05/2012
Responsável.: Edilaine Ferraresi
Descrição...: Lançamento de Multa,Juros,Correção por percentual do segmento
-------------------------------------------------------------------------------------------
SOL         : 146052
Kintana     : 1017172
Responsável : Eraldo
Data        : 14/08/2012
Descrição   :Acrescenda a passagem do parametro do CODDOCUMENTO que anteriormente estava sendo passado -1
--------------------------------------------------------------------------------
Rotina .....:AtualizaDocsSemBaixa
Nº SOL......:136341
Nº KINTANA..: 815095
Data        : 09/10/2011
Responsável : Helen V. Bianchi
Descrição   : Adicioanado o parametro CODDOCUMENTO BuscaParamMulta  
-------------------------------------------------------------------------------------------
Rotina......: ExecutarETL, ExecutouETL
Nº SOL......: 172601/14639 e 172601/14640 Admin e Alienacao
Nº KINTANA..: 2019067 e 2019131
Data........: 22/05/2012
Responsável.: Edilaine Ferraresi
Descrição...: Implementação das Rotinas do ETL
-------------------------------------------------------------------------------------------
Rotina......: AtualizaDocsBaixaParcial
Nº SOL......: 179453
Nº KINTANA..: 1655199
Data........: 22/05/2012
Responsável.: Edilaine Ferraresi
Descrição...: Comparação da operação 4 com campo DataLancto e operação 5 com DataBaixa
-------------------------------------------------------------------------------------------
Rotina......: AtualizaDocsBaixaParcial; Reprocessamento LancaParcial; GravaLancOperDiaImob
Nº SOL......: 136336
Nº KINTANA..: 815081
Data........: 18/04/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: - Correção para subistituir os valores de Juros/Multa/CM para os valores ja
              calculados na simulação (FlgTipo="S").
              - Alteração da rotina "Reprocessamento" para não apagar os registros da
              LancOperDiaImob para FlgTipo = "S"
              - Alteração da rotina "LancaParcial" para evitar erros de arredondamento
-------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
Pendências  : 22056
Responsável : Daniel Simões
Data        : 24/05/2007
Descrição   : 1º.: Retirados os parâmetros da função 'UltimoFechamento'. A query
                   passa a carregar a Data do último fechamento da tabela
                   'PARAMIMOVEL' ou 'PARAMALIENACAO' dependendo de qual módulo
                   está executando...

              2º.: Criada a função 'AtualizaDataFechamento' responsável por
                   atualizar a data do último fechamento toda vez que for
                   reprocessar...
--------------------------------------------------------------------------------
Pendência   : 22687
Responsável : Daniel Simões
Descrição   : Busca parametrização de Multas e Juros pelo Record 'FParamMulta'..
--------------------------------------------------------------------------------

Rotina..........: AtualizaProvisaoPerdas
N. Sol..........: 130992
N. Kintana......: 744458
Data............: 20/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção da rotina para não buscar a provisão de perda utilizando
                  plano e patrocinadora.
--------------------------------------------------------------------------------
Rotina..........: AtualizaDocsVencidos
N. Sol..........: 142927
N. Kintana......: 917823
Data............: 27/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Tratamento de transação no banco de dados, para evitara a
                  abertura de mais de uma instância.

-------------------------------------------------------------------------------}

unit uCtrlOperImob;

interface

uses
  sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, dbClient,
  provider, wwQuery, uCMClientDataSet, uCMTypes, uComunsImobiliarioDB, uComunsImobiliario,
  uCtrlRelComunsImobiliario, uCtrlPadrLancImovel, uCtrlImobLancamento {uCtrlLancamento}, {uCtrlDocumento,}uCtrlImobDocumento,
  uCtrlLancamentosImovel, uCtrlParamIntegra, uCtrlParcFinancImov, Math, uCMFileUtils,
  uDBLancOperDiaImob, uDbLancOperImob, uDbLancOperContImob, uCtrlModuloImobiliario, DBaseDados,
  uCtrlParamMulta, uCMMath, uMensErro, Dialogs, // Daniel - 26104
  Classes, Windows, uDbETLImobAtualizacao; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640

type TTpOper = Record
   IdOperacao   : Integer;
   CodTipImovel : String;
   UnidNegocio  : Integer;
end;

// Edilaine - SOL 170547-9382 / KTN 1654606
type TDadosOper = record
       DtLimite     : TDateTime;
       DtBaixa      : TDateTime;
       IdOperador   : integer;
       vlrValor     : extended;
       vlrAcum      : extended;
       IdContrato   : integer;
       CodDocumento : integer;
       IdOpFinanc   : integer;
       bSimulacao   : boolean;
end;
// Edilaine - SOL 170547-9382 / KTN 1654606 - fim


type
  TCtrlOperImob = class(TCmControlObject)
  private
    FdbLancOperDiaImob: TDbLancOperDiaImob;
    FdbLancOperContImob: TDbLancOperContImob;
    FdbLancOperImob: TDbLancOperImob;
    FdbETLImobAtualizacao : TDbETLImobAtualizacao; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    FbGeraLog: Boolean;
    FcdsEncargos: TCMClientDataSet;

    FiCodDocumentoAjuste: Integer;
    FValorJuros: Extended;
    FValorMulta: Extended;
    FPercentualMulta: Extended;
    FPercentualJuros: Extended;
    FMoedaMulta: Integer;
    FMoedaJuros: Integer;
    FMoedaCM: Integer;
    FJurosProporc: Variant;
    FPeriodoJuros: String;
    FUsaMesAnterior: Integer;
    FBuscaParamMultaContrato: Boolean;
    FIDLancOperDiaImob: Extended;
    FDataInicio: TDateTime; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    FDataFim: TDateTime; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640

    procedure SetdbLancOperDiaImob (const Value: TDbLancOperDiaImob);
    procedure SetdbLancOperContImob(const Value: TDbLancOperContImob);
    procedure SetdbLancOperImob    (const Value: TDbLancOperImob);
    procedure SetiCodDocumentoAjuste(const Value: Integer);
    procedure SetbGeraLog(const Value: Boolean);
    procedure SetcdsEncargos(const Value: TCMClientDataSet);
    procedure SetJurosProporc(const Value: Variant);
    procedure SetMoedaCM(const Value: Integer);
    procedure SetMoedaJuros(const Value: Integer);
    procedure SetMoedaMulta(const Value: Integer);
    procedure SetPercentualJuros(const Value: Extended);
    procedure SetPercentualMulta(const Value: Extended);
    procedure SetPeriodoJuros(const Value: String);
    procedure SetValorJuros(const Value: Extended);
    procedure SetValorMulta(const Value: Extended);
    procedure SetUsaMesAnterior(const Value: Integer);
    procedure SetBuscaParamMultaContrato(const Value: Boolean);
    procedure SetIDLancOperDiaImob(const Value: Extended);
    procedure SetdbETLImobAtualizacao(const Value: TDbETLImobAtualizacao); // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    procedure SetDataFim(const Value: TDateTime); // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    procedure SetDataInicio(const Value: TDateTime); // Felipe A. Santos  SOL 172601/14639 e SOL 172601/14640
    procedure SetbFatorMesAntDiasMesAtual(const Value: Boolean); // Alterado por FHBS - SIG79081
  private
    ComunsImobiliarioDB   : TComunsImobiliarioDB;
    CtrlRelComuns         : TCtrlRelComunsImobiliario;
    CtrlPadrLancImovel    : TCtrlPadrLancImovel;
    //CtrlLancamento        : TCtrlLancamento;
    CtrlImobLancamento    : TCtrlImobLancamento;
    //CtrlDocumento         : TCtrlDocumento;
    CtrlImobDocumento     : TCtrlImobDocumento;
    CtrlLanctoImovel      : TCtrlLancamentosImovel;
    CtrlParcFinancImov    : TCtrlParcFinancImov;
    CtrlParamIntegra      : TCtrlParamIntegra;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;
    CtrlParamMulta        : TCtrlParamMulta; // Daniel - 26104

    ParamSistema          : TParamSistema;
    vTpOper               : Array of TTpOper;

    iTipoCliente          : Integer;

    // Vinicius - 08/08/05 - Inclusão de arquivo de log das operações
    ArqLog : TextFile;
    // Fim

    // Daniel - 22687
    rParamMulta : TParamMulta;

    FbFatorMesAntDiasMesAtual: Boolean; // Alterado por FHBS - SIG79081

    property  dbLancOperDiaImob : TDbLancOperDiaImob  read FdbLancOperDiaImob  write SetdbLancOperDiaImob;
    property  dbLancOperImob    : TDbLancOperImob     read FdbLancOperImob     write SetdbLancOperImob;
    property  dbLancOperContImob: TDbLancOperContImob read FdbLancOperContImob write SetdbLancOperContImob;
    property  dbETLImobAtualizacao : TDbETLImobAtualizacao read FdbETLImobAtualizacao write SetdbETLImobAtualizacao; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640

    function  AcumuladoUltimaProvisao (const iIdOper:Integer; const dDataOper, dDataBaixa:TDateTime; const sTipoImovel:String; const iIdContrato, iIdForCli, iCodDocumento, iIdParcFinancImov:Integer; var bRegInicial:Boolean): Extended;
    function  BuscaProvisaoAIntegrar  (const vIdOper:Array of Integer; const dDataOper:TDateTime; const sTipoImovel:String): OLEVariant;
    function  BuscaUnidNegocAlterador (const IdOperacao:Integer; const sTipoImovel:String):Integer;
    function  ReverteBaixaParcial     (const IdOperacao,iCodDocumento,iParcFinancimov: Integer; const sTipoImovel:String; const dDataOper:TDateTime; const fVlrTotLanc: Extended; var fVlrReverte: Extended) : Boolean;

    function  GravaLancOperContImob   (const dDataLancto: TDateTime; var iIdLancOperContImo: integer): Boolean;

    function  AtualizaDocsSemBaixa    (sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM:Integer; const dLimite: TDateTime; const iIdContrato:Integer = -1; const bSimula:Boolean = False; const sTipoContrato : String = '') : Boolean;
    function  AtualizaDocsBaixaParcial(sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM:Integer; const dLimite: TDateTime; const iIdContrato:Integer = -1; const bSimula:Boolean = False; const sTipoContrato : String = '') : Boolean;
    function  AjustaDocsQuitados      (sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM:Integer; const dLimite: TDateTime) : Boolean;
    function  ExcluiAlterIndevido     (sNomeBilhete: string; const dLimite: TDateTime) : Boolean;
    function  ReverteProvPerdas       (const iIdOper:Integer; const dLimite: TDateTime) : Boolean;

    function  LancaParcial (const iIdOper, Coddocumento : Integer; const sTipoImovel:String; const dDataLimite:TDateTime; const fVlrTotal:Extended) : Boolean;

    function  AjustesDiversos(const dLimite: TDateTime) : Boolean;
    function  AjustesDiversosII(const dLimite: TDateTime) : Boolean;

    function  LookupLancOperDiaImob   (const iIdOper:Integer; const dDataOper, dDataBaixa: TDateTime; const sTipoImovel:String; const iIdContrato, iIdForCli, iCodDocumento, iIdParcFinancImov:Integer; const iIdPlanoPrev: integer = -1; const iIdPatro: integer = -1): OleVariant;
    function  LookupLancOperContImob  (const dDataLancto: TDateTime): OleVariant;
    function  LookupReprocessamento   (const vIdOper:Array of Integer; const dDataOper:TDateTime; const bTrataApenasDia : Boolean = False; const iIdContrato:Integer = -1):OLEVariant;
    function  LookupResumeLancOper    (const vIdOper:Array of Integer; const dDataLancto: TDateTime; const iTipoResumo:Integer; const iContrato : Integer = -1): OLEVariant;
    function  LookupAtualizaDocs      (const dDataLancto: TDateTime;
                                       const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                       const iIDOperAbonoMulta : Integer = -1;
                                       const iIDOperAbonoJuros : Integer = -1;
                                       const iIDOperAbonoCM    : Integer = -1) : OLEVariant;

    function  InsereAlterador         (const CodDocumento, CodAlterador, IdUsuario:Integer; const sHistorico:String; const Valor:Extended; const dDataLancto:TDateTime) : Boolean;

    function  VerificaFeriado         (const dDataLimite: TDateTime) : Boolean;

    function  ValorAcumOper           (const IDContratoImovel : Integer;
                                       const IDParcela        : Integer;
                                       const IDOper           : Integer;
                                       const dDataIni         : TDateTime;
                                       const dDataFim         : TDateTime
                                      ): Currency;

    // Daniel - 22056
    function AtualizaDataFechamento(dDataLimite:TDateTime=-1): Boolean;

    //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
    function LookupPlanosxContrato(iIdContrato: Integer) : OLEVariant;

    // Alterado por FHBS - SOL: 136336 KTN: 815081
    procedure PegaValoresDaSimulacao(const iCodDocumento: Integer; const dData: TDateTime;
                                     const iIdOperMulta: Integer; var vMulta: Extended;
                                     const iIdOperJuros: Integer; var vJuros: Extended;
                                     const iIdOperCM: Integer; var vCM: Extended);

    function LancaDadosOperacaoImob(vDados : TDadosOper) : boolean;    // Edilaine - SOL 170547-9382 / KTN 1654606
    function GetRateioSegmento(iCodDocumento : integer) : OleVariant;  // Edilaine - SOL 170547-9382 / KTN 1654606

  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  public
    constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, iIdPlanoPrev, iIdPatro: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
    destructor  Destroy; override;

    // Vinicius - Atualização individual de documento
    property iCodDocumentoAjuste: Integer read FiCodDocumentoAjuste write SetiCodDocumentoAjuste;
    property bGeraLog : Boolean read FbGeraLog write SetbGeraLog;

    // Marchetti - Pendencia 23438
    property BuscaParamMultaContrato : Boolean read FBuscaParamMultaContrato write SetBuscaParamMultaContrato;
    property ValorMulta      : Extended read FValorMulta write SetValorMulta;
    property MoedaMulta      : Integer read FMoedaMulta write SetMoedaMulta;
    property PercentualMulta : Extended read FPercentualMulta write SetPercentualMulta;

    property ValorJuros      : Extended read FValorJuros write SetValorJuros;
    property MoedaJuros      : Integer read FMoedaJuros write SetMoedaJuros;
    property PeriodoJuros    : String read FPeriodoJuros write SetPeriodoJuros;
    property JurosProporc    : Variant read FJurosProporc write SetJurosProporc;
    property PercentualJuros : Extended read FPercentualJuros write SetPercentualJuros;
    property UsaMesAnterior  : Integer read FUsaMesAnterior write SetUsaMesAnterior;
    property MoedaCM         : Integer read FMoedaCM write SetMoedaCM;
    // Fim Marchetti - Pendencia 23438

    // Marchetti - 08/08/2006
    property  cdsEncargos : TCMClientDataSet read FcdsEncargos write SetcdsEncargos;

    // Marchetti - Pendencia 23210
    property IDLancOperDiaImob : Extended read FIDLancOperDiaImob write SetIDLancOperDiaImob;

    // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    property DataInicio : TDateTime read FDataInicio write SetDataInicio;
    property DataFim : TDateTime read FDataFim write SetDataFim; 
    // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640 - fim

    property bFatorMesAntDiasMesAtual: Boolean read FbFatorMesAntDiasMesAtual write SetbFatorMesAntDiasMesAtual; // Alterado por FHBS - SIG79081


    function  LookupEncargos : OleVariant;

    function  Reprocessamento         (sNomeBilhete: string; const vIdOper:Array of Integer; dDataOper:TDateTime; const iIdContrato:Integer = -1; const bSimula:Boolean = False; const bApagaLancamentoDiario : Boolean = True; const bTrataApenasDia : Boolean = False; const iIDParcela : Integer = -1) : Boolean;

    // Daniel - 22056
    function UltimoFechamento: TDateTime;
    // Fim.

    function IntegraProvisao         (sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM, iIdOperPerdas, iIdOperReceita:Integer; const sTipoImovel:String = ''; const dDtProv:TDateTime = -1; const bTransacao : Boolean = True): Boolean;

    function AtualizaDocsVencidos    (sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM:Integer; const dLimite: TDateTime; const iIdContrato:Integer = -1; const bSimula:Boolean = False; const sTipoContrato : String = '') : Boolean;
    function AtualizaAlteradores     (sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM:Integer; const dLimite: TDateTime) : Boolean;
    function AtualizaProvisaoPerdas  (sNomeBilhete: string; const iIdOper:Integer; const sTipoImovel:String = ''; const dLimite:TDateTime = -1; const sTipoContrato : String = ''): Boolean;
    function AtualizaProvisaoReceita (sNomeBilhete: string; const iIdProvisao: Integer; const dLimite: TDateTime) : Boolean;

    function  GravaLancOperDiaImob    (const dDataLancto    : TDateTime;
                                       const dDataBaixa     : TDateTime;
                                       const iIdOper        : Integer;
                                       const fVlrDia        : Extended;
                                       const fVlrAcum       : Extended;
                                       const fVlrTotAcum    : Extended;
                                       const sTipoImovel    : String;
                                       const iIdContrato    : Integer;
                                       const iIdForCli      : Integer;
                                       const iCodDocum      : Integer;
                                       const bGravaDiaNull  : Boolean = True;
                                       const IDParcela      : Integer = -1;
                                       const iIdCondPag     : Integer = -1;
                                       const bSimula        : Boolean = False): Boolean;

    function  GravaLancOperImob       (      sNomeBilhete: string;
                                       const vIdOper:Array of Integer;
                                       const dDataLancto: TDateTime;
                                       const iTipoResumo:Integer;
                                       const bMostraProgresso: Boolean = True;
                                       const iContrato : Integer = -1): Boolean;

    function CalculaJurosAlienacao(      sNomeBilhete : string;
                                   const iIdOper      : Integer;
                                   const dData        : TDateTime = -1;
                                   const sTipoImovel  : String = '';
                                   const sTipoContrato: String = ''
                                  ): Boolean;

    function CalculaCMAlienacao(         sNomeBilhete : string;
                                   const iIdOper      : Integer;
                                   const dData        : TDateTime = -1;
                                   const sTipoImovel  : String = '';
                                   const sTipoContrato: String = ''
                                  ): Boolean;

    function CalculaAtualResiduo(        sNomeBilhete : string;
                                   const iIdOper      : Integer;
                                   const dData        : TDateTime = -1;
                                   const sTipoImovel  : String = ''
                                  ): Boolean;

    function CalculaAtualSaldo14(      sNomeBilhete : String;
                                 var   fCM          : Extended;
                                 var   fJuros       : Extended;
                                 const iContrato    : Integer = -1;
                                 const iCondPag     : Integer = -1;
                                 const dData        : TDateTime = -1;
                                 const dDataVencto  : TDateTime = -1;
                                 const iTipoOperCM  : Integer = -1;
                                 const iTipoOperJur : Integer = -1;
                                 const bGrava       : Boolean = True;
                                 const bTransacao   : Boolean = True;
                                 const fSaldoDev    : Extended = 0
                                ) : Boolean;

    function CalculaAtualSaldo(      sNomeBilhete : String;
                                 var   fCM          : Extended;
                                 var   fJuros       : Extended;
                                 const iContrato    : Integer = -1;
                                 const iCondPag     : Integer = -1;
                                 const dData        : TDateTime = -1;
                                 const dDataVencto  : TDateTime = -1;
                                 const iTipoOperCM  : Integer = -1;
                                 const iTipoOperJur : Integer = -1;
                                 const bGrava       : Boolean = True;
                                 const bTransacao   : Boolean = True;
                                 const fSaldoDev    : Extended = 0
                              ) : Boolean;

    function LookupMontaDadosParaAbono : OleVariant;

    function LookupAlteradorAbono(const sTipoImovel : String) : OleVariant;

    function LookupAlteradorDoc(const iDocumento : Integer;
                                const iAlteradorJuros : Integer;
                                const iAlteradorMulta : Integer;
                                const iAlteradorCorr  : Integer) : OleVariant;

    // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    function ExecutarETL : boolean;
    function ExecutouETL : boolean;
    // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640 - fim

  published
end;



implementation

{ TCtrlOperImob }

constructor TCtrlOperImob.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, iIdPlanoPrev, iIdPatro: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  // Cria uma instância dos CtrlObjects Externos
  ComunsImobiliarioDB := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);;
  CtrlRelComuns       := TCtrlRelComunsImobiliario.Create;
  CtrlPadrLancImovel  := TCtrlPadrLancIMovel.Create(iIdEmpresa, iIdModulo);
  //CtrlLancamento      := TCtrlLancamento.Create;
  CtrlImobLancamento      := TCtrlImobLancamento.Create;
  //CtrlDocumento       := TCtrlDocumento.Create;
  CtrlImobDocumento       := TCtrlImobDocumento.Create;
  CtrlLanctoImovel    := TCtrlLancamentosImovel.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  CtrlParcFinancImov  := TCtrlParcFinancImov.Create;
  CtrlParamIntegra    := TCtrlParamIntegra.Create;

  // Daniel - 26104
  CtrlParamMulta      := TCtrlParamMulta.Create(iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso,bUsaPlanoPatro);

  // Cria uma instância dos DbObjects Externos
  FdbLancOperDiaImob  := TDbLancOperDiaImob.Create ( Self );
  FdbLancOperImob     := TDbLancOperImob.Create ( Self );
  FdbLancOperContImob := TDbLancOperContImob.Create ( Self );
  FdbETLImobAtualizacao := TDbETLImobAtualizacao.Create ( Self ); // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa     := iIdEmpresa;
  ParamSistema.idModulo      := iIdModulo;
  ParamSistema.idUsuario     := iIdUsuario;
  ParamSistema.idEspAcesso   := iIdEspAcesso;
  ParamSistema.idPlanoPrev   := iIdPlanoPrev;
  ParamSistema.idPatro       := iIdPatro;
  ParamSistema.UsaPlanoPatro := bUsaPlanoPatro;

  // Busca parämetros globais
  CtrlParamIntegra.GetParams(ParamSistema.idEmpresa,0,'','', tiSistema);

  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;

  FcdsEncargos := TCMClientDataSet.Create(nil);

  FiCodDocumentoAjuste     := -1;
  FBuscaParamMultaContrato := True;
  FValorJuros              := 0;
  FValorMulta              := 0;
  FUsaMesAnterior          := 0;
  FPercentualMulta         := -1;
  FPercentualJuros         := -1;
  FMoedaMulta              := -1;
  FMoedaJuros              := -1;
  FMoedaCM                 := -1;

  if ParamSistema.idModulo = 64 then FJurosProporc := -1
  else                               FJurosProporc := '';
  FPeriodoJuros := '';

  FbFatorMesAntDiasMesAtual := False; // Alterado por FHBS - SIG79081

end;

destructor TCtrlOperImob.Destroy;
begin
  // Destroi os CtrlObjects e DbObjects Externos
  FreeAndNil( ComunsImobiliarioDB );
  FreeAndNil( CtrlRelComuns );
  FreeAndNil( CtrlPadrLancImovel );
  //FreeAndNil( CtrlLancamento );
  FreeAndNil( CtrlImobLancamento );
  //FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlImobDocumento );
  FreeAndNil( CtrlLanctoImovel );
  FreeAndNil( CtrlParcFinancImov );
  FreeAndNil( CtrlParamIntegra );

  FreeAndNil( CtrlModuloImobiliario );

  FreeAndNil( CtrlParamMulta ); // Daniel - 26104

  FreeAndNil( FdbLancOperDiaImob );
  FreeAndNil( FdbLancOperImob );
  FreeAndNil( FdbLancOperContImob );
  FreeAndNil( FdbETLImobAtualizacao );// Felipe A. Santos SOL 172601/14639 e SOL 172601/14640

  FreeAndNil(FcdsEncargos);
  inherited;
end;

procedure TCtrlOperImob.onCreateAppServer;
begin
  inherited;

end;

procedure TCtrlOperImob.AfterInitialize;
begin
  inherited;
  // Inicializa os CtrlObjects Externos
  ComunsImobiliarioDB.InitializeAs( Self );
  CtrlRelComuns.InitializeAs( Self );
  CtrlPadrLancImovel.InitializeAs( Self );
  //CtrlLancamento.InitializeAs( Self );
  CtrlImobLancamento.InitializeAs( Self );
  //CtrlDocumento.InitializeAs( Self );
  CtrlImobDocumento.InitializeAs( Self );
  CtrlLanctoImovel.InitializeAs( Self );
  CtrlParcFinancImov.InitializeAs( Self );
  CtrlParamIntegra.InitializeAs( Self );

  CtrlModuloImobiliario.InitializeAs( Self );

  CtrlParamMulta.InitializeAs( Self ); // Daniel - 26104

  CtrlModuloImobiliario.AdminImob.GetParam(ParamSistema.idEmpresa);
  CtrlModuloImobiliario.Alienacao.GetParam(ParamSistema.idEmpresa);

  FdbLancOperDiaImob.DataBaseName  := DataBaseName;
  FdbLancOperImob.DataBaseName     := DataBaseName;
  FdbLancOperContImob.DataBaseName := DataBaseName;
  FdbETLImobAtualizacao.DataBaseName := DataBaseName; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640

  _Cds.Data    := GetDataPacket('SELECT TIPOCLIENTE FROM EMPRESAPROP WHERE IDPESSOA = ' + IntToStr(ParamSistema.idEmpresa));
  iTipoCliente := _Cds.FieldByName('TIPOCLIENTE').AsInteger;

  // Marchetti - 08/08/2006
  cdsEncargos.Data := LookupEncargos;
end;


function TCtrlOperImob.AtualizaProvisaoPerdas(sNomeBilhete: string; const iIdOper:Integer; const sTipoImovel: String; const dLimite: TDateTime; const sTipoContrato : String): Boolean;
var cdsProv : TCMClientDataSet;
    iIdForCli : Integer;
    iAtual, iQuant : Integer;
    sSql : String;
begin
  try
    try
      StartTransaction;

      if bGeraLog then begin
         AssignFile(ArqLog, '3_AtualizaProvPerdas'+FormatDateTime('ddmmyyyy',dLimite)+ '.Log');
         Rewrite(ArqLog);
         writeLn(ArqLog, 'Função: AtualizaProvPerdas - Dia: ' + FormatDateTime('dd/mm/yyyy',dLimite));
         writeLn(ArqLog, ' ');
         writeLn(ArqLog, 'Inicio AtualizaProvPerdas: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
      end;

      // Exclui lançamentos anteriores se for um Reprocessamento
      if not Reprocessamento(sNomeBilhete, [iIdOper], dLimite) then
         raise exception.Create( MessageInfo );

      // Busca provisões por contrato
      cdsProv := TCMClientDataSet.Create(nil);
      if ParamSistema.idModulo = 64 then begin
      //Cássio - SOL Nº 130992 KINTANA Nº 744458 - Início
      //Inclusão dos parametros iIdPlanoPrev (-1) e iIdPatro (-1)
         cdsProv.Data := CtrlRelComuns.SelecionaProvisaoPerdas(ParamSistema.idEmpresa,
                                                               ParamSistema.idModulo,
                                                               dLimite, sTipoImovel, '', -1, -1);
      end else begin
         cdsProv.Data := CtrlParcFinancImov.SelecionaProvisaoPerdas(sNomeBilhete,
                                                                    ParamSistema.idEmpresa,
                                                                    ParamSistema.idModulo,
                                                                    dLimite, -1, sTipoImovel, sTipoContrato, -1, -1);
      //Cássio - SOL Nº 130992 KINTANA Nº 744458 - Fim
      end;
      if bGeraLog then begin
         writeLn(ArqLog, 'BuscaQuery: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
      end;

      // força um do progresso para montar a tela
      iAtual := 1;
      iQuant := cdsProv.RecordCount;
      DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dLimite) + ' - Totalizando a Provisão de Perdas...']);

      // Grava valores por contrato em LANCOPERDIAIMOB
      cdsProv.First;
      while not cdsProv.Eof do
      begin
         // Grava o id do cliente apenas se não existir contrato
         if cdsProv.FieldByName('IDCONTRATOIMOVEL').IsNull then
              iIdForCli := cdsProv.FieldByName('IDFORCLI').AsInteger
         else iIdForCli := -1;

          if not GravaLancOperDiaImob(dLimite, -1, iIdOper, 0,
                                       cdsProv.FieldByName('VLR_PROVISAO').AsCurrency,
                                       cdsProv.FieldByName('VLR_PROVISAO').AsCurrency ,
                                       cdsProv.FieldByName('CODTIPIMOVEL').AsString,
                                       cdsProv.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                       //Eraldo SOL 146052 KINTANA 1017172
                                       // Acrescenda a passagem do parametro do CODDOCUMENTO que anteriormente estava sendo passado -1
                                       iIdForCli, cdsProv.FieldByName('CODDOCUMENTO').AsInteger, True) then

            raise exception.Create( MessageInfo );

         // o último parâmetro será utilizado para passar a mensagem do processamento
         Inc (iAtual);
         DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

         if bGeraLog then begin
            writeLn(ArqLog, 'Contrato: ' + cdsProv.FieldByName('IDCONTRATOIMOVEL').AsString + ': ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
         end;

         cdsProv.Next;
      end;

      // Reverte Saldo da Provisão de Perdas
      DoProgresso ([sNomeBilhete, 1, 1, -1, -1, DateToStr(dLimite) + ' - Verificando Reversão de Provisão de Perdas...']);
      if not ReverteProvPerdas(iIdOper, dLimite) then raise Exception.Create( MessageInfo );

      // Resume os Lançamentos em LancOperImob
      if bGeraLog then writeLn(ArqLog, 'Inicio GravaLancOperImob: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
      if not GravaLancOperImob(sNomeBilhete, [iIdOper], dLimite, 1) then
         Raise Exception.Create( MessageInfo );
      if bGeraLog then writeLn(ArqLog, 'Termino GravaLancOperImob: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

      Commit;
      Result := True;
    except
      on E:Exception do begin
        Result := false;
        Rollback;
        MessageInfo := E.Message;
        DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
      end;
    end;
  finally
    FreeAndNil( cdsProv );
    if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)); // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
    if bGeraLog then Close( ArqLog );
  end;
end;



function TCtrlOperImob.ReverteProvPerdas(const iIdOper:Integer; const dLimite: TDateTime): Boolean;
var cdsTemp : TCMClientDataSet;
    sSql, sDtLimite : String;
begin
  try
    try
      Result := True;

      // Busca provisões por contrato a serem revertidas
      cdsTemp   := TCMClientDataSet.Create(nil);
      sDtLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')';
      sSql      := 'SELECT /*+ INDEX (L) */ '+#13+
                   '       L.CODTIPIMOVEL, L.IDCONTRATOIMOVEL, L.IDFORCLI, L.DATAOPER, L.VLRACUM '+#13+
                   '  FROM LANCOPERDIAIMOB L,                                                    '+#13+
                   '       ( SELECT /*+ INDEX (L1) */ IDCONTRATOIMOVEL, MAX(DATAOPER) AS ULTDATA '+#13+
                   '           FROM LANCOPERDIAIMOB L1        '+#13+
                   '          WHERE CODDOCUMENTO IS NULL      '+#13+
                   '            AND IDPARCFINANCIMOV IS NULL AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') '+#13+
                   '            AND DATAOPER   < ' + sDtLimite +#13+
                   '            AND IDMODULO   = ' + IntToStr(ParamSistema.idModulo) +#13+
                   '            AND IDOPERACAO = ' + IntToStr(iIdOper) +#13+
                   '          GROUP BY IDCONTRATOIMOVEL ) ULT '+#13+
                   ' WHERE L.CODDOCUMENTO IS NULL             '+#13+
                   '   AND L.IDPARCFINANCIMOV IS NULL         '+#13+
                   '   AND L.IDMODULO   = ' + IntToStr(ParamSistema.idModulo) +#13+
                   '   AND L.IDOPERACAO = ' + IntToStr(iIdOper)+#13+
                   '   AND L.IDCONTRATOIMOVEL = ULT.IDCONTRATOIMOVEL AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'+#13+
                   '   AND L.DATAOPER = ULT.ULTDATA '+#13+
                   '   AND L.VLRACUM <> 0           '+#13+
                   '   AND L.IDCONTRATOIMOVEL NOT IN ( SELECT DISTINCT IDCONTRATOIMOVEL '+#13+
                   '                                     FROM LANCOPERDIAIMOB           '+#13+
                   '                                    WHERE DATAOPER = ' + sDtLimite   +#13+
                   '                                      AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.idModulo) +#13+
                   '                                      AND IDOPERACAO = ' + IntToStr(iIdOper) + ' )      '+#13+
                   ' ORDER BY CODTIPIMOVEL, IDCONTRATOIMOVEL ';

      CMDebugToFile(sSql,'C:\Planus\Temp\ReverteProvPerdas.txt');  //eraldo

      cdsTemp.Data := GetDataPacket( sSql );

      while not cdsTemp.Eof do begin
         if not GravaLancOperDiaImob(dLimite, -1, iIdOper, 0,
                                     0,
                                     0,
                                     cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                     cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                     cdsTemp.FieldByName('IDFORCLI').AsInteger, -1, True) then
            raise exception.Create( MessageInfo );
         cdsTemp.Next;
      end;
    except
      on E:Exception do begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;



function TCtrlOperImob.AcumuladoUltimaProvisao(const iIdOper: Integer; const dDataOper, dDataBaixa:TDateTime; const sTipoImovel: String;
                                               const iIdContrato, iIdForCli, iCodDocumento, iIdParcFinancImov:Integer;
                                               var   bRegInicial:Boolean): Extended;
var sSql, sParam1, sParam2, sDataLimite, sDataBaixa : String;
    cdsTemp : TCMClientDataSet;
begin
  try
    Result      := 0;
    bRegInicial := True;
    cdsTemp := TCMClientDataSet.Create(nil);

//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016 - Inicio
    // Define Parametros
    sParam1 := ' AND L1.IDOPERACAO   = ' + IntToStr(iIdOper);
    sParam2 := ' AND L.IDOPERACAO = ' + IntToStr(iIdOper);
    if sTipoImovel <> '' then begin
       sParam1 := sParam1 + ' AND L1.CODTIPIMOVEL   = ' + QuotedStr(sTipoImovel);
       sParam2 := sParam2 + ' AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);
    end;
    if iIdContrato   > 0 then begin
       sParam1 := sParam1 + ' AND L1.IDCONTRATOIMOVEL   = ' + IntToStr(iIdContrato);
       sParam2 := sParam2 + ' AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);
    end;
    if iIdForCli     > 0 then begin
       sParam1 := sParam1 + ' AND L1.IDFORCLI   = ' + IntToStr(iIdForCli);
       sParam2 := sParam2 + ' AND L.IDFORCLI = ' + IntToStr(iIdForCli);
    end;
    if iCodDocumento > 0 then begin
       sParam1 := sParam1 + ' AND L1.CODDOCUMENTO       = ' + IntToStr(iCodDocumento);
       sParam2 := sParam2 + ' AND L.CODDOCUMENTO     = ' + IntToStr(iCodDocumento);
    end else begin
       sParam1 := sParam1 + ' AND L1.CODDOCUMENTO IS NULL ';
       sParam2 := sParam2 + ' AND L.CODDOCUMENTO IS NULL ';
    end;
    if iIdParcFinancImov > 0 then begin
       sParam1 := sParam1 + ' AND L1.IDPARCFINANCIMOV   = ' + IntToStr(iIdParcFinancImov);
       sParam2 := sParam2 + ' AND L.IDPARCFINANCIMOV = ' + IntToStr(iIdParcFinancImov);
    end else begin
       sParam1 := sParam1 + ' AND L1.IDPARCFINANCIMOV IS NULL';
       sParam2 := sParam2 + ' AND L.IDPARCFINANCIMOV IS NULL';
    end;

    if dDataBaixa > 0 then begin
       sDataBaixa := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataBaixa)) + ',''DD/MM/YYYY'')';
       sParam1 := sParam1 + ' AND L1.DATABAIXA   = ' + sDataBaixa;
       sParam2 := sParam2 + ' AND L.DATABAIXA = ' + sDataBaixa;
    end;

    // Define Sql
    sDataLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')';
    sSql := 'SELECT /*+ INDEX (L) */                     '+#13+
            '       COUNT(1)       AS QTDE,              '+#13+
            '       SUM(L.VLRACUM) AS VLRACUM            '+#13+
            '  FROM LANCOPERDIAIMOB L,                   '+#13+
            '       ( SELECT /*+ INDEX (L1) */            '+#13+
            '                MAX(L1.DATAOPER) AS FECHAMENTO '+#13+
            '           FROM LANCOPERDIAIMOB L1           '+#13+
            '          WHERE L1.IDMODULO   = ' + IntToStr(ParamSistema.idModulo) +#13+
            '            AND (L1.FLGTIPO IS NULL OR L1.FLGTIPO <> ''S'') AND L1.DATAOPER <= '+ sDataLimite +#13+ sParam1 +#13+
            '       ) ULT '+#13+
            ' WHERE L.DATAOPER  = ULT.FECHAMENTO AND (L.FLGTIPO IS NULL OR L.FLGTIPO <> ''S'')  '+#13+
            '   AND L.IDMODULO  = '+ IntToStr(ParamSistema.idModulo) +#13+ sParam2;
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016 - Fim

    cdsTemp.Data := GetDataPacket( sSql );
    if not cdsTemp.IsEmpty then begin
       Result      := cdsTemp.FieldByName('VLRACUM').AsFloat;
       bRegInicial := (cdsTemp.FieldByName('QTDE').AsInteger = 0);
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;


function TCtrlOperImob.ReverteBaixaParcial(const IdOperacao, iCodDocumento,
         iParcFinancimov: Integer; const sTipoImovel:String; const dDataOper: TDateTime; const fVlrTotLanc: Extended; var fVlrReverte: Extended): Boolean;
var sSql, sParam1, sDataLimite : String;
    cdsTemp : TCMClientDataSet;
begin
  try
    Result  := False;
    cdsTemp := TCMClientDataSet.Create(nil);

//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016 - Inicio
    // Define Parametros
    sParam1 := ' AND L.IDOPERACAO   = ' + IntToStr(IdOperacao);
    if sTipoImovel <> '' then begin
       sParam1 := sParam1 + ' AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);
    end;
    if iCodDocumento > 0 then begin
       sParam1 := sParam1 + ' AND L.CODDOCUMENTO       = ' + IntToStr(iCodDocumento);
    end else begin
       sParam1 := sParam1 + ' AND L.CODDOCUMENTO IS NULL ';
    end;
    if iParcFinancImov > 0 then begin
       sParam1 := sParam1 + ' AND L.IDPARCFINANCIMOV   = ' + IntToStr(iParcFinancImov);
    end else begin
       sParam1 := sParam1 + ' AND L.IDPARCFINANCIMOV IS NULL';
    end;

    // Define Sql
    sDataLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')';

    sSql := 'SELECT /*+ INDEX (L) */ SUM(L.VLRDIA) AS TOT_CTB ' +#13+
            '  FROM LANCOPERDIAIMOB L    ' +#13+
            ' WHERE (L.FLGTIPO IS NULL OR L.FLGTIPO <> ''S'') AND L.DATAOPER <= ' + sDataLimite + sParam1;
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016 - Fim            

    cdsTemp.Data := GetDataPacket( sSql );
    fVlrReverte  := fVlrTotLanc - cdsTemp.FieldByName('TOT_CTB').AsFloat;
    Result       := (fVlrReverte <> 0)
  finally
    FreeAndNil( cdsTemp );
  end;
end;




function TCtrlOperImob.IntegraProvisao(sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM, iIdOperPerdas, iIdOperReceita:Integer;
                                       const sTipoImovel: String; const dDtProv: TDateTime; const bTransacao : Boolean): Boolean;
var ParamContabeis: TParamContabeisMT;
    cdsTemp: TCMClientDataSet;
    sSql, sMsg, sCCDeb, sCCCre, sCtaDeb, sCtaCre: string;
    fValorLanc: Extended;
    iCodErro, iQuant, iAtual : Integer;
    iPlanilha : Double;
    fTotalLanc : Double;
begin
  fTotalLanc := 0;
  try
    try
      Result := True;
      if bTransacao then StartTransaction;

      // Busca as atualizações para integração contábil
      cdsTemp := TCMClientDataSet.Create(nil);
      cdsTemp.Data := BuscaProvisaoAIntegrar([iIdOperMulta, iIdOperJuros, iIdOperCM, iIdOperPerdas, iIdOperReceita],
                                             dDtProv, '');
      cdsTemp.First;

      while not cdsTemp.Eof do
      begin
        fTotalLanc := fTotalLanc + cdsTemp.FieldByName('VLRDIA').asFloat;
        cdsTemp.Next;
      end;
      cdsTemp.First;

      // força um do progresso para montar a tela
      iQuant := cdsTemp.RecordCount;
      iAtual := 1;
      DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

      // Executa a integração para cada lançamento
      iPlanilha := cdsTemp.FieldByName('PLNCODIGO').AsInteger;
      while not cdsTemp.Eof do begin

         // zera parametros contabeis
         CtrlPadrLancImovel.ZeraPadrLancContabil( ParamContabeis );

         // definir parâmetros contábeis
         if not CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabeis, iCodErro, 'O', False,
                                   ParamSistema.idEmpresa, ParamSistema.idModulo,
                                   cdsTemp.FieldByName('IDOPERACAO').AsInteger,
                                   cdsTemp.FieldByName('CODTIPIMOVEL').AsString) then
           raise Exception.Create ( CtrlPadrLancImovel.MessageInfo );

         // verificar se valor negativo = ESTORNO ( inverte as contas )
         if cdsTemp.FieldByName('VLRDIA').AsFloat < 0 then begin
           fValorLanc := cdsTemp.FieldByName('VLRDIA').AsFloat * -1;
           sCtaCre    := ParamContabeis.sContaContabilDebito;
           sCtaDeb    := ParamContabeis.sContaContabilCredito;
           sCCCre     := ParamContabeis.sCentroCustoDebito;
           sCCDeb     := ParamContabeis.sCentroCustoCredito;
         end else begin
           fValorLanc := cdsTemp.FieldByName('VLRDIA').AsFloat;
           sCtaCre    := ParamContabeis.sContaContabilCredito;
           sCtaDeb    := ParamContabeis.sContaContabilDebito;
           sCCCre     := ParamContabeis.sCentroCustoCredito;
           sCCDeb     := ParamContabeis.sCentroCustoDebito;
         end;

         // definir histórico contábil - Adriana Funcef
         if cdsTemp.FieldByName('IDCONTRATOIMOVEL').IsNull then begin
            ParamContabeis.sHistoricoCtb := 'Segmento: '    + cdsTemp.FieldByName('CODTIPIMOVEL').AsString +
                                            ' - Operação: ' + cdsTemp.FieldByName('DESCCUSTORECIMO').AsString;
         end else begin
            ParamContabeis.sHistoricoCtb := 'Segmento: '    + cdsTemp.FieldByName('CODTIPIMOVEL').AsString +
                                            ' - Contrato: ' + cdsTemp.FieldByName('CONNUMERO').AsString + ' - ' + cdsTemp.FieldByName('CONNOME').AsString +
                                            ' - Operação: ' + cdsTemp.FieldByName('DESCCUSTORECIMO').AsString;
         end;

         // integrar contabilidade
         if not CtrlImobLancamento.InsereLancaContab ( '2',
                                                       ParamSistema.idEmpresa,
                                                       ParamSistema.idModulo,
                                                       ParamSistema.idUsuario,
                                                       CtrlParamIntegra.Plano,
                                                       ParamContabeis.iUnidNegoc, 0, 0,
                                                       //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
                                                       cdsTemp.FieldByName('IDPLANOPREV').AsInteger,
                                                       cdsTemp.FieldByName('IDPATRO').AsInteger,
                                                       //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim
                                                       iPlanilha, 0,
                                                       DateToStr( cdsTemp.FieldByName('DATAOPER').AsDateTime ),
                                                       '', ParamContabeis.sHistoricoCtb,
                                                       '', '', '', '',
                                                       ParamContabeis.sTipCodigo,
                                                       sCCDeb, sCtaDeb, sCCCre, sCtaCre, '',
                                                       fValorLanc, False,
                                                       ParamSistema.UsaPlanoPatro,
                                                       ParamContabeis.iIdSegregaCriter,
                                                       cdsTemp.FieldByName('DATAOPER').AsDateTime,
                                                       //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
                                                       -1, -1, True, -1, False, fTotalLanc) then
                                                       //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim

           raise Exception.Create ( CtrlImobLancamento.MessageInfo )
         else begin
           // Gravar a planilha gerada em LANCOPERCONTIMOB
           if iPlanilha = 0 then begin
             iPlanilha := CtrlImobLancamento.RetornoPlnCodigo;
             sSql := 'UPDATE LANCOPERCONTIMOB ' +#13+
                     '   SET PLNCODIGO = ' + FloatToStr(CtrlImobLancamento.RetornoPlnCodigo) +#13+
                     ' WHERE IDLANCOPERCONTIMO = ' + cdsTemp.FieldByName('IdLancOperContImo').AsString;
             if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );
           end;

           // Grava o Nr. do Lançamento gerado na tabela LANCOPERIMOB
           //       a clausula Where deve ser idêntica ao group by do cdsTemp
           sSql := 'UPDATE LANCOPERIMOB ' +#13+
                   '   SET LANCNUMLAN = ' + IntToStr (CtrlImobLancamento.NumLancamento) +#13+
                   ' WHERE LANCNUMLAN IS NULL '+#13+
                   '   AND NVL(VLRDIA,0) <> 0 '+#13+
                   '   AND IDOPERACAO   = ' + cdsTemp.FieldByName('IDOPERACAO').AsString   +#13+
                   '   AND CODTIPIMOVEL = ' + QuotedStr(cdsTemp.FieldByName('CODTIPIMOVEL').AsString) +#13+
                   '   AND DATAOPER     = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',cdsTemp.FieldByName('DATAOPER').AsDateTime)) + ',''DD/MM/YYYY'')';

           if not cdsTemp.FieldByName('IDCONTRATOIMOVEL').IsNull then
              sSql := sSql + '   AND IDCONTRATOIMOVEL = ' + cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsString;

           sSql := sSql + ' AND IDPLANOPREV = ' + cdsTemp.FieldByName('IDPLANOPREV').AsString;
           sSql := sSql + ' AND IDPATRO = ' + cdsTemp.FieldByName('IDPATRO').AsString;

           if not ExecSQL(sSql) then raise Exception.Create ( MessageInfo );
         end;

         if cdsTemp.FieldByName('IDCONTRATOIMOVEL').IsNull then begin
            sMsg := 'Operação: ' + cdsTemp.FieldByName('DESCCUSTORECIMO').AsString +
                    ' Tipo Imóvel: ' + cdsTemp.FieldByName('CODTIPIMOVEL').AsString + ' OK';
         end else begin
            sMsg := 'Operação: ' + cdsTemp.FieldByName('DESCCUSTORECIMO').AsString +
                    ' Contrato: ' + cdsTemp.FieldByName('CONNUMERO').AsString + ' OK';
         end;

         cdsTemp.Next;

         // o último parâmetro será utilizado para passar a mensagem do processamento
         Inc (iAtual);
         DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, sMsg]);
      end;

      if bTransacao then Commit;
    except
      on E:Exception do begin
        Result := False;
        if bTransacao then Rollback;
        MessageInfo := E.Message;
        // registrar erro
        sMsg := '---------------------------------------------------------'+ #13#10+
                'ERRO - Operação: ' + cdsTemp.FieldByName('DESCCUSTORECIMO').AsString +
                ' Tipo Imóvel: ' + cdsTemp.FieldByName('CODTIPIMOVEL').AsString + #13#10 +
                E.Message + #13#10 +
                '---------------------------------------------------------';
        DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, sMsg]);
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
    if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)); // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
  end;
end;



//========================================================================================
// Função para Lancamento de Correção Monetária, Juros e Multa por Atraso
//        em documentos em aberto no Contas a Receber
// Data : 03/09/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : sNomeBilhete    - Nome do bilhete para retorno de contador e mensagens
//              IdOperMulta     - ID da Operação de atualização de Multa
//              IdOperJuros     - ID da Operação de atualização de Juros
//              IdOperCM        - ID da Operação de atualização de Correção Monetária
//              dLimite         - Data limite para atualização do documento
//              iIdContrato     - ID do Contrato  ( -1 )
//              bSimula         - Gera lançamentos apenas para Simulação ( False )
//
// Retorno : True  - Correção OK
//           False - Falha no processamento
//----------------------------------------------------------------------------------------
function TCtrlOperImob.AtualizaDocsVencidos(sNomeBilhete: string; const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                            const dLimite: TDateTime; const iIdContrato:Integer = -1; const bSimula:Boolean = False;
                                            const sTipoContrato : String = ''): Boolean;
begin
  Result := True;
  try
     try       
       //Cássio - SOL Nº 142927 KINTANA Nº 917823 - Início
        if bGeraLog then begin
           AssignFile(ArqLog, '1_AtualizaDoc'+FormatDateTime('ddmmyyyy',dLimite)+ '.Log');
           Rewrite(ArqLog);
           writeLn(ArqLog, 'Função: AtualizaDocsVencidos - Dia: ' + FormatDateTime('dd/mm/yyyy',dLimite));
           writeLn(ArqLog, ' ');
        end;

        //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
        if not InTransaction then
           StartTransaction;

        // Exclui lançamentos anteriores se for um Reprocessamento
        if bGeraLog then writeLn(ArqLog, 'Inicio Reprocessamento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if not Reprocessamento(sNomeBilhete, [iIdOperMulta,iIdOperJuros,iIdOperCM], dLimite, -1, bSimula) then
           raise Exception.Create( MessageInfo );

        //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
        if InTransaction then
          Commit;

        if bGeraLog then writeLn(ArqLog, 'Término Reprocessamento: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if bGeraLog then writeLn(ArqLog, ' ');

        // Calcula correção de documentos vencidos sem nenhum pagamento
        if bGeraLog then writeLn(ArqLog, 'Inicio AtualizaDocsSemBaixa: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if not AtualizaDocsSemBaixa(sNomeBilhete, iIdOperMulta, iIdOperJuros, iIdOperCM, dLimite, iIdContrato, bSimula, sTipoContrato) then
           Raise Exception.Create( MessageInfo );

        if bGeraLog then writeLn(ArqLog, 'Término AtualizaDocsSemBaixa: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if bGeraLog then writeLn(ArqLog, ' ');

        // Calcula correção de documentos vencidos com baixa parcial
        if bGeraLog then writeLn(ArqLog, 'Inicio AtualizaDocsBaixaParcial: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if not AtualizaDocsBaixaParcial(sNomeBilhete, iIdOperMulta, iIdOperJuros, iIdOperCM, dLimite, iIdContrato, bSimula, sTipoContrato) then
           Raise Exception.Create( MessageInfo );

        if bGeraLog then writeLn(ArqLog, 'Término AtualizaDocsBaixaParcial: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if bGeraLog then writeLn(ArqLog, ' ');

        if not(bSimula) then begin
           //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
           if not InTransaction then
              StartTransaction;
           if not AjustesDiversos(dLimite) then
              Raise Exception.Create( MessageInfo );
           if InTransaction then
              Commit;
        end;

        // Resume os Lançamentos em LancOperImob
        if (iCodDocumentoAjuste <= 0) and not(bSimula) then begin
           //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
           if not InTransaction then
              StartTransaction;
           if bGeraLog then writeLn(ArqLog, 'Inicio GravaLancOperImob: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
           if not GravaLancOperImob(sNomeBilhete, [iIdOperMulta, iIdOperJuros, iIdOperCM], dLimite, 1) then
              Raise Exception.Create( MessageInfo );
           if InTransaction then
              Commit;
           if bGeraLog then writeLn(ArqLog, 'Término GravaLancOperImob: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
           if bGeraLog then writeLn(ArqLog, ' ');
        end;

// Daniel - 22056 - Início -----------------------------------------------------
        // Atualiza Data do último fechamento...
        if (iCodDocumentoAjuste<=0) and not(bSimula) then begin
           //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
           if not InTransaction then
              StartTransaction;
           if not AtualizaDataFechamento(dLimite) then
              raise Exception.Create( MessageInfo );
           if InTransaction then
              Commit;
        end;
// Daniel - 22056 - Fim --------------------------------------------------------
       //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
     except
        on e : Exception do begin
           Result := False;
           if InTransaction then
              Rollback;
           MessageInfo := e.message;
        end;
     end;
  finally
     if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)); // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
     if bGeraLog then CloseFile( ArqLog );
  end;
end;


function TCtrlOperImob.AtualizaDocsSemBaixa(sNomeBilhete: string;
                                            const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                            const dLimite: TDateTime;
                                            const iIdContrato:Integer = -1;
                                            const bSimula:Boolean = False;
                                            const sTipoContrato : String = ''): Boolean;
var cdsTemp : TCMClientDataSet;
    iAtual, iQuant, iUsaMesAnterior, iIdParcFinancImov, iIDContratoImovel : Integer;
    fVlrDevido, fCM, fJuros, fMulta : Extended;
    dDataBaixa, dDtLimiteDoc : TDateTime;
    bJurosProporcional : Boolean;
    sSql, sTexto : String;

    bApenasUltMes : Boolean;
    iTipoReceita      : Integer;
    fFValorJuros      : Extended;
    fFValorMulta      : Extended;
    fFPercentualMulta : Extended;
    fFPercentualJuros : Extended;
    fFMoedaMulta      : Integer;
    fFMoedaJuros      : Integer;
    fFMoedaCM         : Integer;
    fFUsaMesAnterior  : Integer;
    fFPeriodoJuros    : String;
    fFJurosProporc    : Variant;
    //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    iRegCommit : Integer;
    vDadosOperacao    : TDadosOper;   // Edilaine - SOL 170547-9382 / KTN 1654606
begin
  Result := True;

  try
    // Busca os Documentos em Aberto, já vencidos e sem nenhuma baixa
    cdsTemp := TCMClientDataSet.Create( nil );
    try
      if (ParamSistema.idModulo=64) then
        cdsTemp.Data := CtrlLanctoImovel.LookupDocAberto(dLimite,'T',iCodDocumentoAjuste)
      else
        cdsTemp.Data := CtrlParcFinancImov.LookupDocAberto(dLimite,'T',iIdContrato,sTipoContrato);

      if bGeraLog then
        Writeln(ArqLog,'BuscaQuery: '+FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));

      // força um do progresso para montar a tela
      iAtual := 1;
      iQuant := cdsTemp.RecordCount;
      //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
      iRegCommit := 0;      

      DoProgresso([sNomeBilhete,iAtual,iQuant,-1,-1,DateToStr(dLimite)+' - Calculando correções de documentos vencidos e sem pagamentos...']);

      // Calcula a Correção, Juros e Multa para cada documento em atraso
      cdsTemp.First;
      while not cdsTemp.Eof do begin
        //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
        if not InTransaction then
           StartTransaction;

        fFValorMulta      := 0;
        fFValorJuros      := 0;
        fFPercentualMulta := 0;
        fFPercentualJuros := 0;
        fFMoedaMulta      := -1;
        fFMoedaJuros      := -1;
        fFMoedaCM         := -1;
        fFUsaMesAnterior  := 0;
        fFPeriodoJuros    := '';
        fFJurosProporc    := '';

        if (iCodDocumentoAjuste>0) then begin
          if (cdsTemp.FieldByName('CODDOCUMENTO').AsInteger<>iCodDocumentoAjuste) then begin
            //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016          
            // O último parâmetro será utilizado para passar a mensagem do processamento
            Inc (iAtual);
            DoProgresso([sNomeBilhete,iAtual,iQuant,-1,-1]);
            cdsTemp.Next;
            Continue;
          end;
        end;

// Daniel - 22687 - Início -----------------------------------------------------
        if (ParamSistema.IdModulo = 135) then
          iTipoReceita := -1
        else
          iTipoReceita := cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger;

        if FBuscaParamMultaContrato then begin

          if ( CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                              cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                              iTipoReceita,
                                              cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime ,
{Helen - SOL: 136341 Kintana : 815095}        cdsTemp.FieldByName('CODDOCUMENTO').AsInteger ) ) then
          begin
            with rParamMulta do begin
              fFValorMulta      := fVlrMulta;
              fFValorJuros      := fVlrJuros;
              fFPercentualMulta := fPercMulta;
              fFPercentualJuros := fPercJuros;
              fFMoedaMulta      := iMoeMulta;
              fFMoedaJuros      := iMoeJuros;
              fFMoedaCM         := iIndiceCorrecao;
              fFUsaMesAnterior  := iMesRefCorrecao;
              fFPeriodoJuros    := sPeriodoJuros;
              fFJurosProporc    := sFlgJurosProporc;
            end;
          end;

        end else begin
          fFValorJuros      := FValorJuros;
          fFValorMulta      := FValorMulta;
          fFPercentualMulta := FPercentualMulta;
          fFPercentualJuros := FPercentualJuros;
          fFMoedaMulta      := FMoedaMulta;
          fFMoedaJuros      := FMoedaJuros;
          fFMoedaCM         := FMoedaCM;
          fFUsaMesAnterior  := FUsaMesAnterior;
          fFPeriodoJuros    := FPeriodoJuros;
          fFJurosProporc    := FJurosProporc;
        end;
// Daniel - 22687 - Fim --------------------------------------------------------

        sTexto := '  Dia      '+DateToStr(dLimite)                           +
                  '  Doc.     '+cdsTemp.FieldByName('CODDOCUMENTO').AsString +
                  '  IndCorr. '+IntToStr(fFMoedaCM)                          +
                  '  PerMulta '+FloatToStr(fFPercentualMulta)                +
                  '  PerJuros '+FloatToStr(fFPercentualJuros)+' '+fFPeriodoJuros;

        CMDebugToFile(sTexto,'AtuDiarioParam.log');

        if (ParamSistema.IdModulo=135) then
          iIdParcFinancImov := cdsTemp.FieldByName('IDPARCFINANCIMOV').AsInteger
        else
          iIdParcFinancImov := -1;

        iIDContratoImovel := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;


        // Calcula a Data Limite
        if (not cdsTemp.FieldByName('DATALIMITE').IsNull) and (not VerificaFeriado(cdsTemp.FieldByName('DATALIMITE').AsDateTime) ) then begin
          dDtLimiteDoc := cdsTemp.FieldByName('DATALIMITE').AsDateTime;
        end else begin

         // busca parametros para calculo da data limite apenas se for recalculo manual.
         if not FBuscaParamMultaContrato then begin
            CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                           cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                           iTipoReceita,
                                           cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime);
         end;

         dDtLimiteDoc := ComunsImobiliarioDB.DataLimite(cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                        cdsTemp.FieldByName('IDCIDADES').AsInteger,
                                                        cdsTemp.FieldByName('IDPAIS').AsInteger,
                                                        rParamMulta.iDiasTolerancia,
                                                        rParamMulta.iDiasRepasse,
                                                        cdsTemp.FieldByName('CODESTADO').AsString,
                                                        rParamMulta.sFlgTipoDiasTolera,
                                                        rParamMulta.sFlgTipoDiasRepasse,
                                                        True,False,False);

          //Atualiza a data limite calculada no documento
          if ParamSistema.idModulo = 64 then begin
             sSql := 'UPDATE LANCAMENTOSIMOVEL '+
                     '   SET DATALIMITE = TO_DATE(' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDtLimiteDoc ) ) + ',''DD/MM/YYYY'') ' +
                     ' WHERE CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString;
          end else begin
             sSql := 'UPDATE PARCFINANCIMOV '+
                     '   SET DATALIMITE = TO_DATE(' + QuotedStr( FormatDateTime( 'DD/MM/YYYY', dDtLimiteDoc ) ) + ',''DD/MM/YYYY'') ' +
                     ' WHERE IDPARCFINANCIMOV = ' + cdsTemp.FieldByName('IDPARCFINANCIMOV').AsString;
          end;
          if not ExecSQL( sSql ) then
            raise Exception.create('Erro ao atualizar a data limite.');
        end;

        // Calcula a correção apenas se o processamento for maior que a data limite do documento
        if (dLimite > dDtLimiteDoc) then
        begin
          // Verifica uso do indice do mes anterior
          iUsaMesAnterior    := fFUsaMesAnterior;
          bJurosProporcional := fFJurosProporc = 'S';
          fFJurosProporc     := '';

          // Define a data da baixa e Valor Devido
          dDataBaixa := dLimite;
          fVlrDevido := cdsTemp.FieldByName('TOT_RECEBER').AsFloat + cdsTemp.FieldByName('TOT_ALTERADOR').AsFloat;

          if (ParamSistema.idModulo=135) then
            bApenasUltMes := CtrlModuloImobiliario.Alienacao.bApenasUltMesAnterior
          else
            bApenasUltMes := CtrlModuloImobiliario.AdminImob.bApenasUltMesAnterior;

          // Calcula a Correção Monetária
          fCM := ComunsImobiliarioDB.CalcCM(fVlrDevido,
                                            fFMoedaCM,
                                            cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime+1,
                                            dDataBaixa, bApenasUltMes, iUsaMesAnterior,
                                            True, FbFatorMesAntDiasMesAtual // Alterado por FHBS - SIG79081
                                            );

          // Calcula a Multa sobre o Valor Original + a Correção Monetária
          fMulta := ComunsImobiliarioDB.CalcMulta(cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                                  fVlrDevido,fCM,
                                                  fFValorMulta,
                                                  fFPercentualMulta,
                                                  fFMoedaMulta,
                                                  dDataBaixa,
                                                  dDataBaixa,
                                                  dLimite);

          // Calcula o Juros sobre o Valor Original + a Correção Monetária
          fJuros := ComunsImobiliarioDB.CalcJuros(fVlrDevido+fCM,
                                                  fFValorJuros,
                                                  fFPercentualJuros,
                                                  fFMoedaJuros,
                                                  fFPeriodoJuros,
                                                  cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime+1,
                                                  dDataBaixa,
                                                  bJurosProporcional);

          // Edilaine - SOL 170547-9382 / KTN 1654606
          if ParamSistema.idModulo = 64 then
          begin
            vDadosOperacao.DtLimite     := dLimite;
            vDadosOperacao.DtBaixa      := -1;
            vDadosOperacao.IdContrato   := iIdContratoImovel;
            vDadosOperacao.CodDocumento := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
            vDadosOperacao.IdOpFinanc   := iIdParcFinancImov;
            vDadosOperacao.bSimulacao   := bSimula;
          end;
          // Edilaine - SOL 170547-9382 / KTN 1654606 - fim

          // Atualiza os valores calculados
          if (fMulta > 0) then
          begin
            // Edilaine - SOL 170547-9382 / KTN 1654606
            if ParamSistema.idModulo = 64 then
            begin
              vDadosOperacao.IdOperador := iIdOperMulta;
              vDadosOperacao.vlrValor   := fMulta;
              vDadosOperacao.vlrAcum    := fMulta;

              if not LancaDadosOperacaoImob( vDadosOperacao ) then
                raise Exception.Create(MessageInfo);
            end
            else
            begin
              if not GravaLancOperDiaImob(dLimite,
                                          -1,
                                          iIdOperMulta,
                                          0,
                                          fMulta,
                                          fMulta,
                                          cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                          iIDContratoImovel,
                                          -1,
                                          cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                          True,
                                          iIdParcFinancImov,
                                          -1,
                                          bSimula) then
                raise Exception.Create(MessageInfo);
            end; // Edilaine - SOL 170547-9382 / KTN 1654606 - fim
          end;


          if (fJuros > 0) then
          begin
            // Edilaine - SOL 170547-9382 / KTN 1654606
            if ParamSistema.idModulo = 64 then
            begin
              vDadosOperacao.IdOperador := iIdOperJuros;
              vDadosOperacao.vlrValor   := fJuros;
              vDadosOperacao.vlrAcum    := fJuros;

              if not LancaDadosOperacaoImob( vDadosOperacao ) then
                raise Exception.Create(MessageInfo);
            end
            else
            begin
              if not GravaLancOperDiaImob(dLimite,
                                          -1,
                                          iIdOperJuros,
                                          0,
                                          fJuros,
                                          fJuros,
                                          cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                          iIDContratoImovel,
                                          -1,
                                          cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                          True,
                                          iIdParcFinancImov,
                                          -1,
                                          bSimula) then
                raise exception.Create(MessageInfo);
            end;  // Edilaine - SOL 170547-9382 / KTN 1654606 - fim
          end;

          if (fCM > 0) then
          begin
            // Edilaine - SOL 170547-9382 / KTN 1654606
            if ParamSistema.idModulo = 64 then
            begin
              vDadosOperacao.IdOperador := iIdOperCM;
              vDadosOperacao.vlrValor   := fCM;
              vDadosOperacao.vlrAcum    := fCM;

              if not LancaDadosOperacaoImob( vDadosOperacao ) then
                raise Exception.Create(MessageInfo);
            end
            else
            begin
              if not GravaLancOperDiaImob(dLimite,
                                          -1,
                                          iIdOperCM,
                                          0,
                                          fCM,
                                          fCM,
                                          cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                          iIDContratoImovel,
                                          -1,
                                          cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                          True,
                                          iIdParcFinancImov,
                                          -1,
                                          bSimula) then
                raise exception.Create(MessageInfo);
            end;  // Edilaine - SOL 170547-9382 / KTN 1654606 - fim
          end;
        end;

        // O último parâmetro será utilizado para passar a mensagem do processamento
        Inc (iAtual);

        DoProgresso([sNomeBilhete,iAtual,iQuant,-1,-1]);

        if bGeraLog then
          Writeln(ArqLog,'Doc: '+cdsTemp.FieldByName('CODDOCUMENTO').AsString+ ': '+FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));

        //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
        iRegCommit := iRegCommit + 1;
        if iRegCommit = 50 then
        begin
           if InTransaction then
              Commit;
           iRegCommit := 0;              
        end;

        cdsTemp.Next;
      end;
    except

      on e:Exception do begin
        Result      := False;
        MessageInfo := e.message;
      end;

    end;
  finally
    FreeAndNil( cdsTemp );
    if ( FileExists(sNomeBilhete) ) then
      DeleteFile(PCHAR(sNomeBilhete)); // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
  end;
end;



function TCtrlOperImob.AtualizaDocsBaixaParcial(sNomeBilhete: string;
                                                const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                                const dLimite: TDateTime;
                                                const iIdContrato:Integer = -1;
                                                const bSimula:Boolean = False;
                                                const sTipoContrato : String = ''): Boolean;
type TCorrige = record
  dBaixa : TDateTime;
  fCM    : Extended;
  fJuros : Extended;
  fMulta : Extended;
end;

var cdsTemp, cdsBaixa, cdsAlter : TCMClientDataSet;
    iAtual, iQuant, iUsaMesAnterior, iCiclo, iIdParcAliena : Integer;
    fVlrDevido, fVlrAlter, fTotCiclo, fTotPago : Extended;
    fTotCM, fTotJuros, fTotMulta : Extended;
    dDataInicio, dDataLimite, dDataCalc, dDataBaixa, dDataAlter : TDateTime;
    sSql : String;
    bCalcMulta, bJurosProporcional : Boolean;
    vCorrige : Array of TCorrige;

    bApenasUltMes : Boolean;
    iTipoReceita      : Integer;
    fFValorJuros      : Extended;
    fFValorMulta      : Extended;
    fFPercentualMulta : Extended;
    fFPercentualJuros : Extended;
    fFMoedaMulta      : Integer;
    fFMoedaJuros      : Integer;
    fFMoedaCM         : Integer;
    fFUsaMesAnterior  : Integer;
    fFPeriodoJuros    : String;
    fFJurosProporc    : Variant;

    // Alterado por FHBS - SOL: 136336 KTN: 815081
    fSimulaCM, fSimulaJuros, fSimulaMulta: Extended;
    dSimulaUltBaixa: TDateTime;
    // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081
    //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
    iRegCommit : Integer;
    vDadosOperacao : TDadosOper;   // Edilaine - SOL 170547-9382 / KTN 1654606
begin
  Result := True;
  cdsBaixa := TCMClientDataSet.Create( nil );
  cdsAlter := TCMClientDataSet.Create( nil );
  cdsTemp  := TCMClientDataSet.Create( nil );
  try
    try
      // Busca os Documentos em Aberto, já vencidos e com baixa parcial
      if (ParamSistema.idModulo = 64) then
        cdsTemp.Data := CtrlLanctoImovel.LookupDocAberto(dLimite,'P',iCodDocumentoAjuste)
      else
        cdsTemp.Data := CtrlParcFinancImov.LookupDocAberto(dLimite,'P',iIdContrato,sTipoContrato);

      if bGeraLog then
        Writeln(ArqLog,'BuscaQuery: '+FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));

      // Força um do progresso para montar a tela
      iAtual := 1;
      iQuant := cdsTemp.RecordCount;

      DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dLimite) +
                  ' - Calculando correções de documentos vencidos e pagos parcialmente...']);

      // Calcula a Correção, Juros e Multa para cada documento em atraso
      cdsTemp.First;
      while not cdsTemp.Eof do
      begin
        //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
        if not InTransaction then
           StartTransaction;      

        fFValorMulta      := 0;
        fFValorJuros      := 0;
        fFPercentualMulta := 0;
        fFPercentualJuros := 0;
        fFMoedaMulta      := -1;
        fFMoedaJuros      := -1;
        fFMoedaCM         := -1;
        fFUsaMesAnterior  := 0;
        fFPeriodoJuros    := '';
        fFJurosProporc    := '';

        if (iCodDocumentoAjuste > 0) then
        begin
          if (cdsTemp.FieldByName('CODDOCUMENTO').AsInteger <> iCodDocumentoAjuste) then
          begin
            cdsTemp.Next;
            Continue;
          end;
        end;

// Daniel - 22687 - Início -----------------------------------------------------
        if (ParamSistema.IdModulo = 135) then
          iTipoReceita := -1
        else
          iTipoReceita := cdsTemp.FieldByName('IDTIPOCUSTORECIMO').AsInteger;

        if FBuscaParamMultaContrato then
        begin
          if ( CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                              cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                              iTipoReceita,
                                              cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime) ) then
          begin
            with rParamMulta do
            begin
              fFValorMulta      := fVlrMulta;
              fFValorJuros      := fVlrJuros;
              fFPercentualMulta := fPercMulta;
              fFPercentualJuros := fPercJuros;
              fFMoedaMulta      := iMoeMulta;
              fFMoedaJuros      := iMoeJuros;
              fFMoedaCM         := iIndiceCorrecao;
              fFUsaMesAnterior  := iMesRefCorrecao;
              fFPeriodoJuros    := sPeriodoJuros;
              fFJurosProporc    := sFlgJurosProporc;
            end;
          end;

        end
        else
        begin
          fFValorJuros      := FValorJuros;
          fFValorMulta      := FValorMulta;
          fFPercentualMulta := FPercentualMulta;
          fFPercentualJuros := FPercentualJuros;
          fFMoedaMulta      := FMoedaMulta;
          fFMoedaJuros      := FMoedaJuros;
          fFMoedaCM         := FMoedaCM;
          fFUsaMesAnterior  := FUsaMesAnterior;
          fFPeriodoJuros    := FPeriodoJuros;
          fFJurosProporc    := FJurosProporc;
        end;
// Daniel - 22687 - Fim --------------------------------------------------------

        // Verifica uso do indice do mes anterior
        iUsaMesAnterior    := fFUsaMesAnterior;
        bJurosProporcional := fFJurosProporc = 'S';
        fFJurosProporc     := '';
        iIdParcAliena      := -1;

        if (ParamSistema.idModulo = 135) then
          iIdParcAliena := cdsTemp.FieldByName('IDPARCFINANCIMOV').AsInteger;

        dSimulaUltBaixa := -1; // Alterado por FHBS - SOL: 136336 KTN: 815081

        // Busca data da ultima baixa
        if not (cdsTemp.FieldByName('CODDOCUMENTO').IsNull) then
        begin
          // Alterado por FHBS - SOL: 136336 KTN: 815081 - Obtendo a data da última baixa
          if cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime > 0 then
          begin
            if (ParamSistema.idModulo = 64) then
            begin
              sSql := 'SELECT MAX(DECODE(L.CODALTERADOR, NULL, '                    +#13+
                      '                  R.DATABAIXA, L.DATALANCTO)) AS DATABAIXA ' +#13+
                      '  FROM LANCTODOCUM L, RECBTOPAGTO R    '                     +#13+
                      ' WHERE L.CODDOCUMENTO = R.CODDOCUMENTO(+) '                  +#13+
                      '   AND L.NUMLANCTO    = R.NUMLANCTO(+)    '                  +#13+
                      '   AND ( (RTRIM(L.OPERACAO) = ''5'') OR   '                  +#13+
                      '         (RTRIM(L.OPERACAO) = ''4'' AND DEBCRE = ''C'') )  ' +#13+
                      '   AND L.ESTORNO IS NULL               '                     +#13+
                      // Edilaine - SOL 179453 / KTN 1655199
                      //'   AND L.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime)) + ', ''DD/MM/YYYY'') ' + #13 +
                      '   AND NVL(R.DATABAIXA, L.DATALANCTO) <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime)) + ', ''DD/MM/YYYY'') ' + #13 +
                      // Edilaine - SOL 179453 / KTN 1655199 - fim
                      '   AND L.CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString;
            end
            else
            begin
              sSql := 'SELECT MAX(DECODE(RTRIM(L.OPERACAO),''5'',  '                             +#13+
                      '                  DECODE(R.DATABAIXA, NULL, L.DATALANCTO, R.DATABAIXA), ' +#13+
                      '                  L.DATALANCTO)) AS DATABAIXA '                           +#13+
                      '  FROM LANCTODOCUM L, RECBTOPAGTO R       '                               +#13+
                      ' WHERE L.CODDOCUMENTO = R.CODDOCUMENTO(+) '                               +#13+
                      '   AND L.NUMLANCTO    = R.NUMLANCTO(+)    '                               +#13+
                      '   AND L.ESTORNO IS NULL                  '                               +#13+
                      '   AND (RTRIM(L.OPERACAO) = ''5'' OR L.CODALTERADOR = 215)  '             +#13+ // Alterador de CPMF
                      '   AND L.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime)) + ', ''DD/MM/YYYY'') ' +#13+
                      '   AND L.CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString;
            end;
            cdsBaixa.Data := GetDataPacket( sSql );
            cdsBaixa.First;
            dSimulaUltBaixa := cdsBaixa.FieldByName('DATABAIXA').AsDateTime;
            cdsBaixa.Close;
          end;
          // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081

          if (ParamSistema.idModulo = 64) then
          begin
            sSql := 'SELECT DECODE(L.CODALTERADOR, NULL,                      '     +#13+
                    '              R.DATABAIXA, L.DATALANCTO) AS DATABAIXA, '     +#13+
                    '       SUM(L.VALOR) AS VALOR           '                     +#13+
                    '  FROM LANCTODOCUM L, RECBTOPAGTO R    '                     +#13+
                    ' WHERE L.CODDOCUMENTO = R.CODDOCUMENTO(+) '                  +#13+
                    '   AND L.NUMLANCTO    = R.NUMLANCTO(+)    '                  +#13+
                    '   AND ( (RTRIM(L.OPERACAO) = ''5'') OR   '                  +#13+
                    '         (RTRIM(L.OPERACAO) = ''4'' AND DEBCRE = ''C'') )  ' +#13+
                    '   AND L.ESTORNO IS NULL               '                     +#13+
                      // Edilaine - SOL 179453 / KTN 1655199
                    //'   AND L.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dLimite)) + ', ''DD/MM/YYYY'') ' + #13 +
                    '   AND NVL(R.DATABAIXA, L.DATALANCTO) <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dLimite)) + ', ''DD/MM/YYYY'') ' + #13 +
                      // Edilaine - SOL 179453 / KTN 1655199 - fim
                    '   AND L.CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString +#13+
                    ' GROUP BY DECODE(L.CODALTERADOR, NULL, R.DATABAIXA, L.DATALANCTO) '        +#13+
                    ' ORDER BY DATABAIXA ';
          end
          else
          begin
            sSql := 'SELECT DECODE(RTRIM(L.OPERACAO),''5'',  '                             +#13+
                    '              DECODE(R.DATABAIXA, NULL, L.DATALANCTO, R.DATABAIXA), ' +#13+
                    '              L.DATALANCTO) AS DATABAIXA, SUM(L.VALOR) AS VALOR  '    +#13+
                    '  FROM LANCTODOCUM L, RECBTOPAGTO R       '                           +#13+
                    ' WHERE L.CODDOCUMENTO = R.CODDOCUMENTO(+) '                           +#13+
                    '   AND L.NUMLANCTO    = R.NUMLANCTO(+)    '                           +#13+
                    '   AND L.ESTORNO IS NULL                  '                           +#13+
                    '   AND (RTRIM(L.OPERACAO) = ''5'' OR L.CODALTERADOR = 215)  '         +#13+ // Alterador de CPMF
                    '   AND L.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dLimite)) + ', ''DD/MM/YYYY'') ' +#13+
                    '   AND L.CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString +#13+
                    ' GROUP BY DECODE(RTRIM(L.OPERACAO),''5'', '                              +#13+
                    '              DECODE(R.DATABAIXA, NULL, L.DATALANCTO, R.DATABAIXA), '    +#13+
                    '              L.DATALANCTO)               '                              +#13+
                    ' ORDER BY DATABAIXA  ';
          end;

          cdsBaixa.Data := GetDataPacket( sSql );
          cdsBaixa.First;
          dDataBaixa    := cdsBaixa.FieldByName('DATABAIXA').AsDateTime;
          SetLength(vCorrige,(cdsBaixa.RecordCount + 1));

        end
        else
        begin
          dDataBaixa := cdsTemp.FieldByName('DATA_BAIXA').AsDateTime;
          SetLength(vCorrige, 2);
        end;

        // Define a data limite
        if (not cdsTemp.FieldByName('DATALIMITE').IsNull) and
           (not VerificaFeriado(cdsTemp.FieldByName('DATALIMITE').AsDateTime)) then
        begin
          dDataLimite := cdsTemp.FieldByName('DATALIMITE').AsDateTime;
        end
        else
        begin
          // busca parametros para calculo da data limite apenas se for recalculo manual.
          if not FBuscaParamMultaContrato then
          begin
            CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                           cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                           iTipoReceita,
                                           cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime);
          end;

          dDataLimite := ComunsImobiliarioDB.DataLimite(cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                        cdsTemp.FieldByName('IDCIDADES').AsInteger,
                                                        cdsTemp.FieldByName('IDPAIS').AsInteger,
                                                        rParamMulta.iDiasTolerancia,
                                                        rParamMulta.iDiasRepasse,
                                                        cdsTemp.FieldByName('CODESTADO').AsString,
                                                        rParamMulta.sFlgTipoDiasTolera,
                                                        rParamMulta.sFlgTipoDiasRepasse,
                                                        True,False,False);

          // Atualiza a data limite calculada no documento
          if ParamSistema.idModulo = 64 then
          begin
            sSql := 'UPDATE LANCAMENTOSIMOVEL '+#13+
                    '   SET DATALIMITE = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLimite)) + ',''DD/MM/YYYY'') '+#13+
                    ' WHERE CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString;
          end
          else
          begin
            sSql := 'UPDATE PARCFINANCIMOV '+#13+
                    '   SET DATALIMITE = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLimite)) + ',''DD/MM/YYYY'') '+#13+
                    ' WHERE IDPARCFINANCIMOV = ' + cdsTemp.FieldByName('IDPARCFINANCIMOV').AsString;
          end;

          if not ExecSQL(sSql) then
            raise Exception.Create('Erro ao atualizar a data limite ');
        end;

        // Verificar se a multa já foi cobrada, pois esta é cobrada uma única vez.
        bCalcMulta := True;
        fTotCM     := 0;
        fTotJuros  := 0;
        fTotMulta  := 0;
        fTotPago   := 0;
        fTotCiclo  := 0;

        // Zera o vetor
        for iCiclo := 0 to Length(vCorrige)-1 do
        begin
          vCorrige[iCiclo].dBaixa := -1;
          vCorrige[iCiclo].fCM    :=  0;
          vCorrige[iCiclo].fJuros :=  0;
          vCorrige[iCiclo].fMulta :=  0;
        end;

        // Alterado por FHBS - SOL: 136336 KTN: 815081
        PegaValoresDaSimulacao(cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                               cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime,
                               iIdOperMulta, fSimulaMulta,
                               iIdOperJuros, fSimulaJuros,
                               iIdOperCM,    fSimulaCM);

        // Efetua o calculo para cada registro de baixa...
        for iCiclo := 0 to Length(vCorrige)-1 do
        begin
          dDataInicio := dDataBaixa;
          // Define o data da baixa
          if not(cdsTemp.FieldByName('CODDOCUMENTO').IsNull) then
          begin
            if (iCiclo < cdsBaixa.RecordCount) then
            begin
              cdsBaixa.Recno := iCiclo + 1;
              if not cdsBaixa.Eof then
                dDataBaixa := cdsBaixa.FieldByName('DATABAIXA').AsDateTime;
            end
            else
              dDataBaixa := dLimite;
          end
          else
          begin
            if (iCiclo = 1) then
              dDataBaixa := dLimite;
          end;

          // Busca alteradores lançados anteriores a data da baixa
          if (iCiclo < Length(vCorrige)-1) then
            dDataAlter := dDataBaixa
          else
            dDataAlter := dDataBaixa + 1;

          if (cdsTemp.FieldByName('CODDOCUMENTO').IsNull) then
          begin
            fVlrAlter := 0;
          end
          else
          begin
            if ParamSistema.idModulo = 64 then
            begin
              sSql := 'SELECT LD.CODDOCUMENTO, '+#13+
                      '       SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1))  AS TOT_ALTERADOR '+#13+
                      '  FROM LANCTODOCUM LD, TIPOIMOVEL T,                 '+#13+
                      '       ( SELECT DISTINCT CODDOCUMENTO, CODTIPIMOVEL  '+#13+
                      '           FROM LANCAMENTOSIMOVEL                    '+#13+
                      '          WHERE CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString +  ' ) L '+#13+
                      ' WHERE LD.CODDOCUMENTO = L.CODDOCUMENTO '+#13+
                      '   AND L.CODTIPIMOVEL = T.CODTIPIMOVEL  '+#13+
                      '   AND RTRIM(LD.OPERACAO) = ''4''       '+#13+
                      '   AND LD.DEBCRE = ''D''                '+#13+
                      '   AND LD.ESTORNO IS NULL               '+#13+
                      '   AND NVL(LD.CODALTERADOR,0) <> NVL(T.CODALTMULTA,0)   '+#13+
                      '   AND NVL(LD.CODALTERADOR,0) <> NVL(T.CODALTJUROS,0)   '+#13+
                      '   AND NVL(LD.CODALTERADOR,0) <> NVL(T.CODALTCORRMON,0) '+#13+
                      '   AND LD.DATALANCTO < TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataAlter)) + ', ''DD/MM/YYYY'') ' +#13+
                      '   AND LD.CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString +#13+
                      ' GROUP BY LD.CODDOCUMENTO ';
            end
            else
            begin
              sSql := 'SELECT D2.CODDOCUMENTO,                             '+#13+
                      '       SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1))  AS TOT_ALTERADOR '+#13+
                      '  FROM LANCTODOCUM LD, DOCUMENTO D2, EMPRESAPROP E, '+#13+
                      '       ( SELECT DISTINCT                            '+#13+
                      '                CODDOCUMENTO, T.CODALTJRAL, T.CODALTMTAL, T.CODALTCMAL '+#13+
                      '           FROM PARCFINANCIMOV P2, CONDPAGIMOVEL CP2,                  '+#13+
                      '                CONTRATOXIMOVEL CX2, IMOVEL I2, TIPOIMOVEL T           '+#13+
                      '          WHERE P2.IDCONDPAGIMOVEL = CP2.IDCONDPAGIMOVEL               '+#13+
                      '            AND CP2.IDCONTRATOIMOVEL = CX2.IDCONTRATOIMOVEL            '+#13+
                      '            AND CX2.IDIMOVEL = I2.IDIMOVEL                             '+#13+
                      '            AND I2.CODTIPIMOVEL = T.CODTIPIMOVEL                       '+#13+
                      '       ) TC '+#13+
                      ' WHERE D2.CODDOCUMENTO = LD.CODDOCUMENTO '+#13+
                      '   AND RTRIM(LD.OPERACAO) = ''4''        '+#13+
                      '   AND LD.ESTORNO IS NULL                '+#13+
                      '   AND D2.CODDOCUMENTO = TC.CODDOCUMENTO '+#13+
                      '   AND D2.IDPESSOA     = E.IDPESSOA      '+#13+
                      '   AND NVL(LD.CODALTERADOR,0) <> NVL(TC.CODALTCMAL,0)  '+#13+
                      '   AND NVL(LD.CODALTERADOR,0) <> NVL(TC.CODALTJRAL,0)  '+#13+
                      '   AND NVL(LD.CODALTERADOR,0) <> NVL(TC.CODALTMTAL,0)  '+#13+
                      '   AND LD.DATALANCTO < TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataAlter)) + ', ''DD/MM/YYYY'') ' +#13+
                      '   AND LD.CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString +#13+
                      '   AND ( (E.TIPOCLIENTE <> 19991) OR     '+#13+
                      '         (LD.CODALTERADOR <> 215 AND LD.CODALTERADOR <> 216) ) '+#13+    // cpmf e valor pago a maior PO - funcef
                      ' GROUP BY D2.CODDOCUMENTO                ';
            end;
            cdsAlter.Data := GetDataPacket( sSql );
            fVlrAlter     := cdsAlter.FieldByName('TOT_ALTERADOR').AsFloat;
          end;

          // Define a data dae início do primeiro ciclo
          if iCiclo = 0 then
            dDataInicio := cdsTemp.FieldByName('DATAVENCIMENTO').AsDateTime;

          // Define valor devido e data final para o calculo do período'
          dDataCalc  := dDataBaixa;
          fVlrDevido := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('TOT_RECEBER').AsFloat +
                                                    fVlrAlter + fTotCiclo - fTotPago, 2);

          // Alienação - Para de calcular valores já conciliados
          if ParamSistema.idModulo = 135 then
          begin
            if (not cdsTemp.FieldByName('DTCONCILIA').IsNull) and
               (dDataBaixa >= cdsTemp.FieldByName('DTCONCILIA').AsDateTime) then
            begin
              fVlrDevido := 0;
            end;
          end;

          if fVlrDevido < 0 then bCalcMulta := False;

          // Define o registro da data de baixa - fim do período de apuração
          if iCiclo < Length(vCorrige)-1  then
            vCorrige[iCiclo].dBaixa := dDataBaixa
          else
            vCorrige[iCiclo].dBaixa := -1;

          if ParamSistema.idModulo = 135 then
            bApenasUltMes := CtrlModuloImobiliario.Alienacao.bApenasUltMesAnterior
          else
            bApenasUltMes := CtrlModuloImobiliario.AdminImob.bApenasUltMesAnterior;


          if ((dDataBaixa > dDataLimite) and (fVlrDevido > 0)) or (fVlrDevido < 0) then
          begin
            // Alterado por FHBS - SOL: 136336 KTN: 815081
            if ((cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime > 0) and
                (dSimulaUltBaixa > dDataLimite) and
                (dSimulaUltBaixa <= cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime) and
                (dDataBaixa <= cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime)) then
              vCorrige[iCiclo].fCM := fSimulaCM
            else // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081
              vCorrige[iCiclo].fCM := ComunsImobiliarioDB.CalcCM(fVlrDevido,
                                                                 fFMoedaCM,
                                                                 dDataInicio+1,
                                                                 dDataCalc,
                                                                 bApenasUltMes,
                                                                 iUsaMesAnterior);

            // Alterado por FHBS - SOL: 136336 KTN: 815081
            if ((cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime > 0) and
                (dSimulaUltBaixa > dDataLimite) and
                (dSimulaUltBaixa <= cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime) and
                (dDataBaixa <= cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime)) then
              vCorrige[iCiclo].fJuros := fSimulaJuros
            else // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081
            vCorrige[iCiclo].fJuros := ComunsImobiliarioDB.CalcJuros(fVlrDevido + vCorrige[iCiclo].fCM,
                                                                     fFValorJuros,
                                                                     fFPercentualJuros,
                                                                     fFMoedaJuros,
                                                                     fFPeriodoJuros,
                                                                     dDataInicio +1,
                                                                     dDataCalc,
                                                                     bJurosProporcional );

            // Calcula a Multa sobre o Valor Original + a Correção Monetária
            if bCalcMulta then
            begin
              // Alterado por FHBS - SOL: 136336 KTN: 815081
              if ((cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime > 0) and
                  (dSimulaUltBaixa > dDataLimite) and
                  (dSimulaUltBaixa <= cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime) and
                  (dDataBaixa <= cdsTemp.FieldByName('DATA_SIMULACAO').AsDateTime)) then
                vCorrige[iCiclo].fMulta := fSimulaMulta
              else // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081
                vCorrige[iCiclo].fMulta := ComunsImobiliarioDB.CalcMulta(cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                                                         fVlrDevido,
                                                                         vCorrige[iCiclo].fCM,
                                                                         fFValorMulta,
                                                                         fFPercentualMulta,
                                                                         fFMoedaMulta,
                                                                         dDataCalc,
                                                                         dDataCalc,
                                                                         dLimite);

              bCalcMulta := False;
            end;

            fTotCiclo := fTotCiclo + vCorrige[iCiclo].fCM + vCorrige[iCiclo].fJuros + vCorrige[iCiclo].fMulta;
            fTotCM    := fTotCM    + vCorrige[iCiclo].fCM;
            fTotJuros := fTotJuros + vCorrige[iCiclo].fJuros;
            fTotMulta := fTotMulta + vCorrige[iCiclo].fMulta;

          end;

          // define o valor pago até a baixa
          if iCiclo < Length(vCorrige)-1 then
          begin
            if cdsTemp.FieldByName('CODDOCUMENTO').IsNull then
            begin
              fTotPago := cdsTemp.FieldByName('TOT_RECEBIDO').AsFloat;
            end
            else
            begin
              cdsBaixa.Recno := iCiclo + 1;
              if not cdsBaixa.Eof then
              begin
                fTotPago := fTotPago + cdsBaixa.FieldByName('VALOR').AsFloat;
              end;
            end;
          end;
        end;

        // Grava valores calculados
        for iCiclo := 0 to Length(vCorrige)-1 do
        begin

          // Edilaine - SOL 170547-9382 / KTN 1654606
          if ParamSistema.idModulo = 64 then
          begin
            vDadosOperacao.DtLimite     := dLimite;
            vDadosOperacao.DtBaixa      := vCorrige[iCiclo].dBaixa;
            vDadosOperacao.IdContrato   := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            vDadosOperacao.CodDocumento := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
            vDadosOperacao.IdOpFinanc   := iIdParcAliena;
            vDadosOperacao.bSimulacao   := bSimula;
          end;
          // Edilaine - SOL 170547-9382 / KTN 1654606 - fim

          if ((vCorrige[iCiclo].dBaixa <> -1) or (vCorrige[iCiclo].fMulta <> 0) or
              (vCorrige[iCiclo].fJuros <>  0) or (vCorrige[iCiclo].fCM    <> 0)) or
             ((vCorrige[iCiclo].dBaixa = -1) and
              (((vCorrige[iCiclo].fMulta = 0) and (fTotMulta <> 0) ) or
               ((vCorrige[iCiclo].fJuros = 0) and (fTotJuros <> 0) ) or
               ((vCorrige[iCiclo].fCM    = 0) and (fTotCM    <> 0) )) ) then
          begin
            // Atualiza Multa
            if (cdsTemp.FieldByName('STATUS_DOC').AsInteger <> 2) or
               ((vCorrige[iCiclo].fMulta <> 0) and (cdsTemp.FieldByName('FLGLANCINTEGRA').AsInteger = 7)) or
               (LancaParcial(iIdOperMulta, cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                             cdsTemp.FieldByName('CODTIPIMOVEL').AsString, dDataLimite, fTotMulta)) then
            begin
              // Edilaine - SOL 170547-9382 / KTN 1654606
              if ParamSistema.idModulo = 64 then
              begin
                vDadosOperacao.IdOperador   := iIdOperMulta;
                vDadosOperacao.vlrValor     := vCorrige[iCiclo].fMulta;
                vDadosOperacao.vlrAcum      := fTotMulta;

                if not LancaDadosOperacaoImob( vDadosOperacao ) then
                  raise Exception.Create(MessageInfo);
              end
              else
              begin
                if not GravaLancOperDiaImob(dLimite, vCorrige[iCiclo].dBaixa,
                                            iIdOperMulta, 0,
                                            vCorrige[iCiclo].fMulta,
                                            fTotMulta,
                                            cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                            cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1,
                                            cdsTemp.FieldByName('CODDOCUMENTO').AsInteger, True,
                                            iIdParcAliena, -1, bSimula) then
                  raise exception.Create( MessageInfo );
              end;  // Edilaine - SOL 170547-9382 / KTN 1654606 - fim
            end;

            // Atualiza Juros
            if (cdsTemp.FieldByName('STATUS_DOC').AsInteger <> 2) or
               ((vCorrige[iCiclo].fJuros <> 0) and (cdsTemp.FieldByName('FLGLANCINTEGRA').AsInteger = 7)) or
               (LancaParcial(iIdOperJuros, cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                             cdsTemp.FieldByName('CODTIPIMOVEL').AsString, dDataLimite, fTotJuros)) then
            begin
              // Edilaine - SOL 170547-9382 / KTN 1654606
              if ParamSistema.idModulo = 64 then
              begin
                vDadosOperacao.IdOperador   := iIdOperJuros;
                vDadosOperacao.vlrValor     := vCorrige[iCiclo].fJuros;
                vDadosOperacao.vlrAcum      := fTotJuros;

                if not LancaDadosOperacaoImob( vDadosOperacao ) then
                  raise Exception.Create(MessageInfo);
              end
              else
              begin
                if not GravaLancOperDiaImob(dLimite, vCorrige[iCiclo].dBaixa,
                                            iIdOperJuros, 0,
                                            vCorrige[iCiclo].fJuros,
                                            fTotJuros,
                                            cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                            cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1,
                                            cdsTemp.FieldByName('CODDOCUMENTO').AsInteger, True,
                                            iIdParcAliena, -1, bSimula) then
                  raise exception.Create( MessageInfo );
              end; // Edilaine - SOL 170547-9382 / KTN 1654606 - fim
            end;

            // Atualiza Correção
            if (cdsTemp.FieldByName('STATUS_DOC').AsInteger <> 2) or
               ((vCorrige[iCiclo].fCM <> 0) and (cdsTemp.FieldByName('FLGLANCINTEGRA').AsInteger = 7)) or
               (LancaParcial(iIdOperCM, cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                             cdsTemp.FieldByName('CODTIPIMOVEL').AsString, dDataLimite, fTotCM)) then
            begin
              // Edilaine - SOL 170547-9382 / KTN 1654606
              if ParamSistema.idModulo = 64 then
              begin
                vDadosOperacao.IdOperador   := iIdOperCM;
                vDadosOperacao.vlrValor     := vCorrige[iCiclo].fCM;
                vDadosOperacao.vlrAcum      := fTotCM;

                if not LancaDadosOperacaoImob( vDadosOperacao ) then
                  raise Exception.Create(MessageInfo);
              end
              else
              begin
                if not GravaLancOperDiaImob(dLimite, vCorrige[iCiclo].dBaixa,
                                            iIdOperCM, 0,
                                            vCorrige[iCiclo].fCM,
                                            fTotCM,
                                            cdsTemp.FieldByName('CODTIPIMOVEL').AsString,
                                            cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1,
                                            cdsTemp.FieldByName('CODDOCUMENTO').AsInteger, True,
                                            iIdParcAliena, -1, bSimula) then
                  raise exception.Create( MessageInfo );
              end; // Edilaine - SOL 170547-9382 / KTN 1654606 - fim
            end;
          end;
        end;

        // o último parâmetro será utilizado para passar a mensagem do processamento
        Inc(iAtual);

        DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

        if bGeraLog then
          writeLn(ArqLog, 'Doc: ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString + ': ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

        //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016  
        iRegCommit := iRegCommit + 1;
        if iRegCommit = 50 then
        begin
           if InTransaction then
              Commit;
           iRegCommit := 0;              
        end;          

        cdsTemp.Next;
      end;
    except
      on e : Exception do
      begin
        Result := False;
        MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
    FreeAndNil( cdsBaixa );
    //FreeAndNil( cdsAlter ); // Alterado por FHBS - SOL: 136336 KTN: 815081 (Tirar-para-Performance-69495/69496)

    if FileExists(sNomeBilhete) then
      DeleteFile(PCHAR(sNomeBilhete)) // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640;
  end;
end;

function TCtrlOperImob.LancaParcial(const iIdOper,Coddocumento: Integer; const sTipoImovel:String;
                                    const dDataLimite:TDateTime; const fVlrTotal:Extended): Boolean;
var cdsTemp : TCMClientDataSet;
    sSql : String;
begin
   Result := False;
   try
      try
         cdsTemp := TCMClientDataSet.Create( nil );
         if ParamSistema.idModulo = 64 then begin
         
            if ((dDataLimite >= StrToDate('01/01/2006')) and (iTipoCliente = 19991)) or
                (iTipoCliente <> 19991)  then begin
               sSql := 'SELECT NVL(SUM(L.VLRDIA),0) AS TOTAL ' +#13+
                       '  FROM LANCOPERDIAIMOB L ' +#13+
                       ' WHERE L.CODDOCUMENTO = ' + IntToStr(Coddocumento) +#13+
                       '   AND (L.FLGTIPO IS NULL OR L.FLGTIPO <> ''S'') AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel) +#13+
                       '   AND L.IDOPERACAO   = ' + IntToStr(iIdOper);
               cdsTemp.Data := GetDataPacket(sSql);

               // Alterado por FHBS - SOL: 136336 KTN: 815081 - Para arrumar os erros de arredondamento
               //Result := (cdsTemp.FieldByName('TOTAL').AsFloat <> fVlrTotal);
               Result := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('TOTAL').AsFloat,2) <>
                         ComunsImobiliario.Arredonda(fVlrTotal,2);
            end;
         end;

         if ParamSistema.idModulo = 135 then begin

            Result := False;
            sSql := 'SELECT NVL(SUM(L.VLRDIA),0) AS TOTAL ' +#13+
                    '  FROM LANCOPERDIAIMOB L ' +#13+
                    ' WHERE L.CODDOCUMENTO = ' + IntToStr(Coddocumento) +#13+
                    '  AND (L.FLGTIPO IS NULL OR L.FLGTIPO <> ''S'') AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel) +#13+
                    '   AND L.IDOPERACAO   = ' + IntToStr(iIdOper);
            cdsTemp.Data := GetDataPacket(sSql);

            // Alterado por FHBS - SOL: 136336 KTN: 815081 - Para arrumar os erros de arredondamento
            // e retornar True se for diferente
            //if ( (cdsTemp.FieldByName('TOTAL').IsNull) or (cdsTemp.FieldByName('TOTAL').AsFloat = 0) ) and (fVlrTotal <> 0) then
            //  Result := (cdsTemp.FieldByName('TOTAL').AsFloat <> fVlrTotal);
            Result := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('TOTAL').AsFloat,2) <>
                      ComunsImobiliario.Arredonda(fVlrTotal,2);
         end;

      except
         on e : Exception do begin
            Result := False;
            MessageInfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;




function TCtrlOperImob.AjustesDiversos(const dLimite: TDateTime): Boolean;
var sSql, sDtLimite : String;
    cdsTemp : TCMClientDataSet;
begin
  Result := True;
  cdsTemp  := TCMClientDataSet.Create( nil );
  try
    try
      // Ajuste do contrato 000222 (Parcela 23/60)
      if ParamSistema.IdModulo = 135 then
      begin
        if FormatDateTime('dd/mm/yyyy',dLimite) = '09/08/2006' then
        begin
          cdsTemp.Data := LookupPlanosxContrato(3053);
          if cdsTemp.RecordCount >= 1 then
          begin
            while not cdsTemp.Eof do
            begin
              dbLancOperDiaImob.Clear;
              dbLancOperDiaImob.Idmodulo.AsInteger         := 135;
              dbLancOperDiaImob.IdContratoImovel.AsInteger := 2053;
              dbLancOperDiaImob.Codtipimovel.AsString      := 'TERR';
              dbLancOperDiaImob.Idoperacao.AsInteger       := 150;
              dbLancOperDiaImob.Dataoper.AsDateTime        := dLimite;
              dbLancOperDiaImob.Vlrdia.AsFloat             := 616;
              dbLancOperDiaImob.IDParcFinancImov.AsInteger := 34293;
              dbLancOperDiaImob.Vlracum.AsFloat            := 0;
              dbLancOperDiaImob.FlgTipo.AsString           := 'A';
              dbLancOperDiaImob.IdPatro.AsInteger          := cdsTemp.FieldByName('IDPATRO').AsInteger;
              dbLancOperDiaImob.IdPlanoPrev.AsInteger      := cdsTemp.FieldByName('IDPLANOPREV').AsInteger;

              if not dbLancOperDiaImob.Insert then
                raise Exception.Create( dbLancOperDiaImob.MessageInfo );
              cdsTemp.Next;
            end;
          end
          else
          begin
            dbLancOperDiaImob.Clear;
            dbLancOperDiaImob.Idmodulo.AsInteger         := 135;
            dbLancOperDiaImob.IdContratoImovel.AsInteger := 2053;
            dbLancOperDiaImob.Codtipimovel.AsString      := 'TERR';
            dbLancOperDiaImob.Idoperacao.AsInteger       := 150;
            dbLancOperDiaImob.Dataoper.AsDateTime        := dLimite;
            dbLancOperDiaImob.Vlrdia.AsFloat             := 616;
            dbLancOperDiaImob.IDParcFinancImov.AsInteger := 34293;
            dbLancOperDiaImob.Vlracum.AsFloat            := 0;
            dbLancOperDiaImob.FlgTipo.AsString           := 'A';
            dbLancOperDiaImob.IdPatro.AsInteger          := 994886;
            dbLancOperDiaImob.IdPlanoPrev.AsInteger      := 29;

            if not dbLancOperDiaImob.Insert then
                raise Exception.Create( dbLancOperDiaImob.MessageInfo );
          end;
        end;
      end;
    except
      on e : Exception do
      begin
        Result := False;
        MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;


function TCtrlOperImob.AjustesDiversosII(const dLimite: TDateTime): Boolean;
var sSql, sDtLimite : String;
    cdsTemp : TCMClientDataSet;
begin
   Result := True;
   try
      try
         cdsTemp  := TCMClientDataSet.Create( nil );

         if ParamSistema.IdModulo = 135 then begin
            if DateToStr(dLimite) = '31/01/2006' then begin
               sDtLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')';
               // Reverte provisão de atu. residuo - contrato '000193'
               sSql := 'SELECT IDOPERACAO, IDCONTRATOIMOVEL, CODTIPIMOVEL, ' +#13+
                       '       SUM(VLRDIA) AS TOTAL     ' +#13+
                       '  FROM LANCOPERDIAIMOB          ' +#13+
                       ' WHERE IDMODULO = 135           ' +#13+
                       '   AND IDCONTRATOIMOVEL = 1940  ' +#13+
                       '   AND CODDOCUMENTO IS NULL AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')    ' +#13+
                       '   AND IDPARCFINANCIMOV IS NULL ' +#13+
                       '   AND IDOPERACAO = 166         ' +#13+
                       ' GROUP BY IDOPERACAO, IDCONTRATOIMOVEL, CODTIPIMOVEL ';
               cdsTemp.Data := GetDataPacket( sSql );
               while not cdsTemp.Eof do begin

                  dbLancOperDiaImob.Clear;
                  dbLancOperDiaImob.Idmodulo.AsInteger         := ParamSistema.idModulo;
                  dbLancOperDiaImob.IdContratoImovel.AsInteger := cdsTemp.FieldByName('IDCONTRATOIMOVEL').asInteger;
                  dbLancOperDiaImob.Codtipimovel.AsString      := cdsTemp.FieldByName('CODTIPIMOVEL').asString;
                  dbLancOperDiaImob.Idoperacao.AsInteger       := cdsTemp.FieldByName('IDOPERACAO').asInteger;
                  dbLancOperDiaImob.Dataoper.AsDateTime        := dLimite;
                  dbLancOperDiaImob.Vlrdia.AsFloat             := (cdsTemp.FieldByName('TOTAL').asFloat * -1);
                  dbLancOperDiaImob.Vlracum.AsFloat            := 0;

                  if not dbLancOperDiaImob.Insert then
                     raise Exception.Create( dbLancOperDiaImob.MessageInfo );

                  cdsTemp.Next;
               end;
            end;
         end;
      except
         on e : Exception do begin
            Result := False;
            MessageInfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;




function TCtrlOperImob.AjustaDocsQuitados(sNomeBilhete: string;
                                          const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                          const dLimite: TDateTime): Boolean;
var cdsDocs, cdsTemp : TCMClientDataSet;
    sSql, sParam, sParam1, sParam2 : String;
    iAtual, iQuant, iDocumentoAux, iIdParcFinancImov : Integer;
    fVlrDiferenca : Extended;
begin
   Result := True;
   try
      // Define Parâmetros
      sParam1 := '     DATAOPER <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')' +#13+
                 ' AND IDMODULO = ' + IntToStr(ParamSistema.idModulo) +#13+
                 ' AND ( IDOPERACAO = ' + IntToStr(iIdOperMulta) + ' OR '+#13+
                 '       IDOPERACAO = ' + IntToStr(iIdOperJuros) + ' OR '+#13+
                 '       IDOPERACAO = ' + IntToStr(iIdOperCM)    + ' ) ';

      sParam2 := ' AND L.DATAOPER <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')' +#13+
                 ' AND L.IDMODULO = ' + IntToStr(ParamSistema.idModulo) +#13+
                 ' AND ( L.IDOPERACAO = ' + IntToStr(iIdOperMulta) + ' OR '+#13+
                 '       L.IDOPERACAO = ' + IntToStr(iIdOperJuros) + ' OR '+#13+
                 '       L.IDOPERACAO = ' + IntToStr(iIdOperCM)    + ' ) ';

      // Busca os documentos calculados até o dia anterior e que foram liquidados,
      // agrupados pelo alteradores cadastrados nos parametros de Tipo de Imovel
      if ParamSistema.IdModulo = 64 then begin
         sSql := 'SELECT L.CODDOCUMENTO, L.IDPARCFINANCIMOV, L.CODTIPIMOVEL, L.IDCONTRATOIMOVEL, '+#13+
                 '       DECODE(L.IDOPERACAO, ' + IntToStr(iIdOperMulta) + ', T.CODALTMULTA, '+#13+
                                                  IntToStr(iIdOperJuros) + ', T.CODALTJUROS, '+#13+
                                                  IntToStr(iIdOperCM)    + ', T.CODALTCORRMON ) AS CODALTLANC, '+#13+
                 '       MIN(L.IDOPERACAO) AS IDOPERACAO, '+#13+
                 '       SUM(VLRACUM)      AS VLRACUM     '+#13+
                 '  FROM LANCOPERDIAIMOB L, TIPOIMOVEL T, '+#13+
                 '       DOCUMENTO D,       '+#13+
                 '       (     '+#13+
                 '        SELECT MAX(DATAOPER) AS FECHANT '+#13+
                 '          FROM LANCOPERDIAIMOB          '+#13+
                 '         WHERE ' + sParam1 +#13+
                 '       ) ULT, '+#13+
                 '      ( SELECT CODDOCUMENTO, MAX(DATABAIXA) AS ULTBAIXA '+#13+
                 '          FROM RECBTOPAGTO '+#13+
                 '         WHERE DATABAIXA < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')' +#13+
                 '           AND NUMLANCTO IN( SELECT NUMLANCTO               '+#13+
                 '                               FROM LANCTODOCUM             '+#13+
                 '                              WHERE RTRIM(OPERACAO) = ''5'' '+#13+
                 '                                AND ESTORNO IS NULL )       '+#13+
                 '         GROUP BY CODDOCUMENTO '+#13+
                 '       ) ULTBAIXA              '+#13+
                 ' WHERE L.DATAOPER  = ULT.FECHANT       '+#13+
                 '   AND L.CODDOCUMENTO = D.CODDOCUMENTO '+#13+
                 '   AND L.CODTIPIMOVEL = T.CODTIPIMOVEL AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'+#13+
                 '   AND L.CODDOCUMENTO = ULTBAIXA.CODDOCUMENTO '+#13+    // sParam2 +#13+
                 '   AND LTRIM(D.STATUS) = ''2'' '+#13+ sParam2 +#13+
                 ' GROUP BY L.CODDOCUMENTO, L.IDPARCFINANCIMOV, L.CODTIPIMOVEL, L.IDCONTRATOIMOVEL, '+#13+
                 '       DECODE(L.IDOPERACAO, ' + IntToStr(iIdOperMulta) + ', T.CODALTMULTA,        '+#13+
                                                  IntToStr(iIdOperJuros) + ', T.CODALTJUROS,        '+#13+
                                                  IntToStr(iIdOperCM)    + ', T.CODALTCORRMON )';
      end else begin
         sSql := 'SELECT L.CODDOCUMENTO, L.IDPARCFINANCIMOV, L.CODTIPIMOVEL, L.IDCONTRATOIMOVEL, '+#13+
                 '       DECODE(L.IDOPERACAO, ' + IntToStr(iIdOperMulta) + ', T.CODALTMTAL,      '+#13+
                                                  IntToStr(iIdOperJuros) + ', T.CODALTJRAL,      '+#13+
                                                  IntToStr(iIdOperCM)    + ', T.CODALTCMAL ) AS CODALTLANC, '+#13+
                 '       MIN(L.IDOPERACAO) AS IDOPERACAO, '+#13+
                 '       SUM(VLRACUM)      AS VLRACUM     '+#13+
                 '  FROM LANCOPERDIAIMOB L, TIPOIMOVEL T, DOCUMENTO D, PARCFINANCIMOV P, '+#13+
                 '       (     '+#13+
                 '        SELECT MAX(DATAOPER) AS FECHANT   '+#13+
                 '          FROM LANCOPERDIAIMOB            '+#13+
                 '         WHERE ' + sParam1 +#13+
                 '       ) ULT '+#13+
                 ' WHERE L.DATAOPER  = ULT.FECHANT          '+#13+
                 '   AND L.CODDOCUMENTO = D.CODDOCUMENTO    '+#13+
                 '   AND L.CODTIPIMOVEL = T.CODTIPIMOVEL AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')   '+#13+
                 '   AND D.CODDOCUMENTO = P.CODDOCUMENTO(+) '+#13+
                 '   AND ( (P.CODDOCUMENTO IS NULL) OR      '+#13+
                 '         (P.CODDOCUMENTO IS NOT NULL AND  '+#13+
                 '          L.IDPARCFINANCIMOV = P.IDPARCFINANCIMOV) ) '+#13+
                 '   AND LTRIM(D.STATUS) = ''2'' '+#13+ sParam2 +#13+
                 ' GROUP BY L.CODDOCUMENTO, L.IDPARCFINANCIMOV, L.CODTIPIMOVEL, L.IDCONTRATOIMOVEL, '+#13+
                 '       DECODE(L.IDOPERACAO, ' + IntToStr(iIdOperMulta) + ', T.CODALTMTAL, '+#13+
                                                  IntToStr(iIdOperJuros) + ', T.CODALTJRAL, '+#13+
                                                  IntToStr(iIdOperCM)    + ', T.CODALTCMAL )';
      end;

      cdsDocs := TCMClientDataSet.Create( nil );
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsDocs.Data := GetDataPacket( sSql );
      if bGeraLog then writeLn(ArqLog, 'BuscaQuery: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

      // força um do progresso para montar a tela
      iAtual := 1;
      iQuant := cdsDocs.RecordCount;
      DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dLimite) + ' - Ajustando Documentos Liquidados...']);

      // Efetua a verificação da necessidade de ajuste para cada documento liquidado
      // na apuração anterior
      while not cdsDocs.Eof do begin
         iDocumentoAux := cdsDocs.FieldByName('CODDOCUMENTO').AsInteger;

         if iCodDocumentoAjuste > 0 then begin
            if (cdsDocs.FieldByName('CODDOCUMENTO').AsInteger <> iCodDocumentoAjuste) then begin
               cdsDocs.Next;
               Continue;
            end;
         end;

         while (cdsDocs.FieldByName('CODDOCUMENTO').AsInteger = iDocumentoAux) and
               (not cdsDocs.Eof) do begin

            sSql := 'SELECT ULT.ULTBAIXA , SUM(VALOR) AS VLRDOC '+#13+
                    '  FROM LANCTODOCUM,                        '+#13+
                    '       ( SELECT MAX(DATABAIXA) AS ULTBAIXA '+#13+
                    '           FROM RECBTOPAGTO                '+#13+
                    '          WHERE CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                    '            AND DATABAIXA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dLimite)) + ', ''DD/MM/YYYY'') ' +#13+
                    '            AND NUMLANCTO IN( SELECT NUMLANCTO               '+#13+
                    '                                FROM LANCTODOCUM             '+#13+
                    '                               WHERE RTRIM(OPERACAO) = ''5'' '+#13+
                    '                                 AND ESTORNO IS NULL         '+#13+
                    '                                 AND CODDOCUMENTO =  ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString + ' )'+#13+
                    ' ) ULT '+#13+
                    ' WHERE CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                    '   AND CODALTERADOR = ' + cdsDocs.FieldByName('CODALTLANC').AsString   +#13+
                    '   AND ESTORNO IS NULL ' +#13+
                    ' GROUP BY ULT.ULTBAIXA ';
            cdsTemp.Data := GetDataPacket( sSql );

            // Se existir diferença dos alteradores lançados, efetua lançamento
            // em LANCOPERDIAIMOB pelo valor existente no alterador.
            fVlrDiferenca := ComunsImobiliario.Arredonda(cdsTemp.FieldByName('VLRDOC').AsFloat - cdsDocs.FieldByName('VLRACUM').AsFloat, 2);

            if (fVlrDiferenca <> 0) and (not cdsTemp.FieldByName('ULTBAIXA').IsNull) then begin

               if ParamSistema.idModulo = 135 then
                    iIdParcFinancImov := cdsDocs.FieldByName('IDPARCFINANCIMOV').AsInteger
               else iIdParcFinancImov := -1;

               if not GravaLancOperDiaImob(dLimite, cdsTemp.FieldByName('ULTBAIXA').AsDateTime,
                                           cdsDocs.FieldByName('IDOPERACAO').AsInteger,
                                           fVlrDiferenca,
                                           cdsTemp.FieldByName('VLRDOC').AsFloat,
                                           cdsTemp.FieldByName('VLRDOC').AsFloat,
                                           cdsDocs.FieldByName('CODTIPIMOVEL').AsString,
                                           cdsDocs.FieldByName('IDCONTRATOIMOVEL').AsInteger, -1,
                                           cdsDocs.FieldByName('CODDOCUMENTO').AsInteger, True,
                                           iIdParcFinancImov ) then
                  raise exception.Create( MessageInfo );
            end;
            if bGeraLog then writeLn(ArqLog, 'Doc: ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString + ': ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
            cdsDocs.Next;

            // incrementa a barra de progresso
            Inc (iAtual);
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
      FreeAndNil( cdsDocs );
   end;
end;


// Edilaine - SOL 170547-9382 / KTN 1654606
function TCtrlOperImob.GetRateioSegmento(iCodDocumento : integer) : OleVariant;
var
  sSQL: string;
begin
  {há contratos que possuem mais de um segmento e nesse caso é preciso fazer a
   proporcionalidade de acordo com a participação do segmento na apropriação do
   documento. Partindo do rateio efetuado por imóvel na geração do documento,
   faz o somatório por segmento e cálcula o percentual sobre o valor do doc }

  sSQL := 'select lv.codtipimovel, lv.vlrseg, (lv.vlrseg / lv.valor) as percseg '+
          '  from  '+
          '   (select li.codtipimovel, sum(li.vlrlancreceb) as vlrseg, ld.valor '+
          '      from lancamentosimovel li, lanctodocum ld '+
          '     where li.coddocumento = '+IntToStr(iCodDocumento)+
          '       and li.coddocumento = ld.coddocumento '+
          '       and ld.operacao = 2 '+
          '    group by li.codtipimovel, ld.valor '+
          '   ) lv';

  Result := GetDataPacket (sSql);
end;
// Edilaine - SOL 170547-9382 / KTN 1654606 - fim

// Edilaine - SOL 170547-9382 / KTN 1654606
function TCtrlOperImob.LancaDadosOperacaoImob(vDados : TDadosOper) : boolean;
var
  cdsSeg     : TCmClientDataSet;
  vlrRateio  : Extended;
  vlrAcumRat : Extended;
begin
  {há contratos que possuem mais de um segmento e nesse caso é preciso fazer a
   proporcionalidade de acordo com a participação do segmento na apropriação do
   documento. Feito o 'rateio' pelo segmento, faz a segregação por Planos}

  Result := true;
  try
    try
      cdsSeg := TCMClientDataSet.Create( nil );

      cdsSeg.Data := GetRateioSegmento(vDados.CodDocumento);
      while not cdsSeg.eof do
      begin
        // calculando o rateio por Segmento
        vlrRateio  := vDados.vlrValor * cdsSeg.FieldByName('PERCSEG').Asfloat;
        vlrAcumRat := vDados.vlrAcum * cdsSeg.FieldByName('PERCSEG').Asfloat;

        if not GravaLancOperDiaImob(vDados.DtLimite,      // dLimite
                                    vDados.DtBaixa,       // -1
                                    vDados.IdOperador,    // iIdOperMulta
                                    0,
                                    vlrRateio,            // fMulta
                                    vlrAcumRat,           // fMulta
                                    cdsSeg.FieldByName('CODTIPIMOVEL').AsString,
                                    vDados.IdContrato,    // iIDContratoImovel
                                    -1,
                                    vDados.CodDocumento,  // cdsTemp.FieldByName('CODDOCUMENTO').AsInteger,
                                    True,
                                    vDados.IdOpFinanc,    // iIdParcFinancImov
                                    -1,
                                    vDados.bSimulacao,    // bSimula
                                   ) then
          raise Exception.Create(MessageInfo);

        cdsSeg.next;
      end;
    except
      on E:Exception do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( cdsSeg );
  end;

end;
// Edilaine - SOL 170547-9382 / KTN 1654606 - fim


function TCtrlOperImob.GravaLancOperDiaImob(const dDataLancto    : TDateTime;
                                            const dDataBaixa     : TDateTime;
                                            const iIdOper        : Integer;
                                            const fVlrDia        : Extended;
                                            const fVlrAcum       : Extended;
                                            const fVlrTotAcum    : Extended;
                                            const sTipoImovel    : String;
                                            const iIdContrato    : Integer;
                                            const iIdForCli      : Integer;
                                            const iCodDocum      : Integer;
                                            const bGravaDiaNull  : Boolean = True;
                                            const IDParcela      : Integer = -1;
                                            const iIdCondPag     : Integer = -1;
                                            const bSimula        : Boolean = False): Boolean;
var
   fVlrLancDia : Currency;
   fVlrAcumAnt : Currency;
   fVlrReverte : Extended;
   cdsTemp     : TCMClientDataSet;
   bRegInicial : Boolean;
   cdsPlanoPatro : TCmClientDataSet;
   VlrSegAcum, VltSegTotAcum : Currency;
begin
  Result := True;

  cdsTemp := TCMClientDataSet.Create( nil );
  cdsPlanoPatro := TCMClientDataSet.Create(nil);
  VlrSegAcum := 0;
  VltSegTotAcum := 0;
  try
    try
    // Eraldo Silva SOL 146052 KINTANA 1017172
     // Efetuar a segragacao dos documentos que não estao associados a contratos que devem tambem ser provisionados para perdas.
    if iIdContrato > 0 then
    begin
        cdsPlanoPatro.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(iIdContrato);
    end
    else
    if (iCodDocum > 0) then
    begin
         cdsPlanoPatro.Data := ComunsImobiliarioDB.RetornaRateioPlanoxDocsContrato(iCodDocum);
    end;
    //if cdsEncargos.FieldByName('IDCONTRATOIMOVEL').AsInteger <> 0 then
      //cdsPlanoPatro.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(iIdContrato);
    // Eraldo Silva SOL 146052 KINTANA 1017172

      if cdsPlanoPatro.RecordCount >= 1 then
      begin
        //while not cdsPlanoPatro.Eof do
        //begin
          // Calcula o Valor do dia, apenas se o mesmo não for informado nos parametros da função
          // o ajuste de documentos quitados já terá a diferença estipulada agrupada pelo CODALTERADOR,
          // e não IDOPERAÇÃO, pois este não existe na tabela lanctodocum
          if fVlrDia = 0 then
          begin
            // Calcula a variação diária entre a ultima apuração e a atual
            if (dDataBaixa > 0) then
            begin
              if (dDataBaixa = dDataLancto) then
              begin
                fVlrAcumAnt := AcumuladoUltimaProvisao(iIdOper, dDataLancto, -1,
                                                       sTipoImovel, iIdContrato, iIdForCli, iCodDocum, IDParcela,
                                                       bRegInicial);
                fVlrLancDia := fVlrAcum;
              end
              else
              begin
                fVlrAcumAnt := AcumuladoUltimaProvisao(iIdOper, dDataLancto, dDataBaixa,
                                                       sTipoImovel, iIdContrato, iIdForCli, iCodDocum, IDParcela,
                                                       bRegInicial);
                if fVlrAcumAnt = 0 then
                  fVlrLancDia := fVlrAcum
                else
                  fVlrLancDia := 0;
              end;
            end
            else
            begin
              // Verifica o valor acumulado no ultimo provisionamento
              fVlrAcumAnt := AcumuladoUltimaProvisao(iIdOper, dDataLancto, dDataBaixa,
                                                     sTipoImovel, iIdContrato, iIdForCli, iCodDocum, IDParcela,
                                                     bRegInicial);
              if (fVlrAcumAnt = 0) and (bRegInicial = True) then
              begin
                fVlrLancDia := fVlrAcum
              end
              else
              begin
                if (fVlrAcum <> fVlrTotAcum) and ((iCodDocum > 0) or (IDParcela > 0)) then
                begin
                  if ReverteBaixaParcial(iIdOper, iCodDocum, IDParcela, sTipoImovel, dDataLancto, fVlrTotAcum, fVlrReverte ) then
                    fVlrLancDia := ComunsImobiliario.Arredonda(fVlrReverte, 2)
                  else
                  begin
                    fVlrLancDia := ComunsImobiliario.Arredonda(fVlrTotAcum - fVlrAcumAnt, 2);
                  end;
              end
              else
              begin
                fVlrLancDia := ComunsImobiliario.Arredonda(fVlrTotAcum - fVlrAcumAnt, 2);
              end;
            end;
          end;

          // Verifica reversão TOTAL de valores
          if ((fVlrTotAcum = 0) and (fVlrAcum = 0)) then
          begin
            fVlrAcumAnt := AcumuladoUltimaProvisao(iIdOper, dDataLancto, -1,
                                                   sTipoImovel, iIdContrato, iIdForCli, iCodDocum, IDParcela, bRegInicial);
            fVlrLancDia := ComunsImobiliario.Arredonda(fVlrTotAcum - fVlrAcumAnt, 2);
          end;
        end
        else
          fVlrLancDia := fVlrDia;

        if ((bGravaDiaNull)     and ((fVlrLancDia <> 0) or (fVlrAcum <> 0))) or
          ((not bGravaDiaNull) and (fVlrLancDia <> 0)) then
        begin
          while not cdsPlanoPatro.Eof do
          begin
            // Verifica se já existe registro para o dia calculado, se existir, faz update
            cdsTemp.Data := LookupLancOperDiaImob(iIdOper, dDataLancto, dDataBaixa,
                                                  sTipoImovel, iIdContrato, iIdForCli, iCodDocum, IDParcela,
                                                  cdsPlanoPatro.FieldByName('IDPLANOPREV').asInteger,
                                                  cdsPlanoPatro.FieldByName('IDPATRO').asInteger);

            if not cdsTemp.IsEmpty then
            begin
              dbLancOperDiaImob.Idlancoperdiaimob.AsInteger := cdsTemp.FieldByName('IDLANCOPERDIAIMOB').AsInteger;
              dbLancOperDiaImob.LoadFromDb;
            end
            else
              dbLancOperDiaImob.Clear;

            dbLancOperDiaImob.Idmodulo.AsInteger     := ParamSistema.idModulo;
            dbLancOperDiaImob.Codtipimovel.AsString  := sTipoImovel;
            dbLancOperDiaImob.Idoperacao.AsInteger   := iIdOper;
            dbLancOperDiaImob.Dataoper.AsDateTime    := dDataLancto;

            if cdsPlanoPatro.RecNo = cdsPlanoPatro.RecordCount then
            begin
              // Alterado por FHBS - SOL: 136336 KTN: 815081
              //dbLancOperDiaImob.Vlrdia.AsFloat         := fVlrLancDia - VlrSegAcum;
              //dbLancOperDiaImob.Vlracum.AsFloat        := fVlrAcum - VltSegTotAcum;
              dbLancOperDiaImob.Vlrdia.AsFloat         := RoundCM(fVlrLancDia - VlrSegAcum, 2);
              dbLancOperDiaImob.Vlracum.AsFloat        := RoundCM(fVlrAcum - VltSegTotAcum, 2);
            end
            else
            begin
              dbLancOperDiaImob.Vlrdia.AsFloat :=  RoundCM((fVlrLancDia * cdsPlanoPatro.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
              //if Abs(dbLancOperDiaImob.Vlrdia.AsFloat) < 0.005 then
              //  dbLancOperDiaImob.Vlrdia.AsFloat := 0
              //else
                //dbLancOperDiaImob.Vlrdia.AsFloat := RoundCM(dbLancOperDiaImob.Vlrdia.AsFloat,2);
                //dbLancOperDiaImob.Vlrdia.AsFloat := ComunsImobiliario.ConvNumSegregacao(dbLancOperDiaImob.Vlrdia.AsFloat);


              VlrSegAcum := VlrSegAcum + dbLancOperDiaImob.Vlrdia.AsFloat;

              dbLancOperDiaImob.Vlracum.AsFloat := RoundCM((fVlrAcum * cdsPlanoPatro.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
              //if Abs(dbLancOperDiaImob.Vlracum.AsFloat) < 0.005 then
              //  dbLancOperDiaImob.Vlracum.AsFloat := 0
              //else
                //dbLancOperDiaImob.Vlracum.AsFloat := RoundCM(dbLancOperDiaImob.Vlracum.AsFloat,2);
                //dbLancOperDiaImob.Vlracum.AsFloat := ComunsImobiliario.ConvNumSegregacao(dbLancOperDiaImob.Vlracum.AsFloat);

              VltSegTotAcum := VltSegTotAcum + dbLancOperDiaImob.Vlracum.AsFloat;
            end;

            if dDataBaixa > 0 then
              dbLancOperDiaImob.DataBaixa.AsDateTime := dDataBaixa;

            if iCodDocum > 0 then
              dbLancOperDiaImob.Coddocumento.AsInteger := iCodDocum;

            if iIdContrato > 0 then
              dbLancOperDiaImob.IdContratoImovel.AsInteger := iIdContrato;

            if iIdForCli > 0 then
              dbLancOperDiaImob.IdForCli.AsInteger         := iIdForCli;

            if IDParcela > 0 then
              dbLancOperDiaImob.IDParcFinancImov.AsInteger := IDParcela;

            if iIdCondPag > 0 then
              dbLancOperDiaImob.IDCONDPAGIMOVEL.AsInteger := iIdCondPag;

            if bSimula then
              dbLancOperDiaImob.FlgTipo.AsString := 'S';
              
            FIDLancOperDiaImob := -1;
            dbLancOperDiaImob.IDPATRO.AsInteger     := cdsPlanoPatro.FieldByName('IDPATRO').AsInteger;
            dbLancOperDiaImob.IDPLANOPREV.AsInteger := cdsPlanoPatro.FieldByName('IDPLANOPREV').AsInteger;

            if cdsTemp.IsEmpty then
            begin
              if not dbLancOperDiaImob.Insert then
                raise Exception.Create( dbLancOperDiaImob.MessageInfo );
              FIDLancOperDiaImob := dbLancOperDiaImob.Idlancoperdiaimob.AsFloat;
            end
            else
              if not dbLancOperDiaImob.Update then
                raise Exception.Create( dbLancOperDiaImob.MessageInfo );

            cdsPlanoPatro.Next;
          end;

          if cdsEncargos <> nil then
          begin
            cdsEncargos.Insert;
            cdsEncargos.FieldByName('DATAOPER').AsDateTime        := dDataLancto;
            cdsEncargos.FieldByName('DATABAIXA').AsDateTime       := dDataBaixa;
            cdsEncargos.FieldByName('IDOPERACAO').AsInteger       := iIdOper;
            cdsEncargos.FieldByName('VLRDIA').AsFloat             := fVlrLancDia;
            cdsEncargos.FieldByName('VLRACUM').AsFloat            := fVlrAcum;
            cdsEncargos.FieldByName('CODTIPIMOVEL').AsString      := sTipoImovel;
            cdsEncargos.FieldByName('IDCONTRATOIMOVEL').AsInteger := iIdContrato;
            cdsEncargos.FieldByName('IDFORCLI').AsInteger         := iIdForCli;
            cdsEncargos.FieldByName('CODDOCUMENTO').AsInteger     := iCodDocum;
            cdsEncargos.FieldByName('IDPARCFINANCIMOV').AsInteger := IDParcela;
            cdsEncargos.FieldByName('IDCONDPAGIMOVEL').AsInteger  := iIdCondPag;
            cdsEncargos.Post;
          end;
        end;
      end
      else
        raise Exception.Create('Processo foi abortado, pois o(s) imóvel(is) do contrato ' +#13+
              ComunsImobiliarioDB.RetornaDescContrato(iIdContrato) + ' não possui(em) segregação.');
    except
      on E:Exception do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
    FreeAndNil( cdsPlanoPatro );
  end;
end;


function TCtrlOperImob.GravaLancOperImob(sNomeBilhete:String; const vIdOper:Array of Integer; const dDataLancto: TDateTime;
                                         const iTipoResumo:Integer; const bMostraProgresso: Boolean = True;
                                         const iContrato : Integer = -1): Boolean;
var iIdLancOperContImo, iQuant, iAtual: Integer;
    cdsTemp : TCMClientDataSet;
begin
   Result := True;
   try
      try
         cdsTemp := TCMClientDataSet.Create( nil );
         cdsTemp.Data := LookupResumeLancOper(vIdOper,dDataLancto,iTipoResumo, iContrato);
         cdsTemp.First;

         // força um do progresso para montar a tela
         iAtual := 1;
         iQuant := cdsTemp.RecordCount;
         if bMostraProgresso then
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dDataLancto) + ' - Consolidando Lançamentos...']);

         // Grava registro em LANCOPERCONTIMOB
         if not cdsTemp.IsEmpty then begin
            if not GravaLancOperContImob(dDataLancto, iIdLancOperContImo) then
               raise Exception.Create( MessageInfo );
         end;

         // Grava o resumo em LancOperImob
         cdsTemp.First;
         while not cdsTemp.Eof do begin
            dbLancOperImob.Clear;
            dbLancOperImob.Idmodulo.AsInteger    := cdsTemp.FieldByName('IDMODULO').AsInteger;
            dbLancOperImob.Dataoper.AsDateTime   := cdsTemp.FieldByName('DATAOPER').AsDateTime;
            dbLancOperImob.Idoperacao.AsInteger  := cdsTemp.FieldByName('IDOPERACAO').AsInteger;
            dbLancOperImob.Codtipimovel.AsString := cdsTemp.FieldByName('CODTIPIMOVEL').AsString;
            dbLancOperImob.Vlrdia.AsFloat        := cdsTemp.FieldByName('TOT_VLRDIA').AsFloat;
            dbLancOperImob.IdLancOperContImo.AsInteger := iIdLancOperContImo;
            if iTipoResumo = 2 then
               dbLancOperImob.IdContratoImovel.AsInteger := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;

            if cdsTemp.fieldByName('IDPATRO').AsString = '' then
              dbLancOperImob.IdPatro.AsInteger :=  994886
            else
              dbLancOperImob.IdPatro.AsInteger := cdsTemp.FieldByName('IDPATRO').AsInteger;

            if cdsTemp.fieldByName('IDPLANOPREV').AsString = '' then
              dbLancOperImob.IdPlanoPrev.AsInteger :=  29
            else
              dbLancOperImob.IdPlanoPrev.AsInteger := cdsTemp.FieldByName('IDPLANOPREV').AsInteger;

            if not FdbLancOperImob.Insert then
               raise Exception.Create( dbLancOperImob.MessageInfo );

            // o último parâmetro será utilizado para passar a mensagem do processamento
            Inc (iAtual);
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

            cdsTemp.Next;
         end;

         if bMostraProgresso then
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dDataLancto) + ' - Lançamentos Consolidados...']);

      except
         on E:Exception do begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;



function TCtrlOperImob.GravaLancOperContImob(const dDataLancto: TDateTime;
                                             var   iIdLancOperContImo: integer): Boolean;
var cdsTemp: TCMClientDataSet;
begin
  try
    try
      cdsTemp      := TCMClientDataSet.Create( nil );
      cdsTemp.Data := LookupLancOperContImob(dDataLancto);

      // inserir registro na LANCOPERCONTIMOB
      if cdsTemp.IsEmpty then begin
        dbLancOperContImob.Clear;
        dbLancOperContImob.Idmodulo.AsInteger    := ParamSistema.idModulo;
        dbLancOperContImob.Datalancto.AsDateTime := dDataLancto;
        if not dbLancOperContImob.Insert then
          raise Exception.Create ( FdbLancOperContImob.MessageInfo );

        Result := True;
        iIdLancOperContImo := FdbLancOperContImob.IdLancOperContImo.AsInteger;
      end else begin
        Result := True;
        iIdLancOperContImo := cdsTemp.FieldByName('IDLANCOPERCONTIMO').AsInteger;
      end;
    except
      on E:Exception do begin
        Result := False;
        iIdLancOperContImo := -1;
        MessageInfo := E.Message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;


function TCtrlOperImob.AtualizaAlteradores(sNomeBilhete: string;
                                           const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                           const dLimite: TDateTime): Boolean;
var cdsDocs, cdsTemp, cdsAlts, cdsRecalc, cdsOperAbono, cdsAbono : TCMClientDataSet;
    iAtual, iQuant   : Integer;
    sSql : String;
    bAtualiza : Boolean;
    fTotAlt, fTotLan, fTotAbono : Currency;
    iUnidNegocio, iDocumentoAux : Integer;
    dDataLancto : TDateTime;
    sTipoImovelaux : string; // Edilaine - SOL 170547-9382 / KTN 1654606
    iIdOperAbonoMulta, iIdOperAbonoJuros, iIdOperAbonoCM : Integer;
    fAcumMul, fAcumJur, fAcumCm : Double;
    fAbonoMulta, fAbonoJuros, fAbonoCM : Double;
begin
  Result := True;
  try
     try
        if bGeraLog then begin
           AssignFile(ArqLog, '2_AtualizaAlteradores'+FormatDateTime('ddmmyyyy',dLimite)+ '.Log');
           Rewrite(ArqLog);
           writeLn(ArqLog, 'Função: AtualizaAlteradores - Dia: ' + FormatDateTime('dd/mm/yyyy',dLimite));
           writeLn(ArqLog, ' ');
        end;

        // Exclui os alteradores lançados em documentos vincendo.
        if bGeraLog then writeLn(ArqLog, 'Inicio ExcluiAlterIndevido: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if not ExcluiAlterIndevido(sNomeBilhete, dLimite) then
           raise exception.Create( messageinfo );
        if bGeraLog then writeLn(ArqLog, 'Término ExcluiAlterIndevido: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
        if bGeraLog then writeLn(ArqLog, ' ');

        if bGeraLog then writeLn(ArqLog, 'Inicio AtualizaAlteradores: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

        // Busca os documentos a serem atualizados
        cdsTemp      := TCMClientDataSet.Create( nil );
        cdsDocs      := TCMClientDataSet.Create( nil );
        cdsAlts      := TCMClientDataSet.Create( nil );
        cdsRecalc    := TCMClientDataSet.Create( nil );
        // Marchetti - Pendencia 22452
        cdsOperAbono := TCMClientDataSet.Create( nil );

        if ParamSistema.idModulo = 64 then 
           cdsOperAbono.Data := GetDataPacket('SELECT NVL(IDOPERABONOMULTA,-1) AS IDOPERABONOMULTA, NVL(IDOPERABONOJUROS,-1) AS IDOPERABONOJUROS, NVL(IDOPERABONOCM,-1) AS IDOPERABONOCM FROM PARAMIMOVEL')
        else
           cdsOperAbono.Data := GetDataPacket('SELECT NVL(IDOPERABONOMULTA,-1) AS IDOPERABONOMULTA, NVL(IDOPERABONOJUROS,-1) AS IDOPERABONOJUROS, NVL(IDOPERABONOCM,-1) AS IDOPERABONOCM FROM PARAMALIENACAO');

        iIdOperAbonoMulta := cdsOperAbono.FieldByName('IDOPERABONOMULTA').AsInteger;
        iIdOperAbonoJuros := cdsOperAbono.FieldByName('IDOPERABONOJUROS').AsInteger;
        iIdOperAbonoCM    := cdsOperAbono.FieldByName('IDOPERABONOCM').AsInteger;
        cdsAbono     := TCMClientDataSet.Create( nil );
        // Fim Marchetti - Pendencia 22452

        cdsDocs.Data := LookupAtualizaDocs(dLimite,iIdOperMulta,iIdOperJuros,iIdOperCM,iIdOperAbonoMulta,iIdOperAbonoJuros,iIdOperAbonoCM);
        if bGeraLog then writeLn(ArqLog, 'AbreQuery: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

        // Para cada documento, exclui os alteradores já existentes e lança o novo
        if not cdsDocs.IsEmpty then begin

           cdsDocs.First;
           // força um do progresso para montar a tela
           iAtual := 1;
           iQuant := cdsDocs.RecordCount;
           DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dLimite) + ' - Atualizando documentos no Contas a Receber...']);

           while not cdsDocs.Eof do begin

              DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);

              // Busca o valor TOTAL dos alteradores atuais lançados no documento
              if ParamSistema.idModulo = 64 then begin
                 sSql := 'SELECT SUM(L.VALOR) AS VALOR '+#13+
                         '  FROM TIPOIMOVEL T, '+#13+
                         '       LANCTODOCUM L '+#13+
                         ' WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                         '   AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '   AND L.ESTORNO IS NULL ' +#13+
                         '   AND ( L.CODALTERADOR = T.CODALTMULTA OR  '+#13+
                         '         L.CODALTERADOR = T.CODALTJUROS OR  '+#13+
                         '         L.CODALTERADOR = T.CODALTCORRMON ) ';
              end else begin
                 sSql := 'SELECT SUM(L.VALOR) AS VALOR '+#13+
                         '  FROM TIPOIMOVEL T, '+#13+
                         '       LANCTODOCUM L '+#13+
                         ' WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                         '   AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '   AND L.ESTORNO IS NULL ' +#13+
                         '   AND ( L.CODALTERADOR = T.CODALTMTAL OR  '+#13+
                         '         L.CODALTERADOR = T.CODALTJRAL OR  '+#13+
                         '         L.CODALTERADOR = T.CODALTCMAL ) ';
              end;
              cdsTemp.Data := GetDataPacket( sSql );
              fTotAlt      := cdsTemp.FieldByName('VALOR').AsFloat;

              // Busca o valor TOTAL dos alteradores que serão lançados no documento
              if ParamSistema.idModulo = 64 then begin
                 sSql := ' SELECT SUM(VLRACUM) AS VALOR '+#13+
                         '   FROM LANCOPERDIAIMOB      '+#13+
                         '  WHERE IDMODULO         = ' + IntToStr(ParamSistema.idModulo) +#13+
                         '    AND CODDOCUMENTO     = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '    AND IDPARCFINANCIMOV IS NULL AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'')'+#13+
                         '    AND DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')' +#13+
                         '    AND ( IDOPERACAO = ' + IntToStr(iIdOperMulta) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperJuros) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperCM)    + ' )';
              end else begin
                 sSql := ' SELECT SUM(VLRDIA) AS VALOR '+#13+
                         '   FROM LANCOPERDIAIMOB      '+#13+
                         '  WHERE IDMODULO         = ' + IntToStr(ParamSistema.idModulo) +#13+
                         '    AND CODDOCUMENTO     = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '    AND IDPARCFINANCIMOV = ' + cdsDocs.FieldByName('IDPARCFINANCIMOV').AsString +#13+
                         '    AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND DATAOPER <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')' +#13+
                         '    AND ( IDOPERACAO = ' + IntToStr(iIdOperMulta) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperJuros) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperCM)    + ' )';
              end;
              cdsTemp.Data := GetDataPacket( sSql );
              fTotLan := cdsTemp.FieldByName('VALOR').AsFloat;

              // Marchetti - Pendencia 22452
              // Busca o valor TOTAL dos abonos que foram lançados
              if ParamSistema.idModulo = 64 then begin
                 sSql := ' SELECT IDOPERACAO, SUM(VLRDIA) AS VALOR '+#13+
                         '   FROM LANCOPERDIAIMOB      '+#13+
                         '  WHERE IDMODULO         = ' + IntToStr(ParamSistema.idModulo) +#13+
                         '    AND CODDOCUMENTO     = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '    AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDPARCFINANCIMOV IS NULL '+#13+
                         '    AND DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',cdsDocs.FieldByName('ULTABONO').AsDateTime)) + ',''DD/MM/YYYY'')' +#13+
                         '    AND ( IDOPERACAO = ' + IntToStr(iIdOperAbonoMulta) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperAbonoJuros) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperAbonoCM)    + ' )' +#13+
                         '  GROUP BY IDOPERACAO';
              end else begin
                 sSql := ' SELECT IDOPERACAO, SUM(VLRDIA) AS VALOR '+#13+
                         '   FROM LANCOPERDIAIMOB      '+#13+
                         '  WHERE IDMODULO         = ' + IntToStr(ParamSistema.idModulo) +#13+
                         '    AND CODDOCUMENTO     = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '    AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDPARCFINANCIMOV = ' + cdsDocs.FieldByName('IDPARCFINANCIMOV').AsString +#13+
                         '    AND DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',cdsDocs.FieldByName('ULTABONO').AsDateTime)) + ',''DD/MM/YYYY'')' +#13+
                         '    AND ( IDOPERACAO = ' + IntToStr(iIdOperAbonoMulta) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperAbonoJuros) + ' OR '+#13+
                         '          IDOPERACAO = ' + IntToStr(iIdOperAbonoCM)    + ' )'+#13+
                         '  GROUP BY IDOPERACAO';
              end;
              cdsTemp.Data := GetDataPacket( sSql );

              fAbonoMulta := 0;
              fAbonoJuros := 0;
              fAbonoCM    := 0;
              fTotAbono   := 0;
              cdsTemp.First;
              while not cdsTemp.Eof do
              begin

                 if cdsTemp.FieldByName('IDOPERACAO').AsInteger = iIdOperAbonoMulta then
                    fAbonoMulta := fAbonoMulta + cdsTemp.FieldByName('VALOR').AsFloat;

                 if cdsTemp.FieldByName('IDOPERACAO').AsInteger = iIdOperAbonoJuros then
                    fAbonoJuros := fAbonoJuros + cdsTemp.FieldByName('VALOR').AsFloat;

                 if cdsTemp.FieldByName('IDOPERACAO').AsInteger = iIdOperAbonoCM then
                    fAbonoCM    := fAbonoCM    + cdsTemp.FieldByName('VALOR').AsFloat;

                 fTotAbono := fTotAbono + cdsTemp.FieldByName('VALOR').AsFloat;
                 cdsTemp.Next;
              end;
              // Fim Marchetti - Pendencia 22452

              // Busca o data do último Evento de Recálculo existente
              if ParamSistema.idModulo = 64 then begin
                 sSql := 'SELECT MAX(DATALANCTO) AS DATALANCTO '+#13+
                         '  FROM TIPOIMOVEL T, LANCTODOCUM L   '+#13+
                         ' WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                         '   AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '   AND L.ESTORNO IS NULL ' +#13+
                         '   AND ( L.CODALTERADOR = T.CODALTMULTA OR '+#13+
                         '         L.CODALTERADOR = T.CODALTJUROS OR '+#13+
                         '         L.CODALTERADOR = T.CODALTCORRMON )  '+#13+
                         '   AND L.CODDOCUMENTO IN ( SELECT CODDOCUMENTO                  '+#13+
                         '                             FROM EVENTOIMOVEL                  '+#13+
                         '                            WHERE CODDOCUMENTO = L.CODDOCUMENTO '+#13+
                         '                              AND FLGTIPOEVENTO = ''RD''        '+#13+
                         '                              AND EVIDATA >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') )';
              end else begin
                 sSql := 'SELECT MAX(DATALANCTO) AS DATALANCTO '+#13+
                         '  FROM TIPOIMOVEL T, LANCTODOCUM L   '+#13+
                         ' WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                         '   AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                         '   AND L.ESTORNO IS NULL ' +#13+
                         '   AND ( L.CODALTERADOR = T.CODALTMTAL OR '+#13+
                         '         L.CODALTERADOR = T.CODALTJRAL OR '+#13+
                         '         L.CODALTERADOR = T.CODALTCMAL )  '+#13+
                         '   AND L.CODDOCUMENTO IN ( SELECT CODDOCUMENTO                  '+#13+
                         '                             FROM EVENTOIMOVEL                  '+#13+
                         '                            WHERE CODDOCUMENTO = L.CODDOCUMENTO '+#13+
                         '                              AND FLGTIPOEVENTO = ''RD''        '+#13+
                         '                              AND EVIDATA >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') )';
              end;

              cdsRecalc.Data := GetDataPacket( sSql );
              dDataLancto  := cdsRecalc.FieldByName('DATALANCTO').AsDateTime;

              // Se o total já lançado for diferente do calculado, marca para atualização
              // Apenas se o documento não tiver sido recalculado para cobrança futura.
              bAtualiza := False;
              if (dLimite > dDataLancto) or (cdsRecalc.FieldByName('DATALANCTO').IsNull) then begin
                 if (cdsTemp.IsEmpty) or ((fTotLan-fTotAbono) <> fTotAlt) then bAtualiza := True;
              end;

              if bAtualiza then begin

                 // Uma transação por documento, senão fica muito pesado.
                 StartTransaction;

                 // se já existir valores lançados no CAR, busca e exclui
                 if fTotAlt <> 0 then begin

                    // Exclui FORA DA FUNÇÃO os alteradores sem planilha ( aumento de performance )
                    if ParamSistema.idModulo = 64 then begin
                       sSql := 'DELETE FROM LANCTODOCUM ' +#13+
                               ' WHERE CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                               '   AND NUMLANCTO IN ( SELECT L.NUMLANCTO   '+#13+
                               '                        FROM TIPOIMOVEL T, '+#13+
                               '                             LANCTODOCUM L '+#13+
                               '                       WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                               '                         AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                               '                         AND ( L.PLNCODIGO IS NULL OR ' +#13+
                               '                               ( (SELECT COUNT(*) FROM LANCAMENTO L2 ' +#13+
                               '                                   WHERE L2.PLNCODIGO = L.PLNCODIGO) = 0 ) ) ' +#13+
                               '                         AND ( L.CODALTERADOR = T.CODALTMULTA OR  '+#13+
                               '                               L.CODALTERADOR = T.CODALTJUROS OR  '+#13+
                               '                               L.CODALTERADOR = T.CODALTCORRMON ) )';
                    end else begin
                       sSql := 'DELETE FROM LANCTODOCUM ' +#13+
                               ' WHERE CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                               '   AND NUMLANCTO IN ( SELECT L.NUMLANCTO   '+#13+
                               '                        FROM TIPOIMOVEL T, '+#13+
                               '                             LANCTODOCUM L '+#13+
                               '                       WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                               '                         AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                               '                         AND ( L.PLNCODIGO IS NULL OR ' +#13+
                               '                               ( (SELECT COUNT(*) FROM LANCAMENTO L2 ' +#13+
                               '                                   WHERE L2.PLNCODIGO = L.PLNCODIGO) = 0 ) ) ' +#13+
                               '                         AND ( L.CODALTERADOR = T.CODALTMTAL OR  '+#13+
                               '                               L.CODALTERADOR = T.CODALTJRAL OR  '+#13+
                               '                               L.CODALTERADOR = T.CODALTCMAL ) )';
                    end;
                    if not ExecSQL( sSql ) then
                       raise exception.Create( messageinfo );

                    // Busca os alteradores atuais lançados no documento
                    if ParamSistema.idModulo = 64 then begin
                       sSql := 'SELECT L.CODDOCUMENTO, L.NUMLANCTO, L.PLNCODIGO, L.DATALANCTO, L.VALOR '+#13+
                               '  FROM TIPOIMOVEL T, '+#13+
                               '       LANCTODOCUM L '+#13+
                               ' WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                               '   AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                               '   AND L.ESTORNO IS NULL ' +#13+
                               '   AND ( L.CODALTERADOR = T.CODALTMULTA OR  '+#13+
                               '         L.CODALTERADOR = T.CODALTJUROS OR  '+#13+
                               '         L.CODALTERADOR = T.CODALTCORRMON ) ';
                    end else begin
                       sSql := 'SELECT L.CODDOCUMENTO, L.NUMLANCTO, L.PLNCODIGO, L.DATALANCTO, L.VALOR '+#13+
                               '  FROM TIPOIMOVEL T, '+#13+
                               '       LANCTODOCUM L '+#13+
                               ' WHERE T.CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString) +#13+
                               '   AND L.CODDOCUMENTO = ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString +#13+
                               '   AND L.ESTORNO IS NULL ' +#13+
                               '   AND ( L.CODALTERADOR = T.CODALTMTAL OR  '+#13+
                               '         L.CODALTERADOR = T.CODALTJRAL OR  '+#13+
                               '         L.CODALTERADOR = T.CODALTCMAL ) ';
                    end;
                    cdsTemp.Data := GetDataPacket( sSql );

                    // Exclui os alteradores anteriores
                    cdsTemp.First;
                    while not cdsTemp.Eof do
                    begin
                       {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
                       CtrlDocumento.UsaPlanoPatro         := ParamSistema.UsaPlanoPatro;
                       CtrlDocumento.CodDocumento          := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
                       CtrlDocumento.Lanctodocum.NumLancto := cdsTemp.FieldByName('NUMLANCTO').AsInteger;

                       if not CtrlDocumento.Delete then begin
                          DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, 'Doc: ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                                  CtrlDocumento.MessageInfo]);
                       end;}
                       CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
                       CtrlImobDocumento.UsaPlanoPatro         := ParamSistema.UsaPlanoPatro;
                       CtrlImobDocumento.CodDocumento          := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
                       CtrlImobDocumento.Lanctodocum.NumLancto := cdsTemp.FieldByName('NUMLANCTO').AsInteger;

                       if not CtrlImobDocumento.Delete then
                       begin
                          DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, 'Doc: ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                        CtrlImobDocumento.MessageInfo]);
                       end;
                       cdsTemp.Next;
                    end;
                 end;

                 // Busca os alteradores parametrizados para o tipo de imovel
                 if ParamSistema.idModulo = 64 then begin
                    sSql := 'SELECT CODALTMULTA, CODALTJUROS, CODALTCORRMON '+#13+
                            '  FROM TIPOIMOVEL WHERE CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString);
                 end else begin
                    sSql := 'SELECT CODALTMTAL AS CODALTMULTA, CODALTJRAL AS CODALTJUROS, '+#13+
                            '       CODALTCMAL AS CODALTCORRMON                           '+#13+
                            '  FROM TIPOIMOVEL WHERE CODTIPIMOVEL = ' + QuotedStr(cdsDocs.FieldByName('CODTIPIMOVEL').AsString);
                 end;
                 cdsAlts.Data := GetDataPacket( sSql );

                 if (cdsAlts.FieldByName('CODALTMULTA').IsNull) or (cdsAlts.FieldByName('CODALTJUROS').IsNull) or
                    (cdsAlts.FieldByName('CODALTJUROS').IsNull) then begin
                    raise exception.Create( 'Os Alteradores não foram definidos para o tipo de imóvel - ' + cdsDocs.FieldByName('CODTIPIMOVEL').AsString );
                 end;

                 // Lança os novos alteradores no documento SEM CONTABILIZAR

                 // Marchetti - Pendencia 22452
                 if (fTotLan-fTotAbono) <> 0 then begin
                 // Fim Marchetti - Pendencia 22452

                    {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
                    CtrlDocumento.PartidaDobrada := CtrlParamIntegra.PartidaDobrada;
                    CtrlDocumento.UsaPlanoPatro  := ParamSistema.UsaPlanoPatro;
                    CtrlDocumento.IdUsuario      := ParamSistema.idUsuario;
                    CtrlDocumento.IdModulo       := ParamSistema.idModulo;}

                    CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
                    CtrlImobDocumento.PartidaDobrada := CtrlParamIntegra.PartidaDobrada;
                    CtrlImobDocumento.UsaPlanoPatro  := ParamSistema.UsaPlanoPatro;
                    CtrlImobDocumento.IdUsuario      := ParamSistema.idUsuario;
                    CtrlImobDocumento.IdModulo       := ParamSistema.idModulo;

                    // Marchetti - Pendencia 22452
                    if fTotAbono = 0 then
                    begin
                       // Insere os alteradores para cada período de baixa ( parcial )
                       iDocumentoAux := cdsDocs.FieldByName('CODDOCUMENTO').AsInteger;
                       sTipoImovelaux := cdsDocs.FieldByName('CODTIPIMOVEL').AsString;  // Edilaine - SOL 170547-9382 / KTN 1654606
                       while (cdsDocs.FieldByName('CODDOCUMENTO').AsInteger = iDocumentoAux) and
                             (cdsDocs.FieldByName('CODTIPIMOVEL').AsString = sTipoImovelaux) and  // Edilaine - SOL 170547-9382 / KTN 1654606
                             ( not cdsDocs.Eof ) do begin

                          if cdsDocs.FieldByName('DATABAIXA').IsNull then
                               dDataLancto := cdsDocs.FieldByName('DATAOPER').AsDateTime
                          else dDataLancto := cdsDocs.FieldByName('DATABAIXA').AsDateTime;

                          // Lança Multa
                          if cdsDocs.FieldByName('VLRACUM_MUL').AsFloat <> 0 then begin

                             InsereAlterador(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                             cdsAlts.FieldByName('CODALTMULTA').AsInteger,
                                             ParamSistema.IdUsuario, 'Multa',
                                             cdsDocs.FieldByName('VLRACUM_MUL').AsFloat,
                                             dDataLancto);

                          end;

                          // Lança Juros
                          if cdsDocs.FieldByName('VLRACUM_JUR').AsFloat <> 0 then begin

                             InsereAlterador(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                             cdsAlts.FieldByName('CODALTJUROS').AsInteger,
                                             ParamSistema.IdUsuario, 'Juros',
                                             cdsDocs.FieldByName('VLRACUM_JUR').AsFloat,
                                             dDataLancto);
                          end;

                          // Lança Correção
                          if cdsDocs.FieldByName('VLRACUM_COR').AsFloat <> 0 then begin

                             InsereAlterador(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                             cdsAlts.FieldByName('CODALTCORRMON').AsInteger,
                                             ParamSistema.IdUsuario, 'Correção Monetária',
                                             cdsDocs.FieldByName('VLRACUM_COR').AsFloat,
                                             dDataLancto);
                          end;
                          if bGeraLog then writeLn(ArqLog, 'Doc: ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString + ' : ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
                          cdsDocs.Next;
                          Inc (iAtual);
                       end;
                    end
                    else
                    begin
                       // Insere os alteradores para cada período de baixa ( parcial )
                       iDocumentoAux := cdsDocs.FieldByName('CODDOCUMENTO').AsInteger;
                       fAcumMul := 0;
                       fAcumJur := 0;
                       fAcumCm  := 0;
                       while (cdsDocs.FieldByName('CODDOCUMENTO').AsInteger = iDocumentoAux) and
                             ( not cdsDocs.Eof ) do begin

                          dDataLancto := cdsDocs.FieldByName('ULTABONO').AsDateTime;

                          fAcumMul := fAcumMul + cdsDocs.FieldByName('VLRACUM_MUL').AsFloat;
                          fAcumJur := fAcumJur + cdsDocs.FieldByName('VLRACUM_JUR').AsFloat;
                          fAcumCm  := fAcumCm  + cdsDocs.FieldByName('VLRACUM_COR').AsFloat;

                          cdsDocs.Next;
                          Inc (iAtual);
                       end;

                       // Lança Multa
                       if (fAcumMul <> 0) and ((fAcumMul - fAbonoMulta) > 0) then begin

                          InsereAlterador(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                          cdsAlts.FieldByName('CODALTMULTA').AsInteger,
                                          ParamSistema.IdUsuario, 'Multa',
                                          fAcumMul - fAbonoMulta,
                                          dDataLancto);
                       end;

                       // Lança Juros
                       if (fAcumJur <> 0) and ((fAcumJur - fAbonoJuros) > 0) then begin

                          InsereAlterador(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                          cdsAlts.FieldByName('CODALTJUROS').AsInteger,
                                          ParamSistema.IdUsuario, 'Juros',
                                          fAcumJur - fAbonoJuros,
                                          dDataLancto);
                       end;

                       // Lança Correção
                       if (fAcumCM <> 0) and ((fAcumCM - fAbonoCM) > 0) then begin

                          InsereAlterador(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger,
                                          cdsAlts.FieldByName('CODALTCORRMON').AsInteger,
                                          ParamSistema.IdUsuario, 'Correção Monetária',
                                          fAcumCM - fAbonoCM,
                                          dDataLancto);
                       end;
                       if bGeraLog then writeLn(ArqLog, 'Doc: ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString + ' : ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

                    end;
                    // Fim Marchetti - Pendencia 22452

                    //CtrlDocumento.UpdateStatusBaixa(iDocumentoAux);
                    // Alterado por FHBS - SOL: 136336 KTN: 815081 - Adicionei a dDataLimite
                    CtrlImobDocumento.UpdateStatusBaixa(iDocumentoAux, dLimite);

                 end else begin
                    // Se apenas excluiu os alteradores existentes, atualiza o status
                    //CtrlDocumento.UpdateStatusBaixa(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger);
                    // Alterado por FHBS - SOL: 136336 KTN: 815081 - Adicionei a dDataLimite
                    CtrlImobDocumento.UpdateStatusBaixa(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger, dLimite);
                    cdsDocs.Next;
                    Inc (iAtual);
                 end;

                 Commit;

              end else begin
                 // Se apenas excluiu os alteradores existentes, atualiza o status
                 //CtrlDocumento.UpdateStatusBaixa(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger);
                 // Alterado por FHBS - SOL: 136336 KTN: 815081 - Adicionei a dDataLimite
                 CtrlImobDocumento.UpdateStatusBaixa(cdsDocs.FieldByName('CODDOCUMENTO').AsInteger, dLimite);

                 if bGeraLog then writeLn(ArqLog, 'Doc: ' + cdsDocs.FieldByName('CODDOCUMENTO').AsString + ' : ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
                 cdsDocs.Next;
                 Inc (iAtual);
              end;
           end;
        end;
     except
        on e : Exception do begin
           Result := False;
           Rollback;
           MessageInfo := e.message;
           DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
        end;
     end;
  finally
     FreeAndNil( cdsOperAbono );
     FreeAndNil( cdsAbono );
     FreeAndNil( cdsDocs );
     FreeAndNil( cdsAlts );
     FreeAndNil( cdsTemp );
     FreeAndNil( cdsRecalc );
     if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)); // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
     if bGeraLog then CloseFile( ArqLog );
  end;
end;


function TCtrlOperImob.InsereAlterador(const CodDocumento, CodAlterador, IdUsuario: Integer;
                                       const sHistorico: String; const Valor: Extended; const dDataLancto: TDateTime): Boolean;
var sSql : String;
begin
   sSql := 'INSERT INTO LANCTODOCUM '+#13+
           ' (CODDOCUMENTO, NUMLANCTO, CODALTERADOR, DATALANCTO, VALOR, VLRLIQUIDO, '+#13+
           '  DEBCRE, OPERACAO, HISTORICOCOMPL, IDUSUARIOINCLUSAO)   '+#13+
           ' (SELECT ' + IntToStr(CodDocumento) + ' AS CODDOCUMENTO, '+#13+
                     ' SEQLANCTODOCUM.NEXTVAL  AS NUMLANCTO,         '+#13+
                       IntToStr(CodAlterador) + ' AS CODALTERADOR, '+#13+
                     ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLancto)) + ',''DD/MM/YYYY'') AS DATALANCTO, '+#13+
                       ComunsImobiliario.StrTran(FloatToStr(Valor),',','.') + ' AS VALOR,      '+#13+
                       ComunsImobiliario.StrTran(FloatToStr(Valor),',','.') + ' AS VLRLIQUIDO, '+#13+
                     ' ''D'' AS DEBCRE,   '+#13+
                     ' ''4'' AS OPERACAO, '+#13+
                         QuotedStr(sHistorico) + ' AS HISTORICOCOMPL, '+#13+
                         IntToStr(idUsuario)   + ' AS IDUSUARIOINCLUSAO FROM DUAL )';

   Result := ExecSQL(sSql);
end;


function TCtrlOperImob.BuscaUnidNegocAlterador(const IdOperacao: Integer; const sTipoImovel:String): Integer;
var i, iCodErro : Integer;
    bNovaUnid : Boolean;
    ParamContabil : TParamContabeisMT;
begin
   Result := -1;
   // Busca a parametrização das operações para definir a unidade de negócio
   // Colocado em um array para otimizar o processo
   bNovaUnid := True;
   for i := 0 to Length(vTpOper)-1 do begin
     if (vTpOper[i].CodTipImovel = sTipoImovel) and
        (vTpOper[i].IdOperacao   = IdOperacao ) then begin
        bNovaUnid := False;
        Result := vTpOper[i].UnidNegocio;
        Exit;
     end;
   end;

   if bNovaUnid then begin
      // Busca a Parametrização
      CtrlPadrLancImovel.ZeraPadrLancContabil(ParamContabil);
      CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabil, iCodErro, 'O', False,
                                               ParamSistema.idEmpresa,
                                               ParamSistema.idModulo,
                                               IdOperacao, sTipoImovel);

      SetLength(vTpOper,(Length(vTpOper)+1) );
      i := High(vTpOper);
      vTpOper[i].CodTipImovel := sTipoImovel;
      vTpOper[i].IdOperacao   := IdOperacao;
      vTpOper[i].UnidNegocio  := ParamContabil.iUnidNegoc;

      Result := ParamContabil.iUnidNegoc;
   end;
end;



function TCtrlOperImob.AtualizaProvisaoReceita(sNomeBilhete: string; const iIdProvisao: Integer; const dLimite: TDateTime): Boolean;
var cdsContratos, cdsTemp   : TCMClientDataSet;
    iMeses, iMesPadrao, iAtual, iQuant  : Integer;
    iDia, iMes, iAno, iDiasProRata : Word;
    fVlrRestante, fVlrTotal, fVlrProRata : Extended;
    sSql, sAnoMes : String;
    dUltDia, dInicio : TDateTime;
begin
   Result := True;
   try
      try
         // Monta AnoMes de fechamento
         DecodeDate(dLimite, iAno, iMes, iDia);
         dInicio := EncodeDate(iAno, iMes, 1);
         sAnoMes := FormatFloat('0000', iAno) + FormatFloat('00', iMes);

         StartTransaction;

         // Exclui lançamentos anteriores se for um Reprocessamento
         if not Reprocessamento(sNomeBilhete, [iIdProvisao], dLimite) then
            raise Exception.Create( MessageInfo );

         // FUNCEF - Não processa anterior a 01/2005
         if sAnoMes < '200501' then begin
            Commit;
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, 'Competência anterior a 01/2005 não processada']);
            Exit;
         end;

         // Busca o Nr. de meses a ser considerado para contratos indeterminados nos parametros do sistema
         cdsTemp := TCMClientDataSet.Create( nil );
         sSql := 'SELECT QTDEMESPREVFOLHA FROM PARAMIMOVEL WHERE IDPESSOA = ' + IntToStr(ParamSistema.idEmpresa);
         cdsTemp.Data := GetDataPacket( sSql );
         iMesPadrao := cdsTemp.FieldByName('QTDEMESPREVFOLHA').AsInteger;

         // Abre todos os contratos vigentes
         cdsContratos := TCMClientDataSet.Create( nil );

         // Marchetti - Pendencias 25316 e 25341
         sSQL :=
         'SELECT CI.IDCONTRATOIMOVEL, CI.IDTIPOCUSTORECIMO, CI.CONVLRAJUSTADO,' + #13 +
         '               CI.FLGINDETERMINADO, CI.CONDATAFIM,' + #13 +
         '               MAX(I.CODTIPIMOVEL) AS CODTIPIMOVEL' + #13 +
         '          FROM CONTRATOIMOVEL CI, CONTRATOXIMOVEL CXI, IMOVEL I' + #13 +
         '         WHERE CI.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL' + #13 +
         '           AND CXI.IDIMOVEL = I.IDIMOVEL' + #13 +
         '           AND CI.FLGTIPOCONTRATO = ''L''' + #13 +
         '           AND ((CI.CONDATAFIM IS NOT NULL AND (' + QuotedStr(sAnoMes) + 'BETWEEN TO_CHAR(CI.CONDATAINICIO,''YYYYMM'') AND TO_CHAR(CI.CONDATAFIM,''YYYYMM'') ) ) OR' + #13 +
         '                (CI.CONDATAFIM IS NULL AND (' + QuotedStr(sAnoMes) + ' >= TO_CHAR(CI.CONDATAINICIO,''YYYYMM'') ) ) )' + #13 +
         '           AND CI.IDTIPOCUSTORECIMO IN( SELECT IDTIPOCUSTORECIMO FROM TIPOCUSTORECIMOV' + #13 +
         '                                         WHERE IDOPERCONTAB IS NOT NULL )' + #13 +
         '         GROUP BY CI.IDCONTRATOIMOVEL, CI.IDTIPOCUSTORECIMO, CI.CONVLRAJUSTADO,' + #13 +
         '                  CI.FLGINDETERMINADO, CI.CONDATAFIM' + #13;

         // Fim Marchetti - Pendencias 25316 e 25341

         cdsContratos.Data := GetDataPacket( sSql );

         // força um do progresso para montar a tela
         iAtual := 1;
         iQuant := cdsContratos.RecordCount;
         DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dLimite) + ' - Atualizando Provisão de Receitas Contratuais...']);

         while not cdsContratos.Eof do
         begin
            // Define Nr. de meses restantes
            if cdsContratos.FieldByName('FLGINDETERMINADO').AsString = 'S' then begin
               iMeses := iMesPadrao;
            end else begin
               iMeses := DiasUteis.IntervaloMeses(dInicio, cdsContratos.FieldByName('CONDATAFIM').AsDateTime);
               if iMeses < 0 then iMeses := 0;
            end;

            // Define Valor de provisão restante para o contrato
            fVlrRestante := cdsContratos.FieldByName('CONVLRAJUSTADO').AsFloat * iMeses;

            // Calcula o valor Pro-Rata no término do contrato
            if not cdsContratos.FieldByName('CONDATAFIM').IsNull then begin
               DecodeDate(cdsContratos.FieldByName('CONDATAFIM').AsDateTime, iAno, iMes, iDiasProRata);
               dUltDia := DiasUteis.UltDiaMes(iAno, iMes);
               DecodeDate(dUltDia, iAno, iMes, iDia);
               fVlrProRata  := ComunsImobiliario.Arredonda( ((cdsContratos.FieldByName('CONVLRAJUSTADO').AsFloat / iDia) * iDiasProRata), 2);
               fVlrRestante := fVlrRestante + fVlrProRata;
            end;

            // Verifica o valor total já apropriado para o contrato até o mes anterior do fechamento
            sSql := 'SELECT SUM(VLRLANCRECEB) AS TOT_LANCADO '+#13+
                    '  FROM LANCAMENTOSIMOVEL                '+#13+
                    ' WHERE IDCONTRATOIMOVEL   = ' + cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsString  +#13+
                    '   AND IDTIPOCUSTORECIMO  = ' + cdsContratos.FieldByName('IDTIPOCUSTORECIMO').AsString +#13+
                    '   AND TO_CHAR(ANOCOMPETENCIA,''0000'')||LTRIM(TO_CHAR(MESCOMPETENCIA,''00'')) < ' + sAnoMes;

            // Início do processo na FUNCEF - FIXO 01/2005
            sSql := sSql + ' AND TO_CHAR(ANOCOMPETENCIA,''0000'')||LTRIM(TO_CHAR(MESCOMPETENCIA,''00'')) >= 200501 ';

            cdsTemp.Data := GetDataPacket( sSql );

            // Determina o valor total do contrato, ou seja o que já foi apropriado + o valor que falta
            // FUNCEF - Considera apenas após 01/2005
            if sAnoMes > '200501' then
                 fVlrTotal := fVlrRestante + cdsTemp.FieldByName('TOT_LANCADO').AsFloat
            else fVlrTotal := fVlrRestante;

            // Grava o valor total em LancOperDiaImob
            if fVlrTotal > 0 then
            begin
               if not GravaLancOperDiaImob(dLimite, -1, iIdProvisao, 0, fVlrTotal, fVlrTotal,
                                           cdsContratos.FieldByName('CODTIPIMOVEL').AsString,
                                           cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                           -1, -1, False) then
                raise exception.Create( MessageInfo );
            end;

            Inc(iAtual);
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);
            cdsContratos.Next;
         end;

         // Resume os Lançamentos em LancOperImob por Contrato
         if not GravaLancOperImob(sNomeBilhete, [iIdProvisao], dLimite, 2) then
            Raise Exception.Create( MessageInfo );

         Commit;
      except
        on e : Exception do begin
           Result := False;
           Rollback;
           MessageInfo := e.message;
           DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
        end;
      end;
   finally
      FreeAndNil( cdsTemp );
      FreeAndNil( cdsContratos );
   end;
end;


function TCtrlOperImob.Reprocessamento(sNomeBilhete: string;
                                       const vIdOper: array of Integer;
                                       dDataOper: TDateTime;
                                       const iIdContrato:Integer = -1;
                                       const bSimula:Boolean = False;
                                       const bApagaLancamentoDiario : Boolean = True;
                                       const bTrataApenasDia : Boolean = False;
                                       const iIDParcela : Integer = -1): Boolean;
var cdsTemp : TCMClientDataSet;
    i, iAtual, iQuant : Integer;
    sParam, sSql: String;
    dDataRecalculo : TDateTime;    //edilaine SIG115072
begin
   Result := True;
   try
      try
         // Verifica se é um Reprocessamento
         cdsTemp := TCMClientDataSet.Create( nil );

         // Alterado por FHBS - SOL: 136336 KTN: 815081 - Passei para dentro do If..Then (Tirar-para-Performance-69495/69496)
         cdsTemp.Data := LookupReprocessamento(vIdOper,dDataOper, bTrataApenasDia, iIdContrato);

         // Exclui os lançamentos já efetuados na data e posteriores ao reprocessamento
         if (iCodDocumentoAjuste <= 0) and not(bSimula) then begin

            // Alterado por FHBS - SOL: 136336 KTN: 815081
            //cdsTemp.Data := LookupReprocessamento(vIdOper,dDataOper, bTrataApenasDia, iIdContrato);

            if not cdsTemp.IsEmpty then begin

               cdsTemp.First;
               // força um do progresso para montar a tela
               iAtual := 1;
               iQuant := cdsTemp.RecordCount;
               DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dDataOper) + ' - Excluindo lançamentos para Reprocessamento...']);
               while not cdsTemp.Eof do begin

                  // Exclui o lançamento da planilha, se tiver integrado
                  if (not cdsTemp.FieldByName('LANCNUMLAN').IsNull) then begin
                     //if not CtrlLancamento.ExcluiLancaContab(ParamSistema.idUsuario,
                     if not CtrlImobLancamento.ExcluiLancaContab(ParamSistema.idUsuario,
                                                             cdsTemp.FieldByName('PLNCODIGO').AsInteger,
                                                             ParamSistema.idModulo,
                                                             cdsTemp.FieldByName('LANCNUMLAN').AsInteger,
                                                             ParamSistema.UsaPlanoPatro, False) then
                     //   raise Exception.Create( CtrlLancamento.MessageInfo );
                        raise Exception.Create( CtrlImobLancamento.MessageInfo );
                  end;

                  // o último parâmetro será utilizado para passar a mensagem do processamento
                  Inc (iAtual);
                  DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1]);
                  cdsTemp.Next;
               end;

            end;

         end;

         //edilaine - SIG115072 : inicio
         if cdsTemp.isEmpty then
         begin
           // Verifica se existe recalculo
           cdsTemp.Data := GetDataPacket(
            ' SELECT MAX(EVIDATA) AS ULTRECALC '+#13+
            '   FROM EVENTOIMOVEL              '+#13+
            '  WHERE FLGTIPOEVENTO = ''RD''    '+#13+
            '    AND CODDOCUMENTO  = ' + IntToStr(iCodDocumentoAjuste)  );

           if (not cdsTemp.isEmpty) and (cdsTemp.Fields[0].AsDateTime > 0) then
           begin
              dDataRecalculo := cdsTemp.Fields[0].AsDateTime;

             // verifica se existe baixa do documento após recalculo
             cdsTemp.Data := GetDataPacket(
              ' SELECT R.DATABAIXA  '+#13+
              '   FROM LANCTODOCUM L, RECBTOPAGTO R    '+#13+
              '  WHERE L.CODDOCUMENTO = R.CODDOCUMENTO '+#13+
              '    AND L.NUMLANCTO    = R.NUMLANCTO    '+#13+
              '    AND RTRIM(L.OPERACAO) = ''5''       '+#13+
              '    AND R.DATABAIXA >=  TO_DATE(' +QuotedStr(DateToStr(dDataRecalculo))+', ''DD/MM/YYYY'') '+#13+
              '    AND R.CODDOCUMENTO  = ' + IntToStr(iCodDocumentoAjuste)  );

             if cdsTemp.isEmpty then
                dDataOper := dDataRecalculo;
           end;
         end;
         //edilaine - SIG115072 : fim

         // Monta filtro para as operações
         sParam := ' AND ( ';
         for i := 0 to Length(vIdOper) - 1 do begin
            sParam := sParam + ' IDOPERACAO = ' + IntToStr(vIdOper[i]);
            if i <> (Length(vIdOper) - 1) then
                 sParam := sParam + ' OR ' +#13
            else sParam := sParam + ' )';
         end;

         if bApagaLancamentoDiario then
         begin
            // Exclui os lançamentos da LANCOPERDIAIMOB
            if not(bTrataApenasDia) then
            begin
               sSql := 'DELETE FROM LANCOPERDIAIMOB'+#13;
               //Cássio Rovaroto - SIG nº 115072 - Início
              if (bSimula) then
               sSql := sSql + ' WHERE DATAOPER >= TO_DATE(''01/'+ FormatDateTime('MM/YYYY', dDataOper) + ''',''DD/MM/YYYY'')' +#10#13+
                              ' AND DATAOPER <= LAST_DAY(TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY', dDataOper)) + ',''DD/MM/YYYY''))' +#13
              else
              //Cássio Rovaroto - SIG nº 115072 - Fim
               sSql := sSql + ' WHERE DATAOPER >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13+ sParam;
            end
            else
            begin
               sSql := 'DELETE FROM LANCOPERDIAIMOB'+#13+
                       ' WHERE DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13+ sParam;
            end;

            if iIDParcela > 0 then sSQL := sSQL + ' AND IDPARCFINANCIMOV = ' + IntToStr(iIDParcela);
            if iIdContrato > 0 then sSql := sSql + ' AND IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);

            if iCodDocumentoAjuste > 0 then sSql := sSql + ' AND CODDOCUMENTO = ' + IntToStr(iCodDocumentoAjuste);

            if bSimula then
              sSql := sSql + ' AND FLGTIPO = ''S'' ' +#13
            else
              // Alterado por FHBS - SOL: 136336 KTN: 815081 - Para não excluir os recalculos.
              sSql := sSql + ' AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') ' +#13;

            if not ExecSQL( sSql ) then raise exception.create( MessageInfo );
         end;

         // Exclui os lançamentos da LANCOPERIMOB
         if (iCodDocumentoAjuste <= 0) and not(bSimula) then
         begin
            if not bTrataApenasDia then
            begin
               sSql := 'DELETE FROM LANCOPERIMOB '+#13+
                       ' WHERE DATAOPER >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13+ sParam;
            end
            else
            begin
               sSql := 'DELETE FROM LANCOPERIMOB '+#13+
                       ' WHERE DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13+ sParam;
            end;

            if iIdContrato > 0 then sSql := sSql + ' AND IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);
            
            if not ExecSQL( sSql ) then raise exception.create( MessageInfo );
         end;

         DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, 'Exclusão Concluída...']);
      except
         on e : Exception do begin
            Result := False;
            MessageInfo := e.message;
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;


function TCtrlOperImob.ExcluiAlterIndevido(sNomeBilhete: string; const dLimite: TDateTime): Boolean;
var cdsTemp : TCMClientDataSet;
    i, iAtual, iQuant : Integer;
    sData, sSql : String;
begin
   Result := True;
   try
      try
         sData := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'')';

         // Busca os alteradores a serem excluídos
         if ParamSistema.idModulo = 64 then begin
            sSql := 'SELECT DISTINCT L.CODDOCUMENTO, L.NUMLANCTO '+#13+
                    '  FROM DOCUMENTO D, LANCTODOCUM L, LANCAMENTOSIMOVEL I, TIPOIMOVEL T '+#13+
                    ' WHERE D.CODDOCUMENTO = L.CODDOCUMENTO '+#13+
                    '   AND D.CODDOCUMENTO = I.CODDOCUMENTO '+#13+
                    '   AND I.CODTIPIMOVEL = T.CODTIPIMOVEL '+#13+
                    '   AND RTRIM(L.OPERACAO) = ''4''       '+#13+
                    '   AND L.ESTORNO IS NULL               ' +#13+
                    '   AND D.IDMODULO = '+ IntToStr(ParamSistema.idModulo) +#13+
                    '   AND D.DATAVENCTO >= ' + sData              +#13+
                    '   AND L.DATALANCTO >  ' + sData              +#13+
                    '   AND ( L.CODALTERADOR = T.CODALTMULTA OR   '+#13+
                    '         L.CODALTERADOR = T.CODALTJUROS OR   '+#13+
                    '         L.CODALTERADOR = T.CODALTCORRMON )  '+#13+
                    '   AND D.CODDOCUMENTO NOT IN ( SELECT CODDOCUMENTO             '+#13+
                    '                                 FROM EVENTOIMOVEL             '+#13+
                    '                                WHERE CODDOCUMENTO IS NOT NULL '+#13+
                    '                                  AND FLGTIPOEVENTO = ''RD''   '+#13+
                    '                                  AND EVIDATA >= ' + sData + ')';
         end else begin
            sSql := 'SELECT /*+index(p,xie1parcfinancimov) index(l,xie4lanctodocum) */  '+#13+
                    '       DISTINCT L.CODDOCUMENTO, L.NUMLANCTO '+#13+
                    '  FROM DOCUMENTO D, LANCTODOCUM L, PARCFINANCIMOV P, TIPOIMOVEL T, '+#13+
                    '       CONDPAGIMOVEL CP, CONTRATOXIMOVEL CXI, IMOVEL I             '+#13+
                    ' WHERE D.CODDOCUMENTO = L.CODDOCUMENTO            ' +#13+
                    '   AND D.CODDOCUMENTO = P.CODDOCUMENTO            ' +#13+
                    '   AND P.IDCONDPAGIMOVEL = CP.IDCONDINICIAL       ' +#13+
                    '   AND CP.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL ' +#13+
                    '   AND CXI.IDIMOVEL = I.IDIMOVEL                  ' +#13+
                    '   AND I.CODTIPIMOVEL = T.CODTIPIMOVEL            ' +#13+
                    '   AND RTRIM(L.OPERACAO) = ''4''                  ' +#13+
                    '   AND L.ESTORNO IS NULL                          ' +#13+
                    '   AND D.IDMODULO = '+ IntToStr(ParamSistema.idModulo) +#13+
                    '   AND D.DATAVENCTO >= ' + sData              +#13+
                    '   AND L.DATALANCTO >  ' + sData              +#13+
                    '   AND ( L.CODALTERADOR = T.CODALTMTAL OR   '+#13+
                    '         L.CODALTERADOR = T.CODALTJRAL OR   '+#13+
                    '         L.CODALTERADOR = T.CODALTCMAL )  '+#13+
                    '   AND D.CODDOCUMENTO NOT IN ( SELECT CODDOCUMENTO             '+#13+
                    '                                 FROM EVENTOIMOVEL             '+#13+
                    '                                WHERE CODDOCUMENTO IS NOT NULL '+#13+
                    '                                  AND FLGTIPOEVENTO = ''RD''   '+#13+
                    '                                  AND EVIDATA >= ' + sData + ')';
         end;

         if iCodDocumentoAjuste > 0 then sSql := sSql + ' AND D.CODDOCUMENTO = ' + IntToStr(iCodDocumentoAjuste);

         cdsTemp := TCMClientDataSet.Create( nil );
         cdsTemp.Data := GetDataPacket( sSql );
         if bGeraLog then writeLn(ArqLog, 'AbreQuery: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );

         // Exclui os alteradores de documentos que ainda não venceram
         if not cdsTemp.IsEmpty then begin
            cdsTemp.First;
            // força um do progresso para montar a tela
            iAtual := 1;
            iQuant := cdsTemp.RecordCount;
            DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dLimite) + ' - Excluindo alteradores de documentos vincendo...']);
            while not cdsTemp.Eof do
            begin
               {CtrlDocumento.Prepare(OpLanctoDocum, odlAlterador);
               CtrlDocumento.UsaPlanoPatro         := ParamSistema.UsaPlanoPatro;
               CtrlDocumento.CodDocumento          := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
               CtrlDocumento.Lanctodocum.NumLancto := cdsTemp.FieldByName('NUMLANCTO').AsInteger;

               if not CtrlDocumento.Delete then begin
                  DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, 'Doc: ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                          CtrlDocumento.MessageInfo]);}
               CtrlImobDocumento.Prepare(OpLanctoDocumImob, odlAlteradorImob);
               CtrlImobDocumento.UsaPlanoPatro         := ParamSistema.UsaPlanoPatro;
               CtrlImobDocumento.CodDocumento          := cdsTemp.FieldByName('CODDOCUMENTO').AsInteger;
               CtrlImobDocumento.Lanctodocum.NumLancto := cdsTemp.FieldByName('NUMLANCTO').AsInteger;

               if not CtrlImobDocumento.Delete then
               begin
                  DoProgresso ([sNomeBilhete, iAtual, iQuant, -1, -1, 'Doc: ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString + ' - ' +
                                CtrlImobDocumento.MessageInfo]);
               end;
               if bGeraLog then writeLn(ArqLog, 'Doc: ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString + ': ' + FormatDateTime('dd/mm/yyyy hh:mm:ss',now) );
               cdsTemp.Next;
            end;
         end;
      except
        on e : Exception do begin
           Result := False;
           MessageInfo := e.message;
        end;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;



function TCtrlOperImob.LookupAtualizaDocs(const dDataLancto: TDateTime;
                                          const iIdOperMulta, iIdOperJuros, iIdOperCM: Integer;
                                          const iIDOperAbonoMulta : Integer = -1;
                                          const iIDOperAbonoJuros : Integer = -1;
                                          const iIDOperAbonoCM    : Integer = -1) : OLEVariant;
var sSql, sParam, sParamAbono, sParamAbono1, sData : String;
begin
   // Define Parametros
   sData          := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLancto)) + ',''DD/MM/YYYY'')' +#13;

   sParam         := ' AND L.IDMODULO = ' + IntToStr( ParamSistema.idModulo ) +#13+
                     ' AND L.IDOPERACAO IN(' + IntToStr(iIdOperMulta) + ',' +
                                               IntToStr(iIdOperJuros) + ',' +
                                               IntToStr(iIdOperCM) + ') ' +#13;

   sParamAbono := ' AND L.IDMODULO = ' + IntToStr( ParamSistema.idModulo ) +#13+
                  ' AND L.IDOPERACAO IN(' + IntToStr(iIdOperAbonoMulta) + ',' +
                                            IntToStr(iIdOperAbonoJuros) + ',' +
                                            IntToStr(iIdOperAbonoCM) + ') ' +#13;

   sParamAbono1 := ' AND IDMODULO = ' + IntToStr( ParamSistema.idModulo ) +#13+
                   ' AND IDOPERACAO IN(' + IntToStr(iIdOperAbonoMulta) + ',' +
                                            IntToStr(iIdOperAbonoJuros) + ',' +
                                            IntToStr(iIdOperAbonoCM) + ') ' +#13;

   if iCodDocumentoAjuste > 0 then sParam       := sParam       + ' AND L.CODDOCUMENTO = ' + IntToStr(iCodDocumentoAjuste) +#13;
   if iCodDocumentoAjuste > 0 then sParamAbono  := sParamAbono  + ' AND L.CODDOCUMENTO = ' + IntToStr(iCodDocumentoAjuste) +#13;
   if iCodDocumentoAjuste > 0 then sParamAbono1 := sParamAbono1 + ' AND CODDOCUMENTO = ' + IntToStr(iCodDocumentoAjuste) +#13;

   sSQL :=
   'SELECT DOC.DATAOPER, '                                                                                                 + #13 +
   '       DOC.DATABAIXA, '                                                                                                + #13 +
   '       DOC.CODDOCUMENTO, '                                                                                             + #13 +
   '       DOC.IDPARCFINANCIMOV, '                                                                                         + #13 +
   '       DOC.CODTIPIMOVEL, '                                                                                             + #13 +
   '       DOC.ULTABONO, '                                                                                                 + #13 +
   '       MUL.VLRACUM AS VLRACUM_MUL, '                                                                                   + #13 +
   '       JUR.VLRACUM AS VLRACUM_JUR, '                                                                                   + #13 +
   '       COR.VLRACUM AS VLRACUM_COR, '                                                                                   + #13 +
   '       (NVL(MUL.VLRACUM,0) + NVL(JUR.VLRACUM,0) + NVL(COR.VLRACUM,0)) AS VLRTOTAL '                                    + #13 +
   '  FROM ( '                                                                                                             + #13 +
   '        SELECT DATAOPER, DATABAIXA, L.CODDOCUMENTO, CODTIPIMOVEL, IDPARCFINANCIMOV, NULL AS ULTABONO, '                + #13 +
   '               TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) AS CHAVE '                             + #13 +
   '          FROM LANCOPERDIAIMOB L '                                                                                     + #13 +
   '         WHERE L.CODDOCUMENTO IS NOT NULL '                                                                            + #13 +
   '           AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND L.DATAOPER = ' + sData + sParam +
   '         GROUP BY DATAOPER, DATABAIXA, L.CODDOCUMENTO, CODTIPIMOVEL, IDPARCFINANCIMOV, '                               + #13 +
   '                  TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) '                                   + #13 +
   '        UNION ' + #13 +
   '        SELECT DATAOPER, DATABAIXA, L.CODDOCUMENTO, CODTIPIMOVEL, IDPARCFINANCIMOV, L.DATAOPER AS ULTABONO, ' + #13 +
   '               TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) AS CHAVE ' + #13 +
   '        FROM LANCOPERDIAIMOB L, DOCUMENTO D ' + #13 +
   '        WHERE (L.CODDOCUMENTO,L.DATAOPER) IN (SELECT CODDOCUMENTO, MAX(DATAOPER) AS ULTDATA ' + #13 +
   '                                              FROM LANCOPERDIAIMOB ' + #13 +
   '                                              WHERE CODDOCUMENTO IS NOT NULL ' + #13 +
   '                                                    AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND DATAOPER <= ' + sData + sParamAbono1 + #13 +
   '                                              GROUP BY CODDOCUMENTO) ' + #13 +
   '              AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND L.CODDOCUMENTO     = D.CODDOCUMENTO ' + #13 +
   '              AND D.FLGNAOCONCILIADO IS NULL ' + #13 +
   '              AND TRIM(D.STATUS)     = ''0'' ' + #13 + sParamAbono + #13 +
   '        GROUP BY DATAOPER, DATABAIXA, L.CODDOCUMENTO, CODTIPIMOVEL, IDPARCFINANCIMOV, L.DATAOPER, ' + #13 +
   '                 TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) ' + #13 +
   '       ) DOC, '                                                                                                        + #13 +
   '       ( ' + #13 +
   '       SELECT L.CODDOCUMENTO, ' + #13 +
   '              DATABAIXA,'+ #13 +
   '              TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) AS CHAVE,'+ #13 +
   '              SUM(VLRACUM) AS VLRACUM'+ #13 +
   '       FROM LANCOPERDIAIMOB L'+ #13 +
   '       WHERE IDOPERACAO = ' + IntToStr(iIDOperMulta)                                                         + #13 +
   '             AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.IdModulo)                                                + #13 +
   '             AND (L.CODDOCUMENTO,L.DATAOPER) IN (SELECT CODDOCUMENTO, MAX(DATAOPER) AS ULTDATA '+ #13 +
   '                                                 FROM LANCOPERDIAIMOB '+ #13 +
   '                                                 WHERE IDOPERACAO = ' + IntToStr(iIDOperMulta)                                                         + #13 +
   '                                                       AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.IdModulo)                                                + #13 +
   '                                                       AND CODDOCUMENTO IS NOT NULL '+ #13 +
   '                                                       AND DATAOPER <= ' + sData +
   '                                                 GROUP BY CODDOCUMENTO) '+ #13 +
   '       GROUP BY L.CODDOCUMENTO, DATABAIXA, TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) '+ #13 +
   '       ) MUL, '                                                                                                        + #13 +
   '       ( '                                                                                                             + #13 +
   '       SELECT L.CODDOCUMENTO, ' + #13 +
   '              DATABAIXA,'+ #13 +
   '              TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) AS CHAVE,'+ #13 +
   '              SUM(VLRACUM) AS VLRACUM'+ #13 +
   '       FROM LANCOPERDIAIMOB L'+ #13 +
   '       WHERE IDOPERACAO = ' + IntToStr(iIDOperJuros)                                                         + #13 +
   '             AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.IdModulo)                                                + #13 +
   '             AND (L.CODDOCUMENTO,L.DATAOPER) IN (SELECT CODDOCUMENTO, MAX(DATAOPER) AS ULTDATA '+ #13 +
   '                                                 FROM LANCOPERDIAIMOB '+ #13 +
   '                                                 WHERE IDOPERACAO = ' + IntToStr(iIDOperJuros)                                                         + #13 +
   '                                                       AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.IdModulo)                                                + #13 +
   '                                                       AND CODDOCUMENTO IS NOT NULL '+ #13 +
   '                                                       AND DATAOPER <= ' + sData +
   '                                                 GROUP BY CODDOCUMENTO) '+ #13 +
   '       GROUP BY L.CODDOCUMENTO, DATABAIXA, TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) '+ #13 +
   '       ) JUR, '                                                                                                        + #13 +
   '       ( '                                                                                                             + #13 +
   '       SELECT L.CODDOCUMENTO, ' + #13 +
   '              DATABAIXA,'+ #13 +
   '              TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) AS CHAVE,'+ #13 +
   '              SUM(VLRACUM) AS VLRACUM'+ #13 +
   '       FROM LANCOPERDIAIMOB L'+ #13 +
   '       WHERE IDOPERACAO = ' + IntToStr(iIDOperCM)                                                         + #13 +
   '             AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.IdModulo)                                                + #13 +
   '             AND (L.CODDOCUMENTO,L.DATAOPER) IN (SELECT CODDOCUMENTO, MAX(DATAOPER) AS ULTDATA '+ #13 +
   '                                                 FROM LANCOPERDIAIMOB '+ #13 +
   '                                                 WHERE IDOPERACAO = ' + IntToStr(iIDOperCM)                                                         + #13 +
   '                                                       AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDMODULO = ' + IntToStr(ParamSistema.IdModulo)                                                + #13 +
   '                                                       AND CODDOCUMENTO IS NOT NULL '+ #13 +
   '                                                       AND DATAOPER <= ' + sData +
   '                                                 GROUP BY CODDOCUMENTO) '+ #13 +
   '       GROUP BY L.CODDOCUMENTO, DATABAIXA, TO_CHAR(L.CODDOCUMENTO)||RTRIM(CODTIPIMOVEL)||TO_CHAR(DATABAIXA) '+ #13 +
   '       ) COR '                                                                                                         + #13 +
   ' WHERE (DOC.CHAVE = MUL.CHAVE(+) ) '                                                                                   + #13 +
   '   AND (DOC.CHAVE = JUR.CHAVE(+) ) '                                                                                   + #13 +
   '   AND (DOC.CHAVE = COR.CHAVE(+) ) '                                                                                   + #13 +
   ' ORDER BY CODDOCUMENTO, DATABAIXA '                                                                                    + #13;

   Result := GetDataPacket( sSql );
end;


function TCtrlOperImob.LookupLancOperDiaImob(const iIdOper:Integer; const dDataOper, dDataBaixa: TDateTime; const sTipoImovel: String;
                                             const iIdContrato, iIdForCli, iCodDocumento, iIdParcFinancImov:Integer;
                                             const iIdPlanoPrev: integer = -1; const iIdPatro: integer = -1): OleVariant;
var sSql, sParam, sData: string;
begin
  // Define Parametros
  sData  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13;
  sParam := '   AND L.DATAOPER     = ' + sData +#13;
  if sTipoImovel     <> ''  then sParam := sParam + '   AND L.CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);
  if iIdContrato       > 0  then sParam := sParam + '   AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);
  if iIdForCli         > 0  then sParam := sParam + '   AND L.IDFORCLI = ' + IntToStr(iIdForCli);
  if iCodDocumento     > 0  then
       sParam := sParam + '   AND L.CODDOCUMENTO = ' + IntToStr(iCodDocumento)
  else sParam := sParam + '   AND L.CODDOCUMENTO IS NULL ';
  if iIdParcFinancImov > 0  then
       sParam := sParam + '   AND L.IDPARCFINANCIMOV = ' + IntToStr(iIdParcFinancImov)
  else sParam := sParam + '   AND L.IDPARCFINANCIMOV IS NULL ';

  if dDataBaixa > 0 then begin
     sData  := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataBaixa)) + ',''DD/MM/YYYY'')' +#13;
     sParam := sParam + ' AND L.DATABAIXA = ' + sData +#13;
  end else begin
     sParam := sParam + ' AND L.DATABAIXA IS NULL '+#13;
  end;

  if iIdPlanoPrev <> -1 then
    sParam := sParam + ' AND L.IDPLANOPREV = ' + IntToStr(iIdPlanoPrev);

  if iIdPatro <> -1 then
    sParam := sParam + ' AND L.IDPATRO = ' + IntToStr(iIdPatro);

  // Define Sql
  sSql  := 'SELECT L.* ' +#13+
           '  FROM LANCOPERDIAIMOB L ' +#13+
           ' WHERE L.IDMODULO     = ' + IntToStr(ParamSistema.IdModulo) +#13+
           '   AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND L.IDOPERACAO   = ' + IntToStr(iIdOper) +#13+ sParam;
  Result := GetDataPacket( sSql );
end;

function TCtrlOperImob.LookupLancOperContImob(const dDataLancto: TDateTime): OleVariant;
var sSql, sData: string;
begin
  // Define Sql
  sData := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLancto)) + ',''DD/MM/YYYY'')' +#13;
  sSql  := 'SELECT * ' +#13+
           '  FROM LANCOPERCONTIMOB ' +#13+
           ' WHERE IDMODULO   = ' + IntToStr(ParamSistema.IdModulo) +#13+
           '   AND DATALANCTO = ' + sData;
  Result := GetDataPacket( sSql );
end;

function TCtrlOperImob.BuscaProvisaoAIntegrar(const vIdOper: Array of Integer; const dDataOper: TDateTime;
                                              const sTipoImovel: String): OLEVariant;
var sSql, sData, sParam : String;
    i : Integer;
begin
  // Define Parametros
  sParam := ' AND L.IDMODULO = '+ IntToStr(ParamSistema.idModulo) +#13+
            ' AND L.DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13;
  if sTipoImovel <> '' then sParam := sParam + ' AND L.CODTIPIMOVEL = '+ QuotedStr(sTipoImovel) +#13;

  // Define os tipos de operação a integrar
  sParam := sParam + ' AND L.IDOPERACAO IN (';
  for i := 0 to Length(vIdOper)-1 do begin
    if vIdOper[i] > 0 then sParam := sParam + IntToStr(vIdOper[i]) + ',';
  end;
  sParam := Copy(sParam,1,Length(sParam)-1) + ')';

  // Define Sql
  sSql := 'SELECT L.IDOPERACAO,      L.CODTIPIMOVEL, L.DATAOPER, L.IDCONTRATOIMOVEL, '+#13+
          '       T.DESCCUSTORECIMO, C.PLNCODIGO,    C.IDLANCOPERCONTIMO,            '+#13+
          '       CI.CONNUMERO,      CI.CONNOME,     L.VLRDIA,                       '+#13+
          //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
          '       L.IDPATRO, L.IDPLANOPREV                                          '+#13+
          //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim
          '  FROM LANCOPERIMOB L,        '+#13+
          '       LANCOPERCONTIMOB C,    '+#13+
          '       TIPOCUSTORECIMOV T,    '+#13+
          '       CONTRATOIMOVEL CI     '+#13+
          ' WHERE L.IDLANCOPERCONTIMO = C.IDLANCOPERCONTIMO '+#13+
          '   AND L.IDOPERACAO = T.IDTIPOCUSTORECIMO '+#13+
          '   AND L.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL(+) '+#13+
          '   AND NVL(L.VLRDIA,0) <> 0 ' +#13+
          '   AND L.LANCNUMLAN IS NULL ' +#13+ sParam;

  Result := GetDataPacket( sSql );
end;

function TCtrlOperImob.LookupReprocessamento(const vIdOper: array of Integer;
                                             const dDataOper: TDateTime; const bTrataApenasDia : Boolean = False;
                                             const iIdContrato:Integer = -1): OLEVariant;
var sSql, sParam :String;
    i : Integer;
begin
  // Define Parametros
  sParam := ' AND L.IDMODULO = '+ IntToStr(ParamSistema.idModulo) +#13;

  if not bTrataApenasDia then
     sParam := sParam + ' AND L.DATAOPER >= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13
  else
     sParam := sParam + ' AND L.DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataOper)) + ',''DD/MM/YYYY'')' +#13;

  if iIDContrato > 0 then
     sParam := sParam + ' AND L.IDCONTRATOIMOVEL = ' + IntToStr(iIDContrato) +#13;

  // Define os tipos de operação a reprocessar
  sParam := sParam + ' AND L.IDOPERACAO IN (';
  for i := 0 to Length(vIdOper)-1 do begin
    if vIdOper[i] > 0 then sParam := sParam + IntToStr(vIdOper[i]) + ',';
  end;
  sParam := Copy(sParam,1,Length(sParam)-1) + ')';

  // Define Sql
  sSql := 'SELECT DISTINCT C.DATALANCTO, C.PLNCODIGO, L.LANCNUMLAN '+#13+
          '  FROM LANCOPERIMOB L, '+#13+
          '       LANCOPERCONTIMOB C '+#13+
          ' WHERE L.IDLANCOPERCONTIMO = C.IDLANCOPERCONTIMO(+) '+#13+ sParam;

  Result := GetDataPacket( sSql );
end;


function TCtrlOperImob.LookupResumeLancOper(const vIdOper:Array of Integer; const dDataLancto: TDateTime; const iTipoResumo:Integer; const iContrato : Integer): OLEVariant;
var sSql, sParam : String;
    i : Integer;
begin
  // TipoResumo = 1 - Atualizações de Docs Vencidos e Prov. de Perdas - Por Segmento
  //              2 - Provisão de Receitas de Locação - Por Contrato

  // Define Parametros
  sParam := ' AND IDMODULO = '+ IntToStr(ParamSistema.idModulo) +#13+
            ' AND DATAOPER = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLancto)) + ',''DD/MM/YYYY'')' +#13;

  if iContrato > 0 then
  sParam := sParam + 'AND IDCONTRATOIMOVEL = ' + IntToStr(iContrato);

  // Define os tipos de operação a resumir
  sParam := sParam + ' AND IDOPERACAO IN (';
  for i := 0 to Length(vIdOper)-1 do begin
    if vIdOper[i] > 0 then sParam := sParam + IntToStr(vIdOper[i]) + ',';
  end;
  sParam := Copy(sParam,1,Length(sParam)-1) + ')';

  //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
  // Define Sql
  sSql := 'SELECT IDMODULO, DATAOPER, IDOPERACAO, CODTIPIMOVEL, IDPLANOPREV, IDPATRO,' +#13;
  if iTipoResumo = 2 then sSql := sSql + '  IDCONTRATOIMOVEL, ';

  sSql := sSql +  '       SUM(VLRDIA) AS TOT_VLRDIA '+#13+
                  '  FROM LANCOPERDIAIMOB ' +#13+
                  ' WHERE 1=1 AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') ' +#13+ sParam +
                  ' GROUP BY IDMODULO, DATAOPER, IDOPERACAO , CODTIPIMOVEL,IDPATRO, IDPLANOPREV ';
  //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim
  if iTipoResumo = 2 then sSql := sSql + ', IDCONTRATOIMOVEL';

  CMDebugToFile(sSQL, Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LookupResumeLancOper'+IntToStr(iTipoResumo)+'.log');

  Result := GetDataPacket( sSql );
end;

// Daniel - 22056 - Início -----------------------------------------------------
function TCtrlOperImob.UltimoFechamento: TDateTime;
{ Essa função foi modificada, sua versão anterior está comentada abaixo.
  As mudanças devem-se ao fato desta função não está usando nenhuma
  parametrização, por isso elas foram retiradas da mesma.
  >> Daniel Simões - 24/05/2007 }
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
   try
      cdsTemp := TCMClientDataSet.Create( nil );
      sSql    := 'SELECT DTULTFECH ' +#13;
      if ( ParamSistema.IdModulo=64 ) then
        sSql := sSql+'FROM PARAMIMOVEL ' +#13;
      if ( ParamSistema.IdModulo=135 ) then
        sSql := sSql+'FROM PARAMALIENACAO ' +#13;

      cdsTemp.Data := GetDataPacket( sSql );
   finally
      Result := cdsTemp.FieldByName('DTULTFECH').AsDateTime;
      FreeAndNil( cdsTemp );
   end;
end;

// Daniel - 22056 - Fim --------------------------------------------------------

procedure TCtrlOperImob.SetdbLancOperDiaImob(const Value: TDbLancOperDiaImob);
begin
  FdbLancOperDiaImob := Value;
end;

procedure TCtrlOperImob.SetdbLancOperContImob(const Value: TDbLancOperContImob);
begin
  FdbLancOperContImob := Value;
end;

procedure TCtrlOperImob.SetdbLancOperImob(const Value: TDbLancOperImob);
begin
  FdbLancOperImob := Value;
end;



function TCtrlOperImob.CalculaJurosAlienacao(      sNomeBilhete : string;
                                             const iIdOper      : Integer;
                                             const dData        : TDateTime = -1;
                                             const sTipoImovel  : String = '';
                                             const sTipoContrato: String = ''
                                            ): Boolean;
var
   cdsContrato    : TCMClientDataSet;
   cdsParcela     : TCMClientDataSet;
   dDataParcAnt   : TDateTime;
   dDataParcPos   : TDateTime;
   fVlrJurPos     : Currency;
   fVlrJurDia     : Currency;
   fVlrJurLanc    : Currency;
   fVlrJurAcum    : Currency;
   iDifDiasTotal  : Integer;
   iDifDiasAnt    : Integer;
   iAtual         : Integer;
   iQuant         : Integer;
   IDParcela      : Integer;
   sSQL           : String;
   //Cássio - SOL Nº92381 KINTANA Nº394180
   //cdsTemp        : TCmClientDataSet;
   //fSegJuros, fTotJuros,
   //fLancSegJuros, fLancTotJuros : Currency;
begin
   cdsContrato := TCMClientDataSet.Create(nil);
   cdsParcela  := TCMClientDataSet.Create(nil);
   //cdsTemp     := TCMClientDataSet.Create(nil);
   try
      try
         StartTransaction;

         // ----------------------------------------------------------------------------------------
         // Exclui lançamentos anteriores se for um Reprocessamento
         if not(Reprocessamento(sNomeBilhete, [iIdOper], dData)) then
         begin
            raise Exception.Create(MessageInfo);
         end;

         // ----------------------------------------------------------------------------------------
         // Busca Contratos de Alienação vigentes
         cdsContrato.Data  := CtrlParcFinancImov.LookupAlienacaoAtiva(dData, 1, False, sTipoContrato);
         // ----------------------------------------------------------------------------------------

         iAtual := 1;
         iQuant := cdsContrato.RecordCount;

         DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dData) + ' - Calculando Juros de Alienação...']);
         // ----------------------------------------------------------------------------------------

         // Grava valores por contrato em LANCOPERDIAIMOB
         cdsContrato.First;
         while not(cdsContrato.EOF) do
         begin
            // -------------------------------------------------------------------------------------

            // Seleciona a prestação imediatamente posterior
            cdsParcela.Data   := CtrlParcFinancImov.LookupParcelaAntPos(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                        cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                        dData,
                                                                        2   // Posterior
                                                                       );

            if cdsParcela.isEmpty then
            begin
               cdsContrato.Next;
               Continue;
            end;

            if (cdsParcela.FieldByName('VLRJUROS').AsCurrency +
                cdsParcela.FieldByName('VLRJUROSPARC').AsCurrency) = 0 then
            begin
               cdsContrato.Next;
               Continue;
            end;

            // Armazena a prestação posterior
            dDataParcPos      := cdsParcela.FieldByName('DATAVENCIMENTO').AsDateTime;
            IDParcela         := cdsParcela.FieldByName('IDPARCFINANCIMOV').AsInteger;
            fVlrJurPos        := cdsParcela.FieldByName('VLRJUROS').AsCurrency +
                                 cdsParcela.FieldByName('VLRJUROSPARC').AsCurrency;

            // -------------------------------------------------------------------------------------

            // Seleciona a prestação imediatamente anterior
            cdsParcela.Data   := CtrlParcFinancImov.LookupParcelaAntPos(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                        cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                        dData,
                                                                        1   // Anterior
                                                                       );

            if cdsParcela.isEmpty then
            begin
               cdsContrato.Next;
               Continue;
            end;

            // Armazena a data da prestação anterior
            dDataParcAnt      := cdsParcela.FieldByName('DATAVENCIMENTO').AsDateTime;

            // -------------------------------------------------------------------------------------

            if dData = dDataParcPos then
            begin
               // (se for na data da parcela, é o valor de juros da parcela, integral)
               fVlrJurLanc    := fVlrJurPos;
            end
            else // dData < dDataParcPos
            begin
               // Calcula as quantidades de dias
               iDifDiasTotal  := trunc(dDataParcPos) - trunc(dDataParcAnt);
               iDifDiasAnt    := trunc(dData) - trunc(dDataParcAnt);

               // Calcula o valor de juros de 1 dia
               fVlrJurDia     := fVlrJurPos / iDifDiasTotal;

               // Calcula o valor total de juros a lançar até a data (arredondado)
               fVlrJurLanc    := fVlrJurDia * (iDifDiasAnt + 1);
               fVlrJurLanc    := (round(fVlrJurLanc * Power(10, 2))) / Power(10, 2);
            end;

            // -------------------------------------------------------------------------------------
            // Totaliza o valor de juros já lançados (desde a data da prestação anterior)
            fVlrJurAcum       := ValorAcumOper(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                               IDParcela,
                                               iIDOper,
                                               dDataParcAnt,
                                               dData
                                              );

            // -------------------------------------------------------------------------------------

            // Subrai o valor total já lançado do valor total a lançar até a data
            fVlrJurLanc       := fVlrJurLanc - fVlrJurAcum;

            // -------------------------------------------------------------------------------------

            //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
            //cdsTemp.Data := LookupPlanosxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger);
           // cdsTemp.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger);

            {if cdsTemp.RecordCount >= 1 then
            begin
              while not cdsTemp.Eof do
              begin
                if cdsTemp.RecNo = cdsTemp.RecordCount then
                begin
                  fSegJuros := fVlrJurLanc - fTotJuros;
                  fLancSegJuros := (fVlrJurLanc + fVlrJurAcum) - fLancTotJuros;
                end
                else
                begin
                  fSegJuros := ComunsImobiliario.Arredonda((fVlrJurLanc * cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
                  fLancSegJuros := ComunsImobiliario.Arredonda(((fVlrJurLanc + fVlrJurAcum)* cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
                end;
                fTotJuros := fTotJuros + fSegJuros;
                fLancTotJuros := fLancTotJuros + fLancSegJuros;


                // Lança a diferença
                if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                            -1,                                                     // dDataBaixa
                                            iIDOper,                                                // iIdOper
                                            //ComunsImobiliario.Arredonda(((fVlrJurLanc * cdsTemp.FieldByName('PERCENTRATEIO').AsFloat)/ 100), 2), // fVlrDia,
                                            fSegJuros,
                                            //(fVlrJurLanc + fVlrJurAcum),                            // fVlrAcum
                                            //(fVlrJurLanc + fVlrJurAcum),                            // fVlrTotAcum ???
                                            fLancSegJuros,
                                            fLancSegJuros,
                                            cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                            cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                            cdsContrato.FieldByName('IDLOCATARIO').AsInteger,       // iIdForCli
                                            -1                                                      // iCodDocum
                                            False,                                                  // bGravaDiaNull
                                            IDParcela,                                              // IDParcela
                                            -1,                                                     // idCondPag
                                            False,                                                  // bSimula
                                            cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                            cdsTemp.FieldByName('IDPLANOPREV').AsInteger            // IdPlanoPrev
                                            )) then
                begin
                  Raise Exception.Create(MessageInfo);
                end;
                cdsTemp.Next;
              end;
            end
            else
            begin}
              // Lança a diferença
              if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                          -1,                                                     // dDataBaixa
                                          iIDOper,                                                // iIdOper
                                          fVlrJurLanc,                                            // fVlrDia,
                                          (fVlrJurLanc + fVlrJurAcum),                            // fVlrAcum
                                          (fVlrJurLanc + fVlrJurAcum),                            // fVlrTotAcum ???
                                          cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                          cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                          cdsContrato.FieldByName('IDLOCATARIO').AsInteger,       // iIdForCli
                                          -1                                                      // iCodDocum
                                          False,                                                  // bGravaDiaNull
                                          IDParcela                                               // IDParcela
                                           )) then
              begin
                 Raise Exception.Create(MessageInfo);
              end;
            //end;

            // o último parâmetro será utilizado para passar a mensagem do processamento
            inc(iAtual);
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1]);

            cdsContrato.Next;

         end;

         // ----------------------------------------------------------------------------------------
         // Resume os Lançamentos em LancOperImob
         if not(GravaLancOperImob(sNomeBilhete, [iIdOper], dData, 1)) then
         begin
            raise Exception.Create(MessageInfo);
         end;

         Commit;
         Result := True;

      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
         end;
      end;

   finally
      FreeAndNil(cdsContrato);
      FreeAndNil(cdsParcela);
      //FreeAndNil(cdsTemp);

      if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)) // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
   end;
end;



function TCtrlOperImob.ValorAcumOper(const IDContratoImovel : Integer;
                                     const IDParcela        : Integer;
                                     const IDOper           : Integer;
                                     const dDataIni         : TDateTime;
                                     const dDataFim         : TDateTime
                                    ): Currency;
var
   cds      : TCMClientDataSet;
   sSQL     : String;
   sDataIni : String;
   sDataFim : String;
begin
   sDataIni := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataIni)) + ', ''DD/MM/YYYY'')';
   sDataFim := 'TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataFim)) + ', ''DD/MM/YYYY'')';

   try
      cds := TCMClientDataSet.Create(nil);

      sSQL :=
      'SELECT '                                                   + #13 +
      '   SUM(VLRDIA) AS VALOR_ACUM '                             + #13 +
      'FROM '                                                     + #13 +
      '   LANCOPERDIAIMOB '                                       + #13 +
      'WHERE '                                                    + #13 +
      '       IDCONTRATOIMOVEL  = ' + IntToStr(IDContratoImovel)  + #13 +
      '   AND (FLGTIPO IS NULL OR FLGTIPO <> ''S'') AND IDPARCFINANCIMOV  = ' + IntToStr(IDParcela)         + #13 +
      '   AND IDOPERACAO        = ' + IntToStr(IDOper)            + #13 +
      '   AND DATAOPER          > ' + sDataIni                    + #13 +
      '   AND DATAOPER         <= ' + sDataFim;

      cds.Data := GetDataPacket(sSQL);
      Result   := cds.FieldByName('VALOR_ACUM').AsCurrency;

   finally
      FreeAndNil(cds);
   end;
end;



function TCtrlOperImob.CalculaCMAlienacao(      sNomeBilhete : string;
                                          const iIdOper      : Integer;
                                          const dData        : TDateTime = -1;
                                          const sTipoImovel  : String = '';
                                          const sTipoContrato: String = ''
                                         ): Boolean;
var
   cdsContrato    : TCMClientDataSet;
   cdsParcela     : TCMClientDataSet;
   dDataParcAnt   : TDateTime;
   dDataParcPos   : TDateTime;
   fVlrCorPos     : Currency;
   fVlrCorDia     : Currency;
   fVlrCorLanc    : Currency;
   fVlrCorAcum    : Currency;
   iDifDiasTotal  : Integer;
   iDifDiasAnt    : Integer;
   iAtual         : Integer;
   iQuant         : Integer;
   IDParcela      : Integer;
   sSQL           : String;
   //Cássio - SOL Nº92381 KINTANA Nº394180
   //cdsTemp        : TCMClientDataSet;
   //fSegCM, fTotCM,
   //fLancSegCM, fLancTotCM : Currency;
begin
   cdsContrato := TCMClientDataSet.Create(nil);
   cdsParcela  := TCMClientDataSet.Create(nil);
   //cdsTemp     := TCMClientDataSet.Create(nil);
   try
      try
         StartTransaction;

         // ----------------------------------------------------------------------------------------
         // Exclui lançamentos anteriores se for um Reprocessamento
         if not(Reprocessamento(sNomeBilhete, [iIdOper], dData)) then
         begin
            raise Exception.Create(MessageInfo);
         end;

         // ----------------------------------------------------------------------------------------
         // Busca Contratos de Alienação vigentes
         cdsContrato.Data  := CtrlParcFinancImov.LookupAlienacaoAtiva(dData, 2, False, sTipoContrato);
         // ----------------------------------------------------------------------------------------

         iAtual := 1;
         iQuant := cdsContrato.RecordCount;

         DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dData) + ' - Calculando Correção Monetária de Alienação...']);

         // Grava valores por contrato em LANCOPERDIAIMOB
         cdsContrato.First;
         while not(cdsContrato.EOF) do
         begin

            // Seleciona a prestação imediatamente posterior
            cdsParcela.Data   := CtrlParcFinancImov.LookupParcelaAntPos(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                        cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                        dData,
                                                                        2   // Posterior
                                                                       );

            if cdsParcela.isEmpty then
            begin
               cdsContrato.Next;
               Continue;
            end;

            if (cdsParcela.FieldByName('VLRRESIDUO').AsCurrency +
                cdsParcela.FieldByName('VLRCORRSALDO').AsCurrency) = 0 then
            begin
               cdsContrato.Next;
               Continue;
            end;

            // Armazena a prestação posterior
            dDataParcPos      := cdsParcela.FieldByName('DATAVENCIMENTO').AsDateTime;
            IDParcela         := cdsParcela.FieldByName('IDPARCFINANCIMOV').AsInteger;
            fVlrCorPos        := cdsParcela.FieldByName('VLRRESIDUO').AsCurrency +
                                 cdsParcela.FieldByName('VLRCORRSALDO').AsCurrency;

            // -------------------------------------------------------------------------------------

            // Seleciona a prestação imediatamente anterior
            cdsParcela.Data   := CtrlParcFinancImov.LookupParcelaAntPos(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                        cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                        dData,
                                                                        1   // Anterior
                                                                       );

            if cdsParcela.isEmpty then
            begin
               cdsContrato.Next;
               Continue;
            end;

            // Armazena a data da prestação anterior
            dDataParcAnt      := cdsParcela.FieldByName('DATAVENCIMENTO').AsDateTime;

            // -------------------------------------------------------------------------------------

            if dData = dDataParcPos then
            begin
               // (se for na data da parcela, é o valor de juros da parcela, integral)
               fVlrCorLanc    := fVlrCorPos;
            end
            else // dData < dDataParcPos
            begin
               // Calcula as quantidades de dias
               iDifDiasTotal  := trunc(dDataParcPos) - trunc(dDataParcAnt);
               iDifDiasAnt    := trunc(dData) - trunc(dDataParcAnt);

               // Calcula o valor de juros de 1 dia
               fVlrCorDia     := fVlrCorPos / iDifDiasTotal;

               // Calcula o valor total de juros a lançar até a data (arredondado)
               fVlrCorLanc    := fVlrCorDia * (iDifDiasAnt + 1);
               fVlrCorLanc    := (round(fVlrCorLanc * Power(10, 2))) / Power(10, 2);
            end;

            // -------------------------------------------------------------------------------------
            // Totaliza o valor de juros já lançados (desde a data da prestação anterior)
            fVlrCorAcum       := ValorAcumOper(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                               IDParcela,
                                               iIDOper,
                                               dDataParcAnt,
                                               dData
                                              );

            // Subrai o valor total já lançado do valor total a lançar até a data
            fVlrCorLanc       := fVlrCorLanc - fVlrCorAcum;

            //Cássio - Verifica os planos e patrocinadoras que o contrato possui//
            //cdsTemp.Data := LookupPlanosxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger);
            //cdsTemp.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger);

            //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
            {if cdsTemp.RecordCount >= 1 then
            begin
              while not cdsTemp.Eof do
              begin
                if cdsTemp.RecNo = cdsTemp.RecordCount then
                begin
                  fSegCM := fVlrCorLanc - fTotCM;
                  fLancSegCM := (fVlrCorLanc + fVlrCorAcum) - fLancTotCM;
                end
                else
                begin
                  fSegCM := ComunsImobiliario.Arredonda((fVlrCorLanc * cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
                  fLancSegCM := ComunsImobiliario.Arredonda(((fVlrCorLanc + fVlrCorAcum)* cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100, 2);
                end;
                fTotCM := fTotCM + fSegCM;
                fLancTotCM := fLancTotCM + fLancSegCM;

                // Lança a diferença
                if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                            -1,                                                     // dDataBaixa
                                            iIDOper,                                                // iIdOper
                                            //ComunsImobiliario.Arredonda(((fVlrCorLanc * cdsTemp.FieldByName('PERCENTRATEIO').AsFloat) / 100), 2),// fVlrDia,
                                            fSegCM
                                            //(fVlrCorLanc + fVlrCorAcum),                            // fVlrAcum
                                            //(fVlrCorLanc + fVlrCorAcum),                            // fVlrTotAcum ???
                                            fLancSegCM,
                                            fLancSegCM,
                                            cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                            cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                            cdsContrato.FieldByName('IDLOCATARIO').AsInteger,       // iIdForCli
                                            -1                                                      // iCodDocum
                                            False,                                                  // bGravaDiaNull
                                            IDParcela,                                              // IDParcela
                                            -1,                                                     // idCondPag
                                            False,                                                  // bSimula
                                            cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                            cdsTemp.FieldByName('IDPLANOPREV').AsInteger            // IdPlanoPrev
                                           )) then
                begin
                  Raise Exception.Create(MessageInfo);
                end;
                cdsTemp.Next;
              end;
            end
            else
            //Cássio - SOL Nº92381 KINTANA Nº394180 - Fim
            begin}
              // Lança a diferença
              if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                          -1,                                                     // dDataBaixa
                                          iIDOper,                                                // iIdOper
                                          fVlrCorLanc,                                            // fVlrDia,
                                          (fVlrCorLanc + fVlrCorAcum),                            // fVlrAcum
                                          (fVlrCorLanc + fVlrCorAcum),                            // fVlrTotAcum ???
                                          cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                          cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                          cdsContrato.FieldByName('IDLOCATARIO').AsInteger,       // iIdForCli
                                          -1                                                      // iCodDocum
                                          False,                                                  // bGravaDiaNull
                                          IDParcela                                               // IDParcela
                                         )) then
              begin
                 Raise Exception.Create(MessageInfo);
              end;
            //end;

            // o último parâmetro será utilizado para passar a mensagem do processamento
            inc(iAtual);
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1]);

            cdsContrato.Next;
         end;

         // ----------------------------------------------------------------------------------------
         // Resume os Lançamentos em LancOperImob
         if not(GravaLancOperImob(sNomeBilhete, [iIdOper], dData, 1)) then
         begin
            raise Exception.Create(MessageInfo);
         end;
         // ----------------------------------------------------------------------------------------

         Commit;
         Result := True;

      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
         end;
      end;

   finally
      FreeAndNil(cdsContrato);
      FreeAndNil(cdsParcela);
      //FreeAndNil(cdsTemp);

      if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)) // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
   end;
end;



function TCtrlOperImob.CalculaAtualResiduo(sNomeBilhete: string;
                                           const iIdOper: Integer; const dData: TDateTime;
                                           const sTipoImovel: String): Boolean;
var
   fCM         : Extended;
   dInicio     : TDateTime;
   cdsContrato : TCMClientDataSet;
   iContrato, iIndice, iAtual, iQuant  : Integer;
   //Cássio - SOL Nº92381 KINTANA Nº394180
   //cdsTemp : TCMClientDataSet;
   //fSegCM, fTotCM : Extended;
begin
   Result := True;
   cdsContrato := TCMClientDataSet.Create(nil);
   //cdsTemp := TCMClientDataSet.Create(nil);
   //fSegCM := 0;
   //fTotCM := 0;
   try
      try
         StartTransaction;

         // ----------------------------------------------------------------------------------------
         // Exclui lançamentos anteriores se for um Reprocessamento
         if not(Reprocessamento(sNomeBilhete, [iIdOper], dData)) then
            raise Exception.Create(MessageInfo);

         cdsContrato.Data := CtrlParcFinancImov.LookupResiduoParcela(ParamSistema.idEmpresa,dData);

         iAtual := 1;
         iQuant := cdsContrato.RecordCount;

         DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dData) + ' - Calculando Atualização de Resíduos...']);
         // ----------------------------------------------------------------------------------------

         // Grava valores por contrato em LANCOPERDIAIMOB
         cdsContrato.First;
         while not cdsContrato.eof do begin

            iContrato := cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger;
            while (cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger = iContrato) and
                  (not cdsContrato.Eof) do begin

               if ( (cdsContrato.FieldByName('FLGRESIDUOINCORP').AsString = 'N') and
                    (cdsContrato.FieldByName('FLGLANCINTEGRA').AsInteger <> 5  ) and
                    (cdsContrato.FieldByName('FLGLANCINTEGRA').AsInteger <> 6  ) ) or
                  ( (cdsContrato.FieldByName('FLGRESIDUOINCORP').AsString = 'C') and
                    (cdsContrato.FieldByName('DATACOBRES').AsDateTime > dData) )  then begin

                  iIndice  := cdsContrato.FieldByName('IDCORR_CONDPAG').AsInteger;
                  dInicio  := cdsContrato.FieldByName('DATAVENCIMENTO').AsDateTime + 1;

                  if (cdsContrato.FieldByName('VLRRESIDUO').AsFloat <> 0) and (dInicio < dData) then
                  begin
                     fCM := ComunsImobiliarioDB.CalcCM(cdsContrato.FieldByName('VLRRESIDUO').AsFloat,
                                                       iIndice,
                                                       dInicio,
                                                       dData,
                                                       False,     // Atualização de resíduo usa sempre FALSE, pois é contrato e não inadimplencia.
                                                       cdsContrato.FieldByName('MESREF_CONDPAG').AsInteger);
                     if fCM <> 0 then
                     begin
                      //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
                      //Verifica os planos e patrocinadoras que o contrato possui
                      //cdsTemp.Data := LookupPlanosxContrato(iContrato);
                      //cdsTemp.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(iContrato);

                      {if cdsTemp.RecordCount >= 1 then
                      begin
                        // Lança a diferença
                        while cdsTemp.Eof do
                        begin
                          if cdsTemp.RecNo = cdsTemp.RecordCount then
                            fSegCM := fCM - fTotCM
                          else
                            fSegCM := ComunsImobiliario.Arredonda((fCM * cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100, 2);

                          fTotCM := fTotCM + fSegCM;

                          if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                      -1,                                                     // dDataBaixa
                                                      iIDOper,                                                // iIdOper
                                                      0,                                                      // fVlrDia,
                                                      //ComunsImobiliario.Arredonda(((fCM *cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100), 2),
                                                      fSegCM,
                                                      //fCM,
                                                      fSegCM,                                                   // fVlrTotAcum ???
                                                      cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                      cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                      -1,                                                     // iIdForCli
                                                      cdsContrato.FieldByName('CODDOCUMENTO').AsInteger,      // iCodDocum
                                                      False,                                                  // bGravaDiaNull
                                                      cdsContrato.FieldByName('IDPARCFINANCIMOV').AsInteger,  // IDParcela
                                                      -1,                                                     // IdCondPag
                                                      False,                                                  // bSimula
                                                      cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                                      cdsTemp.FieldByName('IDPLANOPREV').AsInteger           //  IdPlanoPrev
                                                     )) then
                            Raise Exception.Create(MessageInfo);
                          cdsTemp.Next;
                        end;
                      end
                      else
                      begin}
                        // Lança a diferença
                        if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                    -1,                                                     // dDataBaixa
                                                    iIDOper,                                                // iIdOper
                                                    0,                                                      // fVlrDia,
                                                    fCM,                                                    // fVlrAcum
                                                    fCM,                                                    // fVlrTotAcum ???
                                                    cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                    cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                    -1,                                                     // iIdForCli
                                                    cdsContrato.FieldByName('CODDOCUMENTO').AsInteger,      // iCodDocum
                                                    False,                                                  // bGravaDiaNull
                                                    cdsContrato.FieldByName('IDPARCFINANCIMOV').AsInteger   // IDParcela
                                                   )) then
                          Raise Exception.Create(MessageInfo);
                      //end;
                     end;
                  end;
               end;

               // o último parâmetro será utilizado para passar a mensagem do processamento
               inc(iAtual);
               DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1]);

               cdsContrato.Next;
            end;
         end;

         // Efetua ajustes diversos relacionados a atualização de resíduo
         if not AjustesDiversosII(dData) then
            Raise Exception.Create( MessageInfo );

         // Resume os Lançamentos em LancOperImob
         if not(GravaLancOperImob(sNomeBilhete, [iIdOper], dData, 1)) then
            raise Exception.Create(MessageInfo);
         // ----------------------------------------------------------------------------------------

         Commit;
         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
         end;
      end;
   finally
      FreeAndNil(cdsContrato);
     // FreeAndNil(cdsTemp);
      if FileExists(sNomeBilhete) then DeleteFile(PCHAR(sNomeBilhete)) // Alterado por Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
   end;
end;



procedure TCtrlOperImob.SetiCodDocumentoAjuste(const Value: Integer);
begin
  FiCodDocumentoAjuste := Value;
end;

procedure TCtrlOperImob.SetbGeraLog(const Value: Boolean);
begin
  FbGeraLog := Value;
end;



function TCtrlOperImob.CalculaAtualSaldo14(      sNomeBilhete : String;
                                           var   fCM          : Extended;
                                           var   fJuros       : Extended;
                                           const iContrato    : Integer = -1;
                                           const iCondPag     : Integer = -1;
                                           const dData        : TDateTime = -1;
                                           const dDataVencto  : TDateTime = -1;
                                           const iTipoOperCM  : Integer = -1;
                                           const iTipoOperJur : Integer = -1;
                                           const bGrava       : Boolean = True;
                                           const bTransacao   : Boolean = True;
                                           const fSaldoDev    : Extended = 0
                                          ) : Boolean;
var
   cdsContrato     : TCMClientDataSet;
   //cdsParcela      : TCMClientDataSet;
   iAtual          : Integer;
   iQuant          : Integer;
   fVlrSaldo       : Extended;
   iContratoAux    : Integer;
   iCondPagAux     : Integer;
   dDataVencimento : TDateTime;

   bApenasUltMes   : Boolean;

   //Cássio - SOL Nº92381 KINTANA Nº394180
   //cdsTemp : TCMClientDataSet;
   //fSegCM, fTotCM,
   //fSegJuros, fTotJuros : Extended;
begin
   cdsContrato    := TCMClientDataSet.Create(Nil);
   //cdsTemp        := TCMClientDataSet.Create(nil);
   //fSegCM         := 0;
   //fTotCM         := 0;
   //fSegJuros      := 0;
   //fTotJuros      := 0;

   try
      // Busca os dados do(s) contrato(s) a ser(em) processado(s)
      try

         fVlrSaldo := fSaldoDev;
         if bTransacao then StartTransaction;

         if bGrava then
         begin

            // ----------------------------------------------------------------------------------------
            // Exclui lançamentos anteriores se for um Reprocessamento
            if not(Reprocessamento(sNomeBilhete, [iTipoOperCM, iTipoOperJur], dData, iContrato)) then
               raise Exception.Create(MessageInfo);
         end;

         cdsContrato.Data := CtrlParcFinancImov.LookupAlienacao(dData,iContrato,iCondPag);

         iAtual := 1;
         iQuant := cdsContrato.RecordCount;

         if bGrava then
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dData) + ' - Calculando Atualização de Saldo...']);

         while not cdsContrato.eof do
         begin

            iContratoAux := cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger;

            while (cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger = iContratoAux) and
                  (not cdsContrato.Eof) do begin

               iCondPagAux := cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger;

               while (cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger = iContratoAux) and
                     (cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPagAux) and
                     (not cdsContrato.Eof) do begin

                  if dDataVencto = -1 then
                  begin
                     // Pega o ultimo registro de atualização de saldo na LANCOPERDIAIMOB
                     dDataVencimento := CtrlParcFinancImov.BuscaUltimaAtualizacao(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                                  cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                                  dData);

                     // Se não possui parcela, pega a data de assinatura
                     if dDataVencimento = -1 then
                        dDataVencimento := cdsContrato.FieldByName('CONDATAASSINATURA').AsDateTime;

                     if dDataVencimento <= 0 then
                        dDataVencimento := cdsContrato.FieldByName('CONDATAINICIO').AsDateTime;
                     end
                  else
                     dDataVencimento := dDataVencto;

                  if dDataVencimento > 0 then
                  begin
                     // Busca o saldo no vencimento da parcela
                     if fVlrSaldo = 0 then
                     begin
                        fVlrSaldo := CtrlParcFinancImov.CalcSldNova(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                    cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                    dDataVencimento);

                        // Busca as atualizações após o saldo da parcela
                        fVlrSaldo := fVlrSaldo + CtrlParcFinancImov.CalcAtualSaldo(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                                   cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                                   dDataVencimento,
                                                                                   dData);
                     end;
                     fCM    := 0;
                     fJuros := 0;

                     if fVlrSaldo <> 0 then
                     begin
                        // Calcula a Correção Monetária
                        fCM := ComunsImobiliarioDB.CalcCM(fVlrSaldo,
                                                          cdsContrato.FieldByName('INDCORRECAO').AsInteger,
                                                          dDataVencimento + 1,
                                                          dData,
                                                          False, cdsContrato.FieldByName('MESREFREAJUSTE').AsInteger);

                        // Calcula Juros sobre o Saldo + a Correção Monetária
                        fJuros := ComunsImobiliarioDB.CalcJuros(fVlrSaldo + fCM,
                                                                0,
                                                                cdsContrato.FieldByName('TAXAJUROS').AsFloat,
                                                                cdsContrato.FieldByName('CONMOEDAMORA').AsInteger,
                                                                cdsContrato.FieldByName('PERIODOTAXA').AsString,
                                                                dDataVencimento + 1,
                                                                dData, True );

                        fVlrSaldo := 0;
                     end;
                     if bGrava then
                     begin
                      //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
                      //Busca os planos e patrocinadoras que o contrato possui
                      //cdsTemp.Data := LookupPlanosxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').asInteger);
                      //cdsTemp.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').asInteger);

                      {if cdsTemp.RecordCount >= 1 then
                      begin
                        while not cdsTemp.Eof do
                        begin
                          if (iTipoOperCM > 0) and (fCM <> 0) then
                          begin
                            if cdsTemp.RecNo = cdsTemp.RecordCount then
                              fSegCM := fCM - fTotCM
                            else
                              fSegCM := ComunsImobiliario.Arredonda((fCM * cdsTemp.FieldByName('PERCENTRATERIO').asFloat)/100, 2);

                            fTotCM := fTotCM + fSegCM;

                            if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                        -1,                                                     // dDataBaixa
                                                        iTipoOperCM,                                            // iIdOper
                                                        0,                                                      // fVlrDia,
                                                        //ComunsImobiliario.Arredonda(((fCM *cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100), 2),
                                                        fSegCM,
                                                        //fCM,
                                                        fSegCM,                                                   // fVlrTotAcum ???
                                                        cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                        cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                        -1,                                                     // iIdForCli
                                                        -1,                                                     // iCodDocum
                                                        False,                                                  // bGravaDiaNull
                                                        -1,                                                     // IDParcela
                                                        cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,   // IdCondPagImovel
                                                        False,                                                  // bSimula
                                                        cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                                        cdsTemp.FieldByName('IDPLANOPREV').AsInteger            // IdPlanoPrev
                                                       )) then
                              Raise Exception.Create(MessageInfo);
                          end;

                          if (iTipoOperJur > 0) and (fJuros <> 0) then
                          begin
                            if cdsTemp.RecNo = cdsTemp.RecordCount then
                              fSegJuros := fJuros - fTotJuros
                            else
                              fSegJuros := ComunsImobiliario.Arredonda((fJuros * cdsTemp.FieldByName('PERCENTRATERIO').asFloat)/100, 2);

                            fTotJuros := fTotJuros + fSegJuros;

                            if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                        -1,                                                     // dDataBaixa
                                                        iTipoOperJur,                                           // iIdOper
                                                        0,                                                      // fVlrDia,
                                                        //((fJuros * cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100),
                                                        fSegJuros,
                                                        //fJuros,                                                 // fVlrTotAcum ???
                                                        fSegJuros,
                                                        cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                        cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                        -1,                                                     // iIdForCli
                                                        -1,                                                     // iCodDocum
                                                        False,                                                  // bGravaDiaNull
                                                        -1,                                                     // IDParcela
                                                        cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,   // IdCondPagImovel
                                                        False,                                                  // bSimula
                                                        cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                                        cdsTemp.FieldByName('IDPLANOPREV').AsInteger            // IdPlanoPrev
                                                       )) then
                              Raise Exception.Create(MessageInfo);
                          end;
                          cdsTemp.Next;
                        end;
                      end
                      else
                      begin}
                        if (iTipoOperCM > 0) and (fCM <> 0) then
                        begin
                          if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                      -1,                                                     // dDataBaixa
                                                      iTipoOperCM,                                            // iIdOper
                                                      0,                                                      // fVlrDia,
                                                      fCM,                                                    // fVlrAcum
                                                      fCM,                                                    // fVlrTotAcum ???
                                                      cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                      cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                      -1,                                                     // iIdForCli
                                                      -1,                                                     // iCodDocum
                                                      False,                                                  // bGravaDiaNull
                                                      -1,                                                     // IDParcela
                                                      cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger    // IdCondPagImovel
                                                     )) then
                            Raise Exception.Create(MessageInfo);
                        end;

                        if (iTipoOperJur > 0) and (fJuros <> 0) then
                        begin
                          if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                      -1,                                                     // dDataBaixa
                                                      iTipoOperJur,                                           // iIdOper
                                                      0,                                                      // fVlrDia,
                                                      fJuros,                                                 // fVlrAcum
                                                      fJuros,                                                 // fVlrTotAcum ???
                                                      cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                      cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                      -1,                                                     // iIdForCli
                                                      -1,                                                     // iCodDocum
                                                      False,                                                  // bGravaDiaNull
                                                      -1,                                                     // IDParcela
                                                      cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger    // IdCondPagImovel
                                                     )) then
                            Raise Exception.Create(MessageInfo);
                        end;
                      //end;
                     end;
                  end;
                  // o último parâmetro será utilizado para passar a mensagem do processamento
                  inc(iAtual);
                  if bGrava then
                     DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1]);

                  cdsContrato.Next;
               end;
            end;
         end;
         // Resume os Lançamentos em LancOperImob
         if bGrava then
         begin
            if not(GravaLancOperImob(sNomeBilhete, [iTipoOperCM,iTipoOperJur], dData, 2)) then
               raise Exception.Create(MessageInfo);
         end;

         if bTransacao then Commit;

         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            if bTransacao then Rollback;
            MessageInfo := E.Message;
            if bGrava then
               DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
         end;
      end;
   finally
      FreeAndNil(cdsContrato);
      //FreeAndNil(cdsTemp);
   end;
end;




function TCtrlOperImob.CalculaAtualSaldo(      sNomeBilhete : String;
                                           var   fCM          : Extended;
                                           var   fJuros       : Extended;
                                           const iContrato    : Integer = -1;
                                           const iCondPag     : Integer = -1;
                                           const dData        : TDateTime = -1;
                                           const dDataVencto  : TDateTime = -1;
                                           const iTipoOperCM  : Integer = -1;
                                           const iTipoOperJur : Integer = -1;
                                           const bGrava       : Boolean = True;
                                           const bTransacao   : Boolean = True;
                                           const fSaldoDev    : Extended = 0
                                          ) : Boolean;
var
   cdsContrato     : TCMClientDataSet;
   //cdsParcela      : TCMClientDataSet;
   iAtual          : Integer;
   iQuant          : Integer;
   fVlrSaldo       : Extended;
   iContratoAux    : Integer;
   iCondPagAux     : Integer;
   dDataVencimento : TDateTime;

   bApenasUltMes   : Boolean;

    fFValorJuros      : Extended;
    fFValorMulta      : Extended;
    fFPercentualMulta : Extended;
    fFPercentualJuros : Extended;
    fFMoedaMulta      : Integer;
    fFMoedaJuros      : Integer;
    fFMoedaCM         : Integer;
    fFPeriodoJuros    : String;
    fFJurosProporc    : Variant;

    //Cássio - SOL Nº92381 KINTANA Nº394180
    //cdsTemp : TCMClientDataSet;
    //fSegCM, fTotCM,
    //fSegJuros, fTotJuros : Extended;
begin
   cdsContrato    := TCMClientDataSet.Create(Nil);
   //cdsTemp        := TCMClientDataSet.Create(nil);
   //fSegCM         := 0;
   //fTotCM         := 0;
   //fSegJuros      := 0;
   //fTotJuros      := 0;

   try
      // Busca os dados do(s) contrato(s) a ser(em) processado(s)
      try

         fVlrSaldo := fSaldoDev;
         if bTransacao then StartTransaction;

         if bGrava then
         begin

            // ----------------------------------------------------------------------------------------
            // Exclui lançamentos anteriores se for um Reprocessamento
            if not(Reprocessamento(sNomeBilhete, [iTipoOperCM, iTipoOperJur], dData)) then
               raise Exception.Create(MessageInfo);
         end;

         cdsContrato.Data := CtrlParcFinancImov.LookupAlienacao(dData,iContrato,iCondPag);

         iAtual := 1;
         iQuant := cdsContrato.RecordCount;

         if bGrava then
            DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, DateToStr(dData) + ' - Calculando Atualização de Saldo...']);

         while not cdsContrato.eof do
         begin

            iContratoAux := cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger;

            while (cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger = iContratoAux) and
                  (not cdsContrato.Eof) do begin

               iCondPagAux := cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger;

               while (cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger = iContratoAux) and
                     (cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger = iCondPagAux) and
                     (not cdsContrato.Eof) do begin

                  if FValorJuros      = 0  then
                     fFValorJuros     := cdsContrato.FieldByName('CONVLRMORA').AsFloat
                  else
                     fFValorJuros     := FValorJuros;

                  if FPercentualJuros = -1 then
                     fFPercentualJuros := cdsContrato.FieldByName('CONPERCENTMORA').AsFloat
                  else
                     fFPercentualJuros := FPercentualJuros;

                  if FMoedaJuros      = -1 then
                     fFMoedaJuros      := cdsContrato.FieldByName('CONMOEDAMORA').AsInteger
                  else
                     fFMoedaJuros      := FMoedaJuros;

                  if FMoedaCM         = -1 then
                     fFMoedaCM         := cdsContrato.FieldByName('IDINDCORRECAO').AsInteger
                  else
                     fFMoedaCM         := FMoedaCM;

                  if FPeriodoJuros    = '' then
                     fFPeriodoJuros    := cdsContrato.FieldByName('CONPERMORA').AsString
                  else
                     fFPeriodoJuros    := FPeriodoJuros;

                  if (ParamSistema.idModulo = 64) then
                  begin
                      if FJurosProporc = -1 then
                         fFJurosProporc := cdsContrato.FieldByName('FLGMORAPROPORC').AsInteger
                      else
                         fFJurosProporc := FJurosProporc;
                  end;

                  if (ParamSistema.idModulo = 135) then
                  begin
                     begin
                        if (FJurosProporc    = '') then
                           fFJurosProporc := cdsContrato.FieldByName('FLGMORAPROPORC').AsString
                        else
                           fFJurosProporc := FJurosProporc;
                     end;
                  end;

                  if dDataVencto = -1 then
                  begin
                     // Pega o ultimo registro de atualização de saldo na LANCOPERDIAIMOB
                     dDataVencimento := CtrlParcFinancImov.BuscaUltimaAtualizacao(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                                  cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                                  dData);

                     // Se não possui parcela, pega a data de assinatura
                     if dDataVencimento = -1 then
                        dDataVencimento := cdsContrato.FieldByName('CONDATAASSINATURA').AsDateTime;

                     if dDataVencimento <= 0 then
                        dDataVencimento := cdsContrato.FieldByName('CONDATAINICIO').AsDateTime;
                     end
                  else
                     dDataVencimento := dDataVencto;

                  if dDataVencimento > 0 then
                  begin
                     // Busca o saldo no vencimento da parcela
                     if fVlrSaldo = 0 then
                     begin
                        fVlrSaldo := CtrlParcFinancImov.CalcSldNova(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                    cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                    dDataVencimento);

                        // Busca as atualizações após o saldo da parcela
                        fVlrSaldo := fVlrSaldo + CtrlParcFinancImov.CalcAtualSaldo(cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                                                                   cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,
                                                                                   dDataVencimento,
                                                                                   dData);
                     end;
                     fCM    := 0;
                     fJuros := 0;

                     if ParamSistema.idModulo = 135 then
                          bApenasUltMes := CtrlModuloImobiliario.Alienacao.bApenasUltMesAnterior
                     else bApenasUltMes := CtrlModuloImobiliario.AdminImob.bApenasUltMesAnterior;

                     if fVlrSaldo <> 0 then
                     begin
                        // Calcula a Correção Monetária
                        fCM := ComunsImobiliarioDB.CalcCM(fVlrSaldo,
                                                          fFMoedaCM,
                                                          dDataVencimento + 1,
                                                          dData,
                                                          bApenasUltMes,
                                                          cdsContrato.FieldByName('CONMESREFREAJUSTE').AsInteger);


                        // Calcula Juros sobre o Saldo + a Correção Monetária
                        fJuros := ComunsImobiliarioDB.CalcJuros(fVlrSaldo + fCM,
                                                                fFValorJuros,
                                                                fFPercentualJuros,
                                                                fFMoedaJuros,
                                                                fFPeriodoJuros,
                                                                dDataVencimento + 1,
                                                                dData,
                                                                fFJurosProporc = 'S' );

                        fVlrSaldo := 0;
                     end;
                     if bGrava then
                     begin
                        //Cássio - SOL Nº92381 KINTANA Nº394180 - Início
                        //Busca os planos e patrocinadoras que o contrato possui
                        //cdsTemp.Data := LookupPlanosxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').asInteger);
                        //cdsTemp.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsContrato.FieldByName('IDCONTRATOIMOVEL').asInteger);

                        {if cdsTemp.RecordCount >= 1 then
                        begin
                          while not cdsTemp.Eof do
                          begin
                            if (iTipoOperCM > 0) and (fCM <> 0) then
                            begin
                              if cdsTemp.RecNo = cdsTemp.RecordCount then
                                fSegCM := fCM - fTotCM
                              else
                                fSegCM := ComunsImobiliario.Arredonda((fCM * cdsTemp.FieldByName('PERCENTRATERIO').asFloat)/100, 2);

                              fTotCM := fTotCM + fSegCM;

                              if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                          -1,                                                     // dDataBaixa
                                                          iTipoOperCM,                                            // iIdOper
                                                          0,                                                      // fVlrDia,
                                                          //ComunsImobiliario.Arredonda(((fCM * cdsTemp.FieldByName('PERCENTRATEIO').AsFloat) / 100), 2) // fVlrAcum
                                                          fSegCM,
                                                          //fCM,
                                                          fSegCM,                                                  // fVlrTotAcum ???
                                                          cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                          cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                          -1,                                                     // iIdForCli
                                                          -1,                                                     // iCodDocum
                                                          False,                                                  // bGravaDiaNull
                                                          -1,                                                     // IDParcela
                                                          cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,   // IdCondPagImovel
                                                          False,                                                  // bSimula
                                                          cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                                          cdsTemp.FieldByName('IDPLANOPREV').AsInteger            // IdPlanoPrev
                                                         )) then
                                Raise Exception.Create(MessageInfo);
                            end;

                            if (iTipoOperJur > 0) and (fJuros <> 0) then
                            begin
                              if cdsTemp.RecNo = cdsTemp.RecordCount then
                                fSegJuros := fJuros - fTotJuros
                              else
                                fSegJuros := ComunsImobiliario.Arredonda((fJuros * cdsTemp.FieldByName('PERCENTRATERIO').asFloat)/100, 2);

                              fTotJuros := fTotJuros + fSegJuros;

                              if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                          -1,                                                     // dDataBaixa
                                                          iTipoOperJur,                                           // iIdOper
                                                          0,                                                      // fVlrDia,
                                                          //((fJuros * cdsTemp.FieldByName('PERCENTRATEIO').asFloat)/100), // fVlrAcum
                                                          fSegJuros,
                                                          //fJuros,
                                                          fSegJuros,                                              // fVlrTotAcum ???
                                                          cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                          cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                          -1,                                                     // iIdForCli
                                                          -1,                                                     // iCodDocum
                                                          False,                                                  // bGravaDiaNull
                                                          -1,                                                     // IDParcela
                                                          cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger,   // IdCondPagImovel
                                                          False,                                                  // bSimula
                                                          cdsTemp.FieldByName('IDPATRO').AsInteger,               // IdPatro
                                                          cdsTemp.FieldByName('IDPLANOPREV').AsInteger            // IdPlanoPrev
                                                         )) then
                                Raise Exception.Create(MessageInfo);
                            end;
                            cdsTemp.Next;
                          end;
                        end
                        else
                        begin}
                          if (iTipoOperCM > 0) and (fCM <> 0) then
                          begin
                             if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                         -1,                                                     // dDataBaixa
                                                         iTipoOperCM,                                            // iIdOper
                                                         0,                                                      // fVlrDia,
                                                         fCM,                                                    // fVlrAcum
                                                         fCM,                                                    // fVlrTotAcum ???
                                                         cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                         cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                         -1,                                                     // iIdForCli
                                                         -1,                                                     // iCodDocum
                                                         False,                                                  // bGravaDiaNull
                                                         -1,                                                     // IDParcela
                                                         cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger    // IdCondPagImovel
                                                        )) then
                                Raise Exception.Create(MessageInfo);
                          end;

                          if (iTipoOperJur > 0) and (fJuros <> 0) then
                          begin
                             if not(GravaLancOperDiaImob(dData,                                                  // dDataLancto
                                                         -1,                                                     // dDataBaixa
                                                         iTipoOperJur,                                           // iIdOper
                                                         0,                                                      // fVlrDia,
                                                         fJuros,                                                 // fVlrAcum
                                                         fJuros,                                                 // fVlrTotAcum ???
                                                         cdsContrato.FieldByName('CODTIPIMOVEL').AsString,       // sTipoImovel
                                                         cdsContrato.FieldByName('IDCONTRATOIMOVEL').AsInteger,  // iIdContrato
                                                         -1,                                                     // iIdForCli
                                                         -1,                                                     // iCodDocum
                                                         False,                                                  // bGravaDiaNull
                                                         -1,                                                     // IDParcela
                                                         cdsContrato.FieldByName('IDCONDPAGIMOVEL').AsInteger    // IdCondPagImovel
                                                        )) then
                                Raise Exception.Create(MessageInfo);

                          end;
                        //end;
                     end;
                  end;
                  // o último parâmetro será utilizado para passar a mensagem do processamento
                  inc(iAtual);
                  if bGrava then
                     DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1]);

                  cdsContrato.Next;
               end;
            end;
         end;
         // Resume os Lançamentos em LancOperImob
         if bGrava then
         begin
            if not(GravaLancOperImob(sNomeBilhete, [iTipoOperCM,iTipoOperJur], dData, 2)) then
               raise Exception.Create(MessageInfo);
         end;

         if bTransacao then Commit;

         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            if bTransacao then Rollback;
            MessageInfo := E.Message;
            if bGrava then
               DoProgresso([sNomeBilhete, iAtual, iQuant, -1, -1, MessageInfo]);
         end;
      end;
   finally
      FreeAndNil(cdsContrato);
      //FreeAndNil(cdsParcela);
      //FreeAndNil(cdsTemp);
   end;
end;




function TCtrlOperImob.VerificaFeriado(const dDataLimite: TDateTime): Boolean;
var cdsTemp   : TCMClientDataSet;
    sDtLimite : String;
begin
   try
      Result    := False;
      sDtLimite := 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLimite)) + ',''DD/MM/YYYY'')';
      cdsTemp   := TCMClientDataSet.Create( nil );
      cdsTemp.Data := GetDataPacket( 'SELECT DATAFERIADO FROM FERIADOS WHERE DATAFERIADO = ' + sDtLimite );

      if not cdsTemp.IsEmpty then Result := True;
   finally
      FreeAndNil( cdsTemp );
   end;
end;

procedure TCtrlOperImob.SetcdsEncargos(const Value: TCMClientDataSet);
begin
   FcdsEncargos := Value;
end;



function TCtrlOperImob.LookupEncargos: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT' + #13 +
   '    SYSDATE AS DATAOPER,' + #13 +
   '    SYSDATE AS DATABAIXA,' + #13 +
   '    0       AS IDOPERACAO,' + #13 +
   '    0       AS VLRDIA,' + #13 +
   '    0       AS VLRACUM,' + #13 +
   '    0       AS VLRTOTACUM,' + #13 +
   '    ''                         '' AS CODTIPIMOVEL,' + #13 +
   '    0       AS IDCONTRATOIMOVEL,' + #13 +
   '    0       AS IDFORCLI,' + #13 +
   '    0       AS CODDOCUMENTO,' + #13 +
   '    0       AS IDPARCFINANCIMOV,' + #13 +
   '    0       AS IDCONDPAGIMOVEL' + #13 +
   'FROM' + #13 +
   '    DUAL' + #13 +
   'WHERE' + #13 +
   '    1 = 2' + #13;

   Result := GetDataPacket(sSQL);
end;

procedure TCtrlOperImob.SetJurosProporc(const Value: Variant);
begin
  FJurosProporc := Value;
end;

procedure TCtrlOperImob.SetMoedaCM(const Value: Integer);
begin
  FMoedaCM := Value;
end;

procedure TCtrlOperImob.SetMoedaJuros(const Value: Integer);
begin
  FMoedaJuros := Value;
end;

procedure TCtrlOperImob.SetMoedaMulta(const Value: Integer);
begin
  FMoedaMulta := Value;
end;

procedure TCtrlOperImob.SetPercentualJuros(const Value: Extended);
begin
  FPercentualJuros := Value;
end;

procedure TCtrlOperImob.SetPercentualMulta(const Value: Extended);
begin
  FPercentualMulta := Value;
end;

procedure TCtrlOperImob.SetPeriodoJuros(const Value: String);
begin
  FPeriodoJuros := Value;
end;

procedure TCtrlOperImob.SetValorJuros(const Value: Extended);
begin
  FValorJuros := Value;
end;

procedure TCtrlOperImob.SetValorMulta(const Value: Extended);
begin
  FValorMulta := Value;
end;

procedure TCtrlOperImob.SetUsaMesAnterior(const Value: Integer);
begin
  FUsaMesAnterior := Value;
end;

procedure TCtrlOperImob.SetBuscaParamMultaContrato(const Value: Boolean);
begin
  FBuscaParamMultaContrato := Value;
end;



function TCtrlOperImob.LookupMontaDadosParaAbono: OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT' + #13 +
   '    0 AS IDCONTRATOIMOVEL,'               + #13 +
   '    0 AS IDPARCFINANCIMOV,'               + #13 +
   '    ''12345'' AS CODTIPIMOVEL,'           + #13 +
   '    0 AS CODDOCUMENTO,'                   + #13 +
   '    0 AS DIASDIF,'                        + #13 +
   '    0 AS VLRPRESTACAO,'                   + #13 +
   '    0 AS VLRMULTAATRASO,'                 + #13 +
   '    0 AS VLRMULTACORRIG,'                 + #13 +
   '    0 AS VLRMORAATRASO,'                  + #13 +
   '    0 AS VLRJUROSCORRIG,'                 + #13 +
   '    0 AS VLRCMATRASO,'                    + #13 +
   '    0 AS VLRCMCORRIG,'                    + #13 +
   '    0 AS VLRPAGO,'                        + #13 +
   '    0 AS MULTAORIG,'                      + #13 +
   '    0 AS MULTAABONO,'                     + #13 +
   '    0 AS JUROSORIG,'                      + #13 +
   '    0 AS JUROSABONO,'                     + #13 +
   '    0 AS CMORIG,'                         + #13 +
   '    0 AS CMABONO'                         + #13 +
   'FROM'                                     + #13 +
   '    DUAL'                                 + #13 +
   'WHERE'                                    + #13 +
   '    1 = 2'                                + #13;

   Result := GetDataPacket(sSQL);
end;



function TCtrlOperImob.LookupAlteradorAbono(const sTipoImovel: String): OleVariant;
var
   sSQL : String;
begin
   if ParamSistema.idModulo = 64 then
   begin
      sSql := 'SELECT CODALTMULTA, CODALTJUROS, CODALTCORRMON '+#13+
              '  FROM TIPOIMOVEL WHERE CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);
   end
   else
   begin
      sSql := 'SELECT CODALTMTAL AS CODALTMULTA, CODALTJRAL AS CODALTJUROS, '+#13+
              '       CODALTCMAL AS CODALTCORRMON                           '+#13+
              '  FROM TIPOIMOVEL WHERE CODTIPIMOVEL = ' + QuotedStr(sTipoImovel);
   end;
   Result := GetDataPacket(sSQL);
end;


function TCtrlOperImob.LookupAlteradorDoc(const iDocumento, iAlteradorJuros, iAlteradorMulta, iAlteradorCorr: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT' + #13 +
   '    CODDOCUMENTO,' + #13 +
   '    NUMLANCTO,' + #13 +
   '    CODALTERADOR' + #13 +
   'FROM' + #13 +
   '    LANCTODOCUM' + #13 +
   'WHERE' + #13 +
   '    CODDOCUMENTO = ' + IntToStr(iDocumento) + #13 +
   'AND OPERACAO     = ''4''' + #13 +
   'AND CODALTERADOR IN (' + IntToStr(iAlteradorJuros) + ',' + IntToStr(iAlteradorMulta)+ ','+ IntToStr(iAlteradorCorr) +')';

   Result := GetDataPacket(sSQL);
end;

// Daniel - 22056 - Início -----------------------------------------------------
function TCtrlOperImob.AtualizaDataFechamento(dDataLimite:TDateTime): Boolean;
var sSql    : String;
begin
  Result := True;

  try
    // Se o Módulo for Administração Imobiliária...
    if (ParamSistema.idModulo=64) then begin
      sSql := 'UPDATE PARAMIMOVEL ' +#13+
              'SET DTULTFECH = '    +QuotedStr(DateToStr(dDataLimite));
    end else begin
    // Se o Módulo for Alienação (135) ...
      sSql := 'UPDATE PARAMALIENACAO ' +#13+
              'SET DTULTFECH = '       +QuotedStr(DateToStr(dDataLimite));
    end;

    if not ExecSQL(sSql) then
      raise Exception.Create(MessageInfo);

  except
    on e:Exception do begin
      Result      := False;
      MessageInfo := e.message;
    end;
  end;
end;
// Daniel - 22056 - Fim --------------------------------------------------------

procedure TCtrlOperImob.SetIDLancOperDiaImob(const Value: Extended);
begin
   FIDLancOperDiaImob := Value;
end;



function TCtrlOperImob.LookupPlanosxContrato(
  iIdContrato: Integer): OLEVariant;
var
  sSQL :  string;
begin
  sSQL := 'SELECT PPI.IDPLANOPREV, ' + #10#13 +
          '       PPI.IDPATRO, ' + #10#13 +
          '       SUM (PPI.PPIPERCENTRATEIO * 100 / TOT.TOTAL) AS TOTAL_PERCENTUAIS ' + #10#13 +
          '  FROM PLANOPATROXIMOVEL PPI, ' + #10#13 +
          '       CONTRATOXIMOVEL CXI, ' + #10#13 +
          '       CONTRATOIMOVEL CTI, ' + #10#13 +
          '       (SELECT SUM(PP.PPIPERCENTRATEIO) AS TOTAL ' + #10#13 +
          '          FROM PLANOPATROXIMOVEL PP, ' + #10#13 +
          '               CONTRATOXIMOVEL CX, ' + #10#13 +
          '               CONTRATOIMOVEL CT ' + #10#13 +
          '         WHERE CT.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato) + #10#13 +
          '           AND CX.IDCONTRATOIMOVEL(+) = CT.IDCONTRATOIMOVEL ' + #10#13 +
          '           AND PP.IDIMOVEL = CX.IDIMOVEL) TOT ' + #10#13 +
          ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIDContrato) + #10#13 +
          '   AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' + #10#13 +
          '   AND PPI.IDIMOVEL = CXI.IDIMOVEL ' + #10#13 +
          ' GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO ';

  Result := GetDataPacket(sSQL);
end;



procedure TCtrlOperImob.PegaValoresDaSimulacao(
  const iCodDocumento: Integer; const dData: TDateTime;
  const iIdOperMulta: Integer; var vMulta: Extended;
  const iIdOperJuros: Integer; var vJuros: Extended;
  const iIdOperCM: Integer; var vCM: Extended);
var
  cdsTemp: TCMClientDataSet;
  sSQL: String;
begin
  vMulta := 0;
  vJuros := 0;
  vCM    := 0;

  if (iCodDocumento > 0) and (dData > 0) then
  begin
    cdsTemp := TCMClientDataSet.Create(nil);
    try
      sSQL := 'select L.IDOPERACAO, sum(L.VLRACUM) as VALOR' +#13+
              '  from LANCOPERDIAIMOB L' +#13+
              ' where L.CODDOCUMENTO = ' + IntToStr(iCodDocumento) +#13+
              '   and L.DATAOPER = to_date('+QuotedStr(FormatDateTime('DD/MM/YYYY',dData))+',''DD/MM/YYYY'')' +#13+
              '   and L.FLGTIPO = ''S''' +#13+
              ' group by L.IDOPERACAO';

      cdsTemp.Data := GetDataPacket(sSQL);

      cdsTemp.First;
      while not(cdsTemp.Eof) do
      begin
        if cdsTemp.FieldByName('IDOPERACAO').AsInteger = iIdOperMulta then
          vMulta := cdsTemp.FieldByName('VALOR').AsFloat;

        if cdsTemp.FieldByName('IDOPERACAO').AsInteger = iIdOperJuros then
          vJuros := cdsTemp.FieldByName('VALOR').AsFloat;

        if cdsTemp.FieldByName('IDOPERACAO').AsInteger = iIdOperCM then
          vCM    := cdsTemp.FieldByName('VALOR').AsFloat;

        cdsTemp.Next;
      end;
      cdsTemp.Close;
    finally
      FreeAndNil(cdsTemp);
    end;
  end;
end;

// Felipe A. Santos Criação da rotina SOL 172601/14639 e SOL 172601/14640
function TCtrlOperImob.ExecutarETL: boolean;
var
   sSQL, PathETL, sTabelaParam : string;
   cdsTemp: TCMClientDataSet;
   ArqETL : TStringList;
begin

   try
     ArqETL := TStringList.Create;

     { ADMIMIMOB
     Recupera o caminho (Parametrização do sistema -> Operações contabeis - > caminho arquivo ETL)
     CAMPOS PATHETLHOM e PATHETLPRODUCAO da tabela PARAMIMOVEL
     da onde vão ser gerados os arquivos de ETL

       ALIENAÇÃO
     Recupera o caminho (Parametrização do sistema -> Operações Diárias - > caminho arquivo ETL)
     CAMPOS PATHETLHOM e PATHETLPRODUCAO da tabela PARAMALIENACAO
     da onde vão ser gerados os arquivos de ETL
     }

     case Sistema.IdModulo of
       64  : sTabelaParam := 'PARAMIMOVEL';
       135 : sTabelaParam := 'PARAMALIENACAO';
     end;

     sSQL := 'SELECT PATHETLPRODUCAO, PATHETLHOM FROM ' +  sTabelaParam + #13 +
             ' WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa);

     cdsTemp := TCMClientDataSet.Create(nil);
     cdsTemp.Data := GetDataPacket(sSQL);

     if Copy(UpperCase(Sistema.AliasServidor),1,8) = 'PRODUCAO' then //Ejrb - 29/04/2021 - SIG 114623 - Implementação do comando Copy, para igualar as bases de produção.
        PathETL := cdsTemp.FieldByName('PATHETLPRODUCAO').AsString
     else
        PathETL := cdsTemp.FieldByName('PATHETLHOM').AsString;

     if (PathETL = '') then
     begin
        MessageInfo := 'Não há parametrização especifica para execução do processo em ETL.';
        Result := False;
        Exit;
     end;
      //Marcio Sanches Spinosa SOL 227706 KINTANA 2061686 - Inicio
      if not dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.StartTransaction;
//      Marcio Sanches Spinosa SOL 227706 KINTANA 2061686 - fim
     ArqETL.SaveToFile(PathETL + 'EXECUCAO_ATUALIZACAO_IMOB.txt');

     try
       // inserindo dados na tabela ETL_IMOB_ATUALIZACAO
       dbETLImobAtualizacao.Clear;
       dbETLImobAtualizacao.Data_Inicio.AsDateTime := DataInicio;
       dbETLImobAtualizacao.Data_Fim.AsDateTime := DataFim;
       dbETLImobAtualizacao.IdModulo.AsInteger := Sistema.IdModulo;
       dbETLImobAtualizacao.FlgStatusExec.AsString := 'A';

       if not(dbETLImobAtualizacao.Insert) then
          raise Exception.Create(dbETLImobAtualizacao.MessageInfo);
//      Marcio Sanches Spinosa SOL 227706 KINTANA 2061686 - Inicio
      if dtmBaseDados.dbBaseDados.InTransaction then
         dtmBaseDados.dbBaseDados.Commit;
//       Marcio Sanches Spinosa SOL 227706 KINTANA 2061686 - Fim

       // verificando a execução do ETL
       while not ExecutouETL do
       begin
          Sleep(60 * 1000); // interrompe por um minuto para efetuar novamente a verificação
       end;

       Result := True;

      except
        on e : exception do
        begin
           Result := False;
           MessageInfo := e.Message;
        end;
      end;

   finally
     FreeAndNil(cdsTemp);
     FreeAndNil(ArqETL);
   end;

end;

procedure TCtrlOperImob.SetdbETLImobAtualizacao(
  const Value: TDbETLImobAtualizacao);
begin
  FdbETLImobAtualizacao := Value; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
end;

procedure TCtrlOperImob.SetDataFim(const Value: TDateTime);
begin
  FDataFim := Value; // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
end;

procedure TCtrlOperImob.SetDataInicio(const Value: TDateTime);
begin
  FDataInicio := Value;  // Felipe A. Santos SOL 172601/14639 e SOL 172601/14640
end;

// Alterado por FHBS - SIG79081
procedure TCtrlOperImob.SetbFatorMesAntDiasMesAtual(const Value: Boolean);
begin
  FbFatorMesAntDiasMesAtual := Value;
end;
// Fim - Alterado por FHBS - SIG79081

// Felipe A. Santos Criação da rotina  SOL 172601/14639 e SOL 172601/14640
function TCtrlOperImob.ExecutouETL: boolean;
var
   sSQL : string;
   cdsTemp: TCMClientDataSet;
begin
  // Status = 'A' significa que tem ETL que está sendo executado

   //Cássio Rovaroto - SIG nº 59816 - Início
   //sSQL := 'SELECT FLGSTATUSEXEC '  + #13 +
   sSQL := ' SELECT 1 ' + #13 +
   //Cássio Rovaroto - SIG nº 59816 -
           '  FROM ETL_IMOB_ATUALIZACAO ' + #13 +
           ' WHERE FLGSTATUSEXEC = ' + QuotedStr('A') + #13 +
           '   AND DATA_INICIO = ' + QuotedStr(FormatDateTime('dd/mm/yyyy',DataInicio)) + #13 +
           '   AND DATA_FIM = ' + QuotedStr(FormatDateTime('dd/mm/yyyy',DataFim)) + #13 +
           '   AND IDMODULO = ' + IntToStr(Sistema.IdModulo);
   try
      cdsTemp := TCMClientDataSet.Create(nil);
      cdsTemp.Data := GetDataPacket(sSQL);

      Result := cdsTemp.IsEmpty;
   finally
      FreeAndNil(cdsTemp);
   end;
end;

end.
