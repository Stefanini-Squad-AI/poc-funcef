unit dRelatoriosComumJurid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports,
  ppCtrls, ppBands, ppClass, ppDB, ppVar, ppPrnabl, ppCache, ppProd, ppReport, Db,
  DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppMemo;

type
  TdtmRelatoriosComumJurid = class(TdtmReports)
    rpVara: TppReport;
    ppVara: TppBDEPipeline;
    dsVara: TwwDataSource;
    qryVara: TwwQuery;
    rpVaraGrp1: TppGroup;
    rpVaraHdrBnd: TppHeaderBand;
    rpVaraGrpHdrBnd: TppGroupHeaderBand;
    rpVaraGrpFootBnd: TppGroupFooterBand;
    rpVaraDtlBnd: TppDetailBand;
    rpVaraFootBnd: TppFooterBand;
    rpVaraSmryBnd: TppSummaryBand;
    rpVaraLbl1: TppLabel;
    rpVaraLbl2: TppLabel;
    rpVaraLbl3: TppLabel;
    rpVaraLbl4: TppLabel;
    rpVaraLbl5: TppLabel;
    rpVaraLbl6: TppLabel;
    rpVaraLine1: TppLine;
    rpVaraDBTxt1: TppDBText;
    rpVaraDBTxt2: TppDBText;
    rpVaraDBTxt3: TppDBText;
    rpVaraSysVar1: TppSystemVariable;
    rpVaraSysVar2: TppSystemVariable;
    rpVaraDBCalc1: TppDBCalc;

    rpTipProc: TppReport;
    ppTipProc: TppBDEPipeline;
    dsTipProc: TwwDataSource;
    qryTipProc: TwwQuery;
    rpTipProcGrp1: TppGroup;
    rpTipProcHdrBnd: TppHeaderBand;
    rpTipProcGrpHdrBnd: TppGroupHeaderBand;
    rpTipProcGrpFootBnd: TppGroupFooterBand;
    rpTipProcDtlBnd: TppDetailBand;
    rpTipProcFootBnd: TppFooterBand;
    rpTipProcSmryBnd: TppSummaryBand;
    rpTipProcLbl1: TppLabel;
    rpTipProcLbl2: TppLabel;
    rpTipProcLbl3: TppLabel;
    rpTipProcLbl4: TppLabel;
    rpTipProcLbl5: TppLabel;
    rpTipProcLbl6: TppLabel;
    rpTipProcLine1: TppLine;
    rpTipProcDBTxt1: TppDBText;
    rpTipProcDBTxt2: TppDBText;
    rpTipProcDBTxt3: TppDBText;
    rpTipProcSysVar1: TppSystemVariable;
    rpTipProcSysVar2: TppSystemVariable;
    rpTipProcDBCalc1: TppDBCalc;

    rpTipAcao: TppReport;
    ppTipAcao: TppBDEPipeline;
    dsTipAcao: TwwDataSource;
    qryTipAcao: TwwQuery;
    rpTipAcaoGrp1: TppGroup;
    rpTipAcaoHdrBnd: TppHeaderBand;
    rpTipAcaoGrpHdrBnd: TppGroupHeaderBand;
    rpTipAcaoGrpFootBnd: TppGroupFooterBand;
    rpTipAcaoDtlBnd: TppDetailBand;
    rpTipAcaoFootBnd: TppFooterBand;
    rpTipAcaoSmryBnd: TppSummaryBand;
    rpTipAcaoLbl1: TppLabel;
    rpTipAcaoLbl2: TppLabel;
    rpTipAcaoLbl3: TppLabel;
    rpTipAcaoLbl4: TppLabel;
    rpTipAcaoLbl5: TppLabel;
    rpTipAcaoLbl6: TppLabel;    
    rpTipAcaoLine1: TppLine;
    rpTipAcaoDBTxt1: TppDBText;
    rpTipAcaoDBTxt2: TppDBText;
    rpTipAcaoDBTxt3: TppDBText;
    rpTipAcaoSysVar1: TppSystemVariable;
    rpTipAcaoSysVar2: TppSystemVariable;
    rpTipAcaoDBCalc1: TppDBCalc;

    rpMotivoJur: TppReport;
    ppMotivoJur: TppBDEPipeline;
    dsMotivoJur: TwwDataSource;
    qryMotivoJur: TwwQuery;
    rpMotivoJurGrp1: TppGroup;
    rpMotivoJurHdrBnd: TppHeaderBand;
    rpMotivoJurGrpHdrBnd: TppGroupHeaderBand;
    rpMotivoJurGrpFootBnd: TppGroupFooterBand;
    rpMotivoJurDtlBnd: TppDetailBand;
    rpMotivoJurFootBnd: TppFooterBand;
    rpMotivoJurSmryBnd: TppSummaryBand;
    rpMotivoJurLbl1: TppLabel;
    rpMotivoJurLbl2: TppLabel;
    rpMotivoJurLbl3: TppLabel;
    rpMotivoJurLbl4: TppLabel;
    rpMotivoJurLbl5: TppLabel;
    rpMotivoJurLbl6: TppLabel;
    rpMotivoJurLbl7: TppLabel;
    rpMotivoJurLine1: TppLine;
    rpMotivoJurDBTxt1: TppDBText;
    rpMotivoJurDBTxt2: TppDBText;
    rpMotivoJurDBTxt3: TppDBText;
    rpMotivoJurDBMemo1: TppDBMemo;
    rpMotivoJurSysVar1: TppSystemVariable;
    rpMotivoJurSysVar2: TppSystemVariable;
    rpMotivoJurDBCalc1: TppDBCalc;

    rpGrpObjeto: TppReport;
    ppGrpObjeto: TppBDEPipeline;
    dsGrpObjeto: TwwDataSource;
    qryGrpObjeto: TwwQuery;
    ppGroup4: TppGroup;
    rpGrpObjetoHdrBnd: TppHeaderBand;
    rpGrpObjetoGrpHdrBnd: TppGroupHeaderBand;
    rpGrpObjetoGrpFootBnd: TppGroupFooterBand;
    rpGrpObjetoDtlBnd: TppDetailBand;
    rpGrpObjetoFootBnd: TppFooterBand;
    rpGrpObjetoSmryBnd: TppSummaryBand;
    rpGrpObjetoLbl1: TppLabel;
    rpGrpObjetoLbl2: TppLabel;
    rpGrpObjetoLbl3: TppLabel;
    rpGrpObjetoLbl4: TppLabel;
    rpGrpObjetoLbl5: TppLabel;
    rpGrpObjetoLbl6: TppLabel;
    rpGrpObjetoLine1: TppLine;
    rpGrpObjetoDBTxt1: TppDBText;
    rpGrpObjetoDBTxt2: TppDBText;
    rpGrpObjetoDBTxt3: TppDBText;
    rpGrpObjetoSysVar1: TppSystemVariable;
    rpGrpObjetoSysVar2: TppSystemVariable;
    rpGrpObjetoDBCalc1: TppDBCalc;

    rpTipObjeto: TppReport;
    ppTipObjeto: TppBDEPipeline;
    dsTipObjeto: TwwDataSource;
    qryTipObjeto: TwwQuery;
    rpTipObjetoGrp1: TppGroup;
    rpTipObjetoHdrBnd: TppHeaderBand;
    rpTipObjetoGrpHdrBnd: TppGroupHeaderBand;
    rpTipObjetoGrpFootBnd: TppGroupFooterBand;
    rpTipObjetoDtlBnd: TppDetailBand;
    rpTipObjetoFootBnd: TppFooterBand;
    rpTipObjetoSmryBnd: TppSummaryBand;
    rpTipObjetoLbl1: TppLabel;
    rpTipObjetoLbl2: TppLabel;
    rpTipObjetoLbl3: TppLabel;
    rpTipObjetoLbl4: TppLabel;
    rpTipObjetoLbl5: TppLabel;
    rpTipObjetoLbl6: TppLabel;
    rpTipObjetoLbl7: TppLabel;
    rpTipObjetoLbl8: TppLabel;
    rpTipObjetoLine1: TppLine;
    rpTipObjetoDBTxt1: TppDBText;
    rpTipObjetoDBTxt2: TppDBText;
    rpTipObjetoDBTxt3: TppDBText;
    rpTipObjetoDBTxt4: TppDBText;
    rpTipObjetoDBTxt5: TppDBText;
    rpTipObjetoSysVar1: TppSystemVariable;
    rpTipObjetoSysVar2: TppSystemVariable;
    rpTipObjetoDBCalc1: TppDBCalc;
    
    rpTipSent: TppReport;
    ppTipSent: TppBDEPipeline;
    dsTipSent: TwwDataSource;
    qryTipSent: TwwQuery;
    rpTipSentGrp1: TppGroup;    
    rpTipSentHdrBnd: TppHeaderBand;
    rpTipSentGrpHdrBnd: TppGroupHeaderBand;
    rpTipSentGrpFootBnd: TppGroupFooterBand;
    rpTipSentDtlBnd: TppDetailBand;
    rpTipSentFootBnd: TppFooterBand;
    rpTipSentSmryBnd: TppSummaryBand;
    rpTipSentLbl1: TppLabel;
    rpTipSentLbl2: TppLabel;
    rpTipSentLbl3: TppLabel;
    rpTipSentLbl4: TppLabel;
    rpTipSentLbl5: TppLabel;
    rpTipSentLbl6: TppLabel;
    rpTipSentLine1: TppLine;
    rpTipSentDBTxt1: TppDBText;
    rpTipSentDBTxt2: TppDBText;
    rpTipSentDBTxt3: TppDBText;
    rpTipSentSysVar1: TppSystemVariable;
    rpTipSentSysVar2: TppSystemVariable;
    rpTipSentDBCalc1: TppDBCalc;

    rpTipRec: TppReport;
    ppTipRec: TppBDEPipeline;
    dsTipRec: TwwDataSource;
    qryTipRec: TwwQuery;
    rpTipRecGrp1: TppGroup;
    rpTipRecHdrBnd: TppHeaderBand;
    rpTipRecGrpHdrBnd: TppGroupHeaderBand;
    rpTipRecGrpFootBnd: TppGroupFooterBand;
    rpTipRecDtlBnd: TppDetailBand;
    rpTipRecFootBnd: TppFooterBand;
    rpTipRecSmryBnd: TppSummaryBand;
    rpTipRecLbl1: TppLabel;
    rpTipRecLbl2: TppLabel;
    rpTipRecLbl3: TppLabel;
    rpTipRecLbl4: TppLabel;
    rpTipRecLbl5: TppLabel;
    rpTipRecLbl6: TppLabel;
    rpTipRecLbl7: TppLabel;
    rpTipRecLine1: TppLine;
    rpTipRecDBTxt1: TppDBText;
    rpTipRecDBTxt2: TppDBText;
    rpTipRecDBTxt3: TppDBText;
    rpTipRecDBTxt4: TppDBText;
    rpTipRecSysVar1: TppSystemVariable;
    rpTipRecSysVar2: TppSystemVariable;
    rpTipRecDBCalc1: TppDBCalc;
    procedure qryVaraAfterOpen(DataSet: TDataSet);
    procedure qryVaraAfterScroll(DataSet: TDataSet);
    procedure rpVaraSmryBndAfterPrint(Sender: TObject);
  public
    function MostraParam(Form: string): boolean; override;
  end;

var
  dtmRelatoriosComumJurid: TdtmRelatoriosComumJurid;

implementation

uses fAguarde, fParamVara, fParamTipProc, fParamTipAcao, fParamMotivoJur, fParamGrpObjeto,
  fParamTipObjeto, fParamTipSent, fParamTipRec;

{$R *.DFM}

function TdtmRelatoriosComumJurid.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  if (AnsiUpperCase(Form) = 'FRMPARAMVARA') then
    frm := TfrmParamVara.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMTIPPROC') then
    frm := TfrmParamTipProc.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMTIPACAO') then
    frm := TfrmParamTipAcao.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMMOTIVOJUR') then
    frm := TfrmParamMotivoJur.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMGRPOBJETO') then
    frm := TfrmParamGrpObjeto.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMTIPOBJETO') then
    frm := TfrmParamTipObjeto.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMTIPSENT') then
    frm := TfrmParamTipSent.Create(Application)
  else
  if (AnsiUpperCase(Form) = 'FRMPARAMTIPREC') then
    frm := TfrmParamTipRec.Create(Application)
  else
  if (AnsiUpperCase(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  begin
    with (frm) do
    begin
      Result := (ShowModal = mrOk);
      free;
    end;
  end;
end;

// *************************************************************************************
// *************************************************************************************
// Listagem das Varas
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosComumJurid.qryVaraAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
end;

procedure TdtmRelatoriosComumJurid.qryVaraAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosComumJurid.rpVaraSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
