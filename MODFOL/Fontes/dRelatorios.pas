unit dRelatorios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppRichTx, ppStrtch, ppMemo, ppSubRpt,
  DBClient, Provider;

type
  TdtmRelatorios = class(TdtmReports)
    rpCadRubSal: TppReport;
    ppHeaderBand6: TppHeaderBand;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    rpCadRubSalDBText25: TppDBText;
    ppDetailBand8: TppDetailBand;
    CadRubSalSubReport1: TppSubReport;
    rpCadRubSalChildReport1: TppChildReport;
    rpCadRubSalChildReport1TitleBand1: TppTitleBand;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLine5: TppLine;
    rpCadRubSalLabel20: TppLabel;
    rpCadRubSalLabel21: TppLabel;
    rpCadRubSalLabel22: TppLabel;
    rpCadRubSalLabel23: TppLabel;
    rpCadRubSalLabel24: TppLabel;
    rpCadRubSalChildReport1Label1: TppLabel;
    rpCadRubSalChildReport1DetailBand1: TppDetailBand;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    rpCadRubSalDBText20: TppDBText;
    rpCadRubSalDBText21: TppDBText;
    rpCadRubSalDBText22: TppDBText;
    rpCadRubSalDBText23: TppDBText;
    rpCadRubSalDBText24: TppDBText;
    CadRubSalSubReport2: TppSubReport;
    rpCadRubSalChildReport2: TppChildReport;
    rpCadRubSalChildReport2TitleBand1: TppTitleBand;
    rpCadRubSalChildReport2Label1: TppLabel;
    rpCadRubSalChildReport2Label2: TppLabel;
    rpCadRubSalChildReport2Line1: TppLine;
    rpCadRubSalChildReport2Label3: TppLabel;
    rpCadRubSalChildReport2Label4: TppLabel;
    rpCadRubSalChildReport2Label5: TppLabel;
    rpCadRubSalChildReport2Label6: TppLabel;
    rpCadRubSalChildReport2Label7: TppLabel;
    rpCadRubSalChildReport2Label8: TppLabel;
    rpCadRubSalChildReport2DetailBand1: TppDetailBand;
    rpCadRubSalChildReport2DBText1: TppDBText;
    rpCadRubSalChildReport2DBText2: TppDBText;
    rpCadRubSalChildReport2DBText3: TppDBText;
    rpCadRubSalChildReport2DBText4: TppDBText;
    rpCadRubSalChildReport2DBText5: TppDBText;
    rpCadRubSalChildReport2DBText6: TppDBText;
    rpCadRubSalChildReport2DBText7: TppDBText;
    ppFooterBand8: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    rpCadRubSalGroup1: TppGroup;
    rpCadRubSalGroupHeaderBand1: TppGroupHeaderBand;
    rpCadRubSalShape6: TppShape;
    rpCadRubSalShape4: TppShape;
    rpCadRubSalShape10: TppShape;
    rpCadRubSalShape9: TppShape;
    rpCadRubSalShape8: TppShape;
    rpCadRubSalShape7: TppShape;
    rpCadRubSalShape1: TppShape;
    rpCadRubSalShape2: TppShape;
    rpCadRubSalShape3: TppShape;
    rpCadRubSalShape5: TppShape;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    rpCadRubSalDBText1: TppDBText;
    rpCadRubSalDBText2: TppDBText;
    rpCadRubSalDBText3: TppDBText;
    rpCadRubSalDBText4: TppDBText;
    rpCadRubSalDBText5: TppDBText;
    rpCadRubSalDBText6: TppDBText;
    rpCadRubSalDBText7: TppDBText;
    rpCadRubSalDBText8: TppDBText;
    rpCadRubSalDBText10: TppDBText;
    rpCadRubSalDBText12: TppDBText;
    rpCadRubSalDBText13: TppDBText;
    rpCadRubSalDBText14: TppDBText;
    rpCadRubSalDBText15: TppDBText;
    rpCadRubSalDBText16: TppDBText;
    rpCadRubSalDBText17: TppDBText;
    rpCadRubSalLabel1: TppLabel;
    rpCadRubSalLabel2: TppLabel;
    rpCadRubSalLabel3: TppLabel;
    rpCadRubSalLabel4: TppLabel;
    rpCadRubSalLabel5: TppLabel;
    rpCadRubSalLabel6: TppLabel;
    rpCadRubSalLabel7: TppLabel;
    rpCadRubSalLabel8: TppLabel;
    rpCadRubSalLabel9: TppLabel;
    rpCadRubSalLabel10: TppLabel;
    rpCadRubSalLabel11: TppLabel;
    rpCadRubSalLabel13: TppLabel;
    rpCadRubSalLabel15: TppLabel;
    rpCadRubSalLabel16: TppLabel;
    rpCadRubSalLabel18: TppLabel;
    rpCadRubSalLabel19: TppLabel;
    rpCadRubSalDBText19: TppDBText;
    rpCadRubSalLine1: TppLine;
    rpCadRubSalGroupFooterBand1: TppGroupFooterBand;
    ppCalc8: TppSystemVariable;
    ppCalc9: TppSystemVariable;
    updSQL: TUpdateSQL;
    ppCadRubSal: TppBDEPipeline;
    dsCadRubSal: TDataSource;
    qryCadRubSal: TQuery;
    ppCadRubSal1: TppBDEPipeline;
    dsCadRubSal1: TDataSource;
    qryCadRubSal1: TQuery;
    ppCadRubSal2: TppBDEPipeline;
    dsCadRubSal2: TDataSource;
    qryCadRubSal2: TQuery;
    procedure rpFolhaNormalSummaryBand1AfterPrint(Sender: TObject);
    procedure qryFolhaNormalAfterOpen(DataSet: TDataSet);
    procedure qryFolhaNormalAfterScroll(DataSet: TDataSet);
    procedure rpCadRubSalGroupHeaderBand1AfterPrint(Sender: TObject);
  public
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatorios: TdtmRelatorios;

implementation

uses fAguarde, fParamCadRubSal;

{$R *.DFM}

function TdtmRelatorios.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMCADRUBSAL') then
    frm := TfrmParamCadRubSal.Create(Application)
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

procedure TdtmRelatorios.qryFolhaNormalAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatorios.qryFolhaNormalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatorios.rpFolhaNormalSummaryBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

procedure TdtmRelatorios.rpCadRubSalGroupHeaderBand1AfterPrint(Sender: TObject);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

end.
