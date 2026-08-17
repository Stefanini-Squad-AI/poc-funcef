unit fParamVTMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, Spin, ExtCtrls,
  checklst, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, wwdbdatetimepicker, fSairAjuda, DBClient,
  CMDateTimePicker, ColorCheckListBox, uCtrlGlobalRH, uCtrlPessoaFilialPessoa,
  uCtrlParamVTMagnetico;

type
  TfrmParamVTMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
    ToolbarSep972: TToolbarSep97;
    rbtnGerar: TBitBtn;
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    gbxIntervRef: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtedInicio: TCMDateTimePicker;
    dtedFim: TCMDateTimePicker;
    gbxIndentFunc: TGroupBox;
    cmbIdentFunc: TComboBox;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxDiasMin: TGroupBox;
    speDias: TSpinEdit;
    gbxDesconta: TGroupBox;
    chkbFerias: TCheckBox;
    chkbFaltas: TCheckBox;
    chkbFeriados: TCheckBox;
    gbxQuantDias: TGroupBox;
    spedQuantDias: TSpinEdit;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    pnlHorario: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rbtnGerarClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure dtedInicioChange(Sender: TObject);
  private
    CtrlParamVTMagnetico: TCtrlParamVTMagnetico;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    ListaIdEstab: TStringList;

    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;
    procedure Progresso(Args: array of variant);    
  end;

var
  frmParamVTMagnetico: TfrmParamVTMagnetico;

implementation

uses uSistema, uMensErro, uModulo, uCtrlPadroes, uCtrlFuncoesRH, fAguarde, FileCtrl, dCds,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmParamVTMagnetico.FormCreate(Sender: TObject);
begin
  inherited;
  ListaIdEstab := TStringList.Create;

  CtrlParamVTMagnetico := TCtrlParamVTMagnetico.Create(Modulo.IdContraCheque);
  CtrlParamVTMagnetico.InitializeAs(Padroes);
  CtrlParamVTMagnetico.Progresso := Progresso;

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  // Monta ChekListBox dos Estabelecimentos
  chklstEstab.Items.Clear;
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Pego a data default da tabela de parâmetros
  dtedInicio.Date := FU.ProxMes(CtrlGlobalRH.GetNormalIni);
  dtedFim.Date := FU.ProxMes(CtrlGlobalRH.GetNormalFim);
  pnlHorario.Caption := '';
  cmbIdentFunc.ItemIndex := 0;
  cmbOrderBy.ItemIndex := 2;
end;

procedure TfrmParamVTMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(ListaIdEstab);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlParamVTMagnetico);
  inherited;
end;

procedure TfrmParamVTMagnetico.dtedInicioChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamVTMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamVTMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamVTMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamVTMagnetico.rbtnGerarClick(Sender: TObject);
var
  Arq: TStringList;
  sListaIdEstabSel: string;
begin
  if not(VerificaOpcoesOk) then
    exit;

  Arq := TStringList.Create;

  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Processamento
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Processando Dados...');
  CtrlParamVTMagnetico.CreateThreadProgresso;
  Arq.Text := CtrlParamVTMagnetico.ProcessarGeracao(
    sListaIdEstabSel,
    dtedInicio.Date,
    dtedFim.Date,
    chkbFerias.Checked,
    chkbFeriados.Checked,
    chkbFaltas.Checked,
    spedQuantDias.Value,
    speDias.Value,
    cmbIdentFunc.ItemIndex,
    cmbOrderBy.ItemIndex);

  CtrlParamVTMagnetico.FreeThreadProgresso;
  if (Arq.Text <> '') then
  begin
    frmAguarde.Mostra('Salvando Arquivo...');
    frmAguarde.pbAguarde.Visible := false;
    try    
      Arq.SaveToFile(svdlgDialogo.FileName);
      frmAguarde.Apaga;
      MsgDlg('Arquivo VALE.TXT gerado com sucesso.', 'Aviso', mtInformation, [mbOk], 0);
    except
      frmAguarde.Apaga;
      MsgDlg('Ocorreu um erro durante a criação em ' +svdlgDialogo.FileName, 'Erro',
        mtError, [mbOk, mbHelp], 0);
    end;
  end
  else
  begin
    frmAguarde.Apaga;
    MsgDlg('Ocorreu um erro durante o Processamento.'+CR_LF+
      'Este erro pode ser decorrente da falta de dados no cadastro dos Empregados'+CR_LF+
      'ou uma falha no Sistema Folha de Pagamento.', 'Erro', mtError, [mbOk, mbHelp], 0);
  end;

  CtrlParamVTMagnetico.SQL.SaveToFile('c:\qry.txt');

  frmAguarde.Apaga;

  pnlHorario.Caption := 'Tempo de Processamento: ' +CtrlParamVTMagnetico.TempoDeProcessamento;

  Arq.Free;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamVTMagnetico.HabilitaBtOk;
var
  c: integer;
  bSelEstab: boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  rbtnGerar.Enabled := (bSelEstab) and (Trim(dtedInicio.Text) <> '') and
    (Trim(dtedFim.Text) <> '');
end;

function TfrmParamVTMagnetico.VerificaOpcoesOk: boolean;
begin
  Result := false;

  frmAguarde.Apaga;

  svdlgDialogo.FileName := 'C:\VALE\VALE.TXT';

  // Abro o diálogo de seleção do arquivo
  if not(DirectoryExists('C:\VALE')) then
  begin
    if (MsgDlg('Pasta C:\VALE\ não foi encontrada.'+CR_LF+
        'Deseja criá-la?', 'Aviso', mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
      CreateDir('C:\VALE\')
    else
    if not(svdlgDialogo.Execute) then
      exit;
  end;

  // Verifica se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    if (MsgDlg('O arquivo já existe na pasta especificada.'+CR_LF+
        'Deseja sobrescrevê-lo?', 'Aviso', mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
      exit;

  Result := true;
end;

procedure TfrmParamVTMagnetico.Progresso(Args: array of variant);
begin
  if (Args[0] > 0) then
  begin
    frmAguarde.Min := 0;
    frmAguarde.Max := Args[0];
  end;

  if (Args[1] > 0) then
    frmAguarde.Pos := frmAguarde.Pos + Args[1];

  if (Args[0] > 0) or (Args[1] > 0) then
    frmAguarde.Update;
end;

end.
