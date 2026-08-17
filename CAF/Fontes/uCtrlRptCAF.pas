{*******************************************************}
{                                                       }
{ CM Soluções Informática - Padrões de Desenvolvimento  }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - TCtrlRptCAF: Objeto de controle de relatórios       }
{                herdados do FCmReport                  }
{                                                       }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado em: 17/01/2006                             }
{                                                       }
{*******************************************************}

unit uCtrlRptCAF;

interface

Uses ivDictio,  Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro,
     cmParamReport, uSistema, uCmCtrlReports, Controls  ;

Type

   TCtrlRptCAF = Class(TCmCtrlReports)

   private

   protected
      function PrintReport: Boolean; Override;

   public
      function ReportExists: Boolean; Override;
      function ConfigReport(liIdreports, liOrigemCm : Integer; DesReport : TObject) : Boolean; Override;
   end;

implementation

Uses rCAFCadBem, rCAFCadClasse, rCAFCadConjxRatCC, rCAFCadConjxBens, rCAFCadGrupo,
     rCAFCadLocal, rCAFCadTipoArea, rCAFCadTipoMov, rCAFCadParamContab, rCAFInvPat,
     rCAFInvResLev, rCAFInvGuiaTransfBem, rCAFAutSaidaBens, rCAFConcCafContab,
     rCAFObras, rCAFParamContab, rCAFTermoResp, rCAFMovPatBem, rCAFSelBxBens,
     rCAFBalPatBem, rCAFBalPatGrp, rCAFBalPatCC, rCAFBalPatClas, rCAFBalPatGrpA,
     rCAFSldCtbCCustoA, rCAFSldCtbCCustoS, rCAFMovPatGrpA, rCAFBalPatGrpBx,
     rCAFMovPatGrp, rCAFBalPatGrpxClas, rCAFMovAnaPer, rCAFMovAnaPer2,
     rCAFTransfPatGrp, rCAFTransfPatGrpA, rCAFCadBemCustom, rCAFInvBensNaoEncont,
     rCAFSldCtbGrupoA, rCAFMovPatGrpAxMov, rCAFConsCAFContab2, rCAFLancObras,
     rCAFConsDeprec, rCAFResumoSaldosGrp, rCAFFichaAnalitica, rCAFRelAquisPer,
     rCAFRazaoPatAux, rCAFAcrescValorBem, rCAFBalPatBemBx, rCAFProjSldCtbBem,
     rCAFProjSldCtbGrpAnual, rCAFReavalBem, rCAFBensPenhorados;

{ TCtrlRptCaf }

function TCtrlRptCaf.ReportExists: Boolean;
begin
   case IdReport of
        1476 : Result := True;
        2302 : Result := True;
        2303 : Result := True;
        2590 : Result := True;
        2298 : Result := True;
        2299 : Result := True;
        2300 : Result := True;
        2306 : Result := True;
        2280 : Result := True;
           6 : Result := True;
           7 : Result := True;
           3 : Result := True;
           4 : Result := True;
        4029 : Result := True;
        3323 : Result := True;
        3646 : Result := True;
        4037 : Result := True;
        4038 : Result := True;
         104 : Result := True;
        2813 : Result := True;
        2810 : Result := True;
        2814 : Result := True;
         114 : Result := True;
         450 : Result := True;
        3104 : Result := True;
        2317 : Result := True;
        4030 : Result := True;
        2230 : Result := True;
        3252 : Result := True;
           9 : Result := True;
         106 : Result := True;
        2270 : Result := True;
        3443 : Result := True;
        3461 : Result := True;
        3034 : Result := True;
        4096 : Result := True;
        4120 : Result := True;
        4115 : Result := True;
        4102 : Result := True;
        4127 : Result := True;
        4191 : Result := True;
        4193 : Result := True;
        4195 : Result := True;
        4197 : Result := True;
        4199 : Result := True;
        4204 : Result := True;
        4205 : Result := True;
        4209 : Result := True;
        4241 : Result := True;
        4485 : Result := True;
       20337 : Result := True;
   else
      Result := False;
   end;
end;

function TCtrlRptCaf.ConfigReport(liIdreports, liOrigemCm : Integer; DesReport : TObject): Boolean;
var
   sMensagem :string;
begin
   Result := False;

   case IdReport of
        1476 : Result := TRptCAFCadBem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2302 : Result := TRptCAFCadClasse.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2303 : Result := TRptCAFCadConjxRatCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2590 : Result := TRptCAFCadConjxBens.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2298 : Result := TRptCAFCadGrupo.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2299 : Result := TRptCAFCadLocal.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2300 : Result := TRptCAFCadTipoArea.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2306 : Result := TRptCAFCadTipoMov.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2280 : Result := TRptCAFCadParamContab.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
           6 : Result := TRptCAFBalPatBem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
           7 : Result := TRptCAFBalPatCC.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
           3 : Result := TRptCAFBalPatClas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
           4 : Result := TRptCAFBalPatGrp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        4029 : Result := TRptCAFBalPatGrpA.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3323 : Result := TRptCAFBalPatGrpBx.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3646 : Result := TRptCAFBalPatGrpxClas.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        4037 : Result := TRptCAFSldCtbCCustoA.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        4038 : Result := TRptCAFSldCtbCCustoS.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
         104 : Result := TRptCAFInvPat.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2813 : Result := TRptCAFInvResLev.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2810 : Result := TRptCAFInvGuiaTransfBem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2814 : Result := TRptCAFAutSaidaBens.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
         114 : Result := TRptCAFConcCafContab.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
         450 : Result := TRptCAFMovAnaPer.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3104 : Result := TRptCAFMovAnaPer2.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2317 : Result := TRptCAFMovPatBem.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        4030 : Result := TRptCAFMovPatGrpA.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2230 : Result := TRptCAFMovPatGrp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3252 : Result := TRptCAFObras.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
           9 : Result := TRptCAFParamContab.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
         106 : Result := TRptCAFSelBxBens.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        2270 : Result := TRptCAFTermoResp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3443 : Result := TRptCAFTransfPatGrp.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3461 : Result := TRptCAFTransfPatGrpA.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        3034 : Result := TRptCAFCadBemCustom.ConfigReport(liIdreports,liOrigemCm,sMensagem,DesReport);
        4096 : Result := TRptCAFInvBensNaoEncont.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4120 : Result := TRptCAFSldCtbGrupoA.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4115 : Result := TRptCAFMovPatGrpAxMov.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4102 : Result := TRptCAFConsCAFContab2.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4127 : Result := TRptCAFLancObras.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4191 : Result := TRptCAFConsDeprec.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4193 : Result := TRptCAFResumoSaldosGrp.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4195 : Result := TRptCAFFichaAnalitica.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4197 : Result := TRptCAFRelAquisPer.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4199 : Result := TRptCAFRazaoPatAux.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4204 : Result := TRptCAFAcrescValorBem.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4205 : Result := TRptCAFBalPatBemBx.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4209 : Result := TRptCAFProjSldCtbBem.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4241 : Result := TRptCAFProjSldCtbGrpAnual.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
        4485 : Result := TRptCAFReavalBem.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
       20337 : Result := TRptCAFBensPenhorados.ConfigReport(liIdReports, liOrigemCM, sMensagem, DesReport);
   else MessageInfo := 'Relatório em Desenvolvimento'

   end;

   if not Result then
      MessageInfo := sMensagem;
end;

function TCtrlRptCaf.PrintReport: Boolean;
var
   sMensagem :String;
begin
   Result := False;
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
   try
      //----------------------------------------------------------------------------------
      case Idreport of
           1476 : Result := TRptCAFCadBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                      Params, FileName, DataBaseName, NomeEmpresa,
                                                      NomeModulo, sMensagem, DbAdoConnection,
                                                      DbConnectionType, Devicetype, ShowCancelDialog,
                                                      ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                      lstHtmlFormParam, GeraHtmlFormParam);
           2302 : Result := TRptCAFCadClasse.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           2303 : Result := TRptCAFCadConjxRatCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                             Params, FileName, DataBaseName, NomeEmpresa,
                                                             NomeModulo, sMensagem, DbAdoConnection,
                                                             DbConnectionType, Devicetype, ShowCancelDialog,
                                                             ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                             lstHtmlFormParam, GeraHtmlFormParam);
           2590 : Result := TRptCAFCadConjxBens.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                            Params, FileName, DataBaseName, NomeEmpresa,
                                                            NomeModulo, sMensagem, DbAdoConnection,
                                                            DbConnectionType, Devicetype, ShowCancelDialog,
                                                            ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                            lstHtmlFormParam, GeraHtmlFormParam);
           2298 : Result := TRptCAFCadGrupo.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                        Params, FileName, DataBaseName, NomeEmpresa,
                                                        NomeModulo, sMensagem, DbAdoConnection,
                                                        DbConnectionType, Devicetype, ShowCancelDialog,
                                                        ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                        lstHtmlFormParam, GeraHtmlFormParam);
           2299 : Result := TRptCAFCadLocal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                        Params, FileName, DataBaseName, NomeEmpresa,
                                                        NomeModulo, sMensagem, DbAdoConnection,
                                                        DbConnectionType, Devicetype, ShowCancelDialog,
                                                        ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                        lstHtmlFormParam, GeraHtmlFormParam);
           2300 : Result := TRptCAFCadTipoArea.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                           Params, FileName, DataBaseName, NomeEmpresa,
                                                           NomeModulo, sMensagem, DbAdoConnection,
                                                           DbConnectionType, Devicetype, ShowCancelDialog,
                                                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                           lstHtmlFormParam, GeraHtmlFormParam);
           2306 : Result := TRptCAFCadTipoMov.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           2280 : Result := TRptCAFCadParamContab.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                              Params, FileName, DataBaseName, NomeEmpresa,
                                                              NomeModulo, sMensagem, DbAdoConnection,
                                                              DbConnectionType, Devicetype, ShowCancelDialog,
                                                              ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                              lstHtmlFormParam, GeraHtmlFormParam);
              6 : Result := TRptCAFBalPatBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
              7 : Result := TRptCAFBalPatCC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                        Params, FileName, DataBaseName, NomeEmpresa,
                                                        NomeModulo, sMensagem, DbAdoConnection,
                                                        DbConnectionType, Devicetype, ShowCancelDialog,
                                                        ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                        lstHtmlFormParam, GeraHtmlFormParam);
              3 : Result := TRptCAFBalPatClas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
              4 : Result := TRptCAFBalPatGrp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           4029 : Result := TRptCAFBalPatGrpA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           3323 : Result := TRptCAFBalPatGrpBx.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           3646 : Result := TRptCAFBalPatGrpxClas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                              Params, FileName, DataBaseName, NomeEmpresa,
                                                              NomeModulo, sMensagem, DbAdoConnection,
                                                              DbConnectionType, Devicetype, ShowCancelDialog,
                                                              ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                              lstHtmlFormParam, GeraHtmlFormParam);
           4037 : Result := TRptCAFSldCtbCCustoA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                             Params, FileName, DataBaseName, NomeEmpresa,
                                                             NomeModulo, sMensagem, DbAdoConnection,
                                                             DbConnectionType, Devicetype, ShowCancelDialog,
                                                             ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                             lstHtmlFormParam, GeraHtmlFormParam);
           4038 : Result := TRptCAFSldCtbCCustoS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                             Params, FileName, DataBaseName, NomeEmpresa,
                                                             NomeModulo, sMensagem, DbAdoConnection,
                                                             DbConnectionType, Devicetype, ShowCancelDialog,
                                                             ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                             lstHtmlFormParam, GeraHtmlFormParam);
            104 : Result := TRptCAFInvPat.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                      Params, FileName, DataBaseName, NomeEmpresa,
                                                      NomeModulo, sMensagem, DbAdoConnection,
                                                      DbConnectionType, Devicetype, ShowCancelDialog,
                                                      ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                      lstHtmlFormParam, GeraHtmlFormParam);
           2813 : Result := TRptCAFInvResLev.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           2810 : Result := TRptCAFInvGuiaTransfBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                                Params, FileName, DataBaseName, NomeEmpresa,
                                                                NomeModulo, sMensagem, DbAdoConnection,
                                                                DbConnectionType, Devicetype, ShowCancelDialog,
                                                                ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                                lstHtmlFormParam, GeraHtmlFormParam);
           2814 : Result := TRptCAFAutSaidaBens.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                            Params, FileName, DataBaseName, NomeEmpresa,
                                                            NomeModulo, sMensagem, DbAdoConnection,
                                                            DbConnectionType, Devicetype, ShowCancelDialog,
                                                            ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                            lstHtmlFormParam, GeraHtmlFormParam);
            114 : Result := TRptCAFConcCafContab.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                             Params, FileName, DataBaseName, NomeEmpresa,
                                                             NomeModulo, sMensagem, DbAdoConnection,
                                                             DbConnectionType, Devicetype, ShowCancelDialog,
                                                             ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                             lstHtmlFormParam, GeraHtmlFormParam);
            450 : Result := TRptCAFMovAnaPer.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           3104 : Result := TRptCAFMovAnaPer2.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           2317 : Result := TRptCAFMovPatBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           4030 : Result := TRptCAFMovPatGrpA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           2230 : Result := TRptCAFMovPatGrp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           3252 : Result := TRptCAFObras.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                     Params, FileName, DataBaseName, NomeEmpresa,
                                                     NomeModulo, sMensagem, DbAdoConnection,
                                                     DbConnectionType, Devicetype, ShowCancelDialog,
                                                     ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                     lstHtmlFormParam, GeraHtmlFormParam);
              9 : Result := TRptCAFParamContab.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                           Params, FileName, DataBaseName, NomeEmpresa,
                                                           NomeModulo, sMensagem, DbAdoConnection,
                                                           DbConnectionType, Devicetype, ShowCancelDialog,
                                                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                           lstHtmlFormParam, GeraHtmlFormParam);
            106 : Result := TRptCAFSelBxBens.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           2270 : Result := TRptCAFTermoResp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           3443 : Result := TRptCAFTransfPatGrp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                            Params, FileName, DataBaseName, NomeEmpresa,
                                                            NomeModulo, sMensagem, DbAdoConnection,
                                                            DbConnectionType, Devicetype, ShowCancelDialog,
                                                            ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                            lstHtmlFormParam, GeraHtmlFormParam);
           3461 : Result := TRptCAFTransfPatGrpA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                             Params, FileName, DataBaseName, NomeEmpresa,
                                                             NomeModulo, sMensagem, DbAdoConnection,
                                                             DbConnectionType, Devicetype, ShowCancelDialog,
                                                             ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                             lstHtmlFormParam, GeraHtmlFormParam);
           3034 : Result := TRptCAFCadBemCustom.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                            Params, FileName, DataBaseName, NomeEmpresa,
                                                            NomeModulo, sMensagem, DbAdoConnection,
                                                            DbConnectionType, Devicetype, ShowCancelDialog,
                                                            ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                            lstHtmlFormParam, GeraHtmlFormParam);
           4096 : Result := TRptCAFInvBensNaoEncont.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                                Params, FileName, DataBaseName, NomeEmpresa,
                                                                NomeModulo, sMensagem, DbAdoConnection,
                                                                DbConnectionType, Devicetype, ShowCancelDialog,
                                                                ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                                lstHtmlFormParam, GeraHtmlFormParam);
           4120 : Result := TRptCAFSldCtbGrupoA.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                            Params, FileName, DataBaseName, NomeEmpresa,
                                                            NomeModulo, sMensagem, DbAdoConnection,
                                                            DbConnectionType, Devicetype, ShowCancelDialog,
                                                            ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                            lstHtmlFormParam, GeraHtmlFormParam);
           4115 : Result := TRptCAFMovPatGrpAxMov.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                              Params, FileName, DataBaseName, NomeEmpresa,
                                                              NomeModulo, sMensagem, DbAdoConnection,
                                                              DbConnectionType, Devicetype, ShowCancelDialog,
                                                              ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                              lstHtmlFormParam, GeraHtmlFormParam);
           4102 : Result := TRptCAFConsCAFContab2.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                              Params, FileName, DataBaseName, NomeEmpresa,
                                                              NomeModulo, sMensagem, DbAdoConnection,
                                                              DbConnectionType, Devicetype, ShowCancelDialog,
                                                              ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                              lstHtmlFormParam, GeraHtmlFormParam);
           4127 : Result := TRptCAFLancObras.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
           4191 : Result := TRptCAFConsDeprec.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                          Params, FileName, DataBaseName, NomeEmpresa,
                                                          NomeModulo, sMensagem, DbAdoConnection,
                                                          DbConnectionType, Devicetype, ShowCancelDialog,
                                                          ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                          lstHtmlFormParam, GeraHtmlFormParam);
           4193 : Result := TRptCAFResumoSaldosGrp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                               Params, FileName, DataBaseName, NomeEmpresa,
                                                               NomeModulo, sMensagem, DbAdoConnection,
                                                               DbConnectionType, Devicetype, ShowCancelDialog,
                                                               ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                               lstHtmlFormParam, GeraHtmlFormParam);
           4195 : Result := TRptCAFFichaAnalitica.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                              Params, FileName, DataBaseName, NomeEmpresa,
                                                              NomeModulo, sMensagem, DbAdoConnection,
                                                              DbConnectionType, Devicetype, ShowCancelDialog,
                                                              ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                              lstHtmlFormParam, GeraHtmlFormParam);
           4197 : Result := TRptCAFRelAquisPer.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                           Params, FileName, DataBaseName, NomeEmpresa,
                                                           NomeModulo, sMensagem, DbAdoConnection,
                                                           DbConnectionType, Devicetype, ShowCancelDialog,
                                                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                           lstHtmlFormParam, GeraHtmlFormParam);
           4199 : Result := TRptCAFRazaoPatAux.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                           Params, FileName, DataBaseName, NomeEmpresa,
                                                           NomeModulo, sMensagem, DbAdoConnection,
                                                           DbConnectionType, Devicetype, ShowCancelDialog,
                                                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                           lstHtmlFormParam, GeraHtmlFormParam);
           4204 : Result := TRptCAFAcrescValorBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                              Params, FileName, DataBaseName, NomeEmpresa,
                                                              NomeModulo, sMensagem, DbAdoConnection,
                                                              DbConnectionType, Devicetype, ShowCancelDialog,
                                                              ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                              lstHtmlFormParam, GeraHtmlFormParam);
           4205 : Result := TRptCAFBalPatBemBx.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                           Params, FileName, DataBaseName, NomeEmpresa,
                                                           NomeModulo, sMensagem, DbAdoConnection,
                                                           DbConnectionType, Devicetype, ShowCancelDialog,
                                                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                           lstHtmlFormParam, GeraHtmlFormParam);
           4209 : Result := TRptCAFProjSldCtbBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                             Params, FileName, DataBaseName, NomeEmpresa,
                                                             NomeModulo, sMensagem, DbAdoConnection,
                                                             DbConnectionType, Devicetype, ShowCancelDialog,
                                                             ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                             lstHtmlFormParam, GeraHtmlFormParam);
           4241 : Result := TRptCAFProjSldCtbGrpAnual.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                                  Params, FileName, DataBaseName, NomeEmpresa,
                                                                  NomeModulo, sMensagem, DbAdoConnection,
                                                                  DbConnectionType, Devicetype, ShowCancelDialog,
                                                                  ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                                  lstHtmlFormParam, GeraHtmlFormParam);
           4485 : Result := TRptCAFReavalBem.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
          20337 : Result := TRptCAFBensPenhorados.PrintReport(IdReport, 1, IdEmpresa, IdUsuario, IdModulo,
                                                         Params, FileName, DataBaseName, NomeEmpresa,
                                                         NomeModulo, sMensagem, DbAdoConnection,
                                                         DbConnectionType, Devicetype, ShowCancelDialog,
                                                         ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                                                         lstHtmlFormParam, GeraHtmlFormParam);
      else
         MessageInfo := 'Relatório em Desenvolvimento'
      end;

      if not Result then
         MessageInfo := sMensagem;
   finally
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   end;
end;

end.

