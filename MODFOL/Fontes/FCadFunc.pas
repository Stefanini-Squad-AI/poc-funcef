unit fCadFunc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Spin, Menus,
  MontaSelect, DBTables, Wwdatsrc, TB97, MAHlpBtn, StdCtrls, Buttons, Grids, Wwdbigrd,
  Wwdbgrid, checklst, DBCtrls, TabControlDetalhe, wwdblook, Mask, wwdbedit, ExtCtrls, ExtDlgs,
  TREdit, Wwdbspin, TB97Ctls, TB97Tlbr, IvDictio, Db, IvMulti, IvEMulti, CMDBLookupCombo,
  CmEventosCadastro, ImgList, ComCtrls, CMDateTimePicker, wwdbdatetimepicker, Wwdotdot,
  Wwdbcomb, DBClient, uCMClientDataSet, CMProcura, TB97Tlwn, fpessoaMT, uCtrlListTerceirosRH,
  uCtrlGlobalRH, uCtrlMotivo, uCtrlPais, uCtrlSitFunc, uCtrlCargo, uCtrlPessoaSindicato,
  uCtrlPessoaFilialPessoa, uCtrlGrInstr, uCtrlProfiss, uCtrlFonte, uCtrlHoraTrab,
  uCtrlUltimosEmpregos, uCtrlVincEmpr, uCtrlMovContrCAGED, uCtrlTipoTrab, uCtrlCatEmprGRE,
  uCtrlSitRisco, uCtrlFaixaSal, uCtrlPessoaDependente, uCtrlPessoaEstrangeiro,
  uCtrlIntegraPrevRH;

type
  TfrmCadFunc = class(TFrmPessoaMT)
    tbsDadosPess: TTabSheet;
    tbsUltEmpr: TTabSheet;
    dbgrUltEmpr: TwwDBGrid;
    opndArqBmp: TOpenPictureDialog;
    dsUltEmpr: TwwDataSource;
    tbshOutros: TTabSheet;
    Label44: TLabel;
    dblckVincEmpr: TwwDBLookupCombo;
    Label45: TLabel;
    dblckMovContrCAGED: TwwDBLookupCombo;
    dblckTipoTrab: TwwDBLookupCombo;
    Label46: TLabel;
    gbxFGTS: TGroupBox;
    tbsSitFunc: TTabSheet;
    gbxIdent: TGroupBox;
    gbxContr: TGroupBox;
    gbxDeslig: TGroupBox;
    gbxSalar: TGroupBox;
    gbxLotacao: TGroupBox;
    Label35: TLabel;
    dbedMatric: TwwDBEdit;
    Label21: TLabel;
    dbedDatAdmis: TCMDateTimePicker;
    Label36: TLabel;
    dblckSitFunc: TwwDBLookupCombo;
    Label31: TLabel;
    dblckHorario: TwwDBLookupCombo;
    Label37: TLabel;
    dblckFonte: TwwDBLookupCombo;
    dbrgTipContra: TDBRadioGroup;
    gbxContrato: TGroupBox;
    lblFinal: TLabel;
    dbedFinalContr: TCMDateTimePicker;
    Label23: TLabel;
    dbedDatSaida: TCMDateTimePicker;
    Label24: TLabel;
    dbedRetorno: TCMDateTimePicker;
    dbedSalario: TDBRealEdit;
    Label50: TLabel;
    Label51: TLabel;
    dbedDatSalar: TCMDateTimePicker;
    dbrgTipoSalar: TDBRadioGroup;
    gbxCargo: TGroupBox;
    dblckCargo: TwwDBLookupCombo;
    Label52: TLabel;
    dbedDatCargo: TCMDateTimePicker;
    Label29: TLabel;
    dblckEstab: TwwDBLookupCombo;
    Label32: TLabel;
    dbedDatLotac: TCMDateTimePicker;
    Label53: TLabel;
    dblckChefe: TwwDBLookupCombo;
    Label54: TLabel;
    tbshDependentes: TTabSheet;
    dbgrdDepen: TwwDBGrid;
    dsDependentes: TwwDataSource;
    tbshOpcaoCargo: TTabSheet;
    gbxCargo1: TGroupBox;
    Label17: TLabel;
    dblckCargo1: TwwDBLookupCombo;
    dbedCargo1: TCMDateTimePicker;
    gbxCargo2: TGroupBox;
    Label26: TLabel;
    dblckCargo2: TwwDBLookupCombo;
    dbedCargo2: TCMDateTimePicker;
    gbxFaixa1: TGroupBox;
    Label27: TLabel;
    dbspeStep1: TwwDBSpinEdit;
    dblckFaixa1: TwwDBLookupCombo;
    gbxFaixa2: TGroupBox;
    Label28: TLabel;
    dbspeStep2: TwwDBSpinEdit;
    dblckFaixa2: TwwDBLookupCombo;
    dbedDatRefHor: TCMDateTimePicker;
    Label55: TLabel;
    Label25: TLabel;
    dblckMotivo1: TwwDBLookupCombo;
    Label13: TLabel;
    dblckMotivo2: TwwDBLookupCombo;
    edNomeCCusto: TEdit;
    dblckCCusto: TwwDBLookupCombo;
    pgctrlDadosPess: TPageControl;
    tbshGeral: TTabSheet;
    tbshEstrangeiro: TTabSheet;
    dsEstrangeiro: TwwDataSource;
    pnlUltEmpr: TPanel;
    Label12: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    dblckUltCargo: TwwDBLookupCombo;
    dbedUltAdm: TCMDateTimePicker;
    dbedUltDem: TCMDateTimePicker;
    dbedUltSal: TDBRealEdit;
    dblckUltMotivo: TwwDBLookupCombo;
    dbedUltCargo: TwwDBEdit;
    dbedUltEmpresa: TwwDBEdit;
    dbedNumSeq: TwwDBEdit;
    msAgencia: TMontaSelect;
    gbxContaSal: TGroupBox;
    dblckBancoSalario: TwwDBLookupCombo;
    mskedNumAgenciaSalario: TMaskEdit;
    spbtProcuraAgenciaSalario: TSpeedButton;
    lblNumConta: TLabel;
    mskedNumContaSalario: TMaskEdit;
    rgFGTSopcao: TDBRadioGroup;
    lblDatOpc: TLabel;
    dbedDatOpc: TCMDateTimePicker;
    Label48: TLabel;
    dbedContas: TwwDBEdit;
    Label49: TLabel;
    dbedValFG: TDBRealEdit;
    Label11: TLabel;
    dblckBancoFGTS: TwwDBLookupCombo;
    Label58: TLabel;
    mskedNumAgenciaFGTS: TMaskEdit;
    spbtProcuraAgenciaFGTS: TSpeedButton;
    Label59: TLabel;
    mskedNumContaFGTS: TMaskEdit;
    Label56: TLabel;
    dblckCatEmpr: TwwDBLookupCombo;
    Label57: TLabel;
    dblckSitRisco: TwwDBLookupCombo;
    spedDias: TSpinEdit;
    pnlAlteraSal: TPanel;
    rgInformaSalario: TRadioGroup;
    cmbSteps: TComboBox;
    tbbtnConfInfo: TToolbarButton97;
    tbbtnCancelInfo: TToolbarButton97;
    Bevel2: TBevel;
    gbxOpcoes: TGroupBox;
    Label33: TLabel;
    Label60: TLabel;
    edOpcaoTicket: TEdit;
    edOpcoesPerc: TEdit;
    Label30: TLabel;
    edOpcoesDataAssoc: TEdit;
    Label4: TLabel;
    dbspedDataCheg: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dblckNacionalidadePai: TwwDBLookupCombo;
    dblckNacionalidadeMae: TwwDBLookupCombo;
    dbrgNatur: TDBRadioGroup;
    Label7: TLabel;
    dbedDecrNatur: TwwDBEdit;
    Label67: TLabel;
    wwDBEdit4: TwwDBEdit;
    Label68: TLabel;
    wwDBEdit5: TwwDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    dbrgEstCivil: TDBRadioGroup;
    gbxDepend: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dbedQtdIR: TwwDBEdit;
    dbedQtdSF: TwwDBEdit;
    dbedQtdTot: TwwDBEdit;
    Label66: TLabel;
    dbcmbTipoSang: TwwDBComboBox;
    dbrgSexo: TDBRadioGroup;
    Label2: TLabel;
    dbedDatNasc: TCMDateTimePicker;
    dbrgIsento: TDBRadioGroup;
    Label15: TLabel;
    cmbRaca: TComboBox;
    dblckNacional: TwwDBLookupCombo;
    gbxNaturalidade: TGroupBox;
    Label3: TLabel;
    Label65: TLabel;
    dblckCidadeNasc: TwwDBLookupCombo;
    dblckNatural: TwwDBLookupCombo;
    Label18: TLabel;
    dblckGrauInstr: TwwDBLookupCombo;
    Label20: TLabel;
    dblckProfissao: TwwDBLookupCombo;
    Label34: TLabel;
    dblckSindi: TwwDBLookupCombo;
    gbxFiliacao: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    CdsUltEmpr: TCMClientDataSet;
    CdsMotivo: TCMClientDataSet;
    CdsPaises: TCMClientDataSet;
    CdsCidadeNasc: TCMClientDataSet;
    CdsEstadoNasc: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsSitFunc: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    CdsChefe: TCMClientDataSet;
    CdsSindicato: TCMClientDataSet;
    CdsGrauInstr: TCMClientDataSet;
    CdsProfissao: TCMClientDataSet;
    CdsFonteRecr: TCMClientDataSet;
    CdsEstab: TCMClientDataSet;
    CdsHorario: TCMClientDataSet;
    Label69: TLabel;
    CdsVincEmpr: TCMClientDataSet;
    Panel4: TPanel;
    chkGravaHstAltCad: TCheckBox;
    CdsMovContrCAGED: TCMClientDataSet;
    CdsTipoTrab: TCMClientDataSet;
    CdsSitRisco: TCMClientDataSet;
    CdsCatEmpr: TCMClientDataSet;
    CdsFaixaSal: TCMClientDataSet;
    CdsEstrangeiro: TCMClientDataSet;
    CdsDependentes: TCMClientDataSet;
    chkMarcaPonto: TDBCheckBox;
    lblBanco: TLabel;
    lblAgencia: TLabel;
    CdsCargo2: TCMClientDataSet;
    dsCargo2: TwwDataSource;
    dsCargo1: TwwDataSource;
    Label43: TLabel;
    Label47: TLabel;
    lblTipoDuracaoContr: TLabel;
    dbedDuracaoContr: TwwDBEdit;
    dbedProrr: TwwDBEdit;
    dbrgDeficienteFis: TGroupBox;
    dbcmbDeficFis: TwwDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure rgFGTSopcaoClick(Sender: TObject);
    procedure dblckSitFuncChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dbedFinalContrExit(Sender: TObject);
    procedure dbedDuracaoContrExit(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure dblckCCustoChange(Sender: TObject);
    procedure tbshEstrangeiroEnter(Sender: TObject);
    procedure dbrgNaturChange(Sender: TObject);
    procedure dbedDecrNaturKeyPress(Sender: TObject; var Key: Char);
    procedure dblckUltCargoCloseUp(Sender: TObject; LookupTable,FillTable: TDataSet;
      modified: Boolean);
    procedure spbtProcuraAgenciaSalarioClick(Sender: TObject);
    procedure mskedNumAgenciaSalarioExit(Sender: TObject);
    procedure mskedNumAgenciaSalarioEnter(Sender: TObject);
    procedure mskedNumContaSalarioExit(Sender: TObject);
    procedure dbedRetornoExit(Sender: TObject);
    procedure spedDiasExit(Sender: TObject);
    procedure dbedSalarioEnter(Sender: TObject);
    procedure rgInformaSalarioClick(Sender: TObject);
    procedure dblckFaixa1Change(Sender: TObject);
    procedure tbbtnConfInfoClick(Sender: TObject);
    procedure tbbtnCancelInfoClick(Sender: TObject);
    procedure dsSubTipoStateChange(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure dblckNacionalChange(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure dblckCargoChange(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeDetalheAtualizaBotoes(Sender: TObject);
    procedure dbedMatricExit(Sender: TObject);
    procedure CdsSubTipoAfterScroll(DataSet: TDataSet);
    procedure CdsPessoaFisicaAfterScroll(DataSet: TDataSet);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure cmbStepsChange(Sender: TObject);
  private
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlMotivo: TCtrlMotivo;
    CtrlPais: TCtrlPais;
    CtrlSitFunc: TCtrlSitFunc;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlGrInstr: TCtrlGrInstr;
    CtrlProfiss: TCtrlProfiss;
    CtrlFonte: TCtrlFonte;
    CtrlHoraTrab: TCtrlHoraTrab;
    CtrlPessoaFilialPessoa: TCtrlPessoaFilialPessoa;
    CtrlUltimosEmpregos: TCtrlUltimosEmpregos;
    CtrlVincEmpr: TCtrlVincEmpr;
    CtrlMovContrCAGED: TCtrlMovContrCAGED;
    CtrlTipoTrab: TCtrlTipoTrab;
    CtrlSitRisco: TCtrlSitRisco;
    CtrlCatEmprGRE: TCtrlCatEmprGRE;
    CtrlFaixaSal: TCtrlFaixaSal;
    CtrlPessoaDependente: TCtrlPessoaDependente;
    CtrlPessoaEstrangeiro: TCtrlPessoaEstrangeiro;
    CtrlIntegraPrevRH: TCtrlIntegraPrevRH;

    bFocoEmSalario: boolean;
    iPaisAntigo: integer;

    // Guarda os Dados da Conta Salário e Conta do FGTS
    sIdAgenciaSalario, sNumContaSalario, sNumAgenciaSalario,
    sIdAgenciaFGTS, sNumContaFGTS, sNumAgenciaFGTS: string;

    procedure SelHstDados;
    procedure SelHstAltCad(PrimeiraVez: boolean);
  protected
    procedure SelSubTipo(IdPessoa: double); override;
  public
    procedure SelFuncionario(IdPessoa: double);
  end;

var
  frmCadFunc: TfrmCadFunc;

implementation

uses uCMTypes, uSistema, uModulo, uMensErro, uDiasUteis, uCtrlFuncoesRH, uCtrlPadroes,
  fRegistraOcorr, fTelaAut, uCtrlPessoa, uCtrlPessoaFuncionario, uCtrlUsoGeralRH, dCds,
  fAguarde;

{$R *.DFM}

procedure TfrmCadFunc.FormCreate(Sender: TObject);
var
  c: integer;
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CtrlPais := TCtrlPais.Create;
  CtrlPais.InitializeAs(Padroes);

  CtrlSitFunc := TCtrlSitFunc.Create;
  CtrlSitFunc.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlGrInstr := TCtrlGrInstr.Create;
  CtrlGrInstr.InitializeAs(Padroes);

  CtrlProfiss := TCtrlProfiss.Create;
  CtrlProfiss.InitializeAs(Padroes);

  CtrlFonte := TCtrlFonte.Create;
  CtrlFonte.InitializeAs(Padroes);

  CtrlHoraTrab := TCtrlHoraTrab.Create;
  CtrlHoraTrab.InitializeAs(Padroes);

  CtrlPessoaFilialPessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaFilialPessoa.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlVincEmpr := TCtrlVincEmpr.Create;
  CtrlVincEmpr.InitializeAs(Padroes);

  CtrlMovContrCAGED := TCtrlMovContrCAGED.Create;
  CtrlMovContrCAGED.InitializeAs(Padroes);

  CtrlTipoTrab := TCtrlTipoTrab.Create;
  CtrlTipoTrab.InitializeAs(Padroes);

  CtrlSitRisco := TCtrlSitRisco.Create;
  CtrlSitRisco.InitializeAs(Padroes);

  CtrlCatEmprGRE := TCtrlCatEmprGRE.Create;
  CtrlCatEmprGRE.InitializeAs(Padroes);

  CtrlFaixaSal := TCtrlFaixaSal.Create(Sistema.IdEmpresa);
  CtrlFaixaSal.InitializeAs(Padroes);

  CtrlPessoaDependente := TCtrlPessoaDependente.Create;
  CtrlPessoaDependente.InitializeAs(Padroes);

  CtrlPessoaEstrangeiro := TCtrlPessoaEstrangeiro.Create;
  CtrlPessoaEstrangeiro.InitializeAs(Padroes);

  CtrlUltimosEmpregos := TCtrlUltimosEmpregos.Create;
  CtrlUltimosEmpregos.InitializeAs(Padroes);
  CtrlUltimosEmpregos.CdsUltimosEmpregos := CdsUltEmpr;

  Pessoa := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral, true, true);
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stFuncionario;
  Pessoa.TipoPessoa := tpFisica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;
  Pessoa.ObrigaDocumento := true;

  CtrlIntegraPrevRH := TCtrlIntegraPrevRH.Create;
  CtrlIntegraPrevRH.InitializeAs(Padroes);

  TCtrlPessoaFuncionario(Pessoa).CdsEstrangeiro := CdsEstrangeiro;
  TCtrlPessoaFuncionario(Pessoa).CdsUltEmpr := CdsUltEmpr;
  inherited;
  case (Sistema.IdModulo) of
    MODAUTO :
    begin
      HelpContext := 4170005;
      bbtnAjuda.HelpContext := 4170005;
    end;
    MODFOL :
    begin
      HelpContext := 210007;
      bbtnAjuda.HelpContext := 210007;
    end;
  end;

  Pessoa.SaveModuloRespon := (Modulo.IdContraCheque = FCRT);
  chkGravaHstAltCad.Checked := (Modulo.IdContraCheque = FUNCEF);

  MontaSelect.SensivelACaixa[0] := 'N';
  MontaSelect.SensivelACaixa[1] := 'N';
  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' +CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' +CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));
    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
    Add('FUNCIONARIO.IDSITFUNC = SITFUNC.IDSITFUNC(+)');
  end;

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('*');
  CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa),'',false,true);
  CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('D,A');
  CdsSitFunc.Data := CtrlSitFunc.ListGeral(0, '', 'R,G');
  CdsCargo.Data := CtrlCargo.ListCargo;
  CdsCargo2.Data := CtrlCargo.ListCargo;
  CdsSindicato.Data := CtrlPessoaSindicato.ListPessoaSindicato;
  CdsGrauInstr.Data := CtrlGrInstr.ListGrauInstrucao;
  CdsProfissao.Data := CtrlProfiss.ListProfissao;
  CdsFonteRecr.Data := CtrlFonte.ListGeral;
  CdsHorario.Data := CtrlHoraTrab.ListHoraTrab;
  CdsChefe.Data := TCtrlPessoaFuncionario(Pessoa).ListChefe(Sistema.IdEmpresa);
  CdsEstab.Data := CtrlPessoaFilialPessoa.ListPessoaEstab(IntToStr(Sistema.IdEmpresa));
  CdsVincEmpr.Data := CtrlVincEmpr.ListGeral;
  CdsMovContrCAGED.Data := CtrlMovContrCAGED.ListGeral;
  CdsTipoTrab.Data := CtrlTipoTrab.ListGeral;
  CdsSitRisco.Data := CtrlSitRisco.ListGeral;
  CdsCatEmpr.Data := CtrlCatEmprGRE.ListGeral;
  CdsBanco.Data := CtrlListTerceirosRH.ListBancoComMasc;

  iPaisAntigo := -1;
  dblckNacional.OnChange := nil;
  CdsPaises.Data := CtrlPais.ListaPais;
  dblckNacional.OnChange := dblckNacionalChange;
  dblckNacionalChange(Sender);

  case (CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger) of
    1 : lblTipoDuracaoContr.Caption := '(Dias)';
    2 : lblTipoDuracaoContr.Caption := '(Semanas)';
    3 : lblTipoDuracaoContr.Caption := '(Meses)';
    4 : lblTipoDuracaoContr.Caption := '(Anos)';
  end;

  gbxCargo2.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);
  gbxFaixa1.Visible := (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
                       (Modulo.IdContraCheque = FUNCEF);
  gbxFaixa2.Visible := (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1);// and
  //                     (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1);

  if  (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1)  then
  begin
    CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal;
    dblckFaixa1.Selected.Clear;
    dblckFaixa1.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
    dblckFaixa1.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

    for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
      dblckFaixa1.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
        CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

    if (CdsParamRH.FieldByName('FLGNIVELINDIV').asInteger = 1) or
       (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    begin
      dblckFaixa2.Selected.Clear;
      dblckFaixa2.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa2.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa2.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);
    end;

    dbspeStep1.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
    dbspeStep2.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
  end
  else
  begin
    if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    begin
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal;
      dblckFaixa2.DataSource := nil;
      dblckFaixa2.DataField  := '';
      dblckFaixa2.DataSource := dsCargo2;
      dblckFaixa2.DataField  := 'IDFAIXASALARIAL';
      dblckFaixa2.ReadOnly := true;
      dblckFaixa2.Selected.Clear;
      dblckFaixa2.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa2.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa2.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

      dbspeStep2.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
    end;
    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      CdsFaixaSal.Data := CtrlFaixaSal.ListFaixaSal;
      dblckFaixa1.DataSource := nil;
      dblckFaixa1.DataField  := '';
      dblckFaixa1.DataSource := dsCargo1;
      dblckFaixa1.DataField  := 'IDFAIXASALARIAL';
      dblckFaixa1.ReadOnly := true;
      dblckFaixa1.Selected.Clear;
      dblckFaixa1.Selected.Add('IDFAIXASALARIAL' +#9+'06'+#9+ 'Código');
      dblckFaixa1.Selected.Add('DATAEFETIV' +#9+'15'+#9+ 'Data Efetivação');

      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        dblckFaixa1.Selected.Add('STEP' + IntToStr(c) +#9+'15'+#9+
          CdsParamRH.FieldByName('TITSTEP' + IntToStr(c)).asString);

      dbspeStep1.MaxValue := CdsParamRH.FieldByName('NUMSTEPS').asInteger;
    end;
  end;

  pgctrlDadosPess.ActivePageIndex := 0;
  gbxOpcoes.Visible := (Modulo.IdContraCheque = FUNCEF);

  // Chamada do Empregado Identificado
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
    SelPessoa(StrToFloat(CtrlUsoGeralRH.IdUsuarioGeral));
end;

procedure TfrmCadFunc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlMotivo);
  FreeAndNil(CtrlPais);
  FreeAndNil(CtrlListTerceirosRH);
  FreeAndNil(CtrlSitFunc);
  FreeAndNil(CtrlCargo);
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlGrInstr);
  FreeAndNil(CtrlProfiss);
  FreeAndNil(CtrlFonte);
  FreeAndNil(CtrlHoraTrab);
  FreeAndNil(CtrlPessoaFilialPessoa);
  FreeAndNil(CtrlUltimosEmpregos);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlVincEmpr);
  FreeAndNil(CtrlMovContrCAGED);
  FreeAndNil(CtrlTipoTrab);
  FreeAndNil(CtrlSitRisco);
  FreeAndNil(CtrlCatEmprGRE);
  FreeAndNil(CtrlFaixaSal);
  FreeAndNil(CtrlPessoaDependente);
  FreeAndNil(CtrlPessoaEstrangeiro);
  FreeAndNil(CtrlIntegraPrevRH);
  inherited;
end;

procedure TfrmCadFunc.FormShow(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := false;
  dbcmbTipoSang.Enabled := false;
  mskedNumAgenciaSalario.Enabled := false;
  mskedNumContaSalario.Enabled := false;
  spbtProcuraAgenciaSalario.Enabled := false;
  mskedNumAgenciaFGTS.Enabled := false;
  mskedNumContaFGTS.Enabled := false;
  spbtProcuraAgenciaFGTS.Enabled := false;
  spedDias.Enabled := false;
  spedDias.Value := 0;
  CmeCadastro.Operacao := opIdle;
  CmeCadastroAtualizaBotoes(Sender);
end;

procedure TfrmCadFunc.CmeCadastroFind(Sender: TObject);
var
  sPercREB, sDataAssoc: string;
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    TCtrlPessoaFuncionario(Pessoa).MudouEnderecoResidencial := false;
    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;

    if (Modulo.IdContraCheque = FUNCEF) then
    begin
      // Pego o Tipo de Ticket
      edOpcaoTicket.Text := CtrlListTerceirosRH.GetOpcaoTicket(MontaSelect.ValoresChave[1]);
      // Pego o Perc. REB e Data Assoc.
      CtrlListTerceirosRH.GetPercREB_DataAssoc(MontaSelect.ValoresChave[1], sPercREB, sDataAssoc);
      edOpcoesPerc.Text := sPercREB;
      edOpcoesDataAssoc.Text := sDataAssoc;
    end;
  end;
end;

procedure TfrmCadFunc.CmeDetalheAtualizaBotoes(Sender: TObject);
var
  bAltContaSalario: boolean;
begin
  inherited;
  if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
  begin
    if (pgctrlDetalhe.ActivePage = tbsDet) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgEnderIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgEnderAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgEnderExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsTelefone) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgTelefIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgTelefAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgTelefExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsContato) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgConttIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgConttAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgConttExc').asInteger = 1);
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsDadosPess) then
      gbxDepend.Enabled := false
    else
    if (pgctrlDetalhe.ActivePage = tbsSitFunc) then
      tbsSitFunc.Enabled := false
    else
    if (pgctrlDetalhe.ActivePage = tbshOutros) then
    begin
      bAltContaSalario := (CdsParamRH.FieldByName('FlgCtSalAlt').asInteger = 1) and (CdsSubTipo.State in [dsInsert,dsEdit]);
      dblckBancoSalario.ReadOnly := not(bAltContaSalario);
      dblckBancoSalario.Enabled := bAltContaSalario;
      dblckBancoSalario.TabStop := bAltContaSalario;
      mskedNumAgenciaSalario.ReadOnly := not(bAltContaSalario);
      mskedNumAgenciaSalario.Enabled := bAltContaSalario;
      mskedNumAgenciaSalario.TabStop := bAltContaSalario;
      mskedNumContaSalario.ReadOnly := bAltContaSalario;
      mskedNumContaSalario.Enabled := bAltContaSalario;
      mskedNumContaSalario.TabStop := bAltContaSalario;
      spbtProcuraAgenciaSalario.Enabled := bAltContaSalario;
    end
    else
    if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
    begin
      sbtnInsDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgIns').asInteger = 1);
      sbtnAltDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgAlt').asInteger = 1);
      sbtnExcluiDet.Enabled := (CdsParamRH.FieldByName('FlgEmprgExc').asInteger = 1);
    end;
  end;
end;

procedure TfrmCadFunc.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CdsSubTipo.FieldByName('TIPOPAGAMENTO').asString := 'M';
  if (CdsParamRH.FieldByName('FLGNUMERAMATRIC').asInteger = 1) then
    dbedMatric.Text := TCtrlPessoaFuncionario(Pessoa).GetProxMatricula(
      CdsParamRH.FieldByName('TAMANHOMATRIC').asInteger);
end;

procedure TfrmCadFunc.dsStateChange(Sender: TObject);
begin
  inherited;
  cmbRaca.Enabled := (Cds.State in [dsInsert,dsEdit]);
  dbcmbTipoSang.Enabled := cmbRaca.Enabled;
  mskedNumAgenciaSalario.Enabled := cmbRaca.Enabled;
  mskedNumContaSalario.Enabled := cmbRaca.Enabled;
  spbtProcuraAgenciaSalario.Enabled := cmbRaca.Enabled;
  mskedNumAgenciaFGTS.Enabled := cmbRaca.Enabled;
  mskedNumContaFGTS.Enabled := cmbRaca.Enabled;
  spbtProcuraAgenciaFGTS.Enabled := cmbRaca.Enabled;
  spedDias.Enabled := cmbRaca.Enabled;
end;

procedure TfrmCadFunc.dsSubTipoStateChange(Sender: TObject);
begin
  inherited;
  dbedSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dblckBancoSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dblckBancoFGTS.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
  dbedValFG.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
end;

procedure TfrmCadFunc.CdsSubTipoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if (CdsSubTipo.Active) then
  begin
    lblDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
    dbedDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
    dbedSalario.Enabled := (CdsSubTipo.State in [dsInsert,dsEdit]);
    dbedRetornoExit(nil);
  end;
end;

procedure TfrmCadFunc.CdsPessoaFisicaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '2') then
    cmbRaca.ItemIndex := 0
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '4') then
    cmbRaca.ItemIndex := 1
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '6') then
    cmbRaca.ItemIndex := 2
  else
  if (CdsPessoaFisica.FieldByName('CORPESSOA').asString = '0') then
    cmbRaca.ItemIndex := 4
  else
    cmbRaca.ItemIndex := 3;
end;

procedure TfrmCadFunc.dblckCCustoChange(Sender: TObject);
begin
  if (Trim(dblckCCusto.Text) <> '') then
  begin
    CdsCCusto.Locate('CODCENTROCUSTO', dblckCCusto.Text, []);
    edNomeCCusto.Text := CdsCCusto.FieldByName('NOME').asString;
  end
  else
    edNomeCCusto.Text := '';
end;

procedure TfrmCadFunc.dblckNacionalChange(Sender: TObject);
begin
  gbxNaturalidade.Enabled := (Trim(dblckNacional.Text) <> '') or
    (CdsPessoaFisica.FieldByName('IdPessoa').IsNull);

  if (iPaisAntigo <> CdsPaises.FieldByName('IDPAIS').asInteger) or
     (gbxNaturalidade.Enabled) then
  begin
    iPaisAntigo := CdsPaises.FieldByName('IDPAIS').asInteger;
    CdsEstadoNasc.Data := CtrlListTerceirosRH.ListEstado(
      CdsPaises.FieldByName('IDPAIS').asInteger);

    CdsCidadeNasc.Data := CtrlListTerceirosRH.ListCidadeNasc(
      CdsPaises.FieldByName('IDPAIS').asInteger);

    if (CdsPessoaFisica.State in [dsInsert, dsEdit]) then
    begin
      CdsPessoaFisica.FieldByName('CODESTADO').Clear;
      CdsPessoaFisica.FieldByName('IDCIDADES').Clear;
    end;
  end;
end;

procedure TfrmCadFunc.dblckCargoChange(Sender: TObject);
begin
  if not(CdsCargo.Active) or (CdsCargo.FieldByName('CBO2002').IsNull) then
    gbxCargo.Caption := 'Cargo'
  else
    gbxCargo.Caption := 'Cargo (CBO: ' +CdsCargo.FieldByName('CBO2002').asString+ ')';
end;

procedure TfrmCadFunc.dblckSitFuncChange(Sender: TObject);
begin
  if (Cds.State in [dsEdit, dsInsert]) then
    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := true;
end;

procedure TfrmCadFunc.dbrgNaturChange(Sender: TObject);
begin
  dbedDecrNatur.Enabled := (dbrgNatur.ItemIndex = 0);
end;

procedure TfrmCadFunc.dblckFaixa1Change(Sender: TObject);
begin
  if not(CdsSubTipo.Active) or (Cds.State = dsBrowse) then
    exit;

  if not(CdsSubTipo.IsEmpty) and (Trim(dblckFaixa1.Text) <> '') then
  begin
    if (CdsSubTipo.FieldByName('NIVELINDIV1').asInteger = 0) then
      CdsSubTipo.FieldByName('NIVELINDIV1').asInteger := 1;

    CdsSubTipo.FieldByName('SALARIOATUAL').asFloat :=
      StrToFloat(FU.TiraCaracter(CdsFaixaSal.FieldByName('STEP' +
      CdsSubTipo.FieldByName('NIVELINDIV1').asString).asString,'.'));
  end
  else
    CdsSubTipo.FieldByName('SALARIOATUAL').Clear;
end;

procedure TfrmCadFunc.dbedDecrNaturKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9']) then
    Key := #0;
end;

procedure TfrmCadFunc.dblckUltCargoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: boolean);
begin
  if (Modified) and (Trim(dblckUltCargo.Text) <> '') and
     (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
    CdsUltEmpr.FieldbyName('CARGO').asString := dblckUltCargo.Text;
end;

procedure TfrmCadFunc.dbedSalarioEnter(Sender: TObject);
begin
  if not(CdsSubTipo.Active) or (bFocoEmSalario) then
  begin
    bFocoEmSalario := false;
    exit;
  end;

  if not(CdsSubTipo.IsEmpty) and (Cds.State <> dsBrowse) and (((gbxFaixa1.Visible) and
    (Trim(dblckFaixa1.Text) <> '')) or not(CdsSubTipo.FieldByName('IDCARGO').IsNull)) then
  begin
    dbedSalario.Enabled := true;
    pnlAlteraSal.Visible := true;
    rgInformaSalario.ItemIndex := 0;
    rgInformaSalario.SetFocus;
  end;
end;

procedure TfrmCadFunc.tbshEstrangeiroEnter(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
    if (CdsEstrangeiro.IsEmpty) then
    begin
      CdsEstrangeiro.Insert;
      CdsEstrangeiro.FieldByName('FLGNATURALIZADO').asInteger := 1;
      CdsEstrangeiro.FieldByName('FLGCASADOBRASILEIRO').asInteger := 1;
      CdsEstrangeiro.FieldByName('FLGCASADOBRASILEIRO').asInteger := 1;
    end
    else
      CdsEstrangeiro.Edit;
  end;
end;

procedure TfrmCadFunc.mskedNumAgenciaSalarioEnter(Sender: TObject);
begin
  if (TMaskEdit(Sender).Name = 'mskedNumAgenciaSalario') then
    sNumAgenciaSalario := Trim(mskedNumAgenciaSalario.Text)
  else
    sNumAgenciaFGTS := Trim(mskedNumAgenciaFGTS.Text);
end;

procedure TfrmCadFunc.mskedNumAgenciaSalarioExit(Sender: TObject);
var
  sNumAgencia: string;
  IdAgenciaBancaria: double;
begin
  if (TMaskEdit(Sender).Name = 'mskedNumAgenciaSalario') then
    sNumAgencia := sNumAgenciaSalario
  else
    sNumAgencia := sNumAgenciaFGTS;

  if (Trim(TMaskEdit(Sender).Text) <> '') and (sNumAgencia <> Trim(TMaskEdit(Sender).Text)) then
  begin
    IdAgenciaBancaria := CtrlListTerceirosRH.GetIdAgenciaBancaria(TMaskEdit(Sender).Text);
    if (IdAgenciaBancaria = 0) then
    begin
      MsgDlg('Agência não cadastrada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
      TMaskEdit(Sender).Text := sNumAgencia;
      TMaskEdit(Sender).SetFocus;
    end
    else
      sNumAgencia := FloatToStr(IdAgenciaBancaria);
  end
  else
    sNumAgencia := '';

  if (TMaskEdit(Sender).Name = 'mskedNumAgenciaSalario') then
    sIdAgenciaSalario := sNumAgencia
  else
    sIdAgenciaFGTS := sNumAgencia;
end;

procedure TfrmCadFunc.mskedNumContaSalarioExit(Sender: TObject);
begin
  if (TMaskEdit(Sender).Name = 'mskedNumContaSalario') then
    sNumContaSalario := Trim(mskedNumContaSalario.Text)
  else
    sNumContaFGTS := Trim(mskedNumContaFGTS.Text);
end;

procedure TfrmCadFunc.dbedMatricExit(Sender: TObject);
var
  dIdPessoa: double;
begin
  dIdPessoa := TCtrlPessoaFuncionario(Pessoa).GetMatriculaJaExiste(dbedMatric.Text,
    Sistema.IdEmpresa);

  if (dIdPessoa > 0) and (dIdPessoa <> Cds.FieldByName('IDPESSOA').asFloat) then
  begin
    MsgDlg('Matrícula já cadastrada para esta Empresa.' +CR_LF+ 'Informe outra.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    dbedMatric.SetFocus;
  end;
end;

procedure TfrmCadFunc.dbedFinalContrExit(Sender: TObject);
var
  iDuracao: integer;
begin
  if (dbedFinalContr.Text <> '') and not(Cds.IsEmpty) then
  begin
    iDuracao := TCtrlPessoaFuncionario(Pessoa).SetDuracaoContrato(dbedDatAdmis.Date,
      dbedFinalContr.Date, CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger);
    if (FU.StrInt(dbedDuracaoContr.Text) > 0) and
       (iDuracao > FU.StrInt(dbedDuracaoContr.Text)) then
      CdsSubTipo.FieldByName('PRORROGCONTRATO').asInteger :=
        iDuracao - FU.StrInt(dbedDuracaoContr.Text)
    else
    begin
      CdsSubTipo.FieldByName('PRORROGCONTRATO').asInteger := 0;
      CdsSubTipo.FieldByName('DURACAOCONTRATO').asInteger := iDuracao;
    end;
  end;
end;

procedure TfrmCadFunc.dbedDuracaoContrExit(Sender: TObject);
var
  DataIni: TDate;
begin
  if not(Cds.IsEmpty) then
  begin
    if (dbedDatAdmis.Text <> '') then
      DataIni := StrToDate(dbedDatAdmis.Text)
    else
      DataIni := Date;

    TCtrlPessoaFuncionario(Pessoa).SetDataFinalContrato(DataIni,
      FU.StrInt(dbedDuracaoContr.Text) + FU.StrInt(dbedProrr.Text),
      CdsParamRH.FieldByName('INDDURACAOCONTR').asInteger);

    dbedFinalContr.Text := CdsSubTipo.FieldByName('DATAFIMCONTRATO').asString;
  end;
end;

procedure TfrmCadFunc.dbedRetornoExit(Sender: TObject);
begin
  if (Trim(dbedRetorno.Text) <> '') and (Trim(dbedDatSaida.Text) <> '') then
    spedDias.Value := DiasUteis.IntervaloDias(StrToDate(dbedDatSaida.Text),
      StrToDate(dbedRetorno.Text))
  else
    spedDias.Value := 0;
end;

procedure TfrmCadFunc.spedDiasExit(Sender: TObject);
begin
  if (Trim(spedDias.Text) <> '') and (Trim(dbedDatSaida.Text) <> '') then
    CdsSubTipo.FieldByName('DATARETORNO').asDateTime :=
      StrToDate(dbedDatSaida.Text) + StrToInt(spedDias.Text)
  else
    CdsSubTipo.FieldByName('DATARETORNO').Clear;
end;

procedure TfrmCadFunc.spbtProcuraAgenciaSalarioClick(Sender: TObject);
var
  lookAux: TwwDBLookupCombo;
begin
  if (TSpeedButton(Sender).Name = 'spbtProcuraAgenciaSalario') then
    lookAux := dblckBancoSalario
  else
    lookAux := dblckBancoFGTS;

  if (Trim(lookAux.Text) <> '') then
  begin
    msAgencia.Filtro.Clear;
    msAgencia.Filtro.Add('BANCO.IDPESSOA           = ' +lookAux.LookupValue);
    msAgencia.Filtro.Add('BANCO.IDPESSOA           = AGENCIABANCARIA.IDBANCO');
    msAgencia.Filtro.Add('AGENCIABANCARIA.IDPESSOA = PESSOA.IDPESSOA');
    msAgencia.Executar;

    if (msAgencia.RetornouValor) then
    begin
      if (TSpeedButton(Sender).Name = 'spbtProcuraAgenciaSalario') then
      begin
        sIDAgenciaSalario := msAgencia.ValoresChave[1];
        mskedNumAgenciaSalario.Text := msAgencia.ValoresChave[0];
      end
      else
      begin
        sIDAgenciaFGTS := msAgencia.ValoresChave[1];
        mskedNumAgenciaFGTS.Text := msAgencia.ValoresChave[0];
      end;
    end;
  end;
end;

procedure TfrmCadFunc.rgFGTSopcaoClick(Sender: TObject);
begin
  lblDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
  dbedDatOpc.Visible := (rgFGTSopcao.ItemIndex = 0);
end;

procedure TfrmCadFunc.rgInformaSalarioClick(Sender: TObject);
var
  c: integer;
begin
  cmbSteps.Text := '';
  cmbSteps.Enabled := (rgInformaSalario.ItemIndex = 1);

  if (rgInformaSalario.ItemIndex = 1) then
  begin
    cmbSteps.Items.Clear;
    dmCds.Cds.Data := CtrlFaixaSal.ListFaixaCargo(CdsSubTipo.FieldByName('IDCARGO').asFloat);
    if not(dmCds.Cds.IsEmpty) then
    begin
      for c:=1 to CdsParamRH.FieldByName('NUMSTEPS').asInteger do
        cmbSteps.Items.Add(FormatFloat('#0.00',
          dmCds.Cds.FieldByName('STEP' +IntToStr(c)).asFloat));
    end
    else
    begin
      MsgDlg('Não Existe Faixa Salarial Associada.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
      rgInformaSalario.SetFocus;
    end;
  end;
end;

procedure TfrmCadFunc.tbbtnConfInfoClick(Sender: TObject);
begin
  if (rgInformaSalario.ItemIndex = 1) and (Trim(cmbSteps.Text) <> '') then
    CdsSubTipo.FieldByName('SALARIOATUAL').asFloat :=
      StrToFloat(FU.TiraCaracter(cmbSteps.Text,'.'));
  tbbtnCancelInfoClick(Sender);
  tbbtnConfInfo.Down := false;
end;

procedure TfrmCadFunc.tbbtnCancelInfoClick(Sender: TObject);
begin
  pnlAlteraSal.Visible := false;
  dbedSalario.Enabled := true;
  bFocoEmSalario := true;
  dbedSalario.SetFocus;
  tbbtnCancelInfo.Down := false;
end;

procedure TfrmCadFunc.sbtnInserirClick(Sender: TObject);
begin
  SelHstAltCad(true);
  inherited;
end;

procedure TfrmCadFunc.sbtnAlterarClick(Sender: TObject);
begin
  SelHstAltCad(true);
  inherited;
end;

procedure TfrmCadFunc.bbtnOkDetClick(Sender: TObject);
begin
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    TCtrlPessoaFuncionario(Pessoa).GuardarAlteracaoEndereco
  else
  if (pgctrlDetalhe.ActivePage = tbsUltEmpr) then
  begin
    if (CdsUltEmpr.FieldByName('NUMSEQ').IsNull) then
    begin
      MsgDlg('Número de Sequência deve ser preenchido.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
      dbedNumSeq.SetFocus;
      exit;
    end;
  end;
  inherited;
end;

procedure TfrmCadFunc.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  if (Cds.State = dsInsert) and (CdsSubTipo.FieldByName('IDMOTIVODESLIGRAIS').IsNull) then
  begin
    MsgDlg('Você deve selecionar o Motivo Oficial da Admissão.', 'Aviso',
      mtWarning, [mbOk,mbHelp], 0);
    tbcDetalhe.TabIndex := 7;
    pgctrlDetalhe.ActivePageIndex := 7;
    dblckMotivo1.SetFocus;
    exit;
  end;

  //(2->Branca; 4->Preta; 6->Amarela; 8->Parda; 0->Indígena)
  case (cmbRaca.ItemIndex) of
    0 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 2;
    1 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 4;
    2 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 6;
    4 :  CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 0;
    else CdsPessoaFisica.FieldByName('CORPESSOA').asInteger := 8;
  end;

  // Conta Salário e Conta FGTS
  CdsSubTipo.FieldByName('NUMCONTASALARIO').asString := sNumContaSalario;
  CdsSubTipo.FieldByName('IDAGENCIASALARIO').asString := sIDAgenciaSalario;
  CdsSubTipo.FieldByName('NUMCONTAFGTS').asString := sNumContaFGTS;
  CdsSubTipo.FieldByName('IDAGENCIAFGTS').asString := sIDAgenciaFGTS;

  CdsPessoaFisica.FieldByName('IDESTADO').Clear;
  if (CdsSubTipo.FieldByName('IDEMPRESA').IsNull) then
    CdsSubTipo.FieldByName('IDEMPRESA').asInteger := Sistema.IdEmpresa;

  bInserindo := (Cds.State = dsInsert);
  SelHstAltCad(false);
  SelHstDados;

  if not(bInserindo) and (TCtrlPessoaFuncionario(Pessoa).MudouSituacao) and
     (CdsSitFunc.FieldByName('TipoSit').asString = 'F') and
     (Copy(CdsParamRH.FieldByName('MATRDIS').asString,7,1) < '6') then
    TfrmRegistraOcorr.RegistrarOcorrenciaMedica(Cds.FieldByName('IDPESSOA').asFloat,
      Cds.FieldByName('NOME').asString, dbedDatSaida.Date, dbedRetorno.Date);

  TCtrlPessoaFuncionario(Pessoa).PassouGravacao := false;
  inherited;

  if (TCtrlPessoaFuncionario(Pessoa).PassouGravacao) then
  begin
    if not(TCtrlPessoaFuncionario(Pessoa).GravarHistorico(
           chkGravaHstAltCad.Checked, bInserindo, Sistema.IdEmpresa)) then
      MsgDlg(TCtrlPessoaFuncionario(Pessoa).MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

    TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;
  end;

  // Chama a rotina de integraçao dos sistemas previdenciários com os sistemas
  // de RH e Folha de Pagamento de uma Fundação
  if (Sistema.TipoEmpresa = 'P') then
  begin
    frmAguarde.Mostra('Atualizando o Cadastro do Funcionário no Previdenciário');
    frmAguarde.Pos := 0;

    if not(CtrlIntegraPrevRH.AtualizaDadosPrevFuncionario(
           Sistema.IdEmpresa, TCtrlPessoaFuncionario(Pessoa).IdPessoa)) then
      MsgDlg(CtrlIntegraPrevRH.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);

    frmAguarde.Apaga;
  end;
end;

procedure TfrmCadFunc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);

  TCtrlPessoaFuncionario(Pessoa).MudouSituacao := false;
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadFunc.SelFuncionario(IdPessoa: double);
begin
  SelPessoa(IdPessoa);
end;

procedure TfrmCadFunc.SelSubTipo(IdPessoa: double);
begin
  inherited;
  CdsSubTipo.Data := TCtrlPessoaFuncionario(Pessoa).ListFuncionario(FloatToStr(IdPessoa));
  CdsUltEmpr.Data := CtrlUltimosEmpregos.ListUltimosEmpregos(IdPessoa);
  CdsDependentes.Data := CtrlPessoaDependente.SelDependentesPessoa(IdPessoa);
  CdsEstrangeiro.Data := CtrlPessoaEstrangeiro.SelEstrangeiro(IdPessoa);
  dbrgNaturChange(nil);

  // Pego a Agência e Banco para a Conta Salário
  if not(CdsSubTipo.FieldByName('IDAGENCIASALARIO').IsNull) then
  begin
    dmCds.Cds.Data := CtrlListTerceirosRH.ListIdAgencia_e_NumBanco(
      CdsSubTipo.FieldByName('IDAGENCIASALARIO').asFloat);

    sIDAgenciaSalario := CdsSubTipo.FieldByName('IDAGENCIASALARIO').asString;
    mskedNumAgenciaSalario.Text := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
    dblckBancoSalario.LookUpValue := dmCds.Cds.FieldByName('IDBANCO').asString;
  end
  else
  begin
    mskedNumContaSalario.Text := '';
    sNumContaSalario := '';
    sIDAgenciaSalario := '';
    mskedNumAgenciaSalario.Text := '';
    dblckBancoSalario.LookUpValue := '-1';
  end;

  // Pego a Agência e Banco para a Conta para o FGTS
  if not(CdsSubTipo.FieldByName('IDAGENCIAFGTS').IsNull) then
  begin
    dmCds.Cds.Data := CtrlListTerceirosRH.ListIdAgencia_e_NumBanco(
      CdsSubTipo.FieldByName('IDAGENCIAFGTS').asFloat);

    sIDAgenciaFGTS := CdsSubTipo.FieldByName('IDAGENCIAFGTS').asString;
    mskedNumAgenciaFGTS.Text := dmCds.Cds.FieldByName('NUMAGENCIA').asString;
    dblckBancoFGTS.LookUpValue := dmCds.Cds.FieldByName('IDBANCO').asString;
  end
  else
  begin
    mskedNumContaFGTS.Text := '';
    sNumContaFGTS := '';
    sIDAgenciaFGTS := '';
    mskedNumAgenciaFGTS.Text := '';
    dblckBancoFGTS.LookUpValue := '-1';
  end;

  mskedNumContaSalario.Text := CdsSubTipo.FieldByName('NUMCONTASALARIO').asString;
  sNumContaSalario := mskedNumContaSalario.Text;
  mskedNumContaFGTS.Text := CdsSubTipo.FieldByName('NUMCONTAFGTS').asString;
  sNumContaFGTS := mskedNumContaFGTS.Text;

  dblckBancoFGTS.Update;
  dblckBancoSalario.Update;
end;

procedure TfrmCadFunc.SelHstDados;
begin
  // Obtém os Dados necessários à alteração da Evolução Funcional
  TCtrlPessoaFuncionario(Pessoa).SelDadosEvolFunc;
  // Obtém os Dados necessários à alteração da Situação Funcional
  TCtrlPessoaFuncionario(Pessoa).SelDadosSitFunc(CdsSitFunc.FieldByName('TIPOSIT').asString);
end;

procedure TfrmCadFunc.SelHstAltCad(PrimeiraVez: boolean);
begin
  // Obtém o Número dos documentos que podem ser alterados
  TCtrlPessoaFuncionario(Pessoa).SelHstDocumentos(PrimeiraVez);
  // Obtém campos iniciais que podem ser alterados
  TCtrlPessoaFuncionario(Pessoa).SelHstAltCad(
    PrimeiraVez,
    CdsSubTipo.FieldByName('MATRICULA').asString,
    Cds.FieldByName('NOME').asString,
    CdsPessoaFisica.FieldByName('DATANASC').asDateTime,
    CdsSubTipo.FieldByName('DATAADMISSAO').asDateTime,
    CdsHorario.FieldByName('NOMEHORARIO').asString,
    CdsChefe.FieldByName('NOME').asString,
    CdsGrauInstr.FieldByName('DESCRICAO').asString,
    CdsPessoaFisica.FieldByName('ESTCIVIL').asString,
    CdsSindicato.FieldByName('RAZAOSOCIAL').asString,
    CdsProfissao.FieldByName('DESCRICAO').asString,
    CdsPessoaFisica.FieldByName('NUMDEPIRRF').asInteger,
    CdsPessoaFisica.FieldByName('NUMDEPSALF').asInteger);
end;

procedure TfrmCadFunc.cmbStepsChange(Sender: TObject);
begin
  inherited;
  dbspeStep1.Value := cmbSteps.ItemIndex + 1;
end;

end.
