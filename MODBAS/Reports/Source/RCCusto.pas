unit RCCusto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, TXComp,
  uCmRptManager, CmParamReport;

type
  TRptCCusto = class(TFrmCmReport)
    rpCCusto: TppReport;
    CCustoHdrBnd1: TppHeaderBand;
    CCustoLbl1: TppLabel;
    CCustoLbl2: TppLabel;
    CCustoLbl3: TppLabel;
    CCustoLbl4: TppLabel;
    CCustoLbl5: TppLabel;
    CCustoLine1: TppLine;
    CCustoDBTxt1: TppDBText;
    CCustoCalc1: TppSystemVariable;
    CCustoCalc2: TppSystemVariable;
    CCustoDtlBnd1: TppDetailBand;
    CCustoDBTxt3: TppDBText;
    CCustoDBTxt2: TppDBText;
    CCustoFootBnd1: TppFooterBand;
    CCustoSmryBnd1: TppSummaryBand;
    CCustoGroup1: TppGroup;
    CCustoGrpHdrBnd1: TppGroupHeaderBand;
    CCustoGrpFootBnd1: TppGroupFooterBand;
    CCustoLbl7: TppLabel;
    CCustoDBCalc3: TppDBCalc;
    ppCCusto: TppBDEPipeline;
    dsCCusto: TwwDataSource;
    sqlCCusto: TCMSqlParams;
    CdsCCusto: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsCCustoAfterOpen(DataSet: TDataSet);
    procedure CdsCCustoAfterScroll(DataSet: TDataSet);
    procedure CCustoSmryBnd1AfterPrint(Sender: TObject);
  end;

var
  RptCCusto: TRptCCusto;

implementation

uses fAguarde, uSistema;

{$R *.DFM}

procedure TRptCCusto.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlCCusto.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  CODCENTROCUSTO, NOME');
    Add('FROM');
    Add('  CENTCUST');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODCENTROCUSTO');
      1 : Add('  NOME');
    end;
    SaveToFile('c:\qry.txt');
  end;

  frmAguarde.Mostra('Listagem de Centros de Custo');
  frmAguarde.Pos := 0;
  sqlCCusto.Open;
end;

procedure TRptCCusto.CdsCCustoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptCCusto.CdsCCustoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCCusto.CCustoSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
