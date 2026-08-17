unit uCtrlLancamentosImovel;
{-------------------------------------------------------------------------------

             OBJETO DE CONTROLE DE LANCAMENTOS DO IMOBILIÁRIO  ( MT )

             Módulo          :  Comuns Imobiliário
             Autor           :  Vinícius Meyer Lana
             Data de Início  :  20/11/2002
             Data de Término :  03/09/2003

   FUNÇÕES PUBLICADAS:

      Inserir                  - Insere um lançamento na LançamentosImovel
      Excluir                  - Exclui um lançamento com as devidas integrações
      Integrar                 - Integração financeira e contábil do lançamento
      Concilia                 - Efetua a conciliação de documentos com o CAR
      DespesaLocatario         - Verifica a responsabilidade da despesa, obrigando a liberação
      ObrigaLiberacao          - Verifica a necessidade de liberação do documento ( imóvel inativo, receita sem contrato... )
      LookupLancamentosDiarios - Busca Lançamentos para a Contabilização Diária
--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina.............: LookupImoveisDocum, Inserir, Integrar 
//N. SIG.............: 133236 
//Data da Alteração..: 27/04/2023 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de procedimento de lançamento de alteradores de tributação.
//***************************************************************************************
//Rotina.............: IntegraAlteradores
//N. SIG.............: 123435
//Data da Alteração..: 07/03/2022
//Responsável........: Edilaine
//Descrição..........: Retirada espaço em branco do parametro IDENVIODOCUMENTO
//***************************************************************************************
//N. SIG.............: 122017
//Data da Alteração..: 06/01/2022
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Retirada do parâmetro IDENVIODOCUMENTO na busca por alteradores.
//***************************************************************************************
//N. SIG.............: 116142
//Data da Alteração..: 13/07/2021
//Responsável........: Ewerton Beltramini
//Descrição..........: Inclusão do campo IDENVIODOCUMENTO.
//***************************************************************************************
//Rotina.............: LookupAlteradoresDocum
//N. SIG.............: 115585
//Data da Alteração..: 18/05/2021 
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Readequação do tipo de serviço.
//***************************************************************************************
//Rotina.............: LookupAlteradoresDocum
//N. SIG.............: 90052
//Data da Alteração..: 12/08/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Correção na apresentação de documentos na funcionalidade de
//                     Alteração de Lançamento 
//***************************************************************************************
//Rotina.............: LookupAlteradoresDocum
//N. SIG.............: 89101
//Data da Alteração..: 05/08/2019
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Adequação da funcionalidade para a inclusão de Nota Fiscal de Serviço.
//***************************************************************************************
Rotina......: LookupAlteradoresDocum
Nº SIG......: 83943
Data........: 04/04/2019
Responsável.: Fábio Sampaio
Descrição...: Criação do parâmetro para buscar os alteradores da tabela
              LANCTODOCUM ao invés da ALTERALANCIMOVEL.
--------------------------------------------------------------------------------
//***************************************************************************************
//Rotina             : Integrar, Inserir, ListTipoServico, ListProcessos,
//										 ListaDadosCPRBFornecedor, LookupImoveisDocum, FazerLancamentoCApCAr
//N. SIG..........   : 23656.59199
//Data da Alteração: : 27/11/2017
//Alteração Form:    : uCtrlLancamentosImovel
//Responsável:       : Cássio Rovaroto
//Descrição.......   : Desenvolvimento dos procedimentos, funçles e ajustes necessários
//										 para a inclusão dos dados referentes as notas fiscais de serviços,
//										 que serão preecnhidos a partir do lançamento múltiplo de despessas.
//***************************************************************************************
Nº SIG......: 26054
Data........: 26/12/2016
Responsável.: Michelle Suellyn Mota
Descrição...: Implementação no lançamento do imóvel, verifica se possui voto.
--------------------------------------------------------------------------------
Rotina......: LookupDocAberto
N. Sol......: 224203
N. Kintana..: 2057742
Data........: 16/01/2014
Responsável.: Thiago Melo
Descrição...: ajustar falha no carregamento dos documentos que possuem baixas
--------------------------------------------------------------------------------
Rotina......: inserir, integrar
N. Sol......: 222296
N. Kintana..: 2055368
Data........: 16/12/2013
Responsável.: Marcio Sanches Spinosa SOL 222296 KINTANA 2055368
Descrição...: Ajuste para lançamentos dos alteradores na tabela lanctodocum
--------------------------------------------------------------------------------
Rotina......: inserir, integrar
N. Sol......: 107772/5681
N. Kintana..: 1358973
Data........: 07/05/2012
Responsável.: Edilaine Ferraresi
Descrição...: Diferenciar os lançamentos de documentos feitos para contratos e imóveis.
--------------------------------------------------------------------------------
Rotina ......: Excluir
SOL..........: 200960
Kintana......: 1943658
Data.........: 26/02/2013
Responsável..: Thiago Melo
Descrição....: Sistema apresenta erro de constraint
//========================================================================================
Rotina ......: PrepareRatLanImovel
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função para Preparar dados para Inserção de Registro na RATEIOLANCAMENTOSIMOVEL
//========================================================================================
Rotina ......: InsRatLanImovel
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função para Inserir Registro na RATEIOLANCAMENTOSIMOVEL
//========================================================================================
Rotina ......: TBRound
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função UTILIZADA PARA ARREDONDAMENTO DE VALORES
//========================================================================================
Rotina ......: TBTrunc
SOL..........: 180032
Kintana......: 1674608
Data.........: 23/01/2013
Responsável..: Baruc Singh Baptista
Descrição....: Função UTILIZADA PARA TRUNCAMENTO DE VALORES
//========================================================================================

--------------------------------------------------------------------------------
Rotina ......: LookupImoveisDocum
SOL..........: 141052/2322
Kintana......: 914497
Data.........: 13/06/2011
Responsável..: Ricardo de Freitas
Descrição....: Add : Adicionado campo CODTIPIMOVEL_IMOVEL, pois deverá retornar o valor
                     do códido do tipo do imóvel da tabela imóvel para fazer corretamente
                     filtragem de contas contábeis utilizando do tipo de imóvel na PADRLANCIMOVEL
Rotina ......: DefineParamContabeis
Descrição....: Utilizando O CAMPO CODTIPIMOVEL_IMOVEL na BuscaPadrLancContabil.
--------------------------------------------------------------------------------
Rotina......: LookupDocAberto
Nº SOL......: 136336
Nº KINTANA..: 815081
Data........: 18/04/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação do campo DATA_SIMULACAO para o recalculo do documento
--------------------------------------------------------------------------------
Rotina ......: LookupImoveisDocum
SOL..........: 127213
Kintana......: 672023
Data.........: 03/01/2011
Responsável..: Helen V. Bianchi
Descrição....: Add : IDCONDPAGAQUISPARC , InsereMovAcresCorr
--------------------------------------------------------------------------------
Rotina......: ObrigaLiberacao
Nº SOL......: 154196
Nº KINTANA..: 1170533
Data........: 04/03/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Correção para permitir a integração de Receitas para imoveis sem contrato.
--------------------------------------------------------------------------------
Rotina..........: AgrupaMultContaBaixa, IntegraContabilidadePD
N. Sol..........: 133781
N. Kintana......: 781998
Data............: 13/04/2010
Responsável.....: Cássio Camargo
Descrição.......: Alteração nas rotinas que fazem a integração contábil/financeira,
                  para ratear, além dos planos previdenciários, pelas contas contábeis
                  parametrizadas para cada segmento.
--------------------------------------------------------------------------------
Rotina..........: AgrupaMultContaBaixa
N. Sol..........: 131563
N. Kintana......: 750679
Data............: 01/03/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no cálculo para agrupamento de Multiplas Contas de Baixa,
                  que estava mantendo divergência nos valores para a tabela CCBAIXASXDOCUM.
--------------------------------------------------------------------------------
Rotina..........: IntegraContabilidadePD
N. Sol..........: 131100
N. Kintana......: 744151
Data............: 19/02/2010
Responsável.....: Bruno Bastos
Descrição.......: Correção no processso de integração de lançamentos que requsitava
                  os campos IDPATRO e IDPLANOPREV de uma DataSet que não possuia mais.
--------------------------------------------------------------------------------
Rotina..........: IntegraContabilidadePD, AgrupaMultContaBaixa, AgrupaRateioDocum,
                  LookupImoveisDocum
N. Sol..........: 130615
N. Kintana......: 733900
Data............: 11/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Correção no processso de integração de lançamentos que não realiza
                  lançamentos para grupo de com vários imóveis
--------------------------------------------------------------------------------
Rotina..........: IntegraContabilidadePD
N. Sol..........: 130360
N. Kintana......: 734640
Data............: 08/02/2010
Responsável.....: Cássio Camargo
Descrição.......: Acerto na rotina que faz a integração contábil, incluindo a regra
                  de arredondamento de segregação
--------------------------------------------------------------------------------
Pendência   : 27143
Responsável : Daniel Simões
Data        : 20/02/2008
Descrição   : Passa a carregar o parâmetro 'Data de Segregação' na função
              'InsereLancaContab' ...
--------------------------------------------------------------------------------
Pendência   : 27007
Responsável : Daniel Simões
Data        : 02/01/2008
Descrição   : Acrescentei a atualização da data limite...
--------------------------------------------------------------------------------
Pendência   : 26625
Responsável : Gustavo Mendes
Data        : 26/10/2007
Descrição   : Caso o campo CODPORTFORMA, ou REFERENCIAAP não esteja preenchido,
              o mesmo é como NULL
-------------------------------------------------------------------------------
Pendência   : 26271 e 26276
Responsável : Marchetti
Data        : 18/09/2007
Rotina      : Integrar
Descrição   : Caso o campo NOSSONUMERO da tabela LANCAMENTOSIMOVEL esteja preenchido,
              o mesmo é gravado no novo documento gerado
-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26271 e 26276
Responsável : Marchetti
Data        : 18/09/2007
Rotina      : Excluir
Descrição   : Acrescentado o parâmetro de APENAS exclusão de integração financeira e
              contábil. Quando apenas exclusão de integração, guarda o NOSSONUMERO
              na tabela LANCAMENTOSIMOVEL para que seja gravado novamente no novo documento
-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 24872
Responsável : Daniel Simões
Data        : 16/08/2007
Descrição   : Foi acrescentado o parâmetro 'Forma de Cobrança Diferenciada' na
              função 'Inserir'... Passa a excluir também os Indicadores Apurados
              ao excluir o Lançamento...
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros passa a
              trazer da CtrlParamMulta no lugar da CtrlContratoImovel...
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 30/04/2007
Descrição   : Mudança na função 'LookupImoveisDocum'. A query foi adaptada para
              carregar Imóveis ou Unidades pertencentes ao contrato.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


interface

uses
  sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, dbClient, provider, //wwQuery,
  uCMClientDataSet, uCMTypes, uComunsImobiliarioDB, uComunsImobiliario, uDiasUteis,
  uDbLancamentosImovel, uDbObsLancImovel, uDbAlteraLancImovel,
  uCtrlOrcamento, uCtrlLancamento, {uCtrlDocumento,} uCtrlMsgBoleto, uCtrlPadrLancImovel,
  uCtrlParamIntegra, uCtrlModuloImobiliario, uCtrlConcilia,
  uCtrlParamMulta,
  //SOL Nº 92381 KINTANA Nº 394180
  //Implementação de uma nova classe de lançamento de documentos
  uCtrlImobLancamento, uCMMath,
  uCtrlImobDocumento, //; // Daniel - 26104
  // Helen - SOL: 127213 KTN: 672023
  UFuncoesImob,dLancImovel,UDocumento,dImobiliario,uEventoImovel ,uModuloImobiliario,
  uCtrlMovAcrescimoValor, uCtrlBem, uCtrlDomBem,dBaseDados,uSistema,DCAF,uCtrlCafxContab , Wwquery,
  math;
   // Helen - SOL: 127213 KTN: 672023 - FIM

type
  TMensErro = Record
    iCodErro  : integer;
    sMensErro : string;
  end;

  TContabPD = Record
    Parametros    : TParamContabeisMT;
    dLancto       : TDateTime;
    NoDocumento   : Extended;
    IdUsuario     : Integer;
    IdPlanoImovel : Integer;
    IdPatroImovel : Integer;
    VlrTotal      : Extended;
  end;

  TRateio = Record
    iUnidNegoc       : Integer;
    IdPlanoImovel    : Integer;
    IdPatroImovel    : Integer;
    CentroRespon     : String;

    // André Pontes - 09/06/2005 - pendência 19283
    CodCentroCusto   : String;
    // FIM André Pontes - 09/06/2005 - pendência 19283

    // Marchetti - Pendencia 26528
    sCodTipRecDes    : String;
    // Fim Marchetti - Pendencia 26528

    VlrTotal         : Extended;
    VlrTotalOM       : Extended;
  end;

  TImovelLancamento = Record
    iIdImovel  : Integer;
    dValorLanc : Extended;
  end;


  TLancaBM     = array of TContabPD;
  TRateioDocum = array of TRateio;

  TCtrlLancamentosImovel = class(TCmControlObject)
  protected
    procedure onCreateAppServer; override;
    procedure AfterInitialize; override;

  private
    ParamSistema          : TParamSistema;
    FDbLancamentosImovel  : TDbLancamentosImovel;
    FDbObsLancImovel      : TDbObsLancImovel;
    FDbAlteraLancImovel   : TDbAlteraLancImovel;
    ComunsImobiliarioDB   : TComunsImobiliarioDB;
    DiasUteis             : TDiasUteis;
    CtrlContabil          : TCtrlLancamento;
    //CtrlDocumento         : TCtrlDocumento;
    CtrlOrcamento         : TOrcamentoBackMT;
    CtrlMsgBoleto         : TCtrlMsgBoleto;
    CtrlParamIntegra      : TCtrlParamIntegra;
    CtrlModuloImobiliario : TCtrlModuloImobiliario;
    CtrlPadrLancImovel    : TCtrlPadrLancImovel;

    CtrlParamMulta        : TCtrlParamMulta; // Daniel - 26104

    CtrlConcilia          : TCtrlConcilia;

    CtrlImobLancamento    : TCtrlImobLancamento;
    // Helen - SOL: 127213 KTN: 672023
    CtrlMovAcrescimoValor : TCtrlMovAcrescimoValor;
    CtrlBem               : TCtrlBem;
    CtrlDomBem            : TCtrlDomBem;
    CafxContab            : TCtrlCafxContab;
    // Helen - SOL: 127213 KTN: 672023 - FIM
    cdsIntegra            : TClientDataSet;

    FCodigoErroLiberacao  : Integer;

    rParamMulta : TParamMulta; // Daniel - 26104

    aIdImovel : array of Integer;

    CtrlImobDocumento     : TCtrlImobDocumento;


    dValorTotalLancamento :  Double;
    // Helen - SOL: 127213 KTN: 672023
    iMesRefReajuste  : Integer;
    sCodAlterador , sAcresDecres : String  ;

    function ExcluiCobrancaDivege   (const iDocumento:Integer):Boolean;

    // Funções para integração Financeira / Contabil
    function BuscaParametrizacao   (var vParamContabeis: array of TParamContabeisMT; const bSegOper : Boolean = False): TMensErro;
    function DefineParamContabeis  (var rParamContabeis: TParamContabeisMT; const bSegOper : Boolean = False): TMensErro;
    function ConfereParamContabeis (var rParamContabeis: TParamContabeisMT): TMensErro;
    function AtribuiContaForCli    (var rParamContabeis: TParamContabeisMT): TMensErro;
    function DefineHistorico       (var sHistCtb, sHistCapCar:string; const bSegOper : Boolean = False): Boolean;
    function IntegraCaPCaR         (var vParamContabeis: array of TParamContabeisMT): TMensErro;
    function FazerLancamentoCApCAr (var vParamContabeis: array of TParamContabeisMT): TMensErro;
    function SetMensagemCNAB       (const iDocumento: integer): TMensErro;
    function AgrupaMultContaBaixa  (const vParamContabeis: array of TParamContabeisMT; var vLancaBM: TLancaBM): Boolean;
    function AgrupaRateioDocum     (const vParamContabeis: array of TParamContabeisMT; var vRateioDocum: TRateioDocum): Boolean;
    function IntegraContabilidade  (var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
    function IntegraContabilidadePD(var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
    function IntegraAlteradores    (const iDocumento: integer) : TMensErro;
    function IntegraOrcamento: TMensErro;
    function VerificaParamIntegra  (const rParamContabeis: TParamContabeisMT): integer;
    function FazerLancamentoContab (var rParamContabeis: TParamContabeisMT; const sTipoLanc: char;
                                    const dLancto:TDateTime; const NumDoc,VlrLancto:Extended; const idUsuario:Integer;
                                    const iIdPatroImovel, iIdPlanoImovel:Integer;
                                    const iIdImovel : integer = -1):TMensErro;

    procedure TotalDocumIntegrar    (const iDocumento: Integer; var rVlrDoc, rVlrDocOM: Extended);
    procedure SetDbLancamentosImovel(const Value: TDbLancamentosImovel);
    procedure SetDbObsLancImovel    (const Value: TDbObsLancImovel);
    procedure SetDbAlteraLancImovel (const Value: TDbAlteraLancImovel);
    procedure SetCodigoErroLiberacao(const Value: Integer);

    function BuscaDescSegOper(const iIdTipoRecDes: Integer) : String;
    function GetValorTotLanc(iCodDocumento : Integer) : Extended;
    // Helen - SOL: 127213 KTN: 672023
    function VerificaCorrecao (nIdCondPagAquisparc : Extended): Integer;
    function InsereMovAcresCorr(nValorAcres : Extended) : Boolean;
    function VerificaLancDescr (nIdCondPagAquisparc : Extended): Integer;
    // Helen - SOL: 127213 KTN: 672023 - FIM
  public
    iIdImovelParc : Integer;   // Helen - SOL: 127213 KTN: 672023
    pisMultiplaDespesa    : Boolean;//Marcio Sanches Spinosa SOL 222296 KINTANA 2055368
    pCdsAlterador         : TClientDataSet;//Marcio Sanches Spinosa SOL 222296 KINTANA 2055368    
    constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
    destructor  Destroy; override;

    property DbLancamentosImovel : TDbLancamentosImovel read FDbLancamentosImovel write SetDbLancamentosImovel;
    property DbObsLancImovel     : TDbObsLancImovel     read FDbObsLancImovel     write SetDbObsLancImovel;
    property DbAlteraLancImovel  : TDbAlteraLancImovel  read FDbAlteraLancImovel  write SetDbAlteraLancImovel;

    property CodigoErroLiberacao : Integer read FCodigoErroLiberacao write SetCodigoErroLiberacao;

    function LookupLancImob          (const iDocumento: integer): OLEVariant; // Marcio Motta - 27/02/2004 - Pendência: 16112
    function LookupImoveisDocum      (const iDocumento: Integer; const bParaIntegrar: Boolean = False) : OLEVariant;
    function LookupAlteradoresDocum  (const iDocumento: Integer;
                                      bForcaLanctoDocum: Boolean = False // Alterado por FHBS - 03/04/2019 - SIGxxxxx
                                      ) : OLEVariant;
    function LookupObservacaoDocum   (const iIdDocumento: Integer): String;
    function LookupLancamentosDiarios(const iAnoCompetencia, iMesCompetencia: integer; const sFlgDiario: string; const iIdTipoCustoRecImo: integer = -1; const iImovelMestre: integer = -1; const iImovel: integer = -1): OleVariant;
    function LookupUltimaCobranca    (const iIdContrato: Integer): OLEVariant;
    function LookupDocAberto         (const dLimite: TDateTime; const sTipo: String = ''; const iCodDocumento: Integer = -1) : OLEVariant;
    function LookupDocAbertoSegmento (const dLimite: TDateTime) : OLEVariant;
    function LookupInfoDoc(iCodDOcumento : Integer; dLimite: TDateTime ) : OLEVariant;

    // Daniel - 22815
    function LookupAlteraAP(const iCodDocumento:Integer=-1): OLEVariant;
    function GravaAlteracaoAP(const iCodDocumento:Integer;    const iCodForma:Integer=-1;  const dVencimento:TDateTime=-1;
                              const dProgramada:TDateTime=-1; const sReferencia:String=''; const sObs:String='';
                              const bTransacao:Boolean=True): Boolean;

    // Daniel - 24872 [ acrescentei o parâmetro "iIdPortadorForma" ] / 22993 [ acrescentei o parâmetro "Obs" ]
    function Inserir                 (const iMesComp, iAnoComp, iIdFornecedor, iIdTipoCustoRecImo, iIdFormaRecPag, iIdPortadorForma, iIdCompromisso, iIdContaBancaria, iIdMoedaCorrente, iIdDocumento, iNumAP :Integer;
                                      const fNoDocumento, fValorTotal, fValorTotalOM: Extended; const sOrigemLanc, sRecPag, sRefAP, sObservacao, sCentroCusto,sHistorico: String;
                                      const dVencimento, dLancamento, dIniCtbDiaria, dFimCtbDiaria: TDateTime; const vImoveis, vAlteradores: OLEVariant; const bIntegra:Boolean;
                                      const bTransacao: Boolean = True; const dDataEmissao : TDateTime = 0;
                                      const bTemContrato : boolean = false;
                                      iIdVoto : Integer = 0; sFlgVoto : string = ''; const sNfsNumero : string = ''; const sNfsSerie: string = '';
                                      const dNfsDataEmissao: TDateTime = 0; const sNfsObs: string = ''; const iIdServico: Integer = 0;
                                      const sFlgSimples: string = ''): Boolean; // Edilaine - SOL 1077772-5681 / KTN 1358973

    function Excluir                 (const iDocumento: Integer; const bTransacao: Boolean = True; const idPlanilha : Integer = -1; const bApenasDesfazIntegracao : Boolean = False): Boolean;
    function Integrar                (const iDocumento: Integer; const bTransacao: Boolean = True;
                                      const bTemContrato : boolean = false): Boolean;  // Edilaine - SOL 1077772-5681 / KTN 1358973
    function DespesaLocatario        (const iDocumento: Integer; var iCodErro:Integer): Boolean;
    function ObrigaLiberacao         (const iDocumento: Integer; var iCodErro:Integer): Boolean;

    function VerificaSegregacaoOrigem(iIdImovel: integer): Integer;

    function LookupParamContabImob(const iDocumento: Integer; const bParaIntegrar: Boolean = False): OLEVariant;
    // Helen - SOL: 127213 KTN: 672023
    function VerificaCondPagParc(iIdImovel : Integer) : Integer;
    function VerificaMov(iIdBem: Integer)  : TDateTime;
    function UltimaMov(iIdBem: Integer)    : TDateTime;
    function DelAquisParc(iIdImovel: Integer): Boolean;
    function LookupAquiParcelada( const iIdResponsavel:Integer = -1; const bRespNulo:Boolean = True;
             const sVigencia:String = ''): OleVariant;
    //Baruc
    // SOL 180032   KTN 1674608 - INICIO
    function PrepareRatLanImovel(iNoDocumentoF : Real; idImovelF : Integer; dLancamentoF : TDateTime  ) : boolean;
    function InsRatLanImovel(iDLancImovel, iDImovel, dPatro, iDPlanoprev : Integer; Valor : Double) : boolean;
    function TBRound(Value: Extended; Decimals: integer): Extended;
    function TBTrunc(Value: Extended; Decimals: integer): Extended;
    // SOL 180032   KTN 1674608 - FIM
    function ListaVoto(idPessoa: integer): OleVariant; // Michelle Mota - SIG26054
    function ListaVotoGrupo(idImovel, idVoto: integer): OleVariant; // Michelle Mota - SIG26054
    function ListaSaldoVoto(idVoto: integer): OleVariant; // Michelle Mota - SIG26054
    //Cássio Rovaroto -  SIG nº 23656.59199 - Início
    function ListTipoServico: OleVariant;
    function ListProcessos(pIdForCli: integer; pDataLancamento: TDateTime): OleVariant;
    function ListaDadosCPRBFornecedor(pIdForCli: integer): OleVariant;
    function VerificaTipoDespesaMaoDeObra(iTipoCustoRecImo: integer): boolean;
    //Cássio Rovaroto -  SIG nº 23656.59199 - Fim
  published
end;

implementation

uses Dialogs, uCMFileUtils;
{ TCtrlLancamentosImovel }

constructor TCtrlLancamentosImovel.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  // Cria uma instância dos CtrlObjects Externos
  ComunsImobiliarioDB   := TComunsImobiliarioDB.Create(iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro);
  DiasUteis             := TDiasUteis.Create;
  CtrlContabil          := TCtrlLancamento.Create;
  CtrlMsgBoleto         := TCtrlMsgBoleto.Create;
  //CtrlDocumento         := TCtrlDocumento.Create;
  CtrlOrcamento         := TOrcamentoBackMT.Create;
  CtrlPadrLancImovel    := TCtrlPadrLancIMovel.Create(iIdEmpresa, iIdModulo);
  CtrlParamIntegra      := TCtrlParamIntegra.Create;
  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;
  //SOL Nº 92381
  CtrlImobLancamento    := TCtrlImobLancamento.Create;
  CtrlConcilia          := TCtrlConcilia.Create(iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso,bUsaPlanoPatro);
  // Daniel - 26104
  CtrlParamMulta        := TCtrlParamMulta.Create(iIdEmpresa,iIdModulo,iIdUsuario,iIdEspAcesso,bUsaPlanoPatro);

  CtrlImobDocumento     := TCtrlImobDocumento.Create;
  // Helen - SOL: 127213 KTN: 672023
  // Inicializa os CtrlObjects dos objetos a serem utilizados
   CtrlBem    := TCtrlBem.Create;
   CtrlDomBem := TCtrlDomBem.Create;
   CtrlMovAcrescimoValor := TCtrlMovAcrescimoValor.Create;
   CtrlBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                      Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   CtrlDomBem.InitializeAs( CtrlBem );
   CtrlMovAcrescimoValor.InitializeAs( CtrlBem );
   CafxContab            := TCtrlCafxContab.Create;
   // Helen - SOL: 127213 KTN: 672023 - FIM

  // Cria os DbOjbects
  FDbLancamentosImovel  := TDBLancamentosImovel.Create( Self );
  FDbObsLancImovel      := TDBObsLancImovel.Create( Self );
  FDbAlteraLancImovel   := TDbAlteraLancImovel.Create( Self );

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa      := iIdEmpresa;
  ParamSistema.idModulo       := iIdModulo;
  ParamSistema.idUsuario      := iIdUsuario;
  ParamSistema.IdEspAcesso    := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro  := bUsaPlanoPatro;

  // inicializa a variável para registro de liberação de responsabilidade
  CodigoErroLiberacao := 0;
  pisMultiplaDespesa  := False;//Marcio Sanches Spinosa SOL 222296 KINTANA 2055368
end;


procedure TCtrlLancamentosImovel.AfterInitialize;
begin
  inherited;
  // Inicializa os CtrlObjects Externos
  DiasUteis.InitializeAs( Self );
  CtrlMsgBoleto.InitializeAs( Self );
  ComunsImobiliarioDB.InitializeAs( Self );
  CtrlOrcamento.InitializeAs( Self );
  CtrlPadrLancImovel.InitializeAs( Self );
  CtrlParamIntegra.InitializeAs( Self );
  CtrlModuloImobiliario.InitializeAs( Self );

  CtrlConcilia.InitializeAs( Self );
  // Helen - SOL: 127213 KTN: 672023
  CafxContab.InitializeAs(Self);

  // Inicializa a CtrlContabil sem o onMessageInfo ( exibe mensagens indesejáveis que não são erros )
  CtrlContabil.Initialize(Self.DataBase,Self.OpenTransaction,Self.DbConnectionType,
                          Self.ConnectionSide);
  //SOL Nº 92381
  CtrlImobLancamento.Initialize(Self.Database, Self.OpenTransaction, Self.DbConnectionType,
                                 Self.ConnectionSide);
  //CtrlDocumento.InitializeAs( CtrlContabil );

  CtrlImobDocumento.InitializeAs(CtrlImobLancamento);

  CtrlParamMulta.InitializeAs( Self );

  // Inibe o popup da messageinfo nos ctrls internos
  CtrlMsgBoleto.OnMessageInfo         := nil;
  CtrlOrcamento.OnMessageInfo         := nil;
  CtrlPadrLancImovel.OnMessageInfo    := nil;
  CtrlParamIntegra.OnMessageInfo      := nil;
  CtrlModuloImobiliario.OnMessageInfo := nil;

  CtrlConcilia.OnMessageInfo          := nil;

  CtrlParamMulta.OnMessageInfo        := nil;

  // define o DataBase a ser utilizado
  FDbLancamentosImovel.DataBaseName := DataBaseName;
  FDbObsLancImovel.DataBaseName     := DataBaseName;
  FDbAlteraLancImovel.DataBaseName  := DataBaseName;

  // Busca parämetros globais
  CtrlParamIntegra.GetParams(ParamSistema.idEmpresa,0,'','', tiSistema);
  CtrlModuloImobiliario.Adminimob.GetParam(ParamSistema.idEmpresa);
  CtrlModuloImobiliario.InvestImob.GetParam(ParamSistema.idEmpresa);
  CtrlModuloImobiliario.Global.GetParam(ParamSistema.idEmpresa);
end;

procedure TCtrlLancamentosImovel.onCreateAppServer;
begin
  inherited;

end;

destructor TCtrlLancamentosImovel.Destroy;
begin
  // Destrói os DbObjects criados
  FreeAndNil( FDbLancamentosImovel );
  FreeAndNil( FDbObsLancImovel );
  FreeAndNil( FDbAlteraLancImovel );

  // Destroi os CtrlObjects Externos
  FreeAndNil( ComunsImobiliarioDB );
  FreeAndNil( DiasUteis );
  FreeAndNil( CtrlContabil );
  FreeAndNil( CtrlMsgBoleto );
  //FreeAndNil( CtrlDocumento );
  FreeAndNil( CtrlOrcamento );
  FreeAndNil( CtrlPadrLancImovel );
  FreeAndNil( CtrlParamIntegra );
  FreeAndNil( CtrlModuloImobiliario );
  //SOL Nº 92381
  FreeAndNil(CtrlImobLancamento);

  FreeAndNil( CtrlConcilia );

  FreeAndNil( CtrlParamMulta ); // Daniel - 26104

  FreeAndNil(CtrlImobDocumento);
  // Helen - SOL: 127213 KTN: 672023
  FreeAndNil( CtrlBem );
  FreeAndNil( CtrlDomBem );
  FreeAndNil( CtrlMovAcrescimoValor );
  FreeAndNil(CafxContab );
  // Helen - SOL: 127213 KTN: 672023 - FIM

  inherited;
end;


//========================================================================================
// Função INTERNA para conciliar valores pagos no vencimento
// Data : 27/10/2002                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iAnoCompetência    - Ano de Competência
//       iMesCompetência    - Mês de Competência                              ( -1 )
//       sFlgDiario         - Tipo de Contabilização ( 'M'ensal / 'A'nual )                            ( -1 )
//       iIdTipoCustoRecImo - Tipo de Receita / Despesa                       ( -1 )
//       iImovelMestre      - ID do imóvel mestre                             ( -1 )
//       iImovel            - ID do imóvel                                    ( -1 )
//
// Retorno : OLEVariant - Conjunto de Informações
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.LookupLancamentosDiarios(const iAnoCompetencia, iMesCompetencia: integer;
                                                         const sFlgDiario: string; const iIdTipoCustoRecImo, iImovelMestre, iImovel: integer): OleVariant;
var sSql, sFiltro, sAnoMesCompetencia: string;
begin
  sFiltro := '';

  if sFlgDiario = 'M' then begin

    sFiltro := sFiltro + '   AND ( TO_NUMBER(TO_CHAR(L.DATALANCAMENTO,''YYYY''))  = ' + IntToStr (iAnoCompetencia) + ' ) ' + #13;
    if iMesCompetencia <> -1 then sFiltro := sFiltro + '   AND ( TO_NUMBER(TO_CHAR(L.DATALANCAMENTO,''MM'')) = ' + IntToStr (iMesCompetencia) + ' ) ' + #13;

  end;

  // Para Despesas Anuais, filtra apenas os lançamentos do mesmo período de Contabilização, com
  // competência igual ou inferior ao mes de lançamento
  if sFlgDiario = 'A' then begin
    sAnoMesCompetencia := FormatFloat('0000', StrToFloat(IntToStr(iAnoCompetencia))) +
                          FormatFloat('00'   , StrToFloat(IntToStr(iMesCompetencia)));

    sFiltro := sFiltro + '   AND ( (TO_CHAR(L.DTINICTBDIARIA,''YYYY'') = ' + IntToStr(iAnoCompetencia) + ' OR ' + #13 +
                         '          TO_CHAR(L.DTFIMCTBDIARIA,''YYYY'') = ' + IntToStr(iAnoCompetencia) + ' ) AND ' + #13 +
                         '         TO_NUMBER(TO_CHAR(TO_CHAR(L.DATALANCAMENTO,''YYYY''),''0999'') || TRIM(TO_CHAR(TO_CHAR(L.DATALANCAMENTO,''MM''),''09''))) <= '    + sAnoMesCompetencia + ' ) ' + #13;
  end;

  if iIdTipoCustoRecImo <> -1 then sFiltro := sFiltro + '   AND ( L.IDTIPOCUSTORECIMO = ' + IntToStr (iIdTipoCustoRecImo) + ' ) ' + #13;
  if iImovel            <> -1 then sFiltro := sFiltro + '   AND ( L.IDIMOVEL = ' + IntToStr (iImovel) + ' ) ' + #13;
  if iImovelMestre      <> -1 then sFiltro := sFiltro + '   AND ( L.IDIMOVELMESTRE = ' + IntToStr (iImovelMestre) + ' ) ' + #13;

  sSql := 'SELECT ' + #13 +
          '   L.IDIMOVEL, L.IDTIPOCUSTORECIMO, I.CODTIPIMOVEL, ' + #13 +
          '   DECODE(DTINICTBDIARIA, NULL, ' + #13 +
          '          DECODE(T.FLGDIARIO, ''M'', ' + #13 +
          '                 TO_DATE(''01/''   || TO_CHAR(TO_CHAR(DATALANCAMENTO,''MM''),''09'') || ''/'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999'')), ' + #13 +
          '                 TO_DATE(''01/01'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999'')) ), ' + #13 +
          '          DTINICTBDIARIA ) AS DTINICTBDIARIA, ' + #13 +
          '   DECODE(DTFIMCTBDIARIA, NULL, ' + #13 +
          '          DECODE(T.FLGDIARIO, ''M'', ' + #13 +
          '                 LAST_DAY(TO_DATE(''01/'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''MM''),''09'') || ''/'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999''))), ' + #13 +
          '                 TO_DATE(''31/12'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999'')) ), ' + #13 +
          '          DTFIMCTBDIARIA ) AS DTFIMCTBDIARIA, ' + #13 +
          '   SUM(NVL(L.VLRLANCPAGAR,0)+NVL(L.VLRLANCRECEB,0)) AS VLRTOTAL ' + #13 +

          'FROM ' + #13 +
          '   LANCAMENTOSIMOVEL L, IMOVEL I, TIPOCUSTORECIMOV T ' + #13 +
          'WHERE ' + #13 +
          '   ( L.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
          '   AND ( L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' + #13 +
          '   AND ( T.FLGDIARIO = '+ QuotedStr( sFlgDiario ) + ' ) ' + #13 +
          '   AND ( T.IDMODULO = ' + IntToStr ( ParamSistema.idModulo ) + ' ) ' + #13 +
          sFiltro +
          'GROUP BY ' + #13 +
          '   L.IDIMOVEL, L.IDTIPOCUSTORECIMO, I.CODTIPIMOVEL, ' + #13 +
          '   DECODE(DTINICTBDIARIA, NULL, ' + #13 +
          '          DECODE(T.FLGDIARIO, ''M'', ' + #13 +
          '                 TO_DATE(''01/''   || TO_CHAR(TO_CHAR(DATALANCAMENTO,''MM''),''09'') || ''/'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999'')), ' + #13 +
          '                 TO_DATE(''01/01'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999'')) ), ' + #13 +
          '          DTINICTBDIARIA ), ' + #13 +
          '   DECODE(DTFIMCTBDIARIA, NULL, ' + #13 +
          '          DECODE(T.FLGDIARIO, ''M'', ' + #13 +
          '                 LAST_DAY(TO_DATE(''01/'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''MM''),''09'') || ''/'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999''))), ' + #13 +
          '                 TO_DATE(''31/12'' || TO_CHAR(TO_CHAR(DATALANCAMENTO,''YYYY''),''0999'')) ), ' + #13 +
          '          DTFIMCTBDIARIA ) ';


  Result := GetDataPacket ( sSql );
end;


function TCtrlLancamentosImovel.LookupUltimaCobranca(const iIdContrato: Integer): OLEVariant;
var sSql: String;
begin
   sSql := 'SELECT MAX(L.DATAVENCIMENTO) AS ULTIMA '+#13+
           '  FROM LANCAMENTOSIMOVEL L,  '+#13+
           '       CONTRATOIMOVEL C      '+#13+
           ' WHERE C.IDCONTRATOIMOVEL = L.IDCONTRATOIMOVEL   '+#13+
           '   AND C.IDTIPOCUSTORECIMO = L.IDTIPOCUSTORECIMO '+#13+
           '   AND C.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);

   Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Pesquisar os imóveis de um documento
// Data : 29/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - id do Documento
//
// Retorno : OLEVariant - Conjunto de Dados
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.LookupImoveisDocum(const iDocumento: Integer; const bParaIntegrar: Boolean): OLEVariant;
var sSql, sParam : String;
begin
  sParam := ' AND L.IDDOCUMENTO = ' + IntToStr(iDocumento);
  if bParaIntegrar then
    //SOL Nº 91020
    //sParam := sParam + ' AND L.FLGINTEGRADO = 0 ';
    sParam := sParam + ' AND (L.FLGINTEGRADO = 0 OR L.FLGINTEGRADO IS NULL) ';
  sSql := 'SELECT L.*, ' +#13+
          '       DECODE(L.RECPAG, ''P'', L.VLRLANCPAGAR, L.VLRLANCRECEB) AS VLRIMOVEL, '+#13+
          '       T.DESCCUSTORECIMO,   '+#13+
          '       T.CODTIPDOC,         '+#13+
          '       T.IDOPERCONTAB,      '+#13+
          '       I.IMOCODIGO,         '+#13+
          // Marchetti - pendencia 26271 e 26276
          '       L.NOSSONUMERO,       '+#13+
          // Fim Marchetti - pendencia 26271 e 26276

          // Daniel - 24085 - Início -----------------------------------------------------
          //Cássio -  SOL 111114 KINTANA 512106 - Início
          '       SUBSTR(DECODE(I.IDIMOVELPAI,NULL,IM.IMONOME||'' - ''||I.IMONOME, '                           +#13+
          '              DECODE(I.IMONOME,NULL,IM.IMONOME||'' - ''||IP.IMONOME, '                       +#13+
          '                     IM.IMONOME||'' - ''||IP.IMONOME||'' - ''||I.IMONOME) ), 1, 100) AS DSC_IMOVEL, ' +#13+
          //Cássio -  SOL 111114 KINTANA 512106 - Fim
          // Daniel - 24085 - Fim --------------------------------------------------------
          '       ( C.CONNUMERO || '' - '' || C.CONNOME ) AS CONTRATO_EXTENSO,'+#13+
          '       I.IDIMOVELMESTRE,    '+#13+
          '       I.CODSUBCONTA,       '+#13+
          '       I.FLGATIVO,          '+#13+
          '       C.CONNOME,           '+#13+
          '       C.CONNUMERO,         '+#13+
          '       C.CONDIASTOLERANCIA, '+#13+
          '       C.CONDIASREPASSE,    '+#13+
          '       C.FLGTIPODIATOLERA,  '+#13+
          '       C.IDCIDADES,         '+#13+
          '       E.CODESTADO,         '+#13+
          '       E.IDPAIS,            '+#13+
          //'       PP.IDPATRO,          '+#13+
          // '       PP.IDPLANOPREV,      '+#13+
          // Helen - SOL: 127213 KTN: 672023
          '       L.IDCONDPAGAQUISPARC,'+#13+
          '       L.DATAVENCIMENTO,'+#13+
          '       L.IDIMOVEL,'+#13+
          '       L.MESREFERENCIA,'+#13+
          '       L.ANOREFERENCIA,'+#13+
          '       L.MESCOMPETENCIA,'+#13+
          '       L.ANOCOMPETENCIA,'+#13+
          '       L.CODFORMA,'+#13+
          '       L.CODCENTROCUSTO ,'+#13+
          '       L.IDPESSOA ,'+#13+
          '       L.MOEDAPAGAR,'+#13+
          '       L.IDFORCLI,'+#13+
          // Helen - SOL: 127213 KTN: 672023 - FIM
          '       L.IDTIPOCUSTORECIMO,  '+#13+

          //Ricardo SOL: 141052/2322 kintana: 914497
          //Adicionado campo CODTIPIMOVEL_IMOVEL, pois deverá retornar o valor
          //do códido do tipo do imóvel da tabela imóvel para fazer corretamente
          //filtragem de contas contábeis utilizando do tipo de imóvel na PADRLANCIMOVEL
          '   DECODE(I.CODTIPIMOVEL,NULL,L.CODTIPIMOVEL,I.CODTIPIMOVEL) AS CODTIPIMOVEL_IMOVEL ' + #13 +
          //Cássio Rovaroto - SIG nº 23656.59199 - Início
          '       , L.NFSNUMERO, '+#13+
          '       L.NFSSERIE, '#13+
          '       L.NFSDATAEMISSAO, '+#13+
          '       L.NFSOBS, ' +#13+
          '       L.IDTIPOSERVICO, ' +#13+
          '       L.IDPROCESSOSUSP ' +#13+
          '       , L.NFSSERVICO   ' +#13+ //Cássio Rovaroto - SIG nº 123523
          '       , L.FLGSIMPLES   ' +#13+
          //Cássio Rovaroto - SIG nº 23656.59199 - Fim
          '  FROM LANCAMENTOSIMOVEL L, '+#13+
          '       TIPOCUSTORECIMOV T,  '+#13+
          '       IMOVEL I,            '+#13+
          '       IMOVEL IP,           '+#13+ // Daniel - 24085
          '       IMOVEL IM,           '+#13+
          '       CONTRATOIMOVEL C,    '+#13+
          '       CIDADES CI,          '+#13+
          '       ESTADO E             '+#13+
          {'       ( SELECT P.IDIMOVEL, P.IDPATRO, P.IDPLANOPREV '+#13+
          '           FROM PLANOPATROXIMOVEL P,                 '+#13+
          '                ( SELECT IDIMOVEL, COUNT(*) AS QTDE  '+#13+
          '                    FROM PLANOPATROXIMOVEL           '+#13+
          '                   GROUP BY IDIMOVEL ) QP            '+#13+
          '          WHERE P.IDIMOVEL = QP.IDIMOVEL             '+#13+
          '            AND QP.QTDE = 1 ) PP                     '+#13+ }
          ' WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO     '+#13+
          '   AND I.IDIMOVELMESTRE    = IM.IDIMOVEL             '+#13+
          '   AND I.IDIMOVELPAI       = IP.IDIMOVEL(+)          '+#13+ // Daniel - 24085
          '   AND L.IDIMOVEL          = I.IDIMOVEL(+)           '+#13+
          '   AND L.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+)   '+#13+
          '   AND C.IDCIDADES         = CI.IDCIDADES(+)         '+#13+
          '   AND CI.IDESTADO         = E.IDESTADO(+)           '+#13+
          //'   AND L.IDIMOVEL          = PP.IDIMOVEL(+)          '+#13+
          '   AND L.IDPESSOA          = ' + IntToStr(ParamSistema.idEmpresa) +#13+ sParam;
  {sSql := 'SELECT L.*, ' +#13+
          '       DECODE(L.RECPAG, ''P'', L.VLRLANCPAGAR, L.VLRLANCRECEB) AS VLRIMOVEL, '+#13+
          '       T.DESCCUSTORECIMO,   '+#13+
          '       T.CODTIPDOC,         '+#13+
          '       T.IDOPERCONTAB,      '+#13+
          '       I.IMOCODIGO,         '+#13+
          // Marchetti - pendencia 26271 e 26276
          '       L.NOSSONUMERO,       '+#13+
          // Fim Marchetti - pendencia 26271 e 26276

          // Daniel - 24085 - Início -----------------------------------------------------
          '       SUBSTR(DECODE(I.IDIMOVELPAI,NULL,IM.IMONOME||'' - ''||I.IMONOME, '                           +#13+
          '              DECODE(I.IMONOME,NULL,IM.IMONOME||'' - ''||IP.IMONOME, '                              +#13+
          '                     IM.IMONOME||'' - ''||IP.IMONOME||'' - ''||I.IMONOME)), 1, 100) AS DSC_IMOVEL, ' +#13+
          // Daniel - 24085 - Fim --------------------------------------------------------
          '       ( C.CONNUMERO || '' - '' || C.CONNOME ) AS CONTRATO_EXTENSO,'+#13+
          '       I.IDIMOVELMESTRE,    '+#13+
          '       I.CODSUBCONTA,       '+#13+
          '       I.FLGATIVO,          '+#13+
          '       C.CONNOME,           '+#13+
          '       C.CONNUMERO,         '+#13+
          '       C.CONDIASTOLERANCIA, '+#13+
          '       C.CONDIASREPASSE,    '+#13+
          '       C.FLGTIPODIATOLERA,  '+#13+
          '       C.IDCIDADES,         '+#13+
          '       E.CODESTADO,         '+#13+
          '       E.IDPAIS,            '+#13+
          '       PP.IDPATRO,          '+#13+
          '       PP.IDPLANOPREV,      '+#13+
          //SOL Nº 92381  KINTANA Nº 394180 - começo
          //Incluido o código do imóvel para ser utilizado posteriormente,
          //para fazer o lançamento contábil
          '       I.IDIMOVEL,          '+#13+
          //SOL Nº 92381  KINTANA Nº 394180 - fim
          //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Início
          //'       L.IDTIPOCUSTORECIMO  '+#13+
          '       L.IDTIPOCUSTORECIMO,  '+#13+
          '       TRIM(TO_CHAR(ROUND(((DECODE(L.RECPAG, ''P'', L.VLRLANCPAGAR, L.VLRLANCRECEB) * PP.PPIPERCENTRATEIO)/100),2),''9999999999D99'')) AS VALORPLANO ' +#13+
          //Cássio - SOL Nº 124540 KINTANA Nº 633512 - Fim
          '  FROM LANCAMENTOSIMOVEL L, '+#13+
          '       TIPOCUSTORECIMOV T,  '+#13+
          '       IMOVEL I,            '+#13+
          '       IMOVEL IP,           '+#13+ // Daniel - 24085
          '       IMOVEL IM,           '+#13+
          '       CONTRATOIMOVEL C,    '+#13+
          '       CIDADES CI,          '+#13+
          '       ESTADO E,            '+#13+
          '       ( SELECT P.IDIMOVEL, P.IDPATRO, P.IDPLANOPREV, P.PPIPERCENTRATEIO '+#13+
          '           FROM PLANOPATROXIMOVEL P,                 '+#13+
          '                ( SELECT IDIMOVEL, COUNT(*) AS QTDE  '+#13+
          '                    FROM PLANOPATROXIMOVEL           '+#13+
          '                   GROUP BY IDIMOVEL ) QP            '+#13+
          //Cássio - SOL Nº 124540 KINTANA Nº 633512
          //'          WHERE P.IDIMOVEL = QP.IDIMOVEL             '+#13+
          //'            AND QP.QTDE = 1 ) PP                     '+#13+
          '          WHERE P.IDIMOVEL = QP.IDIMOVEL) PP         '+#13+
          ' WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO     '+#13+
          '   AND I.IDIMOVELMESTRE    = IM.IDIMOVEL             '+#13+
          '   AND I.IDIMOVELPAI       = IP.IDIMOVEL(+)          '+#13+ // Daniel - 24085
          '   AND L.IDIMOVEL          = I.IDIMOVEL(+)           '+#13+
          '   AND L.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+)   '+#13+
          '   AND C.IDCIDADES         = CI.IDCIDADES(+)         '+#13+
          '   AND CI.IDESTADO         = E.IDESTADO(+)           '+#13+
          '   AND L.IDIMOVEL          = PP.IDIMOVEL(+)          '+#13+
          '   AND L.IDPESSOA          = ' + IntToStr(ParamSistema.idEmpresa) +#13+ sParam +
          ' ORDER BY PP.PPIPERCENTRATEIO '; }

  Result := GetDataPacket( sSql );
end;



//========================================================================================
// Função INTERNA para Pesquisar os documentos não baixados em atraso, para atualização
//     dos valores de Multa, Juros e Correção por atraso
// Data : 03/09/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : dLimite  - Data limite para o vencimento do documento
//              sTipo    - 'T' Aberto total sem nenhuma baixa
//                         'P' Aberto com baixas parciais
//                         ''  Todos documentos em aberto
//
// Retorno : OLEVariant - Conjunto de Dados
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.LookupDocAberto(const dLimite: TDateTime; const sTipo: String;  const iCodDocumento: Integer): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;
  // Define Parâmetros
  sParam := ' AND V.IDMODULO = ' + IntToStr( ParamSistema.IdModulo ) +#13+
            ' AND V.DATAVENCIMENTO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') '+#13;


// Adicionado por Daniel Simões em 12/04/2006 - Início -------------------------
// Define tipo de documento em aberto
  case sTipo[1] of
     'T' : begin  // aberto sem nenhuma baixa
  //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
  //RICARDO / CASSIO / MADUREIRA - 12/12/2011
              sParam := sParam + ' AND NOT EXISTS ( SELECT LD1.CODDOCUMENTO ' +#13+
                                 '                    FROM LANCTODOCUM LD1 ' +#13+
                                 '                   WHERE ( RTRIM(LD1.OPERACAO) = ''5'' OR ' +#13+
                                 '                         ( RTRIM(LD1.OPERACAO) = ''4'' AND LD1.DEBCRE = ''C'') ) ' +#13+
                                 '                      AND LD1.ESTORNO IS NULL ' +#13+
                                 '                      AND LD1.DATALANCTO  <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
                                 '                      AND LD1.CODDOCUMENTO = V.CODDOCUMENTO ) ' +#13;

           end;
     'P' : begin  // aberto com baixas parciais
  //Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
  //RICARDO / CASSIO / MADUREIRA - 12/12/2011
              sParam := sParam + ' AND EXISTS ( SELECT L1.CODDOCUMENTO ' +#13+
                                 '                FROM LANCTODOCUM L1  ' +#13+
                                 '               WHERE L1.ESTORNO IS NULL ' +#13+
                                 '                 AND ( RTRIM(L1.OPERACAO) = ''5'' OR       ' +#13+
                                 '                     ( RTRIM(L1.OPERACAO)  = ''4'' AND L1.DEBCRE = ''C'') ) ' +#13+
                                 '                 AND L1.DATALANCTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
                                 '                 AND L1.CODDOCUMENTO = V.CODDOCUMENTO )      ' +#13+
                                 ' AND( ( (SELECT SUM(DECODE(LD2.DEBCRE,''D'', LD2.VALOR, (LD2.VALOR * -1))) AS SALDO ' +#13+
                                 '           FROM LANCTODOCUM LD2' +#13+
                                 '          WHERE LD2.DATALANCTO  <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
                                 // Thiago Melo SOL 224203 Kintana 2057742
                                 '            AND LD2.CODDOCUMENTO = V.CODDOCUMENTO ) > 0)) ' + #13;
                                 {'            AND LD2.CODDOCUMENTO = V.CODDOCUMENTO ) > 0) OR ' +#13+
                                 '                ( V.DATALIMITE < ( SELECT MIN(R1.DATABAIXA) ' +#13+
                                 '                                     FROM RECBTOPAGTO R1    ' +#13+
                                 '                                    WHERE R1.DATABAIXA IS NOT NULL ' +#13+
                                 '                                      AND R1.CODDOCUMENTO = V.CODDOCUMENTO ) )  ) ' +#13;}
                                 // Thiago Melo SOL 224203 Kintana 2057742


           end;
     else  begin  // todos em aberto
              sParam := sParam + ' AND V.STATUS_DOC <> 2 ' +#13;
           end;
  end;
// Adicionado por Daniel Simões em 12/04/2006 - Fim ----------------------------

  if iCodDocumento > 0 then sParam := sParam + ' AND V.CODDOCUMENTO = ' + IntToStr(iCodDocumento) +#13;

  // Define Sql
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
//  sSql := 'SELECT VW.*,    '+#13+
  sSql := 'SELECT    VW.CODDOCUMENTO,     VW.DATAVENCIMENTO,                         '+#13+
          '          VW.TOT_RECEBER,      VW.TOT_RECEBIDO,      VW.FLGNAOCONCILIADO, '+#13+
          '          VW.IDCONTRATOIMOVEL, VW.IDCIDADES,         VW.IDPAIS,           '+#13+
          '          VW.CODESTADO,        VW.CONDIASTOLERANCIA, VW.FLGTIPODIATOLERA, '+#13+
          '          VW.RS_FORCLI,        VW.IDFORCLI,          VW.DATALIMITE,       '+#13+
          '          VW.CONTRATO_EXTENSO, VW.MESCOMPETENCIA,    VW.ANOCOMPETENCIA,   '+#13+
          '          VW.VLRJUROS,         VW.VLRMULTA,          VW.VLRCORRECAOMON,   '+#13+
          '          VW.IDINDCORRECAO,    VW.CONMOEDAMULTA,     VW.CONPERCENTMULTA,  '+#13+
          '          VW.CONVLRMULTA,      VW.CONPERMORA,        VW.FLGMORAPROPORC,   '+#13+
          '          VW.CONPERCENTMORA,   VW.CONVLRMORA,        VW.CONMOEDAMORA,     '+#13+
          '          VW.CODTIPIMOVEL,     VW.CONMESREFREAJUSTE, VW.STATUS_DOC,       '+#13+
          '          VW.CONDIASREPASSE,   VW.FLGLANCINTEGRA,    VW.IDTIPOCUSTORECIMO,'+#13+
          '       SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1))  AS TOT_ALTERADOR,  '+#13+
          '       ( VW.TOT_RECEBER + SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1)))  AS VC,  '+#13+
          '       ( VW.TOT_RECEBER + SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1)) - VW.TOT_RECEBIDO)  AS DIFERENCA  '+#13+

//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
          '      ,( select max(LDI.DATAOPER) from LANCOPERDIAIMOB LDI '+#13+
          '          where LDI.CODDOCUMENTO = VW.CODDOCUMENTO         '+#13+
          '            and LDI.DATAOPER > VW.DATAVENCIMENTO           '+#13+
          '            and LDI.FLGTIPO = ''S'' ) as DATA_SIMULACAO    '+#13+
          // Fim - Alterado por FHBS - SOL: 136336 KTN: 815081

          '  FROM ( SELECT DISTINCT    '+#13+
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016                                                                 '+#13+
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
          '                V.CODDOCUMENTO,        V.DATAVENCIMENTO,      V.DATA_BAIXA,        '+#13+
          '                V.TOT_RECEBER,         V.TOT_RECEBIDO,        V.FLGNAOCONCILIADO,  '+#13+
          '                V.IDCONTRATOIMOVEL,    V.IDCIDADES,           V.IDPAIS,            '+#13+
          '                V.CODESTADO,           V.CONDIASTOLERANCIA,   V.FLGTIPODIATOLERA,  '+#13+
          '                V.RS_FORCLI,           V.IDFORCLI,            V.DATALIMITE,        '+#13+
          '                V.CONTRATO_EXTENSO,    V.MESCOMPETENCIA,      V.ANOCOMPETENCIA,    '+#13+
          '                V.VLRJUROS,            V.VLRMULTA,            V.VLRCORRECAOMON,    '+#13+
          '                V.IDINDCORRECAO,       V.CONMOEDAMULTA,       V.CONPERCENTMULTA,   '+#13+
          '                V.CONVLRMULTA,         V.CONPERMORA,          V.FLGMORAPROPORC,    '+#13+
          '                V.CONPERCENTMORA,      V.CONVLRMORA,          V.CONMOEDAMORA,      '+#13+
          '                V.CONDIASREPASSE,      V.CONMESREFREAJUSTE,   V.STATUS_DOC,        '+#13+
          '                V.IDTIPOCUSTORECIMO,   -1 AS FLGLANCINTEGRA,                       '+#13+
          '                DECODE(L.CODTIPIMOVEL, NULL, V.CODTIPIMOVEL,                       '+#13+
          '                                             L.CODTIPIMOVEL ) AS CODTIPIMOVEL      '+#13+
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
//          '           FROM VWLANCAMENTO V, LANCAMENTOSIMOVEL L, EMPRESAPROP E '+#13+
          '           FROM VWLANCAMENTO V, LANCAMENTOSIMOVEL L  '+#13+
          '          WHERE V.IDLANCIMOVEL = L.IDLANCIMOVEL      '+#13+
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
//          '            AND L.IDPESSOA     = E.IDPESSOA          '+#13+
          '            AND L.IDPESSOA         = 1               '+#13+
          '            AND V.FLGNAOCONCILIADO = 1               '+#13+
          '            AND V.RECPAG = ''R''                     '+#13+
          '            AND V.IDCONTRATOIMOVEL IS NOT NULL       '+#13+
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
//          '            AND ( E.TIPOCLIENTE = 19981 OR NVL(V.FLGIMPORTADO,0) = 0 ) '+#13+
          '            AND NVL(V.FLGIMPORTADO,0) = 0  '+#13+
          '            AND NVL(V.FLGESTORNADO,0) = 0  '+#13+ sParam +
          '       ) VW,  '+#13+
          '       (      '+#13+
          '         SELECT DISTINCT LD.CODDOCUMENTO, LD.DEBCRE, LD.VALOR, LD.NUMLANCTO '+#13+
          '           FROM LANCTODOCUM LD, LANCAMENTOSIMOVEL L, TIPOIMOVEL T           '+#13+
          '          WHERE LD.CODDOCUMENTO = L.CODDOCUMENTO '+#13+
          '            AND L.CODTIPIMOVEL = T.CODTIPIMOVEL  '+#13+
          '            AND RTRIM(LD.OPERACAO) = ''4''       '+#13+
          '            AND LD.DATALANCTO  < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') ' +#13+
          '            AND LD.ESTORNO IS NULL               '+#13+
          '            AND NVL(LD.CODALTERADOR,0) <> T.CODALTMULTA   '+#13+
          '            AND NVL(LD.CODALTERADOR,0) <> T.CODALTJUROS   '+#13+
          '            AND NVL(LD.CODALTERADOR,0) <> T.CODALTCORRMON '+#13+
          '         ) LD '+#13+
          ' WHERE VW.CODDOCUMENTO = LD.CODDOCUMENTO(+) '+#13+
//Ricardo Cristiano - 10/01/2012 - N. Sol 69496/7501 -  N. Kintana 1539016
//RICARDO / CASSIO / MADUREIRA - 12/12/2011
//          ' GROUP BY VW.CODDOCUMENTO,     VW.DATAVENCIMENTO,    VW.DATA_BAIXA,       '+#13+
          ' GROUP BY VW.CODDOCUMENTO,     VW.DATAVENCIMENTO,                         '+#13+
          '          VW.TOT_RECEBER,      VW.TOT_RECEBIDO,      VW.FLGNAOCONCILIADO, '+#13+
          '          VW.IDCONTRATOIMOVEL, VW.IDCIDADES,         VW.IDPAIS,           '+#13+
          '          VW.CODESTADO,        VW.CONDIASTOLERANCIA, VW.FLGTIPODIATOLERA, '+#13+
          '          VW.RS_FORCLI,        VW.IDFORCLI,          VW.DATALIMITE,       '+#13+
          '          VW.CONTRATO_EXTENSO, VW.MESCOMPETENCIA,    VW.ANOCOMPETENCIA,   '+#13+
          '          VW.VLRJUROS,         VW.VLRMULTA,          VW.VLRCORRECAOMON,   '+#13+
          '          VW.IDINDCORRECAO,    VW.CONMOEDAMULTA,     VW.CONPERCENTMULTA,  '+#13+
          '          VW.CONVLRMULTA,      VW.CONPERMORA,        VW.FLGMORAPROPORC,   '+#13+
          '          VW.CONPERCENTMORA,   VW.CONVLRMORA,        VW.CONMOEDAMORA,     '+#13+
          '          VW.CODTIPIMOVEL,     VW.CONMESREFREAJUSTE, VW.STATUS_DOC,       '+#13+
          '          VW.CONDIASREPASSE,   VW.FLGLANCINTEGRA,    VW.IDTIPOCUSTORECIMO ';
  Result := GetDataPacket( sSql );
end;



//========================================================================================
// Função INTERNA para somar por segmento os valores de Multa, Juros e Correção por atraso
//        dos documentos não baixados no CAR para contabilização.
// Data : 03/09/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : dLimite  - Data limite para o vencimento do documento
//
// Retorno : OLEVariant - Conjunto de Dados
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.LookupDocAbertoSegmento(const dLimite: TDateTime): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;
  // Define Parâmetros
  sParam := ' AND V.IDMODULO = ' + IntToStr( ParamSistema.IdModulo ) +#13+
            ' AND V.DATAVENCIMENTO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) + ',''DD/MM/YYYY'') '+#13;

  // Define Sql
  sSql := 'SELECT V.CODTIPIMOVEL,  '+#13+
          '       SUM(V.VLRJUROS)       AS TOT_VLRJUROS, '+#13+
          '       SUM(V.VLRMULTA)       AS TOT_VLRMULTA, '+#13+
          '       SUM(V.VLRCORRECAOMON) AS TOT_VLRCORR   '+#13+
          '  FROM VWLANCAMENTO V         ' +#13+
          ' WHERE V.FLGNAOCONCILIADO = 1 ' +#13+
          '   AND V.RECPAG = ''R''       ' +#13+
          '   AND V.TOT_RECEBIDO     = 0 ' + sParam +
          ' GROUP BY V.CODTIPIMOVEL ';

  Result := GetDataPacket( sSql );
end;



//========================================================================================
// Função para retornar os alteradores do documento
// Data : 30/12/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : iDocumento    - Id do Documento
//
// Retorno : OLEVariant - Conjunto de Dados
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.LookupAlteradoresDocum(
  const iDocumento: Integer;
  bForcaLanctoDocum: Boolean = False // Alterado por FHBS - 03/04/2019 - SIG83943
  ) : OLEVariant;
var sSql: String;
begin
  sSql := 'SELECT A.IDDOCUMENTO,    A.CODALTERADOR,     A.VLRALTERADOR, '+#13+
          '       A.TRGDTINCLUSAO,  A.TRGUSERINCLUSAO,  T.DESCRICAO,    '+#13+
          '       T.RECPAG,         T.ACRESDECRES,      A.CODTIPIMOVEL, '+#13+
          '       A.OBSERVACAO                                          '+#13+
          '       , NVL(T.FLGLANCANFS, ''N'') AS FLGLANCANFS            '+#13+ //Cássio Rovaroto - SIG nº 89101
          '       , A.IDTIPOSERVICO                                     '+#13+ //Cássio Rovaroto - SIG nº 115585
          '       , A.IDPROCESSO                                        '+#13+ //Cássio Rovaroto - SIG nº 115585
          '       , NVL(A.VALORBASERETENCAO, 0) AS VALORBASERETENCAO    '+#13+ //Cássio Rovaroto - SIG nº 115585
          '       , 0 AS IDENVIODOCUMENTO                               '+#13+ //Cássio Rovaroto - SIG nº 122017
          '       , SYSDATE AS DATALANCTO                               '+#13+
          '  FROM ALTERALANCIMOVEL A, TIPOALTERADOR T                   '+#13+
          ' WHERE A.CODALTERADOR = T.CODALTERADOR                       '+#13+
          ' AND A.IDDOCUMENTO = ' + IntToStr(iDocumento);

  // Alterado por FHBS - 04/04/2019 - SIG83943
  if bForcaLanctoDocum then
  begin
    sSql := 'SELECT LD.CODDOCUMENTO AS IDDOCUMENTO,                     '+#13+
            '       LD.CODALTERADOR,                                    '+#13+
            '       LD.VALOR AS VLRALTERADOR,                           '+#13+
            '       LD.TRGDTINCLUSAO,                                   '+#13+
            '       LD.TRGUSERINCLUSAO,                                 '+#13+
            '       A.DESCRICAO,                                        '+#13+
            '       A.RECPAG,                                           '+#13+
            '       A.ACRESDECRES,                                      '+#13+
            '       LI.CODTIPIMOVEL,                                    '+#13+
            '       LD.HISTORICOCOMPL AS OBSERVACAO                     '+#13+
            //Cássio Rovaroto - SIG nº 90052 - Início
            '       , NVL(A.FLGLANCANFS, ''N'') AS FLGLANCANFS          '+#13+
            //Cássio Rovaroto - SIG nº 90052 - Fim
            '       , LD.IDTIPOSERVICO AS IDTIPOSERVICO                 '+#13+ //Cássio Rovaroto - SIG nº 115585
            '       , LD.IDPROCESSO AS IDPROCESSO                       '+#13+ //Cássio Rovaroto - SIG nº 115585
            '       , NVL(LD.VALORBASERETENCAO, 0) AS VALORBASERETENCAO '+#13+ //Cássio Rovaroto - SIG nº 115585
            '       , NVL(LD.IDENVIODOCUMENTO, 0) AS IDENVIODOCUMENTO   '+#13+  //Ewerton Beltramini - SIG 116142
            '       , LD.DATALANCTO AS DATALANCTO                       '+#13+
            '  FROM LANCTODOCUM LD, TIPOALTERADOR A, DOCUMENTO D,       '+#13+
            '       LANCAMENTOSIMOVEL LI                                '+#13+
            ' WHERE (LD.CODDOCUMENTO = '+IntToStr(iDocumento)+')        '+#13+
            '   AND (RTRIM(LD.OPERACAO) = ''4'')                        '+#13+
            '   AND (LD.CODALTERADOR = A.CODALTERADOR)                  '+#13+
            '   AND (LD.CODDOCUMENTO = D.CODDOCUMENTO)                  '+#13+
            '   AND (LI.CODDOCUMENTO = D.CODDOCUMENTO)                  '+#13+
            ' ORDER BY LD.DATALANCTO, A.DESCRICAO                       ';
  end;
  // Fim - Alterado por FHBS - 04/04/2019 - SIG83943

  Result := GetDataPacket( sSql );
end;



//========================================================================================
// Função para Inserir um Registro de Lançamento
// Data : 28/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iMesComp           - Mês de competência gerencial do lançamento
//       iAnoComp           - Ano de competência gerencial do lançamento
//       iIdFornecedor      - id do Fornecedor / Locatário
//       iIdTipoCustoRecImo - id do Tipo de Despesa / Receita
//       iIdFormaRecPag     - id da Forma de Pagamento / Recebimento
//       iIdPortadorForma   - id do Portador / Forma de Pagamento / Recebimento
//       iIdCompromosso     - id do Nr. do compromisso orçamentário
//       iIdContaBancaria   - id da conta bancária para crédito
//       iIdMoedaCorrente   - id da Moeda corrente do lançamento
//       iIdDocumento       - id do documento para integração ??????
//       iNumAP             - Número da AP
//       fNoDocumento       - Número do Documento
//       fVlrTotal          - Valor total do documento
//       fValorTotalOM      - Valor total do documento em Outra Moeda
//       sOrigemLanc        - Origem do Lançamento
//       sRecPag            - Tipo de Lançamento ( R - Receber, P - Pagar )
//       sRefAP             - Referência para a AP
//       sObservacao        - Observações do Lançamento
//       sCentroCusto       - Código do centro de custos
//       dVencimento        - Data de vencimento
//       dLançamento        - Data do lançamento
//       dIniCtbDiaria      - Data para inicio do rateio da contabilização diária
//       dFimCtbDiaria      - Data para término do rateio da contabilização diária
//       vImoveis           - OLEVariant com os imóveis agregados ao lançamento
//                            (IDIMOVEL, IDCONTRATOIMOVEL, VLRIMOVEL)
//       vAlteradores       - OLEVariant com os alteradores agregados ao lançamento
//                            (IDIMOVEL, IDCONTRATOIMOVEL, VLRIMOVEL)
//       bIntegra           - Integra o lançamento ao término da inclusão
//       bTransacao         - Controla a Transação
//
// Retorno : True  - Incluiu o Documento
//           False - Não Incluiu o Documento
//  Baruc 14/11/2012 09:58:12
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.Inserir(const iMesComp,
																							iAnoComp,
                                              iIdFornecedor,
                                              iIdTipoCustoRecImo,
                                              iIdFormaRecPag,
                                              iIdPortadorForma,
                                              iIdCompromisso,
                                              iIdContaBancaria,
                                              iIdMoedaCorrente,
                                              iIdDocumento,
                                              iNumAP :Integer;
                                      	const fNoDocumento,
                                        			fValorTotal,
                                              fValorTotalOM: Extended;
                                        const sOrigemLanc,
                                        			sRecPag,
                                              sRefAP,
                                              sObservacao,
                                              sCentroCusto,
                                              sHistorico: String;
                                      	const dVencimento,
                                        		 	dLancamento,
                                              dIniCtbDiaria,
                                              dFimCtbDiaria: TDateTime;
                                        const vImoveis,
                                        		 	vAlteradores: OLEVariant;
                                        const bIntegra:Boolean;
                                      	const bTransacao: Boolean = True;
                                        const dDataEmissao : TDateTime = 0;
                                      	const bTemContrato : boolean = false;
                                      	iIdVoto : Integer = 0; sFlgVoto : string = '';
                                        const sNfsNumero : string = '';
                                        const sNfsSerie: string = '';
                                      	const dNfsDataEmissao: TDateTime = 0;
                                        const sNfsObs: string = '';
                                        const iIdServico: Integer = 0;
                                        const sFlgSimples: string = ''): Boolean; // Edilaine - SOL 1077772-5681 / KTN 1358973
var
   cdsTemp : TCMClientDataSet;
   idLancImovel : Real;
begin

  Result := True;
  try
    try
      // Cria cds temporário para os imóveis
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := vImoveis;
      cdsTemp.First;

      if bTransacao then
         StartTransaction;

      // Cria um registro para cada imóvel em LançamentosImovel
      while not cdsTemp.Eof do begin
         if cdsTemp.FieldByName('VLRIMOVEL').AsFloat <> 0 then begin
            DbLancamentosImovel.Clear;
            DbLancamentosImovel.Idpessoa.AsInteger          := ParamSistema.idEmpresa;
            DbLancamentosImovel.Idmodulo.AsInteger          := ParamSistema.idModulo;
            DbLancamentosImovel.Idusuariosistema.AsInteger  := ParamSistema.idUsuario;
            DbLancamentosImovel.Mescompetencia.AsInteger    := iMesComp;
            DbLancamentosImovel.Anocompetencia.AsInteger    := iAnoComp;
            DbLancamentosImovel.Mesreferencia.AsInteger     := DiasUteis.ExtraiMes(dVencimento);
            DbLancamentosImovel.Anoreferencia.AsInteger     := DiasUteis.ExtraiAno(dVencimento);
            DbLancamentosImovel.Idforcli.AsInteger          := iIdFornecedor;
            DbLancamentosImovel.Idtipocustorecimo.AsInteger := iIdTipoCustoRecImo;
            DbLancamentosImovel.Nodocumento.AsFloat         := fNoDocumento;
            DbLancamentosImovel.Iddocumento.AsInteger       := iIdDocumento;
            DbLancamentosImovel.Flgorigemlanc.AsString      := sOrigemLanc;
            DbLancamentosImovel.Recpag.AsString             := sRecPag;
            DbLancamentosImovel.Referenciaap.AsString       := sRefAP;
            DbLancamentosImovel.Codcentrocusto.AsString     := sCentroCusto;
            DbLancamentosImovel.Datavencimento.AsDateTime   := dVencimento;
            DbLancamentosImovel.Datalancamento.AsDateTime   := dLancamento;
            DbLancamentosImovel.Flgintegrado.AsInteger      := 0;
            DbLancamentosImovel.Flgerro.AsInteger           := CodigoErroLiberacao;

            {Início - Michelle Mota - SIG26054}
            if (sFlgVoto <> '') then
              begin
                DbLancamentosImovel.IDVOTOGESTAOIMOVEL.AsInteger := iIdVoto;
                DbLancamentosImovel.FLGVOTO.AsString := sFlgVoto;
              end;
            {Término - Michelle Mota - SIG26054}

            // Daniel - 22993
            DbLancamentosImovel.Obs.AsString                := sHistorico;

            if dDataEmissao > 0 then
               DbLancamentosImovel.Dataemissao.AsDateTime   := dDataEmissao
            else
               DbLancamentosImovel.Dataemissao.AsDateTime   := dLancamento;

            // Informações a Pagar
            if sRecPag = 'P' then begin
               DbLancamentosImovel.Moedapagar.AsInteger := iIdMoedaCorrente;
            end;
            // Informações a Receber
            if sRecPag = 'R' then begin
               DbLancamentosImovel.Moedareceb.AsInteger := iIdMoedaCorrente;
            end;

            if iIdFormaRecPag   > 0 then
               DbLancamentosImovel.Codforma.AsInteger := iIdFormaRecPag;

            // Daniel - 24872
            if iIdPortadorForma > 0 then
               DbLancamentosImovel.Codportforma.AsInteger := iIdPortadorForma;
            // Fim.

            if iIdCompromisso   > 0 then
               DbLancamentosImovel.Idreservaorcamen.AsInteger := iIdCompromisso;
            if iIdContaBancaria > 0 then
               DbLancamentosImovel.Idcbancaria.AsInteger := iIdContaBancaria;
            if dIniCtbDiaria    > 0 then
               DbLancamentosImovel.Dtinictbdiaria.AsDateTime := dIniCtbDiaria;
            if dFimCtbDiaria    > 0 then
               DbLancamentosImovel.Dtfimctbdiaria.AsDateTime := dFimCtbDiaria;
            if iNumAP > 0 then
               DbLancamentosImovel.Numapalt.AsInteger := iNumAP;

            // Informações dos imóveis
            DbLancamentosImovel.Idimovel.AsInteger    := cdsTemp.FieldByName('IDIMOVEL').AsInteger;
            DbLancamentosImovel.Codtipimovel.AsString := cdsTemp.FieldByName('CODTIPIMOVEL').AsString;
            if cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger > 0 then
              DbLancamentosImovel.Idcontratoimovel.AsInteger := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;

            // Informações a Pagar
            if sRecPag = 'P' then begin
               DbLancamentosImovel.Vlrlancpagar.AsFloat   := cdsTemp.FieldByName('VLRIMOVEL').AsFloat;
               DbLancamentosImovel.Vlrlancompagar.AsFloat := cdsTemp.FieldByName('VLRIMOVEL').AsFloat;
               dValorTotalLancamento := cdsTemp.FieldByName('VLRIMOVEL').AsFloat;
            end;
            // Informações a Receber
            if sRecPag = 'R' then begin
               DbLancamentosImovel.Vlrlancreceb.AsFloat   := cdsTemp.FieldByName('VLRIMOVEL').AsFloat;
               DbLancamentosImovel.Vlrlancomreceb.AsFloat := cdsTemp.FieldByName('VLRIMOVEL').AsFloat;
               dValorTotalLancamento := cdsTemp.FieldByName('VLRIMOVEL').AsFloat;
            end;

            //Cássio Rovaroto - SIG nº 23656.59199 - Início
            DbLancamentosImovel.NfsNumero.AsString := sNfsNumero;
            DbLancamentosImovel.NfsSerie.AsString := sNfsSerie;
            DbLancamentosImovel.NfsDataEmissao.AsDateTime := dNfsDataEmissao;
            DbLancamentosImovel.NfsObs.AsString := sNfsObs;
            //Cássio Rovaroto - SIG nº 23656.59199 - Fim

            DbLancamentosImovel.nfsServico.AsInteger := iIdServico; //Cássio Rovaroto - SIG nº 123523
            DbLancamentosImovel.FlgSimples.AsString := sFlgSimples; //Cássio Rovaroto - SIG nº 136888
            // Insere o registro
            if not DbLancamentosImovel.Insert then
              raise exception.Create( DbLancamentosImovel.MessageInfo );
         end else begin
         end;
         //Baruc 14112012

         idLancImovel := DbLancamentosImovel.Idlancimovel.AsFloat;
         PrepareRatLanImovel(idLancImovel, cdsTemp.FieldByName('IDIMOVEL').AsInteger, dLancamento);
         cdsTemp.Next;
      end;

      // Insere o registro de Observação
      if sObservacao <> '' then begin
         DbObsLancImovel.Clear;
         DbObsLancImovel.Iddocumento.AsInteger := iIdDocumento;
         DbObsLancImovel.Obs.AsString          := sObservacao;

         if not DbObsLancImovel.Insert then
            raise exception.Create( DbObsLancImovel.MessageInfo );
      end;

      //Marcio Sanches Spinosa SOL 222296 KINTANA 2055368 - Inicio
      if (pisMultiplaDespesa) then
      begin
        if not Assigned(pCdsAlterador) then
           pCdsAlterador := TClientDataSet.Create(nil);
        pCdsAlterador.data := vAlteradores;
      end;

      IntegraAlteradores(iIdDocumento);
      //Marcio Sanches Spinosa SOL 222296 KINTANA 2055368 - Fim
      // Insere os registros de Alteradores
      //Sadi Freire SOL 219623
                                                                     {
      cdsTemp.Data := vAlteradores;
      if not cdsTemp.IsEmpty then begin
         while not cdsTemp.Eof do begin
            DbAlteraLancImovel.Iddocumento.AsFloat   := cdsTemp.FieldByName('IDDOCUMENTO').AsFloat;
            DbAlteraLancImovel.Codalterador.AsFloat  := cdsTemp.FieldByName('CODALTERADOR').AsFloat;
            DbAlteraLancImovel.Vlralterador.AsFloat  := cdsTemp.FieldByName('VLRALTERADOR').AsFloat;
            DbAlteraLancImovel.CodTipImovel.AsString := cdsTemp.FieldByName('CODTIPIMOVEL').AsString;
            DbAlteraLancImovel.Observacao.AsString   := cdsTemp.FieldByName('OBSERVACAO').AsString;
            if not DbAlteraLancImovel.Insert then
               raise Exception.Create( DbAlteraLancImovel.MessageInfo );

            cdsTemp.Next;
         end;
      end;
                                                                      }
      //end sadi
      // Integra o Lançamento
      if bIntegra then begin
         if not Integrar(iIdDocumento, False, bTemContrato) then    // Edilaine - SOL 1077772-5681 / KTN 1358973
            raise exception.Create( MessageInfo );
      end;

      if bTransacao then Commit;
    except
      on e : Exception do begin
         if bTransacao then Rollback;
         Result := False;
         MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;


//========================================================================================
// SOL 180032   KTN 1674608 - INICIO
// Função para Inserir Registro na RATEIOLANCAMENTOSIMOVEL
// Data : 12/11/2012      Autor: Baruc
//----------------------------------------------------------------------------------------
// Parâmetros :
//       IDLANCIMOVEL       -
//       IDIMOVEL           -
//       IDPATRO            -
//       IDPLANOPREV        -
//       VALOR              - Valor
//
// Retorno : True  - Incluiu o Documento
//           False - Não Incluiu o Documento
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.InsRatLanImovel(iDLancImovel, iDImovel, dPatro, iDPlanoprev : Integer;  Valor : Double) : boolean;
var
  qryAux: Twwquery;
begin
  try
    qryAux := Twwquery.Create(Nil);
    qryAux.DataBaseName := 'BaseDados';
    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' INSERT INTO RATEIOLANCAMENTOSIMOVEL ');
    qryAux.SQL.Add('(');
    qryAux.SQL.Add(' IDRATEIOLANCAMENTOSIMOVEL, IDLANCIMOVEL, IDIMOVEL, IDPATRO, IDPLANOPREV, VALOR ');
    qryAux.SQL.Add(')');
    qryAux.SQL.Add(' VALUES ');
    qryAux.SQL.Add('(');
    qryAux.SQL.Add(' :IDRATEIOLANCAMENTOSIMOVEL, :IDLANCIMOVEL, :IDIMOVEL, :IDPATRO, :IDPLANOPREV, :VALOR ');
    qryAux.SQL.Add(')');

    qryAux.ParamByName('IDRATEIOLANCAMENTOSIMOVEL').AsInteger        := LeUltRegistro(Nil, 'RATEIOLANCAMENTOSIMOVEL');
    qryAux.ParamByName('IDLANCIMOVEL').AsInteger := iDLancImovel;
    qryAux.ParamByName('IDIMOVEL').AsInteger     := iDImovel;
    qryAux.ParamByName('IDPATRO').AsInteger       := dPatro;
    qryAux.ParamByName('IDPLANOPREV').AsInteger  := iDPlanoprev;
    qryAux.ParamByName('VALOR').AsFloat          := Valor;
    qryAux.ExecSQL;
    result := true;
    freeandnil(qryAux);
  Except
    On E: Exception Do
      begin
        result := false;
        freeandnil(qryAux);
      end;
  End;

end;
// SOL 180032   KTN 1674608 - FIM
//========================================================================================
// SOL 180032   KTN 1674608 - INICIO
// Função para Preparar dados para Inserção de Registro na RATEIOLANCAMENTOSIMOVEL
// Data : 12/11/2012      Autor: Baruc
//----------------------------------------------------------------------------------------
// Parâmetros :
//       IDLANCIMOVEL       -
//       IDIMOVEL           -
//       IDPATRO            -
//       IDPLANOPREV        -
//       VALOR              - Valor
//
// Retorno : True  - Incluiu o Documento
//           False - Não Incluiu o Documento
//----------------------------------------------------------------------------------------

function TCtrlLancamentosImovel.PrepareRatLanImovel(iNoDocumentoF : Real; idImovelF : Integer; dLancamentoF : TDateTime  ) : boolean;
var
  idLancImovel, idImovel, idPatro, idPlanoPrev, iMaxPrev : Integer;
  VlrLancPagar, VlrLancReceb, VlrRateio, VlrAcm : Currency ;
  fPercentRateio : Currency ;
  sRecPag : String;
  qryAux: Twwquery;
  iContRec : Integer;

begin
  VlrAcm := 0;
  qryAux := Twwquery.Create(Nil);
  qryAux.DataBaseName := 'BaseDados';
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT ');
  qryAux.SQL.Add('   LI.IDLANCIMOVEL, LI.IDIMOVEL, PP.IDPATRO, PP.IDPLANOPREV,  ');
  qryAux.SQL.Add('   PP.PPIPERCENTRATEIO, LI.VLRLANCPAGAR, LI.VLRLANCRECEB, LI.RECPAG  ');
  qryAux.SQL.Add(' FROM ');
  qryAux.SQL.Add('   PLANOPATROXIMOVEL PP,  LANCAMENTOSIMOVEL LI ');
  qryAux.SQL.Add(' WHERE ');
  qryAux.SQL.Add('   LI.IDIMOVEL     = PP.IDIMOVEL   AND ');
  qryAux.SQL.Add('   LI.IDLANCIMOVEL = :IDLANCIMOVEL AND ');
  qryAux.SQL.Add('   LI.IDIMOVEL     = :IDIMOVEL  ');
  qryAux.SQL.Add(' ORDER BY PP.IDPLANOPREV ');
  qryAux.ParamByName('IDLANCIMOVEL').AsFloat   := iNoDocumentoF;
  qryAux.ParamByName('IDIMOVEL').AsInteger     := idImovelF;
  qryAux.Open;
  iContRec := 1;
  while not qryAux.Eof do
    begin
      VlrRateio := 0;
      idLancImovel   := qryAux.FieldByName('IDLANCIMOVEL').asInteger;
      idImovel       := qryAux.FieldByName('IDIMOVEL').asInteger;
      idPatro        := qryAux.FieldByName('IDPATRO').asInteger;
      idPlanoPrev    := qryAux.FieldByName('IDPLANOPREV').asInteger;
      fPercentRateio := qryAux.FieldByName('PPIPERCENTRATEIO').AsFloat;
      VlrLancPagar   := qryAux.FieldByName('VLRLANCPAGAR').AsCurrency;
      VlrLancReceb   := qryAux.FieldByName('VLRLANCRECEB').AsCurrency;
      sRecPag        := qryAux.FieldByName('RECPAG').asString;

      if iContRec = qryAux.RecordCount then
        begin
          if sRecPag = 'P' then
            begin
              VlrRateio :=  VlrLancPagar - VlrAcm;
            end
          else
            begin
              VlrRateio := VlrLancReceb - VlrAcm;
            end;
        end
      else
        begin
          if sRecPag = 'P' then
            begin
              VlrRateio := VlrLancPagar * (fPercentRateio / 100);
              VlrRateio := TBTrunc(VlrRateio, 2);
              VlrAcm    := VlrAcm + VlrRateio;
            end
          else
            begin
              VlrRateio := VlrLancReceb * (fPercentRateio / 100);
              VlrRateio := TBTrunc(VlrRateio, 2);
              VlrAcm    := VlrAcm + VlrRateio;
            end;
        end;
      InsRatLanImovel(idLancImovel, idImovel, idPatro, idPlanoPrev, VlrRateio);
      iContRec := iContRec + 1;
      qryAux.Next;
    end;
  freeandnil(qryAux);
end;

// SOL 180032   KTN 1674608 - FIM
//========================================================================================
// Função para Excluir o Registro de Lançamento ( inclusive Integrações )
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento     - id do Documento que será excluido
//       bTransacao     - Transação Local ( default = True )
//
// Retorno : True  - Excluiu o Documento
//           False - Não Excluiu o Documento
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.Excluir(const iDocumento: Integer; const bTransacao: Boolean = True; const idPlanilha : Integer = -1; const bApenasDesfazIntegracao : Boolean = False): Boolean;
var sSql    : String;
    cdsTemp, _cdsAux : TCMClientDataSet;
    bIntegradoCAR, bIntegradoCTB : Boolean;
    iPlanilha     : Integer;
    iTipo    : Integer;
    iParcela : Integer;

    // Marchetti - Pendencia 26271 e 26276
    sNossoNumero : String;
begin
  Result := True;
  try
    try

      iTipo    := 0;
      iParcela := -1;

      if ParamSistema.idModulo = 135 then
      begin
         // Busca as informações de integração do documento
         sSql := 'SELECT DISTINCT CODDOCUMENTO, PLNCODIGO, FLGTIPOLANC, IDPARCFINANCIMOV '+#13+
                 '  FROM PARCFINANCIMOV                '+#13+
                 ' WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
      end
      else
      begin
         // Busca as informações de integração do documento
         sSql := 'SELECT DISTINCT CODDOCUMENTO, PLNCODIGO '+#13+
                 '  FROM LANCAMENTOSIMOVEL                '+#13+
                 ' WHERE IDDOCUMENTO = ' + IntToStr(iDocumento);
      end;

      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := GetDataPacket( sSql );
      if cdsTemp.IsEmpty then raise Exception.Create('Documento Não Encontrado');

      if ParamSistema.idModulo = 135 then
      begin
         iTipo    := cdsTemp.FieldByName('FLGTIPOLANC').AsInteger;
         iParcela := cdsTemp.FieldByName('IDPARCFINANCIMOV').AsInteger;
      end;

      // Marca o nível de integração do documento
      bIntegradoCAR := not cdsTemp.FieldByName('CODDOCUMENTO').IsNull;
      bIntegradoCTB := not cdsTemp.FieldByName('PLNCODIGO').IsNull;


      // Marchetti - Pendencia 26271 e 26276
      if not cdsTemp.FieldByName('CODDOCUMENTO').IsNull then
      begin
         _cds.Data    := GetDataPacket('SELECT NOSSONUMERO FROM DOCUMENTO WHERE CODDOCUMENTO = ' + cdsTemp.FieldByName('CODDOCUMENTO').AsString);
         sNossoNumero := _cds.FieldByName('NOSSONUMERO').AsString;
      end;
      // Fim Marchetti - Pendencia 26271 e 26276

      if idPlanilha = -1 then
         iPlanilha     := cdsTemp.FieldByName('PLNCODIGO').AsInteger
      else
         iPlanilha     := idPlanilha;

      if bTransacao then StartTransaction;

      // Marchetti - Pendencia 26271 e 26276
      if not bApenasDesfazIntegracao then
      begin
         // Exclui os abonos por cobrança de divergência
         if not ExcluiCobrancaDivege( iDocumento ) then raise Exception.Create( MessageInfo );
      end;
      // Fim Marchetti - Pendencia 26271 e 26276

      // Apaga as linhas da mensagem do boleto
      if not CtrlMsgBoleto.ExcluiMsgBoleto( iDocumento, False ) then
         raise Exception.Create( CtrlMsgBoleto.MessageInfo );

      // Marchetti - Pendencia 26271 e 26276
      if not bApenasDesfazIntegracao then
      begin
         // Marchetti - Pendencia 22289
         sSql := 'DELETE FROM BLOQUEIOIMOB '+#13+
                 ' WHERE IDDOCUMENTOBLOQ = ' + InttoStr(iDocumento);
         if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
         // Fim Marchetti - Pendencia 22289
      end;
      // Fim Marchetti - Pendencia 26271 e 26276

      // Marchetti - Pendencia 26271 e 26276
      if not bApenasDesfazIntegracao then
      begin
         // Apaga os Alteradores no Imobiliário
         sSql := 'DELETE FROM ALTERALANCIMOVEL '+#13+
                 ' WHERE IDDOCUMENTO = ' + InttoStr(iDocumento);
         if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
      end;

      // Marchetti - Pendencia 26271 e 26276
      if not bApenasDesfazIntegracao then
      begin
         // Apaga as Observações do Lançamento no Imobiliário
         sSql := 'DELETE FROM OBSLANCIMOVEL '+#13+
                 ' WHERE IDDOCUMENTO = ' + InttoStr(iDocumento);
         if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

         // Daniel - 24872 - Início -----------------------------------------------------
         // Apaga os Indicadores Apurados
         sSql := 'DELETE FROM INDICADORXAPUR '+#13+
                 ' WHERE IDDOCUMENTO = ' + InttoStr(iDocumento);
         if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
         // Daniel - 24872 - Fim --------------------------------------------------------
      end;
      // Fim Marchetti - Pendencia 26271 e 26276

      if not bApenasDesfazIntegracao then
      begin
        // Thiago Melo SOL 200960 Kintana 1943658 INI
        // Buscando IDLancImovel
        sSql := 'SELECT IDLANCIMOVEL '+#13+
                '  FROM LANCAMENTOSIMOVEL'+#13+
                ' WHERE IDDOCUMENTO = ' + IntToStr(iDocumento);

        _cdsAux := TCMClientDataSet.Create( nil );
        _cdsAux.Data := GetDataPacket( sSql );
        if not _cdsAux.IsEmpty then begin
           // Apaga rateio
           sSql := 'DELETE FROM RATEIOLANCAMENTOSIMOVEL '+#13+
                   ' WHERE IDLANCIMOVEL = ' + _cdsAux.FieldByName('IDLANCIMOVEL').AsString;
           if not ExecSQL( sSql ) then begin
             raise Exception.Create( MessageInfo );
           end;

           // Apaga o Lançamento no Imobiliário
           sSql := 'DELETE FROM LANCAMENTOSIMOVEL '+#13+
                   ' WHERE IDDOCUMENTO = ' + InttoStr(iDocumento);
           if not ExecSQL( sSql ) then begin
             raise Exception.Create( MessageInfo );
           end;
        end;
        // Thiago Melo SOL 200960 Kintana 1943658 FIM
      end
      else
      begin
         // Grava o nosso numero no Imobiliario
         sSql := 'UPDATE LANCAMENTOSIMOVEL SET FLGINTEGRADO = 0, CODDOCUMENTO = NULL, PLNCODIGO = NULL, NOSSONUMERO = ' + QuotedStr(sNossoNumero) +#13+
                 ' WHERE IDDOCUMENTO = ' + InttoStr(iDocumento);
         if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
      end;
      // Fim Marchetti - Pendencia 26271 e 26276


      if ParamSistema.IDModulo = 135 then
      begin
         sSql := 'UPDATE PARCFINANCIMOV SET CODDOCUMENTO = NULL, PLNCODIGO = NULL, FLGLANCINTEGRA = 0 '+#13+
                 ' WHERE CODDOCUMENTO = ' + InttoStr(iDocumento);
         if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

         // exclui pagamentos extras da tabela PARCFINANCIMOV
         if iTipo = 6 then begin
            // Limpa o ID da parcela extra da parcela com divergencia
            sSQL := ' UPDATE PARCFINANCIMOV '+
                    '    SET FLGCONCILIADO = NULL '  +
                    '  WHERE IDPARCFINANCIMOV = ' + IntToStr(iParcela);
            if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
         end;

         // exclui o acerto do resíduo na tabela PARCEXTRAIMOV
         if iTipo = 10 then begin
            // Retorna a situação de Incorporação do Resíduo para <N>ão

            sSql := 'UPDATE PARCFINANCIMOV ' +#13+
                    '   SET FLGRESIDUOINCORP = ''N'' '+#13+
                    '  WHERE IDPARCFINANCIMOV = ' + IntToStr(iParcela);
            if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

            // Exclui o lancamento em PARCEXTRAIMOV
            sSQL := ' DELETE FROM PARCEXTRAIMOV '+
                    '  WHERE IDPARCCOBRANCA = ' + IntToStr(iParcela);
            if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
         end;

         // exclui a parcela extra gerada na tabela PARCFINANCIMOV
         if (iTipo in[6,10]) then begin
            sSQL := ' DELETE FROM PARCFINANCIMOV '+
                    ' WHERE (IDPARCFINANCIMOV = '+IntToStr(iParcela)+')';
            if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
         end;
      end;
      // Apaga a integração com Financeiro, Compromisso Orçampentário e Contabilidade

      if (bIntegradoCAR) then begin
        {CtrlDocumento.Prepare(OpDocumento, odlEfetivo);
        CtrlDocumento.IdUsuario     := ParamSistema.idUsuario;
        CtrlDocumento.IdEspAcesso   := ParamSistema.idEspAcesso;
        CtrlDocumento.CodDocumento  := iDocumento;
        CtrlDocumento.UsaPlanoPatro := ParamSistema.UsaPlanoPatro;}
        CtrlImobDocumento.Prepare(OpDocumentoImob, odlEfetivoImob);
        CtrlImobDocumento.IdUsuario     := ParamSistema.idUsuario;
        CtrlImobDocumento.IdEspAcesso   := ParamSistema.idEspAcesso;
        CtrlImobDocumento.CodDocumento  := iDocumento;
        CtrlImobDocumento.UsaPlanoPatro := ParamSistema.UsaPlanoPatro;

        //if not CtrlDocumento.Delete then raise Exception.Create( 'CapCar - ' + CtrlDocumento.MessageInfo );
        if not CtrlImobDocumento.Delete then raise Exception.Create( 'CapCar - ' + CtrlImobDocumento.MessageInfo );
      end;

      // exclui a integração com Contabilidade qdo o lançamento não tiver sido integrado com CapCar
      if (bIntegradoCTB) and (not bIntegradoCAR) and (iPlanilha > 0) then
      begin
          if not CtrlContabil.ExcluiLancaContab( ParamSistema.idUsuario, iPlanilha,
                                                 ParamSistema.idModulo, 0,
                                                 ParamSistema.UsaPlanoPatro, True) then
          raise Exception.Create( 'Contabilidade - ' + CtrlContabil.MessageInfo );
{          if not CtrlImobLancamento.ExcluiLancaContab(ParamSistema.idUsuario, iPlanilha,
                                                      ParamSistema.idModulo, 0,
                                                      ParamSistema.UsaPlanoPatro, True) then
            raise Exception.Create('Contabilidade - ' + CtrlImobLancamento.MessageInfo);}

      end;

      if bTransacao then
        Commit;
    except
      on e : Exception do begin
        Result := False;
        if bTransacao then Rollback;
        MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;




//========================================================================================
// Função INTERNA para Desfazer o abono de lancamentos por cobranca de divergencia
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento  - id do Documento de Divergencia que será excluido
//
// Retorno : True  - Desfez o abono
//           False - Não Desfez o abono
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.ExcluiCobrancaDivege(const iDocumento: Integer): Boolean;
var sSql : String;
begin
  Result := True;
  try
    // Limpa o Flag de Conciliado nos documentos abonados
    sSql := 'UPDATE DOCUMENTO ' +#13+
            '   SET FLGNAOCONCILIADO = 1 ' +#13+
            ' WHERE CODDOCUMENTO IN ( SELECT IDDOCUMENTO '+#13+
            '                           FROM CONCILIADOC '+#13+
            '                          WHERE IDDOCDIVERGE = ' + IntToStr(iDocumento) + ' )';
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    // Exclui o registro em CONCILIADOC dos documento abonados
    sSql := 'DELETE FROM CONCILIADOC '+#13+
            ' WHERE IDDOCDIVERGE = ' + IntToStr(iDocumento);
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
  except
    on e : Exception do begin
      Result := False;
      MessageInfo := e.message;
    end;
  end;
end;



//========================================================================================
// Função para Integrar um ou mais documentos com CapCar, Contabilidade e Orçamento
// Data : 29/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento     - id do Documento que será integrado
//       bTransacao     - Transação Local ( default = True )
//
// Retorno : True  - Integrou o Documento
//           False - Não Integrou o Documento
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.Integrar(const iDocumento: Integer;
                                         const bTransacao: Boolean;
                                         const bTemContrato : boolean  // Edilaine - SOL 1077772-5681 / KTN 1358973
                                        ): Boolean;
var
   vParamContabeis      : array of TParamContabeisMT;    // Primeira Contabilização
   vParamOperContab     : array of TParamContabeisMT;    // Segunda Operação Contábil
   CodErro              : TMensErro;
   sSql                 : String;
   iErroResponsavel, i  : Integer;
   bSegundaOperacao     : Boolean;
begin
  Result           := True;
  cdsIntegra := TClientDataSet.Create( nil );
  try
    try
      if bTransacao then
         StartTransaction;

      cdsIntegra.Data := LookupImoveisDocum( iDocumento, True );

       if cdsIntegra.IsEmpty then raise exception.create('Documento não encontrado');

      // determinar o tamanho do vetor de parâmetros
      SetLength(vParamContabeis, cdsIntegra.RecordCount);
      SetLength(vParamOperContab, cdsIntegra.RecordCount);

      for i := 0 to cdsIntegra.RecordCount - 1 do
      begin
        //determinar a quantidade de ímoveis rateando o documento
        SetLength(aIdImovel, i + 1);
        aIdImovel[i] := cdsIntegra.FieldByName('IDIMOVEL').AsInteger;
        cdsIntegra.Next;
      end;
      cdsIntegra.First;

      // Determina a existência de uma segunda operação contabil
      bSegundaOperacao := (not cdsIntegra.FieldByName('IDOPERCONTAB').IsNull);

      CtrlPadrLancImovel.ZeraVetorPadrLancContabil( vParamContabeis );

      if bSegundaOperacao then begin
         CtrlPadrLancImovel.ZeraVetorPadrLancContabil( vParamOperContab ); // zerar record de parametrização para segunda operação contábil
      end;


      // Busca a parametrização para todos os imóveis do lançamento
      CodErro := BuscaParametrizacao( vParamContabeis );

      if CodErro.iCodErro = 0 then begin

         // Verificações APENAS para o ADMINIMOB
         if ParamSistema.IdModulo = 64 then begin

            // é necessário que o lançamento seja contabilizado ou integrado ao financeiro
            if (vParamContabeis[0].bFlgIntegraCapCar = False) and
               (vParamContabeis[0].bFlgIntegraContab = False) then begin
               CodErro.iCodErro  := -50;
               CodErro.sMensErro := ComunsImobiliario.ErroIntegra( CodErro.iCodErro );
            end;

            // verificar se o responsável pela despesa é o locatário
            if (CodErro.iCodErro = 0) and (not bTemContrato) then begin                // Edilaine - SOL 1077772-5681 / KTN 1358973
               if DespesaLocatario(-1, iErroResponsavel) then begin
                  CodErro.iCodErro  := iErroResponsavel;
                  CodErro.sMensErro := ComunsImobiliario.ErroIntegra( CodErro.iCodErro );
               end;
            end;

            // verificar se o lançamento obriga a liberação
            if (CodErro.iCodErro = 0) and (not bTemContrato) then begin                // Edilaine - SOL 1077772-5681 / KTN 1358973
               if ObrigaLiberacao(-1, iErroResponsavel) then begin
                  CodErro.iCodErro  := iErroResponsavel;
                  CodErro.sMensErro := ComunsImobiliario.ErroIntegra( CodErro.iCodErro );
               end;
            end;

            // integrar com o orçamento
            if (CodErro.iCodErro = 0) and (vParamContabeis[0].bFlgIntegraCapCar) then begin
               if CtrlModuloImobiliario.AdminImob.bFlgIntegraOrcamen then begin
                  CodErro := IntegraOrcamento;
               end;
            end;
         end;

         if bSegundaOperacao then begin
            if (CodErro.iCodErro = 0) and (vParamContabeis[0].bFlgIntegraContab) then begin
               CodErro := BuscaParametrizacao(vParamOperContab, True);
            end;
         end;

         // Integrar com Contabilidade    ( bJunta não funciona com Segregação na Origem )
         if CodErro.iCodErro = 0 then
         begin
         //Cássio - SOL Nº 124540 KINTANA Nº 633512
         //   if (CtrlParamIntegra.PartidaDobrada) or (CtrlParamIntegra.SegregaVirtual) then
          if (CtrlParamIntegra.PartidaDobrada) then
                 CodErro := IntegraContabilidadePD(vParamContabeis,vParamOperContab)
            else
                 CodErro := IntegraContabilidade(vParamContabeis,vParamOperContab);
         end;

         // Integrar com CapCar
         if vParamContabeis[0].bFlgIntegraCapCar then begin
            if CodErro.iCodErro = 0 then CodErro := IntegraCaPCaR(vParamContabeis);
            if CodErro.iCodErro = 0 then CodErro := SetMensagemCNAB(vParamContabeis[0].iCodDocumento);

            // Integrar Alteradores
            if CodErro.iCodErro = 0 then CodErro := IntegraAlteradores(vParamContabeis[0].iCodDocumento);
         end;


         // gravar informações de documentos integrados
         if CodErro.iCodErro = 0 then begin
            sSql := 'UPDATE LANCAMENTOSIMOVEL    '+#13+
                    '   SET FLGINTEGRADO = NULL, '+#13+
                    '       NUMAPALT     = NULL, ';
            if vParamContabeis[0].iPlanilha > 0 then
               sSql := sSql + ' PLNCODIGO = ' + IntToStr(vParamContabeis[0].iPlanilha) +','+#13;
            if vParamContabeis[0].iCodDocumento > 0 then
               sSql := sSql + ' CODDOCUMENTO = ' + IntToStr(vParamContabeis[0].iCodDocumento) +','+#13;
            sSql := sSql +
                    '       FLGERRO        = NULL, '+#13+
                    '       MSGERROINTEGRA = NULL  '+#13+
                    ' WHERE IDDOCUMENTO = ' + IntToStr(iDocumento);

            if not ExecSQL( sSql ) then raise exception.create('Erro ao atualizar informações de integração no documento');
         end;

         // Marchetti - Pendencia 26271 e 26276
         if (not cdsIntegra.FieldByName('NOSSONUMERO').IsNull) and
            (vParamContabeis[0].bFlgIntegraCapCar) then
         begin
            sSql := 'UPDATE DOCUMENTO  '                                                                       +#13+
                    'SET NOSSONUMERO    = ' + QuotedStr(cdsIntegra.FieldByName('NOSSONUMERO').AsString)  + ',' +#13+
                    '    EMISBLOQ       = ''S'''                                                               +#13+
                    'WHERE CODDOCUMENTO = ' + IntToStr(vParamContabeis[0].iCodDocumento)                       +#13;
            if not ExecSQL( sSql ) then raise exception.create('Erro ao atualizar o NOSSONUMERO no documento gerado');
         end;
         // Fim Marchetti - Pendencia 26271 e 26276

         if CodErro.iCodErro = 0 then begin
            if bTransacao then Commit;
         end else begin
            raise exception.create( CodErro.sMensErro );
         end;
      end else begin
         raise Exception.Create( CodErro.sMensErro );
      end;
    except
      on e : Exception do begin
         Result := False;
         if bTransacao then Rollback;
         MessageInfo := e.message;
      end;
    end;
  finally
    FreeAndNil(cdsIntegra);
  end;
end;



//========================================================================================
// Função INTERNA para buscar a parametrização contabil e financeira para cada imovel do
// documento
// Data : 29/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vParamContabeis - Vetor para retorno das parametrizações ( 1 registro por imovel )
//
// Retorno : Result.iCodErro  - Código do erro
//           Result.iMensErro - Mensagem de erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.BuscaParametrizacao(var vParamContabeis: array of TParamContabeisMT; const bSegOper : Boolean = False): TMensErro;
var
  vRegistro: integer;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';
   vRegistro        := 0;
   // Verifica a parametrização para cada imóvel do documento
   cdsIntegra.First;
   while (not cdsIntegra.Eof) and (Result.iCodErro = 0) do begin
      Result := DefineParamContabeis(vParamContabeis[vRegistro],bSegOper);
      DefineHistorico(vParamContabeis[vRegistro].sHistoricoCtb, vParamContabeis[vRegistro].sHistoricoCapCar,bSegOper);

      if (Result.iCodErro = 0) and (not bSegOper) then Result := ConfereParamContabeis(vParamContabeis[vRegistro]);

      if Result.iCodErro = 0 then begin
         // checar se a parametrização é igual em todas as linhas
         // obrigatoriedade do CAPCAR
         if (vRegistro > 0) and (not bSegOper) then begin
            if   (vParamContabeis[vRegistro].bFlgIntegraContab   <> vParamContabeis[0].bFlgIntegraContab)   or
               (vParamContabeis[vRegistro].bFlgIntegraCapCar   <> vParamContabeis[0].bFlgIntegraCapCar)   then begin
               Result.iCodErro  := -30;
               Result.sMensErro := ComunsImobiliario.ErroIntegra( Result.iCodErro );
            end;
         end;
      end else begin
         exit;
      end;
      cdsIntegra.Next;
      inc(vRegistro);
   end;
end;



//========================================================================================
// Função INTERNA para montar o histórico contábil do lançamento, caso este seja diferente
//        da observação da AP.
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : sHistCtb    - Retorna o histórico contábil
//              sHistCapCar - Retorna o histórico financeiro
//
// Retorno : True - Histórico ok
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.DefineHistorico(var sHistCtb, sHistCapCar:string; const bSegOper : Boolean = False): Boolean;
var sObs, sTextoPagRec : string;
begin
  try
    Result := True;
    sObs := LookupObservacaoDocum(cdsIntegra.FieldByName('IDDOCUMENTO').AsInteger);

    // A princípio o histórico contábil e financeiro são iguais ao documento
    sHistCtb    := sObs;
    sHistCapCar := sObs;

    // Se não existir obs no documento ou nos parâmetros estiver definido que o histórico é
    // diferente, monta o histórico para a Contabilidade.
    if (length(trim(sObs)) = 0) or (CtrlModuloImobiliario.AdminImob.bFlgHistContDifAP) then begin

       if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then
            sTextoPagRec := ', a pagar, '
       else sTextoPagRec := ', a receber, ';

       // DOC: 001, a receber,
       sHistCtb :=  'DOC: ' + IntToStr(cdsIntegra.FieldByName('NODOCUMENTO').AsInteger) + sTextoPagRec;

       // DOC: 001, a receber, ref: Aluguel
       if not bSegOper then begin
          sHistCtb := sHistCtb + trim(cdsIntegra.FieldByName('DESCCUSTORECIMO').AsString);
       end else begin
          sHistCtb := sHistCtb + BuscaDescSegOper(cdsIntegra.FieldByName('IDTIPOCUSTORECIMO').AsInteger);
       end;

       // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002
       sHistCtb := sHistCtb + ' - comp: ' + ComunsImobiliario.Competencia(cdsIntegra.FieldByName('MESCOMPETENCIA').AsInteger,
                                                                                                              cdsIntegra.FieldByName('ANOCOMPETENCIA').AsInteger);
       // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002 - venc: 05/02/2002
       sHistCtb := sHistCtb + ' - venc: ' + DateToStr(cdsIntegra.FieldByName('DATAVENCIMENTO').AsDateTime);

       // DOC: 001, a receber, ref: Aluguel - comp: Janeiro/2002 - vencimento 05/02/2002 - forma: Folha de Aluguéis
       sHistCtb := sHistCtb + ' - forma: ' +
                  ComunsImobiliario.OrigemLanc(cdsIntegra.FieldByName('IDMODULO').AsInteger,
                                               cdsIntegra.FieldByName('FLGORIGEMLANC').AsString);
    end;
  except
    Result      := False;
    sHistCtb    := '';
    sHistCapCar := '';
  end;
end;



//========================================================================================
// Função INTERNA para buscar os parametros de integração para cada imovel do lançamento
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : rParamContabeis - Retorna o histórico contãbil
//
// Retorno    : Result.iCodErro  - Código do Erro
//              Result.sMensErro - Mensagem de Erro
//              -1  Conta contábil débito não informada
//              -2  Sub conta contábil débito obrigatório mas não informada
//              -3  Centro de Custos conta débito obrigatório mas não informado
//              -4  Conta contábil crédito não informada
//              -5  Sub conta contábil crédito obrigatório mas não informada
//              -6  Centro de Custos conta crédito obrigatório mas não informado
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.DefineParamContabeis(var rParamContabeis: TParamContabeisMT; const bSegOper : Boolean = False): TMensErro;
var
   iCodErro: integer;
   sRecPag : String;
   iRecDes : Integer;
begin
   // obter as contas contábeis
   try

      if not bSegOper then begin
         sRecPag := cdsIntegra.FieldByName('RECPAG').AsString;
         iRecDes := cdsIntegra.FieldByName('IDTIPOCUSTORECIMO').AsInteger;
      end else begin
         sRecPag := 'O';
         iRecDes := cdsIntegra.FieldByName('IDOPERCONTAB').AsInteger;
      end;

      Result.iCodErro  := 0;
      Result.sMensErro := '';
      
      if not CtrlPadrLancImovel.BuscaPadrLancContabil(rParamContabeis,
                                                      iCodErro,
                                                      sRecPag,
                                                      False,
                                                      ParamSistema.idEmpresa,
                                                      ParamSistema.idModulo,
                                                      iRecDes,
                                                      //Ricardo SOL: 141052/2322 kintana: 914497 - comentado
                                                      //cdsIntegra.FieldByName('CODTIPIMOVEL').AsString,
                                                      //Ricardo SOL: 141052/2322 kintana: 914497
                                                      cdsIntegra.FieldByName('CODTIPIMOVEL_IMOVEL').AsString,
                                                      cdsIntegra.FieldByName('IDIMOVEL').AsInteger,
                                                      cdsIntegra.FieldByName('IDCONTRATOIMOVEL').AsInteger) then

         raise Exception.create ( CtrlPadrLancImovel.MessageInfo );
   except
      on e : Exception do begin
         Result.iCodErro  := iCodErro;
         Result.sMensErro := e.message;
      end;
   end;
end;



//========================================================================================
// Função INTERNA para conferir os parametros de integração para cada imovel do lançamento
// Data : 06/01/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : rParamContabeis - Retorna o histórico contãbil
//
// Retorno    : Result.iCodErro  - Código do Erro
//              Result.sMensErro - Mensagem de Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.ConfereParamContabeis(var rParamContabeis: TParamContabeisMT): TMensErro;
var bObrigaCentroCustoDebCred, bObrigaSubContaDebCred : boolean;
    bObrigaCentroCustoResult,  bObrigaSubContaResult  : boolean;
    bAbreQuery, bAbreQueryImovel: Boolean;
    cdsTemp : TCMClientDataSet;
    sSql : String;
begin
   try
      // Busca as contas de Ativo / Passivo que estão em branco, do cadastro de Pessoa
      AtribuiContaForCli( rParamContabeis );

      bObrigaSubContaDebCred    := False;
      bObrigaCentroCustoDebCred := False;
      bObrigaCentroCustoResult  := False;
      bObrigaSubContaResult     := False;

      // -------------------------------------
      // ----- CONTA CONTABIL DE PASSIVO -----
      // -------------------------------------
      // Verifica obrigatoriedade de subconta e centro de custo
      if rParamContabeis.sContaDebCred <> '' then begin
         cdsTemp := TCMClientDataSet.Create( nil );
         sSql    := 'SELECT PLACONTA, PLANOME, PLASUBCONTA, PLACCUST '+#13+
                    '  FROM PLANOCONTA      '+#13+
                    ' WHERE PLATIPO = ''A'' '+#13+
                    '   AND PLANO   = ' + IntToStr(CtrlParamIntegra.Plano) +#13+
         // Marchetti - Pendencia 25665
                    '   AND RTRIM(PLACONTA) = ' + QuotedStr(rParamContabeis.sContaDebCred);
         // Fim Marchetti - Pendencia 25665
         cdsTemp.Data := GetDataPacket( sSql );
         bObrigaSubContaDebCred    := cdsTemp.FieldByName('PLASUBCONTA').asString = 'S';
         bObrigaCentroCustoDebCred := cdsTemp.FieldByName('PLACCUST').asString    = 'S';
      end;

      // pegar a sub-conta do cliente / fornecedor
      if bObrigaSubContaDebCred then begin
         if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then begin
            bAbreQuery := True;  // utilizado para otimização, somente abrir se precisar
            if bAbreQuery then begin
               sSql := 'SELECT IDFORCLI, CONTACCLIENTE, CODCENTROCUSTO, CODSUBCONTA '+#13+
                       '  FROM EMPRESACLIENTE WHERE IDFORCLI = ' + cdsIntegra.FieldByName('IDFORCLI').AsString;
               cdsTemp.Data := GetDataPacket( sSql );
            end;
            rParamContabeis.sSubContaDebCred := cdsTemp.FieldByName('CODSUBCONTA').AsString;
            rParamContabeis.sSubContaDebito  := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         end else begin          // contas a pagar
            bAbreQuery := True;  // utilizado para otimização, somente abrir se precisar
            if bAbreQuery then begin
               sSql := 'SELECT IDFORCLI, CONTACFORN, CODCENTROCUSTO, CODSUBCONTA '+#13+
                       '  FROM EMPRESAFORN WHERE IDFORCLI = ' + cdsIntegra.FieldByName('IDFORCLI').AsString;
               cdsTemp.Data := GetDataPacket( sSql );
            end;
            rParamContabeis.sSubContaDebCred := cdsTemp.FieldByName('CODSUBCONTA').AsString;
            rParamContabeis.sSubContaCredito := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         end;
      end;

      // verifica se obriga Centro de Custo
      if not bObrigaCentroCustoDebCred then begin
         rParamContabeis.sCentroCustoDebCred := '';
         if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then
              rParamContabeis.sCentroCustoCredito := ''
         else rParamContabeis.sCentroCustoDebito  := '';
      end;

      // ---------------------------------------
      // ----- CONTA CONTABIL DE RESULTADO -----
      // ---------------------------------------
      // Verifica obrigatoriedade de subconta e centro de custo
      if rParamContabeis.sContaResult <> '' then begin
         cdsTemp := TCMClientDataSet.Create( nil );
         sSql    := 'SELECT PLACONTA, PLANOME, PLASUBCONTA, PLACCUST '+#13+
                    '  FROM PLANOCONTA      '+#13+
                    ' WHERE PLATIPO = ''A'' '+#13+
                    '   AND PLANO   = ' + IntToStr(CtrlParamIntegra.Plano) +#13+
         // Marchetti - Pendencia 25665
                    '   AND RTRIM(PLACONTA) = ' + QuotedStr(rParamContabeis.sContaResult);
         // Fim Marchetti - Pendencia 25665
         cdsTemp.Data := GetDataPacket( sSql );
         bObrigaSubContaResult    := cdsTemp.FieldByName('PLASUBCONTA').asString = 'S';
         bObrigaCentroCustoResult := cdsTemp.FieldByName('PLACCUST').asString    = 'S';
      end;

      // primeiro verifica se a Sub-Conta pode ser usada
      if bObrigaSubContaResult then begin
         if not cdsIntegra.FieldByName('CODSUBCONTA').IsNull then begin // encontrada a sub-conta no imovel
            rParamContabeis.sSubContaResult := cdsIntegra.FieldByName('CODSUBCONTA').AsString;
            if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then
                 rParamContabeis.sSubContaCredito := cdsIntegra.FieldByName('CODSUBCONTA').AsString
            else rParamContabeis.sSubContaDebito  := cdsIntegra.FieldByName('CODSUBCONTA').AsString;
         end else begin  // não encontrada a sub-conta no imovel procurar no imovel mestre
            bAbreQueryImovel := True;
            if bAbreQuery then begin
               sSql := 'SELECT IDIMOVEL, CODSUBCONTA '+#13+
                       '  FROM IMOVEL WHERE IDIMOVEL = ' + cdsIntegra.FieldByName('IDIMOVELMESTRE').AsString;
               cdsTemp.Data := GetDataPacket( sSql );
            end;
            rParamContabeis.sSubContaResult := cdsTemp.FieldByName('CODSUBCONTA').AsString;
            if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then
                 rParamContabeis.sSubContaCredito := cdsTemp.FieldByName('CODSUBCONTA').AsString
            else rParamContabeis.sSubContaDebito  := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         end;
      end;

      // verifica se obriga Centro de Custo
      if not bObrigaCentroCustoResult then begin
         rParamContabeis.sCentroCustoResult := '';
         if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then
              rParamContabeis.sCentroCustoDebito  := ''
         else rParamContabeis.sCentroCustoCredito := '';
      end;

      // sem problemas
      Result.iCodErro  := 0;
      Result.sMensErro := '';

      // ----------------------------------------------------------------------------------------------
      // Confere os parametros obrigatórios
      // ----------------------------------------------------------------------------------------------

      // se tiver integração contábil são necessárias as duas contas
      if  rParamContabeis.bFlgIntegraContab then begin
         if rParamContabeis.sContaContabilDebito = '' then begin
            Result.iCodErro  := -1;
            exit;
         end;
         if rParamContabeis.sContaContabilCredito = '' then begin
            Result.iCodErro  := -4;
            exit;
         end;
      // se não tiver integração contábil obrigar apenas a conta de ativo ou passivo
      end else begin
         if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then begin
            if rParamContabeis.sContaContabilCredito = '' then begin
               Result.iCodErro  := -4;
               exit;
            end;
         end else begin
            if rParamContabeis.sContaContabilDebito = '' then begin
               Result.iCodErro  := -1;
               exit;
            end;
         end;
      end;

      if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then begin
         if ( bObrigaSubContaResult ) and ( rParamContabeis.sSubContaDebito = '' ) then begin
            Result.iCodErro := -2  // obriga sub conta deb
         end else if ( bObrigaCentroCustoResult ) and ( rParamContabeis.sCentroCustoDebito = '' ) then begin
            Result.iCodErro := -3  // obriga centro custo deb
         end else if ( bObrigaSubContaDebCred ) and ( rParamContabeis.sSubContaCredito = '' ) then begin
            Result.iCodErro := -5  // obriga sub conta cre
         end else if ( bObrigaCentroCustoDebCred ) and ( rParamContabeis.sCentroCustoCredito = '' ) then begin
            Result.iCodErro := -6  // obriga centro custo cre
         end;
      end else if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then begin
         if ( bObrigaSubContaDebCred ) and ( rParamContabeis.sSubContaDebito = '' ) then begin
            Result.iCodErro := -2  // obriga sub conta deb
         end else if ( bObrigaCentroCustoDebCred ) and ( rParamContabeis.sCentroCustoDebito = '' ) then begin
            Result.iCodErro := -3  // obriga centro custo deb
         end else if ( bObrigaSubContaResult ) and ( rParamContabeis.sSubContaCredito = '' ) then begin
            Result.iCodErro := -5  // obriga sub conta cre
         end else if ( bObrigaCentroCustoResult ) and ( rParamContabeis.sCentroCustoCredito = '' ) then begin
            Result.iCodErro := -6  // obriga centro custo cre
         end;
      end;
   finally
      FreeAndNil( cdsTemp );
      if Result.iCodErro <> 0 then Result.sMensErro := ComunsImobiliario.ErroIntegra(Result.iCodErro);
   end;
end;



//========================================================================================
// Função INTERNA para atribuir as contas do Cliente / Fornecedor do cadastro de Pessoa,
// caso estas não tenham sido preenchidas na tabela PadrLancImovel
// Data : 06/01/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : rParamContabeis - Parametros para integração
//
// Retorno    : Result.iCodErro  - Código do Erro
//              Result.sMensErro - Mensagem de Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.AtribuiContaForCli(var rParamContabeis: TParamContabeisMT): TMensErro;
var bNovaQuery: Boolean;
    cdsTemp   : TCMClientDataSet;
    sSql      : String;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';

   // Buscar a conta do CLIENTE / FORNECEDOR, apenas se a conta de ATIVO / PASSIVO estiver em branco
   if rParamContabeis.sContaDebCred <> '' then exit;

   try
      cdsTemp := TCMClientDataSet.Create( nil );
      if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then begin   // clientes
         bNovaQuery := True;
         if bNovaQuery then begin    // para otimização, somente abrir a query uma vez por fornecedor
            sSql := 'SELECT IDFORCLI, CONTACCLIENTE, CODCENTROCUSTO, CODSUBCONTA '+#13+
                    '  FROM EMPRESACLIENTE WHERE IDFORCLI = ' + cdsIntegra.FieldByName('IDFORCLI').AsString;
            cdsTemp.Data := GetDataPacket( sSql );
         end;

         rParamContabeis.sContaDebCred        := cdsTemp.FieldByName('CONTACCLIENTE').AsString;
         rParamContabeis.sContaContabilDebito := cdsTemp.FieldByName('CONTACCLIENTE').AsString;
         rParamContabeis.sSubContaDebCred     := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         rParamContabeis.sSubContaDebito      := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         rParamContabeis.sCentroCustoDebCred  := cdsTemp.FieldByName('CODCENTROCUSTO').AsString;
         rParamContabeis.sCentroCustoDebito   := cdsTemp.FieldByName('CODCENTROCUSTO').AsString;

      end else begin                                                  // fornecedores
         bNovaQuery := True;
         if bNovaQuery then begin    // para otimização, somente abrir a query uma vez por fornecedor
            sSql := 'SELECT IDFORCLI, CONTACFORN, CODCENTROCUSTO, CODSUBCONTA '+#13+
                    '  FROM EMPRESAFORN WHERE IDFORCLI = ' + cdsIntegra.FieldByName('IDFORCLI').AsString;
            cdsTemp.Data := GetDataPacket( sSql );
         end;

         rParamContabeis.sContaDebCred         := cdsTemp.FieldByName('CONTACFORN').AsString;
         rParamContabeis.sContaContabilCredito := cdsTemp.FieldByName('CONTACFORN').AsString;
         rParamContabeis.sSubContaDebCred      := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         rParamContabeis.sSubContaCredito      := cdsTemp.FieldByName('CODSUBCONTA').AsString;
         rParamContabeis.sCentroCustoDebCred   := cdsTemp.FieldByName('CODCENTROCUSTO').AsString;
         rParamContabeis.sCentroCustoCredito   := cdsTemp.FieldByName('CODCENTROCUSTO').AsString;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;



//========================================================================================
// Função para buscar as observações do lançamento
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : iCodDocumento - Id do Documento
//
// Retorno    : Observações do lançamento
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.LookupObservacaoDocum(const iIdDocumento: Integer): String;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
  sSql := 'SELECT IDDOCUMENTO, OBS '+#13+
          '  FROM OBSLANCIMOVEL    '+#13+
          ' WHERE IDDOCUMENTO  =   '+ IntToStr(iIdDocumento);
  try
    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );
    if cdsTemp.IsEmpty then
         Result := ''
    else Result := cdsTemp.FieldByName('OBS').AsString;
  finally
    FreeAndNil( cdsTemp );
  end;
end;



//========================================================================================
// Função INTERNA para integração financeira do documento, e atualizar o coddocumento em
//        todas as linhas do vetor de parametrização dos imóveis
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros : vParamContabeis - Vetor com os parametros para os imóveis ( 1 reg por imovel )
//
// Retorno : Result.iCodErro  - Código de Erro
//           Result.iMensErro - Mensagem de Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.IntegraCaPCaR(var vParamContabeis: array of TParamContabeisMT): TMensErro;
var i: integer;
begin;
   Result.iCodErro := 0;
   try
      // fazer o lançamento do documento
      Result := FazerLancamentoCApCAr(vParamContabeis);

          // Grava o código do documento em todos os registros do vetor
      if Result.iCodErro = 0 then begin
        for i := 1 to Length(vParamContabeis) - 1 do begin
          vParamContabeis[i].iCodDocumento := vParamContabeis[0].iCodDocumento;
        end;
      end;
   except
      on e:exception do begin
         Result.iCodErro  := -34;
         Result.sMensErro := e.Message;
      end;
   end;
end;



//========================================================================================
// Função INTERNA para integrar o documento com o módulo Financeiro - CapCar
//       ( efetua um lançamento para cada grupo de registros com o mesmo IDDOCUMENTO )
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       rParamContabeis - vetor com os parämetros de integração
//
// Retorno : TMensErro.iCodErro  - Código do Erro
//                    .sMensErro - Mensagem do Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.FazerLancamentoCApCAr(var vParamContabeis: array of TParamContabeisMT): TMensErro;
var
   sDebCre, sOperacao, sSql, sCentroCusto, sContaSegregaCriter : string;
    // André Pontes - 09/06/2005 - pendência 19283
    sCentroCustoUso : String;
    // FIM André Pontes - 09/06/2005 - pendência 19283
   fVlrTotalDoc, fVlrTotalDocOM, fVlrOrca, fVlrRateioOM : extended;
   iIdPlanoPrev, iIdPatro : Integer;
   iMoeda, iNumAP, i : integer;
   iNumLancamento    : integer;
   iFormaPagto       : integer;
   iSubContaDebCred  : integer;
   cdsTemp           : TCMClientDataSet;
   vLancaBM          : TLancaBM;
   vRateioDocum      : TRateioDocum;
   bBaixaMultipla    : Boolean;
   iPrograma         : Integer;
   iIdSegrega        : Integer;
   sHistComp         : String;
   dDataProgramada   : TDateTime;
   dDataLimite       : TDateTime;
   sIdImovel         : String;
   bSegregaOrigemImob : Boolean;
begin
   Result.iCodErro := 0;
   try
      // Define padrões do módulo de origem
      if ParamSistema.idModulo = 64 then begin    // Adminimob
         iPrograma := CtrlModuloImobiliario.AdminImob.iPrograma;
      end else begin
         iPrograma := CtrlModuloImobiliario.InvestImob.iIdPrograma;
      end;

      // Define histórico complementar do documento
       if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then begin
         if cdsIntegra.FieldByName('OBS').IsNull then
           sHistComp := Copy( Trim(cdsIntegra.FieldByName('DESCCUSTORECIMO').AsString) + ' - Comp: ' +
                                   cdsIntegra.FieldByName('MESCOMPETENCIA').AsString + '/' +
                                   cdsIntegra.FieldByName('ANOCOMPETENCIA').AsString + ' - Contr: ' +
                                   cdsIntegra.FieldByName('CONNUMERO').AsString + ' - ' +
                                   cdsIntegra.FieldByName('CONNOME').AsString, 1, 60)
         else
           sHistComp := cdsIntegra.FieldByName('OBS').AsString
      end
      else begin
// Daniel - 22993 - Início -----------------------------------------------------
         if (cdsIntegra.FieldByName('OBS').IsNull) then
           sHistComp := Copy(Trim(cdsIntegra.FieldByName('DESCCUSTORECIMO').AsString)+' - Comp: '+
                                  cdsIntegra.FieldByName('MESCOMPETENCIA').AsString+'/'+
                                  cdsIntegra.FieldByName('ANOCOMPETENCIA').AsString,1,60)
         else
           sHistComp := cdsIntegra.FieldByName('OBS').AsString;

      end;
// Daniel - 22993 - Fim --------------------------------------------------------

// Daniel - 26104 - Início -----------------------------------------------------
      CtrlParamMulta.BuscaParamMulta(rParamMulta,
                                     cdsIntegra.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                     cdsIntegra.FieldByName('IDTIPOCUSTORECIMO').AsInteger,
                                     cdsIntegra.FieldByName('DATAVENCIMENTO').AsDateTime);

      dDataLimite := ComunsImobiliarioDB.DataLimite(cdsIntegra.FieldByName('DATAVENCIMENTO').AsDateTime,
                                                    cdsIntegra.FieldByName('IDCIDADES').AsInteger,
                                                    cdsIntegra.FieldByName('IDPAIS').AsInteger,
                                                    rParamMulta.iDiasTolerancia,
                                                    rParamMulta.iDiasRepasse,
                                                    cdsIntegra.FieldByName('CODESTADO').AsString,
                                                    rParamMulta.sFlgTipoDiasTolera,
                                                    rParamMulta.sFlgTipoDiasRepasse,
                                                    True,False,False);
// Daniel - 26104 - Fim --------------------------------------------------------

// Daniel - 27007 - Início -----------------------------------------------------
      // Atualiza a data limite de vencimento...
      sSql := 'UPDATE LANCAMENTOSIMOVEL '                                                                           +#13+
              '  SET DATALIMITE  = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataLimite))+',''DD/MM/YYYY'')' +#13+
              'WHERE IDDOCUMENTO = '+IntToStr(cdsIntegra.FieldByName('IDDOCUMENTO').AsInteger);
      if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
// Daniel - 27007 - Fim --------------------------------------------------------

      // Define Data Programada
      if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then begin
         if CtrlModuloImobiliario.AdminImob.FLGTIPODATAPROG = 'V' then begin
            dDataProgramada := cdsIntegra.FieldByName('DATAVENCIMENTO').AsDateTime;
         end else begin
            dDataProgramada := dDataLimite;
         end;
      end else begin
         dDataProgramada := cdsIntegra.FieldByName('DATAVENCIMENTO').AsDateTime;
      end;

      cdsIntegra.First;
      if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then
           sDebCre := 'C'
      else sDebCre := 'D';

      // Verifica segregação, caso imovel 100% de um plano, contabiliza no plano, senão, contabiliza em operações comuns
      {if cdsIntegra.FieldByName('IDPATRO').AsInteger > 0 then
           iIdPatro := cdsIntegra.FieldByName('IDPATRO').AsInteger
      else iIdPatro := CtrlParamIntegra.PatroGlobal;
      if cdsIntegra.FieldByName('IDPLANOPREV').AsInteger > 0 then
           iIdPlanoPrev := cdsIntegra.FieldByName('IDPLANOPREV').AsInteger
      else iIdPlanoPrev := CtrlParamIntegra.PlanoPrevGlobal;}


      if cdsIntegra.FieldByName('FLGORIGEMLANC').AsString = 'V' then
           sOperacao := '12'  // previsão
      else sOperacao := '2';  // lançamento efetivo

      // Recupera o CodDocumento guardado no momento da inclusão do documento
      vParamContabeis[0].iCodDocumento := cdsIntegra.FieldByName('IDDOCUMENTO').AsInteger;

      // Recupera o Nr. da AP para os documentos alterados
      if cdsIntegra.FieldByName('NUMAPALT').AsInteger > 0 then
           iNumAp := cdsIntegra.FieldByName('NUMAPALT').AsInteger
      else iNumAp := 0;

      // Recupera o Nr. da Planilha gerada pelo CAF para associar ao documento (INVESTIMOB)
      if (ParamSistema.IdModulo = 54) and (vParamContabeis[0].iPlanilha <= 0) then begin
         try
           sSql := 'SELECT PLNCODIGO FROM CAFOBRALANC WHERE IDLANCIMOVEL = ' +
                    cdsIntegra.FieldByName('IDLANCIMOVEL').AsString;
           cdsTemp := TCMClientDataSet.Create( nil );
           cdsTemp.Data := GetDataPacket(sSql);
           if not cdsTemp.FieldByName('PLNCODIGO').IsNull then begin
              vParamContabeis[0].iPlanilha := cdsTemp.FieldByName('PLNCODIGO').AsInteger;
           end;
         finally
           FreeAndNil( cdsTemp );
         end;
      end;

        // Verifica o total do documento
        TotalDocumIntegrar(vParamContabeis[0].iCodDocumento, fVlrTotalDoc, fVlrTotalDocOM );

        // Agrupa Multipas Contas de Baixa
        vLancaBM  := nil;
        bBaixaMultipla := AgrupaMultContaBaixa(vParamContabeis, vLancaBM);

        // Agrupa RateioDocum
        vRateioDocum  := nil;
        AgrupaRateioDocum(vParamContabeis, vRateioDocum);

        // Busca o critério de segregação
        //Comentado para atender chamado KINTANA Nº 394180, SOL Nº92381
        if bBaixaMultipla then
             iIdSegrega := -1
        else iIdSegrega := vParamContabeis[0].iIdSegregaCriter;

        // tratamento p/ Outra Moeda
        if cdsIntegra.FieldByName('RECPAG').AsString = 'R' then begin
          iMoeda := cdsIntegra.FieldByName('MOEDARECEB').AsInteger;
          if ( (cdsIntegra.FieldByName('MOEDARECEB').IsNull) or (cdsIntegra.FieldByName('MOEDARECEB').AsInteger = CtrlModuloImobiliario.Global.iMoedaCorrente) ) then begin
             iMoeda         := -1;
             fVlrTotalDocOM :=  0;
          end;
        end else begin
          iMoeda := cdsIntegra.FieldByName('MOEDAPAGAR').AsInteger;
          if ( (cdsIntegra.FieldByName('MOEDAPAGAR').IsNull) or (cdsIntegra.FieldByName('MOEDAPAGAR').AsInteger = CtrlModuloImobiliario.Global.iMoedaCorrente) ) then begin
             iMoeda         := -1;
             fVlrTotalDocOM :=  0;
          end;
        end;

        // tenta converter a subcontadebcred se não conseguir atribui -1
        if vParamContabeis[0].sSubContaDebCred = '' then
             iSubContaDebCred := -1
        else iSubContaDebCred := StrToInt(vParamContabeis[0].sSubContaDebCred);

        sCentroCusto := cdsIntegra.FieldByName('CODCENTROCUSTO').AsString;
        if length(trim(sCentroCusto)) = 0 then sCentroCusto := CtrlModuloImobiliario.AdminImob.sCodCentroCusto;

        iFormaPagto := -1;
        if not(cdsIntegra.FieldByName('CODFORMA').IsNull) then
          iFormaPagto := cdsIntegra.FieldByName('CODFORMA').AsInteger
        else
        begin
           // Marchetti - Pendencias 25137, 25138 e 25139
          _cds.Data := GetDataPacket('SELECT CODFORMA FROM PORTADORFORMA WHERE NVL(FLGATIVO, ''S'') = ''S'' AND CODPORTFORMA = ' + cdsIntegra.FieldByName('CODPORTFORMA').AsString);
           // Fim Marchetti - Pendencias 25137, 25138 e 25139
          if not _cds.FieldByName('CODFORMA').IsNull then
             iFormaPagto := _cds.FieldByName('CODFORMA').AsInteger;
        end;

        fVlrOrca := 0;
        if not(cdsIntegra.FieldByName('IDRESERVAORCAMEN').IsNull) then
          fVlrOrca := fVlrTotalDoc;

        CtrlImobDocumento.OpenTransaction := False;
        CtrlImobDocumento.Prepare( OpDocumentoImob, odlEfetivoImob, sdocAbertoImob );
        CtrlImobDocumento.UsaPlanoPatro := ParamSistema.UsaPlanoPatro;
        CtrlImobDocumento.IdUsuario     := ParamSistema.idUsuario;
        CtrlImobDocumento.IdEspAcesso   := ParamSistema.idEspAcesso;
        CtrlImobDocumento.IdModulo      := ParamSistema.idModulo;
        CtrlImobDocumento.DataDisponibilidade := dDataProgramada;

        // Seta valores para Documento
        CtrlImobDocumento.SetValues(vParamContabeis[0].iCodDocumento,
                                cdsIntegra.FieldByName('NODOCUMENTO').AsFloat, '', '',
                                cdsIntegra.FieldByName('RECPAG').AsString,
                                sOperacao,'','',
                                vParamContabeis[0].sContaDebCred,
                                vParamContabeis[0].sCentroCustoDebCred,
                                '','','','','','',
                                cdsIntegra.FieldByName('REFERENCIAAP').AsString,
                                vParamContabeis[0].sHistoricoCapCar,
                                cdsIntegra.FieldByName('DATAVENCIMENTO').AsDateTime,
                                cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                dDataProgramada,
                                0,0,0,0,0,0,0,0,
                                cdsIntegra.FieldByName('CODTIPDOC').AsInteger,
                                ParamSistema.idEmpresa, ParamSistema.idModulo,
                                cdsIntegra.FieldByName('IDFORCLI').AsInteger,
                                0,
                                cdsIntegra.FieldByName('IDCBANCARIA').AsInteger,
                                vParamContabeis[0].iUnidNegoc,
                                CtrlParamIntegra.Plano,
                                0, iNumAp, iMoeda, 0, 0,
                                ParamSistema.idUsuario, ParamSistema.idEmpresa, 1, 0,
                                iSubContaDebCred,
                                cdsIntegra.FieldByName('CODPORTFORMA').AsInteger,
                                0,0, iFormaPagto, //iIdSegrega, Comentado para atender chamado KINTANA Nº 394180, SOL Nº92381
                                vParamContabeis[0].iIdSegregaCriter,
                                vParamContabeis[0].sContaContabilAntecipa

                                //Cássio Rovaroto - SIG n 23656.59199 - Início
                                , cdsIntegra.FieldByName('NFSNUMERO').AsString,
                                cdsIntegra.FieldByName('NFSSERIE').AsString,
                                cdsIntegra.FieldByName('NFSDATAEMISSAO').AsDateTime,
                                cdsIntegra.FieldByName('NFSOBS').AsString
                                //Cássio Rovaroto - SIG n 23656.59199 - Fim
                                , cdsIntegra.FieldByName('NFSSERVICO').AsInteger //Cássio Rovaroto - SIG nº 123523
                                );

        // Seta valores para LanctoDocum
        CtrlImobDocumento.Lanctodocum.SetValues(cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                            vParamContabeis[0].iCodDocumento, 0,
                                            fVlrTotalDoc, fVlrTotalDocOM, fVlrTotalDoc,
                                            vParamContabeis[0].iUnidNegoc,
                                            vParamContabeis[0].iPlanilha, 0,
                                            ParamSistema.idUsuario,
                                            ParamSistema.idEmpresa, 0,0,
                                            cdsIntegra.FieldByName('CODTIPDOC').AsInteger,0,0,
                                            sOperacao, '','','',
                                            sHistComp,
                                            '','','',sDebCre,
                                            ParamSistema.idModulo,
                                            CtrlParamIntegra.Plano,
                                            ParamSistema.UsaPlanoPatro, True);

        // Seta valores para RateioDocum
        for i := 0 to Length(vRateioDocum) -1 do
        begin
           if fVlrTotalDocOM = 0 then
                fVlrRateioOM := 0
           else fVlrRateioOM := vRateioDocum[i].VlrTotalOM;

           // André Pontes - 09/06/2005 - pendência 19283
           sCentroCustoUso := sCentroCusto;
           if vRateioDocum[i].CodCentroCusto <> '' then sCentroCustoUso := vRateioDocum[i].CodCentroCusto;
           // FIM André Pontes - 09/06/2005 - pendência 19283

           CtrlImobDocumento.Rateiodocum.SetValues(vRateioDocum[i].VlrTotal,     // valor
                                               fVlrRateioOM,                 // valor outra moeda
                                               fVlrOrca,                     // valor orçamento
                                               0,
                                               ParamSistema.IdEmpresa,
                                               vParamContabeis[0].iCodDocumento,
                                               vParamContabeis[0].iUnidNegoc,
                                               0,ParamSistema.idUsuario,
                                               cdsIntegra.FieldByName('IDRESERVAORCAMEN').AsInteger,
                                               CtrlParamIntegra.Plano,
                                               vRateioDocum[i].IdPlanoImovel,
                                               vRateioDocum[i].IdPatroImovel,
                                               CtrlModuloImobiliario.AdminImob.iPrograma,
                                               0,
                                               ParamSistema.IdEmpresa,
                                               // Marchetti - Pendencia 26528
                                               vRateioDocum[i].sCodTipRecDes,
                                               // Fim Marchetti - Pendencia 26528
                                               cdsIntegra.FieldByName('RECPAG').AsString,
                                               vRateioDocum[i].CentroRespon,
                                               sCentroCustoUso, // André Pontes - 09/06/2005 - pendência 19283
                                               //'', False
                                               sIdImovel, True
                                               //Cássio Rovaroto - SIG nº 23656.59199 - Início
                                               , 0,
                                               0,
                                               -1
                                              );
          cdsIntegra.Next;
        end;

        // Seta valores para Multiplas Contas de Baixa
        if bBaixaMultipla then begin
           for i := 0 to Length(vLancaBM) -1 do begin
              CtrlImobDocumento.CcBaixasxDocum.SetValues(vLancaBM[i].VlrTotal, 0,
                                                     ParamSistema.idEmpresa,
                                                     vParamContabeis[0].iCodDocumento,
                                                     vLancaBM[i].Parametros.iUnidNegoc,
                                                     CtrlParamIntegra.Plano,
                                                     vLancaBM[i].IdPlanoImovel,
                                                     vLancaBM[i].IdPatroImovel,
                                                     vLancaBM[i].Parametros.iIdSegregaCriter,
                                                     vLancaBM[i].Parametros.sContaDebCred );
           end;
        end;
      if not CtrlImobDocumento.Insert then
        raise exception.Create(CtrlImobDocumento.MessageInfo);

   except
      on e:exception do begin
         Result.iCodErro  := -31;   // Não conseguiu criar o documento e o LanctoDocum
         Result.sMensErro := e.Message;
      end;
   end;
end;



//========================================================================================
// Função INTERNA para agrupar os lançamentos com a mesma conta de baixa e determinar se
// o lançamento é do tipo de Multipla Conta de Baixa
// Data : 29/12/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vParamContabeis - vetor com os parämetros de integração ( 1 reg por imovel )
//       vLancaBM        - vetor para retorno dos registros para baixa multipla
//
// Retorno : True  - Efetua baixa em conta multipla
//           False - Efetua baixa em conta unica
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.AgrupaMultContaBaixa(const vParamContabeis: array of TParamContabeisMT; var vLancaBM: TLancaBM): Boolean;
var
   iRegistro, i, x, iIdPatro, iIdPlanoPrev : Integer;
   bNovoLancto : Boolean;
   cdsAux : TClientDataSet;
   //Cássio - SOL Nº 131563 KINTANA Nº 750679
   dValorTotalMult, dValorMult  : Double;
begin
  //Cássio - SOL Nº 133781 KINTANA Nº 781998 - Início
  Result    := False;
  iRegistro   := 0;
  i           := 0;
  x           := 0;
  cdsAux := TClientDataSet.Create(nil);
  dValorMult := 0;
  dValorTotalMult := 0;

  try
    cdsIntegra.First;
    while not cdsIntegra.Eof do
    begin
      if cdsIntegra.FieldByName('IDCONTRATOIMOVEL').asInteger > 0  then
        cdsAux.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsIntegra.FieldByName('IDCONTRATOIMOVEL').asInteger)
      else
        cdsAux.Data := ComunsImobiliarioDB.BuscaPlanoPatroxImovel(cdsIntegra.fieldByName('IDIMOVEL').asInteger);

      bNovoLancto := True;
      dValorMult := 0;
      dValorTotalMult := 0;

      while not cdsAux.Eof do
      begin
        iIdPlanoPrev := cdsAux.FieldByName('IDPLANOPREV').asInteger;
        iIdPatro := cdsAux.FieldByName('IDPATRO').asInteger;

        for i := 0 to Length(vLancaBM)-1 do
        begin
          if (vParamContabeis[iRegistro].sContaDebCred       = vLancaBM[i].Parametros.sContaDebCred)       and
             (vParamContabeis[iRegistro].sCentroCustoDebCred = vLancaBM[i].Parametros.sCentroCustoDebCred) and
             (vParamContabeis[iRegistro].iUnidNegoc          = vLancaBM[i].Parametros.iUnidNegoc)          and
             (vParamContabeis[iRegistro].sSubContaDebCred    = vLancaBM[i].Parametros.sSubContaDebCred)    and
             (vParamContabeis[iRegistro].iIdSegregaCriter    = vLancaBM[i].Parametros.iIdSegregaCriter)    then
          begin
            if vLancaBM[i].IdPlanoImovel = iIdPlanoPrev then
            begin
              bNovoLancto := False;
              if cdsAux.RecNo = cdsAux.RecordCount then
              begin
                if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                begin
                  dValorMult :=  (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - dValorTotalMult);
                  vLancaBM[i].VlrTotal := vLancaBM[i].VlrTotal + dValorMult;
                end
                else
                begin
                  dValorMult :=  (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - dValorTotalMult);
                  vLancaBM[i].VlrTotal := vLancaBM[i].VlrTotal + dValorMult;
                end;
              end
              else
              begin
                if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                begin
                  dValorMult := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                  vLancaBM[i].VlrTotal := vLancaBM[i].VlrTotal + dValorMult;
                end
                else
                begin
                  dValorMult := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                  vLancaBM[i].VlrTotal := vLancaBM[i].VlrTotal + dValorMult;
                end;
              end;
              dValorTotalMult := dValorTotalMult + dValorMult;
              Break;
            end
            else
              bNovoLancto :=  True;
          end;
        end;

        if bNovoLancto then
        begin
          SetLength(vLancaBM,(Length(vLancaBM)+1) );
          i := High(vLancaBM);
          vLancaBM[i].Parametros    := vParamContabeis[iRegistro];
          vLancaBM[i].IdUsuario     := cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger;
          vLancaBM[i].NoDocumento   := cdsIntegra.FieldByName('NODOCUMENTO').AsFloat;
          vLancaBM[i].dLancto       := cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime;
          vLancaBM[i].IdPatroImovel := iIdPatro;
          vLancaBM[i].IdPlanoImovel := iIdPlanoPrev;

          bNovoLancto := False;

          if cdsAux.RecNo = cdsAux.RecordCount then
          begin
            if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
              vLancaBM[i].VlrTotal :=  (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - dValorTotalMult)
            else
              vLancaBM[i].VlrTotal :=  (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - dValorTotalMult);
          end
          else
          begin
            if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
              vLancaBM[i].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2)
            else

              vLancaBM[i].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
          end;
          dValorTotalMult := dValorTotalMult + vLancaBM[i].VlrTotal;
        end;

        CdsAux.Next;
      end;

      cdsIntegra.Next;
      inc(iRegistro);

    end;
  finally
    FreeAndNil(cdsAux);
  end;

  if Length(vLancaBM) > 1 then
    Result := True;

   cdsIntegra.First;
  //Cássio - SOL Nº 133781 KINTANA Nº 781998 -  Fim
end;


//========================================================================================
// Função INTERNA para agrupar os lançamentos com o mesmo critério de Rateio do documento
// Data : 13/01/2005                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vParamContabeis - vetor com os parämetros de integração ( 1 reg por imovel )
//       vRateioDocum    - vetor para retorno dos registros para rateio
//
// Retorno : True  - Efetua baixa em conta multipla
//           False - Efetua baixa em conta unica
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.AgrupaRateioDocum(const vParamContabeis: array of TParamContabeisMT;
                                                  var vRateioDocum: TRateioDocum): Boolean;
var
   iRegistro, x, iIdPatro, iIdPlanoPrev : Integer;
   bNovoLancto, bAgrupRateio : Boolean;
   dValorTotal, dValor, dValorTotalOM, dValorOM : Double;
   cdsAux : TClientDataSet;
begin
  Result      := False;
  iRegistro   := 0;
  x           := 0;
  bNovoLancto := True;
  dValorTotal := 0;
  dValor      := 0;
  cdsIntegra.First;
  bAgrupRateio := False;

  cdsAux := TClientDataSet.Create(nil);
  try
    while not cdsIntegra.Eof do
    begin
      if cdsIntegra.FieldByName('IDCONTRATOIMOVEL').asInteger > 0  then
        cdsAux.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsIntegra.FieldByName('IDCONTRATOIMOVEL').asInteger)
      else
        cdsAux.Data := ComunsImobiliarioDB.BuscaPlanoPatroxImovel(cdsIntegra.fieldByName('IDIMOVEL').asInteger);

      dValorTotal := 0;
      dValorTotalOM := 0;

      bNovoLancto := True;

      while not cdsAux.Eof do
      begin
        iIdPlanoPrev := cdsAux.FieldByName('IDPLANOPREV').asInteger;
        iIdPatro := cdsAux.FieldByName('IDPATRO').asInteger;

        for x := 0 to Length(vRateioDocum)-1 do
        begin
          if (vParamContabeis[iRegistro].iUnidNegoc        = vRateioDocum[x].iUnidNegoc)     and
             (vParamContabeis[iRegistro].sCodCentroRespon  = vRateioDocum[x].CentroRespon)   and
             (vParamContabeis[iRegistro].sCodTipRecDes     = vRateioDocum[x].sCodTipRecDes)  and
             (vParamContabeis[iRegistro].sCodCentroCusto   = vRateioDocum[x].CodCentroCusto)   then
          begin
            if vRateioDocum[x].IdPlanoImovel = iIdPlanoPrev then
            begin
              bNovoLancto := False;
              if cdsAux.RecNo = cdsAux.RecordCount then
              begin
                if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                begin
                  dValor :=  (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - dValorTotal);
                  dValorOM := (cdsIntegra.FieldByName('VLRLANCOMPAGAR').asFloat - dValorTotalOM);
                  vRateioDocum[x].VlrTotal := vRateioDocum[x].VlrTotal + dValor;
                  vRateioDocum[x].VlrTotalOM := vRateioDocum[x].VlrTotalOM + dValorOM;
                end
                else
                begin
                  dValor :=  (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - dValorTotal);
                  dValorOM :=  (cdsIntegra.FieldByName('VLRLANCOMRECEB').asFloat - dValorTotalOM);
                  vRateioDocum[x].VlrTotal := vRateioDocum[x].VlrTotal + dValor;
                  vRateioDocum[x].VlrTotalOM := vRateioDocum[x].VlrTotalOM + dValorOM;
                end;
              end
              else
              begin
                if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                begin
                  dValor := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                  dValorOM := RoundCM((cdsIntegra.FieldByName('VLRLANCOMPAGAR').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);

                  vRateioDocum[x].VlrTotal := vRateioDocum[x].VlrTotal + dValor;
                  vRateioDocum[x].VlrTotalOM := vRateioDocum[x].VlrTotalOM + dValorOM;
                end
                else
                begin
                  dValor := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                  dValorOM := RoundCM((cdsIntegra.FieldByName('VLRLANCOMRECEB').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);

                  vRateioDocum[x].VlrTotal := vRateioDocum[x].VlrTotal + dValor;
                  vRateioDocum[x].VlrTotalOM := vRateioDocum[x].VlrTotalOM + dValorOM;
                end;
              end;
              dValorTotal := dValorTotal + dValor;
              dValorTotalOM := dValorTotalOM + dValorOM;
              Break;
            end
            else
              bNovoLancto :=  True;
          end;
        end;

        if bNovoLancto then
        begin
          SetLength(vRateioDocum,(Length(vRateioDocum)+1) );
          x := High(vRateioDocum);
          vRateioDocum[x].iUnidNegoc       := vParamContabeis[iRegistro].iUnidNegoc;
          vRateioDocum[x].CentroRespon     := vParamContabeis[iRegistro].sCodCentroRespon;
          vRateioDocum[x].sCodTipRecDes    := vParamContabeis[iRegistro].sCodTipRecDes;
          vRateioDocum[x].CodCentroCusto   := vParamContabeis[iRegistro].sCodCentroCusto;
          vRateioDocum[x].IdPatroImovel    := iIdPatro;
          vRateioDocum[x].IdPlanoImovel    := iIdPlanoPrev;

          bNovoLancto := False;

          if cdsAux.RecNo = cdsAux.RecordCount then
          begin
            if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
            begin
              vRateioDocum[x].VlrTotal :=  (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - dValorTotal);
              vRateioDocum[x].VlrTotalOM :=  (cdsIntegra.FieldByName('VLRLANCOMPAGAR').asFloat - dValorTotal)
            end
            else
            begin
              vRateioDocum[x].VlrTotal :=  (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - dValorTotal);
              vRateioDocum[x].VlrTotalOM :=  (cdsIntegra.FieldByName('VLRLANCOMRECEB').asFloat - dValorTotal)
            end;
          end
          else
          begin
            if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
            begin
              vRateioDocum[x].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
              vRateioDocum[x].VlrTotalOM := RoundCM((cdsIntegra.FieldByName('VLRLANCOMPAGAR').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
            end
            else
            begin
              vRateioDocum[x].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
              vRateioDocum[x].VlrTotalOM := RoundCM((cdsIntegra.FieldByName('VLRLANCOMRECEB').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
            end;
          end;
          dValorTotal := dValorTotal + vRateioDocum[x].VlrTotal;
          dValorTotalOM := dValorTotalOM + vRateioDocum[x].VlrTotalOM;
        end;

        CdsAux.Next;
      end;

      cdsIntegra.Next;
      inc(iRegistro);

    end;
  finally
    FreeAndNil(cdsAux);
  end;

  if Length(vRateioDocum) > 1 then
    Result := True;
  cdsIntegra.First;
  //Cássio - SOL Nº 133781 KINTANA Nº 781998 -  Fim
end;



//========================================================================================
// Função INTERNA para integrar os alteradores lançados no documento
// Data : 30/12/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - id do Documento
// Retorno :
//       Result.iCodErro    - Retorna o código de erro
//       Result.iMensErro   - Retorna a mensagem do erro
//
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.IntegraAlteradores(const iDocumento: integer): TMensErro;
var cdsAlterador : TCMClientDataSet;
    // Helen - SOL: 127213 KTN: 672023
    iIDIndCorr : Integer; dVencto,dFimFator,dIniFator : TDateTime;
    ano,mes,dia: Word; fFator , fVlrFator: Extended;
    iAcres : Boolean;
    // Helen - SOL: 127213 KTN: 672023 - FIM
begin
   Result.iCodErro := 0;
   try
      try
         // Busca os Alteradores do document0
         cdsAlterador      := TCMClientDataSet.Create( nil );
         //Marcio Sanches Spinosa SOL 222296 KINTANA 2055368 - Inicio
         if not (pisMultiplaDespesa) then
           cdsAlterador.Data := LookupAlteradoresDocum(iDocumento)
         else
           cdsAlterador.Data := pCdsAlterador.data;
         //Marcio Sanches Spinosa SOL 222296 KINTANA 2055368 - Fim  

         if not cdsAlterador.IsEmpty then
         begin
          // Lança os Alteradores
          while (not cdsAlterador.Eof) and (Result.iCodErro = 0) do
          begin
            // Prepara a função para lançar os alteradores
            CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
            CtrlImobDocumento.OpenTransaction := False;
            CtrlImobDocumento.PartidaDobrada  := CtrlParamIntegra.PartidaDobrada;
            CtrlImobDocumento.UsaPlanoPatro   := ParamSistema.UsaPlanoPatro;
            CtrlImobDocumento.IdUsuario       := ParamSistema.idUsuario;
            CtrlImobDocumento.IdEspAcesso     := ParamSistema.idEspAcesso;
            CtrlImobDocumento.IdModulo        := ParamSistema.idModulo;

            CtrlImobDocumento.Lanctodocum.SetValues(
                           CdsAlterador.FieldByName('DATALANCTO').AsDateTime,
                           iDocumento, 0,
                           cdsAlterador.FieldByName('VLRALTERADOR').AsFloat, 0,
                           cdsAlterador.FieldByName('VLRALTERADOR').AsFloat,            
                           -1, 0, 0, ParamSistema.idUsuario, ParamSistema.idEmpresa,
                           0, 0, 0, 0,
                           cdsAlterador.FieldByName('CODALTERADOR').AsInteger, '4',
                           '', '', '',
                           cdsAlterador.FieldByName('OBSERVACAO').AsString, '', '', '',
                           cdsAlterador.FieldByName('ACRESDECRES').AsString,
                           ParamSistema.idModulo,
                           CtrlParamIntegra.Plano,
                           ParamSistema.UsaPlanoPatro, True
                           //Cássio Rovaroto - SIG nº 115585 - Início
                           , 0, 0, '', 0, 0,
                           cdsAlterador.FieldByName('IDTIPOSERVICO').AsInteger,
                           cdsAlterador.FieldByName('IDPROCESSO').AsInteger,
                           cdsAlterador.FieldByName('VALORBASERETENCAO').asFloat
                           //Cássio Rovaroto - SIG nº 115585 - Fim
                           ,cdsAlterador.FieldByName('IDENVIODOCUMENTO').asFloat  //Ewerton Beltramini - SIG 116142      //edilaine SIG123435
                           );

            if not CtrlImobDocumento.Insert then
              raise exception.Create( CtrlImobDocumento.MessageInfo );
            cdsAlterador.Next;
          end;
         end;
         // Helen - SOL: 127213 KTN: 672023
         cdsIntegra.First;
         while not cdsIntegra.eof do
         begin
             fFator        := 1;
             fVlrFator     := 0;
             iIDIndCorr    := VerificaCorrecao(cdsIntegra.FieldByName('IDCONDPAGAQUISPARC').AsFloat) ;
             if iIDIndCorr  > 0 then
             begin
                  dVencto    :=  cdsIntegra.FieldByName('DATAVENCIMENTO').asDateTime;
                  DecodeDate(dVencto, ano, mes, dia);
                  dIniFator := StrToDate('01'+ '/' + IntToStr(mes) + '/' +IntToStr(ano)) ;
                  dFimFator := DiasUteis.UltDiaMes(ano, mes);
                  fVlrFator := Arredonda(ComunsImobiliarioDB.CalcCM(cdsIntegra.FieldByName('VLRLANCPAGAR').AsFloat,
                                                     iIDIndCorr,
                                                     dIniFator ,
                                                     dFimFator, False,
                                                     iMesRefReajuste), 2);
             end;
             if fVlrFator > 0 then
             begin
                 iAcres := InsereMovAcresCorr(abs(fVlrFator));
                 if iAcres then
                 begin
                     CtrlImobDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
                     CtrlImobDocumento.OpenTransaction := False;
                     CtrlImobDocumento.PartidaDobrada  := CtrlParamIntegra.PartidaDobrada;
                     CtrlImobDocumento.UsaPlanoPatro   := ParamSistema.UsaPlanoPatro;
                     CtrlImobDocumento.IdUsuario       := ParamSistema.idUsuario;
                     CtrlImobDocumento.IdEspAcesso     := ParamSistema.idEspAcesso;
                     CtrlImobDocumento.IdModulo        := ParamSistema.idModulo;
                     CtrlImobDocumento.Lanctodocum.SetValues(
                                       cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                       iDocumento, 0,
                                       fVlrFator, 0,
                                       fVlrFator,
                                       -1, 0, 0, ParamSistema.idUsuario, ParamSistema.idEmpresa,
                                       0, 0, 0, 0,
                                       524, '4',
                                       '', '', '',
                                       'Acres.Correção - Aquis.Parc', '', '', '',
                                       sAcresDecres,
                                       ParamSistema.idModulo,
                                       CtrlParamIntegra.Plano,
                                       ParamSistema.UsaPlanoPatro,
                                       False); // False = Não gera PLNCODIGO - Será na HistoricoMovimentação

                     if not CtrlImobDocumento.Insert then
                        raise exception.Create( CtrlImobDocumento.MessageInfo );
                 end
                 else
                 begin
                      raise exception.Create('Erro ao Lançar Acréscimo de Valor para Correção Monetária. Verifique fechamento do CAF.');
                 end


             end;                    
             cdsIntegra.next;
         end;
         // Helen - SOL: 127213 KTN: 672023 - FIM
      except
         on e:Exception do begin
           Result.iCodErro  := -85;
           Result.sMensErro := e.Message;
         end;
      end;
   finally
      FreeAndNil( cdsAlterador );
   end;
end;



//========================================================================================
// Função INTERNA para totalizar o valor do documento, somando os lançamentos de cada imovel
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - id do Documento
//       vVlrDoc    - Retorna o valor do documento
//       vVlrDocOM  - Retorna o valor do documento em outra moeda
//
//----------------------------------------------------------------------------------------
procedure TCtrlLancamentosImovel.TotalDocumIntegrar(const iDocumento:Integer; var rVlrDoc, rVlrDocOM: Extended);
var cdsTemp: TCMClientDataSet;
    sSql : string;
begin
  try
    sSql := 'SELECT SUM(DECODE(RECPAG,''R'',NVL(VLRLANCRECEB,0), NVL(VLRLANCPAGAR,0))) AS TOT_DOCUM,      '+#13+
            '       SUM(DECODE(RECPAG,''R'',NVL(VLRLANCOMRECEB,0), NVL(VLRLANCOMPAGAR,0))) AS TOT_DOCUMOM '+#13+
            '  FROM LANCAMENTOSIMOVEL ' +#13+
            ' WHERE IDDOCUMENTO = ' + IntToStr(iDocumento);

    cdsTemp := TCMClientDataSet.Create( nil );
    cdsTemp.Data := GetDataPacket( sSql );

    rVlrDoc   := cdsTemp.FieldByName('TOT_DOCUM').AsFloat;
    rVlrDocOM := cdsTemp.FieldByName('TOT_DOCUMOM').AsFloat;
  finally
    FreeAndNil( cdsTemp );
  end;
end;



//========================================================================================
// Função INTERNA para gravar as linhas de mensagem de boleto de cobrança e marcar o boleto
// para impressão
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iDocumento - id do Documento
//
// Retorno : TMensErro.iCodErro  - Código do Erro
//                    .sMensErro - Mensagem do Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.SetMensagemCNAB(const iDocumento: integer): TMensErro;
var vMsgCnab : array[0..8] of string;
    cdsTemp  : TCMClientDataSet;
    sSql     : String;
    i        : integer;
    bGrava   : Boolean;
begin
  Result.iCodErro := 0;
  try
    try
      // Busca a mensagem do Boleto
      cdsTemp := TCMClientDataSet.Create( nil );
      cdsTemp.Data := CtrlMsgBoleto.LookupMsgBoletoComLinhas(-1, iDocumento, -1);

      // atribui as mensagens para o vetor
      vMsgCnab[0] := cdsTemp.FieldByName('TEXTOLINHA_1').AsString;
      vMsgCnab[1] := cdsTemp.FieldByName('TEXTOLINHA_2').AsString;
      vMsgCnab[2] := cdsTemp.FieldByName('TEXTOLINHA_3').AsString;
      vMsgCnab[3] := cdsTemp.FieldByName('TEXTOLINHA_4').AsString;
      vMsgCnab[4] := cdsTemp.FieldByName('TEXTOLINHA_5').AsString;
      vMsgCnab[5] := cdsTemp.FieldByName('TEXTOLINHA_6').AsString;
      vMsgCnab[6] := cdsTemp.FieldByName('TEXTOLINHA_7').AsString;
      vMsgCnab[7] := cdsTemp.FieldByName('TEXTOLINHA_8').AsString;
      vMsgCnab[8] := cdsTemp.FieldByName('TEXTOLINHA_9').AsString;

      // Verifica se existe mensagem para gravar no CapCar
      bGrava := False;
      for i := 0 to Length(vMsgCnab) - 1 do if vMsgCnab[i] <> '' then bGrava := True;

      // Grava Mensagem no CapCar
      if bGrava then
      begin
        {if not CtrlDocumento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMsgCnab ) then
          raise exception.Create( CtrlDocumento.MessageInfo );}
        if not CtrlImobDocumento.IntBanco.SetaMensagensCNAB(iDocumento, -1, vMsgCnab ) then
          raise exception.Create( CtrlImobDocumento.MessageInfo );
      end;

      // Setar EMISBLOQ = N e CONTROLEREMESSA = NULL para emitir o boleto
      sSql := 'UPDATE DOCUMENTO              '+#13+
              '   SET EMISBLOQ = ''N'',      '+#13+
              '       CONTROLEREMESSA = NULL '+#13+
              ' WHERE CODDOCUMENTO = ' + IntToStr(iDocumento);
      if not ExecSQL( sSql ) then
        raise exception.create( 'Erro ao atualizar a mensagem do boleto' );
    except
      on e:Exception do begin
        Result.iCodErro  := -37;
        Result.sMensErro := e.Message;
      end;
    end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;



//========================================================================================
// Função INTERNA para integrar os vários imóveis do documento com a contábilidade
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vParamContabeis - vetor de Record com os parâmetros para integração de
//                         cada imóvel da cdsIntegra
//
// Retorno : Result.iCodErro  - Código do Erro
//                 .sMensErro - Mensagem do Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.IntegraContabilidade(var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
var iRegistro  : integer;
    fVlrLancto : extended;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';

   // Verifica se o lançamento não deve ser contabilizado - origem: Previsão não integra
   if (not vParamContabeis[0].bFlgIntegraContab) or
      (cdsIntegra.FieldByName('FLGORIGEMLANC').AsString = 'V') then Exit;

   vParamContabeis[0].iPlanilha := 0;
   try
      iRegistro := 0;
      cdsIntegra.First;
      while (not cdsIntegra.Eof) and (Result.iCodErro = 0) do begin

         // salvar o numero da planilha gerado no primeiro lançamento para todas as linhas do vetor
         if iRegistro > 0 then begin
            vParamContabeis[iRegistro].iPlanilha := vParamContabeis[0].iPlanilha;
         end;

         // Verifica os paramentros de integracao
         if Result.iCodErro = 0 then begin
            Result.iCodErro := VerificaParamIntegra(vParamContabeis[iRegistro]);
         end;

         // Verifica o valor a Pagar ou Receber
         if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then
              fVlrLancto := cdsIntegra.FieldByName('VLRLANCPAGAR').AsFloat
         else fVlrLancto := cdsIntegra.FieldByName('VLRLANCRECEB').AsFloat;

         // Faz o lançamento à Débito
         if Result.iCodErro = 0 then begin
            Result := FazerLancamentoContab(vParamContabeis[iRegistro], '0', {0=Débito}
                                            cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                            cdsIntegra.FieldByName('NODOCUMENTO').AsFloat,
                                            fVlrLancto,
                                            cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger,
                                            cdsIntegra.FieldByName('IDPATRO').AsInteger,
                                            cdsIntegra.FieldByName('IDPLANOPREV').AsInteger );
         end;

         // Faz o lançamento à crédito
         if Result.iCodErro = 0 then begin
            Result := FazerLancamentoContab(vParamContabeis[iRegistro], '1',{1=Crédito}
                                            cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                            cdsIntegra.FieldByName('NODOCUMENTO').AsFloat,
                                            fVlrLancto,
                                            cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger,
                                            cdsIntegra.FieldByName('IDPATRO').AsInteger,
                                            cdsIntegra.FieldByName('IDPLANOPREV').AsInteger );
         end;

         // Efetuar o segundo registro contábil
         if (not cdsIntegra.FieldByName('IDOPERCONTAB').IsNull) then begin
            // Grava o mesmo numero de planilha
            vParamOperContab[iRegistro].iPlanilha := vParamContabeis[0].iPlanilha;

            if Result.iCodErro = 0 then begin
               // fazer o lançamento à Débito
               Result := FazerLancamentoContab(vParamOperContab[iRegistro], '0', {0=Débito}
                                               cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                               cdsIntegra.FieldByName('NODOCUMENTO').AsFloat,
                                               fVlrLancto,
                                               cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger,
                                               cdsIntegra.FieldByName('IDPATRO').AsInteger,
                                               cdsIntegra.FieldByName('IDPLANOPREV').AsInteger);
            end;

            if Result.iCodErro = 0 then begin
            // fazer o lançamento à crédito
               Result := FazerLancamentoContab(vParamOperContab[iRegistro], '1',{1=Crédito}
                                               cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                                               cdsIntegra.FieldByName('NODOCUMENTO').AsFloat,
                                               fVlrLancto,
                                               cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger,
                                               cdsIntegra.FieldByName('IDPATRO').AsInteger,
                                               cdsIntegra.FieldByName('IDPLANOPREV').AsInteger);
            end;
         end;

         cdsIntegra.Next;
         inc(iRegistro);
      end;
   except
      on e:exception do begin
         Result.iCodErro := -27;
         if Result.sMensErro = '' then
              Result.sMensErro := e.Message
         else Result.sMensErro := Result.sMensErro + #13 + e.Message;
      end;
   end;
end;



//========================================================================================
// Função INTERNA para integrar os vários imóveis do documento com a contábilidade
//        utilizando PARTIDA DOBRADA
// Data : 03/11/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       vParamContabeis - vetor de Record com os parâmetros para integração de
//                         cada imóvel da cdsIntegra
//
// Retorno : TMensErro.iCodErro  - Código do Erro
//                    .sMensErro - Mensagem do Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.IntegraContabilidadePD(var vParamContabeis, vParamOperContab: array of TParamContabeisMT): TMensErro;
var iRegistro, i, x: integer;
    vLancaPD, vSegOperPD : Array of TContabPD;
    bNovoLancto, bSegOper, bNovoLanctoSegOper, bLancAgrup, bLancAgrupSegOper : Boolean;
    fTotLanc, fTotSegLanc : Extended;
    cdsAux : TClientDataSet;
    iIdPlanoPrev, iIdPatro: Integer;
begin

   Result.iCodErro  := 0;
   Result.sMensErro := '';
   vLancaPD         := nil;
   vSegOperPD       := nil;
   bNovoLancto      := True;
   bNovoLanctoSegOper := True;
   bLancAgrup := False;
   bLancAgrupSegOper := False;
   fTotLanc := 0;
   dValorTotalLancamento := GetValorTotLanc(cdsIntegra.FieldByName('IDDOCUMENTO').asInteger);
   cdsAux := TClientDataSet.Create(nil);
   i := 0;
   x := 0;

   //Cássio - SOL Nº 133781 KINTANA Nº 781998 - Início
   // Verifica se o lançamento não deve ser contabilizado - origem: Previsão não integra
   if (not vParamContabeis[0].bFlgIntegraContab) or
      (cdsIntegra.FieldByName('FLGORIGEMLANC').AsString = 'V') then
    Exit;

   vParamContabeis[0].iPlanilha := 0;
   try
    iRegistro := 0;
    i:= 0;
    cdsIntegra.First;
    bSegOper  := (not cdsIntegra.FieldByName('IDOPERCONTAB').IsNull);

    while (not cdsIntegra.Eof) and (Result.iCodErro = 0) do
    begin
      // Verifica os paramentros de integracao
      if Result.iCodErro = 0 then
        Result.iCodErro := VerificaParamIntegra(vParamContabeis[iRegistro]);

      fTotLanc := 0;
      //Bruno Bastos - Sol: 131100 - Kintana: 744151
      fTotSegLanc := 0;
      if cdsIntegra.FieldByName('IDCONTRATOIMOVEL').asInteger > 0  then
        cdsAux.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(cdsIntegra.FieldByName('IDCONTRATOIMOVEL').asInteger)
      else
        cdsAux.Data := ComunsImobiliarioDB.BuscaPlanoPatroxImovel(cdsIntegra.fieldByName('IDIMOVEL').asInteger);

      bNovoLancto := True;

      while not cdsAux.Eof do
      begin
        iIdPlanoPrev := cdsAux.FieldByName('IDPLANOPREV').asInteger;
        iIdPatro := cdsAux.FieldByName('IDPATRO').asInteger;

        for i := 0 to Length(vLancaPD)-1 do
        begin
          if (vParamContabeis[iRegistro].sContaContabilDebito  = vLancaPD[i].Parametros.sContaContabilDebito)  and
             (vParamContabeis[iRegistro].sSubContaDebito       = vLancaPD[i].Parametros.sSubContaDebito)       and
             (vParamContabeis[iRegistro].sCentroCustoDebito    = vLancaPD[i].Parametros.sCentroCustoDebito)    and
             (vParamContabeis[iRegistro].sContaContabilCredito = vLancaPD[i].Parametros.sContaContabilCredito) and
             (vParamContabeis[iRegistro].sSubContaCredito      = vLancaPD[i].Parametros.sSubContaCredito)      and
             (vParamContabeis[iRegistro].sCentroCustoCredito   = vLancaPD[i].Parametros.sCentroCustoCredito)   and
             (vParamContabeis[iRegistro].sHistoricoCtb         = vLancaPD[i].Parametros.sHistoricoCtb)         and
             (vParamContabeis[iRegistro].sHistoricoCapCar      = vLancaPD[i].Parametros.sHistoricoCapCar)      and
             (vParamContabeis[iRegistro].iExercicio            = vLancaPD[i].Parametros.iExercicio)            and
             (vParamContabeis[iRegistro].iPeriodo              = vLancaPD[i].Parametros.iPeriodo)              and
             (vParamContabeis[iRegistro].iIdRateioDocum        = vLancaPD[i].Parametros.iIdRateioDocum)        and
             (vParamContabeis[iRegistro].iCodDocumento         = vLancaPD[i].Parametros.iCodDocumento)         and
             (vParamContabeis[iRegistro].sContaDebCred         = vLancaPD[i].Parametros.sContaDebCred)         and
             (vParamContabeis[iRegistro].sContaResult          = vLancaPD[i].Parametros.sContaResult)          and
             (vParamContabeis[iRegistro].sCentroCustoResult    = vLancaPD[i].Parametros.sCentroCustoResult)    and
             (vParamContabeis[iRegistro].sSubContaResult       = vLancaPD[i].Parametros.sSubContaResult)       and
             (vParamContabeis[iRegistro].sCentroCustoDebCred   = vLancaPD[i].Parametros.sCentroCustoDebCred)   and
             (vParamContabeis[iRegistro].iUnidNegoc            = vLancaPD[i].Parametros.iUnidNegoc)            and
             (vParamContabeis[iRegistro].sSubContaDebCred      = vLancaPD[i].Parametros.sSubContaDebCred)      and
             (vParamContabeis[iRegistro].sCodTipRecDes         = vLancaPD[i].Parametros.sCodTipRecDes)         and
             (vParamContabeis[iRegistro].sCodCentroRespon      = vLancaPD[i].Parametros.sCodCentroRespon)      and
             (vParamContabeis[iRegistro].sTipCodigo            = vLancaPD[i].Parametros.sTipCodigo)            and
             (vParamContabeis[iRegistro].iIdSegregaCriter      = vLancaPD[i].Parametros.iIdSegregaCriter)      then
          begin
            if vLancaPD[i].idPlanoImovel = iIdPlanoPrev then
            begin
              bNovoLancto := False;
              if cdsAux.RecNo = cdsAux.RecordCount then
              begin
                  if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                    vLancaPD[i].VlrTotal := vLancaPD[i].VlrTotal +(cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - fTotLanc)
                  else
                    vLancaPD[i].VlrTotal := vLancaPD[i].VlrTotal +(cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - fTotLanc);
              end
              else
              begin
                if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                begin
                  fTotSegLanc := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                  vLancaPD[i].VlrTotal := vLancaPD[i].VlrTotal + fTotSegLanc
                end
                else
                begin
                  fTotSegLanc := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                                   cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                  vLancaPD[i].VlrTotal := vLancaPD[i].VlrTotal + fTotSegLanc;
                end;
                fTotLanc := fTotLanc + fTotSegLanc;
              end;
              Break;
            end
            else
              bNovoLancto := True;
          end;
        end;

        if bNovoLancto then
        begin
          bNovoLancto := False;
          SetLength(vLancaPD,(Length(vLancaPD)+1));
          i := High(vLancaPD);
          vLancaPD[i].Parametros    := vParamContabeis[iRegistro];
          vLancaPD[i].IdUsuario     := cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger;
          vLancaPD[i].IdPlanoImovel := iIdPlanoPrev;
          vLancaPD[i].IdPatroImovel := iIdPatro;
          vLancaPD[i].NoDocumento   := cdsIntegra.FieldByName('NODOCUMENTO').AsFloat;
          vLancaPD[i].dLancto       := cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime;

          if cdsAux.RecNo = cdsAux.RecordCount then
          begin
            if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
              vLancaPD[i].VlrTotal := (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - fTotLanc)
            else
              vLancaPD[i].VlrTotal := (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - fTotLanc);
          end
          else
          begin
            if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
              vLancaPD[i].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2)
            else
              vLancaPD[i].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                               cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
            fTotLanc := fTotLanc + vLancaPD[i].VlrTotal;
          end;
        end;                                            

        if bSegOper then
        begin
          bNovoLancto := True;
          for x := 0 to Length(vSegOperPD)-1 do
          begin
            if (vParamOperContab[iRegistro].sContaContabilDebito  = vSegOperPD[x].Parametros.sContaContabilDebito)  and
               (vParamOperContab[iRegistro].sSubContaDebito       = vSegOperPD[x].Parametros.sSubContaDebito)       and
               (vParamOperContab[iRegistro].sCentroCustoDebito    = vSegOperPD[x].Parametros.sCentroCustoDebito)    and
               (vParamOperContab[iRegistro].sContaContabilCredito = vSegOperPD[x].Parametros.sContaContabilCredito) and
               (vParamOperContab[iRegistro].sSubContaCredito      = vSegOperPD[x].Parametros.sSubContaCredito)      and
               (vParamOperContab[iRegistro].sCentroCustoCredito   = vSegOperPD[x].Parametros.sCentroCustoCredito)   and
               (vParamOperContab[iRegistro].sHistoricoCtb         = vSegOperPD[x].Parametros.sHistoricoCtb)         and
               (vParamOperContab[iRegistro].sHistoricoCapCar      = vSegOperPD[x].Parametros.sHistoricoCapCar)      and
               (vParamOperContab[iRegistro].iExercicio            = vSegOperPD[x].Parametros.iExercicio)            and
               (vParamOperContab[iRegistro].iPeriodo              = vSegOperPD[x].Parametros.iPeriodo)              and
               (vParamOperContab[iRegistro].iIdRateioDocum        = vSegOperPD[x].Parametros.iIdRateioDocum)        and
               (vParamOperContab[iRegistro].iCodDocumento         = vSegOperPD[x].Parametros.iCodDocumento)         and
               (vParamOperContab[iRegistro].sContaDebCred         = vSegOperPD[x].Parametros.sContaDebCred)         and
               (vParamOperContab[iRegistro].sContaResult          = vSegOperPD[x].Parametros.sContaResult)          and
               (vParamOperContab[iRegistro].sCentroCustoResult    = vSegOperPD[x].Parametros.sCentroCustoResult)    and
               (vParamOperContab[iRegistro].sSubContaResult       = vSegOperPD[x].Parametros.sSubContaResult)       and
               (vParamOperContab[iRegistro].sCentroCustoDebCred   = vSegOperPD[x].Parametros.sCentroCustoDebCred)   and
               (vParamOperContab[iRegistro].iUnidNegoc            = vSegOperPD[x].Parametros.iUnidNegoc)            and
               (vParamOperContab[iRegistro].sSubContaDebCred      = vSegOperPD[x].Parametros.sSubContaDebCred)      and
               (vParamOperContab[iRegistro].sCodTipRecDes         = vSegOperPD[x].Parametros.sCodTipRecDes)         and
               (vParamOperContab[iRegistro].sCodCentroRespon      = vSegOperPD[x].Parametros.sCodCentroRespon)      and
               (vParamOperContab[iRegistro].sTipCodigo            = vSegOperPD[x].Parametros.sTipCodigo)            and
               (vParamOperContab[iRegistro].iIdSegregaCriter      = vSegOperPD[x].Parametros.iIdSegregaCriter)      then
            begin
              if vSegOperPD[x].idPlanoImovel = iIdPlanoPrev then
              begin
                bNovoLancto :=  False;
                if cdsAux.RecNo = cdsAux.RecordCount then
                begin
                    if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                      vSegOperPD[x].VlrTotal := vSegOperPD[x].VlrTotal + (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - fTotLanc)
                    else
                      vSegOperPD[x].VlrTotal := vSegOperPD[x].VlrTotal + (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - fTotLanc);
                end
                else
                begin
                  if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                    vSegOperPD[x].VlrTotal := vSegOperPD[x].VlrTotal + RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                                     cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2)
                  else
                    vSegOperPD[x].VlrTotal := vSegOperPD[x].VlrTotal + RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                                     cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
                end;
                Break;
              end
              else
                bNovoLancto := True;
            end;
          end;

          if bNovoLancto then
          begin
            bNovoLancto := False;
            SetLength(vSegOperPD,(Length(vSegOperPD)+1));
            x := High(vSegOperPD);
            vSegOperPD[x].Parametros    := vParamOperContab[iRegistro];
            vSegOperPD[x].IdUsuario     := cdsIntegra.FieldByName('IDUSUARIOSISTEMA').AsInteger;
            vSegOperPD[x].IdPlanoImovel := iIdPlanoPrev;
            vSegOperPD[x].IdPatroImovel := iIdPatro;
            vSegOperPD[x].NoDocumento   := cdsIntegra.FieldByName('NODOCUMENTO').AsFloat;
            vSegOperPD[x].dLancto       := cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime;

            if cdsAux.RecNo = cdsAux.RecordCount then
            begin
              if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                vSegOperPD[x].VlrTotal := (cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat - fTotLanc)
              else
                vSegOperPD[x].VlrTotal := (cdsIntegra.FieldByName('VLRLANCRECEB').asFloat - fTotLanc);
            end
            else
            begin
              if cdsIntegra.FieldByName('RECPAG').asString = 'P' then
                vSegOperPD[x].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCPAGAR').asFloat *
                                                 cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2)
              else
                vSegOperPD[x].VlrTotal := RoundCM((cdsIntegra.FieldByName('VLRLANCRECEB').asFloat *
                                                 cdsAux.FieldByName('PERCENTRATEIO').asFloat)/100,2);
            end;
          end;
        end;
        cdsAux.Next;
      end;

      inc(iRegistro);
      cdsIntegra.Next;
    end; //if cdsIntegra
    //Cássio - SOL Nº 133781 KINTANA Nº 781998 - Fim

    // Efetua o lançamento em partida dobrada
    for i := 0 to Length(vLancaPD) -1 do
    begin
      // salvar o numero da planilha em todas as linhas do vetor, pois na função e passado um record
      if i > 0 then
        vLancaPD[i].Parametros.iPlanilha := vLancaPD[0].Parametros.iPlanilha;

      // fazer o lançamento em Partida Dobrada
      if Result.iCodErro = 0 then
        Result := FazerLancamentoContab(vLancaPD[i].Parametros, '2',{2=Partida Dobrada}
                                        vLancaPD[i].dLancto,
                                        vLancaPD[i].NoDocumento,
                                        vLancaPD[i].VlrTotal,
                                        vLancaPD[i].IdUsuario,
                                        vLancaPD[i].IdPatroImovel,
                                        vLancaPD[i].IdPlanoImovel,
                                        aIdImovel[i]);
    end;

    // Efetua o lançamento da segunda operação contábil
    if bSegOper then
    begin
    // Efetua o lançamento em partida dobrada
      for i := 0 to Length(vSegOperPD) -1 do
      begin
      // utilizar a mesma planilha do primeiro registro para todos os lançamentos
        vSegOperPD[i].Parametros.iPlanilha := vLancaPD[0].Parametros.iPlanilha;

      // fazer o lançamento em Partida Dobrada
        if Result.iCodErro = 0 then
          Result := FazerLancamentoContab(vSegOperPD[i].Parametros, '2',{2=Partida Dobrada}
                                          vSegOperPD[i].dLancto,
                                          vSegOperPD[i].NoDocumento,
                                          vSegOperPD[i].VlrTotal,
                                          vSegOperPD[i].IdUsuario,
                                          vSegOperPD[i].IdPatroImovel,
                                          vSegOperPD[i].IdPlanoImovel,
                                          aIdImovel[i]);
      end;
    end;

    // Atualiza o Nr. da Planilha nos Lançamentos por imóvel
    if Result.iCodErro = 0 then
      for i := 0 to Length(vParamContabeis) -1 do
        vParamContabeis[i].iPlanilha := vLancaPD[0].Parametros.iPlanilha;

   except
    on e:exception do
    begin
      Result.iCodErro := -27;
      if Result.sMensErro = '' then
        Result.sMensErro := e.Message
      else
        Result.sMensErro := Result.sMensErro + #13 + e.Message;
    end;
   end;
end;

//========================================================================================
// Função INTERNA para integrar o lançamento com o ORÇAMENTO
// Data : 09/01/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//
// Retorno : TMensErro.iCodErro  - Código do Erro
//                    .sMensErro - Mensagem do Erro
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.IntegraOrcamento: TMensErro;
var sDataLancto: string;
    iNumCompromisso, iRetorno: integer;
begin
   iRetorno         := 0;
   Result.iCodErro  := 0;
   Result.sMensErro := '';

   CtrlOrcamento.IdEmpresa := ParamSistema.idEmpresa;
   CtrlOrcamento.IdUsuario := ParamSistema.idUsuario;

   cdsIntegra.First;
   while (not cdsIntegra.Eof) and (Result.iCodErro = 0)  do begin
      if not cdsIntegra.FieldByName('IDRESERVAORCAMEN').IsNull then begin
         if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then begin   // contas a pagar
            try
               sDataLancto := FormatDateTime('dd/mm/yyyy', cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime);

               CtrlOrcamento.IdReserva  := cdsIntegra.FieldByName('IDRESERVAORCAMEN').AsInteger;
               CtrlOrcamento.NumReserva := CtrlOrcamento.BuscaIdNumReserva(CtrlOrcamento.IdReserva, 0, True);
               if CtrlOrcamento.NumReserva <= 0 then
                  raise Exception.Create( CtrlOrcamento.MessageInfo );

               iNumCompromisso := CtrlOrcamento.NumReserva;
               iRetorno := CtrlOrcamento.EfetivaCompromisso(iNumCompromisso, cdsIntegra.FieldByName('VLRLANCPAGAR').AsFloat, True);
               if iRetorno > 0 then
                  raise Exception.Create( CtrlOrcamento.MessageInfo );
            except
               on e:Exception do begin
                  if iRetorno <> 0 then begin
                     if (iRetorno >= 1) and (iRetorno <= 6) then
                          Result.iCodErro := (-65) + (iRetorno*-1)  // -66.. -71
                     else Result.iCodErro := -72;  // outro erro da CtrlOrcamento
                  end else begin
                     Result.iCodErro  := -75;
                  end;
                  Result.sMensErro := ComunsImobiliario.ErroIntegra( Result.iCodErro ) +#13+ e.Message;
                  Exit;
               end;
            end;
         end;
      end;
      cdsIntegra.Next;
   end;
end;



//========================================================================================
// Função INTERNA para validar os parämetros para integração
// Data : 03/11/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       rParamContabeis - Record com os parâmetros para integração
//
// Retorno : Result.iCodErro - Código do Erro
//             'Erro -12 = Código de tipo de desembolso não informado'
//             'Erro -13 = Código de tipo de recebimento não informado'
//             'Erro -14 = Unidade de negócio não informado'
//             'Erro -15 = Código de centro de responsabilidade não informado'
//             'Erro -16 = Número de documento inválido'
//             'Erro -18 = Grupo de Lançamento não informado'
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.VerificaParamIntegra(const rParamContabeis: TParamContabeisMT): integer;
begin
  Result := 0;
  if rParamContabeis.iUnidNegoc = 0 then begin
     Result := -14;
     Exit;
  end;

  if rParamContabeis.bFlgIntegraCapCar then begin
    if rParamContabeis.sCodTipRecDes = '' then begin
      if cdsIntegra.FieldByName('RECPAG').AsString = 'P' then
           Result := -12
      else Result := -13;
      Exit;
    end;
    if rParamContabeis.sCodCentroRespon = '' then begin
       Result := -15;
       Exit;
    end;
    if cdsIntegra.FieldByName('NODOCUMENTO').IsNull then begin
       Result := -16;
       Exit;
    end;
  end;

  if (rParamContabeis.bFlgIntegraContab) and (rParamContabeis.sTipCodigo = '') then begin
    Result := -18;
  end;
end;



//========================================================================================
// Função INTERNA para Efetuar o lançamento contábil
// Data : 31/10/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       rParamContabeis - Record com os parâmetros para integração
//       sTipoLanc       - Tipo de Lançamento ( 0 Debito / 1 Crédito / 2 Partida Dobrada )
//       dLancto         - Data do lançamento
//       NumDoc          - Nr. do documento
//       VlrLancto       - Valor do lançamento
//       idUsuario       - id do Usuário para integração
//
// Retorno : Result.iCodErro  - Código do Erro
//                 .sMensErro - Mensagem do Erro
//                 Erro: -25 Erro genérico funcao Lança Contabilidade
//                 Erro: -26 Erro genérico função Fazer Lançamento Contabilidade
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.FazerLancamentoContab(var rParamContabeis: TParamContabeisMT; const sTipoLanc: char;
                                                      const dLancto: TDateTime; const NumDoc, VlrLancto: Extended;
                                                      const idUsuario, iIdPatroImovel, iIdPlanoImovel:Integer;
                                                      const iIdImovel: integer): TMensErro;
var sModulo : string;
    iTestaPeriodo: Integer;
    iEmpresa: integer;
    sDataLancamento: string;
    bJunta: Boolean;
    sCCustoD, sContaD, sCCustoC, sContaC: string;
    iSubContaD, iSubContaC : Integer;
    iIdPlanoPrev, iIdPatro : Integer;
    i : integer;
begin
   Result.iCodErro  := 0;
   Result.sMensErro := '';

   try
    sDataLancamento := FormatDateTime('dd/mm/yyyy', dLancto);

    case StrtoInt(sTipoLanc) of
      0 : begin                    // Lançamento de Débito
            bJunta   := True;
            sCCustoD := rParamContabeis.sCentroCustoDebito;
            sContaD  := rParamContabeis.sContaContabilDebito;
            sCCustoC := '';
            sContaC  := '';
          end;

      1 : begin                    // Lançamento de Crédito
            bJunta   := True;
            sCCustoD := '';
            sContaD  := '';
            sCCustoC := rParamContabeis.sCentroCustoCredito;
            sContaC  := rParamContabeis.sContaContabilCredito;
          end;
      2 : begin                    // Lançamento em Partida Dobrada ( D/C )
            bJunta   := False;
            sCCustoD := rParamContabeis.sCentroCustoDebito;
            sContaD  := rParamContabeis.sContaContabilDebito;
            sCCustoC := rParamContabeis.sCentroCustoCredito;
            sContaC  := rParamContabeis.sContaContabilCredito;
          end;
    end;

    //Verifica segregação, caso imovel 100% de um plano, contabiliza no plano, senão, contabiliza em operações comuns
    if iIdPatroImovel > 0 then
      iIdPatro := iIdPatroImovel
    else iIdPatro := CtrlParamIntegra.PatroGlobal;

    if iIdPlanoImovel > 0 then
      iIdPlanoPrev := iIdPlanoImovel
    else iIdPlanoPrev := CtrlParamIntegra.PlanoPrevGlobal;

    // Converte Subcontas
    iSubContaD := 0;
    iSubContaC := 0;
    if rParamContabeis.sSubContaDebito <> '' then
      iSubContaD := StrToInt(rParamContabeis.sSubContaDebito);

    if rParamContabeis.sSubContaCredito <> '' then
      iSubContaC := StrToInt(rParamContabeis.sSubContaCredito);

    //Efetua o lançamento contábil
    if not CtrlImobLancamento.InsereLancaContab(sTipoLanc,
                                                ParamSistema.IdEmpresa,
                                                ParamSistema.IdModulo,
                                                idUsuario,
                                                CtrlParamIntegra.Plano,
                                                rParamContabeis.iUnidNegoc,
                                                iSubContaD,
                                                iSubContaC,
                                                iIdPlanoPrev,
                                                iIdPatro,
                                                rParamContabeis.iPlanilha, 0,
                                                sDataLancamento,
                                                FormatFloat('#0', NumDoc),
                                                rParamContabeis.sHistoricoCtb, '', '', '', '',
                                                rParamContabeis.sTipCodigo,
                                                sCCustoD, sContaD,
                                                sCCustoC, sContaC, '',
                                                VlrLancto, bJunta,
                                                ParamSistema.UsaPlanoPatro,
                                                rParamContabeis.iIdSegregaCriter,
                                                dLancto, -1,
                                                //SOL Nº 92381  KINTANA Nº 394180
                                                iIdImovel, True, -1, False,
                                                dValorTotalLancamento) then
    begin
      //integração com contabilidade falhou; exibe a mensagem de erro correspondente
      Result.iCodErro  := -25;
      Result.sMensErro := CtrlImobLancamento.MessageInfo;
    end
    else
    begin
      if CtrlImobLancamento.RetornoPlnCodigo > 0 then
        rParamContabeis.iPlanilha := StrToInt(FloatToStr(CtrlImobLancamento.RetornoPlnCodigo));
    end;

   except
    on e:exception do
    begin
      if Result.sMensErro = '' then
        Result.sMensErro := e.Message
      else
        Result.sMensErro := Result.sMensErro + #13 + e.Message;
      Result.iCodErro := -26;
    end;
   end;
end;


//========================================================================================
// Função para verificar a necessidade de liberação de responsabilidade
// Data : 09/01/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//      iDocumento - Nr. do Documento a ser verificado ( default = -1 para cdsIntegra já carregado )
//      iCodErro   - Retorna o Nr. do Erro para o documento
//
// Retorno : True  - Obriga a Liberação
//           False - Não obriga
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.DespesaLocatario(const iDocumento:Integer; var iCodErro:Integer): Boolean;
var sSql : String;
    cdsTemp : TCMClientDataSet;
    iIdContrato : Integer;
begin
   Result   := False;
   iCodErro := 0;
   FCodigoErroLiberacao := iCodErro;
   try
      try
         cdsTemp := TCMClientDataset.Create( nil );

         if iDocumento > 0 then begin
            cdsIntegra := TCMClientDataSet.Create( nil );
            cdsIntegra.Data := LookupImoveisDocum( iDocumento, True );
            if cdsIntegra.IsEmpty then raise exception.create('Documento não encontrado');
         end;
         if not cdsIntegra.IsEmpty then begin
            cdsIntegra.First;

            // Não obriga liberação 91 - imóveis inativos já autorizada anteriormente
            if (cdsIntegra.FieldByName('FLGERRO').AsInteger = 91 ) then Exit;

            // Verifica nos parametros se checa responsabilidade de locatário
            if not CtrlModuloImobiliario.AdminImob.bFlgReembolsoAutomatico then Exit;

            // Não obriga liberação para Receitas,
            //   56 - despesa de locatário já autorizada anteriormente
            if (cdsIntegra.FieldByName('RECPAG').AsString   = 'R') or
               (cdsIntegra.FieldByName('FLGERRO').AsInteger = 56 ) then Exit;

            // Verificar a responsabilidade imóvel por imóvel
            while not cdsIntegra.Eof do begin

               // Verifica se existe contrato ativo para o imóvel
               sSql := 'SELECT CXI.IDCONTRATOIMOVEL                      '+#13+
                       '  FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI     '+#13+
                       ' WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL '+#13+
                       '   AND C.FLGTIPOCONTRATO = ''L'' '+#13+
                       '   AND C.FLGSTATUS       = ''V'' '+#13+
                       '   AND CXI.IDIMOVEL = ' + cdsIntegra.FieldByName('IDIMOVEL').AsString;
               cdsTemp.Data := GetDataPacket( sSql );
               iIdContrato := cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger;

               // Se o imóvel possuir contratos ativos, procurar a responsabilidade
               if not cdsTemp.IsEmpty then begin

                  sSql := 'SELECT IDTIPOCUSTORECIMO FROM RESPDESPIMOB '+#13+
                          ' WHERE IDCONTRATOIMOVEL  = ' + IntToStr(iIdContrato) +#13+
                          '   AND IDTIPOCUSTORECIMO = ' + cdsIntegra.FieldByName('IDTIPOCUSTORECIMO').AsString;
                  cdsTemp.Data := GetDataPacket( sSql );

                  // A tabela RESDESPIMOB possui as despesas de responsabilidade da FUNDAÇÃO
                  // Por default, todas as despesas são de responsabilidade do locatário
                  if cdsTemp.IsEmpty then
                     raise exception.Create('-56');  // Responsabilidade do locatário
               end;
               cdsIntegra.Next;
            end;
         end;
      except
         on e : Exception do begin
            Result := True;
            iCodErro := StrToInt( e.message );
            FCodigoErroLiberacao := iCodErro;
         end;
      end;
   finally
      if iDocumento > 0 then FreeAndNil( cdsIntegra );
      FreeAndNil( cdsTemp );
   end;
end;



//========================================================================================
// Função para verificar a necessidade de liberação de responsabilidade
// Data : 12/01/2004                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//      iDocumento - Nr. do Documento a ser verificado ( default = -1 para cdsIntegra já carregado )
//      iCodErro   - Retorna o Nr. do Erro para o documento
//
// Retorno : True  - Obriga a Liberação
//           False - Não obriga
//----------------------------------------------------------------------------------------
function TCtrlLancamentosImovel.ObrigaLiberacao(const iDocumento: Integer; var iCodErro: Integer): Boolean;
var cdsTemp : TCMClientDataSet;
    sSql : String;
    iAnoLancContab, iMesLancContab, iDiaLancContab : Word;
    iAnoComp, iMesComp : Integer;
begin
   Result := False;
   try
      try
         cdsTemp := TCMClientDataset.Create( nil );

         if iDocumento > 0 then begin
            cdsIntegra := TCMClientDataSet.Create( nil );
            cdsIntegra.Data := LookupImoveisDocum( iDocumento, True );
            if cdsIntegra.IsEmpty then raise exception.create('Documento não encontrado');
         end;

         if not cdsIntegra.IsEmpty then begin
            cdsIntegra.First;

            // Receita autorizada anteriormente
            if cdsIntegra.FieldByName('FLGERRO').AsInteger in[90,91,92] then exit;

            // Verifica cada lançamento do documento
            while (not cdsIntegra.Eof) and (Result = False) do begin

               // Erro -90: Receita de imovel nunca locado
               // Alterado por FHBS - SOL: 154196 KTN: 1170533
               // Foi tirada a validação abaixo para possibilitar a integração de Receitas para imoveis sem contrato.
               //if (cdsIntegra.FieldByName('RECPAG').AsString = 'R') and
               //   (cdsIntegra.FieldByName('IDCONTRATOIMOVEL').isNull) then begin
               //
               //   sSql := 'SELECT IDCONTRATOIMOVEL FROM CONTRATOXIMOVEL WHERE IDIMOVEL = ' +
               //           cdsIntegra.FieldByName('IDIMOVEL').AsString;
               //   cdsTemp.Data := GetDataPacket( sSql );
               //   if cdsTemp.IsEmpty then raise exception.Create('-90');
               //end;

               // Erro -91: Despesa em imovel inativo
               if (cdsIntegra.FieldByName('RECPAG').AsString = 'P') and
                  (cdsIntegra.FieldByName('FLGATIVO').AsInteger = 0) then
                     raise exception.Create('-91');

               cdsIntegra.Next;
            end;

//---------- INÍCIO - Marcio Motta - 10/03/2004 - Pendência: 16112 ---------------------------------
            cdsIntegra.First;
            // Erro -92: Registro contábil fora da competência gerencial

            // Decodifica a data de Lançamento contábil
            DecodeDate(cdsIntegra.FieldByName('DATALANCAMENTO').AsDateTime,
                       iAnoLancContab,iMesLancContab,iDiaLancContab);

            // Pega o ANO e o MÊS de competência
            iAnoComp := cdsIntegra.FieldByName('ANOCOMPETENCIA').AsInteger;
            iMesComp := cdsIntegra.FieldByName('MESCOMPETENCIA').AsInteger;

            // Se data de lançamento for menor que a data de competência solicita liberação
            if (iAnoLancContab <> iAnoComp) or (iMesLancContab <> iMesComp) then
               raise exception.Create('-92');
//------- FIM Implementação/Alteração - Marcio Motta -----------------------------------------------

         end;
      except
         on e : Exception do begin
            Result := True;
            iCodErro := StrToInt( e.message );
            FCodigoErroLiberacao := iCodErro;
         end;
      end;
   finally
      if iDocumento > 0 then FreeAndNil( cdsIntegra );
      FreeAndNil( cdsTemp );
   end;
end;


procedure TCtrlLancamentosImovel.SetDbObsLancImovel(const Value: TDbObsLancImovel);
begin
  FDbObsLancImovel := Value;
end;

procedure TCtrlLancamentosImovel.SetDbLancamentosImovel(const Value: TDbLancamentosImovel);
begin
  FDbLancamentosImovel := Value;
end;

procedure TCtrlLancamentosImovel.SetDbAlteraLancImovel(const Value: TDbAlteraLancImovel);
begin
  FDbAlteraLancImovel := Value;
end;


procedure TCtrlLancamentosImovel.SetCodigoErroLiberacao(const Value: Integer);
begin
  FCodigoErroLiberacao := Value;
end;

//---------- 27/02/2004 - Marcio Motta - Pendência: 16112 ------------------------------------------
function TCtrlLancamentosImovel.LookupLancImob(const iDocumento: integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := ' AND L.IDDOCUMENTO = ' + IntToStr(iDocumento);

  sSql   := ' SELECT L.IDPESSOA, L.IDDOCUMENTO, L.CODDOCUMENTO,'       +#13+
            '        L.PLNCODIGO, L.IDRESERVAORCAMEN,'                 +#13+
            '        L.IDFORCLI, PF.NOME AS NF_FORCLI,'                +#13+
            '        PF.RAZAOSOCIAL AS RS_FORCLI,'                     +#13+
            '        L.RECPAG, L.IDTIPOCUSTORECIMO, L.FLGINTEGRADO,'   +#13+
            '        L.DTINICTBDIARIA, L.DTFIMCTBDIARIA,'              +#13+
            '        L.MESCOMPETENCIA, L.ANOCOMPETENCIA,'              +#13+
            '        L.DATAVENCIMENTO, L.DATALANCAMENTO,'              +#13+
            '        L.NUMAPALT, L.REFERENCIAAP,'                      +#13+
            '        L.CODCENTROCUSTO, L.CODFORMA,'                    +#13+
            '        L.PLNCODIGO, L.IDCBANCARIA,'                      +#13+
            '        L.NODOCUMENTO, L.IDFORCLI,'                       +#13+
            '        D.NUMAPGR,'                                       +#13+
            '        SUM(DECODE(L.RECPAG, ''P'', NVL(L.VLRLANCPAGAR,0), NVL(L.VLRLANCRECEB,0))) AS VLR_TOTAL,'      +#13+
            '        SUM(DECODE(L.RECPAG, ''P'', NVL(L.VLRLANCOMPAGAR,0), NVL(L.VLRLANCOMRECEB,0))) AS VLR_TOTALOM' +#13+

            // Daniel - 22993 --------------------------------------------------
            '        , L.OBS '                                         +#13+
            // Fim -------------------------------------------------------------

            '   FROM LANCAMENTOSIMOVEL L, PESSOA PF, DOCUMENTO D'      +#13+
            '  WHERE L.IDFORCLI = PF.IDPESSOA'                         +#13+
            '    AND L.CODDOCUMENTO = D.CODDOCUMENTO(+)'               +#13+
            '    AND L.IDPESSOA = ' + IntToStr(ParamSistema.idEmpresa) +#13+
                     sParam                                            +#13+
            '  GROUP BY L.IDPESSOA, L.IDDOCUMENTO, L.CODDOCUMENTO,'    +#13+
            '           L.PLNCODIGO, L.IDRESERVAORCAMEN,'              +#13+
            '           L.IDFORCLI, PF.NOME, PF.RAZAOSOCIAL,'          +#13+
            '           L.RECPAG, L.IDTIPOCUSTORECIMO, L.FLGINTEGRADO,' +#13+
            '           L.DTINICTBDIARIA, L.DTFIMCTBDIARIA,'           +#13+
            '           L.MESCOMPETENCIA, L.ANOCOMPETENCIA,'           +#13+
            '           L.DATAVENCIMENTO, L.DATALANCAMENTO,'           +#13+
            '           L.NUMAPALT, L.REFERENCIAAP,'                   +#13+
            '           L.CODCENTROCUSTO, L.CODFORMA,'                 +#13+
            '           L.PLNCODIGO, L.IDCBANCARIA,'                   +#13+
            '           L.NODOCUMENTO, L.IDFORCLI, D.NUMAPGR '         +#13+
            '          ,L.OBS'; // Daniel - 22993

  Result := GetDataPacket( sSql );
end;
//------- Fim Implementação/Alteração - Marcio Motta -------------------------------


function TCtrlLancamentosImovel.BuscaDescSegOper(const iIdTipoRecDes: Integer): String;
var sSql : String;
begin
   Result := '';
   sSql   := 'SELECT T2.DESCCUSTORECIMO ' +
             '  FROM TIPOCUSTORECIMOV T1, TIPOCUSTORECIMOV T2 ' +
             ' WHERE T1.IDOPERCONTAB = T2.IDTIPOCUSTORECIMO ' +
             '   AND T1.IDTIPOCUSTORECIMO = 1';
   _cds.Data := GetDataPacket(sSql);
   if not _cds.IsEmpty then begin
      Result := Trim(_cds.FieldByName('DESCCUSTORECIMO').AsString);
   end;
end;

// Daniel - 22815 - Início -----------------------------------------------------
function TCtrlLancamentosImovel.LookupAlteraAP(const iCodDocumento:Integer): OLEVariant;
var sSql, sParam : String;
begin
  Result := True;

  // Define Parâmetros
  sParam := '';
  if (iCodDocumento<>-1) then sParam := sParam+' AND L.IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento))    +#13;

  // Define Sql
  sSql := 'SELECT D.CODDOCUMENTO, D.DATAVENCTO, D.DATAPROGRAMADA, D.CODPORTFORMA, P.DESCRICAO AS PORTADOR, ' +#13+
          '       L.REFERENCIAAP, O.OBS, SUM(DECODE(LD.DEBCRE,''C'',LD.VALOR, LD.VALOR * -1)) AS VALOR '     +#13+
          'FROM LANCAMENTOSIMOVEL L, DOCUMENTO D, PORTADORFORMA P, OBSLANCIMOVEL O, LANCTODOCUM LD '         +#13+
          'WHERE L.CODDOCUMENTO = D.CODDOCUMENTO(+) '                                                        +#13+
          '  AND D.CODDOCUMENTO = LD.CODDOCUMENTO(+) '                                                       +#13+
          '  AND D.CODPORTFORMA = P.CODPORTFORMA(+) '                                                        +#13+
          '  AND L.IDDOCUMENTO  = O.IDDOCUMENTO(+) '                                                         +#13+sParam+
          'GROUP BY D.CODDOCUMENTO, D.DATAVENCTO, D.DATAPROGRAMADA, D.CODPORTFORMA, P.DESCRICAO, '           +#13+
          '         L.REFERENCIAAP, O.OBS '                                                                  +#13;

  Result := GetDataPacket( sSql );
end;


function TCtrlLancamentosImovel.GravaAlteracaoAP(const iCodDocumento,iCodForma:Integer;
                                                 const dVencimento,dProgramada:TDateTime;
                                                 const sReferencia,sObs:String;
                                                 const bTransacao:Boolean): Boolean;
var sSql, sParam: string;
begin
  Result := True;

  try
    if bTransacao then StartTransaction;

// UPDATE NA LANCAMENTOSIMOVEL - Início ---------------------------------------- 26625

    if iCodForma <> 0 then
      sSql := 'UPDATE LANCAMENTOSIMOVEL SET CODPORTFORMA = '+QuotedStr(IntToStr(iCodForma))+#13+
              'WHERE IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento))
    else
      sSql := 'UPDATE LANCAMENTOSIMOVEL SET CODPORTFORMA = NULL'+#13+
              'WHERE IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento));

    // Executa o Sql
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    if sReferencia <> '' then
      sSql := 'UPDATE LANCAMENTOSIMOVEL SET REFERENCIAAP = '+QuotedStr(sReferencia)+#13+
              'WHERE IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento))
    else
      sSql := 'UPDATE LANCAMENTOSIMOVEL SET REFERENCIAAP = NULL'+#13+
              'WHERE IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento));


    // Executa o Sql
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

// UPDATE NA LANCAMENTOSIMOVEL - Fim ------------------------------------------- 26625

// UPDATE NA OBSLANCIMOVEL - Início --------------------------------------------
    sSql := 'UPDATE OBSLANCIMOVEL SET OBS = '+QuotedStr(sObs)+#13+
            'WHERE IDDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento));

    // Executa o Sql
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
// UPDATE NA OBSLANCIMOVEL - Fim -----------------------------------------------

// UPDATE NA DOCUMENTO - Início ------------------------------------------------ 26625

    if iCodForma <> 0 then
      sSql := 'UPDATE DOCUMENTO SET CODPORTFORMA   = '+QuotedStr(IntToStr(iCodForma))+', '
    else
      sSql := 'UPDATE DOCUMENTO SET CODPORTFORMA   = NULL, ';


    sSql := sSql + ' DATAVENCTO     = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYY',dVencimento))+',''DD/MM/YYYY''), '+
                   ' DATAPROGRAMADA = TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYY',dProgramada))+',''DD/MM/YYYY''), ';

    if sReferencia <> '' then
      sSql := sSql + ' REFERENCIA     = '+QuotedStr(sReferencia)+', '
    else
      sSql := sSql + ' REFERENCIA     = NULL, ';

    sSql := sSql + '   OBS            = '+QuotedStr(sObs)+#13+
            'WHERE CODDOCUMENTO = '+QuotedStr(IntToStr(iCodDocumento));

    // Executa o Sql
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );
// UPDATE NA DOCUMENTO - Fim --------------------------------------------------- 26625

    Commit;

  except
    on e : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := e.message;
    end;
  end;
end;
// Daniel - 22815 - Fim --------------------------------------------------------

function TCtrlLancamentosImovel.VerificaSegregacaoOrigem(
  iIdImovel: integer): Integer;
var
  sSQL: string;
  cdsSegregacaoOrigem : TClientDataSet;
begin
  cdsSegregacaoOrigem := TClientDataSet.Create(nil);
  try
    sSQL := 'SELECT IDPATRO,         ' + #10#13 +
            '       IDPLANOPREV,     ' + #10#13 +
            '       PPIPERCENTRATEIO ' + #10#13 +
            '  FROM PLANOPATROXIMOVEL ' + #10#13 +
            ' WHERE IDIMOVEL = ' + IntToStr(iIdImovel);
    cdsSegregacaoOrigem.Data := GetDataPacket(sSQL);
    Result := cdsSegregacaoOrigem.RecordCount;
  finally
    FreeAndNil(cdsSegregacaoOrigem);
  end;
end;

function TCtrlLancamentosImovel.GetValorTotLanc(
  iCodDocumento: Integer): Extended;
var
  sSQL : string;
  _cds : TCMClientDataSet;
begin
  _cds := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT SUM(DECODE(RECPAG, ''P'', VLRLANCPAGAR, VLRLANCRECEB)) AS VLRTOTAL ' +
            '  FROM LANCAMENTOSIMOVEL ' +
            ' WHERE IDDOCUMENTO = ' + IntToStr(iCodDocumento);

    _cds.Data := GetDataPacket(sSQL);

    if not _cds.IsEmpty then
      Result := _cds.FieldByName('VLRTOTAL').asFloat
    else
      Result := 0;
  finally
    FreeAndNil(_cds);
  end;
end;

function TCtrlLancamentosImovel.LookupParamContabImob(
  const iDocumento: Integer; const bParaIntegrar: Boolean): OLEVariant;
var
  sSql, sParam : String;
begin
  sParam := ' AND L.IDDOCUMENTO = ' + IntToStr(iDocumento);
  if bParaIntegrar then
    sParam := sParam + ' AND (L.FLGINTEGRADO = 0 OR L.FLGINTEGRADO IS NULL) ';

  sSql :=   ' SELECT L.RECPAG, ' + #13 +
            '        L.CODTIPIMOVEL,    ' + #13 +
            '        L.IDCONTRATOIMOVEL, ' + #13 +
            '        T.IDOPERCONTAB,  ' + #13 +
            '        I.IDIMOVEL,  ' + #13 +
            '        L.IDTIPOCUSTORECIMO   ' + #13 +
            '   FROM LANCAMENTOSIMOVEL L,  ' + #13 +
            '        TIPOCUSTORECIMOV  T,  ' + #13 +
            '        IMOVEL            I,  ' + #13 +
            '        IMOVEL            IP, ' + #13 +
            '        IMOVEL            IM, ' + #13 +
            '        CONTRATOIMOVEL    C,  ' + #13 +
            '        CIDADES           CI, ' + #13 +
            '        ESTADO            E   ' + #13 +
            '  WHERE L.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO  ' + #13 +
            '    AND I.IDIMOVELMESTRE = IM.IDIMOVEL             ' + #13 +
            '    AND I.IDIMOVELPAI = IP.IDIMOVEL(+)             ' + #13 +
            '    AND L.IDIMOVEL = I.IDIMOVEL(+)                 ' + #13 +
            '    AND L.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) ' + #13 +
            '    AND C.IDCIDADES = CI.IDCIDADES(+)              ' + #13 +
            '    AND CI.IDESTADO = E.IDESTADO(+)                ' + #13 +
            '    AND L.IDPESSOA = 1                             ' +  sParam;


  Result := GetDataPacket( sSql );
end;

function TCtrlLancamentosImovel.LookupInfoDoc(
  iCodDocumento: Integer; dLimite: TDateTime): OLEVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT VW.IDTIPOCUSTORECIMO,           ' + #13 +
          '       VW.IDCONTRATOIMOVEL,            ' + #13 +
          '       VW.DATAVENCIMENTO,              ' + #13 +
          '       VW.DATAVENCIMENTO,              ' + #13 +
          '       VW.CODDOCUMENTO,                ' + #13 +
          '       VW.DATALIMITE,                  ' + #13 +
          '       VW.IDCIDADES,                   ' + #13 +
          '       VW.IDPAIS,                      ' + #13 +
          '       VW.CODESTADO,                   ' + #13 +
          '       VW.TOT_RECEBER,                 ' + #13 +
          '       NVL(SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1)),0)  AS TOT_ALTERADOR ' + #13 +
          '  FROM VWLANCAMENTO VW,                ' + #13 +
          '       (SELECT DISTINCT LD.CODDOCUMENTO, LD.DEBCRE, LD.VALOR, LD.NUMLANCTO ' + #13 +
          '           FROM LANCTODOCUM LD, LANCAMENTOSIMOVEL L, TIPOIMOVEL T ' + #13 +
          '          WHERE LD.CODDOCUMENTO = L.CODDOCUMENTO ' + #13 +
          '            AND L.CODTIPIMOVEL = T.CODTIPIMOVEL ' + #13 +
          '             AND RTRIM(LD.OPERACAO) = ''4'' ' + #13 +
          '             AND LD.DATALANCTO  < TO_DATE('+ QuotedStr(FormatDateTime('DD/MM/YYYY',dLimite)) +',''DD/MM/YYYY'') ' + #13 +
          '            AND LD.ESTORNO IS NULL ' + #13 +
          '            AND NVL(LD.CODALTERADOR,0) <> T.CODALTMULTA ' + #13 +
          '            AND NVL(LD.CODALTERADOR,0) <> T.CODALTJUROS ' + #13 +
          '            AND NVL(LD.CODALTERADOR,0) <> T.CODALTCORRMON) LD ' + #13 +
          ' WHERE VW.CODDOCUMENTO = ' + IntToStr(iCodDocumento)  + #13 +
          '   AND VW.CODDOCUMENTO = LD.CODDOCUMENTO(+) ' + #13 +
          ' GROUP BY VW.IDTIPOCUSTORECIMO, ' + #13 +
          '       VW.IDCONTRATOIMOVEL, ' + #13 +
          '       VW.DATAVENCIMENTO, ' + #13 +
          '       VW.DATAVENCIMENTO, ' + #13 +
          '       VW.CODDOCUMENTO,   ' + #13 +
          '       VW.DATALIMITE,     ' + #13 +
          '       VW.IDCIDADES,      ' + #13 +
          '       VW.IDPAIS,         ' + #13 +
          '       VW.CODESTADO,      ' + #13 +
          '       VW.TOT_RECEBER ';

  Result := GetDataPacket(sSQL);
end;
function TCtrlLancamentosImovel.VerificaCorrecao( nIdCondPagAquisparc: Extended): Integer;
var
   sSQL , scodAlterador: string;   _cdsAux , _cdsTipoAlterador, _cdsImovelAux: TCMClientDataSet;
begin // Helen - SOL: 127213 KTN: 672023
   Result  := 0;
   _cdsAux           := TCMClientDataSet.Create(nil);
   _cdsTipoAlterador := TCMClientDataSet.Create(nil);
   _cdsImovelAux     := TCMClientDataSet.Create(nil);
   try
       sSQL := ' SELECT C.IDCONDPAGAQUISPARC,C.IDIMOVEL , C.VLRFINANC, C.DATAVENCIMENTO,' +
               ' C.INDCORRECAO , C.MESREFREAJUSTE, M.FATORCONVERSAO , M.MOECODIGO       ' +
               ' FROM CONDPAGAQUISPARC C , MOEDA M ' +
               ' WHERE C.IDCONDPAGAQUISPARC =      ' + FloatToStr(nIdCondPagAquisparc) +
               ' AND C.INDCORRECAO = M.MOECODIGO   ' ;
       _cdsAux.Data := GetDataPacket(sSQL);

       if _cdsAux.FieldByName('MOECODIGO').asFloat > 0  then
       begin
          {sSQL := ' SELECT CODTIPIMOVEL  FROM IMOVEL ' +
                  ' WHERE IDIMOVEL =  ' + cdsIntegra.FieldByName('IDIMOVEL').AsString;
          _cdsImovelAux.Data := GetDataPacket(sSQL);}
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'HOTEL' then
             scodAlterador := '534';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'CONST' then
             scodAlterador := '530';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'RENDA' then
             scodAlterador := '531';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'PATRO' then
             scodAlterador := '532';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'SHOPP' then
             scodAlterador := '533';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'PROP'  then
             scodAlterador := '527';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'USOP'  then
             scodAlterador := '528';
          if cdsIntegra.FieldByName('CODTIPIMOVEL').AsString = 'TERR' then
             scodAlterador := '529';

          sSQL := ' SELECT T.CODALTERADOR, T.RECPAG,  T.ACRESDECRES' +
                  ' FROM TIPOALTERADOR T   ' +
                  ' WHERE T.CODALTERADOR = ' + scodAlterador ;
          _cdsTipoAlterador.Data := GetDataPacket(sSQL);
          if _cdsTipoAlterador.FieldByName('CODALTERADOR').asString <> ''  then
          begin
               sCodAlterador  := _cdsTipoAlterador.FieldByName('CODALTERADOR').asString;
               sAcresDecres   := _cdsTipoAlterador.FieldByName('ACRESDECRES').asString;
          end
          else
          begin
              sCodAlterador := ''; sAcresDecres := '';
          end;
          Result          := _cdsAux.FieldByName('INDCORRECAO').AsInteger;
          iMesRefReajuste := _cdsAux.FieldByName('MESREFREAJUSTE').AsInteger;
       end
       else
       begin
          iMesRefReajuste := 0;
          Result          := 0;
       end;
   finally
        FreeAndNil(_cdsAux);
        FreeAndNil(_cdsTipoAlterador);
        FreeAndNil(_cdsImovelAux);
    end;
end;
function TCtrlLancamentosImovel.InsereMovAcresCorr(nValorAcres : Extended): Boolean;
var iIdLancImovel, iDocumento : integer;  _cdsAux : TCMClientDataSet;
    nValRateio : Extended;
    iIdAcrescimo: Integer;
    fTaxaDep    : Double;
    sObs , sSQL       : String;
begin // Helen - SOL: 127213 KTN: 672023
   Result := True;
   _cdsAux := TCMClientDataSet.Create(nil);
   sSQL := ' SELECT I.IDBEM, I.IDIMOVEL,I.IXBGRUPO,I.IXBRATEIO , C.DESCRICAO AS NOMECLASSE' +
           ' FROM IMOVELXBEM I , BEM B , GRUPO G, CLASSEDEBEM C  ' +
           ' WHERE I.IDIMOVEL =  ' + cdsIntegra.FieldByName('IDIMOVEL').asString  +
           ' AND I.IDBEM = B.IDBEM  ' +
           ' AND B.IDGRUPO = G.IDGRUPO  ' +
           ' AND G.CLASSE = C.CODHIERARQ(+) ';
   _cdsAux.Data := GetDataPacket(sSQL);
   try
      try
         _cdsAux.First;
         while not _cdsAux.Eof do
         begin
            nValRateio := (nValorAcres * (_cdsAux.FieldByName('IXBRATEIO').Value /100));
            if nValRateio > 0 then
            begin
                  // Registra evento no Imóvel
                  EventoImovel.RegistraEvento(cdsIntegra.FieldByName('IDIMOVEL').asInteger, -1, ParamSistema.idUsuario,
                                              -1, -1, cdsIntegra.FieldByName('DATAVENCIMENTO').asDateTime, -1,
                                              'AC', 'Acréscimo por Correção - ' +  _cdsAux.FieldByName('NOMECLASSE').AsString,
                                              'Acres.Correção - Aquis.Parc', 0, 0, nValRateio, False);

                  if ModuloImobiliario.InvestImob.bFlgIntegraAtivo then
                  begin

                     CtrlMovAcrescimoValor.OpenTransaction := False;
                     if CtrlMovAcrescimoValor.ExecutaAcrescimoValor(Sistema.IdModulo,
                                                                     Sistema.IdEmpresa,
                                                                     Sistema.IdUsuario,
                                                                     _cdsAux.FieldByName('IDBEM').AsInteger,
                                                                     cdsIntegra.FieldByName('DATAVENCIMENTO').asDateTime,
                                                                     1, // IDTIPODESPESA DO Acrescimo de Valor - TIPOCUSTORECIMOV
                                                                     nValRateio,
                                                                     'Acres.Correção - Aquis.Parc' ) then begin
                         iIdAcrescimo := CtrlMovAcrescimoValor.IdAcrescimo;
                     end
                     else
                     begin
                         iIdAcrescimo := -1;
                         Result       := False;
                         raise Exception.create(CtrlMovAcrescimoValor.MessageInfo);
                     end;
                  end;
            end;
            _cdsAux.Next;
         end;

         // insere a Observação na tabela ObsLancImovel
         FuncoesImob.InsertObsLanc(iDocumento, 'Acres.Correção - Aquis.Parc');
      except
         on E : Exception do begin
            MessageDlg(e.Message, mtWarning, [mbOK], 0);
            Result := False;
         end;
      end;
   finally
      FreeAndNil(_cdsAux);
   end;
end;
function TCtrlLancamentosImovel.VerificaCondPagParc(iIdImovel: Integer): Integer;
var cdsAux,cdsAux_LancToDocum : TCMClientDataSet;
    iPagto,iPagto_Apro : integer; sSQL  : string; dDataMov : TDateTime  ;
    iExercicio,iPeriodo : Integer;  dDataUltMov, dDataUltDep : TDateTime;
begin
   Result             := 0;
   iPagto             := 0;
   cdsAux             := TCMClientDataSet.Create(nil);
   cdsAux_LancToDocum := TCMClientDataSet.Create(nil);
   sSQL := ' SELECT L.IDIMOVEL          ' +
           ' FROM  LANCAMENTOSIMOVEL L  ' +
           ' WHERE L.IDLANCIMOVEL =     ' + FloatToStr(iIdImovel) +
           '   AND L.IDTIPOCUSTORECIMO = 235 ';
   cdsAux.Data := GetDataPacket(sSQL);
   if cdsAux.FieldByName('IDIMOVEL').asString <> '' then
   begin
      iIdImovelParc :=  cdsAux.FieldByName('IDIMOVEL').asInteger ;
      sSQL := ' SELECT L.NODOCUMENTO       ' +
              ' FROM  LANCAMENTOSIMOVEL L  ' +
              ' WHERE L.IDIMOVEL =  ' + IntToStr(iIdImovelParc) +
              '   AND L.IDTIPOCUSTORECIMO = 235 ';
      cdsAux.Data := GetDataPacket(sSQL);
      cdsAux.First;
      if cdsAux.FieldByName('NODOCUMENTO').asString <> '' then
      begin
          while  not cdsAux.eof  do
          begin
               sSQL := ' SELECT L.CODDOCUMENTO  ' +
                       ' FROM  LANCTODOCUM L  ' +
                       ' WHERE L.CODDOCUMENTO = ' + (cdsAux.FieldByName('NODOCUMENTO').asString) +
                       '   AND L.OPERACAO = 5 '  ;
               cdsAux_LancToDocum.Data := GetDataPacket(sSQL);
               if cdsAux_LancToDocum.FieldByName('CODDOCUMENTO').asFloat > 0  then
                  iPagto := 5;
               cdsAux.next;
          end;
          cdsAux.First;
          while  not cdsAux.eof  do
          begin
               sSQL := ' SELECT L.CODDOCUMENTO  ' +
                       ' FROM  LANCTODOCUM L  ' +
                       ' WHERE L.CODDOCUMENTO = ' + (cdsAux.FieldByName('NODOCUMENTO').asString) +
                       '   AND L.OPERACAO = 2 '  ;
               cdsAux_LancToDocum.Data := GetDataPacket(sSQL);
               if cdsAux_LancToDocum.FieldByName('CODDOCUMENTO').asFloat > 0  then
                  iPagto_Apro := 2;
               cdsAux.next;
          end;
      end;
      if iPagto = 5 then
         Result := 5
      else
      begin
         if iPagto_Apro = 2 then
            Result := 2;
      end;
   end;
   if Result = 0 then
   begin
      sSQL := ' SELECT HI.DATAMOVIMENTACAO, HI.IDBEM ' +
              ' FROM HISTORICOMOVIMENTACAO HI, IMOVELXBEM IB ' +
              ' WHERE HI.IDBEM    = IB.IDBEM ' +
              ' AND IB.IDIMOVEL = ' + IntToStr(iIdImovelParc) +
              ' AND HI.IDTIPOMOVIMENTACAO = 1 ';
      cdsAux.Data := GetDataPacket(sSQL);
      dDataMov    := cdsAux.FieldByName('DATAMOVIMENTACAO').value;
      if dDataMov > 0 then
      begin
          if not CafxContab.VerificaPeriodoContabil(Sistema.IdEmpresa,
                                                    dDataMov,
                                                    iExercicio,
                                                    iPeriodo ) then
             Result := 3; //Mês Fechado com Controle total.

          //-------------------------------------------------------------------------------
          // Verifica se a data da movimentação é válida
          //-------------------------------------------------------------------------------
          if not CtrlBem.VerificaPeriodoCAF(Sistema.IdEmpresa,
                                         cdsAux.FieldByName('IDBEM').AsInteger,
                                         1,
                                         '01',
                                         dDataMov, dDataUltMov, dDataUltDep) then
              Result := 3; //Mês CAF Fechado com Controle total.


      end;
   end;
   FreeAndNil(cdsAux);
   FreeAndNil(cdsAux_LancToDocum);

end;
function TCtrlLancamentosImovel.VerificaLancDescr(nIdCondPagAquisparc: Extended): Integer;
var cdsAux,cdsAux_LancToDocum : TCMClientDataSet;
    iPagto,iPagto_Apro  : Integer; sSQL  : string;
begin
   Result             := 0;
   iPagto             := 0;
   cdsAux             := TCMClientDataSet.Create(nil);
   cdsAux_LancToDocum := TCMClientDataSet.Create(nil);

   sSQL := ' SELECT L.IDIMOVEL          ' +
           ' FROM  LANCAMENTOSIMOVEL L  ' +
           ' WHERE L.IDLANCIMOVEL =  ' + FloatToStr(nIdCondPagAquisparc) +
           '   AND L.IDTIPOCUSTORECIMO = 235 ';
   cdsAux.Data := GetDataPacket(sSQL);
   if cdsAux.FieldByName('IDIMOVEL').asString <> '' then
   begin
      iIdImovelParc :=  cdsAux.FieldByName('IDIMOVEL').asInteger ;
      sSQL := ' SELECT L.NODOCUMENTO      ' +
              ' FROM  LANCAMENTOSIMOVEL L  ' +
              ' WHERE L.IDIMOVEL =  ' + IntToStr(iIdImovelParc) +
              '   AND L.IDTIPOCUSTORECIMO = 235 ';
      cdsAux.Data := GetDataPacket(sSQL);
      cdsAux.First;
      if cdsAux.FieldByName('NODOCUMENTO').asString <> '' then
      begin
          while  not cdsAux.eof  do
          begin
               sSQL := ' SELECT L.CODDOCUMENTO  ' +
                       ' FROM  LANCTODOCUM L  ' +
                       ' WHERE L.CODDOCUMENTO = ' + (cdsAux.FieldByName('NODOCUMENTO').asString) +
                       '   AND L.OPERACAO = 5 '  ;
               cdsAux_LancToDocum.Data := GetDataPacket(sSQL);
               if cdsAux_LancToDocum.FieldByName('CODDOCUMENTO').asFloat > 0  then
                  iPagto := 5;
               cdsAux.next;
          end;
          cdsAux.First;
          while  not cdsAux.eof  do
          begin
               sSQL := ' SELECT L.CODDOCUMENTO  ' +
                       ' FROM  LANCTODOCUM L  ' +
                       ' WHERE L.CODDOCUMENTO = ' + (cdsAux.FieldByName('NODOCUMENTO').asString) +
                       '   AND L.OPERACAO = 2 '  ;
               cdsAux_LancToDocum.Data := GetDataPacket(sSQL);
               if cdsAux_LancToDocum.FieldByName('CODDOCUMENTO').asFloat > 0  then
                  iPagto_Apro := 2;
               cdsAux.next;
          end;
      end;
      if iPagto = 5 then
         Result := 5
      else
      begin
         if iPagto_Apro = 2 then
            Result := 2;
      end;
   end;
   FreeAndNil(cdsAux);
   FreeAndNil(cdsAux_LancToDocum);
end;

function TCtrlLancamentosImovel.VerificaMov(iIdBem: Integer): TDateTime;
var cdsAux : TCMClientDataSet;  sSQL  : string;
begin
   Result  := 0;
   cdsAux             := TCMClientDataSet.Create(nil);
   sSQL := ' SELECT MIN(H.DATAMOVIMENTACAO) AS DATAMOVIMENTACAO ' +
           ' FROM HISTORICOMOVIMENTACAO H   ' +
           ' WHERE H.IDBEM =  ' + FloatToStr(iIdBem) ;
   cdsAux.Data        := GetDataPacket(sSQL);
   if cdsAux.FieldByName('DATAMOVIMENTACAO').asString <> '' then
   begin
       Result := cdsAux.FieldByName('DATAMOVIMENTACAO').asDateTime;
   end;
   FreeAndNil(cdsAux);
end;
function TCtrlLancamentosImovel.DelAquisParc(iIdImovel: Integer): Boolean;
var  sSQL  : string;
begin
   Try
      sSQL := ' DELETE FROM condpagaquisparc ' +
           ' WHERE IDIMOVEL =  ' + FloatToStr(iIdImovel) ;
      if not ExecSQL(sSql, True) then
         Raise Exception.Create(MessageInfo);
      Result := True;
   except
        Result:= False;
   end;
       end;

function TCtrlLancamentosImovel.LookupAquiParcelada( const iIdResponsavel: Integer; const bRespNulo: Boolean;
  const sVigencia: String): OleVariant;
var sSql, sParam: string;
begin
    if iIdResponsavel <> -1 then
    begin
       if bRespNulo then
          sParam := sParam + ' AND ( L.TRGUSERINCLUSAO IS NULL OR L.TRGUSERINCLUSAO = ' + IntToStr(iIdResponsavel) + ' )'
       else
          sParam := sParam + ' AND L.TRGUSERINCLUSAO = ' + IntToStr(iIdResponsavel);
    end;
    // Define Sql
    sSql := ' SELECT (L.CODDOCUMENTO || '' - '' || IM.IMONOME) NOMECONTRATO  ,    ' + #13+
            ' L.DATAVENCIMENTO AS DATALIMITE,     '+#13+
            ' DECODE(L.USU_INC, NULL, L.TRGUSERINCLUSAO, US.NOMEUSUARIO) AS TRGUSERINCLUSAO, '+#13+
            ' DECODE(L.USU_INC, NULL, L.TRGUSERINCLUSAO, U.NOME) AS USUARIO  '+ #13+
            ' FROM     '+#13+
            ' ( SELECT L1.* ,  '+#13+
            ' DECODE(SUBSTR(TRGUSERINCLUSAO,1,2),''CM'',TRGUSERINCLUSAO, NULL) AS USU_INC  '+#13+
            ' FROM LANCAMENTOSIMOVEL L1) '+#13+
            ' L , PESSOA U, USUARIOSISTEMA US , IMOVEL IM  '+#13+
            ' WHERE L.IDCONDPAGAQUISPARC > 0   '+#13+
            '   AND L.IDIMOVEL = IM.IDIMOVEL   '+#13+
            '   AND SUBSTR(L.USU_INC,3,30) = U.IDPESSOA(+)  '+#13 +
            '   AND SUBSTR(L.USU_INC,3,30) = US.IDUSUARIO(+)'+#13 + sParam;
    Result := GetDataPacket(sSql);
end;

function TCtrlLancamentosImovel.UltimaMov(iIdBem: Integer): TDateTime;
var cdsAux : TCMClientDataSet;  sSQL  : string;
begin
   Result  := 0;
   cdsAux             := TCMClientDataSet.Create(nil);
   sSQL := ' SELECT MAX(H.DATAMOVIMENTACAO) AS DATAMOVIMENTACAO ' +
           ' FROM HISTORICOMOVIMENTACAO H   ' +
           ' WHERE H.IDBEM =  ' + FloatToStr(iIdBem) ;
   cdsAux.Data        := GetDataPacket(sSQL);
   if cdsAux.FieldByName('DATAMOVIMENTACAO').asString <> '' then
   begin
       Result := cdsAux.FieldByName('DATAMOVIMENTACAO').asDateTime;
   end;
   FreeAndNil(cdsAux);

end;
{
SOL 180032   KTN 1674608 - INICIO - BARUC
ROTINA UTILIZADA PARA ARREDONDAMENTO DE VALORES
}
function TCtrlLancamentosImovel.TBRound(Value: Extended; Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals); // A conversão para string e depois para float evita    erros de arredondamentos indesejáveis.
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.5 then
    Result := Result + 1
  else if Fraction <= -0.5 then
    Result := Result - 1;
  Result := Result / Factor;
end;

{
SOL 180032   KTN 1674608 - INICIO - BARUC
ROTINA UTILIZADA PARA TRUNCAMENTO DE VALORES
}
function TCtrlLancamentosImovel.TBTrunc(Value: Extended; Decimals: integer): Extended;
var
  Factor, Fraction: Extended;
begin
  Result := Trunc(Value * 100) / 100; // X será 135.54
end;

// SOL 180032   KTN 1674608 - FIM - BARUC

{Início - Michelle Mota - SIG26054}
function TCtrlLancamentosImovel.ListaVoto(idPessoa: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT VG.IDPESSOA as IDPESSOA FROM CM.VOTOGESTAOIMOVEL VG, CM.IMOVEISXVOTO IV '+  
          'WHERE VG.IDVOTOGESTAOIMOVEL = IV.IDVOTOGESTAOIMOVEL '+
          //'  AND IV.IDPESSOA = ' + IntToStr(idPessoa); //Darivaldo Alencar SG 26054
          ' AND VG.IDPESSOA = ' + IntToStr(idPessoa); //Darivaldo Alencar SG 26054
  Result := GetDataPacket(sSQL);
end;

function TCtrlLancamentosImovel.ListaVotoGrupo(idImovel, idVoto: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT * FROM IMOVEISXVOTO WHERE IDIMOVEL = ' + IntToStr(idImovel) +
          ' AND IDVOTOGESTAOIMOVEL = ' + IntToStr(idVoto);

  Result := GetDataPacket(sSQL);
end;


function TCtrlLancamentosImovel.ListaSaldoVoto(idVoto: integer): OleVariant;
var
  sSQL : string;
begin
  //Início - Darivaldo Alencar - SIG 26054
  sSQL :=  'SELECT (VI.VLRAPROVADO - NVL(T2.VALOR, 0)) AS SALDO                                                    '+
           '   FROM VOTOGESTAOIMOVEL VI                                                                            '+
           '   LEFT JOIN (SELECT SUM(VALOR) VALOR, IDVOTOGESTAOIMOVEL                                              '+
           '           FROM (SELECT DV.IDVOTOGESTAOIMOVEL,                                                         '+
           '                        CASE                                                                           '+
           '                          WHEN DOC.RECPAG = ''P'' THEN                                                 '+
           '                           SUM(DECODE(LD.DEBCRE, ''C'', LD.VALOR, (LD.VALOR * -1)))                    '+
           '                          ELSE                                                                         '+
           '                           SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, (LD.VALOR * -1)))                    '+
           '                        END VALOR                                                                      '+
           '                   FROM DOCUMENTOXVOTO DV                                                              '+
           '                   JOIN DOCUMENTO DOC ON DOC.CODDOCUMENTO = DV.CODDOCUMENTO                            '+
           '                   JOIN LANCTODOCUM LD ON DOC.CODDOCUMENTO = LD.CODDOCUMENTO AND LD.OPERACAO <> 5      '+
           '                  WHERE DV.IDVOTOGESTAOIMOVEL = '+ IntToStr(idVoto)                                     +
           '                  GROUP BY DV.IDVOTOGESTAOIMOVEL, DOC.RECPAG) T                                        '+
           '          GROUP BY IDVOTOGESTAOIMOVEL) T2 ON T2.IDVOTOGESTAOIMOVEL = VI.IDVOTOGESTAOIMOVEL             '+
           ' WHERE VI.IDVOTOGESTAOIMOVEL = '+ IntToStr(idVoto);
    //Término - Darivaldo Alencar - SIG 26054

  Result := GetDataPacket(sSQL);
end;
{Término - Michelle Mota - SIG26054}

function TCtrlLancamentosImovel.ListProcessos(pIdForCli: integer;
  pDataLancamento: TDateTime): OleVariant;
begin
	Result := GetDataPacket('SELECT IDPROCESSO, NUMERO '+
  												'	 FROM PROCESSOS '+
                          ' WHERE IDFORCLI = ' + IntToStr(pIdForCli) +
                          '   AND (DATAFIM IS NULL) OR (DATAFIM >= TO_DATE('+ QuotedStr(DateToStr(pDataLancamento))+ ', ''DD/MM/YYYY''))');
end;

function TCtrlLancamentosImovel.ListTipoServico: OleVariant;
begin
  Result := GetDataPacket('SELECT IDTIPOSERVICO, DESCRICAO FROM TIPOSERVICO');
end;

function TCtrlLancamentosImovel.ListaDadosCPRBFornecedor(
  pIdForCli: integer): OleVariant;
begin
	Result := GetDataPacket('SELECT NVL(FLGCPRB,0) AS FLGCPRB, NVL(ALIQCPRB, 11) AS ALIQCPRB ' +
          								'  FROM EMPRESAFORN ' +
  												' WHERE IDFORCLI =  ' + IntToStr(pIdForCli));
end;

function TCtrlLancamentosImovel.VerificaTipoDespesaMaoDeObra(
  iTipoCustoRecImo: integer): boolean;
var
	sSQL : string;
  cdsAux : TCMClientDataSet;
begin
  Result := false;
  cdsAux := TCMClientDataSet.Create(nil);

  try
  	sSQL := 'SELECT IDTIPOCUSTORECIMO '+#13+
  				'  FROM TIPOCUSTORECIMOV '+#13+
          ' WHERE IDTIPOCUSTORECIMO = ' + IntToStr(iTipoCustoRecImo) +#13+
          '   AND FLGMAODEOBRA = ''S''';

    cdsAux.Data := GetDataPacket (sSQL);

    if not (cdsAux.IsEmpty) then
      Result := true;
      
  finally
    FreeAndNil(cdsAux);
  end;
end;

end.


