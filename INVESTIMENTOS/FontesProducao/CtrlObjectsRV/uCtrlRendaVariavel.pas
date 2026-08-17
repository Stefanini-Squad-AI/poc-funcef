//******************************************************************************
// Rotina     : Executa( 
// SOL        : 107933
// Kintana    : 486332 
// Data       : 03/02/2009
// Responsável: Ricardo Cristiano
// Descrição  : Implementação para desconsiderar os registros de "Vencimento de
//               Subscrição"(-10114, -114)
//******************************************************************************
// Rotina     : AplicaAtualMarcaFlagReprocMenor
// SOL        : 92857
// Kintana    : 396741
// Data       : 07/08/2008
// Responsável: Ricardo Cristiano
// Descrição  : Implementação de ajustes para otimização do reprocessamento. 
//               Criada a rotina "AplicaAtualMarcaFlagReprocMenor".
//******************************************************************************
// Autor     : Marco Turon
// Data      : 28/05/2008
// Código    : AL_21
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Desenvolvimento do Empréstimo MT
//******************************************************************************
// Data	     : 28/05/2008
// Codigo    : AL_20
// Pendência : 24716
// SOL       : 55534
// Função    : Out of Memory
//******************************************************************************
// Data      : 03/09/2007
// Código    : AL_19
// Pendencia : 26219
// Motivo    : Implementações da Importação Arquivos Bovespa
//******************************************************************************
// Data      : 27/08/2007
// Código    : AL_18
// Pendencia : 26199
// Motivo    : Implementações da HistCartinv
//******************************************************************************
// Data      : 13/04/2007
// Código    : AL_17
// Desc      : Implementação do método de atualização de boletas genérico
//******************************************************************************
// Data      : 28/02/2007
// Código    : AL_16
// Pendencia : 24551
// SOL       : 47397
// Desc      : Implementação para que o saldo anterior e posterior,
//             quando existirem mais de uma conta, apareça a quantidade real.
//******************************************************************************
// Data      : 22/02/2007
// Código    : AL_15
// Pendencia : 24559
// SOL       : 54025
// Desc      : Permitir a seleção de Acoes com Saldo zerado
//******************************************************************************
// Data      : 28/11/2006
// Código    : AL_14
// Pendencia : 23891
// SOL       : 42459
// Desc      : Implementação da Liquidação Com Ações
//******************************************************************************
// Data      : 10/11/2006
// Código    : AL_13
// Pendencia : 23722
// Desc      : Ajuste na TRP
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_12
// Pendencia : 23346
// Desc      : Acerto no filtro de Investimento da ListOperTrcCCeCCI
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_11
// Pendencia : 23346
// Desc      : Transferencia de CC para CCI
//******************************************************************************
// Data      : 05/10/2006
// Código    : AL_10
// Pendencia : 22965
// Desc      : Ajuste na BuscaSldTRCPlanoSintetico para trazer valores negativos(PRO e PRP)
//******************************************************************************
// Data      : 25/09/2006
// Código    : AL_9
// Pendencia : 22965
// Desc      : Segregação de Planos
//******************************************************************************
// Data     : 22/08/2006
// Código   : AL_8
// Pendencia:
// Desc     : Implementação da ListBuscaSaldosRV, CdsOperacaoInvest, BuscaSldTRCPlanoAnalitico,
//            BuscaSldTRCPlanoSintetico, ListOperacaoInvest, AplicaAtualOperacaoInvest,
//            BuscaOperBoletaTRCPlano, ListOperTrcPlanos
//******************************************************************************
// Data     : 26/07/2006
// Código   : AL_7
// Desc     : Implementação da Provisão de Perda por Fluxo Percentual na BuscaSaldos
//******************************************************************************
// Data     : 31/05/2006
// Código   : AL_6
// Desc     : Implementação da gravação da Provisão de Perda de Renda Variável
//******************************************************************************
// Código   : AL_4
// Desc     : Implementação da gravação de Boleta em 3 camadas
//******************************************************************************
// Data     : 24/04/2006
// Código   : AL_3
// Desc     : Ajuste na query de busca de saldos de custódia, é preciso tb buscar
//            o maior saldo no mesmo dia com ID menor que o ID passado como parametro
//            Novo parametro no método Executa do objeto BuscaSaldos
//******************************************************************************
// Data     : 03/04/2006
// Código   : AL_2
// Pendencia: 21403
// SOL      : 39846
// Desc     : Implementação de Saldo CC/CCI na Histcustodia
//******************************************************************************
// Data     : 18/01/2006
// Codigo   : AL_1
// Pendencia:
// SOL      :
// Descr.   : Implementação da BuscaSaldos em 3 camadas
//******************************************************************************
unit uCtrlRendaVariavel;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uDbBolsavalores, uCtrlPadroes, uDBBoleta, uDBProvPerdaRV, uCMFileUtils,
     //AL_8
     uDbOperacaoinvest,
     //AL_18
     uDbHistcartinv,
     //AL_19
     uDbCotacaoacao,
     //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
     uDbOperDirTransf
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
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
   End;

//***************************************************************************
//  > BUSCA SALDOS
//*****************************************************************************

   TBuscaSaldoRV = Class(TCtrlPersistentObject)
   private
      FIdHistCartInv: Integer;
      FSldQtdCustodiaCCI: Double;
      FSaldoIRApurado: Double;
      FSaldoIOFApurado: Double;
      FSaldoIOFProv: Double;
      FSaldoVariacao: Double;
      FSldQtdCustodiaCC: Double;
      FSaldoCusto: Double;
      FSaldoQtdTotal: Double;
      FSldQtdCCI: Double;
      FSaldoVlrTotal: Double;
      FSldQtdCC: Double;
      FSaldoIRProv: Double;
      FDataSaldo: TDateTime;
      FSldQtdLibCustodia: Double;
      FSldQtdBloqCustodia: Double;
      //AL_7
      FSldProvPerda: Double;
      procedure SetIdHistCartInv(const Value: Integer);
      procedure SetDataSaldo(const Value: TDateTime);
      procedure SetSaldoCusto(const Value: Double);
      procedure SetSaldoIOFApurado(const Value: Double);
      procedure SetSaldoIOFProv(const Value: Double);
      procedure SetSaldoIRApurado(const Value: Double);
      procedure SetSaldoIRProv(const Value: Double);
      procedure SetSaldoQtdTotal(const Value: Double);
      procedure SetSaldoVariacao(const Value: Double);
      procedure SetSaldoVlrTotal(const Value: Double);
      procedure SetSldQtdCC(const Value: Double);
      procedure SetSldQtdCCI(const Value: Double);
      //AL_7
      procedure SetSldProvPerda(const Value: Double);
      procedure SetSldQtdCustodiaCC(const Value: Double);
      procedure SetSldQtdCustodiaCCI(const Value: Double);
      procedure SetSldQtdBloqCustodia(const Value: Double);
      procedure SetSldQtdLibCustodia(const Value: Double);

   public
      Constructor Create(Aowner: TCmControlObject); Override;
      Destructor Destroy; Override;

      // AL_3
      //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
      function Executa(dDataRef: TDateTime;
                       iPlanPrev, iInvestimento, iCarteira: Integer;
                       iCarteiraGerenc: Integer = -1;
                       iHistCartInv: Integer = high(integer);
                       iCustodiante: integer = -1;
                       sLote: String = '';
                       iMotivoBloqueio: Integer = -1;
                       iHistCustodia: Integer = high(integer);
                       iTipoConta : Integer = 0;
                       iTipoOper : Integer = 0): Boolean;

      property IdHistCartInv : Integer     read FIdHistCartInv      write SetIdHistCartInv;       // IDHISTCARTINV
      property DataSaldo : TDateTime       read FDataSaldo          write SetDataSaldo;           // DATAMOVCARTINV,
      property SaldoQtdTotal : Double      read FSaldoQtdTotal      write SetSaldoQtdTotal;       // SALDOQTDEINVCART
      property SaldoVlrTotal : Double      read FSaldoVlrTotal      write SetSaldoVlrTotal;       // SALDOVLRINVCART
      property SaldoCusto : Double         read FSaldoCusto         write SetSaldoCusto;          // SALDOAQUI,
      property SaldoVariacao : Double      read FSaldoVariacao      write SetSaldoVariacao;       // SALDOVARIACAO,
      property SaldoIRProv : Double        read FSaldoIRProv        write SetSaldoIRProv;         // SALDOIRPROV,
      property SaldoIRApurado : Double     read FSaldoIRApurado     write SetSaldoIRApurado;      // SALDOIRAPU,
      property SaldoIOFProv : Double       read FSaldoIOFProv       write SetSaldoIOFProv;        // SALDOIOFPROV,
      property SaldoIOFApurado : Double    read FSaldoIOFApurado    write SetSaldoIOFApurado;     // SALDOIOFAPU,
      property SaldoQtdCC : Double         read FSldQtdCC           write SetSldQtdCC;            // SALDOQTDECPMF
      property SaldoQtdCCI : Double        read FSldQtdCCI          write SetSldQtdCCI;           // SALDOQTDEINVCART - SALDOQTDECPMF
      //AL_7
      property SaldoProvPerda : Double     read FSldProvPerda       write SetSldProvPerda;        // SALDOPROVPERDA
      property SldQtdCustodiaCC : Double   read FSldQtdCustodiaCC   write SetSldQtdCustodiaCC;
      property SldQtdCustodiaCCI : Double  read FSldQtdCustodiaCCI  write SetSldQtdCustodiaCCI;
      property SldQtdLibCustodia  : Double read FSldQtdLibCustodia  write SetSldQtdLibCustodia;
      property SldQtdBloqCustodia : Double read FSldQtdBloqCustodia write SetSldQtdBloqCustodia;

   protected

   end;

  {*****************************************************************************
    > RENDA VARIAVEL
  *****************************************************************************}
   TCtrlRendaVariavel = Class(TCmControlObject)
   private

       FBuscaSaldoRV: TBuscaSaldoRV;
       // AL_4
       FCdsBoleta: TClientDataSet;
       FDbBoleta: TDbBoleta;
       // AL_6
       FCdsProvPerda: TClientDataSet;
       FDbProvPerda: TDbProvPerdaRV;
       // AL_8
       FCdsOperacaoInvest: TClientDataSet;
       FDbOperacaoInvest: TDbOperacaoInvest;
       FIdOperacaoInvest: Integer;

       // AL_18
       FCdsHistCartinv : TClientDataSet;
       FDbHistCartinv : TDbHistCartinv;
       FIdHistCartinv : Integer;

       // AL_19
       FCdsCotacaoAcao : TClientDataSet;
       FDbCotacaoAcao : TDbCotacaoAcao;
      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
       FCdsOperDirTransf: TClientDataSet;
       FDbOperDirTransf : TDbOperDirTransf;
       FIdOperDirTransf : Integer;

       procedure SetBuscaSaldoRV(const Value: TBuscaSaldoRV);

       // AL_4
       procedure SetCdsBoleta(const Value: TClientDataSet);
       procedure SetDbBoleta(const Value: TDbBoleta);
       // AL_6
       procedure SetCdsProvPerda(const Value: TClientDataSet);
       procedure SetDbProvPerda(const Value: TDbProvPerdaRV);
       procedure SetCdsOperacaoInvest(const Value: TClientDataSet);
       procedure SetDbOperacaoInvest(const Value: TDbOperacaoInvest);
       procedure SetIdOperacaoInvest(const Value: Integer);
       //AL_18
       procedure SetCdsHistCartinv(const Value: TClientDataSet);
       procedure SetDbHistCartinv(const Value: TDbHistCartinv);
       procedure SetIdHistCartinv(const Value: Integer);
       //AL_19
       procedure SetCdsCotacaoAcao(const Value: TClientDataSet);
       procedure SetDbCotacaoAcao(const Value: TDbCotacaoAcao);

       //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
       procedure SetCdsOperDirTransf(const Value: TClientDataSet);
       procedure SetDbOperDirTransf(const Value: TDbOperDirTransf);
       procedure SetIdOperDirTransf(const Value: Integer);
       
   public

      constructor Create; override;
      destructor Destroy; override;

      // AL_6
      property CdsProvPerda : TClientDataSet read FCdsProvPerda write SetCdsProvPerda;
      property DbProvPerda  : TDbProvPerdaRV read FDbProvPerda write SetDbProvPerda;

      // AL_4
      property CdsBoleta : TClientDataSet read FCdsBoleta write SetCdsBoleta;
      property DbBoleta  : TDbBoleta read FDbBoleta write SetDbBoleta;

      // AL_8
      property CdsOperacaoInvest : TClientDataSet read FCdsOperacaoInvest write SetCdsOperacaoInvest;
      property DbOperacaoInvest  : TDbOperacaoInvest read FDbOperacaoInvest write SetDbOperacaoInvest;
      property IdOperacaoInvest  : Integer read FIdOperacaoInvest write SetIdOperacaoInvest;

      // AL_18
      property CdsHistCartinv : TClientDataSet read FCdsHistCartinv write SetCdsHistCartinv;
      property DbHistCartinv  : TDbHistCartinv read FDbHistCartinv write SetDbHistCartinv;
      property IdHistCartinv  : Integer read FIdHistCartinv write SetIdHistCartinv;

      // AL_19
      property CdsCotacaoAcao : TClientDataSet read FCdsCotacaoAcao write SetCdsCotacaoAcao;
      property DbCotacaoAcao  : TDbCotacaoAcao read FDbCotacaoAcao write SetDbCotacaoAcao;

      property BuscaSaldoRV: TBuscaSaldoRV read FBuscaSaldoRV write SetBuscaSaldoRV;

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
      property CdsOperDirTransf : TClientDataSet read FCdsOperDirTransf write SetCdsOperDirTransf;
      property DbOperDirTransf  : TDbOperDirTransf read FDbOperDirTransf write SetDbOperDirTransf;
      property IdOperDirTransf  : Integer read FIdOperDirTransf write SetIdOperDirTransf;

      procedure OnCreateAppServer; override;

      function ListCarteiraRenVar(iIdCarteiraInvest : Integer = -1): OleVariant;
      function ListInvestimentoRenVar(iIdInvestimento : Integer = -1): OleVariant;
      function ListBolsaValores(iIdBolsaValor : Integer = -1): OleVariant;
      function ListTipoOperRenVar(sIdTipoOper: String = ''): OleVariant;
      // AL_4
      function ListBoleta(sBoleta: String = ''): OleVariant;
      function AplicaAtualBoleta: Boolean;
      //AL_17
      function UpdateBoleta(sBoleta: String; const Campos, Valores: array of string): Boolean;
      // AL_6
      function ListProvPerda(iInvestimento: Integer = -1;
                             dDataVigencia: TDateTime = 0;
                             bMaior: Boolean = False): OleVariant;
      //AL_8
      function AplicaAtualProvPerda: Boolean;

      //AL_8
      function BuscaSldTRCPlanoAnalitico(dDataRef: TDateTime;
                                         iInvestimento : Integer = -1;
                                         iPlanPrev : Integer = -1;
                                         iCarteira : Integer = -1) : OleVariant;
      //AL_8
      function BuscaSldTRCPlanoSintetico(dDataRef: TDateTime;
                                         iInvestimento : Integer = -1;
                                         iPlanPrev : Integer = -1;
                                         iCarteira : Integer = -1) : OleVariant;

      //AL_18
      function ListHistCartinv(iIdHistCartinv :Integer = -1;
                               iTipoOperacao : Integer = -1;
                               iInvestimento : Integer = -1;
                               iCarteiraInvest : Integer = -1;
                               iPlanPrev : Integer = -1;
                               dDataMovCartinv : TDateTime = 0;
                               sSinalData : String = '=';
                               sTipoMovCart : String = ''): OleVariant;

      //AL_19
      function ListCotacaoAcao(iIdAcao :Integer = -1;
                               iIdEmissor : Integer = -1;
                               iIdBolsa : Integer = -1;
                               dDataCotacao : TDateTime = 0): OleVariant;
      //AL_21
      function ListCotacaoInvest(dDataCotacao: TDateTime; iInvestimento: Integer): OleVariant;

      //AL_19
      function ListAcoesXBolsa(iIdAcao :Integer = -1;
                               iIdEmissor : Integer = -1;
                               iIdBolsa : Integer = -1;
                               sCodAcao : String = ''): OleVariant;

      //AL_8
      function ListOperacaoInvest(iOperacaoInvest :Integer = -1;
                                  iTipoOperacao : Integer = -1;
                                  iInvestimento : Integer = -1;
                                  dDataOperacao: TDateTime = 0): OleVariant;

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                            
      function ListOperDirTransf(iOperDirTransf   : Integer = -1;
                                 iOperacaoDireito : Integer = -1;
                                 iTipoOperacao    : Integer = 0;
                                 iInvestimento    : Integer = -1;
                                 dDataOperacao    : TDateTime = 0): OleVariant;

      Function ListOperTrcPlanosDireitos(dDataIni: TDateTime = 0;
         dDataFim: TDateTime = 0;
         iTipoOperacao: Integer = -1;
         iCarteira: Integer = -1;
         iPlanPrevOrig: Integer = -1): OleVariant;

      //AL_18
      function AplicaAtualHistCartInv : boolean;

      //AL_19
      function AplicaAtualCotacaoAcao : boolean;

      //AL_8
      //AL_14
      function AplicaAtualOperacaoInvest(dDataoperacao      : TDateTime = 0;
                                         dInipagto          : TDateTime = 0;
                                         dDatavencoper      : TDateTime = 0;
                                         dDataliqoper       : TDateTime = 0;
                                         dDataex            : TDateTime = 0;
                                         dDatacom           : TDateTime = 0;
                                         dDataage           : TDateTime = 0;
                                         iIdtipooperacao    : Integer = 0;
                                         iIdtipoinvest      : Integer = -1;
                                         iIdplanprevctbpatr : Integer = -1;
                                         iIdopercustodia    : Integer = -1;
                                         iIdmotivobloqueio  : Integer = 0;
                                         iIdmodulo          : Integer = -1;
                                         iIdinvestimento    : Integer = -1;
                                         iIdforcli          : Integer = -1;
                                         iIdcustodiante     : Integer = -1;
                                         Idcorretvalores    : Integer = -1;
                                         iIdcarteirainvest  : Integer = -1;
                                         iIdcarteiragerenc  : Integer = -1;
                                         iCoddocumento      : Integer = -1;
                                         iIdoperacaoorigem  : Integer = -1;
                                         iIdoperacaodireito : Integer = -1;
                                         iMoecodigo         : Integer = -1;
                                         iInvorigem         : Integer = -1;
                                         iIdterceiro        : Integer = -1;
                                         iIdordmovinv       : Integer = -1;
                                         iEmpresaprop       : Integer = -1;
                                         iCodfinanceiro     : Integer = -1;
                                         fVlroperacao       : Double = 0;
                                         fPrecounitoperacao : Double = 0;
                                         fQtdeoperacao      : Double = 0;
                                         fPercentual        : Double = 0;
                                         fVlrremuneracao    : Double = 0;
                                         fVlroperacaoom     : Double = 0;
                                         fVlrirremuner      : Double = 0;
                                         fVlrir             : Double = 0;
                                         fVlrcustoatual     : Double = 0;
                                         fDivporacao        : Double = 0;
                                         sOrigdest          : String = '';
                                         sObservacao        : String = '';
                                         sNumdocumento      : String = '';
                                         sIdlote            : String = '';
                                         sFlgstatusordmov   : String = '';
                                         sFlgstatusfechbol  : String = '';
                                         sFlgcustodia       : String = '';
                                         dPrzempresa        : TDateTime = 0;
                                         dPrzbolsa          : TDateTime = 0;
                                         dAtadecisao        : TDateTime = 0;
                                         iIdinvestdest      : Integer = -1;
                                         iIdinstfin         : Integer = -1;
                                         iIdcustorig        : Integer = -1;
                                         iIdcustdest        : Integer = -1;
                                         iIdcartoridest     : Integer = -1;
                                         iIdcontratoimovel  : Integer = -1;
                                         fVlrvariacaoatual  : Double = 0;
                                         fPumercado         : Double = 0;
                                         fParidade          : Double = 0;
                                         sJuroscap          : String = '';
                                         sFormapagrec       : String = '';
                                         iIdOperContAcoes   : Integer = -1): Boolean;

      //Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
      function AplicaAtualMarcaFlagReprocMenor(dDataRef, dDataAno : TDateTime;
                                               var iRegAff : Integer;
                                               iICarteiraInvest : Integer = -1;
                                               iIdPlanPrevCtbPatro : Integer = -1;
                                               iInvestimento : Integer = -1) : Boolean;

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                                               
      function AplicaAtualOperDirTransf(dDatavencorig      : TDateTime = 0;
                                        dDataoperacao      : TDateTime = 0;
                                        iIdtipooperacao     : Integer = 0;
                                        iIdtipoinvest      : Integer = -1;
                                        iIdplanprevctbpatrorig : Integer = -1;
                                        iIdplanprevctbpatrdest : Integer = -1;
                                        iIdoperacaodireito : Integer = -1;
                                        iIdinvestorig      : Integer = -1;
                                        iIdtipooperdest    : Integer = 0;                                        
                                        iIdtipooperorig    : Integer = 0;
                                        iIdmotivobloqorig  : Integer = 0;
                                        iIdforcliorig      : Integer = -1;
                                        iIdcustodiaorig    : Integer = -1;
                                        iIdcartinvestorig  : Integer = -1;
                                        iIdoperinvestorig  : Integer = -1;
                                        iIdoperinvestdest   : Integer = -1;
                                        fVlroperacao       : Double = 0;
                                        fQtdeoperacao      : Double = 0;
                                        fPuorigem          : Double = 0;
                                        fPercentual        : Double = 0;
                                        sIdboleta          : String = '';
                                        sObservacao        : String = '') : boolean;
      //AL_8
      function BuscaOperBoletaTRCPlano(sBoleta : String;
                                       iOperacao : Integer = -1) : OleVariant;

      //AL_8
      function ListOperTrcPlanos(dDataAnt: TDateTime = 0;
                                 dDataFim : TDateTime = 0;
                                 iInvestimento : Integer = -1;
                                 iCarteira : Integer = -1;
                                 iPlanPrevOrig  : Integer = -1) : OleVariant;

      //AL_11
      function ListSaldosCarteirasRV(dDataRef: TDateTime;
                                     iCarteira : Integer = -1;
                                     iCarteiraGerenc: Integer = -1;
                                     iPlanPrev : Integer = -1;
                                     iInvestimento : Integer = -1;
                                     iHistCartInv: Integer = high(integer);
                                     sLote: String = '') : OleVariant;

      //AL_11
      function BuscaSldTRCCCeCCISintetico(dDataRef: TDateTime;
                                          iCarteira : Integer = -1;
                                          iPlanPrev : Integer = -1;
                                          iTipoOperacao : Integer = -1;
                                          iInvestimento : Integer = -1) : OleVariant;

      //AL_11
      function BuscaSldTRCCCeCCIAnalitico(dDataRef: TDateTime;
                                          iInvestimento : Integer = -1;
                                          iPlanPrev : Integer = -1;
                                          iCarteira : Integer = -1) : OleVariant;

      //AL_11
      function BuscaOperBoletaTRCCCeCCI(sBoleta : String) : OleVariant;

      //AL_11
      function ListOperTrcCCeCCI(dDataIni : TDateTime = 0;
                                 dDataFim : TDateTime = 0;
                                 iInvestimento : Integer = -1;
                                 iCarteira : Integer = -1;
                                 iPlanPrev : Integer = -1;
                                 iTipoOper : Integer = -1) : OleVariant;

      //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509                                 
      function BuscaDirTRCPlanoSintetico(dDataRef  : TDateTime;
                                         iTipoOper : Integer = -1;
                                         iPlanPrev : Integer = -1;
                                         iCarteira : Integer = -1;
                                         sTipoDir  : String  = ''): OleVariant;



   protected
      procedure DoChangeDataBase; override;

   end;

implementation

{TCtrlRendaVariavel}

constructor TCtrlRendaVariavel.Create;
begin
   inherited;
   FBuscaSaldoRV := TBuscaSaldoRV.Create(Self);
   // AL_4
   FDbBoleta := TDbBoleta.Create(Self);
   // AL_6
   FDbProvPerda := TDbProvPerdaRV.Create(Self);
   //AL_8
   FDbOperacaoInvest := TDbOperacaoInvest.Create(Self);
   //AL_18
   FDbHistCartinv := TDbHistcartinv.Create(Self);
   //AL_19
   FDbCotacaoAcao := TDbCotacaoAcao.Create(Self);
   //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
   FDbOperDirTransf := TDbOperDirTransf.Create(Self);
end;

destructor TCtrlRendaVariavel.Destroy;
begin
   FreeAndNil(FBuscaSaldoRV);
   // AL_4
   FreeAndNil(FDbBoleta);
   if IsAppServer then FreeAndNil(FCdsBoleta);
   // AL_6
   FreeAndNil(FDbProvPerda);
   FreeAndNil(FCdsProvPerda);
   //AL_8
   FreeAndNil(FDbOperacaoInvest);
   //AL_18
   FreeAndNil(FDbHistCartinv);
   //AL_19
   FreeAndNil(FDbCotacaoAcao);
   //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
   FreeAndNil(FDbOperDirTransf);
   inherited;
end;

procedure TCtrlRendaVariavel.OnCreateAppServer;
begin
   inherited;
   // AL_4
   FCdsBoleta := TClientDataSet.Create(nil);
   // AL_6
   FCdsProvPerda := TClientDataSet.Create(nil);
   // AL_8
   FCdsOperacaoInvest := TClientDataSet.Create(nil);
   // AL_18
   FCdsHistCartinv := TClientDataSet.Create(nil);
   // AL_19
   FCdsCotacaoAcao := TClientDataSet.Create(nil);
   //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
   FCdsOperDirTransf := TClientDataSet.Create(nil);
end;

procedure TCtrlRendaVariavel.DoChangeDataBase;
begin
   inherited;
   BuscaSaldoRV.DataBaseName := DataBaseName;
   // AL_4
   FDbBoleta.DataBaseName   := DataBaseName;
   // AL_6
   FDbProvPerda.DataBaseName   := DataBaseName;
   // AL_8
   FDbOperacaoInvest.DataBaseName   := DataBaseName;
   // AL_18
   FDbHistCartinv.DataBaseName   := DataBaseName;
   // AL_19
   FDbCotacaoAcao.DataBaseName   := DataBaseName;
   //Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
   FDbOperDirTransf.DataBaseName := DataBaseName;
end;

function TCtrlRendaVariavel.ListCarteiraRenVar(iIdCarteiraInvest: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                            ';
   sSql := sSql + '   IDTIPOINVEST, IDPLANOPREV, IDPATROCINADORA, IDMERCADO,         ';
   sSql := sSql + '   IDGESTORCARTEIRA, IDDAIEACART, IDCARTEIRAINVEST, FLGTRATALOTE, ';
   sSql := sSql + '   FLGORDMOVINV, FLGCARTTERC, FLGCARTPROP, FLGCARTLASTRO,         ';
   sSql := sSql + '   FLGCALCDIARIO, DESCCARTINVEST, DATAULTFECH, DATAINICIO         ';
   sSql := sSql + 'FROM CARTEIRAINVEST                                               ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 2                                            ';
   if iIdCarteiraInvest <> -1 then
      sSql := sSql + 'AND IDCARTEIRAINVEST = ' + IntToStr(iIdCarteiraInvest);
   sSql := sSql + 'ORDER BY DESCCARTINVEST ';
   Result := GetDataPacket(sSql);
end;

function TCtrlRendaVariavel.ListInvestimentoRenVar(iIdInvestimento: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                          ';
   sSql := sSql + '   IDINVESTIMENTO, DESCINVESTIMENTO, STAOPCAO, OBSINVESTIMENTO, ';
   sSql := sSql + '   IDTIPOINVEST, IDMOEDACONTAB, IDINVESTPRP, IDEMISSOR,         ';
   sSql := sSql + '   IDCLASSETIT, IDCARTEIRASPC, FLGRFXANTIGO, FLGREPACTUA,       ';
   sSql := sSql + '   FLGINVESTPRP, FLGATIVO, DESCCLASSINVEST, CODISIN, CARENCIA   ';
   sSql := sSql + 'FROM INVESTIMENTO                                               ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 2                                          ';
   if iIdInvestimento <> -1 then
      sSql := sSql + 'AND IDINVESTIMENTO = ' + IntToStr(iIdInvestimento);
   sSql := sSql + 'ORDER BY DESCINVESTIMENTO ';
   Result := GetDataPacket(sSql);
end;

function TCtrlRendaVariavel.ListBolsaValores(iIdBolsaValor: Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                       ';
   sSql := sSql + '   SGLBOLSAVALORES, MOECODIGO, IDCUSTODIANTE, IDBOLSAVALORES ';
   sSql := sSql + 'FROM BOLSAVALORES                                            ';
   if iIdBolsaValor <> -1 then
      sSql := sSql + 'WHERE IDBOLSAVALORES = ' + IntToStr(iIdBolsaValor);
   sSql := sSql + 'ORDER BY SGLBOLSAVALORES ';
   Result := GetDataPacket(sSql);
end;

function TCtrlRendaVariavel.ListTipoOperRenVar(sIdTipoOper: String = ''): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                              ';
   sSql := sSql + '   IDTIPOOPERACAO, DESCTIPOOPERACAO, VENCIMENTO, TIPSALDOCARTORIG,  ';
   sSql := sSql + '   TIPSALDOCARTDEST, TIPOMOVTO, TIPOCUSTODIA, TIPCREDOR,            ';
   sSql := sSql + '   STAATIVO, SIGLATIPOOPER, RECPAG, NATUREZAOPERACAO,               ';
   sSql := sSql + '   MOTBLOQCARTORIG, MOTBLOQCARTDEST, IDTIPOINVEST, IDMOTIVOBLOQUEIO,';
   sSql := sSql + '   IDMERCADO, FLGTRATAIR, FLGTRANSF, FLGRENTABILIDADE,              ';
   sSql := sSql + '   FLGPRZEMP, FLGPRZBOLSA, FLGPERC, FLGPARIDADE,                    ';
   sSql := sSql + '   FLGORDMOVINV, FLGOPGERENC, FLGOPDIREITO, FLGMOVCOTA,             ';
   sSql := sSql + '   FLGJUROS, FLGISENTOIR, FLGINVORIGEM, FLGINIPAG,                  ';
   sSql := sSql + '   FLGGRAVAIRLITIGIO, FLGGERACONTAB, FLGGERACAPCAR, FLGGERACAF,     ';
   sSql := sSql + '   FLGFORMAPAGREC, FLGDIVACAO, FLGDATAVENCIMENTO, FLGDATAEX,        ';
   sSql := sSql + '   FLGDATACOM, FLGCOTARECDES, FLGCORRET, FLGCONTAINVEST,            ';
   sSql := sSql + '   FLGATADEC, FLGAGE, CODTIPDOC                                     ';
   sSql := sSql + 'FROM TIPOOPERACAO                                                   ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 2                                              ';
   if sIdTipoOper <> ''  then
      sSql := sSql + 'AND IDTIPOOPERACAO IN (' + sIdTipoOper +')';
   sSql := sSql + 'ORDER BY DESCTIPOOPERACAO ';
   Result := GetDataPacket(sSql);
End;


Function TCtrlRendaVariavel.ListOperTrcPlanosDireitos(dDataIni: TDateTime = 0;
   dDataFim: TDateTime = 0;
   iTipoOperacao: Integer = -1;
   iCarteira: Integer = -1;
   iPlanPrevOrig: Integer = -1): OleVariant;
Var
   sSql: String;
Begin
   sSql := '';

   sSql := 'SELECT DISTINCT OT.IDOPERACAODIREITO, IV.DESCINVESTIMENTO, OT.PERCENTUAL AS PERCENTUAL,' + #13 +

       'O.QTDEOPERACAO AS QUANTIDADEANTERIORDAORIGEM, --VALORES ORIGEM    ' + #13 +
       'O.VLROPERACAO  AS VALORANTERIORDAORIGEM,  ' + #13 +
       'O.DATAOPERACAO AS DATADAOPERACAO, ' + #13 +
       'O.NUMDOCUMENTO AS BOLETA, --VALORES ORIGEM  ' + #13 +

       'OT.IDBOLETA, --VALORES DA TRANSFERENCIA ' + #13 +
       'OT.DATAOPERACAO AS DATATRANSF, ' + #13 +
       'OT.VLRREMUNERACAO AS VALORREMUNERACAO,' + #13 +
       'OT.QTDEOPERACAO AS QTDTRANSF,  ' + #13 +
       'OT.VLROPERACAO AS VLRTRANSF,--VALORES DA TRANSFERENCIA ' + #13 +

       'OIATUALORIG.QTDEOPERACAO AS QTDATUALORIG, --VALORES ATUALIZADOS ORIGEM  ' + #13 +
       'OIATUALORIG.VLROPERACAO  VLRATUALORIG, ' + #13 +

       'DESTINO.QTDEOPERACAO AS QTDDEST, --VALORES DO DESTINO  ' + #13 +
       'DESTINO.VLROPERACAO  AS VLRDEST,  OIATUALDEST.VLROPERACAO as VALORATUALDESTINO, ' + #13 +
       'DESTINO.DATAOPERACAO AS DATADESTINO, ' + #13 +
       'DESTINO.NUMDOCUMENTO AS BOLETATRANSF,--VALORES DO DESTINO ' + #13 +

       'CI.DESCCARTINVEST      AS DESCCARTINVESTGRD, --DADOS PARA A GRID  ' + #13 +
       'CI.DESCCARTINVEST      AS DESCCARTINVESTGRD, ' + #13 +
       'TP.DESCTIPOOPERACAO    AS DESCTIPOOPERACAOGRD,  ' + #13 +
       'PLO.PLANPRVCONTABPATRO AS PLANOORIGEMGRD, ' + #13 +
       'OT.PUORIGEM AS PU, OT.PERCENTUAL AS PERCENTUAL,  ' + #13 +
       'PLD.PLANPRVCONTABPATRO AS PLANODESTINOGRD --DADOS PARA A GRID ' + #13 +

  'FROM OPERDIRTRANSF     OT, ' + #13 +
       'INVESTIMENTO      IV, ' + #13 +
       'OPERACAOINVEST    O,   ' + #13 +
       'OPERACAODIREITO   OD,   ' + #13 +
       'CARTEIRAINVEST    CI, ' + #13 +
       'VWPLANPREVCTBPATR PLO,  ' + #13 +
       'VWPLANPREVCTBPATR PLD, ' + #13 +
       'TIPOOPERACAO      TP,   ' + #13 +

       '(SELECT OT.IDOPERACAODIREITO, -- INCIO QRY DE DESTINO  ' + #13 +
               'D.QTDEOPERACAO,    ' + #13 +
               'D.VLROPERACAO, ' + #13 +
               'D.DATAOPERACAO, ' + #13 +
               'D.NUMDOCUMENTO, ' + #13 +
               'D.IDPLANPREVCTBPATR, ' + #13 +
               'D.IDMOTIVOBLOQUEIO,   ' + #13 +
               'D.IDCARTEIRAINVEST,' + #13 +
               'D.IDINVESTIMENTO,  ' + #13 +
               'D.IDCUSTODIANTE ' + #13 +

          'FROM OPERDIRTRANSF OT, OPERACAOINVEST D ' + #13 +
         'WHERE OT.IDOPERACAODIREITO = D.IDOPERACAODIREITO  ' + #13 +
           'AND OT.IDPLANPREVCTBPATRDEST = D.IDPLANPREVCTBPATR ' + #13 +
           'AND OT.IDCARTINVESTORIG = D.IDCARTEIRAINVEST ' + #13 +
           'AND OT.IDINVESTORIG = D.IDINVESTIMENTO  ' + #13 +
           'AND OT.IDCUSTODIAORIG = D.IDCUSTODIANTE ' + #13 +
           'AND OT.IDMOTIVOBLOQORIG = D.IDMOTIVOBLOQUEIO  ' + #13 +
           'AND D.DATAOPERACAO < OT.DATAOPERACAO) DESTINO, --FIM QRY DE DESTINO ' + #13 +

       '(SELECT  * --INCIO QRY VALORES ATUAIS DA ORIGEM ' + #13 +
          'FROM OPERACAOINVEST OI  ' + #13 +
         'WHERE OI.IDOPERACAOINVEST IN  ' + #13 +
               '(SELECT DISTINCT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST ' + #13 +
                  'FROM OPERACAOINVEST OI1     ' + #13 +
                 'WHERE OI1.IDOPERACAODIREITO IS NOT NULL ' + #13 +
                   'AND OI1.IDTIPOOPERACAO IN (-70, -10070) ' + #13 +
                 'GROUP BY OI1.IDOPERACAODIREITO,' + #13 +
                          'OI1.IDPLANPREVCTBPATR,  ' + #13 +
                          'OI1.IDCARTEIRAINVEST)) OIATUALORIG, --FIM QRY VALORES ATUAIS DA ORIGEM ' + #13 +

       '(SELECT  * --INCIO QRY VALORES ATUAIS DA DESTINO ' + #13 +
        '  FROM OPERACAOINVEST OI  ' + #13 +
        ' WHERE OI.IDOPERACAOINVEST IN  ' + #13 +
               '(SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOINVEST ' + #13 +
                  'FROM OPERACAOINVEST OI1  ' + #13 +
                 'WHERE OI1.IDOPERACAODIREITO IS NOT NULL  ' + #13 +
                   'AND OI1.IDTIPOOPERACAO IN (-70, -10070) ' + #13 +
                 'GROUP BY OI1.IDOPERACAODIREITO, ' + #13 +
                          'OI1.IDPLANPREVCTBPATR,  ' + #13 +
                          'OI1.IDCARTEIRAINVEST)) OIATUALDEST --FIM QRY VALORES ATUAIS DA DESTINO ' + #13 +

 'WHERE OT.IDOPERACAODIREITO = O.IDOPERACAODIREITO --JOINS OPERACAO DE TRANSFERENCIA COM ORIGEM ' + #13 +
   'AND OT.IDPLANPREVCTBPATRORIG = O.IDPLANPREVCTBPATR  ' + #13 +
   'AND OT.IDCARTINVESTORIG = O.IDCARTEIRAINVEST  ' + #13 +
   'AND OT.IDINVESTORIG = O.IDINVESTIMENTO  ' + #13 +
   'AND OT.IDCUSTODIAORIG = O.IDCUSTODIANTE ' + #13 +
   'AND OT.IDMOTIVOBLOQORIG = O.IDMOTIVOBLOQUEIO  ' + #13 +
   'AND O.DATAOPERACAO < OT.DATAOPERACAO  ' + #13 +

   'AND OT.IDOPERACAODIREITO = DESTINO.IDOPERACAODIREITO --JOINS OPERACAO TRANSFERENCIA COM DESTINO ' + #13 +
   'AND OT.IDPLANPREVCTBPATRDEST = DESTINO.IDPLANPREVCTBPATR ' + #13 +
   'AND OT.IDCARTINVESTORIG = DESTINO.IDCARTEIRAINVEST  ' + #13 +
   'AND OT.IDINVESTORIG = DESTINO.IDINVESTIMENTO ' + #13 +
   'AND OT.IDCUSTODIAORIG = DESTINO.IDCUSTODIANTE  ' + #13 +
   'AND OT.IDMOTIVOBLOQORIG = DESTINO.IDMOTIVOBLOQUEIO ' + #13 +

   'AND OIATUALDEST.IDOPERACAODIREITO = O.IDOPERACAODIREITO --JOINS SALDO ATUAL DESTINO ' + #13 +
   'AND OIATUALDEST.IDPLANPREVCTBPATR = O.IDPLANPREVCTBPATR ' + #13 +
   'AND OIATUALDEST.IDCARTEIRAINVEST = O.IDCARTEIRAINVEST  ' + #13 +
   'AND OIATUALDEST.IDINVESTIMENTO = O.IDINVESTIMENTO   ' + #13 +
   'AND OIATUALDEST.IDCUSTODIANTE = O.IDCUSTODIANTE    ' + #13 +
   'AND OIATUALDEST.IDMOTIVOBLOQUEIO = O.IDMOTIVOBLOQUEIO  ' + #13 +

   'AND OIATUALORIG.IDOPERACAODIREITO = DESTINO.IDOPERACAODIREITO --JOINS SALDO ATUAL ORIGEM ' + #13 +
   'AND OIATUALORIG.IDPLANPREVCTBPATR = DESTINO.IDPLANPREVCTBPATR ' + #13 +
   'AND OIATUALORIG.IDCARTEIRAINVEST = DESTINO.IDCARTEIRAINVEST ' + #13 +
   'AND OIATUALORIG.IDINVESTIMENTO = DESTINO.IDINVESTIMENTO   ' + #13 +
   'AND OIATUALORIG.IDCUSTODIANTE = DESTINO.IDCUSTODIANTE  ' + #13 +
   'AND OIATUALORIG.IDMOTIVOBLOQUEIO = DESTINO.IDMOTIVOBLOQUEIO   ' + #13 +

   'AND OD.IDOPERACAODIREITO = OT.IDOPERACAODIREITO --JOINS DA GRID ' + #13 +
   'AND PLO.IDPLANPREVCTBPATR = OT.IDPLANPREVCTBPATRORIG  ' + #13 +
   'AND PLD.IDPLANPREVCTBPATR = OT.IDPLANPREVCTBPATRDEST ' + #13 +
   'AND TP.IDTIPOINVEST = 2      ' + #13 +
   'AND TP.IDTIPOOPERACAO = OD.IDTIPOOPERACAO   ' + #13 +
   'AND CI.IDCARTEIRAINVEST = OT.IDCARTINVESTORIG  ' + #13 +
   'AND IV.IDINVESTIMENTO = OT.IDINVESTORIG  ' + #13 ;

   If (iTipoOperacao) > 0 Then
      Ssql := Ssql + 'AND OD.IDTIPOOPERACAO =' + InttoStr(iTipoOperacao) + #13;

   If (iCarteira) > 0 Then
      Ssql := Ssql + 'AND OT.IDCARTINVESTORIG =' + InttoStr(iCarteira) + #13;

   If (iPlanPrevOrig) > 0 Then
      Ssql := Ssql + 'AND OT.IDPLANPREVCTBPATRORIG=' + InttoStr(iPlanPrevOrig) + #13;

   If (dDataIni > 0) And (dDataFim > 0) Then
      Ssql := Ssql + 'AND OT.DATAOPERACAO >=' + QuotedStr(DateToStr(dDataIni)) + 'AND'  + ' OT.DATAOPERACAO <=' + QuotedStr(DateToStr(dDataFim)) + #13;

   Result := GetDataPacket(sSql);

End;




Procedure TCtrlRendaVariavel.SetBuscaSaldoRV(Const Value: TBuscaSaldoRV);
Begin
   FBuscaSaldoRV := Value;
end;

function TCtrlRendaVariavel.AplicaAtualBoleta: Boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      //AL_8
      Result := Connection.AppServer.AplicaAtualBoleta(FCdsBoleta.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         Result := ApplyCds(FCdsBoleta,DbBoleta,[],[]);

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbBoleta.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_17
function TCtrlRendaVariavel.UpdateBoleta(sBoleta: String; const Campos, Valores: array of string): Boolean;
var str: String;
    i, iVlrCampo: Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      // Verificar, por DDE não é possível passar array como parâmetro
   end
   else
   begin
      try
         // Carrega a boleta no DBObject
         FDbBoleta.Idboleta.AsString := sBoleta;
         FDbBoleta.LoadFromDb;

         if High(Campos) <> High(Valores) then
            Raise Exception.Create('A quantidade de Valores não é igual à quantidade de campos' + #13 +
                                   'Não será possível atualizar a Boleta ' + sBoleta );

         for i := 0 to High(Campos) do
         begin
            if (UpperCase(Valores[i]) = 'NULL') then
               FDbBoleta.FieldByName(Campos[i]).Clear
            else
            try
               // Tenta converter o Valor para Integer
               iVlrCampo := StrToInt(Valores[i]);
               // Se não der erro, testa se o valor é negativo (PlnCodigo e CodDocumento)
               if iVlrCampo <= 0 then
                  // Se for negativo, zera o valor na tabela (Null)
                  FDbBoleta.FieldByName(Campos[i]).Clear
               else
                  // Se for positivo, faz update pelo novo valor
                  FDbBoleta.FieldByName(Campos[i]).AsString := Valores[i];
            except
               // Se der erro na conversão para Integer, faz update pelo valor passado
               FDbBoleta.FieldByName(Campos[i]).AsString := Valores[i];
            end;
         end;
         // Aplica as alterações
         FDbBoleta.Update;
         Result := True;
      except
         on E:Exception do
         begin
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

procedure TCtrlRendaVariavel.SetCdsBoleta(const Value: TClientDataSet);
begin
  FCdsBoleta := Value;
end;

procedure TCtrlRendaVariavel.SetDbBoleta(const Value: TDbBoleta);
begin
  FDbBoleta := Value;
end;

function TCtrlRendaVariavel.ListBoleta(sBoleta: String): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                                 ';
   sSql := sSql + '   IDBOLETA, DATABOLETA, STATUS, OBSERVACAO, IDFORCLI, ';
   sSql := sSql + '   CODDOCUMENTO, PLANO, PLNCODIGO, SEQBOLETA,          ';
   sSql := sSql + '   TIPMOVBOLETA, PERCDEVCORRET, VLRTOTAPAG, VLRTOTAREC ';
   sSql := sSql + 'FROM BOLETA                                            ';
   if sBoleta <> '' then
      sSql := sSql + 'WHERE IDBOLETA = ' + QuotedStr(sBoleta);
   Result := GetDataPacket(sSql);
end;

// AL_6
procedure TCtrlRendaVariavel.SetCdsProvPerda(const Value: TClientDataSet);
begin
  FCdsProvPerda := Value;
end;

// AL_6
procedure TCtrlRendaVariavel.SetDbProvPerda(const Value: TDbProvPerdaRV);
begin
  FDbProvPerda := Value;
end;

// AL_6
function TCtrlRendaVariavel.ListProvPerda(iInvestimento: Integer = -1;
                                          dDataVigencia: TDateTime = 0;
                                          bMaior: Boolean = False): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT I.DESCINVESTIMENTO, P.DATAVIGENCIA, P.PERCENTUAL, ';
   sSql := sSql + '       P.IDPROVPERDARV, P.IDINVESTIMENTO ';
   sSql := sSql + 'FROM PROVPERDARV P, INVESTIMENTO I ';
   sSql := sSql + 'WHERE P.IDINVESTIMENTO = I.IDINVESTIMENTO ';
   if iInvestimento > 0 then
      sSql := sSql + '  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento);
   if dDataVigencia > 0 then
   begin
      sSql := sSql + '  AND DATAVIGENCIA ';
      if bMaior then
         sSql := sSql + '>= TO_DATE(' + QuotedStr(DateToStr(dDataVigencia)) + ', ' + QuotedStr('dd/mm/yyyy') + ') '
      else
         sSql := sSql + '= TO_DATE(' + QuotedStr(DateToStr(dDataVigencia)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   end;
   sSql := sSql + 'ORDER BY I.DESCINVESTIMENTO, P.DATAVIGENCIA ';
   Result := GetDataPacket(sSql);
end;

//AL_8
function TCtrlRendaVariavel.AplicaAtualProvPerda: Boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualProvPerda(FCdsProvPerda.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         Result := ApplyCds(FCdsProvPerda,DbProvPerda,[],[]);

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbProvPerda.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_18
function TCtrlRendaVariavel.ListHistCartinv(iIdHistCartinv :Integer = -1;
                                            iTipoOperacao : Integer = -1;
                                            iInvestimento : Integer = -1;
                                            iCarteiraInvest : Integer = -1;
                                            iPlanPrev : Integer = -1;
                                            dDataMovCartinv : TDateTime = 0;
                                            sSinalData : String = '=';
                                            sTipoMovCart : String = ''): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + ' IDHISTCARTINV, IDDESPCARTINVEST, PLANO, CODDOCUMENTO, IDTIPOINVEST, PLNCODIGO,      ';
   sSql := sSql + ' IDOPERACAOINVEST, IDMODULO, IDEMPRESAPROP, IDTIPOOPERACAO, IDDESPOPERINVEST,        ';
   sSql := sSql + ' IDINVESTIMENTO, IDCARTEIRAINVEST, DATAMOVCARTINV, VLRMOVCARTINV, SALDOVLRINVCART,   ';
   sSql := sSql + ' SALDOQTDEINVCART, SALDOVLRCARTINV, HISTMOVCARTINV, NATURMOVCARTINV, TIPMOVCARTINV,  ';
   sSql := sSql + ' FLGCALCSALDO, MOVIMAQUI, SALDOAQUI, QTDEMOVINVCART, NATURMOVOPER, SALDOVARIACAO,    ';
   sSql := sSql + ' VLRVARIACAO, SALDOIRPROV, VLRIRPROV, SALDOIRAPU, VLRIRAPU, SALDOIOFPROV, VLRIOFPROV,';
   sSql := sSql + ' SALDOIOFAPU, VLRIOFAPU, VLRCPMFPROV, VLRCPMFAPU, IDCORRETVALORES, IDPLANPREVCTBPATR,';
   sSql := sSql + ' IDCARTEIRAGERENC, VLRTOTLIQUIDAR, SALDOQTDECPMF, VLRPROVPERDA, SALDOPROVPERDA       ';
   sSql := sSql + 'FROM HISTCARTINV  ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 2';
   if iIdHistCartinv <> -1 then
      sSql := sSql + '  AND IDHISTCARTINV = ' + IntToStr(iIdHistCartinv);
   if iInvestimento <> -1 then
      sSql := sSql + '  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento);
   if iTipoOperacao <> -1 then
      sSql := sSql + '  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);
   if iCarteiraInvest <> -1 then
      sSql := sSql + '  AND IDCARTEIRAINVEST = ' + IntToStr(iCarteiraInvest);
   if iPlanPrev <> -1 then
      sSql := sSql + '  AND IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev);
   if dDataMovCartinv > 0 then
      sSql := sSql + '  AND DATAMOVCARTINV ' + sSinalData + ' TO_DATE(' + QuotedStr(DateToStr(dDataMovCartinv)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   if sTipoMovCart <> '' then
      sSql := sSql + '  AND TIPMOVCARTINV NOT IN (' + sTipoMovCart + ')';
   sSql := sSql + ' ORDER BY DATAMOVCARTINV, IDHISTCARTINV  ';
   Result := GetDataPacket(sSql);
end;

//AL_19
function TCtrlRendaVariavel.ListCotacaoAcao(iIdAcao :Integer = -1;
                                            iIdEmissor : Integer = -1;
                                            iIdBolsa : Integer = -1;
                                            dDataCotacao : TDateTime = 0): OleVariant;
var sSql : String;
    bPrimeiro : boolean;
begin
   bPrimeiro := True;

   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + ' IDEMISSOR, IDBOLSAVALORES, DATACOTAACAO, IDACAO, VLRABERTURA, ';
   sSql := sSql + ' VLRFECHAMENTO, VLRMAXIMA, VLRMINIMA, VLRMEDIA, VOLNEGOCIADO, QTDELOTE ';
   sSql := sSql + 'FROM COTACAOACAO  ';
   if iIdAcao <> -1 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND IDACAO = ' + IntToStr(iIdAcao)
      else
      begin
         sSql := sSql + '  WHERE IDACAO = ' + IntToStr(iIdAcao);
         bPrimeiro := False;
      end;
   end;
   if iIdEmissor <> -1 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND IDEMISSOR = ' + IntToStr(iIdEmissor)
      else
      begin
         sSql := sSql + '  WHERE IDEMISSOR = ' + IntToStr(iIdEmissor);
         bPrimeiro := False;
      end;
   end;
   if iIdBolsa <> -1 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND IDBOLSAVALORES = ' + IntToStr(iIdBolsa)
      else
      begin
         sSql := sSql + '  WHERE IDBOLSAVALORES = ' + IntToStr(iIdBolsa);
         bPrimeiro := False;
      end;
   end;
   if dDataCotacao > 0 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND DATACOTAACAO = TO_DATE(' + QuotedStr(DateToStr(dDataCotacao)) + ', ' + QuotedStr('dd/mm/yyyy') + ') '
      else
      begin
         sSql := sSql + '  WHERE DATACOTAACAO = TO_DATE(' + QuotedStr(DateToStr(dDataCotacao)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
         bPrimeiro := False;
      end;
   end;
   sSql := sSql + ' ORDER BY DATACOTAACAO  ';
   Result := GetDataPacket(sSql);
end;

//AL_21
function TCtrlRendaVariavel.ListCotacaoInvest(dDataCotacao: TDateTime; iInvestimento: Integer): OleVariant;
var sSql : String;
begin
   sSql :=  'SELECT DATACOTACAO, VLRCONTABIL, QTDTITLOTE ' + #13 +
            'FROM COTACAOINVEST ' + #13 +
            'WHERE IDINVESTIMENTO = ' + IntToStr(iInvestimento) + #13 +
            '  AND DATACOTACAO = (SELECT MAX(DATACOTACAO) ' + #13 +
            '                     FROM COTACAOINVEST ' + #13 +
            '                     WHERE IDINVESTIMENTO = ' + IntToStr(iInvestimento) + #13 +
            '                       AND DATACOTACAO <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataCotacao)) + ',' + QuotedStr('DD/MM/YYYY') + '))';
   Result := GetDataPacket(sSql);
end;



//AL_19
function TCtrlRendaVariavel.ListAcoesXBolsa(iIdAcao :Integer = -1;
                                            iIdEmissor : Integer = -1;
                                            iIdBolsa : Integer = -1;
                                            sCodAcao : String = ''): OleVariant;
var sSql : String;
    bPrimeiro : boolean;
begin
   bPrimeiro := True;
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + ' IDEMISSOR, IDBOLSAVALORES, IDACAO, MOECODIGO, QTDELOTE, SIGLAACAOBOLSA, CUSTO_RET ';
   sSql := sSql + 'FROM ACOESXBOLSA  ';
   if iIdAcao <> -1 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND IDACAO = ' + IntToStr(iIdAcao)
      else
      begin
         sSql := sSql + '  WHERE IDACAO = ' + IntToStr(iIdAcao);
         bPrimeiro := False;
      end;
   end;
   if iIdEmissor <> -1 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND IDEMISSOR = ' + IntToStr(iIdEmissor)
      else
      begin
         sSql := sSql + '  WHERE IDEMISSOR = ' + IntToStr(iIdEmissor);
         bPrimeiro := False;
      end;
   end;
   if iIdBolsa <> -1 then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND IDBOLSAVALORES = ' + IntToStr(iIdBolsa)
      else
      begin
         sSql := sSql + '  WHERE IDBOLSAVALORES = ' + IntToStr(iIdBolsa);
         bPrimeiro := False;
      end;
   end;
   if sCodAcao <> ''then
   begin
      if not bPrimeiro then
         sSql := sSql + '  AND SIGLAACAOBOLSA = ' + QuotedStr(sCodAcao)
      else
      begin
         sSql := sSql + '  WHERE SIGLAACAOBOLSA = ' + QuotedStr(sCodAcao);
         bPrimeiro := False;
      end;
   end;
   sSql := sSql + ' ORDER BY IDEMISSOR, IDBOLSAVALORES, SIGLAACAOBOLSA  ';
   Result := GetDataPacket(sSql);
end;

//AL_8
procedure TCtrlRendaVariavel.SetCdsOperacaoInvest(const Value: TClientDataSet);
begin
  FCdsOperacaoInvest := Value;
end;

//AL_8
procedure TCtrlRendaVariavel.SetDbOperacaoInvest(const Value: TDbOperacaoInvest);
begin
  FDbOperacaoInvest := Value;
end;

//AL_8
function TCtrlRendaVariavel.ListOperacaoInvest(iOperacaoInvest :Integer = -1;
                                               iTipoOperacao : Integer = -1;
                                               iInvestimento : Integer = -1;
                                               dDataOperacao: TDateTime = 0): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  ';
   sSql := sSql + '   VLRVARIACAOATUAL, VLRREMUNERACAO, VLROPERACAOOM, VLROPERACAO, VLRIRREMUNER,      ';
   sSql := sSql + '   VLRIR, VLRCUSTOATUAL, QTDEOPERACAO, PUMERCADO, PRZEMPRESA, PRZBOLSA,             ';
   sSql := sSql + '   PRECOUNITOPERACAO, PERCENTUAL, PARIDADE, ORIGDEST, OBSERVACAO, NUMDOCUMENTO,     ';
   sSql := sSql + '   MOECODIGO, JUROSCAP, INVORIGEM, INIPAGTO, IDTIPOOPERACAO, IDTIPOINVEST,          ';
   sSql := sSql + '   IDTERCEIRO, IDPLANPREVCTBPATR, IDORDMOVINV, IDOPERCUSTODIA, IDOPERACAOORIGEM,    ';
   sSql := sSql + '   IDOPERACAOINVEST, IDOPERACAODIREITO, IDMOTIVOBLOQUEIO, IDMODULO, IDLOTE,         ';
   sSql := sSql + '   IDINVESTIMENTO, IDINVESTDEST, IDINSTFIN, IDFORCLI, IDCUSTORIG, IDCUSTODIANTE,    ';
   sSql := sSql + '   IDCUSTDEST, IDCORRETVALORES, IDCONTRATOIMOVEL, IDCARTORIDEST, IDCARTEIRAINVEST,  ';
   sSql := sSql + '   IDCARTEIRAGERENC, FORMAPAGREC, FLGSTATUSORDMOV, FLGSTATUSFECHBOL, FLGCUSTODIA,   ';
   sSql := sSql + '   EMPRESAPROP, DIVPORACAO, DATAVENCOPER, DATAOPERACAO, DATALIQOPER, DATAEX,        ';
   sSql := sSql + '   DATACOM, DATAAGE, CODFINANCEIRO, CODDOCUMENTO, ATADECISAO                        ';
   sSql := sSql + 'FROM OPERACAOINVEST ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 2';
   if iOperacaoInvest <> -1 then
      sSql := sSql + '  AND IDOPERACAOINVEST = ' + IntToStr(iOperacaoInvest);
   if iInvestimento <> -1 then
      sSql := sSql + '  AND IDINVESTIMENTO = ' + IntToStr(iInvestimento);
   if iTipoOperacao <> -1 then
      sSql := sSql + '  AND IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);
   if dDataOperacao > 0 then
      sSql := sSql + '  AND DATAOPERACAO = TO_DATE(' + QuotedStr(DateToStr(dDataOperacao)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   sSql := sSql + 'ORDER BY DATAOPERACAO, IDINVESTIMENTO  ';
   Result := GetDataPacket(sSql);
end;

//AL_8
//AL_14
function TCtrlRendaVariavel.AplicaAtualOperacaoInvest(dDataoperacao      : TDateTime = 0;
                                                      dInipagto          : TDateTime = 0;
                                                      dDatavencoper      : TDateTime = 0;
                                                      dDataliqoper       : TDateTime = 0;
                                                      dDataex            : TDateTime = 0;
                                                      dDatacom           : TDateTime = 0;
                                                      dDataage           : TDateTime = 0;
                                                      iIdtipooperacao    : Integer = 0;
                                                      iIdtipoinvest      : Integer = -1;
                                                      iIdplanprevctbpatr : Integer = -1;
                                                      iIdopercustodia    : Integer = -1;
                                                      iIdmotivobloqueio  : Integer = 0;
                                                      iIdmodulo          : Integer = -1;
                                                      iIdinvestimento    : Integer = -1;
                                                      iIdforcli          : Integer = -1;
                                                      iIdcustodiante     : Integer = -1;
                                                      Idcorretvalores    : Integer = -1;
                                                      iIdcarteirainvest  : Integer = -1;
                                                      iIdcarteiragerenc  : Integer = -1;
                                                      iCoddocumento      : Integer = -1;
                                                      iIdoperacaoorigem  : Integer = -1;
                                                      iIdoperacaodireito : Integer = -1;
                                                      iMoecodigo         : Integer = -1;
                                                      iInvorigem         : Integer = -1;
                                                      iIdterceiro        : Integer = -1;
                                                      iIdordmovinv       : Integer = -1;
                                                      iEmpresaprop       : Integer = -1;
                                                      iCodfinanceiro     : Integer = -1;
                                                      fVlroperacao       : Double = 0;
                                                      fPrecounitoperacao : Double = 0;
                                                      fQtdeoperacao      : Double = 0;
                                                      fPercentual        : Double = 0;
                                                      fVlrremuneracao    : Double = 0;
                                                      fVlroperacaoom     : Double = 0;
                                                      fVlrirremuner      : Double = 0;
                                                      fVlrir             : Double = 0;
                                                      fVlrcustoatual     : Double = 0;
                                                      fDivporacao        : Double = 0;
                                                      sOrigdest          : String = '';
                                                      sObservacao        : String = '';
                                                      sNumdocumento      : String = '';
                                                      sIdlote            : String = '';
                                                      sFlgstatusordmov   : String = '';
                                                      sFlgstatusfechbol  : String = '';
                                                      sFlgcustodia       : String = '';
                                                      dPrzempresa        : TDateTime = 0;
                                                      dPrzbolsa          : TDateTime = 0;
                                                      dAtadecisao        : TDateTime = 0;
                                                      iIdinvestdest      : Integer = -1;
                                                      iIdinstfin         : Integer = -1;
                                                      iIdcustorig        : Integer = -1;
                                                      iIdcustdest        : Integer = -1;
                                                      iIdcartoridest     : Integer = -1;
                                                      iIdcontratoimovel  : Integer = -1;
                                                      fVlrvariacaoatual  : Double = 0;
                                                      fPumercado         : Double = 0;
                                                      fParidade          : Double = 0;
                                                      sJuroscap          : String = '';
                                                      sFormapagrec       : String = '';
                                                      iIdOperContAcoes   : Integer = -1): Boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualOperacaoInvest(FCdsOperacaoInvest.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         FDbOperacaoInvest.Clear;
         FDbOperacaoInvest.Dataoperacao.AsDateTime     := dDataoperacao;
         FDbOperacaoInvest.Inipagto.AsDateTime         := dInipagto;
         FDbOperacaoInvest.Datavencoper.AsDateTime     := dDatavencoper;
         FDbOperacaoInvest.Dataliqoper.AsDateTime      := dDataliqoper;
         FDbOperacaoInvest.Dataex.AsDateTime           := dDataex;
         FDbOperacaoInvest.Datacom.AsDateTime          := dDatacom;
         FDbOperacaoInvest.Dataage.AsDateTime          := dDataage;
         if iIdtipooperacao <> 0 then
            FDbOperacaoInvest.Idtipooperacao.AsInteger    := iIdtipooperacao;
         if iIdtipoinvest > 0 then
            FDbOperacaoInvest.Idtipoinvest.AsInteger      := iIdtipoinvest;
         if iIdplanprevctbpatr > 0 then
            FDbOperacaoInvest.Idplanprevctbpatr.AsInteger := iIdplanprevctbpatr;
         if iIdopercustodia > 0 then
            FDbOperacaoInvest.Idopercustodia.AsInteger    := iIdopercustodia;
         if iIdmotivobloqueio <> 0 then
            FDbOperacaoInvest.Idmotivobloqueio.AsInteger  := iIdmotivobloqueio;
         if iIdmodulo > 0 then
            FDbOperacaoInvest.Idmodulo.AsInteger          := iIdmodulo;
         if iIdinvestimento > 0 then
            FDbOperacaoInvest.Idinvestimento.AsInteger    := iIdinvestimento;
         if iIdforcli > 0 then
            FDbOperacaoInvest.Idforcli.AsInteger          := iIdforcli;
         if iIdcustodiante > 0 then
            FDbOperacaoInvest.Idcustodiante.AsInteger     := iIdcustodiante;
         if Idcorretvalores > 0 then
            FDbOperacaoInvest.Idcorretvalores.AsInteger    := Idcorretvalores;
         if iIdcarteirainvest > 0 then
            FDbOperacaoInvest.Idcarteirainvest.AsInteger  := iIdcarteirainvest;
         if iIdcarteiragerenc > 0 then
            FDbOperacaoInvest.Idcarteiragerenc.AsInteger  := iIdcarteiragerenc;
         if iCoddocumento > 0 then
            FDbOperacaoInvest.Coddocumento.AsInteger      := iCoddocumento;
         if iIdoperacaoorigem > 0 then
            FDbOperacaoInvest.Idoperacaoorigem.AsInteger  := iIdoperacaoorigem;
         if iIdoperacaodireito > 0 then
            FDbOperacaoInvest.Idoperacaodireito.AsInteger := iIdoperacaodireito;
         if iMoecodigo > 0 then
            FDbOperacaoInvest.Moecodigo.AsInteger         := iMoecodigo;
         if iInvorigem > 0 then
            FDbOperacaoInvest.Invorigem.AsInteger         := iInvorigem;
         if iIdterceiro > 0 then
            FDbOperacaoInvest.Idterceiro.AsInteger        := iIdterceiro;
         if iIdordmovinv > 0 then
            FDbOperacaoInvest.Idordmovinv.AsInteger       := iIdordmovinv;
         if iEmpresaprop > 0 then
            FDbOperacaoInvest.Empresaprop.AsInteger       := iEmpresaprop;
         if iCodfinanceiro > 0 then
            FDbOperacaoInvest.Codfinanceiro.AsInteger     := iCodfinanceiro;

         FDbOperacaoInvest.Vlroperacao.AsFloat         := fVlroperacao;
         FDbOperacaoInvest.Precounitoperacao.AsFloat   := fPrecounitoperacao;
         FDbOperacaoInvest.Qtdeoperacao.AsFloat        := fQtdeoperacao;
         FDbOperacaoInvest.Percentual.AsFloat          := fPercentual;
         FDbOperacaoInvest.Vlrremuneracao.AsFloat      := fVlrremuneracao;
         FDbOperacaoInvest.Vlroperacaoom.AsFloat       := fVlroperacaoom;
         FDbOperacaoInvest.Vlrirremuner.AsFloat        := fVlrirremuner;
         FDbOperacaoInvest.Vlrir.AsFloat               := fVlrir;
         FDbOperacaoInvest.Vlrcustoatual.AsFloat       := fVlrcustoatual;
         FDbOperacaoInvest.Divporacao.AsFloat          := fDivporacao;
         FDbOperacaoInvest.Origdest.AsString           := sOrigdest;
         FDbOperacaoInvest.Observacao.AsString         := sObservacao;
         FDbOperacaoInvest.Numdocumento.AsString       := sNumdocumento;
         FDbOperacaoInvest.Idlote.AsString             := sIdlote;
         FDbOperacaoInvest.Flgstatusordmov.AsString    := sFlgstatusordmov;
         FDbOperacaoInvest.Flgstatusfechbol.AsString   := sFlgstatusfechbol;
         FDbOperacaoInvest.Flgcustodia.AsString        := sFlgcustodia;
         // Propriedade que podem estar em desuso
         FDbOperacaoInvest.Przempresa.AsDateTime       := dPrzempresa;
         FDbOperacaoInvest.Przbolsa.AsDateTime         := dPrzbolsa;
         FDbOperacaoInvest.Atadecisao.AsDateTime       := dAtadecisao;
         if iIdinvestdest > 0 then
            FDbOperacaoInvest.Idinvestdest.AsInteger      := iIdinvestdest;
         if iIdinstfin > 0 then
            FDbOperacaoInvest.Idinstfin.AsInteger         := iIdinstfin;
         if iIdcustorig > 0 then
            FDbOperacaoInvest.Idcustorig.AsInteger        := iIdcustorig;
         if iIdcustdest > 0 then
            FDbOperacaoInvest.Idcustdest.AsInteger        := iIdcustdest;
         if iIdcartoridest > 0 then
            FDbOperacaoInvest.Idcartoridest.AsInteger     := iIdcartoridest;
         if iIdcontratoimovel > 0 then
            FDbOperacaoInvest.Idcontratoimovel.AsInteger  := iIdcontratoimovel;

         FDbOperacaoInvest.Vlrvariacaoatual.AsFloat    := fVlrvariacaoatual;
         FDbOperacaoInvest.Pumercado.AsFloat           := fPumercado;
         FDbOperacaoInvest.Paridade.AsFloat            := fParidade;
         FDbOperacaoInvest.Juroscap.AsString           := sJuroscap;
         FDbOperacaoInvest.Formapagrec.AsString        := sFormapagrec;
         //AL_14
         if iIdOperContAcoes > 0 then
            FDbOperacaoInvest.IdOperContAcoes.AsInteger   := iIdOperContAcoes;

         // Aplica a alteração na Tabela
         if not FDbOperacaoInvest.Insert then
            Raise Exception.Create(FDbOperacaoInvest.MessageInfo);

         Result := ApplyCds(FCdsOperacaoInvest,DbOperacaoInvest,[],[]);
         IdOperacaoInvest := DbOperacaoInvest.Idoperacaoinvest.AsInteger;

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbOperacaoInvest.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//AL_18
function TCtrlRendaVariavel.AplicaAtualHistCartInv: Boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualHistCartInv(FCdsHistCartInv.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         Result := ApplyCds(FCdsHistCartinv,DbHistCartinv,[],[]);

         IdHistCartinv := DbHistCartinv.IdHistCartinv.AsInteger;

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbHistCartinv.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

procedure TCtrlRendaVariavel.SetIdOperacaoInvest(const Value: Integer);
begin
  FIdOperacaoInvest := Value;
end;

//AL_18
procedure TCtrlRendaVariavel.SetCdsHistCartinv(const Value: TClientDataSet);
begin
  FCdsHistCartinv := Value;
end;

//AL_18
procedure TCtrlRendaVariavel.SetDbHistCartinv(const Value: TDbHistCartinv);
begin
  FDbHistCartinv := Value;
end;

//AL_18
procedure TCtrlRendaVariavel.SetIdHistCartinv(const Value: Integer);
begin
  FIdHistCartinv := Value;
end;

//AL_19
procedure TCtrlRendaVariavel.SetCdsCotacaoAcao(const Value: TClientDataSet);
begin
  FCdsCotacaoAcao := Value;
end;

//AL_19
procedure TCtrlRendaVariavel.SetDbCotacaoAcao(const Value: TDbCotacaoAcao);
begin
  FDbCotacaoAcao := Value;
end;

//AL_19
function TCtrlRendaVariavel.AplicaAtualCotacaoAcao: boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualHistCartInv(FCdsCotacaoAcao.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         Result := ApplyCds(FCdsCotacaoAcao,DbCotacaoAcao,[],[]);

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbCotacaoAcao.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
procedure TCtrlRendaVariavel.SetCdsOperDirTransf(const Value: TClientDataSet);
begin
  FCdsOperDirTransf := Value;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
procedure TCtrlRendaVariavel.SetDbOperDirTransf(const Value: TDbOperDirTransf);
begin
  FDbOperDirTransf := Value;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
procedure TCtrlRendaVariavel.SetIdOperDirTransf(const Value: Integer);
begin
  FIdOperDirTransf := Value;
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
   FreeAndNil(_Cds);
  inherited;
end;

procedure TCtrlPersistentObject.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;

constructor TBuscaSaldoRV.Create(Aowner: TCmControlObject);
begin
  inherited;
end;

destructor TBuscaSaldoRV.Destroy;
begin
  inherited;
end;

procedure TBuscaSaldoRV.SetDataSaldo(const Value: TDateTime);
begin
  FDataSaldo := Value;
end;

procedure TBuscaSaldoRV.SetIdHistCartInv(const Value: Integer);
begin
  FIdHistCartInv := Value;
end;

procedure TBuscaSaldoRV.SetSaldoCusto(const Value: Double);
begin
  FSaldoCusto := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIOFApurado(const Value: Double);
begin
  FSaldoIOFApurado := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIOFProv(const Value: Double);
begin
  FSaldoIOFProv := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIRApurado(const Value: Double);
begin
  FSaldoIRApurado := Value;
end;

procedure TBuscaSaldoRV.SetSaldoIRProv(const Value: Double);
begin
  FSaldoIRProv := Value;
end;

procedure TBuscaSaldoRV.SetSaldoQtdTotal(const Value: Double);
begin
  FSaldoQtdTotal := Value;
end;

procedure TBuscaSaldoRV.SetSaldoVariacao(const Value: Double);
begin
  FSaldoVariacao := Value;
end;

procedure TBuscaSaldoRV.SetSaldoVlrTotal(const Value: Double);
begin
  FSaldoVlrTotal := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCC(const Value: Double);
begin
  FSldQtdCC := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCCI(const Value: Double);
begin
  FSldQtdCCI := Value;
end;

//AL_7
procedure TBuscaSaldoRV.SetSldProvPerda(const Value: Double);
begin
  FSldProvPerda := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCustodiaCC(const Value: Double);
begin
  FSldQtdCustodiaCC := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdCustodiaCCI(const Value: Double);
begin
  FSldQtdCustodiaCCI := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdBloqCustodia(const Value: Double);
begin
  FSldQtdBloqCustodia := Value;
end;

procedure TBuscaSaldoRV.SetSldQtdLibCustodia(const Value: Double);
begin
  FSldQtdLibCustodia := Value;
end;

// AL_3
//Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
function TBuscaSaldoRV.Executa(dDataRef: TDateTime;
                               iPlanPrev, iInvestimento, iCarteira: Integer;
                               iCarteiraGerenc: Integer = -1;
                               iHistCartInv: Integer = high(integer);
                               iCustodiante: integer = -1;
                               sLote: String = '';
                               iMotivoBloqueio: Integer = -1;
                               iHistCustodia: Integer = high(integer);
                               iTipoConta : Integer = 0;
                               iTipoOper : Integer = 0): Boolean;
var bPrimeiro: Boolean;
    //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
    sSql, sTipoOper : String;
begin
   //AL_20
   try // Finally
      try // Except
         Result := True;
         bPrimeiro := True;

         FIdHistCartInv      := 0;
         FDataSaldo          := 0;
         FSaldoQtdTotal      := 0;
         FSaldoVlrTotal      := 0;
         FSaldoCusto         := 0;
         FSaldoVariacao      := 0;
         FSaldoIRProv        := 0;
         FSaldoIRApurado     := 0;
         FSaldoIOFProv       := 0;
         FSaldoIOFApurado    := 0;
         FSldQtdCC           := 0;
         FSldQtdCCI          := 0;
         //AL_7
         FSldProvPerda       := 0;
         FSldQtdLibCustodia  := 0;
         FSldQtdBloqCustodia := 0;
         FSldQtdCustodiaCC   := 0;
         FSldQtdCustodiaCCI  := 0;

         //AL_7
         sSql :=
            'SELECT H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,' + #13 +
            '       H1.SALDOVLRINVCART, H1.SALDOQTDECPMF, H1.SALDOQTDEINVCART,' + #13 +
            '       H1.SALDOAQUI, H1.SALDOVARIACAO, H1.SALDOPROVPERDA,' + #13 +
            '       H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAPU, ' + #13 +
            '       (H1.SALDOQTDEINVCART - H1.SALDOQTDECPMF) AS SALDOQTDECCI ' + #13 +
            //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
            'FROM HISTCARTINV H1 ' + #13;

         // Filtra o PlanoPatro
         if iPlanPrev > 0 then
         begin
            sSql := sSql + 'WHERE (H1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
            bPrimeiro := False;
         end;

         // Filtra a Carteira Própria
         if (iCarteira > 0) and (bPrimeiro) then
         begin
            sSql := sSql + 'WHERE (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
            bPrimeiro := False;
         end
         else
         if (iCarteira > 0) and (not bPrimeiro) then
            sSql := sSql + '  AND (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

         //Filtra a Carteira Gerencial
         if iCarteiraGerenc > 0 then
         begin
            if bPrimeiro then
            begin
               sSql := sSql + 'WHERE (H1.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
               bPrimeiro := False;
            end
            else
               sSql := sSql + '  AND (H1.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
         end
         else
         begin
            if bPrimeiro then
            begin
               sSql := sSql + 'WHERE (H1.IDCARTEIRAGERENC IS NULL)' + #13;
               bPrimeiro := False;
            end
            else
               sSql := sSql + '  AND (H1.IDCARTEIRAGERENC IS NULL)' + #13;
         end;

         // Filtra o Investimento
         if (iInvestimento > 0) and (bPrimeiro) then
         begin
            sSql := sSql + 'WHERE (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
            bPrimeiro := False;
         end
         else
         if (iInvestimento > 0) and (not bPrimeiro) then
            sSql := sSql + '  AND (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

         // Filtra o Lote
         if (sLote <> '') and (bPrimeiro) then
         begin
            sSql := sSql + 'WHERE (H1.IDLOTE = ' + sLote + ')' + #13;
            bPrimeiro := False;
         end
         else
         if (sLote <> '') and (not bPrimeiro) then
            sSql := sSql + '  AND (H1.IDLOTE = ' + sLote + ')' + #13;

         sSql := sSql +
         '  AND (H1.IDHISTCARTINV = ' + #13 +
         '          (SELECT MAX(H2.IDHISTCARTINV) ' + #13 +
         '           FROM HISTCARTINV H2, (SELECT P.IDTIPOOPERDIRDIV, P.IDTIPOOPERDIRJUR, P.IDTIPOOPERDIRMUL FROM PARAMINVEST P) P1  ' + #13;

         bPrimeiro := True;
         // Filtra o Plano Patro
         if iPlanPrev > 0 then
         begin
            sSql := sSql + '           WHERE (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
            bPrimeiro := False;
         end;

         // Filtra a Carteira Própria
         if (iCarteira > 0) and (bPrimeiro) then
         begin
            sSql := sSql + '           WHERE (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
            bPrimeiro := False;
         end
         else
         if (iCarteira > 0) and (not bPrimeiro) then
            sSql := sSql + '             AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

         // Filtra a Carteira Gerencial
         if iCarteiraGerenc > 0 then
         begin
            if bPrimeiro then
            begin
               sSql := sSql + '           WHERE (H2.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
               bPrimeiro := False;
            end
            else
               sSql := sSql + '             AND (H2.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
         end
         else
         begin
            if bPrimeiro then
            begin
               sSql := sSql + '           WHERE (H2.IDCARTEIRAGERENC IS NULL)' + #13;
               bPrimeiro := False;
            end
            else
               sSql := sSql + '             AND (H2.IDCARTEIRAGERENC IS NULL)' + #13;
         end;

         // Filtra o Investimento
         if (iInvestimento > 0) and (bPrimeiro) then
         begin
            sSql := sSql + '           WHERE (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
            bPrimeiro := False;
         end
         else
         if (iInvestimento > 0) and (not bPrimeiro) then
            sSql := sSql + '             AND (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

         // Filtra o Lote
         if (sLote <> '') and (bPrimeiro) then
         begin
            sSql := sSql + '           WHERE (H2.IDLOTE = ' + sLote + ')' + #13;
            bPrimeiro := False;
         end
         else
         if (sLote <> '') and (not bPrimeiro) then
            sSql := sSql + '             AND (H2.IDLOTE = ' + sLote + ')' + #13;

         sSql := sSql +
         '             AND (H2.DATAMOVCARTINV = ' + #13 +
         '                     (SELECT MAX(H3.DATAMOVCARTINV) ' + #13 +
         '                      FROM HISTCARTINV H3, (SELECT P.IDTIPOOPERDIRDIV, P.IDTIPOOPERDIRJUR, P.IDTIPOOPERDIRMUL FROM PARAMINVEST P) P2  ' + #13;

         bPrimeiro := True;
         // Filtra o Plano Patro
         if iPlanPrev > 0 then
         begin
            sSql := sSql + '                      WHERE (H3.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
            bPrimeiro := False;
         end;

         // Filtra a Carteira Prõpria
         if (iCarteira > 0) and (bPrimeiro) then
         begin
            sSql := sSql + '                      WHERE (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
            bPrimeiro := False;
         end
         else
         if (iCarteira > 0) and (not bPrimeiro) then
            sSql := sSql + '                        AND (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

         // Filtra a Carteira Genrencial
         if iCarteiraGerenc > 0 then
         begin
            if bPrimeiro then
            begin
               sSql := sSql + '                      WHERE (H3.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
               bPrimeiro := False;
            end
            else
               sSql := sSql + '                        AND (H3.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
         end
         else
         begin
            if bPrimeiro then
            begin
               sSql := sSql + '                      WHERE (H3.IDCARTEIRAGERENC IS NULL)' + #13;
               bPrimeiro := False;
            end
            else
               sSql := sSql + '                        AND (H3.IDCARTEIRAGERENC IS NULL)' + #13;
         end;

         // Filtra o Investimento
         if (iInvestimento > 0) and (bPrimeiro) then
         begin
            sSql := sSql + '                      WHERE (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
            bPrimeiro := False;
         end
         else
         if (iInvestimento > 0) and (not bPrimeiro) then
            sSql := sSql + '                        AND (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

         // Filtra o Lote
         if (sLote <> '') and (bPrimeiro) then
         begin
            sSql := sSql + '                      WHERE (H3.IDLOTE = ' + sLote + ')' + #13;
            bPrimeiro := False;
         end
         else
         if (sLote <> '') and (not bPrimeiro) then
            sSql := sSql + '                        AND (H3.IDLOTE = ' + sLote + ')' + #13;

         // Filtra a Data
         if bPrimeiro then
            sSql := sSql + '                      WHERE ((H3.DATAMOVCARTINV   < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13
         else
            sSql := sSql + '                        AND ((H3.DATAMOVCARTINV   < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13;

         //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
         sTipoOper := '';
         if (iTipoOper <> 0) then
            sTipoOper := ','+IntToStr(iTipoOper)+','+IntToStr(iTipoOper-10000);
         sSql := sSql +
         '                              ((H3.DATAMOVCARTINV = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) AND ' + #13 +
         '                                (H3.IDHISTCARTINV    < ' + IntToStr(iHistCartInv) + ' ))) ' + #13 +
         '                        AND ((H3.IDTIPOOPERACAO NOT IN (NVL(P2.IDTIPOOPERDIRDIV,0), (NVL(P2.IDTIPOOPERDIRDIV,0) + 10000), ' + #13 +
         '                                                        NVL(P2.IDTIPOOPERDIRJUR,0), (NVL(P2.IDTIPOOPERDIRJUR,0) + 10000), ' + #13 +
         '                                                        NVL(P2.IDTIPOOPERDIRMUL,0), (NVL(P2.IDTIPOOPERDIRMUL,0) + 10000), ' + #13 +
         '                                                        -70, -10070, -10170'+sTipoOper+')) OR ' + #13 +
         '                             (H3.IDTIPOOPERACAO IS NULL)) ' + #13 +
         '                     )' + #13 +
         '                 ) ' + #13 +
         //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
         '             AND ((H2.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000), ' + #13 +
         '                                             NVL(P1.IDTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000), ' + #13 +
         '                                             NVL(P1.IDTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000), ' + #13 +
         '                                             -70, -10070, -10170'+sTipoOper+')) OR ' + #13 +
         '                  (H2.IDTIPOOPERACAO IS NULL)) ' + #13 +
         '             AND (H2.IDHISTCARTINV < ' + IntToStr(iHistCartInv) + ') ' + #13 +
         '          ) ' + #13 +
         '      ) ' + #13 +
         //Ricardo Cristiano - 03/02/2009 - N. Sol 107933 -  N. Kintana 486332
         '  AND (NVL(H1.SALDOQTDEINVCART,0) <> 0) ' + #13 +
         ' ' + #13 +
         'ORDER BY H1.DATAMOVCARTINV DESC, H1.IDHISTCARTINV DESC ';

         _Cds.Data := TCtrlRendaVariavel(Owner).GetDataPacket(sSQL);
         if _Cds.IsEmpty then
             Raise Exception.Create('Saldo não encontrado.')
         else
         begin
            FIdHistCartInv      := _Cds.FieldByName('IDHISTCARTINV').AsInteger;
            FDataSaldo          := _Cds.FieldByName('DATAMOVCARTINV').AsDateTime;
            FSaldoQtdTotal      := _Cds.FieldByName('SALDOQTDEINVCART').AsFloat;
            FSaldoVlrTotal      := _Cds.FieldByName('SALDOVLRINVCART').AsFloat;
            FSaldoCusto         := _Cds.FieldByName('SALDOAQUI').AsFloat;
            FSaldoVariacao      := _Cds.FieldByName('SALDOVARIACAO').AsFloat;
            FSaldoIRProv        := _Cds.FieldByName('SALDOIRPROV').AsFloat;
            FSaldoIRApurado     := _Cds.FieldByName('SALDOIRAPU').AsFloat;
            FSaldoIOFProv       := _Cds.FieldByName('SALDOIOFPROV').AsFloat;
            FSaldoIOFApurado    := _Cds.FieldByName('SALDOIOFAPU').AsFloat;
            FSldQtdCC           := _Cds.FieldByName('SALDOQTDECPMF').AsFloat;
            FSldQtdCCI          := (_Cds.FieldByName('SALDOQTDEINVCART').AsFloat - _Cds.FieldByName('SALDOQTDECPMF').AsFloat);
            //AL_7
            FSldProvPerda       := _Cds.FieldByName('SALDOPROVPERDA').AsFloat;

            //AL_9 - Ini
            if (iInvestimento > 0) and (iPlanPrev > 0) and (iCarteira > 0) and
               (iCustodiante > 0) then
            begin
               if sLote = '' then
                  sLote := ' IS NULL'
               else
                  sLote := ' = ' + sLote;

               sSql := '';
               sSql :=
                  // AL_3
                  'SELECT H.SALDOLIBERADO, H.SALDOBLOQUEADO, H.SALDOQTDECPMF ' + #13 +
                  'FROM HISTCUSTODIA H ' + #13 +
                  'WHERE (H.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13 +
                  '  AND (H.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ')' + #13 +
                  '  AND (H.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13 +
                  '  AND (H.IDCUSTODIANTE = ' + IntToStr(iCustodiante) + ')' + #13 +
                  '  AND (H.IDMOTIVOBLOQUEIO = ' + IntToStr(iMotivoBloqueio)+ ')' + #13 +
                  '  AND (H.IDLOTE ' + sLote + ')' + #13 +
                  '  AND (H.IDCUSTODIA = (SELECT MAX(H1.IDCUSTODIA) ' + #13 +
                  '                       FROM HISTCUSTODIA H1 ' + #13 +
                  '                       WHERE (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13 +
                  '                         AND (H1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ')' + #13 +
                  '                         AND (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13 +
                  '                         AND (H1.IDCUSTODIANTE = ' + IntToStr(iCustodiante)+ ')' + #13 +
                  '                         AND (H1.IDMOTIVOBLOQUEIO  = ' + IntToStr(iMotivoBloqueio)+ ')' + #13 +
                  '                         AND (H1.IDLOTE ' + sLote + ')' + #13 +
                  '                         AND (H1.DATAMOVCUSTOD = (SELECT MAX(H2.DATAMOVCUSTOD) ' + #13 +
                  '                                                  FROM HISTCUSTODIA H2 ' + #13 +
                  '                                                  WHERE (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13 +
                  '                                                    AND (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ')' + #13 +
                  '                                                    AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13 +
                  '                                                    AND (H2.IDCUSTODIANTE = ' + IntToStr(iCustodiante)+ ')' + #13 +
                  '                                                    AND (H2.IDMOTIVOBLOQUEIO  = ' + IntToStr(iMotivoBloqueio)+ ')' + #13 +
                  '                                                    AND (H2.IDLOTE ' + sLote + ')' + #13 +
                  '                                                    AND ((H2.DATAMOVCUSTOD < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13 +
                  '                                                         ((H2.DATAMOVCUSTOD = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) AND ' + #13 +
                  '                                                          (H2.IDCUSTODIA < ' + IntToStr(iHistCustodia) + '))) ))' + #13 +
                  '                         AND (H1.IDCUSTODIA < ' + IntToStr(iHistCustodia) + ')) )';

               _Cds.Data := TCtrlRendaVariavel(Owner).GetDataPacket(sSQL);
               if _Cds.IsEmpty then
                   Raise Exception.Create('Saldo na Custódia não encontrado.')
               else
               begin
                  FSldQtdLibCustodia  := _Cds.FieldByName('SALDOLIBERADO').AsFloat;
                  FSldQtdBloqCustodia := _Cds.FieldByName('SALDOBLOQUEADO').AsFloat;
                  if iMotivoBloqueio = -1 then
                  begin
                     FSldQtdCustodiaCC   := _Cds.FieldByName('SALDOQTDECPMF').AsFloat;
                     FSldQtdCustodiaCCI  := (_Cds.FieldByName('SALDOLIBERADO').AsFloat - _Cds.FieldByName('SALDOQTDECPMF').AsFloat);
                  end
                  else
                  begin
                     FSldQtdCustodiaCC   := _Cds.FieldByName('SALDOQTDECPMF').AsFloat;
                     FSldQtdCustodiaCCI  := (_Cds.FieldByName('SALDOBLOQUEADO').AsFloat - _Cds.FieldByName('SALDOQTDECPMF').AsFloat);
                  end;
               end;
            end;
            //AL_9 - Fim
         end;
      except
         on E:Exception do
         begin
            Result := False;
            TCtrlRendaVariavel(Owner).MessageInfo := E.Message;
         end;
      end;
   finally
      _Cds.Close;
   end;
end;

//AL_8
function TCtrlRendaVariavel.BuscaSldTRCPlanoSintetico(dDataRef: TDateTime;
                                                      iInvestimento : Integer = -1;
                                                      iPlanPrev : Integer = -1;
                                                      iCarteira : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   // Traz os Saldos sintético por Cart. Propria / Cart. Gerenciais e Plano/Patro
   sSql := '';
   sSql := sSql + ' SELECT DISTINCT ';
   sSql := sSql + '    ''01.01.1899'' AS DATAOPERACAO, ';
   sSql := sSql + '    CA.DESCCARTINVEST, ';
   sSql := sSql + '    IV.DESCINVESTIMENTO, ';
   sSql := sSql + '    CA.IDCARTEIRAINVEST, ';
   sSql := sSql + '    IV.IDINVESTIMENTO, ';
   sSql := sSql + '    IV.IDEMISSOR, ';
   sSql := sSql + '    (H1.IDPLANPREVCTBPATR) AS IDPLANPREVCTBORIG, ';
   sSql := sSql + '    NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART, ';
   sSql := sSql + '    DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,';
   sSql := sSql + '    0 AS PERCTRANSFERIDO, ';
   sSql := sSql + '    ROUND((H1.SALDOQTDEINVCART * 0),8) AS QTDTRANSFERIDO, ';
   sSql := sSql + '    ROUND((H1.SALDOVLRINVCART * 0),2) AS VLRTRANSFERIDO, ';
   sSql := sSql + '    0 AS IDPLANPREVCTBDEST  ';
   sSql := sSql + ' FROM ';
   sSql := sSql + '    HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA ';
   sSql := sSql + ' WHERE ';
   sSql := sSql + '    (H1.IDHISTCARTINV IN (SELECT MAX(H2.IDHISTCARTINV) ';
   sSql := sSql + '                          FROM HISTCARTINV H2, PARAMINVEST P2 ';
   sSql := sSql + '                          WHERE ';
   sSql := sSql + '                             (H2.IDTIPOINVEST = 2) ';
   //AL_9 - Ini
   if iPlanPrev > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ';
   if iCarteira > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ';
   if iInvestimento > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ';
   //AL_9 - Fim
   sSql := sSql + '                             AND (H2.IDCARTEIRAGERENC IS NULL) ';
   sSql := sSql + '                             AND (H2.DATAMOVCARTINV  = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'')) ';
   sSql := sSql + '                             AND (H2.IDTIPOOPERACAO NOT IN (NVL(P2.IDTIPOOPERDIRDSU,0), (NVL(P2.IDTIPOOPERDIRDSU,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRJUR,0), (NVL(P2.IDTIPOOPERDIRJUR,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRMUL,0), (NVL(P2.IDTIPOOPERDIRMUL,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRDIV,0), (NVL(P2.IDTIPOOPERDIRDIV,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERRFRAC ,0), (NVL(P2.IDTIPOOPERRFRAC ,0) + 10000))) ';
   sSql := sSql + '                          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO)) ';
   sSql := sSql + '   AND (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO(+)) ';
   sSql := sSql + '   AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)) ';

   Result := GetDataPacket(sSql);

end;

//AL_8
function TCtrlRendaVariavel.BuscaSldTRCPlanoAnalitico(dDataRef: TDateTime;
                                                      iInvestimento : Integer = -1;
                                                      iPlanPrev : Integer = -1;
                                                      iCarteira : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   // Traz os Saldos analitico por Custodiante / Mot. Bloqueio / Cart. Propria e Cart. Gerenciais e Plano/Patro
   sSql := '';
   //AL_9 - Ini
   //AL_13 - Ini
   sSql := sSql + ' SELECT DISTINCT ' + #13;
   sSql := sSql + '    0 AS DATAOPERACAO, ' + #13;
   sSql := sSql + '    0 AS SALDOQTDEINVCART, ' + #13;
   sSql := sSql + '    0 AS SALDOVLRINVCART, ' + #13;
   sSql := sSql + '    DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, SALDOBLOQUEADO)  AS QTDE, ' + #13;
   sSql := sSql + '    0 AS PERCTRANSFERIDO, ' + #13;
   sSql := sSql + '    0 AS QTDTRANSFERIDO, ' + #13;
   sSql := sSql + '    0 AS VLRTRANSFERIDO, ' + #13;
   sSql := sSql + '    HC.IDPLANPREVCTBPATR, ' + #13;
   sSql := sSql + '    INV.DESCINVESTIMENTO, CA.DESCCARTINVEST, C.SGLCUSTODIANTE, ' + #13;
   sSql := sSql + '    DECODE(HC.IDMOTIVOBLOQUEIO, -1, NULL, MB.SIGLAMOTBLOQ) SIGLAMOTBLOQ, HC.IDLOTE, ' + #13;
   sSql := sSql + '    HC.IDCARTEIRAINVEST, NULL AS IDCARTEIRAGERENC, HC.IDINVESTIMENTO, HC.IDCUSTODIANTE, ' + #13;
   sSql := sSql + '    LPAD(HC.IDCARTEIRAINVEST, 2, ''0'') || NULL AS IDCARTEIRA, ' + #13;
   sSql := sSql + '    HC.IDMOTIVOBLOQUEIO, HC.IDCUSTODIA, QTL.QTDTITLOTE ' + #13;
   sSql := sSql + ' FROM HISTCUSTODIA HC, CUSTODIANTE C, MOTIVOBLOQUEIO MB, CARTEIRAINVEST CA, ' + #13;
   sSql := sSql + '      INVESTIMENTO INV, ' + #13;
   sSql := sSql + '      (SELECT IDINVESTIMENTO, QTDTITLOTE  ' + #13;
   sSql := sSql + '       FROM COTACAOINVEST ' + #13;
   sSql := sSql + '       WHERE DATACOTACAO = (SELECT MAX(DATACOTACAO) ' + #13;
   sSql := sSql + '                            FROM COTACAOINVEST ' + #13;
   sSql := sSql + '                            WHERE DATACOTACAO < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                           AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   sSql := sSql + '                            ) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '      AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   sSql := sSql + '      ) QTL ' + #13;
   sSql := sSql + ' WHERE HC.IDCARTEIRAINVEST   = CA.IDCARTEIRAINVEST ' + #13;
   if iInvestimento > 0 then
   begin
      sSql := sSql + ' AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (HC.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
      sSql := sSql + ' AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (QTL.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   end;
   sSql := sSql + '   AND HC.IDINVESTIMENTO     = INV.IDINVESTIMENTO ' + #13;
   sSql := sSql + '   AND HC.IDCUSTODIANTE      = C.IDCUSTODIANTE(+) ' + #13;
   sSql := sSql + '   AND HC.IDMOTIVOBLOQUEIO   = MB.IDMOTIVOBLOQUEIO(+) ' + #13;
   sSql := sSql + '   AND HC.IDCUSTODIA  IN (SELECT MAX(HC1.IDCUSTODIA) ' + #13;
   sSql := sSql + '                          FROM HISTCUSTODIA HC1 ' + #13;
   sSql := sSql + '                          WHERE HC1.DATAMOVCUSTOD || HC1.IDCARTEIRAINVEST || HC1.IDCUSTODIANTE || HC1.IDMOTIVOBLOQUEIO || HC1.IDPLANPREVCTBPATR = ' + #13;
   sSql := sSql + '                                    (SELECT MAX(HC2.DATAMOVCUSTOD) || HC2.IDCARTEIRAINVEST || HC2.IDCUSTODIANTE || HC2.IDMOTIVOBLOQUEIO || HC2.IDPLANPREVCTBPATR ' + #13;
   sSql := sSql + '                                                     FROM HISTCUSTODIA HC2 ' + #13;
   sSql := sSql + '                                                     WHERE HC2.IDCARTEIRAINVEST = HC1.IDCARTEIRAINVEST ' + #13;
   if iPlanPrev > 0 then
      sSql := sSql + '                                                    AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (HC2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                                                    AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (HC2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   if iCarteira > 0 then
      sSql := sSql + '                                                    AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (HC2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ' + #13;
   sSql := sSql + '                                                       AND HC2.DATAMOVCUSTOD < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') ' + #13;
   sSql := sSql + '                                                       AND HC2.IDCUSTODIANTE = HC1.IDCUSTODIANTE ' + #13;
   sSql := sSql + '                                                       AND HC2.IDMOTIVOBLOQUEIO = HC1.IDMOTIVOBLOQUEIO ' + #13;
   sSql := sSql + '                                                     GROUP BY HC2.IDCARTEIRAINVEST, HC2.IDCUSTODIANTE, ' + #13;
   sSql := sSql + '                                                           HC2.IDMOTIVOBLOQUEIO, HC2.IDPLANPREVCTBPATR) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                         AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (HC1.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   sSql := sSql + '                          GROUP BY HC1.IDCARTEIRAINVEST, HC1.IDCUSTODIANTE, HC1.IDMOTIVOBLOQUEIO, HC1.IDPLANPREVCTBPATR) ' + #13;
   sSql := sSql + '    AND DECODE(HC.IDMOTIVOBLOQUEIO, -1, HC.SALDOLIBERADO, SALDOBLOQUEADO) <> 0 ' + #13;
   sSql := sSql + ' ' + #13;
   sSql := sSql + ' UNION ALL ' + #13;
   sSql := sSql + ' ' + #13;
   sSql := sSql + ' SELECT DISTINCT ' + #13;
   sSql := sSql + '    0 AS DATAOPERACAO, ' + #13;
   sSql := sSql + '    NVL(HI.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART, ' + #13;
   sSql := sSql + '    NVL(HI.SALDOVLRINVCART,0) AS SALDOVLRINVCART, ' + #13;
   sSql := sSql + '    NVL(HI.SALDOQTDEINVCART,0) AS QTDE, ' + #13;
   sSql := sSql + '    0 AS PERCTRANSFERIDO, ' + #13;
   sSql := sSql + '    0 AS QTDTRANSFERIDO, ' + #13;
   sSql := sSql + '    0 AS VLRTRANSFERIDO, ' + #13;
   sSql := sSql + '    HI.IDPLANPREVCTBPATR, ' + #13;
   sSql := sSql + '    IV.DESCINVESTIMENTO, CA.DESCCARTGERENC AS DESCCARTINVEST, '''' AS SLGCUSTODIANTE, ' + #13;
   sSql := sSql + '    '''' AS SIGLAMOTBLOQ,  HI.IDLOTE, ' + #13;
   sSql := sSql + '    HI.IDCARTEIRAINVEST, HI.IDCARTEIRAGERENC, HI.IDINVESTIMENTO, NULL AS IDCUSTODIANTE, ' + #13;
   sSql := sSql + '    LPAD(HI.IDCARTEIRAINVEST, 2,''0'') || LPAD(HI.IDCARTEIRAGERENC,2,''0'') AS IDCARTEIRA, ' + #13;
   sSql := sSql + '    NULL AS IDMOTIVOBLOQUEIO, NULL AS IDCUSTODIA, QTL.QTDTITLOTE ' + #13;
   sSql := sSql + ' FROM ' + #13;
   sSql := sSql + '    HISTCARTINV HI, INVESTIMENTO IV, CARTEIRAGERENC CA, ' + #13;
   sSql := sSql + '   (SELECT IDINVESTIMENTO, QTDTITLOTE ' + #13;
   sSql := sSql + '    FROM COTACAOINVEST ' + #13;
   sSql := sSql + '    WHERE DATACOTACAO = (SELECT MAX(DATACOTACAO) ' + #13;
   sSql := sSql + '                         FROM COTACAOINVEST ' + #13;
   sSql := sSql + '                         WHERE DATACOTACAO < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                           AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   sSql := sSql + '                            ) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '      AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   sSql := sSql + '      ) QTL ' + #13;
   sSql := sSql + ' WHERE (HI.IDHISTCARTINV  IN (SELECT MAX(HI1.IDHISTCARTINV) ' + #13;
   sSql := sSql + '                              FROM HISTCARTINV HI1 ' + #13;
   sSql := sSql + '                              WHERE (HI1.IDTIPOINVEST = 2) ' + #13;
   if iPlanPrev > 0 then
      sSql := sSql + '                             AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (HI1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                             AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (HI1.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   if iCarteira > 0 then
      sSql := sSql + '                             AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (HI1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ' + #13;
   sSql := sSql + '                                AND ((HI1.DATAMOVCARTINV || HI1.IDINVESTIMENTO || HI1.IDCARTEIRAINVEST || HI1.IDCARTEIRAGERENC || HI1.IDPLANPREVCTBPATR) IN ' + #13;
   sSql := sSql + '                                   (SELECT (MAX(HI2.DATAMOVCARTINV) || HI2.IDINVESTIMENTO || HI2.IDCARTEIRAINVEST || HI2.IDCARTEIRAGERENC || HI2.IDPLANPREVCTBPATR) ' + #13;
   sSql := sSql + '                                    FROM HISTCARTINV HI2 ' + #13;
   sSql := sSql + '                                    WHERE (HI2.IDTIPOINVEST = 2) ' + #13;
   if iPlanPrev > 0 then
      sSql := sSql + '                                   AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (HI2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                                   AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (HI2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   if iCarteira > 0 then
      sSql := sSql + '                                   AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (HI2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ' + #13;
   sSql := sSql + '                                      AND (HI2.DATAMOVCARTINV < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'')) ' + #13;
   sSql := sSql + '                                    GROUP BY HI2.IDINVESTIMENTO, HI2.IDCARTEIRAINVEST, HI2.IDCARTEIRAGERENC, HI2.IDPLANPREVCTBPATR)) ' + #13;
   sSql := sSql + '                              GROUP BY HI1.IDINVESTIMENTO, HI1.IDCARTEIRAINVEST, HI1.IDCARTEIRAGERENC, HI1.IDPLANPREVCTBPATR)) ' + #13;
   sSql := sSql + '   AND (HI.IDINVESTIMENTO     = IV.IDINVESTIMENTO(+)) ' + #13;
   //Ricardo Cristiano - 04/11/2010 - N. Sol 144087.2861 -  N. Kintana 1011203
   sSql := sSql + '   AND (HI.IDCARTEIRAGERENC   = CA.IDCARTEIRAGERENC(+)) ' + #13;
   if iPlanPrev > 0 then
      sSql := sSql + '                                   AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (HI.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ' + #13;
   if iInvestimento > 0 then
      sSql := sSql + '                                   AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (HI.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ' + #13;
   if iCarteira > 0 then
      sSql := sSql + '                                   AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (HI.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ' + #13;
   sSql := sSql + '   AND (HI.IDTIPOINVEST = 2) ' + #13;
   sSql := sSql + '   AND (NVL(HI.SALDOQTDEINVCART,0) > 0) ' + #13;
   //Ricardo Cristiano - 09/11/2010 - N. Sol 147412 -  N. Kintana 1019370
   sSql := sSql + '   AND (HI.IDINVESTIMENTO = QTL.IDINVESTIMENTO(+)) ' + #13;
   sSql := sSql + ' ORDER BY IDCARTEIRAGERENC' + #13;
   Result := GetDataPacket(sSql);
   //AL_13 - Fim
   //AL_9 - Ini
end;

//AL_8
function TCtrlRendaVariavel.BuscaOperBoletaTRCPlano(sBoleta : String;
                                                    iOperacao : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147
   sSql := sSql + ' SELECT OPERCUSTODIA.IDOPERCUSTODIA, OPERCUSTODIA.IDHISTCARTINVDEST, OPERCUSTODIA.IDHISTCARTINVORIG, OPERCUSTODIA.DATAMOVCUSTOD ';
   sSql := sSql + ' FROM ';
   sSql := sSql + '    OPERCUSTODIA ';
   sSql := sSql + ' WHERE ';
   sSql := sSql + '    (OPERCUSTODIA.IDBOLETA = ' + QuotedStr(sBoleta) + ') ';
   //AL_9
   if iOperacao > 0 then
      sSql := sSql + ' AND (OPERCUSTODIA.IDOPERCUSTODIA = ' + IntToStr(iOperacao) + ' ) ';
   Result := GetDataPacket(sSql);

   //Ricardo Cristiano - 04/11/2010 - N. Sol 144087.2861 -  N. Kintana 1011203
   _Cds.Data := Result;
   if _Cds.IsEmpty then
   begin
       //Ricardo Cristiano - 19/11/2010 - N. Sol 147934/3022  -  N. Kintana 1031783
       sSql := ''; 
       sSql := sSql + ' SELECT OPERACAOINVEST.IDOPERACAOINVEST FROM OPERACAOINVEST WHERE (OPERACAOINVEST.NUMDOCUMENTO = ' + QuotedStr(sBoleta) + ') ';
       Result := GetDataPacket(sSql);
   end;    
end;

//AL_8
function TCtrlRendaVariavel.ListOperTrcPlanos(dDataAnt: TDateTime = 0;
                                              dDataFim : TDateTime = 0;
                                              iInvestimento : Integer = -1;
                                              iCarteira : Integer = -1;
                                              iPlanPrevOrig  : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   //AL_16 - Ini
   //AL_9 - Ini
   sSql := 'SELECT OPO.IDPLANPREVCTBPATR, OPO.IDCARTEIRAINVEST, OPO.IDINVESTIMENTO, OPO.DATAOPERACAO, OPO.IDTIPOOPERACAO, OPO.NUMDOCUMENTO, ' + #13 +
           '       DECODE(OPO.IDTIPOOPERACAO,-158, NVL(HC3.SALDOQTDECPMF,0),(NVL(HC3.SALDOQTDEINVCART,0)-NVL(HC3.SALDOQTDECPMF,0))) AS SALDOANTORIG, ' + #13 +
           '       OPO.QTDTRANSFORIG,' + #13 +
           '       DECODE(OPO.IDTIPOOPERACAO,-158,HCO.SALDOQTDECPMF,(HCO.SALDOQTDEINVCART-HCO.SALDOQTDECPMF)) AS SALDOATUORIG, ' + #13 +
           '       OPO.TIPOSALDO, OPO.PERCENTUAL, OMO.IDOPERACAOINVEST, OPD.IDPLANPREVCTBPATR, ' + #13 +
           '       DECODE(OPD.IDTIPOOPERACAO,-159, NVL(HC2.SALDOQTDECPMF,0),(NVL(HC2.SALDOQTDEINVCART,0)-NVL(HC2.SALDOQTDECPMF,0))) AS SALDOANTDEST, ' + #13 +
           '       OPD.QTDTRANSFDEST, ' + #13 +
           '       DECODE(OPD.IDTIPOOPERACAO,-159,HCD.SALDOQTDECPMF,(HCD.SALDOQTDEINVCART-HCD.SALDOQTDECPMF)) AS SALDOATUDEST, ' + #13 +
           '       PPO.PLANPRVCONTABPATRO AS PLANOORIG, ' + #13 +
           '       PPD.PLANPRVCONTABPATRO AS PLANODEST, ' + #13 +
           '       CA.DESCCARTINVEST, ' + #13 +
           '       IV.DESCINVESTIMENTO, ' + #13 +
           '       OPO.DATAOPERACAO || CA.DESCCARTINVEST || PPO.PLANPRVCONTABPATRO || PPD.PLANPRVCONTABPATRO || OPO.NUMDOCUMENTO || OPO.IDINVESTIMENTO AS GRUPO ' + #13 +
           'FROM ' + #13 +
           '  (SELECT OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, ' + #13 +
           '          SUM(OP.QTDEOPERACAO) AS QTDTRANSFORIG, DECODE(OP.IDTIPOOPERACAO,-158,''CC'',''CCI'') AS TIPOSALDO, ' + #13 +
           '          OP.PERCENTUAL ' + #13 +
           '   FROM OPERACAOINVEST OP ' + #13 +
           '   WHERE (OP.IDTIPOOPERACAO IN (-158, -10158)) ' + #13 +
           '     AND (OP.DATAOPERACAO = TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'')) ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '     AND (OP.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '     AND (OP.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iPlanPrevOrig > 0 then
      sSQL := sSQL + '     AND (OP.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevOrig) + ') ' + #13;
   sSQL := sSQL + '     AND OP.IDCARTEIRAGERENC IS NULL ' + #13 +
           '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, OP.PERCENTUAL) OPO, ' + #13 +
           '  (SELECT MAX(IDOPERACAOINVEST) AS IDOPERACAOINVEST, DECODE(OP.IDTIPOOPERACAO,-158,''CC'',''CCI'') AS TIPOSALDO, ' + #13 +
           '          OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO ' + #13 +
           '   FROM OPERACAOINVEST OP ' + #13 +
           '   WHERE (OP.IDTIPOOPERACAO IN (-158, -10158)) ' + #13 +
           '     AND (OP.DATAOPERACAO = TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'')) ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '     AND (OP.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '     AND (OP.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   if iPlanPrevOrig > 0 then
      sSQL := sSQL + '     AND (OP.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrevOrig) + ') ' + #13;
   sSQL := sSQL + '     AND OP.IDCARTEIRAGERENC IS NULL ' + #13 +
           '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO) OMO, ' + #13 +
           '   HISTCARTINV HCO, ' + #13 +
           '  (SELECT OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, ' + #13 +
           '          SUM(OP.QTDEOPERACAO) AS QTDTRANSFDEST, DECODE(OP.IDTIPOOPERACAO,-159,''CC'',''CCI'') AS TIPOSALDO, ' + #13 +
           '          OP.PERCENTUAL ' + #13 +
           '   FROM OPERACAOINVEST OP ' + #13 +
           '   WHERE (OP.IDTIPOOPERACAO IN (-159, -10159)) ' + #13 +
           '     AND (OP.DATAOPERACAO = TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'')) ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '     AND (OP.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '     AND (OP.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   sSQL := sSQL + '     AND OP.IDCARTEIRAGERENC IS NULL ' + #13 +
           '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO, OP.PERCENTUAL) OPD, ' + #13 +
           '  (SELECT MAX(IDOPERACAOINVEST) AS IDOPERACAOINVEST, DECODE(OP.IDTIPOOPERACAO,-158,''CC'',''CCI'') AS TIPOSALDO, ' + #13 +
           '          OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO ' + #13 +
           '   FROM OPERACAOINVEST OP ' + #13 +
           '   WHERE (OP.IDTIPOOPERACAO IN (-159, -10159)) ' + #13 +
           '     AND (OP.DATAOPERACAO = TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'')) ' + #13;
   if iInvestimento > 0 then
      sSQL := sSQL + '     AND (OP.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ') ' + #13;
   if iCarteira > 0 then
      sSQL := sSQL + '     AND (OP.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ') ' + #13;
   sSQL := sSQL + '     AND OP.IDCARTEIRAGERENC IS NULL ' + #13 +
           '   GROUP BY OP.IDPLANPREVCTBPATR, OP.IDCARTEIRAINVEST, OP.IDINVESTIMENTO, OP.DATAOPERACAO, OP.IDTIPOOPERACAO, OP.NUMDOCUMENTO) OMD, ' + #13 +
           '   HISTCARTINV HCD, INVESTIMENTO IV, CARTEIRAINVEST CA, VWPLANPREVCTBPATR PPO, VWPLANPREVCTBPATR PPD, ' + #13 +
           '  (SELECT HC.SALDOQTDECPMF, HC.SALDOQTDEINVCART, HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, ' + #13 +
           '          HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO ' + #13 +
           '   FROM HISTCARTINV HC ' + #13 +
           '   WHERE ' + #13 +
           '     HC.IDHISTCARTINV IN (SELECT MAX(HC1.IDHISTCARTINV) ' + #13 +
           '                          FROM HISTCARTINV HC1 ' + #13 +
           '                          WHERE ' + #13 +
           '                                HC1.IDTIPOINVEST   = 2  ' + #13 +
           '                            AND HC1.IDCARTEIRAGERENC IS NULL ' + #13 +
           '                            AND HC1.DATAMOVCARTINV = TO_DATE('+ QuotedStr(DateToStr(dDataAnt)) +',''DD/MM/YYYY'') ' + #13 +
           '                            AND HC1.TIPMOVCARTINV  = ''ATU'' ' + #13 +
           '                          GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANPREVCTBPATR, HC1.IDCARTEIRAINVEST, ' + #13 +
           '                                   HC1.IDCARTEIRAGERENC, HC1.IDINVESTIMENTO) ) HC3, ' + #13 +
           '  (SELECT HC.SALDOQTDECPMF, HC.SALDOQTDEINVCART, HC.IDTIPOINVEST, HC.IDPLANPREVCTBPATR, HC.IDCARTEIRAINVEST, ' + #13 +
           '          HC.IDCARTEIRAGERENC, HC.IDINVESTIMENTO ' + #13 +
           '   FROM HISTCARTINV HC ' + #13 +
           '   WHERE ' + #13 +
           '     HC.IDHISTCARTINV IN (SELECT MAX(HC1.IDHISTCARTINV) ' + #13 +
           '                          FROM HISTCARTINV HC1 ' + #13 +
           '                          WHERE ' + #13 +
           '                                HC1.IDTIPOINVEST   = 2 ' + #13 +
           '                            AND HC1.IDCARTEIRAGERENC IS NULL ' + #13 +
           '                            AND HC1.DATAMOVCARTINV = TO_DATE('+ QuotedStr(DateToStr(dDataAnt)) +',''DD/MM/YYYY'') ' + #13 +
           '                            AND HC1.TIPMOVCARTINV  = ''ATU'' ' + #13 +
           '                          GROUP BY HC1.IDTIPOINVEST, HC1.IDPLANPREVCTBPATR, HC1.IDCARTEIRAINVEST, ' + #13 +
           '                                   HC1.IDCARTEIRAGERENC, HC1.IDINVESTIMENTO) ) HC2 ' + #13 +
           'WHERE OMO.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR ' + #13 +
           '  AND OMO.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST ' + #13 +
           '  AND OMO.IDINVESTIMENTO     = OPO.IDINVESTIMENTO ' + #13 +
           '  AND OMO.DATAOPERACAO       = OPO.DATAOPERACAO ' + #13 +
           '  AND OMO.IDTIPOOPERACAO     = OPO.IDTIPOOPERACAO ' + #13 +
           '  AND OMO.NUMDOCUMENTO       = OPO.NUMDOCUMENTO ' + #13 +
           '  AND HCO.IDOPERACAOINVEST   = OMO.IDOPERACAOINVEST ' + #13 +
           '  AND OPD.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST ' + #13 +
           '  AND OPD.IDINVESTIMENTO     = OPO.IDINVESTIMENTO ' + #13 +
           '  AND OPD.DATAOPERACAO       = OPO.DATAOPERACAO ' + #13 +
           '  AND OPD.NUMDOCUMENTO       = OPO.NUMDOCUMENTO ' + #13 +
           '  AND OPD.TIPOSALDO          = OPO.TIPOSALDO ' + #13 +
           '  AND OMD.IDPLANPREVCTBPATR  = OPD.IDPLANPREVCTBPATR ' + #13 +
           '  AND OMD.IDCARTEIRAINVEST   = OPD.IDCARTEIRAINVEST ' + #13 +
           '  AND OMD.IDINVESTIMENTO     = OPD.IDINVESTIMENTO ' + #13 +
           '  AND OMD.DATAOPERACAO       = OPD.DATAOPERACAO ' + #13 +
           '  AND OMD.IDTIPOOPERACAO     = OPD.IDTIPOOPERACAO ' + #13 +
           '  AND OMD.NUMDOCUMENTO       = OPD.NUMDOCUMENTO ' + #13 +
           '  AND HCD.IDOPERACAOINVEST   = OMD.IDOPERACAOINVEST ' + #13 +
           '  AND IV.IDINVESTIMENTO      = OPO.IDINVESTIMENTO ' + #13 +
           '  AND CA.IDCARTEIRAINVEST    = OPO.IDCARTEIRAINVEST ' + #13 +
           '  AND PPO.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR ' + #13 +
           '  AND PPD.IDPLANPREVCTBPATR  = OPD.IDPLANPREVCTBPATR ' + #13 +
           '  AND HC3.IDPLANPREVCTBPATR  = OPO.IDPLANPREVCTBPATR ' + #13 +
           '  AND HC3.IDCARTEIRAINVEST   = OPO.IDCARTEIRAINVEST ' + #13 +
           '  AND HC3.IDINVESTIMENTO     = OPO.IDINVESTIMENTO ' + #13 +
           '  AND HC2.IDPLANPREVCTBPATR(+) = OPD.IDPLANPREVCTBPATR ' + #13 +
           '  AND HC2.IDCARTEIRAINVEST(+)  = OPD.IDCARTEIRAINVEST ' + #13 +
           '  AND HC2.IDINVESTIMENTO(+)    = OPD.IDINVESTIMENTO ' + #13 +
           'ORDER BY OPO.DATAOPERACAO, CA.DESCCARTINVEST, OPO.NUMDOCUMENTO, PPO.PLANPRVCONTABPATRO, PPD.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO ' + #13;
   //AL_16 - Fim
   Result := GetDataPacket(sSql);
   //AL_9 - Fim
end;

//AL_11
function TCtrlRendaVariavel.ListSaldosCarteirasRV(dDataRef: TDateTime;
                                                  iCarteira : Integer = -1;
                                                  iCarteiraGerenc: Integer = -1;
                                                  iPlanPrev : Integer = -1;
                                                  iInvestimento : Integer = -1;
                                                  iHistCartInv: Integer = high(integer);
                                                  sLote: String = '') : OleVariant;
var
   sSql : String;
   bPrimeiro: Boolean;
begin
   bPrimeiro := True;
   sSql :=
      'SELECT H1.IDHISTCARTINV, H1.IDCARTEIRAINVEST, H1.DATAMOVCARTINV,' + #13 +

      //AL_18
      '       H1.IDINVESTIMENTO, H1.IDPLANPREVCTBPATR,' + #13 +

      '       H1.SALDOVLRINVCART, H1.SALDOQTDECPMF, H1.SALDOQTDEINVCART,' + #13 +
      '       H1.SALDOAQUI, H1.SALDOVARIACAO, H1.SALDOPROVPERDA,' + #13 +
      '       H1.SALDOIRPROV, H1.SALDOIRAPU, H1.SALDOIOFPROV, H1.SALDOIOFAPU, ' + #13 +
      '       (H1.SALDOQTDEINVCART - H1.SALDOQTDECPMF) AS SALDOQTDECCI ' + #13 +
      'FROM HISTCARTINV H1, (SELECT IDTIPOOPERDIRDIV,IDTIPOOPERDIRJUR,IDTIPOOPERDIRMUL FROM PARAMINVEST) P1 ' + #13;

   // Filtra o PlanoPatro
   if iPlanPrev > 0 then
   begin
      sSql := sSql + 'WHERE (H1.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
      bPrimeiro := False;
   end;

   // Filtra a Carteira Própria
   if (iCarteira > 0) and (bPrimeiro) then
   begin
      sSql := sSql + 'WHERE (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
      bPrimeiro := False;
   end
   else
   if (iCarteira > 0) and (not bPrimeiro) then
      sSql := sSql + '  AND (H1.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

   //Filtra a Carteira Gerencial
   if iCarteiraGerenc > 0 then
   begin
      if bPrimeiro then
      begin
         sSql := sSql + 'WHERE (H1.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
         bPrimeiro := False;
      end
      else
         sSql := sSql + '  AND (H1.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
   end
   else
   begin
      if bPrimeiro then
      begin
         sSql := sSql + 'WHERE (H1.IDCARTEIRAGERENC IS NULL)' + #13;
         bPrimeiro := False;
      end
      else
         sSql := sSql + '  AND (H1.IDCARTEIRAGERENC IS NULL)' + #13;
   end;

   // Filtra o Investimento
   if (iInvestimento > 0) and (bPrimeiro) then
   begin
      sSql := sSql + 'WHERE (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
      bPrimeiro := False;
   end
   else
   if (iInvestimento > 0) and (not bPrimeiro) then
      sSql := sSql + '  AND (H1.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

   // Filtra o Lote
   if (sLote <> '') and (bPrimeiro) then
   begin
      sSql := sSql + 'WHERE (H1.IDLOTE = ' + sLote + ')' + #13;
      bPrimeiro := False;
   end
   else
   if (sLote <> '') and (not bPrimeiro) then
      sSql := sSql + '  AND (H1.IDLOTE = ' + sLote + ')' + #13;

   //AL_18
   if bPrimeiro then
   begin
      sSql := sSql +
      '  WHERE (H1.IDHISTCARTINV = ' + #13 +
      '          (SELECT MAX(H2.IDHISTCARTINV) ' + #13 +
      '           FROM HISTCARTINV H2 ';
   end
   else
   begin
      sSql := sSql +
      '  AND (H1.IDHISTCARTINV = ' + #13 +
      '          (SELECT MAX(H2.IDHISTCARTINV) ' + #13 +
      '           FROM HISTCARTINV H2 ';
   end;
   bPrimeiro := True;

   // Filtra o Plano Patro
   if iPlanPrev > 0 then
   begin
      sSql := sSql + '           WHERE (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
      bPrimeiro := False;
   end;

   // Filtra a Carteira Própria
   if (iCarteira > 0) and (bPrimeiro) then
   begin
      sSql := sSql + '           WHERE (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
      bPrimeiro := False;
   end
   else
   if (iCarteira > 0) and (not bPrimeiro) then
      sSql := sSql + '             AND (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

   // Filtra a Carteira Gerencial
   if iCarteiraGerenc > 0 then
   begin
      if bPrimeiro then
      begin
         sSql := sSql + '           WHERE (H2.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
         bPrimeiro := False;
      end
      else
         sSql := sSql + '             AND (H2.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
   end
   else
   begin
      if bPrimeiro then
      begin
         sSql := sSql + '           WHERE (H2.IDCARTEIRAGERENC IS NULL)' + #13;
         bPrimeiro := False;
      end
      else
         sSql := sSql + '             AND (H2.IDCARTEIRAGERENC IS NULL)' + #13;
   end;

   // Filtra o Investimento
   if (iInvestimento > 0) and (bPrimeiro) then
   begin
      sSql := sSql + '           WHERE (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
      bPrimeiro := False;
   end
   else
   if (iInvestimento > 0) and (not bPrimeiro) then
      sSql := sSql + '             AND (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

   // Filtra o Lote
   if (sLote <> '') and (bPrimeiro) then
   begin
      sSql := sSql + '           WHERE (H2.IDLOTE = ' + sLote + ')' + #13;
      bPrimeiro := False;
   end
   else
   if (sLote <> '') and (not bPrimeiro) then
      sSql := sSql + '             AND (H2.IDLOTE = ' + sLote + ')' + #13;

   sSql := sSql +
   '             AND (H2.DATAMOVCARTINV = ' + #13 +
   '                     (SELECT MAX(H3.DATAMOVCARTINV) ' + #13 +
   '                      FROM HISTCARTINV H3 ' + #13;

   bPrimeiro := True;
   // Filtra o Plano Patro
   if iPlanPrev > 0 then
   begin
      sSql := sSql + '                      WHERE (H3.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev)+ ')' + #13;
      bPrimeiro := False;
   end;

   // Filtra a Carteira Prõpria
   if (iCarteira > 0) and (bPrimeiro) then
   begin
      sSql := sSql + '                      WHERE (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;
      bPrimeiro := False;
   end
   else
   if (iCarteira > 0) and (not bPrimeiro) then
      sSql := sSql + '                        AND (H3.IDCARTEIRAINVEST = ' + IntToStr(iCarteira)+ ')' + #13;

   // Filtra a Carteira Gewrencial
   if iCarteiraGerenc > 0 then
   begin
      if bPrimeiro then
      begin
         sSql := sSql + '                      WHERE (H3.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
         bPrimeiro := False;
      end
      else
         sSql := sSql + '                        AND (H3.IDCARTEIRAGERENC = ' + IntToStr(iCarteiraGerenc)+ ')' + #13;
   end
   else
   begin
      if bPrimeiro then
      begin
         sSql := sSql + '                      WHERE (H3.IDCARTEIRAGERENC IS NULL)' + #13;
         bPrimeiro := False;
      end
      else
         sSql := sSql + '                        AND (H3.IDCARTEIRAGERENC IS NULL)' + #13;
   end;

   // Filtra o Investimento
   if (iInvestimento > 0) and (bPrimeiro) then
   begin
      sSql := sSql + '                      WHERE (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;
      bPrimeiro := False;
   end
   else
   if (iInvestimento > 0) and (not bPrimeiro) then
      sSql := sSql + '                        AND (H3.IDINVESTIMENTO = ' + IntToStr(iInvestimento)+ ')' + #13;

   // Filtra o Lote
   if (sLote <> '') and (bPrimeiro) then
   begin
      sSql := sSql + '                      WHERE (H3.IDLOTE = ' + sLote + ')' + #13;
      bPrimeiro := False;
   end
   else
   if (sLote <> '') and (not bPrimeiro) then
      sSql := sSql + '                        AND (H3.IDLOTE = ' + sLote + ')' + #13;

   // Filtra a Data
   if bPrimeiro then
      sSql := sSql + '                      WHERE ((H3.DATAMOVCARTINV   < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13
   else
      sSql := sSql + '                        AND ((H3.DATAMOVCARTINV   < TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) OR ' + #13;

   sSql := sSql +
   '                              ((H3.DATAMOVCARTINV = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') + ')) AND ' + #13 +
   '                                (H3.IDHISTCARTINV    < ' + IntToStr(iHistCartInv) + ' ))) ' + #13 +
   '                        AND ((H3.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000), ' + #13 +
   '                                                        NVL(P1.IDTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000), ' + #13 +
   '                                                        NVL(P1.IDTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000), ' + #13 +
   '                                                        -70, -10070)) OR ' + #13 +
   '                             (H3.IDTIPOOPERACAO IS NULL)) ' + #13 +
   '                     )' + #13 +
   '                 ) ' + #13 +
   '             AND ((H2.IDTIPOOPERACAO NOT IN (NVL(P1.IDTIPOOPERDIRDIV,0), (NVL(P1.IDTIPOOPERDIRDIV,0) + 10000), ' + #13 +
   '                                             NVL(P1.IDTIPOOPERDIRJUR,0), (NVL(P1.IDTIPOOPERDIRJUR,0) + 10000), ' + #13 +
   '                                             NVL(P1.IDTIPOOPERDIRMUL,0), (NVL(P1.IDTIPOOPERDIRMUL,0) + 10000), ' + #13 +
   '                                             -70, -10070)) OR ' + #13 +
   '                  (H2.IDTIPOOPERACAO IS NULL)) ' + #13 +
   '             AND (H2.IDHISTCARTINV < ' + IntToStr(iHistCartInv) + ') ' + #13 +
   '          ) ' + #13 +
   '      ) ' + #13 +
   '  AND (NVL(H1.SALDOQTDEINVCART,0) <> 0) ' + #13 +
   'ORDER BY H1.DATAMOVCARTINV DESC, H1.IDHISTCARTINV DESC ';

   Result := GetDataPacket(sSQL);
end;

//AL_11
function TCtrlRendaVariavel.BuscaSldTRCCCeCCISintetico(dDataRef: TDateTime;
                                                       iCarteira : Integer = -1;
                                                       iPlanPrev : Integer = -1;
                                                       iTipoOperacao : Integer = -1;
                                                       iInvestimento : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   // Traz os Saldos sintético por Cart. Propria / Cart. Gerenciais
   sSql := '';
   sSql := sSql + ' SELECT ';
   sSql := sSql + '    ''01.01.1899'' AS DATAOPERACAO, ';
   sSql := sSql + '    CA.DESCCARTINVEST, ';
   sSql := sSql + '    IV.DESCINVESTIMENTO, ';
   sSql := sSql + '    CA.IDCARTEIRAINVEST, ';
   sSql := sSql + '    IV.IDINVESTIMENTO, ';
   sSql := sSql + '    IV.IDEMISSOR, ';
   sSql := sSql + '    (H1.IDPLANPREVCTBPATR) AS IDPLANPREVCTBORIG, ';
   sSql := sSql + '    (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0)) AS SALDOQTDECCI, ';
   sSql := sSql + '    NVL(H1.SALDOQTDECPMF,0) AS SALDOQTDECC, ';
   sSql := sSql + '    DECODE((NVL(H1.SALDOQTDEINVCART,0)), 0, 0, (NVL(H1.SALDOVLRINVCART,0))) AS SALDOVLRINVCART,';
   sSql := sSql + '    NVL(H1.SALDOQTDEINVCART,0) AS SALDOQTDEINVCART, ';
   sSql := sSql + '    0 AS PERCTRANSFERIDO, ';
   sSql := sSql + '    0 AS VLRTRANSFERIDO, ';
   sSql := sSql + '    0 AS QTDTRANSFERIDOCC, ';
   sSql := sSql + '    0 AS QTDTRANSFERIDOCCI, ';
   sSql := sSql + '    0 AS SALDOQTDECCIATU, ';
   sSql := sSql + '    0 AS SALDOQTDECCATU ';
   sSql := sSql + ' FROM ';
   sSql := sSql + '    HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA ';
   sSql := sSql + ' WHERE ';
   sSql := sSql + '    (H1.IDHISTCARTINV IN (SELECT MAX(H2.IDHISTCARTINV) ';
   sSql := sSql + '                          FROM HISTCARTINV H2, PARAMINVEST P2 ';
   sSql := sSql + '                          WHERE ';
   sSql := sSql + '                             (H2.IDTIPOINVEST = 2) ';
   //AL_9 - Ini
   if iPlanPrev > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ';
   if iCarteira > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ';
   if iInvestimento > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ';
   //AL_9 - Fim
   sSql := sSql + '                             AND (H2.IDCARTEIRAGERENC IS NULL) ';
   sSql := sSql + '                             AND (H2.DATAMOVCARTINV  = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'')) ';
   sSql := sSql + '                             AND (H2.IDTIPOOPERACAO NOT IN (NVL(P2.IDTIPOOPERDIRDSU,0), (NVL(P2.IDTIPOOPERDIRDSU,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRJUR,0), (NVL(P2.IDTIPOOPERDIRJUR,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRMUL,0), (NVL(P2.IDTIPOOPERDIRMUL,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRDIV,0), (NVL(P2.IDTIPOOPERDIRDIV,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERRFRAC ,0), (NVL(P2.IDTIPOOPERRFRAC ,0) + 10000))) ';
   sSql := sSql + '                          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO)) ';

   //William M. Santos - Sol 130690/1002 Kintana 754042 - 11/03/2010 - INI
   //sSql := sSql + '   AND (H1.SALDOVLRINVCART > 0) ';
   sSql := sSql + '   AND (H1.SALDOQTDEINVCART > 0) ';
   //William M. Santos - Sol 130690/1002 Kintana 754042 - 11/03/2010 - FIM

   if iTipoOperacao = -162 then // TRC CC para CCI
      sSql := sSql + '   AND (H1.SALDOQTDECPMF > 0) '
   else if iTipoOperacao = -163 then // TRC CCI para CC
      sSql := sSql + '   AND ((NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0))  > 0 )';
   sSql := sSql + '   AND (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO(+)) ';
   sSql := sSql + '   AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)) ';
   sSql := sSql + '   ORDER BY H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC ';

   Result := GetDataPacket(sSql);

end;

//AL_11
function TCtrlRendaVariavel.BuscaSldTRCCCeCCIAnalitico(dDataRef: TDateTime;
                                                       iInvestimento : Integer = -1;
                                                       iPlanPrev : Integer = -1;
                                                       iCarteira : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + ' SELECT ';
   sSql := sSql + '    ''01.01.1899'' AS DATAOPERACAO, ' + #13;
   sSql := sSql + '    0 AS SALDOQTDECCI, ' + #13;
   sSql := sSql + '    0 AS SALDOQTDECC, ' + #13;
   sSql := sSql + '    0 AS SALDOVLRINVCART, ' + #13;
   sSql := sSql + '    0 AS PERCTRANSFERIDO, ' + #13;
   sSql := sSql + '    0 AS QTDTRANSFERIDO, ' + #13;
   sSql := sSql + '    0 AS VLRTRANSFERIDO, ' + #13;
   sSql := sSql + '    H1.IDPLANPREVCTBPATR, ' + #13;
   sSql := sSql + '    IV.IDINVESTIMENTO, ';
   sSql := sSql + '    IV.IDEMISSOR, ';
   sSql := sSql + '    IV.DESCINVESTIMENTO, CA.DESCCARTINVEST, ' + #13;
   sSql := sSql + '    H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC, H1.IDINVESTIMENTO ' + #13;
   sSql := sSql + ' FROM ';
   sSql := sSql + '    HISTCARTINV H1, INVESTIMENTO IV, CARTEIRAINVEST CA ';
   sSql := sSql + ' WHERE ';
   sSql := sSql + '    (H1.IDHISTCARTINV IN (SELECT MAX(H2.IDHISTCARTINV) ';
   sSql := sSql + '                          FROM HISTCARTINV H2, PARAMINVEST P2 ';
   sSql := sSql + '                          WHERE ';
   sSql := sSql + '                             (H2.IDTIPOINVEST = 2) ';
   if iPlanPrev > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (H2.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ';
   if iCarteira > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (H2.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ';
   if iInvestimento > 0 then
      sSql := sSql + '                       AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (H2.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ';
   sSql := sSql + '                             AND (H2.DATAMOVCARTINV  = TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'')) ';
   sSql := sSql + '                             AND (H2.IDTIPOOPERACAO NOT IN (NVL(P2.IDTIPOOPERDIRDSU,0), (NVL(P2.IDTIPOOPERDIRDSU,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRJUR,0), (NVL(P2.IDTIPOOPERDIRJUR,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRMUL,0), (NVL(P2.IDTIPOOPERDIRMUL,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERDIRDIV,0), (NVL(P2.IDTIPOOPERDIRDIV,0) + 10000), ';
   sSql := sSql + '                                                            NVL(P2.IDTIPOOPERRFRAC ,0), (NVL(P2.IDTIPOOPERRFRAC ,0) + 10000))) ';
   sSql := sSql + '                          GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.IDCARTEIRAGERENC)) ';

   //William M. Santos - Sol 130690/1002 Kintana 754042 - 11/03/2010 - INI
   //sSql := sSql + '   AND (H1.SALDOVLRINVCART > 0) ';
   sSql := sSql + '   AND (H1.SALDOQTDEINVCART > 0) ';
   //William M. Santos - Sol 130690/1002 Kintana 754042 - 11/03/2010 - FIM
   
   sSql := sSql + '   AND (H1.IDINVESTIMENTO   = IV.IDINVESTIMENTO(+)) ';
   sSql := sSql + '   AND (H1.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+)) ';
   sSql := sSql + '   ORDER BY H1.IDCARTEIRAINVEST, H1.IDCARTEIRAGERENC ';

   Result := GetDataPacket(sSql);
end;

//AL_11
function TCtrlRendaVariavel.BuscaOperBoletaTRCCCeCCI(sBoleta : String) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + ' SELECT ';
   sSql := sSql + '   OP.IDOPERACAOINVEST, OP.DATAOPERACAO, OP.NUMDOCUMENTO, OP.IDINVESTIMENTO, ';
   sSql := sSql + '   OP.IDCARTEIRAINVEST, (OP.IDPLANPREVCTBPATR) AS IDPLANOPATROORIG ';
   sSql := sSql + ' FROM ';
   sSql := sSql + '    OPERACAOINVEST OP ';
   sSql := sSql + ' WHERE ';
   sSql := sSql + '    (OP.NUMDOCUMENTO = ' + QuotedStr(sBoleta) + ') ';
   sSql := sSql + '    AND (OP.IDTIPOOPERACAO IN (-162, -163)) ';
   sSql := sSql + '    AND (OP.IDCARTEIRAGERENC IS NULL) ';
   sSql := sSql + ' ORDER BY OP.DATAOPERACAO, OP.NUMDOCUMENTO ';

   Result := GetDataPacket(sSql);
end;

//AL_11
function TCtrlRendaVariavel.ListOperTrcCCeCCI(dDataIni : TDateTime = 0;
                                              dDataFim : TDateTime = 0;
                                              iInvestimento : Integer = -1;
                                              iCarteira : Integer = -1;
                                              iPlanPrev : Integer = -1;
                                              iTipoOper : Integer = -1) : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + ' SELECT OP.IDTIPOOPERACAO, OP.DATAOPERACAO, OP.NUMDOCUMENTO, OP.QTDEOPERACAO, ';
   sSql := sSql + '    OP.IDINVESTIMENTO, OP.IDCARTEIRAINVEST, OP.PERCENTUAL, OP.IDCARTEIRAGERENC, ';
   sSql := sSql + '    OP.IDPLANPREVCTBPATR, CA.DESCCARTINVEST, PPO.PLANPRVCONTABPATRO, IV.DESCINVESTIMENTO, TP.DESCTIPOOPERACAO ';
   sSql := sSql + 'FROM OPERACAOINVEST OP, CARTEIRAINVEST CA, VWPLANPREVCTBPATR PPO, INVESTIMENTO IV, TIPOOPERACAO TP ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '   (OP.IDTIPOOPERACAO IN (-162,-163)) ';
   sSql := sSql + '   AND (OP.IDCARTEIRAGERENC IS NULL) ';
   sSql := sSql + '   AND (OP.DATAOPERACAO BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDataIni)) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DateToStr(dDataIni)) +',''DD/MM/YYYY'')) ';
   if iInvestimento  <> -1 then
      //AL_12
      sSql := sSql + ' AND ((' + IntToStr(iInvestimento) + ' IS NULL) OR (OP.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' )) ';
   if iPlanPrev <> -1 then
      sSql := sSql + ' AND ((' + IntToStr(iPlanPrev) + ' IS NULL) OR (PPO.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' )) ';
   if iTipoOper <> -1 then
      sSql := sSql + ' AND ((' + IntToStr(iTipoOper) + ' IS NULL) OR (TP.IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ' )) ';
   if iCarteira > 0 then
      sSql := sSql + ' AND ((' + IntToStr(iCarteira) + ' IS NULL) OR (CA.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' )) ';
   sSql := sSql + '   AND (OP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST) ';
   sSql := sSql + '   AND (OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR) ';
   sSql := sSql + '   AND (OP.IDINVESTIMENTO = IV.IDINVESTIMENTO) ';
   sSql := sSql + '   AND (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO) ';
   sSql := sSql + 'ORDER BY OP.DATAOPERACAO, PPO.PLANPRVCONTABPATRO, CA.DESCCARTINVEST, TP.DESCTIPOOPERACAO, OP.NUMDOCUMENTO, IV.DESCINVESTIMENTO, OP.IDOPERACAOINVEST ';
   Result := GetDataPacket(sSql);
end;

//Ricardo Cristiano - 07/08/2008 - N. Sol 92857 -  N. Kintana 396741
function TCtrlRendaVariavel.AplicaAtualMarcaFlagReprocMenor(dDataRef, dDataAno : TDateTime;
                                                            var iRegAff : Integer;
                                                            iICarteiraInvest, iIdPlanPrevCtbPatro, iInvestimento : Integer): Boolean;

Var
  bTransacao : Boolean;
  sSql: String;
  //Ricardo Cristiano - 29/05/2009 - N. Sol 118375 -  N. Kintana 561761
  CdsAux, CdsSaldoAux : TClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualMarcaFlagReprocMenor(dDataRef, iRegAff, iICarteiraInvest, iIdPlanPrevCtbPatro, iInvestimento);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      Try
         iRegAff := 0;
         CdsAux  := TClientDataSet.Create(nil);
         //Ricardo Cristiano - 29/05/2009 - N. Sol 118375 -  N. Kintana 561761
         CdsSaldoAux := TClientDataSet.Create(nil);
         Try
            bTransacao := False;
            if not InTransaction then
            begin
               bTransacao := True;
               StartTransaction;
            end;

           sSql:='';
           sSql:= sSql + ('');
           sSql:= sSql + ('DECLARE ');
           sSql:= sSql + ('BEGIN ');
           sSql:= sSql + ('FOR X IN ( ');
           sSql:= sSql + ('SELECT H.SALDOQTDEINVCART, H.IDHISTCARTINV ');
           sSql:= sSql + ('FROM HISTCARTINV H, ');
           sSql:= sSql + ('    (SELECT MAX(H2.IDHISTCARTINV) AS IDHISTCARTINV ');
           //Ricardo Cristiano - 08/12/2011 - N. Sol 170047 -  N. Kintana 1512695
           sSql:= sSql + ('            FROM HISTCARTINV H2, PARAMINVEST P ');
           sSql:= sSql + ('            WHERE ');
           sSql:= sSql + ('                  ((H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.DATAMOVCARTINV) IN ');
           sSql:= sSql + ('                          (SELECT H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO, MAX(H3.DATAMOVCARTINV) ');
           sSql:= sSql + ('                           FROM HISTCARTINV H3 ');
           sSql:= sSql + ('                           WHERE (H3.IDTIPOINVEST = 2) ');
           if iIdPlanPrevCtbPatro > 0 then
              sSql:= sSql + ('                             AND (H3.IDPLANPREVCTBPATR = '+IntToStr(iIdPlanPrevCtbPatro)+')');
           if iICarteiraInvest > 0 then
              sSql:= sSql + ('                             AND (H3.IDCARTEIRAINVEST  = '+IntToStr(iICarteiraInvest)+')');
           if iInvestimento > 0 then
              sSql:= sSql + ('                             AND (H3.IDINVESTIMENTO = '+IntToStr(iInvestimento)+')');
           sSql:= sSql + ('                             AND ((H3.DATAMOVCARTINV >= TO_DATE('+QuotedStr(DateToStr(dDataAno))+','+QuotedStr('DD/MM/YYYY')+') )');
           sSql:= sSql + ('                             AND  (H3.DATAMOVCARTINV < TO_DATE('+QuotedStr(DateToStr(dDataRef))+','+QuotedStr('DD/MM/YYYY')+') ) )');
           sSql:= sSql + ('                             AND (H3.IDCARTEIRAGERENC IS NULL)');
           sSql:= sSql + ('                           GROUP BY H3.IDTIPOINVEST, H3.IDPLANPREVCTBPATR, H3.IDCARTEIRAINVEST, H3.IDINVESTIMENTO))');
           sSql:= sSql + ('              AND (H2.IDCARTEIRAGERENC IS NULL)');
           //Ricardo Cristiano - 08/12/2011 - N. Sol 170047 -  N. Kintana 1512695
           sSql:= sSql + ('              AND (H2.IDTIPOOPERACAO NOT IN (P.IDTIPOOPERDIRDIV, P.IDTIPOOPERDIRDIV+10000,P.IDTIPOOPERDIRJUR, P.IDTIPOOPERDIRJUR+10000,-70,-71,-10070,-10071)) ');
           sSql:= sSql + ('     GROUP BY H2.IDTIPOINVEST, H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO, H2.DATAMOVCARTINV) HM ');
           sSql:= sSql + ('WHERE H.IDHISTCARTINV = HM.IDHISTCARTINV ');
           sSql:= sSql + ('AND   H.SALDOQTDEINVCART > 0) LOOP ');
           sSql:= sSql + ('UPDATE cm.HISTCARTINV SET HISTCARTINV.FLGCALCSALDO = ''5'' WHERE HISTCARTINV.IDHISTCARTINV = X.IDHISTCARTINV; ');
           sSql:= sSql + ('END LOOP; END; ');

           if ExecSQL(sSql, True) then 
              iRegAff := 1;

           //Ricardo Cristiano - 06/11/2010 - N. Sol 147252 -  N. Kintana 1014147   
           if iRegAff <= 0 then
           begin
              sSql := '';
              sSql:= 'SELECT HISTCARTINV.IDHISTCARTINV FROM HISTCARTINV ';
              sSql:= sSql + 'WHERE (HISTCARTINV.IDTIPOINVEST = 2) ';
              if iIdPlanPrevCtbPatro > 0 then
                 sSql:= sSql + ' AND  (HISTCARTINV.IDPLANPREVCTBPATR = '+IntToStr(iIdPlanPrevCtbPatro)+')';
              if iICarteiraInvest > 0 then
                 sSql:= sSql + ' AND  (HISTCARTINV.IDCARTEIRAINVEST  = '+IntToStr(iICarteiraInvest)+')';
              if iInvestimento > 0 then
                 sSql:= sSql + ' AND  (HISTCARTINV.IDINVESTIMENTO = '+IntToStr(iInvestimento)+')';
              sSql:= sSql + ' AND ((HISTCARTINV.DATAMOVCARTINV >= TO_DATE('+QuotedStr(DateToStr(dDataAno))+','+QuotedStr('DD/MM/YYYY')+') )';
              sSql:= sSql + ' AND  (HISTCARTINV.DATAMOVCARTINV <  TO_DATE('+QuotedStr(DateToStr(dDataRef))+','+QuotedStr('DD/MM/YYYY')+') ) )';
              sSql:= sSql + ' AND  (HISTCARTINV.IDCARTEIRAGERENC IS NULL)';
              sSql:= sSql + ' AND  (HISTCARTINV.FLGCALCSALDO = ''5'') ';
              CdsAux.Data := GetDataPacket(sSql);
              iRegAff := CdsAux.RecordCount;
              CdsAux.Close;
           end;

           if bTransacao then
              Commit;

           Result := True;                
         except
            on E:Exception do
            begin
               Result := False;
               MessageInfo := E.Message;
               if bTransacao then
                  Rollback;
            end;
         end;
      finally
         FreeAndNil(CdsAux);
         //Ricardo Cristiano - 29/05/2009 - N. Sol 118375 -  N. Kintana 561761
         FreeAndNil(CdsSaldoAux);
      end;
   end;
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
function TCtrlRendaVariavel.BuscaDirTRCPlanoSintetico(dDataRef  : TDateTime;
                                                      iTipoOper : Integer = -1;
                                                      iPlanPrev : Integer = -1;
                                                      iCarteira : Integer = -1;
                                                      sTipoDir  : String  = '') : OleVariant;
var
   sSql : String;
begin
   sSql := '';
   if sTipoDir = 'A' then
   begin
      sSql := sSql + ' SELECT ''01.01.1899'' AS DATAOPERACAO, '+#13;
      sSql := sSql + '        TR.PLANPRVCONTABPATRO, '+#13;
      sSql := sSql + '        TR.DESCTIPOOPERACAO, '+#13;
      sSql := sSql + '        TR.DESCCARTINVEST, '+#13;
      sSql := sSql + '        TR.DESCINVESTIMENTO, '+#13;
      sSql := sSql + '        TR.SGLCUSTODIANTE, '+#13;
      sSql := sSql + '        TR.SIGLAMOTBLOQ, '+#13;
      sSql := sSql + '        TR.QTDPREVISTA AS QTD, '+#13;
      sSql := sSql + '        TRUNC(TR.DATAEX) AS DATAEX, '+#13;
      sSql := sSql + '        TRUNC(TR.DATAPREV) AS DATAPREV, '+#13;
      sSql := sSql + '        TRUNC(TR.DTBASE) AS DTBASE, '+#13;
      sSql := sSql + '        TRUNC(TR.DATAAGE) AS DATAAGE, '+#13;
      sSql := sSql + '        TR.IDTIPOOPERACAO, TR.IDOPERACAODIREITO, TR.IDINVESTIMENTO, TR.IDFORCLI, TR.IDOPERACAOINVEST,'+#13;
      sSql := sSql + '        TR.IDCUSTODIANTE, TR.IDMOTIVOBLOQUEIO, TR.IDCARTEIRAINVEST, TR.IDCARTEIRAGERENC, '+#13;
      sSql := sSql + '        TR.IDOPERACAOORIGEM, '+#13;
      //Ricardo Cristiano - 11/11/2010 - N. Sol 147412 -  N. Kintana 1019370
      sSql := sSql + '        TR.PRECOUNITOPERACAO AS PU, '+#13;
      sSql := sSql + '       (TR.VLROPERACAO+TR.VLRREMUNERACAO) AS VALOR, '+#13;
      sSql := sSql + '        0 AS PERCTRANSFERIDO, '+#13;
      sSql := sSql + '        0  AS QTDTRANSFERIDO, '+#13;
      sSql := sSql + '        0  AS VLRTRANSFERIDO '+#13;
      sSql := sSql + ' FROM (SELECT PP.PLANPRVCONTABPATRO, TP.DESCTIPOOPERACAO, '+#13;
      sSql := sSql + '              OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREV, OD.DATAEX AS DTBASE, OD.DATAAGE, '+#13;
      sSql := sSql + '              IV.DESCINVESTIMENTO, OI.IDTIPOOPERACAO, OD.IDOPERACAODIREITO, IV.IDINVESTIMENTO, '+#13;
      sSql := sSql + '              OI.IDCUSTODIANTE, OI.IDMOTIVOBLOQUEIO, OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, '+#13;
      sSql := sSql + '              OI.IDFORCLI, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIGEM, '+#13;
      sSql := sSql + '              NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA, '+#13;
      sSql := sSql + '              NVL(OI.VLROPERACAO,0) AS VALORPREVISTO, '+#13;
      sSql := sSql + '              NVL(REC.QTDEOPERACAO,0) AS QTDRECEBIDA, '+#13;
      sSql := sSql + '              NVL(CAN.QTDEOPERACAO,0) AS QTDCANCELADA, '+#13;
      sSql := sSql + '              OI.PRECOUNITOPERACAO, '+#13;
      sSql := sSql + '             (NVL(OI.VLROPERACAO,0)) - NVL(REC.QTDEOPERACAO,0) - NVL(CAN.QTDEOPERACAO,0) AS VLROPERACAO, '+#13;
      sSql := sSql + '              NVL(OI.VLRREMUNERACAO,0) AS VLRREMUNERACAO, '+#13;
      sSql := sSql + '              CI.DESCCARTINVEST, CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ '+#13;
      sSql := sSql + '       FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI, TIPOOPERACAO TP, INVESTIMENTO IV, '+#13;
      sSql := sSql + '            VWPLANPREVCTBPATR PP, CARTEIRAINVEST CI, CUSTODIANTE CT, '+#13;
      sSql := sSql + '            (SELECT OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM, SUM(OIR.VLROPERACAO) AS QTDEOPERACAO '+#13;
      sSql := sSql + '             FROM OPERACAOINVEST OIR, PARAMINVEST PIR '+#13;
      sSql := sSql + '             WHERE OIR.IDOPERACAOORIGEM IS NOT NULL '+#13;
      sSql := sSql + '               AND OIR.IDTIPOOPERACAO IN (PIR.IDTIPOOPERDIRDIV, PIR.IDTIPOOPERDIRDIV + 10000, '+#13;
      sSql := sSql + '                                          PIR.IDTIPOOPERDIRJUR, PIR.IDTIPOOPERDIRJUR + 10000) '+#13;
      sSql := sSql + '               AND OIR.DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') '+#13;
      sSql := sSql + '             GROUP BY OIR.IDOPERACAODIREITO, OIR.IDOPERACAOORIGEM) REC, '+#13;
      sSql := sSql + '            (SELECT OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM, SUM(OIC.VLROPERACAO) AS QTDEOPERACAO '+#13;
      sSql := sSql + '             FROM OPERACAOINVEST OIC '+#13;
      sSql := sSql + '             WHERE OIC.IDOPERACAOORIGEM IS NOT NULL '+#13;
      sSql := sSql + '               AND OIC.IDTIPOOPERACAO IN (-170, -10170) '+#13;
      sSql := sSql + '               AND OIC.DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') '+#13;
      sSql := sSql + '             GROUP BY OIC.IDOPERACAODIREITO, OIC.IDOPERACAOORIGEM) CAN, '+#13;
      sSql := sSql + '             MOTIVOBLOQUEIO MB '+#13;
      sSql := sSql + '       WHERE OI.IDCARTEIRAGERENC IS NULL '+#13;
      sSql := sSql + '         AND OI.IDTIPOOPERACAO IN (-70, -10070) '+#13;
      sSql := sSql + '         AND OI.ORIGDEST IS NOT NULL '+#13;
      sSql := sSql + '         AND OI.DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') '+#13;
      sSql := sSql + '         AND OI.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' '+#13;
      sSql := sSql + '         AND OI.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' '+#13;
      sSql := sSql + '         AND OD.IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ' '+#13;
      sSql := sSql + '         AND OD.IDTIPOOPERACAO IN (PI.IDTIPOOPERDIRDIV, PI.IDTIPOOPERDIRJUR, PI.IDTIPOOPERDIRDIV+10000, PI.IDTIPOOPERDIRJUR+10000) '+#13;
      sSql := sSql + '         AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO '+#13;
      sSql := sSql + '         AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO '+#13;
      sSql := sSql + '         AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO '+#13;
      sSql := sSql + '         AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR '+#13;
      sSql := sSql + '         AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST '+#13;
      sSql := sSql + '         AND OI.IDCUSTODIANTE = CT.IDCUSTODIANTE '+#13;
      sSql := sSql + '         AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO '+#13;
      sSql := sSql + '         AND OI.IDOPERACAOINVEST = REC.IDOPERACAOORIGEM(+) '+#13;
      sSql := sSql + '         AND OI.IDOPERACAODIREITO = REC.IDOPERACAODIREITO(+) '+#13;
      sSql := sSql + '         AND OI.IDOPERACAOINVEST = CAN.IDOPERACAOORIGEM(+) '+#13;
      sSql := sSql + '         AND OI.IDOPERACAODIREITO = CAN.IDOPERACAODIREITO(+) '+#13;
      sSql := sSql + '         AND NVL(OI.VLROPERACAO,0) > (NVL(REC.QTDEOPERACAO,0) + NVL(CAN.QTDEOPERACAO,0)) '+#13;
      sSql := sSql + '         AND ((NVL(OD.STATUS,''P'') <> ''T'') OR '+#13;
      sSql := sSql + '             ((EXISTS(SELECT OI2.DATAOPERACAO '+#13;
      sSql := sSql + '                      FROM OPERACAOINVEST OI2 '+#13;
      sSql := sSql + '                      WHERE OI2.IDOPERACAODIREITO = OI.IDOPERACAODIREITO '+#13;
      sSql := sSql + '                        AND OI2.IDTIPOOPERACAO NOT IN (-10, -10070) '+#13;
      sSql := sSql + '                        AND OI2.DATAOPERACAO > TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') ))))  ) TR '+#13;
      sSql := sSql + ' WHERE (TR.VLROPERACAO > 0) '+#13;
   end
   else
   begin
      sSql := sSql + ' SELECT ''01.01.1899'' AS DATAOPERACAO, '+#13;
      sSql := sSql + '        TR.PLANPRVCONTABPATRO, '+#13;
      sSql := sSql + '        TR.DESCTIPOOPERACAO, '+#13;
      sSql := sSql + '        TR.DESCCARTINVEST, '+#13;
      sSql := sSql + '        TR.DESCINVESTIMENTO, '+#13;
      sSql := sSql + '        TR.SGLCUSTODIANTE, '+#13;
      sSql := sSql + '        TR.SIGLAMOTBLOQ, '+#13;
      sSql := sSql + '        TR.QTDPREVISTA AS QTD, '+#13;
      sSql := sSql + '        TRUNC(TR.DATAEX) AS DATAEX, '+#13;
      sSql := sSql + '        TRUNC(TR.DATAPREV) AS DATAPREV, '+#13;
      sSql := sSql + '        TRUNC(TR.DTBASE) AS DTBASE, '+#13;
      sSql := sSql + '        TRUNC(TR.DATAAGE) AS DATAAGE, '+#13;
      sSql := sSql + '        TR.IDTIPOOPERACAO, TR.IDOPERACAODIREITO, TR.IDINVESTIMENTO, TR.IDFORCLI, TR.IDOPERACAOINVEST,'+#13;
      sSql := sSql + '        TR.IDCUSTODIANTE, TR.IDMOTIVOBLOQUEIO, TR.IDCARTEIRAINVEST, TR.IDCARTEIRAGERENC, '+#13;
      sSql := sSql + '        TR.IDOPERACAOORIGEM, '+#13;      
      sSql := sSql + '        ROUND((TR.VLROPERACAO/TR.QTDPREVISTA),15) AS PU, '+#13;
      sSql := sSql + '        TR.VLROPERACAO AS VALOR, '+#13;
      sSql := sSql + '        0 AS PERCTRANSFERIDO, '+#13;
      sSql := sSql + '        0  AS QTDTRANSFERIDO, '+#13;
      sSql := sSql + '        0  AS VLRTRANSFERIDO '+#13;
      sSql := sSql + ' FROM (SELECT PP.PLANPRVCONTABPATRO, TP.DESCTIPOOPERACAO, '+#13;
      sSql := sSql + '              OD.DATAOPER AS DATAEX, OD.DATACOM AS DATAPREV, OD.DATAEX AS DTBASE, OD.DATAAGE, '+#13;
      sSql := sSql + '              IV.DESCINVESTIMENTO, OI.IDTIPOOPERACAO, OD.IDOPERACAODIREITO, IV.IDINVESTIMENTO, '+#13;
      sSql := sSql + '              OI.IDCUSTODIANTE, OI.IDMOTIVOBLOQUEIO, OI.IDCARTEIRAINVEST, OI.IDCARTEIRAGERENC, '+#13;
      sSql := sSql + '              OI.IDFORCLI, OI.IDOPERACAOINVEST, OI.IDOPERACAOORIGEM, '+#13;
      sSql := sSql + '              NVL(OI.QTDEOPERACAO,0) AS QTDPREVISTA, '+#13;
      sSql := sSql + '              NVL(OI.VLROPERACAO,0) AS VALORPREVISTO, '+#13;
      sSql := sSql + '              OI.PRECOUNITOPERACAO, '+#13;
      sSql := sSql + '             NVL(OI.VLROPERACAO,0) AS VLROPERACAO, '+#13;
      sSql := sSql + '              NVL(OI.VLRREMUNERACAO,0) AS VLRREMUNERACAO, '+#13;
      sSql := sSql + '              CI.DESCCARTINVEST, CT.SGLCUSTODIANTE, MB.SIGLAMOTBLOQ '+#13;
      sSql := sSql + '       FROM OPERACAOINVEST OI, OPERACAODIREITO OD, PARAMINVEST PI, TIPOOPERACAO TP, INVESTIMENTO IV, '+#13;
      sSql := sSql + '            VWPLANPREVCTBPATR PP, CARTEIRAINVEST CI, CUSTODIANTE CT, '+#13;
      sSql := sSql + '             MOTIVOBLOQUEIO MB '+#13;
      sSql := sSql + '       WHERE OI.IDCARTEIRAGERENC IS NULL '+#13;
      sSql := sSql + '         AND OI.ORIGDEST = ''D'' '+#13;
      sSql := sSql + '         AND OI.DATAOPERACAO <= TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') '+#13;
      sSql := sSql + '         AND OI.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' '+#13;
      sSql := sSql + '         AND OI.IDCARTEIRAINVEST = ' + IntToStr(iCarteira) + ' '+#13;
      sSql := sSql + '         AND OD.IDTIPOOPERACAO = ' + IntToStr(iTipoOper) + ' '+#13;
      sSql := sSql + '         AND TP.IDTIPOINVEST = 2 '+#13;
      sSql := sSql + '         AND OI.IDOPERACAODIREITO = OD.IDOPERACAODIREITO '+#13;
      sSql := sSql + '         AND OD.IDTIPOOPERACAO = TP.IDTIPOOPERACAO '+#13;
      sSql := sSql + '         AND OI.IDINVESTIMENTO = IV.IDINVESTIMENTO '+#13;
      sSql := sSql + '         AND OI.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR '+#13;
      sSql := sSql + '         AND OI.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST '+#13;
      sSql := sSql + '         AND OI.IDCUSTODIANTE = CT.IDCUSTODIANTE '+#13;
      sSql := sSql + '         AND OI.IDMOTIVOBLOQUEIO = MB.IDMOTIVOBLOQUEIO '+#13;
      sSql := sSql + '         AND OD.DATAVENCIMENTO > TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'') '+#13;
      sSql := sSql + '         AND (NOT EXISTS(SELECT OI2.DATAOPERACAO '+#13;
      sSql := sSql + '                         FROM OPERACAOINVEST OI2 '+#13;
      sSql := sSql + '                         WHERE OI2.IDOPERACAODIREITO = OI.IDOPERACAODIREITO '+#13;
      sSql := sSql + '                           AND OI2.IDTIPOOPERACAO IN (-114, -10114) '+#13;
      sSql := sSql + '                           AND OI2.DATAOPERACAO > TO_DATE(' + QuotedStr(DateToStr(dDataRef)) +',''DD/MM/YYYY'')) ) ) TR '+#13;
   end;
   sSql := sSql + ' ORDER BY TR.PLANPRVCONTABPATRO, TR.DESCINVESTIMENTO, TR.DATAEX, TR.DATAAGE, TR.DESCTIPOOPERACAO '+#13;
   Result := GetDataPacket(sSql);
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
function TCtrlRendaVariavel.ListOperDirTransf(iOperDirTransf   : Integer = -1;
                                              iOperacaoDireito : Integer = -1;
                                              iTipoOperacao    : Integer = 0;
                                              iInvestimento    : Integer = -1;
                                              dDataOperacao    : TDateTime = 0): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT  OD.* ';
   sSql := sSql + 'FROM OPERDIRTRANSF OD ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 2';
   if iOperDirTransf <> -1 then
      sSql := sSql + '  AND OD.IDOPERDIRTRANSF = ' + IntToStr(iOperDirTransf);
   if iOperacaoDireito <> -1 then
      sSql := sSql + '  AND OD.IDOPERACAODIREITO = ' + IntToStr(iOperacaoDireito);
   if iInvestimento <> -1 then
      sSql := sSql + '  AND OD.IDINVESTORIG = ' + IntToStr(iInvestimento);
   if iTipoOperacao <> 0 then
      sSql := sSql + '  AND OD.IDTIPOOPERACAO = ' + IntToStr(iTipoOperacao);
   if dDataOperacao <> 0 then
      sSql := sSql + '  AND OD.DATAOPERACAO = TO_DATE(' + QuotedStr(DateToStr(dDataOperacao)) + ', ' + QuotedStr('dd/mm/yyyy') + ') ';
   sSql := sSql + 'ORDER BY OD.DATAOPERACAO ';
   Result := GetDataPacket(sSql);
end;

//Ricardo Cristiano - 26/10/2010 - N. Sol 143205 -  N. Kintana 942509
function TCtrlRendaVariavel.AplicaAtualOperDirTransf(dDatavencorig      : TDateTime = 0;
                                                     dDataoperacao      : TDateTime = 0;
                                                     iIdtipooperacao    : Integer = 0;
                                                     iIdtipoinvest      : Integer = -1;
                                                     iIdplanprevctbpatrorig : Integer = -1;
                                                     iIdplanprevctbpatrdest : Integer = -1;
                                                     iIdoperacaodireito : Integer = -1;
                                                     iIdinvestorig      : Integer = -1;
                                                     iIdtipooperdest    : Integer = 0;                                                     
                                                     iIdtipooperorig    : Integer = 0;
                                                     iIdmotivobloqorig  : Integer = 0;
                                                     iIdforcliorig      : Integer = -1;
                                                     iIdcustodiaorig    : Integer = -1;
                                                     iIdcartinvestorig  : Integer = -1;
                                                     iIdoperinvestorig  : Integer = -1;
                                                     iIdoperinvestdest   : Integer = -1;
                                                     fVlroperacao       : Double = 0;
                                                     fQtdeoperacao      : Double = 0;
                                                     fPuorigem          : Double = 0;
                                                     fPercentual        : Double = 0;
                                                     sIdboleta          : String = '';
                                                     sObservacao        : String = '') : boolean;
var bComitLocal: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.AplicaAtualOperacaoInvest(FCdsOperDirTransf.Data);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         bComitLocal := False;
         if not InTransaction then
         begin
            bComitLocal := True;
            StartTransaction;
         end;

         FDbOperDirTransf.Clear;
         FDbOperDirTransf.Datavencorig.AsDateTime      := dDatavencorig;
         FDbOperDirTransf.Dataoperacao.AsDateTime      := dDataoperacao;
         if iIdtipooperacao <> 0 then
            FDbOperDirTransf.Idtipooperacao.AsInteger  := iIdtipooperacao;
         FDbOperDirTransf.Idtipoinvest.AsInteger       := iIdtipoinvest;
         FDbOperDirTransf.Idplanprevctbpatrorig.AsInteger := iIdplanprevctbpatrorig;
         FDbOperDirTransf.Idplanprevctbpatrdest.AsInteger := iIdplanprevctbpatrdest;
         FDbOperDirTransf.Idoperacaodireito.AsInteger  := iIdoperacaodireito;
         FDbOperDirTransf.Idinvestorig.AsInteger       := iIdinvestorig;
         if iIdtipooperdest <> 0 then
            FDbOperDirTransf.IdtipooperDest.AsInteger  := iIdtipooperdest;
         if iIdtipooperorig <> 0 then
            FDbOperDirTransf.Idtipooperorig.AsInteger  := iIdtipooperorig;
         FDbOperDirTransf.Idmotivobloqorig.AsInteger   := iIdmotivobloqorig;
         FDbOperDirTransf.Idforcliorig.AsInteger       := iIdforcliorig;
         FDbOperDirTransf.Idcustodiaorig.AsInteger     := iIdcustodiaorig;
         FDbOperDirTransf.Idcartinvestorig.AsInteger   := iIdcartinvestorig;
         if iIdoperinvestorig > 0 then
            FDbOperDirTransf.Idoperinvestorig.AsInteger:= iIdoperinvestorig;
         if iIdoperinvestdest  > 0 then
            FDbOperDirTransf.Idoperinvestdest.AsInteger := iIdoperinvestdest;
         FDbOperDirTransf.Vlroperacao.AsFloat          := fVlroperacao;
         FDbOperDirTransf.Qtdeoperacao.AsFloat         := fQtdeoperacao;
         FDbOperDirTransf.Puorigem.AsFloat             := fPuorigem;
         FDbOperDirTransf.Percentual.AsFloat           := fPercentual;
         if sIdboleta <> '' then
            FDbOperDirTransf.Idboleta.AsString         := sIdboleta;
         FDbOperDirTransf.Observacao.AsString          := sObservacao;
         
         // Aplica a alteração na Tabela
         if not FDbOperDirTransf.Insert then
            Raise Exception.Create(FDbOperDirTransf.MessageInfo);

         Result := ApplyCds(FCdsOperDirTransf,DbOperDirTransf,[],[]);
         IdOperDirTransf := DbOperDirTransf.IdOperDirTransf.AsInteger;

         if not Result then
         begin
            if bComitLocal then
               RollBack;
            MessageInfo := DbOperDirTransf.MessageInfo;
         end
         else
            if bComitLocal then
               Commit;
      except
         on E:Exception do
         begin
            Result := False;
            if bComitLocal then
               Rollback;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;

end.
