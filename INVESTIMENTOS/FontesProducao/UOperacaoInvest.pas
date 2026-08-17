//******************************************************************************
// Data      : 13/05/2008
// Código    : AL_29
// Pendencia : 25129
// SOL       : 58645
// Desc      : Implementação do campo de integração por Módulos do item Opções de Indice
//******************************************************************************
// Data      : 29/01/2007
// Código    : AL_28
// Pendencia :
// SOL       :
// Desc      : Ajuste na crítica de Tipo de Operação na AlimentaOperCustodia
//******************************************************************************
// Data      : 23/01/2007
// Código    : AL_27
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDMOTBLOQPENFDO, IDCARTEIRARF para Bloqueio de
//             Fundos e Penhora com o Jurídico
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_26
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de Bloqueio Contabil e Financeiro por Módulo
//******************************************************************************
// Data     : 04/01/2007
// Código   : AL_25
// Pendencia: 24122
// SOL      :
// Desc     : Ajuste na gravação do histórico de custódia
//******************************************************************************
// Data     : 06/11/2006
// Código   : AL_24
// Pendencia: 22492
// SOL      :
// Desc     : Implementação de Contabilização em dias úteis para ativos de
//              Renda Fixa que geram registros em dias não uteis Contabiliza
//              FLGCONTABDIAUTIL
//******************************************************************************
// Data     : 26/09/2006
// Código   : AL_23
// Pendencia: 22961, 22965
// SOL      :
// Desc     : Segregação de Planp/Patrocinadora
//******************************************************************************
// Data     : 22/08/2006
// Código   : AL_22
// Pendencia: 22957
// SOL      :
// Desc     : Implementação do Plano/Patro de Destino na OPERCUSTODIA
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_20
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 09/02/2006
// Código   : AL_19
// Pendencia:
// Sol      :
// Motivo   : Criação do campo PZORECCPMF e DATAINIRECCPMF na RetParamInvest para
//            identificar o dia para recolhimento do CPMF
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_17
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP e DTAREGIMECXCOMP na PARAMINVEST para testar a utilização
//            de regime de Caixa ou Competência nas Operações de Renda Fixa
//********************************************************************************************************
//Data	    :  14/10/2005
//          :  AL_16
//Função    :  Inclusão do Parâmetro IDTIPOOPERDIRDSA e IDTIPOOPERDIRDSR no registro do Parâmetro
//********************************************************************************************************
//Data	    :  13/10/2005
//          :  AL_15
//Função    :  Inclusão do Parâmetro IDTIPOOPERRFRAC no registro do Parâmetro
//******************************************************************************
// Data     : 05/10/2005
// Código   : AL_14
// Motivo   : Para a operação de inicialização de saldo será verificado se há saldo novo e antigo e
//            esses serão somados no dia.
//******************************************************************************
// Data     : 09/08/2005
// Código   : AL_13
// Motivo   : Ajuste na AlimentaOperCustodia para verificar os parametros com > 0
//            Retirada de componente sem utilização
//******************************************************************************
// Data     : 21/06/2005
// Código   : AL_12
// Motivo   : Inclusão do Campo IDTIPOOPERACAO na rotina AlimentaOperCustodia
//******************************************************************************
// Data     : 28/04/2005
// Código   : AL_11
// Motivo   : Inclusão do Parâmetro FLGPOUPAPROPDIA no PRpi
//******************************************************************************
// Data     : 30/03/2005
// Código   : AL_10
// Motivo   : Fechamento de qry's
//******************************************************************************
// Data     : 18/02/2005
// Código   : AL_9
// Motivo   : Criação de uma nova rotina para exclusão de Custódia
//******************************************************************************
// Data     : 06/12/2004
// Código   : AL_8
// Motivo   :
//********************************************************************************************************
// Data     : 29/11/2004
// Código   : AL_7
// Motivo   : Implementação do FLGRECPAGRV
//******************************************************************************
// Data     : 23/11/2004
// Código   : AL_6
// Motivo   : Habilitação da rotina de atualização de custodia com as operações de pendencias
//******************************************************************************
// Data     : 06/10/2004
// Código   : AL_5
// Motivo   : Alteração Legislação CPMF
//******************************************************************************
// Data     : 30/09/2004
// Código   : AL_4
// Motivo   : Implementacao da DTMUDACPMF
//******************************************************************************
// Data     : 15/07/2004
// Código   : AL_3
// Motivo   : Muda o tratamento na custódia da operação de grupamento ( Movimento tipo I)
//******************************************************************************
// Data     : 03/07/2004
// Código   : AL_2
// Motivo   : Busca Qtd total das operações de Pendencia quando a qtd da operação for 0
//******************************************************************************
// Data     : 22/06/2004
// Código   : AL_1
// Motivo   : Inclusão de variável na função BuscaTodosSaldosInvestLote
//******************************************************************************
// Data     : 17/05/2004
// Origem   : CM
// Motivo   : Implementacao do campo FLGINTFINLIQ no Registro RetParamInvest1
//******************************************************************************

unit UOperacaoInvest;

//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//       ATENÇÃO: UOperacaoInvest NECESSITA do DataModule dOperacaoInvest/dtmOperacaoInvest
//	-------------------------------------------------------------------------------------------------
//	-------------------------------------------------------------------------------------------------
//
//	UOperacaoInvest
//
//	Modificações:18/05/1999  -  Correções de algumas cláusulas nas queries UPDATE (André)
//                   19/05/1999  -  Passagem de parâmetros nulos quando necessário (André)
//                   22/05/1999  -  Passagem do parâmetro IDHISTCARTINV, seqüencial (Augusto)
//                               -  + uma série de alterações e comentários (Augusto)
//                   26/05/1999  -  Fechamento das queries pelo nome real (André)
//                               -  'Case' substituindo 'ifs' na Definição dos Saldos Finais (André)
//                   11/08/1999  -  Alteração nos parâmetros passados para a LancaContab (máscara do
//                                  plano de contas, basicamente)
//                               -  Criação de uma nova query para trazer a máscara do plano de contas
//                                  (para suprir o novo parâmetro da LancaContab)
//                   24/08/1999  -  Alimenta Carteira passa a aceitar valores negativos (Flavio Mendonça)
//                   31/08/1999  -  Alimenta Carteira deixa de atualizar saldos: isso passa a ser feito
//                                  pela nova função Atualiza Saldos (Ana)
//                   28/09/1999  -  Alimenta Carteira: Trata mais uma natureza de operação ('R' de
//                                  de Rendimentos), ganha mais um Parâmetro (IDLOTE = Lote do Investi-
//                                  mento, que é alimentado para o mercado de opções)
//                                  Atualiza Saldo: Inclui tratamentos acima detalhados (Rendimentos e
//                                  Lote do Investimento); Alteração das queries qrySaldoInvestimento,
//                                  qryAtualizaSaldoI e qryHistoricoCarteira para tratar IDLOte e cal-
//                                  lar Saldos de Preço Atuarial, Custo de Aquisição, Custo de Carrega-
//                                  e Rendimento.
//                   13/11/2000  -  Adicionados novas subtipos ao registro TRecParamInvest, utilizado
//                                  pela função TOperacaoInvest.RetParamInvest
//                                  ( IDTIPOOPERLIQPEND e IDBMF )
//                                  .
//
// -------------------------------------------------------------------------------------------------

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, USistema, Wwquery, OleCtrls, vcf1, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, TB97Tlbr, TB97, ExtCtrls,FAguardeInv;

Type
//------------------------------------------------------------------------------
// Registro com as Cotacoes
   TRecCotacoes = Record
                    VlrAbertura  :Double;
                    VlrFechamento:Double;
                    VlrMaxima    :Double;
                    VlrMinima    :Double;
                    VlrMedia     :Double;
                    VolNegociado :Double;
                    QtdLote      :Integer;
                    DataCotacao  :TDateTime;
                  End;
// Registro com os Saldos
   TRecSaldos = Record
                  SldQtdInvCart,
                  SldVlrInvCart,
                  SldAtuarial,
                  SldAquisicao,
                  SldRendimento,
                  SldCarregamento,
                  SldVariacao,
                  SldJuros,
                  SldPremio,
                  SldMercado:Double;
                  DataSaldo:TDateTime;
                End;

// Registro com os parâmetros de investimento
   pRecParamInvest = ^PTRecParamInvest;
   PTRecParamInvest = Record
                       IDPARAMINVEST     : LongInt;
                       MASCSETOREMISSOR  : String;
                       MOECODIGO         : LongInt;
                       MASCCLASSIFINV    : String;
                       VLRDIVERG         : Extended;
                       VLRCOTAINICART    : Extended;
                       DATAULTFECH       : TDateTime;
                       FLGORDMOVINV      : String; {Char}
                       PERCPUORDMOVINV   : Extended;
                       PERCIMPRENDA      : Extended;
                       MOEDAATU          : LongInt;
                       PERCPARTICEMPR    : Extended;
                       TRGDTINCLUSAO     : TDateTime;
                       TRGUSERINCLUSAO   : String;
                       PERCPARTICRECUR   : Extended;
                       IDPARAMPATRLIQ    : LongInt;
                       TIPOMENU          : String; {Char}
                       DATAULTFECHRF     : TDateTime;
                       IDTIPODESPIRAPU   : LongInt;
                       IDTIPODESPINVEST  : LongInt;
                       MOEDAGER          : LongInt;
                       FLGPROVISIONAIRRF : String; {Char}
                       FLGPROVISIONAIRRV : String; {Char}
                       PUCDB             : Extended;
                       DATAMOVCDBLIB     : TDateTime;
                       IDTIPODESPIRPROV  : LongInt;
                       MOEDAATULIT       : LongInt;
                       IDPROGRAMA        : LongInt;
                       IDTIPOCLIENTECOR  : LongInt;
                       IDTIPOOPERDIRINC  : LongInt;
                       IDTIPOOPERDIRCIS  : LongInt;
                       IDTIPOOPERDIRDES  : LongInt;
                       IDTIPOOPERDIRGRU  : LongInt;
                       IDTIPOOPERDIRPER  : LongInt;
                       IDTIPOOPERDIRBON  : LongInt;
                       IDTIPOOPERDIRDIV  : LongInt;
                       IDTIPOOPERDIRSUB  : LongInt;
                       IDTIPOINVEST      : LongInt;
                       IDTIPOOPERDIRJUR  : LongInt;
                       IDTIPOCLIENTEEMI  : LongInt;
                       IDTIPOCLIENTECUS  : LongInt;
                       IDTIPOCONTRRF     : LongInt;
                       IDBVSP            : LongInt;
                       IDTIPOINVESTIDOR  : LongInt;
                       IDMERCADO         : LongInt;
                       IDTIPOOPERLIQPEND : LongInt;
                       IDBMF             : LongInt;
                       IDTIPOCONTRFIN    : LongInt;
                       DATAULTFECHFDO    : TDateTime;
                       DATAULTFECHBMF    : TDateTime;
                       IDTPPERIODICIDADE : LongInt;
                       DATAULTIMPCOT     : TDateTime;
                       IDTIPOOPERDIRALT  : LongInt;
                       IDRAMOFORCOR      : LongInt;
                       IDRAMOFOREMI      : LongInt;
                       IDRAMOFORCUS      : LongInt;
                       FLGLIBERAIDLOTE   : String;
                       IDTIPOOPERDIRRES  : LongInt;
                       FLGUSASUBCONTA    : String;
                       PERCDEVRV         : Extended;
                       PERCDEVBMF        : Extended;
                       DIASEMANACPMF     : String;
                       DIASUTEISCPMF     : LongInt;
                       IDCUSTODIARENFIX  : LongInt;
                       IDTIPOREGRARV     : LongInt;
                       IDTIPOREGRARF     : LongInt;
                       IDTIPOREGRABMF    : LongInt;
                       FLGIMPLANTARF     : String;
                       FLGCONTABILIZA    : String;
                       FLGINTCAPCAR      : String;
                       IDCONTRAPARTERF   : LongInt;
                       IDAUTORIZAORDEM   : LongInt;
                       IDCLASSEPOUP      : LongInt;
                       FLGEMPACOES       : String;
                       IDCARTEMPACOES    : LongInt;
                       IDREGRAEMPACOES   : LongInt;
                       IDMOTBLOQEMPAC    : LongInt;
                       FLGCARTGERENC     : String;
                       IDINDEXPOUPANCA   : LongInt;
                       JUROSPOUPANCA     : Extended;
                       IDTIPOOPERDIRMUL  : LongInt;
                       IDPLANPREVCTBPATR : LongInt;
                       IDOPERAMORTPRINC  : LongInt;
                       IDOPERINCJUROS    : LongInt;
                       IDOPERPAGTOJUROS  : LongInt;
                       FLGESPECFUNDO     : String;
                       FLGCOMPVARRV      : String;
                       PRZVENCBMF        : LongInt;
                       PRZVENCCFIANCA    : LongInt;
                       IDTIPOREGRAFND    : LongInt;                       
                       IDCLASSPOUPBLOQ   : LongInt;
                       IDTIPOREGRARENT   : LongInt;
                       DATAMOVTORV       : TDateTime;
                       IDTIPOREGRAATUAR  : LongInt;
                       FLGPLANPREVCTBPAT : String;
                       IDCLASSNTN        : LongInt;
                       IDTIPOOPERDIRREE  : LongInt;
                       DATAULTFECHEMP    : TDateTime;
                       IDTIPOOPERDIRPROV : LongInt;
                       IDTIPOOPEROPCCP   : LongInt;
                       IDTIPOOPEROPCVD   : LongInt;
                       MOEDAEQM          : LongInt;
                       STARET            : String;
                       DATAULTRET        : TDateTime;
                       IDCARTOPCIND      : LongInt;
                       IDCARTOPC         : LongInt;
                       IDMOTBLOQOPC      : LongInt;
                       IDCARTAVISTA      : LongInt;
                       DIFMAXOPCIND      : Extended;
                       IDTIPOREGRAOPCIN  : LongInt;
                       IDTIPOREGRAEMPAC  : LongInt;
                       IDTIPODESPDVCOR   : LongInt;
                       IDGRUPOREGRAINV   : LongInt;
                       FLGDEMO           : String;
                       FLGINTFINLIQ      : String;
                       //AL_4
                       DTMUDACPMF        : TDateTime;
                       //Al_6
                       FLGRECPAGRV       : String;
                       //Al_8
                       IDTIPOOPERDIRDSU  : Integer;
                       DIFRESGFUNDOS     : Integer;
                       //AL_11
                       FLGPOUPAPROPDIA   : String;
                       //Renan Cristiano - SOL: 39931 | Kintana: 523366 Inicio
                       DATARELMOVIMENTO  : TDateTime;
                       DATARELINICIAL    : TDateTime;
                       //Renan Cristiano - SOL: 39931 | Kintana: 523366 Fim                       
                       //AL_15
                       IDTIPOOPERRFRAC   : Integer;
                       //AL_16
                       IDTIPOOPERDIRDSA  : Integer;
                       IDTIPOOPERDIRDSR  : Integer;
                       //AL_17
                       FLGREGIMECXCOMP   : String;
                       DTAREGIMECXCOMP   : TDateTime;
                       //Al_19 - 09/02/2006
                       PZORECCPMF        : Integer;
                       DATAINIRECCPMF    : TDateTime;
                       //AL_24
                       FLGCONTABDIAUTIL  : String;
                       //AL_26
                       FLGINTCONTABRF    : String;
                       FLGINTCONTABRV    : String;
                       FLGINTCONTABBMF   : String;
                       FLGINTCONTABFRF   : String;
                       FLGINTCONTABFRV   : String;
                       FLGINTCONTABFIM   : String;
                       FLGINTCONTABFDC   : String;
                       FLGINTCONTABFIP   : String;
                       //AL_29
                       FLGINTCONTABOPI   : String;
                       //AL_27
                       IDMOTBLOQPENFDO   : LongInt;
                       IDCARTEIRARF      : LongInt;
                       //--Emerson SOL 110583  9.03.2009 Inicio--//
                       REGRABOLETA       : String;
                       //--Emerson SOL 110583  9.03.2009 Fim-----//
                       //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
                       DATAVIGDIR        : TDateTime;
                       TPDATAVIGDIR      : String;
                       //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
                       IDCARTORIGEMPACOES : Integer;

                     End;

// Registro com os parâmetros de Operações de Direito
  TRegTipoOperacao = Record
    FLGGERACONTAB                            : Boolean;
    FLGGERACAPCAR                            : Boolean;
    FLGGERACAF                               : Boolean;
    FLGTRANSF                                : Boolean; {S/N}
    FLGCORRET                                : Boolean; {S/N}
    FLGORDMOVINV                             : Boolean; {S/N}
    FLGOPDIREITO                             : Boolean; {S/N}
    FLGAGE                                   : Boolean; {S/N}
    FLGDATAEX                                : Boolean; {S/N}
    FLGDATACOM                               : Boolean; {S/N}
    FLGINVORIGEM                             : Boolean; {S/N}
    FLGPERC                                  : Boolean; {S/N}
    FLGPARIDADE                              : Boolean; {S/N}
    FLGPRZBOLSA                              : Boolean; {S/N}
    FLGPRZEMP                                : Boolean; {S/N}
    FLGATADEC                                : Boolean; {S/N}
    FLGFORMAPAGREC                           : Boolean; {S/N}
    FLGDIVACAO                               : Boolean; {S/N}
    FLGINIPAG                                : Boolean; {S/N}
    FLGJUROS                                 : Boolean; {S/N}
    TIPSALDOCARTORIG                         : Boolean; {S/N}
    TIPSALDOCARTDEST                         : Boolean; {S/N}
    FLGTRATAIR                               : String; {S/N}
    PERCENTUAL                               : Extended;
    DIVPORACAO                               : Extended;
    PARIDADE                                 : Extended;
    IDMERCADO                                : Longint;
    //----------Emerson SOL 110583  9.03.2009 Inicio---------//
    REGRABOLETA                              : String;
    //----------Emerson SOL 110583  9.03.2009 Fim------------//
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    DATAVIGDIR                               : TDateTime;
    TPDATAVIGDIR                             : String;
  End;

//------------------------------------------------------------------------------
// Definição da Classe TOperacaoInvest
   TOperacaoInvest = Class(TObject)
   private
      Function SimNao(S : String) : Boolean;


   public
      Function ExecutaQuery         (Qry:TwwQuery; Const Str:String) :Boolean;
      Function FazQuery             (Var Qry:TwwQuery; Str:String)   :Boolean;

      //AL_23
      Function BuscaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia,
                                    IdCustodiante, IdMotivoBloqueio: Integer;
                                    IdLote: String; DataReferencia:TDateTime;
                                    Var fSdoBloqueado, fSdoLiberado: Double): boolean;

      // Função que Testa se existe Saldo no HistCustodia para uma Determinada Quantidade
      //AL_23
      Function TestaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia,
                                    IdCustodiante, IdMotivoBloqueio: Integer;
                                    IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                                    fQuant: Double): boolean;

      // Função que Insere Registro no HistCustodia
      //AL_23
      //AL_20
      Function InsereCustodia(IdCarteira, IdInvestimento,IdCustodiante, IdMotivoBloqueio, IdOperacao,idOperCustodia: Integer;
                              IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                              fQuant: Double;
                              var iIdHistCustodia:Integer;
                              iPlanPrev: Integer = -1;
                              iTipoConta : Integer = 0): boolean;

      // Função que Calula Saldo do Dia para TIR
      function CalculaSaldoDiaTIR(iInvestimento, iCarteira, iTipoInvest : longint;
      sLote: string; dDataRef, dDataOperFim, dDataSaldoFinal: TDateTime; var iFlag: smallint;
      bFluxoTitulo : boolean): double;

      // Função que Calcula TIR de Investimentos Mobiliários - Renda Fixa e Variável
      function CalculaTIRMob(iInvestimento, iCarteira, iTipoInvest: longint; sLote: string;
      dDataOperInicio, dDataOperFim, dDataSaldoFinal : TDateTime; bMostraMsg, bDiasUteis: boolean; var fTIR: double; var iCalcula: smallint): boolean;

      // Busca as Cotacoes de uma acao em uma data (Retorna um registro com as cortacoes)
      Function BuscaCotacoesAcao(IdAcao, IdBolsaValores :Integer; DataRef:TDateTime; Aproximado:Boolean):TRecCotacoes;

      // Busca os Saldos de um Investimento/Lote
      Function BuscaSaldosLote(IdInvestimento: Integer; IdLote :String;
                               DataReferencia:TDateTime):TRecSaldos;

      // Função que Calcula Taxa Over para um Investimento num Período.
      function CalculaTaxaOver(iInvestimento: longint; dDataInicial, dDataFinal: TDateTime): double;

      // Função que Registra Custodia no HistCustodia, a partir do FlgCustodia do HistCartInv.
      function CadastraCustodia (iOperacao: longint): boolean;

      // Função que Atualiza Saldos de Carteira/Investimento/Lote/Custodiante no HistCustodia
      function AtualizaSaldosCustodia: boolean;

      // Função que Busca Data e Valor Aplicado na Primeira Operacao de um Contrato
      function BuscaInicioAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                                    var dDataInicio : TDateTime; var fValInicio: double): boolean;

      // Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Contrato num
      //     determinado Periodo. Se nao informar data inicial, considera data da primeira
      //     operacao registrada no Histcartinv. Se nao informar data final, considera data corrente.
      function BuscaSaldosAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                                    dDataInicio, dDataFim : TDateTime;
                                    var fValAplicado, fRendimento, fResgate,
                                    fRendto,fJuros,fVariacao,fAgio: double): boolean;

      // Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Tipo de Aplicação num
      //     determinado Periodo. Se nao informar data inicial e final, considera data corrente.
      function BuscaSaldosTipoAplic(iCarteira: longint; sTipoAplicacao: string;
                                    dDataInicio, dDataFim : TDateTime;
                                    var fValAplicado, fRendimento, fResgate: double): boolean;

      // Função que Busca Saldos dos Investimentos de um Emissor numa data de referencia,
      //     para uma Classe de Investimentos de RendaFixa, a vencer no período informado.
      function BuscaSaldoAplicEmissor(iEmissor, iClasse: longint;
                                    dDataRef, dIniVenc, dFimVenc : TDateTime;
                                    var fSaldo: double): boolean;

      function RetParamInvest1(var pRegParInv: PTRecParamInvest;DatabaseTrabalho: String): Boolean;

      Function RetParamOperDireito(OperacaoDireito : Integer;
                                   Var RegTO : TRegTipoOperacao;
                                   NomeDatabase : String) : Boolean;

      function RefazContabDireito(dDataIni, dDataFim: TDateTime; bTransacao: Boolean): Boolean;


      //AL_12 - 21/06/2005
      //AL_22
      function AlimentaOperCustodia(idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,iIdHistCartInvOrig,
                                    iIdHistCartInvDest,iIdCarteiraOrig,iIdCarteiraDest,iIdInvestimento ,
                                    iIdCustodianteOrig,iIdCustodianteDest ,iIdMotBloqOrig,iIdMotBloqDest : integer;
                                    fQtd : Double;
                                    dtMovCustodia :TDateTime;
                                    sLote,sBoleta:string;
                                    iPlanPrev      : Integer = -1;
                                    iTipoOperacao : Integer = -1;
                                    iPlanPrevDest : Integer = -1): Boolean;

      function AtualizaOperCustodia(idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,
                                    iIdHistCartInvOrig,iIdHistCartInvDest : integer): Boolean;

      // AL_9
      function ExcluiCustodia(sBoleta: String = '';
                              iOperCustodia: Integer = -1;
                              iOperacaoInvest: Integer = -1;
                              bMostraMens: Boolean = False): Boolean;
   end;


var
  OperacaoInvest : TOperacaoInvest;
  // Variaveis de Transferencia de Informacoes para UOperacaoInvest ...
  VetSaldoDiaData : Array[1..100] of TDate;
  VetSaldoDiaVlr  : Array[1..100] of Double;
  I : Byte;

implementation
uses
  ULancContab, dOperacaoInvest, UDocumento, uIntegraBack, UMensErro,
  ULancFinanc, UFuncaoGeral, UAutorizacao, DBaseDados, UDatabase, UDiasUteisInv,
  UDiasUteis, UBibliotecaInvest, Math, UFuncoesRendaFixa, UOperComum, DOperComum,
  dFuncoesInvest,URendaFixa, fPrincipal, dRendaVariavel;

//--------------------------------------------------------------------------------------------------
//    Função que Alimenta Carteira
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       sNaturezaMovimento :  Tipo de movimentacao a ser efetuada na carteira:
//                               A - Aumenta quantidade de cotas (compra)
//                               D - Diminui quantidade de cotas (venda)
//                               O - Aumenta valor da cota (receita)
//                               U - Diminui valor da cota (despesa)
//                               G - Aumento da Cotacao do Investimento
//                               P - Diminuição da Cotacao do Investimento
//                               N - Não altera
//                               M - Aumenta valor cota, aumenta quant. cotas, não altera quant. investimento
//                               I - Diminui valor cota, diminui quant. cotas, não altera quant. investimento
//                               R - Aumenta valor da cota (rendimento)
//                               E - Aumenta/Diminui (despesa ligada à Operação)
//                               L - Lucro
//
//       sTipoMovimento    :  Gerador da movimentação
//                               OPE - Operação
//                               DOP - Despesa da Operação
//                               MVI - Receita / Despesa de Imóvel
//                               ATU - Atualização
//                               DES - Despesa da Carteira
//                               DEP - Depreciação
//                               RVL - Reavaliação
//                               TRN - Transferencia (Imobiliário)
//                               TRF - Transferencia (Investimento)
//                               LUC - Lucro
//
//       iInvestimento     :  id do Investimento                     (idInvestimento)
//       iTipoInvest       :  id do Tipo de Investimento             (idTipoInvest)
//       iOperacao         :  id da Operação de Investimento         (idOperacaoInvest)
//       iLancImovel       :  id do Lançamento (tabela LancamentosImovel)
//       iTipoOperacao     :  id do Tipo de Operação de Investimento (idTipoOperacao)
//       iCarteira         :  id da Carteira de Investimentos        (idCarteiraInvest)
//       iDespesaOperacao  :  id da Despesa ligada a uma Operação    (idDesOperInvest)
//       iImposto          :  id do Imposto ligado a um Investimento (idImpostoInvest)
//       iDespesaCarteira  :  id da Despesa ligada a uma Carteira    (idDespCartInvest)
//       iPlanilha         :  id da Planilha onde foram registrados os lançamentos referentes à atualização
//       iDocumento        :  id do Documento (CaP/CaR) referente ao(s) lançamentos
//       sFlgCustodia      :  Flag de tratamento de Custódia.
//       iPlano            :
//
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//          iDespesaCarteira e os outros parâmetros acima são auto-excludentes
//       -------------------------------------------------------------------------------------------
//          as quantidade de cotas e de investimento não podem ficar negativas
//       -------------------------------------------------------------------------------------------
//
//       dDataOper         :  Data e Hora da Operação
//       fValorOperacao    :  Valor da Operação
//       fQtdInvestOperacao:  Quantidade de 'papéis' movimentada
//       fValorPrimeiraCota:  Valor da 1ª cota da Carteira
//       sHistorico        :  Historico do Lançamento
//       sRecPag           :  'P' ou 'R' - indica o sinal do caixa (Contas a Pagar/Receber)
//       bMostraMsg        :  True  - mostra mensagens
//                            False - não mostra mensagens
//--------------------------------------------------------------------------------------------------


//--------------------------------------------------------------------------------------------------
//    Função que Atualiza Saldos de Custodia de Carteira e Investimento.
//    Tipo de Movimento - I - Inicialização
//                        C - Compra
//                        V - Venda
//                        B - Bloqueia
//                        D - Desbloqueio
//                        X - Desbloqueia e Vende
//                        Y - Aumenta Saldo Bloqueado
//                        Z - Diminui Saldo Bloqueado
//--------------------------------------------------------------------------------------------------
function TOperacaoInvest.AtualizaSaldosCustodia: boolean;
var
  //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
   qryLocalAux, qryMarca, qryTudo, qryAntes, qryUpdate: TwwQuery;
   Tipo: string;
   TotLiberado, TotBloqueado, Qtde: Double;
   //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
   IdCustodia, IdMotivoBloqueio, iTipoOperAtu, iTipoOperAnt : integer;
   //AL_20
   fTotCPMF : double;
   IdContaInvest : Integer;
begin
   //AL_23
   try
      // Inicializa objetos Query
      qryMarca := TwwQuery.Create(Application);
      qryTudo := TwwQuery.Create(Application);
      qryAntes := TwwQuery.Create(Application);
      qryUpdate := TwwQuery.Create(Application);
      //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
      qryLocalAux := TwwQuery.Create(Application);
      qryLocalAux.DatabaseName := 'BaseDados';
      qryMarca.DatabaseName := 'BaseDados';
      qryTudo.DatabaseName := 'BaseDados';
      qryAntes.DatabaseName := 'BaseDados';
      qryUpdate.DatabaseName := 'BaseDados';

      try
         // Pega todas as linhas marcadas do histórico
         FazQuery(qryMarca,
                    //AL_20
                    'Select H.IdCustodia, H.IdOperacaoInvest, H.IdCarteiraInvest,'+ #13 +
                    '       H.IdInvestimento, H.IdLote, H.DataMovCustod, H. QtdeMovCustod, '+ #13 +
                    '       H.SaldoLiberado, H.SaldoBloqueado, H.FlgCalcSaldo, H.IdCustodiante, '+ #13 +
                    '       H.IdMotivoBloqueio, H.SALDOQTDECPMF, h.idplanprevctbpatr '+
                    'From HistCustodia H '+ #13 +
                    'Where FlgCalcSaldo = '+ QuotedStr('1') + #13 +
                    'Order By H.DataMovCustod, H.IdCustodia');
         while (not qryMarca.EOF) and (not qryMarca.IsEmpty) do
         begin
            // Para cada linha marcada, seleciona todas as linha com mesma
            // carteira, investimento, lote, custodiante e Motivo Bloqueio
            if qryMarca.FieldByName('FlgCalcSaldo').AsString = '1' then
            begin
               FazQuery(qryTudo,
                        //AL_20
                        'Select H.IdCustodia, H.IdOperacaoInvest, H.IdCarteiraInvest, H.IdInvestimento, '+ #13 +
                        '       H.IdLote, H.DataMovCustod, H. QtdeMovCustod, H.IdCustodiante, H.SaldoLiberado, '+ #13 +
                        '       H.SaldoBloqueado, H.FlgCalcSaldo, H.SALDOQTDECPMF, H.FLGCONTAINVEST, ' + #13 +
                        '       H.TipoCustodia, H.IdMotivoBloqueio, H.IDPLANPREVCTBPATR ' + #13 +
                        'From HistCustodia H '+
                        'Where (H.IdInvestimento = ' + qryMarca.FieldByName('IdInvestimento').AsString + ') ' + #13 +
                        '  and (H.IdCarteiraInvest = ' + qryMarca.FieldByName('IdCarteiraInvest').AsString + ') ' + #13 +
                        '  AND (H.IdCustodiante = ' + qryMarca.FieldByName('IdCustodiante').AsString+') ' + #13 +
                        '  AND (H.IdMotivoBloqueio = ' + qryMarca.FieldByName('IdMotivoBloqueio').AsString + ')' + #13 +
                        '  AND ((H.DATAMOVCUSTOD > TO_DATE(' + QuotedStr(qryMarca.FieldByName('DataMovCustod').AsString) + ',' + QuotedStr('dd/mm/yyyy') + ')) OR ' + #13 +
                        '       ((H.DATAMOVCUSTOD = TO_DATE('+ QuotedStr(qryMarca.FieldByName('DataMovCustod').AsString) + ',' + QuotedStr('dd/mm/yyyy') + ')) AND '+ #13 +
                        '        (H.IDCUSTODIA >= ' + qryMarca.FieldByName('IdCustodia').AsString + '))) '+ #13 +
                        '  and (((' + QuotedStr(qryMarca.FieldByName('IdLote').AsString) + ' IS NOT NULL) AND (H.IDLOTE = ' + QuotedStr(qryMarca.FieldByName('IdLote').AsString) + ')) OR ' + #13 +
                        '       ((' + QuotedStr(qryMarca.FieldByName('IdLote').AsString) + ' IS NULL) AND (H.IDLOTE IS NULL))) ' + #13 +
                        '  AND (H.IdPlanPrevCtbPatr = ' + qryMarca.FieldByName('IDPLANPREVCTBPATR').AsString+') ' + #13 +
                        'Order By DataMovCustod, IdCustodia');
               while not qryTudo.EOF do
               begin
                  // Busca Saldo Custódia
                  //Al_14 - 05/10/2005
                  FazQuery(qryAntes,
                     //AL_20
//Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042                     
                     'SELECT H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO, H1.TIPOCUSTODIA, H1.SALDOQTDECPMF, H1.IDOPERACAOINVEST ' + #13 +
                     'FROM HISTCUSTODIA H1 '+ #13 +
                     'WHERE (H1.IDINVESTIMENTO = ' + qryTudo.FieldByName('IdInvestimento').AsString + ') ' + #13 +
                     '  AND (H1.IDPLANPREVCTBPATR = ' + qryTudo.FieldByName('IDPLANPREVCTBPATR').AsString+') ' + #13 +
                     '  AND (H1.IDCARTEIRAINVEST = ' + qryTudo.FieldByName('IdCarteiraInvest').AsString + ') ' + #13 +
                     '  AND (H1.IDCUSTODIANTE = ' + qryTudo.FieldByName('IdCustodiante').AsString+') ' + #13 +
//Ricardo Cristiano - 01/07/2009 - SOL 121358 / kintana 584020                     
//                     '  AND (H1.IDMOTIVOBLOQUEIO = ' + qryTudo.FieldByName('IDMOTIVOBLOQUEIO').AsString+') ' + #13 +
                     '  AND (((' + QuotedStr(qryTudo.FieldByName('IdLote').AsString) + ' IS NOT NULL) AND (H1.IDLOTE = ' + QuotedStr(qryTudo.FieldByName('IdLote').AsString) + ')) OR ' + #13 +
                     '       ((' + QuotedStr(qryTudo.FieldByName('IdLote').AsString) + ' IS NULL) AND (H1.IDLOTE IS NULL))) ' + #13 +
                     '  AND (H1.IDCUSTODIA = '+ #13 +
                     '         (SELECT MAX(H3.IDCUSTODIA) '+ #13 +
                     '          FROM   HISTCUSTODIA H3 '+ #13 +
                     '          WHERE (H3.IDINVESTIMENTO = H1.IDINVESTIMENTO)'+ #13 +
                     '            AND (H3.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR)' + #13 +
                     '            AND (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST)' + #13 +
                     '            AND (H3.IDCUSTODIANTE = H1.IDCUSTODIANTE) '+ #13 +
                     '            AND (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) '+ #13 +
                     '            AND (H3.DATAMOVCUSTOD = '+ #13 +
                     '                     (SELECT MAX(H2.DATAMOVCUSTOD) '+ #13 +
                     '                      FROM   HISTCUSTODIA H2 '+ #13 +
                     '                       WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) ' + #13 +
                     '                         AND (H2.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR)' + #13 +
                     '                         AND (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) ' + #13 +
                     '                         AND (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) ' + #13 +
                     '                         AND (H2.IDCUSTODIANTE    = H1.IDCUSTODIANTE) ' + #13 +
                     '                         AND (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) ' + #13 +
                     '                         AND (H2.FLGCALCSALDO IS NULL) ' + #13 +
                     '                         AND ((H2.DATAMOVCUSTOD  < TO_DATE(' + QuotedStr(qryTudo.FieldByName('DataMovCustod').AsString)+','+ QuotedStr('DD/MM/YYYY')+')) OR '+  #13 +
                     '                              ((H2.DATAMOVCUSTOD = TO_DATE(' + QuotedStr(qryTudo.FieldByName('DataMovCustod').AsString)+','+ QuotedStr('DD/MM/YYYY')+')) AND '+ #13 +
                     '                               (H2.IDCUSTODIA    < ' + qryTudo.FieldByName('IdCustodia').AsString+ '))) )) ' + #13 +
                     '            AND (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) '+ #13 +
                     '            AND (H3.FLGCALCSALDO IS NULL) )) '+ #13 +
                     'ORDER BY    DATAMOVCUSTOD DESC, IDCUSTODIA DESC');

                  Tipo := qryTudo.FieldByName('TipoCustodia').AsString;
                  Qtde := qryTudo.FieldByName('QtdeMovCustod').AsFloat;
                  IdMotivoBloqueio := qryTudo.FieldByName('IdMotivoBloqueio').AsInteger;
                  //AL_20
                  IdContaInvest := qryTudo.FieldByName('FLGCONTAINVEST').AsInteger;

                  // Se não tem uma linha anterior o Saldo liberado e o
                  //bloqueado recebem 0
                  if not qryAntes.IsEmpty then
                  begin
                     //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
                     iTipoOperAtu := 0;
                     iTipoOperAnt := 0;
                     if qryTudo.FieldByName('IDOPERACAOINVEST').AsInteger > 0 then
                     begin
                        FazQuery(qryLocalAux,'SELECT OI.IDTIPOOPERACAO FROM OPERACAOINVEST OI '+#13 +
                                             'WHERE OI.IDOPERACAOINVEST = '+qryTudo.FieldByName('IDOPERACAOINVEST').AsString);

                        iTipoOperAtu := qryLocalAux.FieldByName('IDTIPOOPERACAO').AsInteger;

                        qryLocalAux.Close;

                        if qryAntes.FieldByName('IDOPERACAOINVEST').AsInteger > 0 then
                        begin
                           FazQuery(qryLocalAux,'SELECT OI.IDTIPOOPERACAO FROM OPERACAOINVEST OI '+#13 +
                                                'WHERE OI.IDOPERACAOINVEST = '+qryAntes.FieldByName('IDOPERACAOINVEST').AsString);

                           iTipoOperAnt := qryLocalAux.FieldByName('IDTIPOOPERACAO').AsInteger;

                           qryLocalAux.Close;
                        end;
                     end;

                     //Al_14 - 05/10/2005
                     if ((Tipo = 'I') And (qryAntes.FieldByName('TIPOCUSTODIA').AsString <> Tipo)) then  //Inicialização
                     begin
                        TotLiberado  := 0;
                        TotBloqueado := 0;
                        //AL_20
                        fTotCPMF := 0;
                     end
                     //Ricardo Cristiano - 21/07/2009 - N. Sol 122235 -  N. Kintana 597042
                     else if (((iTipoOperAtu = pRPI.IDTIPOOPERDIRDES) or (iTipoOperAtu = pRPI.IDTIPOOPERDIRDES+10000)) And
                              ((iTipoOperAnt <> pRPI.IDTIPOOPERDIRDES) and (iTipoOperAnt <> pRPI.IDTIPOOPERDIRDES+10000))) then

                     begin
                        TotLiberado  := 0;
                        TotBloqueado := 0;
                        fTotCPMF     := 0;
                     end
                     else
                     begin
                       TotLiberado  := qryAntes.FieldByName('SaldoLiberado').AsFloat;
                       TotBloqueado := qryAntes.FieldByName('SaldoBloqueado').AsFloat;
                       //AL_20
                       fTotCPMF := qryAntes.FieldByName('SALDOQTDECPMF').AsFloat;
                     end;
                  end
                  else
                  begin
                     TotLiberado  := 0;
                     TotBloqueado := 0;
                     //AL_20
                     fTotCPMF := 0;
                  end;

                  // Altera os saldos dependendo do tipo de operação
                  // AL_3 - 15/07/2004 - Tratamento do Grupamento
                  if Tipo = 'I' then  // Inicialização ou Grupamento
                  begin
                     if IdMotivoBloqueio = -1 then
                        TotLiberado  := TotLiberado  + Qtde
                     else
                        TotBloqueado := TotBloqueado + Qtde;
                     //AL_20
                     if IdContaInvest = 0 then
                        fTotCPMF := fTotCPMF + Qtde;
                  end
                  else if (Tipo = 'C') then  // Compra
                  begin
                     //Ricardo Cristiano - 23/06/2009 - N. Sol 121086 -  N. Kintana 578807
                     if ((IdMotivoBloqueio = -1) or (IdMotivoBloqueio = 0)) then
                     begin
                        TotLiberado  := TotLiberado  + Qtde;
                        //AL_20
                        if IdContaInvest = 0 then
                           fTotCPMF := fTotCPMF + Qtde;
                     end
                     //Ricardo Cristiano - 23/06/2009 - N. Sol 121086 -  N. Kintana 578807
                     else
                     begin
                        TotBloqueado := TotBloqueado + Qtde;
                        //AL_20
                        if IdContaInvest = 0 then
                           fTotCPMF := fTotCPMF + Qtde;
                     end;
                  end
                  else if Tipo = 'V' then  // Venda
                  begin
                     TotLiberado := TotLiberado - Qtde;
                     //AL_20
                     if IdContaInvest = 0 then
                        fTotCPMF := fTotCPMF - Qtde;

                     //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                     if TotLiberado < 0 then
                        TotLiberado := 0;

                     if fTotCPMF < 0 then
                        fTotCPMF := 0;
                  end
                  else if Tipo = 'B' then  // Bloqueio
                  begin
                     if IdMotivoBloqueio = -1 then
                     begin
                        TotLiberado  := TotLiberado  - Qtde;
                        //AL_20
                        if IdContaInvest = 0 then
                           fTotCPMF := fTotCPMF - Qtde;

                        //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                        if TotLiberado < 0 then
                           TotLiberado := 0;

                        if fTotCPMF < 0 then
                           fTotCPMF := 0;
                     end
                     else
                     begin
                        TotBloqueado := TotBloqueado + Qtde;
                        //AL_20
                        if IdContaInvest = 0 then
                           fTotCPMF := fTotCPMF + Qtde;
                     end;
                  end
                  else if Tipo = 'D' then  // Desbloqueio
                  begin
                     if IdMotivoBloqueio = -1 then
                     begin
                        TotLiberado  := TotLiberado  + Qtde;
                        //AL_20
                        if IdContaInvest = 0 then
                           fTotCPMF := fTotCPMF + Qtde;
                     end
                     else
                     begin
                        TotBloqueado := TotBloqueado - Qtde;
                        //AL_20
                        if IdContaInvest = 0 then
                           fTotCPMF := fTotCPMF - Qtde;

                        //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                        if TotBloqueado < 0 then
                           TotBloqueado := 0;

                        if fTotCPMF < 0 then
                           fTotCPMF := 0;
                     end;
                  end
                  else if Tipo = 'X' then // Desbloqueia e vende
                  begin
                     TotBloqueado := TotBloqueado - Qtde;
                     //AL_20
                     if IdContaInvest = 0 then
                        fTotCPMF := fTotCPMF - Qtde;

                     if TotBloqueado < 0 then
                        TotBloqueado := 0;

                     if fTotCPMF < 0 then
                        fTotCPMF := 0;
                  end
                  else if Tipo = 'Y' then // Aumenta Saldo Bloqueado
                  begin
                     TotBloqueado := TotBloqueado + Qtde;
                     //AL_20
                     if IdContaInvest = 0 then
                        fTotCPMF := fTotCPMF + Qtde;
                  end
                  else if Tipo = 'Z' then // Diminui Saldo Bloqueado
                  begin
                     TotBloqueado := TotBloqueado - Qtde;
                     //AL_20
                     if IdContaInvest = 0 then
                        fTotCPMF := fTotCPMF - Qtde;

                     //Ricardo Cristiano - 25/07/2011 - N. Sol 156970 -  N. Kintana 1360831
                     if TotBloqueado < 0 then
                        TotBloqueado := 0;

                     if fTotCPMF < 0 then
                        fTotCPMF := 0;
                  end;

                  // Atualiza Histórico
                  TotLiberado := OperComum.Trunca(TotLiberado,0);
                  if IdMotivoBloqueio = -1 then
                     ExecutarQuery(qryUpdate,'Update HistCustodia Set '+
                               'SaldoLiberado='+TrocaVirgulaPonto(FloatToStr(TotLiberado))+
                               //AL_20
                               ', SALDOQTDECPMF ='+TrocaVirgulaPonto(FloatToStr(fTotCPMF))+
                               ', FlgCalcSaldo='+#39+#39+
                               ' Where IdCustodia='+qryTudo.FieldByName('IdCustodia').AsString)
                  else
                     ExecutarQuery(qryUpdate,'Update HistCustodia Set '+
                               'SaldoBloqueado='+TrocaVirgulaPonto(FloatToStr(TotBloqueado))+
                               //AL_20
                               ', SALDOQTDECPMF ='+TrocaVirgulaPonto(FloatToStr(fTotCPMF))+
                               ', FlgCalcSaldo='+#39+#39+
                               ' Where IdCustodia='+qryTudo.FieldByName('IdCustodia').AsString);
                  //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822                               
                  qryUpdate.Close;
                  qryTudo.Next
               end;
               //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
               qryTudo.Close;
               qryAntes.Close;
            end;

            // Refaz a query de linhas marcadas com '1'
            qryMarca.Close;
            qryMarca.Open;
         end;
         Result := True;
      except
         Result := False;
      end;
   finally
      //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
      qryMarca.Close;
      qryTudo.Close;
      qryAntes.Close;
      qryUpdate.Close;

      // Libera objetos da memória
      qryMarca.Free;
      qryTudo.Free;
      qryAntes.Free;
      qryUpdate.Free;
      qryMarca := nil;
      qryTudo := nil;
      qryAntes := nil;
      qryUpdate := nil;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    Função que Registra Custodia no HistCustodia, a partir do FlgCustodia do HistCartInv.
//    Tipo de Movimento - I - Inicialização
//                        C - Compra
//                        V - Venda
//                        B - Bloqueia
//                        D - Desbloqueio
//                        X - Desbloqueia e Vende
//                        Y - Aumenta Saldo Bloqueado
//                        Z - Diminui Saldo Bloqueado
//--------------------------------------------------------------------------------------------------
function TOperacaoInvest.CadastraCustodia (iOperacao: longint) : boolean;
var
   Tipo: string;
   TotLiberado, TotBloqueado, TotInutil, Qtde: Double;
   wIdMotivoBloqueio, wIdMotivoBloqOrig, wIdMotivoBloqDest, wIdMotOp, IdCustodia: integer;
   wQtde : Double;
   sTipoCustOrig, sTipoCustDest, sLoteD, sLoteA: string;
   QryLocal1, QryLocalA, QryLocalD :TwwQuery;
   iIdHistCustodia:integer;   
begin
   try
      QryLocal1              := TwwQuery.Create(Application);
      QryLocal1.DatabaseName := 'BaseDados';
      QryLocalA              := TwwQuery.Create(Application);
      QryLocalA.DatabaseName := 'BaseDados';
      QryLocalD              := TwwQuery.Create(Application);
      QryLocalD.DatabaseName := 'BaseDados';

      wIdMotivoBloqDest := -1;

      wIdMotivoBloqOrig := -1;

      Result:= true;

      if IOperacao = -1 then
      Begin
         With dtmOperacaoInvest.QryLocal Do
         Begin
            Close;
            Sql.Clear;
            //AL_23
            //AL_20
            Sql.Add('SELECT  H.IDHISTCARTINV, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, ');
            Sql.Add('        H.DATAMOVCARTINV, H.IDOPERACAOINVEST, H.QTDEMOVINVCART, OPR.IDPLANPREVCTBPATR, ');
            Sql.Add('        OPR.QTDEOPERACAO, OPR.IDCUSTODIANTE, OPR.IDCUSTORIG, OPR.IDCUSTDEST, OPR.IDOPERACAOORIGEM, ');
            //Ricardo Cristiano - 23/06/2009 - N. Sol 121086 -  N. Kintana 578807
            Sql.Add('        TOP.TIPOCUSTODIA, DECODE(OPC.IDMOTIVOBLOQDEST,NULL,TOP.IDMOTIVOBLOQUEIO,OPC.IDMOTIVOBLOQDEST) AS IDMOTIVOBLOQUEIO, ');
            Sql.Add('        TOP.IDMOTIVOBLOQUEIO, TOP.FLGTRANSF, TOP.TIPSALDOCARTORIG, TOP.MOTBLOQCARTORIG, TOP.TIPSALDOCARTDEST, ');
            Sql.Add('        TOP.MOTBLOQCARTDEST, TOP.FLGCONTAINVEST ');

            Sql.Add('FROM HISTCARTINV H, OPERACAOINVEST OPR, TIPOOPERACAO TOP, OPERCUSTODIA OPC ');
            Sql.Add('WHERE     (H.FLGCUSTODIA        = ''1'') ');
            Sql.Add('      AND (OPR.IDTIPOOPERACAO  <> '''+IntToStr(pRPI.IDTIPOOPERLIQPEND)+''') ');
            Sql.Add('      AND (H.IDTIPOOPERACAO     = TOP.IDTIPOOPERACAO(+))   ');
            Sql.Add('      AND (H.IDOPERACAOINVEST   = OPR.IDOPERACAOINVEST(+)) ');
            //Ricardo Cristiano - 23/06/2009 - N. Sol 121086 -  N. Kintana 578807
            Sql.Add('      AND (OPR.IDOPERCUSTODIA   = OPC.IDOPERCUSTODIA(+))   ');            
            Sql.Add('ORDER BY H.DATAMOVCARTINV, H.IDHISTCARTINV ');
            Open;
         End;
      End
      else
      Begin
         With dtmOperacaoInvest.QryLocal Do
         Begin
            Close;
            Sql.Clear;
            //AL_23
            //AL_20
            Sql.Add('SELECT  OPR.IDCARTEIRAINVEST, OPR.IDINVESTIMENTO, OPR.IDLOTE, ');
            Sql.Add('        OPR.DATAOPERACAO AS DATAMOVCARTINV, OPR.IDOPERACAOINVEST, OPR.IDPLANPREVCTBPATR, ');
            Sql.Add('        OPR.QTDEOPERACAO, OPR.IDCUSTODIANTE, OPR.IDCUSTORIG, OPR.IDCUSTDEST, OPR.IDOPERACAOORIGEM,');
            //Ricardo Cristiano - 23/06/2009 - N. Sol 121086 -  N. Kintana 578807
            Sql.Add('        TOP.TIPOCUSTODIA, DECODE(OPC.IDMOTIVOBLOQDEST,NULL,TOP.IDMOTIVOBLOQUEIO,OPC.IDMOTIVOBLOQDEST) AS IDMOTIVOBLOQUEIO, ');
            Sql.Add('        TOP.FLGTRANSF, 0 AS QTDEMOVINVCART, TOP.TIPSALDOCARTORIG, TOP.MOTBLOQCARTORIG, TOP.TIPSALDOCARTDEST, ');
            Sql.Add('         TOP.MOTBLOQCARTDEST, TOP.FLGCONTAINVEST ');
            Sql.Add('FROM OPERACAOINVEST OPR, TIPOOPERACAO TOP, OPERCUSTODIA OPC ');
            Sql.Add('WHERE     (OPR.IDOPERACAOINVEST = '''+IntToStr(IOperacao)+''') ');
            Sql.Add('      AND (OPR.IDTIPOOPERACAO  <> '''+IntToStr(pRPI.IDTIPOOPERLIQPEND)+''') ');
            Sql.Add('      AND (OPR.IDTIPOOPERACAO   = TOP.IDTIPOOPERACAO)      ');
            //Ricardo Cristiano - 23/06/2009 - N. Sol 121086 -  N. Kintana 578807
            Sql.Add('      AND (OPR.IDOPERCUSTODIA   = OPC.IDOPERCUSTODIA(+))   ');
            Open;
         End;
      End;

      while (not dtmOperacaoInvest.qryLocal.EOF) and (not dtmOperacaoInvest.qryLocal.IsEmpty) do
      begin
         if  dtmOperacaoInvest.qryLocal.FieldByName('IDOPERACAOINVEST').isNull then
         begin
            MsgDlg('Movimento sem Operação... Inválido para Cadastramento automático de Custódia!',
                   'Mensagem do Sistema', mtWarning,[mbOK],0);
            Exit;
         end;

         if not dtmOperacaoInvest.qryLocal.FieldByName('IDMOTIVOBLOQUEIO').isNull then
               wIdMotivoBloqueio :=  dtmOperacaoInvest.qryLocal.FieldByName('IDMOTIVOBLOQUEIO').asInteger
         else
               wIdMotivoBloqueio := -1;

         if dtmOperacaoInvest.qryLocal.FieldByName('QTDEOPERACAO').AsFloat = 0 then
            wQtde := dtmOperacaoInvest.qryLocal.FieldByName('QTDEMOVINVCART').AsFloat
         else
            wQtde := dtmOperacaoInvest.qryLocal.FieldByName('QTDEOPERACAO').AsFloat ;

         // AL_6 - 23/11/2004
         // AL_2 - 03/07/2004 - Qtd original de Pendencia liquidada
         if ((dtmOperacaoInvest.qryLocal.FieldByName('IDOPERACAOORIGEM').AsInteger <> 0)   and
                  (dtmOperacaoInvest.qryLocal.FieldByName('QTDEOPERACAO').AsFloat  <> 0)) then
         begin
            //Busca o valor que está na tabela de OPERACAOPENDENTE
            OperComum.LimpaParametros(DMRendaVariavel.QryBuscaOperPendentes);
            DMRendaVariavel.QryBuscaOperPendentes.ParamByName('IDOPERACAOORIGEM').AsInteger := dtmOperacaoInvest.qryLocal.FieldByName('IDOPERACAOORIGEM').AsInteger;
            DMRendaVariavel.QryBuscaOperPendentes.Open;
            //AL_6 - 23/11/2004
            wQtde := wQtde + DMRendaVariavel.QryBuscaOperPendentes.FieldByName('QTDEOPERACAO').AsFloat;
            DMRendaVariavel.QryBuscaOperPendentes.Close;

            //Busca o valor da pendência da pendência na tabela de OPERACAOINVEST
            OperComum.LimpaParametros(DMRendaVariavel.QryBuscaOperInvestPend);
            DMRendaVariavel.QryBuscaOperInvestPend.ParamByName('IDTIPOOPERACAO').AsInteger := pRPI.IDTIPOOPERLIQPEND;
            DMRendaVariavel.QryBuscaOperInvestPend.ParamByName('IDOPERACAOORIGEM').AsInteger := dtmOperacaoInvest.qryLocal.FieldByName('IDOPERACAOORIGEM').AsInteger;
            DMRendaVariavel.QryBuscaOperInvestPend.Open;
            wQtde := wQtde + DMRendaVariavel.QryBuscaOperInvestPend.FieldByName('QTDEOPERACAO').AsFloat;
            DMRendaVariavel.QryBuscaOperInvestPend.Close;
            //AL_6 - Fim
         end;
         // AL_2 - Fim

         // Se existe Transferência antes ou depois da Operação
         if dtmOperacaoInvest.QryLocal.FieldByName('FLGTRANSF').AsString[1] in ['A', 'D'] then
         begin
            // Busca Informações da Transferência do Tipo 'D' (Diminui - Origem)
             if (dtmOperacaoInvest.qryLocal.FieldByName('TIPSALDOCARTORIG').AsString[1] = 'B') and
                (not dtmOperacaoInvest.qryLocal.FieldByName('MOTBLOQCARTORIG').isNull) then
                wIdMotivoBloqOrig := dtmOperacaoInvest.qryLocal.FieldByName('MOTBLOQCARTORIG').asInteger
             else
                wIdMotivoBloqOrig := -1;

             if dtmOperacaoInvest.qryLocal.FieldByName('TIPSALDOCARTORIG').AsString[1] = 'L' then
                sTipoCustOrig := 'V'
             else
                sTipoCustOrig := 'Z';

             //AL_23
             FazQuery(QryLocalD,
                      'SELECT  H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, H.QTDEMOVINVCART, C.FLGTRATALOTE, H.IDPLANPREVCTBPATR '+
                      'FROM HISTCARTINV H, CARTEIRAINVEST C                       '+
                      'WHERE   (H.TIPMOVCARTINV    = ''TRF'') AND '+
                      '        (H.NATURMOVCARTINV  = ''D'')   AND '+
                      '        (H.IDOPERACAOINVEST = '+ QuotedStr(dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsString)+') AND '+
                      '        (H.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST) ');

             If QryLocalD.FieldByName('FLGTRATALOTE').AsString='N' Then
                sLoteD:= ''
             Else
                sLoteD:=QryLocalD.FieldByName('IDLOTE').AsString;

             // Busca Informações da Transferência do Tipo 'A' (Aumenta - Destino)
             if (dtmOperacaoInvest.qryLocal.FieldByName('TIPSALDOCARTDEST').AsString[1] = 'B') and
                (not dtmOperacaoInvest.qryLocal.FieldByName('MOTBLOQCARTDEST').isNull) then
                wIdMotivoBloqDest := dtmOperacaoInvest.qryLocal.FieldByName('MOTBLOQCARTDEST').asInteger
             else
                wIdMotivoBloqDest := -1;

             if dtmOperacaoInvest.qryLocal.FieldByName('TIPSALDOCARTDEST').AsString[1] = 'L' then
                sTipoCustDest := 'C'
             else
                sTipoCustDest := 'Y';

             FazQuery(QryLocalA,
                      'SELECT  H.IDCARTEIRAINVEST, H.IDINVESTIMENTO, H.IDLOTE, H.QTDEMOVINVCART, C.FLGTRATALOTE, H.IDPLANPREVCTBPATR '+
                      'FROM  HISTCARTINV H, CARTEIRAINVEST C                       '+
                      'WHERE   (H.TIPMOVCARTINV    = ''TRF'') AND '+
                      '        (H.NATURMOVCARTINV  = ''A'')   AND '+
                      '        (H.IDOPERACAOINVEST = '+QuotedStr(dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsString)+') AND '+
                      '        (H.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST) ');

             If QryLocalA.FieldByName('FLGTRATALOTE').AsString='N' Then
                sLoteA:= ''
             Else
                sLoteA:=QryLocalA.FieldByName('IDLOTE').AsString;
         end;

         // Trata Transferência antes da Operação
         if (dtmOperacaoInvest.QryLocal.FieldByName('FLGTRANSF').AsString = 'A') Then
         Begin
            //AL_23
            // Cria Movimentação de Custódia para Registro do HistcartInv que Diminui Saldo na Carteira Origem
            if not TestaSaldosCustodia(QryLocalD.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                                       QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                                       dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                                       sLoteD, sTipoCustOrig[1],
                                       dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                                       qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger) then
            begin
                MsgDlg('Saldos de Custódia não Atualizados... Saldo Insuficinte!' + #13 +
                       'Investimento: ' + QryLocalD.FieldByName('IDINVESTIMENTO').AsString + #13 +
                       'Data: ' + dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsString,
                       'Mensagem do Sistema', mtWarning,[mbOK],0);
                Result := False;
                Exit;
            end;

            //AL_23
            //AL_20
            OperacaoInvest.InsereCustodia(
                     QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                     QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                     -1,
                     sLoteD,  sTipoCustOrig[1],
                     dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                     qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger,
                     iIdHistCustodia,
                     QryLocalD.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('FLGCONTAINVEST').AsInteger);
            //AL_23
            //AL_20
            // Cria Movimentação de Custódia para Registro do HistcartInv que Aumenta Saldo na Carteira Destino
            OperacaoInvest.InsereCustodia(
                     QryLocalA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                     QryLocalA.FieldByName('IDINVESTIMENTO').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTDEST').AsInteger, wIdMotivoBloqDest,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                     -1,
                     sLoteA,  sTipoCustDest[1],
                     dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                     qryLocalA.FieldByName('QTDEMOVINVCART').AsInteger,
                     iIdHistCustodia,
                     QryLocalA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('FLGCONTAINVEST').AsInteger);
         End;

         // Se Tipo de Operação trata Custódia, Cria Movimentação de Custódia para Registro do HistcartInv referente a Operação
         if (dtmOperacaoInvest.QryLocal.FieldByName('TIPOCUSTODIA').AsString <> 'N') Then
         Begin
           wIdMotOp := wIdMotivoBloqueio;
           if dtmOperacaoInvest.QryLocal.FieldByName('TIPOCUSTODIA').AsString[1] = 'B' then
              wIdMotOp := -1;
           //AL_23
           if not TestaSaldosCustodia(
                    dtmOperacaoInvest.QryLocal.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTODIANTE').AsInteger, wIdMotOp,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDLOTE').AsString,
                    dtmOperacaoInvest.QryLocal.FieldByName('TIPOCUSTODIA').AsString[1],
                    dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime, wQtde) then
           begin
              MsgDlg('Saldos de Custódia não Atualizados... Saldo Insuficinte!' + #13 +
                     'Investimento: ' + dtmOperacaoInvest.QryLocal.FieldByName('IDINVESTIMENTO').AsString + #13 +
                     'Data: ' + dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsString,
                     'Mensagem do Sistema', mtWarning,[mbOK],0);
              Result := False;
              Exit;
           end;

           //AL_23
           //AL_20
           OperacaoInvest.InsereCustodia(
                    dtmOperacaoInvest.QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDINVESTIMENTO').AsInteger,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTODIANTE').AsInteger, wIdMotivoBloqueio,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                    -1,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDLOTE').AsString,
                    dtmOperacaoInvest.QryLocal.FieldByName('TIPOCUSTODIA').AsString[1],
                    dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime, wQtde,
                    iIdHistCustodia,
                    dtmOperacaoInvest.QryLocal.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                    dtmOperacaoInvest.QryLocal.FieldByName('FLGCONTAINVEST').AsInteger);

          End;

         // Trata Transferência depois da Operação
         if (dtmOperacaoInvest.QryLocal.FieldByName('FLGTRANSF').AsString = 'D') Then
         Begin
            //AL_23
            // Cria Movimentação de Custódia para Registro do HistcartInv que Diminui Saldo na Carteira Origem
            if not TestaSaldosCustodia(
                      QryLocalD.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                      QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                      QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger, 9999999,
                      dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                      sLoteD, sTipoCustOrig[1],
                      dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                      qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger) then
            begin
                MsgDlg('Saldos de Custódia não Atualizados... Saldo Insuficinte!' + #13 +
                       'Investimento: ' + QryLocalD.FieldByName('IDINVESTIMENTO').AsString + #13 +
                       'Data: ' + dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsString,
                       'Mensagem do Sistema',mtWarning,[mbOK],0);
                Result := False;
                Exit;
            end;

            //AL_23
            //AL_20
            OperacaoInvest.InsereCustodia(
                     QryLocalD.FieldByName('IDCARTEIRAINVEST').AsInteger,
                     QryLocalD.FieldByName('IDINVESTIMENTO').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTORIG').AsInteger, wIdMotivoBloqOrig,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                     -1,
                     sLoteD,  sTipoCustOrig[1],
                     dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                     qryLocalD.FieldByName('QTDEMOVINVCART').AsInteger,
                     iIdHistCustodia,
                     QryLocalD.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('FLGCONTAINVEST').AsInteger);

            //AL_23
            //AL_20
            // Cria Movimentação de Custódia para Registro do HistcartInv que Aumenta Saldo na Carteira Destino
            OperacaoInvest.InsereCustodia(
                     QryLocalA.FieldByName('IDCARTEIRAINVEST').AsInteger,
                     QryLocalA.FieldByName('IDINVESTIMENTO').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDCUSTDEST').AsInteger, wIdMotivoBloqDest,
                     dtmOperacaoInvest.QryLocal.FieldByName('IDOPERACAOINVEST').AsInteger,
                     -1,
                     sLoteA,  sTipoCustDest[1],
                     dtmOperacaoInvest.QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime,
                     qryLocalA.FieldByName('QTDEMOVINVCART').AsInteger,
                     iIdHistCustodia,
                     QryLocalA.FieldByName('IDPLANPREVCTBPATR').AsInteger,
                     dtmOperacaoInvest.QryLocal.FieldByName('FLGCONTAINVEST').AsInteger);
         End;

         OperacaoInvest.AtualizaSaldosCustodia;

         if IOperacao = -1 then
            ExecutarQuery(qryLocal1,' Update HistCartInv Set     '+
                                    ' FlgCustodia         = NULL '+
                                    ' Where IdHistCartInv =      '+
                                      dtmOperacaoInvest.QryLocal.FieldByName('IDHISTCARTINV').AsString);

         dtmOperacaoInvest.qryLocal.Next;
      end;
   finally
      QryLocal1.Free;
      QryLocalA.Free;
      QryLocalD.Free;
   end;
end;

//--------------------------------------------------------------------------------------------------
//    Função que Calula TIR de Investimentos Mobiliários - Renda Fixa e Variável
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       iInvestimento   :  id do Investimento                     (idInvestimento)
//       iCarteira       :  id da Carteira de Investimentos        (idCarteiraInvest)
//       sLote           :  Lote do Investimento                   (idLote)
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
//       -------------------------------------------------------------------------------------------
//       dDataOperInicio :  Data da Operação Inicial para o Período a ser analisado
//       dDataOperFim    :  Data da Operação Final   para o Período a ser analisado
//       bMostraMsg      :  True  - mostra mensagens
//                          False - não mostra mensagens
//       fTIR            :  Valor da TIR calculado para o Período
//--------------------------------------------------------------------------------------------------
// Função que Calula TIR de Investimentos Mobiliários - Renda Fixa e Variável
// Função que Calula TIR de Investimentos Mobiliários - Renda Fixa e Variável
function TOperacaoInvest.CalculaTIRMob(iInvestimento, iCarteira, iTipoInvest: longint; sLote: string;
dDataOperInicio,dDataOperFim, dDataSaldoFinal : TDateTime; bMostraMsg, bDiasUteis: boolean; var fTIR: double; var iCalcula: smallint): boolean;

var
   dDataRef, dDataInicial   : TDate;
   SpreadSheet: TF1Book;
   Z, i, iexp, idiasuteis, J   : integer;
   iFlag   : smallint;
   fNulo, fSaldoInicial, fSaldoPremio, fTIRAux, fTotSaldo, fSaldo : double;
   wFormula, sSQL : String;
   Lista :TStringList;
   QryLocal :TwwQuery;
begin
   Result := True;

   SpreadSheet := TF1Book.Create(Application);
   SpreadSheet.ClearRange(-1, -1, -1, -1, F1ClearAll);
      
   iFlag := 0;
   iCalcula := 0;

   try
      // testa se Carteira ou Investimento foram informados
      if (iInvestimento = -1) and (ICarteira = -1) then begin
         if bMostraMsg then MsgDlg('Informe Carteira e/ou Investimento!', 'Erro', mtError, [mbOk], 0);
         Result := False;
         Exit;
      end;

      // testa se Periodo foi informado
      if (dDataOPerInicio = 0) or (dDataOPerFim = 0) then begin
         if bMostraMsg then MsgDlg('Período Inválido!', 'Erro', mtError, [mbOk], 0);
         Result := False;
         Exit;
      end;

      QryLocal             := TwwQuery.Create(Application);
      QryLocal.DatabaseName:= 'BaseDados';

      i          := 1;
      idiasuteis := 0;
      dDataRef := dDataOperInicio - 1;

      While dDataRef <= dDataOperFim Do Begin

         If ((bDiasUteis) and (DiasUteis.DiaUtil(dDataRef, 0, 1, '', True, False, False))) or
            (not (bDiasUteis)) or
            (dDataRef = dDataOperInicio - 1)  Then begin

            QryLocal.Close;
            sSQL :=
              'SELECT DISTINCT HC.IDCARTEIRAINVEST FROM HISTCARTINV HC ' +
              'WHERE  (HC.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+') ';

            if sLote <> '' then
               sSQL := sSQL + ' AND (HC.IDLOTE = '''+sLote+''')  '
            else
               sSQL := sSQL + ' AND (HC.IDLOTE IS NULL)  ';

            if iCarteira <> -1 then
                sSQL := sSQL + '    AND (HC.IDCARTEIRAINVEST = '+IntToStr(iCarteira)+')  ';

            FazQuery(QryLocal, sSQL);

            // Varre Carteiras que possuem o Investimento
            QryLocal.Open;
            QryLocal.First;
            fTotSaldo := 0;
            while not QryLocal.EOF do
            begin
               if dDataRef = dDataOperInicio - 1 then
               begin
                 // Busca Saldo Inicial no dia anterior a Data Inicio para simular uma Compra (-)
                 OperComum.CalculaSaldo(iInvestimento,
                              QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                              sLote, dDataRef, fNulo, fSaldoInicial,
                              fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fNulo,
                              fNulo, fSaldoPremio, fNulo, fNulo, fNulo, fNulo, fNulo);

                 fTotSaldo := fTotSaldo + (fSaldoInicial * -1);
               end
               else
               begin
                 fSaldo   := OPeracaoInvest.CalculaSaldoDiaTIR(iInvestimento,
                                       QryLocal.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       3,
                                       sLote, dDataRef, dDataOperFim, dDataSaldoFinal, iFlag,False);

                 if iCalcula = 0 then
                   iCalcula := iFlag;

                 fTotSaldo := fTotSaldo + fSaldo;
               end;

               QryLocal.Next;

            end;

            // ************* Alimenta Planilha com saldo do dia
            SpreadSheet.NumberRC[i,1] := fTotSaldo;

            i := i + 1;

         end;

         If DiasUteis.DiaUtil(dDataRef, 0, 1, '', True, False, False)  and
          (dDataRef <> dDataOperInicio - 1)   Then
           idiasuteis := idiasuteis + 1;

         dDataRef := dDataRef + 1;

      end;

      If bDiasUteis Then
        iexp := idiasuteis
      else
        iexp := i - 2;

      // Cria Planilha com valores zerados.
      SpreadSheet := TF1Book.Create(Application);
      SpreadSheet.ClearRange(-1, -1, -1, -1, F1ClearAll);

      // preenche a fórmula
      wFormula := 'IF(B3=0;9999999;((IRR(' + 'A1:A' + IntToStr(i-1) + '; ' + FloatToStr(1/1000) + ' ) + 1) ^ (' + IntToStr(iexp) + ') - 1) *100)';
      SpreadSheet.FormulaRC[2,2]    := wFormula;
      SpreadSheet.FormulaRC[3,2]    := 'SUM(' + 'A2:A' + IntToStr(i) + ')';

      if iCalcula = 1 then begin
         Try
           SpreadSheet.Recalc;
           fTIR := SpreadSheet.NumberRC[2,2];
           SpreadSheet.Free;
           Result := True;
         Except
           Result := False;
           SpreadSheet.Free;
         End;
      End else begin
         fTIR := 0;
      End;;

   except
      if bMostraMsg then Raise;
      Result := False;
   end;

   QryLocal.Free;

end;

//--------------------------------------------------------------------------------------------------
//    Função que Calula Saldo do Dia para TIR
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    Parâmetros :
//       iInvestimento   :  id do Investimento
//       iCarteira       :  id da Carteira de Investimentos
//       sLote           :  Lote do Investimento
//       dDataRef        :  Data do Saldo a ser calculado
//       dDataOperFim    :  Data Final do Período que está sendo analisado
//       -------------------------------------------------------------------------------------------
//          passar (-1) caso os parâmetros não sejam necessários
// Função que Calula Saldo do Dia para TIR
function TOperacaoInvest.CalculaSaldoDiaTIR(iInvestimento, iCarteira, iTipoInvest : longint;
                                            sLote: string;
                                            dDataRef, dDataOperFim, dDataSaldoFinal: TDateTime;
                                            var iFlag: smallint; bFluxoTitulo : boolean): double;

var
   sSql       : String;
   QryLocal   : TwwQuery;
   fNulo, fSaldoFinal, fSaldoFinalMerc, fSaldoPremio, fSaldoDia, fMovim : double;
   cNaturezaMovimento, cNaturezaOPeracao: String;
begin

   try

      // Busca Operações de HistCartInv em dDataRef

      // Cria Objetos Locais
      QryLocal              := TwwQuery.Create(Application);
      QryLocal.DatabaseName := 'BaseDados';

      iFlag := 0;

      With QryLocal Do Begin
         Close;
         Sql.Clear;
         Sql.add(' SELECT HC.VLRMOVCARTINV, HC.MOVIMATU, HC.TIPMOVCARTINV,             ');
         Sql.add(' HC.NATURMOVCARTINV, HC.NATURMOVOPER, HC.IDTIPOINVEST                ');
         Sql.add(' FROM   HISTCARTINV HC                                            ');
         Sql.add(' WHERE                                                               ');
         Sql.add('    (HC.DATAMOVCARTINV   = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');

         if bFluxoTitulo = True then // Pagamento de Juros ou Amortização de Principal de Renda Fixa
            Sql.add('    AND (HC.TIPMOVCARTINV <> ''ATU'')                             ') // Não traz o registro de ATU
         else
            Sql.add('    AND (HC.MOVIMATU <> 0)                                        ');

         Sql.add('    AND (HC.TIPMOVCARTINV <> ''INI'')                                ');
         if iCarteira <> -1  Then
            Sql.add(' AND (HC.IDCARTEIRAINVEST = '+IntToStr(iCarteira)+')              ');
         if iInvestimento <> -1  Then
            Sql.add(' AND (HC.IDINVESTIMENTO   = '+IntToStr(iInvestimento)+')          ');
         if sLote <> '' then
            Sql.add(' AND (HC.IDLOTE = '''+slote+''')  ')
         else
            Sql.add(' AND (IDLOTE IS NULL)  ');
         Open;
      End;

      fSaldoDia := 0;
      if QryLocal.RecordCount <> 0 then iFlag :=1;

      While Not QryLocal.Eof Do Begin
         // Alimenta Saldo do Dia
         cNaturezaOPeracao  := qryLocal.FieldByName('NATURMOVOPER').AsString;
         cNaturezaMovimento := qryLocal.FieldByName('NATURMOVCARTINV').AsString;

         if qryLocal.FieldByName('TIPMOVCARTINV').AsString = 'TRF' then
         begin
            if qryLocal.FieldByName('NATURMOVCARTINV').AsString = 'A' then // Aumenta quantidade de cotas (Compra)
               fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat))
            else if qryLocal.FieldByName('NATURMOVCARTINV').AsString = 'D' then // Diminui quantidade de cotas (Venda)
               fMovim := (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat))
            else
               fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*
                                (ABS(QryLocal.FieldByName('MOVIMATU').AsFloat)/
                                 QryLocal.FieldByName('MOVIMATU').AsFloat));
         end
         else
         begin
            if iTipoInvest = 2 then // Renda Variavel
            begin
               if cNaturezaMovimento = 'D' then // Venda
                  fMovim := (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*
                                 OperComum.DivValorZero(ABS(QryLocal.FieldByName('MOVIMATU').AsFloat),
                                                            QryLocal.FieldByName('MOVIMATU').AsFloat))
               else
                  fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*
                                        OperComum.DivValorZero(ABS(QryLocal.FieldByName('MOVIMATU').AsFloat),
                                                                   QryLocal.FieldByName('MOVIMATU').AsFloat));
            end
            else
               fMovim := (-1) * (ABS(QryLocal.FieldByName('VLRMOVCARTINV').AsFloat)*
                                     OperComum.DivValorZero(ABS(QryLocal.FieldByName('MOVIMATU').AsFloat),
                                                                QryLocal.FieldByName('MOVIMATU').AsFloat));
         end;
         // Caso Especifico para Fluxo do Titulo (IdTipoOperacao IN -17,-18,-19)
         if (qryLocal.FieldByName('NATURMOVCARTINV').AsString = 'C') and (bFluxoTitulo) then
             fMovim := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
            fSaldoDia  := fSaldoDia + fMovim;

         QryLocal.Next;
      End;
      // Libera Objetos Locais
      QryLocal.Free;

      if dDataRef = dDataOperFim then begin
         // Busca Saldo Final na Data Fim para simular uma Venda (+)
         OperComum.CalculaSaldo(iInvestimento, iCarteira, sLote, dDataSaldoFinal,
                               fNulo, fSaldoFinal,
                               fNulo, fNulo, fNulo, fNulo, fNulo, fNulo, fSaldoFinalMerc, fNulo,
                               fNulo, fSaldoPremio, fNulo, fNulo, fNulo, fNulo, fNulo);

         fSaldoDia := fSaldoDia + fSaldoFinal;
         if fSaldoDia <> 0 then iFlag := 1;
      end;

      Result := fSaldoDia;

   except
      Raise;
   end;
end;

// Função que Calcula Taxa Over para um Investimento num Período.
Function TOperacaoInvest.CalculaTaxaOver(iInvestimento: longint; dDataInicial, dDataFinal: TDateTime): double;

var
   QryLocal  :TwwQuery;
   iIntervalo, iIntUtil,iIntervaloDU: integer;
   wTaxaPeriodo: double;
begin
    wTaxaPeriodo :=1;
    Result := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    FazQuery(QryLocal,'SELECT TT.JUROSDIA,TJ.TAMPERJUROS,TJ.EFETNOMI '+
                      'FROM   TITRENFIXA TT, TIPOJUROS TJ '+
                      'WHERE  (TT.IDTITRENFIXA   = '+InttoStr(iInvestimento)+') AND '+
                      '       (TT.CODTIPTXJUROS = TJ.CODTIPTXJUROS)');
    iIntervaloDU := DiasUteisInv.IntervaloDiasUteis( dDataInicial, dDataFinal, -1, 1, '',True, False, False);
    if qryLocal.isEmpty then
    begin
       MsgDlg('Faltam dados para calcular TaxaOver!', 'Erro', mtError, [mbOk], 0);
    end
    else
    begin
       If QryLocal.FieldByName('JUROSDIA').AsFloat <> 0 Then
       Begin
          // Efetua Correção pelos Juros
          if QryLocal.FieldByName('TamPerJuros').AsInteger  = 252 then // DU
             iIntervalo   := DiasUteisInv.IntervaloDiasUteis( dDataInicial, dDataFinal, -1, 1, '',True, False, False)
          else // DC
             iIntervalo := DiasUteis.IntervaloDias(dDataInicial, dDataFinal);

          If QryLocal.FieldByName('EfetNomi').AsString = 'E' Then
          begin
             wTaxaPeriodo := Power( ( 1 + (QryLocal.FieldByName('JUROSDIA').AsFloat/100)), iIntervalo);
             wTaxaPeriodo := Power( wTaxaPeriodo, (1/iIntervaloDU))
          end
          Else
             wTaxaPeriodo := (1 + (QryLocal.FieldByName('JurosDia').AsFloat))*iIntervalo;
       end;
       wTaxaPeriodo := StrToFloat(FormatFloat('#0.000000000',wTaxaPeriodo));
       Result := (wTaxaPeriodo - 1) * 3000;
       Result  := StrToFloat(FormatFloat('#0.0000000',Result));
    end;
    QryLocal.Free;
end;

// Função que Busca Data e Valor Aplicado na Primeira Operacao de um Contrato
function TOperacaoInvest.BuscaInicioAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                              var dDataInicio : TDateTime; var fValInicio: double): boolean;
var
   QryLocal  :TwwQuery;
begin
    Result := False;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    if FazQuery(QryLocal,'SELECT H1.DATAMOVCARTINV, H1.VLRMOVCARTINV '+
                         'FROM   HISTCARTINV H1 '+
                         'WHERE (H1.DATAMOVCARTINV = '+
                         '          (SELECT MIN(H2.DATAMOVCARTINV) '+
                         '           FROM   HISTCARTINV H2 '+
                         '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
                         '                 (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
                         '                 (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))))) AND '+
                         '      (H1.IDHISTCARTINV   = '+
                         '          (SELECT MIN(H3.IDHISTCARTINV) '+
                         '           FROM   HISTCARTINV H3 '+
                         '           WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
                         '                 (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
                         '                 (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
                         '                 (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AND '+
                         '      (H1.IDINVESTIMENTO  IS NOT NULL) AND '+
                         '      (H1.VLRMOVCARTINV <> 0) AND '+
                         '      (H1.IDTIPOINVEST = 1) AND '+
                         '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
                         '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND '+
                         '      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL)))') then begin
      dDataInicio := QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime;
      fValInicio  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
      Result := True;
    end;

    QryLocal.Free;
end;

// Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Contrato num
//     determinado Periodo. Se nao informar data inicial, considera data da primeira
//     operacao registrada no Histcartinv. Se nao informar data final, considera data corrente.
//     Se informar sLote = '-1', trazer totais de todos os Lotes do Investimento.
function TOperacaoInvest.BuscaSaldosAplicacao(iInvestimento, iCarteira: longint; sLote: string;
                                              dDataInicio, dDataFim : TDateTime;
                                              var fValAplicado, fRendimento, fResgate,
                                              fRendto,fJuros,fVariacao,fAgio: double): boolean;                                              
var
   QryLocal  :TwwQuery;
   fAux      : double;
   sSql      : string;
begin
    Result := False;

    if (sLote = '-1') and ((DateToStr(dDataInicio) = '') or (DateToStr(dDataFim) = '')) then begin
      MsgDlg('Parâmetros Incorretos... Informar Período para Totalizar Lotes',
             'Erro',mtError,[mbOK],0);
      Exit;
    end;

    fValAplicado := 0;
    fRendimento  := 0;
    fResgate     := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    if DateToStr(dDataInicio) = '' then
         BuscaInicioAplicacao(iInvestimento, iCarteira, sLote, dDataInicio, fAux);

    if DateToStr(dDataFim) = '' then dDataFim := Date;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   HISTCARTINV H1                      '+
            'WHERE (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+')     AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''A'')) AND '+
                    '      (H1.TIPMOVCARTINV IN (''OPE'',''INI'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal, sSQL) then
    begin
      fValAplicado  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
      Result := True;
    end;

    // Juros e Variação
    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV, '+
            '  SUM(H1.VLRJUROS) AS VLRJUROS, SUM(H1.VLRVARIACAO) AS VLRVARIACAO, '+
            '  SUM(H1.VLRAGIO) AS VLRAGIO '+
            'FROM   HISTCARTINV H1 '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''G'',''P'',''L'',''R'',''C'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal,sSQL) then 
    begin
      fRendimento  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;      
      fJuros      := QryLocal.FieldByName('VLRJUROS').AsFloat;
      fVariacao   := QryLocal.FieldByName('VLRVARIACAO').AsFloat;
    end;

    // Ágio / Deságio
    sSQL := 'SELECT SUM(H1.VLRAGIO) AS VLRAGIO '+
            'FROM   HISTCARTINV H1 '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''A'',''G'',''P'',''L'',''R'',''C'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal,sSQL) then begin
      fAgio       := QryLocal.FieldByName('VLRAGIO').AsFloat;      
    end;

    // Rendimento
    fRendto     := fJuros + fVariacao + fAgio;

    // Resgates
    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   HISTCARTINV H1 '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = '+InttoStr(iInvestimento)+') AND ';

    if sLote <> '-1' then
      sSQL := sSQL +'      (((H1.IDLOTE IS NOT NULL) AND (H1.IDLOTE = '''+slote+''')) OR ((H1.IDLOTE IS NULL) AND ('''+slote+''' IS NULL))) AND ';

    sSQL := sSQL +  '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
                    '      (H1.NATURMOVCARTINV IN (''D'')) AND '+
                    '      (H1.TIPMOVCARTINV IN (''OPE'')) AND '+
                    '      (H1.IDTIPOINVEST = 1)';

    if FazQuery(QryLocal,sSQL) then begin
      fResgate  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    QryLocal.Free;
end;

// Função que Busca Saldos de Valor Aplicado, Rendimento e Resgate de um Tipo de Aplicação num
//     determinado Periodo. Se nao informar data inicial e final, considera data corrente.
function TOperacaoInvest.BuscaSaldosTipoAplic(iCarteira: longint; sTipoAplicacao: string;
                              dDataInicio, dDataFim : TDateTime;
                              var fValAplicado, fRendimento, fResgate: double): boolean;
var
   QryLocal  :TwwQuery;
   fAux      : double;
   sSql      : string;
begin
    Result := False;

    fValAplicado := 0;
    fRendimento  := 0;
    fResgate     := 0;
    QryLocal             := TwwQuery.Create(Application);
    QryLocal.DatabaseName:= 'BaseDados';

    if DateToStr(dDataInicio) = '' then dDataInicio := Date;
    if DateToStr(dDataFim) = '' then dDataFim := Date;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   HISTCARTINV H1, TITRENFIXA TT, TIPOTITRENFIXA TP '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND '+
            '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND '+
            '      (TP.CODTIPRENFIXA = '''+sTipoAplicacao+''') AND '+
            '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.NATURMOVCARTINV IN (''A'')) AND '+
            '      (H1.TIPMOVCARTINV IN (''OPE'',''INI''))';

    if FazQuery(QryLocal, sSQL) then begin
      fValAplicado  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
      Result := True;
    end;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   HISTCARTINV H1, TITRENFIXA TT, TIPOTITRENFIXA TP '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND '+
            '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND '+
            '      (TP.CODTIPRENFIXA = '''+sTipoAplicacao+''') AND '+
            '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.NATURMOVCARTINV IN (''G'',''P'',''L'',''R''))  ';

    if FazQuery(QryLocal,sSQL) then begin
      fRendimento  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    sSQL := 'SELECT SUM(H1.VLRMOVCARTINV) AS VLRMOVCARTINV '+
            'FROM   HISTCARTINV H1, TITRENFIXA TT, TIPOTITRENFIXA TP '+
            'WHERE '+
            '      (H1.IDCARTEIRAINVEST     = '+InttoStr(iCarteira)+') AND '+
            '      (H1.IDINVESTIMENTO       = TT.IDTITRENFIXA) AND '+
            '      (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA) AND '+
            '      (TP.CODTIPRENFIXA = '''+sTipoAplicacao+''') AND '+
            '      (H1.DATAMOVCARTINV >= TO_DATE( '''+DateToStr(dDataInicio)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.DATAMOVCARTINV <= TO_DATE( '''+DateToStr(dDataFim)+''',''DD/MM/YYYY'')) AND '+
            '      (H1.NATURMOVCARTINV IN (''D'')) AND '+
            '      (H1.TIPMOVCARTINV IN (''OPE''))';

    if FazQuery(QryLocal,sSQL) then begin
      fResgate  := QryLocal.FieldByName('VLRMOVCARTINV').AsFloat;
    end;

    QryLocal.Free;
end;

//------------------------------------------------------------------
// Executa uma Query - ExecSQL
Function TOperacaoInvest.ExecutaQuery(Qry: TwwQuery; Const Str :String): Boolean;
begin
  Result := False;
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      ExecSQL;
    Except
// Mostra Erro
      On E: Exception Do Begin
        ShowMessage('Erro na Execução da Query, '+#13+
                    #13+Str+#13+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13);
        Result := False;
        Exit;
      End;
    End;
  End;
  Result := True;
end;


//------------------------------------------------------------------
// Abre uma Query - Open
Function TOperacaoInvest.FazQuery(Var Qry : TwwQuery; Str : String) : Boolean;
Var
  wLinha  :String;
  wInicial,wFinal  :Integer;
Begin
  With Qry Do Begin
    Try
      Close;
      SQL.Clear;
      SQL.Add(Str);
      Open;
    Except
// Mostra Erro
      On E:Exception Do Begin
// Monta Linha da Query
        wInicial:=1;
        wFinal  :=(Pos('FROM',Str)-1);
        If wFinal <= 0 Then wFinal:= Length(Str);
        wLinha:=Copy(Str,1,wFinal)+#13;
// From Ate Where
        wInicial:=(Pos('FROM',Str)-1);
        wFinal  :=(((Pos('WHERE',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Where Ate Order by
        wInicial:=(Pos('WHERE',Str)-1);
        wFinal  :=(((Pos('ORDER BY',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Order By Ate Group By
        wInicial:=(Pos('ORDER BY',Str)-1);
        wFinal  :=(((Pos('GROUP BY',Str)-1))-Length(wLinha));
        If wFinal <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
// Group By Ate Final
        wInicial:=(Pos('GROUP BY',Str)-1);
        wFinal  :=Length(Str);
        If wInicial <= 0 Then Begin
          wInicial:=Length(wLinha);wFinal:=Length(Str);
        End;
        wLinha:=wLinha+Copy(Str,wInicial,wFinal)+#13;
        If MessageDlg('Erro na Abertura da Query, '+Qry.Name+' :'+#13+
                    #13+wLinha+
                    #13+'Com a Mensagem, '+#13+
                    #13+E.Message+#13+#13+'Deseja Capturar a Query ?',MtError,[MbYes,MbNo],0) = MrYes Then Begin
         InputBox('Mensagem do Sistema ', 'Query Errada !!', Qry.Sql.GetText);
        End;
        Result := False;
      End;
    End;
    Result := (EOF <> BOF);
  End;
End;

// Busca as Cotacoes de uma acao em uma data (Retorna um registro com as cortacoes
Function TOperacaoInvest.BuscaCotacoesAcao(IdAcao, IdBolsaValores :Integer;
                                           DataRef:TDateTime; Aproximado:Boolean):TRecCotacoes;
Var
  QryLocal:TwwQuery;
  wSQLCotacoes:String;
Begin
// Cria Objetos Locais
  QryLocal             := TwwQuery.Create(Application);
  QryLocal.DatabaseName:= 'BaseDados';

// Inicia Resultados
  Result.VlrAbertura:=0;Result.VlrFechamento:=0;Result.VlrMaxima   :=0;
  Result.VlrMinima  :=0;Result.VlrMedia     :=0;Result.VolNegociado:=0;
  Result.DataCotacao:=0;Result.QtdLote      :=0;

// Monta Linha de Pesquisa
  wSQLCotacoes:= 'SELECT  COT.DATACOTAACAO, COT.VLRABERTURA,	COT.VLRFECHAMENTO,         '+
                 '        COT.VLRMAXIMA, COT.VLRMINIMA, COT.VLRMEDIA, COT.VOLNEGOCIADO, '+
                 '        COT.QTDELOTE                                                  '+
                 'FROM    COTACAOACAO COT                                               '+
                 'WHERE 	(COT.IDACAO         = '''+ IntToStr(IdAcao)+''')         AND '+
                 '      	(COT.IDBOLSAVALORES = '''+ IntToStr(IdBolsaValores)+''') AND '+
                 '       (COT.DATACOTAACAO <= TO_DATE( '''+DateToStr(DataRef)+''',''DD/MM/YYYY'')) '+
                 'ORDER BY COT.DATACOTAACAO DESC ';

// Pesquisa Cotecoes
  FazQuery(QryLocal,wSQLCotacoes);

// Caso Nao tenha cotacoes ou não tenha na data e não for aproximado Zera data ....
  If (QryLocal.IsEmpty) Or (QryLocal.FieldByName('DATACOTAACAO').AsDateTime > DataRef) Or
    ( (Aproximado = False) And (QryLocal.FieldByName('DATACOTAACAO').AsDateTime <> DataRef) )
  Then Begin
    Result.DataCotacao:=0;
  End Else Begin
// Guarda Cotacoes
    Result.VlrAbertura  :=QryLocal.FieldByName('VLRABERTURA').AsFloat;
    Result.VlrFechamento:=QryLocal.FieldByName('VLRFECHAMENTO').AsFloat;
    Result.VlrMaxima    :=QryLocal.FieldByName('VLRMAXIMA').AsFloat;
    Result.VlrMinima    :=QryLocal.FieldByName('VLRMINIMA').AsFloat;
    Result.VlrMedia     :=QryLocal.FieldByName('VLRMEDIA').AsFloat;
    Result.VolNegociado :=QryLocal.FieldByName('VOLNEGOCIADO').AsFloat;
    Result.DataCotacao  :=QryLocal.FieldByName('DATACOTAACAO').AsDateTime;
    Result.QtdLote      :=QryLocal.FieldByName('QTDELOTE').Asinteger;
  End;
// Libera Objetos Locais
  QryLocal.Free;
End;

// Busca os Saldos de um Investimento/Lote em uma data
// (Retorna um registro com os Saldos)
Function TOperacaoInvest.BuscaSaldosLote(IdInvestimento: Integer; IdLote :String;
                                         DataReferencia:TDateTime):TRecSaldos;
Var
  QryLocal  :TwwQuery;
  wSQLSaldos:String;
  wCotacao  :Double;
Begin
// Cria Objetos Locais
  QryLocal             := TwwQuery.Create(Application);
  QryLocal.DatabaseName:= 'BaseDados';
  wCotacao:=1;
// Busca Cotacao do Investimento na Data de Referencia
  wCotacao := OperComum.BuscaCotacaoInvest(IdInvestimento, DataReferencia, True);

// Inicia Resultados
  Result.SldQtdInvCart:=0;Result.SldVlrInvCart  :=0;Result.SldAtuarial  :=0;
  Result.SldRendimento:=0;Result.SldCarregamento:=0;Result.SldAquisicao :=0;
  Result.SldVariacao  :=0;Result.SldJuros       :=0;Result.SldPremio    :=0;
  Result.SldMercado   :=0;Result.DataSaldo    :=0;

// Monta Linha de Pesquisa
  wSQLSaldos  :=
    'SELECT 	H1.IDINVESTIMENTO,   H1.IDLOTE, H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST,   '+
    '        H1.DATAMOVCARTINV,   H1.SALDOCOTASCARTINV, H1.SALDOVLRCARTINV,              '+
    '        H1.SALDOQTDEINVCART, H1.SALDOVLRINVCART,   H1.SALDOATU,   H1.SALDOCAR,      '+
    '        H1.SALDOAQUI, H1.SALDOREND, H1.SALDOVARIACAO, H1.SALDOJUROS, H1.SALDOPREMIO '+
    'FROM                                                 '+
    '     HISTCARTINV H1,                                 '+
    '     (SELECT MAX(H2.IDHISTCARTINV) AS IDHISTCARTINV  '+
    '      FROM HISTCARTINV H2 WHERE (H2.IDLOTE = '+QuotedStr(IdLote)+')) MAXIMO '+
    'WHERE                                                '+
    '     (IDINVESTIMENTO = '+QuotedStr(IntToStr(IdInvestimento))+') AND  '+
    '     (IDLOTE         = '+QuotedStr(IdLote)+')                   AND  '+
    '     (H1.IDHISTCARTINV = MAXIMO.IDHISTCARTINV)       '+
    'ORDER BY                                             '+
    '     H1.DATAMOVCARTINV DESC, H1.IDHISTCARTINV DESC   ';

// Pesquisa Saldos
  FazQuery(QryLocal,wSQLSaldos);

// Caso Nao tenha Saldo ou não tenha na data Zera data ....
  If (QryLocal.IsEmpty) Then Begin
    Result.DataSaldo :=0;
  End Else Begin
// Guarda Saldos
    Result.SldQtdInvCart  :=QryLocal.FieldByName('SALDOQTDEINVCART').AsFloat;
    Result.SldVlrInvCart  :=QryLocal.FieldByName('SALDOVLRINVCART').AsFloat;
    Result.SldAtuarial    :=QryLocal.FieldByName('SALDOATU').AsFloat;
    Result.SldAquisicao   :=QryLocal.FieldByName('SALDOAQUI').AsFloat;
    Result.SldRendimento  :=QryLocal.FieldByName('SALDOREND').AsFloat;
    Result.SldCarregamento:=QryLocal.FieldByName('SALDOCAR').AsFloat;
    Result.SldVariacao    :=QryLocal.FieldByName('SALDOVARIACAO').AsFloat;
    Result.SldJuros       :=QryLocal.FieldByName('SALDOJUROS').AsFloat;
    Result.SldPremio      :=QryLocal.FieldByName('SALDOPREMIO').AsFloat;
    Result.SldMercado     :=(QryLocal.FieldByName('SALDOVLRINVCART').AsFloat*wCotacao);
    Result.DataSaldo      :=QryLocal.FieldByName('DATAMOVCARTINV').AsDateTime;
  End;
// Libera Objetos Locais
  QryLocal.Free;
End;

// Função que Busca Saldos dos Investimentos de um Emissor numa data de referencia,
//     para uma Classe de Investimentos de RendaFixa, a vencer no período informado.
function TOperacaoInvest.BuscaSaldoAplicEmissor(iEmissor, iClasse: longint;
                              dDataRef, dIniVenc, dFimVenc : TDateTime;
                              var fSaldo: double): boolean;
var
  QryLocal  :TwwQuery;
  fAux      : double;
  sSql      : string;
begin
  Result := False;

  fSaldo := 0;
  QryLocal             := TwwQuery.Create(Application);
  QryLocal.DatabaseName:= 'BaseDados';

  sSQL := 'SELECT SUM(H1.SALDOVLRINVCART) AS TOTAL '+
          'FROM   HISTCARTINV H1, INVESTIMENTO IV, '+
          'TITRENFIXA TT, TIPOTITRENFIXA TP '+
          'WHERE  (H1.DATAMOVCARTINV = '+
          '     (SELECT MAX(H2.DATAMOVCARTINV) '+
          '      FROM   HISTCARTINV H2 '+
          '      WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
          '            (H2.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
          '            (((H1.IDLOTE IS NOT NULL) AND (H2.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))) AND '+
          '            (H2.DATAMOVCARTINV  <= TO_DATE( '''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')))) AND '+
          '       (H1.IDHISTCARTINV   = '+
          '       (SELECT MAX(H3.IDHISTCARTINV) '+
          '        FROM   HISTCARTINV H3 '+
          '        WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND '+
          '              (H3.IDINVESTIMENTO   = H1.IDINVESTIMENTO) AND '+
          '              (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOTE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL))) AND '+
          '              (H3.DATAMOVCARTINV   = H1.DATAMOVCARTINV)))  AND '+
          '       (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO) AND '+
          '       (IV.IDINVESTIMENTO   = TT.IDTITRENFIXA) AND '+
          '       (TT.CODTIPRENFIXA    = TP.CODTIPRENFIXA) AND '+
          '       (IV.IDEMISSOR = '+InttoStr(iEmissor)+') AND '+
          '       (TP.IDCLASSETIT = '+InttoStr(iClasse)+') AND '+
          '       (TT.DATAVENCTITRENFIX BETWEEN TO_DATE( '''+DateToStr(dIniVenc)+''',''DD/MM/YYYY'') AND TO_DATE( '''+DateToStr(dFimVenc)+''',''DD/MM/YYYY''))';

  if FazQuery(QryLocal, sSQL) then begin
    fSaldo  := QryLocal.FieldByName('TOTAL').AsFloat;
    Result := True;
  end;
  QryLocal.Free;
end;

//AL_23
//------------------------------------------------------------------------------
// Busca Saldos (Bloqueado ou Liberado) de um Carteira/Investimento/Lote/Custodiante
//      numa determinada Data para um determinado Motivo de Bloqueio
Function TOperacaoInvest.BuscaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia,
                              IdCustodiante, IdMotivoBloqueio: Integer;
                              IdLote: String; DataReferencia:TDateTime;
                              Var fSdoBloqueado, fSdoLiberado: Double): boolean;
Var
  fCotacao : Double;
Begin
   try
      //AL_23
      DtmOperacaoInvest.QrySaldoCustodia.Close;
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDINVESTIMENTO').AsInteger    := IdInvestimento;
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDPLANPREVCTBPATR').AsInteger := IdPlanPrev;
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDCARTEIRA').AsInteger        := IdCarteira;
      if IdCustodiante <> -1 then
         DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDCUSTODIANTE').AsInteger  := IdCustodiante
      else
         DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDCUSTODIANTE').Clear;
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDMOTIVOBLOQUEIO').AsInteger  := IdMotivoBloqueio;
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDLOTE').AsString             := IdLote;
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('DATAMOV').AsString            := DateToStr(DataReferencia);
      DtmOperacaoInvest.QrySaldoCustodia.ParamByName('IDCUSTODIA').AsInteger        := IdCustodia;
      DtmOperacaoInvest.QrySaldoCustodia.Open;

      // Gera Retorno caso tenha encontrado Registro
      If Not DtmOperacaoInvest.QrySaldoCustodia.IsEmpty Then
      Begin
        Result := True;
        if IdMotivoBloqueio = -1 then
        begin
           fSdoLiberado  := dtmOperacaoInvest.QrySaldoCustodia.FieldByName('SALDOLIBERADO').asFloat;
           fSdoBloqueado := 0;
        end
        else
        begin
           fSdoLiberado  := 0;
           fSdoBloqueado := dtmOperacaoInvest.QrySaldoCustodia.FieldByName('SALDOBLOQUEADO').asFloat;
        end;
      End
      Else
      Begin
        Result := False;
        fSdoLiberado  := 0;
        fSdoBloqueado := 0;
      End;
   finally
      dtmOperacaoInvest.QrySaldoCustodia.Close;
   end;
End;

//AL_23
// Função que Testa se existe Saldo no HistCustodia para uma Determinada Quantidade
Function TOperacaoInvest.TestaSaldosCustodia(IdPlanPrev,IdCarteira, IdInvestimento, IdCustodia,
                              IdCustodiante, IdMotivoBloqueio: Integer;
                              IdLote, sTipoCustodia: String; DataReferencia:TDateTime;
                              fQuant: Double): boolean;
var
  TotLiberado, TotBloqueado, TotInutil: Double;
begin
  //AL_23
  Result:= true;

  Case sTipoCustodia[1] Of

     'V', // Diminui Saldo Liberado  (Usado também em Acerto)
     'B', // Aumenta Saldo Bloqueado, diminui Saldo Liberado
     'D', // Aumenta Saldo Liberado, diminui Saldo Bloqueado
     'X'  // Diminui Saldo Bloqueado
     :
     begin
        TotLiberado  := 0;
        TotBloqueado := 0;

        if IdMotivoBloqueio = -1 then
        begin
           BuscaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia, IdCustodiante,
                             IdMotivoBloqueio, IdLote, DataReferencia,
                             TotInutil, TotLiberado);
           if fQuant > TotLiberado then Result := False;
        end
        else
        begin
           BuscaSaldosCustodia(IdPlanPrev, IdCarteira, IdInvestimento, IdCustodia, IdCustodiante,
                             IdMotivoBloqueio, IdLote, DataReferencia,
                              TotBloqueado, TotInutil);
           if fQuant > TotBloqueado then Result := False;
        end;
     end;
  end;
end;

//-------------------------------------------------------------------------------------------
// Função que Insere Registro no HistCustodia
//    Tipo de Movimento - I - Inicialização
//                        C - Compra
//                        V - Venda
//                        B - Bloqueia
//                        D - Desbloqueio
//                        X - Desbloqueia e Vende
//                        Y - Aumenta Saldo Bloqueado
//                        Z - Diminui Saldo Bloqueado
//-------------------------------------------------------------------------------------------
//AL_23
//AL_20
Function TOperacaoInvest.InsereCustodia(IdCarteira, IdInvestimento, IdCustodiante,
                                        IdMotivoBloqueio, IdOperacao, idOperCustodia: Integer;
                                        IdLote, sTipoCustodia   : String;
                                        DataReferencia          :TDateTime;
                                        fQuant                  : Double;
                                        var iIdHistCustodia     : Integer;
                                        iPlanPrev               : Integer = -1;
                                        iTipoConta : Integer = 0): boolean;
var
   sTipo1, sTipo2 : string;
   iTipoBloqueio1, iTipoBloqueio2 : integer;
begin
  try
      OperComum.LimpaParametros(dtmOperacaoInvest.QryHistCustodia);
      iIdHistCustodia := LeUltRegistro(Nil, 'HISTCUSTODIA');
      dtmOperacaoInvest.QryHistCustodia.ParamByName('IDCUSTODIA').AsInteger          := iIdHistCustodia;
      //AL_23
      if iPlanPrev < 0 then
         iPlanPrev := iPlanPrevCtbPatro;
      dtmOperacaoInvest.QryHistCustodia.ParamByName('IDPLANPREVCTBPATR').AsInteger   := iPlanPrev;
      //AL_20
      dtmOperacaoInvest.QryHistCustodia.ParamByName('FLGCONTAINVEST').AsInteger := iTipoConta;

      if (sTipoCustodia[1] <> 'B') and (sTipoCustodia[1] <> 'D') then
      begin
         if IdOperacao <> -1 then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IdOperacaoInvest').AsInteger := IdOPeracao;
         if Trim(IdLote) <> '' then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IdLote').AsString            := IdLote;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdCarteiraInvest').AsInteger    := IdCarteira;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdInvestimento').AsInteger      := IdInvestimento;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IDCUSTODIANTE').AsInteger       := IdCustodiante;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('DATAMOVCUSTOD').AsDateTime      := DataReferencia;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('FlgCalcSaldo').AsString         := '1';
         dtmOperacaoInvest.QryHistCustodia.ParamByName('QtdeMovCustod').AsFloat         := fQuant;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('SaldoLiberado').AsFloat         := 0;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('SaldoBloqueado').AsFloat        := 0;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('TipoCustodia').AsString         := sTipoCustodia;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdMotivoBloqueio').AsInteger    := IdMotivoBloqueio;
         // AL_25
         if idOperCustodia > 0 then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger   := idOperCustodia;
         dtmOperacaoInvest.QryHistCustodia.ExecSQL;
      end
      else
      begin
         if sTipoCustodia[1] = 'B' then
         begin // Bloqueia - Diminui Saldo Liberado, Aumenta Saldo Bloqueado
            sTipo1         := 'V';
            iTipoBloqueio1 := -1;
            sTipo2         := 'Y';
            iTipoBloqueio2 := IdMotivoBloqueio;
         end else
         begin // Desbloqueia - Diminui Saldo Bloqueado, Aumenta Saldo Liberado
            sTipo1         := 'Z';
            iTipoBloqueio1 := IdMotivoBloqueio;
            sTipo2         := 'C';
            iTipoBloqueio2 := -1;
         end;

         // Diminui Saldo Origem
         if IdOperacao <> -1 then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IdOperacaoInvest').AsInteger := IdOperacao;

         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdCarteiraInvest').AsInteger    := IdCarteira;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdInvestimento').AsInteger      := IdInvestimento;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IDCUSTODIANTE').AsInteger       := IdCustodiante;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('DATAMOVCUSTOD').AsDateTime      := DataReferencia;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('FlgCalcSaldo').AsString         := '1';
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdLote').AsString               := IdLote;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('QtdeMovCustod').AsFloat         := fQuant;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('SaldoLiberado').AsFloat         := 0;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('SaldoBloqueado').AsFloat        := 0;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('TipoCustodia').AsString         := sTipo1;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdMotivoBloqueio').AsInteger    := iTipoBloqueio1;
         if idOperCustodia <> -1 then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger   := idOperCustodia;

         dtmOperacaoInvest.QryHistCustodia.ExecSQL;

         // Aumenta Saldo Destino
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IDCUSTODIA').AsInteger          := LeUltRegistro(Nil, 'HISTCUSTODIA');
         if IdOperacao <> -1 then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IdOperacaoInvest').AsInteger := IdOperacao
         else
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IdOperacaoInvest').Clear;

         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdCarteiraInvest').AsInteger    := IdCarteira;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdInvestimento').AsInteger      := IdInvestimento;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IDCUSTODIANTE').AsInteger       := IdCustodiante;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('DATAMOVCUSTOD').AsDateTime      := DataReferencia;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('FlgCalcSaldo').AsString         := '1';
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdLote').AsString               := IdLote;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('QtdeMovCustod').AsFloat         := fQuant;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('SaldoLiberado').AsFloat         := 0;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('SaldoBloqueado').AsFloat        := 0;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('TipoCustodia').AsString         := sTipo2;
         dtmOperacaoInvest.QryHistCustodia.ParamByName('IdMotivoBloqueio').AsInteger    := iTipoBloqueio2;
         if idOperCustodia <> -1 then
            dtmOperacaoInvest.QryHistCustodia.ParamByName('IDOPERCUSTODIA').AsInteger   := idOperCustodia;

         dtmOperacaoInvest.QryHistCustodia.ExecSQL;
      end;
      result := true;
   except
      result := false;
   end;
   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   dtmOperacaoInvest.QryHistCustodia.Close;
end;


Function TOperacaoInvest.RetParamInvest1(Var pRegParInv : PTRecParamInvest; DatabaseTrabalho : String) : Boolean;
begin
   // AL_10
   try // finally
      Result := True;
      dtmOperComum.QryParamInvest.Close;
      dtmOperComum.QryParamInvest.Open;
      //New(RegParInv);
      pRegParInv.IDPARAMINVEST     := dtmOperComum.QryParamInvest.FieldByName('IDPARAMINVEST').AsInteger;
      pRegParInv.MASCSETOREMISSOR  := dtmOperComum.QryParamInvest.FieldByName('MASCSETOREMISSOR').AsString;
      pRegParInv.MOECODIGO         := dtmOperComum.QryParamInvest.FieldByName('MOECODIGO').AsInteger;
      pRegParInv.MASCCLASSIFINV    := dtmOperComum.QryParamInvest.FieldByName('MASCCLASSIFINV').AsString;
      pRegParInv.VLRDIVERG         := dtmOperComum.QryParamInvest.FieldByName('VLRDIVERG').AsFloat;
      pRegParInv.VLRCOTAINICART    := dtmOperComum.QryParamInvest.FieldByName('VLRCOTAINICART').AsFloat;
      pRegParInv.DATAULTFECH       := dtmOperComum.QryParamInvest.FieldByName('DATAULTFECH').AsDateTime;
      pRegParInv.FLGORDMOVINV      := dtmOperComum.QryParamInvest.FieldByName('FLGORDMOVINV').AsString;
      pRegParInv.PERCPUORDMOVINV   := dtmOperComum.QryParamInvest.FieldByName('PERCPUORDMOVINV').AsFloat;
      pRegParInv.PERCIMPRENDA      := dtmOperComum.QryParamInvest.FieldByName('PERCIMPRENDA').AsFloat;
      pRegParInv.MOEDAATU          := dtmOperComum.QryParamInvest.FieldByName('MOEDAATU').AsInteger;
      pRegParInv.PERCPARTICEMPR    := dtmOperComum.QryParamInvest.FieldByName('PERCPARTICEMPR').AsFloat;
      pRegParInv.PERCPARTICRECUR   := dtmOperComum.QryParamInvest.FieldByName('PERCPARTICRECUR').AsFloat;
      pRegParInv.IDPARAMPATRLIQ    := dtmOperComum.QryParamInvest.FieldByName('IDPARAMPATRLIQ').AsInteger;
      pRegParInv.TIPOMENU          := dtmOperComum.QryParamInvest.FieldByName('TIPOMENU').AsString;
      pRegParInv.DATAULTFECHRF     := dtmOperComum.QryParamInvest.FieldByName('DATAULTFECHRF').AsDateTime;
      pRegParInv.IDTIPODESPIRAPU   := dtmOperComum.QryParamInvest.FieldByName('IDTIPODESPIRAPU').AsInteger;
      pRegParInv.IDTIPODESPINVEST  := dtmOperComum.QryParamInvest.FieldByName('IDTIPODESPINVEST').AsInteger;
      pRegParInv.MOEDAGER          := dtmOperComum.QryParamInvest.FieldByName('MOEDAGER').AsInteger;
      pRegParInv.FLGPROVISIONAIRRF := dtmOperComum.QryParamInvest.FieldByName('FLGPROVISIONAIRRF').AsString;
      pRegParInv.FLGPROVISIONAIRRV := dtmOperComum.QryParamInvest.FieldByName('FLGPROVISIONAIRRV').AsString;
      pRegParInv.PUCDB             := dtmOperComum.QryParamInvest.FieldByName('PUCDB').AsFloat;
      pRegParInv.DATAMOVCDBLIB     := dtmOperComum.QryParamInvest.FieldByName('DATAMOVCDBLIB').AsDateTime;
      pRegParInv.IDTIPODESPIRPROV  := dtmOperComum.QryParamInvest.FieldByName('IDTIPODESPIRPROV').AsInteger;
      pRegParInv.MOEDAATULIT       := dtmOperComum.QryParamInvest.FieldByName('MOEDAATULIT').AsInteger;
      pRegParInv.IDPROGRAMA        := dtmOperComum.QryParamInvest.FieldByName('IDPROGRAMA').AsInteger;
      pRegParInv.IDTIPOCLIENTECOR  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOCLIENTECOR').AsInteger;
      pRegParInv.IDTIPOOPERDIRINC  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRINC').AsInteger;
      pRegParInv.IDTIPOOPERDIRCIS  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRCIS').AsInteger;
      pRegParInv.IDTIPOOPERDIRDES  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRDES').AsInteger;
      pRegParInv.IDTIPOOPERDIRGRU  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRGRU').AsInteger;
      pRegParInv.IDTIPOOPERDIRPER  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRPER').AsInteger;
      pRegParInv.IDTIPOOPERDIRBON  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRBON').AsInteger;
      pRegParInv.IDTIPOOPERDIRDIV  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRDIV').AsInteger;
      pRegParInv.IDTIPOOPERDIRSUB  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRSUB').AsInteger;
      pRegParInv.IDTIPOINVEST      := dtmOperComum.QryParamInvest.FieldByName('IDTIPOINVEST').AsInteger;
      pRegParInv.IDTIPOOPERDIRJUR  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRJUR').AsInteger;
      pRegParInv.IDTIPOCLIENTEEMI  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOCLIENTEEMI').AsInteger;
      pRegParInv.IDTIPOCLIENTECUS  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOCLIENTECUS').AsInteger;
      pRegParInv.IDTIPOCONTRRF     := dtmOperComum.QryParamInvest.FieldByName('IDTIPOCONTRRF').AsInteger;
      pRegParInv.IDBVSP            := dtmOperComum.QryParamInvest.FieldByName('IDBVSP').AsInteger;
      pRegParInv.IDTIPOINVESTIDOR  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOINVESTIDOR').AsInteger;
      pRegParInv.IDMERCADO         := dtmOperComum.QryParamInvest.FieldByName('IDMERCADO').AsInteger;
      pRegParInv.IDTIPOOPERLIQPEND := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERLIQPEND').AsInteger;
      pRegParInv.IDBMF             := dtmOperComum.QryParamInvest.FieldByName('IDBMF').AsInteger;
      pRegParInv.IDTIPOCONTRFIN    := dtmOperComum.QryParamInvest.FieldByName('IDTIPOCONTRFIN').AsInteger;
      pRegParInv.DATAULTFECHFDO    := dtmOperComum.QryParamInvest.FieldByName('DATAULTFECHFDO').AsDateTime;
      pRegParInv.DATAULTFECHBMF    := dtmOperComum.QryParamInvest.FieldByName('DATAULTFECHBMF').AsDateTime;
      pRegParInv.IDTPPERIODICIDADE := dtmOperComum.QryParamInvest.FieldByName('IDTPPERIODICIDADE').AsInteger;
      pRegParInv.DATAULTIMPCOT     := dtmOperComum.QryParamInvest.FieldByName('DATAULTIMPCOT').AsDateTime;
      pRegParInv.IDTIPOOPERDIRALT  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRALT').AsInteger;
      pRegParInv.IDRAMOFORCOR      := dtmOperComum.QryParamInvest.FieldByName('IDRAMOFORCOR').AsInteger;
      pRegParInv.IDRAMOFOREMI      := dtmOperComum.QryParamInvest.FieldByName('IDRAMOFOREMI').AsInteger;
      pRegParInv.IDRAMOFORCUS      := dtmOperComum.QryParamInvest.FieldByName('IDRAMOFORCUS').AsInteger;
      pRegParInv.FLGLIBERAIDLOTE   := dtmOperComum.QryParamInvest.FieldByName('FLGLIBERAIDLOTE').AsString;
      pRegParInv.IDTIPOOPERDIRRES  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRRES').AsInteger;
      pRegParInv.FLGUSASUBCONTA    := dtmOperComum.QryParamInvest.FieldByName('FLGUSASUBCONTA').AsString;
      pRegParInv.PERCDEVRV         := dtmOperComum.QryParamInvest.FieldByName('PERCDEVRV').AsFloat;
      pRegParInv.PERCDEVBMF        := dtmOperComum.QryParamInvest.FieldByName('PERCDEVBMF').AsFloat;
      pRegParInv.DIASEMANACPMF     := dtmOperComum.QryParamInvest.FieldByName('DIASEMANACPMF').AsString;
      pRegParInv.DIASUTEISCPMF     := dtmOperComum.QryParamInvest.FieldByName('DIASUTEISCPMF').AsInteger;
      pRegParInv.IDCUSTODIARENFIX  := dtmOperComum.QryParamInvest.FieldByName('IDCUSTODIARENFIX').AsInteger;
      pRegParInv.IDTIPOREGRARV     := dtmOperComum.QryParamInvest.FieldByName('IDTIPOREGRARV').AsInteger;
      pRegParInv.IDTIPOREGRARF     := dtmOperComum.QryParamInvest.FieldByName('IDTIPOREGRARF').AsInteger;
      pRegParInv.IDTIPOREGRABMF    := dtmOperComum.QryParamInvest.FieldByName('IDTIPOREGRABMF').AsInteger;
      pRegParInv.FLGIMPLANTARF     := dtmOperComum.QryParamInvest.FieldByName('FLGIMPLANTRF').AsString;
      pRegParInv.FLGCONTABILIZA    := dtmOperComum.QryParamInvest.FieldByName('FLGCONTABILIZA').AsString;
      pRegParInv.FLGINTCAPCAR      := dtmOperComum.QryParamInvest.FieldByName('FLGINTCAPCAR').AsString;
      pRegParInv.IDCONTRAPARTERF   := dtmOperComum.QryParamInvest.FieldByName('IDCONTRAPARTERF').AsInteger;
      pRegParInv.IDAUTORIZAORDEM   := dtmOperComum.QryParamInvest.FieldByName('IDAUTORIZAORDEM').AsInteger;
      pRegParInv.IDCLASSEPOUP      := dtmOperComum.QryParamInvest.FieldByName('IDCLASSETIT').AsInteger;
      pRegParInv.FLGEMPACOES       := dtmOperComum.QryParamInvest.FieldByName('FLGEMPACOES').AsString;
      pRegParInv.IDCARTEMPACOES    := dtmOperComum.QryParamInvest.FieldByName('IDCARTEMPACOES').AsInteger;
      pRegParInv.IDREGRAEMPACOES   := dtmOperComum.QryParamInvest.FieldByName('IDREGRAEMPACOES').AsInteger;
      pRegParInv.IDMOTBLOQEMPAC    := dtmOperComum.QryParamInvest.FieldByName('IDMOTBLOQEMPAC').AsInteger;
      pRegParInv.FLGCARTGERENC     := dtmOperComum.QryParamInvest.FieldByName('FLGCARTGERENC').AsString;
      pRegParInv.IDINDEXPOUPANCA   := dtmOperComum.QryParamInvest.FieldByName('IDINDEXPOUPANCA').AsInteger;
      pRegParInv.JUROSPOUPANCA     := dtmOperComum.QryParamInvest.FieldByName('JUROSPOUPANCA').AsInteger;
      pRegParInv.IDTIPOOPERDIRMUL  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRMUL').AsInteger;
      pRegParInv.IDPLANPREVCTBPATR := dtmOperComum.QryParamInvest.FieldByName('IDPLANPREVCTBPATR').AsInteger;
      pRegParInv.IDOPERAMORTPRINC  := dtmOperComum.QryParamInvest.FieldByName('IDOPERAMORTPRINC').AsInteger;
      pRegParInv.IDOPERINCJUROS    := dtmOperComum.QryParamInvest.FieldByName('IDOPERINCJUROS').AsInteger;
      pRegParInv.IDOPERPAGTOJUROS  := dtmOperComum.QryParamInvest.FieldByName('IDOPERPAGTOJUROS').AsInteger;
      pRegParInv.FLGESPECFUNDO     := dtmOperComum.QryParamInvest.FieldByName('FLGESPECFUNDO').AsString;
      pRegParInv.FLGCOMPVARRV      := dtmOperComum.QryParamInvest.FieldByName('FLGCOMPVARRV').AsString;
      pRegParInv.PRZVENCBMF        := dtmOperComum.QryParamInvest.FieldByName('PRZVENCBMF').AsInteger;
      pRegParInv.PRZVENCCFIANCA    := dtmOperComum.QryParamInvest.FieldByName('PRZVENCCFIANCA').AsInteger;
      PRegParInv.IDTIPOREGRAFND    := dtmOperComum.QryParamInvest.FieldByName('IDTIPOREGRAFND').AsInteger;
      pRegParInv.IDCLASSPOUPBLOQ   := dtmOperComum.QryParamInvest.FieldByName('IDCLASSPOUPBLOQ').AsInteger;
      pRegParInv.IDTIPOREGRARENT   := dtmOperComum.QryParamInvest.FieldByName('IDTIPOREGRARENT').AsInteger;
      pRegParInv.DATAMOVTORV       := DiasUteisInv.PrimeiroDiaUtilPosterior(dtmOperComum.QryParamInvest.FieldByName('DATAULTFECH').AsDateTime,-1,1,'',True,False,False);
      pRegParInv.IDTIPOREGRAATUAR  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOREGRAATUAR').AsInteger;
      pRegParInv.FLGPLANPREVCTBPAT := dtmOperComum.QryParamInvest.FieldByName('FLGPLANPREVCTBPAT').AsString;
      pRegParInv.IDCLASSNTN        := dtmOperComum.QryParamInvest.FieldByName('IDCLASSNTN').AsInteger;
      pRegParInv.IDTIPOOPERDIRREE  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRREE').AsInteger;
      pRegParInv.DATAULTFECHEMP    := dtmOperComum.QryParamInvest.FieldByName('DATAULTFECHEMP').AsDateTime;
      pRegParInv.IDTIPOOPERDIRPROV := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRPROV').AsInteger;
      pRegParInv.IDTIPOOPEROPCCP   := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPEROPCCP').AsInteger;
      pRegParInv.IDTIPOOPEROPCVD   := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPEROPCVD').AsInteger;
      pRegParInv.MOEDAEQM          := dtmOperComum.QryParamInvest.FieldByName('MOEDAEQM').AsInteger;
      pRegParInv.STARET            := dtmOperComum.QryParamInvest.FieldByName('STARET').AsString;
      pRegParInv.DATAULTRET        := dtmOperComum.QryParamInvest.FieldByName('DATAULTRET').AsDateTime;
      pRegParInv.IDCARTOPCIND      := dtmOperComum.QryParamInvest.FieldByName('IDCARTOPCIND').AsInteger;
      pRegParInv.IDCARTOPC         := dtmOperComum.QryParamInvest.FieldByName('IDCARTOPC').AsInteger;
      pRegParInv.IDMOTBLOQOPC      := dtmOperComum.QryParamInvest.FieldByName('IDMOTBLOQOPC').AsInteger;
      pRegParInv.IDCARTAVISTA      := dtmOperComum.QryParamInvest.FieldByName('IDCARTAVISTA').AsInteger;
      pRegParInv.DIFMAXOPCIND      := dtmOperComum.QryParamInvest.FieldByName('DIFMAXOPCIND').AsFloat;
      pRegParInv.IDTIPOREGRAOPCIN  := dtmOperComum.QryParamInvest.FieldByName('IDCARTOPCIND').AsInteger;
      pRegParInv.IDTIPOREGRAEMPAC  := dtmOperComum.QryParamInvest.FieldByName('IDCARTOPC').AsInteger;
      pRegParInv.IDTIPODESPDVCOR   := dtmOperComum.QryParamInvest.FieldByName('IDMOTBLOQOPC').AsInteger;
      pRegParInv.IDGRUPOREGRAINV   := dtmOperComum.QryParamInvest.FieldByName('IDGRUPOREGRAINV').AsInteger;
      pRegParInv.FLGDEMO           := dtmOperComum.QryParamInvest.FieldByName('FLGDEMO').AsString;
      pRegParInv.FLGINTFINLIQ      := dtmOperComum.QryParamInvest.FieldByName('FLGINTFINLIQ').AsString;
      //AL_4
      pRegParInv.DTMUDACPMF        := dtmOperComum.QryParamInvest.FieldByName('DTMUDACPMF').AsDateTime;
      //Al_7
      pRegParInv.FLGRECPAGRV       := dtmOperComum.QryParamInvest.FieldByName('FLGRECPAGRV').AsString;
      //Al_8
      pRegParInv.IDTIPOOPERDIRDSU  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRDSU').AsInteger;
      pRegParInv.DIFRESGFUNDOS     := dtmOperComum.QryParamInvest.FieldByName('DIFRESGFUNDOS').AsInteger;
      //Al_11
      pRegParInv.FLGPOUPAPROPDIA   := dtmOperComum.QryParamInvest.FieldByName('FLGPOUPAPROPDIA').AsString;
      //Renan Cristiano - SOL: 39931 | Kintana: 523366 Inicio
      pRegParInv.DATARELMOVIMENTO  := dtmOperComum.qryParamInvest.fieldByName('DATARELMOVIMENTO').AsDateTime;
      pRegParInv.DATARELINICIAL    := dtmOperComum.qryParamInvest.fieldByName('DATARELINICIAL').AsDateTime;
      //Renan Cristiano - SOL: 39931 | Kintana: 523366 Fim
      //Al_15
      pRegParInv.IDTIPOOPERRFRAC   := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERRFRAC').AsInteger;
      //AL_16
      pRegParInv.IDTIPOOPERDIRDSA  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRDSA').AsInteger;
      pRegParInv.IDTIPOOPERDIRDSR  := dtmOperComum.QryParamInvest.FieldByName('IDTIPOOPERDIRDSR').AsInteger;
      //AL_17
      pRegParInv.FLGREGIMECXCOMP  := dtmOperComum.QryParamInvest.FieldByName('FLGREGIMECXCOMP').AsString;
      pRegParInv.DTAREGIMECXCOMP  := dtmOperComum.QryParamInvest.FieldByName('DTAREGIMECXCOMP').AsDateTime;
      //Al_19 - 09/02/2005
      pRegParInv.PZORECCPMF        := dtmOperComum.QryParamInvest.FieldByName('PZORECCPMF').AsInteger;
      pRegParInv.DATAINIRECCPMF    := dtmOperComum.QryParamInvest.FieldByName('DATAINIRECCPMF').AsDateTime;
      //AL_24
      pRegParInv.FLGCONTABDIAUTIL  := dtmOperComum.QryParamInvest.FieldByName('FLGCONTABDIAUTIL').AsString;
      //AL_26 - Bloqueio Contabil/Financeiro por Modulo
      pRegParInv.FLGINTCONTABRF    := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABRF').AsString;
      pRegParInv.FLGINTCONTABRV    := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABRV').AsString;
      pRegParInv.FLGINTCONTABBMF   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABBMF').AsString;
      pRegParInv.FLGINTCONTABFRF   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABFRF').AsString;
      pRegParInv.FLGINTCONTABFRV   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABFRV').AsString;
      pRegParInv.FLGINTCONTABFIM   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABFIM').AsString;
      pRegParInv.FLGINTCONTABFDC   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABFDC').AsString;
      pRegParInv.FLGINTCONTABFIP   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABFIP').AsString;
      //AL_29
      pRegParInv.FLGINTCONTABOPI   := dtmOperComum.QryParamInvest.FieldByName('FLGINTCONTABOPI').AsString;
      //AL_27
      pRegParInv.IDMOTBLOQPENFDO   := dtmOperComum.QryParamInvest.FieldByName('IDMOTBLOQPENFDO').AsInteger;
      pRegParInv.IDCARTEIRARF      := dtmOperComum.QryParamInvest.FieldByName('IDCARTEIRARF').AsInteger;

      // Acerta a data de fechamento do modulo na barra de tarefas
      if TipoMenuInvest <> '' then //Evita erro de acesso
      begin
         if TipoMenuInvest = 'A' then
            FrmPrincipal.stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := ''
         else if TipoMenuInvest = 'F' then
            FrmPrincipal.stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRegParInv.DATAULTFECHRF)
         else if TipoMenuInvest = 'V' Then
            FrmPrincipal.stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRegParInv.DATAULTFECH)
         else if TipoMenuInvest = 'B' then
            FrmPrincipal.stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRegParInv.DATAULTFECHBMF)
         else if TipoMenuInvest = 'I' then
            FrmPrincipal.stbarStatusBar.Panels.PanelByName('pnlDataFechamento').Text := DateToStr(pRegParInv.DATAULTFECHFDO);
      end;

      //----------Emerson SOL 110583  10.03.2009 Inicio---------//
      pRegParInv.REGRABOLETA := dtmOperComum.QryParamInvest.FieldByName('REGRABOLETA').AsString;
      //----------Emerson SOL 110583  10.03.2009 fim---------//
      //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
      pRegParInv.DATAVIGDIR        := dtmOperComum.QryParamInvest.FieldByName('DATAVIGDIR').AsDateTime;
      pRegParInv.TPDATAVIGDIR      := dtmOperComum.QryParamInvest.FieldByName('TPDATAVIGDIR').AsString;
      //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
      pRegParInv.IDCARTORIGEMPACOES := dtmOperComum.QryParamInvest.FieldByName('IDCARTORIGEMPACOES').AsInteger;

 
   finally
      OperComum.LimpaParametros(dtmOperComum.QryParamInvest);
   end;
end;


Function TOperacaoInvest.SimNao(S : String) : Boolean;
begin
  Result := S[1] in ['1', 'S'];
end;

Function TOperacaoInvest.RetParamOperDireito(OperacaoDireito : Integer; Var RegTO : TRegTipoOperacao; NomeDatabase : String) : Boolean;
Var
  qryTmp : TwwQuery;
begin
  Result := False;
  qryTmp := TwwQuery.Create(Application);
  Try
    qryTmp.DatabaseName := NomeDatabase;
    qryTmp.SQL.Add('SELECT TIO.FLGGERACONTAB,');
    qryTmp.SQL.Add('       TIO.FLGGERACAPCAR,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGGERACAF, NULL, '#39'N'#39', TIO.FLGGERACAF) AS FLGGERACAF,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGTRANSF, NULL, '#39'N'#39', TIO.FLGTRANSF) AS FLGTRANSF,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGCORRET, NULL, '#39'N'#39', TIO.FLGCORRET) AS FLGCORRET,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGORDMOVINV, NULL, '#39'N'#39', TIO.FLGORDMOVINV) AS FLGORDMOVINV,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGOPDIREITO, NULL, '#39'N'#39', TIO.FLGOPDIREITO) AS FLGOPDIREITO,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGAGE, NULL, '#39'N'#39', TIO.FLGAGE) AS FLGAGE,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGDATAEX, NULL, '#39'N'#39', TIO.FLGDATAEX) AS FLGDATAEX,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGDATACOM, NULL, '#39'N'#39', TIO.FLGDATACOM) AS FLGDATACOM,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGINVORIGEM, NULL, '#39'N'#39', TIO.FLGINVORIGEM) AS FLGINVORIGEM,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPERC, NULL, '#39'N'#39', TIO.FLGPERC) AS FLGPERC,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPARIDADE, NULL, '#39'N'#39', TIO.FLGPARIDADE) AS FLGPARIDADE,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPRZBOLSA, NULL, '#39'N'#39', TIO.FLGPRZBOLSA) AS FLGPRZBOLSA,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGPRZEMP, NULL, '#39'N'#39', TIO.FLGPRZEMP) AS FLGPRZEMP,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGATADEC, NULL, '#39'N'#39', TIO.FLGATADEC) AS FLGATADEC,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGFORMAPAGREC, NULL, '#39'N'#39', TIO.FLGFORMAPAGREC) AS FLGFORMAPAGREC,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGDIVACAO, NULL, '#39'N'#39', TIO.FLGDIVACAO) AS FLGDIVACAO,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGINIPAG, NULL, '#39'N'#39', TIO.FLGINIPAG) AS FLGINIPAG,');
    qryTmp.SQL.Add('       DECODE(TIO.FLGJUROS, NULL, '#39'N'#39', TIO.FLGJUROS) AS FLGJUROS,');
    qryTmp.SQL.Add('       DECODE(TIO.TIPSALDOCARTORIG, NULL, '#39'N'#39', TIO.TIPSALDOCARTORIG) AS TIPSALDOCARTORIG,');
    qryTmp.SQL.Add('       DECODE(TIO.TIPSALDOCARTDEST, NULL, '#39'N'#39', TIO.TIPSALDOCARTDEST) AS TIPSALDOCARTDEST,');
    qryTmp.SQL.Add('       TIO.FLGTRATAIR,');
    qryTmp.SQL.Add('       TIO.IDMERCADO,');
    qryTmp.SQL.Add('       OD.PERCENTUAL,');
    qryTmp.SQL.Add('       OD.DIVPORACAO,');
    qryTmp.SQL.Add('       OD.PARIDADE');
    qryTmp.SQL.Add('FROM TIPOOPERACAO TIO, OPERACAODIREITO OD');
    qryTmp.SQL.Add('WHERE');
    qryTmp.SQL.Add('  TIO.IDTIPOOPERACAO = OD.IDTIPOOPERACAO AND');
    qryTmp.SQL.Add('  TIO.IDTIPOINVEST   = 2 AND');
    qryTmp.SQL.Add('  OD.IDOPERACAODIREITO = :P_IDOPERACAODIREITO');
    qryTmp.ParamByName('P_IDOPERACAODIREITO').AsInteger := OperacaoDireito;
    qryTmp.Open;

    If Not qryTmp.IsEmpty Then
      Begin
        RegTo.FLGGERACONTAB := SimNao(qryTmp.FieldByName('FLGGERACONTAB').AsString);
        RegTo.FLGGERACAPCAR := SimNao(qryTmp.FieldByName('FLGGERACAPCAR').AsString);
        RegTo.FLGGERACAF    := SimNao(qryTmp.FieldByName('FLGGERACAF').AsString);
        RegTo.FLGTRANSF     := SimNao(qryTmp.FieldByName('FLGTRANSF').AsString);
        RegTo.FLGCORRET     := SimNao(qryTmp.FieldByName('FLGCORRET').AsString);
        RegTo.FLGORDMOVINV  := SimNao(qryTmp.FieldByName('FLGORDMOVINV').AsString);
        RegTo.FLGOPDIREITO  := SimNao(qryTmp.FieldByName('FLGOPDIREITO').AsString);
        RegTo.FLGAGE        := SimNao(qryTmp.FieldByName('FLGAGE').AsString);
        RegTo.FLGDATAEX     := SimNao(qryTmp.FieldByName('FLGDATAEX').AsString);
        RegTo.FLGDATACOM    := SimNao(qryTmp.FieldByName('FLGDATACOM').AsString);
        RegTo.FLGINVORIGEM  := SimNao(qryTmp.FieldByName('FLGINVORIGEM').AsString);
        RegTo.FLGPERC       := SimNao(qryTmp.FieldByName('FLGPERC').AsString);
        RegTo.FLGPARIDADE   := SimNao(qryTmp.FieldByName('FLGPARIDADE').AsString);
        RegTo.FLGPRZBOLSA   := SimNao(qryTmp.FieldByName('FLGPRZBOLSA').AsString);
        RegTo.FLGPRZEMP     := SimNao(qryTmp.FieldByName('FLGPRZEMP').AsString);
        RegTo.FLGATADEC     := SimNao(qryTmp.FieldByName('FLGATADEC').AsString);
        RegTo.FLGFORMAPAGREC:= SimNao(qryTmp.FieldByName('FLGFORMAPAGREC').AsString);
        RegTo.FLGDIVACAO    := SimNao(qryTmp.FieldByName('FLGDIVACAO').AsString);
        RegTo.FLGINIPAG     := SimNao(qryTmp.FieldByName('FLGINIPAG').AsString);
        RegTo.FLGJUROS      := SimNao(qryTmp.FieldByName('FLGJUROS').AsString);
        RegTo.TIPSALDOCARTORIG := SimNao(qryTmp.FieldByName('TIPSALDOCARTORIG').AsString);
        RegTo.TIPSALDOCARTDEST := SimNao(qryTmp.FieldByName('TIPSALDOCARTDEST').AsString);
        RegTo.FLGTRATAIR    := qryTmp.FieldByName('FLGTRATAIR').AsString;
        RegTo.PERCENTUAL    := qryTmp.FieldByName('PERCENTUAL').AsFloat;
        RegTo.DIVPORACAO    := qryTmp.FieldByName('DIVPORACAO').AsFloat;
        RegTo.PARIDADE      := qryTmp.FieldByName('PARIDADE').AsFloat;
        RegTo.IDMERCADO     := qryTmp.FieldByName('IDMERCADO').AsInteger;
        Result := True;
      End;
    qryTmp.Close;
  Finally
    qryTmp.Free;
  End;
end;

function TOperacaoInvest.RefazContabDireito(dDataIni, dDataFim: TDateTime; bTransacao: Boolean): Boolean;
var qryRContDirTot, qryRContDirUpd: TwwQuery;
    wTipoRecDesBol, wMensErro: String;
    bCriaLancto: Boolean;
    wPlano, wPlanilha, wDocumCont: Integer;
begin
   // Confirma a operação
   if MsgDlg('Confirma o Relançamento  Contábil'+#13+
             'das Operações de Direito Efetuadas '+#13+
             'no período de ' + DateToStr(dDataIni) + ' até ' + DateToStr(dDataFim),
             'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo then
   begin
      Result := True;
      Exit;
   end;

   qryRContDirTot := TwwQuery.Create(Application);
   qryRContDirTot.DatabaseName  := 'BaseDados';
   qryRContDirUpd := TwwQuery.Create(Application);
   qryRContDirUpd.DatabaseName  := 'BaseDados';

   try
      try
         //AL_23
         FazQuery(qryRContDirTot, 'SELECT HI.IDHISTCARTINV, HI.IDINVESTIMENTO, HI.IDTIPOOPERACAO, ' +
                                   'HI.IDOPERACAOINVEST, OI.IDFORCLI, HI.IDCARTEIRAINVEST, INV.MOECODIGO, ' +
                                   'HI.IDLOTE, OI.NUMDOCUMENTO, HI.DATAMOVCARTINV, OI.DATAVENCOPER, ' +
                                   'OI.IDOPERACAODIREITO, HI.VLRMOVCARTINV, H1.IDPLANPREVCTBPATR ' +
                                   'FROM HISTCARTINV HI, OPERACAOINVEST OI, ' +
                                   '     (SELECT DISTINCT INV.IDINVESTIMENTO, AXB.MOECODIGO ' +
                                   '      FROM  INVESTIMENTO INV, ACOESXBOLSA AXB ' +
                                   '      WHERE (INV.IDINVESTIMENTO = AXB.IDACAO) ) INV ' +
                                   'WHERE (HI.IDOPERACAOINVEST = OI.IDOPERACAOINVEST(+)) AND ' +
                                   '      (INV.IDINVESTIMENTO = HI.IDINVESTIMENTO) AND ' +
                                   '      (HI.IDTIPOINVEST = 2) AND ' +
                                   '      (HI.TIPMOVCARTINV = ''OPE'') AND ' +
                                   '      (HI.DATAMOVCARTINV BETWEEN TO_DATE(''' + DateToStr(dDataIni) + ''',''DD/MM/YYYY'') AND ' +
                                   '                                 TO_DATE(''' + DateToStr(dDataFim) + ''',''DD/MM/YYYY'') ) AND ' +
                                   '      (HI.PLNCODIGO IS NULL) AND (HI.CODDOCUMENTO IS NULL)' +
                                   'ORDER BY DATAMOVCARTINV, IDHISTCARTINV');

         if qryRContDirTot.IsEmpty then
         begin
            Result := True;
            Exit;
         end;

         frmAguardeInv.Pos := 0;
         frmAguardeInv.Max := qryRContDirTot.RecordCount - 1;

         qryRContDirTot.First;

         if bTransacao then
         begin
            if not dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.StartTransaction;
         end;


         while not qryRContDirTot.Eof do
         begin
            frmAguardeInv.Mostra('Aguarde, Refazendo Lançamentos da Boleta ' +
                                 qryRContDirTot.FieldByName('NUMDOCUMENTO').AsString);

            // Parametro para Contabilidade e CAP/CAR
            wTipoRecDesBol := '';
            bCriaLancto := True;
            wPlano := -1;
            wPlanilha := -1;
            wDocumCont := -1;
            wMensErro := '';

            //AL_23 - Contabiliza por Plano/Patro 
            if OperComum.LancaOperRFRV(Sistema.IdEmpresa, Sistema.IdModulo,2,
                                       qryRContDirTot.FieldByName('IDINVESTIMENTO').AsInteger,
                                       qryRContDirTot.FieldByName('IDTIPOOPERACAO').AsInteger,
                                       qryRContDirTot.FieldByName('IDOPERACAOINVEST').AsInteger,
                                       qryRContDirTot.FieldByName('IDFORCLI').AsInteger,
                                       qryRContDirTot.FieldByName('IDCARTEIRAINVEST').AsInteger,
                                       qryRContDirTot.FieldByName('MOECODIGO').AsInteger,'',
                                       qryRContDirTot.FieldByName('IDLOTE').AsString,'',
                                       qryRContDirTot.FieldByName('NUMDOCUMENTO').AsString,'R',
                                       wTipoRecDesBol,bCriaLancto,
                                       qryRContDirTot.FieldByName('VLRMOVCARTINV').AsFloat,
                                       qryRContDirTot.FieldByName('VLRMOVCARTINV').AsFloat,
                                       qryRContDirTot.FieldByName('DATAMOVCARTINV').AsDateTime,
                                       qryRContDirTot.FieldByName('DATAVENCOPER').AsDateTime,
                                       wPlano,wPlanilha,wDocumCont,wMensErro, '', True, True, 0, True,
                                       qryRContDirTot.FieldByName('IDPLANPREVCTBPATR').AsInteger) <> 0 then
            begin
               DtmBaseDados.dbBaseDados.Rollback;
               MsgDlg('Operação cancelada: Ocorreu um problema'#13+
                      'no lançamento contábil','Mensagem do Sistema ',mtWarning,[mbOK],0);
               Result := False;
               Exit;
            end;

            // Update no Plano,CodDocumento e PlnCodigo na HISTCARTINV
            ExecutaQuery(qryRContDirUpd, 'UPDATE HISTCARTINV ' +
                                         'SET PLANO = ' + IntToStr(wPlano) + ', ' +
                                         '    CODDOCUMENTO = ' + IntToStr(wDocumCont) + ', ' +
                                         '    PLNCODIGO = ' + IntToStr(wPlanilha) + ' ' +
                                         'WHERE IDHISTCARTINV = ' + qryRContDirTot.FieldByName('IDHISTCARTINV').AsString);

            qryRContDirTot.Next;
            frmAguardeInv.Pos := frmAguardeInv.Pos + 1;
         end;
         if bTransacao then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Commit;
         end;
         result := true;         
      except
         if bTransacao then
         begin
            if dtmBaseDados.dbBaseDados.InTransaction then
               dtmBaseDados.dbBaseDados.Rollback;
         end;
         MsgDlg('Erro ao Reprocessar as Operações de Direito.','Mensagem do Sistema ',
                   MtWarning,[MbOk],0);
         result := false;          
         Exit;
      end;
   finally
      qryRContDirTot.Free;
      qryRContDirUpd.Free;
      frmAguardeInv.Apaga;
   end;

end;

//AL_12 - 21/06/2005
//AL_22
function TOperacaoInvest.AlimentaOperCustodia(idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,iIdHistCartInvOrig,
                                              iIdHistCartInvDest,iIdCarteiraOrig,iIdCarteiraDest,iIdInvestimento ,
                                              iIdCustodianteOrig,iIdCustodianteDest,iIdMotBloqOrig,iIdMotBloqDest : integer;
                                              fQtd : Double;
                                              dtMovCustodia :TDateTime;
                                              sLote, sBoleta: string;
                                              iPlanPrev      : Integer = -1;
                                              iTipoOperacao : Integer = -1;
                                              iPlanPrevDest : Integer = -1): Boolean;
begin
   try
      OperComum.LimpaParametros(dtmOperacaoInvest.qryInsOperCustodia);
      with dtmOperacaoInvest.qryInsOperCustodia do
      begin
         // AL_13 - Ini
         ParamByName('IDOPERCUSTODIA').AsInteger    := idOperCustodia;
         if iIdHistCustodiaOrig > 0 then
            ParamByName('IDCUSTODIAORIG').AsInteger    := iIdHistCustodiaOrig;
         if iIdHistCustodiaDest > 0 then
            ParamByName('IDCUSTODIADEST').AsInteger    := iIdHistCustodiaDest;
         if iIdHistCartInvOrig > 0 then
            ParamByName('IDHISTCARTINVORIG').AsInteger := iIdHistCartInvOrig;
         if iIdHistCartInvDest > 0 then
            ParamByName('IDHISTCARTINVDEST').AsInteger := iIdHistCartInvDest;
         //AL_12 - 21/06/2005
         //AL_28 - O Tipo de Operação pode ser negativo
         if iTipoOperacao <> 0  then
            ParamByName('IDTIPOOPERACAO').AsInteger    := iTipoOperacao;
         // AL_13 - Fim
         ParamByName('IDCARTEIRAORIG').AsInteger    := iIdCarteiraOrig;
         ParamByName('IDCARTEIRADEST').AsInteger    := iIdCarteiraDest;
         ParamByName('DATAMOVCUSTOD').AsDateTime    := dtMovCustodia;
         ParamByName('IDINVESTIMENTO').AsInteger    := iIdInvestimento;
         ParamByName('IDLOTE').AsString             := sLote;
         ParamByName('IDCUSTODIANTEORIG').AsInteger := iIdCustodianteOrig;
         ParamByName('IDCUSTODIANTEDEST').AsInteger := iIdCustodianteDest;
         ParamByName('QUANTIDADE').AsFloat          := fQtd;
         ParamByName('IDMOTIVOBLOQORIG').AsInteger  := iIdMotBloqOrig;
         ParamByName('IDMOTIVOBLOQDEST').AsInteger  := iIdMotBloqDest;
         ParamByName('IDBOLETA').AsString           := sBoleta;
         //AL_23
         if iPlanPrev < 0 then
            iPlanPrev := iPlanPrevCtbPatro;
         ParamByName('IDPLANPREVCTBPATR').AsInteger := iPlanPrev;
         if iPlanPrevDest <> -1 then
            ParamByName('IDPLANPREVCTBDEST').AsInteger := iPlanPrevDest;
         ExecSQL;
      end;
      Result := True;
   except
      on E:Exception do
      begin
         MsgDlg('Não foi possível Gravar a Operação de Custódia :' + #13 +
                 E.Message,
                'Mensagem do Sistema', mtWarning,[MbOk],0);
         Result := False;
      end;
   end;
   //Ricardo Cristiano 28/11/2011 - SOL 169307 - Kintana 1501822
   dtmOperacaoInvest.qryInsOperCustodia.Close;   
end;

function TOperacaoInvest.AtualizaOperCustodia(idOperCustodia,iIdHistCustodiaOrig,iIdHistCustodiaDest,
                                              iIdHistCartInvOrig,iIdHistCartInvDest :integer): Boolean;
begin
   Result := True;
   try
      // Limpa a query correta
      OperComum.LimpaParametros(dtmOperacaoInvest.qryUpdOperCustodia);
      with dtmOperacaoInvest.qryUpdOperCustodia do
      begin
         //AL_23 - Melhoria de segurança
         ParamByName('IDOPERCUSTODIA').AsInteger    := idOperCustodia;
         if iIdHistCustodiaOrig > 0 then
            ParamByName('IDCUSTODIAORIG').AsInteger    := iIdHistCustodiaOrig;
         if iIdHistCustodiaDest > 0 then
            ParamByName('IDCUSTODIADEST').AsInteger    := iIdHistCustodiaDest;
         if iIdHistCartInvOrig > 0 then
         ParamByName('IDHISTCARTINVORIG').AsInteger := iIdHistCartInvOrig;
         if iIdHistCartInvDest > 0 then
            ParamByName('IDHISTCARTINVDEST').AsInteger := iIdHistCartInvDest;
         ExecSQL;
      end;
   except
      on E:Exception do
      begin
         MsgDlg('Erro ao Atualizar a Operação de Custódia com a Mensagem:' + #13 +
                 E.Message,
                'Mensagem do Sistema', MtError,[MbOk],0);
         Result := False;
      end;
   end;
end;

// AL_9
function TOperacaoInvest.ExcluiCustodia(sBoleta: String = '';
                                        iOperCustodia: Integer = -1;
                                        iOperacaoInvest: Integer = -1;
                                        bMostraMens: Boolean = False): Boolean;
var qryOperacoes, qryAuxiliar: TwwQuery;
begin
   try
      try
         qryOperacoes := TwwQuery.Create(Application);
         qryOperacoes.DatabaseName := 'BaseDados';
         qryAuxiliar := TwwQuery.Create(Application);
         qryAuxiliar.DatabaseName := 'BaseDados';

         qryOperacoes.SQL.Clear;
         qryOperacoes.SQL.Add('SELECT IDOPERCUSTODIA, IDCUSTODIAORIG, IDCUSTODIADEST ');
         qryOperacoes.SQL.Add('FROM OPERCUSTODIA ');
         if sBoleta <> '' then
            qryOperacoes.SQL.Add('WHERE IDBOLETA = ''' + sBoleta + ''' ')
         else if iOperCustodia > 0 then
            qryOperacoes.SQL.Add('WHERE IDOPERCUSTODIA = ' + IntToStr(iOperCustodia))
         else if iOperacaoInvest > 0 then
            qryOperacoes.SQL.Add('WHERE IDOPERCUSTODIA IN (SELECT IDOPERCUSTODIA ' + #13 +
                                 '                         FROM OPERACAOINVEST ' + #13 +
                                 '                         WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacaoInvest) + ')')
         else
         begin
            Result := False;
            Exit;
         end;
         qryOperacoes.Open;

         while not qryOperacoes.Eof do
         begin
            // Exclui os Históricos de Custódia
            qryAuxiliar.SQL.Clear;
            qryAuxiliar.SQL.Add('UPDATE OPERCUSTODIA ');
            qryAuxiliar.SQL.Add('SET IDCUSTODIAORIG = NULL, IDCUSTODIADEST = NULL ');
            qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryOperacoes.FieldByName('IDOPERCUSTODIA').AsString);
            qryAuxiliar.ExecSQL;
            if not qryOperacoes.FieldByName('IDCUSTODIAORIG').IsNull then
            begin
               qryAuxiliar.SQL.Clear;
               qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
               qryAuxiliar.SQL.Add('WHERE IDCUSTODIA = ' + qryOperacoes.FieldByName('IDCUSTODIAORIG').AsString);
               qryAuxiliar.ExecSQL;
            end;
            if not qryOperacoes.FieldByName('IDCUSTODIADEST').IsNull then
            begin
               qryAuxiliar.SQL.Clear;
               qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
               qryAuxiliar.SQL.Add('WHERE IDCUSTODIA = ' + qryOperacoes.FieldByName('IDCUSTODIADEST').AsString);
               qryAuxiliar.ExecSQL;
            end;
            if not qryOperacoes.FieldByName('IDOPERCUSTODIA').IsNull then
            begin
               qryAuxiliar.SQL.Clear;
               qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
               qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryOperacoes.FieldByName('IDOPERCUSTODIA').AsString);
               qryAuxiliar.ExecSQL;

               qryAuxiliar.SQL.Clear;
               qryAuxiliar.SQL.Add('UPDATE OPERACAOINVEST ');
               qryAuxiliar.SQL.Add('SET IDOPERCUSTODIA = NULL ');
               qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryOperacoes.FieldByName('IDOPERCUSTODIA').AsString);
               qryAuxiliar.ExecSQL;

               qryAuxiliar.SQL.Clear;
               qryAuxiliar.SQL.Add('DELETE FROM OPERCUSTODIA ');
               qryAuxiliar.SQL.Add('WHERE IDOPERCUSTODIA = ' + qryOperacoes.FieldByName('IDOPERCUSTODIA').AsString);
               qryAuxiliar.ExecSQL;

               if iOperacaoInvest > 0 then
               begin
                  qryAuxiliar.SQL.Clear;
                  qryAuxiliar.SQL.Add('DELETE FROM HISTCUSTODIA ');
                  qryAuxiliar.SQL.Add('WHERE IDOPERACAOINVEST = ' + IntToStr(iOperacaoInvest));
                  qryAuxiliar.ExecSQL;
               end;
            end;
            qryOperacoes.Next;
         end;
         Result := True;
      except
         on E:Exception do
         begin
            if bMostraMens then
               MsgDlg('Não foi possível excluir a custódia desta operação' + #13 +
                       E.Message,
                      'Mensagem do Sistema', MtError,[MbOk],0);
            Result := False;
         end;
      end;
   finally
      qryOperacoes.Free;
      qryAuxiliar.Free;
   end;
end;

end.
