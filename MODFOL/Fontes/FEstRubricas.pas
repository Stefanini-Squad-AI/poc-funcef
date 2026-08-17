// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FEstRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Spin, checklst, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  OleCtrls, chartfx3, Wwtable, wwdblook, ComCtrls;

type
  TfrmEstRubricas = class(TfrmOkCancelar)
    pnlSelecao: TPanel;
    pnlResultado: TPanel;
    qryRubrica: TwwQuery;
    Chart1: TChartfx;
    qryResultado: TwwQuery;
    qryParamRH: TwwQuery;
    qryEstab: TwwQuery;
    qryFunc: TwwQuery;
    Bevel1: TBevel;
    chklstRubrica: TCheckListBox;
    Label6: TLabel;
    Label1: TLabel;
    dblkcbEstab: TwwDBLookupCombo;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    gbxFiltroCCusto: TGroupBox;
    chklstCCusto: TCheckListBox;
    bbtnSelTodosCCusto: TBitBtn;
    bbtnInverteSelCCusto: TBitBtn;
    gbxFunc: TGroupBox;
    Bevel2: TBevel;
    Label2: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    qryCCusto: TwwQuery;
    rgTipAnal: TRadioGroup;
    chklstFunc: TCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure dblkcbEstabChange(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstCCustoClickCheck(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure gbxFiltroCCustoExit(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    ListaCCusto, ListaRubrica, ListaFunc, ListaSel, ListaNome: TStringList;

    sMes1, sMes2, sCodEstab, sQueryCCusto: string;

    CharVal: Variant;
    Tam    : integer;
    YMax   : double;
    wDia, wMes, wAno: word;
    ListaCheckCCusto: variant;

    procedure MudaListaFuncionarios;
    procedure HabilitaBtOk;
  public
    { Public declarations }
  end;

var
  frmEstRubricas: TfrmEstRubricas;

implementation

uses uMensErro, uSistema, uFuncoesUteis, fAguarde, UsoGeralRH;

{$R *.DFM}

procedure TfrmEstRubricas.FormCreate(Sender: TObject);
var
  c: integer;
begin
  inherited;
  ListaRubrica := TStringList.Create;
  ListaFunc    := TStringList.Create;
  ListaCCusto  := TStringList.Create;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin 
    if (Pos(',',sUsuXfilial) > 0) then
      qryEstab.SQL[5] := '  (PJ.IDPESSOA IN ' +sUsuXfilial+ ') AND'
    else
      qryEstab.SQL[5] := '  (PJ.IDPESSOA  = ' +sUsuXfilial+ ') AND';
  end;

  qryEstab.ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
  qryEstab.Open;
  qryParamRH.Open;  

  //Preenche ChkList das Rubricas
  chklstRubrica.Items.Clear;
  with (qryRubrica) do
  begin
    ParamByName('EMPRESA').asInteger := Sistema.IdEmpresa;
    Open;
    while not(EOF) do
    begin
      ListaRubrica.Add(FieldByName('CODPROVDESC').asString);
      chklstRubrica.Items.Add(FieldByName('DESCRPROVDESC').asString);
      Next;
    end;
  end;

  // Preenche ChkList dos C. Custo
  chklstCCusto.Items.Clear;
  with (qryCCusto) do
  begin
    // C. de Custo(s) habilitado(s) para o usuário
    if (sUsuXccusto <> '') then
      SQL[4] := 'WHERE (CODCENTROCUSTO IN ' +sUsuXccusto+ ')';

    Open;
    Last;
    First;

    ListaCheckCCusto := VarArrayCreate([1, RecordCount], varVariant);
    for c:=1 to RecordCount do
      ListaCheckCCusto[c] := false;

    while not(EOF) do
    begin
      ListaCCusto.Add(FieldByName('CODCENTROCUSTO').asString);
      chklstCCusto.Items.Add(FieldByName('NOME').asString);
      Next;
    end;
  end;

  DecodeDate(qryParamRH.FieldbyName('NORMALINI').Value, wAno, wMes, wDia);

  Chart1.Align     := alClient;
  cmbMes.ItemIndex := wMes - 1;
  spnedAno.Value   := wAno;

  pnlResultado.SendToBack;
end;

procedure TfrmEstRubricas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ListaFunc.Free;
  ListaRubrica.Free;
  ListaCCusto.Free;

  qryRubrica.Close;
  qryEstab.Close;
  qryParamRH.Close;
  qryCCusto.Close;
  inherited;
end;

procedure TfrmEstRubricas.FormResize(Sender: TObject);
begin
  inherited;
  if (Width < 708) then
    Width := 708;

  if (Height < 488) then
    Height := 488;
end;

procedure TfrmEstRubricas.HabilitaBtOk;
var
  c: integer;
  bSelRub, bSelFunc: boolean;
begin
  bSelRub := false;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      bSelRub := true;
      break;
    end;

  bSelFunc := false;
  for c:=0 to chklstFunc.Items.Count-1 do
    if (chklstFunc.Checked[c]) then
    begin
      bSelFunc := true;
      break;
    end;

  bbtnConfirmar.Enabled := (bSelRub) and (bSelFunc) and (Trim(dblkcbEstab.Text) <> '') and
    (Trim(spnedAno.Text) <> '');
end;

// Cria lista contendo os códigos dos funcionários
procedure TfrmEstRubricas.MudaListaFuncionarios;
begin
  qryFunc.Close;
  ListaFunc.Clear;
  chklstFunc.Items.Clear;

  if (dblkcbEstab.Text <> '') then
  begin
    with (qryFunc.SQL) do
    begin
      Clear;
      Add ('SELECT DISTINCT');
      Add ('  PF.IDPESSOA, PF.NOME AS EMPREGADO');
      Add ('FROM');
      Add ('  PESSOA PF, FUNCIONARIO F, SITFUNC ST');
      Add ('WHERE');
      Add ('  (F.IDESTAB         = ' +qryEstab.FieldByName('CODIGO').asString+ ') AND');

      // C. de Custo selecionados
      CriaListaOpcoes (chklstCCusto, ListaCCusto, sQueryCCusto, ',', true);

      if (sQueryCCusto <> '') then
      begin
        if (Pos(',',sQueryCCusto) > 0) then
          Add ('  (F.CODCENTROCUSTO  IN (' +sQueryCCusto+ ')) AND')
        else
          Add ('  (F.CODCENTROCUSTO   = ' +sQueryCCusto+ ') AND');
      end
      else
      begin
        // C. de Custo(s) habilitados para o usuário
        if (sUsuXccusto <> '') then
        begin
          if (Pos(',',sUsuXccusto) > 0) then
            Add ('  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND')
          else
            Add ('  (F.CODCENTROCUSTO  = ' +sUsuXccusto+ ') AND');
        end;
      end;

      Add ('  (ST.IDSITFUNC      = F.IDSITFUNC) AND');
      Add ('  (F.IDPESSOA        = PF.IDPESSOA)');
      Add ('ORDER BY');
      Add ('  UPPER(EMPREGADO)');
    end;
    qryFunc.Open;

    while not(qryFunc.EOF) do
    begin
      ListaFunc.Add(QryFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(qryFunc.FieldByName('EMPREGADO').asString);
      qryFunc.Next;
    end;
    
    bbtnSelTodosClick(nil);
  end;

  HabilitaBtOk;
end;

procedure TfrmEstRubricas.chklstRubricaDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with (TCheckListBox(Control).Canvas) do
  begin
    if (TCheckListBox(Control).Checked[Index]) then
      if (odSelected in State) then
      begin
        Brush.Color := clTeal;
        Font.Color := clWhite;
      end
      else
      begin
        Brush.Color := CL_AMARELO_CLARO;
        Font.Color := clBlack;
      end;

    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmEstRubricas.dblkcbEstabChange(Sender: TObject);
begin
  inherited;
  dblkcbEstab.Text := Trim(dblkcbEstab.Text);

  if (dblkcbEstab.Text <> sCodEstab) then
  begin
    MudaListaFuncionarios;

    sCodEstab := dblkcbEstab.Text;

    chklstFunc.Repaint;
  end;
end;

procedure TfrmEstRubricas.spnedAnoChange(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmEstRubricas.chklstRubricaClickCheck(Sender: TObject);
var
  ListaRubricas: string;
begin
  HabilitaBtOk;
  CriaListaOpcoes (chklstRubrica, ListaRubrica, ListaRubricas, ',', false);
  edCodRubricas.Text := ListaRubricas;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmEstRubricas.chklstFuncClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmEstRubricas.chklstCCustoClickCheck(Sender: TObject);
begin
  InvalidateItemListBox(TCustomListBox(Sender),TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmEstRubricas.bbtnSelTodosClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[i] := true;

  HabilitaBtOk;  
  chklstFunc.Repaint;
end;

procedure TfrmEstRubricas.bbtnInverteSelClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[i] := not(chklstFunc.Checked[i]);

  HabilitaBtOk;  
  chklstFunc.Repaint;
end;

procedure TfrmEstRubricas.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  // Seleciona Todos
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;

  chklstCCusto.Repaint;
end;

procedure TfrmEstRubricas.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  inherited;
  // Inverte Seleção
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);

  chklstCCusto.Repaint;
end;

procedure TfrmEstRubricas.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  pnlResultado.SendToBack;
  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled  := false;
end;

procedure TfrmEstRubricas.gbxFiltroCCustoExit(Sender: TObject);
var
  c: integer;
  MudouCCusto: boolean;
begin
  inherited;
  // Verifico se algum C. Custo foi mudado
  MudouCCusto := false;
  for c:=0 to chklstCCusto.Items.Count-1 do
    if (ListaCheckCCusto[c+1] <> chklstCCusto.Checked[c]) then
    begin
      MudouCCusto := true;
      break;
    end;
  // Atualizo a nova posição da Lista de C. Custo
  for c:=0 to chklstCCusto.Items.Count-1 do
    ListaCheckCCusto[c+1] := chklstCCusto.Checked[c];

  if (MudouCCusto) then
  begin
    MudaListaFuncionarios;
    chklstFunc.Repaint;
  end;
end;

procedure TfrmEstRubricas.sbtnMarcarRubClick(Sender: TObject);
begin
  inherited;
  edCodRubricas.Text := Trim(edCodRubricas.Text);

  VerificaOpcoes (chklstRubrica, ListaRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmEstRubricas.bbtnConfirmarClick(Sender: TObject);
var
  I3: double;
  sQueryRub, sQueryFunc: string;
  i, k, I1, I2: integer;
begin
  inherited;
  ListaNome := TStringList.Create;
  ListaSel  := TStringList.Create;

  frmAguarde.Mostra ('Gerando dados da Evolução');
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Pos := 0;

  // C. de Custo selecionados
  CriaListaOpcoes (chklstCCusto, ListaCCusto, sQueryCCusto, ',', true);

  // Funcionários escolhidos
  CriaListaOpcoes (chklstFunc, ListaFunc, sQueryFunc, ',', false);

  // Preenche Listas das Rubricas Selecionadas
  sQueryRub:=''; k:=0;
  for i:=0 to chklstRubrica.Items.Count-1 do
  begin
    if (chklstRubrica.Checked[i]) then
    begin
      Inc(k);
      ListaNome.Add(chklstRubrica.Items[i]);
      ListaSel.Add(ListaRubrica[i]);

      if (k = 1) then
        sQueryRub := QuotedStr(ListaRubrica[i])
      else
        sQueryRub := sQueryRub +','+ QuotedStr(ListaRubrica[i]);
    end;
  end;

  Tam     := 12;
  CharVal := VarArrayCreate([1, k, 1, Tam], varVariant);

  for I1:=1 to k  do
    for I2:=1 to Tam do
      CharVal[I1,I2] := 0;

  sMes2 := Trim(spnedAno.Text) +'/'+ PoeZero(cmbMes.ItemIndex+1);
  sMes1 := IncDataAM(sMes2, -11);

  qryResultado.Close;
  with (qryResultado.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.CODPROVDESC, H.MES,');
    Add('  SUM(H.VALORPROVENTO) AS TOTAL,');
    Add('  COUNT(H.IDPESSOA) AS QTDE');
    Add('FROM');
    Add('  HISTRUBSAL H');
    Add('WHERE');

    // Funcionário(s) selecionado(s)
    if (Pos(',',sQueryFunc) > 0) then
      Add('  (H.IDPESSOA    IN (' +sQueryFunc+ ')) AND')
    else
      Add('  (H.IDPESSOA     = ' +sQueryFunc+ ') AND');

    Add('  (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    if (Pos(',',sQueryRub) > 0) then
      Add('  (H.CODPROVDESC IN (' +sQueryRub+ ')) AND')
    else
      Add('  (H.CODPROVDESC = ' +sQueryRub+ ') AND');

    Add('  (H.MES BETWEEN ' +QuotedStr(sMes1)+ ' AND ' +QuotedStr(sMes2)+ ')');
    Add('GROUP BY H.CODPROVDESC, H.MES');
    Add('ORDER BY H.CODPROVDESC, H.MES');
    //SaveToFile ('C:\QRY.TXT');
    SaveToFile (Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\QRY.TXT'); //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  end;
  qryResultado.Open;

  while not(qryResultado.EOF) do
  begin
    for I1:=1 to k do
      if (qryResultado.FieldByName('CODPROVDESC').asString = ListaSel[I1-1]) then
      begin
        I2 := DifDataAnoMes(qryResultado.FieldByName('MES').asString, sMes1) + 1;
        case (rgTipAnal.ItemIndex) of
          0 : CharVal[I1,I2] := CharVal[I1,I2] + (qryResultado.FieldByName('TOTAL').asFloat / 1000);
          1 : CharVal[I1,I2] := CharVal[I1,I2] + qryResultado.FieldByName('QTDE').asFloat;
          2 : CharVal[I1,I2] := CharVal[I1,I2] + (qryResultado.FieldByName('TOTAL').asFloat /
                                                  qryResultado.FieldByName('QTDE').asFloat);
        end;
      end;
    qryResultado.Next;
  end;

  Chart1.OpenDataEx(1, k, Tam);

  for I:=0 to Tam-1 do
    Chart1.Legend[I] := MesCurto[
      IFF(StrToInt(copy(sMes1,6,2))+I <= 12,
        StrToInt(copy(sMes1,6,2))+I, StrToInt(copy(sMes1,6,2))+I-12)];

  if (rgTipAnal.ItemIndex = 0) then
    Chart1.Decimals := 1
  else
    Chart1.Decimals := 0;

  Chart1.Title[2] := 'Estatística Evolutiva da Folha de Pagamento';

  case (rgTipAnal.ItemIndex) of
    0 : Chart1.Title[3] := 'Valores Expressos em Milhares';
    1 : Chart1.Title[3] := 'Quantidade de Funcionários';
    2 : Chart1.Title[3] := 'Valores Expressos em Moeda Corrente';
  end; 

  YMax := 0;

  for I1:=0 to (k - 1) do
  begin
    Chart1.ThisSerie  := I1;
    Chart1.SerLeg[I1] := ListaNome[I1];

    for I:=0 to (TAM - 1) do
    begin
      Chart1.Value[I] := CharVal[I1+1,I+1];

      if (Chart1.Value[I] > YMax) then
        YMax := Chart1.Value[I];
    end;
  end;

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); {Escala de Y}

  Chart1.Adm[1] := YMax;    {Valor Máximo de Y}
  Chart1.Adm[4] := I3;      {Escala de Y}
  Chart1.CloseData(1);      {Close the VALUES channel}

  Chart1.Visible        := true;
  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled  := true;

  pnlResultado.BringToFront;

  ListaSel.Free;
  ListaNome.Free;

  frmAguarde.Apaga;
end;

end.
