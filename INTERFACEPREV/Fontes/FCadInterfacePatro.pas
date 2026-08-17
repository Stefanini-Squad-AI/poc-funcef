// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Leo
// Data        : 10.03.2006
// Pendência   : 21713
// Rotina      :
// Alteração   : Inclusão do tratamento da data final de filiais EDTELDDTAM, e EDTELDDDINI 
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 19.10.2005
// Pendência   : 20449
// Rotina      :
// Alteração   : Inclusão do tratamento da data final de filiais TBLOCALDTFIMINI, TBLOCALDTFIMTAM e TBLOCALDTFIMFMT 
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 25.05.2004
// Alteração   : Inclusão do tratamento da taxa de contribuição TAMEQUIPARACAO e INIEQUIPARACAO
//------------------------------------------------------------------------------
// Autor(a)    : Leo
// Data        : 02.12.2004
// Alteração   : Inclusão do tratamento da taxa de contribuição EVTAXAINI e EVTAXATAM
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 02.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : ---
// Autor(a)    : Leo
// Data        : 26/06/2003
// Alteração   : Criação de mais um item no layout cadastral - email
//------------------------------------------------------------------------------
// Rotina      : ---
// Autor(a)    : Gleyber
// Data        : 17/06/2003
// Alteração   : Criação de mais um item p/rubrica duplicada (dbcRubricaAtraso)
//------------------------------------------------------------------------------
unit FCadInterfacePatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, wwdbedit, Mask, Wwdotdot, Wwdbcomb, IvDictio,
  IvMulti, IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery,
  TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, DBCtrls, TREdit,
  wwdblook, ComCtrls, CmEventosCadastro, ImgList, fcOutlookList, fcButton,
  fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, fcOutlookBar;

type
  TfrmCadInterfacePatro = class(TfrmCadastroCS)
    odTxt: TOpenDialog;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    bbtnTeste: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryPatroCombo: TwwQuery;
    ScrollBox1: TScrollBox;
    qryTipoDocPessoa: TwwQuery;
    pnlTabRubricas: TPanel;
    GroupBox55: TGroupBox;
    Label159: TLabel;
    Label160: TLabel;
    DBRealEdit71: TDBRealEdit;
    DBRealEdit72: TDBRealEdit;
    GroupBox56: TGroupBox;
    Label154: TLabel;
    Label162: TLabel;
    DBRealEdit73: TDBRealEdit;
    DBRealEdit74: TDBRealEdit;
    GroupBox57: TGroupBox;
    Label163: TLabel;
    Label164: TLabel;
    DBRealEdit75: TDBRealEdit;
    DBRealEdit76: TDBRealEdit;
    GroupBox58: TGroupBox;
    Label165: TLabel;
    Label166: TLabel;
    DBRealEdit77: TDBRealEdit;
    DBRealEdit78: TDBRealEdit;
    GroupBox79: TGroupBox;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    wwDBEdit17: TwwDBEdit;
    wwDBEdit18: TwwDBEdit;
    wwDBEdit13: TwwDBEdit;
    GroupBox85: TGroupBox;
    Label234: TLabel;
    Label239: TLabel;
    DBRealEdit118: TDBRealEdit;
    DBRealEdit119: TDBRealEdit;
    fcOutOp: TfcOutlookBar;
    OutOpIFinanc: TfcShapeBtn;
    OutOpICadastral: TfcShapeBtn;
    OutOpITabelas: TfcShapeBtn;
    OutOpiTestes: TfcShapeBtn;
    OpFinanc: TfcOutlookList;
    OpCadastral: TfcOutlookList;
    opTabelas: TfcOutlookList;
    opTestes: TfcOutlookList;
    pnlRubricas: TPanel;
    pgcRubricas: TPageControl;
    tbsRubricas1: TTabSheet;
    GroupBox11: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    edtTamSequencia: TwwDBEdit;
    edtIniSequencia: TwwDBEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    edtTamPatro: TwwDBEdit;
    edtIniPatro: TwwDBEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtTamPlano: TwwDBEdit;
    edtIniPlano: TwwDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    edtTamValorChave: TwwDBEdit;
    edtIniValorChave: TwwDBEdit;
    GroupBox6: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    edtTamChave: TwwDBEdit;
    edtIniChave: TwwDBEdit;
    GroupBox10: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    edtTamSalPart: TwwDBEdit;
    edtIniSalPart: TwwDBEdit;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edtTamValProvento: TwwDBEdit;
    edtIniValProvento: TwwDBEdit;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    edtTamProvento: TwwDBEdit;
    edtIniProvento: TwwDBEdit;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    edtTamMesRef: TwwDBEdit;
    edtIniMesRef: TwwDBEdit;
    GroupBox9: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    edtTamDataReferencia: TwwDBEdit;
    edtIniDataReferencia: TwwDBEdit;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edtTamMesCob: TwwDBEdit;
    edtIniMesCob: TwwDBEdit;
    GroupBox13: TGroupBox;
    Formato: TLabel;
    wwDBEdit23: TwwDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    gbTipoDec: TGroupBox;
    lblNumDec: TLabel;
    dbrgTipoDec: TDBRadioGroup;
    dbreNumDec: TDBRealEdit;
    DBRadioGroup3: TDBRadioGroup;
    dbrAtrasoReferencia: TDBRadioGroup;
    tbsRubricas2: TTabSheet;
    GroupBox73: TGroupBox;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit7: TwwDBEdit;
    DBRealEdit106: TDBRealEdit;
    dbgrpChave: TDBRadioGroup;
    GroupBox61: TGroupBox;
    Label169: TLabel;
    dbchkLancamento: TDBCheckBox;
    dbrPosLancamento: TDBRealEdit;
    grpbxCabecalhoRodape: TGroupBox;
    dbchkCabecalho: TDBCheckBox;
    dbchkRodape: TDBCheckBox;
    pnlDadosCad: TPanel;
    pgcDadosCad: TPageControl;
    TabSheet25: TTabSheet;
    GroupBox14: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    DBRealEdit2: TDBRealEdit;
    DBRealEdit1: TDBRealEdit;
    GroupBox15: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    DBRealEdit3: TDBRealEdit;
    DBRealEdit4: TDBRealEdit;
    GroupBox19: TGroupBox;
    Label73: TLabel;
    Label74: TLabel;
    DBRealEdit19: TDBRealEdit;
    DBRealEdit20: TDBRealEdit;
    GroupBox20: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    DBRealEdit17: TDBRealEdit;
    DBRealEdit18: TDBRealEdit;
    GroupBox21: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    DBRealEdit15: TDBRealEdit;
    DBRealEdit16: TDBRealEdit;
    GroupBox22: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    eddtdemissaotam: TDBRealEdit;
    eddtdemissaoini: TDBRealEdit;
    GroupBox48: TGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    edftdtnascimento: TwwDBEdit;
    edftdtadmissao: TwwDBEdit;
    grpbxNmMae: TGroupBox;
    Label263: TLabel;
    Label264: TLabel;
    edtamnmmae: TDBRealEdit;
    edininmmae: TDBRealEdit;
    grpbxNmPai: TGroupBox;
    Label265: TLabel;
    Label266: TLabel;
    edtamnmpai: TDBRealEdit;
    edininmpai: TDBRealEdit;
    GroupBox74: TGroupBox;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    wwDBEdit5: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    DBRealEdit107: TDBRealEdit;
    DBRadioGroup7: TDBRadioGroup;
    TabSheet26: TTabSheet;
    grpbxIdentidade: TGroupBox;
    GroupBox101: TGroupBox;
    Label267: TLabel;
    Label268: TLabel;
    edtamufident: TDBRealEdit;
    ediniufident: TDBRealEdit;
    GroupBox102: TGroupBox;
    Label269: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    edtamdtexpident: TDBRealEdit;
    edinidtexpident: TDBRealEdit;
    edftdtexpident: TwwDBEdit;
    GroupBox100: TGroupBox;
    Label261: TLabel;
    Label262: TLabel;
    edtamnumident: TDBRealEdit;
    edininumident: TDBRealEdit;
    cmbTipoDocPessoa: TwwDBLookupCombo;
    GroupBox25: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    DBRealEdit23: TDBRealEdit;
    DBRealEdit24: TDBRealEdit;
    TabSheet27: TTabSheet;
    GroupBox26: TGroupBox;
    Label87: TLabel;
    Label88: TLabel;
    DBRealEdit25: TDBRealEdit;
    DBRealEdit26: TDBRealEdit;
    GroupBox27: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    DBRealEdit27: TDBRealEdit;
    DBRealEdit28: TDBRealEdit;
    GroupBox104: TGroupBox;
    Label284: TLabel;
    Label288: TLabel;
    edinitpservtot: TDBRealEdit;
    edtamtpservtot: TDBRealEdit;
    GroupBox105: TGroupBox;
    Label289: TLabel;
    Label290: TLabel;
    edinitpservcred: TDBRealEdit;
    edtamtpservcred: TDBRealEdit;
    pnlLotacoes: TPanel;
    GroupBox28: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    DBRealEdit29: TDBRealEdit;
    DBRealEdit30: TDBRealEdit;
    GroupBox29: TGroupBox;
    Label93: TLabel;
    Label94: TLabel;
    DBRealEdit31: TDBRealEdit;
    DBRealEdit32: TDBRealEdit;
    GroupBox30: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    DBRealEdit33: TDBRealEdit;
    DBRealEdit34: TDBRealEdit;
    GroupBox31: TGroupBox;
    Label97: TLabel;
    Label98: TLabel;
    DBRealEdit35: TDBRealEdit;
    DBRealEdit36: TDBRealEdit;
    GroupBox75: TGroupBox;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    wwDBEdit9: TwwDBEdit;
    wwDBEdit10: TwwDBEdit;
    DBRealEdit108: TDBRealEdit;
    DBRadioGroup9: TDBRadioGroup;
    pnlEndereco: TPanel;
    GroupBox32: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    DBRealEdit37: TDBRealEdit;
    DBRealEdit38: TDBRealEdit;
    GroupBox34: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    DBRealEdit39: TDBRealEdit;
    DBRealEdit40: TDBRealEdit;
    GroupBox35: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    DBRealEdit41: TDBRealEdit;
    DBRealEdit42: TDBRealEdit;
    GroupBox36: TGroupBox;
    Label107: TLabel;
    Label108: TLabel;
    DBRealEdit43: TDBRealEdit;
    DBRealEdit44: TDBRealEdit;
    GroupBox37: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    DBRealEdit45: TDBRealEdit;
    DBRealEdit46: TDBRealEdit;
    GroupBox38: TGroupBox;
    Label111: TLabel;
    Label112: TLabel;
    DBRealEdit47: TDBRealEdit;
    DBRealEdit48: TDBRealEdit;
    GroupBox39: TGroupBox;
    Label113: TLabel;
    Label114: TLabel;
    DBRealEdit49: TDBRealEdit;
    DBRealEdit50: TDBRealEdit;
    GroupBox40: TGroupBox;
    Label115: TLabel;
    Label116: TLabel;
    DBRealEdit51: TDBRealEdit;
    DBRealEdit52: TDBRealEdit;
    GroupBox76: TGroupBox;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit12: TwwDBEdit;
    DBRealEdit109: TDBRealEdit;
    DBRadioGroup10: TDBRadioGroup;
    pnlEventos: TPanel;
    GroupBox41: TGroupBox;
    Label117: TLabel;
    Label118: TLabel;
    DBRealEdit53: TDBRealEdit;
    DBRealEdit54: TDBRealEdit;
    GroupBox42: TGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    DBRealEdit55: TDBRealEdit;
    DBRealEdit56: TDBRealEdit;
    GroupBox45: TGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    DBRealEdit61: TDBRealEdit;
    DBRealEdit62: TDBRealEdit;
    GroupBox46: TGroupBox;
    Label127: TLabel;
    Label128: TLabel;
    DBRealEdit63: TDBRealEdit;
    DBRealEdit64: TDBRealEdit;
    GroupBox47: TGroupBox;
    Label129: TLabel;
    Label130: TLabel;
    DBRealEdit65: TDBRealEdit;
    DBRealEdit66: TDBRealEdit;
    GroupBox49: TGroupBox;
    Inicio: TLabel;
    Label134: TLabel;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    GroupBox78: TGroupBox;
    Label211: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    wwDBEdit15: TwwDBEdit;
    wwDBEdit16: TwwDBEdit;
    DBRealEdit111: TDBRealEdit;
    DBRadioGroup11: TDBRadioGroup;
    pnlTabBancos: TPanel;
    GroupBox70: TGroupBox;
    GroupBox51: TGroupBox;
    Label190: TLabel;
    Label189: TLabel;
    DBRealEdit100: TDBRealEdit;
    DBRealEdit101: TDBRealEdit;
    GroupBox71: TGroupBox;
    Label191: TLabel;
    Label192: TLabel;
    DBRealEdit102: TDBRealEdit;
    DBRealEdit103: TDBRealEdit;
    GroupBox80: TGroupBox;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    wwDBEdit19: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    wwDBEdit14: TwwDBEdit;
    GroupBox77: TGroupBox;
    GroupBox72: TGroupBox;
    Label193: TLabel;
    Label194: TLabel;
    DBRealEdit104: TDBRealEdit;
    DBRealEdit105: TDBRealEdit;
    GroupBox50: TGroupBox;
    Label123: TLabel;
    Label124: TLabel;
    DBRealEdit57: TDBRealEdit;
    DBRealEdit58: TDBRealEdit;
    pnlTabCargo: TPanel;
    GroupBox67: TGroupBox;
    Label178: TLabel;
    Label179: TLabel;
    DBRealEdit95: TDBRealEdit;
    DBRealEdit96: TDBRealEdit;
    GroupBox68: TGroupBox;
    Label180: TLabel;
    Label181: TLabel;
    DBRealEdit97: TDBRealEdit;
    DBRealEdit98: TDBRealEdit;
    GroupBox81: TGroupBox;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    wwDBEdit21: TwwDBEdit;
    wwDBEdit22: TwwDBEdit;
    wwDBEdit30: TwwDBEdit;
    pnlTabNivel: TPanel;
    GroupBox65: TGroupBox;
    Label174: TLabel;
    Label175: TLabel;
    DBRealEdit91: TDBRealEdit;
    DBRealEdit92: TDBRealEdit;
    GroupBox66: TGroupBox;
    Label176: TLabel;
    Label177: TLabel;
    DBRealEdit93: TDBRealEdit;
    DBRealEdit94: TDBRealEdit;
    GroupBox69: TGroupBox;
    Label188: TLabel;
    DBRadioGroup6: TDBRadioGroup;
    DBRealEdit99: TDBRealEdit;
    GroupBox82: TGroupBox;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    wwDBEdit24: TwwDBEdit;
    wwDBEdit25: TwwDBEdit;
    wwDBEdit31: TwwDBEdit;
    GroupBox86: TGroupBox;
    Label240: TLabel;
    Label241: TLabel;
    DBRealEdit120: TDBRealEdit;
    DBRealEdit121: TDBRealEdit;
    GroupBox87: TGroupBox;
    Label242: TLabel;
    Label243: TLabel;
    DBRealEdit122: TDBRealEdit;
    DBRealEdit123: TDBRealEdit;
    pnlTabOrgao: TPanel;
    GroupBox60: TGroupBox;
    Label157: TLabel;
    Label158: TLabel;
    DBRealEdit83: TDBRealEdit;
    DBRealEdit84: TDBRealEdit;
    GroupBox63: TGroupBox;
    Label161: TLabel;
    Label167: TLabel;
    DBRealEdit85: TDBRealEdit;
    DBRealEdit86: TDBRealEdit;
    GroupBox64: TGroupBox;
    Label168: TLabel;
    Label173: TLabel;
    DBRealEdit89: TDBRealEdit;
    DBRealEdit90: TDBRealEdit;
    GroupBox83: TGroupBox;
    Label226: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    wwDBEdit26: TwwDBEdit;
    wwDBEdit27: TwwDBEdit;
    wwDBEdit32: TwwDBEdit;
    pnlTabSituacao: TPanel;
    GroupBox59: TGroupBox;
    Label155: TLabel;
    Label156: TLabel;
    DBRealEdit79: TDBRealEdit;
    DBRealEdit80: TDBRealEdit;
    GroupBox62: TGroupBox;
    Label171: TLabel;
    Label172: TLabel;
    DBRealEdit81: TDBRealEdit;
    DBRealEdit82: TDBRealEdit;
    GroupBox84: TGroupBox;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    wwDBEdit28: TwwDBEdit;
    wwDBEdit29: TwwDBEdit;
    wwDBEdit33: TwwDBEdit;
    pnlTabLocais: TPanel;
    GroupBox95: TGroupBox;
    Label135: TLabel;
    Label136: TLabel;
    dbreLocalCodTam: TDBRealEdit;
    dbreLocalCodIni: TDBRealEdit;
    GroupBox96: TGroupBox;
    Label137: TLabel;
    Label152: TLabel;
    dbreLocalDescTam: TDBRealEdit;
    dbreLocalDescIni: TDBRealEdit;
    pnlTesteCadastral: TPanel;
    pgctrTesteDadosCad: TPageControl;
    tbdadoscad: TTabSheet;
    Label148: TLabel;
    SpeedButton1: TSpeedButton;
    GroupBox52: TGroupBox;
    ScrollBox2: TScrollBox;
    Label138: TLabel;
    Label139: TLabel;
    Banco: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    lbldcmatricula: TLabel;
    lbldcIncricao: TLabel;
    lbldcfator: TLabel;
    lbldcBanco: TLabel;
    lbldcAgencia: TLabel;
    lblCC: TLabel;
    Label151: TLabel;
    Nome: TLabel;
    lblDTADM: TLabel;
    lbldtNasc: TLabel;
    Sexo: TLabel;
    dependente: TLabel;
    lblEmpregado: TLabel;
    lblSexo: TLabel;
    lbldep: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Nivel: TLabel;
    lblCPF: TLabel;
    lblCargo: TLabel;
    lblNivel: TLabel;
    Label260: TLabel;
    lblEstCivil: TLabel;
    Label275: TLabel;
    lblnmpai: TLabel;
    Label277: TLabel;
    lblnmmae: TLabel;
    Label279: TLabel;
    lblnident: TLabel;
    Label281: TLabel;
    lblufident: TLabel;
    Label283: TLabel;
    lblexpedident: TLabel;
    Label285: TLabel;
    lblnatucidade: TLabel;
    Label292: TLabel;
    lblmatconj: TLabel;
    lblserv: TLabel;
    lbltpsevcred: TLabel;
    lblnaoserv: TLabel;
    lbltpservnaocred: TLabel;
    Label291: TLabel;
    edtArquivoTexto1: TEdit;
    tbcadlotacoes: TTabSheet;
    Label149: TLabel;
    SpeedButton2: TSpeedButton;
    GroupBox53: TGroupBox;
    Label144: TLabel;
    lblLTmatricula: TLabel;
    lblLTIncricao: TLabel;
    Label147: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    lblLTlocal: TLabel;
    lblLTOrgao: TLabel;
    edtArquivoTexto2: TEdit;
    tbcadend: TTabSheet;
    Label150: TLabel;
    SpeedButton3: TSpeedButton;
    GroupBox54: TGroupBox;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    lblMatricula: TLabel;
    lblInscricao: TLabel;
    lblLogradouro: TLabel;
    lblBairro: TLabel;
    lblCEP: TLabel;
    lblMunicipio: TLabel;
    UF: TLabel;
    Label195: TLabel;
    lbluf: TLabel;
    lblTelefone: TLabel;
    edtArquivoTexto3: TEdit;
    tbcadeventos: TTabSheet;
    Label153: TLabel;
    SpeedButton5: TSpeedButton;
    edtArquivoTexto4: TEdit;
    GroupBox88: TGroupBox;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    Label249: TLabel;
    lblEVMatricula: TLabel;
    lblEVInscricao: TLabel;
    lblEVENTOS: TLabel;
    lblEVdtini: TLabel;
    lblEVdtfim: TLabel;
    pnlTesteFinanc: TPanel;
    Label24: TLabel;
    edtArquivoTexto: TEdit;
    sbAbrirTxt: TSpeedButton;
    GroupBox12: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lblSequencia: TLabel;
    lblPatrocinadora: TLabel;
    lblPlano: TLabel;
    lblvalorChave: TLabel;
    lblchave: TLabel;
    lbldatareferencia: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    lblMesref: TLabel;
    lblProvento: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lblValProvento: TLabel;
    lblSalPart: TLabel;
    lblMesCob: TLabel;
    Label121: TLabel;
    lblLancamento: TLabel;
    pnlTesteTabelas: TPanel;
    pgctrTesteTabelas: TPageControl;
    tbtesterubrica: TTabSheet;
    Label232: TLabel;
    SpeedButton6: TSpeedButton;
    edtArquivoTexto5: TEdit;
    GroupBox89: TGroupBox;
    Label248: TLabel;
    Label255: TLabel;
    Label256: TLabel;
    Label257: TLabel;
    lblRBcodigo: TLabel;
    lblRBdescricao: TLabel;
    lblRBtipo: TLabel;
    lblRBIncide: TLabel;
    tbtesteagencias: TTabSheet;
    Label233: TLabel;
    SpeedButton7: TSpeedButton;
    edtArquivoTexto6: TEdit;
    GroupBox90: TGroupBox;
    Label270: TLabel;
    Label271: TLabel;
    Label272: TLabel;
    lblbanco: TLabel;
    lblagencia: TLabel;
    lblBBdescricao: TLabel;
    Label133: TLabel;
    lblAGDescricao: TLabel;
    tbtestecargos: TTabSheet;
    Label235: TLabel;
    SpeedButton9: TSpeedButton;
    edtArquivoTexto7: TEdit;
    GroupBox91: TGroupBox;
    lblCargoCod: TLabel;
    lblCargoDesc: TLabel;
    Label286: TLabel;
    Label287: TLabel;
    tbtesteniveis: TTabSheet;
    Label236: TLabel;
    SpeedButton10: TSpeedButton;
    edtArquivoTexto8: TEdit;
    GroupBox92: TGroupBox;
    Label302: TLabel;
    Valor: TLabel;
    lblNivelCodigo: TLabel;
    lblvalor: TLabel;
    tbtesteorgaos: TTabSheet;
    Label237: TLabel;
    SpeedButton11: TSpeedButton;
    edtArquivoTexto9: TEdit;
    GroupBox93: TGroupBox;
    Label318: TLabel;
    Label319: TLabel;
    Label320: TLabel;
    lblorgaocodigo: TLabel;
    lblorgaodescricao: TLabel;
    lblorgaolocal: TLabel;
    tbtestesit: TTabSheet;
    Label238: TLabel;
    SpeedButton12: TSpeedButton;
    edtArquivoTexto10: TEdit;
    GroupBox94: TGroupBox;
    Label334: TLabel;
    Label335: TLabel;
    lbleventoscodigo: TLabel;
    lbleventosdescricao: TLabel;
    tbtestelocais: TTabSheet;
    Label253: TLabel;
    SpeedButton4: TSpeedButton;
    GroupBox97: TGroupBox;
    Label208: TLabel;
    Label209: TLabel;
    lblCodLocal: TLabel;
    lblDescLocal: TLabel;
    edtArquivoTexto11: TEdit;
    Memo1: TMemo;
    Panel2: TPanel;
    Label21: TLabel;
    dblcPatro: TwwDBLookupCombo;
    Label297: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    pnlDependentes: TPanel;
    pnlEvolFunc: TPanel;
    GroupBox33: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    Label251: TLabel;
    edregdeptam: TwwDBEdit;
    edregdepini: TwwDBEdit;
    edregdepval: TDBRealEdit;
    rdgrpregdep: TDBRadioGroup;
    GroupBox99: TGroupBox;
    Label252: TLabel;
    Label254: TLabel;
    edmatriculadepini: TDBRealEdit;
    edmatriculadeptam: TDBRealEdit;
    GroupBox106: TGroupBox;
    Label258: TLabel;
    Label259: TLabel;
    edinscricaodeptam: TDBRealEdit;
    edinscricaodepini: TDBRealEdit;
    GroupBox107: TGroupBox;
    Label293: TLabel;
    Label294: TLabel;
    ednomedeptam: TDBRealEdit;
    ednomedepini: TDBRealEdit;
    GroupBox108: TGroupBox;
    Label295: TLabel;
    Label296: TLabel;
    edsexodeptam: TDBRealEdit;
    edsexodepini: TDBRealEdit;
    GroupBox109: TGroupBox;
    Label298: TLabel;
    Label299: TLabel;
    eddtnascdeptam: TDBRealEdit;
    eddtnascdepini: TDBRealEdit;
    GroupBox111: TGroupBox;
    Label303: TLabel;
    Label304: TLabel;
    edestcivdeptam: TDBRealEdit;
    edestcivdepini: TDBRealEdit;
    GroupBox112: TGroupBox;
    Label305: TLabel;
    Label306: TLabel;
    edseqdeptam: TDBRealEdit;
    edseqdepini: TDBRealEdit;
    GroupBox113: TGroupBox;
    Label307: TLabel;
    Label308: TLabel;
    edindiceirdeptam: TDBRealEdit;
    edindiceirdepini: TDBRealEdit;
    eddtnascdepformato: TwwDBEdit;
    Label309: TLabel;
    GroupBox110: TGroupBox;
    Label300: TLabel;
    Label301: TLabel;
    edindinvalideztam: TDBRealEdit;
    edindinvalidezini: TDBRealEdit;
    GroupBox114: TGroupBox;
    Label310: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    eddtiniciodeptam: TDBRealEdit;
    eddtiniciodepini: TDBRealEdit;
    eddtiniciodepformato: TwwDBEdit;
    GroupBox115: TGroupBox;
    Label313: TLabel;
    Label314: TLabel;
    edindsalfamtam: TDBRealEdit;
    edindsalfamini: TDBRealEdit;
    GroupBox116: TGroupBox;
    Label315: TLabel;
    Label316: TLabel;
    edgraudeptam: TDBRealEdit;
    edgraudepini: TDBRealEdit;
    GroupBox117: TGroupBox;
    Label317: TLabel;
    Label321: TLabel;
    Label322: TLabel;
    edregevtam: TwwDBEdit;
    edregevini: TwwDBEdit;
    edregevval: TDBRealEdit;
    rdgrpregev: TDBRadioGroup;
    GroupBox118: TGroupBox;
    Label323: TLabel;
    Label324: TLabel;
    edmatriculaevini: TDBRealEdit;
    edmatriculaevtam: TDBRealEdit;
    GroupBox119: TGroupBox;
    Label325: TLabel;
    Label326: TLabel;
    edinscricaoevtam: TDBRealEdit;
    edinscricaoevini: TDBRealEdit;
    GroupBox120: TGroupBox;
    Label327: TLabel;
    Label328: TLabel;
    edcargoevtam: TDBRealEdit;
    edcargoevini: TDBRealEdit;
    rdgrpcargoev: TDBRadioGroup;
    GroupBox121: TGroupBox;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    eddatainievtam: TDBRealEdit;
    eddatainievini: TDBRealEdit;
    eddatainievformato: TwwDBEdit;
    GroupBox122: TGroupBox;
    Label332: TLabel;
    Label333: TLabel;
    Label336: TLabel;
    eddatafimevtam: TDBRealEdit;
    eddatafimevini: TDBRealEdit;
    eddatafimevformato: TwwDBEdit;
    GroupBox124: TGroupBox;
    Label339: TLabel;
    Label340: TLabel;
    edpadicevtam: TDBRealEdit;
    edpadicevini: TDBRealEdit;
    Label341: TLabel;
    Label342: TLabel;
    Label343: TLabel;
    Label344: TLabel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label348: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    Label351: TLabel;
    Label352: TLabel;
    Label353: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    tbcaddependentes: TTabSheet;
    tbcadevolfunc: TTabSheet;
    Label360: TLabel;
    edtArquivoTextoDep: TEdit;
    SpeedButton8: TSpeedButton;
    BitBtn13: TBitBtn;
    GroupBox126: TGroupBox;
    Label361: TLabel;
    Label362: TLabel;
    Label363: TLabel;
    Label364: TLabel;
    Label365: TLabel;
    lblmatriculadep: TLabel;
    lblinscricaodep: TLabel;
    lblnomedep: TLabel;
    lblsexodep: TLabel;
    lblseqdep: TLabel;
    Label371: TLabel;
    edtArquivoTextoEvolFunc: TEdit;
    SpeedButton13: TSpeedButton;
    BitBtn14: TBitBtn;
    GroupBox127: TGroupBox;
    Label372: TLabel;
    Label373: TLabel;
    Label374: TLabel;
    Label375: TLabel;
    Label376: TLabel;
    lblmatriculaev: TLabel;
    lblinscricaoev: TLabel;
    lblcargoev: TLabel;
    lbldtiiev: TLabel;
    bldtfimev: TLabel;
    Label382: TLabel;
    lbltiporeg: TLabel;
    Label384: TLabel;
    lblperadicev: TLabel;
    Label366: TLabel;
    lblestcivdep: TLabel;
    Label377: TLabel;
    lblindirdep: TLabel;
    Label379: TLabel;
    lblindinvalidezdep: TLabel;
    Label381: TLabel;
    lbldatanascdep: TLabel;
    Label385: TLabel;
    lbldatainiciodep: TLabel;
    Label387: TLabel;
    lblsalfamdep: TLabel;
    Label389: TLabel;
    lblgraudep: TLabel;
    Panel1: TPanel;
    Dock97Top: TDock97;
    tb97Atalho: TToolbar97;
    sbtndiverganalit: TToolbarButton97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    ToolbarSep977: TToolbarSep97;
    ToolbarButton971: TToolbarButton97;
    qryDep: TwwQuery;
    updDep: TUpdateSQL;
    dsDep: TwwDataSource;
    updEvol: TUpdateSQL;
    qryEvol: TwwQuery;
    dsEvol: TwwDataSource;
    updFunc: TUpdateSQL;
    qryFunc: TwwQuery;
    dsFunc: TwwDataSource;
    GroupBox43: TGroupBox;
    Label122: TLabel;
    Label170: TLabel;
    DBRealEdit14: TDBRealEdit;
    DBRealEdit13: TDBRealEdit;
    Label367: TLabel;
    edftdtdemissao: TwwDBEdit;
    Label368: TLabel;
    edftdtreadmissao: TwwDBEdit;
    GroupBox98: TGroupBox;
    Label369: TLabel;
    Label370: TLabel;
    eddtreadmissaotam: TDBRealEdit;
    eddtreadmissaoini: TDBRealEdit;
    GroupBox128: TGroupBox;
    Label378: TLabel;
    Label380: TLabel;
    edopcao1tam: TDBRealEdit;
    edopcao1ini: TDBRealEdit;
    GroupBox129: TGroupBox;
    Label383: TLabel;
    Label386: TLabel;
    edopcao2tam: TDBRealEdit;
    edopcao2ini: TDBRealEdit;
    GroupBox130: TGroupBox;
    Label388: TLabel;
    Label390: TLabel;
    edopcao3tam: TDBRealEdit;
    edopcao3ini: TDBRealEdit;
    GroupBox131: TGroupBox;
    Label391: TLabel;
    Label392: TLabel;
    edtpservrealantini: TDBRealEdit;
    edtpservrealanttam: TDBRealEdit;
    GroupBox132: TGroupBox;
    Label393: TLabel;
    Label394: TLabel;
    edtpservprivadoini: TDBRealEdit;
    edtpservprivadotam: TDBRealEdit;
    GroupBox133: TGroupBox;
    Label395: TLabel;
    Label396: TLabel;
    edtpservpublicoini: TDBRealEdit;
    edtpservpublicotam: TDBRealEdit;
    GroupBox17: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    DBRealEdit7: TDBRealEdit;
    DBRealEdit8: TDBRealEdit;
    GroupBox18: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    DBRealEdit9: TDBRealEdit;
    DBRealEdit10: TDBRealEdit;
    GroupBox23: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    DBRealEdit11: TDBRealEdit;
    DBRealEdit12: TDBRealEdit;
    GroupBox16: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    DBRealEdit5: TDBRealEdit;
    DBRealEdit6: TDBRealEdit;
    GroupBox24: TGroupBox;
    Label83: TLabel;
    Label84: TLabel;
    ednumdepensalfamtam: TDBRealEdit;
    ednumdepensalfamini: TDBRealEdit;
    GroupBox134: TGroupBox;
    Label397: TLabel;
    Label398: TLabel;
    edcdvincfunctam: TDBRealEdit;
    edcdvincfuncini: TDBRealEdit;
    GroupBox135: TGroupBox;
    Label399: TLabel;
    Label400: TLabel;
    edsitfunctam: TDBRealEdit;
    edsitfuncini: TDBRealEdit;
    GroupBox136: TGroupBox;
    Label401: TLabel;
    Label402: TLabel;
    ededidestabtam: TDBRealEdit;
    ededidestabini: TDBRealEdit;
    GroupBox137: TGroupBox;
    Label403: TLabel;
    Label404: TLabel;
    edidfuncaotam: TDBRealEdit;
    edidfuncaoini: TDBRealEdit;
    Label405: TLabel;
    Label406: TLabel;
    Label407: TLabel;
    lbltpservpublico: TLabel;
    Label409: TLabel;
    lbltpservprivado: TLabel;
    Label411: TLabel;
    lblfilial: TLabel;
    Label415: TLabel;
    lblsitfuncional: TLabel;
    Label417: TLabel;
    lblvincfuncional: TLabel;
    Label419: TLabel;
    lbldtdemissao: TLabel;
    Label421: TLabel;
    lblflgdiretor: TLabel;
    Label423: TLabel;
    lbltpservant: TLabel;
    Label425: TLabel;
    lbldtreadmissao: TLabel;
    Label427: TLabel;
    lblopcao1: TLabel;
    Label429: TLabel;
    lblopcao2: TLabel;
    Label431: TLabel;
    lblopcao3: TLabel;
    Label433: TLabel;
    lblfuncao: TLabel;
    Label413: TLabel;
    Label408: TLabel;
    lbldtmorte: TLabel;
    Label410: TLabel;
    wwDBEdit1: TwwDBEdit;
    GroupBox138: TGroupBox;
    Label412: TLabel;
    Label414: TLabel;
    eddtmortetam: TDBRealEdit;
    eddtmorteini: TDBRealEdit;
    GroupBox139: TGroupBox;
    Label416: TLabel;
    Label418: TLabel;
    edtpservantini: TDBRealEdit;
    edtpservanttam: TDBRealEdit;
    GroupBox140: TGroupBox;
    Label420: TLabel;
    Label422: TLabel;
    ednumdepentam: TDBRealEdit;
    ednumdepenini: TDBRealEdit;
    GroupBox141: TGroupBox;
    Label424: TLabel;
    Label426: TLabel;
    ednumdepenirtam: TDBRealEdit;
    ednumdepenirini: TDBRealEdit;
    Label428: TLabel;
    lbldepIRRF: TLabel;
    Label432: TLabel;
    lbldepsalfam: TLabel;
    Label430: TLabel;
    lbltpservrealant: TLabel;
    qryContato: TwwQuery;
    updContato: TUpdateSQL;
    dsContato: TwwDataSource;
    pnlContatos: TPanel;
    Label434: TLabel;
    GroupBox142: TGroupBox;
    Label435: TLabel;
    Label436: TLabel;
    edMatriculaContTam: TDBRealEdit;
    edMatriculaContIni: TDBRealEdit;
    GroupBox143: TGroupBox;
    Label437: TLabel;
    Label438: TLabel;
    edInscricaoContTam: TDBRealEdit;
    edInscricaoContIni: TDBRealEdit;
    DBRadioGroup4: TDBRadioGroup;
    GroupBox144: TGroupBox;
    Label439: TLabel;
    Label440: TLabel;
    DBRealEdit67: TDBRealEdit;
    DBRealEdit68: TDBRealEdit;
    GroupBox145: TGroupBox;
    Label441: TLabel;
    Label442: TLabel;
    DBRealEdit69: TDBRealEdit;
    DBRealEdit70: TDBRealEdit;
    GroupBox146: TGroupBox;
    Label443: TLabel;
    Label444: TLabel;
    DBRealEdit87: TDBRealEdit;
    DBRealEdit88: TDBRealEdit;
    GroupBox147: TGroupBox;
    Label445: TLabel;
    Label446: TLabel;
    DBRealEdit110: TDBRealEdit;
    DBRealEdit112: TDBRealEdit;
    GroupBox148: TGroupBox;
    Label447: TLabel;
    Label448: TLabel;
    DBRealEdit113: TDBRealEdit;
    DBRealEdit114: TDBRealEdit;
    GroupBox149: TGroupBox;
    Label449: TLabel;
    Label450: TLabel;
    DBRealEdit115: TDBRealEdit;
    DBRealEdit116: TDBRealEdit;
    tbCadContatos: TTabSheet;
    Label451: TLabel;
    SpeedButton14: TSpeedButton;
    edtTestaContatos: TEdit;
    bbtnTestaContato: TBitBtn;
    GroupBox150: TGroupBox;
    Label452: TLabel;
    Label453: TLabel;
    Label454: TLabel;
    Label455: TLabel;
    Label456: TLabel;
    lblMatriculaCont: TLabel;
    lblInscricaoCont: TLabel;
    lblNomeCont: TLabel;
    lblEmailCont: TLabel;
    lblCargoCont: TLabel;
    Label462: TLabel;
    lblSetorCont: TLabel;
    Label464: TLabel;
    lblNascimentoCont: TLabel;
    Label466: TLabel;
    lblObsCont: TLabel;
    Label457: TLabel;
    wwDBEdit34: TwwDBEdit;
    rdgrpOpMat: TDBRadioGroup;
    GroupBox151: TGroupBox;
    Label458: TLabel;
    Label459: TLabel;
    edtTamIdpessoa: TwwDBEdit;
    edtIniIdPessoa: TwwDBEdit;
    lblpessoa: TLabel;
    lblIdPessoa: TLabel;
    GroupBox154: TGroupBox;
    Label467: TLabel;
    Label468: TLabel;
    wwDBEdit38: TwwDBEdit;
    wwDBEdit39: TwwDBEdit;
    GroupBox155: TGroupBox;
    Label469: TLabel;
    Label470: TLabel;
    wwDBEdit40: TwwDBEdit;
    wwDBEdit41: TwwDBEdit;
    GroupBox156: TGroupBox;
    Label471: TLabel;
    Label472: TLabel;
    wwDBEdit42: TwwDBEdit;
    wwDBEdit43: TwwDBEdit;
    GroupBox157: TGroupBox;
    Label473: TLabel;
    Label474: TLabel;
    wwDBEdit44: TwwDBEdit;
    wwDBEdit45: TwwDBEdit;
    GroupBox158: TGroupBox;
    Label475: TLabel;
    Label476: TLabel;
    wwDBEdit46: TwwDBEdit;
    wwDBEdit47: TwwDBEdit;
    GroupBox159: TGroupBox;
    Label477: TLabel;
    Label478: TLabel;
    wwDBEdit48: TwwDBEdit;
    wwDBEdit49: TwwDBEdit;
    GroupBox160: TGroupBox;
    Label479: TLabel;
    Label480: TLabel;
    wwDBEdit50: TwwDBEdit;
    wwDBEdit51: TwwDBEdit;
    GroupBox161: TGroupBox;
    Label481: TLabel;
    Label482: TLabel;
    wwDBEdit52: TwwDBEdit;
    wwDBEdit53: TwwDBEdit;
    GroupBox164: TGroupBox;
    Label487: TLabel;
    Label488: TLabel;
    wwDBEdit58: TwwDBEdit;
    wwDBEdit59: TwwDBEdit;
    GroupBox165: TGroupBox;
    Label489: TLabel;
    Label490: TLabel;
    wwDBEdit60: TwwDBEdit;
    wwDBEdit61: TwwDBEdit;
    GroupBox166: TGroupBox;
    Label491: TLabel;
    Label492: TLabel;
    wwDBEdit62: TwwDBEdit;
    wwDBEdit63: TwwDBEdit;
    GroupBox167: TGroupBox;
    Label493: TLabel;
    Label494: TLabel;
    wwDBEdit64: TwwDBEdit;
    wwDBEdit65: TwwDBEdit;
    GroupBox168: TGroupBox;
    Label495: TLabel;
    Label496: TLabel;
    wwDBEdit66: TwwDBEdit;
    wwDBEdit67: TwwDBEdit;
    GroupBox169: TGroupBox;
    Label497: TLabel;
    Label498: TLabel;
    wwDBEdit68: TwwDBEdit;
    wwDBEdit69: TwwDBEdit;
    GroupBox152: TGroupBox;
    Label460: TLabel;
    Label461: TLabel;
    edopcao4tam: TDBRealEdit;
    edopcao4ini: TDBRealEdit;
    GroupBox153: TGroupBox;
    Label463: TLabel;
    Label465: TLabel;
    edopcao5tam: TDBRealEdit;
    edopcao5ini: TDBRealEdit;
    GroupBox162: TGroupBox;
    Label483: TLabel;
    Label484: TLabel;
    edopcao6tam: TDBRealEdit;
    edopcao6ini: TDBRealEdit;
    TabSheet1: TTabSheet;
    grpbxMunNat: TGroupBox;
    Label276: TLabel;
    Label278: TLabel;
    edtammunnat: TDBRealEdit;
    edinimunnat: TDBRealEdit;
    GroupBox125: TGroupBox;
    Label358: TLabel;
    Label359: TLabel;
    edflgdiretortam: TDBRealEdit;
    edflgdiretorini: TDBRealEdit;
    GroupBox103: TGroupBox;
    Label280: TLabel;
    Label282: TLabel;
    edinimatconj: TDBRealEdit;
    edtammatconj: TDBRealEdit;
    GroupBox44: TGroupBox;
    Label210: TLabel;
    Label250: TLabel;
    dbedEstCivilTam: TDBRealEdit;
    dbedEstCivilIni: TDBRealEdit;
    GroupBox163: TGroupBox;
    Label485: TLabel;
    Label486: TLabel;
    edqtdemintam: TDBRealEdit;
    edqtdeminini: TDBRealEdit;
    GroupBox123: TGroupBox;
    Label337: TLabel;
    Label338: TLabel;
    edtiporegtam: TDBRealEdit;
    edtiporegini: TDBRealEdit;
    GroupBox170: TGroupBox;
    Label499: TLabel;
    Label500: TLabel;
    edmodotam: TDBRealEdit;
    edmodoini: TDBRealEdit;
    Label501: TLabel;
    lblmodo: TLabel;
    Label503: TLabel;
    lblqtdemin: TLabel;
    Label502: TLabel;
    lblopcao4: TLabel;
    Label505: TLabel;
    lblopcao5: TLabel;
    Label507: TLabel;
    lblopcao6: TLabel;
    GroupBox171: TGroupBox;
    Label504: TLabel;
    Label506: TLabel;
    dbedsitfunctam: TDBRealEdit;
    dbedsitfuncini: TDBRealEdit;
    GroupBox172: TGroupBox;
    Label508: TLabel;
    Label509: TLabel;
    dbedsitparttam: TDBRealEdit;
    dbedsitpartini: TDBRealEdit;
    GroupBox173: TGroupBox;
    Label510: TLabel;
    Label511: TLabel;
    dbedsitplanotam: TDBRealEdit;
    dbedsitplanoini: TDBRealEdit;
    GroupBox174: TGroupBox;
    Label512: TLabel;
    Label513: TLabel;
    dbreTipoLocalTam: TDBRealEdit;
    dbreTipoLocalIni: TDBRealEdit;
    GroupBox176: TGroupBox;
    Label516: TLabel;
    Label517: TLabel;
    dbreSiglaLocalTam: TDBRealEdit;
    dbreSiglaLocalIni: TDBRealEdit;
    GroupBox177: TGroupBox;
    Label518: TLabel;
    Label519: TLabel;
    dbreCgcLocalTam: TDBRealEdit;
    dbreCgcLocalIni: TDBRealEdit;
    Label514: TLabel;
    lbltipolocal: TLabel;
    Label520: TLabel;
    lblsiglalocal: TLabel;
    Label522: TLabel;
    lblcgclocal: TLabel;
    Label515: TLabel;
    lblevsitfunc: TLabel;
    Label523: TLabel;
    lblevsitpart: TLabel;
    Label525: TLabel;
    lblevsitplano: TLabel;
    dbcRubricaAtraso: TDBCheckBox;
    GroupBox175: TGroupBox;
    qryPatro: TwwQuery;
    dsPatro: TwwDataSource;
    updPatro: TUpdateSQL;
    GroupBox178: TGroupBox;
    Label521: TLabel;
    Label524: TLabel;
    edemailtam: TDBRealEdit;
    edemailini: TDBRealEdit;
    Label526: TLabel;
    lblemail: TLabel;
    GroupBox179: TGroupBox;
    Label527: TLabel;
    Label528: TLabel;
    edtaxaini: TDBRealEdit;
    edtaxatam: TDBRealEdit;
    Label529: TLabel;
    lbltaxa: TLabel;
    GroupBox180: TGroupBox;
    Label530: TLabel;
    Label531: TLabel;
    edtTamEquiparacao: TwwDBEdit;
    edtIniEquiparacao: TwwDBEdit;
    lblnomeequipsal: TLabel;
    lblequipsal: TLabel;
    GroupBox181: TGroupBox;
    Label532: TLabel;
    Label533: TLabel;
    Label534: TLabel;
    dbreDtFimLocalFormato: TwwDBEdit;
    dbreDtFimLocalTam: TDBRealEdit;
    dbreDtFimLocalIni: TDBRealEdit;
    Label535: TLabel;
    lbldtfimlocal: TLabel;
    GroupBox182: TGroupBox;
    Label536: TLabel;
    Label537: TLabel;
    DBRealEdit21: TDBRealEdit;
    DBRealEdit22: TDBRealEdit;
    Label538: TLabel;
    Label539: TLabel;
    Label540: TLabel;
    lblddd: TLabel;
    procedure sbAbrirTxtClick(Sender: TObject);
    procedure bbtnTesteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbcadendDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dbchkLancamento1Exit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure fcOutOpChange(ButtonGroup: TfcCustomButtonGroup; OldSelected,
      Selected: TfcButtonGroupItem);
    procedure OpCadastralItemClick(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure OpFinancItemClick(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure opTabelasItemClick(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure opTestesItemClick(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ToolbarButton971Click(Sender: TObject);
    procedure sbtndiverganalitClick(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure dbgrpChaveClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    bCad , bLotacoes, bEnd, bContatos, bSit,
    bAgencias,  bCargos, bNiveis,
    bLocais, bOrgaos, bEventos, bDependentes, bEvolFunc,
    bRubricas, bFinanc,
    bTesteFinanc, bTesteTabelas, bTesteCad : Boolean;

    procedure AtualizaPosLancamento;
    procedure ZeraVar;
    procedure MontaPaineis;
  public
    {-----}
  end;

var
  frmCadInterfacePatro: TfrmCadInterfacePatro;

implementation

uses UMensErro, UAdmPrev,UDataBase, USistema, UAutorizacao;

{$R *.DFM}

procedure TfrmCadInterfacePatro.CmeCadastroConfirma(Sender: TObject);
begin
  if qry.FieldByName('FLGHEADER').IsNull then
   qry.FieldByName('FLGHEADER').AsString := 'N';

  if qry.FieldByName('FLGFOOTER').IsNull then
   qry.FieldByName('FLGFOOTER').AsString := 'N';

  if qry.FieldByName('FLGLANCAMENTO').IsNull then
   qry.FieldByName('FLGLANCAMENTO').AsString := 'N';

  {-----}

  inherited;

  qrydep.FieldByName('IDPESSJUR').AsInteger     := qry.FieldByName('IDPESSJUR').AsInteger;
  qryevol.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryfunc.FieldByName('IDPESSJUR').AsInteger    := qry.FieldByName('IDPESSJUR').AsInteger;
  qryContato.FieldByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
  qryDep.ApplyUpdates;
  qryEvol.ApplyUpdates;
  qryfunc.ApplyUpdates;
  qryContato.ApplyUpdates;
  qryPatro.ApplyUpdates;   

end;

procedure TfrmCadInterfacePatro.AtualizaPosLancamento;
begin
  if qry.Active then
   if qry.RecordCount > 0 then
    case qry.FieldByName('FLGLANCAMENTO').AsString[1] of
    'S':
      begin
        dbrPosLancamento.Color   := clWindow;
        dbrPosLancamento.Enabled := True;
      end;
    'N':
      begin
        dbrPosLancamento.Color   := clInactiveCaption;
        dbrPosLancamento.Enabled := False;
        if qry.State in [dsInsert, dsEdit] then
         qry.FieldByName('POSLANCAMENTO').AsInteger := 0;
      end;
    end;
end;

procedure TfrmCadInterfacePatro.sbAbrirTxtClick(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.bbtnTesteClick(Sender: TObject);
var
  F : TextFile;
  Linha : String ;
begin
  inherited;
  // Se não houver texto selecionado então sai da rotina
  if (edtArquivoTexto1.text = '*.txt')   and (edtArquivoTexto2.text = '*.txt')        and
     (edtArquivoTexto3.text = '*.txt')   and (edtArquivoTexto4.text = '*.txt')        and
     (edtArquivoTexto5.text = '*.txt')   and (edtArquivoTexto6.text = '*.txt')        and
     (edtArquivoTexto7.text = '*.txt')   and (edtArquivoTexto8.text = '*.txt')        and
     (edtArquivoTexto9.text = '*.txt')   and (edtArquivoTexto10.text = '*.txt')       and
     (edtArquivoTexto.text = '*.txt')    and (edtArquivoTexto11.text = '*.txt')       and
     (edtArquivoTextoDep.text = '*.txt') and (edtArquivoTextoEvolFunc.text = '*.txt') and
     (edtTestaContatos.text = '*.txt')   and (edtTestaContatos.text = '*.txt')
  then begin
     msgdlg('Nenhum texto foi selecionado para a geração de teste!', 'Informação', mtInformation, [mbOk, mbHelp],0);
     exit
  end;

  Linha   := '                                                                               ' ;


  //financeiro
  if edtArquivoTexto.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto.text);
     Reset(F);
     ReadLn(F,linha);
     if dbchkCabecalho.Checked then  // Se o lançamento estiver marcado então lê a próxima linha
        ReadLn(F,linha);

      if (trim(edtIniSequencia.text) = '1.000') or (edtTamSequencia.Text = '    0') or (trim(edtTamSequencia.Text) = '') then
         lblSequencia.Caption := ''
      else
         lblSequencia.Caption      := copy(linha,StrToInt(edtIniSequencia.Text)+1,StrToInt(edtTamSequencia.Text));
      //
      if (trim(edtIniPatro.Text) = '1.000') or (edtTamPatro.Text = '    0') or (trim(edtTamPatro.Text) = '') then
         lblPatrocinadora.Caption := ''
      else
         lblPatrocinadora.Caption  := copy(linha,StrToInt(edtIniPatro.Text)+1,StrToInt(edtTamPatro.Text));
      //
      if (trim(edtIniPlano.Text) = '1.000') or (edtTamPlano.Text = '    0') or (trim(edtTamPlano.Text) = '') then
         lblPlano.Caption := ''
      else
         lblPlano.Caption := copy(linha,StrToInt(edtIniPlano.Text)+1,StrToInt(edtTamPlano.Text));
      //
      if (trim(edtIniIdPessoa.Text) = '1.000') or (edtTamIdPessoa.Text = '    0') or (trim(edtTamIdPessoa.Text) = '') then
         lblIdPessoa.Caption := ''
      else
         lblIdPessoa.Caption := copy(linha,StrToInt(edtIniIdPessoa.Text)+1,StrToInt(edtTamIdPessoa.Text));
      //
      if (trim(edtIniValorChave.Text) = '1.000') or (edtTamValorChave.Text = '    0') or (trim(edtTamValorChave.Text) = '') then
         lblValorChave.Caption := ''
      else begin
         lblValorChave.Caption := copy(linha,StrToInt(edtIniValorChave.Text)+1,StrToInt(edtTamValorChave.Text));
      end;
      //
      if (trim(edtIniChave.Text) = '1.000') or (edtTamChave.Text = '    0') or (trim(edtTamChave.Text) = '') then
         lblChave.Caption := ''
      else
         lblChave.Caption := copy(linha,StrToInt(edtIniChave.Text)+1,StrToInt(edtTamChave.Text));
      //
      if (trim(edtIniDataReferencia.Text) = '1.000') or (edtTamDataReferencia.Text = '    0') or (trim(edtTamDataReferencia.Text) = '') then
         lblDataReferencia.Caption := ''
      else
         lblDataReferencia.Caption := copy(linha,StrToInt(edtIniDataReferencia.Text)+1,StrToInt(edtTamDataReferencia.Text));
      //
      if (trim(edtIniMesRef.Text) = '1.000') or (edtTamMesRef.Text = '    0') or (trim(edtTamMesRef.Text) = '') then
         lblMesRef.Caption := ''
      else
         lblMesRef.Caption := copy(linha,StrToInt(edtIniMesRef.Text)+1,StrToInt(edtTamMesRef.Text));
      //
      if (trim(edtIniProvento.Text) = '1.000') or (edtTamProvento.Text = '    0') or (trim(edtTamProvento.Text) = '') then
         lblProvento.Caption := ''
      else
         lblProvento.Caption := copy(linha,StrToInt(edtIniProvento.Text)+1,StrToInt(edtTamProvento.Text));
      //
      if (trim(edtIniValProvento.Text) = '1.000') or (edtTamValProvento.Text = '    0')  or (trim(edtTamValProvento.Text) = '') then
         lblValProvento.Caption := ''
      else
         lblValProvento.Caption := copy(linha,StrToInt(edtIniValProvento.Text)+1,StrToInt(edtTamValProvento.Text));
      //
      if (trim(edtIniSalPart.Text) = '1.000') or (edtTamSalPart.Text = '    0') or (trim(edtTamSalPart.Text) = '') then
         lblSalPart.Caption := ''
      else
         lblSalPart.Caption := copy(linha,StrToInt(edtIniSalPart.Text)+1,StrToInt(edtTamSalPart.Text));
      //
      if (trim(edtIniMesCob.Text) = '1.000') or (edtTamMesCob.Text = '    0')  or (trim(edtTamMesCob.Text) = '') then
         lblMesCob.Caption := ''
      else
         lblMesCob.Caption := copy(linha,StrToInt(edtIniMesCob.Text)+1,StrToInt(edtTamMesCob.Text));
      //
      if (not (dbchkLancamento.Checked)) or (trim(dbrPosLancamento.Text) = '') then
         lblLancamento.Caption := ''
      else
         lblLancamento.Caption := copy(linha,StrToInt(dbrPosLancamento.Text)+1,1);
      //
      if (trim(edtIniEquiparacao.Text) = '1.000') or (edtTamEquiparacao.Text = '    0') or (trim(edtTamEquiparacao.Text) = '') then
         lblequipsal.Caption := ''
      else
         lblequipsal.Caption := copy(linha,StrToInt(edtIniEquiparacao.Text)+1,StrToInt(edtTamEquiparacao.Text));


     CloseFile(F);
  end;



  //dados cadastrais
  if edtArquivoTexto1.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto1.Text);
     Reset(F);
     ReadLn(F,linha);

     //
      if (trim(DBRealEdit2.Text) = '1.000') or (DBRealEdit1.Text = '    0') or (trim(DBRealEdit1.Text) = '') then
         lbldcmatricula.Caption := ''
      else
         lbldcmatricula.Caption := copy(linha,StrToInt(DBRealEdit2.Text)+1,StrToInt(DBRealEdit1.Text));
      //
      if (trim(DBRealEdit4.Text) = '1.000') or (DBRealEdit3.Text = '    0')  or (trim(DBRealEdit3.Text) = '')then
         lbldcIncricao.Caption := ''
      else
         lbldcIncricao.Caption := copy(linha,StrToInt(DBRealEdit4.Text)+1,StrToInt(DBRealEdit3.Text));
      //
      if (trim(DBRealEdit6.Text) = '1.000') or (DBRealEdit5.Text = '    0') or (trim(DBRealEdit5.Text) = '') then
         lbldcfator.Caption := ''
      else
         lbldcfator.Caption := copy(linha,StrToInt(DBRealEdit6.Text)+1,StrToInt(DBRealEdit5.Text));
      //
      if (trim(DBRealEdit8.Text) = '1.000') or (DBRealEdit7.Text = '    0')  or (trim(DBRealEdit7.Text) = '') then
         lbldcBanco.Caption := ''
      else
         lbldcBanco.Caption := copy(linha,StrToInt(DBRealEdit8.Text)+1,StrToInt(DBRealEdit7.Text));
      //
      if (trim(DBRealEdit10.Text) = '1.000') or (DBRealEdit9.Text = '    0')  or (trim(DBRealEdit9.Text) = '') then
         lbldcAgencia.Caption := ''
      else
         lbldcAgencia.Caption := copy(linha,StrToInt(DBRealEdit10.Text)+1,StrToInt(DBRealEdit9.Text));
      //
      if (trim(DBRealEdit12.Text) = '1.000') or (DBRealEdit11.Text = '    0')  or (trim(DBRealEdit11.Text) = '') then
         lblCC.Caption := ''
      else
         lblCC.Caption := copy(linha,StrToInt(DBRealEdit12.Text)+1,StrToInt(DBRealEdit11.Text));
      //
      if (trim(DBRealEdit14.Text) = '1.000') or (DBRealEdit13.Text = '    0')  or (trim(DBRealEdit13.Text) = '') then
         lblDTADM.Caption := ''
      else
         lblDTADM.Caption := copy(linha,StrToInt(DBRealEdit13.Text)+1,StrToInt(DBRealEdit14.Text));
      //
      if (trim(DBRealEdit16.Text) = '1.000') or (DBRealEdit15.Text = '    0')  or (trim(DBRealEdit15.Text) = '') then
         lbldtNasc.Caption := ''
      else
         lbldtNasc.Caption := copy(linha,StrToInt(DBRealEdit16.Text)+1,StrToInt(DBRealEdit15.Text));
      //
      if (trim(DBRealEdit18.Text) = '1.000') or (DBRealEdit17.Text = '    0')  or (trim(DBRealEdit17.Text) = '') then
         lblEmpregado.Caption := ''
      else
         lblEmpregado.Caption := copy(linha,StrToInt(DBRealEdit18.Text)+1,StrToInt(DBRealEdit17.Text));
      //
      if (trim(DBRealEdit20.Text) = '1.000') or (DBRealEdit19.Text = '    0')  or (trim(DBRealEdit19.Text) = '') then
         lblSexo.Caption := ''
      else
         lblSexo.Caption := copy(linha,StrToInt(DBRealEdit20.Text)+1,StrToInt(DBRealEdit19.Text));
      //
      if (trim(ednumdepenirini.Text) = '1.000') or (ednumdepenirtam.Text = '    0')  or (trim(ednumdepenirtam.Text) = '') then
         lbldepIRRF.Caption := ''
      else
         lbldepIRRF.Caption := copy(linha,StrToInt(ednumdepenirini.Text)+1,StrToInt(ednumdepenirtam.Text));
      //
      if (trim(dbedEstCivilIni.Text) = '1.000') or (dbedEstCivilIni.Text = '    0')  or (trim(dbedEstCivilIni.Text) = '') then
         lblEstCivil.Caption := ''
      else
         lblEstCivil.Caption := copy(linha,StrToInt(dbedEstCivilIni.Text)+1,StrToInt(dbedEstCivilTam.Text));
      //
      if (trim(DBRealEdit24.Text) = '1.000') or (DBRealEdit23.Text = '    0')  or (trim(DBRealEdit23.Text) = '') then
         lblCPF.Caption := ''
      else
         lblCPF.Caption := copy(linha,StrToInt(DBRealEdit24.Text)+1,StrToInt(DBRealEdit23.Text));
      //
      if (trim(DBRealEdit26.Text) = '1.000') or (DBRealEdit25.Text = '    0')  or (trim(DBRealEdit25.Text) = '') then
         lblCargo.Caption := ''
      else
         lblCargo.Caption := copy(linha,StrToInt(DBRealEdit26.Text)+1,StrToInt(DBRealEdit25.Text));
      //
      if (trim(DBRealEdit28.Text) = '1.000') or (DBRealEdit27.Text = '    0')  or (trim(DBRealEdit27.Text) = '') then
         lblNivel.Caption := ''
      else
         lblNivel.Caption := copy(linha,StrToInt(DBRealEdit28.Text)+1,StrToInt(DBRealEdit27.Text));
      //
      if (trim(edininmpai.Text) = '1.000') or  (edtamnmpai.Text = '    0') or (trim(edtamnmpai.Text) = '') then
         lblnmpai.Caption := ''
      else
         lblnmpai.Caption := copy(linha,StrToInt(edininmpai.Text)+1,StrToInt(edtamnmpai.Text));
      //
      if (trim(edininmmae.Text) = '1.000') or (edtamnmmae.Text = '    0') or (trim(edtamnmmae.Text) = '') then
         lblnmmae.Caption := ''
      else
         lblnmmae.Caption := copy(linha,StrToInt(edininmmae.Text)+1,StrToInt(edtamnmmae.Text));
      //
      if (trim(edinitpservtot.Text) = '1.000') or (edtamtpservtot.Text = '    0') or (trim(edtamtpservtot.Text) = '') then
         lbltpsevcred.Caption := ''
      else
         lbltpsevcred.Caption := copy(linha,StrToInt(edinitpservtot.Text)+1,StrToInt(edtamtpservtot.Text));
      //
      if (trim(edinitpservcred.Text) = '1.000') or (edtamtpservcred.Text = '    0') or (trim(edtamtpservcred.Text) = '') then
         lbltpservnaocred.Caption := ''
      else
         lbltpservnaocred.Caption := copy(linha,StrToInt(edinitpservcred.Text)+1,StrToInt(edtamtpservcred.Text));
      //
      if (trim(edininumident.Text) = '1.000') or (edtamnumident.Text = '    0') or (trim(edtamnumident.Text) = '') then
         lblnident.Caption := ''
      else
         lblnident.Caption := copy(linha,StrToInt(edininumident.Text)+1,StrToInt(edtamnumident.Text));
      //
      if (trim(ediniufident.Text) = '1.000') or (edtamufident.Text = '    0') or (trim(edtamufident.Text) = '') then
         lblufident.Caption := ''
      else
         lblufident.Caption := copy(linha,StrToInt(ediniufident.Text)+1,StrToInt(edtamufident.Text));
      //
      if (trim(edinidtexpident.Text) = '1.000') or (edtamdtexpident.Text = '    0') or (trim(edtamdtexpident.Text) = '') then
         lblexpedident.Caption := ''
      else
         lblexpedident.Caption := copy(linha,StrToInt(edinidtexpident.Text)+1,StrToInt(edtamdtexpident.Text));
      //
      if (trim(edinimunnat.Text) = '1.000') or (edtammunnat.Text = '    0') or (trim(edtammunnat.Text) = '') then
         lblnatucidade.Caption := ''
      else
         lblnatucidade.Caption := copy(linha,StrToInt(edinimunnat.Text)+1,StrToInt(edtammunnat.Text));
      //
      if (trim(edinimatconj.Text) = '1.000') or (edtammatconj.Text = '    0') or (trim(edtammatconj.Text) = '') then
         lblmatconj.Caption := ''
      else
         lblmatconj.Caption := copy(linha,StrToInt(edinimatconj.Text)+1,StrToInt(edtammatconj.Text));
      //
      if (trim(ededidestabini.Text) = '1.000') or (ededidestabtam.Text = '    0') or (trim(ededidestabtam.Text) = '') then
         lblfilial.Caption := ''
      else
         lblfilial.Caption := copy(linha,StrToInt(ededidestabini.Text)+1,StrToInt(ededidestabtam.Text));
      //
      if (trim(edsitfuncini.Text) = '1.000') or (edsitfunctam.Text = '    0') or (trim(edsitfunctam.Text) = '') then
         lblsitfuncional.Caption := ''
      else
         lblsitfuncional.Caption := copy(linha,StrToInt(edsitfuncini.Text)+1,StrToInt(edsitfunctam.Text));
      //
      if (trim(edcdvincfuncini.Text) = '1.000') or (edcdvincfunctam.Text = '    0') or (trim(edcdvincfunctam.Text) = '') then
         lblvincfuncional.Caption := ''
      else
         lblvincfuncional.Caption := copy(linha,StrToInt(edcdvincfuncini.Text)+1,StrToInt(edcdvincfunctam.Text));
      //
      if (trim(eddtdemissaoini.Text) = '1.000') or (eddtdemissaotam.Text = '    0') or (trim(eddtdemissaotam.Text) = '') then
         lbldtdemissao.Caption := ''
      else
         lbldtdemissao.Caption := copy(linha,StrToInt(eddtdemissaoini.Text)+1,StrToInt(eddtdemissaotam.Text));
      //
      if (trim(edflgdiretorini.Text) = '1.000') or (edflgdiretortam.Text = '    0') or (trim(edflgdiretortam.Text) = '') then
         lblflgdiretor.Caption := ''
      else
         lblflgdiretor.Caption := copy(linha,StrToInt(edflgdiretorini.Text)+1,StrToInt(edflgdiretortam.Text));
      //
      if (trim(edidfuncaoini.Text) = '1.000') or (edidfuncaotam.Text = '    0') or (trim(edidfuncaotam.Text) = '') then
         lblfuncao.Caption := ''
      else
         lblfuncao.Caption := copy(linha,StrToInt(edidfuncaoini.Text)+1,StrToInt(edidfuncaotam.Text));
      //
      if (trim(edtpservpublicoini.Text) = '1.000') or (edtpservpublicotam.Text = '    0') or (trim(edtpservpublicotam.Text) = '') then
         lbltpservpublico.Caption := ''
      else
         lbltpservpublico.Caption := copy(linha,StrToInt(edtpservpublicoini.Text)+1,StrToInt(edtpservpublicotam.Text));
      //
      if (trim(edtpservprivadoini.Text) = '1.000') or (edtpservprivadotam.Text = '    0') or (trim(edtpservprivadotam.Text) = '') then
         lbltpservprivado.Caption := ''
      else
         lbltpservprivado.Caption := copy(linha,StrToInt(edtpservprivadoini.Text)+1,StrToInt(edtpservprivadotam.Text));
      //
      if (trim(edtpservrealantini.Text) = '1.000') or (edtpservrealanttam.Text = '    0') or (trim(edtpservrealanttam.Text) = '') then
         lbltpservrealant.Caption := ''
      else
         lbltpservrealant.Caption := copy(linha,StrToInt(edtpservrealantini.Text)+1,StrToInt(edtpservrealanttam.Text));
      //
      if (trim(eddtreadmissaoini.Text) = '1.000') or (eddtreadmissaotam.Text = '    0') or (trim(eddtreadmissaotam.Text) = '') then
         lbldtreadmissao.Caption := ''
      else
         lbldtreadmissao.Caption := copy(linha,StrToInt(eddtreadmissaoini.Text)+1,StrToInt(eddtreadmissaotam.Text));
      //
      if (trim(edopcao1ini.Text) = '1.000') or (edopcao1tam.Text = '    0') or (trim(edopcao1tam.Text) = '') then
         lblopcao1.Caption := ''
      else
         lblopcao1.Caption := copy(linha,StrToInt(edopcao1ini.Text)+1,StrToInt(edopcao1tam.Text));
      //
      if (trim(edopcao2ini.Text) = '1.000') or (edopcao2tam.Text = '    0') or (trim(edopcao2tam.Text) = '') then
         lblopcao2.Caption := ''
      else
         lblopcao2.Caption := copy(linha,StrToInt(edopcao2ini.Text)+1,StrToInt(edopcao2tam.Text));
      //
      if (trim(edopcao3ini.Text) = '1.000') or (edopcao3tam.Text = '    0') or (trim(edopcao3tam.Text) = '') then
         lblopcao3.Caption := ''
      else
         lblopcao3.Caption := copy(linha,StrToInt(edopcao3ini.Text)+1,StrToInt(edopcao3tam.Text));
      //
      if (trim(eddtmorteini.Text) = '1.000') or (eddtmortetam.Text = '    0') or (trim(eddtmortetam.Text) = '') then
         lbldtmorte.Caption := ''
      else
         lbldtmorte.Caption := copy(linha,StrToInt(eddtmorteini.Text)+1,StrToInt(eddtmortetam.Text));
      //
      if (trim(ednumdepenini.Text) = '1.000') or (ednumdepentam.Text = '    0') or (trim(ednumdepentam.Text) = '') then
         lbldep.Caption := ''
      else
         lbldep.Caption := copy(linha,StrToInt(ednumdepenini.Text)+1,StrToInt(ednumdepentam.Text));
      //
      if (trim(ednumdepensalfamini.Text) = '1.000') or (ednumdepensalfamtam.Text = '    0') or (trim(ednumdepensalfamtam.Text) = '') then
         lbldepsalfam.Caption := ''
      else
         lbldepsalfam.Caption := copy(linha,StrToInt(ednumdepensalfamini.Text)+1,StrToInt(ednumdepensalfamtam.Text));
      //
      if (trim(edtpservantini.Text) = '1.000') or (edtpservanttam.Text = '    0') or (trim(edtpservanttam.Text) = '') then
         lbltpservant.Caption := ''
      else
         lbltpservant.Caption := copy(linha,StrToInt(edtpservantini.Text)+1,StrToInt(edtpservanttam.Text));
      //
      if (trim(edopcao4ini.Text) = '1.000') or (edopcao4tam.Text = '    0') or (trim(edopcao4tam.Text) = '') then
         lblopcao4.Caption := ''
      else
         lblopcao4.Caption := copy(linha,StrToInt(edopcao4ini.Text)+1,StrToInt(edopcao4tam.Text));
      //
      if (trim(edopcao5ini.Text) = '1.000') or (edopcao5tam.Text = '    0') or (trim(edopcao5tam.Text) = '') then
         lblopcao5.Caption := ''
      else
         lblopcao5.Caption := copy(linha,StrToInt(edopcao5ini.Text)+1,StrToInt(edopcao5tam.Text));
      //
      if (trim(edopcao6ini.Text) = '1.000') or (edopcao6tam.Text = '    0') or (trim(edopcao6tam.Text) = '') then
         lblopcao6.Caption := ''
      else
         lblopcao6.Caption := copy(linha,StrToInt(edopcao6ini.Text)+1,StrToInt(edopcao6tam.Text));
      //
      if (trim(edemailini.Text) = '1.000') or (edemailtam.Text = '    0') or (trim(edemailtam.Text) = '') then
         lblemail.Caption := ''
      else
         lblemail.Caption := copy(linha,StrToInt(edemailini.Text)+1,StrToInt(edemailtam.Text));
      //
      if (trim(edtaxaini.Text) = '1.000') or (edtaxatam.Text = '    0') or (trim(edtaxatam.Text) = '') then
         lbltaxa.Caption := ''
      else
         lbltaxa.Caption := copy(linha,StrToInt(edtaxaini.Text)+1,StrToInt(edtaxatam.Text));

     CloseFile(F);
  end;


  //lotações
  if edtArquivoTexto2.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto2.Text);
     Reset(F);
     ReadLn(F,linha);

      //
      if (trim(DBRealEdit30.Text) = '1.000') or (DBRealEdit29.Text = '    0')  or (trim(DBRealEdit29.Text) = '') then
         lblLTmatricula.Caption := ''
      else
         lblLTmatricula.Caption := copy(linha,StrToInt(DBRealEdit30.Text)+1,StrToInt(DBRealEdit29.Text));
      //
      if (trim(DBRealEdit32.Text) = '1.000') or (DBRealEdit31.Text = '    0')  or (trim(DBRealEdit31.Text) = '') then
         lblLTIncricao.Caption := ''
      else
         lblLTIncricao.Caption := copy(linha,StrToInt(DBRealEdit32.Text)+1,StrToInt(DBRealEdit31.Text));
      //
      if (trim(DBRealEdit34.Text) = '1.000') or (DBRealEdit33.Text = '    0')  or (trim(DBRealEdit33.Text) = '') then
         lblLTlocal.Caption := ''
      else
         lblLTlocal.Caption := copy(linha,StrToInt(DBRealEdit34.Text)+1,StrToInt(DBRealEdit33.Text));
      //
      if (trim(DBRealEdit36.Text) = '1.000') or (DBRealEdit35.Text = '    0') or (trim(DBRealEdit35.Text) = '') then
         lblLTOrgao.Caption := ''
      else
         lblLTOrgao.Caption := copy(linha,StrToInt(DBRealEdit36.Text)+1,StrToInt(DBRealEdit35.Text));

     CloseFile(F);
  end;



  //endereço
  if edtArquivoTexto3.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto3.Text);
     Reset(F);
     ReadLn(F,linha);

      //
      if (trim(DBRealEdit38.Text) = '1.000') or (DBRealEdit37.Text = '    0') or (trim(DBRealEdit37.Text) = '') then
         lblMatricula.Caption := ''
      else
         lblMatricula.Caption := copy(linha,StrToInt(DBRealEdit38.Text)+1,StrToInt(DBRealEdit37.Text));
      //
      if (trim(DBRealEdit40.Text) = '1.000') or (DBRealEdit39.Text = '    0') or (trim(DBRealEdit39.Text) = '') then
         lblInscricao.Caption := ''
      else
         lblInscricao.Caption := copy(linha,StrToInt(DBRealEdit40.Text)+1,StrToInt(DBRealEdit39.Text));
      //
      if (trim(DBRealEdit42.Text) = '1.000')or (DBRealEdit41.Text = '    0') or (trim(DBRealEdit41.Text) = '')then
         lblLogradouro.Caption := ''
      else
         lblLogradouro.Caption := copy(linha,StrToInt(DBRealEdit42.Text)+1,StrToInt(DBRealEdit41.Text));
      //
      if (trim(DBRealEdit46.Text) = '1.000') or (DBRealEdit45.Text = '    0')  or (trim(DBRealEdit45.Text) = '') then
         lblBairro.Caption := ''
      else
         lblBairro.Caption := copy(linha,StrToInt(DBRealEdit46.Text)+1,StrToInt(DBRealEdit45.Text));
      //
      if (trim(DBRealEdit44.Text) = '1.000')or (DBRealEdit43.Text = '    0') or (trim(DBRealEdit43.Text) = '') then
         lblCEP.Caption := ''
      else
         lblCEP.Caption := copy(linha,StrToInt(DBRealEdit44.Text)+1,StrToInt(DBRealEdit43.Text));
      //
      if (trim(DBRealEdit48.Text) = '1.000')or (DBRealEdit47.Text = '    0') or (trim(DBRealEdit47.Text) = '')  then
         lblMunicipio.Caption := ''
      else
         lblMunicipio.Caption := copy(linha,StrToInt(DBRealEdit48.Text)+1,StrToInt(DBRealEdit47.Text));
      //
      if (trim(DBRealEdit50.Text) = '1.000')or (DBRealEdit49.Text = '    0') or (trim(DBRealEdit49.Text) = '') then
         lbluf.Caption := ''
      else
         lbluf.Caption := copy(linha,StrToInt(DBRealEdit50.Text)+1,StrToInt(DBRealEdit49.Text));
      //
      if (trim(DBRealEdit52.Text) = '1.000') or (DBRealEdit51.Text = '    0')  or (trim(DBRealEdit51.Text) = '') then
         lblTelefone.Caption := ''
      else
         lblTelefone.Caption := copy(linha,StrToInt(DBRealEdit52.Text)+1,StrToInt(DBRealEdit51.Text));
      //
      if (trim(DBRealEdit22.Text) = '1.000') or (DBRealEdit21.Text = '    0')  or (trim(DBRealEdit21.Text) = '') then
         lblddd.Caption := ''
      else
         lblddd.Caption := copy(linha,StrToInt(DBRealEdit22.Text)+1,StrToInt(DBRealEdit21.Text));

     CloseFile(F);
  end;


  // eventos
  if edtArquivoTexto4.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto4.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit54.Text) = '1.000') or (DBRealEdit53.Text = '    0') or (trim(DBRealEdit53.Text) = '') then
         lblEVMatricula.Caption := ''
      else
         lblEVMatricula.Caption := copy(linha,StrToInt(DBRealEdit54.Text)+1,StrToInt(DBRealEdit53.Text));
      //
       if (trim(DBRealEdit56.Text) = '1.000') or (DBRealEdit55.Text = '    0') or (trim(DBRealEdit55.Text) = '') then
         lblEVInscricao.Caption := ''
      else
         lblEVInscricao.Caption := copy(linha,StrToInt(DBRealEdit56.Text)+1,StrToInt(DBRealEdit55.Text));
      //
       if (trim(DBRealEdit62.Text) = '1.000') or (DBRealEdit61.Text = '    0')  or (trim(DBRealEdit61.Text) = '') then
         lblEVENTOS.Caption := ''
      else
         lblEVENTOS.Caption := copy(linha,StrToInt(DBRealEdit62.Text)+1,StrToInt(DBRealEdit61.Text));
      //
       if (trim(DBRealEdit66.Text) = '1.000') or (DBRealEdit65.Text = '    0') or (trim(DBRealEdit65.Text) = '') then
         lblEVdtini.Caption := ''
      else
         lblEVdtini.Caption := copy(linha,StrToInt(DBRealEdit66.Text)+1,StrToInt(DBRealEdit65.Text));
      //
       if (trim(DBRealEdit64.Text) = '1.000') or (DBRealEdit63.Text = '    0') or (trim(DBRealEdit63.Text) = '') then
         lblEVdtfim.Caption := ''
      else
         lblEVdtfim.Caption := copy(linha,StrToInt(DBRealEdit64.Text)+1,StrToInt(DBRealEdit63.Text));
      //
       if (trim(dbedsitfuncini.Text) = '1.000') or (dbedsitfunctam.Text = '    0') or (trim(dbedsitfunctam.Text) = '') then
         lblevsitfunc.Caption := ''
      else
         lblevsitfunc.Caption := copy(linha,StrToInt(dbedsitfuncini.Text)+1,StrToInt(dbedsitfunctam.Text));
      //
       if (trim(dbedsitpartini.Text) = '1.000') or (dbedsitparttam.Text = '    0') or (trim(dbedsitparttam.Text) = '') then
         lblevsitpart.Caption := ''
      else
         lblevsitpart.Caption := copy(linha,StrToInt(dbedsitpartini.Text)+1,StrToInt(dbedsitparttam.Text));
      //
       if (trim(dbedsitplanotam.Text) = '1.000') or (dbedsitplanotam.Text = '    0') or (trim(dbedsitplanotam.Text) = '') then
         lblevsitplano.Caption := ''
      else
         lblevsitplano.Caption := copy(linha,StrToInt(dbedsitplanoini.Text)+1,StrToInt(dbedsitplanotam.Text));




     CloseFile(F);
  end;


  //
  if edtArquivoTexto5.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto5.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit72.Text) = '1.000') or (DBRealEdit71.Text = '    0') or (trim(DBRealEdit71.Text) = '') then
         lblRBcodigo.Caption := ''
      else
         lblRBcodigo.Caption := copy(linha,StrToInt(DBRealEdit72.Text)+1,StrToInt(DBRealEdit71.Text));
      //
       if (trim(DBRealEdit76.Text) = '1.000') or (DBRealEdit75.Text = '    0') or (trim(DBRealEdit75.Text) = '') then
         lblRBdescricao.Caption := ''
      else
         lblRBdescricao.Caption := copy(linha,StrToInt(DBRealEdit76.Text)+1,StrToInt(DBRealEdit75.Text));
      //
       if (trim(DBRealEdit74.Text) = '1.000') or (DBRealEdit73.Text = '    0') or (trim(DBRealEdit73.Text) = '') then
         lblRBtipo.Caption := ''
      else
         lblRBtipo.Caption := copy(linha,StrToInt(DBRealEdit74.Text)+1,StrToInt(DBRealEdit73.Text));
      //
       if (trim(DBRealEdit78.Text) = '1.000') or (DBRealEdit77.Text = '    0') or (trim(DBRealEdit77.Text) = '') then
         lblRBIncide.Caption := ''
      else
         lblRBIncide.Caption := copy(linha,StrToInt(DBRealEdit78.Text)+1,StrToInt(DBRealEdit77.Text));

     CloseFile(F);
  end;


  //
  if edtArquivoTexto6.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto6.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit101.Text) = '1.000') or (DBRealEdit100.Text = '    0') or (trim(DBRealEdit100.Text) = '') then
         lblbanco.Caption := ''
      else
         lblbanco.Caption := copy(linha,StrToInt(DBRealEdit101.Text)+1,StrToInt(DBRealEdit100.Text));
      //
       if (trim(DBRealEdit104.Text) = '1.000') or (DBRealEdit105.Text = '    0') or (trim(DBRealEdit105.Text) = '') then
         lblagencia.Caption := ''
      else
         lblagencia.Caption := copy(linha,StrToInt(DBRealEdit104.Text)+1,StrToInt(DBRealEdit105.Text));
      //
       if (trim(DBRealEdit103.Text) = '1.000') or (DBRealEdit102.Text = '    0') or (trim(DBRealEdit102.Text) = '') then
         lblBBdescricao.Caption := ''
      else
         lblBBdescricao.Caption := copy(linha,StrToInt(DBRealEdit103.Text)+1,StrToInt(DBRealEdit102.Text));
      //
       if (trim(DBRealEdit58.Text) = '1.000') or (DBRealEdit57.Text = '    0') or (trim(DBRealEdit57.Text) = '') then
         lblAGdescricao.Caption := ''
      else
         lblAGdescricao.Caption := copy(linha,StrToInt(DBRealEdit58.Text)+1,StrToInt(DBRealEdit57.Text));

     CloseFile(F);
  end;


  //
  if edtArquivoTexto7.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto7.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit96.Text) = '1.000') or (DBRealEdit95.Text = '    0') or (trim(DBRealEdit95.Text) = '') then
         lblCargoCod.Caption := ''
      else
         lblCargoCod.Caption := copy(linha,StrToInt(DBRealEdit96.Text)+1,StrToInt(DBRealEdit95.Text));
      //
       if (trim(DBRealEdit98.Text) = '1.000') or (DBRealEdit97.Text = '    0') or (trim(DBRealEdit97.Text) = '') then
         lblCargoDesc.Caption := ''
      else
         lblCargoDesc.Caption := copy(linha,StrToInt(DBRealEdit98.Text)+1,StrToInt(DBRealEdit97.Text));

     CloseFile(F);
  end;


  //
  if edtArquivoTexto8.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto8.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit92.Text) = '1.000') or (DBRealEdit91.Text = '    0') or (trim(DBRealEdit91.Text) = '') then
         lblNivelCodigo.Caption := ''
      else
         lblNivelCodigo.Caption := copy(linha,StrToInt(DBRealEdit92.Text)+1,StrToInt(DBRealEdit91.Text));
      //
       if (trim(DBRealEdit94.Text) = '1.000') or (DBRealEdit93.Text = '    0') or (trim(DBRealEdit93.Text) = '') then
         lblvalor.Caption := ''
      else
         lblvalor.Caption := copy(linha,StrToInt(DBRealEdit94.Text)+1,StrToInt(DBRealEdit93.Text));

     CloseFile(F);
  end;


  //
  if edtArquivoTexto9.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto9.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit84.Text) = '1.000') or (DBRealEdit83.Text = '    0') or (trim(DBRealEdit83.Text) = '') then
         lblorgaocodigo.Caption := ''
      else
         lblorgaocodigo.Caption := copy(linha,StrToInt(DBRealEdit84.Text)+1,StrToInt(DBRealEdit83.Text));
      //
       if (trim(DBRealEdit86.Text) = '1.000') or (DBRealEdit85.Text = '    0') or (trim(DBRealEdit85.Text) = '') then
         lblorgaodescricao.Caption := ''
      else
         lblorgaodescricao.Caption := copy(linha,StrToInt(DBRealEdit86.Text)+1,StrToInt(DBRealEdit85.Text));
      //
       if (trim(DBRealEdit89.Text) = '1.000') or (DBRealEdit90.Text = '    0') or (trim(DBRealEdit90.Text) = '') then
         lblorgaolocal.Caption := ''
      else
         lblorgaolocal.Caption := copy(linha,StrToInt(DBRealEdit89.Text)+1,StrToInt(DBRealEdit90.Text));

     CloseFile(F);
  end;


  //
  if edtArquivoTexto10.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto10.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(DBRealEdit80.Text) = '1.000') or (DBRealEdit79.Text = '    0') or (trim(DBRealEdit79.Text) = '') then
         lbleventoscodigo.Caption := ''
      else
         lbleventoscodigo.Caption := copy(linha,StrToInt(DBRealEdit80.Text)+1,StrToInt(DBRealEdit79.Text));
      //
       if (trim(DBRealEdit82.Text) = '1.000') or (DBRealEdit81.Text = '    0') or (trim(DBRealEdit81.Text) = '') then
         lbleventosdescricao.Caption := ''
      else
         lbleventosdescricao.Caption := copy(linha,StrToInt(DBRealEdit82.Text)+1,StrToInt(DBRealEdit81.Text));

     CloseFile(F);
  end;


  if edtArquivoTexto11.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTexto11.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(dbreLocalCodIni.Text) = '1.000') or (dbreLocalCodTam.Text = '    0') or (trim(dbreLocalCodTam.Text) = '') then
         lblCodLocal.Caption := ''
      else
         lblCodLocal.Caption := copy(linha,StrToInt(dbreLocalCodIni.Text)+1,StrToInt(dbreLocalCodTam.Text));
      //
      if (trim(dbreLocalDescIni.Text) = '1.000') or (dbreLocalDescTam.Text = '    0') or (trim(dbreLocalDescTam.Text) = '') then
         lblDescLocal.Caption := ''
      else
         lblDescLocal.Caption := copy(linha,StrToInt(dbreLocalDescIni.Text)+1,StrToInt(dbreLocalDescTam.Text));
      //
      if (trim(dbreTipoLocalIni.Text) = '1.000') or (dbreTipoLocalTam.Text = '    0') or (trim(dbreTipoLocalTam.Text) = '') then
         lblTipoLocal.Caption := ''
      else
         lblTipoLocal.Caption := copy(linha,StrToInt(dbreTipoLocalIni.Text)+1,StrToInt(dbreTipoLocalTam.Text));
      //
      if (trim(dbreSiglaLocalIni.Text) = '1.000') or (dbreSiglaLocalTam.Text = '    0') or (trim(dbreSiglaLocalTam.Text) = '') then
         lblSiglaLocal.Caption := ''
      else
         lblSiglaLocal.Caption := copy(linha,StrToInt(dbreSiglaLocalIni.Text)+1,StrToInt(dbreSiglaLocalTam.Text));
      //
      if (trim(dbreCgcLocalIni.Text) = '1.000') or (dbreCgcLocalTam.Text = '    0') or (trim(dbreCgcLocalTam.Text) = '') then
         lblCgcLocal.Caption := ''
      else
         lblCgcLocal.Caption := copy(linha,StrToInt(dbreCgcLocalIni.Text)+1,StrToInt(dbreCgcLocalTam.Text));
      //
      if (trim(dbreDtFimLocalIni.Text) = '1.000') or (dbreDtFimLocalTam.Text = '    0') or (trim(dbreDtFimLocalTam.Text) = '') then
         lblDtFimLocal.Caption := ''
      else
         lblDtFimLocal.Caption := copy(linha,StrToInt(dbreDtFimLocalIni.Text)+1,StrToInt(dbreDtFimLocalTam.Text));

     CloseFile(F);
  end;


  //dependentes
  if edtArquivoTextoDep.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTextoDep.Text);
     Reset(F);
     ReadLn(F,linha);

      //
       if (trim(edmatriculadepini.Text) = '1.000') or (edmatriculadeptam.Text = '    0') or (trim(edmatriculadeptam.Text) = '') then
         lblmatriculadep.Caption := ''
      else
         lblmatriculadep.Caption := copy(linha,StrToInt(edmatriculadepini.Text)+1,StrToInt(edmatriculadeptam.Text));
      //
      if (trim(edinscricaodepini.Text) = '1.000') or (edinscricaodeptam.Text = '    0') or (trim(edinscricaodeptam.Text) = '') then
         lblinscricaodep.Caption := ''
      else
         lblinscricaodep.Caption := copy(linha,StrToInt(edinscricaodepini.Text)+1,StrToInt(edinscricaodeptam.Text));
      //
      if (trim(ednomedepini.Text) = '1.000') or (ednomedeptam.Text = '    0') or (trim(ednomedeptam.Text) = '') then
         lblnomedep.Caption := ''
      else
         lblnomedep.Caption := copy(linha,StrToInt(ednomedepini.Text)+1,StrToInt(ednomedeptam.Text));
      //
      if (trim(edsexodepini.Text) = '1.000') or (edsexodeptam.Text = '    0') or (trim(edsexodeptam.Text) = '') then
         lblsexodep.Caption := ''
      else
         lblsexodep.Caption := copy(linha,StrToInt(edsexodepini.Text)+1,StrToInt(edsexodeptam.Text));
      //
      if (trim(edseqdepini.Text) = '1.000') or (edseqdeptam.Text = '    0') or (trim(edseqdeptam.Text) = '') then
         lblseqdep.Caption := ''
      else
         lblseqdep.Caption := copy(linha,StrToInt(edseqdepini.Text)+1,StrToInt(edseqdeptam.Text));
      //
      if (trim(edestcivdepini.Text) = '1.000') or (edestcivdeptam.Text = '    0') or (trim(edestcivdeptam.Text) = '') then
         lblestcivdep.Caption := ''
      else
         lblestcivdep.Caption := copy(linha,StrToInt(edestcivdepini.Text)+1,StrToInt(edestcivdeptam.Text));
      //
      if (trim(edindiceirdepini.Text) = '1.000') or (edindiceirdeptam.Text = '    0') or (trim(edindiceirdeptam.Text) = '') then
         lblindirdep.Caption := ''
      else
         lblindirdep.Caption := copy(linha,StrToInt(edindiceirdepini.Text)+1,StrToInt(edindiceirdeptam.Text));
      //
      if (trim(edindinvalidezini.Text) = '1.000') or (edindinvalideztam.Text = '    0') or (trim(edindinvalideztam.Text) = '') then
         lblindinvalidezdep.Caption := ''
      else
         lblindinvalidezdep.Caption := copy(linha,StrToInt(edindinvalidezini.Text)+1,StrToInt(edindinvalideztam.Text));
      //
      if (trim(eddtnascdepini.Text) = '1.000') or (eddtnascdeptam.Text = '    0') or (trim(eddtnascdeptam.Text) = '') then
         lbldatanascdep.Caption := ''
      else
         lbldatanascdep.Caption := copy(linha,StrToInt(eddtnascdepini.Text)+1,StrToInt(eddtnascdeptam.Text));
      //
      if (trim(eddtiniciodepini.Text) = '1.000') or (eddtiniciodeptam.Text = '    0') or (trim(eddtiniciodeptam.Text) = '') then
         lbldatainiciodep.Caption := ''
      else
         lbldatainiciodep.Caption := copy(linha,StrToInt(eddtiniciodepini.Text)+1,StrToInt(eddtiniciodeptam.Text));
      //
      if (trim(edindsalfamini.Text) = '1.000') or (edindsalfamtam.Text = '    0') or (trim(edindsalfamtam.Text) = '') then
         lblsalfamdep.Caption := ''
      else
         lblsalfamdep.Caption := copy(linha,StrToInt(edindsalfamini.Text)+1,StrToInt(edindsalfamtam.Text));
      //
      if (trim(edgraudepini.Text) = '1.000') or (edgraudeptam.Text = '    0') or (trim(edgraudeptam.Text) = '') then
         lblgraudep.Caption := ''
      else
         lblgraudep.Caption := copy(linha,StrToInt(edgraudepini.Text)+1,StrToInt(edgraudepTam.Text));
      //


     CloseFile(F);
  end;

  //evolução funcional
  if edtArquivoTextoEvolFunc.text <> '*.txt' then
  begin
     AssignFile(F,edtArquivoTextoEvolFunc.Text);
     Reset(F);
     ReadLn(F,linha);

      //
      if (trim(edmatriculaevini.Text) = '1.000') or (edmatriculaevtam.Text = '    0') or (trim(edmatriculaevtam.Text) = '') then
         lblmatriculaev.Caption := ''
      else
         lblmatriculaev.Caption := copy(linha,StrToInt(edmatriculaevini.Text)+1,StrToInt(edmatriculaevtam.Text));
      //
      if (trim(edinscricaoevini.Text) = '1.000') or (edinscricaoevtam.Text = '    0') or (trim(edinscricaoevtam.Text) = '') then
         lblinscricaoev.Caption := ''
      else
         lblinscricaoev.Caption := copy(linha,StrToInt(edinscricaoevini.Text)+1,StrToInt(edinscricaoevtam.Text));
      //
      if (trim(edcargoevini.Text) = '1.000') or (edcargoevtam.Text = '    0') or (trim(edcargoevtam.Text) = '') then
         lblcargoev.Caption := ''
      else
         lblcargoev.Caption := copy(linha,StrToInt(edcargoevini.Text)+1,StrToInt(edcargoevtam.Text));
      //
      if (trim(eddatainievini.Text) = '1.000') or (eddatainievtam.Text = '    0') or (trim(eddatainievtam.Text) = '') then
         lbldtiiev.Caption := ''
      else
         lbldtiiev.Caption := copy(linha,StrToInt(eddatainievini.Text)+1,StrToInt(eddatainievtam.Text));
      //
      if (trim(eddatafimevini.Text) = '1.000') or (eddatafimevtam.Text = '    0') or (trim(eddatafimevtam.Text) = '') then
         bldtfimev.Caption := ''
      else
         bldtfimev.Caption := copy(linha,StrToInt(eddatafimevini.Text)+1,StrToInt(eddatafimevtam.Text));
      //
      if (trim(edpadicevini.Text) = '1.000') or (edpadicevtam.Text = '    0') or (trim(edpadicevtam.Text) = '') then
         lblperadicev.Caption := ''
      else
         lblperadicev.Caption := copy(linha,StrToInt(edpadicevini.Text)+1,StrToInt(edpadicevtam.Text));
      //
      if (trim(edmodoini.Text) = '1.000') or (edmodotam.Text = '    0') or (trim(edmodotam.Text) = '') then
         lblmodo.Caption := ''
      else
         lblmodo.Caption := copy(linha,StrToInt(edmodoini.Text)+1,StrToInt(edmodotam.Text));
      //
      if (trim(edtiporegini.Text) = '1.000') or (edtiporegtam.Text = '    0') or (trim(edtiporegtam.Text) = '') then
         lbltiporeg.Caption := ''
      else
         lbltiporeg.Caption := copy(linha,StrToInt(edtiporegini.Text)+1,StrToInt(edtiporegtam.Text));
      //
      if (trim(edqtdeminini.Text) = '1.000') or (edqtdemintam.Text = '    0') or (trim(edqtdemintam.Text) = '') then
         lblqtdemin.Caption := ''
      else
         lblqtdemin.Caption := copy(linha,StrToInt(edqtdeminini.Text)+1,StrToInt(edqtdemintam.Text));

     CloseFile(F);
  end;

  // contatos
  if edtTestaContatos.text <> '*.txt' then
  begin
     AssignFile(F,edtTestaContatos.Text);
     Reset(F);
     ReadLn(F,linha);

      //
      if (trim(edmatriculaevini.Text) = '1.000') or (edmatriculaevtam.Text = '    0') or (trim(edmatriculaevtam.Text) = '') then
         lblmatriculaev.Caption := ''
      else
         lblmatriculaev.Caption := copy(linha,StrToInt(edmatriculaevini.Text)+1,StrToInt(edmatriculaevtam.Text));
      //
      if (trim(edinscricaoevini.Text) = '1.000') or (edinscricaoevtam.Text = '    0') or (trim(edinscricaoevtam.Text) = '') then
         lblinscricaoev.Caption := ''
      else
         lblinscricaoev.Caption := copy(linha,StrToInt(edinscricaoevini.Text)+1,StrToInt(edinscricaoevtam.Text));
      //
      if (trim(edcargoevini.Text) = '1.000') or (edcargoevtam.Text = '    0') or (trim(edcargoevtam.Text) = '') then
         lblcargoev.Caption := ''
      else
         lblcargoev.Caption := copy(linha,StrToInt(edcargoevini.Text)+1,StrToInt(edcargoevtam.Text));
      //
      if (trim(eddatainievini.Text) = '1.000') or (eddatainievtam.Text = '    0') or (trim(eddatainievtam.Text) = '') then
         lbldtiiev.Caption := ''
      else
         lbldtiiev.Caption := copy(linha,StrToInt(eddatainievini.Text)+1,StrToInt(eddatainievtam.Text));
      //
      if (trim(eddatafimevini.Text) = '1.000') or (eddatafimevtam.Text = '    0') or (trim(eddatafimevtam.Text) = '') then
         bldtfimev.Caption := ''
      else
         bldtfimev.Caption := copy(linha,StrToInt(eddatafimevini.Text)+1,StrToInt(eddatafimevtam.Text));
      //
      if (trim(edpadicevini.Text) = '1.000') or (edpadicevtam.Text = '    0') or (trim(edpadicevtam.Text) = '') then
         lblperadicev.Caption := ''
      else
         lblperadicev.Caption := copy(linha,StrToInt(edpadicevini.Text)+1,StrToInt(edpadicevtam.Text));
      //
     CloseFile(F);
  end; // contatos

end;

procedure TfrmCadInterfacePatro.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('CODPATRO').AsInteger := 0;
  qry.Open;

  qryDep.Close;
  qryDep.ParamByName('CODPATRO').AsInteger := 0;
  qryDep.Open;

  qryEvol.Close;
  qryEvol.ParamByName('CODPATRO').AsInteger := 0;
  qryEvol.Open;

  qryfunc.Close;
  qryfunc.ParamByName('CODPATRO').AsInteger := 0;
  qryfunc.Open;

  qryContato.Close;
  qryContato.ParamByName('CODPATRO').AsInteger := 0;
  qryContato.Open;

  qryTipoDocPessoa.open;

  qryPatro.Close;
  qryPatro.ParamByName('CODPATRO').AsInteger := 0;
  qryPatro.Open;

  {-----}

  AtualizaPosLancamento;


  Zeravar;
  bCad   := true;
  MontaPaineis;
  rdgrpOpMat.visible := (dbgrpChave.visible) and (dbgrpChave.itemindex = 0);  

end;

procedure TfrmCadInterfacePatro.FormActivate(Sender: TObject);
begin
  inherited;
  //LimpaCampos;
  qryPatroCombo.Close;
  qryPatroCombo.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPatroCombo.Open;
end;

procedure TfrmCadInterfacePatro.CmeCadastroInsert(Sender: TObject);
begin


  inherited;
  //

  qrydep.Insert;
  qryevol.Insert;
  qryfunc.insert;
  qryContato.Insert;

  dbcRubricaAtraso.Checked := False;


  qrydep.FieldByName('IDPESSJUR').AsInteger := qry.fieldbyname('IDPESSJUR').AsInteger;
  qryevol.FieldByName('IDPESSJUR').AsInteger := qry.fieldbyname('IDPESSJUR').AsInteger;
  qryfunc.FieldByName('IDPESSJUR').AsInteger := qry.fieldbyname('IDPESSJUR').AsInteger;
  qryContato.FieldByName('IDPESSJUR').AsInteger := qry.fieldbyname('IDPESSJUR').AsInteger;

  //LimpaCampos;
  dblcPatro.SetFocus;
end;
procedure TfrmCadInterfacePatro.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  //

  qrydep.edit;
  qryevol.edit;
  qryfunc.Edit;
  qryContato.Edit;
  //LimpaCampos;
  dblcPatro.SetFocus;
end;

procedure TfrmCadInterfacePatro.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    qry.Close;
    qry.ParamByName('CODPATRO').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
    qry.Open;

    qryDep.Close;
    qryDep.ParamByName('CODPATRO').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
    qryDep.Open;

    qryEvol.Close;
    qryEvol.ParamByName('CODPATRO').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
    qryEvol.Open;

    qryfunc.Close;
    qryfunc.ParamByName('CODPATRO').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
    qryfunc.Open;

    qryContato.Close;
    qryContato.ParamByName('CODPATRO').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
    qryContato.Open;

    qryPatro.Close;
    qryPatro.ParamByName('CODPATRO').AsInteger:=StrToInt(MontaSelect.ValoresChave[0]);
    qryPatro.Open;

    {-----}

    AtualizaPosLancamento;
  end;
end;

procedure TfrmCadInterfacePatro.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  qry.fieldByName('FLGCALCSALPART').AsString   := 'C';
  qry.fieldByName('FLGTIPOSEPARADEC').AsString := 'P';
  qry.fieldByName('CODPROVDUPLO').AsInteger    := 2;
end;

procedure TfrmCadInterfacePatro.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto1.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto2.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.tbcadendDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto3.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto4.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto6.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto5.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto7.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto8.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto9.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto10.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto3.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.dbchkLancamento1Exit(Sender: TObject);
begin
  inherited;
  AtualizaPosLancamento;
end;

procedure TfrmCadInterfacePatro.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTexto11.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.fcOutOpChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  inherited;

  ZeraVar;


  if fcOutOp.ActivePage = OutOpICadastral then
  begin
     bCad := true;
     OpCadastral.items[0].selected := true;
  end
  else   if fcOutOp.ActivePage = OutOpIFinanc then
  begin
     bFinanc := true;
     OpFinanc.items[0].selected := true;
  end
  else   if fcOutOp.ActivePage = OutOpITabelas then
  begin
     bAgencias := true;
     OpTabelas.items[0].selected := true;
  end
  else   if fcOutOp.ActivePage = OutOpITestes then
  begin
     bTesteCad := true;
     OpTestes.items[0].selected := true;
  end;

  MontaPaineis;
end;

procedure TfrmCadInterfacePatro.OpCadastralItemClick(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  ZeraVar;
  case Item.Index of
     0: bCad         := True;
     1: bEnd         := True;
     2: bLotacoes    := True;
     3: beventos     := True;
     4: bdependentes := True;
     5: bEvolFunc    := True;
     6: bContatos    := True;
  end;

  MontaPaineis;

end;


procedure TfrmCadInterfacePatro.ZeraVar;
begin
  //Financeiro
  bFinanc := false;

  //Cadastral
  bCad         := false;
  bLotacoes    := false;
  bEnd         := false;
  beventos     := false;
  bDependentes := false;
  bEvolFunc    := false;
  bContatos    := False;

  //tabelas
  bAgencias := false;
  bCargos := false;
  bNiveis := false;
  bLocais := false;
  bOrgaos := false;
  bsit := false;
  bRubricas := false;

  //testes
  bTesteFinanc := false;
  bTesteCad := false;
  bTesteTabelas := false;
end;

procedure TfrmCadInterfacePatro.OpFinancItemClick(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  ZeraVar;
  bFinanc := true;
  MontaPaineis;
end;

procedure TfrmCadInterfacePatro.opTabelasItemClick(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  ZeraVar;


  case Item.Index of
     0: bAgencias := true;
     1: bCargos := true;
     2: bNiveis := true;
     3: bLocais := true;
     4: bOrgaos := true;
     5: bsit := true;
     6: bRubricas := true;
  end;

   MontaPaineis;
end;

procedure TfrmCadInterfacePatro.opTestesItemClick(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  ZeraVar;


  case Item.Index of
     0: bTesteCad := true;
     1: bTesteFinanc := true;
     2: bTesteTabelas := true;
  end;

   MontaPaineis;

end;

procedure TfrmCadInterfacePatro.MontaPaineis;
begin
  //Financeiro
  if bFinanc then
  begin
     pnlRubricas.Align := AlClient;
     pgcRubricas.Align := AlClient;
     pnlRubricas.BringToFront;
  end;

  //Cadastral
  if bCad then
  begin
     pnlDadosCad.Align := AlClient;
     pgcDadosCad.Align := AlClient;
     pnlDadosCad.BringToFront;
  end;

  if bLotacoes then
  begin
     pnlLotacoes.Align := AlClient;
     pnlLotacoes.BringToFront;
  end;

  if bEnd then
  begin
     pnlEndereco.Align := AlClient;
     pnlEndereco.BringToFront;
  end;

  if bContatos then
  begin
     pnlContatos.Align := AlClient;
     pnlContatos.BringToFront;
  end;

  if beventos then
  begin
     pnlEventos.Align := AlClient;
     pnlEventos.BringToFront;
  end;

  if bDependentes then
  begin
     pnlDependentes.Align := AlClient;
     pnlDependentes.BringToFront;
  end;


  if bEvolFunc then
  begin
     pnlEvolFunc.Align := AlClient;
     pnlEvolFunc.BringToFront;
  end;




  //tabelas
  if bAgencias then
  begin
     pnlTabBancos.Align := AlClient;
     pnlTabBancos.BringToFront;
  end;

  if bCargos then
  begin
     pnlTabCargo.Align := AlClient;
     pnlTabCargo.BringToFront;
  end;

  if bNiveis then
  begin
     pnlTabNivel.Align := AlClient;
     pnlTabNivel.BringToFront;
  end;

  if bLocais then
  begin
     pnlTabLocais.Align := AlClient;
     pnlTabLocais.BringToFront;
  end;

  if bOrgaos then
  begin
     pnlTabOrgao.Align := AlClient;
     pnlTabOrgao.BringToFront;
  end;

  if bsit then
  begin
     pnlTabSituacao.Align := AlClient;
     pnlTabSituacao.BringToFront;
  end;

  if bRubricas then
  begin
     pnlTabRubricas.Align := AlClient;
     pnlTabRubricas.BringToFront;
  end;

  //testes
  if bTesteFinanc then
  begin
     pnlTesteFinanc.Align := AlClient;
     pnlTesteFinanc.BringToFront;
  end;

  if bTesteCad then
  begin
     pnlTesteCadastral.Align := AlClient;
     pgctrTesteDadosCad.Align := AlClient;
     pnlTesteCadastral.BringToFront;
  end;

  if bTesteTabelas then
  begin
     pnlTesteTabelas.Align := AlClient;
     pgctrTesteTabelas.Align := AlClient;
     pnlTesteTabelas.BringToFront;
  end;



end;

procedure TfrmCadInterfacePatro.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTextoDep.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  odTxt.Execute;
  edtArquivoTextoEvolFunc.Text := odTxt.FileName;
end;

procedure TfrmCadInterfacePatro.ToolbarButton971Click(Sender: TObject);
begin
  inherited;

  //testes
  if bFinanc then
  begin
     fcOutOp.ActivePage := OutOpITestes;
     OpTestes.items[1].selected := true;

     pnlTesteFinanc.Align := AlClient;
     pnlTesteFinanc.BringToFront;

     ZeraVar;
     bTesteFinanc := true;
  end
  else if  bCad or bLotacoes or bEnd or  beventos or
           bDependentes or bEvolFunc or bContatos then
  begin
     if  bCad then
        pgctrTesteDadosCad.activepage := tbdadoscad;

     if  bLotacoes then
        pgctrTesteDadosCad.activepage := tbcadlotacoes
     else if  bEnd      then
        pgctrTesteDadosCad.activepage := tbcadend
     else if  beventos then
        pgctrTesteDadosCad.activepage := tbcadeventos
     else if  bDependentes then
        pgctrTesteDadosCad.activepage := tbcaddependentes
     else if  bEvolFunc then
        pgctrTesteDadosCad.activepage := tbcadevolfunc
     else if bContatos then
        pgctrTesteDadosCad.ActivePage := tbCadContatos;


     fcOutOp.ActivePage := OutOpITestes;
     OpTestes.items[0].selected := true;

     pnlTesteCadastral.Align := AlClient;
     pgctrTesteDadosCad.Align := AlClient;
     pnlTesteCadastral.BringToFront;


     ZeraVar;
     bTestecad := true;

  end
  else if bRubricas or  bAgencias or bCargos or bNiveis or
          bOrgaos or bsit or  bLocais    then
  begin

     if bRubricas then
        pgctrTesteTabelas.activepage := tbtesterubrica
     else if bAgencias then
        pgctrTesteTabelas.activepage := tbtesteagencias
     else if bCargos   then
        pgctrTesteTabelas.activepage := tbtestecargos
     else if bNiveis   then
        pgctrTesteTabelas.activepage := tbtesteniveis
     else if bOrgaos   then
        pgctrTesteTabelas.activepage := tbtesteorgaos
     else if bsit      then
        pgctrTesteTabelas.activepage := tbtestesit
     else if bLocais then
        pgctrTesteTabelas.activepage := tbtestelocais;


     fcOutOp.ActivePage := OutOpITestes;
     OpTestes.items[2].selected := true;

     pnlTesteTabelas.Align := AlClient;
     pgctrTesteTabelas.Align := AlClient;
     pnlTesteTabelas.BringToFront;

     ZeraVar;
     bTestetabelas := true;
  end;

end;

procedure TfrmCadInterfacePatro.sbtndiverganalitClick(Sender: TObject);
begin
  inherited;

  //testes
  if bTesteFinanc then
  begin
     fcOutOp.ActivePage := OutOpIFinanc;
     OpFinanc.items[0].selected := true;


     ZeraVar;
     bFinanc := true;

     MontaPaineis;
  end
  else if  bTestecad then
  begin

     ZeraVar;

     fcOutOp.ActivePage := OutOpICadastral;

     if  pgctrTesteDadosCad.activepage = tbdadoscad then
     begin
        bcad := true;
        OpCadastral.items[0].selected := true;
     end
     else if  pgctrTesteDadosCad.activepage = tbcadlotacoes then
     begin
         bLotacoes := true;
         OpCadastral.items[2].selected := true;
     end
     else if  pgctrTesteDadosCad.activepage = tbcadend then
     begin
         bEnd := true;
         OpCadastral.items[1].selected := true;
     end
     else if  pgctrTesteDadosCad.activepage = tbcadeventos then
     begin
         beventos := true;
         OpCadastral.items[3].selected := true;
     end
     else if  pgctrTesteDadosCad.activepage = tbcaddependentes then
     begin
         bDependentes := true;
         OpCadastral.items[4].selected := true;
     end
     else if  pgctrTesteDadosCad.activepage = tbcadevolfunc  then
     begin
         bEvolFunc := true;
         OpCadastral.items[5].selected := true;
     end
     else if  pgctrTesteDadosCad.activepage = tbCadContatos  then
     begin
         bContatos := True;
         OpCadastral.items[6].selected := true;
     end;
     MontaPaineis;
  end
  else if bTestetabelas   then
  begin
     ZeraVar;

     fcOutOp.ActivePage := OutOpITabelas;

     if  pgctrTesteTabelas.activepage = tbtesterubrica then
     begin
         bRubricas := true;
         OpTabelas.items[6].selected := true;
     end
     else if  pgctrTesteTabelas.activepage = tbtesteagencias then
     begin
         bAgencias := true;
         OpTabelas.items[0].selected := true;
     end
     else if  pgctrTesteTabelas.activepage = tbtestecargos then
     begin
         bCargos := true;
         OpTabelas.items[1].selected := true;
     end
     else if  pgctrTesteTabelas.activepage = tbtesteniveis then
     begin
         bNiveis := true;
         OpTabelas.items[2].selected := true;
     end
     else if  pgctrTesteTabelas.activepage = tbtesteorgaos then
     begin
         bOrgaos := true;
         OpTabelas.items[4].selected := true;
     end
     else if  pgctrTesteTabelas.activepage = tbtestesit then
     begin
         bsit := true;
         OpTabelas.items[5].selected := true;
     end
     else if  pgctrTesteTabelas.activepage = tbtestelocais then
     begin
         bLocais := true;
         OpTabelas.items[3].selected := true;
     end;


     MontaPaineis;
  end;



end;

procedure TfrmCadInterfacePatro.CmeCadastroDelete(Sender: TObject);
begin
  inherited;

  qrydep.Delete;
  qryevol.Delete;
  qryfunc.delete;
  qryContato.Delete;
end;

procedure TfrmCadInterfacePatro.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  qrydep.CancelUpdates;
  qryevol.CancelUpdates;
  qryfunc.CancelUpdates;
  qryContato.CancelUpdates;
  qryPatro.CancelUpdates;  
end;

procedure TfrmCadInterfacePatro.dbgrpChaveClick(Sender: TObject);
begin
  inherited;
  rdgrpOpMat.visible := (dbgrpChave.visible) and (dbgrpChave.itemindex = 0); 
end;

procedure TfrmCadInterfacePatro.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  rdgrpOpMat.visible := (dbgrpChave.visible) and (dbgrpChave.itemindex = 0); 
end;

procedure TfrmCadInterfacePatro.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PARAMINTERF.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

end.
