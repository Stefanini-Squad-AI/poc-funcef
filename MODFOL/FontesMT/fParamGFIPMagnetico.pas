// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  19/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamGFIPMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Mask, wwdblook, Db, DBTables,
  checklst, ComCtrls, CMDateTimePicker, fSairAjuda, wwdbdatetimepicker, IniFiles, DBClient,
  uCMClientDataSet, Gauges, fcLabel, TB97Tlwn, ColorCheckListBox, uCtrlProvDesc,
  uCtrlParamGFIPMagnetico, uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlListTerceirosRH,
  uCtrlPessoaFuncionario, IvEMulti;

type
  TfrmParamGFIPMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
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
    townDica: TToolWindow97;
    Label3: TLabel;
    Label4: TLabel;
    lblRubCLT: TLabel;
    btnFecharDica: TBitBtn;
    MemoDica: TMemo;
    pgctrlPrincipal: TPageControl;
    tbshDadosPrinc: TTabSheet;
    tbshRubricas: TTabSheet;
    pgctrlRubricas: TPageControl;
    tbshSelRub0: TTabSheet;
    chklstRubrica0: TColorCheckListBox;
    tbshSelRub1: TTabSheet;
    chklstRubrica1: TColorCheckListBox;
    tbshSelRub2: TTabSheet;
    chklstRubrica2: TColorCheckListBox;
    tbshSelRub3: TTabSheet;
    chklstRubrica3: TColorCheckListBox;
    tbshSelRub4: TTabSheet;
    chklstRubrica4: TColorCheckListBox;
    tbshSelRub5: TTabSheet;
    chklstRubrica5: TColorCheckListBox;
    tbshSelRub6: TTabSheet;
    chklstRubrica6: TColorCheckListBox;
    tbshSelRub7: TTabSheet;
    chklstRubrica7: TColorCheckListBox;
    tbshSelRub8: TTabSheet;
    chklstRubrica8: TColorCheckListBox;
    sbtnMarcarRub: TBitBtn;
    StaticText1: TStaticText;
    edCodRubricas: TEdit;
    bbtnDicaSelRubricas: TBitBtn;
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
    rgGera13: TRadioGroup;
    gbxDataProcess: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtVencimento: TCMDateTimePicker;
    dtPagamento: TCMDateTimePicker;
    gbxResponsavel: TGroupBox;
    dblkcbResponsavel: TwwDBLookupCombo;
    rgGeraReg14: TRadioGroup;
    rgTipoInscricaoResp: TRadioGroup;
    rgTipoBusca: TRadioGroup;
    gbxCodRec: TGroupBox;
    speCodRec: TSpinEdit;
    gbxCodEmprCAIXA: TGroupBox;
    mkedCodEmpreCAIXA: TMaskEdit;
    gbxDiaLimiteGRFC: TGroupBox;
    spedDiaLimiteGRFC: TSpinEdit;
    rgSimples: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure dtVencimentoChange(Sender: TObject);
    procedure speCodRecExit(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure chklstRubrica0ClickCheck(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure bbtnDicaSelRubricasClick(Sender: TObject);
    procedure btnFecharDicaClick(Sender: TObject);
  private
    CtrlParamGFIPMagnetico: TCtrlParamGFIPMagnetico;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
    CtrlProvDesc: TCtrlProvDesc;

    ListaCodEstab: TStringList;
    ListaCodCCusto: TStringList;
    ListaIdRubrica: TStringList;

    ListaIdRubricaSel: array[0..8] of string;

    ArqConfig: TIniFile; // Arquivo de Configuração

    procedure LerAlteracoes;
    procedure GravarAlteracoes;
    procedure HabilitaBtOk;
    function  VerificaOpcoesOk: boolean;
    // Atualiza Tela de Progresso
    procedure Progresso(const TempoAtual, Mensagem: string; const Incremento: integer);
    procedure MostrarDica; 
  end;

var
  frmParamGFIPMagnetico: TfrmParamGFIPMagnetico;

implementation

uses FileCtrl, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, dCds, uCtrlUsoGeralRH;


{$R *.DFM}

procedure TfrmParamGFIPMagnetico.FormCreate(Sender: TObject);
var
  NormalIni: TDate;
begin
  inherited;
  CtrlParamGFIPMagnetico := TCtrlParamGFIPMagnetico.Create;
  CtrlParamGFIPMagnetico.InitializeAs(Padroes);
  CtrlParamGFIPMagnetico.OnProgresso := Progresso;

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

  ListaCodEstab := TStringList.Create;
  ListaCodCCusto := TStringList.Create;
  ListaIdRubrica := TStringList.Create;

  NormalIni := CtrlGlobalRH.GetNormalIni;
  cmbMes.ItemIndex := FU.ExtraiMes(NormalIni) - 1;
  speAno.Text := IntToStr(FU.ExtraiAno(NormalIni));

  CdsNomeResp.Data := CtrlPessoaFuncionario.ListEmpresaFuncionario(0,
    '  P.IDPESSOA, UPPER(P.NOME) AS NOME', '', 'A');

  // Apagar o índice se este existir
  dmCds.Cds.IndexName := '';
  if (dmCds.Cds.IndexDefs.IndexOf('Index1') > 0) then
    dmCds.Cds.DeleteIndex('Index1');

  // Monta Lista de Estabelecimentos
  dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodEstab.Add(dmCds.Cds.FieldByName('IDPESSOA').asString);
    chklstEstab.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Monta Lista de C. de Custos
  dmCds.Cds.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaCodCCusto.Add(dmCds.Cds.FieldByName('CODCENTROCUSTO').asString);
    chklstCCusto.Items.Add(dmCds.Cds.FieldByName('NOME').asString);
    dmCds.Cds.Next;
  end;

  // Monta Lista de Rubricas
  chklstRubrica0.Items.BeginUpdate;
  chklstRubrica1.Items.BeginUpdate;
  chklstRubrica2.Items.BeginUpdate;
  chklstRubrica3.Items.BeginUpdate;
  chklstRubrica4.Items.BeginUpdate;
  chklstRubrica5.Items.BeginUpdate;
  chklstRubrica6.Items.BeginUpdate;
  chklstRubrica7.Items.BeginUpdate;
  chklstRubrica8.Items.BeginUpdate;
  dmCds.Cds.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(dmCds.Cds.EOF) do
  begin
    ListaIdRubrica.Add(dmCds.Cds.FieldByName('CODPROVDESC').asString);
    chklstRubrica0.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica1.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica2.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica3.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica4.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica5.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica6.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica7.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    chklstRubrica8.Items.Add(dmCds.Cds.FieldByName('DESCRPROVDESC').asString);
    dmCds.Cds.Next;
  end;
  chklstRubrica8.Items.EndUpdate;
  chklstRubrica7.Items.EndUpdate;
  chklstRubrica6.Items.EndUpdate;
  chklstRubrica5.Items.EndUpdate;
  chklstRubrica4.Items.EndUpdate;
  chklstRubrica3.Items.EndUpdate;
  chklstRubrica2.Items.EndUpdate;
  chklstRubrica1.Items.EndUpdate;
  chklstRubrica0.Items.EndUpdate;

  mkedCodEmpreCAIXA.Text := '';
  dtPagamento.Text := '07/'+Copy(DateToStr(Date),4,2)+'/'+Copy(DateToStr(Date),7,4);
  dtVencimento.Text := dtPagamento.Text;
  pnlHorario.Caption := '';
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlSel.ActivePageIndex := 0;
  pgctrlRubricas.ActivePageIndex := 0;

  LerAlteracoes;
  HabilitaBtOk;
end;

procedure TfrmParamGFIPMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravarAlteracoes;
  FreeAndNil(ListaIdRubrica);
  FreeAndNil(ListaCodEstab);
  FreeAndNil(ListaCodCCusto);
  FreeAndNil(CtrlProvDesc);
  FreeAndNil(CtrlPessoaFuncionario);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlParamGFIPMagnetico);
  inherited;
end;

procedure TfrmParamGFIPMagnetico.dtVencimentoChange(Sender: TObject);
begin
  if (speCodRec.Value <> 906) then
    HabilitaBtOk;
end;

procedure TfrmParamGFIPMagnetico.pgctrlRubricasChange(Sender: TObject);
begin
  edCodRubricas.Text := ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex];
end;

procedure TfrmParamGFIPMagnetico.speCodRecExit(Sender: TObject);
begin
  if (speCodRec.Value = 906) then
  begin
    MsgDlg('Este código é utilizado somente na Entrada de Dados do SEFIP',
           'Aviso', mtInformation, [mbOk,mbHelp], 0);
    speCodRec.SetFocus;
  end;
end;

procedure TfrmParamGFIPMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  inherited;
  HabilitaBtOk;
end;

procedure TfrmParamGFIPMagnetico.chklstRubrica0ClickCheck(Sender: TObject);
var
  CheckListBox: TColorCheckListBox;
begin
  CheckListBox := TColorCheckListBox(
    Self.FindComponent('chklstRubrica'+IntToStr(pgctrlRubricas.ActivePageIndex)));

  FU.CriaListaOpcoes(CheckListBox, ListaIdRubrica, ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex], ',', false);
  edCodRubricas.Text := ListaIdRubricaSel[pgctrlRubricas.ActivePageIndex];
end;

procedure TfrmParamGFIPMagnetico.bbtnSelTodosClick(Sender: TObject);
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

procedure TfrmParamGFIPMagnetico.bbtnInverteSelClick(Sender: TObject);
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

procedure TfrmParamGFIPMagnetico.sbtnMarcarRubClick(Sender: TObject);
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

procedure TfrmParamGFIPMagnetico.bbtnDicaSelRubricasClick(Sender: TObject);
begin
  MostrarDica;
  townDica.Top := Self.Top + 200;
  townDica.Left := Self.Left + 66;
  townDica.BringToFront;
  townDica.Visible := true;
  Self.Enabled := false;
end;

procedure TfrmParamGFIPMagnetico.btnFecharDicaClick(Sender: TObject);
begin
  Self.Enabled := true;
  townDica.Visible := false;
end;

procedure TfrmParamGFIPMagnetico.rbtnGerarClick(Sender: TObject);
var
  Arquivo: TStringList;
  bOk: boolean;
  wNum: word;
  sCodEstabSel, sCodCCustoSel: string;
begin
  // Verificar se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    pnlHorario.Caption := '';
    exit;
  end;

  fclblTitulo.Caption :=   'Gerando SEFIP.RE de: ' +
    FU.PoeZero(cmbMes.ItemIndex+1) +'/'+ speAno.Text;
  gagTotal.Progress := 0;
  gagTotal.MaxValue := 100;
  lblHoraIni.Caption := 'Hora de Início: ' + TimeToStr(Time);
  lblTempoDecorr.Caption := FU.TempoDecorridoHMS(0, false);

  pnlProgresso.Top := 153;
  pnlProgresso.Visible := true;
  pnlProgresso.Update;

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaCodEstab, sCodEstabSel, ',', false);

  // C. de Custo selecionados
  wNum := FU.CriaListaOpcoes(chklstCCusto, ListaCodCCusto, sCodCCustoSel, ',', true);
  if (wNum = ListaCodCCusto.Count) then
    sCodCCustoSel := '';

  // Processamento
  bOk := CtrlParamGFIPMagnetico.ProcessarGeracao(Sistema.IdEmpresa,
    cmbMes.ItemIndex+1, speAno.Value, dtVencimento.Date, dtPagamento.Date,
    sCodEstabSel, sCodCCustoSel, CdsNomeResp.FieldByName('IDPESSOA').asFloat,
    (rgGera13.ItemIndex = 0), (rgTipoBusca.ItemIndex = 0), (rgGeraReg14.ItemIndex = 0),
    (rgTipoInscricaoResp.ItemIndex = 0), speCodRec.Value, mkedCodEmpreCAIXA.Text,
    spedDiaLimiteGRFC.Value, rgSimples.ItemIndex+1, ListaIdRubricaSel[0],
    ListaIdRubricaSel[1], ListaIdRubricaSel[2], ListaIdRubricaSel[3],
    ListaIdRubricaSel[4], ListaIdRubricaSel[5], ListaIdRubricaSel[6],
    ListaIdRubricaSel[7], ListaIdRubricaSel[8]);

  pnlHorario.Caption := 'Tempo de Processamento: ' +CtrlParamGFIPMagnetico.TempoDecorridoTotal;
  pnlProgresso.Visible := false;

  if (bOk) then
  begin
    if (CtrlParamGFIPMagnetico.MessageInfo <> '') then
      MsgDlg(CtrlParamGFIPMagnetico.MessageInfo,
        'Aviso', mtInformation, [mbOk,mbHelp], 0)
    else
    begin
      Arquivo := TStringList.Create;
      try
        try
          Arquivo.Text := CtrlParamGFIPMagnetico.DadosArquivo.Text;
          Arquivo.SaveToFile(svdlgDialogo.FileName);

          MsgDlg('Arquivo SEFIP.RE gerado com sucesso.',
            'Aviso', mtInformation, [mbOk,mbHelp], 0);
        except
          on E: Exception do
          begin
            MsgDlg(
              'Ocorreu um erro ao tentar gravar o arquivo SEFIP.RE em ' +
              ExtractFilePath(svdlgDialogo.FileName) + 'Erro: ' +CR_LF+ E.Message,
              'Erro', mtError, [mbOk,mbHelp], 0);
          end;
        end;
      finally
        FreeAndNil(Arquivo);
      end;
    end;
  end
  else
  begin
    MsgDlg(CtrlParamGFIPMagnetico.MessageInfo,
      'Erro', mtError, [mbOk,mbHelp], 0);
  end;
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamGFIPMagnetico.LerAlteracoes;
var
  c: byte;
  CheckListBox: TColorCheckListBox;
begin
  // Recupera as últimas alterações das opções
  //ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');
  ArqConfig := TIniFile.Create(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CONFIG_FOLHAPAGTO.INI');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

  rgTipoInscricaoResp.ItemIndex := StrToInt(ArqConfig.ReadString('GFIP_MAGNETICO', 'TipoInscricaoResp', '0'));
  speCodRec.Value := StrToInt(ArqConfig.ReadString('GFIP_MAGNETICO', 'CodigoRec', '115'));
  mkedCodEmpreCAIXA.Text := ArqConfig.ReadString('GFIP_MAGNETICO', 'CodigoEmpresaCAIXA', '');
  rgGeraReg14.ItemIndex := StrToInt(ArqConfig.ReadString('GFIP_MAGNETICO', 'GerarRegAltEndereco', '0'));
  dblkcbResponsavel.LookupValue := ArqConfig.ReadString('GFIP_MAGNETICO', 'Responsavel', CdsNomeResp.FieldByName('IDPESSOA').asString);
  dblkcbResponsavel.Update;

  for c:=0 to 8 do
  begin
    ListaIdRubricaSel[c] := ArqConfig.ReadString('GFIP_MAGNETICO', 'Rubrica'+IntToStr(c), '');
    CheckListBox := TColorCheckListBox(Self.FindComponent('chklstRubrica'+IntToStr(c)));
    FU.VerificaOpcoes(CheckListBox, ListaIdRubrica, ListaIdRubricaSel[c], ',');
  end;
  edCodRubricas.Text := ListaIdRubricaSel[0];
end;

procedure TfrmParamGFIPMagnetico.GravarAlteracoes;
var
  c: byte;
  sGravaPadrao: string;
begin
  sGravaPadrao := IntToStr(rgTipoInscricaoResp.ItemIndex);
  ArqConfig.WriteString('GFIP_MAGNETICO', 'TipoInscricaoResp', sGravaPadrao);

  sGravaPadrao := speCodRec.Text;
  ArqConfig.WriteString('GFIP_MAGNETICO', 'CodigoRec', sGravaPadrao);

  sGravaPadrao := mkedCodEmpreCAIXA.Text;
  ArqConfig.WriteString('GFIP_MAGNETICO', 'CodigoEmpresaCAIXA', sGravaPadrao);

  sGravaPadrao := IntToStr(rgGeraReg14.ItemIndex);
  ArqConfig.WriteString('GFIP_MAGNETICO', 'GerarRegAltEndereco', sGravaPadrao);

  sGravaPadrao := dblkcbResponsavel.LookupValue;
  ArqConfig.WriteString('GFIP_MAGNETICO', 'Responsavel', sGravaPadrao);

  for c:=0 to 8 do
  begin
    sGravaPadrao := ListaIdRubricaSel[c];
    ArqConfig.WriteString('GFIP_MAGNETICO', 'Rubrica'+IntToStr(c), sGravaPadrao);
  end;

  ArqConfig.Free;
end;

procedure TfrmParamGFIPMagnetico.HabilitaBtOk;
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
    (Trim(dtVencimento.Text) <> '') and (Trim(dtPagamento.Text) <> '') and
    (Trim(dblkcbResponsavel.Text) <> '') and (Trim(speCodRec.Text) <> '');
end;

function TfrmParamGFIPMagnetico.VerificaOpcoesOk: boolean;
var
  wOpcao: word;
begin
  Result := false;

  // Confirmar os períodos com o usuário
  if (StrToDate(dtPagamento.Text) <> StrToDate(dtVencimento.Text)) then
    if (MsgDlg('Data do Pagamento diferente da Data do Vencimento.' +CR_LF+
               'Deseja continuar?', 'Aviso',
               mtConfirmation, [mbYes,mbNo], 0) = mrNo) then
      exit;

  // Abrir o diálogo de seleção do arquivo
  //if not(DirectoryExists('C:\SEFIP')) then
  if not(DirectoryExists(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\SEFIP')) then //Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  begin
    //wOpcao := MsgDlg('Pasta C:\SEFIP não foi encontrada.' +CR_LF+
    wOpcao := MsgDlg('Pasta'+ Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+ '\SEFIP não foi encontrada.' +CR_LF+//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
                     'Deseja Criá-la agora?', 'Aviso',
                     mtConfirmation, [mbYes,mbNo,mbCancel], 0);
    if (wOpcao = mrYes) then
      //CreateDir('C:\SEFIP')
      CreateDir(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\SEFIP')//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
    else
    if (wOpcao = mrCancel) or ((wOpcao = mrNo) and not(svdlgDialogo.Execute)) then
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

  Result := true;
end;

procedure TfrmParamGFIPMagnetico.Progresso(const TempoAtual, Mensagem: string;
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

procedure TfrmParamGFIPMagnetico.MostrarDica;
begin
  townDica.Caption := 'Dica - ' +pgctrlRubricas.ActivePage.Caption;
  case (pgctrlRubricas.ActivePageIndex) of
    0 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) ao valor total pago a título'+CR_LF+
        'de salário-família no mês de referência.';
      lblRubCLT.Caption := '40573';
    end;
    1 :
    begin
      MemoDica.Lines.Text :=
       'Indicar a(s) Rubrica(s) correspondente(s) ao valor total pago a título' +CR_LF+
       'de salário-maternidade no mês de referência.';
      lblRubCLT.Caption := '40570';
    end;
    2 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) ao valor total do INSS' +CR_LF+
        'descontado dos empregados referente ao 13º salário.';
      lblRubCLT.Caption := '50025';
    end;
    3 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) ao valor da base do salário' +CR_LF+
        'pago ao empregado no mês de referência. A este valor deve ser' +CR_LF+
        'excluído o valor da parcela do 13º salário pago.';
      lblRubCLT.Caption := '60695, 60696, 60697, 60698';
    end;
    4 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) ao valor da parcela de' +CR_LF+
        '13º salário pago ao empregado no mês de referência.';
      lblRubCLT.Caption := '62022';
    end;
    5 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) ao valor da contribuição dos' +CR_LF+
        'empregados que possuírem mais de um vínculo empregatício,' +CR_LF+
        'dissídio coletivo, reclamatória trabalhista ou ainda nos meses' +CR_LF+
        'de afastamento e retorno de licença maternidade.' +CR_LF+
        'Este valor será considerado como o INSS no mês de referência.';
      lblRubCLT.Caption := '50035';
    end;
    6 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) ao total pago a título de' +CR_LF+
        'remuneração sobre a qual incide INSS quando o empregado estiver' +CR_LF+
        'afastada por motivo de Acidente de Trabalho e/ou Prestação de' +CR_LF+
        'Serviço Militar Obrigatório.';
      lblRubCLT.Caption := '60696, 60697';
    end;
    7 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) para os seguintes casos:' +CR_LF+
        '* Na competência em que ocorreu o afastamento definitivo:' +CR_LF+
        '  Informar o valor total do 13º pago no ano ao trabalhador;' +CR_LF+
        '* Na competência 12:' +CR_LF+
        '  Indicar eventuais diferenças de gratificação natalina de empregados' +CR_LF+
        '  que recebem remuneração variável;' +CR_LF+
        '* Na competência 13, para a geração da GPS:' +CR_LF+
        '  Indicar o valor total do 13º salário pago no ano ao trabalhador.';
      lblRubCLT.Caption := '62016';
    end;
    8 :
    begin
      MemoDica.Lines.Text :=
        'Indicar a(s) Rubrica(s) correspondente(s) à base do 13º salário dos' +CR_LF+
        'empregados que recebem remuneração variável, em relação a qual' +CR_LF+
        'já houve recolhimento em GPS, para que o SEFIP calcule' +CR_LF+
        'corretamente a contribuição descontada do segurado.';
      lblRubCLT.Caption := '60421';
    end;
  end;
end;

end.
