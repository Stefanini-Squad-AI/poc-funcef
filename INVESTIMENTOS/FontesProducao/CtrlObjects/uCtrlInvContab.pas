//********************************************************************************************************
// Data	     : 22/06/2010
// Kintana   : 837518
// SOL       : 137567
// Descrição : Na exclusão contábil foi  retirado
//             a verificação do módulo ativo faz integração
//********************************************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_15
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data      : 13/05/2008
// Código    : AL_14
// Pendencia : 27913
// SOL       : 85013
// Desc      : Implementação na função "BuscaDataBloqContab(" que retorna a maior data
//              bloqueada na contabilidade e a mesma estava sendo incrementada e trazendo a
//              próxima data disponível. Foi alterada para o seu devido funcionamento.
//******************************************************************************
// Data      : 12/05/2008
// Código    : AL_13
// Pendencia : 25129
// SOL       : 58645
// Desc      : Implementação do tipo de mercado na IntegraCtbFinModulo, equivale a um
//             sub-modulo de Renda Variável(Opções)
//******************************************************************************
// Data      : 19/09/2007
// Código    : AL_12
// Pendencia :
// SOL       :
// Desc      : Ajuste na exclusão e estorno de planilhas para não fazer nada com
//               plncodigo nulo
//******************************************************************************
// Data      : 20/09/2007
// Código    : AL_11
// Pendencia : 26386
// SOL       :
// Motivo    : Implementação do Plano / Patro na Contabilizacao
//             Implementação de novo algoritimo de busca para parametrização
//               contábil por níveis
//******************************************************************************
// Data	     : 10/10/2007
// Codigo    : AL_10
// Pendência : 26496
// SOL       :
// Função    : Ajuste na contabilização em 3 camadas (Lançamento Financeiro)
//             Ajuste nos processos de lançamento de operação (Mensagens de erro)
//             Utilização do Objeto CtrlPInv nas rotinas contabeis
//******************************************************************************
// Data      : 20/03/2007
// Código    : AL_9
// Pendencia : 24774
// SOL       : 55877
// Desc      : Liga/Desliga a integração contabil financeira por módulo
//******************************************************************************
// Data      : 12/01/2007
// Código    : AL_8
// Pendencia : 23674
// SOL       : 47946
// Desc      : Segregação de Recursos - Ajustes nas rotinas
//******************************************************************************
// Data      : 27/12/2006
// Código    : AL_7
// Pendencia : 24046
// SOL       :
// Desc      : Não excluir a planilha associada ao documento no momento da
//              exclusão do documento
//******************************************************************************
// Data      : 19/12/2006
// Código    : AL_6
// Pendencia :
// SOL       :
// Desc      : BuscaDataBloqContab - Nova rotina para Fundos de Investimento
//******************************************************************************
// Data      : 06/12/2006
// Código    : AL_5
// Pendencia : 23674
// SOL       : 45954
// Desc      : Segregação de Recursos
//******************************************************************************
// Data     : 14/06/2006
// Código   : AL_4
// Pendencia: 20453
// SOL      : 33866
// Desc     : Implementação da Trava Contábil por Módulo
//******************************************************************************
// Data     : 10/06/2005
// Código   : AL_3
// Motivo   : Nova rotina para Exclusão e/ou limpeza de planilha em 3 camadas
//            Nova Rotina para efetuar os lancamentos contabeis
//            Nova propriedade para retornar o PLNCODIGO utilizado
//******************************************************************************
// Data     : 06/06/2005
// Código   : AL_2
// Motivo   : Nova rotina para recuperar o Período e o exercício contábil
//            Acertos na rotina TestaPeriodo
//******************************************************************************
// Data     : 24/05/2005
// Código   : AL_1
// Motivo   : Limpa a MessageInfo na entrada da rotina (qualquer rotina)
//******************************************************************************
//  OBJETO DE CONTROLE DE CONTABILIZAÇÃO
//
//  PROPRIEDADES (Devem ser setadas após a Inicialização):
//      Modulo - Modulo que está utilizando a Control (Sistema.IDMODULO)
//      Empresa - Empresa que utiliza o sistema       (Sistema.IDEMPRESA)
//
//  FUNÇÕES PUBLICAS:
//      TestaPeriodo  -  Verifica se o período está bloqueado para o modulo
//                       Verifica se a contabilidade está fechada no período
//      BuscaPeriodo  -  Busca o período contábil cadastrado para uma data qq
//      ExcluiLanc    -  Exclui ou Limpa uma planilha
// -----------------------------------------------------------------------------

unit uCtrlInvContab;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCmClientDataSet,
     uCMTypes, uCtrlContab, uCtrlPeriodo, uCtrlLancamento, uCtrlInvestimento, uCtrlParamInvest,
     UCmSqlParams, uCtrlSegregacao, uCtrlDocumento, uCMFileUtils, uCtrlPadroes, //UOperComum,
     //AL_8
     uDbDocumento,
     //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646 
     UBibliotecaInvest;

Type
     //AL_5 - Reorganização em Toda a Unit, Criação de novos objetos e reorganização dos antigos

     {*****************************************************************************
       > TCTRLPERSISTENTOBJECT
       Classe ancestral para persistência de dados em funções de acesso as
       classes de persistência de forma que essas fiquem em escopo privado a
       classe de controle.
     *****************************************************************************}
     TCtrlPersistentObject = class(TCmControlObject)
     private
       _CdsLocal: TClientDataSet;
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
     End;

//***************************************************************************
//  > Busca Padroes de Lançamento Financeiro
//*****************************************************************************
     TBuscaPadrLanc = Class(TCtrlPersistentObject)
     Private
       // -------- Objetos Internos (cds's e etc.) ----------------------------------------- //

       // -------- Variaveis de Propriedades ----------------------------------------------- //
       FPlano: Integer;
       FUnidNegoc: Integer;
       FSubContaDeb: Integer;
       FSubContaCre: Integer;
       FRecPagNao: String;
       FCentroCustoCred: String;
       FCentroCustoDeb: String;
       FContaCred: String;
       FCentroRespon: String;
       FContaDeb: String;
       FTipoPer: String;
       FHistorico: String;
       FTipoRecDes: String;
       //AL_11
       FPlanoPatro: Integer;

       // -------- Métodos das Propriedades -------------------------------------------------- //
       procedure SetCentroCustoCred(const Value: String);
       procedure SetCentroCustoDeb(const Value: String);
       procedure SetCentroRespon(const Value: String);
       procedure SetContaCred(const Value: String);
       procedure SetContaDeb(const Value: String);
       procedure SetHistorico(const Value: String);
       procedure SetPlano(const Value: Integer);
       procedure SetRecPagNao(const Value: String);
       procedure SetSubContaCre(const Value: Integer);
       procedure SetSubContaDeb(const Value: Integer);
       procedure SetTipoPer(const Value: String);
       procedure SetTipoRecDes(const Value: String);
       procedure SetUnidNegoc(const Value: Integer);
       //AL_11
       procedure SetPlanoPatro(const Value: Integer);

     Protected

     Public
       // -------- Metodos do Objeto -------------------------------------------------------- //
       Constructor Create(Aowner: TCmControlObject); Override;
       Destructor  Destroy; Override;

       // -------- Propriedades ------------------------------------------------------------- //
       property Plano: Integer read FPlano write SetPlano;
       property SubContaDeb: Integer read FSubContaDeb write SetSubContaDeb;
       property SubContaCre: Integer read FSubContaCre write SetSubContaCre;
       property UnidNegoc: Integer read FUnidNegoc write SetUnidNegoc;

       property ContaDeb: String read FContaDeb write SetContaDeb;
       property ContaCre: String read FContaCred write SetContaCred;
       property CentroCustoDeb: String read FCentroCustoDeb write SetCentroCustoDeb;
       property CentroCustoCred: String read FCentroCustoCred write SetCentroCustoCred;
       property CentroRespon: String read FCentroRespon write SetCentroRespon;
       property TipoRecDes: String read FTipoRecDes write SetTipoRecDes;
       property TipoPer: String read FTipoPer write SetTipoPer;
       property Historico: String read FHistorico write SetHistorico;
       property RecPagNao: String read FRecPagNao write SetRecPagNao;
       //AL_11
       property PlanoPatro : Integer read FPlanoPatro write SetPlanoPatro;

       // -------- Metodos Funcionais ------------------------------------------------------ //
       //AL_11
       function ListPadrao(iSegmentacao:integer; dDataProc: TDateTime; iTipoInvest: Integer; sTipoMov: String; iTipoOperacao: Integer = 0;
                           iTipoDespesa: Integer = 0; iInvestimento: Integer = -1; iCarteira: Integer = -1;
                           sTipoTitulo: String = ''; iPlanoPatro: Integer = 0): OleVariant; // Fim AL_11
       //AL_11
       function Executa(iSegmentacao: integer; dDataProc: TDateTime; iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira, iPlanoPatro: Integer;
                        fValor: Double; sTipoTitulo, sTipoMov: string): Integer;
       //AL_9
       function ListPadraoRF(iTipoOperacao: Integer = 0; iInvestimento: Integer = -1; iCarteira: Integer = -1;
                             iClasseTit: Integer = -1; iItemRenFix: Integer = 0): OleVariant;
       //AL_9
       function ExecutaRF(iTipoOperacao, iInvestimento, iCarteira, iClasseTit, iItemRenFix: Integer;
                          fValor: Double = 0; sTipoItem: String = ''): Boolean;
       
       //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
       //AL_9
       function ListPadraoEmp(sTipoMov: String;
                              iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa, iPlanoPatro: Integer;
                              dDataProc: TDateTime): OleVariant;
       //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
       //AL_9
       function ExecutaEmp(iSegmentacao, iPlanoPatro, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa: Integer;
                           sTipoMov: string;
                           fValor: Double;
                           dDataProc: TDateTime): Boolean;

     Published
 
     end;

//***************************************************************************
//  > Financeiro
//*****************************************************************************
     TInvDocumento = Class(TCtrlPersistentObject)
     Private
       FDocumentoPendente: Boolean;

       FCodDocumento: Longint;
       FNoDocumento: Integer;
       FContaInvest: Integer;

       //AL_8
       dbDocumento: TDbDocumento;

       procedure SetDocumentoPendente(const Value: Boolean);

       procedure SetCodDocumento(const Value: Longint);
       procedure SetNoDocumento(const Value: Integer);
       procedure SetContaInvest(const Value: Integer);


     Protected
       //AL_9
       procedure DoChangeDataBase; override;

     Public
       Constructor Create(Aowner: TCmControlObject); Override;
       Destructor  Destroy; Override;

       property DocumentoPendente: Boolean read FDocumentoPendente write SetDocumentoPendente;

       property CodDocumento: Longint  read FCodDocumento  write SetCodDocumento;
       property NoDocumento: Integer read FNoDocumento write SetNoDocumento;
       property ContaInvest: Integer read FContaInvest write SetContaInvest;

       function Prepare: Boolean;

       function GetDocSequence: Boolean;
       function GetNoDocumento: Boolean;
       //AL_8
       function ExisteDocumento(iCodDoc: Integer = -1): Boolean;


       function SetValues(liCoddocumento: LongInt; rNodocumento: Double;
                          sCompldocumento, sStatus, sRecpag, sOperacao, sNumslip, sNumleitcodbarras, sPlaconta,
                          sCodcentrocusto, sNossonumero, sNumdigcodbarras, sGrupodoc, sFlgemitelancbaix,
                          sFlgconfirmarecpag, sEmisbloq, sReferencia, sObs: String;
                          dDatavencto, dDataemissao, dDataprogramada, dDataremessa, dDatalimite, dDatacorrecao: TDateTime;
                          rVlrmulta, rValorjuros, rValordesconto, rPercjurossimples, rPercjurosatuarial: Double;
                          liCodtipdoc, liIdpessoa, liIdmodulo, liIdforcli, liNumfatura, liIdcbancaria, liUnidnegoc,
                          liPlano, liNumcpbaixa, liNumapgr, liMoecodigo, liLotetransmissao, liIndicecorrecao,
                          liIdusuarioinclusao, liIdempresa, liFlgnaoconciliado, liControleremessa, liCodsubconta,
                          liCodportforma, liCodgrupocnab, liCodgeradorinss, liCodforma: LongInt;
                          dDataDisp: TDateTime = 0;
                          iIdSegregaCriter: integer = -1;
                          sPlacontaAnt: String = ''): Boolean;

       function LancoDocumSetValues(dDatalancto: TDateTime; liCoddocumento, liNumlancto: LongInt; rVlrliquido,
                                    rValorOM, rValor: Double; liUnidnegoc, liPlncodigo, liNumlotemanual,
                                    liIdusuarioinclusao, liIdpessoa, liIdnflivro, liEstorno, liCodtipdoc,
                                    liCoddocinss, liCodalterador: LongInt; sOperacao,  sNumrecibo, sNumnf,
                                    sNumfatura, sHistoricocompl, sFlgtipofatura, sFlgrecebeunf, sFlgfatemitida,
                                    sDebcre: String; liIdModulo: LongInt; liPlanoConta: LongInt; bUsaPlanoPatro: Boolean;
                                    bContabiliza: Boolean = False; iCodPortForma: Integer = 0; iDiasFloat: Integer = 0;
                                    sContaBaixa: String = ''; liSubContaBaixa: Integer = 0): Boolean;

       function RateioDocumSetValues(rValor, rValorOM, rVlrresorcamen: Double;
                                     liIdrateiodocum, liIdpessoa, liCoddocumento, liUnidnegoc, liMoecodigo, liIdusuarioinclusao,
                                     liIdreservaorcamen, liPlano, liIdplanoprev, liIdpatro, liIdprograma, liIdprocesso, liIdempresa: LongInt;
                                     sCodtiprecdes, sRecpag, sCodcentrorespon, sCodcentrocusto, sNumimovel: String;
                                     const bSegregaOrigem: boolean = true): Boolean;

       //Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
       function CCBAIXASXDOCUMSetValues(rValor: Double; liIdCcBaixasxDocum,
                                        liIdpessoa, liCodDocumento, liUnidNegoc, liPlano, liIdplanoPrev,
                                        liIdPatro, liIdSegregaCriter: Integer; sPlaConta: String) : boolean;

       function Insert: Boolean;

       function Update: Boolean;

       function Delete(iDocumento: Integer): Boolean;

       function Estornar(dData: TDateTime;
                         liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento, liNumLanc, liPlanoConta: LongInt;
                         bUsaPlanoPatro: Boolean;
                         OperacaoEstorno: TOperacaoEstorno = oeSoProcessa;
                         liCodDocumento2: LongInt = 0; liNumLanc2: LongInt = 0;
                         bLancaContabEstornaAdianto: Boolean = True; bEstornoDocum: Boolean = false): Boolean;

     Published

     end;


//*****************************************************************************
//  > Contabil
//*****************************************************************************
     TCtrlInvContab = class(TCmControlObject)
     private
       CtrlContab: TCtrlContab;
       CtrlPeriodo: TCtrlPeriodo;
       CtrlLancamento: TCtrlLancamento;
       CtrlDocumento: TCtrlDocumento;
       //AL_4
       CtrlInvestimento : TCtrlInvestimento;
       //AL_5
       CtrlSegregacao   : TCtrlSegregacao;
       _sql             : TCmSqlParams;
       CtrlParamInvest  : TCtrlParamInvest;

       // -------- Propriedades Gerais -------------------------------------------------------- //
       FModulo: Integer;
       FEmpresa: Integer;
       FUsuario: Integer;
       FEspAcesso: Integer;
       FUsaPlanoPatro: Boolean;
       FPatro: integer;
       FPlano: Integer;
       FPlanPrev: Integer;

       //AL_9
       // Acesso dos parâmetros do sistema setados fora desta unit
       FParamInvest: TCtrlParamInvest;

       // Critérios de Segregação
       FCriterioSegregacao: Integer;
       FContaCriterioSegrega: String;
       FDataCriterioSegrega: TDateTime;

       // -------- Propriedades utilizadas para Lançamento Contabil --------------------------- //
       FPlanilha: Integer;

       // -------- Propriedades utilizadas para o Objeto Documento ---------------------------- //
       FInvDocumento: TInvDocumento;

       // -------- Propriedades utilizadas para o Objeto BuscPadrLanc ------------------------- //
       FBuscaPadrLanc: TBuscaPadrLanc;

       // -------- Propriedades Gerais -------------------------------------------------------- //
       Procedure SetaModulo(pModulo: Integer);
       Procedure SetaEmpresa(pEmpresa: Integer);
       Procedure SetaUsuario(pUsuario: Integer);
       procedure SetEspAcesso(const Value: Integer);
       procedure SetUsaPlanoPatro(const Value: Boolean);
       procedure SetPatro(const Value: integer);
       procedure SetPlano(const Value: Integer);
       procedure SetPlanPrev(const Value: Integer);

       //AL_9
       // ------ Propriedade para acesso dos parâmetros do sistema setados fora desta unit
       procedure SetParamInvest(const Value: TCtrlParamInvest);

       //  Critérios de Segregação
       procedure SetContaCriterioSegrega(const Value: String);
       procedure SetCriterioSegregacao(const Value: Integer);
       procedure SetDataCriterioSegrega(const Value: TDateTime);

       // -------- Propriedades utilizadas para Lançamento Contabil --------------------------- //
       Procedure SetaPlanilha(pPlanilha: Integer);

       // -------- Propriedades utilizadas para o Objeto Documento ---------------------------- //
       procedure SetInvDocumento(const Value: TInvDocumento);

       // -------- Propriedades utilizadas para o Objeto BuscaPadrLanc ------------------------ //
       procedure SetBuscaPadrLanc(const Value: TBuscaPadrLanc);

     protected

       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;
       procedure DoChangeDataBase; override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       // -------- Propriedades Gerais  ------------------------------------------------------- //
       property Modulo: Integer read FModulo write SetaModulo;
       property Empresa: Integer read FEmpresa write SetaEmpresa;
       property Usuario: Integer read FUsuario write SetaUsuario;
       property EspAcesso: Integer read FEspAcesso write SetEspAcesso;
       property UsaPlanoPatro: Boolean read FUsaPlanoPatro write SetUsaPlanoPatro;
       property PlanPrev: Integer read FPlanPrev write SetPlanPrev;
       property Plano: Integer read FPlano write SetPlano;
       property Patro: integer read FPatro write SetPatro;

       //AL_9
       // -------- Propriedade para acesso dos parâmetros do sistema setados fora desta unit
       property ParamInvest: TCtrlParamInvest read FParamInvest write SetParamInvest;

       // Critérios de Segregação
       property CriterioSegregacao: Integer read FCriterioSegregacao write SetCriterioSegregacao;
       property ContaCriterioSegrega: String read FContaCriterioSegrega write SetContaCriterioSegrega;
       property DataCriterioSegrega: TDateTime read FDataCriterioSegrega write SetDataCriterioSegrega;

       // -------- Propriedades utilizadas para Lançamento Contabil  -------------------------- //
       property Planilha: Integer read FPlanilha write SetaPlanilha;

       // -------- Propriedades utilizadas para o Objeto Documento
       property Documento: TInvDocumento read FInvDocumento write SetInvDocumento;

       // -------- Propriedades utilizadas para o Objeto BuscaPadrLanc
       property BuscaPadrLanc: TBuscaPadrLanc read FBuscaPadrLanc write SetBuscaPadrLanc;


       //AL_8
       function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String; overload;
       function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer; overload;
       function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended; overload;
       function IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime; overload;
       function GetPlanoPatro(iPlanPrevCtbPatr: Integer): Boolean;

       // -------- Metodos utilizadas Gerais -------------------------------------------------- //
       function BuscaCriterioSegrega(iPlano, iPatro, iPlanPrev: Integer;
                                     sContaC, sContaD, sPagRec: String; dDataLanc: TDateTime): Boolean;


       // -------- Metodos utilizadas para Lançamento Contabil  ------------------------------- //
       function TestaPeriodo(sData: String;
                             iTipoInvest: Integer = 0; iMercado :Integer = -1; iClasseTit : Integer = -1;
                             iModulo: Integer = -1; iEmpresa: Integer = -1): Boolean;
       function BuscaPeriodo(sData: String;
                             var iPeriodo, iExercicio: Integer; iEmpresa: Integer = -1; iModulo: Integer = -1): Boolean;
       //AL_5
       function InvLancaContabil(liCodPlano, liUnidNegoc, liSubContaDeb, liSubContaCre,
                                 iPlanoPrev, iPatro, liPlnCodigo: Double;
                                 iNumLan: Integer;
                                 sDataLanc, sNunDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
                                 cCCustD, cContaD, cCCustC, cContaC, sCodHist: String;
                                 rValLanc: Double;
                                 bJunta, bUsaPlanoPatro: Boolean;
                                 iModulo: Integer = -1; iUsuario: Integer = -1; iEmpresa: Integer = -1;
                                 sRecPag: String = '';
                                 iIdSegregaCriter: Integer = -1; dDataSegregaCriter: TDateTime = 0;
                                 iIdSegregaContR: Integer = -1; bSegregaOrigem: Boolean = True): Boolean;

       function InvExcluiLanc(iPlnCodigo: Integer; iNumLan : LongInt; bUsaPlanoPatro, bExcluiPlanilha : Boolean;
                              iUsuario: Integer = -1; iModulo: Integer = -1): Boolean;
       //AL_5
       function InvEstornaLanc(iPlnCodigo: Integer; dDataEstorno: TDateTime): Boolean;
       //AL_6
       function BuscaDataBloqContab(dDataAtual: TDateTime): TDateTime;

       //AL_4
       function TestaDataBloqueadaInvest(dDataOper: TDateTime; iTipoInvest: Integer; iMercado :Integer = -1; iClasseTit : Integer = -1):boolean;
       function ListDataBloqueadaInvest :OleVariant;
       function AplicaAtualDataBloqInvest(dDataBloq: TDateTime; iTipoInvest: Integer = 0; iClassetit: Integer = -1; iMercado: Integer = -1): Boolean;
       //AL_13
       //AL_9
       function IntegraCtbFinModulo(iMercado : Integer = -1) : Boolean;
     published

end;

var CtrlInvContab: TCtrlInvContab;

implementation

{ TCtrlInvContab }

constructor TCtrlInvContab.Create;
begin
  inherited;
  CtrlContab := TCtrlContab.Create;
  CtrlPeriodo  := TCtrlPeriodo.Create;
  CtrlLancamento := TCtrlLancamento.Create;
  //AL_4
  CtrlInvestimento   := TCtrlInvestimento.Create;
  //AL_5
  CtrlSegregacao     := TCtrlSegregacao.Create;
  _sql               := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;

  //AL_5
  CtrlDocumento := TCtrlDocumento.Create;
  FInvDocumento := TInvDocumento.Create(Self);
  CtrlParamInvest := TCtrlParamInvest.Create;
  FBuscaPadrLanc := TBuscaPadrLanc.Create(Self);

  // Cria os DbOjbects
end;

destructor TCtrlInvContab.Destroy;
begin
   FreeAndNil(CtrlContab);
   FreeAndNil(CtrlPeriodo);
   FreeAndNil(CtrlLancamento);
   //AL_4
   FreeAndNil(CtrlInvestimento);
   //AL_5
   FreeAndNil(CtrlSegregacao);
   //AL_5
   FreeAndNil(_sql);
   //AL_5
   FreeAndNil(CtrlDocumento);
   FreeAndNil(FInvDocumento);
   FreeAndNil(CtrlParamInvest);
   //AL_15
   FreeAndNil(FInvDocumento);
   FreeAndNil(FBuscaPadrLanc);

  inherited;
end;

procedure TCtrlInvContab.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlInvContab.DoChangeDataBase;
begin
  inherited;
  //AL_5
  FInvDocumento.DataBaseName := DataBaseName;
  FBuscaPadrLanc.DataBaseName := DataBaseName;
end;

procedure TCtrlInvContab.AfterInitialize;
begin
  inherited;
  CtrlContab.InitializeAs(Self);
  CtrlPeriodo.InitializeAs(Self);
  CtrlLancamento.InitializeAs(Self);
  //AL_4
  CtrlInvestimento.InitializeAs(Self);
  //AL_5
  CtrlSegregacao.InitializeAs(Self);
  CtrlDocumento.InitializeAs(Self);
  FInvDocumento.InitializeAs(Self);
  CtrlParamInvest.InitializeAs(Self);
  FBuscaPadrLanc.InitializeAs(Self)
end;

procedure TCtrlInvContab.SetaModulo(pModulo: Integer);
begin
   FModulo := pModulo;
end;

procedure TCtrlInvContab.SetaEmpresa(pEmpresa: Integer);
begin
   FEmpresa := pEmpresa
end;

procedure TCtrlInvContab.SetaUsuario(pUsuario: Integer);
begin
   FUsuario := pUsuario;
   CtrlInvContab.CtrlDocumento.IdUsuario := FUsuario;
end;

procedure TCtrlInvContab.SetaPlanilha(pPlanilha: Integer);
begin
   FPlanilha := pPlanilha;
end;

//AL_4
function TCtrlInvContab.TestaPeriodo(sData: String;
                                     iTipoInvest: Integer = 0;
                                     iMercado :Integer = -1;
                                     iClasseTit : Integer = -1;
                                     iModulo: Integer = -1;
                                     iEmpresa: Integer = -1): Boolean;
var wModulo, wEmpresa: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      //AL_2
      Result := Connection.AppServer.TestaPeriodo(sData, wEmpresa, wModulo);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         //AL_5
         //AL_2
         if iEmpresa > 0 then wEmpresa := iEmpresa else wEmpresa := Empresa;
         if iModulo > 0 then wModulo := iModulo else wModulo := Modulo;
         //AL_1
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_13
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if IntegraCtbFinModulo(iMercado) then
         begin
            if not CtrlContab.TestaDataBloqueadaProc(wEmpresa, wModulo, sData) then
               Raise Exception.Create(CtrlContab.MessageInfo);
            //AL_2 - Inicio
            if not CtrlPeriodo.RetornaPeriodoExercicioDataProc(wEmpresa, sData) then
               Raise Exception.Create(CtrlPeriodo.MessageInfo);
            if CtrlPeriodo.TestaPeriodoBloqueadoProc(wEmpresa, tbBloqOuInt, CtrlPeriodo.Periodo, CtrlPeriodo.Exercicio, False) then
               Raise Exception.Create(CtrlPeriodo.MessageInfo);
            //AL_2 - Fim
            //AL_4
            if not TestaDataBloqueadaInvest(StrToDate(sData), iTipoInvest, iMercado, iClasseTit) then
               Raise Exception.Create(MessageInfo);
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

// AL_2
function TCtrlInvContab.BuscaPeriodo(sData: String;
                                     var iPeriodo, iExercicio: Integer;
                                     iEmpresa: Integer = -1; iModulo: Integer = -1): Boolean;
var wModulo, wEmpresa: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.BuscaPeriodo(sData, iPeriodo, iExercicio, wEmpresa, wModulo);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         //AL_5
         iPeriodo := 0;
         iExercicio := 0;
         if iEmpresa > 0 then wEmpresa := iEmpresa else wEmpresa := Empresa;
         if iModulo > 0 then wModulo := iModulo else wModulo := Modulo;
         MessageInfo := '';

         if not CtrlPeriodo.RetornaPeriodoExercicioDataProc(wEmpresa, sData) then
            Raise Exception.Create(CtrlPeriodo.MessageInfo);
         iPeriodo := CtrlPeriodo.Periodo;
         iExercicio := CtrlPeriodo.Exercicio;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_5
function TCtrlInvContab.InvLancaContabil(liCodPlano, liUnidNegoc, liSubContaDeb, liSubContaCre,
                                         iPlanoPrev, iPatro, liPlnCodigo: Double;
                                         iNumLan: Integer;
                                         sDataLanc, sNunDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
                                         cCCustD, cContaD, cCCustC, cContaC, sCodHist: String;
                                         rValLanc: Double;
                                         bJunta, bUsaPlanoPatro: Boolean;
                                         iModulo: Integer = -1; iUsuario: Integer = -1; iEmpresa: Integer = -1;
                                         sRecPag: String = '';
                                         iIdSegregaCriter: Integer = -1 ; dDataSegregaCriter: TDateTime = 0;
                                         iIdSegregaContR : Integer = -1; bSegregaOrigem: Boolean = True): Boolean;
var wModulo, wUsuario, wEmpresa: Double;
    //AL_5
    sContaSegregaCriter : String;
begin
   if ConnectionSide = cnsClient then
   begin
      //AL_5
      Result := Connection.AppServer.InvLancaContabi(liCodPlano, liUnidNegoc, liSubContaDeb, liSubContaCre,
                                                     iPlanoPrev, iPatro, liPlnCodigo, iNumLan,
                                                     sDataLanc, sNunDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
                                                     cCCustD, cContaD, cCCustC, cContaC, sCodHist, rValLanc, bJunta, bUsaPlanoPatro,
                                                     iModulo, iUsuario, iEmpresa, sRecPag,
                                                     iIdSegregaCriter, dDataSegregaCriter, iIdSegregaContR, bSegregaOrigem);

      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         //AL_5
         if iModulo > 0 then wModulo := iModulo else wModulo := Modulo;
         if iUsuario > 0 then wUsuario := iUsuario else wUsuario := Usuario;
         if iEmpresa > 0 then wEmpresa := iEmpresa else wEmpresa := Empresa;

         // Limpa a mensagem de erro local
         MessageInfo := '';
         // Seta valor default: Ainda não existe planilha
         Planilha := -1;

         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if IntegraCtbFinModulo then
         begin
            //AL_5
            // Busca o Critério de Segregação
            if iIdSegregaCriter > 0 then
            begin
               CtrlInvContab.CriterioSegregacao := iIdSegregaCriter;
               if dDataSegregaCriter > 0 then
                  CtrlInvContab.DataCriterioSegrega := StrToDate(sDataLanc);
            end
            else
               CtrlInvContab.BuscaCriterioSegrega(Trunc(liCodPlano), Trunc(iPatro), Trunc(iPlanoPrev), cContaC, cContaD, sRecPag, StrToDate(sDataLanc));

            //AL_5
            if not CtrlLancamento.InsereLancaContab('2', wEmpresa, wModulo, wUsuario, liCodPlano,
                                                    liUnidNegoc, liSubContaDeb, liSubContaCre,
                                                    iPlanoPrev, iPatro, liPlnCodigo, iNumLan,
                                                    sDataLanc, sNunDoc, sHist1, sHist2, sHist3, sHist4, sHist5, sTipoOper,
                                                    cCCustD, cContaD, cCCustC, cContaC, sCodHist, rValLanc, bJunta, bUsaPlanoPatro,
                                                    CtrlInvContab.CriterioSegregacao, CtrlInvContab.DataCriterioSegrega) then
               Raise Exception.Create(CtrlLancamento.MessageInfo);
            Planilha := StrToInt(FloatToStr(CtrlLancamento.RetornoPlnCodigo));
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_5 - Reposicionamento na Unit
function TCtrlInvContab.InvExcluiLanc(iPlnCodigo: Integer; iNumLan : LongInt;
                                      bUsaPlanoPatro, bExcluiPlanilha : Boolean;
                                      iUsuario: Integer = -1; iModulo: Integer = -1): Boolean;
var wModulo, wUsuario: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.InvExcluiLanc(iPlnCodigo, iNumLan,
                                                   bUsaPlanoPatro, bExcluiPlanilha,
                                                   iUsuario, iModulo);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         //AL_5
         if iModulo > 0 then wModulo := iModulo else wModulo := Modulo;
         if iUsuario > 0 then wUsuario := iUsuario else wUsuario := Usuario;
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_12 - Testa se existe a planilha
         if iPlnCodigo > 0 then
         begin
            //AL_9 - Testa se o módulo ativo integra contabil e financeiro
           // if IntegraCtbFinModulo then
               if not CtrlLancamento.ExcluiLancaContab(wUsuario, iPlnCodigo, wModulo, iNumLan, bUsaPlanoPatro, bExcluiPlanilha) then

                  Raise Exception.Create(CtrlLancamento.MessageInfo);
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_5
function TCtrlInvContab.InvEstornaLanc(iPlnCodigo: Integer; dDataEstorno: TDateTime): Boolean;
var wDataEstorno: String;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.InvEstornaLanc(iPlnCodigo, dDataEstorno);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         wDataEstorno := DateToStr(dDataEstorno);
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_12 - Testa se existe a planilha
         if iPlnCodigo > 0 then
         begin
            //AL_9 - Testa se o módulo ativo integra contabil e financeiro
            if IntegraCtbFinModulo then
               if not CtrlLancamento.EstornaLancaContab(Usuario, iPlnCodigo, Modulo, Empresa, UsaPlanoPatro, wDataEstorno) then
                  Raise Exception.Create(CtrlLancamento.MessageInfo);
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_6
{ Retorna a maior data bloqueada na contabilidade }
function TCtrlInvContab.BuscaDataBloqContab(dDataAtual: TDateTime): TDateTime;
var sSql: String;
    dDataPerBloq: TDateTime;
    wExercicio, wPeriodo, wDia: Word;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.BuscaDataBloqContab(dDataAtual);
      if Result = 0 then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         Result := dDataAtual;
         // *****  Busca a maior data bloqueada na contabilidade
         sSql := 'SELECT MAX(DATABLOQ) AS DATABLOQ ' + #13 +
                 'FROM (SELECT PACDATABLOQ AS DATABLOQ ' + #13 +
                 '      FROM PARAMCONTAB ' + #13 +
                 '      WHERE IDPESSOA = ' + IntToStr(Empresa) + #13 +
                 '        AND PACDATABLOQ IS NOT NULL ' + #13 +
                 '      UNION ' + #13 +
                 '      SELECT DECODE(NUMDIAS,0,DATABLOQUEIO,TRUNC(SYSDATE) - NUMDIAS) as DATABLOQ ' + #13 +
                 '      FROM DIASBLOQMOD ' + #13 +
                 '      WHERE IDPESSOA = ' + IntToStr(Empresa) + #13 +
                 '        AND (IDMODULO = 79))';
         _Cds.Data  := GetDataPacket(sSql);
         if not _Cds.IsEmpty then
            Result := _Cds.FieldByName('DATABLOQ').AsDateTime;

         // *****  Se a data do último fechamento for menor que a última data bloqueada, retorna o último fechamento
         if dDataAtual < Result then
            Result := dDataAtual;

         // *****  Busca último período bloqueado anterior a data atual
         DecodeDate(Result, wExercicio, wPeriodo, wDia);
         while not CtrlPeriodo.TestaPeriodoBloqueadoProc(Empresa, tbBloqOuInt, wPeriodo, wExercicio, False) do
         begin
            Dec(wPeriodo);
            if wPeriodo = 0 then
            begin
               wPeriodo := 12;
               Dec(wExercicio);
            end;
         end;

         //Retirado a incrementação do perído devido ao fato da rotina identificar o último dia bloqueado
         //AL_14
         // *****  Monta a data de bloqueio pelo ultimo período bloqueado
{         if wPeriodo = 12 then
            wPeriodo := 1
         else
            Inc(wPeriodo);
         dDataPerBloq := EncodeDate( wExercicio, wPeriodo, 1);}

         // *****  Se a data bloqueada for menor que o resultado atual, retorna a data bloqueada
         if Result < dDataPerBloq then
            Result := dDataPerBloq;

      except
         Result := 0;
         MessageInfo := 'Não foi possível definir uma data de bloqueio contábil';
      end;
   end;
end;

//AL_4
function TCtrlInvContab.TestaDataBloqueadaInvest(dDataOper: TDateTime;
                                                 iTipoInvest: Integer;
                                                 iMercado :Integer = -1;
                                                 iClasseTit : Integer = -1):boolean;
var sSQL: String;
begin
   //AL_5 - Ini
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.TestaDataBloqueadaInvest(dDataOper, iTipoInvest, iMercado, iClasseTit);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      //AL_15 - Ini
      try
         try
            Result := True;
            MessageInfo := '';

            if iTipoInvest <> 0 then // Não testa por módulo
            begin
               if (iTipoInvest = 1) and (iClasseTit <> -1) then // Renda Fixa e Classe
               begin
                  sSql := ' SELECT                                                 '+ #13 +
                          '    T.IDTIPOINVEST, T.DESCTIPOINVEST,                   '+ #13 +
                          '    C.IDCLASSETIT, 0 AS IDMERCADO,                      '+ #13 +
                          '    (C.DESCCLASSETIT) AS DESCCLASSE,                    '+ #13 +
                          '    GREATEST(NVL(C.DTATRAVACTB,TO_DATE(''31/12/1899'',''DD/MM/YYYY'')), '+ #13 +
                          '             NVL(T.DTATRAVACTB,TO_DATE(''31/12/1899'',''DD/MM/YYYY''))) AS DTATRAVACTB '+ #13 +
                          ' FROM                                                   '+ #13 +
                          '    CLASSETITRENFIX C, TIPOINVEST T                     '+ #13 +
                          ' WHERE                                                  '+ #13 +
                          '     (T.IDTIPOINVEST = 1)                               '+ #13 +
                          '     AND ((C.FLGATIVA = ''S'') OR (C.FLGATIVA IS NULL)) ';
                          if iClasseTit <> -1 then
                          sSql := sSql + ' AND (C.IDCLASSETIT = ' + QuotedStr(IntToStr(iClasseTit)) +')';
               end
               else if (iTipoInvest = 2) and (iMercado = -1) then // Renda Variavel e Mercado
               begin
                  sSql := ' SELECT                                              '+ #13 +
                          '    T.IDTIPOINVEST, T.DESCTIPOINVEST,                '+ #13 +
                          '    0 AS IDCLASSETIT, 0 AS IDMERCADO,                '+ #13 +
                          '    (T.DESCTIPOINVEST) AS DESCCLASSE,                '+ #13 +
                          '    (T.DTATRAVACTB) AS DTATRAVACTB                   '+ #13 +
                          ' FROM                                                '+ #13 +
                          '    TIPOINVEST T                                     '+ #13 +
                          ' WHERE                                               '+ #13 +
                          '     (T.IDTIPOINVEST = 2)                            ';
               end
               else if (iTipoInvest = 2) and (iMercado <> -1) then // Renda Variavel e Mercado
               begin
                  sSql := ' SELECT                                              '+ #13 +
                          '    T.IDTIPOINVEST, T.DESCTIPOINVEST,                '+ #13 +
                          '    0 AS IDCLASSETIT, M.IDMERCADO,                   '+ #13 +
                          '    (M.DESCMERCADO) AS DESCCLASSE,                   '+ #13 +
                          '    (M.DTATRAVACTB) AS DTATRAVACTB                   '+ #13 +
                          ' FROM                                                '+ #13 +
                          '    MERCADO M, TIPOINVEST T                          '+ #13 +
                          ' WHERE                                               '+ #13 +
                          '     (T.IDTIPOINVEST = 2)                            '+ #13 +
                          '     AND (M.IDMERCADO IN (5,6,8))                    '+ #13 +
                          '     AND (M.IDTIPOINVEST = T.IDTIPOINVEST)           '+ #13 +
                          ' AND (M.IDMERCADO = ' + QuotedStr(IntToStr(iMercado))+ ' ) ';
               end
               else  // Renda Fixa, Renda Variavel, Fundos e BM&F
               begin
                  sSql := ' SELECT                                             '+ #13 +
                          '    T.IDTIPOINVEST, T.DESCTIPOINVEST,               '+ #13 +
                          '    0 AS IDCLASSETIT, 0 AS IDMERCADO,               '+ #13 +
                          '    (T.DESCTIPOINVEST) AS DESCCLASSE,               '+ #13 +
                          '    T.DTATRAVACTB                                   '+ #13 +
                          ' FROM                                               '+ #13 +
                          '    TIPOINVEST T                                    '+ #13 +
                          ' WHERE                                              '+ #13 +
                          '     (T.IDTIPOINVEST = ' + QuotedStr(IntToStr(iTipoInvest))+ ' ) ';
               end;

               _Cds.Data  := GetDataPacket(sSql);

               if Not _Cds.IsEmpty then
               begin
                  while not _Cds.Eof do
                  begin
                     if _Cds.FieldByName('DTATRAVACTB').AsString <> '' then
                     begin
                        if dDataOper <= _Cds.FieldByName('DTATRAVACTB').AsDateTime then
                        begin
                           Result := False;
                           if iTipoInvest = 1 then // Renda Fixa
                              MessageInfo := 'O Módulo - ' + _Cds.FieldByName('DESCTIPOINVEST').AsString + #13 +
                                             'ou a Classe - ' +  _Cds.FieldByName('DESCCLASSE').AsString  + #13 +
                                             'está Bloqueada para Lançamentos Contábeis até :' + _Cds.FieldByName('DTATRAVACTB').AsString
                           else if iTipoInvest = 2 then // Renda Variável
                              MessageInfo := 'O Módulo - ' + _Cds.FieldByName('DESCTIPOINVEST').AsString + #13 +
                                             'ou o Mercado - ' +  _Cds.FieldByName('DESCCLASSE').AsString  + #13 +
                                             'está Bloqueado para Lançamentos Contábeis até :' + _Cds.FieldByName('DTATRAVACTB').AsString
                           else  // Fundos
                              MessageInfo := 'O Módulo - ' + _Cds.FieldByName('DESCTIPOINVEST').AsString + #13 +
                                             'está Bloqueado para Lançamentos Contábeis até :' + _Cds.FieldByName('DTATRAVACTB').AsString;
                           Exit;
                        end;
                     end;
                     _Cds.Next;
                  end;
               end;
            end;
         except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         _Cds.Close;
      end;
      //AL_15 - Fim
   end;
   //AL_5 - Fim
end;

//AL_4
function TCtrlInvContab.ListDataBloqueadaInvest :OleVariant;
var sSQL: String;
begin
   sSql := ' SELECT                                '+ #13 +
           '    A.IDTIPOINVEST, A.DESCTIPOINVEST,  '+ #13 +
           '    A.DESCCLASSE,                      '+ #13 +
           '    A.IDCLASSETIT,  A.IDMERCADO,       '+ #13 +
           '    A.ORDEM,                           '+ #13 +
           '    A.DTATRAVACTB                      '+ #13 +
           ' FROM                                  '+ #13 +
           ' (                                     '+ #13 +
           ' SELECT                                '+ #13 +
           '    T.IDTIPOINVEST, T.DESCTIPOINVEST,  '+ #13 +
           '    0 AS IDCLASSETIT, 0 AS IDMERCADO,  '+ #13 +
           '    (T.DESCTIPOINVEST) AS DESCCLASSE,  '+ #13 +
           '    DECODE(T.IDTIPOINVEST,8,1,DECODE(T.IDTIPOINVEST,1,3,DECODE(T.IDTIPOINVEST,2,5,2))) AS ORDEM, '+ #13 +
           '    T.DTATRAVACTB                      '+ #13 +
           ' FROM                                  '+ #13 +
           '    TIPOINVEST T                       '+ #13 +
           ' WHERE                                 '+ #13 +
           '    T.IDTIPOINVEST IN (1,2,5,6,7,8,9)  '+ #13 +
           '                                       '+ #13 +
           ' UNION ALL                             '+ #13 +
           '                                       '+ #13 +
           ' SELECT                                '+ #13 +
           '    T.IDTIPOINVEST, T.DESCTIPOINVEST,  '+ #13 +
           '    C.IDCLASSETIT, 0 AS IDMERCADO,     '+ #13 +
           '    (C.DESCCLASSETIT) AS DESCCLASSE,   '+ #13 +
           '    4 AS ORDEM,                        '+ #13 +
           '    C.DTATRAVACTB                      '+ #13 +
           ' FROM                                  '+ #13 +
           '    CLASSETITRENFIX C, TIPOINVEST T    '+ #13 +
           ' WHERE                                 '+ #13 +
           '     (T.IDTIPOINVEST = 1)              '+ #13 +
           '     AND ((FLGATIVA = ''S'') OR (FLGATIVA IS NULL)) '+ #13 +
           '                                       '+ #13 +
           ' UNION ALL                             '+ #13 +
           '                                       '+ #13 +
           ' SELECT                                '+ #13 +
           '    T.IDTIPOINVEST, T.DESCTIPOINVEST,  '+ #13 +
           '    0 AS IDCLASSETIT, M.IDMERCADO,     '+ #13 +
           '    (M.DESCMERCADO) AS DESCCLASSE,     '+ #13 +
           '    6 AS ORDEM,                        '+ #13 +
           '    M.DTATRAVACTB                      '+ #13 +
           ' FROM                                  '+ #13 +
           '    MERCADO M, TIPOINVEST T            '+ #13 +
           ' WHERE                                 '+ #13 +
           '     (T.IDTIPOINVEST = 2)              '+ #13 +
           '     AND (M.IDMERCADO IN (5,6,8))      '+ #13 +
           '     AND (M.IDTIPOINVEST = T.IDTIPOINVEST) '+ #13 +
           ' ) A                                       '+ #13 +
           ' ORDER BY  A.ORDEM, A.DESCTIPOINVEST, A.DESCCLASSE ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvContab.AplicaAtualDataBloqInvest(dDataBloq : TDateTime;
                                                  iTipoInvest : Integer = 0;
                                                  iClassetit  : Integer = -1;
                                                  iMercado    : Integer = -1): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualDataBloqInvest(dDataBloq,
                                                               iTipoInvest,
                                                               iClassetit,
                                                               iMercado);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;
         _sql.SQL.Clear;
         if iClassetit <> -1 then
         begin
            if dDataBloq <> 0 then
               _sql.SQL.Add(' UPDATE CLASSETITRENFIX  SET DTATRAVACTB = ' + QuotedStr(DateToStr(dDataBloq)))
            else
                _sql.SQL.Add(' UPDATE CLASSETITRENFIX  SET DTATRAVACTB = NULL ');
            _sql.SQL.Add(' WHERE IDCLASSETIT = :IDCLASSETIT');
            _sql.Prepare;
            _sql.ParamByName('IDCLASSETIT').AsInteger := iClassetit;
         end
         else if iMercado <> -1 then
         begin
            if dDataBloq <> 0 then
               _sql.SQL.Add(' UPDATE MERCADO SET DTATRAVACTB = ' + QuotedStr(DateToStr(dDataBloq)))
            else
               _sql.SQL.Add(' UPDATE MERCADO  SET DTATRAVACTB = NULL ');
            _sql.SQL.Add(' WHERE IDMERCADO  = :IDMERCADO');
            _sql.Prepare;
            _sql.ParamByName('IDMERCADO').AsInteger := iMercado;
         end
         else if iTipoInvest <> 0 then
         begin
            if dDataBloq <> 0 then
               _sql.SQL.Add(' UPDATE TIPOINVEST SET DTATRAVACTB = ' + QuotedStr(DateToStr(dDataBloq)))
            else
               _sql.SQL.Add(' UPDATE TIPOINVEST  SET DTATRAVACTB = NULL ');
            _sql.SQL.Add(' WHERE IDTIPOINVEST = :IDTIPOINVEST');
            _sql.Prepare;
            _sql.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvest;
         end;

         if not ExecSQL(_sql.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);

           Commit;
           Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_13
//AL_9
function TCtrlInvContab.IntegraCtbFinModulo(iMercado : Integer) : Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IntegraModulo;
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         Result := True;
         //AL_15
         case CtrlPInv.IdTipoInvest of
              1: if CtrlPInv.IntFinContabRF = 'N' then
                    Result := False;
              //AL_13
              2: if iMercado > 0 then
                 begin
                    if CtrlPInv.IntFinContabOPI = 'N' then
                       Result := False;
                 end
                 else if CtrlPInv.IntFinContabRV = 'N' then
                    Result := False;
              5: if CtrlPInv.IntFinContabFRF = 'N' then
                    Result := False;
              6: if CtrlPInv.IntFinContabFRV = 'N' then
                    Result := False;
              7: if CtrlPInv.IntFinContabFIM = 'N' then
                    Result := False;
              8: if CtrlPInv.IntFinContabBMF = 'N' then
                    Result := False;
              9: if CtrlPInv.IntFinContabFDC = 'N' then
                    Result := False;
             10: if CtrlPInv.IntFinContabFIP = 'N' then
                    Result := False;
             else
                Result := True;
         end;

         if not Result then
            Raise Exception.Create('Integração Contábil / Financeira desativada');

      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

procedure TCtrlInvContab.SetInvDocumento(const Value: TInvDocumento);
begin
  FInvDocumento := Value;
end;

procedure TCtrlInvContab.SetEspAcesso(const Value: Integer);
begin
   FEspAcesso := Value;
   CtrlInvContab.CtrlDocumento.IdEspAcesso := FEspAcesso;
end;

procedure TCtrlInvContab.SetUsaPlanoPatro(const Value: Boolean);
begin
  FUsaPlanoPatro := Value;
  CtrlInvContab.CtrlDocumento.UsaPlanoPatro := FUsaPlanoPatro;
end;

procedure TCtrlInvContab.SetContaCriterioSegrega(const Value: String);
begin
   FContaCriterioSegrega := Value;
end;

procedure TCtrlInvContab.SetCriterioSegregacao(const Value: Integer);
begin
   FCriterioSegregacao := Value;
end;

//AL_8
function TCtrlInvContab.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: String): String;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;
//AL_8
function TCtrlInvContab.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Integer): Integer;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;
//AL_8
function TCtrlInvContab.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: Extended): Extended;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;
//AL_8
function TCtrlInvContab.IIF(BooleanExpr: Boolean; IfTrue, IfFalse: TDateTime): TDateTime;
begin
   if BooleanExpr then Result := IfTrue else Result := IfFalse;
end;
//AL_8
function TCtrlInvContab.GetPlanoPatro(iPlanPrevCtbPatr: Integer): Boolean;
var cdsPlanoPatro: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.GetPlanoPatro(iPlanPrevctbPatr) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         cdsPlanoPatro := TCMClientDataSet.Create(Nil);
         try
            // Limpa as Mensagens de erro
            MessageInfo := '';

            cdsPlanoPatro.Data := CtrlInvContab.CtrlInvestimento.ListPlanoPatro(iPlanPrevctbPatr);
            if cdsPlanoPatro.IsEmpty then
               Raise Exception.Create('Não foi possível localizar o Plano e a Patrocinadora');

            CtrlInvContab.Patro := cdsPlanoPatro.FieldByName('IDPATRO').AsInteger;
            CtrlInvContab.PlanPrev := cdsPlanoPatro.FieldByName('IDPLANOPREV').AsInteger;

            Result := True;
         except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         FreeAndNil(cdsPlanoPatro);
      end;
   end;
end;

function TCtrlInvContab.BuscaCriterioSegrega(iPlano, iPatro, iPlanPrev: Integer;
                                             sContaC, sContaD, sPagRec: String; dDataLanc: TDateTime): Boolean;
var sContaSegregaCriter: String;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.BuscaCriterioSegrega(iPlano, iPatro, iPlanPrev, sContaC, sContaD, dDataLanc) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         MessageInfo := '';
         CtrlSegregacao.MessageInfo := '';
         CtrlInvContab.MessageInfo := '';
         if not CtrlSegregacao.Active then
            CtrlSegregacao.GetParams(CtrlInvContab.Empresa);

         if sPagRec = 'P' then
         begin
            CtrlInvContab.CriterioSegregacao := CtrlSegregacao.RetornaSegregaCriter(iPlano, iPlanPrev, iPatro,
                                                                                    sContaD, sContaSegregaCriter);
            if CtrlSegregacao.MessageInfo <> '' then
               Raise Exception.Create(CtrlSegregacao.MessageInfo);
         end;

         if CtrlInvContab.CriterioSegregacao <= 0 then
         begin
            CtrlInvContab.CriterioSegregacao := CtrlSegregacao.RetornaSegregaCriter(iPlano, iPlanPrev, iPatro,
                                                                                    sContaC, sContaSegregaCriter);
            if CtrlSegregacao.MessageInfo <> '' then
               Raise Exception.Create(CtrlSegregacao.MessageInfo);
         end;

         CtrlInvContab.ContaCriterioSegrega := sContaSegregaCriter;
         CtrlInvContab.DataCriterioSegrega := dDataLanc;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

procedure TCtrlInvContab.SetDataCriterioSegrega(const Value: TDateTime);
begin
  FDataCriterioSegrega := Value;
end;

procedure TCtrlInvContab.SetPatro(const Value: integer);
begin
  FPatro := Value;
end;

procedure TCtrlInvContab.SetPlano(const Value: Integer);
begin
  FPlano := Value;
end;

procedure TCtrlInvContab.SetPlanPrev(const Value: Integer);
begin
  FPlanPrev := Value;
end;

//AL_8
procedure TCtrlInvContab.SetParamInvest(const Value: TCtrlParamInvest);
begin
  FParamInvest := Value;
end;

procedure TCtrlInvContab.SetBuscaPadrLanc(const Value: TBuscaPadrLanc);
begin
  FBuscaPadrLanc := Value;
end;


{ TCtrlPersistentObject }

procedure TCtrlPersistentObject.Clear;
begin

end;

constructor TCtrlPersistentObject.Create(Aowner: TCmControlObject);
begin
   FOwner := Aowner;
   _CdsLocal := TCMClientDataSet.Create(nil);
end;

destructor TCtrlPersistentObject.Destroy;
begin
   FreeAndNil(_CdsLocal);
   inherited;
end;

procedure TCtrlPersistentObject.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;


{ TDocumento }
constructor TInvDocumento.Create(Aowner: TCmControlObject);
begin
   inherited;
   //AL_8
   dbDocumento := TDbDocumento.Create(Self);
end;

destructor TInvDocumento.Destroy;
begin
  //AL_15
  //AL_8
  FreeAndNil(dbDocumento);
  inherited;
end;

procedure TInvDocumento.SetDocumentoPendente(const Value: Boolean);
begin
  FDocumentoPendente := Value;
end;

procedure TInvDocumento.SetCodDocumento(const Value: Longint);
begin
  FCodDocumento := Value;
end;

procedure TInvDocumento.SetNoDocumento(const Value: Integer);
begin
  FNoDocumento := Value;
end;

procedure TInvDocumento.SetContaInvest(const Value: Integer);
begin
  FContaInvest := Value;
end;

function TInvDocumento.Prepare: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.Prepare(OpDocumento, odlEfetivo) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            // Executa o método
            CtrlInvContab.CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
            if CtrlInvContab.CtrlDocumento.MessageInfo <> '' then
               Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);

            // Prepara variaveis de ambiente
            CtrlInvContab.CtrlDocumento.UsaPlanoPatro := CtrlInvContab.UsaPlanoPatro;
            CtrlInvContab.CtrlDocumento.IdEspAcesso := CtrlInvContab.EspAcesso;
            CtrlInvContab.CtrlDocumento.IdUsuario := CtrlInvContab.Usuario;

            // Indica que existe um documento pendente de insersão
            CtrlInvContab.Documento.DocumentoPendente := True;
         end;

         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.GetDocSequence: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.GetDocSequence then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa as Mensagens de erro
         MessageInfo := '';
         CtrlInvContab.CtrlDocumento.MessageInfo := '';
         // Captura o Sequence e armazena ne Property Documento.CodDocumento
         FCodDocumento := CtrlInvContab.CtrlDocumento.GetSequenceDocumento;
         // Testa o erro na unit
         if CtrlInvContab.CtrlDocumento.MessageInfo <> '' then
            Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
         // Testa a validade do Sequence retornado
         if FCodDocumento <= 0 then
            Raise Exception.Create('Não foi possível gerar um código válido de documento');
         Result := True;
      except
         on E : Exception do
         begin
           FCodDocumento := 0;
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.GetNoDocumento: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.GetNoDocumento then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         try
            // Limpa as Mensagens de erro
            MessageInfo := '';
            // Captura o Sequence e armazena ne Property Documento.NoDocumento, enquanto existir registro com este sequence
            repeat
               FNoDocumento := GetSequence('DOCINVEST');
               CtrlInvContab._Cds.Data := TCtrlInvContab(Owner).GetDataPacket('SELECT NODOCUMENTO FROM DOCUMENTO WHERE NODOCUMENTO = ' + IntToStr(FNoDocumento) + ' AND COMPLDOCUMENTO = ''79''');
            until CtrlInvContab._Cds.IsEmpty;
            // Testa a validade do Sequence retornado
            if FNoDocumento <= 0 then
               Raise Exception.Create('Não foi possível gerar um número válido de documento');
            Result := True;
         except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         CtrlInvContab._Cds.Close;
      end;
   end;
end;


function TInvDocumento.SetValues(liCoddocumento: LongInt; rNodocumento: Double;
                                 sCompldocumento, sStatus, sRecpag, sOperacao, sNumslip, sNumleitcodbarras, sPlaconta,
                                 sCodcentrocusto, sNossonumero, sNumdigcodbarras, sGrupodoc, sFlgemitelancbaix,
                                 sFlgconfirmarecpag, sEmisbloq, sReferencia, sObs: String;
                                 dDatavencto, dDataemissao, dDataprogramada, dDataremessa, dDatalimite, dDatacorrecao: TDateTime;
                                 rVlrmulta, rValorjuros, rValordesconto, rPercjurossimples, rPercjurosatuarial: Double;
                                 liCodtipdoc, liIdpessoa, liIdmodulo, liIdforcli, liNumfatura, liIdcbancaria, liUnidnegoc,
                                 liPlano, liNumcpbaixa, liNumapgr, liMoecodigo, liLotetransmissao, liIndicecorrecao,
                                 liIdusuarioinclusao, liIdempresa, liFlgnaoconciliado, liControleremessa, liCodsubconta,
                                 liCodportforma, liCodgrupocnab, liCodgeradorinss, liCodforma: LongInt;
                                 dDataDisp: TDateTime = 0;
                                 iIdSegregaCriter: integer = -1;
                                 sPlacontaAnt: String = ''): Boolean;
var iCriterioSegreg: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.SetValues(liCoddocumento, rNodocumento,
                                            sCompldocumento, sStatus, sRecpag, sOperacao, sNumslip, sNumleitcodbarras, sPlaconta,
                                            sCodcentrocusto, sNossonumero, sNumdigcodbarras, sGrupodoc, sFlgemitelancbaix, sFlgconfirmarecpag,
                                            sEmisbloq, sReferencia, sObs,
                                            dDatavencto, dDataemissao, dDataprogramada, dDataremessa, dDatalimite, dDatacorrecao,
                                            rVlrmulta, rValorjuros, rValordesconto, rPercjurossimples, rPercjurosatuarial,
                                            liCodtipdoc, liIdpessoa, liIdmodulo, liIdforcli, liNumfatura, liIdcbancaria, liUnidnegoc,
                                            liPlano, liNumcpbaixa, liNumapgr, liMoecodigo, liLotetransmissao, liIndicecorrecao, liIdusuarioinclusao,
                                            liIdempresa, liFlgnaoconciliado, liControleremessa, liCodsubconta, liCodportforma, liCodgrupocnab,
                                            liCodgeradorinss, liCodforma, dDataDisp,
                                            iIdSegregaCriter, sPlacontaAnt) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            // Se já foi passado um critério, utiliza o do parametro
            if iIdSegregaCriter > 0 then
            begin
               CtrlInvContab.CriterioSegregacao := iIdSegregaCriter;
               CtrlInvContab.DataCriterioSegrega := dDataemissao;
            end
            else
               // Busca o Critério de Segregação
               CtrlInvContab.BuscaCriterioSegrega(CtrlInvContab.Plano, CtrlInvContab.Patro, CtrlInvContab.PlanPrev, sPlaconta, sPlaconta, sRecPag, dDataemissao);

            CtrlInvContab.CtrlDocumento.SetValues(liCoddocumento, rNodocumento,
                                                  sCompldocumento, sStatus, sRecpag, sOperacao, sNumslip, sNumleitcodbarras, sPlaconta,
                                                  sCodcentrocusto, sNossonumero, sNumdigcodbarras, sGrupodoc, sFlgemitelancbaix, sFlgconfirmarecpag,
                                                  sEmisbloq, sReferencia, sObs,
                                                  dDatavencto, dDataemissao, dDataprogramada, dDataremessa, dDatalimite, dDatacorrecao,
                                                  rVlrmulta, rValorjuros, rValordesconto, rPercjurossimples, rPercjurosatuarial,
                                                  liCodtipdoc, liIdpessoa, liIdmodulo, liIdforcli, liNumfatura, liIdcbancaria, liUnidnegoc,
                                                  liPlano, liNumcpbaixa, liNumapgr, liMoecodigo, liLotetransmissao, liIndicecorrecao, liIdusuarioinclusao,
                                                  liIdempresa, liFlgnaoconciliado, liControleremessa, liCodsubconta, liCodportforma, liCodgrupocnab,
                                                  liCodgeradorinss, liCodforma,
                                                  CtrlInvContab.CriterioSegregacao, sPlacontaAnt);
            if CtrlInvContab.CtrlDocumento.MessageInfo <> '' then
               Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
            if dDataDisp > 0 then
               CtrlInvContab.CtrlDocumento.DataDisponibilidade := dDataDisp;
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.LancoDocumSetValues(dDatalancto: TDateTime;
                                           liCoddocumento, liNumlancto: Integer; rVlrliquido, rValorOM,
                                           rValor: Double; liUnidnegoc, liPlncodigo, liNumlotemanual,
                                           liIdusuarioinclusao, liIdpessoa, liIdnflivro, liEstorno, liCodtipdoc,
                                           liCoddocinss, liCodalterador: Integer; sOperacao, sNumrecibo, sNumnf,
                                           sNumfatura, sHistoricocompl, sFlgtipofatura, sFlgrecebeunf,
                                           sFlgfatemitida, sDebcre: String; liIdModulo, liPlanoConta: Integer;
                                           bUsaPlanoPatro, bContabiliza: Boolean; iCodPortForma,
                                           iDiasFloat: Integer; sContaBaixa: String;
                                           liSubContaBaixa: Integer): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.LancoDocumSetValues(dDatalancto,
                                                      liCoddocumento, liNumlancto,
                                                      rVlrliquido, rValorOM, rValor,
                                                      liUnidnegoc, liPlncodigo, liNumlotemanual, liIdusuarioinclusao, liIdpessoa,
                                                      liIdnflivro, liEstorno, liCodtipdoc, liCoddocinss, liCodalterador,
                                                      sOperacao, sNumrecibo, sNumnf, sNumfatura, sHistoricocompl, sFlgtipofatura,
                                                      sFlgrecebeunf, sFlgfatemitida, sDebcre,
                                                      liIdModulo, liPlanoConta,
                                                      bUsaPlanoPatro, bContabiliza,
                                                      iCodPortForma, iDiasFloat,
                                                      sContaBaixa,
                                                      liSubContaBaixa) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            CtrlInvContab.CtrlDocumento.Lanctodocum.SetValues(dDatalancto,
                                                              liCoddocumento, liNumlancto,
                                                              rVlrliquido, rValorOM, rValor,
                                                              liUnidnegoc, liPlncodigo, liNumlotemanual, liIdusuarioinclusao, liIdpessoa,
                                                              liIdnflivro, liEstorno, liCodtipdoc, liCoddocinss, liCodalterador,
                                                              sOperacao, sNumrecibo, sNumnf, sNumfatura, sHistoricocompl, sFlgtipofatura,
                                                              sFlgrecebeunf, sFlgfatemitida, sDebcre,
                                                              liIdModulo, liPlanoConta,
                                                              bUsaPlanoPatro, bContabiliza,
                                                              iCodPortForma, iDiasFloat,
                                                              sContaBaixa,
                                                              liSubContaBaixa);
            if CtrlInvContab.CtrlDocumento.MessageInfo <> '' then
               Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.RateioDocumSetValues(rValor, rValorOM, rVlrresorcamen: Double;
                                            liIdrateiodocum, liIdpessoa, liCoddocumento, liUnidnegoc, liMoecodigo, liIdusuarioinclusao,
                                            liIdreservaorcamen, liPlano, liIdplanoprev, liIdpatro, liIdprograma, liIdprocesso, liIdempresa: LongInt;
                                            sCodtiprecdes, sRecpag, sCodcentrorespon, sCodcentrocusto, sNumimovel: String;
                                            const bSegregaOrigem: boolean = true): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.RateioDocumSetValues(rValor, rValorOM, rVlrresorcamen,
                                                       liIdrateiodocum, liIdpessoa, liCoddocumento, liUnidnegoc, liMoecodigo, liIdusuarioinclusao,
                                                       liIdreservaorcamen, liPlano, liIdplanoprev, liIdpatro, liIdprograma, liIdprocesso, liIdempresa,
                                                       sCodtiprecdes, sRecpag, sCodcentrorespon, sCodcentrocusto, sNumimovel,
                                                       bSegregaOrigem) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            //AL_10 - Não pode lançar rateio em documento já fechado
            if CtrlInvContab.Documento.DocumentoPendente then
            begin
               CtrlInvContab.CtrlDocumento.Rateiodocum.SetValues(rValor, rValorOM, rVlrresorcamen,
                                                                 liIdrateiodocum, liIdpessoa, liCoddocumento, liUnidnegoc, liMoecodigo, liIdusuarioinclusao,
                                                                 liIdreservaorcamen, liPlano, liIdplanoprev, liIdpatro, liIdprograma, liIdprocesso, liIdempresa,
                                                                 sCodtiprecdes, sRecpag, sCodcentrorespon, sCodcentrocusto, sNumimovel,
                                                                 bSegregaOrigem);
               if CtrlInvContab.CtrlDocumento.MessageInfo <> '' then
                  Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
            end
            else
               Raise Exception.Create('Não há um documento em aberto para lançar o rateio');
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.Insert: Boolean;
var sSql: String;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.Insert then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            // Chama o método da Ctrl Original do Padrão
            if not CtrlInvContab.CtrlDocumento.Insert then
               Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
            // É feita uma conversão para Integer para manter compatibilidade com as rotinas do Investimento
            CodDocumento := Trunc(CtrlInvContab.CtrlDocumento.CodDocumento);
            // Faz Update do FlgContaInvest no documento
            sSql := '';
            sSql := 'UPDATE DOCUMENTO SET FLGCONTAINVEST = ' + IntToStr(CtrlInvContab.Documento.ContaInvest) + ' WHERE  CODDOCUMENTO = ' + IntToStr(CodDocumento);
            if not TCtrlInvContab(Owner).ExecSQL(sSql, False) Then
               Raise Exception.Create(CtrlInvContab.MessageInfo);

            // Indica que o documento foi finalizado
            DocumentoPendente := False;
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.Update: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.Update then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            // Prepara variaveis de ambiente
            CtrlInvContab.CtrlDocumento.UsaPlanoPatro := CtrlInvContab.UsaPlanoPatro;
            CtrlInvContab.CtrlDocumento.IdEspAcesso := CtrlInvContab.EspAcesso;
            CtrlInvContab.CtrlDocumento.IdUsuario := CtrlInvContab.Usuario;
            // Executa o método
            if not CtrlInvContab.CtrlDocumento.Update then
               Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.Delete(iDocumento: Integer): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.Delete then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            //AL_8 - Inicio
            // Prepara variaveis de ambiente
            CtrlInvContab.CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
            CtrlInvContab.CtrlDocumento.UsaPlanoPatro := CtrlInvContab.UsaPlanoPatro;
            CtrlInvContab.CtrlDocumento.IdEspAcesso := CtrlInvContab.EspAcesso;
            CtrlInvContab.CtrlDocumento.IdUsuario := CtrlInvContab.Usuario;
            CtrlInvContab.CtrlDocumento.CodDocumento := iDocumento;
            if CtrlInvContab.Documento.ExisteDocumento(iDocumento) then
            begin
               //AL_7 - Exclui o documento
               if not CtrlInvContab.CtrlDocumento.Delete(False) then
                  Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
            end;
            //AL_8 - Fim
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;

function TInvDocumento.Estornar(dData: TDateTime;
                                liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento, liNumLanc, liPlanoConta: LongInt;
                                bUsaPlanoPatro: Boolean;
                                OperacaoEstorno: TOperacaoEstorno = oeSoProcessa;
                                liCodDocumento2: LongInt = 0; liNumLanc2: LongInt = 0;
                                bLancaContabEstornaAdianto: Boolean = True; bEstornoDocum: Boolean = false): Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.Estornar(dData,
                                           liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento, liNumLanc, liPlanoConta,
                                           bUsaPlanoPatro, OperacaoEstorno,
                                           liCodDocumento2, liNumLanc2,
                                           bLancaContabEstornaAdianto, bEstornoDocum) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';
         //AL_9 - Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            // Prepara variaveis de ambiente
            CtrlInvContab.CtrlDocumento.UsaPlanoPatro := CtrlInvContab.UsaPlanoPatro;
            CtrlInvContab.CtrlDocumento.IdEspAcesso := CtrlInvContab.EspAcesso;
            CtrlInvContab.CtrlDocumento.IdUsuario := CtrlInvContab.Usuario;
            CtrlInvContab.CtrlDocumento.CodDocumento := liCodDocumento;
            // Estorna o documento
            if not CtrlInvContab.CtrlDocumento.Estornar(dData,
                                                        liIdModulo, liIdEmpresa, liIdUsuario, liCodDocumento, liNumLanc, liPlanoConta,
                                                        bUsaPlanoPatro, OperacaoEstorno,
                                                        liCodDocumento2, liNumLanc2,
                                                        bLancaContabEstornaAdianto, bEstornoDocum) then
               Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;
   end;
end;


{ TBuscaPadrLanc }

constructor TBuscaPadrLanc.Create(Aowner: TCmControlObject);
begin
  inherited;

end;

destructor TBuscaPadrLanc.Destroy;
begin
  inherited;

end;

//AL_11
function TBuscaPadrLanc.ListPadrao(iSegmentacao:integer; dDataProc: TDateTime; iTipoInvest: Integer; sTipoMov: String; iTipoOperacao: Integer = 0;
                                   iTipoDespesa: Integer = 0; iInvestimento: Integer = -1; iCarteira: Integer = -1;
                                   sTipoTitulo: String = ''; iPlanoPatro: Integer = 0): OleVariant;
var sSql : String;
begin
   TRY
   sSql := 'SELECT P.IDPESSOA, P.IDTIPOINVEST, P.IDTIPOOPERACAO, P.IDTIPODESPINVEST, ' + #13 +
           '       P.IDCARTEIRAINVEST, P.CODTIPTITULO, P.IDINVESTIMENTO, P.IDFORCLI, P.FLGPAGRECNAO, P.RECPAG, ' + #13 +
           '       P.CODCENTRORESPON, P.CODTIPRECDES, P.UNIDNEGOC, P.PLANO, P.CONTADOPERFIN, P.CONTACOPERFIN, ' + #13 +
           '       P.CENCUSTDINVEST, P.CENCUSTCINVEST, P.IDEMPRESA, P.CODSUBCONTAD, P.CODSUBCONTAC, P.TIPCODIGO, ' + #13 +
           //AL_11
           '       P.TIPMOVCARTINV, P.TIPLANCINVEST, P.HISTLANCINVEST, P.IDREGRALANCONTINV, P.TIPFORNINV, P.IDPLANPREVCTBPATR, P.IDSEGMENTACAO' + #13 +
//           '      , MAX(DATAVIGENCIA) ' + #13 +
           'FROM PADRLANCCONTINV P ' + #13 +
           'WHERE P.IDPESSOA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
           '  AND P.IDEMPRESA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
           '  AND P.TIPMOVCARTINV = ' + QuotedStr(sTipoMov) + #13 +
           '  AND P.IDTIPOINVEST = ' + IntToStr(iTipoInvest);// + #13 +
//           '  AND DATAVIGENCIA <= TO_DATE(' + QuotedStr(dateToStr(dDataProc)) +','+ QuotedStr('dd/mm/yyyy')+')';

//   if CtrlPInv.idTipoInvest = 2 then  //Renda Variavel
    if iSegmentacao > 0 then
      sSql := sSql + #13 +
           '  AND P.IDSEGMENTACAO = ' + IntToStr(iSegmentacao);

   if sTipoMov <> 'ATU' then
      sSql := sSql + #13 +
           '  AND P.TIPLANCINVEST = ''N''';

   if iTipoOperacao <> 0 then  // Pode haver Tipos de Operação Negativos
      sSql := sSql + #13 +
           '  AND P.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);

  // if sTipoTitulo <> '' then
   //   sSql := sSql + #13 +
     //      '  AND CODTIPTITULO = ' + QuotedStr(sTipoTitulo);

   if iTipoDespesa <> 0 then  // Pode haver Tipos de Despesa Negativos
      sSql := sSql + #13 +
           '  AND P.IDTIPODESPINVEST = ' + IntToStr(iTipoDespesa)
   else
      sSql := sSql + #13 +
           '  AND P.IDTIPODESPINVEST IS NULL';

   if iCarteira > 0 then
      sSql := sSql + #13 +
           '  AND P.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)
   else
      sSql := sSql + #13 +
           '  AND P.IDCARTEIRAINVEST IS NULL';

   if iInvestimento > 0 then
      sSql := sSql + #13 +
           '  AND P.IDINVESTIMENTO = ' + IntToStr(iInvestimento)
   else
      sSql := sSql + #13 +
           '  AND P.IDINVESTIMENTO IS NULL';

   //AL_11
   if iPlanoPatro > 0 then
      sSql := sSql + #13 +
           '  AND P.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro)
   else
      sSql := sSql + #13 +
           '  AND P.IDPLANPREVCTBPATR IS NULL';

   sSql := sSql + #13 +
           'AND P.DATAVIGENCIA = (SELECT MAX(P1.DATAVIGENCIA) '+ #13 +
                                 'FROM PADRLANCCONTINV P1' + #13 +
                                 'WHERE P1.IDPESSOA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
                                 '  AND P1.IDEMPRESA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
                                 '  AND P1.TIPMOVCARTINV = ' + QuotedStr(sTipoMov) + #13 +
                                 '  AND P1.IDTIPOINVEST = ' + IntToStr(iTipoInvest) + #13 +
                                 '  AND P1.DATAVIGENCIA <= TO_DATE(' + QuotedStr(dateToStr(dDataProc)) +','+ QuotedStr('dd/mm/yyyy')+')';

                              //  if CtrlPInv.idTipoInvest = 2 then  //Renda Variavel
                                 if iSegmentacao > 0 then
                                    sSql := sSql + #13 + ' AND P1.IDSEGMENTACAO = ' + IntToStr(iSegmentacao);

                                 if sTipoMov <> 'ATU' then
                                    sSql := sSql + #13 +'  AND P1.TIPLANCINVEST = ''N''';

                                 if iTipoOperacao <> 0 then  // Pode haver Tipos de Operação Negativos
                                    sSql := sSql + #13 +'  AND P1.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);

                                   //Renan Cristiano Sol 129607 | Kintana 717461 Inicio.
                              //      if sTipoTitulo <> '' then
                                 //      sSql := sSql + #13 +'  AND CODTIPTITULO = ' + QuotedStr(sTipoTitulo);
                                      //Renan Cristiano Sol 129607 | Kintana 717461 Fim.

                                 if iTipoDespesa <> 0 then  // Pode haver Tipos de Despesa Negativos
                                    sSql := sSql + #13 +'  AND P1.IDTIPODESPINVEST = ' + IntToStr(iTipoDespesa)
                                   else
                                    sSql := sSql + #13 +'  AND P1.IDTIPODESPINVEST IS NULL';

                                 if iCarteira > 0 then
                                    sSql := sSql + #13 + '  AND P1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)
                                   else
                                    sSql := sSql + #13 + '  AND P1.IDCARTEIRAINVEST IS NULL';

                                 if iInvestimento > 0 then
                                    sSql := sSql + #13 +'  AND P1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)
                                   else
                                    sSql := sSql + #13 +'  AND P1.IDINVESTIMENTO IS NULL';

                                 //AL_11
                                 if iPlanoPatro > 0 then
                                    sSql := sSql + #13 +'  AND P1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro)+')'
                                   else
                                    sSql := sSql + #13 +'  AND P1.IDPLANPREVCTBPATR IS NULL)';

{   sSql := sSql + #13 +
        'GROUP BY IDPESSOA, IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST, ' +#13 +
        '         IDCARTEIRAINVEST, CODTIPTITULO, IDINVESTIMENTO, IDFORCLI, FLGPAGRECNAO, RECPAG, ' +#13 +
        '         CODCENTRORESPON, CODTIPRECDES, UNIDNEGOC, PLANO, CONTADOPERFIN, CONTACOPERFIN, ' +#13 +
        '         CENCUSTDINVEST, CENCUSTCINVEST, IDEMPRESA, CODSUBCONTAD, CODSUBCONTAC, TIPCODIGO, ' +#13 +
        '         TIPMOVCARTINV, TIPLANCINVEST, HISTLANCINVEST, IDREGRALANCONTINV, TIPFORNINV, IDPLANPREVCTBPATR, IDSEGMENTACAO' +#13;
 }
//   CMDebugToFile(sSql, 'C:\BuscaPadrLanc_Lista.txt');

       if sSql  = '' then
          sSql := 'SELECT * FROM DUAL';


          Result := TCtrlInvContab(Owner).GetDataPacket(sSql);


    EXCEPT
       On E:Exception Do
       Begin
          MessageInfo := E.Message;
       end;
    END;
end;

// -------------------------------------------------------------------------------------------------
// Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
// apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iTipoInvest       :  Id do Tipo de Investimento, tabela TipoInvest
//       iTipoOperacao     :  Id do Tipo de Operacao, tabela TipoOperacao
//       iTipoDespesa      :  Id do Tipo de Despesa, tabela DespesasXTipoOper (TIPODESPINVEST x TIPOOPERACAO)
//       iInvestimento     :  Id do Investimento, tabela Investimento
//       iCarteira         :  Id da Carteira de Investimentos, tabela CarteiraInvest
//       fValor            :  Valor a ser Contabilizado
//       sTipoTitulo       :  código do Tipo de Título, tabela CodTipoTitulo  (CodTipTitulo)
//       sTipoMov          :  OPE -> Operação
//                            DOP -> Despesa de Operação
//                            ATU -> Atualização
//       iPlanoPatro      :  Plano / Patrocinadora
//
//    A função carrega as properties do objeto CtrlInvContab.BuscaPadrLanc
//       Plano            :  plano de contas usado para os lançamentos contábeis
//       ContaDeb         :  Conta contabil a Débito
//       ContaCre         :  Conta contábil a Crédito
//       CentroCustoDeb   :  Centro de Custo a Débito
//       CentroCustoCre   :  Centro de Custo a Crédito
//       SubContaDeb      :  Sub-Conta a Débito
//       SubContaCred     :  Sub-Conta a Crédito
//       TipoPer          :
//       CentroRespon     :  Centro de Responsabilidade
//       UnidNegoc        :  Unidade de Negócio
//       TipoRecDes       :  Tipo de Receita / Despesa
//       Historico        :  Histórico Contábil da Operação
//       RecPagNao        :  Flag se Recebimento, Pagamento ou Nenhum dos dois
//
//    Códigos de retorno (controle de erro):
//        0 : Situação normal
//       -1 : Não encontrou nenhuma parametrização
//       -4 : Erro: ambigüidade no Padrão de Lançamento
//       -5 : Erro: nenhum Padrão de Lançamento que atenda os parâmetros passados
//--------------------------------------------------------------------------------------------------
// AL_11
function TBuscaPadrLanc.Executa(iSegmentacao: integer;
                               dDataProc: TDateTime;
                               iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira,iPlanoPatro: Integer;
                               fValor: Double;
                               sTipoTitulo, sTipoMov: string): Integer;
var cdsParamInvest, cdsParamContab, cdsPlanoVigente: TCMClientDataSet;

begin
   if ConnectionSide = cnsClient then
   begin
      // AL_11
      if Connection.AppServer.Executa(iTipoInvest, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira, iPlanoPatro,
                                      fValor, sTipoTitulo, sTipoMov) < 0 then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         cdsParamInvest := TCMClientDataSet.Create(Nil);
         cdsParamInvest.Data := CtrlInvContab.CtrlParamInvest.ListParamInvest;
         cdsParamContab := TCMClientDataSet.Create(Nil);
         cdsPlanoVigente := TCMClientDataSet.Create(Nil);
         try
            //AL_11 - Ini - Alterado o algorítimo de busca (Por Nível)
            // A Principio, não existe parametrização
            Result := 0;
            MessageInfo := 'Nenhuma parametrização encontrada.';
//            cdsParamContab.Data := ListPadrao(0,0, 0, '', 0, 0, 0, 0, '', 0);

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 5 - mais detalhado (5 parâmetros passados)
            cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira, sTipoTitulo, iPlanoPatro);
            Result := cdsParamContab.RecordCount;

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 4 - menos detalhado (4 parâmetros passados)
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora / Carteira / Investimento
               cdsParamContab.Close;               
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora / Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, 0, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora / Carteira / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, iCarteira, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Carteira / Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Carteira / Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, iCarteira, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 3 - menos detalhado (3 parâmetros passados)
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora / Investimento
               cdsParamContab.Close;               
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, 0, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora / Carteira
               cdsParamContab.Close;               
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, iCarteira, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Carteira / Investimento
               cdsParamContab.Close;               
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, iCarteira, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Carteira / Investimento
               //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
               cdsParamContab.Close;               
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, iCarteira, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, 0, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, 0, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, 0, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Carteira / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, iCarteira, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Carteira / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, iCarteira, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Carteira / Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, iCarteira, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 2 - menos detalhado (2 parâmetros passados)
            if Result = 0 then
            begin
               // Tipo Despesa / Investimento
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, iInvestimento, 0, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Investimento
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, 0, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Plano Patrocinadora
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, 0, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Carteira
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, iCarteira, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Carteira
               cdsParamContab.Close;               
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, iCarteira, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Carteira / Investimento
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, iCarteira, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, 0, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, 0, sTipoTitulo, iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Investimento / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, 0, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Carteira / Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, iCarteira, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 1 - menos detalhado (1 parâmetros passados)
            if Result = 0 then
            begin
               // Tipo Titulo
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, 0, sTipoTitulo, 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Carteira
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, iCarteira, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Investimento
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, iInvestimento, 0, '', 0);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Plano Patrocinadora
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, 0, 0, 0, '', iPlanoPatro);
               Result := cdsParamContab.RecordCount;
            end;
            if Result = 0 then
            begin
               // Tipo Despesa
               cdsParamContab.Close;
               cdsParamContab.Data := ListPadrao(iSegmentacao,dDataProc, iTipoInvest, sTipoMov, iTipoOperacao, iTipoDespesa, 0, 0, '', 0);
               Result := cdsParamContab.RecordCount;
            end;

            if Result <= 1 then
            begin
               // Verifica se existe um padrão válido
               if (cdsParamContab.Active) and (cdsParamContab.RecordCount = 1) then
               begin

                  //Renan Cristiano Sol 130402 | Kintana 731769 Inicio.
                  cdsPlanoVigente.data := TCtrlInvContab(Owner).GetDataPacket('SELECT PARAMCONTAB.PLANO FROM PARAMCONTAB');
                  // Se o Plano encontrado for igual ao plano Vigente continua.
                  if cdsPlanoVigente.FieldByName('PLANO').AsInteger = cdsParamContab.FieldByName('PLANO').AsInteger then
                  begin
                  //Renan Cristiano Sol 130402 | Kintana 731769 Fim.

                    Plano    := cdsParamContab.FieldByName('PLANO').AsInteger;
                    ContaDeb := cdsParamContab.FieldByName('CONTADOPERFIN').AsString;
                    ContaCre := cdsParamContab.FieldByName('CONTACOPERFIN').AsString;

                    if ((iTipoOperacao = -63) or (iTipoOperacao = -67) or
                        ((cdsParamInvest.FieldByName('IDTIPOOPERDIRPER').AsInteger = iTipoOperacao) or
                         (cdsParamInvest.FieldByName('IDTIPOOPERDIRPER').AsInteger + 10000 = iTipoOperacao)) or
                        ((cdsParamInvest.FieldByName('IDTIPOOPERDIRDSA').AsInteger = iTipoOperacao) or
                         (cdsParamInvest.FieldByName('IDTIPOOPERDIRDSA').AsInteger + 10000 = iTipoOperacao))) then
                    begin
                       //Transf. de Carteira//Permuta//Subscrição em Ações
                       if fValor >= 0 then
                       begin
                          ContaDeb := cdsParamContab.FieldByName('CONTADOPERFIN').AsString;
                          ContaCre := cdsParamContab.FieldByName('CONTACOPERFIN').AsString;
                       end
                       else
                       begin
                          ContaDeb := cdsParamContab.FieldByName('CONTACOPERFIN').AsString;
                          ContaCre := cdsParamContab.FieldByName('CONTADOPERFIN').AsString;
                       end;
                    end;

                    //Centro de Custo
                    CentroCustoCred := cdsParamContab.FieldByName('CENCUSTCINVEST').AsString;
                    CentroCustoDeb := CentroCustoCred;

                    // Sub-Conta
                    SubContaDeb := cdsParamContab.FieldByName('CODSUBCONTAD').AsInteger;
                    if SubContaDeb = 0 then SubContaDeb  := -1;
                    SubContaCre := cdsParamContab.FieldByName('CODSUBCONTAC').AsInteger;
                    if SubContaCre = 0 then SubContaCre := -1;

                    // Unidade de Negócio ou "Atividade/Projeto"
                    UnidNegoc := cdsParamContab.FieldByName('UNIDNEGOC').AsInteger;
                    if UnidNegoc = 0 then UnidNegoc := -1;

                    // Centro de Responsabilidade
                    CentroRespon := cdsParamContab.FieldByName('CODCENTRORESPON').AsString;

                    // Tipo de Recebimento/Desembolso
                    TipoRecDes := cdsParamContab.FieldByName('CODTIPRECDES').AsString;

                    // Tipo de Operacao
                    TipoPer := cdsParamContab.FieldByName('TIPCODIGO').AsString;

                    // Histórico Contábil
                    Historico := cdsParamContab.FieldByName('HISTLANCINVEST').AsString;
                    RecPagNao := cdsParamContab.FieldByName('FLGPAGRECNAO').AsString;
                    PlanoPatro := cdsParamContab.FieldByName('IDPLANPREVCTBPATR').AsInteger;

                    Result := 0;
                  end
                  //Renan Cristiano Sol 130402 | Kintana 731769 Inicio.
                  else
                  begin
                    Result := -5;
                    MessageInfo := 'Não existe parametrização contábil / financeira para o Plano Vigente.';
                  end;
                  //Renan Cristiano Sol 130402 | Kintana 731769 Fim.
                  cdsPlanoVigente.Close;
                  cdsParamContab.Close;                  
               end
               else
               begin
                  // Não foi encontrado um parametro Contabil/Financeiro
                  Result := -5;
                  MessageInfo := 'Não existe parametrização contábil / financeira que atenda a esta operação.';
                  cdsParamContab.Close;
               end;
            end
            else
            begin
               MessageInfo := 'Existem mais de uma parametrização contábil / Financeira que atendem a esta operação';
               while not cdsParamContab.Eof do
               begin
                  MessageInfo := MessageInfo + #13 + cdsParamContab.FieldByName('HISTLANCINVEST').AsString;
                  cdsParamContab.Next;
               end;
               cdsParamContab.Close;
            end;
            //AL_11 - Fim
         except
            on E : Exception do
            begin
              Result := -1;
              MessageInfo := E.Message;
            end;
         end;
      finally
         FreeAndNil(cdsParamInvest);
         FreeAndNil(cdsParamContab);
         FreeAndNil(CdsPlanoVigente);
      end;
   end;
end;


function TBuscaPadrLanc.ListPadraoRF(iTipoOperacao, iInvestimento, iCarteira, iClasseTit, iItemRenFix: Integer): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT IDPESSOA, IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO, IDCARTEIRAINVEST, IDINVESTIMENTO, ' + #13 +
           '       IDFORCLI, FLGPAGRECNAO, RECPAG, CODCENTRORESPON, CODTIPRECDES, UNIDNEGOC, ' + #13 +
           '       PLANO, CONTADOPERFIN, CONTACOPERFIN, CENCUSTDINVEST, CENCUSTCINVEST, ' + #13 +
           '       IDEMPRESA, CODSUBCONTAD, CODSUBCONTAC, TIPCODIGO, TIPLANCINVEST, ' + #13 +
           '       HISTLANCINVEST, IDREGRALANCONTINV, TIPFORNINV, IDCLASSETIT, IDITEMRENFIX ' + #13 +
           'FROM PADRLANCCONTINV ' + #13 +
           'WHERE IDPESSOA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
           '  AND IDEMPRESA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
           '  AND IDTIPOINVEST = 1 ' + #13 +
           '  AND IDTIPOOPERACAO ' + CtrlInvContab.IIF(iTipoOperacao <> 0, ' = ' + IntToStr(iTipoOperacao), 'IS NULL') + #13 +
           '  AND IDCARTEIRAINVEST ' + CtrlInvContab.IIF(iCarteira > 0, ' = ' + IntToStr(iCarteira), 'IS NULL') + #13 +
           '  AND IDINVESTIMENTO ' + CtrlInvContab.IIF(iInvestimento > 0, ' = ' + IntToStr(iInvestimento), ' IS NULL') + #13 +
           '  AND IDCLASSETIT ' + CtrlInvContab.IIF(iClasseTit > 0, ' = ' + IntToStr(iClasseTit), ' IS NULL') + #13 +
           '  AND IDITEMRENFIX ' + CtrlInvContab.IIF(iItemRenFix <> 0, ' = ' + IntToStr(iItemRenFix), ' IS NULL');

   Result := TCtrlInvContab(Owner).GetDataPacket(sSql);
end;

// -------------------------------------------------------------------------------------------------
// Função que busca na tabela PadrLancContInv o conjunto de parâmetros de integração mais
// apropriado, dadas as condições passadas. Mesma função p/ Operação quanto p/ Despesa de Operação
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros:
//       iTipoOperacao     :  Id do Tipo de Operacao,          tabela TipoOperacao
//       iInvestimento     :  Id do Investimento,              tabela Investimento
//       iCarteira         :  Id da Carteira de Investimentos, tabela CarteiraInvest
//       iClasseTit        :  Id da Classe do Título,          tabela ClasseTitRenFix
//       iItemRenFix       :  Id do Item do Perfil,            tabela CurvasXItemRenFix (CurvasRenFix X ItemRenFix)
//       fValor            :  Valor a ser Contabilizado
//       sTipoItem         :  Código do Tipo de Item
//
//    A função carrega as properties do objeto CtrlInvContab.BuscaPadrLanc
//       Plano            :  plano de contas usado para os lançamentos contábeis
//       ContaDeb         :  Conta contabil a Débito
//       ContaCre         :  Conta contábil a Crédito
//       CentroCustoDeb   :  Centro de Custo a Débito
//       CentroCustoCre   :  Centro de Custo a Crédito
//       SubContaDeb      :  Sub-Conta a Débito
//       SubContaCred     :  Sub-Conta a Crédito
//       TipoPer          :
//       CentroRespon     :  Centro de Responsabilidade
//       UnidNegoc        :  Unidade de Negócio
//       TipoRecDes       :  Tipo de Receita / Despesa
//       Historico        :  Histórico Contábil da Operação
//       RecPagNao        :  Flag se Recebimento, Pagamento ou Nenhum dos dois
//--------------------------------------------------------------------------------------------------

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TBuscaPadrLanc.ListPadraoEmp(sTipoMov: String;
                                      iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa, iPlanoPatro: Integer;
                                      dDataProc: TDateTime): OleVariant;
var sSql : String;
begin
   sSql := 'SELECT P.IDPESSOA, P.IDPADRLANCCONT, P.IDTIPOINVEST, P.IDTIPOOPERACAO, P.IDTIPODESPINVEST, ' + #13 +
           '       P.IDCARTEIRAINVEST, P.IDINVESTIMENTO, P.IDFORCLI, P.FLGPAGRECNAO, P.RECPAG, ' + #13 +
           '       P.CODCENTRORESPON, P.CODTIPRECDES, P.UNIDNEGOC, P.PLANO, P.CONTADOPERFIN, P.CONTACOPERFIN, ' + #13 +
           '       P.CENCUSTDINVEST, P.CENCUSTCINVEST, P.IDEMPRESA, P.CODSUBCONTAD, P.CODSUBCONTAC, P.TIPCODIGO, ' + #13 +
           '       P.TIPLANCINVEST, P.HISTLANCINVEST, P.IDREGRALANCONTINV, P.TIPFORNINV ' + #13 +
           'FROM PADRLANCCONTINV P' + #13 +
           'WHERE P.IDPESSOA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
           '  AND P.IDEMPRESA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
           '  AND P.TIPMOVCARTINV = ' + QuotedStr(sTipoMov) + #13 +
           '  AND P.IDTIPOINVEST = ' + IntToStr(iTipoInvest) + #13 +
           CtrlInvContab.IIF(iTipoOperacao  = 0, '', '  AND P.IDTIPOOPERACAO = ' +   IntToStr(iTipoOperacao) + #13) +
           CtrlInvContab.IIF(iCarteira     <= 0, '', '  AND P.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + #13) +
           CtrlInvContab.IIF(iInvestimento <= 0, '', '  AND P.IDINVESTIMENTO = ' +   IntToStr(iInvestimento) + #13) +
           CtrlInvContab.IIF(iTipoDespesa  <= 0, '', '  AND P.IDTIPODESPINVEST = ' + IntToStr(iTipoDespesa) + #13) +
           CtrlInvContab.IIF(iSegmentacao  <= 0, '', '  AND P.IDSEGMENTACAO = ' + IntToStr(iSegmentacao) + #13) +
           CtrlInvContab.IIF(iPlanoPatro   <= 0, '', '  AND P.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + #13) +
           '  AND P.DATAVIGENCIA = (SELECT MAX(P1.DATAVIGENCIA) '+ #13 +
                                   'FROM PADRLANCCONTINV P1' + #13 +
                                   'WHERE P1.IDPESSOA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
                                   '  AND P1.IDEMPRESA = ' + IntToStr(CtrlInvContab.Empresa) + #13 +
                                   '  AND P1.TIPMOVCARTINV = ' + QuotedStr(sTipoMov) + #13 +
                                   '  AND P1.IDTIPOINVEST = ' + IntToStr(iTipoInvest) + #13 +
                                   '  AND P1.DATAVIGENCIA <= TO_DATE(' + QuotedStr(dateToStr(dDataProc)) +','+ QuotedStr('dd/mm/yyyy')+')'+#13+
                                   CtrlInvContab.IIF(iTipoOperacao  = 0, '', '  AND P1.IDTIPOOPERACAO = ' +   IntToStr(iTipoOperacao) + #13) +
                                   CtrlInvContab.IIF(iCarteira     <= 0, '', '  AND P1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + #13) +
                                   CtrlInvContab.IIF(iInvestimento <= 0, '', '  AND P1.IDINVESTIMENTO = ' +   IntToStr(iInvestimento) + #13) +
                                   CtrlInvContab.IIF(iTipoDespesa  <= 0, '', '  AND P1.IDTIPODESPINVEST = ' + IntToStr(iTipoDespesa) + #13) +
                                   CtrlInvContab.IIF(iSegmentacao  <= 0, '', '  AND P1.IDSEGMENTACAO = ' + IntToStr(iSegmentacao) + #13) +
                                   CtrlInvContab.IIF(iPlanoPatro   <= 0, '', '  AND P1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanoPatro) + #13) + ')';

   Result := TCtrlInvContab(Owner).GetDataPacket(sSql);
end;

function TBuscaPadrLanc.ExecutaRF(iTipoOperacao, iInvestimento, iCarteira, iClasseTit, iItemRenFix: Integer;
                                  fValor: Double = 0; sTipoItem: String = ''): Boolean;
var cdsParamContab: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      if Connection.AppServer.Executa(iTipoOperacao, iInvestimento, iCarteira, iClasseTit, iItemRenFix, sTipoItem, fValor) < 0 then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         cdsParamContab := TCMClientDataSet.Create(Nil);
         try
            // Correção Negativa
            if (iItemRenFix > 0) and (sTipoItem = 'M') and (fValor < 0)then
               iItemRenFix := -16;

            // Prejuízo não inverte as contas
            if iItemRenFix = -10 then
               fValor := Abs(fValor);

            // A Principio, não existe parametrização
            Result := False;
            MessageInfo := 'Nenhuma parametrização encontrada.';
            cdsParamContab.Data := ListPadraoRF;

            // 1º Passo: Todos os parâmetros
            // TipoInvest + TipoOperacao + Carteira + Investimento + ClasseTit + ItemRenFix(caso mais detalhado)
            if ( (iCarteira > 0) and (iInvestimento > 0) and (iClasseTit > 0 )) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, iInvestimento, iCarteira, iClasseTit, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 1º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // 2º Passo: Todos os parâmetros menos Carteira
            // TipoInvest + TipoOperacao + Investimento + ClasseTit + ItemRenFix
            if ( (not Result) and (iInvestimento > 0) and (iClasseTit > 0 )) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, iInvestimento, -1, iClasseTit, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 2º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // 3º Passo: Todos os parâmetros menos Investimento
            // TipoInvest + TipoOperacao + Carteira  + ClasseTit + ItemRenFix
            if ( (not Result) and (iCarteira > 0) and (iClasseTit > 0 )) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, -1, iCarteira, iClasseTit, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 3º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // 4º Passo: Todos os parâmetros menos ClasseTit
            // TipoInvest + TipoOperacao + Carteira + Investimento + ItemRenFix
            if ( (Result = False) and (iCarteira > 0) and (iInvestimento > 0)) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, iInvestimento, iCarteira, -1, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 4º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // 5º Passo: Todos os parâmetros menos Carteira e Investimento
            // TipoInvest + TipoOperacao + ClasseTit + ItemRenFix
            if ( (Result = False) and (iClasseTit > 0 ) ) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, -1, -1, iClasseTit, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 5º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // 6º Passo: Todos os parâmetros menos Carteira e ClasseTit
            // TipoInvest + TipoOperacao + Investimento + ItemRenFix
            if ( (Result = False) and (iInvestimento > 0) ) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, iInvestimento, -1, -1, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 6º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // 7º Passo: Todos os parâmetros menos Carteira, ClasseTit e Investimento
            // TipoInvest + TipoOperacao + ItemRenFix
            if (Result = False) then
            begin
               cdsParamContab.Data := ListPadraoRF(iTipoOperacao, -1, -1, -1, iItemRenFix);
               if cdsParamContab.RecordCount > 1 then
                  Raise Exception.Create('Foi encontrado ambigüidade no 7º passo do padrão de lançamento contábil da operação!')
               else Result := (cdsParamContab.RecordCount = 1);
            end;

            // Achou um padrão
            if Result then
            begin
               // Verifica se existe um padrão válido
               if (cdsParamContab.Active) and (cdsParamContab.RecordCount = 1) then
               begin
                  FPlano     := cdsParamContab.FieldByName('PLANO').AsInteger;

                  if (fValor >= 0) or ((fValor < 0) and (iItemRenFix = -16)) then
                  begin
                     FContaDeb  := cdsParamContab.FieldByName('CONTADOPERFIN').AsString;
                     FContaCred := cdsParamContab.FieldByName('CONTACOPERFIN').AsString;
                  end else begin
                     FContaDeb  := cdsParamContab.FieldByName('CONTACOPERFIN').AsString;
                     FContaCred := cdsParamContab.FieldByName('CONTADOPERFIN').AsString;
                  end;

                  //Centro de Custo - Agora é único (Débito e Crédito)
                  FCentroCustoCred := cdsParamContab.FieldByName('CENCUSTCINVEST').AsString;
                  FCentroCustoDeb := FCentroCustoCred;

                  // Sub-Conta -> Se Nulo então = -1
                  FSubContaDeb := cdsParamContab.FieldByName('CODSUBCONTAD').AsInteger;
                  if FSubContaDeb = 0 then FSubContaDeb  := -1;
                  FSubContaCre := cdsParamContab.FieldByName('CODSUBCONTAC').AsInteger;
                  if FSubContaCre = 0 then FSubContaCre := -1;

                  // Unidade de Negócio ou "Atividade/Projeto" -> Se Nulo então = -1
                  FUnidNegoc := cdsParamContab.FieldByName('UNIDNEGOC').AsInteger;
                  if UnidNegoc = 0 then UnidNegoc := -1;

                  // Centro de Responsabilidade
                  CentroRespon := cdsParamContab.FieldByName('CODCENTRORESPON').AsString;

                  // Tipo de Recebimento/Desembolso
                  TipoRecDes := cdsParamContab.FieldByName('CODTIPRECDES').AsString;

                  // Tipo de Operacao
                  TipoPer := cdsParamContab.FieldByName('TIPCODIGO').AsString;

                  // Histórico Contábil
                  Historico := cdsParamContab.FieldByName('HISTLANCINVEST').AsString;
                  RecPagNao := cdsParamContab.FieldByName('FLGPAGRECNAO').AsString;
               end
               else
                  // Nenhum Padrão de Lançamento que atenda os parâmetros passados
                  Raise Exception.Create('Não foi encontrado o padrão de lançamento contábil para a operação');
            end
         Except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         FreeAndNil(cdsParamContab);
      end;
   end;
end;

//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
function TBuscaPadrLanc.ExecutaEmp(iSegmentacao, iPlanoPatro, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa: Integer;
                                   sTipoMov: string;
                                   fValor: Double;
                                   dDataProc: TDateTime): Boolean;
var cdsParamContab: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.Executa(iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa,
                                          sTipoMov, fValor) then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         cdsParamContab := TCMClientDataSet.Create(Nil);
         try
            // A Principio, não existe parametrização
            Result := False;
            MessageInfo := 'Nenhuma parametrização encontrada.';
//Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
//            cdsParamContab.Data := ListPadraoEmp('', 0, 0, 0, 0, 0, 0, 0, 0);

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 5 - mais detalhado (5 parâmetros passados)
            //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
            cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa, iPlanoPatro, dDataProc);
            Result := (cdsParamContab.RecordCount = 1);

            // --------------------------------------------------------------------------------------------------------------------------------
            // Nível 4 - menos detalhado (4 parâmetros passados)
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora / Carteira / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora / Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora / Carteira / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Carteira / Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Carteira / Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;

            // ----------------------------------------------------------------------------------------------------------------------
            // Nível 3 - menos detalhado (3 parâmetros passados)
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora / Carteira
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Carteira / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Carteira / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Carteira / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Carteira / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Carteira / Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;

            // ----------------------------------------------------------------------------------------------------------------------
            // Nível 2 - menos detalhado (2 parâmetros passados)
            if not Result then
            begin
               // Tipo Despesa / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Plano Patrocinadora
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, iTipoDespesa, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Carteira
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Carteira
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Carteira / Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, iCarteira, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Investimento / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Carteira / Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;

            // ----------------------------------------------------------------------------------------------------------------------
            // Nível 1 - menos detalhado (1 parâmetros passados)
            if not Result then
            begin
               // Tipo Titulo
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Carteira
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, iCarteira, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Investimento
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, iInvestimento, 0, 0, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Plano Patrocinadora
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, 0, iPlanoPatro, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;
            if not Result then
            begin
               // Tipo Despesa
               cdsParamContab.Close;
               //Ricardo Cristiano - 24/10/2011 - N. Sol 167146 -  N. Kintana 1464884
               cdsParamContab.Data := ListPadraoEmp(sTipoMov, iSegmentacao, iTipoInvest, iTipoOperacao, 0, 0, iTipoDespesa, 0, dDataProc);
               Result := (cdsParamContab.RecordCount = 1);
            end;

            if Result then
            begin
               // Verifica se existe um padrão válido
               if (cdsParamContab.Active) and (cdsParamContab.RecordCount = 1) then
               begin
                  Plano    := cdsParamContab.FieldByName('PLANO').AsInteger;
                  // Se o valor da Operação for negativo, inverte as contas
                  ContaDeb := CtrlInvContab.IIF(fValor > 0, cdsParamContab.FieldByName('CONTADOPERFIN').AsString,
                                                            cdsParamContab.FieldByName('CONTACOPERFIN').AsString);
                  ContaCre := CtrlInvContab.IIF(fValor > 0, cdsParamContab.FieldByName('CONTACOPERFIN').AsString,
                                                            cdsParamContab.FieldByName('CONTADOPERFIN').AsString);
                  //Centro de Custo
                  CentroCustoCred := cdsParamContab.FieldByName('CENCUSTCINVEST').AsString;
                  CentroCustoDeb := CentroCustoCred;
                  // Sub-Conta
                  SubContaDeb := cdsParamContab.FieldByName('CODSUBCONTAD').AsInteger;
                  if SubContaDeb = 0 then SubContaDeb  := -1;
                  SubContaCre := cdsParamContab.FieldByName('CODSUBCONTAC').AsInteger;
                  if SubContaCre = 0 then SubContaCre := -1;
                  // Unidade de Negócio ou "Atividade/Projeto"
                  UnidNegoc := cdsParamContab.FieldByName('UNIDNEGOC').AsInteger;
                  if UnidNegoc = 0 then UnidNegoc := -1;
                  // Centro de Responsabilidade
                  CentroRespon := cdsParamContab.FieldByName('CODCENTRORESPON').AsString;
                  // Tipo de Recebimento/Desembolso
                  TipoRecDes := cdsParamContab.FieldByName('CODTIPRECDES').AsString;
                  // Tipo de Operacao
                  TipoPer := cdsParamContab.FieldByName('TIPCODIGO').AsString;
                  // Histórico Contábil
                  Historico := cdsParamContab.FieldByName('HISTLANCINVEST').AsString;
                  RecPagNao := cdsParamContab.FieldByName('FLGPAGRECNAO').AsString;
               end
               else
                  Raise Exception.Create('Não foi encontrado o padrão de lançamento contábil para a operação');
            end
         Except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
         cdsParamContab.Close;
         FreeAndNil(cdsParamContab);
      end;
   end;
end;

procedure TBuscaPadrLanc.SetCentroCustoCred(const Value: String);
begin
  FCentroCustoCred := Value;
end;

procedure TBuscaPadrLanc.SetCentroCustoDeb(const Value: String);
begin
  FCentroCustoDeb := Value;
end;

procedure TBuscaPadrLanc.SetCentroRespon(const Value: String);
begin
  FCentroRespon := Value;
end;

procedure TBuscaPadrLanc.SetContaCred(const Value: String);
begin
  FContaCred := Value;
end;

procedure TBuscaPadrLanc.SetContaDeb(const Value: String);
begin
  FContaDeb := Value;
end;

procedure TBuscaPadrLanc.SetHistorico(const Value: String);
begin
  FHistorico := Value;
end;

procedure TBuscaPadrLanc.SetPlano(const Value: Integer);
begin
  FPlano := Value;
end;

procedure TBuscaPadrLanc.SetRecPagNao(const Value: String);
begin
  FRecPagNao := Value;
end;

procedure TBuscaPadrLanc.SetSubContaCre(const Value: Integer);
begin
  FSubContaCre := Value;
end;

procedure TBuscaPadrLanc.SetSubContaDeb(const Value: Integer);
begin
  FSubContaDeb := Value;
end;

procedure TBuscaPadrLanc.SetTipoPer(const Value: String);
begin
  FTipoPer := Value;
end;

procedure TBuscaPadrLanc.SetTipoRecDes(const Value: String);
begin
  FTipoRecDes := Value;
end;

procedure TBuscaPadrLanc.SetUnidNegoc(const Value: Integer);
begin
  FUnidNegoc := Value;
end;

procedure TInvDocumento.DoChangeDataBase;
begin
  inherited;
  //AL_8
  dbDocumento.DataBaseName := DataBaseName;
end;


function TInvDocumento.ExisteDocumento(iCodDoc: Integer = -1): Boolean;
var cdsTemp: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.ExisteDocumento then
         MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         cdsTemp := TCMClientDataSet.Create(Nil);
         try
            Result := False;
            // Se Foi passado um Documento como parâmetro
            if iCodDoc > 0 then
               // Carrega a property com o parâmetro passado
               FNoDocumento := iCodDoc
            else
            begin
               // Se não foi passado, testa se existe um documento carregado na property
               if FNoDocumento = 0 then
                  Raise Exception.Create('Código de documento não informado');
            end;
            // Busca o documento no banco
            cdsTemp.Data := TCtrlInvContab(Owner).GetDataPacket('SELECT CODDOCUMENTO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + IntToStr(FNoDocumento));
            // Se não estiver vazia, o documento existe
            if not cdsTemp.IsEmpty then
               Result := True;
         except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         FreeAndNil(cdsTemp);
      end;
   end;
end;

//AL_11
procedure TBuscaPadrLanc.SetPlanoPatro(const Value: Integer);
begin
  FPlanoPatro := Value;
end;

//Ricardo Cristiano - 15/01/2010 - N. Sol 115288 / 682 -  N. Kintana 712646
function TInvDocumento.CCBAIXASXDOCUMSetValues(rValor: Double; liIdCcBaixasxDocum,
                                               liIdpessoa, liCodDocumento, liUnidNegoc, liPlano, liIdplanoPrev,
                                               liIdPatro, liIdSegregaCriter: Integer; sPlaConta: String) : boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.CCBAIXASXDOCUMSetValues(rValor, liIdCcBaixasxDocum, liIdpessoa, liCodDocumento,
                                                          liUnidNegoc, liPlano, liIdplanoPrev,
                                                          liIdPatro, liIdSegregaCriter, sPlaConta) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try
         // Limpa a mensagem de erro local
         MessageInfo := '';

         //Testa se o módulo ativo integra contabil e financeiro
         if CtrlInvContab.IntegraCtbFinModulo then
         begin
            //Não pode lançar em documento já fechado
            if CtrlInvContab.Documento.DocumentoPendente then
            begin
               CtrlInvContab.CtrlDocumento.CcBaixasxDocum.SetValues(rValor, liIdCcBaixasxDocum, liIdpessoa, liCodDocumento,
                                                                    liUnidNegoc, liPlano, liIdplanoPrev,
                                                                    liIdPatro, liIdSegregaCriter, sPlaConta);

               if CtrlInvContab.CtrlDocumento.MessageInfo <> '' then
                  Raise Exception.Create(CtrlInvContab.CtrlDocumento.MessageInfo);
            end
            else
               Raise Exception.Create('Não há um documento em aberto para lançar o rateio');
         end;
         Result := True;
      except
         on E : Exception do
         begin
           Result := False;
           MessageInfo := E.Message;
         end;
      end;

   end;
end;

end.


