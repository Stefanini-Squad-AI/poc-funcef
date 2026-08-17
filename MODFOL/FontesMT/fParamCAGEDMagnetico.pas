// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
// Autor(a)    :  Henrique Massão
// Data        :  20/10/2009
// Pendência   : SOL 124276 KINTANA 629634
// Descricao   :  Alteração nos captions dos tipos de contratos
//------------------------------------------------------------------------------
unit fParamCAGEDMagnetico;

interface
                                                              
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Db, wwdblook, Mask, DBTables,
  Wwdatsrc, FileCtrl, checklst, DBCtrls, Grids, DBGrids, ComCtrls, IniFiles, DBClient,
  IvEMulti, uCMClientDataSet, Wwdbigrd, Wwdbgrid, fSairAjuda, ColorCheckListBox, 
  uCtrlGlobalRH, uCtrlProvDesc, uCtrlPessoaFilialPessoa, uCtrlParamCAGEDMagnetico;

type
  TfrmParamCAGEDMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
    rbtnGerar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    CdsResp: TCMClientDataSet;
    CdsFunc2Moviment: TCMClientDataSet;
    dsPrincipal: TwwDataSource;
    pnlFunc2Moviment: TPanel;
    dbgrFunc2Moviment: TwwDBGrid;
    Memo1: TMemo;
    Image1: TImage;
    bbtnCancelar: TBitBtn;
    bbtnProsseguir: TBitBtn;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    pnlSelecao: TPanel;
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    rgTipoInf: TRadioGroup;
    gbxNumAutoriz: TGroupBox;
    mkedNumAutoriz: TMaskEdit;
    gbxAnoMesRef: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    speDia: TSpinEdit;
    rgTipoDeclarac: TRadioGroup;
    rgMicroEmpr: TRadioGroup;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    rgMeioInf: TRadioGroup;
    gbxAlteracao: TGroupBox;
    pgctrlAltCad: TPageControl;
    tbshResponsavel: TTabSheet;
    cmbAlteracaoResp: TComboBox;
    tbshEstab: TTabSheet;
    cmbAlteracaoEstab: TComboBox;
    gbxRubSal: TGroupBox;
    Label1: TLabel;
    chklstRubrica: TColorCheckListBox;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    gbxTipoFunc: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    pnlHorario: TPanel;
    bbtnVerResultado: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    svdlgResult: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure chklstRubricaClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure rgTipoInfExit(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnProsseguirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
  private
    CtrlParamCAGEDMagnetico: TCtrlParamCAGEDMagnetico;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlProvDesc: TCtrlProvDesc;

    ArqConfig: TIniFile;
    ListaIdEstab, ListaIdRubrica: TStringList;

    bBtOkHabilitado: boolean;

    sListaIdEstabSel, sListaIdRubSel: string;

    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;
    procedure LeAlteracoes;
    procedure GravaAlteracoes;
    procedure HabilitarBtResult(const Visivel: boolean);
    procedure Progresso(const NumReg: integer; const MsgVerificaEstab, MsgVerificaResp,
      MsgProcessando, IncProgresso: boolean; MsgLog: string);
  end;

var
  frmParamCAGEDMagnetico: TfrmParamCAGEDMagnetico;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, dCds, uCtrlUsoGeralRH;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_HINT =
    'Para o caso de demissão, será apurado o valor da(s) rubrica(s):1'+
    'que forem parametrizadas com a CLT 63012';
  MSG_ARQ = 'Arquivo :1 gerado com sucesso.';
  MSG_ERRO_CRIACAO_ARQ = 'Ocorreu um erro durante a criação em :1';
  
{$R *.DFM}

procedure TfrmParamCAGEDMagnetico.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  ListaIdEstab := TStringList.Create;
  ListaIdRubrica := TStringList.Create;

  CtrlParamCAGEDMagnetico := TCtrlParamCAGEDMagnetico.Create;
  CtrlParamCAGEDMagnetico.InitializeAs(Padroes);
  CtrlParamCAGEDMagnetico.CdsFunc2Moviment := CdsFunc2Moviment;
  CtrlParamCAGEDMagnetico.OnProgresso := Progresso;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsResp.Data := dmCds.Cds.Data;

  // Montar o ChekListBox dos Estabelecimentos
  chklstEstab.Items.Clear;
  while not(dmCds.Cds.EOF) do
  begin
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    ListaIdEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    dmCds.Cds.Next;
  end;

  // Montar o ChekListBox das Rubricas
  chklstRubrica.Items.Clear;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa), -1,
    'RP.CODPROVDESC, RP.DESCRPROVDESC');
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;

  rgTipoInfExit(Sender);

  // Inicializa variáveis
  mkedNumAutoriz.Text := '';
  dblkcbResp.Text := CdsResp.FieldByName('NOME').asString;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Value := FU.ExtraiAno(NormalIni);
  
  pnlHorario.Caption := '';
  speDia.Value := FU.ExtraiDia(Date);
  pgctrlAltCad.ActivePageIndex := 0;
  cmbAlteracaoResp.ItemIndex := 0;
  cmbAlteracaoEstab.ItemIndex := 0;
  gbxRubSal.Hint := FU.CMTranslateMsg(MSG_HINT, [CR_LF]);
  pnlSelecao.BringToFront;
  HabilitarBtResult(false);

  // Carrega alterações nas opções feitas anteriormente
  LeAlteracoes;

  svdlgDialogo.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\CAGED';
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  svdlgResult.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
  //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
end;

procedure TfrmParamCAGEDMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamCAGEDMagnetico);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlProvDesc);
  GravaAlteracoes;
  FreeAndNil(ListaIdEstab);
  FreeAndNil(ListaIdRubrica);
  inherited;
end;

procedure TfrmParamCAGEDMagnetico.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.rgTipoInfExit(Sender: TObject);
begin
  speDia.Visible := (rgTipoInf.ItemIndex = 1);
  if (speDia.Visible)  then
  begin
    cmbMes.Left := 54;
    cmbMes.Width := 94;
  end
  else
  begin
    cmbMes.Left := 8;
    cmbMes.Width := 140;
  end;
end;

procedure TfrmParamCAGEDMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.chklstRubricaClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubSel, ',', false);
  edCodRubricas.Text := sListaIdRubSel;
end;

procedure TfrmParamCAGEDMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  chklstEstab.Repaint;
  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, edCodRubricas.Text, ',');
  sListaIdRubSel := edCodRubricas.Text;
  HabilitaBtOk;
  chklstRubrica.Repaint;
end;

procedure TfrmParamCAGEDMagnetico.rbtnGerarClick(Sender: TObject);
var
  sTipoContratoSel: string;
begin
  if not(VerificaOpcoesOk) then
    exit;

  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Tipos de Contrato selecionados
  sTipoContratoSel := '';
  if (cbxEfetivos.Checked) then
    sTipoContratoSel := sTipoContratoSel + QuotedStr('E');
  if (cbxEspeciais.Checked) then
    sTipoContratoSel := sTipoContratoSel +FU.IFF(sTipoContratoSel <> '',',','')+ QuotedStr('S');
  if (cbxTemporarios.Checked) then
    sTipoContratoSel := sTipoContratoSel +FU.IFF(sTipoContratoSel <> '',',','')+ QuotedStr('T');
  if (cbxTerceiros.Checked) then
    sTipoContratoSel := sTipoContratoSel +FU.IFF(sTipoContratoSel <> '',',','')+ QuotedStr('3');
  if (cbxPropDirSemVinc.Checked) then
    sTipoContratoSel := sTipoContratoSel +FU.IFF(sTipoContratoSel <> '',',','')+ QuotedStr('P');
  if (cbxAutonomos.Checked) then
    sTipoContratoSel := sTipoContratoSel +FU.IFF(sTipoContratoSel <> '',',','')+ QuotedStr('A');
  if (cbxEstagiarios.Checked) then
    sTipoContratoSel := sTipoContratoSel +FU.IFF(sTipoContratoSel <> '',',','')+ QuotedStr('G');

  // Processamento
  frmAguarde.Pos := 0;
  frmAguarde.pbAguarde.Visible := false;
  if (CtrlParamCAGEDMagnetico.IniciarProcessamento(
      Sistema.IdEmpresa,
      sListaIdEstabSel,
      sListaIdRubSel,
      CdsResp.FieldByName('IDPESSOA').asFloat,
      cmbMes.ItemIndex + 1,
      speAno.Value,
      sTipoContratoSel,
      rgMeioInf.ItemIndex + 2,
      mkedNumAutoriz.Text,
      rgTipoInf.ItemIndex = 0,
      cmbAlteracaoResp.ItemIndex + 1,
      cmbAlteracaoEstab.ItemIndex + 1,
      rgTipoDeclarac.ItemIndex = 0,
      rgMicroEmpr.ItemIndex = 0)) then
  begin
    if not(CtrlParamCAGEDMagnetico.VerificarFunc2Moviment) then
      bbtnProsseguirClick(Sender)
    else
    begin
      frmAguarde.Apaga;
      pnlFundo.SendToBack;
      rbtnGerar.Visible := false;
      bbtnSair.Visible := false;
      bbtnProsseguir.Visible := true;
      bbtnProsseguir.Enabled := true;
      bbtnCancelar.Visible := true;
      bbtnCancelar.Enabled := true;
    end;
  end
  else
  begin
    frmAguarde.Apaga;
    MsgDlg(CtrlParamCAGEDMagnetico.MessageInfo,
      FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
  end;
end;

procedure TfrmParamCAGEDMagnetico.bbtnProsseguirClick(Sender: TObject);
var
  Arq: TStringList;
  tHoraInicial: TTime;
begin
  Arq := TStringList.Create;
  try
    tHoraInicial := Time;

    memResult.Lines.Clear;
    pnlFundo.BringToFront;

    Arq.Text := CtrlParamCAGEDMagnetico.ProcessarGeracao;
    if (Arq.Text <> '') then
    begin
      frmAguarde.Mostra(FU.CMTranslate('Salvando Arquivo...'));
      frmAguarde.pbAguarde.Visible := false;
      try
        Arq.SaveToFile(svdlgDialogo.FileName);
        frmAguarde.Apaga;

        if (rgTipoInf.ItemIndex = 0) then
          MsgDlg(FU.CMTranslateMsg(MSG_ARQ, [
            'CGED'+ IntToStr(speAno.Value) +
            '.M'+ FU.PoeZero(cmbMes.ItemIndex+1)]),
            FU.CMTranslate('Aviso'), mtInformation, [mbOk], 0)
        else
          MsgDlg(FU.CMTranslateMsg(MSG_ARQ, [
            'A'+ FU.PoeZero(speDia.Value) + IntToStr(speAno.Value) +
            '.M'+ FU.PoeZero(cmbMes.ItemIndex+1)]),
            FU.CMTranslate('Aviso'), mtInformation, [mbOk], 0);
      except
        frmAguarde.Apaga;
        MsgDlg(FU.CMTranslateMsg(MSG_ERRO_CRIACAO_ARQ, [svdlgDialogo.FileName]),
          'Erro', mtError, [mbOk,mbHelp], 0);
      end;
    end
    else
    begin
      frmAguarde.Apaga;
      if (CtrlParamCAGEDMagnetico.MessageInfo = '') then
        MessageDlg(
          FU.CMTranslate('Nenhuma pessoa foi gerada no arquivo.') +CR_LF+
          FU.CMTranslate('Verifique o Log gerado, altere as inconsistências e volte a gerar o arquivo.'),
          mtInformation, [mbOK, mbHelp], 0)
      else    
      begin
        MsgDlg(
          FU.CMTranslate('Ocorreu um erro durante o Processamento.') +CR_LF+
          FU.CMTranslate('Erro:') +CR_LF+ CtrlParamCAGEDMagnetico.MessageInfo,
          'Erro', mtError, [mbOk,mbHelp], 0);
      end;  
    end;

    pnlHorario.Caption := FU.CMTranslate('Tempo de Processamento: ') +
      FU.TempoDecorrido(FU.TimeToMiliseg(Time - tHoraInicial));
                       
    rbtnGerar.Visible := true;
    bbtnSair.Visible := true;
    bbtnProsseguir.Visible := false;
    bbtnProsseguir.Enabled := false;
    bbtnCancelar.Visible := false;
    bbtnCancelar.Enabled := false;
  finally
    Arq.Free;
  end;

  HabilitarBtResult(false);
  pnlSelecao.SendToBack;
end;

procedure TfrmParamCAGEDMagnetico.bbtnCancelarClick(Sender: TObject);
begin
  pnlFundo.BringToFront;
  rbtnGerar.Visible := true;
  bbtnSair.Visible := true;
  bbtnProsseguir.Visible := false;
  bbtnProsseguir.Enabled := false;
  bbtnCancelar.Visible := false;
  bbtnCancelar.Enabled := false;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamCAGEDMagnetico.HabilitaBtOk;
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

  bBtOkHabilitado := (bSelEstab) and (Trim(speAno.Text) <> '') and
    (Trim(dblkcbResp.Text) <> '') and (cbxEfetivos.Checked or cbxEspeciais.Checked or
    cbxTemporarios.Checked or cbxTerceiros.Checked or cbxEstagiarios.Checked or
    cbxPropDirSemVinc.Checked or cbxAutonomos.Checked);
  rbtnGerar.Enabled := bBtOkHabilitado;    
end;

function TfrmParamCAGEDMagnetico.VerificaOpcoesOk: boolean;
begin
  Result := false;

  if (rgTipoInf.ItemIndex = 0) then
    //svdlgDialogo.FileName := 'C:\CAGED\CGED' +IntToStr(speAno.Value) +'.M'+
      svdlgDialogo.FileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED\CGED' +IntToStr(speAno.Value) +'.M'+ //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      FU.PoeZero(cmbMes.ItemIndex + 1)
  else
    //svdlgDialogo.FileName := 'C:\CAGED\A' +FU.PoeZero(speDia.Value) +IntToStr(speAno.Value) +
    svdlgDialogo.FileName := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED\A' +FU.PoeZero(speDia.Value) +IntToStr(speAno.Value) +//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
      '.M'+ FU.PoeZero(cmbMes.ItemIndex + 1);

  // Abro o diálogo de seleção do arquivo
  //if not(DirectoryExists('C:\CAGED')) then
  if not(DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED')) then//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  begin
    //if (MsgDlg(FU.CMTranslate('Pasta C:\CAGED\ não foi encontrada.') +CR_LF+
    if (MsgDlg(FU.CMTranslate('Pasta'+Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED\ não foi encontrada.') +CR_LF+//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
               FU.CMTranslate('Deseja criá-la?'), FU.CMTranslate('Confirmação'),
               mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
      //CreateDir('C:\CAGED\')
      CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CAGED\')//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    else
    if not(svdlgDialogo.Execute) then
      exit;
  end;

  // Verificar se o arquivo existe na pasta escolhida
  if (FileExists(svdlgDialogo.FileName)) then
    RenameFile(
      svdlgDialogo.FileName,
      Copy(svdlgDialogo.FileName, 1,
        Length(svdlgDialogo.FileName) -
        Length(ExtractFileExt(svdlgDialogo.FileName))) +
      '-'+
      FormatDateTime('yyyymmdd', FU.GetFileDate(svdlgDialogo.FileName)) +
      ExtractFileExt(svdlgDialogo.FileName));

  if (Trim(mkedNumAutoriz.Text) = '') then
    if (MsgDlg(FU.CMTranslate('Número da Autorização não foi digitado.') +CR_LF+
               FU.CMTranslate('Deseja continuar?'), FU.CMTranslate('Confirmação'),
               mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
    begin
      mkedNumAutoriz.SetFocus;
      exit;
    end;

  Result := true;
end;

procedure TfrmParamCAGEDMagnetico.LeAlteracoes;
var
  sIdResp: string;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  sListaIdRubSel := ArqConfig.ReadString('CAGED_MAG', 'Rubricas', '');
  sListaIdEstabSel := ArqConfig.ReadString('CAGED_MAG', 'Estabelec', '');
  sIdResp := ArqConfig.ReadString('CAGED_MAG', 'Responsavel', '');
  mkedNumAutoriz.Text := ArqConfig.ReadString('CAGED_MAG', 'NumAutoriz', '');

  cbxEfetivos.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Temporarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Terceiros', 'F') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Estagiarios', 'F') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('CAGED_MAG', 'Autonomos', 'F') = 'V');

  FU.VerificaOpcoes(chklstRubrica, ListaIdRubrica, sListaIdRubSel, ',');
  FU.VerificaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',');

  if (sIdResp = '') then
  begin
    CdsResp.First;
    sIdResp := CdsResp.FieldByName('IDPESSOA').asString;
  end;
  dblkcbResp.LookUpValue := sIdResp;
  dblkcbResp.UpDate;

  edCodRubricas.Text := sListaIdRubSel;

  HabilitaBtOk;
end;

procedure TfrmParamCAGEDMagnetico.GravaAlteracoes;
var
  sGravaPadrao: string;
begin
  // Grava as últimas alterações da Opção de Rubricas
  FU.CriaListaOpcoes(chklstRubrica, ListaIdRubrica, sGravaPadrao, ',', false);
  ArqConfig.WriteString('CAGED_MAG', 'Rubricas', sGravaPadrao);

  // Grava as últimas alterações dos Estabelecimento
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sGravaPadrao, ',', false);
  ArqConfig.WriteString('CAGED_MAG', 'Estabelec', sGravaPadrao);

  if (Trim(dblkcbResp.Text) <> '') then
    ArqConfig.WriteString('CAGED_MAG', 'Responsavel', CdsResp.FieldByName('IDPESSOA').asString);

  ArqConfig.WriteString('CAGED_MAG', 'NumAutoriz', mkedNumAutoriz.Text);

  ArqConfig.WriteString('CAGED_MAG', 'Efetivos', FU.IFF(cbxEfetivos.Checked, 'V', 'F'));
  ArqConfig.WriteString('CAGED_MAG', 'Especiais', FU.IFF(cbxEspeciais.Checked, 'V', 'F'));
  ArqConfig.WriteString('CAGED_MAG', 'Temporarios', FU.IFF(cbxTemporarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('CAGED_MAG', 'Terceiros', FU.IFF(cbxTerceiros.Checked, 'V', 'F'));
  ArqConfig.WriteString('CAGED_MAG', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('CAGED_MAG', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked, 'V', 'F'));
  ArqConfig.WriteString('CAGED_MAG', 'Autonomos', FU.IFF(cbxAutonomos.Checked, 'V', 'F'));
end;

procedure TfrmParamCAGEDMagnetico.Progresso(const NumReg: integer;
  const MsgVerificaEstab, MsgVerificaResp, MsgProcessando, IncProgresso: boolean;
  MsgLog: string);
begin
  if (NumReg > 0) then
  begin
    frmAguarde.Max := NumReg;
    if not(frmAguarde.pbAguarde.Visible) then
      frmAguarde.pbAguarde.Visible := true;
  end;

  if (MsgVerificaEstab) then
    frmAguarde.Mostra(FU.CMTranslate('Verificando dados do(s) Estabelecimento(s)...'));

  if (MsgVerificaResp) then
    frmAguarde.Mostra(FU.CMTranslate('Verificando dados do Responsável...'));

  if (MsgProcessando) then
    frmAguarde.Mostra(FU.CMTranslate('Processando Dados...'));

  if (IncProgresso) then
    frmAguarde.Pos := frmAguarde.Pos + 1;

  if (MsgLog <> '') then
    memResult.Lines.Add(MsgLog);

  frmAguarde.Update;
end;

procedure TfrmParamCAGEDMagnetico.HabilitarBtResult(const Visivel: boolean);
begin
  bbtnVerResultado.Visible := Visivel;
  ToolbarSep972.Visible := Visivel;
  if (Visivel) then
    rbtnGerar.Enabled := bBtOkHabilitado
  else
    rbtnGerar.Enabled := false;
end;

procedure TfrmParamCAGEDMagnetico.bbtnVerResultadoClick(Sender: TObject);
begin
  pnlSelecao.SendToBack;
  HabilitarBtResult(false);
end;

procedure TfrmParamCAGEDMagnetico.bbtnVoltarClick(Sender: TObject);
begin
  pnlResult.SendToBack;
  HabilitarBtResult(true);
end;

procedure TfrmParamCAGEDMagnetico.bbtnSalvarClick(Sender: TObject);
begin
  if (svdlgResult.Execute) then
    memResult.Lines.SaveToFile(svdlgResult.FileName);
end;

end.
