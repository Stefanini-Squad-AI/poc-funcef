unit uCtrlRptGlobal;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports, uCMTypes;

Type
  TCtrlRptGlobal = Class(TCmCtrlReports)

  private

  protected
   function PrintReport: Boolean; Override;
  public
    function ReportExists: Boolean; Override;
    function ConfigReport( LiIdReports, LiOrigemCm: integer;
             DesReport: Tobject ): Boolean; override;
  End;

implementation

uses rAcessos, rAutorizacao;

function TCtrlRptGlobal.ReportExists: Boolean;
begin
  Case IdReport of
       3182:  Result := True;

       //10.08.2006 17382
       20199: Result := True;
       Else
           Result := False;
  End;
end;

function TCtrlRptGlobal.ConfigReport(LiIdReports, LiOrigemCm: integer;
         DesReport: Tobject): Boolean;
var
  sMensagem: String;
begin
  Result := False;

  Case Idreport Of
       3182: Result := TRptAcessos.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );

       // 10.08.2006 17382
       20199: Result := TRptParamAutoriza.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       Else MessageInfo := 'Relatório não implementado'
  End;

  If Not Result Then
     MessageInfo := sMensagem;
end;

function TCtrlRptGlobal.PrintReport: Boolean;
Var
  sMensagem: String;
begin
  Result := False;

  Case Idreport Of
       3182: Result := TRptAcessos.PrintReport( IdReport, 1, IdEmpresa,
                                   IdUsuario, IdModulo, Params, FileName,
                                   DataBaseName, NomeEmpresa, NomeModulo,
                                   sMensagem, DbAdoConnection, DbConnectionType,
                                   Devicetype, ShowCancelDialog, ShowPrintDialog,
                                   ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam,
                                   GeraHtmlFormParam, IdHotel );
       //10.08.2006 17382
       20199: Result := TRptParamAutoriza.PrintReport( IdReport, 1, IdEmpresa,
                                   IdUsuario, IdModulo, Params, FileName,
                                   DataBaseName, NomeEmpresa, NomeModulo,
                                   sMensagem, DbAdoConnection, DbConnectionType,
                                   Devicetype, ShowCancelDialog, ShowPrintDialog,
                                   ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam,
                                   GeraHtmlFormParam, IdHotel );
       Else
          MessageInfo := 'Relatório não implementado'
  End;

  If Not Result Then
     MessageInfo := sMensagem;
end;

end.

