unit fSelEstDem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls, OleCtrls, chartfx3,
  TB97, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker,
  fSelPessoalMT, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, uCtrlMotivo,
  uCtrlPessoaFilialPessoa;

type
  TfrmSelEstDem = class(TfrmSelPessoalMT)
    pgctrlGrafico: TPageControl;
    tbshGrafico1: TTabSheet;
    Chart1: TChartfx;
    tbshGrafico2: TTabSheet;
    Chart2: TChartfx;
    tbshGrafico: TTabSheet;
    rgFreq: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    spedAno1: TSpinEdit;
    spedAno2: TSpinEdit;
    rgTipoEst: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgFreqClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlMotivo: TCtrlMotivo;

    procedure HabilitarBtOk;
  end;

var
  frmSelEstDem: TfrmSelEstDem;

implementation

uses uSistema, uCtrlFuncoesRH, fAguarde, uCtrlPadroes, uCtrlUsoGeralRH, dCds;

{$R *.DFM}

procedure TfrmSelEstDem.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  DecodeDate(Date, Ano, Mes, Dia);
  spedAno1.Value := Ano;
  spedAno2.Value := Ano;
  spedAno1.MaxValue := Ano;
  spedAno2.MaxValue := Ano;

  IrPaginaResult := false;
  pgctrlGrafico.ActivePageIndex := 0;
end;

procedure TfrmSelEstDem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlMotivo);
  inherited;
end;

procedure TfrmSelEstDem.rgFreqClick(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmSelEstDem.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := false;
end;

procedure TfrmSelEstDem.bbtnConfirmarClick(Sender: TObject);
var
  I3: double;
  S, S1, S2: string;
  I, I1, I2, c: integer;
  J, iQuantTotal, iValorTotal, iTamX, iTamY, SvTam: integer;
  CharQtd, CharTot, ListaCodigo, ListaDescricao, TemValor: variant;
  Ano, Mes, Dia: word;
  YMax, YMax2: double;
begin
  frmAguarde.Mostra('Selecionando Dados...');
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Update;
  inherited;
  frmAguarde.Update;
  frmAguarde.Max := CdsPrincipal.RecordCount + 1;

  if (rgTipoEst.ItemIndex = 0) then
    dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa)
  else
    dmCds.Cds.Data := CtrlMotivo.ListMotivo_Id_e_Descricao;

  iTamX := 12;
  if (rgTipoEst.ItemIndex = 0) and (rgSelEstab.ItemIndex = 1) then
    iTamY := lstEstab.Items.Count
  else
    iTamY := dmCds.Cds.RecordCount;

  ListaCodigo := VarArrayCreate([1, iTamY], varDouble);
  ListaDescricao := VarArrayCreate([1, iTamY], varOleStr);
  TemValor := VarArrayCreate([1, iTamY], varOleStr);

  if (rgTipoEst.ItemIndex = 0) and (rgSelEstab.ItemIndex = 1) then
  begin
    for c:=1 to iTamY do
    begin
      ListaCodigo[c] := StrToInt(lstCodEstab.Items[c-1]);
      ListaDescricao[c] := lstEstab.Items[c-1];
    end;
  end
  else
  begin
    dmCds.Cds.First;
    for c:=1 to dmCds.Cds.RecordCount do
    begin
      if (rgTipoEst.ItemIndex = 0) then
      begin
        ListaCodigo[c] := dmCds.Cds.FieldByName('IDPESSOA').asFloat;
        ListaDescricao[c] := dmCds.Cds.FieldByName('NOME').asString;
      end
      else
      begin
        ListaCodigo[c] := dmCds.Cds.FieldByName('IDMOTIVO').asFloat;
        ListaDescricao[c] := dmCds.Cds.FieldByName('DESCRICAO').asString;
      end;
      dmCds.Cds.Next;
    end;
  end;

  DecodeDate(Date, Ano, Mes, Dia);
  if (rgFreq.ItemIndex = 0) and (spedAno1.Value = Ano) then
    iTamX := Mes;

  if (rgFreq.ItemIndex = 1) then
    iTamX := spedAno2.Value - spedAno1.Value + 1;

  CharQtd := VarArrayCreate([1, iTamY, 1, iTamX], varInteger);
  CharTot := VarArrayCreate([1, iTamY], varInteger);

  while not(CdsPrincipal.EOF) do
  begin
    DecodeDate(CdsPrincipal.FieldByName('DATADESLIGAMENTO').asDateTime, Ano, Mes, Dia);
    if (Ano < spedAno1.Value) or (Ano > spedAno2.Value) then
    begin
      CdsPrincipal.Next;
      Continue;
    end;

    // Rotina para determinar o ponteiro onde vai somar
    for c:=1 to iTamY do
      if ((rgTipoEst.ItemIndex = 1) and
          (CdsPrincipal.FieldByName('IDMOTIVODESLIGRAIS').asFloat = ListaCodigo[c])) or
         ((rgTipoEst.ItemIndex = 2) and
          (CdsPrincipal.FieldByName('IDMOTIVODESLIGGERENCIAL').asFloat = ListaCodigo[c])) or
         ((rgTipoEst.ItemIndex = 0) and
          (CdsPrincipal.FieldByName('IDESTAB').asFloat = ListaCodigo[c])) then
        break;

    if (c <= iTamY) then
    begin
      if (rgFreq.ItemIndex = 0) then
        CharQtd[c,MES] := CharQtd[c,MES] + 1
      else
        CharQtd[c,Ano-spedAno1.Value+1] := CharQtd[c,Ano-spedAno1.Value+1] + 1;

      CharTot[c] := CharTot[c] + 1;
    end;

    CdsPrincipal.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  frmAguarde.Mostra('Gerando Gráfico...');
  frmAguarde.Update;

  SvTam := iTamX;
  I2 := 0;

  for I1:=0 to (iTamY - 1) do
    TemValor[I1+1] := ' ';

  for I1:=0 to (iTamY - 1) do
  begin
    SvTam := iTamX;

    for I:=0 to (SvTam - 1) do
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
    for I:=0 to (SvTam-1) do
      Chart1.Legend[I] := MesCurto[I+1];

  if (rgFreq.ItemIndex = 1) then
    for I:=0 to (SvTam-1) do
    begin
      str(spedAno1.Value + I, S);
      Chart1.Legend[I] := S;
    end;

  Chart1.Decimals := 0;

  S1 := IntToStr(spedAno1.Value);
  S2 := IntToStr(spedAno2.Value);

  if (S1 <> S2) then
    S := S1 +' a '+ S2
  else
    S := S1;

  Chart1.Title[2] := 'Estatística de Demissões ' +
    rgTipoEst.Items[rgTipoEst.ItemIndex] +' (' +S+ ')';

  YMax := 0;
  I2 := 0;
  iQuantTotal := 0;
  iValorTotal := 0;

  for I1:=0 to (iTamY - 1) do
  begin
    if (TemValor[I1+1] = 'S') then
    begin
      Chart1.ThisSerie := I2;
      Chart1.SerLeg[I2] := ListaDescricao[I1+1];
      I2 := I2 + 1;
      SvTam := iTamX;
      for I:=0 to (SvTam - 1) do
      begin
        Chart1.Value[I] := CharQtd[I1+1,I+1];
        iQuantTotal := iQuantTotal + CharQtd[I1+1,I+1];
        if (Chart1.Value[I] > YMax) then
          YMax := Chart1.Value[I];
      end;
    end;
  end;

  Chart1.Title[3] := 'Número de Desligamentos: ' + IntToStr(iQuantTotal);

  if (iQuantTotal = 0) then // Para enganar o 'bug'
    for I:=0 to (SvTam-1) do
      Chart1.Value[I] := 0;

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); // Escala de Y

  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y

  Chart1.CloseData(1);

  Chart2.OpenDataEx(1,1,iTamY);
  Chart2.ChartType := 5;

  for I:=0 to (iTamY-1) do
    Chart2.Legend[I] := ListaDescricao[I+1];

  Chart2.Decimals := 0;
  Chart2.Title[2] := 'Estatística de Demissões ' +
    rgTipoEst.Items[rgTipoEst.ItemIndex]+ ' (' +S+ ')';

  YMax2 := 0;  
  for I1:=0 to iTamY-1 do
  begin
    Chart2.ThisSerie := 0;
    Chart2.Value[I1] := CharTot[I1+1];
    iValorTotal := iValorTotal + CharTot[I1+1];
    if (Chart2.Value[I1] > YMax2) then
      YMax2 := Chart2.Value[I1];
  end;

  Chart2.Title[3] := 'Número de Desligamentos: ' + IntToStr(iValorTotal);

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

procedure TfrmSelEstDem.HabilitarBtOk;
begin
  bbtnConfirmar.Enabled :=
    ((rgFreq.ItemIndex = 0) and (spedAno1.Value = spedAno2.Value)) or
    ((rgFreq.ItemIndex = 1) and (spedAno1.Value <= spedAno2.Value) and
     (spedAno1.Value > spedAno2.Value-12));
end;

end.
