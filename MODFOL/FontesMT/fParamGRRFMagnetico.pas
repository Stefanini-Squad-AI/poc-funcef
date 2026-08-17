// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGRRFMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Mask, wwdblook, Db, DBTables,
  checklst, ComCtrls, CMDateTimePicker, fSairAjuda, wwdbdatetimepicker, IniFiles, DBClient,
  uCMClientDataSet, Gauges, fcLabel, TB97Tlwn, ColorCheckListBox, uCmSqlParams,
  uCtrlProvDesc, uCtrlParamGRRFMagnetico, uCtrlGlobalRH, uCtrlPessoaFilialPessoa,
  uCtrlListTerceirosRH, uCtrlPessoaFuncionario, IvEMulti;

type
  TfrmParamGRRFMagnetico = class(TfrmSairAjuda)
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pnlHorario: TPanel;
    CdsNomeResp: TCMClientDataSet;
    pnlProgresso: TPanel;
    fclblTitulo: TfcLabel;
    Bevel11: TBevel;
    lblProcesso: TLabel;
    lblHoraIni: TLabel;
    Bevel1: TBevel;
    gagTotal: TGauge;
    Label18: TLabel;
    lblTempoDecorr: TLabel;
    pgctrlPrincipal: TPageControl;
    tbshDadosPrinc: TTabSheet;
    tbshRubricas: TTabSheet;
    pgctrlRubricas: TPageControl;
    tbshSelRub1: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshSelRub2: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    tbshSelRub0: TTabSheet;
    chklstRubrica0: TColorCheckListBox;
    tbshSelRub3: TTabSheet;
    chklstRubrica3: TColorCheckListBox;
    sbtnMarcarRub: TBitBtn;
    StaticText1: TStaticText;
    edCodRubricas: TEdit;
    CdsAux: TCMClientDataSet;
    CdsSimples: TCMClientDataSet;
    sqlSimples: TCMSqlParams;
    tbshSelRub4: TTabSheet;
    chklstRubrica4: TColorCheckListBox;
    CdsNomeContato: TCMClientDataSet;
    pgctrlSel: TPageControl;
    tbshEstab: TTabSheet;
    chklstEstab: TColorCheckListBox;
    tbshCCusto: TTabSheet;
    chklstCCusto: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    gbxDataProcess: TGroupBox;
    dtPagamento: TCMDateTimePicker;
    rgTipoBusca: TRadioGroup;
    gbxResponsavel: TGroupBox;
    dblkcbResponsavel: TwwDBLookupCombo;
    gbxContato: TGroupBox;
    dblkcbContato: TwwDBLookupCombo;
    GroupBox2: TGroupBox;
    dblckSimples: TwwDBLookupCombo;
    tbshSelRub5: TTabSheet;
    chklstRubrica5: TColorCheckListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure chklstRubrica1ClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
  private
    CtrlParamGRRFMagnetico: TCtrlParamGRRFMagnetico;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlProvDesc: TCtrlProvDesc;

    ListaIdEstab: TStringList;
    ListaCodCCusto: TStringList;
    ListaIdRubrica: TStringList;

    ListaIdRubricaSel: array[0..NUM_VALORES-1] of string;

    sPastaArq: string;
    sNomeArq: string;
    
    ArqConfig: TIniFile; // Arquivo de Configuração

    procedure LerAlteracoes;
    procedure GravarAlteracoes;
    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;
    // Atualiza Tela de Progresso
    procedure Progresso(const TempoAtual, Mensagem: string; const Incremento: integer);
    procedure CriarListaEstab;
    procedure CriarListaCCusto;
    procedure CriarListaRubrica;
  end;

var
  frmParamGRRFMagnetico: TfrmParamGRRFMagnetico;

implementation

uses FileCtrl, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_TITULO = 'Gerando GRRF.RE de :1...';
  MSG_ERRO_CRIAR_PASTA =
    'O usuário logado na máquina não possui permissão:1'+
    'de escrita em :2. Será preciso escolher um outro:3'+
    'local para a geração do arquivo GRRF.';
  PASTA_NAO_ENCONTRADA =
    'Pasta :1 não foi encontrada.';

{$R *.DFM}

procedure TfrmParamGRRFMagnetico.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  CtrlParamGRRFMagnetico := TCtrlParamGRRFMagnetico.Create;
  CtrlParamGRRFMagnetico.InitializeAs(Padroes);
  CtrlParamGRRFMagnetico.OnProgresso := Progresso;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFuncionario.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  ListaIdEstab := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdRubrica := TStringList.Create;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  CdsNomeContato.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(Sistema.IdEmpresa);

  CriarListaEstab;
  CriarListaCCusto;
  CriarListaRubrica;

  sqlSimples.Open;
  dblckSimples.LookupValue := CdsSimples.FieldByName('ID').asString;

  dtPagamento.Text := '07/'+Copy(DateToStr(Date),4,2)+'/'+Copy(DateToStr(Date),7,4);
  pnlHorario.Caption := '';
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlSel.ActivePageIndex := 0;
  pgctrlRubricas.ActivePageIndex := 0;

  LerAlteracoes;
  HabilitaBtOk;
end;

procedure TfrmParamGRRFMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaCodCCusto);

  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlParamGRRFMagnetico);
  inherited;
end;

procedure TfrmParamGRRFMagnetico.pgctrlRubricasChange(Sender: TObject);
begin
  edCodRubricas.Text := ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex];
end;

procedure TfrmParamGRRFMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamGRRFMagnetico.chklstRubrica1ClickCheck(Sender: TObject);
var
  CheckListBox: TColorCheckListBox;
begin
  CheckListBox := TColorCheckListBox(
    Self.FindComponent('chklstRubrica'+IntToStr(pgctrlRubricas.ActivePageIndex)));

  FU.CriaListaOpcoes(CheckListBox, ListaIdRubrica, ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex], ',', false);
  edCodRubricas.Text := ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex];
end;

procedure TfrmParamGRRFMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
  AuxObj: TColorCheckListBox;
begin
  if (pgctrlSel.ActivePageIndex = 0) then
    AuxObj := chklstEstab
  else
    AuxObj := chklstCCusto;

  for c:=0 to AuxObj.Items.Count-1 do
    AuxObj.Checked[c] := true;

  HabilitaBtOk;
  AuxObj.Repaint;
end;

procedure TfrmParamGRRFMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
  AuxObj: TColorCheckListBox;
begin
  if (pgctrlSel.ActivePageIndex = 0) then
    AuxObj := chklstEstab
  else
    AuxObj := chklstCCusto;

  for c:=0 to AuxObj.Items.Count-1 do
    AuxObj.Checked[c] := not(AuxObj.Checked[c]);

  HabilitaBtOk;
  AuxObj.Repaint;
end;

procedure TfrmParamGRRFMagnetico.sbtnMarcarRubClick(Sender: TObject);
var
  CheckListBox: TColorCheckListBox;
begin
  CheckListBox := TColorCheckListBox(
    Self.FindComponent('chklstRubrica'+IntToStr(pgctrlRubricas.ActivePageIndex)));

  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(CheckListBox, ListaIdRubrica, edCodRubricas.Text, ',');
  ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex] := edCodRubricas.Text;
  CheckListBox.Repaint;
end;

procedure TfrmParamGRRFMagnetico.rbtnGerarClick(Sender: TObject);
var
  Arquivo: TStringList;
  bOk: boolean;
  wNum: word;
  sListaIdEstabSel, sListaCodCCustoSel: string;
begin
  // Verificar se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    pnlHorario.Caption := '';
    exit;
  end;

  fclblTitulo.Caption := FU.CMTranslateMsg(MSG_TITULO, [
    FU.PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text]);
  gagTotal.Progress := 0;
  gagTotal.MaxValue := 100;
  lblHoraIni.Caption := FU.CMTranslate('Hora de Início: ') + TimeToStr(Time);
  lblTempoDecorr.Caption := '00:00:00';

  pnlProgresso.Top := 153;
  pnlProgresso.Visible := true;
  pnlProgresso.Update;

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // C. de Custo selecionados
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sListaCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sListaCodCCustoSel := '';

  // Processamento
  bOk := CtrlParamGRRFMagnetico.ProcessarGeracao(Sistema.IdEmpresa,
    cmbMes.ItemIndex+1, speAno.Value, dtPagamento.Date, sListaIdEstabSel, sListaCodCCustoSel,
    CdsNomeResp.FieldByName('IDPESSOA').asFloat,
    CdsNomeContato.FieldByName('IDPESSOA').asFloat, (rgTipoBusca.ItemIndex = 0),
    FU.StrInt(dblckSimples.LookupValue), ListaIdRubricaSel[0], ListaIdRubricaSel[1],
    ListaIdRubricaSel[2], ListaIdRubricaSel[3], ListaIdRubricaSel[4], ListaIdRubricaSel[5]);

  pnlHorario.Caption := FU.CMTranslate('Tempo de Processamento: ') +CtrlParamGRRFMagnetico.TempoDecorridoTotal;
  pnlProgresso.Visible := false;

  if (bOk) then
  begin
    if (CtrlParamGRRFMagnetico.MessageInfo <> '') then
      MsgDlg(CtrlParamGRRFMagnetico.MessageInfo,
        FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0)
    else
    begin
      Arquivo := TStringList.Create;
      try
        try
          Arquivo.Text := CtrlParamGRRFMagnetico.DadosArquivo.Text;
          Arquivo.SaveToFile(sPastaArq + sNomeArq);

          MsgDlg(FU.CMTranslate('Arquivo GRRF.RE gerado com sucesso.'),
            FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        except
          on E: Exception do
          begin
            MsgDlg(FU.CMTranslate('Ocorreu um erro ao tentar gravar o arquivo GRRF.RE em ') +
              sPastaArq + FU.CMTranslate('Erro: ') +CR_LF+ E.Message,
              FU.CMTranslate('Erro'), mtError, [mbOk,mbHelp], 0);
          end;
        end;
      finally
        FreeAndNil(Arquivo);
      end;
    end;
  end
  else
  begin
    MsgDlg(FU.CMTranslate(CtrlParamGRRFMagnetico.MessageInfo),
      FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
  end;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamGRRFMagnetico.LerAlteracoes;
var
  c: byte;
  CheckListBox: TColorCheckListBox;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  //sPastaArq := ArqConfig.ReadString('GRRF_MAGNETICO', 'PastaArquivo', 'C:\GRRF');
  sPastaArq := ArqConfig.ReadString('GRRF_MAGNETICO', 'PastaArquivo', Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\GRRF');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  dblkcbResponsavel.LookupValue := ArqConfig.ReadString('GRRF_MAGNETICO', 'Responsavel', CdsNomeResp.FieldByName('IDPESSOA').asString);
  dblkcbResponsavel.Update;

  dblkcbContato.LookupValue := ArqConfig.ReadString('GRRF_MAGNETICO', 'Contato', CdsNomeContato.FieldByName('IDPESSOA').asString);
  dblkcbContato.Update;

  for c:=0 to NUM_VALORES-1 do
  begin
    ListaIdRubricaSel[c] := ArqConfig.ReadString('GRRF_MAGNETICO', 'Rubrica'+IntToStr(c), '');
    CheckListBox := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c)));
    FU.VerificaOpcoes(CheckListBox, ListaIdRubrica, ListaIdRubricaSel[c], ',');
  end;
  edCodRubricas.Text := ListaIdRubricaSel[0];
end;

procedure TfrmParamGRRFMagnetico.GravarAlteracoes;
var
  c: byte;
  sGravaPadrao: string;
begin
  ArqConfig.WriteString('GRRF_MAGNETICO', 'PastaArquivo', sPastaArq);

  sGravaPadrao := dblkcbResponsavel.LookupValue;
  ArqConfig.WriteString('GRRF_MAGNETICO', 'Responsavel', sGravaPadrao);

  sGravaPadrao := dblkcbContato.LookupValue;
  ArqConfig.WriteString('GRRF_MAGNETICO', 'Contato', sGravaPadrao);

  for c:=0 to NUM_VALORES-1 do
  begin
    sGravaPadrao := ListaIdRubricaSel[c];
    ArqConfig.WriteString('GRRF_MAGNETICO', 'Rubrica'+IntToStr(c), sGravaPadrao);
  end;

  ArqConfig.Free;
end;

procedure TfrmParamGRRFMagnetico.HabilitaBtOk;
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

  rbtnGerar.Enabled := (bSelEstab) and (Trim(speAno.Text) <> '') and
    (Trim(dtPagamento.Text) <> '') and (Trim(dblkcbResponsavel.Text) <> '') and
    (Trim(dblkcbContato.Text) <> '');
end;

function TfrmParamGRRFMagnetico.VerificaOpcoesOk: boolean;
var
  sOldPastaArq: string;

{->}function ProcurarPasta: boolean;
    begin
      Result := FU.ProcurarPasta(sPastaArq, FU.CMTranslate('Seleção de Pasta'),
        FU.CMTranslate('Escolha a Pasta para a Geração da GRRF'));
      if not(Result) then
        sPastaArq := sOldPastaArq;
{->}end;

begin
  Result := false;
  sOldPastaArq := sPastaArq;

  // Abrir o diálogo de seleção do arquivo
  if not(DirectoryExists(sPastaArq)) then
  begin
    if (MsgDlg(FU.CMTranslateMsg(PASTA_NAO_ENCONTRADA, [sPastaArq]) +CR_LF+
               FU.CMTranslate('Deseja criá-la?'), FU.CMTranslate('Confirmação'),
               mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
    begin
      try
        CreateDir(sPastaArq);
      except
        sPastaArq := FU.GetDirArqConfig;
        MsgDlg(FU.CMTranslateMsg(MSG_ERRO_CRIAR_PASTA, [CR_LF, sPastaArq, CR_LF]),
               FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        if not(ProcurarPasta) then
          exit;
      end;
    end
    else
    if not(ProcurarPasta) then
      exit;
  end;

  if (sPastaArq[Length(sPastaArq)] <> '\') then
    sPastaArq := sPastaArq + '\';

  sNomeArq := 'GRRF.RE';

  // Verificar se o arquivo existe na pasta escolhida
  if (FileExists(sPastaArq + sNomeArq)) then
    RenameFile(sPastaArq + sNomeArq,
      Copy(sPastaArq + sNomeArq, 1, Length(sPastaArq + sNomeArq) -
      Length(ExtractFileExt(sPastaArq + sNomeArq))) +'-'+
      FormatDateTime('yyyymmdd', FU.GetFileDate(sPastaArq + sNomeArq)) +
      ExtractFileExt(sPastaArq + sNomeArq));

  Result := true;
end;

procedure TfrmParamGRRFMagnetico.Progresso(const TempoAtual, Mensagem: string;
  const Incremento: integer);
begin
  if (TempoAtual <> '') then
    lblTempoDecorr.Caption := TempoAtual;

  if (Incremento > 0) then
    gagTotal.AddProgress(Incremento);

  if (Mensagem <> '') then
    lblProcesso.Caption := Mensagem;

  pnlProgresso.Repaint;
end;

procedure TfrmParamGRRFMagnetico.CriarListaEstab;
begin
  CdsAux.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsNomeResp.Data := CdsAux.Data;

  ListaIdEstab.Clear;
  chklstEstab.Items.Clear;
  while not(CdsAux.EOF) do
  begin
    ListaIdEstab.Add(CdsAux.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(CdsAux.FieldByName('NOME').asString);
    CdsAux.Next;
  end;
end;

procedure TfrmParamGRRFMagnetico.CriarListaCCusto;
begin
  CdsAux.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(CdsAux.EOF) do
  begin
    ListaCodCCusto.Add(CdsAux.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(CdsAux.FieldByName('NOME').asString);
    CdsAux.Next;
  end;
end;

procedure TfrmParamGRRFMagnetico.CriarListaRubrica;
var
  c: byte;
begin
  for c:=0 to NUM_VALORES-1 do
    TCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c))).Items.BeginUpdate;

  CdsAux.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(CdsAux.EOF) do
  begin
    ListaIdRubrica.Add(CdsAux.FieldByName('CODPROVDESC').asString);

    for c:=0 to NUM_VALORES-1 do
      TCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c))).Items.Add(
        CdsAux.FieldByName('DESCRPROVDESC').asString);

    CdsAux.Next;
  end;

  for c:=0 to NUM_VALORES-1 do
    TCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c))).Items.EndUpdate;
end;

end.
