//******************************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 08/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
//******************************************************************************************

unit fParamFaixaSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook,
  IvDictio, IvMulti, IvEMulti, ComCtrls;

type
  TfrmParamFaixaSal = class(TfrmSairAjuda)
    cmbOrderBy: TRadioGroup;
    gbxTipoPapel: TGroupBox;
    cmbTipoPapel: TComboBox;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  end;

var
  frmParamFaixaSal: TfrmParamFaixaSal;

implementation

uses uSistema, uMensErro, uFuncoesUteis, dRelatoriosCes, fAguarde;

{$R *.DFM}

procedure TfrmParamFaixaSal.FormCreate(Sender: TObject);
var
  iPos: integer;
begin
  inherited;
  cmbTipoPapel.Items.Assign (dtmRelatoriosCes.rpFaixaSal.PrinterSetup.PaperNames);

  iPos := ProcuraStList (cmbTipoPapel.Items,'A4');
  if (iPos = -1) then
    cmbTipoPapel. ItemIndex := 0
  else
    cmbTipoPapel. ItemIndex := iPos;

  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmParamFaixaSal.bbtnConfirmarClick(Sender: TObject);
begin
  dtmRelatoriosCes.qryFaixaSal.Close;
  with (dtmRelatoriosCes.qryFaixaSal.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  (' +QuotedStr(Sistema.NomeEmpresa)+ ') AS EMPRESA,');
    Add('  FS.IDFAIXASALARIAL, FS.DATAEFETIV, FS.STEP1, FS.STEP2,');
    Add('  FS.STEP3, FS.STEP4, FS.STEP5, FS.STEP6, FS.STEP7, FS.STEP8, FS.STEP9,');
    Add('  FS.STEP10, FS.STEP11, FS.STEP12, FS.STEP13, FS.STEP14, FS.STEP15, FS.STEP16,'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    Add('  FS.STEP17, FS.STEP18, FS.STEP19, FS.STEP20,');                                  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    Add('  PR.NUMSTEPS, PR.TITSTEP1, PR.TITSTEP2, PR.TITSTEP3, PR.TITSTEP4, PR.TITSTEP5,');
    Add('  PR.TITSTEP6, PR.TITSTEP7, PR.TITSTEP8, PR.TITSTEP9,');
    Add('  PR.TITSTEP10, PR.TITSTEP11, PR.TITSTEP12, PR.TITSTEP13, PR.TITSTEP14, PR.TITSTEP15,'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    Add('  PR.TITSTEP16, PR.TITSTEP17, PR.TITSTEP18, PR.TITSTEP19, PR.TITSTEP20'); // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    Add('FROM');
    Add('  FAIXASAL FS, PARAMRH PR');
    Add('ORDER BY');
    case (cmbOrderBy.ItemIndex) of
      0 : Add('  IDFAIXASALARIAL');
      1 : Add('  DATAEFETIV');
    end;
    SaveToFile ('c:\qry.txt');
  end;

  with (dtmRelatoriosCes) do
  begin
    qryFaixaSal.Open;
    if not(qryFaixaSal.IsEmpty) then
    begin
      frmAguarde.Mostra ('Emissão das Faixas Salariais');
      frmAguarde.Pos := 0;

      frmAguarde.Max := qryFaixaSal.RecordCount;
      frmAguarde.Min := 0;

      FaixaSalDBTxt3.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 1);
      FaixaSalLbl5.Visible    := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 1);
      FaixaSalDBTxt4.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 2);
      FaixaSalLbl6.Visible    := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 2);
      FaixaSalDBTxt5.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 3);
      FaixaSalLbl7.Visible    := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 3);
      FaixaSalDBTxt6.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 4);
      FaixaSalLbl8.Visible    := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 4);
      FaixaSalDBTxt7.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 5);
      FaixaSalLbl9.Visible    := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 5);
      FaixaSalDBTxt8.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 6);
      FaixaSalLbl10.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 6);
      FaixaSalDBTxt9.Visible  := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 7);
      FaixaSalLbl11.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 7);
      FaixaSalDBTxt10.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 8);
      FaixaSalLbl12.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 8);
      FaixaSalDBTxt11.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 9);
      FaixaSalLbl13.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 9);
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613
      FaixaSalDBTxt12.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 10);
      FaixaSalLbl14.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 10);
      FaixaSalDBTxt13.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 11);
      FaixaSalLbl15.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 11);
      FaixaSalDBTxt14.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 12);
      FaixaSalLbl16.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 12);
      FaixaSalDBTxt15.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 13);
      FaixaSalLbl17.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 13);
      FaixaSalDBTxt16.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 14);
      FaixaSalLbl18.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 14);
      FaixaSalDBTxt17.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 15);
      FaixaSalLbl19.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 15);
      FaixaSalDBTxt18.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 16);
      FaixaSalLbl20.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 16);
      FaixaSalDBTxt19.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 17);
      FaixaSalLbl21.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 17);
      FaixaSalDBTxt20.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 18);
      FaixaSalLbl22.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 18);
      FaixaSalDBTxt21.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 19);
      FaixaSalLbl23.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 19);
      FaixaSalDBTxt22.Visible := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 20);
      FaixaSalLbl24.Visible   := (qryFaixaSal.FieldByName('NUMSTEPS').asInteger >= 20);
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim

      FaixaSalLbl5.Caption  := qryFaixaSal.FieldByName('TITSTEP1').asString;
      FaixaSalLbl6.Caption  := qryFaixaSal.FieldByName('TITSTEP2').asString;
      FaixaSalLbl7.Caption  := qryFaixaSal.FieldByName('TITSTEP3').asString;
      FaixaSalLbl8.Caption  := qryFaixaSal.FieldByName('TITSTEP4').asString;
      FaixaSalLbl9.Caption  := qryFaixaSal.FieldByName('TITSTEP5').asString;
      FaixaSalLbl10.Caption := qryFaixaSal.FieldByName('TITSTEP6').asString;
      FaixaSalLbl11.Caption := qryFaixaSal.FieldByName('TITSTEP7').asString;
      FaixaSalLbl12.Caption := qryFaixaSal.FieldByName('TITSTEP8').asString;
      FaixaSalLbl13.Caption := qryFaixaSal.FieldByName('TITSTEP9').asString;
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613
      FaixaSalLbl14.Caption := qryFaixaSal.FieldByName('TITSTEP10').asString;
      FaixaSalLbl15.Caption := qryFaixaSal.FieldByName('TITSTEP11').asString;
      FaixaSalLbl16.Caption := qryFaixaSal.FieldByName('TITSTEP12').asString;
      FaixaSalLbl17.Caption := qryFaixaSal.FieldByName('TITSTEP13').asString;
      FaixaSalLbl18.Caption := qryFaixaSal.FieldByName('TITSTEP14').asString;
      FaixaSalLbl19.Caption := qryFaixaSal.FieldByName('TITSTEP15').asString;
      FaixaSalLbl20.Caption := qryFaixaSal.FieldByName('TITSTEP16').asString;
      FaixaSalLbl21.Caption := qryFaixaSal.FieldByName('TITSTEP17').asString;
      FaixaSalLbl22.Caption := qryFaixaSal.FieldByName('TITSTEP18').asString;
      FaixaSalLbl23.Caption := qryFaixaSal.FieldByName('TITSTEP19').asString;
      FaixaSalLbl24.Caption := qryFaixaSal.FieldByName('TITSTEP20').asString;
      // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim

      rpFaixaSal.PrinterSetup.PaperName := cmbTipoPapel.Items[cmbTipoPapel.ItemIndex];
    end
    else
    begin
      ModalResult := mrNone;
      frmAguarde.Apaga;
      MsgDlg('Não há dados a serem exibidos! Verifique.','Aviso',mtInformation,[mbOk,mbHelp],0);
    end;
  end;
end;

end.
