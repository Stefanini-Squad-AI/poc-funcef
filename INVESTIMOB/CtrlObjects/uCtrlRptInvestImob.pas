{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26239
Responsável : Daniel Simões
Data        : 29/08/2007
Descrição   : Implementação da função 'ConfigReport' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRptInvestimob;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports, rCAFCadBemImob;

Type
   TCtrlRptInvestimob = Class(TCmCtrlReports)
   protected
     function PrintReport:  Boolean; Override;

    // Daniel - 26239
    function ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean; override;

   public
     function ReportExists: Boolean; Override;
   end;

implementation

uses dRelSaldoImovel, dRelReavalia, dRelObra, dRelInvestPPatroPart;

{ TCmCtrlRptInvestimob }

// Daniel - 26239 - Início -----------------------------------------------------
function TCtrlRptInvestimob.ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean;
var sMensagem: String;
begin
  Result := False;

  case (IdReport) of
    3598 : Result := TdtmRelSaldoImovel.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3967 : Result := TdtmRelReavalia.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20030: Result := TdtmRelObra.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20114: Result := TdtmRelInvestPPatroPart.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20179: Result := TRptCAFCadBemImob.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
  else
    MessageInfo := 'Relatório não implementado';
  end;

  if not Result then MessageInfo := sMensagem;
end;
// Daniel - 26239 - Fim --------------------------------------------------------

function TCtrlRptInvestimob.PrintReport: Boolean;
var sMensagem :String;
begin
   Result := False;
   case Idreport of
    3598 : Result := TdtmRelSaldoImovel.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3967 : Result := TdtmRelReavalia.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20030: Result := TdtmRelObra.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    // Marcio Motta - 30/06/2004 - 17089
    20114: Result := TdtmRelInvestPPatroPart.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    // Marcio Topíni - 21/12/2005 - 19167
    20179: Result := TRptCAFCadBemImob.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);


   else
      MessageInfo := 'Relatório não implementado'
   end;

   if not Result then  MessageInfo := sMensagem;
end;


function TCtrlRptInvestimob.ReportExists: Boolean;
begin
  case IdReport of
    3598, 3967, 20030, 20114, 20179 : Result := True
  else
    Result := False;
  end;
end;


end.
