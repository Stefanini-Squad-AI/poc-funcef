unit fSelOrcam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, TB97, ComCtrls,
  TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, fSelPessoalMT,
  uCmSqlParams, DBClient, CmParamReport, uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, TREdit,
  uCtrlCalcRub, uCtrlEncar, uCtrlListTerceirosRH, uCtrlColetaSal;

type
  TfrmSelOrcam = class(TfrmSelPessoalMT)
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
    ednPes1: TRealEdit;
    ednVal1: TRealEdit;
    ednVal2: TRealEdit;
    ednPes2: TRealEdit;
    ednVal3: TRealEdit;
    ednPes3: TRealEdit;
    ednVal4: TRealEdit;
    ednPes4: TRealEdit;
    ednVal5: TRealEdit;
    ednPes5: TRealEdit;
    ednVal6: TRealEdit;
    ednPes6: TRealEdit;
    ednVal7: TRealEdit;
    ednPes7: TRealEdit;
    ednVal8: TRealEdit;
    ednPes8: TRealEdit;
    ednBen1: TRealEdit;
    ednBen2: TRealEdit;
    ednBen3: TRealEdit;
    ednBen4: TRealEdit;
    ednBen5: TRealEdit;
    ednBen6: TRealEdit;
    ednBen7: TRealEdit;
    ednBen8: TRealEdit;
    ednEnc1: TRealEdit;
    ednEnc2: TRealEdit;
    ednEnc3: TRealEdit;
    ednEnc4: TRealEdit;
    ednEnc5: TRealEdit;
    ednEnc6: TRealEdit;
    ednEnc7: TRealEdit;
    ednEnc8: TRealEdit;
    ednTot1: TRealEdit;
    ednTot2: TRealEdit;
    ednTot3: TRealEdit;
    ednTot4: TRealEdit;
    ednTot5: TRealEdit;
    ednTot6: TRealEdit;
    ednTot7: TRealEdit;
    ednTot8: TRealEdit;
    ednVal13: TRealEdit;
    ednBen13: TRealEdit;
    ednEnc13: TRealEdit;
    ednTot13: TRealEdit;
    ednPes9: TRealEdit;
    ednPes10: TRealEdit;
    ednPes11: TRealEdit;
    ednPes12: TRealEdit;
    ednVal9: TRealEdit;
    ednVal10: TRealEdit;
    ednVal11: TRealEdit;
    ednVal12: TRealEdit;
    ednBen9: TRealEdit;
    ednBen10: TRealEdit;
    ednBen11: TRealEdit;
    ednBen12: TRealEdit;
    ednEnc9: TRealEdit;
    ednEnc10: TRealEdit;
    ednEnc11: TRealEdit;
    ednEnc12: TRealEdit;
    ednTot9: TRealEdit;
    ednTot10: TRealEdit;
    ednTot11: TRealEdit;
    ednTot12: TRealEdit;
    ednPes13: TRealEdit;
    ednPes14: TRealEdit;
    ednVal14: TRealEdit;
    ednBen14: TRealEdit;
    ednEnc14: TRealEdit;
    ednTot14: TRealEdit;
    Label25: TLabel;
    Label26: TLabel;
    tbshConsulta: TTabSheet;
    Label27: TLabel;
    spedMeses: TSpinEdit;
    rgEncargo: TRadioGroup;
    rgBenef: TRadioGroup;
    dbgrEncargo: TwwDBGrid;
    super: TGroupBox;
    EditNum1: TRealEdit;
    EditNum2: TRealEdit;
    EditNum3: TRealEdit;
    EditNum4: TRealEdit;
    EditNum5: TRealEdit;
    EditNum6: TRealEdit;
    EditNum7: TRealEdit;
    EditNum8: TRealEdit;
    EditNum9: TRealEdit;
    EditNum10: TRealEdit;
    EditNum11: TRealEdit;
    EditNum12: TRealEdit;
    gbxEfetivo: TGroupBox;
    EditNum13: TRealEdit;
    EditNum14: TRealEdit;
    EditNum15: TRealEdit;
    EditNum16: TRealEdit;
    EditNum17: TRealEdit;
    EditNum18: TRealEdit;
    EditNum19: TRealEdit;
    EditNum20: TRealEdit;
    EditNum21: TRealEdit;
    EditNum22: TRealEdit;
    EditNum23: TRealEdit;
    EditNum24: TRealEdit;
    CdsEncargo: TCMClientDataSet;
    Toolbar971: TToolbar97;
    ToolbarSep972: TToolbarSep97;
    bbtnGrafico: TBitBtn;
    bbtnOrcamento: TBitBtn;
    dsEncargo: TwwDataSource;
    CdsHistorico: TCMClientDataSet;
    ednPerc1: TRealEdit;
    ednPerc2: TRealEdit;
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnGraficoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOrcamentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgEncargoClick(Sender: TObject);
    procedure spedMesesChange(Sender: TObject);
  private
    CtrlCalcRub: TCtrlCalcRub;
    CtrlEncar: TCtrlEncar;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlColetaSal: TCtrlColetaSal;

    VetEditNumPess, VetEditSalario, VetEditBenef,
    VetEditEncargos, VetEditTotais: array[1..14] of TRealEdit;
    VetEditIndice: array[1..24] of TRealEdit;
    NumPessoas: array[1..14] of integer;
    ValSalario, ValBenef, ValEncargo, ValTotal: array[1..14] of double;
    IdPlano: double;
    iNumVez: Integer;
    sIdEstab, sIdCargo: string;
  end;

var
  frmSelOrcam: TfrmSelOrcam;

implementation

uses uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, fLancaOrcam, fChartOrca,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmSelOrcam.FormCreate(Sender: TObject);
var
  c: byte;
  dTotPerc: double;
begin
  inherited;
  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);

  CtrlEncar := TCtrlEncar.Create;
  CtrlEncar.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlColetaSal := TCtrlColetaSal.Create;
  CtrlColetaSal.InitializeAs(Padroes);

  CdsEncargo.Data := CtrlEncar.ListGeral;
  iNumVez := 0;

  for c:=1 to 24 do
  begin
    VetEditIndice[c] := TRealEdit(Self.FindComponent('EditNum'+IntToStr(c)));
    TRealEdit(Self.FindComponent('EditNum'+IntToStr(c))).Value := 1.0000;
  end;

  for c:=1 to 14 do
  begin
    VetEditNumPess[c] := TRealEdit(Self.FindComponent('ednPes'+IntToStr(c)));
    VetEditSalario[c] := TRealEdit(Self.FindComponent('ednVal'+IntToStr(c)));
    VetEditBenef[c] := TRealEdit(Self.FindComponent('ednBen'+IntToStr(c)));
    VetEditEncargos[c] := TRealEdit(Self.FindComponent('ednEnc'+IntToStr(c)));
    VetEditTotais[c] := TRealEdit(Self.FindComponent('ednTot'+IntToStr(c)));
  end;

  dTotPerc := 0;
  CdsEncargo.First;
  while not(CdsEncargo.EOF) do
  begin
    dTotPerc := dTotPerc + CdsEncargo.FieldByName('PERCENCARGO').asFloat;
    CdsEncargo.Next;
  end;
  ednPerc2.Text := FloatToStr(dTotPerc);
  CdsEncargo.First;

  IdPlano := CtrlListTerceirosRH.GetIdPlanoOrcamentario(Sistema.IdEmpresa);
  IrPaginaResult := false;
end;

procedure TfrmSelOrcam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCalcRub);
  FreeAndNil(CtrlEncar);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlColetaSal);
  inherited;
end;

procedure TfrmSelOrcam.spedMesesChange(Sender: TObject);
var
  c: byte;
begin
  for c:=1 to 12 do
  begin
    VetEditIndice[c].Visible := (c <= spedMeses.Value);
    VetEditIndice[c+12].Visible := (c <= spedMeses.Value);
  end;
end;

procedure TfrmSelOrcam.rgEncargoClick(Sender: TObject);
begin
  ednPerc1.Visible := (rgEncargo.ItemIndex = 0);
  ednPerc2.Visible := (rgEncargo.ItemIndex = 1);
  dbgrEncargo.Visible := (rgEncargo.ItemIndex = 1);
end;

procedure TfrmSelOrcam.bbtnGraficoClick(Sender: TObject);
var
  c: byte;
begin
  with TfrmChartOrca.Create(Application) do
  begin
    NumMeses := spedMeses.Value;
    SelecionaBeneficios := (rgBenef.ItemIndex = 0);
    TotalGeral := ednTot13.Value;
    for c:=1 to 14 do
    begin
      NumPessoas[c] := Self.NumPessoas[c];
      ValSalario[c] := Self.ValSalario[c];
      ValBenef[c] := Self.ValBenef[c];
      ValEncargo[c] := Self.ValEncargo[c];
      ValTotal[c] := Self.ValTotal[c];
    end;
    ShowModal;
    Free;
  end;
end;

procedure TfrmSelOrcam.bbtnOrcamentoClick(Sender: TObject);
var
  c: byte;
  LancaOrcam: TfrmLancaOrcam;
begin
  LancaOrcam := TfrmLancaOrcam.Create(Application);
  with (LancaOrcam) do
  begin
    NumMeses := spedMeses.Value;
    IdPlanoOrcamentario := IdPlano;
    SelecionaBeneficios := (rgBenef.ItemIndex = 0);
    sEstab := sIdEstab;
    sCargo := sIdCargo;
    sCentroCusto := dblckCCusto.Text;
    for c:=1 to 14 do
    begin
      CtrlLancaOrcam.NumPessoas[c] := NumPessoas[c];
      CtrlLancaOrcam.ValSalario[c] := ValSalario[c];
      CtrlLancaOrcam.ValBenef[c] := ValBenef[c];
      CtrlLancaOrcam.ValEncargo[c] := ValEncargo[c];
    end;
  end;
  LancaOrcam.IdPlanoMontaSelect;
  LancaOrcam.ShowModal;
  LancaOrcam.Free;
end;

procedure TfrmSelOrcam.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := false;
  Toolbar971.Visible := false;
end;

procedure TfrmSelOrcam.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  dValCalc: double;
  sIdRegra, sIdPessoa: string;
  rValorSal, rFator, rParcela: real;
begin
  iNumVez := iNumVez + 1;
  if (iNumVez > 1) then
    if (MsgDlg('Acumula com o(s) Anterior(es)?', 'Confirmação', mtConfirmation,
        [mbYes, mbNo], 0) = mrNo) then
    begin
      ValSalario[14] := 0;
      ValBenef[14] := 0;
      NumPessoas[14] := 0;
      ValEncargo[14] := 0;
      ValTotal[14] := 0;
      iNumVez := 1;
    end;

  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Update;
  inherited;

  sIdEstab := '';
  if (rgSelEstab.ItemIndex > 0) then
  begin
    for c:=0 to lstEstab.Items.Count-1 do
    begin
      if (lstEstab.Items[c] = '') then
        break;

      if (sIdEstab = '') then
        sIdEstab := sIdEstab + lstCodEstab.Items[c]
      else
        sIdEstab := sIdEstab +','+ lstCodEstab.Items[c];

      if (cbxSubEstab.checked) then
      begin
        sqlEstab.Prepare;
        sqlEstab.ParamByName('IdEmpresa').asInteger := StrToInt(lstCodEstab.Items[c]);
        sqlEstab.Open;

        while not(CdsEstab.EOF) do
        begin
          sIdEstab := sIdEstab +','+ CdsEstab.FieldByName('IdPessoa').asString;
          CdsEstab.Next;
        end;
      end;
    end;
  end;

  sIdCargo := '';
  if (rgSelCargo.ItemIndex > 0) then
  begin
    for c:=0 to lstCargo.Items.Count-1 do
    begin
      if (lstCargo.Items[c] = '') then
        break;

      if (sIdCargo = '') then
        sIdCargo := sIdCargo + lstCodCargo.Items[c]
      else
        sIdCargo := sIdCargo +','+ lstCodCargo.Items[c];
    end;
  end;

  frmAguarde.Update;
  frmAguarde.Max := CdsPrincipal.RecordCount + 1;

  if (rgEncargo.ItemIndex = 1) then
    rFator := StrToFloat(ednPerc2.Text)
  else
    rFator := StrToFloat(ednPerc1.Text);
  rFator  := rFator / 100;

  for c:=1 to 13 do
  begin
    NumPessoas[c] := 0;
    ValSalario[c] := 0;
    ValBenef[c] := 0;
    ValEncargo[c] := 0;
    ValTotal[c] := 0;
  end;

  while not(CdsPrincipal.EOF) do
  begin
    if (CdsPrincipal.FieldByName('SALARIOATUAL').IsNull) then
      rValorSal := 0
    else
      rValorSal := CdsPrincipal.FieldByName('SALARIOATUAL').asFloat;

    if (CdsPrincipal.FieldByName('TIPOPAGAMENTO').asString = 'D') then
      rValorSal := rValorSal * 30
    else
    if (CdsPrincipal.FieldByName('TIPOPAGAMENTO').asString = 'H') then
      rValorSal := rValorSal * CdsPrincipal.FieldByName('JORNADAMENSAL').asInteger;

    // Cálculo do Benefício
    rParcela := 0;
    if (rgBenef.ItemIndex = 0) then
    begin
      CdsHistorico.Data := CtrlColetaSal.ListHistorico(
        CdsPrincipal.FieldByName('IDPESSOA').asFloat);
      while not(CdsHistorico.EOF) do
      begin
        if (CdsHistorico.FieldByName('ANOMESINICIO').asString <= FU.RetornaAnoMes(Date)) and
           ((CdsHistorico.FieldByName('NUMOCORRENCIAS').asInteger <>
             CdsHistorico.FieldByName('PARCELAS').asInteger) or
            (CdsHistorico.FieldByName('FLGPERMANENTE').asInteger = 1) or
            (CdsHistorico.FieldByName('IDREGRACALCULO').asFloat = -99)) then
        begin
          if (CdsHistorico.FieldByName('VALORRUBRICA').IsNull) then
            dValCalc := 0
          else
            dValCalc := CdsHistorico.FieldByName('VALORRUBRICA').asFloat;

          if not(CdsHistorico.FieldByName('IDREGRACALCULO').IsNull) and
             (CdsHistorico.FieldByName('IDREGRACALCULO').asFloat <> -99) then
          begin
            sIdRegra := CdsHistorico.FieldByName('IdRegraCalculo').asString;
            sIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString;
            CtrlCalcRub.CalcBeneficioRegra(sIdRegra, sIdPessoa, dValCalc);
          end;
          rParcela := rParcela + dValCalc;
        end;
        CdsHistorico.Next;
      end;
    end;

    // Final do Cálculo do Benefício
    NumPessoas[1] := NumPessoas[1] + 1;
    ValSalario[1] := ValSalario[1] + rValorSal;
    ValBenef[1] := ValBenef[1] + rParcela;
    ValEncargo[1] := ValEncargo[1] + rValorSal * rFator;

    CdsPrincipal.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  for c:=1 to spedMeses.Value do
  begin
    if (c > 1) then
    begin
      ValSalario[c] := ValSalario[c-1];
      ValBenef[c] := ValBenef[c-1];
      ValEncargo[c] := ValEncargo[c-1];
      ValTotal[c] := ValTotal[c-1];
      NumPessoas[c] := NumPessoas[c-1];
    end;

    rFator := VetEditIndice[c].Value * VetEditIndice[c+12].Value;

    NumPessoas[c] := Round(NumPessoas[c] * VetEditIndice[c+12].Value);
    NumPessoas[13] := NumPessoas[13] + NumPessoas[c];

    ValSalario[c] := ValSalario[c] * rFator;
    ValSalario[13] := ValSalario[13] + ValSalario[c];

    ValBenef[c] := ValBenef[c] * rFator;
    ValBenef[13] := ValBenef[13] + ValBenef[c];

    ValEncargo[c] := ValEncargo[c] * rFator;
    ValEncargo[13] := ValEncargo[13] + ValEncargo[c];

    ValTotal[c] := ValSalario[c] + ValBenef[c] + ValEncargo[c];
    ValTotal[13] := ValTotal[13] + ValTotal[c];

    VetEditNumPess[c].Value := Round(NumPessoas[c]);
    VetEditSalario[c].Value := Round(ValSalario[c]);
    VetEditBenef[c].Value := Round(ValBenef[c]);
    VetEditEncargos[c].Value := Round(ValEncargo[c]);
    VetEditTotais[c].Value := Round(ValTotal[c]);
  end;

  NumPessoas[14] := NumPessoas[14] + NumPessoas[13];
  ValSalario[14] := ValSalario[14] + ValSalario[13];
  ValBenef[14] := ValBenef[14] + ValBenef[13];
  ValEncargo[14] := ValEncargo[14] + ValEncargo[13];
  ValTotal[14] := ValTotal[14] + ValTotal[13];

  // Torna Visível Cada Campo conforme o Número de Meses indicado
  if (spedMeses.Value < 12) then
    for c:=1 to 12 do
    begin
      VetEditNumPess[c].Visible := (c <= spedMeses.Value);
      VetEditSalario[c].Visible := (c <= spedMeses.Value);
      VetEditBenef[c].Visible := (c <= spedMeses.Value);
      VetEditEncargos[c].Visible := (c <= spedMeses.Value);
      VetEditTotais[c].Visible := (c <= spedMeses.Value);
    end;

  // Torna Visível o Total Acumulado caso seja o caso
  ednPes14.Visible := (iNumVez > 1);
  ednVal14.Visible := (iNumVez > 1);
  ednBen14.Visible := (iNumVez > 1);
  ednEnc14.Visible := (iNumVez > 1);
  ednTot14.Visible := (iNumVez > 1);
  lblAcum.Visible := (iNumVez > 1);

  // Totais
  ednPes13.Value := Round(NumPessoas[13] / spedMeses.Value);
  ednVal13.Value := Round(ValSalario[13]);
  ednBen13.Value := Round(ValBenef[13]);
  ednEnc13.Value := Round(ValEncargo[13]);
  ednTot13.Value := Round(ValTotal[13]);

  // Totais Acumulados
  ednPes14.Value := Round(NumPessoas[14] / spedMeses.Value);
  ednVal14.Value := Round(ValSalario[14]);
  ednBen14.Value := Round(ValBenef[14]);
  ednEnc14.Value := Round(ValEncargo[14]);
  ednTot14.Value := Round(ValTotal[14]);

  Toolbar971.Visible := true;
  bbtnGrafico.Visible := true;
  bbtnOrcamento.Visible := (IdPlano > 0);
  ToolbarSep972.Visible := (IdPlano > 0);

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
  frmAguarde.Apaga;
  ExecutarIrPaginaResult;
end;

end.
