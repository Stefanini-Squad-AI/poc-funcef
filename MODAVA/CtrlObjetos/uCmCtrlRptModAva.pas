unit uCmCtrlRptModAva;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, uSistema,
  cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModAva = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RAvalPre, RAval3C, RProgAval, RFormAvalBranco, RAvalDesemp;

function TCmCtrlRptModAva.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3692 : Result := TRptAvalPre.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3697 : Result := TRptAval3C.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3699 : Result := TRptProgAval.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    17   : Result := TRptFormAvalBranco.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4016 : Result := TRptAvalDesemp.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModAva.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3692 : Result := TRptAvalPre.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3697 : Result := TRptAval3C.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3699 : Result := TRptProgAval.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    17   : Result := TRptFormAvalBranco.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4016 : Result := TRptAvalDesemp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    else
      MessageInfo := 'Relatório não implementado'
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModAva.ReportExists: boolean;
begin
  case (IdReport) of
    3692,3697,3699,17, 4016 : Result := true
    else
      Result := false;
  end;
end;

end.
