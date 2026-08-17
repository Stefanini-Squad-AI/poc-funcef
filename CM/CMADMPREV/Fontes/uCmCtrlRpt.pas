unit uCmCtrlRpt;

// Alterações:
{---------------------------------------------------------------------------------------------------
Autor(a)    :
Data        :
Rotina      :
Pendencia   :
Alteração   :
----------------------------------------------------------------------------------------------------
Autor(a)    : Claudio Faria
Data        : 27/11/2007
Rotina      : PrintReport(...)
Pendencia   : 26825
Alteração   : Acerto na abertura da tela de parametrização do relatório
---------------------------------------------------------------------------------------------------}

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports, dRelTempoServicoMT;


Type

   TCmCtrlRpt = Class(TCmCtrlReports)
   private

   protected
    function PrintReport: Boolean; Override;

   public
    function ReportExists: Boolean; Override;
   End;

implementation


{ TCmRptManager }

function TCmCtrlRpt.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   {
    De acordo com a propriedade IdReport fazemos a chama a classe do relatório herdado do form CMReport.
    O método de classe PrintReport e seus parâmetros são identicos para todas as chamadas.
   }
   Result := False;

   Case Idreport Of
     // Relatorio de tempo de servico
     20322 : Result := TdtmRelTempoServicoMT.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
              IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
              ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams,
              lstHtmlFOrmParam, GeraHtmlFormParam );

   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;

function TCmCtrlRpt.ReportExists: Boolean;
begin
  {
   Retorna a validação dos relatório já implementados 
  }
  case IdReport of
     // Relatorio de tempo de servico
     20322 : Result := true;
  else
    Result := False;
  end;
end;



end.
