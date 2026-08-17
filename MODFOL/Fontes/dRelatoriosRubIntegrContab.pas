unit dRelatoriosRubIntegrContab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE;

type
  TdtmRelatoriosRubIntegrContab = class(TdtmReports)
    rpRubIntegrContab: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppRubIntegrContab: TppBDEPipeline;
    dsRubIntegrContab: TwwDataSource;
    qryRubIntegrContab: TwwQuery;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppDBText7: TppDBText;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText11: TppDBText;
    procedure ppSummaryBand1AfterPrint(Sender: TObject);
    procedure qryRubIntegrContabAfterOpen(DataSet: TDataSet);
    procedure qryRubIntegrContabAfterScroll(DataSet: TDataSet);
  private
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosRubIntegrContab: TdtmRelatoriosRubIntegrContab;

implementation

uses fAguarde, fParamRubIntegrContab;

{$R *.DFM}

function TdtmRelatoriosRubIntegrContab.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  Result := true;

  if (AnsiUpperCase(Form) = 'FRMPARAMRUBINTEGRCONTAB') then
    frm := TfrmParamRubIntegrContab.Create(Application)
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
    Result := (frm.ShowModal = mrOk);
    frm.free;
  end;
end;

procedure TdtmRelatoriosRubIntegrContab.qryRubIntegrContabAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosRubIntegrContab.qryRubIntegrContabAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosRubIntegrContab.ppSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
