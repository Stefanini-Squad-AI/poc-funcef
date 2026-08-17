{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------

 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 N. SIG             : 90602
 Data da Alteração  : 20/08/2019
 Alteração Form     : fCadFilial
 Responsável        : Everson Cunha
 Descrição          : Correção Cadastro de Estabelecimento
--------------------------------------------------------------------------------
 Rotina             : dbcmbTipoChange,
                      dbcmbTipo (adicionado item Processo FAP - F)
 N. SIG             : 70569
 Data da Alteração  : 28/06/2018
 Alteração Form     : fCadFilial
 Responsável        : Everson Luiz Pereira da Cunha
 Descrição          : Melhorias no cadastro de processos para adequação a
                      versão 2.4.02 do manual do eSocial
--------------------------------------------------------------------------------
 Rotina             : dbcmbTipoChange, LimpaCamposProcessos, bbtnOkDetClick,
                      VerificaPreenchimentoProcessos, sbtnAltDetClick,
 N. SIG             : 62232
 Data da Alteração  : 07/02/2018
 Alteração Form     : fCadFilial
 Responsável        : Cássio Florêncio Rovaroto e Everson Luiz Pereira da Cunha
 Descrição          : Retirada do campo "Contribuição abrangida pela decisão"
                      da aba "Processos".
--------------------------------------------------------------------------------
 Rotina             : dbcmbTipoChange, dbLkpCbxIndSuspChange,
                      btnDockIndSuspVoltarClick, btnDockIndSuspOKClick,
                      LimpaCamposProcessos, dbcmbCidadesProcExit,
 	 				  toolbtnInserirIndSuspClick, toolbtnAlterarIndSuspClick,
  					  toolbtnExcluirIndSuspClick, sbtnInsDetClick,
                      sbtnAltDetClick, CmeDetalheDelete,
                      VerificaPreenchimentoProcessos, pgctrlProcessosChange,
 					  bbtnCancelarDetClick
 N. SIG             : 38475.60441
 Data da Alteração  : 27/12/2017
 Alteração Form     : fCadFilial
 Responsável        : Cássio Florêncio Rovaroto
 Descrição          : Inclusão de tipos de acordo na aba ACT e adequação
                      da aba Processos.
--------------------------------------------------------------------------------
 Rotina             : VerificaPreenchimento, btnProcurarLotacaoClick,
                      CmeCadastroCancel, CmeCadastroFind, CmeCadastroInsert,
                      CmeCadastroApplyDelete
 N. SIG             : 38475.59823
 Data da Alteração  : 07/12/2017
 Alteração Form     : fCadFilial
 Responsável        : Cássio Florêncio Rovaroto
 Descrição          : Inclusão dos campos para tratamento do código do lotação
 										  tributária para a declaração eSocial.
--------------------------------------------------------------------------------
 Nº SOL           : 256943-17659
 Nº KINTANA       : 1205530
 Data da Alteração: 26/01/2016
 Alteração Form   :
 Responsável      : André Itiro Imakawa
 Descrição        : eSocial - Alterado o campo Processo Administrativo ou
                    Judicial para ComboBox. Alteração da aba Outras Guias,
                    campos Tipo Natureza Juridica e Natureza Juridica.
                    Alterado a opção de não salvar a mascara no banco para o
                    campo edtNumero.
--------------------------------------------------------------------------------
 Nº SOL           : 256944/17800
 Nº PPM           : 1082911
 Data da Alteração: 27/10/2015
 Responsável      : Marcelo Cardoso
 Descrição        : Criação da aba ACT
--------------------------------------------------------------------------------
 Rotina           : ListProcessos, ProcessaOutros
 Nº SOL           : 250383.17344
 Nº PPM           : 839025
 Data da Alteração: 25/06/2015
 Alteração Form   : eSocial, Criação e alteração dos metodos para aba processo.
 Responsável      : Higor Nayde
 Descrição        : Deve ser adequada a folha de pagamento ao eSocial para
                    atendimento ao S1070 e S1299
--------------------------------------------------------------------------------
 Rotina           : OkDetCLick, CmeDetalheEdit, CmeDetalheInsert,
                    sbtnInsDetClick, sbtnAltDetClick
 Nº SOL           : 229871/16624
 Nº PPM           : 557813
 Data da Alteração: 03/03/2015
 Alteração Form   :
 Responsável      : Felipe A. Santos
 Descrição        : eSocial, alteração na aba processo inclusão do campo
                    "processo administrativo ou Judicial".
                    Adequação ao eSocial. Alteração aba procesos.
                    Inclusão dos campos referentes a processos administrativos
                    e judicias "RAT" e "FAP".
--------------------------------------------------------------------------------
 Rotina           : FormCreate, SelSubTipo, OkDetCLick, ConfirmarClick,
                    VerificaPreenchimento, VerificaPreenchimentoProcesso
 Nº SOL           : 229881/16647
 Nº PPM           : 565997
 Data da Alteração: 27/02/2015
 Alteração Form   :
 Responsável      : Higor Nayde Ferreira  / William Santana
 Descrição        : eSocial, Criação do campo estabelecimento e da aba processos
                    Criação dos campos Clasificação tributaria  e natureza
                    juridica
--------------------------------------------------------------------------------
 Rotina           : FormCreate, SelSubTipo, OkDetCLick, ConfirmarClick,
                    VerificaPreenchimento, VerificaPreenchimentoProcesso
 Nº SOL           : 229871/16137
 Nº PPM           : 407073
 Data da Alteração: 20/08/2014
 Alteração Form   :
 Responsável      : Felipe A. Santos   / William Santana
 Descrição        : eSocial, Criação do campo estabelecimento e da aba processos
                    Deve ser adequada a folha de pagamento ao eSocial para
                    atendimento ao Ato Declaratório Executivo SUFIS nº 5,
                    de 17 de Julho de 2013 que aprova e divulga os leiautes do
                    eSocial.
--------------------------------------------------------------------------------
 Rotina           : FormCreate
 Nº SOL           : 224461/15703
 Nº KINTANA       : 2059184
 Data da Alteração: 04/02/2014
 Alteração Form   :
 Responsável      : William Santana
 Descrição        : Adicionado um lookup combobox para pegar informações da
                    tabela SISTEMACONTROLEPONTORAIS
                    Solicitados adequação da Folha de Pagamento ao layout da
                    RAIS ano-base 2013.
                    Demanda Legal p atendimento Portaria nº 2072 de 31 de
                    Dezembro de 2013.
--------------------------------------------------------------------------------}

unit fCadFilial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fpessoaMT, Db,
  ExtDlgs, Pessoa, Menus, MontaSelect, DBTables, Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, checklst, DBCtrls, ExtCtrls, TabControlDetalhe,
  wwdblook, Mask, wwdbedit, Wwtable, TREdit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMDBLookupCombo, Wwdotdot, Wwdbcomb, Wwdbspin, CmEventosCadastro, ImgList, ComCtrls,
  wwdbdatetimepicker, CMDateTimePicker, DBClient, uCMClientDataSet, CMProcura, TB97Tlwn,
  uCtrlListTerceirosRH, uCtrlPessoaSindicato, uCtrlSegAcidTrab, uCtrlCNAE, uCtrlFPAS,
  uCmSqlParams;

type
  TfrmCadFilial = class(TfrmPessoaMT)
    tbshFolha: TTabSheet;
    gbxFichas: TGroupBox;
    gbxHorarios: TGroupBox;
    Label2: TLabel;
    Label13: TLabel;
    dbedRegIni: TwwDBEdit;
    dbedRegFim: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label15: TLabel;
    wwDBEdit3: TwwDBEdit;
    Label20: TLabel;
    wwDBEdit6: TwwDBEdit;
    Label21: TLabel;
    wwDBEdit7: TwwDBEdit;
    gbxAtividade: TGroupBox;
    Label25: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label26: TLabel;
    Label27: TLabel;
    tbshGRE: TTabSheet;
    tbshGuias: TTabSheet;
    gbxGRCS: TGroupBox;
    gbxDARF: TGroupBox;
    gbxGPS: TGroupBox;
    dbgrTipEmpr: TDBRadioGroup;
    dbgrOrigCGC: TDBRadioGroup;
    dbgrCodFgts: TDBRadioGroup;
    Label30: TLabel;
    wwDBEdit11: TwwDBEdit;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label31: TLabel;
    Label32: TLabel;
    wwDBEdit12: TwwDBEdit;
    Label33: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label34: TLabel;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label35: TLabel;
    wwDBLookupCombo5: TwwDBLookupCombo;
    Label36: TLabel;
    wwDBLookupCombo6: TwwDBLookupCombo;
    Label37: TLabel;
    wwDBEdit13: TwwDBEdit;
    Label29: TLabel;
    dblcFPAS: TwwDBLookupCombo;
    Label38: TLabel;
    dblcConvPrev: TwwDBLookupCombo;
    Label39: TLabel;
    dblcCatCNAE: TwwDBLookupCombo;
    Label40: TLabel;
    dblcItemCNAE: TwwDBLookupCombo;
    gbxCustosEspec: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    dbedCustoRural: TwwDBEdit;
    dbedCustoPatr: TwwDBEdit;
    dbedDataIni: TCMDateTimePicker;
    CdsMoeda: TCMClientDataSet;
    CdsSindicato: TCMClientDataSet;
    CdsNatEmpr: TCMClientDataSet;
    CdsSegAcid: TCMClientDataSet;
    CdsCatCNAE: TCMClientDataSet;
    CdsFPAS: TCMClientDataSet;
    CdsItemCNAE: TCMClientDataSet;
    CdsConvPrev: TCMClientDataSet;
    Label3: TLabel;
    Label43: TLabel;
    dblkpcmbIsistctrlponto: TwwDBLookupCombo;
    CdsSistCtrlPonto: TCMClientDataSet;
    dsSistCtrlPonto: TwwDataSource;
    pnlEstabelecimento: TPanel;
    lblEstab: TLabel;
    dbcmbEstab: TwwDBComboBox;
    tbshProcessos: TTabSheet;
    dbgrdProcessos: TwwDBGrid;
    CdsProcessos: TCMClientDataSet;
    dsProcessos: TwwDataSource;
    CdsCidadesPro: TCMClientDataSet;
    dblkpTpLogradouro: TwwDBLookupCombo;
    lblTipoLogradouro: TLabel;
    dbedUF: TwwDBEdit;
    lblUF: TLabel;
    dbedCodMunicipio: TwwDBEdit;
    lblCodMuniEnd: TLabel;
    CdsTpLogradouro: TCMClientDataSet;
    GroupBox1: TGroupBox;
    cbxClassTri: TwwDBLookupCombo;
    Label4: TLabel;
    cdsClassTri: TCMClientDataSet;
    cdsIndicativoSuspensao: TCMClientDataSet;
    dsIndicativoSuspensao: TwwDataSource;
    // INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
    tbshACT: TTabSheet;
    cdsAcordoColetivo: TCMClientDataSet;
    dsAcordoColetivo: TwwDataSource;
    pnlACT: TPanel;
    lbDtAcConv: TLabel;
    Data_Assinatura: TCMDateTimePicker;
    lblTpAcConv: TLabel;
    cbbTpAcConv: TwwDBComboBox;
    dbgrdACT: TwwDBGrid;
    pgctrlProcessos: TPageControl;
    tbsProcDados: TTabSheet;
    tbsIndicativoSusp: TTabSheet;
    pnlFundoProcesso: TPanel;
    grbInfo: TGroupBox;
    lblTipo: TLabel;
    lblNumero: TLabel;
    lblUFSecaoJud: TLabel;
    lblCodMunicipio: TLabel;
    lblCodIdentVara: TLabel;
    lblExtSetenca: TLabel;
    lblCidade: TLabel;
    lbldtinicio: TLabel;
    lbldtfim: TLabel;
    lblProcAdmJud: TLabel;
    dbedtCodIdentVara: TwwDBEdit;
    dbcmbTipo: TwwDBComboBox;
    dbcmbExtSetenca: TwwDBComboBox;
    dbcmbCidadesProc: TwwDBLookupCombo;
    edtNumero: TMaskEdit;
    dtpDataInicio: TCMDateTimePicker;
    dtpDataFim: TCMDateTimePicker;
    cbbProcAdmJud: TwwDBComboBox;
    Label6: TLabel;
    cmbMatProc: TComboBox;
    DockMonitora: TDock97;
    ToolbarIndSusp: TToolbar97;
    toolbtnInserirIndSusp: TToolbarButton97;
    toolbtnAlterarIndSusp: TToolbarButton97;
    toolbtnExcluirIndSusp: TToolbarButton97;
    dbGrdProcessoIndSusp: TwwDBGrid;
    pnlIndSusps: TPanel;
    Label92: TLabel;
    Label93: TLabel;
    rdGrpIndDeposito: TRadioGroup;
    dbDtpDtDecisao: TCMDateTimePicker;
    dbLkpCbxIndSusp: TwwDBLookupCombo;
    DockDetIndSusp: TDock97;
    Toolbar974: TToolbar97;
    btnDockIndSuspOK: TBitBtn;
    btnDockIndSuspCanc: TBitBtn;
    btnDockIndSuspVoltar: TBitBtn;
    edtUFSecaoJud: TEdit;
    edtCodMunicipio: TEdit;
    cdsProcessosXIndicativoSusp: TCMClientDataSet;
    dsProcessosXIndicativoSusp: TDataSource;
    dbGrpAutorAcao: TDBRadioGroup;
    Label10: TLabel;
    Label12: TLabel;
    dbEdtCodLotacao: TwwDBEdit;
    edtDescCodLotacao: TEdit;
    btnProcurarLotacao: TBitBtn;
    msLotacao: TMontaSelect;
    // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
    // FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcFPASCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure dblcCatCNAECloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure dbcmbCidadesProcChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure dbcmbTipoChange(Sender: TObject);
    //procedure cbxNaturezaTriCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean); // André Imakawa SOL 256943-17659 PPM 1205530 //Everson Cunha - SIG38475
    procedure CmeCadastroInsert(Sender: TObject); // André Imakawa SOL 256943-17659 PPM 1205530
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbcmbCidadesProcExit(Sender: TObject);
    procedure btnDockIndSuspOKClick(Sender: TObject);
    procedure btnDockIndSuspVoltarClick(Sender: TObject);
    procedure dbLkpCbxIndSuspChange(Sender: TObject);
    procedure toolbtnInserirIndSuspClick(Sender: TObject);
    procedure toolbtnAlterarIndSuspClick(Sender: TObject);
    procedure toolbtnExcluirIndSuspClick(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure pgctrlProcessosChange(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure cmbMatProcChange(Sender: TObject);
    procedure dbcmbExtSetencaChange(Sender: TObject);
    //procedure dbcmbIndDecisaoChange(Sender: TObject); //Everson Cunha - SIG70569
    procedure cbbProcAdmJudChange(Sender: TObject);
    //procedure cbxFormaApuracaoFapChange(Sender: TObject); //Everson Cunha - SIG70569
    //procedure dbcmbContribAbranChange(Sender: TObject); // Cássio Rovaroto - SIG nº 62232
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure btnProcurarLotacaoClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean); // André Imakawa SOL 256943-17659 PPM 1205530
  protected
    CtrlListTerceirosRH: TCtrlListTerceirosRH;
    CtrlPessoaSindicato: TCtrlPessoaSindicato;
    CtrlSegAcidTrab: TCtrlSegAcidTrab;
    CtrlCNAE: TCtrlCNAE;
    CtrlFPAS: TCtrlFPAS;

    procedure SelSubTipo(IdPessoa: double); override;

    procedure LimpaCamposProcessos;

    // Felipe A. Santos SOL 229871.16137 PPM 407073 - inicio
    function VerificaPreenchimento : boolean;
    function VerificaPreenchimentoProcessos : boolean;
    function AtualizaIndicativoSuspensao : boolean;
    function VerificaPreenchimentoACT : boolean; // Marcelo Cardoso  SOL:256944/17800 PPM:1082911
   private
       iHelp : integer;
    // Felipe A. Santos SOL 229871.16137 PPM 407073 - fim
    //Cássio Rovaroto - SIG nº 38475.60441 - Início
      bPossuiIndicativo: boolean;
    	fIdProcesso: integer;
      sTipoOperacao: string;
    //Cássio Rovaroto - SIG nº 38475.60441 - Fim

  end;

var
  frmCadFilial: TfrmCadFilial;

implementation

uses uCMTypes , uSistema, uMensErro, uCtrlPessoa, uCtrlPadroes, uCtrlPessoaFilialPessoa,
  uCtrlUsoGeralRH;

{$R *.DFM}

procedure TfrmCadFilial.FormCreate(Sender: TObject);
begin
  CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlListTerceirosRH.InitializeAs(Padroes);

  CtrlPessoaSindicato := TCtrlPessoaSindicato.Create;
  CtrlPessoaSindicato.InitializeAs(Padroes);

  CtrlSegAcidTrab := TCtrlSegAcidTrab.Create;
  CtrlSegAcidTrab.InitializeAs(Padroes);

  CtrlCNAE := TCtrlCNAE.Create;
  CtrlCNAE.InitializeAs(Padroes);

  CtrlFPAS := TCtrlFPAS.Create;
  CtrlFPAS.InitializeAs(Padroes);

  Pessoa := TCtrlPessoaFilialPessoa.Create(CtrlUsoGeralRH.UsuXFilial,
    CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  Pessoa.InitializeAs(Padroes);
  Pessoa.SubTipo := stFilial;
  Pessoa.TipoPessoa := tpJuridica;
  Pessoa.MostraFoto := true;
  Pessoa.SaveModuloRespon := false;
  Pessoa.MudaCaption := false;
  Pessoa.FormCaption := Self.Caption;

  // Felipe A. Santos SOL 229871.16137 PPM 407073- inicio
  TCtrlPessoaFilialPessoa(Pessoa).CdsProcessos := CdsProcessos;
  TCtrlPessoaFilialPessoa(Pessoa).CdsAcordoColetivo := cdsAcordoColetivo; // Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  CdsProcessos.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessos(-1);
  CdsCidadesPro.Data := TCtrlPessoaFilialPessoa(Pessoa).ListCidades;
  CdsTpLogradouro.Data := Pessoa.ListTipoLogradouro;
  CdsAcordoColetivo.Data := TCtrlPessoaFilialPessoa(Pessoa).ListAcordoColetivo(-1);   // Marcelo Cardoso - SOL:256944/17800 PPM:1082911

  bbtnAjuda.HelpContext := 210019;
  HelpContext := 210019;
  iHelp := 210019;      //William Santana - SOL 229871.16137 - PPM 407073
  // Felipe A. Santos SOL 229871.16137 PPM 407073- fim

  inherited;

  CdsMoeda.Data := CtrlListTerceirosRH.ListMoeda;
  CdsSindicato.Data := CtrlPessoaSindicato.ListPessoaSindicato;
  CdsNatEmpr.Data := CtrlListTerceirosRH.ListNaturezaEmpresarial;
  //Início - Higor  SOL 229881/16647 PPM 565997
  //cdsNaturezaJuridica.Data := CtrlListTerceirosRH.ListNaturezaJUR; // André Imakawa SOL 256943-17659 PPM 1205530
  cdsClassTri.Data := CtrlListTerceirosRH.ListClassTrib;
  //cdsTpNatJuridica.Data :=  TCtrlPessoaFilialPessoa(Pessoa).ListTipoNatJurid;    // André Imakawa SOL 256943-17659 PPM 1205530   //Everson Cunha - SIG38475
  //cdsNaturezaJuridica.Data := TCtrlPessoaFilialPessoa(Pessoa).ListCodNatJurid(0); // André Imakawa SOL 256943-17659 PPM 1205530  //Everson Cunha - SIG38475
  //cbxNaturezaTri.Enabled := False; // André Imakawa SOL 256943-17659 PPM 1205530  //Everson Cunha - SIG38475
  //Término - Higor SOL 229881/16647 PPM 565997

  CdsSegAcid.Data := CtrlSegAcidTrab.ListGeral;
  CdsCatCNAE.Data := CtrlCNAE.ListMestre;
  CdsFPAS.Data := CtrlFPAS.ListFPASDescPequena;

  CdsSistCtrlPonto.data :=  CtrlListTerceirosRH.listasistemacontrolepontoRAIS ; // William Santana - SOL: 224461/15703 - KIN: 2059184

  MontaSelect.Filtro.Clear;
  // Estabelecimento(s) habilitados para o usuário
  if (CtrlUsoGeralRH.UsuXFilial <> '') then
    MontaSelect.Filtro.Add('FILIALPESSOA.IDFILIALPESSOA IN ' +CtrlUsoGeralRH.UsuXFilial);

  MontaSelect.Filtro.Add('FILIALPESSOA.IDFILIALPESSOA = PESSOA.IDPESSOA');

  dblcConvPrev.Enabled := not(CdsConvPrev.IsEmpty);
  dblcItemCNAE.Enabled := not(CdsItemCNAE.IsEmpty);
                                                                                                                             
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  fIdProcesso := -1;
  bPossuiIndicativo := False;
  TCtrlPessoaFilialPessoa(Pessoa).CdsProcessosXIndicativoSusp := cdsProcessosXIndicativoSusp;
  cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessosXIndicativoSusp(-1);
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pessoa);
  FreeAndNil(CtrlFPAS);
  FreeAndNil(CtrlCNAE);
  FreeAndNil(CtrlSegAcidTrab);
  FreeAndNil(CtrlPessoaSindicato);
  FreeAndNil(CtrlListTerceirosRH);
  inherited;
end;

procedure TfrmCadFilial.dblcFPASCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if not(CdsSubTipo.IsEmpty) then
  begin
    CdsConvPrev.Data := CtrlFPAS.ListDetalhe(CdsSubTipo.FieldByName('IDFPAS').asInteger);
    dblcConvPrev.Enabled := not(CdsConvPrev.IsEmpty);
  end;
end;

procedure TfrmCadFilial.dblcCatCNAECloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if not(CdsSubTipo.IsEmpty) then
  begin
    CdsItemCNAE.Data := CtrlCNAE.ListDetalhe(CdsSubTipo.FieldByName('IDCATCNAE').asInteger);
    dblcItemCNAE.Enabled := not(CdsItemCNAE.IsEmpty);
  end;
end;

procedure TfrmCadFilial.bbtnConfirmarClick(Sender: TObject);
begin
  // Felipe A. Santos SOL 229871.16137 PPM 407073- início
  {if (CmpGrupo.Text = '') then
    MsgDlg('Indicar a que Empresa/Grupo/Estab. pertence', 'Aviso', mtWarning, [mbOk, mbHelp], 0)
  else}

  //Everson Luiz - SIG70569
  if CdsProcessos.State in [dsInsert, dsEdit] then
    bbtnOkDetClick(Self);

  if not VerificaPreenchimento then
     Exit;
  // Felipe A. Santos SOL 229871.16137 PPM 407073- fim

  inherited;
  //cbxTpNatJuridica.ReadOnly := True; // André Imakawa SOL 256943-17659 PPM 1205530 //Everson Cunha - SIG38475
end;


procedure TfrmCadFilial.bbtnCancelarClick(Sender: TObject);
begin

  //Everson Luiz - SIG70569 - Início
  if CdsProcessos.State in [dsInsert, dsEdit] then //Everson Luiz - SIG90602
  begin
    btnDockIndSuspVoltarClick(Self);
    bbtnCancelarDetClick(Self);
  //Everson Luiz - SIG70569 - Fim
  end;

  inherited;
  if (Assigned(Self.ActiveControl)) and
     (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') and
     (Cds.FieldByName('IDPESSOA').asFloat > 0) then
    CmeCadastroFind(Sender);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadFilial.SelSubTipo(IdPessoa: double);
begin
  CdsSubTipo.Data := TCtrlPessoaFilialPessoa(Pessoa).ListSubTipo(IdPessoa);
  CdsConvPrev.Data := CtrlFPAS.ListDetalhe(CdsSubTipo.FieldByName('IDFPAS').asInteger);
  CdsItemCNAE.Data := CtrlCNAE.ListDetalhe(CdsSubTipo.FieldByName('IDCATCNAE').asInteger);
  CdsProcessos.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessos(IdPessoa); // Felipe A. Santos SOL 229871.16137 PPM 407073
  cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessosXIndicativoSusp(IdPessoa);
  cdsAcordoColetivo.Data := TCtrlPessoaFilialPessoa(Pessoa).ListAcordoColetivo(IdPessoa); //   Marcelo Cardoso - SOL:256944/17800 PPM:1082911


  dblcConvPrev.Enabled := not(CdsConvPrev.IsEmpty);
  dblcItemCNAE.Enabled := not(CdsItemCNAE.IsEmpty);

  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  {
  //Início - William Santana - SOL 229881/16647 PPM 565997
  if (Cds.FieldByName('IDPESSOA').asFloat = 94099)
   and ((cdsSubtipo.FieldByName('IDCLASSTRIBUT').IsNull) or
        (cdsSubtipo.FieldByName('IDNATEMPRE').IsNull))
  then begin
    cdsNaturezaJuridica.Locate('IDNATEMPRE',3999, [loCaseInsensitive]);
    cdsClassTri.Locate('IDCLASSTRIBUT',13, [loCaseInsensitive]);
  end;
   //Término - William Santana - SOL 229881/16647 PPM 565997
   }
   // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
end;

procedure TfrmCadFilial.bbtnOkDetClick(Sender: TObject);
begin
  // Felipe A. Santos SOL 229871.16137 PPM 407073- início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
  begin
       if not VerificaPreenchimentoProcessos then
         Abort;  //Everson Luiz - SIG70569
//         Exit; //Everson Luiz - SIG70569

     // foram atribuídos os textos a esses campos para serem apresentados na grid, pois no campo original vão ser armazenados os ID
     CdsProcessos.FieldByName('TIPO2').AsString := dbcmbTipo.Text;
     //CdsProcessos.FieldByName('INDICATDECISAO2').AsString := dbcmbIndDecisao.Text; //Everson Luiz - SIG70569

     //Cássio Rovaroto - SIG nº 62232 - Início
     //CdsProcessos.FieldByName('CONTRIABRANDECISAO2').AsString := dbcmbContribAbran.Text;
     //Cássio Rovaroto - SIG nº 62232 - Fim

     CdsProcessos.FieldByName('NOMECIDADE').AsString := dbcmbCidadesProc.Text;
     CdsProcessos.FieldByName('NUMERO').AsString := edtNumero.Text;

     // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
     //Cássio Rovaroto - SIG nº 38475.60441
     //CdsProcessos.FieldByName('IDINDICATIVOSUSP2').AsString := dbLkpCbxIndSusp.Text;
     CdsProcessos.FieldByName('EXTENDECISAO2').AsString := dbcmbExtSetenca.Text;
     //CdsProcessos.FieldByName('APURFAP2').AsString := cbxFormaApuracaoFap.Text; //Everson Luiz SIG70569
     // André Imakawa SOL 256943-17659 PPM 1205530 - Fim

     //Cássio Rovaroto - SIG nº 38475.60441 - Início
     //if rbSim.Checked then
     //begin
     //   CdsProcessos.FieldByName('INDICATDEPOSITO').AsInteger := 1;
     //   CdsProcessos.FieldByName('INDICATDEPOSITO2').AsString := 'Sim';
     //end
     //else if rbNao.Checked then
     //begin
     //   CdsProcessos.FieldByName('INDICATDEPOSITO').AsInteger := 0;
     //   CdsProcessos.FieldByName('INDICATDEPOSITO2').AsString := 'Não';
     //end;
     //Cássio Rovaroto - SIG nº 38475.60441 - Fim

	// Felipe A. Santos - SOL229871.16624 PPM 557813  - início
     // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
     {
     if rbRAT.Checked then
     begin
        CdsProcessos.FieldByName('PROCADMJUD').AsInteger := 1;
        CdsProcessos.FieldByName('PROCADMJUD2').AsString := 'RAT';
     end
     else if rbFAP.Checked then
     begin
        CdsProcessos.FieldByName('PROCADMJUD').AsInteger := 2;
        CdsProcessos.FieldByName('PROCADMJUD2').AsString := 'FAP';
     end;
     }
     // André Imakawa SOL 256943-17659 PPM 1205530 - Fim

     // Felipe A. Santos - SOL229871.16624 PPM 557813  - fim
     //Higor Nayde SOL 250383.17344 Nº PPM             839025

     {if rSimContribuinte.Checked then
     begin
        CdsProcessos.FieldByName('AUTORACAO').AsString := 'S';
        CdsProcessos.FieldByName('AUTORACAO2').AsString := 'Sim'// André Imakawa SOL 256943-17659 PPM 1205530
     end
     else if rNaoContribuinte.Checked then
     begin
        CdsProcessos.FieldByName('AUTORACAO').AsString := 'N';
        CdsProcessos.FieldByName('AUTORACAO2').AsString := 'Não'// André Imakawa SOL 256943-17659 PPM 1205530
     end;
     //Higor Nayde SOL 250383.17344 Nº PPM             839025

     edtNumero.Clear;}

     if dbGrpAutorAcao.ItemIndex  = 0 then
      CdsProcessos.FieldByName('AUTORACAO2').asString := 'Não'
     else
      CdsProcessos.FieldByName('AUTORACAO2').asString := 'Sim';

     //Cássio Rovaroto - SIG nº 38475.60441 - Início
     //rbSim.Checked := False; // Felipe A. Santos SOL229871.16624 PPM 557813
     //rbNao.Checked := False; // Felipe A. Santos SOL229871.16624 PPM 557813
     // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
     {
     rbRAT.Checked := False; // Felipe A. Santos SOL229871.16624 PPM 557813
     rbFAP.Checked := False; // Felipe A. Santos  SOL229871.16624 PPM 557813
     }
     // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
     //rSimContribuinte.Checked := False;
     //rNaoContribuinte.Checked := False;
     //Cássio Rovaroto - SIG nº 38475.60441 - Fim

     LimpaCamposProcessos;
  end
  else if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    CdsEnderecoTIPOLOGRADOURO.AsString := dblkpTpLogradouro.Text;
  end;
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Fim

// INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  if pgctrlDetalhe.ActivePage = tbshACT then
  begin
    if not VerificaPreenchimentoACT then // Marcelo Cardoso
    Exit;
    cdsAcordoColetivo.FieldByName('TIPOACORDODESC').AsString := cbbTpAcConv.Text;

  end;
// FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  inherited;

  //Everson Luiz - SIG70569 - Início
  if CdsProcessos.State = dsInsert then
    bbtnVoltarDetClick(Self);  //Estava com problemas na geração da sequence
  //Everson Luiz - SIG70569 - Fim

end;

function TfrmCadFilial.VerificaPreenchimento: boolean;
begin
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Início
  Result := True;

  if (CmpGrupo.Text = '') then
  begin
    MsgDlg('Indicar a que Empresa/Grupo/Estab. pertence', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    Result := False;
    CmpGrupo.SetFocus;
    Exit;
  end;

  if (dbcmbEstab.Text = '') then
  begin
    MsgDlg('Obrigatório à seleção do tipo de Estabelecimento.', 'Aviso', mtWarning, [mbOk, mbHelp], iHelp);
    Result := False;
    tbcDetalhe.TabIndex := 0;
    tbcDetalheChange(Self);
    dbcmbEstab.SetFocus;
    Exit;
  end;
  //Início - William Santana - SOL 229881/16647 PPM 565997

  if (cbxClassTri.Text = '') then
  begin
    MsgDlg('Informe a Classificação Tributária ', 'Aviso', mtWarning, [mbOk], iHelp);
    Result := False;
    tbcDetalhe.TabIndex := 7;
    tbcDetalheChange(Self);
    cbxClassTri.SetFocus;
    Exit;
  end;
  //Término - William Santana - SOL 229881/16647 PPM 565997
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Fim
end;

function TfrmCadFilial.VerificaPreenchimentoProcessos: boolean;
var
   sNum : string;
begin
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Início
  Result := False;

  sNum := StringReplace(edtNumero.Text, '-','', [rfReplaceAll]);

  if (dbcmbTipo.Text) = '' then
  begin
    MsgDlg('Informe o Tipo','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    dbcmbTipo.SetFocus;
    dbcmbTipo.dropdown;					  //Everson Luiz - SIG70569
    Exit;
  end
  else if Trim(sNum) = '' then
  begin
    MsgDlg('Informe o Número','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    edtNumero.SetFocus;
    Exit;
  end
  else if dtpDataInicio.Date = 0 then
  begin
    MsgDlg('Informe a Data Início','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0;
    dtpDataInicio.SetFocus;
    Exit;
  end
  else if (dtpDataInicio.Date > dtpDataFim.Date) and (dtpDataFim.Date <> 0) then
  begin
    MsgDlg('A Data Fim não pode ser menor que a Data Inicio','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    dtpDataFim.SetFocus;
    Exit;
  end
  //Cássio Rovaroto - SIG nº 381475.60441 - Início
  {else if cbxIndicativoSuspensao.Text = '' then
  begin
    MsgDlg('Selecione o Indicativo de suspensão da exigibilidade','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    cbxIndicativoSuspensao.SetFocus;
    Exit;
  end}
  //Cássio Rovaroto - SIG nº 381475.60441 - Fim

  //Everson Luiz - SIG70569 - Início
  {else if dbcmbIndDecisao.Text = '' then
  begin
    MsgDlg('Selecione o Indicativo da Decisão','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    dbcmbIndDecisao.SetFocus;
    Exit;
  end}
  //Everson Luiz - SIG70569 - Fim

  //Cássio Rovaroto - SIG nº 381475.60441 - Início
  {else if dtpDtDecisao.Date = 0 then
  begin
    MsgDlg('Obrigatório preencher a Data da Decisão','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    dtpDtDecisao.SetFocus;
    Exit;
  end
  //Cássio Rovaroto - SIG nº 381475.60441 - Fim
   // INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
   else if (dtpDataInicio.Date > dtpDataFim.Date) and  (dtpDataFim.Date <> 0) then
  begin
    MsgDlg('A Data Fim não pode ser menor que a Data Inicio','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    dtpDataFim.SetFocus;
    Exit;
  end
  // FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
  else if not(rbSim.Checked) and not(rbNao.Checked) then
  begin
    MsgDlg('Selecione o Indicativo de Depósito','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    rbSim.SetFocus;
    Exit;
  end}
  //Cássio Rovaroto - SIG nº 381475.60441 - Fim
  else if (dbcmbCidadesProc.Text = '') then
  begin
    MsgDlg('Selecione a Cidade','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    dbcmbCidadesProc.SetFocus;
    dbcmbCidadesProc.DropDown;
    Exit;
  end
  //Cássio Rovaroto - SIG nº 381475.60441 - Início
  {else if dbedtUFsecaoJud.Text = '' then
  begin
    MsgDlg('Informe a UF da Seção Judiciária','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    //dbedtUFsecaoJud.SetFocus; // André Imakawa SOL 256943-17659 PPM 1205530
    Exit;
  end
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  else if dbedtCodMuniPro.Text = '' then
  begin
    MsgDlg('O campo Código do Município é obrigatório','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    //dbedtCodMuniPro.SetFocus;
    Exit;
  end}
  //Cássio Rovaroto - SIG nº 381475.60441 - Fim                              
  // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
  else if Trim(dbedtCodIdentVara.Text) = '' then
  begin
    MsgDlg('Selecione o Código de Ident. da Vara.','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    dbedtCodIdentVara.SetFocus;
    Exit;
  end
  //Cássio Rovaroto - SIG nº 62232 - Início
  //else if dbcmbContribAbran.Text = '' then
  //begin
  //  MsgDlg('Selecione o tipo de Contribuição abrangida pela Decisão','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
  //  dbcmbContribAbran.SetFocus;
  //  Exit;
  //end      //Higor Nayde SOL 250383.17344 Nº PPM             839025
  //Cássio Rovaroto - SIG nº 62232 - Fim
    //else if not(rSimContribuinte.Checked) and not(rNaoContribuinte.Checked) then
  else if dbGrpAutorAcao.ItemIndex = -1 then
  begin
    MsgDlg('Informe se o contribuinte é o autor da ação.','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    //rSimContribuinte.SetFocus;
    dbGrpAutorAcao.SetFocus;
    Exit;
  end;  //Higor Nayde SOL 250383.17344 Nº PPM 839025

  //Everson Luiz - SIG70569 - Início
  {else if dbcmbExtSetenca.Text = '' then
  begin
    MsgDlg('Selecione a Extensão da Decisão/Sentença.','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    dbcmbExtSetenca.SetFocus;
    Exit;
  end
  else if cbxFormaApuracaoFap.Text = '' then
  begin
    MsgDlg('Selecione a Forma de apuração do FAP.','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
    cbxFormaApuracaoFap.SetFocus;
    Exit;
  end;}
  //Everson Luiz - SIG70569 - Fim

  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  //if (cdsProcessos.State in [dsInsert, dsEdit]) then //Everson Cunha - SIG70569
  if (cdsProcessos.State in [dsInsert]) then           //Everson Cunha - SIG70569
  begin
    if TCtrlPessoaFilialPessoa(Pessoa).VerificaProcessoEstabelecimento(edtNumero.Text, cds.FieldByName('IDPESSOA').asInteger) then
    begin
      MsgDlg('Número de processo já cadastrado para este estabelecimento.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
      pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569
      edtNumero.SetFocus;
      Exit;
    end;
  end; //Everson Cunha - SIG70569

  //if (cdsProcessosXIndicativoSusp.FieldByName('IDINDICATIVOSUSP').IsNull) and ((dbcmbTipo.ItemIndex <> 2) and (cmbMatProc.ItemIndex = 0)) then //Everson Cunha - SIG38475
  if (cdsProcessosXIndicativoSusp.FieldByName('IDINDICATIVOSUSP').IsNull) and (cmbMatProc.ItemIndex = 0) then                                    //Everson Cunha - SIG38475
  begin
    MsgDlg('É necessário indicar pelo menos um Indicativo de Suspensão ao processo.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
    pgctrlProcessos.ActivePage := tbsIndicativoSusp;
    cdsIndicativoSuspensao.data := TCtrlPessoaFilialPessoa(Pessoa).ListIndicativoSusp(dbcmbTipo.ItemIndex);
    pgctrlProcessosChange(self);
    Exit;
  end;
  //end; //Everson Cunha - SIG70569
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim

  Result := True;
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Fim
end;

//INICIO - Marcelo Cardoso - SOL:256944/17800 PPM:1082911
function TfrmCadFilial.VerificaPreenchimentoACT: boolean;
var
   sNum : string;
Begin
   Result := False;

   //sNum := StringReplace(edtNumero.Text, '-','', [rfReplaceAll]);

   if (Data_Assinatura.Date = 0 ) then
   begin
        MsgDlg('Obrigatório informar a Data da Assinatura','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
        Data_Assinatura.SetFocus;
        Exit;
   end;

   if  cbbTpAcConv.Text = '' then
   begin
    MsgDlg('Obrigatório informar o Tipo do Acordo','Aviso',mtWarning, [mbOk, mbHelp], iHelp);
    cbbTpAcConv.SetFocus;
    Exit;
   end;

 Result := True;
end;
// FIM - Marcelo Cardoso - SOL:256944/17800 PPM:1082911

procedure TfrmCadFilial.sbtnExcluiDetClick(Sender: TObject);
begin
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
  begin
     if MsgDlg('Deseja realmente excluir este registro?', 'Confirmação', mtConfirmation, [mbYes,mbNo], iHelp) = mrNo then
        Exit;
  end;

//  CmeDetalhe.Operacao := opApagar; Everson Luiz - SIG70659 (Já existe na "TFrmCadastroMestreDetMT.sbtnExcluiDetClick")

  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073- fim
end;

procedure TfrmCadFilial.dbcmbCidadesProcChange(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073- Início
  if (CdsProcessos.State in [dsInsert, dsEdit]) and (dbcmbCidadesProc.Text <> '') then
  begin
    CdsProcessos.FieldByName('CODESTADO').AsString := CdsCidadesPro.FieldByName('CODESTADO').AsString;
    CdsProcessos.FieldByName('CODMUNICIPIO').AsString := CdsCidadesPro.FieldByName('CODMUNICIPIO').AsString;
  end;
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  {
  //Início - William Santana - SOL 229881/16647 PPM 565997
  if (Cds.FieldByName('IDPESSOA').asFloat = 94099) and
       ((cdsSubtipo.FieldByName('IDCLASSTRIBUT').IsNull) or
        (cdsSubtipo.FieldByName('IDNATEMPRE').IsNull))
  then begin
    cdsNaturezaJuridica.Locate('IDNATEMPRE',3999, [loCaseInsensitive]);
    cdsClassTri.Locate('IDCLASSTRIBUT',13, [loCaseInsensitive]);
  end;
  //Término - William Santana - SOL 229881/16647 PPM 565997
  }
  // André Imakawa SOL 256943-17659 PPM 1205530 - Fim

  // Felipe A. Santos SOL 229871.16137 PPM 407073- fim
end;

procedure TfrmCadFilial.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
  begin

    pgctrlProcessos.ActivePageIndex := 0; //Everson Luiz - SIG70569

  //Cássio Rovaroto - SIG nº 381475.60441 - Início
    //edtNumero.Text := CdsProcessos.FieldByName('NUMERO').AsString;

    {if CdsProcessos.FieldByName('INDICATDEPOSITO').AsInteger = 1 then
       rbSim.Checked := True
    else
       rbNao.Checked := True;}
    //Cássio Rovaroto - SIG nº 381475.60441 - Fim

    // Felipe A. Santos - SOL229871.16624 PPM 557813 - início
    // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
    {
    if CdsProcessos.FieldByName('PROCADMJUD').AsInteger = 1 then
       rbRAT.Checked := True
    else if CdsProcessos.FieldByName('PROCADMJUD').AsInteger = 2 then
       rbFAP.Checked := True;
    }
    // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
    // Felipe A. Santos - SOL229871.16624 PPM 557813 - fim
     //Higor Nayde SOL 250383.17344 Nº PPM             839025
    //if CdsProcessos.FieldByName('AUTORACAO').AsString = 'S' then
    //   rSimContribuinte.Checked := True
    //else
    //   rNaoContribuinte.Checked := True;
     //Higor Nayde SOL 250383.17344 Nº PPM             839025
  	edtNumero.Text := CdsProcessos.FieldByName('NUMERO').AsString;

    edtUFSecaoJud.Text := CdsCidadesPro.FieldByName('CODESTADO').AsString;
    edtCodMunicipio.Text := CdsCidadesPro.FieldByName('CODMUNICIPIO').AsString;

    //Cássio Rovaroto - SIG nº 62232 - Início
    //case CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger of
    //    1: dbcmbContribAbran.ItemIndex := 0;
    //    2: dbcmbContribAbran.ItemIndex := 1;
    //    3: dbcmbContribAbran.ItemIndex := 2;
    //    4: dbcmbContribAbran.ItemIndex := 3;
    //end;

    //dbcmbContribAbran.Text := CdsProcessos.FieldByName('CONTRIABRANDECISAO2').AsString;
    //Cássio Rovaroto - SIG nº 62232 - Início

    dbcmbTipo.ItemIndex := -1; //Everson Luiz SIG70569

    if CdsProcessos.FieldByName('TIPO').AsString = 'A' then
      dbcmbTipo.ItemIndex := 0;

    if CdsProcessos.FieldByName('TIPO').AsString = 'J' then
      dbcmbTipo.ItemIndex := 1;

    //Everson Cunha - SIG38475 - Ini
    //if CdsProcessos.FieldByName('TIPO').AsString = 'N' then
    //	dbcmbTipo.ItemIndex := 2;
    //Everson Cunha - SIG38475 - Fim

    //Everson Luiz SIG70569 - Inicio
    if CdsProcessos.FieldByName('TIPO').AsString = 'F' then
    	//dbcmbTipo.ItemIndex := 3; //Everson Cunha - SIG38475
      dbcmbTipo.ItemIndex := 2; //Everson Cunha - SIG38475
    //Everson Luiz SIG70569 - Fim

    //CdsIndicativoSuspensao.Data := TCtrlPessoaFilialPessoa(Pessoa).ListIndicativoSusp(dbcmbTipo.ItemIndex); Everson Luiz - SIG70569

    dbcmbTipo.Text := CdsProcessos.FieldByName('TIPO2').AsString;

    //Everson Luiz - SIG70569 - Início
    {case CdsProcessos.FieldByName('INDICATDECISAO').AsInteger of
        1: dbcmbIndDecisao.ItemIndex := 0;
        2: dbcmbIndDecisao.ItemIndex := 1;
        3: dbcmbIndDecisao.ItemIndex := 2;
        4: dbcmbIndDecisao.ItemIndex := 3;
        5: dbcmbIndDecisao.ItemIndex := 4;
        9: dbcmbIndDecisao.ItemIndex := 5;
    end;
    dbcmbIndDecisao.Text := CdsProcessos.FieldByName('INDICATDECISAO2').AsString;}
    //Everson Luiz - SIG70569 - Fim

    case CdsProcessos.FieldByName('EXTENDECISAO').AsInteger of
    	1: dbcmbExtSetenca.ItemIndex := 0;
      2: dbcmbExtSetenca.ItemIndex := 1;
    end;
    dbcmbExtSetenca.Text := CdsProcessos.FieldByName('EXTENDECISAO2').AsString;

    case CdsProcessos.FieldByName('PROCADMJUD').AsInteger of
    	1: cbbProcAdmJud.ItemIndex := 0;
      2: cbbProcAdmJud.ItemIndex := 1;
    end;
    cbbProcAdmJud.Text := CdsProcessos.FieldByName('PROCADMJUD2').AsString;

    //Everson Luiz SIG70569 - Início
    {case CdsProcessos.FieldByName('APURFAP').AsInteger  of
    	1: cbxFormaApuracaoFap.ItemIndex := 0;
      2: cbxFormaApuracaoFap.ItemIndex := 1;
    end;
    cbxFormaApuracaoFap.Text := CdsProcessos.FieldByName('APURFAP2').AsString;}
    //Everson Luiz SIG70569 - Fim

    //Everson Cunha - SIG70569 - Início

    //cmbMatProc.Text := CdsProcessos.FieldByName('CODMATPROCDESC2').AsString;

    if CdsProcessos.FieldByName('CODMATPROCDESC2').AsString <> '' then
    begin
      case CdsProcessos.FieldByName('CODMATPROC').AsInteger of
        1: cmbMatProc.ItemIndex := 0;
        //Everson Cunha - SIG38475 - Ini
        {2: cmbMatProc.ItemIndex := 1;
        3: cmbMatProc.ItemIndex := 2;
        4: cmbMatProc.ItemIndex := 3;
        5: cmbMatProc.ItemIndex := 4;
        6: cmbMatProc.ItemIndex := 5;
        7: cmbMatProc.ItemIndex := 6;
        8: cmbMatProc.ItemIndex := 7;
        99: cmbMatProc.ItemIndex := 8;}
        7: cmbMatProc.ItemIndex := 1;
        //Everson Cunha - SIG38475 - Fim
      end;

      //cmbMatProc.Text := CdsProcessos.FieldByName('CODMATPROCDESC2').AsString;

    end
    else
    begin
      //cmbMatProc.Text := '';
      cmbMatProc.ItemIndex := -1;
    end;
    //Everson Cunha - SIG70569 - Fim

    fIdProcesso := cdsProcessos.FieldByName('IDPROCESSO').asInteger;
    cdsProcessosXIndicativoSusp.Filtered := False;
    cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + IntToStr(fIdProcesso);
    cdsProcessosXIndicativoSusp.Filtered := True;
  //Cássio Rovaroto - SIG nº 381475.60441 - Fim
  end; //HIGOR NAYDE FERREIRA SOL 229881/16647 PPM 565997
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  {
  //Início - William Santana - SOL 229881/16647 PPM 565997
  if (Cds.FieldByName('IDPESSOA').asFloat = 94099) and
     ((cdsSubtipo.FieldByName('IDCLASSTRIBUT').IsNull) or
      (cdsSubtipo.FieldByName('IDNATEMPRE').IsNull))
   then begin
    cdsNaturezaJuridica.Locate('IDNATEMPRE',3999, [loCaseInsensitive]);
    cdsClassTri.Locate('IDCLASSTRIBUT',13, [loCaseInsensitive]);
    CdsSubTipo.FieldByName('IDNATEMPRE').AsInteger    :=  cdsNaturezaJuridica.FieldByName('IDNATEMPRE').AsInteger;
    CdsSubTipo.FieldByName('IDCLASSTRIBUT').AsInteger :=  cdsClassTri.FieldByName('IDCLASSTRIBUT').AsInteger;
  end;
   //Término - William Santana - SOL 229881/16647 PPM 565997
   }
   // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
  // Felipe A. Santos SOL 229871.16137 PPM 407073- fim
end;

procedure TfrmCadFilial.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 229871.16137 PPM 407073 - início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
  begin
  //Cássio Rovaroto - SIG nº 381475.60441 - Início
       {edtNumero.Clear;
       rbSim.Checked := False;
       rbNao.Checked := True; // André Imakawa SOL 256943-17659 PPM 1205530
       // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
       {
	   rbRAT.Checked := False; // Felipe A. Santos SOL229871.16624 PPM 557813
       rbFAP.Checked := False; // Felipe A. Santos  SOL229871.16624 PPM 557813
       }
       // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
       {rSimContribuinte.Checked := False;      //Higor Nayde SOL 250383.17344 Nº PPM             839025
       rNaoContribuinte.Checked := True;}      //Higor Nayde SOL 250383.17344 Nº PPM             839025  // André Imakawa SOL 256943-17659 PPM 1205530

  	pgctrlProcessos.ActivePageIndex := 0;
   	LimpaCamposProcessos;
   	cdsProcessos.FieldByName('IDPROCESSO').AsInteger :=  TCtrlPessoaFilialPessoa(Pessoa).GetProxIdProcesso;
    fIdProcesso := cdsProcessos.FieldByName('IDPROCESSO').AsInteger;

    //Cássio Rovaroto - SIG nº 62232 - Início
    //cdsProcessosXIndicativoSusp.Filtered := False;
    //cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + IntToStr(fIdProcesso);
    //cdsProcessosXIndicativoSusp.Filtered := True;

    //Everson Luiz - SIG70569 - Fim
    //if not(cdsProcessosXIndicativoSusp.IsEmpty) then
    //begin
    //  cdsProcessosXIndicativoSusp.Filtered := False;
    //  cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + IntToStr(fIdProcesso);
    //  cdsProcessosXIndicativoSusp.Filtered := True;
    //end;
    //Cássio Rovaroto - SIG nº 62232 - Fim
    //Everson Luiz - SIG70569 - Fim

    dbcmbTipo.SetFocus;
  //Cássio Rovaroto - SIG nº 381475.60441 - Fim
  end;
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  {
   //Início - William Santana - SOL 229881/16647 PPM 565997
  if (Cds.FieldByName('IDPESSOA').asFloat = 94099) and
     ((cdsSubtipo.FieldByName('IDCLASSTRIBUT').IsNull) or
      (cdsSubtipo.FieldByName('IDNATEMPRE').IsNull))
   then begin
    cdsNaturezaJuridica.Locate('IDNATEMPRE',3999, [loCaseInsensitive]);
    cdsClassTri.Locate('IDCLASSTRIBUT',13, [loCaseInsensitive]);
    CdsSubTipo.FieldByName('IDNATEMPRE').AsInteger    :=  cdsNaturezaJuridica.FieldByName('IDNATEMPRE').AsInteger;
    CdsSubTipo.FieldByName('IDCLASSTRIBUT').AsInteger :=  cdsClassTri.FieldByName('IDCLASSTRIBUT').AsInteger;
  end;
   //Término - William Santana - SOL 229881/16647 PPM 565997
   }
   // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
  // Felipe A. Santos SOL 229871.16137 PPM 407073- fim
end;


procedure TfrmCadFilial.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL229871.16624 PPM 557813 - início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  begin
  	LimpaCamposProcessos;
    if dbcmbTipo.CanFocus then dbcmbTipo.SetFocus;
  end;
  //Cássio Rovaroto - SIG nº 38475.40661 - Fim
  // Felipe A. Santos SOL229871.16624 PPM 557813 - fim
end;


procedure TfrmCadFilial.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL229871.16624 PPM 557813 - início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
     if dbcmbTipo.CanFocus then dbcmbTipo.SetFocus;
  // Felipe A. Santos SOL229871.16624 PPM 557813 - fim
end;

procedure TfrmCadFilial.CmeCadastroFind(Sender: TObject);
begin   //HIGOR NAYDE FERREIRA SOL 229881/16647 PPM 565997
  inherited;

  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  //Everson Cunha - SIG38475 - Ini
  {
  if not (cdsSubtipo.FieldByName('IDNATJURIDICA').IsNull) then
  begin
       cdsNaturezaJuridica.Data := TCtrlPessoaFilialPessoa(Pessoa).ListCodNatJurid(0);
       cdsNaturezaJuridica.Locate('IDNATJURIDICA',cdsSubtipo.FieldByName('IDNATJURIDICA').AsInteger, []);
       cdsTpNatJuridica.Locate('TIPO',cdsNaturezaJuridica.FieldByName('TIPO').AsInteger , []);
       cbxTpNatJuridica.text := cdsNaturezaJuridica.FieldByName('DESCTIPO').AsString;
       cbxNaturezaTri.Text :=  cdsNaturezaJuridica.FieldByName('DESCRICAO').AsString;
       cbxNaturezaTri.Enabled := True;
  end  else
  begin
       cbxTpNatJuridica.text := '';
       cbxNaturezaTri.Enabled := False;
  end;}
  //Everson Cunha - SIG38475 - Fim

  //Cássio Rovaroto - SIG nº 38475.59823 - Início
  if(CdsSubTipo.FieldByName('CODLOTACAOESOCIAL').IsNull) then
    edtDescCodLotacao.Text := ''
  else
  	edtDescCodLotacao.Text := TCtrlPessoaFilialPessoa(Pessoa).ListDescLoctacaoTributaria(CdsSubTipo.FieldByName('CODLOTACAOESOCIAL').AsString);
  //Cássio Rovaroto - SIG nº 38475.59823 - Fim

  {
  if (Cds.FieldByName('IDPESSOA').asFloat = 94099)
   //Início - William Santana - SOL 229881/16647 PPM 565997
   and ((cdsSubtipo.FieldByName('IDCLASSTRIBUT').IsNull) or
        (cdsSubtipo.FieldByName('IDNATEMPRE').IsNull))
  then begin
   //Término - William Santana - SOL 229881/16647 PPM 565997
    cdsNaturezaJuridica.Locate('IDNATEMPRE',3999, [loCaseInsensitive]);
    cdsClassTri.Locate('IDCLASSTRIBUT',13, [loCaseInsensitive]);
    cbxClassTri.Text :=  'Banco, caixa econômica, sociedade de crédito, financiamento e investimento e demais empresas relacionadas no parágrafo 1º do art. 22 da Lei 8.212./91';
    cbxNaturezaTri.Text :=  'OUTRAS FORMAS DE ASSOCIACAO';

  end; //HIGOR NAYDE FERREIRA SOL 229881/16647 PPM 565997
  }
  // André Imakawa SOL 256943-17659 PPM 1205530 - Fim

  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  cdsProcessos.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessos(Cds.FieldByName('IDPESSOA').AsFloat);
  fIdProcesso := cdsProcessos.FieldByname('IDPROCESSO').AsInteger;
  cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessosXIndicativoSusp(Cds.FieldByName('IDPESSOA').AsFloat);
  //Cássio Rovaroto - SIG nº 38475.60441 - FIm
end;

procedure TfrmCadFilial.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  //cbxTpNatJuridica.ReadOnly := False; //Everson Cunha - SIG38475
  {
    //Início - William Santana - SOL 229881/16647 PPM 565997
  if (Cds.FieldByName('IDPESSOA').asFloat = 94099) and
     ((cdsSubtipo.FieldByName('IDCLASSTRIBUT').IsNull) or
      (cdsSubtipo.FieldByName('IDNATEMPRE').IsNull))
   then begin
    cdsNaturezaJuridica.Locate('IDNATEMPRE',3999, [loCaseInsensitive]);
    cdsClassTri.Locate('IDCLASSTRIBUT',13, [loCaseInsensitive]);
    CdsSubTipo.FieldByName('IDNATEMPRE').AsInteger    :=  cdsNaturezaJuridica.FieldByName('IDNATEMPRE').AsInteger;
    CdsSubTipo.FieldByName('IDCLASSTRIBUT').AsInteger :=  cdsClassTri.FieldByName('IDCLASSTRIBUT').AsInteger;
  end;
   //Término - William Santana - SOL 229881/16647 PPM 565997
   }
   // André Imakawa SOL 256943-17659 PPM 1205530 - Fim
end;

function TfrmCadFilial.AtualizaIndicativoSuspensao: boolean;
begin
  //Cássio Rovaroto - SIG nº 381475.60441 - Início
  //Higor Nayde SOL 250383.17344 Nº PPM             839025
  {if dbcmbTipo.Text = 'Administrativo' then
          cdsIndicativoSuspensao.data := TCtrlPessoaFilialPessoa(Pessoa).ListIndicativoSusp(true)
  else
          cdsIndicativoSuspensao.data := TCtrlPessoaFilialPessoa(Pessoa).ListIndicativoSusp(false);}
	//Cássio Rovaroto - SIG nº 381475.60441 - Fim
  Result:=true;
     //Higor Nayde SOL 250383.17344 Nº PPM             839025
end;

procedure TfrmCadFilial.dbcmbTipoChange(Sender: TObject);
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  //AtualizaIndicativoSuspensao;     //Higor Nayde SOL 250383.17344 Nº PPM             839025
  cdsIndicativoSuspensao.data := TCtrlPessoaFilialPessoa(Pessoa).ListIndicativoSusp(dbcmbTipo.ItemIndex);
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim

  //Everson Luiz - SIG70569 - Início
  //Cássio Rovaroto - SIG nº 62232 - Início
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
  //  case dbcmbTipo.ItemIndex of
  //    0: edtNumero.MaxLength := 17;
  //    1: edtNumero.MaxLength := 20;
  //    2: edtNumero.MaxLength := 10;
  //  end;

   case dbcmbTipo.ItemIndex of
      0: begin
          edtNumero.MaxLength := 21;
          cmbMatProc.Enabled := True;
         end;
      1: begin
          edtNumero.MaxLength := 20;
          cmbMatProc.Enabled := True;
         end;
      //Everson Cunha - SIG38475 - Ini
      {2: begin
          edtNumero.MaxLength := 10;
          cmbMatProc.Enabled := False;
          cmbMatProc.ItemIndex := 5;
          CdsProcessos.FieldByName('CODMATPROC').AsInteger := 6;
         end;
      3: begin }
      2: begin
      //Everson Cunha - SIG38475 - Fim
          edtNumero.MaxLength := 16;
          cmbMatProc.Enabled := True;
         end;
   end;          
  end;
  //Cássio Rovaroto - SIG nº 62232 - Fim
  //Everson Luiz - SIG70569 - Fim
  inherited;

end;

// André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
//Everson Cunha - SIG38475 - Ini
{
procedure TfrmCadFilial.cbxNaturezaTriCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
  modified: Boolean);
begin
  if (CdsSubTipo.State in [dsInsert, dsEdit]) then
  //if not(CdsSubTipo.IsEmpty) then
  begin
    cdsNaturezaJuridica.Data := TCtrlPessoaFilialPessoa(Pessoa).ListCodNatJurid(cdsTpNatJuridica.FieldByName('TIPO').asInteger);
    if cbxTpNatJuridica.text <> '' then
        cbxNaturezaTri.Enabled := True;

  end;
end;}
//Everson Cunha - SIG38475 - Fim
// André Imakawa SOL 256943-17659 PPM 1205530 - Fim

procedure TfrmCadFilial.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  //Everson Cunha - SIG38475 - Ini
  {
  cbxTpNatJuridica.ReadOnly := False;
  cbxTpNatJuridica.text := '';
  cbxNaturezaTri.Enabled := False;}
  //Everson Cunha - SIG38475 - Fim
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio

  edtDescCodLotacao.Text := ''; //Cássio Rovaroto -  SIG nº 38475.59823
end;

procedure TfrmCadFilial.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  // André Imakawa SOL 256943-17659 PPM 1205530 - Inicio
  //Everson Cunha - SIG38475 - Ini
  {
  cbxTpNatJuridica.ReadOnly := True;
  if not(cdsSubtipo.FieldByName('IDNATJURIDICA').IsNull) then
  begin
        cdsNaturezaJuridica.Data := TCtrlPessoaFilialPessoa(Pessoa).ListCodNatJurid(0);
        cdsNaturezaJuridica.Locate('IDNATJURIDICA',cdsSubtipo.FieldByName('IDNATJURIDICA').AsInteger, []);
        cdsTpNatJuridica.Locate('TIPO',cdsNaturezaJuridica.FieldByName('TIPO').AsInteger , []);
        cbxTpNatJuridica.text := cdsNaturezaJuridica.FieldByName('DESCTIPO').AsString;
        cbxNaturezaTri.Text :=  cdsNaturezaJuridica.FieldByName('DESCRICAO').AsString;
  end;}
  //Everson Cunha - SIG38475 - Fim

  //cbxNaturezaTri.Text :=  cdsNaturezaJuridica.FieldByName('DESCRICAO').AsString
  // André Imakawa SOL 256943-17659 PPM 1205530 - Fim

  //Cássio Rovaroto -  SIG nº 38475.59823 - Início
  if dbEdtCodLotacao.Text = '' then
  edtDescCodLotacao.Clear;
  //Cássio Rovaroto -  SIG nº 38475.59823 - Fim
end;

procedure TfrmCadFilial.dbcmbCidadesProcExit(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG n 38475.60441 - Início
	if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
    edtUFSecaoJud.Text := CdsCidadesPro.FieldByName('CODESTADO').AsString;
    edtCodMunicipio.Text := CdsCidadesPro.FieldByName('CODMUNICIPIO').AsString;
    CdsProcessos.FieldByName('nomecidade').AsString :=  dbcmbCidadesProc.Text;
    CdsProcessos.FieldByName('uf').AsString :=  edtUFSecaoJud.Text;
    CdsProcessos.FieldByName('codmunicipio').AsString :=  edtCodMunicipio.Text;
  end;
  //Cássio Rovaroto - SIG n 38475.60441 - Fim
end;

procedure TfrmCadFilial.LimpaCamposProcessos;
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
//	dbcmbTipo.Text := '';    //Everson Luiz - SIG70569
  dbcmbTipo.ItemIndex := -1; //Everson Luiz - SIG70569
  edtNumero.Text := '';
  dbcmbCidadesProc.Text := '';
  edtUFSecaoJud.Text := '';
  edtCodMunicipio.Text := '';
  dbedtCodIdentVara.Text := '';
  dtpDataInicio.Text := '';
  dtpDataFim.Text := '';
  //Cássio Rovaroto - SIG nº 62232 - Início
  //dbcmbContribAbran.Text := '';
  //Cássio Rovaroto - SIG nº 62232 - Fim
  dbcmbExtSetenca.Text := '';
  //dbcmbIndDecisao.Text := ''; //Everson Luiz - SIG70569
  cbbProcAdmJud.Text := '';
  //cbxFormaApuracaoFap.Text := ''; //Everson Luiz - SIG70569
  cmbMatProc.Enabled := True; //Everson Luiz - SIG70569
//  cmbMatProc.Text := '';    //Everson Luiz - SIG70569
  cmbMatProc.ItemIndex := -1; //Everson Luiz - SIG70569
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.btnDockIndSuspOKClick(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto -  SIG nº 38475.60441 - Início
	if dbLkpCbxIndSusp.Value = EmptyStr then
  begin
    Application.MessageBox('É obrigatória a definição do Indicativo de Suspensão da Exigibilidade.', PChar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    dbLkpCbxIndSusp.SetFocus;
    Exit;
  end;

  if dbDtpDtDecisao.Text = '' then
  begin
  	Application.MessageBox('É obrigatória a informação da Data de Decisão da Suspensão.', PChar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    dbDtpDtDecisao.SetFocus;
    Exit;
  end;

  if rdGrpIndDeposito.ItemIndex =  -1 then
  begin
		Application.MessageBox('É necessário informar a existência, ou não, de Depósito Integral do Montante.', Pchar(ExtractFileName(Application.Title)), MB_ICONWARNING);
    Exit;
  end;

  if cdsProcessosXIndicativoSusp.State in [dsInsert, dsEdit] then
  begin
  	cdsProcessosXIndicativoSusp.FieldByName('INDICATDEPOSITO').AsInteger := rdGrpIndDeposito.ItemIndex;

    case rdGrpIndDeposito.ItemIndex of
    	0: cdsProcessosXIndicativoSusp.FieldByName('DEPOSITO').AsString := 'Não';
    	1: cdsProcessosXIndicativoSusp.FieldByName('DEPOSITO').AsString := 'Sim';
    end;

    cdsProcessosXIndicativoSusp.FieldByName('INDICATIVO').AsString := dbLkpCbxIndSusp.Value;
    cdsProcessosXIndicativoSusp.FieldByName('IDPROCESSO').asInteger := fIdProcesso;         

    cdsProcessosXIndicativoSusp.Post;
    btnDockIndSuspVoltarClick(Self);
  end;
  //Cássio Rovaroto -  SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.btnDockIndSuspVoltarClick(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
	DockDetIndSusp.Visible := False;
  dbGrdProcessoIndSusp.BringToFront;
  toolbtnInserirIndSusp.Enabled := True;
  toolbtnAlterarIndSusp.Enabled := True;
  toolbtnExcluirIndSusp.Enabled := True;
  toolbtnInserirIndSusp.Down := False;
  toolbtnAlterarIndSusp.Down := False;
  toolbtnExcluirIndSusp.Down := False;

  cdsProcessosXIndicativoSusp.Cancel;

  cdsProcessosXIndicativoSusp.Filtered := False;
  cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + cdsProcessos.FieldByName('IDPROCESSO').AsString;
  cdsProcessosXIndicativoSusp.Filtered := True;

  if cdsProcessosXIndicativoSusp.RecordCount = 0 then
  begin
    toolbtnAlterarIndSusp.Enabled := False;
    toolbtnExcluirIndSusp.Enabled := False;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.dbLkpCbxIndSuspChange(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
	if cdsIndicativoSuspensao.FieldByName('INDSUSP').AsString = '90' then
  begin
     rdGrpIndDeposito.ItemIndex := 0;
     rdGrpIndDeposito.Enabled := False;
  end
  else
  if cdsIndicativoSuspensao.FieldByName('INDSUSP').AsString = '02'   then
  begin
     rdGrpIndDeposito.ItemIndex := 1;
     rdGrpIndDeposito.Enabled := False;
  end
  else
	if cdsIndicativoSuspensao.FieldByName('INDSUSP').AsString = '03'   then
  begin
     rdGrpIndDeposito.ItemIndex := 1;
     rdGrpIndDeposito.Enabled := False;
  end
  else
  begin
    rdGrpIndDeposito.ItemIndex := -1;
  	rdGrpIndDeposito.Enabled := True;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.toolbtnInserirIndSuspClick(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
  dbLkpCbxIndSusp.Text:= '';
  dbDtpDtDecisao.TExt:= '';
  rdGrpIndDeposito.ItemIndex := -1;

  toolbtnInserirIndSusp.Down := True;
  toolbtnAlterarIndSusp.Enabled := False;
  toolbtnExcluirIndSusp.Enabled := False;

  DockDetIndSusp.Visible := True;

  btnDockIndSuspOK.Visible := True;
  btnDockIndSuspCanc.Visible := True;
  btnDockIndSuspVoltar.Visible := True;

  dbGrdProcessoIndSusp.SendToBack;
  dbLkpCbxIndSusp.SetFocus;

  cdsProcessosXIndicativoSusp.Insert;
  cdsProcessosXIndicativoSusp.FieldByName('IDPROCESSOSXINDICATIVOSUSP').AsInteger :=  TCtrlPessoaFilialPessoa(Pessoa).GetProxIdProcessosXIndicativoSusp;

  sTipoOperacao := 'Insert';
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.toolbtnAlterarIndSuspClick(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
	toolbtnAlterarIndSusp.Down := True;
  toolbtnInserirIndSusp.Enabled := False;
  toolbtnExcluirIndSusp.Enabled := False;

  DockDetIndSusp.Visible := True;

  btnDockIndSuspOK.Visible := True;
  btnDockIndSuspCanc.Visible := True;
  btnDockIndSuspVoltar.Visible := True;
  
  dbGrdProcessoIndSusp.SendToBack;
  rdGrpIndDeposito.ItemIndex := cdsProcessosXIndicativoSusp.FieldByName('INDICATDEPOSITO').AsInteger;


  cdsProcessosXIndicativoSusp.Edit;
  sTipoOperacao := 'Update';
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.toolbtnExcluirIndSuspClick(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
	if (MsgDlg('Deseja realmente excluir este registro?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
  begin
    cdsProcessosXIndicativoSusp.Delete;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.CmeDetalheDelete(Sender: TObject);
begin
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
  if pgctrlDetalhe.ActivePage = tbshProcessos then
  begin

    //Everson Luiz - SIG70569 - Início
    cdsProcessosXIndicativoSusp.Filtered := False;
    cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + CdsProcessos.fieldbyname('IDPROCESSO').AsString;
    cdsProcessosXIndicativoSusp.Filtered := True;
    //Everson Luiz - SIG70569 - Fim

	  if cdsProcessosXIndicativoSusp.RecordCount > 0 then
  	begin
      while not cdsProcessosXIndicativoSusp.Eof do
      begin
        cdsProcessosXIndicativoSusp.Delete;
        cdsProcessosXIndicativoSusp.Next;
      end;
  	end;
  end;

  cdsProcessosXIndicativoSusp.Filtered := False; //Everson Luiz - SIG70569

  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
  inherited;
end;

procedure TfrmCadFilial.pgctrlProcessosChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	if pgctrlProcessos.ActivePage = tbsIndicativoSusp then
  begin
    if (cdsProcessos.State in [dsInsert, dsEdit])  then
    begin
    	if (dbcmbTipo.ItemIndex = -1) then
      begin
      	pgctrlProcessos.ActivePageIndex := pgctrlProcessos.ActivePageIndex - 1;
  			pgctrlProcessos.OnChange(Self);
      	Application.MessageBox('É necessário definir o Tipo do Processo antes de indicar as informações de Suspensão da Exigibilidade.', PChar(ExtractFileName(Application.Title)), MB_ICONWARNING);
      	dbcmbTipo.SetFocus;
      	Exit;
      end
      else
      begin
        //Everson Luiz - SIG70569 - Início
        //if (cdsProcessos.FieldByName('IDPROCESSO').asInteger <= 0) and not(bPossuiIndicativo) then
        //begin
        //	cdsProcessosXIndicativoSusp.Data := TCtrlPessoaFilialPessoa(Pessoa).ListProcessosXIndicativoSusp(cds.FieldByName('IDPESSOA').AsFloat);
        //  bPossuiIndicativo := true;
        //end;
        //Everson Luiz - SIG70569 - Fim

        bbtnOkDet.Enabled := False;
        bbtnCancelarDet.Enabled := False;
        bbtnVoltarDet.Enabled := False;

        cdsProcessosXIndicativoSusp.Filtered := False;
  			cdsProcessosXIndicativoSusp.Filter := 'IDPROCESSO = ' + cdsProcessos.FieldByName('IDPROCESSO').AsString;
  			cdsProcessosXIndicativoSusp.Filtered := True;

        //Everson Luiz - SIG70569 - Início
        if cdsProcessosXIndicativoSusp.RecordCount = 0 then
 	     	begin
      	  toolbtnAlterarIndSusp.Enabled := False;
    	    toolbtnExcluirIndSusp.Enabled := False;
      	end
        else
        begin
          toolbtnAlterarIndSusp.Enabled := True;
    	    toolbtnExcluirIndSusp.Enabled := True;
        end;
        //Everson Luiz - SIG70569 - Fim

        CdsIndicativoSuspensao.Data := TCtrlPessoaFilialPessoa(Pessoa).ListIndicativoSusp(dbcmbTipo.ItemIndex);
      end;
    end;
  end
  else
  begin
  	bbtnOkDet.Enabled := True;
    bbtnCancelarDet.Enabled := True;
    bbtnVoltarDet.Enabled := True;

    //Everson Luiz - SIG70569 - Início
		//if cdsProcessosXIndicativoSusp.RecordCount = 0 then
 	 	//begin
    //	toolbtnAlterarIndSusp.Enabled := False;
    //	toolbtnExcluirIndSusp.Enabled := False;
  	//end;
    //Everson Luiz - SIG70569 - Fim
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  //Everson Luiz - SIG70659 - Início
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
  //if pgctrlDetalhe.ActivePage = tbshProcessos then
  //begin
  //  if cdsProcessosXIndicativoSusp.RecordCount > 0 then
  //  begin
  //		cdsProcessosXIndicativoSusp.First;
  //  	while not cdsProcessosXIndicativoSusp.Eof do
  //  	begin
  //    	cdsProcessosXIndicativoSusp.Delete;
  //    	cdsProcessosXIndicativoSusp.Next;
  //  	end;
  //  end;
  //  cdsProcessos.Cancel;
  //  bbtnVoltarDetClick(Sender);
  //end;
  //Cássio - SIG nº 38475.60441 - Fim

   if pgctrlDetalhe.ActivePage = tbshProcessos then
   begin
      cdsProcessos.Cancel;
      cdsProcessosXIndicativoSusp.Cancel;
      bbtnVoltarDetClick(Sender);
   end;
  //Everson Luiz - SIG70659 - Fim
end;

procedure TfrmCadFilial.cmbMatProcChange(Sender: TObject);
begin
  inherited;
	//Cássio Rovaroto - SIG nº 38475.60441 - Início
  if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
    if cmbMatProc.Text <> '' then //Everson Luiz SIG70569
    begin
      case cmbMatProc.ItemIndex of
        0: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 1;
        //Everson Cunha - SIG38475 - Ini
        {1: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 2;
        2: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 3;
        3: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 4;
        4: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 5;
        5: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 6;
        6: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 7;
        7: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 8;
        8: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 99;}
        1: CdsProcessos.FieldByName('CODMATPROC').AsInteger := 7;
        //Everson Cunha - SIG38475 - Fim
      end;
    end
    else
    begin
      CdsProcessos.FieldByName('CODMATPROC').AsInteger := 0;  //Everson Luiz SIG70569
      cmbMatProc.ItemIndex := -1;                             //Everson Luiz SIG70569
    end;

  	CdsProcessos.FieldByName('CODMATPROCDESC2').AsString := cmbMatProc.Text;
	end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.dbcmbExtSetencaChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
  	case dbcmbExtSetenca.ItemIndex of
    	0: CdsProcessos.FieldByName('EXTENDECISAO').AsInteger := 1;
    	1: CdsProcessos.FieldByName('EXTENDECISAO').AsInteger := 2;
  	end;
  	CdsProcessos.FieldByName('EXTENDECISAO2').AsString := dbcmbExtSetenca.Text;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

//Everson Luiz - SIG70569 - Início //Descontinuado nas novas versões do eSocial
{procedure TfrmCadFilial.dbcmbIndDecisaoChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
  	case dbcmbIndDecisao.ItemIndex of
    	0: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 1;
    	1: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 2;
    	2: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 3;
    	3: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 4;
    	4: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 5;
    	5: CdsProcessos.FieldByName('INDICATDECISAO').AsInteger := 9;
  	end;
    CdsProcessos.FieldByName('INDICATDECISAO2').AsString := dbcmbIndDecisao.Text;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;  }
//Everson Luiz - SIG70569 - Fim

procedure TfrmCadFilial.cbbProcAdmJudChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
  	case cbbProcAdmJud.ItemIndex of
    	0: CdsProcessos.FieldByName('PROCADMJUD').AsInteger := 1;
    	1: CdsProcessos.FieldByName('PROCADMJUD').AsInteger := 2;
  	end;
    CdsProcessos.FieldByName('PROCADMJUD2').AsString := cbbProcAdmJud.Text;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

//Everson Luiz SIG70569 - Início     Campo descontinuado nas novas versões do manual do eSocial
{procedure TfrmCadFilial.cbxFormaApuracaoFapChange(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	if (CdsProcessos.State in [dsInsert, dsEdit]) then
  begin
  	case cbxFormaApuracaoFap.ItemIndex of
    	0: CdsProcessos.FieldByName('APURFAP').AsInteger := 1;
    	1: CdsProcessos.FieldByName('APURFAP').AsInteger := 2;
  	end;
  	CdsProcessos.FieldByName('APURFAP2').AsString := cbxFormaApuracaoFap.Text;
  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;}
//Everson Luiz SIG70569 - Fim

//Cássio Rovaroto - SIG nº 62232 - Início
//procedure TfrmCadFilial.dbcmbContribAbranChange(Sender: TObject);
//begin
//  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
//	if (CdsProcessos.State in [dsInsert, dsEdit]) then
//  begin
//  	case dbcmbContribAbran.ItemIndex of
//    	0: CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger := 1;
//    	1: CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger := 2;
//    	2: CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger := 3;
//    	3: CdsProcessos.FieldByName('CONTRIABRANDECISAO').AsInteger := 4;
//  	end;
//  	CdsProcessos.FieldByName('CONTRIABRANDECISAO2').AsString := dbcmbContribAbran.Text;
//  end;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
//end;
//Cássio Rovaroto - SIG nº 62232 - Início

procedure TfrmCadFilial.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
	cdsProcessosXIndicativoSusp.Filtered := False; //Cássio Rovaroto - SIG nº 38475.60441
end;

procedure TfrmCadFilial.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 38475.60441 - Início
	LimpaCamposProcessos;
  cdsProcessosXIndicativoSusp.Filtered := False;
  //Cássio Rovaroto - SIG nº 38475.60441 - Fim
end;

procedure TfrmCadFilial.btnProcurarLotacaoClick(Sender: TObject);
begin
  if (Cds.State in [dsInsert, dsEdit]) then
  begin
  	inherited;

    msLotacao.Executar;
    if (msLotacao.RetornouValor) then
    begin
      CdsSubTipo.FieldByName('CODLOTACAOESOCIAL').AsString := msLotacao.ValoresChave[0];
      edtDescCodLotacao.Text := msLotacao.ValoresChave[1];
    end;
  end;
end;

procedure TfrmCadFilial.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  edtDescCodLotacao.Clear; //Cássio Rovaroto - SIG nº 38475.59823
end;

end.

