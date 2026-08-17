unit fParamRAISMagnetico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio,
  IvMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Spin, Db, DBTables,
  checklst, ComCtrls, IniFiles, fcLabel, Gauges, wwdblook, TREdit, DBClient, fSairAjuda,
  wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet, ColorCheckListBox, 
  uCtrlGlobalRH, uCtrlPessoaFilialPessoa, uCtrlMotivo, uCtrlListTerceirosRH,
  uCtrlProvDesc, uCtrlParamRAISMagnetico, IvEMulti;

const
  NUM_RUBRICAS = 5;
  NUM_RUBRICAS_CONTRIB = 4;
  NUM_RUBRICAS_RESC = 6;

type
  TfrmParamRAISMagnetico = class(TfrmSairAjuda)
    svdlgDialogo: TOpenDialog;
    rbtnGerar: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    pnlProgresso: TPanel;
    fclblTitulo: TfcLabel;
    Bevel11: TBevel;
    lblProcesso: TLabel;
    lblHoraIni: TLabel;
    Bevel1: TBevel;
    gagTotal: TGauge;
    Label18: TLabel;
    lblTempoDecorr: TLabel;
    CdsNomeResp: TCMClientDataSet;
    CdsTipoFolha: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    pnlResult: TPanel;
    memResult: TMemo;
    bbtnVoltar: TBitBtn;
    bbtnSalvar: TBitBtn;
    pnlSelecao: TPanel;
    pnlHorario: TPanel;
    pgctrlPrincipal: TPageControl;
    tbshPrincipal: TTabSheet;
    tbshAdmDem: TTabSheet;
    gbxAdm: TGroupBox;
    chklstMotivoAdm: TColorCheckListBox;
    gbxDem: TGroupBox;
    chklstMotivoDem: TColorCheckListBox;
    tbshAfast: TTabSheet;
    gbxAfast: TGroupBox;
    chklstMotivoAfast: TColorCheckListBox;
    gbxRet: TGroupBox;
    chklstMotivoRetorno: TColorCheckListBox;
    tbshValDiversos: TTabSheet;
    gbxRubSal: TGroupBox;
    lblDescricao1: TLabel;
    edCodRubricas: TEdit;
    sbtnMarcarRub: TBitBtn;
    pgctrlRubricas: TPageControl;
    tbshFolhaNormal: TTabSheet;
    chklstRub1: TColorCheckListBox;
    tbsh1Parc13: TTabSheet;
    chklstRub2: TColorCheckListBox;
    tbsh2Parc13: TTabSheet;
    chklstRub3: TColorCheckListBox;
    tbshSalContratual: TTabSheet;
    chklstRub4: TColorCheckListBox;
    bbtnSelTodasRub: TBitBtn;
    bbtnInverteSelRub: TBitBtn;
    stxtTipoFolha: TStaticText;
    dblkcbTipoFolha: TwwDBLookupCombo;
    tbshContribuicao: TTabSheet;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    edCodRubricasContrib: TEdit;
    sbtnMarcarRubContrib: TBitBtn;
    bbtnSelTodasRubContrib: TBitBtn;
    bbtnInverteSelRubContrib: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    bbtnVerResultado: TBitBtn;
    svdlgResult: TOpenDialog;
    tbshPAT: TTabSheet;
    gbxEstab: TGroupBox;
    chklstEstab: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    gbxAnoMesRef: TGroupBox;
    speAno: TSpinEdit;
    gbxMesDataBase: TGroupBox;
    cmbMesDataBase: TComboBox;
    gbxResp: TGroupBox;
    dblkcbResp: TwwDBLookupCombo;
    rgTipoInf: TRadioGroup;
    gbxDataRetif: TGroupBox;
    dtedRetif: TCMDateTimePicker;
    rgTipoDeclarac: TRadioGroup;
    gbxDataEncerr: TGroupBox;
    dtedDataEncerr: TCMDateTimePicker;
    rgIndicador1: TRadioGroup;
    gbxSalMinAtual: TGroupBox;
    redSalMinAtual: TRealEdit;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxEspeciais: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    cbxAutonomos: TCheckBox;
    rgMicroEmpr: TRadioGroup;
    gbxNumProp: TGroupBox;
    spedNumProp: TSpinEdit;
    rgSimples: TRadioGroup;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    chklstRubPAT: TColorCheckListBox;
    bbtnSelTodasRubPAT: TBitBtn;
    bbtnInverteSelRubPAT: TBitBtn;
    edCodRubricasPAT: TEdit;
    sbtnMarcarRubPAT: TBitBtn;
    gbxPorcent: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    redPorc1: TRealEdit;
    redPorc2: TRealEdit;
    redPorc3: TRealEdit;
    redPorc4: TRealEdit;
    redPorc5: TRealEdit;
    redPorc6: TRealEdit;
    tbshRescisao: TTabSheet;
    GroupBox4: TGroupBox;
    chklstMotivoResc: TColorCheckListBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    edCodRubricasResc: TEdit;
    sbtnMarcarRubResc: TBitBtn;
    pgctrlRubricasResc: TPageControl;
    tbshAvisoPrevio: TTabSheet;
    chklstRubResc1: TColorCheckListBox;
    tbshFeriasIndeniz: TTabSheet;
    chklstRubResc2: TColorCheckListBox;
    tbshBancoHoras: TTabSheet;
    chklstRubResc3: TColorCheckListBox;
    tbshDissidio: TTabSheet;
    chklstRubResc4: TColorCheckListBox;
    tbshGratif: TTabSheet;
    chklstRubResc5: TColorCheckListBox;
    tbshMultaResc: TTabSheet;
    chklstRubResc6: TColorCheckListBox;
    bbtnSelTodasRubResc: TBitBtn;
    bbtnInverteSelRubResc: TBitBtn;
    pgctrlTipoContrib: TPageControl;
    tbshPatronal: TTabSheet;
    tbshEmpregados: TTabSheet;
    pgctrlContrib: TPageControl;
    tbshContribAssoc: TTabSheet;
    chklstRubContrib1: TColorCheckListBox;
    tbshContribSind: TTabSheet;
    chklstRubContrib2: TColorCheckListBox;
    tbshContribAssist: TTabSheet;
    chklstRubContrib3: TColorCheckListBox;
    tbshContribConf: TTabSheet;
    chklstRubContrib4: TColorCheckListBox;
    pgctrlContribPatronal: TPageControl;
    tbshContribAssocPatronal: TTabSheet;
    chklstRubContribPatronal1: TColorCheckListBox;
    tbshContribSindPatronal: TTabSheet;
    chklstRubContribPatronal2: TColorCheckListBox;
    tbshContribAssistPatronal: TTabSheet;
    chklstRubContribPatronal3: TColorCheckListBox;
    tbshContribConfPatronal: TTabSheet;
    chklstRubContribPatronal4: TColorCheckListBox;
    tbshHoristas: TTabSheet;
    chklstRub5: TColorCheckListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure rgTipoInfExit(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
    procedure dtedRetifChange(Sender: TObject);
    procedure sbtnMarcarRubClick(Sender: TObject);
    procedure chklstRub1ClickCheck(Sender: TObject);
    procedure bbtnSelTodasRubClick(Sender: TObject);
    procedure bbtnInverteSelRubClick(Sender: TObject);
    procedure pgctrlRubricasChange(Sender: TObject);
    procedure rgTipoDeclaracExit(Sender: TObject);
    procedure dtedDataEncerrChange(Sender: TObject);
    procedure redSalMinAtualChange(Sender: TObject);
    procedure dblkcbTipoFolhaChange(Sender: TObject);
    procedure chklstRub1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chklstRub1Click(Sender: TObject);
    procedure bbtnSelTodasRubContribClick(Sender: TObject);
    procedure bbtnInverteSelRubContribClick(Sender: TObject);
    procedure sbtnMarcarRubContribClick(Sender: TObject);
    procedure pgctrlContribChange(Sender: TObject);
    procedure chklstRubContrib1ClickCheck(Sender: TObject);
    procedure bbtnVoltarClick(Sender: TObject);
    procedure bbtnVerResultadoClick(Sender: TObject);
    procedure bbtnSalvarClick(Sender: TObject);
    procedure chklstRubPATClickCheck(Sender: TObject);
    procedure bbtnSelTodasRubPATClick(Sender: TObject);
    procedure bbtnInverteSelRubPATClick(Sender: TObject);
    procedure sbtnMarcarRubPATClick(Sender: TObject);
    procedure pgctrlRubricasRescChange(Sender: TObject);
    procedure chklstRubResc1ClickCheck(Sender: TObject);
    procedure bbtnSelTodasRubRescClick(Sender: TObject);
    procedure bbtnInverteSelRubRescClick(Sender: TObject);
    procedure sbtnMarcarRubRescClick(Sender: TObject);
  private
    CtrlParamRAISMagnetico: TCtrlParamRAISMagnetico;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlProvDesc: TCtrlProvDesc;

    ArqConfig: TIniFile; // Arquivo de alterações

    sListaIdEstabSel: string; // Estabelecimentos selecionados
    sListaIdAfastSel: string; // Motivos de afastamentos selecionados
    sListaIdRetornoSel: string; // Motivos de retornos selecionados
    sListaIdMotivoAdmSel: string; // Situações de Admissão selecionadas
    sListaIdMotivoDemSel: string; // Situações de Demissão selecionadas
    sListaIdMotivoRescSel: string; // Situações de Rescisão selecionadas
    sListaIdRubPATSel: string; // Rubricas do Vale Alimentação selecionadas
    sListaIdRubSel: array[0..NUM_RUBRICAS-1] of string; // Rubricas dos Valores Diversos selecionadas
    sListaIdRubContribSel: array[0..NUM_RUBRICAS_CONTRIB-1] of string; // Rubricas das Contribuições selecionadas
    sListaIdRubContribPatronalSel: array[0..NUM_RUBRICAS_CONTRIB-1] of string; // Rubricas das Contribuições Patronais selecionadas
    sListaIdRubRescSel: array[0..NUM_RUBRICAS_RESC-1] of string; // Rubricas da Rescisão selecionadas

    chklstRub: array[0..NUM_RUBRICAS-1] of TColorCheckListBox; // CheckLists auxiliares
    chklstRubContrib: array[0..NUM_RUBRICAS_CONTRIB-1] of TColorCheckListBox; // CheckLists auxiliares (Contribuição)
    chklstRubContribPatronal: array[0..NUM_RUBRICAS_CONTRIB-1] of TColorCheckListBox; // CheckLists auxiliares (Contribuição Patronal)
    chklstRubResc: array[0..NUM_RUBRICAS_RESC-1] of TColorCheckListBox; // CheckLists auxiliares (Rescisão)

    // Lista dos Códigos de Todos os Itens de...
    ListaIdEstab: TStringList; // Estabelecimentos
    ListaIdMotivo: TStringList; // Motivos de afastamentos
    ListaIdMotivo_AdmDem: TStringList; // Situações de Admissão e Demissão
    ListaIdMotivo_Resc: TStringList; // Situações de Rescisão
    ListaIdRub: TStringList; // Código da Rubrica + Código do Tipo Folha
    ListaIdRubContrib: TStringList; // Somente Código da Rubrica
    ListaIdRubResc: TStringList; // Código da Rubrica 

    // Variáveis que guardam os itens atuais das listas de...
    chklstRubAtual: TColorCheckListBox; // Rubricas
    chklstRubContribAtual: TColorCheckListBox; // Contribuição
    chklstRubRescAtual: TColorCheckListBox; // Rescisão

    sListaIdRubAtual: string; // Código de Rubricas Selecionadas
    sListaIdRubContribAtual: string; // Código de Rubricas Selecionadas (Contribuição)
    sListaIdRubPAT: string; // Código de Rubricas Selecionadas (Vale Alimentação)
    sListaIdRubRescAtual: string; // Código de Rubricas Selecionadas (Rescisão)

    bBtOkHabilitado: boolean;

    // Executar algumas verificações iniciais incluindo se dados do Responsável e
    // Estabelecimento estão corretos
    function  VerificaOpcoesOk: boolean;
    // Ler alterações a partir do arquivo de configurações
    procedure LerAlteracoes;
    // Gravar alterações feitas na tela no arquivo de configurações
    procedure GravarAlteracoes;
    // Habilitar o botão de Ok de acordo com as seleções mínimas necessárias
    procedure HabilitaBtOk;
    // Habilitar o Combo de Tipos de Folha e Seleciona (caso já tenha sido feito
    // anteriormente) o registro correspondente
    procedure SelTipoFolha;
    // Atualizar uma lista de códigos das rubricas para incluir o correspondente
    // Tipo de Folha recuperado a partir do arquivo de configuração
    procedure SelTipoFolhaRub(Lista: TStringList; Valor: string);
    // Retornar uma lista de códigos das rubricas a partir de uma que é composta de
    // Código da Rubrica=Tipo de Folha. Usada na formatação das listas de Rubricas
    // selecionadas que foram recuperadas a partir do arquivo de configuração
    function  NormalizaLiRubrica(Valor: string): string;
    // Habilitar botões de resultado 
    procedure HabilitarBtResult(const Visivel: boolean);
    // Atualizar Tela de Progresso
    procedure Progresso(const TempoAtual, Mensagem: string;
      const NumPessoas: integer; const IncProgresso: boolean; const Log: string);
  end;

var
  frmParamRAISMagnetico: TfrmParamRAISMagnetico;

implementation

uses FileCtrl, uSistema, uMensErro, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds;

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_TITULO = 'Gerando RAIS do ano de :1';
  MSG_ERRO_GRAVA_ARQ = 'Ocorreu um erro ao tentar gravar o arquivo RAIS:1.TXT em :2';
  MSG_ERRO_CRIAR_PASTA =
    'O usuário logado na máquina não possui permissão:1'+
    'de escrita em C:\. Será preciso escolher um outro:2'+
    'local para a geração do arquivo RAIS.';

{$R *.DFM}

procedure TfrmParamRAISMagnetico.FormCreate(Sender: TObject);
var
  c: byte;
begin
  inherited;
  CtrlParamRAISMagnetico := TCtrlParamRAISMagnetico.Create;
  CtrlParamRAISMagnetico.InitializeAs(Padroes);
  CtrlParamRAISMagnetico.OnProgresso := Progresso;

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlProvDesc := TCtrlProvDesc.Create;
  CtrlProvDesc.InitializeAs(Padroes);

  ListaIdEstab := TStringList.Create;
  ListaIdMotivo := TStringList.Create;
  ListaIdMotivo_AdmDem := TStringList.Create;
  ListaIdMotivo_Resc := TStringList.Create;
  ListaIdRub := TStringList.Create;
  ListaIdRubContrib := TStringList.Create;
  ListaIdRubResc := TStringList.Create;

  CdsNomeResp.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsTipoFolha.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');

  // Obter o nº de proprietários
  spedNumProp.Value := CtrlListTerceirosRH.GetNumProprietarios(Sistema.IdEmpresa);

  // Montar lista dos Estabelecimentos
  CdsAux.Data := CdsNomeResp.Data;
  while not(CdsAux.EOF) do
  begin
    chklstEstab.Items.Add(CdsAux.FieldByName('NOME').asString);
    ListaIdEstab.Add(CdsAux.FieldByName('IDPESSOA').asString);
    CdsAux.Next;
  end;

  // Montar lista dos Motivos de afastamento, de retorno
  CdsAux.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D');
  while not(CdsAux.EOF) do
  begin
    ListaIdMotivo.Add(CdsAux.FieldByName('IDMOTIVO').asString);
    chklstMotivoAfast.Items.Add(CdsAux.FieldByName('DESCRICAO').asString);
    chklstMotivoRetorno.Items.Add(CdsAux.FieldByName('DESCRICAO').asString);
    CdsAux.Next;
  end;

  // Montar lista dos Motivos de afastamento e retorno
  CdsAux.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('A,D', '');
  while not(CdsAux.EOF) do
  begin
    ListaIdMotivo_AdmDem.Add(CdsAux.FieldByName('IDMOTIVO').asString);
    chklstMotivoAdm.Items.Add(CdsAux.FieldByName('DESCRICAO').asString);
    chklstMotivoDem.Items.Add(CdsAux.FieldByName('DESCRICAO').asString);
    CdsAux.Next;
  end;

  // Montar lista dos Motivos de rescisão
  CdsAux.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('F,D');
  while not(CdsAux.EOF) do
  begin
    ListaIdMotivo_Resc.Add(CdsAux.FieldByName('IDMOTIVO').asString);
    chklstMotivoResc.Items.Add(CdsAux.FieldByName('DESCRICAO').asString);
    CdsAux.Next;
  end;

  // Montar lista das Rubricas
  for c:=0 to NUM_RUBRICAS-1 do
    chklstRub[c] := TColorCheckListBox(Self.FindComponent('chklstRub' + IntToStr(c+1)));

  for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
  begin
    chklstRubContrib[c] := TColorCheckListBox(Self.FindComponent('chklstRubContrib' + IntToStr(c+1)));
    chklstRubContribPatronal[c] := TColorCheckListBox(Self.FindComponent('chklstRubContribPatronal' + IntToStr(c+1)));
  end;

  for c:=0 to NUM_RUBRICAS_RESC-1 do
    chklstRubResc[c] := TColorCheckListBox(Self.FindComponent('chklstRubResc' + IntToStr(c+1)));

  CdsAux.Data := CtrlProvDesc.ListRubricaEmpresa(IntToStr(Sistema.IdEmpresa));
  while not(CdsAux.EOF) do
  begin
    for c:=0 to NUM_RUBRICAS-1 do
      chklstRub[c].Items.Add(CdsAux.FieldByName('DESCRPROVDESC').asString);

    for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
    begin
      chklstRubContrib[c].Items.Add(CdsAux.FieldByName('DESCRPROVDESC').asString);
      chklstRubContribPatronal[c].Items.Add(CdsAux.FieldByName('DESCRPROVDESC').asString);
    end;

    for c:=0 to NUM_RUBRICAS_RESC-1 do
      chklstRubResc[c].Items.Add(CdsAux.FieldByName('DESCRPROVDESC').asString);

    chklstRubPAT.Items.Add(CdsAux.FieldByName('DESCRPROVDESC').asString);

    ListaIdRub.Add(CdsAux.FieldByName('CODPROVDESC').asString +'=');
    ListaIdRubResc.Add(CdsAux.FieldByName('CODPROVDESC').asString);
    ListaIdRubContrib.Add(CdsAux.FieldByName('CODPROVDESC').asString);

    CdsAux.Next;
  end;
  
  // Inicializar variáveis
  dtedRetif.Date := CtrlGlobalRH.GetNormalIni;
  dblkcbResp.Text := CdsNomeResp.FieldByName('NOME').asString;
  speAno.Text := IntToStr(FU.ExtraiAno(CtrlGlobalRH.GetNormalIni)-1);
  pnlHorario.Caption := '';
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlRubricas.ActivePageIndex := 0;
  pgctrlTipoContrib.ActivePageIndex := 0;
  pgctrlContrib.ActivePageIndex := 0;
  pgctrlRubricasResc.ActivePageIndex := 0;

  sListaIdRubAtual := sListaIdRubSel[0];
  chklstRubAtual := chklstRub[0];
  chklstRubContribAtual := chklstRubContrib[0];
  chklstRubRescAtual := chklstRubResc[0];

  // Carregar alterações nas opções feitas anteriormente
  LerAlteracoes;

  for c:=0 to NUM_RUBRICAS-1 do
    if (chklstRub1.Items.Count > 0) then
      chklstRub[c].ItemIndex := 0;

  for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
  begin
    if (chklstRubContrib1.Items.Count > 0) then
      chklstRubContrib[c].ItemIndex := 0;
    if (chklstRubContribPatronal1.Items.Count > 0) then
      chklstRubContribPatronal[c].ItemIndex := 0;
  end;
  
  for c:=0 to NUM_RUBRICAS_RESC-1 do
    if (chklstRubResc1.Items.Count > 0) then
      chklstRubResc[c].ItemIndex := 0;

  chklstRubPAT.ItemIndex := 0;

  rgTipoInfExit(Sender);
  rgTipoDeclaracExit(Sender);

  chklstRub1Click(Sender);

  chklstRubContrib1ClickCheck(nil);
  chklstRubPATClickCheck(nil);

  HabilitarBtResult(false);

  dtedRetif.OnChange := dtedRetifChange;
  dblkcbResp.OnChange := speAnoChange;
  speAno.OnChange := speAnoChange;
  dtedDataEncerr.OnChange := dtedDataEncerrChange;
  stxtTipoFolha.Visible := (chklstRub1.Checked[0]);
  dblkcbTipoFolha.Visible := (chklstRub1.Checked[0]);
  pnlSelecao.BringToFront;
  HabilitaBtOk;
end;

procedure TfrmParamRAISMagnetico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlParamRAISMagnetico);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlProvDesc);

  GravarAlteracoes;

  ListaIdRub.Free;
  ListaIdRubResc.Free;
  ListaIdRubContrib.Free;
  ListaIdEstab.Free;
  ListaIdMotivo.Free;
  ListaIdMotivo_AdmDem.Free;
  ListaIdMotivo_Resc.Free;
  inherited;
end;

procedure TfrmParamRAISMagnetico.speAnoChange(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRAISMagnetico.dtedRetifChange(Sender: TObject);
begin
  HabilitaBtOk;
  rbtnGerar.Enabled := (rbtnGerar.Enabled) and (Trim(dtedRetif.Text) <> '');
end;

procedure TfrmParamRAISMagnetico.dtedDataEncerrChange(Sender: TObject);
begin
  HabilitaBtOk;
  rbtnGerar.Enabled := (rbtnGerar.Enabled) and (Trim(dtedDataEncerr.Text) <> '');
end;

procedure TfrmParamRAISMagnetico.redSalMinAtualChange(Sender: TObject);
begin
  HabilitaBtOk;
  rbtnGerar.Enabled := (rbtnGerar.Enabled) and (Trim(redSalMinAtual.Text) <> '');
end;

procedure TfrmParamRAISMagnetico.pgctrlRubricasChange(Sender: TObject);
begin
  chklstRubAtual := chklstRub[pgctrlRubricas.ActivePageIndex];
  sListaIdRubAtual := sListaIdRubSel[pgctrlRubricas.ActivePageIndex];

  FU.CriaListaOpcoes(chklstRubAtual, ListaIdRub, sListaIdRubAtual, ',', false, true);
  edCodRubricas.Text := sListaIdRubAtual;
  SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.pgctrlContribChange(Sender: TObject);
begin
  if (pgctrlTipoContrib.ActivePageIndex = 0) then
  begin
    chklstRubContribAtual := chklstRubContrib[pgctrlContrib.ActivePageIndex];
    sListaIdRubContribAtual := sListaIdRubContribSel[pgctrlContrib.ActivePageIndex];
  end
  else
  begin
    chklstRubContribAtual := chklstRubContribPatronal[pgctrlContribPatronal.ActivePageIndex];
    sListaIdRubContribAtual := sListaIdRubContribPatronalSel[pgctrlContribPatronal.ActivePageIndex];
  end;

  FU.CriaListaOpcoes(chklstRubContribAtual, ListaIdRubContrib, sListaIdRubContribAtual, ',', false);
  edCodRubricasContrib.Text := sListaIdRubContribAtual;
end;

procedure TfrmParamRAISMagnetico.pgctrlRubricasRescChange(Sender: TObject);
begin
  chklstRubRescAtual := chklstRubResc[pgctrlRubricasResc.ActivePageIndex];
  sListaIdRubRescAtual := sListaIdRubRescSel[pgctrlRubricasResc.ActivePageIndex];

  FU.CriaListaOpcoes(chklstRubRescAtual, ListaIdRubResc, sListaIdRubRescAtual, ',', false);
  edCodRubricasResc.Text := sListaIdRubRescAtual;
end;

procedure TfrmParamRAISMagnetico.dblkcbTipoFolhaChange(Sender: TObject);
begin
  if (Trim(dblkcbTipoFolha.Text) <> '') then
    ListaIdRub[chklstRubAtual.ItemIndex] :=
      Copy(ListaIdRub[chklstRubAtual.ItemIndex],0,
        Pos('=',ListaIdRub[chklstRubAtual.ItemIndex]))+
      dblkcbTipoFolha.LookupValue
  else
    ListaIdRub[chklstRubAtual.ItemIndex] :=
      Copy(ListaIdRub[chklstRubAtual.ItemIndex],0,
        Pos('=',ListaIdRub[chklstRubAtual.ItemIndex]));
end;

procedure TfrmParamRAISMagnetico.chklstRub1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP,VK_DOWN]) then
    SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.chklstEstabClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
end;

procedure TfrmParamRAISMagnetico.chklstRub1ClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  FU.CriaListaOpcoes(chklstRubAtual, ListaIdRub, sListaIdRubAtual, ',', false, true);
  edCodRubricas.Text := sListaIdRubAtual;
  SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.chklstRubContrib1ClickCheck(Sender: TObject);
begin
  HabilitaBtOk;
  FU.CriaListaOpcoes(chklstRubContribAtual, ListaIdRubContrib, sListaIdRubContribAtual, ',', false);
  edCodRubricasContrib.Text := sListaIdRubContribAtual;
end;

procedure TfrmParamRAISMagnetico.chklstRubPATClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(chklstRubPAT, ListaIdRubContrib, sListaIdRubPAT, ',', false);
  edCodRubricasPAT.Text := sListaIdRubPAT;
end;

procedure TfrmParamRAISMagnetico.chklstRubResc1ClickCheck(Sender: TObject);
begin
  FU.CriaListaOpcoes(chklstRubRescAtual, ListaIdRubResc, sListaIdRubRescAtual, ',', false);
  edCodRubricasResc.Text := sListaIdRubRescAtual;
end;

procedure TfrmParamRAISMagnetico.rgTipoInfExit(Sender: TObject);
begin
  dtedRetif.Enabled := (rgTipoInf.ItemIndex = 1);
  if (dtedRetif.Enabled) then
    dtedRetifChange(Sender);
end;

procedure TfrmParamRAISMagnetico.rgTipoDeclaracExit(Sender: TObject);
begin
  dtedDataEncerr.Enabled := (rgTipoDeclarac.ItemIndex = 1);
  if (dtedDataEncerr.Enabled) then
    dtedDataEncerrChange(Sender);
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := true;
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
  HabilitaBtOk;
  chklstEstab.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodasRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubAtual.Items.Count-1 do
    chklstRubAtual.Checked[c] := true;

  FU.CriaListaOpcoes(chklstRubAtual, ListaIdRub, sListaIdRubAtual, ',', false, true);
  edCodRubricas.Text := sListaIdRubAtual;
  HabilitaBtOk;
  chklstRubAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelRubClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubAtual.Items.Count-1 do
    chklstRubAtual.Checked[c] := not(chklstRubAtual.Checked[c]);

  FU.CriaListaOpcoes(chklstRubAtual, ListaIdRub, sListaIdRubAtual, ',', false, true);
  edCodRubricas.Text := sListaIdRubAtual;
  HabilitaBtOk;
  chklstRubAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodasRubContribClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubContribAtual.Items.Count-1 do
    chklstRubContribAtual.Checked[c] := true;

  FU.CriaListaOpcoes(chklstRubContribAtual, ListaIdRubContrib, sListaIdRubContribAtual, ',', false);
  edCodRubricasContrib.Text := sListaIdRubContribAtual;
  chklstRubContribAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelRubContribClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubContribAtual.Items.Count-1 do
    chklstRubContribAtual.Checked[c] := not(chklstRubContribAtual.Checked[c]);

  FU.CriaListaOpcoes(chklstRubContribAtual, ListaIdRubContrib, sListaIdRubContribAtual, ',', false);
  edCodRubricasContrib.Text := sListaIdRubContribAtual;
  chklstRubContribAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodasRubPATClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubPAT.Items.Count-1 do
    chklstRubPAT.Checked[c] := true;

  FU.CriaListaOpcoes(chklstRubPAT, ListaIdRubContrib, sListaIdRubPAT, ',', false);
  edCodRubricasPAT.Text := sListaIdRubPAT;
  chklstRubPAT.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelRubPATClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubPAT.Items.Count-1 do
    chklstRubPAT.Checked[c] := not(chklstRubPAT.Checked[c]);

  FU.CriaListaOpcoes(chklstRubPAT, ListaIdRubContrib, sListaIdRubPAT, ',', false);
  edCodRubricasPAT.Text := sListaIdRubPAT;
  chklstRubPAT.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnSelTodasRubRescClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubRescAtual.Items.Count-1 do
    chklstRubRescAtual.Checked[c] := true;

  FU.CriaListaOpcoes(chklstRubRescAtual, ListaIdRub, sListaIdRubRescAtual, ',', false);
  edCodRubricas.Text := sListaIdRubRescAtual;
  chklstRubRescAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.bbtnInverteSelRubRescClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstRubRescAtual.Items.Count-1 do
    chklstRubRescAtual.Checked[c] := not(chklstRubRescAtual.Checked[c]);

  FU.CriaListaOpcoes(chklstRubRescAtual, ListaIdRub, sListaIdRubRescAtual, ',', false);
  edCodRubricas.Text := sListaIdRubRescAtual;
  chklstRubRescAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.sbtnMarcarRubClick(Sender: TObject);
begin
  edCodRubricas.Text := Trim(edCodRubricas.Text);
  FU.VerificaOpcoes(chklstRubAtual, ListaIdRub, edCodRubricas.Text, ',');
  sListaIdRubAtual := edCodRubricas.Text;
  HabilitaBtOk;
  chklstRubAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.sbtnMarcarRubContribClick(Sender: TObject);
begin
  edCodRubricasContrib.Text := Trim(edCodRubricasContrib.Text);
  FU.VerificaOpcoes(chklstRubContribAtual, ListaIdRubContrib, edCodRubricasContrib.Text, ',');
  sListaIdRubContribAtual := edCodRubricasContrib.Text;
  HabilitaBtOk;
  chklstRubContribAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.sbtnMarcarRubPATClick(Sender: TObject);
begin
  edCodRubricasPAT.Text := Trim(edCodRubricasPAT.Text);
  FU.VerificaOpcoes(chklstRubPAT, ListaIdRubContrib, edCodRubricasPAT.Text, ',');
  sListaIdRubPAT := edCodRubricasPAT.Text;
  chklstRubPAT.Repaint;
end;

procedure TfrmParamRAISMagnetico.sbtnMarcarRubRescClick(Sender: TObject);
begin
  edCodRubricasResc.Text := Trim(edCodRubricasResc.Text);
  FU.VerificaOpcoes(chklstRubRescAtual, ListaIdRubResc, edCodRubricasResc.Text, ',');
  sListaIdRubRescAtual := edCodRubricasResc.Text;
  chklstRubRescAtual.Repaint;
end;

procedure TfrmParamRAISMagnetico.chklstRub1Click(Sender: TObject);
begin
  SelTipoFolha;
end;

procedure TfrmParamRAISMagnetico.bbtnVoltarClick(Sender: TObject);
begin
  pnlResult.SendToBack;
  HabilitarBtResult(true);
end;

procedure TfrmParamRAISMagnetico.bbtnVerResultadoClick(Sender: TObject);
begin
  pnlSelecao.SendToBack;
  HabilitarBtResult(false);
end;

procedure TfrmParamRAISMagnetico.bbtnSalvarClick(Sender: TObject);
begin
  if (svdlgResult.Execute) then
    memResult.Lines.SaveToFile(svdlgResult.FileName);
end;

procedure TfrmParamRAISMagnetico.rbtnGerarClick(Sender: TObject);
var
  c: byte;
  Arquivo: TStringList;
begin
  // Verificar se as opções selecionadas estão corretamente selecionadas
  if not(VerificaOpcoesOk) then
  begin
    pnlHorario.Caption := '';
    exit;
  end;

  memResult.Lines.Clear;
  memResult.Lines.Add('[' +FormatDateTime('dd/mm/yyyy - hh:nn:ss',Now)+ '] ' +
    FU.CMTranslate('Processo Iniciado...'));
  fclblTitulo.Caption := FU.CMTranslateMsg(MSG_TITULO, [speAno.Text]);
  gagTotal.Progress := 0;
  gagTotal.MaxValue := 100;
  lblHoraIni.Caption := FU.CMTranslate('Hora de Início: ') + TimeToStr(Time);
  lblTempoDecorr.Caption := FU.TempoDecorridoHMS(0, false);

  pnlProgresso.Top := 160;
  pnlProgresso.Visible := true;
  pnlProgresso.Update;

  // Estabelecimentos selecionados
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',', false);

  // Rubricas selecionadas
  for c:=0 to NUM_RUBRICAS-1 do
    FU.CriaListaOpcoes(chklstRub[c], ListaIdRub, sListaIdRubSel[c], ',', false);

  for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
  begin
    FU.CriaListaOpcoes(chklstRubContrib[c], ListaIdRubContrib, sListaIdRubContribSel[c], ',', false);
    FU.CriaListaOpcoes(chklstRubContribPatronal[c], ListaIdRubContrib, sListaIdRubContribPatronalSel[c], ',', false);
  end;
  
  for c:=0 to NUM_RUBRICAS_RESC-1 do
    FU.CriaListaOpcoes(chklstRubResc[c], ListaIdRubResc, sListaIdRubRescSel[c], ',', false);

  FU.CriaListaOpcoes(chklstRubPAT, ListaIdRubContrib, sListaIdRubPATSel, ',', false);

  // Tipos de Admissões selecionados
  FU.CriaListaOpcoes(chklstMotivoAdm, ListaIdMotivo_AdmDem, sListaIdMotivoAdmSel, ',', false);

  // Tipos de Demissões selecionados
  FU.CriaListaOpcoes(chklstMotivoDem, ListaIdMotivo_AdmDem, sListaIdMotivoDemSel, ',', false);

  // Tipos de Rescisão selecionados
  FU.CriaListaOpcoes(chklstMotivoResc, ListaIdMotivo_Resc, sListaIdMotivoRescSel, ',', false);

  // Afastamentos selecionados
  FU.CriaListaOpcoes(chklstMotivoAfast, ListaIdMotivo, sListaIdAfastSel, ',', false);

  // Retornos selecionados
  FU.CriaListaOpcoes(chklstMotivoRetorno, ListaIdMotivo, sListaIdRetornoSel, ',', false);

  // Processamento
  if (CtrlParamRAISMagnetico.ProcessarGeracao(
      Sistema.IdEmpresa,
      speAno.Text,
      cmbMesDataBase.ItemIndex + 1,
      FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
        cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
        cbxAutonomos.Checked, cbxEstagiarios.Checked, true),
      sListaIdEstabSel,
      sListaIdMotivoAdmSel,
      sListaIdMotivoDemSel,
      sListaIdAfastSel,
      sListaIdRetornoSel,
      CdsNomeResp.FieldByName('IDPESSOA').asFloat,
      rgTipoInf.ItemIndex = 0,
      rgIndicador1.ItemIndex = 0,
      rgTipoDeclarac.ItemIndex = 0,
      dtedDataEncerr.Date,
      spedNumProp.Value,
      rgMicroEmpr.ItemIndex + 1,
      rgSimples.ItemIndex + 1,
      sListaIdRubSel[0], // Salário para a Folha Normal
      sListaIdRubSel[1], // 1º Parcela do 13º
      sListaIdRubSel[2], // 2º Parcela do 13º
      sListaIdRubSel[3], // Salário Contratual
      sListaIdRubSel[4], // Quant. Horas Mensais p/ Horistas
      sListaIdRubPATSel, // Vale Alimentação
      sListaIdMotivoRescSel, // Tipos de Folha das Rescisões
      sListaIdRubRescSel[0], // Aviso Prévio Indenizado
      sListaIdRubRescSel[1], // Férias Indenizadas
      sListaIdRubRescSel[2], // Banco de Horas
      sListaIdRubRescSel[3], // Dissídio
      sListaIdRubRescSel[4], // Gratificação
      sListaIdRubRescSel[5], // Multa Rescisória
      sListaIdRubContribPatronalSel[0], // Contribuição Patronal Associativa
      sListaIdRubContribPatronalSel[1], // Contribuição Patronal Sindical
      sListaIdRubContribPatronalSel[2], // Contribuição Patronal Assistencial
      sListaIdRubContribPatronalSel[3], // Contribuição Patronal Confederativa
      sListaIdRubContribSel[0], // Contribuição Associativa
      sListaIdRubContribSel[1], // Contribuição Sindical
      sListaIdRubContribSel[2], // Contribuição Assistencial
      sListaIdRubContribSel[3], // Contribuição Confederativa
      redPorc1.Value, // Porcentagem de Serviço Próprio
      redPorc2.Value, // Porcentagem de Administração de cozinha
      redPorc3.Value, // Porcentagem de Refeição convênio
      redPorc4.Value, // Porcentagem de Refeição transportadora
      redPorc5.Value, // Porcentagem de Cesta alimento
      redPorc6.Value, // Porcentagem de Alimentação convênio
      redSalMinAtual.Value,
      dtedRetif.Date
     )) then
  begin
    try
      if (CtrlParamRAISMagnetico.DadosArquivo.Text <> '') then
      begin
        Arquivo := TStringList.Create;
        Arquivo.Text := CtrlParamRAISMagnetico.DadosArquivo.Text;
        Arquivo.SaveToFile(svdlgDialogo.FileName);
        Arquivo.Free;
      end;

      memResult.Lines.Add('[' +FormatDateTime('dd/mm/yyyy - hh:nn:ss',Now)+ '] ' +
        CtrlParamRAISMagnetico.MessageInfo);
      MsgDlg(CtrlParamRAISMagnetico.MessageInfo,
        FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
    except
      on E: Exception do
      begin
        MsgDlg(
          FU.CMTranslateMsg(MSG_ERRO_GRAVA_ARQ, [
            speAno.Text, ExtractFilePath(svdlgDialogo.FileName)]),
            FU.CMTranslate('Erro'), mtInformation, [mbOk,mbHelp], 0);
        memResult.Lines.Add('[ERRO] ' +
          FU.CMTranslateMsg(MSG_ERRO_GRAVA_ARQ, [
            speAno.Text, ExtractFilePath(svdlgDialogo.FileName)]));
      end;
    end;
  end
  else
  begin
    memResult.Lines.Add('[' +FormatDateTime('dd/mm/yyyy - hh:nn:ss',Now)+ '] ' +
      CtrlParamRAISMagnetico.MessageInfo);
    MsgDlg(
      CtrlParamRAISMagnetico.MessageInfo,
      FU.CMTranslate('Erro'), mtInformation, [mbOk,mbHelp], 0);
  end;

  pnlHorario.Caption := FU.CMTranslate('Tempo de Processamento: ') +
    CtrlParamRAISMagnetico.TempoDecorridoTotal;
  pnlProgresso.Visible := false;

  HabilitarBtResult(false);
  pnlSelecao.SendToBack;  
end;

// ------------------------------------------------------------------------------------------
// Funções do Form
// ------------------------------------------------------------------------------------------

procedure TfrmParamRAISMagnetico.LerAlteracoes;
var
  c: byte;
  LiResp: string;
begin
  // Recuperar as últimas alterações das opções
  ArqConfig := TIniFile.Create('C:\CONFIG_FOLHAPAGTO.INI');

  for c:=0 to NUM_RUBRICAS-1 do
    sListaIdRubSel[c] := ArqConfig.ReadString('RAIS_MAG', 'Rubricas'+IntToStr(c+1), '');

  for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
  begin
    sListaIdRubContribSel[c] := ArqConfig.ReadString('RAIS_MAG', 'RubricasContrib'+IntToStr(c+1), '');
    sListaIdRubContribPatronalSel[c] := ArqConfig.ReadString('RAIS_MAG', 'RubricasContribPatronal'+IntToStr(c+1), '');
  end;

  for c:=0 to NUM_RUBRICAS_RESC-1 do
    sListaIdRubRescSel[c] := ArqConfig.ReadString('RAIS_MAG', 'RubricasResc'+IntToStr(c+1), '');

  sListaIdRubPATSel := ArqConfig.ReadString('RAIS_MAG', 'RubricasPAT', '');
  sListaIdEstabSel := ArqConfig.ReadString('RAIS_MAG', 'Estabelec', '');
  sListaIdAfastSel := ArqConfig.ReadString('RAIS_MAG', 'Afastamentos', '');
  sListaIdRetornoSel := ArqConfig.ReadString('RAIS_MAG', 'Retornos', '');
  sListaIdMotivoAdmSel := ArqConfig.ReadString('RAIS_MAG', 'MotivoAdmissao', '');
  sListaIdMotivoDemSel := ArqConfig.ReadString('RAIS_MAG', 'MotivoDemissao', '');
  sListaIdMotivoRescSel := ArqConfig.ReadString('RAIS_MAG', 'MotivoRescisao', '');

  LiResp := ArqConfig.ReadString('RAIS_MAG', 'Responsavel', '');

  cbxEfetivos.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Efetivos', 'V') = 'V');
  cbxEspeciais.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Especiais', 'V') = 'V');
  cbxTemporarios.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Temporarios', 'V') = 'V');
  cbxEstagiarios.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Estagiarios', 'F') = 'V');
  cbxTerceiros.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Terceiros', 'F') = 'V');
  cbxPropDirSemVinc.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Proprietarios', 'F') = 'V');
  cbxAutonomos.Checked := (ArqConfig.ReadString('RAIS_MAG', 'Autonomos', 'F') = 'V');

  cmbMesDataBase.ItemIndex := StrToInt(ArqConfig.ReadString('RAIS_MAG', 'DataBase', '0'));

  redSalMinAtual.Value := StrToFloat(ArqConfig.ReadString('RAIS_MAG', 'SalMinAtual', '180'));

  for c:=0 to NUM_RUBRICAS-1 do
  begin
    SelTipoFolhaRub(ListaIdRub, sListaIdRubSel[c]);
    FU.VerificaOpcoes(chklstRub[c], ListaIdRub, sListaIdRubSel[c], ',');
    sListaIdRubSel[c] := NormalizaLiRubrica(sListaIdRubSel[c]);
  end;

  for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
  begin
    FU.VerificaOpcoes(chklstRubContrib[c], ListaIdRubContrib, sListaIdRubContribSel[c], ',');
    FU.VerificaOpcoes(chklstRubContribPatronal[c], ListaIdRubContrib, sListaIdRubContribPatronalSel[c], ',');
  end;

  for c:=0 to NUM_RUBRICAS_RESC-1 do
    FU.VerificaOpcoes(chklstRubResc[c], ListaIdRubResc, sListaIdRubRescSel[c], ',');

  FU.VerificaOpcoes(chklstRubPAT, ListaIdRubContrib, sListaIdRubPATSel, ',');
  FU.VerificaOpcoes(chklstEstab, ListaIdEstab, sListaIdEstabSel, ',');
  FU.VerificaOpcoes(chklstMotivoAfast, ListaIdMotivo, sListaIdAfastSel, ',');
  FU.VerificaOpcoes(chklstMotivoRetorno, ListaIdMotivo, sListaIdRetornoSel, ',');
  FU.VerificaOpcoes(chklstMotivoAdm, ListaIdMotivo_AdmDem, sListaIdMotivoAdmSel, ',');
  FU.VerificaOpcoes(chklstMotivoDem, ListaIdMotivo_AdmDem, sListaIdMotivoDemSel, ',');
  FU.VerificaOpcoes(chklstMotivoResc, ListaIdMotivo_Resc, sListaIdMotivoRescSel, ',');
  
  if (LiResp = '') then
  begin
    CdsNomeResp.First;
    LiResp := CdsNomeResp.FieldByName('IDPESSOA').asString;
  end;
  dblkcbResp.LookUpValue := LiResp;
  dblkcbResp.UpDate;

  edCodRubricas.Text := sListaIdRubSel[0];
  edCodRubricasContrib.Text := sListaIdRubContribSel[0];
  edCodRubricasResc.Text := sListaIdRubRescSel[0];

  HabilitaBtOk;
end;

procedure TfrmParamRAISMagnetico.GravarAlteracoes;
var
  c: byte;
  sGravaPadrao: string;
begin
  // Gravar as últimas alterações da Opção de Rubricas
  for c:=0 to NUM_RUBRICAS-1 do
  begin
    FU.CriaListaOpcoes(chklstRub[c], ListaIdRub, sGravaPadrao, ',', false);
    ArqConfig.WriteString('RAIS_MAG', 'Rubricas'+IntToStr(c+1), sGravaPadrao);
  end;

  for c:=0 to NUM_RUBRICAS_CONTRIB-1 do
  begin
    FU.CriaListaOpcoes(chklstRubContrib[c], ListaIdRubContrib, sGravaPadrao, ',', false);
    ArqConfig.WriteString('RAIS_MAG', 'RubricasContrib'+IntToStr(c+1), sGravaPadrao);

    FU.CriaListaOpcoes(chklstRubContribPatronal[c], ListaIdRubContrib, sGravaPadrao, ',', false);
    ArqConfig.WriteString('RAIS_MAG', 'RubricasContribPatronal'+IntToStr(c+1), sGravaPadrao);
  end;

  for c:=0 to NUM_RUBRICAS_RESC-1 do
  begin
    FU.CriaListaOpcoes(chklstRubResc[c], ListaIdRubResc, sGravaPadrao, ',', false);
    ArqConfig.WriteString('RAIS_MAG', 'RubricasResc'+IntToStr(c+1), sGravaPadrao);
  end;

  FU.CriaListaOpcoes(chklstRubPAT, ListaIdRubContrib, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'RubricasPAT', sGravaPadrao);

  // Gravar as últimas alterações dos Estabelecimento
  FU.CriaListaOpcoes(chklstEstab, ListaIdEstab, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'Estabelec', sGravaPadrao);

  FU.CriaListaOpcoes(chklstMotivoAfast, ListaIdMotivo, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'Afastamentos', sGravaPadrao);

  FU.CriaListaOpcoes(chklstMotivoRetorno, ListaIdMotivo, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'Retornos', sGravaPadrao);

  FU.CriaListaOpcoes(chklstMotivoAdm, ListaIdMotivo_AdmDem, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'MotivoAdmissao', sGravaPadrao);

  FU.CriaListaOpcoes(chklstMotivoDem, ListaIdMotivo_AdmDem, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'MotivoDemissao', sGravaPadrao);

  FU.CriaListaOpcoes(chklstMotivoResc, ListaIdMotivo_Resc, sGravaPadrao, ',', false);
  ArqConfig.WriteString('RAIS_MAG', 'MotivoRescisao', sGravaPadrao);

  // Mês da Data-base
  ArqConfig.WriteString('RAIS_MAG', 'DataBase', IntToStr(cmbMesDataBase.ItemIndex));

  // Gravar as últimas alterações do Responsável
  if (Trim(dblkcbResp.Text) <> '') then
    ArqConfig.WriteString('RAIS_MAG', 'Responsavel', CdsNomeResp.FieldByName('IDPESSOA').asString);

  // Gravar a última alteração do Salário Mínimo Atual
  ArqConfig.WriteString('RAIS_MAG', 'SalMinAtual', FloatToStr(redSalMinAtual.Value));

  ArqConfig.WriteString('RAIS_MAG', 'Efetivos', FU.IFF(cbxEfetivos.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Especiais', FU.IFF(cbxEspeciais.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Temporarios', FU.IFF(cbxTemporarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Estagiarios', FU.IFF(cbxEstagiarios.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Terceiros', FU.IFF(cbxTerceiros.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Proprietarios', FU.IFF(cbxPropDirSemVinc.Checked, 'V', 'F'));
  ArqConfig.WriteString('RAIS_MAG', 'Autonomos', FU.IFF(cbxAutonomos.Checked, 'V', 'F'));
end;

procedure TfrmParamRAISMagnetico.HabilitaBtOk;
var
  i,c: integer;
  bSelEstab, bSelAfast, bSelRetorno: boolean;
  bSelRub: array[0..NUM_RUBRICAS-3] of boolean;
begin
  bSelEstab := false;
  for c:=0 to chklstEstab.Items.Count-1 do
    if (chklstEstab.Checked[c]) then
    begin
      bSelEstab := true;
      break;
    end;

  bSelAfast := false;
  for c:=0 to chklstMotivoAfast.Items.Count-1 do
    if (chklstMotivoAfast.Checked[c]) then
    begin
      bSelAfast := true;
      break;
    end;

  bSelRetorno := false;
  for c:=0 to chklstMotivoRetorno.Items.Count-1 do
    if (chklstMotivoRetorno.Checked[c]) then
    begin
      bSelRetorno := true;
      break;
    end;

  for i:=0 to NUM_RUBRICAS-3 do
  begin
    bSelRub[i] := false;
    for c:=0 to chklstRub[i].Items.Count-1 do
      if (chklstRub[i].Checked[c]) then
      begin
        bSelRub[i] := true;
        break;
      end;
  end;

  bBtOkHabilitado := (bSelEstab) and (bSelAfast) and (bSelRetorno) and
    (bSelRub[0]) and (bSelRub[1]) and (bSelRub[2]) and
    (Trim(speAno.Text) <> '') and (Trim(dblkcbResp.Text) <> '');
  rbtnGerar.Enabled := bBtOkHabilitado;
end;

function TfrmParamRAISMagnetico.VerificaOpcoesOk: boolean;
begin
  Result := false;
  svdlgDialogo.FileName := 'C:\RAIS\RAIS' +speAno.Text+ '.TXT';

  // Abrir o diálogo de seleção do arquivo
  if not(DirectoryExists('C:\RAIS')) then
  begin
    if (MsgDlg(FU.CMTranslate('Pasta C:\RAIS não foi encontrada.') +CR_LF+
               FU.CMTranslate('Deseja criá-la?'), FU.CMTranslate('Confirmação'),
               mtConfirmation, [mbYes,mbNo], 0) = mrYes) then
    begin
      try
        CreateDir('C:\RAIS');
      except
        MsgDlg(FU.CMTranslateMsg(MSG_ERRO_CRIAR_PASTA, [CR_LF, CR_LF]),
               FU.CMTranslate('Aviso'), mtInformation, [mbOk,mbHelp], 0);
        svdlgDialogo.FileName := 'C:\';
        if not(svdlgDialogo.Execute) then
          exit;
      end;
    end
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

  Result := true;
end;

procedure TfrmParamRAISMagnetico.SelTipoFolha;
begin
  if (chklstRubAtual.ItemIndex >= 0) then
  begin
    stxtTipoFolha.Visible := (chklstRubAtual.Checked[chklstRubAtual.ItemIndex]);
    dblkcbTipoFolha.Visible := stxtTipoFolha.Visible;

    dblkcbTipoFolha.OnChange := nil;
    if (stxtTipoFolha.Visible) then
      dblkcbTipoFolha.LookupValue :=
        Copy(ListaIdRub[chklstRubAtual.ItemIndex],
          Pos('=',ListaIdRub[chklstRubAtual.ItemIndex])+1,
          Length(ListaIdRub[chklstRubAtual.ItemIndex]) -
          Pos('=',ListaIdRub[chklstRubAtual.ItemIndex]))
    else
      dblkcbTipoFolha.LookupValue := '';
    dblkcbTipoFolha.OnChange := dblkcbTipoFolhaChange;
  end;
end;

procedure TfrmParamRAISMagnetico.SelTipoFolhaRub(Lista: TStringList; Valor: string);
var
  iPos: integer;
  ValorAtual: string;
begin
  while (Trim(Valor) <> '') do
  begin
    FU.ExtraiString(Valor, ValorAtual, ',');
    iPos := Lista.IndexOf(Copy(ValorAtual, 1, Pos('=', ValorAtual)));
    if (iPos > -1) then
      Lista[iPos] := ValorAtual;
  end;
end;

function TfrmParamRAISMagnetico.NormalizaLiRubrica(Valor: string): string;
var
  ValorAtual: string;
begin
  Result := '';
  while (Trim(Valor) <> '') do
  begin
    FU.ExtraiString(Valor, ValorAtual, ',');
    Result := Result + Copy(ValorAtual, 1, FU.IFF(Pos('=', ValorAtual) > 0,
      Pos('=', ValorAtual)-1, Length(ValorAtual))) + FU.IFF((Trim(Valor) = ''), '', ',');
  end;
end;

procedure TfrmParamRAISMagnetico.HabilitarBtResult(const Visivel: boolean);
begin
  bbtnVerResultado.Visible := Visivel;
  ToolbarSep972.Visible := Visivel;
  if (Visivel) then
    rbtnGerar.Enabled := bBtOkHabilitado
  else
    rbtnGerar.Enabled := false;  
end;

procedure TfrmParamRAISMagnetico.Progresso(const TempoAtual, Mensagem: string;
  const NumPessoas: integer; const IncProgresso: boolean; const Log: string);
begin
  if (TempoAtual <> '') then
    lblTempoDecorr.Caption := TempoAtual;

  if (Mensagem <> '') then
    lblProcesso.Caption := Mensagem;

  if (NumPessoas > 0) then
    gagTotal.MaxValue := NumPessoas;

  if (IncProgresso) then
    gagTotal.AddProgress(1);

  if (Log <> '') then
    memResult.Lines.Add(Log);

  Self.Update;
end;

end.
