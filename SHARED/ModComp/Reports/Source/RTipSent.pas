// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTipSent;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptTipSent = class(TFrmCmReport)
    rpTipSent: TppReport;
    rpTipSentHdrBnd: TppHeaderBand;
    rpTipSentLbl1: TppLabel;
    rpTipSentLbl2: TppLabel;
    rpTipSentLbl3: TppLabel;
    rpTipSentLbl4: TppLabel;
    rpTipSentLbl5: TppLabel;
    rpTipSentLine1: TppLine;
    rpTipSentDBTxt1: TppDBText;
    rpTipSentSysVar1: TppSystemVariable;
    rpTipSentSysVar2: TppSystemVariable;
    rpTipSentDtlBnd: TppDetailBand;
    rpTipSentDBTxt3: TppDBText;
    rpTipSentDBTxt2: TppDBText;
    rpTipSentFootBnd: TppFooterBand;
    rpTipSentSmryBnd: TppSummaryBand;
    rpTipSentGrp1: TppGroup;
    rpTipSentGrpHdrBnd: TppGroupHeaderBand;
    rpTipSentGrpFootBnd: TppGroupFooterBand;
    rpTipSentLbl6: TppLabel;
    rpTipSentDBCalc1: TppDBCalc;
    ppTipSent: TppBDEPipeline;
    ppTipSentppField1: TppField;
    ppTipSentppField2: TppField;
    ppTipSentppField3: TppField;
    dsTipSent: TwwDataSource;
    sqlTipSent: TCMSqlParams;
    CdsTipSent: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTipSentAfterOpen(DataSet: TDataSet);
    procedure CdsTipSentAfterScroll(DataSet: TDataSet);
    procedure rpTipSentSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTipSent: TRptTipSent;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptTipSent.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTipSent.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  CODTIPOSENT, DESCRICAO');
    Add('FROM');
    Add('  TIPOSENTENCA');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODTIPOSENT');
      1 : Add('  DESCRICAO');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTipSent.Open;

  frmAguarde.Mostra('Listagem de Centros de Custo');
  frmAguarde.Pos := 0;
end;

procedure TRptTipSent.CdsTipSentAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTipSent.CdsTipSentAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTipSent.rpTipSentSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
