// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : GeraDadosApagaValores
Data      : 09/01/2004
Autor     : Marchetti
Pendencia : 15891
Descrição : Acerto na declaração do Parâmetro PESSOA
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 20/11/2003 a 21/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição :
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 20/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Reorganização do código
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Novembro/2002                          }
{                                                       }
{*******************************************************}

unit
   uCtrlGeraDados;

interface

uses
   DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils, ComCtrls, StdCtrls,
   Provider, uCMSQLParams, uCMTypes, uCtrlPadroes, uString, uDtmGeraDados, Classes, Math;

type
   TCtrlGeraDados = Class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private

      dtmGeraDados         : TdtmGeraDados;
      iMes, iAno, iDia     : Word;

      bConcluiuOK          : Boolean;
      bTestaCalculada      : Boolean;
      bSaiLoopDias         : Boolean;
      bSaiLoop             : Boolean;

      FIdEmpresa           : Integer;
      FIdModulo            : Integer;
      FIdUsuario           : Integer;
      FiPlanoOrc           : Integer;
      FiPeriodoIni         : Integer;
      FiPeriodoFim         : Integer;

      FsGeraMes            : String;
      FPrefixoServidor     : String;

      FsLog1               : String;
      FsLog2               : String;
      FsLog3               : String;
      FsLog4               : String;
      FsLog5               : String;

      FiPeriodoAtu         : Integer;
      FiPlanoContabil      : Double;

      FpbAguarde           : TProgressBar;
      FmemErroNaGeracao    : TRichEdit;
      FedtData             : TEdit;
      FedtConta            : TEdit;
      FedtTipo             : TEdit;
      FedtStatus           : TEdit;

      FCdsExercicio        : TClientDataSet;
      FCdsPeriodo          : TClientDataSet;
      FCdsCenario          : TClientDataSet;
      FCdsContasAuxR       : TClientDataSet;
      FCdsVerificaSinal    : TClientDataSet;
      FCdsSaldos           : TClientDataSet;
      FCdsContasAux        : TClientDataSet;
      FCdsPeriodoIni       : TClientDataSet;
      FCdsNaoCalculadas    : TClientDataSet;
      FCdsContasAuxO       : TClientDataSet;
      FCdsFluxo            : TClientDataSet;
      FCdsDeletaValores    : TClientDataSet;
      FCdsComposicao       : TClientDataSet;
      FCdsContabilidade    : TClientDataSet;
      FCdsAcumulado2CAnt   : TClientDataSet;
      FCdsDataview         : TClientDataSet;
      FCdsPeriodoContab    : TClientDataSet;
      FCdsPlanoData        : TClientDataSet;
      FCdsAcumulado2Ant    : TClientDataSet;
      FCdsFormula          : TClientDataSet;
      FCdsAcumulado3MC     : TClientDataSet;
      FCdsAcumulado3M      : TClientDataSet;
      FCdsAcumulado3       : TClientDataSet;
      FCdsCompContas       : TClientDataSet;
      FCdsAcumulado2       : TClientDataSet;
      FCdsAcumulado2M      : TClientDataSet;
      FCdsAcumulado2MC     : TClientDataSet;
      FCdsContas           : TClientDataSet;
      FCdsGenericos        : TClientDataSet;
      FCdsFlagCalculo      : TClientDataSet;
      FCdsLancOrc          : TClientDataSet;
      FCdsAcum2            : TClientDataSet;
      FCdsAcum3            : TClientDataSet;

      function GravaLogOperacoesOrc(pIdEmpresa  : Integer;
                                    pIdModulo   : Integer;
                                    pIdUsuario  : Integer;
                                    pLog        : String
                                   ): Boolean;

      function  SelecionaContasNaoCalculadas(cCalcOR: Char): longint;

//    procedure StartTransactionOrc;
//    procedure CommitOrc;
//    procedure RollBackOrc;

      function  GeraDadosApagaValores(iExercicio                     : Integer;
                                      iPeriodo                       : Integer;
                                      pdblcCenarioText               : String;
                                      psePosIni1Value                : Integer;
                                      psePosFim1Value                : Integer;
                                      pedConteudo1Text               : String;
                                      pdblkExercicioLookupValue      : String;
                                      pdblcCenarioLookupValue        : String;
                                      pcbBuscaSaldoAnteriorChecked   : Boolean;
                                      prgrpTipoItemIndex             : Integer
                                     ): Boolean;

      function  GeraDadosZeraFlagCalculo(prgrpTipoItemIndex : Integer;
                                          pedConteudo1Text   : String;
                                          psePosIni1Value,
                                          psePosFim1Value   : Integer): Boolean;

      procedure CalculaTiposOrcado(dDataCorrente                  : TDateTime;
                                   pdblcCenarioText               : String;
                                   pdblkExercicioLookupValue      : String;
                                   pdblcCenarioLookupValue        : String;
                                   pcbBuscaSaldoAnteriorChecked   : Boolean;
                                   psePosIni1Value                : Double;
                                   psePosFim1Value                : Double;
                                   pedConteudo1Text               : String;
                                   pdblkExerciciotext             : String
                                  );

      procedure CalculaTiposRealizado(dDataCorrente                  : TDateTime;
                                      pdblcCenarioText               : String;
                                      pdblkExercicioLookupValue      : String;
                                      pdblcCenarioLookupValue        : String;
                                      pcbBuscaSaldoAnteriorChecked   : Boolean;
                                      psePosIni1Value                : Double;
                                      psePosFim1Value                : Double;
                                      pedConteudo1Text               : String;
                                      pdblkExerciciotext             : String
                                     );

      procedure CalculaValorFixoInf(dDataCorrente              : TDateTime;
                                    cCalcOR                    : Char;
                                    pdblcCenarioText           : String;
                                    pdblkExercicioLookUpValue  : String;
                                    pdblcCenarioLookUpValue    : String;
                                    psePosIni1Value            : Double;
                                    psePosFim1Value            : Double;
                                    pedConteudo1Text           : String;
                                    pdblkExerciciotext         : String
                                   );

      procedure CalculaComposicao(dDataCorrente                : TDateTime;
                                  cCalcOR                      : Char;
                                  pdblcCenarioText             : String;
                                  pdblkExercicioLookupValue    : String;
                                  pdblcCenarioLookupValue      : String;
                                  pcbBuscaSaldoAnteriorChecked : Boolean;
                                  psePosIni1Value              : Double;
                                  psePosFim1Value              : Double;
                                  pedConteudo1Text             : String;
                                  pdblkExerciciotext           : String
                                 );

      procedure CalculaAcumulado(dDataCorrente                 : TDateTime;
                                 cCalcOR                       : Char;
                                 pcbBuscaSaldoAnteriorChecked  : Boolean;
                                 pdblcCenarioText              : String;
                                 pdblkExercicioLookupValue     : String;
                                 pdblcCenarioLookupValue       : String;
                                 psePosIni1Value               : Double;
                                 psePosFim1Value               : Double;
                                 pedConteudo1Text              : String;
                                 pdblkExerciciotext            : String
                                );

      procedure CalculaCondicional(dDataCorrente                  : TDateTime;
                                   cCalcOR                        : Char;
                                   pdblcCenarioText               : String;
                                   pdblkExercicioLookupValue      : String;
                                   pdblcCenarioLookupValue        : String;
                                   pcbBuscaSaldoAnteriorChecked   : Boolean;
                                   psePosIni1Value                : Double;
                                   psePosFim1Value                : Double;
                                   pedConteudo1Text               : String;
                                   pdblkExerciciotext             : String
                                  );

      procedure CalculaFormula(dDataCorrente                : TDateTime;
                               cCalcOR                      : Char;
                               pcbBuscaSaldoAnteriorChecked : Boolean;
                               pdblcCenarioText             : String;
                               pdblkExercicioLookUpValue    : String;
                               pdblcCenarioLookUpValue      : String;
                               psePosIni1Value              : Double;
                               psePosFim1Value              : Double;
                               pedConteudo1Text             : String;
                               pdblkExerciciotext           : String
                              );

      procedure CalculaGenericos(dDataCorrente              : TDateTime;
                                 cCalcOR                    : Char;
                                 pdblcCenarioText           : String;
                                 pdblkExercicioLookUpValue  : String;
                                 pdblcCenarioLookUpValue    : String;
                                 psePosIni1Value            : Double;
                                 psePosFim1Value            : Double;
                                 pedConteudo1Text           : String;
                                 pdblkExerciciotext         : String
                                );

       procedure CalculaContabilidade(dDataCorrente                : TDateTime;
                                      cCalcOR                      : Char;
                                      pcbBuscaSaldoAnteriorChecked : Boolean;
                                      pdblkExercicioLookupValue    : String;
                                      pdblcCenarioText             : String;
                                      pdblcCenarioLookUpValue      : String;
                                      psePosIni1Value              : Double;
                                      psePosFim1Value              : Double;
                                      pedConteudo1Text             : String;
                                      pdblkExerciciotext           : String
                                     );

      procedure CalculaFluxo(dDataCorrente               : TDateTime;
                             cCalcOR                     : Char;
                             pdblcCenarioText            : String;
                             pdblkExercicioLookUpValue   : String;
                             pdblcCenarioLookUpValue     : String;
                             psePosIni1Value             : Double;
                             psePosFim1Value             : Double;
                             pedConteudo1Text            : String;
                             pdblkExerciciotext          : String
                            );

      function  PegaValorContas(sConta                    : String;
                                dDataCorrente             : TDateTime;
                                cCalcOR                   : Char;
                                cTipoCalc                 : Char;
                                bSaldoAnterior            : Boolean;
                                pdblcCenarioText          : String;
                                pdblkExercicioLookupValue : String;
                                pdblcCenarioLookupValue   : String
                               ): String;

      function  PegaValorContasPorGrupo(sConta                    : String;
                                        dDataCorrente             : TDateTime;
                                        cCalcOR                   : Char;
                                        cTipoCalc                 : Char;
                                        bSaldoAnterior            : Boolean;
                                        pdblcCenarioText          : String;
                                        pdblkExercicioLookupValue : String;
                                        pdblcCenarioLookupValue   : String
                                       ): String;

      function  CalculaVlrAcumulado(dDataCorrente               : TDateTime;
                                    cCalcOR                     : Char;
                                    rValorDia                   : Double;
                                    pdblcCenarioText            : String;
                                    pdblkExercicioLookUpValue   : String;
                                    pdblcCenarioLookUpValue     : String
                                   ): Double;

      procedure SelecionaContas(cCalcOR            : Char;
                                cTipoCalculo       : Char;
                                psePosIni1Value    : Double;
                                psePosFim1Value    : Double;
                                pedConteudo1Text   : String
                               );

      procedure GravaSaldos(rValor                    : Double;
                            rValorAcum                : Double;
                            dDataCorrente             : TDateTime;
                            cCalcOR                   : Char;
                            pdblcCenarioText          : String;
                            pdblkExercicioLookUpValue : String;
                            pdblcCenarioLookUpValue   : String;
                            pdblkExerciciotext        : String
                           );

      procedure GravaSaldosAnt(rValor                    : Double;
                               cCalcOR                   : Char;
                               pdblcCenarioText          : String;
                               pdblkExercicioLookUpValue : String;
                               pdblcCenarioLookUpValue   : String;
                               pdblkExerciciotext        : String
                              );

      procedure SelecionaComposicao(sConta: String; iPlano: Double; cCalcOR, cTipoCalc : Char);

      function  TestaCalculada(sConta  : String;
                               cCalcOr : Char
                              ): Boolean;

      function  TransformaContas(sFormula                    : String;
                                 dDataCorrente               : TDateTime;
                                 cCalcOR                     : Char;
                                 cTipoCalc                   : Char;
                                 bSaldoAnterior              : Boolean;
                                 pdblcCenarioText            : String;
                                 pdblkExercicioLookupValue   : String;
                                 pdblcCenarioLookupValue     : String
                                ): String;

      procedure SetCdsAcumulado2(const Value: TClientDataSet);
      procedure SetCdsAcumulado2Ant(const Value: TClientDataSet);
      procedure SetCdsAcumulado2CAnt(const Value: TClientDataSet);
      procedure SetCdsAcumulado2M(const Value: TClientDataSet);
      procedure SetCdsAcumulado2MC(const Value: TClientDataSet);
      procedure SetCdsAcumulado3(const Value: TClientDataSet);
      procedure SetCdsAcumulado3M(const Value: TClientDataSet);
      procedure SetCdsAcumulado3MC(const Value: TClientDataSet);
      procedure SetCdsCenario(const Value: TClientDataSet);
      procedure SetCdsCompContas(const Value: TClientDataSet);
      procedure SetCdsComposicao(const Value: TClientDataSet);
      procedure SetCdsContabilidade(const Value: TClientDataSet);
      procedure SetCdsContas(const Value: TClientDataSet);
      procedure SetCdsContasAux(const Value: TClientDataSet);
      procedure SetCdsContasAuxO(const Value: TClientDataSet);
      procedure SetCdsContasAuxR(const Value: TClientDataSet);
      procedure SetCdsDataview(const Value: TClientDataSet);
      procedure SetCdsDeletaValores(const Value: TClientDataSet);
      procedure SetCdsExercicio(const Value: TClientDataSet);
      procedure SetCdsFlagCalculo(const Value: TClientDataSet);
      procedure SetCdsFluxo(const Value: TClientDataSet);
      procedure SetCdsFormula(const Value: TClientDataSet);
      procedure SetCdsGenericos(const Value: TClientDataSet);
      procedure SetCdsLancOrc(const Value: TClientDataSet);
      procedure SetCdsNaoCalculadas(const Value: TClientDataSet);
      procedure SetCdsPeriodo(const Value: TClientDataSet);
      procedure SetCdsPeriodoContab(const Value: TClientDataSet);
      procedure SetCdsPeriodoIni(const Value: TClientDataSet);
      procedure SetCdsPlanoData(const Value: TClientDataSet);
      procedure SetCdsSaldos(const Value: TClientDataSet);
      procedure SetCdsVerificaSinal(const Value: TClientDataSet);
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


   public

      constructor Create; override;
      destructor  Destroy; override;

      function AtualizaTabela(const sSQL: String): Boolean;

      function VerificaPeriodo(pIdEmpresa         : Integer;
                               piExercicio        : Integer;
                               piPeriodo          : Integer;
                               pdblkExercicioText : String
                              ): Boolean;

      function  IniciaGeracao(pdblkExerciciotext            : String;
                              prgrpTipoItemIndex            : Integer;
                              pdblcCenarioText              : String;
                              psePosIni1Value               : Integer;
                              psePosFim1Value               : Integer;
                              pedConteudo1Text              : String;
                              pdblkExercicioLookupValue     : String;
                              pdblcCenarioLookupValue       : String;
                              pcbBuscaSaldoAnteriorChecked  : Boolean
                             ): Boolean;

      procedure AbreQueries;
      procedure FechaQueries;

      procedure AbreQueriesShow(IDEmpresa : Integer;
                                iYearDate : Integer);

      procedure VerificaNaoCalculadas(CCalcOR : Char);

      procedure ConfirmarClick(pidEmpresa                   : Integer;
                               pcbBuscaSaldoAnteriorChecked : Boolean;
                               pcbCalcMesChecked            : Boolean;
                               pedConteudo1Text             : String;
                               rgrpTipoItemsItemIndex       : String;
                               pdblkExerciciotext           : String;
                               psePosIni1Value              : Integer;
                               psePosFim1Value              : Integer;
                               pIntegraBackPlano            : LongInt;
                               prgrpTipoItemIndex           : Integer;
                               pdblcCenarioText             : String;
                               pdblkExercicioLookupValue    : String;
                               pdblcCenarioLookupValue      : String
                              );

      procedure AbrePeriodo(pidEmpresa, pYearDate  : Integer);

      property memErroNaGeracao  : TRichEdit       read FmemErroNaGeracao  write SetmemErroNaGeracao;
      property edtData           : TEdit           read FedtData           write SetedtData;
      property edtTipo           : TEdit           read FedtTipo           write SetedtTipo;
      property edtConta          : TEdit           read FedtConta          write SetedtConta;
      property edtStatus         : TEdit           read FedtStatus         write SetedtStatus;
      property pbAguarde         : TProgressBar    read FpbAguarde         write SetpbAguarde;
      property IdEmpresa         : Integer         read FIdEmpresa         write SetIdEmpresa;
      property IdModulo          : Integer         read FIdModulo          write SetIdModulo;
      property IdUsuario         : Integer         read FIdUsuario         write SetIdUsuario;
      property IPlanoOrc         : Integer         read FIPlanoOrc         write SetIPlanoOrc;
      property iPeriodoIni       : Integer         read FiPeriodoIni       write SetiPeriodoIni;
      property iPeriodoFim       : Integer         read FiPeriodoFim       write SetiPeriodoFim;
      property sGeraMes          : String          read FsGeraMes          write SetsGeraMes;
      property PrefixoServidor   : String          read FPrefixoServidor   write SetPrefixoServidor;
      property sLog1             : String          read FsLog1             write SetsLog1;
      property sLog2             : String          read FsLog2             write SetsLog2;
      property sLog3             : String          read FsLog3             write SetsLog3;
      property sLog4             : String          read FsLog4             write SetsLog4;
      property sLog5             : String          read FsLog5             write SetsLog5;
      property iPeriodoAtu       : Integer         read FiPeriodoAtu       write SetiPeriodoAtu;
      property iPlanoContabil    : Double          read FiPlanoContabil    write SetiPlanoContabil;
      property CdsExercicio      : TClientDataSet  read FCdsExercicio      write SetCdsExercicio;
      property CdsPeriodo        : TClientDataSet  read FCdsPeriodo        write SetCdsPeriodo;
      property CdsCenario        : TClientDataSet  read FCdsCenario        write SetCdsCenario;
      property CdsContasAuxR     : TClientDataSet  read FCdsContasAuxR     write SetCdsContasAuxR;
      property CdsVerificaSinal  : TClientDataSet  read FCdsVerificaSinal  write SetCdsVerificaSinal;
      property CdsSaldos         : TClientDataSet  read FCdsSaldos         write SetCdsSaldos;
      property CdsContasAux      : TClientDataSet  read FCdsContasAux      write SetCdsContasAux;
      property CdsPeriodoIni     : TClientDataSet  read FCdsPeriodoIni     write SetCdsPeriodoIni;
      property CdsNaoCalculadas  : TClientDataSet  read FCdsNaoCalculadas  write SetCdsNaoCalculadas;
      property CdsContasAuxO     : TClientDataSet  read FCdsContasAuxO     write SetCdsContasAuxO;
      property CdsFluxo          : TClientDataSet  read FCdsFluxo          write SetCdsFluxo;
      property CdsDeletaValores  : TClientDataSet  read FCdsDeletaValores  write SetCdsDeletaValores;
      property CdsComposicao     : TClientDataSet  read FCdsComposicao     write SetCdsComposicao;
      property CdsContabilidade  : TClientDataSet  read FCdsContabilidade  write SetCdsContabilidade;
      property CdsAcumulado2CAnt : TClientDataSet  read FCdsAcumulado2CAnt write SetCdsAcumulado2CAnt;
      property CdsDataview       : TClientDataSet  read FCdsDataview       write SetCdsDataview;
      property CdsPeriodoContab  : TClientDataSet  read FCdsPeriodoContab  write SetCdsPeriodoContab;
      property CdsPlanoData      : TClientDataSet  read FCdsPlanoData      write SetCdsPlanoData;
      property CdsAcumulado2Ant  : TClientDataSet  read FCdsAcumulado2Ant  write SetCdsAcumulado2Ant;
      property CdsFormula        : TClientDataSet  read FCdsFormula        write SetCdsFormula;
      property CdsAcumulado3MC   : TClientDataSet  read FCdsAcumulado3MC   write SetCdsAcumulado3MC;
      property CdsAcumulado3M    : TClientDataSet  read FCdsAcumulado3M    write SetCdsAcumulado3M;
      property CdsAcumulado3     : TClientDataSet  read FCdsAcumulado3     write SetCdsAcumulado3;
      property CdsCompContas     : TClientDataSet  read FCdsCompContas     write SetCdsCompContas;
      property CdsAcumulado2     : TClientDataSet  read FCdsAcumulado2     write SetCdsAcumulado2;
      property CdsAcumulado2M    : TClientDataSet  read FCdsAcumulado2M    write SetCdsAcumulado2M;
      property CdsAcumulado2MC   : TClientDataSet  read FCdsAcumulado2MC   write SetCdsAcumulado2MC;
      property CdsContas         : TClientDataSet  read FCdsContas         write SetCdsContas;
      property CdsGenericos      : TClientDataSet  read FCdsGenericos      write SetCdsGenericos;
      property CdsFlagCalculo    : TClientDataSet  read FCdsFlagCalculo    write SetCdsFlagCalculo;
      property CdsLancOrc        : TClientDataSet  read FCdsLancOrc        write SetCdsLancOrc;
      property CdsAcum2          : TClientDataSet  read FCdsAcum2          write SetCdsAcum2;
      property CdsAcum3          : TClientDataSet  read FCdsAcum3          write SetCdsAcum3;

   end;



implementation



constructor TCtrlGeraDados.Create;
begin
   inherited;

   dtmGeraDados      := TdtmGeraDados.Create(nil);

   CdsPeriodo        := TClientDataSet.Create(nil);
   CdsContasAuxR     := TClientDataSet.Create(nil);
   CdsVerificaSinal  := TClientDataSet.Create(nil);
   CdsSaldos         := TClientDataSet.Create(nil);
   CdsContasAux      := TClientDataSet.Create(nil);
   CdsContasAuxO     := TClientDataSet.Create(nil);
   CdsFluxo          := TClientDataSet.Create(nil);
   CdsDeletaValores  := TClientDataSet.Create(nil);
   CdsComposicao     := TClientDataSet.Create(nil);
   CdsContabilidade  := TClientDataSet.Create(nil);
   CdsAcumulado2CAnt := TClientDataSet.Create(nil);
   CdsDataview       := TClientDataSet.Create(nil);
   CdsPeriodoContab  := TClientDataSet.Create(nil);
   CdsPlanoData      := TClientDataSet.Create(nil);
   CdsAcumulado2Ant  := TClientDataSet.Create(nil);
   CdsFormula        := TClientDataSet.Create(nil);
   CdsAcumulado3MC   := TClientDataSet.Create(nil);
   CdsAcumulado3M    := TClientDataSet.Create(nil);
   CdsAcumulado3     := TClientDataSet.Create(nil);
   CdsCompContas     := TClientDataSet.Create(nil);
   CdsAcumulado2     := TClientDataSet.Create(nil);
   CdsAcumulado2M    := TClientDataSet.Create(nil);
   CdsAcumulado2MC   := TClientDataSet.Create(nil);
   CdsContas         := TClientDataSet.Create(nil);
   CdsGenericos      := TClientDataSet.Create(nil);
   CdsFlagCalculo    := TClientDataSet.Create(nil);
   CdsLancOrc        := TClientDataSet.Create(nil);
   CdsAcum2          := TClientDataSet.Create(nil);
   CdsAcum3          := TClientDataSet.Create(nil);
end;



destructor TCtrlGeraDados.Destroy;
begin
   inherited;

   if (isAppServer) then
   begin
      FreeCds([CdsContasAuxR,    CdsVerificaSinal, CdsSaldos,         CdsContasAux,
               CdsPeriodoIni,    CdsContasAuxO,    CdsFluxo,          CdsDeletaValores,
               CdsComposicao,    CdsContabilidade, CdsAcumulado2CAnt, CdsDataview,
               CdsPeriodoContab, CdsPlanoData,     CdsAcumulado2Ant,  CdsFormula,
               CdsAcumulado3MC,  CdsAcumulado3M,   CdsAcumulado3,     CdsCompContas,
               CdsAcumulado2,    CdsAcumulado2M,   CdsAcumulado2MC,   CdsContas,
               CdsGenericos,     CdsFlagCalculo,   CdsLancOrc,        CdsAcum2,
               CdsAcum3]);
   end;

   dtmGeraDados.Free;
end;



procedure TCtrlGeraDados.OnCreateAppServer;
begin
   inherited;

   memErroNaGeracao := TRichEdit.Create(nil);
   edtData          := TEdit.Create(nil);
   edtTipo          := TEdit.Create(nil);
   edtConta         := TEdit.Create(nil);
   edtStatus        := TEdit.Create(nil);
   pbAguarde        := TProgressBar.Create(nil);

   CdsNaoCalculadas := TClientDataSet.Create(nil);
   CdsExercicio     := TClientDataSet.Create(nil);
   CdsPeriodoIni    := TClientDataSet.Create(nil);
   CdsCenario       := TClientDataSet.Create(nil);
end;



procedure TCtrlGeraDados.DoChangeDataBase;
begin
   inherited;
end;



procedure TCtrlGeraDados.AbreQueries;
begin
   try
      with dtmGeraDados do
      begin
         CdsCenario.Close;

         CdsComposicao.Close;
         SQLComposicao.Prepare;

         CdsContasAuxR.Close;
         SQLContasAuxR.Prepare;

         CdsContasAuxO.Close;
         SQLContasAuxO.Prepare;

         CdsPeriodoContab.Close;
         SQLPeriodoContab.Prepare;

         CdsCenario.Data         := SQLCenario.Data;
         CdsComposicao.Data      := SQLComposicao.Data;
         CdsContasAuxR.Data      := SQLContasAuxR.Data;
         CdsContasAuxO.Data      := SQLContasAuxO.Data;
         CdsPeriodoContab.Data   := SQLPeriodoContab.Data;
      end;
   except
      on E: Exception do MessageInfo := E.Message;
   end;
end;



procedure TCtrlGeraDados.FechaQueries;
begin
   with dtmGeraDados do
   begin
      CdsVerificaSinal.Close;
      SQLVerificaSinal.UnPrepare;

      CdsComposicao.Close;
      SQLComposicao.UnPrepare;

      CdsPeriodo.Close;
      SQLPeriodo.UnPrepare;

      CdsFormula.Close;
      SQLFormula.UnPrepare;

      CdsDeletaValores.Close;
      SQLDeletaValores.UnPrepare;

      CdsContas.Close;
      SQLContas.UnPrepare;

      CdsContasAux.Close;
      SQLContasAux.UnPrepare;

      CdsContabilidade.Close;
      SQLContabilidade.UnPrepare;

      CdsDataview.Close;
      SQLDataView.UnPrepare;

      CdsFluxo.Close;
      SQLFluxo.UnPrepare;

      CdsCompContas.Close;
      SQLCompContas.UnPrepare;

      CdsContasAuxR.Close;
      SQLContasAuxR.UnPrepare;

      CdsContasAuxO.Close;
      SQLContasAuxO.UnPrepare;

      CdsSaldos.Close;
      SQLSaldos.UnPrepare;

      CdsPeriodoContab.Close;
      SQLPeriodoContab.UnPrepare;
   end;
end;



procedure TCtrlGeraDados.AbreQueriesShow(IDEmpresa : Integer;
                                         iYearDate : Integer);
begin
   // Preenche as combo-boxes
   with dtmGeraDados.SQLExercicio do
   begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := IDEmpresa;

      CdsExercicio.Data := GetDataPacket(SQLChanged);
   end;

   AbrePeriodo(IDEmpresa, iYearDate);
end;



procedure TCtrlGeraDados.AbrePeriodo(pidEmpresa,
                                      pYearDate  : Integer);
begin
  with dtmGeraDados.SQLPeriodoIni do begin
    if not(Prepared) then Prepare;
    ParamByName('IDPESSOA').asInteger  := pidEmpresa;
    ParamByName('EXERCICIO').asInteger := pYearDate;
    cdsPeriodoIni.Data := GetDataPacket(SQLChanged);;
  end;
end;



procedure TCtrlGeraDados.VerificaNaoCalculadas(CCalcOR    : Char);
begin
   with dtmGeraDados.SQLNaoCalculadas do
   begin
      SQL.Clear;
      SQL.Add('SELECT IDCONTAORCAMEN, NOMECONTAORCAMEN, TIPOCALCORCADO, TIPOCALCREALIZADO' + #13 + #10);
      SQL.Add('FROM CONTASORCAMEN' + #13 + #10);
      SQL.Add('WHERE' + #13 + #10);
      SQL.Add('  (TIPOCALCREALIZADO <> ''T'') AND ' + #13 + #10);
      SQL.Add('  ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
      SQL.Add('  (TIPOCALCORCADO <> ''T'') AND ');

      if cCalcOR = 'O' then
      begin
         SQL.Add('(FLGCALCORCADO = ''N'') AND ')
      end
      else if cCalcOR = 'R' then
      begin
         SQL.Add('(FLGCALCREAL = ''N'') AND ');
      end;

      SQL.Add(' (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');

      Prepare;
      CdsNaoCalculadas.Close;

      CdsNaoCalculadas.Data := GetDataPacket(SQLChanged);
   end;
end;



function  TCtrlGeraDados.VerificaPeriodo(pIdEmpresa         : Integer;
                                         piExercicio        : Integer;
                                         piPeriodo          : Integer;
                                         pdblkExercicioText : String
                                        ): Boolean;
begin
   try
      with dtmGeraDados.SQLPeriodo do
      begin
         CdsPeriodo.Close;

         if not(Prepared) then Prepare;
         ParamByName('PESSOA').asInteger    := pIdEmpresa;
         ParamByName('PERIODO').asInteger   := Trunc(piPeriodo);
         ParamByName('EXERCICIO').asInteger := piExercicio;

         CdsPeriodo.Data := GetDataPacket(SQLchanged);

         if CdsPeriodo.IsEmpty then
         begin
            MessageInfo := 'Não existe este período para este Exercício.';
            CdsPeriodo.Close;
         end
         else
         begin
            sLog1  := CdsPeriodo.FieldByName('NOMEPERIODO').AsString + '/' + pdblkExercicioText;
         end;
      end;

      with dtmGeraDados.SQLPlanoData do
      begin
         CdsPlanoData.Close;

         Prepare;
         ParamByName('IDPESSOA').AsInteger := pidEmpresa;
         ParamByName('DATA').AsDateTime    := CdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime;

         CdsPlanoData.Data := GetDataPacket(SQLchanged);
      end;

      Result := True;

   except
      on E: Exception do
      begin
         MessageInfo := E.Message;
         Result      := False;
      end;
   end;
end;



procedure TCtrlGeraDados.ConfirmarClick(pidEmpresa                   : Integer;
                                        pcbBuscaSaldoAnteriorChecked : Boolean;
                                        pcbCalcMesChecked            : Boolean;
                                        pedConteudo1Text             : String;
                                        rgrpTipoItemsItemIndex       : String;
                                        pdblkExerciciotext           : String;
                                        psePosIni1Value              : Integer;
                                        psePosFim1Value              : Integer;
                                        pIntegraBackPlano            : LongInt;
                                        prgrpTipoItemIndex           : Integer;
                                        pdblcCenarioText             : String;
                                        pdblkExercicioLookupValue    : String;
                                        pdblcCenarioLookupValue      : String
                                       );
var
   k : Integer;
begin
   for k := iPeriodoIni to iPeriodoFim do
   begin
      if (k > iPeriodoIni) then pcbBuscaSaldoAnteriorChecked := False;

      iPeriodoAtu := k;
      sLog2       := rgrpTipoItemsItemIndex;

      if pcbCalcMesChecked then
      begin
         sGeraMes := 'S';
         sLog3    := 'por Período';
      end
      else
      begin
         sGeraMes := 'N';
         sLog3    := 'por Dia';
      end;

      if pcbBuscaSaldoAnteriorChecked then
         sLog4 := 'com Saldo Anterior'
      else
         sLog4 := 'sem Saldo Anterior';

      if trim(pedConteudo1Text) <> '' then
         sLog5 := 'Contas de '+ FloatToStr(psePosIni1Value) + ',' + FloatToStr(psePosFim1Value) +
                  ' com o texto '+trim(pedConteudo1Text)
      else
        sLog5 := 'Todas as Contas';

      // se o periodo e valido no exercício, inicia a geracao dos dados
      if VerificaPeriodo(pIdEmpresa,
                         StrToInt(pdblkExerciciotext),
                         iPeriodoAtu,
                         pdblkExerciciotext
                        ) then
      begin
         iPlanoContabil := pIntegraBackPlano;

         {
         with dtmGeraDados.SQLPlanoData do begin
           Prepare;
           ParamByName('IDPESSOA').AsInteger := pidEmpresa;
           ParamByName('DATA').AsDateTime    := CdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime;
           CdsPlanoData.Close;
           CdsPlanoData.Data := Data;
         end;
         }

         if not(CdsPlanoData.IsEmpty) then
            iPlanoContabil := CdsPlanoData.FieldByName('PLANO').AsInteger;

         IniciaGeracao(pdblkExerciciotext,
                       prgrpTipoItemIndex,
                       pdblcCenarioText,
                       psePosIni1Value,
                       psePosFim1Value,
                       pedConteudo1Text,
                       pdblkExercicioLookupValue,
                       pdblcCenarioLookupValue,
                       pcbBuscaSaldoAnteriorChecked
                      );
      end;
   end;
end;



function  TCtrlGeraDados.IniciaGeracao(pdblkExerciciotext            : String;
                                       prgrpTipoItemIndex            : Integer;
                                       pdblcCenarioText              : String;
                                       psePosIni1Value               : Integer;
                                       psePosFim1Value               : Integer;
                                       pedConteudo1Text              : String;
                                       pdblkExercicioLookupValue     : String;
                                       pdblcCenarioLookupValue       : String;
                                       pcbBuscaSaldoAnteriorChecked  : Boolean
                                      ): Boolean;
var
   i, iNumeroDias : Integer;
   dDataCorrente : TDateTime;
begin
   Result := False;
   try
     bConcluiuOK := True;
     //Inicia a geração dos dados
     if sGeraMes = 'S' then begin
       dDataCorrente  := CdsPeriodo.FieldByName('DataFimPeriodo').AsDateTime;
       iNumeroDias    := 1;
     end else begin
       dDataCorrente  := CdsPeriodo.FieldByName('DataIniPeriodo').AsDateTime;
       iNumeroDias    := Trunc(CdsPeriodo.FieldByName('DataFimPeriodo').AsDateTime - CdsPeriodo.FieldByName('DataIniPeriodo').AsDateTime) + 1;
     end;
   except
     on E : Exception do begin
       MessageInfo := E.Message;
       Raise;
     end;
   end;
   pbAguarde.position := 0;

   //Apaga os valores das Contas Orcamentarias no Periodo e Exercicio correntes
   MessageInfo    := 'Geração dos Dados Concluída.';
   edtStatus.Text := 'Aguarde, apagando os valores das Contas Orçamentárias...';

   GeraDadosApagaValores(StrToInt(pdblkExerciciotext),
                         iPeriodoAtu,
                         pdblcCenarioText,
                         psePosIni1Value,
                         psePosFim1Value,
                         pedConteudo1Text,
                         pdblkExercicioLookupValue,
                         pdblcCenarioLookupValue,
                         pcbBuscaSaldoAnteriorChecked,
                         prgrpTipoItemIndex);
   pbAguarde.Max := iNumeroDias;

   //Controle do loop infinito para referências cruzadas nas contas calculadas
   bSaiLoopDias := False;

   //Inicia o loop que varre as datas do período
   for i := 1 to iNumeroDias do begin

     bSaiLoopDias := not(GeraDadosZeraFlagCalculo(prgrpTipoItemIndex,
                                                   pedConteudo1Text,
                                                   psePosIni1Value,
                                                   psePosFim1Value));

     //Verifica a cada interação do loop principal se o cálculo está em loop infinito
     if bSaiLoopDias then begin

       //RollBack;
       //MessageInfo := 'Erro ao gerar os Dados';
       bConcluiuOK := False;
       Exit;
     end;

     //Verifica a cada interação do loop principal se o botão de cancelamento foi acionado
     if (edtStatus.Tag = -1) then begin
       //RollBack;
       MessageInfo := 'Geração dos Dados cancelada.';
       bConcluiuOK := False;
       Exit;
     end;

     //Imprime a data na tela e esvazia a fila de mensagens
     edtData.Text := DateToStr(dDataCorrente);

     //Monta as rotinas de cálculo de acordo com a seleçào de tela
     case prgrpTipoItemIndex of
       0: CalculaTiposOrcado(dDataCorrente,
                              pdblcCenarioText,
                              pdblkExercicioLookupValue,
                              pdblcCenarioLookupValue,
                              pcbBuscaSaldoAnteriorChecked,
                              psePosIni1Value,
                              psePosFim1Value,
                              pedConteudo1Text,
                              pdblkExerciciotext);
       1: CalculaTiposRealizado(dDataCorrente,
                                 pdblcCenarioText,
                                 pdblkExercicioLookupValue,
                                 pdblcCenarioLookupValue,
                                 pcbBuscaSaldoAnteriorChecked,
                                 psePosIni1Value,
                                 psePosFim1Value,
                                 pedConteudo1Text,
                                 pdblkExerciciotext);
       2: begin
             CalculaTiposOrcado(dDataCorrente,
                                 pdblcCenarioText,
                                 pdblkExercicioLookupValue,
                                 pdblcCenarioLookupValue,
                                 pcbBuscaSaldoAnteriorChecked,
                                 psePosIni1Value,
                                 psePosFim1Value,
                                 pedConteudo1Text,
                                 pdblkExerciciotext);
             CalculaTiposRealizado(dDataCorrente,
                                    pdblcCenarioText,
                                    pdblkExercicioLookupValue,
                                    pdblcCenarioLookupValue,
                                    pcbBuscaSaldoAnteriorChecked,
                                    psePosIni1Value,
                                    psePosFim1Value,
                                    pedConteudo1Text,
                                    pdblkExerciciotext);
          end;
     end;

     dDataCorrente := dDataCorrente + 1;
     pbAguarde.Position := pbAguarde.position + 1;
   end;
   try
     if (MessageInfo = 'Geração dos Dados Concluída.') then begin
       if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Termino com sucesso')) then
         Abort;
     end;
     Result := True;
   except
     on E: Exception do begin
       bConcluiuOK := False;
       MessageInfo := E.Message;
       Raise;
     end;
   end;
   EdtStatus.Text  := '';
   pbAguarde.Position := 0;
end;



function TCtrlGeraDados.GravaLogOperacoesOrc(pIdEmpresa  : Integer;
                                             pIdModulo   : Integer;
                                             pIdUsuario  : Integer;
                                             pLog        : String
                                            ): Boolean;
begin
   if (ConnectionSide = cnsClient) then
   begin
      Result := Connection.AppServer.GravaLogOperacoesOrc(pIdEmpresa,
                                                          pIdModulo,
                                                          pIdUsuario,
                                                          pLog
                                                         );
   end
   else
   begin
      Result := Padroes.GravaLogOperacoes(pIdEmpresa,
                                          pIdModulo,
                                          pIdUsuario,
                                          pLog,
                                          False
                                         );
   end;
end;



{
procedure TCtrlGeraDados.StartTransactionOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.StartTransactionOrc;

  end else begin

    StartTransaction;
  end;
end;

procedure TCtrlGeraDados.CommitOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.CommitOrc;

  end else begin

    Commit;
  end;
end;

procedure TCtrlGeraDados.RollBackOrc;
begin

  if (ConnectionSide = cnsClient) then begin

    Connection.AppServer.RollBackOrc;

  end else begin

    RollBack;
  end;
end;
}



function  TCtrlGeraDados.GeraDadosApagaValores(iExercicio                     : Integer;
                                               iPeriodo                       : Integer;
                                               pdblcCenarioText               : String;
                                               psePosIni1Value                : Integer;
                                               psePosFim1Value                : Integer;
                                               pedConteudo1Text               : String;
                                               pdblkExercicioLookupValue      : String;
                                               pdblcCenarioLookupValue        : String;
                                               pcbBuscaSaldoAnteriorChecked   : Boolean;
                                               prgrpTipoItemIndex             : Integer
                                              ): Boolean;
begin
   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog1,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog2,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog3,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog4,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog5,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Apaga Saldos Existentes')) then Abort;

      if ((edtStatus.Tag = -1)) then Abort;

      with dtmGeraDados.SQLDeletaValores do
      begin
         if (trim(pdblcCenarioText) <> '') then
         begin
            // Zera os valores do Cenário
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

            if trim(pedConteudo1Text) <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
            end;

            SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');

            if not(Prepared) then Prepare;
            ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
            ParamByName('PESSOA').asInteger          := IdEmpresa;
            ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExercicioLookupValue);
            ParamByName('PERIODO').asInteger         := iPeriodoAtu;
            ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt(pdblcCenarioLookupValue);

            AtualizaTabela(SQLChanged);

            if ((edtStatus.Tag = -1)) then Abort;

            if (pcbBuscaSaldoAnteriorChecked) then
            begin
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
               if trim(pedConteudo1Text) <> '' then begin
                  SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+ FloatToStr(psePosIni1Value)+','+ FloatToStr(psePosFim1Value)+') = ('''+ trim(pedConteudo1Text)+''')) AND ');
               end;
               SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');
               if not(Prepared) then Prepare;
               ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
               ParamByName('PESSOA').asInteger          := IdEmpresa;
               ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExercicioLookupValue);
               ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt(pdblcCenarioLookupValue);
               AtualizaTabela(SQLChanged);

               if ((edtStatus.Tag = -1)) then Abort;
            end;
         end
         else
         begin
            if (prgrpTipoItemIndex = 0) or (prgrpTipoItemIndex = 2) then
            begin
               // Zera os valores dos Saldos Orçados
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

               if trim(pedConteudo1Text) <> '' then begin
                  SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
               end;

               SQL.Add('   (S.IDPESSOA  = :PESSOA)                                 ');

               if not(Prepared) then Prepare;
               ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
               ParamByName('PESSOA').asInteger         := IdEmpresa;
               ParamByName('DATAINI').asString         := CdsPeriodo.FieldByName('DataIniPeriodo').AsString;
               ParamByName('DATAFIM').asString         := CdsPeriodo.FieldByName('DataFimPeriodo').AsString;

               AtualizaTabela(SQLChanged);

               if ((edtStatus.Tag = -1)) then Abort;

               if (pcbBuscaSaldoAnteriorChecked) then
               begin
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

                  if trim(pedConteudo1Text) <> '' then
                  begin
                     SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
                  end;

                  SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');

                  if not(Prepared) then Prepare;
                  ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
                  ParamByName('PESSOA').asInteger         := IdEmpresa;
                  ParamByName('EXERCICIO').asInteger      := StrToInt(pdblkExercicioLookupValue);

                  AtualizaTabela(SQLChanged);

                  CdsDeletaValores.Close;

                  if ((edtStatus.Tag = -1)) then Abort;
               end;
            end;

            if ((prgrpTipoItemIndex = 1) or (prgrpTipoItemIndex = 2)) then
            begin
               // Zera os valores dos Saldos Realizados
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

               if trim(pedConteudo1Text) <> '' then
               begin
                  SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
               end;

               SQL.Add('   (S.IDPESSOA  = :PESSOA)                                     ');

               if not(Prepared) then Prepare;
               ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
               ParamByName('PESSOA').asInteger         := IdEmpresa;
               ParamByName('DATAINI').asString         := CdsPeriodo.FieldByName('DataIniPeriodo').AsString;
               ParamByName('DATAFIM').asString         := CdsPeriodo.FieldByName('DataFimPeriodo').AsString;

               AtualizaTabela(SQLChanged);

               CdsDeletaValores.Close;

               if ((edtStatus.Tag = -1)) then Abort;

               if (pcbBuscaSaldoAnteriorChecked) then
               begin
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

                  if trim(pedConteudo1Text) <> '' then
                  begin
                     SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+ FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
                  end;

                  SQL.Add('   (S.IDPESSOA  = :PESSOA)                                  ');

                  if not(Prepared) then Prepare;
                  ParamByName('IDPLANOORCAMEN').asInteger := iPlanoOrc;
                  ParamByName('PESSOA').asInteger         := IdEmpresa;
                  ParamByName('EXERCICIO').asInteger      := StrToInt(pdblkExercicioLookupValue);

                  AtualizaTabela(SQLChanged);

                  CdsDeletaValores.Close;

                  if ((edtStatus.Tag = -1)) then Abort;
               end;
            end;
         end;
      end;

      Commit;
      Result := True;

   except
      on E: Exception do
      begin
         RollBack;
         Result      := False;
         MessageInfo := E.Message;
         // Raise;
      end;
   end;
end;



function  TCtrlGeraDados.GeraDadosZeraFlagCalculo(prgrpTipoItemIndex : Integer;
                                                  pedConteudo1Text   : String;
                                                  psePosIni1Value    : Integer;
                                                  psePosFim1Value    : Integer
                                                 ): Boolean;
begin
   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Zera Flag de Cálculo')) then Abort;

      with dtmGeraDados.SQLFlagCalculo do
      begin
         if (edtStatus.Tag = -1) then Abort;

         if (prgrpTipoItemIndex = 0) or (prgrpTipoItemIndex = 2) then
         begin
            // Seta as Flags de Cálculo nas contas para Não Calculadas
            SQL.Clear;
            SQL.Add('UPDATE CONTASORCAMEN SET ');
            SQL.Add('FLGCALCORCADO = ''N'' ');
            SQL.Add('WHERE (TIPOCALCORCADO <> ''V'') AND ');
            SQL.Add('      (TIPOCALCORCADO <> ''T'') AND ');
            SQL.Add('      ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');

            if trim(pedConteudo1Text) <> '' then
            begin
              SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
            end;

            SQL.Add('      (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');

            AtualizaTabela(SQLChanged);

            if (edtStatus.Tag = -1) then Abort;

            SQL.Clear;
            SQL.Add('UPDATE CONTASORCAMEN SET ');
            SQL.Add('FLGCALCORCADO = ''S'' ');
            SQL.Add('WHERE ((TIPOCALCORCADO = ''V'') OR ');
            SQL.Add('       (FLGATIVA = ''I'') OR ');

            if trim(pedConteudo1Text) <> '' then
            begin
               SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') <> ('''+trim(pedConteudo1Text)+''')) OR ');
            end;

            SQL.Add('      (TIPOCALCORCADO = ''T'')) AND ');
            SQL.Add('      (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');

            AtualizaTabela(SQLChanged);

            if (edtStatus.Tag = -1) then Abort;
         end;  // if (prgrpTipoItemIndex = 0) or (prgrpTipoItemIndex = 2)

         if (prgrpTipoItemIndex = 1) or (prgrpTipoItemIndex = 2) then
         begin
            //Seta as Flags de Cálculo nas contas para Não Calculadas
            SQL.Clear;
            SQL.Add('UPDATE CONTASORCAMEN SET ');
            SQL.Add('FLGCALCREAL = ''N'' ');
            SQL.Add('WHERE (TIPOCALCREALIZADO <> ''V'') AND ');
            SQL.Add('      (TIPOCALCREALIZADO <> ''T'') AND ');
            SQL.Add('      ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
            if trim(pedConteudo1Text) <> '' then begin
               SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) AND ');
            end;
            SQL.Add('      (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');
            AtualizaTabela(SQLChanged);

            if (edtStatus.Tag = -1) then Abort;

            SQL.Clear;
            SQL.Add('UPDATE CONTASORCAMEN SET ');
            SQL.Add('FLGCALCREAL = ''S'' ');
            SQL.Add('WHERE ((TIPOCALCREALIZADO = ''V'') OR ');
            SQL.Add('       (FLGATIVA = ''I'') OR ');
            if trim(pedConteudo1Text) <> '' then begin
               SQL.Add('(SUBSTR(IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') <> ('''+trim(pedConteudo1Text)+''')) OR ');
            end;
            SQL.Add('      (TIPOCALCREALIZADO = ''T'')) AND ');
            SQL.Add('      (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');
            AtualizaTabela(SQLChanged);

            if (edtStatus.Tag = -1) then Abort;
         end;  // if (prgrpTipoItemIndex = 1) or (prgrpTipoItemIndex = 2)
      end;

      Commit;

      Result := True;
   except
      on E: Exception do
      begin
         Result := False;
         RollBack;
         MessageInfo := E.Message;
         bConcluiuOK := False;
         // Raise;
      end;
   end;
end;



procedure TCtrlGeraDados.CalculaTiposOrcado(dDataCorrente                  : TDateTime;
                                            pdblcCenarioText               : String;
                                            pdblkExercicioLookupValue      : String;
                                            pdblcCenarioLookupValue        : String;
                                            pcbBuscaSaldoAnteriorChecked   : Boolean;
                                            psePosIni1Value                : Double;
                                            psePosFim1Value                : Double;
                                            pedConteudo1Text               : String;
                                            pdblkExerciciotext             : String
                                           );
var
   iNumRegistros     : longint;
   iNumRegAnterior   : longint;
begin
   bSaiLoop := False;
   //Atribui os contadores de registros depois dos tipos acima já calculados
   iNumRegAnterior := SelecionaContasNaoCalculadas('O');
   iNumRegistros   := SelecionaContasNaoCalculadas('O');

   while not(bSaiLoop) and not(edtStatus.Tag = -1) do
   begin
     // Voltar aqui
     // Faz o cálculo das contas recursivamente até não existir mais nenhuma não calculada
     CalculaValorFixoInf(dDataCorrente,
                         'O',
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         psePosIni1Value,
                         psePosFim1Value,
                         pedConteudo1Text,
                         pdblkExerciciotext           // Tipo I
                        );

      if iNumRegistros = 0 then
      begin
         bSaiLoop := True;
      end
      else
      begin
         // Chama separadamente as rotinas de cálculo de Contas Orçadas

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Composição - Orçado')) then Abort;

            CalculaComposicao(dDataCorrente,
                              'O',
                              pdblcCenarioText,
                              pdblkExercicioLookupValue,
                              pdblcCenarioLookupValue,
                              pcbBuscaSaldoAnteriorChecked,
                              psePosIni1Value,
                              psePosFim1Value,
                              pedConteudo1Text,
                              pdblkExerciciotext      // Tipo F
                             );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Acumulado - Orçado')) then Abort;

            CalculaAcumulado(dDataCorrente,
                             'O',
                             pcbBuscaSaldoAnteriorChecked,
                             pdblcCenarioText,
                             pdblkExercicioLookupValue,
                             pdblcCenarioLookupValue,
                             psePosIni1Value,
                             psePosFim1Value,
                             pedConteudo1Text,
                             pdblkExerciciotext       // Tipo A
                            );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Condicional - Orçado')) then Abort;

            CalculaCondicional(dDataCorrente,
                               'O',
                               pdblcCenarioText,
                               pdblkExercicioLookupValue,
                               pdblcCenarioLookupValue,
                               pcbBuscaSaldoAnteriorChecked,
                               psePosIni1Value,
                               psePosFim1Value,
                               pedConteudo1Text,
                               pdblkExerciciotext     // Tipo C
                              );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fórmula - Orçado')) then Abort;

            CalculaFormula(dDataCorrente,
                           'O',
                           pcbBuscaSaldoAnteriorChecked,
                           pdblcCenarioText,
                           pdblkExercicioLookUpValue,
                           pdblcCenarioLookUpValue,
                           psePosIni1Value,
                           psePosFim1Value,
                           pedConteudo1Text,
                           pdblkExerciciotext         // Tipo M
                          );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         iNumRegistros := SelecionaContasNaoCalculadas('O');

         // Verifica se o número de contas não calculadas é igual ao da interação anterior
         // Se for, o Sistema está em loop infinito.
         if iNumRegistros = iNumRegAnterior then
         begin
            memErroNaGeracao.Text :=
            'A Geração de Dados não está conseguindo prosseguir.'  +
            'Provavelmente existem contas calculadas do tipo '          +
            'Orçado com referências cruzadas (a Conta nº ' + edtConta.Text +
            ' é uma delas - comece procurando por ela). ' + chr(13) + chr(13) +
            'Verifique o seu Plano de Contas Orçamentárias para corrijir o erro.';

            // 'Deseja verificar as contas que ainda não estão calculadas?';
            //if msgDlg(sMensagem, 'Erro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

            VerificaNaoCalculadas('O');

            bSaiLoop     := True;
            bSaiLoopDias := True;
         end
         else
         begin
            iNumRegAnterior := iNumRegistros;
         end;
      end;
   end;
end;



procedure TCtrlGeraDados.CalculaTiposRealizado(dDataCorrente                  : TDateTime;
                                               pdblcCenarioText               : String;
                                               pdblkExercicioLookupValue      : String;
                                               pdblcCenarioLookupValue        : String;
                                               pcbBuscaSaldoAnteriorChecked   : Boolean;
                                               psePosIni1Value                : Double;
                                               psePosFim1Value                : Double;
                                               pedConteudo1Text               : String;
                                               pdblkExerciciotext             : String
                                              );
var
   iNumRegistros     : longint;
   iNumRegAnterior   : longint;
begin
   bSaiLoop := False;

   // Atribui os contadores de registros depois dos tipos acima já calculados
   iNumRegAnterior := SelecionaContasNaoCalculadas('R');
   iNumRegistros   := SelecionaContasNaoCalculadas('R');

   // ----------------------------------------------------------------------------------------------

   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Genérico - Realizado')) then Abort;

      CalculaGenericos(dDataCorrente,
                       'R',
                       pdblcCenarioText,
                       pdblkExercicioLookUpValue,
                       pdblcCenarioLookUpValue,
                       psePosIni1Value,
                       psePosFim1Value,
                       pedConteudo1Text,
                       pdblkExerciciotext          // Tipo G
                      );

      if (edtStatus.Tag = -1) then Abort;

      Commit;
   except
      on E: Exception do
      begin
         RollBack;
         bConcluiuOK := False;
         MessageInfo := E.Message;
//         Raise;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Contabilidade - Realizado')) then Abort;

      CalculaContabilidade(dDataCorrente,
                           'R',
                           pcbBuscaSaldoAnteriorChecked,
                           pdblkExercicioLookupValue,
                           pdblcCenarioText,
                           pdblcCenarioLookUpValue,
                           psePosIni1Value,
                           psePosFim1Value,
                           pedConteudo1Text,
                           pdblkExerciciotext      // Tipo P
                          );

      if (edtStatus.Tag = -1) then Abort;

      Commit;
   except
      on E: Exception do
      begin
         RollBack;
         bConcluiuOK := False;
         MessageInfo := E.Message;
//         Raise;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fluxo de Caixa - Realizado')) then Abort;

      CalculaFluxo(dDataCorrente,
                   'R',
                   pdblcCenarioText,
                   pdblkExercicioLookUpValue,
                   pdblcCenarioLookUpValue,
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text,
                   pdblkExerciciotext              // Tipo X
                  );

      if (edtStatus.Tag = -1) then Abort;

      Commit;
   except
      on E: Exception do
      begin
         RollBack;
         bConcluiuOK := False;
         MessageInfo := E.Message;
//         Raise;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fixo - Realizado')) then Abort;

      CalculaValorFixoInf(dDataCorrente,
                          'R',
                          pdblcCenarioText,
                          pdblkExercicioLookUpValue,
                          pdblcCenarioLookUpValue,
                          psePosIni1Value,
                          psePosFim1Value,
                          pedConteudo1Text,
                          pdblkExerciciotext      // Tipo I
                         );

      if (edtStatus.Tag = -1) then Abort;

      Commit;
   except
      on E: Exception do
      begin
         RollBack;
         bConcluiuOK := False;
         MessageInfo := E.Message;
//         Raise;
      end;
   end;

   // ----------------------------------------------------------------------------------------------

   while not(bSaiLoop) and not(edtStatus.Tag = -1) do
   begin
      // Faz o cálculo das contas recursivamente até não existir mais nenhuma não calculada
      if iNumRegistros = 0 then
      begin
         bSaiLoop := True;
      end
      else
      begin
         // Chama separadamente as rotinas de cálculo de Contas Realizadas

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;
            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Acumulado - Realizado')) then Abort;

            CalculaAcumulado(dDataCorrente,
                             'R',
                              pcbBuscaSaldoAnteriorChecked,
                              pdblcCenarioText,
                              pdblkExercicioLookupValue,
                              pdblcCenarioLookupValue,
                              psePosIni1Value,
                              psePosFim1Value,
                              pedConteudo1Text,
                              pdblkExerciciotext         // Tipo A
                             );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Composição - Realizado')) then Abort;

            CalculaComposicao(dDataCorrente,
                              'R',
                              pdblcCenarioText,
                              pdblkExercicioLookupValue,
                              pdblcCenarioLookupValue,
                              pcbBuscaSaldoAnteriorChecked,
                              psePosIni1Value,
                              psePosFim1Value,
                              pedConteudo1Text,
                              pdblkExerciciotext         // Tipo F
                             );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Condicional - Realizado')) then Abort;

            CalculaCondicional(dDataCorrente,
                               'R',
                               pdblcCenarioText,
                               pdblkExercicioLookupValue,
                               pdblcCenarioLookupValue,
                               pcbBuscaSaldoAnteriorChecked,
                               psePosIni1Value,
                               psePosFim1Value,
                               pedConteudo1Text,
                               pdblkExerciciotext        // Tipo C
                              );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         try
            StartTransaction;

            if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Calcula Tipo Fórmula - Realizado')) then Abort;

            CalculaFormula(dDataCorrente,
                           'R',
                           pcbBuscaSaldoAnteriorChecked,
                           pdblcCenarioText,
                           pdblkExercicioLookUpValue,
                           pdblcCenarioLookUpValue,
                           psePosIni1Value,
                           psePosFim1Value,
                           pedConteudo1Text,
                           pdblkExerciciotext            // Tipo M
                          );

            if (edtStatus.Tag = -1) then Abort;

            Commit;
         except
            on E: Exception do
            begin
               RollBack;
               bConcluiuOK := False;
               MessageInfo := E.Message;
//               Raise;
            end;
         end;

         // ----------------------------------------------------------------------------------------

         iNumRegistros := SelecionaContasNaoCalculadas('R');

         // Verifica se o número de contas não calculadas é igual ao da interação anterior
         // Se for, o Sistema está em loop infinito.
         if iNumRegistros = iNumRegAnterior then
         begin
            memErroNaGeracao.Text :=
            'A Geração de Dados não está conseguindo prosseguir.' +
            'Provavelmente existem contas calculadas do tipo ' +
            'Realizado com referências cruzadas (a Conta nº ' + edtConta.Text +
            ' é uma delas - comece procurando por ela). ' + chr(13) + chr(13) +
            'Verifique o seu Plano de Contas Orçamentárias para corrijir o erro.';
            //'Deseja verificar as contas que ainda não estão calculadas?';

            // if msgDlg(sMensagem, 'Erro', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

            VerificaNaoCalculadas('R');

            bSaiLoop     := True;
            bSaiLoopDias := True;
         end
         else
         begin
            iNumRegAnterior := iNumRegistros;
         end;
      end;
   end;
end;



function TCtrlGeraDados.SelecionaContasNaoCalculadas(cCalcOR : Char): LongInt;
begin
   // Seleciona as Contas Orcamentárias do Tipo desejado, com o Calculo (O/R) desejado
   with dtmGeraDados.SQLContasAux do
   begin
      CdsContasAux.Close;
      SQL.Clear;
      SQL.Add('SELECT COUNT(FLGSINALCONTA) FROM CONTASORCAMEN ');

      if cCalcOR = 'O' then
      begin
         SQL.Add('WHERE (FLGCALCORCADO = ''N'') ');
      end
      else  // if cCalcOR = 'O'
      begin
         SQL.Add('WHERE (FLGCALCREAL = ''N'') ');
      end;  // if cCalcOR = 'O'

      SQL.Add(' AND (TIPOCALCREALIZADO <> ''T'') ');
      SQL.Add(' AND (TIPOCALCORCADO <> ''T'') ');
      SQL.Add(' AND ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL))  ');
      SQL.Add(' AND (IDPLANOORCAMEN = '+IntToStr(iPlanoOrc)+')');

      if not(Prepared) then Prepare;
      CdsContasAux.Data := GetDataPacket(SQLChanged);

      Result := CdsContasAux.Fields[0].value;
   end;
end;



procedure TCtrlGeraDados.CalculaValorFixoInf(dDataCorrente              : TDateTime;
                                             cCalcOR                    : Char;
                                             pdblcCenarioText           : String;
                                             pdblkExercicioLookUpValue  : String;
                                             pdblcCenarioLookUpValue    : String;
                                             psePosIni1Value            : Double;
                                             psePosFim1Value            : Double;
                                             pedConteudo1Text           : String;
                                             pdblkExerciciotext         : String
                                            );
var
   rValor      : Double;
   rValorAcum  : Double;
   iNumeroDias : Integer;
begin
   // Cálculo de contas de Valor Fixo Informado (tipo "I")
   edtTipo.Text := 'Valor Fixo Informado';

   SelecionaContas(cCalcOr,
                   'I',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   // Verifica se o cálculo da conta informada é diário ou por período
   if CdsContas.FieldByName('FLGINFDIAMES').asString = 'P' then
   begin
      //Pega o número de dias do período para fazer o rateio do valor
      iNumeroDias := Trunc(CdsPeriodo.FieldByName('DataFimPeriodo').AsDateTime) - Trunc(CdsPeriodo.FieldByName('DataIniPeriodo').AsDateTime) + 1;
   end
   else  // if CdsContas.FieldByName('FLGINFDIAMES').asString = 'P'
   begin
      iNumeroDias := 1;
   end;  // if CdsContas.FieldByName('FLGINFDIAMES').asString = 'P'

   // Varre a query de Contas selecionada
   while not(CdsContas.EOF) and not(edtStatus.Tag = -1) do
   begin
      edtConta.Text  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
      rValor         := 0;

      with dtmGeraDados.SQLContasAux do
      begin
         CdsContasAux.Close;

         SQL.Clear;
         SQL.Add('SELECT VLRINFORMADOREAL, VLRINFORMADOORC FROM ');
         SQL.Add('CONTASORCAMEN ');

         if cCalcOR = 'O' then
         begin
            SQL.Add('WHERE (TIPOCALCORCADO =:TIPO) AND ');
         end
         else // if cCalcOR = 'O'
         begin
            SQL.Add('WHERE (TIPOCALCREALIZADO =:TIPO) AND ');
         end; // if cCalcOR = 'O'

         SQL.Add('((FLGATIVA = ''A'') OR (FLGATIVA IS NULL)) AND ');
         SQL.Add('(IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
         SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) ');

         if not(Prepared) then Prepare;
         ParamByName('IDPLANOORCAMEN').AsInteger   := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
         ParamByName('IDCONTAORCAMEN').AsString    := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
         ParamByName('TIPO').asString              := 'I';

         CdsContasAux.Data := GetDataPacket(SQLChanged);;

         if not(CdsContasAux.IsEmpty) then
         begin
            if cCalcOR = 'O' then
            begin
               rValor := (CdsContasAux.FieldByName('VLRINFORMADOORC').asFloat / iNumeroDias);
            end
            else  // if cCalcOR = 'O'
            begin
               rValor := (CdsContasAux.FieldByName('VLRINFORMADOREAL').asFloat / iNumeroDias);
            end;  // if cCalcOR = 'O'
         end;  // if not(CdsContasAux.IsEmpty)
      end;  // with dtmGeraDados.SQLContasAux

      // Grava os dados na tabela de Saldos Orcamentarios
      if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
      begin
         rValor := 0;
      end
      else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
      begin
         if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
      end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

      rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                        cCalcOR,
                                        rValor,
                                        pdblcCenarioText,
                                        pdblkExercicioLookUpValue,
                                        pdblcCenarioLookUpValue
                                       );

      GravaSaldos(rValor,
                  rValorAcum,
                  dDataCorrente,
                  cCalcOR,
                  pdblcCenarioText,
                  pdblkExercicioLookUpValue,
                  pdblcCenarioLookUpValue,
                  pdblkExerciciotext
                 );

      CdsContas.Next;
   end;
end;



procedure TCtrlGeraDados.CalculaComposicao(dDataCorrente                : TDateTime;
                                           cCalcOR                      : Char;
                                           pdblcCenarioText             : String;
                                           pdblkExercicioLookupValue    : String;
                                           pdblcCenarioLookupValue      : String;
                                           pcbBuscaSaldoAnteriorChecked : Boolean;
                                           psePosIni1Value              : Double;
                                           psePosFim1Value              : Double;
                                           pedConteudo1Text             : String;
                                           pdblkExerciciotext           : String
                                          );
var
   rValorAnt   : Double;
   rValor      : Double;
   rValorAcum  : Double;
   sFieldConta : String;
   sFieldSaldo : String;
   sFieldPerc  : String;
   sFieldCalc  : String;
begin
   // Cálculo de contas de Composição (tipo "F")
   edtTipo.Text := 'Composição';

   // Monta o Nome dos Fields da flag de cálculo
   if cCalcOR = 'O' then
   begin
      sFieldCalc  := 'FLGCALCORCADO';
      sFieldConta := 'IDCONTAREFORCADO';
      sFieldSaldo := 'VLRORCADO';
      sFieldPerc  := 'PERCCONTAREFORC';
   end
   else  // if cCalcOR = 'O'
   begin
      sFieldCalc  := 'FLGCALCREAL';
      sFieldConta := 'IDCONTAREFREAL';
      sFieldSaldo := 'VLRREALIZADO';
      sFieldPerc  := 'PERCCONTAREFREA';
   end;  // if cCalcOR = 'O'

   SelecionaContas(cCalcOr,
                   'F',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   with CdsContas do
   begin
      //Varre a query de Contas
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         edtConta.Text := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;

         SelecionaComposicao(CdsContas.FieldByName('IDCONTAORCAMEN').AsString, CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger, cCalcOR, 'F');

         bTestaCalculada   := True;
         rValor            := 0;
         rValorAnt         := 0;

         with CdsComposicao do
         begin
            // Varre a query de Composicao
            while not(EOF) and not(edtStatus.Tag = -1) do
            begin
               // Verifica se a conta de composição é vazia
               // (p.ex.: pode ser uma conta de composição realizada no calculo da orçada)
               if not(CdsComposicao.FieldByName(sFieldConta).isNull) then
               begin
                  //Faz a query de busca do Valor do Saldo para cada conta de referencia
                  if TestaCalculada(CdsComposicao.FieldByName(sFieldConta).asString, cCalcOR) then begin
                     //
                     with dtmGeraDados.SQLVerificaSinal do begin
                       CdsVerificaSinal.Close;
                       if not(Prepared) then Prepare;
                       ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
                       ParamByName('IDCONTAORCAMEN').AsString := CdsComposicao.FieldByName(sFieldConta).asString;
                       CdsVerificaSinal.Data:= GetDataPacket(SQLChanged);;
                     end;
                     with dtmGeraDados.SQLCompContas do begin
                        CdsCompContas.Close;
                        SQL.Clear;
                        if trim(pdblcCenarioText) <> '' then
                           SQL.Add('SELECT SUM(VLRORCCENARIO) AS '+sFieldSaldo+' FROM VALORESCENARIO ')
                        else
                           SQL.Add('SELECT SUM(' + sFieldSaldo + ') AS '+sFieldSaldo+' FROM SALDOORCADO ');
                        SQL.Add('WHERE ');
                        SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
                        SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
                        SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
                        if trim(pdblcCenarioText) <> '' then begin
                           SQL.Add('(EXERCICIO  =:EXERCICIO) AND ');
                           SQL.Add('(PERIODO  =:PERIODO) AND ');
                           SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN)  ');
                        end else begin
                           if sGeraMes = 'S' then
                              SQL.Add('(TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATAREFERENCIA) ')
                           else
                              SQL.Add('(DATAREFERENCIA =:DATAREFERENCIA) ');
                        end;
                        if not(Prepared) then Prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName(sFieldConta).asString;
                        ParamByName('IDPESSOA').AsInteger   := idEmpresa;
                        DecodeDate(dDataCorrente,iAno,iMes,iDia);
                        if trim(pdblcCenarioText) <> '' then begin
                          ParamByName('EXERCICIO').AsInteger        := StrToInt(pdblkExercicioLookupValue);
                          ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                          ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);
                        end else begin
                          if sGeraMes = 'S' then
                            ParamByName('DATAREFERENCIA').AsString   :=  FormatFloat('0000', iAno) + FormatFloat('00', iMes )
                                                                           //Biblioteca.ZD(trim(IntToStr(iAno)),4) + Biblioteca.ZD(trim(IntToStr(iMes)),2)
                          else
                            ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                        end;
                        CdsCompContas.Data := GetDataPacket(SQLChanged);;
                        CdsCompContas.First;

                        //Incrementa o acumulador de valores das contas da Composição
                        //multiplicando pelo percentual da conta
                        if not(CdsCompContas.IsEmpty) then
                        begin
                           if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then begin
                              rValor := rValor + 0;
                           end else begin
                              if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'P' then
                                 rValor := rValor + (CdsCompContas.FieldByName(sFieldSaldo).asFloat *
                                       (CdsComposicao.FieldByName(sFieldPerc).asFloat / 100))
                              else
                                 rValor := rValor + ((CdsCompContas.FieldByName(sFieldSaldo).asFloat * (-1)) *
                                       (CdsComposicao.FieldByName(sFieldPerc).asFloat / 100));
                           end;
                        end;
                     end;

                     if pcbBuscaSaldoAnteriorChecked then begin
                        with dtmGeraDados.SQLCompContas do begin
                           CdsCompContas.Close;
                           SQL.Clear;

                           if trim(pdblcCenarioText) <> '' then
                              SQL.Add('SELECT SUM(VLRORCCENARIO) AS '+sFieldSaldo+' FROM VALORESCENARIO ')
                           else
                              SQL.Add('SELECT SUM(' + sFieldSaldo + ') AS '+sFieldSaldo+' FROM SALDOORCADOANT ');
                           SQL.Add('WHERE ');
                           if trim(pdblcCenarioText) <> '' then begin
                              SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN) AND ');
                              SQL.Add('(PERIODO IS NULL) AND ');
                           end;
                           SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
                           SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
                           SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
                           SQL.Add('(EXERCICIO =:EXERCICIO) ');
                           if not(Prepared) then Prepare;
                           if trim(pdblcCenarioText) <> '' then
                              ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);
                           ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
                           ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName(sFieldConta).asString;
                           ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                           ParamByName('EXERCICIO').AsInteger      := StrToInt(pdblkExercicioLookupValue);
                           CdsCompContas.Data := GetDataPacket(SQLChanged);;
                           CdsCompContas.First;

                           //Incrementa o acumulador de valores das contas da Composição
                           //multiplicando pelo percentual da conta
                           if not(IsEmpty) then begin
                              if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then begin
                                 rValorAnt := rValorAnt + 0;
                              end else begin
                                 if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'P' then
                                    rValorAnt := rValorAnt + (CdsCompContas.FieldByName(sFieldSaldo).asFloat *
                                          (CdsComposicao.FieldByName(sFieldPerc).asFloat / 100))
                                 else
                                    rValorAnt := rValorAnt + ((CdsCompContas.FieldByName(sFieldSaldo).asFloat * (-1)) *
                                          (CdsComposicao.FieldByName(sFieldPerc).asFloat / 100));
                              end;
                           end;
                        end;
                     end;
                  end else begin
                     bTestaCalculada := False;
                     Break;
                  end;
               end;
               Next;
            end
         end;

         if bTestaCalculada then begin
            //Grava os dados na tabela de Saldos Orcamentarios
            if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then begin
               rValor := 0;
            end else begin
               if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then
                  rValor := rValor * (-1);
            end;
            rValorAcum := CalculaVlrAcumulado(dDataCorrente,cCalcOR,rValor,
                                               pdblcCenarioText,
                                               pdblkExercicioLookUpValue,
                                               pdblcCenarioLookUpValue);
            GravaSaldos(rValor,rValorAcum, dDataCorrente, cCalcOR,
                         pdblcCenarioText,
                         pdblkExercicioLookUpValue,
                         pdblcCenarioLookUpValue,
                         pdblkExerciciotext     );

            if pcbBuscaSaldoAnteriorChecked then begin
               if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then begin
                  rValorAnt := 0;
               end else begin
                  if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then
                     rValorAnt := rValorAnt * (-1);
               end;
               GravaSaldosAnt(rValorAnt,cCalcOR,
                               pdblcCenarioText,
                               pdblkExercicioLookUpValue,
                               pdblcCenarioLookUpValue,
                               pdblkExerciciotext     );
            end;
         end;

         CdsContas.Next;
      end;  // while not(EOF) and not(edtStatus.Tag = -1)
   end;  // with CdsContas
end;



procedure TCtrlGeraDados.CalculaAcumulado(dDataCorrente                 : TDateTime;
                                          cCalcOR                       : Char;
                                          pcbBuscaSaldoAnteriorChecked  : Boolean;
                                          pdblcCenarioText              : String;
                                          pdblkExercicioLookupValue     : String;
                                          pdblcCenarioLookupValue       : String;
                                          psePosIni1Value               : Double;
                                          psePosFim1Value               : Double;
                                          pedConteudo1Text              : String;
                                          pdblkExerciciotext            : String
                                         );
var
   rValor      : Double;
   rValorAcum  : Double;
   rValAcumAnt : Double;
   sCalculo    : String;
   sFormula    : String;
   sMesAnt     : String;
   SQLAcum2    : TCMSQLParams;
   dDataAnt    : TDateTime;
begin
   // Cálculo de contas de Acumulado (tipo "A")
   edtTipo.Text := 'Acumulado';

   SelecionaContas(cCalcOr,
                   'A',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   with CdsContas do
   begin
      // Varre a query de Contas selecionada
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         edtConta.Text := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;

         // ----------------------------------------------------------------------------------------

         if pcbBuscaSaldoAnteriorChecked then
         begin
            if cCalcOR = 'O' then
            begin
               sFormula := CdsContas.FieldByName('FORMULAORCADO').AsString;
            end
            else  // if cCalcOR = 'O'
            begin
               sFormula := CdsContas.FieldByName('FORMULAREALIZADO').AsString;
            end;  // if cCalcOR = 'O'

            sCalculo := TransformaContas(sFormula,
                                         dDataCorrente,
                                         cCalcOR,
                                         'N',
                                         True,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue
                                        );

            if sCalculo <> '' then
            begin
               try
                  dtmGeraDados.Parser.Expression := sCalculo;
                  // Pega o Valor retornado pelo parser
                  rValor := dtmGeraDados.Parser.value;
               except
                  rValor := 0;
               end;

               // Grava os dados na tabela de Saldos Orcamentarios
               if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
               begin
                  rValor := 0;
               end
               else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
               begin
                  if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
               end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

               GravaSaldosAnt(rValor,
                              cCalcOR,
                              pdblcCenarioText,
                              pdblkExercicioLookUpValue,
                              pdblcCenarioLookUpValue,
                              pdblkExerciciotext
                             );

            end;  // if sCalculo <> ''
         end;  // if pcbBuscaSaldoAnteriorChecked

         // ----------------------------------------------------------------------------------------

         if trim(pdblcCenarioText) <> '' then
         begin
            SQLAcum2 := dtmGeraDados.SQLAcumulado2MC;
         end
         else  // if trim(pdblcCenarioText) <> ''
         begin
            if sGeraMes = 'S' then
            begin
               SQLAcum2 := dtmGeraDados.SQLAcumulado2M;
            end
            else  // if sGeraMes = 'S'
            begin
               SQLAcum2 := dtmGeraDados.SQLAcumulado2;
            end;  // if sGeraMes = 'S'
         end;  // if trim(pdblcCenarioText) <> ''

         DecodeDate(dDataCorrente,iAno,iMes,iDia);

         if (iMes = 1) then
         begin
            if trim(pdblcCenarioText) <> '' then
            begin
               with dtmGeraDados.SQLAcumulado2CAnt do
               begin
                  CdsAcumulado2CAnt.Close;

                  if not(Prepared) then Prepare;
                  ParamByName('IDPESSOA').asInteger         := idEmpresa;
                  ParamByName('EXERCICIO').asInteger        := StrToInt(pdblkExercicioLookupValue);
                  ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt(pdblcCenarioLookupValue);
                  ParamByName('IDPLANOORCAMEN').asInteger   := iPlanoOrc;
                  ParamByName('IDCONTAORCAMEN').asString    := CdsContas.FieldByName('IDCONTAORCAMEN').asString;

                  CdsAcumulado2CAnt.Data := GetDataPacket(SQLChanged);
               end;  // with dtmGeraDados.SQLAcumulado2CAnt

               if not(CdsAcumulado2CAnt.IsEmpty) then
               begin
                  rValAcumAnt := CdsAcumulado2CAnt.FieldByName('ORC').asFloat;
               end
               else  // if not(CdsAcumulado2CAnt.IsEmpty)
               begin
                  rValAcumAnt := 0;
               end;  // if not(CdsAcumulado2CAnt.IsEmpty)
            end
            else  // if trim(pdblcCenarioText) <> ''
            begin
               with dtmGeraDados.SQLAcumulado2Ant do
               begin
                  cdsAcumulado2Ant.Close;

                  if not(Prepared) then Prepare;
                  ParamByName('IDPESSOA').asInteger        := idEmpresa;
                  ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExercicioLookupValue);
                  ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
                  ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;

                  cdsAcumulado2Ant.Data := GetDataPacket(SQLChanged);
               end;  // with dtmGeraDados.SQLAcumulado2Ant

               if cCalcOR = 'O' then
               begin
                  if not(CdsAcumulado2Ant.IsEmpty) then
                  begin
                     rValAcumAnt := CdsAcumulado2Ant.FieldByName('ORC').asFloat;
                  end
                  else  // if not(CdsAcumulado2Ant.IsEmpty)
                  begin
                     rValAcumAnt := 0;
                  end;  // if not(CdsAcumulado2Ant.IsEmpty)
               end
               else  // if cCalcOR = 'O'
               begin
                  if not(CdsAcumulado2Ant.IsEmpty) then
                  begin
                     rValAcumAnt := CdsAcumulado2Ant.FieldByName('Double').asFloat;
                  end
                  else  // if not(CdsAcumulado2Ant.IsEmpty)
                  begin
                     rValAcumAnt := 0;
                  end;  // if not(CdsAcumulado2Ant.IsEmpty)
               end;  // if cCalcOR = 'O'
            end;
         end
         else  // if (iMes = 1)
         begin
            with SQLAcum2 do
            begin
               CdsAcum2.Close;

               if not(Prepared) then Prepare;
               ParamByName('IDPESSOA').asInteger        := idEmpresa;
               ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;

               if trim(pdblcCenarioText) <> '' then
               begin
                  ParamByName('PERIODO').asInteger          := iPeriodoAtu;
                  ParamByName('EXERCICIO').asInteger        := StrToInt(pdblkExercicioLookupValue);
                  ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt(pdblcCenarioLookupValue);
               end
               else
               begin
                  DecodeDate(dDataCorrente,iAno,iMes,iDia);

                  if sGeraMes = 'S' then
                  begin
                     dDataAnt := EncodeDate(iAno, iMes, 1) - 15;

                     DecodeDate(dDataAnt,iAno,iMes,iDia);
                     sMesAnt  := FormatFloat('0000', iAno) + FormatFloat('00', iMes );
                                 //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2);
                     ParamByName('DATAREFERENCIA').asString   := sMesAnt;
                  end
                  else  // if sGeraMes = 'S'
                  begin
                     ParamByName('DATAREFERENCIA').asDateTime := dDataCorrente - 1;
                  end;  // if sGeraMes = 'S'
               end;

               CdsAcum2.Data := GetDataPacket(SQLChanged);;

               if cCalcOR = 'O' then
               begin
                  if not(CdsAcum2.IsEmpty) then
                  begin
                     rValAcumAnt := CdsAcum2.FieldByName('ORC').asFloat;
                  end
                  else  // if not(CdsAcum2.IsEmpty)
                  begin
                     rValAcumAnt := 0;
                  end;  // if not(CdsAcum2.IsEmpty)
               end
               else  // if cCalcOR = 'O'
               begin
                  if not(CdsAcum2.IsEmpty) then
                  begin
                     rValAcumAnt := CdsAcum2.FieldByName('Double').asFloat;
                  end
                  else  // if not(CdsAcum2.IsEmpty)
                  begin
                     rValAcumAnt := 0;
                  end;  // if not(CdsAcum2.IsEmpty)
               end;  // if cCalcOR = 'O'
            end;  // with SQLAcum2
         end;  // if (iMes = 1)

         // Transforma as contas em valores e passa para o parser fazer a fórmula
         if cCalcOR = 'O' then
         begin
            sFormula := CdsContas.FieldByName('FORMULAORCADO').AsString;
         end
         else  // if cCalcOR = 'O'
         begin
            sFormula := CdsContas.FieldByName('FORMULAREALIZADO').AsString;
         end;  // if cCalcOR = 'O'

         sCalculo := TransformaContas(sFormula,
                                      dDataCorrente,
                                      cCalcOR,
                                      'N',
                                      False,
                                      pdblcCenarioText,
                                      pdblkExercicioLookupValue,
                                      pdblcCenarioLookupValue
                                     );

         if sCalculo <> '' then
         begin
            try
               dtmGeraDados.Parser.Expression := sCalculo;
               // Pega o Valor retornado pelo parser
               rValor := rValAcumAnt + dtmGeraDados.Parser.value;
            except
               rValor := 0;
            end;

            // Grava os dados na tabela de Saldos Orcamentarios
            if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
            begin
               rValor := 0;
            end
            else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
            begin
               if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
            end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

            rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                              cCalcOR,
                                              rValor,
                                              pdblcCenarioText,
                                              pdblkExercicioLookUpValue,
                                              pdblcCenarioLookUpValue
                                             );

            GravaSaldos(rValor,
                        rValorAcum,
                        dDataCorrente,
                        cCalcOR,
                        pdblcCenarioText,
                        pdblkExercicioLookUpValue,
                        pdblcCenarioLookUpValue,
                        pdblkExerciciotext
                       );

         end;  // if sCalculo <> ''

         CdsContas.Next;
      end;  // while not(EOF) and not(edtStatus.Tag = -1)
   end;  // with CdsContas
end;



procedure TCtrlGeraDados.CalculaCondicional(dDataCorrente                  : TDateTime;
                                            cCalcOR                        : Char;
                                            pdblcCenarioText               : String;
                                            pdblkExercicioLookupValue      : String;
                                            pdblcCenarioLookupValue        : String;
                                            pcbBuscaSaldoAnteriorChecked   : Boolean;
                                            psePosIni1Value                : Double;
                                            psePosFim1Value                : Double;
                                            pedConteudo1Text               : String;
                                            pdblkExerciciotext             : String
                                           );
var
   rValor         : Double;
   rValorAcum     : Double;
   rValorIni      : Double;
   rValorRes      : Double;
   rValorFim      : Double;
   sCondicao      : String;
   sTipoIni       : String;
   sTipoRes       : String;
   bCondicional   : Boolean;
   bTestaCondIni  : Boolean;
   bTestaCondFim  : Boolean;
   bTestaCondRes  : Boolean;
begin
   // Cálculo de contas de Condicional (tipo "C")
   edtTipo.Text := 'Condicional';

   SelecionaContas(cCalcOr,
                   'C',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   with CdsContas do
   begin
      // Varre a query de Contas
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         bCondicional      := False;
         bTestaCondIni     := False;
         bTestaCondFim     := False;
         bTestaCondRes     := False;

         rValorIni         := 0;
         rValorRes         := 0;
         rValorFim         := 0;
         edtConta.Text     := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;

         SelecionaComposicao(CdsContas.FieldByName('IDCONTAORCAMEN').AsString,
                             CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger,
                             cCalcOR,
                             'C'
                            );

         bTestaCalculada   := True;
         rValor            := 0;

         with dtmGeraDados.SQLComposicao, CdsComposicao do
         begin
            CdsCompContas.Close;

            dtmGeraDados.SQLCompContas.SQL.Clear;

            if trim(pdblcCenarioText) <> '' then
            begin
               dtmGeraDados.SQLCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
               dtmGeraDados.SQLCompContas.SQL.Add('       0 AS VLRREALIZADO FROM VALORESCENARIO ');
            end
            else  // if trim(pdblcCenarioText) <> ''
            begin
               dtmGeraDados.SQLCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
               dtmGeraDados.SQLCompContas.SQL.Add('       SUM(VLRREALIZADO) AS VLRREALIZADO FROM SALDOORCADO ');
            end;  // if trim(pdblcCenarioText) <> ''

            dtmGeraDados.SQLCompContas.SQL.Add('WHERE ');
            dtmGeraDados.SQLCompContas.SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
            dtmGeraDados.SQLCompContas.SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');
            dtmGeraDados.SQLCompContas.SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');

            if trim(pdblcCenarioText) <> '' then
            begin
               dtmGeraDados.SQLCompContas.SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN) AND ');
               dtmGeraDados.SQLCompContas.SQL.Add('(EXERCICIO  =:EXERCICIO) AND ');
               dtmGeraDados.SQLCompContas.SQL.Add('(PERIODO  =:PERIODO)  ');
            end
            else
            begin
               if sGeraMes = 'S' then
               begin
                  dtmGeraDados.SQLCompContas.SQL.Add('(TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATAREFERENCIA)  ')
               end
               else  // if sGeraMes = 'S'
               begin
                  dtmGeraDados.SQLCompContas.SQL.Add('(DATAREFERENCIA  =:DATAREFERENCIA) ');
               end;  // if sGeraMes = 'S'
            end;

            // Varre a query de Composicao
            First;

            while not(EOF) and not(edtStatus.Tag = -1) do
            begin
               sCondicao   := FieldByName('CONDICAO').asString;
               sTipoIni    := FieldByName('TIPOCONDINI').asString;
               sTipoRes    := FieldByName('TIPOCONDRES').asString;

               // ----------------------------------------------------------------------------------
               if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDINI').asString, cCalcOR) then
               begin
                  bTestaCondIni := True;

                  CdsCompContas.Close;

                  if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;
                  dtmGeraDados.SQLCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').AsInteger;
                  dtmGeraDados.SQLCompContas.ParamByName('IDCONTAORCAMEN').asString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;
                  dtmGeraDados.SQLCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;

                  if trim(pdblcCenarioText) <> '' then
                  begin
                     dtmGeraDados.SQLCompContas.ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                     dtmGeraDados.SQLCompContas.ParamByName('EXERCICIO').AsInteger        := StrToInt(pdblkExercicioLookupValue);
                     dtmGeraDados.SQLCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);
                  end
                  else  // if trim(pdblcCenarioText) <> ''
                  begin
                     DecodeDate(dDataCorrente,iAno,iMes,iDia);

                     if sGeraMes = 'S' then
                     begin
                        dtmGeraDados.SQLCompContas.ParamByName('DATAREFERENCIA').AsString := FormatFloat('0000', iAno) + FormatFloat('00', iMes);
                     end                                                                                           //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                     else  // if sGeraMes = 'S'
                     begin
                        dtmGeraDados.SQLCompContas.ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                     end;  // if sGeraMes = 'S'
                  end;  // if trim(pdblcCenarioText) <> ''

                  if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;

                  CdsCompContas.Data := GetDataPacket(dtmGeraDados.SQLCompContas.SQLChanged);

                  with dtmGeraDados.SQLVerificaSinal do
                  begin
                     CdsVerificaSinal.Close;

                     if not(Prepared) then Prepare;
                     ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').asInteger;
                     ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;

                     CdsVerificaSinal.Data := GetDataPacket(SQLChanged);;
                  end;  // with dtmGeraDados.SQLVerificaSinal

                  if CdsVerificaSinal.FieldByname('FLGATIVA').AsString = 'I' then
                  begin
                     rValorIni := 0;
                  end
                  else
                  begin
                     if cCalcOR = 'R' then
                     begin
                        rValorIni := CdsCompContas.FieldByName('VLRREALIZADO').asFloat;
                     end
                     else  // if cCalcOR = 'R'
                     begin
                        rValorIni := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                     end;  // if cCalcOR = 'R'

                     if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'N' then rValorIni := rValorIni * (-1);
                  end;  // if CdsVerificaSinal.FieldByname('FLGATIVA').AsString = 'I'
               end;  // if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDINI').asString, cCalcOR)
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               if sTipoIni = 'C' then
               begin
                  if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDFIM').asString, cCalcOR) then
                  begin
                     bTestaCondFim := True;

                     CdsCompContas.Close;

                     if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;
                     dtmGeraDados.SQLCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').AsInteger;
                     dtmGeraDados.SQLCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').AsString;
                     dtmGeraDados.SQLCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;

                     if trim(pdblcCenarioText) <> '' then
                     begin
                        dtmGeraDados.SQLCompContas.ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                        dtmGeraDados.SQLCompContas.ParamByName('EXERCICIO').AsInteger        := StrToInt(pdblkExercicioLookupValue);
                        dtmGeraDados.SQLCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);
                     end
                     else  // if trim(pdblcCenarioText) <> ''
                     begin
                        DecodeDate(dDataCorrente, iAno, iMes, iDia);

                        if sGeraMes = 'S' then
                        begin
                           dtmGeraDados.SQLCompContas.ParamByName('DATAREFERENCIA').AsString := FormatFloat('0000', iAno) + FormatFloat('00', iMes )
                                                                               //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                        end
                        else  // if sGeraMes = 'S'
                        begin
                           dtmGeraDados.SQLCompContas.ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                        end;  // if sGeraMes = 'S'
                     end;  // if trim(pdblcCenarioText) <> ''

                     if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;

                     CdsCompContas.Data := GetDataPacket(dtmGeraDados.SQLCompContas.SQLChanged);

                     with dtmGeraDados.SQLVerificaSinal do
                     begin
                        CdsVerificaSinal.Close;

                        if not(Prepared) then Prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').asInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').asString;

                        CdsVerificaSinal.DAta := GetDataPacket(SQLChanged);
                     end;  // with dtmGeraDados.SQLVerificaSinal

                     if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then
                     begin
                        rValorFim := 0;
                     end
                     else  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                     begin
                        if cCalcOR = 'R' then
                        begin
                           rValorFim := CdsCompContas.FieldByName('VLRREALIZADO').asFloat;
                        end
                        else  // if cCalcOR = 'R'
                        begin
                           rValorFim := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                        end;  // if cCalcOR = 'R'

                        if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'N' then rValorFim := rValorFim * (-1);
                     end;  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                  end;
               end
               else  // if sTipoIni = 'C'
               begin
                  rValorFim := CdsComposicao.FieldByName('VLRCONDINI').asFloat;
                  bTestaCondFim := True;
               end;  // if sTipoIni = 'C'
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               if sTipoRes = 'C' then
               begin
                  if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDRES').asString, cCalcOR) then
                  begin
                     bTestaCondRes := True;

                     CdsCompContas.Close;

                     if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;
                     dtmGeraDados.SQLCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').AsInteger;
                     dtmGeraDados.SQLCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').asString;
                     dtmGeraDados.SQLCompContas.ParamByName('IDPESSOA').AsInteger                    := idEmpresa;

                     if trim(pdblcCenarioText) <> '' then
                     begin
                        dtmGeraDados.SQLCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);
                        dtmGeraDados.SQLCompContas.ParamByName('PERIODO').AsInteger          := iPeriodoAtu;
                        dtmGeraDados.SQLCompContas.ParamByName('EXERCICIO').AsInteger        := StrToInt(pdblkExercicioLookupValue);
                     end
                     else
                     begin
                        DecodeDate(dDataCorrente,iAno,iMes,iDia);

                        if sGeraMes = 'S' then
                        begin
                           dtmGeraDados.SQLCompContas.ParamByName('DATAREFERENCIA').AsString := FormatFloat('0000', iAno) + FormatFloat('00', iMes );
                                                                                                //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                        end
                        else  // if sGeraMes = 'S'
                        begin
                           dtmGeraDados.SQLCompContas.ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
                        end;  // if sGeraMes = 'S'
                     end;

                     if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;

                     CdsCompContas.Data := GetDataPacket(dtmGeraDados.SQLCompContas.SQLChanged);

                     with dtmGeraDados.SQLVerificaSinal do
                     begin
                        CdsVerificaSinal.Close;

                        if not(Prepared) then Prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').asInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').asString;

                        CdsVerificaSinal.Data := GetDataPacket(SQLChanged);
                     end;  // with dtmGeraDados.SQLVerificaSinal

                     if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then
                     begin
                        rValorRes := 0;
                     end
                     else
                     begin
                        if cCalcOR = 'R' then
                        begin
                           rValorRes := CdsCompContas.FieldByName('VLRREALIZADO').asFloat;
                        end
                        else  // if cCalcOR = 'R'
                        begin
                           rValorRes := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                        end;  // if cCalcOR = 'R'

                        if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'N' then rValorRes := rValorRes * (-1);
                     end;  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                  end;  // if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDRES').asString, cCalcOR)
               end
               else  // if sTipoRes = 'C'
               begin
                  rValorRes := CdsComposicao.FieldByName('VLRCONDRES').asFloat;
                  bTestaCondRes := True;
               end;  // if sTipoRes = 'C'
               // ----------------------------------------------------------------------------------


               // ----------------------------------------------------------------------------------
               if (bTestaCondIni) and (bTestaCondFim) and (bTestaCondRes) then
               begin
                  if sCondicao = '<=' then
                  begin
                     if rValorIni <= rValorFim then
                     begin
                        rValor         := rValorRes;
                        bCondicional   := True;
                     end;  // if rValorIni <= rValorFim
                  end;  // if sCondicao = '<='

                  if sCondicao = '<' then
                  begin
                     if rValorIni < rValorFim then
                     begin
                        rValor         := rValorRes;
                        bCondicional   := True;
                     end;  // if rValorIni < rValorFim
                  end;  // if sCondicao = '<'

                  if sCondicao = '=' then
                  begin
                     if rValorIni = rValorFim then
                     begin
                        rValor         := rValorRes;
                        bCondicional   := True;
                     end;  // if rValorIni = rValorFim
                  end;  // if sCondicao = '='

                  if sCondicao = '>' then
                  begin
                     if rValorIni > rValorFim then
                     begin
                        rValor         := rValorRes;
                        bCondicional   := True;
                     end;  // if rValorIni > rValorFim
                  end;  // if sCondicao = '>'

                  if sCondicao = '>=' then
                  begin
                     if rValorIni >= rValorFim then
                     begin
                        rValor := rValorRes;
                        bCondicional := True;
                     end;  // if rValorIni >= rValorFim
                  end;  // if sCondicao = '>='

                  if sCondicao = '<>' then
                  begin
                     if rValorIni <> rValorFim then
                     begin
                        rValor         := rValorRes;
                        bCondicional   := True;
                     end;  // if rValorIni <> rValorFim
                  end;  // if sCondicao = '<>'

                  if bCondicional then Break;
               end;  // if (bTestaCondIni) and (bTestaCondFim) and (bTestaCondRes)

               Next;
            end
         end;
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         if bCondicional then
         begin
            // Grava os dados na tabela de Saldos Orcamentarios
            if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
            begin
               rValor := 0;
            end
            else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
            begin
               if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
            end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

            rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                              cCalcOR,
                                              rValor,
                                              pdblcCenarioText,
                                              pdblkExercicioLookUpValue,
                                              pdblcCenarioLookUpValue
                                             );

            GravaSaldos(rValor,
                        rValorAcum,
                        dDataCorrente,
                        cCalcOR,
                        pdblcCenarioText,
                        pdblkExercicioLookUpValue,
                        pdblcCenarioLookUpValue,
                        pdblkExerciciotext
                       );
         end;
         // ----------------------------------------------------------------------------------------


         // ----------------------------------------------------------------------------------------
         if pcbBuscaSaldoAnteriorChecked then
         begin
            bCondicional      := False;
            bTestaCondIni     := False;
            bTestaCondFim     := False;
            bTestaCondRes     := False;

            rValorIni         := 0;
            rValorRes         := 0;
            rValorFim         := 0;
            bTestaCalculada   := True;
            rValor            := 0;

            with CdsComposicao do
            begin
               CdsCompContas.Close;
               dtmGeraDados.SQLCompContas.SQL.Clear;

               if trim(pdblcCenarioText) <> '' then
               begin
                  dtmGeraDados.SQLCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
                  dtmGeraDados.SQLCompContas.SQL.Add('       0 AS VLRREALIZADO FROM VALORESCENARIO ');
               end
               else
               begin
                  dtmGeraDados.SQLCompContas.SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO,  ');
                  dtmGeraDados.SQLCompContas.SQL.Add('       SUM(VLRREALIZADO) AS VLRREALIZADO FROM SALDOORCADOANT ');
               end;

               dtmGeraDados.SQLCompContas.SQL.Add('WHERE ');
               dtmGeraDados.SQLCompContas.SQL.Add('(IDPLANOORCAMEN  =:IDPLANOORCAMEN) AND ');
               dtmGeraDados.SQLCompContas.SQL.Add('(IDCONTAORCAMEN  =:IDCONTAORCAMEN) AND ');

               if trim(pdblcCenarioText) <> '' then
               begin
                  dtmGeraDados.SQLCompContas.SQL.Add('(IDCENARIOORCAMEN  =:IDCENARIOORCAMEN) AND ');
                  dtmGeraDados.SQLCompContas.SQL.Add('(PERIODO IS NULL) AND ');
               end;

               dtmGeraDados.SQLCompContas.SQL.Add('(IDPESSOA  =:IDPESSOA) AND ');
               dtmGeraDados.SQLCompContas.SQL.Add('(EXERCICIO =:EXERCICIO)    ');


               // Varre a query de Composicao
               First;
               while not(EOF) and not(edtStatus.Tag = -1) do
               begin
                  sCondicao := FieldByName('CONDICAO').asString;
                  sTipoIni  := FieldByName('TIPOCONDINI').asString;
                  sTipoRes  := FieldByName('TIPOCONDRES').asString;

                  // -------------------------------------------------------------------------------
                  if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDINI').asString, cCalcOR) then
                  begin
                     bTestaCondIni := True;

                     CdsCompContas.Close;

                     if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;
                     dtmGeraDados.SQLCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').AsInteger;
                     dtmGeraDados.SQLCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;
                     dtmGeraDados.SQLCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                     dtmGeraDados.SQLCompContas.ParamByName('EXERCICIO').AsInteger      := StrToInt(pdblkExercicioLookupValue);

                     if trim(pdblcCenarioText) <> '' then dtmGeraDados.SQLCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);

                     CdsCompContas.Data := GetDataPacket(dtmGeraDados.SQLCompContas.SQLChanged);

                     with dtmGeraDados.SQLVerificaSinal do
                     begin
                        CdsVerificaSinal.Close;

                        if not(Prepared) then Prepare;
                        ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').asInteger;
                        ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDINI').asString;

                        CdsVerificaSinal.Data := GetDataPacket(SQLChanged);
                     end;  //with dtmGeraDados.SQLVerificaSinal

                     if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then
                     begin
                        rValorIni := 0;
                     end
                     else  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                     begin
                        if cCalcOR = 'R' then
                        begin
                           rValorIni := CdsCompContas.FieldByName('VLRREALIZADO').asFloat;
                        end
                        else  // if cCalcOR = 'R'
                        begin
                           rValorIni := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                        end;  // if cCalcOR = 'R'

                        if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'N' then rValorIni := rValorIni * (-1);
                     end;  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                  end;  // if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDINI').asString, cCalcOR)
                  // -------------------------------------------------------------------------------


                  // -------------------------------------------------------------------------------
                  if sTipoIni = 'C' then begin
                     if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDFIM').asString, cCalcOR) then begin
                        bTestaCondFim := True;
                        CdsCompContas.Close;
                        if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;
                        dtmGeraDados.SQLCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').AsInteger;
                        dtmGeraDados.SQLCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').AsString;
                        dtmGeraDados.SQLCompContas.ParamByName('IDPESSOA').AsInteger   := idEmpresa;
                        dtmGeraDados.SQLCompContas.ParamByName('EXERCICIO').AsInteger  := StrToInt(pdblkExercicioLookupValue);
                        if trim(pdblcCenarioText) <> '' then
                           dtmGeraDados.SQLCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);
                        CdsCompContas.Data := GetDataPacket(dtmGeraDados.SQLCompContas.SQLChanged);

                        with dtmGeraDados.SQLVerificaSinal do begin
                           CdsVerificaSinal.Close;
                           if not(Prepared) then Prepare;
                           ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').asInteger;
                           ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDFIM').asString;
                           CdsVerificaSinal.Data := GetDataPacket(SQLChanged);
                        end;
                        if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then begin
                           rValorFim := 0;
                        end else begin
                           if cCalcOR = 'R' then
                              rValorFim := CdsCompContas.FieldByName('VLRREALIZADO').asFloat
                           else
                              rValorFim := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                           if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'N' then
                              rValorFim := rValorFim * (-1);
                        end;
                     end;
                  end else begin
                     rValorFim := CdsComposicao.FieldByName('VLRCONDINI').asFloat;
                     bTestaCondFim := True;
                  end;
                  // -------------------------------------------------------------------------------


                  // -------------------------------------------------------------------------------
                  if sTipoRes = 'C' then
                  begin
                     if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDRES').asString, cCalcOR) then
                     begin
                        bTestaCondRes := True;

                        CdsCompContas.Close;

                        if not(dtmGeraDados.SQLCompContas.Prepared) then dtmGeraDados.SQLCompContas.Prepare;
                        dtmGeraDados.SQLCompContas.ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').AsInteger;
                        dtmGeraDados.SQLCompContas.ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').AsString;
                        dtmGeraDados.SQLCompContas.ParamByName('IDPESSOA').AsInteger       := idEmpresa;
                        dtmGeraDados.SQLCompContas.ParamByName('EXERCICIO').AsInteger      := StrToInt(pdblkExercicioLookupValue);

                        if trim(pdblcCenarioText) <> '' then dtmGeraDados.SQLCompContas.ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookupValue);

                        CdsCompContas.Data := GetDataPacket(dtmGeraDados.SQLCompContas.SQLChanged);

                        with dtmGeraDados.SQLVerificaSinal do
                        begin
                           CdsVerificaSinal.Close;

                           if not(Prepared) then Prepare;
                           ParamByName('IDPLANOORCAMEN').AsInteger := CdsComposicao.FieldByName('IDPLANOORCAMEN').asInteger;
                           ParamByName('IDCONTAORCAMEN').AsString  := CdsComposicao.FieldByName('IDCONTACONDRES').asString;

                           CdsVerificaSinal.Data := GetDataPacket(SQLChanged);
                        end;  // with dtmGeraDados.SQLVerificaSinal

                        if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then
                        begin
                           rValorRes := 0;
                        end
                        else  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                        begin
                           if cCalcOR = 'R' then
                           begin
                              rValorRes := CdsCompContas.FieldByName('VLRREALIZADO').asFloat;
                           end
                           else  // if cCalcOR = 'R'
                           begin
                              rValorRes := CdsCompContas.FieldByName('VLRORCADO').asFloat;
                           end;  // if cCalcOR = 'R'

                           if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'N' then rValorRes := rValorRes * (-1);
                        end;  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
                     end;  // if TestaCalculada(CdsComposicao.FieldByName('IDCONTACONDRES').asString, cCalcOR)
                  end
                  else  // if sTipoRes = 'C'
                  begin
                     rValorRes := CdsComposicao.FieldByName('VLRCONDRES').asFloat;
                     bTestaCondRes := True;
                  end;  // if sTipoRes = 'C'
                  // -------------------------------------------------------------------------------


                  // -------------------------------------------------------------------------------
                  if (bTestaCondIni) and (bTestaCondFim) and (bTestaCondRes) then
                  begin
                     if sCondicao = '<=' then begin
                        if rValorIni <= rValorFim then begin
                           rValor := rValorRes;
                           bCondicional := True;
                        end;
                     end;

                     if sCondicao = '<' then
                     begin
                        if rValorIni < rValorFim then
                        begin
                           rValor := rValorRes;
                           bCondicional := True;
                        end;  // if rValorIni < rValorFim
                     end;  // if sCondicao = '<'

                     if sCondicao = '=' then
                     begin
                        if rValorIni = rValorFim then
                        begin
                           rValor := rValorRes;
                           bCondicional := True;
                        end;  // if rValorIni = rValorFim
                     end;  // if sCondicao = '='

                     if sCondicao = '>' then
                     begin
                        if rValorIni > rValorFim then
                        begin
                           rValor := rValorRes;
                           bCondicional := True;
                        end;  // if rValorIni > rValorFim
                     end;  // if sCondicao = '>'

                     if sCondicao = '>=' then
                     begin
                        if rValorIni >= rValorFim then
                        begin
                           rValor         := rValorRes;
                           bCondicional   := True;
                        end;  // if rValorIni >= rValorFim
                     end;  // if sCondicao = '>='

                     if sCondicao = '<>' then
                     begin
                        if rValorIni <> rValorFim then
                        begin
                           rValor         := rValorRes;
                           bCondicional   := True;
                        end;  // if rValorIni <> rValorFim
                     end;  // if sCondicao = '<>'

                     if bCondicional then Break;
                  end;  // if (bTestaCondIni) and (bTestaCondFim) and (bTestaCondRes)
                  // -------------------------------------------------------------------------------

                  CdsComposicao.Next;
               end
            end;

            if bCondicional then
            begin
               if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
               begin
                  rValor := 0;
               end
               else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
               begin
                  if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
               end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

               GravaSaldosAnt(rValor,
                              cCalcOR,
                              pdblcCenarioText,
                              pdblkExercicioLookUpValue,
                              pdblcCenarioLookUpValue,
                              pdblkExerciciotext
                             );
            end; // if bCondicional
         end;  // if pcbBuscaSaldoAnteriorChecked
         // ----------------------------------------------------------------------------------------

         CdsContas.Next;
      end;
   end;
end;



procedure TCtrlGeraDados.CalculaFormula(dDataCorrente                : TDateTime;
                                        cCalcOR                      : Char;
                                        pcbBuscaSaldoAnteriorChecked : Boolean;
                                        pdblcCenarioText             : String;
                                        pdblkExercicioLookUpValue    : String;
                                        pdblcCenarioLookUpValue      : String;
                                        psePosIni1Value              : Double;
                                        psePosFim1Value              : Double;
                                        pedConteudo1Text             : String;
                                        pdblkExerciciotext           : String
                                       );
var
   rValor      : Double;
   rValorAcum  : Double;
   sCalculo    : String;
   sFormula    : String;
begin
   // Cálculo de contas de Fórmula (tipo "M")
   edtTipo.Text := 'Fórmula';

   SelecionaContas(cCalcOr,
                   'M',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   with CdsContas do
   begin
      // Varre a query de Contas selecionada
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         edtConta.Text := FieldByName('IDCONTAORCAMEN').AsString;

         // Transforma as contas em valores e passa para o parser fazer a fórmula
         if cCalcOR = 'O' then
         begin
            sFormula := FieldByName('FORMULAORCADO').AsString;
         end
         else  // if cCalcOR = 'O'
         begin
            sFormula := FieldByName('FORMULAREALIZADO').AsString;
         end;  // if cCalcOR = 'O'

         sCalculo := TransformaContas(sFormula,
                                      dDataCorrente,
                                      cCalcOR,
                                      'N',
                                      False,
                                      pdblcCenarioText,
                                      pdblkExercicioLookupValue,
                                      pdblcCenarioLookupValue
                                     );

         if sCalculo <> '' then
         begin
            try
               dtmGeraDados.Parser.Expression := sCalculo;
               // Pega o Valor retornado pelo parser
               rValor := dtmGeraDados.Parser.value;
            except
               rValor := 0;
            end;

            // Grava os dados na tabela de Saldos Orcamentarios
            if FieldByName('FLGATIVA').AsString = 'I' then
            begin
               rValor := 0;
            end
            else  // if FieldByName('FLGATIVA').AsString = 'I'
            begin
               if FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
            end;  // if FieldByName('FLGATIVA').AsString = 'I'

            rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                              cCalcOR,
                                              rValor,
                                              pdblcCenarioText,
                                              pdblkExercicioLookUpValue,
                                              pdblcCenarioLookUpValue
                                             );

            GravaSaldos(rValor,
                        rValorAcum,
                        dDataCorrente,
                        cCalcOR,
                        pdblcCenarioText,
                        pdblkExercicioLookUpValue,
                        pdblcCenarioLookUpValue,
                        pdblkExerciciotext
                       );

         end;  // if sCalculo <> ''

         if pcbBuscaSaldoAnteriorChecked then
         begin
            sCalculo := TransformaContas(sFormula,
                                         dDataCorrente,
                                         cCalcOR,
                                         'N',
                                         True,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue
                                        );

            if sCalculo <> '' then
            begin
               try
                  dtmGeraDados.Parser.Expression := sCalculo;
                  // Pega o Valor retornado pelo parser
                  rValor := dtmGeraDados.Parser.value;
               except
                  rValor := 0;
               end;

               // Grava os dados na tabela de Saldos Orcamentarios
               if FieldByName('FLGATIVA').AsString = 'I' then
               begin
                  rValor := 0;
               end
               else  // if FieldByName('FLGATIVA').AsString = 'I'
               begin
                  if FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
               end;  // if FieldByName('FLGATIVA').AsString = 'I'

               GravaSaldosAnt(rValor,
                              cCalcOR,
                              pdblcCenarioText,
                              pdblkExercicioLookUpValue,
                              pdblcCenarioLookUpValue,
                              pdblkExerciciotext
                             );

            end;  // if sCalculo <> ''
         end;  // if pcbBuscaSaldoAnteriorChecked

         CdsContas.Next;
      end;
   end;
end;



procedure TCtrlGeraDados.CalculaGenericos(dDataCorrente              : TDateTime;
                                          cCalcOR                    : Char;
                                          pdblcCenarioText           : String;
                                          pdblkExercicioLookUpValue  : String;
                                          pdblcCenarioLookUpValue    : String;
                                          psePosIni1Value            : Double;
                                          psePosFim1Value            : Double;
                                          pedConteudo1Text           : String;
                                          pdblkExerciciotext         : String
                                         );
var
   rValor      : Double;
   rValorAcum  : Double;
begin
   // Cálculo de contas de Geração de Dados (tipo "G")
   edtTipo.Text := 'Arquivos Genéricos';

   SelecionaContas(cCalcOr,
                   'G',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   with CdsContas do
   begin
      // Varre a query de Contas selecionada
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         edtConta.Text := FieldByName('IDCONTAORCAMEN').AsString;

         // Selecioana query do DataView
         CdsDataview.Close;

         if not(dtmGeraDados.SQLDataView.Prepared) then dtmGeraDados.SQLDataView.Prepare;
         dtmGeraDados.SQLDataView.ParamByName('IDDATAVIEW').asInteger := FieldByName('IDDATAVIEW').asInteger;

         CdsDataview.Data := GetDataPacket(dtmGeraDados.SQLDataView.SQLChanged);

         rValor := 0;
         try
            if not(CdsDataView.IsEmpty) then
            begin
               dtmGeraDados.SQLGenericos.SQL.text := CdsDataView.FieldByName('TEMPLATE').asString;

               if dtmGeraDados.SQLGenericos.SQL.Text <> '' then
               begin
                  CdsGenericos.Close;

                  if not(dtmGeraDados.SQLGenericos.Prepared) then dtmGeraDados.SQLGenericos.Prepare;
                  dtmGeraDados.SQLGenericos.ParamByName('DATA').asDateTime := dDataCorrente;
                  CdsGenericos.Data := GetDataPacket(dtmGeraDados.SQLGenericos.SQLChanged);
               end;
            end;  // if not(CdsDataView.IsEmpty)

            // Incrementa o acumulador de valores das contas Genéricas
            if dtmGeraDados.SQLGenericos.SQL.Text <> '' then
            begin
               rValor := CdsGenericos.FieldByName('VALOR').asFloat;
            //end else begin
            //  rValor := 0;
            end;
         except
            MessageInfo := 'A Consulta de Arquivos Genéricos da Conta ' + edtConta.Text + ' está com tipos inconsistentes.';
            Exit;
         end;

         // Grava os dados na tabela de Saldos Orcamentarios
         if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
         begin
            rValor := 0;
         end
         else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
         begin
            if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
         end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

         rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                           cCalcOR,
                                           rValor,
                                           pdblcCenarioText,
                                           pdblkExercicioLookUpValue,
                                           pdblcCenarioLookUpValue
                                          );

         GravaSaldos(rValor,
                     rValorAcum,
                     dDataCorrente,
                     cCalcOR,
                     pdblcCenarioText,
                     pdblkExercicioLookUpValue,
                     pdblcCenarioLookUpValue,
                     pdblkExerciciotext
                    );

         Next;
      end;
   end;
end;



procedure TCtrlGeraDados.CalculaContabilidade(dDataCorrente                : TDateTime;
                                              cCalcOR                      : Char;
                                              pcbBuscaSaldoAnteriorChecked : Boolean;
                                              pdblkExercicioLookupValue    : String;
                                              pdblcCenarioText             : String;
                                              pdblcCenarioLookUpValue      : String;
                                              psePosIni1Value              : Double;
                                              psePosFim1Value              : Double;
                                              pedConteudo1Text             : String;
                                              pdblkExerciciotext           : String
                                             );
var
   rValor      : Double;
   rValorAcum  : Double;
   rValorAnt   : Double;
   iPlanoPara  : LongInt;
   sContaPara  : String;
begin
   // Cálculo de contas de Contabilidade (tipo "P")
   edtTipo.Text := 'Contabilidade';

   SelecionaContas(cCalcOr,
                   'P',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   CdsPeriodoContab.Close;
   if not(dtmGeraDados.SQLPeriodoContab.Prepared) then dtmGeraDados.SQLPeriodoContab.Prepare;

   dtmGeraDados.SQLPeriodoContab.ParamByName('DATAREF').AsString   := DateToStr(dDataCorrente);
   dtmGeraDados.SQLPeriodoContab.ParamByName('PESSOA').AsInteger   := idEmpresa;

   CdsPeriodoContab.Data := GetDataPacket(dtmGeraDados.SQLPeriodoContab.SQLChanged);

   with CdsContas do
   begin
      // Varre a query de Contas selecionada
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         edtConta.Text  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
         rValor         := 0;
         rValorAnt      := 0;

         SelecionaComposicao(CdsContas.FieldByName('IDCONTAORCAMEN').AsString,
                             CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger,
                             cCalcOR,
                             'P'
                            );

         with CdsComposicao do
         begin
            // Varre a query de Composicao
            while not(EOF) and not(edtStatus.Tag = -1) do
            begin
               // Faz a query de Somatório da Contabilidade para cada conta da composição
               with dtmGeraDados.SQLContabilidade do
               begin
                  SQL.Clear;

                  if sGeraMes = 'S' then
                  begin
                     SQL.Add('SELECT  ');
                     SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR FROM ');
                     SQL.Add('PLANOSALDO ');
                     SQL.Add('WHERE  ');

                     if not(CdsComposicao.FieldByName('CODCENTROCUSTO').isNull) then
                     begin
                        SQL.Add('(CODCENTROCUSTO LIKE :CODCENTROCUSTO) AND ');
                        SQL.Add('(IDEMPRESA =:IDEMPRESA) AND ');
                     end;

                     SQL.Add('(PERNUMERO =:PERNUMERO) AND ');
                     SQL.Add('(PEREXERCICIO =:PEREXERCICIO) AND ');
                     SQL.Add('(IDPESSOA =:IDPESSOA) AND ');

                     if not(CdsComposicao.FieldByName('UNIDNEGOC').isNull) then
                        SQL.Add('(UNIDNEGOC =:UNIDNEGOC) AND ');

                     if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                        SQL.Add('(IDPLANOPREV =:IDPLANOPREV) AND ');

                     if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                        SQL.Add('(IDPATRO =:IDPATRO) AND ');

                     SQL.Add('(PLACONTA =:PLACONTA) AND ');
                     SQL.Add('(PLANO    =:PLANO)  ');
                  end
                  else  // if sGeraMes = 'S'
                  begin
                     SQL.Add('SELECT /*+ INDEX (LANCAMENTO) */ ');
                     SQL.Add('       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR * (-1))) AS VALOR FROM ');
                     SQL.Add('LANCAMENTO L, ');
                     SQL.Add('PLANILHA P    ');
                     SQL.Add('WHERE  ');
                     SQL.Add('(L.PLACONTA LIKE :PLACONTA) AND ');
                     SQL.Add('(L.PLANO    =:PLANO) AND ');

                     if not(CdsComposicao.FieldByName('CODCENTROCUSTO').isNull) then
                     begin
                       SQL.Add('(L.CODCENTROCUSTO LIKE :CODCENTROCUSTO) AND ');
                       SQL.Add('(L.IDEMPRESA =:IDEMPRESA) AND ');
                     end;

                     SQL.Add('(P.PERNUMERO =:PERNUMERO) AND ');
                     SQL.Add('(P.PEREXERCICIO =:PEREXERCICIO) AND ');
                     SQL.Add('(P.IDPESSOA =:IDPESSOA) AND ');

                     if not(CdsComposicao.FieldByName('UNIDNEGOC').isNull) then
                        SQL.Add('(L.UNIDNEGOC =:UNIDNEGOC) AND ');

                     if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                        SQL.Add('(L.IDPLANOPREV =:IDPLANOPREV) AND ');

                     if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                        SQL.Add('(L.IDPATRO =:IDPATRO) AND ');

                     SQL.Add('(P.PLNDATDIA =:DATA) AND ');

                     // SQL.Add('L.PLNCODIGO not IN (SELECT PLNCODIGO FROM LANCAMENTOORC) AND ');
                     SQL.Add('(L.PLNCODIGO = P.PLNCODIGO) ');
                  end;  // if sGeraMes = 'S'

                  if not(Prepared) then Prepare;

                  iPlanoPara := CdsComposicao.FieldByName('PLANO').AsInteger;
                  sContaPara := trim(CdsComposicao.FieldByName('PLACONTA').AsString);
                  sContaPara := Trim(sContaPara);

                  if not(Prepared) then Prepare;
                  ParamByName('PERNUMERO').AsInteger    := CdsPeriodoContab.FieldByName('PERNUMERO').AsInteger;
                  ParamByName('PEREXERCICIO').AsInteger := CdsPeriodoContab.FieldByName('PEREXERCICIO').AsInteger;
                  ParamByName('PLANO').AsInteger        := iPlanoPara;

                  if sGeraMes = 'S' then
                  begin
                     ParamByName('PLACONTA').asString := Espaco(sContaPara, 18);
                  end
                  else  // if sGeraMes = 'S'
                  begin
                     ParamByName('PLACONTA').asString := trim(sContaPara)+'%';
                  end;  // if sGeraMes = 'S'

                  ParamByName('IDPESSOA').AsInteger   := IdEmpresa;

                  if not(CdsComposicao.FieldByName('UNIDNEGOC').isNull) then
                     ParamByName('UNIDNEGOC').AsInteger := CdsComposicao.FieldByName('UNIDNEGOC').AsInteger;

                  if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                     ParamByName('IDPLANOPREV').AsInteger := CdsComposicao.FieldByName('IDPLANOPREV').AsInteger;

                  if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                     ParamByName('IDPATRO').AsInteger := CdsComposicao.FieldByName('IDPATRO').AsInteger;

                  if not(CdsComposicao.FieldByName('CODCENTROCUSTO').isNull) then
                  begin
                    ParamByName('CODCENTROCUSTO').asString := trim(CdsComposicao.FieldByName('CODCENTROCUSTO').asString)+'%';
                    ParamByName('IDEMPRESA').AsInteger     := CdsComposicao.FieldByName('IDEMPRESA').AsInteger;
                  end;

                  DecodeDate(dDataCorrente,iAno,iMes,iDia);

                  if sGeraMes <> 'S' then ParamByName('DATA').AsDateTime  := dDataCorrente;

                  CdsContabilidade.Data := GetDataPacket(SQLChanged);        // CdsComposicao.Data := Data;

                  // Incrementa o acumulador de valores das contas da Composição
                  if not(CdsContabilidade.IsEmpty) then rValor := rValor + CdsContabilidade.FieldByName('VALOR').asFloat;
               end;

               if pcbBuscaSaldoAnteriorChecked then
               begin
                  with dtmGeraDados.SQLContabilidade do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT  ');
                     SQL.Add('       SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR FROM ');
                     SQL.Add('PLANOSALDO ');
                     SQL.Add('WHERE  ');
                     SQL.Add('(PLACONTA = :PLACONTA) AND ');
                     SQL.Add('(PLANO    =:PLANO) AND ');

                     if not(CdsComposicao.FieldByName('CODCENTROCUSTO').isNull) then
                     begin
                       SQL.Add('(CODCENTROCUSTO =:CODCENTROCUSTO) AND ');
                       SQL.Add('(IDEMPRESA =:IDEMPRESA) AND ');
                     end;

                     SQL.Add('(PERNUMERO IS NULL) AND ');
                     SQL.Add('(PEREXERCICIO =:PEREXERCICIO) AND ');

                     if not(CdsComposicao.FieldByName('UNIDNEGOC').isNull) then
                        SQL.Add('(UNIDNEGOC =:UNIDNEGOC) AND ');

                     if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                        SQL.Add('(IDPLANOPREV =:IDPLANOPREV) AND ');

                     if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                        SQL.Add('(IDPATRO =:IDPATRO) AND ');

                     SQL.Add('(IDPESSOA =:IDPESSOA) ');

                     if not(Prepared) then Prepare;

                     iPlanoPara := CdsComposicao.FieldByName('PLANO').AsInteger;
                     sContaPara := trim(CdsComposicao.FieldByName('PLACONTA').AsString);
                     sContaPara := Trim(sContaPara);

                     if not(Prepared) then Prepare;
                     ParamByName('PEREXERCICIO').AsInteger := StrToInt(pdblkExercicioLookupValue);
                     ParamByName('PLANO').AsInteger        := iPlanoPara;
                     ParamByName('PLACONTA').asString      := Espaco(sContaPara,18);
                     ParamByName('IDPESSOA').AsInteger     := IdEmpresa;

                     if not(CdsComposicao.FieldByName('UNIDNEGOC').isNull) then
                        ParamByName('UNIDNEGOC').AsInteger := CdsComposicao.FieldByName('UNIDNEGOC').AsInteger;

                     if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                        ParamByName('IDPLANOPREV').AsInteger := CdsComposicao.FieldByName('IDPLANOPREV').AsInteger;

                     if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                        ParamByName('IDPATRO').AsInteger := CdsComposicao.FieldByName('IDPATRO').AsInteger;

                     if not(CdsComposicao.FieldByName('CODCENTROCUSTO').isNull) then
                     begin
                       ParamByName('CODCENTROCUSTO').asString := Espaco(Trim(CdsComposicao.FieldByName('CODCENTROCUSTO').asString),10);
                       ParamByName('IDEMPRESA').AsInteger     := CdsComposicao.FieldByName('IDEMPRESA').AsInteger;
                     end;

                     CdsContabilidade.Data := GetDataPacket(SQLChanged);

                     // Incrementa o acumulador de valores das contas da Composição
                     if not(IsEmpty) then rValorAnt := rValorAnt + CdsContabilidade.FieldByName('VALOR').asFloat;
                  end;  // with dtmGeraDados.SQLContabilidade
               end;  // if pcbBuscaSaldoAnteriorChecked

               CdsComposicao.Next;
            end;  // while not(EOF) and not(edtStatus.Tag = -1)
         end;  // with CdsComposicao

         // Grava os dados na tabela de Saldos Orcamentarios
         if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
         begin
           rValor := 0;
         end
         else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
         begin
           if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
         end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

         rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                           cCalcOR,
                                           rValor,
                                           pdblcCenarioText,
                                           pdblkExercicioLookUpValue,
                                           pdblcCenarioLookUpValue
                                          );

         GravaSaldos(rValor,
                     rValorAcum,
                     dDataCorrente,
                     cCalcOR,
                     pdblcCenarioText,
                     pdblkExercicioLookUpValue,
                     pdblcCenarioLookUpValue,
                     pdblkExerciciotext
                    );

         if pcbBuscaSaldoAnteriorChecked then
         begin
            if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
            begin
               rValorAnt := 0;
            end
            else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
            begin
               if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValorAnt := rValorAnt * (-1);
            end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

            GravaSaldosAnt(rValorAnt,
                           cCalcOR,
                           pdblcCenarioText,
                           pdblkExercicioLookUpValue,
                           pdblcCenarioLookUpValue,
                           pdblkExerciciotext
                          );

         end;  // if pcbBuscaSaldoAnteriorChecked

         CdsContas.Next;
      end;  // while not(EOF) and not(edtStatus.Tag = -1)
   end;  // with CdsContas
end;



procedure TCtrlGeraDados.CalculaFluxo(dDataCorrente               : TDateTime;
                                      cCalcOR                     : Char;
                                      pdblcCenarioText            : String;
                                      pdblkExercicioLookUpValue   : String;
                                      pdblcCenarioLookUpValue     : String;
                                      psePosIni1Value             : Double;
                                      psePosFim1Value             : Double;
                                      pedConteudo1Text            : String;
                                      pdblkExerciciotext          : String
                                     );
var
   rValor      : Double;
   rValorAcum  : Double;
begin
   // Cálculo de contas de Fluxo (tipo "X")
   edtTipo.Text := 'Fluxo de Caixa';

   SelecionaContas(cCalcOr,
                   'X',
                   psePosIni1Value,
                   psePosFim1Value,
                   pedConteudo1Text
                  );

   with CdsContas do
   begin
      // Varre a query de Contas selecionada
      while not(EOF) and not(edtStatus.Tag = -1) do
      begin
         edtConta.Text  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
         rValor         := 0;

         SelecionaComposicao(CdsContas.FieldByName('IDCONTAORCAMEN').AsString, CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger, cCalcOR,'X');

         with CdsComposicao do
         begin
            // Varre a query de Composicao
            while not(EOF) and not(edtStatus.Tag = -1) do
            begin
               // Faz a query de Somatório do Fluxo de caixa para cada conta da composição
               with dtmGeraDados.SQLFluxo do
               begin
                  SQL.Clear;
                  SQL.Add('SELECT SUM(DECODE(RECPAG,''R'',VALOR,VALOR * (-1))) AS VALOR FROM ');
                  SQL.Add(PrefixoServidor + 'FLUXOREAL ');
                  SQL.Add('WHERE  ');
                  SQL.Add('(CODTIPRECDES  LIKE :CODTIPRECDES) AND ');
                  SQL.Add('(IDPESSOA        =:IDPESSOA) AND ');
                  SQL.Add('(RECPAG          =:RECPAG) AND ');

                  if not(CdsComposicao.FieldByName('UNIDNEGOC').IsNull) then
                     SQL.Add('(UNIDNEGOC       =:UNIDNEGOC) AND ');

                  if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                     SQL.Add('(IDPLANOPREV =:IDPLANOPREV) AND ');

                  if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                     SQL.Add('(IDPATRO =:IDPATRO) AND ');

                  if not(CdsComposicao.FieldByName('CODCENTRORESPON').IsNull) then
                     SQL.Add('(CODCENTRORESPON LIKE :CODCENTRORESPON) AND ');

                  if not(CdsComposicao.FieldByName('CODCENTROCUSTO').IsNull) then
                     SQL.Add('(CODCENTROCUSTO LIKE :CODCENTROCUSTO) AND ');

                  if sGeraMes = 'S' then
                  begin
                     SQL.Add('(TO_CHAR(DATACFLOAT,''YYYYMM'') =:DATA) ');
                  end
                  else  // if sGeraMes = 'S'
                  begin
                     SQL.Add('(DATACFLOAT      =:DATA) ');
                  end;  // if sGeraMes = 'S'

                  if not(Prepared) then Prepare;
                  ParamByName('CODTIPRECDES').AsString   := trim(CdsComposicao.FieldByName('CODTIPRECDES').asString)+'%';
                  ParamByName('IDPESSOA').AsInteger      := IdEmpresa;
                  ParamByName('RECPAG').AsString         := CdsComposicao.FieldByName('RECPAG').AsString;

                  if not(CdsComposicao.FieldByName('UNIDNEGOC').IsNull) then
                     ParamByName('UNIDNEGOC').AsInteger     := CdsComposicao.FieldByName('UNIDNEGOC').AsInteger;

                  if not(CdsComposicao.FieldByName('IDPLANOPREV').isNull) then
                     ParamByName('IDPLANOPREV').AsInteger := CdsComposicao.FieldByName('IDPLANOPREV').AsInteger;

                  if not(CdsComposicao.FieldByName('IDPATRO').isNull) then
                     ParamByName('IDPATRO').AsInteger := CdsComposicao.FieldByName('IDPATRO').AsInteger;

                  if not(CdsComposicao.FieldByName('CODCENTRORESPON').IsNull) then
                     ParamByName('CODCENTRORESPON').asString  := Trim(CdsComposicao.FieldByName('CODCENTRORESPON').asString)+'%';

                  if not(CdsComposicao.FieldByName('CODCENTROCUSTO').IsNull) then
                     ParamByName('CODCENTROCUSTO').asString  := Trim(CdsComposicao.FieldByName('CODCENTROCUSTO').asString)+'%';

                  DecodeDate(dDataCorrente,iAno,iMes,iDia);

                  if sGeraMes = 'S' then
                  begin
                     ParamByName('DATA').AsString   := FormatFloat('0000', iAno) + FormatFloat('00', iMes );
                                                       //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
                  end
                  else  // if sGeraMes = 'S'
                  begin
                     ParamByName('DATA').AsDateTime := dDataCorrente;
                  end;  // if sGeraMes = 'S'

                  CdsFluxo.Data := GetDataPacket(SQLChanged);

                  // Incrementa o acumulador de valores das contas da Composição
                  if not(CdsFluxo.IsEmpty) then rValor := rValor + CdsFluxo.FieldByName('VALOR').asFloat;
               end;

               CdsComposicao.Next;
            end;
         end;

         // Grava os dados na tabela de Saldos Orcamentarios
         if CdsContas.FieldByName('FLGATIVA').AsString = 'I' then
         begin
            rValor := 0;
         end
         else  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'
         begin
            if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'N' then rValor := rValor * (-1);
         end;  // if CdsContas.FieldByName('FLGATIVA').AsString = 'I'

         rValorAcum := CalculaVlrAcumulado(dDataCorrente,
                                           cCalcOR,
                                           rValor,
                                           pdblcCenarioText,
                                           pdblkExercicioLookUpValue,
                                           pdblcCenarioLookUpValue
                                          );

         GravaSaldos(rValor,
                     rValorAcum,
                     dDataCorrente,
                     cCalcOR,
                     pdblcCenarioText,
                     pdblkExercicioLookUpValue,
                     pdblcCenarioLookUpValue,
                     pdblkExerciciotext
                    );

         CdsContas. Next;
      end;  // while not(EOF) and not(edtStatus.Tag = -1)
   end;  // with CdsContas
end;



function TCtrlGeraDados.CalculaVlrAcumulado(dDataCorrente               : TDateTime;
                                            cCalcOR                     : Char;
                                            rValorDia                   : Double;
                                            pdblcCenarioText            : String;
                                            pdblkExercicioLookUpValue   : String;
                                            pdblcCenarioLookUpValue     : String
                                           ): Double;
var
   cTipo    : Char;
   sTipo    : String;
   sCalculo : String;
   sFormula : String;
   sMesAnt  : String;
   SQLAcum3 : TCMSQLParams;
   dDataAnt : TDateTime;
begin
   if CdsContas.FieldByName('FLGACUMULADO').isNull then
   begin
      Result := 0;
   end
   else  // if CdsContas.FieldByName('FLGACUMULADO').isNull
   begin
      sTipo  := CdsContas.FieldByName('FLGACUMULADO').AsString;
      cTipo  := sTipo[1];
      Result := 0;

      case cTipo of

         'N':
         begin
            if trim(pdblcCenarioText) <> '' then
            begin
               SQLAcum3 := dtmGeraDados.SQLAcumulado3MC;
            end
            else  // if trim(pdblcCenarioText) <> ''
            begin
               if sGeraMes = 'S' then
                  SQLAcum3 := dtmGeraDados.SQLAcumulado3M
               else
                  SQLAcum3 := dtmGeraDados.SQLAcumulado3;
            end;  // if trim(pdblcCenarioText) <> ''

            with SQLAcum3 do
            begin
               CdsAcum3.Close;

               if not(Prepared) then Prepare;
               ParamByName('IDPESSOA').asInteger        := idEmpresa;
               ParamByName('IDPLANOORCAMEN').asInteger  := iPlanoOrc;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;

               if trim(pdblcCenarioText) <> '' then
               begin
                  ParamByName('EXERCICIO').asInteger        := StrToInt(pdblkExercicioLookUpValue);
                  ParamByName('PERIODO').asInteger          := iPeriodoAtu;
                  ParamByName('IDCENARIOORCAMEN').asInteger := StrToInt(pdblcCenarioLookUpValue);
               end
               else  // if trim(pdblcCenarioText) <> ''
               begin
                  if sGeraMes = 'S' then
                  begin
                     DecodeDate(dDataCorrente,iAno,iMes,iDia);
                     dDataAnt := EncodeDate(iAno, iMes, 1) - 15;
                     DecodeDate(dDataAnt, iAno, iMes, iDia);

                     sMesAnt  := FormatFloat('0000', iAno) + FormatFloat('00', iMes );
                                 //Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2);
                     ParamByName('DATAREFERENCIA').asString   := sMesAnt;
                  end
                  else  // if sGeraMes = 'S'
                  begin
                     ParamByName('DATAREFERENCIA').asDateTime := dDataCorrente - 1;
                  end;  // if sGeraMes = 'S'
               end;  // if trim(pdblcCenarioText) <> ''
               CdsAcum3.Data := GetDataPacket(SQLChanged);

               if cCalcOR = 'O' then
               begin
                  if not(CdsAcum3.IsEmpty) then
                  begin
                     Result := CdsAcum3.FieldByName('ORC').asFloat + rValorDia;
                  end
                  else  // if not(CdsAcum3.IsEmpty)
                  begin
                     Result := rValorDia;
                  end;  // if not(CdsAcum3.IsEmpty)
               end
               else  // if cCalcOR = 'O'
               begin
                  if not(CdsAcum3.IsEmpty) then
                  begin
                     Result := CdsAcum3.FieldByName('REAL').asFloat + rValorDia;
                  end
                  else  // if not(CdsAcum3.IsEmpty)
                  begin
                     Result := rValorDia;
                  end;  // if not(CdsAcum3.IsEmpty)
               end;  // if cCalcOR = 'O'

            end;  // with SQLAcum3
         end;  // case cTipo 'N'

         'O':
         begin
            // Transforma as contas em valores e passa para o parser fazer a fórmula
            sFormula := CdsContas.FieldByName('FORMULAORCADO').AsString;

            sCalculo := TransformaContas(sFormula,
                                         dDataCorrente,
                                         cCalcOR,
                                         'A',
                                         False,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue
                                        );

            if sCalculo <> '' then
            begin
               try
                  dtmGeraDados.Parser.Expression := sCalculo;
                  //Pega o Valor retornado pelo parser
                  Result := dtmGeraDados.Parser.value;
               except
                  on E: Exception do Result := 0;
               end;  // try..except
            end;  // if sCalculo <> ''
         end;  // case cTipo 'O'

         'R':
         begin
            // Transforma as contas em valores e passa para o parser fazer a fórmula
            sFormula := CdsContas.FieldByName('FORMULAREALIZADO').AsString;

            sCalculo := TransformaContas(sFormula,
                                         dDataCorrente,
                                         cCalcOR,
                                         'A',
                                         False,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue
                                        );

            if sCalculo <> '' then
            begin
               try
                  dtmGeraDados.Parser.Expression := sCalculo;
                  // Pega o Valor retornado pelo parser
                  Result := dtmGeraDados.Parser.value;
               except
                  on E: Exception do Result := 0;
               end;  // try..except
            end;  // if sCalculo <> ''
         end;  // case cTipo 'R':

         'S':
         begin
            // Transforma as contas em valores e passa para o parser fazer a fórmula
            if cCalcOR = 'O' then
            begin
               sFormula := CdsContas.FieldByName('FORMULAORCADO').AsString;
            end
            else  // if cCalcOR = 'O'
            begin
               sFormula := CdsContas.FieldByName('FORMULAREALIZADO').AsString;
            end;  // if cCalcOR = 'O'

            sCalculo := TransformaContas(sFormula,
                                         dDataCorrente,
                                         cCalcOR,
                                         'A',
                                         False,
                                         pdblcCenarioText,
                                         pdblkExercicioLookupValue,
                                         pdblcCenarioLookupValue
                                        );


            if sCalculo <> '' then
            begin
               try
                  dtmGeraDados.Parser.Expression := sCalculo;
                  // Pega o Valor retornado pelo parser
                  Result := dtmGeraDados.Parser.value;
               except
                  on E: Exception do Result := 0;
               end;  // try..except
            end;  // if sCalculo <> ''
         end;  // case cTipo 'S'

         'U': Result := rValorDia;

         else
         begin
            Result := 0;
         end;  // case cTipo 'else'
      end;  // case cTipo
   end;  // if CdsContas.FieldByName('FLGACUMULADO').isNull
end;



procedure TCtrlGeraDados.SelecionaContas(cCalcOR            : Char;
                                         cTipoCalculo       : Char;
                                         psePosIni1Value    : Double;
                                         psePosFim1Value    : Double;
                                         pedConteudo1Text   : String
                                        );
begin
   edtStatus.Text := 'Aguarde, processando os Dados das Contas Orçamentárias...';

   // Seleciona as Contas Orcamentárias do Tipo desejado, com o Calculo (O/R) desejado
   with dtmGeraDados.SQLContas do
   begin
      CdsContas.Close;

      SQL.Clear;
      SQL.Add('SELECT                                            ');
      SQL.Add('   IDPLANOORCAMEN, IDCONTAORCAMEN, FLGSINALCONTA, ');
      SQL.Add('   FLGINFDIAMES, FORMULAORCADO, FORMULAREALIZADO, ');
      SQL.Add('   IDDATAVIEW, ORIGEMCMDV, FLGACUMULADO, FLGATIVA ');
      SQL.Add('FROM CONTASORCAMEN                                ');

      if cCalcOR = 'O' then
      begin
         SQL.Add('WHERE (TIPOCALCORCADO =:TIPO) AND (FLGCALCORCADO = ''N'')');
      end
      else  // if cCalcOR = 'O'
      begin
         SQL.Add('WHERE (TIPOCALCREALIZADO =:TIPO) AND (FLGCALCREAL = ''N'')');
      end;  // if cCalcOR = 'O'

      SQL.Add('   AND ((FLGATIVA = ''A'') OR (FLGATIVA IS NULL))  ');

      if trim(pedConteudo1Text) <> '' then
      begin
         SQL.Add(' AND (SUBSTR(IDCONTAORCAMEN,' + FloatToStr(psePosIni1Value)+ ',' + FloatToStr(psePosFim1Value) + ') = (''' + trim(pedConteudo1Text) + ''')) ');
      end;  // if trim(pedConteudo1Text) <> ''

      SQL.Add(' AND (IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc)+')');
      SQL.Add(' ORDER BY IDPLANOORCAMEN, IDCONTAORCAMEN ');

      if not(Prepared) then Prepare;
      ParamByName('TIPO').asString  := cTipoCalculo;

      CdsContas.Data := GetDataPacket(SQLChanged);
      CdsContas.First;
   end;  // with dtmGeraDados.SQLContas
end;



procedure TCtrlGeraDados.GravaSaldos(rValor                    : Double;
                                     rValorAcum                : Double;
                                     dDataCorrente             : TDateTime;
                                     cCalcOR                   : Char;
                                     pdblcCenarioText          : String;
                                     pdblkExercicioLookUpValue : String;
                                     pdblcCenarioLookUpValue   : String;
                                     pdblkExerciciotext        : String
                                     );
var
   IDCenario : LongInt;
begin
   // Só grava o saldo se o botão de cancelado não foi apertado
   if not(edtStatus.Tag = -1) then
   begin
      with dtmGeraDados.SQLSaldos do
      begin
         CdsSaldos.Close;
         SQL.Clear;

         if trim(pdblcCenarioText) <> '' then
         begin
            //Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDVALORESCENARIO FROM ');
            SQL.Add(PrefixoServidor + 'VALORESCENARIO ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(PERIODO =:PERIODO) AND ');
            SQL.Add('(IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');

            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
            ParamByName('IDPESSOA').AsInteger       := idEmpresa;
            ParamByName('PERIODO').AsInteger        := iPeriodoAtu;
            ParamByName('EXERCICIO').AsInteger      := StrToInt(pdblkExercicioLookUpValue);
            ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookUpValue);

            CdsSaldos.Data := GetDataPacket(SQLChanged);

            // Se não existir insere o novo registro
            if CdsSaldos.IsEmpty then
            begin
               SQL.Clear;
               SQL.Add('INSERT INTO VALORESCENARIO ');
               SQL.Add('(IDVALORESCENARIO,IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ');
               SQL.Add(' PERIODO, IDPESSOA, IDCENARIOORCAMEN, VLRORCCENARIO) ');
               SQL.Add('VALUES ');
               SQL.Add('(:IDVALORESCENARIO,:IDCONTAORCAMEN, :IDPLANOORCAMEN, :EXERCICIO, ');
               SQL.Add(' :PERIODO, :IDPESSOA, :IDCENARIOORCAMEN, :VLRORCCENARIO) ');

               Prepare;
               ParamByName('IDVALORESCENARIO').asInteger:= GetSequence('VALORESCENARIO');
               ParamByName('IDPLANOORCAMEN').asInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
               ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExercicioLookUpValue);
               ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt(pdblcCenarioLookUpValue);
               ParamByName('PERIODO').asInteger         := iPeriodoAtu;
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;
               ParamByName('VLRORCCENARIO').AsFloat     := rValor;

               AtualizaTabela(SQLChanged);
            end
            else  // if CdsSaldos.IsEmpty
            begin
               // Caso exista, dá update
               IDCenario := CdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger;

               SQL.Clear;
               SQL.Add('UPDATE VALORESCENARIO SET ');
               SQL.Add('VLRORCCENARIO  = VLRORCCENARIO + :VALOR  ');
               SQL.Add('WHERE (IDVALORESCENARIO =:IDVALORESCENARIO) ');

               Prepare;
               ParamByName('IDVALORESCENARIO').AsInteger := IDCenario;
               ParamByName('VALOR').AsFloat              := rValor;

               AtualizaTabela(SQLChanged);
            end;  // if CdsSaldos.IsEmpty
         end
         else  // if trim(pdblcCenarioText) <> ''
         begin
            //Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDCONTAORCAMEN, DATAREFERENCIA FROM ');
            SQL.Add(PrefixoServidor + 'SALDOORCADO ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(DATAREFERENCIA =:DATAREFERENCIA) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');

            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
            ParamByName('IDPESSOA').AsInteger       := idEmpresa;
            ParamByName('DATAREFERENCIA').AsDateTime:= dDataCorrente;

            CdsSaldos.Close;
            CdsSaldos.Data := GetDataPacket(SQLChanged);

            // Se não existir insere o novo registro
            if CdsSaldos.IsEmpty then
            begin
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
               ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExerciciotext);
               ParamByName('PERIODO').asInteger         := iPeriodoAtu;
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;

               if cCalcOR = 'O' then
               begin
                  // Muda o sinal do valor dependendo da flag de sinal da conta
                  ParamByName('VLRORCADO').AsFloat  := rValor;

                  if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P' then
                  begin
                     ParamByName('VLRORCACUM').AsFloat := rValorAcum;
                  end
                  else  // if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P'
                  begin
                     ParamByName('VLRORCACUM').AsFloat := (rValorAcum * (-1));
                  end;  // if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P'

                  ParamByName('VLRREALIZADO').AsFloat := 0;
                  ParamByName('VLRREALACUM').AsFloat  := 0;
               end
               else  // if cCalcOR = 'O'
               begin

                  ParamByName('VLRORCADO').AsFloat    := 0;
                  ParamByName('VLRORCACUM').AsFloat   := 0;

                  //Muda o sinal do valor dependendo da flag de sinal da conta
                  ParamByName('VLRREALIZADO').AsFloat := rValor;

                  if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P' then
                  begin
                     ParamByName('VLRREALACUM').AsFloat  := rValorAcum;
                  end
                  else  // if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P'
                  begin
                     ParamByName('VLRREALACUM').AsFloat  := - rValorAcum;
                  end;  // if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P'
               end;  // if cCalcOR = 'O'

               AtualizaTabela(SQLChanged);
            end
            else  // if CdsSaldos.IsEmpty
            begin
               // Caso exista, dá update
               SQL.Clear;
               SQL.Add('UPDATE SALDOORCADO SET ');

               if cCalcOR = 'O' then
               begin
                  SQL.Add('VLRORCADO  =:VALOR, ');
                  SQL.Add('VLRORCACUM =:VALORACUM ');
               end
               else  // if cCalcOR = 'O'
               begin
                  SQL.Add('VLRREALIZADO =:VALOR, ');
                  SQL.Add('VLRREALACUM  =:VALORACUM ');
               end;  // if cCalcOR = 'O'

               SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
               SQL.Add('      (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
               SQL.Add('      (DATAREFERENCIA =:DATAREFERENCIA) AND ');
               SQL.Add('      (IDPESSOA       =:IDPESSOA)');

               Prepare;
               ParamByName('IDPLANOORCAMEN').AsInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
               ParamByName('IDCONTAORCAMEN').AsString   := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
               ParamByName('DATAREFERENCIA').AsDateTime := dDataCorrente;
               ParamByName('IDPESSOA').AsInteger        := idEmpresa;

               //Muda o sinal do valor dependendo da flag de sinal da conta
               ParamByName('VALOR').AsFloat   := rValor;

               if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P' then
               begin
                  ParamByName('VALORACUM').AsFloat := rValorAcum;
               end
               else  // if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P'
               begin
                  ParamByName('VALORACUM').AsFloat := - rValorAcum;
               end;  // if CdsContas.FieldByName('FLGSINALCONTA').AsString = 'P'

               AtualizaTabela(SQLChanged);
            end;
         end;  // if trim(pdblcCenarioText) <> ''
      end;  // with dtmGeraDados.SQLSaldos

      //Seta as Flags de Cálculo da conta selecionada para "S" - Calculada
      with dtmGeraDados.SQLFlagCalculo do
      begin
         SQL.Clear;
         SQL.Add('UPDATE CONTASORCAMEN SET ');

         if cCalcOR = 'O' then
         begin
            SQL.Add('FLGCALCORCADO = ''S'' ');
         end
         else  // if cCalcOR = 'O'
         begin
            SQL.Add('FLGCALCREAL = ''S'' ');
         end;  // if cCalcOR = 'O'

         SQL.Add('WHERE IDPLANOORCAMEN =:IDPLANOORCAMEN AND ');
         SQL.Add('IDCONTAORCAMEN =:IDCONTAORCAMEN ');

         Prepare;
         ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
         ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;

         AtualizaTabela(SQLChanged);
      end;  // with dtmGeraDados.SQLFlagCalculo
   end;  // if not(edtStatus.Tag = -1)
end;



procedure TCtrlGeraDados.GravaSaldosAnt(rValor                    : Double;
                                        cCalcOR                   : Char;
                                        pdblcCenarioText          : String;
                                        pdblkExercicioLookUpValue : String;
                                        pdblcCenarioLookUpValue   : String;
                                        pdblkExerciciotext        : String
                                       );
var
   IDCenario : LongInt;
begin
   // Só grava o saldo se o botão de cancelado não foi apertado
   if not(edtStatus.Tag = -1) then
   begin
      with dtmGeraDados.SQLSaldos do
      begin
         CdsSaldos.Close;
         SQL.Clear;

         if trim(pdblcCenarioText) <> '' then
         begin
            // Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDVALORESCENARIO FROM ');
            SQL.Add(PrefixoServidor + 'VALORESCENARIO ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(PERIODO IS NULL) AND ');
            SQL.Add('(IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');
            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger   := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString    := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
            ParamByName('IDPESSOA').AsInteger         := idEmpresa;
            ParamByName('EXERCICIO').AsInteger        := StrToInt(pdblkExercicioLookUpValue);
            ParamByName('IDCENARIOORCAMEN').AsInteger := StrToInt(pdblcCenarioLookUpValue);

            CdsSaldos.Data := GetDataPacket(SQLChanged);

            // Se não existir insere o novo registro
            if CdsSaldos.IsEmpty then
            begin
               SQL.Clear;
               SQL.Add('INSERT INTO VALORESCENARIO ');
               SQL.Add('(IDVALORESCENARIO,IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ');
               SQL.Add(' PERIODO, IDPESSOA, IDCENARIOORCAMEN, VLRORCCENARIO) ');
               SQL.Add('VALUES ');
               SQL.Add('(:IDVALORESCENARIO,:IDCONTAORCAMEN, :IDPLANOORCAMEN, :EXERCICIO, ');
               SQL.Add(' NULL, :IDPESSOA, :IDCENARIOORCAMEN, :VLRORCCENARIO) ');

               Prepare;
               ParamByName('IDVALORESCENARIO').asInteger:= GetSequence('VALORESCENARIO');
               ParamByName('IDPLANOORCAMEN').asInteger  := CdsContas.FieldByName('IDPLANOORCAMEN').asInteger;
               ParamByName('IDCONTAORCAMEN').asString   := CdsContas.FieldByName('IDCONTAORCAMEN').asString;
               ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExercicioLookUpValue);
               ParamByName('IDCENARIOORCAMEN').asInteger:= StrToInt(pdblcCenarioLookUpValue);
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;
               ParamByName('VLRORCCENARIO').AsFloat     := rValor;

               AtualizaTabela(SQLChanged);
            end
            else  // if CdsSaldos.IsEmpty
            begin
               // Caso exista, dá update
               IDCenario := CdsSaldos.FieldByName('IDVALORESCENARIO').AsInteger;
               SQL.Clear;
               SQL.Add('UPDATE VALORESCENARIO SET ');
               SQL.Add('VLRORCCENARIO  = VLRORCCENARIO + :VALOR  ');
               SQL.Add('WHERE (IDVALORESCENARIO =:IDVALORESCENARIO) ');
               Prepare;
               ParamByName('IDVALORESCENARIO').AsInteger := IDCenario;
               ParamByName('VALOR').AsFloat              := rValor;
               AtualizaTabela(SQLChanged);
            end;  // if CdsSaldos.IsEmpty
         end
         else  // if trim(pdblcCenarioText) <> ''
         begin
            // Busca na tabela de Saldos se o registro existe
            SQL.Add('SELECT IDCONTAORCAMEN FROM ');
            SQL.Add('SALDOORCADOANT ');
            SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
            SQL.Add('(IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
            SQL.Add('(EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(IDPESSOA = :IDPESSOA) ');

            Prepare;
            ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
            ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
            ParamByName('IDPESSOA').AsInteger       := idEmpresa;
            ParamByName('EXERCICIO').AsInteger      := StrToInt(pdblkExercicioLookupValue);

            CdsSaldos.Data := GetDataPacket(SQLChanged);

            //Se não existir insere o novo registro
            if CdsSaldos.IsEmpty then
            begin
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
               ParamByName('EXERCICIO').asInteger       := StrToInt(pdblkExerciciotext);
               ParamByName('IDPESSOA').asInteger        := IdEmpresa;

               if cCalcOR = 'O' then
               begin
                  ParamByName('VLRORCADO').AsFloat:= rValor;
                  ParamByName('VLRREALIZADO').AsFloat := 0;
               end
               else  // if cCalcOR = 'O'
               begin
                  ParamByName('VLRORCADO').AsFloat    := 0;
                  ParamByName('VLRREALIZADO').AsFloat := rValor;
               end;  // if cCalcOR = 'O'

               AtualizaTabela(SQLChanged);
            end
            else  // if CdsSaldos.IsEmpty
            begin
               // Caso exista, dá update
               SQL.Clear;
               SQL.Add('UPDATE SALDOORCADOANT SET ');

               if cCalcOR = 'O' then
               begin
                  SQL.Add('VLRORCADO  =:VALOR ');
               end
               else  // if cCalcOR = 'O'
               begin
                  SQL.Add('VLRREALIZADO =:VALOR ');
               end;  // if cCalcOR = 'O'

               SQL.Add('WHERE (IDPLANOORCAMEN =:IDPLANOORCAMEN) AND ');
               SQL.Add('      (IDCONTAORCAMEN =:IDCONTAORCAMEN) AND ');
               SQL.Add('      (EXERCICIO      =:EXERCICIO) AND ');
               SQL.Add('      (IDPESSOA       =:IDPESSOA)');

               Prepare;
               ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
               ParamByName('IDCONTAORCAMEN').AsString  := CdsContas.FieldByName('IDCONTAORCAMEN').AsString;
               ParamByName('EXERCICIO').asInteger      := StrToInt(pdblkExerciciotext);
               ParamByName('IDPESSOA').AsInteger       := idEmpresa;
               ParamByName('VALOR').AsFloat            := rValor;

               AtualizaTabela(SQLChanged);
            end;  // if CdsSaldos.IsEmpty
         end;  // if trim(pdblcCenarioText) <> ''
      end;  // with dtmGeraDados.SQLSaldos
   end;  // if not(edtStatus.Tag = -1)
end;



procedure TCtrlGeraDados.SelecionaComposicao(sConta: String; iPlano: Double; cCalcOR, cTipoCalc: Char);
begin
   // Seleciona as Composições das Contas Orcamentárias
   with dtmGeraDados.SQLComposicao do
   begin
      CdsComposicao.Close;
      dtmGeraDados.SQLComposicao.SQL.Delete(17);

      if cTipoCalc = 'P' then
      begin
         dtmGeraDados.SQLComposicao.SQL.Insert(17,'   (C.PLACONTA IS NOT NULL) AND (C.PLANO = '+ FloatToStr(iPlanoContabil)+')');
      end
      else  // if cTipoCalc = 'P'
      begin
         if cTipoCalc = 'X' then
         begin
            dtmGeraDados.SQLComposicao.SQL.Insert(17,'   (C.CODTIPRECDES IS NOT NULL)');
         end
         else  // if cTipoCalc = 'X'
         begin
            if (cTipoCalc = 'F') and (cCalcOR = 'O') then
            begin
              dtmGeraDados.SQLComposicao.SQL.Insert(17,'   (C.IDCONTAREFORCADO IS NOT NULL)');
            end
            else  // if (cTipoCalc = 'F') and (cCalcOR = 'O')
            begin
               if (cTipoCalc = 'F') and (cCalcOR = 'R') then
               begin
                  dtmGeraDados.SQLComposicao.SQL.Insert(17,'   (C.IDCONTAREFREAL IS NOT NULL)');
               end
               else  // if (cTipoCalc = 'F') and (cCalcOR = 'R')
               begin
                  if (cTipoCalc = 'C') then
                  begin
                     dtmGeraDados.SQLComposicao.SQL.Insert(17,'   (C.IDCONTACONDINI IS NOT NULL)');
                  end
                  else  // if (cTipoCalc = 'C')
                  begin
                     dtmGeraDados.SQLComposicao.SQL.Insert(17,'   (1 = 1)');
                  end;  // if (cTipoCalc = 'C')
               end;  // if (cTipoCalc = 'F') and (cCalcOR = 'R')
            end;  // if (cTipoCalc = 'F') and (cCalcOR = 'O')
         end;  // if cTipoCalc = 'X'
      end;  // if cTipoCalc = 'P'

      if not(Prepared) then Prepare;
      ParamByName('PLANO').asFloat  := iPlano;
      ParamByName('CONTA').asString := sConta;
      CdsComposicao.Data := GetDataPacket(SQLChanged);
      CdsComposicao.First;
   end;  // with dtmGeraDados.SQLComposicao
end;



function TCtrlGeraDados.TestaCalculada(sConta  : String;
                                       cCalcOr : Char
                                      ): Boolean;
begin
   //Teste se a conta recebida já está calculada
   Result := True;

   // caso seja uma conta orcada
   if cCalcOr = 'O' then
   begin
      CdsContasAuxO.Close;

      if not(dtmGeraDados.SQLContasAuxO.Prepared) then dtmGeraDados.SQLContasAuxO.Prepare;
      dtmGeraDados.SQLContasAuxO.ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      dtmGeraDados.SQLContasAuxO.ParamByName('IDCONTAORCAMEN').AsString  := Trim(sConta);

      CdsContasAuxO.Data := GetDataPacket(dtmGeraDados.SQLContasAuxO.SQLChanged);

      if CdsContasAuxO.FieldByName('FLGCALCORCADO').AsString = 'N' then Result := False;
   end
   else  // if cCalcOr = 'O'
   begin
      // caso seja uma conta realizada
      CdsContasAuxR.Close;

      if not(dtmGeraDados.SQLContasAuxR.Prepared) then dtmGeraDados.SQLContasAuxR.Prepare;
      dtmGeraDados.SQLContasAuxR.ParamByName('IDPLANOORCAMEN').AsInteger := iPlanoOrc;
      dtmGeraDados.SQLContasAuxR.ParamByName('IDCONTAORCAMEN').AsString  := Trim(sConta);
      CdsContasAuxR.Data := GetDataPacket(dtmGeraDados.SQLContasAuxR.SQLChanged);

      if CdsContasAuxR.FieldByName('FLGCALCREAL').AsString = 'N' then Result := False;
   end;  // if cCalcOr = 'O'
end;



function TCtrlGeraDados.TransformaContas(sFormula                    : String;
                                         dDataCorrente               : TDateTime;
                                         cCalcOR                     : Char;
                                         cTipoCalc                   : Char;
                                         bSaldoAnterior              : Boolean;
                                         pdblcCenarioText            : String;
                                         pdblkExercicioLookupValue   : String;
                                         pdblcCenarioLookupValue     : String
                                        ): String;
var
   i, j, k  : Integer;
   iInicio  : Integer;
   iFim     : Integer;
   iTamanho : Integer;
   sValor   : String;
begin
   //Pega as Contas presentes na fórmula e as transforma em valores
   //para serem processadas pelo parser

   iTamanho := length(sFormula);

   //Faz a varredura das contas e as substitui
   for k := 1 to length(sFormula) do
   begin
      for i := 1 to iTamanho do
      begin
         if sFormula[i] in ['C'] then
         begin
            iInicio := i;

            for j := (i + 1) to iTamanho do
            begin
               if not(sFormula[j] in ['0'..'9', 'C']) then
               begin
                  iFim := j;

                  bTestaCalculada := TestaCalculada(copy(sFormula, (iInicio + 1), (iFim - (iInicio + 1))), cCalcOR);

                  if not(bTestaCalculada) then
                  begin
                     Result := '';
                     Exit;
                  end;

                  sValor := PegaValorContas(copy(sFormula, iInicio, (iFim - iInicio)),
                                            dDataCorrente,
                                            cCalcOR,
                                            cTipoCalc,
                                            bSaldoAnterior,
                                            pdblcCenarioText,
                                            pdblkExercicioLookupValue,
                                            pdblcCenarioLookupValue
                                           );

                  Delete(sFormula, iInicio, (iFim-iInicio));
                  Insert(sValor, sFormula, iInicio);
                  iTamanho := length(sFormula);
                  Break;
               end;  // if not(sFormula[j] in ['0'..'9', 'C'])
            end;  // for j := (i + 1) to iTamanho

            Break;
         end
         else  // if sFormula[i] in ['C']
         begin

            //apontes - tratamento de grupo (??)

         end;
      end;  // for i := 1 to iTamanho
   end;  // for k := 1 to length(sFormula)

   //Rotina necessária caso haja uma conta no final da fórmula
   for i := 1 to length(sFormula) do
   begin
      if sFormula[i] in ['C'] then
      begin
         iInicio := i;

         bTestaCalculada := TestaCalculada(copy(sFormula, (iInicio + 1), (length(sFormula) -1)), cCalcOR);

         if not(bTestaCalculada) then
         begin
            Result := '';
            Exit;
         end;

         sValor := PegaValorContas(copy(sFormula, iInicio, length(sFormula)),
                                   dDataCorrente,
                                   cCalcOR,
                                   cTipoCalc,
                                   bSaldoAnterior,
                                   pdblcCenarioText,
                                   pdblkExercicioLookupValue,
                                   pdblcCenarioLookupValue
                                  );


         Delete(sFormula, iInicio, length(sFormula));
         Insert(sValor, sFormula, iInicio);
      end
      else  // if sFormula[i] in ['C']
      begin

            //apontes - tratamento de grupo (??)

      end;  // if sFormula[i] in ['C']
   end;

   //Varre a fórmula e troca todas as possíveis vírgulas por pontos
   //(o Parser não interpreta vírgulas)
   for i := 1 to length(sFormula) do
   begin
      if sFormula[i] in [','] then
      begin
         Delete(sFormula, i, 1);
         Insert('.', sFormula, i);
      end;
   end;

   Result := sFormula;
end;



function TCtrlGeraDados.PegaValorContas(sConta                    : String;
                                        dDataCorrente             : TDateTime;
                                        cCalcOR                   : Char;
                                        cTipoCalc                 : Char;
                                        bSaldoAnterior            : Boolean;
                                        pdblcCenarioText          : String;
                                        pdblkExercicioLookupValue : String;
                                        pdblcCenarioLookupValue   : String
                                       ): String;
var
   sTipoConta        : String;
   sSoConta          : String;
   dDataReferencia   : TDateTime;
begin
   sTipoConta        := copy(sConta, 1, 1);                    // Pega qual o identificador da conta (C, S, A)
   sSoConta          := copy(sConta, 2, (length(sConta) - 1)); // Pega qual é a conta sem o identificador
   dDataReferencia   := dDataCorrente;

   with dtmGeraDados.SQLVerificaSinal do
   begin
      CdsVerificaSinal.Close;

      if not(Prepared) then Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
      ParamByName('IDCONTAORCAMEN').AsString  := sSoConta;

      CdsVerificaSinal.Data := GetDataPacket(SQLChanged);
   end;

   // Retorna o Valor da Conta presente na fórmula
   with dtmGeraDados.SQLFormula do
   begin
      CdsFormula.Close;
      SQL.Clear;
      if trim(pdblcCenarioText) <> '' then
      begin
         if bSaldoAnterior then
         begin
            SQL.Add('SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO FROM ');
            SQL.Add('VALORESCENARIO ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('      (PERIODO IS NULL) AND ');
            SQL.Add('      (IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('      (IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('      (IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('      (IDCONTAORCAMEN =:CONTA) ');
         end
         else  // if bSaldoAnterior
         begin
            SQL.Add('SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO FROM ');
            SQL.Add('VALORESCENARIO ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('      (PERIODO =:PERIODO) AND ');
            SQL.Add('      (IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('      (IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('      (IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('      (IDCONTAORCAMEN =:CONTA) ');
         end;  // if bSaldoAnterior
      end
      else  // if trim(pdblcCenarioText) <> ''
      begin
         if bSaldoAnterior then
         begin
            SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO FROM ');
            SQL.Add('SALDOORCADOANT ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('(IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('(IDCONTAORCAMEN =:CONTA) ');
         end
         else  // if bSaldoAnterior
         begin
            if cTipoCalc = 'N' then
            begin
               SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO FROM ');
            end
            else  // if cTipoCalc = 'N'
            begin
               SQL.Add('SELECT SUM(VLRORCACUM) AS VLRORCADO, SUM(VLRREALACUM) AS VLRREALIZADO FROM ');
            end;  // if cTipoCalc = 'N'

            SQL.Add(PrefixoServidor + 'SALDOORCADO ');
            if sGeraMes = 'S' then
               SQL.Add('WHERE (TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATA) AND ')
            else
               SQL.Add('WHERE (DATAREFERENCIA =:DATA) AND ');

            SQL.Add('(IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('(IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('(IDCONTAORCAMEN =:CONTA) ');
         end;
      end;  // // if trim(pdblcCenarioText) <> ''

      if not(Prepared) then Prepare;

      if trim(pdblcCenarioText) <> '' then
      begin
         ParamByName('EXERCICIO').AsInteger         := StrToInt(pdblkExercicioLookupValue);
         ParamByName('IDCENARIOORCAMEN').AsInteger  := StrToInt(pdblcCenarioLookupValue);
         if not(bSaldoAnterior) then ParamByName('PERIODO').AsInteger  := iPeriodoAtu;
      end
      else  // if trim(pdblcCenarioText) <> ''
      begin
         if bSaldoAnterior then
         begin
            ParamByName('EXERCICIO').AsInteger  := StrToInt(pdblkExercicioLookupValue);
         end
         else
         begin
            DecodeDate(dDataReferencia, iAno, iMes, iDia);
            if sGeraMes = 'S' then
               ParamByName('DATA').AsString   := FormatFloat('0000', iAno) + FormatFloat('00', iMes )
               // Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
            else
               ParamByName('DATA').AsDateTime := dDataReferencia;
         end;
      end;  // if trim(pdblcCenarioText) <> ''

      ParamByName('IDPESSOA').AsInteger := idEmpresa;
      ParamByName('PLANO').AsInteger    := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
      ParamByName('CONTA').AsString     := sSoConta;

      CdsFormula.Data := GetDataPacket(SQLChanged);

      if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then
      begin
         Result := '0';
      end
      else  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
      begin
         if cCalcOR = 'O' then
         begin
            if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'P' then
               Result := FloatToStr(CdsFormula.FieldByName('VLRORCADO').asFloat)
            else
               Result := FloatToStr(CdsFormula.FieldByName('VLRORCADO').asFloat * (-1));
         end
         else  // if cCalcOR = 'O'
         begin
            if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'P' then
               Result := FloatToStr(CdsFormula.FieldByName('VLRREALIZADO').asFloat)
            else
               Result := FloatToStr(CdsFormula.FieldByName('VLRREALIZADO').asFloat * (-1));
         end;  // if cCalcOR = 'O'
      end;  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
   end;
end;



function TCtrlGeraDados.PegaValorContasPorGrupo(sConta                    : String;
                                                dDataCorrente             : TDateTime;
                                                cCalcOR                   : Char;
                                                cTipoCalc                 : Char;
                                                bSaldoAnterior            : Boolean;
                                                pdblcCenarioText          : String;
                                                pdblkExercicioLookupValue : String;
                                                pdblcCenarioLookupValue   : String
                                               ): String;
var
   sSoConta          : String;
   dDataReferencia   : TDateTime;
begin
   sSoConta          := copy(sConta, 2, (length(sConta) - 1));
   dDataReferencia   := dDataCorrente;

   with dtmGeraDados.SQLVerificaSinal do
   begin
      CdsVerificaSinal.Close;

      if not(Prepared) then Prepare;
      ParamByName('IDPLANOORCAMEN').AsInteger := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
      ParamByName('IDCONTAORCAMEN').AsString  := sSoConta;

      CdsVerificaSinal.Data := GetDataPacket(SQLChanged);
   end;

   // Retorna o Valor da Conta presente na fórmula
   with dtmGeraDados.SQLFormula do
   begin
      CdsFormula.Close;
      SQL.Clear;
      if trim(pdblcCenarioText) <> '' then
      begin
         if bSaldoAnterior then
         begin
            SQL.Add('SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO FROM ');
            SQL.Add('VALORESCENARIO ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('      (PERIODO IS NULL) AND ');
            SQL.Add('      (IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('      (IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('      (IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('      (IDCONTAORCAMEN =:CONTA) ');
         end
         else  // if bSaldoAnterior
         begin
            SQL.Add('SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO FROM ');
            SQL.Add('VALORESCENARIO ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('      (PERIODO =:PERIODO) AND ');
            SQL.Add('      (IDCENARIOORCAMEN =:IDCENARIOORCAMEN) AND ');
            SQL.Add('      (IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('      (IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('      (IDCONTAORCAMEN =:CONTA) ');
         end;  // if bSaldoAnterior
      end
      else  // if trim(pdblcCenarioText) <> ''
      begin
         if bSaldoAnterior then
         begin
            SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO FROM ');
            SQL.Add('SALDOORCADOANT ');
            SQL.Add('WHERE (EXERCICIO =:EXERCICIO) AND ');
            SQL.Add('(IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('(IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('(IDCONTAORCAMEN =:CONTA) ');
         end
         else  // if bSaldoAnterior
         begin
            if cTipoCalc = 'N' then
            begin
               SQL.Add('SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO FROM ');
            end
            else  // if cTipoCalc = 'N'
            begin
               SQL.Add('SELECT SUM(VLRORCACUM) AS VLRORCADO, SUM(VLRREALACUM) AS VLRREALIZADO FROM ');
            end;  // if cTipoCalc = 'N'

            SQL.Add(PrefixoServidor + 'SALDOORCADO ');
            if sGeraMes = 'S' then
               SQL.Add('WHERE (TO_CHAR(DATAREFERENCIA,''YYYYMM'') =:DATA) AND ')
            else
               SQL.Add('WHERE (DATAREFERENCIA =:DATA) AND ');

            SQL.Add('(IDPLANOORCAMEN =:PLANO) AND ');
            SQL.Add('(IDPESSOA =:IDPESSOA) AND ');
            SQL.Add('(IDCONTAORCAMEN =:CONTA) ');
         end;
      end;  // // if trim(pdblcCenarioText) <> ''

      if not(Prepared) then Prepare;

      if trim(pdblcCenarioText) <> '' then
      begin
         ParamByName('EXERCICIO').AsInteger         := StrToInt(pdblkExercicioLookupValue);
         ParamByName('IDCENARIOORCAMEN').AsInteger  := StrToInt(pdblcCenarioLookupValue);
         if not(bSaldoAnterior) then ParamByName('PERIODO').AsInteger  := iPeriodoAtu;
      end
      else  // if trim(pdblcCenarioText) <> ''
      begin
         if bSaldoAnterior then
         begin
            ParamByName('EXERCICIO').AsInteger  := StrToInt(pdblkExercicioLookupValue);
         end
         else
         begin
            DecodeDate(dDataReferencia, iAno, iMes, iDia);
            if sGeraMes = 'S' then
               ParamByName('DATA').AsString   := FormatFloat('0000', iAno) + FormatFloat('00', iMes )
               // Biblioteca.ZD(trim(IntToStr(iAno)),4)+Biblioteca.ZD(trim(IntToStr(iMes)),2)
            else
               ParamByName('DATA').AsDateTime := dDataReferencia;
         end;
      end;  // if trim(pdblcCenarioText) <> ''

      ParamByName('IDPESSOA').AsInteger := idEmpresa;
      ParamByName('PLANO').AsInteger    := CdsContas.FieldByName('IDPLANOORCAMEN').AsInteger;
      ParamByName('CONTA').AsString     := sSoConta;

      CdsFormula.Data := GetDataPacket(SQLChanged);

      if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I' then
      begin
         Result := '0';
      end
      else  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
      begin
         if cCalcOR = 'O' then
         begin
            if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'P' then
               Result := FloatToStr(CdsFormula.FieldByName('VLRORCADO').asFloat)
            else
               Result := FloatToStr(CdsFormula.FieldByName('VLRORCADO').asFloat * (-1));
         end
         else  // if cCalcOR = 'O'
         begin
            if CdsVerificaSinal.FieldByName('FLGSINALCONTA').AsString = 'P' then
               Result := FloatToStr(CdsFormula.FieldByName('VLRREALIZADO').asFloat)
            else
               Result := FloatToStr(CdsFormula.FieldByName('VLRREALIZADO').asFloat * (-1));
         end;  // if cCalcOR = 'O'
      end;  // if CdsVerificaSinal.FieldByName('FLGATIVA').AsString = 'I'
   end;
end;



function TCtrlGeraDados.AtualizaTabela(const sSQL: String): Boolean;
begin
   if (ConnectionSide = cnsClient) then
   begin
      Result := Connection.AppServer.AtualizaTabela(sSQL);

      if not(Result) then MessageInfo := Connection.AppServer.MessageInfo;
   end
   else
   begin
      try
         ExecSQL(sSQL);
         Result := True;
      except
         on E : Exception do
         begin
            MessageInfo := E.Message;
            Result      := False;
         end;
      end;
   end;
end;







procedure TCtrlGeraDados.SetCdsAcumulado2(const Value: TClientDataSet);
begin
   FCdsAcumulado2 := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado2Ant(const Value: TClientDataSet);
begin
   FCdsAcumulado2Ant := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado2CAnt(const Value: TClientDataSet);
begin
   FCdsAcumulado2CAnt := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado2M(const Value: TClientDataSet);
begin
   FCdsAcumulado2M := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado2MC(const Value: TClientDataSet);
begin
   FCdsAcumulado2MC := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado3(const Value: TClientDataSet);
begin
   FCdsAcumulado3 := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado3M(const Value: TClientDataSet);
begin
   FCdsAcumulado3M := Value;
end;

procedure TCtrlGeraDados.SetCdsAcumulado3MC(const Value: TClientDataSet);
begin
   FCdsAcumulado3MC := Value;
end;

procedure TCtrlGeraDados.SetCdsCenario(const Value: TClientDataSet);
begin
   FCdsCenario := Value;
end;

procedure TCtrlGeraDados.SetCdsCompContas(const Value: TClientDataSet);
begin
   FCdsCompContas := Value;
end;

procedure TCtrlGeraDados.SetCdsComposicao(const Value: TClientDataSet);
begin
   FCdsComposicao := Value;
end;

procedure TCtrlGeraDados.SetCdsContabilidade(const Value: TClientDataSet);
begin
   FCdsContabilidade := Value;
end;

procedure TCtrlGeraDados.SetCdsContas(const Value: TClientDataSet);
begin
   FCdsContas := Value;
end;

procedure TCtrlGeraDados.SetCdsContasAux(const Value: TClientDataSet);
begin
   FCdsContasAux := Value;
end;

procedure TCtrlGeraDados.SetCdsContasAuxO(const Value: TClientDataSet);
begin
   FCdsContasAuxO := Value;
end;

procedure TCtrlGeraDados.SetCdsContasAuxR(const Value: TClientDataSet);
begin
   FCdsContasAuxR := Value;
end;

procedure TCtrlGeraDados.SetCdsDataview(const Value: TClientDataSet);
begin
   FCdsDataview := Value;
end;

procedure TCtrlGeraDados.SetCdsDeletaValores(const Value: TClientDataSet);
begin
   FCdsDeletaValores := Value;
end;

procedure TCtrlGeraDados.SetCdsExercicio(const Value: TClientDataSet);
begin
   FCdsExercicio := Value;
end;

procedure TCtrlGeraDados.SetCdsFlagCalculo(const Value: TClientDataSet);
begin
   FCdsFlagCalculo := Value;
end;

procedure TCtrlGeraDados.SetCdsFluxo(const Value: TClientDataSet);
begin
   FCdsFluxo := Value;
end;

procedure TCtrlGeraDados.SetCdsFormula(const Value: TClientDataSet);
begin
   FCdsFormula := Value;
end;

procedure TCtrlGeraDados.SetCdsGenericos(const Value: TClientDataSet);
begin
   FCdsGenericos := Value;
end;

procedure TCtrlGeraDados.SetCdsLancOrc(const Value: TClientDataSet);
begin
   FCdsLancOrc := Value;
end;

procedure TCtrlGeraDados.SetCdsNaoCalculadas(const Value: TClientDataSet);
begin
   FCdsNaoCalculadas := Value;
end;

procedure TCtrlGeraDados.SetCdsPeriodo(const Value: TClientDataSet);
begin
   FCdsPeriodo := Value;
end;

procedure TCtrlGeraDados.SetCdsPeriodoContab(const Value: TClientDataSet);
begin
   FCdsPeriodoContab := Value;
end;

procedure TCtrlGeraDados.SetCdsPeriodoIni(const Value: TClientDataSet);
begin
   FCdsPeriodoIni := Value;
end;

procedure TCtrlGeraDados.SetCdsPlanoData(const Value: TClientDataSet);
begin
   FCdsPlanoData := Value;
end;

procedure TCtrlGeraDados.SetCdsSaldos(const Value: TClientDataSet);
begin
   FCdsSaldos := Value;
end;

procedure TCtrlGeraDados.SetCdsVerificaSinal(const Value: TClientDataSet);
begin
   FCdsVerificaSinal := Value;
end;

procedure TCtrlGeraDados.SetedtConta(const Value: TEdit);
begin
   FedtConta := Value;
end;

procedure TCtrlGeraDados.SetedtData(const Value: TEdit);
begin
   FedtData := Value;
end;

procedure TCtrlGeraDados.SetedtStatus(const Value: TEdit);
begin
   FedtStatus := Value;
end;

procedure TCtrlGeraDados.SetedtTipo(const Value: TEdit);
begin
   FedtTipo := Value;
end;

procedure TCtrlGeraDados.SetIdEmpresa(const Value: Integer);
begin
   FIdEmpresa := Value;
end;

procedure TCtrlGeraDados.SetIdModulo(const Value: Integer);
begin
   FIdModulo := Value;
end;

procedure TCtrlGeraDados.SetIdUsuario(const Value: Integer);
begin
   FIdUsuario := Value;
end;

procedure TCtrlGeraDados.SetiPeriodoAtu(const Value: Integer);
begin
   FiPeriodoAtu := Value;
end;

procedure TCtrlGeraDados.SetiPeriodoFim(const Value: Integer);
begin
   FiPeriodoFim := Value;
end;

procedure TCtrlGeraDados.SetiPeriodoIni(const Value: Integer);
begin
   FiPeriodoIni := Value;
end;

procedure TCtrlGeraDados.SetiPlanoContabil(const Value: Double);
begin
   FiPlanoContabil := Value;
end;

procedure TCtrlGeraDados.SetIPlanoOrc(const Value: Integer);
begin
   FIPlanoOrc := Value;
end;

procedure TCtrlGeraDados.SetmemErroNaGeracao(const Value: TRichEdit);
begin
   FmemErroNaGeracao := Value;
end;

procedure TCtrlGeraDados.SetpbAguarde(const Value: TProgressBar);
begin
   FpbAguarde := Value;
end;

procedure TCtrlGeraDados.SetPrefixoServidor(const Value: String);
begin
   FPrefixoServidor := Value;
end;

procedure TCtrlGeraDados.SetsGeraMes(const Value: String);
begin
   FsGeraMes := Value;
end;

procedure TCtrlGeraDados.SetsLog1(const Value: String);
begin
   FsLog1 := Value;
end;

procedure TCtrlGeraDados.SetsLog2(const Value: String);
begin
   FsLog2 := Value;
end;

procedure TCtrlGeraDados.SetsLog3(const Value: String);
begin
   FsLog3 := Value;
end;

procedure TCtrlGeraDados.SetsLog4(const Value: String);
begin
   FsLog4 := Value;
end;

procedure TCtrlGeraDados.SetsLog5(const Value: String);
begin
   FsLog5 := Value;
end;

procedure TCtrlGeraDados.SetCdsAcum2(const Value: TClientDataSet);
begin
   FCdsAcum2 := Value;
end;

procedure TCtrlGeraDados.SetCdsAcum3(const Value: TClientDataSet);
begin
   FCdsAcum3 := Value;
end;



end.
