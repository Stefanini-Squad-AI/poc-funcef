{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendência   : 27394
Responsável : Daniel Simões
Data        : 14/02/2008
Descrição   : Alteração/Implementação do número do Help Context...
--------------------------------------------------------------------------------
Pendência   : 26461
Responsável : Daniel Simões
Data        : 22/11/2007
Descrição   : Passa a calcular os valores de Juros, Multa e Correção pela
             'CtrlParamMulta' iserida no Cadastro de Contratos de Locação...
--------------------------------------------------------------------------------
Pendência   : 26597
Responsável : Gustavo Mendes
Data        : 11/10/2007
Descrição   : Alteração para que os dados de Multas, Juros e Correção serem
              exibidos conforme parametrizado na CONTRATOXMULTA.
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit fConsultaInadimplencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelarImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlInadimplencia, Db, DBClient,
  uCMClientDataSet, Grids, Wwdbigrd, Wwdbgrid, Provider, DBTables,
  CmParamReport, TB97Ctls, ImgList, ComCtrls, uCtrlContratoImovel,
  uCtrlEventoImovel, JCLSysUtils, wwdbdatetimepicker, Mask, wwdbedit,
  Wwdbspin, TB97Tlwn, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppPrnabl,
  ppClass, ppCtrls, ppBands, ppCache, ppProd, ppReport, ppStrtch, ppSubRpt,
  ppModule, raCodMod, ppMemo, ppVar, fPreview, Menus, uCmSqlParams, uCtrlParamMulta;

type
  TfrmConsultaInadimplencia = class(TFrmOkCancelarImob)
    cdsContratos: TCMClientDataSet;
    dtsContratos: TDataSource;
    cdsContratosIDCONTRATOIMOVEL: TFloatField;
    cdsContratosCONNUMERO: TStringField;
    cdsContratosCONNOME: TStringField;
    cdsContratosLOCATARIO: TStringField;
    cdsContratosCONDATAINICIO: TDateTimeField;
    cdsContratosCONDATAFIM: TDateTimeField;
    cdsContratosFLGTIPOCONTRATO: TStringField;
    cdsContratosDSCTIPOCONTRATO: TStringField;
    cdsContratosCONVLRMULTA: TFloatField;
    cdsContratosCONMOEDAMULTA: TFloatField;
    cdsContratosCONVLRMORA: TFloatField;
    cdsContratosCONPERCENTMORA: TFloatField;
    cdsContratosCONMOEDAMORA: TFloatField;
    cdsContratosCONPERMORA: TStringField;
    cdsContratosCONDIASTOLERANCIA: TFloatField;
    cdsContratosCONDIASREPASSE: TFloatField;
    cdsContratosIDINDCORRECAO: TFloatField;
    cdsContratosFLGMORAPROPORC: TFloatField;
    cdsContratosIDCIDADES: TFloatField;
    cdsContratosIDPAIS: TFloatField;
    cdsContratosCODESTADO: TStringField;
    cdsContratosCONMESREFREAJUSTE: TStringField;
    cmprContrato: TCmParamReport;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    imgTitle: TImageList;
    pnlContratos: TPanel;
    dbgrdContrato: TwwDBGrid;
    pnlTopContratos: TPanel;
    pnlBottom: TPanel;
    pnlDocumento: TPanel;
    pnlTopDcomentos: TPanel;
    cdsImoveis: TCMClientDataSet;
    cdsImoveisIMONOME: TStringField;
    cdsImoveisIMOMESTRE: TStringField;
    dtsImoveis: TDataSource;
    pnlImoveis: TPanel;
    pnlTopImoveis: TPanel;
    dbgrdImovel: TwwDBGrid;
    Splitter: TSplitter;
    pgctrlDocumentos: TPageControl;
    tabDocumentos: TTabSheet;
    dbgrdDocumento: TwwDBGrid;
    tabHistorico: TTabSheet;
    cdsDocumentos: TCMClientDataSet;
    dtsDocumentos: TDataSource;
    cdsDocumentosIDCONTRATOIMOVEL: TFloatField;
    cdsDocumentosCODDOCUMENTO: TFloatField;
    cdsDocumentosNODOCUMENTO: TFloatField;
    cdsDocumentosDESCCUSTORECIMO: TStringField;
    cdsDocumentosDATAVENCTO: TDateTimeField;
    cdsDocumentosDATACALCULO: TDateTimeField;    
    cdsDocumentosCOMPETENCIA: TStringField;
    cdsDocumentosDIAS_ATRASO: TFloatField;
    cdsDocumentosVALOR_ORIGINAL: TFloatField;
    cdsDocumentosVALOR_RECEBIDO: TFloatField;
    cdsDocumentosDATAPAGTO: TDateTimeField;
    cdsDocumentosMULTA: TFloatField;
    cdsDocumentosJUROS: TFloatField;
    cdsDocumentosCORRECMONET: TFloatField;
    cdsDocumentosVALORATUAL: TFloatField;
    cdsDocumentosVALORDIVERGATUAL: TFloatField;
    cdsDocumentosFLGTIPOLANC: TFloatField;
    cdsContratosCONPERCENTMULTA: TFloatField;
    cdsDocumentosDATALIMITE: TDateTimeField;
    cdsContratosFLGTIPODIATOLERA: TStringField;
    cdsEventoImovel: TCMClientDataSet;
    dtsEventoImovel: TDataSource;
    cdsEventoImovelIDEVENTOIMOVEL: TFloatField;
    cdsEventoImovelIDIMOVEL: TFloatField;
    cdsEventoImovelIDCONTRATOIMOVEL: TFloatField;
    cdsEventoImovelIDUSUARIO: TFloatField;
    cdsEventoImovelIDCONTRATOLOJA: TFloatField;
    cdsEventoImovelEVIDATAPROX: TDateTimeField;
    cdsEventoImovelEVICABECALHO: TStringField;
    cdsEventoImovelEVIDESCRICAO: TMemoField;
    cdsEventoImovelEVIDATA: TDateTimeField;
    cdsEventoImovelFLGTIPOEVENTO: TStringField;
    cdsEventoImovelEVIPERCENT: TFloatField;
    cdsEventoImovelEVIINDICEREAJUSTE: TFloatField;
    cdsEventoImovelEVIVLRANTERIOR: TFloatField;
    cdsEventoImovelEVIVLRAJUSTADO: TFloatField;
    cdsEventoImovelCODDOCUMENTO: TFloatField;
    cdsEventoImovelFLGAVISO: TStringField;
    cdsEventoImovelDIASAVISO: TFloatField;
    cdsEventoImovelUSUARIO_EXTENSO: TStringField;
    cdsEventoImovelDSC_INDICE: TStringField;
    cdsEventoImovelGeraAviso: TStringField;
    pnlGridHistorico: TPanel;
    Dock973: TDock97;
    tb97BotoesDetalhe: TToolbar97;
    sbtnInsDet: TToolbarButton97;
    sbtnExcluiDet: TToolbarButton97;
    dbgrdHistorico: TwwDBGrid;
    twInsereEvento: TToolWindow97;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    pnlCadHistorico: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dtDataEvento: TwwDBDateTimePicker;
    edtCabecalho: TEdit;
    memDescricao: TMemo;
    cbGeraAviso: TCheckBox;
    spnedtDiasAnte: TwwDBSpinEdit;
    Bevel1: TBevel;
    cdsEventoImovelDescTipoEvento: TStringField;
    sbtnPrint: TToolbarButton97;
    twRelatorio: TToolWindow97;
    Panel4: TPanel;
    Image2: TImage;
    Panel5: TPanel;
    BitBtnOkPrint: TBitBtn;
    BitBtnCancelPrint: TBitBtn;
    Panel6: TPanel;
    Panel7: TPanel;
    cbImprimeHistorico: TCheckBox;
    pnlProcessoRel: TPanel;
    ProgressBar: TProgressBar;
    cdsContratosAux: TCMClientDataSet;
    cdsContratosAuxCONNUMERO: TStringField;
    cdsContratosAuxCONNOME: TStringField;
    cdsContratosAuxLOCATARIO: TStringField;
    cdsContratosAuxCONDATAINICIO: TDateTimeField;
    cdsContratosAuxCONDATAFIM: TDateTimeField;
    cdsContratosAuxDSCTIPOCONTRATO: TStringField;
    cdsContratosAuxIDCONTRATOIMOVEL: TFloatField;
    cdsContratosAuxFLGTIPOCONTRATO: TStringField;
    cdsContratosAuxCONVLRMULTA: TFloatField;
    cdsContratosAuxCONPERCENTMULTA: TFloatField;
    cdsContratosAuxCONMOEDAMULTA: TFloatField;
    cdsContratosAuxCONVLRMORA: TFloatField;
    cdsContratosAuxCONPERCENTMORA: TFloatField;
    cdsContratosAuxCONMOEDAMORA: TFloatField;
    cdsContratosAuxCONDIASTOLERANCIA: TFloatField;
    cdsContratosAuxCONDIASREPASSE: TFloatField;
    cdsContratosAuxIDINDCORRECAO: TFloatField;
    cdsContratosAuxFLGMORAPROPORC: TFloatField;
    cdsContratosAuxIDCIDADES: TFloatField;
    cdsContratosAuxIDPAIS: TFloatField;
    cdsContratosAuxCONPERMORA: TStringField;
    cdsContratosAuxCODESTADO: TStringField;
    cdsContratosAuxCONMESREFREAJUSTE: TStringField;
    cdsContratosAuxFLGTIPODIATOLERA: TStringField;
    ppContratos: TppBDEPipeline;
    dtsRelContratos: TDataSource;
    rptContratos: TppReport;
    cdsRelContratos: TCMClientDataSet;
    cdsRelContratosCONNUMERO: TStringField;
    cdsRelContratosCONNOME: TStringField;
    cdsRelContratosLOCATARIO: TStringField;
    cdsRelContratosCONDATAINICIO: TDateTimeField;
    cdsRelContratosCONDATAFIM: TDateTimeField;
    cdsRelContratosDSCTIPOCONTRATO: TStringField;
    cdsDocumentosAux: TCMClientDataSet;
    cdsDocumentosAuxCODDOCUMENTO: TFloatField;
    cdsDocumentosAuxIDPARCFINANCIMOV: TFloatField;
    cdsDocumentosAuxNODOCUMENTO: TFloatField;
    cdsDocumentosAuxDESCCUSTORECIMO: TStringField;
    cdsDocumentosAuxCOMPETENCIA: TStringField;
    cdsDocumentosAuxDATAVENCTO: TDateTimeField;
    cdsDocumentosAuxVALOR_ORIGINAL: TFloatField;
    cdsDocumentosAuxDIAS_ATRASO: TFloatField;
    cdsDocumentosAuxMULTA: TFloatField;
    cdsDocumentosAuxJUROS: TFloatField;
    cdsDocumentosAuxCORRECMONET: TFloatField;
    cdsDocumentosAuxVALORATUAL: TFloatField;
    cdsDocumentosAuxVALOR_RECEBIDO: TFloatField;
    cdsDocumentosAuxDATAPAGTO: TDateTimeField;
    cdsDocumentosAuxVALORDIVERGATUAL: TFloatField;
    cdsDocumentosAuxDATALIMITE: TDateTimeField;
    cdsDocumentosAuxIDCONTRATOIMOVEL: TFloatField;
    cdsDocumentosAuxFLGTIPOLANC: TFloatField;
    cdsRelContratosCODDOCUMENTO: TFloatField;
    cdsRelContratosCHAVE: TFloatField;
    cdsRelContratosNODOCUMENTO: TFloatField;
    cdsRelContratosDESCCUSTORECIMO: TStringField;
    cdsRelContratosCOMPETENCIA: TStringField;
    cdsRelContratosDATAVENCTO: TDateTimeField;
    cdsRelContratosDATACALCULO: TDateTimeField;
    cdsRelContratosVALOR_ORIGINAL: TFloatField;
    cdsRelContratosDIAS_ATRASO: TFloatField;
    cdsRelContratosMULTA: TFloatField;
    cdsRelContratosJUROS: TFloatField;
    cdsRelContratosCORRECMONET: TFloatField;
    cdsRelContratosVALORATUAL: TFloatField;
    cdsRelContratosVALOR_RECEBIDO: TFloatField;
    cdsRelContratosDATAPAGTO: TDateTimeField;
    cdsRelContratosVALORDIVERGATUAL: TFloatField;
    lblProcessoRel: TLabel;
    cdsEventoImovelAux: TCMClientDataSet;
    cdsEventoImovelAuxEVIDATA: TDateTimeField;
    cdsEventoImovelAuxEVICABECALHO: TStringField;
    cdsEventoImovelAuxEVIDESCRICAO: TMemoField;
    cdsEventoImovelAuxDescTipoEvento: TStringField;
    cdsEventoImovelAuxUSUARIO_EXTENSO: TStringField;
    cdsEventoImovelAuxGeraAviso: TStringField;
    cdsEventoImovelAuxDIASAVISO: TFloatField;
    cdsEventoImovelAuxFLGAVISO: TStringField;
    cdsEventoImovelAuxIDEVENTOIMOVEL: TFloatField;
    cdsEventoImovelAuxIDIMOVEL: TFloatField;
    cdsEventoImovelAuxIDCONTRATOIMOVEL: TFloatField;
    cdsEventoImovelAuxIDUSUARIO: TFloatField;
    cdsEventoImovelAuxIDCONTRATOLOJA: TFloatField;
    cdsEventoImovelAuxEVIDATAPROX: TDateTimeField;
    cdsEventoImovelAuxFLGTIPOEVENTO: TStringField;
    cdsEventoImovelAuxEVIPERCENT: TFloatField;
    cdsEventoImovelAuxEVIINDICEREAJUSTE: TFloatField;
    cdsEventoImovelAuxEVIVLRANTERIOR: TFloatField;
    cdsEventoImovelAuxEVIVLRAJUSTADO: TFloatField;
    cdsEventoImovelAuxCODDOCUMENTO: TFloatField;
    cdsEventoImovelAuxDSC_INDICE: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppdbHist: TppDetailBand;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    cdsRelContratosEVIDATA: TDateTimeField;
    cdsRelContratosEVICABECALHO: TStringField;
    cdsRelContratosEVIDESCRICAO: TMemoField;
    cdsRelContratosDESCTIPOEVENTO: TStringField;
    cdsRelContratosUSUARIO_EXTENSO: TStringField;
    cdsRelContratosGERAAVISO: TStringField;
    cdsRelContratosDIASAVISO: TFloatField;
    ppGroup2: TppGroup;
    ppdbCabHist: TppGroupHeaderBand;
    ppdbRodHist: TppGroupFooterBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLogoTipo: TppImage;
    pplblEmpresa: TppLabel;
    ppLabel14: TppLabel;
    pplblSistema: TppLabel;
    ppLine3: TppLine;
    ppOrcamentoSystemVariable8: TppSystemVariable;
    ppOrcamentoSystemVariable7: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppSob: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText11: TppDBText;
    ppLabel10: TppLabel;
    ppDBText12: TppDBText;
    ppLabel11: TppLabel;
    ppDBText13: TppDBText;
    ppLabel12: TppLabel;
    ppDBText14: TppDBText;
    ppLabel13: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppDBText16: TppDBText;
    ppLabel16: TppLabel;
    ppDBText17: TppDBText;
    ppLabel17: TppLabel;
    ppDBText18: TppDBText;
    ppLabel18: TppLabel;
    ppDBText19: TppDBText;
    ppLabel19: TppLabel;
    ppDBText20: TppDBText;
    ppLabel20: TppLabel;
    ppDBText21: TppDBText;
    ppDtEvento: TppLabel;
    ppCabEvento: TppLabel;
    ppLineTopEvento: TppLine;
    ppDescEvento: TppLabel;
    ppSub: TppLine;
    ppDBMemo1: TppDBMemo;
    cdsDocumentosAuxDATACALCULO: TDateTimeField;
    pmuContrato: TPopupMenu;
    mnuExibeContrato: TMenuItem;
    mnuExibeLocatario: TMenuItem;
    cdsContratosIDLOCATARIO: TFloatField;
    cdsDocumentosVALORDIVERG: TFloatField;
    cdsDocumentosAuxVALORDIVERG: TFloatField;
    cdsRelContratosVALORDIVERG: TFloatField;
    ppLabel2: TppLabel;
    ppDBText4: TppDBText;
    cdsDocumentosMULTADIF: TFloatField;
    cdsDocumentosJUROSDIF: TFloatField;
    cdsDocumentosCORRECMONETDIF: TFloatField;
    cdsDocumentosPROPORCAO: TFloatField;
    cdsDocumentosAuxMULTADIF: TFloatField;
    cdsDocumentosAuxJUROSDIF: TFloatField;
    cdsDocumentosAuxCORRECMONETDIF: TFloatField;
    cdsDocumentosAuxPROPORCAO: TFloatField;
    cdsRelContratosMULTADIF: TFloatField;
    cdsRelContratosJUROSDIF: TFloatField;
    cdsRelContratosCORRECMONETDIF: TFloatField;
    cdsRelContratosPROPORCAO: TFloatField;
    ppLabel7: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel23: TppLabel;
    ppDBText25: TppDBText;
    ppContratosppField33: TppField;
    pplDtCalculo: TppLabel;
    ppLabel24: TppLabel;
    ppLine1: TppLine;
    ppLabel25: TppLabel;
    ppDBText26: TppDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dbgrdContratoCalcTitleImage(Sender: TObject; Field: TField;
      var TitleImageAttributes: TwwTitleImageAttributes);
    procedure dbgrdContratoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dbgrdContratoRowChanged(Sender: TObject);
    procedure dbgrdContratoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsContratosBeforeInsert(DataSet: TDataSet);
    procedure pgctrlDocumentosChange(Sender: TObject);
    procedure cdsEventoImovelCalcFields(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure twInsereEventoClose(Sender: TObject);
    procedure cbGeraAvisoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgrdHistoricoRowChanged(Sender: TObject);
    procedure cdsEventoImovelBeforeInsert(DataSet: TDataSet);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure sbtnPrintClick(Sender: TObject);
    procedure BitBtnCancelPrintClick(Sender: TObject);
    procedure twRelatorioClose(Sender: TObject);
    procedure BitBtnOkPrintClick(Sender: TObject);
    procedure cdsDocumentosBeforeInsert(DataSet: TDataSet);
    procedure rptContratosBeforePrint(Sender: TObject);
    procedure ppdbCabHistBeforePrint(Sender: TObject);
    procedure mnuExibeContratoClick(Sender: TObject);
    procedure mnuExibeLocatarioClick(Sender: TObject);
    procedure dbgrdDocumentoDblClick(Sender: TObject);
  private
    CtrlInadimplencia  : TCtrlInadimplencia;
    CtrlContratoImovel : TCtrlContratoImovel;
    CtrlEventoImovel   : TCtrlEventoImovel;
    CtrlParamMulta     : TCtrlParamMulta;

    iOrdem : integer;

    procedure SelecionaContrato;

    procedure PreencheDocumentos( cdsDoc             : TCMClientDataSet;
                                  iIDCONTRATOIMOVEL  : integer;
                                  sFLGTIPOCONTRATO   : string;
                                  sCONMESREFREAJUSTE : string;
                                  iIDINDCORRECAO     : integer;
                                  fCONVLRMULTA       : extended;
                                  fCONPERCENTMULTA   : extended;
                                  iCONMOEDAMULTA     : integer;
                                  fCONVLRMORA        : extended;
                                  fCONPERCENTMORA    : extended;
                                  iCONMOEDAMORA      : integer;
                                  iFLGMORAPROPORC    : integer;
                                  iIDCIDADES         : integer;
                                  iIDPAIS            : integer;
                                  iCONDIASTOLERANCIA : integer;
                                  iCONDIASREPASSE    : integer;
                                  sCONPERMORA        : string;
                                  sCODESTADO         : string;
                                  sFLGTIPODIATOLERA  : string;
                                  dData              : TDateTime;
                                  bApenasAbertos     : boolean;
                                  bCFinan            : boolean );

  public
    procedure MsgErro( sMsg : string );

  end;

var
  frmConsultaInadimplencia: TfrmConsultaInadimplencia;

implementation

{$R *.DFM}

uses uSistema, dBaseDados,  uMensErro, uModuloImobiliario, fPrincipal,
  fCadContratoImovelMT, fPessoaLocatarioMT, RLancImovelNovo, fProgresso;

procedure TfrmConsultaInadimplencia.FormCreate(Sender: TObject);
begin
  inherited;

  CtrlInadimplencia := TCtrlInadimplencia.Create(Sistema.IDEmpresa,Sistema.IDModulo,Sistema.IDUsuario,Sistema.IDEspAcesso,Sistema.UsaPlanoPatro);
  CtrlInadimplencia.Initialize( DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
   Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro );

  CtrlContratoImovel := TCtrlContratoImovel.Create( Sistema.IdEmpresa, Sistema.IdModulo,
                                                    Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                    Sistema.UsaPlanoPatro );

  CtrlParamMulta     := TCtrlParamMulta.Create (Sistema.IdEmpresa, Sistema.IdModulo,
                                                Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                Sistema.UsaPlanoPatro);

  CtrlContratoImovel.InitializeAs( CtrlInadimplencia );
  CtrlParamMulta.InitializeAs( CtrlInadimplencia );


  CtrlEventoImovel := TCtrlEventoImovel.Create;
  CtrlEventoImovel.InitializeAs( CtrlInadimplencia );

  iOrdem := 0;
end;

procedure TfrmConsultaInadimplencia.FormDestroy(Sender: TObject);
begin
  inherited;
  CtrlInadimplencia.Free;
  CtrlContratoImovel.Free;
  CtrlEventoImovel.Free;
  CtrlParamMulta.Free;
end;

procedure TfrmConsultaInadimplencia.MsgErro(sMsg: string);
begin
  ShowMessage( sMsg );
end;

procedure TfrmConsultaInadimplencia.sbtnProcurarClick(Sender: TObject);
var
   iContador : Integer;
   iTotal    : Integer;
begin
  inherited;
  cmprContrato.ParamValues[9].TextDefault := FormatDateTime( 'dd/mm/yyyy', Now );
  if cmprContrato.Execute then
  begin
    pnlContratos.Enabled := False;
    pnlFundo.Enabled     := False;
    sbtnPrint.Enabled    := False;

    cdsContratos.Close;
    cdsImoveis.Close;
    cdsDocumentos.Close;
    cdsEventoImovel.Close;
    pnlGridHistorico.BringToFront;

    cdsContratos.Data := CtrlInadimplencia.RecuperaContratos( cmprContrato.ParamValues[0].AsString,
                                                              cmprContrato.ParamValues[1].AsString,
                                                              cmprContrato.ParamValues[2].AsString,
                                                              cmprContrato.ParamValues[3].AsString,
                                                              cmprContrato.ParamValues[4].AsString,
                                                              cmprContrato.ParamValues[5].AsDateTime,
                                                              cmprContrato.ParamValues[6].AsDateTime,
                                                              cmprContrato.ParamValues[7].AsInteger,
                                                              cmprContrato.ParamValues[7].Comparador,
                                                              cmprContrato.ParamValues[8].AsString,
                                                              0,
                                                              cmprContrato.ParamValues[9].AsDateTime,
                                                              ( cmprContrato.ParamValues[10].AsInteger = 1 ),
                                                              ( cmprContrato.ParamValues[11].AsInteger = 1 ),
                                                              True );

    if cdsContratos.IsEmpty then
      MessageDlg('Não foi encontrado nenhum contrato que atenda a estes parâmetros.', mtWarning, [mbOK], 0)
    else
    begin
      pnlContratos.Enabled := True;
      pnlFundo.Enabled     := True;
      sbtnPrint.Enabled    := True;

      iOrdem := 0;
      cdsContratos.IndexName := '';
      cdsContratos.IndexDefs.Clear;

      dbgrdContratoRowChanged(Self);

      dbgrdContrato.SetFocus;
    end;
  end;
end;

procedure TfrmConsultaInadimplencia.dbgrdContratoCalcTitleImage(
  Sender: TObject; Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
begin
  inherited;
  TitleImageAttributes.Alignment  := taRightJustify;
  TitleImageAttributes.ImageIndex := -1;

  if cdsContratos.IndexDefs.Count > 0 then
    if cdsContratos.IndexDefs[0].DescFields = Field.FieldName then
      TitleImageAttributes.ImageIndex := 1
    else
      if cdsContratos.IndexDefs[0].Fields = Field.FieldName then
        TitleImageAttributes.ImageIndex := 0;
end;

procedure TfrmConsultaInadimplencia.dbgrdContratoTitleButtonClick(
  Sender: TObject; AFieldName: String);
var
  IndexDef : TIndexDef;
begin
  inherited;

  if ( iOrdem = 0 ) or ( iOrdem = 2 ) then
    iOrdem := 1
  else
    iOrdem := 2;

  cdsContratos.IndexName := '';
  cdsContratos.IndexDefs.Clear;
  IndexDef := cdsContratos.IndexDefs.AddIndexDef;
  IndexDef.Name := 'i' + IntToStr( GetTickCount );

  if iOrdem = 1 then
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := '';
    IndexDef.Options := [];
  end
  else
  begin
    IndexDef.Fields := AFieldName;
    IndexDef.DescFields := AFieldName;
    IndexDef.Options := [ixDescending];
  end;

  cdsContratos.IndexName := cdsContratos.IndexDefs[0].Name;
  cdsContratos.First;
end;

procedure TfrmConsultaInadimplencia.SelecionaContrato;
begin
  pgctrlDocumentos.ActivePage := tabDocumentos;

  cdsImoveis.Close;
  cdsImoveis.Data := CtrlInadimplencia.RecuperaImoveis( cdsContratosIDCONTRATOIMOVEL.AsInteger );

  PreencheDocumentos( cdsDocumentos,
                      cdsContratosIDCONTRATOIMOVEL.AsInteger,
                      cdsContratosFLGTIPOCONTRATO.AsString,
                      cdsContratosCONMESREFREAJUSTE.AsString,
                      cdsContratosIDINDCORRECAO.AsInteger,
                      cdsContratosCONVLRMULTA.AsFloat,
                      cdsContratosCONPERCENTMULTA.AsFloat,
                      cdsContratosCONMOEDAMULTA.AsInteger,
                      cdsContratosCONVLRMORA.AsFloat,
                      cdsContratosCONPERCENTMORA.AsFloat,
                      cdsContratosCONMOEDAMORA.AsInteger,
                      cdsContratosFLGMORAPROPORC.AsInteger,
                      cdsContratosIDCIDADES.AsInteger,
                      cdsContratosIDPAIS.AsInteger,
                      cdsContratosCONDIASTOLERANCIA.AsInteger,
                      cdsContratosCONDIASREPASSE.AsInteger,
                      cdsContratosCONPERMORA.AsString,
                      cdsContratosCODESTADO.AsString,
                      cdsContratosFLGTIPODIATOLERA.AsString,
                      cmprContrato.ParamValues[9].AsDateTime,
                      ( cmprContrato.ParamValues[10].AsInteger = 1 ),
                      ( cmprContrato.ParamValues[11].AsInteger = 1 ) );


  if cdsDocumentos.IsEmpty then
  begin
     if not cdsContratos.IsEmpty then
     begin
        cdsContratos.Delete;
        if cdsContratos.IsEmpty then
           MessageDlg('Não foi encontrado nenhum contrato que atenda a estes parâmetros.', mtWarning, [mbOK], 0);
     end;
  end;

end;

procedure TfrmConsultaInadimplencia.dbgrdContratoRowChanged(Sender: TObject);
begin
  inherited;
  SelecionaContrato;
end;

procedure TfrmConsultaInadimplencia.dbgrdContratoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ssCtrl in Shift then
    Abort;
end;

procedure TfrmConsultaInadimplencia.cdsContratosBeforeInsert( DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmConsultaInadimplencia.pgctrlDocumentosChange(
  Sender: TObject);
begin
  inherited;
  if pgctrlDocumentos.ActivePage = tabHistorico then
  begin
    cdsEventoImovel.Close;
    cdsEventoImovel.Data := CtrlEventoImovel.LookupEventoImovel( -1, -1, -1, -1, cdsDocumentosCODDOCUMENTO.AsInteger );
    sbtnInsDet.Enabled := not cdsDocumentosCODDOCUMENTO.IsNull;
  end;
end;

procedure TfrmConsultaInadimplencia.cdsEventoImovelCalcFields( DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('GeraAviso').AsString      := Iff( DataSet.FieldByName('FLGAVISO').AsString = 'S', 'Sim', 'Não' );
  DataSet.FieldByName('DescTipoEvento').AsString := CtrlEventoImovel.RetornaDescTipoEvento( DataSet.FieldByName('FLGTIPOEVENTO').AsString );
end;

procedure TfrmConsultaInadimplencia.BitBtn2Click(Sender: TObject);
begin
  inherited;
  FrmPrincipal.Enabled := True;
  twInsereEvento.Hide;
end;

procedure TfrmConsultaInadimplencia.sbtnInsDetClick(Sender: TObject);
begin
  inherited;

  if cdsDocumentosCODDOCUMENTO.IsNull then 
  begin
    MsgDlg( 'Não é possível incluir um evento sem um número de documento.', 'Erro', mtError, [mbOk], 0 );
    exit;
  end;

  FrmPrincipal.Enabled  := False;

  dtDataEvento.Clear;
  edtCabecalho.Clear;
  memDescricao.Clear;
  cbGeraAviso.Checked  := False;
  spnedtDiasAnte.Value := 0;


  twInsereEvento.Top  := round( ( FrmPrincipal.Height - twInsereEvento.Height ) / 2 );
  twInsereEvento.Left := round( ( FrmPrincipal.Width  - twInsereEvento.Width  ) / 2 );

  twInsereEvento.Show;
  dtDataEvento.SetFocus;
end;

procedure TfrmConsultaInadimplencia.twInsereEventoClose(Sender: TObject);
begin
  inherited;
  FrmPrincipal.Enabled := True;
end;

procedure TfrmConsultaInadimplencia.cbGeraAvisoClick(Sender: TObject);
begin
  inherited;
  spnedtDiasAnte.Enabled := cbGeraAviso.Checked;
  if cbGeraAviso.Checked then
    spnedtDiasAnte.Value := 0;
end;

procedure TfrmConsultaInadimplencia.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if trim( dtDataEvento.Text ) = '' then
  begin
    MsgDlg( 'É necessário indicar a data do evento.', 'Erro', mtError, [mbOk], 0 );
    dtDataEvento.SetFocus;
    exit;
  end;

  if trim( edtCabecalho.Text ) = '' then
  begin
    MsgDlg( 'É necessário preencher o cabeçalho do evento.', 'Erro', mtError, [mbOk], 0 );
    edtCabecalho.SetFocus;
    exit;
  end;

  if cbGeraAviso.Checked then
  begin
    if spnedtDiasAnte.Value <= 0  then
    begin
      MsgDlg( 'É necessário indicar a quantidade de dias de antecedência.', 'Erro', mtError, [mbOk], 0 );
      spnedtDiasAnte.SetFocus;
      exit;
    end;
  end;

  if CtrlEventoImovel.RegistraEvento( 0, 0, 0,
                                      cdsDocumentosCODDOCUMENTO.AsInteger,
                                      Sistema.IdUsuario,
                                      'US',
                                      edtCabecalho.Text,
                                      memDescricao.Text,
                                      dtDataEvento.Date,
                                      -1, -1, 0, 0, 0, True,
                                      Iff( cbGeraAviso.Checked, 'S', 'N' ),
                                      trunc( spnedtDiasAnte.Value ) ) then
  begin
    cdsEventoImovel.Close;
    cdsEventoImovel.Data := CtrlEventoImovel.LookupEventoImovel( -1, -1, -1, -1, cdsDocumentosCODDOCUMENTO.AsInteger );
  end;

  FrmPrincipal.Enabled := True;
  twInsereEvento.Hide;
end;

procedure TfrmConsultaInadimplencia.dbgrdHistoricoRowChanged(Sender: TObject);
begin
  inherited;
  sbtnExcluiDet.Enabled := ( trim( uppercase( cdsEventoImovelFLGTIPOEVENTO.AsString ) ) = 'US' ); 
end;

procedure TfrmConsultaInadimplencia.cdsEventoImovelBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmConsultaInadimplencia.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  if ( trim( uppercase( cdsEventoImovelFLGTIPOEVENTO.AsString ) ) <> 'US' ) then
  begin
    MsgDlg( 'Não é possível excluir um evento que não seja do usuário.', 'Erro', mtError, [mbOk], 0 );
    exit;
  end else begin

// Daniel - 21967 - ------------------------------------------------------------
    if ( ModuloImobiliario.AdminImob.bFlgAlteraEvento=True ) then begin
      if Sistema.IdUsuario<>cdsEventoImovelIDUSUARIO.AsInteger then begin
        MsgDlg('Eventos de sistema só podem ser excluídos pelo usuário de lançamento', 'Aviso', mtWarning, [mbOk], 0);
        Exit;
      end else inherited;
    end else inherited;
// Daniel - 21967 - ------------------------------------------------------------

  end;

  if MessageDlg('Confirma exclusão do evento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if CtrlEventoImovel.ExcluiEvento( cdsEventoImovelIDEVENTOIMOVEL.AsInteger, -1, -1, -1, -1 ) then
    begin
      cdsEventoImovel.Close;
      cdsEventoImovel.Data := CtrlEventoImovel.LookupEventoImovel( -1, -1, -1, -1, cdsDocumentosCODDOCUMENTO.AsInteger );
    end;
  end;
end;

procedure TfrmConsultaInadimplencia.sbtnPrintClick(Sender: TObject);
begin
  inherited;
  FrmPrincipal.Enabled   := False;
  pnlProcessoRel.Visible := False;

  twRelatorio.Top  := round( ( FrmPrincipal.Height - twRelatorio.Height ) / 2 );
  twRelatorio.Left := round( ( FrmPrincipal.Width  - twRelatorio.Width  ) / 2 );

  twRelatorio.Show;
  BitBtnOkPrint.SetFocus;
end;

procedure TfrmConsultaInadimplencia.BitBtnCancelPrintClick(Sender: TObject);
begin
  inherited;
  FrmPrincipal.Enabled := True;
  twRelatorio.Hide;
end;

procedure TfrmConsultaInadimplencia.twRelatorioClose(Sender: TObject);
begin
  inherited;
  FrmPrincipal.Enabled := True;
end;

procedure TfrmConsultaInadimplencia.BitBtnOkPrintClick(Sender: TObject);
var
  sListaCodDocumento : string;
  bIncluiHist : boolean;

  procedure AdicionaDadosDocumento;
  begin
    cdsRelContratosCONNUMERO.AsString       := cdsContratosAuxCONNUMERO.AsString;
    cdsRelContratosCONNOME.AsString         := cdsContratosAuxCONNOME.AsString;
    cdsRelContratosLOCATARIO.AsString       := cdsContratosAuxLOCATARIO.AsString;
    cdsRelContratosCONDATAINICIO.AsDateTime := cdsContratosAuxCONDATAINICIO.AsDateTime;
    cdsRelContratosCONDATAFIM.AsDateTime    := cdsContratosAuxCONDATAFIM.AsDateTime;
    cdsRelContratosDSCTIPOCONTRATO.AsString := cdsContratosAuxDSCTIPOCONTRATO.AsString;

    cdsRelContratosCHAVE.AsFloat            := StrToInt64(cdsDocumentosAuxIDPARCFINANCIMOV.AsString +
                                                          cdsDocumentosAuxCODDOCUMENTO.AsString);
    cdsRelContratosCODDOCUMENTO.AsFloat     := cdsDocumentosAuxCODDOCUMENTO.AsFloat;
    cdsRelContratosNODOCUMENTO.AsFloat      := cdsDocumentosAuxNODOCUMENTO.AsFloat;
    cdsRelContratosDESCCUSTORECIMO.AsString := cdsDocumentosAuxDESCCUSTORECIMO.AsString;
    cdsRelContratosCOMPETENCIA.AsString     := cdsDocumentosAuxCOMPETENCIA.AsString;
    cdsRelContratosDATAVENCTO.AsDateTime    := cdsDocumentosAuxDATAVENCTO.AsDateTime;
    cdsRelContratosDATACALCULO.AsDateTime   := cdsDocumentosAuxDATACALCULO.AsDateTime;
    cdsRelContratosVALOR_ORIGINAL.AsFloat   := cdsDocumentosAuxVALOR_ORIGINAL.AsFloat;
    cdsRelContratosVALORDIVERG.AsFloat      := cdsDocumentosAuxVALORDIVERG.AsFloat;
    cdsRelContratosDIAS_ATRASO.AsInteger    := cdsDocumentosAuxDIAS_ATRASO.AsInteger;
    cdsRelContratosMULTA.AsFloat            := cdsDocumentosAuxMULTA.AsFloat;
    cdsRelContratosJUROS.AsFloat            := cdsDocumentosAuxJUROS.AsFloat;
    cdsRelContratosCORRECMONET.AsFloat      := cdsDocumentosAuxCORRECMONET.AsFloat;
    cdsRelContratosMULTADIF.AsFloat         := cdsDocumentosAuxMULTADIF.AsFloat;
    cdsRelContratosJUROSDIF.AsFloat         := cdsDocumentosAuxJUROSDIF.AsFloat;
    cdsRelContratosCORRECMONETDIF.AsFloat   := cdsDocumentosAuxCORRECMONETDIF.AsFloat;
    cdsRelContratosPROPORCAO.AsFloat        := cdsDocumentosAuxPROPORCAO.AsFloat;
    cdsRelContratosVALORATUAL.AsFloat       := cdsDocumentosAuxVALORATUAL.AsFloat;
    cdsRelContratosVALOR_RECEBIDO.AsFloat   := cdsDocumentosAuxVALOR_RECEBIDO.AsFloat;
    cdsRelContratosVALORDIVERGATUAL.AsFloat := cdsDocumentosAuxVALORDIVERG.AsFloat;
    if not cdsDocumentosAuxDATAPAGTO.IsNull then
      cdsRelContratosDATAPAGTO.AsDateTime   := cdsDocumentosAuxDATAPAGTO.AsDateTime;
    cdsRelContratosVALORDIVERGATUAL.AsFloat := cdsDocumentosAuxVALORDIVERGATUAL.AsFloat;
  end;

begin
  inherited;
  ProgressBar.Position   := 0;
  pnlProcessoRel.Visible := True;
  try
    BitBtnOkPrint.Enabled     := False;
    BitBtnCancelPrint.Enabled := False;

    cdsRelContratos.Close;
    cdsRelContratos.CreateDataset;

    cdsContratosAux.Close;
    cdsContratosAux.Data := cdsContratos.Data;

    ProgressBar.Max := cdsContratosAux.RecordCount;

    cdsContratosAux.First;
    while not cdsContratosAux.Eof do
    begin
      lblProcessoRel.Caption := 'Processando contrato ' +
                                IntToStr( cdsContratosAux.RecNo ) + ' de ' +
                                IntToStr( cdsContratosAux.RecordCount ) + '...';
      Application.ProcessMessages;

      PreencheDocumentos( cdsDocumentosAux,
                          cdsContratosAuxIDCONTRATOIMOVEL.AsInteger,
                          cdsContratosAuxFLGTIPOCONTRATO.AsString,
                          cdsContratosAuxCONMESREFREAJUSTE.AsString,
                          cdsContratosAuxIDINDCORRECAO.AsInteger,
                          cdsContratosAuxCONVLRMULTA.AsFloat,
                          cdsContratosAuxCONPERCENTMULTA.AsFloat,
                          cdsContratosAuxCONMOEDAMULTA.AsInteger,
                          cdsContratosAuxCONVLRMORA.AsFloat,
                          cdsContratosAuxCONPERCENTMORA.AsFloat,
                          cdsContratosAuxCONMOEDAMORA.AsInteger,
                          cdsContratosAuxFLGMORAPROPORC.AsInteger,
                          cdsContratosAuxIDCIDADES.AsInteger,
                          cdsContratosAuxIDPAIS.AsInteger,
                          cdsContratosAuxCONDIASTOLERANCIA.AsInteger,
                          cdsContratosAuxCONDIASREPASSE.AsInteger,
                          cdsContratosAuxCONPERMORA.AsString,
                          cdsContratosAuxCODESTADO.AsString,
                          cdsContratosAuxFLGTIPODIATOLERA.AsString,
                          cmprContrato.ParamValues[9].AsDateTime,
                          ( cmprContrato.ParamValues[10].AsInteger = 1 ),
                          ( cmprContrato.ParamValues[11].AsInteger = 1 ) );

      sListaCodDocumento := '';
      while not cdsDocumentosAux.Eof do
      begin

        bIncluiHist := False;
        if cbImprimeHistorico.Checked then
        begin
          cdsEventoImovelAux.Close;
          cdsEventoImovelAux.Data := CtrlEventoImovel.LookupEventoImovel( -1, -1, -1, -1, cdsDocumentosAuxCODDOCUMENTO.AsInteger );
          bIncluiHist := not cdsEventoImovelAux.IsEmpty;
        end;

        if bIncluiHist then
        begin
          cdsEventoImovelAux.First;
          while not cdsEventoImovelAux.Eof do
          begin
            cdsRelContratos.Append;
            AdicionaDadosDocumento;
            cdsRelContratosEVIDATA.AsDateTime       := cdsEventoImovelAuxEVIDATA.AsDateTime;
            cdsRelContratosEVICABECALHO.AsString    := cdsEventoImovelAuxEVICABECALHO.AsString;
            cdsRelContratosEVIDESCRICAO.AsString    := cdsEventoImovelAuxEVIDESCRICAO.AsString;
            cdsRelContratosDESCTIPOEVENTO.AsString  := cdsEventoImovelAuxDESCTIPOEVENTO.AsString;
            cdsRelContratosUSUARIO_EXTENSO.AsString := cdsEventoImovelAuxUSUARIO_EXTENSO.AsString;
            cdsRelContratosGERAAVISO.AsString       := cdsEventoImovelAuxGERAAVISO.AsString;
            cdsRelContratosDIASAVISO.AsFloat        := cdsEventoImovelAuxDIASAVISO.AsFloat;
            cdsRelContratos.Post; 
            cdsEventoImovelAux.Next;
          end;
        end
        else
        begin
          cdsRelContratos.Append;
          AdicionaDadosDocumento;
          cdsRelContratos.Post;
        end;

        cdsDocumentosAux.Next;
      end;

      ProgressBar.StepIt;
      Application.ProcessMessages;

      cdsContratosAux.Next;
    end;
    cdsContratosAux.First;

    ppdbHist.Visible           := cbImprimeHistorico.Checked;
    ppdbRodHist.Visible        := cbImprimeHistorico.Checked;
    ppDtEvento.Visible         := cbImprimeHistorico.Checked;
    ppCabEvento.Visible        := cbImprimeHistorico.Checked;
    ppDescEvento.Visible       := cbImprimeHistorico.Checked;
    ppLineTopEvento.Visible    := cbImprimeHistorico.Checked;
    ppdbRodHist.Visible        := cbImprimeHistorico.Checked;
    ppSob.Visible              := cbImprimeHistorico.Checked;
    ppSub.Visible              := not cbImprimeHistorico.Checked;

    pplDtCalculo.Caption       := 'Data de Cálculo: ' + FormatDateTime('dd/mm/yyyy', cmprContrato.ParamByName('Data de Baixa').AsDateTime);



    if cbImprimeHistorico.Checked then
    begin
      ppdbCabHist.Height  := 0.5;
      ppDtEvento.Top      := 0.3021;
      ppCabEvento.Top     := 0.3021;
      ppDescEvento.Top    := 0.3021;
      ppLineTopEvento.Top := 0.4479;
    end
    else
      ppdbCabHist.Height := 0.20;

    TFrmPreview.CreateModalPreview( Application,
                                    rptContratos,
                                    rptContratos.PrinterSetup.DocumentName)



  finally
    pnlProcessoRel.Visible    := False;
    BitBtnOkPrint.Enabled     := True;
    BitBtnCancelPrint.Enabled := True;
  end;

  FrmPrincipal.Enabled := True;
  twRelatorio.Hide;
end;

procedure TfrmConsultaInadimplencia.cdsDocumentosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  Abort;
end;

procedure TfrmConsultaInadimplencia.PreencheDocumentos( cdsDoc             : TCMClientDataSet;
                                                        iIDCONTRATOIMOVEL  : integer;
                                                        sFLGTIPOCONTRATO   : string;
                                                        sCONMESREFREAJUSTE : string;
                                                        iIDINDCORRECAO     : integer;
                                                        fCONVLRMULTA       : extended;
                                                        fCONPERCENTMULTA   : extended;
                                                        iCONMOEDAMULTA     : integer;
                                                        fCONVLRMORA        : extended;
                                                        fCONPERCENTMORA    : extended;
                                                        iCONMOEDAMORA      : integer;
                                                        iFLGMORAPROPORC    : integer;
                                                        iIDCIDADES         : integer;
                                                        iIDPAIS            : integer;
                                                        iCONDIASTOLERANCIA : integer;
                                                        iCONDIASREPASSE    : integer;
                                                        sCONPERMORA        : string;
                                                        sCODESTADO         : string;
                                                        sFLGTIPODIATOLERA  : string;
                                                        dData              : TDateTime;
                                                        bApenasAbertos     : boolean;
                                                        bCFinan            : boolean );
var
  iMESESANTERIORES  : integer;
  fVALORORIGINAL,
  fVALORRECEBIDO    : extended;
  bTEMBAIXAPARCIAL  : boolean;
  dDATAVENCIMENTO   ,
  dDATALIMITE       : TDateTime;
  sFLGTIPODIAREPASS : string;
  iIdParcFinancImov : Integer;
  fValorAtual,
  fMulta, fJuros, fCorrecaoMonet,
  fMultaDif, fJurosDif, fCorrecaoMonetDif,
  fProporcao, fValorDiverg, fValorDivergAtual : extended;

  dDataCalculo : TDateTime;
  ParamMulta   : TParamMulta;
begin
  cdsDoc.Close;

  if not CtrlInadimplencia.AtualizaDataLimite( sFLGTIPOCONTRATO, iIDCONTRATOIMOVEL, ( cmprContrato.ParamValues[12].AsInteger = 1) ) then
  begin
     MsgDlg( 'Não é possível a data limite dos documentos.', 'Erro', mtError, [mbOk], 0 );
     Exit;
  end;

  CtrlParamMulta.BuscaParamMulta(ParamMulta,iIDCONTRATOIMOVEL, -1, dData);

  if (sFLGTIPOCONTRATO = 'L') or (sFLGTIPOCONTRATO = 'D') then
       cdsDoc.Data := CtrlInadimplencia.RecuperaDocumentosImob( iIDCONTRATOIMOVEL, dData, bApenasAbertos, bCFinan )
  else cdsDoc.Data := CtrlInadimplencia.RecuperaDocumentosAliena( iIDCONTRATOIMOVEL, dData, bApenasAbertos );

  cdsDoc.DisableControls;
  try
    while not cdsDoc.Eof do
    begin
      iIdParcFinancImov  := -1;
      iMESESANTERIORES   := Iff( sCONMESREFREAJUSTE = 'A', 1, 0 );
      iIDINDCORRECAO     := iIDINDCORRECAO;
      fCONVLRMULTA       := fCONVLRMULTA;
      fCONPERCENTMULTA   := fCONPERCENTMULTA;
      iCONMOEDAMULTA     := iCONMOEDAMULTA;
      fCONVLRMORA        := fCONVLRMORA;
      fCONPERCENTMORA    := fCONPERCENTMORA;
      iCONMOEDAMORA      := iCONMOEDAMORA;
      iFLGMORAPROPORC    := iFLGMORAPROPORC;
      iIDCIDADES         := iIDCIDADES;
      iIDPAIS            := iIDPAIS;
      iCONDIASTOLERANCIA := iCONDIASTOLERANCIA;
      iCONDIASREPASSE    := iCONDIASREPASSE;
      fVALORORIGINAL     := cdsDoc.FieldByName('VALOR_ORIGINAL').AsFloat;
      fVALORRECEBIDO     := cdsDoc.FieldByName('VALOR_RECEBIDO').AsFloat;
      bTEMBAIXAPARCIAL   := ( fVALORRECEBIDO <> 0 );
      dDATAVENCIMENTO    := cdsDoc.FieldByName('DATAVENCTO').AsDateTime;
      dDATALIMITE        := cdsDoc.FieldByName('DATALIMITE').AsDateTime;
      sCONPERMORA        := sCONPERMORA;
      sCODESTADO         := sCODESTADO;
      sFLGTIPODIATOLERA  := sFLGTIPODIATOLERA;
      sFLGTIPODIAREPASS  := sFLGTIPODIATOLERA;

      if sFLGTIPOCONTRATO = 'C' then
      begin
        iMESESANTERIORES   := ParamMulta.iMesRefCorrecao;
        iIDINDCORRECAO     := ParamMulta.iIndiceCorrecao;
        fCONVLRMULTA       := ParamMulta.fVlrMulta;
        fCONPERCENTMULTA   := ParamMulta.fPercMulta;
        iCONMOEDAMULTA     := ParamMulta.iMoeMulta;
        fCONVLRMORA        := ParamMulta.fVlrJuros;
        fCONPERCENTMORA    := ParamMulta.fPercJuros;
        iCONMOEDAMORA      := ParamMulta.iMoeJuros;
        iFLGMORAPROPORC    := Iff( ParamMulta.sFlgJurosProporc = 'S', 1, 0 );
        sCONPERMORA        := ParamMulta.sPeriodoJuros;
        iCONDIASTOLERANCIA := ParamMulta.iDiasTolerancia;
        iCONDIASREPASSE    := ParamMulta.iDiasRepasse;
        sFLGTIPODIATOLERA  := ParamMulta.sFlgTipoDiasTolera;
        sFLGTIPODIAREPASS  := ParamMulta.sFlgTipoDiasRepasse;

        // Busca o Id da Parcela
        iIdParcFinancImov  := cdsDoc.FieldByName('IDPARCFINANCIMOV').AsInteger;
      end;

      fMulta         := 0;
      fJuros         := 0;
      fCorrecaoMonet := 0;

      CtrlInadimplencia.DadosDocsVencidos( cdsDoc.FieldByName('CODDOCUMENTO').AsInteger,
                                           iIdParcFinancImov,
                                           dData,
                                           iMESESANTERIORES,
                                           iIDINDCORRECAO,
                                           fCONVLRMULTA,
                                           fCONPERCENTMULTA,
                                           iCONMOEDAMULTA,
                                           fCONVLRMORA,
                                           fCONPERCENTMORA,
                                           iCONMOEDAMORA,
                                           iFLGMORAPROPORC,
                                           iIDCIDADES,
                                           iIDPAIS,
                                           iCONDIASTOLERANCIA,
                                           iCONDIASREPASSE,
                                           bTEMBAIXAPARCIAL,
                                           fVALORORIGINAL,
                                           fVALORRECEBIDO,
                                           dDATAVENCIMENTO,
                                           dDATALIMITE,
                                           sCONPERMORA,
                                           sCODESTADO,
                                           sFLGTIPODIATOLERA,
                                           sFLGTIPODIAREPASS,
                                           sFLGTIPOCONTRATO,
                                           ModuloImobiliario.AdminImob.sFlgCalcInadimp,
                                           False,
                                           fValorAtual,
                                           fMulta, fJuros, fCorrecaoMonet,
                                           fMultaDif, fJurosDif, fCorrecaoMonetDif, fProporcao,
                                           fValorDiverg, fValorDivergAtual,
                                           dDataCalculo );

      if (fValorDiverg > 0) or (cmprContrato.ParamByName('bDivergeMaior').AsBoolean = True) then begin
         cdsDoc.Edit;
         if sFLGTIPOCONTRATO = 'C' then
           cdsDoc.FieldByName('DESCCUSTORECIMO').AsString := CtrlInadimplencia.TipoParcela( cdsDoc.FieldByName('FLGTIPOLANC').AsInteger );
         cdsDoc.FieldByName('MULTA').AsFloat            := fMulta;
         cdsDoc.FieldByName('JUROS').AsFloat            := fJuros;
         cdsDoc.FieldByName('CORRECMONET').AsFloat      := fCorrecaoMonet;
         cdsDoc.FieldByName('MULTADIF').AsFloat         := fMultaDif;
         cdsDoc.FieldByName('JUROSDIF').AsFloat         := fJurosDif;
         cdsDoc.FieldByName('CORRECMONETDIF').AsFloat   := fCorrecaoMonetDif;
         cdsDoc.FieldByName('PROPORCAO').AsFloat        := fProporcao;
         cdsDoc.FieldByName('VALORATUAL').AsFloat       := fValorAtual;
         cdsDoc.FieldByName('VALORDIVERG').AsFloat      := fValorDiverg;
         cdsDoc.FieldByName('VALORDIVERGATUAL').AsFloat := fValorDivergAtual;
         cdsDoc.FieldByName('DATACALCULO').AsDateTime   := dDataCalculo;
         cdsDoc.Post;
         cdsDoc.Next;
      end else begin
         cdsDoc.Delete;
      end;
    end;
  finally
    cdsDoc.EnableControls;
    cdsDoc.First;
  end;
end;

procedure TfrmConsultaInadimplencia.rptContratosBeforePrint(Sender: TObject);
begin
  inherited;
  if Sistema.IdModulo = 64 then begin
     if ModuloImobiliario.AdminImob.bFlgLogoRelat then
          ppLogotipo.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
     else ppLogotipo.Picture := nil;
  end else begin
     if ModuloImobiliario.Alienacao.bFlgLogoRelat then
          ppLogotipo.Picture := ModuloImobiliario.Alienacao.LogoTipo.Picture
     else ppLogotipo.Picture := nil;
  end;
  ppLblEmpresa.Text := Sistema.NomeEmpresa;
  ppLblSistema.Text := Sistema.NomeModulo;
end;

procedure TfrmConsultaInadimplencia.ppdbCabHistBeforePrint(
  Sender: TObject);
begin
  inherited;
  ppdbHist.Visible           := not cdsRelContratosEVIDATA.IsNull;
  ppdbRodHist.Visible        := not cdsRelContratosEVIDATA.IsNull;
  ppDtEvento.Visible         := not cdsRelContratosEVIDATA.IsNull;
  ppCabEvento.Visible        := not cdsRelContratosEVIDATA.IsNull;
  ppDescEvento.Visible       := not cdsRelContratosEVIDATA.IsNull;
  ppLineTopEvento.Visible    := not cdsRelContratosEVIDATA.IsNull;
  ppdbRodHist.Visible        := not cdsRelContratosEVIDATA.IsNull;
end;

procedure TfrmConsultaInadimplencia.mnuExibeContratoClick(Sender: TObject);
begin
  inherited;
  if (FrmPrincipal.deLocao1.Enabled) or (FrmPrincipal.btnCadContrato.Enabled)  then begin
    Application.CreateForm(TfrmCadContratoImovelMT, frmCadContratoImovelMT);
    frmCadContratoImovelMT.AbreContrato( cdsContratos.FieldByName('IDCONTRATOIMOVEL').AsInteger );
  end
end;

procedure TfrmConsultaInadimplencia.mnuExibeLocatarioClick(Sender: TObject);
begin
   inherited;
   if FrmPrincipal.Locatarios.Enabled then begin
      Application.CreateForm(TfrmPessoaLocatarioMT, frmPessoaLocatarioMT);
      frmPessoaLocatarioMT.WindowState := wsNormal;
      frmPessoaLocatarioMT.SelPessoa(cdsContratos.FieldByName('IDLOCATARIO').AsInteger);
      frmPessoaLocatarioMT.Show;
   end;
end;

procedure TfrmConsultaInadimplencia.dbgrdDocumentoDblClick(Sender: TObject);
begin
  inherited;
  if (not cdsDocumentos.FieldByName('CODDOCUMENTO').IsNull) and
     (FrmPrincipal.Consulta1.Enabled) then begin
     frmRelLancImovelNovo := TfrmRelLancImovelNovo.Create(self);
     frmRelLancImovelNovo.iDocumento := cdsDocumentos.FieldByName('CODDOCUMENTO').AsInteger;
     frmRelLancImovelNovo.Seleciona;
     frmRelLancImovelNovo.Show;
  end;
end;


end.
