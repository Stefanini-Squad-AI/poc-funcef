{ --------------------------------------------------------------------------------------------------
Rotina......: ConfigReport, PrintReport, ReportExists
Nº SOL......: 132992, 132743
Nº KINTANA..: 770843, 767392
Data........: 10/08/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração dos IdReports de 20404->20406 e 20405->20407
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: ConfigReport, PrintReport, ReportExists
Nº SOL......: 132742, 132741, 132744, 132758, 132992, 132743
Nº KINTANA..: 767273, 767272, 767396, 767599, 770843, 767392
Data........: 21/05/2010
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação dos relatórios para atender a CGPC28
---------------------------------------------------------------------------------------------------}
unit uCtrlRptContab;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
     cmParamReport, uSistema, uCmCtrlReports;

Type

   TCtrlRptContab = Class(TCmCtrlReports)
   private

   protected
      function PrintReport: Boolean; Override;
   public
      function ReportExists: Boolean; Override;
      function ConfigReport(liIdreports, liOrigemCm:Integer;DesReport:TObject):Boolean;Override;
   End;

implementation

Uses

     RBalancete,RBalanceteCad, RBalanceteColunado,RBalanceteCxSC, RBalanco,
     RDiario, rContasxCentroCusto, rCentroCustoxContas, ROrcamentoCC,
     rHistoricoPadrao, RPeriodos, RSubContas, RPlanoContas, RRazaoAnalitico,RRazaoSintetico,
     RRazaoAnalSimples, ROrcamento, RPlanilhas,rDiarioResumido,rConfCotas,RRazaoCCusto,
     rConfSubConta, rListaDemonst, rSaldoInicial, rAvisoLan, rMapaEvolu,rBalanceteAnalAPSC,
     rBalanceteAnalAPCC, rBalanceteColMesCC,rBalanceteCCusto,rBalanceteCxCC, rBalanceteCxAP,
     rSaldosAtuais,rBalConsolidado,rDemonstrativo1,rDemonstrativo2,rDemonstrativo3,
     rDemonstrativo4,rDemonstrativo5,rDemonstrativo6,rDemoLayout,rDemonstrativo7,
     rTipoRentabilidade,rDemoSPC, rBalPatrSPC, RBalanceteAnalPP, RBalanceteAnalSubConta,
     rCGPC28;

{ TCmRptManager }


function TCtrlRptContab.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
 sMensagem :string;
begin
   result := False;

   Case IdReport Of

      1596  : Result := TRptBalancete.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2323  : Result := TRptBalanceteCad.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3148  : Result := TRptBalanceteColunado.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1643  : Result := TRptBalanceteCxSC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1202  : Result := TRptBalanco.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);

      20176 : Result := TRptDemoPadraoSPC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      20177 : Result := TRptBalPatrSPC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);

      1819  : Result := TrptDemoLayout.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1542  : Result := TrptDemonstrativo1.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1207  : Result := TrptDemonstrativo2.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1194  : Result := TrptDemonstrativo3.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1285  : Result := TrptDemonstrativo4.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1661  : Result := TrptDemonstrativo5.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1695  : Result := TrptDemonstrativo6.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3906  : Result := TrptDemonstrativo7.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1198  : Result := TRptDiario.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1794  : Result := TrptCentroCustoxContas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1427  : Result := TrptContasxCentroCusto.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1429  : Result := TrptHistoricoPadrao.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1430  : Result := TRptPeriodos.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1428  : Result := TrptSubContas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1610  : Result := TrptPlanoContas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1539  : Result := TrptOrcamento.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3717  : Result := TrptOrcamentoCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1600  : Result := TrptPlanilhas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1593  : Result := TRptRazaoAnalitico.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3613  : Result := TRptRazaoAnalSimples.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3394  : Result := TrptDiarioResumido.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1384  : Result := TRptRazaoCCusto.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1271  : Result := TrptRazaoSintetico.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1719  : Result := TrptConfCotas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1628  : Result := TrptConfSubConta.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2208  : Result := TrptListaDemonst.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1201  : Result := TrptSaldoInicial.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2686  : Result := TRptAvisoLan.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2050  : Result := TrptMapaEvolu.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1697  : Result := TrptBalanceteAnalAPSC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2076  : Result := TrptBalanceteAnalAPCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2860  : Result := TrptBalanceteColMesCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2259  : Result := TrptBalanceteCCusto.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1629  : Result := TrptBalanceteCxCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1652  : Result := TrptBalanceteCxAP.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1854  : Result := TrptSaldosAtuais.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1887  : Result := TrptBalConsolid.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      20154 : Result := TRptTipoRentabilidade.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);

      20192 : Result := TRptBalanceteAnalPP.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);

      20335 : Result := TRptBalanceteAnalSubConta.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);

      20400: Result := TRptCGPC28.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport); // Alterado por FHBS - SOL: 132742 KTN: 767273
      20401: Result := TRptCGPC28.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport); // Alterado por FHBS - SOL: 132741 KTN: 767272
      20402: Result := TRptCGPC28.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport); // Alterado por FHBS - SOL: 132744 KTN: 767396
      20403: Result := TRptCGPC28.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport); // Alterado por FHBS - SOL: 132758 KTN: 767599
      20406: Result := TRptCGPC28.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport); // Alterado por FHBS - SOL: 132992 KTN: 770843
      20407: Result := TRptCGPC28.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport); // Alterado por FHBS - SOL: 132743 KTN: 767392

   End;

   if not Result then
      MessageInfo := sMensagem;
end;

function TCtrlRptContab.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   Result := False;
   Case Idreport Of
{*******************************************************************************
Contabilidade
*******************************************************************************}
    1596 : //Balancete
       Result := TRptBalancete.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    3148 : //Balancete Colunado
       Result := TRptBalanceteColunado.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                 FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1643 : //Balancete de Contas x Sub-Contas
       Result := TRptBalanceteCxSC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);
    1202 : //Balanço
       Result := TRptBalanco.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);


    1819      : //Demonstrativo de Resultado - Modelo de Layout
       Result := TrptDemoLayout.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    20176     : //Demonstrativo de Resultado - Modelo Padrão SPC
       Result := TRptDemoPadraoSPC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    20177     : //Balanço Patrimonial - Modelo Padrão SPC
       Result := TRptBalPatrSPC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);



    1542 : //Demonstrativo de Resultado - Modelo 01
       Result := TrptDemonstrativo1.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1207 : //Demonstrativo de Resultado - Modelo 02
       Result := TrptDemonstrativo2.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1194 : //Demonstrativo de Resultado - Modelo 03
       Result := TrptDemonstrativo3.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1285 : //Demonstrativo de Resultado - Modelo 04
       Result := TrptDemonstrativo4.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1661 : //Demonstrativo de Resultado - Modelo 05
       Result := TrptDemonstrativo5.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1695 : //Demonstrativo de Resultado - Modelo 06
       Result := TrptDemonstrativo6.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    3906 : //Demonstrativo de Resultado - Modelo 07
       Result := TrptDemonstrativo7.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1198 : //Diário
       Result := TRptDiario.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1794 : //Listagem de Centros de Custo x Contas
       Result := TrptCentroCustoxContas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1427 : //Listagem de Contas por Centro de Custo
       Result := TrptContasxCentroCusto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1429 : //Listagem de Históricos Padrão
       Result := TrptHistoricoPadrao.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1430 : //Listagem de Períodos
        Result := TRptPeriodos.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1428 : //Listagem de Sub-Contas
        Result := TrptSubContas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1610 : //Listagem do Plano de Contas
        Result := TrptPlanoContas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1539 : //Orçado x Realizado
        Result := TrptOrcamento.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    3717 : //Orçado x Realizado por Centro de custo
        Result := TrptOrcamentoCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1600 : //Planilhas Lançadas
        Result := TrptPlanilhas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    3613 : //Razão Simplificado
        Result := TRptRazaoAnalSimples.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1593 : //Razão Analítico
        Result := TRptRazaoAnalitico.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    3394 : //Diario Resumido
       Result := TrptDiarioResumido.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1384 : //Razao Por Centro de Custo
       Result := TRptRazaoCCusto.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
                   FileName, DataBaseName ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1271 : //Razao Sintetico
       Result := TrptRazaoSintetico.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);


    1719 : //Conferencia de Cotas por Ativ/Projeto
       Result := TrptConfCotas.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1628 : //Conferencia de Sub-Conta
       Result := TrptConfSubConta.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2208 : //Listagem de Demonstrativo de resultado
       Result := TrptListaDemonst.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1201 : //Listagem de Demonstrativo de resultado
       Result := TrptSaldoInicial.PrintReport(IdReport, 1, IdEmpresa,IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo,sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog,ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2686 : //Aviso de Lancamento
       Result := TRptAvisoLan.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                 FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2050 : //Mapa de Evolucao
       Result := TrptMapaEvolu.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                 FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1697 : //Balancete Anal. de  Ativ.Proj e Sub-Conta
       Result := TrptBalanceteAnalAPSC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2076: //Balancete Anal. de C.Custo por Ativ.Proj
       Result := TrptBalanceteAnalAPCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2860: //Balancete Colunado por C.Custo
       Result := TrptBalanceteColMesCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2259: //Balancete de Centro de Custo x Contas
       Result := TrptBalanceteCCusto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1629: //Balancete de Contas x Centro de Custo
       Result := TrptBalanceteCxCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    1652: //Balancete de Contas x Atividade/Projeto
       Result := TrptBalanceteCxAP.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

    2323: //Balancete Modelo Caderno
       Result := TrptBalanceteCad.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);


     1854: //Balancete de Saldos Atuais
       Result := TrptSaldosAtuais.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     1887: //Balancete Consolidado
       Result := TrptBalConsolid.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     20154:
       Result := TrptTipoRentabilidade.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);


     //andré tavares - pendência 19623 - 03/05/2006
     20192 : Result := TRptBalanceteAnalPP.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     //andré tavares - pendência 24982 - 17/04/2007
     20335 : Result := TRptBalanceteAnalSubConta.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     // Alterado por FHBS - SOL: 132742 KTN: 767273
     20400 : Result := TRptCGPC28.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     // Alterado por FHBS - SOL: 132741 KTN: 767272
     20401: Result := TRptCGPC28.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     // Alterado por FHBS - SOL: 132744 KTN: 767396
     20402: Result := TRptCGPC28.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     // Alterado por FHBS - SOL: 132758 KTN: 767599
     20403: Result := TRptCGPC28.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     // Alterado por FHBS - SOL: 132992 KTN: 770843
     20406: Result := TRptCGPC28.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

     // Alterado por FHBS - SOL: 132743 KTN: 767392
     20407: Result := TRptCGPC28.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
               FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);


   Else
      MessageInfo := 'Relalatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;

function TCtrlRptContab.ReportExists: Boolean;
begin
   Case IdReport of
     1596,3148,1643,1202,1819, 20176, 20177, 1207,1194,1285,1198,1794,1427, 1542, 1661, 1695,3717,
     1429,1430,1428,1610,1539,1600,1593,1856,3394,1719,1271,1384,1628,2208, 3613, 3906,
     1201,2686, 2050, 1697, 2076, 2860, 2259, 1629, 1652, 1854, 1887, 2323, 20154,
     20192, 20335, 20400, 20401, 20402, 20403, 20406, 20407
      : Result := True;
   Else
     Result := False;
   End;
End;

End.
