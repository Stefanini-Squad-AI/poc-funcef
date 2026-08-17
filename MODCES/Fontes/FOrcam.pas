unit fOrcam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoal, Db,
  DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, Wwquery,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlCalcRub;

type
  TfrmOrcam = class(TfrmSelPessoal)
    gbxResult: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lblAcum: TLabel;
    ednPes1: TEditNum;
    ednVal1: TEditNum;
    ednVal2: TEditNum;
    ednPes2: TEditNum;
    ednVal3: TEditNum;
    ednPes3: TEditNum;
    ednVal4: TEditNum;
    ednPes4: TEditNum;
    ednVal5: TEditNum;
    ednPes5: TEditNum;
    ednVal6: TEditNum;
    ednPes6: TEditNum;
    ednVal7: TEditNum;
    ednPes7: TEditNum;
    ednVal8: TEditNum;
    ednPes8: TEditNum;
    ednBen1: TEditNum;
    ednBen2: TEditNum;
    ednBen3: TEditNum;
    ednBen4: TEditNum;
    ednBen5: TEditNum;
    ednBen6: TEditNum;
    ednBen7: TEditNum;
    ednBen8: TEditNum;
    ednEnc1: TEditNum;
    ednEnc2: TEditNum;
    ednEnc3: TEditNum;
    ednEnc4: TEditNum;
    ednEnc5: TEditNum;
    ednEnc6: TEditNum;
    ednEnc7: TEditNum;
    ednEnc8: TEditNum;
    ednRes1: TEditNum;
    ednRes2: TEditNum;
    ednRes3: TEditNum;
    ednRes4: TEditNum;
    ednRes5: TEditNum;
    ednRes6: TEditNum;
    ednRes7: TEditNum;
    ednRes8: TEditNum;
    ednValTot: TEditNum;
    ednBenTot: TEditNum;
    ednEncTot: TEditNum;
    ednResTot: TEditNum;
    ednPes9: TEditNum;
    ednPes10: TEditNum;
    ednPes11: TEditNum;
    ednPes12: TEditNum;
    ednVal9: TEditNum;
    ednVal10: TEditNum;
    ednVal11: TEditNum;
    ednVal12: TEditNum;
    ednBen9: TEditNum;
    ednBen10: TEditNum;
    ednBen11: TEditNum;
    ednBen12: TEditNum;
    ednEnc9: TEditNum;
    ednEnc10: TEditNum;
    ednEnc11: TEditNum;
    ednEnc12: TEditNum;
    ednRes9: TEditNum;
    ednRes10: TEditNum;
    ednRes11: TEditNum;
    ednRes12: TEditNum;
    ednPesTot: TEditNum;
    ednPesAcu: TEditNum;
    ednValAcu: TEditNum;
    ednBenAcu: TEditNum;
    ednEncAcu: TEditNum;
    ednResAcu: TEditNum;
    bbtnGrafico: TBitBtn;
    ds2: TwwDataSource;
    tblHstben: TwwQuery;
    tblHstbenDESCRICAO: TStringField;
    tblHstbenANOMESINICIO: TStringField;
    tblHstbenPARCELAS: TFloatField;
    tblHstbenNUMOCORRENCIAS: TFloatField;
    tblHstbenVALORC: TFloatField;
    tblHstbenFLGPERMANENTE: TFloatField;
    tblHstbenIDREGRACALCULO: TFloatField;
    tblHstbenVALORRUBRICA: TFloatField;
    tblHstbenIDRUBRICA: TFloatField;
    Label25: TLabel;
    Label26: TLabel;
    bbtnOrcamento: TBitBtn;
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnGraficoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOrcamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCalcRub: TCtrlCalcRub;
  end;

var
  frmOrcam: TfrmOrcam;
  ValSalario, ValBenef, ValEncargo, ValTotal : array[1..14] of Real;
  NumPessoas : array[1..14] of Integer;
  Parcela : Real;
  VetEditN : Array[1..60] of TEditNum;
  IND, Vez, ItemBenef, NumMeses : Integer;
  RegRegra, RegPessoa, ExeDir, sPlanoOrc: String;

implementation

uses fSelOrcam, uMensErro, fChartOrca, fTelaAut, uFuncoesUteisRH, fLancaOrcam, dBaseDados,
  uSistema;

{$R *.DFM}

procedure TfrmOrcam.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.Initialize(dtmBaseDados.dbBaseDados, true);
end;

procedure TfrmOrcam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCalcRub);
  inherited;
end;

procedure TfrmOrcam.FormShow(Sender: TObject);
begin
  inherited;
  dtmBaseDados.qry.Close;
  with (dtmBaseDados.qry.SQL) do
  begin
    Clear;
    Add('SELECT IDPLANOORCAMEN ');
    Add('FROM PARAMORCAMENTO ');
    Add('WHERE IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  end;
  dtmBaseDados.qry.Open;
  sPlanoOrc := dtmBaseDados.qry.FieldByName('IDPLANOORCAMEN').AsString;
  dtmBaseDados.qry.Close;

  for Ind:=1 to ComponentCount do
    if (Components[Ind-1] is TEditNum) and (Components[Ind-1].Tag > 0) and
       (Components[Ind-1].Tag <= ComponentCount) then
      VetEditN[Components[Ind - 1].Tag] := TEditNum(Components[Ind - 1]);
end;

procedure TfrmOrcam.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  rgSequencia.Visible := false;
  bbtnGrafico.Visible := false;
  bbtnOrcamento.Visible := false;
end;

procedure TfrmOrcam.bbtnGraficoClick(Sender: TObject);
begin
  ItemBenef := frmSelOrcam.rgBenef.ItemIndex;
  NumMeses  := frmSelOrcam.spedMeses.Value;
  for Vez:=1 to 2 do
  begin
    AbrirFormModal(frmChartOrca, TfrmChartOrca);
    frmChartOrca.Free;
  end;
end;

procedure TfrmOrcam.bbtnConfirmarClick(Sender: TObject);
var
  Fator: real;
  ValCalc1: double;
begin
  tblHstben.Close;
  inherited;
  tblHstben.Open;
  ModalResult := mrNone;
  if (frmSelOrcam.rgEncargo.ItemIndex = 1) then
    Fator := StrToFloat(frmSelOrcam.ednPerc2.Text)
  else
    Fator := StrToFloat(frmSelOrcam.ednPerc1.Text);
  Fator  := Fator / 100;
  NumVez := NumVez + 1;
  if (NumVez > 1) then
    if MsgDlg('Acumula com o(s) Anterior(es) ?', LerMensagem(4),
              mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    begin
      ValSalario[14] := 0;
      ValBenef[14]   := 0;
      NumPessoas[14] := 0;
      ValEncargo[14] := 0;
      ValTotal[14]   := 0;
      NumVez := 1;
    end;
  for IND:=1 to 13 do
  begin
    NumPessoas[IND] := 0;
    ValSalario[IND] := 0;
    ValBenef[IND]   := 0;
    ValEncargo[IND] := 0;
    ValTotal[IND]   := 0;
  end;

  while not(ds.Dataset.EOF) do
  begin
    if (ds.Dataset.FieldByName('SALARIOATUAL').Value = Null) then
      VALOR := 0
    else
      VALOR := ds.Dataset.FieldByName('SALARIOATUAL').Value;
    if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'D') then
      VALOR := VALOR * 30;
    if (ds.Dataset.FieldByName('TIPOPAGAMENTO').Value = 'H') then
      VALOR := VALOR * ds.Dataset.FieldByName('JORNADAMENSAL').asInteger;
    // Cálculo do Benefício
    Parcela := 0;
    if (frmSelOrcam.rgBenef.ItemIndex = 0) then
    begin
      tblHstben.First;
      while not(tblHstben.Eof) do
      begin
        if (tblHstben.FieldByName('ANOMESINICIO').Value <= RetornaAnoMes(Date)) and
           ((tblHstben.FieldByName('NUMOCORRENCIAS').Value <>
             tblHstben.FieldByName('PARCELAS').Value) or
            (tblHstben.FieldByName('FLGPERMANENTE').Value = 1) or
            (tblHstben.FieldByName('IDREGRACALCULO').Value = -99)) then
        begin
          if (tblHstBen.FieldByName('VALORRUBRICA').Value = Null) then
            ValCalc1 := 0
          else
            ValCalc1 := tblHstBen.FieldByName('VALORRUBRICA').Value;
          if (tblHstben.FieldByName('IdRegraCalculo').Value <> Null) and
             (tblHstben.FieldByName('IDREGRACALCULO').Value <> -99) then
          begin
            RegRegra  := tblHstben.FieldByName('IdRegraCalculo').AsString;
            RegPessoa := tblPessoal.FieldByName('IDPESSOA').AsString;
            CtrlCalcRub.CalcBeneficioRegra(RegRegra, RegPessoa, ValCalc1);
          end;
          Parcela := Parcela + ValCalc1;
        end;
        tblHstben.Next;
      end;
    end;
    // Final do Cálculo do Benefício
    ValSalario[1] := ValSalario[1] + VALOR;
    ValEncargo[1] := ValEncargo[1] + VALOR * Fator;
    ValBenef[1]   := ValBenef[1]   + Parcela;
    NumPessoas[1] := NumPessoas[1] + 1;
    ds.Dataset.Next;
  end;

  for IND:=1 to frmSelOrcam.spedMeses.Value do
  begin
    if (IND > 1) then
    begin
      ValSalario[IND] := ValSalario[IND-1];
      ValBenef[IND]   := ValBenef[IND-1];
      ValEncargo[IND] := ValEncargo[IND-1];
      ValTotal[IND]   := ValTotal[IND-1];
      NumPessoas[IND] := NumPessoas[IND-1];
    end;
    Fator := StrToFloat(VetEdit[IND].Text) * StrToFloat(VetEdit[IND+12].Text);
    ValSalario[IND] := ValSalario[IND] * Fator;
    ValSalario[13]  := ValSalario[13] + ValSalario[IND];
    ValBenef[IND]   := ValBenef[IND] * Fator;
    ValBenef[13]    := ValBenef[13]   + ValBenef[IND];
    ValEncargo[IND] := ValEncargo[IND] * Fator;
    ValEncargo[13]  := ValEncargo[13] + ValEncargo[IND];
    ValTotal[IND]   := ValSalario[IND] + ValBenef[IND] + ValEncargo[IND];
    ValTotal[13]    := ValTotal[13]   + ValTotal[IND];
    NumPessoas[IND] := round(NumPessoas[IND] * StrToFloat(VetEdit[IND+12].Text));
    NumPessoas[13]  := NumPessoas[13] + NumPessoas[IND];
    VetEditN[IND].Text := IntToStr(NumPessoas[IND]);
    VetEditN[IND+12].Text := FloatToStrF(ValSalario[IND],ffNumber,11,0);
    VetEditN[IND+24].Text := FloatToStrF(ValBenef[IND],ffNumber,11,0);
    VetEditN[IND+36].Text := FloatToStrF(ValEncargo[IND],ffNumber,11,0);
    VetEditN[IND+48].Text := FloatToStrF(ValTotal[IND],ffNumber,11,0);
  end;

  ValSalario[14] := ValSalario[14] + ValSalario[13];
  ValBenef[14]   := ValBenef[14]   + ValBenef[13];
  ValEncargo[14] := ValEncargo[14] + ValEncargo[13];
  ValTotal[14]   := ValTotal[14]   + ValTotal[13];
  NumPessoas[14] := NumPessoas[14] + NumPessoas[13];

  ednPesTot.Text := FloatToStrF(NumPessoas[13] / frmSelOrcam.spedMeses.Value,ffNumber,8,0);
  ednValTot.Text := FloatToStrF(ValSalario[13],ffNumber,11,0);
  ednBenTot.Text := FloatToStrF(ValBenef[13],ffNumber,11,0);
  ednEncTot.Text := FloatToStrF(ValEncargo[13],ffNumber,11,0);
  ednResTot.Text := FloatToStrF(ValTotal[13],ffNumber,11,0);

  ednPesAcu.Text := FloatToStrF(NumPessoas[14] / frmSelOrcam.spedMeses.Value,ffNumber,8,0);
  ednValAcu.Text := FloatToStrF(ValSalario[14],ffNumber,11,0);
  ednBenAcu.Text := FloatToStrF(ValBenef[14],ffNumber,11,0);
  ednEncAcu.Text := FloatToStrF(ValEncargo[14],ffNumber,11,0);
  ednResAcu.Text := FloatToStrF(ValTotal[14],ffNumber,11,0);

  gbxResult.Visible := True;
  ednPesAcu.Visible := (NumVez > 1);
  ednValAcu.Visible := (NumVez > 1);
  ednBenAcu.Visible := (NumVez > 1);
  ednEncAcu.Visible := (NumVez > 1);
  ednResAcu.Visible := (NumVez > 1);
  lblAcum.Visible   := (NumVez > 1);
  if (frmSelOrcam.spedMeses.Value < 12) then
    for IND:=frmSelOrcam.spedMeses.Value + 1 to 12 do
    begin
      VetEditN[IND].Visible    := false;
      VetEditN[IND+12].Visible := false;
      VetEditN[IND+24].Visible := false;
      VetEditN[IND+36].Visible := false;
      VetEditN[IND+48].Visible := false;
    end;
  bbtnGrafico.Visible   := true;
  bbtnOrcamento.Visible := (sPlanoOrc <> '');
end;

procedure TfrmOrcam.bbtnOrcamentoClick(Sender: TObject);
begin
  inherited;
  ItemBenef := frmSelOrcam.rgBenef.ItemIndex;
  NumMeses  := frmSelOrcam.spedMeses.Value;
  AbrirFormModal(frmLancaOrcam, TfrmLancaOrcam);
end;

end.
