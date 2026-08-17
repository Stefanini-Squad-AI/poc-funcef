unit uCmCtrlRptProcPrev;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, uSistema,
  cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptProcPrev = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RGrupoObjeto, RMotivoJur, RTipAcao, RTipRec, RTipObjeto, RTipProc, RTipSent, RVara,
  RFichaProc_ProcPrev, RProcPrev, RAnalSintProc;

function TCmCtrlRptProcPrev.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3222 : Result := TRptGrupoObjeto.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3213 : Result := TRptMotivoJur.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3224 : Result := TRptTipAcao.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3225 : Result := TRptTipRec.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3226: Result := TRptTipObjeto.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3227 : Result := TRptTipProc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3228 : Result := TRptTipSent.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3229 : Result := TRptVara.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4052 : Result := TRptFichaProc_ProcPrev.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3196 : Result := TRptProcPrev.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4065 : Result := TRptAnalSintProc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptProcPrev.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3222 : Result := TRptGrupoObjeto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3223 : Result := TRptMotivoJur.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3224 : Result := TRptTipAcao.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3225 : Result := TRptTipRec.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3226 : Result := TRptTipObjeto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3227 : Result := TRptTipProc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3228 : Result := TRptTipSent.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3229 : Result := TRptVara.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4052 : Result := TRptFichaProc_ProcPrev.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3196 : Result := TRptProcPrev.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4065 : Result := TRptAnalSintProc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptProcPrev.ReportExists: boolean;
begin
  case (IdReport) of
    3222,3223,3224,3225,3226,3227,3228,3229,4052,3196, 4065 : Result := true
    else Result := false;
  end;
end;

end.
