//******************************************************************************
//N. Sol..........: 171426
//N. Kintana......: 1537613
//Data............: 10/03/2012
//Responsável.....: Edilaine Ferraresi
//Descrição.......: Inclusão de novas faixas salariais (de 9 para 20)
// *****************************************************************************

unit FCadFaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, wwdbedit, DBTables, Wwtable, Wwquery,
  TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, 
  MontaSelect, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  CmEventosCadastro, ImgList;

type
  TfrmCadFaixa = class(TFrmCadastroGridCS)
    qryIDFAIXASALARIAL: TFloatField;
    qrySTEP1: TFloatField;
    qryDATAEFETIV: TDateTimeField;
    qrySTEP2: TFloatField;
    qrySTEP3: TFloatField;
    qrySTEP4: TFloatField;
    qrySTEP5: TFloatField;
    qrySTEP6: TFloatField;
    qrySTEP7: TFloatField;
    qrySTEP8: TFloatField;
    qrySTEP9: TFloatField;
    qryParamRH: TwwQuery;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    Label2: TLabel;
    DBDateEdit1: TCMDateTimePicker;
    lblTit9: TLabel;
    dbredVal9: TDBRealEdit;
    lblTit8: TLabel;
    dbredVal8: TDBRealEdit;
    lblTit7: TLabel;
    dbredVal7: TDBRealEdit;
    lblTit6: TLabel;
    dbredVal6: TDBRealEdit;
    lblTit5: TLabel;
    dbredVal5: TDBRealEdit;
    lblTit4: TLabel;
    dbredVal4: TDBRealEdit;
    lblTit3: TLabel;
    dbredVal3: TDBRealEdit;
    lblTit2: TLabel;
    dbredVal2: TDBRealEdit;
    lblTit1: TLabel;
    dbredVal1: TDBRealEdit;
    pnlHistFaixa: TPanel;
    lblHistFaixa: TLabel;
    dbGridHistFaixa: TwwDBGrid;
    bbtnHistFaixa: TToolbarButton97;
    dsHistFaixa: TwwDataSource;
    qryHistFaixa: TwwQuery;
    qryHistFaixaDATAEFETIVACAO: TDateTimeField;
    qryHistFaixaIDFAIXASALEXT: TFloatField;
    qryHistFaixaVALOR: TFloatField;
    lblTit10: TLabel;
    dbredVal10: TDBRealEdit;
    bvFx1: TBevel;
    lblTit19: TLabel;
    lblTit18: TLabel;
    lblTit17: TLabel;
    lblTit16: TLabel;
    lblTit15: TLabel;
    lblTit14: TLabel;
    lblTit13: TLabel;
    lblTit12: TLabel;
    lblTit11: TLabel;
    dbredVal19: TDBRealEdit;
    dbredVal18: TDBRealEdit;
    dbredVal17: TDBRealEdit;
    dbredVal16: TDBRealEdit;
    dbredVal15: TDBRealEdit;
    dbredVal14: TDBRealEdit;
    dbredVal13: TDBRealEdit;
    dbredVal12: TDBRealEdit;
    dbredVal11: TDBRealEdit;
    lblTit20: TLabel;
    dbredVal20: TDBRealEdit;
    bvFx2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure bbtnHistFaixaClick(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFaixa: TfrmCadFaixa;

implementation

uses dBaseDados, UIntegraPrevRH, uSistema, fAguarde;

//uses bBaseDados;

{$R *.DFM}

procedure TfrmCadFaixa.FormCreate(Sender: TObject);
var
  I, iNumSteps: integer;
begin
  with (qryParamRH) do
  begin
    Open;
    iNumSteps := FieldByName('NUMSTEPS').asInteger;
    inherited;
    dbredVal1.Visible := (iNumSteps >= 1);
    lblTit1.Visible   := (iNumSteps >= 1);
    dbredVal2.Visible := (iNumSteps >= 2);
    lblTit2.Visible   := (iNumSteps >= 2);
    dbredVal3.Visible := (iNumSteps >= 3);
    lblTit3.Visible   := (iNumSteps >= 3);
    dbredVal4.Visible := (iNumSteps >= 4);
    lblTit4.Visible   := (iNumSteps >= 4);
    dbredVal5.Visible := (iNumSteps >= 5);
    lblTit5.Visible   := (iNumSteps >= 5);
    dbredVal6.Visible := (iNumSteps >= 6);
    lblTit6.Visible   := (iNumSteps >= 6);
    dbredVal7.Visible := (iNumSteps >= 7);
    lblTit7.Visible   := (iNumSteps >= 7);
    dbredVal8.Visible := (iNumSteps >= 8);
    lblTit8.Visible   := (iNumSteps >= 8);
    dbredVal9.Visible := (iNumSteps >= 9);
    lblTit9.Visible   := (iNumSteps >= 9);
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    dbredVal10.Visible := (iNumSteps >= 10);
    lblTit10.Visible   := (iNumSteps >= 10);
    dbredVal11.Visible := (iNumSteps >= 11);
    lblTit11.Visible   := (iNumSteps >= 11);
    dbredVal12.Visible := (iNumSteps >= 12);
    lblTit12.Visible   := (iNumSteps >= 12);
    dbredVal13.Visible := (iNumSteps >= 13);
    lblTit13.Visible   := (iNumSteps >= 13);
    dbredVal14.Visible := (iNumSteps >= 14);
    lblTit14.Visible   := (iNumSteps >= 14);
    dbredVal15.Visible := (iNumSteps >= 15);
    lblTit15.Visible   := (iNumSteps >= 15);
    dbredVal16.Visible := (iNumSteps >= 16);
    lblTit16.Visible   := (iNumSteps >= 16);
    dbredVal17.Visible := (iNumSteps >= 17);
    lblTit17.Visible   := (iNumSteps >= 17);
    dbredVal18.Visible := (iNumSteps >= 18);
    lblTit18.Visible   := (iNumSteps >= 18);
    dbredVal19.Visible := (iNumSteps >= 19);
    lblTit19.Visible   := (iNumSteps >= 19);
    dbredVal20.Visible := (iNumSteps >= 20);
    lblTit20.Visible   := (iNumSteps >= 20);
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim

    lblTit1.Caption := FieldByName('TITSTEP1').asString;
    lblTit2.Caption := FieldByName('TITSTEP2').asString;
    lblTit3.Caption := FieldByName('TITSTEP3').asString;
    lblTit4.Caption := FieldByName('TITSTEP4').asString;
    lblTit5.Caption := FieldByName('TITSTEP5').asString;
    lblTit6.Caption := FieldByName('TITSTEP6').asString;
    lblTit7.Caption := FieldByName('TITSTEP7').asString;
    lblTit8.Caption := FieldByName('TITSTEP8').asString;
    lblTit9.Caption := FieldByName('TITSTEP9').asString;
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    lblTit10.Caption := FieldByName('TITSTEP10').asString;
    lblTit11.Caption := FieldByName('TITSTEP11').asString;
    lblTit12.Caption := FieldByName('TITSTEP12').asString;
    lblTit13.Caption := FieldByName('TITSTEP13').asString;
    lblTit14.Caption := FieldByName('TITSTEP14').asString;
    lblTit15.Caption := FieldByName('TITSTEP15').asString;
    lblTit16.Caption := FieldByName('TITSTEP16').asString;
    lblTit17.Caption := FieldByName('TITSTEP17').asString;
    lblTit18.Caption := FieldByName('TITSTEP18').asString;
    lblTit19.Caption := FieldByName('TITSTEP19').asString;
    lblTit20.Caption := FieldByName('TITSTEP20').asString;
    // Edilaine Ferraresi - SOL 171426 / KTN 1537613 - fim
  {
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('Select IDFAIXASALARIAL, DATAEFETIV,');
    for I:=1 to FieldByName('NUMSTEPS').Value  do begin
      qry.SQL.Add('STEP' + IntToStr(I));
      if  (I < FieldByName('NUMSTEPS').Value) then
         qry.SQL.Add(',');
    end;
    qry.SQL.Add(' from FAIXASAL order by IDFAIXASALARIAL');
  }
    qry.Open;
    qry.FieldByName('DATAEFETIV').DisplayLabel      := 'Data Efetivação';
    qry.FieldByName('IDFAIXASALARIAL').DisplayLabel := 'Código';

    for I:=1 to 20 {9} do  // Edilaine Ferraresi - SOL 171426 / KTN 1537613
    begin
      qry.FieldByName('STEP' + IntToStr(I)).Visible := (I <= FieldByName('NUMSTEPS').asInteger);
      qry.FieldByName('STEP'+IntToStr(I)).DisplayLabel :=
        FieldByName('TITSTEP' + IntToStr(I)).asString;
    end;

  {
    if  FieldByName('NUMSTEPS').Value >= 1  then
        dbredVal1.DataField := 'STEP1';
    if  FieldByName('NUMSTEPS').Value >= 2  then
        dbredVal2.DataField := 'STEP2';
    if  FieldByName('NUMSTEPS').Value >= 3  then
        dbredVal3.DataField := 'STEP3';
    if  FieldByName('NUMSTEPS').Value >= 4  then
        dbredVal4.DataField := 'STEP4';
    if  FieldByName('NUMSTEPS').Value >= 5  then
        dbredVal5.DataField := 'STEP5';
    if  FieldByName('NUMSTEPS').Value >= 6  then
        dbredVal6.DataField := 'STEP6';
    if  FieldByName('NUMSTEPS').Value >= 7  then
        dbredVal7.DataField := 'STEP7';
    if  FieldByName('NUMSTEPS').Value >= 8  then
        dbredVal8.DataField := 'STEP8';
    if  FieldByName('NUMSTEPS').Value >= 9  then
        dbredVal9.DataField := 'STEP9';
  }
  end;

  // Verifica a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
      Add('SELECT TIPOEMPRESA ');
      Add('FROM EMPRESAPROP ');
      Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  end;
  dtmBaseDados.qry.Open;
  bbtnHistFaixa.Visible := (dtmBaseDados.qry.FieldByName('TIPOEMPRESA').asString = 'P');
  dtmBaseDados.qry.Close;
  if (bbtnHistFaixa.Visible) then
     qryHistFaixa.Open;

end;

procedure TfrmCadFaixa.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Chama a rotina de integraçao dos sistemas previdenciarios com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (bbtnHistFaixa.Visible) then
  begin
    frmAguarde.Mostra('Atualizando o Histórico das Faixas');
    frmAguarde.Pos := 0;
    dtmBaseDados.dbBaseDados.StartTransaction;
    if (AtualizaFaixasSalariais(Sistema.IdEmpresa)) then
    begin
      dtmBaseDados.dbBaseDados.Commit;
      qryHistFaixa.Close;
      qryHistFaixa.Open;
    end
    else
      dtmBaseDados.dbBaseDados.RollBack;
    frmAguarde.Apaga;
  end;

end;

procedure TfrmCadFaixa.bbtnHistFaixaClick(Sender: TObject);
begin
  inherited;
  pnlHistFaixa.Visible := not (pnlHistFaixa.Visible);
  //ListaHistFaixa (qry.FieldByName('CODGRPFUNC').asString);
end;

procedure TfrmCadFaixa.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  lblHistFaixa.Caption := 'Histórico da Faixa ' + qry.FieldByName('IDFAIXASALARIAL').asString;
end;

end.
