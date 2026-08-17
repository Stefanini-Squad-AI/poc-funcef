// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit RTipRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  uCmRptManager, TXComp, CmParamReport, TXRB;

type
  TRptTipRec = class(TFrmCmReport)
    rpTipRec: TppReport;
    rpTipRecHdrBnd: TppHeaderBand;
    rpTipRecLbl1: TppLabel;
    rpTipRecLbl2: TppLabel;
    rpTipRecLbl3: TppLabel;
    rpTipRecLbl4: TppLabel;
    rpTipRecLbl5: TppLabel;
    rpTipRecLine1: TppLine;
    rpTipRecDBTxt1: TppDBText;
    rpTipRecLbl6: TppLabel;
    rpTipRecSysVar1: TppSystemVariable;
    rpTipRecSysVar2: TppSystemVariable;
    rpTipRecDtlBnd: TppDetailBand;
    rpTipRecDBTxt3: TppDBText;
    rpTipRecDBTxt2: TppDBText;
    rpTipRecDBTxt4: TppDBText;
    rpTipRecFootBnd: TppFooterBand;
    rpTipRecSmryBnd: TppSummaryBand;
    rpTipRecGrp1: TppGroup;
    rpTipRecGrpHdrBnd: TppGroupHeaderBand;
    rpTipRecGrpFootBnd: TppGroupFooterBand;
    rpTipRecLbl7: TppLabel;
    rpTipRecDBCalc1: TppDBCalc;
    ppTipRec: TppBDEPipeline;
    ppTipRecppField1: TppField;
    ppTipRecppField2: TppField;
    ppTipRecppField3: TppField;
    ppTipRecppField4: TppField;
    dsTipRec: TwwDataSource;
    sqlTipRec: TCMSqlParams;
    CdsTipRec: TCMClientDataSet;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsTipRecAfterOpen(DataSet: TDataSet);
    procedure CdsTipRecAfterScroll(DataSet: TDataSet);
    procedure rpTipRecSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptTipRec: TRptTipRec;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptTipRec.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlTipRec.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  CODTIPORECURSO, DESCRICAO, VALORHONOR');
    Add('FROM');
    Add('  TIPORECTRAB');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  CODTIPORECURSO');
      1 : Add('  DESCRICAO');
    end;
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlTipRec.Open;

  frmAguarde.Mostra('Listagem dos Tipos de Etapa');
  frmAguarde.Pos := 0;
end;

procedure TRptTipRec.CdsTipRecAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptTipRec.CdsTipRecAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptTipRec.rpTipRecSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
