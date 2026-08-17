// Alterações
{ --------------------------------------------------------------------------------------------------
Data      : 07.03.2018
Autor     : Everson Luiz Pereira da Cunha
Pendência : SIG TIBERO
Descrição : Melhoria TIBERO.
            Inserir Alias nas tabelas e campos.
            Retirar INDEX, +rule etc
----------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Novembro/2002                          }
{                                                       }
{*******************************************************}


Unit
  uCtrlGeraDados;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, ComCtrls, StdCtrls,
  Provider, uCMSqlParams, uCMTypes, uCtrlPadroes, uString, uDtmGeraDados, Classes, Math;

Type
  TCtrlGeraDados = Class(TCmControlObject)

  Protected

    Procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;

  Private
    DtmGeraDados : TDtmGeraDados;
    iMes, iAno, iDia : Word;
    bConcluiuOK,
    bTestaCalculada,
    bSaiLoopDias,
    bSaiLoop           : Boolean;

    FIdEmpresa,
    FIdModulo,
    FIdUsuario,
    FiPlanoOrc,
    FiPeriodoIni,
    FiPeriodoFim       : Integer;
    FsGeraMes          : String;
    FPrefixoServidor   : String;
    FsLog1,
    FsLog2,
    FsLog3,
    FsLog4,
    FsLog5            : String;
    FiPeriodoAtu      : Integer;
    FiPlanoContabil   : Double;

    FpbAguarde         : TProgressBar;
    FmemErroNaGeracao  : TRichEdit;
    FedtData           : TEdit;
    FedtConta          : TEdit;
    FedtTipo           : TEdit;
    FedtStatus         : TEdit;

    FCdsExercicio      : TClientDataSet;
    FCdsPeriodo        : TClientDataSet;
    FCdsCenario        : TClientDataSet;
    FCdsContasAuxR     : TClientDataSet;
    FCdsVerificaSinal  : TClientDataSet;
    FCdsSaldos         : TClientDataSet;
    FCdsContasAux      : TClientDataSet;
    FCdsPeriodoIni     : TClientDataSet;
    FCdsNaoCalculadas  : TClientDataSet;
    FCdsContasAuxO     : TClientDataSet;
    FCdsFluxo          : TClientDataSet;
    FCdsDeletaValores  : TClientDataSet;
    FCdsComposicao     : TClientDataSet;
    FCdsContabilidade  : TClientDataSet;
    FCdsAcumulado2CAnt : TClientDataSet;
    FCdsDataview       : TClientDataSet;
    FCdsPeriodoContab  : TClientDataSet;
    FCdsPlanoData      : TClientDataSet;
    FCdsAcumulado2Ant  : TClientDataSet;
    FCdsFormula        : TClientDataSet;
    FCdsAcumulado3MC   : TClientDataSet;
    FCdsAcumulado3M    : TClientDataSet;
    FCdsAcumulado3     : TClientDataSet;
    FCdsCompContas     : TClientDataSet;
    FCdsAcumulado2     : TClientDataSet;
    FCdsAcumulado2M    : TClientDataSet;
    FCdsAcumulado2MC   : TClientDataSet;
    FCdsContas         : TClientDataSet;
    FCdsGenericos      : TClientDataSet;
    FCdsFlagCalculo    : TClientDataSet;
    FCdsLancOrc        : TClientDataSet;
    FCdsAcum2          : TClientDataSet;
    FCdsAcum3          : TClientDataSet;

    Function GravaLogOperacoesOrc( pIdEmpresa,
                                   pIdModulo,
                                   pIdUsuario : Integer;
                                   pLog       : String ) : Boolean;
    Function  SelecionaContasNaoCalculadas( cCalcOR:char ):longint;

//    Procedure StartTransactionOrc;
//    Procedure CommitOrc;
//    Procedure RollBackOrc;
    Function  GeraDadosApagaValores( iExercicio,
                                     iPeriodo:integer;
                                     pdblcCenarioText : String;
                                     psePosIni1Value,
                                     psePosFim1Value  : Integer;
                                     pedConteudo1Text,
                                     pdblkExercicioLookupValue,
                                     pdblcCenarioLookupValue  : String;
                                     pcbBuscaSaldoAnteriorChecked : Boolean;
                                     prgrpTipoItemIndex : Integer ) : Boolean;

    Function  GeraDadosZeraFlagCalculo( prgrpTipoItemIndex : Integer;
                                        pedConteudo1Text   : String;
                                        psePosIni1Value,
                                        psePosFim1Value   : Integer ) : Boolean;

    Procedure CalculaTiposOrcado( dDataCorrente:TDateTime;
                                  pdblcCenarioText,
                                  pdblkExercicioLookupValue,
                                  pdblcCenarioLookupValue   : String;
                                  pcbBuscaSaldoAnteriorChecked : Boolean;
                                  psePosIni1Value,
                                  psePosFim1Value : Double;
                                  pedConteudo1Text,
                                  pdblkExerciciotext : String );

    Procedure CalculaTiposRealizado( dDataCorrente    : TDateTime;
                                     pdblcCenarioText,
                                     pdblkExercicioLookupValue,
                                     pdblcCenarioLookupValue : String;
                                     pcbBuscaSaldoAnteriorChecked  : Boolean;
                                     psePosIni1Value,
                                     psePosFim1Value : Double;
                                     pedConteudo1Text,
                                     pdblkExerciciotext : String );

    Procedure CalculaValorFixoInf( dDataCorrente:TDateTime; cCalcOR:char;
                                   pdblcCenarioText,
                                   pdblkExercicioLookUpValue,
                                   pdblcCenarioLookUpValue : String;
                                   psePosIni1Value,
                                   psePosFim1Value : Double;
                                   pedConteudo1Text,
                                   pdblkExerciciotext : String );


    Procedure CalculaComposicao(dDataCorrente    :TDateTime;
                                cCalcOR          :char;
                                pdblcCenarioText,
                                pdblkExercicioLookupValue,
                                pdblcCenarioLookupValue   : String;
                                pcbBuscaSaldoAnteriorChecked : Boolean;
                                psePosIni1Value,
                                psePosFim1Value : Double;
                                pedConteudo1Text,
                                pdblkExerciciotext : String );

    procedure CalculaAcumulado( dDataCorrente:TDateTime; cCalcOR:char;
                                pcbBuscaSaldoAnteriorChecked : Boolean;
                                pdblcCenarioText,
                                pdblkExercicioLookupValue,
                                pdblcCenarioLookupValue : String;
                                psePosIni1Value,
                                psePosFim1Value : Double;
                                pedConteudo1Text,
                                pdblkExerciciotext : String );

    procedure CalculaCondicional( dDataCorrente:TDateTime; cCalcOR:char;
                                  pdblcCenarioText,
                                  pdblkExercicioLookupValue,
                                  pdblcCenarioLookupValue : String;
                                  pcbBuscaSaldoAnteriorChecked : Boolean;
                                  psePosIni1Value,
                                  psePosFim1Value : Double;
                                  pedConteudo1Text,
                                  pdblkExerciciotext : String );

    procedure CalculaFormula( dDataCorrente:TDateTime; cCalcOR:char;
                              pcbBuscaSaldoAnteriorChecked : Boolean;
                              pdblcCenarioText,
                              pdblkExercicioLookUpValue,
                              pdblcCenarioLookUpValue : String;
                              psePosIni1Value,
                              psePosFim1Value : Double;
                              pedConteudo1Text,
                              pdblkExerciciotext : String );

    Procedure CalculaGenericos( dDataCorrente:TDateTime; cCalcOR:char;
                                pdblcCenarioText,
                                pdblkExercicioLookUpValue,
                                pdblcCenarioLookUpValue : String;
                                psePosIni1Value,
                                psePosFim1Value : Double;
                                pedConteudo1Text,
                                pdblkExerciciotext : String );

     Procedure CalculaContabilidade( dDataCorrente:TDateTime; cCalcOR:char;
                                     pcbBuscaSaldoAnteriorChecked : Boolean;
                                     pdblkExercicioLookupValue,
                                     pdblcCenarioText,
                                     pdblcCenarioLookUpValue : String;
                                     psePosIni1Value,
                                     psePosFim1Value : Double;
                                     pedConteudo1Text,
                                     pdblkExerciciotext : String );

    Procedure CalculaFluxo( dDataCorrente:TDateTime; cCalcOR:char;
                            pdblcCenarioText,
                            pdblkExercicioLookUpValue,
                            pdblcCenarioLookUpValue : String;
                            psePosIni1Value,
                            psePosFim1Value : Double;
                            pedConteudo1Text,
                            pdblkExerciciotext : String );

    function  PegaValorContas( sConta:string; dDataCorrente:TDateTime; cCalcOR, cTipoCalc:char;
                               bSaldoAnterior : Boolean;
                               pdblcCenarioText,
                               pdblkExercicioLookupValue,
                               pdblcCenarioLookupValue : String ) : String;


    Function  CalculaVlrAcumulado( dDataCorrente:TDateTime; cCalcOR:char; rValorDia:Real;
                                   pdblcCenarioText,
                                   pdblkExercicioLookUpValue,
                                   pdblcCenarioLookUpValue    : String ) : Real;
    procedure SelecionaContas( cCalcOR:char; cTipoCalculo:char;
                               psePosIni1Value,
                               psePosFim1Value : Double;
                               pedConteudo1Text : String );
    procedure GravaSaldos( rValor,rValorAcum:real; dDataCorrente:TDateTime; cCalcOR:char;
                           pdblcCenarioText,
                           pdblkExercicioLookUpValue,
                           pdblcCenarioLookUpValue,
                           pdblkExerciciotext         : String );

    procedure GravaSaldosAnt(rValor:real; cCalcOR:char;
                                        pdblcCenarioText,
                                        pdblkExercicioLookUpValue,
                                        pdblcCenarioLookUpValue,
                                        pdblkExerciciotext        : String );
    procedure SelecionaComposicao(sConta:string; iPlano:real; cCalcOR, cTipoCalc : char);
    function  TestaCalculada(sConta:String;cCalcOr:Char):Boolean;
    function  TransformaContas( sFormula:string; dDataCorrente:TDateTime;
                                cCalcOR, cTipoCalc:char; bSaldoAnterior : Boolean;
                                pdblcCenarioText,
                                pdblkExercicioLookupValue,
                                pdblcCenarioLookupValue : String):string;

    Procedure SetCdsAcumulado2(const Value: TClientDataSet);
    Procedure SetCdsAcumulado2Ant(const Value: TClientDataSet);
    Procedure SetCdsAcumulado2CAnt(const Value: TClientDataSet);
    Procedure SetCdsAcumulado2M(const Value: TClientDataSet);
    Procedure SetCdsAcumulado2MC(const Value: TClientDataSet);
    Procedure SetCdsAcumulado3(const Value: TClientDataSet);
    Procedure SetCdsAcumulado3M(const Value: TClientDataSet);
    Procedure SetCdsAcumulado3MC(const Value: TClientDataSet);
    Procedure SetCdsCenario(const Value: TClientDataSet);
    Procedure SetCdsCompContas(const Value: TClientDataSet);
    Procedure SetCdsComposicao(const Value: TClientDataSet);
    Procedure SetCdsContabilidade(const Value: TClientDataSet);
    Procedure SetCdsContas(const Value: TClientDataSet);
    Procedure SetCdsContasAux(const Value: TClientDataSet);
    Procedure SetCdsContasAuxO(const Value: TClientDataSet);
    Procedure SetCdsContasAuxR(const Value: TClientDataSet);
    Procedure SetCdsDataview(const Value: TClientDataSet);
    Procedure SetCdsDeletaValores(const Value: TClientDataSet);
    Procedure SetCdsExercicio(const Value: TClientDataSet);
    Procedure SetCdsFlagCalculo(const Value: TClientDataSet);
    Procedure SetCdsFluxo(const Value: TClientDataSet);
    Procedure SetCdsFormula(const Value: TClientDataSet);
    Procedure SetCdsGenericos(const Value: TClientDataSet);
    Procedure SetCdsLancOrc(const Value: TClientDataSet);
    Procedure SetCdsNaoCalculadas(const Value: TClientDataSet);
    Procedure SetCdsPeriodo(const Value: TClientDataSet);
    Procedure SetCdsPeriodoContab(const Value: TClientDataSet);
    Procedure SetCdsPeriodoIni(const Value: TClientDataSet);
    Procedure SetCdsPlanoData(const Value: TClientDataSet);
    Procedure SetCdsSaldos(const Value: TClientDataSet);
    Procedure SetCdsVerificaSinal(const Value: TClientDataSet);
    procedure SetCdsAcum2(const Value: TClientDataSet);
    procedure SetCdsAcum3(const Value: TClientDataSet);
    procedure SetedtConta(const Value: TEdit);
    procedure SetedtData(const Value: TEdit);
    procedure SetedtStatus(const Value: TEdit);
    procedure SetedtTipo(const Value: TEdit);
    procedure SetIdEmpresa(const Value: Integer);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetiPeriodoAtu(const Value: Integer);
    procedure SetiPeriodoFim(const Value: Integer);
    procedure SetiPeriodoIni(const Value: Integer);
    procedure SetiPlanoContabil(const Value: Double);
    procedure SetIPlanoOrc(const Value: Integer);
    procedure SetmemErroNaGeracao(const Value: TRichEdit);
    procedure SetpbAguarde(const Value: TProgressBar);
    procedure SetPrefixoServidor(const Value: String);
    procedure SetsGeraMes(const Value: String);
    procedure SetsLog1(const Value: String);
    procedure SetsLog2(const Value: String);
    procedure SetsLog3(const Value: String);
    procedure SetsLog4(const Value: String);
    procedure SetsLog5(const Value: String);

  Public
    Constructor Create; Override;
    Destructor  Destroy;Override;

    Function AtualizaTabela( pSql : String ) : Boolean;
    Function VerificaPeriodo( pIdEmpresa,
                              piExercicio,
                              piPeriodo          : Integer;
                              pdblkExercicioText : String  ) : Boolean;
                              
    Function  IniciaGeracao( pdblkExerciciotext : String;
                             prgrpTipoItemIndex : Integer;
                             pdblcCenarioText   : String;
                             psePosIni1Value,
                             psePosFim1Value  : Integer;
                             pedConteudo1Text,
                             pdblkExercicioLookupValue,
                             pdblcCenarioLookupValue  : String;
                             pcbBuscaSaldoAnteriorChecked : Boolean ) : Boolean;
    Procedure AbreQueries;
    Procedure FechaQueries;
    Procedure AbreQueriesShow( pidEmpresa,
                               pYearDate  : Integer );
    Procedure VerificaNaoCalculadas( CCalcOR : Char );
    Procedure ConfirmarClick( pidEmpresa : Integer;
                                         pcbBuscaSaldoAnteriorChecked,
                                         pcbCalcMesChecked            : Boolean;
                                         pedConteudo1Text,
                                         rgrpTipoItemsItemIndex,
                                         pdblkExerciciotext : String;
                                         psePosIni1Value,
                                         psePosFim1Value  : Integer;
                                         pIntegraBackPlano : LongInt;
                                         prgrpTipoItemIndex : Integer;
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue  : String);

    Procedure AbrePeriodo( pidEmpresa, pYearDate  : Integer );

    Property memErroNaGeracao  : TRichEdit      Read FmemErroNaGeracao  Write SetmemErroNaGeracao;
    Property edtData           : TEdit          Read FedtData           Write SetedtData;
    Property edtTipo           : TEdit          Read FedtTipo           Write SetedtTipo;
    Property edtConta          : TEdit          Read FedtConta          Write SetedtConta;
    Property edtStatus         : TEdit          Read FedtStatus         Write SetedtStatus;
    Property pbAguarde         : TProgressBar   Read FpbAguarde         Write SetpbAguarde;
    Property IdEmpresa         : Integer        Read FIdEmpresa         Write SetIdEmpresa;
    Property IdModulo          : Integer        Read FIdModulo          Write SetIdModulo;
    Property IdUsuario         : Integer        Read FIdUsuario         Write SetIdUsuario;
    Property IPlanoOrc         : Integer        Read FIPlanoOrc         Write SetIPlanoOrc;
    Property iPeriodoIni       : Integer        Read FiPeriodoIni       Write SetiPeriodoIni;
    Property iPeriodoFim       : Integer        Read FiPeriodoFim       Write SetiPeriodoFim;
    Property sGeraMes          : String         Read FsGeraMes          Write SetsGeraMes;
    Property PrefixoServidor   : String         Read FPrefixoServidor   Write SetPrefixoServidor;
    Property sLog1             : String         Read FsLog1             Write SetsLog1;
    Property sLog2             : String         Read FsLog2             Write SetsLog2;
    Property sLog3             : String         Read FsLog3             Write SetsLog3;
    Property sLog4             : String         Read FsLog4             Write SetsLog4;
    Property sLog5             : String         Read FsLog5             Write SetsLog5;
    Property iPeriodoAtu       : Integer        Read FiPeriodoAtu       Write SetiPeriodoAtu;
    Property iPlanoContabil    : Double         Read FiPlanoContabil    Write SetiPlanoContabil;
    Property CdsExercicio      : TClientDataSet Read FCdsExercicio      Write SetCdsExercicio;
    Property CdsPeriodo        : TClientDataSet Read FCdsPeriodo        Write SetCdsPeriodo;
    Property CdsCenario        : TClientDataSet Read FCdsCenario        Write SetCdsCenario;
    Property CdsContasAuxR     : TClientDataSet Read FCdsContasAuxR     Write SetCdsContasAuxR;
    Property CdsVerificaSinal  : TClientDataSet Read FCdsVerificaSinal  Write SetCdsVerificaSinal;
    Property CdsSaldos         : TClientDataSet Read FCdsSaldos         Write SetCdsSaldos;
    Property CdsContasAux      : TClientDataSet Read FCdsContasAux      Write SetCdsContasAux;
    Property CdsPeriodoIni     : TClientDataSet Read FCdsPeriodoIni     Write SetCdsPeriodoIni;
    Property CdsNaoCalculadas  : TClientDataSet Read FCdsNaoCalculadas  Write SetCdsNaoCalculadas;
    Property CdsContasAuxO     : TClientDataSet Read FCdsContasAuxO     Write SetCdsContasAuxO;
    Property CdsFluxo          : TClientDataSet Read FCdsFluxo          Write SetCdsFluxo;
    Property CdsDeletaValores  : TClientDataSet Read FCdsDeletaValores  Write SetCdsDeletaValores;
    Property CdsComposicao     : TClientDataSet Read FCdsComposicao     Write SetCdsComposicao;
    Property CdsContabilidade  : TClientDataSet Read FCdsContabilidade  Write SetCdsContabilidade;
    Property CdsAcumulado2CAnt : TClientDataSet Read FCdsAcumulado2CAnt Write SetCdsAcumulado2CAnt;
    Property CdsDataview       : TClientDataSet Read FCdsDataview       Write SetCdsDataview;
    Property CdsPeriodoContab  : TClientDataSet Read FCdsPeriodoContab  Write SetCdsPeriodoContab;
    Property CdsPlanoData      : TClientDataSet Read FCdsPlanoData      Write SetCdsPlanoData;
    Property CdsAcumulado2Ant  : TClientDataSet Read FCdsAcumulado2Ant  Write SetCdsAcumulado2Ant;
    Property CdsFormula        : TClientDataSet Read FCdsFormula        Write SetCdsFormula;
    Property CdsAcumulado3MC   : TClientDataSet Read FCdsAcumulado3MC   Write SetCdsAcumulado3MC;
    Property CdsAcumulado3M    : TClientDataSet Read FCdsAcumulado3M    Write SetCdsAcumulado3M;
    Property CdsAcumulado3     : TClientDataSet Read FCdsAcumulado3     Write SetCdsAcumulado3;
    Property CdsCompContas     : TClientDataSet Read FCdsCompContas     Write SetCdsCompContas;
    Property CdsAcumulado2     : TClientDataSet Read FCdsAcumulado2     Write SetCdsAcumulado2;
    Property CdsAcumulado2M    : TClientDataSet Read FCdsAcumulado2M    Write SetCdsAcumulado2M;
    Property CdsAcumulado2MC   : TClientDataSet Read FCdsAcumulado2MC   Write SetCdsAcumulado2MC;
    Property CdsContas         : TClientDataSet Read FCdsContas         Write SetCdsContas;
    Property CdsGenericos      : TClientDataSet Read FCdsGenericos      Write SetCdsGenericos;
    Property CdsFlagCalculo    : TClientDataSet Read FCdsFlagCalculo    Write SetCdsFlagCalculo;
    Property CdsLancOrc        : TClientDataSet Read FCdsLancOrc        Write SetCdsLancOrc;
    Property CdsAcum2          : TClientDataSet Read FCdsAcum2          Write SetCdsAcum2;
    Property CdsAcum3          : TClientDataSet Read FCdsAcum3          Write SetCdsAcum3;
  End;

Implementation
//************************************************
Constructor TCtrlGeraDados.Create;
Begin
  Inherited;
  DtmGeraDados := TDtmGeraDados.Create( Nil );

  CdsPeriodo        := TClientDataSet.Create( Nil );
  CdsContasAuxR     := TClientDataSet.Create( Nil );
  CdsVerificaSinal  := TClientDataSet.Create( Nil );
  CdsSaldos         := TClientDataSet.Create( Nil );
  CdsContasAux      := TClientDataSet.Create( Nil );
  CdsContasAuxO     := TClientDataSet.Create( Nil );
  CdsFluxo          := TClientDataSet.Create( Nil );
  CdsDeletaValores  := TClientDataSet.Create( Nil );
  CdsComposicao     := TClientDataSet.Create( Nil );
  CdsContabilidade  := TClientDataSet.Create( Nil );
  CdsAcumulado2CAnt := TClientDataSet.Create( Nil );
  CdsDataview       := TClientDataSet.Create( Nil );
  CdsPeriodoContab  := TClientDataSet.Create( Nil );
  CdsPlanoData      := TClientDataSet.Create( Nil );
  CdsAcumulado2Ant  := TClientDataSet.Create( Nil );
  CdsFormula        := TClientDataSet.Create( Nil );
  CdsAcumulado3MC   := TClientDataSet.Create( Nil );
  CdsAcumulado3M    := TClientDataSet.Create( Nil );
  CdsAcumulado3     := TClientDataSet.Create( Nil );
  CdsCompContas     := TClientDataSet.Create( Nil );
  CdsAcumulado2     := TClientDataSet.Create( Nil );
  CdsAcumulado2M    := TClientDataSet.Create( Nil );
  CdsAcumulado2MC   := TClientDataSet.Create( Nil );
  CdsContas         := TClientDataSet.Create( Nil );
  CdsGenericos      := TClientDataSet.Create( Nil );
  CdsFlagCalculo    := TClientDataSet.Create( Nil );
  CdsLancOrc        := TClientDataSet.Create( Nil );
  CdsAcum2          := TClientDataSet.Create( Nil );
  CdsAcum3          := TClientDataSet.Create( Nil );
End;
//************************************************
Destructor TCtrlGeraDados.Destroy;
Begin
  Inherited;
  If ( isAppServer ) Then Begin
    FreeCds([ CdsContasAuxR,    CdsVerificaSinal, CdsSaldos,         CdsContasAux,
              CdsPeriodoIni,    CdsContasAuxO,    CdsFluxo,          CdsDeletaValores,
              CdsComposicao,    CdsContabilidade, CdsAcumulado2CAnt, CdsDataview,
              CdsPeriodoContab, CdsPlanoData,     CdsAcumulado2Ant,  CdsFormula,
              CdsAcumulado3MC,  CdsAcumulado3M,   CdsAcumulado3,     CdsCompContas,
              CdsAcumulado2,    CdsAcumulado2M,   CdsAcumulado2MC,   CdsContas,
              CdsGenericos,     CdsFlagCalculo,   CdsLancOrc,        CdsAcum2,
              CdsAcum3 ]);
  End;
  DtmGeraDados.Free;
End;
//************************************************
Procedure TCtrlGeraDados.OnCreateAppServer;
Begin
  Inherited;

  memErroNaGeracao := TRichEdit.Create( Nil );
  edtData          := TEdit.Create( Nil );
  edtTipo          := TEdit.Create( Nil );
  edtConta         := TEdit.Create( Nil );
  edtStatus        := TEdit.Create( Nil );
  pbAguarde        := TProgressBar.Create( Nil );

  CdsNaoCalculadas := TClientDataSet.Create( Nil );
  CdsExercicio     := TClientDataSet.Create( Nil );
  CdsPeriodoIni    := TClientDataSet.Create( Nil );
  CdsCenario       := TClientDataSet.Create( Nil );
End;
//************************************************
Procedure TCtrlGeraDados.DoChangeDataBase;
Begin
  Inherited;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado2(const Value: TClientDataSet);
begin
  FCdsAcumulado2 := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado2Ant(const Value: TClientDataSet);
begin
  FCdsAcumulado2Ant := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado2CAnt(const Value: TClientDataSet);
begin
  FCdsAcumulado2CAnt := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado2M(const Value: TClientDataSet);
begin
  FCdsAcumulado2M := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado2MC(const Value: TClientDataSet);
begin
  FCdsAcumulado2MC := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado3(const Value: TClientDataSet);
begin
  FCdsAcumulado3 := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado3M(const Value: TClientDataSet);
begin
  FCdsAcumulado3M := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcumulado3MC(const Value: TClientDataSet);
begin
  FCdsAcumulado3MC := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsCenario(const Value: TClientDataSet);
begin
  FCdsCenario := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsCompContas(const Value: TClientDataSet);
begin
  FCdsCompContas := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsComposicao(const Value: TClientDataSet);
begin
  FCdsComposicao := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsContabilidade(const Value: TClientDataSet);
begin
  FCdsContabilidade := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsContas(const Value: TClientDataSet);
begin
  FCdsContas := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsContasAux(const Value: TClientDataSet);
begin
  FCdsContasAux := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsContasAuxO(const Value: TClientDataSet);
begin
  FCdsContasAuxO := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsContasAuxR(const Value: TClientDataSet);
begin
  FCdsContasAuxR := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsDataview(const Value: TClientDataSet);
begin
  FCdsDataview := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsDeletaValores(const Value: TClientDataSet);
begin
  FCdsDeletaValores := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsExercicio(const Value: TClientDataSet);
begin
  FCdsExercicio := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsFlagCalculo(const Value: TClientDataSet);
begin
  FCdsFlagCalculo := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsFluxo(const Value: TClientDataSet);
begin
  FCdsFluxo := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsFormula(const Value: TClientDataSet);
begin
  FCdsFormula := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsGenericos(const Value: TClientDataSet);
begin
  FCdsGenericos := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsLancOrc(const Value: TClientDataSet);
begin
  FCdsLancOrc := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsNaoCalculadas(const Value: TClientDataSet);
begin
  FCdsNaoCalculadas := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsPeriodo(const Value: TClientDataSet);
begin
  FCdsPeriodo := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsPeriodoContab(const Value: TClientDataSet);
begin
  FCdsPeriodoContab := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsPeriodoIni(const Value: TClientDataSet);
begin
  FCdsPeriodoIni := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsPlanoData(const Value: TClientDataSet);
begin
  FCdsPlanoData := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsSaldos(const Value: TClientDataSet);
begin
  FCdsSaldos := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsVerificaSinal(const Value: TClientDataSet);
begin
  FCdsVerificaSinal := Value;
End;
//************************************************
procedure TCtrlGeraDados.SetedtConta(const Value: TEdit);
begin
  FedtConta := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetedtData(const Value: TEdit);
begin
  FedtData := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetedtStatus(const Value: TEdit);
begin
  FedtStatus := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetedtTipo(const Value: TEdit);
begin
  FedtTipo := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetIdEmpresa(const Value: Integer);
begin
  FIdEmpresa := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetiPeriodoAtu(const Value: Integer);
begin
  FiPeriodoAtu := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetiPeriodoFim(const Value: Integer);
begin
  FiPeriodoFim := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetiPeriodoIni(const Value: Integer);
begin
  FiPeriodoIni := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetiPlanoContabil(const Value: Double);
begin
  FiPlanoContabil := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetIPlanoOrc(const Value: Integer);
begin
  FIPlanoOrc := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetmemErroNaGeracao(const Value: TRichEdit);
begin
  FmemErroNaGeracao := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetpbAguarde(const Value: TProgressBar);
begin
  FpbAguarde := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetPrefixoServidor(const Value: String);
begin
  FPrefixoServidor := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetsGeraMes(const Value: String);
begin
  FsGeraMes := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetsLog1(const Value: String);
begin
  FsLog1 := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetsLog2(const Value: String);
begin
  FsLog2 := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetsLog3(const Value: String);
begin
  FsLog3 := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetsLog4(const Value: String);
begin
  FsLog4 := Value;
end;
//************************************************
procedure TCtrlGeraDados.SetsLog5(const Value: String);
begin
  FsLog5 := Value;
end;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcum2(const Value: TClientDataSet);
Begin
  FCdsAcum2 := Value;
End;
//************************************************
Procedure TCtrlGeraDados.SetCdsAcum3(const Value: TClientDataSet);
Begin
  FCdsAcum3 := Value;
End;
//************************************************
Procedure TCtrlGeraDados.AbreQueries;
Begin
  Try
    With DtmGeraDados Do Begin
      CdsCenario.Close;
      CdsCenario.Data := sqlCenario.Data;
      //
      CdsComposicao.Close;
      sqlComposicao.Prepare;
      CdsComposicao.Data := sqlComposicao.Data;
      //
      CdsContasAuxR.Close;
      sqlContasAuxR.Prepare;
      CdsContasAuxR.Data := sqlContasAuxR.Data;
      //
      CdsContasAuxO.Close;
      sqlContasAuxO.Prepare;
      CdsContasAuxO.Data := sqlContasAuxO.Data;
      //
      CdsPeriodoContab.Close;
      sqlPeriodoContab.Prepare;
      CdsPeriodoContab.Data := sqlPeriodoContab.Data;
    End;
  Except
    On E : Exception Do MessageInfo := E.Message;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.FechaQueries;
Begin
  //
  With DtmGeraDados Do Begin
    CdsVerificaSinal.Close;
    sqlVerificaSinal.UnPrepare;
    //
    CdsComposicao.Close;
    sqlComposicao.UnPrepare;
    //
    CdsPeriodo.Close;
    sqlPeriodo.UnPrepare;
    //
    CdsFormula.Close;
    sqlFormula.UnPrepare;
    //
    CdsDeletaValores.Close;
    sqlDeletaValores.UnPrepare;
    //
    CdsContas.Close;
    sqlContas.UnPrepare;
    //
    CdsContasAux.Close;
    sqlContasAux.UnPrepare;
    //
    CdsContabilidade.Close;
    sqlContabilidade.UnPrepare;
    //
    CdsDataview.Close;
    sqlDataView.UnPrepare;
    //
    CdsFluxo.Close;
    sqlFluxo.UnPrepare;
    //
    CdsCompContas.Close;
    sqlCompContas.UnPrepare;
    //
    CdsContasAuxR.Close;
    sqlContasAuxR.UnPrepare;
    //
    CdsContasAuxO.Close;
    sqlContasAuxO.UnPrepare;
    //
    CdsSaldos.Close;
    sqlSaldos.UnPrepare;
    //
    CdsPeriodoContab.Close;
    sqlPeriodoContab.UnPrepare;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.AbreQueriesShow( pidEmpresa,
                                          pYearDate  : Integer );
Begin
  //Preenche as combo-boxes
  With DtmGeraDados.sqlExercicio Do Begin
    Prepare;
    ParamByName('IDPESSOA').asInteger := pidEmpresa;
    CdsExercicio.Data := GetDataPacket( SqlChanged );
  End;

  AbrePeriodo( pidEmpresa, pYearDate );
End;
//************************************************
Procedure TCtrlGeraDados.AbrePeriodo( pidEmpresa,
                                      pYearDate  : Integer );
Begin
  With DtmGeraDados.sqlPeriodoIni Do Begin
    If Not Prepared Then Prepare;
    ParamByName('IDPESSOA').asInteger  := pidEmpresa;
    ParamByName('EXERCICIO').asInteger := pYearDate;
    cdsPeriodoIni.Data := GetDataPacket( SqlChanged );;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.VerificaNaoCalculadas( CCalcOR    : Char );
Begin
  With DtmGeraDados.sqlNaoCalculadas Do Begin
    SQL.Clear;
    SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN, TIPOCALCORCADO, TIPOCALCREALIZADO' + #13 + #10 );
    SQL.Add('FROM CONTASORCAMEN' + #13 + #10 );
    SQL.Add('WHERE' + #13 + #10 );
    SQL.Add('  (TIPOCALCREALIZADO <> ''T'') AND ' + #13 + #10 );
    SQL.Add('  ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
    SQL.Add('  (TIPOCALCORCADO <> ''T'') AND ');

    If cCalcOR = 'O' Then Begin
      SQL.Add('(FLGCALCORCADO = ''N'') AND ')
    End Else If cCalcOR = 'R' Then Begin
      SQL.Add('(FLGCALCREAL = ''N'') AND ');
    End;
    SQL.Add(' (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc)+')');
    Prepare;
    CdsNaoCalculadas.Close;
    CdsNaoCalculadas.Data := GetDataPacket( SqlChanged );;
  End;
End;
//************************************************
Function  TCtrlGeraDados.VerificaPeriodo( pIdEmpresa,
                                          piExercicio,
                                          piPeriodo   : Integer;
                                          pdblkExercicioText : String ) : Boolean;
Begin

  Try
    With DtmGeraDados.sqlPeriodo Do Begin

      CdsPeriodo.close;
      If Not Prepared Then Prepare;
      ParamByName('PESSOA').asInteger    := pIdEmpresa;
      ParamByName('PERIODO').asInteger   := Trunc( piPeriodo );
      ParamByName('EXERCICIO').asInteger := piExercicio;
      CdsPeriodo.Data := GetDataPacket( Sqlchanged );

      If CdsPeriodo.IsEmpty Then Begin

        MessageInfo := 'Não existe este período para este Exercício.';
        CdsPeriodo.Close;
      End Else Begin
        sLog1  := CdsPeriodo.FieldByName( 'NOMEPERIODO' ).AsString + '/' + pdblkExercicioText;
      End;
    End;

    With DtmGeraDados.sqlPlanoData Do Begin
      CdsPlanoData.Close;
      Prepare;
      ParamByName('IDPESSOA').AsInteger := pidEmpresa;
      ParamByName('DATA').AsDateTime    := CdsPeriodo.FieldByName( 'DATAINIPERIODO' ).AsDateTime;
      CdsPlanoData.Data := GetDataPacket( Sqlchanged );
    End;
    Result := True;
  Except
    On E : Exception Do Begin
      MessageInfo := E.Message;
      Result := False;
    End;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.ConfirmarClick( pidEmpresa : Integer;
                                         pcbBuscaSaldoAnteriorChecked,
                                         pcbCalcMesChecked            : Boolean;
                                         pedConteudo1Text,
                                         rgrpTipoItemsItemIndex,
                                         pdblkExerciciotext : String;
                                         psePosIni1Value,
                                         psePosFim1Value  : Integer;
                                         pIntegraBackPlano : LongInt;
                                         prgrpTipoItemIndex : Integer;
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue  : String);
Var
  k : Integer;
Begin
  For k := iPeriodoIni to iPeriodoFim Do Begin

    If ( k > iPeriodoIni ) Then
      pcbBuscaSaldoAnteriorChecked := False;
    iPeriodoAtu    := k;
    sLog2 := rgrpTipoItemsItemIndex;
    If pcbCalcMesChecked Then Begin
      sGeraMes := 'S';
      sLog3 := 'por Período';
    End Else Begin
      sGeraMes := 'N';
      sLog3 := 'por Dia';
    End;
    If pcbBuscaSaldoAnteriorChecked Then
      sLog4 := 'com Saldo Anterior'
    Else
      sLog4 := 'sem Saldo Anterior';

    If trim( pedConteudo1Text ) <> '' Then
      sLog5 := 'Contas de '+ FloatToStr( psePosIni1Value ) + ',' + FloatToStr( psePosFim1Value ) +
               ' com o texto '+trim( pedConteudo1Text )
    Else
      sLog5 := 'Todas as Contas';

    //se o periodo e valido no exercício, inicia a geracao dos dados
    If VerificaPeriodo( pIdEmpresa,
                        StrToInt( pdblkExerciciotext ),
                        iPeriodoAtu,
                        pdblkExerciciotext ) Then Begin

      iPlanoContabil := pIntegraBackPlano;
      {
      With DtmGeraDados.sqlPlanoData Do Begin
        Prepare;
        ParamByName('IDPESSOA').AsInteger := pidEmpresa;
        ParamByName('DATA').AsDateTime    := CdsPeriodo.FieldByName( 'DATAINIPERIODO' ).AsDateTime;
        CdsPlanoData.Close;
        CdsPlanoData.Data := Data;
      End;
      }
      If Not CdsPlanoData.IsEmpty Then
        iPlanoContabil := CdsPlanoData.FieldByName( 'PLANO' ).AsInteger;

      IniciaGeracao( pdblkExerciciotext,
                     prgrpTipoItemIndex,
                     pdblcCenarioText,
                     psePosIni1Value,
                     psePosFim1Value,
                     pedConteudo1Text,
                     pdblkExercicioLookupValue,
                     pdblcCenarioLookupValue,
                     pcbBuscaSaldoAnteriorChecked );
    End;
  End;
End;
//************************************************
Function  TCtrlGeraDados.IniciaGeracao( pdblkExerciciotext : String;
                                        prgrpTipoItemIndex : Integer;
                                        pdblcCenarioText   : String;
                                        psePosIni1Value,
                                        psePosFim1Value  : Integer;
                                        pedConteudo1Text,
                                        pdblkExercicioLookupValue,
                                        pdblcCenarioLookupValue  : String;
                                        pcbBuscaSaldoAnteriorChecked : Boolean) : Boolean;
Var
  i, iNumeroDias : integer;
  dDataCorrente : TDateTime;
Begin
  Result := False;
  Try
    bConcluiuOK := true;
    //Inicia a geração dos dados
    If sGeraMes = 'S' Then begin
      dDataCorrente  := CdsPeriodo.FieldByName( 'DataFimPeriodo' ).AsDateTime;
      iNumeroDias    := 1;
    End Else Begin
      dDataCorrente  := CdsPeriodo.FieldByName( 'DataIniPeriodo' ).AsDateTime;
      iNumeroDias    := Trunc( CdsPeriodo.FieldByName( 'DataFimPeriodo' ).AsDateTime - CdsPeriodo.FieldByName( 'DataIniPeriodo' ).AsDateTime ) + 1;
    End;
  Except
    On E : Exception Do Begin
      MessageInfo := E.Message;
      Raise;
    End;
  End;
  pbAguarde.position := 0;

  //Apaga os valores das Contas Orcamentarias no Periodo e Exercicio correntes
  MessageInfo    := 'Geração dos Dados Concluída.';
  edtStatus.Text := 'Aguarde, apagando os valores das Contas Orçamentárias...';

  GeraDadosApagaValores(StrToInt( pdblkExerciciotext),
                        iPeriodoAtu,
                        pdblcCenarioText,
                        psePosIni1Value,
                        psePosFim1Value,
                        pedConteudo1Text,
                        pdblkExercicioLookupValue,
                        pdblcCenarioLookupValue,
                        pcbBuscaSaldoAnteriorChecked,
                        prgrpTipoItemIndex );
  pbAguarde.Max := iNumeroDias;

  //Controle do loop infinito para referências cruzadas nas contas calculadas
  bSaiLoopDias := false;

  //Inicia o loop que varre as datas do período
  for i := 1 to iNumeroDias do begin

    bSaiLoopDias := Not GeraDadosZeraFlagCalculo( prgrpTipoItemIndex,
                                                  pedConteudo1Text,
                                                  psePosIni1Value,
                                                  psePosFim1Value );

    //Verifica a cada interação do loop principal se o cálculo está em loop infinito
    if bSaiLoopDias Then begin

      //RollBack;
      //MessageInfo := 'Erro ao gerar os Dados';
      bConcluiuOK := False;
      exit;
    End;

    //Verifica a cada interação do loop principal se o botão de cancelamento foi acionado
    if ( edtStatus.Tag = -1 ) Then begin
      //RollBack;
      MessageInfo := 'Geração dos Dados cancelada.';
      bConcluiuOK := False;
      exit;
    End;

    //Imprime a data na tela e esvazia a fila de mensagens
    edtData.Text := DateToStr( dDataCorrente );

    //Monta as rotinas de cálculo de acordo com a seleçào de tela
    case prgrpTipoItemIndex of
      0: CalculaTiposOrcado( dDataCorrente,
                             pdblcCenarioText,
                             pdblkExercicioLookupValue,
                             pdblcCenarioLookupValue,
                             pcbBuscaSaldoAnteriorChecked,
                             psePosIni1Value,
                             psePosFim1Value,
                             pedConteudo1Text,
                             pdblkExerciciotext  );
      1: CalculaTiposRealizado( dDataCorrente,
                                pdblcCenarioText,
                                pdblkExercicioLookupValue,
                                pdblcCenarioLookupValue,
                                pcbBuscaSaldoAnteriorChecked,
                                psePosIni1Value,
                                psePosFim1Value,
                                pedConteudo1Text,
                                pdblkExerciciotext );
      2: begin
            CalculaTiposOrcado( dDataCorrente,
                                pdblcCenarioText,
                                pdblkExercicioLookupValue,
                                pdblcCenarioLookupValue,
                                pcbBuscaSaldoAnteriorChecked,
                                psePosIni1Value,
                                psePosFim1Value,
                                pedConteudo1Text,
                                pdblkExerciciotext );
            CalculaTiposRealizado( dDataCorrente,
                                   pdblcCenarioText,
                                   pdblkExercicioLookupValue,
                                   pdblcCenarioLookupValue,
                                   pcbBuscaSaldoAnteriorChecked,
                                   psePosIni1Value,
                                   psePosFim1Value,
                                   pedConteudo1Text,
                                   pdblkExerciciotext );
         End;
    End;

    dDataCorrente := dDataCorrente + 1;
    pbAguarde.Position := pbAguarde.position + 1;
  End;
  Try
    If ( MessageInfo = 'Geração dos Dados Concluída.' ) Then Begin
      If Not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Termino com sucesso' ) Then
        Abort;
    End;
    Result := True;
  Except
    On E: Exception Do Begin
      bConcluiuOK := False;
      MessageInfo := E.Message;
      Raise;
    End;
  End;
  EdtStatus.Text  := '';
  pbAguarde.Position := 0;
End;
//************************************************
Function TCtrlGeraDados.GravaLogOperacoesOrc( pIdEmpresa,
                                              pIdModulo,
                                              pIdUsuario : Integer;
                                              pLog       : String ) : Boolean;
Begin
  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.GravaLogOperacoesOrc( pIdEmpresa,
                                                         pIdModulo,
                                                         pIdUsuario,
                                                         pLog );
  End Else Begin
    Result := Padroes.GravaLogOperacoes( pIdEmpresa,
                                         pIdModulo,
                                         pIdUsuario,
                                         pLog,
                                         False );
  End;
End;
//************************************************
{
Procedure TCtrlGeraDados.StartTransactionOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.StartTransactionOrc;

  End Else Begin

    StartTransaction;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.CommitOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.CommitOrc;

  End Else Begin

    Commit;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.RollBackOrc;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Connection.AppServer.RollBackOrc;

  End Else Begin

    RollBack;
  End;
End;
}
//************************************************
Function  TCtrlGeraDados.GeraDadosApagaValores( iExercicio,
                                                iPeriodo:integer;
                                                pdblcCenarioText : String;
                                                psePosIni1Value,
                                                psePosFim1Value  : Integer;
                                                pedConteudo1Text,
                                                pdblkExercicioLookupValue,
                                                pdblcCenarioLookupValue : String;
                                                pcbBuscaSaldoAnteriorChecked : Boolean;
                                                prgrpTipoItemIndex : Integer ) : Boolean;
Begin
  Try
    StartTransaction;
    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog1,1,60)) Then Abort;
    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog2,1,60)) Then Abort;
    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog3,1,60)) Then Abort;
    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog4,1,60)) Then Abort;
    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog5,1,60)) Then Abort;
    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Apaga Saldos Existentes') Then Abort;

    If ( ( edtStatus.Tag = -1 ) ) Then Abort;

    with dtmGeraDados.sqlDeletaValores do begin
      if ( trim( pdblcCenarioText ) <> '' ) Then Begin
        //Zera os valores do Cenário
        CdsDeletaValores.Close;
        SQL.Clear;
        SQL.Add('UPDATE VALORESCENARIO S SET S.VLRORCCENARIO = 0                ');
        SQL.Add('WHERE                                                          ');
        SQL.Add('   (EXISTS (SELECT C.IDCONTAORCAMEN                            ');
        SQL.Add('            FROM CONTASORCAMEN C                               ');
        SQL.Add('            WHERE  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND    ');
        SQL.Add('                   (C.TIPOCALCORCADO <> ''V'') AND             ');
        SQL.Add('                   (C.TIPOCALCORCADO <> ''T'') AND             ');
        SQL.Add('                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ');
        SQL.Add('                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ');
        SQL.Add('   (S.IDPLANOORCAMEN   = :IDPLANOORCAMEN) AND                  ');
        SQL.Add('   (S.IDCENARIOORCAMEN = :IDCENARIOORCAMEN) AND                ');
        SQL.Add('   (S.EXERCICIO = :EXERCICIO) AND                              ');
        SQL.Add('   (S.PERIODO   = :PERIODO) AND                                ');
        if trim( pedConteudo1Text) <> '' Then begin
           SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') = ('''+trim( pedConteudo1Text )+''')) AND ');
        End;
        SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');
        If not Prepared Then Prepare;
        ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
        ParamByName('PESSOA').asInteger          := IdEmpresa;
        ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExercicioLookupValue);
        ParamByName('PERIODO').asInteger         := iPeriodoAtu;
        ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt( pdblcCenarioLookupValue );
        AtualizaTabela( SqlChanged );

        If ( ( edtStatus.Tag = -1 ) ) Then Abort;

        if ( pcbBuscaSaldoAnteriorChecked ) Then Begin

          CdsDeletaValores.Close;
          SQL.Clear;
          SQL.Add('UPDATE VALORESCENARIO S SET S.VLRORCCENARIO = 0                ');
          SQL.Add('WHERE                                                          ');
          SQL.Add('   (EXISTS (SELECT C.IDCONTAORCAMEN                            ');
          SQL.Add('            FROM CONTASORCAMEN C                               ');
          SQL.Add('            WHERE  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND    ');
          SQL.Add('                   (C.TIPOCALCORCADO <> ''V'') AND             ');
          SQL.Add('                   (C.TIPOCALCORCADO <> ''T'') AND             ');
          SQL.Add('                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ');
          SQL.Add('                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ');
          SQL.Add('   (S.IDPLANOORCAMEN   = :IDPLANOORCAMEN) AND                  ');
          SQL.Add('   (S.IDCENARIOORCAMEN = :IDCENARIOORCAMEN) AND                ');
          SQL.Add('   (S.EXERCICIO = :EXERCICIO) AND                              ');
          SQL.Add('   (S.PERIODO IS NULL) AND                                     ');
          if trim( pedConteudo1Text ) <> '' Then begin
             SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+ FloatToStr( psePosIni1Value)+','+ FloatToStr( psePosFim1Value )+') = ('''+ trim( pedConteudo1Text )+''')) AND ');
          End;
          SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');
          If not Prepared Then Prepare;
          ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
          ParamByName('PESSOA').asInteger          := IdEmpresa;
          ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExercicioLookupValue );
          ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt( pdblcCenarioLookupValue );
          AtualizaTabela(  SqlChanged );

          If ( ( edtStatus.Tag = -1 ) ) Then Abort;
        End;
      End Else Begin
        if ( prgrpTipoItemIndex = 0) or ( prgrpTipoItemIndex = 2) Then Begin
          //Zera os valores dos Saldos Orçados
          CdsDeletaValores.Close;
          SQL.Clear;
          SQL.Add('UPDATE SALDOORCADO S SET S.VLRORCADO = 0, VLRORCACUM = 0       ');
          SQL.Add('WHERE                                                          ');
          SQL.Add('   (EXISTS (SELECT C.IDCONTAORCAMEN                            ');
          SQL.Add('            FROM CONTASORCAMEN C                               ');
          SQL.Add('            WHERE  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND    ');
          SQL.Add('                   (C.TIPOCALCORCADO <> ''V'') AND             ');
          SQL.Add('                   (C.TIPOCALCORCADO <> ''T'') AND             ');
          SQL.Add('                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ');
          SQL.Add('                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ');
          SQL.Add('   (S.IDPLANOORCAMEN   = :IDPLANOORCAMEN) AND                  ');
          SQL.Add('   (S.DATAREFERENCIA   >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) AND');
          SQL.Add('   (S.DATAREFERENCIA   <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) AND');
          if trim( pedConteudo1Text ) <> '' Then begin
             SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') = ('''+trim( pedConteudo1Text )+''')) AND ');
          End;
          SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');
          If not Prepared Then Prepare;
          ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
          ParamByName('PESSOA').asInteger         := IdEmpresa;
          ParamByName('DATAINI').asString         := CdsPeriodo.FieldByName( 'DataIniPeriodo' ).AsString;
          ParamByName('DATAFIM').asString         := CdsPeriodo.FieldByName( 'DataFimPeriodo' ).AsString;
          AtualizaTabela(  SqlChanged );

          If ( ( edtStatus.Tag = -1 ) ) Then Abort;

          if ( pcbBuscaSaldoAnteriorChecked ) Then Begin
            CdsDeletaValores.Close;
            SQL.Clear;
            SQL.Add('UPDATE SALDOORCADOANT S SET S.VLRORCADO = 0                    ');
            SQL.Add('WHERE                                                          ');
            SQL.Add('   (EXISTS (SELECT C.IDCONTAORCAMEN                            ');
            SQL.Add('            FROM CONTASORCAMEN C                               ');
            SQL.Add('            WHERE  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND    ');
            SQL.Add('                   (C.TIPOCALCORCADO <> ''V'') AND             ');
            SQL.Add('                   (C.TIPOCALCORCADO <> ''T'') AND             ');
            SQL.Add('                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ');
            SQL.Add('                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ');
            SQL.Add('   (S.IDPLANOORCAMEN   = :IDPLANOORCAMEN) AND                  ');
            SQL.Add('   (S.EXERCICIO = :EXERCICIO) AND');
            if trim( pedConteudo1Text ) <> '' Then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value)+','+FloatToStr( psePosFim1Value)+') = ('''+trim( pedConteudo1Text )+''')) AND ');
            End;
            SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');
            If not Prepared Then Prepare;
            ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
            ParamByName('PESSOA').asInteger         := IdEmpresa;
            ParamByName('EXERCICIO').asInteger      := StrToInt( pdblkExercicioLookupValue );
            AtualizaTabela(  SqlChanged );
            CdsDeletaValores.Close;

            If ( ( edtStatus.Tag = -1 ) ) Then Abort;
          End;
        End;

        if ( ( prgrpTipoItemIndex = 1) or ( prgrpTipoItemIndex = 2) ) Then Begin
          //Zera os valores dos Saldos Realizados
          CdsDeletaValores.Close;
          SQL.Clear;
          SQL.Add('UPDATE SALDOORCADO S SET S.VLRREALIZADO = 0, S.VLRREALACUM = 0 ');
          SQL.Add('WHERE                                                          ');
          SQL.Add('   (EXISTS (SELECT C.IDCONTAORCAMEN                            ');
          SQL.Add('            FROM CONTASORCAMEN C                               ');
          SQL.Add('            WHERE  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND    ');
          SQL.Add('                   (C.TIPOCALCREALIZADO <> ''V'') AND          ');
          SQL.Add('                   (C.TIPOCALCREALIZADO <> ''T'') AND          ');
          SQL.Add('                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ');
          SQL.Add('                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ');
          SQL.Add('   (S.DATAREFERENCIA   >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) AND');
          SQL.Add('   (S.DATAREFERENCIA   <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) AND');
          if trim( pedConteudo1Text ) <> '' Then begin
             SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') = ('''+trim( pedConteudo1Text )+''')) AND ');
          End;
          SQL.Add('   (S.IDPESSOA  = :PESSOA)                                     ');
          If not Prepared Then Prepare;
          ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
          ParamByName('PESSOA').asInteger         := IdEmpresa;
          ParamByName('DATAINI').asString         := CdsPeriodo.FieldByName( 'DataIniPeriodo' ).AsString;
          ParamByName('DATAFIM').asString         := CdsPeriodo.FieldByName( 'DataFimPeriodo' ).AsString;
          AtualizaTabela(  SqlChanged );
          CdsDeletaValores.Close;

          If ( ( edtStatus.Tag = -1 ) ) Then Abort;

          if ( pcbBuscaSaldoAnteriorChecked ) Then Begin
            CdsDeletaValores.Close;
            SQL.Clear;
            SQL.Add('UPDATE SALDOORCADOANT S SET S.VLRREALIZADO = 0                    ');
            SQL.Add('WHERE                                                          ');
            SQL.Add('   (EXISTS (SELECT C.IDCONTAORCAMEN                            ');
            SQL.Add('            FROM CONTASORCAMEN C                               ');
            SQL.Add('            WHERE  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND    ');
            SQL.Add('                   (C.TIPOCALCORCADO <> ''V'') AND             ');
            SQL.Add('                   (C.TIPOCALCORCADO <> ''T'') AND             ');
            SQL.Add('                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ');
            SQL.Add('                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ');
            SQL.Add('   (S.IDPLANOORCAMEN   = :IDPLANOORCAMEN) AND                  ');
            SQL.Add('   (S.EXERCICIO = :EXERCICIO) AND');
            if trim( pedConteudo1Text ) <> '' Then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+ FloatToStr( psePosIni1Value)+','+FloatToStr( psePosFim1Value)+') = ('''+trim( pedConteudo1Text )+''')) AND ');
            End;
            SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');
            If not Prepared Then Prepare;
            ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
            ParamByName('PESSOA').asInteger         := IdEmpresa;
            ParamByName('EXERCICIO').asInteger      := StrToInt( pdblkExercicioLookupValue );
            AtualizaTabela(  SqlChanged );
            CdsDeletaValores.Close;

            If ( ( edtStatus.Tag = -1 ) ) Then Abort;
          End;
        End;
      End;
    End;
    Commit;
    Result := True;
  Except
    On E: Exception Do Begin
      Result := False;
      RollBack;
      MessageInfo := E.Message;
      //Raise;
    End;
  End;
End;
//************************************************
Function  TCtrlGeraDados.GeraDadosZeraFlagCalculo( prgrpTipoItemIndex : Integer;
                                                   pedConteudo1Text   : String;
                                                   psePosIni1Value,
                                                   psePosFim1Value   : Integer ) : Boolean;
begin
  Try
    StartTransaction;

    if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Zera Flag de Cálculo') Then Abort;
    with DtmGeraDados.sqlFlagCalculo do begin

      If ( ( edtStatus.Tag = -1 ) ) Then Abort;

      if ( prgrpTipoItemIndex = 0) or ( prgrpTipoItemIndex = 2) Then begin
        //Seta as Flags de Cálculo nas contas para Não Calculadas
        SQL.Clear;
        SQL.Add('UPDATE CONTASORCAMEN SET ');
        SQL.Add('FLGCALCORCADO = ''N'' ');
        SQL.Add('WHERE (TIPOCALCORCADO <> ''V'') AND ');
        SQL.Add('      (TIPOCALCORCADO <> ''T'') AND ');
        SQL.Add('      ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
        if trim( pedConteudo1Text ) <> '' Then begin
           SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') = ('''+trim( pedConteudo1Text )+''')) AND ');
        End;
        SQL.Add('      (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc)+')');
        AtualizaTabela( SqlChanged );

        If ( ( edtStatus.Tag = -1 ) ) Then Abort;

        SQL.Clear;
        SQL.Add('UPDATE CONTASORCAMEN SET ');
        SQL.Add('FLGCALCORCADO = ''S'' ');
        SQL.Add('WHERE ((TIPOCALCORCADO = ''V'') OR ');
        SQL.Add('       (FLGATIVA = ''I'') OR ');
        if trim( pedConteudo1Text) <> '' Then begin
           SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') <> ('''+trim( pedConteudo1Text )+''')) OR ');
        End;
        SQL.Add('      (TIPOCALCORCADO = ''T'')) AND ');
        SQL.Add('      (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc )+')');
        AtualizaTabela( SqlChanged );

        If ( ( edtStatus.Tag = -1 ) ) Then Abort;
      End;

      if ( prgrpTipoItemIndex = 1 ) or ( prgrpTipoItemIndex = 2) Then begin
        //Seta as Flags de Cálculo nas contas para Não Calculadas
        SQL.Clear;
        SQL.Add('UPDATE CONTASORCAMEN SET ');
        SQL.Add('FLGCALCREAL = ''N'' ');
        SQL.Add('WHERE (TIPOCALCREALIZADO <> ''V'') AND ');
        SQL.Add('      (TIPOCALCREALIZADO <> ''T'') AND ');
        SQL.Add('      ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
        if trim( pedConteudo1Text ) <> '' Then begin
           SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') = ('''+trim( pedConteudo1Text )+''')) AND ');
        End;
        SQL.Add('      (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc )+')');
        AtualizaTabela( SqlChanged );

        If ( ( edtStatus.Tag = -1 ) ) Then Abort;

        SQL.Clear;
        SQL.Add('UPDATE CONTASORCAMEN SET ');
        SQL.Add('FLGCALCREAL = ''S'' ');
        SQL.Add('WHERE ((TIPOCALCREALIZADO = ''V'') OR ');
        SQL.Add('       (FLGATIVA = ''I'') OR ');
        if trim( pedConteudo1Text ) <> '' Then begin
           SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') <> ('''+trim( pedConteudo1Text )+''')) OR ');
        End;
        SQL.Add('      (TIPOCALCREALIZADO = ''T'')) AND ');
        SQL.Add('      (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc )+')');
        AtualizaTabela( SqlChanged );

        If ( ( edtStatus.Tag = -1 ) ) Then Abort;
      End;
    End;
    Commit;
    Result := True;
  Except
    On E: Exception Do Begin
      Result := False;
      RollBack;
      MessageInfo := E.Message;
      bConcluiuOK := False;
      //Raise;
    End;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.CalculaTiposOrcado( dDataCorrente:TDateTime;
                                             pdblcCenarioText,
                                             pdblkExercicioLookupValue,
                                             pdblcCenarioLookupValue   : String;
                                             pcbBuscaSaldoAnteriorChecked : Boolean;
                                             psePosIni1Value,
                                             psePosFim1Value : Double;
                                             pedConteudo1Text,
                                             pdblkExerciciotext : String );

Var
  iNumRegistros, iNumRegAnterior : longint;
Begin

  bSaiLoop := false;
  //Atribui os contadores de registros depois dos tipos acima já calculados
  iNumRegAnterior := SelecionaContasNaoCalculadas('O');
  iNumRegistros   := SelecionaContasNaoCalculadas('O');

  while ( not bSaiLoop ) And
        ( Not ( edtStatus.Tag = -1 ) ) do begin
    //Voltar aqui
    //Faz o cálculo das contas recursivamente até não existir mais nenhuma não calculada
    CalculaValorFixoInf( dDataCorrente, 'O',
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         psePosIni1Value,
                         psePosFim1Value,
                         pedConteudo1Text,
                         pdblkExerciciotext   );   //Tipo I

    If iNumRegistros = 0 Then Begin
      bSaiLoop := true;
    End Else Begin
      //Chama separadamente as rotinas de cálculo de Contas Orçadas
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Composição - Orçado') Then Abort;
         CalculaComposicao( dDataCorrente, 'O', pdblcCenarioText,
                            pdblkExercicioLookupValue,
                            pdblcCenarioLookupValue,
                            pcbBuscaSaldoAnteriorChecked,
                            psePosIni1Value,
                            psePosFim1Value,
                            pedConteudo1Text,
                            pdblkExerciciotext );      //Tipo F

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;
         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Acumulado - Orçado') Then Abort;
         CalculaAcumulado( dDataCorrente, 'O',
                           pcbBuscaSaldoAnteriorChecked,
                           pdblcCenarioText,
                           pdblkExercicioLookupValue,
                           pdblcCenarioLookupValue,
                           psePosIni1Value,
                           psePosFim1Value,
                           pedConteudo1Text,
                           pdblkExerciciotext );                             //Tipo A

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;

         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Condicional - Orçado') Then Abort;
         CalculaCondicional( dDataCorrente, 'O',
                             pdblcCenarioText,
                             pdblkExercicioLookupValue,
                             pdblcCenarioLookupValue,
                             pcbBuscaSaldoAnteriorChecked,
                             psePosIni1Value,
                             psePosFim1Value,
                             pedConteudo1Text,
                             pdblkExerciciotext );                                  //Tipo C

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;

         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      Try
        StartTransaction;
        if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fórmula - Orçado') Then Abort;
        CalculaFormula( dDataCorrente, 'O',
                        pcbBuscaSaldoAnteriorChecked,
                        pdblcCenarioText,
                        pdblkExercicioLookUpValue,
                        pdblcCenarioLookUpValue,
                        psePosIni1Value,
                        psePosFim1Value,
                        pedConteudo1Text,
                        pdblkExerciciotext );                                //Tipo M

        If ( ( edtStatus.Tag = -1 ) ) Then Abort;

        Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      iNumRegistros := SelecionaContasNaoCalculadas('O');

      //Verifica se o número de contas não calculadas é igual ao da interação anterior
      //Se for, o Sistema está em loop infinito.
      If iNumRegistros = iNumRegAnterior Then begin
        memErroNaGeracao.Text := 'A Geração de Dados não está conseguindo prosseguir.'  +
                            'Provavelmente existem contas calculadas do tipo '          +
                            'Orçado com referências cruzadas (a Conta nº ' + edtConta.Text +
                            ' é uma delas - comece procurando por ela). ' + chr(13) + chr(13) +
                            'Verifique o seu Plano de Contas Orçamentárias para corrijir o erro.';
                            //'Deseja verificar as contas que ainda não estão calculadas?';

        //if msgDlg(sMensagem, 'Erro', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then begin
        VerificaNaoCalculadas('O');
        //End;
        bSaiLoop     := true;
        bSaiLoopDias := true;
      End Else Begin
        iNumRegAnterior := iNumRegistros;
      End;
    End;
  End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaTiposRealizado( dDataCorrente   : TDateTime;
                                                pdblcCenarioText,
                                                pdblkExercicioLookupValue,
                                                pdblcCenarioLookupValue : String;
                                                pcbBuscaSaldoAnteriorChecked  : Boolean;
                                                psePosIni1Value,
                                                psePosFim1Value : Double;
                                                pedConteudo1Text,
                                                pdblkExerciciotext : String );

var iNumRegistros, iNumRegAnterior : longint;
//    sMensagem : string;
begin

  bSaiLoop := false;

  //Atribui os contadores de registros depois dos tipos acima já calculados
  iNumRegAnterior := SelecionaContasNaoCalculadas('R');
  iNumRegistros   := SelecionaContasNaoCalculadas('R');
  Try
     StartTransaction;
     if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Genérico - Realizado') Then Abort;
     CalculaGenericos( dDataCorrente, 'R',
                       pdblcCenarioText,
                       pdblkExercicioLookUpValue,
                       pdblcCenarioLookUpValue,
                       psePosIni1Value,
                       psePosFim1Value,
                       pedConteudo1Text,
                       pdblkExerciciotext );                                //Tipo G

     If ( ( edtStatus.Tag = -1 ) ) Then Abort;

     Commit;
  Except
    On E: Exception Do Begin

      RollBack;
      bConcluiuOK := False;
      MessageInfo := E.Message;
      Raise;
    End;
  End;
  Try
     StartTransaction;
     if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Contabilidade - Realizado') Then Abort;
     CalculaContabilidade( dDataCorrente, 'R',
                           pcbBuscaSaldoAnteriorChecked,
                           pdblkExercicioLookupValue,
                           pdblcCenarioText,
                           pdblcCenarioLookUpValue,
                           psePosIni1Value,
                           psePosFim1Value,
                           pedConteudo1Text,
                           pdblkExerciciotext );                                  //Tipo P

     If ( ( edtStatus.Tag = -1 ) ) Then Abort;
     Commit;
  Except
    On E: Exception Do Begin

      RollBack;
      bConcluiuOK := False;
      MessageInfo := E.Message;
      Raise;
    End;
  End;
  Try
     StartTransaction;
     if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fluxo de Caixa - Realizado') Then Abort;
     CalculaFluxo( dDataCorrente, 'R',
                   pdblcCenarioText,
                   pdblkExercicioLookUpValue,
                   pdblcCenarioLookUpValue,
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text,
                   pdblkExerciciotext );                              //Tipo X

     If ( ( edtStatus.Tag = -1 ) ) Then Abort;

     Commit;
  Except
    On E: Exception Do Begin

      RollBack;
      bConcluiuOK := False;
      MessageInfo := E.Message;
      Raise;
    End;
  End;
  Try
     StartTransaction;
     if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fixo - Realizado') Then Abort;
     CalculaValorFixoInf( dDataCorrente, 'R',
                          pdblcCenarioText,
                          pdblkExercicioLookUpValue,
                          pdblcCenarioLookUpValue,
                          psePosIni1Value,
                          psePosFim1Value,
                          pedConteudo1Text,
                          pdblkExerciciotext );    //Tipo I

     If ( ( edtStatus.Tag = -1 ) ) Then Abort;

     Commit;
  Except
    On E: Exception Do Begin
      RollBack;
      bConcluiuOK := False;
      MessageInfo := E.Message;
      Raise;
    End;
  End;
  while ( not bSaiLoop ) And
       ( Not ( edtStatus.Tag = -1 ) ) do begin
    //Faz o cálculo das contas recursivamente até não existir mais nenhuma não calculada

    If iNumRegistros = 0 Then begin
       bSaiLoop := true;
    End Else Begin
      //Chama separadamente as rotinas de cálculo de Contas Realizadas
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Acumulado - Realizado') Then Abort;
         CalculaAcumulado( dDataCorrente, 'R',
                           pcbBuscaSaldoAnteriorChecked,
                           pdblcCenarioText,
                           pdblkExercicioLookupValue,
                           pdblcCenarioLookupValue,
                           psePosIni1Value,
                           psePosFim1Value,
                           pedConteudo1Text,
                           pdblkExerciciotext );                                 //Tipo A

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;

         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Composição - Realizado') Then Abort;
         CalculaComposicao( dDataCorrente, 'R', pdblcCenarioText,
                            pdblkExercicioLookupValue,
                            pdblcCenarioLookupValue,
                            pcbBuscaSaldoAnteriorChecked,
                            psePosIni1Value,
                            psePosFim1Value,
                            pedConteudo1Text,
                            pdblkExerciciotext );                               //Tipo F

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;

         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Condicional - Realizado') Then Abort;
         CalculaCondicional( dDataCorrente, 'R',
                             pdblcCenarioText,
                             pdblkExercicioLookupValue,
                             pdblcCenarioLookupValue,
                             pcbBuscaSaldoAnteriorChecked,
                             psePosIni1Value,
                             psePosFim1Value,
                             pedConteudo1Text,
                             pdblkExerciciotext );                                  //Tipo C

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;

         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;
      Try
         StartTransaction;
         if not GravaLogOperacoesOrc( idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fórmula - Realizado') Then Abort;
         CalculaFormula( dDataCorrente, 'R',
                         pcbBuscaSaldoAnteriorChecked,
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         psePosIni1Value,
                         psePosFim1Value,
                         pedConteudo1Text,
                         pdblkExerciciotext );                                 //Tipo M

         If ( ( edtStatus.Tag = -1 ) ) Then Abort;

         Commit;
      Except
        On E: Exception Do Begin

          RollBack;
          bConcluiuOK := False;
          MessageInfo := E.Message;
          Raise;
        End;
      End;

      iNumRegistros := SelecionaContasNaoCalculadas('R');

      //Verifica se o número de contas não calculadas é igual ao da interação anterior
      //Se for, o Sistema está em loop infinito.
      if iNumRegistros = iNumRegAnterior Then begin
        memErroNaGeracao.Text := 'A Geração de Dados não está conseguindo prosseguir.' +
                            'Provavelmente existem contas calculadas do tipo ' +
                            'Realizado com referências cruzadas (a Conta nº ' + edtConta.Text +
                            ' é uma delas - comece procurando por ela). ' + chr(13) + chr(13) +
                            'Verifique o seu Plano de Contas Orçamentárias para corrijir o erro.';
                            //'Deseja verificar as contas que ainda não estão calculadas?';

        //if msgDlg(sMensagem, 'Erro', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then begin
        VerificaNaoCalculadas('R');
        //End;
        bSaiLoop     := true;
        bSaiLoopDias := true;
      End Else Begin
        iNumRegAnterior := iNumRegistros;
      End;
    End;
  End;
End;
//************************************************
Function TCtrlGeraDados.SelecionaContasNaoCalculadas( cCalcOR : char ) : LongInt;
Begin
  //Seleciona as Contas Orcamentárias do Tipo desejado, com o Calculo (O/R) desejado
  With dtmGeraDados.SqlContasAux Do Begin
    CdsContasAux.Close;
    SQL.Clear;
    SQL.Add('SELECT COUNT(FLGSINALCONTA) FROM CONTASORCAMEN ');

    If cCalcOR = 'O' Then Begin
       SQL.Add('WHERE (FLGCALCORCADO = ''N'') ');
    End Else Begin
       SQL.Add('WHERE (FLGCALCREAL = ''N'') ');
    End;

    SQL.Add(' AND (TIPOCALCREALIZADO <> ''T'') ');
    SQL.Add(' AND (TIPOCALCORCADO <> ''T'') ');
    SQL.Add(' AND ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL))  ');
    SQL.Add(' AND (IDPLANOORCAMEN = '+IntToStr( iPlanoOrc )+')');

    If Not Prepared Then Prepare;
    CdsContasAux.Data := GetDataPacket( SqlChanged );

    Result := CdsContasAux.Fields[0].value;
  End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaValorFixoInf( dDataCorrente:TDateTime; cCalcOR:char;
                                              pdblcCenarioText,
                                              pdblkExercicioLookUpValue,
                                              pdblcCenarioLookUpValue : String;
                                              psePosIni1Value,
                                              psePosFim1Value : Double;
                                              pedConteudo1Text,
                                              pdblkExerciciotext : String );
var rValor, rValorAcum : real;
    iNumeroDias : integer;
begin

  //Cálculo de contas de Valor Fixo Informado (tipo "I")
  edtTipo.Text := 'Valor Fixo Informado';
  SelecionaContas( cCalcOr, 'I',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text );

  //Verifica se o cálculo da conta informada é diário ou por período
  if CdsContas.FieldByName('FLGINFDIAMES').asString = 'P' Then begin
     //Pega o número de dias do período para fazer o rateio do valor
     iNumeroDias := Trunc( CdsPeriodo.FieldByName( 'DataFimPeriodo').AsDateTime ) - Trunc( CdsPeriodo.FieldByName( 'DataIniPeriodo' ).AsDateTime ) + 1;
  End Else Begin
     iNumeroDias := 1;
  End;

  //Varre a query de Contas selecionada
  while ( not CdsContas.eof ) And
       ( Not ( edtStatus.Tag = -1 ) ) do begin

    edtConta.Text := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
    rValor := 0;

    with dtmGeraDados.SqlContasAux do begin
      CdsContasAux.Close;
      SQL.Clear;
      SQL.Add('SELECT VLRINFORMADOREAL, VLRINFORMADOORC FROM ');
      SQL.Add('CONTASORCAMEN ');

      if cCalcOR = 'O' Then begin
         SQL.Add('WHERE (TIPOCALCORCADO =:TIPO) AND ');
      End Else Begin
         SQL.Add('WHERE (TIPOCALCREALIZADO =:TIPO) AND ');
      End;
      SQL.Add('((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
      SQL.Add('(IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
      SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) ');

      if not Prepared Then Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN').AsInteger;
      ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName( 'IDCONTAORCAMEN').AsString;
      ParamByName('TIPO').asString  := 'I';
      CdsContasAux.Data := GetDataPacket( SqlChanged );;

      if not CdsContasAux.isEmpty Then Begin
        if cCalcOR = 'O' Then begin
          rValor := ( CdsContasAux.FieldByName('VLRINFORMADOORC').asFloat / iNumeroDias);
        End Else Begin
          rValor := ( CdsContasAux.FieldByName('VLRINFORMADOREAL').asFloat / iNumeroDias);
        End;
      End;
    End;

    //Grava os dados na tabela de Saldos Orcamentarios
    if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
       rValor := 0;
    End Else Begin
       if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
          rValor := rValor * -1;
    End;
    rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                       pdblcCenarioText,
                                       pdblkExercicioLookUpValue,
                                       pdblcCenarioLookUpValue );
    GravaSaldos( rValor, rValorAcum, dDataCorrente, cCalcOR,
                 pdblcCenarioText,
                 pdblkExercicioLookUpValue,
                 pdblcCenarioLookUpValue,
                 pdblkExerciciotext      );

    CdsContas.next;
  End;
End;
//************************************************
Procedure TCtrlGeraDados.CalculaComposicao( dDataCorrente    :TDateTime;
                                            cCalcOR          :char;
                                            pdblcCenarioText,
                                            pdblkExercicioLookupValue,
                                            pdblcCenarioLookupValue   : String;
                                            pcbBuscaSaldoAnteriorChecked : Boolean;
                                            psePosIni1Value,
                                            psePosFim1Value : Double;
                                            pedConteudo1Text,
                                            pdblkExerciciotext : String );

var rValorAnt, rValor, rValorAcum : real;
    sFieldConta, sFieldSaldo, sFieldPerc, sFieldCalc : string;
begin

   //Cálculo de contas de Composição (tipo "F")
   edtTipo.Text := 'Composição';

   //Monta o Nome dos Fields da flag de cálculo
   if cCalcOR = 'O' Then begin
      sFieldCalc  := 'FLGCALCORCADO';
      sFieldConta := 'IDCONTAREFORCADO';
      sFieldSaldo := 'VLRORCADO';
      sFieldPerc  := 'PERCCONTAREFORC';
   End Else Begin
      sFieldCalc  := 'FLGCALCREAL';
      sFieldConta := 'IDCONTAREFREAL';
      sFieldSaldo := 'VLRREALIZADO';
      sFieldPerc  := 'PERCCONTAREFREA';
   End;

   SelecionaContas(cCalcOr, 'F',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text );

   With CdsContas Do Begin

      //Varre a query de Contas
      while ( Not Eof ) And
            ( Not ( edtStatus.Tag = -1 ) ) do begin

         edtConta.Text := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;

         SelecionaComposicao( CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString, CdsContas.FieldByName( 'IDPLANOORCAMEN').AsInteger, cCalcOR, 'F');

         bTestaCalculada := True;
         rValor    := 0;
         rValorAnt := 0;

         with CdsComposicao do begin

            //Varre a query de Composicao
            while ( not eof ) And
                  ( Not ( edtStatus.Tag = -1 ) ) do begin

               //Verifica se a conta de composição é vazia
               //(ex.: pode ser uma conta de composição realizada no calculo da orçada)
               if not CdsComposicao.FieldByName(sFieldConta).isNull Then begin
                  //Faz a query de busca do Valor do Saldo para cada conta de referencia
                  if TestaCalculada( CdsComposicao.FieldByName(sFieldConta).asString, cCalcOR) Then begin
                     //
                     With DtmGeraDados.SqlVerificaSinal do begin
                       CdsVerificaSinal.Close;
                       if not prepared Then prepare;
                       ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
                       ParamByName('IDCONTAORCAMEN').AsString := CdsComposicao.FieldByName( sFieldConta ).asString;
                       CdsVerificaSinal.Data:= GetDataPacket( SqlChanged );;
                     End;
                     with DtmGEraDados.SqlCompContas do begin
                        CdsCompContas.Close;
                        SQL.Clear;
                        if trim( pdblcCenarioText ) <> '' Then
                           SQL.Add('SELECT SUM(VLRORCCENARIO) AS '+sFieldSaldo+' FROM VALORESCENARIO ')
                        else
                           SQL.Add('SELECT SUM(' + sFieldSaldo + ') AS '+sFieldSaldo+' FROM SALDOORCADO ');
                        SQL.Add('WHERE ');
                        SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
                        SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
                        SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
                        if trim( pdblcCenarioText ) <> '' Then begin
                           SQL.Add('(EXERCICIO  =:EXERCICIO) AND ');
                           SQL.Add('(PERIODO  =:PERIODO) AND ');
                           SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN)  ');
                        End Else Begin
                           If sGeraMes = 'S' Then
                              SQL.Add('(TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATAREFERENCIA) ')
                           else
                              SQL.Add('(DATAREFERENCIA =:DATAREFERENCIA) ');
                        End;
                        If Not Prepared Then Prepare;
                        ParamByName('IDPLANOORCAMEN').Asinteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName(sFieldConta).asString;
                        ParamByName('IDPESSOA').AsInteger   := idEmpresa;
                        DecodeDate(dDataCorrente,iAno,iMes,iDia);
                        If trim( pdblcCenarioText ) <> '' Then Begin
                          ParamByName('EXERCICIO').AsInteger        := StrToInt( pdblkExercicioLookupValue );
                          ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                          ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                        End Else Begin
                          If sGeraMes = 'S' Then
                            ParamByName('DATAREFERENCIA').AsString   :=  FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  )
                                                                           //Biblioteca.ZD(trim( IntToStr(iAno) ),4) + Biblioteca.ZD( trim( IntToStr( iMes )),2)
                          Else
                            ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                        End;
                        CdsCompContas.Data := GetDataPacket( SqlChanged );;
                        CdsCompContas.First;

                        //Incrementa o acumulador de valores das contas da Composição
                        //multiplicando pelo percentual da conta
                        if not CdsCompContas.isEmpty Then begin
                           if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                              rValor := rValor + 0;
                           End Else Begin
                              if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then
                                 rValor := rValor + (CdsCompContas.FieldByName(sFieldSaldo).asFloat *
                                       (CdsComposicao.FieldByName(sFieldPerc).asFloat / 100 ))
                              else
                                 rValor := rValor + (( CdsCompContas.FieldByName(sFieldSaldo).asFloat*-1) *
                                       ( CdsComposicao.FieldByName(sFieldPerc).asFloat / 100 ));
                           End;
                        End;
                     End;

                     if pcbBuscaSaldoAnteriorChecked Then begin
                        with DtmGeraDados.sqlCompContas do begin
                           CdsCompContas.Close;
                           SQL.Clear;

                           if trim( pdblcCenarioText ) <> '' Then
                              SQL.Add('SELECT SUM(VLRORCCENARIO) AS '+sFieldSaldo+' FROM VALORESCENARIO ')
                           else
                              SQL.Add('SELECT SUM(' + sFieldSaldo + ') AS '+sFieldSaldo+' FROM SALDOORCADOANT ');
                           SQL.Add('WHERE ');
                           if trim( pdblcCenarioText ) <> '' Then begin
                              SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN) AND ');
                              SQL.Add('(PERIODO IS NULL) AND ');
                           End;
                           SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
                           SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
                           SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
                           SQL.Add('(EXERCICIO =:EXERCICIO) ');
                           If Not Prepared Then Prepare;
                           If trim( pdblcCenarioText ) <> '' Then
                              ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                           ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
                           ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName(sFieldConta).asString;
                           ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                           ParamByName('EXERCICIO').AsInteger      := StrToInt( pdblkExercicioLookupValue );
                           CdsCompContas.Data := GetDataPacket( SqlChanged );;
                           CdsCompContas.First;

                           //Incrementa o acumulador de valores das contas da Composição
                           //multiplicando pelo percentual da conta
                           if not isEmpty Then begin
                              if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                                 rValorAnt := rValorAnt + 0;
                              End Else Begin
                                 if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then
                                    rValorAnt := rValorAnt + ( CdsCompContas.FieldByName(sFieldSaldo).asFloat *
                                          ( CdsComposicao.FieldByName(sFieldPerc).asFloat / 100 ))
                                 else
                                    rValorAnt := rValorAnt + (( CdsCompContas.FieldByName(sFieldSaldo).asFloat*-1) *
                                          ( CdsComposicao.FieldByName(sFieldPerc).asFloat / 100 ));
                              End;
                           End;
                        End;
                     End;
                  End Else Begin
                     bTestaCalculada := False;
                     Break;
                  End;
               End;
               next;
            end
         End;

         if bTestaCalculada Then Begin
            //Grava os dados na tabela de Saldos Orcamentarios
            if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
               rValor := 0;
            End Else Begin
               if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                  rValor := rValor * -1;
            End;
            rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                               pdblcCenarioText,
                                               pdblkExercicioLookUpValue,
                                               pdblcCenarioLookUpValue );
            GravaSaldos( rValor,rValorAcum, dDataCorrente, cCalcOR,
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         pdblkExerciciotext      );

            if pcbBuscaSaldoAnteriorChecked Then begin
               if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                  rValorAnt := 0;
               End Else Begin
                  if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                     rValorAnt := rValorAnt * -1;
               End;
               GravaSaldosAnt( rValorAnt,cCalcOR,
                               pdblcCenarioText,
                               pdblkExercicioLookUpValue,
                               pdblcCenarioLookUpValue,
                               pdblkExerciciotext      );
            End;
         End;
         next;
      End;
   End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaAcumulado( dDataCorrente:TDateTime; cCalcOR:char;
                                           pcbBuscaSaldoAnteriorChecked : Boolean;
                                           pdblcCenarioText,
                                           pdblkExercicioLookupValue,
                                           pdblcCenarioLookupValue : String;
                                           psePosIni1Value,
                                           psePosFim1Value : Double;
                                           pedConteudo1Text,
                                           pdblkExerciciotext : String );

var rValor, rValorAcum, rValAcumAnt : real;
    sCalculo, sFormula, sMesAnt : string;
    sqlAcum2 : TCMSqlParams;
    dDataAnt : TDateTime;
begin

   //Cálculo de contas de Acumulado (tipo "A")
   edtTipo.Text := 'Acumulado';
   SelecionaContas( cCalcOr, 'A',
                    psePosIni1Value,
                    psePosFim1Value,
                    pedConteudo1Text);

   with CdsContas do begin
      //Varre a query de Contas selecionada
      while ( not eof ) And
            ( Not ( edtStatus.Tag = -1 ) ) do begin
         edtConta.Text := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;

         if pcbBuscaSaldoAnteriorChecked Then begin

            if cCalcOR = 'O' Then begin
               sFormula := CdsContas.FieldByName( 'FORMULAORCADO' ).AsString;
            End Else Begin
               sFormula := CdsContas.FieldByName( 'FORMULAREALIZADO' ).AsString;
            End;

            sCalculo := TransformaContas(sFormula, dDataCorrente, cCalcOR, 'N', true,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue);
            if sCalculo <> '' Then begin
               try
                 dtmGeraDados.Parser.Expression := sCalculo;
                 //Pega o Valor retornado pelo parser
                 rValor := dtmGeraDados.Parser.value;
               except
                 rValor := 0;
               End;
               //Grava os dados na tabela de Saldos Orcamentarios
               if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                  rValor := 0;
               End Else Begin
                  if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                     rValor := rValor * -1;
               End;
               GravaSaldosAnt( rValor,cCalcOR,
                               pdblcCenarioText,
                               pdblkExercicioLookUpValue,
                               pdblcCenarioLookUpValue,
                               pdblkExerciciotext      );

            End;
         End;
         if trim( pdblcCenarioText ) <> '' Then begin
            sqlAcum2 := dtmGeraDados.sqlAcumulado2MC;
         End Else Begin
            If sGeraMes = 'S' Then
               sqlAcum2 := dtmGeraDados.sqlAcumulado2M
            Else
               sqlAcum2 := dtmGeraDados.sqlAcumulado2;
         End;
         DecodeDate(dDataCorrente,iAno,iMes,iDia);
         if (iMes = 1) Then begin
            if trim( pdblcCenarioText ) <> '' Then begin
              With dtmGeraDados.sqlAcumulado2CAnt Do Begin
               CdsAcumulado2CAnt.Close;
               if not prepared Then prepare;
               ParamByName('IDPESSOA').asInteger         := idEmpresa;
               ParamByName('EXERCICIO').asInteger        := StrToInt( pdblkExercicioLookupValue );
               ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt( pdblcCenarioLookupValue );
               ParamByName('IDPLANOORCAMEN').asInteger   := iPlanoOrc;
               ParamByName('IDCONTAORCAMEN').asString    := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
               CdsAcumulado2CAnt.Data := GetDataPacket( SqlChanged );;
              End;

               if not CdsAcumulado2CAnt.isEmpty Then begin
                  rValAcumAnt := CdsAcumulado2CAnt.FieldByName('ORC').asFloat;
               End Else Begin
                  rValAcumAnt := 0;
               End;
            End Else Begin
              With dtmGeraDados.sqlAcumulado2Ant Do Begin
                cdsAcumulado2Ant.Close;
                if not prepared Then prepare;
                ParamByName('IDPESSOA').asInteger        := idEmpresa;
                ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExercicioLookupValue );
                ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
                ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
                cdsAcumulado2Ant.Data := GetDataPacket( SqlChanged );;
              End;

               if cCalcOR = 'O' Then begin
                  if not CdsAcumulado2Ant.isEmpty Then begin
                     rValAcumAnt := CdsAcumulado2Ant.FieldByName('ORC').asFloat;
                  End Else Begin
                     rValAcumAnt := 0;
                  End;
               End Else Begin
                  if not CdsAcumulado2Ant.isEmpty Then begin
                     rValAcumAnt := CdsAcumulado2Ant.FieldByName('REAL').asFloat;
                  End Else Begin
                     rValAcumAnt := 0;
                  End;
               End;
            End;
         End Else Begin
            with sqlAcum2 do begin
               CdsAcum2.Close;
               if not Prepared Then Prepare;
               ParamByName('IDPESSOA').asInteger        := idEmpresa;
               ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
               if trim( pdblcCenarioText ) <> '' Then begin
                  ParamByName('PERIODO').asInteger          := iPeriodoAtu;
                  ParamByName('EXERCICIO').asInteger        := StrToInt( pdblkExercicioLookupValue);
                  ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt( pdblcCenarioLookupValue);
               End Else Begin
                  DecodeDate(dDataCorrente,iAno,iMes,iDia);
                  If sGeraMes = 'S' Then begin
                     dDataAnt := EncodeDate(iAno,iMes,1)-15;
                     DecodeDate(dDataAnt,iAno,iMes,iDia);
                     sMesAnt  := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  );
                                 //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2);
                     ParamByName('DATAREFERENCIA').asString   := sMesAnt;
                  End Else Begin
                     ParamByName('DATAREFERENCIA').asDateTime := dDataCorrente -1
                  End;
               End;
               CdsAcum2.Data := GetDataPacket( SqlChanged );;

               if cCalcOR = 'O' Then begin
                  if not CdsAcum2.isEmpty Then begin
                     rValAcumAnt := CdsAcum2.FieldByName('ORC').asFloat;
                  End Else Begin
                     rValAcumAnt := 0;
                  End;
               End Else Begin
                  if not CdsAcum2.isEmpty Then begin
                     rValAcumAnt := CdsAcum2.FieldByName('REAL').asFloat;
                  End Else Begin
                     rValAcumAnt := 0;
                  End;
               End;
            End;
         End;

         //Transforma as contas em valores e passa para o parser fazer a fórmula
         if cCalcOR = 'O' Then begin
            sFormula := CdsContas.FieldByName( 'FORMULAORCADO' ).AsString;
         End Else Begin
            sFormula := CdsContas.FieldByName( 'FORMULAREALIZADO' ).AsString;
         End;

         sCalculo := TransformaContas( sFormula, dDataCorrente, cCalcOR, 'N', false,
                                       pdblcCenarioText,
                                       pdblkExercicioLookupValue,
                                       pdblcCenarioLookupValue );
         if sCalculo <> '' Then begin
            try
              DtmGeraDados.Parser.Expression := sCalculo;
              //Pega o Valor retornado pelo parser
              rValor := rValAcumAnt + DtmGeraDados.Parser.value;
            except
              rValor := 0;
            End;
            //Grava os dados na tabela de Saldos Orcamentarios
            if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
               rValor := 0;
            End Else Begin
               if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                  rValor := rValor * -1;
            End;
            rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                               pdblcCenarioText,
                                               pdblkExercicioLookUpValue,
                                               pdblcCenarioLookUpValue );

            GravaSaldos( rValor,rValorAcum, dDataCorrente, cCalcOR,
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         pdblkExerciciotext      );

         End;
         next;
      End;
   End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaCondicional(dDataCorrente:TDateTime; cCalcOR:char;
                                            pdblcCenarioText,
                                            pdblkExercicioLookupValue,
                                            pdblcCenarioLookupValue : String;
                                            pcbBuscaSaldoAnteriorChecked : Boolean;
                                            psePosIni1Value,
                                            psePosFim1Value : Double;
                                            pedConteudo1Text,
                                            pdblkExerciciotext : String );

var rValor, rValorAcum, rValorIni, rValorRes, rValorFim : real;
    sCondicao, sTipoIni, sTipoRes : string;
    bCondicional, bTestaCondIni, bTestaCondFim, bTestaCondRes : boolean;
begin

   //Cálculo de contas de Condicional (tipo "C")
   edtTipo.Text := 'Condicional';

   SelecionaContas( cCalcOr, 'C',
                    psePosIni1Value,
                    psePosFim1Value,
                    pedConteudo1Text );

   with CdsContas do begin
      //Varre a query de Contas
      while ( not eof  ) And
            ( Not ( edtStatus.Tag = -1 ) ) do begin
         bCondicional  := false;
         bTestaCondIni := false;
         bTestaCondFim := false;
         bTestaCondRes := false;
         //
         rValorIni := 0;
         rValorRes := 0;
         rValorFim := 0;
         edtConta.Text := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
         SelecionaComposicao( CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString,
                              CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger, cCalcOR, 'C');
         bTestaCalculada := True;
         rValor    := 0;

         with DtmGeraDados.sqlComposicao,
              CdsComposicao do begin
            CdsCompContas.Close;
            DtmGeraDados.sqlCompContas.SQL.Clear;
            if trim( pdblcCenarioText ) <> '' Then begin
               DtmGeraDados.sqlCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
               DtmGeraDados.sqlCompContas.SQL.Add('       0 AS VLRREALIZADO FROM VALORESCENARIO ');
            End Else Begin
               DtmGeraDados.sqlCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
               DtmGeraDados.sqlCompContas.SQL.Add('       SUM(VLRREALIZADO) AS VLRREALIZADO FROM SALDOORCADO ');
            End;
            DtmGeraDados.sqlCompContas.SQL.Add('WHERE ');
            DtmGeraDados.sqlCompContas.SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
            DtmGeraDados.sqlCompContas.SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
            DtmGeraDados.sqlCompContas.SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
            if trim( pdblcCenarioText ) <> '' Then begin
               DtmGeraDados.sqlCompContas.SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN) AND ');
               DtmGeraDados.sqlCompContas.SQL.Add('(EXERCICIO  =:EXERCICIO) AND ');
               DtmGeraDados.sqlCompContas.SQL.Add('(PERIODO  =:PERIODO)  ');
            End Else Begin
               If sGeraMes = 'S' Then
                  DtmGeraDados.sqlCompContas.SQL.Add('(TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATAREFERENCIA)  ')
               else
                  DtmGeraDados.sqlCompContas.SQL.Add('(DATAREFERENCIA  =:DATAREFERENCIA) ');
            End;
            //Varre a query de Composicao
            First;
            while ( not eof ) And
                  ( Not ( edtStatus.Tag = -1 ) ) do begin

               sCondicao   := FieldByName('CONDICAO').asString;
               sTipoIni    := FieldByName('TIPOCONDINI').asString;
               sTipoRes    := FieldByName('TIPOCONDRES').asString;
               if TestaCalculada( CdsComposicao.FieldByName('IDCONTACONDINI').asString, cCalcOR) Then begin
                  bTestaCondIni := true;
                  CdsCompContas.Close;
                  if not DtmGeraDados.sqlCompContas.prepared Then DtmGeraDados.sqlCompContas.prepare;
                  DtmGeraDados.sqlCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).AsInteger;
                  DtmGeraDados.sqlCompContas.ParamByName('IDCONTAORCAMEN').asString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;
                  DtmGeraDados.sqlCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                  if trim( pdblcCenarioText ) <> '' Then begin
                     DtmGeraDados.sqlCompContas.ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                     DtmGeraDados.sqlCompContas.ParamByName('EXERCICIO').AsInteger        := StrToInt( pdblkExercicioLookupValue );
                     DtmGeraDados.sqlCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                  End Else Begin
                     DecodeDate(dDataCorrente,iAno,iMes,iDia);
                     If sGeraMes = 'S' Then
                        DtmGeraDados.sqlCompContas.ParamByName('DATAREFERENCIA').AsString := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  )
                                                                                             //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                     else
                        DtmGeraDados.sqlCompContas.ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                  End;
                  if not DtmGeraDados.sqlCompContas.Prepared Then DtmGeraDados.sqlCompContas.Prepare;
                  CdsCompContas.Data := GetDataPacket( DtmGeraDados.sqlCompContas.SqlChanged );
                  with DtmGeraDados.sqlVerificaSinal do begin
                     CdsVerificaSinal.close;
                     if not Prepared Then Prepare;
                     ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName( 'IDPLANOORCAMEN' ).asInteger;
                     ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;
                     CdsVerificaSinal.Data := GetDataPacket( SqlChanged );;
                  End;
                  if CdsVerificaSinal.FieldByname( 'FLGATIVA' ).AsString = 'I' Then begin
                     rValorIni := 0;
                  End Else Begin
                     if cCalcOR = 'R' Then
                        rValorIni := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                     else
                        rValorIni := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                     if CdsVerificaSinal.FieldByName('FLGSINALCONTA' ).AsString = 'N' Then
                        rValorIni := rValorIni*-1;
                  End;
               End;
               if sTipoIni = 'C' Then begin
                  if TestaCalculada( CdsComposicao.FieldByName('IDCONTACONDFIM').asString, cCalcOR) Then begin
                     bTestaCondFim := true;
                     CdsCompContas.Close;
                     if not DtmGeraDados.SqlCompContas.Prepared Then DtmGeraDados.SqlCompContas.Prepare;
                     DtmGeraDados.SqlCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).AsInteger;
                     DtmGeraDados.SqlCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM' ).AsString;
                     DtmGeraDados.SqlCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                     if trim( pdblcCenarioText ) <> '' Then begin
                        DtmGeraDados.SqlCompContas.ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                        DtmGeraDados.SqlCompContas.ParamByName('EXERCICIO').AsInteger        := StrToInt( pdblkExercicioLookupValue );
                        DtmGeraDados.SqlCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                     End Else Begin
                        DecodeDate(dDataCorrente,iAno,iMes,iDia);
                        If sGeraMes = 'S' Then
                          DtmGeraDados.SqlCompContas.ParamByName('DATAREFERENCIA').AsString := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  )
                                                                                //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                        Else
                          DtmGeraDados.SqlCompContas.ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                     End;
                     if not DtmGeraDados.SqlCompContas.Prepared Then DtmGeraDados.SqlCompContas.Prepare;
                     CdsCompContas.Data := GetDataPacket( DtmGeraDados.SqlCompContas.SqlChanged );

                     with DtmGeraDados.SqlVerificaSinal do begin
                        CdsVerificaSinal.Close;
                        if not Prepared Then Prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).asInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').asString;
                        CdsVerificaSinal.DAta := GetDataPacket( SqlChanged );
                     End;
                     if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                        rValorFim := 0;
                     End Else Begin
                        if cCalcOR = 'R' Then
                           rValorFim := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                        else
                           rValorFim := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                        if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                           rValorFim := rValorFim*-1;
                     End;
                  End;
               End Else Begin
                  rValorFim := CdsComposicao.FieldByName('VLRCONDINI').asFloat;
                  bTestaCondFim := true;
               End;

               if sTipoRes = 'C' Then begin
                  if TestaCalculada( CdsComposicao.FieldByName('IDCONTACONDRES').asString, cCalcOR) Then begin
                     bTestaCondRes := true;
                     CdsCompContas.Close;
                     if not DtmGeraDados.sqlCompContas.prepared Then DtmGeraDados.sqlCompContas.prepare;
                     DtmGeraDados.sqlCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
                     DtmGeraDados.sqlCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName( 'IDCONTACONDRES' ).asString;
                     DtmGeraDados.sqlCompContas.ParamByName('IDPESSOA').AsInteger                    := idEmpresa;
                     if trim( pdblcCenarioText ) <> '' Then begin
                        DtmGeraDados.sqlCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                        DtmGeraDados.sqlCompContas.ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                        DtmGeraDados.sqlCompContas.ParamByName('EXERCICIO').AsInteger        := StrToInt( pdblkExercicioLookupValue );
                     End Else Begin
                        DecodeDate(dDataCorrente,iAno,iMes,iDia);
                        If sGeraMes = 'S' Then
                           DtmGeraDados.sqlCompContas.ParamByName('DATAREFERENCIA').AsString := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  )
                                                                                                //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                        else
                           DtmGeraDados.sqlCompContas.ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                     End;
                     if not DtmGeraDados.sqlCompContas.Prepared Then DtmGeraDados.sqlCompContas.Prepare;
                     CdsCompContas.Data := GetDataPacket( DtmGeraDados.sqlCompContas.SqlChanged );

                     with DtmGeraDados.sqlVerificaSinal do begin
                        CdsVerificaSinal.close;
                        if not prepared Then prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).asInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').asString;
                        CdsVerificaSinal.Data := GetDataPacket( SqlChanged );
                     End;
                     if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                        rValorRes := 0;
                     End Else Begin
                        if cCalcOR = 'R' Then
                           rValorRes := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                        else
                           rValorRes := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                        if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                           rValorRes := rValorRes*-1;
                     End;
                  End;
               End Else Begin
                  rValorRes := CdsComposicao.FieldByName('VLRCONDRES').asFloat;
                  bTestaCondRes := true;
               End;

               if (bTestaCondIni) AND (bTestaCondFim) AND (bTestaCondRes) Then begin
                  if sCondicao = '<=' Then begin
                     if rValorIni <= rValorFim Then begin
                        rValor := rValorRes;
                        bCondicional := true;
                     End;
                  End;
                  if sCondicao = '<' Then begin
                     if rValorIni < rValorFim Then begin
                        rValor := rValorRes;
                        bCondicional := true;
                     End;
                  End;
                  if sCondicao = '=' Then begin
                     if rValorIni = rValorFim Then begin
                        rValor := rValorRes;
                        bCondicional := true;
                     End;
                  End;
                  if sCondicao = '>' Then begin
                     if rValorIni > rValorFim Then begin
                        rValor := rValorRes;
                        bCondicional := true;
                     End;
                  End;
                  if sCondicao = '>=' Then begin
                     if rValorIni >= rValorFim Then begin
                        rValor := rValorRes;
                        bCondicional := true;
                     End;
                  End;
                  if sCondicao = '<>' Then begin
                     if rValorIni <> rValorFim Then begin
                        rValor := rValorRes;
                        bCondicional := true;
                     End;
                  End;

                  if bCondicional Then Break;
               End;
               next;
            end
         End;

         if bCondicional Then Begin
            //Grava os dados na tabela de Saldos Orcamentarios
            if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
               rValor := 0;
            End Else Begin
               if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                  rValor := rValor * -1;
            End;
            rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                               pdblcCenarioText,
                                               pdblkExercicioLookUpValue,
                                               pdblcCenarioLookUpValue );
            GravaSaldos( rValor, rValorAcum, dDataCorrente, cCalcOR,
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         pdblkExerciciotext      );

         End;

         if pcbBuscaSaldoAnteriorChecked Then begin
            bCondicional  := false;
            bTestaCondIni := false;
            bTestaCondFim := false;
            bTestaCondRes := false;
            //
            rValorIni := 0;
            rValorRes := 0;
            rValorFim := 0;
            bTestaCalculada := True;
            rValor    := 0;

            with CdsComposicao do begin
               CdsCompContas.Close;
               DtmGeraDados.sqlCompContas.SQL.Clear;
               if trim( pdblcCenarioText ) <> '' Then begin
                  DtmGeraDados.sqlCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
                  DtmGeraDados.sqlCompContas.SQL.Add('       0 AS VLRREALIZADO FROM VALORESCENARIO ');
               End Else Begin
                  DtmGeraDados.sqlCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
                  DtmGeraDados.sqlCompContas.SQL.Add('       SUM(VLRREALIZADO) AS VLRREALIZADO FROM SALDOORCADOANT ');
               End;
               DtmGeraDados.sqlCompContas.SQL.Add('WHERE ');
               DtmGeraDados.sqlCompContas.SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
               DtmGeraDados.sqlCompContas.SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
               if trim( pdblcCenarioText) <> '' Then begin
                  DtmGeraDados.sqlCompContas.SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN) AND ');
                  DtmGeraDados.sqlCompContas.SQL.Add('(PERIODO IS NULL) AND ');
               End;
               DtmGeraDados.sqlCompContas.SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
               DtmGeraDados.sqlCompContas.SQL.Add('(EXERCICIO =:EXERCICIO)    ');
               //Varre a query de Composicao
               First;
               while ( not eof  ) And
                     ( Not ( edtStatus.Tag = -1 ) ) do begin
                  sCondicao := FieldByName('CONDICAO').asString;
                  sTipoIni  := FieldByName('TIPOCONDINI').asString;
                  sTipoRes  := FieldByName('TIPOCONDRES').asString;
                  if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDINI').asString, cCalcOR) Then begin
                     bTestaCondIni := true;
                     CdsCompContas.Close;
                     if not DtmGeraDados.sqlCompContas.Prepared Then DtmGeraDados.sqlCompContas.Prepare;
                     DtmGeraDados.sqlCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).AsInteger;
                     DtmGeraDados.sqlCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;
                     DtmGeraDados.sqlCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                     DtmGeraDados.sqlCompContas.ParamByName('EXERCICIO').AsInteger      := StrToInt( pdblkExercicioLookupValue );
                     if trim( pdblcCenarioText ) <> '' Then
                        DtmGeraDados.sqlCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                     CdsCompContas.Data := GetDataPacket( DtmGeraDados.sqlCompContas.SqlChanged );
                     
                     with DtmGeraDados.sqlVerificaSinal do begin
                        CdsVerificaSinal.close;
                        if not prepared Then prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).asInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;
                        CdsVerificaSinal.Data := GetDataPacket( SqlChanged );
                     End;
                     if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                        rValorIni := 0;
                     End Else Begin
                        if cCalcOR = 'R' Then
                           rValorIni := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                        else
                           rValorIni := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                        if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                           rValorIni := rValorIni*-1;
                     End;
                  End;
                  if sTipoIni = 'C' Then begin
                     if TestaCalculada( CdsComposicao.FieldByName('IDCONTACONDFIM').asString, cCalcOR) Then begin
                        bTestaCondFim := true;
                        CdsCompContas.Close;
                        if not DtmGeraDados.sqlCompContas.Prepared Then DtmGeraDados.sqlCompContas.Prepare;
                        DtmGeraDados.sqlCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).AsInteger;
                        DtmGeraDados.sqlCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').AsString;
                        DtmGeraDados.sqlCompContas.ParamByName('IDPESSOA').AsInteger   := idEmpresa;
                        DtmGeraDados.sqlCompContas.ParamByName('EXERCICIO').AsInteger  := StrToInt( pdblkExercicioLookupValue );
                        if trim( pdblcCenarioText ) <> '' Then
                           DtmGeraDados.sqlCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                        CdsCompContas.Data := GetDataPacket( DtmGeraDados.sqlCompContas.SqlChanged );
                        
                        with DtmGeraDados.sqlVerificaSinal do begin
                           CdsVerificaSinal.close;
                           if not prepared Then prepare;
                           ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).asInteger;
                           ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').asString;
                           CdsVerificaSinal.Data := GetDataPacket( SqlChanged );
                        End;
                        if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                           rValorFim := 0;
                        End Else Begin
                           if cCalcOR = 'R' Then
                              rValorFim := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                           else
                              rValorFim := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                           if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                              rValorFim := rValorFim*-1;
                        End;
                     End;
                  End Else Begin
                     rValorFim := CdsComposicao.FieldByName('VLRCONDINI').asFloat;
                     bTestaCondFim := true;
                  End;

                  if sTipoRes = 'C' Then begin
                     if TestaCalculada( CdsComposicao.FieldByName('IDCONTACONDRES').asString, cCalcOR) Then begin
                        bTestaCondRes := true;
                        CdsCompContas.Close;
                        if not DtmGEraDados.sqlCompContas.Prepared Then DtmGEraDados.sqlCompContas.Prepare;
                        DtmGEraDados.sqlCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).AsInteger;
                        DtmGEraDados.sqlCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').AsString;
                        DtmGEraDados.sqlCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                        DtmGEraDados.sqlCompContas.ParamByName('EXERCICIO').AsInteger      := StrToInt( pdblkExercicioLookupValue );
                        if trim( pdblcCenarioText ) <> '' Then
                           DtmGEraDados.sqlCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookupValue );
                        CdsCompContas.Data := GetDataPacket( DtmGEraDados.sqlCompContas.SqlChanged );
                        
                        with DtmGEraDados.sqlVerificaSinal do begin
                           CdsVerificaSinal.close;
                           if not prepared Then prepare;
                           ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN' ).asInteger;
                           ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').asString;
                           CdsVerificaSinal.Data := GetDataPacket( SqlChanged );
                        End;
                        if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                           rValorRes := 0;
                        End Else Begin
                           if cCalcOR = 'R' Then
                              rValorRes := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                           else
                              rValorRes := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                           if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                              rValorRes := rValorRes*-1;
                        End;
                     End;
                  End Else Begin
                     rValorRes := CdsComposicao.FieldByName('VLRCONDRES').asFloat;
                     bTestaCondRes := true;
                  End;

                  if (bTestaCondIni) AND (bTestaCondFim) AND (bTestaCondRes) Then begin
                     if sCondicao = '<=' Then begin
                        if rValorIni <= rValorFim Then begin
                           rValor := rValorRes;
                           bCondicional := true;
                        End;
                     End;
                     if sCondicao = '<' Then begin
                        if rValorIni < rValorFim Then begin
                           rValor := rValorRes;
                           bCondicional := true;
                        End;
                     End;
                     if sCondicao = '=' Then begin
                        if rValorIni = rValorFim Then begin
                           rValor := rValorRes;
                           bCondicional := true;
                        End;
                     End;
                     if sCondicao = '>' Then begin
                        if rValorIni > rValorFim Then begin
                           rValor := rValorRes;
                           bCondicional := true;
                        End;
                     End;
                     if sCondicao = '>=' Then begin
                        if rValorIni >= rValorFim Then begin
                           rValor := rValorRes;
                           bCondicional := true;
                        End;
                     End;
                     if sCondicao = '<>' Then begin
                        if rValorIni <> rValorFim Then begin
                           rValor := rValorRes;
                           bCondicional := true;
                        End;
                     End;

                     if bCondicional Then Break;
                  End;
                  next;
               end
            End;
            if bCondicional Then Begin
               if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                  rValor := 0;
               End Else Begin
                  if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                     rValor := rValor * -1;
               End;
               GravaSaldosAnt( rValor,cCalcOR,
                               pdblcCenarioText,
                               pdblkExercicioLookUpValue,
                               pdblcCenarioLookUpValue,
                               pdblkExerciciotext      );

            End;
         End;
         next;
      End;
   End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaFormula( dDataCorrente:TDateTime; cCalcOR:char;
                                         pcbBuscaSaldoAnteriorChecked : Boolean;
                                         pdblcCenarioText,
                                         pdblkExercicioLookUpValue,
                                         pdblcCenarioLookUpValue : String;
                                         psePosIni1Value,
                                         psePosFim1Value : Double;
                                         pedConteudo1Text,
                                         pdblkExerciciotext : String );

var rValor, rValorAcum : real;
    sCalculo, sFormula : string;
begin

   //Cálculo de contas de Fórmula (tipo "M")
   edtTipo.Text := 'Fórmula';
   SelecionaContas( cCalcOr, 'M',
                    psePosIni1Value,
                    psePosFim1Value,
                    pedConteudo1Text );

   with CdsContas do begin
      //Varre a query de Contas selecionada
      while ( not eof ) And
            ( Not ( edtStatus.Tag = -1 ) ) do begin
         edtConta.Text := FieldByName( 'IDCONTAORCAMEN' ).AsString;

         //Transforma as contas em valores e passa para o parser fazer a fórmula
         if cCalcOR = 'O' Then begin
            sFormula := FieldByName( 'FORMULAORCADO' ).AsString;
         End Else Begin
            sFormula := FieldByName( 'FORMULAREALIZADO' ).AsString;
         End;

         sCalculo := TransformaContas( sFormula, dDataCorrente, cCalcOR, 'N', false,
                                       pdblcCenarioText,
                                       pdblkExercicioLookupValue,
                                       pdblcCenarioLookupValue );

         if sCalculo <> '' Then begin
            try
              DtmGeraDados.Parser.Expression := sCalculo;
              //Pega o Valor retornado pelo parser
              rValor := DtmGeraDados.Parser.value;
            except
              rValor := 0;
            End;
            //Grava os dados na tabela de Saldos Orcamentarios
            if FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
               rValor := 0;
            End Else Begin
               if FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                  rValor := rValor * -1;
            End;
            rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                               pdblcCenarioText,
                                               pdblkExercicioLookUpValue,
                                               pdblcCenarioLookUpValue );
            GravaSaldos( rValor,rValorAcum, dDataCorrente, cCalcOR,
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         pdblkExerciciotext      );

         End;

         if pcbBuscaSaldoAnteriorChecked Then begin

            sCalculo := TransformaContas(sFormula, dDataCorrente, cCalcOR, 'N', true,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue );


            if sCalculo <> '' Then begin
               try
                 DtmGeraDados.Parser.Expression := sCalculo;
                 //Pega o Valor retornado pelo parser
                 rValor := DtmGeraDados.Parser.value;
               except
                 rValor := 0;
               End;
               //Grava os dados na tabela de Saldos Orcamentarios
               if FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
                  rValor := 0;
               End Else Begin
                  if FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
                     rValor := rValor * -1;
               End;
               GravaSaldosAnt( rValor,cCalcOR,
                               pdblcCenarioText,
                               pdblkExercicioLookUpValue,
                               pdblcCenarioLookUpValue,
                               pdblkExerciciotext      );

            End;
         End;
         next;
      End;
   End;

End;
//************************************************
procedure TCtrlGeraDados.CalculaGenericos( dDataCorrente:TDateTime; cCalcOR:char;
                                           pdblcCenarioText,
                                           pdblkExercicioLookUpValue,
                                           pdblcCenarioLookUpValue : String;
                                           psePosIni1Value,
                                           psePosFim1Value : Double;
                                           pedConteudo1Text,
                                           pdblkExerciciotext : String );

var rValor, rValorAcum : real;
begin

  //Cálculo de contas de Geração de Dados (tipo "G")
  edtTipo.Text := 'Arquivos Genéricos';
  SelecionaContas( cCalcOr, 'G',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text );

  with CdsContas do begin
    //Varre a query de Contas selecionada
    while ( Not Eof ) And
          ( Not ( edtStatus.Tag = -1 ) ) do begin
      edtConta.Text := FieldByName( 'IDCONTAORCAMEN' ).AsString;

      //Selecioana query do DataView
      CdsDataview.Close;
      if not DtmGeraDados.sqlDataView.Prepared Then DtmGeraDados.sqlDataView.Prepare;
      DtmGeraDados.sqlDataView.ParamByName('IDDATAVIEW').asInteger := FieldByName('IDDATAVIEW').asInteger;
      CdsDataview.Data := GetDataPacket( DtmGeraDados.sqlDataView.SqlChanged );

      rValor := 0;
      try
        if not CdsDataView.isEmpty Then begin
          DtmGeraDados.sqlGenericos.SQL.text := CdsDataView.FieldByName('TEMPLATE').asString;
          if DtmGeraDados.sqlGenericos.SQL.Text <> '' Then begin
            CdsGenericos.Close;
            if not DtmGeraDados.sqlGenericos.prepared Then DtmGeraDados.sqlGenericos.prepare;
            DtmGeraDados.sqlGenericos.ParamByName('DATA').asDateTime := dDataCorrente;
            CdsGenericos.Data := GetDataPacket( DtmGeraDados.sqlGenericos.SqlChanged );
          End;
        End;

        //Incrementa o acumulador de valores das contas Genéricas
        if DtmGeraDados.sqlGenericos.SQL.Text <> '' Then begin
          rValor := CdsGenericos.FieldByName('VALOR').asFloat;
        //End Else Begin
        //  rValor := 0;
        End;
      except
        MessageInfo := 'A Consulta de Arquivos Genéricos da Conta ' + edtConta.Text + ' está com tipos inconsistentes.';
        Exit;
      End;
      //Grava os dados na tabela de Saldos Orcamentarios
      if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
        rValor := 0;
      End Else Begin
        if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
          rValor := rValor * -1;
      End;
      rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                         pdblcCenarioText,
                                         pdblkExercicioLookUpValue,
                                         pdblcCenarioLookUpValue );
      GravaSaldos( rValor,rValorAcum, dDataCorrente, cCalcOR,
                   pdblcCenarioText,
                   pdblkExercicioLookUpValue,
                   pdblcCenarioLookUpValue,
                   pdblkExerciciotext      );
      next;
    End;
  End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaContabilidade( dDataCorrente:TDateTime; cCalcOR:char;
                                               pcbBuscaSaldoAnteriorChecked : Boolean;
                                               pdblkExercicioLookupValue,
                                               pdblcCenarioText,
                                               pdblcCenarioLookUpValue : String;
                                               psePosIni1Value,
                                               psePosFim1Value : Double;
                                               pedConteudo1Text,
                                               pdblkExerciciotext : String );
var rValor,rValorAcum, rValorAnt : real;
    iPlanoPara : LongInt;
    sContaPara : String;
begin

  //Cálculo de contas de Contabilidade (tipo "P")
  edtTipo.Text := 'Contabilidade';
  SelecionaContas( cCalcOr, 'P',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text );
  CdsPeriodoContab.Close;
  if not DtmGeraDados.sqlPeriodoContab.prepared Then DtmGeraDados.sqlPeriodoContab.prepare;
  DtmGeraDados.sqlPeriodoContab.ParamByName('DATAREF').AsString   := DateToStr(dDataCorrente);
  DtmGeraDados.sqlPeriodoContab.ParamByName('PESSOA').AsInteger   := idEmpresa;
  CdsPeriodoContab.Data := GetDataPacket( DtmGeraDados.sqlPeriodoContab.SqlChanged );
  
  with CdsContas do begin
    //Varre a query de Contas selecionada
    while ( not eof ) And
          ( Not ( edtStatus.Tag = -1 ) ) do begin
      edtConta.Text := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;

      rValor     := 0;
      rValorAnt  := 0;
      SelecionaComposicao(CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString, CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger, cCalcOR, 'P');

      with CdsComposicao do begin
        //Varre a query de Composicao
        while ( not eof ) And
              ( not ( edtStatus.Tag = -1 ) ) do begin
          //Faz a query de Somatório da Contabilidade para cada conta da composição
          with DtmGeraDados.sqlContabilidade do begin
            SQL.Clear;
            If sGeraMes = 'S' Then begin
              SQL.Add('SELECT  ');
              SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR FROM ');
              SQL.Add('PLANOSALDO ');
              SQL.Add('WHERE  ');
              if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin
                 SQL.Add('(CODCENTROCUSTO LIKE :CODCENTROCUSTO) AND ');
                 SQL.Add('(IDEMPRESA =:IDEMPRESA) AND ');
              End;
              SQL.Add('(PERNUMERO =:PERNUMERO) AND ');
              SQL.Add('(PEREXERCICIO =:PEREXERCICIO) AND ');
              SQL.Add('(IDPESSOA =:IDPESSOA) AND ');

              if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).isNull Then begin
                 SQL.Add('(UNIDNEGOC =:UNIDNEGOC) AND ');
              End;
              if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
                 SQL.Add('(IDPLANOPREV =:IDPLANOPREV) AND ');
              End;
              if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
                 SQL.Add('(IDPATRO =:IDPATRO) AND ');
              End;
              SQL.Add('(PLACONTA =:PLACONTA) AND ');
              SQL.Add('(PLANO    =:PLANO)  ');
            End Else Begin
//              SQL.Add('SELECT /*+ INDEX (LANCAMENTO) */ '); //Everson TIBERO
              SQL.Add('SELECT  '); //Everson TIBERO
              SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR*-1)) AS VALOR FROM ');
              SQL.Add('LANCAMENTO L, ');
              SQL.Add('PLANILHA P    ');
              SQL.Add('WHERE  ');
              SQL.Add('(L.PLACONTA LIKE :PLACONTA) AND ');
              SQL.Add('(L.PLANO    =:PLANO) AND ');
              if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin
                SQL.Add('(L.CODCENTROCUSTO LIKE :CODCENTROCUSTO) AND ');
                SQL.Add('(L.IDEMPRESA =:IDEMPRESA) AND ');
              End;
              SQL.Add('(P.PERNUMERO =:PERNUMERO) AND ');
              SQL.Add('(P.PEREXERCICIO =:PEREXERCICIO) AND ');
              SQL.Add('(P.IDPESSOA =:IDPESSOA) AND ');

              if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).isNull Then begin
                SQL.Add('(L.UNIDNEGOC =:UNIDNEGOC) AND ');
              End;
              if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
                SQL.Add('(L.IDPLANOPREV =:IDPLANOPREV) AND ');
              End;
              if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
                SQL.Add('(L.IDPATRO =:IDPATRO) AND ');
              End;
              SQL.Add('(P.PLNDATDIA =:DATA) AND ');
              //SQL.Add('L.PLNCODIGO NOT IN (SELECT PLNCODIGO FROM LANCAMENTOORC) AND ');
              SQL.Add('(L.PLNCODIGO = P.PLNCODIGO) ');
            End;

            If not Prepared Then Prepare;
            //
            iPlanoPara := CdsComposicao.FieldByName( 'PLANO' ).AsInteger;
            sContaPara := trim(CdsComposicao.FieldByName( 'PLACONTA' ).AsString);
            sContaPara := Trim(sContaPara);
            //
            if not prepared Then prepare;
            ParamByName('PERNUMERO').AsInteger    := CdsPeriodoContab.FieldByName( 'PERNUMERO' ).AsInteger;
            ParamByName('PEREXERCICIO').AsInteger := CdsPeriodoContab.FieldByName( 'PEREXERCICIO' ).AsInteger;
            ParamByName('PLANO').AsInteger        := iPlanoPara;
            if sGeraMes = 'S' Then
              ParamByName('PLACONTA').asString := Espaco(sContaPara,18)
            else
              ParamByName('PLACONTA').asString := trim(sContaPara)+'%';
            ParamByName('IDPESSOA').AsInteger   := IdEmpresa;

            if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).isNull Then begin
              ParamByName('UNIDNEGOC').AsInteger := CdsComposicao.FieldByName( 'UNIDNEGOC' ).AsInteger;
            End;

            if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
              ParamByName('IDPLANOPREV').AsInteger := CdsComposicao.FieldByName( 'IDPLANOPREV' ).AsInteger;
            End;
            if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
              ParamByName('IDPATRO').AsInteger := CdsComposicao.FieldByName( 'IDPATRO' ).AsInteger;
            End;
            if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin
              ParamByName('CODCENTROCUSTO').asString := trim( CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).asString)+'%';
              ParamByName('IDEMPRESA').AsInteger     := CdsComposicao.FieldByName( 'IDEMPRESA' ).AsInteger;
            End;
            DecodeDate(dDataCorrente,iAno,iMes,iDia);
            If sGeraMes <> 'S' Then
              ParamByName('DATA').AsDateTime  := dDataCorrente;

            CdsContabilidade.Data := GetDataPacket( SqlChanged );        // CdsComposicao.Data := Data;

            //Incrementa o acumulador de valores das contas da Composição
            if not CdsContabilidade.isempty Then begin
              rValor := rValor + CdsContabilidade.FieldByName('VALOR').asFloat;
            End;
          End;
          if pcbBuscaSaldoAnteriorChecked Then begin
            with DtmGeraDados.sqlContabilidade do begin
              SQL.Clear;
              SQL.Add('SELECT  ');
              SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR FROM ');
              SQL.Add('PLANOSALDO ');
              SQL.Add('WHERE  ');
              SQL.Add('(PLACONTA = :PLACONTA) AND ');
              SQL.Add('(PLANO    =:PLANO) AND ');
              if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin
                SQL.Add('(CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
                SQL.Add('(IDEMPRESA =:IDEMPRESA) AND ');
              End;
              SQL.Add('(PERNUMERO IS NULL) AND ');
              SQL.Add('(PEREXERCICIO =:PEREXERCICIO) AND ');

              if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).isNull Then begin
                SQL.Add('(UNIDNEGOC =:UNIDNEGOC) AND ');
              End;
              if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
                SQL.Add('(IDPLANOPREV =:IDPLANOPREV) AND ');
              End;
              if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
                SQL.Add('(IDPATRO =:IDPATRO) AND ');
              End;
              SQL.Add('(IDPESSOA =:IDPESSOA) ');

              If not Prepared Then Prepare;
              //
              iPlanoPara := CdsComposicao.FieldByName( 'PLANO' ).AsInteger;
              sContaPara := trim(CdsComposicao.FieldByName( 'PLACONTA' ).AsString);
              sContaPara := Trim(sContaPara);
              //
              if not prepared Then prepare;
              ParamByName('PEREXERCICIO').AsInteger := StrToInt( pdblkExercicioLookupValue );
              ParamByName('PLANO').AsInteger        := iPlanoPara;
              ParamByName('PLACONTA').asString      := Espaco(sContaPara,18);
              ParamByName('IDPESSOA').AsInteger     := IdEmpresa;

              if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).isNull Then begin
                ParamByName('UNIDNEGOC').AsInteger := CdsComposicao.FieldByName( 'UNIDNEGOC' ).AsInteger;
              End;

              if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
                ParamByName('IDPLANOPREV').AsInteger := CdsComposicao.FieldByName( 'IDPLANOPREV' ).AsInteger;
              End;
              if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
                ParamByName('IDPATRO').AsInteger := CdsComposicao.FieldByName( 'IDPATRO' ).AsInteger;
              End;
              if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).isNull Then begin
                ParamByName('CODCENTROCUSTO').asString := Espaco( Trim( CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).asString),10);
                ParamByName('IDEMPRESA').AsInteger     := CdsComposicao.FieldByName( 'IDEMPRESA' ).AsInteger;
              End;
              CdsContabilidade.Data := GetDataPacket( SqlChanged );

              //Incrementa o acumulador de valores das contas da Composição
              if not isempty Then begin
                rValorAnt := rValorAnt + CdsContabilidade.FieldByName('VALOR').asFloat;
              End;
            End;
          End;
          next;
        End;
      End;
      //Grava os dados na tabela de Saldos Orcamentarios
      if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
        rValor := 0;
      End Else Begin
        if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
          rValor := rValor * -1;
      End;
      rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                         pdblcCenarioText,
                                         pdblkExercicioLookUpValue,
                                         pdblcCenarioLookUpValue );
      GravaSaldos( rValor,rValorAcum, dDataCorrente, cCalcOR,
                   pdblcCenarioText,
                   pdblkExercicioLookUpValue,
                   pdblcCenarioLookUpValue,
                   pdblkExerciciotext      );

      if pcbBuscaSaldoAnteriorChecked Then begin
        if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
          rValorAnt := 0;
        End Else Begin
          if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
            rValorAnt := rValorAnt * -1;
        End;
        GravaSaldosAnt( rValorAnt,cCalcOR,
                        pdblcCenarioText,
                        pdblkExercicioLookUpValue,
                        pdblcCenarioLookUpValue,
                        pdblkExerciciotext      );

      End;
      next;
    End;
  End;
End;
//************************************************
procedure TCtrlGeraDados.CalculaFluxo( dDataCorrente:TDateTime; cCalcOR:char;
                                       pdblcCenarioText,
                                       pdblkExercicioLookUpValue,
                                       pdblcCenarioLookUpValue : String;
                                       psePosIni1Value,
                                       psePosFim1Value : Double;
                                       pedConteudo1Text,
                                       pdblkExerciciotext : String );

var rValor,rValorAcum : real;
begin

  //Cálculo de contas de Fluxo (tipo "X")
  edtTipo.Text := 'Fluxo de Caixa';
  SelecionaContas( cCalcOr, 'X',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text );

  with CdsContas do begin
    //Varre a query de Contas selecionada
    while ( not eof  ) And
          ( Not ( edtStatus.Tag = -1 ) ) do begin
      edtConta.Text := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
      rValor := 0;

      SelecionaComposicao( CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString, CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger, cCalcOR,'X');

      with CdsComposicao do begin
        //Varre a query de Composicao
        while ( not eof ) And
             ( Not ( edtStatus.Tag = -1 ) ) do begin

          //Faz a query de Somatório do Fluxo de caixa para cada conta da composição
          with DtmGeraDados.sqlFluxo do begin
            SQL.Clear;
            SQL.Add('SELECT SUM(DECODE(RECPAG,''R'',VALOR,VALOR*-1)) AS VALOR FROM ');
            SQL.Add( PrefixoServidor + 'FLUXOREAL ');
            SQL.Add('WHERE  ');
            SQL.Add('(CODTIPRECDES  LIKE :CODTIPRECDES) AND ');
            SQL.Add('(IDPESSOA        =:IDPESSOA) AND ');
            SQL.Add('(RECPAG          =:RECPAG) AND ');
            if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).IsNull Then begin
               SQL.Add('(UNIDNEGOC       =:UNIDNEGOC) AND ');
            End;
            if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
               SQL.Add('(IDPLANOPREV =:IDPLANOPREV) AND ');
            End;
            if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
               SQL.Add('(IDPATRO =:IDPATRO) AND ');
            End;
            if not CdsComposicao.FieldByName( 'CODCENTRORESPON' ).IsNull Then begin
               SQL.Add('(CODCENTRORESPON LIKE :CODCENTRORESPON) AND ');
            End;
            if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).IsNull Then begin
               SQL.Add('(CODCENTROCUSTO LIKE :CODCENTROCUSTO ) AND ');
            End;
            if sGeraMes = 'S' Then
               SQL.Add('(TO_CHAR(DATACFLOAT,''YYYYMM'') =:DATA) ')
            else
               SQL.Add('(DATACFLOAT      =:DATA) ');

            if not Prepared Then Prepare;
            ParamByName('CODTIPRECDES').AsString   := trim( CdsComposicao.FieldByName( 'CODTIPRECDES' ).asString)+'%';
            ParamByName('IDPESSOA').AsInteger      := IdEmpresa;
            ParamByName('RECPAG').AsString         := CdsComposicao.FieldByName( 'RECPAG' ).AsString;

            if not CdsComposicao.FieldByName( 'UNIDNEGOC' ).IsNull Then begin
               ParamByName('UNIDNEGOC').AsInteger     := CdsComposicao.FieldByName( 'UNIDNEGOC' ).AsInteger;
            End;
            if not CdsComposicao.FieldByName( 'IDPLANOPREV' ).isNull Then begin
               ParamByName('IDPLANOPREV').AsInteger := CdsComposicao.FieldByName( 'IDPLANOPREV' ).AsInteger;
            End;
            if not CdsComposicao.FieldByName( 'IDPATRO' ).isNull Then begin
               ParamByName('IDPATRO').AsInteger := CdsComposicao.FieldByName( 'IDPATRO' ).AsInteger;
            End;
            if not CdsComposicao.FieldByName( 'CODCENTRORESPON' ).IsNull Then begin
               ParamByName('CODCENTRORESPON').asString  := Trim( CdsComposicao.FieldByName( 'CODCENTRORESPON' ).asString)+'%';
            End;
            if not CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).IsNull Then begin
               ParamByName('CODCENTROCUSTO').asString  := Trim( CdsComposicao.FieldByName( 'CODCENTROCUSTO' ).asString)+'%';
            End;
            DecodeDate(dDataCorrente,iAno,iMes,iDia);
            if sGeraMes = 'S' Then
               ParamByName('DATA').AsString   := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  )
                                                 //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
            else
               ParamByName('DATA').AsDateTime := dDataCorrente;
            CdsFluxo.Data := GetDataPacket( SqlChanged );

            //Incrementa o acumulador de valores das contas da Composição
            if not CdsFluxo.isempty Then
              rValor := rValor + CdsFluxo.FieldByName('VALOR').asFloat;
          End;
          next;
        End;
      End;
      //Grava os dados na tabela de Saldos Orcamentarios
      if CdsContas.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
         rValor := 0;
      End Else Begin
         if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'N' Then
            rValor := rValor * -1;
      End;
      rValorAcum := CalculaVlrAcumulado( dDataCorrente,cCalcOR,rValor,
                                         pdblcCenarioText,
                                         pdblkExercicioLookUpValue,
                                         pdblcCenarioLookUpValue );
      GravaSaldos( rValor, rValorAcum, dDataCorrente, cCalcOR,
                   pdblcCenarioText,
                   pdblkExercicioLookUpValue,
                   pdblcCenarioLookUpValue,
                   pdblkExerciciotext      );
      next;
    End;
  End;
End;
//************************************************
function TCtrlGeraDados.CalculaVlrAcumulado( dDataCorrente:TDateTime; cCalcOR:char; rValorDia:Real;
                                             pdblcCenarioText,
                                             pdblkExercicioLookUpValue,
                                             pdblcCenarioLookUpValue    : String ) : Real;
var cTipo : Char;
    sTipo : String;
    sCalculo, sFormula, sMesAnt : string;
    sqlAcum3 : TCMsqlParams;
    dDataAnt : TDateTime;
begin
   if CdsContas.FieldByName('FLGACUMULADO').isNull Then begin
      Result := 0;
   End Else Begin
      sTipo:= CdsContas.FieldByName('FLGACUMULADO').AsString;
      cTipo:=sTipo[1];
      Result := 0;
      case cTipo of
         'N': begin
                 if trim( pdblcCenarioText ) <> '' Then begin
                    sqlAcum3 := DtmGeraDados.sqlAcumulado3MC;
                 End Else Begin
                    If sGeraMes = 'S' Then
                       sqlAcum3 := DtmGeraDados.sqlAcumulado3M
                    else
                       sqlAcum3 := DtmGeraDados.sqlAcumulado3;
                 End;
                 with sqlAcum3 do begin
                    CdsAcum3.Close;
                    if not Prepared Then Prepare;
                    ParamByName('IDPESSOA').asInteger        := idEmpresa;
                    ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
                    ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
                    if trim( pdblcCenarioText ) <> '' Then begin
                       ParamByName('EXERCICIO').asInteger        := StrToInt( pdblkExercicioLookUpValue );
                       ParamByName('PERIODO').asInteger          := iPeriodoAtu;
                       ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt( pdblcCenarioLookUpValue );
                    End Else Begin
                       If sGeraMes = 'S' Then begin
                          DecodeDate(dDataCorrente,iAno,iMes,iDia);
                          dDataAnt := EncodeDate(iAno,iMes,1)-15;
                          DecodeDate(dDataAnt,iAno,iMes,iDia);
                          sMesAnt  := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  );
                                      //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2);
                          ParamByName('DATAREFERENCIA').asString   := sMesAnt;
                       End Else Begin
                          ParamByName('DATAREFERENCIA').asDateTime := dDataCorrente -1
                       End;
                    End;
                    CdsAcum3.Data := GetDataPacket( SqlChanged );

                    if cCalcOR = 'O' Then begin
                       if not CdsAcum3.isEmpty Then begin
                          Result := CdsAcum3.FieldByName('ORC').asFloat + rValorDia;
                       End Else Begin
                          Result := rValorDia;
                       End;
                    End Else Begin
                       if not CdsAcum3.isEmpty Then begin
                          Result := CdsAcum3.FieldByName('REAL').asFloat + rValorDia;
                       End Else Begin
                          Result := rValorDia;
                       End;
                    End;
                 End;
              End;
         'S': begin
                 //Transforma as contas em valores e passa para o parser fazer a fórmula
                 if cCalcOR = 'O' Then begin
                    sFormula := CdsContas.FieldByName( 'FORMULAORCADO' ).AsString;
                 End Else Begin
                    sFormula := CdsContas.FieldByName( 'FORMULAREALIZADO').AsString;
                 End;

                 sCalculo := TransformaContas( sFormula, dDataCorrente, cCalcOR, 'A', false,
                                               pdblcCenarioText,
                                               pdblkExercicioLookupValue,
                                               pdblcCenarioLookupValue );


                 if sCalculo <> '' Then begin
                    try
                       DtmGeraDados.Parser.Expression := sCalculo;
                       //Pega o Valor retornado pelo parser
                       Result := DtmGeraDados.Parser.value;
                    except
                      On E : Exception Do
                           Result := 0;
                    End;
                 End;
              End;
         'U': begin
                 Result:=rValorDia;
              End;
         'O': begin
                 //Transforma as contas em valores e passa para o parser fazer a fórmula
                 sFormula := CdsContas.FieldByName( 'FORMULAORCADO' ).AsString;

                 sCalculo := TransformaContas( sFormula, dDataCorrente, cCalcOR, 'A', False,
                                               pdblcCenarioText,
                                               pdblkExercicioLookupValue,
                                               pdblcCenarioLookupValue );


                 if sCalculo <> '' Then begin
                    try
                       DtmGeraDados.Parser.Expression := sCalculo;
                       //Pega o Valor retornado pelo parser
                       Result := DtmGeraDados.Parser.value;
                    except
                      On E : Exception Do
                       Result := 0;
                    End;
                 End;
              End;
         'R': begin
                 //Transforma as contas em valores e passa para o parser fazer a fórmula
                 sFormula := CdsContas.FieldByName( 'FORMULAREALIZADO' ).AsString;

                 sCalculo := TransformaContas(sFormula, dDataCorrente, cCalcOR, 'A', False,
                                       pdblcCenarioText,
                                       pdblkExercicioLookupValue,
                                       pdblcCenarioLookupValue );

                 if sCalculo <> '' Then begin
                    try
                       DtmGeraDados.Parser.Expression := sCalculo;
                       //Pega o Valor retornado pelo parser
                       Result := DtmGeraDados.Parser.value;
                    except
                      On E : Exception Do
                        Result := 0;
                    End;
                 End;
              End;
         else Result := 0;
      End;
   End;
End;
//************************************************
procedure TCtrlGeraDados.SelecionaContas( cCalcOR:char; cTipoCalculo:char;
                                          psePosIni1Value,
                                          psePosFim1Value  : Double;
                                          pedConteudo1Text : String );
begin
  edtStatus.Text := 'Aguarde, processando os Dados das Contas Orçamentárias...';

  //Seleciona as Contas Orcamentárias do Tipo desejado, com o Calculo (O/R) desejado
  with DtmGeraDados.SqlContas do begin
    CdsContas.close;
    SQL.Clear;
    SQL.Add('SELECT                                            ');
    SQL.Add('   IDPLANOORCAMEN, IDCONTAORCAMEN, FLGSINALCONTA, ');
    SQL.Add('   FLGINFDIAMES, FORMULAORCADO, FORMULAREALIZADO, ');
    SQL.Add('   IDDATAVIEW, ORIGEMCMDV, FLGACUMULADO, FLGATIVA ');
    SQL.Add('FROM CONTASORCAMEN                                ');

    if cCalcOR = 'O' Then begin
       SQL.Add('WHERE (TIPOCALCORCADO =:TIPO) AND (FLGCALCORCADO = ''N'')');
    End Else Begin
       SQL.Add('WHERE (TIPOCALCREALIZADO =:TIPO) AND (FLGCALCREAL = ''N'')');
    End;
    SQL.Add('   AND ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL))  ');
    if trim( pedConteudo1Text ) <> '' Then begin
       SQL.Add(' AND (SUBSTR(IDCONTAORCAMEN,'+FloatToStr( psePosIni1Value )+','+FloatToStr( psePosFim1Value )+') = ('''+trim( pedConteudo1Text )+''')) ');
    End;
    SQL.Add(' AND (IDPLANOORCAMEN = ' + IntToStr( iPlanoOrc )+')');
    SQL.Add(' ORDER BY IDPLANOORCAMEN, IDCONTAORCAMEN ');

    If not Prepared Then Prepare;
    ParamByName('TIPO').asString  := cTipoCalculo;
    CdsContas.Data := GetDataPacket( SqlChanged );
    CdsContas.First;
  End;
End;
//************************************************
procedure TCtrlGeraDados.GravaSaldos( rValor,rValorAcum:real; dDataCorrente:TDateTime; cCalcOR:char;
                                      pdblcCenarioText,
                                      pdblkExercicioLookUpValue,
                                      pdblcCenarioLookUpValue,
                                      pdblkExerciciotext       : String );
var iIdCenario : LongInt;
begin

   //Só grava o saldo se o botão de cancelado não foi apertado
   if not ( edtStatus.Tag = -1 ) Then begin
      with DtmGeraDados.sqlSaldos do begin
         CdsSaldos.close;
         SQL.Clear;
         if trim( pdblcCenarioText ) <> '' Then begin
            //Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDVALORESCENARIO FROM ');
            SQL.Add( PrefixoServidor + 'VALORESCENARIO ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(PERIODO =:PERIODO) AND ');
            SQL.Add('(IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');
            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
            ParamByName('IDPESSOA').AsInteger       := idEmpresa;
            ParamByName('PERIODO').AsInteger        := iPeriodoAtu;
            ParamByName('EXERCICIO').AsInteger      := StrToInt( pdblkExercicioLookUpValue );
            ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookUpValue );
            CdsSaldos.Data := GetDataPacket( SqlChanged );
            //Se não existir insere o novo registro
            if CdsSaldos.isEmpty Then begin
               SQL.Clear;
               SQL.Add('INSERT INTO VALORESCENARIO ');
               SQL.Add('(IDVALORESCENARIO,IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ');
               SQL.Add(' PERIODO, IDPESSOA, IDCENARIOORCAMEN, VLRORCCENARIO) ');
               SQL.Add('VALUES ');
               SQL.Add('(:IDVALORESCENARIO,:IDCONTAORCAMEN, :IDPLANOORCAMEN, :EXERCICIO, ');
               SQL.Add(' :PERIODO, :IDPESSOA, :IDCENARIOORCAMEN, :VLRORCCENARIO) ');
               Prepare;
               ParamByName('IDVALORESCENARIO').asInteger:= GetSequence( 'VALORESCENARIO');
               ParamByName('IDPLANOORCAMEN').asInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
               ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExercicioLookUpValue );
               ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt( pdblcCenarioLookUpValue );
               ParamByName('PERIODO').asInteger         := iPeriodoAtu;
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;
               ParamByName('VLRORCCENARIO').AsFloat     := rValor;
               AtualizaTabela(  SqlChanged );

            //Caso exista, dá update
            End Else Begin
               iIdCenario := CdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger;
               SQL.Clear;
               SQL.Add('UPDATE VALORESCENARIO SET ');
               SQL.Add('VLRORCCENARIO  = VLRORCCENARIO + :VALOR  ');
               SQL.Add('WHERE (IDVALORESCENARIO =:IDVALORESCENARIO) ');
               Prepare;
               ParamByName('IDVALORESCENARIO').AsInteger := iIdCenario;
               ParamByName('VALOR').AsFloat              := rValor;
               AtualizaTabela(  SqlChanged );
            End;
         End Else Begin
            //Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDCONTAORCAMEN, DATAREFERENCIA FROM ');
            SQL.Add( PrefixoServidor + 'SALDOORCADO ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(DATAREFERENCIA =:DATAREFERENCIA) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');
            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
            ParamByName('IDPESSOA').AsInteger       := idEmpresa;
            ParamByName('DATAREFERENCIA').AsDateTime:= dDataCorrente;
            CdsSaldos.Close;
            CdsSaldos.Data := GetDataPacket( SqlChanged );

            //Se não existir insere o novo registro
            if CdsSaldos.isEmpty Then begin
               SQL.Clear;
               SQL.Add('INSERT INTO SALDOORCADO ');
               SQL.Add('(IDCONTAORCAMEN, IDPLANOORCAMEN, DATAREFERENCIA, EXERCICIO, ');
               SQL.Add(' PERIODO, IDPESSOA, VLRREALIZADO, VLRORCADO, VLRREALACUM, VLRORCACUM) ');
               SQL.Add('VALUES ');
               SQL.Add('(:IDCONTAORCAMEN, :IDPLANOORCAMEN, :DATAREFERENCIA, :EXERCICIO, ');
               SQL.Add(' :PERIODO, :IDPESSOA, :VLRREALIZADO, :VLRORCADO, :VLRREALACUM, :VLRORCACUM) ');
               Prepare;
               ParamByName('IDPLANOORCAMEN').asInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').asInteger;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
               ParamByName('DATAREFERENCIA').asDateTime := dDataCorrente;
               ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExerciciotext );
               ParamByName('PERIODO').asInteger         := iPeriodoAtu;
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;

               if cCalcOR = 'O' Then begin

                  //Muda o sinal do valor dependendo da flag de sinal da conta
                  ParamByName('VLRORCADO').AsFloat  := rValor;
                  if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then begin
                     ParamByName('VLRORCACUM').AsFloat := rValorAcum;
                  End Else Begin
                     ParamByName('VLRORCACUM').AsFloat := - rValorAcum;
                  End;

                  ParamByName('VLRREALIZADO').AsFloat := 0;
                  ParamByName('VLRREALACUM').AsFloat  := 0;

               End Else Begin

                  ParamByName('VLRORCADO').AsFloat    := 0;
                  ParamByName('VLRORCACUM').AsFloat   := 0;

                  //Muda o sinal do valor dependendo da flag de sinal da conta
                  ParamByName('VLRREALIZADO').AsFloat := rValor;
                  if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then begin
                     ParamByName('VLRREALACUM').AsFloat  := rValorAcum;
                  End Else Begin
                     ParamByName('VLRREALACUM').AsFloat  := - rValorAcum;
                  End;
               End;
               AtualizaTabela(  SqlChanged );

            //Caso exista, dá update
            End Else Begin
               SQL.Clear;
               SQL.Add('UPDATE SALDOORCADO SET ');

               if cCalcOR = 'O' Then begin
                  SQL.Add('VLRORCADO  =:VALOR, ');
                  SQL.Add('VLRORCACUM =:VALORACUM ');
               End Else Begin
                  SQL.Add('VLRREALIZADO =:VALOR, ');
                  SQL.Add('VLRREALACUM  =:VALORACUM ');
               End;

               SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
               SQL.Add('      (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
               SQL.Add('      (DATAREFERENCIA =:DATAREFERENCIA) AND ');
               SQL.Add('      (IDPESSOA       =:IDPESSOA)');

               Prepare;
               ParamByName('IDPLANOORCAMEN').AsInteger  := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
               ParamByName('IDCONTAORCAMEN').AsString   := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
               ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
               ParamByName('IDPESSOA').AsInteger        := idEmpresa;

               //Muda o sinal do valor dependendo da flag de sinal da conta
               ParamByName('VALOR').AsFloat   := rValor;
               if CdsContas.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then begin
                  ParamByName('VALORACUM').AsFloat := rValorAcum;
               End Else Begin
                  ParamByName('VALORACUM').AsFloat := - rValorAcum;
               End;

               AtualizaTabela(  SqlChanged );
            End;
         End;
      End;

      //Seta as Flags de Cálculo da conta selecionada para "S" - Calculada
      with DtmGeraDados.sqlFlagCalculo do begin

         SQL.Clear;
         SQL.Add('UPDATE CONTASORCAMEN SET ');

         if cCalcOR = 'O' Then begin
            SQL.Add('FLGCALCORCADO = ''S'' ');
         End Else Begin
            SQL.Add('FLGCALCREAL = ''S'' ');
         End;

         SQL.Add('WHERE IDPLANOORCAMEN =:IDPLANOORCAMEN AND ');
         SQL.Add('IDCONTAORCAMEN =:IDCONTAORCAMEN ');

         Prepare;
         ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
         ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
         AtualizaTabela(  SqlChanged );
      End;
   End;
End;
//************************************************
procedure TCtrlGeraDados.GravaSaldosAnt(rValor:real; cCalcOR:char;
                                        pdblcCenarioText,
                                        pdblkExercicioLookUpValue,
                                        pdblcCenarioLookUpValue,
                                        pdblkExerciciotext      : String);
var iIdCenario : LongInt;
begin
   //Só grava o saldo se o botão de cancelado não foi apertado
   if not ( edtStatus.Tag = -1 ) Then begin
      with DtmGeraDados.sqlSaldos do begin
         CdsSaldos.Close;
         SQL.Clear;
         if trim( pdblcCenarioText ) <> '' Then begin
            //Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDVALORESCENARIO FROM ');
            SQL.Add( PrefixoServidor + 'VALORESCENARIO ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(PERIODO IS NULL) AND ');
            SQL.Add('(IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');
            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger   := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString    := CdsContas.FieldByName( 'IDCONTAORCAMEN' ).AsString;
            ParamByName('IDPESSOA').AsInteger         := idEmpresa;
            ParamByName('EXERCICIO').AsInteger        := StrToInt( pdblkExercicioLookUpValue );
            ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt( pdblcCenarioLookUpValue );
            CdsSaldos.Data := GetDataPacket( SqlChanged );
            //Se não existir insere o novo registro
            if CdsSaldos.isEmpty Then begin
               SQL.Clear;
               SQL.Add('INSERT INTO VALORESCENARIO ');
               SQL.Add('(IDVALORESCENARIO,IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ');
               SQL.Add(' PERIODO, IDPESSOA, IDCENARIOORCAMEN, VLRORCCENARIO) ');
               SQL.Add('VALUES ');
               SQL.Add('(:IDVALORESCENARIO,:IDCONTAORCAMEN, :IDPLANOORCAMEN, :EXERCICIO, ');
               SQL.Add(' NULL, :IDPESSOA, :IDCENARIOORCAMEN, :VLRORCCENARIO) ');
               Prepare;
               ParamByName('IDVALORESCENARIO').asInteger:= GetSequence( 'VALORESCENARIO');
               ParamByName('IDPLANOORCAMEN').asInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').asInteger;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
               ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExercicioLookUpValue);
               ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt( pdblcCenarioLookUpValue);
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;
               ParamByName('VLRORCCENARIO').AsFloat     := rValor;
               AtualizaTabela(  SqlChanged );

            //Caso exista, dá update
            End Else Begin
               iIdCenario := CdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger;
               SQL.Clear;
               SQL.Add('UPDATE VALORESCENARIO SET ');
               SQL.Add('VLRORCCENARIO  = VLRORCCENARIO + :VALOR  ');
               SQL.Add('WHERE (IDVALORESCENARIO =:IDVALORESCENARIO) ');
               Prepare;
               ParamByName('IDVALORESCENARIO').AsInteger := iIdCenario;
               ParamByName('VALOR').AsFloat              := rValor;
               AtualizaTabela(  SqlChanged );
            End;
         End Else Begin
            //Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDCONTAORCAMEN FROM ');
            SQL.Add('SALDOORCADOANT ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');
            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN' ).AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN' ).AsString;
            ParamByName('IDPESSOA').AsInteger       := idEmpresa;
            ParamByName('EXERCICIO').AsInteger      := StrToInt( pdblkExercicioLookupValue );
            CdsSaldos.Data := GetDataPacket( SqlChanged );

            //Se não existir insere o novo registro
            if CdsSaldos.isEmpty Then begin
               SQL.Clear;
               SQL.Add('INSERT INTO SALDOORCADOANT ');
               SQL.Add('(IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ');
               SQL.Add(' IDPESSOA, VLRREALIZADO, VLRORCADO) ');
               SQL.Add('VALUES ');
               SQL.Add('(:IDCONTAORCAMEN, :IDPLANOORCAMEN, :EXERCICIO, ');
               SQL.Add(' :IDPESSOA, :VLRREALIZADO, :VLRORCADO) ');
               Prepare;
               ParamByName('IDPLANOORCAMEN').asInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').asInteger;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
               ParamByName('EXERCICIO').asInteger       := StrToInt( pdblkExerciciotext );
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;

               if cCalcOR = 'O' Then begin
                  ParamByName('VLRORCADO').AsFloat:= rValor;
                  ParamByName('VLRREALIZADO').AsFloat := 0;
               End Else Begin
                  ParamByName('VLRORCADO').AsFloat    := 0;
                  ParamByName('VLRREALIZADO').AsFloat := rValor;
               End;
               AtualizaTabela(  SqlChanged );

            //Caso exista, dá update
            End Else Begin
               SQL.Clear;
               SQL.Add('UPDATE SALDOORCADOANT SET ');

               if cCalcOR = 'O' Then begin
                  SQL.Add('VLRORCADO  =:VALOR ');
               End Else Begin
                  SQL.Add('VLRREALIZADO =:VALOR ');
               End;

               SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
               SQL.Add('      (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
               SQL.Add('      (EXERCICIO      =:EXERCICIO) AND ');
               SQL.Add('      (IDPESSOA       =:IDPESSOA)');

               Prepare;
               ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN' ).AsInteger;
               ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN' ).AsString;
               ParamByName('EXERCICIO').asInteger      := StrToInt( pdblkExerciciotext );
               ParamByName('IDPESSOA').AsInteger       := idEmpresa;
               ParamByName('VALOR').AsFloat            := rValor;
               AtualizaTabela(  SqlChanged );
            End;
         End;
      End;
   End;
End;
//************************************************
procedure TCtrlGeraDados.SelecionaComposicao(sConta:string; iPlano:real; cCalcOR, cTipoCalc:char);
begin
  //Seleciona as Composições das Contas Orcamentárias
  with DtmGeraDados.sqlComposicao do begin
    CdsComposicao.close;
    DtmGeraDados.sqlComposicao.SQL.Delete(17);
    if cTipoCalc = 'P' Then begin
      DtmGeraDados.sqlComposicao.SQL.Insert(17,'   (C.PLACONTA IS NOT NULL) AND (C.PLANO = '+ FloatToStr(iPlanoContabil)+')');
    End Else Begin
      if cTipoCalc = 'X' Then begin
         DtmGeraDados.sqlComposicao.SQL.Insert(17,'   (C.CODTIPRECDES IS NOT NULL)');
      End Else Begin
        if (cTipoCalc = 'F') and (cCalcOR = 'O') Then begin
          DtmGeraDados.sqlComposicao.SQL.Insert(17,'   (C.IDCONTAREFORCADO IS NOT NULL)');
        End Else Begin
          if (cTipoCalc = 'F') and (cCalcOR = 'R') Then begin
            DtmGeraDados.sqlComposicao.SQL.Insert(17,'   (C.IDCONTAREFREAL IS NOT NULL)');
          End Else Begin
            if (cTipoCalc = 'C') Then begin
              DtmGeraDados.sqlComposicao.SQL.Insert(17,'   (C.IDCONTACONDINI IS NOT NULL)');
            End Else Begin
              DtmGeraDados.sqlComposicao.SQL.Insert(17,'   (1 = 1)');
            End;
          End;
        End;
      End;
    End;
    if not prepared Then prepare;
    ParamByName('PLANO').asFloat  := iPlano;
    ParamByName('CONTA').asString := sConta;
    CdsComposicao.Data := GetDataPacket( SqlChanged );
    CdsComposicao.First;
  End;
End;
//************************************************
function TCtrlGeraDados.TestaCalculada(sConta:String;cCalcOr:Char):Boolean;
begin
   //Teste se a conta recebida já está calculada
   result := True;

   //caso seja uma conta orcada
   if cCalcOr = 'O' Then begin
      CdsContasAuxO.Close;
      if not DtmGeraDados.sqlContasAuxO.prepared Then DtmGeraDados.sqlContasAuxO.prepare;
      DtmGeraDados.sqlContasAuxO.ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      DtmGeraDados.sqlContasAuxO.ParamByName('IDCONTAORCAMEN').AsString  := Trim( sConta );
      CdsContasAuxO.Data := GetDataPacket( DtmGeraDados.sqlContasAuxO.SqlChanged );
      
      //
      if CdsContasAuxO.FieldByName( 'FLGCALCORCADO' ).AsString = 'N' Then begin
         result:=False;
      End;

   //caso seja uma conta realizada
   End Else Begin
      CdsContasAuxR.Close;
      if not DtmGeraDados.sqlContasAuxR.prepared Then DtmGeraDados.sqlContasAuxR.prepare;
      DtmGeraDados.sqlContasAuxR.ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      DtmGeraDados.sqlContasAuxR.ParamByName('IDCONTAORCAMEN').AsString  := Trim(sConta);
      CdsContasAuxR.Data := GetDataPacket( DtmGeraDados.sqlContasAuxR.SqlChanged );
      
      if CdsContasAuxR.FieldByName( 'FLGCALCREAL' ).AsString = 'N' Then begin
         result:=False;
      End;
   End;
End;
//************************************************
function TCtrlGeraDados.TransformaContas(sFormula:string; dDataCorrente:TDateTime;
                                         cCalcOR, cTipoCalc:char; bSaldoAnterior : Boolean;
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue : String): string;
var i, j, k, iInicio, iFim, iTamanho:integer;
    sValor:string;
begin
   //Pega as Contas presentes na fórmula e as transforma em valores
   //para serem processadas pelo parser

   iTamanho := length(sFormula);

   //Faz a varredura das contas e as substitui
   for k := 1 to length(sFormula) do begin
      for i := 1 to iTamanho do begin
         if sFormula[i] in ['C'] Then begin
            iInicio := i;
            for j := (i + 1) to iTamanho do begin
               if not (sFormula[j] in ['0'..'9', 'C']) Then begin
                  iFim := j;

                  bTestaCalculada:=TestaCalculada(copy(sFormula, iInicio+1, iFim-(iInicio+1)),cCalcOR);

                  if not bTestaCalculada Then begin
                     result:='';
                     exit;
                  End;

                  sValor := PegaValorContas( copy(sFormula, iInicio, iFim-iInicio),
                               dDataCorrente, cCalcOR, cTipoCalc,bSaldoAnterior,
                               pdblcCenarioText,
                               pdblkExercicioLookupValue,
                               pdblcCenarioLookupValue );

                  delete(sFormula, iInicio, iFim-iInicio);
                  insert(sValor, sFormula, iInicio);
                  iTamanho := length(sFormula);
                  Break;
               End;
            End;
            Break;
         End;
      End;
   End;

   //Rotina necessária caso haja uma conta no final da fórmula
   for i := 1 to length(sFormula) do begin
      if sFormula[i] in ['C'] Then begin
         iInicio := i;

         bTestaCalculada:=TestaCalculada(copy(sFormula, iInicio+1, length(sFormula)-1),cCalcOR);

         if not bTestaCalculada Then begin
            result:='';
            exit;
         End;

         sValor := PegaValorContas( copy(sFormula, iInicio, length(sFormula)), dDataCorrente, cCalcOR,
                                    cTipoCalc,bSaldoAnterior,
                                    pdblcCenarioText,
                                    pdblkExercicioLookupValue,
                                    pdblcCenarioLookupValue );


         delete(sFormula, iInicio, length(sFormula));
         insert(sValor, sFormula, iInicio);

      End;
   End;

   //Varre a fórmula e troca todas as possíveis vírgulas por pontos
   //(o Parser não interpreta vírgulas)
   for i := 1 to length(sFormula) do begin
      if sFormula[i] in [','] Then begin
         delete(sFormula, i, 1);
         insert('.', sFormula, i);
      End;
   End;

   result := sFormula;

End;
//************************************************
function TCtrlGeraDados.PegaValorContas( sConta:string; dDataCorrente:TDateTime; cCalcOR,
                                         cTipoCalc:char;
                                         bSaldoAnterior : Boolean;
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue : String):string;
var sTipoConta, sSoConta:string;
    dDataReferencia:TDateTime;
begin
   //Pega qual o identificador da conta (C, S, A)
   sTipoConta := copy(sConta, 1, 1);

   //Pega qual é a conta sem o identificador
   sSoConta := copy(sConta, 2, (length(sConta) - 1));

   dDataReferencia := dDataCorrente;
   with DtmGeraDados.SqlVerificaSinal do begin
      CdsVerificaSinal.close;
      If Not Prepared Then Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
      ParamByName('IDCONTAORCAMEN').AsString  := sSoConta;
      CdsVerificaSinal.Data := GetDataPacket( SqlChanged );
   End;
   //Retorna o Valor da Conta presente na fórmula
   with DtmGeraDados.sqlFormula do begin
      CdsFormula.Close;
      SQL.Clear;
      if trim( pdblcCenarioText ) <> '' Then begin
         if bSaldoAnterior Then begin
            SQL.Add('SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO FROM ');
            SQL.Add('VALORESCENARIO ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('      (PERIODO IS NULL) AND ');
            SQL.Add('      (IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('      (IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('      (IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('      (IDCONTAORCAMEN =:CONTA) ');
         End Else Begin
            SQL.Add('SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO FROM ');
            SQL.Add('VALORESCENARIO ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('      (PERIODO =:PERIODO) AND ');
            SQL.Add('      (IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('      (IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('      (IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('      (IDCONTAORCAMEN =:CONTA) ');
         End;
      End Else Begin
         if bSaldoAnterior Then begin
            SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO FROM ');
            SQL.Add('SALDOORCADOANT ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('(IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('(IDCONTAORCAMEN =:CONTA) ');
         End Else Begin
            if cTipoCalc = 'N' Then begin
               SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO FROM ');
            End Else Begin
               SQL.Add('SELECT SUM(VLRORCACUM) AS VLRORCADO, SUM(VLRREALACUM) AS VLRREALIZADO FROM ');
            End;
            SQL.Add(PrefixoServidor + 'SALDOORCADO ');
            If sGeraMes = 'S' Then
               SQL.Add('WHERE (TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATA) AND ')
            else
               SQL.Add('WHERE (DATAREFERENCIA =:DATA) AND ');
            SQL.Add('(IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('(IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('(IDCONTAORCAMEN =:CONTA) ');
         End;
      End;
      If not Prepared Then Prepare;
      if trim( pdblcCenarioText ) <> '' Then begin
         ParamByName('EXERCICIO').AsInteger         := StrToInt( pdblkExercicioLookupValue );
         ParamByName('IDCENARIOORCAMEN').AsInteger  := StrToInt( pdblcCenarioLookupValue );
         if not bSaldoAnterior Then
            ParamByName('PERIODO').AsInteger  := iPeriodoAtu;
      End Else Begin
         if bSaldoAnterior Then begin
            ParamByName('EXERCICIO').AsInteger  := StrToInt( pdblkExercicioLookupValue);
         End Else Begin
            DecodeDate(dDataReferencia,iAno,iMes,iDia);
            If sGeraMes = 'S' Then
              ParamByName('DATA').AsString   := FormatFloat( '0000', iAno ) + FormatFloat( '00', iMes  )
                                                // Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
            Else
              ParamByName('DATA').AsDateTime := dDataReferencia;
         End;
      End;

      ParamByName('IDPESSOA').AsInteger := idEmpresa;
      ParamByName('PLANO').AsInteger    := CdsContas.FieldByName( 'IDPLANOORCAMEN' ).AsInteger;
      ParamByName('CONTA').AsString     := sSoConta;
      CdsFormula.Data := GetDataPacket( SqlChanged );
      if CdsVerificaSinal.FieldByName( 'FLGATIVA' ).AsString = 'I' Then begin
         result := '0';
      End Else Begin
         if cCalcOR = 'O' Then begin
            if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then
               result := FloatToStr(CdsFormula.FieldByName('VLRORCADO').asFloat)
            else
               result := FloatToStr(CdsFormula.FieldByName('VLRORCADO').asFloat*-1);
         End Else Begin
            if CdsVerificaSinal.FieldByName( 'FLGSINALCONTA' ).AsString = 'P' Then
               result := FloatToStr(CdsFormula.FieldByName('VLRREALIZADO').asFloat)
            else
               result := FloatToStr(CdsFormula.FieldByName('VLRREALIZADO').asFloat*-1);
         End;
      End;
   End;
End;
//************************************************
Function TCtrlGeraDados.AtualizaTabela( pSql : String ) : Boolean;
Begin

  If ( ConnectionSide = cnsClient ) Then Begin

    Result := Connection.AppServer.AtualizaTabela( pSql );

    If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;

  End Else Begin

    Try
      ExecSql( pSql );
      Result := True;
    Except
      On E : Exception Do Begin
        MessageInfo := E.Message;
        Result := False;
      End;
    End;
  End;
End;
//************************************************
End.
