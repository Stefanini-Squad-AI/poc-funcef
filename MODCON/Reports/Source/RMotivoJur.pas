unit RMotivoJur;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppStrtch, ppMemo, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptMotivoJur = class(TFrmCmReport)
    rpMotivoJur: TppReport;
    rpMotivoJurHdrBnd: TppHeaderBand;
    rpMotivoJurLbl1: TppLabel;
    rpMotivoJurLbl2: TppLabel;
    rpMotivoJurLbl3: TppLabel;
    rpMotivoJurLbl4: TppLabel;
    rpMotivoJurLbl5: TppLabel;
    rpMotivoJurLine1: TppLine;
    rpMotivoJurDBTxt1: TppDBText;
    rpMotivoJurLbl6: TppLabel;
    rpMotivoJurSysVar1: TppSystemVariable;
    rpMotivoJurSysVar2: TppSystemVariable;
    rpMotivoJurDtlBnd: TppDetailBand;
    rpMotivoJurDBTxt3: TppDBText;
    rpMotivoJurDBTxt2: TppDBText;
    rpMotivoJurDBMemo1: TppDBMemo;
    rpMotivoJurFootBnd: TppFooterBand;
    rpMotivoJurSmryBnd: TppSummaryBand;
    rpMotivoJurGrp1: TppGroup;
    rpMotivoJurGrpHdrBnd: TppGroupHeaderBand;
    rpMotivoJurGrpFootBnd: TppGroupFooterBand;
    rpMotivoJurLbl7: TppLabel;
    rpMotivoJurDBCalc1: TppDBCalc;
    ppMotivoJur: TppBDEPipeline;
    ppMotivoJurppField1: TppField;
    ppMotivoJurppField2: TppField;
    ppMotivoJurppField3: TppField;
    ppMotivoJurppField4: TppField;
    dsMotivoJur: TwwDataSource;
    sqlMotivoJur: TCMSqlParams;
    CdsMotivoJur: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsMotivoJurAfterOpen(DataSet: TDataSet);
    procedure CdsMotivoJurAfterScroll(DataSet: TDataSet);
    procedure rpMotivoJurSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptMotivoJur: TRptMotivoJur;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptMotivoJur.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlMotivoJur.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDMOTIVO, DESCRICAO, OBSERVACAO, GRUPOMOTIVO');
    Add('FROM');
    Add('  MOTIVO');
    Add('WHERE');
    Add('  (GRUPOMOTIVO = ''O'')');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDMOTIVO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlMotivoJur.Open;

  frmAguarde.Mostra('Listagem dos Motivos de Exclusão');
  frmAguarde.Pos := 0;
end;

procedure TRptMotivoJur.CdsMotivoJurAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptMotivoJur.CdsMotivoJurAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptMotivoJur.rpMotivoJurSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
