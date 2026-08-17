{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCmCtrlRptAss: Objeto de controle de relatórios  }
{   herdados do FCmReport                               }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 05/01/2001                             }
{                                                       }
{*******************************************************}

unit uCmCtrlRptAss;

                            
interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports;

Type

   TCmCtrlRptAss = Class(TCmCtrlReports)
   private

   protected
    function PrintReport: Boolean; Override;

   public
    function ReportExists: Boolean; Override;
   End;

implementation

Uses
     REstorno;


{ TCmRptManager }


function TCmCtrlRptAss.PrintReport: Boolean;
Var
  sMensagem :String;
begin
   {
    De acordo com a propriedade IdReport fazemos a chama a classe do relatório herdado do form CMReport.
    O método de classe PrintReport e seus parâmetros são identicos para todas as chamadas.
   }
   Result := False;

   Case Idreport Of
    3281 : //COLOCAR O ID DO RELATORIO DA TABELA REPORTS CONFORME O SAD
       Result := TRptSegurados.PrintReport( IdReport, 1, IdEmpresa, IdUsuario,
       IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo,
       sMensagem, DbAdoConnection, DbConnectionType, Devicetype,
       ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, {se exibe form de parametros}
       lstHtmlFOrmParam, GeraHtmlFormParam );
   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;


function TCmCtrlRptAss.ReportExists: Boolean;
begin
  {
   Retorna a validação dos relatório já implementados
  }
  Result := (IdReport = 3281);
end;

end.

