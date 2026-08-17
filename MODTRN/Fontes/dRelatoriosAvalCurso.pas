unit dRelatoriosAvalCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppDBBDE, ppStrtch, ppMemo, ppEndUsr;

type
  TdtmRelatoriosAvalCurso = class(TdtmReports)
    rpAvalCurso: TppReport;
    rpTabCursosHdrBnd: TppHeaderBand;
    rpTabCursosDtlBnd: TppDetailBand;
    ppAvalCurso: TppBDEPipeline;
    dsAvalCurso: TwwDataSource;
    qryAvalCurso: TwwQuery;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosDBTxt1: TppDBText;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    rpTabCursosLbl3: TppLabel;
    rpTabCursosLbl4: TppLabel;
    rpTabCursosDBTxt3: TppDBText;
    rpTabCursosDBTxt4: TppDBText;
    rpTabCursosSmryBnd: TppSummaryBand;
    rpTabCursosLbl5: TppLabel;
    ppGroup1: TppGroup;
    rpTabCursosGrpHdrBnd: TppGroupHeaderBand;
    rpTabCursosGrpFootBnd: TppGroupFooterBand;
    ppDBText1: TppDBText;
    rpTabCursosDBMemo1: TppDBMemo;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppShape2: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    dsgnRelatorios: TppDesigner;
    procedure qryAvalCursoBeforeOpen(DataSet: TDataSet);
    procedure qryAvalCursoAfterOpen(DataSet: TDataSet);
    procedure qryAvalCursoAfterScroll(DataSet: TDataSet);
    procedure rpTabCursosSmryBndAfterPrint(Sender: TObject);
  public
    bImprimeObs: boolean;

    function GetLayoutPadrao: TStringList;
  end;

var
  dtmRelatoriosAvalCurso: TdtmRelatoriosAvalCurso;

implementation

uses fAguarde;

{$R *.DFM}

function TdtmRelatoriosAvalCurso.GetLayoutPadrao: TStringList;
var
  LayoutPadrao: TStringList;
begin
  LayoutPadrao := TStringList.Create;

  with (LayoutPadrao) do
  begin
    Clear;
  end;

  Result := LayoutPadrao;
end;


// *************************************************************************************
// *************************************************************************************
// Tabela de Cursos
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAvalCurso.qryAvalCursoBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Avaliação de Cursos');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosAvalCurso.qryAvalCursoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosAvalCurso.qryAvalCursoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosAvalCurso.rpTabCursosSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
