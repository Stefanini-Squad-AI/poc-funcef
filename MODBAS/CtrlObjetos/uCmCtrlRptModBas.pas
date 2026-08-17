unit uCmCtrlRptModBas;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, uSistema,
  cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModBas = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RCartaComunicado, RCargos, RCCusto, RMotivo, RSindi, RProfis, REtiquetas, RCadPessoal,
  RCracha, RFichaFunc;

function TCmCtrlRptModBas.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3836 : Result := TRptCartaComunicado.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    550 : Result := TRptCargos.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    552 : Result := TRptCCusto.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    554 : Result := TRptMotivo.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    557 : Result := TRptSindi.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    556 : Result := TRptProfis.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    579 : Result := TRptEtiquetas.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    573 : Result := TRptCadPessoal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3193 : Result := TRptCracha.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    444 : Result := TRptFichaFunc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModBas.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    550 : Result := TRptCargos.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    552 : Result := TRptCCusto.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    554 : Result := TRptMotivo.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    557 : Result := TRptSindi.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    556 : Result := TRptProfis.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    579 : Result := TRptEtiquetas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    573 : Result := TRptCadPessoal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3193 : Result := TRptCracha.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    444 : Result := TRptFichaFunc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModBas.ReportExists: boolean;
begin
  case (IdReport) of
    3836,550,552,554,557,556,579,573,3193,444 : Result := true;
    else
      Result := false;
  end;
end;

end.
