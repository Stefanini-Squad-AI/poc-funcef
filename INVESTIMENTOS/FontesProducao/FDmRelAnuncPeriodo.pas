//******************************************************************************
// SOL        : 126954.1321
// Kintana    : 782044
// Data       : 16/04/2010
// Responsável: Adilson Monteiro Filho
// Descrição  : Adicionada uam linha total geral em Valor a Receber

//******************************************************************************
// Rotina     : qryAnuncPeriodo / QryAnuncPeriodoCon
// SOL        : 126954/1261
// Kintana    : 771643
// Data       : 31/03/2010
// Responsável: Ricardo Cristiano
// Motivo     : Implementação do valor da remuneração somando como valor da
//               operação conforme solicitação.
//******************************************************************************
// Data      : 09/08/2007
// Código    : AL_1
// Pendência : 24957
// SOL       : 56201
// Motivo    : Implementação do Relatório Consolidado por Investimento
//******************************************************************************
// Data      : 31/10/2006
// Pendencia : 23665
// SOL       :
// Descrição : Segregação de Planos
//******************************************************************************
// Data     : 28/06/2005
// Código   : AL_1
// Motivo   : Implementação do Relatório de Consulta Anúncios no Período
//******************************************************************************

unit FDmRelAnuncPeriodo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm,
  ppDB, ppDBPipe, ppDBBDE, ppRelatv;

type
  TDmRelAnuncPeriodo = class(TDmRelatoriosInv)
    qryTipoAnuncio: TwwQuery;
    qryTipoAnuncioDESCTIPOOPERACAO: TStringField;
    qryTipoAnuncioIDTIPOOPERACAO: TFloatField;
    qryInvestimento: TwwQuery;
    qryInvestimentoDESCINVESTIMENTO: TStringField;
    qryInvestimentoIDINVESTIMENTO: TFloatField;
    qryAnuncPeriodo: TwwQuery;
    dsAnuncPeriodo: TwwDataSource;
    pplAnuncPeriodo: TppBDEPipeline;
    rptAnuncPeriodo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    shpCabecalho: TppShape;
    lblAnuncio: TppLabel;
    lblBoleta: TppLabel;
    lblDataEx: TppLabel;
    lblDataCom: TppLabel;
    lblDataBase: TppLabel;
    lblDesInvestim: TppLabel;
    lblQuantidade: TppLabel;
    lblPU: TppLabel;
    lblVlr: TppLabel;
    //Ricardo Cristiano - 05/04/2010 - N. Sol 126954/1261 -  N. Kintana 771643
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    dbtTovVlrOper: TppDBCalc;
    lblTotais: TppLabel;
    shpDetalhe: TppShape;
    ppdbTipoAnuncio: TppDBText;
    //Ricardo Cristiano - 05/04/2010 - N. Sol 126954/1261 -  N. Kintana 771643    
    ppdbBoleta: TppDBText;
    ppdbDataEx: TppDBText;
    ppdbDataCom: TppDBText;
    ppdbDataBase: TppDBText;
    ppdbDescInvestim: TppDBText;
    ppdbQtd: TppDBText;
    ppdbVlrARec: TppDBText;
    ppdbPU: TppDBText;
    qryAnuncPeriodoIDOPERACAOINVEST: TFloatField;
    qryAnuncPeriodoIDOPERACAODIREITO: TFloatField;
    qryAnuncPeriodoIDTIPOOPERACAO: TFloatField;
    qryAnuncPeriodoDESCTIPOOPERACAO: TStringField;
    qryAnuncPeriodoTIPOANUNCIO: TFloatField;
    qryAnuncPeriodoDESCANUNCIO: TStringField;
    qryAnuncPeriodoDATAOPERACAO: TDateTimeField;
    qryAnuncPeriodoBOLETA: TStringField;
    qryAnuncPeriodoPRECOUNITOPERACAO: TFloatField;
    qryAnuncPeriodoVLROPERACAO: TFloatField;
    qryAnuncPeriodoDESCINVESTIMENTO: TStringField;
    qryAnuncPeriodoQTDEOPERACAO: TFloatField;
    qryAnuncPeriodoDATAEX: TDateTimeField;
    qryAnuncPeriodoDATACOM: TDateTimeField;
    qryAnuncPeriodoDESCCARTINVEST: TStringField;
    lblTipoOper: TppLabel;
    dddbTipoOper: TppDBText;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryAnuncPeriodoDATAAGE: TDateTimeField;
    qryAnuncPeriodoDATAOPER: TDateTimeField;
    ppdbDataAGE: TppDBText;
    lblDataAge: TppLabel;
    qryPlanoPrev: TwwQuery;
    qryPlanoPrevPLANPRVCONTABPATRO: TStringField;
    qryPlanoPrevPLANOCONTABIL: TStringField;
    qryPlanoPrevPATROCINADORA: TStringField;
    qryPlanoPrevIDPLANPREVCTBPATR: TFloatField;
    qryPlanoPrevIDPLANOPREV: TFloatField;
    qryPlanoPrevIDPATRO: TFloatField;
    qryAnuncPeriodoPLANPRVCONTABPATRO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    //AL_1
    rptAnuncPeriodoCon: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBImage2: TppDBImage;
    lblPeriodoCon: TppLabel;
    ppShape2: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape3: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel19: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable4: TppSystemVariable;
    ppLabel20: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBText14: TppDBText;
    pplAnuncPeriodoCon: TppBDEPipeline;
    DsAnuncPeriodoCon: TwwDataSource;
    QryAnuncPeriodoCon: TwwQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField6: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    DateTimeField5: TDateTimeField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel21: TppLabel;
    ppLabel12: TppLabel;
    ppLabel22: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppShape7: TppShape;
    ppLine4: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppShape8: TppShape;
    ppLabel5: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine7: TppLine;
    ppShape9: TppShape;
    ppShape10: TppShape;
    //Ricardo Cristiano - 05/04/2010 - N. Sol 126954/1261 -  N. Kintana 771643
    qryAnuncPeriodoVLRREMUNERACAO: TFloatField;
    QryAnuncPeriodoConVLRREMUNERACAO: TFloatField;
    ppLabel7: TppLabel;
    ppDBText15: TppDBText;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppDBText17: TppDBText;
    ppLine5: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    qryAnuncPeriodoVLRRCBER: TFloatField;
    ppLabel26: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel27: TppLabel;
    QryAnuncPeriodoConVLRRCBER: TFloatField;
    ppLabel28: TppLabel;
    ppDBText16: TppDBText;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    QrySegmentacao: TwwQuery;
    QrySegmentacaoIDSEGMENTACAO: TFloatField;
    QrySegmentacaoDESCSEGMENTACAO: TStringField;
    QrySegmentacaoIDGRUPO: TFloatField;
    qryAnuncPeriodoDESCSEGMENTACAO: TStringField;
    qryAnuncPeriodoIDSEGMENTACAO: TFloatField;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppShape11: TppShape;
    ppDBText20: TppDBText;
    ppLabel23: TppLabel;
    QryAnuncPeriodoConDESCSEGMENTACAO: TStringField;
    QryAnuncPeriodoConIDSEGMENTACAO: TFloatField;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppShape12: TppShape;
    ppLabel29: TppLabel;
    ppDBText21: TppDBText;
    ppShape13: TppShape;
    ppLabel30: TppLabel;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    // Fim AL_1
    procedure rptAnuncPeriodoStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
  private
    { Private declarations }
     cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelAnuncPeriodo: TDmRelAnuncPeriodo;

implementation

{$R *.DFM}

procedure TDmRelAnuncPeriodo.rptAnuncPeriodoStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelAnuncPeriodo.shpDetalhePrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra
end;

end.
