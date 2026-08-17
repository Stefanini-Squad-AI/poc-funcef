unit dRelatoriosTrn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppMemo;

type
  TdtmRelatoriosTrn = class(TdtmReports)
    rpTabCursos: TppReport;
    rpTabCursosHdrBnd: TppHeaderBand;
    rpTabCursosDtlBnd: TppDetailBand;
    ppTabCursos: TppBDEPipeline;
    dsTabCursos: TwwDataSource;
    qryTabCursos: TwwQuery;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosDBTxt1: TppDBText;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    rpTabCursosDBTxt2: TppDBText;
    rpTabCursosLbl3: TppLabel;
    rpTabCursosLbl4: TppLabel;
    rpTabCursosDBTxt3: TppDBText;
    rpTabCursosDBTxt4: TppDBText;
    ppLine1: TppLine;
    rpTabCursosSmryBnd: TppSummaryBand;
    rpTabCursosLbl5: TppLabel;
    ppGroup1: TppGroup;
    rpTabCursosGrpHdrBnd: TppGroupHeaderBand;
    rpTabCursosGrpFootBnd: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    rpTabCursosDBMemo1: TppDBMemo;
    procedure qryTabCursosBeforeOpen(DataSet: TDataSet);
    procedure qryTabCursosAfterOpen(DataSet: TDataSet);
    procedure qryTabCursosAfterScroll(DataSet: TDataSet);
    procedure rpTabCursosDtlBndBeforePrint(Sender: TObject);
    procedure rpTabCursosSmryBndAfterPrint(Sender: TObject);
  public
    bImprimeObs: boolean;

    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosTrn: TdtmRelatoriosTrn;

implementation

uses fAguarde, fParamTabCursos;

{$R *.DFM}

function TdtmRelatoriosTrn.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMTABCURSOS') then
    frm := TfrmParamTabCursos.Create(Application)
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

// *************************************************************************************
// *************************************************************************************
// Tabela de Cursos
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosTrn.qryTabCursosBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Tabela de Cursos');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosTrn.qryTabCursosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosTrn.qryTabCursosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosTrn.rpTabCursosDtlBndBeforePrint(Sender: TObject);
begin
  inherited;
  if (bImprimeObs) and not(qryTabCursos.FieldByName('OBSERVACAO').IsNull) then
  begin
    rpTabCursosDBMemo1.Visible := true;
    rpTabCursosDBMemo1.Top := 23;
    rpTabCursosDtlBnd.Height := 80;
  end
  else
  begin
    rpTabCursosDBMemo1.Visible := false;
    rpTabCursosDtlBnd.Height := 22;
  end
end;

procedure TdtmRelatoriosTrn.rpTabCursosSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
