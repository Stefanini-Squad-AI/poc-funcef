unit fSelEstBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBTables, Db,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3,
  TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, wwdbdatetimepicker, CMDateTimePicker,
  fSelPessoalMT, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, CheckLst,
  ColorCheckListBox, uCtrlProvDesc, uCtrlCalcRub, uCtrlBeneficiosRH;

type
  TfrmSelEstBenef = class(TfrmSelPessoalMT)
    dsHstBeneficios: TwwDataSource;
    Chart1: TChartfx;
    Chart2: TChartfx;
    tbshGrafico: TTabSheet;
    gbxData: TGroupBox;
    gbxBenef: TGroupBox;
    chklstBenef: TColorCheckListBox;
    bbtnInverteSel: TBitBtn;
    bbtnSelTodos: TBitBtn;
    CdsHstBeneficios: TCMClientDataSet;
    sqlHstBeneficios: TCMSqlParams;
    CdsRubrica: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    sqlAux: TCMSqlParams;
    cmbMes: TComboBox;
    speAno: TSpinEdit;

    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
  private
    CtrlProvDesc: TCtrlProvDesc;
    CtrlCalcRub: TCtrlCalcRub;
    CtrlBeneficiosRH: TCtrlBeneficiosRH;

    lstBenef: TStringList;
    lstBenefSel: TStringList;
  end;

var
  frmSelEstBenef: TfrmSelEstBenef;

implementation

uses uSistema, uCtrlFuncoesRH, uCtrlPadroes, fAguarde, dCds;

const
  TIT_TELA1: array[1..2] of string = ('de Beneficiários', 'do Custo dos Benefícios');
  TIT_TELA2: array[1..2] of string = ('Total de Beneficiários: ', 'Custo Total: ');

{$R *.DFM}

procedure TfrmSelEstBenef.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlCalcRub := TCtrlCalcRub.Create;
  CtrlCalcRub.InitializeAs(Padroes);

  CtrlBeneficiosRH := TCtrlBeneficiosRH.Create;
  CtrlBeneficiosRH.InitializeAs(Padroes);

  lstBenef := TStringList.Create;
  lstBenefSel := TStringList.Create;

  // Crio a lista de Rubricas a selecionar
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1,
    '  PD.IDPROVENTO, RP.DESCRPROVDESC', 1);
  while not(dmCds.Cds.EOF) do
  begin
    lstBenef.Add(dmCds.Cds.FieldByName('IDPROVENTO').asString);
    chklstBenef.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  cmbMes.ItemIndex := FU.ExtraiMes(Date) - 1;
  speAno.Value := FU.ExtraiAno(Date);

  IrPaginaResult := false;
  rgSequencia.Visible := false;
end;

procedure TfrmSelEstBenef.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlCalcRub);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlBeneficiosRH);
  FreeAndNil(lstBenef);
  FreeAndNil(lstBenefSel);
  inherited;
end;

procedure TfrmSelEstBenef.speAnoChange(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (speAno.Value <> 0);
end;

procedure TfrmSelEstBenef.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstBenef.Items.Count-1 do
    chklstBenef.Checked[c] := true;
  chklstBenef.Repaint;
end;

procedure TfrmSelEstBenef.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstBenef.Items.Count-1 do
    chklstBenef.Checked[c] := not(chklstBenef.Checked[c]);
  chklstBenef.Repaint;
end;

procedure TfrmSelEstBenef.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
end;

procedure TfrmSelEstBenef.bbtnConfirmarClick(Sender: TObject);
var
  TotQtd, TamY, c, Ind, Ind1: integer;
  YMax, I3: double;
  sIdRegra, sIdPessoa, S, sMesRef: string;
  CharVal, CharQtd, CodBen, DescTb: variant;
  dValCalc, dTotVal: double;
begin
  frmAguarde.Mostra('Processando Estatística...');
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  inherited;
  frmAguarde.Max := CdsPrincipal.RecordCount;  
  frmAguarde.Update;
  lstBenefSel.Clear;
  for c:=0 to chklstBenef.Items.Count-1 do
    if (chklstBenef.Checked[c]) then
      lstBenefSel.Add(lstBenef[c]);

  TamY := 0;
  Ind1 := 0;

  sMesRef := IntToStr(speAno.Value) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1);

  CdsHstBeneficios.Data := CtrlBeneficiosRH.ListBeneficiosPessoa(
    CdsPrincipal.FieldByName('IDPESSOA').asFloat, sMesRef, sMesRef);
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1,
    'RP.IDRUBRICA, RP.DESCRPROVDESC', 1);

  if (lstBenefSel.Count > 0) then
    TamY := lstBenefSel.Count
  else
  begin
    CdsRubrica.First;
    while not(CdsRubrica.EOF) do
    begin
      Inc(TamY);
      CdsRubrica.Next;
    end;
  end;

  CodBen := VarArrayCreate([1, TamY], varInteger);
  DescTb := VarArrayCreate([1, TamY], varOleStr);

  frmAguarde.Update;
  if (lstBenefSel.Count > 0) then
  begin
    for Ind:=1 to TamY do
    begin
      CdsRubrica.Locate('IDRUBRICA', lstBenefSel[Ind-1], []);
      CodBen[Ind] := CdsRubrica.FieldByName('IDRUBRICA').asFloat;
      DescTb[Ind] := CdsRubrica.FieldByName('DESCRPROVDESC').asString;
    end;
  end
  else
  begin
    CdsRubrica.First;
    while not(CdsRubrica.EOF) do
    begin
      Inc(Ind1);
      CodBen[Ind1] := CdsRubrica.FieldByName('IDRUBRICA').asFloat;
      DescTb[Ind1] := CdsRubrica.FieldByName('DESCRPROVDESC').asString;
      CdsRubrica.Next;
    end;
  end;

  CharQtd := VarArrayCreate([1, TamY], varInteger);
  CharVal := VarArrayCreate([1, TamY], varDouble);

  frmAguarde.Update;
  while not(CdsPrincipal.EOF) do
  begin
    while not(CdsHstBeneficios.EOF) and not(CdsHstBeneficios.EOF) and
      (sMesRef >= CdsHstBeneficios.FieldByName('ANOMESINICIO').asString) do
    begin
      if (CdsHstBeneficios.FieldByName('NUMOCORRENCIAS').asInteger <
          CdsHstBeneficios.FieldByName('PARCELAS').asInteger) or
         (CdsHstBeneficios.FieldByName('FLGPERMANENTE').asInteger = 1)  or
         (CdsHstBeneficios.FieldByName('IDREGRACALCULO').asInteger = -99) then
      begin
        // Determino o ponteiro onde vai somar
        for Ind:=1 to TamY do
          if (CdsHstBeneficios.FieldByName('IDRUBRICA').asFloat = CodBen[Ind]) then
            break;

        if (Ind <= TamY) and (TamY > 0) then
        begin
          CharQtd[Ind] := CharQtd[Ind] + 1;
          if (CdsHstBeneficios.FieldByName('VALORRUBRICA').IsNull) then
            dValCalc := 0
          else
            dValCalc := CdsHstBeneficios.FieldByName('VALORRUBRICA').asFloat;

          if not(CdsHstBeneficios.FieldByName('IdRegraCalculo').IsNull) and
            (CdsHstBeneficios.FieldByName('IDREGRACALCULO').asFloat <> -99) then
          begin
            sIdRegra := CdsHstBeneficios.FieldByName('IdRegraCalculo').asString;
            sIdPessoa := CdsPrincipal.FieldByName('IDPESSOA').asString;
            CtrlCalcRub.CalcBeneficioRegra(sIdRegra, sIdPessoa, dValCalc);
          end;
          CharVal[Ind] := CharVal[Ind] + dValCalc;
        end;
      end;
      CdsHstBeneficios.Next;
    end;
    CdsPrincipal.Next;
    CdsHstBeneficios.Data := CtrlBeneficiosRH.ListBeneficiosPessoa(
      CdsPrincipal.FieldByName('IDPESSOA').asFloat, sMesRef, sMesRef);

    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  // Gráfico de Quantidades
  Chart1.OpenDataEx(1, 1, TamY);
  Chart1.ChartType := 5;

  Chart1.Decimals := 0;
  Chart1.Title[2] := 'Estatística ' + TIT_TELA1[1];
  YMax := 0;

  TotQtd := 0;
  Chart1.ThisSerie := 0;
  for Ind:=0 to (TamY - 1) do
  begin
    Chart1.Value[Ind] := CharQtd[Ind+1];
    TotQtd := TotQtd + CharQtd[Ind+1];
    if (Chart1.Value[Ind] > YMax) then
      YMax := Chart1.Value[Ind];
  end;

  frmAguarde.Update;
  S := IntToStr(TotQtd);
  Chart1.Title[3] := TIT_TELA2[1] + S;

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); // Escala de Y
  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y
  Chart1.CloseData(1);
  Chart1.Visible := true;

  // Gráfico de Valores
  Chart2.OpenDataEx(1,1,TamY);
  Chart2.ChartType := 5;

  for Ind:=0 to (TamY-1) do
    Chart2.Legend[Ind] := DescTb[Ind+1];

  Chart2.Decimals := 0;
  Chart2.Title[2] := 'Estatística ' + TIT_TELA1[2];
  YMax := 0;

  dTotVal := 0;
  Chart2.ThisSerie := 0;
  for Ind:=0 to (TamY-1) do
  begin
    Chart2.Value[Ind] := CharVal[Ind+1];
    dTotVal := dTotVal + CharVal[Ind+1];
    if (Chart2.Value[Ind] > YMax) then
      YMax := Chart2.Value[Ind];
  end;

  S := FloatToStrF(dTotVal,ffFixed,12,2);
  Chart2.Title[3] := TIT_TELA2[2] + S;

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  frmAguarde.Update;
  I3 := int(I3 / 20); // Escala de Y
  Chart2.Adm[1] := YMax; // Valor Máximo de Y
  Chart2.Adm[4] := I3; // Escala de Y
  Chart2.CloseData(1);
  Chart2.Visible := True;

  frmAguarde.Apaga;
  ExecutarIrPaginaResult;
end;

end.
