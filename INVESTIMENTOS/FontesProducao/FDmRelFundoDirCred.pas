//******************************************************************************
//Rotina..........:
//N. Sol..........: 174651 
//N. Kintana......: 1607521
//Data............: 20/03/2012
//Responsável.....: Otacilio Aquino
//Descrição.......: Implementando para cada Relatorio ficar individual com cada
//                  DATAMODULO 
//******************************************************************************
unit FDmRelFundoDirCred;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelFundoDirCred = class(TDmRelatoriosInv)
    rptSaldoFundos: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppsSaldoFundosCab: TppShape;
    pplblSaldoFundosFundo: TppLabel;
    pplblSaldoFundosQtd: TppLabel;
    pplblSaldoFundosVlrBruto: TppLabel;
    pplblSaldoFundosIOF: TppLabel;
    pplblSaldoFundosIR: TppLabel;
    pplblSaldoFundosSldLiq: TppLabel;
    LblPlano: TppLabel;
    ppLabel7: TppLabel;
    ppLabel86: TppLabel;
    lblCarteira: TppLabel;
    pplblSaldoFundosDataRef: TppLabel;
    ppDBImage6: TppDBImage;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    dtbDatalhes: TppDetailBand;
    ppsSaldoFundosDet: TppShape;
    srptSaldoFundos: TppSubReport;
    ppChildReport4: TppChildReport;
    ppDetailBand7: TppDetailBand;
    ppShape1: TppShape;
    ppsSaldoFundosSDet: TppShape;
    ppDBSSaldoFundosAplicacao: TppDBText;
    ppDBSSaldoFundosQTD: TppDBText;
    ppDBSSaldoFundosVlrCota: TppDBText;
    ppDBSSaldoFundosVlrBruto: TppDBText;
    ppDBSSaldoFundosIOF: TppDBText;
    ppDBSSaldoFundosIR: TppDBText;
    ppDBSSaldoFundosSlrLiq: TppDBText;
    dbTipoCota: TppDBText;
    ppDBText1: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppsSaldoFundosSCab: TppShape;
    pplblSSaldoFundosAplicacao: TppLabel;
    pplblSSaldoFundosQTD: TppLabel;
    lblValorCota: TppLabel;
    pplblSSaldoFundosVlrBruto: TppLabel;
    pplblSSaldoFundosVlrBrutoIOF: TppLabel;
    pplblSSaldoFundosVlrBrutoIR: TppLabel;
    pplSSaldoFundosCab: TppLine;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppDBSaldoFundosFundo: TppDBText;
    ppDBSaldoFundosQTD: TppDBText;
    ppDBSaldoFundosVlrBruto: TppDBText;
    ppDBSaldoFundosIOF: TppDBText;
    ppDBSaldoFundosIR: TppDBText;
    ppDBSaldoFundosSldLiq: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand10: TppSummaryBand;
    ppLabel72: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppLine35: TppLine;
    ppLine5: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppGroup7: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ghbCabecalhoPlano: TppGroupHeaderBand;
    ppDBText29: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    gfbRodapePlano: TppGroupFooterBand;
    dbcValBrutoPlano: TppDBCalc;
    pplLinhaRodapeFundo: TppLine;
    dbcValIOFPlano: TppDBCalc;
    dbcValIRPlano: TppDBCalc;
    dbcValLiqFundo: TppDBCalc;
    ppLabel3: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    pplSaldoFundo: TppBDEPipeline;
    pplSaldoFundoppField1: TppField;
    pplSaldoFundoppField2: TppField;
    pplSaldoFundoppField3: TppField;
    pplSaldoFundoppField4: TppField;
    pplSaldoFundoppField5: TppField;
    pplSaldoFundoppField6: TppField;
    pplSaldoFundoppField7: TppField;
    pplSaldoFundoppField8: TppField;
    pplSaldoFundoppField9: TppField;
    pplSaldoFundoppField10: TppField;
    pplSaldoFundoppField11: TppField;
    pplSaldoFundoppField12: TppField;
    pplSaldoFundoppField13: TppField;
    pplSaldoFundoppField14: TppField;
    pplSaldoFundoppField15: TppField;
    pplSaldoFundoppField16: TppField;
    pplSaldoFundoppField17: TppField;
    pplSaldoFundoppField18: TppField;
    dsSaldoTot: TDataSource;
    QrySaldoTot: TwwQuery;
    QrySaldoTotDESCFUNDOINVEST: TStringField;
    QrySaldoTotSALDOQTDCOTAS: TFloatField;
    QrySaldoTotSALDOVLRFUNDO: TFloatField;
    QrySaldoTotVLRIOFPROV: TFloatField;
    QrySaldoTotVLRIRPROV: TFloatField;
    QrySaldoTotSALDOLIQUIDO: TFloatField;
    QrySaldoTotPLANPRVCONTABPATRO: TStringField;
    QrySaldoTotSALDOQTDCOTASBLQ: TFloatField;
    QrySaldoTotDESCTIPOFUNDOINV: TStringField;
    QrySaldoTotIDTIPOFUNDOINVEST: TFloatField;
    QrySaldoTotIDPLANPREVCTBPATR: TFloatField;
    QrySaldoTotIDFUNDOINVEST: TFloatField;
    QrySaldoTotSALDOQTDCOTASG: TFloatField;
    QrySaldoTotSALDOQTDCOTASBLQG: TFloatField;
    QrySaldoTotSALDOVLRFUNDOG: TFloatField;
    QrySaldoTotVLRIOFPROVG: TFloatField;
    QrySaldoTotVLRIRPROVG: TFloatField;
    QrySaldoTotSALDOLIQUIDOG: TFloatField;
    pplSaldoFundoDet: TppBDEPipeline;
    pplSaldoFundoDetppField1: TppField;
    pplSaldoFundoDetppField2: TppField;
    pplSaldoFundoDetppField3: TppField;
    pplSaldoFundoDetppField4: TppField;
    pplSaldoFundoDetppField5: TppField;
    pplSaldoFundoDetppField6: TppField;
    pplSaldoFundoDetppField7: TppField;
    pplSaldoFundoDetppField8: TppField;
    pplSaldoFundoDetppField9: TppField;
    pplSaldoFundoDetppField10: TppField;
    pplSaldoFundoDetppField11: TppField;
    pplSaldoFundoDetppField12: TppField;
    pplSaldoFundoDetppField13: TppField;
    pplSaldoFundoDetppField14: TppField;
    pplSaldoFundoDetppField15: TppField;
    pplSaldoFundoDetppField16: TppField;
    pplSaldoFundoDetppField17: TppField;
    pplSaldoCon: TppBDEPipeline;
    pplSaldoConppField1: TppField;
    pplSaldoConppField2: TppField;
    pplSaldoConppField3: TppField;
    pplSaldoConppField4: TppField;
    pplSaldoConppField5: TppField;
    pplSaldoConppField6: TppField;
    pplSaldoConppField7: TppField;
    pplSaldoConppField8: TppField;
    pplSaldoConppField9: TppField;
    pplSaldoConppField10: TppField;
    DtsSaldoCon: TDataSource;
    QrySaldoCon: TwwQuery;
    QrySaldoDet: TwwQuery;
    QrySaldoDetPLANPRVCONTABPATRO: TStringField;
    QrySaldoDetDESCFUNDOINVEST: TStringField;
    QrySaldoDetDATAAPLICACAO: TDateTimeField;
    QrySaldoDetDATAMOVFUNDO: TDateTimeField;
    QrySaldoDetSALDOQTDCOTAS: TFloatField;
    QrySaldoDetSALDOVLRFUNDO: TFloatField;
    QrySaldoDetVLRCOTAATUAL: TFloatField;
    QrySaldoDetSALDOQTDCOTASBLQ: TFloatField;
    QrySaldoDetVLRIOFPROV: TFloatField;
    QrySaldoDetVLRIRPROV: TFloatField;
    QrySaldoDetSALDOLIQUIDO: TFloatField;
    QrySaldoDetVLRCOTAAPLICACAO: TFloatField;
    QrySaldoDetDESCTIPOCOTA: TStringField;
    QrySaldoDetIDFUNDOINVEST: TFloatField;
    QrySaldoDetIDPLANPREVCTBPATR: TFloatField;
    QrySaldoDetIDTIPOFUNDOINVEST: TFloatField;
    QrySaldoDetDESCTIPOFUNDOINV: TStringField;
    DtsSaldoDet: TDataSource;
    rptSaldoFundoCon: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLabel113: TppLabel;
    pplblSaldoFundosConDataRef: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel32: TppLabel;
    ppDBText5: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel33: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel34: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    procedure ppsSaldoFundosDetPrint(Sender: TObject);
    procedure dtbDatalhesBeforePrint(Sender: TObject);
    procedure srptSaldoFundosPrint(Sender: TObject);
    procedure rptSaldoFundosStartPage(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gfbRodapePlanoAfterGenerate(Sender: TObject);
    procedure gfbRodapePlanoBeforePrint(Sender: TObject);
    procedure rptSaldoFundoConStartPage(Sender: TObject);
  private
    { Private declarations }
    cCorZebra   : TColor;
    wCountPlano : Integer;
    bImp        : Boolean;
    procedure SetImpTipoCota(pImp: Boolean);

  published
     Property ImpTipoCota : Boolean read bImp write SetImpTipoCota;

  public
    { Public declarations }
  end;

var
  DmRelFundoDirCred: TDmRelFundoDirCred;

implementation

Uses uBibliotecaInvest;

{$R *.DFM}

{ TDmRelFundoDirCred }

procedure TDmRelFundoDirCred.SetImpTipoCota(pImp: Boolean);
begin
  bImp := pImp;
end;

procedure TDmRelFundoDirCred.ppsSaldoFundosDetPrint(Sender: TObject);
begin
  inherited;
  if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
  else
      cCorZebra := ClWhite;

  TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelFundoDirCred.dtbDatalhesBeforePrint(Sender: TObject);
begin
  inherited;
  wCountPlano := wCountPlano + 1;
end;

procedure TDmRelFundoDirCred.srptSaldoFundosPrint(Sender: TObject);
begin
  inherited;
  QrySaldoDet.Filter   := 'IDFUNDOINVEST     = ' + QrySaldoTot.FieldByName('IDFUNDOINVEST').AsString + ' AND ' +
                          'IDPLANPREVCTBPATR = ' + QrySaldoTot.FieldByName('IDPLANPREVCTBPATR').AsString;
  QrySaldoDet.Filtered := True;
end;

procedure TDmRelFundoDirCred.rptSaldoFundosStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra          := $00E3E3E3;
  dbTipoCota.Visible := ImpTipoCota;
end;

procedure TDmRelFundoDirCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ImpTipoCota := False;
end;

procedure TDmRelFundoDirCred.gfbRodapePlanoAfterGenerate(Sender: TObject);
begin
  inherited;
  wCountPlano := 0;
end;

procedure TDmRelFundoDirCred.gfbRodapePlanoBeforePrint(Sender: TObject);
begin
  inherited;
  If ghbCabecalhoPlano.Visible then
    begin
      If wCountPlano <= 1 Then
        gfbRodapePlano.Visible := False
      else
        gfbRodapePlano.Visible := True;
    end
  else
    gfbRodapePlano.Visible := False;

  wCountPlano   := 0;
end;

procedure TDmRelFundoDirCred.rptSaldoFundoConStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra          := $00E3E3E3;
  dbTipoCota.Visible := ImpTipoCota;
end;

end.
