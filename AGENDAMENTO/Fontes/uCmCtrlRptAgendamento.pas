unit uCmCtrlRptAgendamento;


interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports, dRptAgendamento;


Type

   TCmCtrlRptAgendamento = Class(TCmCtrlReports)
   private

   protected

     function PrintReport: Boolean; Override;

   public

     function ReportExists: Boolean; Override;

   End;

implementation


{ TCmRptManager }

function TCmCtrlRptAgendamento.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   { De acordo com a propriedade IdReport fazemos a chama a classe do relatório herdado do form CMReport.
    O método de classe PrintReport e seus parâmetros são identicos para todas as chamadas. }
   Result := False;

   Case Idreport Of
     //Agendamentos
     20173,
     20174,
     20175 : Result := TdtmRptAgendamento.PrintReport( IdReport, 1, IdEmpresa, IdUsuario,
              IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
              ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams,
              lstHtmlFOrmParam, GeraHtmlFormParam );
   Else
      MessageInfo := 'Relatório não implementado.'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;

function TCmCtrlRptAgendamento.ReportExists: Boolean;
begin
  { Retorna a validação dos relatório já implementados  }
  case IdReport of
     //Agendamentos por Atendente
     20173,
     20174,
     20175 : Result := True;
  else
    Result := False;
  end;
end;

end.

