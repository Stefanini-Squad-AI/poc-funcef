unit uCmCtrlRptModCes;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
  uSistema, cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModCes = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses REtiquetaAlteracaoCTPS, RFaixaSal, RAlterFuncional, RInconsistSal, RPesqSal;

function TCmCtrlRptModCes.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3674 : Result := TRptEtiquetaAlteracaoCTPS.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    633 : Result := TRptFaixaSal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3842 : Result := TRptAlterFuncional.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    634  : Result := TRptInconsistSal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    635  : Result := TRptPesqSal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado';
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModCes.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3674 : Result := TRptEtiquetaAlteracaoCTPS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    633 : Result := TRptFaixaSal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3842 : Result := TRptAlterFuncional.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    634  : Result := TRptInconsistSal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    635  : Result := TRptPesqSal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    else
      MessageInfo := 'Relatório não implementado';
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModCes.ReportExists: boolean;
begin
  case (IdReport) of
    3674,633,3842,634,635 : Result := true;
    else
      Result := false;
  end;
end;

end.
