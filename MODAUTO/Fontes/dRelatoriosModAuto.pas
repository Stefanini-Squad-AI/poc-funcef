unit dRelatoriosModAuto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppEndUsr, ppStrtch, ppMemo;

type
  TdtmRelatoriosModAuto = class(TdtmReports)
    dsgnRelatorios: TppDesigner;
    qryAtivGestor2: TwwQuery;
    dsAtivGestor2: TwwDataSource;
    pplAtivGestor2: TppBDEPipeline;
    pplAtivGestor2ppField1: TppField;
    pplAtivGestor2ppField2: TppField;
    pplAtivGestor2ppField3: TppField;
    pplAtivGestor2ppField4: TppField;
    pplAtivGestor2ppField5: TppField;
    pplAtivGestor2ppField6: TppField;
    pplAtivGestor2ppField7: TppField;
    pplAtivGestor2ppField8: TppField;
    pplAtivGestor2ppField9: TppField;
    pplAtivGestor2ppField10: TppField;
    pplAtivGestor2ppField11: TppField;
    pplAtivGestor2ppField12: TppField;
    pplAtivGestor2ppField13: TppField;
    pplAtivGestor2ppField14: TppField;
    pplAtivGestor2ppField15: TppField;
    rptAtivGestor2: TppReport;
    ppHeaderBand14: TppHeaderBand;
    ppLabel127: TppLabel;
    ppLine35: TppLine;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppLabel137: TppLabel;
    ppLabel138: TppLabel;
    ppLabel139: TppLabel;
    ppLabel148: TppLabel;
    ppLabel152: TppLabel;
    ppLabel197: TppLabel;
    ppLine36: TppLine;
    rptAtivGestor2Label1: TppLabel;
    txtPerGestor2: TppLabel;
    rptAtivGestor2Label4: TppLabel;
    rptAtivGestor2Label5: TppLabel;
    rptAtivGestor2Label6: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText50: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    rptAtivGestor2DBText2: TppDBText;
    ppDBText156: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine38: TppLine;
    ppLabel199: TppLabel;
    ppCalc26: TppSystemVariable;
    ppCalc27: TppSystemVariable;
    rptAtivGestor2SummaryBand1: TppSummaryBand;
    rptAtivGestor2Label3: TppLabel;
    rptAtivGestor2DBCalc8: TppDBCalc;
    rptAtivGestor2DBCalc9: TppDBCalc;
    rptAtivGestor2DBCalc10: TppDBCalc;
    rptAtivGestor2DBCalc11: TppDBCalc;
    rptAtivGestor2DBCalc12: TppDBCalc;
    rptAtivGestor2DBCalc13: TppDBCalc;
    rptAtivGestor2DBCalc14: TppDBCalc;
    rptAtivGestor2Line1: TppLine;
    rptAtivGestor2Line2: TppLine;
    rptAtivGestor2DBCalc16: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppLabel200: TppLabel;
    ppLine55: TppLine;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine56: TppLine;
    rptAtivGestor2DBCalc1: TppDBCalc;
    rptAtivGestor2DBCalc2: TppDBCalc;
    rptAtivGestor2DBCalc3: TppDBCalc;
    rptAtivGestor2DBCalc4: TppDBCalc;
    rptAtivGestor2DBCalc5: TppDBCalc;
    rptAtivGestor2DBCalc6: TppDBCalc;
    rptAtivGestor2DBCalc7: TppDBCalc;
    rptAtivGestor2Label2: TppLabel;
    rptAtivGestor2DBCalc15: TppDBCalc;
    qryOrcxRealConta: TwwQuery;
    dsOrcxRealConta: TwwDataSource;
    pplOrcxRealConta: TppBDEPipeline;
    pplOrcxRealContappField1: TppField;
    pplOrcxRealContappField2: TppField;
    pplOrcxRealContappField3: TppField;
    pplOrcxRealContappField4: TppField;
    pplOrcxRealContappField5: TppField;
    pplOrcxRealContappField6: TppField;
    pplOrcxRealContappField7: TppField;
    pplOrcxRealContappField8: TppField;
    pplOrcxRealContappField9: TppField;
    pplOrcxRealContappField10: TppField;
    pplOrcxRealContappField11: TppField;
    pplOrcxRealContappField12: TppField;
    pplOrcxRealContappField13: TppField;
    rpOrcxRealConta: TppReport;
    ppHeaderBand26: TppHeaderBand;
    ppLine69: TppLine;
    ppLine68: TppLine;
    ppLabel212: TppLabel;
    ppLabel213: TppLabel;
    ppLabel218: TppLabel;
    ppLabel219: TppLabel;
    ppLabel228: TppLabel;
    ppLabel239: TppLabel;
    ppLabel240: TppLabel;
    ppLabel241: TppLabel;
    ppLabel242: TppLabel;
    ppLine71: TppLine;
    ppLine70: TppLine;
    ppLabel221: TppLabel;
    ppLabel222: TppLabel;
    ppLabel224: TppLabel;
    ppLabel225: TppLabel;
    ppLabel227: TppLabel;
    ppLine73: TppLine;
    ppLabel244: TppLabel;
    ppDetailBand26: TppDetailBand;
    ppDBText115: TppDBText;
    ppDBText114: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppFooterBand26: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLabel215: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine65: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel216: TppLabel;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppLine67: TppLine;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine66: TppLine;
    ppLine72: TppLine;
    ppLabel243: TppLabel;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    qryRelatGrupo: TwwQuery;
    dsRelatGrupo: TwwDataSource;
    pplRelatGrupo: TppBDEPipeline;
    rpRelatGrupo: TppReport;
    ppHeaderBand24: TppHeaderBand;
    ppLabel83: TppLabel;
    ppLine61: TppLine;
    ppLabel205: TppLabel;
    rpRelatGrupoLabel1: TppLabel;
    rpRelatGrupoLabel2: TppLabel;
    rpRelatGrupoLine1: TppLine;
    rpRelatGrupoLine2: TppLine;
    rpRelatGrupoLabel3: TppLabel;
    rpRelatGrupoLabel4: TppLabel;
    rpRelatGrupoLabel5: TppLabel;
    rpRelatGrupoLine3: TppLine;
    rpRelatGrupoLine4: TppLine;
    rpRelatGrupoLabel6: TppLabel;
    rpRelatGrupoLabel7: TppLabel;
    rpRelatGrupoLabel8: TppLabel;
    rpRelatGrupoLine5: TppLine;
    rpRelatGrupoLine6: TppLine;
    rpRelatGrupoLabel9: TppLabel;
    rpRelatGrupoLabel10: TppLabel;
    rpRelatGrupoLabel11: TppLabel;
    rpRelatGrupoLine7: TppLine;
    rpRelatGrupoLine8: TppLine;
    rpRelatGrupoLabel12: TppLabel;
    rpRelatGrupoLabel13: TppLabel;
    rpRelatGrupoLabel14: TppLabel;
    rpRelatGrupoLine9: TppLine;
    rpRelatGrupoLine10: TppLine;
    rpRelatGrupoLabel15: TppLabel;
    rpRelatGrupoLabel16: TppLabel;
    rpRelatGrupoLabel17: TppLabel;
    rpRelatGrupoLine11: TppLine;
    rpRelatGrupoLine12: TppLine;
    rpRelatGrupoLabel18: TppLabel;
    rpRelatGrupoLabel19: TppLabel;
    rpRelatGrupoLabel20: TppLabel;
    rpRelatGrupoLine13: TppLine;
    rpRelatGrupoLabel21: TppLabel;
    rpRelatGrupoLabel22: TppLabel;
    rpRelatGrupoLabel23: TppLabel;
    rpRelatGrupoLabel24: TppLabel;
    rpRelatGrupoLabel25: TppLabel;
    rpRelatGrupoLabel26: TppLabel;
    rpRelatGrupoLabel27: TppLabel;
    rpRelatGrupoLabel28: TppLabel;
    rpRelatGrupoLabel29: TppLabel;
    ppDetailBand24: TppDetailBand;
    rpRelatGrupoDBText1: TppDBText;
    rpRelatGrupoDBText2: TppDBText;
    rpRelatGrupoDBText3: TppDBText;
    rpRelatGrupoDBText4: TppDBText;
    rpRelatGrupoDBText5: TppDBText;
    rpRelatGrupoDBText6: TppDBText;
    rpRelatGrupoDBText7: TppDBText;
    rpRelatGrupoDBText8: TppDBText;
    rpRelatGrupoDBText9: TppDBText;
    rpRelatGrupoDBText10: TppDBText;
    rpRelatGrupoDBText11: TppDBText;
    rpRelatGrupoDBText12: TppDBText;
    rpRelatGrupoDBText13: TppDBText;
    rpRelatGrupoDBText14: TppDBText;
    rpRelatGrupoDBText15: TppDBText;
    ppFooterBand24: TppFooterBand;
    ppLabel206: TppLabel;
    ppLine62: TppLine;
    ppCalc46: TppSystemVariable;
    ppCalc47: TppSystemVariable;
    updRelatGrupo: TUpdateSQL;
    qryRelatGrupoAnual: TwwQuery;
    dsRelatGrupoAnual: TwwDataSource;
    pplRelatGrupoAnual: TppBDEPipeline;
    rpRelatGrupoAnual: TppReport;
    ppHeaderBand25: TppHeaderBand;
    ppLabel207: TppLabel;
    ppLine63: TppLine;
    ppLabel208: TppLabel;
    ppLabel209: TppLabel;
    ppLabel210: TppLabel;
    ppLine64: TppLine;
    ppLabel211: TppLabel;
    ppLabel214: TppLabel;
    ppLabel217: TppLabel;
    ppLabel220: TppLabel;
    ppLabel223: TppLabel;
    ppLabel226: TppLabel;
    ppLabel229: TppLabel;
    ppLabel230: TppLabel;
    ppLabel231: TppLabel;
    ppLabel232: TppLabel;
    ppLabel233: TppLabel;
    ppLabel234: TppLabel;
    ppLabel235: TppLabel;
    ppLabel236: TppLabel;
    ppLabel237: TppLabel;
    rpRelatGrupoAnualLabel1: TppLabel;
    rpRelatGrupoAnualLabel2: TppLabel;
    rpRelatGrupoAnualLabel3: TppLabel;
    rpRelatGrupoAnualLabel4: TppLabel;
    rpRelatGrupoAnualLabel5: TppLabel;
    rpRelatGrupoAnualLabel6: TppLabel;
    ppDetailBand25: TppDetailBand;
    ppDBText92: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppFooterBand25: TppFooterBand;
    ppLabel238: TppLabel;
    ppLine77: TppLine;
    ppCalc48: TppSystemVariable;
    ppCalc49: TppSystemVariable;
    updRelatGrupoAnual: TUpdateSQL;
    rpAvisoFerias: TppReport;
    ppDetailBand2: TppDetailBand;
    AvisoFeriasLbl9: TppLabel;
    AvisoFeriasShp3: TppShape;
    AvisoFeriasShp1: TppShape;
    AvisoFeriasDbTxt2: TppDBText;
    AvisoFeriasDbTxt1: TppDBText;
    AvisoFeriasDbTxt3: TppDBText;
    AvisoFeriasDbTxt4: TppDBText;
    AvisoFeriasLbl1: TppLabel;
    AvisoFeriasLbl2: TppLabel;
    AvisoFeriasShp2: TppShape;
    AvisoFeriasMem1: TppMemo;
    AvisoFeriasMem2: TppMemo;
    AvisoFeriasMem5: TppMemo;
    AvisoFeriasLbl3: TppLabel;
    AvisoFeriasDbTxt5: TppDBText;
    AvisoFeriasLbl6: TppLabel;
    AvisoFeriasDbTxt9: TppDBText;
    AvisoFeriasLbl4: TppLabel;
    AvisoFeriasDbTxt6: TppDBText;
    AvisoFeriasLbl7: TppLabel;
    AvisoFeriasDbTxt10: TppDBText;
    AvisoFeriasLbl5: TppLabel;
    AvisoFeriasDbTxt7: TppDBText;
    AvisoFeriasDbTxt8: TppDBText;
    AvisoFeriasMem3: TppMemo;
    AvisoFeriasMem4: TppMemo;
    AvisoFeriasMem7: TppMemo;
    AvisoFeriasMem9: TppMemo;
    AvisoFeriasLbl10: TppLabel;
    rpAvisoFeriasShape2: TppShape;
    rpAvisoFeriasShape3: TppShape;
    rpAvisoFeriasShape4: TppShape;
    rpAvisoFeriasShape5: TppShape;
    AvisoFeriasLbl8: TppLabel;
    AvisoFeriasLbl11: TppLabel;
    AvisoFeriasLbl12: TppLabel;
    AvisoFeriasLbl13: TppLabel;
    AvisoFeriasLbl14: TppLabel;
    AvisoFeriasLbl15: TppLabel;
    AvisoFeriasLbl16: TppLabel;
    AvisoFeriasLbl17: TppLabel;
    rpAvisoFeriasSysVar1: TppSystemVariable;
    rpAvisoFeriasFooterBand1: TppFooterBand;
    ppAvisoFerias: TppBDEPipeline;
    dsAvisoFerias: TDataSource;
    updSQL: TUpdateSQL;
    qryAvisoFerias: TQuery;
    rpLancRubReemb: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel4: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel19: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    rpLancRubReembLabel1: TppLabel;
    rpLancRubReembLabel2: TppLabel;
    rpLancRubReembLine1: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppCalc5: TppSystemVariable;
    ppDetailBand5: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    rpLancRubReembDBText1: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLabel22: TppLabel;
    ppDBCalc28: TppDBCalc;
    ppLancRubReemb: TppBDEPipeline;
    dsLancRubReemb: TDataSource;
    qryLancRubReemb: TQuery;
    ppLabel16: TppLabel;
    ppLine5: TppLine;
    ppMemo1: TppMemo;
    rpDestacamento: TppReport;
    DestacamentoppHeaderBand5: TppHeaderBand;
    DestacamentoppLblTitulo: TppLabel;
    DestacamentoppDBTxtEmpresa: TppDBText;
    DestacamentoppDBTxtCPFCGC: TppDBText;
    DestacamentoppDBTxtTipo: TppDBText;
    DestacamentoppDBTxtEndereco: TppDBText;
    DestacamentorpLabel1: TppLabel;
    DestacamentorpLabel2: TppLabel;
    rpDestacamentoLabel1: TppLabel;
    rpDestacamentoDBText1: TppDBText;
    rpCadDependenteLabel5: TppLabel;
    rpCadDependenteDBText1: TppDBText;
    DestacamentorpLblMatricula: TppLabel;
    DestacamentorpLblNome: TppLabel;
    DestacamentorpLblAvos1: TppLabel;
    rpCadDependenteLabel2: TppLabel;
    rpCadDependenteLabel6: TppLabel;
    rpFeriasProgramLabel2: TppLabel;
    DestacamentorpCalc1: TppSystemVariable;
    DestacamentorpCalc2: TppSystemVariable;
    DestacamentoppDetailBand15: TppDetailBand;
    DestacamentorpDBText1: TppDBText;
    DestacamentorpDBText2: TppDBText;
    rpCadDependenteDBText3: TppDBText;
    rpCadDependenteDBText4: TppDBText;
    DestacamentoppFooterBand3: TppFooterBand;
    DestacamentorpSummaryBand1: TppSummaryBand;
    rpCadDependenteLabel3: TppLabel;
    rpCadDependenteDBCalc1: TppDBCalc;
    ppDestacamento: TppBDEPipeline;
    dsDestacamento: TDataSource;
    qryDestacamento: TQuery;
    rpDestacamentoDiarias: TppVariable;
    rpDestacamentoTransporte: TppVariable;
    qryCalen: TwwQuery;
    qryTrecho: TwwQuery;
    rpDestacamentoValorTotal: TppVariable;
    ppLabel23: TppLabel;
    ppLine6: TppLine;
    rpDestacamentoTotDiarias: TppVariable;
    rpDestacamentoTotTransporte: TppVariable;
    rpDestacamentoTotValorTotal: TppVariable;
    ppLabel24: TppLabel;
    rpCadDependente: TppReport;
    rpCadDependenteHdrBnd1: TppHeaderBand;
    rpCadDependenteLbl1: TppLabel;
    rpCadDependenteDBTxt1: TppDBText;
    rpCadDependenteDBTxt2: TppDBText;
    rpCadDependenteDBTxt3: TppDBText;
    rpCadDependenteDBTxt4: TppDBText;
    rpCadDependenteLbl3: TppLabel;
    rpCadDependenteLbl4: TppLabel;
    rpCadDependenteLbl2: TppLabel;
    rpCadDependenteDBTxt5: TppDBText;
    rpCadDependenteSysVar1: TppSystemVariable;
    rpCadDependenteSysVar2: TppSystemVariable;
    rpCadDependenteDtlBnd1: TppDetailBand;
    rpCadDependenteDBTxt10: TppDBText;
    rpCadDependenteDBTxt11: TppDBText;
    rpCadDependenteDBTxt12: TppDBText;
    rpCadDependenteFootBnd1: TppFooterBand;
    rpCadDependenteSmryBnd1: TppSummaryBand;
    rpCadDependenteGrp1: TppGroup;
    rpCadDependenteGrpHdrBnd1: TppGroupHeaderBand;
    rpCadDependenteGrpFootBnd1: TppGroupFooterBand;
    ppLine10: TppLine;
    rpCadDependenteLbl12: TppLabel;
    rpCadDependenteDBCalc2: TppDBCalc;
    rpCadDependenteGrp2: TppGroup;
    rpCadDependenteGrpHdrBnd2: TppGroupHeaderBand;
    ppShape2: TppShape;
    rpCadDependenteLbl6: TppLabel;
    rpCadDependenteLine1: TppLine;
    rpCadDependenteLbl8: TppLabel;
    rpCadDependenteLbl10: TppLabel;
    rpCadDependenteDBTxt7: TppDBText;
    rpCadDependenteLbl9: TppLabel;
    ppLabel25: TppLabel;
    ppDBText28: TppDBText;
    ppLabel33: TppLabel;
    ppDBText29: TppDBText;
    rpCadDependenteGrpFootBnd2: TppGroupFooterBand;
    rpCadDependenteLine2: TppLine;
    rpCadDependenteLbl11: TppLabel;
    ppDBCalc29: TppDBCalc;
    ppCadDependente: TppBDEPipeline;
    ppCadDependenteppField1: TppField;
    ppCadDependenteppField2: TppField;
    ppCadDependenteppField3: TppField;
    ppCadDependenteppField4: TppField;
    ppCadDependenteppField5: TppField;
    ppCadDependenteppField6: TppField;
    ppCadDependenteppField7: TppField;
    ppCadDependenteppField8: TppField;
    ppCadDependenteppField9: TppField;
    ppCadDependenteppField10: TppField;
    ppCadDependenteppField11: TppField;
    dsCadDependente: TwwDataSource;
    qryCadDependente: TwwQuery;
    rpLancRubIndiv: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLine7: TppLine;
    ppLabel32: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    rpLancRubIndivLabel1: TppLabel;
    rpLancRubIndivLabel2: TppLabel;
    rpLancRubIndivLabel3: TppLabel;
    rpLancRubIndivLabel4: TppLabel;
    rpLancRubIndivLabel5: TppLabel;
    rpLancRubIndivLabel6: TppLabel;
    rpLancRubIndivLine1: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppDetailBand3: TppDetailBand;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    rpLancRubIndivDBText1: TppDBText;
    rpLancRubIndivDBText2: TppDBText;
    rpLancRubIndivDBText3: TppDBText;
    rpLancRubIndivDBText4: TppDBText;
    rpLancRubIndivDBText5: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine8: TppLine;
    ppLabel34: TppLabel;
    ppDBCalc30: TppDBCalc;
    ppLancRubIndiv: TppBDEPipeline;
    dsLancRubIndiv: TDataSource;
    qryLancRubIndiv: TQuery;
    ppDestacamentoObserv: TppDBMemo;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    rpDestacamentoItinerario: TppMemo;
    ppLabel37: TppLabel;
    ppDBText39: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    dbedValorAlim: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    procedure qryVariavelMensalAfterOpen(DataSet: TDataSet);
    procedure qryVariavelMensalAfterScroll(DataSet: TDataSet);
    procedure rpVarMensalSmryBndAfterPrint(Sender: TObject);
    procedure qryAvisoFeriasAfterScroll(DataSet: TDataSet);
    procedure DestacamentoppDetailBand15BeforePrint(Sender: TObject);
  public
    sMesRef: String;
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosModAuto: TdtmRelatoriosModAuto;

implementation

uses FRParamOrcxRealConta, fAguarde, uDataBase, dBaseDados,
  FParamAtivGestor2, FRParamRelAnoGrupo, FRParamRelGrupo,
  fParamLancRubReemb, fParamDestacamento, uFuncoesUteisRH,
  fParamCadDependente, fParamLancRubIndiv, uSistema;

{$R *.DFM}

function TdtmRelatoriosModAuto.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMRPARAMORCXREALCONTA') then
    frm := TfrmRParamOrcxRealConta.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMATIVGESTOR2') then
    frm := TfrmParamAtivGestor2.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMRPARAMRELGRUPO') then
    frm := TFrmRParamRelGrupo.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMRPARAMRELANOGRUPO') then
    frm := TFrmRParamRelAnoGrupo.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMLANCRUBREEMB') then
    frm := TfrmParamLancRubReemb.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMLANCRUBINDIV') then
    frm := TfrmParamLancRubIndiv.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMDESTACAMENTO') then
    frm := TfrmParamDestacamento.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMCADDEPENDENTE') then
    frm := TfrmParamCadDependente.Create(Application)
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

procedure TdtmRelatoriosModAuto.qryVariavelMensalAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosModAuto.qryVariavelMensalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosModAuto.rpVarMensalSmryBndAfterPrint(Sender: TObject);
begin
  inherited;
  rpDestacamentoTotDiarias.Value   := 0;
  rpDestacamentoTotTransporte.Value:= 0;   rpDestacamentoTotValorTotal.Value := 0;
  frmAguarde.Apaga;
end;

procedure TdtmRelatoriosModAuto.qryAvisoFeriasAfterScroll(DataSet: TDataSet);
begin
  qryVariavelMensalAfterScroll(DataSet);
  AvisoFeriasLbl8.Visible := (qryAvisoFerias.FieldByName('FLGABONO').asInteger = 1);
  AvisoFeriasMem7.Visible := AvisoFeriasLbl8.Visible;

  AvisoFeriasLbl9.Caption := 'Parcelamento da devolução do adiantamento de férias em '+
    qryAvisoFerias.FieldByName('QTDPARCDEVOL').asString +' vez(es)';

  AvisoFeriasLbl11.Caption := 'Período aquisitivo de '+
    qryAvisoFerias.FieldByName('INIPERIODOFERIAS').asString +
    ' a '+ qryAvisoFerias.FieldByName('FIMPERIODOFERIAS').asString;

  AvisoFeriasLbl12.Caption := 'Dias de duração: '+
    qryAvisoFerias.FieldByName('DIASDEFERIAS').asString;

  AvisoFeriasLbl13.Caption := 'Período de gozo de '+
    qryAvisoFerias.FieldByName('INIGOZOFERIAS').asString +
    ' a '+ qryAvisoFerias.FieldByName('FIMGOZOFERIAS').asString;
end;

procedure TdtmRelatoriosModAuto.DestacamentoppDetailBand15BeforePrint(Sender: TObject);
var
  sSql: string;
 // QtDiar1, QtDiar2, QtDiar3, QtDiarAntes, QtDiarApos, FlgAntes, FlgApos: integer;
begin
//Gustavo Mendes - Inicio

  rpDestacamentoDiarias.Value := 0;
  rpDestacamentoTransporte.Value := 0;
  rpDestacamentoValorTotal.Value := 0;
  rpDestacamentoItinerario.Caption := '';

{  QtDiar1 := 0;
  QtDiar2 := 0;
  QtDiar3 := 0;
  QtDiarAntes := 0;
  QtDiarApos := 0;
}
  if qryDestacamento.FieldByName('IDDESTACAMENTO').asString = '' then
    exit;

  qryCalen.Close;
  qryCalen.ParamByName('IDDESTACAMENTO').asString := qryDestacamento.FieldByName('IDDESTACAMENTO').asString;
  qryCalen.Open;

  if (not qryCalen.IsEmpty) then
  begin
     qryCalen.First;
     while not qryCalen.Eof do
     begin
{
        if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime < qryDestacamento.FieldByName('DATAINI').asDateTime then
           inc(QtDiarAntes)
        else
        if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime > qryDestacamento.FieldByName('DATAFIM').asDateTime then
           inc(QtDiarApos)
        else
        begin
          if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime = qryDestacamento.FieldByName('DATAINI').asDateTime then
             flgAntes := qryCalen.FieldByName('FLGDIARIA').asInteger;

          if qryCalen.FieldByName('DATADESTACAMENTO').asDateTime = qryDestacamento.FieldByName('DATAFIM').asDateTime then
             flgApos := qryCalen.FieldByName('FLGDIARIA').asInteger;

          if qryCalen.FieldByName('FLGDIARIA').asInteger = 0 then
            inc(QtDiar2)
          else
            inc(QtDiar3);
        end;
}
        rpDestacamentoDiarias.Value := rpDestacamentoDiarias.Value + qryCalen.FieldByName('VLRDIARIA').AsFloat;

        qryCalen.Next;
     end;

     qryCalen.First;
{     if flgAntes = 0 then
        QtDiar1 := QtDiar1 + QtDiarAntes
     else
        QtDiar2 := QtDiar2 + QtDiarAntes;

     if flgApos = 0 then
        QtDiar1 := QtDiar1 + QtDiarApos
     else
        QtDiar2 := QtDiar2 + QtDiarApos;
}
  end;

{
  sSql:= 'SELECT ' +
***********************Marcus
//        Estas 2 linhas foram comentadas para forçar diária cheia em todos os casos
//        Depois, serão definidos parâmetros para estas situações (Funcef)
//        IntToStr(QTDIAR1) + ' * 0.25 * NVL(DV.VLRDST,0) + '+
//        IntToStr(QTDIAR2) + ' * 0.50 * NVL(DV.VLRDST,0) + '+
************************Fim
          IntToStr(QTDIAR1) + ' * NVL(DV.VLRDST,0) + '+
          IntToStr(QTDIAR2) + ' * NVL(DV.VLRDST,0) + '+
          IntToStr(QTDIAR3) + ' * NVL(DV.VLRDST,0)'+
          ' AS VALORDIARIA '+
          'FROM  '+
          '(SELECT IDDSTTARIFA, VLRDST FROM FUNCIONARIO F, CARGO C, DSTVALORES V '+
          '  WHERE V.DATADSTVALORES = (SELECT MAX(V.DATADSTVALORES) '+
          '                                FROM FUNCIONARIO F, CARGO C, DSTVALORES V '+
          '                                WHERE F.IDPESSOA = ' +
                                            qryDestacamento.FieldByName('IDPESSOA').asString +
                                            ' AND '+
          '                                 DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO AND '+
          '                                 C.CODNIVEL      = V.IDDSTTARIFA AND '+
          '                                 V.DATADSTVALORES <= TO_DATE(' +
           QuotedStr(qryDestacamento.FieldByName('DATAINI').asString) + ',''DD/MM/YYYY''))' +
          '  AND F.IDPESSOA = ' +     qryDestacamento.FieldByName('IDPESSOA').asString +
          '  AND DECODE(F.IDFUNCAO,NULL,F.IDCARGO,F.IDFUNCAO) = C.IDCARGO AND '+
          '  C.CODNIVEL      = V.IDDSTTARIFA ) DV ';
}


//  If Fazquery(DtmBaseDados.qry,sSql) Then
//     rpDestacamentoDiarias.Value := DtmBaseDados.qry.FieldByName('VALORDIARIA').asFloat;

  qryTrecho.Close;
  qryTrecho.ParamByName('IDDESTACAMENTO').asString := qryDestacamento.FieldByName('IDDESTACAMENTO').asString;
  qryTrecho.Open;

  qryTrecho.First;
  rpDestacamentoItinerario.Lines.Clear;
  while not qryTrecho.Eof do
  begin
    rpDestacamentoTransporte.Value := rpDestacamentoTransporte.Value +
                       qryTrecho.FieldByName('FLGTRANSPORTE').asInteger *
                       qryTrecho.FieldByName('VLRTRANSPORTE').asFloat   +
                       qryTrecho.FieldByName('VLREMBARQUE').asFloat   +
                       qryTrecho.FieldByName('VLRDESEMBARQUE').asFloat;
    rpDestacamentoItinerario.Lines.Add(trim(qryTrecho.FieldByName('NOME').asString));
    qryTrecho.Next;
  end;
  qryTrecho.First;

  rpDestacamentoValorTotal.Value := rpDestacamentoDiarias.Value + rpDestacamentoTransporte.Value;
  rpDestacamentoTotDiarias.Value := rpDestacamentoTotDiarias.Value + rpDestacamentoDiarias.Value;
  rpDestacamentoTotTransporte.Value:= rpDestacamentoTotTransporte.Value + rpDestacamentoTransporte.Value;
  rpDestacamentoTotValorTotal.Value:= rpDestacamentoTotDiarias.Value + rpDestacamentoTotTransporte.Value;
end;

end.
