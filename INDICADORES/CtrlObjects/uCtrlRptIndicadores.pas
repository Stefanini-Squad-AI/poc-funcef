{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26239
Responsável : Daniel Simões
Data        : 29/08/2007
Descrição   : Implementação da função 'ConfigReport' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRptIndicadores;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports;

Type
   TCtrlRptIndicadores = Class(TCmCtrlReports)
   protected
     function PrintReport:  Boolean; Override;

    // Daniel - 26239
    function ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean; override;

   public
     function ReportExists: Boolean; Override;
   end;

implementation

uses dRelIndicadores, dRelEstrutura, dRelOrcamento, dRelFuncionario, dRelVeiculoSem,
     dRelEnergia, dRelVendaLoja, dRelInadimplencia, dRelAbono, dRelRemessa,
     dRelLojasLivres, dRelVendaAtividade, dRelRanking, dRelPerformance, dRelAgua,
     dRelGrpApuracao, dRelVeiculoMen, dRelVendaAtividadeShop, dRelVendaFranquiaShop,
     dRelOrcamentoCivil, dRelRdsHotel, dRelComparaHotel, dRelGraficoHotel,
     dRelAnaliseOrca, dRelVacancia, dRelEvolVacancia;

{ TCmCtrlRptIndicadores }

// Daniel - 26239 - Início -----------------------------------------------------
function TCtrlRptIndicadores.ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean;
var sMensagem: String;
begin
  Result := False;

  case (IdReport) of
    3433 : Result := TdtmRelIndicadores.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3435 : Result := TdtmRelOrcamento.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3437 : Result := TdtmRelEstrutura.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3441 : Result := TdtmRelFuncionario.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3449 : Result := TdtmRelVeiculoSem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3454 : Result := TdtmRelEnergia.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3463 : Result := TdtmRelVendaLoja.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3494 : Result := TdtmRelGrpApuracao.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3546 : Result := TdtmRelVeiculoMen.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3465 : Result := TdtmRelInadimplencia.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3469 : Result := TdtmRelAbono.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3471 : Result := TdtmRelRemessa.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3473 : Result := TdtmRelLojasLivres.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3475 : Result := TdtmRelVendaAtividade.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3477 : Result := TdtmRelRanking.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3479 : Result := TdtmRelPerformance.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3481 : Result := TdtmRelAgua.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3620 : Result := TdtmRelVendaAtividadeShop.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3622 : Result := TdtmRelOrcamentoCivil.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3755 : Result := TdtmRelRdsHotel.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3759 : Result := TdtmRelComparaHotel.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3763 : Result := TdtmRelGraficoHotel.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3965 : Result := TdtmRelVendaFranquiaShop.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20132: Result := TdtmRelVacancia.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20134: Result := TdtmRelEvolVacancia.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20140: Result := TdtmRelAnaliseOrca.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
  else
    MessageInfo := 'Relatório não implementado';
  end;

  if not Result then MessageInfo := sMensagem;
end;
// Daniel - 26239 - Fim --------------------------------------------------------

function TCtrlRptIndicadores.PrintReport: Boolean;
var sMensagem :String;
begin
   Result := False;
   case Idreport of
    3433 : Result := TdtmRelIndicadores.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3437 : Result := TdtmRelEstrutura.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3494 : Result := TdtmRelGrpApuracao.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3435 : Result := TdtmRelOrcamento.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3441 : Result := TdtmRelFuncionario.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3449 : Result := TdtmRelVeiculoSem.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3454 : Result := TdtmRelEnergia.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3463 : Result := TdtmRelVendaLoja.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3465 : Result := TdtmRelInadimplencia.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3469 : Result := TdtmRelAbono.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3471 : Result := TdtmRelRemessa.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3473 : Result := TdtmRelLojasLivres.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3475 : Result := TdtmRelVendaAtividade.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3477 : Result := TdtmRelRanking.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3479 : Result := TdtmRelPerformance.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3481 : Result := TdtmRelAgua.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3546 : Result := TdtmRelVeiculoMen.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3620 : Result := TdtmRelVendaAtividadeShop.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3965 : Result := TdtmRelVendaFranquiaShop.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3622 : Result := TdtmRelOrcamentoCivil.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3755 : Result := TdtmRelRdsHotel.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3759 : Result := TdtmRelComparaHotel.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3763 : Result := TdtmRelGraficoHotel.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20132: Result := TdtmRelVacancia.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20134: Result := TdtmRelEvolVacancia.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20140: Result := TdtmRelAnaliseOrca.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

   else
      MessageInfo := 'Relatório não implementado'
   end;

   if not Result then  MessageInfo := sMensagem;
end;


function TCtrlRptIndicadores.ReportExists: Boolean;
begin
  case IdReport of
     3433,  3435,  3437,  3441,  3449,  3454,  3463,  3494,  3546,
     3465,  3469,  3471,  3473,  3475,  3477,  3479,  3481,  3620,
     3622,  3755,  3759,  3763,  3965, 20132, 20134, 20140  : Result := True
  else
    Result := False;
  end;
end;


end.
