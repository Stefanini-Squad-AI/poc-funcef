unit dRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppDB,
  ppCtrls, ppBands, ppPrnabl, ppClass, ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc,
  ppComm, ppCache, ppDBBDE, ppStrtch, ppMemo, ppVar, ppRelatv, ppDBPipe, raCodMod, ppModule,
  daDataModule;

type
  TdtmRelatorios = class(TdtmReports)
    rpProfis: TppReport;
    ProfisHdrBnd1: TppHeaderBand;
    ProfisLbl1: TppLabel;
    ProfisLbl2: TppLabel;
    ProfisLbl3: TppLabel;
    ProfisLbl4: TppLabel;
    ProfisLbl5: TppLabel;
    ProfisLine1: TppLine;
    ProfisDBTxt1: TppDBText;
    ProfisDtlBnd1: TppDetailBand;
    ProfisDBTxt2: TppDBText;
    ProfisDBTxt3: TppDBText;
    ProfisFootBnd1: TppFooterBand;
    ProfisSmryBnd1: TppSummaryBand;
    ProfisGrp1: TppGroup;
    ProfisGrpHdrBnd1: TppGroupHeaderBand;
    ProfisGrpFootBnd1: TppGroupFooterBand;
    ProfisLbl6: TppLabel;
    ProfisDBCalc1: TppDBCalc;
    ppProfis: TppBDEPipeline;
    dsProfis: TwwDataSource;
    qryProfis: TwwQuery;
    ProfisCalc1: TppSystemVariable;
    ProfisCalc2: TppSystemVariable;
    procedure qryCargosAfterScroll(DataSet: TDataSet);
    procedure CargosSmryBnd1AfterPrint(Sender: TObject);
    procedure qryCCustoAfterOpen(DataSet: TDataSet);
  public
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatorios: TdtmRelatorios;

implementation

uses fAguarde, fParamProfis;

{$R *.DFM}

function TdtmRelatorios.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (UPPERCASE(Form) = 'FRMPARAMPROFIS') then
    frm := TfrmParamProfis.Create(Application)
  else
  if (UPPERCASE(Form) = '') then
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

procedure TdtmRelatorios.qryCargosAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatorios.CargosSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TdtmRelatorios.qryCCustoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

end.
