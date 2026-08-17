unit dRelatoriosModCon;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports,
  DBTables, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db,
  Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt, ppMemo,
  ppModule, daDataModule;

type
  TdtmRelatoriosModCon = class(TdtmReports)
    rpProcTrab: TppReport;
    ppProcTrab: TppBDEPipeline;
    dsProcTrab: TwwDataSource;
    qryProcTrab: TwwQuery;
    ppProcTrab1: TppBDEPipeline;
    dsProcTrab1: TwwDataSource;
    qryProcTrab1: TwwQuery;
    rpProcTrabHdrBnd: TppHeaderBand;
    rpProcTrabDtlBnd: TppDetailBand;
    rpProcTrabFootBnd: TppFooterBand;
    rpProcTrabSmryBnd: TppSummaryBand;
    rpProcTrabLbl7: TppLabel;
    rpProcTrabLbl1: TppLabel;
    rpProcTrabDBTxt1: TppDBText;
    rpProcTrabLbl4: TppLabel;
    rpProcTrabLbl5: TppLabel;
    rpProcTrabLbl6: TppLabel;
    rpProcTrabLbl8: TppLabel;
    rpProcTrabLbl9: TppLabel;
    rpProcTrabLbl11: TppLabel;
    rpProcTrabLbl12: TppLabel;
    rpProcTrabLbl13: TppLabel;
    rpProcTrabLbl14: TppLabel;
    rpProcTrabLbl16: TppLabel;
    rpProcTrabLbl15: TppLabel;
    rpProcTrabLbl3: TppLabel;
    rpProcTrabLbl2: TppLabel;
    rpProcTrabSysVar1: TppSystemVariable;
    rpProcTrabSysVar2: TppSystemVariable;
    rpProcTrabLbl17: TppLabel;
    rpProcTrabLbl19: TppLabel;
    rpProcTrabLbl18: TppLabel;
    rpProcTrabLbl20: TppLabel;
    rpProcTrabLbl21: TppLabel;
    rpProcTrabGrp0: TppGroup;
    rpProcTrabGrpHdrBnd0: TppGroupHeaderBand;
    rpProcTrabGrpFootBnd0: TppGroupFooterBand;
    rpProcTrabGrp2: TppGroup;
    rpProcTrabGrpHdrBnd2: TppGroupHeaderBand;
    rpProcTrabGrpFootBnd1: TppGroupFooterBand;
    rpProcTrabShape1: TppShape;
    rpProcTrabDBTxt2: TppDBText;
    rpProcTrabDBTxt3: TppDBText;
    rpProcTrabDBTxt4: TppDBText;
    rpProcTrabDBTxt5: TppDBText;
    rpProcTrabDBTxt6: TppDBText;
    rpProcTrabDBTxt7: TppDBText;
    rpProcTrabDBTxt9: TppDBText;
    rpProcTrabDBTxt10: TppDBText;
    rpProcTrabDBTxt11: TppDBText;
    rpProcTrabDBTxtCARGO: TppDBText;
    rpProcTrabDBTxt12: TppDBText;
    rpProcTrabDBTxt13: TppDBText;
    rpProcTrabDBTxt14: TppDBText;
    rpProcTrabDBTxt15: TppDBText;
    rpProcTrabSubRep1: TppSubReport;
    rpProcTrabChildRep1: TppChildReport;
    rpProcTrabSubRep1TitBnd: TppTitleBand;
    rpProcTrabSubRep1DtlBnd: TppDetailBand;
    rpProcTrabSubRep1Lbl1: TppLabel;
    rpProcTrabSubRep1Lbl2: TppLabel;
    rpProcTrabSubRep1DBTxt1: TppDBText;
    rpProcTrabSubRep1DBTxt2: TppDBText;
    ppProcTrab2: TppBDEPipeline;
    dsProcTrab2: TwwDataSource;
    qryProcTrab2: TwwQuery;
    ppProcTrab3: TppBDEPipeline;
    dsProcTrab3: TwwDataSource;
    qryProcTrab3: TwwQuery;
    rpProcTrabSubRep2: TppSubReport;
    rpProcTrabChildRep2: TppChildReport;
    rpProcTrabSubRep2TitBnd: TppTitleBand;
    rpProcTrabSubRep2DtlBnd: TppDetailBand;
    rpProcTrabSubRep2Lbl1: TppLabel;
    rpProcTrabSubRep2Lbl2: TppLabel;
    rpProcTrabSubRep2Lbl3: TppLabel;
    rpProcTrabSubRep2DBTxt1: TppDBText;
    rpProcTrabSubRep2DBTxt2: TppDBText;
    rpProcTrabSubRep2DBTxt3: TppDBText;
    rpProcTrabSubRep2DBMemo1: TppDBMemo;
    rpProcTrabSubRep2SmryBnd: TppSummaryBand;
    rpProcTrabLbl22: TppLabel;
    rpProcTrabDBCalc1: TppDBCalc;
    rpProcTrabLbl23: TppLabel;
    rpProcTrabDBCalc2: TppDBCalc;
    rpProcTrabDBCalc3: TppDBCalc;
    rpProcTrabDBCalc4: TppDBCalc;
    rpProcTrabDBCalc5: TppDBCalc;
    rpProcTrabDBCalc6: TppDBCalc;
    rpProcTrabSubRep3: TppSubReport;
    rpProcTrabChildRep3: TppChildReport;
    rpProcTrabSubRep3TitBnd: TppTitleBand;
    rpProcTrabSubRep3Lbl1: TppLabel;
    rpProcTrabSubRep3DtlBnd: TppDetailBand;
    rpProcTrabSubRep3DBTxt1: TppDBText;
    rpProcTrabSubRep3SmryBnd: TppSummaryBand;
    rpProcTrabSubRep3LblRiscoMax: TppLabel;
    rpProcTrabSubRep3LblRiscoProv: TppLabel;
    rpProcTrabSubRep3LblValorReal: TppLabel;
    rpProcTrabSubRep3LblEconomia1: TppLabel;
    rpProcTrabSubRep3LblEconomia2: TppLabel;
    ppProcTrab4: TppBDEPipeline;
    dsProcTrab4: TwwDataSource;
    qryProcTrab4: TwwQuery;
    updProcTrab4: TUpdateSQL;
    rpProcTrabSubRep4: TppSubReport;
    rpProcTrabChildRep4: TppChildReport;
    rpProcTrabSubRep4TitBnd: TppTitleBand;
    rpProcTrabSubRep4DtlBnd: TppDetailBand;
    rpProcTrabSubRep4DBTxt2: TppDBText;
    rpProcTrabSubRep4DBTxt4: TppDBText;
    rpProcTrabSubRep4DBTxt3: TppDBText;
    rpProcTrabSubRep4Lbl6: TppLabel;
    rpProcTrabSubRep4Lbl1: TppLabel;
    rpProcTrabSubRep4DBTxt1: TppDBText;
    rpProcTrabSubRep4Lbl4: TppLabel;
    rpProcTrabSubRep4Lbl5: TppLabel;
    rpProcTrabSubRep4Lbl7: TppLabel;
    rpProcTrabSubRep4Lbl8: TppLabel;
    rpProcTrabSubRep4Lbl9: TppLabel;
    rpProcTrabSubRep4Lbl10: TppLabel;
    rpProcTrabSubRep4Lbl2: TppLabel;
    rpProcTrabSubRep4Lbl3: TppLabel;
    rpProcTrabSubRep4SysVar1: TppSystemVariable;
    rpProcTrabSubRep4SysVar2: TppSystemVariable;
    rpProcTrabSubRep4Lbl11: TppLabel;
    rpProcTrabSubRep4DBTxt5: TppDBText;
    rpProcTrabSubRep4DBTxt6: TppDBText;
    rpProcTrabSubRep4Line5: TppLine;
    rpProcTrabSubRep4Line6: TppLine;
    rpProcTrabSubRep4Line7: TppLine;
    rpProcTrabSubRep4Line8: TppLine;
    rpProcTrabSubRep4DBTxt7: TppDBText;
    rpProcTrabSubRep4DBTxt8: TppDBText;
    rpProcTrabSubRep4Line1: TppLine;
    rpProcTrabSubRep4Line4: TppLine;
    rpProcTrabSubRep4Shape1: TppShape;
    rpProcTrabSubRep4Line2: TppLine;
    rpProcTrabSubRep4Line3: TppLine;
    rpProcTrabSubRep4ShapeShape2: TppShape;
    rpProcTrabSubRep4Grp1: TppGroup;
    rpProcTrabSubRep4GrpHdrBnd: TppGroupHeaderBand;
    rpProcTrabSubRep4GrpFootBnd: TppGroupFooterBand;
    rpProcTrabSubRep4Lbl12: TppLabel;
    rpProcTrabSubRep4DBCalc1: TppDBCalc;
    rpProcTrabSubRep4DBCalc2: TppDBCalc;
    rpProcTrabSubRep4DBCalc3: TppDBCalc;
    rpProcTrabSubRep4DBCalc4: TppDBCalc;
    rpProcTrabSubRep4DBCalc5: TppDBCalc;
    rpProcTrabSubRep4DBCalc6: TppDBCalc;
    rpProcTrabSubRep4Shape3: TppShape;
    rpProcTrabSubRep4Line9: TppLine;
    rpProcTrabSubRep4Line10: TppLine;
    rpProcTrabSubRep4Line11: TppLine;
    rpProcTrabSubRep4Line12: TppLine;
    qryProcTrab1Aux: TwwQuery;
    rpProcTrabSubRep1SmryBnd1: TppSummaryBand;
    rpProcTrabGrp1: TppGroup;
    rpProcTrabGrpHdrBnd1: TppGroupHeaderBand;
    rpProcTrabGrpFootBnd2: TppGroupFooterBand;
    rpProcTrabLbl24: TppLabel;
    rpProcTrabSubRepRateio: TppSubReport;
    rpProcTrabChildRepRateio: TppChildReport;
    ppProcTrab5: TppBDEPipeline;
    dsProcTrab5: TwwDataSource;
    qryProcTrab5: TwwQuery;
    updProcTrab5: TUpdateSQL;
    rpProcTrabSubRepRateioTitBnd1: TppTitleBand;
    rpProcTrabSubRepRateioDtlBnd1: TppDetailBand;
    rpProcTrabSubRepRateioLbl1: TppLabel;
    rpProcTrabSubRepRateioDBTxt1: TppDBText;
    rpProcTrabSubRepRateioDBTxt2: TppDBText;
    rpProcTrabSubRepRateioDBTxt3: TppDBText;
    rpProcTrabSubRepRateioDBTxt4: TppDBText;
    rpProcTrabDBTxt16: TppDBText;
    rpProcTrabDBTxt17: TppDBText;
    rpProcTrabDBTxt18: TppDBText;
    rpProcTrabDBTxt19: TppDBText;
    rpAnalSintProc: TppReport;
    rpAnalSintProcHdrBnd1: TppHeaderBand;
    rpAnalSintProcLbl9: TppLabel;
    rpAnalSintProcLbl7: TppLabel;
    rpAnalSintProcLbl1: TppLabel;
    rpAnalSintProcDBTxt1: TppDBText;
    rpAnalSintProcLbl4: TppLabel;
    rpAnalSintProcLbl5: TppLabel;
    rpAnalSintProcLbl6: TppLabel;
    rpAnalSintProcLbl8: TppLabel;
    rpAnalSintProcLbl10: TppLabel;
    rpAnalSintProcLbl11: TppLabel;
    rpAnalSintProcLbl12: TppLabel;
    rpAnalSintProcLbl13: TppLabel;
    rpAnalSintProcLbl3: TppLabel;
    rpAnalSintProcLbl2: TppLabel;
    rpAnalSintProcSysVar1: TppSystemVariable;
    rpAnalSintProcSysVar2: TppSystemVariable;
    rpAnalSintProcLbl14: TppLabel;
    rpAnalSintProcLbl15: TppLabel;
    rpAnalSintProcDtlBnd1: TppDetailBand;
    rpAnalSintProcFootBnd1: TppFooterBand;
    rpAnalSintProcSmryBnd1: TppSummaryBand;
    rpAnalSintProcGrp1: TppGroup;
    rpAnalSintProcGrpHdrBnd1: TppGroupHeaderBand;
    rpAnalSintProcGrpFootBnd1: TppGroupFooterBand;
    rpAnalSintProcDBTxt2: TppDBText;
    ppAnalSintProc: TppBDEPipeline;
    dsAnalSintProc: TwwDataSource;
    qryAnalSintProc: TwwQuery;
    updSQL: TUpdateSQL;
    rpAnalSintProcLbl16: TppLabel;
    rpAnalSintProcLbl17: TppLabel;
    rpAnalSintProcLbl18: TppLabel;
    rpAnalSintProcLbl19: TppLabel;
    rpAnalSintProcLbl20: TppLabel;
    rpAnalSintProcLbl21: TppLabel;
    rpAnalSintProcLbl22: TppLabel;
    rpAnalSintProcLbl23: TppLabel;
    rpAnalSintProcLbl24: TppLabel;
    rpAnalSintProcLbl25: TppLabel;
    rpAnalSintProcLbl26: TppLabel;
    rpAnalSintProcLbl27: TppLabel;
    rpAnalSintProcLbl28: TppLabel;
    rpAnalSintProcLbl29: TppLabel;
    rpAnalSintProcLbl30: TppLabel;
    rpAnalSintProcLbl31: TppLabel;
    rpAnalSintProcLbl32: TppLabel;
    rpAnalSintProcLbl33: TppLabel;
    rpAnalSintProcDBTxt14: TppDBText;
    rpAnalSintProcDBTxt26: TppDBText;
    rpAnalSintProcDBTxt38: TppDBText;
    rpAnalSintProcDBTxt51: TppDBText;
    rpAnalSintProcDBTxt64: TppDBText;
    rpAnalSintProcDBTxt77: TppDBText;
    rpAnalSintProcDBTxt90: TppDBText;
    rpAnalSintProcDBTxt103: TppDBText;
    rpAnalSintProcDBTxt116: TppDBText;
    rpAnalSintProcDBTxt129: TppDBText;
    rpAnalSintProcDBTxt142: TppDBText;
    rpAnalSintProcDBTxt155: TppDBText;
    rpAnalSintProcDBTxt168: TppDBText;
    rpAnalSintProcDBTxt181: TppDBText;
    rpAnalSintProcDBTxt194: TppDBText;
    rpAnalSintProcDBTxt207: TppDBText;
    rpAnalSintProcDBTxt220: TppDBText;
    rpAnalSintProcDBTxt3: TppDBText;
    rpAnalSintProcDBTxt15: TppDBText;
    rpAnalSintProcDBTxt27: TppDBText;
    rpAnalSintProcDBTxt39: TppDBText;
    rpAnalSintProcDBTxt52: TppDBText;
    rpAnalSintProcDBTxt65: TppDBText;
    rpAnalSintProcDBTxt78: TppDBText;
    rpAnalSintProcDBTxt91: TppDBText;
    rpAnalSintProcDBTxt104: TppDBText;
    rpAnalSintProcDBTxt117: TppDBText;
    rpAnalSintProcDBTxt130: TppDBText;
    rpAnalSintProcDBTxt143: TppDBText;
    rpAnalSintProcDBTxt156: TppDBText;
    rpAnalSintProcDBTxt169: TppDBText;
    rpAnalSintProcDBTxt182: TppDBText;
    rpAnalSintProcDBTxt195: TppDBText;
    rpAnalSintProcDBTxt208: TppDBText;
    rpAnalSintProcDBTxt221: TppDBText;
    rpAnalSintProcDBTxt4: TppDBText;
    rpAnalSintProcDBTxt16: TppDBText;
    rpAnalSintProcDBTxt28: TppDBText;
    rpAnalSintProcDBTxt40: TppDBText;
    rpAnalSintProcDBTxt53: TppDBText;
    rpAnalSintProcDBTxt66: TppDBText;
    rpAnalSintProcDBTxt79: TppDBText;
    rpAnalSintProcDBTxt92: TppDBText;
    rpAnalSintProcDBTxt105: TppDBText;
    rpAnalSintProcDBTxt118: TppDBText;
    rpAnalSintProcDBTxt131: TppDBText;
    rpAnalSintProcDBTxt144: TppDBText;
    rpAnalSintProcDBTxt157: TppDBText;
    rpAnalSintProcDBTxt170: TppDBText;
    rpAnalSintProcDBTxt183: TppDBText;
    rpAnalSintProcDBTxt196: TppDBText;
    rpAnalSintProcDBTxt209: TppDBText;
    rpAnalSintProcDBTxt222: TppDBText;
    rpAnalSintProcDBTxt5: TppDBText;
    rpAnalSintProcDBTxt17: TppDBText;
    rpAnalSintProcDBTxt29: TppDBText;
    rpAnalSintProcDBTxt41: TppDBText;
    rpAnalSintProcDBTxt54: TppDBText;
    rpAnalSintProcDBTxt67: TppDBText;
    rpAnalSintProcDBTxt80: TppDBText;
    rpAnalSintProcDBTxt93: TppDBText;
    rpAnalSintProcDBTxt106: TppDBText;
    rpAnalSintProcDBTxt119: TppDBText;
    rpAnalSintProcDBTxt132: TppDBText;
    rpAnalSintProcDBTxt145: TppDBText;
    rpAnalSintProcDBTxt158: TppDBText;
    rpAnalSintProcDBTxt171: TppDBText;
    rpAnalSintProcDBTxt184: TppDBText;
    rpAnalSintProcDBTxt197: TppDBText;
    rpAnalSintProcDBTxt210: TppDBText;
    rpAnalSintProcDBTxt223: TppDBText;
    rpAnalSintProcDBTxt6: TppDBText;
    rpAnalSintProcDBTxt18: TppDBText;
    rpAnalSintProcDBTxt30: TppDBText;
    rpAnalSintProcDBTxt42: TppDBText;
    rpAnalSintProcDBTxt55: TppDBText;
    rpAnalSintProcDBTxt68: TppDBText;
    rpAnalSintProcDBTxt81: TppDBText;
    rpAnalSintProcDBTxt94: TppDBText;
    rpAnalSintProcDBTxt107: TppDBText;
    rpAnalSintProcDBTxt120: TppDBText;
    rpAnalSintProcDBTxt133: TppDBText;
    rpAnalSintProcDBTxt146: TppDBText;
    rpAnalSintProcDBTxt159: TppDBText;
    rpAnalSintProcDBTxt172: TppDBText;
    rpAnalSintProcDBTxt185: TppDBText;
    rpAnalSintProcDBTxt198: TppDBText;
    rpAnalSintProcDBTxt211: TppDBText;
    rpAnalSintProcDBTxt224: TppDBText;
    rpAnalSintProcDBTxt7: TppDBText;
    rpAnalSintProcDBTxt19: TppDBText;
    rpAnalSintProcDBTxt31: TppDBText;
    rpAnalSintProcDBTxt43: TppDBText;
    rpAnalSintProcDBTxt56: TppDBText;
    rpAnalSintProcDBTxt69: TppDBText;
    rpAnalSintProcDBTxt82: TppDBText;
    rpAnalSintProcDBTxt95: TppDBText;
    rpAnalSintProcDBTxt108: TppDBText;
    rpAnalSintProcDBTxt121: TppDBText;
    rpAnalSintProcDBTxt134: TppDBText;
    rpAnalSintProcDBTxt147: TppDBText;
    rpAnalSintProcDBTxt160: TppDBText;
    rpAnalSintProcDBTxt173: TppDBText;
    rpAnalSintProcDBTxt186: TppDBText;
    rpAnalSintProcDBTxt199: TppDBText;
    rpAnalSintProcDBTxt212: TppDBText;
    rpAnalSintProcDBTxt225: TppDBText;
    rpAnalSintProcDBTxt8: TppDBText;
    rpAnalSintProcDBTxt20: TppDBText;
    rpAnalSintProcDBTxt32: TppDBText;
    rpAnalSintProcDBTxt44: TppDBText;
    rpAnalSintProcDBTxt57: TppDBText;
    rpAnalSintProcDBTxt70: TppDBText;
    rpAnalSintProcDBTxt83: TppDBText;
    rpAnalSintProcDBTxt96: TppDBText;
    rpAnalSintProcDBTxt109: TppDBText;
    rpAnalSintProcDBTxt122: TppDBText;
    rpAnalSintProcDBTxt135: TppDBText;
    rpAnalSintProcDBTxt148: TppDBText;
    rpAnalSintProcDBTxt161: TppDBText;
    rpAnalSintProcDBTxt174: TppDBText;
    rpAnalSintProcDBTxt187: TppDBText;
    rpAnalSintProcDBTxt200: TppDBText;
    rpAnalSintProcDBTxt213: TppDBText;
    rpAnalSintProcDBTxt226: TppDBText;
    rpAnalSintProcDBTxt9: TppDBText;
    rpAnalSintProcDBTxt21: TppDBText;
    rpAnalSintProcDBTxt33: TppDBText;
    rpAnalSintProcDBTxt45: TppDBText;
    rpAnalSintProcDBTxt58: TppDBText;
    rpAnalSintProcDBTxt71: TppDBText;
    rpAnalSintProcDBTxt84: TppDBText;
    rpAnalSintProcDBTxt97: TppDBText;
    rpAnalSintProcDBTxt110: TppDBText;
    rpAnalSintProcDBTxt123: TppDBText;
    rpAnalSintProcDBTxt136: TppDBText;
    rpAnalSintProcDBTxt149: TppDBText;
    rpAnalSintProcDBTxt162: TppDBText;
    rpAnalSintProcDBTxt175: TppDBText;
    rpAnalSintProcDBTxt188: TppDBText;
    rpAnalSintProcDBTxt201: TppDBText;
    rpAnalSintProcDBTxt214: TppDBText;
    rpAnalSintProcDBTxt227: TppDBText;
    rpAnalSintProcDBTxt10: TppDBText;
    rpAnalSintProcDBTxt22: TppDBText;
    rpAnalSintProcDBTxt34: TppDBText;
    rpAnalSintProcDBTxt46: TppDBText;
    rpAnalSintProcDBTxt59: TppDBText;
    rpAnalSintProcDBTxt72: TppDBText;
    rpAnalSintProcDBTxt85: TppDBText;
    rpAnalSintProcDBTxt98: TppDBText;
    rpAnalSintProcDBTxt111: TppDBText;
    rpAnalSintProcDBTxt124: TppDBText;
    rpAnalSintProcDBTxt137: TppDBText;
    rpAnalSintProcDBTxt150: TppDBText;
    rpAnalSintProcDBTxt163: TppDBText;
    rpAnalSintProcDBTxt176: TppDBText;
    rpAnalSintProcDBTxt189: TppDBText;
    rpAnalSintProcDBTxt202: TppDBText;
    rpAnalSintProcDBTxt215: TppDBText;
    rpAnalSintProcDBTxt228: TppDBText;
    rpAnalSintProcDBTxt11: TppDBText;
    rpAnalSintProcDBTxt23: TppDBText;
    rpAnalSintProcDBTxt35: TppDBText;
    rpAnalSintProcDBTxt47: TppDBText;
    rpAnalSintProcDBTxt60: TppDBText;
    rpAnalSintProcDBTxt73: TppDBText;
    rpAnalSintProcDBTxt86: TppDBText;
    rpAnalSintProcDBTxt99: TppDBText;
    rpAnalSintProcDBTxt112: TppDBText;
    rpAnalSintProcDBTxt125: TppDBText;
    rpAnalSintProcDBTxt138: TppDBText;
    rpAnalSintProcDBTxt151: TppDBText;
    rpAnalSintProcDBTxt164: TppDBText;
    rpAnalSintProcDBTxt177: TppDBText;
    rpAnalSintProcDBTxt190: TppDBText;
    rpAnalSintProcDBTxt203: TppDBText;
    rpAnalSintProcDBTxt216: TppDBText;
    rpAnalSintProcDBTxt229: TppDBText;
    rpAnalSintProcDBTxt12: TppDBText;
    rpAnalSintProcDBTxt24: TppDBText;
    rpAnalSintProcDBTxt36: TppDBText;
    rpAnalSintProcDBTxt48: TppDBText;
    rpAnalSintProcDBTxt61: TppDBText;
    rpAnalSintProcDBTxt74: TppDBText;
    rpAnalSintProcDBTxt87: TppDBText;
    rpAnalSintProcDBTxt100: TppDBText;
    rpAnalSintProcDBTxt113: TppDBText;
    rpAnalSintProcDBTxt126: TppDBText;
    rpAnalSintProcDBTxt139: TppDBText;
    rpAnalSintProcDBTxt152: TppDBText;
    rpAnalSintProcDBTxt165: TppDBText;
    rpAnalSintProcDBTxt178: TppDBText;
    rpAnalSintProcDBTxt191: TppDBText;
    rpAnalSintProcDBTxt204: TppDBText;
    rpAnalSintProcDBTxt217: TppDBText;
    rpAnalSintProcDBTxt230: TppDBText;
    rpAnalSintProcDBTxt13: TppDBText;
    rpAnalSintProcDBTxt25: TppDBText;
    rpAnalSintProcDBTxt37: TppDBText;
    rpAnalSintProcDBTxt49: TppDBText;
    rpAnalSintProcDBTxt62: TppDBText;
    rpAnalSintProcDBTxt75: TppDBText;
    rpAnalSintProcDBTxt88: TppDBText;
    rpAnalSintProcDBTxt101: TppDBText;
    rpAnalSintProcDBTxt114: TppDBText;
    rpAnalSintProcDBTxt127: TppDBText;
    rpAnalSintProcDBTxt140: TppDBText;
    rpAnalSintProcDBTxt153: TppDBText;
    rpAnalSintProcDBTxt166: TppDBText;
    rpAnalSintProcDBTxt179: TppDBText;
    rpAnalSintProcDBTxt192: TppDBText;
    rpAnalSintProcDBTxt205: TppDBText;
    rpAnalSintProcDBTxt218: TppDBText;
    rpAnalSintProcDBTxt231: TppDBText;
    rpAnalSintProcLbl34: TppLabel;
    rpAnalSintProcDBTxt50: TppDBText;
    rpAnalSintProcDBTxt63: TppDBText;
    rpAnalSintProcDBTxt76: TppDBText;
    rpAnalSintProcDBTxt89: TppDBText;
    rpAnalSintProcDBTxt102: TppDBText;
    rpAnalSintProcDBTxt115: TppDBText;
    rpAnalSintProcDBTxt128: TppDBText;
    rpAnalSintProcDBTxt141: TppDBText;
    rpAnalSintProcDBTxt154: TppDBText;
    rpAnalSintProcDBTxt167: TppDBText;
    rpAnalSintProcDBTxt180: TppDBText;
    rpAnalSintProcDBTxt193: TppDBText;
    rpAnalSintProcDBTxt206: TppDBText;
    rpAnalSintProcDBTxt219: TppDBText;
    rpAnalSintProcDBTxt232: TppDBText;
    updProcTrab: TUpdateSQL;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    procedure rpProcTrabSmryBndAfterPrint(Sender: TObject);
    procedure qryProcTrabAfterScroll(DataSet: TDataSet);
    procedure rpProcTrabSubRep2TitBndBeforePrint(Sender: TObject);
    procedure rpProcTrabSubRep3DtlBndBeforePrint(Sender: TObject);
    procedure qryProcTrab1AfterOpen(DataSet: TDataSet);
    procedure rpProcTrabSubRep1TitBndBeforePrint(Sender: TObject);
    procedure rpProcTrabGrpHdrBnd1BeforePrint(Sender: TObject);
    procedure rpProcTrabGrpHdrBnd2BeforePrint(Sender: TObject);
    procedure rpProcTrabGrpFootBnd0BeforePrint(Sender: TObject);
    procedure rpProcTrabSubRepRateioDtlBnd1BeforePrint(Sender: TObject);
    procedure rpProcTrabBeforePrint(Sender: TObject);
  public
    rPercEnc: real;
    bImprimeLitis, bImprimeEtapa, bImprimeObj, bImprimeObsEtapa, bImprimeCargo,
    bImprimeEconomiaRateio, bExibeRelatRiscoMax, bApuraRateio: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosModCon: TdtmRelatoriosModCon;

implementation

uses fAguarde, uFuncoesUteisRH, uValorAtual, fParamProcTrab, fParamAnalSintProc;

{$R *.DFM}

function TdtmRelatoriosModCon.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMPROCTRAB') then
    frm := TfrmParamProcTrab.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMANALSINTPROC') then
    frm := TfrmParamAnalSintProc.Create(Application)
  else
  if (AnsiUpperCase(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  begin
    with (frm) do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

procedure TdtmRelatoriosModCon.qryProcTrabAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosModCon.qryProcTrab1AfterOpen(DataSet: TDataSet);
begin
  if (qryProcTrab1.IsEmpty) then
  begin
    qryProcTrab1Aux.Open;
    dsProcTrab1.DataSet := qryProcTrab1Aux;
  end
  else
    dsProcTrab1.DataSet := qryProcTrab1;
end;

procedure TdtmRelatoriosModCon.rpProcTrabBeforePrint(Sender: TObject);
begin
  bImprimeEconomiaRateio := false;
end;

procedure TdtmRelatoriosModCon.rpProcTrabGrpHdrBnd2BeforePrint(Sender: TObject);
begin
  rpProcTrabDBTxt19.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');
  rpProcTrabGrpHdrBnd2.Visible :=
    (qryProcTrab.FieldByName('RiscoMaximo_Rateio').asFloat   <> 0) or
    (qryProcTrab.FieldByName('RiscoProvavel_Rateio').asFloat <> 0) or
    (qryProcTrab.FieldByName('ValorReal_Rateio').asFloat     <> 0);
end;

procedure TdtmRelatoriosModCon.rpProcTrabGrpHdrBnd1BeforePrint(Sender: TObject);
begin
  if (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc') then
    bImprimeEconomiaRateio := true;
  rpProcTrabDBTxt13.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');
  rpProcTrabDBTxt14.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');
  rpProcTrabDBTxt15.Visible := (qryProcTrab.FieldByName('SITUACAO').asString = 'Enc');

  if (bImprimeCargo) and (Trim(qryProcTrab.FieldByName('CARGO').asString) <> '') then
  begin
    rpProcTrabGrpHdrBnd1.Height  := 10.054;
    rpProcTrabDBTxtCARGO.Visible := true;
    rpProcTrabDBTxtCARGO.Top     := 5.821;
  end
  else
  begin
    rpProcTrabGrpHdrBnd1.Height  := 5.556;
    rpProcTrabGrpHdrBnd0.Height  := 5.027;
    rpProcTrabDBTxtCARGO.Visible := false;
  end;
end;

procedure TdtmRelatoriosModCon.rpProcTrabSubRep1TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := not(dsProcTrab1.DataSet.IsEmpty) and
    (dsProcTrab1.DataSet.FieldByName('LITISCONSORTE').asString <> 'Indefinido');
end;

procedure TdtmRelatoriosModCon.rpProcTrabSubRep2TitBndBeforePrint(Sender: TObject);
begin
  TppBand(Sender).Visible := (bImprimeEtapa) and not(qryProcTrab2.IsEmpty);
  rpProcTrabSubRep2DBMemo1.Visible := (bImprimeObsEtapa);
  if (bImprimeObsEtapa) then
  begin
    rpProcTrabSubRep2DBMemo1.Left := 37.306;
    rpProcTrabSubRep2DBMemo1.Top  := 3.704;
  end;
end;

procedure TdtmRelatoriosModCon.rpProcTrabSubRep3DtlBndBeforePrint(Sender: TObject);
var
  rValTemp1,rValTemp2,rValTemp3: real;
begin
  if (bImprimeObj) and not(qryProcTrab3.IsEmpty) then
  begin
    rValTemp1 := ValorAtual(qryProcTrab3.FieldByName('VALORRECL').asFloat,
      IFF(qryProcTrab.FieldByName('DATADESLIGAMENTO').asString='',
          qryProcTrab.FieldByName('DATANOTIF').asString,
          qryProcTrab.FieldByName('DATADESLIGAMENTO').asString),
      qryProcTrab.FieldByName('MOEDAPROCTRAB').asString,
      qryProcTrab.FieldByName('IDREGRA').asString,
      qryProcTrab.FieldByName('NUMPROCTRAB').asString,
      qryProcTrab.FieldByName('INDTAXACONV').asInteger);
    rValTemp2 := rValTemp1 * qryProcTrab3.FieldByName('PERCPROB').asFloat / 100;

    if (bExibeRelatRiscoMax) then
      rpProcTrabSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1)
    else
      rpProcTrabSubRep3LblRiscoMax.Caption := FormatFloat('###,###,##0',rValTemp1 *
        qryProcTrab3.FieldByName('PERCORIG').asFloat / 100);

    rpProcTrabSubRep3LblRiscoProv.Caption := FormatFloat('###,###,##0',rValTemp2);

    if (qryProcTrab.FieldByName('FLGSITPROC').asInteger = 1) then
    begin
      rValTemp3 := ValorAtual(qryProcTrab3.FieldByName('VALORSENTENCA').asFloat,
        qryProcTrab.FieldByName('DATAEFETENC').asString,
        qryProcTrab.FieldByName('MOEDAPROCTRAB').asString,
        qryProcTrab.FieldByName('IDREGRA').asString,
        qryProcTrab.FieldByName('NUMPROCTRAB').asString,
        qryProcTrab.FieldByName('INDTAXACONV').asInteger);

      rpProcTrabSubRep3LblValorReal.Caption := FormatFloat('###,###,##0',rValTemp3);
      rpProcTrabSubRep3LblEconomia1.Caption := FormatFloat('###,###,##0',rValTemp1 - rValTemp3);
      rpProcTrabSubRep3LblEconomia2.Caption := FormatFloat('###,###,##0',rValTemp2 - rValTemp3);
    end;
  end;
end;

procedure TdtmRelatoriosModCon.rpProcTrabGrpFootBnd0BeforePrint(Sender: TObject);
begin
  rpProcTrabDBCalc4.Visible := bImprimeEconomiaRateio;
  rpProcTrabDBCalc5.Visible := bImprimeEconomiaRateio;
  rpProcTrabDBCalc6.Visible := bImprimeEconomiaRateio;
end;

procedure TdtmRelatoriosModCon.rpProcTrabSubRepRateioDtlBnd1BeforePrint(Sender: TObject);
begin
  rpProcTrabSubRepRateioDBTxt4.Visible := bImprimeEconomiaRateio;
end;

procedure TdtmRelatoriosModCon.rpProcTrabSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
