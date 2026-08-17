Unit uCtrlRptCAR;
Interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, cmParamReport,
  uSistema, uCmCtrlReports, uCMTypes, RValoresCCusto;

Type
  TCtrlRptCAR = Class(TCmCtrlReports)

  private

  protected
    Function PrintReport: Boolean; override;
  public
    Function ReportExists: Boolean; override;
    Function configreport(LiIdReports, LiOrigemCm: integer; DesReport: Tobject): Boolean; override;
  End;

Implementation

Uses rCartaCob, rAdiantamento, rAdiantoRegularizado, rTipoDesemb, rPosiSaldos, rCcForCli, rValoresRecPag,
  rDocAbertos, rCapContab, rPlanPrev, rPlanPrevSin, rTrialBalance, rMaiorFornCli, rAgingListCliente,
  rRecDesEfet, rRecDesNEft, rPosSaldosAnalitico, rPagCentRespon, rLancAlt, rDiario, rDocDataProg, rLancDoc,
  rRellccontab, rPosiSaldosDoc, rDemisSint, rApGr, rFichaPag, rEmissBloq, rPosiFornCli, rEmisEtiq;

Function TCtrlRptCAR.configreport(LiIdReports, LiOrigemCm: integer;
  DesReport: Tobject): Boolean;
Var
  sMensagem: String;
Begin
  Result := False;

  Case Idreport Of
    1399: Result := TRptCartaCob.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1323: Result := TRptAdiantamento.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1324: Result := TRptAdiantoRegularizado.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1487: Result := TRptTipoDesemb.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1149: Result := TRptPosiSaldos.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1168: Result := TRptCcForCli.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1490: Result := TRptValoresRecPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1225: Result := TRptDocAbertos.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2032: Result := TRptCapContab.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1985: Result := TRptPlanPrev.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1987: Result := TRptPlanPrevSin.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2484: Result := TRptTrialBalance.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1528: Result := TRptMaiorFornCli.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1308: Result := TRptAgingListCliente.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1496: Result := TRptRecDesEfet.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1481: Result := TRptRecDesNEft.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1512: Result := TRptPosSaldosAnalitico.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1441: Result := TRptPagCentRespon.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1479: Result := TRptLancAlt.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1173: Result := TRptDiario.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1533: Result := TRptDocDataProg.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1552: Result := TRptLancDoc.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2467: Result := TRptRellccontab.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3642: Result := TRptPosiSaldosDoc.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2544: Result := TRptDemisSint.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1598: Result := TRptApGr.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1909: Result := TRptFichaPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2426: Result := TRptEmissBloq.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1502: Result := TRptPosiFornCli.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1391: Result := TRptEmisEtiq.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);

    //  Rodolpho da Silva - P: 24143 - 18/05/2007
    20339: Result := TRptValoresCCusto.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);

  Else
    MessageInfo := 'Relatório não implementado'
  End;

  If Not Result Then
    MessageInfo := sMensagem;

End;

Function TCtrlRptCAR.PrintReport: Boolean;
Var
  sMensagem: String;
Begin
  Result := False;
  Case Idreport Of
    1399: Result := TRptCartaCob.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1323: Result := TRptAdiantamento.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1324: Result := TRptAdiantoRegularizado.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1487: Result := TRptTipoDesemb.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1149: Result := TRptPosiSaldos.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1168: Result := TRptCcForCli.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1490: Result := TRptValoresRecPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1225: Result := TRptDocAbertos.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2032: Result := TRptCapContab.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1985: Result := TRptPlanPrev.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1987: Result := TRptPlanPrevSin.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2484: Result := TRptTrialBalance.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1528: Result := TRptMaiorFornCli.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1308: Result := TRptAgingListCliente.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1496: Result := TRptRecDesEfet.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1481: Result := TRptRecDesNEft.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1512: Result := TRptPosSaldosAnalitico.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1441: Result := TRptPagCentRespon.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1479: Result := TRptLancAlt.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1173: Result := TRptDiario.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1533: Result := TRptDocDataProg.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1552: Result := TRptLancDoc.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2467: Result := TRptRellccontab.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    3642: Result := TRptPosiSaldosDoc.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2544: Result := TRptDemisSint.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1598: Result := TRptApGr.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1909: Result := TRptFichaPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2426: Result := TRptEmissBloq.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1502: Result := TRptPosiFornCli.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1391: Result := TRptEmisEtiq.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
        
   //  Rodolpho da Silva - P: 24143 - 18/05/2007
   20339: Result := TRptValoresCCusto.PrintReport(IdReport, 1,
                                                  IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                  DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                                  DbAdoConnection, DbConnectionType, Devicetype,
                                                  ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                  ExibeFormParams, lstHtmlFOrmParam,
                                                  GeraHtmlFormParam, IdHotel);
  Else
    MessageInfo := 'Relatório não implementado'
  End;

  If Not Result Then
    MessageInfo := sMensagem;
End;

Function TCtrlRptCAR.ReportExists: Boolean;
Begin
  Case IdReport Of
    1399, 1323, 1324, 1487, 1149, 1168, 1490, 1225, 2032, 1985, 1987, 2484,
      1528, 1308, 1496, 1481, 1512, 1441, 1479, 1173, 1533, 1552, 2467, 3642, 2544,
      1598, 1909, 2426, 1502, 1391, 20339: Result := True
  Else
    Result := False;
  End;
End;

End.

