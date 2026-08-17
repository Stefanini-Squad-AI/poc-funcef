// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTabCID;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXComp,
  uCmRptManager, CmParamReport, TXRB, USistema;

type
  TRptTabCID = class(TFrmCmReport)
    rpTabCID: TppReport;
    rpTabCIDHdrBnd: TppHeaderBand;
    rpTabCIDLbl1: TppLabel;
    rpTabCIDLbl2: TppLabel;
    rpTabCIDLbl3: TppLabel;
    rpTabCIDDBTxt1: TppDBText;
    rpTabCIDCalc1: TppSystemVariable;
    rpTabCIDCalc2: TppSystemVariable;
    rpTabCIDLine1: TppLine;
    rpTabCIDLbl4: TppLabel;
    rpTabCIDLbl5: TppLabel;
    rpTabCIDDtlBnd: TppDetailBand;
    rpTabCIDDBTxt2: TppDBText;
    rpTabCIDDBTxt3: TppDBText;
    rpTabCIDSmryBnd: TppSummaryBand;
    rpTabCIDGrp: TppGroup;
    rpTabCIDGrpHdrBnd: TppGroupHeaderBand;
    rpTabCIDGrpFootBnd: TppGroupFooterBand;
    rpTabCIDLbl6: TppLabel;
    rpTabCIDDBCalc1: TppDBCalc;
    ppTabCID: TppBDEPipeline;
    dsTabCID: TwwDataSource;
    sqlTabCID: TCMSqlParams;
    CdsTabCID: TCMClientDataSet;
    procedure CdsTabCIDAfterOpen(DataSet: TDataSet);
    procedure CdsTabCIDAfterScroll(DataSet: TDataSet);
    procedure rpTabCIDSmryBndAfterPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  end;

var
  RptTabCID: TRptTabCID;

implementation

uses fAguarde;

{$R *.DFM}

procedure TRptTabCID.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTabCID.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(CmpRptCM.ParamByName('NomeEmpresa').asString)+ ') AS EMPRESA,');
    Add('  CODCID, DESCRCID');
    Add('FROM');
    Add('  CID');

    // Funcionários selecionado(s)
    if (CmpRptCM.ParamByName('ListaCodCID').asString <> '') then
    begin
      Add('WHERE');
      if (Pos(',', CmpRptCM.ParamByName('ListaCodCID').asString) > 0) then
        Add('  (CODCID IN (' +CmpRptCM.ParamByName('ListaCodCID').asString+ '))')
      else
        Add('  (CODCID = ' +CmpRptCM.ParamByName('ListaCodCID').asString+ ')');
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODCID');
      1 : Add('  UPPER(DESCRCID)');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTabCID.Open;
end;

procedure TRptTabCID.CdsTabCIDAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTabCID.CdsTabCIDAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTabCID.rpTabCIDSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
