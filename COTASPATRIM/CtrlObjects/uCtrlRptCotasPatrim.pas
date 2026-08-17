unit uCtrlRptCotasPatrim;

Interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
  uMensErro, cmParamReport, uSistema, uCmCtrlReports, uCMTypes;

Type
  TCtrlRptCotasPatrim = Class(TCmCtrlReports)

  private

  protected
    Function PrintReport: Boolean; override;
  public
    Function ReportExists: Boolean; override;
    Function configreport(LiIdReports, LiOrigemCm: integer; DesReport: Tobject): Boolean; override;
  End;

Implementation

uses  rMovimentaPorConta;

Function TCtrlRptCotasPatrim.configreport(LiIdReports, LiOrigemCm: integer;
  DesReport: Tobject): Boolean;
Var
  sMensagem: String;
Begin
  Result := False;
  Case Idreport Of
    //2790: Result := TRptApGr2.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    20346: Result:= TrptMovimentaPorConta.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
    
  Else
    MessageInfo := 'Relatório não implementado'
  End;
  If Not Result Then
    MessageInfo := sMensagem;
End;

Function TCtrlRptCotasPatrim.PrintReport: Boolean;
Var
  sMensagem: String;
Begin
  Result := False;
  Case Idreport Of
    20346: Result:= TrptMovimentaPorConta.PrintReport(IdReport, 1,
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

Function TCtrlRptCotasPatrim.ReportExists: Boolean;
Begin
  Case IdReport Of
      20346 : Result := True;
  Else
    Result := False;
  End;
End;

End.
