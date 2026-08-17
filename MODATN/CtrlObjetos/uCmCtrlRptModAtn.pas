unit uCmCtrlRptModAtn;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
  uSistema, cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModAtn = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RCadDependente, RDCT, REtiquetas, RCadPessoal, RAvisoFerias, RFeriasProgram, RMapaTrein,
  RFichaFinanc, RFolhaEmprRub, RAvalPre, RAval3C, RProgAval, RAtivPess, RNecesPess,
  RGerencial, RDossieCand, RRequi, RRotat, RFichaFunc, RInconsistSal, RPesqSal;

function TCmCtrlRptModAtn.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3380 : Result := TRptCadDependente.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3162 : Result := TRptDCT.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    578 : Result := TRptEtiquetas.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    574 : Result := TRptCadPessoal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    138 : Result := TRptAvisoFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    139 : Result := TRptFeriasProgram.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    142 : Result := TRptFichaFinanc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    143 : Result := TRptFolhaEmprRub.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3719 : Result := TRptAvalPre.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3720 : Result := TRptAval3C.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3721 : Result := TRptProgAval.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3722 : Result := TRptAtivPess.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3723 : Result := TRptNecesPess.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3724 : Result := TRptMapaTrein.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    164 : Result := TRptGerencial.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3996 : Result := TRptDossieCand.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3998 : Result := TRptRequi.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3999 : Result := TRptRotat.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4000 : Result := TRptFichaFunc.ConfigReport(liIdreports,
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

function TCmCtrlRptModAtn.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3380 : Result := TRptCadDependente.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3162 : Result := TRptDCT.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    578 : Result := TRptEtiquetas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    574 : Result := TRptCadPessoal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    138 : Result := TRptAvisoFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    139 : Result := TRptFeriasProgram.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    142 : Result := TRptFichaFinanc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    143 : Result := TRptFolhaEmprRub.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3719 : Result := TRptAvalPre.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3720 : Result := TRptAval3C.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3721 : Result := TRptProgAval.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3722 : Result := TRptAtivPess.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3723 : Result := TRptNecesPess.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3724 : Result := TRptMapaTrein.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    164 : Result := TRptGerencial.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3996 : Result := TRptDossieCand.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3998 : Result := TRptRequi.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3999 : Result := TRptRotat.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4000 : Result := TRptFichaFunc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
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

function TCmCtrlRptModAtn.ReportExists: boolean;
begin
  case (IdReport) of
    3380,3162,578,574,138,139,142,
    143,3719,3720,3721,3722,3723,
    3724,164,3996,3998,3999,4000,
    634,635 : Result := true
    else Result := false;
  end;
end;

end.
