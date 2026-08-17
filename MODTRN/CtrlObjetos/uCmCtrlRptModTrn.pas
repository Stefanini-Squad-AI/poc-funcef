unit uCmCtrlRptModTrn;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, uSistema,
  cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModTrn = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RNecesCurso, RNecesPess, RAtivPess, RAtivCurso, RAtivEntid, RMapaTrein, RListaEntid,
  RTabCursos, RListaPresenca, RCartaConvoc, RMapaResumoTrein, RMapaResumoTrein2;

function TCmCtrlRptModTrn.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3654 : Result := TRptNecesCurso.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3655 : Result := TRptNecesPess.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3669 : Result := TRptAtivPess.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3670 : Result := TRptAtivCurso.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3671 : Result := TRptAtivEntid.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3676 : Result := TRptMapaTrein.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3731 : Result := TRptListaEntid.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2984 : Result := TRptTabCursos.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3837 : Result := TRptListaPresenca.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3838 : Result := TRptCartaConvoc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4002 : Result := TRptMapaResumoTrein.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4039 : Result := TRptMapaResumoTrein2.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModTrn.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3654: Result := TRptNecesCurso.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3655 : Result := TRptNecesPess.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3669 : Result := TRptAtivPess.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3670 : Result := TRptAtivCurso.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3671 : Result := TRptAtivEntid.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3676 : Result := TRptMapaTrein.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3731 : Result := TRptListaEntid.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2984 : Result := TRptTabCursos.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4002 : Result := TRptMapaResumoTrein.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4039 : Result := TRptMapaResumoTrein2.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModTrn.ReportExists: boolean;
begin
  case (IdReport) of
    3654,3655,3669,3670,3671,
    3676,3731,2984,3837,3838, 4002, 4039 : Result := true;
    else Result := false;
  end;
end;

end.
