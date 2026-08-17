unit dRelatoriosAsm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelatoriosAsm = class(TdtmReports)
    rpTabCID: TppReport;
    rpTabCIDHdrBnd: TppHeaderBand;
    rpTabCIDDtlBnd: TppDetailBand;
    ppTabCID: TppBDEPipeline;
    dsTabCID: TwwDataSource;
    qryTabCID: TwwQuery;
    rpTabCIDSmryBnd: TppSummaryBand;
    rpTabCIDLbl1: TppLabel;
    rpTabCIDLbl2: TppLabel;
    rpTabCIDLbl3: TppLabel;
    rpTabCIDDBTxt1: TppDBText;
    rpTabCIDCalc1: TppSystemVariable;
    rpTabCIDCalc2: TppSystemVariable;
    rpTabCIDLine1: TppLine;
    rpTabCIDLbl4: TppLabel;
    rpTabCIDLbl5: TppLabel;
    rpTabCIDDBTxt2: TppDBText;
    rpTabCIDDBTxt3: TppDBText;
    rpTabCIDGrp: TppGroup;
    rpTabCIDGrpHdrBnd: TppGroupHeaderBand;
    rpTabCIDGrpFootBnd: TppGroupFooterBand;
    rpTabCIDLbl6: TppLabel;
    rpTabCIDDBCalc1: TppDBCalc;
    rpOcorrExames: TppReport;
    rpOcorrExamesHdrBnd: TppHeaderBand;
    rpOcorrExamesLbl1: TppLabel;
    rpOcorrExamesLbl2: TppLabel;
    rpOcorrExamesLbl3: TppLabel;
    rpOcorrExamesDBTxt1: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    rpOcorrExamesLbl4: TppLabel;
    rpOcorrExamesLbl5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    rpOcorrExamesGroup: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    rpOcorrExamesGrpFootBnd: TppGroupFooterBand;
    rpOcorrExamesLbl7: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppOcorrExames: TppBDEPipeline;
    dsOcorrExames: TwwDataSource;
    qryOcorrExames: TwwQuery;
    rpOcorrExamesLbl6: TppLabel;
    ppDBText4: TppDBText;
    rpTabPer: TppReport;
    rpTabPerHdrBnd: TppHeaderBand;
    rpTabPerLbl1: TppLabel;
    rpTabPerLbl2: TppLabel;
    rpTabPerLbl3: TppLabel;
    rpTabPerDBTxt1: TppDBText;
    rpTabPerCalc1: TppSystemVariable;
    rpTabPerCalc2: TppSystemVariable;
    rpTabPerLine: TppLine;
    rpTabPerLbl4: TppLabel;
    rpTabPerLbl5: TppLabel;
    rpTabPerLbl6: TppLabel;
    rpTabPerDtlBnd: TppDetailBand;
    rpTabPerDBTxt2: TppDBText;
    rpTabPerDBTxt3: TppDBText;
    rpTabPerDBTxt4: TppDBText;
    rpTabPerSmryBnd: TppSummaryBand;
    rpTabPerGroup: TppGroup;
    rpTabPerGrpHdrBnd: TppGroupHeaderBand;
    rpTabPerGrpFootBnd: TppGroupFooterBand;
    rpTabPerLbl13: TppLabel;
    rpTabPerDBCalc: TppDBCalc;
    ppTabPer: TppBDEPipeline;
    dsTabPer: TwwDataSource;
    qryTabPer: TwwQuery;
    rpTabPerLbl7: TppLabel;
    rpTabPerLbl8: TppLabel;
    rpTabPerLbl9: TppLabel;
    rpTabPerLbl10: TppLabel;
    rpTabPerLbl11: TppLabel;
    rpTabPerLbl12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    procedure qryTabCIDBeforeOpen(DataSet: TDataSet);
    procedure qryTabCIDAfterOpen(DataSet: TDataSet);
    procedure qryTabCIDAfterScroll(DataSet: TDataSet);
    procedure rpTabCIDSmryBndAfterPrint(Sender: TObject);
    procedure qryOcorrExamesBeforeOpen(DataSet: TDataSet);
    procedure qryTabPerBeforeOpen(DataSet: TDataSet);
  public
    bRelatAnalitico, bMostraForm: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosAsm: TdtmRelatoriosAsm;

implementation

uses fTelaAut, fAguarde, fParamTabCID, fParamOcorrExames, fParamTabPer;

{$R *.DFM}

function TdtmRelatoriosAsm.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  Result      := true;
  bMostraForm := true;

  if (UpperCase(Form) = 'FRMPARAMTABCID') then
    frm := TfrmParamTabCID.Create(Application)
  else
  if (UpperCase(Form) = 'FRMPARAMOCORREXAMES') then
    frm := TfrmParamOcorrExames.Create(Application)
  else
  if (UpperCase(Form) = 'FRMPARAMTABPER') then
    frm := TfrmParamTabPer.Create(Application)
  else
  if (UpperCase(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  if (bMostraForm) then
  begin
    Result := (frm.ShowModal = mrOk);
    frm.free;
  end;
end;

// *************************************************************************************
// *************************************************************************************
// Tabela CID
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAsm.qryTabCIDBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Tabela CID');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosAsm.qryTabCIDAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosAsm.qryTabCIDAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosAsm.rpTabCIDSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

// *************************************************************************************
// *************************************************************************************
// Tabela de Ocorrências e Exames
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAsm.qryOcorrExamesBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Ocorrências e Exames');
  frmAguarde.Pos := 0;
end;

// *************************************************************************************
// *************************************************************************************
// Tabela de Periodicidades
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAsm.qryTabPerBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra ('Periodicidades dos Exames');
  frmAguarde.Pos := 0;
end;

end.
