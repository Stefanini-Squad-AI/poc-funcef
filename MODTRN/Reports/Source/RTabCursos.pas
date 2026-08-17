// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTabCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppStrtch, ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptTabCursos = class(TFrmCmReport)
    rpTabCursos: TppReport;
    rpTabCursosHdrBnd: TppHeaderBand;
    rpTabCursosLbl1: TppLabel;
    rpTabCursosLbl2: TppLabel;
    rpTabCursosDBTxt1: TppDBText;
    rpTabCursosCalc1: TppSystemVariable;
    rpTabCursosCalc2: TppSystemVariable;
    rpTabCursosDBTxt2: TppDBText;
    rpTabCursosLbl3: TppLabel;
    rpTabCursosLbl4: TppLabel;
    ppLine1: TppLine;
    rpTabCursosLbl5: TppLabel;
    rpTabCursosDtlBnd: TppDetailBand;
    rpTabCursosDBTxt3: TppDBText;
    rpTabCursosDBTxt4: TppDBText;
    ppDBText1: TppDBText;
    rpTabCursosDBMemo1: TppDBMemo;
    rpTabCursosSmryBnd: TppSummaryBand;
    ppGroup1: TppGroup;
    rpTabCursosGrpHdrBnd: TppGroupHeaderBand;
    rpTabCursosGrpFootBnd: TppGroupFooterBand;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppTabCursos: TppBDEPipeline;
    dsTabCursos: TwwDataSource;
    sqlTabCursos: TCMSqlParams;
    CdsTabCursos: TCMClientDataSet;
    procedure CdsTabCursosAfterOpen(DataSet: TDataSet);
    procedure CdsTabCursosAfterScroll(DataSet: TDataSet);
    procedure rpTabCursosDtlBndBeforePrint(Sender: TObject);
    procedure rpTabCursosSmryBndAfterPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  end;

var
  RptTabCursos: TRptTabCursos;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptTabCursos.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTabCursos.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDCURSO, DESCRICAO, ABREV, CODGRPTREIN, OBSERVACAO');
    Add('FROM');
    Add('  CURSO');

    if (CmpRptCM.ParamByName('ListaCodGrupo').asString <> '') then
    begin
      Add('WHERE');
      if (Pos(',', CmpRptCM.ParamByName('ListaCodGrupo').asString) > 0) then
        Add('  (CODGRPTREIN IN (' +CmpRptCM.ParamByName('ListaCodGrupo').asString+ '))')
      else
        Add('  (CODGRPTREIN  = ' +CmpRptCM.ParamByName('ListaCodGrupo').asString+ ')');
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDCURSO');
      1 : Add('  DESCRICAO');
    end;
//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTabCursos.Open;
end;

procedure TRptTabCursos.CdsTabCursosAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTabCursos.CdsTabCursosAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTabCursos.rpTabCursosDtlBndBeforePrint(Sender: TObject);
begin
  if (CmpRptCM.ParamByName('ImprimeObs').asBoolean) and
     not(CdsTabCursos.FieldByName('OBSERVACAO').IsNull) then
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

procedure TRptTabCursos.rpTabCursosSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
