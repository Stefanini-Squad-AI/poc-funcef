unit RAvalCurso;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport;

type
  TRptAvalCurso = class(TFrmCmReport)
    rpAvalCurso: TppReport;
    rpTabCursosHdrBnd: TppHeaderBand;
    ppShape1: TppShape;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosDBTxt1: TppDBText;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    rpTabCursosLbl3: TppLabel;
    rpTabCursosLbl4: TppLabel;
    rpTabCursosLbl5: TppLabel;
    ppLabel1: TppLabel;
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
    ppLabel2: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    rpTabCursosDtlBnd: TppDetailBand;
    rpTabCursosDBTxt3: TppDBText;
    rpTabCursosDBTxt4: TppDBText;
    ppDBText1: TppDBText;
    rpTabCursosDBMemo1: TppDBMemo;
    ppLine2: TppLine;
    rpTabCursosSmryBnd: TppSummaryBand;
    ppGroup1: TppGroup;
    rpTabCursosGrpHdrBnd: TppGroupHeaderBand;
    rpTabCursosGrpFootBnd: TppGroupFooterBand;
    ppAvalCurso: TppBDEPipeline;
    dsAvalCurso: TwwDataSource;
    CdsAvalCurso: TCMClientDataSet;
    sqlAvalCurso: TCMSqlParams;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsAvalCursoBeforeOpen(DataSet: TDataSet);
    procedure CdsAvalCursoAfterOpen(DataSet: TDataSet);
    procedure CdsAvalCursoAfterScroll(DataSet: TDataSet);
    procedure rpTabCursosSmryBndAfterPrint(Sender: TObject);
    procedure rpAvalCursoBeforePrint(Sender: TObject);
  public
    IdPessoa, IdCurso: double;
    NumSeq: integer;
    Matricula, NomeEmpregado, NomeCargo, NomeCurso, NomeEntidade, LocalCurso: string;
    DataInicioEfetivo, DataFinalEfetivo: TDate;
  end;

var
  RptAvalCurso: TRptAvalCurso;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptAvalCurso.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlAvalCurso.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  A.IDFATORAVAL, ' +QuotedStr(Sistema.NomeEmpresa)+ ' AS EMPRESA,');
    Add('  ' +QuotedStr(Trim(NomeCurso))+ ' AS CURSO,');
    Add('  ' +QuotedStr(Trim(NomeEmpregado))+ ' AS NOME,');
    Add('  ' +QuotedStr(Trim(Matricula))+ ' AS MATRICULA,');
    Add('  ' +QuotedStr(Trim(NomeCargo))+ ' AS CARGO,');
    Add('  ' +QuotedStr(Trim(NomeEntidade))+ ' AS ENTIDADE,');
    Add('  ' +QuotedStr(Trim(LocalCurso))+ ' AS LOCAL,');
    Add('  ' +QuotedStr(DateToStr(DataInicioEfetivo) +' - '+ DateToStr(DataFinalEfetivo))+ ' AS PERIODO,');
    Add('  A.AVALCURSO AS AVALIACAO, F.DESCRICAO, A.OBSERVACAO');
    Add('FROM');
    Add('  AVALCURSO A, FATORAVALCURSO F');
    Add('WHERE');
    Add('  (A.IDPESSOA    = ' +FloatToStr(IdPessoa)+ ') AND');
    Add('  (A.IDCURSO     = ' +FloatToStr(IdCurso)+ ') AND');
    Add('  (A.NUMSEQ      = ' +IntToStr(NumSeq)+ ') AND');
    Add('  (A.IDFATORAVAL = F.IDFATORAVAL)');
    Add('ORDER BY');
    Add('  A.IDFATORAVAL');
  end;
  sqlAvalCurso.Open;
end;

procedure TRptAvalCurso.rpAvalCursoBeforePrint(Sender: TObject);
begin
  CrmRptCMBeforePrint(Sender);
end;

procedure TRptAvalCurso.CdsAvalCursoBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Avaliação de Cursos');
  frmAguarde.Pos := 0;
end;

procedure TRptAvalCurso.CdsAvalCursoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptAvalCurso.CdsAvalCursoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptAvalCurso.rpTabCursosSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
