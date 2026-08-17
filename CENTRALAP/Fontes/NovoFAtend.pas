 (*******************************************************************************
 Analista Responsável: Gustavo Viegas
 - Atualizado em 15/10/2000
 - Atualizado em SET/2001 - Flavio Dias (FDIAS) (FCRT)

 - Atualizado em 10/01/2002 - André Tavares
   atualizado o método CmeCadastroFind
   inclui cidade, idtipoAtend no montaselect e alimenta os campos
   Tipo de atendimento CIDADE e UF na consulta de atendimento.
*******************************************************************************)

unit FAtend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmseldlg, wwidlg, Db, Wwdatsrc, DBCtrls, MAHlpBtn,
  StdCtrls, Buttons,  ComCtrls, ToolWin, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, wwdblook, Mask, MskEdDlg, DBTables,
  wwdbedit, wwriched,  TB97, TB97Ctls, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Menus, CMDBLookupCombo, FCadastroGrid, MontaSelect, Wwdotdot,
  Wwdbcomb, FCadastroCS, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn,
  fcClearPanel, fcButtonGroup, fcOutlookBar, CMProcura, uComum, Wwtable,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList, Wwquery,
  TREdit,Ufiario,UBIBLIOTECA, UConsPart, CheckLst, TEdNum;

type
  TRegAtendimento = Record
     IDATEND            : Real;
     IDTIPOATEND        : Real;
     CODATEND           : Real;
     DATA               : TDateTime;
     NOMESOLICITANTE    : String;
     TELSOLICITANTE     : String;
     CODATENDENTE       : String;
     RESPOSTA           : String;
     STATUS             : String;
     OBSERVACAO         : String;
     IDTITULAR          : Real;
     IDPESSJUR          : Real;
     DATAINICIO         : TDateTime;
     LOGRADOURO         : String;
     NUMEROSOLIC        : String;
     COMPLEMSOLIC       : String;
     BAIRROSOLIC        : String;
     CEPSOLIC           : String;
     CIDADESOLIC        : String;
     IDESTADO           : Integer;
     PERGUNTA           : String;
     COMPLCODATEND      : Real;
     IDLOCALATENDXCPU   : Real;
     DDISOLIC           : String;
     DDDSOLIC           : String;
     TIPOSOLIC          : String;
     NUMEROTELSOLIC     : String;
     IDTELEFONE         : Real;
     CODESTADOSOLIC     : String;
     IDBENEFICIARIO     : Real;
     IDPLANOPREV        : Integer;
     sequencia          : Integer;
   End;

  TfrmAtend = class(TfrmCadastroCS)
    PgAtend             : TPageControl;
    TbShtAtend          : TTabSheet;
    Timer1              : TTimer;
    dspartprev          : TwwDataSource;
    dsreserva           : TwwDataSource;
    MSParticipante      : TMontaSelect;
    Panel1              : TPanel;
    Label11             : TLabel;
    Label12             : TLabel;
    Label7              : TLabel;
    Label8              : TLabel;
    Label39             : TLabel;
    edmat               : TEdit;
    edcpf               : TEdit;
    edinsc              : TEdit;
    edPlano             : TEdit;
    ednome              : TEdit;
    edPatro                : TEdit;
    BtnConsultaAtendimento : TBitBtn;
    bb_procparticipante : TBitBtn;
    PageDadosAssunto    : TPageControl;
    TbDadosAtend        : TTabSheet;
    Label2              : TLabel;
    Label20             : TLabel;
    Label21             : TLabel;
    Label22             : TLabel;
    Label23             : TLabel;
    Label24             : TLabel;
    Label26             : TLabel;
    edtLogradouro       : TwwDBEdit;
    edtNumero           : TwwDBEdit;
    edtComplem          : TwwDBEdit;
    edtbairro           : TwwDBEdit;
    edtcep              : TwwDBEdit;
    dbednomesol         : TwwDBEdit;
    TbsAssuntos         : TTabSheet;
    MsResposta          : TMontaSelect;
    GpAnteiror          : TGroupBox;
    edcod               : TEdit;
    edseque             : TEdit;
    TbsGeral            : TTabSheet;
    Observacao          : TLabel;
    Label25             : TLabel;
    MemResposta         : TwwDBRichEdit;
    MenPergunta         : TwwDBRichEdit;
    Label29             : TLabel;
    MemObs              : TwwDBRichEdit;
    Dock973             : TDock97;
    tb97BotoesDetalhe   : TToolbar97;
    sbtnInsDet          : TSpeedButton;
    sbtnExcluiDet       : TSpeedButton;
    PnlAssunto          : TPanel;
    assunto             : TLabel;
    Label27             : TLabel;
    BtnGetResposta      : TBitBtn;
    DBCheckBox1         : TDBCheckBox;
    DBCheckBox2         : TDBCheckBox;
    Dock974             : TDock97;
    tb97Detalhe         : TToolbar97;
    bbtnOkDet           : TBitBtn;
    bbtnCancelarDet     : TBitBtn;
    bbtnVoltarDet       : TBitBtn;
    QryAssuntoxAtend    : TwwQuery;
    QryAssuntoxAtendIDASSUNTOXATEND: TFloatField;
    QryAssuntoxAtendIDASSUNTO: TFloatField;
    QryAssuntoxAtendIDATEND: TFloatField;
    QryAssuntoxAtendIDASSUNTOXRESP: TFloatField;
    QryAssuntoxAtendIDPROCESSO: TFloatField;
    DsAssuntoxAtend     : TwwDataSource;
    UpdAssuntoxAtend    : TUpdateSQL;
    QryAssuntoxAtendEXISTERAD: TFloatField;
    QryAssuntoxAtendEXISTERUB: TFloatField;
    QryAssuntoxAtendNOME: TStringField;
    qryIDATEND          : TFloatField;
    qryIDTIPOATEND      : TFloatField;
    qryDATA             : TDateTimeField;
    qryNOMESOLICITANTE  : TStringField;
    qryTELSOLICITANTE   : TStringField;
    qryCODATENDENTE     : TStringField;
    qryRESPOSTA         : TStringField;
    qrySTATUS           : TStringField;
    qryOBSERVACAO       : TStringField;
    qryIDTITULAR        : TFloatField;
    qryIDPESSJUR        : TFloatField;
    qryDATAINICIO       : TDateTimeField;
    qryLOGRADOURO       : TStringField;
    qryNUMEROSOLIC      : TStringField;
    qryCOMPLEMSOLIC     : TStringField;
    qryBAIRROSOLIC      : TStringField;
    qryCEPSOLIC         : TStringField;
    qryCIDADESOLIC      : TStringField;
    qryCOMPLCODATEND    : TFloatField;
    qryPERGUNTA         : TStringField;
    QryAssuntoxAtendIDTIPOPROCESSO: TFloatField;
    EdtSitCad           : TEdit;
    QryAssuntoxAtendIDMODELORUB: TFloatField;
    QryAssuntoxAtendAnt : TwwQuery;
    DsAssuntoxAtendAnt  : TwwDataSource;
    QryAssuntoxAtendAntIDASSUNTOXATEND: TFloatField;
    QryAssuntoxAtendAntIDASSUNTO: TFloatField;
    QryAssuntoxAtendAntIDATEND: TFloatField;
    QryAssuntoxAtendAntIDASSUNTOXRESP: TFloatField;
    QryAssuntoxAtendAntIDPROCESSO: TFloatField;
    QryAssuntoxAtendAntEXISTERAD: TFloatField;
    QryAssuntoxAtendAntEXISTERUB: TFloatField;
    QryAssuntoxAtendAntNOME: TStringField;
    QryAssuntoxAtendAntIDTIPOPROCESSO: TFloatField;
    QryAssuntoxAtendAntIDMODELORUB: TFloatField;
    BtnAtendAnt         : TBitBtn;
    LblAssunto          : TLabel;
    MsBeneficiario      : TMontaSelect;
    QryAssuntoxAtendAntDESCRESPATEN: TMemoField;
    DBEdit1             : TDBEdit;
    ReResposta          : TwwDBRichEdit;
    MsFormaAtend        : TMontaSelect;
    MsAssunto           : TMontaSelect;
    PnlAssuntoAtend     : TPanel;
    GrdAssunto          : TwwDBGrid;
    Splitter5           : TSplitter;
    ReRespostaAux       : TwwDBRichEdit;
    QryBuscaResposta    : TwwQuery;
    QryBuscaRespostaDESCRESPATEN: TMemoField;
    QryAssuntoxAtendDESCRESPATEN: TMemoField;
    ProcuraAssunto      : TCMProcura;
    PpmRubsPendentes    : TPopupMenu;
    PpmCancela          : TMenuItem;
    PpmGera2via         : TMenuItem;
    PpmEmite2Via        : TMenuItem;
    PpmEmite            : TMenuItem;
    CkbFiltraPlano      : TCheckBox;
    Bevel1              : TBevel;
    Bevel2              : TBevel;
    Bevel3              : TBevel;
    Label4              : TLabel;
    QryEstado           : TwwQuery;
    QryEstadoCODESTADO  : TStringField;
    qryIDESTADO         : TFloatField;
    tbsDadosParticip    : TTabSheet;
    qryDDISOLIC         : TStringField;
    qryDDDSOLIC         : TStringField;
    qryTIPOSOLIC        : TStringField;
    qryNUMEROTELSOLIC   : TStringField;
    qryIDTELEFONE       : TFloatField;
    qryCODESTADOSOLIC   : TStringField;
    qryIDBENEFICIARIO   : TFloatField;
    QryEstadoIDESTADO   : TFloatField;
    QryAssuntoxAtendAntIDRUB: TFloatField;
    QryAssuntoxAtendIDRUB: TFloatField;
    qryultrub           : TwwQuery;
    qryultrubULTRUB     : TFloatField;
    QRYALTRUBS          : TwwQuery;
    qryultrubFLGSTATUS  : TStringField;
    tbShtSimulaBenef    : TTabSheet;
    dbDataDib           : TCMDateTimePicker;
    dbdatademissao      : TCMDateTimePicker;
    dbdatarequerimento  : TCMDateTimePicker;
    dbDataEvento        : TCMDateTimePicker;
    Label49             : TLabel;
    Label50             : TLabel;
    Label51             : TLabel;
    Label52             : TLabel;
    Label53             : TLabel;
    Label54             : TLabel;
    Label55             : TLabel;
    bbnumerobeneficiario: TMaskEdit;
    qryTipoAtend        : TwwQuery;
    dsTipoAtend         : TwwDataSource;
    qryCidades          : TwwQuery;
    dblkCidade          : TwwDBLookupCombo;
    qryUF               : TwwQuery;
    dblkEstado          : TwwDBLookupCombo;
    tbbConsultaParticip : TToolbarButton97;
    ConsPart1           : TConsPart;
    Label38             : TLabel;
    edtDDI              : TwwDBEdit;
    edtDDD              : TwwDBEdit;
    Label41             : TLabel;
    edtNumeroTelefone   : TwwDBEdit;
    Label31             : TLabel;
    pnlDadosAtendimento : TPanel;
    Label3              : TLabel;
    dblkTipoAtendimento : TwwDBLookupCombo;
    Label28             : TLabel;
    dbdateInicio        : TCMDateTimePicker;
    dbdateFim           : TCMDateTimePicker;
    Label1              : TLabel;
    Label40             : TLabel;
    eddlghorainicio     : TcmMaskEditDlg;
    Label6              : TLabel;
    eddlghora           : TcmMaskEditDlg;
    Label9              : TLabel;
    ednum               : TwwDBEdit;
    Label17             : TLabel;
    edseq               : TwwDBEdit;
    dbedatend           : TEdit;
    Label5              : TLabel;
    Label30             : TLabel;
    wwDBEdit3           : TwwDBEdit;
    GroupBox4           : TGroupBox;
    chkTipoTelefone     : TCheckListBox;
    pgCtrlDadosParticip : TPageControl;
    tbsEnderecos        : TTabSheet;
    tbsTelefones        : TTabSheet;
    Dock975             : TDock97;
    Toolbar972          : TToolbar97;
    tbbInsEndereco      : TToolbarButton97;
    tbbAltEndereco      : TToolbarButton97;
    tbbExcEndereco      : TToolbarButton97;
    dbEnderecos         : TwwDBGrid;
    dsEnderecos         : TwwDataSource;
    qryEnderecos        : TwwQuery;
    Dock976             : TDock97;
    Toolbar973          : TToolbar97;
    tbbInsTelefone: TToolbarButton97;
    tbbAltTelefone      : TToolbarButton97;
    tbbExcTelefone      : TToolbarButton97;
    qryTelefones        : TwwQuery;
    dsTelefone          : TwwDataSource;
    updTelefones        : TUpdateSQL;
    updEnderecos        : TUpdateSQL;
    tbsContaCorrente    : TTabSheet;
    qryParam            : TwwQuery;
    Dock977             : TDock97;
    Toolbar974          : TToolbar97;
    tbbInsContaCorrente: TToolbarButton97;
    tbbAltContaCorrente : TToolbarButton97;
    tbbExcContaCorrente : TToolbarButton97;
    pnlContasCorrentes  : TPanel;
    DBGCONTASCORRENTE: TwwDBGrid;
    updContaCorrente    : TUpdateSQL;
    dsContaCorrente     : TwwDataSource;
    qryContaCorrente    : TwwQuery;
    EDIDPLANOPREV: TEdit;
    qryPessoa: TwwQuery;
    wwQuery1: TwwQuery;
    qryPessoaIDENDCORRESP: TFloatField;
    qryPessoaIDENDCOMERCIAL: TFloatField;
    qryPessoaIDENDENTREGA: TFloatField;
    qryPessoaIDENDRESIDENCIAL: TFloatField;
    qryPessoaIDENDCOBRANCA: TFloatField;
    qryCidadesIDCIDADES: TFloatField;
    qryCidadesCODESTADO: TStringField;
    qryCidadesNOME: TStringField;
    qryCidadesIDESTADO: TFloatField;
    qryCidadesIDPAIS: TFloatField;
    QRYINSENDERECO: TwwQuery;
    qryEnderecosIDPESSOA: TFloatField;
    qryEnderecosIDENDERECO: TFloatField;
    qryEnderecosIDCIDADES: TFloatField;
    qryEnderecosLOGRADOURO: TStringField;
    qryEnderecosIDPAIS: TFloatField;
    qryEnderecosCODESTADO: TStringField;
    qryEnderecosNUMERO: TStringField;
    qryEnderecosCOMPLEMENTO: TStringField;
    qryEnderecosBAIRRO: TStringField;
    qryEnderecosCIDADE: TStringField;
    qryEnderecosCEP: TStringField;
    qryaltendereco: TwwQuery;
    QryEstadoIDPAIS: TFloatField;
    QRYESTADO1: TwwQuery;
    PopupMenu1: TPopupMenu;
    qrycomercial: TwwQuery;
    qryresidencial: TwwQuery;
    qryentrega: TwwQuery;
    qrycobranca: TwwQuery;
    qrycorresp: TwwQuery;
    pnlEnderecos: TPanel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel2: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    wwDBEdit5: TwwDBEdit;
    edcep1: TwwDBEdit;
    dblkestado1: TwwDBLookupCombo;
    dblkcidade1: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    chkbxComercial: TCheckBox;
    chkbxEntrega: TCheckBox;
    chkbxCobranca: TCheckBox;
    chkbxCorrespondencia: TCheckBox;
    chkbxResidencial: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    EDLOGRADORO1: TwwDBEdit;
    ednumero1: TwwDBEdit;
    edbairro1: TwwDBEdit;
    edcomplemento1: TwwDBEdit;
    pnlTelefones: TPanel;
    dbgTelefones: TwwDBGrid;
    pnlCadTelefones: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    GroupBox2: TGroupBox;
    chkTelComercial: TCheckBox;
    chkTelFax: TCheckBox;
    chkTelCelular: TCheckBox;
    chkTelRecado: TCheckBox;
    chkTelParticular: TCheckBox;
    dblkLogradouro: TwwDBLookupCombo;
    edtTelDDI: TwwDBEdit;
    edtTelDDD: TwwDBEdit;
    edtTelNumeroTelefone: TwwDBEdit;
    btnTelOk: TBitBtn;
    btnTelCancelar: TBitBtn;
    btnTelVoltar: TBitBtn;
    qryTelefonesLOGRADOURO: TStringField;
    qryTelefonesDDI: TStringField;
    qryTelefonesDDD: TStringField;
    qryTelefonesNUMERO: TStringField;
    qryTelefonesTIPO: TStringField;
    qryInsereTelefone: TQuery;
    qryAlteraTelefone: TQuery;
    qryTelefonesIDTELEFONE: TFloatField;
    qryTelefonesIDENDERECO: TFloatField;
    dblkpcmbBanco: TwwDBLookupCombo;
    dblkpcmbAgencia: TwwDBLookupCombo;
    Panel3: TPanel;
    Label45: TLabel;
    Label47: TLabel;
    dbedContaBancaria: TDBEdit;
    Label48: TLabel;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    dbgrpContaConj: TDBRadioGroup;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    qryinscontacorrente: TwwQuery;
    QRYALTCONTACORRENTE: TwwQuery;
    qryBancoIDPESSOA: TFloatField;
    qryBancoBANCO: TStringField;
    qryBancoNUMBANCO: TStringField;
    qryAgenciaIDPESSOA: TFloatField;
    qryAgenciaAGENCIA: TStringField;
    qryAgenciaNUMAGENCIA: TStringField;
    qryAgenciaIDBANCO: TFloatField;
    Label44: TLabel;
    qrycontapreferencial: TwwQuery;
    qrycontapreferencialIDCBANCARIA: TFloatField;
    qrycontapreferencialCONTACORRENTE: TStringField;
    qrycontapreferencialIDAGENCIA: TFloatField;
    qrycontapreferencialFLGCONTAPREF: TFloatField;
    qrycontapreferencialIDPESSOA: TFloatField;
    qrycontapreferencialTIPOCONTA: TStringField;
    qrycontapreferencialFLGCONTACONJUNTA: TStringField;
    qrycontapreferencialIDBANCO: TFloatField;
    qrycontapreferencialNOMEAGENCIA: TStringField;
    qrycontapreferencialNOMEBANCO: TStringField;
    qrycontapreferencialDESCTIPO: TStringField;
    qryContaCorrenteCONTACORRENTE: TStringField;
    qryContaCorrenteIDAGENCIA: TFloatField;
    qryContaCorrenteFLGCONTAPREF: TFloatField;
    qryContaCorrenteTIPOCONTA: TStringField;
    qryContaCorrenteFLGCONTACONJUNTA: TStringField;
    qryContaCorrenteNOMEAGENCIA: TStringField;
    qryContaCorrenteNOMEBANCO: TStringField;
    qryContaCorrenteNUMAGENCIA: TStringField;
    qryContaCorrenteIDBANCO: TFloatField;
    qryContaCorrenteNUMBANCO: TStringField;
    qryContaCorrenteCONTAPREF: TStringField;
    qryContaCorrenteTPCONTA: TStringField;
    qryContaCorrenteIDCBANCARIA: TFloatField;
    QRYAGENCIA1: TwwQuery;
    QRYAGENCIA1IDPESSOA: TFloatField;
    QRYAGENCIA1NUMAGENCIA: TStringField;
    QRYAGENCIA1NOME: TStringField;
    qryparamgrupo: TwwQuery;
    qryparamgrupoNOME: TStringField;
    qrygrupo: TwwQuery;
    qrygrupoIDFIARASS: TFloatField;
    qryexcendereco: TwwQuery;
    qryexctelefone: TwwQuery;
    qryexccontacorrente: TwwQuery;
    qryparamgrupoIDTIPOATEND: TFloatField;
    QRYPENDECIA: TwwQuery;
    qryCODATEND: TFloatField;
    qryIDLOCALATENDXCPU: TFloatField;
    TbShtDocsXBenef: TTabSheet;
    DBGriddocsXbenef: TwwDBGrid;
    DSdocsXbenef: TwwDataSource;
    QrydocsXbenef: TwwQuery;
    Label46: TLabel;
    Label56: TLabel;
    EdtRG: TwwDBEdit;
    EdtCPF: TwwDBEdit;
    qryGrupoAssunto: TwwQuery;
    DBLkGrupoAssunto: TwwDBLookupCombo;
    Bevel4: TBevel;
    Label57: TLabel;
    DBLKAssunto: TwwDBLookupCombo;
    qryAssunto: TwwQuery;
    procedure Timer1Timer(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmbfilialEnter(Sender: TObject);
    procedure dbgridempDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bb_procparticipanteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure BtnConsultaAtendimentoClick(Sender: TObject);
    procedure BtnGetRespostaClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure tbbAltEnderecoClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure dbgridprocDblClick(Sender: TObject);
    procedure BtnAtendAntClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure ProcuraAssuntoValidaDados(Sender: TObject);
    procedure ProcuraAssuntoApertouBotao(Sender: TObject);
    procedure PgAtendChange(Sender: TObject);
    procedure GrdDocRecebidosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure CkbFiltraPlanoClick(Sender: TObject);
    procedure edtufExit(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure tbshtConsPartEnter(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbbConsultaParticipClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure tbbInsEnderecoClick(Sender: TObject);
    procedure tbbExcEnderecoClick(Sender: TObject);
    procedure tbbInsTelefoneClick(Sender: TObject);
    procedure tbbAltTelefoneClick(Sender: TObject);
    procedure tbbExcTelefoneClick(Sender: TObject);
    procedure tbbInsContaCorrenteClick(Sender: TObject);
    procedure tbbAltContaCorrenteClick(Sender: TObject);
    procedure tbbExcContaCorrenteClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure tbsEnderecosShow(Sender: TObject);
    procedure btnTelOkClick(Sender: TObject);
    procedure btnTelCancelarClick(Sender: TObject);
    procedure btnTelVoltarClick(Sender: TObject);
    procedure tbsTelefonesShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure tbsContaCorrenteShow(Sender: TObject);
    procedure dblkpcmbBancoExit(Sender: TObject);
    procedure TbShtDocsXBenefShow(Sender: TObject);
    procedure PageDadosAssuntoEnter(Sender: TObject);
    procedure DBLkGrupoAssuntoChange(Sender: TObject);
    procedure DBLKAssuntoChange(Sender: TObject);
  private
    idtitular,idpessjur,idtelefone, IDPESSOA, idbeneficiario, IDPLANOPREV, sequencia: string;
    bNovoAtendimento :Boolean;
    iLinhaFiltro,flgexcluir :Integer;
    procedure Selecionar(const IdAtend: LongInt);
    procedure Selecionarfilhas;
    procedure PegaParticipante(Var MsPegaParticipante:TMontaSelect);
    Procedure AtualizaDadosRub;
    procedure AtualizaDetalhe(bAtualiza: Boolean);
    procedure AbreQryAssuntoxAtend;
    procedure BuscaAtendPend(IdTitular :LongInt);
    Function JaExistePreferencial: boolean;

  public

  end;

var
  frmAtend: TfrmAtend;

implementation

uses  UDataBase, UGeral,  UAutorizacao, UMensErro, FTelaAut, FConsHistRecEmp,
      USistema, dAtend, dRelCentralAP, Fconsatend, umoduloCap, uRad,
      uFuncaoGeral, uRubs, FAcompProc, dBasedados, uAtendimento,UCalcDV;

{$R *.DFM}


procedure TFrmAtend.CmeCadastroInsert(Sender: TObject);
Var
   RegAtendimento :TRegAtendimento;
begin
   CmeCadastro.RepetirInsert   := false;
   PgAtend.Enabled             := true;
   PgAtend.ActivePage          := TbShtAtend;
   PageDadosAssunto.ActivePage := TbDadosAtend;
   TbDadosAtend.Enabled        := True;
   BtnAtendAnt.Tag             := 0;
   sbtnInsDet.Visible          := True;
   sbtnExcluiDet.Visible       := True;
   BtnGetResposta.Visible      := True;
   tb97BotoesDetalhe.Visible   := True;
   GrdAssunto.DataSource       := DsAssuntoxAtend;
   LblAssunto.Caption          := 'Assuntos Do Atendimento Corrente';
   LblAssunto.Left             := 112;
   If Qry.IsEmpty Or (Application.MessageBox('Deseja Continuar o atendimento ?','Atendimento',Mb_YesNo + Mb_IConQuestion) = Id_No) Then
   Begin
     //Novo Atendimento
     bNovoAtendimento := True;
     If QryAssuntoxAtendAnt.Active Then QryAssuntoxAtendAnt.Close;

     inherited;
     bb_procparticipante.Enabled := True;
     GpAnteiror.Visible          := False;

     if MSParticipante.Executar = MrOk then
     begin
        tag := 0;
        PegaParticipante(MSParticipante);
        qrycodatendente.AsFloat     := Sistema.IdUsuario;
        qryIdPessjur.AsFloat        := StrToFloat(idpessjur);
        qryIdTitular.AsFloat        := StrToFloat(idTitular);
        qryCODATEND.AsFloat         := qryIDATEND.AsFloat;
        qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
        qryCOMPLCODATEND.AsFloat    := 0;
        If ModuloCap.IdTipoAtend <> 0 Then
           qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;

        AbreQryAssuntoxAtend;

        BuscaAtendPend(StrToInt(idTitular));
     end
     Else
     Begin
        if MsBeneficiario.Executar = MrOk then
        Begin
            tag := 1;
            PegaParticipante(MsBeneficiario);
            qrycodatendente.AsFloat     := Sistema.IdUsuario;
            qryIdPessjur.AsFloat        := StrToFloat(idpessjur);
            qryIdTitular.AsFloat        := StrToFloat(idTitular);
            qryIdBeneficiario.AsFloat   := StrToFloat(idBeneficiario);
            qryCODATEND.AsFloat         := qryIDATEND.AsFloat;
            qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
            qryCOMPLCODATEND.AsFloat    := 0;
            If ModuloCap.IdTipoAtend <> 0 Then
               qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;

            AbreQryAssuntoxAtend;
            BuscaAtendPend(StrToInt(idTitular));
        End
        Else
          bbtnCancelar.Click;
          exit;
     End;

     edcod.Text                  := '';
     edseque.Text                := '';
     qry.FieldByName('DATAINICIO').AsDateTime := date;
     qry.FieldByName('DATA').AsDateTime       := date;
     eddlghorainicio.text        := timetostr(time);
     eddlghora.text              := timetostr(time);
     qrycodatendente.AsFloat     := Sistema.IdUsuario;
   End
   Else
   Begin
     // Continua atendimento Pendente
     bb_procparticipante.Enabled := False;
     GpAnteiror.Visible          := True;
     bNovoAtendimento            := False;
     qry.First; // FDIAS - FCRT - 25.09.2001
     With RegAtendimento Do
     Begin
       IDATEND          := qryIDATEND.AsFloat;
       IDTIPOATEND      := qryIDTIPOATEND.AsFloat;
       CODATEND         := qryCODATEND.AsFloat;
       DATA             := qryDATA.AsDateTime;
       NOMESOLICITANTE  := qryNOMESOLICITANTE.AsString;
       TELSOLICITANTE   := qryTELSOLICITANTE.AsString;
       CODATENDENTE     := qryCODATENDENTE.AsString;
       RESPOSTA         := qryRESPOSTA.AsString;
       STATUS           := qrySTATUS.AsString;
       OBSERVACAO       := qryOBSERVACAO.AsString;
       IDTITULAR        := qryIDTITULAR.AsFloat;
       IDPESSJUR        := qryIDPESSJUR.AsFloat;
       DATAINICIO       := qryDATAINICIO.AsDateTime;
       LOGRADOURO       := qryLOGRADOURO.AsString;
       NUMEROSOLIC      := qryNUMEROSOLIC.AsString;
       COMPLEMSOLIC     := qryCOMPLEMSOLIC.AsString;
       BAIRROSOLIC      := qryBAIRROSOLIC.AsString;
       CEPSOLIC         := qryCEPSOLIC.AsString;
       CIDADESOLIC      := qryCIDADESOLIC.AsString;
       IDESTADO         := qryIDESTADO.AsInteger;
       PERGUNTA         := qryPERGUNTA.AsString;
       COMPLCODATEND    := qryCOMPLCODATEND.AsFloat;
       IDLOCALATENDXCPU := qryIDLOCALATENDXCPU.AsFloat;
       DDISOLIC         := qryDDISOLIC.AsString;
       DDDSOLIC         := qryDDDSOLIC.AsString;
       TIPOSOLIC        := qryTIPOSOLIC.AsString;
       NUMEROTELSOLIC   := qryNUMEROTELSOLIC.AsString;
       IDTelefone       := qryIDTelefone.AsFloat;
       CODESTADOSOLIC   := qryCODESTADOSOLIC.AsString;
       IDbeneficiario   := qryIDbeneficiario.AsFloat;
     End;
     Qry.Cancel;
     Qry.Edit;

     qrySTATUS.AsString := 'Concluído';
     Qry.Post;

     With QryAssuntoxAtendAnt Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('IDATEND').AsFloat := qryIDATEND.AsFloat;
       Open;
     End;
     Qry.Append;

     CmeCadastro.Operacao := OpInserir;
     CmeCadastro.AtualizaBotoes(self);

     With RegAtendimento Do
     Begin
       qryIDATEND.AsFloat               := 0;
       qryCODATEND.AsFloat              := CODATEND;
       qryDATA.AsDateTime               := Date;
       qryNOMESOLICITANTE.AsString      := NOMESOLICITANTE;
       qryTELSOLICITANTE.AsString       := TELSOLICITANTE;
       qryCODATENDENTE.AsString         := CODATENDENTE;
       qryRESPOSTA.AsString             := RESPOSTA;
       qrySTATUS.AsString               := STATUS;
       qryOBSERVACAO.AsString           := OBSERVACAO;
       qryIDTITULAR.AsFloat             := IDTITULAR;
       qryIDPESSJUR.AsFloat             := IDPESSJUR;
       qryDATAINICIO.AsDateTime         := Date;
       qryLOGRADOURO.AsString           := LOGRADOURO;
       qryNUMEROSOLIC.AsString          := NUMEROSOLIC;
       qryCOMPLEMSOLIC.AsString         := COMPLEMSOLIC;
       qryBAIRROSOLIC.AsString          := BAIRROSOLIC;
       qryCEPSOLIC.AsString             := CEPSOLIC;
       qryCIDADESOLIC.AsString          := CIDADESOLIC;
       qryDDISOLIC.AsString             := DDISOLIC;
       qryDDDSOLIC.AsString             := DDDSOLIC;
       qryTIPOSOLIC.AsString            := TIPOSOLIC;
       qryNUMEROTELSOLIC.AsString       := NUMEROTELSOLIC ;
       qryIDTelefone.AsFloat            := IDTELEFONE;
       qrycodestadosolic.AsString       := CODESTADOSOLIC;
       qryIDbeneficiario.AsFloat        := idbeneficiario;
       qryPERGUNTA.AsString             := PERGUNTA;
       qryCOMPLCODATEND.AsFloat         := COMPLCODATEND;
       If IDESTADO <> 0 Then
          qryIDESTADO.AsInteger := IDESTADO
       Else
          qryIDESTADO.Clear;

       If ModuloCap.IdTipoAtend <> 0 Then
          qryIDTIPOATEND.AsFloat := ModuloCap.IdTipoAtend;

     End;

     Selecionarfilhas;
 
     With dtmAtend.QryCountAtend Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByname('CODATEND').Asfloat := RegAtendimento.CodAtend;
       Open;

       qryCOMPLCODATEND.AsFloat := FieldByName('NUMATEND').AsFloat;

       edcod.Text                  := FloattoStr(qryCODATEND.AsFloat);
       edseque.Text                := FloatToStr(FieldByName('NUMATEND').AsFloat - 1);

       Close;

     End;

     AbreQryAssuntoxAtend;
     BuscaAtendPend(StrToInt(idTitular));
   End;
   qryIDLOCALATENDXCPU.AsFloat := ModuloCap.IdLocaAtendxCpu;
   BtnAtendAnt.Visible := Not bNovoAtendimento;
end;

procedure TFrmAtend.PegaParticipante(Var MsPegaParticipante:TMontaSelect);
var
   iLoopTel : Integer;
begin
  // Carrega campos da tela
  ednome.Text    := MsPegaParticipante.ValoresChave[0];
  edcpf.Text     := MsPegaParticipante.ValoresChave[1];
  edmat.Text     := MsPegaParticipante.ValoresChave[2];
  edinsc.Text    := MsPegaParticipante.ValoresChave[3];
  edPlano.Text   := MsPegaParticipante.ValoresChave[4];
  edPatro.Text   := MsPegaParticipante.ValoresChave[5];
  idPessjur      := MsPegaParticipante.ValoresChave[6];
  idTitular      := MsPegaParticipante.ValoresChave[7];
  EdtSitCad.Text := MsPegaParticipante.ValoresChave[8];
  idbeneficiario := MsPegaParticipante.ValoresChave[9];
  IDPLANOPREV    := MsPegaParticipante.ValoresChave[10];
  EDIDPLANOPREV.TEXT :=  MsPegaParticipante.ValoresChave[10];
  sequencia      := MsPegaParticipante.ValoresChave[11];
  dbedatend.text := Sistema.NomeUsuario;

     With QryEnderecos Do
     Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('idpessoa').Asfloat := STRTOFLOAT(idbeneficiario);
       Open;
     End;
  PgAtend.activepage      := TbShtAtend;
  eddlghorainicio.text    := timetostr(time);
  eddlghorainicio.Enabled :=false;
  timer1.enabled          := true;

  If dbednomesol.CanFocus Then dbednomesol.SetFocus;

  // insere um atendimento
  If (CmeCadastro.Operacao = OpInserir) Then
  Begin
    If dtmAtend.QryDadosParticip.Active Then dtmAtend.QryDadosParticip.Close;
    If Not dtmAtend.QryDadosParticip.Prepared Then dtmAtend.QryDadosParticip.Prepare;
    dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := StrToFloat(MsPegaParticipante.ValoresChave[MsPegaParticipante.Tag]);
    dtmAtend.QryDadosParticip.Open;

    qryNOMESOLICITANTE.AsString  := dtmAtend.QryDadosParticipNOME.AsString;
    qryTELSOLICITANTE.AsString   := dtmAtend.QryDadosParticipNUMTEL.AsString;
    qryLOGRADOURO.AsString       := dtmAtend.QryDadosParticipLOGRADOURO.AsString;
    qryNUMEROSOLIC.AsString      := dtmAtend.QryDadosParticipNUMERO.AsString;
    qryCOMPLEMSOLIC.AsString     := dtmAtend.QryDadosParticipCOMPLEMENTO.AsString;
    qryBAIRROSOLIC.AsString      := dtmAtend.QryDadosParticipBAIRRO.AsString;
    qryCEPSOLIC.AsString         := dtmAtend.QryDadosParticipCEP.AsString;
    qryCIDADESOLIC.AsString      := dtmAtend.QryDadosParticipCIDADE.AsString;
    qryDDISOLIC.AsString         := dtmAtend.QryDadosParticipDDI.AsString;
    qryDDDSOLIC.AsString         := dtmAtend.QryDadosParticipDDD.AsString;
    qryTIPOSOLIC.AsString        := dtmAtend.QryDadosParticipTIPO.AsString;
    qryNUMEROTELSOLIC.AsString   := dtmAtend.QryDadosParticipNUMTEL.AsString;
    qrycodestadoSOLIC.AsString   := dtmAtend.QryDadosParticipcodestado.AsString;

    If dtmAtend.QryDadosParticipIDESTADO.IsNull Then
       qryIDESTADO.Clear
    Else
       qryIDESTADO.AsInteger        := dtmAtend.QryDadosParticipIDESTADO.AsInteger;

    qryIdPessjur.AsFloat        := StrToFloat(idpessjur);
    qryIdTitular.AsFloat        := StrToFloat(idTitular);
    qryIdbeneficiario.AsFloat   := StrToFloat(idbeneficiario);
     If dtmAtend.QryDadosParticipIDtelefone.IsNull Then
       qryidTelefone.Clear
    Else
       qryidTelefone.AsFloat        := dtmAtend.QryDadosParticipIDTelefone.AsInteger;

    Selecionarfilhas;
    qryEnderecos.ParamByName('IDPESSOA').AsInteger   := StrToInt(idbeneficiario);
    qryEnderecos.Open;
    qryTelefones.ParamByName('IDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
    qryTelefones.Open;
    qryContaCorrente.ParamByName('IDPESSOA').AsInteger   := StrToInt(idbeneficiario);
    qryContaCorrente.Open;
    // pega forma padrão de atendimento
    eddlghorainicio.text        := timetostr(time);
    eddlghora.text              := timetostr(time);
    dbdateInicio.Text           := datetostr(date);
    dbdateFim.Text              := datetostr(date);
    qrycodatendente.AsFloat     := Sistema.IdUsuario;
    qryCidades.Locate('IDCIDADES',dtmAtend.QryDadosParticipIDCIDADES.AsInteger,[loCaseInsensitive, loPartialKey]);
    dblkCidade.LookupValue := InttoStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
    dblkCidade.Text        := qryCidades.FieldByName('NOME').AsString;
    qryUF.Locate('CODESTADO',dtmAtend.QryDadosParticipcodestado.AsString,[loCaseInsensitive, loPartialKey]);
    dblkEstado.LookupValue := dtmAtend.QryDadosParticipcodestado.AsString;
    dblkEstado.Text        := dtmAtend.QryDadosParticipcodestado.AsString;

    if qry.FieldByName('TIPOSOLIC').asString <> '' Then Begin
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'C' Then
             chkTipoTelefone.Checked[0] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'P' Then
             chkTipoTelefone.Checked[1] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'F' Then
             chkTipoTelefone.Checked[2] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'L' Then
             chkTipoTelefone.Checked[3] := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qry.FieldByName('TIPOSOLIC').AsString[iLoopTel] = 'R' Then
             chkTipoTelefone.Checked[4] := True
        end;
    end;
    dtmAtend.QryDadosParticip.Close;
  End;
  tbbConsultaParticip.Enabled := True;

// Inicio Andre Tavares 17/01/2002
  QrydocsXbenef.close;
  QrydocsXbenef.ParamByName('IDPESSOA').AsFloat := strToFloat(MsParticipante.ValoresChave[6]);
  QrydocsXbenef.ParamByName('IDPLANOPREV').AsFloat := strToFloat(MSParticipante.ValoresChave[10]);
  // tive que adicionar este campo no montaselect
  QrydocsXbenef.ParamByName('IDSITBENEF').AsFloat := strToFloat(MSParticipante.ValoresChave[13]);

  QrydocsXbenef.prepare;
  QrydocsXbenef.open;
// fIM Andre Tavares 17/01/2002


end;

procedure TFrmAtend.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  Begin
    Selecionar(StrToInt(MontaSelect.ValoresChave[6]));
    ednome.Text        := MontaSelect.ValoresChave[0];
    edcpf.Text         := MontaSelect.ValoresChave[1];
    edmat.Text         := MontaSelect.ValoresChave[2];
    edinsc.Text        := MontaSelect.ValoresChave[3];
    edPlano.Text       := MontaSelect.ValoresChave[4];
    edPatro.Text       := MontaSelect.ValoresChave[5];
    idpessjur          := MontaSelect.ValoresChave[7];
    idTitular          := MontaSelect.ValoresChave[8];
    EdtSitCad.Text     := MontaSelect.ValoresChave[9];

    

{*** inicio andre 10/01/2002 inclui cidade, idtipoAtend no montaselect***}

    { alimenta o campo Tipo de atendimento}
    qryTipoAtend.Locate('IDTIPOATEND',StrToInt(MontaSelect.ValoresChave[11]),[loCaseInsensitive, loPartialKey]);
    dblkTipoAtendimento.LookupValue := MontaSelect.ValoresChave[11];
    dblkTipoAtendimento.Text        := qryTipoAtend.fieldByName('NOME').AsString;

    {pega o endereco do beneficiário***************}
    qryEnderecos.Close;
    qryEnderecos.ParamByName('IDPESSOA').AsFloat := qryIdBeneficiario.AsFloat;
    qryEnderecos.Open;

    { alimenta o campo CIDADE}
    qryCidades.Locate('IDCIDADES', qryEnderecos.fieldByName('IdCidades').asInteger,[loCaseInsensitive, loPartialKey]);
    dblkCidade.LookupValue := InttoStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
    dblkCidade.Text        := qryCidades.FieldByName('NOME').AsString;

    { alimenta o campo UF}
    qryUF.Locate('CODESTADO',qryEnderecos.fieldByName('CODESTADO').asString,[loCaseInsensitive, loPartialKey]);
    dblkEstado.LookupValue := InttoStr(qryUF.FieldByName('IDESTADO').AsInteger);
    dblkEstado.Text        := qryUF.FieldByName('CODESTADO').AsString;
{*** fim andre 10/01/2002 inclui cidade no montaselect***}


    dbedatend.text     := dtmAtend.qryusuario.fieldbyname('nomeusuario').AsString;
    If (dbedatend.Text = '') Then dbedatend.text := Sistema.NomeUsuario;

    eddlghorainicio.text := timetostr(time);
    eddlghorainicio.Enabled:=false;
    timer1.enabled := true;

    AbreQryAssuntoxAtend;
  End;

end;

procedure TFrmAtend.Selecionarfilhas;
Begin
  //Fechando as Queries filhas;
  with dtmAtend do
  begin
    With qryusuario Do
    Begin
      if dtmAtend.qryUsuario.Active Then dtmAtend.qryUsuario.close;
      If Active Then close;
      If Not Prepared Then Prepare;
      if qryCODATENDENTE.AsString <> '' Then
        ParamByName('CODATEND').AsFloat := StrtoFloat(qryCODATENDENTE.AsString);
    End;

    With qryscroll Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryevent Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryplanprev Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
      Open;
    End;

    With qrycontrib Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrybenef Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrypartprev Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryhistfunc Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrypartgeral Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrydepentit Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    End;

    With qryendereco Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    End;

    With qryplanass Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qrypart Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    With qryprocesso Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
    End;

    With qrycontribprev Do
    Begin
      If Active Then close;
      If Not Prepared Then Prepare;
      ParamByName('IDTITULAR').AsFloat := qryIDTITULAR.AsFloat;
      ParamByName('IDPESSJUR').AsFloat := qryIDPESSJUR.AsFloat;
    End;

    FuncaoGeral.FechaQry([qryRubXBeneficio,qryTipoDocRubPendentes,qryRUBpendentes,
                          qryTipoDocXRub, qryRUBpendentesHistorico],false,True);
  End;

End;

procedure TFrmAtend.Selecionar(const IdAtend: LongInt);
begin
  with qry do
  begin
    Close;
    If Not Prepared Then Prepare;
    Params[0].Asfloat := IdAtend;
    Open;
  end;

  If IdAtend <> -1 Then
     Selecionarfilhas
  Else
  Begin
    ednome.text := '';
    edcpf.text := '';
    edinsc.text := '';
    edPlano.text := '';
    edmat.text := '';
    edPatro.text := '';
    eddlghorainicio.text := '';
    eddlghora.text := '';
    edcod.text := '';
    edseque.text := '';
    EdtSitCad.Text := '';
  End;
end;

procedure TfrmAtend.Timer1Timer(Sender: TObject);
begin
  inherited;
  eddlghora.text := timetostr(time);
end;

procedure TfrmAtend.sbtnAlterarClick(Sender: TObject);
begin
  PgAtend.activepage := TbShtAtend;
  inherited;
end;

procedure TfrmAtend.bbtnSairClick(Sender: TObject);
begin
  timer1.enabled := false;

  inherited;
  IF  dtmBaseDados.dbBaseDados.InTransaction    THEN
   BEGIN
    RollbackTransacao;
    END;
end;

procedure TfrmAtend.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Fiario.Free;
  Rad.Free;
  Atendimento.Free;
end;

procedure TfrmAtend.cmbfilialEnter(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryfilial.active then
     dtmAtend.qryfilial.open;
end;

procedure TfrmAtend.dbgridempDblClick(Sender: TObject);
begin
  inherited;
  if not dtmAtend.qryemp.eof then
     AbrirFormModal(frmConsHistRecEmp, TfrmConsHistRecEmp);
end;

procedure TfrmAtend.FormCreate(Sender: TObject);
begin
  inherited;
  Fiario := TFiario.Create;
  Atendimento := TAtendimento.Create;
  iLinhaFiltro := -1;
  Rad  := Trad.Create;

  CmeCadastro.RepetirInsert := false;
  Selecionar(-1);

  PgAtend.ActivePage := TbShtAtend;
  PgAtend.ActivePage          := TbShtAtend;
  PageDadosAssunto.ActivePage := TbDadosAtend;


end;

procedure TfrmAtend.bb_procparticipanteClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
     if MSParticipante.Executar = MrOk then
        PegaParticipante(MSParticipante)
     Else
        if MsBeneficiario.Executar = MrOk then
           PegaParticipante(MsBeneficiario);
  End;
end;

procedure TfrmAtend.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If (Shift = [ssCtrl]) Then
     Case Key Of
        ord('I'), ord('i') :
               Begin
                 if PageDadosAssunto.ActivePage = tbsDadosParticip Then Begin
                   if pgCtrlDadosParticip.ActivePage = tbsEnderecos Then
                      tbbInsEnderecoClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsTelefones Then
                      tbbInsTelefoneClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsContaCorrente Then
                      tbbInsContaCorrenteClick(Sender);
                 end;
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      sbtnInsDetClick(Sender);
                 end;
               end;
        ord('A') , ord('a') :
               Begin
                 if PageDadosAssunto.ActivePage = tbsDadosParticip Then Begin
                   if pgCtrlDadosParticip.ActivePage = tbsEnderecos Then
                      tbbAltEnderecoClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsTelefones Then
                      tbbAltTelefoneClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsContaCorrente Then
                      tbbAltContaCorrenteClick(Sender);
                 end;
               end;
        ord('E'), ord('e') :
               Begin
                 if PageDadosAssunto.ActivePage = tbsDadosParticip Then Begin
                   if pgCtrlDadosParticip.ActivePage = tbsEnderecos Then
                      tbbExcEnderecoClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsTelefones Then
                      tbbExcTelefoneClick(Sender);
                   if pgCtrlDadosParticip.ActivePage = tbsContaCorrente Then
                      tbbExcContaCorrenteClick(Sender);
                 end;
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      sbtnExcluiDetClick(Sender);
                 end;
               end;
        ord('R'), ord('r') :
               Begin
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      BtnGetRespostaClick(Sender);
                 end;
               end;
        ord('D'), ord('d') :
               Begin
                 if PgAtend.ActivePage = TbShtAtend Then Begin
                   if PageDadosAssunto.ActivePage = TbsAssuntos Then
                      BtnAtendAntClick(Sender);
                 end;
               end;

     End
  Else
     Case Key Of
        VK_F3:  PgAtend.ActivePage := TbShtAtend;
        VK_F4:  tbbConsultaParticipClick(Sender);
        VK_F5:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbDadosAtend;
                end;
        VK_F6:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbsAssuntos;
                end;
        VK_F7:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbsGeral;
                end;
        VK_F8:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := tbsDadosParticip;
                end;
        VK_F9:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := tbShtSimulaBenef;
                end;
// Inicio Andre Tavares 17/01/2002
        VK_F10:  Begin
                  PgAtend.ActivePage := TbShtAtend;
                  PageDadosAssunto.ActivePage := TbShtDocsXBenef;
                 end;
// Fim Andre Tavares 17/01/2002
     else
        PgAtend.ActivePage := TbShtAtend;
  End;
  PgAtendChange(Self);
end;

procedure TfrmAtend.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  IF  dtmBaseDados.dbBaseDados.InTransaction    THEN
   BEGIN
    RollbackTransacao;
   END;
  Selecionar(-1);
  PgAtend.Enabled := False;
  PageDadosAssunto.Enabled := False;
  tbbConsultaParticip.Enabled := false;
  tbbinsendereco.Enabled := False;
  tbbaltendereco.Enabled := False;
  tbbexcendereco.Enabled := False;
  tbbinstelefone.Enabled := False;
  tbbalttelefone.Enabled := False;
  tbbexctelefone.Enabled := False;
  tbbinscontacorrente.Enabled := False;
  tbbaltcontacorrente.Enabled := False;
  tbbexccontacorrente.Enabled := False;
  PgAtend.Enabled             := False;
  PageDadosAssunto.Enabled    := False;
  tbbConsultaParticip.Enabled := False;
end;

procedure TfrmAtend.BtnConsultaAtendimentoClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
     AbrirForm( frmConsAtend, TfrmConsAtend, false );
     Application.ProcessMessages;
     frmConsAtend.cmbpatroEnter(frmConsAtend.cmbpatro);
     Application.ProcessMessages;
     frmConsAtend.edinsc.Text          := edinsc.Text;

     frmConsAtend.bbtnConsultar.Click;
  End;
end;

procedure TfrmAtend.BtnGetRespostaClick(Sender: TObject);
begin
  inherited;

  If DBLKAssunto.Text = '' Then
     MsgDlg('Obrigatório Indicar o Assunto','Erro',MtError,[MbOk],0)
  Else
  Begin
     MsResposta.Caption := 'Seleciona Resposta Padrão Para o Assunto ' + DBLKAssunto.Text;
     MsResposta.Filtro.Clear;
     MsResposta.Filtro.Add('ASSUNTOXRESP.IDASSUNTO = ' + dblkAssunto.LookupValue);
     MsResposta.Filtro.Add('RESPATEND.IDRESPATEND = ASSUNTOXRESP.IDRESPATEND');
     MsResposta.Executar;
     If MsResposta.RetornouValor Then
     Begin
       If QryBuscaResposta.Active Then QryBuscaResposta.Close;
       If Not QryBuscaResposta.Prepared Then QryBuscaResposta.Prepare;
       QryBuscaResposta.Params[0].AsFloat := StrToInt(MsResposta.ValoresChave[2]);
       QryBuscaResposta.Open;

       If QryBuscaResposta.IsEmpty Then
          QryAssuntoxAtendDESCRESPATEN.Clear
       Else
          QryAssuntoxAtendDESCRESPATEN.AsString := QryBuscaRespostaDESCRESPATEN.AsString;

       QryAssuntoxAtendIDASSUNTOXRESP.AsFloat := StrToInt(MsResposta.ValoresChave[0]);
     End
     Else
     Begin
       QryAssuntoxAtendDESCRESPATEN.Clear;
       QryAssuntoxAtendIDASSUNTOXRESP.Clear;
     End;
  End;
end;
//Fim andre Tavares 22/01/2002

Procedure TfrmAtend.AtualizaDadosRub;
Begin
  With dtmAtend Do
  Begin
     With qryTipoDocRubPendentes Do
     Begin
      Close;
      If Not Prepared Then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
      Open;
     End;

     With qryRUBpendentes Do
     Begin
      Close;
      If Not Prepared Then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
      Open;
     End;

     With qryRUBpendentesHistorico Do
     Begin
      Close;
      If Not Prepared Then Prepare;
      ParamByName('idpessjur').AsFloat   := qryidpessjur.AsFloat ;
      ParamByName('idTitular').AsFloat   := qryidTitular.AsFloat ;
      ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
      Open;
     End;

     With qryTpRecebimento Do
     Begin
       Close;
       Open;
     End;

     With qryTpCancelamento Do
     Begin
       Close;
       Open;
     End;

     With QryRubs Do
     Begin
       if Active then Close;
       if Not Prepared then Prepare;
       ParamByName('idpessjur').AsFloat := qryidpessjur.AsFloat ;
       ParamByName('idTitular').AsFloat := qryidTitular.AsFloat ;
       ParamByName('idplanoprev').AsFloat := qryplanprev.FieldByName('idplanoprev').AsFloat;
       Open;
     End;

     qryTipoDocXRub.Close;
     qryTipoDocXRub.Open;

     qryRubXBeneficio.Close;
     qryRubXBeneficio.Open;

     QryHistRubs.Close;
     QryHistRubs.Open;
  End;
End;

procedure TfrmAtend.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
    AtualizaDetalhe(True);
    QryAssuntoxAtend.Append;
    QryAssuntoxAtendIDATEND.AsFloat := QryIDATEND.AsFloat;
    QryAssuntoxAtendDESCRESPATEN.Clear;
  End;
end;

procedure TfrmAtend.tbbAltEnderecoClick(Sender: TObject);
begin
  inherited;

  qryCidades.Locate('IDCIDADES',QryEnderecosIDCIDADES.AsInteger,[loCaseInsensitive, loPartialKey]);
  dblkCidade1.LookupValue := InttoStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
  dblkCidade1.Text        := qryCidades.FieldByName('NOME').AsString;
 flgexcluir := 0;
 groupbox1.enabled := true;
 dbEnderecos.SendToBack;
 qryenderecos.edit;
 chkbxComercial.State       := cbUnchecked;
 chkbxResidencial.State     := cbUnchecked;
 chkbxEntrega.State         := cbUnchecked;
 chkbxCobranca.State        := cbUnchecked;
 chkbxCorrespondencia.State := cbUnchecked;
 chkbxComercial.Checked       := false;
 chkbxResidencial.Checked     := false;
 chkbxEntrega.Checked         := false;
 chkbxCobranca.Checked        := false;
 chkbxCorrespondencia.Checked := false;

  With qryPessoa do
    begin
      If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       Open;
  end;

 if qryPessoaIdendCorresp.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxCorrespondencia.Checked := True;

 if qryPessoaIdendComercial.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxComercial.Checked := True;

 if qryPessoaIdendEntrega.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxEntrega.Checked := True;

 if qryPessoaIdendResidencial.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxResidencial.Checked := True;

 if qryPessoaIdendCobranca.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxCobranca.Checked := True;


 if chkbxComercial.Checked then
     BEGIN
       QRYCOMERCIAL.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       QRYCOMERCIAL.ParamByName('IDENDCOMERCIAL').CLEAR;
       QRYCOMERCIAL.EXECSQL
     END;


 if chkbxResidencial.Checked then
      BEGIN
        QRYRESIDENCIAL.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYRESIDENCIAL.ParamByName('IDENDRESIDENCIAL').CLEAR;
        QRYRESIDENCIAL.EXECSQL;
     END;

  if chkbxEntrega.Checked then
     BEGIN
        QRYENTREGA.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYENTREGA.ParamByName('IDENDENTREGA').CLEAR;;
        QRYENTREGA.EXECSQL;
     END;

   if chkbxCobranca.Checked then
      BEGIN
       QRYCOBRANCA.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYCOBRANCA.ParamByName('IDENDCOBRANCA').CLEAR;
        QRYCOBRANCA.EXECSQL;
     END;

     if chkbxCorrespondencia.Checked then
     BEGIN
        QRYCORRESP.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYCORRESP.ParamByName('IDENDCORRESP').CLEAR;
        QRYCORRESP.EXECSQL;
     END;


end;

procedure TfrmAtend.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  If Qry.State In [DsEdit,DsInsert] Then
  Begin
    If Application.MessageBox('Confirma a Exclusão ?','Atenção',Mb_YesNo + Mb_IconQuestion) = Id_Yes Then
       QryAssuntoxAtend.Delete;
  End;
end;

procedure TfrmAtend.bbtnVoltarDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(False);
  QryAssuntoxAtend.Cancel;
end;

procedure TfrmAtend.AtualizaDetalhe(bAtualiza: Boolean);
begin
  inherited;
  If bAtualiza Then
  Begin
     PnlAssuntoAtend.SendToBack;
// inicio Andre Tavares 22/01/2002
     If DBLKAssunto.CanFocus Then DBLKAssunto.SetFocus;
//Fim Andre Tavares 22/02/2002
  End
  Else
     PnlAssuntoAtend.BringToFront;

  BtnGetResposta.Enabled := bAtualiza;
  sbtnInsDet.Enabled     := Not bAtualiza;
  sbtnExcluiDet.Enabled  := Not bAtualiza;
end;


procedure TfrmAtend.bbtnOkDetClick(Sender: TObject);
begin
  inherited;
  //Valida Assunto
//Inicio Andre Tavares 22/01/2002
  if DBLKAssunto.Text <> '' then
//Fim Andre Tavares 22/01/2002
  Begin
     If QryAssuntoxAtend.State = DsInsert Then
     Begin
        ProcuraAssuntoValidaDados(Sender);
        QryAssuntoxAtend.Post;
        sbtnInsDet.Click;
     End
     Else
     Begin
        QryAssuntoxAtend.Post;
        bbtnVoltarDet.Click;
     End;
  End;
end;

procedure TfrmAtend.AbreQryAssuntoxAtend;
var estado : TDataSetState;
Begin
  With QryAssuntoxAtend Do
  Begin
     If Active Then Close;
     If Not Prepared Then Prepare;
     ParamByname('IDATEND').AsFloat := qryIDATEND.AsFloat;
     Open;
     estado := QryAssuntoxAtend.state;
     QryAssuntoxAtend.Edit;
     DBLKAssunto.Text := FieldByName('NOME').asString;
     DBLKGrupoAssunto.text := FieldByName('DESCGRUPOASSUNTO').asString;
  End;
End;
//fim andre tavares 22/01/2002

procedure TfrmAtend.CmeCadastroConfirma(Sender: TObject);
Var
  idEndereco, iIdCidade,Idtelefone:LongInt;
  id,grupo : integer;
  sTipo : String;
Begin
      // Telefone do Solicitante
      begin
         sTipo := '';
         if chkTipoTelefone.Checked[0] then
            sTipo := sTipo + 'C';
         if chkTipoTelefone.Checked[1] then
            sTipo := sTipo + 'P';
         if chkTipoTelefone.Checked[2] then
            sTipo := sTipo + 'F';
         if chkTipoTelefone.Checked[3] then
            sTipo := sTipo + 'L';
         if chkTipoTelefone.Checked[4] then
            sTipo := sTipo + 'R';

         if sTipo = '' then
         begin
              chkTipoTelefone.State[0] := cbChecked;
              sTipo := 'C';
         end;
         qry.FieldByName('TIPOSOLIC').AsString := sTipo;
      end;
      If dtmAtend.QryDadosParticip.Active Then dtmAtend.QryDadosParticip.Close;
      If Not dtmAtend.QryDadosParticip.Prepared Then dtmAtend.QryDadosParticip.Prepare;
      if SELF.tag = 0      then
        dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDTITULAR.AsFloat
      else
        dtmAtend.QryDadosParticip.ParamByName('IDPESSOA').AsFloat := qryIDBENEFICIARIO.AsFloat;

      dtmAtend.QryDadosParticip.Open;
      dtmAtend.QryDadosParticip.Close;

      If Trim(dbdateFim.Text) = '' Then dbdateFim.Date :=Date;

      Qry.First;
      While Not Qry.Eof Do Begin
        Atendimento.IdAtend              := qryIDATEND.AsFloat;
        Atendimento.IdTipoAtend          := StrtoInt(dblkTipoAtendimento.LookupValue);
        Atendimento.IdTitular            := qryIDTITULAR.AsFloat;
        Atendimento.Idbeneficiario       := qryIDBENEFICIARIO.AsFloat;
        Atendimento.IdPessjur            := qryIDPESSJUR.AsFloat;
        Atendimento.ComplCondAtend       := qryCOMPLCODATEND.AsFloat;
        Atendimento.IdLocalAtendXCpu     := qryIDLOCALATENDXCPU.AsFloat;
        Atendimento.Data                 := qryDATA.AsDateTime;
        Atendimento.DataInicio           := qryDATAINICIO.AsDateTime;
        Atendimento.CodAtend             := qryCODATEND.Asfloat;
        Atendimento.CodAtendente         := qryCODATENDENTE.AsString;
        Atendimento.Resposta             := qryRESPOSTA.AsString;
        Atendimento.Status               := qrySTATUS.AsString;
        Atendimento.Observacao           := qryOBSERVACAO.AsString;
        Atendimento.Pergunta             := qryPERGUNTA.AsString;
        Atendimento.NomeSolicitante      := qryNOMESOLICITANTE.AsString;
        Atendimento.TelSolicitante       := qryTELSOLICITANTE.AsString;
        Atendimento.Logradouro           := qryLOGRADOURO.AsString;
        Atendimento.NumeroSolic          := qryNUMEROSOLIC.AsString;
        Atendimento.ComplemSolic         := qryCOMPLEMSOLIC.AsString;
        Atendimento.BairroSolicitante    := qryBAIRROSOLIC.AsString;
        Atendimento.CepSolicitante       := qryCEPSOLIC.AsString;
        Atendimento.CidadeSolicitante    := qryCIDADESOLIC.AsString;
        Atendimento.IdEstado             := QryIdEstado.AsInteger;
        Atendimento.CODESTADOSOLICITANTE := qryCODESTADOSOLIC.AsString;
        {FDIAS - FCRT - SET/2001}
        Atendimento.TipoSolic            := qryTIPOSOLIC.AsString;
        Atendimento.DDISolic             := qryDDISOLIC.AsString;
        Atendimento.DDDSolic             := qryDDDSOLIC.AsString;
        Atendimento.NumeroTelSolic       := qryNUMEROTELSOLIC.AsString;

        if qryIDATEND.AsFloat <> 0 Then
           Atendimento.Edit
        Else Begin
           Atendimento.Data       := StrToDateTime(dbdateFim.Text + ' ' + eddlghora.Text);
           Atendimento.DataInicio :=StrToDateTime(dbdateInicio.Text + ' ' + eddlghorainicio.Text);
           Atendimento.Status     := ModuloCap.GetStatusAtend(bNovoAtendimento);
           Atendimento.Insert;

        end;

        Qry.Next;
      End;

      QryAssuntoxAtend.First;
      While Not QryAssuntoxAtend.Eof Do
      Begin
        //Gera Rad
        If (Sistema.UsaRAD) And
           (Not QryAssuntoxAtendIDTIPOPROCESSO.isNull) And
           (QryAssuntoxAtendIDPROCESSO.IsNull) Then
        Begin
           rad.TipoProcesso  := QryAssuntoxAtendIDTIPOPROCESSO.AsInteger;
           rad.IdPessoa      := Sistema.IdEmpresa;
           rad.IdPessResp    := qryIDTITULAR.AsInteger;
           rad.OBS           := Trim(Copy(' Atendimento Nº: ' + qryIDATEND.AsString + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
//Inicio Andre Tavares 22/01/2002
                                          ' Assunto: ' + DBLKAssunto.Text +
//Fim Andre Tavares 22/01/2002

                                          ' Atendente: ' + dbedatend.Text +
                                          ' Solicitante: ' + dbednomesol.Text +
                                          ' Elegível ou Participante: ' + ednome.Text,1,200));
           QryAssuntoxAtend.Edit;
           QryAssuntoxAtendIDPROCESSO.AsFloat   := rad.IniciarProcesso;
           QryAssuntoxAtend.Post;

           MsgDlg('Foi Iniciado o processo no RAD número: ' + QryAssuntoxAtendIDPROCESSO.AsString,'Atenção',mtInformation,[mbOk],0);
        End
        Else
        Begin
           QryAssuntoxAtend.Edit;
           QryAssuntoxAtendIDPROCESSO.Clear;
           QryAssuntoxAtend.Post;
        End;

        //Insere o Assunto do Atendimento Atendimento
        Atendimento.Assuntos.IdAssunto := QryAssuntoxAtendIDASSUNTO.AsFloat;
        Atendimento.Assuntos.IdAssuntoxResposta := QryAssuntoxAtendIDASSUNTOXRESP.AsFloat;
        Atendimento.Assuntos.IdProcesso := QryAssuntoxAtendIDPROCESSO.AsFloat;
        Atendimento.Assuntos.Insert;

        //Gera Rub fiario
        if (QryAssuntoxAtendEXISTERUB.AsFloat > 0) Then
        Begin
          Rubs.FormCaption := 'Assunto: ' + QryAssuntoxAtendNOME.AsString;
          Rubs.IdAssuntoxAtend := Atendimento.Assuntos.IdAssuntoxAtend;
          Rubs.Execute;
          If Qryultrub.Active Then Qryultrub.Close;
            qryultrub.open;

         If  qryultrubFLGSTATUS.ASSTRING = '0' Then Begin
            If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 9;
            qrygrupo.Open ;
            If not qrygrupo.eof  then
                grupo := qryGrupoIdfiarass.Asinteger
            else
                grupo := 1;
            Fiario.IdPessoa     := strtoint(idbeneficiario);
            Fiario.IdTitular    := strtoint(idtitular);
            Fiario.Idusuario    := sistema.idusuario;
            Fiario.Idmodulo     := 19;
            Fiario.IdGrupo      := grupo;
            Fiario.Idrubs       := qryultrubultrub.ASinteger;
            Fiario.Descricao    := 'Geração de Rub referente ao  '+qryassuntoxAtendnome.AsString;
            Fiario.DataInclusao := Date;
            Fiario.Inserir;
            With QRYALTRUBS Do Begin
               ParamByName('IDRUBS').AsINTEGER   := qryultrubultrub.ASinteger;
               ParamByName('FLGSTATUS').AsString := '1';
               ExecSql;
            end;
         end;
          QryAssuntoxAtend.Edit;
          QryAssuntoxAtendEXISTERUB.AsFloat := -1;
          QryAssuntoxAtend.Post;
        End;

        QryAssuntoxAtend.Next;
      End;

        CommitTransacao;
        tbbinsendereco.Enabled := False;
        tbbaltendereco.Enabled := False;
        tbbexcendereco.Enabled := False;
        tbbinstelefone.Enabled := False;
        tbbalttelefone.Enabled := False;
        tbbexctelefone.Enabled := False;
        tbbinscontacorrente.Enabled := False;
        tbbaltcontacorrente.Enabled := False;
        tbbexccontacorrente.Enabled := False;
       tbbConsultaParticip.Enabled := false;

      FuncaoGeral.FechaQry([Qry,QryAssuntoxAtend],false,true);
      Qry.Open;
      QryAssuntoxAtend.Open;

   Selecionar(-1);

   CmeCadastro.AtualizaBotoes(Self);

   AbreQryAssuntoxAtend;

   BtnAtendAnt.Tag           := 0;
   sbtnInsDet.Visible        := False;
   sbtnExcluiDet.Visible     := True;
   BtnGetResposta.Visible    := True;
   tb97BotoesDetalhe.Visible := True;
   GrdAssunto.DataSource     := DsAssuntoxAtend;
   LblAssunto.Caption        := 'Assuntos Do Atendimento Corrente';
   LblAssunto.Left           := 112;
   tbbConsultaParticip.Enabled := False;
End;

procedure TfrmAtend.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;
  If QryAssuntoxAtend.Active And QryAssuntoxAtend.UpdatesPending Then
     QryAssuntoxAtend.cancelUpdates;
  qry.Close;
  qry.Open;
  AbreQryAssuntoxAtend;
End;

Procedure TfrmAtend.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
Begin
   Accept := False;

   If QryAssuntoxAtend.State In [DsEdit,DsInsert] Then
     bbtnCancelarDet.Click;

   if dbednomesol.Text = ''  then
    begin
       MsgDlg('Favor informar o solicitante!','Atenção',mtError,[mbOk],0);
       If dbednomesol.CanFocus Then dbednomesol.SetFocus;
       exit;
    end;
  if dbdateInicio.Text = ''  then
    begin
       MsgDlg('Favor informar a Data Inicio!','Atenção',mtError,[mbOk],0);
       If dbdateInicio.CanFocus Then dbdateInicio.SetFocus;
       exit;
    end;
  if dbdateInicio.Text > dbdateFim.Text  then
    begin
       MsgDlg('Data Inicial maior que a Final!','Atenção',mtError,[mbOk],0);
       If dbdateInicio.CanFocus Then dbdateInicio.SetFocus;
       exit;
    end;
   if edtLogradouro.Text = ''  then
    begin
       MsgDlg('Favor informar o logradouro do solicitante!','Atenção',mtError,[mbOk],0);
       If edtLogradouro.CanFocus Then edtLogradouro.SetFocus;
       exit;
    end;

   if edtbairro.Text = ''  then
    begin
       MsgDlg('Favor informar o bairro do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       If edtbairro.CanFocus Then edtbairro.SetFocus;
       exit;
    end;

   if edtcep.Text = ''  then
    begin
       MsgDlg('Favor informar o CEP do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       If edtcep.CanFocus Then edtcep.SetFocus;
       exit;
    end;

   if dblkCidade.LookupValue = ''  then
    begin
       MsgDlg('Favor informar a Cidade do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       dblkCidade.SetFocus;
       exit;
    end;

   if dblkEstado.LookupValue = ''  then
    begin
       MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       dblkEstado.SetFocus;
       exit;
    end;

   if (dblkTipoAtendimento.LookupValue = '') and  (dblkTipoAtendimento.text = '') then
      begin
        MsgDlg('Favor informar a Forma de Atendimento!','Atenção',mtError,[mbOk],0);
        dblkTipoAtendimento.SetFocus;
        exit;
      end;

   if QryAssuntoxAtend.IsEmpty then
      begin
        MsgDlg('Favor informar o Assunto!','Atenção',mtError,[mbOk],0);
//Inicio Andre Tavares 22/01/2002
        If DBLKAssunto.CanFocus Then DBLKAssunto.SetFocus;
//FIM Andre Tavares 22/01/2002

        exit;
      end;
   qry.FieldByName('IDTIPOATEND').AsInteger   := qryTipoAtend.FieldbyName('IDTIPOATEND').AsInteger;
   qry.FieldByName('CIDADESOLIC').AsString    := dblkCidade.LookupValue;
   qry.FieldByName('CODESTADOSOLIC').AsString := dblkEstado.LookupValue;
   Accept := True;
End;

procedure TfrmAtend.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  Inherited;
  pnlFundo.Enabled := True;
  sbtnProcurar.Enabled := Not (CmeCadastro.Operacao In [OpInserir,Opalterar])
End;

procedure TfrmAtend.dbgridprocDblClick(Sender: TObject);
begin
  inherited;
  With dtmAtend Do
  Begin
     If Not qryprocesso.IsEmpty Then
     Begin
        Application.CreateForm(TFrmAcompProc,FrmAcompProc);

        FrmAcompProc.sTipoProc := qryprocessoTIPOPROCESSO.AsString;
        FrmAcompProc.sObs      := Trim(Copy(' Atendimento Nº: ' + FloattoStr(qryCODATEND.AsFloat) + ' Complemento: ' + qryCOMPLCODATEND.AsString + (#13+#10) +
//Inicio Andre Tavares 22/01/2002
                                            ' Assunto: ' + DBLKAssunto.Text +
//Fim Andre Tavares 22/01/2002

                                            ' Atendente: ' + dbedatend.Text +
                                            ' Solicitante: ' + dbednomesol.Text +
                                            ' Elegível ou Participante: ' + ednome.Text,1,200));
        FrmAcompProc.iNumProc  := qryprocessoIDPROCESSO.AsInteger;
        FrmAcompProc.sPessoa   := ednome.Text;
        FrmAcompProc.sDoc      := edmat.Text;
        FrmAcompProc.sUsuario  := Sistema.NomeUsuario;
        FrmAcompProc.ShowModal;
     End;
  End;
end;

procedure TfrmAtend.BtnAtendAntClick(Sender: TObject);
begin
  inherited;
  Case BtnAtendAnt.Tag of
  0: Begin
       BtnAtendAnt.Tag          := 1;
       sbtnInsDet.Visible       := False;
       sbtnExcluiDet.Visible    := False;
       BtnGetResposta.Visible   := False;
       GrdAssunto.DataSource    := DsAssuntoxAtendAnt;
       ReRespostaAux.DataSource := DsAssuntoxAtendAnt;
       LblAssunto.Caption       := 'Assuntos Do Atendimento Anterior';
       LblAssunto.Left          := 37;
     End;
  1: Begin
      BtnAtendAnt.Tag           := 0;
      sbtnInsDet.Visible        := True;
      sbtnExcluiDet.Visible     := True;
      BtnGetResposta.Visible    := True;
      tb97BotoesDetalhe.Visible := True;
      GrdAssunto.DataSource     := DsAssuntoxAtend;
      ReRespostaAux.DataSource  := DsAssuntoxAtend;
      LblAssunto.Caption        := 'Assuntos Do Atendimento Corrente';
      LblAssunto.Left           := 112;
    End;
  End;
end;

procedure TfrmAtend.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  AtualizaDetalhe(False);
  QryAssuntoxAtend.Cancel;
end;

procedure TfrmAtend.BuscaAtendPend(IdTitular :LongInt);
Begin
 With QryPENDECIA Do
  Begin
     If Active Then Close;
     If Not Prepared Then Prepare;
     ParamByname('IDTITULAR').AsINTEGER := IDTITULAR;
     Open;
  End;
If NOT qryPENDECIA.EOF   THEN
     Application.MessageBox('Existem atendimentos pendentes para este Titular. ','Atendimento',Mb_IconInformation);
End;

procedure TfrmAtend.ProcuraAssuntoValidaDados(Sender: TObject);
begin
  inherited;
  If (ActiveControl <> nil) And
     (ActiveControl.Tag <> 9) Then
  Begin
    If (QryAssuntoxAtend.State In [DsEdit, DsInsert]) then
    Begin
      If (DBLKAssunto.TEXT = '') Then
      Begin
        If DBLKAssunto.CanFocus Then DBLKAssunto.SetFocus
      End
      Else
      Begin
         If (QryAssunto.FieldByName('IdConfigRubs').asString = '') Then
         Begin
            QryAssuntoxAtendEXISTERUB.AsFloat := 0;
            QryAssuntoxAtendIDMODELORUB.AsFloat := 0;
         End
         Else
         Begin
             QryAssuntoxAtendEXISTERUB.AsFloat := 1;
             QryAssuntoxAtendIDMODELORUB.AsFloat := QryAssunto.FieldByName('IdConfigRubs').asFloat;
         End;

         If (QryAssunto.FieldByName('IdTipoProcesso').asString = '') Then
         Begin
            QryAssuntoxAtendIDTIPOPROCESSO.Clear;
            QryAssuntoxAtendEXISTERAD.AsINTEGER := 0;
         End
         Else
         Begin
            QryAssuntoxAtendIDTIPOPROCESSO.AsFloat := QryAssunto.FieldByName('IdConfigRubs').asFloat;
            QryAssuntoxAtendEXISTERAD.AsINTEGER := 1;
         End;
         QryAssuntoxAtendNOME.AsString := QryAssunto.FieldByName('NOME').asString;
         QryAssuntoxAtendIdAssunto.AsString := QryAssunto.FieldByName('IDASSUNTO').asString;
         BtnGetResposta.Enabled := FazQuery(DtmbaseDados.Qry,'SELECT IDRESPATEND FROM ASSUNTOXRESP WHERE IDASSUNTO = ' + QryAssuntoxAtendIdAssunto.AsString);
      End;
    End;
  End;
end;



procedure TfrmAtend.ProcuraAssuntoApertouBotao(Sender: TObject);
begin
   MsAssunto.Filtro.Clear;
   MsAssunto.Filtro.Add('ASSUNTO.IDGRUPOASSUNTO = GRUPOASSUNTO.IDGRUPOASSUNTO(+)');
   MsAssunto.Filtro.Add('ASSUNTO.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)');
    If CkbFiltraPlano.Checked Then
         MsAssunto.Filtro.Add('ASSUNTO.IDPLANOPREV =  ' +  Frmatend.EDIDPLANOPREV.TEXT );
  inherited;
  QryAssuntoxAtendDESCRESPATEN.Clear;
end;

procedure TfrmAtend.PgAtendChange(Sender: TObject);
begin
  inherited;
  With dtmAtend Do
  Begin
    Case PgAtend.ActivePage.PageIndex of
      1:
      Begin
        ConsPart1.sIdPessoa    := IDTITULAR;
        ConsPart1.sIdPessjur   := IDPESSJUR;
        ConsPart1.sIdPlanoprev := IDPLANOPREV;
        ConsPart1.sSeqProposta := sequencia;
        ConsPart1.DataBaseName := 'BaseDados';
        ConsPart1.MostraConsulta;
      End;

    End;
  End;
end;

procedure TfrmAtend.GrdDocRecebidosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  If Field.FieldName = 'FLGRECEBIDO' Then  ABrush.Color := $00C6FFFF;
end;

procedure TfrmAtend.CkbFiltraPlanoClick(Sender: TObject);
begin
  inherited;
// Inicio Andre Tavares 21/01/2002
  QryAssunto.Close;
  QryAssunto.Sql.clear;
  DBLKGrupoAssunto.refresh;
  DBLKAssunto.Enabled := DBLkGrupoAssunto.Text <> '';

  If CkbFiltraPlano.Checked Then
  begin
    QryAssunto.SQL.Add('select distinct(a.IDASSUNTO), a.NOME, a.IDCONFIGRUBS, a.IDTIPOPROCESSO  from assunto a, PLANPREV p where (a.idgrupoassunto = :idgrupoassunto) '
                     + 'and (a.IDPLANOPREV = p.IDPLANOPREV) '+
                       'and (a.IDPLANOPREV = ' + DtmAtend.qryplanprev.FieldByName('idplanoprev').AsString + ' OR a.IDPLANOPREV IS NULL)' + ' order by a.nome ');
  end
  else
  begin
    QryAssunto.SQL.Add('select a.IDASSUNTO, a.NOME, a.IDCONFIGRUBS, a.IDTIPOPROCESSO  from assunto a, PLANPREV p where (a.idgrupoassunto = :idgrupoassunto) '
                     + 'and (a.IDPLANOPREV = p.IDPLANOPREV) order by a.nome');
  end;
  // se ja tem um grupo de assunto escolhido
  if DBLkGrupoAssunto.Text <> '' then
  begin
    QryAssunto.paramByName('IdGrupoAssunto').AsFloat := strToFloat(DBLkGrupoAssunto.LookUpValue);
    QryAssunto.Prepare;
    QryAssunto.Open;
  end

// Fim Andre Tavares 21/01/2002
end;


procedure TfrmAtend.edtufExit(Sender: TObject);
begin
   QryESTADO.ACTIVE := FALSE;
end;

procedure TfrmAtend.tbshtConsPartEnter(Sender: TObject);
begin
  inherited;
  ConsPart1.sIdPessoa    := IDBENEFICIARIO;
  ConsPart1.sIdPessjur   := IDPESSJUR;
  ConsPart1.sIdPlanoprev := IDPLANOPREV;
  ConsPart1.sSeqProposta := sequencia;
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.MostraConsulta;
end;

procedure TfrmAtend.sbtnInserirClick(Sender: TObject);
begin
  inherited;
   IF NOT dtmBaseDados.dbBaseDados.InTransaction THEN
          StartTransacao;

 tbbinsendereco.Enabled := true;
 tbbaltendereco.Enabled := true;
 tbbexcendereco.Enabled := true;
 tbbinstelefone.Enabled := true;
 tbbalttelefone.Enabled := true;
 tbbexctelefone.Enabled := true;
 tbbinscontacorrente.Enabled := true;
 tbbaltcontacorrente.Enabled := true;
 tbbexccontacorrente.Enabled := true;
  PgAtend.Enabled             := True;
  PageDadosAssunto.Enabled    := True;
  tbbConsultaParticip.Enabled := True;


  With qryparamgrupo Do
     Begin
      if Active Then
           Close;
      If Not Prepared Then
         Prepare;
      open;
  End;

 qryTipoAtend.Locate('IDTIPOATEND',qryPARAMGRUPOIDTIPOATEND.ASinteger,[loCaseInsensitive, loPartialKey]);
 dblkTipoAtendimento.LookupValue := InttoStr(qryPARAMGRUPOIDTIPOATEND.AsInteger);
 dblkTipoAtendimento.Text        := qryparamgrupoNOME.AsString;

end;

procedure TfrmAtend.FormShow(Sender: TObject);
begin
  inherited;
  qryCidades.Close;
  qryCidades.Open;
  qryUF.Close;
  qryUF.Open;
  qryTipoAtend.Close;
  qryTipoAtend.Open;
  qryParam.Close;
  qryParam.Open;
  idBeneficiario := '';
  flgexcluir := 0;
end;

procedure TfrmAtend.tbbConsultaParticipClick(Sender: TObject);
begin
  inherited;
  if idBeneficiario <> '' Then
    if StrtoInt(idBeneficiario) <> 0 Then Begin
      ConsPart1.sIdPessoa    := IDBENEFICIARIO;
      ConsPart1.sIdPessjur   := IDPESSJUR;
      ConsPart1.sIdPlanoprev := IDPLANOPREV;
      ConsPart1.sSeqProposta := sequencia;
      ConsPart1.DataBaseName := 'BaseDados';
      ConsPart1.MostraConsulta;
    end;
end;

procedure TfrmAtend.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlEnderecos.SendToBack;
  pnlcadTelefones.SendToBack;
  pnlContasCorrentes.SendToBack;
end;

procedure TfrmAtend.tbbInsEnderecoClick(Sender: TObject);
begin
 //  inherited;

 groupbox1.enabled := true;
 dbEnderecos.SendToBack;
 flgexcluir := 0;
 dblkCidade1.Text        := '';
 qryenderecos.insert;
 flgexcluir := 0;
 chkbxComercial.State       := cbUnchecked;
 chkbxResidencial.State     := cbUnchecked;
 chkbxEntrega.State         := cbUnchecked;
 chkbxCobranca.State        := cbUnchecked;
 chkbxCorrespondencia.State := cbUnchecked;
 chkbxComercial.Checked       := false;
 chkbxResidencial.Checked     := false;
 chkbxEntrega.Checked         := false;
 chkbxCobranca.Checked        := false;
 chkbxCorrespondencia.Checked := false;
end;

procedure TfrmAtend.tbbExcEnderecoClick(Sender: TObject);
begin
  inherited;

   qryCidades.Locate('IDCIDADES',QryEnderecosIDCIDADES.AsInteger,[loCaseInsensitive, loPartialKey]);
  dblkCidade1.LookupValue := InttoStr(qryCidades.FieldByName('IDCIDADES').AsInteger);
  dblkCidade1.Text        := qryCidades.FieldByName('NOME').AsString;

 flgexcluir := 1;
 groupbox1.enabled := false;
 dbEnderecos.SendToBack;
 qryenderecos.EDIT;
 chkbxComercial.State       := cbUnchecked;
 chkbxResidencial.State     := cbUnchecked;
 chkbxEntrega.State         := cbUnchecked;
 chkbxCobranca.State        := cbUnchecked;
 chkbxCorrespondencia.State := cbUnchecked;
 chkbxComercial.Checked       := false;
 chkbxResidencial.Checked     := false;
 chkbxEntrega.Checked         := false;
 chkbxCobranca.Checked        := false;
 chkbxCorrespondencia.Checked := false;

  With qryPessoa do
    begin
      If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       Open;
  end;

 if qryPessoaIdendCorresp.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxCorrespondencia.Checked := True;

 if qryPessoaIdendComercial.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxComercial.Checked := True;

 if qryPessoaIdendEntrega.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxEntrega.Checked := True;

 if qryPessoaIdendResidencial.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxResidencial.Checked := True;

 if qryPessoaIdendCobranca.AsFloat = qryEnderecosIdendereco.AsFloat then
         chkbxCobranca.Checked := True;



end;

procedure TfrmAtend.tbbInsTelefoneClick(Sender: TObject);
begin
  inherited;

  dbgtelefones.SendToBack;
  qryEnderecos.Close;
  qryEnderecos.ParamByName('idpessoa').Asfloat := StrToFloat(idbeneficiario);
  qryEnderecos.Open;

  qryTelefones.Insert;
  chkTelComercial.Checked       := False;
  chkTelParticular.Checked     := False;
  chkTelFax.Checked         := False;
  chkTelCelular.Checked        := False;
  chkTelRecado.Checked := False;
end;

procedure TfrmAtend.tbbAltTelefoneClick(Sender: TObject);
var
iLoopTel : integer;
begin
  inherited;
  chkTelComercial.Checked  := False;
  chkTelParticular.Checked     := False;
  chkTelFax.Checked  := False;
  chkTelCelular.Checked := False;
  chkTelRecado.Checked := False;
   if qrytelefones.FieldByName('TIPO').AsString <> ''  then
   begin
        for iLoopTel := 1 to 5 Do Begin
               if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'C' Then
                 chktelcomercial.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'P' Then
             chktelparticular.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'F' Then
             chktelfax.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'L' Then
             chktelcelular.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'R' Then
             chktelrecado.Checked := True
        end;
      end;
 
  dbGTELEFONES.SendToBack;
  qryTELEFONES.edit;
end;

procedure TfrmAtend.tbbExcTelefoneClick(Sender: TObject);
var
iLoopTel : integer;
begin
  inherited;
 chkTelComercial.Checked  := False;
  chkTelParticular.Checked     := False;
  chkTelFax.Checked  := False;
  chkTelCelular.Checked := False;
  chkTelRecado.Checked := False;
   if qrytelefones.FieldByName('TIPO').AsString <> ''  then
   begin
        for iLoopTel := 1 to 5 Do Begin
               if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'C' Then
                 chktelcomercial.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'P' Then
             chktelparticular.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'F' Then
             chktelfax.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'L' Then
             chktelcelular.Checked := True
        end;
        for iLoopTel := 1 to 5 Do Begin
          if qrytelefones.FieldByName('TIPO').AsString[iLoopTel] = 'R' Then
             chktelrecado.Checked := True
        end;
      end;
  flgexcluir := 1;
  
  dbGTELEFONES.SendToBack;
  qryTELEFONES.edit;
end;

procedure TfrmAtend.tbbInsContaCorrenteClick(Sender: TObject);
begin
  inherited;
  flgexcluir := 0;
  dblkpcmbbanco.Enabled := True;
  dblkpcmbagencia.Enabled := True;
  dbgcontascorrente.SendToBack;
  rgrptipoconta.ItemIndex := -1;
  dbgrpContaPref.ItemIndex := -1;
  dbgrpcontaconj.ItemIndex := -1;
 qrycontacorrente.insert;
end;

procedure TfrmAtend.tbbAltContaCorrenteClick(Sender: TObject);
begin
  inherited;
  If qryagencia1.Active Then
           qryAgencia1.Close;
  qryagencia1.ParamByName('IdPESSOA').AsFloat := qrycontacorrente.FieldByName('IDAgencia').AsFloat;
  qryagencia1.Open;
  dblkpcmbagencia.Text        := QryAgencia1Nome.AsString;
  flgexcluir := 0;
 dblkpcmbbanco.Enabled := False;
 dblkpcmbagencia.Enabled := False;
 dbgcontascorrente.SendToBack;
 rgrptipoconta.ItemIndex := -1;
 dbgrpContaPref.ItemIndex := -1;
 dbgrpcontaconj.ItemIndex := -1;
 qrycontacorrente.edit;
 if qrycontacorrenteflgcontapref.AsFloat = 0   then
     dbgrpContaPref.ItemIndex := 0
 else
      dbgrpContaPref.ItemIndex := 1;

 if qrycontacorrenteFlgcontaconjunta.Asstring = 'N' then
     dbgrpcontaconj.ItemIndex := 0
 else
     dbgrpcontaconj.ItemIndex := 1;

 if qrycontacorrenteTipoconta.Asstring = '1' then
     rgrptipoconta.ItemIndex := 0;

 if qrycontacorrenteTipoconta.Asstring = '2' then
     rgrptipoconta.ItemIndex := 1;

 if qrycontacorrenteTipoconta.Asstring = '3' then
     rgrptipoconta.ItemIndex := 2;


end;

procedure TfrmAtend.tbbExcContaCorrenteClick(Sender: TObject);
begin
  inherited;
If qryagencia1.Active Then
           qryAgencia1.Close;
  qryagencia1.ParamByName('IdPESSOA').AsFloat := qrycontacorrente.FieldByName('IDAgencia').AsFloat;
  qryagencia1.Open;
  dblkpcmbagencia.Text        := QryAgencia1Nome.AsString;
  FLGEXCLUIR := 1;
 dblkpcmbbanco.Enabled := False;
 dblkpcmbagencia.Enabled := False;
 dbgcontascorrente.SendToBack;
 rgrptipoconta.ItemIndex := -1;
 dbgrpContaPref.ItemIndex := -1;
 dbgrpcontaconj.ItemIndex := -1;
 qrycontacorrente.edit;
 if qrycontacorrenteflgcontapref.AsFloat = 0   then
     dbgrpContaPref.ItemIndex := 0
 else
      dbgrpContaPref.ItemIndex := 1;

 if qrycontacorrenteFlgcontaconjunta.Asstring = 'N' then
     dbgrpcontaconj.ItemIndex := 0
 else
     dbgrpcontaconj.ItemIndex := 1;

 if qrycontacorrenteTipoconta.Asstring = '1' then
     rgrptipoconta.ItemIndex := 0;

 if qrycontacorrenteTipoconta.Asstring = '2' then
     rgrptipoconta.ItemIndex := 1;

 if qrycontacorrenteTipoconta.Asstring = '3' then
     rgrptipoconta.ItemIndex := 2;

end;

procedure TfrmAtend.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryEnderecos.Cancel;
  pnlEnderecos.SendToBack;
end;

procedure TfrmAtend.BitBtn2Click(Sender: TObject);
begin
  inherited;
  qryEnderecos.Cancel;
  pnlEnderecos.SendToBack;
end;

procedure TfrmAtend.BitBtn1Click(Sender: TObject);
var
idEndereco, idEndereco1 : double;
begin
//  inherited;

  if edLogradoro1.Text = ''  then
    begin
       MsgDlg('Favor informar o logradouro do Beneficiario!','Atenção',mtError,[mbOk],0);
       If edLogradoro1.CanFocus Then edLogradoro1.SetFocus;
       exit;
    end;

   if edbairro1.Text = ''  then
    begin
       MsgDlg('Favor informar o bairro do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
       If edbairro1.CanFocus Then edbairro1.SetFocus;
       exit;
    end;

   if edcep1.Text = ''  then
    begin
       MsgDlg('Favor informar o CEP do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
       If edcep1.CanFocus Then edcep1.SetFocus;
       exit;
    end;

   if dblkCidade1.LookupValue = ''  then
    begin
       MsgDlg('Favor informar a Cidade do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
        If dblkCidade1.CanFocus Then dblkCidade1.SetFocus;
       exit;
    end;

   if dblkEstado1.LookupValue = ''  then
    begin
       MsgDlg('Favor informar o Estado do endereço do solicitante!','Atenção',mtError,[mbOk],0);
       if dblkEstado1.CanFocus Then dblkEstado1.SetFocus;
       exit;
    end;

       With QryESTADO1 Do
    Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('CODESTADO1').AsSTRING := dblkestado1.LookupValue;
       Open;
     End;

  if  qryEnderecos.State = dsInsert  then
  begin
       idEndereco := LeultRegistro(NIL,'ENDPESS');
       idEndereco1 := idEndereco;
       qryINSENDERECO.ParamByName('IdEndereco').AsFloat := idEndereco;
       qryINSENDERECO.ParamByName('idPessoa').AsFloat :=  StrToFloat(idBeneficiario);
       qryINSENDERECO.ParamByName('Idcidades').AsFloat := qryCidadesIdcidades.AsFloat  ;
       qryINSENDERECO.ParamByName('Idpais').AsFloat  := 1 ;
       qryINSENDERECO.ParamByName('logradouro').AsString  :=  Edlogradoro1.text;
       qryINSENDERECO.ParamByName('numero').AsString :=  Ednumero1.text;
       qryINSENDERECO.ParamByName('complemento').AsString :=  Edcomplemento1.text;
       qryINSENDERECO.ParamByName('bairro').AsString :=  edbairro1.text;
       qryINSENDERECO.ParamByName('codestado').AsString :=  dblkestado1.text;
       qryINSENDERECO.ParamByName('cidade').AsString :=  dblkcidade1.text;
       qryINSENDERECO.ParamByName('cep').AsString :=  edcep1.text;
       qryinsENDERECO.execsql
    end ;
   if  ((qryEnderecos.State = dsEdit) AND (FLGEXCLUIR = 0)) then
  begin
       qryALTENDERECO.ParamByName('IdEndereco').AsFloat := qryEnderecosIdendereco.AsFloat;
       idEndereco1 :=  qryEnderecosIdendereco.AsFloat;
       qryALTENDERECO.ParamByName('idPessoa').AsFloat :=  StrToFloat(idBeneficiario);
       qryALTENDERECO.ParamByName('Idcidades').AsFloat := qryCidadesIdcidades.AsFloat;
       qryALTENDERECO.ParamByName('Idpais').AsFloat  := 1 ;
       qryALTENDERECO.ParamByName('logradouro').AsString  :=  Edlogradoro1.text;
       qryALTENDERECO.ParamByName('numero').AsString :=  Ednumero1.text;
       qryALTENDERECO.ParamByName('complemento').AsString :=  Edcomplemento1.text;
       qryALTENDERECO.ParamByName('bairro').AsString :=  edbairro1.text;
       qryALTENDERECO.ParamByName('codestado').AsString :=  dblkestado1.text;
       qryALTENDERECO.ParamByName('cidade').AsString :=  dblkcidade1.text;
       qryALTENDERECO.ParamByName('cep').AsString :=  edcep1.text;
       qryaltENDERECO.execsql ;
   end;
    if  FLGEXCLUIR = 1  then
  begin
        idEndereco1 :=  qryEnderecosIdendereco.AsFloat;
       qryexcENDERECO.ParamByName('IdEndereco').AsFloat := qryEnderecosIdendereco.AsFloat;
       qryexcENDERECO.execsql ;
   end;

    if  ((qryEnderecos.State = dsEdit) AND (FLGEXCLUIR = 0)) OR (qryEnderecos.State  = dsInsert) then
     begin
     if chkbxComercial.Checked then
     BEGIN
       QRYCOMERCIAL.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       QRYCOMERCIAL.ParamByName('IDENDCOMERCIAL').AsFloat :=  IdENDERECO1;
       QRYCOMERCIAL.EXECSQL
     END;


     if chkbxResidencial.Checked then
     BEGIN
        QRYRESIDENCIAL.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYRESIDENCIAL.ParamByName('IDENDRESIDENCIAL').AsFloat :=  IdENDERECO1;
        QRYRESIDENCIAL.EXECSQL;
     END ;


     if chkbxEntrega.Checked then
     BEGIN
        QRYENTREGA.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYENTREGA.ParamByName('IDENDENTREGA').AsFloat := IdENDERECO1;
        QRYENTREGA.EXECSQL;
     END;

     if chkbxCobranca.Checked then
     BEGIN
        QRYCOBRANCA.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYCOBRANCA.ParamByName('IDENDCOBRANCA').AsFloat := IdENDERECO1;
        QRYCOBRANCA.EXECSQL;
     END ;


     if chkbxCorrespondencia.Checked then
     BEGIN
        QRYCORRESP.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYCORRESP.ParamByName('IDENDCORRESP').Asfloat := IdENDERECO1;
        QRYCORRESP.EXECSQL;
     END ;
     END
     ELSE
     BEGIN
      if chkbxComercial.Checked then
     BEGIN
       QRYCOMERCIAL.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       QRYCOMERCIAL.ParamByName('IDENDCOMERCIAL').CLEAR;
       QRYCOMERCIAL.EXECSQL
     END;

     if chkbxResidencial.Checked then
      BEGIN
        QRYRESIDENCIAL.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYRESIDENCIAL.ParamByName('IDENDRESIDENCIAL').CLEAR;
        QRYRESIDENCIAL.EXECSQL;
     END;

     if chkbxEntrega.Checked then
     BEGIN
        QRYENTREGA.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYENTREGA.ParamByName('IDENDENTREGA').CLEAR;;
        QRYENTREGA.EXECSQL;
     END;

     if chkbxCobranca.Checked then
      BEGIN
       QRYCOBRANCA.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYCOBRANCA.ParamByName('IDENDCOBRANCA').CLEAR;
        QRYCOBRANCA.EXECSQL;
     END;

     if chkbxCorrespondencia.Checked then
     BEGIN
        QRYCORRESP.ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
        QRYCORRESP.ParamByName('IDENDCORRESP').CLEAR;
        QRYCORRESP.EXECSQL;
     END;

  END;

      Fiario.IdPessoa := strtoint(idbeneficiario);
      Fiario.IdTitular := strtoint(idtitular);
      Fiario.Idusuario :=sistema.idusuario;
      Fiario.Idmodulo :=  19;
      Fiario.Idrubs := 0;
      Fiario.DataInclusao := Date;


       if  qryEnderecos.State = dsInsert  then
          BEGIN
           If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 3;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0 then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
             FIARIO.IDGRUPO := 1;
             Fiario.Descricao :=  'Inclusão do Endereço';
             Fiario.Inserir;
         END;

        if  ((qryEnderecos.State = dsEdit) and (flgexcluir = 0)) then
         begin
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 4;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0  then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
          Fiario.Descricao :=  'Alteração do Endereço';
          Fiario.Inserir;
       end;

        if  flgexcluir = 1 then
         begin
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 10;
            qrygrupo.Open ;
            If qryGrupoIdfiarass.Asinteger <>  0  then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
          Fiario.Descricao :=  'Exclusão de Endereço';
          Fiario.Inserir;
       end;


       With QryEnderecos Do
       Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       Open;
      End;
     flgexcluir := 0;
     pnlEnderecos.SendToBack;

end;

procedure TfrmAtend.tbsEnderecosShow(Sender: TObject);
begin
  inherited;
  if    idbeneficiario < '' then
   begin
   With QryEnderecos Do
    Begin
       If Active Then Close;
       If Not Prepared Then Prepare;
       ParamByName('idpessoa').Asfloat := strtofloat(idbeneficiario);
       Open;
     End;
   end;

  pnlEnderecos.SendToBack
end;

procedure TfrmAtend.btnTelOkClick(Sender: TObject);
  var
  tipo :string;
begin
//  inherited;
   if dblkLogradouro.LookupValue = ''  then
   begin
     MsgDlg('Favor informar a Cidade do endereço do Beneficiario!','Atenção',mtError,[mbOk],0);
     if dblkLogradouro.CanFocus then
       dblkLogradouro.SetFocus;
     Exit;
   end;

   if edtTelDDD.Text = '' then
   begin
     MsgDlg('Favor informar o Número do DDD!', 'Atenção',mtError,[mbOk],0);
     if edtTelDDD.CanFocus then
       edtTelDDD.SetFocus;
     Exit;
   end;
   if edtTelNumeroTelefone.Text = '' then
   begin
     MsgDlg('Favor informar o Número do Telefone!', 'Atenção',mtError,[mbOk],0);
     If edtTelNumeroTelefone.CanFocus then
       edtTelNumeroTelefone.SetFocus;
     exit;
   end;
   tipo := '';
  if chkTelComercial.Checked  = true then
       tipo :=tipo+'C';
  if chkTelParticular.Checked  = true then
       tipo :=tipo+'P';
  if chkTelFax.Checked = true then
       tipo :=tipo+'F';
  if chkTelCelular.Checked = true then
      tipo :=tipo+'L';
  if chkTelRecado.Checked = true  then
      tipo :=tipo+'R';

  if qryTelefones.State = dsinsert then
   begin
     qryInsereTelefone.ParamByName('IDTELEFONE').AsFloat := LeUltRegistro(nil, 'TELENDPESS');
     qryInsereTelefone.ParamByName('IDENDERECO').AsFloat := qryEnderecosIDENDERECO.AsFloat;
     qryInsereTelefone.ParamByName('DDI').Asstring          := edtTelDDI.Text;
     qryInsereTelefone.ParamByName('DDD').Asstring          := edtTelDDD.Text;
     qryInsereTelefone.ParamByName('TIPO').Asstring         := tipo;
     qryInsereTelefone.ParamByName('NUMERO').Asstring       := edtTelNumeroTelefone.Text;
     qryInsereTelefone.ExecSQL;
   end;

  if (qryTelefones.State = dsEdit) and (flgexcluir = 0) then
   begin
       qryAlteraTelefone.ParamByName('IDTELEFONE').AsFloat := qryTelefonesidTelefone.AsFloat;
     qryAlteraTelefone.ParamByName('IDENDERECO').AsFloat := qryTelefonesIDENDERECO.AsFloat;
     qryAlteraTelefone.ParamByName('DDI').Asstring          := edtTelDDI.Text;
     qryAlteraTelefone.ParamByName('DDD').Asstring          := edtTelDDD.Text;
     qryAlteraTelefone.ParamByName('TIPO').Asstring         :=  tipo;
     qryAlteraTelefone.ParamByName('NUMERO').Asstring      := edtTelNumeroTelefone.Text;
     qryAlteraTelefone.ExecSQL;
   end;

    if  flgexcluir = 1  then
   begin
    qryexctelefone.ParamByName('IDTELEFONE').AsFloat := qryTelefonesidTelefone.AsFloat;
    qryexctelefone.ExecSQL;
   end;




      Fiario.IdPessoa := strtoint(idbeneficiario);
      Fiario.IdTitular := strtoint(idtitular);
      Fiario.Idusuario :=sistema.idusuario;
      Fiario.Idmodulo :=  19;
      Fiario.Idrubs := 0;
      Fiario.DataInclusao := Date;


       if  qryTelefones.State = dsInsert  then
          BEGIN
             If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 5;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0 then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
             Fiario.Descricao :=  'Inclusão dO Telefone';
             Fiario.Inserir;
         END;
       if  (qryTelefones.State = dsEDIT) AND (FLGEXCLUIR = 0)  then
          BEGIN
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 6;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0 then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
          Fiario.Descricao :=  'Alteração do Telefone';
          Fiario.Inserir;
         END;
       if   FLGEXCLUIR = 1  then
          BEGIN
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 11;
            qrygrupo.Open ;
            If qryGrupoIdfiarass.Asinteger <> 0  then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
          Fiario.Descricao :=  'Exclusão  do Telefone';
          Fiario.Inserir;
       END;
    If qryTelefones.Active Then qryTelefones.Close;
    qryTelefones.ParamByName('IDPESSOA').AsInteger := qryEnderecos.FieldByName('IDPESSOA').AsInteger;
    qryTelefones.Open;
  flgexcluir := 0;
  pnlcadTelefones.SendToBack;



end;

procedure TfrmAtend.btnTelCancelarClick(Sender: TObject);
begin
  inherited;
  qryTelefones.Cancel;
  pnlcadtelefones.SendToBack;
end;

procedure TfrmAtend.btnTelVoltarClick(Sender: TObject);
begin
  inherited;
  qryTelefones.Cancel;
  pnlTelefones.SendToBack;
end;

procedure TfrmAtend.tbsTelefonesShow(Sender: TObject);
begin
  inherited;
  pnlcadTelefones.SendToBack;
  if idbeneficiario <> '' then
    begin
   If qryTelefones.Active Then
      qryTelefones.Close;
      qryTelefones.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
      qryTelefones.Open;
  end;
end;

procedure TfrmAtend.BitBtn7Click(Sender: TObject);
VAR
FLGCONTACONJ : STRING;
TIPOCONTA : INTEGER;

begin

  inherited;
if flgexcluir = 0 then
     begin
   if dblkpcmbagencia.text = '' then
        begin
     MsgDlg('Favor informar a Agencia Bancaria!','Atenção',mtError,[mbOk],0);
     if dblkpcmbagencia.CanFocus then
       dblkpcmbagencia.SetFocus;
     Exit;
   end;
   if (rgrptipoconta.ItemIndex = -1)     then
       begin
     MsgDlg('Favor informar o Tipo de Conta!','Atenção',mtError,[mbOk],0);
     if rgrptipoconta.CanFocus then
       rgrptipoconta.SetFocus;
     Exit;
   end;

    if (dbgrpContaPref.ItemIndex = -1)     then
       begin
     MsgDlg('Favor informar a Conta Preferencial!','Atenção',mtError,[mbOk],0);
     if dbgrpContaPref.CanFocus then
       dbgrpContaPref.SetFocus;
     Exit;
   end;

    if (dbgrpcontaconj.ItemIndex = -1)     then
       begin
     MsgDlg('Favor informar a Caracteristica de Conta!','Atenção',mtError,[mbOk],0);
     if dbgrpcontaconj.CanFocus then
        dbgrpcontaconj.SetFocus;
     Exit;
 end;


   if (rgrptipoconta.ItemIndex = 0)     then
       TIPOCONTA := 1;
   if (rgrptipoconta.ItemIndex = 1)     then
       TIPOCONTA := 2;
   if (rgrptipoconta.ItemIndex = 2)     then
       TIPOCONTA := 3;

    if dbgrpcontaconj.itemIndex = 0 then
     FLGCONTACONJ := 'N'
  else
      FLGCONTACONJ := 'S';

     try
     CalculaDv := TCalcDv.Create;
     CalculaDV.TipoConta  := TIPOCONTA;
     if not CalculaDV.ValidaConta(QryBancoNumBanco.Asstring,
                                  QryAgenciaNumAgencia.Asstring,
                                  dbedContaBancaria.Text,
                                  True)
     then
       begin
         Exit;
       end;
  finally
     CalculaDv.Free;
  end;


   if (dbgrpContaPref.ItemIndex = 1)  then
  begin
     if JaExistePreferencial then
     begin
       MsgDlg('Já existe outra conta indicada como "Conta Preferencial". Verifique.', 'Erro',mtError,[mbOk],0);
       dbgrpContaPref.ItemIndex := 0;
        if dbgrpContaPref.CanFocus then
       dbgrpContaPref.SetFocus;
       Exit;
     end;
  end;
end;

 if qrycontacorrente.State = dsinsert then
    begin
     qryinscontacorrente.ParambyName('IDCBANCARIA').Asfloat  :=  LeUltRegistro(nil, 'CONTABANCARIA');
     qryinscontacorrente.ParambyName('CONTACORRENTE').AsString :=  DBEDCONTABANCARIA.TEXT;
     qryinscontacorrente.ParambyName('IDPESSOA').Asfloat  :=  StrToFloat(idbeneficiario);
     qryinscontacorrente.ParambyName('TIPOCONTA').AsString := INTTOSTR(TIPOCONTA);
     qryinscontacorrente.ParambyName('FLGCONTAPREF').Asfloat :=  dbgrpcontapref.ItemIndex ;
     qryinscontacorrente.ParambyName('IDAGENCIA').Asfloat := qryAgenciaIdPessoa.ASFloat  ;
     qryinscontacorrente.ParambyName('FLGCONTACONJUNTA').AsString :=  FLGCONTACONJ;
     qryinscontacorrente.ExecSQL;
    end;

  if (qrycontaCorrente.State = dsEdit) AND (FLGEXCLUIR = 0) then
    begin
     qryaltcontacorrente.ParambyName('IDCBANCARIA').Asfloat  :=  QRYCONTACORRENTEIDCBANCARIA.AsFloat;
     qryaltcontacorrente.ParambyName('CONTACORRENTE').AsString :=  DBEDCONTABANCARIA.TEXT;
     qryaltcontacorrente.ParambyName('IDPESSOA').Asfloat  :=  StrToFloat(idbeneficiario);
     qryaltcontacorrente.ParambyName('TIPOCONTA').AsString := INTTOSTR(TIPOCONTA);
     qryaltcontacorrente.ParambyName('FLGCONTAPREF').Asfloat :=  dbgrpcontapref.ItemIndex ;
     qryaltcontacorrente.ParambyName('IDAGENCIA').Asfloat := qryAgencia1IdPessoa.ASFloat  ;
     qryaltcontacorrente.ParambyName('FLGCONTACONJUNTA').AsString :=  FLGCONTACONJ;
     qryaltcontacorrente.ExecSQL;
    end;

  if FLGEXCLUIR = 1 then
    begin
     qryexccontacorrente.ParambyName('IDCBANCARIA').Asfloat  :=  QRYCONTACORRENTEIDCBANCARIA.AsFloat;
     qryexccontacorrente.ExecSQL;
    end;


    Fiario.IdPessoa := strtoint(idbeneficiario);
    Fiario.IdTitular := strtoint(idtitular);
    Fiario.Idusuario :=sistema.idusuario;
    Fiario.Idmodulo :=  19;
    Fiario.Idrubs := 0;
    Fiario.DataInclusao := Date;


       if  qryContaCorrente.State = dsInsert  then
          BEGIN
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 7;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0  then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
             Fiario.Descricao :=  'Inclusão da ContaCorrente';
             Fiario.Inserir;
         end;


         if (qrycontaCorrente.State = dsEdit) AND (FLGEXCLUIR = 0) then
         begin
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 8;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0  then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
          Fiario.Descricao :=  'Alteração da ContaCorrente';
          Fiario.Inserir;
       end;

     if FLGEXCLUIR = 1 then
         begin
          If qrygrupo.Active then qrygrupo.Close;
            qrygrupo.ParamByName('IDPARAMGRUPO').AsFloat := 12;
            qrygrupo.Open ;
            If  qryGrupoIdfiarass.Asinteger <>  0  then
                FIARIO.IDGRUPO := qryGrupoIdfiarass.Asinteger
            else
                FIARIO.IDGRUPO := 1;
          Fiario.Descricao :=  'Exclusão  da ContaCorrente';
          Fiario.Inserir;
       end;
  If qrycontacorrente.Active Then
           qrycontacorrente.Close;
  qrycontacorrente.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
  qrycontacorrente.Open;
  FLGEXCLUIR := 0;
  pnlcontascorrentes.SendToBack;

end;

procedure TfrmAtend.BitBtn8Click(Sender: TObject);
begin
  inherited;
  qrycontacorrente.Cancel;
  pnlcontascorrentes.SendToBack;
end;

procedure TfrmAtend.BitBtn9Click(Sender: TObject);
begin
  inherited;
  qrycontacorrente.Cancel;
  pnlcontascorrentes.SendToBack;
end;

procedure TfrmAtend.tbsContaCorrenteShow(Sender: TObject);
begin
  inherited;
  pnlcontascorrentes.SendToBack;
  if idbeneficiario <> '' then
   begin
   If qrycontacorrente.Active Then
           qrycontacorrente.Close;
  qrycontacorrente.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
  qrycontacorrente.Open;
  end;
end;

procedure TfrmAtend.dblkpcmbBancoExit(Sender: TObject);
begin
  inherited;
If qryagencia.Active Then
           qryagencia.Close;
  qryagencia.ParamByName('pIdBanco').AsFloat := qrybancoidpessoa.AsFloat;
  qryagencia.Open;

end;


function TfrmAtend.JaExistePreferencial:boolean;

begin
  Result := False;
  If qrycontapreferencial.Active Then
           qrycontapreferencial.Close;
  qrycontapreferencial.ParamByName('IdPESSOA').AsFloat := StrToFloat(idbeneficiario);
  qrycontapreferencial.Open;
  While not qrycontapreferencial.EOF do
  begin
    if (qrycontapreferencial.FieldByName('FLGCONTAPREF').AsFloat = 1)  AND
       (qrycontacorrenteidcbancaria.AsFloat <> qrycontapreferencial.FieldByName('IdCBancaria').AsFloat) then
    begin
      Result := True;
      break;
    end;
    qrycontapreferencial.Next;
  end;
end;



procedure TfrmAtend.TbShtDocsXBenefShow(Sender: TObject);
begin
  inherited;

  
end;


// Inicio Andre Tavares 21/01/2002
procedure TfrmAtend.PageDadosAssuntoEnter(Sender: TObject);
begin
  inherited;
  QryGrupoAssunto.Close;
  QryGrupoAssunto.Prepare;
  QryGrupoAssunto.Open;
end;

procedure TfrmAtend.DBLkGrupoAssuntoChange(Sender: TObject);
begin
  inherited;
  DBLKAssunto.Enabled := DBLkGrupoAssunto.Text <> '';
  if DBLkGrupoAssunto.Text <> '' then
  begin
    QryAssunto.Close;
    QryAssunto.Sql.clear;

  If CkbFiltraPlano.Checked Then
  begin
    QryAssunto.SQL.Add('select distinct(a.IDASSUNTO), a.NOME, a.IDCONFIGRUBS, a.IDTIPOPROCESSO  from assunto a, PLANPREV p where (a.idgrupoassunto = :idgrupoassunto) '
                     + 'and (a.IDPLANOPREV = p.IDPLANOPREV) '+
                       'and (a.IDPLANOPREV = ' + DtmAtend.qryplanprev.FieldByName('idplanoprev').AsString + ' OR a.IDPLANOPREV IS NULL)' + ' order by a.nome ');
  end
  else
  begin
    QryAssunto.SQL.Add('select a.IDASSUNTO, a.NOME, a.IDCONFIGRUBS, a.IDTIPOPROCESSO  from assunto a, PLANPREV p where (a.idgrupoassunto = :idgrupoassunto) '
                     + 'and (a.IDPLANOPREV = p.IDPLANOPREV) order by a.nome');
  end;

    QryAssunto.paramByName('IdGrupoAssunto').AsFloat := strToFloat(DBLkGrupoAssunto.LookUpValue);
    QryAssunto.Prepare;
    QryAssunto.Open;
  end;
end;


// FIM Andre Tavares 21/01/2002


procedure TfrmAtend.DBLKAssuntoChange(Sender: TObject);
begin
  inherited;
  ProcuraAssuntoApertouBotao(sender);
end;

end.





