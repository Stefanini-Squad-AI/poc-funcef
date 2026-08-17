unit uCtrlRptContrato;

interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, cmParamReport,
     uSistema, uCmCtrlReports, uCMTypes;

type
   TCtrlRptContrato = class(TCmCtrlReports)
   private
   public
     function ReportExists: Boolean; override;
     function ConfigReport(liIdreports, liOrigemCm: Integer;
              DesReport: TObject): Boolean; Override;
   protected
     function PrintReport: Boolean; override;
end;

implementation

uses RAditamentos, RContratos, RPgtosRecbs, RExtrato;

function TCtrlRptContrato.PrintReport: Boolean;
var
   sMensagem : string;
begin
   Result := False;
   case Idreport of
      2451 : Result := TRptAditamentos.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      1920 : Result := TRptContratos.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
      2037 : Result := TRptPagtosRecbs.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);
     20000 : Result := TRptExtrato.PrintReport(IdReport,  1,
                                              IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                              DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
                                              DbAdoConnection, DbConnectionType, Devicetype,
                                              ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                              ExibeFormParams, lstHtmlFOrmParam ,
                                              GeraHtmlFormParam,IdHotel);

   else
      MessageInfo := 'Relatório não implementado'
   end;

   If not(Result) then MessageInfo:=sMensagem;
end;

function TCtrlRptContrato.ReportExists : Boolean;
begin
   case IdReport of
      2451, 1920, 2037,20000 : Result := True
   else
      Result := False;
   end;
end;

function TCtrlRptContrato.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
   sMensagem : String;
begin
   Result:=False;
   case IdReport of
       2451 : Result := TRptAditamentos.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
       1920 : Result := TRptContratos.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
       2037 : Result := TRptPagtosRecbs.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      20000 : Result := TRptExtrato.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
   else
      MessageInfo:='Relatório não Implementado';
   end;

   if not(Result) then MessageInfo := sMensagem;
end;

end.
