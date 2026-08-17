{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
SOL  : 181444
KTN  : 1682426
Responsável : Higor Nayde Ferreira
Data        : 13/06/2012
Descrição   : Modificada a procedure de MontaQuerySegregacaoListagemImoveis
            para carregar dados descritivo com apóstrofe no meio da string.
--------------------------------------------------------------------------------
SOL  : 131925
KTN  : 762446
Responsável : Felipe de Oliveira Silva
Data        : 10/05/2010
Descrição   : Modificada a procedure MontaQuerySegregacaoListagemImoveis para
              contemplar os dados do relatório pela data de vigência
--------------------------------------------------------------------------------
SOL  : 131826
KTN  : 754103
Responsável : Felipe de Oliveira Silva
Data        : 23/04/2010
Descrição   : Alterado layout do relatório rptListagemImovelSeg para exibir o
              total de imóveis impressos no relatório
--------------------------------------------------------------------------------
Pendências  : 27031
Responsável : Daniel Simões
Data        : 06/12/2007
Descrição   : Adiconado na 'qryListagemImovel' os campos 'IMOAREACOMUM',
              'IMOAREATOTAL' e 'IMOAREAGERENCIAL' ...
--------------------------------------------------------------------------------
Pendências  : 25051
Responsável : Gustavo Mendes
Data        : 02/10/2007
Descrição   : Implementação de filtros de Locatario e Segmento, no relatorio de
              Receita por M2.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit dRelAdminImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppCache, ppDB, ppDBBDE, ppStrtch,
  ppMemo, ppVar, ppRelatv, ppDBPipe, ppSubRpt, Grids, DBGrids, ppModule,
  raCodMod, ppRichTx, ppRegion, StdCtrls, DBClient, uCmSqlParams, uCMMath;

type
  TdtmRelAdminImob = class(TdtmReports)
    pplAlugueisEventos: TppBDEPipeline;
    dsAlugueisEventos: TwwDataSource;
    qryAlugueisEventos: TwwQuery;
    rptAlugueisEventos: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLabel13: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBMemo2: TppDBMemo;
    ppFooterBand3: TppFooterBand;
    ppCalc5: TppSystemVariable;
    ppLine6: TppLine;
    ppLabel16: TppLabel;
    ppCalc6: TppSystemVariable;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel17: TppLabel;
    ppDBText8: TppDBText;
    ppLabel19: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    rptAlugueisEventos_LinhaTitulo: TppLine;
    rptAlugueisEventosLine2: TppLine;
    rptAlugueisEventosLabel1: TppLabel;
    rptAlugueisEventosLabel2: TppLabel;
    rptAlugueisEventosLabel3: TppLabel;
    rptAlugueisEventosLabel4: TppLabel;
    rptAlugueisEventosLabel5: TppLabel;
    rptAlugueisEventosLabel6: TppLabel;
    rptAlugueisEventosLabel7: TppLabel;
    rptAlugueisEventosLabel8: TppLabel;
    rptAlugueisEventosLabel9: TppLabel;
    rptAlugueisEventosLabel10: TppLabel;
    rptAlugueisEventosLabel11: TppLabel;
    rptAlugueisEventosLabel13: TppLabel;
    rptAlugueisEventos_Separador: TppLine;
    rptAlugueisEventosLabel12: TppLabel;
    rptAlugueisEventosDBText13: TppDBText;
    rptAlugueisEventosLabel15: TppLabel;
    rptAlugueisEventosDBText16: TppDBText;
    qryAlugueisEventosJan: TStringField;
    qryAlugueisEventosFev: TStringField;
    qryAlugueisEventosMar: TStringField;
    qryAlugueisEventosAbr: TStringField;
    qryAlugueisEventosMai: TStringField;
    qryAlugueisEventosJun: TStringField;
    qryAlugueisEventosJul: TStringField;
    qryAlugueisEventosAgo: TStringField;
    qryAlugueisEventosSet: TStringField;
    qryAlugueisEventosOut: TStringField;
    qryAlugueisEventosNov: TStringField;
    qryAlugueisEventosDez: TStringField;
    rptAlugueisEventosDBMemo1: TppDBMemo;
    rptAlugueisEventosDBMemo2: TppDBMemo;
    rptAlugueisEventosDBMemo3: TppDBMemo;
    rptAlugueisEventosDBMemo4: TppDBMemo;
    rptAlugueisEventosDBMemo5: TppDBMemo;
    rptAlugueisEventosDBMemo6: TppDBMemo;
    rptAlugueisEventosDBMemo7: TppDBMemo;
    rptAlugueisEventosDBMemo8: TppDBMemo;
    rptAlugueisEventosDBMemo9: TppDBMemo;
    rptAlugueisEventosDBMemo10: TppDBMemo;
    rptAlugueisEventosDBMemo11: TppDBMemo;
    rptAlugueisEventosDBMemo12: TppDBMemo;
    qryQuadroImoveis: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    dsQuadroImoveis: TwwDataSource;
    pplQuadroImoveis: TppBDEPipeline;
    rptQuadroImoveis: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText2: TppDBText;
    ppReport1DBMemo1: TppDBMemo;
    ppReport1DBText1: TppDBText;
    ppReport1DBMemo2: TppDBMemo;
    rptQuadroImoveis_Separador: TppLine;
    rptQuadroImoveisDBText1: TppDBText;
    rptQuadroImoveisLabel2: TppLabel;
    ppFooterBand2: TppFooterBand;
    ppCalc3: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppCalc4: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    rptQuadroImoveis_LinhaTitulo: TppLine;
    ppDBText6: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppReport1Label1: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryQuadroImoveisNOMEMESTRE: TStringField;
    rptQuadroImoveisDBText2: TppDBText;
    rptQuadroImoveisLabel3: TppLabel;
    rptQuadroImoveisLabel4: TppLabel;
    rptQuadroImoveisLabel5: TppLabel;
    rptQuadroImoveisLabel6: TppLabel;
    rptQuadroImoveisDBText3: TppDBText;
    rptQuadroImoveisLine2: TppLine;
    rptQuadroImoveisShape1: TppShape;
    rptQuadroImoveisLabel7: TppLabel;
    rptQuadroImoveisDBCalc1: TppDBCalc;
    rptQuadroImoveisDBCalc2: TppDBCalc;
    rptQuadroImoveisDBCalc4: TppDBCalc;
    rptQuadroImoveisLabel8: TppLabel;
    rptQuadroImoveisLabel9: TppLabel;
    rptQuadroImoveisLabel10: TppLabel;
    rptQuadroImoveisLabel11: TppLabel;
    rptQuadroImoveisLabel12: TppLabel;
    rptQuadroImoveisLabel13: TppLabel;
    rptQuadroImoveisDBCalc5: TppDBCalc;
    rptQuadroImoveisDBText4: TppDBText;
    qryQuadroImoveisDataReferencia: TDateTimeField;
    qryContratosAdminSint: TwwQuery;
    dsContratosAdminSint: TwwDataSource;
    pplContratosAdminSint: TppBDEPipeline;
    rptContratosAdminSint: TppReport;
    rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppDetailBand12: TppDetailBand;
    rptContratosAdminSint_Separador: TppLine;
    ppFooterBand12: TppFooterBand;
    ppCalc23: TppSystemVariable;
    ppLine37: TppLine;
    ppLabel112: TppLabel;
    ppCalc24: TppSystemVariable;
    qryContratosAdminSintContratoExtenso: TStringField;
    rptContratosLocatarioLabel3: TppLabel;
    rptContratosAdminSint_lblAdministradora: TppLabel;
    qryListagemImovel: TwwQuery;
    StringField15: TStringField;
    StringField18: TStringField;
    DateTimeField5: TDateTimeField;
    dsListagemImovel: TwwDataSource;
    pplListagemImovel: TppBDEPipeline;
    rptListagemImovel: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    rptListagemImovel_bndImovel: TppDetailBand;
    ppDBText48: TppDBText;
    ppDBMemo16: TppDBMemo;
    ppDBText50: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine41: TppLine;
    ppLabel136: TppLabel;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppLine42: TppLine;
    ppLabel137: TppLabel;
    ppDBText58: TppDBText;
    ppLine43: TppLine;
    ppDBText59: TppDBText;
    ppLabel138: TppLabel;
    ppLabel143: TppLabel;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppShape3: TppShape;
    ppLine44: TppLine;
    ppLabel150: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    rptContratosAdminSintSummaryBand1: TppSummaryBand;
    qryContratosAdminAnal: TwwQuery;
    StringField5: TStringField;
    FloatField1: TFloatField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField54: TFloatField;
    dsContratosAdminAnal: TwwDataSource;
    pplContratosAdminAnal: TppBDEPipeline;
    rptContratosAdminAnal: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLine34: TppLine;
    ppLabel122: TppLabel;
    rptContratosAdminAnal_lblAdministradora: TppLabel;
    rptContratosAdminAnal_bndImovel: TppDetailBand;
    ppDBText17: TppDBText;
    ppLine35: TppLine;
    ppDBText18: TppDBText;
    ppLabel128: TppLabel;
    ppDBMemo13: TppDBMemo;
    ppDBMemo14: TppDBMemo;
    ppDBMemo15: TppDBMemo;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppFooterBand13: TppFooterBand;
    ppLine38: TppLine;
    ppLabel177: TppLabel;
    rptContratosAdminAnalLabel1: TppLabel;
    rptContratosAdminAnalLabel2: TppLabel;
    rptContratosAdminAnalLabel7: TppLabel;
    rptContratosAdminAnalLabel8: TppLabel;
    rptContratosAdminAnalLabel9: TppLabel;
    rptContratosAdminAnalLabel12: TppLabel;
    rptContratosAdminAnalLabel13: TppLabel;
    rptContratosAdminAnalLabel14: TppLabel;
    rptContratosAdminAnalLine1: TppLine;
    rptContratosAdminAnalLabel16: TppLabel;
    rptContratosAdminAnalDBMemo1: TppDBMemo;
    qryContratosAdminAnalIDIMOVEL: TFloatField;
    qryContratosAdminAnalCIMVLRAJUSTADO: TFloatField;
    qryContratosAdminAnalCIMDESCRICAO: TStringField;
    qryContratosAdminAnalAREA_OCUPADA: TFloatField;
    qryContratosAdminAnalALUGUEL: TFloatField;
    qryContratosAdminAnalALUGUELM2: TFloatField;
    rptContratosAdminAnalLine3: TppLine;
    rptContratosAdminAnalDBCalc1: TppDBCalc;
    rptContratosAdminAnalDBCalc2: TppDBCalc;
    rptContratosAdminAnalLine4: TppLine;
    rptContratosAdminAnalShape1: TppShape;
    rptContratosAdminAnalLabel4: TppLabel;
    rptContratosAdminAnalDBText1: TppDBText;
    rptContratosAdminAnalDBCalc3: TppDBCalc;
    rptListagemImovelLabel1: TppLabel;
    rptListagemImovelLabel2: TppLabel;
    qryListagemImovelIDMESTRE: TFloatField;
    qryListagemImovelNOMEMESTRE: TStringField;
    qryListagemImovelIMONUMERO: TStringField;
    qryListagemImovelIMOBAIRRO: TStringField;
    qryListagemImovelIMOCEP: TStringField;
    qryListagemImovelNOMEIMOVEL: TStringField;
    qryListagemImovelIMOMATRICULA: TStringField;
    qryListagemImovelFLGSTATUSOCUPACAO: TStringField;
    qryListagemImovelIDIMOVEL: TFloatField;
    qryListagemImovelIMOAREA: TFloatField;
    qryListagemImovelTIPO_IMOVEL: TStringField;
    qryListagemImovelOCUPACAO_IMOVEL: TStringField;
    qryListagemContrato: TwwQuery;
    dsListagemContrato: TwwDataSource;
    pplListagemContrato: TppBDEPipeline;
    rptListagemContrato: TppReport;
    ppHeaderBand15: TppHeaderBand;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLine45: TppLine;
    ppLabel152: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel155: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppLabel162: TppLabel;
    rptListagemContratos_lblAdministradora: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppLabel166: TppLabel;
    ppDBText62: TppDBText;
    ppDBMemo18: TppDBMemo;
    ppDBMemo19: TppDBMemo;
    ppDBText63: TppDBText;
    ppDBMemo21: TppDBMemo;
    ppFooterBand15: TppFooterBand;
    ppLine47: TppLine;
    ppLabel167: TppLabel;
    rptListagemContratosLabel1: TppLabel;
    rptListagemContratosLabel2: TppLabel;
    rptListagemContratosLabel3: TppLabel;
    rptListagemContratosLabel4: TppLabel;
    rptListagemContratosLabel5: TppLabel;
    rptListagemContratosLabel6: TppLabel;
    rptListagemContratosLabel7: TppLabel;
    rptListagemContratosLabel8: TppLabel;
    rptListagemContratosDBText1: TppDBText;
    rptListagemContratosDBText2: TppDBText;
    rptListagemContratosDBText3: TppDBText;
    rptListagemContratosDBText4: TppDBText;
    rptListagemContratosDBText5: TppDBText;
    rptListagemContratosDBText6: TppDBText;
    rptListagemContratosDBText7: TppDBText;
    rptListagemContratosDBText8: TppDBText;
    qryListagemContratoIDCONTRATOIMOVEL: TFloatField;
    qryListagemContratoCONNUMERO: TStringField;
    qryListagemContratoCONNOME: TStringField;
    qryListagemContratoCONDATAINICIO: TDateTimeField;
    qryListagemContratoCONDATAFIM: TDateTimeField;
    qryListagemContratoCONVLRAJUSTADO: TFloatField;
    qryListagemContratoCONINDICEREAJUSTE: TFloatField;
    qryListagemContratoIDLOCATARIO: TFloatField;
    qryListagemContratoIDADMINIMOVEL: TFloatField;
    qryListagemContratoCONTAXAADMIN: TFloatField;
    qryListagemContratoCONPROXREAJUSTE: TDateTimeField;
    qryListagemContratoFLGCOMPETALUGUEL: TStringField;
    qryListagemContratoCONDATACARENCIA: TDateTimeField;
    qryListagemContratoCONDATAREAJUSTE: TDateTimeField;
    qryListagemContratoCODPORTFORMA: TFloatField;
    qryListagemContratoIDTIPOCUSTORECIMO: TFloatField;
    qryListagemContratoCOMPETENCIA: TStringField;
    qryListagemContratoVENCIMENTO: TStringField;
    qryListagemContratoTOLERANCIA: TStringField;
    qryListagemContratoPORTADOR_FORMA: TStringField;
    qryListagemContratoDESCCUSTORECIMO: TStringField;
    qryListagemContratoMOESIGLA: TStringField;
    qryListagemContratoLOCATARIO_RS: TStringField;
    qryListagemContratoLOCATARIO_NF: TStringField;
    qryListagemContratoADMINISTRADORA_RS: TStringField;
    qryListagemContratoADMINISTRADORA_NF: TStringField;
    rptListagemContratoLabel1: TppLabel;
    qryContratoXImovel: TwwQuery;
    qryContratoXImovelIDCONTRATOIMOVEL: TFloatField;
    qryContratoXImovelIDIMOVEL: TFloatField;
    qryContratoXImovelFLGRATEIO: TFloatField;
    qryContratoXImovelCIMPERCENTRATEIO: TFloatField;
    qryContratoXImovelCIMDESCRICAO: TStringField;
    rptListagemImovelDBText4: TppDBText;
    rptListagemImovelDBText5: TppDBText;
    rptListagemImovelLabel3: TppLabel;
    rptListagemImovelLabel4: TppLabel;
    rptListagemImovelDBText6: TppDBText;
    rptListagemImovelLabel9: TppLabel;
    rptListagemImovelLine1: TppLine;
    rptListagemImovelDBMemo1: TppDBMemo;
    rptListagemImovelDBMemo2: TppDBMemo;
    qryListagemImovelIMOVLRCOMPRA: TFloatField;
    qryListagemImovelIMODATACOMPRA: TDateTimeField;
    qryListagemImovelIMOMOEDACOMPRA: TFloatField;
    qryListagemImovelMOEDA_COMPRA: TStringField;
    qryListagemContratoCONDATAFIANCAINI: TDateTimeField;
    qryListagemContratoCONDATAFIANCAFIM: TDateTimeField;
    rptListagemContratoLabel2: TppLabel;
    rptListagemContratoLabel3: TppLabel;
    rptListagemContratoLabel4: TppLabel;
    rptListagemContratoDBText2: TppDBText;
    rptListagemContratoDBText3: TppDBText;
    rptListagemContratoLine1: TppLine;
    qryListagemProposta: TwwQuery;
    dsListagemProposta: TwwDataSource;
    pplListagemProposta: TppBDEPipeline;
    rptListagemProposta: TppReport;
    ppHeaderBand27: TppHeaderBand;
    ppLabel268: TppLabel;
    ppLabel272: TppLabel;
    ppDetailBand27: TppDetailBand;
    ppDBText108: TppDBText;
    ppLabel281: TppLabel;
    ppLabel283: TppLabel;
    ppLabel284: TppLabel;
    ppDBText115: TppDBText;
    ppLabel294: TppLabel;
    ppFooterBand27: TppFooterBand;
    ppLine99: TppLine;
    ppLabel299: TppLabel;
    rptListagemPropostaLabel1: TppLabel;
    rptListagemPropostaLabel2: TppLabel;
    rptListagemPropostaDBText1: TppDBText;
    rptListagemPropostaDBText2: TppDBText;
    rptListagemPropostaLabel4: TppLabel;
    rptListagemPropostaLine1: TppLine;
    rptListagemPropostaDBText3: TppDBText;
    rptListagemPropostaDBText4: TppDBText;
    qryListagemPropostaIDPROPOSTA: TFloatField;
    qryListagemPropostaIDEMPRESAPROP: TFloatField;
    qryListagemPropostaPRODATA: TDateTimeField;
    qryListagemPropostaPRONOME: TStringField;
    qryListagemPropostaPRODESCRICAO: TMemoField;
    qryListagemPropostaPROVLROM: TFloatField;
    qryListagemPropostaPROVLR: TFloatField;
    qryListagemPropostaPROTIR: TFloatField;
    qryListagemPropostaPROPAYBACK: TFloatField;
    qryListagemPropostaPROCONDICOES: TMemoField;
    qryListagemPropostaPROAPRESENTADA: TStringField;
    qryListagemPropostaPRONUMERO: TStringField;
    qryListagemPropostaNF_PROPRIETARIO: TStringField;
    qryListagemPropostaRS_PROPRIETARIO: TStringField;
    qryListagemPropostaNF_RESPONSAVEL: TStringField;
    qryListagemPropostaTIPO_IMOVEL: TStringField;
    qryListagemPropostaMOESIGLA: TStringField;
    rptListagemPropostaLabel5: TppLabel;
    rptListagemPropostaLabel6: TppLabel;
    rptListagemPropostaDBText5: TppDBText;
    rptListagemPropostaLabel7: TppLabel;
    rptListagemPropostaDBText6: TppDBText;
    rptListagemPropostaDBText7: TppDBText;
    qryListagemPropostaCOMPLETO_PROPRIETARIO: TStringField;
    rptListagemPropostaLabel3: TppLabel;
    rptListagemPropostaDBText8: TppDBText;
    rptListagemPropostaDBText9: TppDBText;
    rptListagemPropostaLabel8: TppLabel;
    rptListagemPropostaLine2: TppLine;
    rptListagemPropostaShape1: TppShape;
    rptListagemPropostaLabel9: TppLabel;
    rptListagemProposta_lblData: TppLabel;
    rptListagemPropostaLabel13: TppLabel;
    rptListagemProposta_lblSegmento: TppLabel;
    rptContratosMestre: TppReport;
    rptContratosMestre_CabecalhoRelat: TppHeaderBand;
    ppLabel31: TppLabel;
    ppLabel33: TppLabel;
    rptContratosMestre_lblAdministradora: TppLabel;
    rptContrImoMestreLabel4: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppFooterBand9: TppFooterBand;
    rptContrImoMestreLine4: TppLine;
    rptContrImoMestreLabel11: TppLabel;
    rptContrImoMestreGroup2: TppGroup;
    rptContratosMestre_CabecalhoGrupo: TppGroupHeaderBand;
    rptContratosMestre_LinhaTitulo: TppLine;
    rptContrImoMestreLabel1: TppLabel;
    rptContrImoMestreLabel2: TppLabel;
    rptContrImoMestreDBText1: TppDBText;
    rptContrImoMestreDBText2: TppDBText;
    rptContrImoMestreGroupFooterBand2: TppGroupFooterBand;
    rptContrImoMestreLine3: TppLine;
    rptContrImoMestreLabel9: TppLabel;
    rptContrImoMestreShape1: TppShape;
    rptContrImoMestreDBCalc3: TppDBCalc;
    rptContrImoMestreDBCalc4: TppDBCalc;
    rptContrImoMestreDBCalc5: TppDBCalc;
    qryContratosMestre: TwwQuery;
    dsContratosMestre: TwwDataSource;
    pplContratosMestre: TppBDEPipeline;
    qryContratosMestreEND_EXTENSO: TStringField;
    rptContratosAdminAnalLabel3: TppLabel;
    rptContratosAdminAnal_lblAluguelImovel: TppLabel;
    rptContratosMestreDBCalc1: TppDBCalc;
    rptContratosMestreShape1: TppShape;
    rptContratosMestreLabel1: TppLabel;
    rptContratosAdminSintLabel1: TppLabel;
    rptContratosAdminSintLabel3: TppLabel;
    rptContratosAdminSintLabel4: TppLabel;
    rptContratosAdminSintLabel5: TppLabel;
    rptContratosAdminSintLabel6: TppLabel;
    rptContratosAdminSintLabel7: TppLabel;
    rptContratosAdminSintLabel8: TppLabel;
    rptContratosAdminSintLabel9: TppLabel;
    rptContratosAdminSintLabel10: TppLabel;
    rptContratosAdminSintLabel11: TppLabel;
    rptContratosAdminSintLabel12: TppLabel;
    rptContratosAdminSintLabel13: TppLabel;
    rptContratosAdminSintLabel14: TppLabel;
    rptContratosAdminSintLabel15: TppLabel;
    rptContratosAdminSint_LinhaTitulo: TppLine;
    rptContratosAdminSintLabel16: TppLabel;
    rptContratosAdminSintLabel17: TppLabel;
    rptContratosAdminSintLabel18: TppLabel;
    rptContratosAdminSintLabel19: TppLabel;
    rptContratosAdminSintDBText1: TppDBText;
    rptContratosAdminSintDBText2: TppDBText;
    rptContratosAdminSintLabel20: TppLabel;
    rptContratosAdminSintDBText3: TppDBText;
    rptContratosAdminSintDBMemo1: TppDBMemo;
    rptContratosAdminSintDBMemo2: TppDBMemo;
    rptContratosAdminSintDBMemo3: TppDBMemo;
    rptContratosAdminSintDBText4: TppDBText;
    rptContratosAdminSintDBText5: TppDBText;
    rptContratosAdminSintDBText6: TppDBText;
    rptContratosAdminSintDBText7: TppDBText;
    rptContratosAdminSintDBText8: TppDBText;
    rptContratosAdminSintDBText9: TppDBText;
    rptContratosAdminSintShape1: TppShape;
    rptContratosAdminSintLine1: TppLine;
    rptContratosAdminSintLabel2: TppLabel;
    rptContratosAdminSintShape2: TppShape;
    rptContratosAdminSintDBCalc1: TppDBCalc;
    rptContratosAdminSintDBCalc2: TppDBCalc;
    rptContratosAdminSintDBCalc3: TppDBCalc;
    rptContratosAdminSintDBCalc4: TppDBCalc;
    rptContratosAdminSintLabel21: TppLabel;
    rptContratosAdminAnalDBText2: TppDBText;
    qryContratosAdminAnalFLGRATEIO: TFloatField;
    qryContratosAdminAnalCIMPERCENTRATEIO: TFloatField;
    qryContratosAdminAnal_RATEIO: TStringField;
    rptContratosAdminAnalLabel5: TppLabel;
    rptContratosAdminSint_FundoBandaDetalhe: TppShape;
    rptContratosMestreLabel2: TppLabel;
    rptContratosMestreLabel3: TppLabel;
    rptContratosMestreLabel4: TppLabel;
    rptContratosMestreLabel5: TppLabel;
    rptContratosMestreLabel6: TppLabel;
    rptContratosMestreLabel7: TppLabel;
    rptContratosMestreLabel8: TppLabel;
    rptContratosMestreLabel9: TppLabel;
    rptContratosMestreLabel10: TppLabel;
    rptContratosMestreLabel11: TppLabel;
    rptContratosMestreLabel12: TppLabel;
    rptContratosMestreLabel13: TppLabel;
    rptContratosMestreLabel14: TppLabel;
    rptContratosMestreLabel15: TppLabel;
    rptContratosMestreLine1: TppLine;
    rptContratosMestreLabel16: TppLabel;
    rptContratosMestreLabel17: TppLabel;
    rptContratosMestreLabel18: TppLabel;
    rptContratosMestreLabel19: TppLabel;
    rptContratosMestreDBMemo1: TppDBMemo;
    rptContratosMestreDBMemo2: TppDBMemo;
    rptContratosMestreDBMemo3: TppDBMemo;
    rptContratosMestreDBText1: TppDBText;
    rptContratosMestreLabel20: TppLabel;
    rptContratosMestreDBText2: TppDBText;
    rptContratosMestreDBText3: TppDBText;
    rptContratosMestreDBText4: TppDBText;
    rptContratosMestreDBText5: TppDBText;
    rptContratosMestreDBText6: TppDBText;
    rptContratosMestreDBText7: TppDBText;
    rptContratosMestreDBText8: TppDBText;
    rptContratosMestreDBText9: TppDBText;
    rptContratosMestreLine2: TppLine;
    rptContratosMestre_FundoBandaDetalhe: TppShape;
    rptQuadroImoveis_FundoBandaDetalhe: TppShape;
    rptAlugueisEventosShape1: TppShape;
    qryAlugueisEventosCONTRATOEXTENSO: TStringField;
    rptAlugueisEventosLabel17: TppLabel;
    rptAlugueisEventos_lblAdministradora: TppLabel;
    rptAlugueisEventosLabel14: TppLabel;
    rptAlugueisEventos_lblAno: TppLabel;
    rptAlugueisEventosLine1: TppLine;
    qryAlugueisEventosIDIMOVELMESTRE: TFloatField;
    qryAlugueisEventosNOME_MESTRE: TStringField;
    qryAlugueisEventosIDCONTRATOIMOVEL: TFloatField;
    qryAlugueisEventosCONNUMERO: TStringField;
    qryAlugueisEventosCONNOME: TStringField;
    qryAlugueisEventosIDLOCATARIO: TFloatField;
    qryAlugueisEventosCONDATAINICIO: TDateTimeField;
    qryAlugueisEventosCONDATAFIM: TDateTimeField;
    qryAlugueisEventosCONDATACARENCIA: TDateTimeField;
    qryAlugueisEventosCONDATADENUNCIA: TDateTimeField;
    qryAlugueisEventosCONDATAAVDENUNCIA: TDateTimeField;
    qryAlugueisEventosCONDATAREAJUSTE: TDateTimeField;
    qryAlugueisEventosCONPROXREAJUSTE: TDateTimeField;
    qryAlugueisEventosCONDATARENEGOC: TDateTimeField;
    qryAlugueisEventosCONDATAAVRENEGOC: TDateTimeField;
    qryAlugueisEventosCONDATAFIANCAFIM: TDateTimeField;
    qryAlugueisEventosCONDATAFIANCAAV: TDateTimeField;
    qryAlugueisEventosLOCATARIO_RS: TStringField;
    qryAlugueisEventosLOCATARIO_NF: TStringField;
    qryAlugueisEventosADMINISTRADORA_RS: TStringField;
    qryAlugueisEventosADMINISTRADORA_NF: TStringField;
    qryQuadroImoveisIMONUMERO: TStringField;
    qryQuadroImoveisIMOBAIRRO: TStringField;
    qryQuadroImoveisIMOCEP: TStringField;
    qryQuadroImoveisNOMEIMOVEL: TStringField;
    qryQuadroImoveisIDMESTRE: TFloatField;
    qryQuadroImoveisFLGSTATUSOCUPACAO: TStringField;
    qryQuadroImoveisIDIMOVEL: TFloatField;
    qryQuadroImoveisIMOAREAGERENCIAL: TFloatField;
    qryQuadroImoveisIDCONTRATOIMOVEL: TFloatField;
    qryQuadroImoveisCONDATAINICIO: TDateTimeField;
    qryQuadroImoveisCONDATAFIM: TDateTimeField;
    qryQuadroImoveisLOCATARIO: TStringField;
    qryQuadroImoveisALUGUEL: TFloatField;
    qryQuadroImoveisAREA_OCUPADA: TFloatField;
    qryQuadroImoveisALUGUELM2: TFloatField;
    qryContratosMestreNOME_MESTRE: TStringField;
    qryContratosMestreIMONUMERO: TStringField;
    qryContratosMestreIMOCOMPLEMENTO: TStringField;
    qryContratosMestreIMOBAIRRO: TStringField;
    qryContratosMestreIMOCEP: TStringField;
    qryContratosMestreAREA_TOTAL: TFloatField;
    qryContratosMestreALUGUEL_M2: TFloatField;
    qryContratosMestreIDCONTRATOIMOVEL: TFloatField;
    qryContratosMestreNUMERO_CONTRATO: TStringField;
    qryContratosMestreNOME_CONTRATO: TStringField;
    qryContratosMestreCONINDICEREAJUSTE: TFloatField;
    qryContratosMestreIDLOCATARIO: TFloatField;
    qryContratosMestreIDADMINIMOVEL: TFloatField;
    qryContratosMestreCONTAXAADMIN: TFloatField;
    qryContratosMestreCONDATAINICIO: TDateTimeField;
    qryContratosMestreCONDATAFIM: TDateTimeField;
    qryContratosMestreVENCTO_ALUGUEL: TFloatField;
    qryContratosMestreTIPO_DIA: TStringField;
    qryContratosMestreDATA_REVISAO: TDateTimeField;
    qryContratosMestreDATA_PROX_REAJUSTE: TDateTimeField;
    qryContratosMestreDATA_DENUNCIA: TDateTimeField;
    qryContratosMestreCONDATAAVDENUNCIA: TDateTimeField;
    qryContratosMestreCONDATAAVRENEGOC: TDateTimeField;
    qryContratosMestreLOCATARIO_RS: TStringField;
    qryContratosMestreLOCATARIO_NF: TStringField;
    qryContratosMestreADMINISTRADORA_RS: TStringField;
    qryContratosMestreADMINISTRADORA_NF: TStringField;
    qryContratosAdminSintIDCONTRATOIMOVEL: TFloatField;
    qryContratosAdminSintNUMERO_CONTRATO: TStringField;
    qryContratosAdminSintNOME_CONTRATO: TStringField;
    qryContratosAdminSintCONINDICEREAJUSTE: TFloatField;
    qryContratosAdminSintIDLOCATARIO: TFloatField;
    qryContratosAdminSintIDADMINIMOVEL: TFloatField;
    qryContratosAdminSintCONTAXAADMIN: TFloatField;
    qryContratosAdminSintCONDATAINICIO: TDateTimeField;
    qryContratosAdminSintCONDATAFIM: TDateTimeField;
    qryContratosAdminSintVENCTO_ALUGUEL: TFloatField;
    qryContratosAdminSintTIPO_DIA: TStringField;
    qryContratosAdminSintDATA_REVISAO: TDateTimeField;
    qryContratosAdminSintDATA_PROX_REAJUSTE: TDateTimeField;
    qryContratosAdminSintDATA_DENUNCIA: TDateTimeField;
    qryContratosAdminSintCONDATAAVDENUNCIA: TDateTimeField;
    qryContratosAdminSintCONDATAAVRENEGOC: TDateTimeField;
    qryContratosAdminSintAREA_TOTAL: TFloatField;
    qryContratosAdminSintALUGUEL_M2: TFloatField;
    qryContratosAdminSintLOCATARIO_RS: TStringField;
    qryContratosAdminSintLOCATARIO_NF: TStringField;
    qryContratosAdminSintADMINISTRADORA_RS: TStringField;
    qryContratosAdminSintADMINISTRADORA_NF: TStringField;
    qryContratosMestreDATA_FIM_FIANCA: TDateTimeField;
    rptFolhaAluguelDBCalc2: TppDBCalc;
    rptFolhaAluguelLabel4: TppLabel;
    rptContratosAdminSintDBCalc5: TppDBCalc;
    rptContratosAdminSintLabel22: TppLabel;
    qryContratosMestreIMOLOGRADOURO: TStringField;
    qryListagemImovelIMOLOGRADOURO: TStringField;
    qryQuadroImoveisIMOLOGRADOURO: TStringField;
    rptFolhaAluguelLabel3: TppLabel;
    rptContratosMestre_lblResponsavel: TppLabel;
    rptContratosAdminSintLabel23: TppLabel;
    rptContratosAdminSint_lblResponsavel: TppLabel;
    rptContratosAdminAnalLabel6: TppLabel;
    rptContratosAdminAnal_lblResponsavel: TppLabel;
    rptContratosMestreLabel21: TppLabel;
    rptContratosMestre_lblStatus: TppLabel;
    rptContratosMestreLabel22: TppLabel;
    rptContratosMestre_lblReajuste: TppLabel;
    rptContratosAdminSintLabel24: TppLabel;
    rptContratosAdminSint_lblStatus: TppLabel;
    rptContratosAdminSintLabel26: TppLabel;
    rptContratosAdminSint_lblReajuste: TppLabel;
    rptContratosAdminSint_lblFolha: TppLabel;
    rptContratosAdminSint_lblFim: TppLabel;
    rptContratosMestre_lblFolha: TppLabel;
    rptContratosMestre_lblFim: TppLabel;
    rptListagemPropostalblStatus: TppLabel;
    qryContratosAdminAnalNOME_MESTRE: TStringField;
    qryContratosAdminAnalNOME_IMOVEL: TStringField;
    qryContratosAdminAnalIMOVEL_EXTENSO: TStringField;
    qryContratosAdminAnal_DESCRICAO_IMOVEL: TStringField;
    qryContratosMestreRESPONSAVEL_NF: TStringField;
    qryContratosAdminSintDATA_FIM_FIANCA: TDateTimeField;
    qryContratosAdminSintRESPONSAVEL_NF: TStringField;
    qryContratosMestreCONDIASTOLERANCIA: TFloatField;
    qryContratosMestreVALOR_ALUGUEL: TFloatField;
    qryContratosMestreINDICE_REAJUSTE: TStringField;
    qryContratosMestreLOGRADOURO: TStringField;
    qryContratosMestreNUMERO: TStringField;
    qryContratosMestreCOMPLEMENTO: TStringField;
    qryContratosMestreBAIRRO: TStringField;
    qryContratosMestreCEP: TStringField;
    qryContratosMestreNOME_CIDADE: TStringField;
    qryContratosMestreNOMEPAIS: TStringField;
    qryContratosAdminSintCONDIASTOLERANCIA: TFloatField;
    qryContratosAdminSintVALOR_ALUGUEL: TFloatField;
    qryContratosAdminSintINDICE_REAJUSTE: TStringField;
    qryContratosAdminSintLOGRADOURO: TStringField;
    qryContratosAdminSintNUMERO: TStringField;
    qryContratosAdminSintCOMPLEMENTO: TStringField;
    qryContratosAdminSintBAIRRO: TStringField;
    qryContratosAdminSintCEP: TStringField;
    qryContratosAdminSintNOME_CIDADE: TStringField;
    qryContratosAdminSintNOMEPAIS: TStringField;
    qryContratosMestreMSGDESCRICAO: TStringField;
    qryContratosAdminSintMSGDESCRICAO: TStringField;
    qryContratosMestreDATA_ULTIMO_REAJUSTE: TDateTimeField;
    qryContratosAdminSintDATA_ULTIMO_REAJUSTE: TDateTimeField;
    qryListagemImovelIMOVLRREAVAL: TFloatField;
    qryListagemImovelIMODATAREAVAL: TDateTimeField;
    qryListagemImovelIMOMOEDAREAVAL: TFloatField;
    qryListagemImovelIMOVLRMERCADO: TFloatField;
    qryListagemImovelIMODATAMERCADO: TDateTimeField;
    qryListagemImovelIMOMOEDAMERCADO: TFloatField;
    qryListagemImovelIMOCODIGO: TStringField;
    rptListagemImovelLabel7: TppLabel;
    rptListagemImovelDBMemo4: TppDBMemo;
    rptListagemImovelLabel8: TppLabel;
    rptListagemImovelDBCalc1: TppDBCalc;
    ppCalc52: TppSystemVariable;
    ppCalc53: TppSystemVariable;
    rptContrImoMestreCalc1: TppSystemVariable;
    rptContrImoMestreCalc2: TppSystemVariable;
    ppCalc29: TppSystemVariable;
    ppCalc30: TppSystemVariable;
    ppCalc25: TppSystemVariable;
    rptContratosAdminAnalCalc1: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    ppCalc28: TppSystemVariable;
    ppLabel6: TppLabel;
    qryListagemContratoSTATUS: TStringField;
    ppDBText3: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    qryFiador: TwwQuery;
    dsFiador: TwwDataSource;
    pplFiador: TppBDEPipeline;
    qryFiadorIDCONTRATOIMOVEL: TFloatField;
    qryFiadorIDAVALISTA: TFloatField;
    qryFiadorFISICA_JURIDICA: TStringField;
    qryFiadorDSC_FIADOR: TStringField;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    lblFiador: TppLabel;
    qryContratosMestreDSC_CIDADE: TStringField;
    qryContratosMestreDSC_UF: TStringField;
    qryQuadroImoveisDSC_CIDADE: TStringField;
    qryQuadroImoveisDSC_UF: TStringField;
    qryListagemImovelDSC_CIDADE: TStringField;
    qryListagemImovelDSC_UF: TStringField;
    qryListagemContratoFIANCA: TStringField;
    qryListagemContratoCONOBSFIANCA: TMemoField;
    ppDBText7: TppDBText;
    ppLabel1: TppLabel;
    ppDBRichText1: TppDBRichText;
    ppDBText9: TppDBText;
    qryListagemImovelIMOVAGAS: TFloatField;
    qryListagemImovelIMOFRACAOIDEAL: TFloatField;
    ppDBText10: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLogoTipo: TppImage;
    qryCompSocietaria: TwwQuery;
    pplCompSocietaria: TppBDEPipeline;
    dsCompSocietaria: TwwDataSource;
    qryCompSocietariaIDIMOVEL: TFloatField;
    qryCompSocietariaIDPROPRIETARIOUH: TFloatField;
    qryCompSocietariaPERCENTUAL: TFloatField;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppDBText11: TppDBText;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    qryCompSocietariaNOME: TStringField;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLabel15: TppLabel;
    ppLine4: TppLine;
    ppLabel18: TppLabel;
    ppLabel20: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    qryListagemImovelMOEDA_REAVAL: TStringField;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLogoLstContratos: TppImage;
    ppLogoLstPropostas: TppImage;
    ppLogoLstContratosIM: TppImage;
    ppLogoEventos: TppImage;
    ppLogoQuadroAluguel: TppImage;
    ppLogoContratosAnal: TppImage;
    ppLogoContratosSint: TppImage;
    qryReceitaM2: TwwQuery;
    StringField3: TStringField;
    DateTimeField1: TDateTimeField;
    dsReceitaM2: TwwDataSource;
    pplReceitaM2: TppBDEPipeline;
    rptReceitaM2: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    rptReceitaM2_lblCompetencia: TppLabel;
    ppLogoReceitaM2: TppImage;
    ppDetailBand5: TppDetailBand;
    ppShape1: TppShape;
    ppDBMemo1: TppDBMemo;
    ppDBText19: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppLine5: TppLine;
    ppDBText21: TppDBText;
    ppLabel26: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel27: TppLabel;
    ppDBText26: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine7: TppLine;
    ppLabel29: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLine8: TppLine;
    ppLabel30: TppLabel;
    ppDBText27: TppDBText;
    ppLine9: TppLine;
    ppDBText28: TppDBText;
    ppLabel32: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape2: TppShape;
    ppLine10: TppLine;
    ppLabel44: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel45: TppLabel;
    ppDBCalc9: TppDBCalc;
    qryReceitaM2NOMEMESTRE: TStringField;
    qryReceitaM2IMOLOGRADOURO: TStringField;
    qryReceitaM2IMONUMERO: TStringField;
    qryReceitaM2IMOBAIRRO: TStringField;
    qryReceitaM2IMOCEP: TStringField;
    qryReceitaM2DSC_CIDADE: TStringField;
    qryReceitaM2DSC_UF: TStringField;
    qryReceitaM2NOMEIMOVEL: TStringField;
    qryReceitaM2IDMESTRE: TFloatField;
    qryReceitaM2IDIMOVEL: TFloatField;
    qryReceitaM2IMOAREAGERENCIAL: TFloatField;
    qryReceitaM2IDCONTRATOIMOVEL: TFloatField;
    qryReceitaM2CONDATAINICIO: TDateTimeField;
    qryReceitaM2CONDATAFIM: TDateTimeField;
    qryReceitaM2LOCATARIO: TStringField;
    qryReceitaM2TOT_RECEITA: TFloatField;
    qryReceitaM2AREA_OCUPADA: TFloatField;
    qryReceitaM2ALUGUELM2: TFloatField;
    ppLine11: TppLine;
    ppLabel25: TppLabel;
    ppDBText20: TppDBText;
    ppLabel28: TppLabel;
    ppLabel35: TppLabel;
    ppDBText16: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    qryReceitaM2TOT_IMOVEL: TFloatField;
    qryReceitaM2TOT_ALTIMOVEL: TFloatField;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppLabel24: TppLabel;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppLabel37: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppShape5: TppShape;
    ppLabel46: TppLabel;
    qryListagemImovelSeg: TwwQuery;
    StringField4: TStringField;
    StringField13: TStringField;
    DateTimeField4: TDateTimeField;
    FloatField6: TFloatField;
    StringField14: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField23: TStringField;
    StringField24: TStringField;
    FloatField9: TFloatField;
    DateTimeField6: TDateTimeField;
    FloatField10: TFloatField;
    StringField25: TStringField;
    StringField26: TStringField;
    FloatField11: TFloatField;
    DateTimeField7: TDateTimeField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    DateTimeField8: TDateTimeField;
    FloatField14: TFloatField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField30: TStringField;
    dsListagemImovelSeg: TwwDataSource;
    pplListagemImovelSeg: TppBDEPipeline;
    rptListagemImovelSeg: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppImage1: TppImage;
    ppDetailBand6: TppDetailBand;
    ppDBText29: TppDBText;
    ppDBMemo4: TppDBMemo;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBMemo5: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppDBMemo7: TppDBMemo;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLine12: TppLine;
    ppLabel49: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppLine13: TppLine;
    ppLabel50: TppLabel;
    ppDBText39: TppDBText;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppShape4: TppShape;
    ppLine14: TppLine;
    ppLabel51: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel52: TppLabel;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppDBText42: TppDBText;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLGerencial_SPC1: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLine16: TppLine;
    ppLabel63: TppLabel;
    ppLine17: TppLine;
    ppLabel66: TppLabel;
    ppLine18: TppLine;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppLGerencial_SPC0: TppLabel;
    ppDBText43: TppDBText;
    qryListagemImovelSegDESC_SPC: TStringField;
    qryListagemImovelSegTIPO_IMOVEL_GRUPO: TStringField;
    qryListagemImovelSegTIPO_IMOVEL_QUEBRA: TStringField;
    ppLine15: TppLine;
    ppLine19: TppLine;
    qryContratosAdminAnalCODIGO_IMOVEL: TStringField;
    ppLabel53: TppLabel;
    ppDBMemo8: TppDBMemo;
    ppLabel57: TppLabel;
    ppDBText40: TppDBText;
    qryListagemContratoSIGLA: TStringField;
    ppLabel69: TppLabel;
    rptContratosMestre_lblTipoContrato: TppLabel;
    ppLabel70: TppLabel;
    rptContratosAdminAnal_lblTipoContrato: TppLabel;
    ppLabel71: TppLabel;
    rptContratosAdminSint_lblTipoContrato: TppLabel;
    ppLabel72: TppLabel;
    rptListagemContratos_lblTipoContrato: TppLabel;
    qryListagemImovelIMOAREACOMUM: TFloatField;
    qryListagemImovelIMOAREATOTAL: TFloatField;
    qryListagemImovelIMOAREAGERENCIAL: TFloatField;
    sqlSegImoveis: TCMSqlParams;
    cdsSegImoveis: TClientDataSet;
    dsSegImoveis: TDataSource;
    pplSegImoveis: TppBDEPipeline;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel74: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText41: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    ppSummaryBand4: TppSummaryBand;
    pplblTotalizador: TppRegion;
    ppLabel79: TppLabel;
    pplblTotal: TppLabel;
    cdsSegImoveisNOMEMESTRE: TStringField;
    cdsSegImoveisIDIMOVELMESTRE: TFloatField;
    cdsSegImoveisPATROCINADORA: TStringField;
    cdsSegImoveisPLANOPREV: TStringField;
    cdsSegImoveisPERCENTRATEIO: TFloatField;
    cdsSegImoveisVALOR_AQ: TFloatField;
    cdsSegImoveisVALOR_ULT_AQ: TFloatField;

    // procedimentos definidos

    // outros procedimentos
    procedure qryAlugueisEventosCalcFields(DataSet: TDataSet);
    procedure qryQuadroImoveisCalcFields(DataSet: TDataSet);
    procedure qryContratosAdminSintCalcFields(DataSet: TDataSet);
    procedure qryContratosMestreCalcFields(DataSet: TDataSet);
    procedure qryContratosAdminAnalCalcFields(DataSet: TDataSet);
    procedure rptContratosAdminAnal_bndImovelBeforeGenerate(Sender: TObject);
    procedure rptContratosAdminAnal_bndImovelBeforePrint(Sender: TObject);
    procedure rptListagemImovel_bndImovelBeforeGenerate(Sender: TObject);
    procedure rptListagemImovel_bndImovelBeforePrint(Sender: TObject);
    procedure rptContratosAdminSint_FundoBandaDetalhePrint(Sender: TObject);
    procedure rptContratosAdminSint_SeparadorPrint(Sender: TObject);
    procedure rptQuadroImoveis_LinhaTituloPrint(Sender: TObject);
    procedure rptContratosAdminSint_CabecalhoRelatAfterPrint(Sender: TObject);
    procedure rptAlugueisEventos_LinhaTituloPrint(Sender: TObject);
    procedure qryListagemImovelCalcFields(DataSet: TDataSet);
    procedure qryReceitaM2CalcFields(DataSet: TDataSet);
    procedure qryListagemImovelSegCalcFields(DataSet: TDataSet);
    procedure ppSubReport3Print(Sender: TObject);
    procedure ppDBText46GetText(Sender: TObject; var Text: String);
    procedure ppDBText47GetText(Sender: TObject; var Text: String);


  private { Private declarations }
    function MostraParam(Form: string): boolean; override;

//    Cores:
//    ColorA = FFFFFF   ( branco, clWhite )
//    ColorC = 00C0FFFF ( amarelo - pastel )
//    ColorD = 00C6F9CC ( verde - pastel )
//    ColorE = 00F3E6CD ( azul - pastel )
//    ColorF = 00A0A0A0
//    ColorG = 00BEBEBE
//    ColorH = 00D2D2D2
//    ColorI = 00E3E3E3
  //SOL  : 131925 - KTN  : 762446 Felipe de Oliveira Silva
  procedure MontaQuerySegregacaoListagemImoveis(ADataSet :TClientDataSet; sNomeMestre: string);



  public { Public declarations }
    bCustoContabil, bVlrCorrigido   : boolean;
    bAluguel                        : boolean;
    bArea, bAquisicao               : boolean;

    // variáveis de impressão
    bLinhaFina, bSeparador, bCorLinha  : boolean;
    CorLinha, CorAtual                 : TColor;


    iAnoAlugueisEventos    : integer;
    dDataCustoContabil     : TDateTime;
    dDataIni, dDataFim     : TDateTime;
    iMesCompetencia        : word;
    iAnoCompetencia        : word;
    fFatorAtuarial         : double;
    iIndiceCorrecao        : integer;

  end;



var
  dtmRelAdminImob: TdtmRelAdminImob;



implementation
{$R *.DFM}
uses
   uSistema, uDiasInUteis, uIntegraBack, uCmControlObject, DBaseDados,

   cRelAlugueisEventos, cRelQuadroImoveis, cRelReceitaM2, UComunsImobiliario,
   cRelListagemImovel, cRelListagemContrato,cRelListagemProposta,
   cRelCCImovel, cRelCCMestre, cRelCCContrato, cRelCCLocatario,
   cRelInadimplenciaImovel, cRelInadimplenciaMestre, cRelInadimplenciaContrato, cRelInadimplenciaLocatario,
   cRelContratosAdminAnal, cRelContratosAdminSint, cRelContratosMestre, CRelListagemImovelSegmento;


function TdtmRelAdminImob.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios
   if (LowerCase(Form) = 'cfgrelquadroimoveis') then begin
      frm := TcfgRelQuadroImoveis.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelreceitam2') then begin
      frm := TcfgRelReceitaM2.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelalugueiseventos') then begin
      frm := TcfgRelAlugueisEventos.Create(Application);
   // Contratos por... -----------------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgrelcontratosadminsint') then begin
      frm := TcfgRelContratosAdminSint.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelcontratosadminanal') then begin
      frm := TcfgRelContratosAdminAnal.Create(Application);
   end else if (LowerCase(Form) = 'cfgrelcontratosmestre') then begin
      frm := TcfgRelContratosMestre.Create(Application);
   // Listagens ------------------------------------------------------------------------------------
   end else if (LowerCase(Form) = 'cfgrellistagemimovel') then begin
      frm := TcfgRelListagemImovel.Create(Application);

   // Incluído por Marcos Topini em 10/08/2005
   end else if (LowerCase(Form) = 'cfgrellistagemimovelseg') then begin
      frm := TcfgRelListagemImovelSeg.Create(Application);
   // Fim - Marcos Topini

   end else if (LowerCase(Form) = 'cfgrellistagemcontrato') then begin
      frm := TcfgRelListagemContrato.Create(Application);
   end else if (LowerCase(Form) = 'cfgrellistagemproposta') then begin
      frm := TcfgRelListagemProposta.Create(Application);

   end else begin
      frm := nil;
   end;


   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelAdminImob.qryAlugueisEventosCalcFields(DataSet: TDataSet);
var
   iAnoCarencia, iAnoDenuncia, iAnoAvDenuncia,
   iAnoReajuste, iAnoProxReajuste, iAnoRenegoc,
   iAnoAvRenegoc, iAnoFimFianca, iAnoAvFianca: word;

   iMesCarencia, iMesDenuncia, iMesAvDenuncia,
   iMesReajuste, iMesProxReajuste, iMesRenegoc,
   iMesAvRenegoc, iMesFimFianca, iMesAvFianca: word;

   sContratoExtenso, sTextoMes  : string;
begin
   inherited;

   with qryAlugueisEventos do begin

      sContratoExtenso := '';
      if not(qryAlugueisEventosCONNUMERO.isNULL) then sContratoExtenso := sContratoExtenso + qryAlugueisEventosCONNUMERO.asString;
      if ( (not(qryAlugueisEventosCONNOME.isNULL)) and (not(qryAlugueisEventosCONNUMERO.isNULL)) ) then sContratoExtenso := sContratoExtenso + ' - ';
      if not(qryAlugueisEventosCONNOME.isNULL) then sContratoExtenso := sContratoExtenso + qryAlugueisEventosCONNOME.asString;

      qryAlugueisEventosCONTRATOEXTENSO.asString := sContratoExtenso;

      iAnoCarencia      := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATACARENCIA.asDateTime);
      iAnoDenuncia      := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATADENUNCIA.asDateTime);
      iAnoAvDenuncia    := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATAAVDENUNCIA.asDateTime);
      iAnoReajuste      := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATAREAJUSTE.asDateTime);
      iAnoProxReajuste  := DiasInUteis.ExtraiAno(qryAlugueisEventosCONPROXREAJUSTE.asDateTime);
      iAnoRenegoc       := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATARENEGOC.asDateTime);
      iAnoAvRenegoc     := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATAAVRENEGOC.asDateTime);
      iAnoFimFianca     := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATAFIANCAFIM.asDateTime);
      iAnoAvFianca      := DiasInUteis.ExtraiAno(qryAlugueisEventosCONDATAFIANCAAV.asDateTime);

      iMesCarencia      := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATACARENCIA.asDateTime);
      iMesDenuncia      := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATADENUNCIA.asDateTime);
      iMesAvDenuncia    := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATAAVDENUNCIA.asDateTime);
      iMesReajuste      := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATAREAJUSTE.asDateTime);
      iMesProxReajuste  := DiasInUteis.ExtraiMes(qryAlugueisEventosCONPROXREAJUSTE.asDateTime);
      iMesRenegoc       := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATARENEGOC.asDateTime);
      iMesAvRenegoc     := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATAAVRENEGOC.asDateTime);
      iMesFimFianca     := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATAFIANCAFIM.asDateTime);
      iMesAvFianca      := DiasInUteis.ExtraiMes(qryAlugueisEventosCONDATAFIANCAAV.asDateTime);

      // Janeiro
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 01 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 01 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 01 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 01 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 01 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 01 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 01 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 01 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 01 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosJan.asString := sTextoMes;

      // Fevereiro
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 02 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 02 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 02 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 02 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 02 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 02 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 02 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 02 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 02 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosFev.asString := sTextoMes;

      // Março
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 03 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 03 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 03 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 03 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 03 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 03 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 03 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 03 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 03 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosMar.asString := sTextoMes;

      // Abril
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 04 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 04 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 04 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 04 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 04 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 04 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 04 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 04 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 04 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosAbr.asString := sTextoMes;

      // Maio
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 05 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 05 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 05 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 05 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 05 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 05 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 05 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 05 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 05 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosMai.asString := sTextoMes;

      // Junho
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 06 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 06 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 06 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 06 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 06 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 06 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 06 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 06 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 06 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosJun.asString := sTextoMes;

      // Julho
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 07 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 07 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 07 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 07 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 07 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 07 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 07 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 07 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 07 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosJul.asString := sTextoMes;

      // Agosto
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 08 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 08 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 08 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 08 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 08 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 08 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 08 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 08 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 08 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosAgo.asString := sTextoMes;

      // Setembro
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 09 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 09 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 09 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 09 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 09 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 09 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 09 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 09 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 09 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosSet.asString := sTextoMes;

      // Outubro
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 10 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 10 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 10 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 10 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 10 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 10 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 10 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 10 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 10 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosOut.asString := sTextoMes;

      // Novembro
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 11 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 11 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 11 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 11 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 11 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 11 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 11 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 11 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 11 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosNov.asString := sTextoMes;

      // Dezembro
      sTextoMes := '';
      if iAnoCarencia      = iAnoAlugueisEventos then if iMesCarencia      = 12 then sTextoMes := sTextoMes + 'Fim Carência' + chr(13);
      if iAnoAvDenuncia    = iAnoAlugueisEventos then if iMesAvDenuncia    = 12 then sTextoMes := sTextoMes + 'Aviso Denúncia' + chr(13);
      if iAnoDenuncia      = iAnoAlugueisEventos then if iMesDenuncia      = 12 then sTextoMes := sTextoMes + 'Limite Denúncia' + chr(13);
      if iAnoReajuste      = iAnoAlugueisEventos then if iMesReajuste      = 12 then sTextoMes := sTextoMes + 'Último Reajuste' + chr(13);
      if iAnoProxReajuste  = iAnoAlugueisEventos then if iMesProxReajuste  = 12 then sTextoMes := sTextoMes + 'Próximo Reajuste' + chr(13);
      if iAnoAvRenegoc     = iAnoAlugueisEventos then if iMesAvRenegoc     = 12 then sTextoMes := sTextoMes + 'Aviso Negociação' + chr(13);
      if iAnoRenegoc       = iAnoAlugueisEventos then if iMesRenegoc       = 12 then sTextoMes := sTextoMes + 'Próx. Negociação' + chr(13);
      if iAnoAvFianca      = iAnoAlugueisEventos then if iMesAvFianca      = 12 then sTextoMes := sTextoMes + 'Aviso fim Fiança' + chr(13);
      if iAnoFimFianca     = iAnoAlugueisEventos then if iMesFimFianca     = 12 then sTextoMes := sTextoMes + 'Fim Fiança' + chr(13);
      qryAlugueisEventosDez.asString := sTextoMes;

   end;
end;



procedure TdtmRelAdminImob.qryQuadroImoveisCalcFields(DataSet: TDataSet);
begin
   with qryQuadroImoveis do begin

      FieldByName('DataReferencia').asDateTime := dDataCustoContabil;

      FieldByName('ENDERECOEXTENSO').asString :=
      FieldByName('IMOLOGRADOURO').asString + ' ' +
      FieldByName('IMONUMERO').asString + ' - ' +
      FieldByName('IMOBAIRRO').asString + ' - ' +
      FieldByName('DSC_CIDADE').asString + ' - ' +
      FieldByName('DSC_UF').asString + ' - CEP ' +
      FieldByName('IMOCEP').asString;
   end;
end;



procedure TdtmRelAdminImob.qryContratosAdminSintCalcFields(DataSet: TDataSet);
var
   sContratoExtenso: string;
begin
   inherited;

   with qryContratosAdminSint do begin
      sContratoExtenso := '';
      if not(qryContratosAdminSintNUMERO_CONTRATO.isNULL)   then sContratoExtenso := sContratoExtenso + qryContratosAdminSintNUMERO_CONTRATO.asString;
      if ( (not(qryContratosAdminSintNOME_CONTRATO.isNULL)) and (not(qryContratosAdminSintNUMERO_CONTRATO.isNULL)) ) then sContratoExtenso := sContratoExtenso + ' - ';
      if not(qryContratosAdminSintNOME_CONTRATO.isNULL)     then sContratoExtenso := sContratoExtenso + qryContratosAdminSintNOME_CONTRATO.asString;
      qryContratosAdminSintCONTRATOEXTENSO.asString   := sContratoExtenso;
   end;
end;



procedure TdtmRelAdminImob.qryContratosMestreCalcFields(DataSet: TDataSet);
var
   sEndExtenso : string;
begin
   sEndExtenso := '';
   if not(qryContratosMestreIMOLOGRADOURO.IsNULL) then begin
      sEndExtenso := qryContratosMestreIMOLOGRADOURO.AsString + ' ';
      if not(qryContratosMestreIMONUMERO.IsNULL)      then sEndExtenso := sEndExtenso + qryContratosMestreIMONUMERO.asString + ' - ';
      if not(qryContratosMestreIMOCOMPLEMENTO.IsNULL) then sEndExtenso := sEndExtenso + qryContratosMestreIMOCOMPLEMENTO.asString + ' - ';
      if not(qryContratosMestreIMOBAIRRO.IsNULL)      then sEndExtenso := sEndExtenso + qryContratosMestreIMOBAIRRO.asString + ' - ';
      if not(qryContratosMestreDSC_CIDADE.IsNULL)     then sEndExtenso := sEndExtenso + qryContratosMestreDSC_CIDADE.asString + ' - ';
      if not(qryContratosMestreDSC_UF.IsNULL)         then sEndExtenso := sEndExtenso + qryContratosMestreDSC_UF.asString;
      if not(qryContratosMestreIMOCEP.IsNULL)         then sEndExtenso := sEndExtenso + ' - CEP ' + qryContratosMestreIMOCEP.asString;
   end;
   qryContratosMestreEND_EXTENSO.AsString := sEndExtenso;
end;



procedure TdtmRelAdminImob.qryContratosAdminAnalCalcFields(DataSet: TDataSet);
begin
   inherited;

   // Concatena a Descrição com o Nome do Imóvel
   if not(qryContratosAdminAnalCIMDESCRICAO.isNull) then begin
      qryContratosAdminAnal_DESCRICAO_IMOVEL.AsString := qryContratosAdminAnalIMOVEL_EXTENSO.AsString + ' (' + qryContratosAdminAnalCIMDESCRICAO.AsString + ') ';
   end else begin
      qryContratosAdminAnal_DESCRICAO_IMOVEL.AsString := qryContratosAdminAnalIMOVEL_EXTENSO.AsString;
   end;
end;



procedure TdtmRelAdminImob.rptContratosAdminAnal_bndImovelBeforeGenerate(Sender: TObject);
begin
   inherited;

   // define se a banda será exibida ou não
   if bAluguel then rptContratosAdminAnal_bndImovel.Visible := qryContratosAdminAnalALUGUEL.AsFloat > 0;
end;



procedure TdtmRelAdminImob.rptContratosAdminAnal_bndImovelBeforePrint(Sender: TObject);
begin
   inherited;

   // define se a banda será exibida ou não
   if bAluguel then rptContratosAdminAnal_bndImovel.Visible := qryContratosAdminAnalALUGUEL.AsFloat > 0;
end;



procedure TdtmRelAdminImob.rptListagemImovel_bndImovelBeforeGenerate(Sender: TObject);
begin
   inherited;

   // se só forem para ser exibidos os imóveis com área
   if bArea       then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

   // se só forem para ser exibidos os imóveis com valor de aquisição (e já não estiver invisível...)
   if rptListagemImovel_bndImovel.Visible then
   if bAquisicao  then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

end;



procedure TdtmRelAdminImob.rptListagemImovel_bndImovelBeforePrint(Sender: TObject);
begin
   inherited;

   // se só forem para ser exibidos os imóveis com área
   if bArea       then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

   // se só forem para ser exibidos os imóveis com valor de aquisição (e já não estiver invisível...)
   if rptListagemImovel_bndImovel.Visible then
   if bAquisicao  then rptListagemImovel_bndImovel.Visible := qryListagemImovelIMOAREA.AsFloat > 0;

end;



procedure TdtmRelAdminImob.rptContratosAdminSint_FundoBandaDetalhePrint(Sender: TObject);
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



procedure TdtmRelAdminImob.rptContratosAdminSint_SeparadorPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelAdminImob.rptQuadroImoveis_LinhaTituloPrint(Sender: TObject);
begin
   inherited;

   if bSeparador then begin
      rptQuadroImoveis_LinhaTitulo.Top := 67;
   end else begin
      rptQuadroImoveis_LinhaTitulo.Top := 66;
   end;
end;


procedure TdtmRelAdminImob.rptContratosAdminSint_CabecalhoRelatAfterPrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelAdminImob.rptAlugueisEventos_LinhaTituloPrint(Sender: TObject);
begin
   inherited;

   if bSeparador then begin
      rptAlugueisEventos_LinhaTitulo.Top := 61;
   end else begin
      rptAlugueisEventos_LinhaTitulo.Top := 60;
   end;
end;



procedure TdtmRelAdminImob.qryListagemImovelCalcFields(DataSet: TDataSet);
begin
   inherited;
   with qryListagemImovel do begin
      FieldByName('ENDERECOEXTENSO').asString :=
      FieldByName('IMOLOGRADOURO').asString + ' ' +
      FieldByName('IMONUMERO').asString + ' - ' +
      FieldByName('IMOBAIRRO').asString + ' - ' +
      FieldByName('DSC_CIDADE').asString + ' - ' +
      FieldByName('DSC_UF').asString + ' - CEP ' +
      FieldByName('IMOCEP').asString;
   end;
end;

procedure TdtmRelAdminImob.qryReceitaM2CalcFields(DataSet: TDataSet);
begin
   inherited;
   with qryReceitaM2 do begin
      FieldByName('ENDERECOEXTENSO').asString :=
      FieldByName('IMOLOGRADOURO').asString + ' ' +
      FieldByName('IMONUMERO').asString + ' - ' +
      FieldByName('IMOBAIRRO').asString + ' - ' +
      FieldByName('DSC_CIDADE').asString + ' - ' +
      FieldByName('DSC_UF').asString + ' - CEP ' +
      FieldByName('IMOCEP').asString;
   end;
end;


procedure TdtmRelAdminImob.qryListagemImovelSegCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  with qryListagemImovelSeg do begin
      FieldByName('ENDERECOEXTENSO').asString :=
      FieldByName('IMOLOGRADOURO').asString + ' ' +
      FieldByName('IMONUMERO').asString + ' - ' +
      FieldByName('IMOBAIRRO').asString + ' - ' +
      FieldByName('DSC_CIDADE').asString + ' - ' +
      FieldByName('DSC_UF').asString + ' - CEP ' +
      FieldByName('IMOCEP').asString;
  end;

end;

//SOL  : 131925 - KTN  : 762446 Felipe de Oliveira Silva
procedure TdtmRelAdminImob.MontaQuerySegregacaoListagemImoveis(ADataSet : TClientDataSet; sNomeMestre: string);
var
  cdsTemp, cdsTempPorcentagem : TClientDataSet;
  sSql: string;
  Ctrl: TCmControlObject;
  curValor, curValorAtu: Double;
  dPercent : Double;
  idImovelMestre : string;
  fValorLanc : Double;
begin
  cdsTempPorcentagem := TClientDataSet.Create(nil);
  cdsTemp := TClientDataSet.Create(nil);
  Ctrl := TCMControlObject.Create;
  try
    Ctrl.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
          Sistema.AppRemoteServer,True,ComunsImobiliario.MensErroMT);

     if ADataSet.Active then
       ADataSet.EmptyDataSet;

     ADataSet.Data := Ctrl.GetDataPacket('SELECT '+
      '           ''                                                                    '' AS NOMEMESTRE,'+
      '           0 AS IDIMOVELMESTRE, '+
      '           ''                                                                    '' AS PATROCINADORA,'+
      '           ''                                                              ''AS PLANOPREV,'+
      '           0.00000 AS PERCENTRATEIO,'+
      '           0.00000 AS VALOR_AQ,' +
      '           0.00000 AS VALOR_ULT_AQ  ' +
      '   FROM '+
      '           DUAL '+
      '   WHERE   1=2');

    sSQL := qryListagemImovel.SQL.GetText;
    cdsTempPorcentagem.Data := Ctrl.GetDataPacket(sSql);

    cdsTempPorcentagem.Filtered := True;
    cdsTempPorcentagem.Filter := 'NOMEMESTRE = '+ QuotedStr(sNomeMestre);

    cdsTempPorcentagem.First;
    while not cdsTempPorcentagem.Eof do
    begin
//      while (not cdsTempPorcentagem.Eof) and (sNomeMestre = cdsTempPorcentagem.FieldByName('NOMEMESTRE').AsString) do
//      begin
        sSql := 'SELECT  ' +
        '           TRANSLATE(IM.IMONOME, CHR(39), ''*'')  AS NOMEMESTRE, '+   // Higor Nayde Ferreira SOL  : 181444 KTN  : 1682426
        '           I.IDIMOVELMESTRE, '+
        '           PATRO.NOME AS PATROCINADORA, '+
        '           PLANO.NOME AS PLANOPREV, ' +
        '           PPI.PERCENTRATEIO AS PPIPERCENTRATEIO,' +
        '           0.00000 AS PERCENTRATEIO,' +
        '           0.00000 AS VALOR_AQ,' +
        '           0.00000 AS VALOR_ULT_AQ' +
        '   FROM' +
        '           PLANOPATROXVIGENCIAIMOB PPI, PESSOA PATRO, PLANPREVCONTABIL PLANO, IMOVEL I, IMOVEL IM ' +
        '   WHERE' +
        '           PLANO.IDPLANOPREV          = PPI.IDPLANOPREV' +
        '           AND PPI.DATAVIGENCIA      = (SELECT MAX(PPV.DATAVIGENCIA)AS DATAVIGENCIA '+
        '                                                 FROM PLANOPATROXVIGENCIAIMOB PPV, IMOVEL IMO'+
        '                                                WHERE PPV.DATAVIGENCIA <= '+QuotedStr(DatetoStr(Now)) +
        '                                                  AND PPV.IDIMOVEL = IMO.IDIMOVEL'+
//        '                                                  AND IMO.IDIMOVEL ='+ qryListagemImovelIDIMOVEL.asString +')'+
  '                                                  AND IMO.IDIMOVEL ='+ cdsTempPorcentagem.FieldByName('IDIMOVEL').asString +')'+
        '           AND PATRO.IDPESSOA         = PPI.IDPATRO' +
        '           AND PPI.IDIMOVEL           = I.IDIMOVEL' +
//        '           AND I.IDIMOVEL       = ' + qryListagemImovelIDIMOVEL.asString +
  '           AND I.IDIMOVEL       = ' + cdsTempPorcentagem.FieldByName('IDIMOVEL').asString +
        '           AND IM.IDIMOVEL      = I.IDIMOVELMESTRE' +
        '   ORDER BY IM.IMONOME, I.IDIMOVELMESTRE, PATROCINADORA, PLANOPREV';

        cdsTemp.Data := Ctrl.GetDataPacket( sSql );
        curValor := 0;
        curValorAtu := 0;

        while not cdsTemp.Eof do
        begin
           if not ADataSet.Locate( 'NOMEMESTRE;PATROCINADORA;PLANOPREV;', VarArrayOf( [
            cdsTemp.FieldByName('NOMEMESTRE').Value,
            cdsTemp.FieldByName('PATROCINADORA').Value,
            cdsTemp.FieldByName('PLANOPREV').Value] ), [] ) then
           begin
              ADataSet.Append;
              ADataSet.FieldByName('NOMEMESTRE').AsString :=cdsTemp.FieldByName('NOMEMESTRE').AsString;
              ADataSet.FieldByName('IDIMOVELMESTRE').AsString :=cdsTemp.FieldByName('IDIMOVELMESTRE').AsString;
              ADataSet.FieldByName('PATROCINADORA').AsString :=cdsTemp.FieldByName('PATROCINADORA').AsString;
              ADataSet.FieldByName('PLANOPREV').AsString     :=cdsTemp.FieldByName('PLANOPREV').AsString;
              ADataSet.FieldByName('PERCENTRATEIO').AsFloat  :=0;
              if cdsTemp.RecNo = cdsTemp.RecordCount then
              begin
                ADataSet.FieldByName('VALOR_AQ').AsFloat := cdsTempPorcentagem.FieldByName('IMOVLRCOMPRA').AsFloat - curValor;
                ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat := cdsTempPorcentagem.FieldByName('IMOVLRREAVAL').AsFloat - curValorAtu;
              end
              else
              begin
                ADataSet.FieldByName('VALOR_AQ').AsFloat := (cdsTemp.FieldByName( 'PPIPERCENTRATEIO' ).AsFloat * cdsTempPorcentagem.FieldByName('IMOVLRCOMPRA').AsFloat) / 100 ;
                curValor := curValor + ADataSet.FieldByName('VALOR_AQ').AsFloat;

                ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat := (cdsTemp.FieldByName( 'PPIPERCENTRATEIO' ).AsFloat * cdsTempPorcentagem.FieldByName('IMOVLRREAVAL').AsFloat) / 100;
                curValorAtu := curValorAtu + ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat;

              end;//end else
           end// end if locate
           else
           begin
               ADataSet.Edit;
               if cdsTemp.RecNo = cdsTemp.RecordCount then
               begin
                 ADataSet.FieldByName('VALOR_AQ').AsFloat  := ADataSet.FieldByName('VALOR_AQ').AsFloat + ( cdsTempPorcentagem.FieldByName('IMOVLRCOMPRA').AsFloat - curValor);
                 ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat  := ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat + (cdsTempPorcentagem.FieldByName('IMOVLRREAVAL').AsFloat - curValorAtu);
               end
               else
               begin
                  ADataSet.FieldByName('VALOR_AQ').AsFloat  := ADataSet.FieldByName('VALOR_AQ').AsFloat + (cdsTempPorcentagem.FieldByName('IMOVLRCOMPRA').AsFloat *
                                                                cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                  curValor := curValor + (cdsTempPorcentagem.FieldByName('IMOVLRCOMPRA').AsFloat *
                                                                cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;

                  ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat  := ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat + (cdsTempPorcentagem.FieldByName('IMOVLRREAVAL').AsFloat *
                                                                cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
                  curValorAtu := curValorAtu + (cdsTempPorcentagem.FieldByName('IMOVLRREAVAL').AsFloat *
                                                                cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat)/100;
               end;
           end;// end else
        ADataSet.Post;
        cdsTemp.Next;
        end;// end while cdsTemp
     //qryListagemImovel.Next;
//     cdsTempPorcentagem.Next;
//     end;
     cdsTempPorcentagem.Next;
   end;// end while cdsTempPorcentagem


  //cdsTempPorcentagem.Data := ADataSet.Data;


  dPercent:= 0;
  ADataSet.First;
  cdsTemp.First;
  fValorLanc := ppDBCalc2.Value + ppDBCalc1.Value;
  while not ADataSet.Eof do
  begin
    ADataSet.Edit;
     if ADataSet.RecNo = ADataSet.RecordCount then
     begin
        if dPercent <= 0 then
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := 0
        else
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := 100 - dPercent;
     end
     else
     begin
        if fValorLanc <= 0 then
           fValorLanc := 1;
        if (ADataSet.FieldByName('VALOR_AQ').AsFloat + ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat) = 0 then
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := cdsTemp.FieldByName('PPIPERCENTRATEIO').AsFloat
        else
           ADataSet.FieldByName('PERCENTRATEIO').AsFloat := (((ADataSet.FieldByName('VALOR_AQ').AsFloat + ADataSet.FieldByName('VALOR_ULT_AQ').AsFloat) * 100)
                                                                            / (fValorLanc));
        dPercent := dPercent + ADataSet.FieldByName('PERCENTRATEIO').AsFloat;
     end;
     ADataSet.Post;
     ADataSet.Next;
     cdsTemp.Next;
    end;


     {idImovelMestre := cdsTempPorcentagem.FieldByName('NOMEMESTRE').AsString;


     while (idImovelMestre = cdsTempPorcentagem.FieldByName('NOMEMESTRE').AsString) and  (not cdsTempPorcentagem.EOF) do
     begin
        fValorLanc := fValorLanc + cdsTempPorcentagem.FieldByName('VALOR_AQ').AsFloat;
        cdsTempPorcentagem.Next;
     end;

     if fValorLanc <= 0 then
        fValorLanc := 1;

     while (idImovelMestre = ADataSet.FieldByName('NOMEMESTRE').AsString) and  (not ADataSet.EOF) do
     begin
        ADataSet.Edit;
        ADataSet.FieldByName('PERCENTRATEIO').AsFloat := RoundCM(((ADataSet.FieldByName('VALOR_AQ').AsFloat * 100) / fValorLanc) ,2);
        ADataSet.Post;
        ADataSet.Next;
     end;
     fValorLanc:= 0;

  end;}

  finally
    cdsTemp.Free;
    Ctrl.Free;
  end;
end;
//SOL  : 131925 - KTN  : 762446 Felipe de Oliveira Silva
// função transformada em procedure
procedure TdtmRelAdminImob.ppSubReport3Print(Sender: TObject);
begin
  MontaQuerySegregacaoListagemImoveis(cdsSegImoveis, qryListagemImovelNOMEMESTRE.AsString);
end;

procedure TdtmRelAdminImob.ppDBText46GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := FloatToStrF( ppDBText46.FieldValue, ffCurrency, 17, 2 );
end;

procedure TdtmRelAdminImob.ppDBText47GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  Text := FloatToStrF( ppDBText47.FieldValue, ffCurrency, 17, 2 );
end;

end.
