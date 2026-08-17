{-------------------------------------------------------------------------------

      OBJETO DE CONTROLE DE CONTRATO DE IMÓVEIS  ( MT )

      Módulo               :  Comuns Imobiliário ( CMImobiliarioObj50 )
      Analista Responsável :  Vinícius Meyer Lana
      Data de Início       :  12/09/2002
      Data de Término      :  18/06/2003

--------------------------------------------------------------------------------
FUNÇÕES PUBLICADAS -------------------------------------------------------------
--------------------------------------------------------------------------------

  GravaContratoImovel      - Exclui um lançamento com as devidas integrações
  ExcluiContratoImovel     - Efetua a conciliação de documentos com o CAR
  Rescisao                 - Efetua a Rescisão do contrato de locação
  LookupContratoImovel     - Busca o contrato de locação
  LookupContratoXImovel    - Busca os imóveis relacionados ao contrato de locação
  LookupContratoXVlrAno    - Busca os Valores Futuros relacionados ao contrato de locação
  LookupContratoXFiador    - Busca os Fiadores relacionados ao contrato de locação
  LookupHistContratoImovel - Busca o histórico de locações de um imóvel
  LookupMultaJuros         - Busca os cadastros de Juros e Multas relacionados ao contrato de locação

  AbreQueryMulta           - Abre a query Juros e Multas relacionados ao
                             contrato de locação em função da função BuscaParamMulta

  BuscaParamMulta          - Busca parametrização de cadastros de Juros e Multa
                             relacionados ao Contrato e/ou Tipo de Receita
                             dentro do período de vigência informado

  Marcio Motta - 12/05/2004 - Pendência: 16754 ---------------------------------
  SuspenderReativar        - Suspende ou Reativa um contrato

  Marcio Motta - Data de Início - 06/01/2004 -----------------------------------
  BuscaParamCMJurosMulta   - Busca Parâmetros para cálculo de Correção
                             Monetária, Juros e Multa

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
//SIG         : 136078
//Responsável : Cássio Florencio Rovaroto
//Data        : 05/06/2023
//Descrição   : Alteração da forma de atribuição do status da ocupação de um
                imóvel. 
//Rotina      : AfterApplyCdsRecord
--------------------------------------------------------------------------------
//SIG         : SIG26726
//Responsável : Marcelo Cardoso
//Data        : 23/02/2017
//Descrição   : Verificação de saldo em aberto e, se existir, o sistema envie um alerta
//              indicando tal saldo a receber.
//Rotina      :
--------------------------------------------------------------------------------
SOL      : 136341
KINTANA : 815095
Responsável : Helen V Bianchi
Data        : 09/10/2011
Descrição   : Implementação da Confissão de Divida . Add Rotinas
Rotina      : LookupParcelasConfissaoDivida,LookupConfissaoDivida
--------------------------------------------------------------------------------
SOL : 137256
KINTANA : 828397
Responsável : MARCELO ALMEIDA
Data        : 03/01/2011
Descrição   : Implementação, na base de dados e no sistema,
              de campos específicos para registro de pagamento de taxas,
              impostos e demais valores associados aos imóveis em carteira.
              Este registro pode ser feito como um flag no sistema para que a
              GEIMO, anualmente, registre que determinado imóvel está em dia
              com os pagamentos das taxas aplicáveis relacionadas aos imóveis. 
--------------------------------------------------------------------------------
SOL : 110145
KINTANA : 503093
Responsável : Felipe de Oliveira
Data        : 26/05/2010
Descrição   : Ao alterar ou inserir imóveis no contrato o usuário agora terá que
              informar o valor total do contrato e terá 2 botões com a opção de
              ratear o valor dos imóveis no contrato por área ou valor contábil
              do imóvel
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27480
Responsável  : Daniel Simões
Data         : 26/02/2008
Descrição    : Troca dos campos 'CONDATAINICIO' e 'CONDATAFIM' (Datas de
               vigência do contrato) pelos 'CIMDTINI' e 'CIMDTFIM' (Datas de
               vigência dos imóveis).
--------------------------------------------------------------------------------
Pendência   : 26104
Responsável : Daniel Simões
Data        : 14/08/2007
Descrição   : Métodos relacionados a Parametrização de Multas e Juros foram
              transferidos para CtrlParamMulta...
--------------------------------------------------------------------------------
Pendência   : 24079
Responsável : Daniel Simões
Data        : 06/06/2007
Descrição   : Inclusão do campo 'OBSERVAÇAO' na query da função
              'LookupContratoXDesc'...
--------------------------------------------------------------------------------
Pendência   : 24085
Responsável : Daniel Simões
Data        : 19/04/2007
Descrição   : Mudança na função 'LookupContratoXImovel'. A query foi adaptada
              para carregar Imóveis ou Unidades pertencentes ao contrato.
--------------------------------------------------------------------------------
Pendência   : 22687
Responsável : Daniel Simões
Descrição   : 20/03/2007 - 2º Implementação das funções AbreQueryMulta e
                              BuscaParamMulta.

              28/01/2007 - 1º Implementação da função "LookupMultaJuros" e
                              gravação dos juros e multas na tabela
                              CONTRATOXMULTA no form "fCadContratoImovel".
--------------------------------------------------------------------------------
Pendência   : 24081
Responsável : André Mesquita
Data        : 14/03/2007
Descrição   : Implementação do atributo Tipo de Contrato.
--------------------------------------------------------------------------------
Pendência   : 23742
Responsável : Marchetti
Data        : 26/12/2006
Descrição   : - Criação dos objetos e rotinas para gravação da CondPagImovel
                ( DbCondPagImovel e CdsCondPagImovel ).

              - Criação de propriedade IDContratoImovel para ser passada para
                objetos externos.
--------------------------------------------------------------------------------
Pendência   :
Responsável : Daniel Simões
Data        : 16/02/2006
Descrição   : Adicionado uma condição na query da função LookupContratoXImovel,
              que filtra os imóveis apenas com a data dentro da vigência de
              acordo com a vontade do usuário...
--------------------------------------------------------------------------------
Pendência   :
Responsável : Daniel Simões
Data        : 14/02/2006
Descrição   : Adicionado um SubSelect na query da função LookupContratoImovel,
              com o intuito de trazer o valor total do contrato APENAS dos
              imóveis que constam nas datas vigentes...
--------------------------------------------------------------------------------



//-------Alterações Softtek-------//
--------------------------------------------------------------------------------
Pendência   :  KT 477964 - SOL 106555
Responsável : Emerson S.
Data        : 21/01/2009
Descrição   : Adicionado uma Critica na query da função LookupRateio,
              para permitir que seja adicionados Contratos que estão
              com flag "V" na coluna FLGSTATUS de CONTRATOIMOVEL.
--------------------------------------------------------------------------------





-------------------------------------------------------------------------------}



unit uCtrlContratoImovel;

interface

uses SysUtils, dbClient, DB, uCMControlObject, uCMDbObject, uCMClientDataSet, uDiasUteis,
     uCtrlImovel, uCMTypes, uDbContratoImovel, uDbContratoXImovel, uDbContratoXVlrAno,
     uDbAvalistaXContrato, uDbEventoImovel, uCtrlEventoImovel, uCtrlLancamentosImovel, uDbCondPagImovel,
     uComunsImobiliario, uDbContratoXDesc, uCtrlModuloImobiliario, uVerificaPreenchimento, uCMFileUtils,
     uDbOutroDadoxImovel, // Daniel - 23518
     uCtrlParamMulta,     // Daniel - 26104
     Classes, uDbHistpagencimov;   //MARCELO ALMEIDA - SOL 137256 - KTN 828397

type
  TCtrlContratoImovel = class(TCMControlObject)
     private
       FCdsContratoImovel:    TCMClientDataSet;
       FDbContratoImovel:     TDbContratoImovel;
       FCdsContratoXImovel:   TCMClientDataSet;
       FDbContratoXImovel:    TDbContratoXImovel;
       FCdsContratoXVlrAno:   TCMClientDataSet;
       FDbContratoXVlrAno:    TDbContratoXVlrAno;
       FCdsAvalistaXContrato: TCMClientDataSet;
       FDbAvalistaXContrato:  TDbAvalistaXContrato;
       FCdsEventoImovel:      TCMClientDataSet;
       FDbEventoImovel:       TDbEventoImovel;
       FCdsContratoXDesc: TCmClientDataset;
       FDbContratoXDesc: TDbContratoXDesc;

       //MARCELO ALMEIDA - SOL 137256 - KTN 828397
       FCdsHistpagencimov:    TCMClientDataSet;
       FDbHistpagencimov:     TDbHistpagencimov;
       //MARCELO ALMEIDA - SOL 137256 - KTN 828397


       DiasUteis:             TDiasUteis;
       CtrlImovel:            TCtrlImovel;
       CtrlEventoImovel:      TCtrlEventoImovel;
       CtrlLancImovel:        TCtrlLancamentosImovel;
       CtrlModuloImobiliario: TCtrlModuloImobiliario;

       CtrlParamMulta : TCtrlParamMulta; // Daniel - 26104

       ParamSistema:          TParamSistema;
       FIDContratoImovel: Integer;
       FDbCondPagImovel: TDbCondPagImovel;
       FCdsCondPagImovel: TCMClientDataSet;

       // Daniel - 23518
       FCdsOutroDadoxImovel : TCMClientDataSet;
       FDbOutroDadoxImovel  : TDbOutroDadoxImovel;

       FCdsDescCondicional: TCMClientDataSet;

       procedure SetCdsContratoImovel   (const Value: TCMClientDataSet);
       procedure SetDbContratoImovel    (const Value: TDbContratoImovel);
       procedure SetCdsContratoXImovel  (const Value: TCMClientDataSet);
       procedure SetDbContratoXImovel   (const Value: TDbContratoXImovel);
       procedure SetCdsContratoXVlrAno  (const Value: TCMClientDataSet);
       procedure SetDbContratoXVlrAno   (const Value: TDbContratoXVlrAno);
       procedure SetCdsAvalistaXContrato(const Value: TCMClientDataSet);
       procedure SetDbAvalistaXContrato (const Value: TDbAvalistaXContrato);
       procedure SetCdsEventoImovel     (const Value: TCMClientDataSet);
       procedure SetDbEventoImovel      (const Value: TDbEventoImovel);
       procedure SetCdsContratoXDesc    (const Value: TCmClientDataset);
       procedure SetDbContratoXDesc     (const Value: TDbContratoXDesc);
       procedure SetIDContratoImovel    (const Value: Integer);
       procedure SetDbCondPagImovel     (const Value: TDbCondPagImovel);
       procedure SetCdsCondPagImovel    (const Value: TCMClientDataSet);

       // Daniel - 23518
       procedure SetCdsOutroDadoxImovel (const Value: TCMClientDataSet);
       procedure SetDbOutroDadoxImovel  (const Value: TDbOutroDadoxImovel);
       // Fim

       procedure SetCdsDescCondicional(const Value: TCMClientDataSet);


       //MARCELO ALMEIDA - SOL 137256 - KTN 828397
       procedure SetCdsHistpagencimov(const Value: TCMClientDataSet);
       procedure SetDbHistpagencimov(const Value: TDbHistpagencimov);
       //MARCELO ALMEIDA - SOL 137256 - KTN 828397

     protected
       procedure AfterInitialize;   override;
       procedure OnCreateAppServer; override;
       procedure OnApplyCdsRecord    (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;
       procedure AfterApplyCdsRecord (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Override;

       procedure DefineStatusContrato;
       procedure DefineValorContrato;

       // Daniel Simões - 02/02/2006
       function  VerificaVigenciaImoveis(var sErro: String; const iIdContrato:Integer = -1): Boolean;

       function  VerificaRateioImoveis(var sErro: String; const iIdContrato:Integer = -1): Boolean;
       function  LookupRateio(const iIdContrato,iIdImovel:Integer; const dInicio,dFim:TDateTime) : OLEVariant;

     public
//SOL 110145 Kintana 503093 Felipe de Oliveira     
       fTotalContratoReajustado : Double;

       // Daniel - 26104 (22687)
       CdsContratoXMulta : TCMClientDataSet;

       constructor Create (const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean); reintroduce;
       destructor  Destroy; override;

       property DbContratoImovel    : TDbContratoImovel    read FDbContratoImovel     write SetDbContratoImovel;
       property CdsContratoImovel   : TCMClientDataSet     read FCdsContratoImovel    write SetCdsContratoImovel;
       property DbContratoXImovel   : TDbContratoXImovel   read FDbContratoXImovel    write SetDbContratoXImovel;
       property CdsContratoXImovel  : TCMClientDataSet     read FCdsContratoXImovel   write SetCdsContratoXImovel;
       property DbContratoXVlrAno   : TDbContratoXVlrAno   read FDbContratoXVlrAno    write SetDbContratoXVlrAno;
       property CdsContratoXVlrAno  : TCMClientDataSet     read FCdsContratoXVlrAno   write SetCdsContratoXVlrAno;
       property DbAvalistaXContrato : TDbAvalistaXContrato read FDbAvalistaXContrato  write SetDbAvalistaXContrato;
       property CdsAvalistaXContrato: TCMClientDataSet     read FCdsAvalistaXContrato write SetCdsAvalistaXContrato;
       property DbEventoImovel      : TDbEventoImovel      read FDbEventoImovel       write SetDbEventoImovel;
       property CdsEventoImovel     : TCMClientDataSet     read FCdsEventoImovel      write SetCdsEventoImovel;

       //MARCELO ALMEIDA - SOL 137256 - KTN 828397
       property CdsHistpagencimov   : TCMClientDataSet     read FCdsHistpagencimov    write SetCdsHistpagencimov;
       property DbHistpagencimov:     TDbHistpagencimov    read FDbHistpagencimov     write SetDbHistpagencimov;
       //MARCELO ALMEIDA - SOL 137256 - KTN 828397


       //DAVID - Pendência 17340
       property DbContratoXDesc : TDbContratoXDesc read FDbContratoXDesc write SetDbContratoXDesc;
       property CdsContratoXDesc : TCmClientDataset read FCdsContratoXDesc write SetCdsContratoXDesc;

       property IDContratoImovel   : Integer read FIDContratoImovel write SetIDContratoImovel;
       property DbCondPagImovel    : TDbCondPagImovel read FDbCondPagImovel write SetDbCondPagImovel;
       property CdsCondPagImovel   : TCMClientDataSet read FCdsCondPagImovel write SetCdsCondPagImovel;

       // ClientDataSet Específico para confissão de dívida
       property CdsDescCondicional : TCMClientDataSet read FCdsDescCondicional write SetCdsDescCondicional;


       // Daniel - 23518
       property CdsOutroDadoxImovel: TCMClientDataSet    read FCdsOutroDadoxImovel write SetCdsOutroDadoxImovel;
       property DbOutroDadoxImovel : TDbOutroDadoxImovel read FDbOutroDadoxImovel  write SetDbOutroDadoxImovel;
       // Fim

       function GravaContratoImovel : Boolean;
       function ExcluiContratoImovel: Boolean;
       function Rescisao                (const iContrato: integer; const dDataRescisao, dDataSolicitacao: TDateTime; const sObs: String;
                                         const bExcluiLancamentos:Boolean; const iDocMulta:Integer = -1; const bTransacao:Boolean = True): Boolean;

       // Marcio Mota - Pendência: 16754
       function SuspenderReativar       (const iContrato: integer; const dDataEvento: TDateTime; const sObs: String;
                                         const sFlgStatus : string; const bTransacao:Boolean = True): Boolean;

       function LookupContratoImovel    (const iIdContrato:Integer = -1; const iIdResponsavel:Integer = -1; const sTipo:String = '';
                                         const sVigencia:String = ''; const sFolha:String =''; const bRespNulo:Boolean = True): OleVariant;
       function LookupContratosDoImovel (const iIdImovel:Integer): OleVariant;
       function LookupContratoXImovel   (const iIdContrato:Integer = -1; const bVigent:boolean = True): OleVariant;
       function LookupContratoXVlrAno   (const iIdContrato:Integer = -1): OLEVariant;
       function LookupContratoXFiador   (const iIdContrato:Integer = -1): OleVariant;
       function LookupHistContratoImovel(const iIdImovel:Integer   = -1): OleVariant;

       function LookupContratoXCondPag  (const iIdContrato:Integer = -1): OleVariant;
       function LookupCondPagImovel     (const iIdContrato:Integer = -1; const iCondPag : Integer = -1): OleVariant;

       // Daniel - 9730
       function EncerraAlienacao(const iIdContrato:Integer=-1; const dDataEncerra:TDateTime=-1; const bTransacao:Boolean=True): Boolean;

       //DAVID - Pendência 17340
       function LookupContratoXDesc     (const iIdContrato:Integer = -1): OLEVariant;

       // ------- Data: 06/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------
       function BuscaParamCMJurosMulta  (const idContratoImovel: Double; const DataVencto : TDateTime) : OleVariant;

       // Daniel - 24159
       function ExisteLancamento(iIdImovel,iIdContrato:Integer): Boolean;

       //MARCELO ALMEIDA - SOL 137256 - KTN 828397
       function LookupHistoricoPagamentosEncargos (const idContratoImovel : Integer; AAnoInicio : Integer; AAnoFim : Integer; AIdImovel : String; AImoNome : String; AIdEncargo : Integer; AIdSituacao : Integer): OleVariant;
       function LookupTiposEncargos : OleVariant;
       function LookupSituacaoPagamentoEncargos : OleVariant;
       //MARCELO ALMEIDA - SOL 137256 - KTN 828397

       //Helen - SOL: 136341 Kintana : 815095 - Inicio
       function LookupConfissaoDivida (const iIdContrato:Integer = -1 ): OleVariant;
       function LookupParcelasConfissaoDivida (iIdContrato , iIdConfissao:Integer ): OleVariant;
       //Helen - SOL: 136341 Kintana : 815095 - Fim

       procedure VerificaSaldoAberto( var sSaldoReceber, sSaldoPagar: Double; iIdContrato: Integer);//SIG26726 - Marcelo Cardoso

     private
       function IncrementaNumeracao : String;

     published

end;

implementation

{ TCtrlContratoImovel }

constructor TCtrlContratoImovel.Create(const iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso: Integer; const bUsaPlanoPatro: Boolean);
begin
  inherited Create;
  // Cria os DbOjbects
  FDbContratoImovel    := TDBContratoImovel.Create( Self );
  FDbContratoXImovel   := TDBContratoXImovel.Create( Self );
  FDbContratoXVlrAno   := TDBContratoXVlrAno.Create( Self );
  FDbAvalistaXContrato := TDBAvalistaXContrato.Create( Self );
  FDbEventoImovel      := TDBEventoImovel.Create( Self );

  //DAVID - Pendência 17340
  FDbContratoXDesc     := TDbContratoXDesc.Create( Self );


  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  FDbHistpagencimov    := TDbHistpagencimov.Create( Self );
  //MARCELO ALMEIDA - SOL 137256 - KTN 828397


  FDbCondPagImovel     := TDbCondPagImovel.Create( Self );

  // Daniel - 23518
  FDbOutroDadoxImovel  := TDbOutroDadoxImovel.Create( Self );

  // Cria os CtrlObjects
  DiasUteis             := TDiasUteis.Create;
  CtrlImovel            := TCtrlImovel.Create;
  CtrlEventoImovel      := TCtrlEventoImovel.Create;
  CtrlLancImovel        := TCtrlLancamentosImovel.Create( iIdEmpresa, iIdModulo, iIdUsuario, iIdEspAcesso, bUsaPlanoPatro );
  CtrlModuloImobiliario := TCtrlModuloImobiliario.Create;

  // Daniel - 26104
  CtrlParamMulta        := TCtrlParamMulta.Create( iIdEmpresa,
                                                   iIdModulo,
                                                   iIdUsuario,
                                                   iIdEspAcesso,
                                                   bUsaPlanoPatro );
  // Fim.

  // Carrega Variáveis Globais
  ParamSistema.idEmpresa     := iIdEmpresa;
  ParamSistema.idModulo      := iIdModulo;
  ParamSistema.idUsuario     := iIdUsuario;
  ParamSistema.idEspAcesso   := iIdEspAcesso;
  ParamSistema.UsaPlanoPatro := bUsaPlanoPatro;

  // Daniel - 26104
  CtrlParamMulta.CdsContratoXMulta := CdsContratoXMulta;
  // Fim.
end;

destructor TCtrlContratoImovel.Destroy;
begin
  // Destrói os DbObjects criados
  FreeAndNil( FDbContratoImovel );
  FreeAndNil( FDbContratoXImovel );
  FreeAndNil( FDbContratoXVlrAno );
  FreeAndNil( FDbAvalistaXContrato );
  FreeAndNil( FDbEventoImovel );

  // Daniel - 23518
  FreeAndNil( FDbOutroDadoxImovel );

  //DAVID - Pendência 17340
  FreeAndNil( FDbContratoXDesc );

  FreeAndNil( FDbCondPagImovel );

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil( FCdsContratoImovel );
    FreeAndNil( FCdsContratoXImovel );
    FreeAndNil( FCdsContratoXVlrAno );
    FreeAndNil( FCdsAvalistaXContrato );
    FreeAndNil( FCdsEventoImovel );

    //DAVID - Pendência 17340
    FreeAndNil( FCdsContratoXDesc );

    FreeAndNil( FCdsCondPagImovel );
    FreeAndNil ( FCdsDescCondicional );

    // Daniel - 23518
    FreeAndNil (FCdsOutroDadoxImovel);

    // Daniel - 22687
    FreeAndNil (CdsContratoXMulta);

    //MARCELO ALMEIDA - SOL 137256 - KTN 828397
    FreeAndNil( FCdsHistpagencimov );
    FreeAndNil( FDbHistpagencimov );
    //MARCELO ALMEIDA - SOL 137256 - KTN 828397    

  end;

  // Destrói os CtrlObjects criados
  FreeAndNil( CtrlImovel);
  FreeAndNil( CtrlEventoImovel );
  FreeAndNil( CtrlLancImovel );
  FreeAndNil( CtrlModuloImobiliario );
  FreeAndNil( DiasUteis );

  FreeAndNil( CtrlParamMulta );

  inherited;
end;

procedure TCtrlContratoImovel.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsContratoImovel    := TCMClientDataSet.Create( nil );
  FCdsContratoXImovel   := TCMClientDataSet.Create( nil );
  FCdsContratoXVlrAno   := TCMClientDataSet.Create( nil );
  FCdsAvalistaXContrato := TCMClientDataSet.Create( nil );
  FCdsEventoImovel      := TCMClientDataSet.Create( nil );

  // Daniel - 23518
  FCdsOutroDadoxImovel  := TCMClientDataSet.Create( nil );

  // Daniel - 22687
  CdsContratoXMulta     := TCMClientDataSet.Create( nil );

  //DAVID - Pendência 17340
  FCdsContratoXDesc     := TCMClientDataSet.Create( nil );

  //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  FCdsHistpagencimov := TCMClientDataSet.Create( nil );


  FCdsCondPagImovel     := TCMClientDataSet.Create( nil );
  CdsDescCondicional    := TCMClientDataSet.Create( nil );
end;

procedure TCtrlContratoImovel.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbContratoImovel.DataBaseName    := DataBaseName;
  FDbContratoXImovel.DataBaseName   := DataBaseName;
  FDbContratoXVlrAno.DataBaseName   := DataBaseName;
  FDbAvalistaXContrato.DataBaseName := DataBaseName;
  FDbEventoImovel.DataBaseName      := DataBaseName;

  //DAVID - Pendencia 17340
  FDbContratoXDesc.DatabaseNAme     := DataBaseName;

 //MARCELO ALMEIDA - SOL 137256 - KTN 828397
  FDbHistpagencimov.DataBaseName    := DataBaseName;

  FDbCondPagImovel.DatabaseName     := DatabaseName;

  // Daniel - 23518
  FDbOutroDadoxImovel.DataBaseName  := DataBaseName;

  // Inicializa os demais ctrls
  CtrlImovel.InitializeAs( Self );
  CtrlEventoImovel.InitializeAs( Self );
  CtrlLancImovel.InitializeAs( Self );
  CtrlModuloImobiliario.InitializeAs( Self );

  CtrlParamMulta.InitializeAs( Self ); // Daniel - 26104

  DiasUteis.InitializeAs( Self );
  DiasUteis.OnMessageInfo := nil;

  // Busca parâmetros
  CtrlModuloImobiliario.Adminimob.GetParam(ParamSistema.idEmpresa);
end;

function TCtrlContratoImovel.GravaContratoImovel: Boolean;
var sMsg : String;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
   FIDContratoImovel := -1;  
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaContratoImovel( CdsContratoImovel.Data, CdsContratoXImovel.Data,
                                                        CdsAvalistaXContrato.Data, CdsEventoImovel.Data,
                                                        //MARCELO ALMEIDA - SOL 137256 - KTN 828397
                                                        CdsHistpagencimov.Data,
                                                        //MARCELO ALMEIDA - SOL 137256 - KTN 828397
                                                        // Daniel - 23518         // Daniel - 22687
                                                        CdsOutroDadoxImovel.Data, CdsContratoXMulta.Data );

    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      if VerificaVigenciaImoveis(sMsg) then begin

          if VerificaRateioImoveis( sMsg, -1 ) then begin

            DefineStatusContrato;
            DefineValorContrato;


            // Grava Contrato Imóvel ( Pai )
            Result := ApplyCds( CdsContratoImovel, DbContratoImovel, [], [] );
            if not Result then raise Exception.Create( DbContratoImovel.MessageInfo );

            FIDContratoImovel := DbContratoImovel.IdContratoImovel.AsInteger;
            
            // Grava Contrato X Imóvel ( Filho )
            Result := ApplyCds( CdsContratoXImovel, DbContratoXImovel, [DbContratoImovel.IdContratoImovel], [DbContratoXImovel.IdContratoImovel], True );
            if not Result then raise Exception.Create( DbContratoXImovel.MessageInfo );

            // Grava Contrato X VlrAno ( Filho )
            Result := ApplyCds( CdsContratoXVlrAno, DbContratoXVlrAno, [DbContratoImovel.IdContratoImovel], [DbContratoXVlrAno.IdContratoImovel] );
            if not Result then raise Exception.Create( DbContratoXVlrAno.MessageInfo );

            // Grava Contrato X Avalista ( Filho )
            Result := ApplyCds( CdsAvalistaXContrato, DbAvalistaXContrato, [DbContratoImovel.IdContratoImovel], [DbAvalistaXContrato.IdContratoImovel], True );
            if not Result then raise Exception.Create( DbAvalistaXContrato.MessageInfo );

            //MARCELO ALMEIDA - SOL 137256 - KTN 828397
            // Grava Histpagencimov ( Filho )
            Result := ApplyCds( CdsHistpagencimov, DbHistpagencimov, [], [], True );
            if not Result then raise Exception.Create( DbHistpagencimov.MessageInfo );
            //MARCELO ALMEIDA - SOL 137256 - KTN 828397
            

            // Grava Contrato X Eventos ( Filho )
            Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [DbContratoImovel.IdContratoImovel], [DbEventoImovel.IdContratoImovel] );
            if not Result then raise Exception.Create( DbEventoImovel.MessageInfo );

            //DAVID - Pendência 17340
            // Grava Contrato X Descontos Programados ( Filho )
            Result := ApplyCds( CdsContratoXDesc, DbContratoXDesc, [DbContratoImovel.IdContratoImovel], [DbContratoXDesc.IdContratoImovel] );
            if not Result then raise Exception.Create( DbContratoXDesc.MessageInfo );

            Result := ApplyCds( CdsCondPagImovel, DbCondPagImovel, [DbContratoImovel.IdContratoImovel], [DbCondPagImovel.IdContratoImovel]);
            if not Result then raise Exception.Create( DbCondPagImovel.MessageInfo );

// Daniel - 23518 - ------------------------------------------------------------
            // Grava OutroDadoxImovel ( Filho )
            Result := ApplyCds( CdsOutroDadoxImovel, DbOutroDadoxImovel, [DbContratoImovel.IdContratoImovel], [DbOutroDadoxImovel.IdContratoImovel] );
            if not Result then raise Exception.Create( DbOutroDadoxImovel.MessageInfo );
// Daniel - 23518 - ------------------------------------------------------------

// Daniel - 22687 - ------------------------------------------------------------
            // Grava ContratoXMulta ( Filho )
            Result := ApplyCds( CdsContratoXMulta, CtrlParamMulta.DbContratoXMulta, [DbContratoImovel.IdContratoImovel], [CtrlParamMulta.DbContratoXMulta.IdContratoImovel] );
            if not Result then raise Exception.Create( CtrlParamMulta.DbContratoXMulta.MessageInfo );
// Daniel - 22687 - ------------------------------------------------------------

            Commit;
          end else begin
            raise Exception.Create( sMsg );
          end;
      end else
          raise Exception.Create( sMsg );
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


function TCtrlContratoImovel.ExcluiContratoImovel: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiContratoImovel( CdsContratoImovel.Data, CdsContratoXImovel.Data,
                                                         CdsAvalistaXContrato.Data,
                                                         //MARCELO ALMEIDA - SOL 137256 - KTN 828397
                                                         CdsHistpagencimov.Data,
                                                         //MARCELO ALMEIDA - SOL 137256 - KTN 828397
                                                         // Daniel - 23518         // Daniel - 22687
                                                         CdsOutroDadoxImovel.Data, CdsContratoXMulta.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos os filhos para exclusão
      CdsContratoXImovel.First;
      CdsAvalistaXContrato.First;
      CdsEventoImovel.First;
      CdsCondPagImovel.First;

      // Daniel - 23518
      CdsOutroDadoxImovel.First;

      // Daniel - 22687
      CdsContratoXMulta.First;

      while not CdsCondPagImovel.Eof     do CdsCondPagImovel.Delete;
      while not CdsContratoXImovel.Eof   do CdsContratoXImovel.Delete;
      while not CdsContratoXVlrAno.Eof   do CdsContratoXVlrAno.Delete;
      while not CdsAvalistaXContrato.Eof do CdsAvalistaXContrato.Delete;
      while not CdsEventoImovel.Eof      do CdsEventoImovel.Delete;

      //MARCELO ALMEIDA - SOL 137256 - KTN 828397
      CdsHistpagencimov.First;
      while (not(CdsHistpagencimov.Eof)) do
      begin
        CdsHistpagencimov.Delete;
      end;
      //MARCELO ALMEIDA - SOL 137256 - KTN 828397

      //DAVID - Pendência 17340
      while not CdsContratoXDesc.Eof     do CdsContratoXDesc.Delete;

      // Daniel - 23518
      while not CdsOutroDadoxImovel.Eof  do CdsOutroDadoxImovel.Delete;

      // Daniel - 22687
      while not CdsContratoXMulta.Eof  do CdsContratoXMulta.Delete;

      // Exclui Contrato X Eventos ( Filho )
      Result := ApplyCds( CdsEventoImovel, DbEventoImovel, [], [] );
      if not Result then raise Exception.Create( DbEventoImovel.MessageInfo );

      // Exclui Contrato X Avalista ( Filho )
      Result := ApplyCds( CdsAvalistaXContrato, DbAvalistaXContrato, [], [] );
      if not Result then raise Exception.Create( DbAvalistaXContrato.MessageInfo );

      //MARCELO ALMEIDA - SOL 137256 - KTN 828397
      // Exclui CdsHistpagencimov ( Filho )
      Result := ApplyCds( CdsHistpagencimov, DbHistpagencimov, [], [] );
      if not Result then raise Exception.Create( DbHistpagencimov.MessageInfo );
      //MARCELO ALMEIDA - SOL 137256 - KTN 828397

      // Exclui Contrato X VlrAno ( Filho )
      Result := ApplyCds( CdsContratoXVlrAno, DbContratoXVlrAno, [], [] );
      if not Result then raise Exception.Create( DbContratoXVlrAno.MessageInfo );

      // Exclui Contrato X Imóvel ( Filho )
      Result := ApplyCds( CdsContratoXImovel, DbContratoXImovel, [], [] );
      if not Result then raise Exception.Create( DbContratoXImovel.MessageInfo );

      //David - Pendência 17340
      // Exclui Contrato X Desconto Programado ( Filho )
      Result := ApplyCds( CdsContratoXDesc, DbContratoXDesc, [], [] );
      if not Result then raise Exception.Create( DbContratoXDesc.MessageInfo );

      Result := ApplyCds( CdsCondPagImovel, DbCondPagImovel, [], []);
      if not Result then raise Exception.Create( DbCondPagImovel.MessageInfo );

// Daniel - 23518 --------------------------------------------------------------
      // Exclui OutroDadoxImovel ( Filho )
      Result := ApplyCds( CdsOutroDadoxImovel, DbOutroDadoxImovel, [], [] );
      if not Result then raise Exception.Create( DbOutroDadoxImovel.MessageInfo );
// Daniel - 23518 --------------------------------------------------------------

// Daniel - 22687 --------------------------------------------------------------
      // Exclui ContratoXMulta ( Filho )
      Result := ApplyCds( CdsContratoXMulta, CtrlParamMulta.DbContratoXMulta, [], [] );
      if not Result then raise Exception.Create( CtrlParamMulta.DbContratoXMulta.MessageInfo );
// Daniel - 22687 --------------------------------------------------------------

      // Exclui Contrato Imóvel ( Pai )
      Result := ApplyCds( CdsContratoImovel, DbContratoImovel, [], [] );
      if not Result then raise Exception.Create( DbContratoImovel.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


procedure TCtrlContratoImovel.OnApplyCdsRecord(aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
var sNumero : String;
begin
  inherited;
  Accept := True;
  if AnsiUpperCase(sTableName) = 'CONTRATOIMOVEL' then begin
    if CdsState in [usInserted] then begin
       sNumero := IncrementaNumeracao;
       if sNumero = '' then begin
          Accept := False;
          Exit;
       end;
       aCds.Edit;
       aCds.FieldByName('CONNUMERO').asString := sNumero;
       aCds.Post;
    end;
  end;

end;


procedure TCtrlContratoImovel.AfterApplyCdsRecord(aCds: TClientDataSet; const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
var iIdContrato : Integer;
begin
  inherited;
  // Atualiza a Ocupação do imóvel após a aplicação de cada registro do CDS de CONTRATOIMOVEL
  if AnsiUpperCase(sTableName) = 'CONTRATOXIMOVEL' then begin //Cássio Rovaroto - SIG nº 136078
    if CdsState in [usModified, usInserted, usDeleted] then begin
      iIdContrato := aCds.FieldByName('IDCONTRATOIMOVEL').AsInteger;
      CtrlImovel.AtualizaOcupacao('O', -1, iIdContrato, False);
      CtrlImovel.AtualizaOcupacao('D', -1, iIdContrato, False);
    end;
  end;

  if AnsiUpperCase(sTableName) = 'CONDPAGIMOVEL' then begin
     if CdsState in [usInserted] then begin
        FCdsDescCondicional.First;
        while not FCdsDescCondicional.eof do
        begin
           if (FCdsDescCondicional.FieldByName('IDCONDPAGIMOVEL').AsInteger < 0) and
              (aCds.FieldByName('IDCONDPAGIMOVEL').AsInteger = FCdsDescCondicional.FieldByName('IDCONDPAGIMOVEL').AsInteger) then
           begin
              FCdsDescCondicional.Edit;
              FCdsDescCondicional.FieldByName('IDCONDPAGIMOVEL').AsInteger := DbCondPagImovel.Idcondpagimovel.AsInteger;
              FCdsDescCondicional.Post;
           end;
           FCdsDescCondicional.Next;
        end;
        FCdsDescCondicional.First;
     end;
  end;
end;


//========================================================================================
// Função para Selecionar um contrato
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContrato    - id do Contrato
//       iIdResponsavel - id do Responsavel pelo contrato
//       sTipo          - Tipo de Contrato ( L - Locação, P - Prop. Alienação, C - Alienação )
//       sVigencia      - Status do Contrato ( V - Vigente, R - Rescindido, E - Encerrado )
//       bRespNulo      - Exibe além dos contratos do responsavel indicado, os contratos sem responsável
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.LookupContratoImovel(const iIdContrato:Integer = -1; const iIdResponsavel:Integer = -1; const sTipo:String = '';
                                                  const sVigencia:String = ''; const sFolha:String =''; const bRespNulo:Boolean = True): OleVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdContrato    <> -1 then sParam := sParam + ' AND C.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);
  if sTipo          <> '' then sParam := sParam + ' AND C.FLGTIPOCONTRATO = ' + QuotedStr(sTipo);
  if sVigencia      <> '' then sParam := sParam + ' AND C.FLGSTATUS = ' + QuotedStr(sVigencia);
  if sFolha         = 'S' then sParam := sParam + ' AND C.FLGCOBRANCAAUTO = 1 ';
  if sFolha         = 'N' then sParam := sParam + ' AND NVL(C.FLGCOBRANCAAUTO,0) = 0 ';

  if iIdResponsavel <> -1 then begin
     if bRespNulo then
          sParam := sParam + ' AND ( C.IDRESPONSAVEL IS NULL OR C.IDRESPONSAVEL = ' + IntToStr(iIdResponsavel) + ' )'
     else sParam := sParam + ' AND C.IDRESPONSAVEL = ' + IntToStr(iIdResponsavel);
  end;

  // Define Sql
  sSql := 'SELECT C.CODESTADO,         C.CODPORTFORMA,     C.CONBANCOFIANCA,   C.CONDATAASSINATURA,   '+#13+
          '       C.CONDATAAVDENUNCIA, C.CONDATAAVRENEGOC, C.CONDATACARENCIA,  C.CONDATADENUNCIA,     '+#13+
          '       C.CONDATAFIANCAAV,   C.CONDATAFIANCAFIM, C.CONDATAFIANCAINI, C.CONDATAFIM,          '+#13+
          '       C.CONDATAINICAREN,   C.CONDATAINICIO,    C.CONDATAREAJUSTE,  C.CONDATARENEGOC,      '+#13+
          '       C.CONDESCRICAO,      C.CONDIASREPASSE,   C.CONDIASTOLERANCIA,C.CONDIAVENCIMENTO,    '+#13+
          '       C.CONINDICEREAJUSTE, C.CONMESREFREAJUSTE,C.CONMOEDAMORA,     C.CONMOEDAMULTA,       '+#13+
          '       C.CONNOME,           C.CONNUMERO,        C.CONOBSFIANCA,     C.CONPERALUGUEL,       '+#13+
          '       C.CONPERCENTMORA,    C.CONPERCENTMULTA,  C.CONPERMORA,       C.CONPERREAJUSTE,      '+#13+
          '       C.CONPROXREAJUSTE,   C.CONQUANTVAGAS,    C.CONTAXAADMIN,     CI.CONVLRAJUSTADO,     '+#13+

          '       C.CONVLRFIANCA,      C.CONVLRMORA,       C.CONVLRMULTA,      C.CONVLRTOTAL,         '+#13+
          '       C.FLGCOBRANCAAUTO,   C.FLGCOMPETALUGUEL, C.FLGFIANCA,        C.FLGINDETERMINADO,    '+#13+
          '       C.FLGMORAPROPORC,    C.FLGSTATUS,        C.FLGTIPOCONTRATO,  C.FLGTIPODIATOLERA,    '+#13+
          '       C.FLGTIPODIAVENC,    C.IDADMINIMOVEL,    C.IDATIVIDADE,      C.IDCIDADES,           '+#13+
          '       C.IDCONTRATOIMOVEL,  C.IDINDCORRECAO,    C.IDLOCATARIO,      C.IDMARCA,             '+#13+
          '       C.IDMSGBOLETO,       C.IDPAIS,           C.IDPESSOA,         C.IDRESPONSAVEL,       '+#13+
          '       C.IDSITCONTIMOB,     C.IDTIPOCUSTORECIMO,C.MOECODIGO,        C.PERALUGUELIDEAL,     '+#13+
          '       C.PERCTXJURMERC,     C.PERITXJURMERC,    C.VLRCONTABIL,      C.VLRPRESENTE,         '+#13+
          '       C.VLRPROPOSTA,       C.FLGTIPOALUGUEL,   C.CONDATASOLRESC,   C.IDREGRARES,          '+#13+
          '       C.PERMULTARESC,      C.QTDEMULTARESC,    C.CONPERCREAJUSTE,                         '+#13+
          '       A.NOME            AS DSC_ADMINISTRADORA,                                            '+#13+
          '       L.NOME            AS DSC_LOCATARIO,                                                 '+#13+
          '       R.NOME            AS DSC_RESPONSAVEL,                                               '+#13+
          '       C.TRGDTINCLUSAO,                                                                    '+#13+
          '       DECODE(C.USU_INC, NULL, C.TRGUSERINCLUSAO, US.NOMEUSUARIO) AS TRGUSERINCLUSAO,      '+#13+
          '       DECODE(C.USU_INC, NULL, C.TRGUSERINCLUSAO, U.NOME) AS USUARIO,                      '+#13+

          // André Mesquita - 24081
          '       C.IDTIPOCONTRIMOB                                                                   '+#13+

          'FROM (                                                                                     '+#13+
          '      SELECT C1.*,                                                                         '+#13+
          '             DECODE(SUBSTR(TRGUSERINCLUSAO,1,2),''CM'',TRGUSERINCLUSAO, NULL) AS USU_INC   '+#13+
          '      FROM CONTRATOIMOVEL C1                                                               '+#13+
          '      ) C,                                                                                 '+#13+
// Daniel Simões - 14/02/2006 - ------------------------------------------------
          '     ( SELECT CXI.IDCONTRATOIMOVEL, SUM(CXI.CIMVLRAJUSTADO) AS CONVLRAJUSTADO              '+#13+
          '       FROM CONTRATOXIMOVEL CXI                                                            '+#13+
          '       WHERE ( (CXI.CIMDTFIM IS NOT NULL AND                                               '+#13+
          '                     SYSDATE BETWEEN CXI.CIMDTINI AND CXI.CIMDTFIM ) OR                    '+#13+
          '                (CXI.CIMDTFIM IS NULL AND                                                  '+#13+
          '                     SYSDATE >= CXI.CIMDTINI ) )                                           '+#13+
          '       GROUP BY CXI.IDCONTRATOIMOVEL ) CI,                                                 '+#13+
// Daniel Simões - 14/02/2006 - ------------------------------------------------
          '       ADMINIMOVEL AC, PESSOA A,                                                           '+#13+
          '       LOCATARIO   LC, PESSOA L,                                                           '+#13+
          '       RESPONSAVEL RC, PESSOA R,                                                           '+#13+
          '       PESSOA U, USUARIOSISTEMA US                                                         '+#13+
          'WHERE C.IDADMINIMOVEL        = AC.IDADMINIMOVEL(+)                                         '+#13+
          '  AND C.IDCONTRATOIMOVEL     = CI.IDCONTRATOIMOVEL(+)                                      '+#13+
          '  AND AC.IDADMINIMOVEL       = A.IDPESSOA(+)                                               '+#13+
          '  AND C.IDLOCATARIO          = LC.IDLOCATARIO(+)                                           '+#13+
          '  AND LC.IDLOCATARIO         = L.IDPESSOA(+)                                               '+#13+
          '  AND C.IDRESPONSAVEL        = RC.IDRESPONSAVEL(+)                                         '+#13+
          '  AND SUBSTR(C.USU_INC,3,30) = U.IDPESSOA(+)                                               '+#13+
          '  AND SUBSTR(C.USU_INC,3,30) = US.IDUSUARIO(+)                                             '+#13+
          '  AND RC.IDRESPONSAVEL       = R.IDPESSOA(+)                                               '+#13+ sParam;

  Result := GetDataPacket(sSql);
end;

//========================================================================================
// Função para Selecionar os contratos de um imóvel
// Data : 05/03/2004                            Autor: Vinícius Meyer Lana e Marcio Motta
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel       - id do Contrato
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.LookupContratosDoImovel(const iIdImovel: Integer): OleVariant;
var sSql : string;
begin
  // Define Sql
  sSql := 'SELECT CXI.IDCONTRATOIMOVEL, C.CONNOME, C.CONNUMERO,'        +#13+
          '( C.CONNUMERO || '' - '' || C.CONNOME ) AS CONTRATO_EXTENSO' +#13+
          '  FROM CONTRATOXIMOVEL CXI, '                                +#13+
          '       CONTRATOIMOVEL C '                                    +#13+
          ' WHERE CXI.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL'           +#13+
          '   AND CXI.IDIMOVEL = ' + IntToStr(iIdImovel);

  Result := GetDataPacket(sSql);
end;


//========================================================================================
// Função para Selecionar os imóveis de um contrato
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContrato    - id do Contrato
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.LookupContratoXImovel(const iIdContrato: Integer; const bVigent:boolean): OleVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sSql   := '';
  sParam := '';

  if iIdContrato<>-1 then sParam := sParam+'  AND CX.IDCONTRATOIMOVEL = '+IntToStr(iIdContrato)+#13;

// Daniel - 24085 - Início -----------------------------------------------------
  // Define Sql
  sSql := 'SELECT CX.IDIMOVEL,  CX.IDCONTRATOIMOVEL, CX.CIMVLRALUGUEL, CX.CIMVLRAJUSTADO, '              +#13+
          '       CX.FLGRATEIO, CX.CIMPERCENTRATEIO, CX.CIMDESCRICAO,  I.CODTIPIMOVEL, '                 +#13+
          '       I.IMOCODIGO,  CX.CIMDTINI,         CX.CIMDTFIM,      CX.CIMVLRAJUSTADO AS VLRIMOVEL, ' +#13+
          '       CI.CONVLRAJUSTADO, DECODE(I.IDIMOVELPAI,NULL,I.IMONOME, '                              +#13+
          '                          DECODE(I.IMONOME,NULL,IP.IMONOME, '                                 +#13+
          '                                 IP.IMONOME||'' - ''||I.IMONOME)) AS DSC_IMOVEL, '            +#13+
          '       IM.IMONOME AS DSC_MESTRE '                                                             +#13+
          'FROM CONTRATOXIMOVEL CX, IMOVEL I, IMOVEL IM, IMOVEL IP, CONTRATOIMOVEL CI '                  +#13+
          'WHERE CX.IDIMOVEL         = I.IDIMOVEL '                                                      +#13+
          '  AND I.IDIMOVELMESTRE    = IM.IDIMOVEL '                                                     +#13+
          '  AND I.IDIMOVELPAI       = IP.IDIMOVEL(+) '                                                  +#13+
          '  AND CI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL '                                             +#13+sParam+
          'ORDER BY DSC_MESTRE, DSC_IMOVEL';
// Daniel - 24085 - Fim --------------------------------------------------------

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Selecionar os Valores Futuros de um contrato
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContrato    - id do Contrato
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.LookupContratoXVlrAno(const iIdContrato: Integer): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdContrato <> -1 then sParam := sParam + ' AND CV.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);

  // Define Sql
  sSql := 'SELECT I.IMONOME  AS DSC_IMOVEL, '+#13+
          '       IM.IMONOME AS DSC_MESTRE, '+#13+
          '       CV.IDCONTRATOXVLRANO,     '+#13+
          '       CV.IDCONTRATOIMOVEL,      '+#13+
          '       CV.IDIMOVEL,              '+#13+
          '       CV.ANOINICIO,             '+#13+
          '       CV.FLGCORRIGE,            '+#13+
          '       CV.VALOR                  '+#13+
          '  FROM CONTRATOXVLRANO CV,       '+#13+
          '       IMOVEL I,                 '+#13+
          '       IMOVEL IM                 '+#13+
          ' WHERE CV.IDIMOVEL = I.IDIMOVEL       '+#13+
          '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL '+#13+ sParam +
          ' ORDER BY CV.ANOINICIO, DSC_MESTRE, DSC_IMOVEL ';

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Selecionar os Fiadores de um contrato
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdContrato    - id do Contrato
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.LookupContratoXFiador(const iIdContrato: Integer): OleVariant;
var sSql, sParam: String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdContrato <> -1 then sParam := sParam + ' AND AX.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);

  // Define Sql
  sSql := 'SELECT AX.IDCONTRATOIMOVEL, AX.IDAVALISTA, '+#13+
          '       PA.NOME AS NF_FIADOR, PA.RAZAOSOCIAL AS RS_FIADOR '+#13+
          '  FROM PESSOA PA, AVALISTAXCONTRATO AX ' +#13+
          ' WHERE AX.IDAVALISTA = PA.IDPESSOA ' +#13+ sParam +
          ' ORDER BY NF_FIADOR';

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Selecionar os contratos relacionados a um imóvel
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iIdImovel - id do Imóvel
//
// Retorno : OLEVariant  - Conjunto de dados
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.LookupHistContratoImovel(const iIdImovel: Integer): OleVariant;
var sSql, sParam: string;
begin
  // Define Parâmetros
  sParam := '';
  if iIdImovel   <> -1 then sParam := sParam + ' AND CXI.IDIMOVEL = ' + IntToStr(iIdImovel);

  // Define Sql
  sSql := 'SELECT DISTINCT ' +#13+
          '       C.IDCONTRATOIMOVEL, C.CONNUMERO, C.CONNOME, ' +#13+
          '       C.CONDATAINICIO,    C.CONDATAFIM, ' +#13+
          '       CXI.CIMDTINI,       CXI.CIMDTFIM '  +#13+ // Daniel - 27480
          '  FROM CONTRATOIMOVEL C,   '+#13+
          '       CONTRATOXIMOVEL CXI '+#13+
          ' WHERE C.FLGTIPOCONTRATO = ''L'' '+#13+
          '   AND C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL(+) '+#13+ sParam;

  Result := GetDataPacket(sSql);
end;

// Verifica contratos do período para tipo ALUGUEL
function TCtrlContratoImovel.LookupRateio(const iIdContrato, iIdImovel: Integer;
                                          const dInicio,dFim: TDateTime): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := ' AND P.IDPESSOA = ' + IntToStr(ParamSistema.idEmpresa) +#13+
            ' AND CXI.IDIMOVEL = ' + IntToStr(iIdImovel) +#13+


// Daniel Simões - 02/02/2006 - Início -----------------------------------------

            ' AND CXI.CIMDTINI < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dFim)) + ',''DD/MM/YYYY'')' +#13+
            ' AND (CXI.CIMDTFIM   > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dInicio)) + ',''DD/MM/YYYY'')' +#13+
            '      OR (CXI.CIMDTFIM IS NULL) )';
  if iIdContrato <> -1 then sParam := sParam + ' AND C.IDCONTRATOIMOVEL <> ' + IntToStr(iIdContrato);

  // Define Sql
  sSql := 'SELECT CXI.IDIMOVEL, CXI.IDCONTRATOIMOVEL, I.IMONOME, '+#13+
//Felipe de Oliveira  SOL156166  
          '       DECODE(NVL(CXI.FLGRATEIO,0), 0, 0, CXI.CIMPERCENTRATEIO) AS RATEIO, '+#13+
          '       CXI.CIMDTINI, '+#13+
          '       DECODE(CXI.CIMDTFIM, NULL, TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dFim)) + ',''DD/MM/YYYY'') ,CXI.CIMDTFIM ) AS CIMDTFIM '+#13+
          '  FROM CONTRATOIMOVEL C, CONTRATOXIMOVEL CXI, IMOVEL I, PARAMIMOVEL P '+#13+
          ' WHERE C.IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL ' +#13+
          //--Emerson KT 477964 - SOL 106555 Inicio ------------//
          '   AND C.FLGSTATUS = '+QuotedStr('V')+#13+
          //--Emerson KT 477964 - SOL 106555 Fim    ------------//
          '   AND CXI.IDIMOVEL = I.IDIMOVEL ' +#13+
          '   AND C.IDTIPOCUSTORECIMO = P.IDTCUSTORECIMOALU ' +#13+ sParam;

// Daniel Simões - 02/02/2006 - Fim --------------------------------------------

  Result := GetDataPacket( sSql );
end;


//========================================================================================
// Função para Calcular o próximo número de contrato, baseado nos parâmetros do sistema
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
//
// Retorno : String - Número Gerado
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.IncrementaNumeracao: String;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
  Result  := '';
  cdsTemp := nil;
  try
    try
      // Busca ultimo Nr. de Contrato na tabela de Parâmetros
      cdsTemp := TCMClientDataSet.Create( nil );
      sSql := 'SELECT PROXNUMCONTRATO, FLGCONCATENAANO ' +#13+
              '  FROM PARAMIMOVEL ';
      cdsTemp.Data := GetDataPacket( sSql );

      // Gera o Nr. concatenado com o ano, caso configurado nos parâmetros
      Result := IntToStr(cdsTemp.FieldByName('PROXNUMCONTRATO').AsInteger);
      if cdsTemp.FieldByName('FLGCONCATENAANO').AsInteger = 1 then
        Result := Result + '/' + IntToStr(DiasUteis.ExtraiAno(Date));

      // Atualiza o Prox numero nos parâmetros
      sSql := 'UPDATE PARAMIMOVEL SET PROXNUMCONTRATO = ' +
               IntToStr(cdsTemp.FieldByName('PROXNUMCONTRATO').AsInteger + 1);
      if not ExecSql(sSql) then raise Exception.Create( 'Erro ao atualizar o proximo número de contrato');
    except
      on E : Exception do begin
        Result := '';
        MessageInfo := E.Message;
      end;
    end;
  finally
    cdsTemp.Free;
  end;
end;


//========================================================================================
// Função para efetuar a Rescisão do contrato de Locação
// Data : 17/06/2003                            Autor: Vinícius Meyer Lana
//----------------------------------------------------------------------------------------
// Parâmetros :
//       iContrato          - id do Contrato
//       dDataRescisao      - Data da Rescisão
//       dDataSolicitacao   - Data da Solicitação da Rescisão
//       sObs               - Observações para registro do Evento
//       bExcluiLancamentos - Exclui os lançamentos com vencimento poster a Rescisão
//       iDocMulta          - Nr. do Documento da cobrança de multa ( -1 )
//       bTransacao         - Transação Local ( default = True )
//
// Retorno : True  - Efetuou a Rescisão
//           False - Não Efetuou a Rescisão
//----------------------------------------------------------------------------------------
function TCtrlContratoImovel.Rescisao(const iContrato: integer; const dDataRescisao, dDataSolicitacao: TDateTime;
                                      const sObs: String; const bExcluiLancamentos: Boolean;
                                      const iDocMulta:Integer; const bTransacao: Boolean): Boolean;
var sSql : String;
    cdsTemp : TCMClientDataSet;
begin
  Result := True;
  try
    try
      cdsTemp := TCMClientDataSet.Create( nil );

      if bTransacao then StartTransaction;

      // Exclui lançamentos futuros não integrados
      if bExcluiLancamentos then begin
        sSql := 'SELECT DISTINCT IDDOCUMENTO '+#13+
                '  FROM LANCAMENTOSIMOVEL    '+#13+
                ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13+
                '   AND DATAVENCIMENTO > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataRescisao)) + ',''DD/MM/YYYY'') ';

        // Não exclui o documento de cobrança da multa rescisória
        if iDocMulta > 0 then begin
          sSql := sSql + ' AND IDDOCUMENTO <> ' + IntToStr(iDocMulta);
        end;

        cdsTemp.Data := GetDataPacket( sSql );
        cdsTemp.First;
        while not cdsTemp.Eof do begin
          if not  CtrlLancImovel.Excluir( cdsTemp.FieldByName('IDDOCUMENTO').AsInteger, False) then
            raise Exception.Create( CtrlLancImovel.MessageInfo );
          cdsTemp.Next;
        end;
      end;

      // Registra o Evento para o Contrato
      if not CtrlEventoImovel.RegistraEvento(-1, iContrato, -1, -1, ParamSistema.IdUsuario,
                                             'RC', 'Rescisão Contratual',
                                             sObs, dDataRescisao, -1, -1, -1, 0, 0, False) then
         raise Exception.Create( CtrlEventoImovel.MessageInfo );

      // Registra a rescisão no contrato
      sSql := ' UPDATE CONTRATOIMOVEL            '+#13+
              '    SET FLGSTATUS = ''R'',        '+#13+
              '        FLGINDETERMINADO = ''N'', '+#13+
              '        CONDATASOLRESC = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataSolicitacao)) + ',''DD/MM/YYYY''), '+#13+
              '        CONDATAFIM = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataRescisao)) + ',''DD/MM/YYYY'')  '+#13+
              '  WHERE IDCONTRATOIMOVEL = ' + inttostr(iContrato);
      if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

      // Atualiza a Ocupação dos Imóveis do Contrato
      if not CtrlImovel.AtualizaOcupacao('O', -1, iContrato, False) then
         raise Exception.Create( CtrlImovel.MessageInfo );
      if not CtrlImovel.AtualizaOcupacao('D', -1, iContrato, False) then
         raise Exception.Create( CtrlImovel.MessageInfo );

      if bTransacao then Commit;
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


//==============================================================================
// PROCEDIMENTOS INTERNOS
//==============================================================================

procedure TCtrlContratoImovel.DefineStatusContrato;
begin
   if CdsContratoImovel.FieldByName('FLGSTATUS').asString <> 'S' then begin
      // marca o contrato como vigente
      if ( (CdsContratoImovel.FieldByName('CONDATAINICIO').asDateTime <= Date) and
           ((CdsContratoImovel.FieldByName('CONDATAFIM').asDateTime > Date) or
            (CdsContratoImovel.FieldByName('FLGINDETERMINADO').asString = 'S')) ) or
         (CdsContratoImovel.FieldByName('CONDATAINICIO').asDateTime > Date) then begin
        CdsContratoImovel.Edit;
        CdsContratoImovel.FieldByName('FLGSTATUS').asString := 'V';
        CdsContratoImovel.Post;
      end else begin
        // marca o contrato como encerrado
        if CdsContratoImovel.FieldByName('CONDATAFIM').asDateTime < Date then begin
          CdsContratoImovel.Edit;
          CdsContratoImovel.FieldByName('FLGSTATUS').asString := 'E';
          CdsContratoImovel.Post;
        end;
      end;
   end;
end;

//SOL 110145 Kintana 503093 Felipe de Oliveira
// comentado código para o valor total do contrato não ser calculado pela somatória dos alugueis
procedure TCtrlContratoImovel.DefineValorContrato;
var fTotContrato{, fTotAjustado} : Extended;
begin
  fTotContrato := 0;
//  fTotAjustado := 0;

// Daniel Simões - 17/02/2006 - Início - ---------------------------------------
  // Fitra apenas os imóveis ativos...
  CdsContratoXImovel.Filtered  := False;
  CdsContratoXImovel.Filter    := ' ( (CIMDTFIM IS NOT NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI AND '+QuotedStr(DateToStr(Date))+' <= CIMDTFIM) ) OR ' +
                                  ' ( (CIMDTFIM IS NULL) AND ('+QuotedStr(DateToStr(Date))+' >= CIMDTINI) ) ';
  CdsContratoXImovel.Filtered  := True;

  with CdsContratoXImovel do begin
    first;
    while not eof do begin
      fTotContrato := fTotContrato + FieldByName('CIMVLRALUGUEL').AsFloat;
//      fTotAjustado := fTotAjustado + FieldByName('CIMVLRAJUSTADO').AsFloat;
      Next;
    end;
  end;

  // Desabilita o filtro...
  CdsContratoXImovel.Filtered  := False;
// Daniel Simões - 17/02/2006 - Fim - ------------------------------------------


  // grava o valor total do contrato
  CdsContratoImovel.Edit;
  CdsContratoImovel.FieldByName('CONVLRTOTAL').asFloat    := fTotContrato;
  CdsContratoImovel.FieldByName('CONVLRAJUSTADO').asFloat := fTotalContratoReajustado;
  CdsContratoImovel.Post;
end;


function TCtrlContratoImovel.VerificaVigenciaImoveis(var sErro: String; const iIdContrato:Integer = -1): Boolean;
begin
   Result := True;
   sErro  := '';
   // CONDATAINICIO -- CIMDTINI -- CIMDTFIM -- CONDATAFIM //

   CdsContratoXImovel.First;

   while not ( CdsContratoXImovel.Eof ) do begin
     if not ( CdsContratoXImovel.FieldByName('CIMDTINI').IsNull ) then
     begin
       // Se a Data do Início da Vigência for inferior a Data do início do Contrato...
       if ( CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime ) <
          ( CdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime )  then
          sErro := 'A data do Início da Vigência não pode ser inferior a data do Início do Contrato.';
     end
     else
       sErro := 'É necessário indicar a Data do Início da Vigência.';

     // Se a Data do Início da Vigência for inferior a Data do início do Contrato...
     if ( CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime ) <
        ( CdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime ) then
       sErro := 'A data do Início da Vigência não pode ser inferior a data do Início do Contrato.';

     // Verifica somente se não for Prazo Indeterminado...
     if ( CdsContratoImovel.FieldByName('FLGINDETERMINADO').AsString = 'N' ) then
     begin
       if not ( CdsContratoXImovel.FieldByName('CIMDTFIM').IsNull ) then
       begin
         // Imóvel: Se a Data do Início for superior a Data do Término...
         if ( CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime ) >
            ( CdsContratoXImovel.FieldByName('CIMDTFIM').AsDateTime ) then
           sErro := 'A data do Início da Vigência não pode ser superior a data do Término.';

         // Se a Data do Término da Vigência for superior a Data do Término do Contrato...
         if ( CdsContratoXImovel.FieldByName('CIMDTFIM').AsDateTime ) >
            ( CdsContratoImovel.FieldByName('CONDATAFIM').AsDateTime ) then
           sErro := 'A data do Término da Vigência não pode ser superior a data do Término do Contrato.'
       end
       else
       begin
         // Se a Data Inicial da Vigência for superior a Data do Término do Contrato...
         if ( CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime ) >
            ( CdsContratoImovel.FieldByName('CONDATAFIM').AsDateTime ) then
           sErro := 'A data do Início da Vigência não pode ser superior a data do Término do Contrato.';
       end;
     end;
     CdsContratoXImovel.Next;
   end;

   if sErro <> '' then
     Result := False;
end;


function TCtrlContratoImovel.VerificaRateioImoveis(var sErro:String; const iIdContrato:Integer): Boolean;
var //fTotRateio : Extended;
    fTotRateio : Currency;
    cdsTemp,cdsTemp2 : TCMClientDataSet;
    dFim       : TDateTime;
begin
  Result     := True;
  fTotRateio := 0;
  cdsTemp    := nil;
  sErro      := 'O percentual de Rateio do imóvel pelos contratos ativos' +#13+
                'no mesmo período, ultrapassa 100%. Imóveis: '+#13;
  try
    // Se o cds de contrato estiver fechado, abre para o contrato especificado
    if iIdContrato > 0 then begin
       cdsContratoImovel  := TCMClientDataSet.Create( nil );
       cdsContratoxImovel := TCMClientDataSet.Create( nil );
       cdsContratoImovel.Data := LookupContratoImovel(iIdContrato);
       cdsContratoxImovel.Data := LookupContratoXImovel(iIdContrato);
    end;

    // O rateio é verificado apenas para receitas de Aluguel
    if cdsContratoImovel.FieldByName('IDTIPOCUSTORECIMO').AsInteger <>
       CtrlModuloImobiliario.AdminImob.iTipoReceitaAlug then Exit;

    cdsTemp  := TCMClientDataSet.Create( nil );
    cdsTemp2 := TCMClientDataSet.Create( nil );
    // busca todos os OUTROS contratos ativos no mesmo período para o cada imovel do contrato
    CdsContratoXImovel.First;
    while not CdsContratoXImovel.eof do begin
     if CdsContratoXImovel.FieldByName('CIMDTFIM').IsNull then
           dFim := Date

// Daniel Simões - 02/02/2006 - Início -----------------------------------------

      else dFim := CdsContratoXImovel.FieldbyName('CIMDTFIM').AsDateTime;
      cdsTemp.Data := LookupRateio(CdsContratoImovel.FieldByName('IDCONTRATOIMOVEL').AsInteger,
                                   CdsContratoXImovel.FieldByName('IDIMOVEL').AsInteger,
                                   CdsContratoXImovel.FieldByName('CIMDTINI').AsDateTime + 1, dFim);
//                                   CdsContratoImovel.FieldByName('CONDATAINICIO').AsDateTime + 1, dFim);

      // soma o rateio no mesmo período entre os contratos já existentes
      cdsTemp2.Data := cdsTemp.Data;
      cdsTemp.First;
      while not cdsTemp.eof do begin
        fTotRateio := cdsTemp.FieldByName('RATEIO').AsFloat;
        cdsTemp2.First;
        while not cdsTemp2.eof do begin
          if cdsTemp2.FieldByName('IDCONTRATOIMOVEL').AsInteger <> cdsTemp.FieldByName('IDCONTRATOIMOVEL').AsInteger then begin
            if ( cdsTemp2.FieldByName('CIMDTINI').AsDateTime <= cdsTemp.FieldByName('CIMDTFIM').AsDateTime ) and
               ( cdsTemp2.FieldByName('CIMDTFIM').AsDateTime >= cdsTemp.FieldByName('CIMDTINI').AsDateTime ) then begin
// Daniel Simões - 02/02/2006 - Fim --------------------------------------------

              // Soma o percentual de rateio dos imóveis do mesmo periodo
              fTotRateio := fTotRateio + CdsTemp2.FieldByName('RATEIO').AsFloat;

            end;
          end;
          cdsTemp2.Next;
        end;

        // Soma o percentual informado no contrato que esta sendo gravado
        if CdsContratoXImovel.FieldByName('FLGRATEIO').AsString = '1' then
             fTotRateio := fTotRateio + CdsContratoXImovel.FieldByName('CIMPERCENTRATEIO').AsFloat;
//        else fTotRateio := fTotRateio + 100;

        //Cássio SOL Nº 128195  KINTANA Nº 686152
        //Incluído a função Trunc para certar a porcentagem do rateio, que estava
        //vindo com valor maior que 100%, que era apresentado.
//        if Trunc(fTotRateio) > 100 then begin

        if fTotRateio > 100 then begin
           Result := False;
           sErro  := sErro + cdsTemp.FieldByName('IMONOME').AsString +#13;
        end;

        cdsTemp.Next;
      end;

      CdsContratoXImovel.Next;
    end;
  finally
    cdsTemp.Free;
    cdsTemp2.Free;
    if iIdContrato > 0 then begin
       cdsContratoImovel.Free;
       cdsContratoxImovel.Free;
    end;
  end;
end;


procedure TCtrlContratoImovel.SetCdsContratoImovel(const Value: TCMClientDataSet);
begin
  FCdsContratoImovel := Value;
end;

procedure TCtrlContratoImovel.SetDbContratoImovel(const Value: TDbContratoImovel);
begin
  FDbContratoImovel := Value;
end;

procedure TCtrlContratoImovel.SetCdsContratoXImovel(const Value: TCMClientDataSet);
begin
  FCdsContratoXImovel := Value;
end;

procedure TCtrlContratoImovel.SetDbContratoXImovel(const Value: TDbContratoXImovel);
begin
  FDbContratoXImovel := Value;
end;

procedure TCtrlContratoImovel.SetCdsAvalistaXContrato(const Value: TCMClientDataSet);
begin
  FCdsAvalistaXContrato := Value;
end;

procedure TCtrlContratoImovel.SetDbAvalistaXContrato(const Value: TDbAvalistaXContrato);
begin
  FDbAvalistaXContrato := Value;
end;

procedure TCtrlContratoImovel.SetCdsEventoImovel(const Value: TCMClientDataSet);
begin
  FCdsEventoImovel := Value;
end;

procedure TCtrlContratoImovel.SetDbEventoImovel(const Value: TDbEventoImovel);
begin
  FDbEventoImovel := Value;
end;

procedure TCtrlContratoImovel.SetCdsContratoXVlrAno(const Value: TCMClientDataSet);
begin
  FCdsContratoXVlrAno := Value;
end;

procedure TCtrlContratoImovel.SetDbContratoXVlrAno(const Value: TDbContratoXVlrAno);
begin
  FDbContratoXVlrAno := Value;
end;


function TCtrlContratoImovel.BuscaParamCMJurosMulta(const idContratoImovel: Double;
                                                    const DataVencto: TDateTime): OleVariant;
var cdsTemp: TCMClientDataSet;
    sSql : string;

begin
  try

    // Início ------- Data: 06/01/2004 ----- Marcio Motta ----- Pendência: 15799 ----------

    // Monta Query para selecionar condição de vigência
    sSql := ' SELECT *' + #13 +
            '   FROM CONTRATOXMULTA ' + #13 +
            '  WHERE IDCONTRATOIMOVEL = ' + FloatToStr(idContratoImovel) + #13 +
            '    AND ( (FLGINDETERMINADO = ''N'')' + #13 +
            '    AND ( TO_DATE('+ QuotedStr(DateToStr(DataVencto))+ ',''DD/MM/YYYY'')' + #13 +
            '          BETWEEN TO_DATE(TO_CHAR(DATAINI,''DD/MM/YYYY'')) AND TO_DATE(TO_CHAR(DATAFIM,''DD/MM/YYYY'')) )' + #13 +
            '          OR ((FLGINDETERMINADO = ''S'') AND (TO_DATE(TO_CHAR(DATAINI,''DD/MM/YYYY'')) <= TO_DATE(' + QuotedStr(DateToStr(DataVencto)) + ',''DD/MM/YYYY'')) ))';

    // Cria um CDS temporário para receber os dados
    cdsTemp := TCMClientDataSet.Create( nil );

    // Recebe o pacote de dados
    cdsTemp.Data := GetDataPacket( sSql );

    Result := cdsTemp.Data;

    // Busca o Contrato
    sSql := 'SELECT CONNUMERO  || '' - '' || CONNOME AS CONTRATO '+#13+
            '  FROM CONTRATOIMOVEL ' +#13+
            ' WHERE IDCONTRATOIMOVEL = ' + FloatToStr(idContratoImovel);

    // Se não retornou dados envia mensagem de erro
    if cdsTemp.IsEmpty then begin
       cdsTemp.Data := GetDataPacket(sSql);
       MessageInfo  := 'Não existe vigência com parâmetros de Correção cadastrada para o ' + #13 +
                       'Contrato ' + cdsTemp.FieldByName('CONTRATO').AsString +#13+
                       'que contemple a data de vencimento informada: ' + DateToStr(DataVencto);
    end else begin
        if cdsTemp.RecordCount > 1 then begin
           cdsTemp.Data := GetDataPacket(sSql);
           MessageInfo  := 'Existe mais de uma Vigência cadastrada para o '+#13+
                           'Contrato ' + cdsTemp.FieldByName('CONTRATO').AsString +#13+
                           'na data de vencimento informada';
        end;
    end;

  finally
    FreeAndNil( cdsTemp );
  end;

// Fim ------------------------ Marcio Motta -----------------------------------
end;



function TCtrlContratoImovel.SuspenderReativar(const iContrato: integer; const dDataEvento: TDateTime;
                                               const sObs, sFlgStatus: string; const bTransacao:Boolean = True): Boolean;
var
  cdsTemp : TCMClientDataSet;
  sSql, sTipoEvento, sCabecalho, sIndeterminado, sFimContr, sMsg  : string;
  dTerminoContr, dFimContr : TDateTime;
begin
//---------- 12/05/2004 - Marcio Motta - Pendência: 16754 ------------------------------------------
  Result := True;
  try
     try
       if bTransacao then StartTransaction;

       // Verifica o Tipo de evento e o Cabeçalho do Evento
       case sFlgStatus[1] of
         'S' : begin
                 sTipoEvento := 'SU';
                 sCabecalho  := 'Suspensão Contratual';
               end;
         'V' : begin
                 sTipoEvento := 'CS';
                 sCabecalho  := 'Cancelamento da Suspensão';
               end;
         else
           raise Exception.Create( 'Tipo de evento não previsto!' );
       end;

       // Busca data de término do contrato. Esta será gravada em EventoImovel.EviDataProx
       // para ser retornada para o contrato caso o processo seja desfeito.
       cdsTemp := TCMClientDataSet.Create( nil );
       if sFlgStatus = 'S' then begin
          sSql := 'SELECT CONDATAFIM FROM CONTRATOIMOVEL '+#13+
                  ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato);
          cdsTemp.Data   := GetDataPacket( sSql );
          dTerminoContr  := cdsTemp.FieldByName('CONDATAFIM').AsDateTime;
          dFimContr      := dDataEvento;
          sIndeterminado := 'N';
       end else begin
          sSql := 'SELECT DISTINCT EVIDATAPROX '+#13+
                  '  FROM EVENTOIMOVEL '+#13+
                  ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iContrato) +#13+
                  '   AND FLGTIPOEVENTO = ''SU'' '+#13+
                  '   AND EVIDATA = (SELECT MAX(EVIDATA) '+#13+
                  '                    FROM EVENTOIMOVEL '+#13+
                  '                   WHERE FLGTIPOEVENTO = ''SU'' '+#13+
                  '                     AND IDCONTRATOIMOVEL = ' + IntToStr(iContrato) + ' ) ';
          cdsTemp.Data  := GetDataPacket( sSql );
          dTerminoContr := -1;
          if cdsTemp.FieldByName('EVIDATAPROX').IsNull then begin
             sIndeterminado := 'S';
             dFimContr := -1;
          end else begin
             sIndeterminado := 'N';
             dFimContr := cdsTemp.FieldByName('EVIDATAPROX').AsDateTime;
          end;
       end;
       if dFimContr > 0 then begin
          sFimContr := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dFimContr)) + ',''DD/MM/YYYY'')';
       end else begin
          sFimContr := ' NULL ';
       end;

       // Registra o Evento para o Contrato
       if not CtrlEventoImovel.RegistraEvento(-1, iContrato, -1, -1, ParamSistema.IdUsuario,
                                              sTipoEvento, sCabecalho, sObs, dDataEvento,
                                              dTerminoContr, -1, -1, 0, 0, False) then
          raise Exception.Create( CtrlEventoImovel.MessageInfo );

       // Registra a Suspensão ou Reativação do contrato
       sSql := ' UPDATE CONTRATOIMOVEL            '+#13+
               '    SET FLGSTATUS = ' + QuotedStr(sFlgStatus) +','+#13+
               '        FLGINDETERMINADO = ' + QuotedStr(sIndeterminado) +','+#13+
               '        CONDATAFIM = ' + sFimContr +#13+
               '  WHERE IDCONTRATOIMOVEL = ' + inttostr(iContrato);
       if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

       // Verifica se os imóveis alocados ao contrato ainda estão disponíveis
       if sFlgStatus = 'V' then begin
          sMsg := '';
          if not VerificaRateioImoveis( sMsg, iContrato ) then
             raise Exception.Create( sMsg );
       end;

       if bTransacao then Commit;
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
//------- Fim Implementação/Alteração - Marcio Motta -------------------------------
end;

function TCtrlContratoImovel.LookupContratoXDesc( const iIdContrato: Integer): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parâmetros
  sParam := '';
  if iIdContrato <> -1 then sParam := sParam + ' AND X.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);

  // Define Sql
  sSql := ' SELECT X.IDCONTRATOXDESC,               ' + #13 +
          '        X.CODALTERADOR,                  ' + #13 +
          '        X.IDCONTRATOIMOVEL,              ' + #13 +
          '        X.MOECODIGO,                     ' + #13 +
          '        X.VLRDESCONTO,                   ' + #13 +
          '        X.PERDESCONTO,                   ' + #13 +
          '        X.DATAINICIO,                    ' + #13 +
          '        X.DATAFIM,                       ' + #13 +
          '        X.OBSERVACAO,                    ' + #13 + // Daniel - 24079
          '        M.MOESIGLA,                      ' + #13 +
          '        T.DESCRICAO                      ' + #13 +
          ' FROM   CONTRATOXDESC X,                 ' + #13 +
          '        MOEDA M,                         ' + #13 +
          '        TIPOALTERADOR T                  ' + #13 +
          ' WHERE  X.MOECODIGO    = M.MOECODIGO (+) ' + #13 +
          '   AND  X.CODALTERADOR = T.CODALTERADOR  ' + #13 +
          sParam                                      +
          ' ORDER BY X.DATAINICIO, T.DESCRICAO      ' ;

  Result := GetDataPacket( sSql );
end;

procedure TCtrlContratoImovel.SetCdsContratoXDesc( const Value: TCmClientDataset );
begin
  FCdsContratoXDesc := Value;
end;

procedure TCtrlContratoImovel.SetDbContratoXDesc( const Value: TDbContratoXDesc );
begin
  FDbContratoXDesc := Value;
end;

// Daniel Simões - 9730 - Início -----------------------------------------------
function TCtrlContratoImovel.EncerraAlienacao(const iIdContrato:Integer; const dDataEncerra:TDateTime; const bTransacao:Boolean): Boolean;
var sSql, sParam: string;
begin
  Result := True;

  try
    if bTransacao then StartTransaction;

    // Define Parâmetros
    sParam := '';

    if iIdContrato <> -1 then sParam := sParam + ' WHERE IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato);

    // Efetua a atualização do status do contarto para "E" ( Encerrado ) ...
    sSql := 'UPDATE CONTRATOIMOVEL SET FLGSTATUS = ''E'', CONDATAFIM = '+
            'TO_DATE('+QuotedStr(FormatDateTime('DD/MM/YYYY',dDataEncerra))+',''DD/MM/YYYY'') '+#13+sParam;

    // Executa o Sql
    if not ExecSQL( sSql ) then
      raise Exception.Create( MessageInfo );

    if bTransacao then Commit;
  except
    on e : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := e.message;
    end;
  end;
end;
// Daniel Simões - 9730 - Fim --------------------------------------------------



procedure TCtrlContratoImovel.SetIDContratoImovel(const Value: Integer);
begin
   FIDContratoImovel := Value;
end;


procedure TCtrlContratoImovel.SetDbCondPagImovel(const Value: TDbCondPagImovel);
begin
   FDbCondPagImovel := Value;
end;



procedure TCtrlContratoImovel.SetCdsCondPagImovel(const Value: TCMClientDataSet);
begin
   FCdsCondPagImovel := Value;
end;



function TCtrlContratoImovel.LookupContratoXCondPag(const iIdContrato: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL   :=
   'SELECT'                                             + #13 +
   '    CP.*,'                                          + #13 +
   '    FC.NOME'                                        + #13 +
   'FROM'                                               + #13 +
   '    CONDPAGIMOVEL CP,'                              + #13 +
   '    FORMACALCIMOB FC'                               + #13 +
   'WHERE'                                              + #13 +
   '    FC.IDFORMACALCIMOB = CP.IDFORMACALCIMOB'        + #13;

   if iIDContrato <> -1 then
      sSQL := sSQL + 'AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iIDContrato);

   Result := GetDataPacket(sSQL);
end;


// Daniel - 23518 - Início -----------------------------------------------------
procedure TCtrlContratoImovel.SetCdsOutroDadoxImovel(const Value:TCMClientDataSet);
begin
  FCdsOutroDadoxImovel := Value;
end;

procedure TCtrlContratoImovel.SetDbOutroDadoxImovel(const Value:TDbOutroDadoxImovel);
begin
  FDbOutroDadoxImovel := Value;
end;
// Daniel - 23518 - Fim --------------------------------------------------------

{ Daniel - 24159 - Início ------------------------------------------------------
  Função que trás a quantidade total de lançamentos feitos para um determindao
  imóvel em um determinado contrato... }
function TCtrlContratoImovel.ExisteLancamento(iIdImovel,iIdContrato:Integer): Boolean;
var sSql    : String;
    cdsTemp : TCMClientDataSet;
begin
  Result  := False;
  cdsTemp := nil;

  try
    try
      cdsTemp := TCMClientDataSet.Create( nil );
      sSql    := 'SELECT COUNT(*) AS QTDE '                                   +#13+
                 'FROM LANCAMENTOSIMOVEL '                                    +#13+
                 'WHERE IDCONTRATOIMOVEL = '+QuotedStr(IntToStr(iIdContrato)) +#13+
                 '  AND IDIMOVEL = '+QuotedStr(IntToStr(iIdImovel));

      cdsTemp.Data := GetDataPacket(sSql);

      if (cdsTemp.FieldByName('QTDE').AsInteger>0) then
        Result := True;
    except
      on E : Exception do begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  finally
    cdsTemp.Free;
  end;
end;
// Daniel - 24159 - Fim --------------------------------------------------------

function TCtrlContratoImovel.LookupCondPagImovel(const iIdContrato, iCondPag: Integer): OleVariant;
var
   sSQL : String;
begin
   sSQL :=
   'SELECT'                                                                                             + #13 +
   '    FC.NOME,'                                                                                       + #13 +
   '    CI.IDCONTRATOIMOVEL,'                                                                           + #13 +
   '    CI.IDCIDADES,'                                                                                  + #13 +
   '    CI.IDPAIS,'                                                                                     + #13 +
   '    CI.CONDIASTOLERANCIA,'                                                                          + #13 +
   '    CI.CONDIASREPASSE,'                                                                             + #13 +
   '    CI.CODESTADO,'                                                                                  + #13 +
   '    CI.FLGTIPODIATOLERA,'                                                                           + #13 +
   '    CI.IDLOCATARIO,'                                                                                + #13 +
   '    CI.CODPORTFORMA,'                                                                               + #13 +
   '    CI.CONNUMERO,'                                                                                  + #13 +
   '    CI.CONNOME,'                                                                                    + #13 +
   '    CI.MOECODIGO AS MOECODIGOCORRENTE,'                                                             + #13 +
   '    CI.CONDATAINICAREN,'                                                                            + #13 +
   '    CI.CONDATACARENCIA,'                                                                            + #13 +
   '    CI.CONDATAINICIO,'                                                                              + #13 +
   '    CI.CONDATAFIM,'                                                                                 + #13 +
   '    MC.MOECODIGO,'                                                                                  + #13 +
   '    MC.MOESIGLA,'                                                                                   + #13 +
   '    NVL(PF.CODFORMA,0) AS CODFORMA,'                                                                + #13 +
   '    CP.IDCONDPAGIMOVEL,'                                                                            + #13 +
   '    CP.IDFORMACALCIMOB,'                                                                            + #13 +
   '    CP.VLRFINANC,'                                                                                  + #13 +
   '    CP.DATAINI,'                                                                                    + #13 +
   '    CP.PRAZO,'                                                                                      + #13 +
   '    CP.PERIODO,'                                                                                    + #13 +
   '    CP.TAXAJUROS,'                                                                                  + #13 +
   '    CP.PERIODOTAXA,'                                                                                + #13 +
   '    CP.NUMPARCELAS,'                                                                                + #13 +
   '    CP.DATAFIM,'                                                                                    + #13 +
   '    CP.DATAVENCIMENTO,'                                                                             + #13 +
   '    TO_CHAR(CP.DATAVENCIMENTO,''DD'') AS DIAVENCIMENTO,'                                            + #13 +
   '    CP.TIPOCONDPAG,'                                                                                + #13 +
   '    CP.MESREFREAJUSTE,'                                                                             + #13 +
   '    CP.DATACARENCIA,'                                                                               + #13 +
   '    CP.DATAINIAMORTIZ,'                                                                             + #13 +
   '    CP.PERIODOREAJUSTE,'                                                                            + #13 +
   '    CP.INDCORRECAO,'                                                                                + #13 +
   '    CP.PERINDPROJ'                                                                                  + #13 +
   'FROM'                                                                                               + #13 +
   '    CONDPAGIMOVEL CP,'                                                                              + #13 +
   '    CONTRATOIMOVEL CI,'                                                                             + #13 +
   '    MOEDA MC,'                                                                                      + #13 +
   '    PORTADORFORMA PF,'                                                                              + #13 +
   '    FORMACALCIMOB FC'                                                                               + #13 +
   'WHERE'                                                                                              + #13 +
   '    CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL'                                                      + #13 +
   'AND MC.MOECODIGO(+)     = CP.INDCORRECAO'                                                           + #13 +
   'AND CI.CODPORTFORMA     = PF.CODPORTFORMA(+)'                                                       + #13 +
   'AND FC.IDFORMACALCIMOB  = CP.IDFORMACALCIMOB'                                                       + #13 +
   'AND CI.FLGTIPOCONTRATO  = ''D'''                                                                    + #13;

   if iIdContrato  <> -1 then sSQL := sSQL + 'AND CP.IDCONTRATOIMOVEL = ' + IntToStr(iIdContrato)       + #13;

   if iCondPag   <> -1 then sSQL := sSQL + 'AND CP.IDCONDPAGIMOVEL  = ' + IntToStr(iCondPag)            + #13;

   Result := GetDataPacket(sSQL);
end;

procedure TCtrlContratoImovel.SetCdsDescCondicional(const Value: TCMClientDataSet);
begin
   FCdsDescCondicional := Value;
end;


//MARCELO ALMEIDA - SOL 137256 - KTN 828397
function TCtrlContratoImovel.LookupHistoricoPagamentosEncargos(
  const idContratoImovel: Integer; AAnoInicio : Integer; AAnoFim : Integer; AIdImovel : String; AImoNome : String; AIdEncargo : Integer; AIdSituacao : Integer): OleVariant;
var
  sqlHISTPAGENCIMOV : TStrings;
begin
  sqlHISTPAGENCIMOV := TStringList.Create;
  try
    sqlHISTPAGENCIMOV.Clear;
    with sqlHISTPAGENCIMOV do
    begin
      Add('SELECT IM.IMONOME AS DSC_MESTRE,');
      Add('       I.IMOCODIGO,');
      Add('       I.IMONOME,');
      Add('       HPEI.ANO,');
      Add('       EIV.DESCENCARGO,');
      Add('       SPAM.DESCSITUACAO,');
      Add('       HPEI.IDENCARGO,');
      Add('       HPEI.IDSITUACAO,');
      Add('       CI.CIMDTINI,');
      Add('       CI.CIMDTFIM,');
      Add('       HPEI.IDIMOVEL');
      Add('  FROM CONTRATOXIMOVEL CI');
      Add(' INNER JOIN HISTPAGENCIMOV HPEI');
      Add('    ON (HPEI.IDIMOVEL = CI.IDIMOVEL)');
      Add(' INNER JOIN ENCARGOIMOV EIV');
      Add('    ON (EIV.IDENCARGO = HPEI.IDENCARGO)');
      Add(' INNER JOIN SITPAGENCIMOV SPAM');
      Add('    ON (SPAM.IDSITUACAO = HPEI.IDSITUACAO)');
      Add(' INNER JOIN IMOVEL I');
      Add('    ON (I.IDIMOVEL = HPEI.IDIMOVEL)');
      Add(' INNER JOIN IMOVEL IM');
      Add('    ON (IM.IDIMOVEL = I.IDIMOVELMESTRE)');
      Add(' WHERE CI.IDCONTRATOIMOVEL = '+IntToStr(idContratoImovel));

      if (AIdImovel <> EmptyStr) then
      begin
        Add('   AND I.IMOCODIGO = '+QuotedStr(AIdImovel));
      end;

      if (((AAnoInicio <> -1) and (AAnoFim <> -1)) and (AAnoInicio <= AAnoFim)) then
      begin
        Add('   AND HPEI.ANO BETWEEN '+IntToStr(AAnoInicio)+' AND '+IntToStr(AAnoFim));
      end;

      if (Trim(AImoNome) <> EmptyStr) then
      begin
        Add('   AND UPPER(I.IMONOME) LIKE '+QuotedStr('%'+UpperCase(AImoNome)+'%'));
      end;

      if (AIdEncargo <> -1) then
      begin
        Add('   AND HPEI.IDENCARGO = '+IntToStr(AIdEncargo));
      end;

      if (AIdSituacao <> -1) then
      begin
        Add('   AND HPEI.IDSITUACAO = '+IntToStr(AIdSituacao));
      end;
    end;
    Result := GetDataPacket(sqlHISTPAGENCIMOV.GetText);
  finally
    FreeAndNil(sqlHISTPAGENCIMOV);
  end;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
procedure TCtrlContratoImovel.SetCdsHistpagencimov(
  const Value: TCMClientDataSet);
begin
  FCdsHistpagencimov := Value;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
procedure TCtrlContratoImovel.SetDbHistpagencimov(
  const Value: TDbHistpagencimov);
begin
  FDbHistpagencimov := Value;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
function TCtrlContratoImovel.LookupTiposEncargos: OleVariant;
var
  sqlENCARGOIMOV : TStrings;
begin
  sqlENCARGOIMOV := TStringList.Create;
  try
    sqlENCARGOIMOV.Clear;
    with sqlENCARGOIMOV do
    begin
      Add('SELECT EI.IDENCARGO,');
      Add('       EI.DESCENCARGO');
      Add('  FROM ENCARGOIMOV EI');
    end;
    Result := GetDataPacket(sqlENCARGOIMOV.GetText);
  finally
    FreeAndNil(sqlENCARGOIMOV);
  end;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397

//MARCELO ALMEIDA - SOL 137256 - KTN 828397
function TCtrlContratoImovel.LookupSituacaoPagamentoEncargos: OleVariant;
var
  sqlSITPAGENCIMOV : TStrings;
begin
  sqlSITPAGENCIMOV := TStringList.Create;
  try
    sqlSITPAGENCIMOV.Clear;
    with sqlSITPAGENCIMOV do
    begin
      Add('SELECT SPI.IDSITUACAO,');
      Add('       SPI.DESCSITUACAO');
      Add('  FROM SITPAGENCIMOV SPI');
    end;
    Result := GetDataPacket(sqlSITPAGENCIMOV.GetText);
  finally
    FreeAndNil(sqlSITPAGENCIMOV);
  end;
end;
//MARCELO ALMEIDA - SOL 137256 - KTN 828397


function TCtrlContratoImovel.LookupConfissaoDivida(const iIdContrato: Integer): OleVariant;
var
  Ssql : TStrings;
begin
  //Helen - SOL: 136341 Kintana : 815095
  Ssql := TStringList.Create;
  try
    Ssql.Clear;
    with Ssql do
    begin
       Add('SELECT C.DATACONFISSAO  , ');
       Add('     C.IDCONFISSAODIVIDA, ');
       Add(' C.IDCONTRATOIMOVEL ,');
       Add(' C.MESCONFISSAO,   ');
       Add(' C.ANOCONFISSAO ,  ');
       Add(' C.CONDRESULTANTES ,');
       Add(' C.VLRSALDO   ,  ');
       Add(' C.IDMODULO  ,   ');
       Add(' C.PLNCODIGO_OPER  ');
       Add(' FROM CONFISSAODIVIDA C  ');
       Add('   WHERE C.IDCONTRATOIMOVEL = '+ IntToStr(iIdContrato) +' ');
       Add('   UNION ALL  ');
       Add('   SELECT NULL,0, 0,0,0,0,0,0,0 FROM DUAL ');
       Add('    ORDER BY IDCONFISSAODIVIDA');
      
    end;
    Result := GetDataPacket(Ssql.GetText);
  finally
    FreeAndNil(Ssql);
  end;
end;

function TCtrlContratoImovel.LookupParcelasConfissaoDivida(iIdContrato,iIdConfissao: Integer): OleVariant;
var
  Ssql : TStrings;
begin
  //Helen - SOL: 136341 Kintana : 815095
  Ssql := TStringList.Create;
  try
    Ssql.Clear;
    with Ssql do
    begin
        Add(' SELECT   ');
        Add('    DD.CODDOCUMENTO, DD.DATAVENCIMENTO , APROP.VALOR, ');
        Add('    NVL(JUROS.JUR,0) AS JUR , NVL(MULTA.MUL,0) AS MUL ,');
        Add('    NVL(CORRECAO.COR,0)AS COR,                         ');
        Add('   (TO_NUMBER(DD.TOT_RECEBER) - TO_NUMBER(DD.RECEBIDO)) AS SALDO,');
        Add('    DD.TOT_RECEBER , DD.RECEBIDO,   NVL(ALTERADOR.ALT,0) AS ALT, ');
        Add('    CD.IDCONFISSAODIVIDA ');
        Add(' FROM CONTRATOIMOVEL C ,CONFISSAOXDOCUMENTO CD , ');
        Add(' (SELECT CODDOCUMENTO, SUM(VALOR) AS  VALOR ');
        Add('  FROM LANCTODOCUM ');
        Add('  WHERE  OPERACAO = 2 ');
        Add('  GROUP BY CODDOCUMENTO) APROP, ');
        Add(' (SELECT CODDOCUMENTO, SUM(VALOR) AS COR ');
        Add('  FROM LANCTODOCUM , TIPOIMOVEL T   ');
        Add('  WHERE  CODALTERADOR = T.CODALTCORRMON ');
        Add('  GROUP BY CODDOCUMENTO) CORRECAO,      ');
        Add(' (SELECT CODDOCUMENTO, SUM(VALOR) AS MUL ');
        Add('  FROM LANCTODOCUM , TIPOIMOVEL T        ');
        Add('  WHERE  CODALTERADOR = T.CODALTMULTA    ');
        Add('  GROUP BY CODDOCUMENTO) MULTA,          ');
        Add(' (SELECT CODDOCUMENTO, SUM(VALOR) AS JUR ');
        Add('  FROM LANCTODOCUM , TIPOIMOVEL T        ');
        Add('  WHERE  CODALTERADOR = T.CODALTJUROS    ');
        Add('  GROUP BY CODDOCUMENTO) JUROS,          ');
        Add(' (SELECT CODDOCUMENTO, SUM(VALOR) AS ALT ');
        Add('  FROM LANCTODOCUM                       ');
        Add('  WHERE  OPERACAO = 4 AND PLNCODIGO > 0  ');
        Add('  GROUP BY CODDOCUMENTO) ALTERADOR,      ');
        Add(' (SELECT                                 ');
        Add('       LI.CODDOCUMENTO,      LI.IDCONTRATOIMOVEL, ');
        Add('       LI.DATAVENCIMENTO,    LI.DATALIMITE,       ');
        Add('       LI.CODTIPIMOVEL,      LI.IDTIPOCUSTORECIMO , ');
        Add('       SUM(                                         ');
        Add('           DECODE(RTRIM(LD.OPERACAO),  ''1'', DECODE(D.RECPAG, ''R'',DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ');
        Add('           DECODE(RTRIM(LD.OPERACAO),  ''2'', DECODE(D.RECPAG, ''R'',DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ');
        Add('           DECODE(RTRIM(LD.OPERACAO),  ''3'', DECODE(D.RECPAG, ''R'',DECODE(LD.DEBCRE, ''D'', LI.VLRLANCRECEB, LI.VLRLANCRECEB * (-1)), 0), 0) + ');
        Add('           DECODE(RTRIM(LD.OPERACAO),  ''4'', DECODE(D.RECPAG, ''R'',DECODE(LD.DEBCRE, ''D'', LD.VALOR * LI.VLRLANCRECEB / TRD.VALOR, LD.VALOR * (-1) ');
        Add('  * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)           ');
        Add('       ) AS TOT_RECEBER,                           ');
        Add('       NVL(SUM(                                    ');
        Add('         DECODE(RTRIM(LD.OPERACAO), ''5'', DECODE(D.RECPAG, ''R'', LD.VALOR, 0), 0)  ');
        Add(' * LI.VLRLANCRECEB / TRD.VALOR                                                       ');
        Add('         ),0) AS RECEBIDO                                                            ');
        Add('     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIPOIMOVEL T,CONTRATOIMOVEL C,');
        Add('          (SELECT CODDOCUMENTO, DECODE(VALOR, 0, 1, VALOR) AS VALOR  ');
        Add('             FROM LANCTODOCUM                                        ');
        Add('            WHERE RTRIM(OPERACAO) = ''1'' OR                         ');
        Add('                  RTRIM(OPERACAO) = ''2'' OR                         ');
        Add('                  RTRIM(OPERACAO) = ''3'') TRD                       ');
        Add('    WHERE                                                            ');
        Add('          ( D.RECPAG = ''R'')                                        ');
        Add('      AND ( C.FLGTIPOCONTRATO IN (''L'',''D'') OR LI.IDCONTRATOIMOVEL IS NULL ) ');
        Add('      AND ( LD.ESTORNO IS NULL )                                                ');
        Add('      AND ( LI.FLGESTORNADO IS NULL )                                           ');
        Add('      AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )                                  ');
        Add('      AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )                                 ');
        Add('      AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )                                ');
        Add('      AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )                                  ');
        Add('      AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )                       ');
        Add(' GROUP BY  LI.CODDOCUMENTO,  LI.IDCONTRATOIMOVEL,LI.DATAVENCIMENTO,             ');
        Add('       LI.DATALIMITE, LI.CODTIPIMOVEL,  LI.IDTIPOCUSTORECIMO                    ');
        Add('       ) DD                                                                     ');
        Add(' WHERE  ( C.IDCONTRATOIMOVEL = '+ IntToStr(iIdContrato) +' )');
        Add('    AND ( C.IDCONTRATOIMOVEL(+)  = DD.IDCONTRATOIMOVEL )                        ');
        Add('    AND DD.CODDOCUMENTO = CORRECAO.CODDOCUMENTO(+)                              ');
        Add('    AND DD.CODDOCUMENTO =  MULTA.CODDOCUMENTO(+)                                ');
        Add('    AND DD.CODDOCUMENTO = JUROS.CODDOCUMENTO(+)                                 ');
        Add('    AND DD.CODDOCUMENTO = APROP.CODDOCUMENTO(+)                                 ');
        Add('    AND DD.CODDOCUMENTO = ALTERADOR.CODDOCUMENTO(+)                             ');
        Add('    AND DD.CODDOCUMENTO = CD.CODDOCUMENTO                                       ');
        Add('    AND CD.TIPO = 1                                                             ');
        Add('    AND CD.IDCONFISSAODIVIDA = '+ IntToStr(iIdConfissao) +' ');
        Add(' GROUP BY DD.CODDOCUMENTO, CORRECAO.COR, MULTA.MUL ,JUROS.JUR ,APROP.VALOR,     ');
        Add('    DD.TOT_RECEBER,   DD.RECEBIDO ,   DD.DATAVENCIMENTO ,                       ');
        Add('    ALTERADOR.ALT,CD.IDCONFISSAODIVIDA                                          ');
        Add('                                                      ');
        Add('UNION                                                                           ');
        Add(' SELECT   LI.NODOCUMENTO AS CODDOCUMENTO, LI.DATAVENCIMENTO , SUM(LI.VLRLANCRECEB) AS VALOR,');
        Add(' NVL(LI.VLRJUROS,0) AS JUR ,  NVL(LI.VLRMULTA,0) AS MUL , (0) AS COR, SUM(LI.VLRLANCRECEB)  AS SALDO,');
        Add(' SUM(LI.VLRLANCRECEB) AS TOT_RECEBER , (0) AS SALDO ,   (0) AS ALT, CD.IDCONFISSAODIVIDA ');
        Add(' FROM LANCAMENTOSIMOVEL LI , CONTRATOIMOVEL C ,CONFISSAOXDOCUMENTO CD ');
        Add(' WHERE     LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ');
        Add(' AND  LI.NODOCUMENTO = CD.CODDOCUMENTO ');
        Add(' AND  LI.CODDOCUMENTO IS NULL  ');
        Add(' AND  CD.TIPO = 1 ');
        Add(' AND  CD.IDCONFISSAODIVIDA = '+ IntToStr(iIdConfissao) +' ');
        Add(' GROUP BY LI.NODOCUMENTO  ,LI.DATAVENCIMENTO,LI.VLRJUROS,LI.VLRMULTA,CD.IDCONFISSAODIVIDA');
        Add(' ORDER BY DATAVENCIMENTO  ');
    end;
    Result := GetDataPacket(Ssql.GetText);
  finally
    FreeAndNil(Ssql);
  end;
end;

//SIG26726 - Marcelo Cardoso - INICIO
procedure TCtrlContratoImovel.VerificaSaldoAberto(var sSaldoReceber,  sSaldoPagar: Double; iIdContrato: Integer);
var
   _CdsAux : TCMClientDataSet;
begin

   _CdsAux := TCMClientDataSet.Create(nil);

   try
      _CdsAux.Data := GetDataPacket( 'SELECT DECODE(RECPAG, ''R'', (SOMADEBITO - SOMACREDITO), 0) SALDORECEBER,' + #13#10 +
                                     '       DECODE(RECPAG, ''P'', (SOMACREDITO - SOMADEBITO), 0) SALDOPAGAR' + #13#10 +
                                     '  FROM (SELECT SUM(DECODE(LD.DEBCRE, ''C'', LD.VALOR, 0)) SOMACREDITO,' + #13#10 +
                                     '               SUM(DECODE(LD.DEBCRE, ''D'', LD.VALOR, 0)) SOMADEBITO,' + #13#10 +
                                     '               T.RECPAG' + #13#10 +
                                     '          FROM LANCTODOCUM LD,' + #13#10 +
                                     '               (SELECT D.CODDOCUMENTO, D.RECPAG' + #13#10 +
                                     '                  FROM DOCUMENTO D' + #13#10 +
                                     '                 WHERE D.CODDOCUMENTO IN' + #13#10 +
                                     '                       (SELECT LI.CODDOCUMENTO' + #13#10 +
                                     '                          FROM LANCAMENTOSIMOVEL LI' + #13#10 +
                                     '                         WHERE LI.IDCONTRATOIMOVEL = '+ IntToStr(iIdContrato) +' )' + #13#10 +
                                     '                   AND D.STATUS <> 2) T' + #13#10 +
                                     '         WHERE LD.CODDOCUMENTO = T.CODDOCUMENTO' + #13#10 +
                                     '         GROUP BY RECPAG) V');

      sSaldoReceber := _CdsAux.FieldByName('SALDORECEBER').asFloat ;
      sSaldoPagar   := _CdsAux.FieldByName('SALDOPAGAR').asFloat ;
   finally
      FreeAndNil(_CdsAux);
   end;

end;
//SIG26726 - Marcelo Cardoso - FIM
end.
