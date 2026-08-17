unit uCmCtrlRptModFol;

//*******************************************************************************
//Rotina...........: ConfigReport, PrintReport, ReportExists
//Nº WO ...........: WO11539
//Data da Alteração: 14/06/2013
//Responsável......: Helen V Bianchi
//Descrição........: Relatório Email pessoal, corporativo e demais dados
//***************************************************************************************
//Rotina...........: ConfigReport, PrintReport, ReportExists
//Nº SIG...........: 20695
//Data da Alteração: 14/06/2013
//Responsável......: William Santana
//Descrição........: relatório de Ficha de anotações e atualizações da CTPS - modelo2
//***************************************************************************************
//Rotina...........: ConfigReport, PrintReport, ReportExists
//Nº SOL...........: 193131-13143
//Nº KINTANA.......: 1886157
//Data da Alteração: 20/06/2014
//Responsável......: Edilaine Ferraresi
//Descrição........: Inclusão de novo relatório.
//***************************************************************************************
//Rotina...........: ConfigReport, PrintReport, ReportExists
//Nº SOL...........: 186698
//Nº KINTANA.......: 1764805
//Data da Alteração: 09/10/2012
//Responsável......: Thiago Melo
//Descrição........: Inclusão de dois novos Relatórios (Termo de Rescisão de Contrato de
//                   Trabalho
//***************************************************************************************
//Rotina...........: ConfigReport, PrintReport, ReportExists
//Nº SOL...........: 127031
//Nº KINTANA.......: 670099
//Data da Alteração: 10/03/2010
//Responsável......: Bruno Bastos
//Descrição........: Inclusão de novo relatório.
//***************************************************************************************
//Rotina:
//Nº SOL:            127621
//Nº KINTANA         678085
//Data da Alteração: 26/02/2010
//Responsável:       Ricardo A.
//Descrição:         Criação do Relatório "Relação de Dependentes Analítico"
//**************************************************************************************


interface

uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager, uMensErro, uSistema,
  cmParamReport, uCmCtrlReports;

type
  TCmCtrlRptModFol = class(TCmCtrlReports)
  protected
    function PrintReport: boolean; override;
  public
    function ConfigReport(liIdreports, liOrigemCm: Integer; DesReport: TObject): boolean; override;
    function ReportExists: boolean; override;
  end;

implementation

uses RCartaComunicado, RCadDependente, RDeclDependente, RDCT, RFichaSalFam, RRubIntegrContab,
  REtiquetas, RCadPessoal, RAvisoFerias, RFeriasProgram, RFichaFinanc, RFolhaEmprRub,
  RFolhaFreq, RFolhaFreq2, RFolhaFreqEscala, RFolhaNormal, RGPS, RGRCS, RGRFC, RLancRubIndiv,
  RReciboAvisoFerias, RAlfabMensal, RAcompEscalaFerias, REscalaFerias, RSalarioEduc,
  RReciboPagamento, RRelRecContribSind, RPrevisaoFerias, RProvisaoFerias, RProvisao13,
  RResFol, RResFolComp, RRelTransporte, RRelTransporteLinha, RVariavelMensal, RCracha,
  RCompSaldo, RReciboTerceiros, RBBancario, RRelSalContribINSS, RGerencial, RAlterFuncional,
  RFichaFunc, RCadRubSal, RDemPagEspecial, RRelatAfast, RCadFormaCalc, RCadDependenteAnal,
  RRubSalariaisDadosPrinc,    //Bruno Bastos - Sol: 127031 - Kintana: 670099
  RTRCT,
  RAdvertenciaSuspensao, // Edilaine - SOL 193131-13143 / KTN 1886157
  RAACTPS, //William Santana - SIG 20695
  // Thiago Melo
  RTRCT_Homologacao,
  RTRCT_Quitacao,
  // Thiago Melo
  REmail  ;//Helen - WO11539

function TCmCtrlRptModFol.ConfigReport(liIdreports, liOrigemCm: Integer;
  DesReport: TObject): Boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3600 : Result := TRptCartaComunicado.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3380 : Result := TRptCadDependente.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3390 : Result := TRptDeclDependente.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3162 : Result := TRptDCT.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3458 : Result := TRptFichaSalFam.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3284 : Result := TRptRubIntegrContab.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    578 : Result := TRptEtiquetas.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    574 : Result := TRptCadPessoal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    446 : Result := TRptAvisoFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    448 : Result := TRptFeriasProgram.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2254 : Result := TRptFichaFinanc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    376 : Result := TRptFolhaEmprRub.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    312 : Result := TRptFolhaFreq.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    313 : Result := TRptFolhaFreq2.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2858 : Result := TRptFolhaFreqEscala.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1779 : Result := TRptFolhaNormal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1871 : Result := TRptGPS.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    302 : Result := TRptGRCS.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1155 : Result := TRptGRFC.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    404 : Result := TRptLancRubIndiv.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    272 : Result := TRptReciboAvisoFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2684 : Result := TRptAlfabMensal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    334 : Result := TRptAcompEscalaFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    333 : Result := TRptEscalaFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    315 : Result := TRptSalarioEduc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    274 : Result := TRptTRCT.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1585 : Result := TRptReciboPagamento.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3037 : Result := TRptRelRecContribSind.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    304 : Result := TRptPrevisaoFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2161 : Result := TRptProvisaoFerias.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2386 : Result := TRptProvisao13.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1776 : Result := TRptResFol.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    416 : Result := TRptResFolComp.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1447 : Result := TRptRelTransporte.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2236 : Result := TRptRelTransporteLinha.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3840 : Result := TRptVariavelMensal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3198 : Result := TRptCracha.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2246 : Result := TRptCompSaldo.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2154 : Result := TRptReciboTerceiros.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    1281 : Result := TRptBBancario.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3036 : Result := TRptRelSalContribINSS.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    2439 : Result := TRptGerencial.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    3843 : Result := TRptAlterFuncional.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    567 : Result := TRptFichaFunc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    565 : Result := TRptCadRubSal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4013 : Result := TRptDemPagEspecial.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4059 : Result := TRptRelatAfast.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    4131 : Result := TRptCadFormaCalc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);

    // Ricardo A. SOL 127621 KTN 678085
    5000 : Result := TRptCadDependenteAnal.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    // FIM Ricardo A. SOL 127621 KTN 678085

    //Bruno Bastos - Sol: 127031 - Kintana: 670099 - Início
    5001 : Result := TRptRubSalariaisDadosPrinc.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    //Bruno Bastos - Sol: 127031 - Kintana: 670099 - Fim

    // Thiago Melo SOL 186698 Kintana 1764805

    20528 : Result := TRptTRCT_Quitacao.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    20529 : Result := TRptTRCT_Homologacao.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    // Thiago Melo SOL 186698 Kintana 1764805

    // Edilaine - SOL 193131-13143 / KTN 1886157
    20531 : Result := TRptAdverteSuspensao.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);
    // Edilaine - SOL 193131-13143 / KTN 1886157

    4231 : Result := TRptRAACTPS.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);  //William Santana - SIG 20695

    4642 : Result := TRptRAACTPS.ConfigReport(liIdreports,
      liOrigemCm, sMensagem, DesReport);  //Helen V Bianchi - WO11539
    else
      MessageInfo := 'Relatório não implementado';
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModFol.PrintReport: boolean;
var
  sMensagem: string;
begin
  Result := false;
  case (IdReport) of
    3380 : Result := TRptCadDependente.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3390 : Result := TRptDeclDependente.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3162 : Result := TRptDCT.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3458 : Result := TRptFichaSalFam.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3284 : Result := TRptRubIntegrContab.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    578 : Result := TRptEtiquetas.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    574 : Result := TRptCadPessoal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    446 : Result := TRptAvisoFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    448 : Result := TRptFeriasProgram.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2254 : Result := TRptFichaFinanc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    376 : Result := TRptFolhaEmprRub.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    312 : Result := TRptFolhaFreq.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    313 : Result := TRptFolhaFreq2.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2858 : Result := TRptFolhaFreqEscala.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1779 : Result := TRptFolhaNormal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1871 : Result := TRptGPS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    302 : Result := TRptGRCS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1155 : Result := TRptGRFC.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    404 : Result := TRptLancRubIndiv.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    272 : Result := TRptReciboAvisoFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2684 : Result := TRptAlfabMensal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    334 : Result := TRptAcompEscalaFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    333 : Result := TRptEscalaFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    315 : Result := TRptSalarioEduc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    274 : Result := TRptTRCT.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1585 : Result := TRptReciboPagamento.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3037 : Result := TRptRelRecContribSind.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    304 : Result := TRptPrevisaoFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2161 : Result := TRptProvisaoFerias.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2386 : Result := TRptProvisao13.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1776 : Result := TRptResFol.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    416 : Result := TRptResFolComp.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1447 : Result := TRptRelTransporte.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
        IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, DeviceType, ShowCancelDialog, ShowPrintDialog,
        ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2236 : Result := TRptRelTransporteLinha.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
        IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
        DbAdoConnection, DbConnectionType, DeviceType, ShowCancelDialog, ShowPrintDialog,
        ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3840 : Result := TRptVariavelMensal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3198 : Result := TRptCracha.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2246 : Result := TRptCompSaldo.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2154 : Result := TRptReciboTerceiros.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    1281 : Result := TRptBBancario.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3036 : Result := TRptRelSalContribINSS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    2439 : Result := TRptGerencial.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    3843 : Result := TRptAlterFuncional.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    567 : Result := TRptFichaFunc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    565 : Result := TRptCadRubSal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4013 : Result := TRptDemPagEspecial.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4059 : Result := TRptRelatAfast.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    4131 : Result := TRptCadFormaCalc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);

    // Ricardo A. SOL 127621 KTN 678085
    5000 : Result := TRptCadDependenteAnal.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName, NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    // FIM Ricardo A. SOL 127621 KTN 678085

    //Bruno Bastos - Sol: 127031 - Kintana: 670099 - Início
    5001 : Result := TRptRubSalariaisDadosPrinc.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
      IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
      DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
      ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    //Bruno Bastos - Sol: 127031 - Kintana: 670099 - Fim

    // Thiago Melo SOL 186698 Kintana 1764805

    20528 : Result := TRptTRCT_Quitacao.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
            IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
            DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
            ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);

    20529 : Result := TRptTRCT_Homologacao.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
            IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
            DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
            ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);

    // Edilaine - SOL 193131-13143 / KTN 1886157
    20531 : Result := TRptAdverteSuspensao.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
            IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
            DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
            ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    // Edilaine - SOL 193131-13143 / KTN 1886157

    //Início - William Santana - SIG 20695
    4231 :  Result := TRptRAACTPS.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
            IdModulo, Params, FileName, DataBaseName, NomeEmpresa, NomeModulo, sMensagem,
            DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
            ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
    //Término - William Santana - SIG 20695

    // Helen - WO11539
    4642 : Result := TRptEmail.PrintReport(IdReport, 1, IdEmpresa, IdUsuario,
            IdModulo, Params, FileName, DataBaseName  ,NomeEmpresa,NomeModulo, sMensagem,
            DbAdoConnection, DbConnectionType, Devicetype, ShowCancelDialog, ShowPrintDialog,
            ExibeMensagem, ExibeFormParams, lstHtmlFOrmParam, GeraHtmlFormParam);
   // Helen - WO11539
    
    else
      MessageInfo := 'Relatório não implementado';
  end;

  if not(Result) then
    MessageInfo := sMensagem;
end;

function TCmCtrlRptModFol.ReportExists: boolean;
begin
  case (IdReport) of
    3600,3380,3390,3162,3458,3284,578,
    574,446,448,2254,376,312,313,2858,
    1779,1871,302,1155,404,272,2684,
    333,334,315,274,1585,3037,304,2161,
    2386,1776,416,1447,2236,3840,3198,
    2246,2154,1281,3036,2439,3843,567,
    565,4013,4059,4131,

    // Ricardo A. SOL 127621 KTN 678085
    5000
    // FIM Ricardo A. SOL 127621 KTN 678085

    ,5001                 //Bruno Bastos - Sol: 127031 - Kintana: 670099

    // Thiago Melo SOL 186698 Kintana 1764805
    ,20528, 20529
    //
    , 20531   // Edilaine - SOL 193131-13143 / KTN 1886157
    , 4231 //William Santana - SIG 20695
    , 4642 // Helen V Bianchi - WO11539
    : Result := true
    else
      Result := false;
  end;
end;

end.
