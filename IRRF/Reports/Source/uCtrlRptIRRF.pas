unit uCtrlRptIRRF;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, cmParamReport, uSistema, uCmCtrlReports, uCMTypes;

Type   TCtrlRptIRRF = Class(TCmCtrlReports)

protected
   function PrintReport: Boolean; Override;
public
    function ReportExists: Boolean; Override;
    function configreport(LiIdReports, LiOrigemCm : integer; DesReport : Tobject) : Boolean; Override;
End;

implementation

uses  rptGPSMT, rDarf, rRelatCompRendPessJurid, rRelatCompAnualRetIRPJCSLLPISCOFINS, rDarfGerado,
      rRelatDirf, rConfIRRF, rConfIRRFAna, rGpsGerados, RDarfDepositoJud, rptDARMMT, rCompDARF, RSaldoNegativoAnual;


function TCtrlRptIRRF.configreport(LiIdReports, LiOrigemCm: integer;
  DesReport: Tobject): Boolean;
Var
 sMensagem : string;
begin
  Result := False;

  Case Idreport Of
    20116: Result := TrptDARM.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3144 : Result := TrptGPS.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1531 : Result := TfrmRptDarf.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1741 : Result := TfrmRelatCompRendPessJurid.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2070 : Result := TfrmrptDarfGerado.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3107 : Result := TfrmRptConfDirf.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3110 : Result := TfrmRptConfIRRF.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3109 : Result := TfrmRptConfIRRFAna.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3452 : result := TfrmRptGpsGerados.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3854 : result := TfrmRptDarfDepositoJud.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    20183: Result := TfrmRelatCompAnualRetIRPJCSLLPI.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    20210: Result := TFrmRptCompDARF.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    20344: Result := TRptSaldoNegativoAnual.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
  Else
     MessageInfo := 'Relatório não implementado'
  End;

  If Not Result Then
     MessageInfo := sMensagem;

end;

function TCtrlRptIRRF.PrintReport: Boolean;
Var  sMensagem :String;
begin
   Result := False;
   Case Idreport Of

      20116: Result := TrptDARM.PrintReport(IdReport, 1,
                                            IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                            DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                            DbAdoConnection, DbConnectionType, Devicetype,
                                            ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                            ExibeFormParams, lstHtmlFOrmParam ,
                                            GeraHtmlFormParam,IdHotel);


      3144 : Result := TrptGPS.PrintReport(IdReport, 1,
                                           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                           DbAdoConnection, DbConnectionType, Devicetype,
                                           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                           ExibeFormParams, lstHtmlFOrmParam ,
                                           GeraHtmlFormParam,IdHotel);
      1531 : Result := TfrmRptDarf.PrintReport(IdReport, 1,
                                               IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                               DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                               DbAdoConnection, DbConnectionType, Devicetype,
                                               ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                               ExibeFormParams, lstHtmlFOrmParam ,
                                               GeraHtmlFormParam,IdHotel);
      1741 : Result := TfrmRelatCompRendPessJurid.PrintReport(IdReport, 1,
                                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                              DbAdoConnection, DbConnectionType, Devicetype,
                                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                              ExibeFormParams, lstHtmlFOrmParam ,
                                                              GeraHtmlFormParam,IdHotel);
      2070 : Result := TfrmrptDarfGerado.PrintReport(IdReport, 1,
                                                     IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                     DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                     DbAdoConnection, DbConnectionType, Devicetype,
                                                     ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                     ExibeFormParams, lstHtmlFOrmParam ,
                                                     GeraHtmlFormParam,IdHotel);
      3107 : Result := TfrmRptConfDirf.PrintReport(IdReport, 1,
                                                   IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                   DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                   DbAdoConnection, DbConnectionType, Devicetype,
                                                   ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                   ExibeFormParams, lstHtmlFOrmParam ,
                                                   GeraHtmlFormParam,IdHotel);
      3110 : Result := TfrmRptConfIRRF.PrintReport(IdReport, 1,
                                                  IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                  DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                  DbAdoConnection, DbConnectionType, Devicetype,
                                                  ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                  ExibeFormParams, lstHtmlFOrmParam ,
                                                  GeraHtmlFormParam,IdHotel);
      3109 : Result := TfrmRptConfIRRFAna.PrintReport(IdReport, 1,
                                                     IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                     DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                     DbAdoConnection, DbConnectionType, Devicetype,
                                                     ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                     ExibeFormParams, lstHtmlFOrmParam ,
                                                     GeraHtmlFormParam,IdHotel);
      3452 : result := TfrmRptGpsGerados.PrintReport(IdReport, 1,
                                                    IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                    DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                    DbAdoConnection, DbConnectionType, Devicetype,
                                                    ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                    ExibeFormParams, lstHtmlFOrmParam ,
                                                    GeraHtmlFormParam,IdHotel);
      3854 : result := TfrmRptDarfDepositoJud.PrintReport(IdReport, 1,
                                                    IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                    DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                    DbAdoConnection, DbConnectionType, Devicetype,
                                                    ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                    ExibeFormParams, lstHtmlFOrmParam ,
                                                    GeraHtmlFormParam,IdHotel);

      20183: Result := TfrmRelatCompAnualRetIRPJCSLLPI.PrintReport(IdReport, 1,
                                                    IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                    DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                    DbAdoConnection, DbConnectionType, Devicetype,
                                                    ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                    ExibeFormParams, lstHtmlFOrmParam ,
                                                    GeraHtmlFormParam,IdHotel);
      20210: Result := TFrmRptCompDARF.PrintReport(IdReport, 1,
                                                   IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                   DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                                   DbAdoConnection, DbConnectionType, Devicetype,
                                                   ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                   ExibeFormParams, lstHtmlFOrmParam ,
                                                   GeraHtmlFormParam,IdHotel);

      20344: Result := TRptSaldoNegativoAnual.PrintReport(IdReport, 1,
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

function TCtrlRptIRRF.ReportExists : Boolean;
begin
   Case IdReport of
      3144, 1531, 1741, 2070, 3107, 3110, 3109, 3452, 3854, 20116, 20183, 20210, 20344 : Result := True
   Else
      Result := False;
   End;
end;

end.
