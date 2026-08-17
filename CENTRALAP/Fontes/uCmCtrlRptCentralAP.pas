{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCmCtrlRptCentralAP: Objeto de controle de relatórios  }
{   herdados do FCmReport                               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 05/01/2001                             }
{                                                       }
{*******************************************************}

unit uCmCtrlRptCentralAP;


interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports, DRel2ViaCChequeMT,
     dRelTempoServicoMT;


Type

   TCmCtrlRptCentralAP = Class(TCmCtrlReports)
   private

   protected
    function PrintReport: Boolean; Override;

   public
    function ReportExists: Boolean; Override;
   End;

implementation


{ TCmRptManager }

function TCmCtrlRptCentralAP.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   {
    De acordo com a propriedade IdReport fazemos a chama a classe do relatório herdado do form CMReport.
    O método de classe PrintReport e seus parâmetros são identicos para todas as chamadas.
   }
   Result := False;

   Case Idreport Of
       // Id do Report de 2 via Contracheque no CentralAP
       3348 : Result := TDtmRel2ViaCChequeMT.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
              IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
              ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
              lstHtmlFOrmParam, GeraHtmlFormParam );

     // Relatorio de tempo de servico
     3346 : Result := TdtmRelTempoServicoMT.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
              IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
              sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
              ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams,
              lstHtmlFOrmParam, GeraHtmlFormParam );

   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;

function TCmCtrlRptCentralAP.ReportExists: Boolean;
begin
  {
   Retorna a validação dos relatório já implementados
  }
  case IdReport of
     // 2Via Contra-Cheque
     3348 : Result := True;
     // Relatorio de tempo de servico
     3346 : Result := true;
  else
    Result := False;
  end;
end;

end.

