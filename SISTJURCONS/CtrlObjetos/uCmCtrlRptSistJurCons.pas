unit uCmCtrlRptSistJurCons;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, uSistema,
  cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptSistJurCons = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RGrupoObjeto, RMotivoJur, RTipAcao, RTipRec, RTipObjeto, RTipProc, RTipSent, RVara,
  RFichaProc, RProcJud, RAnalSintProc, RReciboAdvogados, RPenhora;

function TCmCtrlRptSistJurCons.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    4078 : Result := TRptGrupoObjeto.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4079 : Result := TRptMotivoJur.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4087 : Result := TRptTipAcao.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4083 : Result := TRptTipRec.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4084: Result := TRptTipObjeto.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4085 : Result := TRptTipProc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4086 : Result := TRptTipSent.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4080 : Result := TRptVara.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4077 : Result := TRptFichaProc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4081 : Result := TRptProcJud.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4076 : Result := TRptAnalSintProc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4097 : Result := TRptReciboAdvogados.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4519 : Result := TRptPenhora.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptSistJurCons.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    4078 : Result := TRptGrupoObjeto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4079 : Result := TRptMotivoJur.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4087 : Result := TRptTipAcao.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4083 : Result := TRptTipRec.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4084 : Result := TRptTipObjeto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4085 : Result := TRptTipProc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4086 : Result := TRptTipSent.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4080 : Result := TRptVara.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4077 : Result := TRptFichaProc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4081 : Result := TRptProcJud.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4076 : Result := TRptAnalSintProc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4097 : Result := TRptReciboAdvogados.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4519 : Result := TRptPenhora.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptSistJurCons.ReportExists: boolean;
begin
  case (IdReport) of
    4078,4079,4087,4083,4084,4085,4086,4080,4077,4081, 4076, 4097, 4519 : Result := true
    else Result := false;
  end;
end;

end.
