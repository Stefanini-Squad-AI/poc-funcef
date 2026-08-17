unit fSelEstAusencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  OleCtrls, TB97, ComCtrls, IvDictio, IvMulti, TB97Tlbr, DBClient, CheckLst, chartfx3,
  wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet, uCmSqlParams, CmParamReport,
  ColorCheckListBox, uCtrlTipOcMed, uCtrlRegAcessoFunc,
  IvEMulti;

type                                                    
  TfrmSelEstAusencia = class(TfrmSelPessoalMT)
    pgctrlGrafico: TPageControl;
    tbshGrafico1: TTabSheet;
    tbshGrafico2: TTabSheet;
    tbshGrafico: TTabSheet;
    rgFreq: TRadioGroup;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    spedAno1: TSpinEdit;
    spedAno2: TSpinEdit;
    gbxMotivoAusencia: TGroupBox;
    chklstTipoOcorr: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    Chart1: TChartfx;
    Chart2: TChartfx;
    procedure FormCreate(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spedAno1Change(Sender: TObject);
    procedure chklstTipoOcorrClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure rgFreqClick(Sender: TObject);
  private
    CtrlTipOcMed: TCtrlTipOcMed;
    CtrlRegAcessoFunc: TCtrlRegAcessoFunc;

    ListaCodTipOcMed: TStringList;

    procedure HabilitarBtOk;
    procedure CriarListaTipoOcMed;
  end;

var
  frmSelEstAusencia: TfrmSelEstAusencia;

implementation

uses uMensErro, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, dCds;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_TITULO = 'Estatística de Motivos de Ausência (:1)';
  MSG_TITULO_NUM_OCORR = 'Número de Ocorrências: :1';

{$R *.DFM}

procedure TfrmSelEstAusencia.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  CtrlRegAcessoFunc := TCtrlRegAcessoFunc.Create;
  CtrlRegAcessoFunc.InitializeAs(Padroes);

  ListaCodTipOcMed := TStringList.Create;

  // Criar lista de Tipos de Ocorrência a selecionar
  CriarListaTipoOcMed;

  DecodeDate(Date, Ano, Mes, Dia);
  spedAno1.Value := Ano;
  spedAno2.Value := Ano;
  spedAno1.MaxValue := Ano;
  spedAno2.MaxValue := Ano;
  IrPaginaResult := false;
  pgctrlGrafico.ActivePageIndex := 0;
end;

procedure TfrmSelEstAusencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(CtrlRegAcessoFunc);
  FreeAndNil(ListaCodTipOcMed);
  inherited;
end;

procedure TfrmSelEstAusencia.spedAno1Change(Sender: TObject);
begin
  HabilitarBtOk;
end;

procedure TfrmSelEstAusencia.chklstTipoOcorrClickCheck(Sender: TObject);
begin
  inherited;
  HabilitarBtOk;
end;

procedure TfrmSelEstAusencia.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := true;
  chklstTipoOcorr.Repaint;
  HabilitarBtOk;
end;

procedure TfrmSelEstAusencia.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    chklstTipoOcorr.Checked[c] := not(chklstTipoOcorr.Checked[c]);
  chklstTipoOcorr.Repaint;
  HabilitarBtOk;  
end;

procedure TfrmSelEstAusencia.rgFreqClick(Sender: TObject);
begin
  spedAno1Change(Sender);
end;

procedure TfrmSelEstAusencia.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  rgSequencia.Visible := false;
end;

procedure TfrmSelEstAusencia.bbtnConfirmarClick(Sender: TObject);
var
  I3, YMax, YMax2: double;
  sPeriodoGrafico, sListaCodOcorrSel, sListaIdFuncSel: string;
  iTotHor, iTotAval, iTam, iTamY, SvTam, c, I, I1: integer;
  CharQtd, CharTot, TemValor: variant;
  Ano, Mes, Dia: word;
  ListaCodOcorrSel, ListaDescOcorrSel: TStringList;
begin
  ListaCodOcorrSel := TStringList.Create;
  ListaDescOcorrSel := TStringList.Create;

  frmAguarde.Mostra(FU.CMTranslate('Selecionando Dados...'));
  frmAguarde.Min := 0;
  frmAguarde.Pos := 0;
  frmAguarde.Update;
  inherited;
  frmAguarde.Update;
  iTam := 12;

  if (CdsPrincipal.IsEmpty) then
  begin
    MsgDlg(FU.CMTranslate('Não há pessoas selecionadas.'), FU.CMTranslate('Aviso'),
      mtInformation, [mbOk,mbHelp], 0);
    ModalResult := mrNone;
    exit;
  end;

  // Atribuo o número de Linhas do Gráfico, Códigos e Descrição dos Tipos de Ocorrência
  // que selecionados
  iTamY := 0;
  sListaCodOcorrSel := '';
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    if (chklstTipoOcorr.Checked[c]) then
    begin
      Inc(iTamY);

      if (sListaCodOcorrSel = '') then
        sListaCodOcorrSel := ListaCodTipOcMed[c]
      else
        sListaCodOcorrSel := sListaCodOcorrSel +','+ ListaCodTipOcMed[c];

      ListaCodOcorrSel.Add(ListaCodTipOcMed[c]);
      ListaDescOcorrSel.Add(chklstTipoOcorr.Items[c]);
    end;

  TemValor := VarArrayCreate([0, iTamY-1], varOleStr);

  DecodeDate(Date, Ano, Mes, Dia);
  if (rgFreq.ItemIndex = 0) and (spedAno1.Value = Ano) then
    iTam := Mes;

  if (rgFreq.ItemIndex = 1) then
    iTam := spedAno2.Value - spedAno1.Value + 1;

  CharQtd := VarArrayCreate([0, iTamY-1, 0, iTam-1], varInteger);
  CharTot := VarArrayCreate([0, iTamY-1], varInteger);

  // Seleção dos Dados
  CdsPrincipal.First;
  sListaIdFuncSel := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFuncSel = '') then
      sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  dmCds.Cds.Data := CtrlRegAcessoFunc.ListHistorico(sListaIdFuncSel, sListaCodOcorrSel,
    spedAno1.Value, spedAno2.Value);
  frmAguarde.Max := dmCds.Cds.RecordCount + 1;

  frmAguarde.Update;
  while not(dmCds.Cds.EOF) do
  begin
    for c:=0 to chklstTipoOcorr.Items.Count-1 do
      if (dmCds.Cds.FieldByName('CODTIPOOCMED').asString = ListaCodOcorrSel[c]) then
        break;

    if (c < iTamY) then
    begin
      if (rgFreq.ItemIndex = 0) then
        CharQtd[c, dmCds.Cds.FieldByName('MES').asInteger - 1] :=
          CharQtd[c, dmCds.Cds.FieldByName('MES').asInteger - 1] +
          dmCds.Cds.FieldByName('NUM').asInteger
      else
        CharQtd[c, dmCds.Cds.FieldByName('ANO').asInteger - spedAno1.Value] :=
          CharQtd[c, dmCds.Cds.FieldByName('ANO').asInteger - spedAno1.Value] +
          dmCds.Cds.FieldByName('NUM').asInteger;

      CharTot[c] := CharTot[c] + dmCds.Cds.FieldByName('NUM').asInteger;
    end;

    dmCds.Cds.Next;
    frmAguarde.Pos := frmAguarde.Pos + 1;
    frmAguarde.Update;
  end;

  frmAguarde.Mostra(FU.CMTranslate('Gerando Gráfico...'));
  frmAguarde.Update;

  SvTam := iTam;
  I1 := 0;
  for c:=0 to iTamY-1 do
    TemValor[c] := ' ';

  for c:=0 to iTamY-1 do
  begin
    SvTam := iTam;
    for I:=0 to SvTam-1 do
    begin
      if (CharQtd[c,I] > 0) then
      begin
        TemValor[c] := 'S';
        Inc(I1);
        break;
      end;
    end;
  end;

  // Preparar os gráficos
  if (I1 = 0) then
    I1 := 1; // Para enganar o 'bug'

  // ------------------------------
  // Gráfico Mensal
  // ------------------------------
  Chart1.OpenDataEx(1,I1,iTam);
  Chart1.ChartType := 2;

  // Preenche as Legendas
  if (rgFreq.ItemIndex = 0) then
    for c:=0 to SvTam-1 do
      Chart1.Legend[c] := MesCurto[c+1]
  else
  if (rgFreq.ItemIndex = 1) then
    for c:=0 to SvTam-1 do
      Chart1.Legend[c] := IntToStr(spedAno1.Value + c);

  // Preenche o Título
  if (spedAno1.Text <> spedAno2.Text) then
    sPeriodoGrafico := spedAno1.Text +FU.CMTranslate(' a ')+ spedAno2.Text
  else
    sPeriodoGrafico := spedAno1.Text;

  Chart1.Decimals := 0;
  Chart1.Title[2] := FU.CMTranslateMsg(MSG_TITULO, [sPeriodoGrafico]);

  // Preenche Valores
  YMax := 0;
  I1 := 0;
  iTotHor := 0;
  iTotAval := 0;
  for c:=0 to iTamY-1 do
  begin
    if (TemValor[c] = 'S') then
    begin
      Chart1.ThisSerie := I1;
      Chart1.SerLeg[I1] := ListaDescOcorrSel[c];
      Inc(I1);
      SvTam := iTam;
      for I:=0 to SvTam-1 do
      begin
        Chart1.Value[I] := CharQtd[c,I];
        iTotHor := iTotHor + CharQtd[c,I];
        if (Chart1.Value[I] > YMax) then
          YMax := Chart1.Value[I];
      end;
    end;
  end;

  // Preenche o Total Geral situado na parte inferior do Gráfico
  Chart1.Title[3] := FU.CMTranslateMsg(MSG_TITULO_NUM_OCORR, [IntToStr(iTotHor)]);

  // Para enganar o 'bug'
  if (iTotHor = 0) then
    for c:=0 to SvTam-1 do
      Chart1.Value[c] := 0;

  // Calculo a Escala em que o Gráfico será apresentado
  I3 := 1;
  while (YMax > I3) do
    I3 := I3 * 10;
  I3 := int(I3 / 20); // Escala de Y
  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y
  Chart1.CloseData(1);

  // ------------------------------
  // Gráfico Resumido
  // ------------------------------
  Chart2.OpenDataEx(1,1,iTamY);
  Chart2.ChartType := 5;

  // Preenche as Legendas
  for c:=0 to iTamY-1 do
    Chart2.Legend[c] := ListaDescOcorrSel[c];

  // Preenche o Título
  Chart2.Decimals := 0;
  Chart2.Title[2] := FU.CMTranslateMsg(MSG_TITULO, [sPeriodoGrafico]);

  // Preenche Valores
  YMax2 := 0;
  for c:=0 to iTamY-1 do
  begin
    Chart2.ThisSerie := 0;
    Chart2.Value[c] := CharTot[c];
    iTotAval := iTotAval + CharTot[c];
    if (Chart2.Value[c] > YMax2) then
      YMax2 := Chart2.Value[c];
  end;

  // Preenche o Total Geral situado na parte inferior do Gráfico
  Chart2.Title[3] := FU.CMTranslateMsg(MSG_TITULO_NUM_OCORR, [IntToStr(iTotAval)]);

  frmAguarde.Pos := frmAguarde.Pos + 1;

  // Calculo a Escala em que o Gráfico será apresentado
  I3 := 1;
  while (YMax2 > I3) do
    I3 := I3 * 10;
  I3 := int(I3 / 20); // Escala de Y
  Chart2.Adm[1] := YMax2; // Valor Máximo de Y
  Chart2.Adm[4] := I3; // Escala de Y
  Chart2.CloseData(1);

  frmAguarde.Apaga;
  ExecutarIrPaginaResult;

  ListaCodOcorrSel.Free;
  ListaDescOcorrSel.Free;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmSelEstAusencia.HabilitarBtOk;
var
  c: integer;
  bSelOcorr: boolean;
begin
  bSelOcorr := false;
  for c:=0 to chklstTipoOcorr.Items.Count-1 do
    if (chklstTipoOcorr.Checked[c]) then
    begin
      bSelOcorr := true;
      break;
    end;

  bbtnConfirmar.Enabled := bSelOcorr and (((spedAno1.Value <= spedAno2.Value) and
    (rgFreq.ItemIndex = 1) and (spedAno1.Value > spedAno2.Value -12)) or
    ((spedAno1.Value = spedAno2.Value) and (rgFreq.ItemIndex = 0)));
end;

procedure TfrmSelEstAusencia.CriarListaTipoOcMed;
begin
  dmCds.Cds.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodTipOcMed.Add(dmCds.Cds.FieldByName('CODTIPOOCMED').asString);
    chklstTipoOcorr.Items.Add(dmCds.Cds.FieldByName('DESCRTIPOOCMED').asString);
    dmCds.Cds.Next;
  end;
end;

end.
