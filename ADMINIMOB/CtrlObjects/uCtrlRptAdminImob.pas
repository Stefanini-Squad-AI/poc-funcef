{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 26239
Responsável : Daniel Simões
Data        : 29/08/2007
Descrição   : Implementação da função 'ConfigReport' ...
--------------------------------------------------------------------------------
Pendência   : 24880
Responsável : Daniel Simões
Data        : 30/07/2007
Descrição   : Implementação do relatório de Folha de Receitas por Empreendimento
              ( Sintética )
--------------------------------------------------------------------------------
Pendência   : 24879
Responsável : Daniel Simões
Data        : 12/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Receita por
              Vencimento.
--------------------------------------------------------------------------------
Pendência   : 24881
Responsável : Daniel Simões
Data        : 06/07/2007
Descrição   : Implementação do relatório de Resumo da Folha de Alugueis por
              Empreendimento ( Imóvel Mestre ) e Segmento ( Tipo de Imóvel ).
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRptAdminImob;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports;

Type

   TCtrlRptAdminImob = Class(TCmCtrlReports)
   protected
    function PrintReport: Boolean; Override;

    // Daniel - 26239
    function ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean; override;


   public
    function ReportExists: Boolean; Override;
   end;


implementation

uses dRelLancamento, dRelExtrato, dRelParamContab, dRelPrevImob, dRelPerdas, dRelSeguros,
     dRelMovFinan, dRelLancForaComp, dRelPerdasDiario, dRelHistoricoContratual,
     dRelEventos, dRelEvolInadimp, dRelFolhaRecEmpreendimento, dRelFolhaRecVencimento,
     dRelFolhaRecEmpreendimentoSintetico;


{ TCmCtrlRptAdminImob }

// Daniel - 26239 - Início -----------------------------------------------------
function TCtrlRptAdminImob.ConfigReport(liIdreports,liOrigemCm:Integer; DesReport:TObject): Boolean;
var sMensagem: String;
begin
  Result := False;

  case (IdReport) of
    3326 : Result := TdtmRelLancamento.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3334 : Result := TdtmRelExtrato.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    2222 : Result := TdtmRelParamContab.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3667 : Result := TdtmRelPrevImob.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3951 : Result := TdtmRelPerdas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    3961 : Result := TdtmRelSeguros.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20040: Result := TdtmRelMovFinan.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20106: Result := TdtmRelLancForaComp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20107: Result := TdtmRelPerdasDiario.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20118: Result := TdtmRelHistoricoContratual.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20133: Result := TdtmRelEventos.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20153: Result := TdtmRelEvolInadimp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20340: Result := TdtmRelFolhaRecEmpreendimento.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20341: Result := TdtmRelFolhaRecVencimento.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
    20342: Result := TdtmRelFolhaRecEmpreendimentoSintetico.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
  else
    MessageInfo := 'Relatório não implementado';
  end;

  if not Result then MessageInfo := sMensagem;
end;
// Daniel - 26239 - Fim --------------------------------------------------------

function TCtrlRptAdminImob.PrintReport: Boolean;
var sMensagem :String;
begin
   Result := False;
   case Idreport of
    3326 : Result := TdtmRelLancamento.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3334 : Result := TdtmRelExtrato.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    2222 : Result := TdtmRelParamContab.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3667 : Result := TdtmRelPrevImob.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3951 : Result := TdtmRelPerdas.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    3961 : Result := TdtmRelSeguros.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20040: Result := TdtmRelMovFinan.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20106: Result := TdtmRelLancForaComp.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20107: Result := TdtmRelPerdasDiario.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20118: Result := TdtmRelHistoricoContratual.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20133: Result := TdtmRelEventos.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20153: Result := TdtmRelEvolInadimp.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20340: Result := TdtmRelFolhaRecEmpreendimento.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20341: Result := TdtmRelFolhaRecVencimento.PrintReport(IdReport, 1,
           IdEmpresa, IdUsuario, IdModulo, Params, FileName,
           DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
           DbAdoConnection, DbConnectionType, Devicetype,
           ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
           ExibeFormParams, lstHtmlFOrmParam ,
           GeraHtmlFormParam);

    20342: Result := TdtmRelFolhaRecEmpreendimentoSintetico.PrintReport(IdReport, 1,
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


function TCtrlRptAdminImob.ReportExists: Boolean;
begin
  case IdReport of
    3326, 3334, 2222, 3667, 3951, 3961, 20040, 20106, 20107, 20118, 20133, 20153, 20340, 20341, 20342: Result := True
  else
    Result := False;
  end;
end;

end.
