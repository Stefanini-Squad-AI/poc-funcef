{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Padrões de Desenvolvimento }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCtrlRptContab: Objeto de controle de relatórios    }
{   herdados do FCmReport                               }
{                                                       }
{ Analista Responsável: Sergio Fernandes                }
{ Atualizado Em: 09/03/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlRptCaf;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
     cmParamReport, uSistema, uCmCtrlReports;

Type

   TCtrlRptCaf = Class(TCmCtrlReports)
   private

   protected
      function PrintReport: Boolean; Override;
   public
      function ReportExists: Boolean; Override;
      function ConfigReport(liIdreports, liOrigemCm:Integer;DesReport:TObject):Boolean;Override;
   End;

implementation

Uses

     //Controle do Ativo Fixo
     rCAFBalPatBem, rCAFBalPatGrp,  rCAFBalPatGrpBx,  rCAFBalClasse, rCAFInvPat,
     rCAFBalCC,     rCAFCadBem,     rCAFCadConjxBens, rCAFCadConjxRatCC;

{ TCmRptManager }


function TCtrlRptCaf.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
 sMensagem :string;
begin
   result := False;

   Case IdReport Of
      3    :Result := TRptCAFBalClasse.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      4    :Result := TRptCAFBalPatGrp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      6    :Result := TRptCAFBalPatBem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      7    :Result := TRptCAFBalCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      3323 :Result := TrptCAFBalPatGrpBx.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      1476 :Result := TRptCAFCadBem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2590 :Result := TRptCAFCadConjxBens.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      2303 :Result := TRptCAFCadConjxRatCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
      104  :Result := TRptCAFInPat.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);

   End;

   if not Result then
      MessageInfo := sMensagem;
end;

function TCtrlRptCaf.PrintReport: Boolean;
Var
  sMensagem :String;
begin
{*******************************************************************************
Caf
*******************************************************************************}

   Result := False;
   Case Idreport Of
      3 : // Balancete Patrimonial por Classe
          Result := TRptCAFBalClasse.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      4 : // Balancete Patrimonial por Grupo
          Result := TRptCAFBalPatGrp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      6 : // Balancete Patrimonial por Bem
          Result := TRptCAFBalPatBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      7 : // Balancete Patrimonial por Centro de Custo
          Result := TRptCAFBalCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                   FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      3323: // Balancete Patrimonial por Grupo  - Bens Baixados
          Result := TrptCAFBalPatGrpBx.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      1476: // Cadastro de Bens patrimoniais
          Result := TRptCAFCadBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      2590: // Cadastro de Conjunto de Bens
          Result := TRptCAFCadConjxBens.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      2303: // Cadastro de Conjunto - Rateio de Custos
          Result := TRptCAFCadConjxRatCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);

      104: // Relação de Bens para Inventarios patrimoniais
          Result := TRptCAFInPat.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo, Params,
                    FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem, DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog, ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam , GeraHtmlFormParam);
   Else
      MessageInfo := 'Relalatório não implementado'
   End;

   If Not Result Then  MessageInfo := sMensagem;
end;

function TCtrlRptCaf.ReportExists: Boolean;
begin
   Case IdReport of
       3, 4,6, 7, 3323, 1476,2590,2303,104    : Result := True;
   Else
     Result := False;
   End;
End;

End.
