unit fSelProcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons, TB97, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, CMDateTimePicker, CmParamReport,
  fCustomSelProcesso, uCmSqlParams, DBClient, uCMClientDataSet, uCtrlGlobalRH, uCtrlTipProc,
  uCtrlVaraJustica, uCtrlListTerceirosRH, uCtrlTipAcao, uCtrlTipObjeto, uCtrlTipSent,
  uCtrlTipRec;

type
  TfrmSelProcessoMT = class(TfrmCustomSelProcesso)
    dsProcesso: TwwDataSource;
    pgctrlPrincipal: TPageControl;
    tbshGeral: TTabSheet;
    tbshAdv: TTabSheet;
    rgAdv2: TRadioGroup;
    rgAT: TRadioGroup;
    gbxAdv2: TGroupBox;
    dblcAdv2: TwwDBLookupCombo;
    lstCodAdv2: TListBox;
    gbxAT: TGroupBox;
    dblcAT: TwwDBLookupCombo;
    lstAT: TListBox;
    lstCodAT: TListBox;
    rgAdv1: TRadioGroup;
    gbxAdv1: TGroupBox;
    dblcAdv1: TwwDBLookupCombo;
    lstAdv1: TListBox;
    lstCodAdv1: TListBox;
    rgVaraJust: TRadioGroup;
    gbxVaraJust: TGroupBox;
    rgAdvC: TRadioGroup;
    gbxAdvC: TGroupBox;
    dblcAdvC: TwwDBLookupCombo;
    lstAdvC: TListBox;
    lstCodAdvC: TListBox;
    tbshObjetos: TTabSheet;
    rgObjeto: TRadioGroup;
    gbxObjeto: TGroupBox;
    dblcObjeto: TwwDBLookupCombo;
    lstObjeto: TListBox;
    lstCodObjeto: TListBox;
    rgSentenca: TRadioGroup;
    gbxSentenca: TGroupBox;
    dblcSentenca: TwwDBLookupCombo;
    lstSentenca: TListBox;
    lstCodSentenca: TListBox;
    gbxEtapa: TGroupBox;
    dblcEtapa: TwwDBLookupCombo;
    lstEtapa: TListBox;
    lstCodEtapa: TListBox;
    rgInstancia: TRadioGroup;
    tbsContraParte: TTabSheet;
    gbxTipo: TGroupBox;
    cbxJuridica: TCheckBox;
    cbxFisica: TCheckBox;
    gbxCep: TGroupBox;
    Label7: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    rgEstado: TRadioGroup;
    gbxEstado: TGroupBox;
    dblcEstado: TwwDBLookupCombo;
    lstEstado: TListBox;
    lstCodEstado: TListBox;
    rgCidade: TRadioGroup;
    gbxCidade: TGroupBox;
    dblcCidade: TwwDBLookupCombo;
    lstCidade: TListBox;
    lstCodCidade: TListBox;
    rgRecl: TRadioGroup;
    gbxRecl: TGroupBox;
    dblcRecl: TwwDBLookupCombo;
    lstRecl: TListBox;
    lstCodRecl: TListBox;
    rgEtapa: TRadioGroup;
    rgUF: TRadioGroup;
    gbxUF: TGroupBox;
    dblcUF: TwwDBLookupCombo;
    lstUF: TListBox;
    lstCodUF: TListBox;
    rgSitProc: TRadioGroup;
    gbxNumPr: TGroupBox;
    Label2: TLabel;
    EdnNum1: TEditNum;
    EdnNum2: TEditNum;
    gbxTipEncer: TGroupBox;
    cbxArquiv: TCheckBox;
    cbxAcordo: TCheckBox;
    cbxDesist: TCheckBox;
    cbxSent: TCheckBox;
    rgParte: TRadioGroup;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednCus1: TEditNum;
    ednCus2: TEditNum;
    gbxFaixaInc: TGroupBox;
    Label15: TLabel;
    edDataInc1: TCMDateTimePicker;
    edDataInc2: TCMDateTimePicker;
    gbxFaixaAju: TGroupBox;
    Label6: TLabel;
    EdDataAju1: TCMDateTimePicker;
    EdDataAju2: TCMDateTimePicker;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    EdDataNot1: TCMDateTimePicker;
    EdDataNot2: TCMDateTimePicker;
    gbxDataEnc: TGroupBox;
    Label5: TLabel;
    EdDataEnc1: TCMDateTimePicker;
    EdDataEnc2: TCMDateTimePicker;
    gbxTempAdm: TGroupBox;
    Label1: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    rgTipoProc: TRadioGroup;
    gbxTipoProc: TGroupBox;
    dblcTipoProc: TwwDBLookupCombo;
    lstTipoProc: TListBox;
    lstCodTipoProc: TListBox;
    rgTipoAcao: TRadioGroup;
    gbxTipoAcao: TGroupBox;
    dblcTipoAcao: TwwDBLookupCombo;
    lstTipoAcao: TListBox;
    lstCodTipoAcao: TListBox;
    CdsProcesso: TCMClientDataSet;
    CdsAdvog2: TCMClientDataSet;
    CdsAdvog1: TCMClientDataSet;
    lstAdv2: TListBox;
    CdsAdvogCasa: TCMClientDataSet;
    CdsVaraJustica: TCMClientDataSet;
    CdsAT: TCMClientDataSet;
    CdsUF: TCMClientDataSet;
    CdsTipoProc: TCMClientDataSet;
    CdsTipoAcao: TCMClientDataSet;
    CdsObjeto: TCMClientDataSet;
    CdsEtapa: TCMClientDataSet;
    CdsSentenca: TCMClientDataSet;
    CdsCidade: TCMClientDataSet;
    CdsEstado: TCMClientDataSet;
    CdsRecl: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    lstSiglaUF: TListBox;
    dblcVaraJust: TwwDBLookupCombo;
    lstVaraJust: TListBox;
    lstCodVaraJust: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure EdnNum1Change(Sender: TObject);
    procedure EdnNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoProcClick(Sender: TObject);
    procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTipProc: TCtrlTipProc;
    CtrlTipAcao: TCtrlTipAcao;
    CtrlTipObjeto: TCtrlTipObjeto;
    CtrlTipSent: TCtrlTipSent;
    CtrlTipRec: TCtrlTipRec;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlVaraJustica: TCtrlVaraJustica;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;

    procedure MudouEstado;
  end;

var
  frmSelProcessoMT: TfrmSelProcessoMT;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

const
  ORDEM_DADOS: array[0..5] of string = (
    'UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.NOMEESTADO), UPPER(ENDRECLAMANTES.CIDADE), UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.CIDADE), UPPER(RECLAMANTES.NOME)',
    'RECLAMANTES.TIPO, UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.NOMEESTADO), UPPER(ENDRECLAMANTES.CIDADE), RECLAMANTES.TIPO, UPPER(RECLAMANTES.NOME)',
    'UPPER(ENDRECLAMANTES.CIDADE), RECLAMANTES.TIPO, UPPER(RECLAMANTES.NOME)');

{$R *.DFM}

procedure TfrmSelProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlTipProc := TCtrlTipProc.Create;
  CtrlTipProc.InitializeAs(Padroes);

  CtrlTipAcao := TCtrlTipAcao.Create;
  CtrlTipAcao.InitializeAs(Padroes);

  CtrlTipObjeto := TCtrlTipObjeto.Create;
  CtrlTipObjeto.InitializeAs(Padroes);

  CtrlTipSent := TCtrlTipSent.Create;
  CtrlTipSent.InitializeAs(Padroes);

  CtrlTipRec := TCtrlTipRec.Create;
  CtrlTipRec.InitializeAs(Padroes);

  CtrlVaraJustica := TCtrlVaraJustica.Create;
  CtrlVaraJustica.InitializeAs(Padroes);

  CdsAdvog1.Data := CtrlGlobalRH.ListAdvogadoContratado(Sistema.IdModulo);
  CdsAdvogCasa.Data := CtrlGlobalRH.ListAdvogadoCasa;
  CdsAdvog2.Data := CtrlGlobalRH.ListAdvogadoDoReclamante(Sistema.IdModulo);
  CdsAT.Data := CtrlGlobalRH.ListAssistenteTecnico(Sistema.IdModulo);
  CdsVaraJustica.Data := CtrlVaraJustica.ListVarasDoModulo(Sistema.IdModulo);
  CdsUF.Data := CtrlListTerceirosRH.ListEstado;
  CdsTipoProc.Data := CtrlTipProc.ListTipProc;
  CdsTipoAcao.Data := CtrlTipAcao.ListTipAcao;
  CdsObjeto.Data := CtrlTipObjeto.ListTipObjeto;
  CdsSentenca.Data := CtrlTipSent.ListTipSent;
  CdsEtapa.Data := CtrlTipRec.ListTipRec;
  CdsEstado.Data := CtrlListTerceirosRH.ListEstado;
  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0, '', '');
  CdsRecl.Data := CtrlGlobalRH.ListReclamantes(Sistema.IdModulo);

  edDataInc2.Date := Date+1;
  edDataNot2.Date := Date;
  edDataAju2.Date := Date;
  edDataEnc2.Date := Date;
  cmbSequencia.ItemIndex := 0;
  pgctrlPrincipal.ActivePageIndex := 0;
end;

procedure TfrmSelProcessoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlVaraJustica);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlTipProc);
  FreeAndNil(CtrlTipAcao);
  FreeAndNil(CtrlTipObjeto);
  FreeAndNil(CtrlTipSent);
  FreeAndNil(CtrlTipRec);
  inherited;
end;

procedure TfrmSelProcessoMT.dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Sender = dblcTipoProc) then
    InserirLista(Modified, lstCodTipoProc, lstTipoProc, CdsTipoProc, 'IDTIPOPROC', 'NOMETIPOPROC')
  else
  if (Sender = dblcTipoAcao) then
    InserirLista(Modified, lstCodTipoAcao, lstTipoAcao, CdsTipoAcao, 'IDTIPOACAO', 'DESCRICAO')
  else
  if (Sender = dblcAdv1) then
    InserirLista(Modified, lstCodAdv1, lstAdv1, CdsAdvog1, 'IDPESSOA', 'NOME')
  else
  if (Sender = dblcAdvC) then
    InserirLista(Modified, lstCodAdvC, lstAdvC, CdsAdvogCasa, 'IDPESSOA', 'NOME')
  else
  if (Sender = dblcAdv2) then
    InserirLista(Modified, lstCodAdv2, lstAdv2, CdsAdvog2, 'IDPESSOA', 'NOME')
  else
  if (Sender = dblcAT) then
    InserirLista(Modified, lstCodAT, lstAT, CdsAT, 'IDPESSOA', 'NOME')
  else
  if (Sender = dblcVaraJust) then
    InserirLista(Modified, lstCodVaraJust, lstVaraJust, CdsVaraJustica, 'IDVARAJUSTICA', 'DESCRICAO')
  else
  if (Sender = dblcUF) and (Modified) then
  begin
    InserirLista(Modified, lstCodUF, lstUF, CdsUF, 'IDESTADO', 'NOMEESTADO');
    lstSiglaUF.Items.Add(CdsUF.FieldByName('CODESTADO').asString);
    MudouEstado;
  end
  else
  if (Sender = dblcObjeto) then
    InserirLista(Modified, lstCodObjeto, lstObjeto, CdsObjeto, 'CODTIPOOBJETO', 'DESCRICAO')
  else
  if (Sender = dblcSentenca) then
    InserirLista(Modified, lstCodSentenca, lstSentenca, CdsSentenca, 'CODTIPOSENT', 'DESCRICAO')
  else
  if (Sender = dblcEtapa) then
    InserirLista(Modified, lstCodEtapa, lstEtapa, CdsEtapa, 'CODTIPORECURSO', 'DESCRICAO')
  else
  if (Sender = dblcEstado) then
    InserirLista(Modified, lstCodEstado, lstEstado, CdsEstado, 'IDESTADO', 'NOMEESTADO')
  else
  if (Sender = dblcCidade) then
    InserirLista(Modified, lstCodCidade, lstCidade, CdsCidade, 'IDCIDADES', 'NOME')
  else
  if (Sender = dblcRecl) then
    InserirLista(Modified, lstCodRecl, lstRecl, CdsRecl, 'IDPESSOA', 'NOME');
end;

procedure TfrmSelProcessoMT.lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Sender = lstTipoProc) then
    ApagarLista(Key, lstCodTipoProc, lstTipoProc)
  else
  if (Sender = lstTipoAcao) then
    ApagarLista(Key, lstCodTipoAcao, lstTipoAcao)
  else
  if (Sender = lstAdv1) then
    ApagarLista(Key, lstCodAdv1, lstAdv1)
  else
  if (Sender = lstAdvC) then
    ApagarLista(Key, lstCodAdvC, lstAdvC)
  else
  if (Sender = lstAdv2) then
    ApagarLista(Key, lstCodAdv2, lstAdv2)
  else
  if (Sender = lstAT) then
    ApagarLista(Key, lstCodAT, lstAT)
  else
  if (Sender = lstVaraJust) then
    ApagarLista(Key, lstCodVaraJust, lstVaraJust)
  else
  if (Sender = lstUF) and (Key = VK_DELETE) and (lstUF.Items.Count > 0) then
  begin
    ApagarLista(Key, lstCodUF, lstUF);
    lstSiglaUF.Items.Delete(iIndiceAnt);
    MudouEstado;
  end
  else
  if (Sender = lstObjeto) then
    ApagarLista(Key, lstCodObjeto, lstObjeto)
  else
  if (Sender = lstSentenca) then
    ApagarLista(Key, lstCodSentenca, lstSentenca)
  else
  if (Sender = lstEtapa) then
    ApagarLista(Key, lstCodEtapa, lstEtapa)
  else
  if (Sender = lstEstado) then
    ApagarLista(Key, lstCodEstado, lstEstado)
  else
  if (Sender = lstCidade) then
    ApagarLista(Key, lstCodCidade, lstCidade)
  else
  if (Sender = lstRecl) then
    ApagarLista(Key, lstCodRecl, lstRecl);
end;

procedure TfrmSelProcessoMT.ednAdm2Change(Sender: TObject);
begin
  if (ednAdm2.Value < ednAdm1.Value) then
    ednAdm2.Value := ednAdm1.Value;
end;

procedure TfrmSelProcessoMT.ednAdm1Change(Sender: TObject);
begin
  if (ednAdm1.Value > ednAdm2.Value) then
    ednAdm1.Value := ednAdm2.Value;
end;

procedure TfrmSelProcessoMT.EdnNum1Change(Sender: TObject);
begin
  if (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) then
    ednNum1.Text := ednNum2.Text;
end;

procedure TfrmSelProcessoMT.EdnNum2Change(Sender: TObject);
begin
  if (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) then
    ednNum2.Text := ednNum1.Text;
end;

procedure TfrmSelProcessoMT.ednCus1Change(Sender: TObject);
begin
  if (StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text)) then
    ednCus1.Text := ednCus2.Text;
end;

procedure TfrmSelProcessoMT.ednCus2Change(Sender: TObject);
begin
  if (StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text)) then
    ednCus2.Text := ednCus1.Text;
end;

procedure TfrmSelProcessoMT.rgTipoProcClick(Sender: TObject);
begin
  if (Sender = rgTipoProc) then
    HabilitarLista(rgTipoProc, gbxTipoProc, CdsTipoProc)
  else
  if (Sender = rgTipoAcao) then
    HabilitarLista(rgTipoAcao, gbxTipoAcao, CdsTipoAcao)
  else
  if (Sender = rgAdv1) then
    HabilitarLista(rgAdv1, gbxAdv1, CdsAdvog1)
  else
  if (Sender = rgAdvC) then
    HabilitarLista(rgAdvC, gbxAdvC, CdsAdvogCasa)
  else
  if (Sender = rgAdv2) then
    HabilitarLista(rgAdv2, gbxAdv2, CdsAdvog2)
  else
  if (Sender = rgAT) then
    HabilitarLista(rgAT, gbxAT, CdsAT)
  else
  if (Sender = rgVaraJust) then
    HabilitarLista(rgVaraJust, gbxVaraJust, CdsVaraJustica)
  else
  if (Sender = rgUF) then
  begin
    HabilitarLista(rgUF, gbxUF, CdsUF);
    MudouEstado;
  end
  else
  if (Sender = rgObjeto) then
    HabilitarLista(rgObjeto, gbxObjeto, CdsObjeto)
  else
  if (Sender = rgEtapa) then
    HabilitarLista(rgEtapa, gbxEtapa, CdsEtapa)
  else
  if (Sender = rgSentenca) then
    HabilitarLista(rgSentenca, gbxSentenca, CdsSentenca)
  else
  if (Sender = rgEstado) then
    HabilitarLista(rgEstado, gbxEstado, CdsEstado)
  else
  if (Sender = rgCidade) then
    HabilitarLista(rgCidade, gbxCidade, CdsCidade)
  else
  if (Sender = rgRecl) then
    HabilitarLista(rgRecl, gbxRecl, CdsRecl);
end;

procedure TfrmSelProcessoMT.rgSitProcClick(Sender: TObject);
begin
  gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
  gbxDataEnc.Visible := (rgSitProc.ItemIndex > 0);
end;

procedure TfrmSelProcessoMT.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdAdvogCasaSel, sListaIdAdvog1Sel, sListaIdAdvog2Sel,
  sListaIdEstadoSel, sListaIdCidadesSel, sListaIdReclSel, sListaIdATSel,
  sListaIdVaraJusticaSel, sListaIdUFSel, sListaIdTipoProcSel, sListaIdTipoAcaoSel,
  sListaIdObjetoSel, sListaIdEtapaSel, sListaIdSentencaSel: string;
begin
  if not(cbxJuridica.Checked) and not(cbxFisica.Checked) then
  begin
    MsgDlg('Assinale ao menos um Tipo de Pessoa.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    gbxTipo.SetFocus;
    exit;
  end;

  // Cria a lista de IDs dos Tipos de Processo selecionados
  sListaIdTipoProcSel := GerarParamSELECT(rgTipoProc, lstCodTipoProc, lstTipoProc);

  // Cria a lista de IDs dos Tipos de Ação em Processos selecionados
  sListaIdTipoAcaoSel := GerarParamSELECT(rgTipoAcao, lstCodTipoAcao, lstTipoAcao);

  // Cria a lista de IDs dos Advogados Contratados selecionados
  sListaIdAdvog1Sel := GerarParamSELECT(rgAdv1, lstCodAdv1, lstAdv1);

  // Cria a lista de IDs dos Advogados da Casa selecionados
  sListaIdAdvogCasaSel := GerarParamSELECT(rgAdvC, lstCodAdvC, lstAdvC);

  // Cria a lista de IDs dos Advogados da Contra Parte selecionados
  sListaIdAdvog2Sel := GerarParamSELECT(rgAdv2, lstCodAdv2, lstAdv2);

  // Cria a lista de IDs dos Assistentes Técnicos selecionados
  sListaIdATSel := GerarParamSELECT(rgAT, lstCodAT, lstAT);

  // Cria a lista de IDs das Varas de Justiça selecionadas
  sListaIdVaraJusticaSel := GerarParamSELECT(rgVaraJust, lstCodVaraJust, lstVaraJust);

  // Cria a lista de IDs das UFs selecionadas
  sListaIdUFSel := GerarParamSELECT(rgUF, lstCodUF, lstUF);

  // Cria a lista de IDs dos Objetos selecionados
  sListaIdObjetoSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto);

  // Cria a lista de IDs das Sentenças selecionadas
  sListaIdSentencaSel := GerarParamSELECT(rgSentenca, lstCodSentenca, lstSentenca);

  // Cria a lista de IDs das Etapas selecionadas
  sListaIdEtapaSel := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa);

  // Cria a lista de IDs dos Estados selecionados
  sListaIdEstadoSel := GerarParamSELECT(rgEstado, lstCodEstado, lstEstado);

  // Cria a lista de IDs das Cidades selecionadas
  sListaIdCidadesSel := GerarParamSELECT(rgCidade, lstCodCidade, lstCidade);

  // Cria a lista de IDs dos Reclamantes selecionados
  sListaIdReclSel := GerarParamSELECT(rgRecl, lstCodRecl, lstRecl);

  with (sqlProcesso.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PT.*, RECLAMANTES.*, ENDRECLAMANTES.*, CI.IDESTADO, VJ.DESCRICAO AS NOMEVARA');
    Add('FROM');
    Add('  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ,');
    //------------------------------------------------------------------------------//
    // Reclamantes
    Add('  (SELECT');
    Add('     P.IDPESSOA, P.TIPO, P.NUMDOCUMENTO,');
    Add('     DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL) AS NOME');
    Add('   FROM');
    Add('     PESSOA P, PROCESSOTRAB PT');
    Add('   WHERE');
    Add('     (PT.INDMATERIA   > 3) AND');

    if (rgRecl.ItemIndex > 0) then
      Add('     (P.IDPESSOA     ' +sListaIdReclSel+ ') AND');

    if not(cbxJuridica.Checked) then
      Add('     (P.TIPO         <> ''J'') AND');

    if not(cbxFisica.Checked) then
      Add('     (P.TIPO         <> ''F'') AND');

    Add('     (PT.IDRECLAMANTE = P.IDPESSOA)');
    Add('  ) RECLAMANTES,');
    //------------------------------------------------------------------------------//
    // Endereço dos Reclamantes
    Add('  (SELECT');
    Add('     P.IDPESSOA, CI.NOME AS CIDADE, EP.LOGRADOURO, EP.CODESTADO,');
    Add('     EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, ES.NOMEESTADO');
    Add('   FROM');
    Add('     PESSOA P, ENDPESS EP, PROCESSOTRAB PT, CIDADES CI, ESTADO ES');
    Add('   WHERE');
    Add('     (PT.INDMATERIA   > 3) AND');

    if (rgRecl.ItemIndex > 0) then
      Add('     (P.IDPESSOA     ' +sListaIdReclSel+ ') AND');

    if not(cbxJuridica.Checked) then
      Add('     (P.TIPO         <> ''J'') AND');

    if not(cbxFisica.Checked) then
      Add('     (P.TIPO         <> ''F'') AND');

    if (rgEstado.ItemIndex > 0) then
      Add('     (ES.IDESTADO    ' +sListaIdEstadoSel+ ') AND');

    if (rgCidade.ItemIndex > 0) then
      Add('     (CI.IDCIDADES   ' +sListaIdCidadesSel+ ') AND');

    if (Round(StrToInt(ednCep1.Text)) > 0) then  // Faixa de CEP
      Add('     (TO_NUMBER(CEP)/1000 >= ' +ednCep1.Text+ ') AND');

    if (Round(StrToInt(ednCep2.Text)) < 99999) then // Faixa de CEP
      Add('     (TO_NUMBER(CEP)/1000 <= ' +ednCep2.Text+ ') AND');

    Add('     (PT.IDRECLAMANTE      = P.IDPESSOA) AND');
    Add('     (((P.TIPO             = ''F'') AND');
    Add('       (P.IDENDRESIDENCIAL = EP.IDENDERECO)) OR');
    Add('      ((P.TIPO             = ''J'') AND');
    Add('       (P.IDENDCOMERCIAL   = EP.IDENDERECO))) AND');
    Add('     (EP.IDCIDADES         = CI.IDCIDADES(+)) AND');
    Add('     (CI.IDESTADO          = ES.IDESTADO(+))');
    Add('  ) ENDRECLAMANTES');
    //------------------------------------------------------------------------------//
    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
    begin
      Add(', (SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ');
      Add('   FROM   OBJPROCTRAB');
      Add('   WHERE  (CODTIPOOBJETO ' +sListaIdObjetoSel+ ')');
      Add('   GROUP BY NUMPROCTRAB');
      Add('  ) OBJETOS');
    end;

    if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
    begin
      if (rgEtapa.ItemIndex = 1) then
      begin
        Add(', (SELECT');
        Add('     NUMPROCTRAB');
        Add('   FROM');
        Add('     ETAPAPROCTRAB');
        Add('   WHERE');
        Add('     (CODTIPORECURSO ' +sListaIdEtapaSel+ ') AND');
        Add('     (DATAREALOCOR = (SELECT MAX(DATAREALOCOR)');
        Add('                      FROM   ETAPAPROCTRAB E');
        Add('                      WHERE  (ETAPAPROCTRAB.NUMPROCTRAB = E.NUMPROCTRAB)');
        Add('                      GROUP BY NUMPROCTRAB)) AND');
        Add('     (DATAREALOCOR <= SYSDATE)');
        Add('   ) ETAPAS');
      end
      else
      begin
        Add(', (SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP');
        Add('   FROM   ETAPAPROCTRAB');
        Add('   WHERE  (CODTIPORECURSO ' +sListaIdEtapaSel+ ')');
        Add('   GROUP BY NUMPROCTRAB');
        Add('  ) ETAPAS');
      end;
    end;

    Add('WHERE');
    Add('  (PT.INDMATERIA > 3) AND');

    if (EdDataInc1.Text <> '') then
      Add('  (PT.TRGDTINCLUSAO >= TO_DATE(' +QuotedStr(EdDataInc1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataInc2.Text <> '') then
      Add('  (PT.TRGDTINCLUSAO <= TO_DATE(' +QuotedStr(EdDataInc2.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataAju1.Text <> '') then
      Add('  (PT.DATAJUIZO >= TO_DATE(' +QuotedStr(EdDataAju1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataAju2.Text <> '') then
      Add('  (PT.DATAJUIZO <= TO_DATE(' +QuotedStr(EdDataAju2.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataNot1.Text <> '') then
      Add('  (PT.DATANOTIF >= TO_DATE(' +QuotedStr(EdDataNot1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataNot2.Text <> '') then
      Add('  (PT.DATANOTIF <= TO_DATE(' +QuotedStr(EdDataNot2.Text)+ ',''DD/MM/YYYY'')) AND');

    if (rgSitProc.ItemIndex < 2) then
      Add('  (PT.FLGSITPROC = ' +IntToStr(rgSitProc.ItemIndex)+ ') AND');

    if (rgSitProc.ItemIndex > 0) and ((EdDataEnc1.Text <> '') or (EdDataEnc2.Text <> '')) then
    begin
      sSQL := '  (FLGSITPROC = 0 OR ';

      if (EdDataEnc1.Text <> '') then
      begin
        if (EdDataEnc2.Text <> '') then
          sSQL := sSQL + '(';
        sSQL := sSQL + '(PT.DATAEFETENC >= TO_DATE(' +QuotedStr(EdDataEnc1.Text)+ ',''DD/MM/YYYY''))';
      end;

      if (EdDataEnc2.Text <> '') then
      begin
        if (EdDataEnc1.Text <> '') then
          sSQL := sSQL + ' AND ';

        sSQL := sSQL + '(PT.DATAEFETENC <= TO_DATE(' +QuotedStr(EdDataEnc2.Text)+ ',''DD/MM/YYYY''))';

        if (EdDataEnc1.Text <> '') then
          sSQL := sSQL + ')';
      end;
      Add(sSQL+ ') AND');
    end;

    if (rgSitProc.ItemIndex > 0) then
    begin
      if not(cbxArquiv.Checked) then
        Add('  ((PT.FLGSITPROC = 0) OR (PT.TIPOENCER <> ''A'')) AND');
      if not(cbxAcordo.Checked) then
        Add('  ((PT.FLGSITPROC = 0) OR (PT.TIPOENCER <> ''C'')) AND');
      if not(cbxDesist.Checked) then
        Add('  ((PT.FLGSITPROC = 0) OR (PT.TIPOENCER <> ''D'')) AND');
      if not(cbxSent.Checked) then
        Add('  ((PT.FLGSITPROC = 0) OR (PT.TIPOENCER <> ''S'')) AND');
    end;

    if (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) then
      Add('  (PT.IDADVOGCASA ' +sListaIdAdvogCasaSel+ ') AND');

    if (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) then
      Add('  (PT.IDADVOGRECDA ' +sListaIdAdvog1Sel+ ') AND');

    if (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) then
      Add('  (PT.IDADVOGRECTE ' +sListaIdAdvog2Sel+ ') AND');

    if (rgAT.ItemIndex * lstAT.Items.Count > 0) then
      Add('  (PT.IDASSISTTECN ' +sListaIdATSel+ ') AND');

    if (rgVaraJust.ItemIndex * lstVaraJust.Items.Count > 0) then
      Add('  (PT.IDVARAJUSTICA ' +sListaIdVaraJusticaSel+ ') AND');

    if (rgUF.ItemIndex * lstUF.Items.Count > 0) then
      Add('  (CI.IDESTADO ' +sListaIdUFSel+ ') AND');

    if (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then
      Add('  (PT.IDTIPOPROC ' +sListaIdTipoProcSel+ ') AND');

    if (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) then
      Add('  (PT.IDTIPOACAO ' +sListaIdTipoAcaoSel+ ') AND');

    if (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) then
      Add('  ((PT.FLGSITPROC = 0) OR (PT.CODTIPOSENT ' +sListaIdSentencaSel+ ')) AND');

    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
    begin
      Add('  (PT.NUMPROCTRAB          = OBJETOS.NUMPROCTRAB(+)) AND');
      Add('  (NVL(OBJETOS.TOTALOBJ,0) > 0) AND');
    end;

    if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
    begin
      if (rgEtapa.ItemIndex = 1) then
        Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND')
      else
      begin
        Add('  (PT.NUMPROCTRAB         = ETAPAS.NUMPROCTRAB) AND');
        Add('  (NVL(ETAPAS.TOTALETP,0) > 0) AND');
      end;
    end;

    if (ednAdm1.Value > 0) then //Tempo de Existencia
    begin
      Add('  (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
      Add('   DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
      Add('   DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
      Add('   SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
      Add('   ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0) '+
        ' >= ' +IntToStr(ednAdm1.Value)+ ' AND');
    end;

    if (ednAdm2.Value < 999) then //Tempo de Existencia
    begin
      Add('  (TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
      Add('   DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
      Add('   DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
      Add('   SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
      Add('   ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0) '+
        ' <= ' +IntToStr(ednAdm2.Value)+ ' AND');
    end;

    case (rgInstancia.ItemIndex) of
      1 :
      begin
        Add('  (PT.PROCJCJNUM IS NOT NULL) AND');
        Add('  (PT.PROCTRTNUM IS NULL) AND');
        Add('  (PT.PROCTSTNUM IS NULL) AND');
      end;
      2 :
      begin
        Add('  (PT.PROCJCJNUM IS NOT NULL) AND');
        Add('  (PT.PROCTRTNUM IS NOT NULL) AND');
        Add('  (PT.PROCTSTNUM IS NULL) AND');
      end;
      3 :
      begin
        Add('  (PT.PROCJCJNUM IS NOT NULL) AND');
        Add('  (PT.PROCTRTNUM IS NOT NULL) AND');
        Add('  (PT.PROCTSTNUM IS NOT NULL) AND');
      end;
    end;

    case (rgParte.ItemIndex) of
      0 : Add('  (PT.FLGPARTEATIVA = 1) AND');
      1 : Add('  (PT.FLGPARTEATIVA = 0) AND');
    end;

    if (StrToFloat(ednNum1.Text) > 0) then
      Add('  (PT.NUMPROCTRAB >= ' +ednNum1.Text+ ') AND');

    if (ednNum2.Text <> '9999999999')  then
      Add('  (PT.NUMPROCTRAB <= ' +ednNum2.Text+ ') AND');

    if (StrToFloat(ednCus1.Text) > 0) then
      Add('  (PT.CUSTOPROC >= ' +ednCus1.Text+ ') AND');

    if  (ednCus2.Text <> '9999999999')  then
      Add('  (PT.CUSTOPROC <= ' +ednCus2.Text+ ') AND');

    Add('  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA) AND');
    Add('  (PT.IDRECLAMANTE  = ENDRECLAMANTES.IDPESSOA(+)) AND');
    Add('  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND');
    Add('  (PT.IDCIDADES     = CI.IDCIDADES(+))');
    Add('ORDER BY');
    Add('  '+ORDEM_DADOS[cmbSequencia.ItemIndex]);
  end;

  if (AbrirQueryPrincipal) then
  begin
    CdsProcesso.DisableControls;
    sqlProcesso.Open;
    CdsProcesso.EnableControls;
  end;

  if (IrPaginaResult) then
    ExecutarIrPaginaResult;

  ModalResult := mrOk;
  bSelOk := true;
end;

// -------------------------------------------------------------------------------------
// Funções do Form
// -------------------------------------------------------------------------------------

procedure TfrmSelProcessoMT.MudouEstado;
begin
  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0,
    GerarListaItens(rgUF, lstSiglaUF, lstUF));
end;

end.
