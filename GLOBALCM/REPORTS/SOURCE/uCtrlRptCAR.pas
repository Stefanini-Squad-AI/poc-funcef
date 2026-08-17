unit uCtrlRptCAR;
interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, cmParamReport,
     uSistema, uCmCtrlReports, uCMTypes;

Type   TCtrlRptCAR = Class(TCmCtrlReports)

private

protected
   function PrintReport: Boolean; Override;
public
   function ReportExists: Boolean; Override;
End;

implementation

uses  {rCartaCob, }rAdiantamento, rAdiantoRegularizado, rTipoDesemb, rPosiSaldos{, rCcForCli}, rValoresRecPag,
      rDocAbertos, rCapContab, rPlanPrev, rPlanPrevSin, rTrialBalance;

function TCtrlRptCAR.PrintReport: Boolean;
Var  sMensagem :String;
begin
   Result := False;
   Case Idreport Of
{      1399 : Result := TFCartaCob.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel); }
      1323 : Result := TRptAdiantamento.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1324  : Result := TRptAdiantoRegularizado.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1487  : Result := TRptTipoDesemb.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1149  : Result := TRptPosiSaldos.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
 {    1168   : Result := TFCcForCli.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);}
      1490  : Result := TRptValoresRecPag.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1225  : Result := TRptDocAbertos.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
       2032 : Result := TRptCapContab.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
       1985 : Result := TRptPlanPrev.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
       1987 : Result := TRptPlanPrevSin.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
       2484  : Result := TRptTrialBalance.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);

                                              

   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then
      MessageInfo := sMensagem;
end;

function TCtrlRptCAR.ReportExists : Boolean;
begin
   Case IdReport of
      {1399,} 1323, 1324, 1487, 1149{, 1168}, 1490, 1225, 2032, 1985, 1987, 2484  : Result := True
   Else
      Result := False;
   End;
end;

end.
