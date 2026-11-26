{==============================================================================|
| UNIT                       : uCmCtrlRptFolha.pas
|
| DESCRIÇÃO FUNCIONAL        : Controlar relatórios seguindo o padrão WEB.
|
===============================================================================|
| DESENVOLVEDOR              : David Ayrolla dos Santos
|
| PERÍODO DE IMPLEMENTAÇÃO   : de 11/01/2001 a 17/01/2001
|
| VERSÃO PARA LIBERAÇÃO      : 3.02.11c
|
| CLIENTE                    : REFER
|
| DESCRIÇÃO DA IMPLEMENTAÇÃO : Criação da unit.
|
|==============================================================================}

unit uCmCtrlRptFolha;

                            
interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports;

Type

   TCmCtrlRptFolha = Class(TCmCtrlReports)
   private

   protected
    function PrintReport: Boolean; Override;

   public
    function ReportExists: Boolean; Override;
   End;

implementation

Uses
     REstorno, dRel2ViaCChequeMT, rParametrosRubBenef;
     

{ TCmRptManager }


function TCmCtrlRptFolha.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   {
    De acordo com a propriedade IdReport fazemos a chama a classe do relatório herdado do form CMReport.
    O método de classe PrintReport e seus parâmetros são identicos para todas as chamadas.
   }
   Result := False;

   Case Idreport Of
    3281 : //Relatório de Estorno
       Result := TRptEstorno.PrintReport( IdReport, 1, IdEmpresa, IdUsuario,
       IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
       sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
       ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams,
       lstHtmlFOrmParam, GeraHtmlFormParam );

    2263 : //Relatório Demonstrativo de 2 via de Contra-cheque
       Result := TDtmRel2ViaCChequeMT.PrintReport( IdReport, 1, IdEmpresa, IdUsuario,
       IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
       sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
       ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams,
       lstHtmlFOrmParam, GeraHtmlFormParam );

    20128 : //Relatório de Parametrização das Rubricas de Benefício
       Result := TRptParametrosRubBenef.PrintReport( IdReport, 1, IdEmpresa, IdUsuario,
       IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
       sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
       ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams,
       lstHtmlFOrmParam, GeraHtmlFormParam );
   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;


function TCmCtrlRptFolha.ReportExists: Boolean;
begin
  {
   Retorna a validação dos relatório já implementados
  }
  case IdReport of
     3281 : Result := True;
     2263 : Result := True;
     20128 : result:=true;//Relatório de Parametrização das Rubricas de Benefício
  else
    Result := False;
  end;

end;

end.

