unit uCmCtrlRptModAuto;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
  uSistema, cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModAuto = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RResFolComp, RVariavelMensal, RAlterFuncional, REtiquetas, RCadPessoal,
     RFichaFunc, RFolhaFreq, RDestacamento;

function TCmCtrlRptModAuto.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3254 : Result := TRptResFolComp.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3257 : Result := TRptVariavelMensal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3418 : Result := TRptEtiquetas.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3420 : Result := TRptFichaFunc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3422 : Result := TRptCadPessoal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3428 : Result := TRptAlterFuncional.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4292 : Result := TRptFolhaFreq.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
   20336 : Result := TRptDestacamento.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    else
      MessageInfo := 'Relatório não implementado';
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModAuto.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3254 : Result := TRptResFolComp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3257 : Result := TRptVariavelMensal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3418 : Result := TRptEtiquetas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3420 : Result := TRptFichaFunc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3422 : Result := TRptCadPessoal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3428 : Result := TRptAlterFuncional.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4292 : Result := TRptFolhaFreq.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
   20336 : Result := TRptDestacamento.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);

    else
      MessageInfo := 'Relatório não implementado';
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModAuto.ReportExists: boolean;
begin
  case (IdReport) of
    3254,3257,3418,3420,3422,3428,4292,20336 : Result := true;
    else Result := false;
  end;
end;

end.
