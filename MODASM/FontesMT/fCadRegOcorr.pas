{-------------------------------------------------------------------------------
--------------------------------- ALTERAÇÕES -----------------------------------
--------------------------------------------------------------------------------
 N. SIG.............: 134234
 Data da Alteração..: 26/04/2023
 Responsável........: Everson Cunha
 Descrição..........: Inclusão dos campos: Ocorrências >> Data Validade ASO e
                      CAT >> Último dia Trabalhado
--------------------------------------------------------------------------------
 N. SIG.............: 130015
 Data da Alteração..: 10/11/2021
 Responsável........: Everson Cunha
 Descrição..........: Ajustes para adequação ao leiaute s-2210 eSocial
--------------------------------------------------------------------------------
 N. SIG.............: 118663
 Data da Alteração..: 20/08/2021
 Responsável........: Ewerton Beltramini
 Descrição..........: Correção de erro ao excluir um arquivo.
--------------------------------------------------------------------------------
 N. SIG.............: 38475
 Data da Alteração..: 08/01/2021
 Responsável........: Everson Cunha
 Descrição..........: Melhorias/ajustes eSocial versão simplificada 1.0
--------------------------------------------------------------------------------
 Rotina             : Sel, dbCmbOrigRetificacaoExit, dbchkFLGOBITOClick,
                      bbtnOkDetClick
 N. SIG..........   : 38475.60437
 Data da Alteração: : 22/12/2017
 Alteração Form:    : fCadRegOcorr
 Responsável:       : Cássio Florêncio Rovaroto
 Descrição.......   : Inclusão de itens para o Tipo de ASO; Iclusão de campos
                      para tratamento de retificação de afastamento.
--------------------------------------------------------------------------------
 Nº SIG......: 21360
 Data........: 06/09/2016
 Responsável.: Michelle Suellyn Mota
 Descrição...: solicito que para o lançamentos dos eventos abaixo relacionados
               o sistema permita o lançamento apenas dos campos -
               "Tipo de Ocorrência" - "Data de Início" - e "Data Retorno".
 Alterações..: Alterada forma de consistir a obrigatoriedade do campo
               "Motivo Oficial". Alterações na grid tela inicial (DFM).
--------------------------------------------------------------------------------
 Nº SOL:         250391.17474
 Nº PPM:         959204
 Data da Alteração: 08/04/2016
 Alteração Form: Mudança no leiaute e novos campos
 Responsável:    Michelle Suellyn Mota
 Descrição:      Alterações de leiaute e novos campos para atender o eSocial.
   	             Criação de novas abas, campos novos, alteração na disposição
                 dos campos na tela, nova interface dentro da aba CAT.
--------------------------------------------------------------------------------
 Autor(a)    : Higor Nayde Ferreira
 Data        : 03/06/2015
 Pendência   : SOL 255543 KINTANA 820947
 Descricao   : Ajuste de versão sem o botão de busca
--------------------------------------------------------------------------------
Rotina......: varias
N. Sol......: 229353-16212
N. Kintana..: 434575
Data........: 18-09-2014
Responsável.: Higor Nayde
Descrição...: ajuste referente ao e-social
--------------------------------------------------------------------------------}

unit fCadRegOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls,
  MAHlpBtn, TB97Tlbr, TREdit, Mask, StdCtrls, Buttons, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, CMProcura,
  wwdbdatetimepicker, CMDateTimePicker, wwdblook, ImgList, DBClient,
  CmEventosCadastro, uCMClientDataSet, fCadastroMestreDetMT, uCtrlCID,
  uCtrlGlobalRH, uCtrlTipOcMed, uCtrlRegOcorr, uCtrlCargo, uCtrlPessoaCandidato,
  DBGrids, uCtrlMotivo, wwdbedit, Wwdotdot, Wwdbcomb, uCmSqlParams; //Michelle Mota - SOL: 250391.17474 - PPM: 959204

type
  TfrmCadRegOcorr = class(TFrmCadastroMestreDetMT)
    Label1: TLabel;
    dbedMatricula: TDBEdit;
    Label10: TLabel;
    dbedNome: TDBEdit;
    tbshObserv: TTabSheet;
    dbmemFortes: TDBMemo;
    dbedSit: TDBEdit;
    dbedCargo: TDBEdit;
    sbtnFicha: TToolbarButton97;
    ToolbarSep972: TToolbarSep97;
    sbtnProcurarCand: TToolbarButton97;
    CdsCID: TCMClientDataSet;
    CdsParamRH: TCMClientDataSet;
    CdsDet: TCMClientDataSet;
    MontaSelectCand: TMontaSelect;
    MontaSelectCID: TMontaSelect;
    CdsTabOcorr: TCMClientDataSet;
    CdsCargo: TCMClientDataSet;
    dsCargo: TwwDataSource;
    sbtnCAT: TToolbarButton97;
    MontaSelectNaturezaLesao: TMontaSelect;
    MontaSelectAgenteCausador: TMontaSelect;
    MontaSelectParteAtingida: TMontaSelect;
    pngDados: TPageControl;
    tbsDados: TTabSheet;
    tbsExames: TTabSheet;
    tbntbDatas: TNotebook;
    Label3: TLabel;
    Label4: TLabel;
    dbedDatPlan: TCMDateTimePicker;
    mskedHora: TMaskEdit;
    dbedDatReal: TCMDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    dbedDatInicio: TCMDateTimePicker;
    dtedDataRetorno: TCMDateTimePicker;
    Label2: TLabel;
    dblckTipoEntr: TwwDBLookupCombo;
    gbxExaminador: TGroupBox;
    dbedAvaliador: TDBEdit;
    bbtnProcMedico: TBitBtn;
    Label5: TLabel;
    dbedAvaliacao: TDBRealEdit;
    lblLicenca: TLabel;
    dbedLicenca: TDBRealEdit;
    dbmObser: TDBMemo;
    Label9: TLabel;
    tb97Situacao: TToolbarButton97;
    Label20: TLabel;
    dblckMotivoOficial: TwwDBLookupCombo;
    Label21: TLabel;
    Label22: TLabel;
    dtDataAso: TCMDateTimePicker;
    Label23: TLabel;
    grpCID: TGroupBox;
    dbedCODCID: TDBEdit;
    edCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    Label6: TLabel;
    Label26: TLabel;
    tbsCAT: TTabSheet;
    dbgrdCATDet: TwwDBGrid;
    pnlCATDet: TPanel;
    pgcCAT: TPageControl;
    tbsCATGeral: TTabSheet;
    tbsCATAtestado: TTabSheet;
    grpDadosCAT: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    dbedtNUMEROCAT: TDBEdit;
    edtDtAcidente: TCMDateTimePicker;
    dbchkFLGCOMUNICACAOPOLICIAL: TDBCheckBox;
    dbchkFLGOBITO: TDBCheckBox;
    Label52: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    edtDTATENDIMENTO: TCMDateTimePicker;
    dbchkFLGAFASTAMENTO: TDBCheckBox;
    dbchkFLGINTERNACAO: TDBCheckBox;
    grbCID: TGroupBox;
    dbedtCATCODCID: TDBEdit;
    edtDescCID: TEdit;
    btnBuscaCidAtestado: TBitBtn;
    grbExaminador: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    btnBuscaExaminadorAtestado: TBitBtn;
    btnPesqSitGeradora: TBitBtn;
    btnLimpaSitGeradora: TBitBtn;
    btnPesqNatLesao: TBitBtn;
    btnLimpaNatLesao: TBitBtn;
    dbgrdMonitora: TwwDBGrid;
    pnlMonitora: TPanel;
    Label71: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    dbdtDTEXAME: TCMDateTimePicker;
    CdsMotivo: TCMClientDataSet;
    DockMonitora: TDock97;
    ToolbarMonitora: TToolbar97;
    toolbtnInserirMonitora: TToolbarButton97;
    toolbtnAlterarMonitora: TToolbarButton97;
    toolbtnExcluirMonitora: TToolbarButton97;
    DockDetMonitora: TDock97;
    Toolbar972: TToolbar97;
    btnDockMonitoraOK: TBitBtn;
    btnDockMonitoraCanc: TBitBtn;
    btnDockMonitoraVoltar: TBitBtn;
    CdsMonitora: TCMClientDataSet;
    dsMonitora: TwwDataSource;
    CdsResponsavel: TCMClientDataSet;
    CdsCatPess: TCMClientDataSet;
    dsCatPess: TwwDataSource;
    edtNroInscrCRMExaminador: TEdit;
    medtHORAACIDENTE: TMaskEdit;
    medtHORASTRABANTESACID: TMaskEdit;
    edtSitGerAcidTrab: TEdit;
    CdsCidades: TCMClientDataSet;
    CdsCatOrigem: TCMClientDataSet;
    MontaSelectSitGerAcidTrab: TMontaSelect;
    CdsCNPJFuncef: TCMClientDataSet;
    medtHORAATENDIMENTO: TMaskEdit;
    dbedtDURACAOTRATAMENTO: TDBRealEdit;
    edtExaminadorAtestado: TEdit;
    edtdbOrgaoClasse: TwwDBComboBox;
    edtInscrExamAtestado: TEdit;
    edtUFExamAtestado: TEdit;
    CmDetalheMonitora: TCmEventosCadastro;
    cbbTipoASO: TwwDBComboBox;
    dbedtDESCNATLESAO: TEdit;
    cbbOrdemEx: TwwDBComboBox;
    cbbIndicaResult: TwwDBComboBox;
    CdsPesquisaRegistro: TCMClientDataSet;
    cbbTipoAcidenteCat: TwwDBComboBox;
    cbbTipoCat: TwwDBComboBox;
    cbbCATEmitidaPor: TwwDBComboBox;
    edtCodNatLesao: TEdit;
    edtCodSitGerAcidTrab: TEdit;
    cbbTpAcidTransito: TwwDBComboBox;
    btnLimpaCidOcorr: TBitBtn;
    btnLimpaExamOcorr: TBitBtn;
    btnLimpaExamAtest: TBitBtn;
    btnLimpaCIDAtest: TBitBtn;
    dbRgpMotAfastAnt: TDBRadioGroup;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    dbCmbOrigRetificacao: TwwDBComboBox;
    dbLkpProcessos: TwwDBLookupCombo;
    cdsProcessos: TCMClientDataSet;
    dtpDataObito: TCMDateTimePicker;
    Label16: TLabel;
    tbsLocal: TTabSheet;
    grpDadosLocalAcid: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    lblCEP: TLabel;
    wdblkpcmbIDCIDADES: TwwDBLookupCombo;
    dbedtDESCLOGRADOURO: TDBEdit;
    dbedtNUMEROLOGRADOURO: TDBEdit;
    dbedtCNPJ: TDBEdit;
    edtUF: TEdit;
    edtCodMunicipio: TEdit;
    cbbTipoLocal: TwwDBComboBox;
    dbedtCEP: TDBEdit;
    cbbLATERALCORPOATINGIDA: TwwDBComboBox;
    Label66: TLabel;
    edtCodParteAtingida: TDBEdit;
    edtDescParteAtingida: TEdit;
    Label64: TLabel;
    btnPesqParteAtingida: TBitBtn;
    edtCodCausaAcid: TEdit;
    edtDescCausaAcid: TEdit;
    Label67: TLabel;
    btnPesqAgenteCausador: TBitBtn;
    btnLimpaAgenteCausador: TBitBtn;
    btnParteCorpo: TBitBtn;
    dbLkpProcRealizado: TwwDBLookupCombo;
    lblProcRealizado: TLabel;
    cdsProcRealizado: TCMClientDataSet;
    wdblkpcmbIDCATPESSORIGEM: TwwDBLookupCombo;
    Label50: TLabel;
    dbDtUltDiaTrab: TCMDateTimePicker;
    lblDtUltDiaTrab: TLabel;
    lblValidadeASO: TLabel;
    dbDtValidadeASO: TCMDateTimePicker;
    edtMesesValidadeASO: TRealEdit;
    lblMesesValidadeASO: TLabel;
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbtnFichaClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbedAvaliacaoExit(Sender: TObject);
    procedure dblckTipoEntrChange(Sender: TObject);
    procedure dbedDatInicioChange(Sender: TObject);
    procedure dtedDataRetornoChange(Sender: TObject);
    procedure bbtnProcMedicoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dsDetStateChange(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure sbtnProcurarCandClick(Sender: TObject);
    procedure dbedCODCIDExit(Sender: TObject);
    procedure sbtnCATClick(Sender: TObject);
    procedure CdsDetAfterScroll(DataSet: TDataSet);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure pgctrlDetalheChange(Sender: TObject);
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dblckMotivoOficialChange(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure toolbtnInserirMonitoraClick(Sender: TObject);
    procedure toolbtnAlterarMonitoraClick(Sender: TObject);
    procedure MontaAbaMonitora;
    procedure toolbtnExcluirMonitoraClick(Sender: TObject);
    //procedure MostraDadosResponsavel(vIdPessoa: integer); //Everson Cunha - SIG38475
    //procedure cbbTipoRegCatChange(Sender: TObject); //Everson Cunha - SIG38475
    //procedure rbCNPJCatClick(Sender: TObject); //Everson Cunha - SIG38475
    //procedure rbCPFCatClick(Sender: TObject); //Everson Cunha - SIG38475
    procedure cbbTipoAcidenteCatChange(Sender: TObject);
    procedure cbbTipoCatChange(Sender: TObject);
    procedure HabilitaCamposDados;
    procedure DesabilitaCamposDados;
    procedure btnPesqParteAtingidaClick(Sender: TObject);
    procedure btnPesqAgenteCausadorClick(Sender: TObject);
    procedure MostraDadosExaminador(vIdPessoa: integer);
    procedure MostraDadosExaminadorOcorr(vIdPessoa: integer);
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure VerificaTipoOcorrencia;
    procedure HabDesabTipoAcidTransito;
    procedure btnDockMonitoraOKClick(Sender: TObject);
    procedure btnPesqSitGeradoraClick(Sender: TObject);
    procedure cbbTipoLocalChange(Sender: TObject);
    procedure CdsCatPessAfterInsert(DataSet: TDataSet);
    procedure wdblkpcmbIDCIDADESChange(Sender: TObject);
    procedure btnLimpaSitGeradoraClick(Sender: TObject);
    procedure VerificaObrigCNPJFuncef;
    //procedure VerificaObrigCNPJRegCAT; //Everson Cunha - SIG38475
    procedure btnPesqNatLesaoClick(Sender: TObject);
    procedure btnLimpaNatLesaoClick(Sender: TObject);
    procedure btnBuscaCidAtestadoClick(Sender: TObject);
    procedure btnBuscaExaminadorAtestadoClick(Sender: TObject);
    procedure btnLimpaAgenteCausadorClick(Sender: TObject);
    procedure btnLimpaSituacaoGeradoraClick(Sender: TObject);
    procedure btnDockMonitoraCancClick(Sender: TObject);
    procedure btnDockMonitoraVoltarClick(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeMonitoraBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dbchkFLGCOMUNICACAOPOLICIALClick(Sender: TObject);
    procedure dbchkFLGOBITOClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure edtCodCnesSSRKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure edtDTATENDIMENTOChange(Sender: TObject);
    procedure medtHORAATENDIMENTOChange(Sender: TObject);
    procedure edtdbOrgaoClasseChange(Sender: TObject);
    procedure dbchkFLGAFASTAMENTOClick(Sender: TObject);
    procedure dbchkFLGINTERNACAOClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimpaCidOcorrClick(Sender: TObject);
    procedure btnLimpaExamOcorrClick(Sender: TObject);
    procedure btnLimpaExamAtestClick(Sender: TObject);
    procedure btnLimpaCIDAtestClick(Sender: TObject);
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    procedure dbCmbOrigRetificacaoExit(Sender: TObject);
    procedure cbbTipoLocalEnter(Sender: TObject);
    procedure btnParteCorpoClick(Sender: TObject);
    procedure cbbTipoAcidenteCatEnter(Sender: TObject);
    procedure cbbTipoCatEnter(Sender: TObject);
    procedure dbedtDURACAOTRATAMENTOChange(Sender: TObject);
    procedure edtdbOrgaoClasseEnter(Sender: TObject);
    procedure cbbCATEmitidaPorEnter(Sender: TObject);
    procedure cbbLATERALCORPOATINGIDAEnter(Sender: TObject);
    procedure edtMesesValidadeASOExit(Sender: TObject);
    procedure dbDtValidadeASOExit(Sender: TObject);
    procedure dbDtValidadeASOChange(Sender: TObject);
  private
    CtrlCID: TCtrlCID;
    CtrlGlobalRH: TCtrlGlobalRH;
    CtrlTipOcMed: TCtrlTipOcMed;
    CtrlRegOcorr: TCtrlRegOcorr;
    CtrlCargo: TCtrlCargo;
    CtrlPessoaCandidato: TCtrlPessoaCandidato;
    CtrlMotivo: TCtrlMotivo; //Michelle Mota - SOL: 250391.17474 - PPM: 959204
    dIdPessoa: double;
    // Michelle Mota - SOL: 250391.17474 - PPM: 959204
    bCandAprovado, bEmpregado, ObrigaMonitora,
    //ObrigaHoraAcid, ObrigaHoraAcidAntes, //Everson Cunha - SIG130015
    ObrigaCNPJFuncef,
    //ObrigaDataCatOrigem: boolean; //Everson Cunha - SIG38475
    ObrigaAbaAtestado: Boolean;
    // Michelle Mota - SOL: 250391.17474 - PPM: 959204
    procedure MudaDataRetorno;
    procedure Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
  end;

var
  frmCadRegOcorr: TfrmCadRegOcorr;
  ObrigaMotivo : Boolean; // Michelle Mota - SIG 21360

implementation

uses
  uSistema, uMensErro, uCtrlPadroes, uCtrlUsoGeralRH, fParamPCMSO, fLancaFalta,
  dCds, fProcuraPessoaDoc, fParamRelCAT, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmCadRegOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegOcorr := TCtrlRegOcorr.Create;
  CtrlRegOcorr.InitializeAs(Padroes);
  CtrlRegOcorr.CdsHstAsMed := CdsDet;

  CtrlCID := TCtrlCID.Create;
  CtrlCID.InitializeAs(Padroes);

  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  CtrlCargo := TCtrlCargo.Create;
  CtrlCargo.InitializeAs(Padroes);

  CtrlPessoaCandidato := TCtrlPessoaCandidato.Create(CtrlUsoGeralRH.UsuXFilial, CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
  CtrlPessoaCandidato.InitializeAs(Padroes);

  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);
  frmProcuraPessoaDoc.TabelaSubTipo := 'FORNSERV';
  frmProcuraPessoaDoc.FiltroSubTipo := 'PESSOA.IDPESSOA       = FORNSERV.IDPESSOA';

  CdsParamRH.Data := CtrlGlobalRH.GetParamRH('NORMALINI, IDRUBFALTA, FLGNUMERAMATRIC, TAMANHOMATRIC');
  CdsTabOcorr.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;

  with (MontaSelect.Filtro) do
  begin
    Clear;
    // Estabelecimento(s) habilitados para o usuário
    if (CtrlUsoGeralRH.UsuXFilial <> '') then
      Add('FUNCIONARIO.IDESTAB IN ' + CtrlUsoGeralRH.UsuXFilial);

    // C. de Custo(s) habilitado(s) para o usuário
    if (CtrlUsoGeralRH.UsuXCCusto <> '') then
      Add('FUNCIONARIO.CODCENTROCUSTO IN ' + CtrlUsoGeralRH.UsuXCCusto);

    // Usuário Individual
    if (CtrlUsoGeralRH.IdUsuarioGeral <> '') then
      Add('FUNCIONARIO.IDPESSOA = ' + CtrlUsoGeralRH.IdUsuarioGeral);

    if not (CtrlUsoGeralRH.UsuarioRH) then
      Add('FUNCIONARIO.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa));

    Add('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
    Add('FUNCIONARIO.IDCARGO   = CARGO.IDCARGO(+)');
  end;

  Sel(true, true, -1);

  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  pnlControlesDet.Align := alClient;
  pnlCATDet.Align := alClient;
  pnlMonitora.Align := alClient;
  ObrigaMonitora := False;
  //ObrigaHoraAcid := False; //Everson Cunha - SIG130015
  //ObrigaHoraAcidAntes := False; //Everson Cunha - SIG130015
  CtrlMotivo := TCtrlMotivo.Create;
  CtrlMotivo.InitializeAs(Padroes);

  CdsMotivo.Data := CtrlMotivo.ListMotivo_MODASM;
  CdsCidades.Data := CtrlRegOcorr.ListCidade;
  //CdsAgenteQuimico.Data := CtrlRegOcorr.ListAgenteQuimico; //Everson Cunha - SIG38475
  cdsProcRealizado.Data := CtrlRegOcorr.ListProcRealizado; //Everson Cunha - SIG38475

  //CtrlRegOcorr.CdsCatPessXOutros := CdsCatPessXOutros; //Everson Cunha - SIG38475
  CtrlRegOcorr.CdsCatPess := CdsCatPess;
  CtrlRegOcorr.CdsHstAsMedXExame := CdsMonitora;
  CtrlRegOcorr.Operacao('Insert');
  ObrigaAbaAtestado := False;
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204

  {Início - Michelle Mota - SIG 21360}
  ObrigaMotivo := False;
  {Término - Michelle Mota - SIG 21360}
end;

// Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
procedure TfrmCadRegOcorr.HabilitaCamposDados;
begin

    HabDesabTipoAcidTransito;

    dtDataAso.Enabled := True;
    cbbTipoASO.Enabled := True;
    edtMesesValidadeASO.Enabled := True; //Everson Cunha - SIG134234
    dbDtValidadeASO.Enabled := True; //Everson Cunha - SIG134234

    dtDataAso.Color := clWhite;
    cbbTipoASO.Color := clWhite;
    edtMesesValidadeASO.Color := clWhite; //Everson Cunha - SIG134234
    dbDtValidadeASO.Color := clWhite;//Everson Cunha - SIG134234
end;

procedure TfrmCadRegOcorr.DesabilitaCamposDados;
begin

    HabDesabTipoAcidTransito;

    dtDataAso.Text := '';
    cbbTipoASO.Text := '';
    edtMesesValidadeASO.Text := '0'; //Everson Cunha - SIG134234
    edtMesesValidadeASO.Value := 0; //Everson Cunha - SIG134234
    dbDtValidadeASO.Text := '';//Everson Cunha - SIG134234

    dtDataAso.Enabled := False;
    cbbTipoASO.Enabled := False;
    edtMesesValidadeASO.Enabled := False; //Everson Cunha - SIG134234
    dbDtValidadeASO.Enabled := False; //Everson Cunha - SIG134234

    dtDataAso.Color := clSilver;
    cbbTipoASO.Color := clSilver;
    edtMesesValidadeASO.Color := clSilver; //Everson Cunha - SIG134234
    dbDtValidadeASO.Color := clSilver;//Everson Cunha - SIG134234

    if (CdsDet.State in [dsInsert, dsEdit]) then begin
      CdsDet.FieldByName('DTASO').Value := Null;
      CdsDet.FieldByName('TIPOASO').Value := Null;
      CdsDet.FieldByName('DT_VALIDADE_ASO').Value := Null; //Everson Cunha - SIG134234

      //Everson Cunha - SIG38475 - Ini
      //CdsDet.FieldByName('CODPROCEDMEDTUSS').Value := Null;
      //CdsDet.FieldByName('CODCNES').Value := Null;
      //CdsDet.FieldByName('CONTATO').Value := Null;
      //CdsDet.FieldByName('EMAIL').Value := Null;
      //Everson Cunha - SIG38475 - Fim
    end;
end;
// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204

procedure TfrmCadRegOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlCID);
  FreeAndNil(CtrlGlobalRH);
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(CtrlRegOcorr);
  FreeAndNil(CtrlCargo);
  FreeAndNil(CtrlPessoaCandidato);
  if (Assigned(frmProcuraPessoaDoc)) then
    FreeAndNil(frmProcuraPessoaDoc);
  FreeAndNil(CtrlMotivo); //Michelle Mota - SOL: 250391.17474 - PPM: 959204
  inherited;
end;

procedure TfrmCadRegOcorr.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
  begin
    dIdPessoa := StrToFloat(MontaSelect.ValoresChave[0]);
    Sel(true, true, dIdPessoa);
  end;
end;

procedure TfrmCadRegOcorr.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnProcurarCand.Enabled := sbtnProcurar.Enabled;
end;

procedure TfrmCadRegOcorr.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  if pgctrlDetalhe.ActivePage <> tbsCAT then
  begin
    dbedDatInicio.Text := '';
    dtedDataRetorno.Text := '';
    CdsDet.FieldByName('IDPESSOA').asInteger := Cds.FieldByName('IDPESSOA').asInteger;
  end;
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

procedure TfrmCadRegOcorr.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
var
  bPossuiRegistroTabFunc: boolean;
  iTamMatric: integer;
  DataAdmissao: string;
begin
  inherited;     
  Accept := CtrlRegOcorr.GravarRegOcorr;

  if not (Accept) then
    raise Exception.Create(CtrlRegOcorr.MessageInfo)
  else if (bCandAprovado) then
  begin
    dmCds.Cds.Data := CtrlPessoaCandidato.CtrlPessoaFuncionario.ListFuncionario(Cds.FieldByName('IDPESSOA').asString);
    bPossuiRegistroTabFunc := not (dmCds.Cds.IsEmpty);

    dmCds.Cds.Data := CtrlPessoaCandidato.CtrlSitFunc.ListGeral(dmCds.Cds.FieldByName('IDSITFUNC').asInteger, 'D');

    if (not (bPossuiRegistroTabFunc) or not (dmCds.Cds.IsEmpty)) and (MsgDlg('Efetiva Candidato Como Empregado?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
    begin
      if (Cds.FieldByName('DAT_ADMIS').asString = '') then
        DataAdmissao := DateToStr(Date)
      else
        DataAdmissao := Cds.FieldByName('DAT_ADMIS').asString;

      if (InputQuery('Data de Admissão', 'Confirme ou Altere:', DataAdmissao)) then
      begin
        if (CdsParamRH.FieldByName('FLGNUMERAMATRIC').asInteger = 1) then
          iTamMatric := CdsParamRH.FieldByName('TAMANHOMATRIC').asInteger
        else
          iTamMatric := 0;

        if (CtrlPessoaCandidato.AtivarComoEmpregado(Sistema.IdEmpresa, Cds.FieldByName('IDPESSOA').asFloat, Cds.FieldByName('IDCARGO').asFloat, Cds.FieldByName('TIPOCONTRATO').asString, Cds.FieldByName('TIPOPAGAMENTO').asString, Cds.FieldByName('SALARIO').asFloat, bPossuiRegistroTabFunc, iTamMatric, StrToDate(DataAdmissao))) then
        begin
          bEmpregado := true;
          bCandAprovado := false;
          MsgDlg(CtrlPessoaCandidato.MessageInfo, 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        end                  
        else
          raise Exception.Create(CtrlPessoaCandidato.MessageInfo);
      end;
    end;
  end;
end;

procedure TfrmCadRegOcorr.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  MudaDataRetorno;
end;

procedure TfrmCadRegOcorr.dsDetStateChange(Sender: TObject);
begin
  inherited;
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    dbedCODCIDExit(Sender);
    tb97Situacao.Visible := (CdsTabOcorr.FieldByName('AVALMIN').asInteger > 0);
    dbedAvaliacaoExit(Sender);

    dbedDatPlan.Text := '';
    mskedHora.Text := '';
    if not (CdsDet.FieldByName('DATAPLAN').IsNull) then
    begin
      dbedDatPlan.Date := StrToDate(DateToStr(CdsDet.FieldByName('DATAPLAN').asDateTime));
      mskedHora.Text := copy(CdsDet.FieldByName('DATAPLAN').asString, 12, 5);
    end;

    dblckTipoEntr.SetFocus;
  end;
end;

procedure TfrmCadRegOcorr.CdsDetAfterScroll(DataSet: TDataSet);
begin
  sbtnCAT.Enabled := not (CdsDet.IsEmpty) and (bEmpregado) and not (CdsDet.FieldByName('DATAREAL').isNull) and (CdsTabOcorr.FieldByName('FLGACIDTRAB').asInteger = 1);
end;

procedure TfrmCadRegOcorr.dblckTipoEntrChange(Sender: TObject);
begin
  if (CdsTabOcorr.FieldByName('FLGTIPOCOR').asInteger = 1) then
    tbntbDatas.ActivePage := 'Data2'
  else
    tbntbDatas.ActivePage := 'Data1';

  //Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204

  {if(dblckTipoEntr.Text = 'AFAST. ACID TRAB ATE 15 DIAS') or (dblckTipoEntr.Text = 'AFAST. ACID TRAB MAIS 15 DIAS') then
       pngDados.Pages[1].TabVisible:=True
//     pngDados.Pages[1].Visible:=False;
  else begin
    pngDados.Pages[1].TabVisible:=False;//     TabSheet2.Visible:= False;
    if CdsDet.state in [dsInsert,dsEdit]then
    begin
      CdsDet.FieldByName('CODPTCORPESOCIAL').Clear;
      CdsDet.FieldByName('DESC1').Clear;
      CdsDet.FieldByName('CODAGTESOCIAL').Clear;
      CdsDet.FieldByName('DESC2').Clear;
      CdsDet.FieldByName('CODSDOENCAESOCIAL').Clear;
      CdsDet.FieldByName('DESC3').Clear;
      CdsDet.FieldByName('CODSTESOCIAL').Clear;
      CdsDet.FieldByName('DESC4').Clear;
      CdsDet.FieldByName('CODNTESOCIAL').Clear;
      CdsDet.FieldByName('DESC5').Clear;
    end;
  end;  }

  VerificaTipoOcorrencia;
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

procedure TfrmCadRegOcorr.dbedDatInicioChange(Sender: TObject);
begin
  MudaDataRetorno;
end;

procedure TfrmCadRegOcorr.dtedDataRetornoChange(Sender: TObject);
begin
  dbedLicenca.Value := Trunc(dtedDataRetorno.Date - dbedDatInicio.Date);
end;

procedure TfrmCadRegOcorr.dbedAvaliacaoExit(Sender: TObject);
begin
  if (tb97Situacao.Visible) then
  begin
    if (CdsTabOcorr.FieldByName('AVALMIN').asInteger > CdsDet.FieldByName('AVALIACAO').asInteger) then
    begin
      tb97Situacao.Caption := ' INAPTO';
      tb97Situacao.Font.Color := clRed;
      tb97Situacao.ImageIndex := 10;
    end
    else
    begin
      tb97Situacao.Caption := ' APTO';
      tb97Situacao.Font.Color := clGreen;
      tb97Situacao.ImageIndex := 9;
    end;
  end;
end;

procedure TfrmCadRegOcorr.dbedCODCIDExit(Sender: TObject);
begin
  if (CdsDet.FieldByName('CODCID').asString = '') then
    CdsCID.Data := CtrlCID.ListCID('-1')
  else
    CdsCID.Data := CtrlCID.ListCID(CdsDet.FieldByName('CODCID').asString);
  edCID.Text := CdsCID.FieldByName('DESCRCID').asString;
end;

procedure TfrmCadRegOcorr.sbtnProcurarCandClick(Sender: TObject);
begin
  MontaSelectCand.Executar;
  if (MontaSelectCand.RetornouValor) then
  begin
    dIdPessoa := StrToFloat(MontaSelectCand.ValoresChave[0]);
    Sel(true, false, dIdPessoa);
  end;

  sbtnProcurarCand.Down := false;
  sbtnAlterar.Enabled := not (Cds.IsEmpty);
end;

procedure TfrmCadRegOcorr.sbtnFichaClick(Sender: TObject);
begin
  with TfrmParamPCMSO.Create(Application) do
  begin
    sFunc := CdsDet.FieldByName('IdPessoa').asString;
    sTipoOcorr := CdsDet.FieldByName('CodTipoOcMed').asString;
    sNumSeq := CdsDet.FieldByName('NumSeq').asString;
    if (bEmpregado) then
      sEmpregado := '1'
    else
      sEmpregado := '0';
    ShowModal;
    Free;
  end;
end;

procedure TfrmCadRegOcorr.sbtnCATClick(Sender: TObject);
var
  frm: TfrmParamRelCAT;
begin
  frm := TfrmParamRelCAT.Create(Application);
  frm.sFunc := CdsDet.FieldByName('IDPESSOA').asString;
  frm.sData := CdsDet.FieldByName('DATAREAL').asString;
  frm.sUnidade := dbedAvaliador.Text;
  frm.dDias := dbedLicenca.Value;
  frm.sDiagnostico := edCID.Text;
  frm.sCID := dbedCODCID.Text;
  frm.sObserv := dbmObser.Text;
  frm.sTipoOcorr := CdsDet.FieldByName('CODTIPOOCMED').asString;
  frm.sNumSeq := CdsDet.FieldByName('NUMSEQ').asString;
  frm.ShowModal;
  frm.Free;
end;

procedure TfrmCadRegOcorr.bbtnProcMedicoClick(Sender: TObject);
begin
  if (frmProcuraPessoaDoc.ShowModal = mrOk) and (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    CdsDet.FieldByName('IDEXAMINADOR').asString := frmProcuraPessoaDoc.sIdPessoa;
    dbedAvaliador.Text := frmProcuraPessoaDoc.sNomePessoa;
    CdsDet.FieldByName('EXAMINADOR').asString := frmProcuraPessoaDoc.sNomePessoa;
    MostraDadosExaminadorOcorr(StrToInt(frmProcuraPessoaDoc.sIdPessoa));
  end;
end;

procedure TfrmCadRegOcorr.MostraDadosExaminadorOcorr(vIdPessoa: integer);
begin
  CdsResponsavel.Data := CtrlRegOcorr.ListResponsavelOcorr(vIdPessoa);
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    edtNroInscrCRMExaminador.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
  end
  else if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    edtInscrExamAtestado.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
    edtUFExamAtestado.Text := CdsResponsavel.FieldByName('UF_CRM').AsString;
  end;
end;

procedure TfrmCadRegOcorr.MostraDadosExaminador(vIdPessoa: integer);
begin
  CdsResponsavel.Data := CtrlRegOcorr.ListResponsavel(vIdPessoa,'');
  if (CdsDet.State in [dsInsert, dsEdit]) then
  begin
    edtNroInscrCRMExaminador.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
  end
  else if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    edtInscrExamAtestado.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
    edtUFExamAtestado.Text := CdsResponsavel.FieldByName('UF_CRM').AsString;
  end;
end;

procedure TfrmCadRegOcorr.bbtnBuscaCIDClick(Sender: TObject);
begin
  MontaSelectCID.Executar;
  if (MontaSelectCID.RetornouValor) then
  begin
    CdsDet.FieldByName('CODCID').asString := MontaSelectCID.ValoresChave[0];
    edCID.Text := MontaSelectCID.ValoresChave[1];
  end;
end;

procedure TfrmCadRegOcorr.bbtnOkDetClick(Sender: TObject);
var
  CadCAT : Boolean;
  horaplan : Integer;
  numerocat : string;
begin
  numerocat := '0';
  bCandAprovado := not (bEmpregado) and (CdsTabOcorr.FieldByName('AVALMIN').asInteger > 0) and (CdsTabOcorr.FieldByName('AVALMIN').asInteger <= dbedAvaliacao.Value);

  if (CdsDet.State = dsInsert) then
  begin
    CdsDet.FieldByName('NUMSEQ').asInteger := CtrlRegOcorr.GetProxNumSeq(CdsDet.FieldByName('IDPESSOA').asFloat, CdsDet.FieldByName('CODTIPOOCMED').asInteger);

    if not (CdsParamRH.FieldByName('IDRUBFALTA').IsNull) and (dbedLicenca.Value > 0) then
      if (MsgDlg('Registra os Dias de Licença como Falta?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
        RegistraDiasFalta(Cds.FieldByName('NOME').asString, Cds.FieldByName('IDPESSOA').asFloat, StrToInt(dbedLicenca.Text), CdsParamRH.FieldByName('NORMALINI').asDateTime, CdsParamRH.FieldByName('IDRUBFALTA').asFloat);
  end;

  if (CdsDet.State in [dsInsert,dsEdit]) then //Michelle Mota - SOL: 250391.17474 - PPM: 959204
  begin
    CdsDet.FieldByName('DESCRTIPOOCMED').asString := Trim(dblckTipoEntr.Text);
    CdsDet.FieldByName('DESCCID').asString := edCID.Text;  // Michelle Mota - SIG 21360

    if(mskedHora.Text <> '  :  ') then begin
      horaplan := StrToInt(Copy(mskedHora.text,0,2)+Copy(mskedHora.text,4,2));
      if (horaplan > 2359) then
        begin
          MsgDlg('O campo hora planejada precisa ser menor ou igual a 23:59', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
          pngDados.ActivePage := tbsDados;
          mskedHora.SetFocus;
          Exit;
        end;
    end;

    if (dbedDatPlan.Text = '') then
      CdsDet.FieldByName('DATAPLAN').Clear
    else if (mskedHora.Text = '  :  ') then
      CdsDet.FieldByName('DATAPLAN').asDateTime := dbedDatPlan.Date
    else
      CdsDet.FieldByName('DATAPLAN').asDateTime := dbedDatPlan.Date + StrToTime(mskedHora.Text);

    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    if (dblckTipoEntr.Text = '') then  // MSG001
    begin
      MsgDlg('Preencha o campo Tipo de Ocorrência', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsDados;
      dblckTipoEntr.SetFocus;
      Exit;
    end;

    {Início - Michelle Mota - SIG 21360}
    if ((dbedDatInicio.Text = '') and (tbntbDatas.ActivePage = 'Data2')) then
      begin
        MsgDlg('Preencha a Data Início', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        pngDados.ActivePage := tbsDados;
        Exit;
      end;

    if (dtedDataRetorno.Text <> '') and (dbedDatInicio.Date > dtedDataRetorno.Date) then
      begin
        MsgDlg('Data Retorno deverá ser maior ou igual a Data Início', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        pngDados.ActivePage := tbsDados;
        Exit;
      end;

    if ((dbedDatReal.Text = '') and (tbntbDatas.ActivePage = 'Data1')) then
      begin
        MsgDlg('Preencha a Data Real', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
        pngDados.ActivePage := tbsDados;
        Exit;
      end;
    {Término - Michelle Mota - SIG 21360}

    if (dblckMotivoOficial.Text = '') and (ObrigaMotivo) then // MSG002   // Michelle Mota - SIG 21360
    begin
      MsgDlg('Preencha o campo Motivo Oficial', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsDados;
      dblckMotivoOficial.SetFocus;
      Exit;
    end;

    //Everson Cunha - SIG38475 - Ini
    {if ((cbbTpAcidTransito.Enabled) and (cbbTpAcidTransito.Text = '')) then // MSG003
    begin
      MsgDlg('Preencha o campo Tipo de Acidente de Trânsito', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      pngDados.ActivePage := tbsDados;
      dblckMotivoOficial.SetFocus;
      Exit;
    end;}
    //Everson Cunha - SIG38475 - Fim

    if ((dtDataAso.Enabled) and (dtDataAso.Text = '')) then // MSG004
    begin
      MsgDlg('Preencha o campo Data ASO', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsDados;
      dtDataAso.SetFocus;
      Exit;
    end;

    if ((cbbTipoASO.Enabled) and (cbbTipoASO.Text = '')) then // MSG005
    begin
      MsgDlg('Preencha o Tipo de ASO', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsDados;
      cbbTipoASO.SetFocus;
      Exit;
    end;

    CadCAT := False;
  end;

  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    //Everson Cunha - SIG38475 - Ini
    {if (cbbTipoRegCat.itemindex = 0) and ((cbbTipoLocal.itemindex = 0) or (cbbTipoLocal.itemindex = 1)) then
      ObrigaCNPJFuncef := True
    else
      ObrigaCNPJFuncef := False;}

    VerificaObrigCNPJFuncef;
    //VerificaObrigCNPJRegCAT;
    //Everson Cunha - SIG38475 - Fim    

    //CdsCatPess.FieldByName('NUMEROINSCR').AsString := medtNroDocumento.Text; //Everson Cunha - SIG38475
    CdsCatPess.FieldByName('HORAACIDENTE').AsString := medtHORAACIDENTE.Text;
    CdsCatPess.FieldByName('HORASTRABANTESACID').AsString := medtHORASTRABANTESACID.Text;

    //Everson Cunha - SIG38475 - Ini
    {if (cbbTipoRegCat.Text = '') then   // MSG0021
    begin
      MsgDlg('Preencha o campo Tipo de Registrador do CAT', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      cbbTipoRegCat.SetFocus;
      Exit;
    end;

    if ((medtNroDocumento.Text = '') and (ObrigaCNPJRegCAT)) then   // MSG0022
    begin
      MsgDlg('Campo CNPJ / CPF é obrigatório', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      medtNroDocumento.SetFocus;
      Exit;
    end; }
    //Everson Cunha - SIG38475 - Fim

    if (cbbTipoCat.Text = '') then   // MSG0024
    begin
      MsgDlg('Preencha o campo Tipo de CAT', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      cbbTipoCat.SetFocus;
      Exit;
    end;

    if (edtDtAcidente.Text = '') then   // MSG0025
    begin
      MsgDlg('Preencha o campo Data do Acidente', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      edtDtAcidente.SetFocus;
      Exit;
    end;

    //Everson Cunha - SIG134234 - Ini
    if (dbDtUltDiaTrab.Text = '') then
    begin
      MsgDlg('Preencha o campo Último dia Trabalhado', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      dbDtUltDiaTrab.SetFocus;

      Exit;
    end;
    //Everson Cunha - SIG134234 - Fim

    //Everson Cunha - SIG130015 - Ini
    {if (ObrigaHoraAcid) and (medtHORAACIDENTE.Text = '') then // MSG0026
    begin
      MsgDlg('Preencha o campo Hora do Acidente', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      medtHORAACIDENTE.SetFocus;
      Exit;
    end; }
    //Everson Cunha - SIG130015 - Fim

    if (cbbTipoAcidenteCat.Text = '') then   // MSG0023
    begin
      MsgDlg('Preencha o campo Tipo de Acidente', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      cbbTipoAcidenteCat.SetFocus;
      Exit;
    end;

    if (cbbCATEmitidaPor.Text = '') then   // MSG0027
    begin
      MsgDlg('Preencha o campo A CAT foi emitida por', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      cbbCATEmitidaPor.SetFocus;
      Exit;
    end;

    //Everson Cunha - SIG130015 - Ini
    {if (ObrigaHoraAcidAntes) and (medtHORASTRABANTESACID.Text = '') then // MSG0028
    begin
      MsgDlg('Preencha o campo Horas Trab. Antes', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      medtHORASTRABANTESACID.SetFocus;
      Exit;
    end; }
    //Everson Cunha - SIG130015 - Fim

    //Cássio Rovaroto - SIG nº 38475.60437 - Início
    if (dbchkFLGOBITO.Checked) and (dtpDataObito.Text = '') then
    begin
      MsgDlg('Preencha da Data do Óbito', 'Aviso', mtInformation, [mbOK, mbHelp], 0);
      pngDados.ActivePage := tbsDados;
      dtpDataObito.SetFocus;          
      Exit;
    end;
    //Cássio Rovaroto - SIG nº 38475.60437 - Fim

    //Everson Cunha - SIG38475 - Ini
    if (edtCodParteAtingida.Text = '') then
    begin
      MsgDlg('Informe a Parte do Corpo Atingida', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      Exit;
    end;

    if (cbbLATERALCORPOATINGIDA.Text = '') then
    begin
      MsgDlg('Informe a Lateralidade da Parte do Corpo Atingida', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      cbbLATERALCORPOATINGIDA.SetFocus;
      Exit;
    end;

    if (edtCodCausaAcid.Text = '') then
    begin
      MsgDlg('Informe o Agente Causador do Acidente de Trabalho', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      Exit;
    end;

    if (edtCodSitGerAcidTrab.Text = '') then
    begin
      MsgDlg('Informe a Situação Geradora do Acidente de Trabalho', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      Exit;
    end;

    {if (ObrigaDataCatOrigem) and (edtDtCatOrigem.Text = '') then // MSG0031
    begin
      MsgDlg('Preencha o campo Data CAT Origem', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATGeral;
      edtDtCatOrigem.SetFocus;
      Exit;
    end;}
    //Everson Cunha - SIG38475 - Fim

    if (cbbTipoLocal.Text = '') then   // MSG0029
    begin
      MsgDlg('Preencha o campo Tipo de Local', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsLocal;
      cbbTipoLocal.SetFocus;
      Exit;
    end;

    //Everson Cunha - SIG38475 - Ini
    if (cbbTipoLocal.ItemIndex in [0, 2, 4]) and (dbedtCEP.Text = '') then
    begin
      MsgDlg('Preencha o campo CEP do Local do Acidente', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsLocal;

      if dbedtCEP.CanFocus then
        dbedtCEP.SetFocus;
        
      Exit;
    end;

    if (dbedtDESCLOGRADOURO.Text = '') then
    begin
      MsgDlg('Preencha a Descrição do Logradouro', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsLocal;

      if dbedtDESCLOGRADOURO.CanFocus then
        dbedtDESCLOGRADOURO.SetFocus;
        
      Exit;
    end;
    //Everson Cunha - SIG38475 - Fim

    if (ObrigaCNPJFuncef) and (dbedtCNPJ.Text = '') then   // MSG0030
    begin
      MsgDlg('Preencha o campo CNPJ do Local do Acidente', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsLocal;
      dbedtCNPJ.SetFocus;
      Exit;
    end;

    if medtHORAATENDIMENTO.Text <> '' then
      CdsCatPess.FieldByName('HORAATENDIMENTO').AsString := medtHORAATENDIMENTO.Text;

    if (ObrigaAbaAtestado) and ((edtDTATENDIMENTO.Text = '') or (medtHORAATENDIMENTO.Text = '')) then   // MSG0032
    begin
      MsgDlg('Preencha o campo Data e Hora do Atendimento', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      Exit;
    end;

    if (ObrigaAbaAtestado) and (dbedtDURACAOTRATAMENTO.Text = '') then   // MSG0033
    begin
      MsgDlg('Preencha o campo Dur. Tratamento', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      dbedtDURACAOTRATAMENTO.SetFocus;
      Exit;
    end;

    //Everson Cunha - SIG38475 - Ini
    if (ObrigaAbaAtestado) and (edtCodNatLesao.Text = '') then
    begin
      MsgDlg('Informe a Natureza da Lesão', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      Exit;
    end;
    //Everson Cunha - SIG38475 - Fim

    if (ObrigaAbaAtestado) and (dbedtCATCODCID.Text = '') then   // MSG0034
    begin
      MsgDlg('Campo CID é obrigatório', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      Exit;
    end;

    if (ObrigaAbaAtestado) and (edtExaminadorAtestado.Text = '') then   // MSG006
    begin
      MsgDlg('Campo Examinador (Médico/Entidade) é obrigatório', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      Exit;
    end;

    if (ObrigaAbaAtestado) and (edtdbOrgaoClasse.Text = '') then  // MSG007
    begin
      MsgDlg('Preencha o campo Órgão de Classe', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      edtdbOrgaoClasse.SetFocus;
      Exit;
    end;

    if (ObrigaAbaAtestado) and (edtInscrExamAtestado.Text = '') then  // MSG008
    begin
      MsgDlg('Campo Nº de Inscrição (CRM/CRO/CRE) é obrigatório', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      Exit;
    end;

    if (ObrigaAbaAtestado) and (edtUFExamAtestado.Text = '') then  // MSG009
    begin
      MsgDlg('Campo UF é obrigatório', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
      pngDados.ActivePage := tbsCAT;
      pgcCAT.ActivePage := tbsCATAtestado;
      Exit;
    end;

    // Obrigatoriedade de preencher os dois grids, caso tenha um preenchido
    //Everson Cunha - SIG38475 - Ini
    {CdsCatParteAtingida.Filtered := False;
    CdsCatParteAtingida.Filter := 'IDCATPESS = ' + CdsCatPess.FieldByName('idcatpess').AsString;
    CdsCatParteAtingida.Filtered := True;
    CdsCatCausadorAcidente.Filtered := False;
    CdsCatCausadorAcidente.Filter := 'IDCATPESS = ' + CdsCatPess.FieldByName('idcatpess').AsString;
    CdsCatCausadorAcidente.Filtered := True;}
    //Everson Cunha - SIG38475 - Fim   
    // Fim Obrigatoriedade de preencher os dois grids, caso tenha um preenchido
    
    CadCAT := True;

    //CdsCatPess.FieldByName('tiporegistr').AsString := cbbTipoRegCat.text; //Everson Cunha - SIG38475
    CdsCatPess.FieldByName('tipoacid').AsString := cbbTipoAcidenteCat.text;
    CdsCatPess.FieldByName('desctipocat').AsString := cbbTipoCat.text;
    CdsCatPess.FieldByName('catemitpor').AsString := cbbCATEmitidaPor.text;
    CdsCatPess.FieldByName('DescSitGerTrab').AsString := edtSitGerAcidTrab.text;
  end;

  //Everson Cunha - SIG38475 - ini
  {if (CdsCatPessXOutros.State in [dsInsert, dsEdit]) then
  begin
    CadCAT := True;
  end;}
  //Everson Cunha - SIG38475 - Fim

  {if (pngDados.Pages[1].TabVisible) and
  (((dblckTipoEntr.Text = 'AFAST. ACID TRAB ATE 15 DIAS')or (dblckTipoEntr.Text = 'AFAST. ACID TRAB MAIS 15 DIAS')) and
     (edtDescriacao1.Text = '') or (edtCodeSocial1.Text = '')) then
  begin
      MsgDlg('Preencha a Parte do Corpo Atingida.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
  end;

   if (pngDados.Pages[1].TabVisible) and
      (((dblckTipoEntr.Text = 'AFAST. ACID TRAB ATE 15 DIAS')or (dblckTipoEntr.Text = 'AFAST. ACID TRAB MAIS 15 DIAS')) and
      (edtCodeSocial2.Text = '') or (edtDescriacao2.Text = '')) then
  begin
      MsgDlg('Preencha o Agente Causador do Acidente de Trabalho.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
  end;

  // Higor Nayde SOL 255543 KINTANA 820947 - início
     if (pngDados.Pages[1].TabVisible) and
      (((dblckTipoEntr.Text = 'AFAST. ACID TRAB ATE 15 DIAS')or (dblckTipoEntr.Text = 'AFAST. ACID TRAB MAIS 15 DIAS')) and
      (edtCodeSocial3.Text = '') or (edtDescriacao3.Text = '')) then
  begin
      MsgDlg('Preencha a Situação geradora de Doença Profissional.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
  end;


  if (pngDados.Pages[1].TabVisible) and
      (((dblckTipoEntr.Text = 'AFAST. ACID TRAB ATE 15 DIAS')or (dblckTipoEntr.Text = 'AFAST. ACID TRAB MAIS 15 DIAS')) and
      (edtCodeSocial4.Text = '') or (edtDescriacao4.Text = '')) then
  begin
      MsgDlg('Preencha a Situação geradora do Acidente de Trabalho.', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
  end;

  if (pngDados.Pages[1].TabVisible) and
      (((dblckTipoEntr.Text = 'AFAST. ACID TRAB ATE 15 DIAS')or (dblckTipoEntr.Text = 'AFAST. ACID TRAB MAIS 15 DIAS')) and
      (edtCodeSocial5.Text = '') or (edtDescriacao5.Text = '')) then
  begin
      MsgDlg('Preencha a Descrição da Natureza da Lesão', 'Aviso', mtInformation, [mbOk,mbHelp], 0);
      Exit;
  end;     }
  // Higor Nayde SOL 255543 KINTANA 820947 - fim

  if not (CadCAT) then
    pngDados.ActivePage := tbsDados
  else
    pngDados.ActivePage := tbsCAT;
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  inherited;
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  if (CdsDet.State = dsInsert) then
  begin
    dbedDatInicio.Text := '';
    dtedDataRetorno.Text := '';
    edtNroInscrCRMExaminador.Text := '';
    cbbTpAcidTransito.Text := '';
    dbedCODCID.Text := '';
    edCID.Text := '';
    dbedAvaliador.Text := '';
    edtNroInscrCRMExaminador.Text := '';
    DesabilitaCamposDados;
  end;
  if (CdsCatPess.State = dsInsert) then
  begin
    pgcCAT.ActivePage := tbsCATGeral;
    CdsCatPess.FieldByName('IDPESSOA').AsInteger := Cds.FieldByName('IDPESSOA').AsInteger;
    CdsCatPess.FieldByName('IDCATPESS').AsInteger := CtrlRegOcorr.GetProxNumSeqCatPess;
    CdsCatPess.FieldByName('FLGOBITO').AsString := 'N';
    CdsCatPess.FieldByName('FLGCOMUNICACAOPOLICIAL').AsString := 'N';
    CdsCatPess.FieldByName('FLGAFASTAMENTO').AsString := 'N';
    CdsCatPess.FieldByName('FLGINTERNACAO').AsString := 'N';
    //medtNroDocumento.EditMask := '99.999.999/9999-99;0;_'; //Everson Cunha - SIG38475
    //CdsCatPess.FieldByName('TIPOINSCR').AsInteger := 1; //Everson Cunha - SIG38475
    //rbCNPJCat.Checked := True; //Everson Cunha - SIG38475
    cbbTipoAcidenteCat.Text := '';
    cbbTipoCat.Text := '';
    medtHORAACIDENTE.Text := '';
    cbbCATEmitidaPor.Text := '';
    medtHORASTRABANTESACID.Text := '';
    edtSitGerAcidTrab.Text := '';
    edtUF.Text := '';
    edtCodMunicipio.Text := '';
    cbbTipoLocal.Text := '';
    dbedtDESCNATLESAO.Text := '';
    edtDescCID.Text := '';
    edtExaminadorAtestado.Text := '';
    edtInscrExamAtestado.Text := '';
    edtUFExamAtestado.Text := '';
    //medtNroDocumento.Text := ''; //Everson Cunha - SIG38475
    medtHORAATENDIMENTO.Text := '';
    edtCodSitGerAcidTrab.Text := '';
    edtSitGerAcidTrab.Text := '';
    edtCodNatLesao.Text := '';
    dbedtDESCNATLESAO.Text := '';
    dbchkFLGCOMUNICACAOPOLICIAL.Checked := False;
    dbchkFLGOBITO.Checked := False;
    dbchkFLGAFASTAMENTO.Checked := False;
    dbchkFLGINTERNACAO.Checked := False;
    if (CdsCatPess.fieldbyname('NUMEROCAT').AsString <> '') then
      numerocat := CdsCatPess.fieldbyname('NUMEROCAT').AsString;

    CdsCatOrigem.Data := CtrlRegOcorr.ListCatOrigem(FloatToStr(CdsDet.fieldbyname('IDPESSOA').AsFloat), numerocat);

    //Everson Cunha - SIG38475 - Ini
    edtDescParteAtingida.Text := '';
    edtCodCausaAcid.Text  := '';
    edtDescCausaAcid.Text := '';
    //Everson Cunha - SIG38475 - Ini
  end;
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

procedure TfrmCadRegOcorr.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Sel(false, bEmpregado, dIdPessoa);
  sbtnFicha.Enabled := not (CdsDet.IsEmpty);
  CdsDetAfterScroll(nil);
end;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

procedure TfrmCadRegOcorr.MudaDataRetorno;
begin
  dtedDataRetorno.Date := dbedDatInicio.Date + dbedLicenca.Value
end;

procedure TfrmCadRegOcorr.Sel(SelPrincipal, SelEmpregado: boolean; IdPessoa: double);
var
  numerocat : string;
begin
  numerocat := '0';
  if (SelPrincipal) then
  begin
    bCandAprovado := false;
    bEmpregado := SelEmpregado;
    lblLicenca.Visible := SelEmpregado;
    dbedLicenca.Visible := SelEmpregado;

    if (SelEmpregado) then
      Cds.Data := CtrlPessoaCandidato.CtrlPessoaFuncionario.ListPesFisFuncionario(IdPessoa, '  F.MATRICULA, P.NOME, F.IDCARGO, ST.DESCRICAO AS SITUACAO, F.IDPESSOA')
    else
      Cds.Data := CtrlPessoaCandidato.ListCandidatoPessoa(IdPessoa);
    // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
    // CdsCargo.Data := CtrlCargo.ListCargo(Cds.FieldByName('IDCARGO').asFloat);
    if (IdPessoa <> -1) then
      CdsCargo.Data := CtrlCargo.ListCargo(Cds.FieldByName('IDCARGO').asFloat)
    else
      CdsCargo.Data := CtrlCargo.ListCargo(-1);
    // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  end;
  CdsDet.Data := CtrlRegOcorr.ListHistorico(IdPessoa);
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  CdsMonitora.Data := CtrlRegOcorr.ListExames(FloatToStr(IdPessoa),FloatToStr(CdsDet.fieldbyname('IDHSTASMED').AsFloat));
  if (CdsMonitora.RecordCount = 0) then
  begin
    toolbtnAlterarMonitora.Enabled := False;
    toolbtnExcluirMonitora.Enabled := False;
  end
  else
  begin
    toolbtnAlterarMonitora.Enabled := True;
    toolbtnExcluirMonitora.Enabled := True;
  end;
  CdsCatPess.Data := CtrlRegOcorr.ListCatPess(FloatToStr(IdPessoa));
  //CdsCatPessXOutros.Data := CtrlRegOcorr.ListCatPessXOutros(FloatToStr(IdPessoa)); //Everson Cunha - SIG38475
  if (CdsCatPess.fieldbyname('NUMEROCAT').AsString <> '') then
    numerocat := CdsCatPess.fieldbyname('NUMEROCAT').AsString;  
  //CdsCatParteAtingida.Data := CtrlRegOcorr.ListGridParteAtingida(IdPessoa); //Everson Cunha - SIG38475 - Ini
  //CdsCatCausadorAcidente.Data := CtrlRegOcorr.ListGridCausador(IdPessoa); //Everson Cunha - SIG38475
  CdsCatOrigem.Data := CtrlRegOcorr.ListCatOrigem(FloatToStr(IdPessoa), numerocat);
  //CdsMatBio.Data := CtrlRegOcorr.ListMatBio(0); //Everson Cunha - SIG38475
  //CdsAnalise.Data := CtrlRegOcorr.ListAnalise(0,0); //Everson Cunha - SIG38475
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  sbtnFicha.Enabled := not (CdsDet.IsEmpty);
  CdsDetAfterScroll(nil);

  //Cássio Rovaroto - SIG nº 38475.60437 - Início
  cdsProcessos.Data := CtrlRegOcorr.ListProcessosFuncionario(-1, -1);
  //cdsAcidTrabeSocial.Data := CtrlRegOcorr.ListAcidTrabeSocial; //Everson Cunha - SIG38475
  //Cássio Rovaroto - SIG nº 38475.60437 - Fim
end;

procedure TfrmCadRegOcorr.pgctrlDetalheChange(Sender: TObject);
begin
  if (MsgDlg('Efetiva Candidato Como Empregado?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then

    inherited;

end;

procedure TfrmCadRegOcorr.bbtnCancelarDetClick(Sender: TObject);
begin
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  pngDados.ActivePage := tbsDados;
  DesabilitaCamposDados;
  // Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  inherited;

end;

// Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
procedure TfrmCadRegOcorr.dblckMotivoOficialChange(Sender: TObject);
begin
  inherited;
  HabDesabTipoAcidTransito;
end;

procedure TfrmCadRegOcorr.sbtnAltDetClick(Sender: TObject);
var
  numerocat : string;
begin
  pngDados.ActivePage := tbsDados;
  inherited;
  numerocat := '0';
  CtrlRegOcorr.Operacao('Update');
  ObrigaAbaAtestado := False;

  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    mskedHora.Text := copy(CdsDet.FieldByName('DATAPLAN').asString, 12, 5);

    if not (CdsDet.FieldByName('CODCID').IsNull) then begin
      CdsCID.Data := CtrlRegOcorr.ListCodCID(CdsDet.FieldByName('CODCID').AsString);
      edCID.Text := CdsCID.FieldByName('DESCRCID').AsString;
    end
    else
    begin
      edCID.Text := '';  
    end;

    if not (CdsDet.FieldByName('IDEXAMINADOR').IsNull) then begin
      CdsResponsavel.Data := CtrlRegOcorr.ListResponsavelOcorr(CdsDet.FieldByName('IDEXAMINADOR').AsInteger);
      dbedAvaliador.Text := CdsResponsavel.FieldByName('RAZAOSOCIAL').AsString;
      edtNroInscrCRMExaminador.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
    end
    else
    begin
      edtNroInscrCRMExaminador.Text := '';
    end;

    CdsMonitora.Data := CtrlRegOcorr.ListExames(FloatToStr(CdsDet.fieldbyname('IDPESSOA').AsFloat),FloatToStr(CdsDet.fieldbyname('IDHSTASMED').AsFloat));
    if (CdsMonitora.RecordCount = 0) then
    begin
      toolbtnAlterarMonitora.Enabled := False;
      toolbtnExcluirMonitora.Enabled := False;
    end
    else
    begin
      toolbtnAlterarMonitora.Enabled := True;
      toolbtnExcluirMonitora.Enabled := True;
    end;

    VerificaTipoOcorrencia;
  end;

  if (pgctrlDetalhe.ActivePage = tbsCAT) then
  begin
    pgcCAT.ActivePage := tbsCATGeral;
    if (pgcCAT.ActivePage = tbsCATGeral) or (pgcCAT.ActivePage = tbsCATAtestado) then begin
      if (CdsCatPess.State = dsEdit) then
      begin
        case CdsCatPess.FieldByName('TIPOACIDENTE').AsInteger of
          1:begin
              cbbTipoAcidenteCat.ItemIndex := 0;
              //ObrigaHoraAcid := True; //Everson Cunha - SIG130015
              //ObrigaHoraAcidAntes := True; //Everson Cunha - SIG130015
            end;
          2:begin
              cbbTipoAcidenteCat.ItemIndex := 1;
              //ObrigaHoraAcid := False; //Everson Cunha - SIG130015
              //ObrigaHoraAcidAntes := False; //Everson Cunha - SIG130015
            end;
          3:begin
              cbbTipoAcidenteCat.ItemIndex := 2;
              //ObrigaHoraAcid := True;      //Everson Cunha - SIG38475
              //ObrigaHoraAcid := False;       //Everson Cunha - SIG38475 //Everson Cunha - SIG130015
              //ObrigaHoraAcidAntes := True; //Everson Cunha - SIG38475
              //ObrigaHoraAcidAntes := False;  //Everson Cunha - SIG38475 //Everson Cunha - SIG130015
            end;
        end;

        case CdsCatPess.FieldByName('TIPOCAT').AsInteger of
          1:// inicial
            cbbTipoCat.ItemIndex := 0;
          2:// reabertura
            cbbTipoCat.ItemIndex := 1;
          3:// comunicação
            cbbTipoCat.ItemIndex := 2;
        end;

        if cbbTipoCat.ItemIndex = 0 then // inicial
        begin
          wdblkpcmbIDCATPESSORIGEM.Enabled := False;
          wdblkpcmbIDCATPESSORIGEM.Color := clSilver;
        end
        else
        begin
          wdblkpcmbIDCATPESSORIGEM.Enabled := True;
          wdblkpcmbIDCATPESSORIGEM.Color := clWindow;
        end;

        case CdsCatPess.FieldByName('CATEMITIDAPOR').AsInteger of
          1:cbbCATEmitidaPor.ItemIndex := 0;
          2:cbbCATEmitidaPor.ItemIndex := 1;
          3:cbbCATEmitidaPor.ItemIndex := 2;
        end;
      
        case CdsCatPess.FieldByName('TIPOLOCAL').AsInteger of
          1:cbbTipoLocal.ItemIndex := 0;
          2:cbbTipoLocal.ItemIndex := 1;
          3:cbbTipoLocal.ItemIndex := 2;
          4:cbbTipoLocal.ItemIndex := 3;
          5:cbbTipoLocal.ItemIndex := 4;
          6:cbbTipoLocal.ItemIndex := 5;
          9:cbbTipoLocal.ItemIndex := 6;
        end;

        VerificaObrigCNPJFuncef;

        if CdsCatPess.FieldByName('IDCIDADES').AsString <> '' then begin
          CdsPesquisaRegistro.Data := CtrlRegOcorr.FiltraCidade(CdsCatPess.FieldByName('IDCIDADES').AsString);
          wdblkpcmbIDCIDADES.Text := CdsPesquisaRegistro.FieldByName('NOME').AsString;
          edtUF.Text := CdsPesquisaRegistro.FieldByName('CODESTADO').AsString;
          edtCodMunicipio.Text := CdsPesquisaRegistro.FieldByName('CODMUNICIPIO').AsString;
        end
        else
        begin
          edtUF.text := '';
          edtCodMunicipio.text := '';
        end;

        medtHORAACIDENTE.Text := CdsCatPess.FieldByName('HORAACIDENTE').AsString;
        medtHORASTRABANTESACID.Text := CdsCatPess.FieldByName('HORASTRABANTESACID').AsString;
        //medtNroDocumento.Text := CdsCatPess.FieldByName('NUMEROINSCR').AsString; //Everson Cunha - SIG38475

        //Everson Cunha - SIG38475 - Ini
        if not (CdsCatPess.FieldByName('COD_PARTE_CORPO_ATINGIDA').IsNull) then
        begin
          CdsPesquisaRegistro.Data := CtrlRegOcorr.ListParteAtingida(CdsCatPess.FieldByName('COD_PARTE_CORPO_ATINGIDA').AsInteger);
          edtDescParteAtingida.Text := CdsPesquisaRegistro.FieldByName('DESCRICAO').AsString;
        end;

        if not (CdsCatPess.FieldByName('COD_AGENTE_CAUSADOR_ACID_TRAB').IsNull) then
        begin
          CdsPesquisaRegistro.Data := CtrlRegOcorr.ListAgenteCausador(CdsCatPess.FieldByName('COD_AGENTE_CAUSADOR_ACID_TRAB').AsInteger);
          edtCodCausaAcid.Text := CdsPesquisaRegistro.FieldByName('CODIGO').AsString;
          edtDescCausaAcid.Text := CdsPesquisaRegistro.FieldByName('DESCRICAO').AsString;
        end;
        //Everson Cunha - SIG38475 - Fim

        if not (CdsCatPess.FieldByName('IDSITGERADORAACIDTRAB').IsNull) then begin
          CdsPesquisaRegistro.Data := CtrlRegOcorr.ListSitGerAcidTrab(CdsCatPess.FieldByName('IDSITGERADORAACIDTRAB').AsInteger);
          edtCodSitGerAcidTrab.Text := CdsPesquisaRegistro.FieldByName('CODIGO').AsString;
          edtSitGerAcidTrab.Text := CdsPesquisaRegistro.FieldByName('DESCRICAO').AsString;
        end;

        //Everson Cunha - SIG38475 - Ini
        {case CdsCatPess.FieldByName('TIPOINSCR').AsInteger of
          1: rbCNPJCat.Checked := True;
          2: rbCPFCat.Checked := True;
        end;}
        //Everson Cunha - SIG38475 - Fim

        medtHORAATENDIMENTO.Text := CdsCatPess.FieldByName('HORAATENDIMENTO').AsString;

        if not (CdsCatPess.FieldByName('IDNATLESAO').IsNull) then begin
          CdsPesquisaRegistro.Data := CtrlRegOcorr.ListNatLesao(CdsCatPess.FieldByName('IDNATLESAO').AsInteger);
          edtCodNatLesao.Text := CdsPesquisaRegistro.FieldByName('CODIGO').AsString;
          dbedtDESCNATLESAO.Text := CdsPesquisaRegistro.FieldByName('DESCRICAO').AsString;
        end;
        if not (CdsCatPess.FieldByName('CODCID').IsNull) then begin
          CdsCID.Data := CtrlRegOcorr.ListCodCID(CdsCatPess.FieldByName('CODCID').AsString);
          edtDescCID.Text := CdsCID.FieldByName('DESCRCID').AsString;
        end;
        if not (CdsCatPess.FieldByName('IDEXAMINADOR').IsNull) then begin
          CdsResponsavel.Data := CtrlRegOcorr.ListResponsavelOcorr(CdsCatPess.FieldByName('IDEXAMINADOR').AsInteger);
          edtExaminadorAtestado.Text := CdsResponsavel.FieldByName('RAZAOSOCIAL').AsString;
          edtInscrExamAtestado.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
          edtUFExamAtestado.Text := CdsResponsavel.FieldByName('UF_CRM').AsString;
        end;

        if (CdsCatPess.fieldbyname('NUMEROCAT').AsString <> '') then
          numerocat := CdsCatPess.fieldbyname('NUMEROCAT').AsString;
        CdsCatOrigem.Data := CtrlRegOcorr.ListCatOrigem(FloatToStr(CdsDet.fieldbyname('IDPESSOA').AsFloat), numerocat);
      end;
    end;
  end;
end;

procedure TfrmCadRegOcorr.sbtnInsDetClick(Sender: TObject);
var
  numerocat : string;
begin
  inherited;
  numerocat := '0';
  CtrlRegOcorr.Operacao('Insert');
  ObrigaAbaAtestado := False;
  // Início - Michelle Mota - SOL: 250391.17474 - PPM: 959204
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  begin
    pngDados.ActivePage := tbsDados;
    pngDados.Pages[1].TabVisible := false;
    edtNroInscrCRMExaminador.Text := '';
    cbbTpAcidTransito.Text := '';
    cbbTpAcidTransito.Text := '';
    cbbTpAcidTransito.Enabled := False;
    cbbTpAcidTransito.Color := clSilver;
    CdsDet.FieldByName('IDHSTASMED').AsInteger := CtrlRegOcorr.GetProxNumIdHstAsMed;
    CdsMonitora.Data := CtrlRegOcorr.ListExames(FloatToStr(CdsDet.fieldbyname('IDPESSOA').AsFloat),FloatToStr(CdsDet.fieldbyname('IDHSTASMED').AsFloat)); // Michelle Mota - SIG 21360
  end
  else if (pgctrlDetalhe.ActivePage = tbsCAT) then
  begin
    pgcCAT.ActivePage := tbsCATGeral;
    CdsCatPess.FieldByName('IDPESSOA').AsInteger := Cds.FieldByName('IDPESSOA').AsInteger;
    CdsCatPess.FieldByName('IDCATPESS').AsInteger := CtrlRegOcorr.GetProxNumSeqCatPess;
    CdsCatPess.FieldByName('FLGOBITO').AsString := 'N';
    CdsCatPess.FieldByName('FLGCOMUNICACAOPOLICIAL').AsString := 'N';
    CdsCatPess.FieldByName('FLGAFASTAMENTO').AsString := 'N';
    CdsCatPess.FieldByName('FLGINTERNACAO').AsString := 'N';
    //medtNroDocumento.EditMask := '99.999.999/9999-99;0;_'; //Everson Cunha - SIG38475
    //CdsCatPess.FieldByName('TIPOINSCR').AsInteger := 1; //Everson Cunha - SIG38475
    //rbCNPJCat.Checked := True; //Everson Cunha - SIG38475
    cbbTipoAcidenteCat.Text := '';
    cbbTipoCat.Text := '';
    medtHORAACIDENTE.Text := '';
    cbbCATEmitidaPor.Text := '';
    medtHORASTRABANTESACID.Text := '';
    edtSitGerAcidTrab.Text := '';
    edtUF.Text := '';
    edtCodMunicipio.Text := '';
    cbbTipoLocal.Text := '';
    dbedtDESCNATLESAO.Text := '';
    edtDescCID.Text := '';
    edtExaminadorAtestado.Text := '';
    edtInscrExamAtestado.Text := '';
    edtUFExamAtestado.Text := '';
    //medtNroDocumento.Text := ''; //Everson Cunha - SIG38475
    medtHORAATENDIMENTO.Text := '';
    dbchkFLGCOMUNICACAOPOLICIAL.Checked := False;
    dbchkFLGOBITO.Checked := False;
    dbchkFLGAFASTAMENTO.Checked := False;
    dbchkFLGINTERNACAO.Checked := False;
    edtCodSitGerAcidTrab.Text := '';
    edtCodNatLesao.Text := '';
    if (CdsCatPess.fieldbyname('NUMEROCAT').AsString <> '') then
      numerocat := CdsCatPess.fieldbyname('NUMEROCAT').AsString;
    CdsCatOrigem.Data := CtrlRegOcorr.ListCatOrigem(FloatToStr(CdsDet.fieldbyname('IDPESSOA').AsFloat), numerocat);

    //Everson Cunha - SIG38475 - Ini
    edtDescParteAtingida.Text := '';
    edtCodCausaAcid.Text  := '';
    edtDescCausaAcid.Text := '';    
    //Everson Cunha - SIG38475 - Fim
  end;
  // Termino - Michelle Mota - SOL: 250391.17474 - PPM: 959204
end;

procedure TfrmCadRegOcorr.MontaAbaMonitora;
begin
  pnlMonitora.SendToBack;
  DockDetMonitora.Visible := False;
  btnDockMonitoraOK.Visible := False;
  btnDockMonitoraCanc.Visible := False;
  btnDockMonitoraVoltar.Visible := False;
  //CdsAgenteQuimico.Data := CtrlRegOcorr.ListAgenteQuimico; //Everson Cunha - SIG38475
end;

procedure TfrmCadRegOcorr.toolbtnInserirMonitoraClick(Sender: TObject);
begin
  dbdtDTEXAME.Text := '';
  cbbOrdemEx.Text := '';
  cbbIndicaResult.Text := '';
  toolbtnInserirMonitora.Down := True;
  toolbtnAlterarMonitora.Enabled := False;
  toolbtnExcluirMonitora.Enabled := False;
  DockDetMonitora.Visible := True;
  btnDockMonitoraOK.Visible := True;
  btnDockMonitoraCanc.Visible := True;
  btnDockMonitoraVoltar.Visible := True;
  dbgrdMonitora.SendToBack;

  CDSMonitora.Insert;
  //CdsMonitoraFieldByName('IDHSTASMEDXMONITOBIO').AsInteger := CtrlRegOcorr.GetProxNumSeqHstAsMedXMonitoBio; //Everson Cunha - SIG38475
  CdsMonitora.FieldByName('IDHSTASMEDXEXAME').AsInteger := CtrlRegOcorr.GetProxNumSeqHstAsMedXExame;          //Everson Cunha - SIG38475
  CdsMonitora.FieldByName('IDHSTASMED').AsInteger := CdsDet.FieldByName('IDHSTASMED').AsInteger;
end;

procedure TfrmCadRegOcorr.toolbtnAlterarMonitoraClick(Sender: TObject);
//var
  //CODMATERIALBIO : Integer; //Everson Cunha - SIG38475
  //CODANALISE : string; //Everson Cunha - SIG38475
begin
  toolbtnAlterarMonitora.Down := True;
  toolbtnInserirMonitora.Enabled := False;
  toolbtnExcluirMonitora.Enabled := False;
  DockDetMonitora.Visible := True;
  btnDockMonitoraOK.Visible := True;
  btnDockMonitoraCanc.Visible := True;
  btnDockMonitoraVoltar.Visible := True;
  dbgrdMonitora.SendToBack;
  {Início - Michelle Mota - SIG 21360}
  //CODMATERIALBIO := cdsmonitora.fieldbyname('CODMATERIALBIO').AsInteger; //Everson Cunha - SIG38475
  //CODANALISE     := cdsmonitora.fieldbyname('CODANALISE').AsString; //Everson Cunha - SIG38475
  {Término - Michelle Mota - SIG 21360}
  CDSMonitora.Edit;

  //Everson Cunha - SIG38475 - Ini
  {if (CdsMonitora.State = dsEdit) then
  begin
    CdsMatBio.Data := CtrlRegOcorr.ListMatBio(CdsAgenteQuimico.FieldByName('CODAGTQUIMICO').AsInteger);
    CdsAnalise.Data := CtrlRegOcorr.ListAnalise(CdsAgenteQuimico.FieldByName('CODAGTQUIMICO').AsInteger, CdsMatBio.FieldByName('CODMATERIALBIO').AsInteger);
  end;}
  //Everson Cunha - SIG38475 - Fim
  {Início - Michelle Mota - SIG 21360}
  //cdsmonitora.fieldbyname('CODMATERIALBIO').AsInteger := CODMATERIALBIO; //Everson Cunha - SIG38475
  //cdsmonitora.fieldbyname('CODANALISE').AsString := CODANALISE; //Everson Cunha - SIG38475
  {Término - Michelle Mota - SIG 21360}
  
  if not(CdsMonitora.FieldByName('ORDEMEXAME').isnull) then  //Michelle Mota - SIG 21360
  case CdsMonitora.FieldByName('ORDEMEXAME').AsInteger of
    1: cbbOrdemEx.ItemIndex := 0;
    2: cbbOrdemEx.ItemIndex := 1;
  end;

  if not(CdsMonitora.FieldByName('INDICARESULTADO').isnull) then  //Michelle Mota - SIG 21360
  case CdsMonitora.FieldByName('INDICARESULTADO').AsInteger of
    1: cbbIndicaResult.ItemIndex := 0;
    2: cbbIndicaResult.ItemIndex := 1;
    3: cbbIndicaResult.ItemIndex := 2;
    4: cbbIndicaResult.ItemIndex := 3;
  end;
end;

//Everson Cunha - SIG38475 - Ini
{procedure TfrmCadRegOcorr.btnPesqRespMonitoraClick(Sender: TObject);
begin
  inherited;
  MontaSelectRespMonitora.Executar;
  if (MontaSelectRespMonitora.RetornouValor) then
  begin
    CdsMonitora.FieldByName('IDRESPONSAVEL').asString := MontaSelectRespMonitora.ValoresChave[0];
    MostraDadosResponsavel(StrToInt(MontaSelectRespMonitora.ValoresChave[0]));
  end;
end;

procedure TfrmCadRegOcorr.MostraDadosResponsavel(vIdPessoa: integer);
begin
  CdsResponsavel.Data := CtrlRegOcorr.ListResponsavel(vIdPessoa,'');
  edtRespMonitora.Text := CdsResponsavel.FieldByName('RAZAOSOCIAL').AsString;
  edtNISMonitora.Text := CdsResponsavel.FieldByName('NIS').AsString;
  edtInscricaoMonitora.Text := CdsResponsavel.FieldByName('CRM_CRE_CRO').AsString;
  edtUFMonitora.Text := CdsResponsavel.FieldByName('UF_CRM').AsString;
end; }
//Everson Cunha - SIG38475 - Fim

procedure TfrmCadRegOcorr.toolbtnExcluirMonitoraClick(Sender: TObject);
begin
  inherited;
  if (MsgDlg('Deseja realmente excluir este registro?', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes) then
    CdsMonitora.Delete;
end;

//Everson Cunha - SIG38475 - Ini
{procedure TfrmCadRegOcorr.wdblkpcmbCODAGTQUIMICOChange(Sender: TObject);
begin
  inherited;
  if (CdsMonitora.State in [dsInsert, dsEdit]) then
    begin
      CdsMatBio.Data := CtrlRegOcorr.ListMatBio(CdsAgenteQuimico.FieldByName('CODAGTQUIMICO').AsInteger);
      wdblkpcmbCODMATERIALBIO.Text := '';
      CdsMonitora.FieldByName('CODMATERIALBIO').Value := null;
      wdblkpcmbCODANALISE.Text := '';
      CdsMonitora.FieldByName('CODANALISE').Value := null;
    end;
end;

procedure TfrmCadRegOcorr.wdblkpcmbCODMATERIALBIOChange(Sender: TObject);
begin
  inherited;
  if (CdsMonitora.State in [dsInsert, dsEdit]) then
    CdsAnalise.Data := CtrlRegOcorr.ListAnalise(CdsAgenteQuimico.FieldByName('CODAGTQUIMICO').AsInteger, CdsMatBio.FieldByName('CODMATERIALBIO').AsInteger);
end;

procedure TfrmCadRegOcorr.cbbTipoRegCatChange(Sender: TObject);
begin
  inherited;
  if (cbbTipoRegCat.ItemIndex = 0) and
     (cbbTipoLocal.Text <> '') then
    VerificaObrigCNPJFuncef
  else
    ObrigaCNPJFuncef := False;

  VerificaObrigCNPJRegCAT;
end;

procedure TfrmCadRegOcorr.rbCNPJCatClick(Sender: TObject);
begin
  inherited;
  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    if (rbCNPJCat.Checked) then
    begin
      rbCPFCat.Checked := False;
      medtNroDocumento.EditMask := '99.999.999/9999-99;0;_';
      CdsCatPess.FieldByName('TIPOINSCR').AsInteger := 1;
    end
    else
      rbCPFCat.Checked := True;
  end;
end;

procedure TfrmCadRegOcorr.rbCPFCatClick(Sender: TObject);
begin
  inherited;
  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    if (rbCPFCat.Checked) then
    begin
      rbCNPJCat.Checked := False;
      medtNroDocumento.EditMask := '999.999.999-99;0;_';
      CdsCatPess.FieldByName('TIPOINSCR').AsInteger := 2;
    end
    else
      rbCNPJCat.Checked := True;
  end;
end;}
//Everson Cunha - SIG38475 - Fim

procedure TfrmCadRegOcorr.cbbTipoAcidenteCatChange(Sender: TObject);
begin
  inherited;

  //Everson Cunha - SIG130015 - Ini
 {//Everson Cunha - SIG38475 - Ini
  ObrigaHoraAcid := False;
  ObrigaHoraAcidAntes := False;

  medtHORAACIDENTE.Enabled := False;
  medtHORAACIDENTE.ReadOnly := True;
  medtHORAACIDENTE.Color := clSilver;

  medtHORASTRABANTESACID.Enabled := False;
  medtHORASTRABANTESACID.ReadOnly := True;
  medtHORASTRABANTESACID.Color := clSilver;
  //Everson Cunha - SIG38475 - Fim

    case cbbTipoAcidenteCat.ItemIndex of
      0:
        begin
          ObrigaHoraAcid := True;
          ObrigaHoraAcidAntes := True;

          //Everson Cunha - SIG38475 - Ini
          medtHORAACIDENTE.Enabled := True;
          medtHORAACIDENTE.ReadOnly := False;
          medtHORAACIDENTE.Color := clWindow;

          medtHORASTRABANTESACID.Enabled := True;
          medtHORASTRABANTESACID.ReadOnly := False;
          medtHORASTRABANTESACID.Color := clWindow;
          //Everson Cunha - SIG38475 - Fim
        end;
      1:
        begin
          //Everson Cunha - SIG38475 - Ini
          //ObrigaHoraAcid := False;
          //ObrigaHoraAcidAntes := False;
          medtHORAACIDENTE.Text := EmptyStr;
          medtHORASTRABANTESACID.Text := EmptyStr;
          //Everson Cunha - SIG38475 - Fim
        end;
      2:
        begin
          //Everson Cunha - SIG38475 - Ini
          //ObrigaHoraAcid := True;
          //ObrigaHoraAcidAntes := True;
          medtHORAACIDENTE.Text := EmptyStr;
          medtHORASTRABANTESACID.Text := EmptyStr;
          //Everson Cunha - SIG38475 - Fim
        end;
    end; }
  //Everson Cunha - SIG130015 - Fim
end;

procedure TfrmCadRegOcorr.cbbTipoCatChange(Sender: TObject);
begin
  inherited;

  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    if cbbTipoCat.ItemIndex = 0 then //inicial
    begin
      wdblkpcmbIDCATPESSORIGEM.Enabled := False;
      wdblkpcmbIDCATPESSORIGEM.Color := clSilver;
      dbchkFLGOBITO.Enabled := True;
    end
    else
    begin
      wdblkpcmbIDCATPESSORIGEM.Enabled := True;
      wdblkpcmbIDCATPESSORIGEM.Color := clWindow;
      dbchkFLGOBITO.Enabled := False;
    end;

    if cbbTipoCat.ItemIndex = 1 then //reabertura
    begin
      dbchkFLGOBITO.Checked := False;
      CdsCatPess.FieldByName('FLGOBITO').AsString := 'N';
    end;

    if cbbTipoCat.ItemIndex = 2 then //comunicação óbito
    begin
      dbchkFLGOBITO.Checked := True;
      CdsCatPess.FieldByName('FLGOBITO').AsString := 'S';
    end;     
  end;  
end;

procedure TfrmCadRegOcorr.btnPesqParteAtingidaClick(Sender: TObject);
begin
  inherited;
  {PARTECORPOATINGIDA}
  MontaSelectParteAtingida.Executar;

  if (MontaSelectParteAtingida.RetornouValor) then
  begin
    CdsCatPess.FieldByName('COD_PARTE_CORPO_ATINGIDA').asString := MontaSelectParteAtingida.ValoresChave[0];
    edtDescParteAtingida.Text := MontaSelectParteAtingida.ValoresChave[1];
  end;
end;

procedure TfrmCadRegOcorr.btnPesqAgenteCausadorClick(Sender: TObject);
begin
  inherited;
  {AGENTECAUSADORACIDTRAB}
  MontaSelectAgenteCausador.Executar;
  if (MontaSelectAgenteCausador.RetornouValor) then
  begin
    CdsCatPess.FieldByName('COD_AGENTE_CAUSADOR_ACID_TRAB').asString := MontaSelectAgenteCausador.ValoresChave[0];
    edtCodCausaAcid.Text := MontaSelectAgenteCausador.ValoresChave[0];
    edtDescCausaAcid.Text := MontaSelectAgenteCausador.ValoresChave[1];
  end;
end;

procedure TfrmCadRegOcorr.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  MostraDadosExaminador(CdsDet.FieldByName('IDEXAMINADOR').AsInteger);
  VerificaTipoOcorrencia;
end;

procedure TfrmCadRegOcorr.VerificaTipoOcorrencia;
begin
{CODTIPOOCMED	DESCRTIPOOCMED
    1	        EXAME ADMISSIONAL
    16	        EXAME ADMISSIONAL LABORATORIAL
    17	        EXAME ADMISSIONAL OFTALMOLOGICO
    18	        EXAME ADMISSIONAL PSIQUIÁTRICO
    4	        EXAME DE MUDANCA DE FUNÇÃO
    3	        EXAME DE RETORNO AO TRABALHO
    5	        EXAME DEMISSIONAL
    2	        EXAME PERIÓDICO
    13	        EXAME PERIÓDICO DIFERENCIADO
}
  if (CdsTabOcorr.FieldByName('CODTIPOOCMED').AsInteger in [1,16,17,18,4,3,5,2,13]) then
  begin
    HabilitaCamposDados;
    pngDados.Pages[1].TabVisible := True;
    MontaAbaMonitora;
    ObrigaMonitora := True;
  end
  else
  begin
    DesabilitaCamposDados;
    pngDados.Pages[1].TabVisible := False;
    ObrigaMonitora := False;
  end;

  if (dblckTipoEntr.Text = '') then
    begin
      DesabilitaCamposDados;
      pngDados.Pages[1].TabVisible := False;
      ObrigaMonitora := False;
    end;
    
  {Início - Michelle Mota - SIG 21360}
  {Cód	Descrição
  11	LDF-LICENCA DOENCA PESSOA FAMILIA SEM R
  19	LICENCA MATERNIDADE
  21	AFAST. DOENÇA MAIS 15 DIAS
  25	AFAST. ACID TRAB MAIS 15 DIAS
  28	LICENÇA SEM VENCIMENTOS
  32	LICENCA MATERNIDADE - 120 DIAS
  33	LICENCA MATERNIDADE - 60 DIAS
  35	LICENCA MATERNIDADE - ADOCAO OU GUARDA}

  if (CdsTabOcorr.FieldByName('CODTIPOOCMED').AsInteger in [11,19,21,25,28,32,33,35]) then
    ObrigaMotivo := True
  else
    ObrigaMotivo := False;

  {0	JUSTIÇA ELEITORAL
  6	DOACAO DE SANGUE
  8	FALECIMENTO DE PESSOA DA FAMILIA
  9	LICENCA PATERNIDADE
  10	VESTIBULAR
  11	LDF-LICENCA DOENCA PESSOA FAMILIA SEM R
  12	LICENÇA CASAMENTO
  14	VACINAÇÃO ANTI-GRIPAL IN COMPANY
  15	DISPENSA JUDICIAL
  22	APIP - AUSENCIA PERMIT INTER PARTICULAR
  23	LP - LICENCA PREMIO
  26	SERVICO MILITAR
  27	CONSULTA PRE-NATAL
  28	LICENÇA SEM VENCIMENTOS
  29	LIC.ACOMPANHAR FILHO EM CONSULTA
  30	DISPENSA CONV JUSTICA ELEITORAL
  31	LIC DOENCA FAMILIA INTERNACAO ATÉ 3 DIAS
  37	LICENÇA ACOMPANHAR FAMILIAR - ACT
  }
  {Término - Michelle Mota - SIG 21360}
    
  pngDados.ActivePage := tbsDados;
end;

procedure TfrmCadRegOcorr.HabDesabTipoAcidTransito;
begin

  //if (CdsMotivo.FieldByName('idmotivo').AsInteger in [46, 47, 43, 24]) and                                                       //Everson Cunha - SIG38475
  if (CdsMotivo.FieldByName('tabelaesocial').Asstring = '18') and (CdsMotivo.FieldByName('codigoesocial').AsInteger in [1, 3]) and //Everson Cunha - SIG38475
     (dblckMotivoOficial.Text <> '') then
  begin
    cbbTpAcidTransito.Enabled := True;
    cbbTpAcidTransito.Color := clWindow;
    if CdsDet.FieldByName('TIPOACIDTRANSITO').AsString <> '' then
    begin
      case CdsDet.FieldByName('TIPOACIDTRANSITO').AsInteger of
        1: cbbTpAcidTransito.ItemIndex := 0;
        2: cbbTpAcidTransito.ItemIndex := 1;
        3: cbbTpAcidTransito.ItemIndex := 2;
      end;
    end;
  end
  else
  begin
    cbbTpAcidTransito.Enabled := False;
    cbbTpAcidTransito.Text := '';
    IF (CdsDet.State in [dsInsert, dsEdit]) then
      CdsDet.FieldByName('TIPOACIDTRANSITO').Value := Null;
    cbbTpAcidTransito.Color := clSilver;
  end;

end;

procedure TfrmCadRegOcorr.btnDockMonitoraOKClick(Sender: TObject);
var
  bInserindo: Boolean;
begin
  bInserindo := False;
  if (ObrigaMonitora) then
  begin
    if (dbdtDTEXAME.Text = '') then  // MSG0012
    begin
      MsgDlg('Preencha o campo Data Exame', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      pngDados.ActivePage := tbsExames;
      dbdtDTEXAME.SetFocus;
      Exit;
    end;

    if (cbbOrdemEx.Text = '') then  // MSG0018
    begin
      MsgDlg('Preencha o campo Ordem do Exame', 'Aviso', mtInformation, [mbOk, mbHelp], 0);

      pngDados.ActivePage := tbsExames;
      cbbOrdemEx.SetFocus;
      Exit;
    end;  
  end;

  CdsMonitora.FieldByName('DESC_PROC_REDUZIDA').AsString := dbLkpProcRealizado.Text;
  CdsMonitora.FieldByName('DESC_ORDEMEXAME').AsString := cbbOrdemEx.Text;
  CdsMonitora.FieldByName('DESC_INDICARESULTADO').AsString := cbbIndicaResult.Text;

  if CdsMonitora.State = dsInsert then
    bInserindo := True;

  CdsMonitora.Post;

  if bInserindo then
    toolbtnInserirMonitoraClick(Sender);

  dbdtDTEXAME.Text := '';
  cbbOrdemEx.Text := '';
  cbbIndicaResult.Text := '';

  if not bInserindo then
  begin
    toolbtnInserirMonitora.Enabled := True;
    toolbtnAlterarMonitora.Enabled := True;
    toolbtnExcluirMonitora.Enabled := True;
    toolbtnInserirMonitora.Down := False;
    toolbtnAlterarMonitora.Down := False;
    toolbtnExcluirMonitora.Down := False;
    DockDetMonitora.Visible := False;
    btnDockMonitoraOK.Visible := False;
    btnDockMonitoraCanc.Visible := False;
    btnDockMonitoraVoltar.Visible := False;
    dbgrdMonitora.BringToFront;
    if (CdsMonitora.RecordCount = 0) then
      begin
        toolbtnAlterarMonitora.Enabled := False;
        toolbtnExcluirMonitora.Enabled := False;
      end
      else
      begin
        toolbtnAlterarMonitora.Enabled := True;
        toolbtnExcluirMonitora.Enabled := True;
      end;
  end;
end;

procedure TfrmCadRegOcorr.btnPesqSitGeradoraClick(Sender: TObject);
begin
  inherited;
  {O	IDSITGERADORAACIDTRAB:
"	CHAVE ESTRANGEIRA COM A TABELA SITUACAOGERADORAACIDTRAB;
"	CONFORME CÓDIGO DA SITUAÇÃO GERADORA DO ACIDENTE DE TRABALHO ESTABELECIDO NA TABELA 16 DO MANUAL DO ESOCIAL.
}
  MontaSelectSitGerAcidTrab.Executar;
  if (MontaSelectSitGerAcidTrab.RetornouValor) then
  begin
    edtCodSitGerAcidTrab.Text := MontaSelectSitGerAcidTrab.ValoresChave[0];
    edtSitGerAcidTrab.Text := MontaSelectSitGerAcidTrab.ValoresChave[1];
    CdsCatPess.FieldByName('IDSITGERADORAACIDTRAB').AsInteger := StrToInt(MontaSelectSitGerAcidTrab.ValoresChave[2]);
  end;

end;

procedure TfrmCadRegOcorr.cbbTipoLocalChange(Sender: TObject);
begin
  inherited;
  //Everson Cunha - Ini
  //if (cbbTipoRegCat.ItemIndex = 0) and
  //   (cbbTipoLocal.Text <> '') then
  //  VerificaObrigCNPJFuncef
 // else
  //  ObrigaCNPJFuncef := False;

  VerificaObrigCNPJFuncef;

  if cbbTipoLocal.ItemIndex = 1 then
  begin
    dbedtCEP.Enabled  := False;
    dbedtCEP.ReadOnly := True;
    dbedtCEP.Color    := clSilver;
  end
  else
  begin
    dbedtCEP.Enabled  := True;
    dbedtCEP.ReadOnly := False;
    dbedtCEP.Color    := clWindow;
  end;                           
  //Everson Cunha - Fim
end;

procedure TfrmCadRegOcorr.CdsCatPessAfterInsert(DataSet: TDataSet);
begin
  inherited;
  //rbCNPJCat.Checked := True; //Everson Cunha - SIG38475
  if (CdsCatPess.State in [dsInsert, dsEdit]) then
    CdsCatPess.FieldByName('IDPESSOA').AsInteger := CdsDet.FieldByName('IDPESSOA').AsInteger;
end;

procedure TfrmCadRegOcorr.wdblkpcmbIDCIDADESChange(Sender: TObject);
begin
  inherited;
  if (wdblkpcmbIDCIDADES.Text <> '') then begin
    edtUF.Text := CdsCidades.FieldByName('CODESTADO').AsString;
    edtCodMunicipio.Text := CdsCidades.FieldByName('CODMUNICIPIO').AsString;
  end;
end;

procedure TfrmCadRegOcorr.btnLimpaSitGeradoraClick(Sender: TObject);
begin
  inherited;
  edtCodSitGerAcidTrab.Text := '';
  edtSitGerAcidTrab.Text := '';
  CdsCatPess.FieldByName('IDSITGERADORAACIDTRAB').AsInteger := 0;
end;

procedure TfrmCadRegOcorr.VerificaObrigCNPJFuncef;
begin
  //Everson Cunha - Ini
  {
  if (CdsCatPess.State in [dsInsert, dsEdit]) then begin
    if (cbbTipoRegCat.itemindex = 0) and ((cbbTipoLocal.itemindex = 0) or (cbbTipoLocal.itemindex = 1)) then
    begin
      ObrigaCNPJFuncef := True;
      if (dbedtCNPJ.Text = '') then begin
        CdsCNPJFuncef.Data := CtrlRegOcorr.RetornaCNPJFuncef;
        CdsCatPess.FieldByName('CNPJ').AsString := CdsCNPJFuncef.FieldByName('CNPJ_FUNCEF').AsString;
      end;
    end
    else
    begin
      ObrigaCNPJFuncef := False;
    end;
  end;}

  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    if cbbTipoLocal.ItemIndex = 0 then
    begin
      ObrigaCNPJFuncef := True;
      if (dbedtCNPJ.Text = '') then
      begin
        CdsCNPJFuncef.Data := CtrlRegOcorr.RetornaCNPJFuncef;
        CdsCatPess.FieldByName('CNPJ').AsString := CdsCNPJFuncef.FieldByName('CNPJ_FUNCEF').AsString;
      end;
    end
    else
    begin
      ObrigaCNPJFuncef := False;
      CdsCatPess.FieldByName('CNPJ').AsString := '';
    end;
  end;    
  //Everson Cunha - Fim
end;

//Everson Cunha - SIG38475 - Ini
{procedure TfrmCadRegOcorr.VerificaObrigCNPJRegCAT;
begin
  if (cbbTipoRegCat.ItemIndex = 0) then
    ObrigaCNPJRegCAT := False
  else
    ObrigaCNPJRegCAT := True;
end;

procedure TfrmCadRegOcorr.wdblkpcmbIDCATPESSORIGEMChange(Sender: TObject);
begin
  inherited;
  if CdsCatPess.State in [dsInsert, dsEdit] then begin
    if (wdblkpcmbIDCATPESSORIGEM.Text <> '') then
    begin
      CdsCatPess.FieldByName('DTCATORIGEM').AsDatetime := CdsCatOrigem.FieldByName('DTACIDENTE').AsDatetime;
      edtDtCatOrigem.Enabled := False;
      edtDtCatOrigem.Color := clSilver;
    end;
  end;
end;}
//Everson Cunha - SIG38475 - Fim

procedure TfrmCadRegOcorr.btnPesqNatLesaoClick(Sender: TObject);
begin
  inherited;
  MontaSelectNaturezaLesao.Executar;
  if (MontaSelectNaturezaLesao.RetornouValor) then
  begin
    CdsCatPess.FieldByName('IDNATLESAO').AsInteger := StrToInt(MontaSelectNaturezaLesao.ValoresChave[0]);
    edtCodNatLesao.Text := MontaSelectNaturezaLesao.ValoresChave[1];
    dbedtDESCNATLESAO.Text := MontaSelectNaturezaLesao.ValoresChave[2];
    ObrigaAbaAtestado := True;
  end;
end;

procedure TfrmCadRegOcorr.btnLimpaNatLesaoClick(Sender: TObject);
begin
  inherited;
  edtCodNatLesao.Text := '';
  dbedtDESCNATLESAO.Text := '';
  CdsCatPess.FieldByName('IDNATLESAO').AsInteger := 0;
end;

procedure TfrmCadRegOcorr.btnBuscaCidAtestadoClick(Sender: TObject);
begin
  inherited;
  MontaSelectCID.Executar;
  if (MontaSelectCID.RetornouValor) then
  begin
    dbedtCATCODCID.Text := MontaSelectCID.ValoresChave[0];
    CdsCatPess.FieldByName('CODCID').AsString := MontaSelectCID.ValoresChave[0];
    edtDescCID.Text := MontaSelectCID.ValoresChave[1];
    ObrigaAbaAtestado := True;
  end;
end;

procedure TfrmCadRegOcorr.btnBuscaExaminadorAtestadoClick(Sender: TObject);
begin
  inherited;
  if (frmProcuraPessoaDoc.ShowModal = mrOk) and (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    CdsCatPess.FieldByName('IDEXAMINADOR').asString := frmProcuraPessoaDoc.sIdPessoa;
    edtExaminadorAtestado.Text := frmProcuraPessoaDoc.sNomePessoa;
    MostraDadosExaminadorOcorr(StrToInt(frmProcuraPessoaDoc.sIdPessoa));
    ObrigaAbaAtestado := True;
  end;
end;

procedure TfrmCadRegOcorr.btnLimpaAgenteCausadorClick(Sender: TObject);
begin
  inherited;
  CdsCatPess.FieldByName('COD_AGENTE_CAUSADOR_ACID_TRAB').Value := null;
  edtCodCausaAcid.Text := '';
  edtDescCausaAcid.Text := '';
end;

procedure TfrmCadRegOcorr.btnLimpaSituacaoGeradoraClick(Sender: TObject);
begin
  inherited;
  //CdsCatPessXOutros.FieldByName('CODTABELAESOCIAL').Value := null;
  //CdsCatPessXOutros.FieldByName('CODIGOESOCIAL').Value := null;
  btnPesqAgenteCausador.Enabled := True;
  btnLimpaAgenteCausador.Enabled := True;
end;

procedure TfrmCadRegOcorr.btnDockMonitoraCancClick(Sender: TObject);
begin
  inherited;
  toolbtnInserirMonitora.Enabled := True;
  toolbtnAlterarMonitora.Enabled := True;
  toolbtnExcluirMonitora.Enabled := True;
  toolbtnInserirMonitora.Down := False;
  toolbtnAlterarMonitora.Down := False;
  toolbtnExcluirMonitora.Down := False;
  DockDetMonitora.Visible := False;
  btnDockMonitoraOK.Visible := False;
  btnDockMonitoraCanc.Visible := False;
  btnDockMonitoraVoltar.Visible := False;
  dbgrdMonitora.BringToFront;
  CdsMonitora.Cancel;

  if (CdsMonitora.RecordCount = 0) then
  begin
    toolbtnAlterarMonitora.Enabled := False;
    toolbtnExcluirMonitora.Enabled := False;
  end
  else
  begin
    toolbtnAlterarMonitora.Enabled := True;
    toolbtnExcluirMonitora.Enabled := True;
  end;
end;

procedure TfrmCadRegOcorr.btnDockMonitoraVoltarClick(Sender: TObject);
begin
  inherited;
  toolbtnInserirMonitora.Enabled := True;
  toolbtnAlterarMonitora.Enabled := True;
  toolbtnExcluirMonitora.Enabled := True;
  toolbtnInserirMonitora.Down := False;
  toolbtnAlterarMonitora.Down := False;
  toolbtnExcluirMonitora.Down := False;
  DockDetMonitora.Visible := False;
  btnDockMonitoraOK.Visible := False;
  btnDockMonitoraCanc.Visible := False;
  btnDockMonitoraVoltar.Visible := False;
  dbgrdMonitora.BringToFront;
  CdsMonitora.Cancel;

  if (CdsMonitora.RecordCount = 0) then
  begin
    toolbtnAlterarMonitora.Enabled := False;
    toolbtnExcluirMonitora.Enabled := False;
  end
  else
  begin
    toolbtnAlterarMonitora.Enabled := True;
    toolbtnExcluirMonitora.Enabled := True;
  end;
end;

procedure TfrmCadRegOcorr.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  CtrlRegOcorr.CdsHstAsMed := CdsDet;
  CtrlRegOcorr.CdsHstAsMedXExame := CdsMonitora;
  CtrlRegOcorr.CdsCatPess := CdsCatPess;
  //CtrlRegOcorr.CdsCatPessXOutros := CdsCatPessXOutros; //Everson Cunha - SIG38475
  inherited;
end;


procedure TfrmCadRegOcorr.CmeMonitoraBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CtrlRegOcorr.CdsHstAsMedXExame := CdsMonitora;
end;

procedure TfrmCadRegOcorr.dbchkFLGCOMUNICACAOPOLICIALClick(
  Sender: TObject);
begin
  inherited;
  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    if (dbchkFLGCOMUNICACAOPOLICIAL.checked) then
      CdsCatPess.FieldByName('FLGCOMUNICACAOPOLICIAL').AsString := 'S'
    else
      CdsCatPess.FieldByName('FLGCOMUNICACAOPOLICIAL').AsString := 'N';
  end;
end;

procedure TfrmCadRegOcorr.dbchkFLGOBITOClick(Sender: TObject);
begin
  inherited;
  if (CdsCatPess.State in [dsInsert, dsEdit]) then
  begin
    if (dbchkFLGOBITO.Checked) then
    begin
      //Everson Cunha - SIG38475
      dtpDataObito.Color := clWindow;
      //Everson Cunha - SIG38475

      CdsCatPess.FieldByName('FLGOBITO').AsString := 'S';
      dtpDataObito.Enabled := True;
      dtpDataObito.SetFocus;
    end
    else
    begin
      CdsCatPess.FieldByName('FLGOBITO').AsString := 'N';
      dtpDataObito.Enabled := False;

      //Everson Cunha - SIG38475
      dtpDataObito.Text := EmptyStr;
      dtpDataObito.Color := clSilver;
      //Everson Cunha - SIG38475
    end;
  end;
end;

procedure TfrmCadRegOcorr.sbtnExcluiDetClick(Sender: TObject);
begin
  CtrlRegOcorr.Operacao('Delete');
  // verifica qual aba para apagar os filhos
  if (pgctrlDetalhe.ActivePage = tbsDet) then
    begin
        //Ewerton Beltramini - 20/08/2021 - SIG118663 - O Campo não existem mais na tabela.
        (*
        if (CtrlRegOcorr.VerificaDependeOcorr(CdsDet.FieldByName('IDHSTASMED').AsInteger) <> 0) then
        begin
          MsgDlg('Existe vínculo "Atestado Anterior" para este registro. Ele não pode ser excluído', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
          Exit;
        end;
        *)

      CdsMonitora.Data := CtrlRegOcorr.ListExames(FloatToStr(CdsDet.fieldbyname('IDPESSOA').AsFloat),FloatToStr(CdsDet.fieldbyname('IDHSTASMED').AsFloat));
      if (CdsMonitora.RecordCount = 0) then
      begin
        toolbtnAlterarMonitora.Enabled := False;
        toolbtnExcluirMonitora.Enabled := False;
      end
      else
      begin
        toolbtnAlterarMonitora.Enabled := True;
        toolbtnExcluirMonitora.Enabled := True;
      end;
      if (CdsMonitora.RecordCount > 0) then
      begin
        CdsMonitora.First;
        while not CdsMonitora.Eof do
          begin
            CdsMonitora.Delete;
          end;
      end;
    end
  else if (pgctrlDetalhe.ActivePage = tbsCat) then
    begin
      if (CtrlRegOcorr.VerificaDependeCatPess(CdsCatPess.FieldByName('IDCATPESS').AsInteger) <> 0) then
        begin
          MsgDlg('Existe vínculo "Nº CAT de Origem" para este registro. Ele não pode ser excluído', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
          Exit;
        end;

      //CdsCatPessXOutros.Data := CtrlRegOcorr.ListCatPessXOutros(FloatToStr(CdsCatPess.FieldByName('IDCATPESS').AsFloat));
      //Everson Cunha - SIG38475 - Ini
      {CdsCatPessXOutros.Filtered := False;
      CdsCatPessXOutros.Filter := 'IDCATPESS = ' + CdsCatPess.FieldByName('idcatpess').AsString;
      CdsCatPessXOutros.Filtered := True;

      if (CdsCatPessXOutros.RecordCount > 0) then
      begin
        CdsCatPessXOutros.First;
        while not CdsCatPessXOutros.Eof do
          begin
            CdsCatPessXOutros.Delete;
          end;
      end;}
      //Everson Cunha - SIG38475 - Fim
    end;

  inherited;

end;

procedure TfrmCadRegOcorr.edtCodCnesSSRKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadRegOcorr.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  DesabilitaCamposDados;
end;

procedure TfrmCadRegOcorr.edtDTATENDIMENTOChange(Sender: TObject);
begin
  inherited;
  if (edtDTATENDIMENTO.Text <> '') then
    ObrigaAbaAtestado := True;
end;

procedure TfrmCadRegOcorr.medtHORAATENDIMENTOChange(Sender: TObject);
begin
  inherited;
  if (medtHORAATENDIMENTO.Text <> '') then
    ObrigaAbaAtestado := True;
end;

procedure TfrmCadRegOcorr.edtdbOrgaoClasseChange(Sender: TObject);
begin
  inherited;
  if (edtdbOrgaoClasse.Text <> '') then
    ObrigaAbaAtestado := True;
end;

procedure TfrmCadRegOcorr.dbchkFLGAFASTAMENTOClick(Sender: TObject);
begin
  inherited;
  if (dbchkFLGAFASTAMENTO.Checked) then
    ObrigaAbaAtestado := True;
end;

procedure TfrmCadRegOcorr.dbchkFLGINTERNACAOClick(Sender: TObject);
begin
  inherited;
  if (dbchkFLGINTERNACAO.Checked) then
    ObrigaAbaAtestado := True;
end;

procedure TfrmCadRegOcorr.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  ObrigaAbaAtestado := False;
end;

procedure TfrmCadRegOcorr.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (wdblkpcmbIDCATPESSORIGEM.Focused) then begin
    if (Key = #08) then
    begin
      // limpa campo nro cat origem
      CdsCatPess.FieldByName('IDCATPESSORIGEM').Value := Null;
      //CdsCatPess.FieldByName('DTCATORIGEM').Value := Null; //Everson Cunha - SIG38475
      //edtDtCatOrigem.Enabled := True;                      //Everson Cunha - SIG38475
      //edtDtCatOrigem.Color := clWhite;                     //Everson Cunha - SIG38475
    end;
  end;

  inherited;
end;

// Término - Michelle Mota - SOL: 250391.17474 - PPM: 959204

{Início - Michelle Mota - SIG 22091}
procedure TfrmCadRegOcorr.btnLimpaCidOcorrClick(Sender: TObject);
begin
  inherited;
  dbedCODCID.Text := '';
  edCID.Text := '';
  CdsDet.FieldByName('CODCID').asString := '';
end;

procedure TfrmCadRegOcorr.btnLimpaExamOcorrClick(Sender: TObject);
begin
  inherited;
  dbedAvaliador.Text := '';
  edtNroInscrCRMExaminador.Text := '';
  CdsDet.FieldByName('IDEXAMINADOR').asString := '';
  CdsDet.FieldByName('EXAMINADOR').asString := '';
end;

procedure TfrmCadRegOcorr.btnLimpaExamAtestClick(Sender: TObject);
begin
  inherited;
  edtExaminadorAtestado.Text := '';
  CdsCatPess.FieldByName('ORGAOCLASSE').AsInteger := 0;
  edtInscrExamAtestado.Text := '';
  edtUFExamAtestado.Text := '';
  CdsCatPess.FieldByName('IDEXAMINADOR').asString := '';
end;

procedure TfrmCadRegOcorr.btnLimpaCIDAtestClick(Sender: TObject);
begin
  inherited;
  dbedtCATCODCID.Text := '';
  edtDescCID.Text := '';
  CdsCatPess.FieldByName('CODCID').AsString := '';
end;
{Término - Michelle Mota - SIG 22091}

procedure TfrmCadRegOcorr.dbCmbOrigRetificacaoExit(Sender: TObject);
begin
  inherited;
	if (dbCmbOrigRetificacao.ItemIndex <> -1) and (dbCmbOrigRetificacao.ItemIndex <> 0) then
  begin
    cdsProcessos.Data := CtrlRegOcorr.ListProcessosFuncionario(Cds.FieldByName('IDPESSOA').asInteger, dbedDatInicio.Date);
    if cdsProcessos.IsEmpty then
    begin
      MsgDlg('Não existem processos cadastrados para este funcionário', 'Aviso', mtWarning, [mbOk], 0);
      dbCmbOrigRetificacao.SetFocus;
      dbLkpProcessos.Color := clSilver;
    	dbLkpProcessos.Enabled := False;
      Exit;
    end
    else
    begin
    	dbLkpProcessos.Color := clWindow;
    	dbLkpProcessos.Enabled := True;
    end;
  end
  else
  begin
  	dbLkpProcessos.Color := clSilver;
  	dbLkpProcessos.Enabled := False;
  end;
end;

procedure TfrmCadRegOcorr.cbbTipoLocalEnter(Sender: TObject);
begin
  inherited;
  cbbTipoLocal.DropDown;
end;

procedure TfrmCadRegOcorr.btnParteCorpoClick(Sender: TObject);
begin
  inherited;
  CdsCatPess.FieldByName('COD_PARTE_CORPO_ATINGIDA').asString := null;
  edtCodParteAtingida.Text := '';
  edtDescParteAtingida.Text := '';
end;

procedure TfrmCadRegOcorr.cbbTipoAcidenteCatEnter(Sender: TObject);
begin
  inherited;
  cbbTipoAcidenteCat.DropDown;
end;

procedure TfrmCadRegOcorr.cbbTipoCatEnter(Sender: TObject);
begin
  inherited;
  cbbTipoCat.DropDown;
end;

procedure TfrmCadRegOcorr.dbedtDURACAOTRATAMENTOChange(Sender: TObject);
begin
  inherited;
  if (dbedtDURACAOTRATAMENTO.Text <> '') then
    ObrigaAbaAtestado := True;
end;

procedure TfrmCadRegOcorr.edtdbOrgaoClasseEnter(Sender: TObject);
begin
  inherited;
  edtdbOrgaoClasse.DropDown;
end;

procedure TfrmCadRegOcorr.cbbCATEmitidaPorEnter(Sender: TObject);
begin
  inherited;
  cbbCATEmitidaPor.DropDown;
end;

procedure TfrmCadRegOcorr.cbbLATERALCORPOATINGIDAEnter(Sender: TObject);
begin
  inherited;
  cbbLATERALCORPOATINGIDA.DropDown;
end;

procedure TfrmCadRegOcorr.edtMesesValidadeASOExit(Sender: TObject);
begin
  inherited;

  if (Trim(edtMesesValidadeASO.text) <> '') and (Trim(dtDataAso.Text) <> '') then
    CdsDet.FieldByName('DT_VALIDADE_ASO').AsDateTime := StrToDateTime(FU.IncData(dtDataAso.Text, 0, StrToInt(edtMesesValidadeASO.text), 0));
end;

procedure TfrmCadRegOcorr.dbDtValidadeASOExit(Sender: TObject);
var
  iNumDias, iNumMeses, iNumAnos : Integer;
begin
  inherited;

  if (CdsDet.FieldByName('DTASO').AsString <> '') and (CdsDet.FieldByName('DT_VALIDADE_ASO').AsString <> '') then
    if FU.CalculaDifData(CdsDet.FieldByName('DTASO').AsString, CdsDet.FieldByName('DT_VALIDADE_ASO').AsString, iNumDias, iNumMeses, iNumAnos) then
      edtMesesValidadeASO.text := IntToStr(iNumMeses);

end;

procedure TfrmCadRegOcorr.dbDtValidadeASOChange(Sender: TObject);
var
  iNumDias, iNumMeses, iNumAnos : Integer;
begin
  inherited;

  if (CdsDet.FieldByName('DTASO').AsString <> '') and (CdsDet.FieldByName('DT_VALIDADE_ASO').AsString <> '') then
    if FU.CalculaDifData(CdsDet.FieldByName('DTASO').AsString, CdsDet.FieldByName('DT_VALIDADE_ASO').AsString, iNumDias, iNumMeses, iNumAnos) then
      edtMesesValidadeASO.text := IntToStr(iNumMeses);

end;

end.

