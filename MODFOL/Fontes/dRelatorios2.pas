unit dRelatorios2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppSubRpt,
  Provider, uCMClientDataset, DBClient;

type
  TdtmRelatorios2 = class(TdtmReports)
    ppGerencial2: TppBDEPipeline;
    dsGerencial2: TwwDataSource;
    qryGerencial2: TwwQuery;
    ppGerencial3: TppBDEPipeline;
    dsGerencial3: TwwDataSource;
    qryGerencial3: TwwQuery;
    ppGerencial4: TppBDEPipeline;
    dsGerencial4: TwwDataSource;
    qryGerencial4: TwwQuery;
    ppGerencial5: TppBDEPipeline;
    dsGerencial5: TwwDataSource;
    qryGerencial5: TwwQuery;
    ppGerencial6A: TppBDEPipeline;
    dsGerencial6A: TwwDataSource;
    qryGerencial6A: TwwQuery;
    ppGerencial6B: TppBDEPipeline;
    dsGerencial6B: TwwDataSource;
    qryGerencial6B: TwwQuery;
    ppGerencial7: TppBDEPipeline;
    dsGerencial7: TwwDataSource;
    qryGerencial7: TwwQuery;
    ppGerencial1: TppBDEPipeline;
    dsGerencial1: TwwDataSource;
    rpReciboTerceiros: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppReciboTerceiros: TppBDEPipeline;
    dsReciboTerceiros: TwwDataSource;
    qryReciboTerceiros: TwwQuery;
    updSQL: TUpdateSQL;
    rpGerencial: TppReport;
    ppDetailBand13: TppDetailBand;
    rpGerencialFootBnd: TppFooterBand;
    ppGerencial: TppBDEPipeline;
    dsGerencial: TwwDataSource;
    qryGerencial: TwwQuery;
    ppGroup11: TppGroup;
    ppGroupHeaderBand11: TppGroupHeaderBand;
    ppGroupFooterBand11: TppGroupFooterBand;
    ReciboTerceirosrpShape3: TppShape;
    ReciboTerceirosrpLabel1: TppLabel;
    ReciboTerceirosrpLabel2: TppLabel;
    ReciboTerceirosrpShape8: TppShape;
    ReciboTerceirosrpLabel11: TppLabel;
    ReciboTerceirosrpLabel16: TppLabel;
    ReciboTerceirosrpDBText6: TppDBText;
    ReciboTerceirosrpDBText2: TppDBText;
    ReciboTerceirosrpDBText11: TppDBText;
    ReciboTerceirosrpDBText12: TppDBText;
    ReciboTerceirosrpDBText13: TppDBText;
    ReciboTerceirosrpDBText14: TppDBText;
    ReciboTerceirosrpDBText1: TppDBText;
    rpReciboTerceirosLine1: TppLine;
    ReciboTerceirosrpLabel3: TppLabel;
    rpReciboTerceirosLabel4: TppLabel;
    rpReciboTerceirosDBText1: TppDBText;
    ReciboTerceirosrpDESCRICAO: TppDBText;
    ReciboTerceirosrpDBText8: TppDBText;
    ReciboTerceirosrpShape13: TppShape;
    ReciboTerceirosrpLabel5: TppLabel;
    ReciboTerceirosrpVlrAdiantamento: TppLabel;
    ReciboTerceirosrpLabel14: TppLabel;
    ReciboTerceirosrpLabel13: TppLabel;
    ReciboTerceirosrpLine2: TppLine;
    rpReciboTerceirosDBCalc1: TppDBCalc;
    rpReciboTerceirosLabel1: TppLabel;
    rpReciboTerceirosNOME_BANCO: TppDBText;
    rpReciboTerceirosAGENCIA: TppDBText;
    rpReciboTerceirosDBText3: TppDBText;
    rpFolhaPontoShape3: TppShape;
    rpReciboTerceirosLabel2: TppLabel;
    rpReciboTerceirosLine2: TppLine;
    rpReciboTerceirosLabel3: TppLabel;
    ppGroup16: TppGroup;
    rpGerencialGrpHdrBnd: TppGroupHeaderBand;
    rpGerencialGrpFootBnd: TppGroupFooterBand;
    rpGerencialLabel8: TppLabel;
    rpGerencialLblMES: TppLabel;
    rpGerencialMemo1: TppMemo;
    rpGerencialLabelSETOR: TppLabel;
    rpGerencialSubReport1: TppSubReport;
    rpGerencialChildReport1: TppChildReport;
    rpGerencialChildReport1HeaderBand1: TppHeaderBand;
    rpGerencialChildReport11Label1: TppLabel;
    rpGerencialChildReport11Label2: TppLabel;
    rpGerencialChildReport11Label3: TppLabel;
    rpGerencialChildReport11DBText1: TppDBText;
    rpGerencialChildReport11DBText2: TppDBText;
    rpGerencialChildReport11DBText3: TppDBText;
    rpGerencialChildReport11DBText4: TppDBText;
    rpGerencialChildReport11Label4: TppLabel;
    rpGerencialChildReport1Line2: TppLine;
    rpGerencialChildReport1Label8: TppLabel;
    rpGerencialChildReport1DBText8: TppDBText;
    rpGerencialChildReport1LabelRef: TppLabel;
    rpGerencialChildReport1DetailBand1: TppDetailBand;
    rpGerencialChildReport1RUBRICA: TppDBText;
    rpGerencialChildReport1VALOR: TppDBText;
    rpGerencialChildReport1CODRUBRICA: TppDBText;
    rpGerencialChildReport1FooterBand1: TppFooterBand;
    rpGerencialChildReport7Group1: TppGroup;
    rpGerencialChildReport1GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencialChildReport1Label6: TppLabel;
    rpGerencialChildReport1DBText6: TppDBText;
    rpGerencialChildReport1LabelCODIGO: TppLabel;
    rpGerencialChildReport1LabelRUBRICA: TppLabel;
    rpGerencialChildReport1Line1: TppLine;
    rpGerencialChildReport1LabelVALOR: TppLabel;
    rpGerencialChildReport1GroupFooterBand1: TppGroupFooterBand;
    rpGerencialChildReport1LabelT1: TppLabel;
    rpGerencialChildReport1LabelT2: TppLabel;
    rpGerencialChildReport1Line4: TppLine;
    rpGerencialChildReport1LabelT3: TppLabel;
    rpGerencialChildReport1TOTPROV: TppLabel;
    rpGerencialChildReport1LabelTOTDESC: TppLabel;
    rpGerencialChildReport1LabelTOTLIQ: TppLabel;
    rpGerencialChildReport1Label9: TppLabel;
    rpGerencialChildReport1LabelTOT_PERCENT: TppLabel;
    rpGerencialChildReport7Group2: TppGroup;
    rpGerencialChildReport1GroupHeaderBand2: TppGroupHeaderBand;
    rpGerencialChildReport1PROVDESC: TppDBText;
    rpGerencialChildReport1GroupFooterBand2: TppGroupFooterBand;
    rpGerencialChildReport1Line3: TppLine;
    rpGerencialChildReport1DBCalc1: TppDBCalc;
    rpGerencialChildReport1DBText4: TppDBText;
    rpGerencialSubReport2: TppSubReport;
    rpGerencialChildReport2: TppChildReport;
    rpGerencialChildReport5HeaderBand1: TppHeaderBand;
    rpGerencialChildReport5Label1: TppLabel;
    rpGerencialChildReport5Label2: TppLabel;
    rpGerencialChildReport5Label3: TppLabel;
    rpGerencialChildReport5Label10: TppLabel;
    rpGerencialChildReport2DBText4: TppDBText;
    rpGerencialChildReport2DBText5: TppDBText;
    rpGerencialChildReport2DBText6: TppDBText;
    rpGerencialChildReport2DBText7: TppDBText;
    rpGerencialChildReport2LabelRef: TppLabel;
    rpGerencialChildReport5DetailBand1: TppDetailBand;
    rpGerencialChildReport5DBText6: TppDBText;
    rpGerencialChildReport5DBText7: TppDBText;
    rpGerencialChildReport5FooterBand1: TppFooterBand;
    rpGerencialChildReport5SummaryBand1: TppSummaryBand;
    rpGerencialChildReport5Line4: TppLine;
    rpGerencialChildReport5Label9: TppLabel;
    rpGerencialChildReport5DBCalc2: TppDBCalc;
    rpGerencialChildReport5Group1: TppGroup;
    rpGerencialChildReport5GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencialChildReport5Label5: TppLabel;
    rpGerencialChildReport5Line1: TppLine;
    rpGerencialChildReport5Label6: TppLabel;
    rpGerencialChildReport5Label7: TppLabel;
    rpGerencialChildReport5DBText5: TppDBText;
    rpGerencialChildReport5Line2: TppLine;
    rpGerencialChildReport5GroupFooterBand1: TppGroupFooterBand;
    rpGerencialChildReport5Line3: TppLine;
    rpGerencialChildReport5Label8: TppLabel;
    rpGerencialChildReport5DBCalc1: TppDBCalc;
    rpGerencialSubReport3: TppSubReport;
    rpGerencialChildReport3: TppChildReport;
    rpGerencialChildReport4HeaderBand1: TppHeaderBand;
    rpGerencialChildReport4Label3: TppLabel;
    rpGerencialChildReport4Label4: TppLabel;
    rpGerencialChildReport4Label5: TppLabel;
    rpGerencialChildReport4Label9: TppLabel;
    rpGerencialChildReport3DBText12: TppDBText;
    rpGerencialChildReport3DBText13: TppDBText;
    rpGerencialChildReport3DBText14: TppDBText;
    rpGerencialChildReport3DBText15: TppDBText;
    rpGerencialChildReport3LabelRef: TppLabel;
    rpGerencialChildReport4DetailBand1: TppDetailBand;
    rpGerencialChildReport4DBText5: TppDBText;
    rpGerencialChildReport4DBText7: TppDBText;
    rpGerencialChildReport4FooterBand1: TppFooterBand;
    rpGerencialChildReport4SummaryBand1: TppSummaryBand;
    rpGerencialChildReport4Line4: TppLine;
    rpGerencialChildReport4Label8: TppLabel;
    rpGerencialChildReport4DBCalcSubTotal: TppDBCalc;
    rpGerencialChildReport3Label6: TppLabel;
    rpGerencialChildReport3LabelQuantTotLicenca: TppLabel;
    rpGerencialChildReport3Label14: TppLabel;
    rpGerencialChildReport3LabelTOTAL: TppLabel;
    rpGerencialChildReport4Group1: TppGroup;
    rpGerencialChildReport4GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencialChildReport4Label2: TppLabel;
    rpGerencialChildReport4Line1: TppLine;
    rpGerencialChildReport4Label7: TppLabel;
    rpResFolLabelCENTROCUSTO: TppLabel;
    rpResFolDBTextNOMECENTROCUSTO: TppDBText;
    rpGerencialChildReport4Line2: TppLine;
    rpGerencialChildReport4GroupFooterBand1: TppGroupFooterBand;
    rpGerencialChildReport4Line3: TppLine;
    rpGerencialChildReport4Label1: TppLabel;
    rpGerencialChildReport4DBCalc1: TppDBCalc;
    rpGerencialChildReport3Label13: TppLabel;
    rpGerencialChildReport3DBText1: TppDBText;
    rpGerencialSubReport4: TppSubReport;
    rpGerencialChildReport4: TppChildReport;
    rpGerencialChildReport2HeaderBand1: TppHeaderBand;
    rpGerencialChildReport2Label5: TppLabel;
    rpGerencialChildReport2Label6: TppLabel;
    rpGerencialChildReport2Line2: TppLine;
    rpGerencialChildReport2Label1: TppLabel;
    rpGerencialChildReport2Label2: TppLabel;
    rpGerencialChildReport2Label3: TppLabel;
    rpGerencialChildReport2Label8: TppLabel;
    rpGerencialChildReport4DBText1: TppDBText;
    rpGerencialChildReport4DBText2: TppDBText;
    rpGerencialChildReport4DBText3: TppDBText;
    rpGerencialChildReport4DBText4: TppDBText;
    rpGerencialChildReport4LabelRef: TppLabel;
    rpGerencialChildReport2DetailBand1: TppDetailBand;
    rpGerencialChildReport2DBText1: TppDBText;
    rpGerencialChildReport2DBText2: TppDBText;
    rpGerencialChildReport2FooterBand1: TppFooterBand;
    rpGerencialChildReport2SummaryBand1: TppSummaryBand;
    rpGerencialChildReport2Line1: TppLine;
    rpGerencialChildReport2Label7: TppLabel;
    rpGerencialChildReport2DBCalc1: TppDBCalc;
    rpGerencialSubReport5: TppSubReport;
    rpGerencialChildReport5: TppChildReport;
    rpGerencialChildReport6HeaderBand1: TppHeaderBand;
    rpGerencialChildReport6Label1: TppLabel;
    rpGerencialChildReport6Label2: TppLabel;
    rpGerencialChildReport6Label3: TppLabel;
    rpGerencialChildReport6Label4: TppLabel;
    rpGerencialChildReport5DBText1: TppDBText;
    rpGerencialChildReport5DBText2: TppDBText;
    rpGerencialChildReport5DBText3: TppDBText;
    rpGerencialChildReport5DBText4: TppDBText;
    rpGerencialChildReport5LabelRef: TppLabel;
    rpGerencialChildReport6DetailBand1: TppDetailBand;
    rpGerencialChildReport6DBText7: TppDBText;
    rpGerencialChildReport6DBText8: TppDBText;
    rpGerencialChildReport6DBText9: TppDBText;
    rpGerencialChildReport6FooterBand1: TppFooterBand;
    rpGerencialChildReport6SummaryBand1: TppSummaryBand;
    rpGerencialChildReport6Line3: TppLine;
    rpGerencialChildReport6Label9: TppLabel;
    rpGerencialChildReport6DBCalc1: TppDBCalc;
    rpGerencialChildReport6DBCalc4: TppDBCalc;
    rpGerencialChildReport6Group1: TppGroup;
    rpGerencialChildReport6GroupHeaderBand1: TppGroupHeaderBand;
    rpGerencialChildReport6Label6: TppLabel;
    rpGerencialChildReport6Line1: TppLine;
    rpGerencialChildReport6Label7: TppLabel;
    rpGerencialChildReport6Label8: TppLabel;
    rpGerencialChildReport6DBText6: TppDBText;
    rpGerencialChildReport6Line2: TppLine;
    rpGerencialChildReport6Label11: TppLabel;
    rpGerencialChildReport6GroupFooterBand1: TppGroupFooterBand;
    rpGerencialChildReport6Line4: TppLine;
    rpGerencialChildReport6Label10: TppLabel;
    rpGerencialChildReport6DBCalc2: TppDBCalc;
    rpGerencialChildReport6DBCalc3: TppDBCalc;
    rpGerencialSubReport6: TppSubReport;
    rpGerencialChildReport6: TppChildReport;
    rpGerencialChildReport3HeaderBand1: TppHeaderBand;
    rpGerencialChildReport3Label3: TppLabel;
    rpGerencialChildReport3Label4: TppLabel;
    rpGerencialChildReport3Label5: TppLabel;
    rpGerencialChildReport3Label1: TppLabel;
    rpGerencialChildReport3Label2: TppLabel;
    rpGerencialChildReport3Label7: TppLabel;
    rpGerencialChildReport3Line1: TppLine;
    rpGerencialChildReport3Label12: TppLabel;
    rpGerencialChildReport6DBText1: TppDBText;
    rpGerencialChildReport6DBText2: TppDBText;
    rpGerencialChildReport6DBText3: TppDBText;
    rpGerencialChildReport6DBText4: TppDBText;
    rpGerencialChildReport6LabelRef: TppLabel;
    rpGerencialChildReport3DetailBand1: TppDetailBand;
    rpGerencialChildReport3DBText5: TppDBText;
    rpGerencialChildReport3DBText6: TppDBText;
    rpGerencialChildReport3DBText7: TppDBText;
    rpGerencialChildReport3FooterBand1: TppFooterBand;
    rpGerencialChildReport3SummaryBand1: TppSummaryBand;
    rpGerencialChildReport3Label8: TppLabel;
    rpGerencialChildReport3Label9: TppLabel;
    rpGerencialChildReport3Label10: TppLabel;
    rpGerencialChildReport3Line2: TppLine;
    rpGerencialChildReport3Label11: TppLabel;
    rpGerencialChildReport3DBText8: TppDBText;
    rpGerencialChildReport3DBText9: TppDBText;
    rpGerencialChildReport3DBText10: TppDBText;
    rpGerencialChildReport6DBCalc5: TppDBCalc;
    rpGerencialChildReport6DBCalc6: TppDBCalc;
    rpGerencialSubReport7: TppSubReport;
    rpGerencialChildReport7: TppChildReport;
    rpGerencialHeaderBand1: TppHeaderBand;
    rpGerencialLabel1: TppLabel;
    rpGerencialLabel2: TppLabel;
    rpGerencialLine1: TppLine;
    rpGerencialLabel3: TppLabel;
    rpGerencialLabel4: TppLabel;
    rpGerencialLabel5: TppLabel;
    rpGerencialChildReport1Label1: TppLabel;
    rpGerencialChildReport1Label2: TppLabel;
    rpGerencialChildReport1Label3: TppLabel;
    rpGerencialChildReport7DBText1: TppDBText;
    rpGerencialChildReport7DBText2: TppDBText;
    rpGerencialChildReport7DBText3: TppDBText;
    rpGerencialChildReport7DBText4: TppDBText;
    rpGerencialChildReport7LabelRef: TppLabel;
    rpGerencialDetailBand1: TppDetailBand;
    rpGerencialDBText5: TppDBText;
    rpGerencialDBText6: TppDBText;
    rpGerencialChildReport1DBText1: TppDBText;
    rpGerencialChildReport1DBText2: TppDBText;
    rpGerencialChildReport1DBText3: TppDBText;
    rpGerencialFooterBand1: TppFooterBand;
    rpGerencialSummaryBand1: TppSummaryBand;
    rpGerencialLine2: TppLine;
    rpGerencialLabel7: TppLabel;
    rpGerencialDBCalc1: TppDBCalc;
    rpGerencialCalc2: TppSystemVariable;
    rpGerencialChildReport7Calc1: TppSystemVariable;
    rpGerencialChildReport3Calc2: TppSystemVariable;
    rpGerencialChildReport6Calc1: TppSystemVariable;
    rpGerencialChildReport6Calc2: TppSystemVariable;
    rpGerencialChildReport5Calc1: TppSystemVariable;
    rpGerencialChildReport2Calc2: TppSystemVariable;
    rpGerencialChildReport4Calc1: TppSystemVariable;
    rpGerencialChildReport4Calc2: TppSystemVariable;
    rpGerencialChildReport3Calc1: TppSystemVariable;
    rpGerencialChildReport5Calc2: TppSystemVariable;
    rpGerencialChildReport2Calc1: TppSystemVariable;
    rpGerencialChildReport1Calc2: TppSystemVariable;
    rpGerencialChildReport1Calc1: TppSystemVariable;
    cdsGerencial1: TCMClientDataSet;
    dspGerencial1: TDataSetProvider;
    qryGerencial1: TwwQuery;
    procedure qryAlfabMensalAfterOpen(DataSet: TDataSet);
    procedure qryAlfabMensalAfterScroll(DataSet: TDataSet);
    procedure rpAlfabMensalSmryBndAfterPrint(Sender: TObject);
    procedure ReciboTerceirosrpVlrAdiantamentoPrint(Sender: TObject);
    procedure ReciboTerceirosrpLabel1Print(Sender: TObject);
    procedure rpReciboTerceirosNOME_BANCOPrint(Sender: TObject);
    procedure rpReciboTerceirosAGENCIAPrint(Sender: TObject);
    procedure qryGerencialAfterScroll(DataSet: TDataSet);
    procedure rpGerencialChildReport1GroupFooterBand2AfterPrint(Sender: TObject);
    procedure rpGerencialChildReport1GroupFooterBand1BeforePrint(Sender: TObject);
    procedure rpGerencialChildReport4GroupFooterBand1AfterPrint(Sender: TObject);
    procedure rpGerencialChildReport4SummaryBand1BeforePrint(Sender: TObject);
    procedure rpGerencialSubReport1Print(Sender: TObject);
    procedure rpGerencialSubReport4Print(Sender: TObject);
    procedure rpGerencialChildReport1CODRUBRICAPrint(Sender: TObject);
  public
    bPrimeiraVez, bImprimindo: boolean;
    rProvento, rDesconto, rOutros: real;
    iQuantTotLicenca, iQuantAtivos: integer;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatorios2: TdtmRelatorios2;

implementation

uses fAguarde, uFuncoesUteisRH, uExtenso, fParamReciboTerceiros, fParamGerencial;

{$R *.DFM}

function TdtmRelatorios2.MostraParam(Form: string): boolean;
var
  Frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMPARAMRECIBOTERCEIROS') then
    Frm := TfrmParamReciboTerceiros.Create(Application)
  else
  if (UPPERCASE(Form) = 'FRMPARAMGERENCIAL') then
    Frm := TfrmParamGerencial.Create(Application)
  else
  if (UPPERCASE(Form) = '') then
  begin
    Result := True;
    exit;
  end
  else
    Frm := nil;

  if (Frm = nil) then
    Result := false
  else
  begin
    with (Frm) do
    begin
      Result := (ShowModal = mrOk);
      Free;
    end;
  end;
end;

// *************************************************************************************
// *************************************************************************************
// Relação de Empregados Alfabética Mensal
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatorios2.qryAlfabMensalAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatorios2.qryAlfabMensalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatorios2.rpAlfabMensalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// *************************************************************************************
// *************************************************************************************
// Recibo de Pagamento a Terceiros
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatorios2.ReciboTerceirosrpVlrAdiantamentoPrint(Sender: TObject);
begin
  ReciboTerceirosrpVlrAdiantamento.Caption := '(' +
    Extenso.PorExtensoII(rpReciboTerceirosDBCalc1.Value)+')';
end;

procedure TdtmRelatorios2.ReciboTerceirosrpLabel1Print(Sender: TObject);
begin
  rpReciboTerceirosLabel1.Visible := (not qryReciboTerceiros.FieldByName('CONTACORRENTE').isNull) and
    (Trim(qryReciboTerceiros.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TdtmRelatorios2.rpReciboTerceirosNOME_BANCOPrint(Sender: TObject);
begin
  rpReciboTerceirosNOME_BANCO.Visible := (not qryReciboTerceiros.FieldByName('CONTACORRENTE').isNull) and
    (Trim(qryReciboTerceiros.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

procedure TdtmRelatorios2.rpReciboTerceirosAGENCIAPrint(Sender: TObject);
begin
  rpReciboTerceirosAGENCIA.Visible := (not qryReciboTerceiros.FieldByName('CONTACORRENTE').isNull) and
    (Trim(qryReciboTerceiros.FieldByName('CONTACORRENTE').asString) <> 'Conta:');
end;

// *************************************************************************************
// *************************************************************************************
// Relatório Gerencial
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatorios2.qryGerencialAfterScroll(DataSet: TDataSet);
begin
  if (bImprimindo) then
  begin
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;
end;

procedure TdtmRelatorios2.rpGerencialSubReport1Print(Sender: TObject);
begin
  bPrimeiraVez := true;
  rProvento := 0;
  rDesconto := 0;
  rOutros := 0;
end;

procedure TdtmRelatorios2.rpGerencialChildReport1CODRUBRICAPrint(Sender: TObject);
begin
  rpGerencialChildReport1CODRUBRICA.Visible :=
    (cdsGerencial1.FieldByName('CODRUBRICA').asString <> #255#255);
end;

procedure TdtmRelatorios2.rpGerencialChildReport1GroupFooterBand2AfterPrint(Sender: TObject);
begin
  if (cdsGerencial1.FieldByName('PROVENTODESCONTO').asString = 'DESPESAS') then
    rProvento := rpGerencialChildReport1DBCalc1.Value
  else
  if (cdsGerencial1.FieldByName('PROVENTODESCONTO').asString = 'ABATIMENTOS') then
    rDesconto := rpGerencialChildReport1DBCalc1.Value
  else
  if (cdsGerencial1.FieldByName('PROVENTODESCONTO').asString = 'ENCARGOS') then
    rOutros := rpGerencialChildReport1DBCalc1.Value;
end;

procedure TdtmRelatorios2.rpGerencialChildReport1GroupFooterBand1BeforePrint(Sender: TObject);
begin
  rpGerencialChildReport1TOTPROV.Caption      := ValStr(rProvento+rOutros,12,2,true,',');
  rpGerencialChildReport1LabelTOTDESC.Caption := ValStr(rDesconto,12,2,true,',');
  rpGerencialChildReport1LabelTOTLIQ.Caption  := ValStr(rProvento+rOutros-rDesconto,12,2,true,',');

  if (cdsGerencial1.FieldByName('TOT_FOLHA').asFloat > 0) then
    rpGerencialChildReport1LabelTOT_PERCENT.Caption := ValStr(((rProvento+rOutros-rDesconto)
      * 100)/cdsGerencial1.FieldByName('TOT_FOLHA').asFloat,12,2,true,',')+'%'
  else
    rpGerencialChildReport1LabelTOT_PERCENT.Caption := '0 %';

  rProvento:=0; rDesconto:=0; rOutros:=0;
end;

procedure TdtmRelatorios2.rpGerencialSubReport4Print(Sender: TObject);
begin
  iQuantTotLicenca := 0;
  iQuantAtivos := 0;
end;

procedure TdtmRelatorios2.rpGerencialChildReport4GroupFooterBand1AfterPrint(Sender: TObject);
begin
  if (bPrimeiraVez) then
  begin
    iQuantTotLicenca := iQuantTotLicenca + qryGerencial3.FieldByName('LICENCA').asInteger;
    iQuantAtivos := iQuantAtivos + StrToInt(rpGerencialChildReport4DBCalc1.Text);
  end;
end;

procedure TdtmRelatorios2.rpGerencialChildReport4SummaryBand1BeforePrint(Sender: TObject);
begin
  bPrimeiraVez := false;
  rpGerencialChildReport3LabelQuantTotLicenca.Caption := IntToStr(iQuantTotLicenca);
  rpGerencialChildReport3LabelTOTAL.Caption := IntToStr(iQuantAtivos + iQuantTotLicenca);
end;

end.
