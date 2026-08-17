// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTabPer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, TXRB, USistema;

type
  TRptTabPer = class(TFrmCmReport)
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
    rpTabPerLbl7: TppLabel;
    rpTabPerLbl8: TppLabel;
    rpTabPerLbl9: TppLabel;
    rpTabPerLbl10: TppLabel;
    rpTabPerLbl11: TppLabel;
    rpTabPerLbl12: TppLabel;
    rpTabPerDtlBnd: TppDetailBand;
    rpTabPerDBTxt2: TppDBText;
    rpTabPerDBTxt3: TppDBText;
    rpTabPerDBTxt4: TppDBText;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    rpTabPerSmryBnd: TppSummaryBand;
    rpTabPerGroup: TppGroup;
    rpTabPerGrpHdrBnd: TppGroupHeaderBand;
    rpTabPerGrpFootBnd: TppGroupFooterBand;
    rpTabPerLbl13: TppLabel;
    rpTabPerDBCalc: TppDBCalc;
    ppTabPer: TppBDEPipeline;
    dsTabPer: TwwDataSource;
    sqlTabPer: TCMSqlParams;
    CdsTabPer: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTabPerAfterOpen(DataSet: TDataSet);
    procedure CdsTabPerAfterScroll(DataSet: TDataSet);
    procedure rpTabPerSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTabPer: TRptTabPer;

implementation

uses fAguarde;

{$R *.DFM}

procedure TRptTabPer.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTabPer.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  TM.CODTIPOOCMED, TM.DESCRTIPOOCMED, TM.AVALMIN,');
    Add('  PE.LIMINFERIOR, PE.LIMSUPERIOR, PE.PERIODO, PE.CODCENTROCUSTO,');
    Add('  C.TITULO AS CARGO,');
    Add('  DECODE(PE.INDTEMPO, 1, ''Idade'', ''Exposição'') AS BASEADOEM');
    Add('FROM');
    Add('  TIPOCMED TM, PEREXAME PE, CARGO C');
    Add('WHERE');

    // Ocorrência(s) selecionada(s)
    if (CmpRptCM.ParamByName('ListaCodTipOcMed').asString <> '') then
      if (Pos(',', CmpRptCM.ParamByName('ListaCodTipOcMed').asString) > 0) then
        Add('  (TM.CODTIPOOCMED IN (' +CmpRptCM.ParamByName('ListaCodTipOcMed').asString+ ')) AND')
      else
        Add('  (TM.CODTIPOOCMED = ' +CmpRptCM.ParamByName('ListaCodTipOcMed').asString+ ') AND');

    Add('  (TM.CODTIPOOCMED = PE.CODTIPOOCMED) AND');
    Add('  (PE.IDCARGO      = C.IDCARGO(+))');

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  UPPER(DESCRTIPOOCMED)');
      1 : Add('  UPPER(CARGO)');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTabPer.Open;
end;

procedure TRptTabPer.CdsTabPerAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTabPer.CdsTabPerAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTabPer.rpTabPerSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
