
// Alterações:
{
--------------------------------------------------------------------------------
N. Sol......: 245933
PPM.........: 706854
Data........: 13/03/2015
Responsável.: Petri Nocentini
Descrição...: Retirado o filtro de idplanoorcamen da rotina GetConta_SaldoOrcado
--------------------------------------------------------------------------------
N. Sol......: 246363
PPM.........: 634905
Data........: 15/01/2015
Responsável.: Fernando Xavier
Descrição...: Mesmo com saldo disponível, o sistema afirma que não tem saldo disponível.
--------------------------------------------------------------------------------
N. Sol......: 245727
PPM.........: 624627
Data........: 02/01/2015
Responsável.: Fernando Xavier
Descrição...: Não está sendo possível realizar lançamentos 2014 após a alteração
              na parametrização predominante para 2015
--------------------------------------------------------------------------------
N. Sol......: 190485
PPM.........: 1929913
Data........: 11/09/2014
Responsável.: Felipe A. Santos
Descrição...: sobrecarga na rotina DiasNoPeriodo passando tambem o período fim.
              para atender o relatório de orçado x realizado por conta.
--------------------------------------------------------------------------------
N. Sol......: 237792
PPM.........: 494258
Data........: 25/08/2014
Responsável.: Thiago Melo
Descrição...: Ao realizar o lançamento a verificação está buscando contas
orçamentárias comuns (final 1) e especificas (final 2), não direcionando o
lançamento para a conta correta
--------------------------------------------------------------------------------
N. Sol......: 227975.16197
PPM.........: 430656
Data........: 26/06/2014
Responsável.: Thiago Melo
Descrição...: Manter estados das contas ao realizar alteração no rateio
--------------------------------------------------------------------------------
N. Sol......: 227975
N. Kintana..: 2061959
Data........: 06/06/2014
Responsável.: Thiago Melo
Descrição...: Ajustar a montagem da conta orçamentária para verificar saldo
--------------------------------------------------------------------------------
Nº SOL......: 230863 e 230956
Nº PPM......: 374049 e 362016
Data........: 21/01/2014
Responsável.: Fernando Xavier
Descrição...: FDO
--------------------------------------------------------------------------------
Nº SOL......: 229349
Nº KINTANA..: 2063459
Data........: 01/04/2014
Responsável.: Fernando Xavier
Descrição...: Ao alterar o valor do documento 2805 o sistema esta tentando
              alterar um centro de custo.
--------------------------------------------------------------------------------
Nº SOL......: 224456
Nº KINTANA..: 2057928
Data........: 21/01/2014
Responsável.: Thiago Melo
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 223059
Nº KINTANA..: 2056404
Data........: 27/12/2013
Responsável.: //MARCIO SANCHES SPINOSA SOL 223059 KINTANA 2056404
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 222959
Nº KINTANA..: 2056456
Data........: 24/12/2013
Responsável.: Felipe A. Santos
Descrição...: Correção da DATAEMISSAO na rotina do FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 222761
Nº KINTANA..: 2056148
Data........: 20/12/2013
Responsável.: //MARCIO SANCHES SPINOSA SOL 222761 KINTANA 2056148
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 222646/15537
Nº KINTANA..: 2055923
Data........: 18/12/2013
Responsável.: Felipe A. Santos
Descrição...: Retirado o filtro de idplanoorcamen da rotina ListaSubDespesa.
--------------------------------------------------------------------------------------------------
Nº SOL......: 199983
Nº KINTANA..: 1967697
Data........: 28/08/2013
Responsável.: William Santana
Descrição...: Tratamento de mensagens na verificação de FDO.
--------------------------------------------------------------------------------------------------
Nº SOL......: 220237/15422
Nº KINTANA..: 2053040
Data........: 21/11/2013
Responsável.: MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 220237
Nº KINTANA..: 2052443
Data........: 14/11/2013
Responsável.: MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
Descrição...: FDO
--------------------------------------------------------------------------------------------------
Nº SOL......: 217591
Nº KINTANA..: 2048632
Data........: 27/09/2013
Responsável.: MARCIO SANCHES SPINOSA SOL 217591 KINTANA 2048632
Descrição...: ListaSubDespesas
--------------------------------------------------------------------------------------------------
Nº SOL......: 217428
Nº KINTANA..: 2047290
Data........: 27/09/2013
Responsável.: MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290
Descrição...: MovimentaValor
--------------------------------------------------------------------------------------------------
Nº SOL......: 215854
Nº KINTANA..: 2044932
Data........: 10/09/2013
Responsável.: Thiago Melo
Descrição...: Erro nao encontra conta orcamentaria ao alterar rateio
--------------------------------------------------------------------------------------------------
Nº SOL......: 203547
Nº KINTANA..: 1970091
Data........: 03/04/2013
Responsável.: Thiago Melo
Descrição...: Atualizar FDO ao alterar rateio
--------------------------------------------------------------------------------------------------
Nº SOL......: 210712
Nº KINTANA..: 2029487
Data........: 05/07/2013
Responsável.: //MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487
Descrição...: FDO, inserido no select o campo IDDESPESAORC para utilizar no movimentavalor
--------------------------------------------------------------------------------------------------
Nº SOL......: 210052
Nº KINTANA..: 2025028
Data........: 24/05/2013
Responsável.: Marcio Sanches Spinosa SOL 210052 KTN 2025028
Descrição...: GetConta_SaldoOrcado
--------------------------------------------------------------------------------------------------
Nº SOL......: 207849
Nº KINTANA..: 2007851
Data........: 22/05/2013
Responsável.: William Moreira da Silva
Descrição...: Retirado a implementação do SOL 202922.
--------------------------------------------------------------------------------------------------
Nº SOL......: 206429
Nº KINTANA..: 1999836
Data........: 10/05/2013
Responsável.: Marcio Sanches Spinosa SOL 206429 KTN 1999836
Descrição...: MovimentaValor
--------------------------------------------------------------------------------------------------
 Rotina......: Criada a Rotina diferencaRateio e alterada a rotina FDO_AP
 Nº SOL......: 202922
 Nº KINTANA..: 1966556
 Data........: 26/03/2013
 Responsável.: Thiago Melo
 Descrição...: Mensagem de que nao há saldo orçado para o lançamento quando altera o documento,
               sem alterar o rateio
--------------------------------------------------------------------------------------------------
 Rotina......: GetConta_SaldoOrcado
 Nº SOL......: 200875
 Nº KINTANA..: 1942499
 Data........: 19/02/2013
 Responsável.: Felipe Azevedo dos Santos
 Descrição...: Erro ao Trazer as contas orçamentarias
--------------------------------------------------------------------------------------------------
 Rotina......: FDO_SetCDS e ListaRateio
 Nº SOL......: 200328 e 200387
 Nº KINTANA..: 1930483 e 1931060
 Data........: 06/02/2013
 Responsável.: Fernando Xavier
 Descrição...: Criação de parametros de envio
--------------------------------------------------------------------------------------------------
 Rotina......: Ajuste no getSaldoOrçado
 Nº SOL......: 200117
 Nº KINTANA..: 1928539
 Data........: 04/02/2013
 Responsável.: Marcio Sanches Spinosa
 Descrição...: alteração nos parametros de envio
--------------------------------------------------------------------------------------------------
 Rotina......: FDO_Valida
 Nº SOL......: 195755
 Nº KINTANA..: 1871968
 Data........: 04/12/2012
 Responsável.: Edilaine Ferraresi
 Descrição...: verifica se o cds referente a sub-despesa está aberto
--------------------------------------------------------------------------------------------------
 Nº SOL......: 172384/9603
 Nº KINTANA..: 1661662
 Data........: 25/06/2012
 Responsável.: Vander Campos
 Descrição...: Integração Orçamento - Inclusão das rotinas

--------------------------------------------------------------------------------------------------
 Rotina......: VerificaSaldoProcesso
 Nº SOL......: 151865
 Nº KINTANA..: 1121572
 Data........: 01/02/2011
 Responsável.: Brunno Mattos
 Descrição...: Incremento das querys para contemplar o período ANUAL.
 --------------------------------------------------------------------------------------------------
 Rotina    : CriaCompromisso
 Data      : 16/09/2004
 Autor     : André Tavares
 Pendencia : 16738
 Descrição : Criado um semáforo para que usuários concorrentes não gerem o mesmo número de compromisso.
--------------------------------------------------------------------------------------------------
Rotina    : BuscaContaOrcamen
Data      : 09/10/2003
Autor     : André Pontes
Pendencia : 14005
Descrição : Retirada a obrigatoriedade da forma de cálculo do Orçado ser Fluxo de Caixa ('X') para
            registro de reservas e compromissos
---------------------------------------------------------------------------------------------------}

// Marchetti - Pendencia 15659
// Várias rotinas implementadas para solução da pendência
// FMTSoliCompra, UCtrlOrcamento, uCtrlCotacao


unit UCtrlOrcamento;

{------------------------------------------------------------------------------}
{                                                                              }
{ Funções de Integração do Orçamento com outros Sistemas                       }
{                                                                              }
{------------------------------------------------------------------------------}

interface

uses
  Windows, SysUtils, Forms, wwQuery, uMensErro, Dialogs, uMidasUtil, uDatabase,
  uAutorizacao, dbclient, uFuncoesOrcamento, uCmControlObject, uCtrlReservaorcamen,
  uCtrlSaldoorcado, uCtrlResxcomp, dBaseDados, uCMTypes, uSistema, uCMMath,
  //uDbRateiodocum,
  Classes, ucmfileutils,
  Contnrs;


Type
  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  TOrigemParamAP   = (opapDesembolso, opapAlterador);
  TFDOOption       = (fdoBaixa, fdoEstornoBaixa, fdoEstornoAP);

  EOrcamentoBackMT               = Class(Exception);
  EProcessoFDO                   = Class(EOrcamentoBackMT)
  Private
    FOrigemParamAP : TOrigemParamAP;
    FCodOrigem     : String;
  Public
    Property Origem    : TOrigemParamAP Read FOrigemParamAP;
    Property CodOrigem : String         Read FCodOrigem;
    //
    Constructor Erro(AOrigemAP : TOrigemParamAP; ACodOrigem : String; AErro : String); Overload;
    Constructor Erro(AOrigemAP : TOrigemParamAP; ANomeOrigem , ANomecentrocusto, AErro : String);Overload;  //William Santana SOL 199983 KIN 1967697
    //
    Procedure BuscaInfoCodOrigem(ACDS : TClientDataSet; AFieldCod : String; AFieldDesc : String = 'DESCRICAO');

  End;

  EProcessoFDO_SaldoInsuficiente = Class(EProcessoFDO)
  Private
    Function GetMessage : String;
  Public
    Constructor Erro;Overload;
    Constructor Erro(AOrigemAP : TOrigemParamAP; ACodOrigem : String);Overload;
  End;

  EProcessoFDO_Parametrizacao      = Class(EProcessoFDO)
  Public
    Constructor Erro(AOrigemAP : TOrigemParamAP; ACodOrigem : String);Overload;
  End;
  EProcessoFDO_GetContaSaldoOrcado = Class(EProcessoFDO_Parametrizacao);
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662


  TOrcamentoBackMT = Class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; override;
    procedure AfterInitialize; override;
    procedure OnCreateAppServer;override;
  Private

    FIdEmpresa,
    FIdUsuario,
    FNumReserva,
    FIdReserva        : Integer;
    FValorReserva     : Real;
    FCdsPeriodo       : TClientDataSet;
    FCdsUsuXCentCusto : TClientDataSet;
    FCdsCompromissos  : TClientDataSet;
    FCdsSaldos        : TClientDataSet;
    FCdsAux           : TClientDataSet;
    FCdsResComp       : TClientDataSet;
    FCdsReservas      : TClientDataSet;
    FCdsSaldoProcesso : TClientDataSet;
    FCdsBuscaConta    : TClientDataSet;
    CReservaOrcamen   : TCtrlReservaorcamen;
    CSaldoOrcado      : TCtrlSaldoorcado;
    CResxComp         : TCtrlResxcomp;
    //William Santana SOL 199983 KIN 1967697
    FNomeCentCust    : String;
    FDescDesembolso  : String;
    FCdsTrataErroFDO : TClientDataSet;
    //END - William Santana SOL 199983 KIN 1967697

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    FCdsFDORateio     : TClientDataSet;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

    fOperacao         : String; // SOL 230863 e 230956 PPM 374049 e 362016

    procedure SetCdsPeriodo(const Value: TClientDataSet);
    procedure SetCdsUsuXCentCusto(const Value: TClientDataSet);
    procedure SetCdsCompromissos(const Value: TClientDataSet);
    procedure SetCdsSaldos(const Value: TClientDataSet);
    procedure SetCdsAux(const Value: TClientDataSet);
    procedure SetCdsResComp(const Value: TClientDataSet);
    procedure SetCdsReservas(const Value: TClientDataSet);
    procedure SetCdsSaldoProcesso(const Value: TClientDataSet);
    procedure SetCdsBuscaConta(const Value: TClientDataSet);


    // INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    // Retorna o DataSet com o registro da Saldo Orçado a ser atualizado
    function GetConta_SaldoOrcado(AFornecedor      : Double;
                                  AData            : TDateTime;
                                  AOrigemParam     : TOrigemParamAP;
                                  AIDOrigemParam   : Double; // ID da tabela de relacionamento
                                  ACodOrigem       : String; // Cod do Alterador/Desembolso
                                  ACODCENTROCUSTO  : String;
                                  AAtividade,                //Unidade de negócio
                                  APlanoPrevidenciario,
                                  APatrocinadora   : Integer;
                                  AProgramaOrcamen : Integer;
                                  ASubDespesa      : Integer = -1; //IDDespesaOrd
                                  ATipoDespesa     : Integer = 0 ) : TClientDataSet;//Overload;




    Procedure FDO_AP(AValor          : Double;
                     ADataLancto     : TDateTime;
                     ACDS            : TClientDataSet;
                     Var Compromisso : Integer;
					// William Santana SOL 199983 KIN 1967697
                      AOrigemParam        : TOrigemParamAP;
                      ACodOrigem          : String;
                      ACODCENTROCUSTO     : String;
                      // END - William Santana SOL 199983 KIN 1967697
                     AObservacao     : String = '';
                     cdsRateio       : TClientDataSet = nil // Thiago Melo SOL 203547 Kintana 1970091
                     );



    Function  VerificaObrigaFDO    (ACDS    : TClientDataSet) : Boolean;
    Function  VerificaSaldoOrcado  (AValor  : Double; ACDS : TClientDataSet) : Boolean;
    Procedure CriaCompromisso      (AValor  : Double; ADataLancto : TDateTime; ACDS : TClientDataSet; Var Compromisso : Integer; AObservacao : String = '');Overload;

    Procedure AtualizaSaldoOrcado  (AValor  : Double;
                                    ACDS    : TClientDataSet;
                                    // Thiago Melo SOL 215854 Kintana 2044932
                                    incVlr  : Boolean = True;
                                    DecVlr  : Boolean = False);
                                    // Thiago Melo SOL 215854 Kintana 2044932
    //
    Procedure FDO_Alteradores      (var AValor             : Double;         // Valor a ser atualizado
                                        ACdsAlteradores    : TClientDataSet; // Cds do Alterador
                                        ACdsRateio         : TClientDataSet;
                                        //ACdsAlteradoresOUT : TClientDataSet; // Alteradores que possuem conta diferente do rateio
                                        AForcaAlterarValor : Boolean = False
                                    );
    Function GetFLGOBRIGARESERVA(AOrigem : TOrigemParamAP; ACodOrigem : String) : String;
    Function GetSql_Parametrizacao(AOrigem         : TOrigemParamAP;
                                   ACodOrigem      : String = '';
                                   ACodCentroCusto : String = '';
                                   AIdPlanoPrev : String = '' // SOL 229349 Kintana 2063459
                                  ) : String;Overload;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  Public
    Constructor Create; override;
    Destructor Destroy; override;
    function MarcaReserva(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function EstornaReserva(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function CancelaReserva(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function CriaCompromisso(sData:String; rValor:extended; sObs:String;
      iModulo:Integer; iConjuntoReservas:array of Integer; bExibeMsg,
      bVeioCompra : boolean):Integer;Overload;
    function EfetivaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):Integer;
    function VerificaCompromisso(iNumReserva:longint; rValor: extended; bExibeMsg: boolean):Integer;
    function EstornaCompromisso(iNumReserva:longint; rValor:extended; bExibeMsg: boolean):Integer;
    function CancelaCompromisso(iNumReserva:longint; bExibeMsg: boolean):Integer;
    function EncontraPeriodo( sData : String ) : Integer;

    function DiasNoPeriodo(iExercicio, iPeriodo:Integer):Integer; overload;
    function DiasNoPeriodo(iExercicio, iPeriodoIni, iPeriodoFim :Integer):Integer; overload;

    function VerificaDotacao(sCentroRespon:String):boolean;
    function VerificaDatas (dDataIni, dDataFim : TDateTime):boolean;
    function PrimeiroDiaPeriodo(iExercicio, iPeriodo:Integer):String;

    function UltimoDiaPeriodo(iExercicio, iPeriodo, iIdEmpresa:Integer):String;

    // Retorna o CODCENTRESPON
    function BuscaCentRespon(const idReserva      : Integer;
                             const NumReserva     : Integer;
                             const bMostraMsg     : Boolean
                             ):String;

    function BuscaIdNumReserva(const idReserva      : Integer;
                               const NumReserva     : Integer;
                               const bMostraMsg     : Boolean
                              ):Integer;

    function VerificaSaldoProcesso(iPlanoOrc:Integer; sContaOrcamen: String;
      iExercicio, iPeriodo:Integer; rValor:extended;
      bMostraMsg:Boolean):boolean;

    function VerificaContaAtiva(iPlanoOrc: Integer;
      sContaOrcamen: String):boolean;

    function BuscaContaReservaCompromisso(NumResOUComp:double): string;


   function  BuscaContaOrcamen(const iPlanoOrc           : Integer;
                               const sContaOrcamen       : String;
                               const bMostraMsg          : Boolean;
                               const bProcesso           : Boolean;
                               var   sNomeConta          : String;
                               var   sCodCentroRespon    : String;
                               var   sNomeCentroRespon   : String;
                               var   sCodGrupo           : String;
                               var   sNomeGrupo          : String;
                               var   sUnid               : String;
                               var   sPPrev              : String;
                               var   sCCusto             : String;
                               var   sPatro              : String
                              ): Integer;

    function ExibeSaldo(iPlanoOrc: Integer; sContaOrcamen, sData,
      sTipoSaldo: String): double;

    function VerificaSaldo(iPlano   : Integer;
                           sConta   : String;
                           sData    : String
                          ): Boolean;

    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    {function ListaSubDespesas(AEmpresa        : Integer;
                              ATipoDesembolso : String;
                              AFornecedor     : Double): OleVariant;Overload;}
    function ListaSubDespesas(AOrigemParam    : TOrigemParamAP;
                              AIDOrigemParam  : String;
                              AFornecedor     : Double  = 0;
                              ACodCentroCusto : String  = '';
                              AEmpresa        : Integer = 0;
                              ATipoDespesa    : Integer = 0): OleVariant;
    function ListaRateio(ACodDocumento : Double = 0): OleVariant;

    //Faz a atribuição dos campos relativos a FDO nas telas, geralmente, busca dos datasets de despesa para o cds principal de Desenbolso/Alterador
    Procedure CopyFieldsFDO(ACdsOrigem      : TClientDataSet;
                            ACdsDestino     : TClientDataSet;
                            AFields         : Array Of String
                            );Overload;
    Procedure CopyFieldsFDO(AOrigemParam    : TOrigemParamAP;
                            ACdsOrigem      : TClientDataSet;
                            ACdsDestino     : TClientDataSet
                            );Overload;

    //UTILIZADO NO CONTAS A PAGAR - TELA FLancDocCapCarMT
    Function FDO(cdsDocumento     : TClientDataSet;
                 cdsRateio        : TClientDataSet;
                 cdsAlteradores   : TClientDataSet) : Boolean;Overload;

    //UTILIZADO NO CONTAS A PAGAR - TELA fLancAlteradoresMT [ Trabalha apenas os alteradores ]
    function FDO(cdsRateio           : TClientDataSet;
                 cdsAlteradores      : TClientDataSet;
                 ALancUnicoAlterador : Boolean = TRUE) : Boolean;Overload;
    //UTILIZADO NA BAIXA
    function FDO(AOption : TFDOOption; cdsDocumento : TClientDataSet; ACODDOCUMENTO : Double = 0):Boolean;Overload;

    //UTILIZADO PELO MODFOL (Folha) e Contratos
    // APós 04/10 -> Apenas alimenta do FCdsFDORateio
    Procedure FDO_SetCDS(AIDForCli          : Integer;
                         ADataLancto        : TDateTime;
                         ACodTipRecDes      : String;
                         ACodCentroCusto    : String;
                         AUnidNegoc         : Integer;
                         AIdPlanoOrigem     : Integer;
                         AIdPatroOrigem     : Integer;
                         AIdPrograma        : Integer;
                         AValor             : Double;
                         AIDDespesaOrc      : Integer;
                         AIDProgramaOrcamen : Integer;
                         //Var OutCompromisso : Integer
                         AIDPlano           : integer = 0 // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                         );Overload;

    Procedure FDO_Valida(AOrigem        : TOrigemParamAP;
                         ACds           : TClientDataSet;
                         ACdsSubDespesa : TClientDataSet = Nil);Overload;


    procedure BuscaNomeCC_DescDesembolso (ACodOrigem , ACODCENTROCUSTO : String); //William Santana SOL 199983 KIN 1967697

    {Function FDO(AFornecedor     : Double;
                 AData           : TDateTime;
                 ovRateio        : OleVariant;
                 ovAlteradores   : OleVariant;
                 AObservacao     : String = '') : Boolean;Overload;}
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662    //


    Property IdReserva       : Integer        read FIdReserva        write FIdReserva;
    Property IdUsuario       : Integer        read FIdUsuario        write FIdUsuario;
    property IdEmpresa       : Integer        read FIdEmpresa        write FIdEmpresa;
    property NumReserva      : Integer        read FNumReserva       write FNumReserva;
    property ValorReserva    : Real           read FValorReserva     write FValorReserva;
    property CdsPeriodo      : TClientDataSet read FCdsPeriodo       write SetCdsPeriodo;
    property CdsUsuXCentCusto: TClientDataSet read FCdsUsuXCentCusto write SetCdsUsuXCentCusto;
    property CdsCompromissos : TClientDataSet read FCdsCompromissos  write SetCdsCompromissos;
    property CdsSaldos       : TClientDataSet read FCdsSaldos        write SetCdsSaldos;
    property CdsAux          : TClientDataSet read FCdsAux           write SetCdsAux;
    property CdsResComp      : TClientDataSet read FCdsResComp       write SetCdsResComp;
    property CdsReservas     : TClientDataSet read FCdsReservas      write SetCdsReservas;
    property CdsSaldoProcesso: TClientDataSet read FCdsSaldoProcesso write SetCdsSaldoProcesso;
    property CdsBuscaConta   : TClientDataSet read FCdsBuscaConta    write SetCdsBuscaConta;

    //William Santana SOL 199983 KIN 1967697
    Property NomeCentCust   : String    Read FNomeCentCust    write FNomeCentCust;
    Property DescDesembolso : String    Read FDescDesembolso  Write FDescDesembolso;
    property CdsTrataErroFDO : TClientDataSet read FCdsTrataErroFDO  write FCdsTrataErroFDO;
    //END - William Santana SOL 199983 KIN 1967697


    //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
    property CdsFDORateio    : TClientDataSet Read FCdsFDORateio;
    //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

    Property Operacao   : String         Read FOperacao     write FOperacao; // SOL 230863 e 230956 PPM 374049 e 362016


End;

Var
  OrcamentoBackMT: TOrcamentoBackMT;
  // Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  // Variável para controle de Cache de Rateio x Alterador
  IDRATEIO_ORCAMENTO : Integer;

implementation

uses Math; // Thiago Melo SOL 215854 kintana 2044932

procedure TOrcamentoBackMT.DoChangeDataBase;
Begin
  inherited;

End;

procedure TOrcamentoBackMT.OnCreateAppServer;
begin
end;

Constructor TOrcamentoBackMT.Create;
Begin
  Inherited;
  CReservaOrcamen := TCtrlReservaorcamen.Create;
  CSaldoOrcado    := TCtrlSaldoorcado.Create;
  CResxComp       := TCtrlResxcomp.Create;

  FCdsPeriodo       := TClientDataSet.Create(nil);
  FCdsUsuXCentCusto := TClientDataSet.Create(nil);
  FCdsCompromissos  := TClientDataSet.Create(nil);
  FCdsReservas      := TClientDataSet.Create(nil);
  FCdsSaldos        := TClientDataSet.Create(nil);
  FCdsSaldoProcesso := TClientDataSet.Create(nil);
  FCdsAux           := TClientDataSet.Create(nil);
  FCdsResComp       := TClientDataSet.Create(nil);
  FCdsBuscaConta    := TClientDataSet.Create(nil);
  FCdsTrataErroFDO  := TClientDataSet.Create(nil); //William Santana SOL 199983 KIN 1967697

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  FCdsFDORateio      := TClientDataSet.Create(NIL);
  //FCdsFDORateio.Data := ListaRateio(-1);
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

End;

Destructor TOrcamentoBackMT.Destroy;
Begin
  FreeAndNil(CReservaOrcamen);
  FreeAndNil(CSaldoOrcado);
  FreeAndNil(CResxComp);
  FreeCds([FCdsUsuXCentCusto,
           FCdsCompromissos,
           FCdsReservas,
           FCdsSaldos,
           FCdsPeriodo,
           FCdsAux,
           FCdsResComp,
           FCdsSaldoProcesso,
           FCdsBuscaConta,
           FCdsTrataErroFDO]); //William Santana SOL 199983 KIN 1967697]);

  //INICIO - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  FreeAndNil(FCdsFDORateio);
  //FIM    - Vander Campos - SOL: 172384/9603 - KINTANA: 1661662

  Inherited;
End;

procedure TOrcamentoBackMT.SetCdsPeriodo(const Value: TClientDataSet);
begin
  FCdsPeriodo := Value;
end;

procedure TOrcamentoBackMT.SetCdsUsuXCentCusto(const Value: TClientDataSet);
begin
  FCdsUsuXCentCusto := Value;
end;

procedure TOrcamentoBackMT.SetCdsCompromissos(const Value: TClientDataSet);
begin
  FCdsCompromissos := Value;
end;

procedure TOrcamentoBackMT.SetCdsSaldos(const Value: TClientDataSet);
begin
  FCdsSaldos := Value;
end;

procedure TOrcamentoBackMT.SetCdsAux(const Value: TClientDataSet);
begin
  FCdsAux := Value;
end;

procedure TOrcamentoBackMT.SetCdsResComp(const Value: TClientDataSet);
begin
  FCdsResComp := Value;
end;

procedure TOrcamentoBackMT.SetCdsReservas(const Value: TClientDataSet);
begin
  FCdsReservas := Value;
end;

procedure TOrcamentoBackMT.SetCdsSaldoProcesso(const Value: TClientDataSet);
begin
  FCdsSaldoProcesso := Value;
end;

procedure TOrcamentoBackMT.SetCdsBuscaConta(const Value: TClientDataSet);
begin
  FCdsBuscaConta := Value;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.CriaCompromisso                                            }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   sData - data do Compromisso a ser criado (parâmetro obrigatório)           }
{   rValor - valor do Compromisso (se for passado como zero, somará o valor    }
{            das reservas que compõe o compromisso).                           }
{   sObs - Descrição do Compromisso (não é obrigatório)                        }
{   iModulo - id do Módulo de origem                                           }
{   iConjuntoReservas - array contendo os números das reservas que vão compor  }
{                       o novo Compromisso                                     }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   1 a n - número do Compromisso gerado                                       }
{   -1 - Usuário corrente sem alçada para criar o Compromisso                  }
{   -2 - Existem Compromissos entre as Reservas passadas como parâmetro        }
{   -3 - Existem Reservas Canceladas ou Efetivadas entre as Reservas           }
{        passadas como parâmetro                                               }
{   -4 - Existem Reservas com Contas Orçamentárias diferentes entre as Reservas}
{        passadas como parâmetro                                               }
{   -5 - Houve um erro inesperado no Banco de Dados                            }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.CriaCompromisso(sData:String; rValor:extended;
  sObs:String; iModulo:Integer; iConjuntoReservas:array of Integer;
  bExibeMsg, bVeioCompra: boolean):Integer;
var sMsg, sCodConta, sSQL: String;
    iNumReservas, iPeriodo, iCodCompromisso, i: Integer;
    bNaoEReserva, bNaoEstaAguardando, bNaoEMesmaConta: boolean;
    rValorTotalReservas: extended;
    iIdCompromisso: LongInt;

  iExercicio,
  Mes,
  Dia         : Word;

begin

  if Operacao = 'A' then exit; // SOL 230863 e 230956 PPM 374049 e 362016

  Result := 0;
  //Função que procede com a criação do Compromisso a partir de "n" reservas
  iNumReservas := high(iConjuntoReservas);

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );

  iPeriodo     := EncontraPeriodo(sData);
  rValorTotalReservas := 0;
  bNaoEReserva        := false;
  bNaoEstaAguardando  := false;
  bNaoEMesmaConta     := false;
  sCodConta           := '';

  for i := 0 to iNumReservas do
    begin
      if iConjuntoReservas[i] <> 0 then
        begin
          sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, ' +
                  'R.FLGRESCOMP, R.FLGRESERVA, R.IDCONTAORCAMEN, ' +
                  'R.IDPLANOORCAMEN, C.CODCENTRORESPON ' +
                  'FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE ' +
                  '(R.IDPESSOA = ' + IntToStr( idEmpresa ) + ') AND ' +
                  '(R.NUMRESERVA = ' + IntToStr(iConjuntoReservas[i]) + ') AND ' +
                  '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                  '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

          with FCdsCompromissos do
            begin
              Data := GetDataPacket(sSQL);

              if i > 0 then
                begin
                  if sCodConta <> FieldByName('IDCONTAORCAMEN').asString then
                    begin
                      bNaoEMesmaConta := true;
                    end;
                end;

              if FieldByName('FLGRESCOMP').asString = 'C' then
                begin
                  bNaoEReserva := true;
                end;

              if (FieldByName('FLGRESERVA').asString <> 'A') and
                 (FieldByName('FLGRESERVA').asString <> 'U') and
                 (Not bVeioCompra) then
                begin
                  bNaoEstaAguardando := true;
                end;

              if (FieldByName('FLGRESERVA').asString = 'A') or
                 (FieldByName('FLGRESERVA').asString = 'U') then
                begin
                  sCodConta := FieldByName('IDCONTAORCAMEN').asString;
                  rValorTotalReservas := rValorTotalReservas +
                                         FieldByName('VLRRESERVA').asFloat;
                end;

            end; // with
        end; // if
    end; // for

  if rValorTotalReservas < rValor then
    begin
      if not VerificaSaldoProcesso(FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                                   FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString,
                                   iExercicio,
                                   iPeriodo,
                                   (rValor - rValorTotalReservas),
                                   true) then
        begin
          sMsg := 'Não há saldo no orçamento para esta operação';
          result := -1;
        end;
    end;

  if bNaoEReserva then
    begin
      sMsg := 'Existem Compromissos para estas Reservas.';
      Result := -2;
    end;

  if bNaoEstaAguardando then
    begin
      sMsg := 'Existem Reservas Canceladas ou Efetivadas.';
      Result := -3;
    end;

  if bNaoEMesmaConta then
    begin
      sMsg := 'Existem Reservas com Contas Orçamentárias diferentes.';
      Result := -4;
    end;

  if Result < 0 then
    begin
      if bExibeMsg then
        begin
          if sMsg <> '' then
            begin
              MessageInfo := sMsg;
            end;
        end;
      EXIT;
    end;

  //Cria o número do próximo compromisso

  // semáforo para que usuários concorrentes não peguem o mesmo número de reserva
  GetDataPacket('SELECT * FROM PARAMORCAMENTO FOR UPDATE');

  sSQL := 'SELECT MAX(NUMRESERVA) AS PROXIMA FROM RESERVAORCAMEN ' +
          'WHERE IDPESSOA = ' + IntToStr( idEmpresa );

  with FCdsAux do
    begin
      Data := GetDataPacket(sSQL);
      iCodCompromisso := FieldByName('PROXIMA').asInteger + 1;
      Close;
    end;


  iIdCompromisso := GetSequence( 'RESERVAORCAMEN' );

  if rValor = 0 then rValor := rValorTotalReservas;

  try
    //Cria o Compromisso
    CReservaOrcamen.CriaCompromisso(iIdCompromisso,
                                    idEmpresa,
                                    iExercicio,
                                    iPeriodo,
                                    FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                                    iCodCompromisso,
                                    iModulo,
                                    FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString,
                                    sData,
                                    sObs,
                                    rValor);

    //Cria o Relacionamento entre o novo Compromisso e as reservas antigas
    for i := 0 to iNumReservas do
      begin
        if iConjuntoReservas[i] <> 0 then
          begin
            sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, R.VLRRESERVA, ' +
                    'R.FLGRESCOMP, R.FLGRESERVA, R.IDCONTAORCAMEN, ' +
                    'R.IDPLANOORCAMEN, C.CODCENTRORESPON ' +
                    'FROM RESERVAORCAMEN R, CONTASORCAMEN C WHERE ' +
                    '(R.IDPESSOA = ' + IntToStr( idEmpresa ) + ') AND ' +
                    '(R.NUMRESERVA = ' + IntToStr(iConjuntoReservas[i]) +
                    ') AND ' + '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                    '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

            FCdsCompromissos.Data := GetDataPacket(sSQL);
            CResxComp.Inserir(GetSequence( 'RESXCOMP' ),
                              idEmpresa,
                              FCdsCompromissos.FieldByName('IDRESERVAORCAMEN').AsInteger,
                              iIdCompromisso);

            //Marca as reservas como efetivadas
            CReservaOrcamen.AtualizaFLGRESERVA('E', idEmpresa,iConjuntoReservas[i]);
          end;
      end;

    //Retira o Valor do Saldo Reservado e inclui no Compromissado
    CSaldoOrcado.TrocaSaldoReservadopCompromissado(rValorTotalReservas,
                                                   rValor,
                                                   idEmpresa,
                                                   FCdsCompromissos.FieldByName('IDPLANOORCAMEN').asInteger,
                                                   PrimeiroDiaPeriodo(iExercicio,iPeriodo),
                                                   FCdsCompromissos.FieldByName('IDCONTAORCAMEN').asString);


    result := iIdCompromisso;

    sMsg := 'O Compromisso nº ' + IntToStr(iCodCompromisso) +
            ' foi criado com sucesso.';

  except
    result := -5;
    sMsg   := 'Houve um erro inesperado no Banco de Dados';
  end;

  if bExibeMsg then
    begin
      if sMsg <> '' then
        begin
          MessageInfo := sMsg;
        end;
    end;

end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.MarcaReserva                                               }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número da Reserva Orçamentário (parâmetro obrigatório)       }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Marcação realizada com sucesso                                         }
{   1 - Usuário corrente sem alçada para a Marcação                            }
{   2 - O número enviado é de um Compromisso Orçamentária, não de uma Reserva  }
{   3 - O número enviado é de uma Reserva já Cancelada                         }
{   4 - O número enviado é de uma Reserva já Efetivada                         }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{   6 - O número enviado é de uma Reserva já em Uso                            }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.MarcaReserva(iNumReserva:longint;
  bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com a marcação da Reserva para "Em Uso - U"
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para marcar a reserva
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'C' then begin
        //Não é uma reserva, é um compromisso
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É uma reserva cancelada
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //A reserva já foi efetivada
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'U' then begin
              //A reserva já está em uso
              result := 6;
            end else begin
              //A reserva está aguardando, e pode ser usada
              try
                CReservaOrcamen.AtualizaFLGRESERVA('U', idEmpresa,iNumReserva );
                //A marcação foi realizada com sucesso
                result := 0;
              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a marcar a ' +
                  'Reserva "Em Uso".';
      2 : sMsg := 'O número enviado é de um Compromisso Orçamentário, ' +
                  'não de uma Reserva.';
      3 : sMsg := 'O número enviado é de uma Reserva já Cancelada';
      4 : sMsg := 'O número enviado é de uma Reserva já Efetivada';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O número enviado é de uma Reserva já em Uso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EstornaReserva                                             }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número da Reserva Orçamentário (parâmetro obrigatório)       }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Estorno realizado com sucesso                                          }
{   1 - Usuário corrente sem alçada para o Estorno                             }
{   2 - O número enviado é de um Compromisso Orçamentário, não de uma Reserva  }
{   3 - O número enviado é de uma Reserva já Cancelada                         }
{   4 - O número enviado é de uma Reserva já Efetivada                         }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.EstornaReserva(iNumReserva:longint;
  bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com o Estorno da Reserva
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para marcar a reserva
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'C' then begin
        //Não é uma reserva, é um compromisso
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É uma reserva cancelada
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //A reserva já foi efetivada
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'A' then begin
              //A reserva já está aguardando
              result := 6;
            end else begin
              //A reserva está em uso, e pode ser estornada
              try
                CReservaOrcamen.AtualizaFLGRESERVA( 'A', idEmpresa,iNumReserva );
                //A marcação foi realizada com sucesso
                result := 0;


                GravaLogPLANEORC('uCtrlOrcamento.EstornaReserva: Reserva nº ' + IntToStr(iNumReserva),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario);
                //
              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a estornar a Reserva.';
      2 : sMsg := 'O número enviado é de um Compromisso Orçamentário, ' +
                  'não de uma Reserva.';
      3 : sMsg := 'O número enviado é de uma Reserva já Cancelada.';
      4 : sMsg := 'O número enviado é de uma Reserva já Efetivada.';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados.';
      6 : sMsg := 'O número enviado é de uma Reserva já Aguardando.';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.CancelaReserva                                             }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número da Reserva Orçamentário (parâmetro obrigatório)       }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Cancelamento realizado com sucesso                                     }
{   1 - Usuário corrente sem alçada para o Cancelamento                        }
{   2 - O número enviado é de um Compromisso Orçamentária, não de uma Reserva  }
{   3 - O número enviado é de uma Reserva já Cancelada                         }
{   4 - O número enviado é de uma Reserva já Efetivada                         }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.CancelaReserva(iNumReserva:longint;
  bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com o Cancelamento da Reserva
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.EXERCICIO, R.PERIODO, R.VLRRESERVA ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ')';
  with FCdsReservas do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para marcar a reserva
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'C' then begin
        //Não é uma reserva, é um compromisso
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É uma reserva cancelada
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //A reserva já foi efetivada
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'U' then begin
              //A reserva está em uso
              result := 6;
            end else begin
              //A reserva está aguardando, e pode ser usada
              try
                CReservaOrcamen.AtualizaFLGRESERVA( 'C', idEmpresa,iNumReserva );
                //Retira o Valor do Saldo Reservado
                CSaldoOrcado.RetiraValor(FieldByName('VLRRESERVA').asFloat,
                         idEmpresa,
                         FieldByName('IDPLANOORCAMEN').asInteger,
                         PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                         FieldByName('PERIODO').asInteger),
                         FieldByName('IDCONTAORCAMEN').asString,'R');
                //O cancelamento foi realizado com sucesso
                result := 0;

                
                GravaLogPLANEORC('uCtrlOrcamento.CancelaReserva: Reserva nº ' + IntToStr(iNumReserva),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario);
                

              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a cancelar a Reserva.';
      2 : sMsg := 'O número enviado é de um Compromisso Orçamentário, ' +
                  'não de uma Reserva.';
      3 : sMsg := 'O número enviado é de uma Reserva já Cancelada';
      4 : sMsg := 'O número enviado é de uma Reserva já Efetivada';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O número enviado é de uma Reserva já em Uso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EstornaCompromisso                                         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   rValor - valor do Compromisso.                                             }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Estorno realizado com sucesso                                          }
{   1 - Usuário corrente sem alçada para a Estorno                             }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   4 - O número enviado é de um Compromisso ainda Aguardando                  }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.EstornaCompromisso(iNumReserva:longint;
  rValor:extended; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com o estorno do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA   = ' + IntToStr( IdEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para estornar o compromisso
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'R' then begin
        //Não é um compromisso, é uma reserva
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É um compromisso cancelado
          result := 3;
        end else begin
          if (FieldByName('FLGRESERVA').asString = 'A') and
             (FieldByName('VLRCOMPROMISSO').asFloat < rValor) then begin
            //O compromisso está aguardando
            result := 4;
          end else begin
            if (FieldByName('FLGRESERVA').asString = 'E') or
               (FieldByName('FLGRESERVA').asString = 'A') then begin
              //O compromisso está efetivado, e pode ser estornado
              try
                CReservaOrcamen.AtualizaValorCompromisso( rValor * (-1),'A',iNumReserva );
                //A efetivação foi realizada com sucesso
                result := 0;

                
                GravaLogPLANEORC('uCtrlOrcamento.EstornaCompromisso: Compromisso nº ' + IntToStr(iNumReserva),
                                 Sistema.IdModulo,
                                 Sistema.IdUsuario);
                

              except
                //Ocorreu um erro inesperado no Banco de Dados
                result := 5;
              end;
            end else begin
              //Ocorreu um erro inesperado no Banco de Dados
              result := 5;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para o Estorno';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso ainda Aguardando';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.CancelaCompromisso                                         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Cancelamento realizado com sucesso                                     }
{   1 - Usuário corrente sem alçada para o Cancelamento                        }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.CancelaCompromisso(iNumReserva:longint; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
    iIDResxComp, iIDReserva : Int64;
    fValorReserva, fValorComprometido : Extended;
    CdsResXComp : TClientDataSet;
begin
  //Função que procede com o cancelamento do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND  ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';

  try
    CdsResXComp := TClientDataSet.Create(nil);

    with FCdsCompromissos do
      begin
        Data := GetDataPacket(sSQL);
        if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then
          begin
            //O Usuário Corrente não tem alçada nesse centro de responsabilidade
            //para cancelar o compromisso
            Result := 1;
          end
        else
          begin
            if FieldByName('FLGRESCOMP').asString = 'R' then
              begin
                //Não é um compromisso, é uma reserva
                Result := 2;
              end
            else
              begin
                try
                  CReservaOrcamen.AtualizaFLGRESERVA('C', idEmpresa,iNumReserva);

                  sSQL :=
                  'SELECT C.IDRESXCOMP, C.IDRESERVA, R1.VLRRESERVA'         + #13 +
                  'FROM   RESXCOMP C, RESERVAORCAMEN R, RESERVAORCAMEN R1 ' + #13 +
                  'WHERE '                                                  + #13 +
                  '    R.NUMRESERVA = ' + IntToStr(iNumReserva)             + #13 +
                  'AND R1.IDRESERVAORCAMEN = C.IDRESERVA '                  + #13 +
                  'AND R.IDRESERVAORCAMEN  = C.IDCOMPROMISSO';

                  FCdsAux.Data := GetDataPacket(sSQL);
                  FCdsAux.First;
                  while not FCdsAux.eof do
                    begin
                      iIDReserva    := FCdsAux.FieldByName('IDRESERVA').AsInteger;
                      iIDResxComp   := FCdsAux.FieldByName('IDRESXCOMP').AsInteger;
                      fValorReserva := FCdsAux.FieldByName('VLRRESERVA').AsFloat;

                      // Se houver mais de um Compromisso para uma mesma Reserva
                      // na tabela ResXComp é porque foi feito pelo módulo do COMPRAS
                      //  e o cancelamento não deverá excluir estes relacionamentos.
                      CdsResXComp.Data := CResXComp.ListarCompromissosDaReserva(iIDReserva, Sistema.IdEmpresa);
                      if CdsResXComp.RecordCount < 2 then
                        begin
                          ExecSql('UPDATE RESERVAORCAMEN SET FLGRESERVA = ''U'' WHERE IDRESERVAORCAMEN = ' + IntToStr(iIDReserva));
                          ExecSql('DELETE FROM RESXCOMP WHERE IDRESXCOMP = ' + IntToStr(iIDResxComp));
                        end;

                      sSQL :=
                      'SELECT NVL(VLRCOMPROMETIDO,0) AS VLRCOMPROMETIDO FROM SALDOORCADO ' +
                      'WHERE ' +
                      '(IDPESSOA = ' + IntToStr(idEmpresa) + ') AND ' +
                      '(DATAREFERENCIA = TO_DATE(''' + PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                                                                          FieldByName('PERIODO').asInteger) +
                      ''',''DD/MM/YYYY'')) AND ' +
                      '(IDPLANOORCAMEN = ' + FieldByName('IDPLANOORCAMEN').AsString + ') AND ' +
                      '(IDCONTAORCAMEN = ''' + FieldByName('IDCONTAORCAMEN').asString + ''')';

                      FCdsResComp.Data := GetDataPacket(sSQL);

                      fValorComprometido := FCdsResComp.FieldByName('VLRCOMPROMETIDO').AsFloat;

                      sSql :=
                      'UPDATE SALDOORCADO SET VLRCOMPROMETIDO = VLRCOMPROMETIDO - ' +
                      TrocaVPP(FloatToStr(FieldByName('VLRRESERVA').AsFloat));

                      // Se houver mais de um Compromisso para uma mesma Reserva
                      // na tabela ResXComp, é porque foi feito pelo módulo do COMPRAS
                      // e o cancelamento não deverá abrir o valor da Reserva novamente.
                      // Será necessário CRIAR uma NOVA RESERVA se for o caso.
                      if CdsResXComp.RecordCount < 2 then
                        sSql := sSql + ', VLRRESERVADO = VLRRESERVADO + ' + TrocaVPP(FloatToStr(fValorReserva));

                      sSql := sSql +
                      ' WHERE ' +
                      '(IDPESSOA = ' + IntToStr(idEmpresa) + ') AND ' +
                      '(DATAREFERENCIA = TO_DATE(''' + PrimeiroDiaPeriodo(FieldByName('EXERCICIO').asInteger,
                                                                          FieldByName('PERIODO').asInteger) +
                      ''',''DD/MM/YYYY'')) AND ' +
                      '(IDPLANOORCAMEN = ' + FieldByName('IDPLANOORCAMEN').AsString + ') AND ' +
                      '(IDCONTAORCAMEN = ''' + FieldByName('IDCONTAORCAMEN').asString + ''')';

                      ExecSql(sSQL);

                      FCdsAux.Next;
                    end; // while

                  //O cancelamento foi realizada com sucesso
                  Result := 0;

                  GravaLogPLANEORC('uCtrlOrcamento.CancelaCompromisso: Compromisso nº ' + IntToStr(iNumReserva),
                                   Sistema.IdModulo,
                                   Sistema.IdUsuario);

                except
                  //Ocorreu um erro inesperado no Banco de Dados
                  Result := 5;
                end; // try-except
              end; // else
          end; // if
      end; // while

    if bExibeMsg then
      begin
        case Result of
          1 : sMsg := 'Usuário corrente sem alçada para o Cancelamento';
          2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                      'não de um Compromisso';
          3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
          5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
          else sMsg := '';
        end;

        if sMsg <> '' then
          begin
            MessageInfo := sMsg;
          end;
      end;
  finally
    FreeAndNil(CdsResXComp);
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EfetivaCompromisso                                         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   rValor - valor do Compromisso. Caso o valor seja diferente de zero, ele    }
{            substituirá o valor do Compromisso (parâmetro NÃO obrigatório)    }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Efetivação realizada com sucesso                                       }
{   1 - Usuário corrente sem alçada para a Efetivação                          }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   4 - O número enviado é de um Compromisso já Efetivado                      }
{   5 - Houve um erro inesperado no Banco de Dados                             }
{   6 - O valor passado como parâmetro é maior que o valor do compromisso      }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.EfetivaCompromisso(iNumReserva:longint;
  rValor:extended; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
    efetivacompromisso: boolean;
begin
  //Função que procede com a efetivação do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN, R.VLRDEVOLVIDO ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do
  begin
    Data := GetDataPacket(sSQL);

    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then
    begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para efetivar o compromisso
      result := 1;
    end
    else
    begin
      if FieldByName('FLGRESCOMP').asString = 'R' then
      begin
        //Não é um compromisso, é uma reserva
        result := 2;
      end
      else
      begin
        if FieldByName('FLGRESERVA').asString = 'C' then
        begin
          //É um compromisso cancelado
          result := 3;
        end
        else
        begin
          if FieldByName('FLGRESERVA').asString = 'E' then
          begin
            //O compromisso já foi efetivado
            result := 4;
          end
          else
          begin
            if FieldByName('FLGRESERVA').asString = 'A' then
            begin
              //O Valor passado é maior que o valor do Compromisso original
              if RoundCM(rValor,2) > RoundCM((FieldByName('VLRRESERVA').asFloat -
                                                         (FieldByName('VLRCOMPROMISSO').asFloat +
                                                          FieldByName('VLRDEVOLVIDO').asFloat)),2) then
              begin
                result := 6;

              end
              else
              begin
                //O compromisso está aguardando, e pode ser efetivado
                try
                  if Format('%17.2f', [rValor]) =
                     Format('%17.2f', [(FieldByName('VLRRESERVA').asFloat -
                                        (FieldByName('VLRCOMPROMISSO').asFloat +
                                         FieldByName('VLRDEVOLVIDO').asFloat))]) then
                    begin
                      efetivacompromisso := True;
                    end
                  else
                    begin
                      efetivacompromisso := False;
                    end;

                  CReservaOrcamen.CompromissoAguardando( rValor,    iNumReserva,
                                                         idEmpresa, efetivacompromisso );

                  GravaLogPLANEORC('uCtrlOrcamento.EfetivaCompromisso: Compromisso nº ' + IntToStr(iNumReserva),
                                   Sistema.IdModulo,
                                   Sistema.IdUsuario);

                  result := 0;
                except
                  //Ocorreu um erro inesperado no Banco de Dados
                  result := 5;
                end;
              end;
            end
            else
            begin
              //Ocorreu um erro inesperado no Banco de Dados
              result := 5;
            end;
          end;
        end;
      end;
    end;
  end;

  if bExibeMsg then
  begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a Efetivação';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso já Efetivado';
      5 : sMsg := 'Houve um erro inesperado no Banco de Dados';
      6 : sMsg := 'O valor é maior que o valor do compromisso';
      else sMsg := '';
    end;
    if sMsg <> '' then
       MessageInfo :=sMsg;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaCompromisso                                        }                                  
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iNumReserva - número do Compromisso Orçamentário (parâmetro obrigatório)   }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{                                                                              }
{   0 - Compromisso ok                                                         }
{   1 - Usuário corrente sem alçada para a Efetivação                          }
{   2 - O número enviado é de uma Reserva Orçamentária, não de um Compromisso  }
{   3 - O número enviado é de um Compromisso já Cancelado                      }
{   4 - O número enviado é de um Compromisso já Efetivado                      }
{   5 - Houve um erro não esperado                                             }
{   6 - O valor passado como parâmetro é maior que o valor do compromisso      }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaCompromisso(iNumReserva:longint;
  rValor:extended; bExibeMsg: boolean):Integer;
var sMsg, sSQL: String;
begin
  //Função que procede com a verificação do Compromisso Orçamentário
  sSQL := 'SELECT R.FLGRESERVA, R.FLGRESCOMP, C.CODCENTRORESPON, ' +
          'R.VLRRESERVA, R.VLRCOMPROMISSO, R.EXERCICIO, R.PERIODO, ' +
          'R.IDPLANOORCAMEN, R.IDCONTAORCAMEN ' +
          'FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE (R.NUMRESERVA = ' + IntToStr(iNumReserva) + ') AND ' +
          '(R.IDPESSOA = ' + IntToStr( idEmpresa) + ') AND ' +
          '(R.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
          '(R.IDPLANOORCAMEN = C.IDPLANOORCAMEN)';
  with FCdsCompromissos do begin
    Data := GetDataPacket(sSQL);
    if not VerificaDotacao(FieldByName('CODCENTRORESPON').asString) then begin
      //O Usuário Corrente não tem alçada nesse centro de responsabilidade
      //para efetivar o compromisso
      result := 1;
    end else begin
      if FieldByName('FLGRESCOMP').asString = 'R' then begin
        //Não é um compromisso, é uma reserva
        result := 2;
      end else begin
        if FieldByName('FLGRESERVA').asString = 'C' then begin
          //É um compromisso cancelado
          result := 3;
        end else begin
          if FieldByName('FLGRESERVA').asString = 'E' then begin
            //O compromisso já foi efetivado
            result := 4;
          end else begin
            if FieldByName('FLGRESERVA').asString = 'A' then begin
              //O Valor passado é maior que o valor do Compromisso original
              if StrToFloat(Format('%17.2f',[rValor])) >
                 StrToFloat(Format('%17.2f',[(FieldByName('VLRRESERVA').asFloat
                 - FieldByName('VLRCOMPROMISSO').asFloat)])) then begin
                result := 6;
              end else begin
                //O compromisso está aguardando, e pode ser efetivado
                result := 0;
              end;
            end else begin
              //houve um problema não esperado
              result := 5;
            end;
          end;
        end;
      end;
    end;
  end;
  if bExibeMsg then begin
    case Result of
      1 : sMsg := 'Usuário corrente sem alçada para a Efetivação';
      2 : sMsg := 'O número enviado é de uma Reserva Orçamentária, ' +
                  'não de um Compromisso';
      3 : sMsg := 'O número enviado é de um Compromisso já Cancelado';
      4 : sMsg := 'O número enviado é de um Compromisso já Efetivado';
      5 : sMsg := 'Houve um erro inesperado.';
      6 : sMsg := 'O valor é maior que o valor do compromisso';
      else sMsg := '';
    end;
    if sMsg <> '' then begin
       MessageInfo := sMsg;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaDatas                                              }
{                                                                              }
{  Função que verifica se a data inicial é menor ou igual à data final         }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   dDataIni - data inicial                                                    }
{   dDataFim - data final                                                      }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaDatas(dDataIni, dDataFim:TDateTime):boolean;
begin
  //Faz a verificação se a data final é maior que a data inicial
  result := true;
  if dDataFim < dDataIni then begin
    Application.MessageBox
                ('A Data Final deve ser maior ou igual que a Data Inicial.',
                 'Erro',mb_IconStop);
    result := false;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.EncontraPeriodo                                            }
{                                                                              }
{  Função que encontra o Periodo a partir de uma data de referencia            }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   sData - data de referência                                                 }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   inteiro contendo o período orçamentário                                    }
{                                                                              }
{------------------------------------------------------------------------------}
//************************************************
Function TOrcamentoBackMT.EncontraPeriodo( sData : String ):Integer;
Var
  sSQL: String;

  iExercicio,
  Mes,
  Dia         : Word;

Begin

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );
  sSQL := 'SELECT PERIODO FROM PERIODOORCAMEN ' +
          'WHERE (DATAINIPERIODO <= TO_DATE(''' + sData + ''',''DD/MM/YYYY''))'
          + ' AND (DATAFIMPERIODO >= TO_DATE(''' + sData + ''',''DD/MM/YYYY''))'
          + ' AND (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(IDPESSOA  = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSQL);
    if isEmpty then begin
      result := 0;
    end else begin
      result := FieldByName('PERIODO').asInteger;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.DiasNoPeriodo                                              }
{                                                                              }
{  Função que retorna o número de dias de um período orçamentário              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iExercicio - exercício orçamentário                                        }
{   iPeríodo - periodo orçamentário                                            }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   inteiro contendo o número de dias do período orçamentário                  }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.DiasNoPeriodo(iExercicio, iPeriodo:Integer):Integer;
var sSQL: String;
begin
  //Retorna quantos dias um período tem
  sSQL := 'SELECT DATAINIPERIODO, DATAFIMPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSQL);
    if isEmpty then begin
      result := 0;
    end else begin
      result := trunc(FieldByName('DATAFIMPERIODO').value -
                FieldByName('DATAINIPERIODO').value) + 1;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.PrimeiroDiaPeriodo                                         }
{                                                                              }
{  Função que retorna a data do primeiro dia de um período orçamentário        }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iExercicio - exercício orçamentário                                        }
{   iPeríodo - periodo orçamentário                                            }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   String contendo a data do primeiro dia do período orçamentário             }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.PrimeiroDiaPeriodo(iExercicio,
  iPeriodo:Integer):String;
var sSQL: String;
begin
  //Retorna o primeiro dia em um período
  sSQL := 'SELECT DATAINIPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ')';
  with FCdsPeriodo do begin
    Data := GetDataPacket(sSQL);
    if isEmpty then begin
      result := '';
    end else begin
      result := DateToStr(FieldByName('DATAINIPERIODO').asDateTime);
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaDotacao                                            }
{                                                                              }
{  Função que verifica se o Centro de Responsabilidade pode ser usado pelo     }
{  usuário corrente                                                            }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   sCentroRespon - Centro de Responsabilidade                                 }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaDotacao(sCentroRespon:String):boolean;
var sSQL: String;
begin
  //Verifica a tabela de Usuarios x Centros de Resp.
  //para saber se pode ser feita a reserva
  result := true;
  if sCentroRespon <> '' then begin
    sSQL := 'SELECT IDPESSOAACESSO FROM PESSOAXCRESP ' +
            'WHERE (IDPESSOAACESSO = ' + IntToStr( IdUsuario ) +
            ') AND ' + '(RTRIM(CODCENTRORESPON) = ''' + sCentroRespon +
            ''') AND ' + '(IDPESSOA = ' + IntToStr( IdEmpresa) + ')';
    with FCdsUsuXCentCusto do begin
      Data := GetDataPacket(sSQL);
      if isEmpty then begin
        result := false;
      end;
    end;
  end;
end;


// Retorna o CODCENTRORESPON
function TOrcamentoBackMT.BuscaCentRespon(const idReserva      : Integer;
                                          const NumReserva     : Integer;
                                          const bMostraMsg     : Boolean
                                         ):String;
var sSQL: String;
begin

  sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, C.CODCENTRORESPON FROM RESERVAORCAMEN R, CONTASORCAMEN C' +
          'WHERE R.IDPESSOA =' + IntToStr( idEmpresa) +
          'AND C.IDPLANOORCAMEN = R.IDPLANOORCAMEN' +
          'AND C.IDCONTAORCAMEN = R.IDCONTAORCAMEN';
  if idReserva > 0 then begin
    sSQL := sSQL + ' AND R.IDRESERVAORCAMEN = ' + IntToStr(idReserva);
  end else begin
    if NumReserva > 0 then begin
      sSQL := sSQL + ' AND R.NUMRESERVA = ' + IntToStr(NumReserva);
    end;
  end;

  try
    FCdsAux.Data := GetDataPacket(sSQL);
    if FCdsAux.IsEmpty then begin
      Result := '';
      if bMostraMsg then begin
         MessageInfo := 'Reserva Orçamentária não existe';
      end;
    end else begin
      Result := FCdsAux.FieldByname('CODCENTRORESPON').AsString;
    end;
  except
    Result := '';
  end;

end;


{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.BuscaIdNumReserva                                          }
{                                                                              }
{  Função que retorna ou o sequencial ou o número da reserva, dependendo de    }
{  qual dos dois foi passado como parâmetro                                    }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   idReserva - sequence da Reserva/Compromisso                                }
{   NumReserva - número da Reserva/Compromisso                                 }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   inteiro contendo o sequence ou o número da reserva                         }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.BuscaIdNumReserva(const idReserva, NumReserva:Integer;
  const bMostraMsg:Boolean):Integer;
var sSQL: String;
begin

  sSQL := 'SELECT R.IDRESERVAORCAMEN, R.NUMRESERVA, C.CODCENTRORESPON FROM RESERVAORCAMEN R, CONTASORCAMEN C ' +
          'WHERE R.IDPESSOA =' + IntToStr( idEmpresa) +
          ' AND C.IDPLANOORCAMEN = R.IDPLANOORCAMEN' +
          ' AND C.IDCONTAORCAMEN = R.IDCONTAORCAMEN';
  if idReserva > 0 then begin
    sSQL := sSQL + ' AND R.IDRESERVAORCAMEN = ' + IntToStr(idReserva);
  end else begin
    if NumReserva > 0 then begin
      sSQL := sSQL + ' AND R.NUMRESERVA = ' + IntToStr(NumReserva);
    end;
  end;

  try
    FCdsAux.Data := GetDataPacket(sSQL);
    if FCdsAux.IsEmpty then begin
      Result := 0;
      if bMostraMsg then begin
         MessageInfo := 'Reserva Orçamentária não existe';
      end;
    end else begin
      if idReserva > 0 then begin
        Result := FCdsAux.FieldByname('NUMRESERVA').AsInteger;
      end else begin
        Result := FCdsAux.FieldByname('IDRESERVAORCAMEN').AsInteger;
      end;
    end;
  except
    Result := 0;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaContaAtiva                                         }
{                                                                              }
{  Função que verifica se uma conta está ativa ou não para movimentações       }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   sContaOrcamen - conta orçamentária                                         }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaContaAtiva(iPlanoOrc:Integer;
  sContaOrcamen: String):boolean;
var sSQL: String;
begin
  sSQL := 'SELECT ' +
          '   FLGATIVA, DATAATIVA, DATAINATIVA ' +
          'FROM ' +
          '   CONTASORCAMEN ' +
          'WHERE ' +
          '   (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND  ' +
          '   (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ')';
  with FCdsAux do begin
    Data := GetDataPacket(sSQL);
    if FieldByName('FLGATIVA').isNull then begin
      result := true;
    end else begin
      if FieldByName('FLGATIVA').asString = 'S' then begin
        result := true;
      end else begin
        result := false;
      end;
    end;
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaSaldoProcesso                                      }
{                                                                              }
{  Função que verifica se uma conta está com saldo ou não no período escolhido }
{  para a rtealização de processos                                             }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   sContaOrcamen - conta orçamentária                                         }
{   iExercicio - exercício orçamentário                                        }
{   iPeríodo - periodo orçamentário                                            }
{   rValor - valor do processo                                                 }
{   bExibeMsg - flag indicativa se a função deve ou não gerar mensagens de erro}
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true / false                                                               }
{                                                                              }
{------------------------------------------------------------------------------}
Function TOrcamentoBackMT.VerificaSaldoProcesso( iPlanoOrc     : Integer;
                                                 sContaOrcamen : String;
                                                 iExercicio,
                                                 iPeriodo      : Integer;
                                                 rValor        : Extended;
                                                 bMostraMsg    : Boolean ) : Boolean;
Var
  sTipoSaldo,
  sVerificaSaldo,
  sSQL           : String;
Begin
  //Verifica na tabela de Parâmetros como deverá ser tratado o Saldo
  sSQL := 'SELECT FLGTIPOSALDO, FLGVERIFICASALDO FROM PARAMORCAMENTO ' +
          'WHERE IDPESSOA = ' + IntToStr(idEmpresa);
  with FCdsAux do begin
    Data := GetDataPacket(sSQL);
    if FieldByName('FLGVERIFICASALDO').isNull then begin
      sVerificaSaldo := 'N';
    end else begin
      sVerificaSaldo := FieldByName('FLGVERIFICASALDO').asString;
    end;
    if FieldByName('FLGTIPOSALDO').isNull then begin
      sTipoSaldo := 'P';
    end else begin
      sTipoSaldo := FieldByName('FLGTIPOSALDO').asString;
    end;
  end;
  //Verifica a tabela de Saldos para ver se a reserva pode ser
  //feita com o Saldo corrente
  sSQL := 'SELECT SUM( NVL( VLRORCADO      , 0) ) AS VALOR1,' + #13 + #10 +
          '       SUM( NVL( VLRCOMPROMETIDO, 0) ) AS VALOR2,' + #13 + #10 +
          '       SUM( NVL( VLRRESERVADO   , 0) ) AS VALOR3 ' + #13 + #10 +
          'FROM SALDOORCADO '                                 + #13 + #10 +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND '  + #13 + #10 +
          '       (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND '    + #13 + #10 +
          '       (IDPESSOA = ' + IntToStr( idEmpresa) + ') AND '       + #13 + #10;
  if iPeriodo <> 0 then //Brunno Mattos - KTN 1121572 - SOL 151865
    case sTipoSaldo[1] of
      'P' : begin
            sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                           '(PERIODO = ' + IntToStr(iPeriodo) + ')';
            end;
      'E' : begin
            sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ')';
            end;
      'A' : begin
            sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                           '(PERIODO <= ' + IntToStr(iPeriodo) + ')';
            end;
    end
   //Brunno Mattos - KTN 1121572 - SOL 151865 Inicio
    else
      sSQL := sSQL + ' WHERE PERIODO >= 1 AND PERIODO <= 12';
   //Brunno Mattos - KTN 1121572 - SOL 151865 Fim

  with FCdsSaldoProcesso do begin
    Data := GetDataPacket(sSQL);
    if StrToFloat(Format('%15.2f', [( FieldByName('VALOR1').asFloat -
                                    ( FieldByName('VALOR2').asFloat + FieldByName('VALOR3').asFloat))]))
       < StrToFloat(Format('%15.2f', [rValor])) then begin
      if bMostraMsg then begin
         MessageInfo := 'Não existe saldo suficiente para esta Reserva.';
      end;
      Close;
      Result := false;
    end else begin
      Result := true;
    end;
  end;
end;



//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------
//    TOrcamentoBackMT.BuscaContaOrcamen
//
// Função que verifica se uma conta está apta a ter processos nela
//
// Parâmetros passados para a Função :
//
//    iPlanoOrc         - plano orçamentário
//    sContaOrcamen     - conta orçamentária
//    bExibeMsg         - flag indicativa se a função deve ou não gerar mensagens de erro
//    bProcessso        - flag indicativa se a busca é para um processo ou não
//    sNomeConta        - nome da Conta Orçamentária
//    sCodCentroRespon  - código do Centro de Responsabilidade da Conta
//    sNomeCentroRespon - nome do Centro de Responsabilidade da Conta
//    sCodGrupoConta    - codigo do Grupo da Conta
//    sNomeGrupoConta   - nome do Grupo da Conta
//
// Resultados possíveis da Função :
//    0 - conta ok
//    1 - código da conta não existe
//    2 - conta inativa
//    3 - conta bloqueada para este usuário
//    4 - no caso de consulta para processos, a conta não é do tipo "X" (RETIRADA)
//
//--------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------------------------------------

function TOrcamentoBackMT.BuscaContaOrcamen(const iPlanoOrc           : Integer;
                                            const sContaOrcamen       : String;
                                            const bMostraMsg          : Boolean;
                                            const bProcesso           : Boolean;
                                            var   sNomeConta          : String;
                                            var   sCodCentroRespon    : String;
                                            var   sNomeCentroRespon   : String;
                                            var   sCodGrupo           : String;
                                            var   sNomeGrupo          : String;
                                            var   sUnid               : String;
                                            var   sPPrev              : String;
                                            var   sCCusto             : String;
                                            var   sPatro              : String
                                           ): Integer;
var
   sSQL : String;
begin
   MessageInfo := '';

   sSQL :=
   'SELECT '                                                         +
   '   C.NOMECONTAORCAMEN,                                     '     +
   '   C.CODCENTRORESPON, R.CODEXTERNO, R.NOME, C.FLGATIVA,    '     +
   '   G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, C.TIPOCALCREALIZADO, '     +
   '   C.UNIDNEGOC, C.IDPLANOPREV, C.CODCENTROCUSTO, C.IDPATRO '     +
   'FROM '                                                           +
   '   CONTASORCAMEN C, '                                            +
   '   CENTRESPON    R, '                                            +
   '   GRUPOORCAMEN  G '                                             +
   'WHERE '                                                          +
   '        C.CODCENTRORESPON = R.CODCENTRORESPON(+) '               +
   '    AND C.IDPESSOA        = R.IDPESSOA(+) '                      +
   '    AND C.IDGRUPOORCAMEN  = G.IDGRUPOORCAMEN '                   +
   '    AND C.IDCONTAORCAMEN  = ' + QuotedStr(sContaOrcamen)         +
   '    AND C.IDPLANOORCAMEN  = ' + IntToStr(iPlanoOrc);

   with FCdsBuscaConta do
   begin
      Data :=GetDataPacket(sSQL);

      if isEmpty then
      begin
         if bMostraMsg then MessageInfo := 'Não existe conta com esse código.';

         Close;
         Result := 1;
         Exit;
      end;

      if FieldByName('FLGATIVA').asString = 'I' then
      begin
         if bMostraMsg then MessageInfo := 'Conta inativa.';

         Close;
         Result := 2;
         Exit;
      end;

      if not(FieldByName('CODCENTRORESPON').isNull) then
      begin
         if not(VerificaDotacao(FieldByName('CODCENTRORESPON').AsString)) then
         begin
            if bMostraMsg then MessageInfo := 'O Usuário corrente não tem permissão para fazer um ' +
                                              'Processo nessa Conta.';
            Close;
            Result := 3;
            Exit;
         end
         else
         begin
            sCodCentroRespon  := FieldByName('CODEXTERNO').asString;
            sNomeCentroRespon := FieldByName('NOME').asString;
            sNomeConta        := FieldByName('NOMECONTAORCAMEN').asString;
            sCodGrupo         := FieldByName('CODGRUPOORC').asString;
            sNomeGrupo        := FieldByName('NOMEGRUPOORCAMEN').asString;
            sUnid             := FieldByName('UNIDNEGOC').asString;
            sPPrev            := FieldByName('IDPLANOPREV').asString;
            sCCusto           := FieldByName('CODCENTROCUSTO').asString;
            sPatro            := FieldByName('IDPATRO').asString;
            Result            := 0;
         end;
      end
      else
      begin
         sCodCentroRespon  := '';
         sNomeCentroRespon := '';
         sNomeConta        := FieldByName('NOMECONTAORCAMEN').asString;
         sCodGrupo         := FieldByName('CODGRUPOORC').asString;
         sNomeGrupo        := FieldByName('NOMEGRUPOORCAMEN').asString;
         sUnid             := FieldByName('UNIDNEGOC').asString;
         sPPrev            := FieldByName('IDPLANOPREV').asString;
         sCCusto           := FieldByName('CODCENTROCUSTO').asString;
         sPatro            := FieldByName('IDPATRO').asString;
         Result            := 0;
      end;
   end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.ExibeSaldo                                                 }
{                                                                              }
{  Função que retorna o Saldo restante em uma dada conta orçamentária          }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   iContaOrcamen - conta orçamentária                                         }
{   sData - data de referência do saldo                                        }
{   sTipoSaldo- falge de tratamento do saldo                                   }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   Valor restante de saldo na conta                                           }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.ExibeSaldo(iPlanoOrc: Integer; sContaOrcamen, sData,
  sTipoSaldo: String): double;
Var
  iPeriodo    : Integer;
  sSQL        : String;

  iExercicio,
  Mes,
  Dia         : Word;

begin

  DecodeDate( StrToDate( sData ), iExercicio, Mes, Dia );

  iPeriodo   := EncontraPeriodo(sData);
  //Verifica a tabela de Saldos para ver se a reserva pode ser feita
  //com o Saldo corrente
  sSQL := 'SELECT SUM(VLRORCADO) AS VALOR1, ' +
          '       SUM(VLRCOMPROMETIDO) AS VALOR2, ' +
          '       SUM(VLRRESERVADO) AS VALOR3 ' +
          'FROM SALDOORCADO ' +
          'WHERE  (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND ' +
          '       (IDCONTAORCAMEN = ''' + sContaOrcamen + ''') AND ' +
          '       (IDPESSOA       = ' + IntToStr(idEmpresa) + ') AND ';
  case sTipoSaldo[1] of
    'P' : begin
          sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO = ' + IntToStr(iPeriodo) + ')';
          end;
    'E' : begin
          sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ')';
          end;
    'A' : begin
          sSQL := sSQL + '(EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
                         '(PERIODO <= ' + IntToStr(iPeriodo) + ')';
          end;
  end;
  with FCdsSaldos do begin
    Data := GetDataPacket(sSQL);
    Result := (FieldByName('VALOR1').asFloat - (FieldByName('VALOR2').asFloat +
               FieldByName('VALOR3').asFloat));
  end;
end;



{------------------------------------------------------------------------------}
{  TOrcamentoBackMT.VerificaSaldo                                              }
{                                                                              }
{  Função que retorna so existe ou não um registro de saldo na data            }
{                                                                              }
{  Parâmetros passados para a Função :                                         }
{                                                                              }
{   iPlanoOrc - plano orçamentário                                             }
{   iContaOrcamen - conta orçamentária                                         }
{   sData - data de referência do saldo                                        }
{                                                                              }
{  Resultados possíveis da Função :                                            }
{   true/false                                                                 }
{                                                                              }
{------------------------------------------------------------------------------}

function TOrcamentoBackMT.VerificaSaldo(iPlano   : Integer;
                                        sConta   : String;
                                        sData    : String
                                       ): Boolean;
var
   sSQL: String;
begin
   sSQL :=
   'SELECT '                                          + #13 +
   '   IDCONTAORCAMEN '                               + #13 +
   'FROM '                                            + #13 +
   '   SALDOORCADO '                                  + #13 +
   'WHERE '                                           + #13 +
   '       IDPLANOORCAMEN = ' + IntToStr(iPlano)      + #13 +
   '   AND IDCONTAORCAMEN = ''' + sConta + ''' '      + #13 +
   '   AND IDPESSOA       = ' + IntToStr(IDEmpresa)   + #13 +
   '   AND DATAREFERENCIA = TO_DATE(''' + sData + ''',''DD/MM/YYYY'')';

   with FCdsSaldos do
   begin
      Data := GetDataPacket(sSQL);
      if isEmpty then
      begin
         Result := False;
      end
      else
      begin
         Result := True;
      end;
   end;
end;



procedure TOrcamentoBackMT.AfterInitialize;
begin
   inherited;

   CReservaOrcamen.InitializeAs(self);
   CSaldoOrcado.InitializeAs(self);
   CResxComp.InitializeAs(self);
end;


// Função para buscar a Conta Orçamentária de uma Reserva ou Compromisso
function TOrcamentoBackMT.BuscaContaReservaCompromisso(
                          NumResOUComp: double): string;
var
  CdsAux : TClientDataSet;
  sSql: String;
begin
  try
    CdsAux := TClientDataSet.Create(nil);

    sSql := 'SELECT IDCONTAORCAMEN ' +
            '  FROM RESERVAORCAMEN ' +
            ' WHERE NUMRESERVA = ' + FloatToStr(NumResOUComp);

    CdsAux.Data := GetDataPacket(sSql);

    Result := CdsAux.FieldByName('IDCONTAORCAMEN').AsString;
  finally
    FreeAndNil(CdsAux);
  end;
end;

function TOrcamentoBackMT.UltimoDiaPeriodo(iExercicio,iPeriodo, iIdEmpresa: Integer): String;
var sSQL: String;
begin
  //Retorna o primeiro dia em um período
  sSQL := 'SELECT DATAFIMPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  = ' + IntToStr(iPeriodo) + ') AND ' +
          '(FLGBLOQUEADO = ''N'') AND ' + 
          '(IDPESSOA = ' + IntToStr(iIdEmpresa) + ')';
  with FCdsPeriodo do
  begin
    Data := GetDataPacket(sSQL);
    if isEmpty then
      result := ''
    else
      result := DateToStr(FieldByName('DATAFIMPERIODO').asDateTime);
  end;
end;

{
function TOrcamentoBackMT.ListaSubDespesas(AEmpresa: Integer; ATipoDesembolso: String; AFornecedor: Double): OleVariant;
begin
   ATipoDesembolso := Trim(ATipoDesembolso);

   //
   //if AEmpresa              <  1 Then Raise EOrcamentoBackMT.Create( 'Obrigatório informar a Empresa!'    );
   //if Trim(ATipoDesembolso) = '' Then Raise EOrcamentoBackMT.Create( 'Informe o Tipo de desembolso!'      );
   //if AFornecedor           <  1 Then Raise EOrcamentoBackMT.Create( 'Obrigatório informar o Fornecedor!' );
   //

   Result := GetDataPacket(' Select' +
                           '    D.SUBDESPESA,' +
                           '    D.IdDespesaOrc,' +
                           '    T.CodTiPrecDes,' +
                           '    T.Idgrupoorcamen,' +
                           '    G.CodGrupoOrc,' +
                           '    SubStr(G.CodGrupoOrc, 1, P.TamCod2) GrupoContas,' +
                           '    T.Codcentrocusto CentroCusto,' +
                           '    T.PlaConta,' +
                           '    SubStr(T.PlaConta, 4, 1) TipoDespesa,' +
                           //'    P.*,' +
                           '    D.IDFORNECEDOR,' +
                           '    T.IDTIPORDXCCXCONTA' +
                           ' From' +
                           '    Tipordxccxconta T,' +
                           '    DespesaOrcamentaria D,' +
                           '    GrupoOrcamen G,' +
                           '    Paramorcamento P' +
                           ' Where D.Idgrupoorcamen  = T.Idgrupoorcamen' +
                           '   And G.Idgrupoorcamen  = D.Idgrupoorcamen' +
                           '   And P.IDPESSOA        = d.idpessoa' +
                           '   And P.IDPLANOORCAMEN  = g.idplanoorcamen' +
                           '   And T.IdEmpresa       = ' + IntToStr(AEmpresa) +
                           '   And T.CodTiPrecDes    = ' + QuotedStr(ATipoDesembolso) +
                           '   And D.IDFORNECEDOR    = ' + FloatToStr(AFornecedor));


end;
}

function TOrcamentoBackMT.FDO(cdsDocumento,
                              cdsRateio,
                              cdsAlteradores: TClientDataSet): Boolean;
Var
  SaldoOrcado : TClientDataSet; //Saldo da conta do Plano Orçamentário
  Valor       : Double;
  Compromisso : Integer;
  pStrTipoDespesa  : string;
  strData : string; // Felipe A. Santos SOL 222959 KTN 2056456
begin
  if Operacao = 'A' then // SOL 230863 e 230956 PPM 374049 e 362016
     Compromisso := cdsRateio.FieldByName('IDRESERVAORCAMEN').AsInteger;


  Valor := 0;

  // Felipe A. Santos SOL 222959 KTN 2056456
  strData := EmptyStr;

  //MARCIO SANCHES SPINOSA SOL 222761 KINTANA 2056148 - Inicio
  //  if ((Sistema.Idmodulo = 21) and not(FormatDateTime('YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime) = '2013')) or
  //  (not (Sistema.IdModulo = 12) and not(FormatDateTime('YYYY', cdsDocumento.FieldByName('DATAEMISSAO').AsDateTime) = '2013'))
  //  or (Sistema.IdModulo = 12) and not(FormatDateTime('YYYY', cdsDocumento.FieldByName('DATALANCTO').AsDateTime) = '2013') then
  //MARCIO SANCHES SPINOSA SOL 222761 KINTANA 2056148 - Fim

  if (Sistema.IdModulo in [12,21,113]) then strData := 'LANCTO' else strData := 'EMISSAO';
  if not(FormatDateTime('YYYY', cdsDocumento.FieldByName('DATA' + strData).AsDateTime) = '2014') then  // Sol: 245727 PPM: 624627 Alterado o ano de 2013 para 2014, pois o sistema tenta encontrar parametrizações em 2014 e todas foram atualizada para 2015.
  // Felipe A. Santos SOL 222959 KTN 2056456- fim
  begin

  With cdsRateio do
    if cdsDocumento.FieldByName('RECPAG').AsString = 'P' Then
       Try
       //MARCIO SANCHES SPINOSA SOL : 172384/9603 - inicio
       if (Sistema.IdModulo = 113) then
       begin
          Edit;
          // Thiago Melo SOL 224456 Kintana 2057928
          //pStrTipoDespesa := Copy(cdsDocumento.FieldByName('PLACONTA').AsString, 3, 1);
          pStrTipoDespesa := Copy(cdsDocumento.FieldByName('PLACONTA').AsString, 4, 1);
          // Thiago Melo SOL 224456 Kintana 2057928
          FieldByName('TipoDespesa').value := pStrTipoDespesa;

          //William Santana SOL 199983 KIN 1967697

          FieldByName('IDPATRO').AsInteger     := FieldByName('IDPatroOrigem').AsInteger;
          FieldByName('IDPlanoPrev').AsInteger := FieldByName('IDPlanoOrigem').AsInteger;
          FieldByName('FLGOBRIGARESERVA' ).AsString   := GetFLGOBRIGARESERVA(opapDesembolso,FieldByName('CodTipRecDes').AsString);
          //END - William Santana SOL 199983 KIN 1967697

          Post;
       end;
       //MARCIO SANCHES SPINOSA SOL : 172384/9603 - Fim

          //SaldoOrcado.Data := Self.GetConta_SaldoOrcado(CdsDocumento.FieldByName( 'IDFORCLI'   ).AsFloat,
             SaldoOrcado := Self.GetConta_SaldoOrcado(CdsDocumento.FieldByName( 'IDFORCLI'   ).AsFloat,
                                                      CdsDocumento.FieldByName( 'DATALANCTO' ).AsDateTime,
                                                      opapDesembolso,
                                                      FieldByName( 'IDTIPORDXCCXCONTA' ).AsFloat,
                                                      FieldByName( 'CodTipRecDes'      ).AsString,
                                                      FieldByName( 'CODCENTROCUSTO'    ).AsString,
                                                      FieldByName( 'UnidNegoc'         ).AsInteger,
                                                      //Marcio Sanches Spinosa SOL: 200117 KINTANA: 1928539 - Inicio
//                                                      FieldByName( 'IDPlanoOrigem'     ).AsInteger,
//                                                      FieldByName( 'IDPatroOrigem'     ).AsInteger,
                                                      FieldByName( 'IDPlanoPrev'       ).AsInteger,
                                                      FieldByName( 'IDPatro'           ).AsInteger,
                                                      // Marcio Sanches Spinosa SOL: 200117 KINTANA: 1928539 - Fim
                                                      //FieldByName( 'IDPrograma'        ).AsInteger,
                                                      FieldByName( 'IDProgramaOrcamen' ).AsInteger,
                                                      FieldByName( 'IDDESPESAORC'      ).AsInteger,
                                                      FieldByName( 'TipoDespesa'       ).AsInteger
                                                     );
          Try
            //
            Valor := FieldByName('VALOR').AsFloat;

            // ALTERADOR //
            if cdsAlteradores <> Nil Then
               Try
                 FDO_ALTERADORES(Valor, CdsAlteradores, cdsRateio);
               Finally
                  // TRATAR...
               End;
            ////

            Self.FDO_AP(Valor,
                        CdsDocumento.FieldByName( 'DATALANCTO' ).AsDateTime,
                        SaldoOrcado,
                        Compromisso,
                        //William Santana SOL 199983 KIN 1967697
                        opapDesembolso,
                        FieldByName( 'CodTipRecDes'      ).AsString,
                        FieldByName( 'CODCENTROCUSTO'    ).AsString,
                        //END - William Santana SOL 199983 KIN 1967697
                        CdsDocumento.FieldByName('OBS').AsString,
                        cdsRateio); // Thiago Melo SOL 215854 Kintana 2044932



            // GRAVA [em cache] O COMPROMISSO NO RATEIO
            if Operacao <> 'A' then // SOL 230863 e 230956 PPM 374049 e 362016
            begin
              cdsRateio.Edit;
              cdsRateio.FieldByName('IDRESERVAORCAMEN').AsInteger := Compromisso;
              cdsRateio.Post;
            end;
            //

          Finally
            FreeAndNil( SaldoOrcado );
          End;
       Except
         //
         On EFDO : EProcessoFDO_GetContaSaldoOrcado do
            if VerificaObrigaFDO(cdsRateio) Then
               RAISE
            Else
              // PossuiGrupoOrcamen -> Indica que existe um relacionamento com
              //                       ALGUM grupo de contas do Orçamentomar, caso contrário,
              //                       irá emitir sempre o RAISE....
              if (cdsRateio.FindField('PossuiGrupoOrcamen')             <> Nil) AND
                 (cdsRateio.FieldByName('PossuiGrupoOrcamen').AsInteger  > 0  ) Then
                 RAISE;
         //
         On E : Exception do RAISE;
       End;
     end; //MARCIO SANCHES SPINOSA XXXXXX
end;

function TOrcamentoBackMT.GetConta_SaldoOrcado(AFornecedor         : Double;
                                               AData               : TDateTime;
                                               AOrigemParam        : TOrigemParamAP;
                                               AIDOrigemParam      : Double;
                                               ACodOrigem          : String; // Cod do Alterador/Desembolso
                                               ACODCENTROCUSTO     : String;
                                               AAtividade,
                                               APlanoPrevidenciario,
                                               APatrocinadora,
                                               AProgramaOrcamen,
                                               ASubDespesa         : Integer; //IDDespesaOrd
                                               ATipoDespesa        : Integer): TClientDataSet;
Const
  //_TABOrigemParamAP : Array[0..1] of String = ('TIPORDXCCXCONTA','XXX');

  _Param_TABOrigem           = ':TABOrigem_';
  _Param_TABOrigem_ID        = ':IDTABOrigem_';

  _Param_Fornec              = ':Forn_';
  _Param_Exercicio           = ':Exerc_';
  _Param_Periodo             = ':Periodo_';
  _Param_IDOrigemParam       = ':IDOrigemParam_';
  _Param_Atividade_UnidNeg   = ':Atividade_UnidNeg_';
  _Param_PlanoPrevidenciario = ':PlanoPrevidenciario_';
  _Param_Patrocinadora       = ':Patrocinadora_';
  _Param_Programa            = ':Programa_';
  _Param_TipoDespesa         = ':TipoDespesa_';
  _Param_SubDespesa          = ':SubDespesa_';
  _Param_IDSubDespesa        = ':IDSubDespesa_';
  _Param_SubDespesa_Select   = 'DUAL D,';
  _Param_SaldoAnual_Field    = '/***FSaldoAnual***/';


  _Select_SubDespesa         = '  (Select Desp.Iddespesaorc'
                             + '     From Despesaorcamentaria Desp'
                             + '    Where (Desp.Idfornecedor = ' + _Param_Fornec
                             + '       OR  Desp.Idfornecedor = -1 )'
                             + '      and Desp.IDdespesaORC = ' + _Param_IDSubDespesa
                             + '      and Desp.FLGSTATUSDESPESA = ''A'' ) D,';

  _Select_SaldoAnual         = '(Select Sum(S1.' + _Param_SaldoAnual_Field +' )'
                             + '   From SaldoOrcado S1'
                             + '  Where S1.IDPESSOA       = S.IDPESSOA '
                             + '    And S1.IDPLANOORCAMEN = S.IDPLANOORCAMEN'
                             + '    And S1.IDCONTAORCAMEN = S.IDCONTAORCAMEN'
                             + '    And S1.EXERCICIO      = S.EXERCICIO'
                             + '    And S1.Iddespesaorc   = S.Iddespesaorc )'
                             + ' ' + _Param_SaldoAnual_Field + '_Anual';

  _Select           = 'Select'
                    + '  C.Conta, C.FLGOBRIGARESERVA,'
                    // Campos Saldo Orçado
                    + '  S.idpessoa,     S.idplanoorcamen, S.idcontaorcamen, S.datareferencia,   S.exercicio,'
                    + '  S.periodo,      S.vlrrealizado,   S.vlrorcado,      S.vlrreservado,     S.vlrcomprometido,'
                    + '  S.vlrorcacum,   S.vlrrealacum,    S.flgsimulaativo, S.idcriterioratorc, S.percutilrateio,'
                    + '  S.vlrrateioori, S.vlrajuste,      S.vlrtransf,      S.iddespesaorc,     S.chaveaux, '
                    + _Param_SaldoAnual_Field
                    //
                    + '  From'
                    + '    Saldoorcado S,'
                    //+ '  -- Despesas do Fornecedor'
                    + '  ' + _Param_SubDespesa_Select
                    //+ '  -- Busca/Montagem da Conta'
                    + '  (Select'
                    + '     Distinct'
                    + '     ( Trim(RPAD('' '',P.Tamcod1 + 1 - Length(Trim(G.CODGRUPOORC)),''0''))||TRIM(G.CODGRUPOORC)'// -- GRUPO CONTAS'
                    + '     ||Trim(RPAD('' '',P.Tamcod2 + 1 - Length(Trim(CC.Codexterno)),''0''))||TRIM(CC.Codexterno)'// -- CENTRO CUSTO'
                    + '     ||Trim(RPAD('' '',P.Tamcod3 + 1 - Length(Trim(UN.CODORCAMEN)),''0''))||TRIM(UN.CODORCAMEN)'// -- Ativ. - Unid. Negocio'
                    + '     ||PPC.CODORCAMENTO'// -- Plano Previdenciario'
                    + '     ||PAT.Codorcamento'// -- Patrocinadora'
                    + '     ||'''' '//-- Centro de Responsabilidade'
                    + '     ||' + _Param_Programa// --PROGRAMA,'
                    + '     ||' + _Param_TipoDespesa + ' )'// -- Tipo Despesa'
                    + '     CONTA,'
                    + '     R.FlgObrigaReserva'
                    + '   From'
                    + '     Contasorcamen C,'
                    + '     GRUPOORCAMEN G,'
                    + '     Centcust CC,'
                    + '     Paramorcamento P,'
                    + '     unidnegocio UN,'
                    + '     (' + _Param_TABOrigem + ') R,'
                    + '     PlanPrevContabil PPC,'
                    + '     Patro Pat'
                    + '   Where C.Idgrupoorcamen       = G.Idgrupoorcamen'
                    + '     And C.IDPLANOORCAMEN       = G.idplanoorcamen'
                    //+ '     And C.Idtipo_Depesaorcamen = ' + _Param_TipoDespesa
                    + '     And R.'+ _Param_TABOrigem_ID + ' = ' + _Param_IDOrigemParam
                    + '     AND G.IDGRUPOORCAMEN       = R.IDGRUPOORCAMEN'
                    + '     AND C.CODCENTROCUSTO       = R.CODCENTROCUSTO'
                    //+ '     -- Parâmetros'
                    + '     And P.IDPESSOA             = C.idpessoa'
                    //+ '     And P.IDPLANOORCAMEN       = G.idplanoorcamen'    //Petri Nocentini SOL 245933 PPM 706854
                    //+ '     -- Centro de Custo'
                    + '     And CC.IdEmpresa           = C.Idempresa'
                    + '     And CC.Codcentrocusto      = C.CodCentroCusto'
                    //+ '     -- Plano Previdenciario'
                    + '     And PPC.Idplanoprev        = ' + _Param_PlanoPrevidenciario
                    //+ '     -- Patrocinadora'
                    + '     And Pat.Idpessoa           = ' + _Param_Patrocinadora
                    //+ '     ------'
                    + '     And UN.Unidnegoc = ' + _Param_Atividade_UnidNeg
                    + '     and UN.IDPESSOA  = c.IDPessoa'
                    + '  ) C'
                    + ' Where S.IDPESSOA       = 1'
                    + '   And S.EXERCICIO      = ' + _Param_Exercicio
                    + '   And S.PERIODO        = ' + _Param_Periodo
                    + '   And S.Iddespesaorc   = ' + _Param_SubDespesa
                    + '   And S.Idcontaorcamen = C.Conta';

Var
  _Sql               : String;
  _Sql_TABOrigem     : String;
  _Sql_TABOrigem_ID  : String;
  _Sql_IDOrigemParam : String;
  //
  _Sql_TipoDespesa      : String;
  _Sql_SubDespesa       : String;
  _Sql_SubDespesaSelect : String;
  //
  _Sql_SaldoAnual       : String;
  //
  Exercicio,
  Periodo         : Integer;
  //
  Erro            : String;
begin
  //Assert(Length(_TABOrigemParamAP) = Length(TOrigemParamAP), 'Verifique o tipo TOrigemParamAP em TOrcamentoBackMT -> UCtrlOrcamento');

  Exercicio := StrToIntDef(FormatDateTime('yyyy', AData), -1);
  Periodo   := StrToIntDef(FormatDateTime('mm',   AData), -1);
  //
  _Sql_IDOrigemParam := FloatToStr(AIDOrigemParam);
  //### Sub-Despesa ###//
  _Sql_SubDespesaSelect := '';
  _Sql_SubDespesa       := '-1';
  if ASubDespesa > 0 Then
  Begin
     _Sql_SubDespesa       := 'D.IDDESPESAORC';
     _Sql_SubDespesaSelect := _Select_SubDespesa;
  end;
  //

  //### Tipo de Despesa ###//
  if ATipoDespesa in [1,2] Then
     _Sql_TipoDespesa := IntToStr(ATipoDespesa)
  Else
     _Sql_TipoDespesa := 'SubStr(R.PLACONTA,4,1)';
  //

  // Busca o SQL Com os relacionamentos
  _Sql_TABOrigem     := GetSql_Parametrizacao(AOrigemParam);
  Case AOrigemParam of
    opapDesembolso: _Sql_TABOrigem_ID := 'IDTIPORDXCCXCONTA';
    opapAlterador : _Sql_TABOrigem_ID := 'IDALTXCCXPRGXCONTA';
  End;

  if AIDOrigemParam = 0 Then
  Begin
     _Sql_IDOrigemParam := 'R.'+_Sql_TABOrigem_ID;

    // Thiago Melo SOL 237792 PPM 494258
    if Sistema.IdModulo = 113 then begin
      _Sql_TABOrigem     := GetSql_Parametrizacao(AOrigemParam, ACodOrigem, ACODCENTROCUSTO, IntToStr(APlanoPrevidenciario));
    end else begin
      _Sql_TABOrigem     := GetSql_Parametrizacao(AOrigemParam, ACodOrigem, ACODCENTROCUSTO);
    end;
    //_Sql_TABOrigem     := GetSql_Parametrizacao(AOrigemParam, ACodOrigem, ACODCENTROCUSTO);
    // Thiago Melo SOL 237792 PPM 494258
  End;
  //
  _Sql_TABOrigem := _Sql_TABOrigem
                  + ' And NOT RT.IDGRUPOORCAMEN IS NULL '
                  ;
  ///
  //Marcio Sanches Spinosa SOL 210052 KTN 2025028 - Inicio
  _Sql_SaldoAnual := StringReplace(_Select_SaldoAnual, _Param_SaldoAnual_Field, 'VLRORCADO + NVL(S1.VLRTRANSF,0) + NVL(S1.VLRAJUSTE,0)',[]);

  //Saldo Anual
//  _Sql_SaldoAnual := StringReplace(_Select_SaldoAnual, _Param_SaldoAnual_Field, 'VLRORCADO',       [rfReplaceAll]) + ', '
//                   + StringReplace(_Select_SaldoAnual, _Param_SaldoAnual_Field, 'VLRREALIZADO',    [rfReplaceAll]) + ', '
//                   + StringReplace(_Select_SaldoAnual, _Param_SaldoAnual_Field, 'VLRCOMPROMETIDO', [rfReplaceAll]);

  _Sql_SaldoAnual := StringReplace(_Sql_SaldoAnual, _Param_SaldoAnual_Field, 'VLRORCADO',       [rfReplaceAll]) + ', '
                   + StringReplace(_Select_SaldoAnual, _Param_SaldoAnual_Field, 'VLRREALIZADO',    [rfReplaceAll]) + ', '
                   + StringReplace(_Select_SaldoAnual, _Param_SaldoAnual_Field, 'VLRCOMPROMETIDO', [rfReplaceAll]);
  //Marcio Sanches Spinosa SOL 210052 KTN 2025028 - Fim
  //

  //Try
    _Sql := _Select;
    //_Sql := StringReplace(_Sql, _Param_TABOrigem,           _TABOrigemParamAP[ORD(AOrigemParam)], [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_TABOrigem,           _Sql_TABOrigem   , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_TABOrigem_ID,        _Sql_TABOrigem_ID, [rfReplaceAll]);
    // _Sql_SubDespesaSelect -> Depende do parâmetro de fornecedor
    _Sql := StringReplace(_Sql, _Param_SubDespesa_Select,   _Sql_SubDespesaSelect          , [rfReplaceAll]);
    //
    _Sql := StringReplace(_Sql, _Param_Fornec,              FloatToStr(AFornecedor)        , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_Exercicio,           IntToStr(Exercicio)            , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_Periodo,             IntToStr(Periodo)              , [rfReplaceAll]);
    //
    _Sql := StringReplace(_Sql, _Param_IDOrigemParam,       _Sql_IDOrigemParam             , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_Atividade_UnidNeg,   IntToStr(AAtividade)           , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_PlanoPrevidenciario, IntToStr(APlanoPrevidenciario) , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_Patrocinadora,       IntToStr(APatrocinadora)       , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_Programa,            IntToStr(AProgramaOrcamen)     , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_TipoDespesa,         _Sql_TipoDespesa               , [rfReplaceAll]);
    _Sql := StringReplace(_Sql, _Param_SubDespesa,          _Sql_SubDespesa                , [rfReplaceAll]);

    if ASubDespesa > 0 Then // FELIPE SANTOS SOL 200875 KTN 1942499
       _Sql := StringReplace(_Sql, _Param_IDSubDespesa,     IntToStr(ASubDespesa)           , [rfReplaceAll]);

    //Saldo Anual
    _Sql := StringReplace(_Sql, _Param_SaldoAnual_Field,    _Sql_SaldoAnual                , [rfReplaceAll]);

    Result      := TClientDataSet.Create(Nil);
    Result.Data := GetDataPacket(_Sql);

    //William Santana SOL 199983 KIN 1967697
  //  Case Result.RecordCount of
  //    0: Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, ACodOrigem, 'Não existem contas orçamentárias para');
  //    1: Begin {Só permite uma conta} End;
  //  Else
  //    Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, ACodOrigem, 'Existem várias contas orçamentárias para');
  //  End;

    BuscaNomeCC_DescDesembolso(ACodOrigem , ACODCENTROCUSTO);
    Case Result.RecordCount of
      0: Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, DescDesembolso, NomeCentCust,
      'Não existe conta orçamentária relacionada ao tipo de');
      1: Begin {Só permite uma conta} End;
    Else
      Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, DescDesembolso, NomeCentCust,
      'Existe mais de uma conta orçamentária, relacionada ao tipo de');
    End;
   // END - William Santana SOL 199983 KIN 1967697
    {
    if Result.RecordCount <> 1 Then
    //Begin
       //FreeAndNil(Result);
       //Raise EProcessoFDO_Parametrizacao.Erro;
       Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, ACodOrigem);
    //End;
    }

end;
//William Santana SOL 199983 KIN 1967697
procedure TOrcamentoBackMT.BuscaNomeCC_DescDesembolso(ACodOrigem , ACODCENTROCUSTO : String);
begin

  CdsTrataErroFDO.data := GetDataPacket(' select c.Nome, d.Descricao from CENTCUST C, TIPORECEBDESEMB D ' +
                                         ' where c.codcentrocusto = '+ Acodcentrocusto +' and c.ativo = ''S''' +
                                         ' and d.codtiprecdes = '+ ACodOrigem  + ' and  recpag = ''P''');

  DescDesembolso := CdsTrataErroFDO.FieldByName('Descricao').AsString;
  NomeCentCust   := CdsTrataErroFDO.FieldByName('Nome').AsString;

end;
 // END - William Santana SOL 199983 KIN 1967697
procedure TOrcamentoBackMT.AtualizaSaldoOrcado(AValor : Double; ACDS: TClientDataSet; incVlr, DecVlr : Boolean); // Thiago Melo SOL 215854 Kintana 2044932
begin
  //ACDS.FieldByName( 'VLRCOMPROMETIDO' ).Asfloat + Avalor
  With ACDS do
    Try
      CSaldoOrcado.SetValueField('VLRCOMPROMETIDO',
                                 AVALOR,
                                 FieldByName( 'IDPESSOA'       ).AsInteger,
                                 FieldByName( 'IDPLANOORCAMEN' ).AsInteger,
                                 FieldByName( 'IDCONTAORCAMEN' ).AsString,
                                 FieldByName( 'DATAREFERENCIA' ).AsDateTime,
                                 FieldByName( 'CHAVEAUX'       ).AsFloat,
                                 // Thiago Melo SOL 215854 Kintana 2044932
                                 //True);
                                 incVlr,
                                 DecVlr);
                                 // Thiago Melo SOL 215854 Kintana 2044932
    Except
      RAISE;
    End;

end;

procedure TOrcamentoBackMT.CriaCompromisso(AValor          : Double;
                                           ADataLancto     : TDateTime;
                                           ACDS            : TClientDataSet;
                                           Var Compromisso : Integer;
                                           AObservacao     : String);
begin

  With ACDS do
    Try
      if Operacao <> 'A' then // SOL 230863 e 230956 PPM 374049 e 362016
      begin


        CReservaOrcamen.CriaCompromissoFDO(Compromisso,
                                           1,
                                           FieldByName( 'IDPLANOORCAMEN' ).AsInteger,
                                           FieldByName( 'IDCONTAORCAMEN' ).AsString,
                                           FieldByName( 'EXERCICIO'      ).AsInteger,
                                           FieldByName( 'PERIODO'        ).AsInteger,
                                           AValor,
                                           Sistema.IdModulo,
                                           ADataLancto,
                                           AObservacao
                                           );
    End
    else
    begin


      FCdsAux.data := GetDataPacket('select FLGRESERVA from RESERVAORCAMEN where idRESERVAORCAMEN = '+ inttostr(Compromisso) ); // SOL 230863 e 230956 PPM 374049 e 362016


      CReservaOrcamen.AtualizaValorCompromissoOrcamento(AValor,
                                               FCdsAux.FieldByName('FLGRESERVA').AsString,
                                               Compromisso);

    end;

    Except
         RAISE;
    End;
end;

function TOrcamentoBackMT.VerificaObrigaFDO(ACDS: TClientDataSet): Boolean;
begin
    Result := ACDS.FieldByName('FLGOBRIGARESERVA').AsString = 'S';
end;

function TOrcamentoBackMT.VerificaSaldoOrcado(AValor : Double; ACDS : TClientDataSet): Boolean;
begin
 // adicionado o RoundCm por conta da dizima computacional SOL 246363 PPM 634905
  Result := RoundCM(ACDS.FieldByName( 'VLRORCADO_ANUAL' ).Asfloat,2) >=
          RoundCM(( AVALOR
          + ACDS.FieldByName( 'VLRREALIZADO_ANUAL'    ).Asfloat
          //+ ACDS.FieldByName( 'VLRRESERVADO'    ).Asfloat
          + ACDS.FieldByName( 'VLRCOMPROMETIDO_ANUAL' ).Asfloat),2);
end;

procedure TOrcamentoBackMT.FDO_AP(AValor          : Double;
                                  ADataLancto     : TDateTime;
                                  ACDS            : TClientDataSet;
                                  Var Compromisso : Integer;
                                 // William Santana SOL 199983 KIN 1967697
                                  AOrigemParam        : TOrigemParamAP;
                                  ACodOrigem          : String;
                                  ACODCENTROCUSTO     : String;
                                 // END - William Santana SOL 199983 KIN 1967697
                                  AObservacao     : String;
                                  cdsRateio       : TClientDataSet // Thiago Melo SOL 203547 Kintana 1970091
                                  );

  var
    dif : Double;  // Thiago Melo SOL 203547 Kintana 1970091

  Procedure RealizaFDO_AP;
  Begin
    Try
      CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);
      AtualizaSaldoOrcado(AValor, ACDS);
    Except
      RAISE;
    End;
  End;

  // Thiago Melo SOL 203547 Kintana 1970091 Ini

  // Verifica se o rateio foi alterado
  function rateioDiferente (cdsRateio : TClientDataSet; vlrRateio : Double) : Boolean;
  var
    _cds : TClientDataSet;
    _sql : String;
  begin

    try
      Result := False;

      _sql := ' SELECT R.CODCENTRORESPON, R.CODCENTROCUSTO, R.IDPROGRAMA, R.IDDESPESAORC, ' +
              '        R.VALOR, R.IDPATROORIGEM, R.IDPLANOORIGEM, R.CODTIPRECDES ' +
              '   FROM CM.RATEIODOCUM R ' +
              '  WHERE R.IDRATEIODOCUM = ' + FloatToStr(CdsRateio.FieldByName('IDRATEIODOCUM').AsFloat);

      _cds      := TClientDataSet.Create(Nil);
      _cds.Data := GetDataPacket(_Sql);

      try
        if Trim(_cds.FieldByName('CODCENTRORESPON').AsString) <> Trim(cdsRateio.FieldByName('CODCENTRORESPON').AsString) then begin
          Result := True;
          Exit;
        end;

        if Trim(_cds.FieldByName('CODCENTROCUSTO').AsString) <> Trim(cdsRateio.FieldByName('CODCENTROCUSTO').AsString) then begin
          Result := True;
          Exit;
        end;

        if _cds.FieldByName('IDPROGRAMA').AsFloat <> cdsRateio.FieldByName('IDPROGRAMA').AsFloat then begin
          Result := True;
          Exit;
        end;

        if _cds.FieldByName('IDDESPESAORC').AsFloat <> cdsRateio.FieldByName('IDDESPESAORC').AsFloat then begin
          Result := True;
          Exit;
        end;

        if _cds.FieldByName('VALOR').AsFloat <> vlrRateio then begin
          Result := True;
          Exit;
        end;

        if _cds.FieldByName('IDPATROORIGEM').AsFloat <> cdsRateio.FieldByName('IDPATROORIGEM').AsFloat then begin
          Result := True;
          Exit;
        end;

        if _cds.FieldByName('IDPLANOORIGEM').AsFloat <> cdsRateio.FieldByName('IDPLANOORIGEM').AsFloat then begin
          Result := True;
          Exit;
        end;

        if (_cds.FieldByName('CODTIPRECDES').AsString) <> Trim(cdsRateio.FieldByName('CODTIPRECDES').AsString) then begin
          Result := True;
          Exit;
        end;
      finally
        FreeAndNil(_cds);
      end;
    except
      Result := True;
    end;
  end;

  function Truncar(Valor: double; Casas: integer): double;
  var
    dFator: double;
  begin
    dFator := IntPower(10, Casas);
    Result := Trunc(Valor * dFator) / dFator;
  end;

  function diferencaValorRateio (cdsRateio : TClientDataSet; vlrRateio : Double) : Double;
  var
    _cds : TClientDataSet;
    _Sql : String;
    _diferenca : Double;

    vlr : Double;
  begin
    _sql := ' SELECT R.VALOR ' +
            '   FROM CM.RATEIODOCUM R ' +
            '  WHERE R.IDRATEIODOCUM = ' + FloatToStr(CdsRateio.FieldByName('IDRATEIODOCUM').AsFloat);

    _cds      := TClientDataSet.Create(Nil);
    _cds.Data := GetDataPacket(_Sql);

    vlr := _cds.FieldByName('VALOR').AsFloat; // Thiago Melo SOL 215854 Kintana 2044932

    try
      if Truncar(vlr, 2) <> Truncar(vlrRateio, 2) then begin // Thiago Melo SOL 215854 Kintana 2044932
        _diferenca := vlrRateio - vlr;
        // Se a diferenca for positiva, a verificação de saldo (fdo) deve ser realizada; caso contrario subtrair valor comprometido na tabela SaldoOrçado
      end else begin
        _diferenca := 0;
      end;

      Result := _diferenca;

    finally
      FreeAndNil(_cds);
    end;
  end;

  // Thiago Melo SOL 203547 Kintana 1970091 Fim

begin
  //Assert( --'FLGOBRIGARESERVA' existe o campo

  // Thiago Melo SOL 203547 Kintana 1970091 ini
  Try
    if VerificaObrigaFDO(ACDS) Then
    Begin
       if cdsRateio.FieldByName('IDRATEIODOCUM').AsFloat > 0 then begin
         // Correção
         if rateioDiferente(cdsRateio, AValor) then begin
           dif := diferencaValorRateio (cdsRateio, AValor);
           if dif > 0 then begin
             if VerificaSaldoOrcado(dif, ACDS) Then
             Begin
               // somar valor do compromisso
               CriaCompromisso(dif, ADataLancto, ACDS, Compromisso, AObservacao);
               AtualizaSaldoOrcado(dif, ACDS);
             end else begin
               // William Santana SOL 199983 KIN 1967697
                 Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, DescDesembolso, NomeCentCust,
                 'Não existe saldo para a conta orçamentária, relacionado ao tipo de');
              // Raise EProcessoFDO_SaldoInsuficiente.Erro;
              // William Santana SOL 199983 KIN 1967697
             end;
           end else begin
             if dif < 0 then begin
               // subtrair valor do compromisso
               CriaCompromisso(dif, ADataLancto, ACDS, Compromisso, AObservacao);    // SOL 230863 e 230956 PPM 374049 e 362016
               AtualizaSaldoOrcado(dif, ACDS); // SOL 230863 e 230956 PPM 374049 e 362016
             end else begin
               // valor do rateio mantido, porem informações do rateio alteradas
               if VerificaSaldoOrcado(AValor, ACDS) Then
               begin
                 CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);
                 AtualizaSaldoOrcado(AValor, ACDS);
               end else begin
                // William Santana SOL 199983 KIN 1967697
                 Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, DescDesembolso, NomeCentCust,
                'Não existe saldo para a conta orçamentária, relacionado ao tipo de');
                // Raise EProcessoFDO_SaldoInsuficiente.Erro;
                // William Santana SOL 199983 KIN 1967697
               end;
             end;
           end;
         end else begin
           // Não houveram alterações em informações ou valores do rateio
         //  CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);
         end;
       end else begin
         // Inclusão
         if VerificaSaldoOrcado(AValor, ACDS) Then
         Begin
           //RealizaFDO_AP;
           CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);
           AtualizaSaldoOrcado(AValor, ACDS);
         end Else begin
           // William Santana SOL 199983 KIN 1967697
           Raise EProcessoFDO_GetContaSaldoOrcado.Erro(AOrigemParam, DescDesembolso, NomeCentCust,
           'Não existe saldo para a conta orçamentária, relacionado ao tipo de');
           // Raise EProcessoFDO_SaldoInsuficiente.Erro;
           // William Santana SOL 199983 KIN 1967697
         end;
       end;
    end Else
    //MARCIO SANCHES SPINOSA SOL 223059 KINTANA 2056404 - Inicio
//        CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);
       RealizaFDO_AP;
     ////MARCIO SANCHES SPINOSA SOL 223059 KINTANA 2056404 - Fim  
  Except
    RAISE;
  End;

  {Try
    if VerificaObrigaFDO(ACDS) Then
    Begin
       if VerificaSaldoOrcado(AValor, ACDS) Then
       Begin
          //RealizaFDO_AP;
          CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);
          AtualizaSaldoOrcado(AValor, ACDS);
       end Else
          Raise EProcessoFDO_SaldoInsuficiente.Erro;
    end Else
       //RealizaFDO_AP;
       CriaCompromisso(AValor, ADataLancto, ACDS, Compromisso, AObservacao);

  Except
    RAISE;
  End;}

  // Thiago Melo SOL 203547 Kintana 1970091 Fim
end;

{ EProcessoFDO_SaldoInsuficiente }

constructor EProcessoFDO_SaldoInsuficiente.Erro;
begin
  Inherited Create(GetMessage);
end;


function TOrcamentoBackMT.ListaSubDespesas(AOrigemParam    : TOrigemParamAP;
                                           AIDOrigemParam  : String;
                                           AFornecedor     : Double;
                                           ACodCentroCusto : String;
                                           AEmpresa        : Integer;
                                           ATipoDespesa    : Integer): OleVariant;
Const
  ///
  _PARAM_ID               = ':ID_';
  //_PARAM_Fornecedor  = ':Fornecedor_';
  _PARAM_Empresa          = ':Empresa_';
  _PARAM_ObrigaSubDespesa = ':ObrigatorioInformar';

  ///
  _Select_Alterador  = 'Select'
                     + '   D.SUBDESPESA,'
                     + '   CASE WHEN F.RAZAOSOCIAL IS NULL'
                     + '        THEN D.SUBDESPESA'
                     + '        ELSE F.RAZAOSOCIAL || '' - '' || D.SUBDESPESA'
                     + '   END DESCSUBDESPESA,'
                     + '   D.IdDespesaOrc,'
                     + '   R.idaltxccxprgxconta,'
                     + '   R.codalterador,'
                     + '   R.plano,'
                     + '   R.placonta,'
                     + '   R.idprograma,'
                     + '   R.idempresa,'
                     + '   R.codcentrocusto,'
                     + '   R.trgdtinclusao,'
                     + '   R.trguserinclusao,'
                     + '   R.Idgrupoorcamen,'
                     + '   T.CodAlterador,'
                     + '   NVL(T.FLGOBRIGARESERVA, ''N'') FLGOBRIGARESERVA,'
                     + '   R.Codcentrocusto CentroCusto,'
                     + '   R.PlaConta,'
                     + '   SubStr(R.PlaConta, 4, 1) TipoDespesa,'
                     + '   P.IDProgramaOrcamen,'
                     + '   ' + #39 + _PARAM_ObrigaSubDespesa + #39 + ' Validar'
                     + ' From'
                     + '   ALTXCCXPRGXCONTA R,'
                     + '   TIPOALTERADOR T,'
                     + '   DespesaOrcamentaria D,'
                     + '   GrupoOrcamen G,'
                     + '   Programa P,'
                     + '   PESSOA F' //FORNECEDOR
                     + ' Where T.Codalterador     = ' + _PARAM_ID
                     + '   And R.Codalterador     = T.Codalterador'
                     + '   And G.Idgrupoorcamen   = R.IDGrupoOrcamen'
                     + '   And D.Idgrupoorcamen   = G.IDGrupoOrcamen'
                     //+ '   And D.IDFORNECEDOR     = ' + _PARAM_Fornecedor
                     + '   And F.IDPESSOA(+)      = D.IDFORNECEDOR'
                     + '   And D.FLGSTATUSDESPESA = ''A'' '
                     + '   And P.IDPrograma(+)    = R.IDPROGRAMA'
                     ;
   ///
  _Select_Desembolso = ' Select'
                     + '    D.SUBDESPESA,'
                     + '    CASE WHEN F.RAZAOSOCIAL IS NULL'
                     + '         THEN D.SUBDESPESA'
                     + '         ELSE F.RAZAOSOCIAL || '' - '' || D.SUBDESPESA'
                     + '    END DESCSUBDESPESA,'
                     + '    D.IdDespesaOrc,'
                     + '    R.CodTiPrecDes,'
                     + '    R.Idgrupoorcamen,'
                     + '    G.CodGrupoOrc,'
                     + '    SubStr(G.CodGrupoOrc, 1, P.TamCod2) GrupoContas,'
                     + '    R.Codcentrocusto CentroCusto,'
                     + '    R.PlaConta,'
                     + '    SubStr(R.PlaConta, 4, 1) TipoDespesa,'
                     + '    D.IDFORNECEDOR,'
                     + '    R.IDTIPORDXCCXCONTA,'
                     + '   ' + #39 + _PARAM_ObrigaSubDespesa + #39 + ' Validar'
                     + ' From'
                     + '    Tipordxccxconta R,'
                     + '    DespesaOrcamentaria D,'
                     + '    GrupoOrcamen G,'
                     + '    Paramorcamento P,'
                     + '    PESSOA F' //FORNECEDOR
                     + ' Where D.Idgrupoorcamen   = R.Idgrupoorcamen'
                     + '   And G.Idgrupoorcamen   = D.Idgrupoorcamen'
                     + '   And P.IDPESSOA         = d.idpessoa'
                     //+ '   And P.IDPLANOORCAMEN   = g.idplanoorcamen' // Felipe A. Santos SOL 222646/15537 KTN 2055923
                     + '   And R.IdEmpresa        = ' + _PARAM_Empresa
                     + '   And R.CodTiPrecDes     = ' + #39 + _PARAM_ID + #39
                     + '   And F.IDPESSOA(+)      = D.IDFORNECEDOR'
                     //+ '   And D.IDFORNECEDOR     = ' + _PARAM_Fornecedor
                     + '   And D.FLGSTATUSDESPESA = ''A'' '
                     ;
////////
Var
  _Sql : String;
begin

  Case AOrigemParam of
    opapDesembolso:
      Begin
        _Sql := _Select_Desembolso;

        // ### CENTRO DE CUSTO ### //
        if Trim(ACodCentroCusto) <> '' Then
           _Sql := _Sql + ' AND R.CodCentroCusto = ' + QuotedStr(ACodCentroCusto);

       //MARCIO SANCHES SPINOSA SOL 217591 KINTANA 2048632 - Inicio
        if (Sistema.IdModulo = 3) then
           _Sql := _Sql + ' AND R.RECPAG  = ''P''';
       //MARCIO SANCHES SPINOSA SOL 217591 KINTANA 2048632 - Fim    

      End;
    opapAlterador : _Sql := _Select_Alterador;
  end;

  _Sql := StringReplace(_Sql, _PARAM_ID,         AIDOrigemParam          , [rfReplaceAll]);
  //_Sql := StringReplace(_Sql, _PARAM_Fornecedor, FloatToStr(AFornecedor ), [rfReplaceAll]);
  _Sql := StringReplace(_Sql, _PARAM_Empresa,    FloatToStr(AEmpresa    ), [rfReplaceAll]);

  //

  // ### FORNECEDOR ### //
  if AFornecedor > 0 Then
  Begin
     _Sql := _Sql + ' And (D.IDFORNECEDOR = ' + FloatToStr(AFornecedor)
                  + '  OR  D.IDFORNECEDOR = -1)';

     _Sql := StringReplace(_Sql, _PARAM_ObrigaSubDespesa, 'S', [rfReplaceAll]);
  end else
  Begin
     _Sql := _Sql + ' And D.IDFORNECEDOR = -1';

     _Sql := StringReplace(_Sql, _PARAM_ObrigaSubDespesa, 'N', [rfReplaceAll]);
  end;
  //

  if ATipoDespesa in [1,2] Then
     _Sql := _Sql + ' And SubStr(R.PlaConta, 4, 1) = ' + IntToStr(ATipoDespesa);


  Result := GetDataPacket(_SQL);
  
end;

function TOrcamentoBackMT.ListaRateio(ACodDocumento: Double): OleVariant;
Const
  //
  _PARAM_DOCUMENTO   = ':CODDOCUMENTO';
  //
  _Select            = 'SELECT'
                     + '   R.IDRATEIODOCUM,'
                     + '   D.IDFORCLI,'
                     //+ '   D.DATAVENCTO,'
                     + '   L.DATALANCTO,'
                     //+ '  --
                     + '   R.UnidNegoc,'
                     + '   R.IDPlanoOrigem,'
                     + '   R.IDPatroOrigem,'
                     + '   R.IDPlanoPrev,' // SOL 200328 KINTANA 1930483 // SOL 200387 KINTANA 1931060
                     + '   R.IDPatro,' // SOL 200328 KINTANA 1930483 // SOL 200387 KINTANA 1931060
                     + '   R.IDPrograma,'
                     + '   D.Plano,' // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                     + '   R.CODDOCUMENTO,'
                     + '   R.CODTIPRECDES,'
                     + '   R.CODCENTROCUSTO,'
                     + '   R.CODCENTRORESPON,'
                     + '   R.RECPAG,'
                     + '   0 as IDRATEIO_ORCAMENTO,'
                     + '   T.DESCRICAO DESC_RATEIO_ORCAMENTO,'
                     + '   NVL(R.IDDESPESAORC, -1) IDDESPESAORC,'
                     + '   NVL(T.FLGOBRIGARESERVA, ''N'') FLGOBRIGARESERVA,'
                     + '   0 as IDTIPORDXCCXCONTA,'
                     + '   R.IDRESERVAORCAMEN,'
                     + '   R.VALOR,'
                     + '   P.IDPROGRAMAORCAMEN,'
                     + '   0 as TipoDespesa,'
                     + '   ''          '' CentroCusto,'
                     + '   D.OBS, ' //MARCIO SANCHES SPINOSA SOL : 172384/9603
                     + '   0 AS PossuiGrupoOrcamen'
                     + ' FROM'
                     + '   DOCUMENTO D,'
                     + '   LANCTODOCUM L,'
                     + '   RATEIODOCUM R,'
                     + '   TIPORECEBDESEMB T,'
                     + '   PROGRAMA P'
                     + ' WHERE (D.CODDOCUMENTO = ' + _PARAM_DOCUMENTO + ')'
                     + '   AND (R.CODDOCUMENTO = D.CODDOCUMENTO)'
                     //
                     + '   AND (L.CODDOCUMENTO = D.CODDOCUMENTO)'
                     + '   AND (L.OPERACAO     = 2)'
                     //+ '   AND (R.RecPag       = ''P'' )'
                     + '   AND (T.CODTIPRECDES  = R.CODTIPRECDES)'
                     + '   AND (T.RECPAG        = R.RECPAG)'
                     + '   AND (T.IDPESSOA      = R.IDPESSOA)'
                     + '   AND (P.IDPROGRAMA(+) = R.IDPrograma)'
                     ;
  //
Var
  _Sql : String;
begin

  _Sql := StringReplace(_Select, _PARAM_DOCUMENTO, FloatToStr(ACodDocumento), [rfReplaceAll]);

  Result := GetDataPacket(_SQL);

end;

(*
{Procedure TOrcamentoBackMT.FDO_Alteradores(VAR AValor             : Double;
                                               ACDS                : TClientDataSet;
                                               AIDRATEIODOCUM      : Double;
                                               AIDRATEIO_ORCAMENTO : integer);}
Procedure TOrcamentoBackMT.FDO_Alteradores(var AValor              : Double;         // Valor a ser atualizado
                                               ACdsAlteradores     : TClientDataSet; // Cds do Alterador
                                               ACdsRateio          : TClientDataSet;
                                               ACdsAlteradoresOUT : TClientDataSet);
begin

  ACdsAlteradoresOUT.CloneCursor(ACdsAlteradores, FALSE);

  With ACdsAlteradoresOUT do
    //if VerificaObrigaFDO(ACDS) AND
    //   Locate('IDRATEIO_ORCAMENTO', AIDRATEIO_ORCAMENTO, []) Then
    if VerificaObrigaFDO(ACDS) Then
    Begin
       Try
         {Filtered := False;
         //Filter   := 'IDRATEIO_ORCAMENTO = ' + IntToStr(AIDRATEIO_ORCAMENTO);
         Filter   := 'IDRATEIO_ORCAMENTO = ' +  ACdsRateio.FieldByName('AIDRATEIO_ORCAMENTO').AsString;
         Filtered := True;}

         First;

         While Not EOF do
            if FieldByName('IDRATEIO_ORCAMENTO').AsString <> ACdsRateio.FieldByName('AIDRATEIO_ORCAMENTO').AsString Then
               Delete//Elimina do DataSet de Retorno pois não é do mesmo rateio referenciado
            else if (FieldByName('TipoDespesa').AsString = ACdsRateio.FieldByName('TipoDespesa').AsString) AND
                    (FieldByName('CentroCusto').AsString = ACdsRateio.FieldByName('CentroCusto').AsString) Then
                 Begin
                    Case FieldByName('ACRESDECRES').AsString[1] OF
                      'D': AValor := AValor + FieldByName('VALOR').AsFloat;
                      'C': AValor := AValor - FieldByName('VALOR').AsFloat;
                    End;

                    NEXT;
                 end else
                    NEXT;


       Finally
         Filtered := False;
       End;

       //Grava o Rateio nos Alteradores [LANCTODOCUM]
       With FieldByName('IDRATEIODOCUM') do
         if AsFloat <> ACdsRateio.FieldByName('IDRATEIODOCUM').AsFloat Then
         Begin
            Edit;
            //AsFloat := AIDRATEIODOCUM;
            AsFloat := ACdsRateio.FieldByName('IDRATEIODOCUM').AsFloat;
            Post;
         End;
       //
    End;

end;*)

{
Procedure TOrcamentoBackMT.FDO_Alteradores(var AValor             : Double;
                                               ACdsAlteradores    : TClientDataSet;
                                               ACdsRateio         : TClientDataSet;
                                               ACdsAlteradoresOUT : TClientDataSet;
                                               AForcaAlterarValor : Boolean);
begin

  // Altera e retorna o valor com o alterador quando o rateio e o alterador são da mesma conta
  // ACdsAlteradoresOUT -> retorna com os registros que são de outra conta orçamentária
  ACdsAlteradoresOUT.CloneCursor(ACdsAlteradores, FALSE);
  ACdsAlteradoresOUT.First;

  With ACdsAlteradoresOUT do
    if VerificaObrigaFDO(ACdsAlteradoresOUT) Then
       While Not EOF do
          if FieldByName('IDRATEIO_ORCAMENTO').AsString <> ACdsRateio.FieldByName('IDRATEIO_ORCAMENTO').AsString Then
          Begin
             Delete;//Elimina do DataSet de Retorno pois não é do mesmo rateio referenciado
          end else
          Begin
             if (AForcaAlterarValor)                                                                     OR
                ((FieldByName('TipoDespesa').AsString = ACdsRateio.FieldByName('TipoDespesa').AsString)  AND
                 (FieldByName('CentroCusto').AsString = ACdsRateio.FieldByName('CentroCusto').AsString)) Then
                Case FieldByName('ACRESDECRES').AsString[1] OF
                   'D': AValor := AValor + FieldByName('VALOR').AsFloat;
                   'C': AValor := AValor - FieldByName('VALOR').AsFloat;
                End;

             NEXT;
          End;


  // ARAMAZENA O ID DO RATEIO NO ALTERADOR
  With ACdsAlteradores do
    if VerificaObrigaFDO(ACdsAlteradores) Then
       While Not EOF do
       Begin
          //Grava o Rateio nos Alteradores [LANCTODOCUM]
          With FieldByName('IDRATEIODOCUM') do
            if AsFloat <> ACdsRateio.FieldByName('IDRATEIODOCUM').AsFloat Then
            Begin
               Edit;
               AsFloat := ACdsRateio.FieldByName('IDRATEIODOCUM').AsFloat;
               Post;
            End;
          //
          NEXT;
       End;//While Not EOF do

end;
}


Procedure TOrcamentoBackMT.FDO_Alteradores(var AValor             : Double;
                                               ACdsAlteradores    : TClientDataSet;
                                               ACdsRateio         : TClientDataSet;
                                               AForcaAlterarValor : Boolean);
Var
  SaldoOrcado,
  ContasDiferentes : TClientDataSet;
begin

  // Altera e retorna o valor com o alterador quando o rateio e o alterador são da mesma conta
  ContasDiferentes := TClientDataSet.Create(Nil);
  Try
    ContasDiferentes.CloneCursor(ACdsAlteradores, FALSE);
    ContasDiferentes.First;

    //### IDENTIFICANDO QUAIS ALTERADORES POSSUEM CONTAS DIFERENTES ###//
    With ContasDiferentes do
      if VerificaObrigaFDO(ContasDiferentes) Then//MARCIO SANCHES SPINOSA SOL 217591 KINTANA 2048632
         While Not EOF do
            if FieldByName('IDRATEIO_ORCAMENTO').AsString <> ACdsRateio.FieldByName('IDRATEIO_ORCAMENTO').AsString Then
            Begin
               Delete;//Elimina do DataSet de Retorno pois não é do mesmo rateio referenciado
            end else
            Begin
               //Grava o Rateio nos Alteradores [LANCTODOCUM]
               With FieldByName('IDRATEIODOCUM') do
                 if AsFloat <> ACdsRateio.FieldByName('IDRATEIODOCUM').AsFloat Then
                 Begin
                    Edit;
                    AsFloat := ACdsRateio.FieldByName('IDRATEIODOCUM').AsFloat;
                    Post;
                 End;
               //
               //if (AForcaAlterarValor) OR
               //   ((FieldByName('TipoDespesa').AsString = ACdsRateio.FieldByName('TipoDespesa').AsString)  AND
               //    (FieldByName('CentroCusto').AsString = ACdsRateio.FieldByName('CentroCusto').AsString)) Then
                  Case FieldByName('ACRESDECRES').AsString[1] OF
                     'C': AValor := AValor + FieldByName('VALOR').AsFloat;
                     'D': AValor := AValor - FieldByName('VALOR').AsFloat;
                  End;
               //
               NEXT;
            End;

    //
    {
    //SALDO ORCADO DE ALTERADORES COM CONTAS DIFERENTES
    ContasDiferentes.First;
    Try
      While NOT ContasDiferentes.EOF DO
      Begin
         ///SaldoOrcado := TClientDataSet.Create(Nil);
         Try
           SaldoOrcado := Self.GetConta_SaldoOrcado(AcdsRateio.FieldByName( 'IDFORCLI'      ).AsFloat,
                                                    //AcdsRateio.FieldByName( 'DATAVENCTO'    ).AsDateTime,
                                                    AcdsRateio.FieldByName( 'DATALANCTO'    ).AsDateTime,
                                                    opapAlterador,
                                                    ContasDiferentes.FieldByName( 'idaltxccxprgxconta' ).AsFloat,
                                                    ContasDiferentes.FieldByName( 'codalterador'       ).AsString,
                                                    AcdsRateio.FieldByName( 'CODCENTROCUSTO' ).AsString,
                                                    AcdsRateio.FieldByName( 'UnidNegoc'      ).AsInteger,
                                                    AcdsRateio.FieldByName( 'IDPlanoOrigem'  ).AsInteger,
                                                    AcdsRateio.FieldByName( 'IDPatroOrigem'  ).AsInteger,
                                                    //AcdsRateio.FieldByName( 'IDPrograma'     ).AsInteger,
                                                    AcdsRateio.FieldByName( 'IDProgramaOrcamen' ).AsInteger,
                                                    AcdsRateio.FieldByName( 'IDDESPESAORC'      ).AsInteger
                                                   );
           //
           With ContasDiferentes do
             if VerificaSaldoOrcado(AValor, SaldoOrcado) Then
                AtualizaSaldoOrcado(FieldByName('VALOR').AsFloat, SaldoOrcado)
             Else
                Raise EProcessoFDO_SaldoInsuficiente.Erro(opapAlterador,
                                                          FieldByName('codalterador').AsString);
           //
         Finally
           FreeAndNil(SaldoOrcado);
         End;
         //
         ContasDiferentes.NEXT;
      End;//While NOT ContasDiferentes.EOF DO
    Except
      RAISE;
    End;
    //
    }
  Finally
    FreeAndNil(ContasDiferentes);
  End;

end;

function TOrcamentoBackMT.FDO(cdsRateio,
                              cdsAlteradores: TClientDataSet;
                              ALancUnicoAlterador : Boolean = TRUE): Boolean;
var
  //Vander Campos - SOL: 172384/9603 - KINTANA: 1661662
  Valor                        : Double;
  SaldoOrcado                  : TClientDataSet;
  CdsAlteradoresContaDiferente : TClientDataSet; // Nunca deve ter registro no retorno nesta função
Begin
  if NOT VerificaObrigaFDO(cdsAlteradores) THEN EXIT;

  CdsAlteradoresContaDiferente := TClientDataSet.Create(Nil);
  Try
    Valor := 0;
    //FDO_Alteradores(Valor, CdsAlteradores, CdsRateio, CdsAlteradoresContaDiferente, ALancUnicoAlterador);
    //FAZER BUSCA AS INFORMAÇÔES DE RATEIO PARA COMPARAR A DESPESA E CENTRO DE CUSTO
    FDO_Alteradores(Valor, CdsAlteradores, CdsRateio, ALancUnicoAlterador);

    Try
      //
      SaldoOrcado := Self.GetConta_SaldoOrcado(cdsRateio.FieldByName( 'IDFORCLI'      ).AsFloat,
                                               //cdsRateio.FieldByName( 'DATAVENCTO'    ).AsDateTime,
                                               cdsRateio.FieldByName( 'DATALANCTO'    ).AsDateTime,
                                               opapAlterador,
                                               cdsAlteradores.FieldByName( 'idaltxccxprgxconta' ).AsFloat,
                                               cdsAlteradores.FieldByName( 'codalterador'       ).AsString,
                                               cdsAlteradores.FieldByName( 'CODCENTROCUSTO'     ).AsString,
                                               cdsRateio.FieldByName( 'UnidNegoc'     ).AsInteger,
                                               cdsRateio.FieldByName( 'IDPlanoOrigem' ).AsInteger,
                                               cdsRateio.FieldByName( 'IDPatroOrigem' ).AsInteger,
                                               //cdsRateio.FieldByName( 'IDPrograma'    ).AsInteger,
                                               cdsRateio.FieldByName( 'IDProgramaOrcamen'    ).AsInteger,
                                               cdsRateio.FieldByName( 'IDDESPESAORC'  ).AsInteger
                                               );
      //
      AtualizaSaldoOrcado(Valor, SaldoOrcado);
    Finally
      FreeAndNil( CdsAlteradoresContaDiferente );
      FreeAndNil( SaldoOrcado                  );
    End;
  Except
    RAISE;
  End;
end;

procedure TOrcamentoBackMT.CopyFieldsFDO(ACdsOrigem, ACdsDestino: TClientDataSet; AFields: array of String);
Var
  I : Integer;
begin
  For I := 0 to Length(AFields) - 1 do
    ACdsDestino.FieldByName(AFields[I]).AsString := ACdsOrigem.FieldByName(AFields[I]).AsString;
end;

procedure TOrcamentoBackMT.CopyFieldsFDO(AOrigemParam: TOrigemParamAP; ACdsOrigem, ACdsDestino: TClientDataSet);
begin
  Case AOrigemParam of
    opapDesembolso : Self.CopyFieldsFDO(ACdsOrigem, ACdsDestino, ['IDTIPORDXCCXCONTA',  'TipoDespesa', 'CentroCusto']);
    opapAlterador  : Self.CopyFieldsFDO(ACdsOrigem, ACdsDestino, ['idaltxccxprgxconta', 'TipoDespesa', 'CentroCusto']);
  End;
end;

function TOrcamentoBackMT.FDO(AOption : TFDOOption; cdsDocumento: TClientDataSet; ACODDOCUMENTO : Double): Boolean;
Const
  _PARAM_DOCS       = '***DOCUMENTOS***';
  _PARAM_Tipo       = '***TIPO***';
  _PARAM_Apelido    = '***X***';
  _PARAM_VALOR      = '***VALOR***';
  _PARAM_DESPESAORC = '***DESPESAORC***';
  _PARAM_TAB_AUX    = '***TABELA_AUX***';
  _PARAM_WHERE_AUX  = '***TABELA_WHERE***';
  _PARAM_TAB        = '***TABELA***';
  _PARAM_TAB_REL    = '***TABELA_RELACIONAMENTO***';
 //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040
//  _PARAM_PLANOPREV  = '***IDPLANOPREV***';  //MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
//MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040


  _Select = ' Select'
          + '    ' + #39 + _PARAM_Tipo + #39 + ' as TIPO,'
          + '    ' + _PARAM_Apelido + '.FlgObrigaReserva,'
          + '    ' + _PARAM_Apelido + '.Idreservaorcamen,'
          + '    S.IDPESSOA,'
          + '    S.IDPLANOORCAMEN,'
          + '    S.IDCONTAORCAMEN,'
          + '    S.IDDESPESAORC,'//MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487
          + '    S.DATAREFERENCIA,'
          + '    S.CHAVEAUX,'
          + '    ' + _PARAM_Apelido + '.Valor'
          + ' From'
          + '    SaldoOrcado S,'
          //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040 - Inicio
          + '   (Select Distinct /* (Trim(RPAD('' '', P.Tamcod1 + 1 - Length(Trim(G.CODGRUPOORC)), ''0'')) || TRIM(G.CODGRUPOORC) || */ '
//          + '                     Trim(RPAD('' '', P.Tamcod2 + 1 - Length(Trim(CC.Codexterno)), ''0'')) || TRIM(CC.Codexterno) || '
//          + '                     Trim(RPAD('' '', P.Tamcod3 + 1 - Length(Trim(UN.CODORCAMEN)), ''0'')) || TRIM(UN.CODORCAMEN) || '
//          + '                     PPC.CODORCAMENTO ||'
//          + '                     PAT.Codorcamento ||'
//          + '                     '''' ||'
//          //+ '                     Rat.IDPrograma||'
//          + '                     PRG.IDProgramaOrcamen||'
//          + '                     SubStr(PTB.PLACONTA, 4, 1))'
//          + '                     CONTA,'
           //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040 - Fim
          + '                     RE.IDCONTAORCAMEN AS CONTA,  '  //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040
          + '                     TB.FlgObrigaReserva,'
          //+ '                     Doc.Datavencto,'
          + '                     LDoc.DATALANCTO,'
          + '                     Rat.Idreservaorcamen,'
          + '                     NVL(' + _PARAM_DESPESAORC + '.Iddespesaorc, -1) Iddespesaorc,'
          + '                     ' + _PARAM_VALOR
          + '    From'
          + '       DOCUMENTO Doc,'
          + '       LANCTODOCUM LDoc,'
          + '       RATEIODOCUM Rat,'
          //+ '       TIPORECEBDESEMB TB,'
          //+ '       TipordxCCxConta PTB,'
          + '       ' + _PARAM_TAB_AUX
          + '       ' + _PARAM_TAB     + ' TB,'
          + '       ' + _PARAM_TAB_REL + ' PTB,'
          + '       Contasorcamen C,'
          + '       GRUPOORCAMEN G,'
          + '       Centcust CC,'
          + '       Paramorcamento P,'
          + '       unidnegocio UN,'
          + '       PlanPrevContabil PPC,'
          + '       Patro Pat,'
          + '       RESERVAORCAMEN RE, ' //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040
          + '       Programa PRG'
          + '    Where ( Doc.CODDOCUMENTO  ' + _PARAM_DOCS + '   )'
          + '      AND ( Rat.CODDOCUMENTO   = Doc.CODDOCUMENTO   )'
          //
          + '      AND ( LDoc.CODDOCUMENTO  = Doc.CODDOCUMENTO   )'
          + '      AND ( LDoc.OPERACAO      = 2                  )'
          //
          + '      ' + _PARAM_WHERE_AUX
          + '      And ( PTB.Codcentrocusto = RAT.Codcentrocusto )'
          + '      And NOT PTB.IDGRUPOORCAMEN IS NULL'
          + '      AND ( G.IDGRUPOORCAMEN   = PTB.IDGRUPOORCAMEN )'
          + '      And ( C.Idgrupoorcamen   = G.Idgrupoorcamen   )'
          + '      And ( C.IDPLANOORCAMEN   = G.idplanoorcamen   )'
          + '      AND ( C.CODCENTROCUSTO   = PTB.CODCENTROCUSTO )'
          + '      And P.IDPESSOA = C.idpessoa'
          + '      And P.IDPLANOORCAMEN = G.idplanoorcamen'
          + '      And CC.IdEmpresa = C.Idempresa'
          + '      And CC.Codcentrocusto = C.CodCentroCusto'
          + '      And PPC.Idplanoprev = Rat.IDPlanoOrigem'
          + '      And Pat.Idpessoa = Rat.IDPatroOrigem'
          + '      And UN.Unidnegoc = Rat.UnidNegoc'
          + '      and UN.IDPESSOA = c.IDPessoa'
          + '      And NOT TB.FlgObrigaReserva is null'
          + '      AND PRG.IDPrograma = Rat.IDPrograma  '
          + '      AND RAT.IDRESERVAORCAMEN = RE.IDRESERVAORCAMEN '//MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040
//          +          _PARAM_PLANOPREV  ///MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443
          + ' ) ' + _PARAM_Apelido
          + ' Where S.IDPESSOA          = 1'
          //+ '   And S.EXERCICIO         = To_CHAR(' + _PARAM_Apelido + '.Datavencto, ''YYYY'') '
          //+ '   And S.PERIODO           = To_CHAR(' + _PARAM_Apelido + '.Datavencto, ''MM''  ) '
          + '   And S.EXERCICIO         = To_CHAR(' + _PARAM_Apelido + '.DATALANCTO, ''YYYY'') '
          + '   And S.PERIODO           = To_CHAR(' + _PARAM_Apelido + '.DATALANCTO, ''MM''  ) '
          + '   And S.Idcontaorcamen    = ' + _PARAM_Apelido + '.Conta'
          + '   And S.Iddespesaorc      = ' + _PARAM_Apelido + '.Iddespesaorc';
          {
          + ' Order By'
          + '    S.IDPESSOA,'
          + '    S.IDPLANOORCAMEN,'
          + '    S.IDCONTAORCAMEN,'
          + '    S.DATAREFERENCIA,'
          + '    S.CHAVEAUX';
          }
///
Var
  Docs         : String;
  Compromissos : String;
  _SQL         : String;
  //
  FieldOrigem     : String;
  FieldDestino    : String;
  FieldDOC        : String;
  FlagCompromisso : String;
  //
  CdsFDO     : TClientDataSet;//

begin
  Assert(AOption in ([fdoBaixa,fdoEstornoBaixa,fdoEstornoAP]), 'TFDOOption inválido para o método!');
  //

  //FAZER BOOKMARK
  Docs      := '';
  FieldDOC  := 'CODDOCUMENTO';

  if cdsDocumento <> Nil Then
  Begin
    if cdsDocumento.FindField(FieldDOC) = NIL then
       FieldDOC  := 'IDDOCUMENTO';
    //
    cdsDocumento.First;
    While NOT cdsDocumento.EOF do
    Begin
      //if cdsDocumento.FieldByName('RECPAG').AsString = 'P' Then
         Docs := Docs + cdsDocumento.FieldByName(FieldDOC).AsString + ',';

      cdsDocumento.Next;
    End;
    cdsDocumento.First
  End Else
    Docs := FloatToStr(ACODDOCUMENTO);

  //

  if Trim(Docs) = '' Then EXIT;

  // Define ação da função
  Case AOption of
    fdoBaixa:
       Begin
          FieldOrigem     := 'VLRCOMPROMETIDO';
          FieldDestino    := 'VLRREALIZADO'   ;
          FlagCompromisso := 'E';
       End;

    fdoEstornoBaixa:
       Begin
          FieldOrigem     := 'VLRREALIZADO'   ;
          FieldDestino    := 'VLRCOMPROMETIDO';
          FlagCompromisso := 'A';
       End;

    fdoEstornoAP:
       Begin
          FieldOrigem     := 'VLRCOMPROMETIDO';
          FieldDestino    := '';
          FlagCompromisso := 'C';
       End;
  End;

  //
  Docs := 'IN (' + Docs + ')';
  _Sql := _Select;
  _Sql := StringReplace( _Sql, _PARAM_DOCS, DOCS, [rfReplaceAll]);
  _Sql := StringReplace( _Sql,        ',)',  ')', [rfReplaceAll]);
  //

  // ### DESEMBOLSO ### //
  _Sql := StringReplace( _Sql, _PARAM_Tipo      , 'R', []);
  _Sql := StringReplace( _Sql, _PARAM_Apelido   , 'C', [rfReplaceAll]);
  _Sql := StringReplace( _Sql, _PARAM_VALOR     , 'RAT.VALOR', []);
  _Sql := StringReplace( _Sql, _PARAM_DESPESAORC, 'RAT', []);
  _Sql := StringReplace( _Sql, _PARAM_TAB_AUX   , ' ', []);
  _Sql := StringReplace( _Sql, _PARAM_WHERE_AUX , ' And ( TB.CODTIPRECDES = Rat.CODTIPRECDES ) And ( PTB.CODTIPRECDES = TB.CODTIPRECDES )' , []);
  _Sql := StringReplace( _Sql, _PARAM_TAB       , 'TIPORECEBDESEMB', []);
  _Sql := StringReplace( _Sql, _PARAM_TAB_REL   , 'TipordxCCxConta', []);

  // ### ALTERADOR ### //
  _Sql := _Sql + ' UNION ALL ' + _Select;
  _Sql := StringReplace( _Sql, _PARAM_DOCS, DOCS, [rfReplaceAll]);
  _Sql := StringReplace( _Sql,        ',)',  ')', [rfReplaceAll]);

  _Sql := StringReplace( _Sql, _PARAM_Tipo      , 'A', []);
  _Sql := StringReplace( _Sql, _PARAM_Apelido   , 'ALT', [rfReplaceAll]);
  _Sql := StringReplace( _Sql, _PARAM_VALOR     , ' Case TB.ACRESDECRES WHEN ''D'' then LD.Valor WHEN ''C'' then LD.Valor * (-1) end Valor', []);
  _Sql := StringReplace( _Sql, _PARAM_DESPESAORC, 'LD', []);
  _Sql := StringReplace( _Sql, _PARAM_TAB_AUX   , 'LanctoDocum Ld,', []);
  _Sql := StringReplace( _Sql, _PARAM_WHERE_AUX , ' And ld.operacao = 4 And ld.idrateiodocum = rat.idrateiodocum And ( LD.CODALTERADOR = TB.CODALTERADOR ) And ( PTB.CODALTERADOR = TB.CODALTERADOR ) ', []);
  _Sql := StringReplace( _Sql, _PARAM_TAB       , 'TIPOALTERADOR', []);
  _Sql := StringReplace( _Sql, _PARAM_TAB_REL   , 'ALTXCCXPRGXCONTA', []);

  {
  //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040 - Inicio
 //MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443 - Inicio
 if (FlagCompromisso = 'E') and (cdsDocumento.FindField('IDPLANOPREV') <> nil) then
 begin
  if cdsDocumento.FieldByName('IDPLANOPREV').AsString <> Emptystr then
    _SQL := StringReplace(_SQL, _PARAM_PLANOPREV  , ' AND NVL(PTB.IDPLANOPREV,0) = ' + cdsDocumento.FieldByName('IDPLANOPREV').AsString , [])
 else
    _SQL := StringReplace(_SQL, _PARAM_PLANOPREV  , ' ' , []);

  _sql := StringReplace(_SQL, _PARAM_PLANOPREV  , ' ' , []);
 end
 else
  _sql := StringReplace(_SQL, _PARAM_PLANOPREV  , ' ' , [rfreplaceall]);
  }
  {with Tstringlist.Create do
  begin
//   a := Tstringlist.Create;
     Add(_Sql);
     savetofile('c:\_teste.txt');
     free;
  end;}
  //
  ////MARCIO SANCHES SPINOSA SOL 220237 KINTANA 2052443 - Fim
  //MARCIO SANCHES SPINOSA SOL 220237/15422 KINTANA 2053040 - Fim
  CdsFDO := TClientDataSet.Create(Nil);
  With CdsFDO do
    Try
      Data := GetDataPacket(_Sql);

      First;

      While NOT EOF do
      Begin
        ////MARCIO SANCHES SPINOSA SOL 223059 KINTANA 2056404 - Inicio
        //if (VerificaObrigaFDO(CdsFDO)) then//Marcio Sanches Spinosa SOL 206429 KTN 1999836
        ////MARCIO SANCHES SPINOSA SOL 223059 KINTANA 2056404 - Fim
         CSaldoOrcado.MovimentaValor( FieldOrigem,
                                     FieldDestino,
                                     FieldByName( 'VALOR'          ).AsFloat,
                                     FieldByName( 'IDPESSOA'       ).AsInteger,
                                     FieldByName( 'IDPLANOORCAMEN' ).AsInteger,
                                     FieldByName( 'IDCONTAORCAMEN' ).AsString,
                                     FieldByName( 'DATAREFERENCIA' ).AsDateTime,
                                     FieldByName( 'CHAVEAUX'       ).AsFloat,
                                     FieldByName('IDDESPESAORC').asinteger, //MARCIO SANCHES SPINOSA SOL 210712 KINTANA 2029487
                                     FlagCompromisso);    //MARCIO SANCHES SPINOSA SOL 217428 KINTANA 2047290

        {//
        CSaldoOrcado.SetValueField('VLRCOMPROMETIDO', FieldByName( 'VALOR'          ).AsFloat, FieldByName( 'IDPESSOA'       ).AsInteger, FieldByName( 'IDPLANOORCAMEN' ).AsInteger, FieldByName( 'IDCONTAORCAMEN' ).AsString, FieldByName( 'DATAREFERENCIA' ).AsDateTime, FieldByName( 'CHAVEAUX'       ).AsFloat, False, True);
        CSaldoOrcado.SetValueField('VLRREALIZADO',    FieldByName( 'VALOR'          ).AsFloat, FieldByName( 'IDPESSOA'       ).AsInteger, FieldByName( 'IDPLANOORCAMEN' ).AsInteger, FieldByName( 'IDCONTAORCAMEN' ).AsString, FieldByName( 'DATAREFERENCIA' ).AsDateTime, FieldByName( 'CHAVEAUX'       ).AsFloat, True);}
        //

        if FieldByName('IDRESERVAORCAMEN').AsInteger > 0 Then
           if NOT ExecSQL( ' UPDATE RESERVAORCAMEN'
                         + ' SET FLGRESERVA = ' + QuotedStr(FlagCompromisso)
                         + ' WHERE IDRESERVAORCAMEN = ' + FieldByName('IDRESERVAORCAMEN').AsString ) Then
              RAISE Exception.Create(MessageInfo);
        //
        Next;
      End;
      //
    Finally
      FreeAndNil(CdsFDO);
    End;

end;

constructor EProcessoFDO_SaldoInsuficiente.Erro(AOrigemAP: TOrigemParamAP; ACodOrigem: String);
begin
  Inherited Erro(AOrigemAP, ACodOrigem, GetMessage + #13 + ' Verificar o ');
end;

function EProcessoFDO_SaldoInsuficiente.GetMessage: String;
begin
  Result := 'Não há Saldo Orçado suficiente para o lançamento.';
end;

{ EProcessoFDO }

procedure EProcessoFDO.BuscaInfoCodOrigem(ACDS: TClientDataSet; AFieldCod, AFieldDesc: String);
begin
   {  Comentado por William Santana SOL 199983 KIN 1967697
  With ACDS do
    if Locate(AFieldCod, FCodOrigem, []) Then
       Self.Message := Self.Message
                     + FieldByName(AFieldDesc).AsString + #13
                     + 'Favor contatar à Área Orçamentária para esclarecimentos.'
    Else
       Self.Message := Self.Message + #13
                     + 'Favor contatar à Área Orçamentária para esclarecimentos.' + #13
                     + 'Não foi possível localizar a descrição...';
     }
end;


constructor EProcessoFDO.Erro(AOrigemAP: TOrigemParamAP; ACodOrigem, AErro: String);
begin
  FOrigemParamAP := AOrigemAP;
  FCodOrigem     := ACodOrigem;

  Case AOrigemAP of
    opapDesembolso : Inherited Create(AErro + ' desembolso ');
    opapAlterador  : Inherited Create(AErro + ' alterador ' );
  Else
    Inherited Create(AErro + ' !');
  End;

end;

//William Santana SOL 199983 KIN 1967697
constructor EProcessoFDO.Erro(AOrigemAP: TOrigemParamAP; ANomeOrigem, ANomecentrocusto, AErro: String);
begin
  FOrigemParamAP := AOrigemAP;

  Case AOrigemAP of
    opapDesembolso : Inherited Create(AErro + ' desembolso '+ ANomeOrigem
                                            + ' para o centro de custo '+ ANomecentrocusto
                                            + '. Favor contactar a área orçamentária para esclarecimento.');
    opapAlterador  : Inherited Create(AErro + ' alterador ' );
  Else
    Inherited Create(AErro + ' !');
  End;

end;

//END - William Santana SOL 199983 KIN 1967697
{ EProcessoFDO_Parametrizacao }

constructor EProcessoFDO_Parametrizacao.Erro(AOrigemAP: TOrigemParamAP; ACodOrigem: String);
begin
  Inherited Erro(AOrigemAP, ACodOrigem, 'Não há parametrização orçamentária específica para o');
end;

procedure TOrcamentoBackMT.FDO_SetCDS(AIDForCli: Integer;
                                      ADataLancto: TDateTime;
                                      ACodTipRecDes,
                                      ACodCentroCusto: String;
                                      AUnidNegoc,
                                      AIdPlanoOrigem,
                                      AIdPatroOrigem,
                                      AIdPrograma: Integer;
                                      AValor: Double;
                                      AIDDespesaOrc: Integer;
                                      AIDProgramaOrcamen: Integer;
                                      AIDPlano           : integer // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
                                      //Var OutCompromisso: Integer
                                      );
//Var
//  FLGOBRIGARESERVA : String;
begin
  //if apenas para construir o dataset no formato esperado
  if (FCdsFDORateio.FindField('IDForCli'      ) = NIL) OR
     (FCdsFDORateio.FindField('RECPAG'        ) = NIL) OR
     (FCdsFDORateio.FindField('IdPlanoOrigem' ) = NIL) OR
     (FCdsFDORateio.FindField('TipoDespesa'   ) = NIL) Then
     FCdsFDORateio.Data := ListaRateio(-1);

  //
  //OutCompromisso   := 0;
  //FLGOBRIGARESERVA := GetFLGOBRIGARESERVA(opapDesembolso, ACodTipRecDes);
  //

  FCdsFDORateio.EmptyDataSet;
  //
  FCdsFDORateio.Insert;
  FCdsFDORateio.FieldByName('RECPAG'           ).AsString   := 'P';
  FCdsFDORateio.FieldByName('FLGOBRIGARESERVA' ).AsString   := GetFLGOBRIGARESERVA(opapDesembolso, ACodTipRecDes);//FLGOBRIGARESERVA;
  FCdsFDORateio.FieldByName('IDForCli'         ).AsInteger  := AIDForCli;
  FCdsFDORateio.FieldByName('DataLancto'       ).AsDateTime := ADataLancto;
  FCdsFDORateio.FieldByName('CodTipRecDes'     ).AsString   := ACodTipRecDes;
  FCdsFDORateio.FieldByName('CodCentroCusto'   ).AsString   := ACodCentroCusto;
  FCdsFDORateio.FieldByName('UnidNegoc'        ).AsInteger  := AUnidNegoc;
  FCdsFDORateio.FieldByName('IdPlanoOrigem'    ).AsInteger  := AIdPlanoOrigem;
  FCdsFDORateio.FieldByName('IdPatroOrigem'    ).AsInteger  := AIdPatroOrigem;
  FCdsFDORateio.FieldByName('IdPlanoPrev'      ).AsInteger  := AIdPlanoOrigem; // SOL 200328 KINTANA 1930483 // SOL 200387 KINTANA 1931060
  FCdsFDORateio.FieldByName('IdPatro'          ).AsInteger  := AIdPatroOrigem; // SOL 200328 KINTANA 1930483 // SOL 200387 KINTANA 1931060
  FCdsFDORateio.FieldByName('IdPrograma'       ).AsInteger  := AIdPrograma;
  FCdsFDORateio.FieldByName('Valor'            ).AsFloat    := AValor;
  FCdsFDORateio.FieldByName('IDDespesaOrc'     ).AsInteger  := AIDDespesaOrc;
  FCdsFDORateio.FieldByName('IDProgramaOrcamen').AsInteger  := AIDProgramaOrcamen;
  //MARCIO SANCHES SPINOSA - SOL 172384/9603
  FCdsFDORateio.FieldByName('OBS'              ).AsString   := EmptyStr;
  //MARCIO SANCHES SPINOSA - SOL 172384/9603

  // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656
  if (AIDPlano > 0) then begin
    FCdsFDORateio.FieldByName('PLANO'          ).asinteger   := AIDPlano;
  end;
  // Thiago Melo SOL 227975 e 16197 Kintana 2061959 PPM 430656

  FCdsFDORateio.Post;
  //
  {Try
    FDO(FCdsFDORateio, FCdsFDORateio, NIL);
    OutCompromisso := FCdsFDORateio.FieldByName('IDRESERVAORCAMEN').AsInteger;
  Except
    RAISE;
  End;}
end;

function TOrcamentoBackMT.GetFLGOBRIGARESERVA(AOrigem: TOrigemParamAP; ACodOrigem: String): String;
Const
  _Select_Flg_Desembolso = 'Select T.FLGOBRIGARESERVA From TIPORECEBDESEMB T Where T.CodTipRecDes = ';
  _Select_Flg_Alterador  = 'Select T.FLGOBRIGARESERVA From TIPOALTERADOR   T Where T.Codalterador = ';
Var
  Cds : TClientDataSet;
begin

  Cds := TClientDataSet.Create(Nil);
  Try
    Case AOrigem of
      opapDesembolso: Cds.Data := GetDataPacket( _Select_Flg_Desembolso + #39 + ACodOrigem + #39 );
      opapAlterador : Cds.Data := GetDataPacket( _Select_Flg_Alterador  + ACodOrigem             );
    End;

    Result := Cds.FieldByName('FLGOBRIGARESERVA').AsString;

  Finally
    FreeAndNil(Cds);
  End;

end;

procedure TOrcamentoBackMT.FDO_Valida(AOrigem : TOrigemParamAP; ACds : TClientDataSet; ACdsSubDespesa : TClientDataSet);
Var
  Cds       : TClientDataSet;
  CodOrigem : String;
  Sql       : String;
begin
  if (ACds.FindField('FLGOBRIGARESERVA')            <> NIL) AND
     (ACds.FieldByName('FLGOBRIGARESERVA').AsString <> 'S') Then EXIT;

  Case AOrigem of
    opapDesembolso: CodOrigem := ACds.FieldByName('CodTipRecDes').AsString;
    opapAlterador : CodOrigem := ACds.FieldByName('CodAlterador').AsString;
  End;

  if (ACdsSubDespesa <> Nil) AND
     (ACdsSubDespesa.Active) AND            // Edilaine - SOL 195755 / KTN 1871968
     (ACdsSubDespesa.RecordCount > 0) AND
     (ACdsSubDespesa.FieldByName('Validar').AsString = 'S') And
     (ACds.FieldByName('IDDESPESAORC').AsInteger     <    1) Then
     Raise EProcessoFDO_Parametrizacao.Erro(AOrigem, CodOrigem, 'Informe a Sub-Despesa para o');

  Cds := TClientDataSet.Create(Nil);
  Try
    //VALIDANDO PARAMETRIZACAO
    {Case AOrigem of
      opapDesembolso: CodOrigem := ACds.FieldByName('CodTipRecDes').AsString;
      opapAlterador : CodOrigem := ACds.FieldByName('CodAlterador').AsString;
    End;}
    //
    Sql := GetSql_Parametrizacao(AOrigem, CodOrigem, ACds.FieldByName('CodCentroCusto').AsString, ACds.FieldByName('idplanoprev').AsString); // SOL 229349 Kintana 2063459
    //
    Cds.Data := GetDataPacket(Sql);
    //
    if Cds.FieldByName('FLGOBRIGARESERVA').AsString <> 'S' Then EXIT;

    if Cds.RecordCount = 0 Then
       Raise EProcessoFDO_Parametrizacao.Erro(AOrigem, CodOrigem);

    Cds.IndexFieldNames := 'idgrupoorcamen';
    //
    Cds.Last;
    While NOT Cds.Bof do
      if Cds.FieldByName('idgrupoorcamen').IsNull then
         Raise EProcessoFDO_Parametrizacao.Erro(AOrigem, CodOrigem)
      Else
         Cds.First;
    //
    ACds.FieldByName('IDTIPORDXCCXCONTA').AsFloat := Cds.FieldByName('IDTIPORDXCCXCONTA').AsFloat; // SOL 229349 Kintana 2063459
  Finally
    FreeAndNil(Cds);
  End;
end;

function TOrcamentoBackMT.GetSql_Parametrizacao(AOrigem         : TOrigemParamAP;
                                                ACodOrigem      : String;
                                                ACodCentroCusto : String;
                                                AIdPlanoPrev : String): String; // SOL 229349 Kintana 2063459
begin
  Case AOrigem of
    opapDesembolso:
       Begin
         if Trim(ACodOrigem) = '' then
            ACodOrigem := ' Where '
         else
            ACodOrigem := ' Where RT.CodTipRecDes = ' + #39 + ACodOrigem + #39 + ' and ';

         //
         Result := ' Select'
                 + '   NVL(D.Flgobrigareserva, ''N'') FlgObrigaReserva,'
                 + '   RT.idtipordxccxconta,'
                 + '   RT.idempresa,'
                 + '   RT.codcentrocusto,'
                 + '   RT.plano,'
                 + '   RT.placonta,'
                 + '   RT.idpessoa,'
                 + '   RT.recpag,'
                 + '   RT.codtiprecdes,'
                 + '   RT.idprograma,'
                 + '   RT.idpatro,'
                 + '   RT.placontapass,'
                 + '   RT.idplanoprev,'
                 + '   RT.idgrupoorcamen,'
                 + '   PRG.IDPROGRAMAORCAMEN'
                 + ' From'
                 + '   TIPORECEBDESEMB D,'
                 + '   PROGRAMA PRG,'
                 + '   TipordxCCxConta RT '
                 + ACodOrigem
                 + ' D.CodTipRecDes = RT.CodTipRecDes'
                 + '   And D.IDPESSOA     = RT.IDPESSOA'
                 + '   And D.RECPAG       = RT.RECPAG'
                 + '   AND PRG.IDPROGRAMA = RT.idprograma'
                 + '   And D.RECPAG = ''P'' '
                 ;

                 if TRIM(AIdPlanoPrev) <> '' Then // SOL 229349 Kintana 2063459
                   Result := Result + ' AND RT.idplanoprev = ' + AIdPlanoPrev; // SOL 229349 Kintana 2063459

         //
       End;

    opapAlterador :
       Begin
         if Trim(ACodOrigem) = '' then
            ACodOrigem := ' Where '
         else
            ACodOrigem := ' Where RT.CodAlterador = ' + ACodOrigem + ' And ';

         //
         Result := 'Select'
                 + '   RT.idaltxccxprgxconta,'
                 + '   RT.codalterador,'
                 + '   RT.plano,'
                 + '   RT.placonta,'
                 + '   RT.idprograma,'
                 + '   RT.idempresa,'
                 + '   RT.codcentrocusto,'
                 + '   RT.trgdtinclusao,'
                 + '   RT.trguserinclusao,'
                 + '   RT.Idgrupoorcamen,'
                 + '   T.CodAlterador,'
                 + '   NVL(T.Flgobrigareserva, ''N'') FlgObrigaReserva,'
                 + '   PRG.IDProgramaOrcamen'
                 + ' From'
                 + '    ALTXCCXPRGXCONTA RT,'
                 + '    PROGRAMA PRG,'
                 + '    TIPOALTERADOR T'
                 + ACodOrigem
                 + ' RT.Codalterador = T.Codalterador'
                 + ' AND PRG.IDPrograma = RT.IDPrograma';

       End;
  End;
  //
  if TRIM(ACodCentroCusto) <> '' Then
     Result := Result
             + ' AND RT.codcentrocusto = ' + ACODCENTROCUSTO;


end;

function TOrcamentoBackMT.DiasNoPeriodo(iExercicio, iPeriodoIni,
  iPeriodoFim: Integer): Integer;
var
   dDataIniPeriodo, dDataFimPeriodo : TDateTime;
   sSQL : string;
begin
  //Retorna quantos dias um período tem
  sSQL := 'SELECT DATAINIPERIODO, DATAFIMPERIODO FROM PERIODOORCAMEN ' +
          'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ' +
          '(PERIODO  BETWEEN ' + IntToStr(iPeriodoIni) + ' AND ' +  IntToStr(iPeriodoFim) + ' ) AND ' +
          '(IDPESSOA = ' + IntToStr( IdEmpresa) + ') ' +
          'ORDER BY PERIODO';

  FCdsPeriodo.Data := GetDataPacket(sSQL);

  if FCdsPeriodo.IsEmpty then
  begin
    Result := 0;
  end
  else
  begin
    FCdsPeriodo.First;
    dDataIniPeriodo := FCdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime;
    FCdsPeriodo.Last;
    dDataFimPeriodo := FCdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime;

    Result := Trunc(dDataFimPeriodo - dDataIniPeriodo) + 1;
  end;
end;

end.

