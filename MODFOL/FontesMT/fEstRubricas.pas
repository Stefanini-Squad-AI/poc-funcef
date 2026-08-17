// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fEstRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fOkCancelar,
  StdCtrls, Spin, checklst, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, Db, DBTables, OleCtrls, chartfx3, wwdblook, ComCtrls, DBClient, uCmSqlParams,
  uCMClientDataSet, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlProvDesc,
  uCtrlListTerceirosRH, uCtrlPessoaFuncionario, ColorCheckListBox;

type
  TfrmEstRubricas = class(TfrmOkCancelar)
    pnlSelecao: TPanel;
    pnlResultado: TPanel;
    Chart1: TChartfx;
    Bevel1: TBevel;
    chklstRubrica: TColorCheckListBox;
    Label6: TLabel;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spnedAno: TSpinEdit;
    gbxFiltroCCusto: TGroupBox;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodosCCusto: TBitBtn;
    bbtnInverteSelCCusto: TBitBtn;
    gbxFunc: TGroupBox;
    Bevel2: TBevel;
    Label2: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    rgTipAnal: TRadioGroup;
    chklstFunc: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsEstab: TCMClientDataSet;
    CdsRubrica: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    sqlResultado: TCMSqlParams;
    CdsResultado: TCMClientDataSet;
    CdsFunc: TCMClientDataSet;
    bbtnAplicarSelCCusto: TBitBtn;
    gbxEstabelecimento: TGroupBox;
    bbtnSelTodosEstab: TBitBtn;
    bbtnInverteSelEstab: TBitBtn;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure chklstFuncClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnSelTodosCCustoClick(Sender: TObject);
    procedure bbtnInverteSelCCustoClick(Sender: TObject);
    procedure spnedAnoChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bbtnAplicarSelCCustoClick(Sender: TObject);
    procedure bbtnSelTodosEstabClick(Sender: TObject);
    procedure bbtnInverteSelEstabClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
  private
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlProvDesc: TCtrlProvDesc;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;

    ListaCodCCusto, ListaCodRubrica, ListaIdFunc, ListaIdEstab: TStringList;

    sListaIdEstabSel, sListaCodCCustoSel: string;
    ListaCheckCCusto: variant;

    procedure MudaListaFuncionarios;
    procedure HabilitaBtOk;
  end;

var
  frmEstRubricas: TfrmEstRubricas;

implementation

uses uMensErro, uSistema, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmEstRubricas.FormCreate(Sender: TObject);
var
  c: integer;
  NormalIni: TDateTime;
begin
  inherited;
  ListaCodRubrica := TStringList.Create;
  ListaIdFunc := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdEstab := TStringList.Create;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  // Preenche ChkList de Estabelecimentos
  c := 0;
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(CdsEstab.EOF) do
  begin
    ListaIdEstab.Add(CdsEstab.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
    chklstEstab.Checked[c] := true;
    CdsEstab.Next;
    Inc(c);
  end;

  //Preenche ChkList das Rubricas
  chklstRubrica.Items.Clear;
  CdsRubrica.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(CdsRubrica.EOF) do
  begin
    ListaCodRubrica.Add(CdsRubrica.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(CdsRubrica.FieldByName('DESCRPROVDESC').asString);
    CdsRubrica.Next;
  end;

  // Preenche ChkList dos C. Custo
  chklstCCusto.Items.Clear;
  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(CdsCCusto.EOF) do
  begin
    ListaCodCCusto.Add(CdsCCusto.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(CdsCCusto.FieldByName('NOME').asString);
    CdsCCusto.Next;
  end;
  ListaCheckCCusto := VarArrayCreate([1, CdsCCusto.RecordCount], varVariant);
  for c:=1 to CdsCCusto.RecordCount do
    ListaCheckCCusto[c] := false;

  // Ajustes na tela  
  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  spnedAno.Value := FU.ExtraiAno(NormalIni);

  Chart1.Align := alClient;
  pnlResultado.SendToBack;

  MudaListaFuncionarios;
end;

procedure TfrmEstRubricas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdFunc);
  FreeAndNil(ListaCodRubrica);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlPessoaFuncionario);
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

procedure TfrmEstRubricas.spnedAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmEstRubricas.chklstRubricaClickCheck(Sender: TObject);
var
  ListaRubricas: string;
begin
  inherited;
  HabilitaBtOk;
  FU.CriaListaOpcoes(chklstRubrica, ListaCodRubrica, ListaRubricas, ',', false);
  edCodRubricas.Text := ListaRubricas;
end;

procedure TfrmEstRubricas.chklstFuncClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmEstRubricas.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := true;
  HabilitaBtOk;
  chklstFunc.Repaint;
end;

procedure TfrmEstRubricas.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstFunc.Items.Count-1 do
    chklstFunc.Checked[c] := not(chklstFunc.Checked[c]);
  HabilitaBtOk;
  chklstFunc.Repaint;
end;

procedure TfrmEstRubricas.bbtnSelTodosCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := true;
  chklstCCusto.Repaint;
end;

procedure TfrmEstRubricas.bbtnInverteSelCCustoClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCCusto.Items.Count-1 do
    chklstCCusto.Checked[c] := not(chklstCCusto.Checked[c]);
  chklstCCusto.Repaint;
end;

procedure TfrmEstRubricas.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaCodRubrica, edCodRubricas.Text, ',');
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmEstRubricas.bbtnAplicarSelCCustoClick(Sender: TObject);
var
  c: integer;
  MudouCCusto: boolean;
begin
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

procedure TfrmEstRubricas.bbtnConfirmarClick(Sender: TObject);
const
  NUM_MESES = 12;
var
  ListaSel, ListaNome: TStringList;
  sMes1, sMes2, sListaCodRubricaSel, sListaIdFuncSel: string;
  c, iNumRubricasSel, X, Y: integer;
  CharVal: Variant;
  EscalaY, YMax: double;
begin
  inherited;
  ListaNome := TStringList.Create;
  ListaSel := TStringList.Create;

  frmAguarde.Mostra('Gerando dados da Evolução');
  frmAguarde.pbAguarde.Visible := false;
  frmAguarde.Pos := 0;

  // C. de Custo selecionados
  FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);

  // Funcionários escolhidos
  FU.CriaListaOpcoes(chklstFunc, ListaIdFunc, sListaIdFuncSel, ',', false);

  // Preenche Listas das Rubricas Selecionadas
  sListaCodRubricaSel := '';
  iNumRubricasSel := 0;
  for c:=0 to chklstRubrica.Items.Count-1 do
    if (chklstRubrica.Checked[c]) then
    begin
      Inc(iNumRubricasSel);
      ListaNome.Add(chklstRubrica.Items[c]);
      ListaSel.Add(ListaCodRubrica[c]);

      if (sListaCodRubricaSel = '') then
        sListaCodRubricaSel := QuotedStr(ListaCodRubrica[c])
      else
        sListaCodRubricaSel := sListaCodRubricaSel +','+ QuotedStr(ListaCodRubrica[c]);
    end;

  // Cria a matriz das rubricas e zera seus valores
  CharVal := VarArrayCreate([1, iNumRubricasSel, 1, NUM_MESES], varVariant);

  for X:=1 to iNumRubricasSel do
    for Y:=1 to NUM_MESES do
      CharVal[X,Y] := 0;

  // Seleciona valores
  sMes2 := Trim(spnedAno.Text) +'/'+ FU.PoeZero(cmbMes.ItemIndex+1);
  sMes1 := FU.IncDataAM(sMes2, -11);

  with (sqlResultado.SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  H.CODPROVDESC, H.MES,');
    Add('  SUM(H.VALORPROVENTO) AS TOTAL,');
    Add('  COUNT(H.IDPESSOA) AS QTDE');
    Add('FROM');
    Add('  HISTRUBSAL H, FUNCIONARIO F');
    Add('WHERE');
    Add('  (F.IDPESSOA         = H.IDPESSOA) AND');
    Add('  (F.IDESTAB    IN (' +sListaIdEstabSel+ ')) AND');

    // Funcionário(s) selecionado(s)
    if (Pos(',',sListaIdFuncSel) = 0) then
      Add('  (H.IDPESSOA      = ' +sListaIdFuncSel+ ') AND')
    else
      Add(FU.QuebrarListaFiltro(2, '(H.IDPESSOA     ', sListaIdFuncSel, 500)+ ' AND');

    Add('  (H.IDPESSJUR    = ' +IntToStr(Sistema.IdEmpresa)+ ') AND');

    if (Pos(',', sListaCodRubricaSel) > 0) then
      Add('  (H.CODPROVDESC IN (' +sListaCodRubricaSel+ ')) AND')
    else
      Add('  (H.CODPROVDESC = ' +sListaCodRubricaSel+ ') AND');

    Add('  (H.MES BETWEEN ' +QuotedStr(sMes1)+ ' AND ' +QuotedStr(sMes2)+ ')');
    Add('GROUP BY H.CODPROVDESC, H.MES');
    Add('ORDER BY H.CODPROVDESC, H.MES');
    //SaveToFile('C:\QRY.TXT');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\QRY.TXT');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;
  sqlResultado.Open;

  while not(CdsResultado.EOF) do
  begin
    for X:=1 to iNumRubricasSel do
      if (CdsResultado.FieldByName('CODPROVDESC').asString = ListaSel[X-1]) then
      begin
        Y := FU.DifDataAnoMes(CdsResultado.FieldByName('MES').asString, sMes1) + 1;
        case (rgTipAnal.ItemIndex) of
          0 : CharVal[X,Y] := CharVal[X,Y] + (CdsResultado.FieldByName('TOTAL').asFloat / 1000);
          1 : CharVal[X,Y] := CharVal[X,Y] + CdsResultado.FieldByName('QTDE').asFloat;
          2 : CharVal[X,Y] := CharVal[X,Y] + (CdsResultado.FieldByName('TOTAL').asFloat /
                                              CdsResultado.FieldByName('QTDE').asFloat);
        end;
      end;
    CdsResultado.Next;
  end;

  Chart1.OpenDataEx(1, iNumRubricasSel, NUM_MESES);

  for c:=0 to NUM_MESES-1 do
    if (StrToInt(Copy(sMes1,6,2))+c <= 12) then
      Chart1.Legend[c] := MesCurto[StrToInt(Copy(sMes1,6,2))+c]
    else
      Chart1.Legend[c] := MesCurto[StrToInt(Copy(sMes1,6,2))+c-12];

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

  for X:=0 to (iNumRubricasSel - 1) do
  begin
    Chart1.ThisSerie := X;
    Chart1.SerLeg[X] := ListaNome[X];

    for c:=0 to NUM_MESES-1 do
    begin
      Chart1.Value[c] := CharVal[X+1,c+1];

      if (Chart1.Value[c] > YMax) then
        YMax := Chart1.Value[c];
    end;
  end;

  EscalaY := 1;
  while (YMax > EscalaY) do
    EscalaY := EscalaY * 10;

  EscalaY := Int(EscalaY / 20); // Escala de Y

  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := EscalaY; // Escala de Y
  Chart1.CloseData(1);

  Chart1.Visible := true;
  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled := true;

  pnlResultado.BringToFront;

  ListaSel.Free;
  ListaNome.Free;

  frmAguarde.Apaga;
end;

procedure TfrmEstRubricas.bbtnCancelarClick(Sender: TObject);
begin
  pnlResultado.SendToBack;
  bbtnConfirmar.Enabled := true;
  bbtnCancelar.Enabled := false;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

// Cria lista contendo os códigos dos funcionários
procedure TfrmEstRubricas.MudaListaFuncionarios;
begin
  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  ListaIdFunc.Clear;
  chklstFunc.Items.Clear;

  if (sListaIdEstabSel <> '') then
  begin
    // C. de Custo selecionados
    FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', false);

    CdsFunc.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa, '',
      sListaIdEstabSel, '', '', '', sListaCodCCustoSel);

    while not(CdsFunc.EOF) do
    begin
      ListaIdFunc.Add(CdsFunc.FieldByName('IDPESSOA').asString);
      chklstFunc.Items.Add(CdsFunc.FieldByName('NOME').asString);
      CdsFunc.Next;
    end;

    bbtnSelTodosClick(nil);
  end;

  HabilitaBtOk;
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

  bbtnConfirmar.Enabled := (bSelRub) and (bSelFunc) and (sListaIdEstabSel <> '') and
    (Trim(spnedAno.Text) <> '');
end;

procedure TfrmEstRubricas.bbtnSelTodosEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  MudaListaFuncionarios;
end;

procedure TfrmEstRubricas.bbtnInverteSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  MudaListaFuncionarios;
end;

procedure TfrmEstRubricas.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  MudaListaFuncionarios;
end;

end.
