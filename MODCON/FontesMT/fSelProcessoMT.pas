unit fSelProcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables,
  fCustomSelProcesso, Wwdatsrc, ExtCtrls, wwdblook, Spin, StdCtrls, TEdNum, MAHlpBtn, Buttons,
  TB97, TB97Tlbr, IvDictio, IvMulti, IvEMulti, ComCtrls, checklst, CMDateTimePicker, DBClient,
  wwdbdatetimepicker, CmParamReport, uCMClientDataSet, uCmSqlParams, TREdit, ColorCheckListBox,
  uCtrlTRT, uCtrlTipProc, uCtrlTipAcao, uCtrlListTerceirosRH, uCtrlGlobalRH, uCtrlTipSent,
  uCtrlCargo, uCtrlTipObjeto, uCtrlTipRec, uCtrlPessoaSindicato, uCtrlMotivo, uCtrlGrInstr,
  uCtrlProfiss, uCtrlPessoaFilialPessoa;

type
  TfrmSelProcessoMT = class(TfrmCustomSelProcesso)
    pgctrlPrincipal: TPageControl;
    tbshGeral: TTabSheet;
    tbshAdv: TTabSheet;
    tbshObjetos: TTabSheet;
    rgObjeto: TRadioGroup;
    gbxObjeto: TGroupBox;
    dblcObjeto: TwwDBLookupCombo;
    lstObjeto: TListBox;
    lstCodObjeto: TListBox;
    rgEtapa: TRadioGroup;
    gbxEtapa: TGroupBox;
    dblcEtapa: TwwDBLookupCombo;
    lstEtapa: TListBox;
    lstCodEtapa: TListBox;
    rgInstancia: TRadioGroup;
    rgSentenca: TRadioGroup;
    gbxSentenca: TGroupBox;
    dblcSentenca: TwwDBLookupCombo;
    lstSentenca: TListBox;
    lstCodSentenca: TListBox;
    tbshReclamante: TTabSheet;
    pgctrlDadosReclamante: TPageControl;
    tsDadosFunc: TTabSheet;
    gbxTipContra: TGroupBox;
    cbxEfetivos: TCheckBox;
    cbxTemporarios: TCheckBox;
    cbxEstagiarios: TCheckBox;
    cbxTerceiros: TCheckBox;
    cbxAutonomos: TCheckBox;
    cbxPropDirSemVinc: TCheckBox;
    gbxSituacao: TGroupBox;
    cbxAtivos: TCheckBox;
    cbxAfastados: TCheckBox;
    cbxDemitidos: TCheckBox;
    gbxTipoSal: TGroupBox;
    cbxMensalistas: TCheckBox;
    cbxDiaristas: TCheckBox;
    cbxHoristas: TCheckBox;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    ednSal1: TEditNum;
    ednSal2: TEditNum;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    ednAdm1: TSpinEdit;
    ednAdm2: TSpinEdit;
    gbxTempLot: TGroupBox;
    Label8: TLabel;
    ednLot1: TSpinEdit;
    ednLot2: TSpinEdit;
    gbxTempCar: TGroupBox;
    Label9: TLabel;
    ednCar1: TSpinEdit;
    ednCar2: TSpinEdit;
    rgSequencia: TGroupBox;
    cmbSequencia: TComboBox;
    tsDadosPess: TTabSheet;
    gbxIdade: TGroupBox;
    Label10: TLabel;
    ednIda1: TSpinEdit;
    ednIda2: TSpinEdit;
    gbxProfis: TGroupBox;
    dblcProfiss: TwwDBLookupCombo;
    gbxGrauInstr: TGroupBox;
    dblcGrauInstr: TwwDBLookupCombo;
    rgSinal: TRadioGroup;
    gbxCep: TGroupBox;
    Label11: TLabel;
    ednCep1: TEditNum;
    ednCep2: TEditNum;
    gbxAniv: TGroupBox;
    GroupBox3: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    rgSinTot: TRadioGroup;
    speDepTot: TSpinEdit;
    speDepIR: TSpinEdit;
    speDepSF: TSpinEdit;
    rgSinIR: TRadioGroup;
    rgSinSF: TRadioGroup;
    tsDadosOutros: TTabSheet;
    rgEstab: TRadioGroup;
    gbxEstab: TGroupBox;
    cbxSubEstab: TCheckBox;
    rgSindic: TRadioGroup;
    gbxSindic: TGroupBox;
    dblcSindic: TwwDBLookupCombo;
    lstSindic: TListBox;
    lstCodSindic: TListBox;
    gbxLotacao: TGroupBox;
    dblcLotacao: TwwDBLookupCombo;
    rgCargo: TRadioGroup;
    gbxCargo: TGroupBox;
    lstCargo: TListBox;
    lstCodCargo: TListBox;
    rgRamo: TRadioGroup;
    gbxRamo: TGroupBox;
    dblcRamo: TwwDBLookupCombo;
    lstRamo: TListBox;
    lstCodRamo: TListBox;
    tbsDemit: TTabSheet;
    cbxAniv: TComboBox;
    lstCodEstab: TListBox;
    bbtnSelEstab: TBitBtn;
    bbtnInvEstab: TBitBtn;
    rgAdv1: TRadioGroup;
    rgAdvC: TRadioGroup;
    rgAdv2: TRadioGroup;
    gbxAdv1: TGroupBox;
    dblcAdv1: TwwDBLookupCombo;
    lstAdv1: TListBox;
    lstCodAdv1: TListBox;
    gbxAdvC: TGroupBox;
    dblcAdvC: TwwDBLookupCombo;
    lstAdvC: TListBox;
    lstCodAdvC: TListBox;
    gbxAdv2: TGroupBox;
    dblcAdv2: TwwDBLookupCombo;
    lstAdv2: TListBox;
    lstCodAdv2: TListBox;
    rgAT: TRadioGroup;
    gbxAT: TGroupBox;
    lstAT: TListBox;
    lstCodAT: TListBox;
    cbxEspeciais: TCheckBox;
    gbxSexo: TGroupBox;
    cbxFeminino: TCheckBox;
    cbxMasculino: TCheckBox;
    rgSitProc: TRadioGroup;
    gbxNumPr: TGroupBox;
    Label2: TLabel;
    ednNum1: TEditNum;
    ednNum2: TEditNum;
    gbxTipEncer: TGroupBox;
    cbxArquiv: TCheckBox;
    cbxAcordo: TCheckBox;
    cbxDesist: TCheckBox;
    cbxSent: TCheckBox;
    gbxSalario: TGroupBox;
    Label4: TLabel;
    ednCus1: TEditNum;
    ednCus2: TEditNum;
    gbxFaixaInc: TGroupBox;
    Label15: TLabel;
    edDataInc1: TCMDateTimePicker;
    edDataInc2: TCMDateTimePicker;
    gbxFaixaAju: TGroupBox;
    Label1: TLabel;
    edDataAju1: TCMDateTimePicker;
    edDataAju2: TCMDateTimePicker;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    edDataNot1: TCMDateTimePicker;
    edDataNot2: TCMDateTimePicker;
    gbxDataEnc: TGroupBox;
    Label5: TLabel;
    edDataEnc1: TCMDateTimePicker;
    edDataEnc2: TCMDateTimePicker;
    gbxTempAdm: TGroupBox;
    Label14: TLabel;
    ednAbe1: TSpinEdit;
    ednAbe2: TSpinEdit;
    rgTipoProc: TRadioGroup;
    gbxTipoProc: TGroupBox;
    dblcTipoProc: TwwDBLookupCombo;
    lstTipoProc: TListBox;
    lstCodTipoProc: TListBox;
    rgTipoAcao: TRadioGroup;
    gbxTipoAcao: TGroupBox;
    lstTipoAcao: TListBox;
    lstCodTipoAcao: TListBox;
    CdsTipoAcao: TCMClientDataSet;
    CdsTRT: TCMClientDataSet;
    CdsTipoProc: TCMClientDataSet;
    dblcTipoAcao: TwwDBLookupCombo;
    CdsUF: TCMClientDataSet;
    CdsAdvog2: TCMClientDataSet;
    CdsAdvogCasa: TCMClientDataSet;
    CdsAdvog1: TCMClientDataSet;
    CdsAT: TCMClientDataSet;
    CdsSentenca: TCMClientDataSet;
    CdsObjeto: TCMClientDataSet;
    CdsEtapa: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsRamo: TCMClientDataSet;
    CdsSindic: TCMClientDataSet;
    pnlDemitidos: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    edDataDem1: TCMDateTimePicker;
    edDataDem2: TCMDateTimePicker;
    rgMotivo: TRadioGroup;
    gbxMotivo: TGroupBox;
    dblcMotivo: TwwDBLookupCombo;
    lstMotivo: TListBox;
    lstCodMotivo: TListBox;
    CdsMotivo: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    CdsProfiss: TCMClientDataSet;
    CdsLotacao: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsProcesso: TCMClientDataSet;
    sqlProcesso: TCMSqlParams;
    gbxEstCivil: TGroupBox;
    cbxSolteiro: TCheckBox;
    cbxCasado: TCheckBox;
    cbxSeparado: TCheckBox;
    cbxViuvo: TCheckBox;
    cbxOutro: TCheckBox;
    cbxSeparadoJud: TCheckBox;
    cbxDesquitado: TCheckBox;
    tbshCidadesUF: TTabSheet;
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
    CdsCidade: TCMClientDataSet;
    lstSiglaUF: TListBox;
    dblcAT: TwwDBLookupCombo;
    dblcCargo: TwwDBLookupCombo;
    chklstEstab: TColorCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure ednAbe2Change(Sender: TObject);
    procedure ednAbe1Change(Sender: TObject);
    procedure ednNum1Change(Sender: TObject);
    procedure ednNum2Change(Sender: TObject);
    procedure ednCus1Change(Sender: TObject);
    procedure ednCus2Change(Sender: TObject);
    procedure rgSitProcClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure rgTipoProcClick(Sender: TObject);
    procedure dblcTipoProcCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure lstTipoProcKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dblcProfissCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcGrauInstrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure rgEstabClick(Sender: TObject);
    procedure dblcLotacaoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure ednAdm2Change(Sender: TObject);
    procedure ednAdm1Change(Sender: TObject);
    procedure ednLot1Change(Sender: TObject);
    procedure ednCar1Change(Sender: TObject);
    procedure ednIda1Change(Sender: TObject);
    procedure ednLot2Change(Sender: TObject);
    procedure ednCar2Change(Sender: TObject);
    procedure ednIda2Change(Sender: TObject);
    procedure cbxDemitidosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnSelEstabClick(Sender: TObject);
    procedure bbtnInvEstabClick(Sender: TObject);
    procedure chklstEstabDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chklstEstabClickCheck(Sender: TObject);
    procedure chklstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    CtrlTRT: TCtrlTRT;
    CtrlTipProc: TCtrlTipProc;
    CtrlTipAcao: TCtrlTipAcao;
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlTipSent: TCtrlTipSent;
    CtrlTipObjeto: TCtrlTipObjeto;
    CtrlTipRec: TCtrlTipRec;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlMotivo: TCtrlMotivo;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlProfiss: TCtrlProfiss;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;

    procedure MudouEstado;    
    function  GerarListaIdEstab: string;
  end;

var
  frmSelProcessoMT: TfrmSelProcessoMT;

implementation

uses uSistema, uMensErro, uCtrlFuncoesRH, fAguarde, dCds, uCtrlUsoGeralRH, uCtrlPadroes;

const
  ORDEM_DADOS: array[0..15] of string = (
    'RECLAMANTES.NOME',
    'RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDCARGO, RECLAMANTES.NOME',
    'RECLAMANTES.IDCARGO, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.NOME',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.NOME',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDRAMOFORNECEDOR, RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.NOME',
    'RECLAMANTES.IDRAMOFORNECEDOR, RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.IDCARGO, RECLAMANTES.NOME',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.IDCARGO, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.IDCARGO, RECLAMANTES.NOME',
    'RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.IDCARGO, RECLAMANTES.MATRICULA',
    'RECLAMANTES.IDRAMOFORNECEDOR, RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.IDCARGO, RECLAMANTES.NOME',
    'RECLAMANTES.IDRAMOFORNECEDOR, RECLAMANTES.IDEMPRESA, RECLAMANTES.IDESTAB, RECLAMANTES.CODCENTROCUSTO, RECLAMANTES.IDCARGO, RECLAMANTES.MATRICULA');

{$R *.DFM}

procedure TfrmSelProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlTRT := TCtrlTRT.Create;
  CtrlTRT.InitializeAs(Padroes);

  CtrlTipProc := TCtrlTipProc.Create;
  CtrlTipProc.InitializeAs(Padroes);

  CtrlTipAcao := TCtrlTipAcao.Create;
  CtrlTipAcao.InitializeAs(Padroes);

  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlTipSent := TCtrlTipSent.Create;
  CtrlTipSent.InitializeAs(Padroes);

  CtrlTipObjeto := TCtrlTipObjeto.Create;
  CtrlTipObjeto.InitializeAs(Padroes);

  CtrlTipRec := TCtrlTipRec.Create;
  CtrlTipRec.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CdsTRT.Data := CtrlTRT.ListTRT;
  CdsTipoProc.Data := CtrlTipProc.ListTipProc;
  CdsTipoAcao.Data := CtrlTipAcao.ListTipAcao;
  CdsUF.Data := CtrlListTerceirosRH.ListEstado;
  CdsCidade.Data := CtrlListTerceirosRH.ListCidadeNasc(0, '', '');
  CdsAdvog1.Data := CtrlGlobalRH.ListAdvogadoContratado(Sistema.IdModulo);
  CdsAdvogCasa.Data := CtrlGlobalRH.ListAdvogadoCasa;
  CdsAdvog2.Data := CtrlGlobalRH.ListAdvogadoDoReclamante(Sistema.IdModulo);
  CdsAT.Data := CtrlGlobalRH.ListAssistenteTecnico(Sistema.IdModulo);
  CdsSentenca.Data := CtrlTipSent.ListTipSent;
  CdsObjeto.Data := CtrlTipObjeto.ListTipObjeto;
  CdsEtapa.Data := CtrlTipRec.ListTipRec;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsProfiss.Data := CtrlProfiss.ListProfissao;
  CdsLotacao.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa), '', true);

  cbxAniv.ItemIndex := 0;
  dblcLotacao.SelText := '**********';
  cmbSequencia.ItemIndex := 0;
  edDataDem2.Date := Date;
  edDataDem1.Date := Date - Round(365.25*50 + 1);
  pnlDemitidos.Visible := cbxDemitidos.Checked;
  pgctrlPrincipal.ActivePageIndex := 0;
  pgctrlDadosReclamante.ActivePageIndex := 0;
end;

procedure TfrmSelProcessoMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTRT);
  FreeAndNil(CtrlTipProc);
  FreeAndNil(CtrlTipAcao);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlTipObjeto);
  FreeAndNil(CtrlTipSent);
  FreeAndNil(CtrlTipRec);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlGrInstr);
  FreeAndNil(CtrlProfiss);
  FreeAndNil(CtrlPessoaFilialPessoa);
  inherited;
end;

procedure TfrmSelProcessoMT.chklstEstabDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with (TColorCheckListBox(Control).Canvas) do
  begin
    if (TColorCheckListBox(Control).Checked[Index]) then
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
    TextOut(Rect.Left, Rect.Top, TColorCheckListBox(Control).Items[Index]);
  end;
end;

procedure TfrmSelProcessoMT.chklstEstabClickCheck(Sender: TObject);
begin
  FU.InvalidateItemListBox(TCustomListBox(Sender), TCustomListBox(Sender).ItemIndex);
end;

procedure TfrmSelProcessoMT.chklstEstabKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
    chklstEstabClickCheck(Sender);
end;

procedure TfrmSelProcessoMT.dblcGrauInstrCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Modified) then
    dblcGrauInstr.Text := Trim(CdsGrauInstr.FieldByName('IDGRINSTR').asString);
end;

procedure TfrmSelProcessoMT.dblcProfissCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (Modified) then
    dblcProfiss.Text := Trim(CdsProfiss.FieldByName('IDPROFISS').asString);
end;

procedure TfrmSelProcessoMT.dblcLotacaoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  if (Modified) and not(CdsLotacao.IsEmpty) then
    dblcLotacao.Text := CdsLotacao.FieldByName('CODCENTROCUSTO').asString;
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
  if (Sender = dblcCargo) then
    InserirLista(Modified, lstCodCargo, lstCargo, CdsCargo, 'IDCARGO', 'TITULO')
  else
  if (Sender = dblcRamo) then
    InserirLista(Modified, lstCodRamo, lstRamo, CdsRamo, 'IDRAMOFORNECEDOR', 'DESCRAMOFORNECEDOR')
  else
  if (Sender = dblcSindic) then
    InserirLista(Modified, lstCodSindic, lstSindic, CdsSindic, 'IDPESSOA', 'RAZAOSOCIAL')
  else
  if (Sender = dblcMotivo) then
    InserirLista(Modified, lstCodMotivo, lstMotivo, CdsMotivo, 'IDMOTIVO', 'DESCRICAO');
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
  if (Sender = lstCargo) then
    ApagarLista(Key, lstCodCargo, lstCargo)
  else
  if (Sender = lstRamo) then
    ApagarLista(Key, lstCodRamo, lstRamo)
  else
  if (Sender = lstSindic) then
    ApagarLista(Key, lstCodSindic, lstSindic)
  else
  if (Sender = lstMotivo) then
    ApagarLista(Key, lstCodMotivo, lstMotivo);
end;

procedure TfrmSelProcessoMT.ednAbe2Change(Sender: TObject);
begin
  if (ednAbe2.Value < ednAbe1.Value) then
    ednAbe2.Value := ednAbe1.Value;
end;

procedure TfrmSelProcessoMT.ednAbe1Change(Sender: TObject);
begin
  if (ednAbe1.Value > ednAbe2.Value) then
    ednAbe1.Value := ednAbe2.Value;
end;

procedure TfrmSelProcessoMT.ednNum1Change(Sender: TObject);
begin
  if (FU.StrFloat(ednNum1.Text) > FU.StrFloat(ednNum2.Text)) then
    ednNum1.Text := ednNum2.Text;
end;

procedure TfrmSelProcessoMT.ednNum2Change(Sender: TObject);
begin
  if (FU.StrFloat(ednNum1.Text) > FU.StrFloat(ednNum2.Text)) then
    ednNum2.Text := ednNum1.Text;
end;

procedure TfrmSelProcessoMT.ednCus1Change(Sender: TObject);
begin
  if (FU.StrFloat(ednCus1.Text) > FU.StrFloat(ednCus2.Text)) then
    ednCus1.Text := ednCus2.Text;
end;

procedure TfrmSelProcessoMT.ednCus2Change(Sender: TObject);
begin
  if (FU.StrFloat(ednCus2.Text) < FU.StrFloat(ednCus1.Text)) then
    ednCus2.Text := ednCus1.Text;
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

procedure TfrmSelProcessoMT.ednLot1Change(Sender: TObject);
begin
  if (ednLot1.Value > ednLot2.Value) then
    ednLot1.Value := ednLot2.Value;
end;

procedure TfrmSelProcessoMT.ednCar1Change(Sender: TObject);
begin
  if (ednCar1.Value > ednCar2.Value) then
    ednCar1.Value := ednCar2.Value;
end;

procedure TfrmSelProcessoMT.ednIda1Change(Sender: TObject);
begin
  if (ednIda1.Value > ednIda2.Value) then
    ednIda1.Value := ednIda2.Value;
end;

procedure TfrmSelProcessoMT.ednLot2Change(Sender: TObject);
begin
  if (ednLot2.Value < ednLot1.Value) then
    ednLot2.Value := ednLot1.Value;
end;

procedure TfrmSelProcessoMT.ednCar2Change(Sender: TObject);
begin
  if (ednCar2.Value < ednCar1.Value) then
    ednCar2.Value := ednCar1.Value;
end;

procedure TfrmSelProcessoMT.ednIda2Change(Sender: TObject);
begin
  if (ednIda2.Value < ednIda1.Value) then
    ednIda2.Value := ednIda1.Value;
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
  if (Sender = rgCargo) then
  begin
    if (rgCargo.ItemIndex = 1) and not(CdsCargo.Active) then
      CdsCargo.Data := CtrlCargo.ListCargo;
    HabilitarLista(rgCargo, gbxCargo, CdsCargo);
  end
  else
  if (Sender = rgRamo) then
  begin
    if (rgRamo.ItemIndex = 1) and not(CdsRamo.Active) then
      CdsRamo.Data := CtrlListTerceirosRH.ListRamoFornecedorDeEstabelecimento;
    HabilitarLista(rgRamo, gbxRamo, CdsRamo);
  end
  else
  if (Sender = rgSindic) then
  begin
    if (rgSindic.ItemIndex = 1) and not(CdsSindic.Active) then
      CdsSindic.Data := CtrlPessoaSindicato.ListPessoaSindicato;
    HabilitarLista(rgSindic, gbxSindic, CdsSindic);
  end
  else
  if (Sender = rgMotivo) then
  begin
    if (rgMotivo.ItemIndex = 1) and not(CdsMotivo.Active) then
      CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D');
    HabilitarLista(rgMotivo, gbxMotivo, CdsMotivo);
  end;
end;

procedure TfrmSelProcessoMT.rgEstabClick(Sender: TObject);
begin
  if (rgEstab.ItemIndex = 1) and not(CdsEstab.Active) then
  begin
    // Preenche Lista dos Estabelecimentos
    frmAguarde.Mostra('Selecionando Estabelecimentos...');
    CdsEstab.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(Sistema.IdEmpresa);

    chklstEstab.Items.Clear;
    while not(CdsEstab.EOF) do
    begin
      chklstEstab.Items.Add(CdsEstab.FieldByName('NOME').asString);
      lstCodEstab.Items.Add(CdsEstab.FieldByName('IDPESSOA').asString);
      CdsEstab.Next;
    end;
    CdsEstab.First;

    frmAguarde.Apaga;
  end;
  HabilitarLista(rgEstab, gbxEstab, CdsEstab);
end;

procedure TfrmSelProcessoMT.rgSitProcClick(Sender: TObject);
begin
  gbxTipEncer.Visible := (rgSitProc.ItemIndex > 0);
  gbxDataEnc.Visible := (rgSitProc.ItemIndex > 0);
  rgSentenca.Visible := (rgSitProc.ItemIndex > 0);
  gbxSentenca.Visible := (rgSitProc.ItemIndex > 0) and (rgSentenca.ItemIndex > 0);
end;

procedure TfrmSelProcessoMT.cbxDemitidosClick(Sender: TObject);
begin
  pnlDemitidos.Visible := cbxDemitidos.Checked;
end;

procedure TfrmSelProcessoMT.bbtnSelEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.checked[c] := true;
end;

procedure TfrmSelProcessoMT.bbtnInvEstabClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEstab.Items.Count-1 do
    chklstEstab.Checked[c] := not(chklstEstab.Checked[c]);
end;

procedure TfrmSelProcessoMT.bbtnConfirmarClick(Sender: TObject);
var
  c: integer;
  bMarcouFuncionario: boolean;
  sListaIdAdvogCasaSel, sListaIdAdvog1Sel, sListaIdAdvog2Sel, sListaIdATSel, 
  sListaIdUFSel, sListaIdCidadesSel, sListaIdTipoProcSel, sListaIdTipoAcaoSel,
  sListaIdObjetoSel, sListaIdEtapaSel, sListaIdSentencaSel, sIdListaEstabSel,
  sIdListaCargoSel, sIdListaSindicSel, sIdListaRamoSel, sIdListaMotivoSel, sAux: string;
begin
  bMarcouFuncionario :=
    (cbxEfetivos.Checked) or (cbxEspeciais.Checked) or (cbxTemporarios.Checked) or
    (cbxEstagiarios.Checked) or (cbxTerceiros.Checked) or (cbxPropDirSemVinc.Checked) or
    (cbxAutonomos.Checked);

  if not(bMarcouFuncionario) then
  begin
    MsgDlg('Assinale ao menos um Tipo de Contrato.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    pgctrlDadosReclamante.ActivePageIndex := 0;
    gbxTipContra.SetFocus;
    exit;
  end;

  if not(cbxAtivos.Checked) and not(cbxAfastados.Checked) and not(cbxDemitidos.Checked) then
  begin
    MsgDlg('Assinale ao menos um Tipo de Situação Funcional.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    pgctrlDadosReclamante.ActivePageIndex := 0;
    gbxSituacao.SetFocus;
    exit;
  end;

  if not(cbxMensalistas.Checked) and not(cbxDiaristas.Checked) and
     not(cbxHoristas.Checked) then
  begin
    MsgDlg('Assinale ao menos um Tipo de Salário.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
    pgctrlDadosReclamante.ActivePage := tsDadosFunc;
    gbxTipoSal.SetFocus;
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

  // Cria a lista de IDs dos Advogados Reclamantes selecionados
  sListaIdAdvog2Sel := GerarParamSELECT(rgAdv2, lstCodAdv2, lstAdv2);

  // Cria a lista de IDs dos Assistentes Técnicos selecionados
  sListaIdATSel := GerarParamSELECT(rgAT, lstCodAT, lstAT);

  // Cria a lista de IDs das UFs selecionadas
  sListaIdUFSel := GerarParamSELECT(rgUF, lstCodUF, lstUF);

  // Cria a lista de IDs das Cidades selecionadas
  sListaIdCidadesSel := GerarListaItens(rgCidade, lstCodCidade, lstCidade);

  // Cria a lista de IDs dos Objetos selecionados
  sListaIdObjetoSel := GerarParamSELECT(rgObjeto, lstCodObjeto, lstObjeto);

  // Cria a lista de IDs das Sentenças selecionadas
  sListaIdSentencaSel := GerarParamSELECT(rgSentenca, lstCodSentenca, lstSentenca);

  // Cria a lista de IDs das Etapas selecionadas
  sListaIdEtapaSel := GerarParamSELECT(rgEtapa, lstCodEtapa, lstEtapa);

  // Cria a lista de IDs dos Cargos selecionados
  sIdListaCargoSel := GerarParamSELECT(rgCargo, lstCodCargo, lstCargo);

  // Cria a lista de IDs dos Sindicatos selecionados
  sIdListaSindicSel := GerarParamSELECT(rgSindic, lstCodSindic, lstSindic);

  // Cria a lista de IDs dos Segmentos/Ramos selecionados
  sIdListaRamoSel := GerarParamSELECT(rgRamo, lstCodRamo, lstRamo);

  // Cria a lista de IDs dos Motivos selecionados
  sIdListaMotivoSel := GerarParamSELECT(rgMotivo, lstCodMotivo, lstMotivo);

  // Cria a lista de IDs dos Estabelecimentos selecionados
  sIdListaEstabSel := GerarListaIdEstab;

  with (sqlProcesso.SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('  PT.*, RECLAMANTES.*, CI.IDESTADO, VJ.DESCRICAO AS NOMEVARA');
    Add('FROM');
    Add('  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ,');
    // -------------------------------------------------------------------------------------
    // Reclamantes
    Add('  (SELECT');
    Add('     P.NOME, P.RAZAOSOCIAL, P.TIPO, P.NUMDOCUMENTO, PF.IDSINDICATO,');
    Add('     PF.IDGRINSTR, PF.IDPROFISS, PF.DATAMORTE, PF.DATANASC, PF.SEXO,');
    Add('     PF.TIPOSANG, PF.ESTCIVIL, PF.NUMDEPIRRF, PF.NUMDEPSALF,');
    Add('     PF.NUMDEPTOT, CI.NOME AS CIDADE, EP.LOGRADOURO, EP.CODESTADO,');
    Add('     EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP,');

    if (bMarcouFuncionario) then
      Add('     F.*, SF.TIPOSIT, SF.DESCRICAO, HT.JORNADAMENSAL, FP.IDRAMOFORNECEDOR, C.TITULO');

    Add('   FROM');
    Add('     PESSOA P, PESSOAFISICA PF, ENDPESS EP, CIDADES CI,');

    if (bMarcouFuncionario) then
      Add('     FUNCIONARIO F, SITFUNC SF, HORATRAB HT, FILIALPESSOA FP, CARGO C');

    Add('   WHERE');

    sAux := FU.GerarListaSexoSel(cbxMasculino.Checked, cbxFeminino.Checked, true);
    if (sAux <> '') then
      if (Pos(',',sAux) > 0) then
        Add('     (PF.SEXO           IN (' +sAux+ ')) AND')
      else
        Add('     (PF.SEXO            = ' +sAux+ ') AND');

    sAux := FU.GerarListaEstadoCivilSel(cbxSolteiro.Checked, cbxCasado.Checked,
      cbxSeparado.Checked, cbxSeparadoJud.Checked, cbxDesquitado.Checked,
      cbxViuvo.Checked, cbxOutro.Checked, true);
    if (sAux <> '') then
      if (Pos(',',sAux) > 0) then
        Add('      (PF.ESTCIVIL      IN (' +sAux+ ')) AND')
      else
        Add('      (PF.ESTCIVIL       = ' +sAux+ ') AND');

    sAux := FU.GerarListaTipoPagSel(cbxMensalistas.Checked, cbxDiaristas.Checked,
      cbxHoristas.Checked, true);
    if (sAux <> '') then
      if (Pos(',',sAux) > 0) then
        Add('      (F.TIPOPAGAMENTO  IN (' +sAux+ ')) AND')
      else
        Add('      (F.TIPOPAGAMENTO   = ' +sAux+ ') AND');

    if (sIdListaSindicSel <> '') then
      Add('     (PF.IDSINDICATO    ' +sIdListaSindicSel+ ') AND');

    // Grau de Instrução
    if (rgSinal.ItemIndex > -1) and (Trim(dblcGrauInstr.Text) <> '') then
    begin
      case (rgSinal.ItemIndex) of
        0 : Add('     (PF.IDGRINSTR <= ' +Trim(dblcGrauInstr.Text)+ ') AND');
        1 : Add('     (PF.IDGRINSTR  = ' +Trim(dblcGrauInstr.Text)+ ') AND');
        2 : Add('     (PF.IDGRINSTR >= ' +Trim(dblcGrauInstr.Text)+ ') AND');
      end;
    end;

    // Profissão
    if (StrToIntDef(dblcProfiss.Text,0) > 0) and (Trim(dblcProfiss.Text) <> '') then
      Add('     (PF.IDPROFISS  = ' +dblcProfiss.Text+ ') AND');

    if (rgSinTot.ItemIndex < 2) or (speDepTot.Value > 0) then // Total Dependentes
    begin
      case (rgSinTot.ItemIndex) of
        0 : Add('     (NVL(PF.NUMDEPTOT,0) <= ' +IntToStr(speDepTot.Value)+ ') AND');
        1 : Add('     (NVL(PF.NUMDEPTOT,0)  = ' +IntToStr(speDepTot.Value)+ ') AND');
        2 : Add('     (NVL(PF.NUMDEPTOT,0) >= ' +IntToStr(speDepTot.Value)+ ') AND');
      end;
    end;

    if (rgSinIR.ItemIndex < 2) or (speDepIR.Value > 0) then  // Dependentes IRRF
    begin
      case (rgSinIR.ItemIndex) of
        0 : Add('     (NVL(PF.NUMDEPIRRF,0) <= ' +IntToStr(speDepIR.Value)+ ') AND');
        1 : Add('     (NVL(PF.NUMDEPIRRF,0)  = ' +IntToStr(speDepIR.Value)+ ') AND');
        2 : Add('     (NVL(PF.NUMDEPIRRF,0) >= ' +IntToStr(speDepIR.Value)+ ') AND');
      end;
    end;

    if (rgSinSF.ItemIndex < 2) or (speDepSF.Value > 0) then  // Dependentes Sal.Fam.
    begin
      case (rgSinSF.ItemIndex) of
        0 : Add('     (NVL(PF.NUMDEPSALF,0) <= ' +IntToStr(speDepSF.Value)+ ') AND');
        1 : Add('     (NVL(PF.NUMDEPSALF,0)  = ' +IntToStr(speDepSF.Value)+ ') AND');
        2 : Add('     (NVL(PF.NUMDEPSALF,0) >= ' +IntToStr(speDepSF.Value)+ ') AND');
      end;
    end;

    if (ednIda1.Value > 0) then // Faixa Etária
      Add('     (TRUNC((SYSDATE - 1 - PF.DATANASC)/365.25) >= ' +IntToStr(ednIda1.Value)+ ') AND');

    if (ednIda2.Value < 99) then // Faixa Etária
      Add('     (TRUNC((SYSDATE - 1 - PF.DATANASC)/365.25) <= ' +IntToStr(ednIda2.Value)+ ') AND');

    if (cbxAniv.ItemIndex > 0) then // Mês do Aniversário
      Add('     (TO_NUMBER(SUBSTR(TO_CHAR(PF.DATANASC,''DD/MM/YYYY''),4,2)) = '+
        IntToStr(cbxAniv.ItemIndex)+ ') AND');

    if (bMarcouFuncionario) then
      Add('     (F.IDPESSOA         = PF.IDPESSOA) AND');

    if (bMarcouFuncionario) then
    begin
      if (CtrlUsoGeralRH.UsuXCCusto <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXCCusto) > 0) then
          Add('     (F.CODCENTROCUSTO  IN ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND')
        else
          Add('     (F.CODCENTROCUSTO   = ' +CtrlUsoGeralRH.UsuXCCusto+ ') AND');

      if (sIdListaCargoSel <> '') then
        Add('     (F.IDCARGO         ' +sIdListaCargoSel+ ') AND');

      if (CtrlUsoGeralRH.UsuXFilial <> '') then
        if (Pos(',',CtrlUsoGeralRH.UsuXFilial) > 0) then
          Add('     (F.IDESTAB         IN ' +CtrlUsoGeralRH.UsuXFilial+ ') AND')
        else
          Add('     (F.IDESTAB          = ' +CtrlUsoGeralRH.UsuXFilial+ ') AND');

      sAux := FU.GerarListaSitFuncSel(cbxAtivos.Checked, cbxAfastados.Checked,
        cbxDemitidos.Checked, true);
      if (sAux <> '') then
      begin
        if (Pos(',',sAux) > 0) then
          Add('     (SF.TIPOSIT       IN (' +sAux+ ')) AND')
        else
          Add('     (SF.TIPOSIT        = ' +sAux+ ') AND');
      end;

      if (cbxDemitidos.Checked) then
      begin
        if (sIdListaMotivoSel <> '') then
          Add('     (SF.TIPOSIT <> ''D'' OR F.IDMOTIVODESLIGRAIS ' +sIdListaMotivoSel+ ') AND');

        Add('     (SF.TIPOSIT <> ''D'' OR F.DATADESLIGAMENTO BETWEEN '+
          'TO_DATE(' +QuotedStr(edDataDem1.Text)+ ',''DD/MM/YYYY'') AND '+
          'TO_DATE(' +QuotedStr(edDataDem2.Text)+ ',''DD/MM/YYYY'')) AND');
      end;

      sAux := FU.GerarListaTipoContratoSel(cbxEfetivos.Checked, cbxEspeciais.Checked,
        cbxTemporarios.Checked, cbxTerceiros.Checked, cbxPropDirSemVinc.Checked,
        cbxAutonomos.Checked, cbxEstagiarios.Checked, true);
      if (sAux <> '') then
      begin
        if (Pos(',',sAux) > 0) then
          Add('     (F.TIPOCONTRATO   IN (' +sAux+ ')) AND')
        else
          Add('     (F.TIPOCONTRATO    = ' +sAux+ ') AND');
      end;
      
      if (sIdListaEstabSel <> '') then
        Add('     (F.IDESTAB        ' +sIdListaEstabSel+ ') AND');

      if (sIdListaRamoSel <> '') then
        Add('     (FP.IDRAMOFORNECEDOR ' +sIdListaRamoSel+ ') AND');

      if (dblcLotacao.Text <> '**********') then
        for c:=1 to Length(Trim(dblcLotacao.Text)) do
          if (Copy(dblcLotacao.Text, c, 1) <> '*') then
            Add('     (SUBSTR(F.CODCENTROCUSTO,' +IntToStr(c)+ ',1) = ' +
              QuotedStr(Copy(dblcLotacao.Text, c, 1))+ ') AND');

      if (ednAdm1.Value > 0) then //Tempo de Casa
      begin
        Add('     ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),4,2)) +');
        Add('       DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2))) /');
        Add('       DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('       SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2),1,');
        Add('       ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) - ');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' >= ' +IntToStr(ednAdm1.Value)+ ') AND');
      end;

      if (ednAdm2.Value < 999) then //Tempo de Casa
      begin
        Add('     ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),4,2)) +');
        Add('       DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2))) /');
        Add('       DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('       SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2),1,');
        Add('       ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATAADMISSAO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' <= ' +IntToStr(ednAdm2.Value)+ ') AND');
      end;

      if (ednLot1.Value > 0) then //Tempo na Lotação
      begin
        Add('     ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),4,2)) +');
        Add('       DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),1,2))) /');
        Add('       DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('       SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),1,2),1,');
        Add('       ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' >= ' +IntToStr(ednLot1.Value)+ ') AND');
      end;

      if (ednLot2.Value < 999) then //Tempo na Lotação
      begin
        Add('     ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),4,2)) +');
        Add('       DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),1,2))) /');
        Add('       DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('       SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),1,2),1,');
        Add('       ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATALOTACAO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' <= ' +IntToStr(ednLot2.Value)+ ') AND');
      end;

      if (ednCar1.Value > 0) then //Tempo no Cargo
      begin
        Add('     ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),4,2)) +');
        Add('       DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),1,2))) /');
        Add('       DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('       SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),1,2),1,');
        Add('       ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' >= ' +IntToStr(ednCar1.Value)+ ') AND');
      end;

      if (ednCar2.Value < 999) then //Tempo no Cargo
      begin
        Add('     ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),7,10)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),7,10))) * 12 +');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),4,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),4,2)) +');
        Add('       DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),1,2))) /');
        Add('       DECODE(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2),');
        Add('       SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),1,2),1,');
        Add('       ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(TIPOSIT,''D'',DATADESLIGAMENTO,SYSDATE),''DD/MM/YYYY''),1,2)) -');
        Add('       TO_NUMBER(SUBSTR(TO_CHAR(DATACARGO,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
          ' <= ' +IntToStr(ednCar2.Value)+ ') AND');
      end;

      if (ednSal1.Text <> '0') then // Faixa de Salário
        Add('     (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'', 1,'+
          ' DECODE(F.TIPOPAGAMENTO,''H'', HT.JORNADAMENSAL, 30)) >= ' +ednSal1.Text+ ') AND');

      if (ednSal2.Text <> '99999999') then // Faixa de Salário
        Add('     (F.SALARIOATUAL * DECODE(F.TIPOPAGAMENTO,''M'', 1,'+
          ' DECODE(F.TIPOPAGAMENTO,''H'', HT.JORNADAMENSAL, 30)) <= ' +ednSal2.Text+ ') AND');
    end;

    if (ednCep1.Text <> '0') then // Faixa de CEP
      Add('     (TO_NUMBER(EP.CEP)/1000 >= ' +ednCep1.Text+ ') AND');

    if (ednCep2.Text <> '99999') then // Faixa de CEP
      Add('     (TO_NUMBER(EP.CEP)/1000 <= ' +ednCep2.Text+ ') AND');

    Add('     (PF.IDPESSOA        = P.IDPESSOA) AND');

    if (bMarcouFuncionario) then
    begin
      Add('     (F.IDSITFUNC        = SF.IDSITFUNC(+)) AND');
      Add('     (F.IDHORARIO        = HT.IDHORARIO(+)) AND');
      Add('     (F.IDCARGO          = C.IDCARGO(+)) AND');
      Add('     (F.IDESTAB          = FP.IDFILIALPESSOA(+)) AND');      
    end;

    Add('     (P.IDENDRESIDENCIAL = EP.IDENDERECO(+)) AND');
    Add('     (EP.IDCIDADES       = CI.IDCIDADES(+))');
    Add('  ) RECLAMANTES');
    // -------------------------------------------------------------------------------------

    if (sListaIdObjetoSel <> '') then
    begin
      Add('  ,');
      Add('  (SELECT NUMPROCTRAB, COUNT(*) AS TOTALOBJ');
      Add('   FROM   OBJPROCTRAB');
      Add('   WHERE  (CODTIPOOBJETO ' +sListaIdObjetoSel+ ')');
      Add('   GROUP BY NUMPROCTRAB) OBJETOS');
    end;

    if (sListaIdEtapaSel <> '') then
    begin
      if (rgEtapa.ItemIndex = 1) then
      begin
        Add('  ,');
        Add('  (SELECT NUMPROCTRAB');
        Add('   FROM   ETAPAPROCTRAB');
        Add('   WHERE  (CODTIPORECURSO ' +sListaIdEtapaSel+ ') AND');
        Add('          (DATAREALOCOR   <= SYSDATE) AND');
        Add('          (DATAREALOCOR    = (SELECT MAX(DATAREALOCOR)');
        Add('                              FROM   ETAPAPROCTRAB E');
        Add('                              WHERE  (E.NUMPROCTRAB = ETAPAPROCTRAB.NUMPROCTRAB)');
        Add('                              GROUP BY NUMPROCTRAB))) ETAPAS');
      end
      else
      begin
        Add('  ,');
        Add('  (SELECT NUMPROCTRAB, COUNT(*) AS TOTALETP');
        Add('   FROM   ETAPAPROCTRAB');
        Add('   WHERE  (CODTIPORECURSO ' +sListaIdEtapaSel+ ')');
        Add('   GROUP BY NUMPROCTRAB) ETAPAS');
      end;
    end;
    
    Add('WHERE');
    Add('  (PT.INDMATERIA    = 1) AND');

    if (EdDataInc1.Text <> '') then
      Add('  (PT.TRGDTINCLUSAO >= TO_DATE(' +QuotedStr(EdDataInc1.Text)+ ',''DD/MM/YYYY'')) AND');

    if (EdDataInc2.Text <> '') then
      Add('  ((TO_DATE(TO_CHAR(PT.TRGDTINCLUSAO,''DD/MM/YYYY''),''DD/MM/YYYY'') <= TO_DATE(' +
        QuotedStr(EdDataInc2.Text)+ ',''DD/MM/YYYY''))) AND');

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
      sSQL := '  (PT.FLGSITPROC = 0 OR ';

      if (EdDataEnc1.Text <> '') then
      begin
        if (EdDataEnc2.Text <> '') then
          sSQL := sSQL + '(';

        sSQL := sSQL + '(PT.DATAEFETENC >= TO_DATE(' +QuotedStr(EdDataEnc1.Text)+
          ',''DD/MM/YYYY''))';
      end;

      if (EdDataEnc2.Text <> '') then
      begin
        if (EdDataEnc1.Text <> '') then
          sSQL := sSQL + ' AND ';

        sSQL := sSQL + '(PT.DATAEFETENC <= TO_DATE(' +QuotedStr(EdDataEnc2.Text)+
          ',''DD/MM/YYYY''))';

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

    if (sListaIdAdvogCasaSel <> '') then
      Add('  (PT.IDADVOGCASA  ' +sListaIdAdvogCasaSel+ ') AND');

    if (sListaIdAdvog1Sel <> '') then
      Add('  (PT.IDADVOGRECDA ' +sListaIdAdvog1Sel+ ') AND');

    if (sListaIdAdvog2Sel <> '') then
      Add('  (PT.IDADVOGRECTE ' +sListaIdAdvog2Sel+ ') AND');

    if (sListaIdATSel <> '') then
      Add('  (PT.IDASSISTTECN ' +sListaIdATSel+ ') AND');

    if (sListaIdUFSel <> '') then
      Add('  (CI.IDESTADO     ' +sListaIdUFSel+ ') AND');

    if (sListaIdCidadesSel <> '') then
    begin
      if (Pos(',',sListaIdCidadesSel) > 0) then
      begin
        if (cbxCidadeNegativa.Checked) then
          Add('  (PT.IDCIDADES NOT IN (' +sListaIdCidadesSel+ ')) AND')
        else
          Add('  (PT.IDCIDADES IN (' +sListaIdCidadesSel+ ')) AND');
      end
      else
      begin
        if (cbxCidadeNegativa.Checked) then
          Add('  (PT.IDCIDADES <> ' +sListaIdCidadesSel+ ') AND')
        else
          Add('  (PT.IDCIDADES  = ' +sListaIdCidadesSel+ ') AND');
      end;
    end;

    if (sListaIdTipoProcSel <> '') then
      Add('  (PT.IDTIPOPROC   ' +sListaIdTipoProcSel+ ') AND');

    if (sListaIdTipoAcaoSel <> '') then
      Add('  (PT.IDTIPOACAO   ' +sListaIdTipoAcaoSel+ ') AND');

    if (sListaIdSentencaSel <> '') then
      Add('  ((PT.FLGSITPROC = 0) OR (PT.CODTIPOSENT ' +sListaIdSentencaSel+ ')) AND');

    if (rgObjeto.ItemIndex * lstObjeto.Items.Count > 0) then
    begin
      Add('  (PT.NUMPROCTRAB          = OBJETOS.NUMPROCTRAB) AND');
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
    
    if (ednAbe1.Value > 0) then   // Tempo de Existencia
    begin
      Add('  ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
      Add('    DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
      Add('    DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
      Add('    SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
      Add('    ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
        ' >= ' +IntToStr(ednAbe1.Value)+ ') AND');
    end;

    if (ednAbe2.Value < 999) then  // Tempo de Existencia
    begin
      Add('  ((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),7,10)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),7,10))) * 12 +');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),4,2)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),4,2)) +');
      Add('    DECODE((TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2))) /');
      Add('    DECODE(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2),');
      Add('    SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2),1,');
      Add('    ABS(TO_NUMBER(SUBSTR(TO_CHAR(DECODE(FLGSITPROC, 1, DATAEFETENC, SYSDATE),''DD/MM/YYYY''),1,2)) -');
      Add('    TO_NUMBER(SUBSTR(TO_CHAR(DATANOTIF,''DD/MM/YYYY''),1,2)))),-1,-1,0)'+
        ' <= ' + IntToStr(ednAbe2.Value) + ') AND');
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

    if (ednNum1.Text <> '0') then
      Add('  (PT.NUMPROCTRAB >= ' +ednNum1.Text+ ') AND');

    if (ednNum2.Text <> '9999999999') then
      Add('  (PT.NUMPROCTRAB <= ' +ednNum2.Text+ ') AND');

    if (ednCus1.Text <> '0') then
      Add('  (PT.CUSTOPROC >= ' +ednCus1.Text+ ') AND');

    if (ednCus2.Text <> '9999999999') then
      Add('  (PT.CUSTOPROC <= ' +ednCus2.Text+ ') AND');

    Add('  (RECLAMANTES.IDPESSOA = PT.IDRECLAMANTE) AND');
    Add('  (PT.IDVARAJUSTICA     = VJ.IDVARAJUSTICA(+)) AND');
    Add('  (PT.IDCIDADES         = CI.IDCIDADES(+))');
    Add('ORDER BY');
    Add('  ' +ORDEM_DADOS[cmbSequencia.ItemIndex]);
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

function TfrmSelProcessoMT.GerarListaIdEstab: string;
var
  c: integer;
begin
  Result := '';
  if (rgEstab.ItemIndex > 0) then
  begin
    for c:=0 to lstCodEstab.Items.Count-1 do
    begin
      if (lstCodEstab.Items[c] = '') then
        break;

      if (Result = '') then
        Result := Result + lstCodEstab.Items[c]
      else
        Result := Result +','+ lstCodEstab.Items[c];

      if (cbxSubEstab.Checked) then
      begin
        dmCds.Cds.Data := CtrlPessoaFilialPessoa.ListEstabDaEmpresa(
          StrToInt(lstCodEstab.Items[c]));

        while not(dmCds.Cds.EOF) do
        begin
          Result := Result +','+ dmCds.Cds.FieldByName('IdPessoa').asString;
          dmCds.Cds.Next;
        end;
      end;
    end;
    if (Result <> '') then
      if (Pos(',', Result) = 0) then
        Result := ' = '+ Result
      else
        Result := 'IN ('+ Result +')';
  end;
end;

end.
