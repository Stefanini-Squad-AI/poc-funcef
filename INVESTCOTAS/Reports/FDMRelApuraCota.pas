unit FDMRelApuraCota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReportInv, ppCtrls, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, TXRB,
  CmParamReport, ppStrtch, ppRegion, ppSubRpt, uCtrlPadroes,
  uCtrlInvestCotas, uCtrlParamCotaInvest;

type
  TRelApuraCota = class(TFrmCmReportInv)
    DsAtivo: TDataSource;
    CdsAtivo: TCMClientDataSet;
    CMSqlParams1: TCMSqlParams;
    pplAtivo: TppBDEPipeline;
    ppBDEPipeline2ppMasterFieldLink3: TppMasterFieldLink;
    DsPassivo: TDataSource;
    CdsPassivo: TCMClientDataSet;
    CMSqlParams2: TCMSqlParams;
    pplPassivo: TppBDEPipeline;
    ppBDEPipeline1ppMasterFieldLink3: TppMasterFieldLink;
    ppDBText5: TppDBText;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppShape1: TppShape;
    ppRAtivo: TppRegion;
    ppRPassivo: TppRegion;
    ppSRAtivo: TppSubReport;
    ppChildReport1: TppChildReport;
    ppSRPassivo: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBTotalAtivo: TppDBCalc;
    ppLabel6: TppLabel;
    ppDBTotalPassivo: TppDBCalc;
    ppLabel7: TppLabel;
    ppRPLF: TppRegion;
    ppRQtd: TppRegion;
    ppRCota: TppRegion;
    ppSRQtd: TppSubReport;
    ppChildReport4: TppChildReport;
    ppSRCota: TppSubReport;
    ppChildReport5: TppChildReport;
    CMSqlParams3: TCMSqlParams;
    CdsPLF: TCMClientDataSet;
    DsPLF: TDataSource;
    pplPLF: TppBDEPipeline;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    CMSqlParams4: TCMSqlParams;
    CdsQtd: TCMClientDataSet;
    DsQtd: TDataSource;
    pplQtd: TppBDEPipeline;
    ppMasterFieldLink2: TppMasterFieldLink;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    CMSqlParams5: TCMSqlParams;
    CdsCota: TCMClientDataSet;
    DsCota: TDataSource;
    pplCota: TppBDEPipeline;
    ppMasterFieldLink4: TppMasterFieldLink;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ppGroup12: TppGroup;
    ppGroupHeaderBand12: TppGroupHeaderBand;
    ppGroupFooterBand12: TppGroupFooterBand;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppShape2: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape3: TppShape;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLine4: TppLine;
    CdsAux: TCMClientDataSet;
    ppShape5: TppShape;
    ppDBText10: TppDBText;
    ppDBQtd: TppDBText;
    ppShape6: TppShape;
    ppDBText12: TppDBText;
    ppDBCota: TppDBText;
    ppSRPLF: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand7: TppDetailBand;
    ppSummaryBand6: TppSummaryBand;
    ppShape4: TppShape;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    CMSqlParams7: TCMSqlParams;
    CdsCTE: TCMClientDataSet;
    DsCTE: TDataSource;
    pplCTE: TppBDEPipeline;
    ppMasterFieldLink5: TppMasterFieldLink;
    ppMasterFieldLink6: TppMasterFieldLink;
    CMSqlParams8: TCMSqlParams;
    CdsCTR: TCMClientDataSet;
    DsCTR: TDataSource;
    pplCTR: TppBDEPipeline;
    ppMasterFieldLink7: TppMasterFieldLink;
    ppMasterFieldLink8: TppMasterFieldLink;
    ppRPL: TppRegion;
    ppSRPL: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppDetailBand5: TppDetailBand;
    ppShape7: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppGroup13: TppGroup;
    ppGroupHeaderBand13: TppGroupHeaderBand;
    ppGroupFooterBand13: TppGroupFooterBand;
    ppGroup14: TppGroup;
    ppGroupHeaderBand14: TppGroupHeaderBand;
    ppGroupFooterBand14: TppGroupFooterBand;
    CMSqlParams6: TCMSqlParams;
    CdsPL: TCMClientDataSet;
    DsPL: TDataSource;
    pplPL: TppBDEPipeline;
    ppRCTE: TppRegion;
    ppSRCTE: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppSummaryBand7: TppSummaryBand;
    ppGroup15: TppGroup;
    ppGroupHeaderBand15: TppGroupHeaderBand;
    ppGroupFooterBand15: TppGroupFooterBand;
    ppGroup16: TppGroup;
    ppGroupHeaderBand16: TppGroupHeaderBand;
    ppGroupFooterBand16: TppGroupFooterBand;
    ppShape8: TppShape;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppRCTR: TppRegion;
    ppSRCTR: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppDetailBand9: TppDetailBand;
    ppSummaryBand8: TppSummaryBand;
    ppGroup17: TppGroup;
    ppGroupHeaderBand17: TppGroupHeaderBand;
    ppGroupFooterBand17: TppGroupFooterBand;
    ppGroup18: TppGroup;
    ppGroupHeaderBand18: TppGroupHeaderBand;
    ppGroupFooterBand18: TppGroupFooterBand;
    ppShape9: TppShape;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppShape10: TppShape;
    ppDBValorAtivo: TppDBText;
    ppDBEventoAtivo: TppDBText;
    ppShape11: TppShape;
    ppDBValorPassivo: TppDBText;
    ppDBEventoPassivo: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);    
    procedure ppDetailBand4AfterPrint(Sender: TObject);
    procedure ppDetailBand6AfterPrint(Sender: TObject);
    procedure ppShape10Print(Sender: TObject);
    procedure rptReportStartPage(Sender: TObject);
    procedure rptReportBeforePrint(Sender: TObject);
    procedure ppShape11Print(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    cCorZebra : TColor;    
  public
    { Public declarations }
  end;

var
  RelApuraCota: TRelApuraCota;

implementation

{$R *.DFM}

procedure TRelApuraCota.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
end;

procedure TRelApuraCota.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TRelApuraCota.ppDetailBand4AfterPrint(Sender: TObject);
begin
  inherited;
   CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, Cds.FieldByName('IDCARTEIRAINVEST').AsInteger);
   ppDBQtd.DisplayFormat := CtrlInvestCotas.MontaMascara(CdsAux.FieldByName('QTDDECQTD').AsInteger);
end;

procedure TRelApuraCota.ppDetailBand6AfterPrint(Sender: TObject);
begin
  inherited;
   CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, Cds.FieldByName('IDCARTEIRAINVEST').AsInteger);
   ppDBCota.DisplayFormat := CtrlInvestCotas.MontaMascara(CdsAux.FieldByName('QTDDECVLR').AsInteger);
end;

procedure TRelApuraCota.ppShape10Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TRelApuraCota.rptReportStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TRelApuraCota.rptReportBeforePrint(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
end;

procedure TRelApuraCota.ppShape11Print(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

end.
