Unit uCtrlRptCAP;
Interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
  uMensErro, cmParamReport, uSistema, uCmCtrlReports, uCMTypes;

Type
  TCtrlRptCAP = Class(TCmCtrlReports)

  private

  protected
    Function PrintReport: Boolean; override;
  public
    Function ReportExists: Boolean; override;
    Function configreport(LiIdReports, LiOrigemCm: integer; DesReport: Tobject): Boolean; override;
  End;

Implementation

Uses rAdiantamento, rAdiantoRegularizado, rTipoDesemb, rCapContab, rPlanPrev,
  rPlanPrevSin, rMaiorFornCli, rRecDesEfet, rValoresRecPag, rDocAbertos,
  rRellccontab, rDocDataProg, rDocPagoxLotes, rDiario, rContrValRecPag,
  rLancAlt, rPagCentRespon, rRecDesNEft, rPosiForn, rLancDoc, rCcForCli, rPrevObra,
  rPosiSaldosForn, rPosiFornxRespon, rCrxDesemb, rPosiSaldosFornDoc, rListaEmissCheque,
  rlote, rRecEncargos, rLotexBanco, rAtosGestPag, rAprovaDocs, rCheque, rSlip,
  rFichaPag, rOrdemDePago, rDemisSint, rAutPag, rApGr, rApGr3, rOrdemPgtoNova, rEmissBPagto,
  rEmissBDebito, rEmissBDebitoMod2, rDemGestAutPag, rLancDoc2;

Function TCtrlRptCAP.configreport(LiIdReports, LiOrigemCm: integer;
  DesReport: Tobject): Boolean;
Var
  sMensagem: String;
Begin
  Result := False;
  Case Idreport Of
    {** Algumas bases usam a numeracao 1325,1326 teve ser incluir novamente na base}
    1325, 3856: Result := TRptAdiantamento.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1326, 3857: Result := TRptAdiantoRegularizado.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1488: Result := TRptTipoDesemb.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2031: Result := TRptCapContab.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1983: Result := TRptPlanPrev.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1984: Result := TRptPlanPrevSin.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1529: Result := TRptMaiorFornCli.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1495: Result := TRptRecDesEfet.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1489: Result := TRptValoresRecPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1224: Result := TRptDocAbertos.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2465: Result := TRptRellccontab.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1532: Result := TRptDocDataProg.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1153: Result := TRptDocPagoxLotes.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1172: Result := TRptDiario.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2191: Result := TRptContrValRecPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1478: Result := TRptLancAlt.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1520: Result := TRptPagCentRespon.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1480: Result := TRptRecDesNEft.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1503: Result := TRptPosiForn.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1551: Result := TRptLancDoc.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1544: Result := TRptCcForCli.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1150: Result := TRptPrevObra.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1291: Result := TRptPosiSaldosForn.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1835: Result := TRptPosiFornxRespon.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1825: Result := TRptCrxDesemb.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3640: Result := TRptPosiSaldosFornDoc.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1421: Result := TRptListaEmissCheque.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2002: Result := TRptLote.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1927: Result := TRptRecEncargos.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2062: Result := TRptLotexBanco.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2034: Result := TRptAtosGestPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1147: Result := TRptAprovaDocs.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1494: Result := TRptCheque.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1508: Result := TRptSlip.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1852: Result := TRptFichaPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2474: Result := TRptOrdemDePago.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2543: Result := TRptDemisSint.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2546: Result := TRptAutPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2551: Result := TRptApGr.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3272: Result := TRptApGr3.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    3824: Result := TRptOrdemPgtoNova.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1553: Result := TRptEmissBPagto.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    1554: Result := TRptEmissBDebito.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2856: Result := TRptEmissBDebitoMod2.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2556: Result := TRptDemGestAutPag.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    2672: Result := TRptLancDoc2.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);

  Else
    MessageInfo := 'Relatório não implementado'
  End;
  If Not Result Then
    MessageInfo := sMensagem;
End;

Function TCtrlRptCAP.PrintReport: Boolean;
Var
  sMensagem: String;
Begin
  Result := False;
  Case Idreport Of
    1325, 3856: Result := TRptAdiantamento.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1326, 3857: Result := TRptAdiantoRegularizado.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1488: Result := TRptTipoDesemb.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2031: Result := TRptCapContab.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1983: Result := TRptPlanPrev.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1984: Result := TRptPlanPrevSin.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1529: Result := TRptMaiorFornCli.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1495: Result := TRptRecDesEfet.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1489: Result := TRptValoresRecPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1224: Result := TRptDocAbertos.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2465: Result := TRptRellccontab.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1532: Result := TRptDocDataProg.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1153: Result := TRptDocPagoxLotes.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1172: Result := TRptDiario.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2191: Result := TRptContrValRecPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1478: Result := TRptLancAlt.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1520: Result := TRptPagCentRespon.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1480: Result := TRptRecDesNEft.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1503: Result := TRptPosiForn.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1551: Result := TRptLancDoc.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1544: Result := TRptCcForCli.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1150: Result := TRptPrevObra.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1291: Result := TRptPosiSaldosForn.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1835: Result := TRptPosiFornxRespon.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1825: Result := TRptCrxDesemb.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    3640: Result := TRptPosiSaldosFornDoc.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1421: Result := TRptListaEmissCheque.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2002: Result := TRptLote.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1927: Result := TRptRecEncargos.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2062: Result := TRptLotexBanco.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2034: Result := TRptAtosGestPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1147: Result := TRptAprovaDocs.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1494: Result := TRptCheque.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1508: Result := TRptSlip.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1852: Result := TRptFichaPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2474: Result := TRptOrdemDePago.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2543: Result := TRptDemisSint.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2546: Result := TRptAutPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2551: Result := TRptApGr.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    3272: Result := TRptApGr3.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    3824: Result := TRptOrdemPgtoNova.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1553: Result := TRptEmissBPagto.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    1554:  Result := TRptEmissBDebito.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
    2856: Result := TRptEmissBDebitoMod2.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
   2556: Result := TRptDemGestAutPag.PrintReport(IdReport, 1,
        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, Devicetype,
        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
        ExibeFormParams, lstHtmlFOrmParam,
        GeraHtmlFormParam, IdHotel);
   2672: Result := TRptLancDoc2.PrintReport(IdReport, 1,
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

Function TCtrlRptCAP.ReportExists: Boolean;
Begin
  Case IdReport Of
    1325, 1326, 3856, 3857, 1488, 2031, 1983, 1984, 1529, 1495, 1489, 1224, 2465, 1532,
      1153, 1172, 2191, 1478, 1520, 1480, 1503, 1551, 1544, 1150, 1835, 1825, 1291,
      3640, 1421, 2002, 1927, 2062, 2034, 1147, 1494, 1508, {1852,} 2474, 2543, 2546 {,
    2551, 3272}, 3824, 1553, 1554, 2856, 2556, 2672: Result := True;
  Else
    Result := False;
  End;
End;

End.

