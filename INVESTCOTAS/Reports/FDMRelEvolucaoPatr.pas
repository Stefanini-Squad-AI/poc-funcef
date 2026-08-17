unit FDMRelEvolucaoPatr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReportInv, ppCtrls, ppVar, ppBands, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, uCmRptManager, TXComp, TXRB,
  CmParamReport, ppStrtch, ppRegion, ppSubRpt, uCtrlPadroes,
  uCtrlInvestCotas, uCtrlParamCotaInvest, uCMFileUtils, uCMMath, ppChrt,
  ppChrtDP;

type
  TRelEvolucaoPatr = class(TFrmCmReportInv)
    ppDBText1: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppRegion1: TppRegion;
    ppRegion2: TppRegion;
    ppRegion3: TppRegion;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    CMSqlParams1: TCMSqlParams;
    CdsPL: TCMClientDataSet;
    DsPL: TDataSource;
    pplPL: TppBDEPipeline;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBText3: TppDBText;
    CMSqlParams2: TCMSqlParams;
    CdsQtd: TCMClientDataSet;
    DsQtd: TDataSource;
    pplQtd: TppBDEPipeline;
    ppMasterFieldLink2: TppMasterFieldLink;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppDBTQtd: TppDBText;
    CMSqlParams3: TCMSqlParams;
    CdsCotas: TCMClientDataSet;
    DsCotas: TDataSource;
    pplCotas: TppBDEPipeline;
    ppMasterFieldLink4: TppMasterFieldLink;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppDBTCota: TppDBText;
    CPREvento: TCmParamReport;
    EOEvento: TExtraOptions;
    CRMEvento: TCmRptManager;
    pplEvento: TppBDEPipeline;
    sqlEvento: TCMSqlParams;
    cdsEvento: TCMClientDataSet;
    dsEvento: TDataSource;
    rptEvento: TppReport;
    ppHeaderBand2: TppHeaderBand;
    LblEmpEvento: TppLabel;
    LblNomRel: TppLabel;
    LblPerEvento: TppLabel;
    ppShape1: TppShape;
    ppDBImage1: TppDBImage;
    ppLabel8: TppLabel;
    ppLabel11: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppShape2: TppShape;
    ppDBText7: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    LblSisEvento: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable4: TppSystemVariable;
    cdsLTEvento: TCMClientDataSet;
    ppLTEvento: TppBDEPipeline;
    dsLTEvento: TDataSource;
    ppDBVlrCota: TppDBText;
    CdsAux: TCMClientDataSet;
    ppLabel7: TppLabel;
    CMSqlParams4: TCMSqlParams;
    CdsPLGraf: TCMClientDataSet;
    DsPLGraf: TDataSource;
    pplPLGraf: TppBDEPipeline;
    ppSummaryBand4: TppSummaryBand;
    ppDPTCGraf: TppDPTeeChart;
    ppShape3: TppShape;
    pplVarDia: TppLabel;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppGroup9: TppGroup;
    ppGroupHeaderBand9: TppGroupHeaderBand;
    ppGroupFooterBand9: TppGroupFooterBand;
    ppGroup10: TppGroup;
    ppGroupHeaderBand10: TppGroupHeaderBand;
    ppGroupFooterBand10: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppLabel5: TppLabel;
    procedure ppGroupHeaderBand1AfterPrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure ppDetailBand4AfterPrint(Sender: TObject);
    procedure rptReportStartPage(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure rptEventoStartPage(Sender: TObject);
    procedure ppDetailBand1AfterPrint(Sender: TObject);
    procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
  private
    { Private declarations }
    CtrlInvestCotas : TCtrlInvestCotas;
    CtrlParamCotaInvest : TCtrlParamCotaInvest;
    fCotaAnt : Double;
    iCount   : Integer;
  public
    { Public declarations }
  end;

var
  RelEvolucaoPatr: TRelEvolucaoPatr;

implementation

{$R *.DFM}

procedure TRelEvolucaoPatr.ppGroupHeaderBand1AfterPrint(Sender: TObject);
begin
  inherited;
   CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, Cds.FieldByName('IDCARTEIRAINVEST').AsInteger);
   ppDBTQtd.DisplayFormat := CtrlInvestCotas.MontaMascara(CdsAux.FieldByName('QTDDECQTD').AsInteger);
   ppDBTCota.DisplayFormat := CtrlInvestCotas.MontaMascara(CdsAux.FieldByName('QTDDECVLR').AsInteger);
end;

procedure TRelEvolucaoPatr.FormCreate(Sender: TObject);
begin
  inherited;
   CtrlInvestCotas  := TCtrlInvestCotas.Create;
   CtrlInvestCotas.InitializeAs(Padroes);

   CtrlParamCotaInvest := TCtrlParamCotaInvest.Create;
   CtrlParamCotaInvest.InitializeAs(Padroes);
end;

procedure TRelEvolucaoPatr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlParamCotaInvest);
   FreeAndNil(CtrlInvestCotas);
end;

procedure TRelEvolucaoPatr.ppDetailBand4BeforePrint(Sender: TObject);
begin
  inherited;
   if fCotaAnt = 0 then
      fCotaAnt := ppDBTCota.FieldValue;
   pplVarDia.Caption := FloatToStr(RoundCM((((ppDBTCota.FieldValue/fCotaAnt)-1)*100),4));
end;

procedure TRelEvolucaoPatr.ppDetailBand4AfterPrint(Sender: TObject);
begin
  inherited;
   fCotaAnt := ppDBTCota.FieldValue;
end;

procedure TRelEvolucaoPatr.rptReportStartPage(Sender: TObject);
begin
  inherited;
   fCotaAnt := 0;
   iCount   := 0;   
end;

procedure TRelEvolucaoPatr.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  inherited;
   if iCount > 1 then
   begin
      ppDPTCGraf.Visible := True;   
      CdsPLGraf.Filtered := False;   
      RelEvolucaoPatr.CdsPLGraf.Data := CdsPL.Data;
      CdsPLGraf.Filter := 'IDCARTEIRAINVEST = '+cds.FieldByName('IDCARTEIRAINVEST').AsString;
      CdsPLGraf.Filtered := True;
   end
   else
   begin
      CdsPLGraf.Close;
      ppDPTCGraf.Visible := False;
   end;   
end;

procedure TRelEvolucaoPatr.rptEventoStartPage(Sender: TObject);
begin
  inherited;
   CdsAux.Data := CtrlParamCotaInvest.ListParamCotaInvest(-1, cdsEvento.FieldByName('IDCARTEIRAINVEST').AsInteger);
   if cdsEvento.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -5 then
      ppDBVlrCota.DisplayFormat := CtrlInvestCotas.MontaMascara(CdsAux.FieldByName('QTDDECVLR').AsInteger)
   else if cdsEvento.FieldByName('IDEVENTOCAIXACOTA').AsInteger = -4 then
      ppDBVlrCota.DisplayFormat := CtrlInvestCotas.MontaMascara(CdsAux.FieldByName('QTDDECQTD').AsInteger)
   else
      ppDBVlrCota.DisplayFormat := CtrlInvestCotas.MontaMascara(2);
end;

procedure TRelEvolucaoPatr.ppDetailBand1AfterPrint(Sender: TObject);
begin
  inherited;
   iCount := iCount + 1;
end;

procedure TRelEvolucaoPatr.ppGroupFooterBand1AfterPrint(Sender: TObject);
begin
  inherited;
   iCount   := 0;
   fCotaAnt := 0;   
end;

end.
