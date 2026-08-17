unit uCtrlRptCFinan;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, cmParamReport,
     uSistema, uCmCtrlReports, uCMTypes, RTransfBancaria, rptAplicResgates;

type
   TCtrlRptCFinan = class(TCmCtrlReports)

   private

   public

     function ReportExists: Boolean; override;
     function ConfigReport(liIdreports, liOrigemCm: Integer;
              DesReport: TObject): Boolean; Override;

   protected

     function PrintReport: Boolean; override;


   end;




implementation
uses
  RDemPosFinanc,RDocMarcRecPag,RLancFinanc,RTransfFundos,RSaldoContas,RSaldoHist,
  RContabilDiaria,RFluxoRealAnal,RConfDocReg,RCompRecPag,ROrcadoXPrevisto,
  ROrcadoXReal,ROrcadoXRealCR,RExtratoContas,RAssinaturaCheque,RFluxoRealAnalCAPCAR,
  RConcContFin, rEnvDocContab;




function TCtrlRptCFinan.PrintReport: Boolean;
var
   sMensagem : string;
begin
   Result := False;
   case Idreport of
      20330 : Result := TfrmAplicResgate.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);

      20329 : Result := TrptTranfBancaria.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);

      1370 : Result := TRptDemPosFinanc.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);

      1141 : Result := TRptLancFinanc.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1270 : Result := TRptTransfFundos.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1368 : Result := TRptSaldoContas.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1471 : Result := TRptSaldoHist.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1601 : Result := TRptContabilDiaria.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      2411 : Result := TRptFluxoRealAnal.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      3158 : Result := TRptConfDocReg.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1406 : Result := TRptCompRecPag.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      2185 : Result := TRptOrcadoXPrevisto.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      2423 : Result := TRptOrcadoXReal.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      2625 : Result := TRptOrcadoXRealCR.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1131: Result := TRptExtratoContas.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      3679: Result := TRptAssinaturaCheque.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      3749: Result := TRptFluxoRealAnalCAPCAR.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      3816: Result := TRptConcContFin.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      20357: Result := TrptEnvDocContab.PrintReport(IdReport, 1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam,
                                              GeraHtmlFormParam, IdHotel);
   else
      MessageInfo := 'Relatório não implementado'
   end;

   If not(Result) then MessageInfo:=sMensagem;
end;



function TCtrlRptCFinan.ReportExists : Boolean;
begin
   case IdReport of
      1370, 20330,
      20329,
      1141, 1270, 1368, 1471, 1601, 2411, 3158, 1406, 2185,
      2423, 2625, 1131, 3679, 3749, 3816, 20357 : Result := True
   else
      Result := False;
   end;
end;



function TCtrlRptCFinan.ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): Boolean;
var
   sMensagem : String;
begin
   Result:=False;
   case IdReport of
      30330: Result := TfrmAplicResgate.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      20329 : Result := TrptTranfBancaria.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1370 : Result := TRptDemPosFinanc.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1141 : Result := TRptLancFinanc.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1270 : Result := TRptTransfFundos.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1368 : Result := TRptSaldoContas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1471 : Result := TRptSaldoHist.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1601 : Result := TRptContabilDiaria.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2411 : Result := TRptFluxoRealAnal.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3158 : Result := TRptConfDocReg.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1406 : Result := TRptCompRecPag.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2185 : Result := TRptOrcadoXPrevisto.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2423 : Result := TRptOrcadoXReal.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2625 : Result := TRptOrcadoXRealCR.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1131 : Result := TRptExtratoContas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3679 : Result := TRptAssinaturaCheque.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3749 : Result := TRptFluxoRealAnalCAPCAR.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3816 : Result := TRptConcContFin.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      20357 : Result := TrptEnvDocContab.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
   else
      MessageInfo:='Relatório não Implementado';
   end;

   if not(Result) then MessageInfo:=sMensagem;
end;



end.
