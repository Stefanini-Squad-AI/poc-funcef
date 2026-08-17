unit DModAutoAtendimento;

interface

uses
  Windows, SysUtils, Forms, Classes, Db, FileCtrl, JclSysUtils, registry,
  DBTables, ADODB, JCLStrings, HTTPApp, DBClient, uDataBase, uCtrlPadroes,
  uCmFileUtils, uCmCrypto, uCmTypes, uCMClientDataSet, CMDatabase, uConstPaginasCampos,
  uDiasUteis, ppDB, ppDBPipe, TXComp, ppBands, ppCache, ppClass, ppComm, ppRelatv,
  ppProd, ppReport, Math, uSistema, 
  uCtrlWebConfiguracao, uCtrlWebSessao, uCtrlWebPaginaCampo,
  uCtrlWebTpUsuPagina, uCtrlWebTpUsuCampo, uCtrlWebDadosCadastrais,
  uCtrlTempoServico, uCtrlWebContribuicoes, uCtrlWebReserva, uCtrlWebEventosPrev,
  uCtrlWebHistRubSal, uCtrlWebImagem, uCtrlWebHistBenef, uCtrlWebSitAtualBenef, 
  uCtrlWebConsignacao, uCtrl_EndPess, uCtrl_TelEndPess, uCtrl_Pessoa,
  uCtrl_Dependente, uCtrlWebEmprestimo, uCtrlWebRegra, uCtrlWebEmpresaProp,
  uCtrlWebTransfPlano, uCtrlSimulaTransfPlano, uCtrlWebBeneficio, uCtrlWebAcesso,
  uCtrlWebInterface, uCtrl2ViaContraCheque, uCtrl_InscricaoEmptmo,
  uCtrl_HistMovInscricao, uCtrlWebReports, uCtrlReports, uCtrlInformeRendimentos,
  uCtrlSimulaBenef, uCtrlWebCfgInfRend, uCtrlWebHstAcesso, uCtrlWebPagAcessadas,
  uCtrlExtratoReserva, uResource, uCtrlFuncoesAA, TXRB,
  {No padrão 15, trocar uCtrlMsgContexto14 abaixo por uCtrlMsgContexto}
  uCtrlMensagens, uCtrlMsgPreDef, uCtrlMsgContexto,
  uCtrlWebTpReports; // Pendência 19090 - Alberto

const
  //Carriage Return
  CR = #13 + #10;
  //Pendência 23402 - 28/02/2007 - Alberto - Padrão 14
  IdMsgContexto : Integer = 6;
  //Fim Pendência 23402

type

  //Tipo de relatório
  //  rtReportGenerator - Feito pelo gerador de relatórios
  //  rtHTML            - Feito em HTML
  TReportType = ( rtReportGenerator, rtHTML );

  TdtmModAutoAtendimento = class(TDataModule)
    dbADOBaseDados: TADOConnection;
    cdsSessao: TCMClientDataSet;
    cdsSessaoIDWEBSESSAO: TStringField;
    cdsSessaoDTINICIO: TDateTimeField;
    cdsSessaoDTULTACESSO: TDateTimeField;
    cdsSessaoLOGINPESSOAL: TStringField;
    cds: TCMClientDataSet;
    cdsWebCampo: TCMClientDataSet;
    cdsWebPagina: TCMClientDataSet;
    dbBaseDados: TCMDatabase;
    cdsAux: TCMClientDataSet;
    sssSessao: TSession;
    cdsHTMLColumns: TCMClientDataSet;
    cdsEmprestimosAnt: TCMClientDataSet;
    cdsEmprestimosAntIDCONTRATOEMPTMO: TFloatField;
    cdsEmprestimosAntVLRCONTRATO: TFloatField;
    cdsEmprestimosAntDATACREDITO: TDateTimeField;
    cdsEmprestimosAntFLGFORMAREC: TStringField;
    cdsEmprestimosAntIDINSCRICAOEMPTMO: TFloatField;
    cdsEmprestimosAntNUMPARCELAS: TFloatField;
    cdsEmprestimosAntIDTIPOCONTREMPTMO: TFloatField;
    cdsEmprestimosAntVLRPARCELA: TFloatField;
    cdsEmprestimosAntMOECODIGO: TFloatField;
    cdsEmprestimosAntIDPATRO: TFloatField;
    cdsEmprestimosAntIDPESSOA: TFloatField;
    cdsEmprestimosAntIDPLANOPREV: TFloatField;
    cdsEmprestimosAntHMESALDODEV: TFloatField;
    cdsEmprestimosAntNUMPARCPAGAS: TFloatField;
    cdsEmprestimosAntVLREMABERTO: TFloatField;
    cdsEmprestimosAntIDSITPART: TFloatField;
    cdsEmprestimosAntMOESIGLA: TStringField;
    cdsEmprestimosAntVLRATUAL: TFloatField;
    cdsInputTransfPlano: TCMClientDataSet;
    cdsInputTransfPlanoIDINPUT: TFloatField;
    cdsInputTransfPlanoDESCRICAO: TStringField;
    cdsInputTransfPlanoIDREGRA: TFloatField;
    cdsInputTransfPlanoFLGTIPO: TStringField;
    cdsInputTransfPlanoTABELA: TStringField;
    cdsInputTransfPlanoCAMPO: TStringField;
    cdsInputTransfPlanoNOMEPARAREGRA: TStringField;
    cdsInputTransfPlanoFLGATIVO: TFloatField;
    cdsInputTransfPlanoFLGMANTIDO: TFloatField;
    cdsInputTransfPlanoFLGMANTPARC: TFloatField;
    cdsInputTransfPlanoFLGASSISTIDO: TFloatField;
    cdsInputTransfPlanoFLGBENEFICIARIO: TFloatField;
    cdsInputTransfPlanoFLGPODEALTERAR: TFloatField;
    cdsInputTransfPlanoORDEM: TFloatField;
    cdsInputTransfPlanoVALORDEFAULT: TStringField;
    cdsInputTransfPlanoVALOR: TStringField;
    cdsResultTransfDados: TCMClientDataSet;
    cdsResultTransfDadosITEM: TStringField;
    cdsResultTransfDadosMSG: TStringField;
    cdsResultTransfDadosNOME: TStringField;
    cdsResultTransfDadosVALOR: TStringField;
    cdsResultTransfDadosIDTIPOTRANSF: TIntegerField;
    cdsResultTransfDadosIDCONFIG: TIntegerField;
    cdsResultTransfDadosFLGTIPO: TStringField;
    cdsItemRecDep: TCMClientDataSet;
    cdsItemRecDepIdHistMovEmptmo: TIntegerField;
    cdsItemRecDepCodigoItem: TIntegerField;
    cdsItemRecDepRegra: TIntegerField;
    cdsItemRecDepRubrica: TIntegerField;
    cdsItemRecDepEvento: TIntegerField;
    cdsItemRecDepFlgEnvio: TIntegerField;
    cdsItemRecDepFlgBaixado: TIntegerField;
    cdsItemRecDepNome: TStringField;
    cdsItemRecDepRecPag: TStringField;
    cdsItemRecDepFormaCobranca: TStringField;
    cdsItemRecDepParcela: TIntegerField;
    cdsItemRecDepOrigem: TIntegerField;
    cdsItemRecDepPrioridade: TIntegerField;
    cdsItemRecDepSeqCalculo: TIntegerField;
    cdsItemRecDepSeqCobranca: TIntegerField;
    cdsItemRecDepFlgCentraliza: TIntegerField;
    cdsItemRecDepFlgDivergPend: TIntegerField;
    cdsItemRecDepIdItemCentraliza: TIntegerField;
    cdsItemRecDepAnoCompetencia: TIntegerField;
    cdsItemRecDepMesCompetencia: TIntegerField;
    cdsItemRecDepAnoCobranca: TIntegerField;
    cdsItemRecDepMesCobranca: TIntegerField;
    cdsItemRecDepDataPrevista: TDateTimeField;
    cdsItemRecDepDataEfetiva: TDateTimeField;
    cdsItemRecDepDataUltAtualiza: TDateTimeField;
    cdsItemRecDepValor: TFloatField;
    cdsItemRecDepSaldoDevedor: TFloatField;
    cdsItemRecDepTxJuros: TFloatField;
    cdsItemRecDepTxJurosAnt: TFloatField;
    cdsItemRecDepParcResta: TIntegerField;
    cdsItemRecDepFlgDestacado: TIntegerField;
    cdsItemRecDepValorEfetivo: TFloatField;
    cdsItemRecDepFlgTipoDiverg: TIntegerField;
    cdsInputTransfPlanoIDREGRAVALIDA: TIntegerField;
    cdsInputTransfPlanoIDEVENTOGERADOR: TIntegerField;
    cdsInputTransfPlanoOBSERVACAO: TStringField;
    cdsInputTransfPlanoIDREGRAVLRDEFAULT: TIntegerField;
    cdsInputTransfPlanoTIPODADO: TStringField;
    cdsEmprestimosAntFLGESCOLHA: TIntegerField;
    RptIsapi: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    dsSQLReport: TDataSource;
    EdvIsapi: TExtraOptions;
    ppSQL: TppDBPipeline;
    cdsSQLReport: TCMClientDataSet;
    cdsCamposSimulaBenef: TCMClientDataSet;
    cdsCamposSimulaBenefIDINPUT: TIntegerField;
    cdsCamposSimulaBenefNOMECAMPO: TStringField;
    cdsCamposSimulaBenefVALOR: TStringField;
    CMResourceManager: TCMResourceManager;
    cdsBpl: TCMClientDataSet;
    cdsBplBPL: TStringField;
    cdsBplVERSAO: TStringField;
    cdsBplDATA: TDateTimeField;
    cdsBplCAMINHO: TStringField;
    cdsBplDESCRICAO: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public

    //Mensagem do CtrlObject
    procedure MsgCtrl( sMsg : String );

    //Mensagem do Regra
    procedure MsgRegra( sMsg : String );

  end;

var
  //Data Module
  dtmModAutoAtendimento: TdtmModAutoAtendimento;

  //CtrlObjects
  WebConfiguracao    : TCtrlWebConfiguracao;
  WebSessao          : TCtrlWebSessao;
  WebPaginaCampo     : TCtrlWebPaginaCampo;
  WebTpUsuPagina     : TCtrlWebTpUsuPagina;
  WebTpUsuCampo      : TCtrlWebTpUsuCampo;
  WebDadosCadastrais : TCtrlWebDadosCadastrais;
  WebContribuicoes   : TCtrlWebContribuicoes;
  WebReserva         : TCtrlWebReserva;
  WebEventosPrev     : TCtrlWebEventosPrev;
  WebHistRubSal      : TCtrlWebHistRubSal;
  WebImagem          : TCtrlWebImagem;
  WebHistBenef       : TCtrlWebHistBenef;
  WebConsignacao     : TCtrlWebConsignacao;
  WebEmprestimo      : TCtrlWebEmprestimo;
  EndPess            : TCtrl_EndPess;
  TelEndPess         : TCtrl_TelEndPess;
  Pessoa             : TCtrl_Pessoa;
  Dependente         : TCtrl_Dependente;
  WebRegra           : TCtrlWebRegra;
  WebEmpresaProp     : TCtrlWebEmpresaProp;
  WebTransfPlano     : TCtrlWebTransfPlano;
  SimulaTransfPlano  : TCtrlSimulaTransfPlano;
  WebBeneficio       : TCtrlWebBeneficio;
  WebAcesso          : TCtrlWebAcesso;
  WebInterface       : TCtrlWebInterface;
  TempoServico       : TCtrlTempoServico;
  ViaContraCheque    : TCtrl2ViaContraCheque;
  InscricaoEmptmo    : TCtrl_InscricaoEmptmo;
  HistMovInscricao   : TCtrl_HistMovInscricao;
  WebReports         : TCtrlWebReports;
  Reports            : TCtrlReports;
  InformeRendimentos : TCtrlInformeRendimentos;
  SimulaBenef        : TCtrlSimulaBenef;
  WebCfgInfRend      : TCtrlWebCfgInfRend;
  WebHstAcesso       : TCtrlWebHstAcesso;
  WebPagAcessadas    : TCtrlWebPagAcessadas;
  ExtratoReserva     : TCtrlExtratoReserva;
  WebSitAtualBenef   : TCtrlWebSitAtualBenef;
  //Pendência 23402 - 28/02/2007 - Alberto - Padrão 14
  MsgContexto        : TCtrlMsgContexto;
  MsgPreDef          : TCtrlMsgPreDef;
  Mensagens          : TCtrlMensagens;
  //Fim Pendência 23402
  WebTpReports       : TCtrlWebTpReports; // Pendência 19090 - Alberto

  //Objeto CMCrypto
  CMCrypto : TCMCrypto;

  //"Apontam" para os ClientDataSet's do DataModule
  cds                : TCMClientDataSet;
  cdsAux             : TCMClientDataSet;
  cdsHTMLColumns     : TCMClientDataSet;
  cdsWebLogAlteracao : TCMClientDataSet;

  //Variáveis "hidden"
  cntConexao       : TDbConnectionType;
  sIdSessao        : String;
  iIdPessoa        : integer;
  sLoginPessoal    : String;
  sNomeUsuario     : String;
  sMatricula       : String;
  sInscricaoNumero : String;
  sTipoUsuario     : String;
  iSeqAcesso       : integer;
  iIdWebReports    : integer;  //Pendência 19090 - Alberto - Padrão 16

  //Comando executado no momento da conexão com o banco
  sComandoConexao  : String;

  //Flag que indica se as queries serão preparadas ou não
  bPreparaQuery : boolean;

  //Id da interface
  iIdWebInterface : integer;

  //Host da conexão com o banco
  sHost : String;

  //Diretório dos arquivos temporários
  sTmpDir : String;

  //Diretório dos arquivos de log
  sLogDir : string;

  //Variável utilizada para montagem de HTML dinâmica
  sHTML         : String;

  //Reservada para inclusão de código JavaScript específico para cada página
  sJavaScript   : String;

  //JavaScript do menu dinâmico
  sJavaMenu     : String;

  //JavaScript de exibição de layers de acesso
  sJavaLayers   : String;

  //Links dinâmicos
  sLinkMenu     : String;

  //Menu dinâmico
  sMenu         : String;

  //Diretório onde encontra-se o site
  sPath         : String;

  //Título da Página
  sTitulo       : String;

  //Quantidade de acessos
  iQtdeAcessos  : integer;

  //Endereço da página de login
  sEndLogin     : String;

  //Indica se a aplicação utilizará menus de acesso
  bFlgUsaMenu   : boolean;

  //Indica se a aplicação utilizará layers de acesso
  bFlgUsaLayers   : boolean;

  //Indica se a aplicação está rodando em modo de demonstração
  bFlgDemo        : boolean;

  //Indica se os relatórios serão exibidos em uma janela separada
  bFlgJanelaRelat : boolean;

  //Nome do arquivo da aplicação
  sNomeArqApl : String;

  //E-mail para contato
  sEMail : String;

  //Fundação
  sFundacao : String;

  //TimeOut (em segundos)
  iTimeOut : integer;

  //Date e hora da inicialização
  dDtInicializacao : TDateTime;

  //Dados da conexão master
  sLoginMaster,
  sSenhaMaster : string;

  //Nome da base
  sBase : string;

  //Regra e query de entrada do novo usuário e de geração de login
  iRegraNovoUsu : integer;
  sQryNovoUsu   : string;
  iRegraLogin   : integer;
  sQryLogin     : string;
  //Pendência 18467 - 16/02/2007 - Alberto
  sQryAcesso    : string;
  //Fim Pendência 18467
  //Pendência 23402 - 28/02/2007 - Alberto - Padrão 14
  sFlgEnvioSenha: string;
  //Fim Pendência 23402

  //Parâmetros da senha
  iSenhaMin,
  iSenhaMax,
  iNumSenhaBlq    : integer;
  bSenhaCase,
  bSenhaCripto : boolean;

  //Parâmetros de módulos diversos
  bFlgCtrChqAtv,
  bFlgInfRendAtv,
  bFlgExtEmptmoAtv : boolean;

  //Erro de um CtrlObject
  sMsgCtrl : String;

  //Dados do registro
  cSeparadorDecimal : char;
  sFormatoData : string;

  //Empresa Proprietária
  iIdEmpresaProp : integer;
  iTipoCliente   : integer;
  sNomeEmpresa   : string;

  //Variáveis do menu dinâmico
  iMenuAltura        : integer;
  iMenuLargura       : integer;
  iMenuTamFonte      : integer;
  iMenuPosX          : integer;
  iMenuPosY          : integer;
  iMenuDistancia     : integer;
  sMenuNomeFonte     : String;
  sMenuCorFonte      : String;
  sMenuCorFonteSel   : String;
  sMenuCorFundo      : String;
  sMenuCorFundoSel   : String;

  //Variáveis para montagem de formulários
  sIniLinha,
  sFimLinha,
  sEntreCols,
  sColFmt : string;

  //Inicializa o Auto-Atendimento
  procedure Inicializa;

  //Conecta o Auto-Atendimento ao banco
  procedure ConectaDB;

  //Cria e conecta os CtrlObejcts ao banco
  procedure ConectaCtrlObject;

  //Retorna o caminho da aplicação no servidor web
  function GetPath : String;

  //Retorna o nome da aplicação
  function GetApplicationName : String;

  //Retorna a diferença em segundos entre dois momentos
  function DiferencaEmSegundos( dData1, dData2: TDateTime): integer;

  //Subtrai n segundos de uma data
  function SubtraiSegundos( dData1 : TDateTime; iSegundos : integer ): TDateTime;

  //Finaliza uma ação
  procedure FinalizaAcao;

  //Inicia uma ação
  function IniciaAcao( RequestLocal: TWebRequest; iIdPagina : integer ) : Boolean;

  //Carrega páginas e campos do usuário
  procedure CarregaPaginasCampos;

  //Inicia uma nova sessão
  function CriaSessao( sLoginLocal :  String ) : String;

  //Verifica se a sessão não expirou
  function SessaoExpirada( sIdWebSessao, sLoginLocal : String ) : Boolean;

  //Atualiza uma sessão
  procedure AtualizaSessao( sSessao :  String );

  //Finaliza uma sessão
  procedure DestroiSessao( sSessao :  String );

  //Gera uma string contendo a hora no padrão Oracle
  function DateToStrOracle( dDt : TDateTime ) : String;

  //Limpa variáveis
  procedure LimpaVariaveis;

  //Carrega os dados de configuração
  procedure CarregaConfiguracao;

  //Recupera dados do usuario corrente
  function SelecionaAA( var sSenhaLocal : string; var iFlgStatus : integer ) : Boolean;

  //Substitui uma string pela outra dentro de uma outra string.
  function StrSubst( Str, SubStrOld, SubStrNew : WideString ) : WideString;

  //Retorna o tempo passado em dias por extenso
  function TempoExtenso( Tempo:Integer ) : String;

  //Tratamento de erros gerais
  function TrataWebExcecoes( E : Exception ) : String;

  //Lê o conteúdo HTML de um arquivo da aplicação..
  function LeHTML( sArqHTML : String ) : WideString;

  //Monta as páginas
  function MontaPagina( iIdPagina : integer; sConteudo : WideString ) : WideString;

  //Coloca as inicias das palavras contidas na string em maiúsculas e as
  //demais em minúsculas.
  function StrToName( sStr : String ) : String;

  //Monta as tags do menu dinâmico
  procedure MontaAcessoMenu;

  //Torna os layers para acesso visíveis
  procedure MontaAcessoLayers;

  //Monta o JavaScript para acesso aos módulos
  procedure MontaAcessoForms;

  //Preenche os "HiddenFields"
  function HiddenFields: String;

  //Lê os "HiddenFields"
  procedure CarregaHidden( RequestLocal: TWebRequest );

  //Indica se o usuário tem acesso à página e informa o nome configurado para esta
  function TemAcessoPagina( sTpUsuario : String; iIdPagina : integer;
                            var sTituloPagina : String ) : boolean;

  //Indica se o usuário tem acesso ao campo e informa o nome configurado para este
  function TemAcessoCampo( sTpUsuario : String; iIdCampo : integer;
                            var sTituloCampo : String ) : boolean;

  //Verifica se determinada página grava log de acesso
  function PaginaGravaAcesso( sTpUsuario : String; iIdPagina : integer ) : boolean;

  //Recupera o título da página
  function TituloPagina( iIdPagina : integer ) : String;

  //Recupera o título do campo
  function TituloCampo( iIdCampo : integer ) : String;

  //Inclui uma coluna para montagem da tabela dinâmica
  function IncluiColuna( iIdCampo, iLargura : integer; sAlign : String;
            sOutroTitulo : String = ''; bHighlited : Boolean = False;
            bNoHeader : Boolean = False ) : boolean;

  //Montagem do "header" da tabela dinâmica
  function HTMLTableHeader : String;

  //Montagem da linha da tabela dinâmica
  function HTMLTableRow : String;

  //Montagem do "footer" da tabela dinâmica
  function HTMLTableFooter : String;

  //Preenche uma coluna de uma tabela dinâmica com um conteúdo qualquer
  function PreencheColuna( iIdCampo : integer; sConteudo : String ) : String;

  //Inclui campos nas páginas de consulta
  function IncluiCampo( iIdCampo : integer; sConteudo : String; bAceitaZero : boolean = True; iLarguraDesc : integer = 20; sTituloSubst : string = '' ) : String;

  //Substitui a função global, não fazendo conexões com o banco
  function LocalGeraDataBaseName(Owner :TComponent; DataBase: TDataBase;
    SetaNetDir: Boolean = false; DbSession: TSession = nil):String;

  //Monta validação de um campo em JavaScript
  function MontaValidacao( iCampo: integer; sNomeCampoHTML, sTipo : string ) : String;

  //Grava um dataset em um diretório temporário e retorna sua localização e nome do arquivo
  function SaveDataset( oData : OLEVariant ) : string;

  //Monta uma linha em um formulários com os campos e colunas indicados
  function MontaLinhaForm( iCampo1 : integer; sContCampo1 : string;
                           iCampo2 : integer = 0; sContCampo2 : string = '' ) : string;


  //Testa se houve atualização em um campo e o altera, caso necessária
  function AtualizaCampo( iIdCampo : integer; fCampo  : TField; sConteudo : String; bCombo : boolean = False ) : boolean;  overload;
  function AtualizaCampo( iIdCampo : integer; fCampo  : TField; iConteudo : integer; bCombo : boolean = False ) : boolean; overload;
  function AtualizaCampo( iIdCampo : integer; fCampo  : TField; iDia, iMes, iAno : integer ) : boolean; overload;

  //Converte um número para formato "###.##"
  function ConverteVirgulaParaPonto( fNum : real ) : String;

  //Converte um string para formato "###,##"
  function ConvertePontoParaVirgulaStr( sNum : string ) : String;

  //Converte um string para formato "###,##"
  function ConverteVirgulaParaPontoStr( sNum : string ) : String;

  //Converte um número para formato do Oracle
  function OraNumero( sNumero : string ):string;

  //Converte um número para formato inverso do Oracle
  function OraNumeroInv( sNumero : string ):string;

  //Monta a página de Impressão de Relatório feito no Gerador
  function ImprimeRelatorio( iIdPessoaLocal : integer; Request: TWebRequest ) : String;

  //Gera dados para um relatório
  function GeraDadosRelatorio(  rtContrato     : TReportType;
                                sFormulario    : string;  
                                iIdReports     ,
                                iOrigemCM      : integer;
                                sHTMLFile      ,
                                sTitReport     : string;
                                oData          : OLEVariant ) : string;

  //Recupera os dados de configuração de um relatório
  procedure RecuperaConfRelatorio( iRelatorio      : integer;
                                   var rtContrato  : TReportType;
                                   var iIdDataView : integer;
                                   var iOrigemCMDV : integer;
                                   var iIdReports  : integer;
                                   var iOrigemCM   : integer;
                                   var sHTMLFile   : string );

  //Simula o uso do operador i++ em C
  function IncAfter( var iVal : integer ) : integer;

  //Simula o uso do operador ++i em C
  function IncBefore( var iVal : integer ) : integer;

  // 03/08/2006 - Passou para unit uCtrlFuncoesAA;
  //Arredonda um valor para tantas casas decimais quanto necessárias 
  //function Arredonda( fValor: extended; iDecimais: integer ): extended;

  {Retira o primeiro elemento de uma string (cujos elementos são separados por
   um caracter delimitador), retornando este elemento.}
  function RetiraPrimeiroElemento( var sStr : string; cDelimitador : char ) : string;

  //Cria uma string concactando "n" instâncias de uma substring
  function FillStr( str : string; n : integer ) : string;


implementation

{$R *.DFM}

//Conecta o Auto-Atendimento ao banco
procedure ConectaDB;
var
  sText : TStringList;
  sLogin,
  sSenha : String;
  iConexao,
  iConAdo  : integer;
  sConnectionString,
  sArqVinc : string;
begin

  //Se o arquivo de configuração não existir, sai da rotina...
  if not FileExists( sPath + 'AutoAtendimento.cfg' ) then
  begin
    CMDebugToFile( 'Não encontrei o arquivo ' + sPath + 'AutoAtendimento.cfg', 'C:\AAErro.txt' );
    Exit;
  end;

  sText := TStringList.Create;
  try
    CMCrypto.CMDecryptFileToStringList( sPath + 'AutoAtendimento.cfg',
     '360487D03EE2480CA5A16169E36B981C96941E0454F84257BA9FBF47686CA727', sText );

    sLogin            := sText.Values['LOGIN'];
    sSenha            := sText.Values['SENHA'];
    sHost             := sText.Values['HOST'];
    iConexao          := StrToInt( sText.Values['CONEXAO'] );
    iIdWebInterface   := StrToInt( sText.Values['IDWEBINTERFACE'] );
    iConAdo           := StrToIntDef( sText.Values['CONADO'], 0 );
    sConnectionString := sText.Values['CONNECTIONSTRING'];
    sArqVinc          := sText.Values['ARQVINC'];
    sComandoConexao   := StringReplace( sText.Values['COMANDOCONEXAO'], '§', #13#10, [rfReplaceAll] );
    bPreparaQuery     := ( sText.Values['PREPARAQUERY'] = 'S' );

    if iConexao = 0 then
      cntConexao := cntADO
    else
      cntConexao := cntBDE;

    //Preparação para a conexão (necessária indepenpendentemente do tipo de conexão)
    dtmModAutoAtendimento.dbBaseDados.Connected := False;
    dtmModAutoAtendimento.dbADOBaseDados.Connected := False;

    if cntConexao = cntADO then
    begin
      if iConAdo = 0 then    //ConnectionString
        dtmModAutoAtendimento.dbADOBaseDados.ConnectionString := sConnectionString
      else                   //Arquivo de vinculação
        dtmModAutoAtendimento.dbADOBaseDados.ConnectionString := 'FILE NAME=' + sArqVinc;
    end
    else
    begin
      LocalGeraDataBaseName( dtmModAutoAtendimento, dtmModAutoAtendimento.dbBaseDados,
       True, dtmModAutoAtendimento.sssSessao);

      dtmModAutoAtendimento.dbBaseDados.Params.Values['USER NAME']   := sLogin;
      dtmModAutoAtendimento.dbBaseDados.Params.Values['PASSWORD']    := sSenha;
      dtmModAutoAtendimento.dbBaseDados.Params.Values['SERVER NAME'] := sHost;
    end;

  finally
    sText.Free;
  end;

end; {ConectaDB}


//Cria e conecta os CtrlObjects ao banco
procedure ConectaCtrlObject;
begin

  WebRegra := TCtrlWebRegra.Create;
  WebRegra.Initialize( dtmModAutoAtendimento.dbBaseDados, True, cntConexao, cnsServer,
   nil, False, dtmModAutoAtendimento.MsgRegra, dtmModAutoAtendimento.dbADOBaseDados, True,
   bPreparaQuery );
  WebRegra.sPathLog := sPath + 'TEMP\Regras\';

  Padroes := TCtrlPadroes.Create;
  Padroes.Initialize( dtmModAutoAtendimento.dbBaseDados, True, cntConexao, cnsServer,
   nil, False, dtmModAutoAtendimento.MsgCtrl, dtmModAutoAtendimento.dbADOBaseDados, True,
   bPreparaQuery );

  WebEmprestimo := TCtrlWebEmprestimo.Create;
  WebEmprestimo.InitializeAs( Padroes );
//  WebEmprestimo.WebRegra.InitializeAs( WebRegra );
  WebEmprestimo.WebRegra.sPathLog := WebRegra.sPathLog;

  SimulaBenef := TCtrlSimulaBenef.Create;
  SimulaBenef.InitializeAs( Padroes );
  SimulaBenef.Regra.sPathLog := WebRegra.sPathLog;

  WebConfiguracao := TCtrlWebConfiguracao.Create;
  WebConfiguracao.InitializeAs( Padroes );

  WebSessao := TCtrlWebSessao.Create;
  WebSessao.InitializeAs( Padroes );

  WebPaginaCampo := TCtrlWebPaginaCampo.Create;
  WebPaginaCampo.InitializeAs( Padroes );

  WebTpUsuPagina := TCtrlWebTpUsuPagina.Create;
  WebTpUsuPagina.InitializeAs( Padroes );

  WebTpUsuCampo := TCtrlWebTpUsuCampo.Create;
  WebTpUsuCampo.InitializeAs( Padroes );

  WebDadosCadastrais := TCtrlWebDadosCadastrais.Create;
  WebDadosCadastrais.InitializeAs( Padroes );

  WebContribuicoes := TCtrlWebContribuicoes.Create;
  WebContribuicoes.InitializeAs( Padroes );

  WebReserva := TCtrlWebReserva.Create;
  WebReserva.InitializeAs( Padroes );

  WebEventosPrev := TCtrlWebEventosPrev.Create;
  WebEventosPrev.InitializeAs( Padroes );

  WebHistRubSal := TCtrlWebHistRubSal.Create;
  WebHistRubSal.InitializeAs( Padroes );

  WebImagem := TCtrlWebImagem.Create;
  WebImagem.InitializeAs( Padroes );

  WebHistBenef := TCtrlWebHistBenef.Create;
  WebHistBenef.InitializeAs( Padroes );

  WebConsignacao := TCtrlWebConsignacao.Create;
  WebConsignacao.InitializeAs( Padroes );

  EndPess := TCtrl_EndPess.Create;
  EndPess.InitializeAs( Padroes );

  TelEndPess := TCtrl_TelEndPess.Create;
  TelEndPess.InitializeAs( Padroes );

  Pessoa := TCtrl_Pessoa.Create;
  Pessoa.InitializeAs( Padroes );

  Dependente := TCtrl_Dependente.Create;
  Dependente.InitializeAs( Padroes );

  WebEmpresaProp := TCtrlWebEmpresaProp.Create;
  WebEmpresaProp.InitializeAs( Padroes );

  WebTransfPlano := TCtrlWebTransfPlano.Create;
  WebTransfPlano.InitializeAs( Padroes );

  SimulaTransfPlano := TCtrlSimulaTransfPlano.Create;
  SimulaTransfPlano.InitializeAs( Padroes );

  WebBeneficio := TCtrlWebBeneficio.Create;
  WebBeneficio.InitializeAs( Padroes );

  WebAcesso := TCtrlWebAcesso.Create;
  WebAcesso.InitializeAs( Padroes );

  WebInterface := TCtrlWebInterface.Create;
  WebInterface.InitializeAs( Padroes );

  TempoServico := TCtrlTempoServico.Create;
  TempoServico.InitializeAs( Padroes );

  ViaContraCheque := TCtrl2ViaContraCheque.Create;
  ViaContraCheque.InitializeAs( Padroes );

  DiasUteis := TDiasUteis.Create;
  DiasUteis.InitializeAs( Padroes );

  InscricaoEmptmo := TCtrl_InscricaoEmptmo.Create;
  InscricaoEmptmo.InitializeAs( Padroes );

  HistMovInscricao := TCtrl_HistMovInscricao.Create;
  HistMovInscricao.InitializeAs( Padroes );

  WebReports := TCtrlWebReports.Create;
  WebReports.InitializeAs( Padroes );

  Reports := TCtrlReports.Create;
  Reports.InitializeAs( Padroes );

  InformeRendimentos := TCtrlInformeRendimentos.Create;
  InformeRendimentos.InitializeAs( Padroes );

  WebCfgInfRend := TCtrlWebCfgInfRend.Create;
  WebCfgInfRend.InitializeAs( Padroes );

  WebHstAcesso := TCtrlWebHstAcesso.Create;
  WebHstAcesso.InitializeAs( Padroes );

  WebPagAcessadas := TCtrlWebPagAcessadas.Create;
  WebPagAcessadas.InitializeAs( Padroes );

  ExtratoReserva := TCtrlExtratoReserva.Create;
  ExtratoReserva.InitializeAs( Padroes );

  WebSitAtualBenef := TCtrlWebSitAtualBenef.Create;
  WebSitAtualBenef.InitializeAs( Padroes );

  //Pendência 19090 - Alberto
  WebTpReports := TCtrlWebTpReports.Create;
  WebTpReports.InitializeAs( Padroes );
  //Fim Pendência 19090

  //Pendência 23402 - 28/02/2007 - Alberto - Padrão 14
  MsgContexto := TCtrlMsgContexto.Create;
  MsgContexto.Initialize( dtmModAutoAtendimento.dbBaseDados, True, cntConexao, cnsServer,
      nil, False, dtmModAutoAtendimento.MsgRegra, dtmModAutoAtendimento.dbADOBaseDados, True,
      bPreparaQuery );

  MsgPreDef := TCtrlMsgPreDef.Create;
  MsgPreDef.Initialize( dtmModAutoAtendimento.dbBaseDados, True, cntConexao, cnsServer,
      nil, False, dtmModAutoAtendimento.MsgRegra, dtmModAutoAtendimento.dbADOBaseDados, True,
      bPreparaQuery );

  Mensagens := TCtrlMensagens.Create;
  Mensagens.Initialize( dtmModAutoAtendimento.dbBaseDados, True, cntConexao, cnsServer,
      nil, False, dtmModAutoAtendimento.MsgRegra, dtmModAutoAtendimento.dbADOBaseDados, True,
      bPreparaQuery );
  //Fim Pendência 23402

end;


//Retorna o caminho da aplicação no servidor web
function GetPath : String;
var
  path : array[0..255] of char;
begin
  if not IsLibrary then
  begin
    Result := ExtractFilePath( ParamStr(0) );
    if Copy( Result, 1, 4 )= '\\?\' then
      Result := Copy( Result, 5, length( Result ) - 4 );
  end
  else
  begin
    GetModuleFileName( hInstance, path, 200 );
    Result := ExtractFilePath( path );
  end;

  Result := trim( Result );

  if Copy( Result, length( Result ), 1 ) <> '\' then Result := Result + '\';
end; {GetPath}


//Retorna o nome da aplicação
function GetApplicationName : String;
var
  path : array[0..255] of char;
begin
  if not IsLibrary then
    Result := ExtractFileName( ParamStr(0) )
  else
  begin
    GetModuleFileName( hInstance, path, 200 );
    Result := ExtractFileName( path );
  end;

  Result := trim( Result );
end; {GetApplicatioName}




//Inicializa o Auto-Atendimento
procedure Inicializa;
var
  Registro: TRegistry;
  sAux : string;
begin

  dDtInicializacao := Now;

  //Garante que, caso haja algum problema de conxexão, o sobre esteja preenchido corretamente
  sBase := '<b><font color="red">ERRO! Não conectado.</font></b>';

  //Recupera o diretório da aplicação
  sPath := GetPath;

  //Diretório dos arquivos temporários
  sTmpDir := sPath + 'TEMP\';

  //Diretório dos arquivos de log
  sLogDir := sPath + 'LOG\';

  ForceDirectories( sTmpDir );
  ForceDirectories( sLogDir );

  //Recupera os dados do registro que podem ser alterados pelas regras de negócio
  Registro := TRegistry.Create;
  try
    Registro.RootKey := HKEY_USERS;
    if Registro.OpenKeyReadOnly( '.DEFAULT\Control Panel\International' ) then
    begin
      if Registro.ValueExists('sDecimal') then
      begin
        sAux := Registro.ReadString( 'sDecimal' );
        cSeparadorDecimal := sAux[1];
      end
      else
      begin
        CMDebugToFile( 'Não foi possível ler a configuração de separador decimal do registro.', 'C:\AAErro.txt' );
        Exit;
      end;
      if Registro.ValueExists('sShortDate') then
        sFormatoData := Registro.ReadString( 'sShortDate' )
      else
      begin
        CMDebugToFile( 'Não foi possível ler a configuração de formato de data do registro.', 'C:\AAErro.txt' );
        Exit;
      end;
      Registro.CloseKey;
    end
    else
    begin
      CMDebugToFile( 'Não foi possível abrir o registro.', 'C:\AAErro.txt' );
      Exit;
    end;
  finally
    FreeAndNil( Registro );
  end;

  //Recupera o nome da aplicação
  sNomeArqApl := GetApplicationName;

  //Cria o componente de encriptação
  CMCrypto := TCMCrypto.Create;

  //"Aponta" a variável cds para o cds do Data Module
  cds                := dtmModAutoAtendimento.cds;
  cdsAux             := dtmModAutoAtendimento.cdsAux;
  cdsHTMLColumns     := dtmModAutoAtendimento.cdsHTMLColumns;

  //Conecta o Auto-Atendimento ao banco de dados.
  ConectaDB;

  //Cria e inicializa os CtrlObjects utilizados pelo Auto-Atendimento
  ConectaCtrlObject;

  //Carrega os dados de configuração
  CarregaConfiguracao;

  //Carrega os dados da empresa proprietária
  cds.Close;
  cds.Data := WebEmpresaProp.EmpresaProp;
  iIdEmpresaProp := cds.FieldByName('IDPESSOA').AsInteger;
  iTipoCliente   := cds.FieldByName('TIPOCLIENTE').AsInteger;
  sNomeEmpresa   := cds.FieldByName('NOME').AsString;
  cds.Close;

end;


//Subtrai n segundos de uma data
function SubtraiSegundos( dData1 : TDateTime; iSegundos : integer ): TDateTime;
begin
  Result := dData1 - ( 0.0000115 * iSegundos );
end; {SubtraiSegundos}


//Retorna a diferença em segundos entre dois momentos
function DiferencaEmSegundos( dData1, dData2: TDateTime): integer;
begin
  Result := Round( ( dData1 - dData2 ) / 0.0000115 );
end; {DiferencaEmSegundos}


//Inicia uma nova sessão
function CriaSessao(sLoginLocal: String): String;
var
  sSessaoLocal  : String;
begin

  sMsgCtrl := '';

  //Exclui sessões expiradas...
  if iTimeOut <> 0 then
    WebSessao.ExcluiExpiradas( DateToStrOracle( SubtraiSegundos( Now, iTimeOut ) ) );

  sSessaoLocal := GeraNomeAleatorio( 8 );

  //Cria a nova sessão efetivamente
  if WebSessao.IncluiSessao( sSessaoLocal, sLoginLocal, iIdWebInterface, DateToStrOracle( Now ) ) then
  begin
    if sMsgCtrl = '' then
      Result := sSessaoLocal;
  end;

end; {CriaSessao}


//Verifica se a sessão não expirou
function SessaoExpirada( sIdWebSessao, sLoginLocal : String ): Boolean;
var
  dDtUltAcesso : TDateTime;
  bExpirada    : Boolean;
begin
  cds.Close;
  cds.Data := WebSessao.SelecionaPorSessaoLogin( sIdWebSessao, sLoginLocal );

  bExpirada := False;  

  if cds.IsEmpty then
    bExpirada := True
  else
    if iTimeOut <> 0 then
    begin
      dDtUltAcesso := cds.FieldByName('DTULTACESSO').AsDateTime;
      if DiferencaEmSegundos( Now, dDtUltAcesso ) > iTimeOut then
      begin
        bExpirada := True;
        WebSessao.ExcluiSessao( sIdWebSessao );
      end;
    end;

  cds.Close;
  Result := bExpirada;
end; {SessaoExpirada}


//Atualiza uma sessão
procedure AtualizaSessao(sSessao: String);
begin
  WebSessao.AtualizaSessao( sSessao, DateToStrOracle( Now ) );
end; {AtualizaSessao}


//Finaliza uma sessão
procedure DestroiSessao(sSessao: String);
begin
  WebSessao.ExcluiSessao( sSessao );
end; {DestroiSessao}



//Gera uma string contendo a hora no padrão Oracle
function DateToStrOracle(dDt: TDateTime): String;
begin
  Result := ' to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn:ss', dDt ) )  +
            ', ''DD/MM/YYYY hh24:mi:ss'' )';
end; {DateToStrOracle}


//Finaliza uma ação
procedure FinalizaAcao;
begin
  AtualizaSessao( sIdSessao );
  LimpaVariaveis;
end; {FinalizaSessao}


//Limpa variáveis
procedure LimpaVariaveis;
begin
  iIdPessoa         := 0;
  sNomeUsuario      := '';
  sMatricula        := '';
  sInscricaoNumero  := '';
  sLoginPessoal     := '';
  sHTML             := '';
  sTitulo           := '';
  sTipoUsuario      := '';
  sJavaMenu         := '';
  sJavaLayers       := '';
  sLinkMenu         := '';
  sMenu             := '';
  sMsgCtrl          := '';
  sJavaScript       := '';
  iQtdeAcessos      := 0;
  iSeqAcesso        := 0;
end; {LimpaVariaveis}


procedure TdtmModAutoAtendimento.DataModuleDestroy(Sender: TObject);
begin
  CMCrypto.Free;

  Padroes.Free;
  WebConfiguracao.Free;
  WebSessao.Free;
  WebPaginaCampo.Free;
  WebTpUsuPagina  .Free;
  WebTpUsuCampo.Free;
  WebDadosCadastrais.Free;
  WebContribuicoes.Free;
  WebReserva.Free;
  WebEventosPrev.Free;
  WebHistRubSal.Free;
  WebImagem.Free;
  WebHistBenef.Free;
  WebConsignacao.Free;
  WebEmprestimo.Free;
  EndPess.Free;
  TelEndPess.Free;
  Pessoa.Free;
  Dependente.Free;
  WebRegra.Free;
  WebEmpresaProp.Free;
  WebTransfPlano.Free;
  SimulaTransfPlano.Free;
  WebBeneficio.Free;
  WebAcesso.Free;
  WebInterface.Free;
  TempoServico.Free;
  ViaContraCheque.Free;
  DiasUteis.Free;
  InscricaoEmptmo.Free;
  HistMovInscricao.Free;
  WebReports.Free;
  Reports.Free;
  InformeRendimentos.Free;
  SimulaBenef.Free;
  WebCfgInfRend.Free;
  WebHstAcesso.Free;
  WebPagAcessadas.Free;
  ExtratoReserva.Free;
  WebSitAtualBenef.Free;

  dbBaseDados.Connected := False;
  dbADOBaseDados.Connected := False;

  inherited;
end; {DataModuleDestroy}


//Mensagem do Regra
procedure TdtmModAutoAtendimento.MsgRegra(sMsg: String);
begin
  sMsgCtrl := 'Regra violada: ' + sMsg;
  raise Exception.Create( sMsgCtrl );
end; {MsgRegra}


//Mensagem do CtrlObject
procedure TdtmModAutoAtendimento.MsgCtrl( sMsg: String );
begin
  sMsgCtrl := sMsg;
end; {MsgCtrl}


//Carrega os dados de configuração
procedure CarregaConfiguracao;
var
  iIdFundacao : integer;
begin
  cds.Close;

  //Dados da aplicação
  cds.Data := WebConfiguracao.SelecionaWebConfiguracao;
  if cds.IsEmpty then
  begin
    CMDebugToFile('Erro ao ler dados de configuração. ' + sMsgCtrl, 'C:\AAErro.txt' );
    cds.Close;
    Exit;
  end;

  iIdFundacao       := cds.FieldByName('IDFUNDACAO').AsInteger;
  iSenhaMin         := cds.FieldByName('SENHAMIN').AsInteger;
  iSenhaMax         := cds.FieldByName('SENHAMAX').AsInteger;
  bSenhaCase        := Iff( cds.FieldByName('SENHACASE').AsString = 'S', True, False );
  bSenhaCripto      := Iff( cds.FieldByName('SENHACRIPTO').AsString = 'S', True, False );
  sLoginMaster      := trim( cds.FieldByName('LOGINMASTER').AsString );
  sSenhaMaster      := trim( cds.FieldByName('SENHAMASTER').AsString );
  bFlgCtrChqAtv     := Iff( cds.FieldByName('FLGCTRCHQATV').AsString = 'S', True, False );
  bFlgInfRendAtv    := Iff( cds.FieldByName('FLGINFRENDATV').AsString = 'S', True, False );
  bFlgExtEmptmoAtv  := Iff( cds.FieldByName('FLGEXTEMPTMOATV').AsString = 'S', True, False );
  iNumSenhaBlq      := cds.FieldByName('NUMSENHABLQ').AsInteger;
  sBase             := trim( cds.FieldByName('NOMEBASE').AsString );
  iRegraNovoUsu     := cds.FieldByName('REGRANOVOUSU').AsInteger;
  sQryNovoUsu       := trim( cds.FieldByName('QRYNOVOUSU').AsString );
  iRegraLogin       := cds.FieldByName('REGRALOGIN').AsInteger;
  sQryLogin         := trim( cds.FieldByName('QRYLOGIN').AsString );
  //Pendência 18467 - 16/02/2007 - Alberto
  sQryAcesso        := trim( cds.FieldByName('QRYACESSO').AsString );
  //Fim Pendência 18467

  //Pendência 23402 - 28/02/2007 - Alberto - Padrão 14
  sFlgEnvioSenha    := trim( cds.FieldByName('FLGENVIOSENHA').AsString );
  //Fim Pendência 23402

  cds.Close;

  //Dados da interface
  cds.Data := WebInterface.SelecionaWebInterface( iIdWebInterface );
  if cds.IsEmpty then
  begin
    CMDebugToFile('Erro ao ler dados da interface ' + IntToStr( iIdWebInterface ) +
     '. ' + sMsgCtrl, 'C:\AAErro.txt' );
    cds.Close;
    Exit;
  end;

  sEMail            := cds.FieldByName('EMAIL').AsString;
  sEndLogin         := cds.FieldByName('ENDLOGIN').AsString;
  iTimeOut          := cds.FieldByName('TIMEOUT').AsInteger;
  iMenuAltura       := cds.FieldByName('MENUALTURA').AsInteger;
  iMenuLargura      := cds.FieldByName('MENULARGURA').AsInteger;
  iMenuTamFonte     := cds.FieldByName('MENUTAMFONTE').AsInteger;
  iMenuPosX         := cds.FieldByName('MENUPOSX').AsInteger;
  iMenuPosY         := cds.FieldByName('MENUPOSY').AsInteger;
  iMenuDistancia    := cds.FieldByName('MENUDISTANCIA').AsInteger;
  sMenuNomeFonte    := cds.FieldByName('MENUNOMEFONTE').AsString;
  sMenuCorFonte     := cds.FieldByName('MENUCORFONTE').AsString;
  sMenuCorFonteSel  := cds.FieldByName('MENUCORFONTESEL').AsString;
  sMenuCorFundo     := cds.FieldByName('MENUCORFUNDO').AsString;
  sMenuCorFundoSel  := cds.FieldByName('MENUCORFUNDOSEL').AsString;
  bFlgUsaMenu       := ( trim( cds.FieldByName('FLGUSAMENU').AsString     ) = 'S' );
  bFlgUsaLayers     := ( trim( cds.FieldByName('FLGUSALAYERS').AsString   ) = 'S' );
  bFlgDemo          := ( trim( cds.FieldByName('FLGDEMO').AsString        ) = 'S' );
  bFlgJanelaRelat   := ( trim( cds.FieldByName('FLGJANELARELAT').AsString ) = 'S' );

  cds.Close;

  cds.Data    := WebConfiguracao.NomeFundacao( iIdFundacao );
  sFundacao   := cds.FieldByName('NOMEEMPRESA').AsString;
  cds.Close;

end;


//Recupera dados do usuario corrente
function SelecionaAA( var sSenhaLocal : string; var iFlgStatus : integer ) : Boolean;
begin
  iIdPessoa         := 0;
  sNomeUsuario      := '';
  sMatricula        := '';
  sInscricaoNumero  := '';
  sSenhaLocal       := '';

  cds.Close;
  cds.Data := WebAcesso.SelecionaDadosAA( UpperCase( trim( sLoginPessoal ) ) );

  if cds.IsEmpty then
    Result := False
  else
  begin
    iIdPessoa     := cds.FieldByName('IDPESSOA').AsInteger;
    sNomeUsuario  := cds.FieldByName('NOME').AsString;
    sSenhaLocal   := cds.FieldByName('SENHAPESSOAL').AsString;
    iFlgStatus    := cds.FieldByName('FLGSTATUS').AsInteger;

    //Definição do tipo de usuário.
    if WebAcesso.Participante( iIdPessoa ) then
      sTipoUsuario := '1';

    cds.Close;
    cds.Data := WebAcesso.TitularDepend( iIdPessoa );
    if not cds.IsEmpty then
    begin
      if sTipoUsuario <> '' then sTipoUsuario := sTipoUsuario + ',';
      sTipoUsuario := sTipoUsuario + '2';
    end;

    cds.Close;
    cds.Data := WebAcesso.TitularBenef( iIdPessoa );
    if not cds.IsEmpty then
    begin
      if sTipoUsuario <> '' then sTipoUsuario := sTipoUsuario + ',';
      sTipoUsuario := sTipoUsuario + '3';
    end;

    cds.Close;
    cds.Data := WebAcesso.RecuperaDadosConexao( iIdPessoa );
    if not cds.IsEmpty then
    begin

      sMatricula       := cds.FieldByName('MATRICULA').AsString;
      sInscricaoNumero := cds.FieldByName('INSCRICAONUMERO').AsString;

    end;

    Result := True;
  end;

  cds.Close;
end; {SelecionaAA}



//Substitui uma string pela outra dentro de uma outra string.
function StrSubst( Str, SubStrOld, SubStrNew : WideString ) : WideString;
var
  iPos : integer;
begin
  Result := Str;
  while True do
  begin
    iPos := Pos( SubStrOld, Result );

    if iPos <= 0 then break;

    Result := Copy( Result, 1, iPos - 1 ) + SubStrNew +
              Copy( Result, iPos + length( SubStrOld ),
              length(Result) - length( SubStrOld ) - iPos + 1 );       
  end;
end; {StrSubst}



//Retorna o tempo passado em dias por extenso
Function TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  I:Integer;

  function TransformaDiasTempo(Tempo:Integer):String;
  var
    I:Integer;
    wAnoF, wMesF, wDiaF:Double;
    wAno, wMes, wDia, wStrTempo:String;
  Begin
    Result :='';

    // Calcula Tempos
    wAnoF := (Tempo/360);
    wMesF := (Frac(wAnoF)*12);
    wDiaF := Round((wMesF-Int(wMesF))*30);

    // Separa Tempos
    wAno := FloatToStr( Int( wAnoF ) );
    wMes := FloatToStr( Int( wMesF ) );
    wDia := FloatToStr( Int( wDiaF ) );

    If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
    If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
    If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

    // Caso Dias = 30 Aumenta Mes
    If wDia = '30' Then Begin
      wMes:= IntToStr((StrToInt(wMes)+1));
      If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
      wDia:= '00';
    End;
    // Caso Meses = 12 Aumenta Ano
    If wMes = '12' Then Begin
      wAno:= IntToStr((StrToInt(wAno)+1));
      wMes:= '00';
    End;

    wStrTempo:=wAno+wMes+wDia;

    I := Length(wStrTempo);

    Result := StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

  end; {TransformaDiasTempo}

Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End; {TempoExtenso}


//Tratamento de erros gerais
function TrataWebExcecoes(E: Exception) : String;
var
  sMsgErro : String;
begin
  if sMsgCtrl = '' then
  begin
    //Se o erro não é de um CtrlObject...
    sMsgErro := E.Message + '<BR><BR>(' + E.ClassName + ')';
  end
  else
  begin
    //Se o erro é de um CtrlObject...
    sMsgErro := sMsgCtrl;
    sMsgCtrl := '';
  end;

  Result := StrSubst( LeHTML( 'erro.htm' ), '<#msgerro>', sMsgErro );
end; {TrataWebExcecoes}


//Lê o conteúdo HTML de um arquivo da aplicação.
function LeHTML(sArqHTML: String): WideString;
var
  StrListAux : TStringList;
begin
  StrListAux := TStringList.Create;
  StrListAux.LoadFromFile( sPath + 'HTML\' + sArqHTML );
  Result := StrListAux.Text;
  StrListAux.Free;
end; {LeHTML}


//Monta as páginas
function MontaPagina( iIdPagina : integer; sConteudo: WideString ): WideString;
var
  bUsaPadrao   : boolean;
  sPagConteudo : string;
begin

  bUsaPadrao   := True;
  sPagConteudo := '';

  if iIdPagina > 0 then
  begin
    //Localiza a página
    if not dtmModAutoAtendimento.cdsWebPagina.Locate( 'IDPAGINA', iIdPagina, [] ) then
      raise Exception.Create('Não foi possível encontrar a página no. ' + IntToStr( iIdPagina ) );

    //Verifica se usa a página padrão
    bUsaPadrao   := trim( dtmModAutoAtendimento.cdsWebPagina.FieldByName('FLGUSAPADRAO').AsString ) = 'S';

    //Recupera a página de conteúdo
    sPagConteudo := trim( dtmModAutoAtendimento.cdsWebPagina.FieldByName('PAGCONTEUDO').AsString );

  end;

  Result := sConteudo;

  //Se tem página de conteúdo...
  if sPagConteudo <> '' then
    Result := StrSubst( LeTxt( sPagConteudo ), '<#conteudo>', Result );

  //Se usa padrão...
  if bUsaPadrao then
    Result := StrSubst( LeTxt( sPath + 'pagina.htm' ), '<#conteudo>', Result );

end; {MontaPagina}



//Coloca as inicias das palavras contidas na string em maiúsculas e as
//demais em minúsculas.
function StrToName(sStr: String): String;
var
  iPos : integer;
  sPalavra : String;
begin
  sStr := trim( AnsiLowerCase( sStr ) );
  Result := '';

  while True do
  begin
    iPos := Pos( ' ', sStr );
    if iPos > 0 then
    begin
      sPalavra := trim( Copy( sStr, 1, iPos - 1 ) );
      sStr := trim( Copy( sStr, iPos, length( sStr ) - iPos + 1 ) );
    end
    else
    begin
      sPalavra := sStr;
      sStr := '';
    end;

    if   ( sPalavra <> 'do'  )
     and ( sPalavra <> 'da'  )
     and ( sPalavra <> 'dos' )
     and ( sPalavra <> 'das' )
     and ( sPalavra <> 'de'  )
     or  ( Result   =  ''      ) then
      sPalavra := AnsiUpperCase( Copy( sPalavra, 1, 1 ) ) +
                  Copy( sPalavra, 2, length( sPalavra ) - 1 );

    Result := Result + ' ' + sPalavra;

    if sStr = '' then
      break;
  end;

  Result := trim( Result );
end; {StrToName}


//Monta o JavaScript e as tags do menu dinâmico
procedure MontaAcessoMenu;
var
  bMostraConsulta, bMostraDadosCadastrais, bMostraReserva : boolean;
  bMostraEmprestimo, bMostraExtratoEmprestimo : boolean;
  bMostraAlteracao,
  bMostraBeneficio : boolean;

  sPrimeiroMenu, sTituloPagina : String;
  iPosAtual : integer;

  //Gera o trecho do código JavaScript onde os menus são gerados.
  procedure MontaMenuJavaScript( sNomeParent, sNomeMenu, sTexto : String ); 
  begin
    if sNomeParent <> 'root' then sNomeParent := 'menu' + sNomeParent;
    if sPrimeiroMenu = '' then sPrimeiroMenu := sNomeMenu;
    sJavaMenu := sJavaMenu +
     '        window.menu' + sNomeMenu + ' = new Menu("' + sTexto + '", ' +
     IntToStr( iMenuLargura ) + ', ' + IntToStr( iMenuAltura )      +
     ', ' + QuotedStr( sMenuNomeFonte ) + ', ' + IntToStr( iMenuTamFonte ) + ', ' +
     QuotedStr( sMenuCorFonte ) + ', ' + QuotedStr( sMenuCorFonteSel ) + ', ' +
     QuotedStr( sMenuCorFundo ) + ', ' + QuotedStr( sMenuCorFundoSel ) + ' ); ' + CR;
  end;

  procedure MontaMenuId( sNomeParent, sNomeMenu : string; iSubMenu : integer );
  var
    sTitLocal : string;
  begin
    TemAcessoPagina( sTipoUsuario, iSubMenu, sTitLocal );
    MontaMenuJavaScript( sNomeParent, sNomeMenu, sTitLocal );
  end;

  //Gera o trecho do código HTML dos botões roll-over.
  function GeraRollOver( sNomeMenu : String; iPosX, iPosY : integer ) : String;
  begin
    Result :=
     '<A href="#" ' +
     ' onMouseOut="MM_swapImgRestore(); FW_startTimeout();" ' +
     ' onMouseOver="window.FW_showMenu(window.menu' + sNomeMenu + ', ' +
     IntToStr( iPosX ) + ', ' + IntToStr( iPosY ) + '); ' +
     ' MM_swapImage(''mnubranco'','''',''../Imagem/Menu/mnubranco.gif'',1);">' + 
     '<img name="img' + sNomeMenu + '" src="../Imagem/Menu/btn' + sNomeMenu + '.gif" border="0" align="top"' +
     ' onMouseOver="img' + sNomeMenu + '.src=''../Imagem/Menu/btn' + sNomeMenu + '_s.gif''"' +
     ' onMouseOut="img' + sNomeMenu + '.src=''../Imagem/Menu/btn' + sNomeMenu + '.gif''"></A>' + CR;
  end;


  //Gera o trecho do código JavaScript onde os menus são finalizados.
  procedure FinalizaMenu( sNomeMenu : String );
  begin
    sJavaMenu := sJavaMenu +
     '        menu' + sNomeMenu + '.childMenuIcon="../Imagem/Menu/arrows.gif" ' + CR +
     '        menu' + sNomeMenu + '.hideOnMouseOut=true;                      ' + CR + CR;
  end;

  //Inclui um novo item de menu
  procedure IncluiMenu( sNomeMenu, sTexto, sNomeForm : String );
  begin
    sJavaMenu := sJavaMenu +
     '        menu' + sNomeMenu + '.addMenuItem("' + sTexto + '", '+
     '"JavaScript:EnviaForm( document.' + sNomeForm + ' )"); '+ CR;
  end;


  //Inclui um novo subitem em um menu
  procedure IncluiSubMenu( sNomeParent, sNomeMenu : String ) ;
  begin
    sJavaMenu := sJavaMenu +
     '        menu' + sNomeParent + '.addMenuItem( menu' + sNomeMenu + ' ); '+ CR;
  end;

begin

  //Variáveis que controlam a exibição do botão que ativa os menus suspensos
  bMostraConsulta          := False;
  bMostraDadosCadastrais   := False;
  bMostraReserva           := False;
  bMostraAlteracao         := False;
  bMostraEmprestimo        := False;
  bMostraBeneficio         := False;
  bMostraExtratoEmprestimo := False;

  //Indica o primeiro menu criado
  sPrimeiroMenu := '';

  sJavaMenu     := '';
  sMenu         := '';
  sTituloPagina := '';

  //Inicializa o posicionador
  iPosAtual := iMenuPosX;

  //---------- Início Menu CONSULTA
  {}
  {}  //--------------- Início Item de Menu "Dados do Participante"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pDadosDoParticipante, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraDadosCadastrais then
  {}  {}      MontaMenuId( 'Consulta', 'DadosCadastrais', pSubMenuDadosCadastrais );
  {}  {}
  {}  {}    IncluiMenu( 'DadosCadastrais', sTituloPagina, 'frmLnkDadosParticipante' );
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}    bMostraDadosCadastrais := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Dados do Participante"
  {}
  {}  //--------------- Início Item de Menu "Dados do Participante na Patrocinadora"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pParticipanteNaPatrocinadora, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraDadosCadastrais then
  {}  {}      MontaMenuId( 'Consulta', 'DadosCadastrais', pSubMenuDadosCadastrais );
  {}  {}
  {}  {}    IncluiMenu( 'DadosCadastrais', sTituloPagina, 'frmLnkDadosPartPatro' );
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}    bMostraDadosCadastrais := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Dados do Participante na Patrocinadora"
  {}
  {}  //--------------- Início Item de Menu "Dados do Participante nos Planos"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pParticipanteNosPlanos, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraDadosCadastrais then
  {}  {}      MontaMenuId( 'Consulta', 'DadosCadastrais', pSubMenuDadosCadastrais );
  {}  {}
  {}  {}    IncluiMenu( 'DadosCadastrais', sTituloPagina, 'frmLnkDadosPartPlanos' );
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}    bMostraDadosCadastrais := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Dados do Participante nos Planos"
  {}
  {}  //--------------- Início Item de Menu "Saldo de Reserva"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pSaldoDeReserva, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraReserva then
  {}  {}      MontaMenuId( 'Consulta', 'Reserva', pSubMenuReservaPoupanca );
  {}  {}
  {}  {}    IncluiMenu( 'Reserva', sTituloPagina, 'frmLnkSaldoReserva' );
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}    bMostraReserva := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Saldo de Reserva"
  {}
  {}  //--------------- Início Item de Menu "Extrato de Reserva"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pExtratoDeReserva, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraReserva then
  {}  {}      MontaMenuId( 'Consulta', 'Reserva', pSubMenuReservaPoupanca );
  {}  {}
  {}  {}    IncluiMenu( 'Reserva', sTituloPagina, 'frmLnkExtratoReserva' );
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}    bMostraReserva := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Extrato de Reserva"
  {}
  {}  //Monta o menu de consulta
  {}  MontaMenuJavaScript( 'root', 'Consulta', 'Consulta' );
  {}
  {}  if bMostraDadosCadastrais then IncluiSubMenu( 'Consulta', 'DadosCadastrais' );
  {}
  {}  //--------------- Início Item de Menu "Tempo de Serviço"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pTempoDeServico, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkTempoServico' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Tempo de Serviço"
  {}
  {}  //--------------- Início Item de Menu "Histórico de Contribuições"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pHistoricoDeContribuicoes, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkContribuicoes' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Histórico de Contribuições"
  {}
  {}  //--------------- Início Item de Menu "Eventos Previdenciários"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEventosPrevidenciarios, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkEventosPrev' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Eventos Previdenciários"
  {}
  {}  //--------------- Início Item de Menu "Eventos Previdenciários de Planos Ativos"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEventosPrevAtivos, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkEventosPrevAtivos' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Eventos Previdenciários"
  {}
  {}  //--------------- Início Item de Menu "Quadro Salarial"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pQuadroSalarial, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkQuadroSalarial' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Quadro Salarial"
  {}
  {}  //--------------- Início Item de Menu "Contra-Cheque"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pContraCheque, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkContraCheque' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Contra-Cheque"
  {}
  {}  //--------------- Início Item de Menu "Consulta Situação Atual de Benefícios"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pSitAtualBenef, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkSitAtualBenefPar' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Consulta Situação Atual de Benefícios"
  {}
  {}  //--------------- Início Item de Menu "Histórico de Benefícios"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pHistoricoDeBeneficios, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkHistBenef' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Histórico de Benefícios"
  {}
  {}  //--------------- Início Item de Menu "Consignação Judicial"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pConsignacaoJudicial, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkConsignacao' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Consignação Judicial"
  {}
  {}  //--------------- Início Item de Menu "Informe de Rendimentos"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pInformeRendimentos, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkInformeRendimentos' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Consignação Judicial"
  {}
  {}  //--------------- Início Item de Menu "Extrato de Reserva por período"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pExtResPer, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraConsulta := True;
  {}  {}
  {}  {}    IncluiMenu( 'Consulta', sTituloPagina, 'frmLnkExtResPer' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Consignação Judicial"
  {}
  {}  if bMostraReserva then IncluiSubMenu( 'Consulta', 'Reserva' );
  {}
  {}  if bMostraConsulta then
  {}  begin
  {}    sMenu := sMenu + GeraRollOver( 'Consulta', iPosAtual, iMenuPosY );
  {}    iPosAtual := iPosAtual + iMenuDistancia;
  {}    FinalizaMenu( 'Consulta' );
  {}  end;
  {}
  //---------- Fim Menu CONSULTA


  //---------- Início Menu ALTERAÇÃO
  {}
  {}  //Monta o menu de alteração
  {}  MontaMenuJavaScript( 'root', 'Alteracao', 'Alteracao' );
  {}
  {}  //--------------- Início Item de Menu "Alteração de Senha"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pAlteraSenha, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraAlteracao := True;
  {}  {}
  {}  {}    IncluiMenu( 'Alteracao', sTituloPagina, 'frmLnkAlteracaoSenha' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Alteração de Senha"
  {}
  {}  //--------------- Início Item de Menu "Alteração de Endereços"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pManutEnderecos, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraAlteracao := True;
  {}  {}
  {}  {}    IncluiMenu( 'Alteracao', sTituloPagina, 'frmLnkManutEnderecos' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Alteração de Endereços"
  {}
  {}  //--------------- Início Item de Menu "Alteração de Dependentes"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pManutDependentes, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraAlteracao := True;
  {}  {}
  {}  {}    IncluiMenu( 'Alteracao', sTituloPagina, 'frmLnkManutDependentes' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Alteração de Dependentes"
  {}
  {}  //--------------- Início Item de Menu "Alteração de Telefones"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pManutTelefones, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraAlteracao := True;
  {}  {}
  {}  {}    IncluiMenu( 'Alteracao', sTituloPagina, 'frmLnkManutTelefones' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Alteração de Telefones"
  {}
  {}  if bMostraAlteracao then
  {}  begin
  {}    sMenu := sMenu + GeraRollOver( 'Alteracao', iPosAtual, iMenuPosY );
  {}    iPosAtual := iPosAtual + iMenuDistancia;
  {}    FinalizaMenu( 'Alteracao' );
  {}  end;
  {}
  //---------- Fim Menu ALTERAÇÃO



  //---------- Início Menu EMPRÉSTIMO
  {}
  {}  //--------------- Início Item de Menu "Extrato de Empréstimos Agrupado"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEmpExtratoAgrEmprestimos, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraExtratoEmprestimo then
  {}  {}      MontaMenuId( 'Emprestimo', 'ExtratoEmprestimo', pSubMenuExtratoEmprestimos );
  {}  {}
  {}  {}    IncluiMenu( 'ExtratoEmprestimo', sTituloPagina, 'frmLnkEmpExtratoAgrEmprestimos' );
  {}  {}
  {}  {}    bMostraEmprestimo        := True;
  {}  {}    bMostraExtratoEmprestimo := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Extrato de Empréstimos Agrupado"
  {}
  {}  //--------------- Início Item de Menu "Extrato de Empréstimos Expandido"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEmpExtratoExpEmprestimos, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    if not bMostraExtratoEmprestimo then
  {}  {}      MontaMenuId( 'Emprestimo', 'ExtratoEmprestimo', pSubMenuExtratoEmprestimos );
  {}  {}
  {}  {}    IncluiMenu( 'ExtratoEmprestimo', sTituloPagina, 'frmLnkEmpExtratoExpEmprestimos' );
  {}  {}
  {}  {}    bMostraEmprestimo        := True;
  {}  {}    bMostraExtratoEmprestimo := True;
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Extrato de Empréstimos Expandido"
  {}
  {}
  {}  //Monta o menu de empréstimos
  {}  MontaMenuJavaScript( 'root', 'Emprestimo', 'Emprestimo' );
  {}
  {}  if bMostraExtratoEmprestimo then IncluiSubMenu( 'Emprestimo', 'ExtratoEmprestimo' );
  {}
  {}  //--------------- Início Item de Menu "Consulta Contrato de Empréstimo"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEmpConsultaContrato, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraEmprestimo := True;
  {}  {}
  {}  {}    IncluiMenu( 'Emprestimo', sTituloPagina, 'frmLnkEmpConsultaContrato' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Consulta Contrato de Empréstimo"
  {}
  {}  //--------------- Início Item de Menu "Consulta Contrato de Empréstimo"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEmpConsultaInscricao, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraEmprestimo := True;
  {}  {}
  {}  {}    IncluiMenu( 'Emprestimo', sTituloPagina, 'frmLnkEmpConsultaInscricao' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Consulta Contrato de Empréstimo"
  {}
  {}  //--------------- Início Item de Menu "Simulação/Inscrição"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pEmpSimulacao, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraEmprestimo := True;
  {}  {}
  {}  {}    IncluiMenu( 'Emprestimo', sTituloPagina, 'frmLnkEmpSelTpContrato' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Simulação/Inscrição"
  {}
  {}  if bMostraEmprestimo then
  {}  begin
  {}    sMenu := sMenu + GeraRollOver( 'Emprestimo', iPosAtual, iMenuPosY );
  {}    iPosAtual := iPosAtual + iMenuDistancia;
  {}    FinalizaMenu( 'Emprestimo' );
  {}  end;
  {}
  //---------- Fim Menu EMPRÉSTIMO



  //---------- Início Menu BENEFÍCIO
  {}
  {}  //Monta o menu de benefícios
  {}  MontaMenuJavaScript( 'root', 'Beneficio', 'Beneficio' );
  {}
  {}  //--------------- Início Item de Menu "Simulação"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pBenefSimulacao, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraBeneficio := True;
  {}  {}
  {}  {}    IncluiMenu( 'Beneficio', sTituloPagina, 'frmLnkBenefSimulacao' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Simulação"
  {}
  {}  //--------------- Início Item de Menu "Transferência de Plano"
  {}  {}  if TemAcessoPagina( sTipoUsuario, pTransfPlano, sTituloPagina ) then
  {}  {}  begin
  {}  {}
  {}  {}    bMostraBeneficio := True;
  {}  {}
  {}  {}    IncluiMenu( 'Beneficio', sTituloPagina, 'frmLnkTransfPlano' );
  {}  {}
  {}  {}  end;
  {}  //--------------- Fim Item de Menu "Transferência de Plano"
  {}
  {}  if bMostraBeneficio then
  {}  begin
  {}    sMenu := sMenu + GeraRollOver( 'Beneficio', iPosAtual, iMenuPosY );
  {}    FinalizaMenu( 'Beneficio' );
  {}  end;
  {}
  //---------- Fim Menu BENEFÍCIO


  //A parte do script abaixo foi retirada para possibilitar entrada de outros itens de menu
  //Chama o método de geração de menus
  //if sJavaMenu <> '' then
    //sJavaMenu := sJavaMenu + CR + '        menu' + sPrimeiroMenu + '.writeMenus();';

end; {MontaAcessoMenu}



//Preenche os "HiddenFields"
function HiddenFields: String;
begin
  Result := '<input type="hidden" name="vIdSessao"         value="' + sIdSessao                + '"> ' + CR +
            '<input type="hidden" name="vIdPessoa"         value="' + IntToStr( iIdPessoa    ) + '"> ' + CR +
            '<input type="hidden" name="vLoginPessoal"     value="' + sLoginPessoal            + '"> ' + CR +
            '<input type="hidden" name="vNomeUsuario"      value="' + sNomeUsuario             + '"> ' + CR +
            '<input type="hidden" name="vMatricula"        value="' + sMatricula               + '"> ' + CR +
            '<input type="hidden" name="vInscricaoNumero"  value="' + sInscricaoNumero         + '"> ' + CR +
            '<input type="hidden" name="vQtdeAcessos"      value="' + IntToStr( iQtdeAcessos ) + '"> ' + CR +
            '<input type="hidden" name="vTipoUsuario"      value="' + sTipoUsuario             + '"> ' + CR +
            '<input type="hidden" name="vSeqAcesso"        value="' + IntToStr( iSeqAcesso   ) + '"> ' ;
end; {HiddenFields}



//Inicia uma ação
function IniciaAcao( RequestLocal: TWebRequest; iIdPagina : integer ) : Boolean;
var
  sAux : string;
begin
  DecimalSeparator := cSeparadorDecimal;
  ShortDateFormat  := sFormatoData;
  CarregaHidden( RequestLocal );
  CarregaPaginasCampos;
  if iIdPagina <> 0 then
    if not TemAcessoPagina( sTipoUsuario, iIdPagina, sAux ) then
      raise Exception.Create('Você não tem permissão para acessar esta página.');
  MontaAcessoForms;
  if bFlgUsaMenu   then MontaAcessoMenu;
  if bFlgUsaLayers then MontaAcessoLayers;
  Result := SessaoExpirada( sIdSessao, sLoginPessoal );
  if not Result then
    if PaginaGravaAcesso( sTipoUsuario, iIdPagina ) then
      WebPagAcessadas.InsereWebPagAcessadas( iIdPessoa, iSeqAcesso, iIdPagina );
end; {IniciaAcao}


//Carrega as variáveis hidden das páginas
procedure CarregaHidden( RequestLocal: TWebRequest );
begin
  sIdSessao         := RequestLocal.ContentFields.Values['vIdSessao'];
  iIdPessoa         := StrToInt( RequestLocal.ContentFields.Values['vIdPessoa'] );
  sLoginPessoal     := RequestLocal.ContentFields.Values['vLoginPessoal'];
  sNomeUsuario      := RequestLocal.ContentFields.Values['vNomeUsuario'];
  sMatricula        := RequestLocal.ContentFields.Values['vMatricula'];
  sInscricaoNumero  := RequestLocal.ContentFields.Values['vInscricaoNumero'];
  iQtdeAcessos      := StrToInt( RequestLocal.ContentFields.Values['vQtdeAcessos'] );
  sTipoUsuario      := RequestLocal.ContentFields.Values['vTipoUsuario'];
  iSeqAcesso        := StrToInt( RequestLocal.ContentFields.Values['vSeqAcesso'] );
end; {CarregaHidden}



//Indica se o usuário tem acesso à página e informa o nome configurado para esta
function TemAcessoPagina( sTpUsuario : String; iIdPagina : integer;
                          var sTituloPagina : String ) : boolean;
var
  sFiltro, sAux : string;
  iPos : integer;
  //Pendência 18467 - 16/02/2007 - Alberto
  sQuery : String;
  iRegraAcesso : Integer;
  //Fim Pendência 18467
begin

  sFiltro := '';
  while sTpUsuario <> '' do
  begin
    iPos := Pos( ',', sTpUsuario );
    if iPos = 0 then
    begin
      sAux       := sTpUsuario;
      sTpUsuario := '';
    end
    else
    begin
      sAux       := StrLeft( sTpUsuario, iPos - 1 );
      sTpUsuario := StrRight( sTpUsuario, length( sTpUsuario ) - iPos );
    end;

    if sFiltro <> '' then sFiltro := sFiltro + ' or ';
    sFiltro := sFiltro + '( IDTIPOUSUARIO = ' + sAux + ' )';
  end;

  sFiltro := '(' + sFiltro + ')';

  if sFiltro <> '' then sFiltro := sFiltro + ' and ';
  sFiltro := sFiltro + '( ( FLGDISPONIVEL = ''S'' ) or ( FLGSEMPREHAB = ''S'' ) )';

  //Filtra as páginas para que sejam consideradas
  //apenas aquelas a que o usuário tem acesso.
  dtmModAutoAtendimento.cdsWebPagina.Filter   := sFiltro;
  dtmModAutoAtendimento.cdsWebPagina.Filtered := True;

  try
    Result := False;
    if dtmModAutoAtendimento.cdsWebPagina.Locate( 'IDPAGINA', iIdPagina, [] ) then
    begin

      //Pendência 18467 - 16/02/2007 - Alberto
      if (not dtmModAutoAtendimento.cdsWebPagina.FieldByName('IDREGRAACESSO').IsNull) then
      begin

        iRegraAcesso := dtmModAutoAtendimento.cdsWebPagina.FieldByName('IDREGRAACESSO').AsInteger;
        sQuery       := StringReplace( sQryAcesso, ':IDPESSOA',    IntToStr( iIdPessoa )      , [rfReplaceAll, rfIgnoreCase] );
        sQuery       := StringReplace( sQuery    , ':IDINTERFACE', IntToStr( iIdWebInterface ), [rfReplaceAll, rfIgnoreCase] );

        WebRegra.CdsDataSetIn.Data := WebRegra.GetDataPacket( sQuery );
        Result := WebRegra.RegraBooleana( IntToStr( iRegraAcesso ), iIdEmpresaProp );

      end else
      Result := True;


      if Result then
      //Fim Pendência 18467
      sTituloPagina := dtmModAutoAtendimento.cdsWebPagina.FieldByName('TITULOPAGINA').AsString;
    end;
  finally
    //Remove o filtro das páginas.
    dtmModAutoAtendimento.cdsWebPagina.Filter   := '';
    dtmModAutoAtendimento.cdsWebPagina.Filtered := False;
  end;

end; {TemAcessoPagina}



//Indica se o usuário tem acesso ao campo e informa o nome configurado para este
function TemAcessoCampo( sTpUsuario : String; iIdCampo : integer;
                          var sTituloCampo : String ) : boolean;
var
  sFiltro, sAux : string;
  iPos : integer;
  //Pendência 18467 - 16/02/2007 - Alberto
  sQuery : String;
  iRegraAcesso : Integer;
  //Fim Pendência 18467
begin

  sFiltro := '';
  while sTpUsuario <> '' do
  begin
    iPos := Pos( ',', sTpUsuario );
    if iPos = 0 then
    begin
      sAux       := sTpUsuario;
      sTpUsuario := '';
    end
    else
    begin
      sAux       := StrLeft( sTpUsuario, iPos - 1 );
      sTpUsuario := StrRight( sTpUsuario, length( sTpUsuario ) - iPos );
    end;

    if sFiltro <> '' then sFiltro := sFiltro + ' or ';
    sFiltro := sFiltro + '( IDTIPOUSUARIO = ' + sAux + ' )';
  end;

  sFiltro := '(' + sFiltro + ')';

  if sFiltro <> '' then sFiltro := sFiltro + ' and ';
  sFiltro := sFiltro + '( ( FLGDISPONIVEL = ''S'' ) or ( FLGSEMPREHAB = ''S'' ) )';

  //Filtra os campos para que sejam considerados
  //apenas aqueles a que o usuário tem acesso.
  dtmModAutoAtendimento.cdsWebCampo.Filter   := sFiltro;
  dtmModAutoAtendimento.cdsWebCampo.Filtered := True;

  try
    Result := False;
    if dtmModAutoAtendimento.cdsWebCampo.Locate( 'IDCAMPO', iIdCampo, [] ) then
    begin

      //Pendência 18467 - 16/02/2007 - Alberto
      if (not dtmModAutoAtendimento.cdsWebCampo.FieldByName('IDREGRAACESSO').IsNull) then
      begin

        iRegraAcesso := dtmModAutoAtendimento.cdsWebCampo.FieldByName('IDREGRAACESSO').AsInteger;
        sQuery       := StringReplace( sQryAcesso, ':IDPESSOA',    IntToStr( iIdPessoa )      , [rfReplaceAll, rfIgnoreCase] );
        sQuery       := StringReplace( sQuery    , ':IDINTERFACE', IntToStr( iIdWebInterface ), [rfReplaceAll, rfIgnoreCase] );

        WebRegra.CdsDataSetIn.Data := WebRegra.GetDataPacket( sQuery );
        Result := WebRegra.RegraBooleana( IntToStr( iRegraAcesso ), iIdEmpresaProp );

      end else
      Result := True;

      if Result then
      //Fim Pendência 18467
      sTituloCampo := dtmModAutoAtendimento.cdsWebCampo.FieldByName('TITULOCAMPO').AsString;
    end;
  finally
    //Remove o filtro dos campos.
    dtmModAutoAtendimento.cdsWebCampo.Filter   := '';
    dtmModAutoAtendimento.cdsWebCampo.Filtered := False;
  end;

end; {TemAcessoCampo}



//Recupera o título da página
function TituloPagina( iIdPagina : integer ) : String;
begin
  if dtmModAutoAtendimento.cdsWebPagina.Locate( 'IDPAGINA', iIdPagina, [] ) then
    Result := dtmModAutoAtendimento.cdsWebPagina.FieldByName('TITULOPAGINA').AsString;
end; {TituloPagina}


//Recupera o título do campo
function TituloCampo( iIdCampo : integer ) : String;
begin
  if dtmModAutoAtendimento.cdsWebCampo.Locate( 'IDCAMPO', iIdCampo, [] ) then
    Result := dtmModAutoAtendimento.cdsWebCampo.FieldByName('TITULOCAMPO').AsString;
end; {TituloCampo}


//Inclui uma coluna para montagem da tabela dinâmica
function IncluiColuna( iIdCampo, iLargura : integer; sAlign : String;
          sOutroTitulo : String; bHighlited : Boolean; bNoHeader : Boolean ) : boolean;
var
  sTituloCampo : String;
  bTemAcesso : boolean;
begin

  //Se for <= 0, dá acesso
  if iIdCampo >= 1 then
    bTemAcesso := TemAcessoCampo( sTipoUsuario, iIdCampo, sTituloCampo )
  else
    bTemAcesso := True;

  if bTemAcesso then
  begin
    cdsHTMLColumns.Append;

    if bNoHeader then
      cdsHTMLColumns.FieldByName('cdfTitle').AsString    := ''
    else
      if sOutroTitulo = '' then
        cdsHTMLColumns.FieldByName('cdfTitle').AsString    := sTituloCampo
      else
        cdsHTMLColumns.FieldByName('cdfTitle').AsString    := sOutroTitulo;

    cdsHTMLColumns.FieldByName('cdfIdCampo').AsInteger     := iIdCampo;
    cdsHTMLColumns.FieldByName('cdfWidth').AsInteger       := iLargura;
    cdsHTMLColumns.FieldByName('cdfAlign').AsString        := sAlign;
    cdsHTMLColumns.FieldByName('cdfHighlited').AsBoolean   := bHighlited;
    cdsHTMLColumns.FieldByName('cdfNoHeader').AsBoolean    := bNoHeader;
    cdsHTMLColumns.Post;
  end;

  Result := bTemAcesso;
end; {IncluiColuna}


//Montagem do "header" da tabela dinâmica
function HTMLTableHeader : String;
var
  sClass : String;
begin
  //Desenha o header da tabela
  Result :=
   ' <table class="TABELA" border="0" width="100%" cellspacing="0" cellpadding="0"> ' + CR +
   '   <tr>                                                                         ' + CR ;

  if not cdsHTMLColumns.IsEmpty then
  begin
    cdsHTMLColumns.First;

    //Redimensiona as colunas até atingirem 100% do tamanho da tabela
    while cdsHTMLColumns.Aggregates.Items[0].Value < 100 do
    begin
      cdsHTMLColumns.Edit;
      cdsHTMLColumns.FieldByName('cdfWidth').AsInteger :=
       cdsHTMLColumns.FieldByName('cdfWidth').AsInteger + 1;
      cdsHTMLColumns.Post;
      cdsHTMLColumns.Next;
      if cdsHTMLColumns.Eof then cdsHTMLColumns.First;
    end;

    cdsHTMLColumns.First;
    while not cdsHTMLColumns.Eof do
    begin

      if cdsHTMLColumns.FieldByName('cdfNoHeader').AsBoolean then
        sClass := 'style="color: none; background: none; border-style: none"'
      else
        if cdsHTMLColumns.FieldByName('cdfHighlited').AsBoolean then
          sClass := 'class="TABLECABD"'
        else
          sClass := 'class="TABLECAB"';

      Result := Result +
       '           <td width="'+ cdsHTMLColumns.FieldByName('cdfWidth').AsString +
       '%" '+ sClass +' align="'+ cdsHTMLColumns.FieldByName('cdfAlign').AsString +
       '"> ' + CR + cdsHTMLColumns.FieldByName('cdfTitle').AsString + CR +
       '           </td>                                              ' + CR ;
                  
      cdsHTMLColumns.Next;
    end;

  end;

  Result := Result + ' </tr> '  + CR ;
end;


//Montagem da linha da tabela dinâmica
function HTMLTableRow : String;
var
  sClass : String;
begin
  Result := ' <tr> ' + CR ;

  cdsHTMLColumns.First;
  while not cdsHTMLColumns.Eof do
  begin
    if cdsHTMLColumns.FieldByName('cdfHighlited').AsBoolean then
      sClass := 'TABLECONTD'
    else
      sClass := 'TABLECONT';

    Result := Result +
     '   <td width="'+ cdsHTMLColumns.FieldByName('cdfWidth').AsString +
     '%" class="'+ sClass +'" align="'+ cdsHTMLColumns.FieldByName('cdfAlign').AsString +
     '"> ' + CR + cdsHTMLColumns.FieldByName('cdfContent').AsString + CR +
     '   </td> ' + CR;

    cdsHTMLColumns.Next;
  end;

  Result := Result + ' </tr> ' + CR ;

end;



//Montagem do "footer" da tabela dinâmica
function HTMLTableFooter : String;
begin
  Result := ' </table> ' + CR ;
end;


//Preenche uma coluna de uma tabela dinâmica com um conteúdo qualquer
function PreencheColuna( iIdCampo : integer; sConteudo : String ) : String;
var
  sAux : String;
  bTemAcesso : boolean;
begin

  //Se for <= 0, dá acesso
  if iIdCampo >= 1 then
    bTemAcesso := TemAcessoCampo( sTipoUsuario, iIdCampo, sAux )
  else
    bTemAcesso := True;

  if bTemAcesso then
  begin
    cdsHTMLColumns.First;
    cdsHTMLColumns.Locate( 'cdfIdCampo', IntToStr( iIdCampo ), [] );
    cdsHTMLColumns.Edit;
    cdsHTMLColumns.FieldByName('cdfContent').AsString := sConteudo;
    cdsHTMLColumns.Post;
  end;
end;

//Inclui campos nas páginas de consulta
function IncluiCampo( iIdCampo : integer; sConteudo : String; bAceitaZero : boolean = True; iLarguraDesc : integer = 20; sTituloSubst : string = '' ) : String;
var
  sTituloCampo : String;
begin
  Result := '';

  sConteudo := trim( sConteudo );
  if sConteudo = '' then exit;
  if not bAceitaZero then
  begin
    try
      if StrToFloat( sConteudo ) = 0 then
        exit;
    except
      exit;
    end;
  end;

  if TemAcessoCampo( sTipoUsuario, iIdCampo, sTituloCampo ) then
  begin
    if sTituloSubst <> '' then
      sTituloCampo := sTituloSubst;
    Result :=
     '  <tr>                                                                       ' + CR +
     '    <td width="' + IntToStr( iLarguraDesc ) + '%">                           ' + CR +
     '      <p class="DESCCAMPO">                                                  ' + CR +
     sTituloCampo                                                                    + CR +
     '      </p>                                                                   ' + CR +
     '    </td>                                                                    ' + CR +
     '    <td width="3%">                                                          ' + CR +
     '      <p class="DESCCAMPO">                                                  ' + CR +
     '        :                                                                    ' + CR +
     '      </p>                                                                   ' + CR +
     '    </td>                                                                    ' + CR +
     '    <td>                                                                     ' + CR +
     '      <p class="CONTCAMPO">                                                  ' + CR +
     sConteudo                                                                       + CR +
     '      </p>                                                                   ' + CR +
     '    </td>                                                                    ' + CR +
     '  </tr>                                                                      ' + CR ;
  end;

end; {IncluiCampo}


//Substitui a função global, não fazendo conexões com o banco
function LocalGeraDataBaseName(Owner :TComponent; DataBase: TDataBase;
         SetaNetDir: Boolean = false; DbSession: TSession = nil): String;
var
  sAux, sBaseDir, sPrivateDir : String;
Begin
  If DataBase.Connected Then DataBase.Close;

  If SetaNetDir Then
  Begin

     sBaseDir := sTmpDir + 'BdeTmp\T';

     repeat
       sAux := GeraNomeAleatorio( 8 );
       sPrivateDir := sBaseDir + sAux;
     until (not DirectoryExists(sPrivateDir));

     ForceDirectories( sPrivateDir );

     If DbSession = nil Then
       Session.PrivateDir := sPrivateDir
     Else
     Begin
       If DbSession.Active Then DbSession.Close;
       DbSession.SessionName := 'Ssn' + sAux;
       DbSession.PrivateDir := sPrivateDir;
     End;

     Result := sPrivateDir;
  End
  Else
    Result := '';

  DataBase.DatabaseName := 'Dbn' + sAux;

  If DbSession <> nil Then
    DataBase.SessionName := DbSession.SessionName;

End; {LocalGeraDataBaseName}



//Monta validação de um campo em JavaScript
function MontaValidacao( iCampo: integer; sNomeCampoHTML, sTipo : string ) : String;
var
  sTituloCampo : string;
begin
  Result := '';

  if TemAcessoCampo( sTipoUsuario, iCampo, sTituloCampo ) then
  begin
    //Text
    if sTipo = 'T' then
      Result := ' if ( document.' + sNomeCampoHTML + '.value == '''' ) ';

    //Combo
    if sTipo = 'C' then
      Result := ' if ( document.' + sNomeCampoHTML + '.value == ''-1'' ) ';

    Result := Result +
     ' {                                                                   ' + CR +
     '   alert(''O campo "' + sTituloCampo + '" deve estar preenchido.''); ' + CR +
     '   document.' + sNomeCampoHTML + '.focus();                          ' + CR +
     '   exit;                                                             ' + CR +
     ' }                                                                   ' + CR ;
  end;
end; {MontaValidacao}


//Testa se houve atualização em um campo e o altera, caso necessária
function AtualizaCampo( iIdCampo : integer; fCampo  : TField; sConteudo : String; bCombo : boolean ) : boolean;
var
  sAux : string;
begin
  Result := False;

  if iIdCampo > 0 then
    if not TemAcessoCampo( sTipoUsuario, iIdCampo, sAux ) then
      exit;

  sAux := trim( sConteudo );

  if bCombo then
    if sAux = '-1' then sAux := '';

  if trim( fCampo.AsString ) <> sAux then
  begin
    fCampo.AsString := sAux;
    Result := True;
  end;
end; {AtualizaCampo}

function AtualizaCampo( iIdCampo : integer; fCampo  : TField; iConteudo : integer; bCombo : boolean = False ) : boolean;
var
  sAux : string;
begin
  Result := False;

  if iIdCampo > 0 then
    if not TemAcessoCampo( sTipoUsuario, iIdCampo, sAux ) then
      exit;

  if ( bCombo ) and ( iConteudo = -1 )then
  begin
    if not fCampo.IsNull then
    begin
      fCampo.Clear;
      Result := True;
    end;
  end
  else
    if fCampo.AsInteger <> iConteudo then
    begin
      fCampo.AsInteger := iConteudo;
      Result := True;
    end;
end; {AtualizaCampo}


function AtualizaCampo( iIdCampo : integer; fCampo  : TField; iDia, iMes, iAno : integer ) : boolean; overload;
var
  sAux : string;
  dAux : TDateTime;
begin
  Result := False;

  if iIdCampo > 0 then
    if not TemAcessoCampo( sTipoUsuario, iIdCampo, sAux ) then
      exit;

  //Se é data nula...
  if ( iDia <= 0 ) and ( iMes <= 0 ) and ( iAno <= 0 ) then
  begin
    fCampo.Clear;
    Result := True;
  end
  else
  begin
    try
      dAux := EncodeDate( iAno, iMes, iDia );
    except
      raise Exception.Create('Data de nascimento inválida.');
    end;

    if fCampo.AsDateTime <> dAux then
    begin
      fCampo.AsDateTime := dAux;
      Result := True;
    end;

  end;
end; {AtualizaCampo}


//Converte um número para formato "###.##"
function ConverteVirgulaParaPonto( fNum : real ) : String;
begin
  Result := FloatToStr( fNum );
  Result := StrSubst( Result, '.', '' );
  Result := StrSubst( Result, ',', '.' );
end; {ConverteVirgulaParaPonto}


//Converte um string para formato "###,##"
function ConvertePontoParaVirgulaStr( sNum : string ) : String;
begin
  Result := StrSubst( sNum, ',', '' );
  Result := StrSubst( Result, '.', ',' );
end; {ConvertePontoParaVirgulaStr}


//Converte um string para formato "###,##"
function ConverteVirgulaParaPontoStr( sNum : string ) : String;
begin
  Result := StrSubst( sNum, '.', '' );
  Result := StrSubst( Result, ',', '.' );
end; {ConverteVirgulaParaPontoStr}


//Converte um número para formato do Oracle
function OraNumero( sNumero : string ):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = ','
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end; {OraNumero}


//Converte um número para formato inverso do Oracle
function OraNumeroInv( sNumero : string ):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sOra := sOra + ',';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> ','
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+',';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end; {OraNumeroInv}


//Monta o JavaScript para acesso aos módulos
procedure MontaAcessoForms;

  //Acrescenta o form à página.
  procedure F( iPagina : integer; sNomeForm, sNomeAcao : String ) ;
  var
    sAux : string;
  begin
    if TemAcessoPagina( sTipoUsuario, iPagina, sAux ) then
      sLinkMenu := sLinkMenu +
       '<form method="POST" name="frmLnk' + sNomeForm + '"' +
       ' action="../' + sNomeArqApl + '/' + sNomeAcao + ' "> ' +
       CR + HiddenFields + CR + '</form>' + CR;
  end;

begin
  sLinkMenu := '';

  F( pDadosDoParticipante,         'DadosParticipante',         'ConsultaDadosParticipante' );
  F( pParticipanteNaPatrocinadora, 'DadosPartPatro',            'ConsultaPartPatro'         );
  F( pParticipanteNosPlanos,       'DadosPartPlanos',           'ConsultaPartPlanos'        );
  F( pSaldoDeReserva,              'SaldoReserva',              'ConsultaSaldoReserva'      );
  F( pExtratoDeReserva,            'ExtratoReserva',            'ConsultaExtratoReserva'    );
  F( pTempoDeServico,              'TempoServico',              'ConsultaTempoServico'      );
  F( pHistoricoDeContribuicoes,    'Contribuicoes',             'ConsultaContribuicoes'     );
  F( pEventosPrevidenciarios,      'EventosPrev',               'ConsultaEventosPrev'       );
  F( pQuadroSalarial,              'QuadroSalarial',            'ConsultaQuadroSalarial'    );
  F( pContraCheque,                'ContraCheque',              'ConsultaContraCheque'      );
  F( pSitAtualBenef,               'SitAtualBenefPar',          'ConsultaSitAtualBenefPar'  );
  F( pHistoricoDeBeneficios,       'HistBenef',                 'ConsultaHistBenef'         );
  F( pConsignacaoJudicial,         'Consignacao',               'ConsultaConsignacao'       );
  F( pAlteraSenha,                 'AlteracaoSenha',            'AlteracaoSenha'            );
  F( pManutEnderecos,              'ManutEnderecos',            'ManutEnderecos'            );
  F( pManutDependentes,            'ManutDependentes',          'ManutDependentes'          );
  F( pEmpConsultaContrato,         'EmpConsultaContrato',       'EmpParamConsultaContrato'  );
  F( pEmpConsultaInscricao,        'EmpConsultaInscricao',      'EmpParamConsultaInscricao' );
  F( pEmpExtratoExpEmprestimos,    'EmpExtratoExpEmprestimos',  'EmpExtratoExpEmprestimos'  );
  F( pEmpExtratoAgrEmprestimos,    'EmpExtratoAgrEmprestimos',  'EmpExtratoAgrEmprestimos'  );
  F( pEmpSimulacao,                'EmpSelTpContrato',          'EmpSelTpContrato'          );
  F( pTransfPlano,                 'TransfPlano',               'TransfPlano'               );
  F( pInformeRendimentos,          'InformeRendimentos',        'InformeRendimentos'        );
  F( pBenefSimulacao,              'BenefSimulacao',            'BenefSimulacao'            );
  F( pExtResPer,                   'ExtResPer',                 'ExtResPer'                 );
  F( pEventosPrevAtivos,           'EventosPrevAtivos',         'ConsultaEventosPrevAtivos' );
  F( pEmpParConsContrato,          'EmpParConsContrato',        'EmpParConsContrato'        );
  F( pEmpParExtratoEmptmo,         'EmpParExtratoEmptmo',       'EmpParExtratoEmptmo'       );
  F( pManutTelefones,              'ManutTelefones',            'ManutTelefones'            );
end; {MontaAcessoForms}

//Torna os layers para acesso visíveis
//Pendência 22934 - 11/09/2006 - David
procedure MontaAcessoLayers;

  //Torana o layer visível
  procedure IncluiLayer( iPagina : integer; sNomeLayer : String ) ;
  var
    sAux : string;
  begin
    if   ( trim( sNomeLayer ) <> '' )
     and ( TemAcessoPagina( sTipoUsuario, iPagina, sAux ) ) then
      sJavaLayers := sJavaLayers + 'eval("' + sNomeLayer + '.style.display=''''");' + CR;
  end;

  var cdsTemp: TCMClientDataSet;

begin
  sJavaLayers := '';
  try
     cdsTemp := TCMClientDataSet.Create(nil);
     cdsTemp.Data := dtmModAutoAtendimento.cdsWebPagina.Data;
     cdsTemp.First;
     while not cdsTemp.Eof do
     begin
       IncluiLayer( cdsTemp.FieldByName('IDPAGINA').AsInteger, cdsTemp.FieldByName('LAYERACESSO').AsString );
       cdsTemp.Next;
     end;
   finally
      FreeAndNil( cdsTemp );
   end;
end; {MontaAcessoLayers}


//Monta a página de Impressão de Relatório feito no Gerador
function ImprimeRelatorio( iIdPessoaLocal : integer; Request: TWebRequest ) : String;
var
  sDirReport,
  sDirHTMLFinal,
  sFileData,
  sNomeReport  : String;
  ReportStream : TMemoryStream;

  cdsReports : TCMClientDataSet;

  sTitReport : string;
  iIdReports, iOrigemCM : integer;

  rtContrato     : TReportType;
  sHTMLFile      : string;

  sHTMLLocal     : string;
  i, iQtdeCampos : integer;
begin

  try

    //Recupera os dados da chamada


      //Tipo de contrato
      if Request.ContentFields.Values['edtReportType'] = 'R' then
        rtContrato := rtReportGenerator
      else
        rtContrato := rtHTML;

      //Template HTML
      sHTMLFile := Request.ContentFields.Values['edtHtmlFile'];

      //Dados de localização do relatório
      iIdReports := StrToInt( Request.ContentFields.Values['edtIdReports'] );
      iOrigemCM  := StrToInt( Request.ContentFields.Values['edtOrigemCM'] );

      //Diretório do relatório
      sDirReport := 'Reports\R' +
       Request.ContentFields.Values['edtDirReport'] + '\';

      //Nome do arquivo de dados
      sFileData := Request.ContentFields.Values['edtDirReport'] + '.dat';

      //Título do relatório
      sTitReport := Request.ContentFields.Values['edtTitReport'];



    //Verifica se o arquivo de dados não foi apagado
    if not FileExists( sTmpDir + sDirReport + sFileData ) then
      raise Exception.Create('Não foi possível encontrar o arquivo de dados.');

    //Dados do relatório
    dtmModAutoAtendimento.cdsSQLReport.Close;
    dtmModAutoAtendimento.cdsSQLReport.LoadFromFile( sTmpDir + sDirReport + sFileData );


    //Define o nome do relatório
    sNomeReport := sDirReport + 'RPT0001.HTM';


    sDirHTMLFinal := '';
    Result       := '';


    //Se houverem dados
    if not dtmModAutoAtendimento.cdsSQLReport.IsEmpty then
    begin

      if rtContrato = rtReportGenerator then                 //Se for feito no gerador de relatórios...
      begin

        ReportStream := TMemoryStream.Create;
        cdsReports := TCMClientDataSet.Create( nil);
        try

          //Seleciona os dados do template do relatório no banco
          cdsReports.Data := Reports.SelecionaReports( iIdReports, iOrigemCM );

          if cdsReports.IsEmpty then    //Se o template não existe...
            raise Exception.Create('Não foi possível encontrar o layout do relatório do banco de dados.')
          else
          begin                         //Se existe...

            //Se o template estiver nulo
            if ( cdsReports.FieldByName('TEMPLATE').IsNull ) then
              raise Exception.Create('Template de relatório nulo.')
            else
            begin

              //Envia os dados do termplate para o stream
              ( cdsReports.FieldByName('TEMPLATE') as TBlobField).SaveToStream( ReportStream );

              //Posiciona no início do stream
              ReportStream.Position := 0;

              //Envia o stream para o componente de relatório
              dtmModAutoAtendimento.RptIsapi.Template.LoadFromStream( ReportStream );

              //Define o tipo de output
              //Pendência 23044 - 04/09/2006 - Alberto
              //dtmModAutoAtendimento.RptIsapi.DeviceType := 'HTMLLayerFile';
              dtmModAutoAtendimento.RptIsapi.DeviceType := 'HTMLFile';
              //Fim Pendência 23044

              //Redefine os dados dos componentes
              dtmModAutoAtendimento.RptIsapi.DataPipeline         := dtmModAutoAtendimento.ppSQL;
              dtmModAutoAtendimento.RptIsapi.AllowPrintToArchive  := True;
              dtmModAutoAtendimento.RptIsapi.AllowPrintToFile     := True;
              dtmModAutoAtendimento.RptIsapi.TextFileName         := sTmpDir + sDirReport + 'X.HTM';
              dtmModAutoAtendimento.RptIsapi.ArchiveFileName      := sTmpDir + sDirReport + 'X.HTM';
              dtmModAutoAtendimento.RptIsapi.ShowAutoSearchDialog := False;
              dtmModAutoAtendimento.RptIsapi.ShowPrintDialog      := False;
              dtmModAutoAtendimento.RptIsapi.ShowCancelDialog     := False;

              //Imprime (salva) o relatório
              dtmModAutoAtendimento.RptIsapi.Print;

            end; {if ( cdsReports.FieldByName('TEMPLATE').IsNull ) then} {else}

          end; {if cdsReports.IsEmpty then} {else}

        finally
          cdsReports.Free;
          ReportStream.Clear;
          ReportStream.Free;
        end;

      end
      else
      begin                                                  //Se for em HTML...

        //Se o arquivo não existir..
        if not FileExists( sHTMLFile ) then 
          raise Exception.Create('Não foi possível encontrar o template do relatório.');

        sHTMLLocal := LeTxt( sHTMLFile );

        //Se o arquivo não estiver vazio...
        if trim( sHTMLLocal ) <> '' then
        begin

          //Quantidade de campos
          iQtdeCampos := dtmModAutoAtendimento.cdsSQLReport.FieldCount;

          //Substitui as tags pelos conteúdos dos campos
          for i := 0 to iQtdeCampos - 1 do
            sHTMLLocal := StrSubst( sHTMLLocal, '<#' +
             dtmModAutoAtendimento.cdsSQLReport.Fields[i].FieldName + '>',
             dtmModAutoAtendimento.cdsSQLReport.Fields[i].AsString );

        end;

        //Se não gravar txt...
        if not GravaTxt( sTmpDir + sNomeReport, sHTMLLocal ) then
          raise Exception.Create('Não foi possível gerar o relatório. Erro de gravação em disco.');

      end;


      //Define o diretório do HTML final
      sDirHTMLFinal := '../TEMP/' + StrSubst( sNomeReport, '\', '/' );


      //Formata o diretório no padrão web
      Result :=
       '<html>                                                                  ' + CR +
       '  <head>                                                                ' + CR +
       '    <script>                                                            ' + CR +
       '      function otherload() { top.location = "' + sDirHTMLFinal + '"; }  ' + CR +
       '    </script>                                                           ' + CR +
       '  </head>                                                               ' + CR +
       '  <body onload="setTimeout(''otherload()'',1)">                         ' + CR +
       '    <font face="Arial" size="2">                                        ' + CR +
       '      Por favor, aguarde! Gerando relatório...                          ' + CR +
       '      <BR>                                                              ' + CR +
       '      Caso a tela do relatório não abra automaticamente,                ' + CR +
       '      <a href="' + sDirHTMLFinal + '">clique aqui</a>.                  ' + CR +
       '    </font>                                                             ' + CR +
       '  </body>                                                               ' + CR +
       '</html>                                                                 ' ;

      dtmModAutoAtendimento.cdsSQLReport.Close;

    end;

  except
    On E : Exception do
    begin
      Result := TrataWebExcecoes( E );
    end;
  end;

end; {ImprimeRelatorio}


//Gera dados para um relatório
function GeraDadosRelatorio(  rtContrato     : TReportType;
                              sFormulario    : string;
                              iIdReports     ,
                              iOrigemCM      : integer;
                              sHTMLFile      ,
                              sTitReport     : string;
                              oData          : OLEVariant ) : string;
var
  cdsLocal : TCMClientDataSet;
  sDirReport : string;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try

    //Gera um nome único para o diretório do relatório
    sDirReport := GeraNomeAleatorio( 8 );

    //Cria o diretório
    if not ForceDirectories( sTmpDir + 'Reports\R' + sDirReport + '\' ) then
      raise Exception.Create('Não foi possível gerar a pasta de dados. Contate a fundação.');

    try
      //Grava o dataset em um arquivo
      cdsLocal.Close;
      cdsLocal.Data := oData;
      cdsLocal.SaveToFile( sTmpDir + 'Reports\R' + sDirReport + '\' + sDirReport + '.dat' );
      cdsLocal.Close;
    except
      raise Exception.Create('Não foi possível criar o arquivo de dados. Contate a fundação.');
    end;

    Result :=
     '<form method="POST" name="' + sFormulario + '"                            ' + CR ;

    if bFlgJanelaRelat then
      Result := Result + ' target="_blank" ';

    Result := Result +
     ' action="../<#nomearqapl>/ImprimeRelatorio">                              ' + CR +
     HiddenFields                                                                 + CR +
     '  <input type="hidden" name="edtReportType" value="'                        +
     iff( rtContrato = rtReportGenerator, 'R', 'H' ) + '">                      ' + CR +
     '  <input type="hidden" name="edtHtmlFile" value="' + sHTMLFile + '">      ' + CR +
     '  <input type="hidden" name="edtIdReports" value="'                         +
     IntToStr( iIdReports ) + '">                                               ' + CR +
     '  <input type="hidden" name="edtOrigemCM" value="'                          +
     IntToStr( iOrigemCM ) + '">                                                ' + CR +
     '  <input type="hidden" name="edtDirReport" value="'                         +
     sDirReport + '">                                                           ' + CR +
     '  <input type="hidden" name="edtTitReport" value="' + sTitReport + '">    ' + CR +
     '</form>                                                                   ' + CR ;

  finally
    cdsLocal.Free;
  end;
end; {GeraDadosRelatorio}


//Recupera os dados de configuração de um relatório
procedure RecuperaConfRelatorio( iRelatorio      : integer;
                                 var rtContrato  : TReportType;
                                 var iIdDataView : integer;
                                 var iOrigemCMDV : integer;
                                 var iIdReports  : integer;
                                 var iOrigemCM   : integer;
                                 var sHTMLFile   : string );
var
  cdsLocal   : TCMClientDataSet;
begin
  cdsLocal := TCMClientDataSet.Create( nil );
  try

    //Relatório HTML
    cdsLocal.Close;
    cdsLocal.Data := WebReports.SelecionaWebReports( iRelatorio, iIdWebInterface );

    if cdsLocal.IsEmpty then
      raise Exception.Create('Não foi possível recuperar dados do relatório.');

    if cdsLocal.FieldByName('FLGREPORTTYPE').AsInteger = 2 then
      rtContrato := rtReportGenerator
    else
      rtContrato := rtHTML;


    //Se for ReportGenerator, recuperar dados
    if rtContrato = rtReportGenerator then
    begin
      //Dados do relatório
      iIdReports := cdsLocal.FieldByName('IDREPORTS').AsInteger;
      iOrigemCM  := cdsLocal.FieldByName('ORIGEMCM').AsInteger;
    end
    else
    begin
      //Dados da view
      iIdDataView  := cdsLocal.FieldByName('IDDATAVIEW').AsInteger;
      iOrigemCMDV  := cdsLocal.FieldByName('ORIGEMCMDV').AsInteger;
      sHTMLFile    := cdsLocal.FieldByName('HTMLFILE').AsString;
    end;

    cdsLocal.Close;

    //Se for gerador de relatórios, recupera view
    if rtContrato = rtReportGenerator then
    begin
      //Dados da view
      cdsLocal.Data := Reports.SelecionaReports( iIdReports, iOrigemCm );

      //Se a view não existe...
      if cdsLocal.IsEmpty then
        raise Exception.Create('Não foi possível recuperar os dados da consulta.');

      iIdDataView  := cdsLocal.FieldByName('IDDATAVIEW').AsInteger;
      iOrigemCMDV  := cdsLocal.FieldByName('ORIGEMCMDV').AsInteger;
      cdsLocal.Close;
    end;      

  finally
    cdsLocal.Free;
  end;
end; {RecuperaConfRelatorio}


//Simula o uso do operador i++ em C
function IncAfter( var iVal : integer ) : integer;
begin
  Result := iVal;
  inc( iVal );
end; {IncAfter}


//Simula o uso do operador ++i em C
function IncBefore( var iVal : integer ) : integer;
begin
  inc( iVal );
  Result := iVal;
end; {IncBefore}


// 03/08/2006 - Passou para unit uCtrlFuncoesAA;
//Arredonda um valor para tantas casas decimais quanto necessárias
//function Arredonda( fValor: extended; iDecimais: integer ): extended;
//begin
//  Result := ( round( fValor * Power( 10, iDecimais ) ) ) / Power( 10, iDecimais );
//end;


{Retira o primeiro elemento de uma string (cujos elementos são separados por
 um caracter delimitador), retornando este elemento.}
function RetiraPrimeiroElemento( var sStr : string; cDelimitador : char ) : string;
var
  iPos : integer;
begin
  iPos := Pos( cDelimitador, sStr );
  if iPos <= 0 then
  begin
    Result := sStr;
    sStr   := '';
  end
  else
  begin
    Result := Copy( sStr, 1, iPos - 1 );
    sStr   := Copy( sStr, iPos + 1, length( sStr ) - iPos );
  end;
end; {RetiraPrimeiroElemento}


//Indica se o usuário tem acesso à página e informa o nome configurado para esta
function PaginaGravaAcesso( sTpUsuario : String; iIdPagina : integer ) : boolean;
var
  sFiltro, sAux : string;
  iPos : integer;
begin

  sFiltro := '';
  while sTpUsuario <> '' do
  begin
    iPos := Pos( ',', sTpUsuario );
    if iPos = 0 then
    begin
      sAux       := sTpUsuario;
      sTpUsuario := '';
    end
    else
    begin
      sAux       := StrLeft( sTpUsuario, iPos - 1 );
      sTpUsuario := StrRight( sTpUsuario, length( sTpUsuario ) - iPos );
    end;

    if sFiltro <> '' then sFiltro := sFiltro + ' or ';
    sFiltro := sFiltro + '( IDTIPOUSUARIO = ' + sAux + ' )';
  end;

  //Filtra as páginas para que sejam consideradas
  //apenas aquelas a que o usuário tem acesso.
  dtmModAutoAtendimento.cdsWebPagina.Filter   := sFiltro;
  dtmModAutoAtendimento.cdsWebPagina.Filtered := True;
  try
    Result := False;
    if dtmModAutoAtendimento.cdsWebPagina.Locate( 'IDPAGINA', iIdPagina, [] ) then
      Result := ( trim( dtmModAutoAtendimento.cdsWebPagina.FieldByName('FLGCONTAACESSO').AsString ) = 'S' );
  finally
    //Remove o filtro das páginas.
    dtmModAutoAtendimento.cdsWebPagina.Filter   := '';
    dtmModAutoAtendimento.cdsWebPagina.Filtered := False;
  end;
end; {PaginaGravaAcesso}


procedure CarregaPaginasCampos;
begin
  //Fecha os datasets de páginas e campos
  dtmModAutoAtendimento.cdsWebPagina.Close;
  dtmModAutoAtendimento.cdsWebCampo.Close;

  //Carrega todas as páginas
  dtmModAutoAtendimento.cdsWebPagina.Data := WebPaginaCampo.PaginasUsuario( iIdWebInterface, sTipoUsuario );

  //Carrega todos os campos
  dtmModAutoAtendimento.cdsWebCampo.Data := WebPaginaCampo.CamposUsuario( iIdWebInterface, sTipoUsuario );
end; {CarregaPaginasCampos}


//Cria uma string concactando "n" instâncias de uma substring
function FillStr( str : string; n : integer ) : string;
var
  i : integer;
begin
  Result := '';
  for i := 1 to n do
    Result := Result + str;
end; {FillStr}


//Grava um dataset em um diretório temporário e retorna sua localização e nome do arquivo
function SaveDataset( oData : OLEVariant ) : string;
var
  sDirData,
  sNomeArq : string;
  cdsLocal : TCMClientDataset;
begin

  Result := '';

  sNomeArq := GeraNomeAleatorio( 8 );

  sDirData := sTmpDir + 'Datasets\D' + sNomeArq + '\';

  if not ForceDirectories( sDirData ) then
    raise Exception.Create('Não foi possível gerar a pasta de dados. Contate a fundação.');

  cdsLocal := TCMClientDataset.Create( nil );
  try

    try

      sNomeArq := sDirData + sNomeArq + '.dat';

      cdsLocal.Close;
      cdsLocal.Data := oData;
      cdsLocal.SaveToFile( sNomeArq );
      cdsLocal.Close;

      Result := sNomeArq;

    except
      raise Exception.Create('Não foi possível criar o arquivo de dados. Contate a fundação.');
    end;

  finally
    cdsLocal.Free;
  end;

end; {SaveDataset}


//Monta uma linha em um formulários com os campos e colunas indicados
function MontaLinhaForm( iCampo1 : integer; sContCampo1 : string;
                         iCampo2 : integer = 0; sContCampo2 : string = '' ) : string;
var
  sTitCampo1, sTitCampo2, sAux : string;
  bMostra1, bMostra2 : boolean;
  sIniLinhaAux : string;

  function MontaColuna( sT, sC : string ) : string;
  begin
    Result := StringReplace( sColFmt, '<#T>', sT, [rfReplaceAll] );
    Result := StringReplace( Result,  '<#C>', sC, [rfReplaceAll] );
  end;

begin
  Result := '';

  bMostra1 := TemAcessoCampo( sTipoUsuario, iCampo1, sTitCampo1 );
  if iCampo2 > 0 then
    bMostra2 := TemAcessoCampo( sTipoUsuario, iCampo2, sTitCampo2 )
  else
    bMostra2 := False;

  if bMostra1 or bMostra2 then
  begin
    sIniLinhaAux := sIniLinha;

    if ( not bMostra1 ) or ( not bMostra2 ) then
      sIniLinhaAux := StringReplace( sIniLinhaAux, '<#S>', 'COLSPAN="2"', [rfReplaceAll] )
    else
      sIniLinhaAux := StringReplace( sIniLinhaAux, '<#S>', '', [rfReplaceAll] );

    Result := Result + sIniLinhaAux;

    sAux := '';

    if bMostra1 then sAux := sAux + MontaColuna( sTitCampo1, sContCampo1 );

    if bMostra1 and bMostra2 then sAux := sAux + sEntreCols;

    if bMostra2 then sAux := sAux + MontaColuna( sTitCampo2, sContCampo2 );

    Result := Result + sAux + sFimLinha;
  end;
end; {MontaLinhaForm}


end.


