unit RCargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppStrtch, ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport;

type
  TRptCargos = class(TFrmCmReport)
    rpCargos: TppReport;
    CargosHdrBnd1: TppHeaderBand;
    CargosLbl1: TppLabel;
    CargosLbl2: TppLabel;
    CargosLbl3: TppLabel;
    CargosLbl4: TppLabel;
    CargosLbl5: TppLabel;
    CargosLine1: TppLine;
    CargosLbl6: TppLabel;
    CargosDBText1: TppDBText;
    CargosCalc1: TppSystemVariable;
    CargosCalc2: TppSystemVariable;
    CargosDtlBnd1: TppDetailBand;
    CargosDBText3: TppDBText;
    CargosDBText2: TppDBText;
    CargosDBText4: TppDBText;
    CargosDBMem1: TppDBMemo;
    CargosFootBnd1: TppFooterBand;
    CargosSmryBnd1: TppSummaryBand;
    rpCargosGroup1: TppGroup;
    CargosGrpHdrBnd1: TppGroupHeaderBand;
    CargosGrpFootBnd1: TppGroupFooterBand;
    CargosLbl7: TppLabel;
    CargosDBCalc1: TppDBCalc;
    ppCargos: TppBDEPipeline;
    dsCargos: TwwDataSource;
    sqlCargos: TCMSqlParams;
    CdsCargos: TCMClientDataSet;
    procedure CdsCargosAfterOpen(DataSet: TDataSet);
    procedure CdsCargosAfterScroll(DataSet: TDataSet);
    procedure CargosSmryBnd1AfterPrint(Sender: TObject);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  end;

var
  RptCargos: TRptCargos;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptCargos.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlCargos.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');

    if (CmpRptCM.ParamByName('ImprimeDescricao').asBoolean) then
      Add('  IDCARGO AS CODIGO, TITULO, CBO2002, DESCRICAO')
    else
      Add('  IDCARGO AS CODIGO, TITULO, CBO2002');

    Add('FROM');
    Add('  CARGO');

    // Grupos Funcionas selecionado(s)
    if (CmpRptCM.ParamByName('ListaCodGrupoFunc').asString <> '') then
    begin
      Add('WHERE');
      if (Pos(',', CmpRptCM.ParamByName('ListaCodGrupoFunc').asString) > 0) then
        Add('  (CODGRPFUNC IN (' +CmpRptCM.ParamByName('ListaCodGrupoFunc').asString+ '))')
      else
        Add('  (CODGRPFUNC = ' +CmpRptCM.ParamByName('ListaCodGrupoFunc').asString+ ')');
    end;

    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODIGO');
      1 : Add('  TITULO');
      2 : Add('  CBO2002');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlCargos.Open;
end;

procedure TRptCargos.CdsCargosAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;

  CargosDBMem1.Visible := (CmpRptCM.ParamByName('ImprimeDescricao').asBoolean);

  if (CmpRptCM.ParamByName('ImprimeDescricao').asBoolean) then
  begin
    CargosDBMem1.Top := 7.408;
    CargosDtlBnd1.Height := 29.633;
  end
  else
    CargosDtlBnd1.Height := 6.615;
end;

procedure TRptCargos.CdsCargosAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptCargos.CargosSmryBnd1AfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
