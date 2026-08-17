//******************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************


unit RFaixaSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCmReport, Db,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands, ppVar,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, uCmRptManager,
  TXComp, CmParamReport, TXRB;

type
  TRptFaixaSal = class(TFrmCmReport)
    rpFaixaSal: TppReport;
    FaixaSalHdrBnd1: TppHeaderBand;
    FaixaSalLbl1: TppLabel;
    FaixaSalLbl2: TppLabel;
    FaixaSalLbl3: TppLabel;
    FaixaSalLbl4: TppLabel;
    FaixaSalLbl5: TppLabel;
    FaixaSalLine1: TppLine;
    FaixaSalLbl25: TppLabel;
    FaixaSalDBTxt1: TppDBText;
    FaixaSalLbl6: TppLabel;
    FaixaSalLbl7: TppLabel;
    FaixaSalLbl8: TppLabel;
    FaixaSalLbl9: TppLabel;
    FaixaSalLbl10: TppLabel;
    FaixaSalLbl11: TppLabel;
    FaixaSalLbl12: TppLabel;
    FaixaSalLbl13: TppLabel;
    FaixaSalCalc1: TppSystemVariable;
    FaixaSalCalc2: TppSystemVariable;
    FaixaSalDtlBnd1: TppDetailBand;
    FaixaSalDBTxt2: TppDBText;
    FaixaSalDBTxt3: TppDBText;
    FaixaSalDBTxt4: TppDBText;
    FaixaSalDBTxt5: TppDBText;
    FaixaSalDBTxt6: TppDBText;
    FaixaSalDBTxt7: TppDBText;
    FaixaSalDBTxt8: TppDBText;
    FaixaSalDBTxt9: TppDBText;
    FaixaSalDBTxt10: TppDBText;
    FaixaSalDBTxt11: TppDBText;
    FaixaSalDBTxt25: TppDBText;
    FaixaSalFootBnd1: TppFooterBand;
    ppFaixaSal: TppBDEPipeline;
    dsFaixaSal: TwwDataSource;
    sqlFaixaSal: TCMSqlParams;
    CdsFaixaSal: TCMClientDataSet;
    rpFaixaSalSmryBnd: TppSummaryBand;
    FaixaSalLbl14: TppLabel;
    FaixaSalLbl15: TppLabel;
    FaixaSalLbl16: TppLabel;
    FaixaSalLbl17: TppLabel;
    FaixaSalLbl18: TppLabel;
    FaixaSalLbl19: TppLabel;
    FaixaSalLbl20: TppLabel;
    FaixaSalLbl21: TppLabel;
    FaixaSalLbl22: TppLabel;
    FaixaSalLbl23: TppLabel;
    FaixaSalLbl24: TppLabel;
    FaixaSalDBTxt12: TppDBText;
    FaixaSalDBTxt13: TppDBText;
    FaixaSalDBTxt14: TppDBText;
    FaixaSalDBTxt15: TppDBText;
    FaixaSalDBTxt16: TppDBText;
    FaixaSalDBTxt17: TppDBText;
    FaixaSalDBTxt18: TppDBText;
    FaixaSalDBTxt19: TppDBText;
    FaixaSalDBTxt20: TppDBText;
    FaixaSalDBTxt21: TppDBText;
    FaixaSalDBTxt22: TppDBText;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CdsFaixaSalAfterScroll(DataSet: TDataSet);
    procedure rpFaixaSalSmryBndAfterPrint(Sender: TObject);
  end;

var
  RptFaixaSal: TRptFaixaSal;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TRptFaixaSal.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  with (sqlFaixaSal.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  FS.IDFAIXASALARIAL, FS.DATAEFETIV, FS.STEP1, FS.STEP2,');
    Add('  FS.STEP3, FS.STEP4, FS.STEP5, FS.STEP6, FS.STEP7, FS.STEP8, FS.STEP9,');
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    Add('  FS.STEP10, FS.STEP11, FS.STEP12, FS.STEP13, FS.STEP14, FS.STEP15, FS.STEP16,');
    Add('  FS.STEP17, FS.STEP18, FS.STEP19, FS.STEP20,');
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
    Add('  PR.NUMSTEPS, PR.TITSTEP1, PR.TITSTEP2, PR.TITSTEP3, PR.TITSTEP4, PR.TITSTEP5,');
    Add('  PR.TITSTEP6, PR.TITSTEP7, PR.TITSTEP8, PR.TITSTEP9,');
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    Add('  PR.TITSTEP10, PR.TITSTEP11, PR.TITSTEP12, PR.TITSTEP13, PR.TITSTEP14, PR.TITSTEP15,');
    Add('  PR.TITSTEP16, PR.TITSTEP17, PR.TITSTEP18, PR.TITSTEP19, PR.TITSTEP20');
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
    Add('FROM');
    Add('  FAIXASAL FS, PARAMRH PR');
    Add('ORDER BY');
    case (CmpRptCM.ParamByName('Ordenacao').asInteger) of
      0 : Add('  IDFAIXASALARIAL');
      1 : Add('  DATAEFETIV');
    end;
    SaveToFile('c:\qry.txt');
  end;
  sqlFaixaSal.Open;

  if not(CdsFaixaSal.IsEmpty) then
  begin
    frmAguarde.Mostra('Emissão das Faixas Salariais');
    frmAguarde.Pos := 0;

    frmAguarde.Max := CdsFaixaSal.RecordCount;
    frmAguarde.Min := 0;

    FaixaSalDBTxt3.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 1);
    FaixaSalLbl5.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 1);
    FaixaSalDBTxt4.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 2);
    FaixaSalLbl6.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 2);
    FaixaSalDBTxt5.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 3);
    FaixaSalLbl7.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 3);
    FaixaSalDBTxt6.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 4);
    FaixaSalLbl8.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 4);
    FaixaSalDBTxt7.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 5);
    FaixaSalLbl9.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 5);
    FaixaSalDBTxt8.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 6);
    FaixaSalLbl10.Visible   := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 6);
    FaixaSalDBTxt9.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 7);
    FaixaSalLbl11.Visible   := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 7);
    FaixaSalDBTxt10.Visible := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 8);
    FaixaSalLbl12.Visible   := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 8);
    FaixaSalDBTxt11.Visible := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 9);
    FaixaSalLbl13.Visible   := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 9);
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    FaixaSalDBTxt12.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 10);
    FaixaSalLbl14.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 10);
    FaixaSalDBTxt13.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 11);
    FaixaSalLbl15.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 11);
    FaixaSalDBTxt14.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 12);
    FaixaSalLbl16.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 12);
    FaixaSalDBTxt15.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 13);
    FaixaSalLbl17.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 13);
    FaixaSalDBTxt16.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 14);
    FaixaSalLbl18.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 14);
    FaixaSalDBTxt17.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 15);
    FaixaSalLbl19.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 15);
    FaixaSalDBTxt18.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 16);
    FaixaSalLbl20.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 16);
    FaixaSalDBTxt19.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 17);
    FaixaSalLbl21.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 17);
    FaixaSalDBTxt20.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 18);
    FaixaSalLbl22.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 18);
    FaixaSalDBTxt21.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 19);
    FaixaSalLbl23.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 19);
    FaixaSalDBTxt22.Visible  := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 20);
    FaixaSalLbl24.Visible    := (CdsFaixaSal.FieldByName('NUMSTEPS').asInteger >= 20);
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim

    FaixaSalLbl5.Caption  := CdsFaixaSal.FieldByName('TITSTEP1').asString;
    FaixaSalLbl6.Caption  := CdsFaixaSal.FieldByName('TITSTEP2').asString;
    FaixaSalLbl7.Caption  := CdsFaixaSal.FieldByName('TITSTEP3').asString;
    FaixaSalLbl8.Caption  := CdsFaixaSal.FieldByName('TITSTEP4').asString;
    FaixaSalLbl9.Caption  := CdsFaixaSal.FieldByName('TITSTEP5').asString;
    FaixaSalLbl10.Caption := CdsFaixaSal.FieldByName('TITSTEP6').asString;
    FaixaSalLbl11.Caption := CdsFaixaSal.FieldByName('TITSTEP7').asString;
    FaixaSalLbl12.Caption := CdsFaixaSal.FieldByName('TITSTEP8').asString;
    FaixaSalLbl13.Caption := CdsFaixaSal.FieldByName('TITSTEP9').asString;
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    FaixaSalLbl14.Caption := CdsFaixaSal.FieldByName('TITSTEP10').asString;
    FaixaSalLbl15.Caption := CdsFaixaSal.FieldByName('TITSTEP11').asString;
    FaixaSalLbl16.Caption := CdsFaixaSal.FieldByName('TITSTEP12').asString;
    FaixaSalLbl17.Caption := CdsFaixaSal.FieldByName('TITSTEP13').asString;
    FaixaSalLbl18.Caption := CdsFaixaSal.FieldByName('TITSTEP14').asString;
    FaixaSalLbl19.Caption := CdsFaixaSal.FieldByName('TITSTEP15').asString;
    FaixaSalLbl20.Caption := CdsFaixaSal.FieldByName('TITSTEP16').asString;
    FaixaSalLbl21.Caption := CdsFaixaSal.FieldByName('TITSTEP17').asString;
    FaixaSalLbl22.Caption := CdsFaixaSal.FieldByName('TITSTEP18').asString;
    FaixaSalLbl23.Caption := CdsFaixaSal.FieldByName('TITSTEP19').asString;
    FaixaSalLbl24.Caption := CdsFaixaSal.FieldByName('TITSTEP20').asString;
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
  end
end;

procedure TRptFaixaSal.CdsFaixaSalAfterScroll(DataSet: TDataSet);
begin
  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
end;

procedure TRptFaixaSal.rpFaixaSalSmryBndAfterPrint(Sender: TObject);
begin
  frmAguarde.Apaga;
end;

end.
