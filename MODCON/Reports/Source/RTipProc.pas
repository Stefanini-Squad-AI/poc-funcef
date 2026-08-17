unit RTipProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptTipProc = class(TFrmCmReport)
    rpTipProc: TppReport;
    rpTipProcHdrBnd: TppHeaderBand;
    rpTipProcLbl1: TppLabel;
    rpTipProcLbl2: TppLabel;
    rpTipProcLbl3: TppLabel;
    rpTipProcLbl4: TppLabel;
    rpTipProcLbl5: TppLabel;
    rpTipProcLine1: TppLine;
    rpTipProcDBTxt1: TppDBText;
    rpTipProcSysVar1: TppSystemVariable;
    rpTipProcSysVar2: TppSystemVariable;
    rpTipProcDtlBnd: TppDetailBand;
    rpTipProcDBTxt3: TppDBText;
    rpTipProcDBTxt2: TppDBText;
    rpTipProcFootBnd: TppFooterBand;
    rpTipProcSmryBnd: TppSummaryBand;
    rpTipProcGrp1: TppGroup;
    rpTipProcGrpHdrBnd: TppGroupHeaderBand;
    rpTipProcGrpFootBnd: TppGroupFooterBand;
    rpTipProcLbl6: TppLabel;
    rpTipProcDBCalc1: TppDBCalc;
    ppTipProc: TppBDEPipeline;
    ppTipProcppField1: TppField;
    ppTipProcppField2: TppField;
    ppTipProcppField3: TppField;
    dsTipProc: TwwDataSource;
    sqlTipProc: TCMSqlParams;
    CdsTipProc: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTipProcAfterOpen(DataSet: TDataSet);
    procedure CdsTipProcAfterScroll(DataSet: TDataSet);
    procedure rpTipProcSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTipProc: TRptTipProc;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptTipProc.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTipProc.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');   
    Add('  IDTIPOPROC, NOMETIPOPROC');
    Add('FROM');
    Add('  TIPOPROCESSO');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDTIPOPROC');
      1 : Add('  NOMETIPOPROC');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlTipProc.Open;

  frmAguarde.Mostra('Listagem dos Tipos de Processo');
  frmAguarde.Pos := 0;
end;

procedure TRptTipProc.CdsTipProcAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTipProc.CdsTipProcAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTipProc.rpTipProcSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
