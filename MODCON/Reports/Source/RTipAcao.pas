unit RTipAcao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptTipAcao = class(TFrmCmReport)
    rpTipAcao: TppReport;
    rpTipAcaoHdrBnd: TppHeaderBand;
    rpTipAcaoLbl1: TppLabel;
    rpTipAcaoLbl2: TppLabel;
    rpTipAcaoLbl3: TppLabel;
    rpTipAcaoLbl4: TppLabel;
    rpTipAcaoLbl5: TppLabel;
    rpTipAcaoLine1: TppLine;
    rpTipAcaoDBTxt1: TppDBText;
    rpTipAcaoSysVar1: TppSystemVariable;
    rpTipAcaoSysVar2: TppSystemVariable;
    rpTipAcaoDtlBnd: TppDetailBand;
    rpTipAcaoDBTxt3: TppDBText;
    rpTipAcaoDBTxt2: TppDBText;
    rpTipAcaoFootBnd: TppFooterBand;
    rpTipAcaoSmryBnd: TppSummaryBand;
    rpTipAcaoGrp1: TppGroup;
    rpTipAcaoGrpHdrBnd: TppGroupHeaderBand;
    rpTipAcaoGrpFootBnd: TppGroupFooterBand;
    rpTipAcaoLbl6: TppLabel;
    rpTipAcaoDBCalc1: TppDBCalc;
    ppTipAcao: TppBDEPipeline;
    ppTipAcaoppField1: TppField;
    ppTipAcaoppField2: TppField;
    ppTipAcaoppField3: TppField;
    dsTipAcao: TwwDataSource;
    sqlTipAcao: TCMSqlParams;
    CdsTipAcao: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTipAcaoAfterOpen(DataSet: TDataSet);
    procedure CdsTipAcaoAfterScroll(DataSet: TDataSet);
    procedure rpTipAcaoSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTipAcao: TRptTipAcao;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptTipAcao.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTipAcao.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  IDTIPOACAO, DESCRICAO');
    Add('FROM');
    Add('  TIPOACAOPROCJUR');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDTIPOACAO');
      1 : Add('  DESCRICAO');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlTipAcao.Open;

  frmAguarde.Mostra('Listagem dos Tipos de Ação');
  frmAguarde.Pos := 0;
end;

procedure TRptTipAcao.CdsTipAcaoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTipAcao.CdsTipAcaoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTipAcao.rpTipAcaoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
