{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCtrlRptContab: Objeto de controle de relatórios    }
{   herdados do FCmReport                               }
{                                                       }
{ Analista Responsável: Sergio Fernandes                }
{ Atualizado Em: 27/09/2004                             }
{                                                       }
{*******************************************************}

unit uCtrlRptCAF;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
     cmParamReport, uSistema, uCmCtrlReports;

Type

   TCtrlRptCAF = Class(TCmCtrlReports)

   private

   protected
      function PrintReport: Boolean; Override;

   public
      function ReportExists: Boolean; Override;
      function ConfigReport(liIdreports, liOrigemCm : Integer;
                            DesReport:TObject) : Boolean; Override;
   end;

implementation

uses
   rCAFBalPatGrpA, rCAFMovPatGrpA, rCAFSldCtbCCustoA, rCAFSldCtbCCustoS,
   rCAFInvBensNaoEncont, rCAFConsCAFContab2, rCAFMovPatGrpAxMov,
   rCAFCadBemCustom, rCAFAcrescValorBem, rCAFBalPatBemBx;

{ TCmRptManager }

function TCtrlRptCaf.ReportExists: Boolean;
begin
   case IdReport of
        4029 : Result := True;
        4030 : Result := True;
        4037 : Result := True;
        4038 : Result := True;
        4096 : Result := True;
        4102 : Result := True;
       {4104 : Result := True;}
        4115 : Result := True;
        3034 : Result := True;
        4204 : Result := True;
        4205 : Result := True;
   else
      Result := False;
   end;
end;

function TCtrlRptCaf.ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): Boolean;
var
   sMensagem : String;

begin
   Result := False;

   case IdReport of
      4029 : Result := TRptCAFBalPatGrpA.ConfigReport(liIdReports, liOrigemCM,
                                                      sMensagem, DesReport);
      4030 : Result := TRptCAFMovPatGrpA.ConfigReport(liIdReports, liOrigemCM,
                                                      sMensagem, DesReport);
      4037 : Result := TRptCAFSldCtbCCustoA.ConfigReport(liIdReports, liOrigemCM,
                                                         sMensagem, DesReport);
      4038 : Result := TRptCAFSldCtbCCustoS.ConfigReport(liIdReports, liOrigemCM,
                                                         sMensagem, DesReport);
      4096 : Result := TRptCAFInvBensNaoEncont.ConfigReport(liIdReports, liOrigemCM,
                                                            sMensagem, DesReport);
      4102 : Result := TRptCAFConsCAFContab2.ConfigReport(liIdReports, liOrigemCM,
                                                          sMensagem, DesReport);
     {4104 : Result := TRptCAFConsDeprec.ConfigReport(liIdReports, liOrigemCM,
                                                      sMensagem, DesReport);}
      4115 : Result := TRptCAFMovPatGrpAxMov.ConfigReport(liIdReports, liOrigemCM,
                                                          sMensagem, DesReport);
      3034 : Result := TRptCAFCadBemCustom.ConfigReport(liIdReports, liOrigemCM,
                                                        sMensagem, DesReport);
      4204 : Result := TRptCAFAcrescValorBem.ConfigReport(liIdReports, liOrigemCM,
                                                          sMensagem, DesReport);
      4205 : Result := TRptCAFBalPatBemBx.ConfigReport(liIdReports, liOrigemCM,
                                                       sMensagem, DesReport);
   else MessageInfo := 'Relatório não implementado'

   end;

   if not Result then
      MessageInfo := sMensagem;
end;

function TCtrlRptCaf.PrintReport: Boolean;
var
   sMensagem :String;
begin
   Result := False;

   case Idreport of
      4029 : // Balancete Patrimonial por Grupo Analítico
             Result := TRptCAFBalPatGrpA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                     Params, FileName, DataBaseName, NomeEmpresa,
                                                     NomeModulo, sMensagem, DbAdoConnection,
                                                     DbConnectionType, Devicetype, ShowCancelDialog,
                                                     ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                     lstHtmlFormParam, GeraHtmlFormParam);
      4030 : // Movimento Patrimonial por Grupo Analítico
             Result := TRptCAFMovPatGrpA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                     Params, FileName, DataBaseName, NomeEmpresa,
                                                     NomeModulo, sMensagem, DbAdoConnection,
                                                     DbConnectionType, Devicetype, ShowCancelDialog,
                                                     ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                     lstHtmlFormParam, GeraHtmlFormParam);
      4037 : // Saldo Contábil Por Centro de Custo - Analítico
             Result := TRptCAFSldCtbCCustoA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                        Params, FileName, DataBaseName, NomeEmpresa,
                                                        NomeModulo, sMensagem, DbAdoConnection,
                                                        DbConnectionType, Devicetype, ShowCancelDialog,
                                                        ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                        lstHtmlFormParam, GeraHtmlFormParam);
      4038 : // Saldo Contábil Por Centro de Custo - Analítico
             Result := TRptCAFSldCtbCCustoS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                        Params, FileName, DataBaseName, NomeEmpresa,
                                                        NomeModulo, sMensagem, DbAdoConnection,
                                                        DbConnectionType, Devicetype, ShowCancelDialog,
                                                        ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                        lstHtmlFormParam, GeraHtmlFormParam);
      4096 : // Relação de Bens não Encontrados
             Result := TRptCAFInvBensNaoEncont.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                           Params, FileName, DataBaseName, NomeEmpresa,
                                                           NomeModulo, sMensagem, DbAdoConnection,
                                                           DbConnectionType, Devicetype, ShowCancelDialog,
                                                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                           lstHtmlFormParam, GeraHtmlFormParam);
      4102 : // Conciliação entre Ativo Fixo e Contabilidade II
             Result := TRptCAFConsCAFContab2.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
     {4104 : // Consistencia da Depreciação Acumulada
             Result := TRptCAFConsDeprec.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                     Params, FileName, DataBaseName, NomeEmpresa,
                                                     NomeModulo, sMensagem, DbAdoConnection,
                                                     DbConnectionType, Devicetype, ShowCancelDialog,
                                                     ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                     lstHtmlFormParam, GeraHtmlFormParam);}
      4115 : // Movimento Patrimonial por Grupo x Movimento
             Result := TRptCAFMovPatGrpAxMov.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
      3034 : // Seleção de Bens Customizável
             Result := TRptCAFCadBemCustom.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                       Params, FileName, DataBaseName, NomeEmpresa,
                                                       NomeModulo, sMensagem, DbAdoConnection,
                                                       DbConnectionType, Devicetype, ShowCancelDialog,
                                                       ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                       lstHtmlFormParam, GeraHtmlFormParam);
      4204 : // Acréscimos de Valor por Bem
             Result := TRptCAFAcrescValorBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                        Params, FileName, DataBaseName, NomeEmpresa,
                                                        NomeModulo, sMensagem, DbAdoConnection,
                                                        DbConnectionType, Devicetype, ShowCancelDialog,
                                                        ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                        lstHtmlFormParam, GeraHtmlFormParam);
      4205 : // Acréscimos de Valor por Bem
             Result := TRptCAFBalPatBemBx.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                      Params, FileName, DataBaseName, NomeEmpresa,
                                                      NomeModulo, sMensagem, DbAdoConnection,
                                                      DbConnectionType, Devicetype, ShowCancelDialog,
                                                      ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                      lstHtmlFormParam, GeraHtmlFormParam);
   else
      MessageInfo := 'Relatório não implementado'
   end;

   if not Result then
      MessageInfo := sMensagem;
end;

end.

