//********************************************************************************************************
// Data      : 07/03/2006
// Código    : AL_24
// Motivo    : Melhoria de lay-out do relatório de Detalhamento de Boletas (RptDetBoleta)
//******************************************************************************
// Data      : 19/01/2006
// Pendência : 233367
// SOL       : 21140
// Código    : AL_23
// Motivo    : Acerto na paginação do relatório Demonstrativo de Rentabilidade Bruta e
//             Movimentação da TIR
//********************************************************************************************************
// Data     : 07/11/2005
// Código   : AL_2
// Motivo   : Melhoria do lay-out do relatório PpEnquadramento
//********************************************************************************************************
// Data     : 05/05/2004
// Código   : AL_1
// Motivo   : Implementação do BitMap e do alinhamento do Titulo do RptVarMesCarteira
//********************************************************************************************************
// Data     : 13/10/2004
// Função   : RptVarMesCarteira
// Motivo   : Acerto na impressão da variável RptVarMesCarteiralblDifMesAnt que foi
//            transferida para o Rodapé do Relatório
//            Acerto de Lay-out no RptVarMesCarteira e colocacao do zebrado no shpMapaVarMensalPrint
//********************************************************************************************************
// Data     : 05/05/2004
// Origem   : CM
// Função   : ppDetailBand3BeforePrint
// Motivo   : Acerto na gravação da variável ValorJuros
//********************************************************************************************************

unit FDmRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppClass, ppPrnabl, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, UBibliotecaInvest, UOperacaoInvest, ppRichTx, ppVar, ppRelatv,
  ppDBPipe, ppSubRpt,vcf1,ppModule, raCodMod, ExtCtrls, ppViewr, AxCtrls,
  OleCtrls;

type
  TDmRelatorios = class(TdtmReports)
    RelatCotacoesInvest: TppReport;
    RelatCotacoesInvestHeaderBand1: TppHeaderBand;
    RelatCotacoesInvestLabel2: TppLabel;
    RelatCotacoesInvestLabel3: TppLabel;
    RelatCotacoesInvestLabel4: TppLabel;
    RelatCotacoesInvestDetailBand1: TppDetailBand;
    RelatCotacoesInvestDBText3: TppDBText;
    EdVlrContabil: TppDBText;
    LbVarDia: TppLabel;
    RelatCotacoesInvestFooterBand1: TppFooterBand;
    RelatCotacoesInvestGroup1: TppGroup;
    RelatCotacoesInvestGroupHeaderBand1: TppGroupHeaderBand;
    RelatCotacoesInvestDBText2: TppDBText;
    RelatCotacoesInvestLine1: TppLine;
    RelatCotacoesInvestLine2: TppLine;
    RelatCotacoesInvestGroupFooterBand1: TppGroupFooterBand;
    RelatCotacoesInvestDBCalc1: TppDBCalc;
    RelatCotacoesInvestLine3: TppLine;
    DpRelatCotacoesInvest: TppBDEPipeline;
    DsRelatCotacoesInvest: TwwDataSource;
    RelatCotacoesInvestLine4: TppLine;
    RelatCotacoesInvestLabel5: TppLabel;
    DsRelatConsInvest: TwwDataSource;
    DpRelatConsInvest: TppBDEPipeline;
    RelatConsInvest: TppReport;
    RelatConsInvestLabel2: TppLabel;
    LbDataInicial: TppLabel;
    LbDataFinal: TppLabel;
    RelatConsInvestLabel5: TppLabel;
    RelatConsInvestLine1: TppLine;
    LblValInicial: TppLabel;
    LblValFinal: TppLabel;
    LblValVariacao: TppLabel;
    RelatConsInvestDBText1: TppDBText;
    RelatConsInvestLine2: TppLine;
    RelatConsInvestLabel6: TppLabel;
    dsListInv: TwwDataSource;
    RptListInv: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLine9: TppLine;
    RptListInvLabel1: TppLabel;
    RptListInvLabel2: TppLabel;
    RptListInvLabel3: TppLabel;
    RptListInvLabel4: TppLabel;
    RptListInvLabel5: TppLabel;
    RptListInvLabel6: TppLabel;
    RptListInvLabel7: TppLabel;
    RptListInvLabel8: TppLabel;
    RptListInvLabel9: TppLabel;
    RptListInvLine1: TppLine;
    RptListInvDBText9: TppDBText;
    ppDetailBand5: TppDetailBand;
    RptListInvDBText1: TppDBText;
    RptListInvDBText2: TppDBText;
    RptListInvDBText3: TppDBText;
    RptListInvDBText4: TppDBText;
    RptListInvDBText5: TppDBText;
    RptListInvDBText6: TppDBText;
    RptListInvDBText7: TppDBText;
    RptListInvDBText8: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine10: TppLine;
    ppLabel15: TppLabel;
    RptListInvSummaryBand1: TppSummaryBand;
    rptResFinanCCShape2: TppShape;
    LblTotLiquido: TppLabel;
    RptListInvDBText10: TppDBText;
    RptListInvDBText11: TppDBText;
    LblDespesas: TppLabel;
    dsDetBoleta: TwwDataSource;
    bdeDetBoleta: TppBDEPipeline;
    RptDetBoleta: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    RptListOSPenDBText6: TppDBText;
    RptDetBoletaLabel2: TppLabel;
    RptDetBoletaLabel3: TppLabel;
    RptDetBoletaDBText1: TppDBText;
    RptDetBoletaLabel4: TppLabel;
    RptDetBoletaDBText2: TppDBText;
    RptDetBoletaLabel5: TppLabel;
    RptDetBoletaDBText3: TppDBText;
    RptDetBoletaLabel6: TppLabel;
    RptDetBoletaDBText4: TppDBText;
    RptDetBoletaLabel7: TppLabel;
    RptDetBoletaDBText5: TppDBText;
    RptDetBoletaLabel8: TppLabel;
    RptDetBoletaDBText6: TppDBText;
    RptDetBoletaLabel9: TppLabel;
    RptDetBoletaDBText7: TppDBText;
    RptDetBoletaLabel10: TppLabel;
    RptDetBoletaDBText8: TppDBText;
    RptDetBoletaLabel11: TppLabel;
    RptDetBoletaDBText9: TppDBText;
    RptDetBoletaLabel12: TppLabel;
    RptDetBoletaDBText12: TppDBText;
    RptDetBoletaLabel15: TppLabel;
    RptDetBoletaLabel21: TppLabel;
    RptListInvLabel10: TppLabel;
    RptListInvDBText12: TppDBText;
    RptListInvDBText13: TppDBText;
    RptListInvLabel12: TppLabel;
    RptListInvDBText14: TppDBText;
    RptDetBoletaLine1: TppLine;
    RptDetBoletaLine3: TppLine;
    RptDetBoletaLabel22: TppLabel;
    dsDemCustoCarteira: TwwDataSource;
    bdeDemCustoCarteira: TppBDEPipeline;
    RptDemCustoCarteira: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLine3: TppLine;
    RptDemCustoCarteiraLine1: TppLine;
    RptDemCustoCarteiraLabel3: TppLabel;
    RptDemCustoCarteiraLine2: TppLine;
    RptDemCustoCarteiraLabel4: TppLabel;
    RptDemCustoCarteiraLabel5: TppLabel;
    RptDemCustoCarteiraLabel6: TppLabel;
    RptDemCustoCarteiraLabel7: TppLabel;
    RptDemCustoCarteiraLabel8: TppLabel;
    RptDemCustoCarteiraLabel9: TppLabel;
    RptDemCustoCarteiraLabel10: TppLabel;
    RptDemCustoCarteiraLabel11: TppLabel;
    ppDetailBand2: TppDetailBand;
    RptDemCustoCarteiraDBText2: TppDBText;
    RptDemCustoCarteiraDBText3: TppDBText;
    RptDemCustoCarteiraDBText4: TppDBText;
    RptDemCustoCarteiraDBText5: TppDBText;
    RptDemCustoCarteiraDBText7: TppDBText;
    RptDemCustoCarteiraDBText8: TppDBText;
    ppFooterBand2: TppFooterBand;
    RptDemCustoCarteiraLine3: TppLine;
    RptDemCustoCarteiraLabel12: TppLabel;
    RptDemCustoCarteiraGroup1: TppGroup;
    RptDemCustoCarteiraGroupHeaderBand1: TppGroupHeaderBand;
    RptDemCustoCarteiraLabel2: TppLabel;
    RptDemCustoCarteiraDBText1: TppDBText;
    RptDemCustoCarteiraLine4: TppLine;
    RptDemCustoCarteiraGroupFooterBand1: TppGroupFooterBand;
    dsGerCarteira: TwwDataSource;
    bdeGerCarteira: TppBDEPipeline;
    RptGerCarteira: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLine8: TppLine;
    ppDetailBand6: TppDetailBand;
    ppFooterBand6: TppFooterBand;
    ppLine11: TppLine;
    ppLabel14: TppLabel;
    RptGerCarteiraLine1: TppLine;
    RptGerCarteiraLabel3: TppLabel;
    RptGerCarteiraLabel5: TppLabel;
    LblCusto: TppLabel;
    RptGerCarteiraLabel6: TppLabel;
    RptGerCarteiraLabel7: TppLabel;
    RptGerCarteiraLabel8: TppLabel;
    RptGerCarteiraLabel9: TppLabel;
    RptGerCarteiraLabel10: TppLabel;
    RptGerCarteiraLabel11: TppLabel;
    RptGerCarteiraLabel12: TppLabel;
    RptGerCarteiraDBText1: TppDBText;
    RptGerCarteiraLabel13: TppLabel;
    RptGerCarteiraDBText2: TppDBText;
    RptGerCarteiraDBText3: TppDBText;
    RptGerCarteiraDBText4: TppDBText;
    LblSaldoCarr: TppDBText;
    RptGerCarteiraLabel16: TppLabel;
    RptGerCarteiraLabel17: TppLabel;
    RptGerCarteiraLabel18: TppLabel;
    RptGerCarteiraLabel19: TppLabel;
    dsGerCartSintetico: TwwDataSource;
    bdeGerCartSintetico: TppBDEPipeline;
    dsProvisaoIR: TwwDataSource;
    bdeProvisaoIR: TppBDEPipeline;
    RptProvisaoIR: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLine16: TppLine;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    ppLine17: TppLine;
    ppLabel24: TppLabel;
    RptProvisaoIRLabel2: TppLabel;
    RptProvisaoIRLabel4: TppLabel;
    RptProvisaoIRLine1: TppLine;
    RptProvisaoIRLabel5: TppLabel;
    RptProvisaoIRLabel6: TppLabel;
    RptProvisaoIRLabel7: TppLabel;
    RptProvisaoIRLabel8: TppLabel;
    RptProvisaoIRLabel9: TppLabel;
    RptProvisaoIRLabel10: TppLabel;
    RptProvisaoIRLabel11: TppLabel;
    RptProvisaoIRLabel12: TppLabel;
    RptProvisaoIRLabel13: TppLabel;
    RptProvisaoIRDBText1: TppDBText;
    RptProvisaoIRDBText3: TppDBText;
    RptProvisaoIRDBText4: TppDBText;
    RptProvisaoIRLabel15: TppLabel;
    RptProvisaoIRLabel19: TppLabel;
    RptProvisaoIRLabel20: TppLabel;
    RptProvisaoIRLabel21: TppLabel;
    RptProvisaoIRDBText5: TppDBText;
    RptProvisaoIRDBText6: TppDBText;
    RptDemCustoCarteiraLabel13: TppLabel;
    RptDemCustoCarteiraLabel14: TppLabel;
    dsCompGerLotes: TwwDataSource;
    bdeCompGerLotes: TppBDEPipeline;
    RptCompGerLotes: TppReport;
    ppHeaderBand10: TppHeaderBand;
    ppLine18: TppLine;
    ppDetailBand10: TppDetailBand;
    ppFooterBand10: TppFooterBand;
    ppLine19: TppLine;
    ppLabel27: TppLabel;
    RptCompGerLotesLine1: TppLine;
    RptCompGerLotesLabel3: TppLabel;
    RptCompGerLotesLabel4: TppLabel;
    RptCompGerLotesLabel5: TppLabel;
    RptCompGerLotesLabel6: TppLabel;
    RptCompGerLotesLabel7: TppLabel;
    RptCompGerLotesLabel8: TppLabel;
    RptCompGerLotesDBText1: TppDBText;
    RptCompGerLotesDBText2: TppDBText;
    RptCompGerLotesDBText3: TppDBText;
    RptCompGerLotesDBText4: TppDBText;
    RptCompGerLotesDBText5: TppDBText;
    RptCompGerLotesDBText6: TppDBText;
    RptCompGerLotesLabel9: TppLabel;
    RptCompGerLotesDBText7: TppDBText;
    RptCompGerLotesLine2: TppLine;
    DsEnquadramento: TwwDataSource;
    DpEnquadramento: TppBDEPipeline;
    PpEnquadramento: TppReport;
    ppHeaderBand11: TppHeaderBand;
    PpEnquadramentoShape1: TppShape;
    PpEnquadramentoLine1: TppLine;
    LbTitMes2: TppLabel;
    LbTitMes3: TppLabel;
    LbTitMes21: TppLabel;
    LbTitMes22: TppLabel;
    LbTitMes23: TppLabel;
    LbTitMes1: TppLabel;
    PpEnquadramentoLabel1: TppLabel;
    PpEnquadramentoLabel2: TppLabel;
    PpEnquadramentoLine5: TppLine;
    PpEnquadramentoLine8: TppLine;
    PpEnquadramentoLabel3: TppLabel;
    PpEnquadramentoLine11: TppLine;
    PpEnquadramentoLabel4: TppLabel;
    ppDetailBand11: TppDetailBand;
    PnlFundoDetalhe: TppShape;
    LbDescInvestimento: TppLabel;
    LbMes1: TppLabel;
    LbMes2: TppLabel;
    LbMes3: TppLabel;
    LbMes4: TppLabel;
    LbMes5: TppLabel;
    LbMes6: TppLabel;
    PpEnquadramentoLine3: TppLine;
    PpEnquadramentoLine6: TppLine;
    LbPerAplic: TppLabel;
    PpEnquadramentoLine9: TppLine;
    LbPerDiv: TppLabel;
    ppFooterBand11: TppFooterBand;
    ppLine20: TppLine;
    ppLabel30: TppLabel;
    PpEnquadramentoGroup1: TppGroup;
    PpEnquadramentoGroupHeaderBand1: TppGroupHeaderBand;
    PpEnquadramentoLine2: TppLine;
    PpEnquadramentoLine4: TppLine;
    PpEnquadramentoLine7: TppLine;
    PpEnquadramentoLine10: TppLine;
    PpEnquadramentoGroupFooterBand1: TppGroupFooterBand;
    RptGerCarteiraDBText5: TppDBText;
    RptProvisaoIRDBText2: TppDBText;
    updDemCustoCarteira: TUpdateSQL;
    updGerCarteira: TUpdateSQL;
    updProvisaoIR: TUpdateSQL;
    RelatCotacoesInvestLabel6: TppLabel;
    RelatCotacoesInvestDBText1: TppDBText;
    DtsValIndic: TwwDataSource;
    BdeValIndic: TppBDEPipeline;
    RptValIndic: TppReport;
    ppHeaderBand12: TppHeaderBand;
    ppLabel32: TppLabel;
    ppLabel35: TppLabel;
    ppLine21: TppLine;
    ppDetailBand12: TppDetailBand;
    ppDBText1: TppDBText;
    ppFooterBand12: TppFooterBand;
    ppLine22: TppLine;
    ppLabel39: TppLabel;
    RptValIndicDBText1: TppDBText;
    RptValIndicDBText2: TppDBText;
    RptValIndicDBText3: TppDBText;
    RptValIndicLine1: TppLine;
    RptValIndicLine2: TppLine;
    LblLote: TppLabel;
    LblSaldoAtu: TppDBText;
    LblSaldoAqui: TppDBText;
    dsEnquadraRenFixa: TwwDataSource;
    bdeEnquadraRenFixa: TppBDEPipeline;
    RptEnquadraRenFixa: TppReport;
    ppHeaderBand16: TppHeaderBand;
    ppLine29: TppLine;
    ppDetailBand16: TppDetailBand;
    updEnquadraRenFixa: TUpdateSQL;
    dsRentRendaFixa: TwwDataSource;
    bdeRentRendaFixa: TppBDEPipeline;
    RptRentRendaFixa: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLine25: TppLine;
    RptRentRendaFixaLine1: TppLine;
    RptRentRendaFixaLabel6: TppLabel;
    RptRentRendaFixaLabel7: TppLabel;
    ppDetailBand14: TppDetailBand;
    RptRentRendaFixaDBText2: TppDBText;
    RptRentRendaFixaDBText3: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine26: TppLine;
    ppLabel40: TppLabel;
    RptRentRendaFixaGroup1: TppGroup;
    RptRentRendaFixaGroupHeaderBand1: TppGroupHeaderBand;
    RptRentRendaFixaLabel5: TppLabel;
    RptRentRendaFixaDBText1: TppDBText;
    RptRentRendaFixaLine2: TppLine;
    RptRentRendaFixaGroupFooterBand1: TppGroupFooterBand;
    RptRentRendaFixaDBCalc1: TppDBCalc;
    RptRentRendaFixaLine3: TppLine;
    RptRentRendaFixaLabel8: TppLabel;
    updRentRendaFixa: TUpdateSQL;
    dsResumoOper: TwwDataSource;
    bdeResumoOper: TppBDEPipeline;
    RptResumoOper: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLine23: TppLine;
    RptResumoOperLine1: TppLine;
    RptResumoOperLabel5: TppLabel;
    RptResumoOperLabel6: TppLabel;
    RptResumoOperLabel7: TppLabel;
    RptResumoOperLabel8: TppLabel;
    RptResumoOperLabel9: TppLabel;
    RptResumoOperLabel10: TppLabel;
    RptResumoOperLabel11: TppLabel;
    RptResumoOperLabel12: TppLabel;
    RptResumoOperLine2: TppLine;
    ppDetailBand13: TppDetailBand;
    RptResumoOperDBText2: TppDBText;
    RptResumoOperDBText3: TppDBText;
    RptResumoOperDBText4: TppDBText;
    RptResumoOperDBText5: TppDBText;
    RptResumoOperDBText6: TppDBText;
    RptResumoOperDBText7: TppDBText;
    RptResumoOperDBText8: TppDBText;
    RptResumoOperDBText9: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine24: TppLine;
    ppLabel36: TppLabel;
    RptResumoOperGroup1: TppGroup;
    RptResumoOperGroupHeaderBand1: TppGroupHeaderBand;
    RptResumoOperLabel13: TppLabel;
    RptResumoOperDBText1: TppDBText;
    RptResumoOperLine3: TppLine;
    RptResumoOperGroupFooterBand1: TppGroupFooterBand;
    RptResumoOperDBCalc1: TppDBCalc;
    RptResumoOperDBCalc2: TppDBCalc;
    RptResumoOperDBCalc3: TppDBCalc;
    RptResumoOperDBCalc4: TppDBCalc;
    RptResumoOperLine4: TppLine;
    RptResumoOperLabel14: TppLabel;
    updResumoOper: TUpdateSQL;
    RptEnquadraRenFixaLine1: TppLine;
    RptEnquadraRenFixaLabel2: TppLabel;
    RptEnquadraRenFixaLabel3: TppLabel;
    RptEnquadraRenFixaLabel5: TppLabel;
    RptEnquadraRenFixaLabel6: TppLabel;
    RptEnquadraRenFixaLabel7: TppLabel;
    RptEnquadraRenFixaLabel8: TppLabel;
    RptEnquadraRenFixaLabel10: TppLabel;
    RptEnquadraRenFixaLabel11: TppLabel;
    RptEnquadraRenFixaLabel12: TppLabel;
    RptEnquadraRenFixaLine2: TppLine;
    RptEnquadraRenFixaLabel13: TppLabel;
    RptEnquadraRenFixaDBText2: TppDBText;
    RptEnquadraRenFixaLine3: TppLine;
    RptEnquadraRenFixaLabel15: TppLabel;
    RptEnquadraRenFixaDBCalc5: TppDBCalc;
    RptEnquadraRenFixaDBCalc6: TppDBCalc;
    RptEnquadraRenFixaDBCalc7: TppDBCalc;
    RptEnquadraRenFixaDBCalc8: TppDBCalc;
    RptEnquadraRenFixaLabel14: TppLabel;
    RptEnquadraRenFixaDBCalc1: TppDBCalc;
    RptEnquadraRenFixaDBCalc2: TppDBCalc;
    RptEnquadraRenFixaDBCalc3: TppDBCalc;
    RptEnquadraRenFixaDBCalc4: TppDBCalc;
    RptEnquadraRenFixaDBText4: TppDBText;
    RptEnquadraRenFixaLabel16: TppLabel;
    RptEnquadraRenFixaLine4: TppLine;
    RptEnquadraRenFixaLine5: TppLine;
    RptEnquadraRenFixaDBText3: TppDBText;
    RptEnquadraRenFixaDBText5: TppDBText;
    RptEnquadraRenFixaDBText6: TppDBText;
    RptEnquadraRenFixaDBText7: TppDBText;
    RptEnquadraRenFixaDBText8: TppDBText;
    RptEnquadraRenFixaDBText9: TppDBText;
    RptEnquadraRenFixaDBText12: TppDBText;
    RptEnquadraRenFixaDBText13: TppDBText;
    RptEnquadraRenFixaLabel17: TppLabel;
    RptEnquadraRenFixaDBText14: TppDBText;
    RptEnquadraRenFixaFooterBand1: TppFooterBand;
    LbDescRecursos: TppLabel;
    LbVlrRecGarantidores: TppLabel;
    MemoCotacoes: TppMemo;
    RptListInvLine2: TppLine;
    dsBoletaRenFixa: TwwDataSource;
    bdeBoletaRenFixa: TppBDEPipeline;
    updBoletaRenFixa: TUpdateSQL;
    RptEnquadraRenFixaLine6: TppLine;
    RptEnquadraRenFixaLabel21: TppLabel;
    updGerCartSintetico: TUpdateSQL;
    dsLimBancos: TwwDataSource;
    bdeLimBancos: TppBDEPipeline;
    RptLimBancos: TppReport;
    ppHeaderBand18: TppHeaderBand;
    ppLine32: TppLine;
    ppDetailBand17: TppDetailBand;
    ppFooterBand17: TppFooterBand;
    ppLine33: TppLine;
    ppLabel51: TppLabel;
    updLimBancos: TUpdateSQL;
    RptLimBancosLabel3: TppLabel;
    RptLimBancosLabel4: TppLabel;
    RptLimBancosLabel5: TppLabel;
    RptLimBancosLabel6: TppLabel;
    RptLimBancosLabel7: TppLabel;
    RptLimBancosLabel8: TppLabel;
    RptLimBancosLabel9: TppLabel;
    RptLimBancosLabel10: TppLabel;
    RptLimBancosLabel11: TppLabel;
    RptLimBancosLabel12: TppLabel;
    RptLimBancosLabel13: TppLabel;
    RptLimBancosLabel14: TppLabel;
    RptLimBancosLabel15: TppLabel;
    RptLimBancosLabel16: TppLabel;
    RptLimBancosLabel17: TppLabel;
    RptLimBancosLabel18: TppLabel;
    RptLimBancosLabel19: TppLabel;
    RptLimBancosLabel20: TppLabel;
    RptLimBancosLabel21: TppLabel;
    RptLimBancosLabel22: TppLabel;
    RptLimBancosLabel23: TppLabel;
    RptLimBancosLabel24: TppLabel;
    RptLimBancosLabel25: TppLabel;
    RptLimBancosLabel26: TppLabel;
    RptLimBancosLabel27: TppLabel;
    RptLimBancosLine1: TppLine;
    RptLimBancosDBText1: TppDBText;
    RptLimBancosDBText2: TppDBText;
    RptLimBancosDBText3: TppDBText;
    RptLimBancosDBText4: TppDBText;
    RptLimBancosDBText5: TppDBText;
    RptLimBancosDBText6: TppDBText;
    RptLimBancosDBText7: TppDBText;
    RptLimBancosDBText8: TppDBText;
    RptLimBancosDBText9: TppDBText;
    RptLimBancosDBText10: TppDBText;
    RptLimBancosDBText11: TppDBText;
    RptLimBancosDBText12: TppDBText;
    RptLimBancosDBText13: TppDBText;
    RptLimBancosDBText14: TppDBText;
    RptGerCarteiraLine3: TppLine;
    RptGerCarteiraLine4: TppLine;
    RptEnquadraRenFixaLine8: TppLine;
    RptEnquadraRenFixaLine9: TppLine;
    RptDemCustoCarteiraDBCalc1: TppDBCalc;
    RptDemCustoCarteiraDBCalc2: TppDBCalc;
    RptDemCustoCarteiraDBCalc3: TppDBCalc;
    RptDemCustoCarteiraLine5: TppLine;
    RptDemCustoCarteiraLabel15: TppLabel;
    TotMercado: TppLabel;
    RptListInvDBMemo1: TppDBMemo;
    RptListInvLabel13: TppLabel;
    RptListInvLine3: TppLine;
    RptDetBoletaSummaryBand1: TppSummaryBand;
    RptDetBoletaLine2: TppLine;
    RptDetBoletaLabel14: TppLabel;
    RptDetBoletaLabel20: TppLabel;
    RptDetBoletaLine4: TppLine;
    RptDetBoletaMemo1: TppMemo;
    RptDetBoletaMemo2: TppMemo;
    RptDetBoletaLabel17: TppLabel;
    RptDetBoletaLabel18: TppLabel;
    RptDetBoletaLabel19: TppLabel;
    dsTIRAnalitMov: TwwDataSource;
    bdeTIRAnalitMov: TppBDEPipeline;
    RptTIRAnalitMov: TppReport;
    ppHeaderBand19: TppHeaderBand;
    ppLine34: TppLine;
    ppLabel56: TppLabel;
    ppLine35: TppLine;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDetailBand18: TppDetailBand;
    ppDBText2: TppDBText;
    ppFooterBand18: TppFooterBand;
    ppLine36: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine37: TppLine;
    ppLabel67: TppLabel;
    updTIRAnalitMov: TUpdateSQL;
    RptParamAnalitMovDBText1: TppDBText;
    RptParamAnalitMovDBText2: TppDBText;
    RptParamAnalitMovDBText3: TppDBText;
    RptParamAnalitMovDBCalc1: TppDBCalc;
    RptParamAnalitMovLabel1: TppLabel;
    RptParamAnalitMovDBText4: TppDBText;
    RptEnquadraRenFixaSummaryBand1: TppSummaryBand;
    RptEnquadraRenFixaLabel19: TppLabel;
    RptEnquadraRenFixaDBCalc9: TppDBCalc;
    RptEnquadraRenFixaDBCalc10: TppDBCalc;
    RptEnquadraRenFixaLine7: TppLine;
    RptEnquadraRenFixaDBCalc11: TppDBCalc;
    RptEnquadraRenFixaDBCalc12: TppDBCalc;
    RptBoletaRenFixa: TppReport;
    ppHeaderBand17: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    RptBoletaRenFixaShape25: TppShape;
    RptBoletaRenFixaShape1: TppShape;
    RptBoletaRenFixaLabel1: TppLabel;
    RptBoletaRenFixaDBText2: TppDBText;
    RptBoletaRenFixaShape2: TppShape;
    RptBoletaRenFixaShape3: TppShape;
    RptBoletaRenFixaShape4: TppShape;
    RptBoletaRenFixaShape5: TppShape;
    RptBoletaRenFixaShape6: TppShape;
    RptBoletaRenFixaLine1: TppLine;
    RptBoletaRenFixaLine2: TppLine;
    RptBoletaRenFixaLabel2: TppLabel;
    RptBoletaRenFixaLabel3: TppLabel;
    RptBoletaRenFixaLabel4: TppLabel;
    RptBoletaRenFixaLabel5: TppLabel;
    RptBoletaRenFixaLabel6: TppLabel;
    RptBoletaRenFixaDBText3: TppDBText;
    RptBoletaRenFixaDBText4: TppDBText;
    RptBoletaRenFixaDBText5: TppDBText;
    RptBoletaRenFixaDBText6: TppDBText;
    RptBoletaRenFixaDBText7: TppDBText;
    RptBoletaRenFixaShape7: TppShape;
    RptBoletaRenFixaShape8: TppShape;
    RptBoletaRenFixaShape9: TppShape;
    RptBoletaRenFixaLine3: TppLine;
    RptBoletaRenFixaShape10: TppShape;
    RptBoletaRenFixaShape11: TppShape;
    RptBoletaRenFixaShape12: TppShape;
    RptBoletaRenFixaShape13: TppShape;
    RptBoletaRenFixaLine4: TppLine;
    RptBoletaRenFixaShape14: TppShape;
    RptBoletaRenFixaShape15: TppShape;
    RptBoletaRenFixaShape16: TppShape;
    RptBoletaRenFixaShape17: TppShape;
    RptBoletaRenFixaLine5: TppLine;
    RptBoletaRenFixaShape18: TppShape;
    RptBoletaRenFixaShape19: TppShape;
    RptBoletaRenFixaShape20: TppShape;
    RptBoletaRenFixaShape21: TppShape;
    RptBoletaRenFixaShape22: TppShape;
    RptBoletaRenFixaShape23: TppShape;
    RptBoletaRenFixaLine6: TppLine;
    RptBoletaRenFixaLine7: TppLine;
    RptBoletaRenFixaShape24: TppShape;
    RptBoletaRenFixaLabel7: TppLabel;
    RptBoletaRenFixaLabel8: TppLabel;
    RptBoletaRenFixaLabel9: TppLabel;
    RptBoletaRenFixaLabel10: TppLabel;
    RptBoletaRenFixaLabel11: TppLabel;
    RptBoletaRenFixaLabel12: TppLabel;
    RptBoletaRenFixaLabel13: TppLabel;
    RptBoletaRenFixaLabel14: TppLabel;
    RptBoletaRenFixaLabel15: TppLabel;
    RptBoletaRenFixaLabel16: TppLabel;
    RptBoletaRenFixaLabel17: TppLabel;
    RptBoletaRenFixaLabel18: TppLabel;
    RptBoletaRenFixaLabel19: TppLabel;
    RptBoletaRenFixaLabel20: TppLabel;
    RptBoletaRenFixaLabel21: TppLabel;
    RptBoletaRenFixaLabel22: TppLabel;
    RptBoletaRenFixaLabel23: TppLabel;
    RptBoletaRenFixaLabel24: TppLabel;
    RptBoletaRenFixaLabel25: TppLabel;
    RptBoletaRenFixaLabel26: TppLabel;
    RptBoletaRenFixaLabel27: TppLabel;
    RptBoletaRenFixaLabel28: TppLabel;
    RptBoletaRenFixaLabel29: TppLabel;
    RptBoletaRenFixaDBText8: TppDBText;
    RptBoletaRenFixaDBText9: TppDBText;
    RptBoletaRenFixaDBText10: TppDBText;
    RptBoletaRenFixaDBText11: TppDBText;
    RptBoletaRenFixaDBText12: TppDBText;
    RptBoletaRenFixaDBText13: TppDBText;
    RptBoletaRenFixaDBText14: TppDBText;
    RptBoletaRenFixaMemo1: TppMemo;
    RptBoletaRenFixaMemo2: TppMemo;
    RptBoletaRenFixaDBMemo1: TppDBMemo;
    RptBoletaRenFixaDBMemo2: TppDBMemo;
    RptBoletaRenFixaLabel32: TppLabel;
    RptBoletaRenFixaLabel33: TppLabel;
    RptBoletaRenFixaLabel34: TppLabel;
    ppFooterBand16: TppFooterBand;
    ppLine31: TppLine;
    ppLabel48: TppLabel;
    RptBoletaRenFixaGroup1: TppGroup;
    RptBoletaRenFixaGroupHeaderBand1: TppGroupHeaderBand;
    RptBoletaRenFixaDBText1: TppDBText;
    RptBoletaRenFixaDBText16: TppDBText;
    RptBoletaRenFixaLabel31: TppLabel;
    RptBoletaRenFixaGroupFooterBand1: TppGroupFooterBand;
    RptListInvLabel14: TppLabel;
    RptListInvLabel15: TppLabel;
    RptListInvDBText16: TppDBText;
    RptListInvDBText17: TppDBText;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppCalc31: TppSystemVariable;
    ppCalc32: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    ppCalc24: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    ppCalc26: TppSystemVariable;
    RptEnquadraRenFixaCalc1: TppSystemVariable;
    RptEnquadraRenFixaCalc2: TppSystemVariable;
    ppCalc21: TppSystemVariable;
    ppCalc22: TppSystemVariable;
    ppCalc19: TppSystemVariable;
    ppCalc20: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    ppCalc15: TppSystemVariable;
    ppCalc16: TppSystemVariable;
    ppCalc7: TppSystemVariable;
    ppCalc8: TppSystemVariable;
    RptDemCustoCarteiraCalc1: TppSystemVariable;
    RptDemCustoCarteiraCalc2: TppSystemVariable;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    ppCalc10: TppSystemVariable;
    RelatConsInvestCalc1: TppSystemVariable;
    RelatConsInvestCalc2: TppSystemVariable;
    RelatCotacoesInvestCalc1: TppSystemVariable;
    RelatCotacoesInvestCalc3: TppSystemVariable;
    RptExtratoOper: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLine27: TppLine;
    RptExtratoOperLabel1: TppLabel;
    RptExtratoOperLabel3: TppLabel;
    RptExtratoOperLine1: TppLine;
    RptExtratoOperLabel5: TppLabel;
    RptExtratoOperLabel7: TppLabel;
    RptExtratoOperLabel9: TppLabel;
    RptExtratoOperLabel11: TppLabel;
    RptExtratoOperLabel13: TppLabel;
    RptExtratoOperLabel15: TppLabel;
    RptExtratoOperLabel18: TppLabel;
    RptExtratoOperLabel19: TppLabel;
    RptExtratoOperLabel21: TppLabel;
    RptExtratoOperLabel22: TppLabel;
    RptExtratoOperLabel23: TppLabel;
    RptExtratoOperLabel24: TppLabel;
    RptExtratoOperLabel17: TppLabel;
    RptExtratoOperDBText2: TppDBText;
    RptExtratoOperDBText3: TppDBText;
    RptExtratoOperDBText4: TppDBText;
    RptExtratoOperDBText5: TppDBText;
    RptExtratoOperDBText6: TppDBText;
    RptExtratoOperDBText7: TppDBText;
    RptExtratoOperDBText8: TppDBText;
    RptExtratoOperDBText9: TppDBText;
    RptExtratoOperLabel4: TppLabel;
    RptExtratoOperDataRef: TppLabel;
    RptExtratoOperDBText16: TppDBText;
    ppLabel57: TppLabel;
    ppLabel60: TppLabel;
    ppDetailBand15: TppDetailBand;
    RptExtratoOperDBText1: TppDBText;
    RptExtratoOperDBText14: TppDBText;
    RptExtratoOperDBText10: TppDBText;
    RptExtratoOperDBText11: TppDBText;
    RptExtratoOperDBText13: TppDBText;
    RptExtratoOperDBText12: TppDBText;
    RptExtratoOperDBText15: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand15: TppFooterBand;
    ppLine28: TppLine;
    ppLabel43: TppLabel;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    RptExtratoOperGroup1: TppGroup;
    RptExtratoOperGroupHeaderBand1: TppGroupHeaderBand;
    RptExtratoOperGroupFooterBand1: TppGroupFooterBand;
    dsExtratoOper: TwwDataSource;
    bdeExtratoOper: TppBDEPipeline;
    updExtratoOper: TUpdateSQL;
    qryExtratoOper: TwwQuery;
    qryExtratoOperDESCCARTINVEST: TStringField;
    qryExtratoOperDESCTIPRENFIXA: TStringField;
    qryExtratoOperIDLOTE: TStringField;
    qryExtratoOperNOME: TStringField;
    qryExtratoOperIDCARTEIRAINVEST: TFloatField;
    qryExtratoOperIDINVESTIMENTO: TFloatField;
    qryExtratoOperDATAMOVCARTINV: TDateTimeField;
    qryExtratoOperSALDOVLRINVCART: TFloatField;
    qryExtratoOperNUMDOCUMENTO: TStringField;
    qryExtratoOperDESCINVESTIMENTO: TStringField;
    qryExtratoOperMOEDESC: TStringField;
    qryExtratoOperDATAINICIAL: TDateTimeField;
    qryExtratoOperVALINICIAL: TFloatField;
    qryExtratoOperSALDOABERT: TFloatField;
    qryExtratoOperRENDIMENTO: TFloatField;
    qryExtratoOperRESGATE: TFloatField;
    qryExtratoOperSALDO: TFloatField;
    qryExtratoOperJUROS: TFloatField;
    qryExtratoOperVARIACAO: TFloatField;
    updMemoria: TUpdateSQL;
    dsMemoria: TwwDataSource;
    ppSystemVariable3: TppSystemVariable;
    ppLabel71: TppLabel;
    ppDBText10: TppDBText;
    ppLabel66: TppLabel;
    ppDBText18: TppDBText;
    rptConsIndMoeda: TppReport;
    ppHeaderBand21: TppHeaderBand;
    ppsVarComp: TppShape;
    ppsVarIndComp: TppShape;
    ppsVarFundo: TppShape;
    ppLine40: TppLine;
    ppLabel86: TppLabel;
    lblDataIni: TppLabel;
    lblDataFim: TppLabel;
    ppLabel87: TppLabel;
    lblCapFundo: TppLabel;
    lblFundo: TppLabel;
    ppLabel89: TppLabel;
    ppLabel91: TppLabel;
    lblTitFator: TppLabel;
    lblTitFatAcu: TppLabel;
    lblCapIndComp: TppLabel;
    lblIndComp: TppLabel;
    lblTitVariacao: TppLabel;
    ppLine43: TppLine;
    ppLine45: TppLine;
    lblCapVarFundo: TppLabel;
    lblVarFundo: TppLabel;
    lblCapVarIndComp: TppLabel;
    lblVarIndComp: TppLabel;
    lblCapDifPer1: TppLabel;
    lblDifPerc: TppLabel;
    lblCapDifPer2: TppLabel;
    lblIndComp2: TppLabel;
    ppLine46: TppLine;
    ppDetailBand21: TppDetailBand;
    ppDBText17: TppDBText;
    dbtFator: TppDBText;
    dbtFatAcu: TppDBText;
    ppDBText20: TppDBText;
    bdeConsIndMoeda: TppBDEPipeline;
    ppSystemVariable4: TppSystemVariable;
    bdeListInv: TppBDEPipeline;
    qryListInv: TwwQuery;
    QryRelatConsInvest: TwwQuery;
    QryEnquadramento: TwwQuery;
    qryDemCustoCarteira: TwwQuery;
    qryResumoOper: TwwQuery;
    qryCompGerLotes: TwwQuery;
    qryDetBoleta: TwwQuery;
    qryDetBoletaIDOPERACAOINVEST: TFloatField;
    qryDetBoletaDATAOPERACAO: TDateTimeField;
    qryDetBoletaDATAVENCOPER: TDateTimeField;
    qryDetBoletaQTDEOPERACAO: TFloatField;
    qryDetBoletaPRECOUNITOPERACAO: TFloatField;
    qryDetBoletaVLROPERACAO: TFloatField;
    qryDetBoletaNUMDOCUMENTO: TStringField;
    qryDetBoletaSGLBOLSAVALORES: TStringField;
    qryDetBoletaVLRDESPOPER: TFloatField;
    qryDetBoletaIDTIPODESPINVEST: TFloatField;
    qryDetBoletaTOTALDESPESAS: TFloatField;
    qryDetBoletaDESCMERCADO: TStringField;
    qryDetBoletaNOME: TStringField;
    qryDetBoletaDESCINVESTIMENTO: TStringField;
    qryDetBoletaDESCTIPOOPERACAO: TStringField;
    qryDetBoletaNATUREZAOPERACAO: TStringField;
    qryDetBoletaDESCTIPODESPINV: TStringField;
    qryDetBoletaDESCCARTINVEST: TStringField;
    qryDetBoletaDESPNATUR: TStringField;
    qryGerCarteira: TwwQuery;
    qryGerCarteiraDESCCARTINVEST: TStringField;
    qryGerCarteiraDESCSETOREMISSOR: TStringField;
    qryGerCarteiraDESCINVESTIMENTO: TStringField;
    qryGerCarteiraIDCARTEIRAINVEST: TFloatField;
    qryGerCarteiraIDINVESTIMENTO: TFloatField;
    qryGerCarteiraIDEMISSOR: TFloatField;
    qryGerCarteiraCODTIPOACAO: TStringField;
    qryGerCarteiraSALDOAQUI: TFloatField;
    qryGerCarteiraSALDOQTDEINVCART: TFloatField;
    qryGerCarteiraSALDOCAR: TFloatField;
    qryGerCarteiraCOTACAO: TFloatField;
    qryGerCarteiraTOTCART: TFloatField;
    qryGerCarteiraTOTACAOTIPO: TFloatField;
    qryGerCarteiraTOTACAO: TFloatField;
    qryGerCarteiraQTDTITLOTE: TFloatField;
    qryGerCarteiraSALDOATU: TFloatField;
    qryGerCarteiraCOTACAOAUX: TFloatField;
    qryGerCartSintetico: TwwQuery;
    qryGerCartSinteticoDESCCARTINVEST: TStringField;
    qryGerCartSinteticoDESCSETOREMISSOR: TStringField;
    qryGerCartSinteticoIDCARTEIRAINVEST: TFloatField;
    qryGerCartSinteticoIDSETOREMISSOR: TStringField;
    qryGerCartSinteticoSALDOAQUI: TFloatField;
    qryGerCartSinteticoEMPRESAS: TFloatField;
    qryGerCartSinteticoVALORMERCADO: TFloatField;
    qryGerCartSinteticoSALDOATU: TFloatField;
    qryGerCartSinteticoSALDOCAR: TFloatField;
    qryGerCartSinteticoTOTCART: TFloatField;
    qryProvisaoIR: TwwQuery;
    qryTIRAnalitMov: TwwQuery;
    qryTIRAnalitMovCARTEIRA: TStringField;
    qryTIRAnalitMovINVESTIMENTO: TStringField;
    qryTIRAnalitMovLOTE: TStringField;
    qryTIRAnalitMovHISTORICO: TStringField;
    qryTIRAnalitMovVALMOVIM: TFloatField;
    qryLimBancos: TwwQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qryBoletaRenFixa: TwwQuery;
    qryBoletaRenFixaIDOPERACAOINVEST: TFloatField;
    qryBoletaRenFixaDATAOPERACAO: TDateTimeField;
    qryBoletaRenFixaDATAVENCOPER: TDateTimeField;
    qryBoletaRenFixaQTDEOPERACAO: TFloatField;
    qryBoletaRenFixaPRECOUNITOPERACAO: TFloatField;
    qryBoletaRenFixaVLROPERACAO: TFloatField;
    qryBoletaRenFixaNUMDOCUMENTO: TStringField;
    qryBoletaRenFixaMOEDESC: TStringField;
    qryBoletaRenFixaNOME: TStringField;
    qryBoletaRenFixaSGLCUSTODIANTE: TStringField;
    qryBoletaRenFixaDESCINVESTIMENTO: TStringField;
    qryBoletaRenFixaOBSINVESTIMENTO: TStringField;
    qryBoletaRenFixaDESCTIPOOPERACAO: TStringField;
    qryBoletaRenFixaOBSERVACAO: TStringField;
    qryBoletaRenFixaNATUREZAOPERACAO: TStringField;
    qryBoletaRenFixaDESCCARTINVEST: TStringField;
    qryBoletaRenFixaVLRRESGATE: TFloatField;
    qryBoletaRenFixaPRZVENC: TFloatField;
    qryBoletaRenFixaVLRCOMPRATITLOTE: TFloatField;
    qryBoletaRenFixaDATAVENCIM: TDateTimeField;
    qryBoletaRenFixaIDINVESTIMENTO: TFloatField;
    qryBoletaRenFixaINDEXRENFIX: TFloatField;
    qryBoletaRenFixaPERCINDEX: TFloatField;
    qryBoletaRenFixaCODTIPTXJUROS: TFloatField;
    qryBoletaRenFixaDATAINIJURRENFIX: TDateTimeField;
    qryBoletaRenFixaJUROSRENFIX: TFloatField;
    qryBoletaRenFixaPREMIORENFIX: TFloatField;
    qryBoletaRenFixaCODTIPTXPREMIO: TFloatField;
    qryBoletaRenFixaDESCTIPJUROS: TStringField;
    qryBoletaRenFixaTAXAOVER: TFloatField;
    qryBoletaRenFixaIDCARTEIRAINVEST: TFloatField;
    qryBoletaRenFixaVALORJUROS: TFloatField;
    qryBoletaRenFixaJUROSDIA: TFloatField;
    qryBoletaRenFixaIDLOTE: TStringField;
    qryBoletaRenFixaTAMPERJUROS: TFloatField;
    qryBoletaRenFixaEFETNOMI: TStringField;
    qryRentRendaFixa: TwwQuery;
    QryValIndic: TwwQuery;
    qryEnquadraRenFixa: TwwQuery;
    QryRelatCotacoes: TwwQuery;
    qryMemoria: TwwQuery;
    qryMemoriaDATA: TDateTimeField;
    qryMemoriaCOTVALOR: TFloatField;
    qryMemoriaFATOR: TFloatField;
    qryMemoriaVARIACAO: TFloatField;
    qryMemoriaFATACU: TFloatField;
    qryTIRAnalitico: TwwQuery;
    qryTIRAnaliticoDESCINVESTIMENTO: TStringField;
    qryTIRAnaliticoIDLOTE: TStringField;
    qryTIRAnaliticoIDINVESTIMENTO: TFloatField;
    qryTIRAnaliticoDATAMOVCARTINV: TDateTimeField;
    qryTIRAnaliticoSALDODIA: TFloatField;
    dsTIRAnalitico: TwwDataSource;
    bdeTIRAnalitico: TppBDEPipeline;
    RptTIRAnalitico: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLine12: TppLine;
    lbDataIniA: TppLabel;
    lbDataFimA: TppLabel;
    RptTIRAnaliticoLine1: TppLine;
    RptTIRAnaliticoLabel5: TppLabel;
    RptTIRAnaliticoLabel6: TppLabel;
    RptTIRAnaliticoLabel7: TppLabel;
    RptTIRAnaliticoLabel8: TppLabel;
    ppDetailBand7: TppDetailBand;
    RptTIRAnaliticoDBText1: TppDBText;
    RptTIRAnaliticoDBText2: TppDBText;
    lbInvestimento: TppLabel;
    lbLote: TppLabel;
    ppFooterBand7: TppFooterBand;
    ppLine13: TppLine;
    ppLabel18: TppLabel;
    ppCalc11: TppSystemVariable;
    ppCalc12: TppSystemVariable;
    RptTIRAnaliticoSummaryBand1: TppSummaryBand;
    RptTIRAnaliticoLine3: TppLine;
    RptTIRAnaliticolblTotal: TppLabel;
    RptTIRAnaliticoMemo1: TppMemo;
    RptTIRAnaliticoMemo2: TppMemo;
    RptTIRAnaliticolblTIR: TppLabel;
    RptTIRAnaliticolblVlrTIR: TppLabel;
    updTIRAnalitico: TUpdateSQL;
    qryListInvIDBOLSAVALORES: TFloatField;
    qryListInvSGLBOLSAVALORES: TStringField;
    p: TDateTimeField;
    qryListInvDATAVENCOPER: TDateTimeField;
    qryListInvQTDEOPERACAO: TFloatField;
    qryListInvPRECOUNITOPERACAO: TFloatField;
    qryListInvVLROPERACAO: TFloatField;
    qryListInvTOTALDESPESAS: TFloatField;
    qryListInvDESCMERCADO: TStringField;
    qryListInvEMPRESA: TStringField;
    qryListInvNOME: TStringField;
    qryListInvDESCINVESTIMENTO: TStringField;
    qryListInvDESCTIPOOPERACAO: TStringField;
    qryListInvNUMDOCUMENTO: TStringField;
    qryListInvNATUREZAOPERACAO: TStringField;
    qryListInvTOTALDESPESABOLETA: TFloatField;
    qryListInvTOTALLIQUIDOBOLETA: TFloatField;
    qryListInvOBSERVACAO: TMemoField;
    qryListInvPUMEDIOCOMPRA: TFloatField;
    qryListInvPUMEDIOVENDA: TFloatField;
    qryListInvIDINVESTIMENTO: TFloatField;
    LblPlano: TppLabel;
    bdeTIRSintetico: TppBDEPipeline;
    dsTIRSintetico: TwwDataSource;
    updTIRSintetico: TUpdateSQL;
    qryTIRSintetico: TwwQuery;
    RptTIRSintetico: TppReport;
    ppHeaderBand22: TppHeaderBand;
    ppLine47: TppLine;
    lbDataIni: TppLabel;
    lbDataFim: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLine48: TppLine;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppDetailBand4: TppDetailBand;
    shpTIRSintDet: TppShape;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    RptTIRSinteticoDBText5: TppDBText;
    LblErroCalc: TppLabel;
    ppFooterBand21: TppFooterBand;
    ppLine49: TppLine;
    ppLabel105: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppSummaryBand3: TppSummaryBand;
    shpTirTotal: TppShape;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    Lbl2: TppLabel;
    srptFluxo: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    shpTitFluxo: TppShape;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppDetailBand23: TppDetailBand;
    shpDetFluxo: TppShape;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppBDEFluxo: TppBDEPipeline;
    qryFluxoTir: TwwQuery;
    qryFluxoTirDATAMOVCARTINV: TDateTimeField;
    qryFluxoTirSALDODIA: TFloatField;
    dsFluxoTir: TwwDataSource;
    updFluxoTir: TUpdateSQL;
    dsVarMesCarteira: TwwDataSource;
    bdeVarMesCarteira: TppBDEPipeline;
    updVarMesCarteira: TUpdateSQL;
    qryVarMesCarteira: TwwQuery;
    qryVarMesCarteiraDESCCARTINVEST: TStringField;
    qryVarMesCarteiraDESCINVESTIMENTO: TStringField;
    qryVarMesCarteiraIDLOTE: TStringField;
    qryVarMesCarteiraIDCARTEIRAINVEST: TFloatField;
    qryVarMesCarteiraDATAMOV1: TDateTimeField;
    qryVarMesCarteiraIDINVESTIMENTO: TFloatField;
    qryVarMesCarteiraSALDOQTDEINVCART: TFloatField;
    qryVarMesCarteiraSALDOVLRINVCART: TFloatField;
    qryVarMesCarteiraSALDOAQUI: TFloatField;
    qryVarMesCarteiraSALDOATU: TFloatField;
    qryVarMesCarteiraCOTACAO: TFloatField;
    qryVarMesCarteiraVARATEMESANT: TFloatField;
    qryVarMesCarteiraVARATEMES: TFloatField;
    qryVarMesCarteiraVARMES: TFloatField;
    qryVarMesCarteiraTOTCART: TFloatField;
    qryVarMesCarteiraVARIACAO: TFloatField;
    qryVarMesCarteiraBAIXA: TFloatField;
    qryVarMesCarteiraQTDEANT: TFloatField;
    qryVarMesCarteiraIDTIPOINVEST: TFloatField;
    dpLancCont: TppBDEPipeline;
    dsLancCont: TwwDataSource;
    qryLancCont: TwwQuery;
    qryLancContDESCTIPOOPERACAO: TStringField;
    qryLancContPAPEL: TStringField;
    qryLancContQTDEMOVINVCART: TFloatField;
    qryLancContVLRMOVCARTINV: TFloatField;
    qryLancContVLRVARIACAO: TFloatField;
    qryLancContVLRJUROS: TFloatField;
    qryLancContCODDOCUMENTO: TFloatField;
    qryLancContPLNCODIGO: TFloatField;
    qryLancContTIPMOVCARTINV: TStringField;
    qryLancContIDTIPOOPERACAO: TFloatField;
    qryLancContIDHISTCARTINV: TFloatField;
    qryLancContTQUANT: TFloatField;
    qryLancContTVALOR: TFloatField;
    qryLancContTVARIACAO: TFloatField;
    qryLancContTJUROS: TFloatField;
    qryLancContIDOPERACAOINVEST: TFloatField;
    qryLancContPLNQUEBRA: TStringField;
    qryLancContDESCOPER: TStringField;
    qryLancContPLNPLANIL: TFloatField;
    qryLancContDESCTPOPERACAO: TStringField;
    RptLancCont: TppReport;
    ppHeaderBand20: TppHeaderBand;
    ppShape2: TppShape;
    ppLabel68: TppLabel;
    ppLabel70: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppDetailBand19: TppDetailBand;
    shpDetalhe: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand19: TppFooterBand;
    ppLine39: TppLine;
    ppLabel65: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel75: TppLabel;
    ppDBText15: TppDBText;
    gfbRodaPePLNQUEBRA: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    gfbRodaPePLNPLANIL: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand20: TppDetailBand;
    shpDetLancamento: TppShape;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppDBTextValor: TppDBText;
    ppDBTextDC: TppDBText;
    ppDBText11: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    shpCabSubLancCont: TppShape;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape4: TppShape;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    shpTotais: TppShape;
    ppLabel84: TppLabel;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    shpTitOper: TppShape;
    ppDBText16: TppDBText;
    gfbRodaPeDESCTIPOOPERACAO: TppGroupFooterBand;
    dsLancContItens: TwwDataSource;
    dpLancContItens: TppBDEPipeline;
    qryLancContItens: TwwQuery;
    qryLancContItensPLNCODIGO: TFloatField;
    qryLancContItensPLACONTA: TStringField;
    qryLancContItensHISTORICO: TStringField;
    qryLancContItensLACVALOR: TFloatField;
    qryLancContItensLACDEBCRE: TStringField;
    qryLancContItensCREDITOS: TFloatField;
    qryLancContItensDEBITOS: TFloatField;
    qryLancContItensTDEBITOS: TFloatField;
    qryLancContItensTCREDITOS: TFloatField;
    qryLancContItensPLNPLANIL: TFloatField;
    RptHitoricoCota: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDetailBand22: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppLine7: TppLine;
    ppLabel11: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    BdeHitoricoCota: TppBDEPipeline;
    DsHitoricoCota: TwwDataSource;
    ppCarteira: TppLabel;
    ppRepExeDireitoShape1: TppShape;
    ppLine6: TppLine;
    ppLine41: TppLine;
    ppLData: TppLabel;
    ppLabel94: TppLabel;
    ppLabel97: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel108: TppLabel;
    ppLabel112: TppLabel;
    RptHitoricoCaixa: TppReport;
    ppHeaderBand23: TppHeaderBand;
    ppShape3: TppShape;
    ppLine50: TppLine;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppDetailBand24: TppDetailBand;
    ppFooterBand22: TppFooterBand;
    ppLine52: TppLine;
    ppLabel123: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    BdeHitoricoCaixa: TppBDEPipeline;
    ppShape51: TppShape;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppShape6: TppShape;
    ppDBText12: TppDBText;
    ppDBText27: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    pprListaAcoes: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppDetailBand25: TppDetailBand;
    ppFooterBand23: TppFooterBand;
    ppLine54: TppLine;
    ppLabel125: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    shpListaAcoesCabEmissor: TppShape;
    ppDBText40: TppDBText;
    ppLabel126: TppLabel;
    shpListaAcoesTitulo: TppShape;
    lblListaAcoesDetBolsa: TppLabel;
    lblListaAcoesTitInvestimento: TppLabel;
    lblListaAcoesTitCodBolsa: TppLabel;
    lblListaAcoesTitLote: TppLabel;

    shpListaAcoesDetalhe: TppShape;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    qryListaAcoes: TwwQuery;
    qryListaAcoesEMISSOR: TStringField;
    qryListaAcoesBOLSA: TStringField;
    qryListaAcoesDESCINVESTIMENTO: TStringField;
    qryListaAcoesTIPO: TStringField;
    qryListaAcoesCODIGO: TStringField;
    qryListaAcoesLOTE: TFloatField;
    lblListaAcoesTitTipo: TppLabel;
    RptGerCartSintetico: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppLine14: TppLine;
    RptGerCartSinteticoLine1: TppLine;
    RptGerCartSinteticoLabel3: TppLabel;
    RptGerCartSinteticoLabel4: TppLabel;
    RptGerCartSinteticoLabel5: TppLabel;
    RptGerCartSinteticoLabel6: TppLabel;
    LblCustos: TppLabel;
    ppDetailBand8: TppDetailBand;
    RptGerCartSinteticoLabel9: TppLabel;
    RptGerCartSinteticoDBText3: TppDBText;
    LblCarregamento: TppDBText;
    RptGerCartSinteticoDBText4: TppDBText;
    LblAquisicao: TppDBText;
    LblAtuarial: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine15: TppLine;
    ppLabel21: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    RptGerCartSinteticoGroup1: TppGroup;
    RptGerCartSinteticoGroupHeaderBand1: TppGroupHeaderBand;
    RptGerCartSinteticoGroupFooterBand1: TppGroupFooterBand;
    RptGerCartSinteticoLabel8: TppLabel;
    RptGerCartSinteticoDBText1: TppDBText;
    RptGerCartSinteticoLine2: TppLine;
    RptGerCartSinteticoDBText2: TppDBText;
    RptGerCartSinteticoLabel11: TppLabel;
    TotSaldoCar: TppDBCalc;
    RptGerCartSinteticoDBCalc3: TppDBCalc;
    TotSaldoAqui: TppDBCalc;
    TotSaldoAtu: TppDBCalc;
    LblTotEmpr: TppLabel;
    RptGerCartSinteticoLine3: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLabel115: TppLabel;
    pplListaAcoes: TppBDEPipeline;
    dsListaAcoes: TwwDataSource;
    ppSummaryBand5: TppSummaryBand;
    ppShape5: TppShape;
    ppShape7: TppShape;
    ppShape9: TppShape;
    ppShape32: TppShape;
    ppShape33: TppShape;
    ppShape35: TppShape;
    lblTitPersInd: TppLabel;
    ppLabel260: TppLabel;
    ppShape37: TppShape;
    ppLabel218: TppLabel;
    lblIndicador: TppLabel;
    lblValorizacao: TppLabel;
    lblPerIndicador: TppLabel;
    lblPerSind: TppLabel;
    ppLine121: TppLine;
    ppLine122: TppLine;
    ppLine125: TppLine;
    ppLabel261: TppLabel;
    ppLine130: TppLine;
    ppShape8: TppShape;
    ppLabel127: TppLabel;
    ppDBText46: TppDBText;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppDBText47: TppDBText;
    ppDBCalc4: TppDBCalc;
    ppLabel130: TppLabel;
    ppDBText48: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel131: TppLabel;
    ppDBText49: TppDBText;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    qryMemoriaTAXA: TFloatField;
    ppDBText50: TppDBText;
    ppFooterBand20: TppFooterBand;
    ppLine42: TppLine;
    ppLabel90: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel96: TppLabel;
    ppLine44: TppLine;
    ppLine53: TppLine;
    ppLabel132: TppLabel;
    lblEQM: TppLabel;
    ppLabel133: TppLabel;
    ppDBText51: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLCarteiraEmissor: TppLabel;
    LblPeriodo: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel31: TppLabel;
    ppLabel137: TppLabel;
    pplCarteiraContabil: TppLabel;
    pplDataReferencia: TppLabel;
    ppDBImage3: TppDBImage;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLCarteiraAcoesEmiBolsa: TppLabel;
    ppLPeriodoAcoesEmiBolsa: TppLabel;
    ppDBImage4: TppDBImage;
    ppLabel116: TppLabel;
    ppLabel124: TppLabel;
    ppCarteiraCxa: TppLabel;
    ppLDataCxa: TppLabel;
    ppDBImage5: TppDBImage;
    ppLabel69: TppLabel;
    ppLabel113: TppLabel;
    ppLCarteiraRendaFixa: TppLabel;
    RptRentRendaFixaDtIni: TppLabel;
    ppDBImage6: TppDBImage;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLCarteiraOperBoleta: TppLabel;
    RptResumoOperDataRef: TppLabel;
    ppDBImage7: TppDBImage;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLCarteiraCustoCarteira: TppLabel;
    lbDataRefC: TppLabel;
    ppDBImage8: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBImage9: TppDBImage;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLCarteiraCotacaoInvest: TppLabel;
    ppLPeriodoCotacaoInvest: TppLabel;
    ppDBImage10: TppDBImage;
    ppLabel136: TppLabel;
    ppLabel139: TppLabel;
    ppLCarteiraClassFinanc: TppLabel;
    RptEnquadraRenFixaDataRef1: TppLabel;
    ppDBImage11: TppDBImage;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLCarteiraAplFinanc: TppLabel;
    RptBoletaRenFixaDataRef: TppLabel;
    ppDBImage12: TppDBImage;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLCarteiraCompGerAcoes: TppLabel;
    RptGerCarteiraLabel2: TppLabel;
    ppDBImage13: TppDBImage;
    lblNomeRelatorio: TppLabel;
    ppLabel13: TppLabel;
    ppLCarteiraMoeda: TppLabel;
    ppDBImage14: TppDBImage;
    ppLabel12: TppLabel;
    ppLabel85: TppLabel;
    ppLCarteiraDemoAnalitEnqApl: TppLabel;
    RptEnquadraRenFixaDataRef: TppLabel;
    ppDBImage15: TppDBImage;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLCarteiraVarInvest: TppLabel;
    ppPeriodoVarInvest: TppLabel;
    ppDBImage16: TppDBImage;
    ppLine30: TppLine;
    ppLabel2: TppLabel;
    ppLabel144: TppLabel;
    ppLCarteiraDetalhBoleta: TppLabel;
    lbDataRef: TppLabel;
    ppDBImage17: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel146: TppLabel;
    ppLCarteiraGerSintetico: TppLabel;
    RptGerCartSinteticoLabel2: TppLabel;
    ppDBImage18: TppDBImage;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLCarteiraLimBco: TppLabel;
    RptLimBancosDataRef: TppLabel;
    ppDBImage19: TppDBImage;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLCarteiraTIR: TppLabel;
    ppLabel55: TppLabel;
    ppDBImage20: TppDBImage;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    RptTIRAnaliticoCarteira: TppLabel;
    ppDBImage21: TppDBImage;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel54: TppLabel;
    ppLCarteiraGerLotes: TppLabel;
    RptCompGerLotesLabel2: TppLabel;
    ppDBImage22: TppDBImage;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLHistCaixa: TppLabel;
    ppDBImage23: TppDBImage;
    ppLCarteira: TppLabel;
    ppLPeriodo: TppLabel;
    ppDbLogo: TppDBImage;
    ppLabel7: TppLabel;
    ppLabel152: TppLabel;
    RptTIRSinteticoCarteira: TppLabel;
    ppDBImage25: TppDBImage;
    ppLabel88: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLCarteiraProvIR: TppLabel;
    ppDBImage26: TppDBImage;
    ppLabel22: TppLabel;
    RptRentRendaFixaDtFim: TppLabel;
    ppLabel83: TppLabel;
    ppLine38: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLine57: TppLine;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppLine68: TppLine;
    ppLine69: TppLine;
    RptVarMesCarteira: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    RptVarMesCarteiraLabel1: TppLabel;
    RptVarMesCarteiraLabel2: TppLabel;
    RptVarMesCarteiraLine1: TppLine;
    RptVarMesCarteiraLabel3: TppLabel;
    RptVarMesCarteiraLabel4: TppLabel;
    RptVarMesCarteiraLabel7: TppLabel;
    RptVarMesCarteiraLabel8: TppLabel;
    RptVarMesCarteiraLabel9: TppLabel;
    RptVarMesCarteiraLabel10: TppLabel;
    RptVarMesCarteiraLabel11: TppLabel;
    RptVarMesCarteiraLabel12: TppLabel;
    RptVarMesCarteiraLabel13: TppLabel;
    RptVarMesCarteiraLabel14: TppLabel;
    RptVarMesCarteiraLabel15: TppLabel;
    RptVarMesCarteiraLabel16: TppLabel;
    RptVarMesCarteiraLabel17: TppLabel;
    RptVarMesCarteiraLabel18: TppLabel;
    RptVarMesCarteiraLabel21: TppLabel;
    DetVarMesCarteira: TppDetailBand;
    RptVarMesCarteiraDBText2: TppDBText;
    RptVarMesCarteiraDBText3: TppDBText;
    RptVarMesCarteiraDBText4: TppDBText;
    RptVarMesCarteiraDBText5: TppDBText;
    RptVarMesCarteiraDBText6: TppDBText;
    RptVarMesCarteiraDBText7: TppDBText;
    RptVarMesCarteiraDBText8: TppDBText;
    RptVarMesCarteiraDBText10: TppDBText;
    RptVarMesCarteiraDBText11: TppDBText;
    RptVarMesCarteiraDBText13: TppDBText;
    RptVarMesCarteiraLabel20: TppLabel;
    RptVarMesCarteiraDBText9: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine5: TppLine;
    ppLabel23: TppLabel;
    ppCalc3: TppSystemVariable;
    ppCalc4: TppSystemVariable;
    RptVarMesCarteiraSummaryBand1: TppSummaryBand;
    RptVarMesCarteiraLabel19: TppLabel;
    RptVarMesCarteiraDBCalc2: TppDBCalc;
    RptVarMesCarteiraDBCalc7: TppDBCalc;
    RptVarMesCarteiraLine4: TppLine;
    RptVarMesCarteiraDBCalc8: TppDBCalc;
    RptVarMesCarteiraDBCalc9: TppDBCalc;
    RptVarMesCarteiraDBCalc10: TppDBCalc;
    RptVarMesCarteiraDBCalc12: TppDBCalc;
    RptVarMesCarteiralblVarMesAntTot: TppLabel;
    RptVarMesCarteiraGroup1: TppGroup;
    RptVarMesCarteiraGroupHeaderBand1: TppGroupHeaderBand;
    RptVarMesCarteiraLabel5: TppLabel;
    RptVarMesCarteiraDBText1: TppDBText;
    RptVarMesCarteiraLine2: TppLine;
    RptVarMesCarteiraGroupFooterBand1: TppGroupFooterBand;
    RptVarMesCarteiraLabel6: TppLabel;
    RptVarMesCarteiraDBCalc1: TppDBCalc;
    RptVarMesCarteiraDBCalc3: TppDBCalc;
    RptVarMesCarteiraLine3: TppLine;
    RptVarMesCarteiraDBCalc4: TppDBCalc;
    RptVarMesCarteiraDBCalc5: TppDBCalc;
    RptVarMesCarteiraDBCalc6: TppDBCalc;
    RptVarMesCarteiraDBCalc11: TppDBCalc;
    RptVarMesCarteiralblDifMesAnt: TppLabel;
    ppLabel95: TppLabel;
    DsHitoricoCaixa: TwwDataSource;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText34: TppDBText;
    ppLine71: TppLine;
    shpMapaVarMensal: TppShape;
    //AL_1
    ppDBImage24: TppDBImage;
    RptDetBoletaLabel13: TppLabel;
    RptDetBoletaLabel16: TppLabel;
    //AL_1 - Fim

    procedure RelatCotacoesInvestDetailBand1BeforePrint(Sender: TObject);
    procedure RelatCotacoesInvestGroupFooterBand1AfterPrint(Sender: TObject);
    procedure RelatConsInvestDBText1Print(Sender: TObject);
    procedure RptDetBoletaLabel15Print(Sender: TObject);
    procedure RptDetBoletaLabel16Print(Sender: TObject);
    procedure RptDetBoletaLabel17Print(Sender: TObject);
    procedure RptDetBoletaLabel19Print(Sender: TObject);
    procedure RptDetBoletaLabel18Print(Sender: TObject);
    procedure RptDetBoletaLabel21Print(Sender: TObject);
    procedure lbInvestimentoPrint(Sender: TObject);
    procedure lbLotePrint(Sender: TObject);
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure RptVarMesCarteiraLabel20Print(Sender: TObject);
    procedure RptGerCarteiraLabel16Print(Sender: TObject);
    procedure RptGerCarteiraLabel17Print(Sender: TObject);
    procedure RptGerCarteiraLabel18Print(Sender: TObject);
    procedure RptGerCarteiraLabel19Print(Sender: TObject);
    procedure RptProvisaoIRLabel15Print(Sender: TObject);
    procedure RptProvisaoIRLabel20Print(Sender: TObject);
    procedure RptProvisaoIRLabel13Print(Sender: TObject);
    procedure RptProvisaoIRLabel19Print(Sender: TObject);
    procedure RptDemCustoCarteiraLabel13Print(Sender: TObject);
    procedure RptDemCustoCarteiraLabel14Print(Sender: TObject);
    procedure RptGerCartSinteticoLabel9Print(Sender: TObject);
    procedure RptTIRAnaliticoGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppDetailBand11BeforePrint(Sender: TObject);
    procedure ppDetailBand6BeforePrint(Sender: TObject);
    procedure ppDetailBand8BeforePrint(Sender: TObject);
    procedure LblTotEmprPrint(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure ppDetailBand5AfterPrint(Sender: TObject);
    procedure RptListInvBeforePrint(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure RptBoletaRenFixaBeforePrint(Sender: TObject);
    procedure DmRelatoriosCreate(Sender: TObject);
    procedure DmRelatoriosDestroy(Sender: TObject);
    procedure TotMercadoPrint(Sender: TObject);
    procedure RptDemCustoCarteiraBeforePrint(Sender: TObject);
    procedure RptDetBoletaBeforePrint(Sender: TObject);
    procedure RptDetBoletaSummaryBand1BeforePrint(Sender: TObject);
    procedure RptDetBoletaSummaryBand1AfterPrint(Sender: TObject);
    procedure RptTIRAnaliticoSummaryBand1BeforeGenerate(Sender: TObject);
    procedure DetVarMesCarteiraBeforePrint(Sender: TObject);
    procedure RptGerCarteiraGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure qryLancContItensAfterRefresh(DataSet: TDataSet);
    procedure rptConsIndMoedaBeforePrint(Sender: TObject);
    procedure RptTIRSinteticoStartPage(Sender: TObject);
    procedure shpTIRSintDetPrint(Sender: TObject);
    procedure shpDetFluxoPrint(Sender: TObject);
    procedure qryLancContAfterScroll(DataSet: TDataSet);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure ppGroupHeaderBand1AfterPrint(Sender: TObject);
    procedure shpDetLancamentoPrint(Sender: TObject);
    procedure ppShape5Print(Sender: TObject);
    procedure ppShape51Print(Sender: TObject);
    procedure RptVarMesCarteiraStartPage(Sender: TObject);
    procedure shpMapaVarMensalPrint(Sender: TObject);

  private
    { Private declarations }
    QTDLOTE : double;
    Imprimiu : boolean;
    cCorZebra : TColor;    
  public
    { Public declarations }
    wTotSalEnquadramento, wTotQtdEnquadramento, wGanhoCapital:Double;
    ListaTotal       : TStringList;
    VetSaldoDiaData  : Array[1..100] of TDate;
    VetSaldoDiaVlr   : Array[1..100] of Double;
    function MostraParam(Form: String): boolean; OverRide;
    Function  ProcuraVetor(IdInvestimento:Integer):Boolean;
  end;

var
  DmRelatorios: TDmRelatorios;
  TotEmpr : integer;
  TotalMercado : double;
implementation

Uses FpRelCotacoesInvest, FpRelVariacoesInvest, FParamDetBoletas, FParamDemCustoCarteira,
     FpRelDemCustoCarteira, Math, FPARAMGERCARTCUST,UDiasUteisInv,UDiasUteis,
     FParamVarMesCarteira, FParamGerCarteira, FParamTIRSintetico, FParamTIRAnalitico,
     FParamGerCartSintetico, FParamProvisaoIR, FParamCompGerLotes, FPRelEnquadramento,
     dOperacaoInvest, FpRelValorIndic, FPVarMesCarteira, FParamLimBancos,
     FParamBoletaRenFixa, FParamEnquadraRenFixa, FParamRentRendaFixa, FParamResumoOper,
     FParamExtratoOper, Fparamboleta, FParamTIRAnalitMov,FConsLancCont,
  FConsHistCaixa, FConsHistCota, dOperComum;

Var
  wVarDia:Double;
  VetDescDesp      : Array[1..50]  of String;
  VetIDVlDesp      : Array[1..50,1..2] of Double;
  VetIdInvestimento: Array[0..30]  of Integer;
  I,J : Byte;
  wTotalOperacoes, wTotalDespesas, wTotalDespesasLiquido, wTotalLiquido, wValorLiquido,
  wTotalOperacao, wTotalOperacaoLiquido : Double;
  wSpace : String[50];
  wSitIRUlt, wSitIRAnt : Double;
  wIdCarteira, iInvestAnt : Integer;
  sLoteAnt   : String;
  dDataAnt   : TDate;
  iTeste     : Integer;
  sTeste     : String;
  wOprAnt    : Integer;
  JaImprimiu17, JaImprimiu19 :Boolean;



{$R *.DFM}

function TDmRelatorios.MostraParam(Form: string): boolean;
var frm : TForm;
begin
  if (UPPERCASE(Form) = 'FRMPRELVALORINDIC') then
    frm := TFrmpRelValorIndic.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPRELCOTACOESINVEST') then
    frm := TFrmpRelCotacoesInvest.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMGERCARTCUST') then
    frm := TFrmParamGerCartCust.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPRELVARIACOESINVEST') then
    frm := TFrmpRelVariacoesInvest.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMDETBOLETAS') then
    frm := TFrmParamDetBoletas.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMDEMCUSTOCARTEIRA') then
    frm := TFrmParamDemCustoCarteira.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMLIMBANCOS') then
    frm := TFrmParamLimBancos.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMBOLETARENFIXA') then
    frm := TFrmParamBoletaRenFixa.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMENQUADRARENFIXA') then
    frm := TFrmParamEnquadraRenFixa.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMRENTRENDAFIXA') then
    frm := TFrmParamRentRendaFixa.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMRESUMOOPER') then
    frm := TFrmParamResumoOper.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMEXTRATOOPER') then
    frm := TFrmParamExtratoOper.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMBOLETA') then
    frm := Tfrmparamboleta.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMVARMESCARTEIRA') then
    frm := TFrmParamVarMesCarteira.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMTIRSINTETICO') then
    frm := TFrmParamTirSintetico.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMGERCARTEIRA') then
    frm := TFrmParamGerCarteira.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMTIRANALITICO') then
    frm := TFrmParamTirAnalitico.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMGERCARTSINTETICO') then
    frm := TFrmParamGerCartSintetico.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMPROVISAOIR') then
    frm := TFrmParamProvisaoIR.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMCOMPGERLOTES') then
    frm := TFrmParamCompGerLotes.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPRELENQUADRAMENTO') then
    frm := TFrmPRelEnquadramento.Create(Application)
  else if (UPPERCASE(Form) = 'FRMPARAMTIRANALITMOV') then
    frm := TFrmParamTIRAnalitMov.Create(Application)
  else if (UPPERCASE(Form) = 'SEMPARAMETROS') then
  begin
    Result := True;
    qryListaAcoes.Open;
    Exit
  end
  else if (UPPERCASE(Form) = '') then
  begin
    Result := True;
    Exit;
  end
  else
    frm := nil;

  if frm = nil then
    Result := false
  else begin
    with frm do begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

//---------------------------------------------------------------------
// Antes de Imprimir Detalhe
procedure TDmRelatorios.RelatCotacoesInvestDetailBand1BeforePrint(Sender: TObject);
begin
  inherited;
  If (wVarDia <> 0) And (QryRelatCotacoes.FieldByName('VLRCONTABIL').AsFloat <> 0) Then Begin
    LbVarDia.Text:= FormatFloat('###,###,###,##0.00',
                               ((QryRelatCotacoes.FieldByName('VLRCONTABIL').AsFloat-wVarDia)
                               /QryRelatCotacoes.FieldByName('VLRCONTABIL').AsFloat)*100);
  End Else Begin
    LbVarDia.Text:= ' ';
  End;
  wVarDia:=QryRelatCotacoes.FieldByName('VLRCONTABIL').AsFloat;
end;

//---------------------------------------------------------------------
// Apos Imprimir o Rodape do Grupo
procedure TDmRelatorios.RelatCotacoesInvestGroupFooterBand1AfterPrint(Sender: TObject);
begin
  inherited;
  wVarDia:=0;
end;

//------------------------------------------------------------
// Ao Imprimir a Descricao do Investimento
procedure TDmRelatorios.RelatConsInvestDBText1Print(Sender: TObject);
Var
  wRegistro:Integer;
  wValInicial, wValFinal, wValVariacao:Double;
begin
  inherited;
  wValFinal  := 0;
// Guarda Dados
  wRegistro  :=QryRelatConsInvest.FieldByName('IDINVESTIMENTO').AsInteger;
  wValInicial:=QryRelatConsInvest.FieldByName('VLRCONTABIL').AsFloat ;
// Faz enquanto no mesmo investimento
  While (QryRelatConsInvest.FieldByName('IDINVESTIMENTO').AsInteger = wRegistro) And
        (Not QryRelatConsInvest.Eof) Do Begin
// Guarda Dados
    wValFinal:=QryRelatConsInvest.FieldByName('VLRCONTABIL').AsFloat;
// Proximo Registro
    QryRelatConsInvest.Next;
  End;

// Preenche Dados do Relatorio
  LblValInicial.Caption :=FormatFloat('###,###,###,##0.00###',wValInicial);
  LblValFinal.Caption   :=FormatFloat('###,###,###,##0.00###',wValFinal);

  wValVariacao :=((wValFinal/wValInicial)-1)*100;

  LblValVariacao.Caption:=FormatFloat('###,###,###,##0.00###',wValVariacao);

// Volta um Registro
  If Not QryRelatConsInvest.Eof Then QryRelatConsInvest.Prior;

end;

procedure TDmRelatorios.RptDetBoletaLabel15Print(Sender: TObject);
begin
  inherited;
  If wOprAnt <> QryDetBoleta.FieldByName('IDOPERACAOINVEST').AsInteger Then Begin
    RptDetBoletaLabel15.Caption := FormatFloat('###,###,##0.00',
      QryDetBoleta.FieldByName('VLROPERACAO').AsFloat);
    If (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'A') Or
       (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'V') Or
       (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'U') Or
       (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'M') Then Begin
      wTotalOperacao  := QryDetBoleta.FieldByName('VLROPERACAO').AsFloat;
      wTotalOperacaoLiquido := wTotalOperacaoLiquido+QryDetBoleta.FieldByName('VLROPERACAO').AsFloat;
    End Else If (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'D') Or
                (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'S') Or
                (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'O') Or
                (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'R') Or
                (QryDetBoleta.FieldByName('NATUREZAOPERACAO').AsString = 'I') Then Begin
      wTotalOperacao  := (QryDetBoleta.FieldByName('VLROPERACAO').AsFloat*-1);
      wTotalOperacaoLiquido := wTotalOperacaoLiquido-QryDetBoleta.FieldByName('VLROPERACAO').AsFloat;
    End;
    wTotalOperacoes := wTotalOperacoes+QryDetBoleta.FieldByName('VLROPERACAO').AsFloat;
    wOprAnt         := QryDetBoleta.FieldByName('IDOPERACAOINVEST').AsInteger;
  End;
end;

procedure TDmRelatorios.RptDetBoletaLabel16Print(Sender: TObject);
begin
  inherited;
  wValorLiquido:=wTotalOperacao+Abs(wTotalDespesas);
  RptDetBoletaLabel16.Caption := FormatFloat('###,###,###,##0.00', Abs(wValorLiquido));
  wTotalOperacao:=0;
  wTotalDespesas:=0;
end;

procedure TDmRelatorios.RptDetBoletaLabel17Print(Sender: TObject);
begin
  inherited;
  If Not JaImprimiu17 Then Begin
    RptDetBoletaLabel17.Caption := FormatFloat('###,###,###,##0.00', wTotalOperacoes );
    wTotalOperacoes := 0;
    JaImprimiu17    := True;
  End;
end;

procedure TDmRelatorios.RptDetBoletaLabel19Print(Sender: TObject);
begin
  inherited;
  If Not JaImprimiu19 Then Begin
    RptDetBoletaLabel19.Caption := FormatFloat('###,###,###,##0.00', Abs(wTotalLiquido));
    wTotalOperacaoLiquido :=0;
    wTotalDespesasLiquido :=0;
    JaImprimiu19          := True;
  End;
end;

procedure TDmRelatorios.RptDetBoletaLabel18Print(Sender: TObject);
begin
  inherited;
  wTotalLiquido := wTotalOperacaoLiquido + Abs(wTotalDespesasLiquido);
  If (wTotalLiquido < 0) Then
    RptDetBoletaLabel18.Caption :='Total a Receber '
  Else
    RptDetBoletaLabel18.Caption :='Total a Pagar';
end;

procedure TDmRelatorios.RptDetBoletaLabel21Print(Sender: TObject);
Var
   I : Integer;
begin
  inherited;
  RptDetBoletaLabel21.Caption := FormatFloat('###,###,###,##0.00', QryDetBoleta.FieldByName( 'VLRDESPOPER' ).AsFloat );
  J := 0;
  I := 1;
  For I := 1 To 50 Do Begin
    If QryDetBoleta.FieldByName( 'IDTIPODESPINVEST' ).AsInteger = VetIDVlDesp[I,1] Then Begin
      VetIDVlDesp[I,2] := VetIDVlDesp[I,2] + QryDetBoleta.FieldByName( 'VLRDESPOPER' ).AsFloat;
      Break;
    End;
    If VetIDVlDesp[I,1] = 0 Then Begin
        J := I;
        break;
    End;
  End;
  If J <> 0 Then Begin
     VetIDVlDesp[I,1] := QryDetBoleta.FieldByName( 'IDTIPODESPINVEST' ).AsInteger;
     VetIDVlDesp[I,2] := QryDetBoleta.FieldByName( 'VLRDESPOPER' ).AsFloat;
     VetDescDesp[I]   := QryDetBoleta.FieldByName( 'DESCTIPODESPINV' ).AsString;
  End;

// Calcula Total de Despesa de Acordo com o tipo de Natureza
  If (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'A') Or
     (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'V') Or
     (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'M') Then Begin

    wTotalDespesasLiquido := wTotalDespesasLiquido + QryDetBoleta.FieldByName('VLRDESPOPER').AsFloat;
    wTotalDespesas        := wTotalDespesas        + QryDetBoleta.FieldByName('VLRDESPOPER').AsFloat;
  End Else If (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'D') Or
              (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'S') Or
              (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'E') Or
              (QryDetBoleta.FieldByName('DESPNATUR').AsString = 'I') Then Begin
    wTotalDespesas        := wTotalDespesas        - QryDetBoleta.FieldByName('VLRDESPOPER').AsFloat;
    wTotalDespesasLiquido := wTotalDespesasLiquido - QryDetBoleta.FieldByName('VLRDESPOPER').AsFloat;
  End;
end;

procedure TDmRelatorios.lbInvestimentoPrint(Sender: TObject);
begin
  inherited;
  if (QryTIRAnalitico.FieldByName('IDINVESTIMENTO').AsInteger   = iInvestAnt) then
     lbInvestimento.Caption := ''
  else
     lbInvestimento.Caption := QryTIRAnalitico.FieldByName('DESCINVESTIMENTO').AsString;

end;

procedure TDmRelatorios.lbLotePrint(Sender: TObject);
begin
  inherited;
  if (QryTIRAnalitico.FieldByName('IDINVESTIMENTO').AsInteger   = iInvestAnt) and
     (QryTIRAnalitico.FieldByName('IDLOTE').AsString            = sLoteAnt)   then
     lbLote.Caption := ''
  else
     lbLote.Caption := QryTIRAnalitico.FieldByName('IDLOTE').AsString;

  iInvestAnt := QryTIRAnalitico.FieldByName('IDINVESTIMENTO').AsInteger;
  sLoteAnt   := QryTIRAnalitico.FieldByName('IDLOTE').AsString;

end;

procedure TDmRelatorios.ppDetailBand7BeforePrint(Sender: TObject);
begin
  inherited;
  ppDetailBand7.Visible := Not (QryTIRAnalitico.FieldByName('SALDODIA').AsFloat = 0);
end;

procedure TDmRelatorios.RptVarMesCarteiraLabel20Print(Sender: TObject);
begin
  inherited;
  if QryVarMesCarteira.FieldByName('TOTCART').AsFloat <> 0 then
     RptVarMesCarteiraLabel20.Text:= FormatFloat('###,###,##0.00',
                                    ((QryVarMesCarteira.FieldByName('SALDOVLRINVCART').AsFloat
                                    / QryVarMesCarteira.FieldByName('TOTCART').AsFloat)*100))
  else
     RptVarMesCarteiraLabel20.Text:= FormatFloat('###,###,##0.00', 0);
end;

procedure TDmRelatorios.RptGerCarteiraLabel16Print(Sender: TObject);
begin
  inherited;
    if qryGerCarteira.FieldByName('QTDTITLOTE').AsFloat = 0 then
       QtdLote := 1
    else
       QtdLote := qryGerCarteira.FieldByName('QTDTITLOTE').AsFloat;

    if DmRelatorios.LblLote.Caption = 'Cotação por Lote' then
       RptGerCarteiraLabel16.Text :=   FormatFloat('###,###,##0.00', (qryGerCarteira.FieldByName('COTACAO').AsFloat
                                      * qryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat)
                                      /QtdLote)
    else
       RptGerCarteiraLabel16.Text :=   FormatFloat('###,###,##0.00', (qryGerCarteira.FieldByName('COTACAO').AsFloat
                                      * qryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat));

end;

procedure TDmRelatorios.RptGerCarteiraLabel17Print(Sender: TObject);
begin
  inherited;
  if qryGerCarteira.FieldByName('TOTCART').AsFloat <> 0 then
     RptGerCarteiraLabel17.Text:= FormatFloat('###,###,##0.00', ((
                                    qryGerCarteira.FieldByName('COTACAOAUX').AsFloat
                                  * qryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / qryGerCarteira.FieldByName('TOTCART').AsFloat)*100))
  else
     RptGerCarteiraLabel17.Text := '0,00';
end;

procedure TDmRelatorios.RptGerCarteiraLabel18Print(Sender: TObject);
begin
  inherited;
  if QryGerCarteira.FieldByName('TOTACAOTIPO').AsFloat <> 0 then
     RptGerCarteiraLabel18.Text:= FormatFloat('###,###,##0.00', ((QryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / QryGerCarteira.FieldByName('TOTACAOTIPO').AsFloat)*100))
  else
     RptGerCarteiraLabel18.Text:= '';
end;

procedure TDmRelatorios.RptGerCarteiraLabel19Print(Sender: TObject);
begin
  inherited;
  if QryGerCarteira.FieldByName('TOTACAO').AsFloat <> 0 then
     RptGerCarteiraLabel19.Text:= FormatFloat('###,###,##0.00', ((QryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat
                                  / QryGerCarteira.FieldByName('TOTACAO').AsFloat)*100))
  else
     RptGerCarteiraLabel19.Text:= '';
end;

procedure TDmRelatorios.RptProvisaoIRLabel15Print(Sender: TObject);
begin
  inherited;
  RptProvisaoIRLabel15.Text:= FormatFloat('###,###,##0.00',
                                          (QryProvisaoIR.FieldByName('SALDOVLRCARTINV').AsFloat
                                         - QryProvisaoIR.FieldByName('SALDOAQUI').AsFloat));
end;

procedure TDmRelatorios.RptProvisaoIRLabel20Print(Sender: TObject);
begin
  inherited;
  wSitIRUlt := (QryProvisaoIR.FieldByName('SALDOVLRCARTINV').AsFloat
              - QryProvisaoIR.FieldByName('SALDOAQUI').AsFloat)
              * wGanhoCapital / 100;
  RptProvisaoIRLabel20.Text:= FormatFloat('###,###,##0.00', wSitIRUlt);
end;

procedure TDmRelatorios.RptProvisaoIRLabel13Print(Sender: TObject);
begin
  inherited;
  RptProvisaoIRLabel13.Text:= FormatFloat('##0.00', wGanhoCapital);
end;

procedure TDmRelatorios.RptProvisaoIRLabel19Print(Sender: TObject);
begin
  inherited;
  wSitIRUlt := (QryProvisaoIR.FieldByName('SALDOVLRCARTINV').AsFloat
              - QryProvisaoIR.FieldByName('SALDOAQUI').AsFloat)
              * wGanhoCapital / 100;
  wSitIRAnt := (QryProvisaoIR.FieldByName('SALDOVLRANT').AsFloat
              - QryProvisaoIR.FieldByName('SALDOAQUIANT').AsFloat)
              * wGanhoCapital / 100;

  RptProvisaoIRLabel19.Text:= FormatFloat('###,###,##0.00', (wSitIRUlt - wSitIRAnt));
end;

procedure TDmRelatorios.RptDemCustoCarteiraLabel13Print(Sender: TObject);
begin
  inherited;
  RptDemCustoCarteiraLabel13.Text:= FormatFloat('###,###,##0.00', (
                                             qryDemCustoCarteira.FieldByName('COTACAO').AsFloat
                                           * qryDemCustoCarteira.FieldByName('SALDOQTDEINVCART').AsFloat));

  TotalMercado := TotalMercado + (qryDemCustoCarteira.FieldByName('COTACAO').AsFloat *
                                  qryDemCustoCarteira.FieldByName('SALDOQTDEINVCART').AsFloat);
end;

procedure TDmRelatorios.RptDemCustoCarteiraLabel14Print(Sender: TObject);
begin
  inherited;
  if qryDemCustoCarteira.FieldByName('SALDOCAR').AsFloat <> 0 then
     RptDemCustoCarteiraLabel14.Text:= FormatFloat('###,###,##0.00',(
                                             (qryDemCustoCarteira.FieldByName('COTACAO').AsFloat
                                           * qryDemCustoCarteira.FieldByName('SALDOQTDEINVCART').AsFloat
                                           / qryDemCustoCarteira.FieldByName('SALDOCAR').AsFloat) - 1) * 100)
  else
     RptDemCustoCarteiraLabel14.Text:= FormatFloat('###,###,##0.00', 0);
end;

procedure TDmRelatorios.RptGerCartSinteticoLabel9Print(Sender: TObject);
begin
  inherited;
  if qryGerCartSintetico.FieldByName('TOTCART').AsFloat <> 0 then
     RptGerCartSinteticoLabel9.Text:= FormatFloat('###,###,##0.00', (
                                   (qryGerCartSintetico.FieldByName('VALORMERCADO').AsFloat
                                  / qryGerCartSintetico.FieldByName('TOTCART').AsFloat)*100))
  else
     RptGerCartSinteticoLabel9.Text:= FormatFloat('###,###,##0.00', 0);
end;

procedure TDmRelatorios.RptTIRAnaliticoGroupHeaderBand1BeforePrint(
  Sender: TObject);
begin
  inherited;
end;

//------------------------------------------------------------------------------
// Relatorio de Enquadramento
procedure TDmRelatorios.ppDetailBand11BeforePrint(Sender: TObject);
Var
  I, wIdInvestimento, wIdCarteiraInvest:Integer;
  wQtdMeses, wValMeses:Array[1..3] Of Double;
  wCodClass:String;
begin
  inherited;
// Guarda o Investimento
  wIdInvestimento  :=QryEnquadramento.FieldByName('IDINVESTIMENTO').AsInteger;
  wIdCarteiraInvest:=QryEnquadramento.FieldByName('IDCARTEIRAINVEST').AsInteger;
  wCodClass        :=QryEnquadramento.FieldByName('CODCLASSINVEST').AsString;
  LbDescInvestimento.Caption:= '';
// Inicia os Vetores
  wValMeses[1]  :=  0.00;
  wValMeses[2]  :=  0.00;
  wValMeses[3]  :=  0.00;
  wQtdMeses[1]  :=  0.00;
  wQtdMeses[2]  :=  0.00;
  wQtdMeses[3]  :=  0.00;
  LbMes1.Caption:= '0.00';
  LbMes2.Caption:= '0.00';
  LbMes3.Caption:= '0.00';
  LbMes4.Caption:= '0.00';
  LbMes5.Caption:= '0.00';
  LbMes6.Caption:= '0.00';
  I:=3;
// Computa os Tres Registros de Detalhe
  While (QryEnquadramento.FieldByName('IDINVESTIMENTO').AsInteger  = wIdInvestimento)   And
        (QryEnquadramento.FieldByName('IDCARTEIRAINVEST').AsInteger= wIdCarteiraInvest) And
        (QryEnquadramento.FieldByName('CODCLASSINVEST').AsString   = wCodClass)         And
        (Not QryEnquadramento.EOF) Do Begin
// Preenche descricao com o investimento ou com a Classificacao
    If Trim(QryEnquadramento.FieldByName('DESCINVESTIMENTO').AsString) <> '' Then Begin
      LbDescInvestimento.Font.Style:=[];
      PnlFundoDetalhe.Brush.Color:=ClWhite;
      LbDescInvestimento.Caption :=QryEnquadramento.FieldByName('DESCINVESTIMENTO').AsString;
    End Else Begin
      LbDescInvestimento.Font.Style:=[FsBold];
      PnlFundoDetalhe.Brush.Color:=ClSilver;
      LbDescInvestimento.Caption :=QryEnquadramento.FieldByName('DESCCLASSINVEST').AsString;
    End;
    wValMeses[I]:= QryEnquadramento.FieldByName('SALDOCLASSCART').AsFloat;
    wQtdMeses[I]:= QryEnquadramento.FieldByName('SALDOQTDCLASSCART').AsFloat;
// Proximo Registro
    QryEnquadramento.Next;
    Dec(I);
  End;

// Volta um Registro
  If Not QryEnquadramento.Eof Then QryEnquadramento.Prior;

// Preenche Valores dos Meses
  If Trim(QryEnquadramento.FieldByName('DESCINVESTIMENTO').AsString) <> '' Then Begin
    LbMes1.Caption:= FormatFloat('###,###,###,##0.00',wQtdMeses[1]);
    LbMes2.Caption:= FormatFloat('###,###,###,##0.00',wQtdMeses[2]);
    LbMes3.Caption:= FormatFloat('###,###,###,##0.00',wQtdMeses[3]);
  End Else Begin
    LbMes1.Caption:= '0.00';
    LbMes2.Caption:= '0.00';
    LbMes3.Caption:= '0.00';
  End;
// Preenche Qtds dos Meses
  LbMes4.Caption:= FormatFloat('###,###,###,##0.00',wValMeses[1]);
  LbMes5.Caption:= FormatFloat('###,###,###,##0.00',wValMeses[2]);
  LbMes6.Caption:= FormatFloat('###,###,###,##0.00',wValMeses[3]);
// Preenche o Percentual da Aplicacao e Diversificacao
  If wTotSalEnquadramento > 0 Then
    LbPerAplic.Caption:= FormatFloat('###,###,###,##0.00',((wValMeses[3]/wTotSalEnquadramento)*100))
  Else
    LbPerAplic.Caption:= FormatFloat('###,###,###,##0.00',0);
end;

// Fim Relatorio de Enquadramento
//------------------------------------------------------------------------------

procedure TDmRelatorios.ppDetailBand6BeforePrint(Sender: TObject);
begin
 inherited;
  If qryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat = 0 then
    ppDetailBand6.Visible := false
  else
    ppDetailBand6.Visible := True;
end;

procedure TDmRelatorios.ppDetailBand8BeforePrint(Sender: TObject);
begin
  inherited;
  If qryGerCartSintetico.FieldByName('VALORMERCADO').AsFloat = 0 Then
  begin
     ppDetailBand8.Visible := False
  end
  else
  begin
      ppDetailBand8.Visible := True;
      TotEmpr := TotEmpr + 1;
  end;
end;

procedure TDmRelatorios.LblTotEmprPrint(Sender: TObject);
begin
  inherited;
  LblTotEmpr.Caption  := IntToStr(TotEmpr);
  TotEmpr := 0; 
end;

procedure TDmRelatorios.ppDetailBand4BeforePrint(Sender: TObject);
begin
  inherited;
  ppDetailBand4.Visible := True;
  if qryTIRSintetico.FieldByName('FLGERRO').AsString = 'S' then begin
     LblErroCalc.Visible  := True;
     RptTIRSinteticoDBText5.Visible  := False;
  end else begin
     If qryTIRSintetico.FieldByName('FLGERRO').AsString = '*' then begin
         ppDetailBand4.Visible := False;
     End Else Begin
         LblErroCalc.Visible   := False;
         RptTIRSinteticoDBText5.Visible  := True;
     End;
  end;

  LblErroCalc.Visible   := False;
  RptTIRSinteticoDBText5.Visible  := False;
end;

procedure TDmRelatorios.ppDetailBand5AfterPrint(Sender: TObject);
Var
  RecCotacoes : TRecCotacoes;
begin
  inherited;
// Busca Cotacao do Investimento na Data da Operacao
  RecCotacoes :=
    OperacaoInvest.BuscaCotacoesAcao(QryListInv.FieldByName('IDINVESTIMENTO').AsInteger,
                                     QryListInv.FieldByName('IDBOLSAVALORES').AsInteger,
                                     QryListInv.FieldByName('DATAOPERACAO').AsDateTime, False);

  If ProcuraVetor(QryListInv.FieldByName('IDINVESTIMENTO').AsInteger) Then Begin
    If RecCotacoes.DataCotacao = 0 Then Begin
      RptListInvLine2.Visible := False;
      MemoCotacoes.Lines.Add(
        Alinha(Copy(QryListInv.FieldByName('DESCINVESTIMENTO').AsString,1, 10),10,'E',' ') +
        '  -  COTAÇÃO NÃO ENCONTRADA ');
    End Else Begin
      If MemoCotacoes.Lines.Count <= 1 Then Begin
        MemoCotacoes.Lines.Add('Investimento    Dt.Cotação    '+
                               'Abertura   Fechamento  Máxima   '+
                               ' Minima       Média      Vol.Negociado');
        MemoCotacoes.Lines.Add(' ');
      End;
      MemoCotacoes.Lines.Add(
        Alinha(Copy(QryListInv.FieldByName('DESCINVESTIMENTO').AsString,1, 10),16,'E',' ')+
        DateToStr(RecCotacoes.DataCotacao)                   +
        Alinha(FormatFloat('##,###,###,##0.00', RecCotacoes.VlrAbertura),12,'D',' ')   +
        Alinha(FormatFloat('##,###,###,##0.00', RecCotacoes.VlrFechamento),13,'D',' ') +
        Alinha(FormatFloat('##,###,###,##0.00', RecCotacoes.VlrMaxima),8,'D',' ')      +
        Alinha(FormatFloat('##,###,###,##0.00', RecCotacoes.VlrMinima),10,'D',' ')     +
        Alinha(FormatFloat('##,###,###,##0.00', RecCotacoes.VlrMedia),12,'D',' ')      +
        Alinha(FormatFloat('##,###,###,##0.00', RecCotacoes.VolNegociado),19,'D',' '));

    End;
  End;
end;

Function TDmRelatorios.ProcuraVetor(IdInvestimento:Integer):Boolean;
Var
  I:Integer;
Begin
  Result :=True;
  For I:= 0 To 30 Do Begin

    If VetIdInvestimento[I] = 0 Then Break;

    If VetIdInvestimento[I] = IdInvestimento Then Begin
      Result := False;
    End;
  End;
  If Result = True Then Begin
    VetIdInvestimento[I] := IdInvestimento
  End;
End;

procedure TDmRelatorios.RptListInvBeforePrint(Sender: TObject);
Var
  I:Integer;
begin
  inherited;
  MemoCotacoes.Lines.Clear;
  For I:= 0 To 30 Do Begin
    VetIdInvestimento[I]:= 0;
  End;
end;

procedure TDmRelatorios.ppDetailBand3BeforePrint(Sender: TObject);
 var ValorJuros : double;
 iIntervalo : integer;
begin
  inherited;
  ValorJuros := 0;
  // deixar os campos de juros
  // Se o TipoOperacao =  'D' (venda), os campos Prazo, Taxa e observação não aparecem

   If QryBoletaRenFixa.FieldByName('NATUREZAOPERACAO').AsString = 'D' Then Begin
      RptBoletaRenFixaMemo1.Visible    := False;
      RptBoletaRenFixaMemo2.Visible    := False;
      RptBoletaRenFixaDBText6.Visible  := False;
      RptBoletaRenFixaDBMemo2.Visible  := False;
   End Else Begin
      RptBoletaRenFixaMemo1.Visible    := True;
      RptBoletaRenFixaMemo2.Visible    := True;
      RptBoletaRenFixaDBText6.Visible  := True;
      RptBoletaRenFixaDBMemo2.Visible  := True;

   End;
   // Calcula taxa Efetiva do Juro
   if QryBoletaRenFixa.FieldByName('TAMPERJUROS').AsInteger  = 252 then // DU
   iIntervalo   := DiasUteisInv.IntervaloDiasUteis(
                      QryBoletaRenFixa.FieldByName('DATAOPERACAO').AsDateTime,
                      QryBoletaRenFixa.FieldByName('DATAOPERACAO').AsDateTime+
                      QryBoletaRenFixa.FieldByName('PRZVENC').AsFloat,
                      -1, 1, '',True, False, False)
   else // DC
      iIntervalo := DiasUteisInv.IntervaloDias(
                       QryBoletaRenFixa.FieldByName('DATAOPERACAO').AsDateTime,
                       QryBoletaRenFixa.FieldByName('DATAOPERACAO').AsDateTime+
                       QryBoletaRenFixa.FieldByName('PRZVENC').AsFloat);
   If QryBoletaRenFixa.FieldByName('EFETNOMI').AsString = 'E' Then
      ValorJuros := Power( ( 1 + (QryBoletaRenFixa.FieldByName('JUROSDIA').AsFloat/100)), iIntervalo)
   Else
      ValorJuros := (1 + (QryBoletaRenFixa.FieldByName('JurosDia').AsFloat))*iIntervalo;
   ValorJuros := StrToFloat(FormatFloat('#0.00000000',ValorJuros));
   if ValorJuros > 0 then
   begin
      ValorJuros := (ValorJuros -1) * 100;
      ValorJuros := StrToFloat(FormatFloat('#0.00000000',ValorJuros));
   end;

// Limpa Memo com as Taxas e Descricoes   -- Augusto 29/01/01
  RptBoletaRenFixaMemo1.Lines.Clear;
  RptBoletaRenFixaMemo2.Lines.Clear;

  If ((QryBoletaRenFixa.FieldByName('INDEXRENFIX').IsNull) and (Imprimiu = False)) Then Begin


    If (QryBoletaRenFixa.FieldByName('INDEXRENFIX').IsNull) Or (QryBoletaRenFixa.FieldByName('INDEXRENFIX').AsFloat = 0) Then Begin
       RptBoletaRenFixaMemo1.Lines.Add('   ');
       RptBoletaRenFixaMemo2.Lines.Add('   ');
    End Else Begin
       RptBoletaRenFixaMemo1.Lines.Add('JUROS');
       RptBoletaRenFixaMemo2.Lines.Add(FormatFloat('##0.00000000',
         QryBoletaRenFixa.FieldByName('INDEXRENFIX').AsFloat) +' % '+
         QryBoletaRenFixa.FieldByName('DESCTIPJUROS').AsString );
    End;
    If ValorJuros <> 0 Then Begin
       RptBoletaRenFixaMemo1.Lines.Add('   Taxa Efetiva');
       RptBoletaRenFixaMemo2.Lines.Add(FormatFloat('##0.00000000', ValorJuros) +' % ');
    End;

    If (QryBoletaRenFixa.FieldByName('TAXAOVER').AsFloat = 0) Or (QryBoletaRenFixa.FieldByName('TAXAOVER').IsNull) Then Begin
       RptBoletaRenFixaMemo1.Lines.Add('  ');
       RptBoletaRenFixaMemo2.Lines.Add('  ');
    End Else Begin
       RptBoletaRenFixaMemo1.Lines.Add('   Taxa Over');
       RptBoletaRenFixaMemo2.Lines.Add(FormatFloat('##0.00000000',
       QryBoletaRenFixa.FieldByName('TAXAOVER').AsFloat) +' %');
    End;

    If (QryBoletaRenFixa.FieldByName('JUROSRENFIX').AsFloat <> 0) Then Begin
       RptBoletaRenFixaMemo1.Lines.Add('   Taxa Anual');
       RptBoletaRenFixaMemo2.Lines.Add(FormatFloat('##0.00######',
         QryBoletaRenFixa.FieldByName('JUROSRENFIX').AsFloat) +' %');
    End;

  End Else Begin
    if (QryBoletaRenFixa.FieldByName('INDEXRENFIX').AsInteger <> 0) and (Imprimiu = False) Then Begin
      RptBoletaRenFixaMemo1.Lines.Add('INDICE');
      RptBoletaRenFixaMemo2.Lines.Add(QryBoletaRenFixa.FieldByName('MOEDESC').AsString);
      If Not (QryBoletaRenFixa.FieldByName('INDEXRENFIX').isNull) Then Begin
        RptBoletaRenFixaMemo1.Lines.Add('PERC. INDX.');
        RptBoletaRenFixaMemo2.Lines.Add(FormatFloat('##0.00000000', QryBoletaRenFixa.FieldByName('PERCINDEX').AsFloat));
      End;

      If (QryBoletaRenFixa.FieldByName('JUROSRENFIX').IsNull) Or (QryBoletaRenFixa.FieldByName('JUROSRENFIX').AsFloat = 0)Then Begin
         RptBoletaRenFixaMemo1.Lines.Add('  ');
         RptBoletaRenFixaMemo2.Lines.Add('  ');
      End Else Begin
         RptBoletaRenFixaMemo1.Lines.Add('JUROS');
         RptBoletaRenFixaMemo2.Lines.Add(FormatFloat('##0.00000000', QryBoletaRenFixa.FieldByName('JUROSRENFIX').AsFloat) +' % '+QryBoletaRenFixa.FieldByName('DESCTIPJUROS').AsString);
      End;
    End;

  End;
end;

procedure TDmRelatorios.RptBoletaRenFixaBeforePrint(Sender: TObject);
begin
  inherited;
  Imprimiu := False;
  RptBoletaRenFixaMemo1.Lines.Clear;
  RptBoletaRenFixaMemo2.Lines.Clear;
end;

procedure TDmRelatorios.DmRelatoriosCreate(Sender: TObject);
begin
  inherited;
  DmRelatorios.ListaTotal := TStringList.Create;
end;

procedure TDmRelatorios.DmRelatoriosDestroy(Sender: TObject);
begin
  inherited;
  If DmRelatorios.ListaTotal <> Nil Then
     DmRelatorios.ListaTotal.Free;
end;

procedure TDmRelatorios.TotMercadoPrint(Sender: TObject);
begin
  inherited;
  TotMercado.Text := FormatFloat('###,###,###,##0.00',TotalMercado);
  TotalMercado    := 0;
end;

procedure TDmRelatorios.RptDemCustoCarteiraBeforePrint(Sender: TObject);
begin
  inherited;
  TotalMercado :=0;
end;

procedure TDmRelatorios.RptDetBoletaBeforePrint(Sender: TObject);
Var
   I : Integer;
begin
  inherited;
  I := 1;
  For I := 1 To 50 Do
    Begin
        if VetIDVlDesp[I,1] = 0 then break;
        VetDescDesp[I]   := '';
        VetIDVlDesp[I,1] := 0;
        VetIDVlDesp[I,2] := 0;
    End;
    wTotalLiquido:=0;
    wTotalDespesasLiquido := 0;
    wTotalOperacaoLiquido := 0;
    JaImprimiu17 := False;
    JaImprimiu19 := False;
end;

procedure TDmRelatorios.RptDetBoletaSummaryBand1BeforePrint(
  Sender: TObject);
Var
   I : Integer;  
begin
  inherited;
  I := 1;
  For I := 1 To 50 Do Begin
    If VetIDVlDesp[I,1] = 0 Then Break;
    RptDetBoletaMemo1.Lines.Add(VetDescDesp[I]);
    RptDetBoletaMemo2.Lines.Add(FormatFloat('###,###,###,##0.00', VetIDVlDesp[I,2]));
  End;
end;

procedure TDmRelatorios.RptDetBoletaSummaryBand1AfterPrint(
  Sender: TObject);
begin
  inherited;
  QryDetBoleta.Last;
  QryDetBoleta.Next;
end;

procedure TDmRelatorios.RptTIRAnaliticoSummaryBand1BeforeGenerate(
  Sender: TObject);
var
  wSoma, wTIR, wSaldoDia,fTIRTotal : double;
  SpreadSheet: TF1Book;
  I,idiasuteis,iexp : byte;
begin
  inherited;

  RptTIRAnaliticoMemo1.Lines.Clear;
  RptTIRAnaliticoMemo2.Lines.Clear;

  For I := 1 To 100 Do
  Begin
     if VetSaldoDiaData[I] = 0 then break;
     if  VetSaldoDiaVlr[I] <> 0 then
     begin
        RptTIRAnaliticoMemo2.Lines.Add(DatetoStr(VetSaldoDiaData[I]));
        RptTIRAnaliticoMemo1.Lines.Add(FormatFloat('###,###,###,##0.00', VetSaldoDiaVlr[I]));
     end;
  End;
  RptTIRAnaliticolblTIR.Visible := False;
  RptTIRAnaliticolblVlrTIR.Visible := False;

end;

procedure TDmRelatorios.DetVarMesCarteiraBeforePrint(Sender: TObject);
begin
  inherited;
  if Not ((QryVarMesCarteira.FieldByName('SALDOVLRINVCART').AsFloat = 0) and
          (QryVarMesCarteira.FieldByName('QTDEANT').AsFloat = 0)) then
     DetVarMesCarteira.Visible := true
  else
     DetVarMesCarteira.Visible := false;
end;

procedure TDmRelatorios.RptGerCarteiraGroupHeaderBand2BeforePrint(
  Sender: TObject);
begin
   inherited;
   if qryGerCarteira.FieldByName('SALDOQTDEINVCART').AsFloat = 0 then
      TppGroupHeaderBand(Sender).Visible := false
   else
      TppGroupHeaderBand(Sender).Visible := true;
end;

procedure TDmRelatorios.qryLancContItensAfterRefresh(DataSet: TDataSet);
begin
  inherited;
  frmConsLancCont.AtualizaTotLanc;
end;

procedure TDmRelatorios.rptConsIndMoedaBeforePrint(Sender: TObject);
begin
  inherited;
    LblPlano.Caption := 'Plano / Patrocinadora: ' + sPlanPrevCtbPatro;
end;

procedure TDmRelatorios.RptTIRSinteticoStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
  shpDetFluxo.Brush.Color := clWhite;
end;

procedure TDmRelatorios.shpTIRSintDetPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelatorios.shpDetFluxoPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3                  
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelatorios.qryLancContAfterScroll(DataSet: TDataSet);
begin
   inherited;
   if qryLancContPLNCODIGO.IsNull then
      qryLancContItens.Filter := 'PLNCODIGO = 0'
   else
      qryLancContItens.Filter := 'PLNCODIGO = ' + qryLancContPLNCODIGO.AsString;

   frmConsLancCont.AtualizaDados;
   frmConsLancCont.AtualizaTotLanc;
end;

procedure TDmRelatorios.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
  inherited;
  if Trim(qryLancContDESCTPOPERACAO.AsString) = '' then
     shpTitOper.Visible := False
  else
     shpTitOper.Visible := True;
end;

procedure TDmRelatorios.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if (cCorZebra = ClWhite) or (qryLancContTIPMOVCARTINV.AsString = 'ATU') then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelatorios.ppGroupHeaderBand1AfterPrint(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3
end;

procedure TDmRelatorios.shpDetLancamentoPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelatorios.ppShape5Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelatorios.ppShape51Print(Sender: TObject);
begin
  inherited;
   If cCorZebra = ClWhite Then
      cCorZebra := $00E3E3E3
   Else
      cCorZebra := ClWhite;
   (Sender as TppShape).Brush.Color := cCorZebra;
end;

procedure TDmRelatorios.RptVarMesCarteiraStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpMapaVarMensal.Brush.Color := clWhite;
end;

procedure TDmRelatorios.shpMapaVarMensalPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

Initialization
  TotEmpr := 0;
  wVarDia := 0 ;
  For I := 1 To 50 Do
    Begin
        VetDescDesp[I]   := '';
        VetIDVlDesp[I,1] := 0;
        VetIDVlDesp[I,2] := 0;
    End;

  wTotalOperacoes := 0;
  wTotalDespesas  := 0;
  wTotalDespesasLiquido := 0;
  wTotalOperacaoLiquido := 0;

  wSpace     := '                                                  ';
  iInvestAnt := 0;
  sLoteAnt   := '';

Finalization

end.

