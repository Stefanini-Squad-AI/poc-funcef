{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26239
Responsável : Daniel Simões
Data        : 29/08/2007
Descrição   : Implementação da função 'ConfigReport' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRptAlienacao;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports;

Type

   TCtrlRptAlienacao = Class(TCmCtrlReports)
   protected
    function PrintReport: Boolean; Override;

    // Daniel - 26239
    function ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean; override;

   public
    function ReportExists: Boolean; Override;
   end;

implementation

uses dRelParamContab, dRelPrevImob, dRelPerdas, dRelPerdasDiario, dRelFolhaAlienacao, dRelEstoqueFinanceiro,
     dRelAbonos, dRelMovimContabil;

{ TCtrlRptAlienacao }

// Daniel - 26239 - Início -----------------------------------------------------
function TCtrlRptAlienacao.ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean;
var sMensagem: String;
begin
  Result := False;

  case (IdReport) of
    3695 : Result := TdtmRelParamContab.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3694 : Result := TdtmRelPrevImob.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3963 : Result := TdtmRelFolhaAlienacao.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20162: Result := TdtmRelPerdas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20165: Result := TdtmRelPerdasDiario.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20178: Result := TdtmRelEstoqueFinanceiro.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20198: Result := TdtmRelAbonos.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20332: Result := TdtmRelMovimContabil.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
  else
    MessageInfo := 'Relatório não implementado';
  end;

  if not Result then MessageInfo := sMensagem;
end;
// Daniel - 26239 - Fim --------------------------------------------------------

function TCtrlRptAlienacao.PrintReport: Boolean;
var sMensagem :String;
begin
   Result := False;
   case Idreport of
    3695 : Result := TdtmRelParamContab.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3694 : Result := TdtmRelPrevImob.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3963 : Result := TdtmRelFolhaAlienacao.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20162: Result := TdtmRelPerdas.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20165: Result := TdtmRelPerdasDiario.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20178: Result := TdtmRelEstoqueFinanceiro.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    // Início Pendência 21462 - Marcos V. Topini
    20198: Result := TdtmRelAbonos.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);
    // Fim Pendência 21462

    // Marchetti - Pendencia 21464
    20332: Result := TdtmRelMovimContabil.PrintReport(IdReport, 1,
                                       IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                       DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                       DbAdoConnection, DbConnectionType, Devicetype,
                                       ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                       ExibeFormParams, lstHtmlFOrmParam ,
                                       GeraHtmlFormParam);
    // Fim Marchetti - Pendencia 21464
   else
      MessageInfo := 'Relatório não implementado'
   end;

   if not Result then  MessageInfo := sMensagem;
end;

function TCtrlRptAlienacao.ReportExists: Boolean;
begin
  case IdReport of
    3694, 3695, 3963, 20162, 20165, 20178, 21462, 20198, 20332 : Result := True
  else
    Result := False;
  end;
end;

end.











