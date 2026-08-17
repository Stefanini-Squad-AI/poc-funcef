unit RFichaSalFam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo;

type
  TRptFichaSalFam = class(TdtmReports)
    rpFichaSalFam: TppReport;
    rpFichaSalFamHdrBnd: TppHeaderBand;
    rpFichaSalFamLbl1: TppLabel;
    rpFichaSalFamDBTxt1: TppDBText;
    rpFichaSalFamDBTxt2: TppDBText;
    rpFichaSalFamDBTxt3: TppDBText;
    rpFichaSalFamDtlBnd: TppDetailBand;
    rpFichaSalFamFootBnd: TppFooterBand;
    rpFichaSalFamSmryBnd: TppSummaryBand;
    rpFichaSalFamGroupEMPREGADO: TppGroup;
    rpFichaSalFamGrpHdrBnd: TppGroupHeaderBand;
    rpFichaSalFamLabel4: TppLabel;
    rpFichaSalFamDBTxt4: TppDBText;
    rpFichaSalFamGrpFootBnd: TppGroupFooterBand;
    ppFichaSalFam: TppBDEPipeline;
    dsFichaSalFam: TwwDataSource;
    qryFichaSalFam: TwwQuery;
    rpFichaSalFamLbl5: TppLabel;
    rpFichaSalFamDBTxtCTPS: TppDBText;
    rpFichaSalFamDBTxt5: TppDBText;
    rpFichaSalFamLbl6: TppLabel;
    rpFichaSalFamLbl7: TppLabel;
    rpFichaSalFamDBTxt6: TppDBText;
    rpFichaSalFamLbl9: TppLabel;
    rpFichaSalFamLine3: TppLine;
    rpFichaSalFamLbl10: TppLabel;
    rpFichaSalFamShape1: TppShape;
    rpFichaSalFamMemo1: TppMemo;
    rpFichaSalFamShape2: TppShape;
    rpFichaSalFamMemo2: TppMemo;
    rpFichaSalFamShape3: TppShape;
    rpFichaSalFamMemo3: TppMemo;
    rpFichaSalFamShape4: TppShape;
    rpFichaSalFamMemo4: TppMemo;
    rpFichaSalFamShape5: TppShape;
    rpFichaSalFamMemo5: TppMemo;
    rpFichaSalFamLbl8: TppLabel;
    rpFichaSalFamDBTxt7: TppDBText;
    rpFichaSalFamShape6: TppShape;
    rpFichaSalFamMemo6: TppMemo;
    rpFichaSalFamShape7: TppShape;
    rpFichaSalFamMemo7: TppMemo;
    rpFichaSalFamShape10: TppShape;
    rpFichaSalFamMemo10: TppMemo;
    rpFichaSalFamShape8: TppShape;
    rpFichaSalFamMemo8: TppMemo;
    rpFichaSalFamShape9: TppShape;
    rpFichaSalFamMemo9: TppMemo;
    rpFichaSalFamShape11: TppShape;
    rpFichaSalFamMemo11: TppMemo;
    rpFichaSalFamLine1: TppLine;
    rpFichaSalFamLine2: TppLine;
    rpFichaSalFamShape12: TppShape;
    rpFichaSalFamShape13: TppShape;
    rpFichaSalFamShape14: TppShape;
    rpFichaSalFamShape15: TppShape;
    rpFichaSalFamShape16: TppShape;
    rpFichaSalFamShape17: TppShape;
    rpFichaSalFamShape18: TppShape;
    rpFichaSalFamShape19: TppShape;
    rpFichaSalFamShape20: TppShape;
    rpFichaSalFamShape21: TppShape;
    rpFichaSalFamShape22: TppShape;
    rpFichaSalFamDBCalc1: TppDBCalc;
    rpFichaSalFamDBTxt8: TppDBText;
    rpFichaSalFamDBTxt9: TppDBText;
    rpFichaSalFamDBTxt10: TppDBText;
    rpFichaSalFamDBTxt11: TppDBText;
    rpFichaSalFamDBTxt12: TppDBText;
    rpFichaSalFamDBTxt13: TppDBText;
    rpFichaSalFamDBTxt14: TppDBText;
    rpFichaSalFamDBTxt15: TppDBText;
    procedure qryFichaSalFamAfterOpen(DataSet: TDataSet);
    procedure qryFichaSalFamAfterScroll(DataSet: TDataSet);
    procedure rpFichaSalFamSmryBndAfterPrint(Sender: TObject);
  public
    function  MostraParam(Form: string): boolean; override;
  end;

var
  RptFichaSalFam: TRptFichaSalFam;

implementation

uses fAguarde, fParamFichaSalFam;

{$R *.DFM}

function TRptFichaSalFam.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMFICHASALFAM') then
    frm := TfrmParamFichaSalFam.Create(Application)
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

procedure TRptFichaSalFam.qryFichaSalFamAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptFichaSalFam.qryFichaSalFamAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFichaSalFam.rpFichaSalFamSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
