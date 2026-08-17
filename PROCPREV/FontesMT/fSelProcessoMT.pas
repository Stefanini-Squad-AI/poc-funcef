unit fSelProcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  fCustomSelProcesso, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, wwdbdatetimepicker, DBClient,
  CMDateTimePicker, CmParamReport, uCmSqlParams, uCMClientDataSet, uCtrlGlobalRH, uCtrlTipProc,
  uCtrlListTerceirosRH, uCtrlPessoaFilialPessoa, uCtrlTipAcao, uCtrlTipObjeto, uCtrlTipSent,
  uCtrlTipRec, uCtrlVaraJustica, uCtrlProfiss, uCtrlGrInstr, uCtrlPessoaSindicato;

type
  TfrmSelProcessoMT = class(TfrmCustomSelProcesso)
    pgctrlPrincipal: TPageControl;
    tbshGeral: TTabSheet;
    tbshAdv: TTabSheet;
    rgAdv2: TRadioGroup;
    rgAT: TRadioGroup;
    gbxAdv2: TGroupBox;
    dblcAdv2: TwwDBLookupCombo;
    lstAdv2: TListBox;
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
    rgInstancia: TRadioGroup;
    gbxEtapa: TGroupBox;
    dblcEtapa: TwwDBLookupCombo;
    lstEtapa: TListBox;
    lstCodEtapa: TListBox;
    rgSentenca: TRadioGroup;
    gbxSentenca: TGroupBox;
    dblcSentenca: TwwDBLookupCombo;
    lstSentenca: TListBox;
    lstCodSentenca: TListBox;
    tbshContraParte: TTabSheet;
    pgctrlContraParte: TPageControl;
    tsDadosFunc: TTabSheet;
    tsDadosPess: TTabSheet;
    tsDadosOutros: TTabSheet;
    gbxIdade: TGroupBox;
    Label10: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxSexo: TGroupBox;
    cbxFeminino: TCheckBox;
    cbxMasculino: TCheckBox;
    gbxProfis: TGroupBox;
    dblcProfis: TwwDBLookupCombo;
    gbxGrauInstr: TGroupBox;
    dblcGrauInstr: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    gbxCep: TGroupBox;
    Label11: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    gbxAniv: TGroupBox;
    cbxAniv: TComboBox;
    GroupBox3: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    rgSinIR: TRadioGroup;
    gbxEstCivil: TGroupBox;
    cbxSolt: TCheckBox;
    cbxCas: TCheckBox;
    cbxSep: TCheckBox;
    cbxViu: TCheckBox;
    cbxOutr: TCheckBox;
    cbxSepJud: TCheckBox;
    cbxDes: TCheckBox;
    pnlSelCargo: TPanel;
    rgEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    dblcEstab: TwwDBLookupCombo;
    lstEstab: TListBox;
    rgSindic: TRadioGroup;
    gbxSindic: TGroupBox;
    dblcSindic: TwwDBLookupCombo;
    lstSindic: TListBox;
    lstCodSindic: TListBox;
    rgCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    dblcCargo: TwwDBLookupCombo;
    lstCargo: TListBox;
    lstCodCargo: TListBox;
    lstCodEstab: TListBox;
    gbxLotacao: TGroupBox;
    dblcLotacao: TwwDBLookupCombo;
    rgSelCargoLot: TRadioGroup;
    pnlSelDadosFunc: TPanel;
    gbxSitPlano: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxCancelados: TCheckBox;
    cbxAssistidos: TCheckBox;
    cbxMantidos: TCheckBox;
    cbxMantidoParc: TCheckBox;
    cbxManutSaldo: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label9: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgPlano: TRadioGroup;
    gbxPlano: TGroupBox;
    dblcPlano: TwwDBLookupCombo;
    lstPlano: TListBox;
    lstCodPlano: TListBox;
    rgPatro: TRadioGroup;
    gbxPatro: TGroupBox;
    dblcPatro: TwwDBLookupCombo;
    lstPatro: TListBox;
    lstCodPatro: TListBox;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    rgSelDadosFunc: TRadioGroup;
    rgEtapa: TRadioGroup;
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
    tbsCidadesUF: TTabSheet;
    rgUF: TRadioGroup;
    gbxUF: TGroupBox;
    dblcUF: TwwDBLookupCombo;
    lstUF: TListBox;
    lstCodUF: TListBox;
    rgCidade: TRadioGroup;
    gbxCidade: TGroupBox;
    dblcCidade: TwwDBLookupCombo;
    lstCidade: TListBox;
    lstCodCidade: TListBox;
    cbxCidadeNegativa: TCheckBox;
    dsProcesso: TwwDataSource;
    CdsProcesso: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    CdsAdvog2: TCMClientDataSet;
    CdsAdvog1: TCMClientDataSet;
    CdsAdvogCasa: TCMClientDataSet;
    CdsVaraJustica: TCMClientDataSet;
    CdsAT: TCMClientDataSet;
    CdsUF: TCMClientDataSet;
    CdsTipoProc: TCMClientDataSet;
    CdsTipoAcao: TCMClientDataSet;
    CdsObjeto: TCMClientDataSet;
    CdsCidade: TCMClientDataSet;
    CdsEtapa: TCMClientDataSet;
    CdsSentenca: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsPlano: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsProfis: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    CdsSindic: TCMClientDataSet;
    CdsLotacao: TCMClientDataSet;
    lstSiglaUF: TListBox;
    dblcVaraJust: TwwDBLookupCombo;
    lstVaraJust: TListBox;
    lstCodVaraJust: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
      modified: Boolean);
    procedure EdnNum1Change(Sender: TObject);
    procedure EdnNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rgSelCargoLotClick(Sender: TObject);
    procedure rgSelDadosFuncClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTipoProcClick(Sender: TObject);
  private
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlTipProc: TCtrlTipProc;
    CtrlTipAcao: TCtrlTipAcao;
    CtrlTipObjeto: TCtrlTipObjeto;
    CtrlTipSent: TCtrlTipSent;
    CtrlTipRec: TCtrlTipRec;
    CtrlVaraJustica: TCtrlVaraJustica;
    CtrlProfiss: TCtrlProfiss;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;

    procedure MudouEstado;
  end;

var
  frmSelProcessoMT: TfrmSelProcessoMT;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlFuncoesRH, uCtrlUsoGeralRH;

const
  ORDEM_DADOS: array[0..9] of string = (
    'UPPER(P.NOME)',
    'RECLAMANTES.INSCRICAONUMERO',
    'RECLAMANTES.IDPESSJUR, UPPER(P.NOME)',
    'RECLAMANTES.IDPESSJUR, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDPLANOPREV, UPPER(P.NOME)',
    'RECLAMANTES.IDPLANOPREV, RECLAMANTES.INSCRICAONUMERO',
    'RECLAMANTES.IDPESSJUR, RECLAMANTES.IDPLANOPREV, UPPER(P.NOME)',
    'RECLAMANTES.IDPESSJUR, RECLAMANTES.IDPLANOPREV, RECLAMANTES.INSCRICAONUMERO',
    'RECLAMANTES.IDPLANOPREV, RECLAMANTES.IDPESSJUR, UPPER(P.NOME)',
    'RECLAMANTES.IDPLANOPREV, RECLAMANTES.IDPESSJUR, RECLAMANTES.MATRICULA');

{$R *.DFM}

procedure TfrmSelProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

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

  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

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
  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0, '', '');
  CdsProfis.Data := CtrlProfiss.ListProfissao;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa), '', true);

  rgSelDadosFunc.ItemIndex := 1;
  rgSelDadosFuncClick(Self);

  dblcLotacao.SelText := '**********';
  cbxAniv.ItemIndex := 0;
  cmbSequencia.ItemIndex := 0;
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlContraParte.ActivePageIndex := 0;
end;

procedure TfrmSelProcessoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlTipProc);
  FreeAndNil(CtrlTipAcao);
  FreeAndNil(CtrlTipObjeto);
  FreeAndNil(CtrlTipSent);
  FreeAndNil(CtrlTipRec);
  FreeAndNil(CtrlVaraJustica);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlProfiss);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlGrInstr);
  inherited;
end;

procedure TfrmSelProcessoMT.dblcLotacaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (modified) and not(CdsLotacao.IsEmpty) then
    (Sender as TwwDBLookupCombo).Text := CdsLotacao.FieldByName('CODCENTROCUSTO').asString;
end;

procedure TfrmSelProcessoMT.dblcTipoProcCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
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
  if (Sender = dblcCidade) then
    InserirLista(Modified, lstCodCidade, lstCidade, CdsCidade, 'IDCIDADES', 'NOME')
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
  if (Sender = dblcPlano) then
    InserirLista(Modified, lstCodPlano, lstPlano, CdsPlano, 'IDPLANOPREV', 'NOME')
  else
  if (Sender = dblcPatro) then
    InserirLista(Modified, lstCodPatro, lstPatro, CdsPatro, 'IDPESSOA', 'NOME')
  else
  if (Sender = dblcCargo) then
    InserirLista(Modified, lstCodCargo, lstCargo, CdsCargo, 'IDCARGOEXT', 'TITULO')
  else
  if (Sender = dblcEstab) then
    InserirLista(Modified, lstCodEstab, lstEstab, CdsEstab, 'IDPESSOA', 'NOME')
  else
  if (Sender = dblcSindic) then
    InserirLista(Modified, lstCodSindic, lstSindic, CdsSindic, 'IDPESSOA', 'NOME');
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
  if (Sender = lstCidade) then
    ApagarLista(Key, lstCodCidade, lstCidade)
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
  if (Sender = lstPlano) then
    ApagarLista(Key, lstCodPlano, lstPlano)
  else
  if (Sender = lstPatro) then
    ApagarLista(Key, lstCodPatro, lstPatro)
  else
  if (Sender = lstCargo) then
    ApagarLista(Key, lstCodCargo, lstCargo)
  else
  if (Sender = lstEstab) then
    ApagarLista(Key, lstCodEstab, lstEstab)
  else
  if (Sender = lstSindic) then
    ApagarLista(Key, lstCodSindic, lstSindic);
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
  try
    if (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) then
      ednNum1.Text := ednNum2.Text;
  except
  end;
end;

procedure TfrmSelProcessoMT.EdnNum2Change(Sender: TObject);
begin
  try
    if (StrToFloat(ednNum1.Text) > StrToFloat(ednNum2.Text)) then
      ednNum2.Text := ednNum1.Text;
  except
  end;
end;

procedure TfrmSelProcessoMT.ednCus1Change(Sender: TObject);
begin
  try
    if (StrToFloat(ednCus1.Text) > StrToFloat(ednCus2.Text)) then
      ednCus1.Text := ednCus2.Text;
  except
  end;
end;

procedure TfrmSelProcessoMT.ednCus2Change(Sender: TObject);
begin
  try
    if (StrToFloat(ednCus2.Text) < StrToFloat(ednCus1.Text)) then
      ednCus2.Text := ednCus1.Text;
  except
  end;
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
  if (Sender = rgCidade) then
    HabilitarLista(rgCidade, gbxCidade, CdsCidade)
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
  if (Sender = rgPlano) then
  begin
    if (rgPlano.ItemIndex = 1) and not(CdsPlano.Active) then
      CdsPlano.Data := CtrlListTerceirosRH.ListPlanoPrev;
    HabilitarLista(rgPlano, gbxPlano, CdsPlano);
  end
  else
  if (Sender = rgPatro) then
  begin
    if (rgPatro.ItemIndex = 1) and not(CdsPatro.Active) then
      CdsPatro.Data := CtrlListTerceirosRH.ListPatrocinadora;
    HabilitarLista(rgPatro, gbxPatro, CdsPatro);
  end
  else
  if (Sender = rgCargo) then
  begin
    if (rgCargo.ItemIndex = 1) and not(CdsCargo.Active) then
      CdsCargo.Data := CtrlListTerceirosRH.ListCargoEx;
    HabilitarLista(rgCargo, gbxCargo, CdsCargo);
  end
  else
  if (Sender = rgEstab) then
  begin
    if (rgEstab.ItemIndex = 1) and not(CdsEstab.Active) then
      CdsEstab.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa);
    HabilitarLista(rgEstab, gbxEstab, CdsEstab);
  end
  else
  if (Sender = rgSindic) then
  begin
    if (rgSindic.ItemIndex = 1) and not(CdsSindic.Active) then
      CdsSindic.Data := CtrlPessoaSindicato.ListPessoaSindicato;
    HabilitarLista(rgSindic, gbxSindic, CdsSindic);
  end;
end;

procedure TfrmSelProcessoMT.rgSelCargoLotClick(Sender: TObject);
begin
  pnlSelCargo.Visible := (rgSelCargoLot.ItemIndex = 0);
end;

procedure TfrmSelProcessoMT.rgSelDadosFuncClick(Sender: TObject);
begin
  pnlSelDadosFunc.Visible := (rgSelDadosFunc.ItemIndex = 0);
  rgSelCargoLot.Enabled := (rgSelDadosFunc.ItemIndex = 0);
  if (rgSelDadosFunc.ItemIndex = 1) then
  begin
    rgSelCargoLot.ItemIndex := 1;
    pnlSelCargo.Visible := false;
  end;
end;

procedure TfrmSelProcessoMT.rgSitProcClick(Sender: TObject);
begin
  gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
  gbxDataEnc.Visible := (rgSitProc.ItemIndex > 0);
  rgSentenca.Visible := (rgSitProc.ItemIndex > 0);
  gbxSentenca.Visible := (rgSitProc.ItemIndex > 0);
end;

procedure TfrmSelProcessoMT.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdTipoProcSel, sListaIdTipoAcaoSel, sListaIdAdvog1Sel, sListaIdAdvogCasaSel,
  sListaIdAdvog2Sel, sListaIdATSel, sListaIdVaraJusticaSel, sListaIdUFSel,
  sListaIdCidadesSel, sListaIdObjetoSel, sListaIdSentencaSel, sListaIdEtapaSel,
  sListaIdPlanoSel, sListaIdPatroSel, sListaIdCargoSel, sListaIdEstabSel,
  sListaIdSindicSel: string;
  bMarcouFuncionario, bMarcouParticipante: boolean;
  i: integer;
begin
  bMarcouFuncionario := (cbxAtivos.Checked) or (cbxAfastados.Checked) or
                        (cbxDemitidos.Checked);
  bMarcouParticipante := (cbxEfetivos.Checked) or (cbxAssistidos.Checked) or
                        (cbxCancelados.Checked);

  if not(bMarcouParticipante) then
  begin
    MsgDlg('Assinale ao menos um Tipo de Situação na Fundação',
            'Aviso', mtInformation, [mbOk,mbHelp], 0);
    pgctrlPrincipal.ActivePage := tsDadosFunc;
    gbxSitPlano.SetFocus;
    exit;
  end;

  if not(bMarcouFuncionario) then
  begin
    MsgDlg('Assinale ao menos um Tipo de Situação na Patrocinadora',
            'Aviso', mtInformation, [mbOk,mbHelp], 0);
    pgctrlPrincipal.ActivePage := tsDadosFunc;
    gbxSituacao.SetFocus;
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

  // Cria a lista de IDs dos Advogados da Contraparte selecionados
  sListaIdAdvog2Sel := GerarParamSELECT(rgAdv2, lstCodAdv2, lstAdv2);

  // Cria a lista de IDs dos Assistentes Técnicos selecionados
  sListaIdATSel := GerarParamSELECT(rgAT, lstCodAT, lstAT);

  // Cria a lista de IDs das Varas de Justiça selecionadas
  sListaIdVaraJusticaSel := GerarParamSELECT(rgVaraJust, lstCodVaraJust, lstVaraJust);

  // Cria a lista de IDs das UFs selecionadas
  sListaIdUFSel := GerarParamSELECT(rgUF, lstCodUF, lstUF);

  // Cria a lista de IDs das Cidades selecionadas
  sListaIdCidadesSel := GerarParamSELECT(rgCidade, lstCodCidade, lstCidade);

  // Cria a lista de IDs dos Objetos selecionados
  sListaIdObjetoSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto);

  // Cria a lista de IDs das Sentenças selecionadas
  sListaIdSentencaSel := GerarParamSELECT(rgSentenca, lstCodSentenca, lstSentenca);

  // Cria a lista de IDs das Etapas selecionadas
  sListaIdEtapaSel := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa);

  // Cria a lista de IDs dos Planos selecionados
  sListaIdPlanoSel := GerarParamSELECT(rgPlano, lstCodPlano, lstPlano);

  // Cria a lista de IDs das Patrocinadoras selecionadas
  sListaIdPatroSel := GerarParamSELECT(rgPatro, lstCodPatro, lstPatro);

  // Cria a lista de IDs dos Cargos selecionados (Previdência)
  sListaIdCargoSel := GerarParamSELECT(rgCargo, lstCodCargo, lstCargo);

  // Cria a lista de IDs dos Estabelecimentos selecionados
  sListaIdEstabSel := GerarParamSELECT(rgEstab, lstCodEstab, lstEstab);

  // Cria a lista de IDs dos Estabelecimentos selecionados
  sListaIdSindicSel := GerarParamSELECT(rgSindic, lstCodSindic, lstSindic);

  with (sqlProcesso.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  P.NOME, PT.*, RECLAMANTES.*, CI.IDESTADO, VJ.DESCRICAO AS NOMEVARA');
    Add('FROM');
    Add('  PESSOA P, PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ,');
    //--------------------------------------------------------------------------
    Add('  (SELECT DISTINCT');
    Add('     P.TIPO, P.NUMDOCUMENTO, P.IDPESSOA, PF.IDSINDICATO,');
    Add('     PF.IDFONTRECR, PF.IDGRINSTR, PF.IDPROFISS,');
    Add('     PF.DATANASC, PF.SEXO, PF.ESTCIVIL, PF.NUMDEPIRRF, PF.NUMDEPSALF,');
    Add('     PF.NUMDEPTOT, PF.FLGISENTOIRRF, PF.CORPESSOA, PF.FLGDEFICIENTE,');
    Add('     CI.NOME AS CIDADE, E.LOGRADOURO, E.CODESTADO, E.NUMERO,');
    Add('     E.COMPLEMENTO, E.BAIRRO, E.CEP,');

    if (rgSelDadosFunc.ItemIndex = 0) then
    begin
      Add('     EP.IDPESSJUR, EP.IDPESSJURORGAO, EP.SIGLA, EP.IDCARGOEXT,');
      Add('     EP.IDESTAB, EP.IDSITFUNC, EP.MATRICULA, EP.DATAADMISSAO,');
      Add('     EP.SALTOTAL, EP.PARTICIPPREVID, EP.PARTICIPASSIST,');
      Add('     EP.IDEMPRESAPROP, EP.NIVEL, EP.DATAINICIOAFAST,');
      Add('     EP.DATAFIMAFAST, EP.DATADEMISSAO, EP.TEMPOSERVANTERIOR,');
      Add('     EP.TEMPONAOCREDITADO, EP.TEMPOSERVANTREAL, EP.TEMPOSITESPECIAL,');
      Add('     EP.VALORBASE1, EP.VALORBASE2, EP.VALORBASE3, EP.TEMPOSERVTOTAL,');
      Add('     EP.TEMPOSERVPUBLANT, EP.TEMPOINSSAFAST, EP.TEMPOSERVPRIVANT,');
      Add('     EP.FLGDIRETOR, EP.CODCENTROCUSTO, ST.DESCRICAO, ST.TIPOSIT,');
      Add('     ST.FLGINTERNO, ST.CODCAGED, ST.CODMOVFGTS, ST.FLGUSO,');
      Add('     PP.IDPLANOPREV, PP.INSCRICAONUMERO, PP.INSCRICAODATA');
    end
    else
      Add('     ('' '') AS DATADEMISSAO, ('' '') AS DATAADMISSAO, 0 AS IDPESSJUR');

    Add('   FROM');
    Add('     PESSOA P, PESSOAFISICA PF, ENDPESS E, CIDADES CI, PROCESSOTRAB PT');

    if (rgSelDadosFunc.ItemIndex = 0) then
      Add('     ,ELEGPATRO EP, SITFUNC ST, SITPART SP, PARTPREVPLAN PP');

    Add('   WHERE');
    Add('     (PT.INDMATERIA     IN (2,3)) AND');
    Add('     (PT.IDRECLAMANTE    = P.IDPESSOA) AND');
    Add('     (P.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND');
    Add('     (E.IDCIDADES        = CI.IDCIDADES(+)) AND');
    Add('     (P.IDPESSOA         = PF.IDPESSOA(+)) AND');

    if (rgSelDadosFunc.ItemIndex = 0) then
    begin
      Add('     (EP.IDPESSOA        = P.IDPESSOA) AND');
      Add('     (EP.IDPESSJUR       = PP.IDPESSJUR) AND');
      Add('     (PP.IDPESSOA        = P.IDPESSOA) AND');
      Add('     (EP.IDSITFUNC       = ST.IDSITFUNC(+)) AND');
      Add('     (PP.IDSITPART       = SP.IDSITPART(+)) AND');

      if (not cbxAtivos.Checked) then
        Add('     (ST.TIPOSIT <> ''A'') AND');
      if (not cbxAfastados.Checked) then
        Add('     (ST.TIPOSIT <> ''F'') AND');
      if (not cbxDemitidos.Checked) then
        Add('     (ST.TIPOSIT <> ''D'') AND');
      if (not cbxEfetivos.Checked) then
        Add('     (SP.FLGINTERNO <> ''AT'') AND');
      if (not cbxMantidos.Checked) then
        Add('     (SP.FLGINTERNO <> ''MA'') AND');
      if (not cbxMantidoParc.Checked) then
        Add('     (SP.FLGINTERNO <> ''MP'') AND');
      if (not cbxAssistidos.Checked) then
        Add('     (SP.FLGINTERNO <> ''AS'') AND');
      if (not cbxManutSaldo.Checked) then
        Add('     (SP.FLGINTERNO <> ''MS'') AND');
      if (not cbxCancelados.Checked) then
        Add('     (SP.FLGINTERNO <> ''CA'') AND');
    end;

    if (rgSelCargoLot.ItemIndex = 0) and (rgEstab.ItemIndex > 0) then
      Add('     (EP.IDESTAB ' +sListaIdEstabSel+ ') AND');

    if (rgSelDadosFunc.ItemIndex = 0) and (rgPlano.ItemIndex > 0) then
      Add('     (PP.IDPLANOPREV ' +sListaIdPlanoSel+ ') AND');

    if (rgSelDadosFunc.ItemIndex = 0) and (rgPatro.ItemIndex > 0) then
      Add('     (PP.IDPESSJUR ' +sListaIdPatroSel+ ') AND');

    if (rgSelCargoLot.ItemIndex = 0) and (dblcLotacao.Text <> '**********') then
    begin
      if (Pos('*',dblcLotacao.Text) > 0) then
      begin
        for I:=1 to length(trim(dblcLotacao.Text)) do
          if (copy(dblcLotacao.Text, I, 1) <> '*') then
            Add('     (SUBSTR(EP.CODCENTROCUSTO, ' +IntToStr(I)+ ' , 1) = ' +
              QuotedStr(Copy(dblcLotacao.Text,I,1))+ ') AND');
      end
      else
        Add('     (EP.CODCENTROCUSTO, = ' +QuotedStr(dblcLotacao.Text)+ ') AND');
    end;

    if (rgSelDadosFunc.ItemIndex = 0) then
    begin
      if (ednAdm1.Value > 0) then //Tempo de Casa
      begin
        Add('     (TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),7,10)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),4,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),4,2)) +');
        Add('      DECODE((TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2))) /');
        Add('      DECODE(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2),');
        Add('      SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2),1,');
        Add('      ABS(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
            ' >= ' + IntToStr(ednAdm1.Value) + ' AND');
      end;

      if (ednAdm2.Value < 999) then //Tempo de Casa
      begin
        Add('     (TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),7,10)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),4,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),4,2)) +');
        Add('      DECODE((TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2))) /');
        Add('      DECODE(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2),');
        Add('      SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2),1,');
        Add('      ABS(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
            ' <= ' + IntToStr(ednAdm2.Value) + ' AND');
      end;

      if (ednCar1.Value > 0) then //Tempo na Fundação
      begin
        Add('     (TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),7,10)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),4,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),4,2)) +');
        Add('      DECODE((TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),1,2))) /');
        Add('      DECODE(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2),');
        Add('      SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),1,2),1,');
        Add('      ABS(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
            ' >= ' + IntToStr(ednCar1.Value) + ' AND');
      end;

      if (ednCar2.Value < 999) then //Tempo na Fundação
      begin
        Add('     (TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),7,10)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),4,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),4,2)) +');
        Add('      DECODE((TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),1,2))) /');
        Add('      DECODE(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2),');
        Add('      SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),1,2),1,');
        Add('      ABS(TO_NUMBER(SUBSTR(TO_CHAR(SYSDATE,''DD/MM/YYYY''),1,2)) -');
        Add('      TO_NUMBER(SUBSTR(TO_CHAR(INSCRICAODATA,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
            ' <= ' + IntToStr(ednCar2.Value) + ' AND');
      end;

      if (StrToInt(ednSal1.Text) > 0) then // Faixa de Salário Particip.
        Add('     (SALPARTICIPACAO >= ' +(ednSal1.Text)+ ') AND');

      if (StrToInt(ednSal2.Text) <> 999999999) then // Faixa de Salário Participação
        Add('     (SALPARTICIPACAO <= ' +(ednSal2.Text)+ ') AND');
    end;

    if (not cbxFeminino.Checked) then
      Add('     (PF.SEXO <> ''F'') AND');
    if (not cbxMasculino.Checked) then
      Add('     (PF.SEXO <> ''M'') AND');
    if (not cbxSolt.Checked) then
      Add('     (PF.ESTCIVIL <> ''S'') AND');
    if (not cbxCas.Checked) then
      Add('     (PF.ESTCIVIL <> ''C'') AND');
    if (not cbxSep.Checked) then
      Add('     (PF.ESTCIVIL <> ''D'') AND');
    if (not cbxSepJud.Checked) then
      Add('     (PF.ESTCIVIL <> ''J'') AND');
    if (not cbxDes.Checked) then
      Add('     (PF.ESTCIVIL <> ''E'') AND');
    if (not cbxViu.Checked) then
      Add('     (PF.ESTCIVIL <> ''V'') AND');
    if (not cbxOutr.Checked) then
      Add('     (PF.ESTCIVIL <> ''O'') AND');

    if (rgSelCargoLot.ItemIndex = 0) and (rgCargo.ItemIndex > 0) then
      Add('     (IDCARGOEXT ' +sListaIdCargoSel+ ') AND');

    if (rgSelCargoLot.ItemIndex = 0) and (rgSindic.ItemIndex > 0) then
      Add('     (IDSINDICATO ' +sListaIdSindicSel+ ') AND');

    if (ednIda1.Value > 0) then  //Faixa Etária
      Add('     ((SYSDATE - DATANASC)/365.25 >= ' +IntToStr(ednIda1.Value)+ ') AND');
    if (ednIda2.Value < 99) then  //Faixa Etária
      Add('     ((SYSDATE - DATANASC)/365.25 <= ' +IntToStr(ednIda2.Value)+ ') AND');

    if (cbxAniv.ItemIndex > 0) then // Mês do Aniversário
      Add('     (TO_NUMBER(SUBSTR(TO_CHAR(DATANASC,''DD/MM/YYYY''),4,2)) = '+
          IntToStr(cbxAniv.ItemIndex) + ') AND');

    if (round(StrToInt(ednCep1.Text)) > 0) then //Faixa de CEP
      Add('     (TO_NUMBER(CEP)/1000 >= ' +ednCep1.Text+ ') AND');
    if (round(StrToInt(ednCep2.Text)) < 99999) then //Faixa de CEP
      Add('     (TO_NUMBER(CEP)/1000 <= ' +ednCep2.Text+ ') AND');

    if (Trim(dblcGrauInstr.Text) <> '') then
    begin
      case (rgSinal.ItemIndex) of //Grau de Instrução
        0 : Add('     (IDGRINSTR <= ' +dblcGrauInstr.LookupValue+ ') AND');
        1 : Add('     (IDGRINSTR  = ' +dblcGrauInstr.LookupValue+ ') AND');
        2 : Add('     (IDGRINSTR >= ' +dblcGrauInstr.LookupValue+ ') AND');
      end;
    end;

    if (Trim(dblcProfis.Text) <> '') then
      Add('     (IDPROFISS = ' +dblcProfis.LookupValue+ ') AND');

    if (rgSinTot.ItemIndex < 2) or (speDepTot.Value > 0) then // Total Benef. ??????
    begin
      case (rgSinTot.ItemIndex) of
        0 : Add('     (NUMDEPTOT <= ' +IntToStr(speDepTot.Value)+ ') AND');
        1 : Add('     (NUMDEPTOT  = ' +IntToStr(speDepTot.Value)+ ') AND');
        2 : Add('     (NUMDEPTOT >= ' +IntToStr(speDepTot.Value)+ ') AND');
      end;
    end;

    if (rgSinIR.ItemIndex < 2) or (speDepIR.Value > 0) then // Dependentes IRRF
    begin
      case (rgSinIR.ItemIndex) of
        0 : Add('     (NUMDEPIRRF <= ' +IntToStr(speDepIR.Value)+ ') AND');
        1 : Add('     (NUMDEPIRRF  = ' +  IntToStr(speDepIR.Value) + ') AND');
        2 : Add('     (NUMDEPIRRF >= ' +  IntToStr(speDepIR.Value) + ') AND');
      end;
    end;

    sSQL := sqlProcesso.SQL[Count-1];
    if (UpperCase(Copy(sSQL, Length(sSQL)-2, 3)) = 'AND') then
    begin
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);
      sqlProcesso.SQL[Count-1] := sSQL;
    end;

    Add('  ) RECLAMANTES');
    //--------------------------------------------------------------------------

    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
    begin
      Add('     ,(SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ');
      Add('       FROM   OBJPROCTRAB');
      Add('       WHERE  (CODTIPOOBJETO ' +sListaIdObjetoSel+ ')');
      Add('       GROUP BY NUMPROCTRAB) OBJETOS');
    end;

    if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
    begin
      if (rgEtapa.ItemIndex = 1) then
      begin
        Add('     ,(SELECT NUMPROCTRAB');
        Add('       FROM   ETAPAPROCTRAB');
        Add('       WHERE  (CODTIPORECURSO ' +sListaIdEtapaSel+ ') AND');
        Add('              (DATAREALOCOR  <= SYSDATE) AND');
        Add('              (DATAREALOCOR   = (SELECT MAX(DATAREALOCOR)');
        Add('                                 FROM   ETAPAPROCTRAB E');
        Add('                                 WHERE  (E.NUMPROCTRAB = ETAPAPROCTRAB.NUMPROCTRAB)');
        Add('                                 GROUP BY NUMPROCTRAB))) ETAPAS');
      end
      else
      begin
        Add('     ,(SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP');
        Add('       FROM   ETAPAPROCTRAB');
        Add('       WHERE  (CODTIPORECURSO ' +sListaIdEtapaSel+ ')');
        Add('       GROUP BY NUMPROCTRAB) ETAPAS');
      end;
    end;

    Add('WHERE');
    Add('  (PT.INDMATERIA   IN (2,3)) AND');
    Add('  (PT.IDRECLAMANTE  = P.IDPESSOA) AND');
    Add('  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA(+)) AND');
    Add('  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND');
    Add('  (PT.IDCIDADES     = CI.IDCIDADES(+)) AND');

    if (EdDataInc1.Text <> '') then
      Add('  (PT.TRGDTINCLUSAO >= TO_DATE(' +QuotedStr(EdDataInc1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataInc2.Text <> '') then
      Add('  (TO_DATE(TO_CHAR(PT.TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') <= TO_DATE(' +
        QuotedStr(EdDataInc2.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataAju1.Text <> '') then
      Add('  (PT.DATAJUIZO >= TO_DATE(' +QuotedStr(EdDataAju1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataAju2.Text <> '') then
      Add('  (PT.DATAJUIZO <= TO_DATE(' +QuotedStr(EdDataAju2.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataNot1.Text <> '') then
      Add('  (PT.DATANOTIF >= TO_DATE(' +QuotedStr(EdDataNot1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataNot2.Text <> '') then
      Add('  (PT.DATANOTIF <= TO_DATE(' +QuotedStr(EdDataNot2.Text)+ ',''DD/MM/YYYY'')) AND');

    if (rgSitProc.ItemIndex < 2)  then
      Add('  (FLGSITPROC = ' +IntToStr(rgSitProc.ItemIndex)+ ') AND');

    if (rgSitProc.ItemIndex > 0) and ((EdDataEnc1.Text <> '') or (EdDataEnc2.Text <> '')) then
    begin
      sSQL := '  (FLGSITPROC = 0 OR ';

      if (EdDataEnc1.Text <> '') then
      begin
        if (EdDataEnc2.Text <> '') then
          sSQL := sSQL + '(';

        sSQL := sSQL + '(PT.DATAEFETENC >= TO_DATE(''' +
          EdDataEnc1.Text+ ''',''DD/MM/YYYY''))';
      end;

      if (EdDataEnc2.Text <> '') then
      begin
        if (EdDataEnc1.Text <> '') then
          sSQL := sSQL + ' AND ';

        sSQL := sSQL + '(PT.DATAEFETENC <= TO_DATE(''' +
          EdDataEnc2.Text+ ''',''DD/MM/YYYY''))';

        if (EdDataEnc1.Text <> '') then
          sSQL := sSQL + ')';
      end;

      Add(sSQL+ ') AND');
    end;

    if (rgSitProc.ItemIndex > 0) then
    begin
      if not(cbxArquiv.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''A'') AND');
      if not(cbxAcordo.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''C'') AND');
      if not(cbxDesist.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''D'') AND');
      if not(cbxSent.Checked) then
        Add('  (FLGSITPROC = 0 or TIPOENCER <> ''S'') AND');
    end;

    if (rgAdvC.ItemIndex * lstAdvC.Items.Count > 0) then
      Add('  (IDADVOGCASA ' +sListaIdAdvogCasaSel+ ') AND');

    if (rgAdv1.ItemIndex * lstAdv1.Items.Count > 0) then
      Add('  (IDADVOGRECDA ' +sListaIdAdvog1Sel+ ') AND');

    if (rgAdv2.ItemIndex * lstAdv2.Items.Count > 0) then
      Add('  (IDADVOGRECTE ' +sListaIdAdvog2Sel+ ') AND');

    if (rgAT.ItemIndex * lstAT.Items.Count > 0) then
      Add('  (IDASSISTTECN ' +sListaIdATSel+ ') AND');

    if (rgVaraJust.ItemIndex * lstVaraJust.Items.Count > 0) then
      Add('  (PT.IDVARAJUSTICA ' +sListaIdVaraJusticaSel+ ') AND');

    if (rgUF.ItemIndex * lstUF.Items.Count > 0) then
      Add('  (CI.IDESTADO ' +sListaIdUFSel+ ') AND');

    if  (rgCidade.ItemIndex * lstCidade.Items.Count > 0)  then
      Add('  (PT.IDCIDADES ' +
        FU.IFF(cbxCidadeNegativa.Checked,
          FU.IFF(pos(',',sListaIdCidadesSel) > 0, 'NOT '+sListaIdCidadesSel,'<> '+copy(sListaIdCidadesSel,3,length(sListaIdCidadesSel)-2)),
          sListaIdCidadesSel) + ') AND');

    if (rgTipoProc.ItemIndex * lstTipoProc.Items.Count > 0) then
      Add('  (IDTIPOPROC ' +sListaIdTipoProcSel+ ') AND');

    if (rgTipoAcao.ItemIndex * lstTipoAcao.Items.Count > 0) then
      Add('  (IDTIPOACAO ' +sListaIdTipoAcaoSel+ ') AND');

    if (rgSentenca.ItemIndex * lstSentenca.Items.Count > 0) then
      Add('  ((FLGSITPROC = 0) OR (CODTIPOSENT ' +sListaIdSentencaSel+ ')) AND');

    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
    begin
      Add('  (NVL(OBJETOS.TOTALOBJ,0) > 0) AND');
      Add('  (PT.NUMPROCTRAB = OBJETOS.NUMPROCTRAB(+)) AND');
    end;

    if (rgEtapa.ItemIndex * lstEtapa.Items.Count > 0) then
      if (rgEtapa.ItemIndex = 1) then
        Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND')
      else
      begin
        Add('  (PT.NUMPROCTRAB = ETAPAS.NUMPROCTRAB) AND');
        Add('  (NVL(ETAPAS.TOTALETP,0) > 0) AND');
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
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
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
      Add('   TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' <= ' +IntToStr(ednAdm2.Value)+ ' AND');
    end;

    if (rgInstancia.ItemIndex > 0) then
    begin
      case (rgInstancia.ItemIndex) of
        1 : Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NULL AND '+
                'PROCTSTNUM IS NULL AND NUMPROCEXEC IS NULL) AND');
        2 : Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND '+
                'PROCTSTNUM IS NULL AND NUMPROCEXEC IS NULL) AND');
        3 : Add('  (PROCJCJNUM IS NOT NULL AND PROCTRTNUM IS NOT NULL AND '+
                'PROCTSTNUM IS NOT NULL AND NUMPROCEXEC IS NULL) AND');
        4 : Add('  (NUMPROCEXEC IS NOT NULL) AND');
      end;
    end;

    if (rgParte.ItemIndex < 2) then
    begin
      case (rgParte.ItemIndex) of
        0 : Add('  (FLGPARTEATIVA = 1) AND');
        1 : Add('  (FLGPARTEATIVA = 0) AND');
      end;
    end;

    if (StrToFloat(ednNum1.Text) > 0) then
      Add('  (NUMPROCTRAB >= ' +ednNum1.Text+ ') AND');

    if (ednNum2.Text <> '9999999999') then
      Add('  (NUMPROCTRAB <= ' +ednNum2.Text+ ') AND');

    if (StrToFloat(ednCus1.Text) > 0) then
      Add('  (CUSTOPROC >= ' +ednCus1.Text+ ') AND');

    if (ednCus2.Text <> '9999999999') then
      Add('  (CUSTOPROC <= ' +ednCus2.Text+ ') AND');

    sSQL := sqlProcesso.SQL[Count-1];
    if (UpperCase(Copy(sSQL, Length(sSQL)-2, 3)) = 'AND') then
    begin
      sSQL := Copy(sSQL, 1, Length(sSQL)-4);
      sqlProcesso.SQL[Count-1] := sSQL;                  
    end;

    if (rgSelDadosFunc.ItemIndex = 0) then
      Add('ORDER BY ' +ORDEM_DADOS[cmbSequencia.ItemIndex])
    else
      Add('ORDER BY ' +ORDEM_DADOS[0]);
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
