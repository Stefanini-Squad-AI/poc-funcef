unit uCtrlRptRADG;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
     cmParamReport,  uCmCtrlReports ;

Type   TCtrlRptRADG = Class(TCmCtrlReports)

protected
   function PrintReport: Boolean; Override;
public
    function ReportExists: Boolean; Override;
    function ConfigReport(liIdReports, liOrigemCM : Integer;DesReport : TObject) : Boolean; Override;
End;

implementation

Uses rAcompProc,rFluxoProc,rGrupoRespon,rInfoProc,rGrupoAut, rProcessoRad, rTipoEtapa, FConsultaRAD,
     rProcAnaliticoRad, RRadAtrasos;

function TCtrlRptRADG.ConfigReport(liIdReports, liOrigemCM: Integer;
  DesReport: TObject): Boolean;
Var  sMensagem :String;
begin
   Result := False;
   Case Idreport Of
      2132 : Result := TRptAcompProc.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      2140 : Result := TRptFluxoProc.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      2142 : Result := TRptGrupoRespon.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      2144 : Result := TRptInfoProc.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      2146 : Result := TRptGrupoAut.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      2148 : Result := TrptTipoEtapa.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      //Marcus Oliveira - 09/11/06 inicio 23816  relatório Sintético e Pendente Processos RAD
      20207, 20208 : Result := TFrmRptProcessoRAD.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      //MArcus Oliveira Fim 09/11/06
      //Marcus Oliveira - inicio 23816 24/11/06 relatório Analitica Processos RAD
      20211        : Result := TrptProcAnaliticoRAD.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
      //MArcus Oliveira Fim 24/11/06
      //Marcus Oliveira - inicio 238870 28/11/06 Rel. com Grafico de Etapas com Atraso
      20212        : Result := TrptRadAtrasos.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
   Else
      sMensagem := 'Relatório não implementado'
   End;

   If Not Result Then
      MessageInfo := sMensagem;
end;

function TCtrlRptRADG.PrintReport: Boolean;
Var  sMensagem :String;
begin
   Result := False;
    Case Idreport Of
      2132 : Result := TRptAcompProc.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
      2140 : Result := TRptFluxoProc.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
      2142 : Result := TRptGrupoRespon.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
      2144 : Result := TRptInfoProc.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
      2146 : Result := TRptGrupoAut.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
      2148 : Result := TrptTipoEtapa.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
//Marcus Oliveira inicio 23816
      20207, 20208 : Result := TFrmRptProcessoRAD.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);

//Marcus Oliveira  24/11/06 23848
      20211 : Result := TrptProcAnaliticoRAD.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);
//Marcus Oliveira Fim 24/11/06
//Marcus Oliveira - inicio 238870 28/11/06 Rel. com Grafico de Etapas com Atraso
      20212 : Result := TrptRadAtrasos.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFormParam ,
                          GeraHtmlFormParam,IdHotel);



   Else
      sMensagem := 'Relatório não implementado'
   End;

   If Not Result Then
      MessageInfo := sMensagem;
end;

function TCtrlRptRADG.ReportExists : Boolean;
begin
   Case IdReport of
      2132,2140,2142,2144,2146,2148, 20207, 20208, 20211, 20212 : Result := True;
   Else
      Result := False;
   End;
end;

end.
