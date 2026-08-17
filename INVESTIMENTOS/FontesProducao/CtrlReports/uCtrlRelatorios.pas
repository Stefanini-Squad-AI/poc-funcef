//******************************************************************************
// Data     : 22/11/2006
// Código   : AL_2
// Pendencia: 23787
// SOL      : 43633
// Desc     : Implementação do Relatório
//******************************************************************************
// Data     : 24/05/2006
// Código   : AL_1
// Pendencia: 22375
// SOL      : 43236
// Desc     : Implementação do Relatório de Cancelamento de Anúncios
//*****************************************************************************

unit uCtrlRelatorios;

interface

uses Sysutils, uCMCtrlReports, RHistCustodia, RSaldosCustodia,
     //AL_1
     RAnunciosCanc,
     //AL_2
     RConsTransPlanosRF,RConsTransCCeCCI;

type
  TCtrlRelatorios = Class(TCmCtrlReports)

  private

  protected
    function PrintReport: Boolean; override;
  public
    function ReportExists: Boolean; override;
    function ConfigReport(LiIdReports, LiOrigemCm: integer; DesReport: Tobject): Boolean;   override;
end;

implementation

{ TCtrlRelatorios }

function TCtrlRelatorios.ConfigReport(LiIdReports, LiOrigemCm: integer; DesReport: Tobject): Boolean;
var sMensagem: String;
begin
   Result := False;
   case Idreport of

        20180: Result := TRelHistCustodia.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
        20181: Result := TRelSaldosCustodia.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
        //AL_1
        20194: Result := TRelAnunciosCanc.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
        //AL_2
        20205: Result := TRelConsTransCCeCCI.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
        20209: Result := TRelConsTransPlanosRF.ConfigReport(LiIdReports, LiOrigemCm, sMensagem, DesReport);
   else
      MessageInfo := 'Relatório não implementado'
   end;
   if not Result then
      MessageInfo := sMensagem;
end;

function TCtrlRelatorios.PrintReport: Boolean;
var sMensagem: String;
begin
   Result := False;
   case Idreport of
        20180: Result := TRelHistCustodia.PrintReport(IdReport, 1,
                                                      IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                      DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                                      DbAdoConnection, DbConnectionType, Devicetype,
                                                      ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                      ExibeFormParams, lstHtmlFOrmParam,
                                                      GeraHtmlFormParam, IdHotel);
        20181: Result := TRelSaldosCustodia.PrintReport(IdReport, 1,
                                                        IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                        DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                                        DbAdoConnection, DbConnectionType, Devicetype,
                                                        ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                        ExibeFormParams, lstHtmlFOrmParam,
                                                        GeraHtmlFormParam, IdHotel);
        //AL_1
        20194: Result := TRelAnunciosCanc.PrintReport(IdReport, 1,
                                                      IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                      DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                                      DbAdoConnection, DbConnectionType, Devicetype,
                                                      ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                      ExibeFormParams, lstHtmlFOrmParam,
                                                      GeraHtmlFormParam, IdHotel);

        //AL_2
        20205: Result := TRelConsTransCCeCCI.PrintReport(IdReport, 1,
                                                         IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                         DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                                         DbAdoConnection, DbConnectionType, Devicetype,
                                                         ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                         ExibeFormParams, lstHtmlFOrmParam,
                                                         GeraHtmlFormParam, IdHotel);

        20209: Result := TRelConsTransPlanosRF.PrintReport(IdReport, 1,
                                                           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                                                           DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                                                           DbAdoConnection, DbConnectionType, Devicetype,
                                                           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                                                           ExibeFormParams, lstHtmlFOrmParam,
                                                           GeraHtmlFormParam, IdHotel);

   else
      MessageInfo := 'Relatório não implementado';
   end;

   if not Result then
      MessageInfo := sMensagem;
end;

function TCtrlRelatorios.ReportExists: Boolean;
begin
   case IdReport of
        //AL_1
        //AL_2
        20180, 20181, 20194, 20205, 20209: Result := True;
   else
      Result := False;
   end;
end;

end.
