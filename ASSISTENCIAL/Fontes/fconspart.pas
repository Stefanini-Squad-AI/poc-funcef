unit fconspart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, fcClearPanel,
  fcButtonGroup, fcOutlookBar, dConsPart, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Mask, wwdbedit, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db,
  DBTables, Wwquery, MontaSelect, Menus, DBCtrls, DBCGrids, wwdblook,
  ComCtrls, wwriched, DBCtrls2, wwdbdatetimepicker, CMDateTimePicker,  FTelaAut,
  fFrameConsultaHistorico, AppEvnts, FPai, UAutorizacao;

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
    ProcessosJudiciais: TMenuItem;
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
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    Panel7: TPanel;
    Label73: TLabel;
    Panel24: TPanel;
    DBGrContatos: TwwDBGrid;
    DBRichEdObs: TwwDBRichEdit;
    dbgrContaBancaria: TwwDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    dbgriddepen: TwwDBGrid;
    lblnomepatro: TLabel;
    lblNomeCargo: TLabel;
    Label18: TLabel;
    lblSalarioTotal: TLabel;
    lblDataAdmissao: TLabel;
    lblSitFunc: TLabel;
    lblNomeFilial: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label68: TLabel;
    dbednomepatro: TwwDBEdit;
    dbedcargo: TwwDBEdit;
    dbednivel: TwwDBEdit;
    dbedsaltotal: TwwDBEdit;
    dbeddataadmissao: TwwDBEdit;
    dbedsitfunc: TwwDBEdit;
    dbedFilial: TwwDBEdit;
    dbeValor1: TwwDBEdit;
    dbeValor2: TwwDBEdit;
    dbeValor3: TwwDBEdit;
    wwDBEdit18: TwwDBEdit;
    wwDBEdit19: TwwDBEdit;
    wwDBEdit20: TwwDBEdit;
    Panel6: TPanel;
    Label59: TLabel;
    Label60: TLabel;
    pnlHstFuncional: TPanel;
    dbgridhistfunc: TwwDBGrid;
    wwDBEdit13: TwwDBEdit;
    edTempoTotal: TEdit;
    wwDBEdit14: TwwDBEdit;
    edTempoEspecial: TEdit;
    wwDBGrid11: TwwDBGrid;
    Panel28: TPanel;
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
    Panel22: TPanel;
    dbgrdContribPrev: TwwDBGrid;
    Panel15: TPanel;
    dbgrdResPoupanca: TwwDBGrid;
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
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    dblkpcmbFuncao: TwwDBLookupCombo;
    dbDataInicioFuncao: TCMDateTimePicker;
    CMDateTimePicker1: TCMDateTimePicker;
    dblkpcmbModoFuncao: TwwDBLookupCombo;
    wwDBEdit27: TwwDBEdit;
    dbgrdFuncao: TwwDBGrid;
    tbsAdicCompens: TTabSheet;
    pnlAdicCompensatorio: TPanel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    dblkpcmbFuncaoAdicCompens: TwwDBLookupCombo;
    dtInicioAdicCompens: TCMDateTimePicker;
    dtFimAdicCompens: TCMDateTimePicker;
    edPercAdicCompens: TwwDBEdit;
    dbgrdAdicCompens: TwwDBGrid;
    tbsATS: TTabSheet;
    pnlATS: TPanel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    spbtnCalcPercATS: TSpeedButton;
    dbDataInicioATS: TCMDateTimePicker;
    dbDataFinalATS: TCMDateTimePicker;
    dbedValorATS: TDBEdit2;
    dbgrdATS: TwwDBGrid;
    tbsAdicInsalub: TTabSheet;
    Panel29: TPanel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    SpeedButton1: TSpeedButton;
    dtInicioAdicInsalub: TCMDateTimePicker;
    dtFimAdicInsalub: TCMDateTimePicker;
    dbedPercInsalub: TDBEdit2;
    dbgrdAdicInsalub: TwwDBGrid;
    tbsAdicNoturno: TTabSheet;
    pnlAdicNoturno: TPanel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    dtInicioAdicNoturno: TCMDateTimePicker;
    dtFimAdicNoturno: TCMDateTimePicker;
    dbedPercAdicNoturno: TDBEdit2;
    dbedQtdeMinutos: TDBEdit2;
    dbgrdAdicNoturno: TwwDBGrid;
    tbsAdicPericul: TTabSheet;
    Panel32: TPanel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    SpeedButton2: TSpeedButton;
    dtIniAdicPericul: TCMDateTimePicker;
    dtFIMAdicPericul: TCMDateTimePicker;
    dbedPercPericul: TDBEdit2;
    dbgrdAdicPericul: TwwDBGrid;
    tbsRubSal: TTabSheet;
    pnlControlesRubSalarial: TPanel;
    grpMesAnoRef: TGroupBox;
    dbedAnoMesRefRubSal: TwwDBEdit;
    GroupBox1: TGroupBox;
    dbedAnoMesCobRubSal: TwwDBEdit;
    GroupBox3: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    dbedValor: TwwDBEdit;
    dblkpcmbRubrica: TwwDBLookupCombo;
    dbgrdRubSal: TwwDBGrid;
    Bevel1: TBevel;
    Label105: TLabel;
    dbedNomeParticipante: TDBText;
    Label104: TLabel;
    DBText2: TDBText;
    Label103: TLabel;
    DBText3: TDBText;
    DBText6: TDBText;
    Label102: TLabel;
    DBText5: TDBText;
    lblmat: TLabel;
    sbtnCalcEnquadramento: TSpeedButton;
    Label101: TLabel;
    DBText1: TDBText;
    Label106: TLabel;
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
    dbedSitPlano: TwwDBEdit;
    wwDBEdit33: TwwDBEdit;
    wwDBEdit34: TwwDBEdit;
    wwDBEdit36: TwwDBEdit;
    wwDBEdit37: TwwDBEdit;
    wwDBEdit38: TwwDBEdit;
    edClassific: TEdit;
    wwDBEdit39: TwwDBEdit;
    lblSaldosReserva: TLabel;
    wwDBGrid12: TwwDBGrid;
    Panel33: TPanel;
    Panel34: TPanel;
    DblkPlanos: TwwDBLookupCombo;
    Label1: TLabel;
    DbedIdade: TwwDBEdit;
    Label2: TLabel;
    dbgrHistReserva: TwwDBGrid;
    Panel35: TPanel;
    DBCtrlGridTelefones: TDBCtrlGrid;
    wwDBEdit1: TwwDBEdit;
    Label3: TLabel;
    wwDBEdit32: TwwDBEdit;
    Label4: TLabel;
    wwDBEdit35: TwwDBEdit;
    Label63: TLabel;
    wwDBEdit40: TwwDBEdit;
    Label114: TLabel;
    DBCtrlGrid2: TDBCtrlGrid;
    Bevel2: TBevel;
    Label120: TLabel;
    wwDBEdit41: TwwDBEdit;
    Label123: TLabel;
    wwDBEdit44: TwwDBEdit;
    Label126: TLabel;
    wwDBEdit47: TwwDBEdit;
    wwDBEdit48: TwwDBEdit;
    Label127: TLabel;
    wwDBEdit50: TwwDBEdit;
    Label129: TLabel;
    wwDBEdit45: TwwDBEdit;
    Label124: TLabel;
    wwDBEdit42: TwwDBEdit;
    Label121: TLabel;
    wwDBEdit49: TwwDBEdit;
    Label128: TLabel;
    wwDBEdit46: TwwDBEdit;
    Label125: TLabel;
    wwDBEdit43: TwwDBEdit;
    Label122: TLabel;
    Panel36: TPanel;
    DBCtrlGrid3: TDBCtrlGrid;
    wwDBEdit51: TwwDBEdit;
    Label130: TLabel;
    Label131: TLabel;
    wwDBEdit52: TwwDBEdit;
    wwDBEdit53: TwwDBEdit;
    Label132: TLabel;
    Label133: TLabel;
    wwDBEdit54: TwwDBEdit;
    wwDBEdit55: TwwDBEdit;
    wwDBEdit56: TwwDBEdit;
    wwDBEdit57: TwwDBEdit;
    dbtNoneValBase1: TDBText;
    dbtNoneValBase2: TDBText;
    dbtNoneValBase3: TDBText;
    Bevel3: TBevel;
    Label134: TLabel;
    dbedNumElegBenef: TwwDBEdit;
    Label135: TLabel;
    DBCtrlGrid4: TDBCtrlGrid;
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
    Bevel4: TBevel;
    Label151: TLabel;
    wwDBEdit81: TwwDBEdit;
    wwDBEdit82: TwwDBEdit;
    Label156: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    Panel18: TPanel;
    dblkMesCobranca: TwwDBLookupCombo;
    Label74: TLabel;
    Label14: TLabel;
    dblkPatros: TwwDBLookupCombo;
    HistricodeMovimentaes1: TMenuItem;
    Panel37: TPanel;
    dbgridbeneficios: TwwDBGrid;
    Panel38: TPanel;
    dbgrMovBenef: TwwDBGrid;
    wwDBEdit11: TwwDBEdit;
    wwDBEdit15: TwwDBEdit;
    wwDBEdit21: TwwDBEdit;
    wwDBEdit22: TwwDBEdit;
    wwDBEdit23: TwwDBEdit;
    wwDBEdit24: TwwDBEdit;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    wwDBEdit25: TwwDBEdit;
    Label54: TLabel;
    Label159: TLabel;
    wwDBEdit26: TwwDBEdit;
    wwDBEdit83: TwwDBEdit;
    Label160: TLabel;
    Planos1: TMenuItem;
    pnlPrevidenciario: TPanel;
    dbgridPrev: TwwDBGrid;
    pnlAssistencial: TPanel;
    dbgridplanass: TwwDBGrid;
    ApplicationEvents: TApplicationEvents;
    Panel39: TPanel;
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
    Panel41: TPanel;
    Panel42: TPanel;
    Label165: TLabel;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    wwDBEdit87: TwwDBEdit;
    wwDBEdit88: TwwDBEdit;
    wwDBEdit89: TwwDBEdit;
    Edit1: TEdit;
    wwDBGrid3: TwwDBGrid;
    wwDBGrid6: TwwDBGrid;
    Label169: TLabel;
    wwDBEdit90: TwwDBEdit;
    Panel43: TPanel;
    Dock972: TDock97;
    lblBloqueio: TLabel;
    tb97Fundo2: TToolbar97;
    bbtnSair2: TBitBtn;
    bbtnAjuda2: TmaHelpBitBtn;
    bbtnProcurar: TBitBtn;
    sbtnTitular: TBitBtn;
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

  private
   { Private declarations }
    varFields  : variant;
    bInsere    : boolean;
    sStringAux : String;
    i          : Integer;

    nTotOrdem1, nTotOrdem2 : Double;
    lTotOrdem2 : Boolean;

    procedure CloseDatasets;
    function  ContaElegiveisAbeneficio :integer;
    function  ClienteNum(sNumero : string):string;
  public
    { Public declarations }
    { flags de Classificação da pessoa }
    fElegivel, fParticipante_Assistido, fParticipante_Falecido,
    fRecebedor_Beneficio, fDependente, fParticipante_Ativo,
    fParticipante_Cancelado, fBeneficiario,
    fRecebedor_Pensao_Alimenticia, fAlimentado, fTitular : Boolean;
    bAcessaDependente, bAchouLinhaVazia : boolean;
  end;

var
  FRMconspart: TFRMconspart;

  sidpessoaconspart, sidpessjurconspart, sidplanoprevconspart,
  sseqpropostaconspart, sdatabasename, sIDRGELEGBENEF, sIdTitular : String;
  bRodandoElegibilidade : boolean;
  TotalSaldo : Extended;

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
  if nbkElegPart.ActivePage <> 'PgDadosPessoais' then
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
//       tavares 04/05/2002  - Esses parâmetros não são mais necessários
//       ParamByName('IDPESSJUR').AsFloat := StrToInt(sidpessjurconspart);
//       ParamByName('IDPLANOPREV').AsFloat := StrToInt(sidplanoprevconspart);
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
  With dtmConsPart Do
  begin
    With qrycontribprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
//      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
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

    With qrybenef Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrypartprev Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
      ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    end;

    With qrypart Do
    begin
      if Active Then Close;
      if not Prepared then Prepare;
      ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sIdPessoaConspart, -1);
      ParamByName('IDPESSJUR').AsFloat := StrtoIntDef(sidpessjurconspart, -1);
      ParamByName('IDPLANOPREV').AsFloat := StrtoIntDef(sidplanoprevconspart, -1);
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
  dtmConsPart.qryHstVersoes.Close;
  dtmConsPart.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart.qryHstVersoes.Open;
end;

procedure TfrmConsPart.dbgridbeneficiosFieldChanged(Sender: TObject; Field: TField);
begin
  dtmConsPart.qryMovBenef.Close;
  dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
  dtmConsPart.qryMovBenef.Open;
end;

// FDIAS - 13.12.2001 - FCRT
// AS DUAS PRÓXIMAS FUNÇÕES ESTÃO NA UADMPREV
// E FORAM COPIADAS PARA CÁ


//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TfrmConsPart.TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';
//  I := Length(ITempo);
//  Tempo:= Replicate('0',(6-I))+Tempo; // Acerta Tamanho para 6 Casas

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
  dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsInteger :=
  dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsInteger;
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
var ssqlComIdPessjur, ssqlSemIdPessjur : string;
begin
  dtmConsPart.qryHstRubricas.Close;
  ssqlComIdPessjur := '';
  ssqlSemIdPessjur := '';
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
    '(SELECT SUM(DECODE(P1.FLGDESCONTO,1,VALORPROVENTO,0)) AS SUMDESCONTO, '+#13#10+
    '    SUM(DECODE(P1.FLGDESCONTO,0,VALORPROVENTO,0)) AS SUMPROVENTO '+#13#10+
    '    FROM HISTRUBSAL H1, PROVDESC P1 '+#13#10+
    '    WHERE (H1.IDPESSOA = :IDPESSOA)      AND '+#13#10+
    '          (H1.IDMODULO<>18)              AND '+#13#10+
    '          (H1.IDRUBRICA = P1.IDPROVENTO) AND '+#13#10+
    '          (P1.FLGDESCONTO <> 2)          AND '+#13#10+
    '          (H1.MESCOBRANCA = :MESCOBRANCA)) SUMPROVDESC '+#13#10+
    ' WHERE  (H.IDPESSOA = :IDPESSOA)        '+#13#10+
    ' AND    (H.IDRUBRICA = C.IDPROVENTO)    '+#13#10+
    ' AND    (H.MESCOBRANCA =  :MESCOBRANCA) '+#13#10+
    ' AND    (H.IDMODULO <> 18)              '+#13#10+
    ' ORDER BY C.FLGDESCONTO, MES DESC , '+#13#10+
    ' CODPROVDESC        ';

    ssqlComIdPessjur :=  ' SELECT      '+#13#10+
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
    '(SELECT SUM(DECODE(P1.FLGDESCONTO,1,VALORPROVENTO,0)) AS SUMDESCONTO, '+#13#10+
    '    SUM(DECODE(P1.FLGDESCONTO,0,VALORPROVENTO,0)) AS SUMPROVENTO '+#13#10+
    '    FROM HISTRUBSAL H1, PROVDESC P1 '+#13#10+
    '    WHERE (H1.IDPESSOA = :IDPESSOA)      AND '+#13#10+
    '          (H1.IDMODULO<>18)              AND '+#13#10+
    '          (H1.IDRUBRICA = P1.IDPROVENTO) AND '+#13#10+
    '          (P1.FLGDESCONTO <> 2)          AND '+#13#10+
    '          (H1.MESCOBRANCA = :MESCOBRANCA)) SUMPROVDESC '+#13#10+
    ' WHERE  (H.IDPESSOA = :IDPESSOA)        '+#13#10+
    ' AND    (H.IDRUBRICA = C.IDPROVENTO)    '+#13#10+
    ' AND    (H.MESCOBRANCA =  :MESCOBRANCA) '+#13#10+
    ' AND    (H.IDMODULO <> 18)              '+#13#10+
    ' AND    (H.IDPESSJUR = '+DblkPatros.lookupValue+')'+#13#10+
    ' ORDER BY C.FLGDESCONTO, MES DESC , '+#13#10+
    ' CODPROVDESC        ';

  if dtmConsPart.qryHstRubricas.Active then
    dtmConsPart.qryHstRubricas.Close;
  if (dbLkPatros.Text <> '') and (dbLkPatros.LookupValue <> '') then
    dtmConsPart.qryHstRubricas.sql.Text := ssqlComIdPessjur
  else
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
            '''' +DateToStr(date)+ ''' AS DATAREF '+
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
begin
  if (not fTitular) and (not bAcessaDependente) then
  begin
    if FConsPessoaGeral.cIdpessoa <> '' then
      sidpessoaconspart := FConsPessoaGeral.cIdpessoa;
  end;
  if sidpessoaConsPart = '' then
    sidPessoaConsPart := '-1';

    if not dtmConsPart.qryPlanos.Prepared then dtmConsPart.qryPlanos.Prepare;
    dtmConsPart.qryPlanos.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidPessoaConsPart, -1);
    if not dtmConsPart.qryPlanos.Active then dtmConsPart.qryPlanos.Open;
    DblkPlanos.LookupValue := dtmConsPart.qryPlanosIDPLANOPREV.asString;
    DblkPlanos.Enabled := dtmConsPart.qryPlanos.RecordCount > 1;

  if NBKelegpart.ActivePage = 'PgDadosPessoais' then
  begin
    HabilitaMenuItens;
    MostraBloqueio;
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
     sidplanoprevconspart := dtmConsPart.qryPlanosIDPLANOPREV.asString;
     sidpessjurconspart   := dtmConsPart.qryPlanosIDPESSJUR.asString;
     sidplanoprevconspart := dtmConsPart.qryPlanosIDPLANOPREV.asString;
     sseqpropostaconspart := dtmConsPart.qryPlanosSEQPROPOSTA.asString;
     sIDRGELEGBENEF       := dtmConsPart.qryPlanosIDRGELEGBENEF.asString;

      dtmConsPart.DsPartGeral.dataSet.Close;
      if Not dtmConsPart.qrypartgeral.Active then
      begin
        dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qrypartgeral;
        dtmConsPart.qrypartgeral.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
        if dtmConsPart.qrypartgeral.Prepared then dtmConsPart.qrypartgeral.unPrepare;
          dtmConsPart.qrypartgeral.Prepare;
        dtmConsPart.qrypartgeral.Open;
        if not dtmConsPart.qrypartgeral.IsEmpty then
        begin
          frmAguarde.Next;
          frmAguarde.Repaint;
        end;
      end;
      if (dtmConsPart.qrypartgeral.isEmpty) and (dtmConsPart.qrypartgeral.active)then
      begin
        if Not dtmConsPart.qryDependente.Active then
        begin
          dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qryDependente;
          dtmConsPart.qryDependente.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
          if not dtmConsPart.qryDependente.Prepared then dtmConsPart.qryDependente.unPrepare;
            dtmConsPart.qryDependente.Prepare;
          dtmConsPart.qryDependente.Open;
          if not dtmConsPart.qrypartgeral.IsEmpty then
          begin
            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

      //se não é um participante ou dependente  - (só pode ser um recebedor ou um responsável)
      if (dtmConsPart.qryDependente.isEmpty) and  (dtmConsPart.qryDependente.active) then
      begin
  //busca um reponsável não elegível
        if Not dtmConsPart.qryRespNaoElegivel.Active then
        begin
          dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qryRespNaoElegivel;
          dtmConsPart.qryRespNaoElegivel.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
          if not dtmConsPart.qryRespNaoElegivel.Prepared then dtmConsPart.qryRespNaoElegivel.unPrepare;
            dtmConsPart.qryRespNaoElegivel.Prepare;
          dtmConsPart.qryRespNaoElegivel.Open;
          if not dtmConsPart.qrypartgeral.IsEmpty then
          begin
            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

      if (dtmConsPart.qryRespNaoElegivel.isEmpty) and  (dtmConsPart.qryRespNaoElegivel.active) then
      begin
  //busca um recebedor de Pensao Alimentícia
        if not dtmConsPart.qryRecebedorPensaoAlim.Active then
        begin
          if not dtmConsPart.qryRecebedorPensaoAlim.Prepared then
            dtmConsPart.qryRecebedorPensaoAlim.Prepare;
          dtmConsPart.DsPartGeral.dataSet := dtmConsPart.qryRecebedorPensaoAlim;
          dtmConsPart.qryRecebedorPensaoAlim.ParamByName('IDPESSOA').AsFloat := StrToIntDef(sidpessoaconspart, -1);
          dtmConsPart.qryRecebedorPensaoAlim.Open;
          if not dtmConsPart.qrypartgeral.IsEmpty then
          begin
            frmAguarde.Next;
            frmAguarde.Repaint;
          end;
        end;
      end;

    frmAguarde.Apaga;
    // faz o cálculo da Idade da Pessoa
    DbedIdade.Text := '';
    if not dtmConsPart.DsPartGeral.dataSet.fieldByName('DATANASC').isNull then
      DbedIdade.Text := IntToStr(Trunc((date - dtmConsPart.DsPartGeral.dataSet.fieldByName('DATANASC').asDateTime)/365));

    // põe o número de elegíveis a benefício
    dbedNumElegBenef.Text := intToStr(ContaElegiveisAbeneficio);


  end; //fim primeiro if

  //tavares 22/11/2002
    //sidplanoprevconspart := dtmConsPart.qrypartgeralIDPLANOPREV.asString;
    //sseqpropostaconspart := dtmConsPart.qrypartgeralSEQPROPOSTA.asString;
    //sIDRGELEGBENEF       := dtmConsPart.qrypartgeralIDRGELEGBENEF.asString;

//Alimenta o Combo de Planos

    dbedSitPlano.Text := dtmConsPart.DsPartGeral.dataSet.fieldByName('SITPART').asString;
 //   dtmConsPart.qryInfPlano.ParamByName('IDPESSOA').asFloat := StrtoIntDef(sidpessoaconspart, -1);
 //   dtmConsPart.qryInfPlano.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
 //   dtmConsPart.qryInfPlano.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
 //   if not dtmConsPart.qryInfPlano.Active then dtmConsPart.qryInfPlano.Open;

//    dtmConsPart.qryDocPessoa.paramByName('IDPESSOA').asInteger := strToIntDef(sidpessoaconspart, -1);
//    dtmConsPart.qryDocPessoa.Open;
//    wwwEdtCPF.Text := dtmConsPart.qryDocPessoaNUMDOCUMENTO.asString;
  end
  else if NBKelegpart.ActivePage = 'PgDocumentos' then
  begin
    if not dtmConsPart.qryDocTitular.prepared then dtmConsPart.qryDocTitular.Prepare;
    dtmConsPart.qryDocTitular.ParamByName('IDPESSOA').asFloat := strToIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryDocTitular.Open;
  end

  else if NBKelegpart.ActivePage = 'PgEnderecos' then
  begin
    if dtmConsPart.qryendereco.Active Then dtmConsPart.qryendereco.Close;
    if not dtmConsPart.qryendereco.Prepared then dtmConsPart.qryendereco.Prepare;
    dtmConsPart.qryendereco.DatabaseName := sdatabasename;
    dtmConsPart.qryendereco.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryendereco.Open;
  end

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
    if not dtmConsPart.qryevent.Active Then dtmConsPart.qryevent.Open;
  end

  else if NBKelegpart.ActivePage = 'PgHistoricoFuncional' then
  begin
    if not dtmConsPart.qryhistfunc.Prepared then dtmConsPart.qryhistfunc.Prepare;
    dtmConsPart.qryhistfunc.DatabaseName := sdatabasename;
    dtmConsPart.qryhistfunc.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryhistfunc.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
    ProcessaHistContrib(qryAux, StrToIntDef(sidpessoaconspart, -1), pegaDataDoServidor);
    if not dtmConsPart.qryhistfunc.Active Then dtmConsPart.qryhistfunc.Open;

    dtmConsPart.qryHistFunc.First;
    edTempoTotal.Text    := TempoExtenso(dtmConsPart.qryHistFuncTEMPOSEMCONVERSAO.AsInteger);
    edTempoEspecial.Text := TempoExtenso(dtmConsPart.qryHistFuncTEMPOSERVCALC.AsInteger);
    while not dtmConsPart.qryHistFunc.EOF Do
    begin
      dtmConsPart.qryHistFunc.edit;
      // tavares 09/12/2002
      dtmConsPart.qryHistFunc.FieldByName('TEMPOCALC').asInteger :=
      CalcTempoContrib(nil, StrtoIntDef(sidpessoaconspart, -1),
                                    dtmConsPart.qryHistFuncSEQHISTFUNC.asInteger,
                                    dtmConsPart.qryHistFuncFLGCONTATS.asInteger, 1,
                                    dtmConsPart.qryHistFuncDATAINICIO.asString,
                                    dtmConsPart.qryHistFuncDATAFINAL.asString,
                                    pegaDataDoServidor);
      dtmConsPart.qryHistFunc.FieldByName('TEMPOPOREMPRESAEXTENSO').AsString :=
                              TempoExtenso(dtmConsPart.qryHistFunc.FieldByName('TEMPOCALC').AsInteger);
      dtmConsPart.qryHistFunc.post;
      dtmConsPart.qryHistFunc.Next;
    end;
    dtmConsPart.qryHistFunc.First;
  end

  else if NBKelegpart.ActivePage = 'PgDadosBasicos' then
  begin
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
  end

  else if NBKelegpart.ActivePage = 'PgContasBancarias' then
  begin
    if not dtmConsPart.qryContaCorrente.prepared then dtmConsPart.qryContaCorrente.Prepare;
    dtmConsPart.qryContaCorrente.ParamByName('IdPessoa').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryContaCorrente.Active then dtmConsPart.qryContaCorrente.Open;
  end

  else if NBKelegpart.ActivePage = 'PgDependentes' then
  begin
    if not dtmConsPart.qryDepenTit.Prepared then dtmConsPart.qryDepenTit.Prepare;
    dtmConsPart.qryDepenTit.ParamByName('IDTITULAR').asInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryDepenTit.Active then dtmConsPart.qryDepenTit.Open;
    if not dtmconsPart.qryDepentit.IsEmpty then
      RodaRegraElegibilidade;
  end

  else if NBKelegpart.ActivePage = 'PgEmprestimos' then
  begin
    if not dtmConsPart.qryEmprestimos.Prepared then dtmConsPart.qryEmprestimos.Prepare;
    dtmConsPart.qryEmprestimos.ParamByName('IDPESSOA').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryEmprestimos.Active then dtmConsPart.qryEmprestimos.Open;

    if not dtmConsPart.qryhstEmprestimo.Prepared then dtmConsPart.qryhstEmprestimo.Prepare;
    dtmConsPart.qryhstEmprestimo.ParamByName('IDCONTRATOEMPTMO').AsInteger :=
    dtmConsPart.qryEmprestimos.FieldByName('IDCONTRATOEMPTMO').AsInteger;
    if not dtmConsPart.qryhstEmprestimo.Active then dtmConsPart.qryhstEmprestimo.Open;
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
    lblSaldosReserva.Caption := 'Saldo: R$  ';
    dtmConsPart.qryReserva.first;
    while not dtmConsPart.qryReserva.Eof do
    begin
      TotalSaldo := TotalSaldo + dtmConsPart.qryReservaVLRATUAL.asFloat;
      dtmConsPart.qryReserva.Next;
    end;
    lblSaldosReserva.Caption := lblSaldosReserva.Caption + FormatFloat('#,##0.00', TotalSaldo);

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
    frmFrameConsultaHistorico1.ExecutaConsulta(StrtoIntDef(sIdTitular, -1));

{    if not dtmConsPart.qryVersoes.Prepared then dtmConsPart.qryVersoes.Prepare;
    dtmConsPart.qryVersoes.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryVersoes.Active then dtmConsPart.qryVersoes.Open;

    if not dtmConsPart.qryRecebedor.Prepared then dtmConsPart.qryRecebedor.Prepare;
    dtmConsPart.qryRecebedor.ParamByName('IDTITULAR').AsInteger := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryRecebedor.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;;
    if not dtmConsPart.qryRecebedor.Active then dtmConsPart.qryRecebedor.Open;
    dtmConsPart.qryRecebedor.First;
    dblkRecebedor.Text := dtmConsPart.qryRecebedorNOME.asString;

    if not dtmConsPart.qryHstVersoes.Prepared then dtmConsPart.qryHstVersoes.Prepare;
    dtmConsPart.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
    dtmConsPart.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
    if not dtmConsPart.qryHstVersoes.Active then dtmConsPart.qryHstVersoes.Open;}
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiariosPrevidenciarios' then
  begin
    if not dtmConsPart.qrypartprev.Prepared then dtmConsPart.qrypartprev.Prepare;
    dtmConsPart.qrypartprev.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qrypartprev.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qrypartprev.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qrypartprev.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qrypartprev.Active then dtmConsPart.qrypartprev.Open;
    if not dtmConsPart.QryContaCorrentepartprev.Prepared then dtmConsPart.QryContaCorrentepartprev.Prepare;
    if not dtmConsPart.QryContaCorrentepartprev.Active then dtmConsPart.QryContaCorrentepartprev.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiariosAssistenciais' then
  begin
    if not dtmConsPart.qrypart.Prepared then dtmConsPart.qrypart.Prepare;
    dtmConsPart.qrypart.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qrypart.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qrypart.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qrypart.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qrypart.Active then dtmConsPart.qrypart.Open;
  end

  else if NBKelegpart.ActivePage = 'PgContribuicoesHistoricoPrevidenciario' then
  begin
    // desabilita o controle porque a query retorna muitas linhas e assim fica mais rápido
   // porque o DBcontrol não é atualizado a cada linha retornada
    dtmConsPart.qrycontribprev.DisableControls;
    dtmConsPart.qrycontribprev.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaConspart, -1);
// pendência 8538 retirado o filtro idpessjur    
//    dtmConsPart.qrycontribprev.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qrycontribprev.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qrycontribprev.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qrycontribprev.Active then
    begin
      if (dtmConsPart.qrycontribprev.Prepared) and (not dtmConsPart.qrycontribprev.active)then
        dtmConsPart.qrycontribprev.unPrepare;
      if not dtmConsPart.qrycontribprev.active then
      begin
        dtmConsPart.qrycontribprev.Prepare;
        dtmConsPart.qrycontribprev.Open;
      end;
    end;
    dtmConsPart.qrycontribprev.EnableControls;
  end

  else if NBKelegpart.ActivePage = 'PgContribuicoesHistoricoAssistencial' then
  begin
    // desabilita o controle porque a query retorna muitas linhas e assim fica mais rápido
   // porque o DBcontrole não é atualizado a cada linha retornada
    dtmConsPart.qrycontrib.DisableControls;
    if not dtmConsPart.qrycontrib.Prepared then dtmConsPart.qrycontrib.Prepare;
    dtmConsPart.qrycontrib.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qrycontrib.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qrycontrib.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qrycontrib.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qrycontrib.Active then dtmConsPart.qrycontrib.Open;
    dtmConsPart.qrycontrib.EnableControls;
  end

  else if NBKelegpart.ActivePage = 'PgContatos' then
  begin
    if not dtmConsPart.qryContatos.Prepared then dtmConsPart.qryContatos.Prepare;
    dtmConsPart.qryContatos.ParamByName('IDPESSOA').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    if not dtmConsPart.qryContatos.Active then dtmConsPart.qryContatos.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosHistorico' then
  begin
    // desabilita o controle porque a query retorna muitas linhas e assim fica mais rápido
   // porque o DBcontrole não é atualizado a cada linha retornada
    dtmConsPart.qryBenef.DisableControls;
    if not dtmConsPart.qryBenef.Prepared then dtmConsPart.qryBenef.Prepare;
    dtmConsPart.qryBenef.ParamByName('IDTITULAR').AsFloat   := StrtoIntDef(sIdPessoaConspart, -1);
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

     //leocm - 15052002 - inicio
     if dtmConsPart.qry.fieldbyname('TITULAR').AsInteger = 1 then
     begin
        DBText6.Visible := True;
     end else begin
        DBText6.Visible := False;
     end;
     //leocm - 15052002 - fim

     if not dtmConsPart.qryDet.Prepared then dtmConsPart.qryDet.Prepare;
     dtmConsPart.qryDet.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryDet.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryDet.Active then dtmConsPart.qryDet.Open;

     if not dtmConsPart.qryFuncao.Prepared then dtmConsPart.qryFuncao.Prepare;
     dtmConsPart.qryFuncao.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryFuncao.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     dtmConsPart.qryFuncao.ParamByName('IDPLANOPREV').Value := StrToIntDef(sidplanoprevconspart, -1);
     if not dtmConsPart.qryFuncao.Active then dtmConsPart.qryFuncao.Open;

     if not dtmConsPart.qryAdicCompens.Prepared then dtmConsPart.qryAdicCompens.Prepare;
     dtmConsPart.qryAdicCompens.ParamByName('IdPessJur').Value   := StrToIntDef(sidpessjurconspart, -1);
     dtmConsPart.qryAdicCompens.ParamByName('IdPessoa').Value    := StrtoIntDef(sIdTitular, -1);
     if not dtmConsPart.qryAdicCompens.Active then dtmConsPart.qryAdicCompens.Open;

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
    if not dtmConsPart.qryProcessosBenef.Prepared then dtmConsPart.qryProcessosBenef.Prepare;
    if not dtmConsPart.qryProcessosBenef.Active then dtmConsPart.qryProcessosBenef.Open;
  end

  else if NBKelegpart.ActivePage = 'PgBeneficiosSituacaoAtual' then
  begin
    dtmConsPart.qrySituacaoAtualBenef.ParamByName('IDPESSOA').asFloat := StrToIntDef(sIdPessoaConspart, -1);
    if not dtmConsPart.qrySituacaoAtualBenef.Prepared then dtmConsPart.qrySituacaoAtualBenef.Prepare;
    if not dtmConsPart.qrySituacaoAtualBenef.Active then dtmConsPart.qrySituacaoAtualBenef.Open;
  end

  else if NBKelegpart.ActivePage = 'PgContribuicoesReservaHistoricoAlimentacao' then
  begin
    dtmConsPart.qryHistReserva.ParamByName('IDTITULAR').AsFloat   := StrToIntDef(sIdPessoaConspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryHistReserva.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if (dtmConsPart.qryHistReserva.prepared) and (not dtmConsPart.qryHistReserva.active) then dtmConsPart.qryHistReserva.unPrepare;
    if not dtmConsPart.qryHistReserva.active then
    begin
     dtmConsPart.qryHistReserva.prepare;
     dtmConsPart.qryHistReserva.Open;
    end;
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
    if not dtmConsPart.qryBeneficios.Prepared then dtmConsPart.qryBeneficios.Prepare;
    dtmConsPart.qryBeneficios.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryBeneficios.ParamByName('IDPESSJUR').AsFloat   := StrToIntDef(sidpessjurconspart, -1);
    dtmConsPart.qryBeneficios.ParamByName('IDPLANOPREV').AsFloat := StrToIntDef(sidplanoprevconspart, -1);
    dtmConsPart.qryBeneficios.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
    if not dtmConsPart.qryBeneficios.Active then dtmConsPart.qryBeneficios.Open;

    dtmConsPart.qryMovBenef.ParamByName('IDTITULAR').AsInteger      := StrtoIntDef(sidpessoaconspart, -1);
    dtmConsPart.qryMovBenef.ParamByName('NUMEROPROCESSO').AsInteger := dtmConsPart.qrybeneficios.FieldByName('NUMEROPROCESSO').AsInteger;
    if not dtmConsPart.qryMovBenef.Active then dtmConsPart.qryMovBenef.Open;
  end

  else if NBKelegpart.ActivePage = 'PgPlanos' then
  begin
    if not dtmConsPart.qryplanprev.Active then
    begin
      dtmConsPart.qryplanprev.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      if not dtmConsPart.qryplanprev.Prepared then dtmConsPart.qryplanprev.Prepare;
      dtmConsPart.qryplanprev.Open;
    end;

    if not dtmConsPart.qryplanass.Active then
    begin
      dtmConsPart.qryplanass.ParamByName('IDTITULAR').AsFloat := StrtoIntDef(sidpessoaconspart, -1);
      dtmConsPart.qryplanass.ParamByName('IDPESSJUR').AsFloat := StrToIntDef(sidpessjurconspart, -1);
      dtmConsPart.qryplanass.ParamByName('SEQPROPOSTA').AsFloat := StrToIntDef(sseqpropostaconspart, -1);
      if not dtmConsPart.qryplanass.Prepared then dtmConsPart.qryplanass.Prepare;
      dtmConsPart.qryplanass.Open;
    end;
  end

   // FDIAS - FUNCEF - 10.12.2002   - INICIO
  //
  //   Inserir as variáveis abaixo na cláusula Private
  //          private
  //          { Private declarations }
  //
  //          varFields : variant;
  //          bInsere : boolean;
  //          sStringAux : String;
  //          i : Integer;
  //
  //   Inserir a unit UObjFolha no Uses
  //   Inserir as queries/dsSource/Upd :  qryEvolFuncCargo / qryEvolFuncATS /
  //   qryEvolFuncao / qryEnqSecao2 na DCONSPART
  //
  //
  // Para testes utilizar a matrícula 0000017

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
// FDIAS - FUNCEF - 11.12.2002  resolver o problema desta cláusula   ' AND     SUBSTR(D.VALOR(+),1,3) = RTRIM(CEXT.CODIGO) '+
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
           // o método delete já chama o Post e coloca o dataset em BrowseMode
          // dtmConsPart.qryEnqSecao2.Post;
        end;
        dtmConsPart.qryEnqSecao2.Next;
      end;
   end;
   dtmConsPart.qryEnqSecao2.First;

  end;
  // FDIAS - FUNCEF - 10.12.2002   - FIM

end; //end da Procedure


procedure TFRMconspart.CloseDatasets;
var i : integer;
begin
  // Fecha todos as queries abertas
  for i := 0 to (dtmConspart.ComponentCount - 1) do
  if (dtmConspart.Components[i] is TwwQuery) and
     ((dtmConspart.Components[i] as TwwQuery).Active) then
  begin
   (dtmConspart.Components[i] as TwwQuery).Close;
  end;
end;


procedure TfrmConsPart.dblkRecebedorChange(Sender: TObject);
begin
  dtmConsPart.qryHstVersoes.Close;
  dtmConsPart.qryHstVersoes.ParamByName('IDTITULAR').AsInteger       := StrtoIntDef(sidpessoaconspart, -1);
  dtmConsPart.qryHstVersoes.ParamByName('IDHSTFOLHABENEF').AsInteger := dtmConsPart.qryVersoes.FieldByName('IDHSTFOLHABENEF').AsInteger;
  dtmConsPart.qryHstVersoes.ParamByName('IDRESPONSAVEL').AsInteger   := dtmConsPart.qryRecebedor.FieldByName('IDRESPONSAVEL').AsInteger;
  dtmConsPart.qryHstVersoes.Open;
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
  sIdTitular  := '';
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


///////////////////////////
///////  verificar se essa pessoa tem um titular
// A verificação de titularidade abaixo serve para habilitar o btão de acesso aos dados do titular
// verifica se a pessoa é Titular
   sIdTitular := '-1';
   dtmConsPart.qryClassifica.Close;
   dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDPESSOA  = '+sidpessoaconspart;
   dtmConsPart.qryClassifica.Open;
   sIdTitular := dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asString;
   if (not dtmConsPart.qryClassifica.isEmpty) then
   begin
     fTitular := (dtmConsPart.qryClassifica.fieldByName('IDPESSOA').asInteger =
                  dtmConsPart.qryClassifica.fieldByName('IDTITULAR').asInteger);

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
   sbtnTitular.Visible := not fTitular;
////////////////////////


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
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT SP.FLGINTERNO FROM PARTPREVPLAN PPP, SITPART SP '+
                                        ' WHERE PPP.IDSITPART = SP.IDSITPART(+) AND PPP.IDPESSOA = '+sidpessoaconspart;
  dtmConsPart.qryClassifica.Open;
// SITUAÇÕES DO PARETICIPANTE  - sitpart - FlgInterno
  // ativo
  if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'AT' then
  begin
    fParticipante_Ativo := true;
    SClassifica := SClassifica + 'Participante Ativo ';
    fElegivel := false;
  end
  // assistido
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'AS' then
  begin
    fParticipante_Assistido := true;
    SClassifica := SClassifica + 'Participante Assistido ';
    fElegivel := false;

    if fParticipante_Assistido then
    begin
      // verifica a informação de Tutela ou Curatela, caso o beneficiário o seja
{      dtmConsPart.qryClassifica.Close;
      dtmConsPart.qryClassifica.Sql.Text := ' SELECT DISTINCT TP.DESCRICAO FROM BFCIARIOTITPLAN BF, TIPORECEBEDOR TP '+
                                            ' WHERE BF.CODTIPORECEBEDOR = TP.CODTIPORECEBEDOR AND BF.IDPESSOA = '+ sIdPessoaConsPart;
      SClassifica := SClassifica + '- '+ dtmConsPart.qryClassifica.fieldByName('DESCRICAO').asString;
}      
      dtmConsPart.qryClassifica.Open;
    end;

  end

  // ativo em autopatrocínio total
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MA' then
  begin
    fParticipante_Assistido := true;
    SClassifica := SClassifica + 'Participante Ativo em Autopatrocício Total ';
    fElegivel := false;
  end
  // ativo em autopatrocínio parcial
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'MP' then
  begin
    fParticipante_Assistido := true;
    SClassifica := SClassifica + 'Participante Ativo em Autopatrocício Parcial ';
    fElegivel := false;
  end
  // cancelado
  else if dtmConsPart.qryClassifica.FieldByName('FLGINTERNO').asString = 'CA' then
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

  dtmConsPart.qryClassifica.Close;
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM BFCIARIOTITPLAN WHERE IDPESSOA = '+sidpessoaconspart;
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
  dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDTITULAR FROM DEPENTIT WHERE IDPESSOA = '+sidpessoaconspart;
  dtmConsPart.qryClassifica.Open;
  fDependente :=  (dtmConsPart.qryClassifica.IsEmpty = false) and
                  (dtmConsPart.qryClassifica.FieldByName('IDPESSOA').asString <> dtmConsPart.qryClassifica.FieldByName('IDTITULAR').asString);

  if fDependente then
    SClassifica := SClassifica + ' - Dependente ';

  // verificar se é recebedor de benefício
   dtmConsPart.qryClassifica.Close;
   dtmConsPart.qryClassifica.Sql.Text := ' SELECT IDPESSOA, IDRESPONSAVEL FROM BFCIARIOTITPLAN WHERE IDRESPONSAVEL = '+sidpessoaconspart;
   dtmConsPart.qryClassifica.Open;

   fRecebedor_Beneficio := not dtmConsPart.qryClassifica.IsEmpty;

   if fRecebedor_Beneficio then
     SClassifica := SClassifica + ' - Recebedor de Benefício ';

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

end;

{ habilita os itens de Menu Pertinentes 'a classificação da Pessoa }
procedure TFRMconspart.HabilitaMenuItens;
begin
  ClassificaPessoa;

//--- Agenda Pessoal

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

  Dependentes.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  //--- Vida Funcional

  DadosBasicos.Enabled    := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  EvolucaoFuncional.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  HistoricoFuncional.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido;

  RubricasSalariais.Enabled := fElegivel or fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                             fParticipante_Falecido;

  //--- Vida no Plano

  Eventos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  Protocolos.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  ProcessosRad.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  RUB.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido  or fBeneficiario;

  Contribuicoes.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido;

  Beneficios.Enabled := fParticipante_Assistido or fParticipante_Cancelado or fParticipante_Falecido or
                        fBeneficiario or fRecebedor_Beneficio;

  Processos.Enabled := fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;

  Pagamentos.Enabled := fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or
                            fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia or fAlimentado;

  Contracheque.Enabled :=  fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or
                            fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia or fAlimentado;

  RubricasIndividuais.Enabled := fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or
                            fRecebedor_Beneficio or fRecebedor_Pensao_Alimenticia or fAlimentado;

{  ProcessosJudiciais.Enabled := fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario or fRecebedor_Beneficio;
}
  Beneficiarios.Enabled := fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido;

  Enquadramento.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario;

  Emprestimo.Enabled :=  fParticipante_Ativo or fParticipante_Assistido or fParticipante_Cancelado or
                            fParticipante_Falecido or fBeneficiario;

  // Atenção!! este método tem que ser chamado aqui para que sejam habilitadas as
  //permissões pertinentes ao usuário
  Autorizacao.AutorizarForm(self, afNormal);

end;


procedure TFRMconspart.FormCreate(Sender: TObject);
var Resultado : integer;
begin
  sIdTitular := '';
{  frmConsPessoaGeral := TfrmConsPessoaGeral.Create(self);

  if not frmConsPessoaGeral.Visible then
    frmConsPessoaGeral.ShowModal;

  sidpessoaconspart    := FConsPessoaGeral.cIdpessoa;
  sidpessjurconspart   := FConsPessoaGeral.cIdPessjur;
  Resultado := frmConsPessoaGeral.ModalResult;
  frmConsPessoaGeral.Free;}
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
    closeDatasets;
    sidpessoaconspart := frmTitulares.qryTitulares.fieldByname('IDTITULAR').asString;
    fTitular := true;
    if nbkElegPart.ActivePage <> 'PgDadosPessoais' then
      NBKelegpart.ActivePage := 'PgDadosPessoais';
    NBKelegpartPageChanged(Sender);
  end;
end;

procedure TFRMconspart.DblkPlanosChange(Sender: TObject);
begin
  dbedSitPlano.Text := dtmConsPart.qryPlanosSIT.asString;
//  fecha as queries para atualizar os seus resultados com o plano selecionado
  if dtmConsPart.qrycontribprev.Active then
    dtmConsPart.qrycontribprev.Close;
  if dtmConsPart.qryBenef.Active then
    dtmConsPart.qryBenef.Close;
  if dtmConsPart.qryReserva.Active then
    dtmConsPart.qryReserva.Close;
  if dtmConsPart.qryHistReserva.Active then
    dtmConsPart.qryHistReserva.Close;
  if dtmConsPart.qryContribSitAtual.Active then
    dtmConsPart.qryContribSitAtual.Close;

  sidplanoprevconspart := dtmConsPart.qryPlanosIDPLANOPREV.asString;
  sidpessjurconspart   := dtmConsPart.qryPlanosIDPESSJUR.asString;
  sidplanoprevconspart := dtmConsPart.qryPlanosIDPLANOPREV.asString;
  sseqpropostaconspart := dtmConsPart.qryPlanosSEQPROPOSTA.asString;
  sIDRGELEGBENEF       := dtmConsPart.qryPlanosIDRGELEGBENEF.asString;
  NBKelegpartPageChanged(self);
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
            '''' +DateToStr(date)+ ''' AS DATAREF '+
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
  sidpessoaconspart := dtmConspart.qrypartprev.fieldByname('IDPESSOA').asString;
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


end.
