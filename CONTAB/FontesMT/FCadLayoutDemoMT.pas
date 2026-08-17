unit FCadLayoutDemoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  ComCtrls, wwdbedit, Mask, Wwdotdot, Wwdbcomb, wwdblook, ppEndUsr, ppDB,
  ppDBPipe, ppDBBDE, ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd,
  ppReport,uCtrlDesenhoDemo, uCtrlDemonstrativo, Menus,
  uCMTypes;


type
  TfrmCadLayoutDemoMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dblkDemo: TwwDBLookupCombo;
    Label4: TLabel;
    dbcboTipo: TwwDBComboBox;
    Label2: TLabel;
    dbeNome: TwwDBEdit;
    btnDesenho: TBitBtn;
    Bevel1: TBevel;
    Label3: TLabel;
    memLog: TRichEdit;
    RptCM: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppRelatorio: TppBDEPipeline;
    ppRelatorioppField1: TppField;
    ppRelatorioppField2: TppField;
    ppRelatorioppField3: TppField;
    ppRelatorioppField4: TppField;
    ppRelatorioppField5: TppField;
    ppRelatorioppField6: TppField;
    DsgnCM: TppDesigner;
    pplDemoColMes: TppBDEPipeline;
    pplDemoBalPatr: TppBDEPipeline;
    pplDemoBalPatrppField1: TppField;
    pplDemoBalPatrppField2: TppField;
    pplDemoBalPatrppField3: TppField;
    pplDemoBalPatrppField4: TppField;
    pplDemoBalPatrppField5: TppField;
    pplDemoBalPatrppField6: TppField;
    pplDemoBalPatrppField7: TppField;
    pplDemoBalPatrppField8: TppField;
    pplDemoBalPatrppField9: TppField;
    pplDemoBalPatrppField10: TppField;
    pplDemoBalPatrppField11: TppField;
    pplDemoBalPatrppField12: TppField;
    pplDemoBalPatrppField13: TppField;
    pplDemoBalPatrppField14: TppField;
    pplDemoBalPatrppField15: TppField;
    pplDemoBalPatrppField16: TppField;
    pplDemoBalPatrppField17: TppField;
    pplDemoBalPatrppField18: TppField;
    pplDemoBalPatrppField19: TppField;
    pplDemoBalPatrppField20: TppField;
    pplDemoBalPatrppField21: TppField;
    pplDemoBalPatrppField22: TppField;
    pplDemoBalPatrppField23: TppField;
    pplDemoBalPatrppField24: TppField;
    pplDemoBalPatrppField25: TppField;
    pplDemoBalPatrppField26: TppField;
    pplDemoBalPatrppField27: TppField;
    pplDemoBalPatrppField28: TppField;
    pplDemoBalPatrppField29: TppField;
    pplDemoBalPatrppField30: TppField;
    pplDemoBalPatrppField31: TppField;
    pplDemoBalPatrppField32: TppField;
    pplDemoBalPatrppField33: TppField;
    pplDemoBalPatrppField34: TppField;
    pplDemoBalPatrppField35: TppField;
    pplDemoBalPatrppField36: TppField;
    pplDemoBalPatrppField37: TppField;
    pplDemoBalPatrppField38: TppField;
    pplDemoBalPatrppField39: TppField;
    pplDemoBalPatrppField40: TppField;
    pplDemoBalPatrppField41: TppField;
    pplDemoBalPatrppField42: TppField;
    pplDemoBalPatrppField43: TppField;
    pplDemoBalPatrppField44: TppField;
    pplDemoBalPatrppField45: TppField;
    pplDemoBalPatrppField46: TppField;
    pplDemoBalPatrppField47: TppField;
    pplDemoBalPatrppField48: TppField;
    pplDemoBalPatrppField49: TppField;
    pplDemoBalPatrppField50: TppField;
    pplDemoBalPatrppField51: TppField;
    pplDemoBalPatrppField52: TppField;
    pplDemoBalPatrppField53: TppField;
    pplDemoBalPatrppField54: TppField;
    pplDemoBalPatrppField55: TppField;
    pplDemoBalPatrppField56: TppField;
    pplDemoBalPatrppField57: TppField;
    pplDemoBalPatrppField58: TppField;
    pplDemoBalPatrppField59: TppField;
    pplDemoBalPatrppField60: TppField;
    pplDemoBalPatrppField61: TppField;
    pplDemoBalPatrppField62: TppField;
    pplDemoBalPatrppField63: TppField;
    pplDemoBalPatrppField64: TppField;
    pplDemoBalPatrppField65: TppField;
    pplDemoBalPatrppField66: TppField;
    pplDemoBalPatrppField67: TppField;
    pplDemoBalPatrppField68: TppField;
    pplDemoBalPatrppField69: TppField;
    pplDemoBalPatrppField70: TppField;
    pplDemoBalPatrppField71: TppField;
    pplDemoBalPatrppField72: TppField;
    pplDemoBalPatrppField73: TppField;
    pplDemoBalPatrppField74: TppField;
    pplDemoBalPatrppField75: TppField;
    pplDemoBalPatrppField76: TppField;
    pplDemoBalPatrppField77: TppField;
    pplDemoBalPatrppField78: TppField;
    pplDemoBalPatrppField79: TppField;
    pplDemoBalPatrppField80: TppField;
    pplDemoBalPatrppField81: TppField;
    pplDemoBalPatrppField82: TppField;
    pplDemoBalPatrppField83: TppField;
    pplDemoBalPatrppField84: TppField;
    pplDemoBalPatrppField85: TppField;
    pplDemoBalPatrppField86: TppField;
    pplDemoBalPatrppField87: TppField;
    pplDemoBalPatrppField88: TppField;
    pplDemoBalPatrppField89: TppField;
    pplDemoBalPatrppField90: TppField;
    pplDemoBalPatrppField91: TppField;
    pplDemoBalPatrppField92: TppField;
    pplDemoBalPatrppField93: TppField;
    pplDemoBalPatrppField94: TppField;
    pplDemoBalPatrppField95: TppField;
    pplDemoBalPatrppField96: TppField;
    pplDemoBalPatrppField97: TppField;
    pplDemoBalPatrppField98: TppField;
    pplDemoBalPatrppField99: TppField;
    pplDemoBalPatrppField100: TppField;
    pplDemoBalPatrppField101: TppField;
    pplDemoBalPatrppField102: TppField;
    pplDemoBalPatrppField103: TppField;
    pplDemoBalPatrppField104: TppField;
    pplDemoBalPatrppField105: TppField;
    pplDemoBalPatrppField106: TppField;
    pplDemoBalPatrppField107: TppField;
    pplDemoBalPatrppField108: TppField;
    pplDemoBalPatrppField109: TppField;
    pplDemoBalPatrppField110: TppField;
    pplDemoBalPatrppField111: TppField;
    pplDemoBalPatrppField112: TppField;
    pplDemoBalPatrppField113: TppField;
    pplDemoBalPatrppField114: TppField;
    pplDemoBalPatrppField115: TppField;
    pplDemoBalPatrppField116: TppField;
    pplDemoBalPatrppField117: TppField;
    pplDemoBalPatrppField118: TppField;
    pplDemoBalPatrppField119: TppField;
    pplDemoBalPatrppField120: TppField;
    pplDemoBalPatrppField121: TppField;
    pplDemoBalPatrppField122: TppField;
    pplDemoBalPatrppField123: TppField;
    pplDemoBalPatrppField124: TppField;
    pplDemoBalPatrppField125: TppField;
    pplDemoBalPatrppField126: TppField;
    pplDemoBalPatrppField127: TppField;
    pplDemoBalPatrppField128: TppField;
    pplDemoBalPatrppField129: TppField;
    pplDemoBalPatrppField130: TppField;
    pplDemoBalPatrppField131: TppField;
    pplDemoBalPatrppField132: TppField;
    pplDemoBalPatrppField133: TppField;
    pplDemoBalPatrppField134: TppField;
    pplDemoBalPatrppField135: TppField;
    pplDemoBalPatrppField136: TppField;
    pplDemoBalPatrppField137: TppField;
    pplDemoBalPatrppField138: TppField;
    pplDemoBalPatrppField139: TppField;
    pplDemoBalPatrppField140: TppField;
    pplDemoBalPatrppField141: TppField;
    pplDemoBalPatrppField142: TppField;
    pplDemoBalPatrppField143: TppField;
    pplDemoBalPatrppField144: TppField;
    pplDemoBalPatrppField145: TppField;
    pplDemoBalPatrppField146: TppField;
    pplDemoBalPatrppField147: TppField;
    pplDemoBalPatrppField148: TppField;
    pplDemoBalPatrppField149: TppField;
    pplDemoBalPatrppField150: TppField;
    pplDemoBalPatrppField151: TppField;
    pplDemoBalPatrppField152: TppField;
    pplDemoBalPatrppField153: TppField;
    pplDemoBalPatrppField154: TppField;
    pplDemoBalPatrppField155: TppField;
    pplDemoBalPatrppField156: TppField;
    pplDemoBalPatrppField157: TppField;
    pplDemoBalPatrppField158: TppField;
    pplDemoBalPatrppField159: TppField;
    pplDemoBalPatrppField160: TppField;
    pplDemoBalPatrppField161: TppField;
    pplDemoBalPatrppField162: TppField;
    pplDemoBalPatrppField163: TppField;
    pplDemoBalPatrppField164: TppField;
    pplDemoBalPatrppField165: TppField;
    pplDemoBalPatrppField166: TppField;
    pplDemoBalPatrppField167: TppField;
    pplDemoBalPatrppField168: TppField;
    pplDemoBalPatrppField169: TppField;
    pplDemoBalPatrppField170: TppField;
    pplDemoBalPatrppField171: TppField;
    pplDemoBalPatrppField172: TppField;
    pplDemoBalPatrppField173: TppField;
    pplDemoBalPatrppField174: TppField;
    pplDemoBalPatrppField175: TppField;
    pplDemoBalPatrppField176: TppField;
    pplDemoBalPatrppField177: TppField;
    pplDemoBalPatrppField178: TppField;
    pplDemoBalPatrppField179: TppField;
    pplDemoBalPatrppField180: TppField;
    pplDemoBalPatrppField181: TppField;
    pplDemoBalPatrppField182: TppField;
    pplDemoBalPatrppField183: TppField;
    pplDemoBalPatrppField184: TppField;
    pplDemoBalPatrppField185: TppField;
    pplDemoBalPatrppField186: TppField;
    pplDemoBalPatrppField187: TppField;
    pplDemoBalPatrppField188: TppField;
    pplDemoBalPatrppField189: TppField;
    pplDemoBalPatrppField190: TppField;
    pplDemoBalPatrppField191: TppField;
    pplDemoBalPatrppField192: TppField;
    pplDemoBalPatrppField193: TppField;
    pplDemoBalPatrppField194: TppField;
    pplDemoBalPatrppField195: TppField;
    pplDemoBalPatrppField196: TppField;
    pplDemoBalPatrppField197: TppField;
    pplDemoBalPatrppField198: TppField;
    pplDemoBalPatrppField199: TppField;
    pplDemoBalPatrppField200: TppField;
    pplDemoBalPatrppField201: TppField;
    pplDemoBalPatrppField202: TppField;
    pplDemoBalPatrppField203: TppField;
    pplDemoBalPatrppField204: TppField;
    pplDemoBalPatrppField205: TppField;
    pplDemoBalPatrppField206: TppField;
    pplDemoBalPatrppField207: TppField;
    pplDemoBalPatrppField208: TppField;
    pplDemoBalPatrppField209: TppField;
    pplDemoBalPatrppField210: TppField;
    pplDemoBalPatrppField211: TppField;
    pplDemoBalPatrppField212: TppField;
    pplDemoBalPatrppField213: TppField;
    pplDemoBalPatrppField214: TppField;
    pplDemoBalPatrppField215: TppField;
    pplDemoBalPatrppField216: TppField;
    pplDemoBalPatrppField217: TppField;
    pplDemoBalPatrppField218: TppField;
    pplDemoBalPatrppField219: TppField;
    pplDemoBalPatrppField220: TppField;
    pplDemoBalPatrppField221: TppField;
    pplDemoBalPatrppField222: TppField;
    pplDemoBalPatrppField223: TppField;
    pplDemoBalPatrppField224: TppField;
    pplDemoBalPatrppField225: TppField;
    pplDemoBalPatrppField226: TppField;
    pplDemoBalPatrppField227: TppField;
    pplDemoBalPatrppField228: TppField;
    pplDemoBalPatrppField229: TppField;
    pplDemoBalPatrppField230: TppField;
    pplDemoBalPatrppField231: TppField;
    pplDemoBalPatrppField232: TppField;
    pplDemoBalPatrppField233: TppField;
    pplDemoBalPatrppField234: TppField;
    pplDemoBalPatrppField235: TppField;
    pplDemoBalPatrppField236: TppField;
    pplDemoBalPatrppField237: TppField;
    pplDemoBalPatrppField238: TppField;
    pplDemoBalPatrppField239: TppField;
    pplDemoBalPatrppField240: TppField;
    pplDemoBalPatrppField241: TppField;
    pplDemoBalPatrppField242: TppField;
    pplDemoBalPatrppField243: TppField;
    pplDemoBalPatrppField244: TppField;
    pplDemoBalPatrppField245: TppField;
    pplDemoBalPatrppField246: TppField;
    pplDemoColunado: TppBDEPipeline;
    pplDemoColunadoppField1: TppField;
    pplDemoColunadoppField2: TppField;
    pplDemoColunadoppField3: TppField;
    pplDemoColunadoppField4: TppField;
    pplDemoColunadoppField5: TppField;
    pplDemoColunadoppField6: TppField;
    pplDemoColunadoppField7: TppField;
    pplDemoColunadoppField8: TppField;
    pplDemoColunadoppField9: TppField;
    pplDemoColunadoppField10: TppField;
    pplDemoColunadoppField11: TppField;
    pplDemoColunadoppField12: TppField;
    pplDemoColunadoppField13: TppField;
    pplDemoColunadoppField14: TppField;
    pplDemoColunadoppField15: TppField;
    pplDemoColunadoppField16: TppField;
    pplDemoColunadoppField17: TppField;
    pplDemoColunadoppField18: TppField;
    pplDemoColunadoppField19: TppField;
    pplDemoColunadoppField20: TppField;
    pplDemoColunadoppField21: TppField;
    pplDemoColunadoppField22: TppField;
    pplDemoColunadoppField23: TppField;
    pplDemoColunadoppField24: TppField;
    pplDemoColunadoppField25: TppField;
    pplDemoColunadoppField26: TppField;
    pplDemoColunadoppField27: TppField;
    pplDemoColunadoppField28: TppField;
    pplDemoColunadoppField29: TppField;
    pplDemoColunadoppField30: TppField;
    pplDemoColunadoppField31: TppField;
    pplDemoColunadoppField32: TppField;
    pplDemoColunadoppField33: TppField;
    pplDemoColunadoppField34: TppField;
    pplDemoColunadoppField35: TppField;
    pplDemoColunadoppField36: TppField;
    pplDemoColunadoppField37: TppField;
    pplDemoColunadoppField38: TppField;
    pplDemoColunadoppField39: TppField;
    pplDemoColunadoppField40: TppField;
    pplDemoColunadoppField41: TppField;
    pplDemoColunadoppField42: TppField;
    pplDemoColunadoppField43: TppField;
    pplDemoColunadoppField44: TppField;
    pplDemoColunadoppField45: TppField;
    pplDemoColunadoppField46: TppField;
    pplDemoColunadoppField47: TppField;
    pplDemoColunadoppField48: TppField;
    pplDemoColunadoppField49: TppField;
    pplDemoColunadoppField50: TppField;
    pplDemoColunadoppField51: TppField;
    pplDemoColunadoppField52: TppField;
    pplDemoColunadoppField53: TppField;
    pplDemoColunadoppField54: TppField;
    ppConsulta: TppBDEPipeline;
    ppConsultappField1: TppField;
    ppConsultappField2: TppField;
    ppConsultappField3: TppField;
    ppConsultappField4: TppField;
    ppConsultappField5: TppField;
    ppConsultappField6: TppField;
    ppConsultappField7: TppField;
    ppConsultappField8: TppField;
    ppConsultappField9: TppField;
    ppConsultappField10: TppField;
    ppConsultappField11: TppField;
    ppConsultappField12: TppField;
    ppConsultappField13: TppField;
    ppConsultappField14: TppField;
    ppConsultappField15: TppField;
    ppConsultappField16: TppField;
    ppConsultappField17: TppField;
    ppConsultappField18: TppField;
    ppConsultappField19: TppField;
    ppConsultappField20: TppField;
    ppConsultappField21: TppField;
    ppConsultappField22: TppField;
    ppConsultappField23: TppField;
    ppConsultappField24: TppField;
    ppConsultappField25: TppField;
    ppConsultappField26: TppField;
    ppConsultappField27: TppField;
    ppConsultappField28: TppField;
    ppConsultappField29: TppField;
    ppConsultappField30: TppField;
    ppConsultappField31: TppField;
    ppConsultappField32: TppField;
    ppConsultappField33: TppField;
    ppConsultappField34: TppField;
    ppConsultappField35: TppField;
    ppConsultappField36: TppField;
    ppConsultappField37: TppField;
    ppConsultappField38: TppField;
    ppConsultappField39: TppField;
    ppConsultappField40: TppField;
    ppConsultappField41: TppField;
    ppConsultappField42: TppField;
    ppConsultappField43: TppField;
    ppConsultappField44: TppField;
    ppConsultappField45: TppField;
    ppConsultappField46: TppField;
    ppConsultappField47: TppField;
    ppConsultappField48: TppField;
    ppConsultappField49: TppField;
    ppConsultappField50: TppField;
    ppConsultappField51: TppField;
    ppConsultappField52: TppField;
    ppConsultappField53: TppField;
    ppConsultappField54: TppField;
    ppConsultappField55: TppField;
    ppConsultappField56: TppField;
    ppConsultappField57: TppField;
    ppConsultappField58: TppField;
    ppConsultappField59: TppField;
    CdsDemonstrativo: TCMClientDataSet;
    CdsReports: TCMClientDataSet;
    DsConsulta: TwwDataSource;
    dsDemoBalPatr: TwwDataSource;
    dsDemoColunado: TwwDataSource;
    dsDemoColMes: TwwDataSource;
    CdsDemoNormal: TCMClientDataSet;
    CdsDemoColMes: TCMClientDataSet;
    CdsDemoBalPatr: TCMClientDataSet;
    CdsDemoColunado: TCMClientDataSet;
    MergeMenu: TMainMenu;
    mniFile: TMenuItem;
    mniFileSave: TMenuItem;
    mniFileLine3: TMenuItem;
    mniFilePageSetup: TMenuItem;
    mniFilePrintToFileSetup: TMenuItem;
    mniFileLine4: TMenuItem;
    mniFilePrint: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MnuRlatorio: TMenuItem;
    MnuTitulo: TMenuItem;
    MnuSumario: TMenuItem;
    N2: TMenuItem;
    MnuCabecalho: TMenuItem;
    MnuRodape: TMenuItem;
    N3: TMenuItem;
    MnuGrupos: TMenuItem;
    MnuLInha: TMenuItem;
    MnuRetrato: TMenuItem;
    MnuPaisagem: TMenuItem;
    N5: TMenuItem;
    MnuUnidades: TMenuItem;
    MnuPixelsTela: TMenuItem;
    MnuPixelsImpressora: TMenuItem;
    MnuPolegada: TMenuItem;
    MnuMilimetros: TMenuItem;
    MnuMMilimetros: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure btnDesenhoClick(Sender: TObject);

    procedure FazQueryDemoNormal;
    procedure FazQueryDemoColunado;
    procedure FazQueryDemoColMes;
    procedure FazQueryDemoBalPatr;
    procedure SetaPipeLine(sTipo: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
  private
    bCriaTemplate: Boolean;

    CtrlDesenhoDemo   : TCtrlDesenhoDemo;
    CtrlDemonstrativo : TCtrlDemonstrativo;
  public
    { Public declarations }
  end;

var
  frmCadLayoutDemoMT: TfrmCadLayoutDemoMT;
  ArqRel   : String;
implementation

uses uModeloRelatCM, UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema, uModulo;

{$R *.DFM}

procedure TfrmCadLayoutDemoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe Historico Contab ***
  CtrlDesenhoDemo := TCtrlDesenhoDemo.Create;
  CtrlDesenhoDemo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlDesenhoDemo.CdsDesenhoDemo := Cds;
  Cds.Data             := CtrlDesenhoDemo.ListDesenhoDemo(-1);

  CtrlDesenhoDemo.CdsReports := CdsReports;
  CdsReports.Data      := CtrlDesenhoDemo.ListReports(-1,-1);

  CdsDemoNormal.Data   := CtrlDesenhoDemo.ListCdsDemoNormal;
  CdsDemoColMes.Data   := CtrlDesenhoDemo.ListCdsDemoColMes;
  CdsDemoBalPatr.Data  := CtrlDesenhoDemo.ListCdsDemoBalPatr;
  CdsDemoColunado.Data := CtrlDesenhoDemo.ListCdsDemoColunado;

  // *** Instancia a classe demonstrativo ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsDemonstrativo.Data := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);


  // *** Adiciona o filtro por Empresa Proprietária no MontaSelect ***
  MontaSelect.Filtro.Add('DEMONSTRATIVO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  ModeloRelatCM := TModeloRelatCM.Create;


end;

procedure TfrmCadLayoutDemoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

   If Cds.State In [dsInsert,dsEdit] Then
   Begin

      If (dblkDemo.Text = '') Then
      Begin
         MsgDlg('Demonstrativo não selecionado.','Aviso',mtWarning,[mbOk],0);
         dblkDemo.SetFocus;
         accept:= False;
      End;

      If (dbcboTipo.Text = '') Then
      Begin
         MsgDlg('Tipo do Layout não informado.','Aviso',mtWarning,[mbOk],0);
         dbcboTipo.SetFocus;
         accept:= False;
      End;

      If (dbeNome.Text = '') Then
      Begin
         MsgDlg('Nome do Layout não informado.','Aviso',mtWarning,[mbOk],0);
         dbeNome.SetFocus;
         accept:= False;
      End;

      If Not FileExists(Sistema.TempDir + ArqCmDefault) Then
      Begin
        MsgDlg('Não foi definido o Desenho do Relatório','Atenção',MtInformation,[MbOk],0);
        btnDesenho.SetFocus;
        accept:= False;
      End;

      // *** Edita a tabela reports ***
      ArqRel := Sistema.TempDir + ArqCmDefault;

     // *** Edita o cds do reports antes de gravar ***
     cdsReports.Edit;
     cdsReports.FieldByName('ORIGEMCM').AsInteger := 0;
     cdsReports.FieldByName('NAME').AsString := 'TLayoutDemo';
     TBlobField(cdsReports.FieldByName('TEMPLATE')).LoadFromFile(ArqRel);
     cdsReports.Post;

   End;


end;

procedure TfrmCadLayoutDemoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
  Cds.Data := CtrlDesenhoDemo.ListDesenhoDemo(Cds.FieldByName('IDDESENHODEMO').asFloat);

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  CdsReports.Delete;
  Accept := CtrlDesenhoDemo.Apagar;
end;

procedure TfrmCadLayoutDemoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlDesenhoDemo.Gravar;

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlDesenhoDemo.Gravar;

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlDesenhoDemo.MessageInfo <> '' Then
     MsgDlg(CtrlDesenhoDemo.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

   If FileExists(Sistema.TempDir + ArqCmDefault) Then
      DeleteFile(Sistema.TempDir + ArqCmDefault);

   bCriaTemplate := True;

   CdsReports.Data := CtrlDesenhoDemo.ListReports(Cds.FieldByName('IDREPORTS').AsFloat,Cds.FieldByName('ORIGEMCM').AsInteger);
   dbcboTipo.Enabled := False;
   if dblkDemo.canfocus then dblkDemo.SetFocus;

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  If MontaSelect.RetornouValor Then
  Begin
     Cds.Data := CtrlDesenhoDemo.ListDesenhoDemo(StrToFloat(MontaSelect.ValoresChave[0]));
     CdsReports.Data := CtrlDesenhoDemo.ListReports(Cds.FieldByName('IDREPORTS').AsFloat,Cds.FieldByName('ORIGEMCM').AsInteger);
  End;

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroInsert(Sender: TObject);
begin
   If FileExists(Sistema.TempDir + ArqCmDefault) Then
      DeleteFile(Sistema.TempDir + ArqCmDefault);

   inherited;
   dbcboTipo.Enabled := True;

   Cds.FieldByName('FLGTIPOLAYOUT').AsString  := '1';
   Cds.FieldByName('ORIGEMCM').AsInteger  := 0;
   bCriaTemplate := True;

end;

procedure TfrmCadLayoutDemoMT.btnDesenhoClick(Sender: TObject);
var sTipo : string;
begin
   inherited;

   sTipo := Cds.FieldByName('FLGTIPOLAYOUT').asString;

   Case sTipo[1] of
      '1': FazQueryDemoNormal;
      '2': FazQueryDemoColunado;
      '3': FazQueryDemoColMes;
      '4': FazQueryDemoBalPatr;
   Else Begin
          If (dbcboTipo.Text = '') Then
          Begin
            MsgDlg('Tipo do Layout não informado.','Aviso',mtWarning,[mbOk],0);
            dbcboTipo.SetFocus;
            Exit;
          End;
      End;
   End;

   SetaPipeLine(sTipo);

   Case CmeCadastro.Operacao of
      OpInserir:
         Begin
            If bCriaTemplate Then
            Begin
               Try
                  ModeloRelatCM.CmDefault.SaveToFile(Sistema.TempDir + ArqCmDefault);
               Finally
                  bCriaTemplate := False;
               End;
            End;
         End;
      OpAlterar:
         Begin
            If bCriaTemplate Then
            Begin
               TBlobField(CdsReports.FieldByName('TEMPLATE')).SaveToFile(Sistema.TempDir + ArqCmDefault);
               bCriaTemplate := False;
            End;
         End;
   End;

   RptCM.Template.LoadFromFile;

   SetaPipeLine(sTipo);

   DsgnCM.ShowModal;

   RptCM.Reset;
   RptCM.ResetDevices;

end;

procedure TfrmCadLayoutDemoMT.SetaPipeLine(sTipo:String);
begin
   case sTipo[1] of
      '1':
           begin
              ModeloRelatCM.SetaDadosRpt(RptCm,ppConsulta,ArqCmDefault);
              RptCM.DataPipeline := ppConsulta;
           end;
      '2':
           begin
              ModeloRelatCM.SetaDadosRpt(RptCm,pplDemoColunado,ArqCmDefault);
              RptCM.DataPipeline := pplDemoColunado;
           end;
      '3':
           begin
              ModeloRelatCM.SetaDadosRpt(RptCm,pplDemoColMes,ArqCmDefault);
              RptCM.DataPipeline := pplDemoColMes;
           end;
      '4':
           begin
              ModeloRelatCM.SetaDadosRpt(RptCm,pplDemoBalPatr,ArqCmDefault);
              RptCM.DataPipeline := pplDemoBalPatr;
           end;
   end;
end;

procedure TfrmCadLayoutDemoMT.FazQueryDemoBalPatr;
begin
   RptCM.DataPipeline := pplDemoBalPatr;
end;

procedure TfrmCadLayoutDemoMT.FazQueryDemoNormal;
begin
  RptCM.DataPipeline := ppConsulta;
end;

procedure TfrmCadLayoutDemoMT.FazQueryDemoColunado;
begin
   RptCM.DataPipeline := pplDemoColunado;
end;

procedure TfrmCadLayoutDemoMT.FazQueryDemoColMes;
begin
   RptCM.DataPipeline := pplDemoColMes;
end;

procedure TfrmCadLayoutDemoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDesenhoDemo.Free;
  CtrlDemonstrativo.Free;

  ModeloRelatCM.Free;

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlDesenhoDemo.ListDesenhoDemo(-1);
  CdsReports.Data := CtrlDesenhoDemo.ListReports(-1,-1);

end;

procedure TfrmCadLayoutDemoMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  If FileExists(Sistema.TempDir + ArqCmDefault) Then
     DeleteFile(Sistema.TempDir + ArqCmDefault);

end;

end.
