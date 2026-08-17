unit RProfis;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport,
  uCmRptManager, TXComp, CmParamReport, Db, DBClient, uCMClientDataSet, uCmSqlParams,
  Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl, ppCache,
  ppComm, ppRelatv, ppProd, ppReport;

type
  TRptProfis = class(TFrmCmReport)
    rpProfis: TppReport;
    ProfisHdrBnd1: TppHeaderBand;
    ProfisLbl1: TppLabel;
    ProfisLbl2: TppLabel;
    ProfisLbl3: TppLabel;
    ProfisLbl4: TppLabel;
    ProfisLbl5: TppLabel;
    ProfisLine1: TppLine;
    ProfisDBTxt1: TppDBText;
    ProfisCalc1: TppSystemVariable;
    ProfisCalc2: TppSystemVariable;
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
    sqlProfis: TCMSqlParams;
    CdsProfis: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsProfisAfterOpen(DataSet: TDataSet);
    procedure CdsProfisAfterScroll(DataSet: TDataSet);
    procedure ProfisSmryBnd1AfterPrint(Sender: TObject);
  end;

var
  RptProfis: TRptProfis;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptProfis.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlProfis.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDPROFISS, DESCRICAO');
    Add('FROM');
    Add('  PROFISS');

    // Profissões selecionada(s)
    if (CmpRptCM.ParamByName('ListaCodProfissao').asString <> '') then
    begin
      Add('WHERE');
      if (Pos(',', CmpRptCM.ParamByName('ListaCodProfissao').asString) > 0) then
        Add('  (IDPROFISS IN (' +CmpRptCM.ParamByName('ListaCodProfissao').asString+ '))')
      else
        Add('  (IDPROFISS = ' +CmpRptCM.ParamByName('ListaCodProfissao').asString+ ')');
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDPROFISS');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlProfis.Open;
end;

procedure TRptProfis.CdsProfisAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptProfis.CdsProfisAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptProfis.ProfisSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
