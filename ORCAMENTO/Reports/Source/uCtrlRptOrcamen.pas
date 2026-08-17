{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 14/11/2011
// Nº SOL........: 166067
// Nº KINTANA....: 1448049
// Rotina........: Tudo
// Descrição.....: Adicionado os relatórios:
   6021 - Valores por Grupo X Centro de Custo
   6022 - Valores por Grupo X Centro de Responsabilidade
   6023 - Valores por Grupo X Atividade de Projeto
--------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
// Alterações:
// Autor.........: Ricardo de Freitas Araújo
// Data..........: 24/08/2011
// Nº SOL........: 160740
// Nº KINTANA....: 1358934
// Rotina........: Tudo
// Descrição.....: Adicionado o relatório 3251 - Orçado x Realizado por Grupo x Atividade Projeto
--------------------------------------------------------------------------------------------------}

Unit uCtrlRptOrcamen;

Interface

Uses
  Classes,   SysUtils,      uCmControlObject, Forms,          FCmReport, uCmRptManager,
  uMensErro, cmParamReport, uSistema,         uCmCtrlReports,
  rListaResCompPorGrupoMT, RListaAlterPorGrupoMT, RSuplemDeduPorGrupoMT,
  rDivergOrcxReal, RContaContabGrupo;

Type
  TCtrlRptOrcamen = Class( TCmCtrlReports )

  Protected
    Function PrintReport: Boolean; Override;
  Private

  Public

    function ReportExists: Boolean; Override;
    Function ConfigReport( liIdReports, liOrigemCM : Integer; DesReport : TObject ) : Boolean; Override;

  end;

implementation

Uses rListaContas, rSaldos, rGraComparativo, rListaReserva, rListaCompromisso,
     rListaTransf, rListaSuplemen, rOrcxRealConta, rCompContas,
     rListaRetorno, rSaldosSint, rTotCenResp, rGraCenResp, rGraGrupo,
     rAtivGestor, rAtivGestor2, rCompoOrcamen, rRelatGrupo,
     rRelatGrupoCResp, rRelatGrupoCCust, rDemoLayout, rRelatGrupoAnual, rRelatRateioPlanoTrabalho,
     rRelatPlanoTrabalho, rReserva, rCompromisso, rTransf, rSuplemen, rRetorno,
     rOrcxRealGrupoConta, RDemonsRealxContabxFluxo,rRelatGrupoAtividadeProjeto;

Function TCtrlRptOrcamen.ConfigReport( liIdReports, liOrigemCM : Integer;
                                       DesReport : TObject ) : Boolean;
Var
  sMensagem : String;
Begin
  Result := False;
  Case Idreport Of
    1327 : Result := TrptGraComparativo.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1331 : Result := TrptListaReserva.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1332 : Result := TrptListaCompromisso.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1333 : Result := TrptListaTransf.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1334 : Result := TrptListaSuplemen.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1341 : Result := TrptSaldosSint.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1342 : Result := TrptTotCenResp.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1344 : Result := TrptGraCenResp.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1345 : Result := TrptGraGrupo.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1374 : Result := TrptListaContas.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1375 : Result := TrptSaldos.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    1518 : Result := TrptListaRetorno.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    2000 : Result := TrptRelatGrupo.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);


    //Ricardo SOL: 166067 Nº KINTANA: 1448049
    //Valores por Grupo
    2020 : Result := TrptRelatGrupoAnual.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    //Valores por Grupo X Centro de Custo
    6021 : Result := TrptRelatGrupoAnual.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    //Valores por Grupo X Centro de Responsabilidade
    6022 : Result := TrptRelatGrupoAnual.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    //Valores por Grupo X Atividade de projeto
    6023 : Result := TrptRelatGrupoAnual.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    //Ricardo SOL: 166067 Nº KINTANA: 1448049 - fim




    2113 : Result := TrptDemoLayout.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    2449 : Result := TrptAtivGestor.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    2494 : Result := TrptAtivGestor2.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    2658 : Result := TrptCompoOrcamen.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    2799 : Result := TrptCompContas.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3015 : Result := TrptOrcxRealConta.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3154 : Result := TrptCompromisso.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3155 : Result := TrptReserva.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3247 : Result := TrptRelatGrupoCResp.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3250 : Result := TrptRelatGrupoCCust.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    //Ricardo SOL: 159242/6041 Nº KINTANA: 1385831
    3251 : Result := TrptRelatGrupoAtividadeProj.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    3637 : Result := TrptRelatRateioPlanoTrabalho.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3729 : Result := TrptRelatPlanoTrabalho.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3384 : Result := TrptTransf.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3386 : Result := TrptSuplemen.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    3388 : Result := TrptRetorno.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    20203 : Result := TRptDemonsRealxContabxFluxo.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    20184,20185 : Result := TRptListaResCompPorGrupoMT.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);
    20186       : Result := TRptListaAlterPorGrupoMT.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    20204 : Result :=  TRptDivergOrcxReal.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    20190       : Result := TRptSuplemDeduPorGrupoMT.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    20191      : Result := TrptOrcxRealGrupoConta.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

    20333      : Result := TRptContaContabGrupo.ConfigReport(liIdReports, liOrigemCM,sMensagem,DesReport);

  Else
    sMensagem := 'Relatório não implementado'
  End;

  If Not Result Then
    MessageInfo := sMensagem;
End;
//************************************************
Function TCtrlRptOrcamen.PrintReport: Boolean;
var  sMensagem :String;
begin
   Result := False;
   Case Idreport Of
      1327 : Result := TrptGraComparativo.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1331 : Result := TrptListaReserva.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1332 : Result := TrptListaCompromisso.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1333 : Result := TrptListaTransf.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1334 : Result := TrptListaSuplemen.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1341 : Result := TrptSaldosSint.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1342 : Result := TrptTotCenResp.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1344 : Result := TrptGraCenResp.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1345 : Result := TrptGraGrupo.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1374 : Result := TrptListaContas.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1375 : Result := TrptSaldos.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      1518 : Result := TrptListaRetorno.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      2000 : Result := TrptRelatGrupo.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);


      2020 : Result := TrptRelatGrupoAnual.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);

      //Ricardo SOL: 166067 Nº KINTANA: 1448049
      6021,6022,6023:
             Result := TrptRelatGrupoAnual.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);

      //Ricardo SOL: 166067 Nº KINTANA: 1448049 - fim

      2113 : Result := TrptDemoLayout.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      2449 : Result := TrptAtivGestor.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      2494 : Result := TrptAtivGestor2.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      2658 : Result := TrptCompoOrcamen.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      2799 : Result := TrptCompContas.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3015 : Result := TrptOrcxRealConta.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3154 : Result := TrptCompromisso.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3155 : Result := TrptReserva.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3247 : Result := TrptRelatGrupoCResp.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3250 : Result := TrptRelatGrupoCCust.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
                          
      //Ricardo SOL: 159242/6041 Nº KINTANA: 1385831
      3251 : Result := TrptRelatGrupoAtividadeProj.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      //Ricardo SOL: 159242/6041 Nº KINTANA: 1385831 - fim


      3384 : Result := TrptTransf.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3386 : Result := TrptSuplemen.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3388 : Result := TrptRetorno.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3637 : Result := TrptRelatRateioPlanoTrabalho.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      3729 : Result := TrptRelatPlanoTrabalho.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      20203 : Result := TRptDemonsRealxContabxFluxo.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);

      20204 : Result :=  TRptDivergOrcxReal.PrintReport(IdReport, 1,
                         IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                         DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                         DbAdoConnection, DbConnectionType, Devicetype,
                         ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                         ExibeFormParams, lstHtmlFOrmParam,
                         GeraHtmlFormParam, IdHotel);

      20184, 20185 : Result := TRptListaResCompPorGrupoMT.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      20186 : Result := TRptListaAlterPorGrupoMT.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      20190 : Result := TRptSuplemDeduPorGrupoMT.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
      20191: Result := TrptOrcxRealGrupoConta.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);

      20333: Result    := TRptContaContabGrupo.PrintReport(IdReport, 1,
                          IdEmpresa, IdUsuario, IdModulo, Params, FileName,
                          DataBaseName ,NomeEmpresa, NomeModulo, sMensagem,
                          DbAdoConnection, DbConnectionType, Devicetype,
                          ShowCancelDialog, ShowPrintDialog, ExibeMensagem,
                          ExibeFormParams, lstHtmlFOrmParam,
                          GeraHtmlFormParam, IdHotel);
   Else
      MessageInfo := 'Relatório não implementado'
   End;

   If Not Result Then
      MessageInfo := sMensagem;
end;

function TCtrlRptOrcamen.ReportExists : Boolean;
begin
   Case IdReport of
      1327, 1331, 1332, 1333, 1334, 1341,
      1342, 1344, 1345, 1374, 1375, 1518,
      2000, 2020, 2113, 2449, 2494, 2658,
      2799, 3015, 3247, 3154, 3155, 3250,
      3251,//Ricardo SOL: 159242/6041 Nº KINTANA: 1385831
      3384, 3386, 3388, 3637, 3729, 20184,
      20186,20190, 20191,

      //Ricardo SOL: 166067 Nº KINTANA: 1448049
      6021,6022,6023,
      //Ricardo SOL: 166067 Nº KINTANA: 1448049 - fim

      20185, 20203, 20204,20333 : Result := True;
   Else
      Result := False;
   End;
end;

end.
