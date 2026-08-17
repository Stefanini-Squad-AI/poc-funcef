unit uCtrlImobDocumento;

//***************************************************************************************
//Rotina.............: Docuimento.SetValues
//N. SIG.............: 133236 
//Data da Alteração..: 27/04/2023 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de procedimento de lançamento de alteradores de tributação.
//***************************************************************************************
//N. SIG.............: 116142
//Data da Alteração..: 13/07/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Inclusão do campo IDENVIODOCUMENTO.
//***************************************************************************************
//Rotina             : Documento.SetValues, RateioDocum.SetValues, LanctoDocum.SetValues
//N. SIG..........   : 115585
//Data da Alteração: : 18/05/2021 
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão de tratamento de tipo de serviço e valor base para
//                     gravação na tabela LANCTODOCUM. Retirada do tipo de serviço da
//                     tabela RATEIODOCUM.
//***************************************************************************************
//Rotina             : Documento.SetValues, RateioDocum.SetValues
//N. SIG..........   : 23656.59199
//Data da Alteração: : 27/11/2017
//Alteração Form:    : uCtrlImobDocumento
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Inclusão dos tratamentos para os campos NFSNUMERO, NFSSERIE,
//										 NFSDATAEMISSAO, NFSOBS, IDTIPOSERVICO e IDPROCESSO, nas tabelas
//										 DOCUMENTO e RATEIODOCUM.
//***************************************************************************************
{-------------------------------------------------------------------------------
Pendência   : 201128_18374  / 71763
Responsável : Luiz Carlos
Data        : 14/05/2018
Descrição   : Gravacao do Total na tabela Planilha
--------------------------------------------------------------------------------
Pendência   : 201128_18374
Responsável : Darivaldo Alencar
Data        : 31/05/2017
Descrição   : contabilização de diferença no alterador.
--------------------------------------------------------------------------------
Rotina......: LancaRateioContab
Nº SOL......: 162650
Nº KINTANA..: 1383795
Data........: 05/08/2011
Responsável.: Ricardo de Freitas Araújo
Descrição...: No loop da parametrizações das segragações por plano\patro ao
              lançar no contabilidade os valores deverão ser zerados, pois senão
              serão lançados erroneamente na contabilidade.
-------------------------------------------------------------------------------}

{-------------------------------------------------------------------------------
Rotina......: UpdateStatusBaixa
Nº SOL......: 136336
Nº KINTANA..: 815081
Data........: 05/07/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do parâmetro dDataLimite
-------------------------------------------------------------------------------}
{-----------------------------------------------------------------------------------------
Rotina      : TCtrlImobDocumento.RetornaSaldoDocumento
SOl_Kintana : 156667_1267057
Data        : 20/05/2011
Autor       : Ricardo de Freitas Araújo
Descrição   : Retorna Saldo de um Documento levando em conta os alteradores.

Rotina      : TCtrlImobDocumento.UpdateStatusBaixa
Descrição   : Para os casos de baixa de documento deverá alterar como já conciliado,
              para este documento não entrar na rotina de ajusta provisão.
{---------------------------------------------------------------------------------------------------

{
--------------------------------------------------------------------------------
Pendência   : SOL 150169 KINTANA 1092020
Responsável : BRUNO AZEVEDO
Data        : 14/01/2011
Descrição   : Excluir registros da "EVENTOIMOVEL" e "LANCOPERDIAIMOB" antes da
              exclusão dos documentos para evitar erro de integridade.
--------------------------------------------------------------------------------
Rotina..........: Insert
N. Sol..........: 130360
N. Kintana......: 734640
Data............: 08/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Substituição da control object CtrlLancamento para CtrlImobLancamento
}


interface

Uses classes, controls, DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject,
     uCmControlObject, uSistema, uDbDocumento, uDbLanctodocum, uDbLotexdocum,
     uDbRateiodocum,  uDbRecbtopagto, JclMath, JclStrings, uCMTypes,
     uDbEmpresaForn, uDbFornServ, uDbEmpresaCliente, uDbClientePess, uDbFornXRamo,
     uDbPessoa, uCmSqlParams, uCMMath, uCtrlLancamento, uCtrlPeriodo, DCapCarObj,
     uCtrlFinanc, uString, uCmDialogs, UCtrlOrcamento, uListaCamposHistCapCar,
     uCtrlModeloHistorico, uDbCcBaixasxDocum, uCtrlRAD, Dialogs, uCtrlRadPlus,
     uCtrlSegregacao, ucmClientDataSet, uCtrlPlanPrevContabPatro, uCtrlImobSegregacao,
     uCtrlDocumento, uCtrlImobLancamento;

Const
  MSGVALOROMDIFERENTE     = 'O Valor do Rateio em Outra Moeda é diferente do valor do lançamento en Outra Moeda, verifique.';
  MASGVALORDIFERENTE      = 'O Valor do Rateio é diferente do valor do lançamento, verifique.';
  MASGNAOEXISTERATEIO     = 'Não existem rateios a serem processados, verifique.';
  MSGNAOEXISTELANCTO      = 'Não existem lançamentos a serem processados, verifique.';
  MSGUSUARIOSEMPRIVILEGIO = 'Usuário sem privilégio de lançar/alterar documento com data programada indicada';
  MSGNUMCOMPLCADASTRADO   = 'Número/Complemento de Documento já cadastrado. Verifique';
  MSGNUMAPJACADSTRADO     = 'Número da AP já cadastrado';

Type
  TEventoPergunta = function(const sTexto: string): Boolean of object;

  TOperacaoEstorno = (oeSoProcessa, oeDialogProcessa, oeAppServerProcessa);
  TStatusDocImob = (sdocAbertoImob, ssdocAbertoImob1, sdocBaixadoImob);

  TOperacaoDocLancImob = (odlNone0Imob, odlAParcelarImob, odlEfetivoImob, odlParcelaImob, odlAlteradorImob,
  odlBaixaImob, odlNone6Imob, odlNone7Imob, odlNone8Imob, odlNone9Imob, odlLancaeBaixaImob, odlPrevAParcelarImob,
  odlPrevisaoImob, odlPrevParcelaImob, odlAdiantamentoImob, odlBaixaAdiantamentoImob, odlRegAdiantamentoImob, odlRegDocumentoImob);

  TOperacaoPrepareImob = (OpDocumentoImob, OpLanctoDocumImob);

  TDocState = (dsIdle, dstInsert, dstUpdate, dstDelete);

  TTipoForCli = (tfcFornecedor, tfcCliente);

  TSistemaLancto = (slCap, slCar);

  TTipoEstornoContab = (tecExcluido, tecEstornado, tecErro);

  TOPeracaoLancto = (olLancToDoc, olBaicaDoc, olsoContabiliza);

  TRateioImobLancamento = class
  private
    FValor: Double;
    FValorom: Double;
    FUnidNegocio: LongInt;
    FIdPatrocinadora: LongInt;
    FIdPrograma: LongInt;
    FIdPlanoPrev: LongInt;
    FCentroCusto: String;
    FPlaConta: String;
    FIdSegregaCriter: Integer;
    procedure SetCentroCusto(const Value: String);
    procedure SetIdPatrocinadora(const Value: LongInt);
    procedure SetIdPlanoPrev(const Value: LongInt);
    procedure SetIdPrograma(const Value: LongInt);
    procedure SetUnidNegocio(const Value: LongInt);
    procedure SetValor(const Value: Double);
    procedure SetValorom(const Value: Double);
    procedure SetPlaConta(const Value: String);
    procedure SetIdSegregaCriter(const Value: Integer);
  public
    property Valor: Double read FValor write SetValor;
    property Valorom: Double read FValorom write SetValorom;
    property UnidNegocio: LongInt read FUnidNegocio write SetUnidNegocio;
    property CentroCusto: String read FCentroCusto write SetCentroCusto;
    property IdPrograma: LongInt read FIdPrograma write SetIdPrograma;
    property IdPlanoPrev: LongInt read FIdPlanoPrev write SetIdPlanoPrev;
    property IdPatrocinadora: LongInt read FIdPatrocinadora write SetIdPatrocinadora;
    property PlaConta: String read FPlaConta write SetPlaConta;
    property IdSegregaCriter: Integer read FIdSegregaCriter write SetIdSegregaCriter;



  end;

  {*****************************************************************************
    > TCTRLPERSISTENTOBJECT
    Classe ancestral para persistência de dados em funções de acesso as
    classes de persistência de forma que essas fiquem em escopo privado a
    classe de controle.
  *****************************************************************************}
  TCtrlPersistentObject = Class
  private
    _Cds: TClientDataSet;
    fOwner: TCmControlObject;
    FDataBaseName: String;
  protected
    procedure SetDataBaseName(const Value: String); Virtual;
    procedure Clear; Virtual;
  public
    Constructor Create(Aowner: TCmControlObject); Virtual;
    Destructor Destroy; Override;
    property Owner: TCmControlObject read fOwner;
    property DataBaseName: String read FDataBaseName write SetDataBaseName;
  end;

  {*****************************************************************************
    > INTEGRAÇÃO BANCÁRIA
      Classe para persistência de dados em funções de acesso a tabelas de
      integração bancária
  *****************************************************************************}
  TIntImobBanco = Class(TCtrlPersistentObject)
  private
    FCodigosGrupo: TStrings;
  public
    Constructor Create(Aowner: TCmControlObject); Override;
    Destructor Destroy; Override;
    Function ListDocumentos(IDCliente: Double; DataProgramada: String; PortadorForma : Integer): OLEVariant;
    Function VerificaConsistencia(dados: Olevariant): boolean;
    Function AgrupaDocCnab(CdsCnab: TClientDataSet; bInTransaction,
    bAlteraEmisBloq: Boolean; sCamposParaGrupo: Array of String): Boolean;
    Function GetCodGrupoCnab(liCodDocumento:LongInt): LongInt;
    Function SetaMensagensCNAB(liCodDocumento, lICodGrupo: LongInt;
    sMensagens: Array of String; bApagaMensagens: Boolean = True): Boolean;
    Property CodigosGrupo: TStrings read FCodigosGrupo;
  End;

  {*****************************************************************************
    > RECBTOPAGTO
      Classe para persistência de dados em funções de acesso a classe de
      persistência da tabela RecbToPagto
  *****************************************************************************}
  TRecbToImobPagto = Class(TCtrlPersistentObject)
  private
    _Recbtopagto: TDbRecbtopagto;
  protected
    procedure SetDataBaseName(const Value: String); Override;
  public
    Constructor Create(Aowner: TCmControlObject); Override;
    Destructor Destroy; Override;
    function Inserir(liCodDocumento, liNumLancto, lidUsuarioInclusao,
              liCodLancFinanc, liCodPortForma, liNumLote, liCodlancnaoident, liNumBaixa: LongInt;
              NumChqBordero, DataFloat, DataBaixa: String): Boolean;
    function Excluir(liCodDocumento, liNumLancto: LongInt): Boolean;
  end;

  {*****************************************************************************
    > LANCTODOCUM
      Classe para persistência de dados em funções de acesso a classe de
      persistência da tabela LanctoDocum
  *****************************************************************************}
  TLanctoImobDocum = Class(TCtrlPersistentObject)
  private
    FCodDocumento: Double;
    FNumLancto: LongInt;
    FIdModulo: LongInt;
    FIdPessoa: LongInt;
    procedure SetCodDocumento(const Value: Double);
    procedure SetNumLancto(const Value: LongInt);
    procedure SetIdModulo(const Value: LongInt);
    procedure SetIdPessoa(const Value: LongInt);
  protected
    procedure SetDataBaseName(const Value: String); Override;
    procedure Clear; Override;
  public
    Constructor Create(Aowner: TCmControlObject); Override;
    Destructor Destroy; Override;
    procedure SetValues( dDatalancto: TDateTime; liCoddocumento, liNumlancto: LongInt; rVlrliquido,
    rValorOM, rValor: Double; liUnidnegoc, liPlncodigo, liNumlotemanual,
    liIdusuarioinclusao, liIdpessoa, liIdnflivro, liEstorno, liCodtipdoc,
    liCoddocinss, liCodalterador: LongInt; sOperacao,  sNumrecibo, sNumnf,
    sNumfatura, sHistoricocompl, sFlgtipofatura, sFlgrecebeunf, sFlgfatemitida,
    sDebcre: String; liIdModulo: LongInt; liPlanoConta: LongInt; bUsaPlanoPatro: Boolean;
    bContabiliza: Boolean = False; iCodPortForma: Integer = 0; iDiasFloat: Integer = 0;
    sContaBaixa: String = ''; liSubContaBaixa: Integer = 0;
    rVlrDifContab: double = 0 //Darivaldo Alencar SOL201128_18374
    ; rIdTipoServico: LongInt = -1; rIdProcesso : LongInt = -1; rValorRetencao: Double = 0 //Cássio Rovaroto - SIG nº 115585
    ; rIDENVIODOCUMENTO: Double = 0  //Ewerton Beltramini - SIG 116142
    );
    property CodDocumento: Double read FCodDocumento write SetCodDocumento;
    property NumLancto: LongInt read FNumLancto write SetNumLancto;
    property IdModulo: LongInt read FIdModulo write SetIdModulo;
    property IdPessoa: LongInt read FIdPessoa write SetIdPessoa;

  end;

  {*****************************************************************************
    > RATEIODOCUM
      Classe para persistência de dados em funções de acesso a classe de
      persistência da tabela Rateiodocum
  *****************************************************************************}
  TRateioImobDocum = Class(TCtrlPersistentObject)
  public
    procedure SetValues(rValor, rValorOM, rVlrresorcamen: Double; liIdrateiodocum, liIdpessoa,
    liCoddocumento, liUnidnegoc, liMoecodigo, liIdusuarioinclusao, liIdreservaorcamen, liPlano,
    liIdplanoprev, liIdpatro, liIdprograma, liIdprocesso, liIdempresa: LongInt; sCodtiprecdes,
    sRecpag, sCodcentrorespon, sCodcentrocusto, sNumimovel: String;
    const bSegregaOrigem: boolean = true;
    const IdPlanoVirtual: integer = 0;
    const IdSegregaContr: integer = 0;
    sNumContrato: Integer = -1
    );
  End;

  {*****************************************************************************
    > CCBAIXASXDOCUM
      Classe para persistência de dados em funções de acesso a classe de
      persistência da tabela CcBaixasxDocum
  *****************************************************************************}
  TCCBaixasxImobDocum = Class(TCtrlPersistentObject)
  public
    procedure SetValues(rValor: Double; liIdCcBaixasxDocum, liIdpessoa,
    liCodDocumento, liUnidNegoc, liPlano, liIdplanoPrev, liIdPatro,
    liIdSegregaCriter: LongInt; sPlaConta: String);

  End;

  {*****************************************************************************
    > SALDO
      Classe para persistência de dados em funções de acesso a Saldo de documentos
      e lotes
  *****************************************************************************}
  TImobSaldo = Class(TCtrlPersistentObject)
  private
    fValor: Double;
    fValorOM: Double;
    FValorBruto: Double;
    procedure SetValorBruto(const Value: Double);
  protected
    procedure Clear; Override;
  public
    property Valor: Double read fValor;
    property ValorOM: Double read fValorOM;
    property ValorBruto: Double read FValorBruto write SetValorBruto; //andre tavares - pendência 22005 - 19/04/2006
    procedure CalculaSaldo(iCodDocumento: Double; dDataLimite: TDateTime = 0);
    procedure GetValorBruto(iCodDocumento: Double);
  End;

  {*****************************************************************************
    > LOTE
      Classe para persistência de dados em funções de acesso a LOTE e LOTEXDOCUM
  *****************************************************************************}

  TImobLote = Class(TCtrlPersistentObject)
  private
    fSaldo: Double;
    fValor: Double;
    fNumLote: LongInt;
    fCodPortForma: LongInt;

  protected
    procedure Clear; Override;
  public
    property Saldo: Double read fSaldo;
    property Valor: Double read fValor;
    property NumLote: LongInt read fNumLote write fNumLote;
    property CodPortForma: LongInt read fCodPortForma;

    procedure CalculaSaldo(liNumLote: LongInt);
    function GetNumLote(liCodDocumento: LongInt):Boolean;
    function LiberaEmissao(liNumLote: LongInt; bExcluiLote: Boolean): Boolean;
    function BaixaDoc(licodocumento, liNumlote: LongInt): Boolean;
    function BaixaLote(liNumlote: LongInt): Boolean;
  End;

  {*****************************************************************************
    > FORCLI
      Classe para persistência de dados em funções de acesso a inclusão de Pessoa,
      Subtipos Cliente e Fornecedor, Ramo de Fornecedor e Tipo de Cliente
  *****************************************************************************}

  TImobForCli = Class(TCtrlPersistentObject)
  Protected
    procedure SetDataBaseName(const Value: String); Override;

  Private
     _DbEmpresaForn:    TDbEmpresaForn;
     _DbFornServ:       TDbFornServ;
     _DbEmpresaCliente: TDbEmpresaCliente;
     _DbClientePess:    TDbClientePess;
     _DbFornXRamo:      TDbFornXRamo;
     _DbPessoa:         TDbPessoa;
     Procedure CriaFornecedor(liIdPessoa, liIdEmpresa, liCodsubconta, liPlano, liIdRamoForne: LongInt;
               sCcusto, sContacadianto, sContacforn, sContacdespesa: String);
     procedure CriaFornserv(liIdpessoa: LongInt);
     procedure CriaEmpresaForn(liIdPessoa, liIdempresa, liPlano, liCodSubConta: LongInt;
               sCcusto, sContacadianto, sContacdespesa, sContacforn: string);
     procedure InsereRamoXForn(liIdpessoa, liIdRamoForn: LongInt);
     Procedure CriaCliente(liIdpessoa, liIdEmpresa, liCodsubconta, liPlano, liIdTipocli: LongInt;
               sCcusto, sContacadianto, sContacCliente, sContacdespesa: string);
     procedure CriaClientepess(liIdpessoa, liIdTipoCli: LongInt);
     procedure CriaEmpresaCli(liIdpessoa, liIdEmpresa, liPlano, liCodsubconta: LongInt;
               sCcusto, sContacadianto, sContacReceita, sContacCliente: string);
  Public
     Constructor Create(Aowner: TCmControlObject); Override;
     Destructor Destroy; Override;
     Function CriaPessoa(sNome, sRazaoSocial, sDocumento: String; TipoPessoa: TTipoPessoa): Double;
     function Inserir(liIdPessoa, liIdEmpresa, liCodsubconta, liPlano, liIdRamoTipocli: LongInt;
                    sCcusto, sContacadianto, sContacForCli, sContacdespesa: String;
                    TipoForCli: TTipoForCli):Boolean;
  End;

  {*****************************************************************************
    > DOCUMENTO
  *****************************************************************************}
  TCtrlImobDocumento = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure AfterInitialize; Override;

  private
    _Orcamento: TOrcamentoBackMT;
    _liPlnCodigoAdianto: Integer;
    //Cássio - SOL Nº 130360 KTN Nº 734640 - Início
    //_LancaContab: TCtrlLancamento;
    _LancaContab: TCtrlImobLancamento;
    //Cássio - SOL Nº 130360 KTN Nº 734640 - Fim
    _DocumentoContab : TCtrlDocumento;
    _Periodo: TCtrlPeriodo;
    _ModeloHist : TCtrlModeloHistorico;
    _Segregacao : TCtrlSegregacao;
    _PlanPrevContabPatro: TCtrlPlanPrevContabPatro;
    Rad : TCtrlRAD;
    CtrlRadPlus: TCtrlRadPlus;
    FiReferenciaRad: longint;
    _DtmCapCarObj: TDtmCapCarObj;
    _Lotexdocum: TDbLotexdocum;
    _LstRateioDocum: TList;
    _LstCcBaixasxDocum: TList;
    _LstLanctoDocum: TList;
    _LstRateioLancamento: TList;
    _OperacaoDocLancImob: TOperacaoDocLancImob;
    _StatusDocImob: TStatusDocImob;
    _OperacaoPrepareImob: TOperacaoPrepareImob;
    _DocState: TDocState;
    _Documento: TDbDocumento;
    FLanctodocum: TLanctoImobDocum;
    FRateiodocum: TRateioImobDocum;
    FCcBaixasxDocum: TCCBaixasxImobDocum;
    FIdUsuario: Double;
    FIdEspAcesso: Double;
    FRecbToPagto: TRecbToImobPagto;
    FCodDocumento: Double;
    FSaldo: TImobSaldo;
    FForCli: TImobForCli;
    FLote: TImobLote;
    FEstornaDocumento: Boolean;
    FIntBanco: TIntImobBanco;
    FUsaPlanoPatro: Boolean;
    FIdModulo: Integer;
    fPlnCodigo: Integer;
    FPartidaDobrada: Boolean;
    FOPeracaoLancto: TOperacaoLancto;
    FDataDisponibilidade: TDateTime;
    FSlipAutomatico : Boolean;
    FsCtrlDocObs: String;
    FCentroRespon: string;
    FQtdeCotas: extended;
    _ImobSegregacao : TCtrlImobSegregacao;
    FMantemLancContabil: boolean;

    procedure SetIdEspAcesso(const Value: Double);
    procedure SetIdUsuario(const Value: Double);
    procedure SetLanctodocum(const Value: TLanctoImobDocum);
    procedure SetRateiodocum(const Value: TRateioImobDocum);
    procedure SetCcBaixasxDocum(const Value: TCCBaixasxImobDocum);
    function ValidaOperacao(const bExclusao: boolean): Boolean;
    function ValidaLote(const bExclui: boolean = false): Boolean;
    function AutorizaVencimento: Boolean;
    function ProcessaLanctoDocum: Boolean;
    function ProcessaRateioDocum: Boolean;
    function VerificaContaBaixaxPrograma: Boolean; // 02/01/05 Alex 20682
    function ProcessaCCBaixasxDocum: Boolean;   //23/12/03 - alex 5342
    procedure ApagaContaContabil;               //27/12/03 - alex 5342
    procedure SetRecbToPagto(const Value: TRecbToImobPagto);
    procedure SetCodDocumento(const Value: Double);
    procedure SetSaldo(const Value: TImobSaldo);
    procedure SetForCli(const Value: TImobForCli);
    procedure SetLote(const Value: TImobLote);

    function LancaRateioContab(liCodDocumento, liCodAlterador, iCodPortForma, liPlanoConta, liUnidNegocioLancto,
        liIdEmpresa, liIdModulo, liIdUsuario, liPlano: LongInt;
        Var liPlnCodigo: Double; dDataLancto: TDateTime; rValor, rValorOM : Double;
        iOperacao: Integer; sDebCre, sHistoricoCompl, sNumChqBord, sContaBaixa: String; liSubContaBaixa: Integer;
        bUsaPlanoPatro: Boolean; var liPlnAntecipa: double; rTotal: double): Boolean;
    procedure SetEstornaDocumento(const Value: Boolean);
    procedure SetIntBanco(const Value: TIntImobBanco);
    procedure SetIdModulo(const Value: Integer);
    procedure SetUsaPlanoPatro(const Value: Boolean);
    procedure SetPartidaDobrada(const Value: Boolean);
    procedure SetOPeracaoLancto(const Value: TOperacaoLancto);
    procedure SetDataDisponibilidade(const Value: TDateTime);
    procedure SetSlipAutomatico(const Value: Boolean);
    function VerificaDocumento: Boolean; // andré tavares - pendência 18178 - 02/12/2004
    // verifica se gera rad com os dados do rateio
    function GeraRad(idreferencia: double; codDocumento: double; codTipDoc: double; sRecPag: string; valor: Extended): Boolean; // andré tavares - pendência
    // insere um processo Rad
    function InserirRAD: Boolean;
    function ExcluirRAD(iCodDocumento: int64): Boolean;
    function AlterarRAD(iCodDocumento: int64): Boolean;
    procedure SetsCtrlDocObs(const Value: String);
    procedure SetCentroRespon(const Value: string);
    procedure SetQtdeCotas(const Value: extended);
    function VerificaPlanosRateio: Boolean;
    procedure SetMantemLancContabil(const Value: boolean);                 //edilaine - SOL201128_18374    
  Public
    OnPergunta  : TEventoPergunta;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    property sCtrlDocObs : String read FsCtrlDocObs write SetsCtrlDocObs;
    property Lanctodocum: TLanctoImobDocum read FLanctodocum write SetLanctodocum;
    property Rateiodocum: TRateioImobDocum read FRateiodocum write SetRateiodocum;
    property CcBaixasxDocum: TCCBaixasxImobDocum read FCcBaixasxDocum write SetCcBaixasxDocum;
    property RecbToPagto: TRecbToImobPagto read FRecbToPagto write SetRecbToPagto;
    property Saldo: TImobSaldo read FSaldo write SetSaldo;
    property ForCli: TImobForCli read FForCli write SetForCli;
    property Lote: TImobLote read FLote write SetLote;
    property IntBanco: TIntImobBanco read FIntBanco write SetIntBanco;
    property IdEspAcesso: Double read FIdEspAcesso write SetIdEspAcesso;
    property IdUsuario: Double read FIdUsuario write SetIdUsuario;
    property CodDocumento: Double read FCodDocumento write SetCodDocumento;
    property EstornaDocumento: Boolean read FEstornaDocumento write SetEstornaDocumento;
    property IdModulo: Integer read FIdModulo write SetIdModulo;
    property UsaPlanoPatro: Boolean read FUsaPlanoPatro write SetUsaPlanoPatro;
    property PlnCodigo: Integer read fPlnCodigo;
    property PartidaDobrada: Boolean read FPartidaDobrada write SetPartidaDobrada;
    property DataDisponibilidade: TDateTime read FDataDisponibilidade write SetDataDisponibilidade;
    property OPeracaoLancto: TOperacaoLancto read FOPeracaoLancto write SetOPeracaoLancto;
    property SlipAutomatico: Boolean read FSlipAutomatico write SetSlipAutomatico;
    property CentroRespon: string read FCentroRespon write SetCentroRespon;
    property QtdeCotas: extended read FQtdeCotas write SetQtdeCotas;
    property MantemLancContabil : boolean read FMantemLancContabil write SetMantemLancContabil;   //edilaine - SOL201128_18374    

    function Insert: Boolean;
    function Update: Boolean;
    function Delete(Const bExcluiContabLancDoc: Boolean = True): Boolean;

    function Estornar(dData: TDateTime;
                      liIdModulo,
                      liIdEmpresa,
                      liIdUsuario,
                      liCodDocumento,
                      liNumLanc,
                      liPlanoConta: LongInt;
                      bUsaPlanoPatro: Boolean;
                      OperacaoEstorno: TOperacaoEstorno = oeSoProcessa;
                      liCodDocumento2: LongInt = 0;
                      liNumLanc2: LongInt = 0;
                      bLancaContabEstornaAdianto: Boolean = True;
                      bEstornoDocum: Boolean = false): Boolean;

    procedure Prepare(OperacaoPrepareImob: TOperacaoPrepareImob; OperacaoDocLancImob: TOperacaoDocLancImob; StatusDocImob: TStatusDocImob = sdocAbertoImob);
    procedure SetValues( liCoddocumento: LongInt; rNodocumento: Double; sCompldocumento, sStatus,
    sRecpag, sOperacao, sNumslip, sNumleitcodbarras, sPlaconta, sCodcentrocusto,
    sNossonumero, sNumdigcodbarras, sGrupodoc, sFlgemitelancbaix, sFlgconfirmarecpag,
    sEmisbloq, sReferencia, sObs: String; dDatavencto, dDataemissao, dDataprogramada,
    dDataremessa, dDatalimite, dDatacorrecao: TDateTime; rVlrmulta, rValorjuros,
    rValordesconto, rPercjurossimples, rPercjurosatuarial: Double; liCodtipdoc, liIdpessoa,
    liIdmodulo, liIdforcli, liNumfatura,
    liIdcbancaria, liUnidnegoc, liPlano, liNumcpbaixa,
    liNumapgr, liMoecodigo, liLotetransmissao, liIndicecorrecao, liIdusuarioinclusao, liIdempresa,
    liFlgnaoconciliado, liControleremessa, liCodsubconta, liCodportforma, liCodgrupocnab,
    liCodgeradorinss, liCodforma: LongInt;
    const iIdSegregaCriter: integer = -1;
    const sPlacontaAnt: String = ''
    //Cássio Rovaroto -  SIG nº 23656.59199 - Início
    ; const sNfsNumero: string  = '';
    const sNfsSerie: string = '';
    const dNfsDataemissao: TDateTime = 0;
    const sNfsObs: string = ''
    //Cássio Rovaroto -  SIG nº 23656.59199 - Fim
    ; const iNfsServico: Integer = 0
    ; const sFlgSimples: string =  ''
    );

    function ExisteNumDoc(sRecPag: String; rIdForCli, rIdEmpresa, rNoDocumento: Real; sComplDocumento: String): Boolean;

    function GetDebCre(dCodTipDoc: Double): String;

    function AjustaDataFloat(dDataLancto: TDateTime; iFloat: Integer; SistemaLancto: TSistemaLancto) :TDateTime;

    procedure EmiteLancaBaixa(liCodDoc: LongInt; bMarcaComoEmitido: boolean);

    //DAVID - 14646
    function RecuperaParamIntegra( iIdEmpresa : integer; sRecPag : string ) : OLEVariant;

    function GetNumFatura: Cardinal;

    function GetSequenceDocumento: Cardinal;

    function GetNumApGr: Cardinal;

    function GetNumChqBordero: Cardinal;

    function UpdateDataDisponib(liCodDocumento: LongInt;dDataDisp :TDatetime): Boolean;

    // Alterado por FHBS - SOL: 136336 KTN: 815081 - Adicionei a dDataLimite
    function UpdateStatusBaixa(liCodDocumento: LongInt; dDataLimite: TDateTime = 0): Boolean;

    function UpdateStatusBaixaAdianto(liCodDocumento, liPlnCodigo, iNumLancto: LongInt;
    dDataLancto :TDateTime; SistemaLancto: TSistemaLancto; bCancelaBaixa: Boolean = False): Boolean;

    function UpdateStatusOrcamento(liCodDocumento: LongInt; sStatus: Char): Boolean;
    function UpdateValorOrcamemto(liIdRateioDocum: LongInt; rValor: Double): Boolean;
    function RegAdiantamento(liCodDoc, liCodDocAdto, liIdEmpresa, liIdUsuario, liIdModulo, liPlanoConta: LongInt;
        sDataRegu: TDateTime; sDocumDoc, sDocumAdto, sNomeCliFor: String; rValor: Double; bUsaPlanoPatro: Boolean;
        SistemaLancto: TSistemaLancto): Boolean;
    function EstornaExcluiContab(liPlanilha, liEmpresa, liIdUsuario, liIdModulo: LongInt; dDataLancto: TDateTime;
      bUsaPlanopatro: Boolean): TTipoEstornoContab;
    Class function RoundCMLocal(rValor: Double; iCasasDec: Integer): Double;
    function GetNumDiasVencto(const recpag: string; const codDocumento: int64; const idEmpresa: integer): Integer;
    function GetMaiorCR(sListaCodDocs: string): string;

    //Ricardo Freitas - SOL: 156667 - KINTANA: 1267057
    //Retorna Saldo de um Documento levando em conta os alteradores
    function RetornaSaldoDocumento(CodDocumento:string; var DebCre:string):Real;


  End;



implementation

{ TCtrlImobDocumento }

Uses uCtrlJurosCorrecao, uCtrlImpostoRetido;

function TCtrlImobDocumento.Update: Boolean;
var
  bContabilizacao : boolean;
  x : integer;
  oObj : tControl;
begin
  if not VerificaDocumento then
  begin
    Raise Exception.Create(MessageInfo);
  end;
  _DocState := dstUpdate;
  Result := ValidaOperacao(false);

  if result and  ((_Documento.Operacao.AsString = '2') or (_Documento.Operacao.AsString = '3')) then
    result := AutorizaVencimento;

  If Result Then
  Begin
    _Documento.Operacao.AsString := IntToStr(Integer(_OperacaoDocLancImob));
    _Documento.Status.AsString := IntToStr(Integer(_StatusDocImob));

    If _OperacaoPrepareImob = OpDocumentoImob Then
    begin
       _Documento.DataDisponib.AsDateTime := FDataDisponibilidade;
       // se o documento for com múltiplas contas de baixa, apagar as referências de placonta e plano
       ApagaContaContabil;
        Result := VerificaContaBaixaxPrograma;
       if Result then Result := _Documento.Update
    end
    Else
       Result := True;

    If Result Then
    Begin
        bContabilizacao := ( OperacaoLancto = olSoContabiliza );
        If (_OperacaoPrepareImob = OpDocumentoImob) Then
          Result := ProcessaRateioDocum;

        If (_OperacaoPrepareImob = OpDocumentoImob) Then
          Result := ProcessaCcBaixasxDocum;

        If Result Then
          Result := ProcessaLanctoDocum;

       if Result then
          //Só altero o RAD se não for contabilização...
          if not bContabilizacao then
          Result := AlterarRAD(_Documento.Coddocumento.AsInteger);
     End
  Else
    MessageInfo := _Documento.MessageInfo;
  End;

  For X := 0 To (_LstLanctoDocum.Count - 1) Do
  begin
    oObj := self._LstLanctoDocum[X];
    FreeAndNil(oObj);
  end;

  For X := 0 To (_LstCcBaixasxDocum.Count - 1) Do
  begin
//    TDbCcBaixasxDocum(self._LstCcBaixasxDocum[X]).Free;
    oObj := self._LstCcBaixasxDocum[X];
    FreeAndNil(oObj);
  end;

  For X := 0 To (_LstRateioDocum.Count - 1) Do
  begin
//    TDbRateiodocum(self._LstRateioDocum[X]).Free;
    oObj := self._LstRateioDocum[X];
    FreeAndNil(oObj);
  end;

  self._LstLanctoDocum.Clear;
  self._LstCcBaixasxDocum.Clear;
  self._LstRateioDocum.Clear;

end;

function TCtrlImobDocumento.AutorizaVencimento: Boolean;
var
  iModulo, iNumDias, iIdOperFunc: Integer;
  sTextoPergunta: string;
  dDataVencto : TDateTime;
  bExisteTipoProc : boolean;
begin
  result := true;
  sTextoPergunta := '';
  FiReferenciaRad := 27; //valor default

  if _Documento.Recpag.AsString = 'P' Then
     iModulo := 3
  else
     iModulo := 4;

     iNumDias := GetNumDiasVencto(_Documento.Recpag.AsString, _Documento.CodDocumento.asInteger, _Documento.Idpessoa.asInteger);
     if iNumDias > 0 then
     begin
       _DtmCapCarObj.SQLOperFuncDiasVencto.Prepare;
       _DtmCapCarObj.SQLOperFuncDiasVencto.ParamByName('IDMODULO').AsFloat := iModulo;
       _Cds.Close;
       _Cds.Data := _DtmCapCarObj.SQLOperFuncDiasVencto.Data;

       if (Not _Cds.IsEmpty) Then
       begin
          iIdOperFunc := _Cds.FieldByName('IDOPERFUNC').AsInteger;

          _DtmCapCarObj.SQLAutorizaDiasVencto.Prepare;
          _DtmCapCarObj.SQLAutorizaDiasVencto.ParamByName('IDPESSOA').AsFloat := _Documento.Idpessoa.AsFloat;
          _DtmCapCarObj.SQLAutorizaDiasVencto.ParamByName('IDOPERFUNC').AsFloat := iIdOperFunc;
          _DtmCapCarObj.SQLAutorizaDiasVencto.ParamByName('IDESPACESSO').AsFloat := sistema.idespacesso;
          _DtmCapCarObj.SQLAutorizaDiasVencto.ParamByName('IDUSUARIO').AsFloat := _Documento.Idusuarioinclusao.AsFloat;

          _Cds.Close;

          _Cds.Data := _DtmCapCarObj.SQLAutorizaDiasVencto.Data;

          if iNumDias < 0 then


            Result := not (_Documento.Datavencto.AsDateTime <= Date + (iNumDias + 1))
          else
          begin
            dDataVencto := DiasUteis.SomaDiasUteis(Sistema.IdEmpresa,Date, iNumDias, True,False,False);
            sTextoPergunta := formatDateTime('DD/MM/YYYY', dDataVencto);
            Result := ( trunc(_Documento.DataProgramada.AsDateTime) >= trunc(dDataVencto));
            sTextoPergunta := 'A data mínima para se gerar o documento é dia '+ sTextoPergunta + '. Deseja criar uma reprogramação para a nova data? ';
          end;

           _Cds.Close;

          If (not result) and ((Not _Cds.IsEmpty)) Then //se o usuário está autorizado
          begin
            bExisteTipoProc := False;

            if (Sistema.VersaoRAD = '+') then
            begin
               bExisteTipoProc := ( CtrlRADPlus.RecuperaTipoProcesso( 30, Sistema.IdEmpresa) > 0 )
            end
            else
            begin
              _Cds.Data := GetDataPacket(' SELECT IDREFERENCIA FROM RADTIPOPROCESSO WHERE IDREFERENCIA = 30 ');
              bExisteTipoProc := not _Cds.IsEmpty;

              _Cds.Close;

            end;

            if (bExisteTipoProc) and (sistema.UsaRAD) then
            begin

              if (assigned(OnPergunta)) then //se o evento está associado a um método de interface então faz a pergunta
                result := OnPergunta(sTextoPergunta) //dispara o evento que fará a pergunta (se o usuário deseja reprogramar a data vencto)
              else //senão assume a reprogramação automática
                result := true;


              if not result then //se resposta negativa
                MessageInfo := 'Não foi possível Inserir/Alterar o documento, pois a Data de Vencimento do mesmo é anterior à data mínima para lançamento ' +
                               formatDateTime('DD/MM/YYYY', dDataVencto)+ '.'
              else //senão se resposta positiva então reprograma
                FiReferenciaRad := 30; //referência do processo Rad para reprogramação do documento

            end//if
            else result := true;   // não tem rad ou não tem processo 30

          end
          else  //se o usuário não está autorizado
            if not result then //a data do documento está fora dos parâmetros
              MessageInfo := MSGUSUARIOSEMPRIVILEGIO;
       end
     end else
       result := true;

  If _Cds.Active Then _Cds.Close;
end;

constructor TCtrlImobDocumento.Create;
Var
  X: Integer;
begin
  inherited;
  OnPergunta := nil;
  FiReferenciaRad := 27;
  fOPeracaoLancto := olLancToDoc;
  FPartidaDobrada := false;
  FIdModulo := 0;
  FUsaPlanoPatro := True;
  FSlipAutomatico := False;

  _DtmCapCarObj := TDtmCapCarObj.Create(nil);
  For X:=0 To _DtmCapCarObj.ComponentCount - 1 Do
    If _DtmCapCarObj.Components[x] is TCMSqlParams Then
       TCMSqlParams(_DtmCapCarObj.Components[x]).ControlObject := Self;

  _Documento := TDbDocumento.Create(Self);
  fLanctodocum    := TLanctoImobDocum.Create(Self);
  FRecbToPagto    := TRecbToIMobPagto.Create(Self);
  fRateiodocum    := TRateioImobDocum.Create(Self);
  fCCBaixasxDocum := TCCBaixasxImobDocum.Create(Self);

  FSaldo := TImobSaldo.Create(Self);
  FForCli := TImobForCli.Create(Self);
  fIntBanco := TIntImobBanco.Create(Self);
  fLote := TImobLote.Create(Self);
  _Lotexdocum := TDbLotexdocum.Create(Self);
  _LstRateioDocum      := TList.Create;
  _LstCcBaixasxDocum   := TList.Create;
  _LstLanctoDocum      := TList.Create;
  _LstRateioLancamento := TList.Create;
  _OperacaoDocLancImob := odlEfetivoImob;
  _StatusDocImob := sdocAbertoImob;
  _OperacaoPrepareImob := opDocumentoImob;
  _DocState := dsIdle;
  //Cássio - SOL Nº 130360 KTN Nº 734640 - Início
  //_LancaContab := TCtrlLancamento.Create;
  _LancaContab := TCtrlImobLancamento.Create;
  //Cássio - SOL Nº 130360 KTN Nº 734640 - Fim
  _DocumentoContab := TCtrlDocumento.Create;
  _ModeloHist  := TCtrlModeloHistorico.Create;
  _Periodo :=  TCtrlPeriodo.Create;
  _Orcamento := TOrcamentoBackMT.Create;
  _Segregacao := TCtrlSegregacao.Create;
  _PlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  FEstornaDocumento := False;
  fDataDisponibilidade := 0;
  FQtdeCotas := 0;
  
  MantemLancContabil := false;   //edilaine - SOL201128_18374

  _ImobSegregacao := TCtrlImobSegregacao.Create;
end;

destructor TCtrlImobDocumento.Destroy;
begin
  FreeAndNil(fLanctodocum);
  FreeAndNil(fRateiodocum);
  FreeAndNil(fCCBaixasxDocum);
  FreeAndNil(FSaldo);
  FreeAndNil(FRecbToPagto);
  FreeAndNil(FForCli);
  FreeAndNil(fLote);
  FreeAndNil(fIntBanco);
  FreeAndNil(_Documento);
  FreeAndNil(_Lotexdocum);
  _LstRateioLancamento.Clear;
  FreeAndNil(_LstRateioLancamento);
  _LstRateioDocum.Clear;
  FreeAndNil(_LstRateioDocum);
  _LstCcBaixasxDocum.Clear;
  FreeAndNil(_LstCcBaixasxDocum);
  _LstLanctoDocum.Clear;
  FreeAndNil(_LstLanctoDocum);
  FreeAndNil(_LancaContab);
  FreeAndNil(_DocumentoContab);
  FreeAndNil(_ModeloHist);
  FreeAndNil(_Periodo);
  freeAndNil(_Segregacao);
  FreeAndNil(_PlanPrevContabPatro);
  FreeAndNIl(_DtmCapCarObj);
  FreeAndNil(_Orcamento);
  FreeAndNil(Rad);
  FreeAndNil(CtrlRadPlus);
  FreeAndNil(_ImobSegregacao);

  inherited;
end;

procedure TCtrlImobDocumento.DoChangeDataBase;
begin
  inherited;
  _Documento.DataBaseName := DataBaseName;

  fLanctodocum.DataBaseName := DataBaseName;
  fRateiodocum.DataBaseName := DataBaseName;
  fCCBaixasxDocum.DataBaseName := DataBaseName;
  fRecbToPagto.DataBaseName := DataBaseName;
  FSaldo.DataBaseName := DataBaseName;
  FForCli.DataBaseName := DataBaseName;
  IntBanco.DataBaseName := DataBaseName;
  fLote.DataBaseName := DataBaseName;

  _Lotexdocum.DataBaseName := DataBaseName;
end;

function TCtrlImobDocumento.VerificaDocumento: Boolean;
var cdsCheckDoc : TcmClientDataSet;
  _iCodDocumento: integer;
  sMsg : string;
begin
  cdsCheckDoc := TcmClientDataset.Create(nil);
  _iCodDocumento := trunc(fCodDocumento);
  if _iCodDocumento = 0 then
    _iCodDocumento := _Documento.Coddocumento.AsInteger;
  if _iCodDocumento = 0 then
    _iCodDocumento := TDbLanctodocum(_LstLanctoDocum[0]).CodDocumento.AsInteger;

  try

    cdsCheckDoc.data := GetDataPacket('SELECT EMISBLOQ, STATUS, OPERACAO FROM DOCUMENTO WHERE CODDOCUMENTO = '+ inttostr(_iCodDocumento));

    result :=  not ((cdsCheckDoc.fieldByName('EMISBLOQ').asString = 'S') and (cdsCheckDoc.fieldByName('STATUS').asString <> '2'));

    if not result then
      result :=  cdsCheckDoc.fieldByName('OPERACAO').asString = '14';

   if not result then
     MessageInfo := 'Este documento não pode ser alterado ou excluído, pois um boleto já foi emitido ou está num arquivo emitido ao banco.'
   else
   begin
       cdsCheckDoc.Close;
       // esta query retorna todos os documentos vinculados e seus respectivos impostos acumulados
       cdsCheckDoc.data := GetDataPacket(' SELECT I.CODTIPOCUSTAGREG, '+#13+
                                         '        I.CODDOCUMENTO AS DOCSCOMIMP, '+#13+
                                         '        D2.CODDOCUMENTO AS DOCSVINCULADOS, '+#13+
                                         '        DVINC.NODOCUMENTO, '+#13+
                                         '        DVINC.COMPLDOCUMENTO, '+#13+
                                         '        T.DESCCUSTAGREG '+#13+
                                         ' FROM DOCXIMPOSTOACUM DXA, IMPOSTORETIDO I, DOCUMENTO DVINC, TIPOAGRE T, '+#13+
                                         '      (SELECT DXA.IDIMPOSTORETIDO, DXA.CODDOCUMENTO, DXA.CODTIPOCUSTAGREG, I.IDFORCLI, I.DATARETENCAO '+#13+
                                         '       FROM DOCXIMPOSTOACUM DXA, IMPOSTORETIDO I '+#13+
                                         '       WHERE DXA.CODDOCUMENTO =  '+ inttostr(_iCodDocumento) +' AND '+#13+
                                         '             DXA.IDIMPOSTORETIDO = I.IDIMPOSTORETIDO) D2 '+#13+
                                         ' WHERE DXA.IDIMPOSTORETIDO = I.IDIMPOSTORETIDO AND '+#13+
                                         '       DXA.CODDOCUMENTO = I.CODDOCUMENTO AND '+#13+
                                         '       D2.DATARETENCAO = I.DATARETENCAO AND '+#13+
                                         '       D2.CODDOCUMENTO <> DXA.CODDOCUMENTO AND '+#13+
                                         '       D2.IDFORCLI = I.IDFORCLI  AND '+#13+
                                         '       D2.IDIMPOSTORETIDO = I.IDIMPOSTORETIDO AND '+#13+
                                         '       D2.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG AND '+#13+
                                         '       I.CODDOCUMENTO = DVINC.CODDOCUMENTO AND '+#13+
                                         '       T.CODTIPOCUSTAGREG = I.CODTIPOCUSTAGREG ');


       result := cdsCheckDoc.isEmpty;
       if not result then
       begin
         sMsg := '';

         cdsCheckDoc.First;
         while not cdsCheckDoc.Eof do
         begin
           sMsg := sMsg + 'Nº '+ cdsCheckDoc.fieldByName('NODOCUMENTO').asString + '/' + cdsCheckDoc.fieldByName('COMPLDOCUMENTO').asString + ' - '+
                   cdsCheckDoc.fieldByName('DESCCUSTAGREG').asString + #13;
           cdsCheckDoc.Next;
         end;//while

         MessageInfo := 'Este documento não pode ser alterado ou excluído, pois há lançamento(s) de alterador(es) '+
                        'de imposto(s) acumulado(s) no(s) documento(s):'+#13+ sMsg;
       end;
   end;

  finally
    cdsCheckDoc.Close;
    FreeAndNil(cdsCheckDoc);
  end;
end;

function TCtrlImobDocumento.Delete(Const bExcluiContabLancDoc: Boolean = True): Boolean;
Var
  iNovoItem, x: Integer;
  oImpostoRetido: TCtrlImpostoRetido;
  oObj : TControl;
begin
   oImpostoRetido := TCtrlImpostoRetido.Create;
   oImpostoRetido.InitializeAs(Self);
   oImpostoRetido.OpenTransaction := false;
   oImpostoRetido.IdUsuario :=  Trunc(Self.IdUsuario);
   oImpostoRetido.IdEspAcesso := Trunc(Self.IdEspAcesso);

   Try
      Result := ValidaOperacao(true);
      if not result then
        Raise Exception.Create(MessageInfo);

      If FCodDocumento = 0 Then
      begin
         MessageInfo := 'Código do Documento não informado, impossível excluir.';
         Raise Exception.Create(MessageInfo);
      end;

      _DocState := dstDelete;
      _Documento.Coddocumento.AsFloat := FCodDocumento;

      if not ValidaLote(true) then
        Raise Exception.Create(MessageInfo);

      //A Chamada para a exclusão é de todo o documento
      If (_OperacaoPrepareImob = OpDocumentoImob) Then
      Begin
           //Verifica se existem lançamentos de baixa para o documento a ser excluído
          _DtmCapCarObj.SqlBuscaParamBaixa.Prepare;
          _DtmCapCarObj.SqlBuscaParamBaixa.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFloat;
          _DtmCapCarObj.SqlBuscaParamBaixa.Open;

          If Not _DtmCapCarObj.CdsBuscaParamBaixa.IsEmpty Then
          begin
             MessageInfo := 'Existem lançamentos de baixa no dia ' +
                                    _DtmCapCarObj.CdsBuscaParamBaixa.FieldByName('DATALANCTO').AsString + ' na conta ' +
                                    _DtmCapCarObj.CdsBuscaParamBaixa.FieldByName('DESCRICAO').AsString;
             Raise Exception.Create(MessageInfo);
          end;

          If _DtmCapCarObj.CdsBuscaParamBaixa.Active Then _DtmCapCarObj.CdsBuscaParamBaixa.Close;
          // Busca parâmetros de lançamento do Documento a ser excluído.
          _DtmCapCarObj.SqlParamDocs.Prepare;
          _DtmCapCarObj.SqlParamDocs.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFloat;
          _DtmCapCarObj.SqlParamDocs.Open;

          If Not _DtmCapCarObj.CdsParamDocs.IsEmpty Then
          Begin
              // Verifica se o documento foi englobado ou parcelado
              // Verifica se o documento foi englobado ou parcelado
              If (Not _DtmCapCarObj.CdsParamDocs.FieldByName('NUMFATURA').IsNull) And
                 (Not ( _OperacaoDocLancImob in [ odlPrevParcelaImob, odlParcelaImob ] ) ) Then
              begin
                 MessageInfo := 'Este documento foi englobado\parcelado.';
                 Raise Exception.Create(MessageInfo);
              end;
              // Verifica se o documento a ser excluído foi estornado.
              If Not _DtmCapCarObj.CdsParamDocs.FieldByName('ESTORNO').IsNull Then
              begin
                 MessageInfo := 'Este Lançamento foi estornado ou é um estorno.';
                 Raise Exception.Create(MessageInfo);
              end;
              // Verifica se o documento foi lançado com integração na contabilidade e se o
              // período contábil do lançamento do documento está aberto, caso contrário obriga o
              // estorno do mesmo.
              if (_DtmCapCarObj.CdsParamDocs.FieldByName('PLNCODIGO').AsFloat > 0) Then
              begin
                 _Periodo.RetornaPeriodoExercicioData(_DtmCapCarObj.CdsParamDocs.FieldByName('IDPESSOA').AsFloat, _DtmCapCarObj.CdsParamDocs.FieldByName('DATALANCTO').AsString);
                 If _Periodo.TestaPeriodoBloqueado(_DtmCapCarObj.CdsParamDocs.FieldByName('IDPESSOA').AsFloat, tbBloqOuInt, _Periodo.Periodo, _Periodo.Exercicio, False) Then
                 begin
                    MessageInfo := 'Este Documento não pode ser excluido, somente pode ser estornado' + (#13+#10) + _Periodo.MessageInfo;
                    Raise Exception.Create(MessageInfo);
                 end;
              end;

              if not VerificaDocumento then
              begin
                Raise Exception.Create(MessageInfo);
              end;
              // Verfica se o documento lançado é um efetivo e "Exclui" as possíveis rentenções de imposto
              // para o documento a ser excluído.
              if (Trim(_DtmCapCarObj.CdsParamDocs.FieldByName('OPERACAO').AsString) = '2') Or
                 (Trim(_DtmCapCarObj.CdsParamDocs.FieldByName('OPERACAO').AsString) = '1') Or
                 (Trim(_DtmCapCarObj.CdsParamDocs.FieldByName('OPERACAO').AsString) = '3')  Or
                 (Trim(_DtmCapCarObj.CdsParamDocs.FieldByName('OPERACAO').AsString) = '13') Then
              begin
                  oImpostoRetido.CodDocumento := _Documento.Coddocumento.AsInteger;
                  oImpostoRetido.NumLancto := 0;
                  oImpostoRetido.ExcluiAlteradores := True;
                  oImpostoRetido.IdEmpresa := _DtmCapCarObj.CdsParamDocs.FieldByName('IDPESSOA').AsInteger;
                  oImpostoRetido.Excluir;
              end;

              _DtmCapCarObj.SqlDadosDelImpLanc.Prepare;
              _DtmCapCarObj.SqlDadosDelImpLanc.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFloat;
              _DtmCapCarObj.SqlDadosDelImpLanc.Open;
              //Exclusão da retenção de impostos associada ao lancamento a ser excluído
              _DtmCapCarObj.CdsDadosDelImpLanc.First;
              While Not _DtmCapCarObj.CdsDadosDelImpLanc.Eof Do
              Begin
                 oImpostoRetido.CodDocumento        := _DtmCapCarObj.CdsDadosDelImpLanc.FieldByName('CODDOCUMENTO').AsInteger;
                 oImpostoRetido.NumLancto           := _DtmCapCarObj.CdsDadosDelImpLanc.FieldByName('NUMLANCTO').AsInteger;
                 oImpostoRetido.ExcluiAlteradores   := True;
                 oImpostoRetido.IdEmpresa           := _DtmCapCarObj.CdsParamDocs.FieldByName('IDPESSOA').AsInteger;
                 oImpostoRetido.Excluir;

                 _DtmCapCarObj.CdsDadosDelImpLanc.Next;
              End;

              _DtmCapCarObj.CdsDadosDelImpLanc.Close;
              _DtmCapCarObj.SqlDadosDelImpLanc.Prepare;
              _DtmCapCarObj.SqlDadosDelImpLanc.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFloat;
              _DtmCapCarObj.SqlDadosDelImpLanc.Open;


              //Seleciona os IDRESERVAORCAMEN, NUMRESERVA, VLRRESORCAMEN do rateio do
              //Documento a ser excluído para Estorno do comprisso assumido no lançamento do Documento
              _DtmCapCarObj.SQLDadosDelOrc.Prepare;
              _DtmCapCarObj.SQLDadosDelOrc.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFLoat;
              _DtmCapCarObj.SQLDadosDelOrc.Open;

              if result then
                Result := ExcluirRad(_Documento.Coddocumento.AsInteger);

              If Not Result Then Raise Exception.Create(MessageInfo);

              Result :=
                        ExecSql('DELETE FROM EVENTOXDOCUM WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND

                        // Delete caso o imposto tenha sido acumulado
                        ExecSql('DELETE FROM DOCXIMPOSTOACUM WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND

                        // Deleta pelo CODDOCLANCADO caso o documento tenha gerado CPMF
                        ExecSql('DELETE FROM IMPOSTORETIDO  WHERE CODDOCLANCADO = '+ _Documento.Coddocumento.AsString) AND

                        // Deleta pelo CODDOCUMENTO caso o o documento tenha gerado impostos, como IRRF
                        ExecSql('DELETE FROM IMPOSTORETIDO  WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND

                        ExecSql('DELETE FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        ExecSql('DELETE FROM RECBTOPAGTO    WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        ExecSql('DELETE FROM RATEIODOCUM    WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        ExecSql('DELETE FROM LANCTODOCUM    WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        ExecSql('DELETE FROM MENSAGENSCNAB  WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        //BRUNO AZEVEDO SOL 150169 KINTANA 1092020
                        ExecSql('DELETE FROM EVENTOIMOVEL   WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        ExecSql('DELETE FROM LANCOPERDIAIMOB WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString) AND
                        //BRUNO AZEVEDO SOL 150169 KINTANA 1092020
                        ExecSql('DELETE FROM DOCUMENTO      WHERE CODDOCUMENTO = '+ _Documento.Coddocumento.AsString);
              If Not Result Then Raise Exception.Create(MessageInfo);

              //Estorno do comprisso assumido no lançamento do Documento
              _DtmCapCarObj.CdsDadosDelOrc.First;
              While Not _DtmCapCarObj.CdsDadosDelOrc.Eof Do
              Begin
                 _Orcamento.IdEmpresa := _DtmCapCarObj.CdsParamDocs.FieldByName('IDPESSOA').AsInteger;
                 _Orcamento.IdUsuario := Trunc(FIdUsuario);

                 if  ( _Orcamento.EstornaCompromisso( _DtmCapCarObj.CdsDadosDelOrc.FieldByName('NUMRESERVA').AsInteger,
                                                      _DtmCapCarObj.CdsDadosDelOrc.FieldByName('VLRRESORCAMEN').AsFloat,True) <> 0 ) Then
                 begin
                     MessageInfo := 'Não Foi Possível Estornar Compromisso orçamentário da reserva ' + _DtmCapCarObj.CdsDadosDelOrc.FieldByName('NUMRESERVA').AsString + '.' + (#13+#10) + _Orcamento.MessageInfo + '.';
                     raise Exception.Create(MessageInfo);
                 end;
                 _DtmCapCarObj.CdsDadosDelOrc.Next;
              End;

              //Exclusão dos lançamentos contábeis referentes a contabilização do lançamento do
              //Documento ou alteradores lançados para este documento
              if bExcluiContabLancDoc then
              begin
                 _DtmCapCarObj.CdsDadosDelImpLanc.First;
                 While Not _DtmCapCarObj.CdsDadosDelImpLanc.Eof Do
                 Begin
                     //Verifica se o lançamento se refere a um estono
                     If Not _DtmCapCarObj.CdsDadosDelImpLanc.FieldByName('ESTORNO').IsNull Then
                     begin
                        MessageInfo := 'O Lançamento ' + _DtmCapCarObj.CdsDadosDelImpLanc.FieldByName('NUMLANCTO').AsString + 'foi estornado ou é um estorno. Proíbido excluí-lo.';
                        Raise Exception.Create(MessageInfo);
                     end;

                     //Verifica se o lançamento foi integrado com a contabilidade e exclui a contabilização
                     If (_DtmCapCarObj.CdsDadosDelImpLanc.FieldByName('PLNCODIGO').AsFloat > 0) Then
                     Begin
                        if Not _LancaContab.ExcluiLancaContab( FIdUsuario, _DtmCapCarObj.CdsDadosDelImpLanc.FieldByName('PLNCODIGO').AsFloat,
                                                               FIdModulo , 0,  FUsaPlanoPatro , True) Then
                        begin
                           MessageInfo := 'Não foi possível excluir a contabilização do lançamento.' + (#13+#10) + _LancaContab.MessageInfo;
                           Raise Exception.Create(MessageInfo);
                        end;
                     End;

                     _DtmCapCarObj.CdsDadosDelImpLanc.Next;
                 End;
              End;

              If _DtmCapCarObj.CdsParamDocs.Active Then _DtmCapCarObj.CdsParamDocs.Close;
              If _DtmCapCarObj.CdsBuscaParamBaixa.Active Then _DtmCapCarObj.CdsBuscaParamBaixa.Close;
              If _DtmCapCarObj.CdsDadosDelImpLanc.Active Then _DtmCapCarObj.CdsDadosDelImpLanc.Close;
              If _DtmCapCarObj.CdsDadosDelOrc.Active Then _DtmCapCarObj.CdsDadosDelOrc.Close;
              If _DtmCapCarObj.CdsDadosDelLote.Active Then _DtmCapCarObj.CdsDadosDelLote.Close;

          End
          Else
          begin
             MessageInfo := 'Não foi possível selecionar parâmetros para exclusão do documento';
             Raise Exception.Create(MessageInfo);
          end;

          If _DtmCapCarObj.CdsParamDocs.Active Then _DtmCapCarObj.CdsParamDocs.Close;
          If _DtmCapCarObj.CdsBuscaParamBaixa.Active Then _DtmCapCarObj.CdsBuscaParamBaixa.Close;
          If _DtmCapCarObj.CdsDadosDelImpLanc.Active Then _DtmCapCarObj.CdsDadosDelImpLanc.Close;
          If _DtmCapCarObj.CdsDadosDelOrc.Active Then _DtmCapCarObj.CdsDadosDelOrc.Close;
          If _DtmCapCarObj.CdsDadosDelLote.Active Then _DtmCapCarObj.CdsDadosDelLote.Close;

          If Result Then
          Begin
             Result := _Documento.Delete;

             If Not Result Then MessageInfo := _Documento.MessageInfo;
          End;
      end
      Else
      Begin
        If (_LstLanctoDocum.Count = 0 ) Then
        Begin
           iNovoItem := _LstLanctoDocum.Add(TDbLanctodocum.Create(Self));
           TDbLanctodocum(_LstLanctoDocum[iNovoItem]).DataBaseName := DataBaseName;

           If FLanctodocum.CodDocumento = 0 Then
              FLanctodocum.CodDocumento := fCodDocumento;

           If FLanctodocum.CodDocumento = 0 Then
           begin
              MessageInfo := 'Não é possível processar a exclusão: Código do Documento não informado';
              Raise Exception.Create(MessageInfo);
           end;

           If FLanctodocum.NumLancto = 0 Then
           begin
              MessageInfo := 'Não é possível processar a exclusão: Número do Lançamento não informado';
              Raise Exception.Create(MessageInfo);
           end;

           TDbLanctodocum(_LstLanctoDocum[iNovoItem]).Coddocumento.AsFloat := FLanctodocum.CodDocumento;
           TDbLanctodocum(_LstLanctoDocum[iNovoItem]).Numlancto.AsFloat := FLanctodocum.NumLancto;
        End;

        Result := ProcessaLanctoDocum;

      End;

      If _DtmCapCarObj.CdsParamDocs.Active Then _DtmCapCarObj.CdsParamDocs.Close;
      If _DtmCapCarObj.CdsBuscaParamBaixa.Active Then _DtmCapCarObj.CdsBuscaParamBaixa.Close;
      If _DtmCapCarObj.CdsDadosDelImpLanc.Active Then _DtmCapCarObj.CdsDadosDelImpLanc.Close;
      If _DtmCapCarObj.CdsDadosDelOrc.Active Then _DtmCapCarObj.CdsDadosDelOrc.Close;
      If _DtmCapCarObj.CdsDadosDelLote.Active Then _DtmCapCarObj.CdsDadosDelLote.Close;
      FreeAndNil(oImpostoRetido);

      For X := 0 To (_LstLanctoDocum.Count - 1) Do
      begin
//        TDbLanctodocum(self._LstLanctoDocum[X]).Free;
        oObj := self._LstLanctoDocum[X];
        FreeAndNil(oObj);
      end;
      For X := 0 To (_LstCcBaixasxDocum.Count - 1) Do
      begin
//        TDbCcBaixasxDocum(self._LstCcBaixasxDocum[X]).Free;
        oObj := self._LstCcBaixasxDocum[X];
        FreeAndNil(oObj);
      end;

      For X := 0 To (_LstRateioDocum.Count - 1) Do
      begin
//        TDbRateiodocum(self._LstRateioDocum[X]).Free;
        oObj := self._LstRateioDocum[X];
        FreeAndNil(oObj);
      end;

      self._LstLanctoDocum.Clear;
      self._LstCcBaixasxDocum.Clear;
      self._LstRateioDocum.Clear;

   Except
      On E:Exception Do
      Begin
         For X := 0 To (_LstLanctoDocum.Count - 1) Do
         begin
//           TDbLanctodocum(self._LstLanctoDocum[X]).Free;
           oObj := self._LstLanctoDocum[X];
           FreeAndNil(oObj);
         end;

         For X := 0 To (_LstCcBaixasxDocum.Count - 1) Do
         begin
//           TDbCcBaixasxDocum(self._LstCcBaixasxDocum[X]).Free;
           oObj := self._LstCcBaixasxDocum[X];
           FreeAndNil(oObj);
         end;

         For X := 0 To (_LstRateioDocum.Count - 1) Do
         begin
//           TDbRateiodocum(self._LstRateioDocum[X]).Free;
           oObj := self._LstRateioDocum[X];
           FreeAndNil(oObj);
         end;

         self._LstLanctoDocum.Clear;
         self._LstCcBaixasxDocum.Clear;
         self._LstRateioDocum.Clear;

         If _DtmCapCarObj.CdsParamDocs.Active Then _DtmCapCarObj.CdsParamDocs.Close;
         If _DtmCapCarObj.CdsBuscaParamBaixa.Active Then _DtmCapCarObj.CdsBuscaParamBaixa.Close;
         If _DtmCapCarObj.CdsDadosDelImpLanc.Active Then _DtmCapCarObj.CdsDadosDelImpLanc.Close;
         If _DtmCapCarObj.CdsDadosDelOrc.Active Then _DtmCapCarObj.CdsDadosDelOrc.Close;
         If _DtmCapCarObj.CdsDadosDelLote.Active Then _DtmCapCarObj.CdsDadosDelLote.Close;

         Result := False;
         FreeAndNil(oImpostoRetido);

         MessageInfo := E.Message;
      End;
   End;
end;

function TCtrlImobDocumento.ProcessaLanctoDocum: Boolean;
Var
  X, y : Integer;
  liPlnCodigo,
  liPlnAntecipa: Double; //André Tavares - 20317 - guarda o número da planilha da reversão de antecipação
  sSistemaOrigem: TSistemaLancto;
  ctrlImpostoRetido : TCtrlImpostoRetido;
  sSQL: string;

  function LancaJurosCorrecao: Boolean;
  Var
     oJurosCorrecao: TCtrlJurosCorrecao;

  Begin
     {** Processa cálculo automático de Juros/Correção **}
     Result := True;

     If (Integer(_OperacaoDocLancImob) = 5) Then
     Begin
        oJurosCorrecao := TCtrlJurosCorrecao.Create;
        Try
           oJurosCorrecao.InitializeAs(Self);
           oJurosCorrecao.OpenTransaction := false;
           oJurosCorrecao.CodDocumento := TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsInteger;
           oJurosCorrecao.DataCorrecao := TDbLanctodocum(_LstLanctoDocum[X]).Datalancto.AsDateTime;
           oJurosCorrecao.IdEmpresa := TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger;
           oJurosCorrecao.IdUsuario := TDbLanctodocum(_LstLanctoDocum[X]).Idusuarioinclusao.AsInteger;
           oJurosCorrecao.IntegraContab := TDbLanctodocum(_LstLanctoDocum[X]).Contabiliza;
           oJurosCorrecao.idModulo := TDbLanctodocum(_LstLanctoDocum[X]).IdModulo;
           oJurosCorrecao.IdPlanoConta := TDbLanctodocum(_LstLanctoDocum[X]).PlanoConta;
           oJurosCorrecao.UsaPlanoPatro := TDbLanctodocum(_LstLanctoDocum[X]).UsaPlanoPatro;

           Result := oJurosCorrecao.CorrigeDocumento;

           If Not Result Then
              MessageInfo := oJurosCorrecao.MessageInfo;
        finally
           FreeAndNil(oJurosCorrecao);
        End;
     End;
  End;

  function ContabilizaLancto(bEstornaExclui: Boolean = False): Boolean;
  var
    rVlrDifLanc: Double;//Darivaldo Alencar SOL201128_18374
  Begin

     Result := True;

     If ( _OperacaoPrepareImob <> OpDocumentoImob ) Then
     Begin
        If (TDbLanctodocum(_LstLanctoDocum[X]).Contabiliza) Or
           ((Not TDbLanctodocum(_LstLanctoDocum[X]).Contabiliza) And
            (TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger > 0)) Then
        Begin

           If (TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger > 0) And bEstornaExclui Then
           Begin
              if not ExecSQL('UPDATE LANCTODOCUM SET PLNCODIGO = NULL, PLNANTECIPA = NULL WHERE PLNCODIGO = ' + IntToStr(TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger)) then
                 Raise Exception.Create(MessageInfo);

              if TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger = 0 then
                 TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger := FLanctoDocum.FIdPessoa;

              Case EstornaExcluiContab(TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger,
                                            TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger,
                                            TDbLanctodocum(_LstLanctoDocum[X]).Idusuarioinclusao.AsInteger,
                                            TDbLanctodocum(_LstLanctoDocum[X]).IdModulo,
                                            TDbLanctodocum(_LstLanctoDocum[X]).Datalancto.AsDateTime,
                                            TDbLanctodocum(_LstLanctoDocum[X]).UsaPlanoPatro) of
              tecErro:
                Begin
                   Result := False;
                   Exit;
                End;
              tecExcluido: liPlnCodigo := 0;
              tecEstornado: liPlnCodigo := TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger;
              End;
           End;
        End;

        If bEstornaExclui And
          (((Not TDbLanctodocum(_LstLanctoDocum[X]).Contabiliza) And
            (TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger > 0)) Or
            (_OperacaoDocLancImob = odlAlteradorImob)) Then
          TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger := 0;


        If TDbLanctodocum(_LstLanctoDocum[X]).Contabiliza Then
        Begin
           if (TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger > 0) and
              (liPlnCodigo = 0) then
              liPlnCodigo := TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger;

           if ( _liPlnCodigoAdianto <> 0 ) And
              ( _OperacaoDocLancImob in [odlRegAdiantamentoImob, odlRegDocumentoImob] ) Then liPlnCodigo := _liPlnCodigoAdianto;

              //Darivaldo Alencar SOL201128_18374 -inicio
              if (TDbLanctodocum(_LstLanctoDocum[X]).VlrDifContab <> 0) then
                 rVlrDifLanc:= TDbLanctodocum(_LstLanctoDocum[X]).VlrDifContab
              else
                 rVlrDifLanc:= TDbLanctodocum(_LstLanctoDocum[X]).Valor.AsFloat;
              //Darivaldo Alencar SOL201128_18374 -fim

              Result := LancaRateioContab(TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsInteger,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Codalterador.AsInteger,
                                          TDbLanctodocum(_LstLanctoDocum[X]).CodPortForna,
                                          TDbLanctodocum(_LstLanctoDocum[X]).PlanoConta,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Unidnegoc.AsInteger,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger,
                                          TDbLanctodocum(_LstLanctoDocum[X]).IdModulo,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Idusuarioinclusao.AsInteger,
                                          TDbLanctodocum(_LstLanctoDocum[X]).PlanoConta,
                                          liPlnCodigo,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Datalancto.AsDateTime,
                                          //Darivaldo Alencar SOL201128_18374 -inicio
                                          //TDbLanctodocum(_LstLanctoDocum[X]).Valor.AsFloat,
                                          rVlrDifLanc,
                                          //Darivaldo Alencar SOL201128_18374 -fim
                                          TDbLanctodocum(_LstLanctoDocum[X]).Valoroutramoeda.AsFloat,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Operacao.AsInteger,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Debcre.AsString,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Historicocompl.AsString,
                                          TDbLanctodocum(_LstLanctoDocum[X]).Numrecibo.AsString,
                                          TDbLanctodocum(_LstLanctoDocum[X]).ContaBaixa,
                                          TDbLanctodocum(_LstLanctoDocum[X]).SubContaBaixa,
                                          TDbLanctodocum(_LstLanctoDocum[X]).UsaPlanoPatro,
                                          liPlnAntecipa,                                     //Luiz Carlos - SOL 201128.18374
                                          TDbLanctodocum(_LstLanctoDocum[X]).Valor.AsFloat   //Luiz Carlos - SOL 201128.18374
                                          );

           TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsFloat := liPlnCodigo;
           TDbLanctodocum(_LstLanctoDocum[X]).PlnAntecipa.asFloat := liPlnAntecipa;


        End;
     End;
  End;

begin
  try
     Result := True;
     liPlnAntecipa := 0;
     If TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.IsNull Then
        TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsFloat := _Documento.Coddocumento.AsFloat
     Else
        If _Documento.Coddocumento.IsNull Then
           _Documento.Coddocumento.AsFloat := TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsFloat;

     _Cds.Close;

     _Cds.Data := GetDataPacket('SELECT RECPAG, PLACONTA, IDMODULO, IDPESSOA, PLACONTAANT FROM DOCUMENTO WHERE CODDOCUMENTO = ' + _Documento.Coddocumento.AsString);

     if _Documento.Recpag.AsString = '' then
     begin
        _Documento.Recpag.AsString := _Cds.Fields[0].AsString;
     end;

     if _Documento.Idmodulo.IsNull then
       _Documento.Idmodulo.AsInteger := _Cds.Fields[2].AsInteger;

     if  (not (_OperacaoDocLancImob in [odlAParcelarImob, odlParcelaImob, odlEfetivoImob, odlBaixaImob, odlPrevisaoImob, odlAlteradorImob, odlRegDocumentoImob])) and (_Cds.Fields[1].IsNull) then begin
         Result := false;
         MessageInfo := 'A operação: ' + inttostr(integer(_OperacaoDocLancImob)) + ' não é permitida em documentos com múltiplas contas de baixa!';
         raise exception.create(MessageInfo);

     end;

     if _Documento.Idpessoa.IsNull then
       _Documento.Idpessoa.AsInteger := _Cds.Fields[3].AsInteger;

     _Cds.Close;

     (* Implementação para ajuste da DataFloat de forma que seja gravado o mesmo valor no financeiro e na contabilidade *)
     If _Documento.Recpag.AsString = 'P' Then
        sSistemaOrigem := slCap
     Else
        sSistemaOrigem := slCar;

     For X:=0 To (_LstLanctoDocum.Count - 1) Do
     Begin
       TDbLanctodocum(Self._LstLanctoDocum[X]).Datalancto.AsDateTime :=
              AjustaDataFloat( TDbLanctodocum(Self._LstLanctoDocum[X]).Datalancto.AsDateTime,
                               TDbLanctodocum(Self._LstLanctoDocum[X]).DiasFloat,
                               sSistemaOrigem );

       Case _DocState Of
         dstInsert:
         Begin
            TDbLanctodocum(_LstLanctoDocum[X]).Operacao.AsString := IntToStr(Integer(_OperacaoDocLancImob));

            if _OperacaoDocLancImob in [odlEfetivoImob] then
            begin
              _Cds.Data := GetDataPacket('SELECT ROWID FROM RATEIODOCUM WHERE CODDOCUMENTO = ' + _Documento.Coddocumento.AsString);
              if _Cds.Eof then
                result := VerificaPlanosRateio;

              _Cds.Close;

            end;

            {** Calcula Juros/Correção automática de documento **}
            Result := LancaJurosCorrecao;
            If Not Result Then Exit;

            {** Processa Contabilização do Documento **}

            Result := ContabilizaLancto;

            If Not Result Then Exit;

            If (TDbLanctodocum(_LstLanctoDocum[X]).Operacao.AsInteger = 15) Then Exit;

            Result := TDbLanctodocum(_LstLanctoDocum[X]).Insert;

            If not Result Then Raise Exception.Create( TDbLanctodocum(_LstLanctoDocum[X]).MessageInfo );

            {** Verifica se o documento tem saldo "zero" e muda o status do mesmo para "2" baixando o documento **}
            Result := UpdateStatusBaixa(TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsInteger);

            If Result Then
            Begin
               Lanctodocum.NumLancto := TDbLanctodocum(_LstLanctoDocum[X]).Numlancto.AsInteger;

               {** Liberação do Documento para emissão no momento da baixa **}
               If (TDbLanctodocum(_LstLanctoDocum[X]).Operacao.AsInteger = 5) And
                  (_Documento.Recpag.AsString = 'P') Then
                  Result := ExecSQL(' UPDATE DOCUMENTO SET ' +
                                    ' EMISBLOQ = NULL WHERE CODDOCUMENTO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsString );

               {** Lança Retenção de Imposto para Alterador**}

               If Result And
                 (TDbLanctodocum(_LstLanctoDocum[X]).Operacao.AsInteger = 4) Then
               Begin
                  _Cds.Close;
                  _Cds.Data := GetDataPacket('SELECT ' +
                                             '  D.RECPAG, D.IDMODULO, D.DATAPROGRAMADA, D.IDFORCLI, ' +
                                             '  D.DATAEMISSAO, D.CODTIPDOC, D.OPERACAO, D.CODDOCUMENTO ' +
                                             ' FROM ' +
                                             '  DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR T ' +
                                             ' WHERE ' +
                                             '  (L.CODDOCUMENTO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsString + ') AND ' +
                                             '  (L.NUMLANCTO = ' + TDbLanctodocum(_LstLanctoDocum[X]).NumLancto.AsString + ') AND ' +
                                             '  (T.FLGCALCULAIMPOSTO = ''S'') AND ' +
                                             '  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
                                             '  (L.CODALTERADOR = T.CODALTERADOR)');


                  if not _Cds.IsEmpty then
                  Begin
                     ctrlImpostoRetido := TCtrlImpostoRetido.Create;// 26/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
                     Try
                       ctrlImpostoRetido.InitializeAs(Self);
                       ctrlImpostoRetido.OpenTransaction   := false;
                       ctrlImpostoRetido.RecPag            := Self._Cds.FieldByName('RECPAG').AsString[1];
                       ctrlImpostoRetido.IdUsuario         := Trunc(Self.IdUsuario);
                       ctrlImpostoRetido.IdEspAcesso       := Trunc(Self.IdEspAcesso);
                       ctrlImpostoRetido.IdModulo          := Self._Cds.FieldByName('IDMODULO').AsInteger;
                       ctrlImpostoRetido.MomentoLancamento := mlLancamento;
                       ctrlImpostoRetido.DataProgramada    := Self._Cds.FieldByName('DATAPROGRAMADA').AsDateTime;
                       ctrlImpostoRetido.OperacaoDocumento := Self._Cds.FieldByName('OPERACAO').AsString;
                       ctrlImpostoRetido.IdForCli          := Self._Cds.FieldByName('IDFORCLI').AsInteger;
                       ctrlImpostoRetido.CodDocumento      := TDbLanctodocum(Self._LstLanctoDocum[X]).Coddocumento.AsInteger;
                       ctrlImpostoRetido.NumLancto         := TDbLanctodocum(Self._LstLanctoDocum[X]).NumLancto.AsInteger;
                       ctrlImpostoRetido.ValorLancto       := TDbLanctodocum(Self._LstLanctoDocum[X]).Valor.AsFloat;
                       ctrlImpostoRetido.ValorLiquido      := TDbLanctodocum(Self._LstLanctoDocum[X]).Vlrliquido.AsFloat;
                       ctrlImpostoRetido.CodTipoDoc        := Self._Cds.FieldByName('CODTIPDOC').AsInteger;
                       ctrlImpostoRetido.DataLancto        := TDbLanctodocum(Self._LstLanctoDocum[X]).Datalancto.AsDateTime;
                       ctrlImpostoRetido.DataEmissao       := Self._Cds.FieldByName('DATAEMISSAO').AsDateTime;
                       ctrlImpostoRetido.DebCre            := TDbLanctodocum(Self._LstLanctoDocum[X]).DebCre.AsString ;
                       ctrlImpostoRetido.Incluir;
                       FreeAndNil(ctrlImpostoRetido);
                       Self._Cds.Close;
                     Except
                        FreeAndNil(ctrlImpostoRetido);
                       _Cds.Close;
                       Raise;
                     End;
                  End;
               End;
            End;
         End;
         dstUpdate:
         Begin
            If TDbLanctodocum(_LstLanctoDocum[X]).Estorno.AsInteger > 0 Then
            begin
               MessageInfo := 'Este lançamento foi estornado, proibido alterar\excluir';
               Raise Exception.Create(MessageInfo);
            end;

            TDbLanctodocum(_LstLanctoDocum[X]).Operacao.AsString := IntToStr(Integer(_OperacaoDocLancImob));

            {** Processa Contabilização do Documento Estornando/Excluindo a Contabilização existente **}
            if fOPeracaoLancto = olsoContabiliza then
            begin
               Result := ContabilizaLancto( (_OperacaoDocLancImob <> odlBaixaAdiantamentoImob) ); (* Gustavo Viegas - 24/04/2003 *)
               If Not Result Then Exit;

               sSQL := 'UPDATE ' +
                       'LANCTODOCUM SET PLNCODIGO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsString;

                       if TDbLanctodocum(_LstLanctoDocum[X]).PlnAntecipa.AsInteger <> 0 then
                         sSQL := sSQL + ' ,PLNANTECIPA = ' + TDbLanctodocum(_LstLanctoDocum[X]).PlnAntecipa.AsString;

                       sSQL := sSQL + '    WHERE CODDOCUMENTO = ' +  TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsString + ' AND ' +
                                      '    NUMLANCTO = ' +  TDbLanctodocum(_LstLanctoDocum[X]).NumLancto.AsString;

               Result := ExecSQL(sSQL);
               if not Result then
                  raise Exception.Create(MessageInfo);

            end
            else
            begin
               Result := ContabilizaLancto( (_OperacaoDocLancImob <> odlBaixaAdiantamentoImob) ); (* Gustavo Viegas - 24/04/2003 *)
               If Not Result Then Exit;

               Result := TDbLanctodocum(_LstLanctoDocum[X]).Update;

               If Result Then
               Begin
                  {** Verifica se o documento tem saldo "zero" e muda o status do mesmo para "2" baixando o documento **}
                  Result := UpdateStatusBaixa(TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsInteger);

                  {** "Marca" o documento como não consilidado pois sofreu uma alteração **}
                  If Result Then
                     Result := ExecSQL('UPDATE DOCUMENTO SET FLGNAOCONCILIADO = ''1'' WHERE CODDOCUMENTO = ' +  TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsString);
               End;
            End;

            if (_OperacaoDocLancImob = odlAlteradorImob) then
            begin
                 Try
                   _cds.Close;
                   _cds.Data := GetDataPacket('SELECT IDIMPOSTORETIDO FROM IMPOSTORETIDO WHERE NUMLANCTO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Numlancto.AsString);
                   _cds.First;
                   While not _cds.Eof do
                   begin
                     if not ExecSQL('UPDATE IMPOSTORETIDO SET VLRRETIDO = ' + FloatToStrCM(TDbLanctodocum(_LstLanctoDocum[X]).Valor.AsFloat) + ' WHERE IDIMPOSTORETIDO = ' + _cds.FieldByName('IDIMPOSTORETIDO').AsString) then
                     begin
                        MessageInfo := 'Erro ao Atualizar valor de imposto associado ao lançamento. ' + (#13+#10) + MessageInfo;
                        Raise Exception.Create(MessageInfo);
                     end;
                     _cds.Next;
                   end;
                 finally
                   _cds.Close;
                 end; //try .. finally

            end;
         End;
         dstDelete:
         Begin
            TDbLanctodocum(_LstLanctoDocum[X]).LoadFromDB;

            If TDbLanctodocum(_LstLanctoDocum[X]).Estorno.AsInteger > 0 Then
            begin
               MessageInfo := 'Este lançamento foi estornado, proibido alterar\excluir';
               Raise Exception.Create(MessageInfo);
            end;

            Result := ExecSql('DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = '+ TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsString +
                              ' AND NUMLANCTO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Numlancto.AsString);

            If not Result then raise Exception.Create(MessageInfo);


            Result := ExecSql('DELETE FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsString +
                              ' AND NUMLANCTO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Numlancto.AsString);

            If Result Then
            begin
               Result := TDbLanctodocum(_LstLanctoDocum[X]).Delete;
               if not Result then Raise Exception.Create(MessageInfo);
            end
            Else
               raise Exception.Create(MessageInfo);

            If ( TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger > 0 ) and
                (not MantemLancContabil) Then            //edilaine - SOL201128_18374
            Begin
              Result := ExecSql('UPDATE LANCTODOCUM SET PLNCODIGO = NULL, PLNANTECIPA = NULL WHERE PLNCODIGO = ' + TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsString);

              if not Result then Raise Exception.Create(MessageInfo);

              if TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger = 0 then
                 TDbLanctodocum(_LstLanctoDocum[X]).Idpessoa.AsInteger := FLanctoDocum.FIdPessoa;

              if ( EstornaExcluiContab(TDbLanctodocum(_LstLanctoDocum[X]).PlnAntecipa.AsInteger,
                                       _Documento.Idpessoa.AsInteger,
                                       TDbLanctodocum(_LstLanctoDocum[X]).Idusuarioinclusao.AsInteger,
                                       FLanctodocum.IdModulo,
                                       TDbLanctodocum(_LstLanctoDocum[X]).Datalancto.AsDateTime,
                                       TDbLanctodocum(_LstLanctoDocum[X]).UsaPlanoPatro) = tecErro ) Then
              begin
                 Result := False;
                 Exit;
              end;

              If ( EstornaExcluiContab(TDbLanctodocum(_LstLanctoDocum[X]).Plncodigo.AsInteger,
                                       _Documento.Idpessoa.AsInteger,
                                       TDbLanctodocum(_LstLanctoDocum[X]).Idusuarioinclusao.AsInteger,
                                       FLanctodocum.IdModulo,
                                       TDbLanctodocum(_LstLanctoDocum[X]).Datalancto.AsDateTime,
                                       TDbLanctodocum(_LstLanctoDocum[X]).UsaPlanoPatro) = tecErro ) Then
              Begin
                 Result := False;
                 Exit;
              End;
            End;

            if result then
            begin
               Result := UpdateStatusBaixa(TDbLanctodocum(_LstLanctoDocum[X]).Coddocumento.AsInteger);
               if not Result then Raise Exception.Create(MessageInfo);
            end;

         End;
       End;

       If Not Result Then
       Begin
          MessageInfo := TDbLanctodocum(_LstLanctoDocum[X]).MessageInfo;
          Raise Exception.Create(MessageInfo);
       End;
     End;
     _Cds.Close;

   except
      on E:Exception do
      begin
        _Cds.Close;

        Result      := False;
        MessageInfo := E.message;
      end;
   end;
end;

function TCtrlImobDocumento.ProcessaRateioDocum: Boolean;
Var
  X: Integer;
begin
   Result := True;
    {**
      Na alteração do documento os items do Rateio do documento lançado são excluídos
      e é feita novamente a inserção dos items novos do rateio.
    **}

    If _DocState = dstUpdate Then
     Result := ExecSQL('DELETE FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + _Documento.Coddocumento.AsString);

    If Result Then
    begin

      For X := 0 To (_LstRateioDocum.Count - 1) Do
      Begin
        Case _DocState Of
          dstInsert, dstUpdate:
          Begin
            If TDbRateiodocum(_LstRateioDocum[X]).Coddocumento.IsNull Then
               TDbRateiodocum(_LstRateioDocum[X]).Coddocumento.AsFloat := _Documento.Coddocumento.AsFloat;

            Result := TDbRateiodocum(_LstRateioDocum[X]).Insert;
          End;
          dstDelete:
            Result := TDbRateiodocum(_LstRateioDocum[X]).Delete;
        End;//case

        If Not Result Then
        Begin
          MessageInfo := TDbRateiodocum(_LstRateioDocum[X]).MessageInfo;
          Raise Exception.Create(MessageInfo);
        End;//if

      End;//for
      result := VerificaPlanosRateio;

    end;//if
end;

function TCtrlImobDocumento.ProcessaCCBaixasxDocum: Boolean;
Var
  X: Integer;
begin
  Result := True;

  If _DocState = dstUpdate Then
    Result := ExecSQL('DELETE FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO =  ' + _Documento.Coddocumento.AsString);

  If Result Then
    For X:=0 To (_LstCcBaixasxDocum.Count - 1) Do
    Begin
      Case _DocState Of
        dstInsert, dstUpdate:
        Begin
          If TDbCcBaixasxDocum(_LstCcBaixasxDocum[X]).Coddocumento.IsNull Then
             TDbCcBaixasxDocum(_LstCcBaixasxDocum[X]).Coddocumento.AsFloat := _Documento.Coddocumento.AsFloat;

          Result := TDbCcBaixasxDocum(_LstCcBaixasxDocum[X]).Insert;
        End;
        dstDelete:
          Result := TDbCcBaixasxDocum(_LstCcBaixasxDocum[X]).Delete;
      End;

      If Not Result Then
      Begin
         MessageInfo := TDbCcBaixasxDocum(_LstCcBaixasxDocum[X]).MessageInfo;
         Raise Exception.Create(MessageInfo);
      End;
    End;
end;

procedure TCtrlImobDocumento.ApagaContaContabil;
begin
  if _LstCcBaixasxDocum.Count > 0 then begin
    _Documento.Placonta.Clear;
    _Documento.Idsegregacriter.Clear;
  end;
end;

function TCtrlImobDocumento.ValidaLote(const bExclui: boolean): Boolean;
begin
  result := true;

  if (_OperacaoDocLancImob in [odlBaixaImob, odlBaixaAdiantamentoImob, odlRegAdiantamentoImob, odlRegDocumentoImob]) then exit;  // baixa e exclusão de baixa podem ser feitas a vontade

  if (_OperacaoDocLancImob = odlAlteradorImob) and (FOPeracaoLancto = olsoContabiliza) then exit;

  _DtmCapCarObj.SQLDadosDelLote.Prepare;
  if _Documento.Coddocumento.AsFloat <> 0 then
    _DtmCapCarObj.SQLDadosDelLote.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFloat
  else
    _DtmCapCarObj.SQLDadosDelLote.ParamByName('CODDOCUMENTO').AsFloat := TDbLanctodocum(_LstLanctoDocum[0]).Coddocumento.AsFloat;

  _DtmCapCarObj.SQLDadosDelLote.Open;

  _DtmCapCarObj.CdsDadosDelLote.First;
  _DtmCapCarObj.CdsDadosDelLote.Filtered := false;
  While Not _DtmCapCarObj.CdsDadosDelLote.Eof Do
  Begin
     If (_DtmCapCarObj.CdsDadosDelLote.FieldByName('FLAGCANCEL').AsString <> 'C') then begin
        MessageInfo := 'Este documento consta no Lote ' + _DtmCapCarObj.CdsDadosDelLote.FieldByName('NUMLOTE').AsString;

        if not _DtmCapCarObj.CdsDadosDelLote.FieldByName('ESTORNO').isNull then
        begin
          _DtmCapCarObj.CdsDadosDelLote.Filter := ' ESTORNO IS NULL ';
          _DtmCapCarObj.CdsDadosDelLote.Filtered := true;
          if _DtmCapCarObj.CdsDadosDelLote.recordCount = 0 then
          begin
            result := true;
            exit;
          end;
        end;
        If (_DtmCapCarObj.CdsDadosDelLote.FieldByName('FLAGCANCEL').AsString = 'B') then
          MessageInfo := MessageInfo + ' que foi baixado.';

        Result := false;
        exit;
     end;

     if bExclui then begin
       ExecSql('DELETE FROM LOTEXDOCUM WHERE NUMLOTE = ' +  _DtmCapCarObj.CdsDadosDelLote.FieldByName('NUMLOTE').AsString);
       ExecSql('DELETE FROM LOTEPAGTO WHERE NUMLOTE = ' +  _DtmCapCarObj.CdsDadosDelLote.FieldByName('NUMLOTE').AsString);
     end;
     _DtmCapCarObj.CdsDadosDelLote.Next;
  end;
end;

function TCtrlImobDocumento.ValidaOperacao(const bExclusao: Boolean): Boolean;
Var
  rValorLancto, rValorOMLancto, rValRateio, rValRateioOM, rDiferenca: Double;
  X: Integer;
  fCodAux : Double;
  cdsAux : TclientDataset;
  CtrlFinanc: TCtrlFinanc;

  function ValidaNumApGr : Boolean;
  Begin
     Result := IsFloatZero(_Documento.Numapgr.AsFloat);

     If Not Result Then
     Begin
        _DtmCapCarObj.SQLNumApGr.Prepare;
        _DtmCapCarObj.SQLNumApGr.ParamByName('NUMAPGR').AsFloat := _Documento.Numapgr.AsFloat;
        _DtmCapCarObj.SQLNumApGr.ParamByName('CODDOCUMENTO').AsFloat := _Documento.Coddocumento.AsFloat;
        _Cds.Data := _DtmCapCarObj.SQLNumApGr.Data;

        Result := _Cds.IsEmpty;

        _Cds.Close;

        If Not Result Then
          MessageInfo := MSGNUMAPJACADSTRADO;
     End;
  End;

Begin
  result :=true;
  try
    try
      CtrlFinanc := TCtrlFinanc.Create(sistema.IdEmpresa, IdModulo, IdUsuario, UsaPlanoPatro);
      CtrlFinanc.InitializeAs(Self);
      CtrlFinanc.OpenTransaction := False;


      if CtrlFinanc.GetIntegraDispFin then
      begin
        cdsAux := tclientDataset.Create(nil);
        try
          fCodAux := fCodDocumento;
          if fCodAux <= 0 then
            fCodAux := TDbLanctodocum(_LstLanctoDocum[0]).Coddocumento.AsFloat;
          CdsAux.Data := GetDataPacket('SELECT DATAPROGRAMADA, RECPAG FROM DOCUMENTO WHERE CODDOCUMENTO = ' + FormatFloat('0', fCodAux ) ) ;

          if trim( _Documento.Recpag.AsString ) = '' then
            _Documento.Recpag.AsString := cdsAux.FieldByName('RECPAG').AsString;

          if trunc( fDataDisponibilidade ) = 0 then
            fDataDisponibilidade := cdsAux.FieldByName('DATAPROGRAMADA').asDateTime;

          if _Documento.Recpag.AsString = 'R' then
          begin
             fCodAux := fCodDocumento;
             if fCodAux <= 0 then
               fCodAux := TDbLanctodocum(_LstLanctoDocum[0]).Coddocumento.AsFloat;

             cdsAux.Close; // 14/06/2008 - // 14/06/2008 - 28197 André tavares - para consertar o erro "insufficient memory for this operation"
             if (Integer( _OperacaoDocLancImob ) in [5, 10, 15]) then
             begin
                CdsAux.Data := GetDataPacket('SELECT CODDOCUMENTO ' +
                                             'FROM LANCTODOCUM ' +
                                             'WHERE CODDOCUMENTO = ' + FloatToStr(fCodAux) +
                                             '  AND OPERACAO IN (5,10,15) ' +
                                             '  AND ESTORNO IS NULL');
                Result := not CdsAux.IsEmpty;
                cdsAux.Close; // 14/06/2008 - ### André tavares - para consertar o erro "insufficient memory for this operation"
             end
             else
                Result := false;
          end
          else
            Result := True;

          if trunc( fDataDisponibilidade ) = 0 then
            fDataDisponibilidade := _Documento.Dataprogramada.AsDateTime;

          if Result then
          begin
            if Trunc(fDataDisponibilidade) <> 0 then
            begin
              Result := CtrlFinanc.TestaDispFinanc(Sistema.IdEmpresa, Trunc(IdUsuario), fDataDisponibilidade);
              if not Result then
              begin
                MessageInfo := 'O Documento não pode ser Alterado, Excluído ou Inserido Motivo: '+ CtrlFinanc.MessageInfo;
                 Raise Exception.Create(MessageInfo);
              end;
            end;
          end;

        finally
          cdsAux.Close;
          FreeAndNil(cdsAux);
        end;
      end;

    finally
      FreeAndNil(CtrlFinanc);
    end;

    {**
      Verifica se o usuário logado tem direito de lançar documento para a data de
      vencimento especificada.
      Tal autorização é efetuada no CAP ou CAR independente do módulo de origem e
      o número de dias para lançamento é definido na tela de parâmetros do CAP ou CAR.
    **}
      If (result) and (_OperacaoPrepareImob = OpDocumentoImob) Then
      Begin
         If (_DocState = dstInsert) Then
            Result := Not ExisteNumDoc(_Documento.Recpag.AsString,
                                       _Documento.Idforcli.AsFloat,
                                       _Documento.Idempresa.AsFloat,
                                       _Documento.Nodocumento.AsFloat,
                                       _Documento.Compldocumento.AsString)
         Else
           Result := True;

         If Result Then
           Result := ValidaNumApGr;
      End
      Else
         Result := True;

    if result and (not bExclusao) then //andre - tavares pendência 21669 - 11/04/2006
    Begin
      {**
        Verifica se existem lançamentos na classe de persistência a serem processados.
        Deve existir ao menos um lançamento na classe de persistência;
        O Primeiro elemento da lista equivale ao registro do lançamento do documento e
        contém o valor do mesmo.
        O Total do rateio deve ser o mesmo desse valor.
      **}
      Result := (_LstLanctoDocum.Count > 0);

      If Result Then
      Begin

        Result := ValidaLote;
        if not Result then
          Raise Exception.Create(MessageInfo);

        If (_OperacaoPrepareImob = OpDocumentoImob) Then
        Begin

          rValorLancto := RoundCMLocal(TDbLanctoDocum(_LstLanctoDocum[0]).Valor.AsFloat,2);

          rValorOMLancto := RoundCMLocal(TDbLanctoDocum(_LstLanctoDocum[0]).Valoroutramoeda.AsFloat,2);

          rValRateio := 0;
          rValRateioOM := 0;

          {**
            Verifica se existem rateios na classe de persistência a serem processados.
            Deve existir ao menos um rateio na classe de persistência;
          **}
          Result := (_OperacaoDocLancImob in [ odlPrevParcelaImob, odlParcelaImob, odlBaixaAdiantamentoImob ] ) Or (_LstRateioDocum.Count > 0);

          If Result Then
          Begin
            {**
              Verifica se o valor do lançamento em MoedaCorrente e OutraMoeda equivale
              aos somatório dos valores do rateio
            **}
            For X:=0 To _LstRateioDocum.Count - 1 Do
            Begin
              rValRateio := rValRateio + TDbRateiodocum(_LstRateioDocum[x]).Valor.AsFloat;
              rValRateioOM := rValRateioOM + TDbRateiodocum(_LstRateioDocum[x]).Valoroutramoeda.AsFloat;
            End;

            rValRateio := RoundCMLocal(rValRateio,2);
            rValRateioOM := RoundCMLocal(rValRateioOM,2);
            rValorLancto := rValorLancto;

            rDiferenca := (Abs(rValorLancto) - Abs(rValRateio));
            if (_LstRateioDocum.Count > 0) then
            begin
               if ( not isFloatZero((RoundCMLocal(rDiferenca, 2))) ) then
               begin
                  TDbRateiodocum(_LstRateioDocum[0]).Valor.AsFloat := TDbRateiodocum(_LstRateioDocum[0]).Valor.AsFloat + rDiferenca;
                  rValRateio := rValRateio + rDiferenca;
               end;
            end;

            Result:= (_OperacaoDocLancImob in [ odlPrevParcelaImob, odlParcelaImob, odlBaixaAdiantamentoImob ]) Or FloatsEqual(Abs(rValorLancto),Abs(rValRateio));

            If Result Then
            Begin
              Result:= (_OperacaoDocLancImob in [ odlPrevParcelaImob, odlParcelaImob, odlBaixaAdiantamentoImob ]) Or FloatsEqual(Abs(rValorOMLancto),Abs(rValRateioOM));

              If Not Result Then
                MessageInfo := MSGVALOROMDIFERENTE;
            End
            Else
              MessageInfo := MASGVALORDIFERENTE;
          End
          Else
            MessageInfo := MASGNAOEXISTERATEIO;
        End;
      End
      Else
         MessageInfo := MSGNAOEXISTELANCTO;
    End;
  except
    result := false;
  end;
End;



function TCtrlImobDocumento.Insert: Boolean;
var
  ContabAlteradorBaixa: TCtrlImobDocumento;
  X: integer;
  oObj : TControl;
begin
  _DocState := dstInsert;

  Result := ValidaOperacao(false);

  If Result Then
  Begin
    _Documento.Operacao.AsString := IntToStr(Integer(_OperacaoDocLancImob));
    _Documento.Status.AsString := IntToStr(Integer(_StatusDocImob));

    If _OperacaoPrepareImob = OpDocumentoImob Then
    begin
       _Documento.DataDisponib.AsDateTime := FDataDisponibilidade;

       // se o documento for com múltiplas contas de baixa, apagar as referências de placonta e plano
       ApagaContaContabil;

       if (_Documento.Operacao.AsString = '2') or (_Documento.Operacao.AsString = '3') then
         Result := AutorizaVencimento;

       if Result then Result := VerificaContaBaixaxPrograma;
       if Result then Result := _Documento.Insert
    end
    Else
       Result := True;

    If Result Then
    Begin
      FCodDocumento := _Documento.Coddocumento.AsFloat;

      If (_OperacaoPrepareImob = OpDocumentoImob) Then
         Result := ProcessaRateioDocum;

      If (_OperacaoPrepareImob = OpDocumentoImob) Then
         Result := ProcessaCcBaixasxDocum;

      If Result Then
         Result := ProcessaLanctoDocum;

      InserirRAD;
    End
    Else
      MessageInfo := MessageInfo + _Documento.MessageInfo;

    if Result And
       ( _OperacaoDocLancImob in [odlBaixaImob, odlBaixaAdiantamentoImob, odlLancaeBaixaImob] ) And
       ( TDbLanctodocum(Self._LstLanctoDocum[0]).Contabiliza) Then
    begin
       (* Verifica se existem alteradores lançados com a opção de "Contabilizar na Baixa" e
          efetua a contabilização dos mesmos alterando o lançamento de origem
       *)
         ContabAlteradorBaixa := TCtrlImobDocumento.Create;
         ContabAlteradorBaixa.InitializeAs(Self);

         Try
            _DtmCapCarObj.SQLContabAltBaixa.Prepare;
            _DtmCapCarObj.SQLContabAltBaixa.ParamByName('CODDOCUMENTO').AsFloat := TDbLanctodocum(Self._LstLanctoDocum[0]).Coddocumento.AsFloat;
            _DtmCapCarObj.SQLContabAltBaixa.Open;

            While Not _DtmCapCarObj.CdsContabAltBaixa.Eof do
            begin
               (* Efetiva o Lançamento de Alterador *)
               ContabAlteradorBaixa.OPeracaoLancto := olSoContabiliza;
               ContabAlteradorBaixa.Prepare(OpLanctoDocumImob, odlAlteradorImob);
               ContabAlteradorBaixa.PartidaDobrada := PartidaDobrada;
               ContabAlteradorBaixa.Lanctodocum.SetValues( TDbLanctodocum(Self._LstLanctoDocum[0]).DATALANCTO.AsDateTime,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('CODDOCUMENTO').AsInteger,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('NUMLANCTO').AsInteger,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('VLRLIQUIDO').AsFloat,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('VALOROUTRAMOEDA').AsFloat,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('VALOR').AsFloat,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('UNIDNEGOC').AsInteger,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('PLNCODIGO').AsInteger,
                                                    0,
                                                    Trunc(IdUsuario),
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('IDPESSOA').AsInteger,
                                                    0,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('ESTORNO').AsInteger,
                                                    0,
                                                    0,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('CODALTERADOR').AsInteger,
                                                    '4',
                                                    '',
                                                    '',
                                                    '',
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('HISTORICOCOMPL').AsString,
                                                    '',
                                                    '',
                                                    '',
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('DEBCRE').AsString,
                                                    IdModulo,
                                                    _DtmCapCarObj.CdsContabAltBaixa.FieldByName('PLANO').AsInteger,
                                                    UsaPlanoPatro,
                                                    True);
               Result := ContabAlteradorBaixa.Update;
               (* Fim Do Lançamento de Alterador*)

               if Result then
                  _DtmCapCarObj.CdsContabAltBaixa.Next
               else
               begin
                  _DtmCapCarObj.CdsContabAltBaixa.Last;

                  if not Result then
                     MessageInfo := ContabAlteradorBaixa.MessageInfo;
               end;
            end;

            _DtmCapCarObj.CdsContabAltBaixa.Close;
            FreeAndNil(ContabAlteradorBaixa);

            For X := 0 To (_LstLanctoDocum.Count - 1) Do
            begin
//              TDbLanctodocum(self._LstLanctoDocum[X]).Free;
              oObj := self._LstLanctoDocum[X];
              FreeAndNil(oObj);
            end;

            For X := 0 To (_LstCcBaixasxDocum.Count - 1) Do
            begin
//              TDbCcBaixasxDocum(self._LstCcBaixasxDocum[X]).Free;
              oObj := self._LstCcBaixasxDocum[X];
              FreeAndNil(oObj);
            end;

            For X := 0 To (_LstRateioDocum.Count - 1) Do
            begin
//              TDbRateiodocum(self._LstRateioDocum[X]).Free;
              oObj := self._LstRateioDocum[X];
              FreeAndNil(oObj);
            end;

            self._LstLanctoDocum.Clear;
            self._LstCcBaixasxDocum.Clear;
            self._LstRateioDocum.Clear;

         Except
            On E:Exception do
            begin
               MessageInfo := ContabAlteradorBaixa.MessageInfo;
               FreeAndNil(ContabAlteradorBaixa);

               For X := 0 To (_LstLanctoDocum.Count - 1) Do
               begin
//                 TDbLanctodocum(self._LstLanctoDocum[X]).Free;
                 oObj := self._LstLanctoDocum[X];
                 FreeAndNil(oObj);
               end;

               For X := 0 To (_LstCcBaixasxDocum.Count - 1) Do
               begin
//                 TDbCcBaixasxDocum(self._LstCcBaixasxDocum[X]).Free;
                 oObj := self._LstCcBaixasxDocum[X];
                 FreeAndNil(oObj);
               end;

               For X := 0 To (_LstRateioDocum.Count - 1) Do
               begin
//                 TDbRateiodocum(self._LstRateioDocum[X]).Free;
                 oObj := self._LstRateioDocum[X];
                 FreeAndNil(oObj);
               end;

               self._LstLanctoDocum.Clear;
               self._LstCcBaixasxDocum.Clear;
               self._LstRateioDocum.Clear;

               Result := False;
            end;
         end;
    end;
  End;
end;




procedure TCtrlImobDocumento.Prepare(OperacaoPrepareImob: TOperacaoPrepareImob; OperacaoDocLancImob: TOperacaoDocLancImob; StatusDocImob: TStatusDocImob = sdocAbertoImob);
begin
  FPartidaDobrada := false;
  FSlipAutomatico := False;
  FCodDocumento := 0;
  _LstRateioLancamento.Clear;
  _LstRateioDocum.Clear;
  _LstCcBaixasxDocum.Clear;
  _LstLanctoDocum.Clear;
  _Lotexdocum.Clear;
  fLanctodocum.Clear;
  _Documento.Clear;
  fRateiodocum.Clear;
  fCcBaixasxDocum.Clear;
  _OperacaoDocLancImob := OperacaoDocLancImob;
  _StatusDocImob := StatusDocImob;
  _OperacaoPrepareImob := OperacaoPrepareImob;
  FDataDisponibilidade := 0;
end;

procedure TCtrlImobDocumento.SetIdEspAcesso(const Value: Double);
begin
  FIdEspAcesso := Value;
end;

procedure TCtrlImobDocumento.SetIdUsuario(const Value: Double);
begin
  FIdUsuario := Value;
end;

procedure TCtrlImobDocumento.SetLanctodocum(const Value: TLanctoImobdocum);
begin
  FLanctodocum := Value;
end;

procedure TCtrlImobDocumento.SetRateiodocum(const Value: TRateioImobDocum);
begin
  FRateiodocum := Value;
end;

procedure TCtrlImobDocumento.SetCcBaixasxDocum(const Value: TCCBaixasxImobDocum);
begin
  FCcBaixasxDocum := Value;
end;

function TCtrlImobDocumento.AjustaDataFloat(dDataLancto: TDateTime; iFloat: Integer; SistemaLancto: TSistemaLancto) :TDateTime;
Var
  dDataFloat : TDateTime;
Begin
  dDataFloat := dDataLancto;
  // não precisa executar se o número de dias de float forem diferentes de zero
  // na exclusão da baixa estava passando aqui com a dDataLanc = 0, gerando um erro
  if iFloat <> 0 then begin

    Case SistemaLancto of

    slCAR:  dDataFloat := DiasUteis.SomaDiasUteis(Sistema.IdEmpresa,dDataLancto,iFloat,True,False,False);

    slCAP: begin
              dDataFloat := dDataFloat - iFloat;  // alex estava com o sinal +
              while not DiasUteis.DiaUtil(Sistema.IdEmpresa,dDataFloat,True,False,False) do  // estava passando dDataLancto
                        dDataFloat := dDataFloat - 1;
           end;
    end;
  end;
  Result := dDataFloat;
End;

function TCtrlImobDocumento.ExisteNumDoc(sRecPag : String;
                rIdForCli, rIdEmpresa, rNoDocumento: Real; sComplDocumento: String): Boolean;
Var
   sNumDoc, sSqlComplDoc: String;
begin
   if Trim(sComplDocumento) = '' Then
      sSqlComplDoc := ' AND ((COMPLDOCUMENTO IS NULL) OR (COMPLDOCUMENTO = '''+ sComplDocumento +'''))'
   Else
      sSqlComplDoc :=  ' AND COMPLDOCUMENTO = '''+ sComplDocumento +'''';

   sNumDoc := FloatToStrF(rNoDocumento,ffnumber,20,0);
   sNumDoc := StrRemoveChars(sNumDoc, [ThousandSeparator]);

   if _Cds.Active Then _Cds.Close;

   _Cds.Data := GetDataPacket('SELECT CODDOCUMENTO,PLANO,PLACONTA,CODCENTROCUSTO,CODSUBCONTA,PLACONTAANT FROM DOCUMENTO '+
                              ' WHERE RECPAG = '''+ sRecPag +''''+
                              ' AND IDPESSOA = '+ FloatToStr(rIdEmpresa)+
                              ' AND IDFORCLI = '+ FloatToStr(rIdForCli)+
                              ' AND NODOCUMENTO = '+  sNumDoc +
                              sSqlComplDoc);

   Result := Not _Cds.IsEmpty;

   if Result Then
   Begin
      _Documento.Coddocumento.AsFloat := _Cds.FieldByname('CodDocumento').AsInteger;
      _Documento.Plano.AsFloat := _Cds.FieldByname('PLANO').AsInteger;
      _Documento.Placonta.AsString := _Cds.FieldByname('PLACONTA').AsString;
      _Documento.PlacontaAnt.AsString := _Cds.FieldByname('PLACONTAANT').AsString;
      _Documento.Codcentrocusto.AsString := _Cds.FieldByname('CODCENTROCUSTO').AsString;
      _Documento.Codsubconta.AsString := _Cds.FieldByname('CODSUBCONTA').AsString;

      MessageInfo := MSGNUMCOMPLCADASTRADO;
   end;

   If _Cds.Active Then _Cds.Close;
end;

function TCtrlImobDocumento.GetDebCre(dCodTipDoc: Double): String;
begin
  _Cds.Data := GetDataPacket('SELECT DEBCRE FROM TIPODOCRECPAG  WHERE ' +
                             '(CODTIPDOC = ' + FloatToStr(dCodTipDoc) + ')');

  If _Cds.IsEmpty Then
     Result := ''
  Else
     Result := _Cds.Fields[0].AsString;

  If _Cds.Active Then _Cds.Close;

  If (Trim(Result) <> 'C') And (Trim(Result) <> 'D') Then
  begin
     MessageInfo := 'DebCre inválido para o CodTipDoc: ' + FloatToStr(dCodTipDoc);
     Raise Exception.Create(MessageInfo);
  end;
end;

procedure TCtrlImobDocumento.SetRecbToPagto(const Value: TRecbToImobPagto);
begin
  FRecbToPagto := Value;
end;

procedure TCtrlImobDocumento.SetValues(liCoddocumento: LongInt;
  rNodocumento: Double; sCompldocumento, sStatus, sRecpag, sOperacao,
  sNumslip, sNumleitcodbarras, sPlaconta, sCodcentrocusto, sNossonumero,
  sNumdigcodbarras, sGrupodoc, sFlgemitelancbaix, sFlgconfirmarecpag,
  sEmisbloq, sReferencia, sObs: String; dDatavencto, dDataemissao,
  dDataprogramada, dDataremessa, dDatalimite, dDatacorrecao: TDateTime;
  rVlrmulta, rValorjuros, rValordesconto, rPercjurossimples, rPercjurosatuarial: Double;
  liCodtipdoc, liIdpessoa, liIdmodulo, liIdforcli, liNumfatura, liIdcbancaria, liUnidnegoc,
  liPlano, liNumcpbaixa, liNumapgr, liMoecodigo, liLotetransmissao, liIndicecorrecao,
  liIdusuarioinclusao, liIdempresa, liFlgnaoconciliado, liControleremessa,
  liCodsubconta, liCodportforma, liCodgrupocnab, liCodgeradorinss, liCodforma: LongInt;
  const iIdSegregaCriter: integer = -1;
  const sPlacontaAnt: String = ''
  //Cássio Rovaroto -  SIG nº 23656.59199 - Início
  ; const sNfsNumero: string  = '';
  const sNfsSerie: string = '';
  const dNfsDataemissao: TDateTime = 0;
  const sNfsObs: string = ''
  //Cássio Rovaroto -  SIG nº 23656.59199 - Fim
  ; const iNfsServico: Integer = 0
  ; const sFlgSimples: string =  ''
  );
begin
   _Documento.Clear;

   _Documento.QtdeCotas.AsFloat := FQtdeCotas;
   _Documento.Coddocumento.AsFloat := liCoddocumento;
   _Documento.Compldocumento.AsString := Trim(sCompldocumento);
   _Documento.Status.AsString := IntToStr(Integer(_StatusDocImob));
   _Documento.Recpag.AsString := Trim(sRecpag);
   _Documento.Operacao.AsString := IntToStr(Integer(_OperacaoDocLancImob));

   if (Trim(sNumslip) = '') and  SlipAutomatico Then
      _Documento.Numslip.AsString := FloatToStr(GetSequence('SLIPDOCUMENTO'))
   else
     _Documento.Numslip.AsString := Trim(sNumslip);

   _Documento.Numleitcodbarras.AsString := Trim(sNumleitcodbarras);
   _Documento.Placonta.AsString := Trim(sPlaconta);
   _Documento.Codcentrocusto.AsString := Trim(sCodcentrocusto);
   _Documento.Nossonumero.AsString := Trim(sNossonumero);
   _Documento.Numdigcodbarras.AsString := Trim(sNumdigcodbarras);
   _Documento.Grupodoc.AsString := Trim(sGrupodoc);
   _Documento.Flgemitelancbaix.AsString := Trim(sFlgemitelancbaix);
   _Documento.Flgconfirmarecpag.AsString := Trim(sFlgconfirmarecpag);
   _Documento.Emisbloq.AsString := Trim(sEmisbloq);
   _Documento.Referencia.AsString := Trim(sReferencia);
   _Documento.Obs.AsString := Trim(sObs);
   _Documento.Datavencto.AsDateTime := dDatavencto;
   _Documento.Dataemissao.AsDateTime := dDataemissao;
   _Documento.Dataprogramada.AsDateTime := dDataprogramada;
   _Documento.Dataremessa.AsDateTime := dDataremessa;
   _Documento.Datalimite.AsDateTime := dDatalimite;
   _Documento.Datacorrecao.AsDateTime := dDatacorrecao;
   _Documento.Nodocumento.AsFloat := rNodocumento;
   _Documento.Vlrmulta.AsFloat := rVlrmulta;
   _Documento.Valorjuros.AsFloat := rValorjuros;
   _Documento.Valordesconto.AsFloat := rValordesconto;
   _Documento.Percjurossimples.AsFloat := rPercjurossimples;
   _Documento.Percjurosatuarial.AsFloat := rPercjurosatuarial;
   _Documento.Codtipdoc.AsFloat := liCodtipdoc;
   _Documento.Idpessoa.AsFloat := liIdpessoa;
   _Documento.Idmodulo.AsFloat := liIdmodulo;
   _Documento.Idforcli.AsFloat := liIdforcli;
   _Documento.Idusuarioinclusao.AsFloat := liIdusuarioinclusao;
   _Documento.Unidnegoc.Clear;
   _Documento.PlacontaAnt.AsString := Trim(sPlacontaAnt);

   //Cássio Rovaroto - SIG nº 23656.59199 - Início
   _Documento.NfsNumero.AsString := sNfsNumero;
   _Documento.NfsSerie.AsString := sNfsSerie;
   _Documento.NfsDataEmissao.AsDateTime := dNfsDataemissao;
   _Documento.NfsObs.AsString := sNfsObs;
   //Cássio Rovaroto - SIG nº 23656.59199 - Fim
   _Documento.NfsServico.AsInteger := iNfsServico; //Cássio Rovaroto - SIG nº 123523
   _Documento.FlgSimples.AsString := sFlgSimples; // Cássio Rovaroto - SIG nº 136888

   SetFieldValue(_Documento.Numfatura, liNumfatura);
   SetFieldValue(_Documento.Idcbancaria, liIdcbancaria);
   SetFieldValue(_Documento.Plano, liPlano);
   SetFieldValue(_Documento.Numcpbaixa, liNumcpbaixa);
   SetFieldValue(_Documento.Numapgr, liNumapgr);
   SetFieldValue(_Documento.Moecodigo, liMoecodigo);
   SetFieldValue(_Documento.Indicecorrecao, liIndicecorrecao);
   SetFieldValue(_Documento.Idempresa, liIdempresa);
   SetFieldValue(_Documento.Flgnaoconciliado, liFlgnaoconciliado);
   SetFieldValue(_Documento.Controleremessa, liControleremessa);
   SetFieldValue(_Documento.Codsubconta, liCodsubconta);
   SetFieldValue(_Documento.Codportforma, liCodportforma);
   SetFieldValue(_Documento.Codgrupocnab, liCodgrupocnab);
   SetFieldValue(_Documento.Codgeradorinss, liCodgeradorinss);
   SetFieldValue(_Documento.Codforma, liCodforma);

   if iIdSegregaCriter <> -1 then
     _Documento.Idsegregacriter.AsInteger := iIdSegregaCriter;
end;

procedure TCtrlImobDocumento.SetCodDocumento(const Value: Double);
begin
  FCodDocumento := Value;
end;

procedure TCtrlImobDocumento.SetSaldo(const Value: TImobSaldo);
begin
  FSaldo := Value;
end;

procedure TCtrlImobDocumento.SetForCli(const Value: TIMobForCli);
begin
  FForCli := Value;
end;

procedure TCtrlImobDocumento.EmiteLancaBaixa(liCodDoc: LongInt;
  bMarcaComoEmitido: boolean);
begin
    If bMarcaComoEmitido Then
    Begin
       If Not ExecSQL('UPDATE DOCUMENTO SET FLGEMITELANCBAIX = ''S'' WHERE CODDOCUMENTO = ' + IntToStr(liCodDoc)) Then
          Raise EdataBaseError.Create('Erro ao marcar lança e baixa como emitido para o CodDocumento ' + IntToStr(liCodDoc) + ', verifique.' + (#13+#10) + MessageInfo);
    End
    Else
      If Not ExecSQL('UPDATE DOCUMENTO SET FLGEMITELANCBAIX = NULL WHERE CODDOCUMENTO = ' + IntToStr(liCodDoc)) Then
         Raise EdataBaseError.Create('Erro ao liberar lança e baixa para emissão para o CodDocumento ' + IntToStr(liCodDoc) + ', verifique.' + (#13+#10) + MessageInfo);
end;

function TCtrlImobDocumento.GetNumFatura: Cardinal;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GetNumFatura;
     If Result = 0 Then Raise Exception.Create(Connection.AppServer.MessageInfo);
  End
  Else
     Result := GetSequence('SEQDOCNUMFATURA');
end;

procedure TCtrlImobDocumento.SetLote(const Value: TImobLote);
begin
  FLote := Value;
end;

function TCtrlImobDocumento.UpdateDataDisponib(liCodDocumento: LongInt;dDataDisp :TDatetime): Boolean;
begin
   Result := ExecSql('UPDATE DOCUMENTO SET DATADISPONIB = '''+DateToStr(dDataDisp)+''' WHERE CODDOCUMENTO = '+IntToStr(liCodDocumento));
end;

function TCtrlImobDocumento.UpdateStatusBaixa(liCodDocumento: LongInt; dDataLimite: TDateTime): Boolean;
var  sStatus: String;
begin
  // Alterado por FHBS - SOL: 136336 KTN: 815081
  // Adicionei a dDataLimite pois só podemos coloca FLGNAOCONCILIADO = NULL se o
  // saldo para a DATA do calulo estiver zerado.
  // Isso é para reabrir o documento pago após a data de Recalculo.
  Saldo.CalculaSaldo(liCodDocumento, dDataLimite);

  sStatus := '';
  if IsFloatZero(Saldo.Valor) Or
     (_OperacaoDocLancImob in [ odlLancaeBaixaImob ] ) then

    //Ricardo Freitas - SOL: 156667 - KINTANA: 1267057
    //Para os casos de baixa de documento deverá alterar
    //como já conciliado, para este documento não entrar na rotina
    //de ajusta provisão.
    sStatus := QuotedStr('2')  + ' , FLGNAOCONCILIADO = NULL'

  else
  begin
    sStatus := QuotedStr('0') ;
  end;

  Result := ExecSql('UPDATE DOCUMENTO SET STATUS = ' + sStatus + ' WHERE CODDOCUMENTO = '+IntToStr(liCodDocumento));
end;

function TCtrlImobDocumento.UpdateStatusBaixaAdianto(liCodDocumento,
  liPlnCodigo, iNumLancto: LongInt; dDataLancto: TDateTime; SistemaLancto: TSistemaLancto;
  bCancelaBaixa: Boolean = False): Boolean;
Var
   sDebCre: Char;
begin
   If Not bCancelaBaixa Then
   Begin
      Result := ExecSQL('UPDATE DOCUMENTO SET STATUS = ''0'', OPERACAO = ''15'' WHERE CODDOCUMENTO = '+ InttoStr(liCodDocumento) + ' AND OPERACAO = ''14''');

      If Result Then
      Begin
        Case SistemaLancto of
          slCar: sDebCre := 'C';
          slCap: sDebCre := 'D';
        Else
          sDebCre := ' ';
        End;

        If (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') Then
        begin
           MessageInfo := 'DebCre inválido para o CodDocumento: ' + FloatToStr(liCodDocumento);
           Raise Exception.Create(MessageInfo);
        end;


        If liPlnCodigo > 0 Then
           Result := ExecSQL('UPDATE LANCTODOCUM SET OPERACAO = ''15'', DATALANCTO = TO_DATE(''' + DateToStr(dDataLancto) + ''',''DD\MM\YYYY''), DEBCRE = ''' + sDebCre + ''', PLNCODIGO = ' + IntToStr(liPlnCodigo) + ' WHERE CODDOCUMENTO = '+ InttoStr(liCodDocumento) + ' AND OPERACAO = ''14''')
        Else
           Result := ExecSQL('UPDATE LANCTODOCUM SET OPERACAO = ''15'', DATALANCTO = TO_DATE(''' + DateToStr(dDataLancto) + ''',''DD\MM\YYYY''), DEBCRE = ''' + sDebCre + '''  WHERE CODDOCUMENTO = '+ InttoStr(liCodDocumento) + ' AND OPERACAO = ''14''');
      End;
   End
   Else
   Begin
      Case SistemaLancto of
        slCar: sDebCre := 'D';
        slCap: sDebCre := 'C';
      Else
        sDebCre := ' ';
      End;

      If (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') Then
      begin
         MessageInfo := 'DebCre inválido para o CodDocumento: ' + FloatToStr(liCodDocumento);
         Raise Exception.Create(MessageInfo);
      end;

      Result := ExecSQL('UPDATE DOCUMENTO SET STATUS = ''0'', OPERACAO = ''14'' WHERE CODDOCUMENTO = ' + InttoStr(liCodDocumento) +  ' AND OPERACAO = ''15''') And
                ExecSQL('UPDATE LANCTODOCUM SET OPERACAO = ''14'', PLNCODIGO = NULL ,DEBCRE = ''' + sDebCre + ''' WHERE CODDOCUMENTO = '+ InttoStr(liCodDocumento) + ' AND OPERACAO = ''15''') And
                ExecSQL('DELETE FROM RECBTOPAGTO WHERE CODDOCUMENTO = '+IntToStr(liCodDocumento)+' AND NUMLANCTO = '+IntToStr(iNumLancto));
   End;
end;

function TCtrlImobDocumento.UpdateStatusOrcamento(liCodDocumento: LongInt;
  sStatus: Char): Boolean;
begin
   Result := True;

   _Cds.Data := GetDataPacket(' SELECT ' +
                              '   IDRESERVAORCAMEN, VLRRESORCAMEN ' +
                              ' FROM ' +
                              '   RATEIODOCUM ' +
                              ' WHERE ' +
                              '   CODDOCUMENTO = ' + IntToStr(liCodDocumento) + ' AND ' +
                              '   IDRESERVAORCAMEN IS NOT NULL ');
   _Cds.First;

   While Not _Cds.Eof do
   Begin
      Result := ExecSQL(' UPDATE ' +
                        '   RESERVAORCAMEN ' +
                        ' SET ' +
                        '   FLGRESERVA = ' + QuotedStr(sStatus) + ', ' +
                        '   VLRCOMPROMISSO = VLRCOMPROMISSO - ' + FloatToStrCM(_Cds.FieldByName('VLRRESORCAMEN').AsFloat) +
                        ' WHERE ' +
                        '   IDRESERVAORCAMEN = ' + _Cds.FieldByName('IDRESERVAORCAMEN').AsString);

      If Not Result Then Raise Exception.Create(MessageInfo);

      _Cds.Next;
   End;

   If _Cds.ACtive Then _Cds.Close;
end;


function TCtrlImobDocumento.UpdateValorOrcamemto(liIdRateioDocum: LongInt;
  rValor: Double): Boolean;
begin
  Result := ExecSQL('UPDATE ' +
                    '  RATEIODOCUM ' +
                    'SET ' +
                    '  VLRRESORCAMEN = ' + FloatToStrCM(rValor) +
                    'WHERE ' +
                    '  IDRATEIODOCUM = ' + IntToStr(liIdRateioDocum));
end;

function TCtrlImobDocumento.RegAdiantamento(liCodDoc, liCodDocAdto,
  liIdEmpresa, liIdUsuario, liIdModulo, liPlanoConta: LongInt; sDataRegu: TDateTime; sDocumDoc, sDocumAdto,
  sNomeCliFor: String; rValor: Double; bUsaPlanoPatro: Boolean;
  SistemaLancto: TSistemaLancto): Boolean;
Var
  sDebCre :String;
Begin
  _liPlnCodigoAdianto := 0;

  sDebCre := '';

  Case SistemaLancto of
    slCap: sDebCre:='D';
    slCar: sDebCre:='C';
  End;

  If (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') Then
  begin
     MessageInfo := 'DebCre inválido para o CodDocumento: ' + FloatToStr(liCodDoc);
     Raise Exception.Create(MessageInfo);
  end;

  Prepare(OpLanctoDocumImob, odlRegDocumentoImob);
  Lanctodocum.CodDocumento := liCodDoc;
  Lanctodocum.SetValues(sDataRegu, liCodDoc, 0, rValor, 0, rValor, 0, 0, 0,
  liIdUsuario, liIdEmpresa, 0, 0, 0, 0, 0, '17', '', '', '', '', '', '', '', sDebCre,
  liIdModulo, liPlanoConta, bUsaPlanoPatro, True);

  Result := Insert;

  If Result Then
  Begin
    Case SistemaLancto of
      slCap: sDebCre:='C';
      slCar: sDebCre:='D';
    End;

    If (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') Then
    begin
       MessageInfo := 'DebCre inválido para o CodDocumento: ' + FloatToStr(liCodDoc);
       Raise Exception.Create(MessageInfo);
    end;

    Prepare(OpLanctoDocumImob, odlRegAdiantamentoImob);
    Lanctodocum.CodDocumento := liCodDocAdto;
    Lanctodocum.SetValues(sDataRegu, liCodDocAdto, 0, rValor, 0, rValor, 0, _liPlnCodigoAdianto, 0,
    liIdUsuario, liIdEmpresa, 0, 0, 0, 0, 0, '16', '', '', '', '', '', '', '', sDebCre,
    liIdModulo, liPlanoConta, bUsaPlanoPatro, True);

    Result := Insert;
  End;

  _liPlnCodigoAdianto := 0;
end;

function TCtrlImobDocumento.EstornaExcluiContab(liPlanilha, liEmpresa, liIdUsuario,
  liIdModulo: LongInt; dDataLancto: TDateTime; bUsaPlanopatro: Boolean): TTipoEstornoContab;
Begin
   If liPlanilha = 0 Then
      Result := tecExcluido
   Else
   Begin
      Result := tecErro;

      If _Periodo.RetornaPeriodoExercicioData(liEmpresa, DateToStr(dDataLancto)) Then
      Begin
         If _Periodo.TestaPeriodoBloqueado(liEmpresa, tbBloqOuInt, _Periodo.Periodo, _Periodo.Exercicio, False) Then
         Begin
            If _LancaContab.EstornaLancaContab(liIdUsuario, liPlanilha, liIdModulo, liEmpresa, bUsaPlanopatro,
               DateToStr(dDataLancto)) Then
               Result := tecEstornado
            Else
            begin
               MessageInfo := _LancaContab.MessageInfo;
               raise Exception.Create(MessageInfo);
            end
         End
         Else
          if _LancaContab.ExcluiLancaContab(liIdUsuario, liPlanilha, liIdModulo, 0, bUsaPlanopatro, True) Then
             Result := tecExcluido
          Else
          begin
             MessageInfo := _LancaContab.MessageInfo;
             raise Exception.Create(MessageInfo);
          end;
      End
      Else
      begin
        MessageInfo := _Periodo.MessageInfo;
        raise Exception.Create(MessageInfo);
      end;
   End;
end;

function TCtrlImobDocumento.Estornar(dData: TDateTime; liIdModulo, liIdEmpresa,
  liIdUsuario, liCodDocumento, liNumLanc, liPlanoConta: LongInt; bUsaPlanoPatro: Boolean;
  OperacaoEstorno: TOperacaoEstorno = oeSoProcessa; liCodDocumento2: LongInt = 0; liNumLanc2: LongInt = 0;
  bLancaContabEstornaAdianto: Boolean = True;
  bEstornoDocum: Boolean = false): Boolean;
Var
  sEntradaSaida, sDebCre: String;
  rPlnCodigoEstorno, rCodLancFinanc, rPlnCodigo: Double;
  _LancaFinanc: TCtrlFinanc;
  DataEstorno: TDateTime;
  bEfetivaEstorno: Boolean;
  bDocumentoBaixado : Boolean;
begin
  Result := False;
  If Operacaoestorno in [oeDialogProcessa, oeAppServerProcessa] Then
  Begin
     DataEstorno := dData;

     If Operacaoestorno = oeDialogProcessa Then
        bEfetivaEstorno := InputDate('Estorno','Indique a data para estorno', DataEstorno)
     Else
        bEfetivaEstorno := True;

     If bEfetivaEstorno Then
     Begin
        If ConnectionSide = cnsclient Then
        Begin
           Result := Connection.AppServer.Estornar(DataEstorno, liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento,
                         liNumLanc, liPlanoConta, bUsaPlanoPatro, Integer(oeAppServerProcessa) );

           If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
        End
        Else
        Begin
           Try
             StartTransaction;

             Result := Estornar(DataEstorno, liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento,
                         liNumLanc, liPlanoConta, bUsaPlanoPatro);

             if ( Result ) and ( liCodDocumento2 <> 0 ) and ( liNumLanc2 <> 0 ) then
                Result := Estornar( DataEstorno, liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento2,
                                    liNumLanc2, liPlanoConta, bUsaPlanoPatro, oeSoProcessa, 0, 0, false );

             if bEstornoDocum then
               Result := result and ExecSql('UPDATE IMPOSTORETIDO SET FLGESTORNADO = ''S'' WHERE NUMLANCTO IS NULL AND CODDOCUMENTO = ' + formatFloat('0', liCodDocumento));

               Result := result and ExecSql(' UPDATE IMPOSTORETIDO SET FLGESTORNADO = ''S'' '+
                                            ' WHERE CODDOCUMENTO = '+ intTostr(liCodDocumento) +' AND NUMLANCTO = '+ inttoStr(liNumLanc) + ' AND '+
                                            '       NUMLANCTO IN (SELECT NUMLANCTO FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ intTostr(liCodDocumento) +' AND OPERACAO = ''4'' AND NUMLANCTO = '+ inttoStr(liNumLanc) +') AND '+
                                            '       CODDOCUMENTO NOT IN (SELECT CODDOCUMENTO FROM LANCIRRF WHERE CODDOCUMENTO IS NOT NULL) ');

             result := result and ExecSql(' DELETE FROM DOCXIMPOSTOACUM WHERE CODDOCUMENTO = '+ intTostr(liCodDocumento));

            if not Result then raise exception.create(messageinfo);

            if (_OperacaoPrepareImob = OpLanctoDocumImob) then
              result := ExcluirRAD(liCodDocumento);

            If Not Result Then Raise Exception.Create(MessageInfo);

            If Result Then Commit Else Rollback;
           Except
             On E:Exception Do
             Begin
               Rollback;
               MessageInfo := E.Message;
             End;
           End;
        End;
     End
     Else
        MessageInfo := 'O Estorno não foi efetivado.';
  End
  Else
  Begin
     If liNumLanc  = 0 then
     Begin
        If Not UpdateStatusOrcamento(liCodDocumento,'A') Then Exit;

        _DtmCapCarObj.SqlLancEstornoDoc.Prepare;
        _DtmCapCarObj.SqlLancEstornoDoc.ParamByName('CODDOCUMENTO').AsFloat := liCodDocumento;
        _DtmCapCarObj.SqlLancEstornoDoc.Open;
     end
     else
     Begin
        _DtmCapCarObj.SqlLancEstornoLanc.Prepare;
        _DtmCapCarObj.SqlLancEstornoLanc.ParamByName('CODDOCUMENTO').AsFloat := liCodDocumento;
        _DtmCapCarObj.SqlLancEstornoLanc.ParamByName('NUMLANCTO').AsFloat := liNumLanc;
        _DtmCapCarObj.SqlLancEstornoLanc.Open;
     end;

     _DtmCapCarObj.CdsLancEstorno.First;
     while not _DtmCapCarObj.CdsLancEstorno.Eof do
     Begin
        If _DtmCapCarObj.CdsLancEstorno.FieldByName('ESTORNO').AsInteger > 0 Then
        begin
           MessageInfo := 'Este lançamento foi estornado, proibido estornar.';
           Raise Exception.Create(MessageInfo);
        end;

        {** Lança Estorno no Financeiro, caso exista **}
        _LancaFinanc := TCtrlFinanc.Create(liIdEmpresa, liIdModulo, liIdUsuario, bUsaPlanoPatro);
        _LancaFinanc.InitializeAs(Self);
        _LancaFinanc.OpenTransaction := false;


        Try
           if _DtmCapCarObj.CdsLancEstorno.FieldByName('CODLANCFINANC').AsInteger <> 0 then
           Begin
              _DtmCapCarObj.SQLEstornoFinanc.Prepare;
              _DtmCapCarObj.SQLEstornoFinanc.ParamByName('CODLANCFINANC').AsFloat := _DtmCapCarObj.CdsLancEstorno.FieldByName('CODLANCFINANC').AsFloat;
              _DtmCapCarObj.SQLEstornoFinanc.Open;

              If _DtmCapCarObj.CdsEstornoFinanc.FieldByName('ENTRADASAIDA').AsString = 'E' then
                 sEntradaSaida:='S'
              else
                 sEntradaSaida:='E';

              If _Cds.Active Then _Cds.Close;

              If Not _LancaFinanc.LancaFinanceiro(_Cds.Data, liIdModulo,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('HISTPADFINAN').AsFloat,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('MOECODIGO').AsInteger,
                           liIdUsuario,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('CODPORTADOR').AsInteger,
                           liIdEmpresa,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('VALORLANCFINAN').AsFloat,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat,
                           dData,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('DATACONCILIACAO').AsDateTime,
                           0,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('NUMCHQBORDERO').AsString,
                           sEntradaSaida,
                           'ESTORNO ' + _DtmCapCarObj.CdsEstornoFinanc.FieldByName('HISTORICO').AsString,
                           _DtmCapCarObj.CdsEstornoFinanc.FieldByName('STATUSCONCILIA').AsString,
                           rCodLancFinanc, rPlnCodigo, 0,
                           (_DtmCapCarObj.CdsLancEstorno.FieldByName('PLNCODIGO').AsInteger <> 0)) Then
              Begin
                MessageInfo := _LancaFinanc.MessageInfo;
                Abort;
              End;

              _DtmCapCarObj.SQLRateioFinanc.Prepare;
              _DtmCapCarObj.SQLRateioFinanc.ParamByName('CODLANCFINANC').AsFloat := _DtmCapCarObj.CdsLancEstorno.FieldByName('CODLANCFINANC').AsFloat;
              _DtmCapCarObj.SQLRateioFinanc.Open;

              _DtmCapCarObj.CdsRateioFinanc.First;
              While (not _DtmCapCarObj.CdsRateioFinanc.EOF) do
              Begin
                 If Not _LancaFinanc.LancaRateioFinanc(
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('UNIDNEGOC').AsInteger,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('MOECODIGO').AsInteger,
                         liIdEmpresa,
                         _DtmCapCarObj.CdsEstornoFinanc.FieldByName('CODPORTADOR').AsInteger,
                         (_DtmCapCarObj.CdsRateioFinanc.FieldByName('VALOR').AsFloat*(-1)),(_DtmCapCarObj.CdsRateioFinanc.FieldByName('VALOROUTRAMOEDA').AsFloat*(-1)),
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('CODTIPRECDES').AsString,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('RECPAG').AsString,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('CODCENTRORESPON').AsString,
                         dData, rCodLancFinanc, '',
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('IDPROGRAMA').AsFloat,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('IDPATRO').AsFloat,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('IDPLANOPREV').AsFloat,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('CODTIPDOC').AsFloat,
                         liPlanoConta,
                         _DtmCapCarObj.CdsRateioFinanc.FieldByName('IDSEGREGACRITER').AsInteger) Then
                 Begin
                   MessageInfo := _LancaFinanc.MessageInfo;
                   Abort;
                 End;

                 _DtmCapCarObj.CdsRateioFinanc.Next;
              end;
           end;
           FreeAndNil(_LancaFinanc)
        Except
          On E:Exception Do
          Begin
            FreeAndNil(_LancaFinanc);
            If Trim(E.Message) <> '' Then Raise;
          End;
        End;

        {** Lança estorno contábil, caso exista **}
        if ( _DtmCapCarObj.CdsLancEstorno.FieldByName('PLNCODIGO').AsInteger <> 0 ) And
           bLancaContabEstornaAdianto then
        Begin
           If Not _LancaContab.EstornaLancaContab(liIdUsuario, _DtmCapCarObj.CdsLancEstorno.FieldByName('PLNCODIGO').AsInteger,
                  liIdModulo, liIdEmpresa, bUsaPlanoPatro, DateToStr(dData)) Then
           Begin
              MessageInfo := _LancaContab.MessageInfo;
              Exit;
           End;

           rPlnCodigoEstorno := _LancaContab.RetornoPlnCodigo;
        end
        Else
           if bLancaContabEstornaAdianto then
             rPlnCodigoEstorno := 0
           else
              rPlnCodigoEstorno :=  _LancaContab.RetornoPlnCodigo;

        If _DtmCapCarObj.CdsLancEstorno.FieldByName('DEBCRE').AsString = 'D' then
           sDebCre:='C'
        else
           sDebCre:='D';

        {** Lança o Estorno do Lançamento **}
        Prepare(OpLanctoDocumImob, TOperacaoDocLancImob(StrToIntDef(Trim((_DtmCapCarObj.CdsLancEstorno.FieldByName('OPERACAO').AsString)),0)));

        Lanctodocum.CodDocumento := liCodDocumento;
        Lanctodocum.SetValues( dData, liCodDocumento, 0,
                 _DtmCapCarObj.CdsLancEstorno.FieldByName('VALOR').AsFloat,
                 _DtmCapCarObj.CdsLancEstorno.FieldByName('VALOROUTRAMOEDA').AsFloat,
                 _DtmCapCarObj.CdsLancEstorno.FieldByName('VALOR').AsFloat,
                 0, Round(rPlnCodigoEstorno), 0, liIdUsuario, liIdEmpresa, 0, 0, 0, 0,
                 _DtmCapCarObj.CdsLancEstorno.FieldByName('CODALTERADOR').AsInteger,
                 _DtmCapCarObj.CdsLancEstorno.FieldByName('OPERACAO').AsString,
                 '', '', '',
                 'ESTORNO '+ _DtmCapCarObj.CdsLancEstorno.FieldByName('HISTORICOCOMPL').AsString,
                 '', '', '', sDebCre, liIdModulo, liPlanoConta, bUsaPlanoPatro);

        if bEstornoDocum then
        begin
          Result := ExecSql('UPDATE IMPOSTORETIDO SET FLGESTORNADO = ''S'' WHERE NUMLANCTO IS NULL AND CODDOCUMENTO = ' + formatFloat('0', liCodDocumento));
        end;
        Result := ExecSql(' UPDATE IMPOSTORETIDO SET FLGESTORNADO = ''S'' '+
                          ' WHERE CODDOCUMENTO = '+ intTostr(liCodDocumento) +' AND NUMLANCTO = '+ inttoStr(liNumLanc) + ' AND '+
                          '       NUMLANCTO IN (SELECT NUMLANCTO FROM LANCTODOCUM WHERE CODDOCUMENTO = '+ intTostr(liCodDocumento) +' AND OPERACAO = ''4'' AND NUMLANCTO = '+ inttoStr(liNumLanc) +') AND '+
                          '       CODDOCUMENTO NOT IN (SELECT CODDOCUMENTO FROM LANCIRRF WHERE CODDOCUMENTO IS NOT NULL) ');

        result := ExecSql('UPDATE LOTEXDOCUM SET FLGESTORNO = ''S'' WHERE CODDOCUMENTO =  '+ formatFloat('0', liCodDocumento) );

        if _OperacaoPrepareImob = OpDocumentoImob then
          result := ExcluirRAD(liCodDocumento);

        If Not Result Then
          Raise Exception.Create(MessageInfo);

        If Not Insert Then
          Exit;

        {** Insere o RecbToPagto Referente ao Estorno **}
        if _DtmCapCarObj.CdsLancEstorno.FieldByName('CODPORTFORMA').AsInteger <> 0 then
        Begin
           If Not RecbToPagto.Inserir(liCodDocumento, Lanctodocum.NumLancto, liIdUsuario,
                               Trunc(rCodLancFinanc),
                               _DtmCapCarObj.CdsLancEstorno.FieldByName('CODPORTFORMA').AsInteger,
                               _DtmCapCarObj.CdsLancEstorno.FieldByName('NUMLOTE').AsInteger,
                               0, 0, _DtmCapCarObj.CdsLancEstorno.FieldByName('NUMCHQBORDERO').AsString,
                               DateToStr(dData), DateToStr(dData)) Then Exit;
        end;

        _DtmCapCarObj.SQLUpdLancEstorno.Prepare;
        _DtmCapCarObj.SQLUpdLancEstorno.ParamByName('ESTORNO').AsFloat := Lanctodocum.NumLancto;
        _DtmCapCarObj.SQLUpdLancEstorno.ParamByName('CODDOCUMENTO').AsFloat := liCodDocumento;
        _DtmCapCarObj.SQLUpdLancEstorno.ParamByName('NUMLANCTO').AsFloat := _DtmCapCarObj.CdsLancEstorno.FieldByName('NUMLANCTO').AsFloat;
        If Not ExecSQL(_DtmCapCarObj.SQLUpdLancEstorno.SqlChanged) Then
          Exit;

        _DtmCapCarObj.SQLUpdLancEstorno.Prepare;
        _DtmCapCarObj.SQLUpdLancEstorno.ParamByName('ESTORNO').AsFloat := _DtmCapCarObj.CdsLancEstorno.FieldByName('NUMLANCTO').AsFloat;
        _DtmCapCarObj.SQLUpdLancEstorno.ParamByName('CODDOCUMENTO').AsFloat := liCodDocumento;
        _DtmCapCarObj.SQLUpdLancEstorno.ParamByName('NUMLANCTO').AsFloat := Lanctodocum.NumLancto;
        If Not ExecSQL(_DtmCapCarObj.SQLUpdLancEstorno.SqlChanged) Then Exit;

        _DtmCapCarObj.CdsLancEstorno.Next;
     end;

     if not UpdateStatusBaixa(liCodDocumento) then
     Exit;
     Result := True;
  End;
end;




function TCtrlImobDocumento.LancaRateioContab(liCodDocumento,
                                          liCodAlterador,
                                          iCodPortForma,
                                          liPlanoConta,
                                          liUnidNegocioLancto,
                                          liIdEmpresa,
                                          liIdModulo,
                                          liIdUsuario,
                                          liPlano               : Integer;
                                          var liPlnCodigo       : Double;
                                          dDataLancto           : TDateTime;
                                          rValor,
                                          rValorOM              : Double;
                                          iOperacao             : Integer;
                                          sDebCre,
                                          sHistoricoCompl,
                                          sNumChqBord,
                                          sContaBaixa           : String;
                                          liSubContaBaixa       : Integer;
                                          bUsaPlanoPatro        : Boolean;
                                          var liPlnAntecipa     : Double;
                                          rTotal : double     ) : Boolean;
Var
   bRateiaD, bRateiaC, bJuntaD, bJuntaC, bLancaRateioAlterador, bUsaCCustoDoc: Boolean;
   iCodDocumentoD, iCodDocumentoC: integer;
   X : Integer;
   liUnidNegDoc, liUnidNegD, liPlanoPrevD, liPatroD, liUnidNegC, liPlanoPrevC,
   liPatroC, liUnidNegPag, iNumRateioLancamento: LongInt;
   sOperacao, sSubContaAltPag, sHistorico, sHistoricoD, sHistoricoC,
   sDocCodCentroCusto, sDocPlaconta, sHistCompl, sDocCodSubConta,
   sDocCompl, sCliDocCompl, sCodCentroCusto, sPlaconta, sConverte,
   sCCustD, sContaD, sSubContaD, sCCustC, sContaC, sSubContaC,
   sContaAlterador, sCodCentroCustoAlterador, sSql: String;
   rValorD, rValorC, rValorOMD, rValorOMC: Double;
   bMultiplasContasBaixa, bAntecipacao : boolean;
   dtLancamentoDoc : TDateTime;
   sPlacontaDocOriginal : string;
   iIdSegregaCriter: integer;
   dDataSegregaCriter: tDateTime;
   histNumCHQBord,        {Tipos de Históricos = 1}
   histNumSLIP,           {Tipos de Históricos = 1}
   histNumLOTE,           {Tipos de Históricos = 1}
   histFornLOTE,           {Tipos de Históricos = 1}
   histORDEMdePAGO,       {Tipos de Históricos = 1}
   histPORTFORMA,         {Tipos de Históricos = 1}
   histPORTCONTA,         {Tipos de Históricos = 1}
   histNumRECIBOPAGTO,     {Tipos de Históricos = 1}
   histNODOCUMENTO,       {Tipos de Históricos = 1,2,3,4}
   histCOMPLDOCUMENTO,    {Tipos de Históricos = 1,2,3,4}
   histRAZAOSOCIAL,       {Tipos de Históricos = 1,2,3,4}
   histHISTORICOCOMPL,    {Tipos de Históricos = 1,2,3,4}
   histNumAP,             {Tipos de Históricos = 1,2,3,4}
   histNOMEALTERADOR,     {Tipos de Históricos =     3}
   histDATAPROGRAMADA,    {Tipos de Históricos =   2,  4}
   histTIPODOCUMENTO,     {Tipos de Históricos =   2,  4}
   histDATAVENCIMENTO, histDSCLANCAMENTO, {Tipos de Históricos =   2,  4}
   sSqlHst: String;
   bEstorno : boolean;
   _cdsLocal: TClientDataSet;
   oObj : TControl;

   function ReverteAtecip(sCCustC, sContaC, sSubContaC,
                          sCCustD, sContaD, sSubContaD : string;
                          rValor: extended): Double;
     var sHistorico: string;
   begin
     result := -1;

     sHistorico := 'Reversão da antecipação de receita do Doc.  ' + trim(sCliDocCompl) + ' ' + trim(sHistCompl);

     sHistorico  := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                           liIdModulo,5,
                                           sHistorico,
                                           [histNODOCUMENTO,
                                           histCOMPLDOCUMENTO,
                                           histRAZAOSOCIAL,
                                           histDSCLANCAMENTO,
                                           histNumCHQBord,
                                           histNumSLIP,
                                           histHISTORICOCOMPL,
                                           histNumLote]);


      _LancaContab.InsereLancaContab('2',
                                      liIdEmpresa,
                                      liIdModulo,
                                      liIdUsuario,
                                      liPlanoConta,
                                      liUnidNegD,
                                      StrToIntDef(ssubcontaD,0),
                                      StrToIntDef(ssubcontaC,0),
                                      liPlanoPrevD,
                                      liPatroD,
                                      liPlnAntecipa,
                                      0,
                                      DateToStr(dtLancamentoDoc),
                                      sDocCompl,
                                      sHistorico,
                                      '',
                                      '',
                                      '',
                                      '',
                                      '03',
                                      sCCustD,
                                      sContaD,
                                      sCCustC,
                                      sContaC,
                                      '',
                                      rValor,
                                      false,
                                      busaPlanoPatro,
                                      iIdSegregaCriter, dDataSegregaCriter);

     result := _LancaContab.RetornoPlnCodigo;
   end;

   function eEstorno: Boolean;
   var _cdsLanctoDocum : TclientDataset;
   begin
     _cdsLanctoDocum := tClientDataset.Create(nil);
     result := false;
     try
       _cdsLanctoDocum.data := getDataPacket(' SELECT D.STATUS, D.RECPAG, L.CODDOCUMENTO, L.ESTORNO, L.OPERACAO, L.DEBCRE '+
                                             ' FROM DOCUMENTO D, LANCTODOCUM L '+
                                             ' WHERE D.CODDOCUMENTO = '+ IntToStr(liCodDocumento)+ ' AND '+
                                             ' D.STATUS = ''2'' AND L.OPERACAO = ''5'' AND '+
                                             ' L.CODDOCUMENTO = D.CODDOCUMENTO ');
       _cdsLanctoDocum.first;
       result := not _cdsLanctoDocum.IsEmpty;
     finally
       _cdsLanctoDocum.Close;
       FreeAndNil(_cdsLanctoDocum);
     end;
   end;

   {** Verifica se existe relacionamento de Alterador X Conta X CC **}
   Function ExisteTabelaAranhaAlterador: Boolean;
   Begin
      _Cds.Close;
      _Cds.Data := GetDataPacket('SELECT COUNT(IDALTXCCXPRGXCONTA) FROM ALTXCCXPRGXCONTA WHERE CODALTERADOR = ' + IntToStr(liCodAlterador));
      Result := (_Cds.Fields[0].AsInteger > 0);
      If _Cds.Active Then _Cds.Close;
   End;
   {** Faz o rateio do lançamento proporcional ao documento de origem **}
   procedure BuscaRateio;
   Var
     rVerificaTot, rVerificaTotOm, rValTot, rSaldo: Double;
     sNumFatura, sNodocumento: String;
   Begin
      if (liCodAlterador > 0)  then
      begin
         _Cds.Close;
         _Cds.Data := GetDataPacket(' SELECT FLGUSACCUSTODOC FROM TIPOALTERADOR WHERE CODALTERADOR = ' + IntToStr(liCodAlterador));
         bUsaCCustoDoc := (_Cds.FieldByName('FLGUSACCUSTODOC').AsString = 'S');
         _Cds.Close;
      end
      else
         bUsaCCustoDoc := false;

      bLancaRateioAlterador := ((liCodAlterador > 0) And (ExisteTabelaAranhaAlterador Or bUsaCCustoDoc));

      _Cds.Close;
      _Cds.Data := GetDataPacket('SELECT NODOCUMENTO, OPERACAO, PLACONTA FROM DOCUMENTO WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento));
      sOperacao := Trim(_Cds.fieldbyname('OPERACAO').AsString);
      sNodocumento := _cds.fieldByName('NODOCUMENTO').asString;
      bMultiplasContasBaixa := _Cds.fieldbyname('PLACONTA').IsNull;

      If (not bMultiplasContasBaixa)
      and ((sOperacao = '3') Or (sOperacao = '13')) Then
      Begin
         _Cds.Close;
         _Cds.Data := GetDataPacket('SELECT NUMFATURA FROM DOCUMENTO WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento));
         sNumFatura := _Cds.fieldbyname('NUMFATURA').AsString;

          _Cds.Close;
          _Cds.Data := GetDataPacket('SELECT SUM(R.VALOR) AS VALTOT ' +
                      'FROM DOCUMENTO D, RATEIODOCUM R ' +
                      'WHERE (D.NUMFATURA =  ' + sNumFatura + ') AND ' +
                      '      (D.OPERACAO NOT IN (''3'',''13'')) AND (D.CODDOCUMENTO = R.CODDOCUMENTO)');
         rValTot := _Cds.fieldbyname('VALTOT').AsFloat;

         _Cds.Close;
         If bLancaRateioAlterador Then
           _Cds.Data := GetDataPacket('SELECT R.UNIDNEGOC, R.CODCENTROCUSTO, R.IDPROGRAMA, R.IDPLANOPREV, R.IDPATRO, SUM(R.VALOR) AS VALUNID ' +
                        'FROM DOCUMENTO D, RATEIODOCUM R ' +
                        'WHERE (D.NUMFATURA =  ' + sNumFatura + ') AND ' +
                        '      (D.OPERACAO NOT IN (''3'',''13'')) AND (D.CODDOCUMENTO = R.CODDOCUMENTO) ' +
                        'GROUP BY R.UNIDNEGOC, R.CODCENTROCUSTO, R.IDPROGRAMA, R.IDPLANOPREV, R.IDPATRO')
         Else
           _Cds.Data := GetDataPacket('SELECT R.UNIDNEGOC, R.IDPLANOPREV, R.IDPATRO, SUM(R.VALOR) AS VALUNID ' +
                        'FROM DOCUMENTO D, RATEIODOCUM R ' +
                        'WHERE (D.NUMFATURA =  ' + sNumFatura + ') AND ' +
                        '      (D.OPERACAO NOT IN (''3'',''13'')) AND (D.CODDOCUMENTO = R.CODDOCUMENTO) '+
                        'GROUP BY R.UNIDNEGOC, R.IDPLANOPREV, R.IDPATRO');
      End
      Else
      Begin
         if bMultiplasContasBaixa then begin
           _Cds.Close;
           _Cds.Data := GetDataPacket('SELECT SUM(VALOR) AS VALTOT ' +
                        ' FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento));
           rValTot := _Cds.fieldbyname('VALTOT').AsFloat;

           if _Cds.IsEmpty then
           begin
             MessageInfo := 'Não foi possível identificar algum tipo de rateio neste documento: '+ sNodocumento +#13+
                            'Provalvelmente não possui conta(s) contábil(eis) de baixa.';
             Raise Exception.Create(MessageInfo);
           end;

           sSql := '';
           if bLancaRateioAlterador then begin
             sSql := sSql + 'SELECT C.UNIDNEGOC, R.CODCENTROCUSTO, R.IDPROGRAMA, C.IDPLANOPREV, C.IDPATRO, C.PLACONTA, C.IDSEGREGACRITER, SUM(C.VALOR) AS VALUNID ' + #13 +
                            ' FROM CCBAIXASXDOCUM C, RATEIODOCUM R ' + #13 +
                            ' WHERE C.CODDOCUMENTO =  ' + IntToStr(liCodDocumento) + #13 +
                            ' AND C.CODDOCUMENTO = R.CODDOCUMENTO ' + #13 +
                            ' AND C.UNIDNEGOC = R.UNIDNEGOC ' + #13 +
                            ' AND C.IDPLANOPREV = R.IDPLANOPREV ' + #13 +
                            ' AND C.IDPATRO = R.IDPATRO ' + #13;

             // alterador específico para uma conta contábil de baixa, sem rateio
             if (sContaBaixa <> '') and (_OperacaoDocLancImob = odlAlteradorImob) then
               sSql := sSql + ' AND C.PLACONTA = ' + QuotedStr(sContaBaixa) + #13;

             sSql := sSql + ' GROUP BY C.UNIDNEGOC, R.CODCENTROCUSTO, R.IDPROGRAMA, C.IDPLANOPREV, C.IDPATRO, C.PLACONTA, C.IDSEGREGACRITER ';

           end else begin
             sSql := sSql + 'SELECT UNIDNEGOC, IDPLANOPREV, IDPATRO, PLACONTA, IDSEGREGACRITER, SUM(VALOR) AS VALUNID ' + #13 +
                            ' FROM CCBAIXASXDOCUM WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento) + #13;

             // alterador específico para uma conta contábil de baixa, sem rateio
             if (sContaBaixa <> '') and (_OperacaoDocLancImob = odlAlteradorImob) then
               sSql := sSql + ' AND PLACONTA = ' + QuotedStr(sContaBaixa) + #13;

             sSql := sSql + ' GROUP BY UNIDNEGOC, IDPLANOPREV, IDPATRO, PLACONTA, IDSEGREGACRITER';
           end;

           _Cds.Close;
           _Cds.Data := GetDataPacket (sSql);

         end else begin
           _Cds.Close;
           _Cds.Data := GetDataPacket('SELECT SUM(VALOR) AS VALTOT ' +
                        ' FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento));
           rValTot := _Cds.fieldbyname('VALTOT').AsFloat;

           _Cds.Close;
           If bLancaRateioAlterador Then
             _Cds.Data := GetDataPacket('SELECT UNIDNEGOC, CODCENTROCUSTO, IDPROGRAMA, IDPLANOPREV, IDPATRO, SUM(VALOR) AS VALUNID ' +
                                        ' FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento) +
                                        ' GROUP BY UNIDNEGOC, CODCENTROCUSTO, IDPROGRAMA, IDPLANOPREV, IDPATRO ')
           Else
             _Cds.Data := GetDataPacket('SELECT UNIDNEGOC, IDPLANOPREV, IDPATRO, SUM(VALOR) AS VALUNID ' +
                                        ' FROM RATEIODOCUM WHERE CODDOCUMENTO =  ' + IntToStr(liCodDocumento) +
                                        ' GROUP BY UNIDNEGOC, IDPLANOPREV, IDPATRO');
         end;
      End;

      iNumRateioLancamento := 0;
      rVerificaTot   := 0;
      rVerificaTotOm := 0;

      _Cds.First;
      while not _Cds.eof do
      begin
        iNumRateioLancamento := _LstRateioLancamento.Add(TRateioImobLancamento.Create);

         if bMultiplasContasBaixa then begin
           TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).PlaConta := _Cds.FieldByName('PLACONTA').AsString;

          if _Cds.FieldByName('IDSEGREGACRITER').IsNull then
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdSegregaCriter := -1
          else
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdSegregaCriter := _Cds.FieldByName('IDSEGREGACRITER').AsInteger;
         end;


        If rValTot = 0 Then
        Begin
          TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).UnidNegocio := _Cds.FieldByName('UNIDNEGOC').AsInteger;
          TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).Valor  := 0;
          TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).ValorOm:= 0;

          If bLancaRateioAlterador Then
          Begin
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).CentroCusto := _Cds.FieldByName('CODCENTROCUSTO').AsString;
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPrograma := _Cds.FieldByName('IDPROGRAMA').AsInteger;
          End
          Else
          Begin
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).CentroCusto := '';
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPrograma := 0;
          End;

          rVerificaTot  := rVerificaTot   + TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).Valor;
          rVerificaTotOm:= rVerificaTotOm + TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).ValorOm;
        End
        Else
        Begin
          TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).UnidNegocio := _Cds.FieldByName('UNIDNEGOC').AsInteger;
          TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).Valor  := StrToFloat( FormatFloat( '#0.00', ( ( rValor   * _Cds.FieldByName('VALUNID').AsFloat ) / rValTot ) ) );
          TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).ValorOm:= StrToFloat( FormatFloat( '#0.00', ( ( rValorOM * _Cds.FieldByName('VALUNID').AsFloat ) / rValTot ) ) );

          If bLancaRateioAlterador Then
          Begin
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).CentroCusto := _Cds.FieldByName('CODCENTROCUSTO').AsString;
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPrograma := _Cds.FieldByName('IDPROGRAMA').AsInteger;
          End
          Else
          Begin
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).CentroCusto := '';
            TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPrograma := 0;
          End;

          rVerificaTot  := rVerificaTot   + TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).Valor;
          rVerificaTotOm:= rVerificaTotOm + TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).ValorOm;
        End;

        If _Cds.FieldByName('IDPLANOPREV').AsInteger = 0 Then
           TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPlanoPrev := - 1
        Else
           TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPlanoPrev := _Cds.FieldByName('IDPLANOPREV').AsInteger;


        If _Cds.FieldByName('IDPATRO').AsInteger = 0 Then
           TRateioIMobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPatrocinadora := -1
        Else
           TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).IdPatrocinadora := _Cds.FieldByName('IDPATRO').AsInteger;

        _Cds.Next;
      end;

      rSaldo := rValor - rVerificaTot;
      TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).Valor    := TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).Valor + rSaldo;
      rSaldo := rValorOM - rVerificaTotOm;
      TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).ValorOm  := TRateioImobLancamento(_LstRateioLancamento.Items[iNumRateioLancamento]).ValorOm + rSaldo;

      _Cds.Close;
   End;

begin
   try
      bAntecipacao := false;
      sPlacontaDocOriginal := '';
      bEstorno := eEstorno;
      Result := True;
      histNumCHQBord     := '';
      histNumSLIP        := '';
      histORDEMdePAGO    := '';
      histPORTFORMA      := '';
      histPORTCONTA      := '';
      histNumRECIBOPAGTO := '';
      histNODOCUMENTO    := '';
      histCOMPLDOCUMENTO := '';
      histRAZAOSOCIAL    := '';
      histHISTORICOCOMPL := '';
      histNumAP          := '';
      histNOMEALTERADOR  := '';
      histDATAPROGRAMADA := '';
      histTIPODOCUMENTO  := '';
      histDATAVENCIMENTO := '';
      histDSCLANCAMENTO  := '';
      histNumLote        := '';
      histFornLOTE       := '';
      bJuntaD    := True;
      bJuntaC    := True;
      iCodDocumentoD := -1;
      iCodDocumentoC := -1;

      {** Faz o rateio do lançamento proporcional ao documento de origem **}
      bLancaRateioAlterador := False;
      BuscaRateio;

      liUnidNegPag    := 0;
      sSubContaAltPag := '';
      sHistorico      := '';
      sHistoricoD     := '';
      sHistoricoC     := '';

      _Cds.Close;
      {** Busca Parâmetros Contábeis do Documento **}
      _Cds.Data := GetDataPacket(' SELECT D.NODOCUMENTO,    ' +
                                        ' D.COMPLDOCUMENTO, ' +
                                        ' D.CODSUBCONTA,    ' +
                                        ' D.CODDOCUMENTO,   ' +
                                        ' D.DATAVENCTO,     ' +
                                        ' D.PLACONTA,       ' +
                                        ' D.CODCENTROCUSTO, ' +
                                        ' P.RAZAOSOCIAL,    ' +
                                        ' L.HISTORICOCOMPL, ' +
                                        ' D.UNIDNEGOC,      ' +
                                        ' D.NUMSLIP,        ' +
                                        ' D.IDSEGREGACRITER, L.DATALANCTO, D.PLACONTAANT ' +
                                  ' FROM  DOCUMENTO D,  ' +
                                        ' PESSOA P,     ' +
                                        ' LANCTODOCUM L ' +
                                 ' WHERE (D.CODDOCUMENTO = ' + IntToStr(liCodDocumento) + ' ) ' +
                                 '   AND (D.IDFORCLI = P.IDPESSOA)         ' +
                                 '   AND (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
                                 '   AND (D.OPERACAO = L.OPERACAO)' );

      sPlacontaDocOriginal := _Cds.fieldByName('PLACONTA').asString;

      If _Cds.IsEmpty Then
      Begin
         Result := False;
         MessageInfo := 'Erro ao selecionar parâmetros contábeis para do Documento de origem do lançamento.';
         Exit;
      End;

      iIdSegregaCriter := -1;
      if not _Cds.FieldByName('IDSEGREGACRITER').IsNull then
        iIdSegregaCriter := _Cds.FieldByName('IDSEGREGACRITER').AsInteger;
      dDataSegregaCriter :=  _Cds.FieldByName('DATALANCTO').AsDateTime;

      histNODOCUMENTO    := _Cds.FieldByName('NODOCUMENTO').AsString;
      histCOMPLDOCUMENTO := _Cds.FieldByName('COMPLDOCUMENTO').AsString;
      histRAZAOSOCIAL    := _Cds.FieldByName('RAZAOSOCIAL').AsString;
      histNumCHQBord     := sNumChqBord;
      histNumSLIP        := _Cds.FieldByName('NUMSLIP').AsString;
      histDATAVENCIMENTO := _Cds.FieldByName('DATAVENCTO').AsString;
      histHISTORICOCOMPL := _Cds.FieldByName('HISTORICOCOMPL').AsString + ' ' + sCtrlDocObs;

      histORDEMdePAGO    := '';
      histPORTFORMA      := '';
      histPORTCONTA      := '';
      histNumRECIBOPAGTO := '';
      histNumAP          := '';
      histNOMEALTERADOR  := '';
      histDATAPROGRAMADA := '';
      histTIPODOCUMENTO  := '';
      histNumLote        := '';
      histFornLOTE       := '';

      sSqlHst := '';
      _cdsLocal := TClientDataSet.Create(nil);
      Try
        if iOperacao <> 4 then
        begin
          sSqlHst :=    ' SELECT LD.CODALTERADOR, LOTEPAGTO.NUMLOTE AS HISTNUMLOTE,        '+
                        '   LOTEPAGTO.FAVORECIDO AS FAVORECIDOLOTE,       '+ //andré tavares - pendência 25018 - 12/04/2007
                        '   PF.DESCRICAO AS HISTPORTFORMA,                '+
                        '   PC.DESCRICAO AS HISTPORTCONTA,                '+
                        '   LD.NUMRECIBO AS HISTNUMRECIBOPAGTO,           '+
                        '   DOC.NUMAPGR AS HISTNUMAP,                     '+
                        '   TA.DESCRICAO AS HISTNOMEALTERADOR,            '+
                        '   DOC.DATAPROGRAMADA AS HISTDATAPROGRAMADA,     '+
                        '   TD.DESCRICAO AS HISTTIPODOCUMENTO             '+
                        ' FROM LOTEPAGTO,                                 '+
                        '      LOTEXDOCUM LOTEX,                          '+
                        '      DOCUMENTO DOC,                             '+
                        '      PORTADORFORMA PF,                          '+
                        '      PORTADORCONTA PC,                          '+
                        '      LANCTODOCUM LD,                            '+
                        '      TIPODOCRECPAG TD,                          '+
                        '      TIPOALTERADOR TA                           '+
                        ' WHERE PF.CODPORTADOR   = PC.CODPORTADOR(+)      '+
                        ' AND DOC.CODPORTFORMA = PF.CODPORTFORMA(+)       '+
                        ' AND LOTEX.NUMLOTE    = LOTEPAGTO.NUMLOTE(+)     '+
                        ' AND DOC.CODDOCUMENTO = LOTEX.CODDOCUMENTO(+)    '+
                        ' AND LD.CODDOCUMENTO  = DOC.CODDOCUMENTO         '+
                        ' AND TD.CODTIPDOC     = DOC.CODTIPDOC            '+
                        ' AND LD.CODALTERADOR  = TA.CODALTERADOR(+)       '+
                        ' AND DOC.CODDOCUMENTO = '+ _Cds.FieldByName('CODDOCUMENTO').AsString +
                        ' AND LD.OPERACAO = DOC.OPERACAO ';
        end
        else
        begin
          sSqlHst :=  ' SELECT PF.DESCRICAO AS HISTPORTFORMA,            '+
                      '        PC.DESCRICAO AS HISTPORTCONTA,            '+
                      '        DOC.NUMAPGR AS HISTNUMAP,                 '+
                      '        TA.DESCRICAO AS HISTNOMEALTERADOR,        '+
                      '        DOC.DATAPROGRAMADA AS HISTDATAPROGRAMADA, '+
                      '        TD.DESCRICAO AS HISTTIPODOCUMENTO         '+
                      ' FROM DOCUMENTO DOC,                              '+
                      '      PORTADORFORMA PF,                           '+
                      '      PORTADORCONTA PC,                           '+
                      '      TIPODOCRECPAG TD,                           '+
                      '      TIPOALTERADOR TA                            '+
                      ' WHERE PF.CODPORTADOR   = PC.CODPORTADOR(+)       '+
                      '       AND DOC.CODPORTFORMA = PF.CODPORTFORMA(+)  '+
                      '       AND TD.CODTIPDOC     = DOC.CODTIPDOC       '+
                      '       AND TA.CODALTERADOR = '+ IntToStr(liCodAlterador) +
                      '       AND DOC.CODDOCUMENTO = '+ _Cds.FieldByName('CODDOCUMENTO').AsString;
        end;

        if not iOperacao in [4, 5] then // lancamento de baixa
          sSqlHst := sSqlHst + ' AND LD.OPERACAO = '+ intToStr(iOperacao);

        if not iOperacao in [1, 2, 3] then // se não for lancamento de de documento ou de alterador
          sSqlHst := sSqlHst + ' AND LD.CODALTERADOR  = '+ IntToStr(liCodAlterador);

        _cdsLocal.Data := GetDataPacket(sSqlHst);
        if not _cdsLocal.isEmpty then
        begin
          if iOperacao <> 4 then
          begin
            histNumRECIBOPAGTO := _cdsLocal.fieldByName('histNumRECIBOPAGTO').asString;
            histNumLOTE        := _cdsLocal.fieldByName('histNumLOTE').asString;
          end;
          histNumAP            := _cdsLocal.fieldByName('histNumAP').asString;
          histPORTFORMA        := _cdsLocal.fieldByName('histPORTFORMA').asString;
          histPORTCONTA        := _cdsLocal.fieldByName('histPORTCONTA').asString;
          histNOMEALTERADOR    := _cdsLocal.fieldByName('histNOMEALTERADOR').asString;
          histDATAPROGRAMADA   := _cdsLocal.fieldByName('histDATAPROGRAMADA').asString;
          histTIPODOCUMENTO    := _cdsLocal.fieldByName('histTIPODOCUMENTO').asString;
          if _cdsLocal.findField('FAVORECIDOLOTE') <> nil then
            histFornLOTE       := _cdsLocal.fieldByName('FAVORECIDOLOTE').asString;

        end;
      finally
         _cdsLocal.Close;
         FreeAndNil(_cdsLocal);
      end;
      _cdsLocal := TClientDataSet.Create(nil);
      Try
        _cdsLocal.Data := GetDataPacket('SELECT LP.NUMSLIP, LP.FAVORECIDO from LOTEPAGTO LP, LOTEXDOCUM LD ' + #13+
                               '  WHERE LD.CODDOCUMENTO = '+ _Cds.FieldByName('CODDOCUMENTO').AsString+
                               '  AND LP.NUMLOTE = '+  IntToStr(FLote.NumLote) +
                               ' AND LP.NUMLOTE = LD.NUMLOTE');
        _cdsLocal.First;
        if not _cdsLocal.Eof then
        begin
          histOrdemdePago := _cdsLocal.FieldByName('NUMSLIP').AsString;
        end;
      finally
        _cdsLocal.close;
        FreeAndNil(_cdsLocal);
      end;

      sDocCodCentroCusto := _Cds.FieldByName('CODCENTROCUSTO').AsString;
      sDocPlaconta:= _Cds.FieldByName('PLACONTA').AsString;

      // se Operação 5 (BAIXA DE DOCUMENTO) - Aqui se muda a placonta de recebimento antecipado.
      if (iOperacao = 5) AND
      (_Documento.Recpag.AsString = 'R') { Baixa Antecipada de documento com placontaAnt
                                          (placonta de antecipação) só é válida para o CAR.
                                          *** Esta trava deve ser retirada se desejar fazê-lo para o CAP ***}
      then
      begin
          _cdsLocal := TClientDataSet.Create(nil);
          try
            //pega a data de lançamento do documento
            _cdsLocal.data := getDataPacket(' SELECT L.DATALANCTO FROM LANCTODOCUM L, DOCUMENTO D WHERE L.CODDOCUMENTO = '+
                                   _Cds.FieldByName('CODDOCUMENTO').AsString + ' AND L.CODDOCUMENTO = D.CODDOCUMENTO AND L.OPERACAO = D.OPERACAO ' );

               //se o campo placontaAnt (placonta de recebimento antecipado estiver preechido e...
            if (trim(_Cds.fieldByName('PLACONTAANT').asString) <> '') and //placontaant
               //mes da baixa < mes de lançamento do documento
               (trunc(strToDate(formatDateTime('01/mm/yyyy', dDataLancto))) <
                 trunc(strToDate(formatDateTime('01/mm/yyyy', _cdsLocal.fieldByName('DATALANCTO').asDateTime))) )  then
            begin
              //esta será a placonta de contabilização (o campo PLACONTAANT da tabela DOCUMENTO).
              sDocPlaconta    := _Cds.FieldByName('PLACONTAANT').AsString;
              bAntecipacao    := true;
              dtLancamentoDoc := _cdsLocal.fieldByName('DATALANCTO').asDateTime;
            end
            else //senão a placonta de contabilização continua a mesma (o campo PLACONTA da tabela DOCUMENTO)
            begin
              sDocPlaconta := _Cds.FieldByName('PLACONTA').AsString;
              bAntecipacao := false;
            end;//else

          finally
            _cdsLocal.close;
            FreeAndNil(_cdsLocal);
          end;//try
         //end;//with
       end;//if

      sHistCompl := Trim(sHistoricoCompl) + Trim(_Cds.FieldByName('HISTORICOCOMPL').AsString);
      liUnidNegDoc := _Cds.FieldByName('UNIDNEGOC').AsInteger;

      if _Cds.FieldByName('CODSUBCONTA').IsNull Then
         sDocCodSubConta := ''
      Else
         sDocCodSubConta := _Cds.FieldByName('CODSUBCONTA').AsString;

      sDocCompl := _Cds.FieldByName('NODOCUMENTO').AsString + ' ' + _Cds.FieldByName('COMPLDOCUMENTO').AsString;
      sCliDocCompl := sDocCompl + ' ' + _Cds.FieldByName('RAZAOSOCIAL').AsString;


      {** Contabiliza Alteradores e regularização de adiantamento **}
      if (iOperacao = 4) or (iOperacao = 16) or (iOperacao = 17) Then
      Begin
         {** Busca Parâmetros Contábeis do Alterador **}
         _Cds.Close;
         _Cds.Data := GetDataPacket(' SELECT CODCENTROCUSTO, PLACONTA, DESCRICAO, CONVERTE, CODSUBCONTA, FLGCONTABNABAIXA, FLGUSACCUSTODOC ' +
                                    ' FROM TIPOALTERADOR WHERE CODALTERADOR = ' + IntToStr(liCodAlterador));

         if ( _Cds.FieldByName('FLGCONTABNABAIXA').AsString = 'S' ) And
            ( fOPeracaoLancto <> olsoContabiliza ) then
         begin
            liPlnCodigo := 0;
            Result := True;
            Exit;
         end
         else
            fOPeracaoLancto := olLancToDoc;

         sCodCentroCusto := _Cds.FieldByName('CODCENTROCUSTO').AsString;
         sPlaconta := _Cds.FieldByName('PLACONTA').AsString;
         sConverte := _Cds.FieldByName('CONVERTE').AsString;
         sHistorico := _Cds.FieldByName('DESCRICAO').AsString;

         If (iOperacao = 4) Then
         Begin
           sHistoricoD     := sHistorico + ' Doc. ' + trim(sCliDocCompl) + ' ' + trim(sHistCompl);
           sHistoricoC     := sHistoricoD;
         End
         Else
         Begin
            sHistoricoD     := 'Regularização de adiantamento doc. ' + sCliDocCompl;
            sHistoricoC     := sHistoricoD;
         End;

         {** Testa a obrigatoriedade da subconta para a conta do alterador caso
            a mesma não esteja preenchida no cadastro do alterador **}
         If (_Cds.FieldByName('CODSUBCONTA').IsNull) And (iOperacao = 4) Then
         Begin
            With _DtmCapCarObj Do
            Begin
               SQLTestaSubConta.Prepare;
               SQLTestaSubConta.ParambyName('PLANO').AsFloat := liPlanoConta;
               SQLTestaSubConta.ParambyName('PLACONTA').AsString := Espaco(sPlaconta,18);
               SQLTestaSubConta.Open;

               If CdsTestaSubConta.FieldByName('PLASUBCONTA').AsString = 'S' Then
               Begin
                  SQLSubContaDoc.Prepare;
                  SQLSubContaDoc.ParambyName('CODDOCUMENTO').AsFloat := liCodDocumento;
                  SQLSubContaDoc.Open;

                  If Not CdsSubContaDoc.IsEmpty Then
                     sSubContaAltPag := CdsSubContaDoc.FieldByName('CODSUBCONTA').AsString
                  Else
                     sSubContaAltPag := '';
               End
               eLSE
                  sSubContaAltPag := '';

               If CdsTestaSubConta.Active Then CdsTestaSubConta.Close;
               If CdsSubContaDoc.Active Then CdsSubContaDoc.Close;
            End;
         End
         Else
           sSubContaAltPag := _Cds.FieldByName('CODSUBCONTA').AsString;

         liUnidNegPag    := 0;
        _cds.close;

      End;

      {** Contabilização da Baixa de Documento e Adiantamento **}
      if (iOperacao = 5) Or (iOperacao = 15) Then
      Begin
         _Cds.Close;
         {** Busca parâmetros contábeis para baixa **}
         _Cds.Data := GetDataPacket(' SELECT F.DESCRICAO, P.PLACONTA, P.CODCENTROCUSTO, P.CODSUBCONTA, P.UNIDNEGOC, P.DESCFINAN FROM ' +
                                    ' PORTADORFORMA P, FORMARECPAG F WHERE ' +
                                    ' (P.CODFORMA = F.CODFORMA) AND (P.CODPORTFORMA = ' + IntToStr(iCodPortForma) + ')');

         sCodCentroCusto := _Cds.FieldByName('CODCENTROCUSTO').AsString;

         // normalmente será a conta banco ou a conta de não identificado
         // para regularização.
         If sContaBaixa <> '' Then
            sPlaconta := sContaBaixa
         Else
            sPlaconta := _Cds.FieldByName('PLACONTA').AsString;

         sConverte       := 'N';

         If liSubContaBaixa <> 0 Then
            sSubContaAltPag := IntToStr(liSubContaBaixa)
         Else
            sSubContaAltPag := _Cds.FieldByName('CODSUBCONTA').AsString;

         liUnidNegPag    := _Cds.FieldByName('UNIDNEGOC').AsInteger;

         FLote.GetNumLote(liCodDocumento);
         If _Cds.FieldByName('DESCFINAN').IsNull Then
         Begin
            If FEstornaDocumento Then
            begin
               if FLote.NumLote > 0 then //andre tavares - pendência 22528 - 21/08/2006
                 sHistorico      := 'Estorno ' + _Cds.FieldByName('DESCRICAO').AsString+ ' Nº ' + intToStr(FLote.NumLote)
               else
                 sHistorico      := 'Estorno ' + _Cds.FieldByName('DESCRICAO').AsString+ ' Nº ' + sNumChqBord;
            end
            Else
            begin
               if FLote.NumLote > 0 then //andre tavares - pendência 22528 - 21/08/2006
                 sHistorico      := _Cds.FieldByName('DESCRICAO').AsString+ ' Nº ' + intToStr(FLote.NumLote)
               else
                 sHistorico      := _Cds.FieldByName('DESCRICAO').AsString+ ' Nº ' + sNumChqBord;
            end;
         End
         Else
         Begin
            If FEstornaDocumento Then
            begin
               if FLote.NumLote > 0 then //andre tavares - pendência 22528 - 21/08/2006
                 sHistorico      := _Cds.FieldByName('DESCFINAN').AsString+ ' Nº ' + intToStr(FLote.NumLote)
               else
                 sHistorico      := 'Estorno ' + _Cds.FieldByName('DESCFINAN').AsString + ' Nº ' + sNumChqBord
            end
            Else
            begin
              if FLote.NumLote > 0 then
                sHistorico      := _Cds.FieldByName('DESCFINAN').AsString+ ' Nº ' + intToStr(FLote.NumLote)
              else
                 sHistorico      := _Cds.FieldByName('DESCFINAN').AsString + ' Nº ' + sNumChqBord;
            end;
         End;

         sDocCompl       := sNumChqBord;

         //Monta Histórico de Acordo Com o DebCre e seta se os lançamentos serão na
         //Feitos na Mesma planilha ou não
         If sDebCre = 'C' Then
         begin
             sHistoricoD := sHistorico;
             sHistoricoC :=sHistorico + ' Ref. Recebimento Doc. ' + trim(sCliDocCompl) + ' ' + trim(sHistCompl);
             iCodDocumentoD := -1;              // pode juntar todos os documentos - banco
             iCodDocumentoC := liCodDocumento  // não pode juntar documentos distintos - passagem
         End
         Else
         begin
             sHistoricoC := sHistorico;
             sHistoricoD := sHistorico + ' Ref. Pagamento Doc. ' + trim(sCliDocCompl) + ' ' + trim(sHistCompl);
             iCodDocumentoC := -1;              // pode juntar todos os documentos - banco
             iCodDocumentoD := liCodDocumento  // não pode juntar documentos distintos - passagem
         end;
        _cds.close;
      End;

      If sDebCre = 'C' Then
      Begin
        sCCustD    := sCodCentroCusto;
        sContaD    := sPlaconta;
        sSubContaD := sSubContaAltPag;
        sCCustC    := sDocCodCentroCusto;
        sContaC    := sDocPlaconta;        // Deverá ser trocada abaixo em múltiplas contas de baixa
        sSubContaC := sDocCodSubConta;
      End
      Else
      Begin
        sCCustC    := sCodCentroCusto;
        sContaC    := sPlaconta;
        sSubContaC := sSubContaAltPag;
        sCCustD    := sDocCodCentroCusto;
        sContaD    := sDocPlaconta;        // Deverá ser trocada abaixo em múltiplas contas de baixa
        sSubContaD := sDocCodSubConta;
      End;

      rValorD   := 0;
      rValorC   := 0;
      rValorOMD := 0;
      rValorOMC := 0;

      For X := 0 To (_LstRateioLancamento.Count - 1)  Do
      Begin

         //Ricardo Freitas SOL: 162650 KINTANA: 1383795
         rValorD   := 0;
         rValorC   := 0;
         rValorOMD := 0;
         rValorOMC := 0;
         //Ricardo Freitas SOL: 162650 KINTANA: 1383795 - Fim

         {** Rateio para contabilização da Baixa **}
         if (iOperacao = 5) Or (iOperacao = 15) Then
         Begin
            If sDebCre = 'C' Then
            Begin

              if (liUnidNegPag <> 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev <= 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora <= 0) then
              begin
                 liUnidNegD := liUnidNegPag;
                 rValorD    := rValorD   + TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMD  := rValorOMD + TRateioIMobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevD := -1;
                 liPatroD := -1;
                 bRateiaD   := False;
              end
              else
              begin
                 if liUnidNegPag <> 0 Then
                    liUnidNegD := liUnidNegPag
                 Else
                    liUnidNegD := TRateioImobLancamento(_LstRateioLancamento[X]).UnidNegocio;

                 rValorD    := TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMD  := TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                 liPatroD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 bRateiaD   := True;
              end;

              if (liUnidNegDoc <> 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev <= 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora <= 0) Then
              begin
                 liUnidNegC := liUnidNegDoc;
                 rValorC    := rValorC   + TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMC  := rValorOMC + TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevC := -1;
                 liPatroC := -1;
                 bRateiaC   := False;
              end
              else
              begin
                 if liUnidNegDoc <> 0 Then
                    liUnidNegC := liUnidNegDoc
                 Else
                    liUnidNegC := TRateioImobLancamento(_LstRateioLancamento[X]).UnidNegocio;

                 rValorC    := TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMC  := TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                 liPatroC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 bRateiaC   := True;
              end;
            End
            Else
            Begin

              if (liUnidNegPag <> 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev <= 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora <= 0) then
              begin
                 liUnidNegC := liUnidNegPag;
                 rValorC := rValorC   + TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMC := rValorOMC + TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevC := -1;
                 liPatroC := -1;
                 bRateiaC := False;
              end
              else
              begin
                 if (liUnidNegPag <> 0) Then
                    liUnidNegC := liUnidNegPag
                 Else
                    liUnidNegC := TRateioImobLancamento(_LstRateioLancamento[X]).UnidNegocio;

                 rValorC := TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMC := TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                 liPatroC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 bRateiaC := True;
              end;

              if (liUnidNegDoc <> 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev <= 0) And
                 (TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora <= 0)  Then
              begin
                 liUnidNegD := liUnidNegDoc;
                 rValorD := rValorD   + TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMD := rValorOMD + TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevD := -1;
                 liPatroD := -1;
                 bRateiaD := False;
              end
              else
              begin
                 if (liUnidNegDoc <> 0) Then
                    liUnidNegD := liUnidNegDoc
                 Else
                    liUnidNegD := TRateioImobLancamento(_LstRateioLancamento[X]).UnidNegocio;

                 rValorD := TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMD := TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                 liPatroD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 bRateiaD   := True;
              end;
            End;
         End
         Else
         Begin

              {** Rateio da contabilização de Alterador e Regularização de Adiantamento **}
              if ((liUnidNegDoc <> 0) Or (liUnidNegocioLancto > 0)) and (not bLancaRateioAlterador) and (not bMultiplasContasBaixa) Then
              Begin
                 If liUnidNegocioLancto > 0 Then
                    liUnidNegD := liUnidNegocioLancto
                 Else
                    liUnidNegD := liUnidNegDoc;

                 If liUnidNegocioLancto > 0 Then
                    liUnidNegC := liUnidNegocioLancto
                 Else
                    liUnidNegC := liUnidNegDoc;

                 //Ricardo Freitas SOL: 162650 KITANA: 1383795
                 rValorD    := rValorD   + TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMD  := rValorOMD + TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 rValorC    := rValorC   + TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMC  := rValorOMC + TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;

                 (*
                   Correção no erro de constraint e no rateio por plano e patrocinadora
                   no lançamento de alteradores com indicação de atividade e projeto
                   diferente da atividade e projeto padrão
                 *)
                 if bUsaPlanoPatro then
                 begin
                   liPlanoPrevD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                   liPatroD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                   liPlanoPrevC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                   liPatroC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 end
                 else
                 begin
                   liPlanoPrevC := -1;
                   liPatroC := -1;
                   liPlanoPrevD := -1;
                   liPatroD := -1;
                 end;

                 bRateiaD   := False;
                 bRateiaC   := False;
              End
              else
              Begin
                 liUnidNegD := TRateioImobLancamento(_LstRateioLancamento[X]).UnidNegocio;
                 liUnidNegC := TRateioImobLancamento(_LstRateioLancamento[X]).UnidNegocio;
                 rValorD    := TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMD  := TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 rValorC    := TRateioImobLancamento(_LstRateioLancamento[X]).Valor;
                 rValorOMC  := TRateioImobLancamento(_LstRateioLancamento[X]).ValorOM;
                 liPlanoPrevD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                 liPatroD := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 liPlanoPrevC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPlanoPrev;
                 liPatroC := TRateioImobLancamento(_LstRateioLancamento[X]).IdPatrocinadora;
                 bRateiaD   := True;
                 bRateiaC   := True;
              End;
         End;

         {** Rateio da contabilização de Lançamento Rateio de Alteradores**}
         If bLancaRateioAlterador And (iOperacao = 4) Then
         Begin
            _DtmCapCarObj.SQLBuscaContaAlt.Prepare;
            _DtmCapCarObj.SQLBuscaContaAlt.ParamByName('CODALTERADOR').AsInteger := liCodAlterador;
            _DtmCapCarObj.SQLBuscaContaAlt.ParamByName('CODCENTROCUSTO').AsString := TRateioImobLancamento(_LstRateioLancamento[X]).CentroCusto;
            _DtmCapCarObj.SQLBuscaContaAlt.ParamByName('IDEMPRESA').AsInteger := liIdEmpresa;
            _DtmCapCarObj.SQLBuscaContaAlt.ParamByName('IDPROGRAMA').AsInteger := TRateioImobLancamento(_LstRateioLancamento[X]).IdPrograma;
            _DtmCapCarObj.SQLBuscaContaAlt.Open;

            If Not _DtmCapCarObj.CdsBuscaContaAlt.IsEmpty Then
            Begin
               sContaAlterador := _DtmCapCarObj.CdsBuscaContaAlt.Fields[0].AsString;

               If Trim(TRateioImobLancamento(_LstRateioLancamento[X]).CentroCusto) = '' Then
                  sCodCentroCustoAlterador := sCodCentroCusto
               Else
                  sCodCentroCustoAlterador := TRateioImobLancamento(_LstRateioLancamento[X]).CentroCusto;
            End
            Else
            Begin
               (*
                 Atribuição do centro de custo do rateio do documento caso o alterador
                 esteja com o FLAG de usa o centro de custo do rateio do documento
               *)
               If ( Trim(TRateioImobLancamento(_LstRateioLancamento[X]).CentroCusto) = '' ) And
                  ( Not bUsaCCustoDoc )  Then
                  sCodCentroCustoAlterador := sCodCentroCusto
               Else
                  sCodCentroCustoAlterador := TRateioImobLancamento(_LstRateioLancamento[X]).CentroCusto;

               sContaAlterador := sPlaconta;
            End;

            _DtmCapCarObj.CdsBuscaContaAlt.Close;

            If sDebCre = 'C' Then
            Begin
              {** Dados do Alterador, Busca na tabela aranha, caso não tenha contabiliza normalmente **}
              sCCustD    := sCodCentroCustoAlterador;
              sContaD    := sContaAlterador;
              sSubContaD := sSubContaAltPag;
              sCCustC    := sDocCodCentroCusto;
              sContaC    := sDocPlaconta;
              sSubContaC := sDocCodSubConta;
            End
            Else
            Begin
              {** Dados do Alterador, Busca na tabela aranha, caso não tenha contabiliza normalmente **}
              sCCustC    := sCodCentroCustoAlterador;
              sContaC    := sContaAlterador;
              sSubContaC := sSubContaAltPag;
              sCCustD    := sDocCodCentroCusto;
              sContaD    := sDocPlaconta;
              sSubContaD := sDocCodSubConta;
            End;
            _DtmCapCarObj.CdsBuscaContaAlt.Close;
         End;

         // Trocar a conta contabil do documento
         if bMultiplasContasBaixa then begin

           if TRateioImobLancamento(_LstRateioLancamento[X]).IdSegregaCriter <> 0 then
             iIdsegregaCriter := TRateioImobLancamento(_LstRateioLancamento[X]).IdSegregaCriter;

           if sDebCre = 'C' Then begin
             sContaC := TRateioImobLancamento(_LstRateioLancamento[X]).PlaConta;
           end else begin
             sContaD := TRateioImobLancamento(_LstRateioLancamento[X]).PlaConta;
           end;
         end;

         {**
            Efetua lançamento contábil a débito para lançamento de alteradores,
            lançamento de baixa de adiantamento e baixa de documentos
         **}

         if ( FPartidaDobrada ) then
         begin
            if ((iOperacao = 4) or (iOperacao = 5) or (iOperacao = 15)) then
            begin
               _LancaContab.lcValHisDeb := rValoromD;

               if iOperacao = 4 then
               begin  // lancamento de alterador
                  histDSCLANCAMENTO := 'Lançamento de Aterador';
                  sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,2,
                                            sHistoricoD,
                                            [histNOMEALTERADOR,
                                            histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histHISTORICOCOMPL,
                                            histNumAP])
               end
               else if iOperacao = 5 then
               begin
                  if not bEstorno then
                  begin
                    histDSCLANCAMENTO := 'Baixa de Documento';
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                              liIdModulo,0,
                                              sHistoricoD,
                                              [histNODOCUMENTO,
                                              histCOMPLDOCUMENTO,
                                              histRAZAOSOCIAL,
                                              histDSCLANCAMENTO,
                                              histNumCHQBord,
                                              histNumSLIP,
                                              histHISTORICOCOMPL,
                                              histNumAP,
                                              histNumLote
                                              ]);
                  end
                  else begin
                    histDSCLANCAMENTO := 'Estorno de Baixa';
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,3,
                                            sHistoricoD,
                                            [histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histDATAVENCIMENTO,
                                            histDATAPROGRAMADA,
                                            histHISTORICOCOMPL,
                                            histTIPODOCUMENTO,
                                            histNUMAP,
                                            histNumLote
                                            ]);
                  end;
               end
               else if iOperacao in [1, 2] then // lancamento ou estrono de documento
               begin
                 histDSCLANCAMENTO := 'Lançamento de Documento';

                 sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,1,
                                            sHistoricoD,
                                            [histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histDATAVENCIMENTO,
                                            histDATAPROGRAMADA,
                                            histTIPODOCUMENTO,
                                            histNumAP])
               end;
            end;

               if _LancaContab.InsereLancaContab('2',
                                                 liIdEmpresa,
                                                 liIdModulo,
                                                 liIdUsuario,
                                                 liPlanoConta,
                                                 liUnidNegD,
                                                 StrToIntDef(ssubcontaD,0),
                                                 StrToIntDef(ssubcontaC,0),
                                                 liPlanoPrevD,
                                                 liPatroD,
                                                 liPlnCodigo,
                                                 0,
                                                 DateToStr(dDataLancto),
                                                 sDocCompl,
                                                 sHistoricoD,
                                                 '',
                                                 '',
                                                 '',
                                                 '',
                                                 '03',
                                                 sCCustD,
                                                 sContaD,
                                                 sCCustC,
                                                 sContaC,
                                                 '',
                                                 rValorD,
                                                 false,
                                                 busaPlanoPatro,
                                                 iIdSegregaCriter, dDataSegregaCriter,
                                                 //Cássio - SOL Nº 130360 KTN Nº 734640 - Início
                                                 -1, -1, true,
                                                 // Alex quando se usa partida dobrada, não importa, pode-se passar sempre o coddocumento
                                                 liCodDocumento, //Luiz Carlos - SOL201128_18374 - Inicio
                                                 True,
                                                 rTotal, //Luiz Carlos - SOL201128_18374 - Fim
                                                 -1) Then
                                                 //Cássio - SOL Nº 130360 KTN Nº 734640 - Fim
               Begin

                  liPlnCodigo := _LancaContab.RetornoPlnCodigo;
                  _liPlnCodigoAdianto := Trunc(liPlnCodigo);
                  fPlnCodigo := Trunc(liPlnCodigo);
               End
               Else
               Begin
                  Result := False;
                  MessageInfo := _LancaContab.MessageInfo;
                  Exit;
               End;
         end
         else
         begin
            if (((iOperacao = 4) or (iOperacao = 5) or (iOperacao = 15)) or (sDebCre = 'D'))
               and ((bRateiaD) or ((not bRateiaD) and (X = iNumRateioLancamento))) then
            begin
               _LancaContab.lcValHisDeb := rValoromD;

               if iOperacao = 4 then
               begin
                  histDSCLANCAMENTO := 'Lançamento de Aterador';
                  sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,2,
                                            sHistoricoD,
                                            [histNOMEALTERADOR,
                                            histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histHISTORICOCOMPL,
                                            histNumAP])
               end
               else if iOperacao = 5 then
               begin
                  if not bEstorno then
                  begin
                    histDSCLANCAMENTO := 'Baixa de Documento';
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                              liIdModulo,0,
                                              sHistoricoD,
                                              [histNODOCUMENTO,
                                              histCOMPLDOCUMENTO,
                                              histRAZAOSOCIAL,
                                              histDSCLANCAMENTO,
                                              histNumCHQBord,
                                              histNumSLIP,
                                              histHISTORICOCOMPL,
                                              histNumAP,
                                              histNumLote
                                              ]);
                  end
                  else begin
                    histDSCLANCAMENTO := 'Estorno de Baixa';
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,3,
                                            sHistoricoD,
                                            [histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histDATAVENCIMENTO,
                                            histDATAPROGRAMADA,
                                            histHISTORICOCOMPL,
                                            histTIPODOCUMENTO,
                                            histNUMAP,
                                            histNumLote
                                            ]);
                  end;
               end
               // lancamento ou estrono de documento
               else if iOperacao in [1, 2] then
               begin
                   histDSCLANCAMENTO := 'Lançamento de Documento';

                  // 30/01/07 A Vriável bjunta não serve mais a este fim
                  if sDebCre = 'C' then
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                                liIdModulo,1,
                                                sHistoricoD,
                                                [histNumCHQBord,
                                                histOrdemdePago])

                  else
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,1,
                                            sHistoricoD,
                                            [histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histDATAVENCIMENTO,
                                            histDATAPROGRAMADA,
                                            histTIPODOCUMENTO,
                                            histNumAP]);
               end; // else lancamento ou estorno

               if _LancaContab.InsereLancaContab('0',
                                                 liIdEmpresa,
                                                 liIdModulo,
                                                 liIdUsuario,
                                                 liPlanoConta,
                                                 liUnidNegD,
                                                 StrToIntDef(ssubcontaD,0),
                                                 0,
                                                 liPlanoPrevD,
                                                 liPatroD,
                                                 liPlnCodigo,
                                                 0,
                                                 DateToStr(dDataLancto),
                                                 sDocCompl,
                                                 sHistoricoD,
                                                 '',
                                                 '',
                                                 '',
                                                 '',
                                                 '03',
                                                 sCCustD,
                                                 sContaD,
                                                 '',
                                                 '',
                                                 '',
                                                 rValorD,
                                                 bjuntaD,
                                                 busaPlanoPatro,
                                                 iIdSegregaCriter, dDataSegregaCriter,
                                                 -1, -1, true, iCodDocumentoD, True,
                                                 rTotal, //Luiz Carlos - SOL201128_18374
                                                 -1) Then
               Begin
                  liPlnCodigo := _LancaContab.RetornoPlnCodigo;
                  _liPlnCodigoAdianto := Trunc(liPlnCodigo);
                  fPlnCodigo := Trunc(liPlnCodigo);
               End
               Else
               Begin
                  Result := False;
                  MessageInfo := _LancaContab.MessageInfo;
                  Exit;
               End;
            End;
            {**
               Efetua lançamento contábil a crédito para lançamento de alteradores,
               lançamento de baixa de adiantamento e baixa de documentos
            **}
            If (((iOperacao = 4) or (iOperacao = 5) or (iOperacao = 15)) or (sDebCre = 'C'))
               and ((bRateiaC) or ((not bRateiaC) and (X = iNumRateioLancamento))) Then
            Begin
               _LancaContab.lcValHisDeb := rValoromD;

               if iOperacao = 4 then
                  sHistoricoC := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,2,
                                            sHistoricoC,
                                            [histNOMEALTERADOR,
                                            histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histHISTORICOCOMPL,
                                            histNumAP])

               else if iOperacao = 5 then
               begin
                 if not bEstorno then
                 begin
                   histDSCLANCAMENTO := 'Baixa de Documento';
                   if (sDebCre = 'D') and (trim(histNumLote) <> '') Then
                     sHistoricoC := 'Ref. Pagto do Lote Nº: '+ histNumLote + ' Fornecedor: '+ histFornLOTE
                   else
                     sHistoricoC := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                              liIdModulo,0,
                                              sHistoricoC,
                                              [histNODOCUMENTO,
                                              histCOMPLDOCUMENTO,
                                              histRAZAOSOCIAL,
                                              histDSCLANCAMENTO,
                                              histNumCHQBord,
                                              histNumSLIP,
                                              histHISTORICOCOMPL,
                                              histNumAP,
                                              histNumLote
                                              ]);
                 end
                  else
                  begin
                    histDSCLANCAMENTO := 'Estorno de Baixa';
                    sHistoricoD := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                            liIdModulo,3,
                                            sHistoricoD,
                                            [histNODOCUMENTO,
                                            histCOMPLDOCUMENTO,
                                            histRAZAOSOCIAL,
                                            histDATAVENCIMENTO,
                                            histDATAPROGRAMADA,
                                            histHISTORICOCOMPL,
                                            histTIPODOCUMENTO,
                                            histNUMAP,
                                            histNumLote
                                            ]);
                  end
               end
               else
                  if sDebCre = 'D' then
                     sHistoricoC := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                                                liIdModulo,0,
                                                                sHistoricoC,

                                                                [histNumCHQBord,
                                                                histOrdemdePago])
                  else
                     sHistoricoC := GetHistoricoCapCar( _ModeloHist,liIdEmpresa,
                                              liIdModulo,0,
                                              sHistoricoC,
                                              [histNODOCUMENTO,
                                              histCOMPLDOCUMENTO,
                                              histRAZAOSOCIAL,
                                              histDATAVENCIMENTO,
                                              histDATAPROGRAMADA,
                                              histTIPODOCUMENTO,
                                              histNumAP,
                                              histNumLote //andré tavares - 11/04/2007 - pendência 25018
                                              ]);

               If _LancaContab.InsereLancaContab('1',
                                                 liIdEmpresa,
                                                 liIdModulo,
                                                 liIdUsuario,
                                                 liPlanoConta,
                                                 liUnidNegC,
                                                 0,
                                                 StrToIntDef(ssubcontaC,0),
                                                 liPlanoPrevC,
                                                 liPatroC,
                                                 liPlnCodigo,
                                                 0,
                                                 DateToStr(dDataLancto),
                                                 sDocCompl,
                                                 sHistoricoC,
                                                 '',
                                                 '',
                                                 '',
                                                 '',
                                                 '03',
                                                 '',
                                                 '',
                                                 sCCustC,
                                                 sContaC,
                                                 '',
                                                 rValorC,
                                                 bJuntaC,
                                                 busaPlanoPatro,
                                                 iIdSegregaCriter, dDataSegregaCriter,
                                                 -1, -1, true,
                                                 iCodDocumentoC, True,
                                                 rTotal, //Luiz Carlos - SOL201128_18374
                                                 -1) Then
               Begin
                  liPlnCodigo := _LancaContab.RetornoPlnCodigo;
                  _liPlnCodigoAdianto := Trunc(liPlnCodigo);
                  fPlnCodigo := Trunc(liPlnCodigo);
               End
               Else
               Begin
                  Result := False;
                  MessageInfo := _LancaContab.MessageInfo;
                  Exit;
               End;
            End;
         End;

         if bAntecipacao and (((iOperacao = 4) or (iOperacao = 5) or (iOperacao = 15)) or (sDebCre = 'C')) then
         begin
           liPlnAntecipa := ReverteAtecip(sCCustD, sPlacontaDocOriginal, sSubContaD,
                                          sCCustC, sContaC, sSubContaC, rValorD);
           if (trunc(liPlnAntecipa) = -1) then
           begin
              MessageInfo := 'Ocorreu um erro ao fazer a reversão da antecipação';
              Raise Exception.Create(MessageInfo + ' ' + _LancaContab.MessageInfo);
           end;
         end;
      End; //for

      _Cds.Close;
      For X := 0 To (_LstRateioLancamento.Count - 1) Do
      begin
//        TRateioLancamento(_LstRateioLancamento[X]).Free;
        oObj := _LstRateioLancamento[X];
        FreeAndNil(oObj);
      end;

      _LstRateioLancamento.Clear;

   except
      on E:Exception do
      begin
         _Cds.Close;
         For X := 0 To (_LstRateioLancamento.Count - 1) Do
         begin
//           TRateioLancamento(_LstRateioLancamento[X]).Free;
           oObj := _LstRateioLancamento[X];
           FreeAndNil(oObj);
         end;

         _LstRateioLancamento.Clear;
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;

procedure TCtrlImobDocumento.SetEstornaDocumento(const Value: Boolean);
begin
  FEstornaDocumento := Value;
end;

procedure TCtrlImobDocumento.AfterInitialize;
begin
  inherited;
  _LancaContab.InitializeAs(Self);
  _LancaContab.OpenTransaction := False;
  _ModeloHist.InitializeAs(self);
  _Segregacao.InitializeAs(self);
  _PlanPrevContabPatro.InitializeAs(Self);
  _Periodo.InitializeAs(Self);
  _Periodo.OpenTransaction := False;
  _Orcamento.InitializeAs(Self);
  _Orcamento.OpenTransaction := False;

  Rad := TCtrlRAD.Create;
  Rad.InitializeAs(Self);
  CtrlRadPlus := TCtrlRadPlus.Create;
  CtrlRadPlus.InitializeAs(Self);

  _ImobSegregacao.InitializeAs(Self);

end;

procedure TCtrlImobDocumento.SetIntBanco(const Value: TIntImobBanco);
begin
  FIntBanco := Value;
end;

function TCtrlImobDocumento.GetNumApGr: Cardinal;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GetNumApGr;
     If Result = 0 Then Raise Exception.Create(Connection.AppServer.MessageInfo);
  End
  Else
     Result := GetSequence('SEQAPGR');
end;

function TCtrlImobDocumento.GetNumChqBordero: Cardinal;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GetNumChqBordero;
     If Result = 0 Then Raise Exception.Create(Connection.AppServer.MessageInfo);
  End
  Else
     Result := GetSequence('NUMCHQBORD');
end;

function TCtrlImobDocumento.GetSequenceDocumento: Cardinal;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GetSequenceDocumento;
     If Result = 0 Then Raise Exception.Create(Connection.AppServer.MessageInfo);
  End
  Else
     Result := GetSequence('DOCUMENTO');
end;

procedure TCtrlImobDocumento.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TCtrlImobDocumento.SetUsaPlanoPatro(const Value: Boolean);
begin
  FUsaPlanoPatro := Value;
end;

procedure TCtrlImobDocumento.SetPartidaDobrada(const Value: Boolean);
begin
  FPartidaDobrada := Value;
end;

class function TCtrlImobDocumento.RoundCMLocal(rValor: Double;
  iCasasDec: Integer): Double;
begin
  result := rValor;
  result := RoundCm(rValor, iCasasDec);
end;

procedure TCtrlImobDocumento.SetOPeracaoLancto(const Value: TOperacaoLancto);
begin
  FOPeracaoLancto := Value;
end;

procedure TCtrlImobDocumento.SetDataDisponibilidade(const Value: TDateTime);
begin
  FDataDisponibilidade := Value;
end;

procedure TCtrlImobDocumento.SetSlipAutomatico(const Value: Boolean);
begin
  FSlipAutomatico := Value;
end;

function TCtrlImobDocumento.RecuperaParamIntegra( iIdEmpresa: integer; sRecPag : string ): OLEVariant;
begin
  Result := GetDataPacket(
   ' SELECT P.IMPGENERICA,P.IDTIPOCLIADIANTO, P.CODADFORNE, P.HISTPADFINAN, P.IDRAMOFORNECEDOR, ' +
   ' P.IDIMPRESSORA, P.FLGESTEXCFINANC, P.FLGEMITELANCBAIX, P.FLGOBRIGFORMAPGTO, P.FLGCOMPLTIPOFAT, P.MASCARANODOCUM, ' +
   ' P.FLGCORRIGEDOCAUTO, P.FLGCONTROLACHEQUE, P.FLGLANCAFLOAT, R.NAME, ' +
   ' R.FORMEVENTOS, R.FORMPARAMREL, R.PPREPORT, R.IDREPORTS, R.ORIGEMCM, P.FLGTRDXCCXCONTA, P.FLGTRDXIMPOSTOS, ' +
   ' P.CODTIPDOCCPMF, P.FLGVALIDACCBAIXA, P.FLGMODADDOCPG, P.FLGSLIPAUTO, P.FLGBAIXACHQ, P.FLGOPAUTO, P.FLGRADLOTE '+
   ' FROM PARAMCAP P, REPORTS R WHERE IDPESSOA = ' + IntToStr(iIdEmpresa) + ' AND RECPAG = ''' +
   sRecPag + ''' AND P.IDREPORTS = R.IDREPORTS(+) AND P.ORIGEMCM = R.ORIGEMCM(+) ');
end;

function TCtrlImobDocumento.GeraRad(idreferencia: double; codDocumento: double; codTipDoc: double; sRecPag: string; valor: Extended): Boolean;
var cdsAux, cdsRateio: TclientDataSet;

  function ValidaGrupoAut(idreferencia: double; codCentRespon: string = ''; codTipDoc: double = 0; valor: Extended = 0): Boolean;
  var sSql: string;

    function OraNum(sn : string): string;
    begin
      result := '';
      if pos(',', sn) > 0 then
        sn[pos(',', sn)] := '.';
      result := sn;
    end;

  begin
    result := false;
    sSql := ' SELECT RAU.CODTIPDOC, RAU.CODCENTRORESPON, NVL(RAU.VLRINICIAL, 0) AS VLRINICIAL, NVL(RAU.VLRFINAL, 0) AS VLRFINAL '+
            ' FROM RADTIPOPROCESSO RT, RADETAPAXGRPRESP RG, '+
            '   RADGRAUTXGRRESPON RAU, RADTIPOETAPAXPROC REXP '+
            ' WHERE RG.IDTIPOPROCESSO = RT.IDTIPOPROCESSO AND '+
            ' RAU.IDGRUPOAUTORIZA = RG.IDGRUPOAUTORIZA AND    '+
            ' REXP.IDTIPOPROCESSO = RG.IDTIPOPROCESSO AND '+
            ' REXP.IDTIPOETAPA    = RG.IDTIPOETAPA AND '+
            ' REXP.FLGINICIAL     = ''S'' AND '+
            ' RT.IDREFERENCIA     = '+ floatToStr(idreferencia);

    if codTipDoc > 0 then
      sSql := sSql + ' AND RAU.CODTIPDOC       = '+ floatToStr(codTipDoc)
    else
      sSql := sSql + ' AND RAU.CODTIPDOC IS NULL ';

    if codCentRespon <> '' then
      sSql := sSql + ' AND RAU.CODCENTRORESPON = '+ quotedStr(codCentRespon)
    else
      sSql := sSql + ' AND RAU.CODCENTRORESPON IS NULL ';


    if valor > 0 then
      sSql := sSql + ' AND (( '+ OraNum(floatTostr(valor)) +' BETWEEN NVL(RAU.VLRINICIAL, 0) AND '+
      ' DECODE(NVL(RAU.VLRFINAL, 0), 0, 99999999999999999, RAU.VLRFINAL)) OR '+
      ' (NVL(RAU.VLRINICIAL,0) = 0) AND (NVL(RAU.VLRFINAL,0) = 0)) ';

    sSql := sSql + ' ORDER BY RAU.VLRINICIAL ';

    cdsAux.Data := GetDataPacket(sSql);

    if not cdsAux.isEmpty then
    begin
      result := true;
      Rad.CodCentroRespon := codCentRespon;
      Rad.CodTipDoc := Trunc(codTipDoc);
    end;
    cdsAux.Close;
  end;

begin
  result := false;
  cdsAux := TclientDataset.create(nil);
  cdsRateio := TclientDataset.create(nil);
  try
    cdsAux.Data := GetDataPacket(' SELECT FLGNAOGERARAD FROM TIPODOCRECPAG WHERE RECPAG = '+ QuotedStr(sRecPag) +
                                  ' AND CODTIPDOC = ' + FloatToStr(codTipDoc) );

    result := (cdsAux.fieldByName('FLGNAOGERARAD').asString <> 'S');

    if Result then
    begin
       if (Sistema.VersaoRAD = '+') then
       begin
          cdsRateio.data := getDataPacket(' SELECT DISTINCT CODCENTRORESPON '+
                                          ' FROM RATEIODOCUM WHERE CODDOCUMENTO = '+ floatToStr(codDocumento));
          CtrlRadPlus.CodCentroRespon := CdsRateio.FieldByName('CODCENTRORESPON').AsString;
          CtrlRadPlus.CodTipDoc       := Trunc(codTipDoc);

          cdsRateio.Close;
          Exit;
       end;
    end;

    if result then
    begin
      result := false;
      cdsRateio.data := getDataPacket(' SELECT DISTINCT CODCENTRORESPON '+
                                      ' FROM RATEIODOCUM WHERE CODDOCUMENTO = '+ floatToStr(codDocumento));

      cdsRateio.first;
      while not cdsRateio.eof do
      begin
        // CR, TD
        result := ValidaGrupoAut(idreferencia, cdsRateio.fieldByName('CODCENTRORESPON').asString, codTipDoc, valor);
        if result then exit;
        cdsRateio.Next;
      end; // while

      cdsRateio.first;
      while not cdsRateio.eof do
      begin
        // CR
        result := ValidaGrupoAut(idreferencia, cdsRateio.fieldByName('CODCENTRORESPON').asString, 0, valor);
        if result then exit;
        cdsRateio.Next;
      end; //while

      // TD
      result := ValidaGrupoAut(idreferencia, '', codTipDoc, valor);
      if result then exit;

      // CR, TD nao preenchidos
      result := ValidaGrupoAut(idreferencia, '', 0, valor);
      if result then exit;

    end; // if
  finally
    cdsAux.Close;
    cdsRateio.Close;
    FreeAndNil(cdsAux);
    FreeAndNil(cdsRateio);
  end;
end;

function TCtrlImobDocumento.VerificaContaBaixaxPrograma: Boolean;
var i: integer;
begin
  result := true;
  if _Segregacao.SegregaVirtual then begin
    if _LstCcBaixasxDocum.Count > 0 then begin
      for i:=0 to (_LstCcBaixasxDocum.Count - 1) do begin
        if _Segregacao.RetornaPlanoSegregar(TDbCcBaixasxDocum(_LstCcBaixasxDocum[i]).Plano.AsInteger,
                                            TDbCcBaixasxDocum(_LstCcBaixasxDocum[i]).Placonta.AsString,
                                            TDbCcBaixasxDocum(_LstCcBaixasxDocum[i]).Idplanoprev.AsInteger) = -1 then begin
          result := false;
          MessageInfo := _Segregacao.MessageInfo;
          exit;
        end;
      end;
    end else begin
      for i:=0 to (_LstRateioDocum.Count - 1) do begin
        if _Segregacao.RetornaPlanoSegregar(_Documento.Plano.AsInteger, _Documento.Placonta.AsString,
                                            TDbRateioDocum(_LstRateioDocum[i]).Idplanoprev.AsInteger) = -1 then begin
          result := false;
          MessageInfo := _Segregacao.MessageInfo;
          exit;
        end;
      end;
    end;
  end;
end;

function TCtrlImobDocumento.InserirRAD: Boolean;
var bGeraRad: Boolean;
    _cdsAux : TCmClientDataset;
    EmiteLancaBaixa : boolean;
    iIDProcesso : longInt;
    sAux: string;

begin
  Result   := True;

  if ( (_OperacaoPrepareImob =  OpDocumentoImob) or
      ((_docState = dstUpdate) and (_OperacaoPrepareImob =  OpLanctoDocumImob) )) and
       ( _Documento.Recpag.AsString = 'P'         ) then
  begin
    _cdsAux := TCmClientDataset.Create( nil );
    try
      try
        if trim(_Documento.Codtipdoc.AsString) = '' then
        begin
          _cdsAux.Data := GetDataPacket('SELECT NODOCUMENTO, COMPLDOCUMENTO, CODTIPDOC, IDEMPRESA, IDUSUARIOINCLUSAO FROM DOCUMENTO WHERE CODDOCUMENTO = '+ _Documento.CodDocumento.AsString);
          _Documento.Codtipdoc.AsString         := _cdsAux.fieldByName('CODTIPDOC').asString;
          _Documento.Idempresa.asString         := _cdsAux.fieldByName('IDEMPRESA').asString;
          _Documento.Idusuarioinclusao.asString := _cdsAux.fieldByName('IDUSUARIOINCLUSAO').asString;
          _Documento.Nodocumento.AsString       := _cdsAux.fieldByName('NODOCUMENTO').asString;
          _Documento.ComplDocumento.AsString    := _cdsAux.fieldByName('COMPLDOCUMENTO').asString;
        end;

        _cdsAux.Data := RecuperaParamIntegra( _Documento.Idempresa.AsInteger, _Documento.Recpag.AsString );
        EmiteLancaBaixa  := ( _cdsAux.FieldByName('FLGEMITELANCBAIX').AsString = 'S' );
        _cdsAux.Close;

        bGeraRAD := _OperacaoDocLancImob <> odlBaixaAdiantamentoImob; //andré tavares - pendência 26700 - 29/10/2007 - não gerar RAD na baixa de adiantamento.
        if bGeraRAD then
        begin
          if Sistema.VersaoRAD = '+' then
          begin
             CtrlRADPlus.InicializaPropriedades;
             CtrlRadPlus.TipoProcesso := CtrlRadPlus.RecuperaTipoProcesso( FiReferenciaRad, _Documento.Idempresa.AsInteger );
             bGeraRAD                 := ( CtrlRadPlus.TipoProcesso > 0 );
          end
          else
          begin
             Rad.TipoProcesso := Rad.GetTipoProcesso( FiReferenciaRad, _Documento.Idempresa.AsInteger );
             bGeraRAD         := ( Rad.TipoProcesso > 0 );
          end;

          fSaldo.Clear;
          fSaldo.GetValorBruto(_Documento.CodDocumento.asFloat);
          bGeraRad := bGeraRad and GeraRad(FiReferenciaRad, _Documento.CodDocumento.asFloat, _Documento.Codtipdoc.asFloat, _Documento.Recpag.AsString, fSaldo.ValorBruto);

          if bGeraRAD then
          begin
            if Sistema.VersaoRAD = '+' then
            begin
               CtrlRadPlus.IdEmpresa := _Documento.Idempresa.AsInteger;
               CtrlRadPlus.Idusuario := _Documento.Idusuarioinclusao.AsInteger;
               if Trim(_Documento.ComplDocumento.AsString) <> '' then
                  sAux := _Documento.Nodocumento.AsString + '-' + _Documento.ComplDocumento.AsString
               else
                  sAux := _Documento.Nodocumento.AsString;

               if Trim(_Documento.Numapgr.AsString) <> '' then
                 sAux := sAux + ' - Número da AP: ' + _Documento.Numapgr.AsString;

               CtrlRadPlus.OBS := 'Documento Nº: ' + sAux;
               CtrlRadPlus.VlrProc   := fSaldo.ValorBruto;

               if (FCentroRespon <> '') then
                  ctrlRadPlus.CodCentroRespon := FCentroRespon;

               iIdProcesso := CtrlRadPlus.IniciarProcesso( True );

               if ( iIdProcesso = 0 ) then
               begin
                  if ( ctrlRadPlus.RecuperaTipoProcesso(fiReferenciaRad, _Documento.Idempresa.AsInteger) = 0 ) then
                     Result := True
                  else
                  begin
                    Result      := False;
                    MessageInfo := CtrlRadPlus.MessageInfo;
                  end;
               end;
            end
            else
            begin
               Rad.IdEmpresa := _Documento.Idempresa.AsInteger;
               Rad.IdPessoa  := _Documento.Idempresa.AsInteger;
               Rad.Idusuario := _Documento.Idusuarioinclusao.AsInteger;
               Rad.Valor     := fSaldo.ValorBruto;
               Rad.OBS       := 'Documento Nº: ' + _Documento.Nodocumento.AsString +
                                ' - ' + _Documento.ComplDocumento.AsString;

               if (FCentroRespon <> '') then
                  Rad.codCentroRespon := FCentroRespon;

               iIdProcesso := Rad.IniciarProcesso( True );
               if iIdProcesso < 0 then
               begin
                 Result := False;
                 MessageInfo := Rad.MessageInfo;
               end;
            end;


            if not ExecSql( ' UPDATE DOCUMENTO SET IDPROCESSO = ' + IntToStr( iIdProcesso ) +
                     ' WHERE  CODDOCUMENTO = ' + _Documento.Coddocumento.AsString ) then
              Raise Exception.Create(MessageInfo);

          end;
        end;

      except
        result := false;

        if Sistema.VersaoRAD = '+' then
           messageInfo := MessageInfo + ' ' + CtrlRadPlus.MessageInfo
        else
           messageInfo := MessageInfo +' '+ Rad.MessageInfo;
      end;//try except
    finally
      FiReferenciaRad := 27; //andre tavares - pendencia 21603 - 28/07/2006 - volta ao valor default
      _cdsAux.Close;
      FreeAndNil(_cdsAux);
    end;// try finally
  end;
end;

function TCtrlImobDocumento.AlterarRAD(iCodDocumento: int64): Boolean;
var IdProcesso: LongInt;
    cdsAux : TclientDataset;
    sTextoPergunta : String;
begin
  Result:= True;

  try
    cdsAux := TClientDataset.Create(nil);
    try
      cdsAux.Data := GetDataPacket( 'SELECT IDPROCESSO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + intToStr(iCodDocumento) );
      if not cdsAux.IsEmpty then
        IdProcesso  := cdsAux.FieldByName('IDPROCESSO').AsInteger
      else
        IdProcesso := 0;

         if (Sistema.VersaoRAD = '+') then   //RadG
         begin
            if (CtrlRadPlus.ExisteAprovacaonoProcesso(IdProcesso)) then
            begin
               sTextoPergunta := 'O processo RAD nº ' + intToStr(IdProcesso) + ' deste documento já possui ao menos uma etapa autorizada. '+
                                 'Este processo será excluído e um novo será inserido. ' +
                                 'Deseja realmente excluir o processo n° ' + intToStr(IdProcesso) + ' ?';

               if assigned (onpergunta) then
                  result:= onpergunta(sTextoPergunta)
               else
                  Result := true;

               if not Result then
                  MessageInfo := 'Não foi possível alterar o documento. ' + #13 +
                                 'Motivo: Operação cancelada pelo usuário'
                  else
                  begin
                     Result := CtrlRadPlus.ExcluirProcesso( IdProcesso, True );
                     Result := InserirRad;

                  end;

            end
            else
            begin
               Result := CtrlRadPlus.ExcluirProcesso( IdProcesso, True );
               Result := InserirRad;
            end;

         end
         else
         begin
           result := true;
           cdsAux := TClientDataset.Create(nil);
           cdsAux.Data := GetDataPacket( 'SELECT IDPROCESSO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + intToStr(iCodDocumento) ); //andre tavares - 10/08/2006
           if not cdsAux.IsEmpty then
             IdProcesso := cdsAux.FieldByName('IDPROCESSO').AsInteger
           else
             IdProcesso := 0;

           cdsAux.Data := getDataPacket('SELECT DATAFIMETAPA FROM RADINSTETAPA WHERE IDPROCESSO = '+ intToStr(IdProcesso) +' AND DATAFIMETAPA IS NOT NULL ');

           //Exclui o RAD   Marcus Oliveira
           if (IdProcesso > 0) then
           begin
               if (not cdsAux.IsEmpty) then
               begin
                  sTextoPergunta := 'O processo RAD nº ' + intToStr(IdProcesso) + ' deste documento já possui ao menos uma etapa autorizada. '+
                                    'Este processo será excluído e um novo será inserido. ' +
                                    'Deseja realmente excluir o processo n° ' + intToStr(IdProcesso) + ' ?';

               if assigned (onpergunta) then

                  result:= onpergunta(sTextoPergunta)
               else
                  Result := true;

               if not Result then
                  MessageInfo := 'Não foi possível alterar o documento. ' + #13 +
                                 'Motivo: Operação cancelada pelo usuário'
                  else
                  begin   //Caso tenha uma etapa aprova e ainda sim queira excluir.
                     Result           := Rad.ExcluirProcesso( IdProcesso, True );
                     Self.InserirRAD;

                  end;
             end; // 'e não pode ser Excluído/Alterado.';
           end;
         end;
    except
      result := false;
    end;
  finally
    cdsAux.Close;
    FreeAndNIl(cdsAux);
  end;
end;

function TCtrlImobDocumento.ExcluirRAD(iCodDocumento: int64): Boolean;
var IdProcesso: LongInt;
    cdsAux : TclientDataset;
    sTextoPergunta: String;
begin
  result := true;
  try
    //Recupera o ID do processo RAD antes que o documento seja excluído
    cdsAux := TClientDataset.Create(nil);
    try
      cdsAux.Data := GetDataPacket( 'SELECT IDPROCESSO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + intToStr(iCodDocumento) ); //andre tavares - 10/08/2006
      if not cdsAux.IsEmpty then
        IdProcesso := cdsAux.FieldByName('IDPROCESSO').AsInteger
      else
        IdProcesso := 0;

      cdsAux.Data := getDataPacket('SELECT DATAFIMETAPA FROM RADINSTETAPA WHERE IDPROCESSO = '+ intToStr(IdProcesso) +' AND DATAFIMETAPA IS NOT NULL ');


      if (IdProcesso > 0) then
      begin
         if (Sistema.VersaoRAD = '+') then
         begin
           Result := True;
           if ( CtrlRadPlus.ExisteAprovacaonoProcesso(IdProcesso) ) then
           begin
             sTextoPergunta := 'O processo RAD nº ' + intToStr(IdProcesso) + ' deste documento já possui autorização. '+
                               'Deseja realmente estornar/excluir o documento?';
             if assigned( onpergunta ) then
               Result := onpergunta( sTextoPergunta );
           end;

           if not Result then
             MessageInfo := 'Não foi possível excluir/estornar o documento. ' + #13 + 'Motivo: Operação cancelada pelo usuário.'
           else
             Result := CtrlRadPlus.ExcluirProcesso( IdProcesso, True );
           end
      end
      else
      begin
         result := true;
         //Recupera o ID do processo RAD antes que o documento seja excluído
         cdsAux := TClientDataset.Create(nil);
         cdsAux.Data := GetDataPacket( 'SELECT IDPROCESSO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + intToStr(iCodDocumento) ); //andre tavares - 10/08/2006
         if not cdsAux.IsEmpty then
           IdProcesso := cdsAux.FieldByName('IDPROCESSO').AsInteger
         else
           IdProcesso := 0;

         cdsAux.Data := getDataPacket('SELECT DATAFIMETAPA FROM RADINSTETAPA WHERE IDPROCESSO = '+ intToStr(IdProcesso) +' AND DATAFIMETAPA IS NOT NULL ');

         if (IdProcesso > 0) then
         begin
             if (not cdsAux.IsEmpty) then
             begin
                sTextoPergunta := 'O processo RAD Nº ' + intToStr(IdProcesso) + ' deste documento já possui ao menos uma etapa autorizada. '+
                                  'Deseja realmente estornar/excluir o documento?';

             if assigned (onpergunta) then

                result:= onpergunta(sTextoPergunta)
             else
                Result := true;

             if not Result then
                MessageInfo := 'Não foi possível excluir o documento. ' + #13 +
                               'Motivo: Operação cancelada pelo usuário'
                else
                  //Caso tenha uma etapa aprova e ainda sim queira excluir.
                  Result := Rad.ExcluirProcesso( IdProcesso, True );

             end
             else
                Result := Rad.ExcluirProcesso( IdProcesso, True );
         end;
      end;
    except
      result := false;
    end;

  finally
    cdsAux.Close;
    FreeAndNil(cdsAux);
  end;
end;

function TCtrlImobDocumento.GetNumDiasVencto(const recpag: string; const codDocumento: int64; const idEmpresa: integer): Integer;
 var cdsVencto: TClientDataSet;
     x, i,ind : integer;
     sFiltro: string;
     aStringFiltro : array of string;
     bAchou: Boolean;
begin
  result := 0;
  cdsVencto := TClientDataSet.Create(nil);
  try
   bAchou := false;
   ind := 0;
   for x := 0 to (_LstRateioDocum.Count - 1) do
   begin

     for i := 0 to length(aStringFiltro) - 1 do //pesquisa se o elemento já existe
     begin
       if aStringFiltro[i] = quotedStr(TDbRateiodocum(_LstRateioDocum[X]).Codtiprecdes.asString) then
       begin
         bAchou := true;
         break;
       end
       else bAchou := false;
     end;

     if not bachou then //se não existe
     begin
       inc(ind);
       setLength(aStringFiltro, ind);
       aStringFiltro[ind - 1] := quotedStr(TDbRateiodocum(_LstRateioDocum[X]).Codtiprecdes.asString);
     end;

   end;
    //se NUMDIASVENCTO menor que zero, o bloquieo será para traz (BRTPREV)
    cdsVencto.data := getDataPacket(' SELECT NUMDIASVENCTO FROM PARAMCAP '+ #13+
                                    ' WHERE IDPESSOA = '+ intToStr(idEmpresa)+ #13+
                                    '       AND RECPAG = '+ quotedStr(recpag) + #13+
                                    '       AND NUMDIASVENCTO IS NOT NULL ');


    if cdsVencto.fieldByName('NUMDIASVENCTO').asInteger >= 0 then
    begin
      sFiltro := '';
      if length(aStringFiltro) > 0 then
        for i := 0 to length(aStringFiltro) - 1 do //pesquisa se o elemento já existe
        begin
           sFiltro :=  sFiltro + aStringFiltro[i];
           if (i < length(aStringFiltro) - 1) then
             sFiltro := sFiltro + ', '
        end;

      if sFiltro <> '' then
      begin
        //esta query pega a menor data entre os tipos de desembolso do rateio do documento e o paramcap
        cdsVencto.data := getDataPacket(' SELECT MAX(NUMDIASVENCTO) AS NUMDIASVENCTO '+ #13+
                                        ' FROM ( SELECT TRD.NUMDIASVENCTO FROM TIPORECEBDESEMB TRD '+ #13+
                                        '        WHERE TRD.NUMDIASVENCTO IS NOT NULL AND '+ #13+
                                        '              TRD.CODTIPRECDES IN ('+ sFiltro + ')'+#13+
                                        ' UNION ALL '+#13+
                                        ' SELECT NUMDIASVENCTO FROM PARAMCAP '+ #13+
                                        ' WHERE IDPESSOA = '+ intToStr(idEmpresa)+ #13+
                                        '       AND RECPAG = '+ quotedStr(recpag) + #13+
                                        '       AND NUMDIASVENCTO IS NOT NULL) ');
      end//if
      else
      begin
        //se o documento não tem rateio
        cdsVencto.data := getDataPacket(' SELECT NUMDIASVENCTO FROM PARAMCAP '+ #13+
                                        ' WHERE IDPESSOA = '+ intToStr(idEmpresa)+ #13+
                                        '       AND RECPAG = '+ quotedStr(recpag) + #13+
                                        '       AND NUMDIASVENCTO IS NOT NULL ');
      end;//else
    end;

    result := cdsVencto.fieldByName('NUMDIASVENCTO').asInteger;
  finally
    cdsVencto.Close;
    FreeAndNIl(cdsVencto);
  end;//try
end;

procedure TCtrlImobDocumento.SetsCtrlDocObs(const Value: String);
begin
  FsCtrlDocObs := Value;
end;

procedure TCtrlImobDocumento.SetCentroRespon(const Value: string);
begin
  FCentroRespon := Value;
end;

function TCtrlImobDocumento.GetMaiorCR(sListaCodDocs: string): string;
var
  sSQL: string;
  cdsLocal: TCmClientDataSet;
begin
  try

  Result := '';

  cdsLocal := TCmClientDataSet.Create(nil);

  sSQL :=
    'SELECT CODCENTRORESPON, '           +
    '       NVL(SUM(VALOR),0) AS VALOR ' +
    'FROM   RATEIODOCUM '                +
    'WHERE  CODDOCUMENTO IN (' + sListaCodDocs + ') '  +
    'GROUP BY CODCENTRORESPON    '       +
    'ORDER BY VALOR DESC '               ;

  cdsLocal.Data := GetDataPacket(sSQL);

  Result := cdsLocal.FieldByName('CODCENTRORESPON').AsString;

  finally
    cdsLocal.Close;
    FreeAndNil(cdsLocal);
  end;
end;

procedure TCtrlImobDocumento.SetQtdeCotas(const Value: extended);
begin
  FQtdeCotas := Value;
end;

function TCtrlImobDocumento.VerificaPlanosRateio: Boolean;
var cdsPPcor, cdsPPxPF, cdsPPpos: TClientDataset;
    bObrigaMesmoPP: boolean;
    iPlanoPrevAnt, y: integer;

    function getPlanprevContabil(idplanoPrev: integer): Olevariant;
    begin
      result := getDataPacket( 'SELECT NOME, IDPLANOPREV, IDPLANOPREVPREV, CODSPC FROM PLANPREVCONTABIL WHERE IDPLANOPREV = '+ intToStr(idplanoPrev) );
    end;

begin
  result := true;
  //se obriga mesmo planoprev e o documento tem um portadorforma, então lista os planosprev do portadorconta
  cdsPPxPF := TClientDataset.Create(nil);
  cdsPPpos := TClientDataset.Create(nil);
  cdsPPcor := TClientDataset.Create(nil);
  try
    cdsPPxPF.Data := getDataPacket('SELECT FLGOBRIGAMESMOPP FROM PARAMCAP WHERE IDPESSOA = '+ intToStr(Sistema.IdEmpresa) + ' AND RECPAG = '+ quotedStr(_Documento.Recpag.AsString) );
    bObrigaMesmoPP := cdsPPxPF.fieldByName('FLGOBRIGAMESMOPP').asString = 'S';

    if (_documento.codportforma.asInteger > 0) then
      cdsPPxPF.data := GetDataPacket(' SELECT P.IDPLANOPREV '+#13+
                                     ' FROM PORTCONTAXPLANO P, PORTADORFORMA PF '+#13+
                                     ' WHERE  P.CODPORTADOR = PF.CODPORTADOR AND '+#13+
                                     '        PF.CODPORTFORMA = '+ _documento.codportforma.asString );

    if (bObrigaMesmoPP) and ( (cdsPPxPF.IsEmpty) or (_documento.codportforma.asInteger = 0) )then
    begin
      cdsPPcor.Data :=  getPlanprevContabil(TDbRateiodocum(_LstRateioDocum[0]).Idplanoprev.asInteger);
      iPlanoPrevAnt := TDbRateiodocum(_LstRateioDocum[0]).IdPlanoVirtual.asInteger;
      for y := 0 To (_LstRateioDocum.Count - 1) do
      begin

        if (TDbRateiodocum(_LstRateioDocum[0]).Valor.asFloat > 0) then //se obriga mesmo planprevcontabil no raetio
        begin
          cdsPPpos.Data :=  getPlanprevContabil(TDbRateiodocum(_LstRateioDocum[y]).Idplanoprev.asInteger);

          if iPlanoPrevAnt = 0 then
          begin

            //verifica se os rateios estão no mesmo plano
            if not cdsPPcor.FieldByName('IDPLANOPREVPREV').isNull then
              result := cdsPPcor.FieldByName('IDPLANOPREVPREV').asInteger = cdsPPpos.FieldByName('IDPLANOPREVPREV').asInteger
            else
              result := trim(cdsPPcor.FieldByName('CODSPC').asString) = trim(cdsPPpos.FieldByName('CODSPC').asString);

          end //if
          else begin
            result := iPlanoPrevAnt = TDbRateiodocum(_LstRateioDocum[y]).IdPlanoVirtual.asInteger;
          end;//else

        end;//if

        if not result then
        begin
          MessageInfo := 'Rateios com Planos Diferentes não são Permitidos.';
          raise exception.Create(MessageInfo);
        end;

      end;//for
    end//if
    else if (_documento.codportforma.asInteger > 0) and (not cdsPPxPF.IsEmpty) then
    begin
      for y := 0 To (_LstRateioDocum.Count - 1) do
      begin
        cdsPPxPF.data := GetDataPacket(' SELECT P.IDPLANOPREV '+#13+
                                       ' FROM PORTCONTAXPLANO P, PORTADORFORMA PF '+#13+
                                       ' WHERE  P.CODPORTADOR = PF.CODPORTADOR AND '+#13+
                                       '        PF.CODPORTFORMA = '+ _documento.codportforma.asString + ' AND '+
                                       '        P.IDPLANOPREV = '+ TDbRateiodocum(_LstRateioDocum[y]).Idplanoprev.asString );
        result := not cdsPPxPF.isEmpty;
        if not result then
        begin
          result := false;
          MessageInfo := 'Rateios com Planos não Relacionados a este Portador X Conta não são permitidos.';
          raise exception.create(messageInfo);
        end;
      end; //for
    end;//else

  if not result then
  begin
    MessageInfo := ' Os Planos do Rateio do Documento não Estão Relacionados ao Portador Conta.';
    Raise Exception.Create(MessageInfo);
  end;
  finally
    cdsPPxPF.Close;
    cdsPPpos.Close;
    cdsPPcor.Close;

    FreeAndNil(cdsPPxPF);
    FreeAndNil(cdsPPpos);
    FreeAndNil(cdsPPcor);
  end;
end;


function TCtrlImobDocumento.RetornaSaldoDocumento(CodDocumento: string;
  var DebCre: string): Real;
var
   sSQl:String ;
   cdsSaldo: TClientDataset;
begin
   TRY
     cdsSaldo := TClientDataset.Create( nil );
     DebCre   := '';
     Result   := 0;

     sSQL := '';
     sSQL := ' SELECT ' +
             ' TIP.DEBCRE, ' +
             ' SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VALOR ' +
             //' SUM(DECODE(LANC.DEBCRE,'D',DECODE(DOC.RECPAG,'R',LANC.VALOROUTRAMOEDA,LANC.VALOROUTRAMOEDA * -1),DECODE(DOC.RECPAG,'R',LANC.VALOROUTRAMOEDA * -1,LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA --' +
             ' FROM ' +
             ' LANCTODOCUM LANC, DOCUMENTO DOC, TIPODOCRECPAG TIP ' +
             ' WHERE ' +
             ' DOC.CODDOCUMENTO = ' + Trim(COdDocumento) +
             ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ' +
             ' AND DOC.CODTIPDOC  = TIP.CODTIPDOC ' +
             ' GROUP BY TIP.DEBCRE ';


     cdsSaldo.Data := GetDataPacket(sSQl);

     if not cdsSaldo.IsEmpty then
     begin
          DebCre   := Trim(cdsSaldo.fieldbyname('DEBCRE').AsString);
          Result   := cdsSaldo.fieldbyname('VALOR').AsFLoat;
     end;

   FINALLY
     if cdsSaldo <> nil then
     begin
          cdsSaldo.Close;
          FreeAndNil(cdsSaldo);
     end;
   end;
end;

procedure TCtrlImobDocumento.SetMantemLancContabil(const Value: boolean);
begin
  FMantemLancContabil := Value;
end;

{ TCtrlPersistentObject }
procedure TCtrlPersistentObject.Clear;
begin

end;

constructor TCtrlPersistentObject.Create(Aowner: TCmControlObject);
begin
   FOwner := Aowner;
   _Cds := TClientDataSet.Create(nil);
end;

destructor TCtrlPersistentObject.Destroy;
begin
  _Cds.Close;
  FreeAndNil(_Cds);
  inherited;
end;

procedure TCtrlPersistentObject.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;


{ TRecbToImobPagto }

constructor TRecbToImobPagto.Create(Aowner: TCmControlObject);
begin
  inherited;
  _Recbtopagto := TDbRecbtopagto.Create(Aowner);
end;

destructor TRecbToImobPagto.Destroy;
begin
  FreeAndNil(_Recbtopagto);
  inherited;
end;

function TRecbToImobPagto.Excluir(liCodDocumento,
  liNumLancto: LongInt): Boolean;
begin
  Result := True;

  _Cds.Data := Owner.GetDataPacket(' SELECT CODDOCUMENTO FROM RECBTOPAGTO WHERE CODDOCUMENTO = '+InttoStr(liCodDocumento)+
                             ' AND NUMLANCTO = '+InttoStr(liNumLancto));
  try
    if (not _Cds.IsEmpty) then
    Begin
       _Recbtopagto.Clear;
       _Recbtopagto.CodDocumento.AsFloat := liCodDocumento;
       _Recbtopagto.NumLancto.AsFloat := liNumLancto;

       Result := _Recbtopagto.Delete;

       If Not Result Then Owner.MessageInfo := _Recbtopagto.MessageInfo;
    end;
  finally
    _Cds.Close;
  end;
end;


function TRecbToImobPagto.Inserir(liCodDocumento, liNumLancto,
  lidUsuarioInclusao, liCodLancFinanc, liCodPortForma, liNumLote,
  liCodlancnaoident, liNumBaixa: LongInt; NumChqBordero, DataFloat,
  DataBaixa: String): Boolean;
begin
  _Recbtopagto.Clear;

  _Recbtopagto.Coddocumento.AsFloat := liCodDocumento;
  _Recbtopagto.Numlancto.AsFloat := liNumLancto;
  _Recbtopagto.Idusuarioinclusao.AsFloat := lidUsuarioInclusao;
  _Recbtopagto.Numchqbordero.AsString := Trim(NumChqBordero);
  _Recbtopagto.Datacfloat.AsDateTime := StrToDateTime(DataFloat);

  if liCodLancFinanc <= 0 then
     _Recbtopagto.Codlancfinanc.Clear
  else
     _Recbtopagto.Codlancfinanc.AsFloat := liCodLancFinanc;

  if liCodPortForma <= 0 then
     _Recbtopagto.Codportforma.Clear
  else
     _Recbtopagto.Codportforma.AsFloat := liCodPortForma;

  if liNumLote <= 0 then
     _Recbtopagto.Numlote.Clear
  else
     _Recbtopagto.Numlote.AsFloat := liNumLote;

  if liCodlancnaoident <= 0 then
     _Recbtopagto.Codlancnaoident.Clear
  else
     _Recbtopagto.Codlancnaoident.AsFloat := liCodlancnaoident;

  if liNumBaixa <= 0 then
     _Recbtopagto.Numbaixa.Clear
  else
     _Recbtopagto.Numbaixa.AsFloat := liNumBaixa;

  if DataBaixa = '' then
     _Recbtopagto.Databaixa.Clear
  else
     _Recbtopagto.Databaixa.AsDateTime := StrToDate(DataBaixa);

  Result := _Recbtopagto.Insert;
  If Not Result Then Owner.MessageInfo := _Recbtopagto.MessageInfo;
end;

procedure TRecbToImobPagto.SetDataBaseName(const Value: String);
begin
  inherited;
  _Recbtopagto.DataBaseName := Value;
end;

{ TIntImobBanco }


function TIntImobBanco.ListDocumentos(IDCliente: Double; DataProgramada: String; PortadorForma : Integer): OLEVariant;
var sSQL : String;
begin
    sSql := ' SELECT '+
    '  '' '' AS SELECIONAR,'+
    '  D.IDFORCLI,'+
    '  D.CODDOCUMENTO,'+
    '  P.RAZAOSOCIAL,'+
    '  D.NODOCUMENTO,'+
    '  D.DATAPROGRAMADA '+
    ' FROM '+
    '  DOCUMENTO D,'+
    '  PESSOA P '+
    ' WHERE '+
    '  P.IDPESSOA = D.IDFORCLI '+
    '  AND D.DATAPROGRAMADA = TO_DATE(' + QuotedStr(DataProgramada) + ' ,''DD/MM/YYYY'')'+
    '  AND D.CODPORTFORMA = ' + IntToStr(PortadorForma)+
    '  AND ((D.EMISBLOQ = ''N'') OR D.EMISBLOQ IS NULL) '+
    '  AND D.CODGRUPOCNAB IS NULL ';
    if IDCliente <> 0 then
      sSql := sSql + ' AND D.IDFORCLI = ' + FloatToStr(IDCliente);

  Result := TCtrlImobDocumento(Owner).GetDataPacket(sSQL);
end;


function TIntImobBanco.VerificaConsistencia(dados: Olevariant): boolean;
var cds: TClientDataSet;
    idforcli : integer;
begin
  idforcli := -1;
  result := false;
  cds := TClientDataSet.Create(nil);
  cds.Data := dados;
  cds.First;
  while not cds.Eof do
  begin
    if cds.fieldByName('SELECIONAR').AsString = 'S' then
    begin
      if idforcli = -1 then
        idforcli := cds.fieldByName('IDFORCLI').asInteger;

      result :=  idforcli = cds.fieldByName('IDFORCLI').asInteger;

      if not result then
        break;
    end;
    cds.Next;
  end; // while
  cds.Close;
  FreeAndNil(cds);
end;

function TIntImobBanco.AgrupaDocCnab(CdsCnab: TClientDataSet; bInTransaction,
  bAlteraEmisBloq: Boolean; sCamposParaGrupo: array of String): Boolean;
Var iSeqGrupo, iNumCampos, X    : Integer;
    lValoresGrupo               : TStringList;
    bExisteCampo, bCamposIguais,
    bExistePortFotma            : Boolean;
    FieldGrupoDoc               :TField;
    sGrupoDoc                   :String;

    function VerificaStatusDoc(CodDocumento: extended): Boolean;
    var _cds : TCMClientDataSet;
    begin
       _cds := TCMClientDataSet.Create(nil);
       try
          _cds.Data := TCtrlImobDocumento(Owner).GetDataPacket('SELECT EMISBLOQ FROM DOCUMENTO WHERE CODDOCUMENTO = '+ floattostr(CodDocumento));
          result := (_cds.fieldbyname('emisbloq').asstring <> 'S');
       finally
          _cds.Close;
          FreeAndNil(_cds);
       end;
    end;

Begin
   FCodigosGrupo.Clear;
   iNumCampos := High(sCamposParaGrupo);
   lValoresGrupo := TStringList.Create;
   bExisteCampo := True;

   For X:=0 To iNumCampos Do
   Begin
       bExisteCampo := (CdsCnab.FindField(sCamposParaGrupo[X]) <> nil);

       If Not bExisteCampo Then
       begin
          TCtrlImobDocumento(Owner).MessageInfo := 'O Campo ' + sCamposParaGrupo[X] + ' não Existe.';
          Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
       end;
   End;

   If (CdsCnab.FindField('CODDOCUMENTO') = nil) Or (Not bExisteCampo) Then
      Result := False
   Else
   Begin

      bExistePortFotma := (CdsCnab.FindField('CODPORTFORMA') <> nil);

      Try

         If Not bInTransaction Then TCtrlImobDocumento(Owner).StartTransaction;

         CdsCnab.First;
         iSeqGrupo     := TCtrlImobDocumento(Owner).GetSequence('GRUPOCNAB');
         FCodigosGrupo.Add (IntToStr(iSeqGrupo));
         bCamposIguais := True;

         If Not CdsCnab.IsEmpty then
            For X:=0 To iNumCampos Do lValoresGrupo.Add(CdsCnab.FieldByName(sCamposParaGrupo[X]).AsString);

         While Not CdsCnab.Eof Do
         Begin
           if not VerificaStatusDoc(CdsCnab.FieldByName('CODDOCUMENTO').asFloat) then
           begin
             TCtrlImobDocumento(Owner).MessageInfo := 'Um ou mais documentos selecionados não podem ser agrupados, pois '+#13 +
                             'já foram emitidos para cobrança.';
             Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
           end;

            For X:=0 To iNumCampos Do
            Begin
                bCamposIguais := (lValoresGrupo[x] = CdsCnab.FieldByName(sCamposParaGrupo[X]).AsString);
                If Not bCamposIguais Then
                begin
                   TCtrlImobDocumento(Owner).MessageInfo := 'Os Campo ' + sCamposParaGrupo[X] + ' está com valor diferente.';
                   Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
                end;
            End;

            If Not bCamposIguais Then
            Begin
               iSeqGrupo     := TCtrlImobDocumento(Owner).GetSequence('GRUPOCNAB');
               bCamposIguais := True;
               FCodigosGrupo.Add (IntToStr(iSeqGrupo));
            End;

            FieldGrupoDoc := CdsCnab.FindField('GRUPODOC');

            If FieldGrupoDoc <> nil Then
               sGrupoDoc := Trim(FieldGrupoDoc.AsString)
            Else
               sGrupoDoc := '';

            If (bAlteraEmisBloq) And (bExistePortFotma) And
               (Not CdsCnab.FindField('CODPORTFORMA').IsNull) Then
            Begin
               If Not TCtrlImobDocumento(Owner).ExecSql('UPDATE DOCUMENTO SET CODGRUPOCNAB = ' + IntToStr(iSeqGrupo) + ', EMISBLOQ = ''N'', GRUPODOC = ''' + sGrupoDoc + ''' ' +
                              ' WHERE CODDOCUMENTO = ' + CdsCnab.FieldByName('CODDOCUMENTO').AsString) Then
               begin
                  TCtrlImobDocumento(Owner).MessageInfo := 'Erro ao marcar documento ' + CdsCnab.FieldByName('CODDOCUMENTO').AsString + ' como agrupado.' + (#13 + #10) + TCtrlImobDocumento(Owner).MessageInfo;
                  Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
               end;
            End
            Else
               If Not TCtrlImobDocumento(Owner).ExecSql('UPDATE DOCUMENTO SET CODGRUPOCNAB = ' + IntToStr(iSeqGrupo) +  ', GRUPODOC = ''' + sGrupoDoc + ''' ' +
                              ' WHERE CODDOCUMENTO = ' + CdsCnab.FieldByName('CODDOCUMENTO').AsString) Then
               begin
                  TCtrlImobDocumento(Owner).MessageInfo := 'Erro ao marcar documento ' + CdsCnab.FieldByName('CODDOCUMENTO').AsString + ' como agrupado.' + (#13 + #10) + TCtrlImobDocumento(Owner).MessageInfo;
                  Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
               end;

            CdsCnab.Next;
         End;

         If Not bInTransaction Then TCtrlImobDocumento(Owner).Commit;
      Except
         If Not bInTransaction Then TCtrlImobDocumento(Owner).Rollback;
         FreeAndNil(lValoresGrupo);
         Raise;
      End;

      Result := True;
   End;

   FreeAndNil(lValoresGrupo);
end;

constructor TIntImobBanco.Create(Aowner: TCmControlObject);
begin
  inherited;
  FCodigosGrupo := TStringList.Create;
end;

destructor TIntImobBanco.Destroy;
begin
  FreeAndNil(FCodigosGrupo);
  inherited;
end;

function TIntImobBanco.GetCodGrupoCnab(liCodDocumento: LongInt): LongInt;
begin
  _Cds.Close;
  _Cds.Data := TCtrlImobDocumento(Owner).GetDataPacket('SELECT CODGRUPOCNAB FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(liCodDocumento));

  If _Cds.IsEmpty Then
     Result := -1
  Else
     Result := _Cds.Fields[0].AsInteger;

  If _Cds.Active Then _Cds.Close;
end;

function TIntImobBanco.SetaMensagensCNAB(liCodDocumento, lICodGrupo: LongInt;
  sMensagens: array of String; bApagaMensagens: Boolean): Boolean;
Var
  sSql: String;
  X,iMax: Integer;
  aMensagens: Array [0..9] of String;
Begin

  If (liCodDocumento = -1) And (liCodGrupo = -1) Then
      Result := False
  Else
  Begin
       If bApagaMensagens Then
       Begin
         If (liCodDocumento <> -1) And (liCodGrupo <> -1) Then
             sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '
                     + IntToStr(liCodDocumento) + ' AND CODGRUPOCNAB = '
                     + IntToStr(liCodGrupo)
         Else
            If (liCodDocumento <> -1) Then
                sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = '
                     + IntToStr(liCodDocumento)
            Else
                sSql := 'DELETE FROM MENSAGENSCNAB WHERE CODGRUPOCNAB = '
                     + IntToStr(liCodGrupo);

         If Not TCtrlImobDocumento(Owner).ExecSql(sSQl) Then
         begin
            TCtrlImobDocumento(Owner).MessageInfo := 'Erro ao deletar mensagens para o documento' + IntToStr(liCodDocumento) + '.' + (#13+#10) + TCtrlImobDocumento(Owner).MessageInfo;
            Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
         end;
       End;

       iMax := High(sMensagens);
       If iMax > 9 Then iMax := 9;
       For x:=0 to High(aMensagens) do aMensagens[x] := '';
       For X:=0 To iMax Do
           aMensagens[x] := Copy(sMensagens[x],1,69);

       sSql := ' INSERT INTO MENSAGENSCNAB (IDMENSAGENSCNAB, CODDOCUMENTO, CODGRUPOCNAB, ' +
               ' MENSAGEM1, MENSAGEM2, MENSAGEM3, MENSAGEM4, MENSAGEM5, ' +
               ' MENSAGEM6, MENSAGEM7, MENSAGEM8, MENSAGEM9, MENSAGEM10) VALUES (' +
               IntToStr(TCtrlImobDocumento(Owner).GetSequence('MENSAGENSCNAB'));

       if liCodDocumento = -1 then
          sSql := sSql + ', NULL'
       else
          sSql := sSql + ', ' + IntToStr(liCodDocumento);

       if liCodGrupo = -1 then
          sSql := sSql + ', NULL'
       else
          sSql := sSql + ', ' + IntToStr(liCodGrupo);

       For X:=0 To High(aMensagens) Do
           sSql := sSql + ', ''' + Copy(aMensagens[X],1,69) + '''';

       sSql := sSql + ')';

       Result := TCtrlImobDocumento(Owner).ExecSql(sSQl);

       If Not Result Then
       begin
          TCtrlImobDocumento(Owner).MessageInfo := 'Erro ao inserir mensagens para o documento' + IntToStr(liCodDocumento) + '.' + (#13+#10) + TCtrlImobDocumento(Owner).MessageInfo;
          Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
       end;
  End;
end;


{ TLanctoImobDocum }

procedure TLanctoImobDocum.Clear;
begin
  inherited;
  FCodDocumento := 0;
  FNumLancto := 0;
  fIdModulo := 0;
end;

constructor TLanctoImobDocum.Create(Aowner: TCmControlObject);
begin
  inherited;
  FIdPessoa := 0;
  Clear;
end;

destructor TLanctoImobDocum.Destroy;
begin
  inherited;

end;

procedure TLanctoImobDocum.SetCodDocumento(const Value: Double);
begin
  FCodDocumento := Value;
end;

procedure TLanctoImobDocum.SetDataBaseName(const Value: String);
begin
  inherited;
end;

procedure TLanctoImobDocum.SetIdModulo(const Value: LongInt);
begin
  FIdModulo := Value;
end;

procedure TLanctoImobDocum.SetIdPessoa(const Value: LongInt);
begin
  FIdPessoa := Value;
end;

procedure TLanctoImobDocum.SetNumLancto(const Value: LongInt);
begin
  FNumLancto := Value;
end;

procedure TLanctoImobDocum.SetValues(dDatalancto: TDateTime; liCoddocumento,
   liNumlancto: LongInt; rVlrliquido, rValorOM, rValor: Double;
   liUnidnegoc, liPlncodigo, liNumlotemanual, liIdusuarioinclusao,
   liIdpessoa, liIdnflivro, liEstorno, liCodtipdoc, liCoddocinss,
   liCodalterador: LongInt; sOperacao, sNumrecibo, sNumnf, sNumfatura,
   sHistoricocompl, sFlgtipofatura, sFlgrecebeunf, sFlgfatemitida,
   sDebcre: String; liIdModulo: LongInt; liPlanoConta: LongInt; bUsaPlanoPatro: Boolean;
   bContabiliza: Boolean = False; iCodPortForma: Integer = 0; iDiasFloat: Integer = 0;
   sContaBaixa: String = ''; liSubContaBaixa: Integer = 0;
   rVlrDifContab:double = 0 //Darivaldo Alencar SOL201128_18374
   ; rIdTipoServico: LongInt = -1; rIdProcesso : LongInt = -1; rValorRetencao: Double = 0 //Cássio Rovaroto - SIG nº 115585
   ; rIDENVIODOCUMENTO : Double = 0  //Ewerton Beltramini - SIG 116142
   );
Var
   iNovoItem: Integer;
Begin
   If (Trim(sDebCre) <> 'C') And (Trim(sDebCre) <> 'D') Then
   begin
      TCtrlImobDocumento(Owner).MessageInfo := 'DebCre inválido para o CodDocumento: ' + IntToStr(liCoddocumento) + ' e NumLancto: ' + IntToStr(liNumlancto);
      Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
   end;

   iNovoItem := TCtrlImobDocumento(fOwner)._LstLanctoDocum.Add(TDbLanctodocum.Create(fOwner));
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).DataBaseName := DataBaseName;

   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Contabiliza := bContabiliza;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).CodPortForna := iCodPortForma;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).DiasFloat := iDiasFloat;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).IdModulo := liIdModulo;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).PlanoConta := liPlanoConta;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).UsaPlanoPatro := bUsaPlanoPatro;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).ContaBaixa := sContaBaixa;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).SubContaBaixa := liSubContaBaixa;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).VlrDifContab := rVlrDifContab;//Darivaldo Alencar SOL201128_18374

   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Datalancto.AsDateTime := dDatalancto;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Coddocumento.AsFloat := liCoddocumento;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Numlancto.AsFloat := liNumlancto;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Vlrliquido.AsFloat := TCtrlImobDocumento.RoundCMLocal(rVlrliquido,2);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Valoroutramoeda.AsFloat := TCtrlImobDocumento.RoundCMLocal(rValorOM,2);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Valor.AsFloat := rValor;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Idusuarioinclusao.AsFloat := liIdusuarioinclusao;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Idpessoa.AsFloat := liIdpessoa;
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Operacao.AsString := IntToStr(Integer(TCtrlImobDocumento(fOwner)._OperacaoDocLancImob));
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Historicocompl.AsString := Copy(Trim(sHistoricocompl),1,100);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Debcre.AsString := Trim(sDebcre);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Numrecibo.AsString := Trim(sNumrecibo);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Numnf.AsString := Trim(sNumnf);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Numfatura.AsString := Trim(sNumfatura);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Flgtipofatura.AsString := Trim(sFlgtipofatura);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Flgrecebeunf.AsString := Trim(sFlgrecebeunf);
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Flgfatemitida.AsString := Trim(sFlgfatemitida);
   //Cássio Rovaroto - SIG nº 115585 - Início
   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).ValorBaseRetencao.AsFloat := rValorRetencao;

   if rIdTipoServico <> -1 then
    TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).IdTipoServico.AsFloat := rIdTipoServico;

   if rIdProcesso <> -1 then
     TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).IdProcesso.AsFloat := rIdProcesso;
   //Cássio Rovaroto - SIG nº 115585 - Fim

   If (liUnidnegoc = 0) Or (liUnidnegoc < -1) Then
     TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Unidnegoc.Clear
   Else
     TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Unidnegoc.AsFloat := liUnidnegoc;

   TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).IDENVIODOCUMENTO.AsFloat := rIDENVIODOCUMENTO;  //Ewerton Beltramini - SIG 116142

   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Plncodigo, liPlncodigo);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Numlotemanual, liNumlotemanual);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Idnflivro, liIdnflivro);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Estorno, liEstorno);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Codtipdoc, liCodtipdoc);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Coddocinss, liCoddocinss);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbLanctodocum(TCtrlImobDocumento(fOwner)._LstLanctoDocum[iNovoItem]).Codalterador, liCodalterador);
end;

{ TRateioImobDocum }

procedure TRateioImobDocum.SetValues(rValor, rValorOM,
  rVlrresorcamen: Double; liIdrateiodocum, liIdpessoa, liCoddocumento,
  liUnidnegoc, liMoecodigo, liIdusuarioinclusao, liIdreservaorcamen,
  liPlano, liIdplanoprev, liIdpatro, liIdprograma, liIdprocesso,
  liIdempresa: LongInt; sCodtiprecdes, sRecpag, sCodcentrorespon,
  sCodcentrocusto, sNumimovel: String;
  const bSegregaOrigem: boolean = true;
  const IdPlanoVirtual: integer = 0;
  const IdSegregaContr: integer = 0;
  sNumContrato: Integer = -1
  );
Var
   iNovoItem: Integer;
   bFimRateioOrigem : boolean;

   //***************************************************************************
   // gerar o rateio da rateio docum na origem (Segregação Virtual na Origem)
   //***************************************************************************
   function SegregaRateioDocumOrigem: boolean;
   var bSegregaLanctoOrigem: boolean;
       salvaIdSegregaContr : integer;
       _CdsDtSegrega : TClientDataSet;
   begin
     _CdsDtSegrega := TClientDataSet.Create(nil);
     _CdsDtSegrega.data := TCtrlDocumento(Owner).GetDataPacket('SELECT DTSEGREGAVIRTUAL FROM PARAMGLOBAL');
     Result := false;  // caso o result seja true o lançamento foi interceptado

     bSegregaLanctoOrigem := (liIdplanoprev = TCtrlImobDocumento(fOwner)._Segregacao.PlanoPrevComum) and
                             (liIdpatro     = TCtrlImobDocumento(fOwner)._Segregacao.PatroComum)and
                             (TCtrlImobDocumento(fOwner)._Segregacao.SegregaOrComum) and
                             (TCtrlImobDocumento(fOwner)._Documento.IdSegregaCriter.AsInteger > 0);

     if (not bSegregaLanctoOrigem) and (TCtrlImobDocumento(fOwner)._Segregacao.PlanoPrevAdm > 0) then
        bSegregaLanctoOrigem := (liIdplanoprev = TCtrlImobDocumento(fOwner)._Segregacao.PlanoPrevAdm) and
                             (liIdpatro     = TCtrlImobDocumento(fOwner)._Segregacao.PatroComum)and
                             (TCtrlImobDocumento(fOwner)._Segregacao.SegregaOrAdm) and
                             (TCtrlImobDocumento(fOwner)._Documento.IdSegregaCriter.AsInteger > 0);

     if ( bSegregaLanctoOrigem ) and
        ( Trunc ( TCtrlImobDocumento(fOwner)._Documento.Dataemissao.asdatetime ) >=
          Trunc ( _CdsDtSegrega.FieldByName('DTSEGREGAVIRTUAL').AsDateTime ) )  then
    begin

       if not TCtrlImobDocumento(fOwner)._Segregacao.RateiaValor( rValor,
                                  TCtrlImobDocumento(fOwner)._Documento.IdSegregaCriter.AsInteger,
                                  TCtrlImobDocumento(fOwner)._Documento.Dataemissao.asdatetime) then
       Begin
         TCtrlImobDocumento(fOwner).MessageInfo := TCtrlImobDocumento(fOwner)._Segregacao.Messageinfo;
         raise exception.create (TCtrlImobDocumento(fOwner)._Segregacao.MessageInfo);
       end;

       // fazer o rateio aqui;
       TCtrlImobDocumento(fOwner)._Segregacao.CdsRateio.first;

       salvaIdSegregaContr := TCtrlImobDocumento(fOwner)._Segregacao.GetSegregaCtrl;

       while not TCtrlImobDocumento(fOwner)._Segregacao.CdsRateio.eof do
       begin
         SetValues(TCtrlImobDocumento(fOwner)._Segregacao.CdsRateio.FieldByName('VALOR').AsFloat,
           rValorOM, rVlrresorcamen, liIdrateiodocum, liIdpessoa, liCoddocumento,
           liUnidnegoc, liMoecodigo, liIdusuarioinclusao, liIdreservaorcamen, liPlano,
           TCtrlImobDocumento(fOwner)._Segregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
           TCtrlImobDocumento(fOwner)._Segregacao.CdsRateio.FieldByName('IDPATRO').AsInteger,
           liIdprograma, liIdprocesso, liIdempresa, sCodtiprecdes, sRecpag, sCodcentrorespon,
           sCodcentrocusto, sNumimovel, false,
           liIdplanoprev, salvaIdSegregaContr);

         TCtrlImobDocumento(fOwner)._Segregacao.CdsRateio.next;
         Result := true;
       end;
      end;
    _CdsDtSegrega.Close;
    FreeAndNil(_CdsDtSegrega);
   end;

   function SegregaRateioDocumOrigemImob: boolean;
   var bSegregaLanctoOrigem: boolean;
       salvaIdSegregaContr : integer;
       _CdsDtSegrega : TClientDataSet;
       iNovoItem : Integer;
   begin
    Result := false;
    if not TCtrlImobDocumento(fOwner)._ImobSegregacao.RateiaValorOrigem( rValor,
                                TCtrlImobDocumento(fOwner)._Documento.IdSegregaCriter.AsInteger,
                                TCtrlImobDocumento(fOwner)._Documento.Dataemissao.asdatetime,
                                StrToInt(sNumimovel), sNumContrato) then
    begin
      TCtrlImobDocumento(fOwner).MessageInfo := TCtrlImobDocumento(fOwner)._ImobSegregacao.Messageinfo;
      raise exception.create (TCtrlImobDocumento(fOwner)._ImobSegregacao.MessageInfo);
    end;

    // fazer o rateio aqui;
    TCtrlImobDocumento(fOwner)._ImobSegregacao.CdsRateio.first;
    salvaIdSegregaContr := TCtrlImobDocumento(fOwner)._ImobSegregacao.GetSegregaCtrl;

    while not TCtrlImobDocumento(fOwner)._ImobSegregacao.CdsRateio.eof do
    begin
      SetValues(TCtrlImobDocumento(fOwner)._ImobSegregacao.CdsRateio.FieldByName('VALOR').AsFloat,
        rValorOM, rVlrresorcamen, liIdrateiodocum, liIdpessoa, liCoddocumento,
        liUnidnegoc, liMoecodigo, liIdusuarioinclusao, liIdreservaorcamen, liPlano,
        TCtrlImobDocumento(fOwner)._ImobSegregacao.CdsRateio.FieldByName('IDPLANOPREV').AsInteger,
        TCtrlImobDocumento(fOwner)._ImobSegregacao.CdsRateio.FieldByName('IDPATRO').AsInteger,
        liIdprograma, liIdprocesso, liIdempresa, sCodtiprecdes, sRecpag, sCodcentrorespon,
        sCodcentrocusto, sNumimovel, false,
        liIdplanoprev, salvaIdSegregaContr);
       Result := true;
       TCtrlImobDocumento(fOwner)._ImobSegregacao.CdsRateio.next;
    end;
   end;

begin
   bFimRateioOrigem := False;

   If (Trim(sCodcentrocusto) <> '') And (liIdempresa <= 0) Then
   begin
      TCtrlImobDocumento(Owner).MessageInfo := 'IdEmpresa não informado. É obrigatório pois o Centro de Custo esta preenchido';
      Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
   end;

   if Trim(sCodcentrorespon) = '' then
   sCodcentrorespon := '9999999999';

   if not TCtrlImobDocumento(fOwner)._PlanPrevContabPatro.ValidaPlanoPatro ( liIdpatro, liIdplanoprev ) then
   begin
      TCtrlImobDocumento(Owner).MessageInfo := 'Não existe relacionamento entre Patrocinadora e Plano escolhidos!';
      Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
   end;

   iNovoItem := TCtrlImobDocumento(fOwner)._LstRateioDocum.Add(TDbRateiodocum.Create(fOwner));
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).DataBaseName := DataBaseName;

   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Valor.AsFloat := TCtrlImobDocumento.RoundCMLocal(rValor,2);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Valoroutramoeda.AsFloat := TCtrlImobDocumento.RoundCMLocal(rValorOM,2);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Vlrresorcamen.AsFloat := TCtrlImobDocumento.RoundCMLocal(rVlrresorcamen,2);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idpessoa.AsFloat := liIdpessoa;
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Coddocumento.AsFloat := liCoddocumento;
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idusuarioinclusao.AsFloat := liIdusuarioinclusao;
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idrateiodocum.AsFloat := liIdrateiodocum;

   If (liUnidnegoc = 0) Or (liUnidnegoc < -1) Then
     TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Unidnegoc.Clear
   Else
     TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Unidnegoc.AsFloat := liUnidnegoc;

   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Moecodigo, liMoecodigo);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idreservaorcamen, liIdreservaorcamen);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Plano, liPlano);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idplanoprev, liIdplanoprev);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idpatro, liIdpatro);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idprograma, liIdprograma);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idprocesso, liIdprocesso);
   TCtrlImobDocumento(fOwner).SetFieldValue(TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Idempresa, liIdempresa);

   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Codtiprecdes.AsString := Trim(sCodtiprecdes);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Recpag.AsString := Trim(sRecpag);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Codcentrorespon.AsString := Trim(sCodcentrorespon);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Codcentrocusto.AsString := Trim(sCodcentrocusto);
   TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).Numimovel.AsString := Trim(sNumimovel);

   if IdPlanoVirtual > 0 then
   begin
     TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).IdPlanoVirtual.asInteger := IdPlanoVirtual;
     TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).IdSegregaContr.asInteger := IdSegregaContr;
   end
   else
   begin
     TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).IdPlanoVirtual.Clear;
     TDbRateiodocum(TCtrlImobDocumento(fOwner)._LstRateioDocum[iNovoItem]).IdSegregaContr.Clear;
   end;
end;

{ TCCBaixasxImobDocum }

procedure TCCBaixasxImobDocum.SetValues(rValor: Double; liIdCcBaixasxDocum,
  liIdpessoa, liCodDocumento, liUnidNegoc, liPlano, liIdplanoPrev,
  liIdPatro, liIdSegregaCriter: Integer; sPlaConta: String);
Var
   iNovoItem: Integer;
begin
   if not TCtrlImobDocumento(fOwner)._PlanPrevContabPatro.ValidaPlanoPatro ( liIdpatro, liIdplanoprev ) then
   begin
     TCtrlImobDocumento(Owner).MessageInfo := 'Não existe relacionamento entre Patrocinadora e Plano escolhidos!';
     Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
   end;

   if not TCtrlImobDocumento(fOwner)._Segregacao.Active then
     TCtrlImobDocumento(fOwner)._Segregacao.GetParams(liIdPessoa);

   if (TCtrlImobDocumento(fOwner)._Segregacao.SegregaVirtual) then begin
      if liIdplanoprev = TCtrlImobDocumento(fOwner)._Segregacao.PlanoPrevComum then begin  // PLANO COMUM
        if TCtrlImobDocumento(fOwner)._Segregacao.SegregaOrComum then begin  // segregado na origem
           TCtrlImobDocumento(Owner).MessageInfo := 'Para lançamentos no plano "COMUM", que é segregado na origem, não pode haver múltiplas contas de baixa!';
           Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
        end;
      end else if liIdplanoprev = TCtrlImobDocumento(fOwner)._Segregacao.PlanoPrevAdm then begin  // PLANO ADMINISTRATIVO
        if TCtrlImobDocumento(fOwner)._Segregacao.SegregaOrAdm then begin  // segregado na origem
           TCtrlImobDocumento(Owner).MessageInfo := 'Para lançamentos no plano "ADMINISTRATIVO", que é segregado na origem, não pode haver múltiplas contas de baixa!';
           Raise Exception.Create(TCtrlImobDocumento(Owner).MessageInfo);
        end;
      end;
   end;

   iNovoItem := TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum.Add(TDbCcBaixasxDocum.Create(fOwner));
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).DataBaseName := DataBaseName;

   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Valor.AsFloat := TCtrlImobDocumento.RoundCMLocal(rValor,2);
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).IdCcBaixasxDocum.AsFloat := liIdCcBaixasxDocum;
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Idpessoa.AsFloat := liIdpessoa;
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Coddocumento.AsFloat := liCoddocumento;

   If (liUnidnegoc = 0) Or (liUnidnegoc < -1) Then
     TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Unidnegoc.Clear
   Else
     TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Unidnegoc.AsFloat := liUnidnegoc;

   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Plano.AsInteger := liPlano;
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Idplanoprev.AsInteger := liIdplanoprev;
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Idpatro.AsInteger := liIdpatro;
   TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Placonta.AsString := sPlaconta;

   if liIdsegregacriter = -1 then begin
     TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Idsegregacriter.Clear;
   end else begin
     TDbCcBaixasxDocum(TCtrlImobDocumento(fOwner)._LstCcBaixasxDocum[iNovoItem]).Idsegregacriter.AsInteger := liIdsegregacriter;
   end;
end;

{ TImobSaldo }

procedure TImobSaldo.CalculaSaldo(iCodDocumento: Double;
  dDataLimite: TDateTime);
Var
  sFiltroData: String;
begin
  fValor := 0.00;
  fValorOM := 0.00;

  If dDataLimite = 0 Then
    sFiltroData := ''
  Else
    sFiltroData := ' AND LANC.DATALANCTO <= TO_DATE(''' + DateToStr(dDataLimite) + ''',''DD/MM/YYYY'') ';

  _Cds.Data := TCtrlImobDocumento(Owner).GetDataPacket(' SELECT ' +
                             '  SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS VALOR, ' +
                             '  SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA,LANC.VALOROUTRAMOEDA * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOROUTRAMOEDA * -1,LANC.VALOROUTRAMOEDA))) AS VALOROUTRAMOEDA ' +
                             ' FROM ' +
                             '  LANCTODOCUM LANC, DOCUMENTO DOC ' +
                             ' WHERE ' +
                             '    DOC.CODDOCUMENTO = ' + FloatToStr(iCodDocumento) + sFiltroData +
                             ' AND DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ');

  If Not _Cds.IsEmpty Then
  Begin
    fValor := _Cds.Fields[0].AsFloat;
    fValorOM := _Cds.Fields[1].AsFloat;
  End;

  If _Cds.Active Then _Cds.Close;
end;

procedure TImobSaldo.Clear;
begin
  inherited;
  fValor := 0;
  fValorOM  := 0;
  fValorBruto := 0;
end;

procedure TImobSaldo.GetValorBruto(iCodDocumento: Double);
begin
  _Cds.Data := TCtrlImobDocumento(Owner).GetDataPacket(' SELECT LANC.VALOR ' +
                                                   ' FROM LANCTODOCUM LANC, DOCUMENTO DOC ' +
                                                   ' WHERE DOC.CODDOCUMENTO = ' + FloatToStr(iCodDocumento) + ' AND ' +
                                                   '       DOC.OPERACAO = LANC.OPERACAO AND '+
                                                   '       DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ');
  If Not _Cds.IsEmpty Then
    fValorBruto := _Cds.Fields[0].AsFloat;
end;

procedure TImobSaldo.SetValorBruto(const Value: Double);
begin
  FValorBruto := Value;
end;

{ TImobForCli }

constructor TImobForCli.Create(Aowner: TCmControlObject);
begin
   inherited;
   _DbEmpresaForn    := TDbEmpresaForn.Create(Aowner);
   _DbFornServ       := TDbFornServ.Create(Aowner);
   _DbEmpresaCliente := TDbEmpresaCliente.Create(Aowner);
   _DbClientePess    := TDbClientePess.Create(Aowner);
   _DbFornXRamo      := TDbFornXRamo.Create(Aowner);
   _DbPessoa         := TDbPessoa.Create(Aowner);
end;

procedure TImobForCli.CriaCliente(liIdpessoa, liIdEmpresa, liCodsubconta,
  liPlano, liIdTipocli: LongInt; sCcusto, sContacadianto, sContacCliente,
  sContacdespesa: string);
begin
  CriaClientepess(liIdpessoa, liIdTipocli);

  CriaEmpresaCli(liIdpessoa, liIdEmpresa, liPlano, liCodsubconta, sCcusto,
                 sContacadianto, sContacdespesa, sContacCliente);
end;

procedure TImobForCli.CriaClientepess(liIdpessoa, liIdTipoCli: LongInt);
begin
  _DbClientePess.Clear;
  _DbClientePess.Idpessoa.AsFloat := liIdpessoa;

  If Not _DbClientePess.LoadFromDb Then
  Begin
    _DbClientePess.Clear;
    _DbClientePess.Idpessoa.AsFloat := liIdpessoa;
    _DbClientePess.Idtipocliente.AsFloat := liIdTipoCli;

    If Not _DbClientePess.Insert Then Raise EdataBaseError.Create(_DbClientePess.MessageInfo);
  End;

  If _Cds.Active Then _Cds.Close;
end;

procedure TImobForCli.CriaEmpresaCli(liIdpessoa, liIdEmpresa, liPlano,
  liCodsubconta: LongInt; sCcusto, sContacadianto, sContacReceita,
  sContacCliente: string);
begin
  _DbEmpresaCliente.Clear;
  _DbEmpresaCliente.Idforcli.AsFloat := liIdPessoa;
  _DbEmpresaCliente.Idpessoa.AsFloat := liIdempresa;

  If Not _DbEmpresaCliente.LoadFromDb Then
  Begin
    _DbEmpresaCliente.Clear;

    _DbEmpresaCliente.Idforcli.AsFloat := liIdPessoa;
    _DbEmpresaCliente.Idpessoa.AsFloat := liIdempresa;

    If (Trim(sCcusto) <> '') Then
    Begin
      _DbEmpresaCliente.Idempresa.AsFloat := liIdempresa;
      _DbEmpresaCliente.Codcentrocusto.AsString := Trim(sCcusto);
    End
    Else
    Begin
      _DbEmpresaCliente.Idempresa.Clear;
      _DbEmpresaCliente.Codcentrocusto.Clear;
    End;

    If (liPlano > 0) Then
    Begin
      _DbEmpresaCliente.Plano.AsFloat := liPlano;
      _DbEmpresaCliente.Contaccliente.AsString := Trim(sContacCliente);
      _DbEmpresaCliente.Contacreceita.AsString := Trim(sContacReceita);
      _DbEmpresaCliente.Contacadiantamento.AsString := Trim(sContacadianto);
      TCtrlImobDocumento(fOwner).SetFieldValue(_DbEmpresaCliente.Codsubconta, liCodSubConta);
    End
    Else
    Begin
      _DbEmpresaCliente.Plano.Clear;
      _DbEmpresaCliente.Contaccliente.Clear;
      _DbEmpresaCliente.Contacreceita.Clear;
      _DbEmpresaCliente.Contacadiantamento.Clear;
      _DbEmpresaCliente.Codsubconta.Clear;
    End;

    If Not _DbEmpresaCliente.Insert Then Raise EdataBaseError.Create(_DbEmpresaCliente.MessageInfo);
  End;

  If _Cds.Active Then _Cds.Close;
end;

procedure TImobForCli.CriaEmpresaForn(liIdPessoa, liIdempresa, liPlano,
  liCodSubConta: LongInt; sCcusto, sContacadianto, sContacdespesa,
  sContacforn: string);
begin
   _DbEmpresaForn.Clear;
   _DbEmpresaForn.Idforcli.AsFloat := liIdPessoa;
   _DbEmpresaForn.Idpessoa.AsFloat := liIdempresa;

  If Not _DbEmpresaForn.LoadFromDb Then
  Begin
    _DbEmpresaForn.Clear;
    _DbEmpresaForn.Idforcli.AsFloat := liIdPessoa;
    _DbEmpresaForn.Idpessoa.AsFloat := liIdempresa;

    If (Trim(sCcusto) <> '') Then
    Begin
      _DbEmpresaForn.Idempresa.AsFloat := liIdempresa;
      _DbEmpresaForn.Codcentrocusto.AsString := Trim(sCcusto);
    End
    Else
    Begin
      _DbEmpresaForn.Idempresa.Clear;
      _DbEmpresaForn.Codcentrocusto.Clear;
    End;

    If (liPlano > 0) Then
    Begin
      _DbEmpresaForn.Plano.AsFloat := liPlano;
      _DbEmpresaForn.Contacforn.AsString := Trim(sContacforn);
      _DbEmpresaForn.Contacdespesa.AsString := Trim(sContacdespesa);
      _DbEmpresaForn.Contacadiantamento.AsString := Trim(sContacadianto);
      TCtrlImobDocumento(fOwner).SetFieldValue(_DbEmpresaForn.Codsubconta, liCodSubConta);
    End
    Else
    Begin
      _DbEmpresaForn.Plano.Clear;
      _DbEmpresaForn.Contacforn.Clear;
      _DbEmpresaForn.Contacdespesa.Clear;
      _DbEmpresaForn.Contacadiantamento.Clear;
      _DbEmpresaForn.Codsubconta.Clear;
    End;

    If Not _DbEmpresaForn.Insert Then Raise EdataBaseError.Create(_DbEmpresaForn.MessageInfo);
  End;

  If _Cds.Active Then _Cds.Close;
end;

procedure TImobForCli.CriaFornecedor(liIdPessoa, liIdEmpresa, liCodsubconta,
  liPlano, liIdRamoForne: LongInt; sCcusto, sContacadianto, sContacforn,
  sContacdespesa: String);
begin
  CriaFornserv(liIdPessoa);

  CriaEmpresaForn(liIdPessoa, liIdEmpresa, liPlano, liCodsubconta, sCcusto,
                  sContacadianto, sContacdespesa, sContacforn);

  If (liIdRamoForne > 0) then
     InsereRamoXForn(liIdpessoa, liIdRamoForne);
end;

procedure TImobForCli.CriaFornserv(liIdpessoa: LongInt);
begin
  _DbFornServ.Clear;
  _DbFornServ.Idpessoa.AsFloat := liIdpessoa;

  If Not _DbFornServ.LoadFromDb Then
  Begin
      _DbFornServ.Clear;
      _DbFornServ.Idpessoa.AsFloat := liIdpessoa;
      _DbFornServ.Flgass.AsFloat := 0;

      If Not _DbFornServ.Insert Then Raise EdataBaseError.Create(_DbFornServ.MessageInfo);
  End;

  If _Cds.Active Then _Cds.Close;
end;

function TImobForCli.CriaPessoa(sNome, sRazaoSocial, sDocumento: String;
  TipoPessoa: TTipoPessoa): Double;
begin
  _DbPessoa.Clear;
  _DbPessoa.Nome.AsString := sNome;
  _DbPessoa.Razaosocial.AsString := sRazaoSocial;
  _DbPessoa.Numdocumento.AsString := sDocumento;

  Case TipoPessoa of
    tpJuridica: _DbPessoa.Tipo.AsString := 'J';
    tpFisica: _DbPessoa.Tipo.AsString := 'F';
  End;

  If _DbPessoa.Insert Then
     Result := _DbPessoa.Idpessoa.AsFloat
  Else
  Begin
     Result := -1;
     TCtrlImobDocumento(Owner).MessageInfo := _DbFornServ.MessageInfo
  End;
end;

destructor TImobForCli.Destroy;
begin
  FreeAndNil(_DbEmpresaForn);
  FreeAndNil(_DbFornServ);
  FreeAndNil(_DbEmpresaCliente);
  FreeAndNil(_DbClientePess);
  FreeAndNil(_DbFornXRamo);
  FreeAndNil(_DbPessoa);
  inherited;
end;

procedure TImobForCli.InsereRamoXForn(liIdpessoa, liIdRamoForn: LongInt);
begin
  _DbFornXRamo.Clear;
  _DbFornXRamo.Idpessoa.AsFloat := liIdpessoa;
  _DbFornXRamo.Idramofornecedor.AsFloat := liIdRamoForn;

  If Not _DbFornXRamo.LoadFromDb Then
  Begin
     _DbFornXRamo.Clear;
     _DbFornXRamo.Idpessoa.AsFloat := liIdpessoa;
     _DbFornXRamo.Idramofornecedor.AsFloat := liIdRamoForn;

     If Not _DbFornXRamo.Insert Then Raise EdataBaseError.Create(_DbFornXRamo.MessageInfo);
  End;

  If _Cds.Active Then _Cds.Close;
end;

function TImobForCli.Inserir(liIdPessoa, liIdEmpresa, liCodsubconta, liPlano,
  liIdRamoTipocli: LongInt; sCcusto, sContacadianto, sContacForCli,
  sContacdespesa: String; TipoForCli: TTipoForCli): Boolean;
Begin
   Result := False;

   _DbPessoa.Idpessoa.AsFloat := liIdPessoa;

   If _DbPessoa.LoadFromDb Then
   Begin
      Case TipoForCli of
      tfcFornecedor:
         CriaFornecedor(liIdPessoa, liIdEmpresa, liCodsubconta, liPlano,
                        liIdRamoTipocli, sCcusto, sContacadianto, sContacForCli,
                        sContacdespesa);
      tfcCliente:
         CriaCliente(liIdPessoa, liIdEmpresa, liCodsubconta, liPlano,
                     liIdRamoTipocli, sCcusto, sContacadianto, sContacForCli,
                     sContacdespesa);
      End;

      If (_DbPessoa.RazaoSocial.IsNull) And (Not _DbPessoa.Nome.IsNull) Then
      Begin
         _DbPessoa.RazaoSocial.AsString := _DbPessoa.Nome.AsString;
         If Not _DbPessoa.Update Then Raise EdataBaseError.Create(_DbPessoa.MessageInfo);
      End;

      If (Not _DbPessoa.RazaoSocial.IsNull) And (_DbPessoa.Nome.IsNull) Then
      Begin
         _DbPessoa.Nome.AsString := _DbPessoa.RazaoSocial.AsString ;
         If Not _DbPessoa.Update Then Raise EdataBaseError.Create(_DbPessoa.MessageInfo);
      End;

      Result := True;
   End
   Else
     TCtrlImobDocumento(Owner).MessageInfo := 'O pessoa referente ao IDPessoa ' + IntToStr(liIdPessoa) + ' não existe no banco';
end;

procedure TImobForCli.SetDataBaseName(const Value: String);
begin
  inherited;
  _DbEmpresaForn.DataBaseName := Value;
  _DbFornServ.DataBaseName := Value;
  _DbEmpresaCliente.DataBaseName := Value;
  _DbClientePess.DataBaseName := Value;
  _DbFornXRamo.DataBaseName := Value;
  _DbPessoa.DataBaseName := Value;
end;


{ TImobLote }

function TImobLote.BaixaDoc(licodocumento, liNumlote: LongInt): Boolean;
begin
   If liNumlote > 0 Then
      Result := TCtrlImobDocumento(Owner).ExecSql('UPDATE LOTEXDOCUM SET FLGBAIXA= ''B'' WHERE CODDOCUMENTO = '  + InttoStr(licodocumento) + ' AND NUMLOTE = ' + InttoStr(liNumlote))
   Else
      Result := TCtrlImobDocumento(Owner).ExecSql('UPDATE LOTEXDOCUM SET FLGBAIXA= ''B'' WHERE CODDOCUMENTO = '  + InttoStr(licodocumento));
end;

function TImobLote.BaixaLote(liNumlote: LongInt): Boolean;
begin
   Result := TCtrlImobDocumento(Owner).ExecSql('UPDATE LOTEPAGTO SET FLAGCANCEL = ''B'' WHERE NUMLOTE = '+ IntToStr(liNumlote)) And
             TCtrlImobDocumento(Owner).ExecSql('UPDATE LOTEXDOCUM SET FLGBAIXA= ''B'' WHERE  NUMLOTE = ' + InttoStr(liNumlote));
end;

procedure TImobLote.CalculaSaldo(liNumLote: LongInt);
begin
   _Cds.Data := TCtrlImobDocumento(Owner).GetDataPacket('SELECT SUM(LX.VALOR)AS VALORTOTAL  ' +
                              ' FROM LOTEXDOCUM LX, LOTEPAGTO LP ' +
                              ' WHERE (LX.NUMLOTE = ' + IntToStr(liNumLote) + ') AND (LP.FLAGCANCEL IS NULL) AND ' +
                              '       (LX.FLGBAIXA IS NULL) AND (LX.NUMLOTE = LP.NUMLOTE)');
   If _Cds.IsEmpty Then
     fSaldo := 0
   Else
     fSaldo := _Cds.Fields[0].Asfloat;

   If _Cds.Active Then _Cds.Close;

   _Cds.Data := TCtrlImobDocumento(Owner).GetDataPacket('SELECT SUM(VALOR) FROM LOTEXDOCUM WHERE NUMLOTE = '+ IntToStr(liNumLote));

   If _Cds.IsEmpty Then
      fValor := 0
   Else
      fValor := _Cds.Fields[0].Asfloat;

   If _Cds.Active Then _Cds.Close;
end;

procedure TImobLote.Clear;
begin
  inherited;
  fSaldo := 0;
  fValor := 0;
  fNumLote := 0;
  fCodPortForma := 0;
end;

function TImobLote.GetNumLote(liCodDocumento: LongInt): Boolean;
begin
   _Cds.Data := TCtrlImobDocumento(Owner).GetDataPacket('SELECT LX.NUMLOTE, LP.CODPORTFORMA ' +
                                                    ' FROM LOTEXDOCUM LX, LOTEPAGTO LP ' +
                                                    ' WHERE (LX.CODDOCUMENTO = ' + IntToStr(liCodDocumento) + ') AND (LP.FLAGCANCEL IS NULL) AND ' +
                                                    '       (LX.FLGBAIXA IS NULL) AND (LX.NUMLOTE = LP.NUMLOTE)');

   If Not _Cds.IsEmpty Then
   Begin
     fCodPortForma := _Cds.FieldByName('CODPORTFORMA').AsInteger;
     fNumLote      := _Cds.FieldByName('NUMLOTE').AsInteger;
     Result        := True;
   End
   Else
   Begin
     fCodPortForma := 0;
     fNumLote      := 0;
     Result        := False;
   End;

   If _Cds.Active Then _Cds.Close;
end;

function TImobLote.LiberaEmissao(liNumLote: LongInt;
  bExcluiLote: Boolean): Boolean;
begin
   If bExcluiLote Then
     Result := TCtrlImobDocumento(Owner).ExecSql('DELETE LOTEXDOCUM WHERE NUMLOTE = '+ IntToStr(liNumLote)) And
               TCtrlImobDocumento(Owner).ExecSql('DELETE LOTEPAGTO WHERE NUMLOTE = '+ IntToStr(liNumLote))
   Else
     Result := TCtrlImobDocumento(Owner).ExecSql('UPDATE LOTEPAGTO SET FLAGCANCEL = NULL, FLAGEMISSAO = NULL WHERE NUMLOTE = '+ IntToStr(liNumLote)) And
               TCtrlImobDocumento(Owner).ExecSql('UPDATE LOTEXDOCUM SET FLGBAIXA = NULL WHERE NUMLOTE = '+ IntToStr(liNumLote));
end;


{ TRateioImobLancamento }

procedure TRateioImobLancamento.SetCentroCusto(const Value: String);
begin
  FCentroCusto := Trim(Value);
end;

procedure TRateioImobLancamento.SetIdPatrocinadora(const Value: LongInt);
begin
  FIdPatrocinadora := Value;
end;

procedure TRateioImobLancamento.SetIdPlanoPrev(const Value: LongInt);
begin
  FIdPlanoPrev := Value;
end;

procedure TRateioImobLancamento.SetIdPrograma(const Value: LongInt);
begin
  FIdPrograma := Value;
end;

procedure TRateioImobLancamento.SetIdSegregaCriter(const Value: Integer);
begin
  FIdSegregaCriter := Value;
end;

procedure TRateioImobLancamento.SetPlaConta(const Value: String);
begin
  FPlaConta := Value;
end;

procedure TRateioImobLancamento.SetUnidNegocio(const Value: LongInt);
begin
  FUnidNegocio := Value;
end;

procedure TRateioImobLancamento.SetValor(const Value: Double);
begin
  FValor := TCtrlImobDocumento.RoundCMLocal(Value,2);
end;

procedure TRateioImobLancamento.SetValorom(const Value: Double);
begin
  FValorom := TCtrlImobDocumento.RoundCMLocal(Value,2);
end;

end.
 