unit fSelEstRecr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls,
  chartfx3, TB97, ComCtrls, IvDictio, IvMulti, IvEMulti, TB97Tlbr, wwdbdatetimepicker,
  CMDateTimePicker, fSelPessoalMT, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport,
  uCtrlFonte;

type
  TfrmSelEstRecr = class(TfrmSelPessoalMT)
    pgctrlGrafico: TPageControl;
    tbshGrafico1: TTabSheet;
    tbshGrafico2: TTabSheet;
    Chart1: TChartfx;
    Chart2: TChartfx;
    tbshGrafico: TTabSheet;
    rgFreq: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    spedAno1: TSpinEdit;
    spedAno2: TSpinEdit;
    rgTipoEst: TRadioGroup;
    CdsFonteRecr: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgFreqClick(Sender: TObject);
    procedure rgTipoEstClick(Sender: TObject);
  private
    CtrlFonte: TCtrlFonte;

    procedure HabilitarBtOk;
  end;

var
  frmSelEstRecr: TfrmSelEstRecr;

implementation

uses uCtrlFuncoesRH, fAguarde, uCtrlPadroes;

{$R *.DFM}

procedure TfrmSelEstRecr.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);
  CdsFonteRecr.Data := CtrlFonte.ListGeral(0);

  DecodeDate(Date, Ano, Mes, Dia);
  spedAno1.Value := Ano;
  spedAno2.Value := Ano;
  spedAno1.MaxValue := Ano;
  spedAno2.MaxValue := Ano;

  rgSequencia.Visible := false;
  IrPaginaResult := false;
  pgctrlGrafico.ActivePageIndex := 0;
end;

procedure TfrmSelEstRecr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlFonte);
  inherited;
end;

procedure TfrmSelEstRecr.rgFreqClick(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmSelEstRecr.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := false;
end;

procedure TfrmSelEstRecr.rgTipoEstClick(Sender: TObject);
begin
  cbxEfetivos.Checked := (rgTipoEst.ItemIndex = 1);
  cbxCandidatos.Checked := (rgTipoEst.ItemIndex = 0);
  cbxCandidatos.Enabled := (rgTipoEst.ItemIndex = 0);
end;

procedure TfrmSelEstRecr.bbtnConfirmarClick(Sender: TObject);
const
  TITULO_TELA: array[0..1] of string = ('Número de Candidatos: ', 'Número de Admissões: ');
var
  S, S1, S2: string;
  Ano, Mes, Dia: word;
  YMax1, YMax2, I3: double;  
  J, iQuantTotal, iValorTotal, iTamX, iTamY, iSvTam, c, I, I1, I2: integer;
  CharQtd, CharTot, ListaCodigo, ListaDescricao, TemValor: variant;
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Update;
  inherited;
  frmAguarde.Update;
  frmAguarde.Max := CdsPrincipal.RecordCount + 1;

  iTamY := CdsFonteRecr.RecordCount;

  ListaCodigo := VarArrayCreate([1, iTamY], varInteger);
  ListaDescricao := VarArrayCreate([1, iTamY], varOleStr);
  TemValor := VarArrayCreate([1, iTamY], varOleStr);

  CdsFonteRecr.First;
  for c:=1 to CdsFonteRecr.RecordCount do
  begin
    ListaCodigo[c] := CdsFonteRecr.FieldByName('IDFONTRECR').asInteger;
    ListaDescricao[c] := CdsFonteRecr.FieldByName('DESCRICAO').asString;
    CdsFonteRecr.Next;
  end;

  iTamX := 12;  
  DecodeDate(Date, Ano, Mes, Dia);
  if (rgFreq.ItemIndex = 0) and (spedAno1.Value = Ano) then
    iTamX := Mes;

  if (rgFreq.ItemIndex = 1) then
    iTamX := spedAno2.Value - spedAno1.Value + 1;

  CharQtd := VarArrayCreate([1, iTamY, 1, iTamX], varInteger);
  CharTot := VarArrayCreate([1, iTamY], varInteger);

  while not(CdsPrincipal.EOF) do
  begin
    if not(cbxCandidatos.Checked) then
      DecodeDate(CdsPrincipal.FieldByName('DATAADMISSAO').asDateTime, Ano, Mes, Dia)
    else
      DecodeDate(CdsPrincipal.FieldByName('DATINCLU').asDateTime, Ano, Mes, Dia);

    if (Ano < spedAno1.Value) or (Ano > spedAno2.Value) then
    begin
      CdsPrincipal.Next;
      Continue;
    end;

    // Rotina para determinar o ponteiro onde vai somar
    for c:=1 to iTamY do
      if (CdsPrincipal.FieldByName('IDFONTRECR').asInteger = ListaCodigo[c]) then
        break;

    if (c <= iTamY) then
    begin
      if (rgFreq.ItemIndex = 0) then
        CharQtd[c,Mes] := CharQtd[c,Mes] + 1
      else
        CharQtd[c, Ano-spedAno1.Value+1] := CharQtd[c, Ano-spedAno1.Value+1] + 1;

      CharTot[c] := CharTot[c] + 1;
    end;
    CdsPrincipal.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  frmAguarde.Mostra('Gerando Gráfico...');
  frmAguarde.Update;

  iSvTam := iTamX;
  I2 := 0;
  for I1:=0 to iTamY-1 do
    TemValor[I1+1] := ' ';

  for I1:=0 to iTamY-1 do
  begin
    iSvTam := iTamX;
    for I:=0 to iSvTam-1 do
    begin
      if (CharQtd[I1+1,I+1] > 0) then
      begin
        TemValor[I1+1] := 'S';
        I2 := I2 + 1;
        break;
      end;
    end;
  end;

  // Preparar os gráficos
  if (I2 = 0) then
    I2 := 1; // Para enganar o 'bug'

  Chart1.OpenDataEx(1,I2,iTamX);
  Chart1.ChartType := 2;

  if (rgFreq.ItemIndex = 0) then
    for I:=0 to iSvTam-1 do
      Chart1.Legend[I] := MesCurto[I+1];

  if (rgFreq.ItemIndex = 1) then
    for I:=0 to iSvTam-1 do
      Chart1.Legend[I] := IntToStr(spedAno1.Value + I);

  Chart1.Decimals := 0;

  S1 := IntToStr(spedAno1.Value);
  S2 := IntToStr(spedAno2.Value);

  if (S1 <> S2) then
    S := S1 +' a '+ S2
  else
    S := S1;

  if (rgTipoEst.ItemIndex = 0) then
    Chart1.Title[2] := 'Estatística de Recrutamento por Fonte (' +S+ ')'
  else
    Chart1.Title[2] := 'Estatística de Admissões por Fonte (' +S+ ')';

  YMax1 := 0;
  I2 := 0;
  iQuantTotal := 0;
  iValorTotal := 0;
  for I1:=0 to iTamY-1 do
  begin
    if (TemValor[I1+1] = 'S') then
    begin
      Chart1.ThisSerie := I2;
      Chart1.SerLeg[I2] := ListaDescricao[I1+1];
      I2 := I2 + 1;
      iSvTam := iTamX;
      for I:=0 to iSvTam-1 do
      begin
        Chart1.Value[I] := CharQtd[I1+1,I+1];
        iQuantTotal := iQuantTotal + CharQtd[I1+1,I+1];
        if (Chart1.Value[I] > YMax1) then
          YMax1 := Chart1.Value[I];
      end;
    end;
  end;

  Chart1.Title[3] := TITULO_TELA[rgTipoEst.ItemIndex] + IntToStr(iQuantTotal);

  if (iQuantTotal = 0) then  // Para enganar o 'bug'
    for I:=0 to iSvTam-1 do
      Chart1.Value[I] := 0;

  I3 := 1;
  while (YMax1 > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); // Escala de Y

  Chart1.Adm[1] := YMax1; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y
  Chart1.CloseData(1);

  Chart2.OpenDataEx(1,1,iTamY);
  Chart2.ChartType := 5;

  for I:=0 to iTamY-1 do
    Chart2.Legend[I] := ListaDescricao[I+1];

  Chart2.Decimals := 0;
  if (rgTipoEst.ItemIndex = 0) then
    Chart2.Title[2] := 'Estatística de Recrutamento por Fonte (' +S+ ')'
  else
    Chart2.Title[2] := 'Estatística de Admissões por Fonte (' +S+ ')';

  YMax2 := 0;  
  for I1:=0 to iTamY-1 do
  begin
    Chart2.ThisSerie := 0;
    Chart2.Value[I1] := CharTot[I1+1];
    iValorTotal := iValorTotal + CharTot[I1+1];
    if (Chart2.Value[I1] > YMax2) then
      YMax2 := Chart2.Value[I1];
  end;

  Chart2.Title[3] := TITULO_TELA[rgTipoEst.ItemIndex] + IntToStr(iValorTotal);

  I3 := 1;
  while (YMax2 > I3) do
    I3 := I3*10;

  I3 := int(I3 / 20); // Escala de Y

  Chart2.Adm[1] := YMax2; // Valor Máximo de Y
  Chart2.Adm[4] := I3; // Escala de Y
  Chart2.CloseData(1);

  frmAguarde.Pos := frmAguarde.Pos + 1;
  frmAguarde.Update;
  frmAguarde.Apaga;
  ExecutarIrPaginaResult;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmSelEstRecr.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled :=
    ((rgFreq.ItemIndex = 0) and (spedAno1.Value = spedAno2.Value)) or
    ((rgFreq.ItemIndex = 1) and (spedAno1.Value <= spedAno2.Value) and
     (spedAno1.Value > spedAno2.Value-12));
end;

end.
