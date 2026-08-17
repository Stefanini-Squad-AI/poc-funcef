unit REtiquetaAlteracaoCTPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, CmParamReport, TXRB;

type
  TRptEtiquetaAlteracaoCTPS = class(TFrmCmReport)
    rpEtiquetaAlteracaoCTPS: TppReport;
    rpEtiquetaAlteracaoCTPSColHdrBnd1: TppColumnHeaderBand;
    rpEtiquetaAlteracaoCTPSDtlBnd: TppDetailBand;
    EtiquetasAltCTPSDBTxt1: TppDBText;
    EtiquetasAltCTPSDBTxt3: TppDBText;
    EtiquetasAltCTPSDBTxt4: TppDBText;
    EtiquetasAltCTPSDBTxt5: TppDBText;
    rpEtiquetaAlteracaoCTPSLbl1: TppLabel;
    rpEtiquetaAlteracaoCTPSDBTxt2: TppDBText;
    rpEtiquetaAlteracaoCTPSLbl2: TppLabel;
    rpEtiquetaAlteracaoCTPSLbl3: TppLabel;
    rpEtiquetaAlteracaoCTPSLbl4: TppLabel;
    rpEtiquetaAlteracaoCTPSLine1: TppLine;
    rpEtiquetaAlteracaoCTPSLbl6: TppLabel;
    rpEtiquetaAlteracaoCTPSColFootBnd1: TppColumnFooterBand;
    rpEtiquetaAlteracaoCTPSSmryBnd: TppSummaryBand;
    ppEtiquetaAlteracaoCTPS: TppBDEPipeline;
    ppEtiquetasAltCTPSppField1: TppField;
    ppEtiquetasAltCTPSppField2: TppField;
    ppEtiquetasAltCTPSppField3: TppField;
    ppEtiquetasAltCTPSppField4: TppField;
    ppEtiquetasAltCTPSppField5: TppField;
    dsEtiquetaAlteracaoCTPS: TwwDataSource;
    sqlEtiquetaAlteracaoCTPS: TCMSqlParams;
    CdsEtiquetaAlteracaoCTPS: TCMClientDataSet;
    ppDBText1: TppDBText;
    MATRICULA: TppField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsEtiquetaAlteracaoCTPSAfterOpen(DataSet: TDataSet);
    procedure CdsEtiquetaAlteracaoCTPSAfterScroll(DataSet: TDataSet);
    procedure rpEtiquetaAlteracaoCTPSSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptEtiquetaAlteracaoCTPS: TRptEtiquetaAlteracaoCTPS;

implementation

uses uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TRptEtiquetaAlteracaoCTPS.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  frmAguarde.Mostra('Etiquetas para Atualização de CTPS');
  frmAguarde.Pos := 0;

  sqlEtiquetaAlteracaoCTPS.Open;
end;

procedure TRptEtiquetaAlteracaoCTPS.CdsEtiquetaAlteracaoCTPSAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TRptEtiquetaAlteracaoCTPS.CdsEtiquetaAlteracaoCTPSAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptEtiquetaAlteracaoCTPS.rpEtiquetaAlteracaoCTPSSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
