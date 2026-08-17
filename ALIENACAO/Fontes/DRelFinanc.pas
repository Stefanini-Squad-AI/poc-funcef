unit DRelFinanc;
{

-------------------------------------------------------------------------------
Solicitação.....: WO 18846
Data............: 11/02/2025
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Criação de Nova Forma de Cálculo JUROS MENSAL - Atualização
                  mensal da parcela, pelo valor da parcela anterior, sem
                  alteração do saldo devedor.
--------------------------------------------------------------------------------
Solicitação.....: WO 7669
Data............: 09/05/2024
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Criação de Nova Forma de Cálculo.
--------------------------------------------------------------------------------
Rotina..........: Extrato Contratual Novo
Solicitação.....: 115965
Data............: 04/06/2021
Responsável.....: Cássio Florencio Rovaroto
Descrição.......: Alteração no relatório de Extraro Contratual - Novo, alterando
                  a recuperação de registros de resíduos contratuais.
-------------------------------------------------------------------------------
Rotina..........: Extrato Contratual Novo
N. Sol..........: 187177.11103
N. Kintana......: 1982394
Data............: 23/04/2014
Responsável.....: Douglas.Siqueira
Descrição.......: Novo relatório de Inadimplência
-------------------------------------------------------------------------------
Rotina..........: Extrato Contratual Novo
N. Sol..........: 178419
N. Kintana......: 1638829
Data............: 15/06/2012
Responsável.....: Otacilio aquino
Descrição.......: Baixa performance para emissão do relatório Extrato
                  Contratual Novo
--------------------------------------------------------------------------------
Rotina..........: Extrato Contratual Novo
N. Sol..........: 174604
N. Kintana......: 1578809
Data............: 22/02/2012
Responsável.....: Eraldo Luis da Silva
Descrição.......: O planus está apresentando mensagem de "Insufficient memory"
                  ao retirar o relatório Extrato Contratual Novo.
--------------------------------------------------------------------------------
Rotina........: Add o Novo Relatorio de Extrato
Analista......: Helen V. Bianchi
SOL...........: 153702/5861
KTN...........: 1372228
Descrição.....: Add o Rel. Relatorio de Extrato NOVO
--------------------------------------------------------------------------------
Rotina........: rptinadimplcontranalalien , qryInadAna (Add pDTINI )
Analista......: Helen V. Bianchi
SOL...........: 141316
KTN...........: 894043
Descrição.....: Add o Rel. Inadimplência por Contrato Analítico
--------------------------------------------------------------------------------
Analista: Felipe de Oliveira
SOL: 137429
KTN: 831440
Descrição: Comentada a query qryExtrato, para trazer documentos cuja a flag FLGTIPO
           seja igual a S
--------------------------------------------------------------------------------
Analista......: Felipe de Oliveira Silva
SOL...........: 131665
KTN...........: 755004
Descrição.....: Relatório alterado para exibir a porcentagem de vigência de acordo
                com a data de vigência mais próxima da data do filtro
--------------------------------------------------------------------------------
Analista: Ricardo Alves
SOL: 126230
KTN: 658659
Descrição: Alteração no relatório de espelhos de contratos.
--------------------------------------------------------------------------------
Analista......: Felipe de Oliveira Silva
SOL...........: 131664
KTN...........: 753771
Descrição.....: Relatório alterado para exibir a porcentagem de vigência de acordo
                com a data de vigência mais próxima da data do filtro
--------------------------------------------------------------------------------
Rotina..........: MontaQuerySegregacao, GetPercImovxContrato, ppSubReport6Print,
                  ppSubReport5Print
N. Sol..........: 131667
N. Kintana......: 756060
Data............: 30/04/2010
Responsável.....: Cássio Camamrgo
Descrição.......: Atualização do relatório Espelho de Contrato, a fim de
                  contemplar a vigência de segregação dos planos previdenciários.
--------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppRegion, ppModule, raCodMod, ppSubRpt,
  Grids, DBGrids, myChkBox, uCtrlContratoImovel, UComunsImobiliarioDB,
  uCMClientDataSet, ppParameter, DBClient, wwclient, uCtrlPlanPrevContabil,
  uCtrlPatro, dBaseDados, uSistema, uComunsImobiliario, StdCtrls, TB97Ctls,
  TB97, TB97Tlbr, DBCtrls, Wwdbspin, ExtCtrls, mArvoreCompl, ComCtrls,
  wwriched, Wwdbigrd, Wwdbgrid, Wwdbgrd2, Buttons, wwdbedit, Wwdotdot,
  Wwdbcomb, TREdit, mCartorio, mAdministradora, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook, TabControlDetalhe, Mask, DBCtrls2,
  mImovelMestre, uCMMath, uCmSqlParams, ppMemo;


type
  TdtmRelFinanc = class(TdtmReports)
    rpContrato: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppRegion1: TppRegion;
    ppLabel31: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel32: TppLabel;
    ppDBText20: TppDBText;
    ppLabel37: TppLabel;
    ppDBText25: TppDBText;
    ppLabel38: TppLabel;
    ppDBText26: TppDBText;
    ppLabel39: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    qryExtrato: TwwQuery;
    dsExtrato: TwwDataSource;
    pplExtrato: TppBDEPipeline;
    rpExtrato: TppReport;
    qryExtratoIDPARCFINANCIMOV: TFloatField;
    qryExtratoIDCONDPAGIMOVEL: TFloatField;
    qryExtratoIDCONTRATOIMOVEL: TFloatField;
    qryExtratoCONNUMERO: TStringField;
    qryExtratoCONNOME: TStringField;
    qryExtratoCONDATAINICIO: TDateTimeField;
    qryExtratoRAZAOSOCIAL: TStringField;
    qryExtratoNOMEMESTRE: TStringField;
    qryExtratoCODDOCUMENTO: TFloatField;
    qryExtratoPLNCODIGO: TFloatField;
    qryExtratoNUMPARCELA: TStringField;
    qryExtratoDATAVENCIMENTO: TDateTimeField;
    qryExtratoVLRJUROS: TFloatField;
    qryExtratoVLRAMORTIZACAO: TFloatField;
    qryExtratoVLRSALDODEVEDOR: TFloatField;
    qryExtratoVLRPRESTATUALIZADA: TFloatField;
    qryExtratoVLRRESIDUO: TFloatField;
    qryExtratoVLRRESIDUOATUALI: TFloatField;
    qryExtratoVLRCORRIGIDOATRASO: TFloatField;
    qryExtratoVLRMULTAATRASO: TFloatField;
    qryExtratoVLRMORAATRASO: TFloatField;
    qryExtratoFLGTIPOLANC: TFloatField;
    qryExtratoDATAPAGAMENTO: TDateTimeField;
    qryExtratoVLRPAGO: TFloatField;
    qryExtratoCAL_TIPO: TStringField;
    qryExtratoVLRDIF: TFloatField;
    qryExtratoVLRPROPOSTA: TFloatField;
    qryInadSin: TwwQuery;
    dsInadSin: TwwDataSource;
    pplInadSin: TppBDEPipeline;
    rpInadSin: TppReport;
    ppHeaderBand5: TppHeaderBand;
    pplTitInadSin: TppLabel;
    ppLabel68: TppLabel;
    ppLine11: TppLine;
    ppDetailBand4: TppDetailBand;
    ppdbDet0: TppDBText;
    ppDBText54: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppLine9: TppLine;
    ppLabel70: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppGroup5: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    pplDet0: TppLabel;
    ppLabel88: TppLabel;
    ppLine10: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel72: TppLabel;
    ppDBCalc2: TppDBCalc;
    qryInadAna: TwwQuery;
    dsInadAna: TwwDataSource;
    pplInadAna: TppBDEPipeline;
    rpInadAna: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppTituloInadAna: TppLabel;
    ppLabel74: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText50: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLine12: TppLine;
    ppLabel75: TppLabel;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppdbComprador2: TppDBText;
    pplComprador2: TppLabel;
    pplGrupo2: TppLabel;
    ppdbGrupo2: TppDBText;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppLine13: TppLine;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLine14: TppLine;
    ppLabel77: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppLabel82: TppLabel;
    ppDBCalc4: TppDBCalc;
    qryImovAli: TwwQuery;
    dsImovAli: TwwDataSource;
    pplImovAli: TppBDEPipeline;
    rpImovAli: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel64: TppLabel;
    ppLabel73: TppLabel;
    ppLine15: TppLine;
    ppLabel76: TppLabel;
    pplComprador3: TppLabel;
    ppLabel80: TppLabel;
    ppLabel84: TppLabel;
    ppLine16: TppLine;
    ppDetailBand6: TppDetailBand;
    ppdbComprador3: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine17: TppLine;
    ppLabel85: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppLabel89: TppLabel;
    ppDBText62: TppDBText;
    pplnSeparador: TppLine;
    ppsCor: TppShape;
    ppsCor2: TppShape;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel96: TppLabel;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    pplSeparador4: TppLine;
    ppsCor4: TppShape;
    ppLabel79: TppLabel;
    ppDBText52: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppLabel86: TppLabel;
    ppLabel97: TppLabel;
    ppDBText66: TppDBText;
    ppLabel98: TppLabel;
    ppDBText67: TppDBText;
    ppLabel103: TppLabel;
    ppLabel105: TppLabel;
    ppDBText68: TppDBText;
    ppLabel106: TppLabel;
    ppDBText69: TppDBText;
    ppDBText21: TppDBText;
    ppLabel18: TppLabel;
    ppDBText22: TppDBText;
    ppLabel19: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppGroup7: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLine19: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLine20: TppLine;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    qryExtratoIDCIDADES: TFloatField;
    qryExtratoIDPAIS: TFloatField;
    qryExtratoCODESTADO: TStringField;
    qryExtratoVLRPRESTACAO: TFloatField;
    qryExtratoFLGRESIDUOINCORP: TStringField;
    ppLabel40: TppLabel;
    ppDBText42: TppDBText;
    qryExtratoVLRCORRIG: TFloatField;
    qryListaContratos: TwwQuery;
    qryListaCondPag: TwwQuery;
    dsListaContratos: TwwDataSource;
    dsListaCondPag: TwwDataSource;
    pplListaContratos: TppBDEPipeline;
    pplListaCondPag: TppBDEPipeline;
    rpListaContratos: TppReport;
    ppHeaderBand8: TppHeaderBand;
    pplTitulo: TppLabel;
    ppLabel53: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppDBText75: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppLine7: TppLine;
    ppLabel54: TppLabel;
    ppSystemVariable15: TppSystemVariable;
    ppSystemVariable16: TppSystemVariable;
    ppGroup9: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppLabel55: TppLabel;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel69: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppGroup11: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppLine18: TppLine;
    ppLabel118: TppLabel;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppLabel56: TppLabel;
    ppDBText82: TppDBText;
    ppLabel60: TppLabel;
    ppDBText83: TppDBText;
    ppLabel65: TppLabel;
    ppDBText84: TppDBText;
    ppLabel66: TppLabel;
    ppDBText44: TppDBText;
    ppDBText51: TppDBText;
    ppLabel71: TppLabel;
    ppDBText53: TppDBText;
    ppLabel78: TppLabel;
    ppDBText70: TppDBText;
    ppLabel81: TppLabel;
    ppDBText71: TppDBText;
    ppLabel83: TppLabel;
    ppDBText72: TppDBText;
    ppLabel87: TppLabel;
    ppDBText73: TppDBText;
    ppLabel92: TppLabel;
    ppDBText74: TppDBText;
    ppLabel108: TppLabel;
    ppDBText76: TppDBText;
    ppLabel109: TppLabel;
    ppDBText77: TppDBText;
    ppLine21: TppLine;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    qryExtratoFLGLANCINTEGRA: TFloatField;
    qryExtratoCAL_ABONO: TStringField;
    qryExtratoFLGCONCILIADO: TStringField;
    qryExtratoIDREPACTUA: TFloatField;
    qryExtratoTOT_ALTERADOR: TFloatField;
    qryExtratoTOT_DEVIDO: TFloatField;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    myDBCheckBox3: TmyDBCheckBox;
    ppLabel9: TppLabel;
    myDBCheckBox4: TmyDBCheckBox;
    ppLabel10: TppLabel;
    lblFormaCalculo: TppLabel;
    qryExtratoVLRNOMINAL: TFloatField;
    qryExtratoVLRSALDOATUAL: TFloatField;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    qryExtratoIDDOCDIVERGE: TStringField;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    qryExtratoDATALIMITE: TDateTimeField;
    qryExtratoVLRRESIDUOCORRIG: TFloatField;
    updExtrato: TUpdateSQL;
    qryExtratoIDCORR_CONDPAG: TFloatField;
    qryExtratoMESREF_CONDPAG: TFloatField;
    qryExtratoTOT_CPMF: TFloatField;
    ppImgLogotipo: TppImage;
    ppLabel15: TppLabel;
    ppDBText78: TppDBText;
    qryExtratoTIPOCONDPAG: TStringField;
    qryExtratoNUMPARCELAS: TFloatField;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppDBText86: TppDBText;
    ppLabel114: TppLabel;
    ppDBText87: TppDBText;
    ppLabel115: TppLabel;
    ppDBText88: TppDBText;
    ppLabel116: TppLabel;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppLabel120: TppLabel;
    ppDBText92: TppDBText;
    ppLabel117: TppLabel;
    ppLabel121: TppLabel;
    ppDBText93: TppDBText;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel119: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppDBText91: TppDBText;
    ppDtInadAna: TppLabel;
    updInadAna: TUpdateSQL;
    qryExtratoDATA_CORRECAO: TDateTimeField;
    qryExtratoMESANO_VENCIMENTO: TStringField;
    qryExtratoMESANO_CALCULO: TStringField;
    qryExtratoNUMPARC: TFloatField;
    qryExtratoNUMDOC: TFloatField;
    qryExtratoDATA_BASE: TDateTimeField;
    qryExtratoDATACOBRES: TDateTimeField;
    qryResiduo: TwwQuery;
    qryResiduoIDCONDPAGIMOVEL: TFloatField;
    qryResiduoFLGTIPOLANC: TFloatField;
    qryResiduoVLRRESIDUO: TFloatField;
    qryResiduoDATAVENCIMENTO: TDateTimeField;
    qryResiduoPLNCODIGO: TFloatField;
    qryInadAnaIDPARCFINANCIMOV: TFloatField;
    qryInadAnaIDCONDPAGIMOVEL: TFloatField;
    qryInadAnaIDCONTRATOIMOVEL: TFloatField;
    qryInadAnaCONNUMERO: TStringField;
    qryInadAnaCONNOME: TStringField;
    qryInadAnaNOMECONTRATO: TStringField;
    qryInadAnaRAZAOSOCIAL: TStringField;
    qryInadAnaNUMPARCELA: TStringField;
    qryInadAnaDATAVENCIMENTO: TDateTimeField;
    qryInadAnaVLRPRESTACAO: TFloatField;
    qryInadAnaFLGTIPOLANC: TFloatField;
    qryInadAnaFLGLANCINTEGRA: TFloatField;
    qryInadAnaDATAPAGAMENTO: TDateTimeField;
    qryInadAnaVLRPAGO: TFloatField;
    qryInadAnaDIASDIF: TFloatField;
    qryInadAnaVLRCMATRASO: TFloatField;
    qryInadAnaVLRMULTAATRASO: TFloatField;
    qryInadAnaVLRMORAATRASO: TFloatField;
    qryInadAnaVLRDIF: TFloatField;
    qryInadAnaVLRCMCORRIG: TFloatField;
    qryInadAnaVLRMULTACORRIG: TFloatField;
    qryInadAnaVLRJUROSCORRIG: TFloatField;
    qryInadAnaVLRDEVIDO: TFloatField;
    qryInadAnaCAL_TIPO: TStringField;
    ppParameterList1: TppParameterList;
    ppGroup12: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppSummaryBand5: TppSummaryBand;
    ppRegion5: TppRegion;
    ppLabel125: TppLabel;
    ppDBCalcVlrVenda: TppDBCalc;
    ppDBCalcVlrContabil: TppDBCalc;
    ppDBCalcVlrResult: TppDBCalc;
    ppRegion6: TppRegion;
    ppDBCalc15: TppDBCalc;
    ppLabel126: TppLabel;
    ppvarDiferenca: TppVariable;
    raCodeModule2: TraCodeModule;
    ppParameterList2: TppParameterList;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    pplSegregExtrato: TppDBPipeline;
    dsSegregExtrato: TwwDataSource;
    qrySegreg: TwwQuery;
    qrySegregPATRO: TStringField;
    qrySegregPLANOPREV: TStringField;
    qrySegregPERCENTRATEIO: TFloatField;
    qrySegregVALOR: TFloatField;
    updSegreg: TUpdateSQL;
    qryImovAliDET: TwwQuery;
    dsImovAliDET: TwwDataSource;
    pplImovAliDET: TppBDEPipeline;
    pplImovAliTOT: TppBDEPipeline;
    dsImovAliTOT: TwwDataSource;
    qryImovAliTOT: TwwQuery;
    ppGroup13: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppSubReport3: TppSubReport;
    ppChildReport4: TppChildReport;
    ppSubReport4: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppTitleBand5: TppTitleBand;
    ppDetailBand10: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    lblPatro: TppLabel;
    lblPlanoContabil: TppLabel;
    sqlSegImoveis: TCMSqlParams;
    cdsSegImoveisTot: TClientDataSet;
    cdsSegImoveisTotPATROCINADORA: TStringField;
    cdsSegImoveisTotPLANOPREV: TStringField;
    cdsSegImoveisTotPPIPERCENTRATEIO: TFloatField;
    cdsSegImoveisTotVALOR: TFloatField;
    dsSegImoveisTot: TDataSource;
    pplSegImoveisTot: TppBDEPipeline;
    pplSegImoveisTotppField1: TppField;
    pplSegImoveisTotppField2: TppField;
    pplSegImoveisTotppField3: TppField;
    pplSegImoveisTotppField4: TppField;
    sqlSegImoveisCond: TCMSqlParams;
    cdsSegImoveisCond: TClientDataSet;
    cdsSegImoveisCondPATROCINADORA: TStringField;
    cdsSegImoveisCondPLANOPREV: TStringField;
    cdsSegImoveisCondPPIPERCENTRATEIO: TFloatField;
    cdsSegImoveisCondVALOR: TFloatField;
    dsSegImoveisCond: TDataSource;
    pplSegImoveisCond: TppBDEPipeline;
    pplSegImoveisCondppField1: TppField;
    pplSegImoveisCondppField2: TppField;
    pplSegImoveisCondppField3: TppField;
    pplSegImoveisCondppField4: TppField;
    ppSubReport5: TppSubReport;
    ppChildReport6: TppChildReport;
    ppSubReport6: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand11: TppDetailBand;
    ppSummaryBand9: TppSummaryBand;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppTitleBand7: TppTitleBand;
    ppDetailBand12: TppDetailBand;
    ppSummaryBand10: TppSummaryBand;
    ppLabel131: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppDBText111: TppDBText;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppDBText114: TppDBText;
    qryContrato: TwwQuery;
    qryContratoIDPARCFINANCIMOV: TFloatField;
    qryContratoIDCONDPAGIMOVEL: TFloatField;
    qryContratoIDCONTRATOIMOVEL: TFloatField;
    qryContratoIDCONDINICIAL: TFloatField;
    qryContratoCONNUMERO: TStringField;
    qryContratoCONNOME: TStringField;
    qryContratoVLRPROPOSTA: TFloatField;
    qryContratoCONDATAASSINATURA: TDateTimeField;
    qryContratoRAZAOSOCIAL: TStringField;
    qryContratoNOMEMESTRE: TStringField;
    qryContratoCODDOCUMENTO: TFloatField;
    qryContratoPLNCODIGO: TFloatField;
    qryContratoNUMPARCELA: TFloatField;
    qryContratoDATAVENCIMENTO: TDateTimeField;
    qryContratoVLRPRESTACAO: TFloatField;
    qryContratoVLRNOMINAL: TFloatField;
    qryContratoVLRJUROS: TFloatField;
    qryContratoVLRJUROSPARC: TFloatField;
    qryContratoVLRAMORTIZACAO: TFloatField;
    qryContratoVLRSALDODEVEDOR: TFloatField;
    qryContratoVLRSALDOATUAL: TFloatField;
    qryContratoVLRPRESTATUALIZADA: TFloatField;
    qryContratoVLRRESIDUO: TFloatField;
    qryContratoVLRRESIDUOATUALI: TFloatField;
    qryContratoVLRCORRIGIDOATRASO: TFloatField;
    qryContratoVLRMULTAATRASO: TFloatField;
    qryContratoVLRMORAATRASO: TFloatField;
    qryContratoFLGTIPOLANC: TFloatField;
    qryContratoDSCINDPARC: TStringField;
    qryContratoCOTVALOR: TFloatField;
    qryContratoFATORCORRECAO: TFloatField;
    dsContrato: TwwDataSource;
    pplContato: TppBDEPipeline;
    pplContatoppField1: TppField;
    pplContatoppField2: TppField;
    pplContatoppField3: TppField;
    pplContatoppField4: TppField;
    pplContatoppField5: TppField;
    pplContatoppField6: TppField;
    pplContatoppField7: TppField;
    pplContatoppField8: TppField;
    pplContatoppField9: TppField;
    pplContatoppField10: TppField;
    pplContatoppField11: TppField;
    pplContatoppField12: TppField;
    pplContatoppField13: TppField;
    pplContatoppField14: TppField;
    pplContatoppField15: TppField;
    pplContatoppField16: TppField;
    pplContatoppField17: TppField;
    pplContatoppField18: TppField;
    pplContatoppField19: TppField;
    pplContatoppField20: TppField;
    pplContatoppField21: TppField;
    pplContatoppField22: TppField;
    pplContatoppField23: TppField;
    pplContatoppField24: TppField;
    pplContatoppField25: TppField;
    pplContatoppField26: TppField;
    pplContatoppField27: TppField;
    pplContatoppField28: TppField;
    pplContatoppField29: TppField;
    pplContatoppField30: TppField;
    pplContatoppField31: TppField;
    qryCondPag: TwwQuery;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagFORMACALCULO: TFloatField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryCondPagDATAINI: TDateTimeField;
    qryCondPagPERINDPROJ: TFloatField;
    qryCondPagDSCINDCORR: TStringField;
    qryCondPagDSCINDPROJ: TStringField;
    qryCondPagDSCJUROS: TStringField;
    qryCondPagDSCTIPO: TStringField;
    dsCondPag: TwwDataSource;
    pplCondPag: TppBDEPipeline;
    pplCondPagppField1: TppField;
    pplCondPagppField2: TppField;
    pplCondPagppField3: TppField;
    pplCondPagppField4: TppField;
    pplCondPagppField5: TppField;
    pplCondPagppField6: TppField;
    pplCondPagppField7: TppField;
    pplCondPagppField8: TppField;
    pplCondPagppField9: TppField;
    pplCondPagppField10: TppField;
    pplCondPagppField11: TppField;
    pplCondPagppField12: TppField;
    pplCondPagppField13: TppField;
    ppLabel150: TppLabel;
    ppLabel151: TppLabel;
    cdsImovAliDET: TCMClientDataSet;
    cdsImovAliTOT: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    cdsImovAliDETIDPLANOPREV: TFloatField;
    cdsImovAliDETIDPATRO: TFloatField;
    cdsImovAliDETPERCENTRATEIO: TFloatField;
    cdsImovAliDETIDIMOVEL: TFloatField;
    cdsImovAliDETIDIMOVELMESTRE: TFloatField;
    cdsImovAliDETTOTVLRVENDA: TFloatField;
    cdsImovAliDETTOTVLRCONTABIL: TFloatField;
    cdsImovAliDETTOTVLRRESULTADO: TFloatField;
    cdsImovAliDETNOMPLANPREV: TStringField;
    cdsImovAliDETNOMEPATR: TStringField;
    cdsImovAliTOTNOMPLANPREV: TStringField;
    cdsImovAliTOTNOMEPATR: TStringField;
    cdsImovAliTOTIDPLANOPREV: TFloatField;
    cdsImovAliTOTIDPATRO: TFloatField;
    cdsImovAliTOTPERCENTRATEIO: TFloatField;
    cdsImovAliTOTTOTVLRVENDA: TFloatField;
    cdsImovAliTOTTOTVLRCONTABIL: TFloatField;
    cdsImovAliTOTTOTVLRRESULTADO: TFloatField;
    cdsSegImoveisCondPERCENT: TFloatField;
    cdsSegImoveisTotPERCENT: TFloatField;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppRegion8: TppRegion;
    ppRegion9: TppRegion;
    raCodeModule4: TraCodeModule;
    qryInadimplContrAnalitico: TwwQuery;
    dsInadimplContrAnalitico: TwwDataSource;
    pplInadimplContrAnalitico: TppBDEPipeline;
    rptInadimplContrAnalAlien: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel177: TppLabel;
    ppLabel185: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppShape5: TppShape;
    ppDBText133: TppDBText;
    ppDBText134: TppDBText;
    ppDBText135: TppDBText;
    ppDBText136: TppDBText;
    ppDBText137: TppDBText;
    ppDBText138: TppDBText;
    ppDBText139: TppDBText;
    ppDBText140: TppDBText;
    ppDBText141: TppDBText;
    ppDBText142: TppDBText;
    ppDBText143: TppDBText;
    ppDBText144: TppDBText;
    ppDBText145: TppDBText;
    ppDBText146: TppDBText;
    ppDBText147: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine24: TppLine;
    ppLabel186: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand12: TppSummaryBand;
    ppGroup15: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppLine25: TppLine;
    ppShape7: TppShape;
    ppShape9: TppShape;
    ppGroupFooterBand13: TppGroupFooterBand;
    updInadimplContrAnalitico: TUpdateSQL;
    ppLabel207: TppLabel;
    rptInadimplContrAnaliticolblSegmento: TppLabel;
    ppLabel208: TppLabel;
    rptInadimplContrAnaliticolblResponsavel: TppLabel;
    ppLabel209: TppLabel;
    rptInadimplContrAnaliticolblAdministradora: TppLabel;
    ppLabel210: TppLabel;
    rptInadimplContrAnaliticolblMes: TppLabel;
    ppLabel211: TppLabel;
    rptInadimplContrAnaliticolblDtInicio: TppLabel;
    ppLabel213: TppLabel;
    rptInadimplContrAnaliticolblDataFim: TppLabel;
    ppLabel188: TppLabel;
    ppLabel189: TppLabel;
    ppLabel190: TppLabel;
    ppLabel192: TppLabel;
    ppLabel193: TppLabel;
    ppLabel194: TppLabel;
    ppLabel195: TppLabel;
    ppLabel196: TppLabel;
    ppLabel197: TppLabel;
    ppLabel202: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel206: TppLabel;
    ppLabel214: TppLabel;
    ppLabel215: TppLabel;
    ppLabel191: TppLabel;
    qryInadimplContrAnaliticoIDPARCFINANCIMOV: TFloatField;
    qryInadimplContrAnaliticoIDCONDPAGIMOVEL: TFloatField;
    qryInadimplContrAnaliticoIDCONTRATOIMOVEL: TFloatField;
    qryInadimplContrAnaliticoCONNUMERO: TStringField;
    qryInadimplContrAnaliticoNUMERO_CONTRATO: TStringField;
    qryInadimplContrAnaliticoCONNOME: TStringField;
    qryInadimplContrAnaliticoDESCTIPOIMOVEL: TStringField;
    qryInadimplContrAnaliticoNOMECONTRATO: TStringField;
    qryInadimplContrAnaliticoNOME: TStringField;
    qryInadimplContrAnaliticoCODDOCUMENTO: TFloatField;
    qryInadimplContrAnaliticoRAZAOSOCIAL: TStringField;
    qryInadimplContrAnaliticoCONDATAASSINATURA: TDateTimeField;
    qryInadimplContrAnaliticoNUMPARCELA: TStringField;
    qryInadimplContrAnaliticoDATAVENCIMENTO: TDateTimeField;
    qryInadimplContrAnaliticoVLRPRESTACAO: TFloatField;
    qryInadimplContrAnaliticoFLGTIPOLANC: TFloatField;
    qryInadimplContrAnaliticoFLGLANCINTEGRA: TFloatField;
    qryInadimplContrAnaliticoDATAPAGAMENTO: TDateTimeField;
    qryInadimplContrAnaliticoCOMP: TStringField;
    qryInadimplContrAnaliticoVLRPAGO: TFloatField;
    qryInadimplContrAnaliticoDIASDIF: TFloatField;
    qryInadimplContrAnaliticoVLRDIF: TFloatField;
    qryInadimplContrAnaliticoVLRCMATRASO: TFloatField;
    qryInadimplContrAnaliticoVLRMULTAATRASO: TFloatField;
    qryInadimplContrAnaliticoVLRMORAATRASO: TFloatField;
    qryInadimplContrAnaliticoVLRCMCORRIG: TFloatField;
    qryInadimplContrAnaliticoVLRMULTACORRIG: TFloatField;
    qryInadimplContrAnaliticoVLRJUROSCORRIG: TFloatField;
    qryInadimplContrAnaliticoVLRDEVIDO: TFloatField;
    qryInadimplContrAnaliticoCOMPETENCIA: TStringField;
    ppDBText148: TppDBText;
    ppGroup16: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    ppLabel205: TppLabel;
    ppDBText149: TppDBText;
    ppLabel216: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLine27: TppLine;
    ppLabel217: TppLabel;
    ppDBText150: TppDBText;
    ppLabel218: TppLabel;
    ppDBText151: TppDBText;
    ppShape6: TppShape;
    ppShape8: TppShape;
    ppLabel198: TppLabel;
    ppLabel201: TppLabel;
    ppLine28: TppLine;
    ppLine30: TppLine;
    ppShape10: TppShape;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppLabel153: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppShape11: TppShape;
    ppLine32: TppLine;
    ppLabel152: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppShape12: TppShape;
    ppLabel154: TppLabel;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    ppLine29: TppLine;
    ppLine26: TppLine;
    ppLine31: TppLine;
    ppLine33: TppLine;
    qryExtratoNovo: TwwQuery;
    updExtratoNovo: TUpdateSQL;
    updSegregNovo: TUpdateSQL;
    dsExtratoNovo: TwwDataSource;
    qrySegregNovo: TwwQuery;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    dsSegregExtratoNovo: TwwDataSource;
    pplExtratoNovo: TppBDEPipeline;
    pplSegregExtratoNovo: TppDBPipeline;
    rpExtratoNovo: TppReport;
    ppParameterList3: TppParameterList;
    pplCondExtratoNovo: TppBDEPipeline;
    dsCondExtrNovo: TwwDataSource;
    qryCondExtrNovo: TwwQuery;
    updCondExtrNovo: TUpdateSQL;
    qryExtratoNovoIDPARCFINANCIMOV: TFloatField;
    qryExtratoNovoIDCONDPAGIMOVEL: TFloatField;
    qryExtratoNovoIDCONTRATOIMOVEL: TFloatField;
    qryExtratoNovoCONNUMERO: TStringField;
    qryExtratoNovoCONNOME: TStringField;
    qryExtratoNovoVLRPROPOSTA: TFloatField;
    qryExtratoNovoCONDATAINICIO: TDateTimeField;
    qryExtratoNovoIDCIDADES: TFloatField;
    qryExtratoNovoIDPAIS: TFloatField;
    qryExtratoNovoCODESTADO: TStringField;
    qryExtratoNovoRAZAOSOCIAL: TStringField;
    qryExtratoNovoNOMEMESTRE: TStringField;
    qryExtratoNovoCODDOCUMENTO: TFloatField;
    qryExtratoNovoPLNCODIGO: TFloatField;
    qryExtratoNovoTOT_ALTERADOR: TFloatField;
    qryExtratoNovoTOT_CPMF: TFloatField;
    qryExtratoNovoNUMDOC: TFloatField;
    qryExtratoNovoNUMPARC: TFloatField;
    qryExtratoNovoNUMPARCELA: TStringField;
    qryExtratoNovoDATAVENCIMENTO: TDateTimeField;
    qryExtratoNovoMESANO_VENCIMENTO: TStringField;
    qryExtratoNovoMESANO_CALCULO: TStringField;
    qryExtratoNovoIDCORR_CONDPAG: TFloatField;
    qryExtratoNovoMESREF_CONDPAG: TFloatField;
    qryExtratoNovoTIPOCONDPAG: TStringField;
    qryExtratoNovoNUMPARCELAS: TFloatField;
    qryExtratoNovoVLRPRESTACAO: TFloatField;
    qryExtratoNovoVLRNOMINAL: TFloatField;
    qryExtratoNovoTOT_DEVIDO: TFloatField;
    qryExtratoNovoVLRJUROS: TFloatField;
    qryExtratoNovoVLRAMORTIZACAO: TFloatField;
    qryExtratoNovoVLRSALDODEVEDOR: TFloatField;
    qryExtratoNovoVLRSALDOATUAL: TFloatField;
    qryExtratoNovoVLRPRESTATUALIZADA: TFloatField;
    qryExtratoNovoVLRRESIDUO: TFloatField;
    qryExtratoNovoVLRRESIDUOATUALI: TFloatField;
    qryExtratoNovoVLRRESIDUOCORRIG: TFloatField;
    qryExtratoNovoDATACOBRES: TDateTimeField;
    qryExtratoNovoIDINDCORRECAO: TFloatField;
    qryExtratoNovoVLRCORRIGIDOATRASO: TFloatField;
    qryExtratoNovoVLRMULTAATRASO: TFloatField;
    qryExtratoNovoVLRMORAATRASO: TFloatField;
    qryExtratoNovoFLGRESIDUOINCORP: TStringField;
    qryExtratoNovoFLGTIPOLANC: TFloatField;
    qryExtratoNovoFLGLANCINTEGRA: TFloatField;
    qryExtratoNovoDATALIMITE: TDateTimeField;
    qryExtratoNovoDATAPAGAMENTO: TDateTimeField;
    qryExtratoNovoVLRPAGO: TFloatField;
    qryExtratoNovoFLGCONCILIADO: TStringField;
    qryExtratoNovoIDREPACTUA: TFloatField;
    qryExtratoNovoIDDOCDIVERGE: TStringField;
    qryExtratoNovoDATA_BASE: TDateTimeField;
    qryExtratoNovoDATA_CORRECAO: TDateTimeField;
    qryExtratoNovoVLRDIF: TFloatField;
    qryExtratoNovoVLRCORRIG: TFloatField;
    ppHeaderBand1: TppHeaderBand;
    ppTituloExtratoNovo: TppLabel;
    ppLabel156: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppLine34: TppLine;
    ppShape13: TppShape;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppDBText130: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine35: TppLine;
    ppLabel157: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppGroup14: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppRegion10: TppRegion;
    ppLabel158: TppLabel;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppLabel159: TppLabel;
    ppDBText152: TppDBText;
    ppLabel160: TppLabel;
    ppDBText153: TppDBText;
    ppLabel161: TppLabel;
    ppDBText154: TppDBText;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppRegion11: TppRegion;
    pplSaldoDevNovo: TppLabel;
    ppLabel164: TppLabel;
    ppLabel165: TppLabel;
    iAtrasoNovo: TppVariable;
    ppLabel166: TppLabel;
    iSaldoTotNovo: TppVariable;
    iDivergNovo: TppVariable;
    iResiduoNovo: TppVariable;
    ppLabel167: TppLabel;
    ppLabel168: TppLabel;
    iAcertoNovo: TppVariable;
    iSDNovo: TppVariable;
    iResiduoAtualNovo: TppVariable;
    ppLabel169: TppLabel;
    iPrestMesNovo: TppVariable;
    ppLabel170: TppLabel;
    CorrecaoIncorporadaNovo: TppVariable;
    lblDtLimiteNovo: TppLabel;
    relExtratoNovolblDataCorrecao: TppLabel;
    ppRegion12: TppRegion;
    ppSubReport7: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppLabel173: TppLabel;
    ppLabel174: TppLabel;
    ppLabel175: TppLabel;
    ppLabel176: TppLabel;
    ppLine36: TppLine;
    ppDetailBand15: TppDetailBand;
    ppDBText156: TppDBText;
    ppDBText157: TppDBText;
    ppDBText158: TppDBText;
    ppDBText159: TppDBText;
    ppSummaryBand11: TppSummaryBand;
    raCodeModule5: TraCodeModule;
    ppLabel178: TppLabel;
    ppGroup17: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppLine37: TppLine;
    ppLabel179: TppLabel;
    ppLabel180: TppLabel;
    ppLabel181: TppLabel;
    ppLabel183: TppLabel;
    ppLabel184: TppLabel;
    ppLabel187: TppLabel;
    ppLabel199: TppLabel;
    ppLabel212: TppLabel;
    ppLabel219: TppLabel;
    ppLabel220: TppLabel;
    ppLabel221: TppLabel;
    ppLabel222: TppLabel;
    ppLabel224: TppLabel;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppGroup18: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppRegion13: TppRegion;
    ppLabel225: TppLabel;
    ppDBText160: TppDBText;
    ppLabel226: TppLabel;
    ppLabel227: TppLabel;
    ppDBCalc31: TppDBCalc;
    ppDBCalc32: TppDBCalc;
    ppDBCalc34: TppDBCalc;
    ppDBText161: TppDBText;
    vQtdeParcPagaNovo: TppVariable;
    raCodeModule3: TraCodeModule;
    ppHeaderBand4: TppHeaderBand;
    ppTituloExtrato: TppLabel;
    ppLabel43: TppLabel;
    ppdbDetalhe: TppDetailBand;
    pplSeparador3: TppLine;
    ppsCor3: TppShape;
    ppDBText32: TppDBText;
    ppdbtVencto: TppDBText;
    ppDBText34: TppDBText;
    ppDBText36: TppDBText;
    ppdbtSaldo: TppDBText;
    ppDBText41: TppDBText;
    ppDBText38: TppDBText;
    ppdbtTipo: TppDBText;
    ppDBText33: TppDBText;
    ppDBText43: TppDBText;
    ppDBText35: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText8: TppDBText;
    ppDBText27: TppDBText;
    ppDBText94: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppSystemVariable7: TppSystemVariable;
    ppLine5: TppLine;
    ppLabel44: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    ppGroup3: TppGroup;
    ghbExtrato: TppGroupHeaderBand;
    ppRegion3: TppRegion;
    ppLabel45: TppLabel;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppLabel46: TppLabel;
    ppDBText47: TppDBText;
    ppLabel47: TppLabel;
    ppDBText48: TppDBText;
    ppLabel48: TppLabel;
    ppDBText49: TppDBText;
    ppLabel49: TppLabel;
    ppDBText37: TppDBText;
    gfbExtrato: TppGroupFooterBand;
    ppRegion2: TppRegion;
    pplSaldoDev: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    iAtraso: TppVariable;
    ppLabel104: TppLabel;
    iSaldoTot: TppVariable;
    iDiverg: TppVariable;
    iResiduo: TppVariable;
    ppLabel107: TppLabel;
    ppLabel34: TppLabel;
    iAcerto: TppVariable;
    iSD: TppVariable;
    iResiduoAtual: TppVariable;
    ppLabel42: TppLabel;
    iPrestMes: TppVariable;
    ppLabelCorrecaoIncorp: TppLabel;
    CorrecaoIncorporada: TppVariable;
    lblDtLimite: TppLabel;
    relExtratolblDataCorrecao: TppLabel;
    ppRegion7: TppRegion;
    ppsrSegregacao: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLblPlanoExtrato: TppLabel;
    ppLblPatroExtrato: TppLabel;
    ppLblPecentExtrato: TppLabel;
    ppLblValorExtrato: TppLabel;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBPlanoExtrato: TppDBText;
    ppDBPatroExtrato: TppDBText;
    ppDBPercentExtrato: TppDBText;
    ppDBValorExtrato: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    raCodeModule6: TraCodeModule;
    ppLabel127: TppLabel;
    ppGroup4: TppGroup;
    ppghCab: TppGroupHeaderBand;
    ppLine8: TppLine;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel67: TppLabel;
    ppLabel63: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel41: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel124: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    gfbCondPag: TppGroupFooterBand;
    ppRegion4: TppRegion;
    ppLabel26: TppLabel;
    ppDBText79: TppDBText;
    ppLabel52: TppLabel;
    ppLabel110: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBText85: TppDBText;
    vQtdeParcPaga: TppVariable;
    raCodeModule1: TraCodeModule;
    qryCondExtrNovoIDCONTRATOIMOVEL: TFloatField;
    qryCondExtrNovoIDCONDPAGIMOVEL: TFloatField;
    qryCondExtrNovoVLRFINANC: TFloatField;
    qryCondExtrNovoPRAZO: TStringField;
    qryCondExtrNovoNUMPARCELAS: TFloatField;
    qryCondExtrNovoTIPOCONDPAG: TStringField;
    qryCondExtrNovoFORMACALCULO: TFloatField;
    qryCondExtrNovoCal_Tipo: TStringField;
    qryCondExtrNovoCal_Forma: TStringField;
    ppLabel182: TppLabel;
    ppDBText117: TppDBText;
    qryExtratoNovoStatus: TStringField;
    qryExtratoNovoCal_Tipo: TStringField;
    qryExtratoNovoCal_Abono: TStringField;
    ppLabel200: TppLabel;
    ppDBText123: TppDBText;
    qryExtratoNovoSaldo_Documento: TStringField;
    qryExtratoNovoTotSaldo_Documento: TStringField;
    ppLabel223: TppLabel;
    qryExtratoNovoAtualizacao: TStringField;
    ppLabel228: TppLabel;
    ppDBText129: TppDBText;
    ppRegion14: TppRegion;
    ppSubReport9: TppSubReport;
    ppChildReport10: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppLabel155: TppLabel;
    ppLabel171: TppLabel;
    ppLabel172: TppLabel;
    ppLabel163: TppLabel;
    ppDetailBand17: TppDetailBand;
    ppDBText162: TppDBText;
    ppDBText164: TppDBText;
    ppDBText165: TppDBText;
    ppDBText163: TppDBText;
    ppSummaryBand14: TppSummaryBand;
    ppLabel229: TppLabel;
    ppLine38: TppLine;
    qryExtratoNovoNUMPARCELAORDEM: TStringField;
    qryExtratoNovoPrestAlteAtul: TStringField;
    pplExtratoNovoppField63: TppField;
    raCodeModule7: TraCodeModule;
    qryExtratoNovoSTATUS_CS: TStringField;
    qryExtratoNovoATUALIZACAO_CS: TFloatField;
    qryExtratoNovoSALDO_DOCUMENTO_CS: TFloatField;
    rpInadAnaNovo: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppTituloInadAnaNovo: TppLabel;
    ppLabel231: TppLabel;
    ppDetailBand16: TppDetailBand;
    ppShape14: TppShape;
    ppDBText166: TppDBText;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText169: TppDBText;
    ppDBText170: TppDBText;
    ppDBText171: TppDBText;
    ppDBText172: TppDBText;
    ppDBText173: TppDBText;
    ppDBText174: TppDBText;
    ppDBText175: TppDBText;
    ppDBText176: TppDBText;
    ppDBText177: TppDBText;
    ppDBText178: TppDBText;
    ppDBText179: TppDBText;
    ppDBText180: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine39: TppLine;
    ppLabel232: TppLabel;
    ppSystemVariable17: TppSystemVariable;
    ppSystemVariable18: TppSystemVariable;
    ppSummaryBand13: TppSummaryBand;
    ppLabel233: TppLabel;
    ppDBCalc33: TppDBCalc;
    ppDBCalc35: TppDBCalc;
    ppGroup19: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppLine40: TppLine;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLine41: TppLine;
    ppDBText181: TppDBText;
    ppLabel237: TppLabel;
    ppLabel238: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    ppLabel242: TppLabel;
    ppLabel243: TppLabel;
    ppShape15: TppShape;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppShape18: TppShape;
    ppLabel244: TppLabel;
    ppLabel245: TppLabel;
    ppLabel246: TppLabel;
    ppLabel247: TppLabel;
    ppLabel248: TppLabel;
    ppLabel249: TppLabel;
    ppLabel250: TppLabel;
    ppLabel251: TppLabel;
    ppLabel252: TppLabel;
    ppLabel253: TppLabel;
    ppLabel254: TppLabel;
    ppDBText182: TppDBText;
    ppDtInadAnaNovo: TppLabel;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppLabel256: TppLabel;
    ppDBCalc36: TppDBCalc;
    ppDBCalc37: TppDBCalc;
    raCodeModule8: TraCodeModule;
    pplInadAnaNovo: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    ppField17: TppField;
    ppField18: TppField;
    ppField19: TppField;
    ppField20: TppField;
    ppField21: TppField;
    ppField22: TppField;
    ppField23: TppField;
    ppField24: TppField;
    dsInadAnaNovo: TwwDataSource;
    qryInadAnaNovo: TwwQuery;
    updInadAnaNovo: TUpdateSQL;
    qryInadAnaNovoIDPARCFINANCIMOV: TFloatField;
    qryInadAnaNovoIDCONDPAGIMOVEL: TFloatField;
    qryInadAnaNovoIDCONTRATOIMOVEL: TFloatField;
    qryInadAnaNovoCONNUMERO: TStringField;
    qryInadAnaNovoCONNOME: TStringField;
    qryInadAnaNovoNOMECONTRATO: TStringField;
    qryInadAnaNovoRAZAOSOCIAL: TStringField;
    qryInadAnaNovoNUMPARCELA: TStringField;
    qryInadAnaNovoDATAVENCIMENTO: TDateTimeField;
    qryInadAnaNovoVLRPRESTACAO: TFloatField;
    qryInadAnaNovoFLGTIPOLANC: TFloatField;
    qryInadAnaNovoFLGLANCINTEGRA: TFloatField;
    qryInadAnaNovoDATAPAGAMENTO: TDateTimeField;
    qryInadAnaNovoVLRPAGO: TFloatField;
    qryInadAnaNovoDIASDIF: TFloatField;
    qryInadAnaNovoVLRCMATRASO: TFloatField;
    qryInadAnaNovoVLRMULTAATRASO: TFloatField;
    qryInadAnaNovoVLRMORAATRASO: TFloatField;
    qryInadAnaNovoVLRDIF: TFloatField;
    qryInadAnaNovoVLRCMCORRIG: TFloatField;
    qryInadAnaNovoVLRMULTACORRIG: TFloatField;
    qryInadAnaNovoVLRJUROSCORRIG: TFloatField;
    qryInadAnaNovoVLRDEVIDO: TFloatField;
    qryInadAnaNovoCAL_TIPO: TStringField;
    procedure qryExtratoCalcFields(DataSet: TDataSet);
    procedure gfbExtratoAfterPrint(Sender: TObject);
    procedure gfbExtratoBeforePrint(Sender: TObject);
    procedure qryInadAnaCalcFields(DataSet: TDataSet);
    procedure pplnSeparadorPrint(Sender: TObject);
    procedure ppsCorPrint(Sender: TObject);
    procedure rpListaContratosBeforePrint(Sender: TObject);
    procedure ppDetailBand7BeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ppsrSegregacaoPrint(Sender: TObject);
    procedure ppSubReport3Print(Sender: TObject);
    procedure ppDBText98GetText(Sender: TObject; var Text: String);
    procedure ppDBText114GetText(Sender: TObject; var Text: String);
    procedure ppSubReport6Print(Sender: TObject);
    procedure ppSubReport5Print(Sender: TObject);
    procedure ppHeaderBand1AfterPrint(Sender: TObject);
    procedure ppLine31Print(Sender: TObject);
    procedure qryExtratoNovoCalcFields(DataSet: TDataSet);
    procedure ppGroupFooterBand12AfterPrint(Sender: TObject);
    procedure ppGroupFooterBand12BeforePrint(Sender: TObject);
    procedure ppSubReport7Print(Sender: TObject);
    procedure qryCondExtrNovoCalcFields(DataSet: TDataSet);
    procedure ppDBText124GetText(Sender: TObject; var Text: String);
    procedure ppDetailBand13BeforePrint(Sender: TObject);
    procedure ppRegion13Print(Sender: TObject);
    procedure ppDBText117GetText(Sender: TObject; var Text: String);
    procedure ppGroupHeaderBand12BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand12AfterPrint(Sender: TObject);
    procedure qryInadAnaNovoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    fTotalResiduo : Double;
    // Helen - SOL: 153702/5861 KTN: 1372228
    fTotalSaldoDocumento : Double;
    function SomaResiduos(const iContrato : Integer; const dDataLimite : TDateTime) : Double;
    // SOL 131664 KTN 753771 Felipe de Oliveira Início
    procedure MontaQuerySegregacao(iIDContratoImovel : Integer ; dDataVigencia : TDateTime); overload;
    // SOL 131664 KTN 753771 Felipe de Oliveira Fim
    // SOL 126230 KTN 658659 Ricardo A.
    function MontaQuerySegregacao: OleVariant; overload;
    // FIM SOL 126230 KTN 658659 Ricardo A.
    function GetPercImovxContrato(iIDContratoImovel : Integer ; dDataVigencia : TDateTime) : OLEVariant;
    procedure MontaQueryResumoSegrega;
  public
    { Public declarations }
    bSeparador, bCorLinha   : boolean;
    CorLinha, CorAtual      : TColor;
    dDataLimite             : TDateTime;
    sTitulo                 : String;
    CtrlPatro : TCtrlPatro;
    CtrlPlanPrev : TCtrlPlanPrevContabil;
    iIdContratoImovel : Integer;
    function MostraParam(Form: string): boolean; Override;
  end;

var
  dtmRelFinanc: TdtmRelFinanc;
implementation

{$R *.DFM}

Uses CRelContrato, DFinanciamento,
     CRelExtrato, CRelInadSin, CRelInadAna, CRelImovAli, DCalcDocumento,
     uCalcDocumento, UFuncoesImob, CRelListaContratos, UFuncAlienacao,
     uCmControlObject,CRelInadimplContrAnaliticoAlie,CRelExtratoNovo,CRelInadAnanovo;

function TdtmRelFinanc.MostraParam(Form: string): boolean;
var frm : TForm;
begin
     if (AnsiUpperCase(Form) = 'RELCONTRATO') then
        frm := TRelContrato.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELEXTRATO') then
        frm := TRelExtrato.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELINADSIN') then
        frm := TRelInadSin.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELINADANA') then
        frm := TRelInadAna.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELINADANANOVO') then ////DOUGLAS.SIQUEIRA
        frm := TRelInadAnanovo.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELIMOVALI') then
        frm := TRelImovAli.Create(Application)
     else
     if (AnsiUpperCase(Form) = 'RELLISTACONTRATOS') then
        frm := TRelListaContratos.Create(Application)
     else
     // Helen - SOL: 141316 KTN: 894043
     if (AnsiUpperCase(Form) = 'RELINADIMPLCONTRANALITICO') then
        frm := TRelInadimplContrAnalitico.Create(Application)
     else
     // Helen - SOL: 153702/5861 KTN: 1372228
     if (AnsiUpperCase(Form) = 'RELEXTRATONOVO') then
        frm := TRelExtratoNovo.Create(Application)
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

procedure TdtmRelFinanc.qryExtratoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryExtratoCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryExtratoFLGTIPOLANC.AsInteger,qryExtratoFLGLANCINTEGRA.AsInteger);

  // Define Abono
  if qryExtratoFLGCONCILIADO.AsString = 'S' then begin
     if qryExtratoVLRPAGO.IsNull then begin
        if qryExtratoIDREPACTUA.IsNull then
             qryExtratoCAL_ABONO.AsString := 'Abonado'
        else qryExtratoCAL_ABONO.AsString := 'Repactuado';
     end else begin
        if qryExtratoVLRDIF.AsFloat = 0 then begin
           if (qryExtratoDATAPAGAMENTO.AsDateTime > qryExtratoDATALIMITE.AsDateTime) or
              (qryExtratoVLRPAGO.AsFloat <> qryExtratoVLRPRESTACAO.AsFloat) then begin
              qryExtratoCAL_ABONO.AsString := 'Abono Total';
           end else begin
              qryExtratoCAL_ABONO.AsString := '';
           end;
        end else begin
           if qryExtratoIDDOCDIVERGE.IsNull then begin
              if qryExtratoIDREPACTUA.IsNull then
                   qryExtratoCAL_ABONO.AsString := 'Abonado'
              else qryExtratoCAL_ABONO.AsString := 'Repactuado';
           end else begin
              qryExtratoCAL_ABONO.AsString := 'Cobrança';
           end;
        end;
     end;
  end else if qryExtratoFLGCONCILIADO.AsString = 'P' then begin
     qryExtratoCAL_ABONO.AsString := 'Abono Parcial';
  end else if qryExtratoFLGCONCILIADO.AsString = 'C' then begin
     qryExtratoCAL_ABONO.AsString := 'Cobrança';
  end else begin
     qryExtratoCAL_ABONO.AsString := '';
  end;
end;



procedure TdtmRelFinanc.gfbExtratoAfterPrint(Sender: TObject);
begin
   inherited;
   lblDtLimite.Caption       := DateToStr(dDataLimite);
   iSD.Value                 := 0;
   iAtraso.Value             := 0;
   iDiverg.Value             := 0;
   iAcerto.Value             := 0;
   iResiduo.Value            := 0;
   iSaldoTot.Value           := 0;
   CorrecaoIncorporada.Value := 0;
end;

procedure TdtmRelFinanc.gfbExtratoBeforePrint(Sender: TObject);
begin
  inherited;
  pplSaldoDev.Caption := 'Saldo Devedor vincendo em ' + DateToStr(dDataLimite);
  iSD.Value           := FuncAlienacao.CalcSaldoDevedor(qryExtratoIDCONTRATOIMOVEL.AsInteger, -1, dDataLimite);
end;

procedure TdtmRelFinanc.qryInadAnaCalcFields(DataSet: TDataSet);
begin
   inherited;
   qryInadAnaCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryInadAnaFLGTIPOLANC.AsInteger,qryInadAnaFLGLANCINTEGRA.AsInteger);
end;

procedure TdtmRelFinanc.pplnSeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelFinanc.ppsCorPrint(Sender: TObject);
begin
   inherited;
   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;
   (Sender as TppShape).Brush.Color := CorAtual;
end;


procedure TdtmRelFinanc.rpListaContratosBeforePrint(Sender: TObject);
begin
   inherited;
   pplTitulo.Caption := sTitulo;
end;

procedure TdtmRelFinanc.ppDetailBand7BeforePrint(Sender: TObject);
begin
  inherited;
  lblFormaCalculo.Caption := FuncAlienacao.TipoCalculo(qryCondPag.FieldByName('FORMACALCULO').AsInteger);
end;



function TdtmRelFinanc.SomaResiduos(const iContrato: Integer; const dDataLimite: TDateTime): Double;
begin
   fTotalResiduo := 0;
   qryResiduo.Close;
   qryResiduo.ParamByName('PIDCONTRATO').AsInteger := iContrato;
   qryResiduo.Open;

   while not qryResiduo.eof do
   begin
      if qryResiduoDATAVENCIMENTO.AsDateTime <= dDataLimite then
      begin
         if   qryResiduoFLGTIPOLANC.AsInteger = 1 then fTotalResiduo := 0
         else if not qryResiduoPLNCODIGO.IsNull then
                 fTotalResiduo := fTotalResiduo + qryResiduoVLRRESIDUO.AsFloat;
      end;
      qryResiduo.Next;
   end;
   Result := fTotalResiduo;
end;



procedure TdtmRelFinanc.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPatro := TCtrlPatro.Create;
  CtrlPatro.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                       ComunsImobiliario.MensErroMT);

  CtrlPlanPrev := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrev.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                       ComunsImobiliario.MensErroMT);
  iIdContratoImovel := 0;
  
end;

procedure TdtmRelFinanc.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlPatro.Free;
  CtrlPlanPrev.Free;
end;

procedure TdtmRelFinanc.MontaQuerySegregacao(iIDContratoImovel: Integer ; dDataVigencia : TDateTime );
var
  sSQL : string;
begin
  sSQL := 'SELECT PES.NOME AS PATRO, ' + #13 +
          '       PPC.NOME AS PLANOPREV, ' + #13 +
          '       SUM((PPI.PERCENTRATEIO * 100) / PT.PERCENTRATEIO) AS PERCENTRATEIO, ' + #13 +
          '       0 AS VALOR      ' + #13 +
    // SOL 131664 KTN 753771 Felipe de Oliveira início
          '  FROM PLANOPATROXVIGENCIAIMOB PPI,  ' + #13 +
    // SOL 131664 KTN 753771 Felipe de Oliveira  fim
          '       CONTRATOXIMOVEL CXI,  ' + #13 +
          '       PESSOA PES,          '   + #13 +
          '       PLANPREVCONTABIL PPC, '  + #13 +
          '       CONTRATOIMOVEL CTI,   '  + #13 +
          '       (SELECT SUM(PPI.PERCENTRATEIO) AS PERCENTRATEIO ' + #13 +
          '          FROM PLANOPATROXVIGENCIAIMOB PPI, '   + #13 +
          '                CONTRATOXIMOVEL   CXI, '   + #13 +
          '                CONTRATOIMOVEL    CTI   '  + #13 +
          '          WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIDContratoImovel) + #13 +
          '            AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' + #13 +
          '            AND PPI.IDIMOVEL = CXI.IDIMOVEL) PT ' + #13 +
          ' WHERE CTI.IDCONTRATOIMOVEL = ' + IntToStr(iIDContratoImovel) + #13 +
    // SOL 131664 KTN 753771 Felipe de Oliveira início
          '  AND PPI.DATAVIGENCIA = (SELECT MAX(PPV.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPV,CONTRATOXIMOVEL CXI' + #13+
          '                          WHERE PPV.DATAVIGENCIA <= ' +QuotedStr(DateToStr(dDataVigencia)) + #13+
          '                            AND PPV.IDIMOVEL = CXI.IDIMOVEL ' +#13+
          '                            AND CXI.IDCONTRATOIMOVEL = ' + IntToStr(iIDContratoImovel) +')'+#13+
    // SOL 131664 KTN 753771 Felipe de Oliveira  fim
          '  AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL '  + #13 +
          '  AND PPI.IDIMOVEL = CXI.IDIMOVEL '  + #13 +
          '  AND PPI.IDPATRO = PES.IDPESSOA '   + #13 +
          '  AND PPI.IDPLANOPREV = PPC.IDPLANOPREV '  + #13 +
          'GROUP BY PPI.IDPLANOPREV, PPI.IDPATRO, PES.NOME, PPC.NOME,PT.PERCENTRATEIO '  + #13 +
          'ORDER BY PERCENTRATEIO DESC ';

  qrySegreg.Close;
  qrySegreg.SQL.Clear;
  qrySegreg.SQL.Add(sSQL);
  qrySegreg.Open;


end;

procedure TdtmRelFinanc.ppsrSegregacaoPrint(Sender: TObject);
var
  fValorPlano, fValorTotal, fValorPercent : Currency;
  i, iQntImoveis, iIdImovel : integer;
  _cdsAux : TCMClientDataSet;
  dPercent : double;

begin
  inherited;
  fValorPlano := 0;
  fValorTotal := 0;
  i := 1;
  iQntImoveis := 0;
  dPercent := 0;
  fValorPercent := 0;
  _cdsAux := TCMClientDataSet.Create(nil);
  try
    _cdsAux.Data := GetPercImovxContrato(qryExtratoIDCONTRATOIMOVEL.AsInteger,dDataLimite);
    MontaQueryResumoSegrega;

    while not _cdsAux.Eof do
    begin
      if iIdImovel <> _cdsAux.FieldByName('IDIMOVEL').asInteger then
        Inc(iQntImoveis);
      iIdImovel := _cdsAux.FieldByName('IDIMOVEL').asInteger;
      _cdsAux.Next;
    end;
    _cdsAux.First;

    if iQntImoveis <= 0 then
      iQntImoveis := 1;

    while not _cdsAux.Eof do
    begin
      _cdsAux.Edit;
      if _cdsAux.RecNo = _cdsAux.RecordCount then
        _cdsAux.FieldByName('VALOR').AsCurrency := iSaldoTot.AsFloat - fValorTotal
      else
        _cdsAux.FieldByName('VALOR').AsCurrency := RoundCM((iSaldoTot.AsFloat *
                                                   _cdsAux.FieldByName('PERCENTRATEIO').asFloat)/
                                                   (100 * iQntImoveis), 2);
      fValorTotal := fValorTotal + _cdsAux.FieldByName('VALOR').AsCurrency;
      _cdsAux.Post;
      _cdsAux.Next;
    end;
    _cdsAux.First;

    while not _cdsAux.Eof do
    begin
      if not qrySegreg
      .Locate('PATRO;PLANOPREV', VarArrayOf([
                  _cdsAux.FieldByName('PATRO').Value,
                  _cdsAux.FieldByName('PLANOPREV').Value]), []) then
      begin
        qrySegreg.Append;
        qrySegreg.FieldByName('PLANOPREV').Value := _cdsAux.FieldByName('PLANOPREV').Value;
        qrySegreg.FieldByName('PATRO').Value := _cdsAux.FieldByName('PATRO').Value;
        qrySegreg.FieldByName('PERCENTRATEIO').Value := 0;
        qrySegreg.FieldByName('VALOR').Value := _cdsAux.FieldByName('VALOR').Value;
      end
      else
      begin
       qrySegreg.Edit;
       qrySegreg.FieldByName('VALOR').Value := qrySegreg.FieldByName('VALOR').Value + _cdsAux.FieldByName('VALOR').Value;
      end;
       qrySegreg.Post;
      _cdsAux.Next;
    end;

    if iSaldoTot.asFloat <= 0 then
      fValorPercent := 1
    else
      fValorPercent := iSaldoTot.asFloat;

    qrySegreg.First;
    while not qrySegreg.Eof do
    begin
      qrySegreg.Edit;
        if i = qrySegreg.RecordCount then
        begin
          if dPercent > 0 then
            qrySegreg.FieldByName('PERCENTRATEIO').asFloat := Abs(100 - dPercent)
          else
            qrySegreg.FieldByName('PERCENTRATEIO').asFloat := 0;
        end
        else
          qrySegreg.FieldByName('PERCENTRATEIO').asFloat := Abs(RoundCM((qrySegreg.FieldbyName('VALOR').asFloat * 100) /
                                                                fValorPercent,2));
        dPercent := dPercent + qrySegreg.FieldByName('PERCENTRATEIO').asFloat;
      Inc(i);
      qrySegreg.Post;
      qrySegreg.Next;
    end;
  finally
    FreeAndNil(_cdsAux);
  end;
end;

procedure TdtmRelFinanc.ppSubReport3Print(Sender: TObject);
var
  dVlrTotImoMestre, dPercent : double;
begin
  inherited;
  dVlrTotImoMestre := 0;
  dPercent := 0;

  cdsImovAliDET.Filter := 'IDIMOVELMESTRE = ' + qryImovAli.FieldByName('IDIMOVELMESTRE').AsString;

  while not cdsImovAliDET.Eof do
  begin
    dVlrTotImoMestre := dVlrTotImoMestre + cdsImovAliDET.FieldByName('TOTVLRVENDA').asFloat;
    cdsImovAliDET.Next;
  end;

  cdsImovAliDET.First;
  while not cdsImovAliDET.Eof do
  begin
    cdsImovAliDET.Edit;
    if cdsImovAliDET.RecNo = cdsImovAliDET.RecordCount then
      cdsImovAliDET.FieldByName('PERCENTRATEIO').asFloat := abs(100 - dPercent)
    else
      cdsImovAliDET.FieldByName('PERCENTRATEIO').asFloat := ABS(RoundCM((cdsImovAliDET.FieldByName('TOTVLRVENDA').asFloat * 100)/
                                                                    dVlrTotImoMestre,2));
    dPercent := dPercent +  cdsImovAliDET.FieldByName('PERCENTRATEIO').asFloat;
    cdsImovAliDET.Post;
    cdsImovAliDET.Next;
  end;
  //qryImovAliDET.Open;
end;

procedure TdtmRelFinanc.ppDBText98GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := FloatToStrF( cdsSegImoveisCondVALOR.Value, ffCurrency, 17, 2 );
end;

procedure TdtmRelFinanc.ppDBText114GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := FloatToStrF( cdsSegImoveisTotVALOR.Value, ffCurrency, 17, 2 );
end;

procedure TdtmRelFinanc.ppSubReport6Print(Sender: TObject);
var
  curValor: Currency;
  dPercent : Double;
begin
  inherited;
  // SOL 126230 KTN 658659 Ricardo A.
  if cdsSegImoveisTot.Active then
    cdsSegImoveisTot.EmptyDataSet;

  cdsSegImoveisTot.Data := MontaQuerySegregacao;
  curValor := 0;
  dPercent := 0;
  cdsSegImoveisTot.First;
  while not cdsSegImoveisTot.Eof do
  begin
    cdsSegImoveisTot.Edit;
    {if cdsSegImoveisTot.RecNo = cdsSegImoveisTot.RecordCount then
      cdsSegImoveisTotVALOR.Value := ppDBText20.FieldValue - curValor
    else
      cdsSegImoveisTotVALOR.Value := ComunsImobiliario.Arredonda(
        cdsSegImoveisTotPPIPERCENTRATEIO.Value / 100 * ppDBText20.FieldValue, 2 );}
    if cdsSegImoveisTot.RecNo = cdsSegImoveisTot.RecordCount then
      cdsSegImoveisTotVALOR.Value := ppDBText20.FieldValue - curValor
    else
      cdsSegImoveisTotVALOR.Value := ComunsImobiliario.Arredonda((ppDBText20.FieldValue *
        cdsSegImoveisTotPPIPERCENTRATEIO.Value) / 100, 2 );

    cdsSegImoveisTot.Post;
    curValor := curValor + cdsSegImoveisTotVALOR.Value;
    cdsSegImoveisTot.Next;
  end;

  cdsSegImoveisTot.First;
  while not cdsSegImoveisTot.Eof do
  begin
    cdsSegImoveisTot.Edit;

    if cdsSegImoveisTot.RecNo = cdsSegImoveisTot.RecordCount then
      cdsSegImoveisTotPERCENT.Value := 100 - dPercent
    else
      cdsSegImoveisTotPERCENT.Value := ComunsImobiliario.Arredonda((cdsSegImoveisTotVALOR.Value * 100)/curValor,2);
    cdsSegImoveisTot.Post;
    dPercent := dPercent + cdsSegImoveisTotPERCENT.Value;
    cdsSegImoveisTot.Next;
  end;
  // FIM SOL 126230 KTN 658659 Ricardo A.
end;

procedure TdtmRelFinanc.ppSubReport5Print(Sender: TObject);
var
  curValor : Currency;
  dPercent :  double;
begin
  inherited;
  // SOL 126230 KTN 658659 Ricardo A.
  if ( qryCondPagVLRFINANC.Value > 0 ) then
  begin
    ppLabel141.Caption := 'Segregação da Condição de Pagamento: ' + qryCondPagDSCTIPO.Value;

   if qryCondPagDSCTIPO.asString = 'Repactuação' then
    ppLabel128.Caption := 'Resumo de Segregação - Por Valor da ' + qryCondPagDSCTIPO.Value
   else
    ppLabel128.Caption := 'Resumo de Segregação - Por Valor das Condições de Pagamento';

    if cdsSegImoveisCond.Active then
      cdsSegImoveisCond.EmptyDataSet;

    cdsSegImoveisCond.Data := MontaQuerySegregacao;
    curValor := 0;
    dPercent := 0;
    cdsSegImoveisCond.First;
    while not cdsSegImoveisCond.Eof do
    begin
      cdsSegImoveisCond.Edit;
      if cdsSegImoveisCond.RecNo = cdsSegImoveisCond.RecordCount then
        cdsSegImoveisCondVALOR.Value := ppDBText66.FieldValue - curValor
      else
        cdsSegImoveisCondVALOR.Value := ComunsImobiliario.Arredonda((ppDBText66.FieldValue *
                                                  cdsSegImoveisCondPPIPERCENTRATEIO.Value )/100,2);

      cdsSegImoveisCond.Post;

      curValor := curValor + cdsSegImoveisCondVALOR.Value;

      cdsSegImoveisCond.Next;
    end;

    cdsSegImoveisCond.First;
    while not cdsSegImoveisCond.Eof do
    begin
      cdsSegImoveisCond.Edit;

      if cdsSegImoveisCond.RecNo = cdsSegImoveisCond.RecordCount then
        cdsSegImoveisCondPERCENT.Value := 100 - dPercent
      else
        cdsSegImoveisCondPERCENT.Value := ComunsImobiliario.Arredonda((cdsSegImoveisCondVALOR.Value * 100)/curValor,2);
      cdsSegImoveisCond.Post;
      dPercent := dPercent + cdsSegImoveisCondPERCENT.Value;
      cdsSegImoveisCond.Next;
    end;
  end
  else
    cdsSegImoveisCond.EmptyDataSet;
  // FIM SOL 126230 KTN 658659 Ricardo A.   
end;

function TdtmRelFinanc.MontaQuerySegregacao: OleVariant;
var
  sSql: string;
  Ctrl: TCmControlObject;
  cdsImoxContr, cdsSegregVig, cdsTemp : TCMClientDataSet;
  iNumImoxContr : Integer;
begin
  // SOL 126320 KTN 660564 Ricardo A.
  Ctrl := TCmControlObject.Create;
  cdsImoxContr := TCMClientDataSet.Create(nil);
  cdsSegregVig := TCMClientDataSet.Create(nil);
  cdsTemp := TCMClientDataSet.Create(nil);
  try
    Ctrl.Initialize(
          dtmBaseDados.dbBaseDados,
          True,
          Sistema.ConnectionType,
          Sistema.ConnectionSide,
          Sistema.AppRemoteServer,
          True
          );
    sSQL := 'SELECT IDIMOVEL FROM CONTRATOXIMOVEL WHERE IDCONTRATOIMOVEL = ' +  qryContratoIDCONTRATOIMOVEL.asString;

    cdsImoxContr.Data := Ctrl.GetDataPacket(sSql);
    iNumImoxContr := cdsImoxContr.RecordCount;

    cdsSegregVig.Data := Ctrl.GetDataPacket('SELECT ' +
                                            '           ''                                             '' AS PATROCINADORA, '+
                                            '           ''                                                                    '' AS PLANOPREV, ' +
                                            '           0  AS PPIPERCENTRATEIO,' +
                                            '           0.00000 AS PERCENT, ' +
                                            '           0.00000 AS VALOR' +
                                            '  FROM  DUAL' +
                                            ' WHERE 1 = 2');

   while not cdsImoxContr.Eof do
   begin
    sSql := 'SELECT ' +
      '           PATRO.NOME AS PATROCINADORA, '+
      '           PLANO.NOME AS PLANOPREV, ' +
      '           PPI.PERCENTRATEIO AS PPIPERCENTRATEIO,' +
      '           0.00000 AS PERCENT, ' +
      '           0.00000 AS VALOR' +
      '   FROM' +
      '           PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, IMOVEL I ' +
      '   WHERE' +
      '           PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
      '           AND PPI.DATAVIGENCIA       = (SELECT MAX(PPV.DATAVIGENCIA) FROM PLANOPATROXVIGENCIAIMOB PPV'+
      '                                         WHERE PPV.DATAVIGENCIA <= ' + QuotedStr(DateToStr(Now)) +
      '                                           AND PPV.IDIMOVEL = ' + cdsImoxContr.FieldByName('IDIMOVEL').asString + ')'+
      '           AND PATRO.IDPESSOA         = PPI.IDPATRO' +
      '           AND PPI.IDIMOVEL           = I.IDIMOVEL' +
      '           AND I.IDIMOVEL             = ' + cdsImoxContr.FieldByName('IDIMOVEL').asString +
      '   ORDER BY PATROCINADORA, PLANOPREV';

      cdsTemp.Data := Ctrl.GetDataPacket(sSql);
      while not cdsTemp.Eof do
      begin
        if not cdsSegregVig.Locate('PLANOPREV;PATROCINADORA', VarArrayOf([
                                   cdsTemp.FieldByName('PLANOPREV').Value,
                                   cdsTemp.FieldByNAme('PATROCINADORA').Value]), []) then
        begin
          cdsSegregVig.Append;
          cdsSegregVig.FieldByName('PATROCINADORA').Value := cdsTemp.FieldByName('PATROCINADORA').Value;
          cdsSegregVig.FieldByName('PLANOPREV').Value := cdsTemp.FieldByName('PLANOPREV').Value;
          cdsSegregVig.FieldByName('PERCENT').Value := 0;
          cdsSegregVig.FieldByName('VALOR').Value := 0;
          cdsSegregVig.FieldByName('PPIPERCENTRATEIO').AsFloat := cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat;
        end
        else
        begin
          cdsSegregVig.Edit;
          cdsSegregVig.FieldByName('PPIPERCENTRATEIO').AsFloat := cdsSegregVig.FieldByName('PPIPERCENTRATEIO').AsFloat +
                                                                  cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat;
        end;
        cdsSegregVig.Post;
        cdsTemp.Next;
      end;
      cdsImoxContr.Next;
     end;

    cdsSegregVig.First;
    while not cdsSegregVig.eof do
    begin
      cdsSegregVig.Edit;
      cdsSegregVig.FieldByName('PPIPERCENTRATEIO').asFloat := RoundCM(cdsSegregVig.FieldByName('PPIPERCENTRATEIO').asFloat / iNumImoxContr, 2);
      cdsSegregVig.Post;
      cdsSegregVig.Next;
    end;
    Result := cdsSegregVig.Data;
  finally
    Ctrl.Free;
    FreeAndNil(cdsImoxContr);
    FreeAndNil(cdsSegregVig);
  end;
  // FIM SOL 126320 KTN 660564 Ricardo A.
end;

function TdtmRelFinanc.GetPercImovxContrato(iIDContratoImovel: Integer;
  dDataVigencia: TDateTime): OLEVariant;
var
  sSQL : string;
  Ctrl: TCmControlObject;
begin
  Ctrl := TCmControlObject.Create;
  try
    Ctrl.Initialize(
          dtmBaseDados.dbBaseDados,
          True,
          Sistema.ConnectionType,
          Sistema.ConnectionSide,
          Sistema.AppRemoteServer,
          True);

    sSQL := 'SELECT PES.NOME AS PATRO, ' +
            '       PPI.IDPATRO, ' +
            '       PPC.NOME AS PLANOPREV, ' +
            '       PPI.IDPLANOPREV, ' +
            '       PPI.PERCENTRATEIO, ' +
            '       CXI.IDIMOVEL, ' +
            '       0 AS VALOR ' +
            '  FROM PLANOPATROXVIGENCIAIMOB PPI, ' +
            '       CONTRATOXIMOVEL CXI, ' +
            '       PESSOA PES,  ' +
            '       PLANPREVCONTABIL PPC, ' +
            '       CONTRATOIMOVEL CTI  ' +
            'WHERE CTI.IDCONTRATOIMOVEL =' + IntToStr(iIDContratoImovel)  +
            '  AND PPI.DATAVIGENCIA = ' +
            '      (SELECT MAX(PPV.DATAVIGENCIA)  ' +
            '         FROM PLANOPATROXVIGENCIAIMOB PPV, CONTRATOXIMOVEL CXI ' +
            '        WHERE PPV.DATAVIGENCIA <= ' + QuotedStr(DateTimeToStr(dDataVigencia)) +
            '          AND PPV.IDIMOVEL = CXI.IDIMOVEL' +
            '          AND CXI.IDCONTRATOIMOVEL = ' + IntToStr(iIDContratoImovel) + ')' +
            '  AND CXI.IDCONTRATOIMOVEL(+) = CTI.IDCONTRATOIMOVEL ' +
            '  AND PPI.IDIMOVEL = CXI.IDIMOVEL ' +
            '   AND PPI.IDPATRO = PES.IDPESSOA  ' +
            '  AND PPI.IDPLANOPREV = PPC.IDPLANOPREV ' +
            'ORDER BY CXI.IDIMOVEL, PPI.IDPLANOPREV  ';

    Result := Ctrl.GetDataPacket(sSQL);
  finally
    FreeAndNil(Ctrl);
  end;
end;
                                                              
procedure TdtmRelFinanc.MontaQueryResumoSegrega;
var
  sSQL : string;
begin
  sSQL := 'SELECT  ''                                                                    '' AS PLANOPREV,' +
          '        ''                                                           '' AS PATRO, ' +
          '        0.00 AS PERCENTRATEIO, ' +
          '        0.00 AS VALOR ' +
          '  FROM DUAL   ' +
          ' WHERE 1 = 2' ;
  qrySegreg.Close;
  qrySegreg.SQL.Clear;
  qrySegreg.SQL.Add(sSQL);
  qrySegreg.Open;
  // Helen - SOL: 153702/5861 KTN: 1372228
  qrySegregNovo.Close;
  qrySegregNovo.SQL.Clear;
  qrySegregNovo.SQL.Add(sSQL);
  qrySegregNovo.Open;
end;

procedure TdtmRelFinanc.ppHeaderBand1AfterPrint(Sender: TObject);
begin
  inherited;
  CorAtual := clWhite;
end;

procedure TdtmRelFinanc.ppLine31Print(Sender: TObject);
begin
  inherited;
  (Sender as TppLine).Visible := bSeparador;
end;

procedure TdtmRelFinanc.qryExtratoNovoCalcFields(DataSet: TDataSet);
var sSql :String;
    Ctrl, CtrlSaldo, CtrlAtualizacao: TCmControlObject;
    cdsTemp, cdsTempSaldo, cdsTempAtualizacao : TCMClientDataSet;
    PrestAlteAtul : Double;
begin
  inherited;
//   qryExtratoNovoSaldo_Documento.Value := qryExtratoNovoSALDO_DOCUMENTO_CS.AsString;
//   qryExtratoNovoStatus.Value          := qryExtratoNovoSTATUS_CS.Value;
//   qryExtratoNovoAtualizacao.Value     := qryExtratoNovoATUALIZACAO_CS.AsString;

  // Helen - SOL: 153702/5861 KTN: 1372228
   qryExtratoNovoCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryExtratoNovoFLGTIPOLANC.AsInteger,qryExtratoNovoFLGLANCINTEGRA.AsInteger);
   if qryExtratoNovoFLGLANCINTEGRA.AsInteger = 0 then
   begin
       qryExtratoNovoSaldo_Documento.Value := qryExtratoNovoVLRPRESTACAO.AsString;
       if qryExtratoNovoCAL_TIPO.AsString <> 'Saldo Inicial' then
          qryExtratoNovoStatus.value       := 'Ñ Integrado';
   end;
   // Define Abono
  if qryExtratoNovoFLGCONCILIADO.AsString = 'S' then begin
     if qryExtratoNovoVLRPAGO.IsNull then begin
        if qryExtratoNovoIDREPACTUA.IsNull then
             qryExtratoNovoCAL_ABONO.AsString := 'Abonado'
        else qryExtratoNovoCAL_ABONO.AsString := 'Repactuado';
     end else begin
        if qryExtratoNovoVLRDIF.AsFloat = 0 then begin
           if (qryExtratoNovoDATAPAGAMENTO.AsDateTime > qryExtratoNovoDATALIMITE.AsDateTime) or
              (qryExtratoNovoVLRPAGO.AsFloat <> qryExtratoNovoVLRPRESTACAO.AsFloat) then begin
              qryExtratoNovoCAL_ABONO.AsString := 'Abono Total';
           end else begin
              qryExtratoNovoCAL_ABONO.AsString := '';
           end;
        end else begin
           if qryExtratoNovoIDDOCDIVERGE.IsNull then begin
              if qryExtratoNovoIDREPACTUA.IsNull then
                   qryExtratoNovoCAL_ABONO.AsString := 'Abonado'
              else qryExtratoNovoCAL_ABONO.AsString := 'Repactuado';
           end else begin
              qryExtratoNovoCAL_ABONO.AsString := 'Cobrança';
           end;
        end;
     end;
  end else if qryExtratoNovoFLGCONCILIADO.AsString = 'P' then begin
     qryExtratoNovoCAL_ABONO.AsString := 'Abono Parcial';
  end else if qryExtratoNovoFLGCONCILIADO.AsString = 'C' then begin
     qryExtratoNovoCAL_ABONO.AsString := 'Cobrança';
  end else begin
     qryExtratoNovoCAL_ABONO.AsString := '';
  end;

  // Define Status
  if qryExtratoNovoCODDOCUMENTO.AsString <> '' then
  begin
      {Ctrl := TCmControlObject.Create;
      cdsTemp := TCMClientDataSet.Create(nil);
      try
          Ctrl.Initialize(
              dtmBaseDados.dbBaseDados,
              True,
              Sistema.ConnectionType,
              Sistema.ConnectionSide,
              Sistema.AppRemoteServer,
              True
              );
          sSql := 'SELECT STATUS' +
                  '   FROM' +
                  '       DOCUMENTO D' +
          '   WHERE' +
          '           D.CODDOCUMENTO  = '  + qryExtratoNovoCODDOCUMENTO.AsString ;
          cdsTemp.Data := Ctrl.GetDataPacket(sSql);
          if not cdsTemp.Eof then
          begin
               if  cdsTemp.FieldByName('STATUS').Value = 2 then
                   qryExtratoNovoStatus.AsString := 'Baixado'
               else
                   qryExtratoNovoStatus.AsString := 'Aberto';
          end;
      finally
        FreeAndNil(Ctrl);
        FreeAndNil(cdsTemp); // ELS SOL 174604 KINTANA 1578809
      end;}

    if qryExtratoNovoSTATUS_CS.Value = 'Baixado' then
      qryExtratoNovoStatus.AsString := 'Baixado'
    else
      qryExtratoNovoStatus.AsString := 'Aberto';

  end;
  // Define Saldo Documento
  if qryExtratoNovoCODDOCUMENTO.AsString <> '' then
  begin
      {CtrlSaldo := TCmControlObject.Create;
      cdsTempSaldo := TCMClientDataSet.Create(nil);
      try
          CtrlSaldo.Initialize(
              dtmBaseDados.dbBaseDados,
              True,
              Sistema.ConnectionType,
              Sistema.ConnectionSide,
              Sistema.AppRemoteServer,
              True
              );
          sSql := 'SELECT ' +
                  '   NVL((SELECT SUM (L.VALOR) FROM LANCTODOCUM L ' +
                  '    WHERE L.CODDOCUMENTO  = '  + qryExtratoNovoCODDOCUMENTO.AsString +
                  '          AND DEBCRE = ''D'' ),0)' +
                  '   -  ' +
                  '   NVL((SELECT SUM (L.VALOR) FROM LANCTODOCUM L ' +
                  '    WHERE L.CODDOCUMENTO = ' + qryExtratoNovoCODDOCUMENTO.AsString +
                  '          AND DEBCRE = ''C'' ),0) TOTAL '  +
                  '    FROM DUAL  ' ;

          cdsTempSaldo.Data := CtrlSaldo.GetDataPacket(sSql);
          if not cdsTempSaldo.Eof then
          begin
               if  cdsTempSaldo.FieldByName('TOTAL').Value <>  0  then
                   qryExtratoNovoSaldo_Documento.Value := cdsTempSaldo.FieldByName('TOTAL').AsString
               else
               begin
                   qryExtratoNovoSaldo_Documento.Value := '';
               end;
          end;
      finally
        FreeAndNil(CtrlSaldo);
        FreeAndNil(cdsTempSaldo); // ELS SOL 174604 KINTANA 1578809
      end; }

       if qryExtratoNovoSALDO_DOCUMENTO_CS.Value <> 0 then
         qryExtratoNovoSaldo_Documento.Value := qryExtratoNovoSALDO_DOCUMENTO_CS.AsString
       else
         qryExtratoNovoSaldo_Documento.Value := '';
  end;

  // Define Atualizacao
  if qryExtratoNovoCODDOCUMENTO.AsString <> '' then
  begin
     { CtrlAtualizacao := TCmControlObject.Create;
      cdsTempAtualizacao := TCMClientDataSet.Create(nil);
      try
          CtrlAtualizacao.Initialize(
              dtmBaseDados.dbBaseDados,
              True,
              Sistema.ConnectionType,
              Sistema.ConnectionSide,
              Sistema.AppRemoteServer,
              True
              );
          sSql := ' SELECT ' +
                  '   SUM(L.VLRDIA) Atualizacao ' +
                  ' FROM LANCOPERDIAIMOB L ' +
                  ' WHERE L.CODDOCUMENTO  = '  + qryExtratoNovoCODDOCUMENTO.AsString +
                  '   AND L.IDOPERACAO <> 166 ' ;

          cdsTempAtualizacao.Data := CtrlAtualizacao.GetDataPacket(sSql);
          if not cdsTempAtualizacao.Eof then
          begin
               if  cdsTempAtualizacao.FieldByName('Atualizacao').Value <>  0  then
                   qryExtratoNovoAtualizacao.Value := cdsTempAtualizacao.FieldByName('Atualizacao').AsString
               else
               begin
                   qryExtratoNovoAtualizacao.Value := '';
               end;
          end;
      finally
        FreeAndNil(CtrlAtualizacao);
        FreeAndNil(cdsTempAtualizacao);  // ELS SOL 174604 KINTANA 1578809
      end;}

      if  qryExtratoNovoATUALIZACAO_CS.Value <>  0  then
        qryExtratoNovoAtualizacao.Value     := qryExtratoNovoATUALIZACAO_CS.AsString
      else
        qryExtratoNovoAtualizacao.Value := '';
  end;

  // Define Prestação+Ateradores+Atulalizações
  qryExtratoNovoPrestAlteAtul.Value := '';
  if qryExtratoNovoAtualizacao.Value <> '' then
  begin
       PrestAlteAtul := qryExtratoNovoTOT_DEVIDO.Value + qryExtratoNovoAtualizacao.asFloat ;
       qryExtratoNovoPrestAlteAtul.Value := FloatToStr(PrestAlteAtul);
  end
  else
       qryExtratoNovoPrestAlteAtul.Value := qryExtratoNovoTOT_DEVIDO.AsString;
end;

procedure TdtmRelFinanc.ppGroupFooterBand12AfterPrint(Sender: TObject);
begin
   inherited;
   // Helen - SOL: 153702/5861 KTN: 1372228
   lblDtLimiteNovo.Caption       := DateToStr(dDataLimite);
   iSDNovo.Value                 := 0;
   iAtrasoNovo.Value             := 0;
   iDivergNovo.Value             := 0;
   iAcertoNovo.Value             := 0;
   iResiduoNovo.Value            := 0;
   iSaldoTotNovo.Value           := 0;
   CorrecaoIncorporadaNovo.Value := 0;
   fTotalSaldoDocumento:=0 ;
end;

procedure TdtmRelFinanc.ppGroupFooterBand12BeforePrint(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 153702/5861 KTN: 1372228
  pplSaldoDevNovo.Caption := 'Saldo Devedor vincendo em ' + DateToStr(dDataLimite);
  iSDNovo.Value           := FuncAlienacao.CalcSaldoDevedor(qryExtratoNovoIDCONTRATOIMOVEL.AsInteger, -1, dDataLimite);
end;

procedure TdtmRelFinanc.ppSubReport7Print(Sender: TObject);
var
  fValorPlano, fValorTotal, fValorPercent : Currency;
  i, iQntImoveis, iIdImovel : integer;
  _cdsAux : TCMClientDataSet;
  dPercent : double;

begin
  inherited;
  // Helen - SOL: 153702/5861 KTN: 1372228
  fValorPlano := 0;
  fValorTotal := 0;
  i := 1;
  iQntImoveis := 0;
  dPercent := 0;
  fValorPercent := 0;
  _cdsAux := TCMClientDataSet.Create(nil);
  try
    _cdsAux.Data := GetPercImovxContrato(qryExtratoNovoIDCONTRATOIMOVEL.AsInteger,dDataLimite);
    MontaQueryResumoSegrega;

    while not _cdsAux.Eof do
    begin
      if iIdImovel <> _cdsAux.FieldByName('IDIMOVEL').asInteger then
        Inc(iQntImoveis);
      iIdImovel := _cdsAux.FieldByName('IDIMOVEL').asInteger;
      _cdsAux.Next;
    end;
    _cdsAux.First;

    if iQntImoveis <= 0 then
      iQntImoveis := 1;

    while not _cdsAux.Eof do
    begin
      _cdsAux.Edit;
      if _cdsAux.RecNo = _cdsAux.RecordCount then
        _cdsAux.FieldByName('VALOR').AsCurrency := iSaldoTotNovo.AsFloat - fValorTotal
      else
        _cdsAux.FieldByName('VALOR').AsCurrency := RoundCM((iSaldoTotNovo.AsFloat *
                                                   _cdsAux.FieldByName('PERCENTRATEIO').asFloat)/
                                                   (100 * iQntImoveis), 2);
      fValorTotal := fValorTotal + _cdsAux.FieldByName('VALOR').AsCurrency;
      _cdsAux.Post;
      _cdsAux.Next;
    end;
    _cdsAux.First;

    while not _cdsAux.Eof do
    begin
      if not qrySegregNovo.Locate('PATRO;PLANOPREV', VarArrayOf([
                  _cdsAux.FieldByName('PATRO').Value,
                  _cdsAux.FieldByName('PLANOPREV').Value]), []) then
      begin
        qrySegregNovo.Append;
        qrySegregNovo.FieldByName('PLANOPREV').Value := _cdsAux.FieldByName('PLANOPREV').Value;
        qrySegregNovo.FieldByName('PATRO').Value := _cdsAux.FieldByName('PATRO').Value;
        //qrySegregNovo.FieldByName('PERCENTRATEIO').Value := 0;
        qrySegregNovo.FieldByName('PERCENTRATEIO').Value :=_cdsAux.FieldByName('PERCENTRATEIO').Value;
        qrySegregNovo.FieldByName('VALOR').Value := _cdsAux.FieldByName('VALOR').Value;
      end
      else
      begin
       qrySegregNovo.Edit;
       qrySegregNovo.FieldByName('VALOR').Value := qrySegregNovo.FieldByName('VALOR').Value + _cdsAux.FieldByName('VALOR').Value;
      end;
       qrySegregNovo.Post;
      _cdsAux.Next;
    end;

    if iSaldoTotNovo.asFloat <= 0 then
      fValorPercent := 1
    else
      fValorPercent := iSaldoTotNovo.asFloat;

    qrySegregNovo.First;
   { while not qrySegregNovo.Eof do
    begin
      qrySegregNovo.Edit;
        if i = qrySegregNovo.RecordCount then
        begin
          if dPercent > 0 then
            qrySegregNovo.FieldByName('PERCENTRATEIO').asFloat := Abs(100 - dPercent)
          else
            qrySegregNovo.FieldByName('PERCENTRATEIO').asFloat := 0;
        end
        else
          qrySegregNovo.FieldByName('PERCENTRATEIO').asFloat := Abs(RoundCM((qrySegregNovo.FieldbyName('VALOR').asFloat * 100) /
                                                                fValorPercent,2));
        dPercent := dPercent + qrySegregNovo.FieldByName('PERCENTRATEIO').asFloat;
      Inc(i);
      qrySegregNovo.Post;
      qrySegregNovo.Next;
    end;   }
  finally
    FreeAndNil(_cdsAux);
  end;
end;

procedure TdtmRelFinanc.qryCondExtrNovoCalcFields(DataSet: TDataSet);
begin
  inherited;
  // KTN 1638829 SOL 178419 Otacilio Aquino ** Inicio **

  // Helen - SOL: 153702/5861 KTN: 1372228
  if qryCondExtrNovoTIPOCONDPAG.AsString = 'V' then 
     qryCondExtrNovoCal_Tipo.AsString := 'A Vista'
  else if qryCondExtrNovoTIPOCONDPAG.AsString = 'S' then
     qryCondExtrNovoCal_Tipo.AsString := 'Sinal'
  else if qryCondExtrNovoTIPOCONDPAG.AsString = 'C' then
     qryCondExtrNovoCal_Tipo.AsString := 'Caução'
  else if qryCondExtrNovoTIPOCONDPAG.AsString = 'P' then
     qryCondExtrNovoCal_Tipo.AsString := 'Parcelamento'
  else if qryCondExtrNovoTIPOCONDPAG.AsString = 'R' then
     qryCondExtrNovoCal_Tipo.AsString := 'Repactuação';

  if qryCondExtrNovoFORMACALCULO.AsString = '18' then
     qryCondExtrNovoCal_Forma.AsString := 'Correção Mensal sobre Saldo Devedor, Parcela calculada sobre saldo devedor por parcelas restantes'
  else if qryCondExtrNovoFORMACALCULO.AsString = '9' then
     qryCondExtrNovoCal_Forma.AsString := 'FIXA - Sem juros e sem correção'
  else if qryCondExtrNovoFORMACALCULO.AsString = '11' then
     qryCondExtrNovoCal_Forma.AsString := 'JUROS MENSAL - Corrige Saldo Dev. COMPOSTO mensal, Juros sobre Saldo Dev. COMPOSTO e Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '6' then
     qryCondExtrNovoCal_Forma.AsString := 'JUROS MENSAL - Sobre Saldo Dev. e Parcela, com correção e recalculo anual'
  else if qryCondExtrNovoFORMACALCULO.AsString = '15' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Correção Mensal da Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '1' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Corrige Saldo Dev. anual, Incorpora resíduo, Recalculo anual da Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '4' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Corrige Saldo Dev. anual, Não incorpora resíduo, Recalculo anual da parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '10' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Corrige Saldo Dev. mensal, parcela fixa com indice projetado'
  else if qryCondExtrNovoFORMACALCULO.AsString = '2' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Corrige Saldo Dev. mensal, recalculo anual da Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '14' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção anual da Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '3' then
     qryCondExtrNovoCal_Forma.AsString := 'PRICE - Corrige Saldo Dev. mensal, Sem Recalculo, com Correção na Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '13' then
       qryCondExtrNovoCal_Forma.AsString := 'SAC - Calcula Correção e Juros mensal sobre a Parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '16' then
     qryCondExtrNovoCal_Forma.AsString := 'SAC - Calcula Juros e Correção mensal sobre o Saldo Devedor'
  else if qryCondExtrNovoFORMACALCULO.AsString = '17' then
     qryCondExtrNovoCal_Forma.AsString := 'SAC - Calcula Juros sobre a Parcela com geração de resíduo'
  else if qryCondExtrNovoFORMACALCULO.AsString = '8' then
     qryCondExtrNovoCal_Forma.AsString := 'SAC - Corrige Saldo Dev. Anual, Calcula Juros sobre a Parcela, Recalculo anual da parcela'
  else if qryCondExtrNovoFORMACALCULO.AsString = '12' then
     qryCondExtrNovoCal_Forma.AsString := 'SAC - Corrige Saldo Dev. Anual, Calcula Juros sobre Saldo Devedor, Recaculo anual da parcela'
  // KTN 1638829 SOL 178419 Otacilio Aquino ** Fim **
  else if qryCondExtrNovoFORMACALCULO.AsString = '19' then
     qryCondExtrNovoCal_Forma.AsString := 'JUROS MENSAL - Atualização mensal da parcela, sem alteração do saldo devedor'
  else if qryCondExtrNovoFORMACALCULO.AsString = '20' then
     qryCondExtrNovoCal_Forma.AsString := 'JUROS MENSAL - Atualização mensal da parcela, pelo valor da parcela anterior, sem alteração do saldo devedor' //WO 18846
end;

procedure TdtmRelFinanc.ppDBText124GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  // Helen - SOL: 153702/5861 KTN: 1372228
  if Text <> '' then
     Text := formatFloat('#,##0.00', StrToFloatDef(Text,0));
end;

procedure TdtmRelFinanc.ppDetailBand13BeforePrint(Sender: TObject);
begin
  inherited;
  if qryExtratoNovoSaldo_Documento.Value <> '' then
     fTotalSaldoDocumento :=  fTotalSaldoDocumento + qryExtratoNovoSaldo_Documento.AsFloat;
end;

procedure TdtmRelFinanc.ppRegion13Print(Sender: TObject);
begin
  inherited;
  // Helen - SOL: 153702/5861 KTN: 1372228
  ppLabel223.Caption   := formatFloat('#,##0.00',(fTotalSaldoDocumento));
  fTotalSaldoDocumento := 0;
end;

procedure TdtmRelFinanc.ppDBText117GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  // Helen - SOL: 153702/5861 KTN: 1372228
  if Text <> '' then
     Text := formatFloat('#,##0.00', StrToFloatDef(Text,0));
end;

procedure TdtmRelFinanc.ppGroupHeaderBand12BeforePrint(Sender: TObject);
begin
  inherited;
  // KTN 1638829 SOL 178419 Otacilio Aquino
  // A propriedade DataSource dessa qry estava vinculada com a qryExtratoNovo fazendo consulta desnecessaria
  // Adicionada neste evento e desvinculando a propriedade DataSource so ira fazer a consulta no momento exato.
  qryCondExtrNovo.Close;
  qryCondExtrNovo.ParamByName('IDCONTRATOIMOVEL').Value := qryExtratoNovo.FieldByName('IDCONTRATOIMOVEL').Value;
  qryCondExtrNovo.open;
end;

procedure TdtmRelFinanc.ppGroupHeaderBand12AfterPrint(Sender: TObject);
begin
  inherited;
  // KTN 1638829 SOL 178419 Otacilio Aquino
  qryCondExtrNovo.Close;
end;

procedure TdtmRelFinanc.qryInadAnaNovoCalcFields(DataSet: TDataSet);
begin
  inherited;

   qryInadAnaNovoCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryInadAnaNovoFLGTIPOLANC.AsInteger,qryInadAnaNovoFLGLANCINTEGRA.AsInteger);
end;

end.


