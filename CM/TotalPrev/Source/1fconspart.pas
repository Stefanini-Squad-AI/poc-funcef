// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//------------------------------------------------------------------------------
// Data       : 26/02/2018
// Autor      : Everson Luiz Pereira da Cunha
// SIG        : SIG TIBERO
// Descrição  : Ajustes nos SQL, incluindo os alias nas tabelas/campos.
//              Retirada de INDEX, +rule etc.
//              Melhoria realizada para adaptação ao TIBERO.
//******************************************************************************
// Atualizado em: 18/09/2003 - André Tavares - pendência - 15055
//              : 21/10/2003 - André Tavares - pendência - 15468
//              : 28/10/2003 - André Tavares - pendência - 15518
//              : 13/10/2003 - André Tavares - pendência - 15616
//              : 27/11/2003 - André Tavares - pendência - 15543
//              : 22/11/2003 - André Tavares - pendêcia  - 15211: incorporação dos fontes da FUNCEF (Flávio dias)
//              : 22/11/2003 - André Tavares - pendêcia  - 15254:
//                inclusão do campo datacancela da tabela depentit no grid de depententes
//              : 22/11/2003 - André Tavares - pendêcia  - 15971: inclusão de um decode (11) na query qryMovBenef
//              : 13/12/2003 - André Tavares - pendêcia  - 15889: ajuste do grid na tela.
//              : 20/01/2004 - André Tavares - pendêcia  - 15928
//              : 25/02/2003 - André Tavares - pendência - 16109
//              : 26/02/2004 - Andre Tavares  - pendência - 16122
//              : 12/04/2004 - Andre Tavares - pendencia  - 16681 - 16699 (alterei a query qryrubIndiv)
//              : 04/10/2004 - André Tavares - pendência 17503
//              : 05/10/2004 - Andre Tavares - pendência 17477
//              : 11/10/2004 - andre tavares - pendência 17362
//              : 14/10/2004 - andre tavares - pendência 17909 - alterada a query qrypartgeral
//              : 25/10/2004 - André Tavares - pendência 17697 - na ítem Benefícios/Situação. Alterar Final Pgto para Final Pgto Efetivo, inserir Pgto Prevista.
//              : 25/10/2004 - André Tavares - pendência 17472 - Criação do ítem de Menu 'Vida Na Fundação'
//******************************************************************************


unit fconspart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, fcClearPanel,
  fcButtonGroup, fcOutlookBar, dConsPart, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Mask, wwdbedit, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db,
  DBTables, Wwquery, MontaSelect, Menus, DBCtrls, DBCGrids, wwdblook,
  ComCtrls, wwriched, DBCtrls2, wwdbdatetimepicker, CMDateTimePicker,  FTelaAut,
  fFrameConsultaHistorico, AppEvnts, FPai, UAutorizacao, uCtrlTempoServico, uCmClientDataSet,
  Wwdatsrc, DBaseDados, usistema, Provider, DBClient, Spin, TREdit,
  uCmSqlParams, dConsPart1, TB97Tlwn;

type
  TFRMconspart = class(TfrmPai)
    qryAux: TwwQuery;
    MenuPrin: TMainMenu;
    AgendaPessoal: TMenuItem;
    DadosPessoais: TMenuItem;
    Documentos: TMenuItem;
    Enderecos: TMenuItem;
    Telefones: TMenuItem;
    Contatos: TMenuItem;
    ContasBancrias: TMenuItem;
    Dependentes: TMenuItem;
    VidaFuncional: TMenuItem;
    HistricodeContribuies1: TMenuItem;
    RUB: TMenuItem;
    Eventos: TMenuItem;
    Protocolos: TMenuItem;
    Previdenciario: TMenuItem;
    Assistencial: TMenuItem;
    ProcessosRad: TMenuItem;
    DadosBasicos: TMenuItem;
    EvolucaoFuncional: TMenuItem;
    HistoricoFuncional: TMenuItem;
    RubricasSalariais: TMenuItem;
    Contribuicoes: TMenuItem;
    SituaoAtual1: TMenuItem;
    Histrico1: TMenuItem;
    Reserva1: TMenuItem;
    Saldo1: TMenuItem;
    HistricodeAlimentao1: TMenuItem;
    Beneficios: TMenuItem;
    Pagamentos: TMenuItem;
    InformedeRendimentos: TMenuItem;
    RubricasIndividuais: TMenuItem;
    ContraCheque: TMenuItem;
    Historico: TMenuItem;
    SituaoAtual: TMenuItem;
    Processos: TMenuItem;
    Beneficiarios: TMenuItem;
    Enquadramento: TMenuItem;
    Emprestimo: TMenuItem;
    Previdencirios1: TMenuItem;
    Assistenciais1: TMenuItem;
    Previdencirias1: TMenuItem;
    Assistenciais2: TMenuItem;
    ScrollBox2: TScrollBox;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    wwDBEdit28: TwwDBEdit;
    wwDBEdit29: TwwDBEdit;
    wwDBEdit30: TwwDBEdit;
    wwDBEdit31: TwwDBEdit;
    dbedSitPart: TwwDBEdit;
    wwDBEdit33: TwwDBEdit;
    wwDBEdit34: TwwDBEdit;
    edtMatricula: TwwDBEdit;
    wwDBEdit37: TwwDBEdit;
    wwDBEdit38: TwwDBEdit;
    edClassific: TEdit;
    wwDBEdit39: TwwDBEdit;
    DblkPlanos: TwwDBLookupCombo;
    Label1: TLabel;
    HistricodeMovimentaes1: TMenuItem;
    Planos1: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    Label169: TLabel;
    wwDBEdit90: TwwDBEdit;
    Dock972: TDock97;
    lblBloqueio: TLabel;
    tb97Fundo2: TToolbar97;
    bbtnSair2: TBitBtn;
    bbtnAjuda2: TmaHelpBitBtn;
    bbtnProcurar: TBitBtn;
    sbtnTitular: TBitBtn;
    ds: TwwDataSource;
    CmCdsEMPRESA: TStringField;
    CmCdsMATRICULA: TStringField;
    CmCdsDATAINICIO: TDateTimeField;
    CmCdsDATAFINAL: TDateTimeField;
    CmCdsTEMPOCALC: TFloatField;
    CmCdsFLGCONTATS: TFloatField;
    CmCdsTEMPOSERVANTERIOR: TFloatField;
    CmCdsTEMPONAOCREDITADO: TFloatField;
    CmCdsTEMPOSEMCONVERSAO: TFloatField;
    CmCdsTEMPOTOTALEXT: TStringField;
    CmCdsTEMPOSEMCONVERSAOEXT: TStringField;
    CmCdsTEMPOSERVCALC: TFloatField;
    CmCdsTEMPOSITESPECIAL: TFloatField;
    CmCdsNOME: TStringField;
    CmCdsCPF: TStringField;
    CmCdsIDPESSOA: TFloatField;
    CmCdsSEQHISTFUNC: TFloatField;
    CmCdsTEMPOINDIVEXT: TStringField;
    CmCds: TCMClientDataSet;
    NBKelegpart: TNotebook;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    lblEstadoCivil: TLabel;
    Naturalidade: TLabel;
    Label51: TLabel;
    lblEMail: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label106: TLabel;
    Label2: TLabel;
    Label135: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbedEstadoCivil: TwwDBEdit;
    pnlDependentes: TPanel;
    wwDBEdit16: TwwDBEdit;
    wwDBEdit17: TwwDBEdit;
    dbedEMail: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    wwDBEdit9: TwwDBEdit;
    wwDBEdit10: TwwDBEdit;
    wwDBEdit12: TwwDBEdit;
    DBImage1: TDBImage;
    DbedIdade: TwwDBEdit;
    dbedNumElegBenef: TwwDBEdit;
    DbeditCidade: TwwDBEdit;
    wwDBEdit88: TwwDBEdit;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    Bevel2: TBevel;
    Label120: TLabel;
    Label123: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label129: TLabel;
    Label124: TLabel;
    Label121: TLabel;
    Label128: TLabel;
    Label125: TLabel;
    Label122: TLabel;
    wwDBEdit41: TwwDBEdit;
    wwDBEdit44: TwwDBEdit;
    wwDBEdit47: TwwDBEdit;
    wwDBEdit48: TwwDBEdit;
    wwDBEdit50: TwwDBEdit;
    wwDBEdit45: TwwDBEdit;
    wwDBEdit42: TwwDBEdit;
    wwDBEdit49: TwwDBEdit;
    wwDBEdit46: TwwDBEdit;
    wwDBEdit43: TwwDBEdit;
    Panel7: TPanel;
    DBCtrlGridTelefones: TDBCtrlGrid;
    Label3: TLabel;
    Label4: TLabel;
    Label63: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit32: TwwDBEdit;
    wwDBEdit35: TwwDBEdit;
    GroupBox4: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    Label73: TLabel;
    Panel24: TPanel;
    DBGrContatos: TwwDBGrid;
    DBRichEdObs: TwwDBRichEdit;
    dbgrContaBancaria: TwwDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    dbgriddepen: TwwDBGrid;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText5: TDBText;
    Panel6: TPanel;
    wwDBEdit18: TwwDBEdit;
    wwDBEdit19: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    PanelDadosFuncionais: TPanel;
    lblnomepatro: TLabel;
    Label151: TLabel;
    lblNomeCargo: TLabel;
    Label18: TLabel;
    Label156: TLabel;
    lblDataAdmissao: TLabel;
    Label165: TLabel;
    lblNomeFilial: TLabel;
    lblSitFunc: TLabel;
    lblSalarioTotal: TLabel;
    Label102: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label68: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    dbednomepatro: TwwDBEdit;
    dbedCargo: TwwDBEdit;
    DbedFunc: TwwDBEdit;
    dbednivel: TwwDBEdit;
    wwDBEdit82: TwwDBEdit;
    dbeddataadmissao: TwwDBEdit;
    wwDBEdit87: TwwDBEdit;
    dbedFilial: TwwDBEdit;
    dbedsitfunc: TwwDBEdit;
    dbedsaltotal: TwwDBEdit;
    wwDBEdit40: TwwDBEdit;
    wwDBEdit92: TwwDBEdit;
    wwDBEdit93: TwwDBEdit;
    wwDBEdit94: TwwDBEdit;
    dbeValor1: TwwDBEdit;
    dbeValor2: TwwDBEdit;
    dbeValor3: TwwDBEdit;
    Bevel1: TBevel;
    Label101: TLabel;
    DBText1: TDBText;
    pgctrlDetalhe: TPageControl;
    tbsDet: TTabSheet;
    pnlControlesDet: TPanel;
    Label75: TLabel;
    lblTituloTipo: TLabel;
    Label76: TLabel;
    dblkpcmbCargoxNivel: TwwDBLookupCombo;
    dbDataInicio: TCMDateTimePicker;
    dblkpcmbModoCargo: TwwDBLookupCombo;
    dbgrdDet: TwwDBGrid;
    tbsFuncao: TTabSheet;
    pnlControlesFuncao: TPanel;
    tbsAdicCompens: TTabSheet;
    pnlAdicCompensatorio: TPanel;
    tbsATS: TTabSheet;
    pnlATS: TPanel;
    tbsAdicInsalub: TTabSheet;
    Panel29: TPanel;
    tbsAdicNoturno: TTabSheet;
    pnlAdicNoturno: TPanel;
    tbsAdicPericul: TTabSheet;
    Panel32: TPanel;
    tbsRubSal: TTabSheet;
    pnlControlesRubSalarial: TPanel;
    Panel43: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    pnlHstFuncional: TPanel;
    dbgridhistfunc: TwwDBGrid;
    wwDBEdit13: TwwDBEdit;
    wwDBEdit14: TwwDBEdit;
    wwDBEdit89: TwwDBEdit;
    wwDBEdit91: TwwDBEdit;
    wwDBGrid11: TwwDBGrid;
    Panel28: TPanel;
    Panel18: TPanel;
    Label74: TLabel;
    Label14: TLabel;
    Label54: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    dblkMesCobranca: TwwDBLookupCombo;
    dblkPatros: TwwDBLookupCombo;
    wwDBEdit25: TwwDBEdit;
    wwDBEdit26: TwwDBEdit;
    wwDBEdit83: TwwDBEdit;
    Panel3: TPanel;
    grpbxHstEventPro: TGroupBox;
    wwDBGrid2: TwwDBGrid;
    GroupBox2: TGroupBox;
    pnlEventPrevHstContrib: TPanel;
    Shape2: TShape;
    Shape3: TShape;
    Label16: TLabel;
    Label17: TLabel;
    Panel4: TPanel;
    dbgHstContFechado: TwwDBGrid;
    Panel5: TPanel;
    dbgrdEventos: TwwDBGrid;
    DBCtrlGrid1: TDBCtrlGrid;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label58: TLabel;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit44: TDBEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    dbgridproc: TwwDBGrid;
    Panel14: TPanel;
    GrdRub: TwwDBGrid;
    Panel26: TPanel;
    wwDBGrid7: TwwDBGrid;
    Panel27: TPanel;
    Panel30: TPanel;
    wwDBGrid9: TwwDBGrid;
    wwDBGrid10: TwwDBGrid;
    Panel31: TPanel;
    DBCtrlGrid3: TDBCtrlGrid;
    Bevel3: TBevel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    dbtNoneValBase1: TDBText;
    dbtNoneValBase2: TDBText;
    dbtNoneValBase3: TDBText;
    wwDBEdit51: TwwDBEdit;
    wwDBEdit52: TwwDBEdit;
    wwDBEdit53: TwwDBEdit;
    wwDBEdit54: TwwDBEdit;
    wwDBEdit55: TwwDBEdit;
    wwDBEdit56: TwwDBEdit;
    wwDBEdit57: TwwDBEdit;
    Panel22: TPanel;
    dbgrdContribPrev: TwwDBGrid;
    lblSaldosReserva: TLabel;
    LblSaldoResControle: TLabel;
    Panel15: TPanel;
    dbgrdResPoupanca: TwwDBGrid;
    dbgrHistReserva: TwwDBGrid;
    Panel35: TPanel;
    wwDBGrid12: TwwDBGrid;
    Panel33: TPanel;
    Panel34: TPanel;
    DBCtrlGrid4: TDBCtrlGrid;
    Bevel4: TBevel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    DBText4: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBEdNumProcCM: TwwDBEdit;
    wwDBEdit58: TwwDBEdit;
    wwDBEdit59: TwwDBEdit;
    wwDBEdit60: TwwDBEdit;
    wwDBEdit61: TwwDBEdit;
    wwDBEdit62: TwwDBEdit;
    wwDBEdit63: TwwDBEdit;
    wwDBEdit64: TwwDBEdit;
    wwDBEdit65: TwwDBEdit;
    wwDBEdit66: TwwDBEdit;
    wwDBEdit67: TwwDBEdit;
    wwDBEdit68: TwwDBEdit;
    wwDBEdit69: TwwDBEdit;
    wwDBEdit70: TwwDBEdit;
    wwDBEdit71: TwwDBEdit;
    wwDBEdit72: TwwDBEdit;
    wwDBEdit73: TwwDBEdit;
    wwDBEdit74: TwwDBEdit;
    wwDBEdit75: TwwDBEdit;
    wwDBEdit76: TwwDBEdit;
    wwDBEdit77: TwwDBEdit;
    wwDBEdit78: TwwDBEdit;
    DBCheckBox1: TDBCheckBox;
    wwDBEdit79: TwwDBEdit;
    DBCheckBox2: TDBCheckBox;
    wwDBEdit80: TwwDBEdit;
    Panel25: TPanel;
    dbgirdbenef: TwwDBGrid;
    Panel19: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label26: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit7: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit4: TDBEdit;
    dbgRubIndiv: TwwDBGrid;
    Panel21: TPanel;
    dbgridpart: TwwDBGrid;
    Panel40: TPanel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    wwDBEdit84: TwwDBEdit;
    wwDBEdit85: TwwDBEdit;
    wwDBEdit86: TwwDBEdit;
    edValEnq: TEdit;
    wwDBGrid13: TwwDBGrid;
    dbgrdCompoDIB: TwwDBGrid;
    Panel39: TPanel;
    Panel10: TPanel;
    wwDBGrid4: TwwDBGrid;
    wwDBGrid5: TwwDBGrid;
    Panel11: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label64: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label134: TLabel;
    dbgridpartprev: TwwDBGrid;
    DBEdit36: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit43: TDBEdit;
    wwDBGrid8: TwwDBGrid;
    Panel20: TPanel;
    Panel23: TPanel;
    dbgirdcontrib: TwwDBGrid;
    Panel37: TPanel;
    dbgridbeneficios: TwwDBGrid;
    Panel38: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit15: TwwDBEdit;
    wwDBEdit21: TwwDBEdit;
    wwDBEdit22: TwwDBEdit;
    wwDBEdit23: TwwDBEdit;
    wwDBEdit24: TwwDBEdit;
    dbgrMovBenef: TwwDBGrid;
    pnlPrevidenciario: TPanel;
    dbgridPrev: TwwDBGrid;
    pnlAssistencial: TPanel;
    dbgridplanass: TwwDBGrid;
    AcaoJudicial: TMenuItem;
    Panel41: TPanel;
    pnlRestoMestre: TPanel;
    Panel42: TPanel;
    gbInfVara: TGroupBox;
    lbCodVara: TLabel;
    lbNomeVara: TLabel;
    edCodVara: TEdit;
    edNomeVara: TEdit;
    gbInfSecao: TGroupBox;
    lbCodSecao: TLabel;
    lbUfSecao: TLabel;
    lbNomeSecao: TLabel;
    edCodSecao: TEdit;
    edNomeSecao: TEdit;
    cmbUF: TDBLookupComboBox;
    Panel44: TPanel;
    Panel45: TPanel;
    gbxbanco: TGroupBox;
    lbBanco: TLabel;
    lbAgencia: TLabel;
    lbConta: TLabel;
    lbOperacao: TLabel;
    dblkBanco: TwwDBLookupCombo;
    dblkAgencia: TwwDBLookupCombo;
    dblkConta: TwwDBLookupCombo;
    cmbOperacao: TComboBox;
    gbDatas: TGroupBox;
    lbDataInicio: TLabel;
    lbDataFim: TLabel;
    dbdtInicio: TCMDateTimePicker;
    dbdtFinal: TCMDateTimePicker;
    Panel46: TPanel;
    Panel47: TPanel;
    gbNumProc: TGroupBox;
    edNumProc: TEdit;
    gbxPercentual: TGroupBox;
    Label105: TLabel;
    redPercAcao: TRealEdit;
    gbStatus: TGroupBox;
    cmbStatusAcao: TComboBox;
    PnlAcaoJudicial: TPanel;
    lblAutorAcao: TLabel;
    Panel48: TPanel;
    Label114: TLabel;
    cmbTipoOAcao: TComboBox;
    edAutorAcao: TEdit;
    cbxFazdeposito: TCheckBox;
    pnlCompensacao: TPanel;
    Panel49: TPanel;
    gbAnoMesInicio: TGroupBox;
    lbAnoInicio: TLabel;
    lbMesInicio: TLabel;
    cbMesInicio: TComboBox;
    speAnoInicio: TSpinEdit;
    gbAnoMesFinal: TGroupBox;
    lbAnoFim: TLabel;
    lbMesFim: TLabel;
    cbMesFim: TComboBox;
    speAnoFinal: TSpinEdit;
    GroupBox5: TGroupBox;
    redCompTotal: TRealEdit;
    GroupBox6: TGroupBox;
    pnlsaldo: TPanel;
    GroupBox7: TGroupBox;
    redsaldo: TRealEdit;
    GroupBox8: TGroupBox;
    Label166: TLabel;
    Label167: TLabel;
    edtcodvaracomp: TEdit;
    edtNomeVaracomp: TEdit;
    GroupBox9: TGroupBox;
    edtNumproccomp: TEdit;
    dbgRegras: TwwDBGrid;
    Label168: TLabel;
    DBRichEditOBS: TwwDBRichEdit;
    dbgrdFuncao: TwwDBGrid;
    dbgrdAdicCompens: TwwDBGrid;
    dbgrdATS: TwwDBGrid;
    dbgrdAdicInsalub: TwwDBGrid;
    dbgrdAdicNoturno: TwwDBGrid;
    dbgrdAdicPericul: TwwDBGrid;
    dbgrdRubSal: TwwDBGrid;
    Label77: TLabel;
    dbedDataCanc: TwwDBEdit;
    Label78: TLabel;
    wwDBEdit27: TwwDBEdit;
    DBEdit37: TDBEdit;
    Label79: TLabel;
    Panel50: TPanel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    wwDBEdit95: TwwDBEdit;
    wwDBEdit96: TwwDBEdit;
    wwDBEdit97: TwwDBEdit;
    wwDBEdit98: TwwDBEdit;
    wwDBEdit99: TwwDBEdit;
    Panel51: TPanel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    wwDBEdit101: TwwDBEdit;
    wwDBEdit102: TwwDBEdit;
    wwDBEdit103: TwwDBEdit;
    dbedValorCargo: TwwDBEdit;
    wwDBEdit105: TwwDBEdit;
    Label90: TLabel;
    Panel52: TPanel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    wwDBEdit106: TwwDBEdit;
    wwDBEdit107: TwwDBEdit;
    wwDBEdit108: TwwDBEdit;
    wwDBEdit109: TwwDBEdit;
    dbedValorFunc: TwwDBEdit;
    Panel53: TPanel;
    Panel54: TPanel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    wwDBEdit111: TwwDBEdit;
    wwDBEdit112: TwwDBEdit;
    wwDBEdit113: TwwDBEdit;
    wwDBEdit114: TwwDBEdit;
    dbedValFuncFac: TwwDBEdit;
    Panel55: TPanel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    wwDBEdit117: TwwDBEdit;
    wwDBEdit118: TwwDBEdit;
    wwDBEdit119: TwwDBEdit;
    edtValorAdicComp: TwwDBEdit;
    wwDBEdit121: TwwDBEdit;
    Label175: TLabel;
    Panel56: TPanel;
    wwDBEdit116: TwwDBEdit;
    wwDBEdit122: TwwDBEdit;
    wwDBEdit123: TwwDBEdit;
    wwDBEdit124: TwwDBEdit;
    wwDBEdit125: TwwDBEdit;
    opcao1: TDBText;
    opcao2: TDBText;
    opcao3: TDBText;
    opcao4: TDBText;
    opcao5: TDBText;
    opcao6: TDBText;
    wwDBEdit126: TwwDBEdit;
    DadosparaEnquadramento1: TMenuItem;
    wwDBEdit100: TwwDBEdit;
    Label85: TLabel;
    wwDBEdit104: TwwDBEdit;
    Label170: TLabel;
    Panel57: TPanel;
    dbLkMesInicial: TwwDBLookupCombo;
    Label176: TLabel;
    Label177: TLabel;
    DblkMesFinal: TwwDBLookupCombo;
    Label178: TLabel;
    dblkNomeReserva: TwwDBLookupCombo;
    lblTotal: TLabel;
    LblTotalControle: TLabel;
    dbEdDtEntrada: TwwDBEdit;
    Label179: TLabel;
    CMSqlParams1: TCMSqlParams;
    CmCdsFATOR: TFloatField;
    CmCdsFLGCONCOMITANTE: TFloatField;
    Label180: TLabel;
    wwDBEdit81: TwwDBEdit;
    lblNomeRecebDadosPessoais: TLabel;
    dbedNomeRecebDadosPessoais: TwwDBEdit;
    dbedCPFRecebDadosPessoais: TwwDBEdit;
    lblCPFRecebDadosPessoais: TLabel;
    dbedRGRecebDadosPessoais: TwwDBEdit;
    lblRGRecebDadosPessoais: TLabel;
    lblExpedicaoRecebDadosPessoais: TLabel;
    lblUFRecebDadosPessoais: TLabel;
    dbedExpedicaoRecebDadosPessoais: TwwDBEdit;
    dbedUFRecebDadosPessoais: TwwDBEdit;
    Parcelamento1: TMenuItem;
    Panel58: TPanel;
    Label182: TLabel;
    DBCtrlGrid5: TDBCtrlGrid;
    DBEdit38: TDBEdit;
    Label181: TLabel;
    DBEdit39: TDBEdit;
    Label183: TLabel;
    Label184: TLabel;
    DBEdit40: TDBEdit;
    Label185: TLabel;
    DBEdit46: TDBEdit;
    Label186: TLabel;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    Label187: TLabel;
    DBEdit49: TDBEdit;
    Label188: TLabel;
    Label189: TLabel;
    DBEdit50: TDBEdit;
    Label190: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    Label191: TLabel;
    DBEdit53: TDBEdit;
    Label192: TLabel;
    DBEdit54: TDBEdit;
    Label193: TLabel;
    Label194: TLabel;
    DBEdit55: TDBEdit;
    Label195: TLabel;
    DBEdit56: TDBEdit;
    Panel36: TPanel;
    dbgrdOutrasInforms: TwwDBGrid;
    Panel59: TPanel;
    OutrasInformaes1: TMenuItem;
    wwDBGrid3: TwwDBGrid;
    Panel60: TPanel;
    twMensagem: TToolWindow97;
    Panel61: TPanel;
    BitBtn1: TBitBtn;
    reditMSG: TRichEdit;
    wwDBEdit36: TwwDBEdit;
    Label196: TLabel;
    VidaNaFundao1: TMenuItem;
    wwDBGrid6: TwwDBGrid;
    wwDBGrid14: TwwDBGrid;
    Panel63: TPanel;
    Panel62: TPanel;
    procedure DadosPessoaisClick(Sender: TObject);
    procedure DocumentosClick(Sender: TObject);
    procedure bbtnSair2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgHstContFechadoCalcCellColors(Sender: TObject;
      Field: TField; State: TGridDrawState; Highlight: Boolean;
      AFont: TFont; ABrush: TBrush);
    procedure AtualizaDadosRub;
    procedure AtualizaDadosPlano;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure dbgridPrevFieldChanged(Sender: TObject; Field: TField);
    procedure dblkRecebedorChange(Sender: TObject);
    procedure dbgrVersoesRowChanged(Sender: TObject);
    procedure dbgridbeneficiosFieldChanged(Sender: TObject; Field: TField);
    Function TransformaDiasTempo(Tempo:Integer):String;
    Function TempoExtenso(Tempo:Integer):String;
    procedure wwDBGrid3RowChanged(Sender: TObject);
    procedure dblkMesCobrancaChange(Sender: TObject);
    procedure wwDBGrid5CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    // tavares
    procedure MostraBloqueio;
    procedure TbshHstRubricasShow(Sender: TObject);
    procedure RodaRegraElegibilidade;
    procedure NBKelegpartPageChanged(Sender: TObject);
    procedure EnderecosClick(Sender: TObject);
    procedure PrevidenciarioClick(Sender: TObject);
    procedure AssistencialClick(Sender: TObject);
    procedure HistoricoFuncionalClick(Sender: TObject);
    procedure DadosBasicosClick(Sender: TObject);
    procedure TelefonesClick(Sender: TObject);
    procedure ContasBancriasClick(Sender: TObject);
    procedure DependentesClick(Sender: TObject);
    procedure EmprestimoClick(Sender: TObject);
    procedure ProtocolosClick(Sender: TObject);
    procedure ProcessosRadClick(Sender: TObject);
    procedure Saldo1Click(Sender: TObject);
    procedure RubricasIndividuaisClick(Sender: TObject);
    procedure ContraChequeClick(Sender: TObject);
    procedure Previdencirios1Click(Sender: TObject);
    procedure Assistenciais1Click(Sender: TObject);
    procedure Histrico1Click(Sender: TObject);
    procedure Previdencirias1Click(Sender: TObject);
    procedure Assistenciais2Click(Sender: TObject);
    procedure ContatosClick(Sender: TObject);
    procedure HistoricoClick(Sender: TObject);
    procedure RUBClick(Sender: TObject);
    procedure RubricasSalariaisClick(Sender: TObject);
    procedure EvolucaoFuncionalClick(Sender: TObject);
    procedure ClassificaPessoa;
    procedure HabilitaMenuItens;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  ExisteForm(frm: string): Boolean;
    procedure sbtnTitularClick(Sender: TObject);
    procedure DblkPlanosChange(Sender: TObject);
    procedure ProcessosClick(Sender: TObject);
    procedure SituaoAtualClick(Sender: TObject);
    procedure HistricodeAlimentao1Click(Sender: TObject);
    procedure SituaoAtual1Click(Sender: TObject);
    procedure dbgriddepenDblClick(Sender: TObject);
    procedure dbgridpartprevDblClick(Sender: TObject);
    procedure HistricodeMovimentaes1Click(Sender: TObject);
    procedure Planos1Click(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure EnquadramentoClick(Sender: TObject);
    procedure wwDBGrid6CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgrHistReservaTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure AcaoJudicialClick(Sender: TObject);
    procedure DadosparaEnquadramento1Click(Sender: TObject);
    function  BuscaValorCARGO (piIdCargo, pIdPessjur : longint) : double;
    procedure dbLkMesInicialChange(Sender: TObject);
    procedure DblkMesFinalChange(Sender: TObject);
    procedure dblkNomeReservaChange(Sender: TObject);
    procedure Parcelamento1Click(Sender: TObject);
    procedure wwDBGrid4RowChanged(Sender: TObject);
    procedure OutrasInformaes1Click(Sender: TObject);
    procedure dblkPatrosCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure twMensagemVisibleChanged(Sender: TObject);
    procedure VidaNaFundao1Click(Sender: TObject);


  private
   { Private declarations }

    CtrlTempoServico : TCtrlTempoServico;
    varFields  : variant;
    bInsere    : boolean;
    sStringAux : String;
    i          : Integer;

    nTotOrdem1, nTotOrdem2 : Double;
    lTotOrdem2 : Boolean;

    procedure CloseDatasets;
    function  ContaElegiveisAbeneficio :integer;
    function  ClienteNum(sNumero : string):string;
    function BuscaValorFUNCAOConsEleg  ( piIdPessJur,
                                         piIdFuncao   : longint;
                                         psData       : string   ) : double;
    procedure MsgErro(sMsg: String);

    procedure FiltraHistRubSal(sIdpessjur: string);
    procedure FiltraHistMovReserva;
    Procedure TotalizaReserva;

    function ContaRegistro (qry : TdataSet) : integer;
    function BuscaDtEntrada(pIdPessoa, pIdpessjur, pIdPlanoprev: integer): TdateTime;
    function GetMatricula : string;
  public
    { Public declarations }
    { flags de Classificação da pessoa }
    fElegivel, fParticipante_Assistido, fParticipante_Falecido,
    fRecebedor_Beneficio, fDependente, fParticipante_Ativo,
    fParticipante_Cancelado, fBeneficiario,
    fRecebedor_Pensao_Alimenticia, fAlimentado, fTitular : Boolean;
    bAcessaDependente, bAchouLinhaVazia : boolean;
    pgAcessoDireto : string;
  end;

var
  FRMconspart: TFRMconspart;

  sidpessoaconspart, sidpessjurconspart, sidplanoprevconspart,
  sseqpropostaconspart, sdatabasename, sIDRGELEGBENEF, sIdTitular : String;
  iIdtitular : Integer;
  bRodandoElegibilidade, bFuncef : boolean;   // FDias - 12.12.2003
  TotalSaldo, TotSdoResCtrl, TotalSaldoReal, TotSdoResCtrlReal : Extended;       // FDias - 12.12.2003

  iIdCalculoGeral     : longInt ; // variavel criada para passar para a funcao RegraNumerica
  function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
  procedure TiraSQL( qry : TwwQuery);

implementation

uses UMensErro, UConsPart, FConsPessoaGeral, FTitulares, fAguarde;

{$R *.DFM}


procedure TfrmConsPart.bbtnSair2Click(Sender: TObject);
begin
  frmConsPart.close;
end;


procedure TfrmConsPart.FormShow(Sender: TObject);
begin
  bAcessaDependente := false;
  sdatabasename := 'BaseDados';
  CloseDatasets;
  if (nbkElegPart.ActivePage <> 'PgDadosPessoais') then
    nbkElegPart.ActivePage := 'PgDadosPessoais';
  NBKelegpartPageChanged(Self);
end;

procedure TfrmConsPart.dbgHstContFechadoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  With dtmConsPart do
  begin
    if (qryEventosPrev.State in [dsInactive]) or
       (qryHstContF.State in [dsInactive]) then
        exit;


    if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '0' then
    begin
       ABrush.Color := clMaroon;
       AFont.Color  := clWindow;
       if highlight then
       begin
         ABrush.Color := clMaroon;
         AFont.Color  := clWindow;
       end;
    end
    else
    if qryHstContF.FieldByName('FLGASSOCIADA').AsString = '1' then
    begin
      ABrush.Color := clTeal;
      AFont.Color  := clWindow;
      if highlight then
      begin
        ABrush.Color := clTeal;
        AFont.Color  := clWindow;
      end;
    end;
  end;
end;


procedure TfrmConsPart.bbtnProcurarClick(Sender: TObject);
begin
  dtmConsPart1.qryMessagemFiario.Close;
  twMensagem.Hide;
  pgAcessoDireto := '';
  fTitular := false;
  bAcessaDependente := false;
  FrmConsPessoaGeral := TFrmConsPessoaGeral.Create(frmConsPart);
  frmConsPessoaGeral.ModalResult := mrCancel;
  FrmConsPessoaGeral.ShowModal;
  if FrmConsPessoaGeral.ModalResult = mrOk then
  begin
    FRMconspart.Refresh;
    CloseDatasets;
    FRMconspart.Refresh;
    if nbkElegPart.ActivePage <> 'PgDadosPessoais' then
      NBKelegpart.ActivePage := 'PgDadosPessoais';
    NBKelegpartPageChanged(self);
  end;
end;


Procedure TfrmConsPart.AtualizaDadosRub;
begin
  With dtmConsPart Do
  begin
    With qryRUBpendentes Do
     begin
       if Active Then Close;
       if not Prepared then Prepare;
       ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
       ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
       ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
       Open;
     end;
    qryTipoDocRubPendentes.Close;
    qryTipoDocRubPendentes.Open;

    With QryRubs Do
     Begin
       if Active then Close;
       if Not Prepared then Prepare;
       DatabaseName := sdatabasename;
       ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
       Open;
     End;
    qryTipoDocXRub.Close;
    qryTipoDocXRub.Open;

    qryRubXBeneficio.Close;
    qryRubXBeneficio.Open;

    qryHistRubs.Close;
    qryHistRubs.Open;

  end;
end;

Procedure TfrmConsPart.AtualizaDadosPlano;
begin
  With dtmConsPart, dtmConsPart1 Do
  begin
    With qrycontribprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrycontrib Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qryContribuicoes Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
      Open;
    end;
    // FDias - 12.12.2003
    With qryParcelamento Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDPESSOA').AsFloat    := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
      Open;
    end;

    With qrybenef Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdTitular, -1);
      ParamByName('IDPESSOA').AsFloat    := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrypartprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
    // início - andre Tavares - 03/03/2004 - pendência 16131
    dtmConsPart1.qrypartprev.Filtered := false;
    dtmConsPart1.qrypartprev.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoorigem = '+sidplanoprevconspart;
    dtmConsPart1.qrypartprev.Filtered := true;
    // fim - andre Tavares - 03/03/2004 - pendência 16131

      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrypart Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qrypart.Filtered := false;
    dtmConsPart.qrypart.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoorigem = '+sidplanoprevconspart;
    dtmConsPart.qrypart.Filtered := true;
    // fim - andre Tavares - 03/03/2004 - pendência 16131
      ParamByName('SEQPROPOSTA').AsFloat := StrtoIntDef(sseqpropostaconspart, -1);
    end;

    With qryevent Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qryReserva Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qryHistReserva Do
    begin
      ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

  end;
end;

procedure TfrmConsPart.dbgridPrevFieldChanged(Sender: TObject; Field: TField);
begin
  AtualizaDadosPlano;
end;


procedure TfrmConsPart.dbgrVersoesRowChanged(Sender: TObject);
begin
  dtmConsPart1.qryHstVersoes.Close;
  dtmConsPart1.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart1.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart1.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart1.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart1.qryHstVersoes.Open;
end;

procedure TfrmConsPart.dbgridbeneficiosFieldChanged(Sender: TObject; Field: TField);
begin
  dtmConsPart.qryMovBenef.Close;
  dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart1.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
  dtmConsPart.qryMovBenef.Open;
end;

//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TfrmConsPart.TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

End;



//******************************************************************************
// Retorna tempo em extenso
Function TfrmConsPart.TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo, I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;

procedure TfrmConsPart.wwDBGrid3RowChanged(Sender: TObject);
begin
  dtmConsPart.qryhstEmprestimo.Close;
  dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsFloat :=
  dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
  dtmConsPart.qryhstEmprestimo.Open;
end;

procedure TfrmConsPart.wwDBGrid5CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  If Field.FieldName = 'FLGRECEBIDO' Then  ABrush.Color := $00C6FFFF;
end;

procedure TfrmConsPart.MostraBloqueio;
begin
  dtmConsPart.qryPessoaFisica.close;
  dtmConsPart.qryPessoaFisica.paramByName('IDPESSOA').asInteger := StrtoInt(sidpessoaconspart);
  dtmConsPart.qryPessoaFisica.open;
  lblBloqueio.Visible := dtmConsPart.qryPessoaFisicaFLGBLOQUEIO.asInteger = 1;
  dtmConsPart.qryPessoaFisica.close;
end;


procedure TfrmConsPart.dblkMesCobrancaChange(Sender: TObject);
var ssqlSemIdPessjur : string;
begin
  dtmConsPart.qryHstRubricas.Close;

  ssqlSemIdPessjur  :=  ' SELECT       '+#13#10+
    '              H.IDPESSOA,         '+#13#10+
    '              H.IDPESSJUR,        '+#13#10+
    '              H.IDMOTIVO,         '+#13#10+
    '              H.IDPATRO,          '+#13#10+
    '              H.MES,              '+#13#10+
    '              H.MESCOBRANCA,      '+#13#10+
    '              H.REFERENCIA,       '+#13#10+
    '              H.IDRUBRICA,        '+#13#10+
    '              H.CODPROVDESC,      '+#13#10+
    '              H.VALORPROVENTO,    '+#13#10+
    '              H.VALORINTEGRAL,    '+#13#10+
    '              SUMPROVDESC.SUMDESCONTO,'+#13#10+
    '              SUMPROVDESC.SUMPROVENTO,'+#13#10+
    '              SUMPROVDESC.SUMPROVENTO - SUMPROVDESC.SUMDESCONTO AS SUMLIQ,'+#13#10+
    '              H.FLGCOMPOESALPART, '+#13#10+
    '              H.FLGCOMPOESALBENEF,'+#13#10+
    '              H.FLGCOMPOEREMTOTAL,'+#13#10+
    '              H.FLGIRRF,          '+#13#10+
    '              H.SEQRUBRICA,       '+#13#10+
    '              C.DESCRICAO,        '+#13#10+
    '              DECODE(C.FLGDESCONTO, 0, ''PROVENTO'', 1, ''DESCONTO'', 2, ''ESPECIAL'') AS PROVENTODESC, '+#13#10+
    '              H.FLGSRB,           '+#13#10+
    '              DECODE(H.FLGSRB,  1, ''ATIVO OU MANTIDO TOTAL'','+#13#10+
    '                                2, ''AUX. DOENçA'',           '+#13#10+
    '                                3, ''INSS'',                  '+#13#10+
    '                                4, ''SAL. VIRTUAL'',          '+#13#10+
    '                                5, ''MANTIDO PARCIAL'',       '+#13#10+
    '                                0, ''OUTROS'') AS DESCFLGSRB  '+#13#10+
    ' FROM HISTRUBSAL H, PROVDESC C ,         '+#13#10+
//    '(SELECT SUM(DECODE(P1.FLGDESCONTO,1,VALORPROVENTO,0)) AS SUMDESCONTO, '+#13#10+   //Everson TIBERO
    '(SELECT SUM(DECODE(P1.FLGDESCONTO,1, H1.VALORPROVENTO,0)) AS SUMDESCONTO, '+#13#10+ //Everson TIBERO
//    '    SUM(DECODE(P1.FLGDESCONTO,0,VALORPROVENTO,0)) AS SUMPROVENTO '+#13#10+        //Everson TIBERO
    '    SUM(DECODE(P1.FLGDESCONTO,0, H1.VALORPROVENTO,0)) AS SUMPROVENTO '+#13#10+      //Everson TIBERO
    '    FROM HISTRUBSAL H1, PROVDESC P1 '+#13#10+
    '    WHERE (H1.IDPESSOA = :IDPESSOA)      AND '+#13#10+
{ inicio tavares 28/01/2003 pendência 11678 pega as rubricas de controle }
    ' ((H1.IDMODULO <> 18) OR ((H1.IDMODULO = 18) AND (H1.IDHSTFOLHABENEF IS NULL))) AND '+#13#10+
{ inicio tavares 28/01/2003 pendência 11678 }
    '          (H1.IDRUBRICA = P1.IDPROVENTO) AND '+#13#10+
    '          (P1.FLGDESCONTO <> 2)          AND '+#13#10+
    '          (H1.MESCOBRANCA = :MESCOBRANCA)) SUMPROVDESC '+#13#10+
    ' WHERE  (H.IDPESSOA = :IDPESSOA)        '+#13#10+
    ' AND    (H.IDRUBRICA = C.IDPROVENTO)    '+#13#10+
    ' AND    (H.MESCOBRANCA =  :MESCOBRANCA) '+#13#10+
{ inicio tavares 28/01/2003 pendência 11678 pega as rubricas de controle }
    ' AND ((H.IDMODULO <> 18) OR ((H.IDMODULO = 18) AND (H.IDHSTFOLHABENEF IS NULL))) '+#13#10+
{ inicio tavares 28/01/2003 pendência 11678 }
//    ' ORDER BY C.FLGDESCONTO, MES DESC , '+#13#10+ //Everson TIBERO
    ' ORDER BY C.FLGDESCONTO, H.MES DESC , '+#13#10+ //Everson TIBERO
//    ' CODPROVDESC        '; //Everson TIBERO
    ' H.CODPROVDESC        '; //Everson TIBERO

  if dtmConsPart.qryHstRubricas.Active then
    dtmConsPart.qryHstRubricas.Close;

  dtmConsPart.qryHstRubricas.sql.Text := ssqlSemIdPessjur;

  if (dblkMesCobranca.Text <> '') and (dblkMesCobranca.LookupValue <> '') then
  begin
    if not dtmConsPart.qryHstRubricas.Prepared then dtmConsPart.qryHstRubricas.Prepare;
    dtmConsPart.qryHstRubricas.ParamByName('idPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryHstRubricas.ParamByName('MesCobranca').asString := dtmConsPart.qryMesRubricaMesCobranca.asString;
    dtmConsPart.qryHstRubricas.Open;
  end
end;

procedure TfrmConsPart.TbshHstRubricasShow(Sender: TObject);
begin
  dtmConsPart.qryHstRubricas.Close;
end;

procedure TfrmConsPart.RodaRegraElegibilidade;
var bElegivel, bErro : boolean;
    sSQL, sMsgErro : string;
begin
  // Rodar regra de elegibilidade de cada um dos dependentes
  bRodandoElegibilidade := True;
  dtmConsPart.qryDepentit.First;
  while not dtmConsPart.qryDepentit.Eof do
  begin
    sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+
            '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,                 '+
            '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,       '+
            '         EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, EL.DATADEMISSAO,              '+
            '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
            '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO,      '+
            '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
            '         PP.IDPESSJUR,  PP.IDPLANOPREV, PP.INSCRICAODATA,SP.FLGINTERNO,      '+
            '         D.FLGDESIGNADO, DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,   '+
            '''' +DateToStr(date)+ ''' AS DATAREF, PF.NUMDEPIRRF '+
            ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
            '       PARTPREVPLAN PP, SITPART SP, DEPENDENTE D '+
            ' WHERE PP.IDPESSOA    = ' + sidpessoaconspart + ' AND '+
            '       PP.SEQPROPOSTA = ' + sseqpropostaconspart + ' AND '+
            '       PP.IDPLANOPREV = ' + sidplanoprevconspart + ' AND '+
            '       PP.IDPESSJUR   = ' + sidpessjurconspart + ' AND '+
            '       DE.IDPESSOA    = ' + dtmConsPart.qryDepentit.FieldByName('IDPESSOA').AsString + ' AND '+
            '       DE.IDPESSOA    = D.IDPESSOA AND '+
            '       EL.IDPESSOA    = PP.IDPESSOA  AND '+
            '       EL.IDPESSJUR   = PP.IDPESSJUR AND '+
            '       SP.IDSITPART   = PP.IDSITPART AND '+
            '       DE.IDTITULAR   = EL.IDPESSOA  AND '+
            '       DE.IDPESSOA    = PF.IDPESSOA(+) ';

    bElegivel := RegraBooleana(sIDRGELEGBENEF, sSQL , bErro);

    dtmConsPart.qryDepentit.Edit;
    if bElegivel
    then dtmConsPart.qryDepentit.FieldByName('FLGELEGIVEL').AsInteger := 1
    else dtmConsPart.qryDepentit.FieldByName('FLGELEGIVEL').AsInteger := 0;
    dtmConsPart.qryDepentit.Post;
    dtmConsPart.qryDepentit.Next;
  end;
  bRodandoElegibilidade := False;
end;


{ FUNCOES RELACIONADAS AO SISTEMA DE  REGRA DE NEGOCIO }
function RegraBooleana(sNumRegra,sSQL : string;var bErro : boolean) : boolean;
var sResult : string;
    cAux    : char;
begin
   Result := True;
   bErro  := False;

   if Trim(sNumRegra) = '' then Exit;
   iIdCalculoGeral := 0;

   Result := False;
   with dtmConsPart do
   begin
      regraAPrev.RuleName := sNumRegra;
      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
      if qryRegra.IsEmpty
      then begin
         qryRegra.Close;
         tirasql(qryRegra);
         Exit;
      end;
      cAux := DecimalSeparator;
      regraAPrev.QueryIn := dtmConsPart.qryRegra;
      try
         regraAPrev.Execute;
      finally
         DecimalSeparator := cAux;
         iIdCalculoGeral := 0;
      end;
      if not regraAPrev.Error
      then begin
         sResult     := Trim(UpperCase(regraAPrev.Result));
         if sResult  = 'FALSE'
         then Result := False
         else Result := True;
      end // if not regra.error
      else bErro     := True;
      qryRegra.Close;
   end;
end;

procedure TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;



procedure TFRMconspart.DadosPessoaisClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgDadosPessoais';
end;

procedure TFRMconspart.DocumentosClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgDocumentos'
end;

procedure TFRMconspart.NBKelegpartPageChanged(Sender: TObject);
var i : integer;
    sttipotel : string;
    DtAux : TDateTime;
begin
  if (not fTitular) and (not bAcessaDependente) then
  begin
       if FConsPessoaGeral.cIdpessoa <> '' then
       begin
            sidpessoaconspart := FConsPessoaGeral.cIdpessoa;
            iIdTitular        := strToIntDef(FConsPessoaGeral.cIdTitular, -1);
// início - André Tavares - pendência 15518
            sIdTitular        := FConsPessoaGeral.cIdTitular;
// fim - André Tavares - pendência 15518
       end;
  end;
  if sidpessoaConsPart = '' then
    sidPessoaConsPart := '-1';

  if trim(sIdTitular) <> '' then
    dtmConsPart.qryPlanos.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdTitular, -1)
  else
    dtmConsPart.qryPlanos.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConsPart, -1);

  if not dtmConsPart.qryPlanos.Active then dtmConsPart.qryPlanos.Open;
  DblkPlanos.LookupValue := dtmConsPart.qryPlanos.fieldByName('IDPLANOPREV').asString;

  //início - andré tavares - 04/10/2004 - pendência 17503
  if (trim(sIdTitular) <> trim(sIdpessoaConsPart)) and not (dtmConsPart1.qryPlanoBenefciario.active) then
  begin
    dtmConsPart1.qryPlanoBenefciario.ParamByName('IDTITULAR').asFloat := StrtoIntDef(sIdTitular, -1);
    dtmConsPart1.qryPlanoBenefciario.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sIdPessoaConsPart, -1);
    dtmConsPart1.qryPlanoBenefciario.Open;
    DblkPlanos.Enabled := true;
    if not dtmConsPart1.qryPlanoBenefciario.IsEmpty then
      DblkPlanos.text := dtmConsPart1.qryPlanoBenefciario.FieldByName('NOME').asString;
    DblkPlanos.Enabled := false;
  end;
  if (trim(sIdTitular) = trim(sIdpessoaConsPart)) then
    DblkPlanos.Enabled := dtmConsPart.qryPlanos.RecordCount > 1;
  //fim - andré tavares - 04/10/2004 - pendência 17503


  dbedDataCanc.readOnly := false;
  dbedDataCanc.Text     := dtmConsPart.qryPlanos.fieldByName('DATACANCELAMENTO').asString;
  dbedDataCanc.readOnly := true;

  //início - andré tavares - 26/10/2004 - pendência 17825
  dtmConsPart1.qryDadosTitular.Close;
  dtmConsPart1.qryDadosTitular.ParamByName('IDTITULAR').asInteger := strToIntDef(sIdTitular, -1);
  dtmConsPart1.qryDadosTitular.Open;
  //fim - andré tavares - 26/10/2004 - pendência    17825


  if NBKelegpart.ActivePage = 'PgDadosPessoais' then
  begin
    HabilitaMenuItens;
    MostraBloqueio;
    edtMatricula.Text := GetMatricula;
//busca um participante ou dependente
    if (not dtmConsPart.qrypartgeral.Active) and
       (not dtmConsPart.qryDependente.Active) and
       (not dtmConsPart.qryRespNaoElegivel.Active) and
       (not dtmConsPart.qryRecebedorPensaoAlim.Active) then
    begin
      frmAguarde.Min := 0;
      frmaguarde.Max := 2;
      frmAguarde.Mostra('Buscando Dados da Pessoa Selecionada ...');
      frmAguarde.Pos := 1;
      frmAguarde.Repaint;

      // tavares 22/11/2002
      sidplanoprevconspart := intToStr(strToIntDef(dtmConsPart.qryPlanos.fieldByName('IDPLANOPREV').asString, -1));
      sidpessjurconspart   := intToStr(strToIntDef(dtmConsPart.qryPlanos.fieldByName('IDPESSJUR').asString, -1));
      sidplanoprevconspart := intToStr(strToIntDef(dtmConsPart.qryPlanos.fieldByName('IDPLANOPREV').asString, -1));
      sseqpropostaconspart := intToStr(strToIntDef(dtmConsPart.qryPlanos.fieldByName('SEQPROPOSTA').asString, -1));
      sIDRGELEGBENEF       := dtmConsPart.qryPlanos.fieldByName('IDRGELEGBENEF').asString;


      dtmConsPart.DsPartGeral.dataSet.Close;
      if Not dtmConsPart.qrypartgeral.Active and (trim(sIdTitular) = trim(sidpessoaConsPart)) then
      begin
           dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qrypartgeral;
           dtmConsPart.qrypartgeral.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
           if dtmConsPart.qrypartgeral.Prepared then dtmConsPart.qrypartgeral.unPrepare;
           dtmConsPart.qrypartgeral.Prepare;
           dtmConsPart.qrypartgeral.Open;
           if not dtmConsPart.qrypartgeral.IsEmpty then
           begin             // FDias - 11.12.2003
                dtmConsPart.qryRecebDadosPessoais.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
                dtmConsPart.qryRecebDadosPessoais.ParamByName('IDDOCUMENTO').AsFloat := 11; // somente para Funcef
                dtmConsPart.qryRecebDadosPessoais.Prepare;
                dtmConsPart.qryRecebDadosPessoais.Open;
                if not dtmConsPart.qryRecebDadosPessoais.IsEmpty then
                begin
                          lblNomeRecebDadosPessoais.Visible      := True;
                          lblCPFRecebDadosPessoais.Visible       := True;
                          lblRGRecebDadosPessoais.Visible        := True;
                          lblExpedicaoRecebDadosPessoais.Visible := True;
                          lblUFRecebDadosPessoais.Visible        := True;
                          dbedNomeRecebDadosPessoais.Visible     := True;
                          dbedCPFRecebDadosPessoais.Visible      := True;
                          dbedRGRecebDadosPessoais.Visible       := True;
                          dbedExpedicaoRecebDadosPessoais.Visible:= True;
                          dbedUFRecebDadosPessoais.Visible       := True;
                     end
                     else Begin
                          lblNomeRecebDadosPessoais.Visible      := False;
                          lblCPFRecebDadosPessoais.Visible       := False;
                          lblRGRecebDadosPessoais.Visible        := False;
                          lblExpedicaoRecebDadosPessoais.Visible := False;
                          lblUFRecebDadosPessoais.Visible        := False;
                          dbedNomeRecebDadosPessoais.Visible     := False;
                          dbedCPFRecebDadosPessoais.Visible      := False;
                          dbedRGRecebDadosPessoais.Visible       := False;
                          dbedExpedicaoRecebDadosPessoais.Visible:= False;
                          dbedUFRecebDadosPessoais.Visible       := False;
                end;
                frmAguarde.Next;
                frmAguarde.Repaint;
           end;
      end;
// 18/09/2003 - André Tavares - pendência - 15055 -
      if (not (dtmConsPart.qrypartgeral.active)) or ((dtmConsPart.qrypartgeral.isEmpty) and (dtmConsPart.qrypartgeral.active)) then
      begin
           if Not dtmConsPart.qryDependente.Active then
           begin
                dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qryDependente;
                dtmConsPart.qryDependente.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
                if not dtmConsPart.qryDependente.Prepared then dtmConsPart.qryDependente.unPrepare;
                dtmConsPart.qryDependente.Prepare;
                dtmConsPart.qryDependente.Open;
                if not dtmConsPart.qryDependente.IsEmpty then
                begin      //Fdias - Funcef - 11.12.2003
                     dtmConsPart.qryRecebDadosPessoais.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
                     dtmConsPart.qryRecebDadosPessoais.ParamByName('IDDOCUMENTO').AsFloat := 11; // somente para Funcef
                     dtmConsPart.qryRecebDadosPessoais.Prepare;
                     dtmConsPart.qryRecebDadosPessoais.Open;
                     if not dtmConsPart.qryRecebDadosPessoais.IsEmpty then
                     begin
                          lblNomeRecebDadosPessoais.Visible      := True;
                          lblCPFRecebDadosPessoais.Visible       := True;
                          lblRGRecebDadosPessoais.Visible        := True;
                          lblExpedicaoRecebDadosPessoais.Visible := True;
                          lblUFRecebDadosPessoais.Visible        := True;
                          dbedNomeRecebDadosPessoais.Visible     := True;
                          dbedCPFRecebDadosPessoais.Visible      := True;
                          dbedRGRecebDadosPessoais.Visible       := True;
                          dbedExpedicaoRecebDadosPessoais.Visible:= True;
                          dbedUFRecebDadosPessoais.Visible       := True;
                     end
                     else Begin
                          lblNomeRecebDadosPessoais.Visible      := False;
                          lblCPFRecebDadosPessoais.Visible       := False;
                          lblRGRecebDadosPessoais.Visible        := False;
                          lblExpedicaoRecebDadosPessoais.Visible := False;
                          lblUFRecebDadosPessoais.Visible        := False;
                          dbedNomeRecebDadosPessoais.Visible     := False;
                          dbedCPFRecebDadosPessoais.Visible      := False;
                          dbedRGRecebDadosPessoais.Visible       := False;
                          dbedExpedicaoRecebDadosPessoais.Visible:= False;
                          dbedUFRecebDadosPessoais.Visible       := False;

                     end;

                     frmAguarde.Next;
                     frmAguarde.Repaint;
                end;
           end;
      end;

      //se não é um participante ou dependente  - (só pode ser um recebedor ou um responsável)
// 18/09/2003 - André Tavares - pendência - 15055 -
      if  (not (dtmConsPart.qrypartgeral.active)) and ((dtmConsPart.qryDependente.isEmpty) and  (dtmConsPart.qryDependente.active)) then
      begin
      //busca um reponsável não elegível
           if Not dtmConsPart.qryRespNaoElegivel.Active then
           begin
               dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qryRespNaoElegivel;
               dtmConsPart.qryRespNaoElegivel.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
               if not dtmConsPart.qryRespNaoElegivel.Prepared then dtmConsPart.qryRespNaoElegivel.unPrepare;
               dtmConsPart.qryRespNaoElegivel.Prepare;
               dtmConsPart.qryRespNaoElegivel.Open;
               if not dtmConsPart.qryRespNaoElegivel.IsEmpty then
               begin
                   frmAguarde.Next;
                   frmAguarde.Repaint;
               end;
           end;
      end;

// 18/09/2003 - André Tavares - pendência - 15055 -
      if (not (dtmConsPart.qrypartgeral.active)) and ((dtmConsPart.qryRespNaoElegivel.isEmpty) and  (dtmConsPart.qryRespNaoElegivel.active)) then
      begin
      //busca um recebedor de Pensao Alimentícia
          if not dtmConsPart.qryRecebedorPensaoAlim.Active then
          begin
              if not dtmConsPart.qryRecebedorPensaoAlim.Prepared then
                 dtmConsPart.qryRecebedorPensaoAlim.Prepare;
              dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qryRecebedorPensaoAlim;
              dtmConsPart.qryRecebedorPensaoAlim.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
              dtmConsPart.qryRecebedorPensaoAlim.Open;
              if not dtmConsPart.qryRecebedorPensaoAlim.IsEmpty then
              begin
                   frmAguarde.Next;
                   frmAguarde.Repaint;
              end;
          end;
      end;

// 18/09/2003 - André Tavares - pendência - 15055 -
      if ((dtmConsPart.qrypartgeral.isempty = true)) and ((dtmConsPart.qryRecebedorPensaoAlim.isEmpty = true) or  (dtmConsPart.qryRecebedorPensaoAlim.isEmpty = true)) then
      begin
      // busca dados da pessoa que é somente elegível
           if not dtmConsPart.qrySoElegivel.Active then
           begin
                if not dtmConsPart.qrySoElegivel.Prepared then
                   dtmConsPart.qrySoElegivel.Prepare;
                dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qrySoElegivel;
                dtmConsPart.qrySoElegivel.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
                dtmConsPart.qrySoElegivel.Open;
                if not dtmConsPart.qrySoElegivel.IsEmpty then
                begin
                    frmAguarde.Next;
                    frmAguarde.Repaint;
                end;
           end;
      end;

      frmAguarde.Apaga;

      //início - andre tavares - pendência 17477 - 05/10/2004
      if not dtmConsPart1.qryMessagemFiario.Active then
      begin
        dtmConsPart1.qryMessagemFiario.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sIdPessoaConsPart, -1);
        dtmConsPart1.qryMessagemFiario.ParamByName('IDTITULAR').asFloat := StrtoIntDef(sIdTitular, -1);
        dtmConsPart1.qryMessagemFiario.Open;
        if not dtmConsPart1.qryMessagemFiario.isEmpty then
        begin
          reditMSG.text := dtmConsPart1.qryMessagemFiario.fieldByName('DESCRICAO').asString;
          twMensagem.Visible := true;
        end;
      end;
      //fim - andre tavares - pendência 17477 - 05/10/2004


      // faz o cálculo da Idade da Pessoa
      DbedIdade.Text := '';
      if (not dtmConsPart.DsPartGeral.dataSet.fieldByName('DATANASC').isNull) and
         (dtmConsPart.DsPartGeral.dataSet.fieldByName('DATAMORTE').isNull) then
           DbedIdade.Text := IntToStr(Trunc((date - dtmConsPart.DsPartGeral.dataSet.fieldByName('DATANASC').asDateTime)/365))
       else
           DbedIdade.Text := IntToStr(Trunc((dtmConsPart.DsPartGeral.dataSet.fieldByName('DATAMORTE').asDateTime - dtmConsPart.DsPartGeral.dataSet.fieldByName('DATANASC').asDateTime)/365));

      // põe o número de elegíveis a benefício
      dbedNumElegBenef.Text := intToStr(ContaElegiveisAbeneficio);
    end; //fim primeiro if

    //André Tavares - 27/11/2003 - pendência 15543

    dtAux := BuscaDtEntrada(strToInt(sIdTitular), strToIntDef(sIdPessjurConsPart, -1),
                            dtmConsPart.qryPlanos.fieldByName('IDPLANOPREV').asInteger);
    if dtAux > 0 then
      dbEdDtEntrada.text := FormatDateTime('dd/mm/yyyy', dtAux)
    else
      dbEdDtEntrada.text := '';

    if trim(pgAcessoDireto) <> '' then  NBKelegpart.ActivePage := pgAcessoDireto;

  end
  else if NBKelegpart.ActivePage = 'PgDocumentos' then
  begin
    if not dtmConsPart1.qryDocTitular.prepared then dtmConsPart1.qryDocTitular.Prepare;
    dtmConsPart1.qryDocTitular.ParamByName('IDPESSOA').asFloat := strToIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qryDocTitular.Open;
  end

  else if NBKelegpart.ActivePage = 'PgEnderecos' then
  begin
    if dtmConsPart1.qryendereco.Active Then dtmConsPart1.qryendereco.Close;
    if not dtmConsPart1.qryendereco.Prepared then dtmConsPart1.qryendereco.Prepare;
    dtmConsPart1.qryendereco.DatabaseName := sdatabasename;
    dtmConsPart1.qryendereco.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qryendereco.Open;
  end
  // FERNANDO - PENDENCIA 14475 - INICIO
  else if NBKelegpart.ActivePage = 'pgAcaoJudicial' then
  begin
    if dtmConsPart.qryAcaoJudicial.Active Then dtmConsPart.qryAcaoJudicial.Close;
    if not dtmConsPart.qryAcaoJudicial.Prepared then dtmConsPart.qryAcaoJudicial.Prepare;
    dtmConsPart.qryAcaoJudicial.DatabaseName := sdatabasename;
    dtmConsPart.qryAcaoJudicial.ParamByName('IIDPESSOA').AsInteger := StrtoInt(sidpessoaconspart);
    dtmConsPart.qryAcaoJudicial.Open;
    If dtmConsPart.qryAcaoJudicial.IsEmpty Then
    Begin
         dtmConsPart.qryCompensaIR.Close;
         dtmConsPart.qryCompensaIR.ParamByName('IDPESSOA').AsInteger := StrtoInt(sidpessoaconspart);
         dtmConsPart.qryCompensaIR.Open;
         If dtmConsPart.qryCompensaIR.IsEmpty Then
            cbxFazdeposito.visible := true
         Else
         Begin
              pnlCompensacao.BringToFront;
              cmbTipoOAcao.ItemIndex := 2;
              cbMesInicio.ItemIndex  := (StrToIntDef(Copy(dtmConspart.qryCompensair.FieldByName('ANOMESINICIO').AsString,6,2), -1)-1);
              speAnoInicio.Text      := Copy(dtmConspart.qryCompensair.FieldByName('ANOMESINICIO').AsString,1,4);
              cbMesFim.ItemIndex     := (StrToIntDef(Copy(dtmConspart.qryCompensair.FieldByName('ANOMESFIM').AsString,6,2), -1)-1);
              speAnoFinal.Text       := Copy(dtmConspart.qryCompensair.FieldByName('ANOMESFIM').AsString,1,4);
              redCompTotal.Text      := FormatFloat('#,##0.00',dtmConspart.qryCompensair.FieldByName('COMPTOTAL').AsFloat);
              redSaldo.Text          := FormatFloat('#,##0.00',dtmConspart.qryCompensair.FieldByName('SALDOCOMP').AsFloat);
              edtNumproccomp.text    := dtmConspart.qryCompensair.Fieldbyname('NUMEROPROCESSO').asString;
              edtcodvaracomp.text    := dtmConspart.qryCompensair.Fieldbyname('CODVARA').asstring;
              edtNomeVaracomp.text   := dtmConspart.qryCompensair.Fieldbyname('NOMEVARA').asstring;
              pnlsaldo.caption       := FormatFloat('#,##0.00',(dtmConspart.qryCompensair.FieldByName('COMPTOTAL').AsFloat-dtmConspart.qryCompensair.FieldByName('SALDOCOMP').AsFloat));
         End;
         cbxFazdeposito.visible    := false;
         cmbTipooacao.enabled      := false;
         cbMesInicio.enabled       := false;
         speAnoInicio.readonly     := true;
         speAnoFinal.readonly      := true;
         cbMesFim.enabled          := false;
         redCompTotal.readonly     := true;
         redSaldo.readonly         := true;
         edtNumproccomp.readonly   := true;
         edtcodvaracomp.readonly   := true;
         edtNomeVaracomp.readonly  := true;
         pnlsaldo.enabled          := false;
    End
    Else
    Begin
         pnlRestoMestre.BringToFront;
         cmbTipoOAcao.ItemIndex    := dtmConsPart.qryAcaoJudicial.FieldByName('TIPOACAO').AsInteger;
         cmbTipoOAcao.enabled      := false;
         cmbOperacao.ItemIndex     := StrToIntDef(dtmConsPart.qryAcaoJudicial.FieldByName('CODOPERACAO').AsString,-1);
         cmbOperacao.enabled       := false;
         cmbTipoOAcao.ItemIndex    := StrToIntDef(dtmConsPart.qryAcaoJudicial.FieldByName('TIPOACAO').AsString,-1);
         cmbTipoOAcao.enabled      := false;
         edCodVara.Text            := dtmConsPart.qryAcaoJudicial.FieldByName('CODVARA').AsString;
         edCodVara.readonly        := true;
         edNomeVara.Text           := dtmConsPart.qryAcaoJudicial.FieldByName('NOMEVARA').AsString;
         edNomeVara.readonly       := true;
         edCodSecao.Text           := dtmConsPart.qryAcaoJudicial.FieldByName('CODSECAO').AsString;
         edCodSecao.readonly       := true;
         edNomesecao.Text          := dtmConsPart.qryAcaoJudicial.FieldByName('NOMESECAO').AsString;
         edNomesecao.readonly      := true;
         edAutorAcao.Text          := dtmConsPart.qryAcaoJudicial.FieldByName('AUTORACAO').AsString;
         edAutorAcao.readonly      := true;
         cmbStatusAcao.ItemIndex   := dtmConsPart.qryAcaoJudicial.FieldByName('SITPROCESSO').AsInteger;
         cmbStatusAcao.enabled     := false;
         If cmbTipoOacao.ItemIndex  = 1 then
         begin
              gbxPercentual.Visible := true;
              redPercAcao.Text:= FormatFloat('#,##0.00',dtmConsPart.qryAcaoJudicial.FieldByName('PERCACAO').AsFloat);
         end else
         begin
              gbxPercentual.Visible := false;
              redPercAcao.Text:= '';
         end;
         redPercAcao.readonly := true;
         dtmConsPart.QryDetalheRegra.Close;
         dtmConsPart.QryDetalheRegra.parambyname('IDPROCJUD').asInteger := dtmConsPart.qryAcaoJudicial.Fieldbyname('IDPROCJUD').asInteger;
         dtmConsPart.QryDetalheRegra.parambyname('IDPESSOA').asInteger  := dtmConsPart.qryAcaoJudicial.Fieldbyname('IDPESSOA').asInteger;
         dtmConsPart.QryDetalheRegra.Open;
    End;
  end

  else if NBKelegpart.ActivePage = 'OutrasInformacoes' then
  begin
    // início - André Tavares - 20/01/2004 - pendência 15928
    dtmConsPart1.qryOutrasInforms.Close;
    dtmConsPart1.qryOutrasInforms.ParamByName('IDPESSOA').Value := strToInt(sidpessoaconspart);
    dtmConsPart1.qryOutrasInforms.Open;
    // fim - André Tavares - 20/01/2004 - pendência 15928

  end

  // FERNANDO - PENDENCIA 14475 - FIM
  else if NBKelegpart.ActivePage = 'PgEventosPrevidenciarios' then
  begin
    if dtmConsPart.qryEventosPrev.Active Then dtmConsPart.qryEventosPrev.Close;
    if not dtmConsPart.qryEventosPrev.Prepared then dtmConsPart.qryEventosPrev.Prepare;
    dtmConsPart.qryEventosPrev.DatabaseName := sdatabasename;
    dtmConsPart.qryEventosPrev.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryEventosPrev.Active then dtmConsPart.qryEventosPrev.Open;
    if not dtmConsPart.qryHstContF.Active then
    begin
     if not dtmConsPart.qryHstContF.Prepared then dtmConsPart.qryHstContF.Prepare;
     dtmConsPart.qryHstContF.DatabaseName := sdatabasename;
     dtmConsPart.qryHstContF.ParamByName('IdEventosPrev').AsString := dtmConsPart.qryEventosPrev.FieldByName('IDEVENTOSPREV').AsString;
     dtmConsPart.qryHstContF.Open;
    end;
  end

  else if NBKelegpart.ActivePage = 'PgEventosAssistenciais' then
  begin
    if not dtmConsPart.qryevent.Prepared then dtmConsPart.qryevent.Prepare;
    dtmConsPart.qryevent.DatabaseName := sdatabasename;
    dtmConsPart.qryevent.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryevent.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryevent.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryevent.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    // início - andre Tavres - 26/02/2004 - pendência 16122
    dtmConsPart.qryEvent.Filtered := false;
    dtmConsPart.qryEvent.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qryEvent.Filtered := true;
    // fim - andre Tavres - 26/02/2004 - pendência 16122

    if not dtmConsPart.qryevent.Active Then dtmConsPart.qryevent.Open;
  end

  else if NBKelegpart.ActivePage = 'PgHistoricoFuncional' then
  begin

    Ds.DataSet := cmCds;
    cmCds.Close;
    cmCds.Data := CtrlTempoServico.CalculaTempos(StrtoInt(sidpessoaconspart), Date);
  end
  else if NBKelegpart.ActivePage = 'PgDadosBasicos' then
  begin
    if not dtmConsPart.qryValoresBaseDepentit.prepared then dtmConsPart.qryValoresBaseDepentit.Prepare;
    dtmConsPart.qryValoresBaseDepentit.ParamByName('IDPESSOA').asInteger  := StrtoIntDef(sidpessoaconspart, -1);
    // início - André Tavares - pendência 15616
    dtmConsPart.qryValoresBaseDepentit.ParamByName('IDTITULAR').asInteger := StrtoIntDef(sidtitular, -1);
    // fim - André Tavares - pendência 15616
    if not dtmConsPart.qryValoresBaseDepentit.Active then dtmConsPart.qryValoresBaseDepentit.Open;
// início André Tavares 09/11/2003 - resolução da pendência 14471
    dtmConsPart.qryRunTime.Sql.text := ' SELECT IDDEPENDENCIA FROM VWPARTICIPDEPEN WHERE IDDEPENDENCIA = ''PRP'' AND IDPESSOA = '+ sidpessoaconspart;
    dtmConsPart.qryRunTime.Open;
    if dtmConsPart.qryRunTime.isEmpty then
    begin
      dtmConsPart.qryRunTime.Close;
      dtmConsPart.qryRunTime.Sql.text := ' SELECT IDDEPENDENCIA FROM VWPARTICIPDEPEN WHERE IDDEPENDENCIA <> ''PRP'' AND IDPESSOA = '+ sidpessoaconspart;
      dtmConsPart.qryRunTime.Open;
    end;
    PanelDadosFuncionais.Visible := fTitular;
// fim André Tavares 09/11/2003 - resolução da pendência 14471

    if not dtmConsPart.qryDataInicioInss.prepared then dtmConsPart.qryDataInicioInss.Prepare;
    dtmConsPart.qryDataInicioInss.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryDataInicioInss.Active then dtmConsPart.qryDataInicioInss.Open;

    if not dtmConsPart.qryTelefoneComercial.prepared then dtmConsPart.qryTelefoneComercial.Prepare;
    dtmConsPart.qryTelefoneComercial.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryTelefoneComercial.Active then dtmConsPart.qryTelefoneComercial.Open;
  end

  else if NBKelegpart.ActivePage = 'PgTelefones' then
  begin
    if not dtmConsPart.qryTelefones.prepared then dtmConsPart.qryTelefones.Prepare;
    dtmConsPart.qryTelefones.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryTelefones.Active then dtmConsPart.qryTelefones.Open;
    // inicio tavares 28/01/2003  resolução da pendencia 11695
    dtmConsPart.qryTelefones.First;
    sttipotel := '';
    while not dtmConsPart.qryTelefones.eof do
    begin
      dtmConsPart.qryTelefones.edit;
      sttipotel := dtmConsPart.qryTelefonesTIPO.asString;
      for i := 1 to length(sttipotel) do
      begin
        if upCase(sttipotel[i]) = 'C' then
          dtmConsPart.qryTelefonesFLGCOM.asString := '1'
        else if upCase(sttipotel[i]) = 'P' then
          dtmConsPart.qryTelefonesFLPART.asString := '1'
        else if upCase(sttipotel[i]) = 'L' then
          dtmConsPart.qryTelefonesFLGCEL.asString := '1'
        else if upCase(sttipotel[i]) = 'F' then
          dtmConsPart.qryTelefonesFLGFAX.asString := '1'
        else if upCase(sttipotel[i]) = 'M' then
          dtmConsPart.qryTelefonesFLGMODEM.asString := '1'
        else if upCase(sttipotel[i]) = 'R' then
          dtmConsPart.qryTelefonesFLGREC.asString := '1';
      end;
      dtmConsPart.qryTelefones.Post;
      dtmConsPart.qryTelefones.next;
    end;
    // Fim tavares 28/01/2003  resolução da pendencia 11695
  end

  else if NBKelegpart.ActivePage = 'PgContasBancarias' then
  begin
    if not dtmConsPart1.qryContaCorrente.prepared then dtmConsPart1.qryContaCorrente.Prepare;
    dtmConsPart1.qryContaCorrente.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart1.qryContaCorrente.Active then dtmConsPart1.qryContaCorrente.Open;
  end

  else if NBKelegpart.ActivePage = 'PgDependentes' then
  begin
    if not dtmConsPart.qryDepenTit.Prepared then dtmConsPart.qryDepenTit.Prepare;
    dtmConsPart.qryDepenTit.ParamByName('IDTITULAR').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryDepenTit.Active then dtmConsPart.qryDepenTit.Open;
    if not dtmconsPart.qryDepentit.IsEmpty then
      RodaRegraElegibilidade;
    // início - André Tavares - 20/01/2004 - pendência 15928
    dtmConsPart.qryDepenTit.first;
    // fim - André Tavares - 20/01/2004 - pendência 15928

  end

  else if NBKelegpart.ActivePage = 'PgEmprestimos' then
  begin
    if not dtmConsPart.qryEmprestimos.Prepared then dtmConsPart.qryEmprestimos.Prepare;
    dtmConsPart.qryEmprestimos.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryEmprestimos.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sIdTitular, -1);

    // início - andre Tavares - 03/03/2004 - pendência 16131
    dtmConsPart.qryEmprestimos.Filtered := false;
    dtmConsPart.qryEmprestimos.Filter := ' idpatro = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qryEmprestimos.Filtered := true;
    // fim - andre Tavares - 03/03/2004 - pendência 16131

    if not dtmConsPart.qryEmprestimos.Active then dtmConsPart.qryEmprestimos.Open;

    dtmConsPart.qryhstEmprestimo.Close;
    dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsFloat :=
    dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
    dtmConsPart.qryhstEmprestimo.Open;
  end
  else if NBKelegpart.ActivePage = 'PgProtocolos' then
  begin
    if not dtmConsPart.qryFiario.Prepared then dtmConsPart.qryFiario.Prepare;
    dtmConsPart.qryFiario.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryFiario.Active then dtmConsPart.qryFiario.Open;
  end

  else if NBKelegpart.ActivePage = 'PgProcessosRAD' then
  begin
    if not dtmConsPart.qryprocesso.Prepared then dtmConsPart.qryprocesso.Prepare;
    dtmConsPart.qryprocesso.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryprocesso.Active Then dtmConsPart.qryprocesso.Open;
  end

  else if NBKelegpart.ActivePage = 'PgContribuicoesReservaSaldo' then
  begin
    if not dtmConsPart.qryReserva.Prepared then dtmConsPart.qryReserva.Prepare;
    dtmConsPart.qryReserva.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryReserva.ParamByName('IDPESSJUR').AsFloat   := StrtoIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryReserva.ParamByName('IDPLANOPREV').AsFloat := StrtoIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryReserva.ParamByName('SEQPROPOSTA').AsFloat := StrtoIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qryReserva.Active Then dtmConsPart.qryReserva.Open;

    TotalSaldo := 0;
    TotSdoResCtrl := 0;
    lblSaldosReserva.Caption := 'Saldo de Res. do Participante: R$ ';
    LblSaldoResControle.Caption := 'Saldo de Res. de Controle: R$ ';
    dtmConsPart.qryReserva.DisableControls;
    dtmConsPart.qryReserva.first;
    while not dtmConsPart.qryReserva.Eof do
    begin
      if (dtmConsPart.qryReservaFLGCOLETIVA.asInteger = 0) or
         (dtmConsPart.qryReservaFLGCOLETIVA.isnull) then
      begin
        if dtmConsPart.qryReservaFLGCONTROLE.asInteger = 0 then
          TotalSaldo := TotalSaldo + dtmConsPart.qryReservaVLRATUAL.asFloat
        else
        begin
          if (dtmConsPart.qryReservaFLGTITULARCOLET.asString   = 'T') then
          begin
            if dtmConsPart.qryReservaCOTVALOR.isnull then
              TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.qryReservaVALORRESERVA.asFloat
            else
              TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.qryReservaVLRATUAL.asFloat;
          end;
        end;
      end;
  { Fim - Tavares 18/07/2003 - resolução da pendência 13971}
      dtmConsPart.qryReserva.Next;
    end;
    dtmConsPart.qryReserva.first;
    dtmConsPart.qryReserva.EnableControls;
    lblSaldosReserva.Caption := lblSaldosReserva.Caption + FormatFloat('#,##0.00', TotalSaldo);
    LblSaldoResControle.Caption := LblSaldoResControle.Caption + FormatFloat('#,##0.00', TotSdoResCtrl);
  end

  else if NBKelegpart.ActivePage = 'Parcelamento' then        //FDias - 12.12.2003
  begin
    if dtmConsPart1.qryParcelamento.Active Then dtmConsPart1.qryParcelamento.Close;
    if not dtmConsPart1.qryParcelamento.Prepared then dtmConsPart1.qryParcelamento.Prepare;
    dtmConsPart1.qryParcelamento.DatabaseName := sdatabasename;
    dtmConsPart1.qryParcelamento.ParamByName('IDPESSOA').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qryParcelamento.ParamByName('IDPESSJUR').AsFloat   := StrtoIntDef(sidpessjurconspart, -1);
    dtmConsPart1.qryParcelamento.ParamByName('IDPLANOPREV').AsFloat := StrtoIntDef(sidplanoprevconspart, -1);
    dtmConsPart1.qryParcelamento.ParamByName('SEQPROPOSTA').AsFloat := StrtoIntDef(sseqpropostaconspart, -1);
    dtmConsPart1.qryParcelamento.Open;
  end


  else if NBKelegpart.ActivePage = 'PgBeneficiosPagamentosRubricasIndividuais' then
  begin
    if not dtmConsPart.qryRubIndiv.Prepared then dtmConsPart.qryRubIndiv.Prepare;
    dtmConsPart.qryRubIndiv.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryRubIndiv.Active then dtmConsPart.qryRubIndiv.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosPagamentosContraCheque' then
  begin
    // Utiliza o frame da Folha de Benefícios
    frmFrameConsultaHistorico1.ResetaFrame;
    frmFrameConsultaHistorico1.MontaQry;

    if frmConsPart.visible then
      frmFrameConsultaHistorico1.ExecutaConsulta(iIdTitular);

    pgAcessoDireto := '';
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiariosPrevidenciarios' then
  begin
    if not dtmConsPart1.qrypartprev.Prepared then dtmConsPart1.qrypartprev.Prepare;
    dtmConsPart1.qrypartprev.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qrypartprev.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    // início - andre Tavares - 03/03/2004 - pendência 16131
    dtmConsPart1.qrypartprev.Filtered := false;
    dtmConsPart1.qrypartprev.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoorigem = '+sidplanoprevconspart;
    dtmConsPart1.qrypartprev.Filtered := true;
    // fim - andre Tavares - 03/03/2004 - pendência 16131


    if not dtmConsPart1.qrypartprev.Active then dtmConsPart1.qrypartprev.Open;
    dtmConsPart1.qrypartprev.FieldByName('VALORBASE1').DisplayLabel := dtmConsPart1.qrypartprev.FieldByName('NOMEVALORBASE1').AsString;

    if not dtmConsPart1.QryContaCorrentepartprev.Prepared then dtmConsPart1.QryContaCorrentepartprev.Prepare;
    if not dtmConsPart1.QryContaCorrentepartprev.Active then dtmConsPart1.QryContaCorrentepartprev.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiariosAssistenciais' then
  begin
    if not dtmConsPart.qrypart.Prepared then dtmConsPart.qrypart.Prepare;
    dtmConsPart.qrypart.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qrypart.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    // início - andre Tavares - 03/03/2004 - pendência 16131
    dtmConsPart.qrypart.Filtered := false;
    dtmConsPart.qrypart.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qrypart.Filtered := true;
    // fim - andre Tavares - 03/03/2004 - pendência 16131

    if not dtmConsPart.qrypart.Active then dtmConsPart.qrypart.Open;
  end

  else if NBKelegpart.ActivePage = 'PgContribuicoesHistoricoPrevidenciario' then
  begin
    // desabilita o controle porque a query retorna muitas linhas e assim fica mais rápido
   // porque o DBcontrol não é atualizado a cada linha retornada
    dtmConsPart1.qrycontribprev.DisableControls;
    dtmConsPart1.qrycontribprev.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaConspart, -1);
// pendência 8538 retirado o filtro idpessjur
    dtmConsPart1.qrycontribprev.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart1.qrycontribprev.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart1.qrycontribprev.Active then
    begin
      if (dtmConsPart1.qrycontribprev.Prepared) and (not dtmConsPart1.qrycontribprev.active)then
        dtmConsPart1.qrycontribprev.unPrepare;
      if not dtmConsPart1.qrycontribprev.active then
      begin
        dtmConsPart1.qrycontribprev.Prepare;
        dtmConsPart1.qrycontribprev.Open;
      end;
    end;
    dtmConsPart1.qrycontribprev.EnableControls;
  end

  else if NBKelegpart.ActivePage = 'PgContribuicoesHistoricoAssistencial' then
  begin
    // desabilita o controle porque a query retorna muitas linhas e assim fica mais rápido
   // porque o DBcontrole não é atualizado a cada linha retornada
    dtmConsPart1.qrycontrib.DisableControls;
    if not dtmConsPart1.qrycontrib.Prepared then dtmConsPart1.qrycontrib.Prepare;
    dtmConsPart1.qrycontrib.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart1.qrycontrib.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart1.qrycontrib.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart1.qrycontrib.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    // início - andre Tavres - 03/03/2004 - pendência 16131
    dtmConsPart1.qrycontrib.Filtered := false;
    dtmConsPart1.qrycontrib.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart1.qrycontrib.Filtered := true;
    // fim - andre Tavres - 03/03/2004 - pendência 16131

    if not dtmConsPart1.qrycontrib.Active then dtmConsPart1.qrycontrib.Open;
    dtmConsPart1.qrycontrib.EnableControls;
  end

  else if NBKelegpart.ActivePage = 'PgContatos' then
  begin
    if not dtmConsPart1.qryContatos.Prepared then dtmConsPart1.qryContatos.Prepare;
    dtmConsPart1.qryContatos.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart1.qryContatos.Active then dtmConsPart1.qryContatos.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosHistorico' then
  begin
    // desabilita o controle porque a query retorna muitas linhas e assim fica mais rápido
   // porque o DBcontrole não é atualizado a cada linha retornada
    dtmConsPart.qryBenef.DisableControls;
    if not dtmConsPart.qryBenef.Prepared then dtmConsPart.qryBenef.Prepare;
//início - André Tavares - 21/10/2003 - pendência 15205
    dtmConsPart.qryBenef.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdTitular, -1);
    dtmConsPart.qryBenef.ParamByName('IDPESSOA').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
//fim - André Tavares - 21/10/2003 - pendência 15205
    dtmConsPart.qryBenef.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryBenef.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryBenef.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qryBenef.Active then dtmConsPart.qryBenef.Open;
    dtmConsPart.qryBenef.EnableControls;
  end


  else if NBKelegpart.ActivePage = 'PgRUB' then
  begin
    if not dtmConsPart.QryRubs.Prepared then dtmConsPart.QryRubs.Prepare;
    dtmConsPart.QryRubs.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.QryRubs.Active then dtmConsPart.QryRubs.Open;

    if not dtmConsPart.qryTipoDocXRub.Prepared then dtmConsPart.qryTipoDocXRub.Prepare;
    if not dtmConsPart.qryTipoDocXRub.Active then dtmConsPart.qryTipoDocXRub.Open;

    if not dtmConsPart.qryRubXBeneficio.Prepared then dtmConsPart.qryRubXBeneficio.Prepare;
    if not dtmConsPart.qryRubXBeneficio.Active then dtmConsPart.qryRubXBeneficio.Open;

    if not dtmConsPart.qryHistRubs.Prepared then dtmConsPart.qryHistRubs.Prepare;
    if not dtmConsPart.qryHistRubs.Active then dtmConsPart.qryHistRubs.Open;
  end

  else if NBKelegpart.ActivePage = 'PgRubricasSalariais' then
  begin
    if not dtmConsPart.qryMesRubrica.Prepared then dtmConsPart.qryMesRubrica.Prepare;
    dtmConsPart.qryMesRubrica.ParamByName('idPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryMesRubrica.Active then dtmConsPart.qryMesRubrica.Open;
    dtmConsPart.qryMesRubrica.First;

    if not dtmConsPart.qryPatros.Prepared then dtmConsPart.qryPatros.Prepare;
    dtmConsPart.qryPatros.ParamByName('idPessoa').asFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryPatros.Active then dtmConsPart.qryPatros.Open;
    dblkPatros.LookupValue := sidpessjurconspart;
    dblkPatros.Text := dtmConsPart.qryPatros.fieldByName('NOME').asString;

    DblkMesCobranca.Text := dtmConsPart.qryMesRubricaMESCOBRANCA.asString;
    DblkMesCobranca.LookupValue := dtmConsPart.qryMesRubricaMESCOBRANCA.asString;
    dblkMesCobrancaChange(self);
  end

  else if NBKelegpart.ActivePage = 'PgEvolucaoFuncional' then
  begin
     if not dtmConsPart.qry.Prepared then dtmConsPart.qry.Prepare;
     dtmConsPart.qry.ParamByName('IdPessJur').Value      := StrToIntDef(sIdTitular, -1);
     dtmConsPart.qry.ParamByName('IdPessoa').Value       := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart.qry.Active then dtmConsPart.qry.Open;

     if not dtmConsPart.qryDet.Prepared then dtmConsPart.qryDet.Prepare;
     dtmConsPart.qryDet.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryDet.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryDet.Active then dtmConsPart.qryDet.Open;

     if not dtmConsPart.qryFuncao.Prepared then dtmConsPart.qryFuncao.Prepare;
     dtmConsPart.qryFuncao.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryFuncao.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     dtmConsPart.qryFuncao.ParamByName('IDPLANOPREV').Value := StrToIntDef(sidplanoprevconspart, -1);
     if not dtmConsPart.qryFuncao.Active then dtmConsPart.qryFuncao.Open;
     dtmConsPart.qryFuncao.First;
     while not dtmConsPart.qryFuncao.eof do
     begin
       dtmConsPart.qryFuncao.Edit;
       dtmConsPart.qryFuncao.fieldByName('VALORFUNCAO').asFloat :=  BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryFuncao.FieldByName('IdPessJur').asString, -1),
                                                                                 strToIntDef(dtmConsPart.qryFuncao.FieldByName('IDfuncao').asString, -1),
                                                                                 DateToStr(now));
       dtmConsPart.qryFuncao.Post;
       dtmConsPart.qryFuncao.Next;
     end;
                                     
     if not dtmConsPart.qryAdicCompens.Prepared then dtmConsPart.qryAdicCompens.Prepare;
     dtmConsPart.qryAdicCompens.ParamByName('IDPESSJUR').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryAdicCompens.ParamByName('IDPESSOA').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryAdicCompens.Active then dtmConsPart.qryAdicCompens.Open;

     dtmConsPart.qryAdicCompens.First;
     while not dtmConsPart.qryAdicCompens.eof do
     begin
       dtmConsPart.qryAdicCompens.Edit;
       dtmConsPart.qryAdicCompens.fieldByName('VALORADICCOMP').asFloat := (BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IDPESSJUR').asString, -1),
                                                                                strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IDFUNCAO').asString, -1),
                                                                                DateToStr(now)) * (dtmConsPart.qryAdicCompens.fieldByName('PERC1AC').asFloat)/100);
       dtmConsPart.qryAdicCompens.Post;
       dtmConsPart.qryAdicCompens.Next;
     end;

     if not dtmConsPart.qryAdicInsalub.Prepared then dtmConsPart.qryAdicInsalub.Prepare;
     dtmConsPart.qryAdicInsalub.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryAdicInsalub.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryAdicInsalub.Active then dtmConsPart.qryAdicInsalub.Open;

     if not dtmConsPart.qryAdicPericul.Prepared then dtmConsPart.qryAdicPericul.Prepare;
     dtmConsPart.qryAdicPericul.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryAdicPericul.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryAdicPericul.Active then dtmConsPart.qryAdicPericul.Open;

     if not dtmConsPart.qryAdicNoturno.Prepared then dtmConsPart.qryAdicNoturno.Prepare;
     dtmConsPart.qryAdicNoturno.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryAdicNoturno.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryAdicNoturno.Active then dtmConsPart.qryAdicNoturno.Open;

     if not dtmConsPart.qryATS.Prepared then dtmConsPart.qryATS.Prepare;
     dtmConsPart.qryATS.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryATS.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryATS.Active then dtmConsPart.qryATS.Open;

     dtmConsPart.qryRubSalarial.Close;
     dtmConsPart.qryRubSalarial.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryRubSalarial.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryRubSalarial.Active then dtmConsPart.qryRubSalarial.Open;

     if not dtmConsPart.qryFuncoes.Prepared then dtmConsPart.qryFuncoes.Prepare;
     dtmConsPart.qryFuncoes.ParamByName('IdPessJur').Value  := StrToIntDef(sidpessjurconspart, -1);
     if not dtmConsPart.qryFuncoes.Active then dtmConsPart.qryFuncoes.Open;

     if not dtmConsPart.qryCargoxNivel.Prepared then dtmConsPart.qryCargoxNivel.Prepare;
     dtmConsPart.qryCargoxNivel.ParamByName('IdPessJur').Value  := StrToIntDef(sidpessjurconspart, -1);
     if not dtmConsPart.qryCargoxNivel.Active then dtmConsPart.qryCargoxNivel.Open;

     if not dtmConsPart.qryProvDesc.Prepared then dtmConsPart.qryProvDesc.Prepare;
     dtmConsPart.qryProvDesc.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     if not dtmConsPart.qryProvDesc.Active then dtmConsPart.qryProvDesc.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosProcessos' then
  begin
    dtmConsPart.qryProcessosBenef.ParamByName('IDPESSOA').asFloat := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryProcessosBenef.ParamByName('IdTitular').asFloat := StrToIntDef(sIdTitular, -1);
    // início - andre TavAres - 03/03/2004 - pendência 16131
    dtmConsPart.qryProcessosBenef.Filtered := false;
    dtmConsPart.qryProcessosBenef.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qryProcessosBenef.Filtered := true;
    // fim - andre TavAres - 03/03/2004 - pendência 16131

    if not dtmConsPart.qryProcessosBenef.Prepared then dtmConsPart.qryProcessosBenef.Prepare;
    if not dtmConsPart.qryProcessosBenef.Active then dtmConsPart.qryProcessosBenef.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosSituacaoAtual' then
  begin
    dtmConsPart.qrySituacaoAtualBenef.ParamByName('IDPESSOA').asFloat := StrToIntDef(sIdPessoaConspart, -1);
    // início - andre TavAres - 03/03/2004 - pendência 16131
    dtmConsPart.qrySituacaoAtualBenef.Filtered := false;
    dtmConsPart.qrySituacaoAtualBenef.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart.qrySituacaoAtualBenef.Filtered := true;
    // fim - andre TavAres - 03/03/2004 - pendência 16131
    if not dtmConsPart.qrySituacaoAtualBenef.Prepared then dtmConsPart.qrySituacaoAtualBenef.Prepare;
    if not dtmConsPart.qrySituacaoAtualBenef.Active then dtmConsPart.qrySituacaoAtualBenef.Open;
  end


  else if NBKelegpart.ActivePage = 'PgContribuicoesReservaHistoricoAlimentacao' then
  begin
    dtmConsPart.cDSHistReserva.Close;
    dtmConsPart.qryHistReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    dtmConsPart.qryMesReferencia.Close;
    dtmConsPart.qryMesReferencia.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryMesReferencia.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryMesReferencia.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryMesReferencia.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    dtmConsPart.qryMesReferencia.Open;

    dtmConsPart.qryNomeReserva.Close;
    dtmConsPart.qryNomeReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryNomeReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryNomeReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryNomeReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    dtmConsPart.qryNomeReserva.Open;

    if not dtmConsPart.CdsHistReserva.active then dtmConsPart.cDSHistReserva.Open;

    TotalizaReserva;
  end


  else if NBKelegpart.ActivePage = 'PgContribuicoesSituacaoAtual' then
  begin
    dtmConsPart.qryContribSitAtual.ParamByName('IDPESSOA').AsFloat    := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryContribSitAtual.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryContribSitAtual.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryContribSitAtual.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if (dtmConsPart.qryContribSitAtual.prepared) and (not dtmConsPart.qryContribSitAtual.active) then dtmConsPart.qryContribSitAtual.unPrepare;
    if not dtmConsPart.qryContribSitAtual.active then
    begin
     dtmConsPart.qryContribSitAtual.prepare;
     dtmConsPart.qryContribSitAtual.Open;
    end;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosHistoricoMovimentacoes' then
  begin
    if not dtmConsPart1.qryBeneficios.Prepared then dtmConsPart1.qryBeneficios.Prepare;
    // inicio - andre tavares - pendência 17362 - 11/10/2004
    dtmConsPart1.qryBeneficios.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidTitular, -1);
    dtmConsPart1.qryBeneficios.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    // fim - andre tavares - pendência 17362 - 11/10/2004
    dtmConsPart1.qryBeneficios.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);

    // início - andre Tavres - 03/03/2004 - pendência 16131
    dtmConsPart1.qryBeneficios.Filtered := false;
    dtmConsPart1.qryBeneficios.Filter := ' idpessjur = ' + sidpessjurconspart + ' and idplanoprev = '+sidplanoprevconspart;
    dtmConsPart1.qryBeneficios.Filtered := true;
    // fim - andre Tavres - 03/03/2004 - pendência 16131

    if not dtmConsPart1.qryBeneficios.Active then dtmConsPart1.qryBeneficios.Open;

    dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger      := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart1.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
    if not dtmConsPart.qryMovBenef.Active then dtmConsPart.qryMovBenef.Open;
  end

  else if NBKelegpart.ActivePage = 'PgPlanos' then
  begin
    if not dtmConsPart1.qryplanprev.Active then
    begin
      dtmConsPart1.qryplanprev.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart1.qryplanprev.Prepared then dtmConsPart1.qryplanprev.Prepare;
      dtmConsPart1.qryplanprev.Open;
    end;

    if not dtmConsPart1.qryplanass.Active then
    begin
      dtmConsPart1.qryplanass.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      dtmConsPart1.qryplanass.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
      dtmConsPart1.qryplanass.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
      if not dtmConsPart1.qryplanass.Prepared then dtmConsPart1.qryplanass.Prepare;
      dtmConsPart1.qryplanass.Open;
    end;
  end
  else if NBKelegpart.ActivePage = 'PgEnquadramento' then
  begin

    qryAux.Close;
    qryAux.DataBaseName := 'BaseDados';

    if not dtmConsPart.qryEvolFuncCargo.Active then
    Begin
      dtmConsPart.qryEvolFuncCargo.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart.qryEvolFuncCargo.Active then dtmConsPart.qryEvolFuncCargo.Open;
    end;
    if not dtmConsPart.qryEvolFuncATS.Active then
    Begin
      dtmConsPart.qryEvolFuncATS.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart.qryEvolFuncATS.Active then dtmConsPart.qryEvolFuncATS.Open;
    end;
    if not dtmConsPart.qryEvolFuncao.Active then
    Begin
      dtmConsPart.qryEvolFuncao.Open;

      varFields     := VarArrayCreate([0,1],varVariant);

      // **************************************************************************
      //  PREENCHER QUERY SECAO 1 COM AS FUNCOES E SEUS DADOS, GRAVADOS NA DETCALCULO
      // **************************************************************************
      with qryAux do
      begin
         Close;
         SQL.Clear;
         SQL.Add(' SELECT  EV.IDPESSOA, EV.DATAINICIO, EV.DATAFINAL,   '+
                 '         CEXT.CODIGO AS CODIGO, CEXT.TITULO AS NOME, '+
                 '         D.DESCRICAO, D.VALOR                                     '+
                 ' FROM    PESSOA P, PESSOA PAT, PESSOAFISICA PF, EVOLFUNCPREV EV , '+
                 '         CARGOEXT CEXT, DETCALCULO D                              '+
                 ' WHERE   EV.IDPESSOA       = '+sidpessoaconspart+
                 ' AND     P.IDPESSOA        = EV.IDPESSOA   '+
                 ' AND     PF.IDPESSOA       = EV.IDPESSOA   '+
                 ' AND     PAT.IDPESSOA      = EV.IDPESSJUR  '+
                 ' AND     CEXT.IDCARGOEXT   = EV.IDFUNCAO   '+
                 ' AND     D.IDPESSOA        = EV.IDPESSOA   '+
                 ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO  '+
                 '                          WHERE  IDPESSOA = '+sidpessoaconspart+
                 '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
                 ' AND     ((D.DESCRICAO LIKE ''%CODFUNC/%/MODO%'') OR (D.DESCRICAO LIKE ''%CODACPF/%/MODO%'') ) '+
                 ' AND     SUBSTR(D.VALOR,1,3) = RTRIM(CEXT.CODIGO) '+
                 ' ORDER BY EV.DATAINICIO ' );
         Open;
         First;
         while not Eof do
         begin

            // Verificar se a funcao já nao foi incluida pela data inicio e codigo
            // Se nao encontrar, verificar se a desccontrole já foi incluida
            // Se nao encontrar, entao inserir
            varFields[0] := FieldByName('DATAINICIO').AsString;
            varFields[1] := FieldByName('CODIGO').AsString;
            bInsere      := True;

            with dtmConsPart.qryEvolFuncao do
            begin
               First;
               while not Eof do
               begin
                  if (Trim(FieldByName('DATACONTROLE').AsString) = Trim(qryAux.FieldByName('DATAINICIO').AsString)) and
                     (Trim(FieldByName('CODIGO').AsString)       = Trim(qryAux.FieldByName('CODIGO').AsString))
                  then begin
                     bInsere := False;
                     break;
                  end
                  else if Trim(FieldByName('DESCCONTROLE').AsString) = Trim(Copy(qryAux.FieldByName('DESCRICAO').AsString,1,30))
                       then begin
                          bInsere := False;
                          break;
                       end;
                  Next;
               end; // while not Eof
            end;

            if bInsere
            then begin
              dtmConsPart.qryEvolFuncao.Insert;
              dtmConsPart.qryEvolFuncao.FieldByName('CODIGO').AsString     := FieldByName('CODIGO').AsString;
              dtmConsPart.qryEvolFuncao.FieldByName('DATAINICIO').AsString := FieldByName('DATAINICIO').AsString;
              dtmConsPart.qryEvolFuncao.FieldByName('DATAFINAL').AsString  := FieldByName('DATAFINAL').AsString;
              dtmConsPart.qryEvolFuncao.FieldByName('NOME').AsString       := FieldByName('NOME').AsString;

              sStringAux := FieldByName('VALOR').AsString;
              i := Pos('/',sStringAux);
              sStringAux := Copy(sStringAux,i+1, Length(sStringAux) - i);
              i := Pos('/',sStringAux);
              dtmConsPart.qryEvolFuncao.FieldByName('PERCPBC').AsString := Copy(sStringAux,1,i-1);

              if Pos('ACPF', FieldByName('DESCRICAO').AsString) > 0
              then dtmConsPart.qryEvolFuncao.FieldByName('MODO').AsString    := 'AC'
              else dtmConsPart.qryEvolFuncao.FieldByName('MODO').AsString    := Copy(sStringAux,i+1,2);
              dtmConsPart.qryEvolFuncao.FieldByName('DATACONTROLE').AsString := FieldByName('DATAINICIO').AsString;
              dtmConsPart.qryEvolFuncao.FieldByName('DESCCONTROLE').AsString := Copy(FieldByName('DESCRICAO').AsString, 1,30);
              dtmConsPart.qryEvolFuncao.Post;
            end;
            Next;
         end;
      end;

    end;


   // *************************************************************************************
   // PREENCHER QUERY SECAO 2 COM OS QUADROS COMPONENTES X VALOR E COMPONENTES X PERCENTUAL
   // *************************************************************************************
   bAchouLinhaVazia := False;
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT  1 AS ORDEM,                                                     '+
              '         D.IDPESSOA,                                                     '+
              '         '' '' AS NOMEITEM,                                              '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''DIB'',''''), '':'', '''') AS DESCITEM, '+
              '         D.VALOR AS VALORITEM                                            '+
              ' FROM    DETCALCULO D                                                    '+
              ' WHERE   D.IDPESSOA  = '+sidpessoaconspart+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO          '+
              '                          WHERE  IDPESSOA = '+sidpessoaconspart+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%DIB%''                                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODFUNC%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODACPF%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%BNH%'')                                              '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                           '+
              ' UNION                                                                                 '+
              ' SELECT  2 AS ORDEM,                                                                   '+
              '         D.IDPESSOA,                                                                   '+
              '         ''Outras Rubricas Salariais'' AS NOMEITEM,                                    '+
              '         REPLACE(REPLACE(D.DESCRICAO, ''DIB'',''''), '':'', '''') AS DESCITEM, '+
              '         D.VALOR AS VALORITEM                                                          '+
              ' FROM    DETCALCULO D                                                                  '+
              ' WHERE   D.IDPESSOA  = '+sidpessoaconspart+
              ' AND     D.IDCALCULO =  ( SELECT MAX(IDCALCULO) FROM DETCALCULO                        '+
              '                          WHERE  IDPESSOA = '+sidpessoaconspart+
              '                          AND    UPPER(DESCRICAO) LIKE ''%CALCULO DO ENQUADRAMENTO%'') '+
              ' AND     D.DESCRICAO LIKE ''%BNH%DIB%''                                                '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODFUNC%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CODACPF%'')                                          '+
              ' AND     NOT (D.DESCRICAO LIKE ''%ENQUADRAMENTO%'')                                    '+
              ' AND     NOT (D.DESCRICAO LIKE ''%CÓDIGO%'')                                           '+
              ' ORDER BY ORDEM ');
      Open;
      nTotOrdem1     := 0;
      nTotOrdem2     := 0;
      lTotOrdem2     := True;
      // Inserir tudo que não é percentual
      First;
      dtmConsPart.qryEnqSecao2.Open;
      dtmConsPart.qryEnqSecao2.Delete;
      while not Eof do
      begin
         if Pos('%',FieldByName('DESCITEM').AsString) > 0
         then begin
            Next;
            continue;
         end;
         if (FieldByName('ORDEM').AsString = '2') and (lTotOrdem2) Then
         Begin
           lTotOrdem2 := False;
           dtmConsPart.qryEnqSecao2.Append;
           dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString         := FieldByName('ORDEM').AsString;
           dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString      := FieldByName('IDPESSOA').AsString;
           dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
           dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString      := 'Sub-Total';
           dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := nTotOrdem1;
           dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := '';
           dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString      := '';
           dtmConsPart.qryEnqSecao2.Post;
         end;
         dtmConsPart.qryEnqSecao2.Append;
         dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString         := FieldByName('ORDEM').AsString;
         dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString      := FieldByName('IDPESSOA').AsString;
         dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
         dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString      := FieldByName('DESCITEM').AsString;
         dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString));
         dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := '';
         dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString      := '';
         dtmConsPart.qryEnqSecao2.Post;

         if FieldByName('ORDEM').AsString = '1' Then
            nTotOrdem1 := nTotOrdem1 + StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString))
         else
            nTotOrdem2 := nTotOrdem2 + StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString));

         Next;
      end; // while
      dtmConsPart.qryEnqSecao2.Append;
      dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString         := FieldByName('ORDEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString      := FieldByName('IDPESSOA').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString      := 'Sub-Total';
      dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := nTotOrdem2;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := '';
      dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString      := '';
      dtmConsPart.qryEnqSecao2.Post;

      dtmConsPart.qryEnqSecao2.Append;
      dtmConsPart.qryEnqSecao2.FieldByName('ORDEM').AsString         := FieldByName('ORDEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('IDPESSOA').AsString      := FieldByName('IDPESSOA').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString      := 'Total';
      dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := nTotOrdem1 + nTotOrdem2;
      dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := '';
      dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString      := '';
      dtmConsPart.qryEnqSecao2.Post;
      edValEnq.Text := FloattoStr(nTotOrdem1 + nTotOrdem2);
      // Inserir os percentuais
      First;
      while not Eof do
      begin
         if Pos('%',FieldByName('DESCITEM').AsString) <= 0
         then begin
            Next;
            continue;
         end;

         if dtmConsPart.qryEnqSecao2.IsEmpty
         then begin
            dtmConsPart.qryEnqSecao2.Append;
            dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
            dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString      := '';
            dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := 0;
            dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
            if StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString)) = 0 Then
               dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString   := ''
            else
               dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString   := ClienteNum(FieldByName('VALORITEM').AsString);
            dtmConsPart.qryEnqSecao2.Post;
         end
         else begin
            dtmConsPart.qryEnqSecao2.First;
            while not dtmConsPart.qryEnqSecao2.EOF Do Begin
              if Pos(copy(FieldByName('DESCITEM').AsString,7,5),
                 dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString) > 0 Then
              Begin
                 bAchouLinhaVazia := True;
                 dtmConsPart.qryEnqSecao2.Edit;
                 dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
                 if StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString)) = 0 Then
                    dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString   := ''
                 else
                    dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString   := ClienteNum(FieldByName('VALORITEM').AsString);
                 dtmConsPart.qryEnqSecao2.Post;
              end;
              dtmConsPart.qryEnqSecao2.Next;
            end;

            if not bAchouLinhaVazia
            then begin
               dtmConsPart.qryEnqSecao2.Append;
               dtmConsPart.qryEnqSecao2.FieldByName('NOMEITEM').AsString      := FieldByName('NOMEITEM').AsString;
               dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString      := '';
               dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat      := 0;
               dtmConsPart.qryEnqSecao2.FieldByName('DESCITEMPERC').AsString  := FieldByName('DESCITEM').AsString;
                 if StrToFloat(ClienteNum(FieldByName('VALORITEM').AsString)) = 0 Then
                    dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString   := ''
                 else
                    dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString   := ClienteNum(FieldByName('VALORITEM').AsString);
               dtmConsPart.qryEnqSecao2.Post;
            end;
         end;
         Next;
      end;
      dtmConsPart.qryEnqSecao2.First;
      while not dtmConsPart.qryEnqSecao2.EOF Do Begin
        if (dtmConsPart.qryEnqSecao2.FieldByName('VALORITEM').AsFloat = 0 ) and
           (dtmConsPart.qryEnqSecao2.FieldByName('PERCITEM').AsString = '' ) Then
        Begin
           dtmConsPart.qryEnqSecao2.Delete;
        end;
        dtmConsPart.qryEnqSecao2.Next;
      end;
   end;
   dtmConsPart.qryEnqSecao2.First;

  end
  // FDIAS - FUNCEF - 10.12.2002   - FIM

//início - André Tavares - pendência 15211 - 20/10/2003
 else if NBKelegpart.ActivePage = 'pgDadosParaEnquadramento' then
 begin
   dtmConsPart.qrySitFuncional.Close;
   dtmConsPart.qrySitFuncional.paramByName('IDPESSOA').asInteger  := strToInt(sIdpessoaConsPart);
   dtmConsPart.qrySitFuncional.paramByName('IDPESSJUR').asInteger := strToInt(sidpessjurconspart);
   dtmConsPart.qrySitFuncional.Open;

   dbedValorCargo.Text := FormatFloat('#,##0.00', BuscaValorCargo(strToIntDef(dtmConsPart.qrySitFuncional.fieldByName('IDCARGOEXT').asString, -1),
                                                                  strToIntDef(sidpessjurconspart, -1)));

   dtmConsPart.qryFuncAtual.Close;
   dtmConsPart.qryFuncAtual.ParamByName('IDPESSOA').asInteger    := strToInt(sIdpessoaConsPart);
   dtmConsPart.qryFuncAtual.ParamByName('IDPESSJUR').asInteger   := strToInt(sidpessjurconspart);
   dtmConsPart.qryFuncAtual.ParamByName('IDPLANOPREV').asInteger := strToInt(sidplanoprevconspart);
   dtmConsPart.qryFuncAtual.Open;

   dbedValorFunc.Text := FormatFloat('#,##0.00', BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryFuncAtual.FieldByName('IdPessJur').asString, -1),
                                                                          strToIntDef(dtmConsPart.qryFuncAtual.FieldByName('IDfuncao').asString, -1),
                                                                          DateToStr(now)));

   dtmConsPart.qryFuncFacult.Close;
   dtmConsPart.qryFuncFacult.ParamByName('IDPESSOA').asInteger    := strToInt(sIdpessoaConsPart);
   dtmConsPart.qryFuncFacult.ParamByName('IDPESSJUR').asInteger   := strToInt(sidpessjurconspart);
   dtmConsPart.qryFuncFacult.Open;

   dbedValFuncFac.Text := FormatFloat('#,##0.00', BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryFuncFacult.FieldByName('IdPessJur').asString, -1),
                                                                           strToIntDef(dtmConsPart.qryFuncFacult.FieldByName('IDfuncao').asString, -1),
                                                                           DateToStr(now)));

   dtmConsPart.qryAdicCompens.Close;
   dtmConsPart.qryAdicCompens.ParamByName('IDPESSJUR').Value   := StrToIntDef(sidpessjurconspart, -1);
   dtmConsPart.qryAdicCompens.ParamByName('IDPESSOA').Value    := StrtoIntDef(sIdpessoaConsPart, -1);
   dtmConsPart.qryAdicCompens.Open;

   edtValorAdicComp.Text := FormatFloat('#,##0.00', BuscaValorFUNCAOConsEleg(strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IdPessJur').asString, -1),
                                                                             strToIntDef(dtmConsPart.qryAdicCompens.FieldByName('IDfuncao').asString, -1),
                                                                             DateToStr(now)));

 end
//fim - André Tavares - pendência 15211 - 20/10/2003

//início - André Tavares - pendência 17472 - 25/10/2004
 else if NBKelegpart.ActivePage = 'PgVidaNaFundacao' then
 begin
   dtmConsPart1.qryVidaFundacao.Close;
   dtmConsPart1.qryVidaFundDet.Close;
   dtmConsPart1.qryVidaFundacao.paramByName('IDPESSOA').asInteger  := strToInt(sIdpessoaConsPart);
   dtmConsPart1.qryVidaFundacao.Open;
   dtmConsPart1.qryVidaFundDet.Open;
 end;
//fim - André Tavares - pendência 17472 - 25/10/2004

end; //end da Procedure


procedure TFRMconspart.CloseDatasets;
var i : integer;
begin
  // Fecha todos as queries abertas
  with dtmConspart  do
  begin
    for i := 0 to (ComponentCount - 1) do
    begin
      if (Components[i] is TwwQuery) and
         ((Components[i] as TwwQuery).Active) then
      begin
       (Components[i] as TwwQuery).Close;
       (Components[i] as TwwQuery).Filter   := '';
       (Components[i] as TwwQuery).Filtered := false;
      end;

      if (Components[i] is TQuery) and
         ((Components[i] as TQuery).Active) then
      begin
       (Components[i] as TQuery).Close;
       (Components[i] as TQuery).Filter   := '';
       (Components[i] as TQuery).Filtered := false;
      end;

      if (Components[i] is TCmClientDataSet) and
         ((Components[i] as TCmClientDataSet).Active) then
      begin
       (Components[i] as TCmClientDataSet).Close;
       (Components[i] as TCmClientDataSet).Filter   := '';
       (Components[i] as TCmClientDataSet).Filtered := false;
      end;

      if (Components[i] is TClientDataSet) and
         ((Components[i] as TClientDataSet).Active) then
      begin
       (Components[i] as TClientDataSet).Close;
       (Components[i] as TClientDataSet).Filter   := '';
       (Components[i] as TClientDataSet).Filtered := false;
      end;
    end;
  end;

  // Fecha todos as queries abertas do outro datamodule
  with dtmConspart1  do
  begin
    for i := 0 to (ComponentCount - 1) do
    begin
      if (Components[i] is TwwQuery) and
         ((Components[i] as TwwQuery).Active) then
      begin
       (Components[i] as TwwQuery).Close;
       (Components[i] as TwwQuery).Filter   := '';
       (Components[i] as TwwQuery).Filtered := false;
      end;

      if (Components[i] is TQuery) and
         ((Components[i] as TQuery).Active) then
      begin
       (Components[i] as TQuery).Close;
       (Components[i] as TQuery).Filter   := '';
       (Components[i] as TQuery).Filtered := false;
      end;

      if (Components[i] is TCmClientDataSet) and
         ((Components[i] as TCmClientDataSet).Active) then
      begin
       (Components[i] as TCmClientDataSet).Close;
       (Components[i] as TCmClientDataSet).Filter   := '';
       (Components[i] as TCmClientDataSet).Filtered := false;
      end;

      if (Components[i] is TClientDataSet) and
         ((Components[i] as TClientDataSet).Active) then
      begin
       (Components[i] as TClientDataSet).Close;
       (Components[i] as TClientDataSet).Filter   := '';
       (Components[i] as TClientDataSet).Filtered := false;
      end;
    end;
  end;


end;


procedure TfrmConsPart.dblkRecebedorChange(Sender: TObject);
begin
  dtmConsPart1.qryHstVersoes.Close;
  dtmConsPart1.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart1.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart1.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart1.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart1.qryHstVersoes.Open;
end;



procedure TFRMconspart.EnderecosClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEnderecos';
end;

procedure TFRMconspart.PrevidenciarioClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEventosPrevidenciarios';
end;

procedure TFRMconspart.AssistencialClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEventosAssistenciais';
end;

procedure TFRMconspart.HistoricoFuncionalClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgHistoricoFuncional';
end;

procedure TFRMconspart.DadosBasicosClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgDadosBasicos';
end;

procedure TFRMconspart.TelefonesClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgTelefones';
end;

procedure TFRMconspart.ContasBancriasClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContasBancarias';
end;

procedure TFRMconspart.DependentesClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgDependentes';
end;

procedure TFRMconspart.EmprestimoClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEmprestimos';
end;

procedure TFRMconspart.ProtocolosClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgProtocolos';
end;

procedure TFRMconspart.ProcessosRadClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgProcessosRAD';
end;

procedure TFRMconspart.Saldo1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContribuicoesReservaSaldo';
end;

procedure TFRMconspart.RubricasIndividuaisClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosPagamentosRubricasIndividuais';
end;

procedure TFRMconspart.ContraChequeClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosPagamentosContraCheque';
end;

procedure TFRMconspart.Previdencirios1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiariosPrevidenciarios';
end;

procedure TFRMconspart.Assistenciais1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiariosAssistenciais';
end;

procedure TFRMconspart.Histrico1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContribuicoesHistorico';
end;

procedure TFRMconspart.Previdencirias1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContribuicoesHistoricoPrevidenciario';
end;

procedure TFRMconspart.Assistenciais2Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContribuicoesHistoricoAssistencial';
end;

procedure TFRMconspart.ContatosClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContatos';
end;

procedure TFRMconspart.HistoricoClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosHistorico';
end;

procedure TFRMconspart.RUBClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgRUB';
end;

procedure TFRMconspart.RubricasSalariaisClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgRubricasSalariais';
end;

procedure TFRMconspart.EvolucaoFuncionalClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEvolucaoFuncional';
end;

procedure TFRMconspart.ProcessosClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosProcessos';
end;

procedure TFRMconspart.SituaoAtualClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosSituacaoAtual';
end;


procedure TFRMconspart.HistricodeAlimentao1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContribuicoesReservaHistoricoAlimentacao';
end;

procedure TFRMconspart.SituaoAtual1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgContribuicoesSituacaoAtual';
end;


{ seta os Flags de classificação da pessoa }
procedure TFRMconspart.ClassificaPessoa;
var Sclassifica : string;
begin
  SClassifica := '';
  fElegivel                     := true;
  fParticipante_Assistido       := false;
  fParticipante_Falecido        := false;
  fRecebedor_Beneficio          := false;
  fDependente                   := false;
  fParticipante_Ativo           := false;
  fParticipante_Cancelado       := false;
  fBeneficiario                 := false;
  fRecebedor_Pensao_Alimenticia := false;
  fAlimentado                   := false;
  fTitular                      := false;

//  verificar se essa pessoa tem um titular
// A verificação de titularidade abaixo serve para habilitar o btão de acesso aos dados do titular
// verifica se a pessoa é Titular
   sIdTitular        := FConsPessoaGeral.cIdTitular;
   dtmConsPart.qryClassifica.Close;
   dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDPESSOA  = '+sidpessoaconspart +
                                         ' AND IDTITULAR = '+ sIdTitular;
   dtmConsPart.qryClassifica.Open;

   if (not dtmConsPart.qryClassifica.isEmpty) then
   begin
     fTitular := (dtmConsPart.qryClassifica.fieldByName('IDPESSOA').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);

   end
   else
     fTitular := trim(sIdTitular) = trim(sIdpessoaConsPart);

// andre tavares 25/09/2003 - coloquei este if
   if (not bAcessaDependente) then
   begin
     if fTitular then
       sidpessoaconspart := sIdTitular
     else
       sidpessoaconspart := FConsPessoaGeral.cIdpessoa;
     sIdTitular := FConsPessoaGeral.cIdTitular;
   end;


   if dtmConsPart.qryClassifica.isEmpty then
   begin
     dtmConsPart.qryClassifica.Close;
     dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDTITULAR, IDRESPONSAVEL FROM BFCIARIOTITPLAN WHERE IDRESPONSAVEL = '+sidpessoaconspart;
     dtmConsPart.qryClassifica.Open;
     fTitular := (not dtmConsPart.qryClassifica.isEmpty) and
                 (dtmConsPart.qryClassifica.fieldByName('IDRESPONSAVEL').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);
     sIdTitular := dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asString;
   end;
   if dtmConsPart.qryClassifica.isEmpty then
   begin
     dtmConsPart.qryClassifica.Close;
     dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDFAVORECIDO, IDTITULAR FROM RUBRICAINDIV WHERE FLGPENSAOALIM = 1 AND IDFAVORECIDO = '+sidpessoaconspart;
     dtmConsPart.qryClassifica.Open;
     fTitular := (not dtmConsPart.qryClassifica.isEmpty) and
                 (dtmConsPart.qryClassifica.fieldByName('IDFAVORECIDO').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);
     sIdTitular := dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asString;
   end;
//18/09/2003 - André Tavares - pendência - 15055 -
  // SE É FALECIDO - pessoaFisica -> DataMorte
  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT DATAMORTE FROM PESSOAFISICA WHERE IDPESSOA = '+sidpessoaconspart;
  dtmConsPart.qryClassifica.Open;
  if (dtmConsPart.qryClassifica.IsEmpty = false) and
     (dtmConsPart.qryClassifica.FieldByName('DATAMORTE').asString <> '') then
  begin
    fParticipante_Falecido := True;
    SClassifica := SClassifica + 'Falecido ';
    fElegivel := false;
    edClassific.text := SClassifica;
    exit;
  end;

  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT SP.FLGINTERNO, PPP.FLGDESATIVADO FROM PARTPREVPLAN PPP, SITPART SP '+
                                        ' WHERE PPP.IDSITPART = SP.IDSITPART(+) AND (NVL(PPP.FLGDESATIVADO, 0) = 0) AND PPP.IDPESSOA = '+sidpessoaconspart;
  dtmConsPart.qryClassifica.Open;
  if dtmConsPart.qryClassifica.IsEmpty then
  begin
    dtmConsPart.qryClassifica.Close;
    dtmConsPart.qryClassifica.Sql.Text := ' SELECT SP.FLGINTERNO, NVL(PPP.FLGDESATIVADO, 0) AS FLGDESATIVADO FROM PARTPREVPLAN PPP, SITPART SP '+
                                          ' WHERE PPP.IDSITPART = SP.IDSITPART(+) AND (PPP.FLGDESATIVADO = 1) AND PPP.IDPESSOA = '+sidpessoaconspart;
    dtmConsPart.qryClassifica.Open;
  end;

// SITUAÇÕES DO PARETICIPANTE  - sitpart - FlgInterno
  // ativo
  if (dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'AT') or
     ((dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MS') and
      (dtmConsPart.qryClassifica.FieldByName('FLGDESATIVADO').asInteger = 0))then
  begin
    fParticipante_Ativo := true;
    SClassifica := SClassifica + 'Participante Ativo ';
    fElegivel := false;
  end
  // assistido
  else if (dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'AS') then
  begin
    fParticipante_Assistido := true;
    SClassifica := SClassifica + 'Participante Assistido ';
    fElegivel := false;

    if fParticipante_Assistido then
    begin
      // verifica a informação de Tutela ou Curatela, caso o beneficiário o seja
      dtmConsPart.qryClassifica.Open;
    end;
  end

  // ativo em autopatrocínio total
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MA' then
  begin
    fParticipante_Assistido := true;
    SClassifica := SClassifica + 'Participante Ativo em Autopatrocínio Total ';
    fElegivel := false;
  end
  // ativo em autopatrocínio parcial
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MP' then
  begin
    fParticipante_Assistido := true;
    SClassifica := SClassifica + 'Participante Ativo em Autopatrocínio Parcial ';
    fElegivel := false;
  end
  // cancelado
  // tavares 16/01/2003
  else if (dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'CA') or
          ((dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MS') and
           (dtmConsPart.qryClassifica.FieldByName('FLGDESATIVADO').asInteger = 1)) then
  begin
    fParticipante_Cancelado := true;
    SClassifica := SClassifica + 'Participante Cancelado ';
    fElegivel := false;
  end;

  // verifica se é elegível
  if  fElegivel Then Begin
      if not dtmConsPart.qryElegivel.Prepared then dtmConsPart.qryElegivel.Prepare;
      dtmConsPart.qryElegivel.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart.qryElegivel.Active then dtmConsPart.qryElegivel.Open;
      fElegivel := not dtmConsPart.qryElegivel.IsEmpty;

      if fElegivel then
        SClassifica := SClassifica + 'Elegível ';
  end;

  // verificar se é Beneficiário ou seja
  // tem um benefício na bfciariotitplan com idpessoa e o idtitular <>
    // se não foi ainda classificado anteriormente o label não deve ter o traço (-)
    // foi classificado, colocar o traço antes do label

  if trim(sIdTitular) = '' then
    sIdTitular := FConsPessoaGeral.cIdTitular;
  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM BFCIARIOTITPLAN WHERE IDPESSOA = '+ sidpessoaconspart +
  ' AND IDTITULAR = '+ sIdTitular ;
  dtmConsPart.qryClassifica.Open;
  fBeneficiario := (dtmConsPart.qryClassifica.IsEmpty = false) and (dtmConsPart.qryClassifica.FieldByName('IDPESSOA').asString <> dtmConsPart.qryClassifica.FieldByName('IDTITULAR').asString);
  if fBeneficiario then
    SClassifica := SClassifica + ' - Beneficiário ';


  //VERIFICAR SE É DEPENDENTE   Depentit -> IDDEPENDENCIA
  // verificar se é Beneficiário ou seja
  // tem um benefício na bfciariotitplan com idpessoa e o idtitular <>
    // se não foi ainda classificado anteriormente o label não deve ter o traço (-)
    // foi classificado, colocar o traço antes do label

  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDPESSOA = '+sidpessoaconspart +
                                        ' AND IDTITULAR = ' + sidTitular;
  dtmConsPart.qryClassifica.Open;
  fDependente :=  (dtmConsPart.qryClassifica.IsEmpty = false) and
                  (dtmConsPart.qryClassifica.FieldByName('IDPESSOA').asString <> dtmConsPart.qryClassifica.FieldByName('IDTITULAR').asString);

  if fDependente then
    SClassifica := SClassifica + ' - Dependente ';

  // verificar se é recebedor de benefício
   dtmConsPart.qryClassifica.Close;
//   dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDRESPONSAVEL, ' +        // Everson TIBERO
   dtmConsPart.qryClassifica.Sql.Text := ' SELECT BF.IDPESSOA, BF.IDRESPONSAVEL, ' +    // Everson TIBERO
//   'NVL(DESCRICAO,''PRP'')AS DESCRECEB FROM BFCIARIOTITPLAN BF, TIPORECEBEDOR TP ' +  // Everson TIBERO
   'NVL(TP.DESCRICAO,''PRP'')AS DESCRECEB FROM BFCIARIOTITPLAN BF, TIPORECEBEDOR TP ' + // Everson TIBERO
   'WHERE BF.IDRESPONSAVEL = '+sidpessoaconspart +
   ' AND  BF.CODTIPORECEBEDOR = TP.CODTIPORECEBEDOR(+)';
   dtmConsPart.qryClassifica.Open;
//FDias - 12.12.2003 - ver se é Tutor / Curador

   fRecebedor_Beneficio := not dtmConsPart.qryClassifica.IsEmpty;

   if fRecebedor_Beneficio then Begin
     SClassifica := SClassifica + ' - Recebedor de Benefício ';
     if dtmConsPart.qryClassifica.FieldByName('DESCRECEB').AsString <> 'PRP' Then
        SClassifica := SClassifica + ' ('+ dtmConsPart.qryClassifica.FieldByName('DESCRECEB').AsString + ')';
   end;

  if not dtmConsPart.qryRubricaIndiv.Prepared then dtmConsPart.qryRubricaIndiv.Prepare;
  dtmConsPart.qryRubricaIndiv.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sidpessoaconspart, -1);
  if not dtmConsPart.qryRubricaIndiv.Active then dtmConsPart.qryRubricaIndiv.Open;

  //verificar se é recebedor de pensão alimentícia
  fRecebedor_Pensao_Alimenticia := (dtmConsPart.qryRubricaIndivIDFAVORECIDO.asInteger = strToIntDef(sidpessoaconspart, -1)) and
                                   (dtmConsPart.qryRubricaIndivFLGPENSAOALIM.asInteger = 1);
   if fRecebedor_Pensao_Alimenticia then
     SClassifica := SClassifica + ' - Recebedor de Pensão Alimentícia ';





  //verificar se é Alimentado
  fAlimentado := (dtmConsPart.qryRubricaIndivIDALIMENTADO.asInteger = strToIntDef(sidpessoaconspart, -1)) and
                 (dtmConsPart.qryRubricaIndivFLGPENSAOALIM.asInteger = 1);

   if fAlimentado then
     SClassifica := SClassifica + ' - Alimentado';

   if (fElegivel = false)                    and
      (fParticipante_Assistido = false)      and
      (fParticipante_Falecido = false)       and
      (fRecebedor_Beneficio = false)         and
      (fDependente = false)                  and
      (fParticipante_Ativo = false)          and
      (fParticipante_Cancelado = false)      and
      (fBeneficiario = false)                and
      (fRecebedor_Pensao_Alimenticia = false)and
      (fAlimentado = false)                  then
      SClassifica := SClassifica + 'Não Elegível - Não Dependente';
   if SClassifica[2] = '-' then
     SClassifica := copy (SClassifica, 4, length(SClassifica));

   edClassific.text := SClassifica;

// inicio - 18/09/2003 - André Tavares - pendência - 15055 -
  if (fTitular) then
  begin
    sIdPessoaConspart := sIdTitular;
  end;

  sbtnTitular.Visible := sIdTitular <> sIdPessoaConspart;

// fim - 18/09/2003 - André Tavares - pendência - 15055 -

end;

{ habilita os itens de Menu Pertinentes 'a classificação da Pessoa }
procedure TFRMconspart.HabilitaMenuItens;
begin
  ClassificaPessoa;
//--- Agenda Pessoal
  sbtnTitular.Visible := sIdTitular <> sIdPessoaConspart;

  DadosPessoais.Enabled  := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;

  Documentos.Enabled     := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;

  Enderecos.Enabled      := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;

  Telefones.Enabled      := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;

  Contatos.Enabled       := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;

  ContasBancrias.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;

  Dependentes.Enabled    := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fTitular;


  OutrasInformaes1.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio or
                            fDependente or fRecebedor_Pensao_Alimenticia or fAlimentado;


  //--- Vida Funcional

  DadosBasicos.Enabled    := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fDependente or fRecebedor_Beneficio;

  EvolucaoFuncional.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  HistoricoFuncional.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido;

  RubricasSalariais.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                             fParticipante_Falecido;

  //--- Vida no Plano

  Eventos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  Protocolos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  ProcessosRad.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  RUB.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario or fRecebedor_Beneficio;

  Contribuicoes.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fRecebedor_Beneficio;

                        // incluí participante ativo porque possibilita a visualização do benefício caso o participante tenha estado em benefício
  Beneficios.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado
                     or fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Processos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Pagamentos.Enabled := true;
  Contracheque.Enabled := true;
  RubricasIndividuais.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or
                            fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia or fAlimentado or fRecebedor_Beneficio;
  Beneficiarios.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fRecebedor_Beneficio;

  Enquadramento.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Emprestimo.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Autorizacao.AutorizarForm(self, afNormal);
end;


procedure TFRMconspart.FormCreate(Sender: TObject);
var Resultado : integer;
    qry : tWWquery;
begin
  bFuncef := False;   // FDias - 12.12.2003
  sIdTitular := '';
  CtrlTempoServico := TCtrlTempoServico.Create;
  CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);
// FDias - 12.12.2003 - início
  qry := twwquery.Create(nil);
  qry.DataBaseName := 'BaseDados';
  try
    qry.SQL.Add('SELECT NUMDOCUMENTO FROM PESSOA WHERE IDPESSOA = '+inttostr(Sistema.IdEmpresa));
    qry.Open;
    // COMPARA O CNPJ DA FUNDAÇÃO COM O CNPJ DA FUNCEF
    if qry.fieldbyname('NUMDOCUMENTO').asstring = '00436923000190' then Begin
       pnlHstFuncional.Caption    := 'Histórico de Tempo de Serviço';
       HistoricoFuncional.Caption := '&Histórico de Tempo de Serviço';
       bFuncef := True;
    end;
  finally
    qry.free;
  end;
// FDias - 12.12.2003 - fim

end;

procedure TFRMconspart.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sidpessoaconspart := '';
  CloseDataSets;
  dtmConsPart.Free;
  dtmConsPart := nil;
  FRMconspart.Release;
  FRMconspart := nil;
  CtrlTempoServico.Free;
end;


function TFRMconspart.ExisteForm(frm: string): Boolean;
var
   i: Integer;
begin
   Result := False;
   for i := 0 to Screen.FormCount - 1 do
      if uppercase(Screen.Forms[i].Name) = uppercase(frm) then
      begin
         Result := True;
         Break;
      end;
end;


procedure TFRMconspart.sbtnTitularClick(Sender: TObject);
begin
  dtmConsPart1.qryMessagemFiario.Close;
  twMensagem.Hide;
  FRMconspart.Refresh;
  sbtnTitular.Refresh;
  frmTitulares := TfrmTitulares.Create(FRMconspart);
  bAcessaDependente := false;
  frmTitulares.qryTitulares.Close;
  frmTitulares.qryTitulares.paramByname('IDPESSOA').asInteger := strToIntDef(sidpessoaconspart, -1);
  if not frmTitulares.qryTitulares.Prepared then frmTitulares.qryTitulares.Prepare;
    frmTitulares.qryTitulares.Open;
  frmTitulares.showModal;
  if frmTitulares.ModalResult = mrOK then
  begin
    sidpessoaconspart := frmTitulares.qryTitulares.fieldByname('IDTITULAR').asString;
    // INÍCIO - andre tavares - pendencia 16690
    sidtitular := sidpessoaconspart;
    FConsPessoaGeral.cIdTitular := sidtitular;
    FConsPessoaGeral.cIdpessoa  := sidtitular;
    // FIM - andre tavares - pendencia 16690
    fTitular := true;
    closeDatasets;// andre tavares - pendencia 16690
    if nbkElegPart.ActivePage <> 'PgDadosPessoais' then
      NBKelegpart.ActivePage := 'PgDadosPessoais';
    NBKelegpartPageChanged(Sender);
  end;
end;

procedure TFRMconspart.DblkPlanosChange(Sender: TObject);
begin

//  fecha as queries para atualizar os seus resultados com o plano selecionado
  if dtmConsPart1.qrycontribprev.Active then
    dtmConsPart1.qrycontribprev.Close;
  if dtmConsPart.qryBenef.Active then
    dtmConsPart.qryBenef.Close;
  if dtmConsPart.qryReserva.Active then
    dtmConsPart.qryReserva.Close;
  if dtmConsPart.qryHistReserva.Active then
    dtmConsPart.qryHistReserva.Close;
  if dtmConsPart.qryContribSitAtual.Active then
    dtmConsPart.qryContribSitAtual.Close;

  sidplanoprevconspart := dtmConsPart.qryPlanos.fieldByName('IDPLANOPREV').asString;
  sidpessjurconspart   := dtmConsPart.qryPlanos.fieldByName('IDPESSJUR').asString;
  sidplanoprevconspart := DblkPlanos.LookupValue;
  sseqpropostaconspart := dtmConsPart.qryPlanos.fieldByName('SEQPROPOSTA').asString;
  sIDRGELEGBENEF       := dtmConsPart.qryPlanos.fieldByName('IDRGELEGBENEF').asString;


  dbedDataCanc.readOnly := false;
  dbedDataCanc.Text     := dtmConsPart.qryPlanos.fieldByName('DATACANCELAMENTO').asString;
  dbedDataCanc.readOnly := true;

  NBKelegpartPageChanged(self);

  //início - André Tavares - pendência 15605
  if (trim(sidpessjurconspart) <> '') and (contaRegistro(dtmConsPart.dspartgeral.Dataset) > 1) then
  begin
    dtmConsPart.dspartgeral.Dataset.Filter := ' idpessjur = ' + sidpessjurconspart;
    dtmConsPart.dspartgeral.Dataset.Filtered := true;
  end
  else
  begin
    dtmConsPart.dspartgeral.Dataset.Filter := '';
    dtmConsPart.dspartgeral.Dataset.Filtered := false;
  end;
  //fim - André Tavares - pendência 15605

  if (trim(sidpessjurconspart) <> '') and (contaRegistro(dtmConsPart.qryValoresBaseDepentit) > 1) then
  begin
    dtmConsPart.qryValoresBaseDepentit.Filter := ' idpessjur = ' + sidpessjurconspart;
    dtmConsPart.qryValoresBaseDepentit.Filtered := true;
  end
  else
  begin
    dtmConsPart.qryValoresBaseDepentit.Filter := '';
    dtmConsPart.qryValoresBaseDepentit.Filtered := false;
  end;

  // andré tavares - 26/10/2004 - pendência 17825
  FiltraHistRubSal(sidpessjurconspart);
end;


// esta função foi implementada para contar o número de elegíveis a benefício
function TFRMconspart.ContaElegiveisAbeneficio :integer;
var NumElegiveis : integer;
    sSQL : string;
    bElegivel, bErro : boolean;
begin
  NumElegiveis := 0;
  bElegivel := false;
  dtmConsPart.qryPessoaLigTitular.close;
  dtmConsPart.qryPessoaLigTitular.paramByName('IDPESSOA').asInteger := strToIntDef(sIdPessoaConsPart, -1);
  dtmConsPart.qryPessoaLigTitular.Open;
  bRodandoElegibilidade := True;
  dtmConsPart.qryPessoaLigTitular.First;
  while not dtmConsPart.qryPessoaLigTitular.Eof do
  begin
    sSQL := ' SELECT  PF.DATANASC,  PF.DATAMORTE, PF.SEXO, PF.ESTCIVIL, PP.DTINICIOINSC,  '+
            '         EL.TEMPONAOCREDITADO, EL.DATAADMISSAO, EL.IDSITFUNC,                 '+
            '         EL.TEMPOSERVANTERIOR, EL.TEMPOSITESPECIAL, DE.FLGBENEFICIARIO,       '+
            '         EL.TEMPOSERVTOTAL,    EL.DATADEMISSAO, EL.DATADEMISSAO,              '+
            '         EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA, '+
            '         PP.FLGDEVEPREVIDENC, PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO,      '+
            '         PP.IDSITPART, PP.IDSITPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,        '+
            '         PP.IDPESSJUR,  PP.IDPLANOPREV, PP.INSCRICAODATA,SP.FLGINTERNO,      '+
            '         D.FLGDESIGNADO, DE.IDDEPENDENCIA, D.IDSITDEPENDENTE, DE.IDTITULAR,   '+
            '''' +DateToStr(date)+ ''' AS DATAREF, PF.NUMDEPIRRF '+
            ' FROM  ELEGPATRO EL, DEPENTIT DE, PESSOAFISICA PF, '+
            '       PARTPREVPLAN PP, SITPART SP, DEPENDENTE D '+
            ' WHERE PP.IDPESSOA    = ' + sidpessoaconspart + ' AND '+
            '       PP.SEQPROPOSTA = ' + sseqpropostaconspart + ' AND '+
            '       PP.IDPLANOPREV = ' + sidplanoprevconspart + ' AND '+
            '       PP.IDPESSJUR   = ' + sidpessjurconspart + ' AND '+
            '       DE.IDPESSOA    = ' + dtmConsPart.qryPessoaLigTitular.FieldByName('IDPESSOA').AsString + ' AND '+
            '       DE.IDPESSOA    = D.IDPESSOA AND '+
            '       EL.IDPESSOA    = PP.IDPESSOA  AND '+
            '       EL.IDPESSJUR   = PP.IDPESSJUR AND '+
            '       SP.IDSITPART   = PP.IDSITPART AND '+
            '       DE.IDTITULAR   = EL.IDPESSOA  AND '+
            '       DE.IDPESSOA    = PF.IDPESSOA(+) ';

    bElegivel := RegraBooleana(sIDRGELEGBENEF, sSQL , bErro);
    if bElegivel then
      NumElegiveis := NumElegiveis + 1;
    dtmConsPart.qryPessoaLigTitular.Next;
  end; //fim while
  bRodandoElegibilidade := False;
  ContaElegiveisAbeneficio := NumElegiveis;
end;


procedure TFRMconspart.dbgriddepenDblClick(Sender: TObject);
begin
  bAcessaDependente := true;
  sidpessoaconspart := dtmConspart.qryDepentit.fieldByname('IDPESSOA').asString;
  closeDatasets;
  fTitular := False;
  NBKelegpart.ActivePage := 'PgDadosPessoais';
end;

procedure TFRMconspart.dbgridpartprevDblClick(Sender: TObject);
begin
  bAcessaDependente := true;
  sidpessoaconspart := dtmConspart1.qrypartprev.fieldByname('IDPESSOA').asString;
  closeDatasets;
  fTitular := False;
  NBKelegpart.ActivePage := 'PgDadosPessoais';
end;

procedure TFRMconspart.HistricodeMovimentaes1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgBeneficiosHistoricoMovimentacoes';
end;

procedure TFRMconspart.Planos1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgPlanos';
end;

procedure TFRMconspart.ApplicationEventsIdle(Sender: TObject;
  var Done: Boolean);
begin
  Application.ProcessMessages;
  FRMconspart.Repaint;
end;

procedure TFRMconspart.EnquadramentoClick(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgEnquadramento';
end;


procedure TFRMconspart.wwDBGrid6CalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  // FDIAS - FUNCEF - 12.12.2002
  if (dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString = 'Sub-Total' ) or
     (dtmConsPart.qryEnqSecao2.FieldByName('DESCITEM').AsString = 'Total' ) Then
    aBrush.Color := clBtnFace;
end;


function TFRMconspart.ClienteNum(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;

end;


function TFRMconspart.BuscaValorFUNCAOConsEleg  ( piIdPessJur,
                                     piIdFuncao             : longint;
                                     psData                 : string   ) : double;
var iIdGrupoFunc : longint;
  qryAuxLocal : TwwQuery;
begin
   Result := 0;
   qryAuxLocal := TwwQuery.Create(nil);
   qryAuxLocal.DataBaseName := 'BaseDados';
   try
     // Buscar o grupo que a funcao estava na data indicada
     with qryAuxLocal do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT IDGRUPOFUNC FROM GRUPOCARGOEXT  '+
                ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                ' AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                ' AND    DATAVIGENCIA   = ( SELECT MAX(DATAVIGENCIA) '+
                '                           FROM GRUPOCARGOEXT       '+
                '                           WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                '                           AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                '                           AND    DATAVIGENCIA   <= TO_DATE('''+psData+''',''DD/MM/YYYY'')      '+
                '                           AND    ((DATAFIM      >= TO_DATE('''+psData+''',''DD/MM/YYYY'') ) OR '+
                '                                    (DATAFIM      IS NULL) ) ) ');
        Open;
        if not IsEmpty
        then begin
           iIdGrupoFunc := FieldByName('IDGRUPOFUNC').AsInteger;
           Close;
           SQL.Clear;
           SQL.Add(' SELECT VALOR FROM FAIXAGRUPO  '+
                   ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                   ' AND    IDGRUPOFUNC    =  '+IntToStr(iIdGrupoFunc)+
                   ' AND    DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO) '+
                   '                          FROM   FAIXAGRUPO            '+
                   ' 			 WHERE  IDPESSJUR      = '+IntToStr(piIdPessJur)+
                   '                          AND    IDGRUPOFUNC    =  '+IntToStr(iIdGrupoFunc)+
                   ' 			 AND    DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
           Open;
           if not IsEmpty
           then Result := FieldByName('VALOR').AsFloat;
           Close;
        end
        else begin // Funcao não tem grupo. Verificar se ela tem valor na tabela de funcao sem grupo
           Close;
           SQL.Clear;
           SQL.Add(' SELECT VALOR FROM FAIXAFUNCAO  '+
                   ' WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                   ' AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                   ' AND    DATAEFETIVACAO = (SELECT MAX(DATAEFETIVACAO) '+
                   '                          FROM   FAIXAFUNCAO          '+
                   ' 			                 WHERE  IDPESSJUR      =  '+IntToStr(piIdPessJur)+
                   '                          AND    IDCARGOEXT     =  '+IntToStr(piIdFuncao)+
                   ' 			                 AND    DATAEFETIVACAO <= TO_DATE('''+psData+''', ''DD/MM/YYYY'') ) ');
           Open;
           if not IsEmpty
           then Result := FieldByName('VALOR').AsFloat;
           Close;
        end;
     end;
   finally
     qryAuxLocal.Free;
   end;
end;



procedure TFRMconspart.MsgErro(sMsg: String);
begin
  ShowMessage( sMsg );
end;



procedure TFRMconspart.dbgrHistReservaTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  dtmConsPart.CdsHistReserva.IndexFieldNames := aFieldName;
end;


procedure TFRMconspart.AcaoJudicialClick(Sender: TObject);
begin
    NBKelegpart.ActivePage := 'PgAcaoJudicial';
end;


//início - André Tavares - pendência 15211 - 20/10/2003
procedure TFRMconspart.DadosparaEnquadramento1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'pgDadosParaEnquadramento'
end;


function TFRMconspart.BuscaValorCARGO (  piIdCargo, pIdPessjur : longint ) : double;
var  qryAux : Twwquery;
     sIdPessjur, sIdCargoExt, sDataVigencia : string;
begin
   sIdPessjur    := '';
   sIdCargoExt   := '';
   sDataVigencia := '';
   qryAux := Twwquery.Create(nil);
   qryAux.DataBaseName := 'BaseDados';
   Result := 0;
   qryAux.sql.Clear;
   qryAux.Sql.Add (' SELECT NVL(C.IDCARGOEXT, -1) as IDCARGOEXT, C.CODIGO, C.TITULO, C.TIPO, C.JORNADA, C.FLGATIVO, ');
   qryAux.Sql.Add ('        C.NOMERESUMIDO, C.CBO, NVL(C.IDPESSJUR, -1) as IDPESSJUR,       ');
   qryAux.Sql.Add ('        DECODE(C.FLGATIVO, 1, ''Ativa'', 0, ''Desativada'', 2 , ''Em Extinção'') AS SITUACAO, ');
   qryAux.Sql.Add ('        CAR.CODIGO AS CODCARREIRA, CAR.NOME AS NOMECARREIRA, PCS.CODIGO AS CODPCS, N.CODIGO AS NIVEL, ');
   qryAux.Sql.Add ('        N.IDNIVEL, PCS.NOME AS NOMEPCS,');
   qryAux.Sql.Add ('        MAX(CN.DATAVIGENCIA) AS DATAVIGENCIA');
   qryAux.Sql.Add ('        FROM   CARGOEXT C, CARREIRA CAR, PCS PCS, NIVEL N, CARGOXNIVEL CN');
   qryAux.Sql.Add ('        WHERE  C.IDPESSJUR   = '+ intToStr(pIdpessjur));
   qryAux.Sql.Add ('        AND    C.IDCARGOEXT  = '+ intToStr(piIdCargo));
   qryAux.Sql.Add ('        AND    C.TIPO        = ''C''');
   qryAux.Sql.Add ('        AND    CAR.IDCARREIRA(+)  = C.IDCARREIRA');
   qryAux.Sql.Add ('        AND    PCS.IDPCS(+)       = C.IDPCS');
   qryAux.Sql.Add ('        AND    CN.IDPESSJUR(+)    = C.IDPESSJUR');
   qryAux.Sql.Add ('        AND    CN.IDCARGOEXT(+)   = C.IDCARGOEXT');
   qryAux.Sql.Add ('        AND    CN.IDNIVEL      = N.IDNIVEL(+)');
   qryAux.Sql.Add ('        GROUP BY C.IDCARGOEXT,C.CODIGO, C.TITULO, C.TIPO, C.JORNADA, C.FLGATIVO,');
   qryAux.Sql.Add ('                 C.NOMERESUMIDO, C.CBO, C.FLGATIVO, CAR.CODIGO,CAR.NOME, C.IDPESSJUR, PCS.CODIGO, N.IDNIVEL,');
   qryAux.Sql.Add ('                 PCS.NOME , N.CODIGO');
   qryAux.Sql.Add ('        ORDER BY C.CODIGO');
   qryAux.Open;

   sIdPessjur    := qryAux.fieldByName('IDPESSJUR').asString;
   sIdCargoExt   := qryAux.fieldByName('IDCARGOEXT').asString;
   sDataVigencia := qryAux.fieldByName('DATAVIGENCIA').asString;

   if trim(sIdPessjur) = '' then
     sIdPessjur := '-1';
   if trim(sIdCargoExt) = '' then
     sIdCargoExt := '-1';
   if trim(sDataVigencia) = '' then
     sDataVigencia := dateToStr(date);


   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT FN.VALOR FROM FAIXANIVEL FN, CARGOXNIVEL C '+
              ' WHERE  C.IDPESSJUR    = '+ sIdPessjur +
              ' AND    C.IDCARGOEXT   = '+ sIdCargoExt +
              ' AND    C.DATAVIGENCIA = TO_DATE('''+sDataVigencia+''', ''DD/MM/YYYY'')  '+
              ' AND    FN.IDPESSJUR   = C.IDPESSJURNIVEL '+
              ' AND    FN.IDNIVEL     = C.IDNIVEL '+
              ' AND    FN.DATAEFETIVACAO = (SELECT MAX(FN.DATAEFETIVACAO) '+
              '                             FROM FAIXANIVEL FN, CARGOXNIVEL C       '+
              ' 	        	    WHERE  C.IDPESSJUR    = '+ sIdPessjur +
              '                             AND    C.IDCARGOEXT   = '+IntToStr(piIdCargo)+
              '                             AND    C.DATAVIGENCIA = TO_DATE('''+sDataVigencia+''', ''DD/MM/YYYY'')  '+
              '                             AND    FN.IDPESSJUR   = C.IDPESSJURNIVEL '+
              ' 			    AND    FN.IDNIVEL     = C.IDNIVEL '+
              ' 			    AND    FN.DATAEFETIVACAO <= TO_DATE('''+DateToStr(date)+''', ''DD/MM/YYYY'') ) ');
      Open;
      if not IsEmpty
      then Result := FieldByName('VALOR').AsFloat;
      Close;
   end;
   qryAux.Free;
end;



procedure TFRMconspart.FiltraHistMovReserva;
var sFiltro :string;
begin
  sFiltro := '';
  if dtmConsPart.cDSHistReserva.Active then
  begin
    if (trim(dbLkMesInicial.Text) <> '') and (trim(dbLkMesFinal.Text) <> '') then
    begin
      sFiltro := 'MESREFERENCIA >= '+ quotedStr(dbLkMesInicial.LookupValue)+
                 ' AND  MESREFERENCIA <= '+ quotedStr(dbLkMesFinal.LookupValue);
    end
    else if (trim(dbLkMesInicial.Text) = '') and (trim(dbLkMesFinal.Text) <> '') then
    begin
      sFiltro := ' MESREFERENCIA <= '+ quotedStr(dbLkMesFinal.LookupValue);
    end
    else if (trim(dbLkMesInicial.Text) <> '') and (trim(dbLkMesFinal.Text) = '') then
    begin
      sFiltro := ' MESREFERENCIA <= '+ quotedStr(dbLkMesInicial.LookupValue);
    end;

    if trim(dblkNomeReserva.text) <> '' then
    begin
      if sFiltro = '' then
        sFiltro := ' NOME like ' + '''' + dblkNomeReserva.LookupValue + '%'+''''
      else
        sFiltro := sFiltro + ' AND NOME like ' + '''' + dblkNomeReserva.LookupValue + '%'+'''';
    end;

    dtmConsPart.cDSHistReserva.Filter   := sFiltro;
    dtmConsPart.cDSHistReserva.Filtered := true;
  end;
end;

procedure TFRMconspart.dbLkMesInicialChange(Sender: TObject);
begin
  FiltraHistMovReserva;
  TotalizaReserva;
end;

procedure TFRMconspart.DblkMesFinalChange(Sender: TObject);
begin
  FiltraHistMovReserva;
  TotalizaReserva;
end;

procedure TFRMconspart.dblkNomeReservaChange(Sender: TObject);
begin
  FiltraHistMovReserva;
  TotalizaReserva;
end;

//fim - André Tavares - pendência 15211 - 20/10/2003

procedure TFRMconspart.TotalizaReserva;
Var vlrindice : Double;
    _qryAux : Twwquery;
begin
  if not dtmConsPart.CdsHistReserva.Active then
    exit;
  lblTotal.Caption         := 'Saldo Total R$ ';
  LblTotalControle.Caption := 'Saldo Total de Res. de Controle R$ ';
  TotSdoResCtrl := 0;
  TotalSaldo    := 0;
  dtmConsPart.CdsHistReserva.disableControls;
  dtmConsPart.CdsHistReserva.first;
  vlrindice := dtmConsPart.CdsHistReservaVALORINDICE.AsFloat;

  while not dtmConsPart.CdsHistReserva.Eof do
  begin
    if (dtmConsPart.CdsHistReservaFLGCOLETIVA.asInteger = 0) or
       (dtmConsPart.CdsHistReservaFLGCOLETIVA.isnull) then
    begin
      if dtmConsPart.CdsHistReservaFLGCONTROLE.asInteger = 0 then
        if dtmConsPart.CdsHistReservaFLGENTRADA.AsString = 'E' Then  //FDias - 12.12.2003
          if not bFuncef then
            TotalSaldo := TotalSaldo + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat
          else
            TotalSaldo := TotalSaldo + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('COTVALOR').asFloat
        else
//início - andre tavares - 12/04/2004 - pendencia 16681
          if not bFuncef then
            TotalSaldo := TotalSaldo - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat)
          else
            TotalSaldo := TotalSaldo - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('COTVALOR').asFloat)
//fim - andre tavares - 12/04/2004 - pendencia 16681
      else if (dtmConsPart.CdsHistReservaFLGTITULARCOLET.asString   = 'T') then
      begin
        if dtmConsPart.CdsHistReservaFLGENTRADA.AsString = 'E' Then  //FDias - 12.12.2003
          if not bFuncef then
            TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat
          else
            TotSdoResCtrl := TotSdoResCtrl + dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('COTVALOR').asFloat
        else
//início - andre tavares - 12/04/2004 - pendencia 16681
          if not bFuncef then
            TotSdoResCtrl := TotSdoResCtrl - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat)
          else
            TotSdoResCtrl := TotSdoResCtrl - abs(dtmConsPart.CdsHistReservaVLRCOTAS.asFloat * dtmConsPart.CdsHistReserva.fieldByName('cotvalor').asFloat)

//fim - andre tavares - 12/04/2004 - pendencia 16681
      end;
    end;
    dtmConsPart.CdsHistReserva.Next;
  end;
  if not bFuncef then
  begin
    TotalSaldoReal    := vlrindice * TotalSaldo;
    TotSdoResCtrlReal := vlrindice * TotSdoResCtrl;
  end else
  begin
    TotalSaldoReal    := TotalSaldo;
    TotSdoResCtrlReal := TotSdoResCtrl;
  end;
  dtmConsPart.CdsHistReserva.first;
  dtmConsPart.CdsHistReserva.EnableControls;
  if not bFuncef then
  begin
    lblTotal.Caption         := lblTotal.Caption + FormatFloat('#,##0.00', TotalSaldoReal) +
                                ' / ' + FormatFloat('#,##0.00', TotalSaldo) + ' Cotas (' +
                                FormatFloat('#,##0.00', vlrindice) + ')';
    LblTotalControle.Caption := LblTotalControle.Caption + FormatFloat('#,##0.00', TotSdoResCtrlReal) +
                                ' / ' + FormatFloat('#,##0.00', TotSdoResCtrl) + ' Cotas ('+
                                FormatFloat('#,##0.00', vlrindice) + ')';
  end else
  begin
    lblTotal.Caption         := lblTotal.Caption + FormatFloat('#,##0.00', TotalSaldoReal) +
                                ' / ' + FormatFloat('#,##0.00', TotalSaldo);
    LblTotalControle.Caption := LblTotalControle.Caption + FormatFloat('#,##0.00', TotSdoResCtrlReal) +
                                ' / ' + FormatFloat('#,##0.00', TotSdoResCtrl);
  end;
end;



// André Tavares - Implementei esta função porque a propriedade
// RecordCount do Dataset surpreendentemente não funciona!!
function TFRMconspart.ContaRegistro(qry: TdataSet): integer;
begin
  result := 0;
  if not qry.Active then
    exit;
  qry.DisableControls;
  qry.Filter := '';
  qry.Filtered := false;
  qry.First;
  while not qry.eof do
  begin
    result := result + 1;
    qry.Next;
  end;
  qry.EnableControls;
  qry.First;
end;

// André Tavares - 27/11/2003 - pendência 15543
// pega a primeira data de inscrição na fundação
function TFRMconspart.BuscaDtEntrada(pIdPessoa, pIdpessjur, pIdPlanoprev: integer): TdateTime;
var qry : tWWquery;
begin
  result := 0;
  qry := twwquery.Create(nil);
  qry.DataBaseName := 'BaseDados';
  try
// início andré tavares - 25/02/2003 - pendência 16109
    qry.Close;
    qry.sql.clear;
    qry.sql.add(' SELECT EP.IDPESSOA, EP.IDPLANOPREV, EP.IDPESSJUR, TO_CHAR(EP.DATAEVENTO, ''DD/MM/YYYY'') AS DATAMIGRACAO ');
    qry.sql.add(' FROM EVENTOGERADOR EG, EVENTOSPREV EP, PARTPREVPLAN PP ');
    qry.sql.add(' WHERE EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ');
    qry.sql.add(' EG.FLGINTERNO <> ''TP'' AND ');
    qry.sql.add(' EP. IDPESSOA = ' + intToStr(pIdpessoa) + ' AND ' );
    qry.sql.add(' PP.IDPESSOA = EP.IDPESSOA AND ');
    qry.sql.add(' PP.IDPLANOPREV = EP.IDPLANOPREV AND ');
    qry.sql.add(' PP.IDPESSJUR = EP.IDPESSJUR  AND ');
    qry.sql.add(' PP.FLGDESATIVADO = 1 ');
    qry.Open;
    // se houve migração
    if not qry.IsEmpty then
     begin
       qry.Close;
       qry.Sql.Clear;
// fim andré tavares - 25/02/2003 - pendência 16109
       qry.sql.add('SELECT MIN(INSCRICAODATA) AS INSCRICAODATA, DATACANCELAMENTO ');
       qry.sql.add('FROM PARTPREVPLAN WHERE IDPESSOA = ' + intToStr(pIdpessoa)    );
       qry.sql.add(' AND IDPESSJUR                   = ' + intToStr(pIdpessjur)   );
       qry.sql.add(' AND IDPLANOPREV = '+ intTostr(pIdPlanoprev)                  );
       qry.sql.add('GROUP BY DATACANCELAMENTO                                    ');
       qry.Open;
       result := qry.fieldByName('INSCRICAODATA').asDateTime;
// início andré tavares - 25/02/2003 - pendência 16109
     end
     else
     begin
       qry.Close;
       qry.Sql.Clear;
       qry.sql.add('SELECT INSCRICAODATA, DATACANCELAMENTO                       ');
       qry.sql.add('FROM PARTPREVPLAN WHERE IDPESSOA = ' + intToStr(pIdpessoa)    );
       qry.sql.add(' AND IDPESSJUR                   = ' + intToStr(pIdpessjur)   );
       qry.sql.add(' AND FLGDESATIVADO = 0                                       ');
       qry.Open;
       result := qry.fieldByName('INSCRICAODATA').asDateTime;
     end;
// fim andré tavares - 25/02/2003 - pendência 16109
  finally
    qry.free;
  end;
end;

procedure TFRMconspart.Parcelamento1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'Parcelamento';
end;

procedure TFRMconspart.wwDBGrid4RowChanged(Sender: TObject);
begin
  dtmConsPart.qryhstEmprestimo.Close;
  dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsFloat :=
  dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsFloat;
  dtmConsPart.qryhstEmprestimo.Open;
end;

procedure TFRMconspart.OutrasInformaes1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'OutrasInformacoes';
end;

procedure TFRMconspart.dblkPatrosCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  FiltraHistRubSal(dblkPatros.LookupValue);
end;

procedure TFRMconspart.FiltraHistRubSal(sIdpessjur: string);
begin
  dtmConsPart.qryHstRubricas.Filtered := false;
  if trim(sIdPessjur) <> '' then
  begin
    dtmConsPart.qryHstRubricas.Filter := ' IDPESSJUR = ' + sIdPessjur;
    dtmConsPart.qryHstRubricas.Filtered := true;
  end;
end;

function TFRMconspart.GetMatricula: string;
var  qry : TwwQuery;
begin
  result := '******';
  qry := Twwquery.Create(nil);
  qry.DataBaseName := 'BaseDados';
  qry.Close;
  qry.sql.text := ' select matricula from depentit where idpessoa = '+ intToStr(StrtoIntDef(sIdPessoaConsPart, -1))+
                  ' and idtitular = '+ intToStr(StrtoIntDef(sIdTitular, -1));
  qry.Open;
  if trim(qry.FieldByName('MATRICULA').asString) = '' then
  begin
    qry.Close;
    qry.sql.text := ' select matricula from elegpatro where idpessoa = ' + intToStr(StrtoIntDef(sIdTitular, -1));
    qry.Open;
  end;
  result := qry.FieldByName('MATRICULA').asString;
  qry.Free;
end;

procedure TFRMconspart.BitBtn1Click(Sender: TObject);
begin
  inherited;
  twMensagem.Visible := false;
  dtmConsPart1.qryMessagemFiario.Next;
  if not dtmConsPart1.qryMessagemFiario.eof then
  begin
    reditMSG.text := dtmConsPart1.qryMessagemFiario.fieldByName('DESCRICAO').asString;
    twMensagem.Visible := true;
  end;
end;

procedure TFRMconspart.twMensagemVisibleChanged(Sender: TObject);
begin
  inherited;
  twMensagem.left := (FRMconspart.width - twMensagem.width) div 2;
  twMensagem.top  := (FRMconspart.height - twMensagem.height) div 2;
end;

procedure TFRMconspart.VidaNaFundao1Click(Sender: TObject);
begin
  NBKelegpart.ActivePage := 'PgVidaNaFundacao';
end;

end.


