// Alterações:
{-------------------------------------------------------------------------------------------------
Rotina......: GravaSaldoCalculado
Autor.......: Wylliam Leite da Silva
Data........: 11/03/2015
Nº SOL......: 249911
Nº PPM......: 702263
Descrição...: Correção do field "Grupo"
--------------------------------------------------------------------------------------------------
Rotina......: ExecutaGeracaoDados
Autor.......: Higor Nayde Ferreia
Data........: 26/12/2013
Nº SOL......: 204073/15674
Nº KINTANA..: 2058529
Descrição...: Ajuste na geração de dados
--------------------------------------------------------------------------------------------------
Rotina......: ExecutaGeracaoDados, GravaSaldoCalculado
Autor.......: William Santana
Data........: 20/08/2013
Nº SOL......: 204073
Nº KINTANA..: 1974951
Descrição...: Evolução no processo de Geração de Dados.
 --------------------------------------------------------------------------------------------------
Rotina......: CalculaContabil
Nº SOL......: 193936
Nº KINTANA..: 1852777
Data........: 08/11/2012
Responsável.: Edilaine Ferraresi
Descrição...: acrescentar o start da transação quando houver commit intermediário
{ --------------------------------------------------------------------------------------------------
Rotina......: ExecutaGeracaoDados
Nº SOL......: 190626
Nº KINTANA..: 1803612
Data........: 20/09/2012
Responsável.: Edilaine Ferraresi
Descrição...: na geração de dados, forçar o commit a cada 5000 mil instruções e salvar bloco de
              queries na pasta  c:\planus\temp\geracaodados????.sql
{--------------------------------------------------------------------------------------------------
Rotina......: ExecutaGeracaoDados, CalculaValorRealizado, CalculaContabil, GravaSaldoCalculado
Nº SOL......: 185723
Nº KINTANA..: 1742408
Data........: 25/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: melhor performance da rotina de importação
{--------------------------------------------------------------------------------------------------
Rotina......: ListaPlanoOrcamento
Nº SOL......: 172383-7764
Nº KINTANA..: 1556975
Data........: 19/03/2012
Responsável.: Edilaine Ferraresi
Descrição...: inclusão do parâmetro Plano Orçamentário
--------------------------------------------------------------------------------------------------}
// Rotina......: ExecutaGeracaoDados
// Nº SOL......: 175588
// Nº KINTANA..: 1600204
// Data........: 06/03/2012
// Responsável.: Edilaine Ferraresi
// Descrição...: calculo de valores realizados não carrega novos parametros definidos apos a
//               execução da mesma rotina para um outro grupo orçamentario.
//--------------------------------------------------------------------------------------------------
// Rotina......: CalculaContabil
// Nº SOL......: 169825
// Nº KINTANA..: 1508149
// Data........: 08/12/2011
// Responsável.: Ricardo de Freitas Araújo
// Descrição...: Nas consultas de valores de crédito e débito, deverá retornar somente
//               registros das contas contábeis do plano orçamentário vigente.
//--------------------------------------------------------------------------------------------------
// Rotina......: Toda a Controle
// Nº SOL......: 168266
// Nº KINTANA..: 1481776
// Data........: 11/11/2011
// Responsável.: Ricardo de Freitas Araújo
// Descrição...: Melhoramento de Perfomance da Rotina, retirando chamadas de rotinas
//               que não não utilizadas até este dado momento
//--------------------------------------------------------------------------------------------------
// Rotina......: CalculaOrcado
// Nº SOL......: 163900
// Nº KINTANA..: 1403193
// Data........: 13/09/2011
// Responsável.: Ricardo de Freitas Araújo
// Descrição...: Adicionado os parâmetros de programa e Tipo de Despesa para valores orçados
//--------------------------------------------------------------------------------------------------
// Rotina......: CalculaContabil
// Nº SOL......: 163871
// Nº KINTANA..: 1402882
// Data........: 12/09/2011
// Responsável.: Ricardo de Freitas Araújo
// Descrição...: Adicionado os parâmetros de programa e Tipo de Despesa
//--------------------------------------------------------------------------------------------------
// Rotina......: CalculaContabil
// Nº SOL......: 160539/5921
// Nº KINTANA..: 1374082
// Data........: 29/07/2011
// Responsável.: Ricardo de Freitas Araújo
// Descrição...: Alterado rotina pra salvar os valores de saldo de débito na SALDOORCADO.

// Rotina......: SelContasOrcamen
// Descrição...: Comentado filtro por plano orçamentário
//--------------------------------------------------------------------------------------------------
// Rotina......: CalculaContabil
// Nº SOL......: 160539
// Nº KINTANA..: 1349786
// Data........: 12/07/2011
// Responsável.: Ricardo de Freitas Araújo
// Descrição...: Alterado rotina pra salvar os valores de saldo de débito e
//               crédito na SALDOORCADO.
// Rotina......: GravaSaldoCalculado
// Descrição...: Adicionado parâmetros para salvar os valores de saldo de débito
// e crédito na SALDOORCADO.
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 08/09/2009
// Sol........: 148641
// Kintana....: 1047972
// Descrição..: Correção da Rotina SelCompContasOrcamen, que fazia a avaliação
//              de um campo data convertendo para MM/YYYY para YYYYMM.
//------------------------------------------------------------------------------
//
// Autor......: Arnaldo V. Scarin
// Data.......: 08/09/2009
// Sol........: 123436
// Kintana....: 616983
// Descrição..: Alteração da Rotina de Centro de Custos, para desvincular a
//              obrigatoriedade de informar as contas de centro de custos quando
//              o flag de centro de custos estiver desmarcado.
//
//------------------------------------------------------------------------------
{ --------------------------------------------------------------------------------------------------
Data       : 06/08/2009
Autor      : Bruno Bastos
Sol_Kintana: 122508_604232
Descrição  : Criação da tabela DeParaCCHist para tratar na geração de dados os registros antigos re_
             gistrados na PlanoSaldo.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Data       : 03/08/2009
Autor      : Bruno Bastos
Sol_Kintana: 122509_604235
Descrição  : Não considerar valores de encerramento de resultado.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Data      : 15/05/2006
Autor     : Rodolpho da Silva
Pendencia : 22283
Descrição : Implementado rotinas para a geração de dados por grupo de contas
---------------------------------------------------------------------------------------------------}
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
   Provider, uCMSQLParams, uCMTypes, uCtrlPadroes, uString, uDtmGeraDados, Classes, Math,
   Parser10, uCMMath, uDiasUteis, Dialogs;

type
   tConteudoFormula = (tcGrupo,tcConta,tcOutros);


type
   TCtrlGeraDados = Class(TCmControlObject)

   protected

      procedure DoChangeDataBase; override;
      procedure OnCreateAppServer; override;


   private
      pParser : TParser;
      _CdsCompContas,_CdsAux: TClientDataSet;
      //Variáveis para controle de posição do FormProgresso
      iProgIni,iProgCorr,iProgFim: integer;

      DsContasOrc, DsCompContasOrc: TDataSet;

      //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
      CdsParamContab       : TClientDataSet;

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

      FsLog6               : String; //William Santana SOL 204073

      FiPeriodoAtu         : Integer;
      FiPlanoContabil      : Integer;

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

      iNumBloco            : integer;    // Edilaine - SOL 190626 / KTN 1803612
      bComitaPeriodo       : boolean;    // Edilaine - SOL 190626 / KTN 1803612

      bValidacaoFDO        : boolean;    //William Santana SOL 204073 KIN 1974951

      //1.1
      function ZeraValoresGerado(iPerIni,iPerFim,iExercicio,iTipoGer,iIdPlanoOrc,iIdEmpresa,iPosIni,iQtdDigitos: integer;
                                 sConteudo: string;
                                 bSaldoAnterior, bPorGrupo: boolean; iIdCenario: integer = -1): boolean;
      //1.2
      function ZeraFlgCalculo(iIdTipoGer,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdEmpresa: integer; sConteudo: string; bPorGrupo: boolean): boolean;

      //----------------------------------------------------------------------------------
      //1.3   Cálculo do Orçado
      //----------------------------------------------------------------------------------
      function CalculaValorOrcado(dDataPerCorrente: TDateTime; iDiasPeriodo,iPosIni,iQtdDigitos,
                                  iPeriodo,iIdPlanoOrc,iExercicio,iIdPessoa,iIdCenario: integer; sConteudo: string;
                                  bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior: boolean;
                                  const lstBloco : TStringList = nil): boolean;  // Edilaine - SOL 185723 / KTN 1742408

      //1.3.1 - 1.4.4
      function CalculaValorFixoInformado(sOrcOuReal,sConteudo: string;
                                         iPosIni,iQtdDigitos,iMesCorrente,
                                         iExercicio,iIdPlanoOrc,
                                         iIdPessoa,iDiasPeriodo,iIdCenario: integer;
                                         bPorGrupo,bCalculaPorPeriodo: boolean;
                                         dDataPerCorrente: TDateTime;
                                         const lstBloco : TStringList = nil  // Edilaine - SOL 185723 / KTN 1742408
                                         ): boolean;
      //1.3.2 - 1.4.6
      function CalculaCompOutrasContas(cOrcadoOuReal: Char;
                                       sConteudo: string;
                                       iPosIni,iQtdDigitos,iIdPlanoOrc,
                                       iIdCenario,iIdPessoa,iExercicio,iPeriodo: integer;
                                       bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior: boolean;
                                       dDataCorrente: TDateTime;
                                       const lstBloco : TStringList = nil  // Edilaine - SOL 185723 / KTN 1742408
                                       ): boolean;
      //1.3.3 - 1.4.5
      function CalculaContasAcumulado(cOrcadoOuReal: Char;
                                      sConteudo: string;
                                      iIdPessoa,iIdCenario,iPeriodo,
                                      iExercicio,iIdPlanoOrc,
                                      iPosIni,iQtdDigitos: integer;
                                      bPorGrupo,bCalculaSaldoAnterior,
                                      bCalculaPorPeriodo: boolean;
                                      dDataCorrente: TDateTime;
                                      const lstBloco : TStringList = nil  // Edilaine - SOL 185723 / KTN 1742408
                                      ): boolean;
      //1.3.4 - 1.4.7
      function CalculaContasCondicional(cOrcadoOuReal: Char;
                                        sConteudo: string;
                                        iIdPessoa,iIdCenario,iPeriodo,
                                        iExercicio,iIdPlanoOrc,
                                        iPosIni,iQtdDigitos: integer;
                                        bPorGrupo,bCalculaSaldoAnterior,
                                        bCalculaPorPeriodo: boolean;
                                        dDataCorrente: TDateTime;
                                        const lstBloco : TStringList = nil  // Edilaine - SOL 185723 / KTN 1742408
                                        ): boolean;
     //1.3.5 - 1.4.8
     function CalculaFormulaContas(cOrcadoOuReal: Char;
                                   sConteudo: string;
                                   iIdPessoa,iIdCenario,iPeriodo,
                                   iExercicio,iIdPlanoOrc,
                                   iPosIni,iQtdDigitos: integer;
                                   bPorGrupo,bCalculaSaldoAnterior,
                                   bCalculaPorPeriodo: boolean;
                                   dDataCorrente: TDateTime;
                                   const lstBloco : TStringList = nil  // Edilaine - SOL 185723 / KTN 1742408
                                   ): boolean;



     //----------------------------------------------------------------------------------
     // 1.4 Cálculo do Realizado
     //----------------------------------------------------------------------------------
     function CalculaValorRealizado(dDataPerCorrente: TDateTime; iDiasPeriodo,iPosIni,iQtdDigitos,
                                    iPeriodo,iIdPlanoOrc,iExercicio,iIdPessoa,iIdCenario: integer; sConteudo: string;
                                    bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior: boolean;
                                    const lstBloco : TStringList = nil): boolean;  // Edilaine - SOL 185723 / KTN 1742408

     // 1.4.1
     function CalculaArquivosGenericos(cOrcadoOuReal: Char;
                                       sConteudo: string;
                                       iIdPessoa,iIdCenario,iPeriodo,
                                       iExercicio,iIdPlanoOrc,
                                       iPosIni,iQtdDigitos: integer;
                                       bPorGrupo,bCalculaSaldoAnterior,
                                       bCalculaPorPeriodo: boolean;
                                       dDataCorrente: TDateTime): boolean;

      //1.4.2
      function CalculaContabil(cOrcadoOuReal         : Char;
                               sConteudo             : string;
                               iIdPessoa,
                               iIdCenario,
                               iPeriodo,
                               iExercicio,
                               iIdPlanoOrc,
                               iPosIni,
                               iQtdDigitos           : integer;
                               bPorGrupo,
                               bCalculaSaldoAnterior,
                               bCalculaPorPeriodo    : boolean;
                               dDataCorrente         : TDateTime;
                               const lstBloco : TStringList = nil): Boolean;  // Edilaine - SOL 185723 / KTN 1742408

      //1.4.3
      function CalculaFluxoCaixa(cOrcadoOuReal: Char;
                                 sConteudo: string;
                                 iIdPessoa,iIdCenario,iPeriodo,
                                 iExercicio,iIdPlanoOrc,
                                 iPosIni,iQtdDigitos: integer;
                                 bPorGrupo,bCalculaSaldoAnterior,
                                 bCalculaPorPeriodo: boolean;
                                 dDataCorrente: TDateTime): Boolean;







      // Gerais
      function SelContasOrcamen(sOrcOuReal,sTipoCalcContas,sConteudo: string;
                                iPosIni,iQtdDigitos,iIdPlanoOrc: integer; bPorGrupo: boolean): OleVariant;
      function SelCompContasOrcamen(sIdContaOrcamen : String;
                                    iIdPlanoOrc     : integer;
                                    cOrcadoOuReal,
                                    cTipoCalc       : Char;
                                    //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Início
                                    piPerNumero      : integer = 0;
                                    piPerExercicio   : Integer = 0): OleVariant;
                                    //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Fim


      // 2. É usada na maioria dos métodos. Grava os valores já computados na
      //tabela SALDOORCADO
      function GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa:integer;
                                   sIdContaOrcamen,sOrcOuReal,sFlgSinalConta: string;
                                   rValor,rValorAcum: Double;
                                   dDataCorrente: TDateTime;
                                   rValorCreditoContabil:Double;
                                   rValorDebitoContabil:Double;
                                   const lstBloco : TStringList = nil): boolean;  // Edilaine - SOL 185723 / KTN 1742408

      // É usado para gravar os saldos anteriores na tabela SALDOORCADOANT
      function GravaSaldoCalcAnterior(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa: integer;
                                     sIdContaOrcamen,sOrcOuReal: string;
                                     rValor: Double): boolean;





      // 3. Também é usada na maioria dos métodos. Tem como finalidade de retornar
      //o valor do saldo acumulado
      function CalculaValorDoAcumulado(sOrcOuReal,sFlgAcumulado,
                                       sIdContaOrc,
                                       sFormulaOrcadoReal: string;
                                       rValorDia: Double;
                                       iIdPlanoOrc, iMesCorrente,iExercicio,iIdEmpresa: integer;
                                       bCalcPorPeriodo: boolean;
                                       dDataPerCorrente: TDateTime;
                                       iIdCenario: integer = -1): Double;
      //3.1
      function DecodificaFormula(sFormula: string; cTipoCalc,cOrcadoOuReal: Char;
                                 iIdPlanoOrc,iIdCenario,iPeriodo,iExercicio,iIdPessoa: integer;
                                 bSaldoAnterior,bCalculaPorPeriodo: boolean;
                                 dDataCorrente: TDateTime): string;
      //3.1.1
      function VerificaContaJaCalculada(sContaOuGrupo: string; cOrcadoOuReal: Char;
                                     iIdPlanoOrc: integer; bPorGrupo: boolean): boolean;
      //3.1.1
      function RetornaValorContaParaFormula(sContaOuGrupo: string;
                                            iIdPlanoOrc,iIdCenario,
                                            iPeriodo,iExercicio,iIdPessoa: integer;
                                            bPorGrupo,bSaldoAnterior,bCalculaPorPeriodo: boolean;
                                            cTipoCalc,cOrcadoOuReal: Char;
                                            dDataCorrente: TDateTime): string;








      function GravaLogOperacoesOrc(pIdEmpresa  : Integer;
                                    pIdModulo   : Integer;
                                    pIdUsuario  : Integer;
                                    pLog        : String
                                   ): Boolean;

      function  SelecionaContasNaoCalculadas(cCalcOR: Char): longint;

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
      procedure SetiPlanoContabil(const Value: integer);
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

      procedure SetsLog6(const Value: String); //William Santana SOL 204073 KIN 1974951


   public
      sDataInicio,sDataFim : TDateTime;
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

      // Edilaine - SOL 172383-7764 / KTN 1556975
      function ListaPlanoOrcamento : OleVariant;

      // 1
      function ExecutaGeracaoDados(iIdEmpresa,iIdPlanoOrc,iIdPlanoContab, iExercicio,iPerIni,iPerFim,iIdCenario,iTipoGer,iPosIni,iQtdDigitos: integer;
                                   sConteudo: string; bCalculaPeriodo,bCalculaSaldoAnterior,bCalculaPorGrupo, bCommitar,
                                   bValidaFDO: boolean): boolean; //William Santana SOL: 204073 KIN: 1974951
      function ListaCenarios: OleVariant;                             



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

      property sLog6             : String          read FsLog6             write SetsLog6;    //William Santana SOL 204073 KIN 1974951

      property iPeriodoAtu       : Integer         read FiPeriodoAtu       write SetiPeriodoAtu;

      property iPlanoContabil    : Integer         read FiPlanoContabil    write SetiPlanoContabil;

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
var
   sSQL: string;
begin
   inherited;
   pParser        := TParser.Create(nil);
   iProgIni       := 0;
   iProgCorr      := 0;
   iProgFim       := 0;
   _CdsCompContas := TClientDataSet.Create(nil);
   _CdsAux        := TClientDataSet.Create(nil);

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

   //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
   CdsParamContab    := TClientDataSet.Create(nil);


end;



destructor TCtrlGeraDados.Destroy;
begin
   inherited;
   FreeAndNil(pParser);
   FreeAndNil(_CdsCompContas);
   FreeAndNil(_CdsAux);

   if (isAppServer) then
   begin
      FreeCds([CdsContasAuxR,    CdsVerificaSinal, CdsSaldos,         CdsContasAux,
               CdsPeriodoIni,    CdsContasAuxO,    CdsFluxo,          CdsDeletaValores,
               CdsComposicao,    CdsContabilidade, CdsAcumulado2CAnt, CdsDataview,
               CdsPeriodoContab, CdsPlanoData,     CdsAcumulado2Ant,  CdsFormula,
               CdsAcumulado3MC,  CdsAcumulado3M,   CdsAcumulado3,     CdsCompContas,
               CdsAcumulado2,    CdsAcumulado2M,   CdsAcumulado2MC,   CdsContas,
               CdsGenericos,     CdsFlagCalculo,   CdsLancOrc,        CdsAcum2,
               CdsAcum3,         CdsParamContab]);
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

      CdsPeriodo.Data := GetDataPacket('SELECT DATAINIPERIODO, DATAFIMPERIODO, NOMEPERIODO ' +
                                       'FROM  PERIODOORCAMEN ' +
                                       'WHERE ' +
                                       '    (IDPESSOA  = '  + IntToStr(pIdEmpresa)  + ') AND ' +
                                       '    (EXERCICIO = '  + IntToStr(piExercicio) + ') AND ' +
                                       '    (PERIODO   = '  + IntToStr(piPeriodo)   + ') ');

      if CdsPeriodo.IsEmpty then
      begin
         MessageInfo := 'Não existe este período para este Exercício.';
         CdsPeriodo.Close;
      end
      else
         sLog1  := CdsPeriodo.FieldByName('NOMEPERIODO').AsString + '/' + pdblkExercicioText;



     CdsPlanoData.Data := GetDataPacket('SELECT ' +
                                        '   PD.PLANO, PD.DATAINICIO, PD.DATAFIM, PD.PLANOANTERIOR, P.MASCARA ' +
                                        'FROM ' +
                                        '   PLANODATA PD, PLANO P ' +
                                        'WHERE ' +
                                        '   (TO_DATE(' + QuotedStr(CdsPeriodo.FieldByName('DATAINIPERIODO').AsString) + ',''DD/MM/YYYY'')  BETWEEN PD.DATAINICIO AND PD.DATAFIM) AND ' +
                                        '   (PD.IDPESSOA = ' + IntToStr(pIdEmpresa) + ') AND ' +
                                        '   (PD.PLANO    = P.PLANO) ');

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

       bConcluiuOK := False;
       Exit;
     end;

     //Verifica a cada interação do loop principal se o botão de cancelamento foi acionado
     if (edtStatus.Tag = -1) then begin
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
var
  sSQL: string;

begin
   try
      StartTransaction;

      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog1,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog2,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog3,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog4,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, Copy('Gera Dados - '+sLog5,1,60))) then Abort;
      if not(GravaLogOperacoesOrc(idEmpresa, idModulo, idUsuario, 'Geração de Dados - Apaga Saldos Existentes')) then Abort;

      if ((edtStatus.Tag = -1)) then
         Abort;

      // Se o usuário tiver informado um cenário
      //==================================================================================
      if (trim(pdblcCenarioText) <> '') then
      begin
         // Zera os valores do Cenário
         sSQL := 'UPDATE VALORESCENARIO S SET S.VLRORCCENARIO = 0                ' +
                 'WHERE                                                          ' +
                 '   (EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                 '            FROM CONTASORCAMEN C                               ' +
                 '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(IPlanoOrc)     + ') AND    ' +
                 '                   (C.TIPOCALCORCADO <> ''V'') AND             ' +
                 '                   (C.TIPOCALCORCADO <> ''T'') AND             ' +
                 '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ' +
                 '                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
                 '   (S.IDPLANOORCAMEN   = ' + IntToStr(IPlanoOrc)     + ')  AND ' +
                 '   (S.IDCENARIOORCAMEN = ' + pdblcCenarioLookupValue + ')  AND ' +
                 '   (S.EXERCICIO        = ' + pdblkExercicioLookupValue + ') AND ' +
                 '   (S.PERIODO          = ' + IntToStr(iPeriodoAtu)  + ') AND ' +
                 '   (S.IDPESSOA         = ' + IntToStr(IdEmpresa) + ') ';

         // Pega o conteúdo conta inicial
         if trim(pedConteudo1Text) <> '' then
            sSQL := sSQL + '  AND (SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+'''))  ';

         if not ExecSQL(sSQL) then
            raise Exception.Create(MessageInfo);



         if ((edtStatus.Tag = -1)) then Abort;

         // Se tiver marcado para buscar o saldo anterior
         if (pcbBuscaSaldoAnteriorChecked) then
         begin
            sSQL := 'UPDATE VALORESCENARIO S SET S.VLRORCCENARIO = 0                ' +
                    'WHERE                                                          ' +
                    '   (EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                    '            FROM CONTASORCAMEN C                               ' +
                    '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(iPlanoOrc) + ') AND    ' +
                    '                   (C.TIPOCALCORCADO <> ''V'') AND             ' +
                    '                   (C.TIPOCALCORCADO <> ''T'') AND             ' +
                    '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ' +
                    '                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
                    '   (S.IDPLANOORCAMEN   = ' + IntToStr(iPlanoOrc)       + ') AND  ' +
                    '   (S.IDCENARIOORCAMEN = ' + pdblcCenarioLookupValue   + ') AND  ' +
                    '   (S.EXERCICIO        = ' + pdblkExercicioLookupValue + ') AND  ' +
                    '   (S.PERIODO IS NULL) AND                                     ' +
                    '   (S.IDPESSOA  = ' + IntToStr(IdEmpresa) + ')  ';



            // Pega o conteúdo conta inicial
            if trim(pedConteudo1Text) <> '' then
               sSQL := sSQL + ' AND (SUBSTR(S.IDCONTAORCAMEN,'+ FloatToStr(psePosIni1Value)+','+ FloatToStr(psePosFim1Value)+') = ('''+ trim(pedConteudo1Text)+''')) ';

            if not ExecSQL(sSQL) then
               raise Exception.Create(MessageInfo);

            if ((edtStatus.Tag = -1)) then Abort;
         end;
      end


      // Se o usuário não tiver informado um cenário
      //==================================================================================
      else
      begin
         // Valor Orçado
         if (prgrpTipoItemIndex = 0) or (prgrpTipoItemIndex = 2) then
         begin
            // Zera os valores dos Saldos Orçados
            sSQL := 'UPDATE SALDOORCADO S SET S.VLRORCADO = 0, VLRORCACUM = 0       ' +
                    'WHERE                                                          ' +
                    '   (EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                    '            FROM CONTASORCAMEN C                               ' +
                    '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(IPlanoOrc) + ') AND    ' +
                    '                   (C.TIPOCALCORCADO <> ''V'') AND             ' +
                    '                   (C.TIPOCALCORCADO <> ''T'') AND             ' +
                    '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ' +
                    '                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
                    '   (S.IDPLANOORCAMEN  = ' + IntToStr(IPlanoOrc) + ') AND                  ' +
                    '   (S.DATAREFERENCIA  >= TO_DATE(' + QuotedStr(CdsPeriodo.FieldByName('DataIniPeriodo').AsString) + ',''DD/MM/YYYY'')) AND ' +
                    '   (S.DATAREFERENCIA  <= TO_DATE(' + QuotedStr(CdsPeriodo.FieldByName('DataFimPeriodo').AsString) + ',''DD/MM/YYYY'')) AND ' +
                    '   (S.IDPESSOA        = ' + IntToStr(IdEmpresa) + ') ';

            // Pega o conteúdo conta inicial
            if trim(pedConteudo1Text) <> '' then
               sSQL := sSQL + '  AND (SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) ';

            if not ExecSQL(sSQL) then
               raise Exception.Create(MessageInfo);

            if ((edtStatus.Tag = -1)) then
               Abort;

            // Se tiver marcado para buscar o saldo anterior
            if (pcbBuscaSaldoAnteriorChecked) then
            begin
               sSQL := 'UPDATE SALDOORCADOANT S SET S.VLRORCADO = 0                    ' +
                       'WHERE                                                          ' +
                       '   (EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                       '            FROM CONTASORCAMEN C                               ' +
                       '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(IPlanoOrc) + ') AND    ' +
                       '                   (C.TIPOCALCORCADO <> ''V'') AND             ' +
                       '                   (C.TIPOCALCORCADO <> ''T'') AND             ' +
                       '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ' +
                       '                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
                       '   (S.IDPLANOORCAMEN   = ' + IntToStr(IPlanoOrc) + ') AND      ' +
                       '   (S.EXERCICIO = ' + pdblkExercicioLookupValue  + ') AND      ' +
                       '   (S.IDPESSOA  = ' + IntToStr(IdEmpresa) + ')                 ';

               // Pega o conteúdo conta inicial
               if trim(pedConteudo1Text) <> '' then
                  sSQL := sSQL + ' AND (SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+''')) ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               if ((edtStatus.Tag = -1)) then
                  Abort;
            end;
         end;


         // Valor Realizado
         if ((prgrpTipoItemIndex = 1) or (prgrpTipoItemIndex = 2)) then
         begin
            // Zera os valores dos Saldos Realizados
            sSQL := 'UPDATE SALDOORCADO S SET S.VLRREALIZADO = 0, S.VLRREALACUM = 0  ' +
                    'WHERE                                                           ' +
                    '   (EXISTS (SELECT C.IDCONTAORCAMEN                             ' +
                    '            FROM CONTASORCAMEN C                                ' +
                    '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(IPlanoOrc) + ') AND     ' +
                    '                   (C.TIPOCALCREALIZADO <> ''V'') AND           ' +
                    '                   (C.TIPOCALCREALIZADO <> ''T'') AND           ' +
                    '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND    ' +
                    '                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND  ' +
                    '   (S.DATAREFERENCIA   >= TO_DATE(' + QuotedStr(CdsPeriodo.FieldByName('DATAINIPERIODO').AsString) + ',''DD/MM/YYYY'')) AND ' +
                    '   (S.DATAREFERENCIA   <= TO_DATE(' + QuotedStr(CdsPeriodo.FieldByName('DATAFIMPERIODO').AsString) + ',''DD/MM/YYYY'')) AND ' +
                    '   (S.IDPESSOA          = ' + IntToStr(IdEmpresa) + ')  ';

            // Pega o conteúdo conta inicial
            if trim(pedConteudo1Text) <> '' then
               sSQL := sSQL + ' AND (SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+'''))  ';

            if not ExecSQL(sSQL) then
               raise Exception.Create(MessageInfo);

            if ((edtStatus.Tag = -1)) then
               Abort;


            // Se tiver marcado para buscar o saldo anterior
            if (pcbBuscaSaldoAnteriorChecked) then
            begin
               sSQL := 'UPDATE SALDOORCADOANT S SET S.VLRREALIZADO = 0                 ' +
                       'WHERE                                                          ' +
                       '   (EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                       '            FROM CONTASORCAMEN C                               ' +
                       '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(IPlanoOrc) + ') AND    ' +
                       '                   (C.TIPOCALCORCADO <> ''V'') AND             ' +
                       '                   (C.TIPOCALCORCADO <> ''T'') AND             ' +
                       '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND   ' +
                       '                   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ' +
                       '   (S.IDPLANOORCAMEN  = ' + IntToStr(IPlanoOrc) + ') AND       ' +
                       '   (S.EXERCICIO       = ' + pdblkExercicioLookupValue + ') AND ' +
                       '   (S.IDPESSOA        = ' + IntToStr(IdEmpresa)  +   ')        ';


               // Pega o conteúdo conta inicial
               if trim(pedConteudo1Text) <> '' then
                  sSQL := sSQL + ' AND (SUBSTR(S.IDCONTAORCAMEN,'+ FloatToStr(psePosIni1Value)+','+FloatToStr(psePosFim1Value)+') = ('''+trim(pedConteudo1Text)+'''))  ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               if ((edtStatus.Tag = -1)) then
                  Abort;
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

   //1.3.3
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

procedure TCtrlGeraDados.SetiPlanoContabil(const Value: integer);
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

//William Santana SOL 204073 KIN 1974951
procedure TCtrlGeraDados.SetsLog6(const Value: String);
begin
   FsLog6 := Value;
end;
//END - William Santana SOL 204073 KIN 1974951

procedure TCtrlGeraDados.SetCdsAcum2(const Value: TClientDataSet);
begin
   FCdsAcum2 := Value;
end;

procedure TCtrlGeraDados.SetCdsAcum3(const Value: TClientDataSet);
begin
   FCdsAcum3 := Value;
end;






function TCtrlGeraDados.ExecutaGeracaoDados(iIdEmpresa,iIdPlanoOrc,iIdPlanoContab,iExercicio, iPerIni,
                                            iPerFim,iIdCenario, iTipoGer,iPosIni,iQtdDigitos: integer;
                                            sConteudo: string;
                                            bCalculaPeriodo,bCalculaSaldoAnterior,
                                            bCalculaPorGrupo,
                                            bCommitar,
                                            bValidaFDO: boolean): boolean; //William Santana SOL: 204073 KIN: 1974951
{ Operações do FormProgressoDuplo
----------------------------------
  0: (1-mostra;2-anda;3-esconde;4-Mensagem para o memo)

  1: Legenda - Acima
  2: Min.- Acima
  3: Máx.- Acima
  4: Posição - Acima

  5: Legenda - Abaixo
  6: Min.- Abaixo
  7: Máx.- Abaixo
  8: Posição - Abaixo

}

var
  iMesCorrente, iDiasPeriodo: integer;
  CdsPeriodo : TClientDataSet;
  dDataCorrente,dDataFim: TDateTime;
  sSQL: string;
  dPassado:TDatetime;
  lstBlocoCod : TStringList;  // Edilaine - SOL 185723 / KTN 1742408
begin
   try
      StartTransaction;
      CdsPeriodo   := TClientDataSet.Create(nil);
      iProgIni  := 0;
      iProgCorr := 0;
      iProgFim  := 0;

      // Edilaine - SOL 185723 / KTN 1742408
      { a lista receberá um bloco de instruções INSERT e UPDATE que serão executadas antes do
        commit. Para voltar ao processo anterior (executar instrução por instrução) basta comentar
        a passagem do parâmetro lstBlocoCod nas funções CalculaValorOrcado e CalculaValorRealizado}
      lstBlocoCod := TStringList.Create;

      iNumBloco      := 0;         // Edilaine - SOL 190626 / KTN 1803612
      bComitaPeriodo := bCommitar; // Edilaine - SOL 190626 / KTN 1803612

      bValidacaoFDO  := bValidaFDO; //William Santana SOL: 204074 KIN: 1974951
      sLog6          := '';        //William Santana SOL: 204074 KIN: 1974951
      // Etapa 1 - Zera os valores já lançados
      // Mostra o FormProgresso
      DoProgresso([1,
                  'Zerando processamentos anteriores...',
                  1,
                  1,
                  1,
                  'Operação: Zerando valores gerados',
                  1,
                  1,
                  1]);
      //1.1

      dPassado := Now;


      if not(bValidaFDO) then       //William Santana SOL 204073 KIN 1974951
      if not ZeraValoresGerado(iPerIni,iPerFim,iExercicio,iTipoGer,iIdPlanoOrc,
                               iIdEmpresa,iPosIni,iQtdDigitos,sConteudo,bCalculaSaldoAnterior,
                               bCalculaPorGrupo,iIdCenario) then
         raise Exception.Create(MessageInfo);

      //ShowMessage('Zerando valores  ' +  DateTimeToStr(Now - dPassado));

      iPlanoContabil := iIdPlanoContab;
      // Seta as variáveis de controle do FormProgresso
      iProgIni := 1;
      iProgFim := (iPerFim - iPerIni);

      if iProgFim = 0 then
         iProgFim := 1
      else
         iProgFim := iPerFim;   

      iProgCorr := 0;


      // Se os calculos forem por periodo a periodo
      if bCalculaPeriodo then
      begin
         // Etapa 3 - Varre o período informado para a geração de dados do grupo em foco
         for iMesCorrente := iPerIni to iPerFim do
         begin
            Inc(iProgCorr);

            //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
            {DoProgresso([2,
                        'Marcando as contas para serem calculadas...',
                        1,
                        1,
                        1,
                        'Operação: Marcando contas para cálculo',
                        iProgIni,
                        iProgFim,
                        iProgCorr]);
            // 1.2 - Marca somente as contas que serão calculadas
            if not ZeraFlgCalculo(iTipoGer,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdEmpresa,sConteudo,bCalculaPorGrupo) then
                raise Exception.Create(MessageInfo); }

            // Validar periodo orçamentário
           CdsPeriodo.Data := GetDataPacket('SELECT DATAINIPERIODO, DATAFIMPERIODO, NOMEPERIODO, FLGBLOQUEADO ' +
                                             'FROM  PERIODOORCAMEN ' +
                                             'WHERE ' +
                                             '    (IDPESSOA  = '  + IntToStr(iIdEmpresa)   + ') AND ' +
                                             '    (EXERCICIO = '  + IntToStr(iExercicio)   + ') AND ' +
                                             '    (PERIODO   = '  + IntToStr(iMesCorrente) + ') ');

            if CdsPeriodo.IsEmpty then
               raise Exception.Create('Período: ' + IntToStr(iMesCorrente) + ' / Exercício: ' + IntToStr(iExercicio) + ' não cadastrado.')
            else
            begin
               if (CdsPeriodo.FieldByName('FLGBLOQUEADO').AsString = 'S') then
               begin
                  DoProgresso([4,'Período: ' + IntToStr(iMesCorrente) + ' / Exercício: ' + IntToStr(iExercicio) + ' bloqueado.']);
                  Continue;
               end;
            end;

            // Pega os dias de vigência do período
            iDiasPeriodo := (Trunc(CdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime) - Trunc(CdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime));
            dDataCorrente := CdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime;
            dDataFim      := CdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime;
            sDataInicio := CdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime;
            sDataFim    := CdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime;
            case iTipoGer of
               // Orçado
               0: begin
                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Orçado - Período: ' + IntToStr(iMesCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);

                     //1.3
                     if not CalculaValorOrcado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                               iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                               bCalculaPeriodo,bCalculaSaldoAnterior,
                                               lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                        raise Exception.Create(MessageInfo);
                  end;

               // Realizado
               1: begin
                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Realizado - Período: ' + IntToStr(iMesCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);
                     //1.4
                     if not CalculaValorRealizado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                                  iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                                  bCalculaPeriodo,bCalculaSaldoAnterior,
                                                  lstBlocoCod ) then     // Edilaine - SOL 185723 / KTN 1742408
                         raise Exception.Create(MessageInfo);

                    //Edilaine - SOL 175588 / KTN 1600204
                    _Cds.EmptyDataSet;

                  end;

               // Orçado e Realizado
               2: begin
                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Orçado - Período: ' + IntToStr(iMesCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);
                     if not CalculaValorOrcado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                               iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                               bCalculaPeriodo,bCalculaSaldoAnterior,
                                               lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                        raise Exception.Create(MessageInfo);


                     //Ricardo SOL: 168266 KINTANA: 1481776
                     _Cds.EmptyDataSet;

                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Realizado - Período: ' + IntToStr(iMesCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);
                     if not CalculaValorRealizado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                                  iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                                  bCalculaPeriodo,bCalculaSaldoAnterior,
                                                  lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                         raise Exception.Create(MessageInfo);
                  end;
            end;

            if bCommitar then
            begin
               // Edilaine - SOL 185723 / KTN 1742408
               if lstBlocoCod.count > 0 then
               begin
                  ExecSQL('BEGIN ' + lstBlocoCod.text + ' END;');
               // Edilaine - SOL 185723 / KTN 1742408 - fim

                  inc(iNumBloco);  // Edilaine - SOL 190626 / KTN 1803612
                  lstblococod.SaveToFile('C:\Planus\Temp\geracaodados_'+IntToStr(iNumBloco)+'.sql'); // Edilaine - SOL 190626 / KTN 1803612
               end;

               Commit;
               StartTransaction;
               lstBlocoCod.clear;  // Edilaine - SOL 185723 / KTN 1742408
            end;

         end;
      end


      // Se o calculo for dia-a-dia
      else
      begin
         // Validar periodo orçamentário
         CdsPeriodo.Data := GetDataPacket('SELECT DATAINIPERIODO, DATAFIMPERIODO, NOMEPERIODO, FLGBLOQUEADO, PERIODO ' +
                                          'FROM  PERIODOORCAMEN ' +
                                          'WHERE ' +
                                          '    (IDPESSOA  = '  + IntToStr(iIdEmpresa)   + ') AND ' +
                                          '    (EXERCICIO = '  + IntToStr(iExercicio)   + ') AND ' +
                                          '    (PERIODO   BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') ');

         if CdsPeriodo.IsEmpty then
            raise Exception.Create('Período: ' + IntToStr(iMesCorrente) + ' / Exercício: ' + IntToStr(iExercicio) + ' não cadastrado.');

         // Pega os dias de vigência do período
         CdsPeriodo.First;
         dDataCorrente := CdsPeriodo.FieldByName('DATAINIPERIODO').AsDateTime;
         CdsPeriodo.Last;
         dDataFim := CdsPeriodo.FieldByName('DATAFIMPERIODO').AsDateTime;
         iDiasPeriodo := (Trunc(dDataFim) - Trunc(dDataCorrente - 1));

         // Seta as variáveis de controle do FormProgresso
         iProgIni  := 1;
         iProgFim  := iDiasPeriodo;
         iProgCorr := 0;


         while dDataCorrente < dDataFim do
         begin
            // Verifica se o período do dia corrente está bloqueado
            with TDiasUteis.Create do
            try
               iMesCorrente        := ExtraiMes(dDataCorrente);
               CdsPeriodo.Filtered := False;
               CdsPeriodo.Filter   := 'PERIODO = ' + IntToStr(iMesCorrente);
               CdsPeriodo.Filtered := True;

               if not CdsPeriodo.IsEmpty then
               begin
                  if (CdsPeriodo.FieldByName('FLGBLOQUEADO').AsString = 'S') then
                  begin
                     DoProgresso([4,'Período: ' + IntToStr(iMesCorrente) + ' / Exercício: ' + IntToStr(iExercicio) + ' do dia ' + FormatDateTime('dd/mm/yyyy',dDatacorrente) + ' bloqueado.']);

                     // Incrementa a data
                     dDataCorrente := dDataCorrente + 1;
                     Continue;
                  end;
               end
               else
               begin
                  DoProgresso([4,'Período não cadastrado para o dia : ' + FormatDateTime('dd/mm/yyyy',dDatacorrente) ]);

                  // Incrementa a data
                  dDataCorrente := dDataCorrente + 1;
                  Continue;
               end;

            finally
               Free;
            end;


            // Incrementa a barra de progresso
            Inc(iProgCorr);
            DoProgresso([2,
                        'Marcando as contas para serem calculadas...',
                        1,
                        1,
                        1,
                        'Operação: Marcando contas para cálculo',
                        iProgIni,
                        iProgFim,
                        iProgCorr]);

            // 1.2 - Marca somente as contas que serão calculadas
            if not ZeraFlgCalculo(iTipoGer,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdEmpresa,sConteudo,bCalculaPorGrupo) then
                raise Exception.Create(MessageInfo);

            with TDiasUteis.Create do
            begin
               try
                  iMesCorrente := ExtraiMes(dDataCorrente);
               finally
                  Free;
               end;
            end;


            case iTipoGer of
               // Orçado
               0: begin
                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Orçado - Dia: ' + FormatDateTime('dd/mm/yyyy',dDataCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);


                     //1.3
                     if not CalculaValorOrcado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                               iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                               bCalculaPeriodo,bCalculaSaldoAnterior,
                                               lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                        raise Exception.Create(MessageInfo);
                  end;

               // Realizado
               1: begin
                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Realizado - Dia: ' + FormatDateTime('dd/mm/yyyy',dDataCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);
                     //1.4
                     if not CalculaValorRealizado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                                  iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                                  bCalculaPeriodo,bCalculaSaldoAnterior,
                                                  lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                         raise Exception.Create(MessageInfo);

                     //Edilaine - SOL 175588 / KTN 1600204
                     _Cds.EmptyDataSet;

                  end;

               // Orçado e Realizado
               2: begin
                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Orçado - Por Dia: ' + FormatDateTime('dd/mm/yyyy',dDataCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);
                     if not CalculaValorOrcado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                               iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                               bCalculaPeriodo,bCalculaSaldoAnterior,
                                               lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                        raise Exception.Create(MessageInfo);


                     DoProgresso([2,
                                 '',
                                 1,
                                 1,
                                 1,
                                 'Processando do período ' + IntToStr(iPerIni) + ' a ' + IntToStr(iPerFim) + ' de ' + IntToStr(iExercicio) + #13 +
                                 'Operação: Calculando Realizado - Por Dia: ' + FormatDateTime('dd/mm/yyyy',dDataCorrente),
                                 iProgIni,
                                 iProgFim,
                                 iProgCorr]);

                     //Edilaine - SOL 175588 / KTN 1600204
                     _Cds.EmptyDataSet;

                     if not CalculaValorRealizado(dDataCorrente,iDiasPeriodo,iPosIni,iQtdDigitos,iMesCorrente,iIdPlanoOrc,
                                                  iExercicio,iIdEmpresa,iIdCenario,sConteudo,bCalculaPorGrupo,
                                                  bCalculaPeriodo,bCalculaSaldoAnterior,
                                                  lstBlocoCod) then     // Edilaine - SOL 185723 / KTN 1742408
                         raise Exception.Create(MessageInfo);
                  end;
            end;

            // Incrementa a data
            dDataCorrente := dDataCorrente + 1;

            if bCommitar then
            begin
               // Edilaine - SOL 185723 / KTN 1742408
               if lstBlocoCod.count > 0 then
               begin
                  ExecSQL('BEGIN ' + lstBlocoCod.text + ' END;');
               // Edilaine - SOL 185723 / KTN 1742408 - fim

                  inc(iNumBloco);  // Edilaine - SOL 190626 / KTN 1803612
                  lstblococod.SaveToFile('C:\Planus\Temp\geracaodados_'+IntToStr(iNumBloco)+'.sql'); // Edilaine - SOL 190626 / KTN 1803612
               end;

               Commit;
               StartTransaction;
               lstBlocoCod.Clear;   // Edilaine - SOL 185723 / KTN 1742408 - fim
            end;
         end;
      end;

      // Edilaine - SOL 185723 / KTN 1742408
      if lstBlocoCod.count > 0 then
      begin
         ExecSQL('BEGIN ' + lstBlocoCod.text + ' END;');

         inc(iNumBloco);  // Edilaine - SOL 190626 / KTN 1803612
         lstblococod.SaveToFile('C:\Planus\Temp\geracaodados_'+IntToStr(iNumBloco)+'.sql'); // Edilaine - SOL 190626 / KTN 1803612
      end;
      // Edilaine - SOL 185723 / KTN 1742408 - fim

      Commit;

      Result := True;
      FreeAndNil(CdsPeriodo);
      lstBlocoCod.Free;       // Edilaine - SOL 185723 / KTN 1742408
      // Esconte o FormProgresso
      DoProgresso([3]);


   except
      on E:Exception do
      begin
         Rollback;
         MessageInfo := E.Message;
         Result      := False;
         FreeAndNil(CdsPeriodo);
         lstBlocoCod.Free;     // Edilaine - SOL 185723 / KTN 1742408
         // Esconte o FormProgresso
         DoProgresso([3]);
      end;
   end;
end;



//1.1
function TCtrlGeraDados.ZeraValoresGerado(iPerIni,iPerFim,iExercicio,iTipoGer,iIdPlanoOrc,iIdEmpresa,iPosIni,iQtdDigitos: integer;
                                          sConteudo: string;
                                          bSaldoAnterior, bPorGrupo: boolean; iIdCenario: integer = -1): boolean;
var
  sSQL: string;
begin
   try
      // Se o usuário tiver informado um cenário
      //==================================================================================
      if iIdCenario <> -1 then
      begin
         // Zera os valores do Cenário
         sSQL := 'UPDATE VALORESCENARIO S                                        ' +
                 'SET S.VLRORCCENARIO = 0                                        ' +
                 'WHERE                                                          ' +
                 '    EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                 '            FROM CONTASORCAMEN C, GRUPOORCAMEN G               ' +
                 '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)   + ') AND ' +
                 '                   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND   ' +
                 '                   (C.TIPOCALCORCADO NOT IN (''V'',''T'')) AND             ' +
                 '                   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND ' +
                 '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN))   AND ';

                 // Pega o conteúdo Grupo/Conta inicial
                 if Trim(sConteudo) <> '' then
                 begin
                    if bPorGrupo then
                       sSQL := sSQL + ' (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND ' +
                                      ' (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND '
                    else
                       //Ricardo - adicionado quotedstr
                       sSQL := sSQL + ' (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + quotedstr(Trim(sConteudo)) + ')) AND ' +
                                      ' (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN))) AND ';
                 end;

                 sSQL := sSQL +
                 '   (S.IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc)     + ')  AND ' +
                 '   (S.IDCENARIOORCAMEN = ' + IntToStr(iIdCenario)    + ')  AND ' +
                 '   (S.EXERCICIO        = ' + IntToStr(iExercicio)    + ')  AND ' +
                 '   (S.IDPESSOA         = ' + IntToStr(iIdEmpresa)    + ')  AND ';

                 // Se tiver marcado para buscar o saldo anterior
                 if bSaldoAnterior then
                    sSQL := sSQL + ' (S.PERIODO IS NULL) '
                 else
                    sSQL := sSQL + ' (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') ';


         if not ExecSQL(sSQL) then
            raise Exception.Create(MessageInfo);

      end


      // Se o usuário não tiver informado um cenário
      //==================================================================================
      else
      begin
         case iTipoGer of
            // 0 - Orçado, 1 - Realizado, 2 - Ambos
            0: begin      
                  // Zera os valores dos Saldos Orçados
                  sSQL := 'UPDATE ';

                          // Se tiver marcado para buscar o saldo anterior
                          if bSaldoAnterior then
                             sSQL := sSQL + ' SALDOORCADOANT S SET S.VLRORCADO = 0 '
                          else
                             sSQL := sSQL + ' SALDOORCADO S SET S.VLRORCADO = 0, VLRORCACUM = 0 ';

                          sSQL := sSQL +
                          'WHERE                                                          ' +
                          '    EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                          '            FROM CONTASORCAMEN C, GRUPOORCAMEN G               ' +
                          '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND    ' +
                          '                   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND   ' +
                          '                   (C.TIPOCALCORCADO NOT IN (''V'',''T'')) AND             ' +
                          '                   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND ' +
                          '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ';

                          // Pega o conteúdo Grupo/Conta inicial
                          if Trim(sConteudo) <> '' then
                          begin
                             if bPorGrupo then
                                sSQL := sSQL + ' (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND '
                             else
                                sSQL := sSQL + ' (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND ';
                          end;

                          sSQL := sSQL + '  (S.IDPLANOORCAMEN  = C.IDPLANOORCAMEN))  AND ';

                          if not bSaldoAnterior then
                             sSQL := sSQL + '   (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') AND ';

                          sSQL := sSQL +   
                          '   (S.EXERCICIO       = ' + IntToStr(iExercicio)    + ')     AND ' +
                          '   (S.IDPESSOA        = ' + IntToStr(iIdEmpresa)    + ')     ';


                  if not ExecSQL(sSQL) then
                     raise Exception.Create(MessageInfo);
               end;


            1: begin

                  //Ricardo SOL: 168266 KINTANA: 1481776
                  // Zera os valores dos Saldos Realizados
                  sSQL := '';
                  sSQL := ' UPDATE ';

                  if bSaldoAnterior then
                     sSQL := sSQL + ' SALDOORCADOANT S SET S.VLRREALIZADO = 0 '
                  else
                     sSQL := sSQL + ' SALDOORCADO S SET S.VLRREALIZADO = 0, S.VLRREALACUM = 0 ';


                  sSQL := sSQL + ' WHERE IDCONTAORCAMEN IN ( ' +
                           ' SELECT DISTINCT IDCONTAORCAMEN ' +
                           ' FROM GRUPOORCAMEN G, CONTASORCAMEN C ' +
                           ' WHERE (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) ' +
                           '  AND (G.IDPLANOORCAMEN = C.IDPLANOORCAMEN) ' ;

                    //Pega o conteúdo Grupo/Conta inicial
                    if Trim(sConteudo) <> '' then
                    begin
                       if bPorGrupo then
                          sSQL := sSQL + ' AND (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + '))  '
                       else
                          //RIcardo - adicionado quotedstr
                          sSQL := sSQL + ' AND (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + quotedstr(Trim(sConteudo)) + '))  ';
                    end;

                    sSQL :=    sSQL +
                           '  AND (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ')' + 
                           '  AND (C.TIPOCALCREALIZADO NOT IN (' + QuotedStr('V') + ', ' + QuotedStr('T') + ')) ' +
                           '  AND ((C.FLGATIVA = ' + QuotedStr('A') + ' ) OR (C.FLGATIVA IS NULL)) ' +
                           //'  AND (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) ' +
                           //'  AND (C.IDPLANOORCAMEN = s.IDPLANOORCAMEN) ' +
                           '  ) ' +

                           ' AND (S.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)  + ')' + 
                           ' AND (S.PERIODO BETWEEN ' +  IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim)  + ' ) ' +
                           ' AND (S.EXERCICIO = ' + IntToStr(iExercicio) +  ' ) ' +
                           ' AND (S.IDPESSOA = ' + IntToStr(iIdEmpresa) + ')';
                  //Ricardo SOL: 168266 KINTANA: 1481776 - fim

                 //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
                 { sSQL := 'UPDATE ';

                          // Se tiver marcado para buscar o saldo anterior
                          if bSaldoAnterior then
                             sSQL := sSQL + ' SALDOORCADOANT S SET S.VLRREALIZADO = 0 '
                          else
                             sSQL := sSQL + ' SALDOORCADO S SET S.VLRREALIZADO = 0, S.VLRREALACUM = 0 ';

                          sSQL := sSQL +
                          'WHERE                                                           ' +
                          '    EXISTS (SELECT C.IDCONTAORCAMEN                             ' +
                          '            FROM CONTASORCAMEN C, GRUPOORCAMEN G                ' +
                          '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND     ' +
                          '                   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND    ' +
                          '                   (C.TIPOCALCREALIZADO NOT IN (''V'',''T'')) AND           ' +
                          '                   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND ' +
                          '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN)  AND  ';

                          // Pega o conteúdo Grupo/Conta inicial
                          if Trim(sConteudo) <> '' then
                          begin
                             if bPorGrupo then
                                sSQL := sSQL + ' (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND '
                             else
                                //RIcardo - adicionado quotedstr
                                sSQL := sSQL + ' (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + quotedstr(Trim(sConteudo)) + ')) AND ';
                          end;

                          sSQL := sSQL +
                          '   (S.IDPLANOORCAMEN  = C.IDPLANOORCAMEN)) AND  ';

                          if not bSaldoAnterior then
                             sSQL := sSQL + '   (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') AND ';

                          sSQL := sSQL +
                          '   (S.EXERCICIO       = ' + IntToStr(iExercicio)    + ')     AND  ' +
                          '   (S.IDPESSOA        = ' + IntToStr(iIdEmpresa)    + ')  '; }
                 //Ricardo SOL: 168266 KINTANA: 1481776 - fim

                  if not ExecSQL(sSQL) then
                     raise Exception.Create(MessageInfo);

                   //Ricardo SOL: 168266 KINTANA: 1481776 -
                   //Realizar commit para não prender a transação
                   sSQL := '';
                   sSQL := 'COMMIT WORK';
                   if not ExecSQL(sSQL) then
                     raise Exception.Create(MessageInfo);
               end;

            2: begin
                  // Zera os valores dos Saldos Realizados e Orçados
                  // 1-Zera os valores dos Saldos Orçados
                  sSQL := 'UPDATE ';

                          // Se tiver marcado para buscar o saldo anterior
                          if bSaldoAnterior then
                             sSQL := sSQL + ' SALDOORCADOANT S SET S.VLRORCADO = 0 '
                          else
                             sSQL := sSQL + ' SALDOORCADO S SET S.VLRORCADO = 0, VLRORCACUM = 0 ';

                          sSQL := sSQL +
                          'WHERE                                                          ' +
                          '    EXISTS (SELECT C.IDCONTAORCAMEN                            ' +
                          '            FROM CONTASORCAMEN C, GRUPOORCAMEN G               ' +
                          '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND    ' +
                          '                   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND   ' +

                          //Ricardo SOL: 168266 KINTANA: 1481776
                          '                   (C.IDPLANOORCAMEN = G.IDPLANOORCAMEN) AND   ' +
                          '                   (S.IDPLANOORCAMEN = G.IDPLANOORCAMEN) AND   ' +
                          '                   (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND   ' +
                          //Ricardo SOL: 168266 KINTANA: 1481776 - fim

                          '                   (C.TIPOCALCORCADO NOT IN (''V'',''T'')) AND             ' +
                          '                   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND ' +
                          '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND ';

                          // Pega o conteúdo Grupo/Conta inicial
                          if Trim(sConteudo) <> '' then
                          begin
                             if bPorGrupo then
                                sSQL := sSQL + ' (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND '
                             else
                                sSQL := sSQL + ' (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND ';
                          end;

                          //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
                          //SQL := sSQL + '  (S.IDPLANOORCAMEN  = C.IDPLANOORCAMEN))  AND ';

                          if not bSaldoAnterior then
                             sSQL := sSQL + '   (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') AND ';

                          sSQL := sSQL +
                          '   (S.EXERCICIO       = ' + IntToStr(iExercicio)    + ')     AND ' +
                          '   (S.IDPESSOA        = ' + IntToStr(iIdEmpresa)    + ')     ';





                  if not ExecSQL(sSQL) then
                     raise Exception.Create(MessageInfo);

                  // 2-Zera os valores dos Saldos Realizados
                  sSQL := 'UPDATE ';

                          // Se tiver marcado para buscar o saldo anterior
                          if bSaldoAnterior then
                             sSQL := sSQL + ' SALDOORCADOANT S SET S.VLRREALIZADO = 0 '
                          else
                             sSQL := sSQL + ' SALDOORCADO S SET S.VLRREALIZADO = 0, S.VLRREALACUM = 0 ';

                          sSQL := sSQL +
                          'WHERE                                                           ' +
                          '    EXISTS (SELECT C.IDCONTAORCAMEN                             ' +
                          '            FROM CONTASORCAMEN C, GRUPOORCAMEN G                ' +
                          '            WHERE  (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)  + ') AND     ' +
                          '                   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND    ' +
                          '                   (C.TIPOCALCREALIZADO NOT IN (''V'',''T'')) AND           ' +
                          '                   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND ' +
                          '                   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN)  AND  ';

                          // Pega o conteúdo Grupo/Conta inicial
                          if Trim(sConteudo) <> '' then
                          begin
                             if bPorGrupo then
                                sSQL := sSQL + ' (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND '
                             else
                                sSQL := sSQL + ' (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + Trim(sConteudo) + ')) AND ';
                          end;

                          sSQL := sSQL +
                          '   (S.IDPLANOORCAMEN  = C.IDPLANOORCAMEN)) AND  ';

                          if not bSaldoAnterior then
                             sSQL := sSQL + '   (S.PERIODO BETWEEN ' + IntToStr(iPerIni) + ' AND ' + IntToStr(iPerFim) + ') AND ';

                          sSQL := sSQL +
                          '   (S.EXERCICIO       = ' + IntToStr(iExercicio)    + ')     AND  ' +
                          '   (S.IDPESSOA        = ' + IntToStr(iIdEmpresa)    + ')  ';

                  if not ExecSQL(sSQL) then
                     raise Exception.Create(MessageInfo);
               end;
         end;
      end;


      Result := true;

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message
      end;
   end;
end;




//1.2
function TCtrlGeraDados.ZeraFlgCalculo(iIdTipoGer,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdEmpresa: integer; sConteudo: string; bPorGrupo: boolean ): boolean;
var
  sSQL: string;
begin
   try
      // 0 - Orçado, 1 - Realizado, 2 - Ambos
      case iIdTipoGer of
         0: begin
               // Marca as contas corretas para serem calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCORCADO = ''N'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + '  G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + '  (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   (C.TIPOCALCORCADO NOT IN (''V'',''T'')) AND ' +
                       '   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               // Marca as contas que não serão calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCORCADO = ''S'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + ' G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + ' (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   ((C.TIPOCALCORCADO IN (''V'',''T'')) OR (C.FLGATIVA = ''I''))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

            end;


         1: begin
               // Marca as contas corretas para serem calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCREAL = ''N'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + ' (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + ' (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   (C.TIPOCALCREALIZADO NOT IN (''V'',''T'')) AND ' +
                       '   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               // Marca as contas que não serão calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCREAL = ''S'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + '  G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + '  (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   ((C.TIPOCALCREALIZADO IN (''V'',''T'')) OR (C.FLGATIVA = ''I''))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);
            end;

         2: begin
               // O Update destas contas para este modo tem que ser feito separado, pois
               //devido aos tipos de parametrizações, se usar os dois campos no mesmo
               //Update (FLGCALCORCADO,FLGCALCREALIZADO), as atualizações não sairão
               //corretas. 
               //=========================================================================
               // Contas Orçado
               //=========================================================================
               // Marca as contas corretas para serem calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCORCADO = ''N'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + '  G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + '  (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   (C.TIPOCALCORCADO NOT IN (''V'',''T'')) AND ' +
                       '   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               // Marca as contas que não serão calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCORCADO = ''S'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + ' G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + ' (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   ((C.TIPOCALCORCADO IN (''V'',''T'')) OR (C.FLGATIVA = ''I''))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               //=========================================================================
               // Contas Realizado
               //=========================================================================
               // Marca as contas corretas para serem calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCREAL = ''N'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + ' (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + ' (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   (C.TIPOCALCREALIZADO NOT IN (''V'',''T'')) AND ' +
                       '   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);

               // Marca as contas que não serão calculadas
               sSQL := 'UPDATE CONTASORCAMEN C ' +
                       'SET C.FLGCALCREAL = ''S'' ' +
                       'WHERE ' +
                       'EXISTS (SELECT G.IDGRUPOORCAMEN ' +
                       '        FROM GRUPOORCAMEN G ' +
                       '        WHERE ';

                       if Trim(sConteudo) <> '' then
                       begin
                          if bPorGrupo then
                             sSQL := sSQL + '  G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN AND ' +
                                            '    (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                          else
                             sSQL := sSQL + '  (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                                            '    (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = (' + QuotedStr(Trim(sConteudo)) + ')) AND '
                       end;

                       sSQL := sSQL +
                       '   ((C.TIPOCALCREALIZADO IN (''V'',''T'')) OR (C.FLGATIVA = ''I''))) AND ' +
                       '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (C.IDPESSOA = ' + IntToStr(iIdEmpresa) + ') ';

               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);
            end;

      end;

      Result := True;

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;




//1.3
function TCtrlGeraDados.CalculaValorOrcado(dDataPerCorrente: TDateTime;
                        iDiasPeriodo,iPosIni,iQtdDigitos,iPeriodo,
                        iIdPlanoOrc,iExercicio,iIdPessoa,iIdCenario: integer;
                        sConteudo: string; bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior: boolean;
                        const lstBloco : TStringList  // Edilaine - SOL 185723 / KTN 1742408
                        ): boolean;
begin
   try
     // No Orçado, somente é calculado e na seguinte ordem:
     // 1- Valor fixo informado
     // 2- Composição de outras contas
     // 3- Valor Acumulado
     // 4- Condicional
     // 5- Fórmula

     //1.3.1
     if not CalculaValorFixoInformado('O',sConteudo,iPosIni,iQtdDigitos,iPeriodo,
                                     iExercicio,iIdPlanoOrc,iIdPessoa,iDiasPeriodo,
                                     iIdCenario,bPorGrupo,bCalculaPorPeriodo,dDataPerCorrente,
                                     lstBloco  // Edilaine - SOL 185723 / KTN 1742408
                                     ) then
        raise Exception.Create(MessageInfo);

     //1.3.2
     if not CalculaCompOutrasContas('O',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdCenario,
                                    iIdPessoa,iExercicio,iPeriodo,bPorGrupo,bCalculaPorPeriodo,
                                    bCalculaSaldoAnterior,dDataPerCorrente,
                                    lstBloco  // Edilaine - SOL 185723 / KTN 1742408
                                    ) then
        raise Exception.Create(MessageInfo);

     //1.3.3
     if not CalculaContasAcumulado('O',sConteudo,iIdPessoa,iIdCenario,iPeriodo,
                                   iExercicio,iIdPlanoOrc,iPosIni,iQtdDigitos,bPorGrupo,
                                   bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente,
                                   lstBloco  // Edilaine - SOL 185723 / KTN 1742408
                                   ) then
        raise Exception.Create(MessageInfo);

     //1.3.4
     if not CalculaCompOutrasContas('O',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdCenario,iIdPessoa,
                                    iExercicio,iPeriodo,bPorGrupo,bCalculaPorPeriodo,
                                    bCalculaSaldoAnterior,dDataPerCorrente,
                                    lstBloco  // Edilaine - SOL 185723 / KTN 1742408
                                    ) then
        raise Exception.Create(MessageInfo);

     //1.3.5
     if not CalculaFormulaContas('O',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,
                                 iPosIni,iQtdDigitos,bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente,
                                 lstBloco  // Edilaine - SOL 185723 / KTN 1742408
                                 ) then
        raise Exception.Create(MessageInfo);


     Result := True;
     
   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;





//1.4
function TCtrlGeraDados.CalculaValorRealizado(dDataPerCorrente: TDateTime; iDiasPeriodo,iPosIni,iQtdDigitos,
                                     iPeriodo,iIdPlanoOrc,iExercicio,iIdPessoa,iIdCenario: integer; sConteudo: string;
                                     bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior: boolean;
                                     const lstBloco : TStringList): boolean;    // Edilaine - SOL 185723 / KTN 1742408
var
  sSQL: string;
begin
   try
     // No Realizado, somente é calculado e na seguinte ordem:
     // 1- Arquivos Genéricos
     // 2- Contabilidade
     // 3- Fluxo de Caixa
     // 4- Valor Fixo Informado
     // 5- Acumulado
     // 6- Composição de outras contas
     // 7- Condicional
     // 8- Formula

     //1.4.1

     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaArquivosGenericos('R',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,
                                     iPosIni,iQtdDigitos,bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,
                                     dDataPerCorrente) then
        raise Exception.Create(MessageInfo);}

     //1.4.2
     if not CalculaContabil('R',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,
                            iPosIni,iQtdDigitos,bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente,
                            lstBloco) then   // Edilaine - SOL 185723 / KTN 1742408

        raise Exception.Create(MessageInfo);

     //1.4.3
     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaFluxoCaixa('R',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,
                              iPosIni,iQtdDigitos,bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente) then
        raise Exception.Create(MessageInfo);}

     //1.4.4
     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaValorFixoInformado('R',sConteudo,iPosIni,iQtdDigitos,iPeriodo,iExercicio,iIdPlanoOrc,iIdPessoa,
                                      iDiasPeriodo,iIdCenario,bPorGrupo,bCalculaPorPeriodo,dDataPerCorrente) then
        raise Exception.Create(MessageInfo);}

     //1.4.5
     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaContasAcumulado('R',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,
                                   iPosIni,iQtdDigitos,bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente) then
        raise Exception.Create(MessageInfo);}

     //1.4.6
     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaCompOutrasContas('R',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,iIdCenario,iIdPessoa,
                                    iExercicio,iPeriodo,bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior,dDataPerCorrente) then
        raise Exception.Create(MessageInfo); }

     //1.4.7
     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaContasCondicional('R',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,iPosIni,iQtdDigitos,
                                     bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente) then
        raise Exception.Create(MessageInfo);}

     //1.4.8
     //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     {if not CalculaFormulaContas('R',sConteudo,iIdPessoa,iIdCenario,iPeriodo,iExercicio,iIdPlanoOrc,iPosIni,iQtdDigitos,
                                 bPorGrupo,bCalculaSaldoAnterior,bCalculaPorPeriodo,dDataPerCorrente) then
        raise Exception.Create(MessageInfo);}

     Result := True;

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;



//1.4.2
function TCtrlGeraDados.CalculaContabil(cOrcadoOuReal         : Char;
                                        sConteudo             : string;
                                        iIdPessoa,
                                        iIdCenario,
                                        iPeriodo,
                                        iExercicio,
                                        iIdPlanoOrc,
                                        iPosIni,
                                        iQtdDigitos           : integer;
                                        bPorGrupo,
                                        bCalculaSaldoAnterior,
                                        bCalculaPorPeriodo    : boolean;
                                        dDataCorrente         : TDateTime;
                                        const lstBloco : TStringList): Boolean;  // Edilaine - SOL 185723 / KTN 1742408
var
  sSQL          : string;
  rValor        : Double;
  //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
  iPacEncerraContas:integer;
  rValorContabilCredito: Double;
  rValorContabilDebito: Double;
  rValorCreditoDezembro:Double;
  rValorDebitoDezembro:Double;
  //Fim
  rValorAcum    : Double;
  rValorAnt     : Double;
  CdsPerContab  : TClientDataSet;
  DsSaldoContab : TDataSet;
  bSinalContaPositivo: boolean;
  bFaltaCentroCusto : Boolean;
  vCodCentroCusto : Variant;
  vIdEmpresa      : Variant;
begin
   try
      rValor         := 0;
      rValorAcum     := 0;
      rValorAnt      := 0;
      CdsPerContab   := TClientDataSet.Create(nil);


      //Ricardo SOL: 168266 KINTANA: 1481776
      if _Cds.IsEmpty then
      Begin
        //Pega as contas
        _Cds.Data := SelContasOrcamen(cOrcadoOuReal,
                                      'P',
                                      sConteudo,
                                      iPosIni,
                                      iQtdDigitos,
                                      iIdPlanoOrc,
                                      bPorGrupo);
      end
      else
      begin
        _Cds.first;
      end;

      //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
      {
      //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
      //Buscar na parametrização contábil qual é o encerra contas de resultado
      iPacEncerraContas   := 0;
      CdsParamContab.Data := GetDataPacket('SELECT PACTIPOPERRESULT FROM PARAMCONTAB');
      if not CdsParamContab.IsEmpty then
         iPacEncerraContas   := CdsParamContab.fieldbyname('PACTIPOPERRESULT').AsInteger;
      CdsParamContab.Close;
      //Fim
      }

      // Alterado por Arnaldo V. Scarin em 08/09/2009
      // Sol: 123436 Kintana: 616983
      // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
      // informar as contas de centro de custos quando o flag de centro de custos estiver
      // desmarcado.
      //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
      {If _Cds.FieldByName('Plano').asInteger <> 0 then
        iPlanoContabil := _Cds.FieldByName('Plano').asInteger;}

      // Monta o DataSet que retornará o saldo das contas contábeis. Desta
      //forma não é necessário reescrever a qry, apenas mudar os parâmetros
      if bCalculaPorPeriodo then
      begin
         sSQL := 'SELECT  ' +#13+
                //Bruno Bastos - Sol 122509 - Kintana 604235 - 03/08/2009 - '    SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR ' +
                '    SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)-NVL(PLSCREDITOENCERR, 0)+NVL(PLSDEBITOENCERR, 0)) AS VALOR, ' +#13+ //Bruno Bastos - Sol 122509 - Kintana 604235 - 03/08/2009
                //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                '    SUM(NVL(PLSCREDITOCOR,0) + NVL(PLSDEBITOENCERR, 0)) AS VL_CREDITO_CONTABIL, '  +#13+
                '    SUM( NVL(PLSDEBITOCORRENTE,0) + NVL(PLSCREDITOENCERR, 0)) AS VL_DEBITO_CONTABIL ' +#13+
                //Fim

                 'FROM ' +#13+

                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 comentado
                 //'   PLANOSALDO ' +#13+

                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                 //Adicionado os campo Programa e Tipo de Despesa
                 ' (SELECT PL.*, ' +
                   ' CASE WHEN SUBSTR(TRIM(PL.PLACONTA),1,1) = ' + Quotedstr('4') + ' THEN SUBSTR(TRIM(PL.PLACONTA),4,1) ' +
                   ' ELSE  NULL END AS IDTIPO_DEPESAORCAMEN, ' +
                   ' CASE WHEN SUBSTR(TRIM(PL.PLACONTA),1,1) = ' + Quotedstr('4') +  ' THEN SUBSTR(TRIM(PL.PLACONTA),3,1) ' +
                   ' ELSE   NULL END AS IDPROGRAMAORCAMEN ' +
                 ' FROM PLANOSALDO PL ) PL2 ' +
                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                 'WHERE  ' +#13+
                 '   (PERNUMERO       = :PERNUMERO) AND ' +#13+
                 '   (PEREXERCICIO    = :PEREXERCICIO) AND ' +#13+
                 '   (IDPESSOA        = :IDPESSOA) AND ' +#13+
                 '   (PLACONTA        = :PLACONTA) AND ' +#13+
                 '   (PLANO           = :PLANO) AND  ' +#13+
                 '   ((CODCENTROCUSTO = :CODCENTROCUSTO) OR (:CODCENTROCUSTO IS NULL)) AND ' +#13+
                 '   ((IDEMPRESA      = :IDEMPRESA)      OR (:IDEMPRESA      IS NULL)) AND ' +#13+
                 '   ((UNIDNEGOC      = :UNIDNEGOC)      OR (:UNIDNEGOC      IS NULL)) AND ' +#13+
                 '   ((IDPLANOPREV    = :IDPLANOPREV)    OR (:IDPLANOPREV    IS NULL)) AND ' +#13+
                 '   ((IDPATRO        = :IDPATRO)        OR (:IDPATRO        IS NULL)) AND ' +#13+

                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                 //Adicionado os parâmetros de Programa e Tipo de Despesa
                 '   ((IDTIPO_DEPESAORCAMEN    = :IDTIPO_DEPESAORCAMEN)    OR (:IDTIPO_DEPESAORCAMEN    IS NULL)) AND ' +#13+
                 '   ((IDPROGRAMAORCAMEN        = :IDPROGRAMAORCAMEN)        OR (:IDPROGRAMAORCAMEN        IS NULL))';
                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim


         DsSaldoContab := CreateDataSetParams(sSQL,['PERNUMERO','PEREXERCICIO','IDPESSOA','PLACONTA','PLANO',
                                                    'CODCENTROCUSTO','IDEMPRESA','UNIDNEGOC','IDPLANOPREV','IDPATRO',

                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                    'IDTIPO_DEPESAORCAMEN','IDPROGRAMAORCAMEN'],
                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                                                   [ftInteger,ftInteger,ftInteger,ftString,ftInteger,ftString,
                                                    ftString,ftString,ftString,ftString,

                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                    ftInteger,ftInteger]);
                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim



      end
      else
      begin
         sSQL := 'SELECT /*+ INDEX (LANCAMENTO) */ ' +#13+
                 '       SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,L.LACVALOR * (-1))) AS VALOR, ' +#13+

                 //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                 '    SUM(DECODE(L.LACDEBCRE,''C'',L.LACVALOR,0)) AS VL_CREDITO_CONTABIL, '  +#13+
                 '    SUM(DECODE(L.LACDEBCRE,''D'',L.LACVALOR * (-1),0)) AS VL_DEBITO_CONTABIL ' +#13+
                 //Fim

                 'FROM ' +#13+

                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 comentado
                 //'  LANCAMENTO L, ' +#13+

                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                 //Adicionado os campo Programa e Tipo de Despesa
                 ' (SELECT LA.*, ' +
                 ' CASE WHEN SUBSTR(TRIM(LA.PLACONTA),1,1) = ' + Quotedstr('4') + ' THEN SUBSTR(TRIM(LA.PLACONTA),4,1) ' +
                 ' ELSE  NULL END  AS IDTIPO_DEPESAORCAMEN, ' +
                 ' CASE WHEN SUBSTR(TRIM(LA.PLACONTA),1,1) = ' + Quotedstr('4') +  ' THEN SUBSTR(TRIM(LA.PLACONTA),3,1) ' +
                 ' ELSE   NULL END AS IDPROGRAMAORCAMEN ' +
                 ' FROM LANCAMENTO LA ) L, ' +
                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                 '  PLANILHA P    ' +#13+
                 'WHERE  ' +#13+
                 '  (L.PLACONTA     = :PLACONTA) AND ' +#13+
                 '  (L.PLANO        = :PLANO) AND ' +#13+
                 '  (P.PERNUMERO    = :PERNUMERO) AND ' +#13+
                 '  (P.PEREXERCICIO = :PEREXERCICIO) AND ' +#13+
                 '  (P.IDPESSOA     = :IDPESSOA) AND ' +#13+
                 '  (P.PLNDATDIA    = :PLNDATDIA) AND ' +#13+
                 '  (L.PLNCODIGO    = P.PLNCODIGO) AND ' +#13+
                 '  (CODCENTROCUSTO = :CODCENTROCUSTO) AND ' +#13+
                 '  (IDEMPRESA      = :IDEMPRESA) AND ' +#13+
                 '  (UNIDNEGOC      = :UNIDNEGOC) AND ' +#13+
                 '  (IDPLANOPREV    = :IDPLANOPREV) AND ' +#13+
                 '  (IDPATRO        = :IDPATRO) ';
         DsSaldoContab := CreateDataSetParams(sSQL,['PLACONTA', 'PLANO',         'PERNUMERO', 'PEREXERCICIO','IDPESSOA',
                                                    'PLNDATDIA','CODCENTROCUSTO','IDEMPRESA', 'UNIDNEGOC',   'IDPLANOPREV','IDPATRO'],

                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882

                                                    //'IDTIPO_DEPESAORCAMEN','IDPROGRAMAORCAMEN'],
                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                                                    [ftString,   ftInteger,        ftInteger,  ftInteger,     ftInteger,
                                                    ftDate,     ftString,         ftInteger,  ftInteger,     ftInteger,    ftInteger,

                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                    ftInteger,ftInteger]);
                                                    //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

      end;


      // Pega o período contábil
      CdsPerContab.Data := GetDataPacket('SELECT PERNUMERO, PEREXERCICIO ' +
                                          'FROM ' +
                                          '    PERIODO ' +
                                          'WHERE ' +
                                          '    (IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                                          '    (TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente)) + ',''DD/MM/YYYY'') >= PERDATINI) AND ' +
                                          '    (TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente)) + ',''DD/MM/YYYY'') <= PERDATFIM) ');

      // Varre o Cds das contas
      while not _Cds.Eof do
      begin
          // Anda a barra de progresso
          DoProgresso([2,
                      'Calculando contabilidade...',
                      1,
                      _Cds.RecordCount,
                      _Cds.RecNo,
                      '',
                      iProgIni,
                      iProgFim,
                      iProgCorr]);

          rValor     := 0;

          //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
          rValorContabilCredito := 0;
          rValorContabilDebito  := 0;
          //Fim

          rValorAcum := 0;
          rValorAnt  := 0;

          // Alterado por Arnaldo V. Scarin em 08/09/2009
          // Sol: 123436 Kintana: 616983
          // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
          // informar as contas de centro de custos quando o flag de centro de custos estiver
          // desmarcado.
          bFaltaCentroCusto := Pos('X',_Cds.FieldByName('IDCONTAORCAMEN').AsString) <> 0;


          // Pega a composição da conta em foco
          //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Início
          if bCalculaPorPeriodo then
            _CdsCompContas.Data := SelCompContasOrcamen(_Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                        iIdPlanoOrc,
                                                        cOrcadoOuReal,
                                                        'P',
                                                        CdsPerContab.FieldByName('PERNUMERO').AsInteger,
                                                        CdsPerContab.FieldByName('PEREXERCICIO').AsInteger)
          else
            //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Fim
            _CdsCompContas.Data := SelCompContasOrcamen(_Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                        iIdPlanoOrc,
                                                        cOrcadoOuReal,
                                                        'P');

          // Pega o sinal da conta
          bSinalContaPositivo := (_Cds.FieldByName('FLGSINALCONTA').AsString = 'P');

          // Varre o Cds de composição da conta
          while not _CdsCompContas.Eof do
          begin

             //Ricardo
             rValorCreditoDezembro := 0;
             rValorDebitoDezembro  := 0;

             // Alterado por Arnaldo V. Scarin em 08/09/2009
             // Sol: 123436 Kintana: 616983
             // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
             // informar as contas de centro de custos quando o flag de centro de custos estiver
             // desmarcado.
             If bFaltaCentroCusto then
             begin
               vCodCentroCusto := Null;
               vIdEmpresa      := Null;
             end
             else
             begin
               vCodCentroCusto := Espaco(_CdsCompContas.FieldByName('CODCENTROCUSTO').AsString,10);
               vIdEmpresa      := _CdsCompContas.FieldByName('IDEMPRESA').AsInteger;
             end;

             // Faz a query de SomaRENARENATtório da Contabilidade para cada conta da composição
             if bCalculaPorPeriodo then
             begin
                // Alterado por Arnaldo V. Scarin em 08/09/2009
                // Sol: 123436 Kintana: 616983
                // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
                // informar as contas de centro de custos quando o flag de centro de custos estiver
                // desmarcado.
                OpenDataSetParams(DsSaldoContab,['PERNUMERO','PEREXERCICIO','IDPESSOA','PLACONTA','PLANO',
                                                 'CODCENTROCUSTO','IDEMPRESA','UNIDNEGOC','IDPLANOPREV','IDPATRO',
                                                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                 'IDTIPO_DEPESAORCAMEN','IDPROGRAMAORCAMEN'],
                                                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                                                 VarArrayOf([CdsPerContab.FieldByName('PERNUMERO').AsInteger,
                                                             CdsPerContab.FieldByName('PEREXERCICIO').AsInteger,
                                                             iIdPessoa,
                                                             Espaco(_CdsCompContas.FieldByName('PLACONTA').AsString,18),
                                                             _CdsCompContas.FieldByName('PLANO').AsInteger,
                                                             vCodCentroCusto,
                                                             vIdEmpresa,
                                                             _CdsCompContas.FieldByName('UNIDNEGOC').AsInteger,
                                                             _CdsCompContas.FieldByName('IDPLANOPREV').AsInteger,
                                                             _CdsCompContas.FieldByName('IDPATRO').AsInteger,
                                                             //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                             _CdsCompContas.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger,
                                                             _CdsCompContas.FieldByName('IDPROGRAMAORCAMEN').AsInteger
                                                             //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim
                                                             ]));
             end
             else
             begin
                OpenDataSetParams(DsSaldoContab,['PLACONTA','PLANO','PERNUMERO','PEREXERCICIO','IDPESSOA',
                                                 'PLNDATDIA','CODCENTROCUSTO','IDEMPRESA','UNIDNEGOC','IDPLANOPREV','IDPATRO'],

                                                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                 //'IDTIPO_DEPESAORCAMEN','IDPROGRAMAORCAMEN'
                                                 //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim


                                                 VarArrayOf([Espaco(_CdsCompContas.FieldByName('PLACONTA').AsString,18),
                                                             _CdsCompContas.FieldByName('PLANO').AsInteger,
                                                             CdsPerContab.FieldByName('PERNUMERO').AsInteger,
                                                             CdsPerContab.FieldByName('PEREXERCICIO').AsInteger,
                                                             iIdPessoa,
                                                             dDataCorrente,

                                                             vCodCentroCusto,
                                                             vIdEmpresa,

                                                             _CdsCompContas.FieldByName('UNIDNEGOC').AsInteger,
                                                             _CdsCompContas.FieldByName('IDPLANOPREV').AsInteger,
                                                             _CdsCompContas.FieldByName('IDPATRO').AsInteger,

                                                             //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                                                             _CdsCompContas.FieldByName('IDTIPO_DEPESAORCAMEN').AsInteger,
                                                             _CdsCompContas.FieldByName('IDPROGRAMAORCAMEN').AsInteger
                                                             //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim
                                                             ]));
             end;


             // Incrementa o acumulador de valores das composições das contas
             if not DsSaldoContab.IsEmpty then
             begin

               //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
               //Para os mês de dezembro o valor de crédito e débito deverá ser
               //somente o lançamentos de créditos na LANCAMENTO caso
               //o usuário selecionar por período na tela principal
               if iPeriodo = 12 then
               begin

                    //Período de Dezembro
                    //Valor de Crédito
                    sSQL :=
                       'SELECT ' + #13 +
                       '       ORC.IDCONTAORCAMEN, ' + #13 +
                       '       CON.PEREXERCICIO AS EXERCICIO, ' + #13 +
                       '       CON.PERNUMERO AS PERIODO, ' + #13 +
                       '       ORC.PLACONTA, ' + #13 +
                       '       SUM(NVL(CON.VL_CREDITO_LANCAMENTO,0)) AS VL_CREDITO_LANCAMENTO ' + #13 +
                       ' FROM ' + #13 +




                       //ORCAMENTO
                       ' (SELECT ' + #13 +
                       '       C.* ' + #13 +
                       ' FROM ' + #13 +
                       '       COMPCONTASORCAMEN C ' + #13 +

                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149
                       ' JOIN ' + #13 +
                       '       CONTASORCAMEN   CO ' + #13 +
                       ' ON ' + #13 +
                       '       C.IDCONTAORCAMEN = CO.IDCONTAORCAMEN ' + #13 +
                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149 - fim

                       ' WHERE ' + #13 +
                       //PARAMETROS
                       '      C.IDCONTAORCAMEN =  ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + #13 +
                       '      AND c.PLACONTA = '    + QuotedStr(_CdsCompContas.FieldByName('PLACONTA').AsString) + #13 +
                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149
                       '      AND CO.IDPLANOORCAMEN IN (SELECT DISTINCT IDPLANOORCAMEN  FROM PARAMORCAMENTO) ' + #13 + //Irá retornar o plano orçamentário vigente
                       '      AND C.IDPLANOORCAMEN IN (SELECT DISTINCT IDPLANOORCAMEN  FROM PARAMORCAMENTO) ' + #13 + //Irá retornar o plano orçamentário vigente
                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149 - fim
                       ' )  ORC ' +#13 +

                       ' JOIN ' + #13 +

                       //VALOR DE CREDITO DA CONTABILIDADE - DEZEMBRO
                       ' (select ' + #13 +
                       '         L.PLANO,L.PLACONTA,L.IDPESSOA,NVL(L.IDEMPRESA,1) AS IDEMPRESA,P.PEREXERCICIO,P.PERNUMERO,L.IDPLANOPREV, ' + #13 +
                       '         L.IDPATRO,L.CODCENTROCUSTO,L.UNIDNEGOC,     ' + #13 +
                       '         L.IDTIPO_DEPESAORCAMEN,L.IDPROGRAMAORCAMEN, ' + #13 +
                       '         SUM(LACVALOR) AS VL_CREDITO_LANCAMENTO '      + #13 +


                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                       //' from   lancamento L ' + #13 +

                       ' from '  + #13 +

                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                       //Adicionado os campo Programa e Tipo de Despesa
                       ' (SELECT LA.*, ' +
                       ' CASE WHEN SUBSTR(TRIM(LA.PLACONTA),1,1) = ' + Quotedstr('4') + ' THEN SUBSTR(TRIM(LA.PLACONTA),4,1) ' +
                       ' ELSE  NULL END AS IDTIPO_DEPESAORCAMEN, ' +
                       ' CASE WHEN SUBSTR(TRIM(LA.PLACONTA),1,1) = ' + Quotedstr('4') +  ' THEN SUBSTR(TRIM(LA.PLACONTA),3,1) ' +
                       ' ELSE   NULL END AS IDPROGRAMAORCAMEN ' +
                       ' FROM LANCAMENTO LA ) L ' +
                        //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                       ' join   planilha  p ' + #13 +
                       ' on     l.plncodigo = p.plncodigo ' + #13 +
                       ' Where ' + #13 +
                       '         l.LACDEBCRE = ' + QuotedStr('C') + #13 +
                       ' and   l.TIPCODIGO  NOT IN (SELECT DISTINCT PACTIPOPERRESULT FROM PARAMCONTAB) ' + #13 +
                       //PARAMTROS
                       ' and   p.PEREXERCICIO = ' + IntToStr(iExercicio) + #13 +
                       ' and   p.PERNUMERO = ' + IntToStr(iPeriodo)  + #13 +
                       ' and   l.PLACONTA = ' + QuotedStr(_CdsCompContas.FieldByName('PLACONTA').AsString) + #13 +
                       //
                       ' group by ' + #13 +
                       '       L.PLANO,L.PLACONTA,L.IDPESSOA,L.IDEMPRESA,P.PEREXERCICIO,P.PERNUMERO,L.IDPLANOPREV,' + #13 +
                       '       L.IDPATRO,L.CODCENTROCUSTO,L.UNIDNEGOC' + #13 +
                       ' ) CON' + #13 +

                       ' ON' + #13 +
                       '      CON.PLANO             = ORC.PLANO AND ' + #13 +
                       '      CON.PLACONTA          = ORC.PLACONTA AND ' + #13 +
                       '      NVL(CON.IDPESSOA,1)   = NVL(ORC.IDPESSOA,1) AND ' + #13 +
                       //'      NVL(CON.IDEMPRESA,0)  = NVL(ORC.IDEMPRESA,0) AND ' + #13 +
                       '      CON.IDPLANOPREV       = ORC.IDPLANOPREV AND ' + #13 +
                       '      CON.IDPATRO           = ORC.IDPATRO AND ' + #13 +
                       '      LTRIM(RTRIM(NVL(CON.CODCENTROCUSTO,' + QuotedStr('-') + '))) = LTRIM(RTRIM(NVL(ORC.CODCENTROCUSTO,' + QuotedStr('-') + '))) AND ' + #13 +
                       '      CON.UNIDNEGOC         = ORC.UNIDNEGOC AND ' + #13 +

                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                       '      NVL(CON.IDTIPO_DEPESAORCAMEN,0) = NVL(ORC.IDTIPO_DEPESAORCAMEN,0) AND ' + #13 +
                       '      NVL(CON.IDPROGRAMAORCAMEN,0)   = NVL(ORC.IDPROGRAMAORCAMEN,0)   ' + #13 +
                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim


                       ' GROUP BY  ' + #13 +
                       '       ORC.IDCONTAORCAMEN, ' + #13 +
                       '       CON.PEREXERCICIO, ' + #13 +
                       '       CON.PERNUMERO, ' + #13 +
                       '       ORC.PLACONTA ';

                    CdsParamContab.Data := GetDataPacket(sSQL);
                    if not CdsParamContab.IsEmpty then
                    begin
                       rValorCreditoDezembro := CdsParamContab.FieldByName('VL_CREDITO_LANCAMENTO').AsFloat
                    end
                    else
                       rValorCreditoDezembro := 0;
                    CdsParamContab.Close;

                    //Ricardo Freitas SOL 160539/5921 Kintana 1374082
                    //Período de Dezembro
                    //Valor de Débito
                    sSQL :=
                       'SELECT ' + #13 +
                       '       ORC.IDCONTAORCAMEN,' + #13 +
                       '       CON.PEREXERCICIO AS EXERCICIO, ' + #13 +
                       '       CON.PERNUMERO AS PERIODO, ' + #13 +
                       '       ORC.PLACONTA, ' + #13 +
                       '       SUM(NVL(CON.VL_DEBITO_LANCAMENTO,0)) AS VL_DEBITO_LANCAMENTO ' + #13 +
                       ' FROM ' + #13 +

                       //ORCAMENTO
                       ' (SELECT ' + #13 +
                       //'       S.EXERCICIO,S.PERIODO, ' + #13 +
                       '       C.* ' + #13 +
                       ' FROM ' + #13 +
                       '       COMPCONTASORCAMEN C ' + #13 +
                        //Ricardo de Freitas - SOL 169825 KINTANA  1508149
                       ' JOIN ' + #13 +
                       '       CONTASORCAMEN   CO ' + #13 +
                       ' ON ' + #13 +
                       '       C.IDCONTAORCAMEN = CO.IDCONTAORCAMEN ' + #13 +
                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149 - fim

                       //'  JOIN SALDOORCADO S ON   S.IDCONTAORCAMEN     = C.IDCONTAORCAMEN ' + #13 +
                       //'                         AND S.IDPLANOORCAMEN = C.IDPLANOORCAMEN ' + #13 +
                       //'                         AND S.IDPESSOA       = C.IDPESSOA ' + #13 +
                       ' WHERE ' + #13 +
                       //PARAMETROS
                       //'       S.EXERCICIO = '                 + IntToStr(iExercicio) + #13 +
                       //'       AND S.PERIODO = '               + IntToStr(iPeriodo) + #13 +
                       '      C.IDCONTAORCAMEN =  ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + #13 +
                       '      AND c.PLACONTA = '         + QuotedStr(_CdsCompContas.FieldByName('PLACONTA').AsString) + #13 +

                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149
                       '      AND CO.IDPLANOORCAMEN IN (SELECT DISTINCT IDPLANOORCAMEN  FROM PARAMORCAMENTO) ' + #13 + //Irá retornar o plano orçamentário vigente
                       '      AND C.IDPLANOORCAMEN IN (SELECT DISTINCT IDPLANOORCAMEN  FROM PARAMORCAMENTO) ' + #13 + //Irá retornar o plano orçamentário vigente
                       //Ricardo de Freitas - SOL 169825 KINTANA  1508149 - fims
                       //FIM
                       ' )  ORC ' +#13 +

                       ' JOIN ' + #13 +

                       //VALOR DE DEBITO DA CONTABILIDADE - DEZEMBRO
                       ' (select ' + #13 +
                       '         L.PLANO,L.PLACONTA,L.IDPESSOA,NVL(L.IDEMPRESA,1) AS IDEMPRESA,P.PEREXERCICIO,P.PERNUMERO,L.IDPLANOPREV, ' + #13 +
                       '         L.IDPATRO,L.CODCENTROCUSTO,L.UNIDNEGOC, ' +
                       '         L.IDTIPO_DEPESAORCAMEN,L.IDPROGRAMAORCAMEN, ' +
                       '        SUM(LACVALOR) AS VL_DEBITO_LANCAMENTO ' + #13 +

                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                       ' from   ' + #13 +

                       //Adicionado os campo Programa e Tipo de Despesa
                       ' (SELECT LA.*, ' +
                       ' CASE WHEN SUBSTR(TRIM(LA.PLACONTA),1,1) = ' + Quotedstr('4') + ' THEN SUBSTR(TRIM(LA.PLACONTA),4,1) ' +
                       ' ELSE  NULL END AS IDTIPO_DEPESAORCAMEN, ' +
                       ' CASE WHEN SUBSTR(TRIM(LA.PLACONTA),1,1) = ' + Quotedstr('4') +  ' THEN SUBSTR(TRIM(LA.PLACONTA),3,1) ' +
                       ' ELSE   NULL END AS IDPROGRAMAORCAMEN ' +
                       ' FROM LANCAMENTO LA ) L ' +
                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim


                       ' join   planilha  p ' + #13 +
                       ' on     l.plncodigo = p.plncodigo ' + #13 +
                       ' Where ' + #13 +
                       '         l.LACDEBCRE = ' + QuotedStr('D') + #13 +
                       ' and   l.TIPCODIGO  NOT IN (SELECT DISTINCT PACTIPOPERRESULT FROM PARAMCONTAB) ' + #13 +
                       //PARAMETROS
                       ' and   p.PEREXERCICIO = ' + IntToStr(iExercicio) + #13 +
                       ' and   p.PERNUMERO = ' + IntToStr(iPeriodo)  + #13 +
                       ' and   l.PLACONTA = ' + QuotedStr(_CdsCompContas.FieldByName('PLACONTA').AsString) + #13 +
                       //
                       ' group by ' + #13 +
                       '       L.PLANO,L.PLACONTA,L.IDPESSOA,L.IDEMPRESA,P.PEREXERCICIO,P.PERNUMERO,L.IDPLANOPREV,' + #13 +
                       '       L.IDPATRO,L.CODCENTROCUSTO,L.UNIDNEGOC' + #13 +
                       ' ) CON' + #13 +

                       ' ON' + #13 +
                       '      CON.PLANO             = ORC.PLANO AND ' + #13 +
                       '      CON.PLACONTA          = ORC.PLACONTA AND ' + #13 +
                       '      NVL(CON.IDPESSOA ,1)         = NVL(ORC.IDPESSOA,1) AND ' + #13 +
                       //'      NVL(CON.IDEMPRESA,0)  = NVL(ORC.IDEMPRESA,0) AND ' + #13 +
                       //'      CON.PEREXERCICIO      = ORC.EXERCICIO AND ' + #13 +
                       //'      CON.PERNUMERO         = ORC.PERIODO AND ' + #13 +
                       '      CON.IDPLANOPREV       = ORC.IDPLANOPREV AND ' + #13 +
                       '      CON.IDPATRO           = ORC.IDPATRO AND ' + #13 +
                       '      LTRIM(RTRIM(NVL(CON.CODCENTROCUSTO,' + QuotedStr('-') + '))) = LTRIM(RTRIM(NVL(ORC.CODCENTROCUSTO,' + QuotedStr('-') + '))) AND ' + #13 +
                       '      CON.UNIDNEGOC         = ORC.UNIDNEGOC AND  ' + #13 +

                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
                       '      NVL(CON.IDTIPO_DEPESAORCAMEN,0) = NVL(ORC.IDTIPO_DEPESAORCAMEN,0) AND ' + #13 +
                       '      NVL(CON.IDPROGRAMAORCAMEN,0)   = NVL(ORC.IDPROGRAMAORCAMEN,0)   ' + #13 +
                       //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

                       ' GROUP BY  ' + #13 +
                       '       ORC.IDCONTAORCAMEN, ' + #13 +
                       '       CON.PEREXERCICIO, ' + #13 +
                       '       CON.PERNUMERO, ' + #13 +
                       '       ORC.PLACONTA ';

                    CdsParamContab.Data := GetDataPacket(sSQL);


                    if not CdsParamContab.IsEmpty then
                       rValorDebitoDezembro := CdsParamContab.FieldByName('VL_DEBITO_LANCAMENTO').AsFloat
                    else
                       rValorDebitoDezembro := 0;
                    CdsParamContab.Close;

                    //Mês de Dezembro - Saldo Contabil
                    rValorContabilDebito  := rValorContabilDebito  + rValorDebitoDezembro;
                    rValorContabilCredito := rValorContabilCredito +  rValorCreditoDezembro;
                    rValor                := rValor + (rValorCreditoDezembro - rValorDebitoDezembro);
               end
               else
               begin
                    //Demais Períodos
                    //Saldo Contábil
                    rValor                := rValor + DsSaldoContab.FieldByName('VALOR').AsFloat;
                    rValorContabilCredito := rValorContabilCredito + DsSaldoContab.FieldByName('VL_CREDITO_CONTABIL').AsFloat;
                    rValorContabilDebito  := rValorContabilDebito  + DsSaldoContab.FieldByName('VL_DEBITO_CONTABIL').AsFloat;
               end;

               // Se for para calcular saldo anterior
               if bCalculaSaldoAnterior then
               begin
                  sSQL := 'SELECT  ' +
                          '       SUM(NVL(PLSCREDITOCOR,0)-NVL(PLSDEBITOCORRENTE,0)) AS VALOR FROM ' +
                          'PLANOSALDO ' +
                          'WHERE  ' +
                          '(PLACONTA     = ' + QuotedStr(Espaco(_CdsCompContas.FieldByName('PLACONTA').AsString,18)) + ') AND ' +
                          '(PLANO        = ' + _CdsCompContas.FieldByName('PLANO').AsString + ') AND ' +
                          '(PEREXERCICIO = ' + IntToStr(iExercicio)  + ') AND ' +
                          '(IDPESSOA     = ' + IntToStr(iIdPessoa) + ') AND  ' +
                          '(PERNUMERO IS NULL) ';


                          if Trim(_CdsCompContas.FieldByName('CODCENTROCUSTO').AsString) <> '' then
                             sSQL := sSQL + ' AND (CODCENTROCUSTO LIKE ' + QuotedStr(Trim(_CdsCompContas.FieldByName('CODCENTROCUSTO').AsString)+'%') + ') ' +
                                            ' AND (IDEMPRESA = ' + _CdsCompContas.FieldByName('IDEMPRESA').AsString + ') ';

                          if Trim(_CdsCompContas.FieldByName('UNIDNEGOC').AsString) <> '' then
                             sSQL := sSQL + ' AND (UNIDNEGOC = ' + _CdsCompContas.FieldByName('UNIDNEGOC').AsString + ') ';

                          if Trim(_CdsCompContas.FieldByName('IDPLANOPREV').AsString) <> '' then
                             sSQL := sSQL + ' AND (IDPLANOPREV = ' + _CdsCompContas.FieldByName('IDPLANOPREV').AsString + ') ';

                          if Trim(_CdsCompContas.FieldByName('IDPATRO').AsString) <> '' then
                             sSQL := sSQL + ' AND (IDPATRO = ' + _CdsCompContas.FieldByName('IDPATRO').AsString + ') ';

                  _CdsAux.Data := GetDataPacket(sSQL);

                  // Incrementa o acumulador de saldo anterior das composições das contas
                  if not _CdsAux.IsEmpty then
                     rValorAnt := rValorAnt + _CdsAux.FieldByName('VALOR').AsFloat;
               end;
             end;

             // Cds da composição das contas
             _CdsCompContas.Next;
          end;

          // Pega o valor do acumulado
          rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal,_Cds.FieldByName('FLGACUMULADO').AsString,
                                                _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                _Cds.FieldByName('FORMULA').AsString,rValor,
                                                iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                                bCalculaPorPeriodo,dDataCorrente,iIdCenario);

          // Grava o resultado da soma
          if not bSinalContaPositivo then
            rValor := (rValor * -1);
          if not GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                     _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,
                                     _Cds.FieldByName('FLGSINALCONTA').AsString,rValor,
                                     rValorAcum,dDataCorrente,
                                     //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                     rValorContabilCredito,
                                     rValorContabilDebito,
                                     //Fim
                                     lstBloco) then   // Edilaine - SOL 185723 / KTN 1742408
             raise Exception.Create(MessageInfo);


          // Grava o saldo anterior
          if bCalculaSaldoAnterior then
          begin
             if not bSinalContaPositivo then
               rValorAcum := (rValorAcum * -1);
             if not GravaSaldoCalcAnterior(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                           _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,rValorAnt) then
             raise Exception.Create(MessageInfo);
          end;


          // Edilaine - SOL 190626 / KTN 1803612
          if lstBloco.count >= 5000 then
          begin
             ExecSQL('BEGIN ' + lstBloco.text + ' END;');

             inc(iNumBloco);
             lstBloco.SaveToFile('C:\Planus\Temp\geracaodados_'+IntToStr(iNumBloco)+'.sql');

             if bComitaPeriodo then
             begin
               commit;

               StartTransaction;   // Edilaine - SOL 193936 / KTN 1852777
             end;

             lstBloco.Clear;
          end;
          // Edilaine - SOL 190626 / KTN 1803612 - fim


         // Cds das contas
         _Cds.Next;
      end;

     Result := True;
     FreeAndNil(CdsPerContab);

     FreeAndNil(DsSaldoContab);


   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
         FreeAndNil(CdsPerContab);

         FreeAndNil(DsSaldoContab);
      end;
   end;
end;




//1.3.1 - 1.4.4
function TCtrlGeraDados.CalculaValorFixoInformado(sOrcOuReal,sConteudo: string;
                                                  iPosIni,iQtdDigitos,iMesCorrente,iExercicio,
                                                  iIdPlanoOrc,iIdPessoa,iDiasPeriodo,iIdCenario: integer;
                                                  bPorGrupo,bCalculaPorPeriodo: boolean;
                                                  dDataPerCorrente: TDateTime;
                                                  const lstBloco : TStringList  // Edilaine - SOL 185723 / KTN 1742408
                                                  ): boolean;
var
  sSQL: string;
  rValor,rValorAcum: Double;

begin
   try
      // Cálculo de contas de Valor Fixo Informado (tipo "I")
      _Cds.Data := SelContasOrcamen(sOrcOuReal,'I',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,bPorGrupo);
      rValor    := 0;

      while not _Cds.Eof do
      begin
         // Anda a barra de progresso
         DoProgresso([2,
                     'Calculando valor fixo informado...',
                     1,
                     _Cds.RecordCount,
                     _Cds.RecNo,
                     '',
                      iProgIni,
                      iProgFim,
                      iProgCorr]);
                           
         // Verifica se o cálculo da conta informada é Diário ou por Período
         if (_Cds.FieldByName('FLGINFDIAMES').AsString = 'P') then
         begin
            if sOrcOuReal = 'O' then
               rValor := RoundCM((_Cds.FieldByName('VLRINFORMADOORC').AsFloat / iDiasPeriodo),2)
            else
               rValor := RoundCM((_Cds.FieldByName('VLRINFORMADOREAL').AsFloat / iDiasPeriodo),2);
         end
         else
         begin
            if sOrcOuReal = 'O' then
               rValor := _Cds.FieldByName('VLRINFORMADOORC').asFloat
            else
               rValor := _Cds.FieldByName('VLRINFORMADOREAL').asFloat;
         end;

         if _Cds.FieldByName('FLGSINALCONTA').AsString = 'N' then
            rValor := rValor * (-1);

         rValorAcum := CalculaValorDoAcumulado(sOrcOuReal, //3.
                                               _Cds.FieldByName('FLGACUMULADO').AsString,
                                               _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                               _Cds.FieldByName('FORMULA').AsString,
                                               rValor,
                                               iIdPlanoOrc,
                                               iMesCorrente,
                                               iExercicio,
                                               iIdPessoa,
                                               bCalculaPorPeriodo,
                                               dDataPerCorrente,
                                               iIdCenario);

         if not GravaSaldoCalculado(iIdCenario, //2.
                                    iIdPlanoOrc,
                                    iMesCorrente,
                                    iExercicio,
                                    iIdPessoa,
                                    _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                    sOrcOuReal,
                                    _Cds.FieldByName('FLGSINALCONTA').AsString,
                                    rValor,
                                    rValorAcum,
                                    dDataPerCorrente,
                                    //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                    -1,
                                    -1,
                                    //Fim
                                    lstBloco // Edilaine - SOL 185723 / KTN 1742408
                                    ) then
            raise Exception.Create(MessageInfo);

         _Cds.Next;
      end;

      Result := True;
   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;




function TCtrlGeraDados.SelContasOrcamen(sOrcOuReal,sTipoCalcContas,sConteudo: string;
                                         iPosIni,iQtdDigitos,iIdPlanoOrc: integer; bPorGrupo: boolean): OleVariant;
var
   sSQL: string;
begin

   // Seleciona as Contas Orcamentárias do Tipo desejado, com o Calculo (O/R) desejado

   //Ricardo, adicionado o DISTINCT, devido o join caom a tabela COMPCONTASORCAMEN
   sSQL := ' SELECT DISTINCT C.IDPLANOORCAMEN,'+#13;
           // Alterado por Arnaldo V. Scarin em 08/09/2009
           // Sol: 123436 Kintana: 616983
           // Alteração da Rotina de Centro de Custos, para desvincular a obrigatoriedade de
           // informar as contas de centro de custos quando o flag de centro de custos estiver
           // desmarcado.

   //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
   //sSQL := sSQL + '       CC.PLANO,'+#13;

   sSQL := sSQL + '       C.IDCONTAORCAMEN,'+#13+
                  '       C.FLGSINALCONTA,'+#13+
                  '       C.FLGINFDIAMES, '+#13;

   if sOrcOuReal = 'O' then
      sSQL := sSQL + ' C.FORMULAORCADO AS FORMULA, '+#13
   else
      sSQL := sSQL + ' C.FORMULAREALIZADO AS FORMULA, '+#13;

   sSQL := sSQL + '       C.IDDATAVIEW, '+#13+
                  '       C.ORIGEMCMDV, '+#13+
                  '       C.FLGACUMULADO, '+#13+
                  '       C.FLGATIVA, '+#13+
                  '       C.VLRINFORMADOREAL, '+#13+
                  '       C.VLRINFORMADOORC '+#13+
                  ' FROM CONTASORCAMEN  C,'+#13+
                  '      GRUPOORCAMEN   G ';

   //Ricardo SOL: 168266 KINTANA: 1481776
   if sOrcOuReal = 'R' then
   begin
        sSQL := sSQL +  ' ,COMPCONTASORCAMEN CC ' + #13;
   end;

   sSQL := sSQL + ' WHERE ' + #13 +
                  '   (C.IDPLANOORCAMEN = G.IDPLANOORCAMEN) AND ' + #13 +
                  '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' + #13 ;

   //Ricardo SOL: 168266 KINTANA: 1481776
   if sOrcOuReal = 'R' then
   begin
        sSQL := sSQL +
                  '   (G.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND ' + #13 +
                  '   (C.IDPLANOORCAMEN = CC.IDPLANOORCAMEN) AND ' + #13 +
                  '   (C.IDCONTAORCAMEN = CC.IDCONTAORCAMEN) AND ' + #13;
   end;

   sSQL := sSQL + '   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND ' + #13;


   if sOrcOuReal = 'O' then
     //Orçado
     sSQL := sSQL + ' (C.TIPOCALCORCADO = ' + QuotedStr(sTipoCalcContas) + ') ' + #13  //AND (C.FLGCALCORCADO = ''N'')'+#13
   else
     //Realizado
     sSQL := sSQL + ' (C.TIPOCALCREALIZADO = ' + QuotedStr(sTipoCalcContas) + ')' +  #13;  //+ ') AND (C.FLGCALCREAL = ''N'')'+#13;

   if Trim(sConteudo) <> '' then
   begin
     if bPorGrupo then
        //Ricardo de Freitas - SOL 160539 - KINTANA 1349786 - adicioando TRIM
        sSQL := sSQL + ' AND (SUBSTR(G.CODGRUPOORC,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = ' + QuotedStr(Trim(sConteudo)) + ')'+#13
     else
        sSQL := sSQL + ' AND (SUBSTR(C.IDCONTAORCAMEN,' + IntToStr(iPosIni) + ',' + IntToStr(iQtdDigitos) + ') = ' + QuotedStr(Trim(sConteudo)) + ')'+#13;
   end;

   sSQL := sSQL + ' AND (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ')' + #13 +
                  ' ORDER BY C.IDCONTAORCAMEN ' + #13;
   Result := GetDataPacket(sSQL);
end;




//3.
function TCtrlGeraDados.CalculaValorDoAcumulado(sOrcOuReal,sFlgAcumulado,sIdContaOrc,
                                                sFormulaOrcadoReal: string;
                                                rValorDia: Double;
                                                iIdPlanoOrc, iMesCorrente,iExercicio,iIdEmpresa: integer;
                                                bCalcPorPeriodo: boolean;
                                                dDataPerCorrente: TDateTime;
                                                iIdCenario: integer = -1): Double;
var
   sCalculo,sFormula,sMesAnt : String;
   CdsAux   : TClientDataSet;
   sSQL     : string;
   wAno,wMes,wDia: Word;
   dDataAnt : TDateTime;


begin
    try
       CdsAux  := TClientDataSet.Create(nil);

       if Trim(sFlgAcumulado) = '' then
       begin
          Result := 0;
          Exit;
       end;

       // Tipo de cálculo do acumulado
       case sFlgAcumulado[1] of
          // Soma as parcelas por período
          'N': begin
                  // Se for informado um cenário...
                  if iIdCenario <> -1 then
                     sSQL := 'SELECT ' +
                             '   0 AS REAL, ' +
                             '   SUM(VLRORCCENARIO) AS ORC ' +
                             'FROM ' +
                             '   VALORESCENARIO ' +
                             'WHERE ' +
                             '   (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrc) + ') AND ' +
                             '   (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)  + ') AND ' +
                             '   (IDPESSOA       = ' + IntToStr(iIdEmpresa)   + ') AND ' +
                             '   (EXERCICIO      = ' + IntToStr(iExercicio)   + ') AND ' +
                             '   ((PERIODO      <= ' + IntToStr(iMesCorrente) + ') OR (PERIODO IS NULL)) AND ' +
                             '   (IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') '
                  else
                  begin
                     sSQL := 'SELECT ' +
                             '   SUM(VLRREALACUM) AS REAL, ' +
                             '   SUM(VLRORCACUM) AS ORC ' +
                             'FROM ' +
                             '   SALDOORCADO ' +
                             'WHERE ' +
                             '   (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrc) + ') AND ' +
                             '   (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)  + ') AND ' +
                             '   (IDPESSOA       = ' + IntToStr(iIdEmpresa)   + ') AND ';


                             if bCalcPorPeriodo then
                             begin
                                DecodeDate(dDataPerCorrente,wAno,wMes,wDia);
                                dDataAnt := EncodeDate(wAno, wMes, 1) - 15;
                                DecodeDate(dDataAnt,wAno,wMes,wDia);

                                sMesAnt  := FormatFloat('0000', wAno) + FormatFloat('00', wMes );

                                sSQL := sSQL + '   (TO_CHAR(DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(sMesAnt) + ') ';
                             end
                             else
                                sSQL := sSQL + '   (TO_CHAR(DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataPerCorrente - 1)) + ') ';

                  end;

                  CdsAux.Data := GetDataPacket(sSQL);

                  // Para orçado...
                  if sOrcOuReal = 'O' then
                  begin
                     if not(CdsAux.IsEmpty) then
                        Result := CdsAux.FieldByName('ORC').asFloat + rValorDia
                     else
                        Result := rValorDia;
                  end

                  // para realizado...
                  else
                  begin
                     if not(CdsAux.IsEmpty) then
                        Result := CdsAux.FieldByName('REAL').asFloat + rValorDia
                     else
                        Result := rValorDia;
                  end;
               end;


          // Calcula quando emite, ou pela fórmula do Orçado ou Realizado
          'O','R','S': begin
                          sFormula := DecodificaFormula(sFormulaOrcadoReal, //3.1
                                                        'A',
                                                        sOrcOuReal[1],
                                                        iIdPlanoOrc,
                                                        iIdCenario,
                                                        iPeriodoAtu,
                                                        iExercicio,
                                                        iIdEmpresa,
                                                        False,
                                                        bCalcPorPeriodo,
                                                        dDataPerCorrente);
                          if Trim(sFormula) <> '' then
                          try
                             pParser.Expression := sFormula;
                             Result := RoundCM(pParser.Value,2);
                          except
                             Result := 0;
                          end;
                       end;

          // Repete o valor da última parcela
          'U': Result := rValorDia;

       else
           Result := 0;
       end;

   finally
      FreeAndNil(CdsAux);
   end;
end;



//3.1
function TCtrlGeraDados.DecodificaFormula(sFormula: string;
                                          cTipoCalc,cOrcadoOuReal: Char;
                                          iIdPlanoOrc,iIdCenario,iPeriodo,
                                          iExercicio,iIdPessoa: integer;
                                          bSaldoAnterior,bCalculaPorPeriodo: boolean;
                                          dDataCorrente: TDateTime): string;
var
   iCharFormula: integer;
   sContaOuGrupo,sValor,sLinhaDecod: string;
   tTipoConteudo: tConteudoFormula;

begin
   //Pega as Contas/Grupos presentes na fórmula e as transforma em valores
   //para serem processadas pelo parser (soma,subtração,divisão e multiplicação)

   tTipoConteudo := tcOutros;

   //Faz a varredura das contas/grupos e as substitui pelos seus valores
   for iCharFormula := 1 to length(sFormula) do
   begin
      case sFormula[iCharFormula] of
         // Grupo ou Contas orçamentárias
         'C': begin
                 tTipoConteudo := tcConta;
                 Continue;
              end;
         'G': begin
                 tTipoConteudo := tcGrupo;
                 Continue;
              end;

         // Se for um caractere numérico, move-o para a variável
         '0'..'9': begin
                      sContaOuGrupo := sContaOuGrupo + sFormula[iCharFormula];
                      Continue;
                   end;
      else
         case tTipoConteudo of
            tcGrupo,tcConta : begin
                                 if Trim(sContaOuGrupo) <> '' then
                                 begin
                                    // Testa se a conta/grupo não foi calculada. Se não foi, sai da função
                                    //3.1.1
                                    if not VerificaContaJaCalculada(sContaOuGrupo,cOrcadoOuReal,iIdPlanoOrc,(tTipoConteudo = tcGrupo)) then
                                    begin
                                       DoProgresso([4,'Verificando fórmula. Conta/Grupo ' +
                                                   QuotedStr(sContaOuGrupo) + ' ainda não calculado(a) ']);

                                       Result := '';
                                       Exit;
                                    end;
                                 end;

                                 // Se for algum sinal de operador (+,-,X,/), retorna o valor da
                                 //Conta/Grupo e adiciona-o, junto com o operador na variável de retorno
                                 if Trim(sContaOuGrupo) <> '' then
                                    sValor := RetornaValorContaParaFormula(sContaOuGrupo, //3.1.2
                                                                           iIdPlanoOrc,
                                                                           iIdCenario,
                                                                           iPeriodo,
                                                                           iExercicio,
                                                                           iIdPessoa,
                                                                           (tTipoConteudo = tcGrupo),
                                                                           bSaldoAnterior,
                                                                           bCalculaPorPeriodo,
                                                                           cTipoCalc,
                                                                           cOrcadoOuReal,
                                                                           dDataCorrente)
                                 else
                                    sValor := '';

                                 sLinhaDecod   := Trim(sLinhaDecod) + Trim(sValor) + Trim(sFormula[iCharFormula]);
                                 sContaOuGrupo := '';
                                 tTipoConteudo := tcOutros;
                              end;


            tcOutros : begin
                          sLinhaDecod   := Trim(sLinhaDecod) + Trim(sContaOuGrupo) + Trim(sFormula[iCharFormula]);
                          sContaOuGrupo := '';
                       end;
         end;
      end;
   end;


   //
   sLinhaDecod := Trim(sLinhaDecod) + Trim(sContaOuGrupo);


   //Varre a fórmula e troca todas as possíveis vírgulas por pontos
   //(o Parser não interpreta vírgulas)
   sLinhaDecod := StringReplace(sLinhaDecod,',','.',[rfReplaceAll]);

   Result := sLinhaDecod;    
end;




//2.
function TCtrlGeraDados.GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa: integer;
                                            sIdContaOrcamen,sOrcOuReal,sFlgSinalConta: string;
                                            rValor,rValorAcum: Double;
                                            dDataCorrente: TDateTime;
                                            rValorCreditoContabil:Double;
                                            rValorDebitoContabil:Double;
                                            const lstBloco : TStringList): boolean;   // Edilaine - SOL 185723 / KTN 1742408

var
   sSQL: string;
   CdsAux: TClientDataSet;
   svlr: string; // William Santana SOL: 204073 KIN: 1974951
   CdsAuxMensagem: TClientDataSet; //Higor Nayde Ferreia   SOL204073/15674
begin
   try
      Result := False;
      //if not InTransaction then
      //   StartTransaction;
      CdsAux := TClientDataSet.Create(nil);
      CdsAuxMensagem := TClientDataSet.Create(nil); //Higor Nayde Ferreia   SOL204073/15674
      // Se for informado um cenário
      if iIdCenario <> -1  then
      begin
         // Verifica se já existe algum valor lançado
         sSQL := 'SELECT IDVALORESCENARIO ' +
                 'FROM VALORESCENARIO ' +
                 'WHERE ' +
                 '  (IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '  (IDCONTAORCAMEN   = ' + QuotedStr(sIdContaOrcamen) +  ') AND ' +
                 '  (EXERCICIO        = ' + IntToStr(iExercicio) + ') AND ' +
                 '  (PERIODO          = ' + IntToStr(iPeriodo) + ') AND ' +
                 '  (IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                 '  (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') ';

         CdsAux.Data := GetDataPacket(sSQL);

         // Se não existir insere um novo registro
         if CdsAux.IsEmpty then
         begin
            sSQL := 'INSERT INTO VALORESCENARIO ' +
                    '   (IDVALORESCENARIO,IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ' +
                    '    PERIODO, IDPESSOA, IDCENARIOORCAMEN, VLRORCCENARIO) ' +
                    'VALUES ' +
                    '  (' + IntToStr(GetSequence('VALORESCENARIO')) + ', ' +
                    '   ' + QuotedStr(sIdContaOrcamen) + ', ' +
                    '   ' + IntToStr(iIdPlanoOrc) + ', ' +
                    '   ' + IntToStr(iExercicio) +  ', ' +
                    '   ' + IntToStr(iPeriodo) +  ', ' +
                    '   ' + IntToStr(iIdPessoa) + ', ' +
                    '   ' + IntToStr(iIdCenario) + ', ' +
                    '   ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ' ) ';

            if lstBloco <> nil then      // Edilaine - SOL 185723 / KTN 1742408
               lstBloco.Add(sSQL+'; ')   // Edilaine - SOL 185723 / KTN 1742408
            else
              if not ExecSQL(sSQL) then
                 raise Exception.Create(MessageInfo);

         end
         else
         begin
            // Caso exista, faz o update
            sSQL := 'UPDATE VALORESCENARIO ' +
                    'SET ' +
                    '   VLRORCCENARIO  = VLRORCCENARIO + ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + '  ' +
                    'WHERE (IDVALORESCENARIO = ' + CdsAux.FieldByName('IDVALORESCENARIO').AsString + ') ';

            if lstBloco <> nil then       // Edilaine - SOL 185723 / KTN 1742408
               lstBloco.Add(sSQL+'; ')    // Edilaine - SOL 185723 / KTN 1742408
            else
               if not ExecSQL(sSQL) then
                  raise Exception.Create(MessageInfo);
         end;
      end
      else

     // William Santana SOL: 204073 KIN: 1974951
     begin
        if (bValidacaoFDO) then
        begin //Higor Nayde Ferreia   SOL204073/15674   inicio
         sSQL := 'SELECT S.IDCONTAORCAMEN, S.DATAREFERENCIA, S.VLRREALIZADO VALORREALIAZADO, S.VLRCOMPROMETIDO,(S.VLRREALIZADO + S.VLRCOMPROMETIDO) VLRREALIZADO, S.VLRORCADO, S.IDPLANOORCAMEN, S.IDPESSOA, '+
                 ' (SELECT DISTINCT G.NOMEGRUPOORCAMEN '+
                 ' FROM GRUPOORCAMEN G, CONTASORCAMEN C '+
                 ' WHERE G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN '+
                 ' AND  C.IDCONTAORCAMEN = S.IDCONTAORCAMEN ) as NOMEGRUPO '+
                 ' FROM ' +
                 ' SALDOORCADO S' +
                 ' WHERE ' +
                 ' (S.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 ' (S.IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') AND ' +
                 ' (S.DATAREFERENCIA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente))+  ',''DD/MM/YYYY'')) AND ' +
                 ' (S.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') ';
         CdsAux.Data := GetDataPacket(sSQL);
         svlr := '';                                 //Higor Nayde Ferreia   SOL204073/15674 FIM
         case sOrcOuReal[1] of
          {'O': begin
                 if (CdsAux.FieldByName('VLRORCADO').AsFloat <> rValor) and not(CdsAux.IsEmpty) then
                 begin
                  MessageInfo := 'Foi encontrado uma diferença de valor R$ ' +
                          svlr + ' para o grupo '+ CdsAux.FieldByName('NOMEGRUPO').AsString +
                         'entre o valor no Orçamento e os valores registrados nas Contas Contábeis. ' +
                         'Favor verificar os valores!' ;

                 end;
               end;  }

          'R': begin   //Higor Nayde Ferreia   SOL204073/15674 Inicio
                if (CdsAux.FieldByName('VLRREALIZADO').AsFloat <> rValor) and not(CdsAux.IsEmpty) then
                begin
                  if (((CdsAux.FieldByName('VLRREALIZADO').AsFloat) - rValor) < 0)  then
                   svlr := '(R$ '+ FormatFloat('#,##0.00',(ABS(CdsAux.FieldByName('VLRREALIZADO').AsFloat - rValor)))+')'
                  else
                   svlr := 'R$ '+ FormatFloat('#,##0.00',(CdsAux.FieldByName('VLRREALIZADO').AsFloat - rValor));

                   sSQL:=     ' SELECT CO.IDCONTAORCAMEN,                                                                    '+
                     '  TRIM(GR.CODGRUPOORC) ||'' - '' || GR.NOMEGRUPOORCAMEN AS GRUPO,                              '+
                     '  TRIM(CC.CODEXTERNO) || '' - '' || CC.NOME AS CENTRO_CUSTO,                                    '+
                     '  UN.NOME AS ATIVIDADE,                                                                       '+
                     '  PP.NOME AS PLANOPREV,                                                                       '+
                     '  PE.NOME AS PATRO,                                                                           '+
                     '  DECODE(SUBSTR(CO.IDCONTAORCAMEN, 31, 1), ''1'', ''Programa Previdenciário'', ''2'', ''Programa de Investimento'', ''Outros'')  AS PROGRAMA, '+
                     '  DECODE(SUBSTR(CO.IDCONTAORCAMEN, 32, 1), ''1'', ''Comum'', ''Específico'') AS TIPO_DESPESA                                              '+
                     '     FROM                                                                                                                           '+
                     '     CONTASORCAMEN CO                                                                                                               '+
                     '     JOIN GRUPOORCAMEN GR ON GR.IDGRUPOORCAMEN = CO.IDGRUPOORCAMEN AND GR.IDPLANOORCAMEN = '+  IntToStr(iIdPlanoOrc) +
                     '     JOIN CENTCUST CC ON CC.CODCENTROCUSTO = CO.CODCENTROCUSTO                                                                      '+
                     '     JOIN UNIDNEGOCIO UN ON UN.UNIDNEGOC = CO.UNIDNEGOC                                                                             '+
                     '     JOIN PLANPREVCONTABIL PP ON PP.IDPLANOPREV = CO.IDPLANOPREV                                                                    '+
                     '     JOIN PATRO PT ON PT.IDPESSOA = CO.IDPATRO                                                                                      '+
                     '     JOIN PESSOA PE ON PE.IDPESSOA = PT.IDPESSOA                                                                                    '+
                     '   WHERE CO.IDPLANOORCAMEN = '+ IntToSTR(iIdPlanoOrc) +
                     '  AND CO.IDCONTAORCAMEN = '+ sIdContaOrcamen ;

                     CdsAuxMensagem.Data := GetDataPacket(sSQL);

                 sLog6 := sLog6 + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)+
                 'Foi encontrado uma diferença de '+svlr+' no valor, realizado para o Grupo '+

                 //Wylliam Leite - SOL: 249911 PPM: 702263
                 //CdsAux.FieldByName('GRUPO').AsString+', '+
                 CdsAuxMensagem.FieldByName('GRUPO').AsString+', '+

                 'Conta Orçamentária: '+CdsAuxMensagem.FieldByName('IDCONTAORCAMEN').AsString+', '+
                 'Centro de Custo: '+CdsAuxMensagem.FieldByName('CENTRO_CUSTO').AsString   +', '+
                 'Programa: '+CdsAuxMensagem.FieldByName('PROGRAMA').AsString +', '+
                 'Plano: '+CdsAuxMensagem.FieldByName('PLANOPREV').AsString+', '+
                 'Patrocinadora: '+CdsAuxMensagem.FieldByName('PATRO').AsString+', '+
                 'Atividade/Projeto: '+CdsAuxMensagem.FieldByName('ATIVIDADE').AsString+', '+ // <Atividade/Projeto>,
                 //'Tipo de Despesa: '+CdsAuxMensagem.FieldByName('PROGRAMA').AsString+', '+
                 //CdsAuxMensagem.FieldByName('IDDESPESAORC').AsString+', '+
                 'Tipo de Despesa: '+CdsAuxMensagem.FieldByName('TIPO_DESPESA').AsString+', '+
                 'Mês de referência: '+FormatDateTime('MM',sDatainicio)+', '+
                 'entre o valor registrato nas contas orçamentárias por grupo do Orçamento e'+
                 ' os valores registrados no contábil! Favor verificar os valores!'+#13#10 ;

                                                                   {

                  sLog6 := sLog6 + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now)+ ': Foi encontrado uma diferença de valor ' +
                         svlr + ' no valor realizado para o grupo '+ CdsAux.FieldByName('NOMEGRUPO').AsString +
                        ' entre o valor no Orçamento e os valores registrados nas Contas Contábeis. ' +
                        'Favor verificar os valores!'+#13#10 ;
                                                  }
                 Result := True;   //isso é para o sistema continuar o processo, mas não gravar o registro
                 //exit;
                end;
               end;

         end;
        end;      //Higor Nayde Ferreia   SOL204073/15674
      //END William Santana
      //Higor Nayde Ferreia   SOL204073/15674 INICIO
      // Se não for informado um cenário, atualiza apenas a SALDOORCADO
      //if ((rValor <> 0) or (rValorAcum <> 0) or (CdsAux.FieldByName('VALORREALIAZADO').AsFloat <> 0) or (CdsAux.FieldByName('VLRCOMPROMETIDO').AsFloat <> 0)) then
      if ((rValor <> 0) or (rValorAcum <> 0)) then
      begin
          //Busca na tabela de Saldos se o registro existe
         sSQL := 'SELECT IDCONTAORCAMEN, DATAREFERENCIA ' +
                 'FROM ' +
                 '   SALDOORCADO ' +
                 'WHERE ' +
                 '  (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '  (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') AND ' +
                 '  (DATAREFERENCIA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente))+  ',''DD/MM/YYYY'')) AND ' +
                 '  (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') ';

         CdsAux.Data := GetDataPacket(sSQL);


         // Se não existir insere o novo registro
         if CdsAux.IsEmpty then
         begin
            sSQL := 'INSERT INTO SALDOORCADO ' +
                    '   (IDCONTAORCAMEN, IDPLANOORCAMEN, DATAREFERENCIA, EXERCICIO, ' +
                    '    PERIODO, IDPESSOA, ' +
                    //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                    '    VLRCREDITO_CONTABIL, VLRDEBITO_CONTABIL, ' +
                    //Fim
                    //Wylliam Leite - SOL: 249911 PPM: 702263
                    //' VLRORCADO, VLRORCACUM, VLRREALIZADO,VLRRESERVADO, VLRREALACUM) ' +
                    ' VLRORCADO, VLRORCACUM, VLRREALIZADO, VLRREALACUM) ' +

                    'VALUES ' +
                    '   ('+ QuotedStr(sIdContaOrcamen) + ',  ' +
                    '   ' + IntToStr(iIdPlanoOrc) + ', ' +
                    '   ' + QuotedStr(FormatDateTime('dd.mm.yyyy',dDataCorrente)) + ' , ' +
                    '   ' + IntToStr(iExercicio) + ', ' +
                    '   ' + IntToStr(iPeriodo) + ', ' +
                    //Wylliam Leite - SOL: 249911 PPM: 702263
                    //'   ' + FloatToStr(rValor)+ ', '+ //aqui
                    //'   ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ', '+ //aqui

                    '   ' + IntToStr(iIdPessoa) + ', ';

                    //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                    if (rValorCreditoContabil <> -1) and (rValorDebitoContabil <> -1) then
                    begin
                         sSQL := sSQL +
                                 StringReplace(FloatToStr(rValorCreditoContabil ),',','.',[rfReplaceAll]) + ',  ' +
                                 StringReplace(FloatToStr(rValorDebitoContabil),',','.',[rfReplaceAll])   + ',  ';
                    end
                    else
                    begin
                         sSQL := sSQL +
                                 ' NULL , ' +
                                 ' NULL , ' ;
                    end;
                    //Fim

                    case sOrcOuReal[1] of
                       'O': begin
                              sSQL := sSQL + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ',  ';

                              if Trim(sFlgSinalConta) = 'P' then
                                 sSQL := sSQL + StringReplace(FloatToStr(rValorAcum),',','.',[rfReplaceAll]) + ',  '
                              else
                                 sSQL := sSQL + StringReplace(FloatToStr(rValorAcum * -1),',','.',[rfReplaceAll]) + ',  ';

                              sSQL := sSQL + '0,0) ';
                            end;

                       'R': begin
                               sSQL := sSQL + '0,0,' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ',  ';

                              if Trim(sFlgSinalConta) = 'P' then
                                 sSQL := sSQL + StringReplace(FloatToStr(rValorAcum),',','.',[rfReplaceAll]) + ')  '
                              else
                                 sSQL := sSQL + StringReplace(FloatToStr(rValorAcum * -1),',','.',[rfReplaceAll]) + ')  ';
                            end;
                    end;

                    if lstBloco <> nil then       // Edilaine - SOL 185723 / KTN 1742408
                       lstBloco.Add(sSQL+'; ')    // Edilaine - SOL 185723 / KTN 1742408
                    else
                       if not ExecSQL(sSQL) then
                          raise Exception.Create(MessageInfo);

         end
         else

         // Caso exista, faz o update
         begin
            // Muda o valor do acumulado, de acordo com o sinal da conta
            if Trim(sFlgSinalConta) <> 'P' then
               rValorAcum := (rValorAcum * -1);

            sSQL := 'UPDATE SALDOORCADO ' +
                    'SET ';

                    //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                    if (rValorCreditoContabil <> -1) and (rValorDebitoContabil <> -1) then
                    begin
                         sSQL := sSQL +
                              ' VLRCREDITO_CONTABIL = ' + StringReplace(FloatToStr(rValorCreditoContabil ),',','.',[rfReplaceAll]) + ',  ' +
                              ' VLRDEBITO_CONTABIL  = ' + StringReplace(FloatToStr(rValorDebitoContabil),',','.',[rfReplaceAll])   + ',  ';
                    end;
                    //Fim

                    case sOrcOuReal[1] of
                       'O': sSQL := sSQL + 'VLRORCADO  = ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ',  ' +
                                           'VLRORCACUM = ' + StringReplace(FloatToStr(rValorAcum),',','.',[rfReplaceAll]) + ' ';

                       'R': sSQL := sSQL + 'VLRREALIZADO = ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ',  ' +
                                           'VLRCOMPROMETIDO = 0.0000000 ,  ' +
                                           'VLRREALACUM  = ' + StringReplace(FloatToStr(rValorAcum),',','.',[rfReplaceAll]) + ' ';
                    end;

                    sSQL := sSQL + 'WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)+ ') AND ' +
                                   '      (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen)+ ') AND ' +
                                   '      (DATAREFERENCIA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente)) +  ',''DD/MM/YYYY'')) AND ' +
                                   '      (IDPESSOA       = ' + IntToStr(iIdPessoa) +')';
                    //Higor Nayde Ferreia   SOL204073/15674 FIM
                    if lstBloco <> nil then         // Edilaine - SOL 185723 / KTN 1742408
                       lstBloco.Add(sSQL+'; ')      // Edilaine - SOL 185723 / KTN 1742408
                    else
                       if not ExecSQL(sSQL) then
                          raise Exception.Create(MessageInfo);
         end;
      end;
     end;

      //Seta as Flags de Cálculo da conta selecionada para "S" - Calculada
      sSQL := 'UPDATE CONTASORCAMEN ' +
              'SET ';

              case sOrcOuReal[1] of
                 'O': sSQL := sSQL + 'FLGCALCORCADO = ''S'' ';
                 'R': sSQL := sSQL + 'FLGCALCREAL   = ''S'' ';
              end;

           sSQL := sSQL + ' WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)       + ') AND ' +
                          '       (IDCONTAORCAMEN  = ' + QuotedStr(sIdContaOrcamen) + ') ';

      if lstBloco <> nil then        // Edilaine - SOL 185723 / KTN 1742408
         lstBloco.Add(sSQL+'; ')     // Edilaine - SOL 185723 / KTN 1742408
      else
         if not ExecSQL(sSQL) then
            raise Exception.Create(MessageInfo);

      //commit;
      Result := True;
      FreeAndNil(CdsAux);

   except
      on E:Exception do
      begin
         //Rollback;
         MessageInfo := E.Message;
         Result      := False;
         FreeAndNil(CdsAux);
         FreeAndNil(CdsAuxMensagem);
      end;
   end;
end;



//3.1.2
function TCtrlGeraDados.RetornaValorContaParaFormula(sContaOuGrupo: string;
                                                     iIdPlanoOrc,iIdCenario,
                                                     iPeriodo,iExercicio,iIdPessoa: integer;
                                                     bPorGrupo,
                                                     bSaldoAnterior,
                                                     bCalculaPorPeriodo: boolean;
                                                     cTipoCalc,cOrcadoOuReal: Char;
                                                     dDataCorrente: TDateTime): string;



var
  sSQL: string;
  CdsAux: TClientDataSet;
  bSinalContaPositivo: boolean;
  iAno,iMes,iDia: Word;
  
begin
   try
      CdsAux := TClientDataSet.Create(nil);

      {**********************************************************************************}
       // Se o valor retornado for por grupo
      {**********************************************************************************}
      if bPorGrupo then
      begin
         // Verifica o sinal de todo o grupo
         sSQL := 'SELECT DISTINCT C.FLGSINALCONTA ' +
                 'FROM  CONTASORCAMEN C, GRUPOORCAMEN G ' +
                 'WHERE ' +
                 '   (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                 '   (G.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
                 '   (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '   (G.CODGRUPOORC    = ' + QuotedStr(sContaOuGrupo) + ') AND ' +
                 '   (C.FLGATIVA <> ''I'') ';
         CdsAux.Data := GetDataPacket(sSQL);

         // Se as contas do grupo estiverem inativadas, sai da função
         if CdsAux.IsEmpty then
         begin
            Result := '0';
            Exit;
         end;

         // Pega o sinal das contas do grupo
         bSinalContaPositivo := CdsAux.FieldByName('FLGSINALCONTA').AsString = 'P';

         // Se for informado um cenário
         if iIdCenario <> -1 then
         begin
            sSQL := 'SELECT SUM(V.VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO ' +
                     'FROM VALORESCENARIO V, CONTASORCAMEN C, GRUPOORCAMEN G ' +
                     'WHERE (V.EXERCICIO = ' + IntToStr(iExercicio) + ') AND ';

                     if bSaldoAnterior then
                        sSQL := sSQL + '      (V.PERIODO IS NULL) AND '
                     else
                        sSQL := sSQL + '      (V.PERIODO = ' + IntToStr(iPeriodo) + ') AND ';

                     sSQL := sSQL +
                     '      (V.IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                     '      (V.IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                     '      (V.IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
                     '      (V.IDCONTAORCAMEN   = C.IDCONTAORCAMEN) AND ' +
                     '      (V.IDPLANOORCAMEN   = C.IDPLANOORCAMEN) AND ' +
                     '      (C.IDPLANOORCAMEN   = G.IDPLANOORCAMEN) AND ' +
                     '      (C.IDGRUPOORCAMEN   = G.IDGRUPOORCAMEN) AND ' +
                     '      (G.CODGRUPOORC      = ' + QuotedStr(sContaOuGrupo) + ') ';

            CdsAux.Data := GetDataPacket(sSQL);
         end
         else

         // Se não for informado um cenário
         begin
            if bSaldoAnterior then
            begin
               sSQL := 'SELECT SUM(S.VLRORCADO) AS VLRORCADO, SUM(S.VLRREALIZADO) AS VLRREALIZADO ' +
                       'FROM ' +
                       '  SALDOORCADOANT S, CONTASORCAMEN C, GRUPOORCAMEN G ' +
                       'WHERE ' +
                       '   (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                       '   (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
                       '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
                       '   (C.IDPLANOORCAMEN = G.IDPLANOORCAMEN) AND ' +
                       '   (G.CODGRUPOORC    = ' + QuotedStr(sContaOuGrupo) + ') AND ' +
                       '   (S.EXERCICIO      = ' + IntToStr(iExercicio) +') AND ' +
                       '   (S.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (S.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') ';

            end
            else
            begin
               if cTipoCalc = 'N' then
                  sSQL := 'SELECT SUM(S.VLRORCADO) AS VLRORCADO, SUM(S.VLRREALIZADO) AS VLRREALIZADO '
               else
                  sSQL := 'SELECT SUM(S.VLRORCACUM) AS VLRORCADO, SUM(S.VLRREALACUM) AS VLRREALIZADO ';

               sSQL := sSQL + 'FROM SALDOORCADO S, CONTASORCAMEN C, GRUPOORCAMEN G ' +
                              'WHERE ' +
                              '   (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                              '   (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
                              '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
                              '   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
                              '   (S.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                              '   (S.IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                              '   (G.CODGRUPOORC    = ' + QuotedStr(sContaOuGrupo) + ') ';


               DecodeDate(dDataCorrente, iAno, iMes, iDia);
               if bCalculaPorPeriodo then
                  sSQL := sSQL + ' AND (TO_CHAR(S.DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatFloat('0000',iAno) + FormatFloat('00',iMes)) + ')'
               else
                  sSQL := sSQL + ' AND (S.DATAREFERENCIA = TO_DATE(' + QuotedStr(DateToStr(dDataCorrente)) + ',''DD/MM/YYYY'')) ';
            end;

            CdsAux.Data := GetDataPacket(sSQL);
         end;

      end
      else
      
      {**********************************************************************************}
       // Se for por conta
      {**********************************************************************************}
      begin
         // Verifica o sinal da conta
         sSQL := 'SELECT FLGSINALCONTA ' +
                 'FROM CONTASORCAMEN ' +
                 'WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '      (IDCONTAORCAMEN = ' + QuotedStr(sContaOuGrupo) + ') AND ' +
                 '      (FLGATIVA <> ''I'') ';
         CdsAux.Data := GetDataPacket(sSQL);

         // Se a conta estiver inativada, sai da função
         if CdsAux.IsEmpty then
         begin
            Result := '0';
            Exit;
         end;

         // Pega o sinal da conta
         bSinalContaPositivo := CdsAux.FieldByName('FLGSINALCONTA').AsString = 'P';

         // Se for informado um cenário
         if iIdCenario <> -1 then
         begin
            sSQL := 'SELECT SUM(VLRORCCENARIO) AS VLRORCADO, 0 AS VLRREALIZADO ' +
                     'FROM VALORESCENARIO ' +
                     'WHERE (EXERCICIO = ' + IntToStr(iExercicio) + ') AND ';

                     if bSaldoAnterior then
                        sSQL := sSQL + '      (PERIODO IS NULL) AND '
                     else
                        sSQL := sSQL + '      (PERIODO = ' + IntToStr(iPeriodo) + ') AND ';

                     sSQL := sSQL +
                     '      (IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                     '      (IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                     '      (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
                     '      (IDCONTAORCAMEN   = ' + QuotedStr(sContaOuGrupo) + ') ';

            CdsAux.Data := GetDataPacket(sSQL);
         end
         else

         // Se não for informado um cenário
         begin
            if bSaldoAnterior then
            begin
               sSQL := 'SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO ' +
                       'FROM ' +
                       'SALDOORCADOANT ' +
                       'WHERE (EXERCICIO      = ' + IntToStr(iExercicio) +') AND ' +
                       '      (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '      (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                       '      (IDCONTAORCAMEN = ' + QuotedStr(sContaOuGrupo) + ') ';
            end
            else
            begin
               if cTipoCalc = 'N' then
                  sSQL := 'SELECT SUM(VLRORCADO) AS VLRORCADO, SUM(VLRREALIZADO) AS VLRREALIZADO '
               else
                  sSQL := 'SELECT SUM(VLRORCACUM) AS VLRORCADO, SUM(VLRREALACUM) AS VLRREALIZADO ';

               sSQL := sSQL + 'FROM SALDOORCADO ' +
                              'WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                              '      (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                              '      (IDCONTAORCAMEN = ' + QuotedStr(sContaOuGrupo) + ') ';


               DecodeDate(dDataCorrente, iAno, iMes, iDia);
               if bCalculaPorPeriodo then
                  sSQL := sSQL + ' AND (TO_CHAR(DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatFloat('0000',iAno) + FormatFloat('00',iMes)) + ')'
               else
                  sSQL := sSQL + ' AND (DATAREFERENCIA = ' + QuotedStr(DateToStr(dDataCorrente)) + ') ';
            end;

            CdsAux.Data := GetDataPacket(sSQL);
         end;
      end;


      // Apos ter pego o valor totalizado, informa o resultado da função
      if cOrcadoOuReal = 'O' then
      begin
         if bSinalContaPositivo then
            Result := FloatToStr(RoundCM(CdsAux.FieldByName('VLRORCADO').AsFloat,2))
         else
            Result := FloatToStr(RoundCM((CdsAux.FieldByName('VLRORCADO').AsFloat * -1),2));
      end
      else
      begin
         if bSinalContaPositivo then
            Result := FloatToStr(RoundCM(CdsAux.FieldByName('VLRREALIZADO').AsFloat,2))
         else
            Result := FloatToStr(RoundCM((CdsAux.FieldByName('VLRREALIZADO').AsFloat * -1),2));
      end;



   finally
      FreeAndNil(CdsAux);
   end;
end;



//3.1.1 Teste se a conta recebida já está calculada
function TCtrlGeraDados.VerificaContaJaCalculada(sContaOuGrupo: string;
                                                 cOrcadoOuReal: Char;
                                                 iIdPlanoOrc: integer;
                                                 bPorGrupo: boolean): boolean;
var
  sSQL: string;
  CdsAux: TClientDataSet;

begin
   try
      CdsAux := TClientDataSet.Create(nil);
      
      if bPorGrupo then
      begin
         sSQL := ' SELECT COUNT(C.IDCONTAORCAMEN) AS TOTAL ' +
                 ' FROM CONTASORCAMEN C, GRUPOORCAMEN G ' +
                 ' WHERE ' +
                 '    (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
                 '    (C.IDPLANOORCAMEN = G.IDPLANOORCAMEN) AND ' +
                 '    (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '    (G.CODGRUPOORC    = ' + QuotedStr(sContaOuGrupo)  + ') ';
         if cOrcadoOuReal = 'O'  then
            sSQL := sSQL + ' AND (C.FLGCALCORCADO <> ''N'' ) '
         else
            sSQL := sSQL + ' AND (C.FLGCALCREAL <> ''N'' ) ';
      end
      else
      begin
         sSQL := ' SELECT COUNT(IDCONTAORCAMEN) AS TOTAL ' +
                 ' FROM CONTASORCAMEN ' +
                 ' WHERE ' +
                 '    (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '    (IDCONTAORCAMEN = ' + QuotedStr(sContaOuGrupo)  + ') ';
         if cOrcadoOuReal = 'O' then
            sSQL := sSQL + ' AND (FLGCALCORCADO <> ''N'' ) '
         else
            sSQL := sSQL + ' AND (FLGCALCREAL <> ''N'' ) ';
      end;

      CdsAux.Data := GetDataPacket(sSQL);
      Result      := (CdsAux.FieldByName('TOTAL').AsInteger > 0);

   finally
      FreeAndNil(CdsAux);
   end;
end;



//1.3.2 - 1.4.6
function TCtrlGeraDados.CalculaCompOutrasContas(cOrcadoOuReal: Char;
                                                sConteudo: string;
                                                iPosIni,iQtdDigitos,iIdPlanoOrc,iIdCenario,
                                                iIdPessoa,iExercicio,iPeriodo: integer;
                                                bPorGrupo,bCalculaPorPeriodo,bCalculaSaldoAnterior: boolean;
                                                dDataCorrente: TDateTime;
                                                const lstBloco : TStringList  // Edilaine - SOL 185723 / KTN 1742408
                                                ): boolean;

var
  sFieldConta,
  sFieldSaldo,
  sFieldPerc,
  sFieldCalc,
  sSQL: string;
  bSinalContaPositivo: boolean;
  iAno,iMes,iDia: Word;
  rValor, rValorAnterior,
  rValorAcum: Double;

begin
   try
      _Cds.Data      := SelContasOrcamen(cOrcadoOuReal,'F',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,bPorGrupo);
      rValor         := 0;
      rValorAnterior := 0;
      rValorAcum     := 0;

      // Monta o Nome dos Fields da flag de cálculo
      if cOrcadoOuReal = 'O' then
      begin
         sFieldCalc  := 'FLGCALCORCADO';
         sFieldConta := 'IDCONTAREFORCADO';
         sFieldSaldo := 'VLRORCADO';
         sFieldPerc  := 'PERCCONTAREFORC';
      end
      else 
      begin
         sFieldCalc  := 'FLGCALCREAL';
         sFieldConta := 'IDCONTAREFREAL';
         sFieldSaldo := 'VLRREALIZADO';
         sFieldPerc  := 'PERCCONTAREFREA';
      end; 

      // Percorre as contas selecionadas
      while not _Cds.Eof do
      begin
         // Anda a barra de progresso
         DoProgresso([2,
                     'Calculando composição de outras contas...',
                     1,
                     _Cds.RecordCount,
                     _Cds.RecNo,
                     '',
                     iProgIni,
                     iProgFim,
                     iProgCorr]);


         // Pega o sinal da conta (+ ou -)
         _CdsAux.Data := GetDataPacket('SELECT FLGSINALCONTA ' +
                                       'FROM CONTASORCAMEN ' +
                                       'WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                       '      (IDCONTAORCAMEN = ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                                       '      (FLGATIVA <> ''I'') ');
         // Se a conta estiver inativada, vai para o próximo registro
         if _CdsAux.IsEmpty then
         begin
            DoProgresso([4,'Calculando composição de outras contas. Conta ' +
                        QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + ' não calculada. Motivo: Conta inativa']);
            _Cds.Next;
            Continue;
         end;
         bSinalContaPositivo := (_Cds.FieldByName('FLGSINALCONTA').AsString = 'P');
         
         // Pega a composição da conta em foco e faz o loop
         _CdsCompContas.Data := SelCompContasOrcamen(_Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                     iIdPlanoOrc,
                                                     cOrcadoOuReal,
                                                     'F');

         while not _CdsCompContas.Eof do
         begin
            // Verifica se a conta de composição é vazia
            // (Ex: pode ser uma conta de composição realizada no calculo da orçada)
            if not (_CdsCompContas.FieldByName(sFieldConta).IsNull) then
            begin
                // Verifica se a conta da composição já foi calculada. Se foi, entra na rotina
                if VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldConta).AsString,cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
                begin
                    if iIdCenario <> -1 then
                       sSQL := ' SELECT SUM(VLRORCCENARIO) AS ' + sFieldSaldo + ' FROM VALORESCENARIO '
                    else
                       sSQL := ' SELECT SUM(' + sFieldSaldo + ') AS ' + sFieldSaldo + ' FROM SALDOORCADO ';
                    sSQL := sSQL + ' WHERE ' +
                                   '    (IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                   '    (IDCONTAORCAMEN  = ' + QuotedStr(_CdsCompContas.FieldByName(sFieldConta).AsString) + ') AND ' +
                                   '    (IDPESSOA        = ' + IntToStr(iIdPessoa) + ') '; 
                            if iIdCenario <> -1 then
                            begin
                               sSQL := sSQL + ' AND (EXERCICIO         = ' + IntToStr(iExercicio) + ') ' +
                                              ' AND (PERIODO           = ' + IntToStr(iPeriodo) + ') ' +
                                              ' AND (IDCENARIOORCAMEN  = ' + IntToStr(iIdCenario) + ')  ';
                            end
                            else
                            begin
                               DecodeDate(dDataCorrente,iAno,iMes,iDia);
                               if bCalculaPorPeriodo then
                                  sSQL := sSQL + ' AND (TO_CHAR(DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatFloat('0000', iAno) + FormatFloat('00', iMes )) + ') '
                               else
                                  sSQL := sSQL + ' AND (DATAREFERENCIA = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente)) + ',''DD/MM/YYYY'')) ';
                            end;
                    _CdsAux.Data := GetDataPacket(sSQL);

                    //Incrementa o acumulador de valores das contas da Composição
                    //multiplicando pelo percentual da conta
                    if not(_CdsAux.IsEmpty) then
                    begin
                       if bSinalContaPositivo then
                          rValor := rValor + (_CdsAux.FieldByName(sFieldSaldo).AsFloat *
                                             (_CdsCompContas.FieldByName(sFieldPerc).AsFloat / 100))
                       else
                          rValor := rValor + ((_CdsAux.FieldByName(sFieldSaldo).AsFloat * -1) *
                                              (_CdsCompContas.FieldByName(sFieldPerc).AsFloat / 100));
                    end;

                    // Se calcula por saldo anterior
                    if bCalculaSaldoAnterior then
                    begin
                       if iIdCenario <> -1 then
                          sSQL := ' SELECT SUM(VLRORCCENARIO) AS ' + sFieldSaldo + ' FROM VALORESCENARIO '
                       else
                          sSQL := ' SELECT SUM(' + sFieldSaldo + ') AS ' + sFieldSaldo + ' FROM SALDOORCADOANT ';
                       sSQL := sSQL + ' WHERE ';

                       if iIdCenario <> -1 then
                          sSQL := sSQL + ' (IDCENARIOORCAMEN  = ' + IntToStr(iIdCenario) +') AND ' +
                                         ' (PERIODO IS NULL) AND ';
                       sSQL := sSQL + ' (IDPLANOORCAMEN  = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                      ' (IDCONTAORCAMEN  = ' + QuotedStr(_CdsCompContas.FieldByName(sFieldConta).AsString)  + ') AND ' +
                                      ' (IDPESSOA        = ' + IntToStr(iIdPessoa) + ') AND ' +
                                      ' (EXERCICIO       = ' + IntToStr(iExercicio) + ') ';
                       _CdsAux.Data := GetDataPacket(sSQL);

                       //Incrementa o acumulador de valores das contas da Composição
                       //multiplicando pelo percentual da conta
                       if not(_CdsAux.IsEmpty) then
                       begin
                          if bSinalContaPositivo then
                             rValorAnterior := rValorAnterior + (_CdsAux.FieldByName(sFieldSaldo).AsFloat *
                                                                (_CdsCompContas.FieldByName(sFieldPerc).AsFloat / 100))
                          else
                             rValorAnterior := rValorAnterior + ((_CdsAux.FieldByName(sFieldSaldo).AsFloat * -1) *
                                                                 (_CdsCompContas.FieldByName(sFieldPerc).AsFloat / 100));
                       end;
                    end;
                end
                else
                   // Se alguma conta já estiver sido calculada, interrompe
                   //o loop do CdsAuxContasComp, pois o resultador não será consistente
                   Break;

            end;
            _CdsCompContas.Next;
         end;


         //Grava os dados na tabela de Saldos Orcamentarios
         if not bSinalContaPositivo then
            rValor := (rValor * -1);

         // Pega o valor do acumulado
         rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal, //3.
                                               _Cds.FieldByName('FLGACUMULADO').AsString,
                                               _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                               _Cds.FieldByName('FORMULA').AsString,
                                               rValor,
                                               iIdPlanoOrc,
                                               iPeriodo,
                                               iExercicio,
                                               iIdPessoa,
                                               bCalculaPorPeriodo,
                                               dDataCorrente,
                                               iIdCenario);

         if not GravaSaldoCalculado(iIdCenario, //2.
                                    iIdPlanoOrc,
                                    iPeriodo,
                                    iExercicio,
                                    iIdPessoa,
                                    _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                    cOrcadoOuReal,
                                    _Cds.FieldByName('FLGSINALCONTA').AsString,
                                    rValor,
                                    rValorAcum,
                                    dDataCorrente,
                                    //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                    -1,
                                    -1,
                                    //Fim
                                    lstBloco // Edilaine - SOL 185723 / KTN 1742408
                                    ) then
            raise Exception.Create(MessageInfo);

         // Se for pegar o saldo anterior
         if bCalculaSaldoAnterior then
         begin
            if not bSinalContaPositivo then
               rValorAnterior := (rValorAnterior * -1);

            GravaSaldoCalcAnterior(iIdCenario,
                                   iIdPlanoOrc,
                                   iPeriodo,
                                   iExercicio,
                                   iIdPessoa,
                                   _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                   cOrcadoOuReal,
                                   rValorAnterior);
         end;

         _Cds.Next;
      end;

      Result := True;

   except
       on E:Exception do
       begin
          MessageInfo := E.Message;
          Result      := False;
       end;
   end;
end;

function TCtrlGeraDados.SelCompContasOrcamen(sIdContaOrcamen: String;
                                             iIdPlanoOrc: integer; cOrcadoOuReal,
                                             cTipoCalc: Char;
                                             //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Início
                                             piPerNumero: integer = 0;
                                             piPerExercicio: Integer = 0): OleVariant;
                                             //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Fim
var
  sSQL,
  //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Início
  sPerNumero,
  sMesAno: string;
  //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Fim

begin
  //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Início
  if piPerNumero > 0 then
  begin
    if piPerNumero < 10 then
      sPerNumero := '0'+ IntToStr(piPerNumero)
    else
      sPerNumero := IntToStr(piPerNumero);
    // Alterado por Arnaldo V. Scarin em 02/12/2010
    // SOL: 148641 Kintana: 1047972 - Correção da Variavel.
    // Foi mudado do formato MM/YYYY para YYYYMM
    sMesAno := IntToStr(piPerExercicio)+sPerNumero;
  end;    
  //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Fim

  sSQL := ' SELECT ' +
          '    C.IDCOMPCONTASORC, C.IDCONTAREFREAL, C.IDPLANOORCAMEN, ' +
          '    C.CODCENTRORESPON, C.IDPESSOA, C.UNIDNEGOC, C.IDEMPRESA, ' +

          // Edilaine - SOL 190626 / KTN 1803612
          //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - '    C.CODCENTROCUSTO, C.PLANO, C.PLACONTA, C.CODTIPRECDES, ' +
          //'    NVL(D.CCATUAL, C.CODCENTROCUSTO) AS CODCENTROCUSTO, C.PLANO, C.PLACONTA, C.CODTIPRECDES, ' + //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009
          '    C.CODCENTROCUSTO, C.PLANO, C.PLACONTA, C.CODTIPRECDES, ' +
          // Edilaine - SOL 190626 / KTN 1803612 - fim

          '    C.RECPAG, C.IDCONTAORCAMEN, C.IDCONTAREFORCADO, ' +
          '    C.PERCCONTAREFORC, C.PERCCONTAREFREA, O.FLGCALCORCADO, ' +
          '    O.FLGCALCREAL, C.IDCONTACONDINI, C.IDCONTACONDFIM, ' +
          '    C.IDCONTACONDRES, C.CONDICAO, C.TIPOCONDINI, C.TIPOCONDRES, ' +
          '    C.VLRCONDINI, C.VLRCONDRES, C.IDPLANOPREV, C.IDPATRO ,' + 

          //Ricardo de Freitas SOL: 163871 KINTANA: 1402882
          '    C.IDTIPO_DEPESAORCAMEN,C.IDPROGRAMAORCAMEN ' +
          //Ricardo de Freitas SOL: 163871 KINTANA: 1402882 - fim

          ' FROM ' +
          '    CONTASORCAMEN O, ' +
          '    COMPCONTASORCAMEN C ' +

          // Edilaine - SOL 190626 / KTN 1803612 - comentado
          //'   ,CM.DEPARACCHIST      D ' + //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009

          ' WHERE ' +

          '    (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +

          '    (C.IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') AND ' +
          '    (O.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
          '    (O.IDCONTAORCAMEN = C.IDCONTAORCAMEN) ';

  //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Início
  if piPerNumero > 0 then
  begin
    // Edilaine - SOL 190626 / KTN 1803612 - comentado
    {
    // Alterado por Arnaldo V. Scarin em 02/12/2010
    // SOL: 148641 Kintana: 1047972 - Correção da Avaliação
    // Foi mudado do formato MM/YYYY para YYYYMM
    sSql := sSql +
           '  AND (D.CCNOVO(+)       = C.CODCENTROCUSTO) '+
           '  AND (TO_CHAR(D.DATADEPARA(+), ''YYYYMM'') > '+ QuotedStr(sMesAno)+ ') ';

   } // Edilaine - SOL 190626 / KTN 1803612 - fim
  end;
  //Bruno Bastos - Sol 122508 - Kintana 604232 - 06/08/2009 - Fim

  case cTipoCalc of                                          //Ricardo SOL: 168266 KINTANA: 1481776 - comentado
     'P' : sSQL := sSQL + ' AND (C.PLACONTA IS NOT NULL) ';  //AND (C.PLANO = '+ IntToStr(iPlanoContabil)+ ')';
     'X' : sSQL := sSQL + ' AND (C.CODTIPRECDES IS NOT NULL) ';
     'C' : sSQL := sSQL + ' AND (C.IDCONTACONDINI IS NOT NULL) ';
     'F' : begin
              case cOrcadoOuReal of
                 'O' : sSQL := sSQL + ' AND (C.IDCONTAREFORCADO IS NOT NULL) ';
                 'R' : sSQL := sSQL + ' AND (C.IDCONTAREFREAL   IS NOT NULL) ';
              end;
           end;
  end;

  sSQL := sSQL +
  ' ORDER BY ' +
  '    C.IDPLANOORCAMEN, C.IDCONTAORCAMEN ';

  Result := GetDataPacket(sSQL);
end;




function TCtrlGeraDados.GravaSaldoCalcAnterior(iIdCenario, iIdPlanoOrc,
                                               iPeriodo, iExercicio, iIdPessoa: integer;
                                               sIdContaOrcamen, sOrcOuReal: string;
                                               rValor: Double): boolean;
var
   sSQL: string;
   CdsAux: TClientDataSet;

begin
   try
      Result := False;
      CdsAux := TClientDataSet.Create(nil);

      // Se for informado um cenário
      if iIdCenario <> -1  then
      begin
         // Verifica se já existe algum valor lançado
         sSQL := 'SELECT IDVALORESCENARIO ' +
                 'FROM VALORESCENARIO ' +
                 'WHERE ' +
                 '  (IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '  (IDCONTAORCAMEN   = ' + QuotedStr(sIdContaOrcamen) +  ') AND ' +
                 '  (EXERCICIO        = ' + IntToStr(iExercicio) + ') AND ' +
                 '  (PERIODO          = ' + IntToStr(iPeriodo) + ') AND ' +
                 '  (IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                 '  (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') ';

         CdsAux.Data := GetDataPacket(sSQL);

         // Se não existir insere um novo registro
         if CdsAux.IsEmpty then
         begin
            sSQL := 'INSERT INTO VALORESCENARIO ' +
                    '   (IDVALORESCENARIO,IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ' +
                    '    PERIODO, IDPESSOA, IDCENARIOORCAMEN, VLRORCCENARIO) ' +
                    'VALUES ' +
                    '  (' + IntToStr(GetSequence('VALORESCENARIO')) + ', ' +
                    '   ' + QuotedStr(sIdContaOrcamen) + ', ' +
                    '   ' + IntToStr(iIdPlanoOrc) + ', ' +
                    '   ' + IntToStr(iExercicio) +  ', ' +
                    '   ' + IntToStr(iPeriodo) +  ', ' +
                    '   ' + IntToStr(iIdPessoa) + ', ' +
                    '   ' + IntToStr(iIdCenario) + ', ' +
                    '   ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ' ) ';

            if not ExecSQL(sSQL) then
               raise Exception.Create(MessageInfo);

         end
         else
         begin
            // Caso exista, faz o update
            sSQL := 'UPDATE VALORESCENARIO ' +
                    'SET ' +
                    '   VLRORCCENARIO  = VLRORCCENARIO + ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + '  ' +
                    'WHERE (IDVALORESCENARIO = ' + CdsAux.FieldByName('IDVALORESCENARIO').AsString + ') ';

            if not ExecSQL(sSQL) then
               raise Exception.Create(MessageInfo);
         end;
      end
      else

      // Se não for informado um cenário, atualiza apenas a SALDOORCADOANT
      begin
          //Busca na tabela de Saldos se o registro existe
         sSQL := 'SELECT IDCONTAORCAMEN ' +
                 'FROM ' +
                 '   SALDOORCADOANT ' +
                 'WHERE ' +
                 '  (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                 '  (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen) + ') AND ' +
                 '  (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') ';

         CdsAux.Data := GetDataPacket(sSQL);

         // Se não existir insere o novo registro
         if CdsAux.IsEmpty then
         begin
            sSQL := 'INSERT INTO SALDOORCADOANT ' +
                    '   (IDCONTAORCAMEN, IDPLANOORCAMEN, EXERCICIO, ' +
                    '    IDPESSOA, VLRORCADO, VLRREALIZADO ) ' +
                    'VALUES ' +
                    '   ('+ QuotedStr(sIdContaOrcamen) + ',  ' +
                    '   ' + IntToStr(iIdPlanoOrc) + ', ' +
                    '   ' + IntToStr(iExercicio) + ', ' +
                    '   ' + IntToStr(iIdPessoa) + ', ';

                    case sOrcOuReal[1] of
                       'O': sSQL := sSQL + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ',0) ';
                       'R': sSQL := sSQL + '0,' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]) + ')  ';
                    end;

                    if not ExecSQL(sSQL) then
                       raise Exception.Create(MessageInfo);

         end
         else

         // Caso exista, faz o update
         begin
            sSQL := 'UPDATE SALDOORCADOANT ' +
                    'SET ';
                    case sOrcOuReal[1] of
                       'O': sSQL := sSQL + 'VLRORCADO  = ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]);
                       'R': sSQL := sSQL + 'VLRREALIZADO = ' + StringReplace(FloatToStr(rValor),',','.',[rfReplaceAll]);
                    end;

                    sSQL := sSQL + ' WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)+ ') AND ' +
                                   '       (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrcamen)+ ') AND ' +
                                   '       (EXERCICIO      = ' + IntToStr(iExercicio) + ') AND ' +
                                   '       (IDPESSOA       = ' + IntToStr(iIdPessoa) + ')';

                    if not ExecSQL(sSQL) then
                       raise Exception.Create(MessageInfo);
         end;
      end;

      //Seta as Flags de Cálculo da conta selecionada para "S" - Calculada
      sSQL := 'UPDATE CONTASORCAMEN ' +
              'SET ';

              case sOrcOuReal[1] of
                 'O': sSQL := sSQL + 'FLGCALCORCADO = ''S'' ';
                 'R': sSQL := sSQL + 'FLGCALCREAL   = ''S'' ';
              end;

           sSQL := sSQL + ' WHERE (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc)       + ') AND ' +
                          '       (IDCONTAORCAMEN  = ' + QuotedStr(sIdContaOrcamen) + ') ';
      if not ExecSQL(sSQL) then
         raise Exception.Create(MessageInfo);

      Result := True;


   except
      on E:Exception do
      begin
         MessageInfo := E.Message;
         Result      := False;
         FreeAndNil(CdsAux);
      end;
   end;
end;



//1.3.3 - 1.4.5
function TCtrlGeraDados.CalculaContasAcumulado(cOrcadoOuReal: Char; sConteudo: string;
                                               iIdPessoa, iIdCenario, iPeriodo,
                                               iExercicio, iIdPlanoOrc,
                                               iPosIni,iQtdDigitos: integer;
                                               bPorGrupo,bCalculaSaldoAnterior,
                                               bCalculaPorPeriodo: boolean;
                                               dDataCorrente: TDateTime;
                                               const lstBloco : TStringList  // Edilaine - SOL 185723 / KTN 1742408
                                               ): boolean;


var
   rValor,rValorAcumAnt,rValorAcum : Double;
   sFormulaOrcOuReal,sFormulaDecod,sSQL: String;
   bSinalContaPositivo: boolean;

begin
   try
      rValor        := 0;
      rValorAcumAnt := 0;
      rValorAcum    := 0;
      _Cds.Data     := SelContasOrcamen(cOrcadoOuReal,'A',sConteudo,iPosIni,iQtdDigitos,
                                        iIdPlanoOrc,bPorGrupo);
      // Pega os parâmetros da data corrente
      DecodeDate(dDataCorrente,iAno,iMes,iDia);

      while not _Cds.Eof do
      begin
         // Anda a barra de progresso
         DoProgresso([2,
                     'Calculando contas de valor acumulado...',
                     1,
                     _Cds.RecordCount,
                     _Cds.RecNo,
                     '',
                     iProgIni,
                     iProgFim,
                     iProgCorr]);

         // Pega o sinal da conta
         bSinalContaPositivo := (_Cds.FieldByName('FLGSINALCONTA').AsString = 'P');

         // Se for para calcular saldo anterior
         if bCalculaSaldoAnterior then
         begin
            case cOrcadoOuReal of
               'O': sFormulaOrcOuReal := _Cds.FieldByName('FORMULAORCADO').AsString;
               'R': sFormulaOrcOuReal := _Cds.FieldByName('FORMULAREALIZADO').AsString;
            end;
            sFormulaDecod := DecodificaFormula(sFormulaOrcOuReal,
                                               'A',
                                               cOrcadoOuReal,
                                               iIdPlanoOrc,
                                               iIdCenario,
                                               iPeriodo,
                                               iExercicio,
                                               iIdPessoa,
                                               True,
                                               bCalculaPorPeriodo,
                                               dDataCorrente);
            if Trim(sFormulaDecod) <> '' then
            begin
               try
                  pParser.Expression := sFormulaDecod;
                  rValor := RoundCM(pParser.Value,2);
               except
                  rValor := 0;
               end;
            end;


            if not bSinalContaPositivo then
               rValor := (rValor * -1);

            if not GravaSaldoCalcAnterior(iIdCenario,
                                          iIdPlanoOrc,
                                          iPeriodo,
                                          iExercicio,
                                          iIdPessoa,
                                          _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                          cOrcadoOuReal,
                                          rValor) then
               raise Exception.Create(MessageInfo);                              
         end;

         if iIdCenario <> -1 then
            sSQL := 'SELECT ' +
                    '   0 AS REAL, ' +
                    '   SUM(VLRORCCENARIO) AS ORC ' +
                    'FROM ' +
                    '   VALORESCENARIO ' +
                    'WHERE ' +
                    '   (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
                    '   (IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                    '   (IDCONTAORCAMEN   = ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                    '   (IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                    '   (EXERCICIO        = ' + IntToStr(iExercicio) + ') AND ' +
                    '   (PERIODO          = ' + IntToStr(iPeriodo) + ') '
         else
         begin
            if bCalculaPorPeriodo then
               sSQL := 'SELECT ' +
                       '   SUM(VLRREALIZADO) AS REAL, ' +
                       '   SUM(VLRORCADO) AS ORC ' +
                       'FROM ' +
                       '   SALDOORCADO ' +
                       'WHERE ' +
                       '   (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                       '   (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (IDCONTAORCAMEN = ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                       '   (TO_CHAR(DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatDateTime('YYYYMM',(dDataCorrente - 15))) + ') '
            else
               sSQL := 'SELECT ' +
                       '   SUM(VLRREALIZADO) AS REAL, ' +
                       '   SUM(VLRORCADO) AS ORC ' +
                       'FROM ' +
                       '   SALDOORCADO ' +
                       'WHERE ' +
                       '   (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                       '   (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (IDCONTAORCAMEN = ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                       '   (DATAREFERENCIA = TO_DATE('+ QuotedStr(FormatDateTime('dd/mm/yyyy',(dDataCorrente - 1))) +',''DD/MM/YYYY'')) ';
         end;



         // Se o período for diferente de Janeiro
         if iPeriodo <> 1 then
         begin
            _CdsAux.Data := GetDataPacket(sSQL);
            case cOrcadoOuReal of
               'O': begin
                       if not _CdsAux.IsEmpty then
                          rValorAcumAnt := _CdsAux.FieldByName('ORC').AsFloat
                       else
                          rValorAcumAnt := 0;
                    end;

               'R': begin
                       if not _CdsAux.IsEmpty then
                          rValorAcumAnt := _CdsAux.FieldByName('REAL').AsFloat
                       else
                          rValorAcumAnt := 0;
                    end;
            end;
         end
         else
         begin
            if iIdCenario <> -1 then
            begin
               sSQL := 'SELECT ' +
                       '   0 AS REAL, ' +
                       '   SUM(VLRORCCENARIO) AS ORC ' +
                       'FROM ' +
                       '   VALORESCENARIO ' +
                       'WHERE ' +
                       '   (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
                       '   (IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (IDCONTAORCAMEN   = ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) +  ') AND ' +
                       '   (IDCENARIOORCAMEN = ' + IntToStr(iIdCenario) + ') AND ' +
                       '   (EXERCICIO        = ' + IntToStr(iExercicio)+ ') AND ' +
                       '   (PERIODO IS NULL) ';
               _CdsAux.Data := GetDataPacket(sSQL);

               if not(_CdsAux.IsEmpty) then
                  rValorAcumAnt := _CdsAux.FieldByName('ORC').AsFloat
               else
                  rValorAcumAnt := 0;
            end
            else
            begin
               sSQL := 'SELECT ' +
                       '   SUM(VLRREALIZADO) AS REAL, ' +
                       '   SUM(VLRORCADO) AS ORC ' +
                       'FROM ' +
                       '   SALDOORCADOANT ' +
                       'WHERE ' +
                       '   (IDPESSOA       = ' + IntToStr(iIdPessoa) + ') AND ' +
                       '   (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                       '   (IDCONTAORCAMEN = ' + QuotedStr(_Cds.FieldByName('IDCONTAORCAMEN').AsString) + ') AND ' +
                       '   (EXERCICIO      = ' + IntToStr(iExercicio) + ') ';
               _CdsAux.Data := GetDataPacket(sSQL);

               case cOrcadoOuReal of
                  'O': begin
                          if not _CdsAux.IsEmpty then
                             rValorAcumAnt := _CdsAux.FieldByName('ORC').AsFloat
                          else
                             rValorAcumAnt := 0;
                       end;
                  'R': begin
                          if not _CdsAux.IsEmpty then
                             rValorAcumAnt := _CdsAux.FieldByName('REAL').AsFloat
                          else
                             rValorAcumAnt := 0;
                       end;
               end;
            end;
         end;


         // Transforma as contas em valores e passa para o parser fazer a fórmula
         case cOrcadoOuReal of
            'O': sFormulaOrcOuReal := _Cds.FieldByName('FORMULAORCADO').AsString;
            'R': sFormulaOrcOuReal := _Cds.FieldByName('FORMULAREALIZADO').AsString;
         end;
         sFormulaDecod := DecodificaFormula(sFormulaOrcOuReal, //3.1
                                            'N',
                                            cOrcadoOuReal,
                                            iIdPlanoOrc,
                                            iIdCenario,
                                            iPeriodo,
                                            iExercicio,
                                            iIdPessoa,
                                            False,
                                            bCalculaPorPeriodo,
                                            dDataCorrente);
         if Trim(sFormulaDecod) <> '' then
         begin
            try
               pParser.Expression := sFormulaDecod;
               // Pega o Valor retornado pelo parser
               rValor := rValorAcumAnt + RoundCM(pParser.value,2);
            except
               rValor := 0;
            end;

            if not bSinalContaPositivo then
               rValor := (rValor * -1);

            rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal,
                                                 _Cds.FieldByName('FLGACUMULADO').AsString,
                                                 _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                 sFormulaOrcOuReal,
                                                 rValor,
                                                 iIdPlanoOrc,
                                                 iPeriodo,
                                                 iExercicio,
                                                 iIdPessoa,
                                                 bCalculaPorPeriodo,
                                                 dDataCorrente,
                                                 iIdCenario);

            if not GravaSaldoCalculado(iIdCenario,
                                       iIdPlanoOrc,
                                       iPeriodo,
                                       iExercicio,
                                       iIdPessoa,
                                       _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                       cOrcadoOuReal,
                                       _Cds.FieldByName('FLGSINALCONTA').AsString,
                                       rValor,
                                       rValorAcum,
                                       dDataCorrente,
                                       //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                       -1,
                                       -1,
                                       //Fim
                                       lstBloco // Edilaine - SOL 185723 / KTN 1742408
                                       ) then
               raise Exception.Create(MessageInfo);
         end;

         _Cds.Next;
      end;


      Result := True;

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;



//1.3.4 - 1.4.7
function TCtrlGeraDados.CalculaContasCondicional(cOrcadoOuReal: Char;
  sConteudo: string; iIdPessoa, iIdCenario, iPeriodo, iExercicio,
  iIdPlanoOrc, iPosIni, iQtdDigitos: integer; bPorGrupo, bCalculaSaldoAnterior,
  bCalculaPorPeriodo: boolean; dDataCorrente: TDateTime;
  const lstBloco : TStringList  // Edilaine - SOL 185723 / KTN 1742408
  ): boolean;

var
   rValor                  : Double;
   rValorAcum     : Double;
   rValorIni      : Double;
   rValorRes      : Double;
   rValorFim      : Double;
   sSQL,sFieldCondicional,
   sTipoIni,sTipoRes : String;
   bGravaSaldo,bSinalContaPositivo: boolean;

   function SinalContaPositivo(iIdPlanoOrc: integer; sIdContaOrc: string; bPorGrupoConta: boolean): boolean;
   var
      CdsContaAux: TClientDataSet;
   begin
      try
         CdsContaAux := TClientDataSet.Create(nil);

         if bPorGrupoConta then
            CdsContaAux.Data := GetDataPacket('SELECT DISTINCT C.FLGSINALCONTA ' +
                                              'FROM CONTASORCAMEN C, GRUPOORCAMEN G ' +
                                              'WHERE (C.IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrc) + ') AND ' +
                                              '      (C.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc) + ') AND ' +
                                              '      (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND ' +
                                              '      (C.IDPLANOORCAMEN = G.IDPLANOORCAMEN)')
         else
            CdsContaAux.Data := GetDataPacket('SELECT FLGSINALCONTA ' +
                                              'FROM CONTASORCAMEN ' +
                                              'WHERE IDCONTAORCAMEN = ' + QuotedStr(sIdContaOrc) + ' AND ' +
                                              '      IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrc));

         Result := (CdsContaAux.FieldByName('FLGSINALCONTA').AsString = 'P');

      finally
         FreeAndNil(CdsContaAux);
      end;
   end;

   
   function RetornaValorContaCondicional(sIdContaOuGrupoS: string;cOrcadoOuRealS: Char;
                                         iIdCenarioS,iIdPlanoOrcS,iIdPessoaS,iPeriodoS,
                                         iExercicioS: integer; bCalculaPorPeriodoS,bPorGrupoS,
                                         bCalculaSaldoAnteriorS: boolean;
                                         dDataCorrenteS: TDateTime): Double;
   begin
      Result := 0;
      if bPorGrupoS then
      begin
         if iIdCenarioS <> -1 then
         begin
            sSQL := ' SELECT SUM(V.VLRORCADO) AS VLRORCADO,  ' +
                    '     0 AS VLRREALIZADO ' +
                    ' FROM VALORESCENARIO V, CONTASORCAMEN C, GRUPOORCAMEN G' +
                    ' WHERE ' +
                    '    (V.IDCONTAORCAMEN   = C.IDCONTAORCAMEN) AND ' +
                    '    (V.IDPLANOORCAMEN   = C.IDPLANOORCAMEN) AND ' +
                    '    (G.IDGRUPOORCAMEN   = C.IDGRUPOORCAMEN) AND ' +
                    '    (G.IDPLANOORCAMEN   = C.IDPLANOORCAMEN) AND ' +
                    '    (V.IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrcS) + ') AND ' +
                    '    (G.CODGRUPOORC      = ' + QuotedStr(sIdContaOuGrupoS) + ') AND ' +
                    '    (V.IDPESSOA         = ' + IntToStr(iIdPessoaS) + ') AND ' +
                    '    (V.IDCENARIOORCAMEN = ' + IntToStr(iIdCenarioS) + ') AND ' +
                    '    (V.EXERCICIO        = ' + IntToStr(iExercicioS) + ') AND ';
                    if bCalculaSaldoAnteriorS then
                       sSQL := sSQL + ' (V.PERIODO IS NULL) '
                    else
                       sSQL := sSQL + ' (V.PERIODO = ' + IntToStr(iPeriodoS) + ')  ';
         end              
         else
         begin
            sSQL := ' SELECT SUM(S.VLRORCADO) AS VLRORCADO,  ' +
                    '        SUM(S.VLRREALIZADO) AS VLRREALIZADO ';
                    if bCalculaSaldoAnteriorS then
                       sSQL := sSQL + ' FROM SALDOORCADOANT S, '
                    else
                       sSQL := sSQL + ' FROM SALDOORCADO S, ';

                    sSQL := sSQL +
                    '   CONTASORCAMEN C, GRUPOORCAMEN G ' +
                    ' WHERE ' +
                    '    (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND ' +
                    '    (S.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
                    '    (G.IDGRUPOORCAMEN = C.IDGRUPOORCAMEN) AND ' +
                    '    (G.IDPLANOORCAMEN = C.IDPLANOORCAMEN) AND ' +
                    '    (S.IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcS) + ') AND ' +
                    '    (G.CODGRUPOORC    = ' + QuotedStr(sIdContaOuGrupoS) + ') AND ' +
                    '    (S.IDPESSOA       = ' + IntToStr(iIdPessoaS) + ') AND ';
                    if bCalculaPorPeriodoS then
                       sSQL := sSQL + ' (TO_CHAR(S.DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatDateTime('yyyymm',dDataCorrenteS)) + ') '
                    else
                       sSQL := sSQL + ' (S.DATAREFERENCIA  = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrenteS)) + ',''dd/mm/yyyy'')) ';
         end;
         _CdsAux.Data := GetDataPacket(sSQL);
         // Passa o resultado da conta inicial para a variável
         case cOrcadoOuRealS of
            'O': Result := _CdsAux.FieldByName('VLRORCADO').AsFloat;
            'R': Result := _CdsAux.FieldByName('VLRREALIZADO').AsFloat;
         end;

         // Verifica o sinal da conta
         if not SinalContaPositivo(iIdPlanoOrc,sIdContaOuGrupoS,bPorGrupoS) then
         begin
            case cOrcadoOuRealS of
               'O': Result := (_CdsAux.FieldByName('VLRORCADO').AsFloat * -1);
               'R': Result := (_CdsAux.FieldByName('VLRREALIZADO').AsFloat * -1);
            end;
         end;


      end
      else
      begin
         if iIdCenarioS <> -1 then
         begin
            sSQL := ' SELECT SUM(VLRORCADO) AS VLRORCADO,  ' +
                    '     0 AS VLRREALIZADO ' +
                    ' FROM VALORESCENARIO ' +
                    ' WHERE ' +
                    '    (IDPLANOORCAMEN   = ' + IntToStr(iIdPlanoOrcS) + ') AND ' +
                    '    (IDCONTAORCAMEN   = ' + QuotedStr(_CdsCompContas.FieldByName('IDCONTACONDINI').AsString) + ') AND ' +
                    '    (IDPESSOA         = ' + IntToStr(iIdPessoaS) + ') AND ' +
                    '    (IDCENARIOORCAMEN = ' + IntToStr(iIdCenarioS) + ') AND ' +
                    '    (EXERCICIO        = ' + IntToStr(iExercicioS) + ') AND ';
                    if bCalculaSaldoAnteriorS then
                       sSQL := sSQL + ' (PERIODO IS NULL) '
                    else
                       sSQL := sSQL + ' (PERIODO = ' + IntToStr(iPeriodoS) + ')  ';
         end              
         else
         begin
            sSQL := ' SELECT SUM(VLRORCADO) AS VLRORCADO,  ' +
                    '        SUM(VLRREALIZADO) AS VLRREALIZADO ';
                    if bCalculaSaldoAnteriorS then
                       sSQL := sSQL + ' FROM SALDOORCADOANT '
                    else
                       sSQL := sSQL + ' FROM SALDOORCADO ';

                    sSQL := sSQL +   
                    ' WHERE ' +
                    '    (IDPLANOORCAMEN = ' + IntToStr(iIdPlanoOrcS) + ') AND ' +
                    '    (IDCONTAORCAMEN = ' + QuotedStr(sIdContaOuGrupoS) + ') AND ' +
                    '    (IDPESSOA       = ' + IntToStr(iIdPessoaS) + ') AND ';
                    if bCalculaPorPeriodoS then
                       sSQL := sSQL + ' (TO_CHAR(DATAREFERENCIA,''YYYYMM'') = ' + QuotedStr(FormatDateTime('yyyymm',dDataCorrenteS)) + ') '
                    else
                       sSQL := sSQL + ' (DATAREFERENCIA  = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrenteS)) + ',''dd/mm/yyyy'')) ';
         end;
         _CdsAux.Data := GetDataPacket(sSQL);
         // Passa o resultado da conta inicial para a variável
         case cOrcadoOuRealS of
            'O': Result := _CdsAux.FieldByName('VLRORCADO').AsFloat;
            'R': Result := _CdsAux.FieldByName('VLRREALIZADO').AsFloat;
         end;

         // Verifica o sinal da conta
         if not SinalContaPositivo(iIdPlanoOrc,sIdContaOuGrupoS,bPorGrupoS) then
         begin
            case cOrcadoOuRealS of
               'O': Result := (_CdsAux.FieldByName('VLRORCADO').AsFloat * -1);
               'R': Result := (_CdsAux.FieldByName('VLRREALIZADO').AsFloat * -1);
            end;
         end;

      end;
   end;


   function GeraResultadoOperacao(sCondicao: string; var bGravaVlrCondicional: boolean): Double;
   begin
      Result := 0;
      if sCondicao = '<=' then
      begin
         if rValorIni <= rValorFim then
         begin
            Result               := rValorFim;
            bGravaVlrCondicional := True;
         end
         else
            bGravaVlrCondicional := False;
      end
      else
      if sCondicao = '<' then
      begin
         if rValorIni < rValorFim then
         begin
            Result               := rValorFim;
            bGravaVlrCondicional := True;
         end
         else
            bGravaVlrCondicional := False;
      end
      else
      if sCondicao = '=' then
      begin
         if rValorIni = rValorFim then
         begin
            Result               := rValorFim;
            bGravaVlrCondicional := True;
         end
         else
            bGravaVlrCondicional := False;
      end
      else
      if sCondicao = '>' then
      begin
         if rValorIni > rValorFim then
         begin
            Result               := rValorFim;
            bGravaVlrCondicional := True;
         end
         else
            bGravaVlrCondicional := False;
      end
      else
      if sCondicao = '>=' then
      begin
         if rValorIni >= rValorFim then
         begin
            Result               := rValorFim;
            bGravaVlrCondicional := True;
         end
         else
            bGravaVlrCondicional := False;
      end
      else
      if sCondicao = '<>' then
      begin
         if rValorIni <> rValorFim then
         begin
            Result               := rValorFim;
            bGravaVlrCondicional := True;
         end
         else
            bGravaVlrCondicional := False;
      end;
   end;





begin
   try
       rValorIni  := 0;
       rValorRes  := 0;
       rValorFim  := 0;
       rValor     := 0;


      _Cds.Data := SelContasOrcamen(cOrcadoOuReal,'C',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,bPorGrupo);

      // Varre a query de Contas
      while not _Cds.Eof do
      begin
         // Anda a barra de progresso
         DoProgresso([2,
                     'Calculando contas condicionais...',
                     1,
                     _Cds.RecordCount,
                     _Cds.RecNo,
                     '',
                     iProgIni,
                     iProgFim,
                     iProgCorr]);


          // Pega o sinal da conta
          bSinalContaPositivo := (_Cds.FieldByName('FLGSINALCONTA').AsString = 'P');
          
          // Pega a composição da conta em foco
          _CdsCompContas.Data := SelCompContasOrcamen(_Cds.FieldByName('IDCONTAORCAMEN').AsString,iIdPlanoOrc,cOrcadoOuReal,'C');

          // Varre o DataSet de composição
          while not _CdsCompContas.Eof do
          begin
             // Pega o valor da Conta/Grupo inicial
             //---------------------------------------------------------------------------
             // Pega o campo condicional correto
             if bPorGrupo then
                sFieldCondicional := _CdsCompContas.FieldByName('IDGRUPOCONDINI').AsString
             else
                sFieldCondicional := _CdsCompContas.FieldByName('IDCONTACONDINI').AsString;

             // Verifica se a conta/grupo de condicionais já foi calculada. Se não foi, vai para o próximo registro
             if not VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldCondicional).AsString,
                                             cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
             begin
                DoProgresso([4,'Calculando contas condicionais. Conta/Grupo Inicial ' +
                            QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' ainda não calculado(a)']);
                Continue;
                _CdsCompContas.Next;
             end;
             rValorIni := RetornaValorContaCondicional(_CdsCompContas.FieldByName(sFieldCondicional).AsString,cOrcadoOuReal,
                                                       iIdCenario,iIdPlanoOrc,iIdPessoa,iPeriodo,iExercicio,
                                                       bCalculaPorPeriodo,bPorGrupo,False,dDataCorrente);




             // Pega o valor da Conta/Grupo final
             //---------------------------------------------------------------------------
             // Pega o campo condicional correto
             if bPorGrupo then
                sFieldCondicional := _CdsCompContas.FieldByName('IDGRUPOCONDFIM').AsString
             else
                sFieldCondicional := _CdsCompContas.FieldByName('IDCONTACONDFIM').AsString;

             // Verifica se a conta de condicionais já foi calculada. Se não foi, vai para o próximo registro
             if not VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldCondicional).AsString,
                                            cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
             begin
                DoProgresso([4,'Calculando contas condicionais. Conta/Grupo Final ' +
                            QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' ainda não calculado(a)']);
                Continue;
                _CdsCompContas.Next;
             end;
             // Retorna o valor condicional final de acordo com os parâmetros
             //C:= Conta ou grupo; V:= valor fixo
             case _CdsCompContas.FieldByName('TIPOCONDINI').AsString[1] of
                'C': rValorFim := RetornaValorContaCondicional(_CdsCompContas.FieldByName(sFieldCondicional).AsString,cOrcadoOuReal,
                                                               iIdCenario,iIdPlanoOrc,iIdPessoa,iPeriodo,iExercicio,
                                                               bCalculaPorPeriodo,bPorGrupo,False,dDataCorrente);
                'V': rValorFim := _CdsCompContas.FieldByName('VLRCONDINI').AsFloat;
             end;


             // Pega o valor da Conta/Grupo de resultado
             //---------------------------------------------------------------------------
             // Pega o campo condicional correto
             if bPorGrupo then
                sFieldCondicional := _CdsCompContas.FieldByName('IDGRUPOCONDRES').AsString
             else
                sFieldCondicional := _CdsCompContas.FieldByName('IDCONTACONDRES').AsString;

             // Verifica se a conta de condicionais já foi calculada. Se não foi, vai para o próximo registro
             if not VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldCondicional).AsString,
                                             cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
             begin
                DoProgresso([4,'Calculando contas condicionais. Conta/Grupo Resultado ' +
                            QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' ainda não calculado(a)']);
                Continue;
                _CdsCompContas.Next;
             end;
             // Retorna o valor condicional final de acordo com os parâmetros
             //C:= Conta ou grupo; V:= valor fixo
             case _CdsCompContas.FieldByName('TIPOCONDRES').AsString[1] of
                'C': rValorRes := RetornaValorContaCondicional(_CdsCompContas.FieldByName(sFieldCondicional).AsString,cOrcadoOuReal,
                                                               iIdCenario,iIdPlanoOrc,iIdPessoa,iPeriodo,iExercicio,
                                                               bCalculaPorPeriodo,bPorGrupo,False,dDataCorrente);
                'V': rValorRes := _CdsCompContas.FieldByName('VLRCONDRES').AsFloat;
             end;



             // Gera o resultado da condicional
             //---------------------------------------------------------------------------
             rValor := GeraResultadoOperacao(_CdsCompContas.FieldByName('CONDICAO').AsString,bGravaSaldo);

             // Se as contas não sofrerem a condição informada, vai para o próximo registro
             if not bGravaSaldo then
             begin
                DoProgresso([4,'Calculando contas condicionais. Conta/Grupo ' +
                            QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' não sofreu condicional esperado']);

                Continue;
                _CdsCompContas.Next;
             end
             else
             // Grava os dados na tabela de Saldos Orcamentarios
             begin
                if not bSinalContaPositivo then
                   rValor := (rValor * -1);

                rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal,
                                                      _Cds.FieldByName('FLGACUMULADO').AsString,
                                                      _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                      _Cds.FieldByName('FORMULA').AsString,
                                                      rValor,
                                                      iIdPlanoOrc,
                                                      iPeriodo,
                                                      iExercicio,
                                                      iIdPessoa,
                                                      bCalculaPorPeriodo,
                                                      dDataCorrente,
                                                      iIdCenario);

                if not GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                           _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,
                                           _Cds.FieldByName('FLGSINALCONTA').AsString,rValor,
                                           rValorAcum,dDataCorrente,
                                           //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                           -1,
                                           -1,
                                           //Fim
                                           lstBloco // Edilaine - SOL 185723 / KTN 1742408
                                           ) then
                   raise Exception.Create(MessageInfo);                           
             end;


             //===========================================================================
             // Se for para calcular também saldo anterior
             //Vai fazer a mesma rotina acima. A diferença é o parâmetrio da função
             //"RetornaValorContaCondicional" de False para True e o método GravaSaldoCalcAnterior
             //===========================================================================             
             if bCalculaSaldoAnterior then
             begin
                rValorIni  := 0;
                rValorRes  := 0;
                rValorFim  := 0;
                rValor     := 0;
                // Pega o campo condicional correto
                if bPorGrupo then
                   sFieldCondicional := _CdsCompContas.FieldByName('IDGRUPOCONDINI').AsString
                else
                   sFieldCondicional := _CdsCompContas.FieldByName('IDCONTACONDINI').AsString;

                // Verifica se a conta/grupo de condicionais já foi calculada. Se não foi, vai para o próximo registro
                if not VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldCondicional).AsString,
                                                cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
                begin
                   DoProgresso([4,'Calculando contas condicionais. Conta/Grupo Inicial ' +
                               QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' ainda não calculado(a)']);
                   Continue;
                   _CdsCompContas.Next;
                end;
                rValorIni := RetornaValorContaCondicional(_CdsCompContas.FieldByName(sFieldCondicional).AsString,cOrcadoOuReal,
                                                          iIdCenario,iIdPlanoOrc,iIdPessoa,iPeriodo,iExercicio,
                                                          bCalculaPorPeriodo,bPorGrupo,True,dDataCorrente);



                // Pega o valor da Conta/Grupo final
                //---------------------------------------------------------------------------
                // Pega o campo condicional correto
                if bPorGrupo then
                   sFieldCondicional := _CdsCompContas.FieldByName('IDGRUPOCONDFIM').AsString
                else
                   sFieldCondicional := _CdsCompContas.FieldByName('IDCONTACONDFIM').AsString;

                // Verifica se a conta de condicionais já foi calculada. Se não foi, vai para o próximo registro
                if not VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldCondicional).AsString,
                                                cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
                begin
                   DoProgresso([4,'Calculando contas condicionais. Conta/Grupo Final ' +
                               QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' ainda não calculado(a)']);
                   Continue;
                   _CdsCompContas.Next;
                end;
                // Retorna o valor condicional final de acordo com os parâmetros
                //C:= Conta ou grupo; V:= valor fixo
                case _CdsCompContas.FieldByName('TIPOCONDINI').AsString[1] of
                   'C': rValorFim := RetornaValorContaCondicional(_CdsCompContas.FieldByName(sFieldCondicional).AsString,cOrcadoOuReal,
                                                                  iIdCenario,iIdPlanoOrc,iIdPessoa,iPeriodo,iExercicio,
                                                                  bCalculaPorPeriodo,bPorGrupo,True,dDataCorrente);
                   'V': rValorFim := _CdsCompContas.FieldByName('VLRCONDINI').AsFloat;
                end;


                // Pega o valor da Conta/Grupo de resultado
                //---------------------------------------------------------------------------
                // Pega o campo condicional correto
                if bPorGrupo then
                   sFieldCondicional := _CdsCompContas.FieldByName('IDGRUPOCONDRES').AsString
                else
                   sFieldCondicional := _CdsCompContas.FieldByName('IDCONTACONDRES').AsString;

                // Verifica se a conta de condicionais já foi calculada. Se não foi, vai para o próximo registro
                if not VerificaContaJaCalculada(_CdsCompContas.FieldByName(sFieldCondicional).AsString,
                                                cOrcadoOuReal,iIdPlanoOrc,bPorGrupo) then
                begin
                   DoProgresso([4,'Calculando contas condicionais. Conta/Grupo Final ' +
                               QuotedStr(_CdsCompContas.FieldByName(sFieldCondicional).AsString) + ' ainda não calculado(a)']);
                   Continue;
                   _CdsCompContas.Next;
                end;
                // Retorna o valor condicional final de acordo com os parâmetros
                //C:= Conta ou grupo; V:= valor fixo
                case _CdsCompContas.FieldByName('TIPOCONDRES').AsString[1] of
                   'C': rValorRes := RetornaValorContaCondicional(_CdsCompContas.FieldByName(sFieldCondicional).AsString,cOrcadoOuReal,
                                                                   iIdCenario,iIdPlanoOrc,iIdPessoa,iPeriodo,iExercicio,
                                                                   bCalculaPorPeriodo,bPorGrupo,True,dDataCorrente);
                   'V': rValorRes := _CdsCompContas.FieldByName('VLRCONDRES').AsFloat;
                end;



                // Gera o resultado da condicional
                //---------------------------------------------------------------------------
                rValor := GeraResultadoOperacao(_CdsCompContas.FieldByName('CONDICAO').AsString,bGravaSaldo);

                if not GravaSaldoCalcAnterior(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                              _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,
                                              rValor) then
                   raise Exception.Create(MessageInfo);
             end;


             // Composição da conta
             _CdsCompContas.Next;
          end;

         // Cds das contas
         _Cds.Next;
      end;

      Result := True;


   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;



//1.3.5 - 1.4.8
function TCtrlGeraDados.CalculaFormulaContas(cOrcadoOuReal: Char;
  sConteudo: string; iIdPessoa, iIdCenario, iPeriodo, iExercicio,
  iIdPlanoOrc, iPosIni, iQtdDigitos: integer; bPorGrupo, bCalculaSaldoAnterior,
  bCalculaPorPeriodo: boolean; dDataCorrente: TDateTime;
  const lstBloco : TStringList  // Edilaine - SOL 185723 / KTN 1742408
  ): boolean;

var
   rValor      : Double;
   rValorAcum  : Double;
   sFormulaOrcOuReal,sFormulaDecod : String;
   bSinalContaPositivo: boolean;

begin
   try
      rValor     := 0;
      rValorAcum := 0;
      
      // Pega as contas de cálculo "Fórmula"
      _Cds.Data := SelContasOrcamen(cOrcadoOuReal,'M',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,bPorGrupo);

      while not _Cds.Eof do
      begin
         // Anda a barra de progresso
         DoProgresso([2,
                     'Calculando contas de fórmula...',
                     1,
                     _Cds.RecordCount,
                     _Cds.RecNo,
                     '',
                     iProgIni,
                     iProgFim,
                     iProgCorr]);

          // Pega o sinal da conta
          bSinalContaPositivo := (_Cds.FieldByName('FLGSINALCONTA').AsString = 'P');

          // Pega a formula 
          sFormulaOrcOuReal := _Cds.FieldByName('FORMULA').AsString;

          // Transforma a fórmula em valores, para o Parser executar o cálculo
          sFormulaDecod := DecodificaFormula(sFormulaOrcOuReal,'N',cOrcadoOuReal,iIdPlanoOrc,iIdCenario,
                                             iPeriodo,iExercicio,iIdPessoa,False,
                                             bCalculaPorPeriodo,dDataCorrente);
          if Trim(sFormulaDecod) <> '' then
          begin
             try
                pParser.Expression := sFormulaDecod;
                rValor := RoundCM(pParser.Value,2);
             except
                rValor := 0;
             end;

             if not bSinalContaPositivo then
                rValor := (rValor * -1);

             rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal,_Cds.FieldByName('FLGACUMULADO').AsString,
                                                   _Cds.FieldByName('IDCONTAORCAMEN').AsString,sFormulaOrcOuReal,
                                                   rValor,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,bCalculaPorPeriodo,
                                                   dDataCorrente,iIdCenario);  

             // Grava o resultado
             if not GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                        _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,
                                        _Cds.FieldByName('FLGSINALCONTA').AsString,rValor,
                                        rValorAcum,dDataCorrente,
                                        //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                        -1,
                                        -1,
                                        //Fim
                                        lstBloco // Edilaine - SOL 185723 / KTN 1742408
                                        ) then
                raise Exception.Create(MessageInfo);                        
          end;                                   


          // Se for para calcular o saldo anterior
          if bCalculaSaldoAnterior then
          begin
             // Transforma a fórmula em valores, para o Parser executar o cálculo
             sFormulaDecod := DecodificaFormula(sFormulaOrcOuReal,'N',cOrcadoOuReal,iIdPlanoOrc,iIdCenario,
                                                iPeriodo,iExercicio,iIdPessoa,True,
                                                bCalculaPorPeriodo,dDataCorrente);
             if Trim(sFormulaDecod) <> '' then
             begin
                try
                   pParser.Expression := sFormulaDecod;
                   rValor := RoundCM(pParser.Value,2);
                except
                   rValor := 0;
                end;

                if not bSinalContaPositivo then
                   rValor := (rValor * -1);
                   
                // Grava o resultado
                if not GravaSaldoCalcAnterior(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                              _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,rValor) then
                   raise Exception.Create(MessageInfo);
             end;
          end;

         // Cds das contas
         _Cds.Next;
      end;


      Result := True;

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;



//1.4.1
function TCtrlGeraDados.CalculaArquivosGenericos(cOrcadoOuReal: Char;
  sConteudo: string; iIdPessoa, iIdCenario, iPeriodo, iExercicio,
  iIdPlanoOrc,iPosIni,iQtdDigitos: integer; bPorGrupo, bCalculaSaldoAnterior,
  bCalculaPorPeriodo: boolean; dDataCorrente: TDateTime): boolean;

var
   rValor,rValorAcum : Double;
   bSinalContaPositivo: boolean;
   CdsArqGenAux,CdsDataView: TClientDataSet;

begin
   try
      rValor       := 0;
      rValorAcum   := 0;
      _Cds.Data    := SelContasOrcamen(cOrcadoOuReal,'G',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,bPorGrupo);
      CdsArqGenAux := TClientDataSet.Create(nil);
      CdsDataView  := TClientDataSet.Create(nil);

      while not _Cds.Eof do
      begin
          // Anda a barra de progresso
          DoProgresso([2,
                      'Calculando arquivos genéricos...',
                      1,
                      _Cds.RecordCount,
                      _Cds.RecNo,
                      '',
                      iProgIni,
                      iProgFim,
                      iProgCorr]);

          bSinalContaPositivo := (_Cds.FieldByNAme('FLGSINALCONTA').AsString = 'P');

          CdsDataView.Data := GetDataPacket('SELECT TEMPLATE ' +
                                            'FROM DATAVIEW ' +
                                            'WHERE ' +
                                            '  IDDATAVIEW = ' + _Cds.FieldByName('IDDATAVIEW').AsString + ' AND '+
                                            '  ORIGEMCMDV = ''0'' ');
          if not CdsDataView.IsEmpty then
          begin
             CdsArqGenAux.Data := GetDataPacket(CdsDataView.FieldByName('TEMPLATE').AsString);

             if not CdsArqGenAux.IsEmpty then
             begin
                rValor := CdsArqGenAux.FieldByName('VALOR').AsFloat;

                if not bSinalContaPositivo then
                   rValor := (rValor * -1);

                rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal,_Cds.FieldByName('FLGACUMULADO').AsString,
                                                      _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                                      _Cds.FieldByName('FORMULA').AsString,rValor,iIdPlanoOrc,
                                                      iPeriodo,iExercicio,iIdPessoa,bCalculaPorPeriodo,
                                                      dDataCorrente,iIdCenario);

                if not GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                           _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,
                                           _Cds.FieldByName('FLGSINALCONTA').AsString,rValor,
                                           rValorAcum,dDataCorrente,
                                           //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                           -1,
                                           -1
                                           //Fim
                                           ) then
                   raise Exception.Create(MessageInfo);
             end;
          end;

         _Cds.Next;
      end;


      Result := True;
      FreeAndNil(CdsArqGenAux);
      FreeAndNil(CdsDataView);

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
         FreeAndNil(CdsArqGenAux);
         FreeAndNil(CdsDataView);                  
      end;
   end;
end;



//1.4.3
function TCtrlGeraDados.CalculaFluxoCaixa(cOrcadoOuReal: Char;
  sConteudo: string; iIdPessoa, iIdCenario, iPeriodo, iExercicio,
  iIdPlanoOrc, iPosIni, iQtdDigitos: integer; bPorGrupo, bCalculaSaldoAnterior,
  bCalculaPorPeriodo: boolean; dDataCorrente: TDateTime): Boolean;

var
   rValor,rValorAcum : Double;
   bSinalContaPositivo: boolean;
   sSQL: string;

begin
   try
      //Pega as contas
      _Cds.Data := SelContasOrcamen(cOrcadoOuReal,'X',sConteudo,iPosIni,iQtdDigitos,iIdPlanoOrc,bPorGrupo);

      // Varre o Cds de Contas selecionada
      while not _Cds.Eof do
      begin
         // Anda a barra de progresso
         DoProgresso([2,
                     'Calculando fluxo de caixa...',
                     1,
                     _Cds.RecordCount,
                     _Cds.RecNo,
                     '',
                     iProgIni,
                     iProgFim,
                     iProgCorr]);


         rValor     := 0;
         rValorAcum := 0;
         bSinalContaPositivo := (_Cds.FieldByName('FLGSINALCONTA').AsString = 'P');
         _CdsCompContas.Data  := SelCompContasOrcamen(_Cds.FieldByName('IDCONTAORCAMEN').AsString,iIdPlanoOrc,cOrcadoOuReal,'X');

         while not _CdsCompContas.Eof do
         begin
            sSQL := 'SELECT SUM(DECODE(RECPAG,''R'',VALOR,VALOR * (-1))) AS VALOR ' +
                    'FROM ' +
                    '   FLUXOREAL ' +
                    'WHERE  ' +
                    '  (CODTIPRECDES  LIKE ' + QuotedStr(Trim(_CdsCompContas.FieldByName('CODTIPRECDES').AsString) + '%')  + ') AND ' +
                    '  (IDPESSOA         = ' + IntToStr(iIdPessoa) + ') AND ' +
                    '  (RECPAG           = ' + QuotedStr(_CdsCompContas.FieldByName('RECPAG').AsString) + ') ';

                  if bCalculaPorPeriodo then
                     sSQL := sSQL + ' AND (TO_CHAR(DATACFLOAT,''YYYYMM'') = ' + QuotedStr(FormatDateTime('yyyymm',dDataCorrente)) + ') '
                  else
                     sSQL := sSQL + ' AND (DATACFLOAT = TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataCorrente)) + ',''dd/mm/yyyy'')) ';

                  if Trim(_CdsCompContas.FieldByName('UNIDNEGOC').AsString) <> '' then
                     sSQL := sSQL + ' AND (UNIDNEGOC = ' + _CdsCompContas.FieldByName('UNIDNEGOC').AsString + ') ';

                  if Trim(_CdsCompContas.FieldByName('IDPLANOPREV').AsString) <> '' then
                     sSQL := sSQL + ' AND (IDPLANOPREV = ' + _CdsCompContas.FieldByName('IDPLANOPREV').AsString + ') ';

                  if Trim(_CdsCompContas.FieldByName('IDPATRO').AsString) <> '' then
                     sSQL := sSQL + ' AND (IDPATRO = ' + _CdsCompContas.FieldByName('IDPATRO').AsString + ') ';

                  if Trim(_CdsCompContas.FieldByName('CODCENTRORESPON').AsString) <> '' then
                     sSQL := sSQL + ' AND (CODCENTRORESPON LIKE ' + QuotedStr(Trim(_CdsCompContas.FieldByName('CODCENTRORESPON').AsString) + '%') + ') ';

                  if Trim(_CdsCompContas.FieldByName('CODCENTROCUSTO').AsString) <> '' then
                     sSQL := sSQL + ' AND (CODCENTROCUSTO LIKE ' + QuotedStr(Trim(_CdsCompContas.FieldByName('CODCENTROCUSTO').AsString) + '%') + ') ';

                  // Incrementa o acumulador de valores das contas da Composição
                  _CdsAux.Data := GetDataPacket(sSQL);
                  if not _CdsAux.IsEmpty then
                     rValor := rValor + _CdsAux.FieldByName('VALOR').AsFloat;


            // Cds da composição
            _CdsCompContas.Next;
         end;

         // Calcula o acumulado
         rValorAcum := CalculaValorDoAcumulado(cOrcadoOuReal,_Cds.FieldByName('FLGACUMULADO').AsString,
                                               _Cds.FieldByName('IDCONTAORCAMEN').AsString,
                                               _Cds.FieldByName('FORMULA').AsString,rValor,
                                               iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                               bCalculaPorPeriodo,dDataCorrente,iIdCenario);

         if not bSinalContaPositivo then
            rValor := (rValor * -1);

         // Grava o resultado
         if not GravaSaldoCalculado(iIdCenario,iIdPlanoOrc,iPeriodo,iExercicio,iIdPessoa,
                                    _Cds.FieldByName('IDCONTAORCAMEN').AsString,cOrcadoOuReal,
                                    _Cds.FieldByName('FLGSINALCONTA').AsString,rValor,
                                    rValorAcum,dDataCorrente,
                                    //Ricardo de Freitas - SOL 160539 - KINTANA 1349786
                                    -1,
                                    -1
                                    //Fim
                                    ) then
            raise Exception.Create(MessageInfo);


         // Cds das contas
         _Cds.Next;
      end;

      Result := True;

   except
      on E:Exception do
      begin
         Result      := False;
         MessageInfo := E.Message;
      end;
   end;
end;




function TCtrlGeraDados.ListaCenarios: OleVariant;
begin
   Result := GetDataPacket('SELECT IDCENARIOORCAMEN, NOMECENARIO ' +
                           'FROM CENARIOORCAMEN ' +
                           'ORDER BY NOMECENARIO');
end;


function TCtrlGeraDados.ListaPlanoOrcamento: OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.IDPLANOORCAMEN, '+
          '       P.NOMEPLANOORC, '+
          '       P.ANO, P.MASCARAGRUPO '+
          '  FROM PLANOORCAMENTARIO P '+
          'order by P.NOMEPLANOORC';

  result := GetDataPacket( sSQL );
end;

end.
