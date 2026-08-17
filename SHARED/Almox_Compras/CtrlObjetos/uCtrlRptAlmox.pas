unit uCtrlRptAlmox;

interface

Uses Classes, SysUtils, uCmControlObject, Forms, FCmReport, uCmRptManager,
     uMensErro, cmParamReport, uSistema, uCmCtrlReports, uCMTypes, DbClient;

Type
  TCtrlRptAlmox = Class(TCmCtrlReports)
  private

  protected
    function PrintReport: Boolean; Override;
  public
    function ReportExists: Boolean; Override;
    function ConfigReport( LiIdReports, LiOrigemCm: integer;
             DesReport: Tobject ): Boolean; override;
  End;

implementation

uses rCustosContabeis, rExtMov, rExtMovUC, rRecon,
     rReconSaldo, rRequisicao, rPlanInvent, rPlanInventGrupo, rDifInvent,
     rInventFF, rInventFFData, rInventFFHoje, rCurvaABC, rCurvaABCCompras,
     rCurvaABCCustoMed, rValidade, rDevolucao, rSolPrePronta, rSolCompra,
     rSugestCompra, rArtxConta, rCadSolPrePronta, rArtSemMov, rResFinanCC,
     rCustoAnalit, rResFinAnual, rPlanProd, rConsMed, rSalEstMin,
     rNFxCustAgreg, rCustContabSint, rConAlmoxContab, rTotFinanc, rTermoInvent,
     rLivroInvent, rRecMercDesemb, rReqLancSint, rEtqProduto, rUltMovArt,
     rAjustFinanc, rReqCad, rGiroProd, rNotaDifOC,
      rExtMovSint, rRecebimento, rRecMercSint, rNotasxBaixaDir ;

function TCtrlRptAlmox.ReportExists: Boolean;
begin
  Case IdReport of
         26,{ 1133, }1137,{  1139, 1142, 1143, 1167, 1178, 1227, 1347, 1356, 1416,
       1418, }1431,{ 1433, 1453, 1454, 1475, 1511, 1537, 1565, 1604,} 1621,{1654,
       1677, 1679, 1681,} 1699{, 1706, 1714, 1721, 1725, 1800, 1803, 1897, 2125,
       2156, 2200, 2660, 2887, 2998, 3000, 3142, 3152, 3239, 3269, 3290 },3826:
          Result := True
       Else
          Result := False;
  End;
end;

function TCtrlRptAlmox.ConfigReport(LiIdReports, LiOrigemCm: integer;
         DesReport: Tobject): Boolean;
var
  sMensagem: String;
begin
  Result := False;

  Case Idreport Of
         26: Result := TRptRecebimento.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1133: Result := TRptRequisicao.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1137: Result := TRptRecebimento.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1139: Result := TRptPlanInventGrupo.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1142: Result := TRptValidade.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1143: Result := TRptCurvaABC.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1178: Result := TRptPlanInvent.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1167: Result := TRptDifInvent.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1227: Result := TRptSolPrePronta.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1347: Result := TRptSugestCompra.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1356: Result := TRptExtMov.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1416: Result := TRptResFinanCC.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1418: Result := TRptInventFF.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1431: Result := TRptCustosContabeis.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1433: Result := TRptArtxConta.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1453: Result := TRptDevolucao.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1454: Result := TRptCustoAnalit.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1475: Result := TRptRecon.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1511: Result := TRptInventFFData.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1537: Result := TRptReconSaldo.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1565: Result := TRptCadSolPrePronta.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1604: Result := TRptSolCompra.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1621: Result := TRptExtMovSint.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1654: Result := TRptArtSemMov.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1677: Result := TRptPlanProd.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1679: Result := TRptRecMercSint.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1681: Result := TRptConsMed.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1699: Result := TRptCustContabSint.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1706: Result := TRptInventFFHoje.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1714: Result := TRptNFxCustAgreg.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1721: Result := TRptExtMovUC.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1725: Result := TRptConAlmoxContab.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1800: Result := TRptResFinAnual.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1803: Result := TRptSalEstMin.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       1897: Result := TRptReqCad.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       2125: Result := TRptTotFinanc.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       2156: Result := TRptTermoInvent.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       2200: Result := TRptCurvaABCCompras.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       2660: Result := TRptLivroInvent.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       2887: Result := TRptGiroProd.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       2998: Result := TRptRecMercDesemb.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3000: Result := TRptReqLancSint.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3142: Result := TRptEtqProduto.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3152: Result := TRptUltMovArt.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3239: Result := TRptAjustFinanc.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3269: Result := TRptCurvaABCCustoMed.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3290: Result := TRptNotaDifOC.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );
       3826: Result := TRptNotasxBaixaDir.ConfigReport( LiIdReports, LiOrigemCm, sMensagem, DesReport );

       Else MessageInfo := 'Relatório não implementado'
  End;

  If Not Result Then
     MessageInfo := sMensagem;
end;

function TCtrlRptAlmox.PrintReport: Boolean;
Var
  sMensagem: String;
begin
  Case IdReport Of
       // Recebimento de Mercadoria
         26: Result := TRptRecebimento.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Requisições Lançadas
       1133: Result := TRptRequisicao.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Recebimento de Mercadoria
       1137: Result := TRptRecebimento.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Planilha de Inventário por Grupo
       1139: Result := TRptPlanInventGrupo.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Validade de Produtos
       1142: Result := TRptValidade.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Curva ABC de Produtos
       1143: Result := TRptCurvaABC.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Planilha de Inventário
       1178: Result := TRptPlanInvent.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Planilha de Inventário
       1167: Result := TRptDifInvent.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Solicitação Pre-Pronta
       1227: Result := TRptSolPrePronta.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Extrato de Movimentacao
       1347: Result := TRptSugestCompra.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Extrato de Movimentacao
       1356: Result := TRptExtMov.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Custo por Centro de Custo
       1416: Result := TRptResFinanCC.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Inventário Fisico e Financeiro
       1418: Result := TRptInventFF.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Custos Contabeis
       1431: Result := TRptCustosContabeis.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Artigos x Contas Contabeis
       1433: Result := TRptArtxConta.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Devolução de Mercadoria
       1453: Result := TRptDevolucao.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Custo por Centro de Custo Analítico
       1454: Result := TRptCustoAnalit.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Reconciliação de Estoque
       1475: Result := TRptRecon.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Inventario Fisico e Financeiro por Data
       1511: Result := TRptInventFFData.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Reconciliação de Estoque por Saldo
       1537: Result := TRptReconSaldo.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Cadastro de SOlicitação Pre-Pronta
       1565: Result := TRptCadSolPrePronta.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Solicitação de Compra
       1604: Result := TRptSolCompra.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Extrato de Movimentacao Sintetico
       1621: Result := TRptExtMovSint.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Artigos sem movimentação
       1654: Result := TRptArtSemMov.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Planilha de Produtos
       1677: Result := TRptPlanProd.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Recebimento de Mercadoria Sintético
       1679: Result := TRptRecMercSint.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Consumo Médio
       1681: Result := TRptConsMed.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Custos Contábeis Sintético
       1699: Result := TRptCustContabSint.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Inventario Fisico
       1706: Result := TRptInventFFHoje.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Notas X Custos Agregados
       1714: Result := TRptNFxCustAgreg.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Extrato de Movimentacao por Unidade de Custeio
       1721: Result := TRptExtMovUC.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Conciliação entre Almoxarifado e Contabilidade
       1725: Result := TRptConAlmoxContab.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Custo por Centro de Custo Anual
       1800: Result := TRptResFinAnual.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Produtos com Saldo acima do estoque maximo
       1803: Result := TRptSalEstMin.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Requisições Cadastradas
       1897: Result := TRptReqCad.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Totais financeiros
       2125: Result := TRptTotFinanc.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // termo de Inventário
       2156: Result := TRptTermoInvent.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Curva ABC das Compras
       2200: Result := TRptCurvaABCCompras.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Livro de Registro de Inventário
       2660: Result := TRptLivroInvent.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Giro de Produtos
       2887: Result := TRptGiroProd.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Recebimento de Mercadoria por Tipo de Desembolso
       2998: Result := TRptRecMercDesemb.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Requisições Lançadas Sintético
       3000: Result := TRptReqLancSint.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Etiquetas de Produtos
       3142: Result := TRptEtqProduto.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Ultima Movimentação dos Produtos
       3152: Result := TRptUltMovArt.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Ajuste Financeiro
       3239: Result := TRptAjustFinanc.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Curva ABC de Alteração de Custo Médio
       3269: Result := TRptCurvaABCCustoMed.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Notas Fiscais diferentes das OC's
       3290: Result := TRptNotaDifOC.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );

       // Notas x Baixas Diretas
       3826: Result := TRptNotasxBaixaDir.PrintReport( IdReport, 1, IdEmpresa,
                           IdUsuario, IdModulo, Params, FileName, DataBaseName,
                           NomeEmpresa, NomeModulo, sMensagem, DbAdoConnection,
                           DbConnectionType, Devicetype, ShowCancelDialog,
                           ShowPrintDialog, ExibeMensagem, ExibeFormParams,
                           lstHtmlFOrmParam, GeraHtmlFormParam, IdHotel );
       Else Begin
          MessageInfo := 'Relatório não implementado';
          Result := False;
       End;
  End;

  If Not Result Then
     MessageInfo := sMensagem;
end;

end.

