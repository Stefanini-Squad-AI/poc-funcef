//******************************************************************************
// Data      : 25/05/2009
// Kintana   : 553672
// SOL       : 117465
// Desc      : Inclusao do filtro IDTIPOINVEST na query da rotina
//             ListPenhoraJuridico
// Analista  :Thiago Passos
// Data      :25/05/2009
//******************************************************************************
// Data      : 28/05/2008
// Código    : AL_24
// Pendencia : 26357, 26456, 26577, 27100
// SOL       : 69119, 70156, 71040, 70122
// Desc      : Desenvolvimento do Empréstimo MT
//******************************************************************************
// Data      : 29/08/2007
// Código    : AL_23
// Pendencia : 25925
// SOL       :
// Motivo    : Acerto na inclusão do Tipo do Indicador
//******************************************************************************
// Data      : 29/08/2007
// Código    : AL_22
// Pendencia : 25678
// SOL       :
// Motivo    : Implementação de Marcação a Mercado
//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_21
// Pendencia : 26012
// SOL       :
// Motivo    : Tratamento para permitir a busca de Carteira sem o TipoInvest
//******************************************************************************
// Data      : 27/09/2007
// Código    : AL_20
// Pendencia : 25922
// SOL       :
// Motivo    : Implementação do Cadastro de Setores do Emissor (3 camadas)
//******************************************************************************
// Data      : 27/09/2007
// Código    : AL_19
// Pendencia : 25923
// SOL       :
// Motivo    : Implementação do Cadastro de Associação de Indicadores (3 camadas)
//******************************************************************************
// Data      : 27/09/2007
// Código    : AL_18
// Pendencia : 25925
// SOL       :
// Motivo    : Implementação do Cadastro de Valores de Indicadores (3 camadas)
//******************************************************************************
// Data      : 27/09/2007
// Código    : AL_17
// Pendencia : 25924
// SOL       :
// Motivo    : Implementação do Cadastro de Tipos de Indicadores (3 camadas)
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_16
// Pendencia : 26012
// SOL       :
// Motivo    : Implementações do campo FLGCONTABILIZA, FLGORDMOVINV, FLGCARTLASTRO,
//             FLGCARTTERC, FLGCARTPROP na ListCarteira
//******************************************************************************
// Data     : 26/03/2006
// Código   : AL_15
// Pendencia: 24875
// SOL      :
// Desc     : Implementação de Agência de Risco
//******************************************************************************
// Data      : 29/05/2007
// Codigo    : AL_14
// Pendência : 23705
// Sol       : 40671
// Motivo    : Melhoria na funcionalidade de Penhora
//******************************************************************************
// Data      : 08/05/2007
// Codigo    : AL_13
// Pendência : 25300
// Sol       :
// Motivo    : Alteracao da ListCarteira para exibir/não Carteira Gerencial em
//             virtude do parâmetro do sistema Utiliza carteira/Data
//******************************************************************************
// Data     : 24/01/2007
// Código   : AL_12
// Pendencia: 24238
// SOL      :
// Desc     : Ao alterar+cancelar não volta para o mercado selecionado
//            Ao Incluir+Confirmar ou Incluir+Cancelar não volta para o incluído
//            Acertar a Assinatura das Chamadas do Cliente dos metodos aplica
//******************************************************************************
// Data      : 17/01/2007
// Código    : AL_11
// Pendencia : 24235
// SOL       :
// Motivo    : Implementação do Cadastro Tipos de Investimento por Usuário
//******************************************************************************
// Data      : 11/01/2007
// Código    : AL_10
// Pendencia :
// SOL       :
// Motivo    : Implementação do Cadastro Tipos de Rubricas em 3 camadas
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_9
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação de Controls para gravação da OperRenfix, HistRenfix
//             OperRenfixCurvas e HistRenfixXitens para a Integração de Bloqueio
//             de Penhora com o Jurídico
//******************************************************************************
// Data      : 03/01/2007
// Código    : AL_8
// Pendencia : 24094
// SOL       :
// Motivo    : Retirada da ListPlanPrevCtbPatr por duplicidade
//******************************************************************************
// Data      : 18/08/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Implementação para consultar plano/patrocinadora
//******************************************************************************
// Data      : 18/08/2006
// Código    : AL_7
// Pendencia :
// SOL       :
// Motivo    : Implementação para consultar plano/patrocinadora
//******************************************************************************
// Data      : 03/10/2006
// Código    : AL_6
// Pendencia : 22967
// SOL       :
// Motivo    : Segregação de Planos
//             Reorganização da Unit
//******************************************************************************
// Data      : 27/06/2006
// Código    : AL_5
// Pendencia : 20453
// SOL       : 33866
// Motivo    : Implementação das Ctrl para o Tipo de Investimento e DtaTravaContabil
//             para Mercado
//******************************************************************************
// Data      : 08/02/2006
// Código    : AL_4
// Pendencia :
// SOL       :
// Motivo    : Implementação para consultar apenas a carteira gerencial
//*****************************************************************************
//Data	     : 09/01/2006
//Código     : AL_3
//Motivo(S)  : Implementação da uDbMotivoBloqueio e suas funções
//*****************************************************************************
//Data	     : 09/01/2006
//Código     : Al_2
//Motivo(S)  : Implementação da uDbMotivoBloqueio e suas funções
//*****************************************************************************
//Data	     : 03/01/2006
//Código     : Al_1
//Motivo(S)  : Implementação da uDbMercado e suas funções
//*****************************************************************************

unit uCtrlInvestimento;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uDbCustodiante,
     uDbInvestimento, uDbCarteiraInvest,
     //AL_1
     uDbMercado,
     //AL_2
     uDbMotivobloqueio,
     //AL_3
     uDbTipoOperacao,
     //AL_5
     uDbTipoinvest,
     //AL_9
     uCtrlRendaFixa, uCtrlPadroes, uBibliotecaInvest, uDbOperRenfix, uInvestimento,
     uCtrlFundos, uDbPedidofundo, uCMMath,
     //AL_10
     uDbTipoDespInvest,
     //AL_11
     uDbUsuarioTipoMenu,
     //AL_14
     uCtrlParamInvest,
     //AL_15
     uDbAgenciaRisco,
     //AL_17
     uDbParamEmissor,
     //AL_18
     uFuncaogeral,
     uDbValParamXEmissor,
     //AL_19
     uDbParamXEmissor,
     uCmClientDataSet,
     //AL_20
     uDbSetorEmissor,
     //AL_24
     uCMFileUtils ,uCMTypes;

type
   //AL_6 - Ini
   TCtrlInvestimento = Class(TCmControlObject)
   private
      FDbCustodiante     : TDbCustodiante;
      FCdsCustodiante    : TClientDataSet;
      FDbInvestimento    : TDbInvestimento;
      FCdsInvestimento   : TClientDataSet;
      FDbCarteiraInvest  : TDbCarteiraInvest;
      FCdsCarteiraInvest : TClientDataSet;
      FCdsAux            : TClientDataSet;
      //AL_1
      FDbMercado  : TDbMercado;
      FCdsMercado : TClientDataSet;
      //AL_2
      FDbMotivobloqueio  : TDbMotivobloqueio;
      FCdsMotivobloqueio : TClientDataSet;
      //AL_3
      FCdsTipoOperacao: TClientDataSet;
      FDbTipoOperacao: TDbTipoOperacao;
      //AL_5
      FCdsTipoInvest: TClientDataSet;
      FDbTipoInvest: TDbTipoInvest;
      //AL_9
      FIdOperRenFix: Integer;
      FIdHistRenFix: Integer;
      //AL_9
      CtrlRendaFixa : TCtrlRendaFixa;
      CtrlFundos    : TCtrlFundos;
      //AL_10
      FCdsTipoDespInvest: TClientDataSet;
      FDbTipoDespInvest: TDbTipoDespInvest;
      //AL_11
      FCdsTipoInvUsu: TClientDataSet;
      FDbTipoInvUsu: TDbUsuarioTipoMenu;
      //AL_12
      FIdMercado: Integer;
      FIdMotivoBloqueio: Integer;
      FIdTipoDespInvest: Integer;
      FIdUsuario: Integer;

      //AL_15
      FCdsAgenciaRisco: TClientDataSet;
      FDbAgenciaRisco: TDbAgenciaRisco;
      FIdAgenciaRisco: Integer;

      //AL_16
      FIdCarteiraInvest : Integer;
      //AL_17
      FCdsParamEmissor: TClientDataSet;
      FDbParamEmissor: TDbParamEmissor;
      FIDParamEmissor: Integer;
      //AL_18
      FCdsValParamXEmissor: TClientDataSet;
      FMDIDEmisssor: Integer;
      FuncaoGeral: TFuncaoGeral;
      FDbValParamXEmissor: TDbValParamXEmissor;
      FMDIDParamEmisssor: Integer;
      //AL_19
      FCdsParamXEmissor: TClientDataSet;
      FDbParamXEmissor: TDBParamXEmissor;
      //AL_20
      FCdsSetorEmissor: TclientDataSet;
      FDbSetorEmissor: TDbSetorEmissor;
      FIDSetorEmissor: String;

      procedure SetDbCarteiraInvest(const Value: TDbCarteiraInvest);
      procedure SetDbCustodiante(const Value: TDbCustodiante);
      procedure SetDbInvestimento(const Value: TDbInvestimento);
      //AL_1
      procedure SetDbMercado(const Value: TDbMercado);
      procedure SetCdsMercado(const Value: TClientDataSet);
      //AL_2
      procedure SetCdsMotivobloqueio(const Value: TClientDataSet);
      procedure SetDbMotivobloqueio(const Value: TDbMotivobloqueio);
      //AL_3
      procedure SetCdsTipoOperacao(const Value: TClientDataSet);
      procedure SetDbTipoOperacao(const Value: TDbTipoOperacao);
      //AL_5
      procedure SetCdsTipoInvest(const Value: TClientDataSet);
      procedure SetDbTipoInvest(const Value: TDbTipoInvest);
      //AL_9
      procedure SetIdOperRenFix(const Value: Integer);
      procedure SetIdHistRenFix(const Value: Integer);

      //AL_10
      procedure SetCdsTipoDespInv(const Value: TClientDataSet);
      procedure SetDbTipoDespInv(const Value: TDbTipoDespInvest);
      //AL_11
      procedure SetCdsTipoInvUsu(const Value: TClientDataSet);
      procedure SetDbTipoInvUsu(const Value: TDbUsuarioTipoMenu);

      //AL_12
      procedure SetIdMercado(const Value: Integer);
      procedure SetIdMotivoBloqueio(const Value: Integer);
      procedure SetIdTipoDespInvest(const Value: Integer);
      procedure SetIdUsuario(const Value: Integer);

      //AL_15
      procedure SetDbAgenciaRisco(const Value: TDbAgenciaRisco);
      procedure SetCdsAgenciaRisco(const Value: TClientDataSet);
      procedure SetIdAgenciaRisco(const Value: Integer);

      //AL_16
      procedure SetIdCarteiraInvest(const Value: Integer);
      //AL_17
      procedure SetCdsParamEmissor(const Value: TClientDataSet);
      procedure SetDbParamEmissor (const Value: TDbParamEmissor);
      procedure SetIDParamEmissor(const Value: Integer);
      //AL_18
      procedure SetCdsValParamXEmissor(const Value: TClientDataSet);
      procedure SetMDIDEmisssor(const Value: Integer);
      procedure SetDbValParamXEmissor(const Value: TDbValParamXEmissor);
      procedure SetMDIDParamEmisssor(const Value: Integer);

      //AL_19
      procedure SetCdsParamXEmissor(const Value: TClientDataSet);
      procedure SetDbParamXEmissor(const Value: TDBParamXEmissor);

      //AL_20
      procedure SetCdsSetorEmissor(const Value: TclientDataSet);
      procedure SetDbSetorEmissor(const Value: TDbSetorEmissor);
      procedure SetIDSetorEmissor(const Value: String);

   public
      // ------------------- Propriedades da Control ------------------------------------------
      property CdsCustodiante    : TClientDataSet    read FCdsCustodiante    write FCdsCustodiante;
      property DbCustodiante     : TDbCustodiante    read FDbCustodiante     write SetDbCustodiante;
      property CdsCarteiraInvest : TClientDataSet    read FCdsCarteiraInvest write FCdsCarteiraInvest;
      property DbCarteiraInvest  : TDbCarteiraInvest read FDbCarteiraInvest  write SetDbCarteiraInvest;
      property CdsInvestimento   : TClientDataSet    read FCdsInvestimento   write FCdsInvestimento;
      property DbInvestimento    : TDbInvestimento   read FDbInvestimento    write SetDbInvestimento;
      property CdsAux            : TClientDataSet    read FCdsAux            write FCdsAux;
      //AL_1
      property CdsMercado        : TClientDataSet    read FCdsMercado write SetCdsMercado;
      property DbMercado         : TDbMercado        read FDbMercado  write SetDbMercado;
      //AL_12
      property IdMercado: Integer read FIdMercado write SetIdMercado;
      //AL_2
      property CdsMotivobloqueio : TClientDataSet read FCdsMotivobloqueio write SetCdsMotivobloqueio;
      property DbMotivobloqueio  : TDbMotivobloqueio read FDbMotivobloqueio write SetDbMotivobloqueio;
      //AL_12
      property IdMotivoBloqueio: Integer read FIdMotivoBloqueio write SetIdMotivoBloqueio;
      //AL_3
      property CdsTipoOperacao   : TClientDataSet read FCdsTipoOperacao write SetCdsTipoOperacao;
      property DbTipoOperacao    : TDbTipoOperacao read FDbTipoOperacao write SetDbTipoOperacao;
      //AL_5
      property CdsTipoInvest     : TClientDataSet read FCdsTipoInvest write SetCdsTipoInvest;
      property DbTipoInvest      : TDbTipoInvest read FDbTipoInvest write SetDbTipoInvest;
      //AL_9
      property IdOperRenFix      : Integer read FIdOperRenFix write SetIdOperRenFix;
      property IdHistRenFix      : Integer read FIdHistRenFix write SetIdHistRenFix;

      //AL_10
      property CdsTipoDespInvest     : TClientDataSet read FCdsTipoDespInvest write SetCdsTipoDespInv;
      property DbTipoDespInvest      : TDbTipoDespInvest read FDbTipoDespInvest write SetDbTipoDespInv;
      //AL_12
      property IdTipoDespInvest: Integer read FIdTipoDespInvest write SetIdTipoDespInvest;

      //AL_11
      property CdsTipoInvUsu: TClientDataSet read FCdsTipoInvUsu write SetCdsTipoInvUsu;
      property DbTipoInvUsu: TDbUsuarioTipoMenu read FDbTipoInvUsu write SetDbTipoInvUsu;
      //AL_12
      property IdUsuario:Integer read FIdUsuario write SetIdUsuario;

      //AL_15
      property CdsAgenciaRisco   : TClientDataSet    read FCdsAgenciaRisco write SetCdsAgenciaRisco;
      property DbAgenciaRisco    : TDbAgenciaRisco   read FDbAgenciaRisco  write SetDbAgenciaRisco;
      property IdAgenciaRisco    : Integer           read FIdAgenciaRisco  write SetIdAgenciaRisco;

      //AL_16
      property IdCarteiraInvest: Integer read FIdCarteiraInvest write SetIdCarteiraInvest;
      //AL_17
      Property CdsParamEmissor : TClientDataSet  read FCdsParamEmissor  write SetCdsParamEmissor;
      property DbParamEmissor  : TDbParamEmissor read FDbParamEmissor   write SetDbParamEmissor;
      property IDParamEmissor  : Integer         read FIDParamEmissor   write SetIDParamEmissor;

      //AL_18
      property CdsValParamXEmissor: TClientDataSet read FCdsValParamXEmissor write SetCdsValParamXEmissor;
      property DbValParamXEmissor: TDbValParamXEmissor read FDbValParamXEmissor write SetDbValParamXEmissor;
      property MDIDEmisssor: Integer read FMDIDEmisssor write SetMDIDEmisssor;
      property MDIDParamEmisssor: Integer read FMDIDParamEmisssor write SetMDIDParamEmisssor;

      //AL_19
      property CdsParamXEmissor: TClientDataSet read FCdsParamXEmissor write SetCdsParamXEmissor;
      property DbParamXEmissor: TDBParamXEmissor read FDbParamXEmissor write SetDbParamXEmissor;

      //AL_20
      property CdsSetorEmissor: TclientDataSet read FCdsSetorEmissor write SetCdsSetorEmissor;
      property DbSetorEmissor: TDbSetorEmissor read FDbSetorEmissor write SetDbSetorEmissor;
      property IDSetorEmissor: String read FIDSetorEmissor write SetIDSetorEmissor;

      // ------------------- Metodos da Control ------------------------------------------
      constructor Create; override;
      destructor Destroy; override;
      procedure OnCreateAppServer; override;

      // ------------------- Metodos de Listagem ------------------------------------------
      function ListContraParte: OleVariant;
      function ListMoeda(iIdMoeda : Integer = -1): OleVariant;
      //AL_6
      function ListPlanoPatro(iIdPlanPrevCtbPatr : Integer = -1; bExclusao: Boolean = False): OleVariant;
      function ListSegmentacao(iGrupo: integer): OleVariant;
      function ListAutorizadorDeOperacao: OleVariant;
      function ListCustodiante(iIdCustodiante : Integer = -1): OleVariant;
      function ListMotivoBloqueio(iIdMotBloq : Integer = -1): OleVariant;
      function ListGrupoRegra(iIdGrupoRegra: Integer = -1): OleVariant;
      function ListTipoRegra(iIdTipoRegra: Integer = -1): OleVariant;
      function ListMercado(iIdMercado : Integer = -1): OleVariant;
      function ListRegra(iIdRegra : Integer = -1): OleVariant;
      function ListTipoPeriodicidade(iIdTipoPeriodicidade : Integer = -1): OleVariant;
      function ListParamEmissor(iIdParamEmissor : Integer = -1): OleVariant;
      function ListTipoContratoInvest(iIdTipoContrInvest : Integer = -1): OleVariant;
      function ListTipoCliente(iIdTipoCliente : Integer = -1): OleVariant;
      function ListRamoFornecedor(iIdRamoFornecedor : Integer = -1): OleVariant;
      function ListPrograma(iIdPrograma : Integer = -1): OleVariant;
      function ListCarteira(iIdTipoInvest : Integer = -1; iIdCarteira : Integer = -1;
                            iFlgCartGerenc: Integer = -1;
                            dDataGer: String = ''): OleVariant;
      function ListInvestimento(iIdInvestimento : Integer = -1; iIdTipoInvest : Integer = -1;
                                iIdEmissor : Integer = -1; iIdClasseTit : Integer = -1;
                                iIdCarteiraSPC : Integer = -1; sFlgAtivo : String = ''): OleVariant;
      function ListTipoInvest(iIdTipoInvest : Integer = -1): OleVariant;
      //AL_3
      function ListTipoOperacao(iIdTipoInvest   : Integer = -1;
                                iIdTipoOperacao : Integer = -1;
                                iIdMercado      : Integer = -1): OleVariant;

      function ListCorretora(iIdCorretora : Integer = -1): OleVariant;

      function ListCdsAux(sSql : String): OleVariant;
      //AL_10
      function ListPlanoPrev(iIdPlanoPrev : Integer = -1): OleVariant;
      function ListGestor(iIdGestorCarteira : Integer = -1): OleVariant;
      function ListPatrocinadora(iIdPatrocinador : Integer = -1): OleVariant;
      Function ListTipoDespInvest(iIdTipoDespInvest: Integer = -1): Olevariant;
      //AL_11
      function ListTipoInvUsu(iIdUsuario: Integer = -1): Olevariant;
      function ListUsuario(iIdUsuario: Integer = -1): Olevariant;
      //AL_15
      function ListAgenciaRisco(iIdAgenciaRisco: Integer = -1): Olevariant;
      //AL_22
      function ListCotacaoMoeda(iMoeda: Integer; dDataRef: TDateTime = 0; bMaior: Boolean = True): OleVariant;

      // ------------------- Metodos de Gravação ------------------------------------------
      function AplicaAtualCustodiante: Boolean;
      function AplicaAtualCarteiraInvest: Boolean;
      function AplicaAtualInvestimento: Boolean;
      //AL_1
      function AplicaAtualMercado: Boolean;
      //AL_2
      function AplicaAtualMotivoBloqueio: Boolean;
      function AplicaAtualTipoOperacao: Boolean;
      //AL_5
      function AplicaAtualTipoInvest: Boolean;
      //AL_9
      function ListPenhoraJurico(dDataIni, dDataFim : TDateTime;
                                 iFlgInvLido, iTipoInvest : Integer;
                                 iTipoCota : integer = 0;
                                 iPlanPrev  : Integer = -1;
                                 iInvestimento : Integer = -1;
                                 iOperAplic : Integer = -1;
                                 iFundoInvest : integer = -1) : OleVariant;
      //AL_9
      function IntegraPenhoraJuridico(dDataIni, dDataFim : TDateTime;
                                      iFlgInvLido, iTipoInvest : Integer;
                                      iPlanPrev  : Integer = -1;
                                      iInvestimento : Integer = -1;
                                      iOperAplic : Integer = -1;
                                      iFundoInvest : integer = -1;
                                      iTipoCota : integer = 0) : Boolean;
      //AL_10
      Function AplicaTipoDespInvest: Boolean;

      //AL_11
      Function AplicaTipoInvUsu: Boolean;

      //AL_15
      function AplicaAgenciaRisco: Boolean;
      // AL_17
      function ListaParamEmissor: Olevariant;
      function AplicaParamEmissor: Boolean;
      function PermiteExclusaoParamEmissor: Boolean;

      //AL_18
      function cdslookemissor: Olevariant;
      function cdslookIndicadorEmissor: Olevariant;
      function ListaValParamEmissor: Olevariant;
      function AplicaValParamEmissor: Boolean;
      //AL_19
      function cdslookIndicadorNEmissor: Olevariant;
      function AplicaParamXEmissor: Boolean;
      //AL_20
      function ListaSetorEmissor: Olevariant;
      function AplicaSetorEmissor: Boolean;

      //AL_24
      function VerEmAbertura(iTipoInvest: Integer): Boolean;

   protected
      procedure DoChangeDataBase; override;
      //AL_9
      procedure AfterInitialize;  Override;
   end;
   //AL_6 - Fim

implementation

{TCtrlInvestimento}

constructor TCtrlInvestimento.Create;
begin
   inherited;
   FDbInvestimento   := TDbInvestimento.Create(Self);
   FDbCustodiante    := TDbCustodiante.Create(Self);
   FDbCarteiraInvest := TDbCarteiraInvest.Create(Self);
   //AL_1
   FDbMercado        := TDbMercado.Create(Self);
   //AL_2
   FDbMotivoBloqueio := TDbMotivoBloqueio.Create(Self);
   //AL_3
   FDbTipoOperacao   := TDbTipoOperacao.Create(Self);
   //AL_9
   CtrlRendaFixa := TCtrlRendaFixa.Create;
   CtrlRendaFixa.InitializeAs(Padroes);
   CtrlFundos := TCtrlFundos.Create;
   CtrlFundos.InitializeAs(Padroes);
   //AL_10
   FDbTipoDespInvest   := TDbTipoDespInvest.Create(Self);
   //AL_11
   FDbTipoInvUsu   := TDbUsuarioTipoMenu.Create(Self);
   //AL_15
   FDbAgenciaRisco := TDbAgenciaRisco.Create(Self);
   //AL_17
   FDbParamEmissor := TDbParamEmissor.Create(Self);
   //AL_18
   FuncaoGeral := TFuncaoGeral.Create;
   FDbValParamXEmissor := TDbValParamXEmissor.Create(Self);
   //AL_19
   FDbParamXEmissor := TDbParamXEmissor.Create(Self);
   //AL_20
   FDbSetorEmissor := TDbSetorEmissor.Create(Self);
end;

destructor TCtrlInvestimento.Destroy;
begin
   FreeAndNil(FDbInvestimento);
   if IsAppServer then
      FreeAndNil(FCdsInvestimento);

   FreeAndNil(FDbCustodiante);
   if IsAppServer then
      FreeAndNil(FCdsCustodiante);

   FreeAndNil(FDbCarteiraInvest);
   if IsAppServer then
      FreeAndNil(FCdsCarteiraInvest);

   if IsAppServer then
      FreeAndNil(FCdsAux);
   //AL_1
   FreeAndNil(FDbMercado);
   if IsAppServer then
      FreeAndNil(FCdsMercado);
   //AL_2
   FreeAndNil(FDbMotivoBloqueio);
   if IsAppServer then
      FreeAndNil(FCdsMotivoBloqueio);
   //AL_3
   FreeAndNil(FDbTipoOperacao);
   if IsAppServer then
      FreeAndNil(FCdsTipoOperacao);

   //AL_9
   FreeAndNil(CtrlRendaFixa);
   FreeAndNil(CtrlFundos);

   //AL_10
    FreeAndNil(FDbTipoDespInvest);
    if IsAppServer then
      FreeAndNil(FCdsTipoDespInvest);

   //AL_11
    FreeAndNil(FDbTipoInvUsu);
    if IsAppServer then
      FreeAndNil(FCdsTipoInvUsu);

   //AL_15
   FreeAndNil(FDbAgenciaRisco);
   if IsAppServer then
      FreeAndNil(FCdsAgenciaRisco);

   //AL_17
   FreeAndNil(FDbParamEmissor);
   if IsAppServer then
      FreeAndNil(FCdsParamEmissor);
   //AL_18
   FreeAndNil(FuncaoGeral);
   FreeAndNil(FDbValParamXEmissor);
   if IsAppServer then
      FreeAndNil(FCdsValParamXEmissor);

   //AL_19
   FreeAndNil(FDbParamXEmissor);
   if IsAppServer then
      FreeAndNil(FCdsParamXEmissor);

   //AL_20
   FreeAndNil(FDbSetorEmissor);
   if IsAppServer then
      FreeAndNil(FCdsSetorEmissor);

   inherited;
end;

procedure TCtrlInvestimento.OnCreateAppServer;
begin
   inherited;
   FCdsInvestimento   := TClientDataSet.Create(nil);
   FCdsCustodiante    := TClientDataSet.Create(nil);
   FCdsCarteiraInvest := TClientDataSet.Create(nil);
   FCdsAux            := TClientDataSet.Create(nil);
   //AL_1
   FCdsMercado        := TClientDataSet.Create(nil);
   //AL_2
   FCdsMotivoBloqueio := TClientDataSet.Create(nil);
   //AL_3
   FCdsTipoOperacao   := TClientDataSet.Create(nil);
   //AL_10
    FCdsTipoDespInvest   := TClientDataSet.Create(nil);
   //AL_11
   FCdsTipoInvUsu  := TClientDataSet.Create(nil);
   //AL_15
   FCdsAgenciaRisco := TClientDataSet.Create(nil);
   // AL_17
   FCdsParamEmissor := TClientDataSet.Create(nil);
   // AL_18
   FCdsValParamXEmissor := TClientDataSet.Create(nil);
   // AL_19
   FCdsParamXEmissor := TClientDataSet.Create(nil);
   // AL_20
   FCdsSetorEmissor := TClientDataSet.Create(nil);

End;

procedure TCtrlInvestimento.DoChangeDataBase;
begin
   inherited;
   FDbInvestimento.DataBaseName   := DataBaseName;
   FDbCustodiante.DataBaseName    := DataBaseName;
   FDbCarteiraInvest.DataBaseName := DataBaseName;
   //AL_1
   FDbMercado.DataBaseName        := DataBaseName;
   //AL_2
   FDbMotivoBloqueio.DataBaseName := DataBaseName;
   //AL_3
   FDbTipoOperacao.DataBaseName   := DataBaseName;
   //AL_10
   FDbTipoDespInvest.DataBaseName   := DataBaseName;
   //AL_11
   FDbTipoInvUsu.DataBaseName   := DataBaseName;
   //AL_15
   FDbAgenciaRisco.DataBaseName   := DataBaseName;
   //AL_23
   FDbParamEmissor.DataBaseName   := DataBaseName;
end;

function TCtrlInvestimento.ListContraParte: OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT DISTINCT PE.IDPESSOA, PE.NOME                                   ';
   sSql := sSql + 'FROM PESSOA PE                                                         ';
   sSql := sSql + 'WHERE PE.IDPESSOA IN (SELECT EM.IDEMISSOR FROM EMISSOR EM              ';
   sSql := sSql + '                      UNION                                            ';
   sSql := sSql + '                      SELECT CU.IDCUSTODIANTE FROM CUSTODIANTE CU      ';
   sSql := sSql + '                      UNION                                            ';
   sSql := sSql + '                      SELECT BV.IDBOLSAVALORES FROM BOLSAVALORES BV    ';
   sSql := sSql + '                      UNION                                            ';
   sSql := sSql + '                      SELECT CT.IDCORRETVALORES FROM CORRETVALORES CT) ';
   sSql := sSql + 'ORDER BY PE.NOME                                                       ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListMoeda(iIdMoeda : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT MOECODIGO, MOEDESC, MOESIGLA ';
   sSql := sSql + 'FROM MOEDA  ';
   if iIdMoeda <> -1 then
      sSql := sSql + 'WHERE MOECODIGO = ' + IntToStr(iIdMoeda);
   sSql := sSql + 'ORDER BY MOEDESC ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListPlanoPatro(iIdPlanPrevCtbPatr : Integer = -1; bExclusao: Boolean = False): OleVariant;
var
   sSql : String;
begin
   //AL_6
   sSql := sSql + 'SELECT IDPLANPREVCTBPATR, IDPLANOPREV, IDPATRO, PLANPRVCONTABPATRO ';
   sSql := sSql + 'FROM VWPLANPREVCTBPATR ';
   if iIdPlanPrevCtbPatr > 0 then
   begin
      if bExclusao then
         sSql := sSql + 'WHERE IDPLANPREVCTBPATR NOT IN ('+IntToStr(iIdPlanPrevCtbPatr)+') '
      else
         sSql := sSql + 'WHERE IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatr);
   end;
   Result:=GetDataPacket(sSql);

end;

function TCtrlInvestimento.ListAutorizadorDeOperacao: OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                    ';
   sSql := sSql + '   IDUSUARIO,NOMEUSUARIO  ';
   sSql := sSql + 'FROM                      ';
   sSql := sSql + '   AUTORIZAOPERACAO       ';
   sSql := sSql + 'WHERE FLGATIVO = ''S''    ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListMotivoBloqueio(iIdMotBloq : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                           ';
   sSql := sSql + '   IDMOTIVOBLOQUEIO, DESCMOTBLOQ, SIGLAMOTBLOQ  ';
   sSql := sSql + 'FROM                             ';
   sSql := sSql + '   MOTIVOBLOQUEIO                ';
   if iIdMotBloq <> -1 then
      sSql := sSql + 'WHERE IDMOTIVOBLOQUEIO = ' + IntToStr(iIdMotBloq);
   sSql := sSql + 'ORDER BY DESCMOTBLOQ                ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListCustodiante(iIdCustodiante : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT IDCUSTODIANTE, SGLCUSTODIANTE, FLGCODATIVOCUST ';
   sSql := sSql + 'FROM CUSTODIANTE  ';
   if iIdCustodiante <> -1 then
      sSql := sSql + 'WHERE IDCUSTODIANTE = ' + IntToStr(iIdCustodiante);
   sSql := sSql + 'ORDER BY SGLCUSTODIANTE ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.AplicaAtualCustodiante: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualCustodiante;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(CdsCustodiante,DbCustodiante,[],[]);
          if not Result then
             Exception.Create(DbCustodiante.MessageInfo);
          Commit;
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

function TCtrlInvestimento.AplicaAtualCarteiraInvest: Boolean;
//AL_16
var bDbObjct : boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualCarteiraInvest;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          //AL_16
          FIdCarteiraInvest := 0;
          if FCDSCarteiraInvest.State in [dsEdit] then
             FIdCarteiraInvest := FCdsCarteiraInvest.FieldByName('IDCARTEIRAINVEST').AsInteger;

          bDbObjct := FCDSCarteiraInvest.State in [dsInsert,dsEdit];

          Result := ApplyCds(FCdsCarteiraInvest,DbCarteiraInvest,[],[]);
          if not Result then
             Exception.Create(DbCarteiraInvest.MessageInfo);

          //AL_16
          FCdsCarteiraInvest.Data := ListCarteira(-1, -1, 0);
          if bDbObjct then
          begin
             if FIdCarteiraInvest = 0 then
                FIdCarteiraInvest := DbCarteiraInvest.IdCarteiraInvest.AsInteger;
             FCdsCarteiraInvest.Locate('IDCARTEIRAINVEST', FIdCarteiraInvest, [loPartialKey]);
             DbCarteiraInvest.IdCarteiraInvest.AsInteger := FIdCarteiraInvest;
             DbCarteiraInvest.LoadFromDb;
          end;

          Commit;
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

function TCtrlInvestimento.AplicaAtualInvestimento: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualCustodiante;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(CdsInvestimento,DbInvestimento,[],[]);
          if not Result then
             Exception.Create(DbInvestimento.MessageInfo);
          Commit;
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

function TCtrlInvestimento.ListGrupoRegra(iIdGrupoRegra : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                     ';
   sSql := sSql + '   IDGRUPOREGRA,DESCRICAO  ';
   sSql := sSql + 'FROM                       ';
   sSql := sSql + '   GRUPOREGRA              ';
   if iIdGrupoRegra <> -1 then
      sSql := sSql + 'WHERE IDGRUPOREGRA = ' + IntToStr(iIdGrupoRegra);
   sSql := sSql + 'ORDER BY DESCRICAO         ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListTipoRegra(iIdTipoRegra : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                   ';
   sSql := sSql + '   IDTIPOREGRA,DESCREGRA ';
   sSql := sSql + 'FROM                     ';
   sSql := sSql + '   TIPOREGRA             ';
   if iIdTipoRegra <> -1 then
      sSql := sSql + 'WHERE IDTIPOREGRA = ' + IntToStr(iIdTipoRegra);
   sSql := sSql + 'ORDER BY DESCREGRA       ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListMercado(iIdMercado : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                    ';
   sSql := sSql + '   M.IDMERCADO, M.DESCMERCADO, M.IDTIPOINVEST, T.DESCTIPOINVEST ';
   sSql := sSql + 'FROM                      ';
   sSql := sSql + '   MERCADO M, TIPOINVEST T    ';
   sSql := sSql + 'WHERE M.IDTIPOINVEST = T.IDTIPOINVEST ';
   if iIdMercado <> -1 then
      sSql := sSql + ' AND M.IDMERCADO = ' + IntToStr(iIdMercado);
   sSql := sSql + 'ORDER BY M.DESCMERCADO      ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListRegra(iIdRegra : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                             ';
   sSql := sSql + '   IDREGRA, NOMEREGRA, IDTIPOREGRA ';
   sSql := sSql + 'FROM                               ';
   sSql := sSql + '   REGRA                           ';
   if iIdRegra <> -1 then
      sSql := sSql + 'WHERE IDREGRA = ' + IntToStr(iIdRegra);
   sSql := sSql + 'ORDER BY NOMEREGRA                 ';
   Result := GetDataPacket(sSql);
end;


function TCtrlInvestimento.ListTipoPeriodicidade(iIdTipoPeriodicidade : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                     ';
   sSql := sSql + '   IDTPPERIODICIDADE, NOME ';
   sSql := sSql + 'FROM                       ';
   sSql := sSql + '   TPPERIODICIDADE         ';
   if iIdTipoPeriodicidade <> -1 then
      sSql := sSql + 'WHERE IDTPPERIODICIDADE = ' + IntToStr(iIdTipoPeriodicidade);
   sSql := sSql + 'ORDER BY NOME              ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListParamEmissor(iIdParamEmissor : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                              ';
   sSql := sSql + '   DESCPARAMEMISSOR, IDPARAMEMISSOR ';
   sSql := sSql + 'FROM                                ';
   sSql := sSql + '   PARAMEMISSOR                     ';
   if iIdParamEmissor <> -1 then
      sSql := sSql + 'WHERE IDPARAMEMISSOR = ' + IntToStr(iIdParamEmissor);
   sSql := sSql + 'ORDER BY DESCPARAMEMISSOR           ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListTipoContratoInvest(iIdTipoContrInvest : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                 ';
   sSql := sSql + '   IDTIPOCONTRINVEST, DESCTIPOCTINVEST ';
   sSql := sSql + 'FROM                                   ';
   sSql := sSql + '   TIPOCONTRINVEST                     ';
   sSql := sSql + 'WHERE IDTIPOINVEST = 1                 ';
   if iIdTipoContrInvest <> -1 then
      sSql := sSql + 'AND IDTIPOCONTRINVEST = ' + IntToStr(iIdTipoContrInvest);
   sSql := sSql + 'ORDER BY DESCTIPOCTINVEST              ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListTipoCliente(iIdTipoCliente : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                      ';
   sSql := sSql + '   IDTIPOCLIENTE, DESCRICAO ';
   sSql := sSql + 'FROM                        ';
   sSql := sSql + '   TIPOCLIENTE              ';
   if iIdTipoCliente <> -1 then
      sSql := sSql + 'WHERE IDTIPOCLIENTE = ' + IntToStr(iIdTipoCliente);
   sSql := sSql + 'ORDER BY DESCRICAO          ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListRamoFornecedor(iIdRamoFornecedor : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                  ';
   sSql := sSql + '   IDRAMOFORNECEDOR, DESCRAMOFORNECEDOR ';
   sSql := sSql + 'FROM                                    ';
   sSql := sSql + '   RAMOFORNECEDOR                       ';
   if iIdRamoFornecedor <> -1 then
      sSql := sSql + 'WHERE IDRAMOFORNECEDOR = ' + IntToStr(iIdRamoFornecedor);
   sSql := sSql + 'ORDER BY DESCRAMOFORNECEDOR             ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListPrograma(iIdPrograma : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                      ';
   sSql := sSql + '   IDPROGRAMA, DESCPROGRAMA ';
   sSql := sSql + 'FROM                        ';
   sSql := sSql + '   PROGRAMA           ';
   if iIdPrograma <> -1 then
      sSql := sSql + 'WHERE IDPROGRAMA = ' + IntToStr(iIdPrograma);
   sSql := sSql + 'ORDER BY DESCPROGRAMA             ';
   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListCdsAux(sSql : String): OleVariant;
begin
   Result := GetDataPacket(sSql);
end;

procedure TCtrlInvestimento.SetDbCarteiraInvest(
  const Value: TDbCarteiraInvest);
begin
  FDbCarteiraInvest := Value;
end;

procedure TCtrlInvestimento.SetDbCustodiante(const Value: TDbCustodiante);
begin
  FDbCustodiante := Value;
end;

procedure TCtrlInvestimento.SetDbInvestimento(
  const Value: TDbInvestimento);
begin
  FDbInvestimento := Value;
end;

//AL_13
function TCtrlInvestimento.ListCarteira(iIdTipoInvest : Integer = -1;
                                        iIdCarteira : Integer = -1;
                                        iFlgCartGerenc: Integer = -1;
                                        dDataGer: String = ''): OleVariant;
var sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT LPAD(IDCARTEIRAINVEST,2,''0'') || NULL AS IDCARTEIRA,' + #13;
   //AL_16
   sSql := sSql + '       IDCARTEIRAINVEST, IDCONSELHINVEST, IDPLANOPREV, IDPATROCINADORA, IDTIPOINVEST, IDMERCADO, IDGESTORCARTEIRA,' + #13;
   sSql := sSql + '       NULL AS IDCARTEIRAGERENC,' + #13;
   sSql := sSql + '       DESCCARTINVEST,' + #13;
   //AL_16
   sSql := sSql + '          1 AS ORDEM, FLGCONTABILIZA, FLGORDMOVINV, FLGCARTLASTRO, FLGCARTTERC, FLGCARTPROP, FLGCALCDIARIO, ' + #13;
   sSql := sSql + '          DATAINICIO, FLGTRATALOTE ' + #13;
   sSql := sSql + 'FROM CARTEIRAINVEST' + #13;
   //Al_4
   if iIdTipoInvest <> -1 then
   begin
      //AL_21
      sSql := sSql + 'WHERE (IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ') OR (IDTIPOINVEST IS NULL)' +#13;
      if iIdCarteira <> -1 then
         sSql := sSql + '  AND IDCARTEIRAINVEST = ' + IntToStr(iIdCarteira) + #13;
      if iFlgCartGerenc = -1 then
         sSql := sSql + '  AND IDCARTEIRAINVEST = -1 ' + #13;
   end
   else
   if iIdCarteira <> -1 then
   begin
      sSql := sSql + 'WHERE IDCARTEIRAINVEST = ' + IntToStr(iIdCarteira) + #13;
      if iFlgCartGerenc = -1 then
         sSql := sSql + '  AND IDCARTEIRAINVEST = -1 ' + #13;
   end
   else
   if iFlgCartGerenc = -1 then
         sSql := sSql + 'WHERE IDCARTEIRAINVEST = -1 ' + #13;

   //Al_4

   sSql := sSql + 'UNION' + #13;
   sSql := sSql + 'SELECT LPAD(CG.IDCARTEIRAINVEST,2,''0'') || LPAD(CG.IDCARTEIRAGERENC,2,''0'') AS IDCARTEIRA,' + #13;
   //AL_16
   sSql := sSql + '       CG.IDCARTEIRAINVEST, 0 AS IDCONSELHINVEST, 0 AS IDPLANOPREV, 0 AS IDPATROCINADORA, 0 AS IDTIPOINVEST, '+ #13;
   sSql := sSql + '       0 AS IDMERCADO, 0 AS IDGESTORCARTEIRA, ' + #13;
   sSql := sSql + '       CG.IDCARTEIRAGERENC,' + #13;
   sSql := sSql + '       CG.DESCCARTGERENC AS DESCCARTINVEST,' + #13;
   //AL_16
   sSql := sSql + '       DECODE(NVL(CG.IDCARTEIRAGERENC,0), 0, 1) AS ORDEM, '' '' AS FLGCONTABILIZA, '' '' AS FLGORDMOVINV, ' + #13;
   sSql := sSql + '       '' '' AS FLGCARTLASTRO, '' '' AS FLGCARTTERC, 0 AS FLGCARTPROP, '' '' AS FLGCALCDIARIO, NULL AS DATAINICIO, FLGTRATALOTE ' + #13;
   sSql := sSql + 'FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI' + #13;
   sSql := sSql + 'WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST' + #13;

   if iFlgCartGerenc = -1 then
      //AL_13
      sSql := sSql + '  AND ((PI.FLGCARTGERENC = ''S'') or ((PI.FLGCARTGERENC = ''N'') AND (TO_DATE('''+dDataGer+''') <=  PI.DATAMOVCDBLIB )))'+ #13

   else if iFlgCartGerenc = 0 then
      sSql := sSql + '  AND (PI.FLGCARTGERENC = ''X'')' + #13;

   if iIdTipoInvest <> -1 then
      sSql := sSql + '  AND CI.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + #13;

   if iIdCarteira <> -1 then
      sSql := sSql + '  AND CI.IDCARTEIRAINVEST = ' + IntToStr(iIdCarteira) + #13;
   sSql := sSql + 'ORDER BY ORDEM, DESCCARTINVEST';

   Result := GetDataPacket(sSql);
end;

function TCtrlInvestimento.ListInvestimento(iIdInvestimento: Integer = -1; iIdTipoInvest: Integer = -1;
                                            iIdEmissor: Integer = -1; iIdClasseTit: Integer = -1;
                                            iIdCarteiraSPC: Integer = -1; sFlgAtivo : String = ''): OleVariant;
var sSql : String;
    bPri : Boolean;
begin

   bPri := True;
   sSql := '';
   sSql := sSql + 'SELECT DESCINVESTIMENTO, IDINVESTIMENTO, IDTIPOINVEST, IDMOEDACONTAB, IDEMISSOR, FLGATIVO,' + #13;
   sSql := sSql + '       OBSINVESTIMENTO, CODISIN, IDCLASSETIT, CARENCIA, STAOPCAO, IDCARTEIRASPC, FLGRFXANTIGO,' + #13;
   sSql := sSql + '       IDINVESTPRP, FLGREPACTUA' + #13;
   sSql := sSql + 'FROM INVESTIMENTO' + #13;
   if iIdInvestimento <> -1 then
   begin
      sSql := sSql + 'WHERE (IDINVESTIMENTO = ' + IntToStr(iIdInvestimento) + ')' + #13;
      bPri := False;
   end;
   if iIdTipoInvest <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ')' + #13;
   end;
   if iIdEmissor <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDEMISSOR = ' + IntToStr(iIdEmissor) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDEMISSOR = ' + IntToStr(iIdEmissor) + ')' + #13;
   end;
   if iIdClasseTit <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDCLASSETIT = ' + IntToStr(iIdClasseTit) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDCLASSETIT = ' + IntToStr(iIdClasseTit) + ')' + #13;
   end;
   if iIdCarteiraSPC <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDCARTEIRASPC = ' + IntToStr(iIdCarteiraSPC) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDCARTEIRASPC = ' + IntToStr(iIdCarteiraSPC) + ')' + #13;
   end;

   if sFlgAtivo <> '' then
   begin
      if bPri then
      begin
         if sFlgAtivo = 'S' then
            sSql := sSql + 'WHERE (FLGATIVO = ''S'')' + #13
         else
            sSql := sSql + 'WHERE ((FLGATIVO = ''N'') OR (FLGATIVO IS NULL)' + #13
      end
      else
      begin
         if sFlgAtivo = 'S' then
            sSql := sSql + '  AND (FLGATIVO = ''S'')' + #13
         else
            sSql := sSql + '  AND ((FLGATIVO = ''N'') OR (FLGATIVO IS NULL)' + #13
      end;
   end;
   sSql := sSql + 'ORDER BY DESCINVESTIMENTO';

   Result := GetDataPacket(sSql);
end;
//AL_1
procedure TCtrlInvestimento.SetDbMercado(const Value: TDbMercado);
begin
  FDbMercado := Value;
end;

//AL_1
function TCtrlInvestimento.AplicaAtualMercado: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualMercado;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsMercado,DbMercado,[],[]);

          //AL_12
          IdMercado := DbMercado.Idmercado.asinteger;

          if not Result then
             Exception.Create(DbMercado.MessageInfo);
          Commit;
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
//AL_1
function TCtrlInvestimento.ListTipoInvest(iIdTipoInvest : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                                       ';
   sSql := sSql + '   IDTIPOINVEST, DESCTIPOINVEST, CODSEGDAIEA ';
   sSql := sSql + 'FROM                                         ';
   sSql := sSql + '   TIPOINVEST                                ';
   //AL_11
   sSql := sSql + 'WHERE IDTIPOINVEST NOT IN(3,4) ';
   if iIdTipoInvest <> -1 then
      sSql := sSql + 'AND IDTIPOINVEST = ' + IntToStr(iIdTipoInvest);
   sSql := sSql + 'ORDER BY DESCTIPOINVEST                      ';
   Result := GetDataPacket(sSql);
end;
//AL_1
procedure TCtrlInvestimento.SetCdsMercado(const Value: TClientDataSet);
begin
  FCdsMercado := Value;
end;
//AL_2
procedure TCtrlInvestimento.SetCdsMotivobloqueio(
  const Value: TClientDataSet);
begin
  FCdsMotivobloqueio := Value;
end;
//AL_2
procedure TCtrlInvestimento.SetDbMotivobloqueio(
  const Value: TDbMotivobloqueio);
begin
  FDbMotivobloqueio := Value;
end;
//AL_2
//AL_1
function TCtrlInvestimento.AplicaAtualMotivoBloqueio: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualMotivoBloqueio;

       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsMotivoBloqueio,DbMotivoBloqueio,[],[]);
          //AL_12
          IdMotivoBloqueio := DbMotivoBloqueio.IdMotivoBloqueio.asinteger;

          if not Result then
             Exception.Create(DbMotivoBloqueio.MessageInfo);
          Commit;
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

//Al_3
procedure TCtrlInvestimento.SetCdsTipoOperacao(
  const Value: TClientDataSet);
begin
  FCdsTipoOperacao := Value;
end;

//Al_3
procedure TCtrlInvestimento.SetDbTipoOperacao(
  const Value: TDbTipoOperacao);
begin
  FDbTipoOperacao := Value;
end;

//AL_3
function TCtrlInvestimento.ListTipoOperacao(iIdTipoInvest   : Integer = -1;
                                            iIdTipoOperacao : Integer = -1;
                                            iIdMercado      : Integer = -1): OleVariant;
var
   sSql : String;
   bPri : Boolean;
begin
   bPri := True;
   sSql := '';
   sSql := sSql + 'SELECT '+ #13;
   sSql := sSql + 'DESCTIPOOPERACAO,IDTIPOINVEST,IDTIPOOPERACAO,IDMERCADO,CODTIPDOC,NATUREZAOPERACAO, '+ #13;
   sSql := sSql + 'TIPOCUSTODIA,VENCIMENTO,FLGGERACONTAB,FLGGERACAPCAR,RECPAG,TIPCREDOR,FLGGERACAF, '+ #13;
   sSql := sSql + 'FLGTRANSF,FLGCORRET,FLGORDMOVINV,IDMOTIVOBLOQUEIO,FLGOPDIREITO,FLGAGE,FLGDATAEX, '+ #13;
   sSql := sSql + 'FLGDATACOM,FLGINVORIGEM,FLGPERC,FLGPARIDADE,FLGPRZBOLSA,FLGPRZEMP,FLGATADEC, '+ #13;
   sSql := sSql + 'FLGFORMAPAGREC,FLGDIVACAO,FLGINIPAG,FLGJUROS,MOTBLOQCARTORIG,MOTBLOQCARTDEST, '+ #13;
   sSql := sSql + 'TIPSALDOCARTORIG,TIPSALDOCARTDEST,FLGTRATAIR,SIGLATIPOOPER,FLGISENTOIR, '+ #13;
   sSql := sSql + 'FLGGRAVAIRLITIGIO,FLGOPGERENC,TIPOMOVTO,STAATIVO,FLGRENTABILIDADE,FLGCONTAINVEST, '+ #13;
   sSql := sSql + 'FLGMOVCOTA,FLGCOTARECDES,FLGDATAVENCIMENTO,FLGOBRIGAOBS '+ #13;
   sSql := sSql + 'FROM TIPOOPERACAO '+ #13;
   if iIdTipoInvest <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDTIPOINVEST   = ' + IntToStr(iIdTipoInvest) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDTIPOINVEST   = ' + IntToStr(iIdTipoInvest) + ')' + #13;
   end;
   if iIdTipoOperacao <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDTIPOOPERACAO = ' + IntToStr(iIdTipoOperacao) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDTIPOOPERACAO = ' + IntToStr(iIdTipoOperacao) + ')' + #13;
   end;
   if iIdMercado <> -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDMERCADO = ' + IntToStr(iIdMercado) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDMERCADO = ' + IntToStr(iIdMercado) + ')' + #13;
   end;
   sSql := sSql + 'ORDER BY DESCTIPOOPERACAO ';
   Result:=GetDataPacket(sSql);
end;

//AL_3
function TCtrlInvestimento.AplicaAtualTipoOperacao: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualTipoOperacao;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result := ApplyCds(FCdsTipoOperacao,DbTipoOperacao,[],[]);
          if not Result then
             Exception.Create(DbTipoOperacao.MessageInfo);
          Commit;
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

//AL_5
procedure TCtrlInvestimento.SetCdsTipoInvest(const Value: TClientDataSet);
begin
  FCdsTipoInvest := Value;
end;

//AL_5
procedure TCtrlInvestimento.SetDbTipoInvest(const Value: TDbTipoInvest);
begin
  FDbTipoInvest := Value;
end;

//AL_5
function TCtrlInvestimento.AplicaAtualTipoInvest: Boolean;
begin
   if ConnectionSide = cnsClient then
    begin
       //AL_12
       Result := Connection.AppServer.AplicaAtualTipoInvest;
       if not Result then MessageInfo := Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          Result := ApplyCds(FCdsTipoInvest,DbTipoInvest,[],[]);
          if not Result then
           begin
              MessageInfo := DbTipoInvest.MessageInfo;
              Rollback;
           end
          else
           Commit;
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

//AL_9
function TCtrlInvestimento.ListPenhoraJurico(dDataIni, dDataFim : TDateTime;
                                             iFlgInvLido, iTipoInvest : Integer;
                                             iTipoCota : integer = 0;
                                             iPlanPrev  : Integer = -1;
                                             iInvestimento : Integer = -1;
                                             iOperAplic : Integer = -1;
                                             iFundoInvest : integer = -1) : OleVariant;
var
   sSql : String;
begin

   sSql := '';

   sSql := 'SELECT ' + #13 +
           '   DATAREALOCOR, IDINVESTIMENTO, VALORREC, IDPLANPREVCTBPATR, IDFUNDOINVEST, FLGINVESTLIDO, IDTIPOCOTA, ' + #13 +
           '   IDCUSTODIANTE, IDOPERRENFIXAPLIC, ASSUNTO, OBSERVETAPA, NUMPROCTRAB, NUMSEQ, DESCINVESTIMENTO, IDCLASSETIT, ' + #13 +
           '   INVTIPOINVEST, IDFORCLI, IDCARTEIRAINVEST, IDCLASSRISCORENFIX, IDTIPOFUNDOINVEST, DESCFUNDOINVEST, FDOTIPOINVEST, QTDDECQTD ' + #13 +
           'FROM  ' + #13 +
           '   (SELECT ' + #13 +
           '       ET.DATAREALOCOR, ET.IDINVESTIMENTO, ET.VALORREC, ET.IDPLANPREVCTBPATR, ET.IDFUNDOINVEST, ET.FLGINVESTLIDO, ' + #13 +
           '       ET.IDTIPOCOTA, ET.IDCUSTODIANTE, ET.IDOPERRENFIXAPLIC, ET.ASSUNTO, ET.OBSERVETAPA, ET.NUMPROCTRAB, ET.NUMSEQ, ' + #13 +
           '       IV.DESCINVESTIMENTO, IV.IDCLASSETIT, (IV.IDTIPOINVEST) AS INVTIPOINVEST, (IV.IDEMISSOR) AS IDFORCLI, ' + #13 +
           '       (PA.IDCARTEIRARF) AS IDCARTEIRAINVEST, (CL.IDCLASSERISCO) AS IDCLASSRISCORENFIX, ' + #13 +
           '        (0) AS IDTIPOFUNDOINVEST, ('''') AS DESCFUNDOINVEST, (0) AS FDOTIPOINVEST, (0) AS QTDDECQTD ' + #13 +
           '    FROM  ' + #13 +
           '       ETAPAPROCTRAB ET, INVESTIMENTO IV, PARAMINVEST PA, CLASSETITRENFIX CL ' + #13 +
           '    WHERE ' + #13 +
           '       (ET.DATAREALOCOR BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDataIni)) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'')) '+ #13 +
           '       AND (ET.FLGINVESTLIDO = ' + IntToStr(iFlgInvLido) + ') ';

   if iPlanPrev > 0 then
      sSQL := sSQL + '  AND (ET.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' ) ';
   if iInvestimento > 0 then
      sSQL := sSQL + '  AND (ET.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' ) ';
   if iOperAplic > 0 then
      sSQL := sSQL + '  AND (ET.IDOPERRENFIXAPLIC = ' + IntToStr(iOperAplic) + ' ) ';
   //kINTANA 553672  SOL 117465 25/05/2009 - Thiago Passos
   if iTipoInvest > 0 then
      sSQL := sSQL + '  AND (ET.IDTIPOINVEST = ' + IntToStr(iTipoInvest) + ' ) ';

   sSQL := sSQL + '       AND (ET.IDINVESTIMENTO IS NOT NULL) '+ #13 +
           '       AND (ET.IDINVESTIMENTO = IV.IDINVESTIMENTO) '+ #13 +
           '       AND (IV.IDCLASSETIT = CL.IDCLASSETIT) '+ #13 +

           '    UNION ALL  '+ #13 +

           '    SELECT  '+ #13 +
           '       ET.DATAREALOCOR, ET.IDINVESTIMENTO, ET.VALORREC, ET.IDPLANPREVCTBPATR, ET.IDFUNDOINVEST, ET.FLGINVESTLIDO, '+ #13 +
           '       ET.IDTIPOCOTA, ET.IDCUSTODIANTE, ET.IDOPERRENFIXAPLIC, ET.ASSUNTO, ET.OBSERVETAPA, ET.NUMPROCTRAB, ET.NUMSEQ, '+ #13 +
           '       ('''') AS DESCINVESTIMENTO, (0) AS IDCLASSETIT, (0) AS INVTIPOINVEST, (0) AS IDFORCLI, (0) AS IDCARTEIRAINVEST, '+ #13 +
           '       (0) AS IDCLASSRISCORENFIX, FD.IDTIPOFUNDOINVEST, FD.DESCFUNDOINVEST, (FD.IDTIPOINVEST) FDOTIPOINVEST, FD.QTDDECQTD  '+ #13 +
           '    FROM  '+ #13 +
           '       ETAPAPROCTRAB ET, '+ #13 +
           '       (SELECT HF.IDFUNDOINVEST, HF.DESCFUNDOINVEST, HF.IDTIPOFUNDOINVEST, TF.IDTIPOINVEST, HF.QTDDECQTD '+ #13 +
           '        FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF  '+ #13 +
           '        WHERE HF.IDFUNDOINVEST || TO_CHAR(HF.DTAVIGENCIA' + ',''DD/MM/YYYY HH24:MI:SS'') IN '+ #13 +
           '             (SELECT IDFUNDOINVEST || TO_CHAR(MAX(DTAVIGENCIA)' + ',''DD/MM/YYYY HH24:MI:SS'') '+ #13 +
           '              FROM HISTFUNDOINVEST  '+ #13 +
           '              GROUP BY IDFUNDOINVEST) '+ #13 +
           '           AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)) FD '+ #13 +
           '    WHERE '+ #13 +
           '        (ET.DATAREALOCOR BETWEEN TO_DATE('+ QuotedStr(DateToStr(dDataIni)) +',''DD/MM/YYYY'') AND TO_DATE('+ QuotedStr(DateToStr(dDataFim)) +',''DD/MM/YYYY'')) '+ #13 +
           '        AND (ET.FLGINVESTLIDO = ' + IntToStr(iFlgInvLido) + ')'+ #13 +
           '        AND (ET.IDTIPOINVEST <> 1)';
   if iPlanPrev > 0 then
      sSQL := sSQL + '  AND (ET.IDPLANPREVCTBPATR = ' + IntToStr(iPlanPrev) + ' ) ';
   if iInvestimento > 0 then
      sSQL := sSQL + '  AND (ET.IDINVESTIMENTO = ' + IntToStr(iInvestimento) + ' ) ';
   if iFundoInvest > 0 then
   begin
      sSQL := sSQL + '  AND (ET.IDFUNDOINVEST = ' + IntToStr(iFundoInvest) + ' ) ';
      sSQL := sSQL + '  AND (ET.IDTIPOCOTA = ' + IntToStr(iTipoCota) + ' ) ';
   end;
   //kINTANA 553672  SOL 117465 25/05/2009 - Thiago Passos
   if iTipoInvest > 0 then
      sSQL := sSQL + '  AND (ET.IDTIPOINVEST = ' + IntToStr(iTipoInvest) + ' ) ';
      
   sSQL := sSQL + '        AND (ET.IDFUNDOINVEST IS NOT NULL) '+ #13 +
           '        AND (ET.IDFUNDOINVEST = FD.IDFUNDOINVEST)) '+ #13 +
           'ORDER BY DATAREALOCOR ';
   Result := GetDataPacket(sSql);
end;

//AL_9
function TCtrlInvestimento.IntegraPenhoraJuridico(dDataIni, dDataFim : TDateTime;
                                                  iFlgInvLido, iTipoInvest : Integer;
                                                  iPlanPrev  : Integer = -1;
                                                  iInvestimento : Integer = -1;
                                                  iOperAplic : Integer = -1;
                                                  iFundoInvest : integer = -1;
                                                  iTipoCota : integer = 0) : Boolean;
var
   CdsItemXOpeXInv, CdsAutorizador, CdsListPenhoraJuridico, CdsOperBloqueioFdo, CdsCotaFundo : TClientDataSet;
   sSql, sNaturMov : String;
   fQtdCotas : Double;
   iTipoOperacao : Integer;
begin
   if ConnectionSide = cnsClient then
   begin
      Result := Connection.AppServer.IntegraPenhoraJuridico(dDataIni, dDataFim ,
                                                            iFlgInvLido, iTipoInvest, iTipoCota,
                                                            iPlanPrev, iInvestimento, iOperAplic, iFundoInvest);
      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      Try
         Result := True;
         CdsListPenhoraJuridico := TClientDataSet.Create(nil);
         CdsAutorizador         := TClientDataSet.Create(nil);
         CdsItemXOpeXInv        := TClientDataSet.Create(nil);
         CdsOperBloqueioFdo     := TClientDataSet.Create(nil);
         CdsCotaFundo           := TClientDataSet.Create(nil);

         CdsAutorizador.Data := ListAutorizadorDeOperacao;

         CdsListPenhoraJuridico.Data := ListPenhoraJurico(dDataIni, dDataFim ,
                                                          iFlgInvLido, iTipoInvest, iTipoCota,
                                                          iPlanPrev, iInvestimento, iOperAplic, iFundoInvest);
         if not CdsListPenhoraJuridico.IsEmpty then
         begin
            try
               StartTransaction;

               while not CdsListPenhoraJuridico.EOF do
               begin
                  // Renda Fixa
                  if not CdsListPenhoraJuridico.FieldByName('IDINVESTIMENTO').IsNull then
                  begin
                     // BuscaSaldosRFPoup
                     //AL_14
                     if ((CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) and
                         (CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat < 0)) then
                     begin
                         //AL_14
                         CtrlRendaFixa.BuscaSaldoRFPoup.ExecutaPoup(CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                                                    CdsListPenhoraJuridico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                                    CdsListPenhoraJuridico.FieldByName('IDOPERRENFIXAPLIC').AsInteger,
                                                                    CtrlPInv.IDCLASSEPOUP,
                                                                    CtrlPInv.IDCLASSPOUPBLOQ);
                         // Se não tiver Saldo proximo
                         if CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.IsEmpty then
                         begin
                            CdsListPenhoraJuridico.Next;
                            Continue;
                         end;
                     end
                     // BuscaSaldosRF
                     //AL_14
                     else if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger <> CtrlPInv.IDCLASSPOUPBLOQ) then
                     begin
                         CtrlRendaFixa.BuscaSaldoRF.Executa(CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime,
                                                            CdsListPenhoraJuridico.FieldByName('IDINVESTIMENTO').AsInteger,
                                                            CdsListPenhoraJuridico.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                         // Se não tiver Saldo proximo
                         if CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.IsEmpty then
                         begin
                            CdsListPenhoraJuridico.Next;
                            Continue;
                         end;
                     end;

                     //Carrega Dados OPERRENFIX e HISTRENFIX
                     CtrlRendaFixa.DbOperRenFix.Clear;
                     CtrlRendaFixa.DbHistRenFix.Clear;

                     CtrlRendaFixa.DbOperRenFix.Idinvestimento.AsInteger    := CdsListPenhoraJuridico.FieldByName('IDINVESTIMENTO').AsInteger;
                     CtrlRendaFixa.DbOperRenFix.Idcustodiante.AsInteger     := CdsListPenhoraJuridico.FieldByName('IDCUSTODIANTE').AsInteger;
                     CtrlRendaFixa.DbOperRenFix.Idplanprevctbpatr.AsInteger := CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                     //AL_14
                     CtrlRendaFixa.DbOperRenFix.Moecodigo.AsInteger         := CtrlPInv.MOECODIGO;
                     CtrlRendaFixa.DbOperRenFix.Dataoperacao.AsDateTime     := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlRendaFixa.DbOperRenFix.Dataliquidacao.AsDateTime   := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlRendaFixa.DbOperRenFix.Idtipoinvest.AsInteger      := 1;
                     CtrlRendaFixa.DbOperRenFix.Flgcarthipo.AsString        := 'N';
                     CtrlRendaFixa.DbOperRenFix.Qtdcarthipo.AsFloat         := 0;


                     if not CdsAutorizador.IsEmpty then
                        CtrlRendaFixa.DbOperRenFix.Idusuario.AsInteger       := CdsAutorizador.FieldByName('IDUSUARIO').AsInteger;

                     //AL_14
                     CtrlRendaFixa.DbOperRenFix.Idcarteirainvest.AsInteger   :=  CtrlPInv.IDCARTEIRARF;
                     CtrlRendaFixa.DbOperRenFix.Idforcli.AsInteger           :=  CdsListPenhoraJuridico.FieldByName('IDFORCLI').AsInteger;
                     if CdsListPenhoraJuridico.FieldByName('IDCLASSRISCORENFIX').AsInteger <> 0 then
                        CtrlRendaFixa.DbOperRenFix.Idclassriscorenfix.AsInteger :=  CdsListPenhoraJuridico.FieldByName('IDCLASSRISCORENFIX').AsInteger;

                     //AL_14
                     CtrlRendaFixa.DbHistRenFix.Idempresaprop.AsInteger      := CtrlPInv.IDEmpresa;
                     CtrlRendaFixa.DbHistRenFix.Idmodulo.AsInteger           := CtrlPInv.IDModulo;
                     CtrlRendaFixa.DbHistRenFix.Idplanprevctbpatr.AsInteger  := CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                     CtrlRendaFixa.DbHistRenFix.Idinvestimento.AsInteger     := CdsListPenhoraJuridico.FieldByName('IDINVESTIMENTO').AsInteger;
                     CtrlRendaFixa.DbHistRenFix.Datahistrenfix.AsDateTime    := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                     CtrlRendaFixa.DbHistRenFix.Vlrhistrenfix.AsFloat        := 0;
                     CtrlRendaFixa.DbHistRenFix.Qtdhistrenfix.AsFloat        := 0;
                     CtrlRendaFixa.DbHistRenFix.Flgrecalc.AsString           := 'S';
                     CtrlRendaFixa.DbHistRenFix.Tipmovhisrenfix.AsString     := 'OPE';
                     //AL_14
                     CtrlRendaFixa.DbHistRenFix.Idcarteirainvest.AsInteger   := CtrlPInv.IDCARTEIRARF;

                     // Se for Poupança Bloqueada, faz uma Aplicação ou Resgate Penhorado
                     //AL_14
                     if CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ then
                     begin
                        // Aplicação Penhorada
                        if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0 then
                        begin
                           iTipoOperacao := -168;
                           CtrlRendaFixa.DbOperRenFix.Idtipooperacao.AsInteger := iTipoOperacao;
                           CtrlRendaFixa.DbOperRenFix.Puoperacao.AsFloat       := 1000;
                           CtrlRendaFixa.DbOperRenFix.Puemissao.AsFloat        := 1000;
                           CtrlRendaFixa.DbOperRenFix.Vlroperacao.AsFloat      := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                           CtrlRendaFixa.DbOperRenFix.Qtdeoperacao.AsFloat     := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                           CtrlRendaFixa.DbOperRenFix.Dataemissao.AsDateTime   := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                           CtrlRendaFixa.DbOperRenFix.Flgnegociacao.AsString   := 'N';

                           CtrlRendaFixa.DbHistRenFix.Idtipooperacao.AsInteger   := iTipoOperacao;
                           CtrlRendaFixa.DbHistRenFix.Naturmovhistrenfi.AsString := 'A';
                           CtrlRendaFixa.DbHistRenFix.Histmovrenfix.AsString     := 'Aplicação Penhorada';
                           CtrlRendaFixa.DbHistRenFix.Saldovlrhistrenfi.AsFloat  := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                           CtrlRendaFixa.DbHistRenFix.Saldoqtdhistrenfi.AsFloat  := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                           //AL_14
                           CtrlRendaFixa.DbHistRenFix.Vlrhistrenfix.AsFloat      := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                           CtrlRendaFixa.DbHistRenFix.Qtdhistrenfix.AsFloat      := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);

                           //AL_14
                           CtrlRendaFixa.DbOperRenFix.Idcarteirainvest.AsInteger   := CtrlPInv.IDCARTEIRARF;//pRPI.IDCARTEIRARF;
                           CtrlRendaFixa.DbOperRenFix.Idforcli.AsInteger           := CdsListPenhoraJuridico.FieldByName('IDFORCLI').AsInteger;
                           if CdsListPenhoraJuridico.FieldByName('IDCLASSRISCORENFIX').AsInteger <> 0 then
                              CtrlRendaFixa.DbOperRenFix.Idclassriscorenfix.AsInteger := CdsListPenhoraJuridico.FieldByName('IDCLASSRISCORENFIX').AsInteger;
                           //AL_14
                           CtrlRendaFixa.DbHistRenFix.Idcarteirainvest.AsInteger   := CtrlPInv.IDCARTEIRARF;

                        end
                        // Resgate de Aplicação Penhorada
                        else if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat < 0 then
                        begin
                           iTipoOperacao := -169;
                           CtrlRendaFixa.DbOperRenFix.Idtipooperacao.AsInteger := iTipoOperacao;
                           CtrlRendaFixa.DbOperRenFix.Puoperacao.AsFloat       := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat) / (ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000));
                           CtrlRendaFixa.DbOperRenFix.Puemissao.AsFloat        := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixPoup.FieldByName('PUEMISSAO').AsFloat;
                           CtrlRendaFixa.DbOperRenFix.Vlroperacao.AsFloat      := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                           CtrlRendaFixa.DbOperRenFix.Qtdeoperacao.AsFloat     := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                           CtrlRendaFixa.DbOperRenFix.Dataemissao.AsDateTime   := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixPoup.FieldByName('DATAEMISSAO').AsDateTime;


                           CtrlRendaFixa.DbHistRenFix.Idtipooperacao.AsInteger    := iTipoOperacao;
                           CtrlRendaFixa.DbHistRenFix.Naturmovhistrenfi.AsString  := 'D';
                           CtrlRendaFixa.DbHistRenFix.Histmovrenfix.AsString      := 'Resgate da Aplicação Penhorada';
                           CtrlRendaFixa.DbHistRenFix.Saldovlrhistrenfi.AsFloat   := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('SALDOVLRHISTRENFI').AsFloat;
                           CtrlRendaFixa.DbHistRenFix.Saldoqtdhistrenfi.AsFloat   := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('SALDOQTDHISTRENFI').AsFloat;
                           //AL_14
                           CtrlRendaFixa.DbHistRenFix.Vlrhistrenfix.AsFloat       := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                           CtrlRendaFixa.DbHistRenFix.Qtdhistrenfix.AsFloat       := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                        end;
                     end
                     // Faz um Bloqueio ou Desbloqueio de Saldo
                     else
                     begin
                        CtrlRendaFixa.DbOperRenFix.Puoperacao.AsFloat         := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('PUOPERACAO').AsFloat;
                        CtrlRendaFixa.DbOperRenFix.Puemissao.AsFloat          := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('PUEMISSAO').AsFloat;
                        CtrlRendaFixa.DbOperRenFix.Vlroperacao.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);

                        CtrlRendaFixa.DbOperRenFix.Qtdeoperacao.AsFloat       := ((ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat) *
                                                                                   CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('SALDOQTDHISTRENFI').AsFloat) /
                                                                                  CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('SALDOVLRHISTRENFI').AsFloat);


                        CtrlRendaFixa.DbOperRenFix.Vencoperacao.AsDateTime    := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('VENCOPERACAO').AsDateTime;
                        CtrlRendaFixa.DbOperRenFix.Dataemissao.AsDateTime     := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('DATAEMISSAO').AsDateTime;
                        CtrlRendaFixa.DbOperRenFix.Pumercado.AsFloat          := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('PUMERCADO').AsFloat;
                        CtrlRendaFixa.DbOperRenFix.Dataleilao.AsDateTime      := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('DATALEILAO').AsDateTime;
                        CtrlRendaFixa.DbOperRenFix.Flgnegociacao.AsString     := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('FLGNEGOCIACAO').AsString;
                        CtrlRendaFixa.DbOperRenFix.Flgcarthipo.AsString       := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('FLGCARTHIPO').AsString;
                        CtrlRendaFixa.DbOperRenFix.Qtdcarthipo.AsFloat        := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('QTDCARTHIPO').AsFloat;
                        CtrlRendaFixa.DbOperRenFix.Idoperrenfixorig.AsInteger := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger;
                        // Bloqueio
                        if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0 then
                        begin
                           iTipoOperacao := -166;
                           CtrlRendaFixa.DbOperRenFix.Idtipooperacao.AsInteger   := iTipoOperacao;

                           CtrlRendaFixa.DbHistRenFix.Idtipooperacao.AsInteger   := iTipoOperacao;
                           CtrlRendaFixa.DbHistRenFix.Naturmovhistrenfi.AsString := 'A';
                           CtrlRendaFixa.DbHistRenFix.Histmovrenfix.AsString     := 'Bloqueio de Penhora';
                        end
                        // Desbloqueio
                        else if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat < 0 then
                        begin
                           iTipoOperacao := -167;
                           CtrlRendaFixa.DbOperRenFix.Idtipooperacao.AsInteger   := iTipoOperacao;

                           CtrlRendaFixa.DbHistRenFix.Idtipooperacao.AsInteger   := iTipoOperacao;
                           CtrlRendaFixa.DbHistRenFix.Naturmovhistrenfi.AsString := 'D';
                           CtrlRendaFixa.DbHistRenFix.Histmovrenfix.AsString     := 'Desbloqueio de Penhora';
                        end;
                     end;

                     // Aplica a alteração na Tabela
                     if not CtrlRendaFixa.DbOperRenFix.Insert then
                        Raise Exception.Create(CtrlRendaFixa.DbOperRenFix.MessageInfo)
                     else
                        IdOperRenFix := CtrlRendaFixa.DbOperRenFix.IdOperRenFix.AsInteger;

                     // Aplicação Penhorada
                     //AL_14
                     if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) and
                        (CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0) then
                     begin
                        if not ExecSQL('UPDATE OPERRENFIX SET IDOPERRENFIXAPLIC = '+ IntToStr(IdOperRenFix) +
                                       'WHERE (IDOPERRENFIX = '+ IntToStr(IdOperRenFix) + ') ') then
                           Raise Exception.Create(CtrlRendaFixa.DbOperRenFix.MessageInfo);
                     end
                     else
                     begin
                        //AL_14
                        if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) then
                        begin
                           sSql := '';
                           sSql := 'UPDATE OPERRENFIX SET IDOPERRENFIXAPLIC = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           if not CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXORIG').IsNull then
                              sSql := sSql + ' , IDOPERRENFIXORIG = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXORIG').AsInteger);
                           sSql := sSql + ' WHERE (IDOPERRENFIX = '+ IntToStr(IdOperRenFix) + ') ';
                           if not ExecSQL(sSql, False) Then
                              Raise Exception.Create('');
                        end
                        else
                        begin
                           sSql := '';
                           sSql := 'UPDATE OPERRENFIX SET IDOPERRENFIXAPLIC = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           if not CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('IDOPERRENFIXORIG').IsNull then
                              sSql := sSql + ' , IDOPERRENFIXORIG = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger);
                           sSql := sSql + ' WHERE (IDOPERRENFIX = '+ IntToStr(IdOperRenFix) + ') ';
                           if not ExecSQL(sSql, False) Then
                              Raise Exception.Create('');
                        end;
                     end;

                     // Aplica a alteração na Tabela
                     if not CtrlRendaFixa.DbHistRenFix.Insert then
                        Raise Exception.Create(CtrlRendaFixa.DbHistRenFix.MessageInfo)
                     else
                        IdHistRenFix := CtrlRendaFixa.DbHistRenFix.IdHistRenFix.AsInteger;

                     // Aplicação Penhorada
                     //AL_14
                     if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) and
                        (CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0) then
                     begin
                        if not ExecSQL('UPDATE HISTRENFIX SET IDOPERRENFIX = '+ IntToStr(IdOperRenFix) + ', IDOPERRENFIXAPLIC = '+ IntToStr(IdOperRenFix) +
                                       'WHERE (IDHISTRENFIX = '+ IntToStr(IdHistRenFix) + ') ') then
                           Raise Exception.Create(CtrlRendaFixa.DbHistRenFix.MessageInfo);
                     end
                     else
                     begin
                        //AL_14
                        if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) then
                        begin
                           sSql := '';
                           sSql := 'UPDATE HISTRENFIX SET IDOPERRENFIX = '+ IntToStr(IdOperRenFix) +
                                   ', IDOPERRENFIXAPLIC = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           if not CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXORIG').IsNull then
                              sSql := sSql + ' , IDOPERRENFIXORIG = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXORIG').AsInteger);
                           sSql := sSql + ' WHERE (IDHISTRENFIX = '+ IntToStr(IdHistRenFix) + ') ';
                           if not ExecSQL(sSql, False) Then
                              Raise Exception.Create('');
                        end
                        else
                        begin
                           sSql := '';
                           sSql := 'UPDATE HISTRENFIX SET IDOPERRENFIX = '+ IntToStr(IdOperRenFix) +
                                   ', IDOPERRENFIXAPLIC = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('IDOPERRENFIXAPLIC').AsInteger);
                           if not CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('IDOPERRENFIXORIG').IsNull then
                              sSql := sSql + ' , IDOPERRENFIXORIG = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('IDOPERRENFIXORIG').AsInteger);
                           sSql := sSql + ' WHERE (IDHISTRENFIX = '+ IntToStr(IdHistRenFix) + ') ';
                           if not ExecSQL(sSql, False) Then
                              Raise Exception.Create('');
                        end;
                     end;
                     //Carrega Dados OPERRENFIXXCURVAS E HISTRENFIXXITENS
                     CtrlRendaFixa.DbOperRenFixXCurvas.Clear;
                     CtrlRendaFixa.DbHistRenFixXItens.Clear;

                     CdsItemXOpeXInv.Data := CtrlRendaFixa.ListItemXOpeXInv(CdsListPenhoraJuridico.FieldByName('IDINVESTIMENTO').AsInteger);
                     if not CdsItemXOpeXInv.IsEmpty then
                     begin
                        // Se for Poupança Bloqueada, faz uma Aplicação Penhorado
                        //AL_14
                        if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) and
                           (CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0) then
                        begin
                           while not CdsItemXOpeXInv.Eof do
                           begin
                              //Itens Negativos
                              if CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger < 0 then
                              begin
                                 if (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -1) or     // -1: Principal
                                    (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) or     // -5: Valor Liquido
                                    (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -6) or     // -6: Valor Bruto
                                    (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -22) or    // -22: Valor Bloqueado Penhora
                                    (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -23) then  // -23: Quantidade Bloqueado Penhora
                                 begin
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.Clear;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := 100;
                                    if CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -23 then
                                       CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat)/ 1000
                                    else
                                       CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);

                                    CtrlRendaFixa.DbHistRenFixXItens.Idhistrenfix.AsInteger    := IdHistRenFix;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idcurvarenfix.AsInteger   := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Iditemrenfix.AsInteger    := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idregracalculo.AsInteger  := CdsItemXOpeXInv.FieldByName('IDREGRA').AsInteger;
                                    if CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -23 then
                                    begin
                                       CtrlRendaFixa.DbHistRenFixXItens.Puitem.AsFloat            := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat)/ 1000;
                                       CtrlRendaFixa.DbHistRenFixXItens.Puacuitem.AsFloat         := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat)/ 1000;
                                    end
                                    else
                                    begin
                                       CtrlRendaFixa.DbHistRenFixXItens.Puitem.AsFloat            := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                                       CtrlRendaFixa.DbHistRenFixXItens.Puacuitem.AsFloat         := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                                    end;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlritem.AsFloat           := 0;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlracuitem.AsFloat        := 0;
                                 end
                                 else if (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -2) then  // -2: Quantidade
                                 begin
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.Clear;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := 100;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);

                                    CtrlRendaFixa.DbHistRenFixXItens.Idhistrenfix.AsInteger    := IdHistRenFix;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idcurvarenfix.AsInteger   := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Iditemrenfix.AsInteger    := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idregracalculo.AsInteger  := CdsItemXOpeXInv.FieldByName('IDREGRA').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Puitem.AsFloat            := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                                    CtrlRendaFixa.DbHistRenFixXItens.Puacuitem.AsFloat         := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlritem.AsFloat           := 0;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlracuitem.AsFloat        := 0;
                                 end
                                 else if (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) or    // -3: PU de Emissão
                                         (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -4) then  // -4: PU de Operação
                                 begin
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.Clear;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := 100;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := 1000;

                                    CtrlRendaFixa.DbHistRenFixXItens.Idhistrenfix.AsInteger    := IdHistRenFix;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idcurvarenfix.AsInteger   := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Iditemrenfix.AsInteger    := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idregracalculo.AsInteger  := CdsItemXOpeXInv.FieldByName('IDREGRA').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Puitem.AsFloat            := 1000;
                                    CtrlRendaFixa.DbHistRenFixXItens.Puacuitem.AsFloat         := 1000;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlritem.AsFloat           := 0;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlracuitem.AsFloat        := 0;
                                 end
                                 // Demais Itens Negativos
                                 else
                                 begin
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.Clear;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := 100;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := 0;

                                    CtrlRendaFixa.DbHistRenFixXItens.Idhistrenfix.AsInteger    := IdHistRenFix;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idcurvarenfix.AsInteger   := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Iditemrenfix.AsInteger    := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Idregracalculo.AsInteger  := CdsItemXOpeXInv.FieldByName('IDREGRA').AsInteger;
                                    CtrlRendaFixa.DbHistRenFixXItens.Puitem.AsFloat            := 0;
                                    CtrlRendaFixa.DbHistRenFixXItens.Puacuitem.AsFloat         := 0;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlritem.AsFloat           := 0;
                                    CtrlRendaFixa.DbHistRenFixXItens.Vlracuitem.AsFloat        := 0;
                                 end;
                              end
                              //Itens Positivos
                              else
                              begin
                                 CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                 CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                 CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                 CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.Clear;
                                 if CdsItemXOpeXInv.FieldByName('FLGMOEDA').AsString = 'Y' then
                                 //AL_14
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger  := CtrlPInv.IDINDEXPOUPANCA;
                                 CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := 100;
                                 CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := 0;
                                 if CdsItemXOpeXInv.FieldByName('TIPOITEM').AsString = 'T' then // Taxa
                                 //AL_14
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat     := CtrlPInv.JUROSPOUPANCA;

                                 CtrlRendaFixa.DbHistRenFixXItens.Idhistrenfix.AsInteger    := IdHistRenFix;
                                 CtrlRendaFixa.DbHistRenFixXItens.Idcurvarenfix.AsInteger   := CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger;
                                 CtrlRendaFixa.DbHistRenFixXItens.Iditemrenfix.AsInteger    := CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger;
                                 CtrlRendaFixa.DbHistRenFixXItens.Idregracalculo.AsInteger  := CdsItemXOpeXInv.FieldByName('IDREGRA').AsInteger;
                                 CtrlRendaFixa.DbHistRenFixXItens.Puitem.AsFloat            := 0;
                                 CtrlRendaFixa.DbHistRenFixXItens.Puacuitem.AsFloat         := 0;
                                 CtrlRendaFixa.DbHistRenFixXItens.Vlritem.AsFloat           := 0;
                                 CtrlRendaFixa.DbHistRenFixXItens.Vlracuitem.AsFloat        := 0;
                              end;

                              // Aplica a alteração na Tabela
                              if not CtrlRendaFixa.DbOperRenFixXCurvas.Insert then
                                 Raise Exception.Create(CtrlRendaFixa.DbOperRenFixXCurvas.MessageInfo);

                              // Aplica a alteração na Tabela
                              if not CtrlRendaFixa.DbHistRenFixXItens.Insert then
                                 Raise Exception.Create(CtrlRendaFixa.DbHistRenFixXItens.MessageInfo);

                              CdsItemXOpeXInv.Next;
                           end;
                        end
                        // Resgate de Poupança Penhorada e outros Títulos, Repete os itens do Historico(BuscaSaldosRF)
                        else
                        begin
                           while not CdsItemXOpeXInv.Eof do
                           begin
                              // Se for Poupança Bloqueada
                              //AL_14
                              if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) then
                              begin
                                 // Localizar o item na BuscaSaldo
                                 CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                                                                   VarArrayOf([CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                                                                                               CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger]),
                                                                                                               []);

                                 //Itens Negativos
                                 if CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger < 0 then
                                 begin
                                    if (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -1) or     // -1: Principal
                                       (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -5) or     // -5: Valor Liquido
                                       (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -6) or     // -6: Valor Bruto
                                       (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -22) or    // -22: Valor Bloqueado Penhora
                                       (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -23) then  // -23: Quantidade Bloqueado Penhora
                                    begin
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDITEMRENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDCURVARENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger     := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('MOECODIGO').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('PERCCURVA').AsFloat;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);
                                    end
                                    else if (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -2) then // Quantidade
                                    begin
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDITEMRENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDCURVARENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger     := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('MOECODIGO').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('PERCCURVA').AsFloat;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000);
                                    end
                                    else if (CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -4) then // PU Operação
                                    begin
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDITEMRENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDCURVARENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger     := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('MOECODIGO').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('PERCCURVA').AsFloat;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat) /(ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / 1000));
                                    end
                                    else
                                    begin
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDITEMRENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDCURVARENFIX').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger     := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('MOECODIGO').AsInteger;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('PERCCURVA').AsFloat;
                                        CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('VLRCURVA').AsFloat;;
                                    end;
                                 end
                                 //Itens Positivos
                                 else
                                 begin
                                     CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                     CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDITEMRENFIX').AsInteger;
                                     CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('IDCURVARENFIX').AsInteger;
                                     CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger     := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('MOECODIGO').AsInteger;
                                     CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('PERCCURVA').AsFloat;
                                     CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat        := CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldOperRenFixXCurvasPoup.FieldByName('VLRCURVA').AsFloat;
                                 end;

                                 //AL_14
                                 if not CtrlRendaFixa.DbOperRenFixXCurvas.Insert then
                                    Raise Exception.Create(CtrlRendaFixa.DbOperRenFixXCurvas.MessageInfo);

                              end
                              // Demais Titulos
                              else
                              begin
                                 // Localizar o item na BuscaSaldo
                                 //AL_14
                                 if CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFixXCurvas.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                                                           VarArrayOf([CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                                                                                       CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger]),
                                                                                                       []) then
                                 begin
                                    CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFixXItens.Locate('IDCURVARENFIX;IDITEMRENFIX',
                                                                                              VarArrayOf([CdsItemXOpeXInv.FieldByName('IDCURVARENFIX').AsInteger,
                                                                                                          CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger]),
                                                                                                          []);

                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idoperrenfix.AsInteger  := IdOperRenFix;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Iditemrenfix.AsInteger  := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFixXCurvas.FieldByName('IDITEMRENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Idcurvarenfix.AsInteger := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFixXCurvas.FieldByName('IDCURVARENFIX').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Moecodigo.AsInteger     := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFixXCurvas.FieldByName('MOECODIGO').AsInteger;
                                    CtrlRendaFixa.DbOperRenFixXCurvas.Perccurva.AsFloat       := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFixXCurvas.FieldByName('PERCCURVA').AsFloat;
                                    // Penhora
                                    if CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -22 then // Vlr Penhorado
                                       CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat)
                                    else if CdsItemXOpeXInv.FieldByName('IDITEMRENFIX').AsInteger = -23 then  // Qtd Penhorada
                                       CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat := ((ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat) *
                                                                                                   CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('SALDOQTDHISTRENFI').AsFloat)/
                                                                                              CtrlRendaFixa.BuscaSaldoRF.CdsSldHistRenFix.FieldByName('SALDOVLRHISTRENFI').AsFloat)
                                    else
                                       CtrlRendaFixa.DbOperRenFixXCurvas.Vlrcurva.AsFloat := CtrlRendaFixa.BuscaSaldoRF.CdsSldOperRenFixXCurvas.FieldByName('VLRCURVA').AsFloat;

                                    // Aplica a alteração na Tabela
                                    //AL_14
                                    if not CtrlRendaFixa.DbOperRenFixXCurvas.Insert then
                                       Raise Exception.Create(CtrlRendaFixa.DbOperRenFixXCurvas.MessageInfo);
                                 end;
                              end;

                              CdsItemXOpeXInv.Next;
                           end;
                        end;
                     end;
                  end
                  // Fundos
                  else if not CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').IsNull then
                  begin
                     //--emerson KT117465 SOL553672 - inicio--//
                     // Penhora - Faz um Bloqueio de Saldo
                     //if CdsListPenhoraJuridico.FieldByName('VALOR').AsFloat > 0 then
                     if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0 then
                        sNaturMov := 'D'
                     // Desbloqueip
                     //else if CdsListPenhoraJuridico.FieldByName('VALOR').AsFloat < 0 then
                     else if CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat < 0 then
                        sNaturMov := 'A';
                     //--emerson KT117465 SOL553672 - fim--//   

                     CdsOperBloqueioFdo.Data := CtrlFundos.ListOperBloqueioFundo(CdsListPenhoraJuridico.FieldByName('FDOTIPOINVEST').AsInteger,
                                                                                 sNaturMov);

                     if not CdsOperBloqueioFdo.IsEmpty then
                     begin

                        CdsCotaFundo.Data := CtrlFundos.ListCotaFundo(CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger,
                                                                  CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime);

                        if not CdsCotaFundo.IsEmpty then
                        begin
                           CtrlFundos.DbPedidofundo.Clear;

                           CtrlFundos.DbPedidofundo.Idplanprevctbpatr.AsInteger := CdsListPenhoraJuridico.FieldByName('IDPLANPREVCTBPATR').AsInteger;
                           CtrlFundos.DbPedidofundo.Idtipoinvest.AsInteger      := CdsListPenhoraJuridico.FieldByName('FDOTIPOINVEST').AsInteger;
                           CtrlFundos.DbPedidofundo.Idfundoinvest.AsInteger     := CdsListPenhoraJuridico.FieldByName('IDFUNDOINVEST').AsInteger;
                           CtrlFundos.DbPedidofundo.Idtipooperacao.AsInteger    := CdsOperBloqueioFdo.FieldByName('IDTIPOOPERACAO').AsInteger;
                           CtrlFundos.DbPedidofundo.Idtipocota.AsInteger        := CdsListPenhoraJuridico.FieldByName('IDTIPOCOTA').AsInteger;
                           //AL_14
                           CtrlFundos.DbPedidofundo.Idmotivobloqueio.AsInteger  := CtrlPInv.IDMOTBLOQPENFDO;
                           CtrlFundos.DbPedidofundo.Datapedido.AsDateTime       := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                           CtrlFundos.DbPedidofundo.Datacotizacao.AsDateTime    := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                           CtrlFundos.DbPedidofundo.Dataliquidacao.AsDateTime   := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                           CtrlFundos.DbPedidofundo.Dataaplicacao.AsDateTime    := CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsDateTime;
                           CtrlFundos.DbPedidofundo.Vlrcota.AsFloat             := CdsCotaFundo.FieldByName('VLRCOTA').AsFloat;
                           CtrlFundos.DbPedidofundo.Vlrpedido.AsFloat           := ABS(CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat);

                           fQtdCotas := RoundCM((CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat / CdsCotaFundo.FieldByName('VLRCOTA').AsFloat), CdsListPenhoraJuridico.FieldByName('QTDDECQTD').AsInteger);
                           CtrlFundos.DbPedidofundo.Qtdblqpedido.AsFloat        := fQtdCotas;

                           // Aplica a alteração na Tabela
                           if not CtrlFundos.DbPedidofundo.Insert then
                              Raise Exception.Create(CtrlFundos.DbPedidofundo.MessageInfo);
                        end
                        else
                            Raise Exception.Create('Não foi encotrado a Cota do Fundo :' + CdsListPenhoraJuridico.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                                   'para o dia : '+ CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsString + '');
                     end
                     else
                       Raise Exception.Create('Não foi encotrado o Tipo de Operação Bloqueio / Desbloqueio '+ #13 +
                                              'para Fundo : ' + CdsListPenhoraJuridico.FieldByName('DESCFUNDOINVEST').AsString + #13 +
                                              'para o dia : ' + CdsListPenhoraJuridico.FieldByName('DATAREALOCOR').AsString + '');
                  end;

                  // Marca como Integrado
                  // Se APlicacao Penhorada
                  //AL_14
                  if (CdsListPenhoraJuridico.FieldByName('IDCLASSETIT').AsInteger = CtrlPInv.IDCLASSPOUPBLOQ) then
                  begin
                     if (CdsListPenhoraJuridico.FieldByName('VALORREC').AsFloat > 0) then
                     begin
                        if not ExecSQL('UPDATE ETAPAPROCTRAB  SET FLGINVESTLIDO = 1, IDOPERRENFIXAPLIC = '+ IntToStr(IdOperRenFix) +
                                       'WHERE (NUMPROCTRAB = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMPROCTRAB').AsInteger) + ') AND ' + #13 +
                                       '      (NUMSEQ = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMSEQ').AsInteger) + ')') then
                           Raise Exception.Create('Ocorreu um erro ao atualizar o Jurídico.');
                     end
                     else
                     begin
                        if not ExecSQL('UPDATE ETAPAPROCTRAB  SET FLGINVESTLIDO = 1, IDOPERRENFIXAPLIC = '+ IntToStr(CtrlRendaFixa.BuscaSaldoRFPoup.CdsSldHistRenFixPoup.FieldByName('IDOPERRENFIXAPLIC').AsInteger) +
                                       'WHERE (NUMPROCTRAB = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMPROCTRAB').AsInteger) + ') AND ' + #13 +
                                       '      (NUMSEQ = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMSEQ').AsInteger) + ')') then
                           Raise Exception.Create('Ocorreu um erro ao atualizar o Jurídico.');
                     end;
                  end
                  else
                  begin
                     if not ExecSQL('UPDATE ETAPAPROCTRAB  SET FLGINVESTLIDO = 1 ' + #13 +
                                    'WHERE (NUMPROCTRAB = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMPROCTRAB').AsInteger) + ') AND ' + #13 +
                                    '      (NUMSEQ = '+ IntToStr(CdsListPenhoraJuridico.FieldByName('NUMSEQ').AsInteger) + ')') then
                        Raise Exception.Create('Ocorreu um erro ao atualizar o Jurídico.');
                  end;

                  CdsListPenhoraJuridico.Next;

               end;
               Commit;
            except
               on E:Exception do
               begin
                  Result := False;
                  Rollback;
                  MessageInfo := E.Message;
               end;
            end;
         end;
      finally
         FreeAndNil(CdsListPenhoraJuridico);
         FreeAndNil(CdsAutorizador);
         FreeAndNil(CdsItemXOpeXInv);
         FreeAndNil(CdsOperBloqueioFdo);
         FreeAndNil(CdsCotaFundo);
      end;
   end;
end;

//AL_9
procedure TCtrlInvestimento.SetIdHistRenFix(const Value: Integer);
begin
   FIdHistRenFix := Value;
end;

//AL_9
procedure TCtrlInvestimento.SetIdOperRenFix(const Value: Integer);
begin
   FIdOperRenFix := Value;
end;

//AL_9
procedure TCtrlInvestimento.AfterInitialize;
begin
   CtrlRendaFixa.InitializeAs(Padroes);
end;

//AL_10
function TCtrlInvestimento.ListPlanoPrev(iIdPlanoPrev : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                   '+ #13;
   sSql := sSql + '   IDPLANOPREV,NOME '+ #13;
   sSql := sSql + 'FROM                     '+ #13;
   sSql := sSql + '   PLANPREV             '+ #13;
   if iIdPlanoPrev <> -1 then
      sSql := sSql + 'WHERE IDPLANOPREV = ' + IntToStr(iIdPlanoPrev)+ #13;
   sSql := sSql + 'ORDER BY NOME       ';
   Result := GetDataPacket(sSql);
end;

//AL_10
function TCtrlInvestimento.ListGestor(iIdGestorCarteira : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                   '+ #13;
   sSql := sSql + '   G.IDGESTORCARTEIRA,P.IDPESSOA,P.NOME '+ #13;
   sSql := sSql + 'FROM                     '+ #13;
   sSql := sSql + '   GESTORCARTEIRA G,PESSOA P   '+ #13;
   sSql := sSql + '   WHERE G.IDGESTORCARTEIRA = P.IDPESSOA   '+ #13;
   if iIdGestorCarteira <> -1 then
      sSql := sSql + 'and G.IDGESTORCARTEIRA = ' + IntToStr(iIdGestorCarteira)+ #13;
   sSql := sSql + 'ORDER BY P.NOME       ';
   Result := GetDataPacket(sSql);
end;

//AL_10
function TCtrlInvestimento.ListPatrocinadora(iIdPatrocinador : Integer = -1): OleVariant;
var
   sSql : String;
begin
   sSql := '';
   sSql := sSql + 'SELECT                   '+ #13;
   sSql := sSql + '   PA.IDPESSOA,P.NOME '+ #13;
   sSql := sSql + 'FROM                     '+ #13;
   sSql := sSql + '   PATRO PA,PESSOA P   '+ #13;
   sSql := sSql + '   WHERE (PA.IDPESSOA = P.IDPESSOA)   '+ #13;
   if iIdPatrocinador <> -1 then
      sSql := sSql + 'and PA.IDPESSOA = ' + IntToStr(iIdPatrocinador)+ #13;
   sSql := sSql + 'ORDER BY P.NOME       ';
   Result := GetDataPacket(sSql);
end;

//AL_10
procedure TCtrlInvestimento.SetCdsTipoDespInv(const Value: TClientDataSet);
begin
  FCdsTipoDespInvest := Value;
end;

//AL_10
procedure TCtrlInvestimento.SetDbTipoDespInv(const Value: TDbTipoDespInvest);
begin
  FDbTipoDespInvest := Value;
end;


//AL_10
function TCtrlInvestimento.ListTipoDespInvest(iIdTipoDespInvest: Integer): Olevariant;
Var
 sSql: string;
begin
  sSql:= sSql + 'SELECT TI.IDTIPODESPINVEST,'+#13;
  sSql:= sSql + '       TI.DESCTIPODESPINV,'+#13;
  sSql:= sSql + '       TI.MOECODIGO,'+#13;
  sSql:= sSql + '       M.MOEDESC,'+#13;
  sSql:= sSql + '       TI.NATUREZAOPERACAO,'+#13;
  sSql:= sSql + '       DECODE(TI.NATUREZAOPERACAO,''L'',''Lucro'',''E'',''Despesa'',''N'',''Não Altera'') as DESCNATOP,'+#13;
  sSql:= sSql + '       TIPCREDOR'+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'FROM TIPODESPINVEST TI,MOEDA M'+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'WHERE TI.MOECODIGO = M.MOECODIGO'+#13;
  If iIdTipoDespInvest <> -1 then
    sSql:= sSql + 'AND TI.IDTIPODESPINVEST ='+ IntToStr(iIdTipoDespInvest)+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'ORDER BY DESCTIPODESPINV'+#13;

  Result :=  GetDataPacket(sSql);
end;

//AL_10
function TCtrlInvestimento.AplicaTipoDespInvest: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     //AL_12
     Result := Connection.AppServer.AplicaTipoDespInvest;

     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     try
        StartTransaction;

        if FCdsTipoDespInvest.State = dsInsert then
           // Estarei incluindo somente CREDOR por tipo e somente o Tipo=Corretor
           FCdsTipoDespInvest.FieldByName('TIPCREDOR').AsString := 'CO';

        Result := ApplyCds(FCdsTipoDespInvest,DbTipoDespInvest,[],[]);
        //AL_12
        IdTipoDespInvest := DbTipoDespInvest.IdTipoDespInvest.AsInteger;

        if not Result then
           Exception.Create(DbTipoDespInvest.MessageInfo);
        Commit;
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

//AL_11
procedure TCtrlInvestimento.SetCdsTipoInvUsu(const Value: TClientDataSet);
begin
  FCdsTipoInvUsu := Value;
end;
//AL_11
procedure TCtrlInvestimento.SetDbTipoInvUsu(
  const Value: TDbUsuarioTipoMenu);
begin
  FDbTipoInvUsu := Value;
end;

//AL_11
function TCtrlInvestimento.ListTipoInvUsu(iIdUsuario: Integer): Olevariant;
Var
 sSql: string;
begin
  sSql:= '';
  sSql:= sSql + 'SELECT UM.IDUSUARIO,'+#13;
  sSql:= sSql + '       US.NOMEUSUARIO,'+#13;
  sSql:= sSql + '       UM.TIPOMENU,'+#13;
  sSql:= sSql + '       DECODE(UM.TIPOMENU,''F'',''Renda Fixa'',''V'',''Renda Variável'',''B'',''BMF'',''I'',''Fundos de Investimentos'',''A'',''Todos'') AS DESCMENU,'+#13;
  sSql:= sSql + '       UM.IDTIPOINVEST,'+#13;
  sSql:= sSql + '       TI.DESCTIPOINVEST,'+#13;
  sSql:= sSql + '       UM.IDPLANPREVCTBPATR,'+#13;
  sSql:= sSql + '       PA.IDPLANOPREV,'+#13;
  sSql:= sSql + '       (PL.NOME ||'' - ''|| PE.NOME) AS PLANPRVCONTABPATRO'+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'FROM '+#13;
  sSql:= sSql + ' USUARIOTIPOMENU UM,'+#13;
  sSql:= sSql + ' USUARIOSISTEMA US,'+#13;
  sSql:= sSql + ' TIPOINVEST TI,'+#13;
  sSql:= sSql + ' PLANPREVCONTABPATRO PA,'+#13;
  sSql:= sSql + ' PLANPREVCONTABIL PL,'+#13;
  sSql:= sSql + ' PESSOA PE'+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'WHERE'+#13;
  sSql:= sSql + ' UM.IDUSUARIO = US.IDUSUARIO AND'+#13;
  sSql:= sSql + ' UM.IDTIPOINVEST = TI.IDTIPOINVEST(+) AND'+#13;
  sSql:= sSql + ' UM.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR(+) AND'+#13;
  sSql:= sSql + ' PA.IDPLANOPREV = PL.IDPLANOPREV(+) AND'+#13;
  sSql:= sSql + ' PA.IDPATRO = PE.IDPESSOA(+)'+#13;
  If iIdUsuario <> -1 then
    sSql:= sSql + 'AND UM.IDUSUARIO ='+ IntToStr(iIdUsuario)+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'ORDER BY US.NOMEUSUARIO'+#13;

  Result :=  GetDataPacket(sSql);
end;

//AL_11
function TCtrlInvestimento.AplicaTipoInvUsu: Boolean;
begin
 if ConnectionSide = cnsClient then
  begin
     //AL_12
     Result := Connection.AppServer.AplicaTipoInvUsu;

     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     try
        StartTransaction;

        Result := ApplyCds(FCdsTipoInvUsu,DbTipoInvUsu,[],[]);
        //AL_12
        Idusuario := DbTipoInvUsu.Idusuario.AsInteger;

        if not Result then
           Exception.Create(DbTipoInvUsu.MessageInfo);
        Commit;
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

//AL_11
function TCtrlInvestimento.ListUsuario(iIdUsuario: Integer): Olevariant;
Var sSql: String;
begin
  sSql:= '';
  sSql:= sSql + 'SELECT IDUSUARIO,'+#13;
  sSql:= sSql + 'NOMEUSUARIO'+#13;
  sSql:= sSql + 'FROM USUARIOSISTEMA'+#13;
  If iIdUsuario <> -1 then
    sSql:= sSql + 'WHERE IDUSUARIO ='+ IntToStr(iIdUsuario)+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + ''+#13;
  sSql:= sSql + 'ORDER BY NOMEUSUARIO'+#13;

  Result :=  GetDataPacket(sSql);

end;

//AL_12
procedure TCtrlInvestimento.SetIdMercado(const Value: Integer);
begin
  FIdMercado := Value;
end;

//AL_12
procedure TCtrlInvestimento.SetIdMotivoBloqueio(const Value: Integer);
begin
  FIdMotivoBloqueio := Value;
end;

//AL_12
procedure TCtrlInvestimento.SetIdTipoDespInvest(const Value: Integer);
begin
  FIdTipoDespInvest := Value;
end;

//AL_12
procedure TCtrlInvestimento.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

//AL_15
procedure TCtrlInvestimento.SetCdsAgenciaRisco(const Value: TClientDataSet);
begin
   FCdsAgenciaRisco:= Value;
end;

//AL_15
procedure TCtrlInvestimento.SetDbAgenciaRisco(const Value: TDbAgenciaRisco);
begin
   FDbAgenciaRisco := Value;
end;

//AL_15
procedure TCtrlInvestimento.SetIdAgenciaRisco(const Value: Integer);
begin
   FIdAgenciaRisco := Value;
end;

//AL_15
function TCtrlInvestimento.ListAgenciaRisco(iIdAgenciaRisco: Integer): Olevariant;
var sSql: String;
begin
   sSql:= '';
   sSql:= sSql + 'SELECT IDAGENCIARISCO,'+#13;
   sSql:= sSql + 'DESCAGENCIARISCO'+#13;
   sSql:= sSql + 'FROM AGENCIARISCO'+#13;
   If iIdAgenciaRisco <> -1 then
       sSql:= sSql + 'WHERE IDAGENCIARISCO ='+ IntToStr(iIdAgenciaRisco)+#13;
   sSql:= sSql + ''+#13;
   sSql:= sSql + ''+#13;
   sSql:= sSql + 'ORDER BY DESCAGENCIARISCO'+#13;

   Result :=  GetDataPacket(sSql);
end;

//AL_22
function TCtrlInvestimento.ListCotacaoMoeda(iMoeda: Integer;  dDataRef: TDateTime = 0; bMaior: Boolean = True): OleVariant;
var sSql: String;
begin
   sSql :=        'SELECT C.MOECODIGO, C.COTDATA, C.COTVALOR, C.INDICEBASE, C.COTMESREF, ' + #13;
   sSql := sSql + '       C.COTDATAFIM, C.NUMDIASPRAZO, C.OBSERVACAO ' + #13;
   sSql := sSql + 'FROM COTACAOMOEDA C ' + #13;
   sSql := sSql + 'WHERE C.MOECODIGO = ' + IntToStr(iMoeda) + #13;
   if dDataRef <> 0 then
   begin
      if bMaior then
      begin
         sSql := sSql + '  AND C.COTDATA = (SELECT MAX(C2.COTDATA) ' + #13;
         sSql := sSql + '                   FROM COTACAOMOEDA C2 ' + #13;
         sSql := sSql + '                   WHERE C2.MOECODIGO = ' + IntToStr(iMoeda) + #13;
         sSql := sSql + '                     AND C2.COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') +')) ' + #13;
      end
      else
         sSql := sSql + '  AND C.COTDATA <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy', dDataRef)) + ', ' + QuotedStr('DD/MM/YYYY') +') ' + #13;
   end;
   sSql := sSql + 'ORDER BY C.COTDATA';

   Result :=  GetDataPacket(sSql);
end;

//AL_15
function TCtrlInvestimento.AplicaAgenciaRisco: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin

      Result := Connection.AppServer.AplicaAgenciaRisco;

      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         Result := ApplyCds(FCdsAgenciaRisco,DbAgenciaRisco,[],[]);

         IdAgenciaRisco := DbAgenciaRisco.IdAgenciaRisco.AsInteger;

         if not Result then
            Exception.Create(DbAgenciaRisco.MessageInfo);
         Commit;
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

//AL_16
procedure TCtrlInvestimento.SetIdCarteiraInvest(const Value: Integer);
begin
  FIdCarteiraInvest := Value;
end;
//AL_17
procedure TCtrlInvestimento.SetCdsParamEmissor(const Value: TClientDataSet);
begin
  FCdsParamEmissor := Value;
end;
//AL_17
procedure TCtrlInvestimento.SetDbParamEmissor(const Value: TDbParamEmissor);
begin
  FDbParamEmissor := Value;
end;
//AL_17
function TCtrlInvestimento.ListaParamEmissor: Olevariant;
Var
  sSql: String;
begin
  sSql := 'SELECT '                       + #13 +
          '   IDPARAMEMISSOR,'            + #13 +
          '   DESCPARAMEMISSOR'           + #13 +
          'FROM   '                       + #13 +
          '   PARAMEMISSOR'               + #13 ;

  // -----------------------------------------------------------------------------------------------
  sSql := sSql + 'ORDER BY DESCPARAMEMISSOR'     + #13 ;

  Result :=  GetDataPacket(sSql);
end;
//AL_17
function TCtrlInvestimento.AplicaParamEmissor: Boolean;
Var
  Cds_: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin

      Result := Connection.AppServer.AplicaParamEmissor;

      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         Result := ApplyCds(FCdsParamEmissor,DbParamEmissor,[],[]);
         if not Result then Exception.Create(DbParamEmissor.MessageInfo);

         IDParamEmissor := DbParamEmissor.IDParamEmissor.AsInteger;

         Commit;
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
//AL_17
procedure TCtrlInvestimento.SetIDParamEmissor(const Value: Integer);
begin
  FIDParamEmissor := Value;
end;
//AL_18
function TCtrlInvestimento.cdslookEmissor: Olevariant;
Var
  sSql: String;
begin
  sSql := 'SELECT '                         + #13 +
          '   IDEMISSOR,'                   + #13 +
          '   SIGLAEMISSOR'                 + #13 +
          'FROM   '                         + #13 +
          '   EMISSOR'                      + #13 ;

  // -----------------------------------------------------------------------------------------------
  sSql := sSql + 'ORDER BY SIGLAEMISSOR'     + #13 ;

  Result :=  GetDataPacket(sSql);

end;
//AL_18
procedure TCtrlInvestimento.SetCdsValParamXEmissor(const Value: TClientDataSet);
begin
  FCdsValParamXEmissor := Value;
end;
//AL_18
function TCtrlInvestimento.ListaValParamEmissor: Olevariant;
Var
  sSql: String;
begin
  sSql := 'SELECT '                                                 + #13 +
          '   V.IDPARAMEMISSOR,'                                    + #13 +
          '   V.IDEMISSOR,'                                         + #13 +
          '   V.DATAREFPREMISSOR,'                                  + #13 +
          '   V.VLRPARAMEMISSOR,'                                   + #13 +
          '   P.DESCPARAMEMISSOR,'                                  + #13 +
          '   V.IDREGRAUSOEMISSOR'                                  + #13 +
          'FROM   '                                                 + #13 +
          '   VALPARAMXEMISSOR V,PARAMEMISSOR P'                    + #13 +
          'WHERE  '                                                 + #13 +
          '  V.IDEMISSOR = ' + IntToStr(MDIDEmisssor)               + #13 +
          '  AND V.IDPARAMEMISSOR = ' + IntToStr(MDIDParamEmisssor) + #13 +
          '  AND V.IDPARAMEMISSOR = P.IDPARAMEMISSOR'               + #13 ;

  // -----------------------------------------------------------------------------------------------
  sSql := sSql + 'ORDER BY V.IDEMISSOR, V.IDPARAMEMISSOR,V.DATAREFPREMISSOR'     + #13 ;

  Result :=  GetDataPacket(sSql);
end;
//AL_18
procedure TCtrlInvestimento.SetMDIDEmisssor(const Value: Integer);
begin
  FMDIDEmisssor := Value;
end;
//AL_18
function TCtrlInvestimento.cdslookIndicadorEmissor: Olevariant;
Var
  sSql: String;
begin
  sSql := 'SELECT '                                                  + #13 +
          '  PXE.IDPARAMEMISSOR,'                                    + #13 +
          '  PXE.IDEMISSOR,'                                         + #13 +
          '  PRE.DESCPARAMEMISSOR'                                   + #13 +
          'FROM   '                                                  + #13 +
          '  PARAMXEMISSOR PXE,PARAMEMISSOR PRE'                     + #13 +
          'WHERE  '                                                  + #13 +
          '  PXE.IDPARAMEMISSOR = PRE.IDPARAMEMISSOR'                + #13 +
          '  AND PXE.IDEMISSOR =      ' + IntToStr(MDIDEmisssor)     + #13 ;



  // -----------------------------------------------------------------------------------------------
  sSql := sSql + 'ORDER BY PRE.DESCPARAMEMISSOR'     + #13 ;

  Result :=  GetDataPacket(sSql);
end;
//AL_18
function TCtrlInvestimento.AplicaValParamEmissor: Boolean;
begin
   if ConnectionSide = cnsClient then
   begin

      Result := Connection.AppServer.AplicaValParamEmissor;

      if not Result then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         StartTransaction;

         Result := ApplyCds(FCdsValParamXEmissor,DbValParamXEmissor,[],[]);
         if not Result then Exception.Create(DbValParamXEmissor.MessageInfo);

         Commit;
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

//AL_18
procedure TCtrlInvestimento.SetDbValParamXEmissor(const Value: TDbValParamXEmissor);
begin
  FDbValParamXEmissor := Value;
end;

//AL_18
procedure TCtrlInvestimento.SetMDIDParamEmisssor(const Value: Integer);
begin
  FMDIDParamEmisssor := Value;
end;

//AL_19
function TCtrlInvestimento.cdslookIndicadorNEmissor: Olevariant;
var
   sSql: String;
begin
   sSql := 'SELECT '                                                                         + #13 +
          '  PEM.IDPARAMEMISSOR,'                                                            + #13 +
          '  PEM.DESCPARAMEMISSOR'                                                           + #13 +
          'FROM   '                                                                          + #13 +
          '  PARAMEMISSOR PEM'                                                               + #13 +
          'WHERE  '                                                                          + #13 +
          '  IDPARAMEMISSOR NOT IN ( SELECT IDPARAMEMISSOR'                                  + #13 +
          '                          FROM PARAMXEMISSOR   '                                  + #13 +
          '                          WHERE IDEMISSOR =      ' + IntToStr(MDIDEmisssor) + ')' + #13 ;



  // -----------------------------------------------------------------------------------------------
  sSql := sSql + 'ORDER BY PEM.DESCPARAMEMISSOR'     + #13 ;

  Result :=  GetDataPacket(sSql);
end;

//AL_19
procedure TCtrlInvestimento.SetCdsParamXEmissor(const Value: TClientDataSet);
begin
  FCdsParamXEmissor := Value;
end;

//AL_19
procedure TCtrlInvestimento.SetDbParamXEmissor(const Value: TDBParamXEmissor);
begin
  FDbParamXEmissor := Value;
end;

//AL_19
function TCtrlInvestimento.AplicaParamXEmissor: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin

     Result := Connection.AppServer.AplicaParamXEmissor;

     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     try
        StartTransaction;

        Result := ApplyCds(FCdsParamXEmissor,DbParamXEmissor,[],[]);
        if not Result then Exception.Create(DbParamXEmissor.MessageInfo);

        Commit;
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
//AL_17
function TCtrlInvestimento.PermiteExclusaoParamEmissor: Boolean;
Var
  sSql: String;
  Cds_: TCMClientDataSet;
begin
  sSql := 'SELECT DISTINCT'                                        + #13 +
          '   IDPARAMEMISSOR'                                      + #13 +
          'FROM   '                                                + #13 +
          '   PARAMXEMISSOR'                                       + #13 +
          'WHERE           '                                       + #13 +
          '   IDPARAMEMISSOR=' +  IntToStr(MDIDParamEmisssor)      + #13 ;
  Try
    Cds_ := TCMClientDataSet.Create(nil);
    Cds_.Data := GetDataPacket(sSql);
    Result := False;
    If Cds_.IsEmpty then
       Result := True;
  Finally
    FreeAndNil(Cds_);
  End;

end;

//AL_20
procedure TCtrlInvestimento.SetCdsSetorEmissor(
  const Value: TclientDataSet);
begin
  FCdsSetorEmissor := Value;
end;

//AL_20
procedure TCtrlInvestimento.SetDbSetorEmissor(
  const Value: TDbSetorEmissor);
begin
  FDbSetorEmissor := Value;
end;

//AL_20
function TCtrlInvestimento.AplicaSetorEmissor: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin

     Result := Connection.AppServer.AplicaSetorEmissor;

     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
     try
        StartTransaction;

        Result := ApplyCds(FCdsSetorEmissor,DbSetorEmissor,[],[]);
        if not Result then Exception.Create(DbSetorEmissor.MessageInfo);

        IDSetorEmissor := DbSetorEmissor.CodSetorEmissor.AsString;

        Commit;
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

//AL_20
function TCtrlInvestimento.ListaSetorEmissor: Olevariant;
Var
  sSql: String;
begin
  sSql := 'SELECT '                                                              + #13 +
          '   CODSETOREMISSOR,'                                                  + #13 +
          '   DESCSETOREMISSOR,'                                                 + #13 +
          '   SETORANALIT,      '                                                + #13 +
          '   DECODE(SETORANALIT,''A'',''Analítico'',''S'',''Sintético'') TIPO'  + #13 +
          'FROM   '                                                              + #13 +
          '   SETOREMISSOR'                                                      + #13 ;

  // -----------------------------------------------------------------------------------------------
  sSql := sSql + 'ORDER BY CODSETOREMISSOR'     + #13 ;

  Result :=  GetDataPacket(sSql);

end;

//AL_20
procedure TCtrlInvestimento.SetIDSetorEmissor(const Value: String);
begin
  FIDSetorEmissor := Value;
end;

//AL_24
function TCtrlInvestimento.VerEmAbertura(iTipoInvest: Integer): Boolean;
var sSql: String;
begin
   try //Finally
      try //Except
         if iTipoInvest = 1 then
         begin
            sSql := 'SELECT PA.FLGRFEMABERTURA AS FLGABERTURA, PE.NOME' + #13 +
                    'FROM PARAMINVEST PA, PESSOA PE' + #13 +
                    'WHERE PA.IDUSUARIOPROCRF = PE.IDPESSOA(+)';
         end
         else if iTipoInvest = 2 then
         begin
            sSql := 'SELECT PA.FLGRVEMABERTURA AS FLGABERTURA, PE.NOME' + #13 +
                    'FROM PARAMINVEST PA, PESSOA PE' + #13 +
                    'WHERE PA.IDUSUARIOPROCRV = PE.IDPESSOA(+)';
         end
         else
         begin
            Result := False;
            Exit;
         end;

         _Cds.Data := GetDataPacket(sSql);
         Result := (_Cds.FieldByName('FLGABERTURA').AsString = 'S');

         if Result then
         begin
            MessageInfo := 'O Sistema está sendo processado por ' + #13 +
                           _Cds.FieldByName('NOME').AsString + #13 +
                           'Nenhuma outra ação pode ser executada.';
         end;

      except
      on E: Exception do
         begin
            Result := True;
            MessageInfo := 'Não foi possível verificar se o Sistema está sendo processado' + #13 +
                           'Nenhuma outra ação pode ser executada.' + #13 +
                           'Mensagem: ' + E.Message;
         end;
      end;
   finally
      _Cds.Close;
   end;
end;

function TCtrlInvestimento.ListSegmentacao(iGrupo: integer): OleVariant;
var
   sSql: String;
begin

   sSql := sSql + 'SELECT IDSEGMENTACAO, DESCSEGMENTACAO, IDGRUPO ';
   sSql := sSql + 'FROM SEGMENTACAOMERCADO ';
   if iGrupo > 0 then
     sSql := sSql + 'WHERE IDGRUPO = '+IntToStr(iGrupo);

   Result := GetDataPacket(sSql);

end;

function TCtrlInvestimento.ListCorretora(iIdCorretora: Integer): OleVariant;
var
   sSql : String;
begin
{   sSql := '';
   sSql := sSql + 'SELECT CORRETVALORES.IDCORRETVALORES, CORRETVALORES.SGLCORRETVALORES ';
   sSql := sSql + 'FROM CORRETVALORES ';
   sSql := sSql + 'WHERE ';
   sSql := sSql + '   CORRETVALORES.FLGATIVARV=''S'' ';
   if iIdCustodiante <> -1 then
      sSql := sSql + 'AND CORRETVALORES.IDCORRETVALORES = ' + IntToStr(iIdCorretora);
   sSql := sSql + 'ORDER BY CORRETVALORES.SGLCORRETVALORES ';
   Result := GetDataPacket(sSql);}
end;

end.
