unit dRelatoriosAva;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, dReports, ppVar,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, Db, DBTables, Wwquery,
  Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppMemo, ppStrtch,
  ppRegion;

type
  TdtmRelatoriosAva = class(TdtmReports)
    rpFormAvalBranco: TppReport;
    rpFormAvalBrancoHdrBnd: TppHeaderBand;
    rpFormAvalBrancoDtlBnd: TppDetailBand;
    ppFormAvalBranco: TppBDEPipeline;
    dsFormAvalBranco: TwwDataSource;
    qryFormAvalBranco: TwwQuery;
    rpFormAvalBrancoLbl1: TppLabel;
    rpFormAvalBrancoLbl2: TppLabel;
    rpFormAvalBrancoDBTxt1: TppDBText;
    rpFormAvalBrancoCalc1: TppSystemVariable;
    rpFormAvalBrancoCalc2: TppSystemVariable;
    rpFormAvalBrancoDBTxt2: TppDBText;
    rpFormAvalBrancoLbl3: TppLabel;
    rpFormAvalBrancoLbl4: TppLabel;
    rpFormAvalBrancoDBTxt3: TppDBText;
    rpFormAvalBrancoDBTxt4: TppDBText;
    ppLine1: TppLine;
    rpFormAvalBrancoSmryBnd: TppSummaryBand;
    rpFormAvalBrancoDBTxt5: TppDBText;
    rpFormAvalBrancoLbl7: TppLabel;
    rpFormAvalBrancoLbl5: TppLabel;
    rpFormAvalBrancoLbl6: TppLabel;
    ppGroup1: TppGroup;
    rpFormAvalBrancoGrpHdrBnd: TppGroupHeaderBand;
    rpFormAvalBrancoGrpFootBnd: TppGroupFooterBand;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText2: TppDBText;
    ppLabel13: TppLabel;
    ppDBText3: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppLabel10: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    rpFormAvalBrancoRegiaoObserv: TppRegion;
    rpFormAvalBrancoDBObserv: TppDBMemo;
    procedure qryFormAvalBrancoBeforeOpen(DataSet: TDataSet);
    procedure qryFormAvalBrancoAfterOpen(DataSet: TDataSet);
    procedure qryFormAvalBrancoAfterScroll(DataSet: TDataSet);
    procedure rpFormAvalBrancoSmryBndAfterPrint(Sender: TObject);
  private
    bMostraForm: boolean;
  public
    function MostraParam(Form: string): boolean; override;

  end;

var
  dtmRelatoriosAva: TdtmRelatoriosAva;
    bImpObserv: boolean;
    
implementation

uses fAguarde, fParamFormAvalBranco;

{$R *.DFM}

function TdtmRelatoriosAva.MostraParam(Form: string): boolean;
var
  frm: TForm;
begin
  Result := true;
  bMostraForm := true;

  if (UPPERCASE(Form) = 'FRMPARAMFORMAVALBRANCO') then
    frm := TfrmParamFormAvalBranco.Create(Application)
  else
  if (UPPERCASE(Form) = '') then
  begin
    Result := true;
    exit;
  end
  else
    frm := nil;

  if (frm = nil) then
    Result := false
  else
  if (bMostraForm) then
  begin
    Result := (frm.ShowModal = mrOk);
    frm.free;
  end;
end;

// *************************************************************************************
// *************************************************************************************
// Emissão do Formulário de Avaliação
// *************************************************************************************
// *************************************************************************************
procedure TdtmRelatoriosAva.qryFormAvalBrancoBeforeOpen(DataSet: TDataSet);
begin
  frmAguarde.Mostra('Formulário de Avaliação');
  frmAguarde.Pos := 0;
end;

procedure TdtmRelatoriosAva.qryFormAvalBrancoAfterOpen(DataSet: TDataSet);
begin
  frmAguarde.Max := DataSet.RecordCount;
  frmAguarde.Min := 0;
  rpFormAvalBrancoRegiaoObserv.Visible := bImpObserv;
end;

procedure TdtmRelatoriosAva.qryFormAvalBrancoAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TdtmRelatoriosAva.rpFormAvalBrancoSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
