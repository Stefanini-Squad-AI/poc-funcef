unit FDistratoContratual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FWizardMT, IvDictio, IvMulti, IvEMulti, fcButton, fcImgBtn, fcShapeBtn,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls,
  mAdministradora, TREdit, mResponsavel, mComprador, mContratoNumero,
  wwdbdatetimepicker, CMDateTimePicker, Grids, Wwdbigrd, Wwdbgrid, Db,
  Wwdatsrc, DBTables, Wwquery, mProposta, Mask, DBCtrls, DBCtrls2, wwdblook,
  DBGrids, uCtrlLancamentosImovel, uCtrlPadroes, wwdbedit, Wwdbspin,
  UVerificaPreenchimento, UDiasInUteis, uDocumento, TEdNum, DBClient,
  uCMClientDataSet, UCtrlTipoImovel, uCmSqlParams, UComunsImobiliario,
  UModuloAdminImob, uCtrlPadrLancImovel, uCtrlImobDocumento, uCtrlImobLancamento,
  uCtrlParamIntegra, uComunsImobiliarioDB, uIntegraBack, uCalcDocumento,
  uCtrlDomBem, uCtrlImobMovBaixa, uCtrlHistMovBem, uCtrlBem, uCtrlParamCAF, uCmMath,
  uCtrlFechamentoProRata, MontaSelect, uCtrlContratoImovel;

type
  TFrmDistratoContratual = class(TfrmWizardMT)
    Label3: TLabel;
    edDataProp: TCMDateTimePicker;
    Label48: TLabel;
    edDataAssin: TCMDateTimePicker;
    Label19: TLabel;
    edValAvali: TDBRealEdit;
    edValContab: TDBRealEdit;
    Label20: TLabel;
    Label50: TLabel;
    edValVenda: TDBRealEdit;
    pcCondPagto: TPageControl;
    TabSheet4: TTabSheet;
    dsCondPag: TwwDataSource;
    grdCondPag: TwwDBGrid;
    qry: TwwQuery;
    qryIDCONTRATOIMOVEL: TFloatField;
    qryCONNUMERO: TStringField;
    qryCONNOME: TStringField;
    qryCONDATAINICIO: TDateTimeField;
    qryFLGTIPOCONTRATO: TStringField;
    qryCONTAXAADMIN: TFloatField;
    qryCONVLRAJUSTADO: TFloatField;
    qryCONVLRTOTAL: TFloatField;
    qryCONDESCRICAO: TMemoField;
    qryVLRPROPOSTA: TFloatField;
    qryVLRPRESENTE: TFloatField;
    qryVLRCONTABIL: TFloatField;
    qryCONINDICEREAJUSTE: TFloatField;
    qryCONDATAREAJUSTE: TDateTimeField;
    qryPERALUGUELIDEAL: TFloatField;
    qryPERCTXJURMERC: TFloatField;
    qryPERITXJURMERC: TStringField;
    qryIDMSGBOLETO: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryRAZAOSOCIAL: TStringField;
    qryIDRESPONSAVEL: TFloatField;
    qryNOMRESPONSAVEL: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryCONPERREAJUSTE: TFloatField;
    qryFLGSTATUS: TStringField;
    qryCODESTADO: TStringField;
    qryIDPAIS: TFloatField;
    qryIDCIDADES: TFloatField;
    qryIDADMINIMOVEL: TFloatField;
    qryNOMADMINIMOVEL: TStringField;
    qryCONDATAASSINATURA: TDateTimeField;
    qryFLGFIANCA: TStringField;
    qryCONDATAFIANCAINI: TDateTimeField;
    qryCONDATAFIANCAFIM: TDateTimeField;
    qryCONDATAFIANCAAV: TDateTimeField;
    qryCONBANCOFIANCA: TFloatField;
    qryCONVLRFIANCA: TFloatField;
    qryCONOBSFIANCA: TMemoField;
    qryIDLOCATARIO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryFLGVGV: TFloatField;
    ds: TwwDataSource;
    Label1: TLabel;
    DBedtResponsavel: TDBEdit2;
    Label21: TLabel;
    Label44: TLabel;
    dbEdtAdmin: TDBEdit2;
    edtNumProp: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edtNomProp: TEdit;
    btnBuscaContrato: TBitBtn;
    btnLimpaProp: TBitBtn;
    DBedtComprador: TDBEdit2;
    Panel4: TPanel;
    dsParc: TwwDataSource;
    qryParc: TwwQuery;
    qryParcIDPARCFINANCIMOV: TFloatField;
    qryParcIDCONDPAGIMOVEL: TFloatField;
    qryParcIDCONTRATOIMOVEL: TFloatField;
    qryParcNUMPARCELA: TStringField;
    qryParcDATAVENCIMENTO: TDateTimeField;
    qryParcVLRPRESTACAO: TFloatField;
    qryParcFLGTIPOLANC: TFloatField;
    qryParcDATAPAGAMENTO: TDateTimeField;
    qryParcVLRPAGO: TFloatField;
    qryParcVLRDEVIDO: TFloatField;
    qryParcCAL_TIPO: TStringField;
    qryParcVLRJUROS: TFloatField;
    qryParcCODDOCUMENTO: TFloatField;
    qryParcFLGLANCINTEGRA: TFloatField;
    qryParcVLRPRESTCORRIG: TFloatField;
    qryParcVLRMULTACORRIG: TFloatField;
    qryParcVLRJUROSCORRIG: TFloatField;
    qryParcVLRAMORTIZACAO: TFloatField;
    qryParcFLGTIPOCONTRATO: TStringField;
    dbgParc: TwwDBGrid;
    GroupBox6: TGroupBox;
    DBcboAlterador: TwwDBLookupCombo;
    qryParcCODTIPIMOVEL: TStringField;
    tabLancDesp: TTabSheet;
    qryParcVLRRESIDUOATUALI: TFloatField;
    qryParcCONNUMERO: TStringField;
    qryParcPLNCODIGO: TFloatField;
    Label12: TLabel;
    Label13: TLabel;
    edtNumContr: TEdit;
    edtNomContr: TEdit;
    cdsAlterador: TCMClientDataSet;
    cdsAlteradorDESCRICAO: TStringField;
    cdsAlteradorCODTIPIMOVEL: TStringField;
    cdsAlteradorVLRALTERADOR: TFloatField;
    cdsAlteradorOBSERVACAO: TStringField;
    cdsAlteradorIDDOCUMENTO: TFloatField;
    cdsAlteradorCODALTERADOR: TFloatField;
    dsAlterador: TwwDataSource;
    cdsAlteradorXTipoImovel: TCMClientDataSet;
    cdsAlteradorXTipoImovelCODTIPIMOVEL: TStringField;
    cdsAlteradorXTipoImovelCODALTERADOR: TFloatField;
    cdsAlteradorXTipoImovelDESCRICAO: TStringField;
    cdsAlteradorXTipoImovelACRESDECRES: TStringField;
    cdsAlteradorXTipoImovelRECPAG: TStringField;
    cdsAlteradorXTipoImovelCHAVE: TStringField;
    cdsImoveis: TCMClientDataSet;
    dsImoveis: TwwDataSource;
    CMSqlParams1: TCMSqlParams;
    cdsImoveisIMOCODIGO: TStringField;
    cdsImoveisIMONOME: TStringField;
    cdsImoveisCONNUMERO: TStringField;
    cdsImoveisCODTIPIMOVEL: TStringField;
    cdsImoveisPERCENTUAL: TFloatField;
    cdsImoveisVLRIMOVEL: TFloatField;
    fcLabel2: TfcLabel;
    qryParamGlobal: TwwQuery;
    qryParamGlobalUSACRESPON: TStringField;
    qryParamGlobalUSAABC: TStringField;
    qryParamGlobalCODCENTRORESPON: TStringField;
    qryParamGlobalUNIDNEGOC: TFloatField;
    qryParamGlobalMOEDACORRENTE: TFloatField;
    qryParamGlobalIDPATRO: TFloatField;
    qryParamGlobalIDPLANOPREV: TFloatField;
    qryParamGlobalMOESIGLA: TStringField;
    qryParamGlobalPLANPREV: TStringField;
    qryParamGlobalPATRO: TStringField;
    qryImovelBem: TwwQuery;
    qryInsRepactua: TwwQuery;
    qryAux: TwwQuery;
    qryUpdParc: TwwQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    DateTimeField2: TDateTimeField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField2: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    qryParcAux: TwwQuery;
    qryInsertEventoImovel: TwwQuery;
    qryInsertEventoImovelIDREAJUSTECONIMO: TFloatField;
    qryInsertEventoImovelIDIMOVEL: TFloatField;
    qryInsertEventoImovelIDCONTRATOIMOVEL: TFloatField;
    qryInsertEventoImovelIDTIPOEVENTOIMOB: TFloatField;
    qryInsertEventoImovelRCODATA: TDateTimeField;
    qryInsertEventoImovelFLGTIPOREAJUSTE: TStringField;
    qryInsertEventoImovelRCOVLRALUGUEL: TFloatField;
    qryInsertEventoImovelRCOVLRCONTRATO: TFloatField;
    qryInsertEventoImovelRCOMOTIVO: TStringField;
    qryInsertEventoImovelRCODATAPROXIMO: TDateTimeField;
    qryAssinatura: TwwQuery;
    qryAssinaturaCONDATAASSINATURA: TDateTimeField;
    qryVerifBem: TwwQuery;
    cdsImoveisIDCONTRATOIMOVEL: TFloatField;
    cdsImoveisIDIMOVEL: TFloatField;
    updBens: TUpdateSQL;
    qryBens: TwwQuery;
    qryBensSEL_BEM: TFloatField;
    qryBensDESBEM: TStringField;
    qryBensNOME_GRUPO: TStringField;
    qryBensVLR_BEM: TFloatField;
    qryBensIXBGRUPO: TStringField;
    qryBensIDIMOVEL: TFloatField;
    qryBensIDBEM: TFloatField;
    qryBensIMOVEL_EXTENSO: TStringField;
    qryBensCODTIPIMOVEL: TStringField;
    qryBensIMOCODIGO: TStringField;
    qryBensIXBPERCENT: TFloatField;
    qryBensIDGRUPO: TFloatField;
    qryBensIDCONJUNTO: TFloatField;
    qryBensIDLOCALIZACAO: TFloatField;
    qryBensIDRESPONSAVEL: TFloatField;
    dsBens: TwwDataSource;
    cdsImoveisVLRVENDA: TFloatField;
    cdsImoveisIDGRUPO: TFloatField;
    cdsImoveisCLASSE: TStringField;
    qryCondPag: TwwQuery;
    qryCondPagcal_Tipo: TStringField;
    qryCondPagDATAVENCIMENTO: TDateTimeField;
    qryCondPagVLRFINANC: TFloatField;
    qryCondPagNUMPARCELAS: TFloatField;
    qryCondPagcal_intervalo: TStringField;
    qryCondPagcal_PerTaxa: TStringField;
    qryCondPagDSCINDCORR: TStringField;
    qryCondPagDSCINDPROJ: TStringField;
    qryCondPagMESREFREAJUSTE: TFloatField;
    qryCondPagcal_forma: TStringField;
    qryCondPagPERINDPROJ: TFloatField;
    qryCondPagDATACARENCIA: TDateTimeField;
    qryCondPagFLGJURCARENCIA: TStringField;
    qryCondPagPERIODO: TFloatField;
    qryCondPagcal_PerParc: TStringField;
    qryCondPagDATAINI: TDateTimeField;
    qryCondPagTAXAJUROS: TFloatField;
    qryCondPagINDCORRECAO: TFloatField;
    qryCondPagPRAZO: TStringField;
    qryCondPagPERIODOTAXA: TStringField;
    qryCondPagIDCONTRATOIMOVEL: TFloatField;
    qryCondPagIDCONDPAGIMOVEL: TFloatField;
    qryCondPagIDINDCORRPROJ: TFloatField;
    qryCondPagDATAFIM: TDateTimeField;
    qryCondPagTIPOCONDPAG: TStringField;
    qryCondPagIDCONDINICIAL: TFloatField;
    qryCondPagFORMACALCULO: TFloatField;
    qryCondPagDATAINIAMORTIZ: TDateTimeField;
    qryCondPagPERIODOREAJUSTE: TFloatField;
    qryCondPagCODTIPIMOVEL: TStringField;
    Label5: TLabel;
    dteDataDistrato: TCMDateTimePicker;
    pgcImovelBem: TPageControl;
    tsImovelBen: TTabSheet;
    grdImovelBem: TwwDBGrid;
    dsImovelBem: TwwDataSource;
    qryImovelBemIDIMOVEL: TFloatField;
    qryImovelBemDESBEM: TStringField;
    qryImovelBemTIPO: TStringField;
    qryImovelBemVLRCONTABIL: TFloatField;
    qryImovelBemGRUPOCONTABIL: TStringField;
    qryImovelBemDATABAIXA: TDateTimeField;
    qryImovelBemIDBEM: TFloatField;
    MontaSelectMS_Contrato: TMontaSelect;
    qryImovelBemIMOCODIGO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure qryCondPagCalcFields(DataSet: TDataSet);
    procedure molProposta1btnBuscaPropClick(Sender: TObject);
    procedure btnLimpaPropClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure qryParcCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rdgAcreDescClick(Sender: TObject);
    procedure btnExcluiAlteradorClick(Sender: TObject);
    procedure fcShapeBtn4Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure DBcboAlteradorChange(Sender: TObject);
    procedure btnContinuarKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    
    ParamContabeis        : TParamContabeisMT;
    CtrlTipoImovel        : TCtrlTipoImovel;
    CtrlPadrLancImovel    : TCtrlPadrLancImovel;
    CtrlDomBem            : TCtrlDomBem;
    CtrlContratoImovel    : TCtrlContratoImovel;
    CtrlBem               : TCtrlBem;
    CtrlHistMovBem        : TCtrlHistMovBem;
    CtrlParamCAF          : TCtrlParamCAF;
    ComunsImobiliarioDB   : TComunsImobiliarioDB;
    CtrlFechamentoProRata : TCtrlFechamentoProRata;
    iContratoSelecao      : Integer;


    procedure Selecao(n : Integer);
    function Verificapreenchimento : boolean;
    function AtualizaLancImovel: Boolean;
    function TotalizaRateio(var fTotalRateio: Extended): Boolean;
    function InicializaParam(const sCodTipImovel, sTipoOperacao: String;
                             const iTipoRec: Integer): Boolean;
    function BaixaPorAlterador(const iCodDoc: Integer;
                               const fVlrRepac: Extended;
                               const iIdContratoImovel: integer;
                               var iPlnCodigo: double): Boolean;
    function DesfazCAF : Boolean;
    function RateiaGrupos: Boolean;
    function TrocaVirgulaPonto(Value: String): String;

      //Marcio Sanches Spinosa
    procedure AjustaTaxaDistratoConrtatual(pStrDataDistrato : string;
                                             pFltValor : Extended;
                                             pIntIDBem : integer);
    function  GetVidaUtilDistratoContratual (pStrDataDistrato, pStrIDBem : string) : integer;
      //Marcio Sanches Spinosa

  public
    { Public declarations }
     pDataContabil         : String;
  end;

var
  FrmDistratoContratual: TFrmDistratoContratual;

implementation

{$R *.DFM}

uses UFuncAlienacao, Dms, uMensErro, dLookImobiliario, uSistema, fAguarde,
     uDataBase, dBaseDados, UFuncoesImob, uModuloImobiliario,
     DFinanciamento, DCAF;    

{ TFrmDistratoContratual }

procedure TFrmDistratoContratual.Selecao(n: Integer);
var sSql : String;
begin
   // Abre ContratoImovel
   qry.close;
   qry.Params[0].AsFloat := n;
   qry.Open;

   // Abre CondPagImovel
   qryCondPag.close;
   qryCondPag.Params[0].AsFloat := n;
   qryCondPag.Open;

   with dtmLookImobiliario.qryLookFormaRecPag do begin
      LimpaParametros(dtmLookImobiliario.qryLookFormaRecPag);
      ParamByName('PIDPESSOA').asInteger := qryIDPESSOA.asinteger;
      ParamByName('PRECPAG').asString := 'P';
      Open;
   end;

   with dtmLookImobiliario.qryLookContaBancaria do begin
      LimpaParametros(dtmLookImobiliario.qryLookContaBancaria);
      ParamByName('PIDPESSOA').asInteger := qryIDPESSOA.asinteger;
      Open;
   end;

   with dtmLookImobiliario.qryLookCentroCusto do begin
      LimpaParametros(dtmLookImobiliario.qryLookCentroRespon);
      ParamByName('PIDEMPRESA').asInteger := Sistema.idEmpresa;
      Open;
   end;

   // Limpa Cds de Alteradores
   // Define Sql
   sSql := 'SELECT A.IDDOCUMENTO,    A.CODALTERADOR,     A.VLRALTERADOR, '+ #13+
           '       A.TRGDTINCLUSAO,  A.TRGUSERINCLUSAO,  T.DESCRICAO,    '+ #13+
           '       T.RECPAG,         T.ACRESDECRES,      A.CODTIPIMOVEL, '+ #13+
           '       A.OBSERVACAO                                          '+ #13+
           '  FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '+ #13+
           ' WHERE A.CODALTERADOR = T.CODALTERADOR '+ #13+
           '   AND A.IDDOCUMENTO  = -2 ';

   cdsAlterador.Data := CtrlTipoImovel.GetDataPacket(sSql);

end;

procedure TFrmDistratoContratual.FormShow(Sender: TObject);
begin
  inherited;
   Selecao(-1);
   btnContinuar.Enabled := (not qry.IsEmpty);
end;

procedure TFrmDistratoContratual.qryCondPagCalcFields(DataSet: TDataSet);
begin
  inherited;
   qryCondPagcal_forma.AsString := FuncAlienacao.TipoCalculo(qryCondPagFORMACALCULO.AsInteger);

   if qryCondPagPRAZO.AsString = 'M' then
   begin
      if qryCondPagPERIODO.AsInteger = 1 then
           qryCondPagcal_PerParc.AsString := 'Mês'
      else qryCondPagcal_PerParc.AsString := 'Meses';
   end
   else
   begin
      if qryCondPagPERIODO.AsInteger = 1 then
           qryCondPagcal_PerParc.AsString := 'Ano'
      else qryCondPagcal_PerParc.AsString := 'Anos';
   end;

   if qryCondPagPERIODOTAXA.AsString = 'M' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.0000000000', qryCondPagTAXAJUROS.AsFloat) +  '% Mês';
   if qryCondPagPERIODOTAXA.AsString = 'A' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.0000000000', qryCondPagTAXAJUROS.AsFloat) +  '% Ano Simp';
   if qryCondPagPERIODOTAXA.AsString = 'C' then
        qryCondPagcal_PerTaxa.AsString := FormatFloat('##0.0000000000', qryCondPagTAXAJUROS.AsFloat) +  '% Ano Comp';

   if qryCondPagPERIODO.AsFloat = 1 then begin
      if qryCondPagPRAZO.AsString = 'M' then
           qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Mês'
      else qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Ano';
   end else begin
      if qryCondPagPRAZO.AsString = 'M' then
           qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Meses'
      else qryCondPagcal_Intervalo.AsString := FormatFloat('##0', qryCondPagPERIODO.AsFloat) +  ' Anos';
   end;

   if qryCondPagTIPOCONDPAG.AsString = 'S' then qryCondPagcal_Tipo.AsString := 'Sinal';
   if qryCondPagTIPOCONDPAG.AsString = 'V' then qryCondPagcal_Tipo.AsString := 'A Vista';
   if qryCondPagTIPOCONDPAG.AsString = 'C' then qryCondPagcal_Tipo.AsString := 'Caução';
   if qryCondPagTIPOCONDPAG.AsString = 'P' then qryCondPagcal_Tipo.AsString := 'Parc.';
   if qryCondPagTIPOCONDPAG.AsString = 'R' then qryCondPagcal_Tipo.AsString := 'Repac.';
end;

procedure TFrmDistratoContratual.molProposta1btnBuscaPropClick(
  Sender: TObject);
begin
  inherited;
   dtmMS.MS_ContratoDistratoContratual.Executar;

   Repaint;

   Screen.Cursor := crHourGlass;
   if dtmMS.MS_ContratoDistratoContratual.RetornouValor then
   begin
      iContratoSelecao := StrToInt(dtmMS.MS_ContratoDistratoContratual.ValoresChave[0]);
      Selecao(iContratoSelecao);
      edtNumProp.Text  := dtmMS.MS_ContratoDistratoContratual.ValoresChave[1];
      edtNomProp.Text  := dtmMS.MS_ContratoDistratoContratual.ValoresChave[2];
      edtNumContr.Text := dtmMS.MS_ContratoDistratoContratual.ValoresChave[1];
      edtNomContr.Text := dtmMS.MS_ContratoDistratoContratual.ValoresChave[2];
   end
   else
   begin
      Selecao(-1);
      edtNumProp.Text  := '';
      edtNomProp.Text  := '';
      edtNumContr.Text := '';
      edtNomContr.Text := '';
   end;
   Screen.Cursor := crDefault;

   btnContinuar.Enabled := (not qry.IsEmpty);

end;

procedure TFrmDistratoContratual.btnLimpaPropClick(Sender: TObject);
begin
  inherited;
   Selecao(-1);

   edtNumProp.Text := '';
   edtNomProp.Text := '';

   btnContinuar.Enabled := (not qry.IsEmpty);
end;

procedure TFrmDistratoContratual.btnContinuarClick(Sender: TObject);
var {qryAuxVerifica, }qryParcelaBaixada : TwwQuery;
    sSQL, sAcreDecres, sCond  : String;
    sIDs : string;
    sDataPeriodo, SDiaBloqueado, sDataParametro : string;
    fTotalRateio : Extended;
    i            : Integer;
begin
  inherited;

//    qryAux := TwwQuery.Create(nil);
//    qryAux.DatabaseName := 'BaseDados';

    if PagControle.ActivePage = TabSheet1 then
    begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.Sql.Add('SELECT DATABLOQUEIO FROM DIASBLOQMOD WHERE IDMODULO = 135');
      qryAux.Open;
      pDataContabil := qryAux.FieldByName('DATABLOQUEIO').AsString;      
    end;


    if PagControle.ActivePage = TabSheet1 then
    begin
       qryAux.Close;
       qryAux.Sql.Clear;
       qryAux.SQL.Add('SELECT PFI.CODDOCUMENTO ' + #13#10 +
                      ' FROM CONTRATOIMOVEL CI ' + #13#10 +
                      ' INNER JOIN CONDPAGIMOVEL CPI  ON (CPI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) '  + #13#10 +
                      'INNER JOIN PARCFINANCIMOV PFI ON (PFI.IDCONDPAGIMOVEL = CPI.IDCONDPAGIMOVEL) ' + #13#10 +
                      ' INNER JOIN ( ' + #13#10 +
                      '                SELECT LD.CODDOCUMENTO, ' + #13#10 +
                      '                SUM(DECODE(DEBCRE, ''D'', (LD.VALOR), ''C'', (LD.VALOR * -1))) AS SALDO ' + #13#10 +
                      '                FROM LANCTODOCUM LD ' + #13#10 +
                      '                INNER JOIN DOCUMENTO D ON (D.CODDOCUMENTO = LD.CODDOCUMENTO AND D.IDMODULO = 135 ) ' + #13#10 +
                      '                WHERE D.STATUS = 2 /* EXISTS ( ' + #13#10 +
                      '                                SELECT 1 ' + #13#10 +
                      '                                FROM LANCTODOCUM ' + #13#10 +
                      '                                WHERE OPERACAO = 5 ' + #13#10 +
                      '                              ) */ ' + #13#10 +
                      '                GROUP BY LD.CODDOCUMENTO ' + #13#10 +
                      '            ) TABELA ON (TABELA.CODDOCUMENTO = PFI.CODDOCUMENTO AND SALDO = 0) ' + #13#10 +
                      ' WHERE CI.IDCONTRATOIMOVEL = ' + IntToStr(iContratoSelecao) + #13#10 +
                      ' AND FLGTIPOCONTRATO = ''C'' ' + #13#10 +
                      ' AND FLGSTATUS = ''V'' AND CPI.TIPOCONDPAG = ''S'' ' + #13#10 +
                      ' AND PFI.NUMPARCELA <> 0');
       qryAux.Open;

       if not qryAux.IsEmpty then
       begin
         qryAux.Close;
         qryAux.Sql.Clear;
         qryAux.SQL.Add('SELECT LDO.NUMLANCTO, PFI.CODDOCUMENTO ' + #13#10 +
                        ' FROM CONTRATOIMOVEL CI ' + #13#10 +
                        ' INNER JOIN CONDPAGIMOVEL CPI  ON (CPI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL) '+ #13#10 +
                        ' INNER JOIN PARCFINANCIMOV PFI ON (PFI.IDCONDPAGIMOVEL = CPI.IDCONDPAGIMOVEL) ' + #13#10 +
                        ' INNER JOIN ( ' + #13#10 +
                        '                 SELECT LD.CODDOCUMENTO, ' + #13#10 +
                        '                 SUM(DECODE(DEBCRE, ''D'', (LD.VALOR), ''C'', (LD.VALOR * -1))) AS SALDO ' + #13#10 +
                        '                 FROM LANCTODOCUM LD ' + #13#10 +
                        '                 INNER JOIN DOCUMENTO D ON (D.CODDOCUMENTO = LD.CODDOCUMENTO AND D.IDMODULO = 135) ' + #13#10 +
                        '                 WHERE EXISTS ( ' + #13#10 +
                        '                                SELECT 1 ' + #13#10 +
                        '                                FROM LANCTODOCUM ' + #13#10 +
                        '                                WHERE OPERACAO = 5 ' + #13#10 +
                        '                              ) ' + #13#10 +
                        '                 GROUP BY LD.CODDOCUMENTO ' + #13#10 +
                        '             ) TABELA ON (TABELA.CODDOCUMENTO = PFI.CODDOCUMENTO AND SALDO = 0) ' + #13#10 +
                        ' INNER JOIN RECBTOPAGTO RP ON (RP.CODDOCUMENTO = TABELA.CODDOCUMENTO) ' + #13#10 +
                        ' INNER JOIN LANCTODOCUM LDO ON (LDO.CODDOCUMENTO = RP.CODDOCUMENTO)  ' + #13#10 +
                        ' WHERE CI.IDCONTRATOIMOVEL = ' + IntToStr(iContratoSelecao) + #13#10 +
                        ' AND FLGTIPOCONTRATO = ''C'' AND FLGSTATUS = ''V'' ' + #13#10 +
                        ' AND PFI.NUMPARCELA <> 0 AND CPI.TIPOCONDPAG <> ''S'' ' + #13#10 +
                        ' AND RP.DATABAIXA <= ( ' + #13#10 +
                        '                         SELECT DATABLOQUEIO ' + #13#10 +
                        '                         FROM DIASBLOQMOD WHERE IDMODULO = 135 ' + #13#10 +
                        '                     ) ');
         qryAux.Open;

//           if (qryAux.IsEmpty) then
//           begin
//                MsgDlg('Não é possível realizar um Distrato Contratual ' + #13 +
//                       'para este contrato.  ','Aviso',mtWarning,[mbOK],0);
//                btnVoltar.Click;
//                qryParc.Close;
//                qryAux.Close;
//renat                qryAux.Free;
//                Exit;
//           end;
       end;
//       qryAux.Close;

        qryParc.Close;
       with qryParc.SQL do begin
          Clear;
              Add('SELECT CI.CONNUMERO, ');
              Add('     PF.IDPARCFINANCIMOV,');
              Add('     PF.IDCONDPAGIMOVEL,');
              Add('     CP.IDCONTRATOIMOVEL,');
              Add('     CI.FLGTIPOCONTRATO,');
              Add('     IM.CODTIPIMOVEL,');
              Add('     PF.CODDOCUMENTO,');
              Add('     PF.PLNCODIGO,');
              Add('     DECODE(PF.NUMPARCELA,0,NULL,TO_CHAR(PF.NUMPARCELA) || ' + QuotedStr('/') + ' || TO_CHAR(CPFINAL.NUMPARCELAS)) AS NUMPARCELA,');
              Add('     DECODE(PF.DATAVENCIMENTO,NULL,CP.DATAINI,PF.DATAVENCIMENTO) AS DATAVENCIMENTO,');
              Add('     DECODE(NVL(PF.FLGRESIDUOINCORP,''N''),' + QuotedStr('N') + ',PF.VLRRESIDUOATUALI,0) AS VLRRESIDUOATUALI,');
              Add('     DECODE(PF.CODDOCUMENTO, NULL, DECODE(PF.FLGTIPOLANC,9,PF.VLRAMORTIZACAO,PF.VLRPRESTACAO),');
//              Add('                                  (SELECT SUM(DECODE(L.OPERACAO, 2, L.VALOR, DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR))) FROM LANCTODOCUM L WHERE L.CODDOCUMENTO = PF.CODDOCUMENTO)) AS VLRPRESTACAO,');
              Add('                                  (SELECT SUM(DECODE(L.OPERACAO, 2, L.VALOR/*, DECODE(L.DEBCRE,''D'',L.VALOR*-1,L.VALOR)*/)) FROM LANCTODOCUM L WHERE L.CODDOCUMENTO = PF.CODDOCUMENTO)) AS VLRPRESTACAO,');
              Add('     PF.VLRAMORTIZACAO,');
              Add('     PF.VLRJUROS,');
              Add('     PF.FLGTIPOLANC,');
              Add('     PF.FLGLANCINTEGRA,');
              Add('     PF.DATAPAGAMENTO,');
              Add('     PF.VLRPAGO,');
              Add('     PF.VLRPRESTCORRIG,');
              Add('     PF.VLRMULTACORRIG,');
              Add('     PF.VLRJUROSCORRIG,');
              Add('     LD1.VALOR VLRDEVIDO');
              Add('FROM');
              Add('     PARCFINANCIMOV PF,');
              Add('     CONDPAGIMOVEL  CP,');
              Add('     CONTRATOIMOVEL CI,');

              Add('     ( SELECT CXI.IDCONTRATOIMOVEL AS IDCONTRATOIMOVEL,');
              Add('              I.CODTIPIMOVEL AS CODTIPIMOVEL');
              Add('       FROM');
              Add('              CONTRATOXIMOVEL CXI,');
              Add('              IMOVEL I,');
              Add('              IMOVEL M');
              Add('       WHERE');
              Add('              CXI.IDIMOVEL = I.IDIMOVEL AND');
              Add('              I.IDIMOVELMESTRE = M.IDIMOVEL');
              Add('       GROUP BY CXI.IDCONTRATOIMOVEL, I.CODTIPIMOVEL ) IM,');

              Add('     ( SELECT A.IDCONDINICIAL,');
              Add('              A.NUMPARCELAS,');
              Add('              A.DATAINI,');
              Add('              A.IDCONDPAGIMOVEL');
              Add('       FROM   CONDPAGIMOVEL A,');
              Add('              (SELECT   IDCONDINICIAL,');
              Add('                        MAX(DATAINI) AS DATAINI');
              Add('               FROM     CONDPAGIMOVEL');
              Add('               GROUP BY IDCONDINICIAL) B');
              Add('       WHERE   B.IDCONDINICIAL = A.IDCONDINICIAL');
              Add('         AND   B.DATAINI       = A.DATAINI ) CPFINAL,');
              Add('     ( SELECT LD.CODDOCUMENTO,  SUM(DECODE(DEBCRE, ''D'', (LD.VALOR), ''C'', (LD.VALOR * -1))) AS VALOR FROM LANCTODOCUM LD ');
              Add('  INNER JOIN DOCUMENTO D ON (D.CODDOCUMENTO = LD.CODDOCUMENTO AND D.IDMODULO = 135) ');
              Add(' GROUP BY LD.CODDOCUMENTO');
              Add('      ) LD1 ');

              Add('WHERE     CI.IDCONTRATOIMOVEL = '+IntToStr(iContratoSelecao));
              Add('      AND CP.TIPOCONDPAG <> ''S''');
              Add('      AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL');
              Add('      AND PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL');
              Add('      AND PF.CODDOCUMENTO IS NOT NULL');
              Add('      AND PF.FLGLANCINTEGRA IN (2,7)');
              Add('      AND PF.FLGTIPOLANC IN (2,3,5,6,7,8,9,10)');
              Add('      AND CP.IDCONTRATOIMOVEL = IM.IDCONTRATOIMOVEL(+)');
              Add('      AND PF.IDCONDPAGIMOVEL  = CPFINAL.IDCONDINICIAL');
              Add('      AND LD1.CODDOCUMENTO(+) = PF.CODDOCUMENTO');
              Add('      AND LD1.VALOR > 0 ');
              Add('ORDER BY CP.TIPOCONDPAG, PF.NUMPARCELA');
       end;
       qryParc.SQL.SaveToFile('c:\planus\temp\parcelas.txt');
       qryParc.Open;

       qryParcAux.Close;
       with qryParcAux.SQL do begin
          Clear;
              Add('SELECT PF.IDPARCFINANCIMOV ');
              Add('FROM ');
              Add('     PARCFINANCIMOV PF, ');
              Add('     CONDPAGIMOVEL  CP, ');
              Add('     CONTRATOIMOVEL CI ');
              Add('WHERE     CI.IDCONTRATOIMOVEL = '+IntToStr(iContratoSelecao));
              Add('      AND CP.TIPOCONDPAG <> ''S''');
              Add('      AND PF.CODDOCUMENTO IS NULL ');
              Add('      AND CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL ');
              Add('      AND PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL ');
       end;
       qryParcAux.Open;

       dtmLookImobiliario.qryLookAlteradorXTipoImo.Close;
       dtmLookImobiliario.qryLookAlteradorXTipoImo.ParamByName('PCODTIPIMOVEL').AsString     := qryCondPagCODTIPIMOVEL.AsString;
       dtmLookImobiliario.qryLookAlteradorXTipoImo.ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.idEmpresa;
       dtmLookImobiliario.qryLookAlteradorXTipoImo.ParamByName('PRECPAG').AsString           := 'R';
       dtmLookImobiliario.qryLookAlteradorXTipoImo.ParamByName('PACRESDECRES').AsString      := 'C';
       dtmLookImobiliario.qryLookAlteradorXTipoImo.Open;

       cdsAlteradorXTipoImovel.Data := CtrlTipoImovel.LookupAlteradoXTipoImo(Sistema.idEmpresa, -1,
                                    qryCondPagCODTIPIMOVEL.AsString, 'P', sAcreDecres, 0);


       btnContinuar.Enabled := False;

    end
    else if PagControle.ActivePage = tabLancDesp then
    begin
       if (qryAux.IsEmpty) then
       begin
            MsgDlg('Não é possível realizar um Distrato Contratual ' + #13 +
                   'para este contrato.  ','Aviso',mtWarning,[mbOK],0);
            btnVoltar.Click;
            qryAux.Close;
            Exit;
       end;

       if (TRIM(DBcboAlterador.Text) = '') and (not qryParc.IsEmpty) then
       begin
          btnVoltar.Click;
          MsgDlg('Por favor selecione um alterador.','Aviso',mtWarning,[mbOK],0);
          Exit;
       end;

       qryImovelBem.Close;
       with qryImovelBem.Sql do
       begin
         Clear;
         Add(' SELECT  B.DESBEM, IXB.IDIMOVEL, IXB.IDBEM, SLD.DATASLDBEM, SUM(SLD.VALOR) AS VLRCONTABIL, ' + #13#10 +
             ' IMO.CODTIPIMOVEL AS TIPO, IMO.IMOCODIGO, ' + #13#10 +
             ' G.NOME AS GRUPOCONTABIL, RP.DATABAIXA -1 AS DATABAIXA ' + #13#10 +
             ' FROM IMOVELXBEM IXB ' + #13#10 +
             ' JOIN (SELECT S.IDBEM, ' + #13#10 +
             '       S.DATASLDBEM, ' + #13#10 +
             '       ((S.VALORG + (S.REAVVALORG + S.ULTREAVVALORG)) - ' + #13#10 +
             '       ((L.DEPLANC + L.REAVDEPLANC) + L.ULTREAVDEPLANC)) AS VALOR ' + #13#10 +
             '       FROM SALDOCONTABBEM S, SLDCTBBEMXDEP L ' + #13#10 +
             '       WHERE S.DATASLDBEM = ' + #13#10 +
             '       (SELECT MAX(DATASLDBEM) ' + #13#10 +
             '         FROM SALDOCONTABBEM S1 ' + #13#10 +
             '         WHERE S1.IDBEM = S.IDBEM ' + #13#10 +
             '         AND S1.DATASLDBEM <= ' + #13#10 +
             '         (SELECT MAX(HM.DATAMOVIMENTACAO - 1) ' + #13#10 +
             '          FROM HISTORICOMOVIMENTACAO HM ' + #13#10 +
             '          WHERE HM.IDBEM = S1.IDBEM ' + #13#10 +
             '          AND HM.IDTIPOMOVIMENTACAO = 6)) ' + #13#10 +
             ' AND L.IDBEM = S.IDBEM ' + #13#10 +
             ' AND L.DATASLDBEM = S.DATASLDBEM ' + #13#10 +
             ' AND ((S.VALORG + (S.REAVVALORG + S.ULTREAVVALORG)) - ' + #13#10 +
             ' ((L.DEPLANC + L.REAVDEPLANC) + L.ULTREAVDEPLANC)) >= 0) SLD ' + #13#10 +
             ' ON SLD.IDBEM = IXB.IDBEM ' + #13#10 +
             ' JOIN CONTRATOXIMOVEL CXI ' + #13#10 +
             ' ON CXI.IDIMOVEL = IXB.IDIMOVEL ' + #13#10 +
             ' JOIN BEM B ON B.IDBEM = SLD.IDBEM ' + #13#10 +
             ' JOIN GRUPO G ON G.IDGRUPO = B.IDGRUPO ' + #13#10 +
             ' AND CXI.IDCONTRATOIMOVEL = ' + IntToStr(iContratoSelecao) + #13#10 +
             ' INNER JOIN CONDPAGIMOVEL CPI ON (CPI. IDCONTRATOIMOVEL = CXI.IDCONTRATOIMOVEL AND CPI.TIPOCONDPAG = ''S'') ' + #13#10 +
             ' INNER JOIN PARCFINANCIMOV PFI ON (PFI.IDCONDPAGIMOVEL = CPI.IDCONDPAGIMOVEL AND PFI.NUMPARCELA <> 0 ) ' + #13#10 +
             ' INNER JOIN RECBTOPAGTO RP ON (RP.CODDOCUMENTO = PFI.CODDOCUMENTO) ' + #13#10 +
             ' INNER JOIN IMOVEL IMO ON (IMO.IDIMOVEL = IXB.IDIMOVEL) ' + #13#10 +
             ' GROUP BY  B.DESBEM, IXB.IDIMOVEL, IXB.IDBEM, SLD.DATASLDBEM,  IMO.IMOCODIGO, ' + #13#10 +
             ' IMO.CODTIPIMOVEL, ' + #13#10 +
             ' G.NOME, RP.DATABAIXA ');
       end;
       qryImovelBem.Open;

       sCond := 'AND PF.IDCONDPAGIMOVEL IN (';

       qryCondPag.First;
       while not qryCondPag.eof do
       begin
          // Monta a clausula IN para cada condição selecionada
          sCond := sCond + FormatFloat('#0',qryCondPagIDCONDINICIAL.asFloat) + ',';

          qryCondPag.Next;
       end;
       qryCondPag.First;

       sCond := Copy(sCond,1,Length(sCond)-1) + ')';

 

       qryAux.Close;
       qryAux.Sql.Clear;
       qryAux.Sql.Add('SELECT');
       qryAux.Sql.Add('     (SELECT SUM(DECODE(L.OPERACAO, 2, DECODE(L.DEBCRE,''D'',0,L.VALOR), DECODE(L.DEBCRE,''D'',0,L.VALOR))) FROM LANCTODOCUM L WHERE L.CODDOCUMENTO = PF.CODDOCUMENTO) AS VLRTOTAL');
       qryAux.Sql.Add('FROM');
       qryAux.Sql.Add('     PARCFINANCIMOV PF,');
       qryAux.Sql.Add('     CONDPAGIMOVEL  CP,');
       qryAux.Sql.Add('     CONTRATOIMOVEL CI');
       qryAux.Sql.Add('WHERE');
       qryAux.Sql.Add('         (PF.FLGTIPOLANC IN (2,3,5,6,7,8,9))');
       qryAux.Sql.Add('     AND (PF.FLGCONCILIADO IS NULL OR PF.FLGCONCILIADO IN( ' + QuotedStr('N') + ','+ QuotedStr('P') + ') )');
       qryAux.Sql.Add('     AND (CP.TIPOCONDPAG      = ''S'')');
       qryAux.Sql.Add('     AND (PF.IDCONDPAGIMOVEL  = CP.IDCONDPAGIMOVEL)');
       qryAux.Sql.Add('     AND (CI.IDCONTRATOIMOVEL = CP.IDCONTRATOIMOVEL)');
       qryAux.Sql.Add('    '+sCond);
       qryAux.Open;

       qryAux.Close;

       qryAux.Sql.Clear;
       qryAux.Sql.Add('SELECT T.DESCCUSTORECIMO FROM TIPOCUSTORECIMOV T WHERE T.IDTIPOCUSTORECIMO = 174');
       qryAux.Open;

       qryAux.Close;

       qryAux.Free;
       btnConfirmar.Enabled := True;
    end;

       // verifica se o vencimento escolhido é um dia inútil
       if ModuloImobiliario.AdminImob.bFlgDiaUtilAP then begin
          begin
             btnVoltar.Click;
             MsgDlg('A Data de Vencimento deve corresponder a um dia útil!','Aviso',mtWarning,[mbOK],0);
             Exit;
          end;
       end;


       with dtmLookImobiliario do begin
          LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
          qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := qryCondPagCODTIPIMOVEL.AsString;
          qryLookTipoImovel.Open;
       end;

       if not RateiaGrupos then
       begin
          btnVoltar.Click;
          Exit;
       end;

       TotalizaRateio( fTotalRateio );
end;

procedure TFrmDistratoContratual.qryParcCalcFields(DataSet: TDataSet);
begin
  inherited;
   qryParcCAL_TIPO.AsString := FuncAlienacao.TipoParcela(qryParcFLGTIPOLANC.AsInteger, qryParcFLGLANCINTEGRA.AsInteger);
end;

procedure TFrmDistratoContratual.FormCreate(Sender: TObject);
begin
  inherited;

   CtrlTipoImovel        := TCtrlTipoImovel.Create;
   CtrlTipoImovel.InitializeAs( Padroes );

   CtrlPadrLancImovel  := TCtrlPadrLancIMovel.Create(Sistema.IdEmpresa, Sistema.IdModulo);
   CtrlPadrLancImovel.InitializeAs( Padroes );

   CtrlDomBem := TCtrlDomBem.Create;
   CtrlDomBem.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True );


   CtrlContratoImovel := Tctrlcontratoimovel.Create(Sistema.IdEmpresa, sistema.IdModulo, Sistema.IdUsuario,
                         Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);
   CtrlContratoImovel.InitializeAs(Padroes);

   CtrlHistMovBem  := TCtrlHistMovBem.Create;
   CtrlHistMovBem.InitializeAs( Padroes );

   CtrlBem   := TCtrlBem.Create;
   CtrlBem.InitializeAs( Padroes );

   ComunsImobiliarioDB := TComunsImobiliarioDB.Create(Sistema.IdEmpresa, Sistema.IdModulo,
                                                      Sistema.IdUsuario, Sistema.IdEspAcesso,
                                                      Sistema.UsaPlanoPatro);

   ComunsImobiliarioDB.InitializeAs( Padroes );

   CtrlParamCAF    := TCtrlParamCAF.Create;
   CtrlParamCAF.InitializeAs( Padroes );

   CtrlFechamentoProRata := TCtrlFechamentoProRata.Create(nil);
   CtrlFechamentoProRata.InitializeAs(Padroes);

end;

procedure TFrmDistratoContratual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   FreeAndNil(CtrlTipoImovel);
   FreeAndNil(CtrlBem);
   FreeAndNil(CtrlPadrLancImovel);
   FreeAndNil(CtrlDomBem);
   FreeAndNil(CtrlHistMovBem);
   FreeAndNil(CtrlParamCAF);
end;

function TFrmDistratoContratual.Verificapreenchimento: boolean;
var
  iDia, iMes, iAno, iDifMeses, iAnoComp, iMesComp: word;

  // Marcio Motta - 18/02/2004 - Pendência: 16112
  iAnoLancContab, iMesLancContab, iDiaLancContab: word;
  //------- Fim Implementação/Alteração - Marcio Motta -------------------------------

  dDia1, dDia2: TDateTime;
  iAnoMesContab, iAnoMesIniCtb, iAnoMesFimCtb : Integer;
begin
   Result := False;
   try
      iAnoMesContab := StrToInt(FormatFloat('0999',iAnoLancContab) + FormatFloat('09',iMesLancContab));
      iAnoMesIniCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));
      iAnoMesFimCtb := StrToInt(FormatFloat('0999',iAno) + FormatFloat('09',iMes));

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;

procedure TFrmDistratoContratual.rdgAcreDescClick(Sender: TObject);
VAR sAcreDecres : String;
begin
  inherited;
   cdsAlteradorXTipoImovel.Data := CtrlTipoImovel.LookupAlteradoXTipoImo(Sistema.idEmpresa, -1, qryCondPagCODTIPIMOVEL.AsString, 'P', sAcreDecres);
end;

procedure TFrmDistratoContratual.btnExcluiAlteradorClick(Sender: TObject);
begin
  inherited;
   if not cdsAlterador.IsEmpty then cdsAlterador.Delete;
end;

function TFrmDistratoContratual.AtualizaLancImovel : Boolean;
var
   fTotGrupo, fMaior, fDiferenca, fTotalPercent: Extended;
begin
   Result := True;

   cdsImoveis.DisableControls;

   fTotGrupo     := 0;
   fTotalPercent := 0;
   fMaior        := 0;
   cdsImoveis.First;
   while not cdsImoveis.Eof do begin

      if cdsImoveisVLRIMOVEL.AsFloat > 0 then begin
         if fMaior < cdsImoveisVLRIMOVEL.AsFloat then
            fMaior := cdsImoveisVLRIMOVEL.AsFloat;

         fTotGrupo   := fTotGrupo + cdsImoveisVLRIMOVEL.AsFloat;
         fTotalPercent := fTotalPercent + cdsImoveisPERCENTUAL.AsFloat;
      end;
      cdsImoveis.Next;
   end;

   // apurar o valor da diferença do rateio
   fTotGrupo := ComunsImobiliario.Arredonda(fTotGrupo,2);

   // acertar a diferença no maior grupo
   cdsImoveis.First;
   // tolerar uma diferença de no máximo R$ 2,00
   if (fDiferenca >= -2) and (fDiferenca <= 2) then begin
      while (fDiferenca <> 0) do begin
         if cdsImoveisVLRIMOVEL.AsFloat = fMaior then begin
            cdsImoveis.Edit;
            cdsImoveisVLRIMOVEL.AsFloat := cdsImoveisVLRIMOVEL.AsFloat + fDiferenca;
            cdsImoveis.Post;
            fDiferenca := 0;
         end;
         cdsImoveis.Next
      end;
   end else begin
      MsgDlg(FormatFloat ('Verificar valores lançados, apurada diferença de: #,##0.00', fDiferenca),'Aviso',mtwarning,[mbok],0);
      Result := False;
   end;

   if fTotGrupo = 0 then
   begin
      MsgDlg('Verificar valores lançados, o total apurado está zerado!','Aviso',mtwarning,[mbok],0);
      Result := False;
   end;

   cdsImoveis.EnableControls;
end;

procedure TFrmDistratoContratual.fcShapeBtn4Click(Sender: TObject);
var fTotalRateio : Extended;
begin
  inherited;
//   edtTotalLanc.value := 0;
   AtualizaLancImovel;
   TotalizaRateio( fTotalRateio );
end;

procedure TFrmDistratoContratual.btnConfirmarClick(Sender: TObject);
var sMsg: string;
    iFlgPai, iPos, iIdFormaRecPag, iIdCtaBanco : Integer;
    nSeqHist : Extended;
    dIniCtbDiaria, dFimCtbDiaria : TDateTime;
    iPlnCodigo, iPln, iPlnEstorno : Double;
    qryAux, qryUpdate, qryAux1, qryBuscaMovBaixa, qryBuscaTipoMovBaixa  : TwwQuery;
    _cdsBem,_cdsBemxDep, _cdsBemxMoeda  : TClientDataSet;
    _cdsReavaliacao, _cdsReavalxMoeda, _cdsReavalxDep : TClientDataSet;
    _cdsAcrescimoValor, _cdstemp, _cdsAcrescValorxMoeda, _cdsAcrescValorxDep : TClientDataSet;
    bResult    : Boolean;
    CtrlLancamentosImovel : TCtrlLancamentosImovel;
    CtrlMovBaixa          : TCtrlImobMovBaixa;
    CalcDocumento         : TCalcDocumento;
    nValResult, nValVenda, nSldContabil : Currency;
    sSql, psSql : String;
begin
   try
      if (dteDataDistrato.Text = EmptyStr) then
      begin
          MsgDlg('Preencha a Data do Distrato.','Aviso',mtWarning,[mbOK],0);
          Exit;
      end;

      if (dteDataDistrato.Date < qryImovelBem.FieldByName('DATABAIXA').AsDateTime) then
      begin
          MsgDlg('A Data do Distrato tem que ser maior que a Data da Baixa!','Aviso',mtWarning,[mbOK],0);
          Exit;
      end;

      if (dteDataDistrato.Date <=  StrToDate(pDataContabil)) then
      begin
          MsgDlg('Período contábil fechado. Informe outra Data do Distrato. ','Aviso',mtWarning,[mbOK],0);
          Exit;
      end;

//      while not qryParc.eof do
//      begin
//        if (qryImovelBem.FieldByName('DATABAIXA').AsDateTime < StrToDate(pDataContabil)) then
//        begin
//            MsgDlg('Não é possível realizar um Distrato Contratual para este contrato.','Aviso',mtWarning,[mbOK],0);
//            Exit;
//        end;
//        qryParc.Next;
//      end;

      FrmAguarde.Mostra('Verificando e validando as parametrizações.    ');

      qryAux := TwwQuery.Create(nil);
      qryAux.DatabaseName := 'BaseDados';

      qryAux1 := TwwQuery.Create(nil);
      qryAux1.DatabaseName := 'BaseDados';

      qryBuscaMovBaixa := TwwQuery.Create(nil);
      qryBuscaMovBaixa.DatabaseName := 'BaseDados';

      qryBuscaTipoMovBaixa := TwwQuery.Create(nil);
      qryBuscaTipoMovBaixa.DatabaseName := 'BaseDados';

      qryUpdate := TwwQuery.Create(nil);
      qryUpdate.DatabaseName := 'BaseDados';

      _cdsBem       := TClientDataSet.Create(nil);
      _cdsBemxMoeda := TClientDataSet.Create(nil);
      _cdsBemxDep   := TClientDataSet.Create(nil);
      _cdsReavaliacao:= TClientDataSet.Create(nil);
      _cdsReavalxMoeda:=TClientDataSet.Create(nil);
      _cdsReavalxDep := TClientDataSet.Create(nil);
      _cdsAcrescimoValor := TClientDataSet.Create(nil);
      _cdsAcrescValorxMoeda := TClientDataSet.Create(nil);
      _cdsAcrescValorxDep  := TClientDataSet.Create(nil);

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.ADD('SELECT BEM.IDBEM, BEM.IDPESSOA, BEM.IDMODULO, BEM.IDGRUPO, BEM.IDCONJUNTO, '+
                     '       BEM.UNIDNEGOC, CONJUNTO.IDRESPONSAVEL, CONJUNTO.IDLOCALIZACAO '+
                     '  FROM BEM, CONJUNTO '+
                     ' WHERE BEM.IDCONJUNTO = CONJUNTO.IDCONJUNTO(+) AND '+
                     '  BEM.IDBEM IN ( '+
                     'SELECT IMOVELXBEM.IDBEM FROM IMOVELXBEM WHERE IMOVELXBEM.IDIMOVEL = '+cdsImoveis.FieldByName('IDIMOVEL').AsString+')');
      qryAux.Open;

      qryAux.First;
      while not qryAux.eof do
      begin
          qryBuscaMovBaixa.Close;
          qryBuscaMovBaixa.SQL.Clear;
          qryBuscaMovBaixa.SQL.ADD('SELECT 1 '+
                                   '  FROM HISTORICOMOVIMENTACAO H, VLRHISTMOVBEM V ' +
                                   ' WHERE H.IDBEM = '+qryAux.FieldByName('IDBEM').AsString +
                                   '   AND H.IDMOVIMENTACAO   = V.IDMOVIMENTACAO ' +
                                   '   AND H.IDTIPOMOVIMENTACAO > 0 ' +
                                   '   AND H.IDTIPOMOVIMENTACAO <> 200 ' +
                                   '   AND H.DATAMOVIMENTACAO = (SELECT MAX(HM.DATAMOVIMENTACAO) ' +
                                   '                               FROM HISTORICOMOVIMENTACAO HM ' +
                                   '                              WHERE HM.IDBEM = '+qryAux.FieldByName('IDBEM').AsString +
                                   '                                AND HM.IDTIPOMOVIMENTACAO > 0' +
                                   '                                AND HM.IDTIPOMOVIMENTACAO <> 200)');
          qryBuscaMovBaixa.Open;
          if qryBuscaMovBaixa.IsEmpty then
          begin
             qryAux.Close;
             qryBuscaMovBaixa.Close;          
             raise exception.Create( 'Não foi encontrado a movimentação de baixa do BEM. Por favor Verificar!' );
          end;

          qryBuscaTipoMovBaixa.Close;
          qryBuscaTipoMovBaixa.SQL.Clear;
          qryBuscaTipoMovBaixa.SQL.ADD('SELECT 1 FROM TIPOMOVIMENTACAO T '+
                                       ' WHERE T.IDTIPOMOVREFCIRC IN (' +
                                       'SELECT H.IDTIPOMOVIMENTACAO ' +
                                       '  FROM HISTORICOMOVIMENTACAO H, VLRHISTMOVBEM V ' +
                                       ' WHERE H.IDBEM = '+qryAux.FieldByName('IDBEM').AsString +
                                       '   AND H.IDMOVIMENTACAO   = V.IDMOVIMENTACAO ' +
                                       '   AND H.IDTIPOMOVIMENTACAO > 0 ' +
                                       '   AND H.IDTIPOMOVIMENTACAO <> 200 ' +
                                       '   AND H.DATAMOVIMENTACAO = (SELECT MAX(HM.DATAMOVIMENTACAO) ' +
                                       '                               FROM HISTORICOMOVIMENTACAO HM ' +
                                       '                              WHERE HM.IDBEM = '+qryAux.FieldByName('IDBEM').AsString +
                                       '                                AND HM.IDTIPOMOVIMENTACAO > 0' +
                                       '                                AND HM.IDTIPOMOVIMENTACAO <> 200))');
          qryBuscaTipoMovBaixa.Open;
          if qryBuscaTipoMovBaixa.IsEmpty then
          begin
             qryAux.Close;
             qryBuscaTipoMovBaixa.Close;
             qryBuscaMovBaixa.Close;
             raise exception.Create( 'Não foi encontrado parametrização do DESFAZER da baixa do BEM. Por favor cadastrar!' );
          end;
          qryBuscaTipoMovBaixa.Close;
          qryBuscaMovBaixa.Close;

          _cdsBemxMoeda.Data := CtrlBem.ListaBemxMoeda(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);

          //----------------------------------------------------------------------------------
          // saldo contábil
          //----------------------------------------------------------------------------------
          _cdsBemxMoeda.First;
          while not _cdsBemxMoeda.EOF do
          begin
             _cdsBemxDep.Data := CtrlBem.ListaBemxDep(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
             //-------------------------------------------------------------------------------
             // Verifica se há o saldo contábil no dia
             //-------------------------------------------------------------------------------
             _cdsBemxDep.First;
             while not _cdsBemxDep.EOF do
             begin
                if _cdsBemxDep.FieldByName('MOECODIGO').AsInteger = _cdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
                begin
                   qryAux1.Close;
                   qryAux1.SQL.Clear;
                   qryAux1.SQL.ADD('SELECT 1 FROM SALDOCONTABBEM S WHERE '+
                                   '       S.IDBEM      = '+qryAux.FieldByName('IDBEM').AsString+
                                   '   AND S.IDPESSOA   = '+qryAux.FieldByName('IDPESSOA').AsString+
                                   '   AND S.DATASLDBEM = to_date('+ QuotedStr(DateToSTr(dteDataDistrato.Date)) +',''dd/mm/yyyy'')'+
                                   '   AND S.MOECODIGO  = '+_cdsBemxMoeda.FieldByName('MOECODIGO').AsString);
                   qryAux1.Open;

                   if not qryAux1.IsEmpty then
                   begin
                      qryAux.Close;
                      qryAux1.Close;
                      _cdsBemxMoeda.Close;
                      _cdsBemxDep.Close;
                      Raise Exception.Create('Já existe atualização de Saldo Contábil do BEM para o dia '+QuotedStr(DateToSTr(dteDataDistrato.Date))+'.'+#13+
                                             'Por favor verifique a data de Lançamento!');
                   end;
                   qryAux1.Close;
                end;
                _cdsBemxDep.Next;
             end;
             _cdsBemxDep.Close;
             _cdsBemxMoeda.Next;
          end;
          _cdsBemxMoeda.Close;

          qryAux.Next;
      end;

      if qryFLGTIPOCONTRATO.AsString = 'C' then
      begin
         // Inicializa Parametros para contabilização
         if not InicializaParam(qryCondPagCODTIPIMOVEL.AsString,'R',
                                ModuloImobiliario.Alienacao.iTipoRecAmortiz) then
           raise exception.Create( 'Problema ao Inicializar Parâmetros para contabilização.' );
      end
      else
      begin
         // Inicializa Parametros para contabilização                             
         if not InicializaParam(qryCondPagCODTIPIMOVEL.AsString,'R',
                                ModuloImobiliario.Alienacao.iTipoRecAmortAC) then
           raise exception.Create( 'Problema ao Inicializar Parâmetros para contabilização.' );
      end;

{      if not CtrlParamCAF.CarregaProp(Sistema.IdEmpresa) then
         Raise Exception.Create('Parâmetros do sistema inválidos!');
 }
      CtrlLancamentosImovel := TCtrlLancamentosImovel.Create(Sistema.IdEmpresa,
                                                             Sistema.IDModulo,
                                                             Sistema.IdUsuario,
                                                             Sistema.IdEspAcesso,
                                                             Sistema.UsaPlanoPatro);
      CtrlLancamentosImovel.InitializeAs(Padroes);

      CtrlMovBaixa := TCtrlImobMovBaixa.Create;
      CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True);

      bResult := True;

      btnConfirmar.Enabled := False;

      // Inicializa campos opcionais
      iIdFormaRecPag := -1;
      iIdCtaBanco    := -1;
      dIniCtbDiaria  := -1;
      dFimCtbDiaria  := -1;

      qryParamGlobal.close;
      qryParamGlobal.ParamByName('PIDPESSOA').asInteger := Sistema.idEmpresa;
      qryParamGlobal.Open;

      FrmAguarde.Mostra('Processando Lançamentos Imóvel.                ');

      if not dtmBaseDados.dbBaseDados.InTransaction then
         StartTransacao;

      // Grava o registro na LancamentosImovel
//      if not CtrlLancamentosImovel.Inserir(StrToInt(FormatDateTime('MM', dteDataDistrato.Date)),
//                                           StrToInt(FormatDateTime('YYYY', dteDataDistrato.Date)),
//                                           qryIDLOCATARIO.AsInteger,
//                                           qryAux.FieldByName('IDTIPOCUSTORECIMO').AsInteger{Devolução de sinal},
//                                           iIdFormaRecPag,
//                                           -1,
//                                           -1,
//                                           iIdCtaBanco,
//                                           qryParamGlobalMOEDACORRENTE.asInteger,
//                                           0,
//                                           -1,
//                                           0,
//                                           qryParcVLRDEVIDO.Value,
//                                           qryParcVLRDEVIDO.Value,
//                                           'M',     // M = Lançamentos Múltiplos
//                                           'P',     // P = Contas a Pagar
//                                           dteDataDistrato.Text,
//                                           'Distrato Contratual',
//                                           '',
//                                           '',
//                                           dteDataDistrato.Date,
//                                           dteDataDistrato.Date,
//                                           dIniCtbDiaria,
//                                           dFimCtbDiaria,
//                                           _cds.Data,
//                                           cdsAlterador.Data,
//                                           chkIntegra.Checked, false ) then
//        raise exception.Create( CtrlLancamentosImovel.MessageInfo );
//      qryParamGlobal.Close;


      qryParc.First;

      iPos := 0;
      FrmAguarde.Min := 0;
      FrmAguarde.Max := qryParc.RecordCount;
      FrmAguarde.Pos := 0;

      Application.ProcessMessages;

      qryParc.First;
      while not qryParc.Eof do begin

         if not qryParcCODDOCUMENTO.IsNull then
              FrmAguarde.Mostra('Processando Documento ' + qryParcCODDOCUMENTO.AsString + '                         ')
         else FrmAguarde.Mostra('Processando ...                                ');

         iPos := iPos + 1;
         FrmAguarde.Pos := iPos;
         Application.ProcessMessages;

         bResult := BaixaPorAlterador(qryParcCODDOCUMENTO.AsInteger, qryParcVLRDEVIDO.AsFloat,
                                      iContratoSelecao, iPlnCodigo);
         if not bResult then
            raise exception.Create( 'Problema na baixa por Alterador.' );

         // Apaga o motivo anterior para limpar sujeiras ( caso o documento original tenha mudado no CAR )
         CalcDocumento.ApagarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger, 'R');
         // Grava o motivo de conciliação
         CalcDocumento.GravarMotivoConciliacao(-1, qryParcIDPARCFINANCIMOV.AsInteger, Sistema.IdUsuario, -1, -1,
                                               null, (0),
                                               'Distrato Contratual ', 'R', dteDataDistrato.Date);
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.ADD('UPDATE PARCFINANCIMOV SET PARCFINANCIMOV.FLGLANCINTEGRA = ''9'', PARCFINANCIMOV.FLGTIPOLANC = ''3'' WHERE '+
//                        ' PARCFINANCIMOV.CODDOCUMENTO IS NULL AND ' +
                        ' PARCFINANCIMOV.IDPARCFINANCIMOV = '+qryParcIDPARCFINANCIMOV.AsString);
         qryAux.ExecSQL;
         qryAux.Close;

         qryParc.Next;
      end;

      qryParc.First;
      if qryParc.RecordCount < qryParcAux.RecordCount then
      begin
        qryParcAux.First;
        while not qryParcAux.eof do
        begin
           qryParc.First;
           qryParc.Locate('IDPARCFINANCIMOV',qryParcAux.FieldByName('IDPARCFINANCIMOV').AsInteger,[]);
           If qryParc.FieldByName('IDPARCFINANCIMOV').AsInteger = qryParcAux.FieldByName('IDPARCFINANCIMOV').AsInteger then
           begin
              qryParcAux.Next;
              Continue;
           end;
           // Apaga o motivo anterior para limpar sujeiras ( caso o documento original tenha mudado no CAR )
           CalcDocumento.ApagarMotivoConciliacao(-1, qryParcAux.FieldByName('IDPARCFINANCIMOV').AsInteger, 'R');
           // Grava o motivo de conciliação
           CalcDocumento.GravarMotivoConciliacao(-1, qryParcAux.FieldByName('IDPARCFINANCIMOV').AsInteger, Sistema.IdUsuario, -1, -1,
                                               null, (0),
                                               'Distrato Contratual', 'R', dteDataDistrato.Date);

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.ADD('UPDATE PARCFINANCIMOV SET PARCFINANCIMOV.FLGLANCINTEGRA = ''9'', PARCFINANCIMOV.FLGTIPOLANC = ''3'' WHERE '+
//                            ' PARCFINANCIMOV.CODDOCUMENTO IS NULL AND ' +
                            ' PARCFINANCIMOV.IDPARCFINANCIMOV = '+qryParcAux.FieldByName('IDPARCFINANCIMOV').AsString);
           qryAux.ExecSQL;
           qryAux.Close;
           qryParcAux.Next;
         end;
         qryParcAux.Close;
      end;

      //Contrato Reincidido
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.ADD('UPDATE CONTRATOIMOVEL SET CONTRATOIMOVEL.FLGSTATUS = ''R'' WHERE '+
                     'CONTRATOIMOVEL.IDCONTRATOIMOVEL = '+IntToStr(iContratoSelecao));
      qryAux.ExecSQL;
      qryAux.Close;

      //Ativar o Imóvel
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.ADD('UPDATE IMOVEL SET IMOVEL.FLGSTATUS = ''N'', IMOVEL.FLGATIVO = ''1'' WHERE IMOVEL.IDIMOVEL = '+cdsImoveis.FieldByName('IDIMOVEL').AsString);
      qryAux.ExecSQL;
      qryAux.Close;

      LimpaParametros(qryInsertEventoImovel);
      qryInsertEventoImovel.ParamByName('PIDEVENTOIMOVEL').AsInteger := LeUltRegistro(nil, 'EVENTOIMOVEL');;
      qryInsertEventoImovel.ParamByName('PEVICABECALHO').AsString    := 'Distrato Contratual';
      qryInsertEventoImovel.ParamByName('PEVIDESCRICAO').AsString    := 'Distrato Contratual';
      qryInsertEventoImovel.ParamByName('PEVIDATA').AsDate           := dteDataDistrato.Date;
      qryInsertEventoImovel.ParamByName('PIDUSUARIO').AsInteger      := Sistema.IdUsuario;
      qryInsertEventoImovel.ParamByName('PFLGTIPOEVENTO').AsString   := 'DC'; // Marcio Sanches Verificar
      qryInsertEventoImovel.ParamByName('PIDIMOVEL').AsInteger       := cdsImoveis.FieldByName('IDIMOVEL').AsInteger;
      qryInsertEventoImovel.ExecSQL;
      qryInsertEventoImovel.Close;

      //Ativa o imóvel na carteira imobiliária;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.ADD('UPDATE BEM SET BEM.BAIXATOTAL = ''N'', BEM.PROPBAIXA = 0 WHERE BEM.IDBEM IN ( '+
                     'SELECT IMOVELXBEM.IDBEM FROM IMOVELXBEM WHERE IMOVELXBEM.IDIMOVEL = '+cdsImoveis.FieldByName('IDIMOVEL').AsString+')');
      qryAux.ExecSQL;
      qryAux.Close;

      // Eefetua o estono no CAF primeiro
{      bResult := DesfazCAF;

      if not bResult then
         raise Exception.Create('Ocorreu um problema ao desfazer o contrato gerado.');
}
      //criar a entrada por devolução de sinal da historicomovimentacao
      // Registra na tabela HISTORICOMOVIMENTACAO
      //-------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.ADD('SELECT BEM.IDBEM, BEM.IDPESSOA, BEM.IDMODULO, BEM.IDGRUPO, BEM.IDCONJUNTO, '+
                     '       BEM.UNIDNEGOC, CONJUNTO.IDRESPONSAVEL, CONJUNTO.IDLOCALIZACAO '+
                     '  FROM BEM, CONJUNTO '+
                     ' WHERE BEM.IDCONJUNTO = CONJUNTO.IDCONJUNTO(+) AND '+
                     '  BEM.IDBEM IN ( '+
                     'SELECT IMOVELXBEM.IDBEM FROM IMOVELXBEM WHERE IMOVELXBEM.IDIMOVEL = '+cdsImoveis.FieldByName('IDIMOVEL').AsString+')');
      qryAux.Open;

      FrmAguarde.Min := 0;
      FrmAguarde.Max := qryAux.RecordCount;
      FrmAguarde.Pos := 0;

      FrmAguarde.Mostra('Desfazer da Baixa do Histórico de Movimentação.');
      Application.ProcessMessages;

      while not qryAux.eof do
      begin
          iPos := iPos + 1;
          FrmAguarde.Pos := iPos;
          Application.ProcessMessages;

          qryBuscaMovBaixa.Close;
          qryBuscaMovBaixa.SQL.Clear;
          qryBuscaMovBaixa.SQL.ADD('SELECT H.*,V.* '+
                                   '  FROM HISTORICOMOVIMENTACAO H, VLRHISTMOVBEM V ' +
                                   ' WHERE H.IDBEM = '+qryAux.FieldByName('IDBEM').AsString +
                                   '   and H.IDMOVIMENTACAO   = V.IDMOVIMENTACAO ' +
                                   '   and H.IDTIPOMOVIMENTACAO > 0 ' +
                                   '   and H.IDTIPOMOVIMENTACAO <> 200 ' +
                                   '   and H.DATAMOVIMENTACAO = (SELECT MAX(HM.DATAMOVIMENTACAO) ' +
                                   '                               FROM HISTORICOMOVIMENTACAO HM ' +
                                   '                              WHERE HM.IDBEM = '+qryAux.FieldByName('IDBEM').AsString +
                                   '                                AND HM.IDTIPOMOVIMENTACAO > 0' +
                                   '                                AND HM.IDTIPOMOVIMENTACAO <> 200)');
          qryBuscaMovBaixa.Open;

          if qryBuscaMovBaixa.IsEmpty then
             raise exception.Create( 'Não foi possível encontrar a movimentação de baixa. Por favor Verificar!' );

          iPln := 0;
          qryBuscaMovBaixa.First;
          while not qryBuscaMovBaixa.eof do
          begin
             qryBuscaTipoMovBaixa.Close;
             qryBuscaTipoMovBaixa.SQL.Clear;
             qryBuscaTipoMovBaixa.SQL.ADD('SELECT T.* FROM TIPOMOVIMENTACAO T '+
                                          ' WHERE T.IDTIPOMOVREFCIRC = '+qryBuscaMovBaixa.FieldByName('IDTIPOMOVIMENTACAO').AsString);
             qryBuscaTipoMovBaixa.Open;
             if qryBuscaTipoMovBaixa.IsEmpty then
             begin
                qryBuscaMovBaixa.Next;
                Continue;
             end;

             nSeqHist := CtrlHistMovBem.RegistraHistMovBem(qryAux.FieldByName('IDBEM').AsFloat,    // IDBEM
                                                           qryAux.FieldByName('IDPESSOA').AsFloat, // IDPESSOA
                                                           qryAux.FieldByName('IDMODULO').AsFloat, // IDMODULO
                                                           qryBuscaTipoMovBaixa.FieldByName('IDTIPOMOVIMENTACAO').AsInteger,// IDTIPOMOVIMENTACAO
                                                           dteDataDistrato.Date,                       // DATAMOVIMENTACAO
                                                           -1,                                     // IDREAVALACRESC
                                                           -1,                                     // DATAULTDEP
                                                           -1,                                     // IDGRUPANT
                                                           -1,                                     // IDCONJANT
                                                           -1,                                     // IDLOCALANT
                                                           -1,                                     // IDRESPANT
                                                           -1,                                     // PLACAANT
                                                           -1,                                     // PLNCODIGO
                                                           '',                                     // OBSREAVAL
                                                           1 {- [DataMovimentacao]},               // TIPDEPPRORATA
                                                           -1,                                     // IDTIPODESPESA
                                                           '',                                     // OBSACRESCIMO
                                                           13{Devolucao de Sinal},                 // IDMOTIVOBAIXA
                                                           0,                                      // PROPBAIXA
                                                           0,                                      // VALVENDAOFI
                                                           '');                                    // OBSBAIXA
             if nSeqHist = -1 then
                Raise Exception.Create(CtrlHistMovBem.MessageInfo);

             //-------------------------------------------------------------------------------
             // Registra o valor no histórico
             //-------------------------------------------------------------------------------
             if not CtrlHistMovBem.RegistraVlrHistMovBem(nSeqHist,
                                                         qryBuscaMovBaixa.FieldByName('MOECODIGO').AsInteger,
                                                         0,
                                                         qryBuscaMovBaixa.FieldByName('VALOR').AsFloat) then
                Raise Exception.Create(CtrlHistMovBem.MessageInfo);

             //-------------------------------------------------------------------------------
             // Executa o estorno contábil da baixa, caracterizando o desfazer da baixa
             //-------------------------------------------------------------------------------
             if ((iPln <> qryBuscaMovBaixa.FieldByName('PLNCODIGO').AsFloat) and
                 (qryBuscaMovBaixa.FieldByName('PLNCODIGO').AsFloat > 0)) then
             begin
                if Not CtrlMovBaixa.EstornaContabilCaf(Sistema.IdUsuario,
                                                       qryBuscaMovBaixa.FieldByName('PLNCODIGO').AsFloat,
                                                       qryBuscaMovBaixa.FieldByName('IDMODULO').AsFloat,
                                                       Sistema.IdEmpresa,
                                                       DateToStr(dteDataDistrato.Date)) Then
                   Raise Exception.Create(CtrlMovBaixa.MessageInfo);
                iPln := qryBuscaMovBaixa.FieldByName('PLNCODIGO').AsFloat;
             end;

             iPlnEstorno := 0;
             if iPln > 0 then
             begin
                qryAux1.Close;
                qryAux1.SQL.Clear;
                qryAux1.SQL.ADD('SELECT P.PLNCODIGO FROM PLANILHA P WHERE P.PLNPLANESTORNO = '+qryBuscaMovBaixa.FieldByName('PLNCODIGO').AsString);
                qryAux1.Open;

                iPlnEstorno := qryAux1.FieldByName('PLNCODIGO').AsFloat;
             end;

             qryAux1.Close;
             qryAux1.SQL.Clear;
             qryAux1.SQL.ADD('UPDATE HISTORICOMOVIMENTACAO H ' +
                             'SET H.IDMOVIMREFCIRCULAR = ' + qryBuscaMovBaixa.FieldByName('IDMOVIMENTACAO').AsString);
             if iPlnEstorno > 0 then
                qryAux1.SQL.ADD(', H.PLNCODIGO = ' + FloatToStr(iPlnEstorno));
             qryAux1.SQL.ADD('WHERE H.IDMOVIMENTACAO = ' + FloatToStr(nSeqHist));
             qryAux1.ExecSQL;
             qryAux1.Close;

             qryBuscaMovBaixa.Next;
          end;
          qryBuscaTipoMovBaixa.Close;
          qryBuscaMovBaixa.Close;

          _cdsBemxMoeda.Data := CtrlBem.ListaBemxMoeda(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);

          //----------------------------------------------------------------------------------
          // Atualiza o saldo contábil
          //----------------------------------------------------------------------------------
          _cdsBemxMoeda.First;
          while not _cdsBemxMoeda.EOF do
          begin
             _cdsBemxDep.Data := CtrlBem.ListaBemxDep(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
             //-------------------------------------------------------------------------------
             // Atualiza o saldo contábil
             //-------------------------------------------------------------------------------
             iFlgPai := 1;
             _cdsBemxDep.First;
             while not _cdsBemxDep.EOF do
             begin
                if _cdsBemxDep.FieldByName('MOECODIGO').AsInteger = _cdsBemxMoeda.FieldByName('MOECODIGO').AsInteger then
                begin
                   if not CtrlBem.AtualizaSaldoContabBem(qryAux.FieldByName('IDPESSOA').AsInteger,
                                                         qryAux.FieldByName('IDBEM').AsInteger,
                                                         dteDataDistrato.Date,
                                                         _cdsBemxMoeda.FieldByName('MOECODIGO').AsInteger,
                                                         _cdsBemxDep.FieldByName('IDBEMXDEP').AsInteger,
                                                         _cdsBemxMoeda.FieldByName('VALORG').AsFloat, 0, 0, 0,
                                                         0, 0, 0, 0,
                                                         0, 0, 0, 0,
                                                         qryAux.FieldByName('IDGRUPO').AsInteger,
                                                         qryAux.FieldByName('IDLOCALIZACAO').AsInteger,
                                                         qryAux.FieldByName('IDRESPONSAVEL').AsInteger,
                                                         qryAux.FieldByName('IDCONJUNTO').AsInteger,
                                                         qryAux.FieldByName('UNIDNEGOC').AsInteger,
                                                         0, iFlgPai, 0) then
                      Raise Exception.Create(CtrlBem.MessageInfo);
                   //-------------------------------------------------------------------------
                   iFlgPai := 0;
                end;
                _cdsBemxDep.Next;
             end;

             _cdsBemxMoeda.Next;
          end;

          //Efetua a depreciação de cada bem

          _cdsBem.Data                               := CtrlBem.ListaBem(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
          CtrlFechamentoProRata.cdsBem               := _cdsBem;

          qryImovelBem.Filtered := False;
          qryImovelBem.Filter   := 'IDBEM = ' + _cdsBem.FieldByName('IDBEM').AsString;
          qryImovelBem.Filtered := True;

          qryUpdate.Close;
          qryUpdate.SQL.Clear;
          qryUpdate.SQL.Add('UPDATE BEMXMOEDA SET VALORG = :VALORG WHERE IDBEM = :IDBEM');
          qryUpdate.Params.ParamByName('VALORG').DataType := ftFloat;
          qryUpdate.Params.ParamByName('IDBEM').DataType  := ftInteger;
          qryUpdate.Params.ParamByName('VALORG').Value    := strtofloat(FormatFloat('#0.00',(((qryImovelBem.FieldByName('VLRCONTABIL').asFloat / 1) * 100) / 100)));
          qryUpdate.Params.ParamByName('IDBEM').Value     := qryImovelBem.FieldByName('IDBEM').asInteger;
          qryUpdate.ExecSQL;


          AjustaTaxaDistratoConrtatual(DteDataDistrato.Text,
                                       qryImovelBem.FieldByName('VLRCONTABIL').AsFloat,
                                       qryImovelBem.FieldByName('IDBEM').asInteger);

         //-------------------------------------------------------------------------------
         // Alimentando os DataSets Filhos com os dados do bem
         //-------------------------------------------------------------------------------
         _cdsBem.Data               := CtrlBem.ListaBem(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsBemxMoeda.Data         := CtrlBem.ListaBemxMoeda(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsBemxDep.Data           := CtrlBem.ListaBemxDep(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsReavaliacao.Data       := CtrlBem.ListaReavaliacao(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsReavalxMoeda.Data      := CtrlBem.ListaReavalxMoeda(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsReavalxDep.Data        := CtrlBem.ListaReavalxDep(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsAcrescimoValor.Data    := CtrlBem.ListaAcrescimoValor(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsAcrescValorxMoeda.Data := CtrlBem.ListaAcrescValorxMoeda(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         _cdsAcrescValorxDep.Data   := CtrlBem.ListaAcrescValorxDep(Sistema.IdEmpresa, qryAux.FieldByName('IDBEM').AsFloat);
         //-------------------------------------------------------------------------------
         // Link de Dados com a Classe PróRata
         //-------------------------------------------------------------------------------
         CtrlFechamentoProRata.cdsBem               := _cdsBem;
         CtrlFechamentoProRata.cdsBemxMoeda         := _cdsBemxMoeda;
         CtrlFechamentoProRata.cdsBemxDep           := _cdsBemxDep;
         CtrlFechamentoProRata.cdsReavaliacao       := _cdsReavaliacao;
         CtrlFechamentoProRata.cdsReavalxMoeda      := _cdsReavalxMoeda;
         CtrlFechamentoProRata.cdsReavalxDep        := _cdsReavalxDep;
         CtrlFechamentoProRata.cdsAcrescimoValor    := _cdsAcrescimoValor;
         CtrlFechamentoProRata.cdsAcrescValorxMoeda := _cdsAcrescValorxMoeda;
         CtrlFechamentoProRata.cdsAcrescValorxDep   := _cdsAcrescValorxDep;
         //-------------------------------------------------------------------------------
         // Calcula o Fechamento PróRata
         //-------------------------------------------------------------------------------

         CtrlFechamentoProRata.Executar(Sistema.IdModulo,
                                               Sistema.IdEmpresa,
                                               Sistema.IdUsuario,
                                               _cdsBem.FieldByName('IDBEM').AsInteger,
                                               dteDataDistrato.Date,
                                               0,
                                               True);


            qryAux.Next;


      end;



    _cdsBemxMoeda.Close;
    _cdsBemxDep.Close;


      if dtmBaseDados.dbBaseDados.InTransaction then
         CommitTransacao;

      FrmAguarde.Apaga;

      MsgDlg ('Distrato Realizado! ','Informação',mtInformation,[mbok],0);

      FreeAndNil(CtrlLancamentosImovel);
      FreeAndNil(CtrlMovBaixa);
      FreeAndNil(qryUpdate);

      bbtnSair.Click;

   except
      on e : Exception do begin
        if dtmBaseDados.dbBaseDados.InTransaction then
           RollBackTransacao;
        FrmAguarde.Apaga;
        FreeAndNil(CtrlLancamentosImovel);
        FreeAndNil(CtrlMovBaixa);
        if Length(e.message) > 0 then
           MsgDlg(e.message, 'Erro', mtError, [mbOk], 0);
      end;
   end;
end;

function TFrmDistratoContratual.TotalizaRateio( var fTotalRateio: Extended): Boolean;
begin
   Result       := True;
   fTotalRateio := 0;
   cdsImoveis.DisableControls;
   cdsImoveis.First;
   while not cdsImoveis.Eof do begin
      fTotalRateio := fTotalRateio + ComunsImobiliario.Arredonda(cdsImoveisVLRIMOVEL.AsFloat, 2);
      cdsImoveis.Next;
   end;
   cdsImoveis.First;
   cdsImoveis.EnableControls;

   fTotalRateio       := ComunsImobiliario.Arredonda(fTotalRateio, 2);
//   edtTotalLanc.Value := fTotalRateio;
end;

// -----------------------------------------------------------------------------
// Carrega parâmetros para contabilização da baixa do tipo 5 ou Desconto
// -----------------------------------------------------------------------------
function TFrmDistratoContratual.InicializaParam(const sCodTipImovel, sTipoOperacao :String; const iTipoRec:Integer) : Boolean;
var iCodErro : Integer;
    bImovel : Boolean;
begin
   Result := True;

   if qryFLGTIPOCONTRATO.AsString = 'C' then
   begin
      // Carrega o tipo ParamContabeis com os parametros para cada tipo de parcela
      if ModuloImobiliario.Alienacao.iTipoRecAmortiz <= 0 then begin
         MsgDlg('Nenhuma Parametrização Definida para Amortização de Parcelas','Aviso',mtWarning,[mbOk],0);
         Result := False;
         Exit;
      end;
   end
   else
   begin
      // Carrega o tipo ParamContabeis com os parametros para cada tipo de parcela
      if ModuloImobiliario.Alienacao.iTipoRecAmortAC <= 0 then begin
         MsgDlg('Nenhuma Parametrização Definida para Amortização de Parcelas de Acordo','Aviso',mtWarning,[mbOk],0);
         Result := False;
         Exit;
      end;
   end;

   // zera parametros contabeis
   CtrlPadrLancImovel.ZeraPadrLancContabil( ParamContabeis );

   // definir parâmetros contábeis
   Result := (CtrlPadrLancImovel.BuscaPadrLancContabil(ParamContabeis, iCodErro, sTipoOperacao, False,
                                                       Sistema.idEmpresa, Sistema.idModulo,
                                                       iTipoRec,
                                                       sCodTipImovel));
   if not Result then
   begin
      MsgDlg('Nenhuma Parametrização Definida! Tipo de operação = '+sTipoOperacao ,'Aviso',mtWarning,[mbOk],0);
      Exit;
   end;

   with dtmLookImobiliario do begin
      LimpaParametros(dtmLookImobiliario.qryLookTipoRecDes);
      qryLookTipoRecDes.ParamByName('PIDTIPOCUSTORECIMO').AsInteger := iTipoRec;
      qryLookTipoRecDes.Open;
   end;

   // trata erro
   if iCodErro < 0 then begin
      with dtmLookImobiliario do begin
         LimpaParametros(dtmLookImobiliario.qryLookTipoImovel);
         qryLookTipoImovel.ParamByName('PCODTIPIMOVEL').AsString := sCodTipImovel;
         qryLookTipoImovel.Open;

         if iCodErro = -4 then begin
            MsgDlg('Parametrização Duplicada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end else begin
            MsgDlg('Parametrização Não Encontrada para : ' + #13#10 +
                   qryLookTipoImovelDESCTIPOIMOVEL.AsString + ' / ' +
                   qryLookTipoRecDesDESCCUSTORECIMO.AsString,'Aviso',mtWarning,[mbOk],0);
         end;
      end;

      Result := False;
      Exit;
   end;

   // Define Historico contábil
   ParamContabeis.sHistoricoCtb := edtNumProp.Text + ' - ' +
                                   dtmLookImobiliario.qryLookTipoRecDesDESCCUSTORECIMO.AsString; 

   cdsImoveis.First;
   bImovel := False;
   while not cdsImoveis.Eof do begin
      if not cdsImoveisIMOCODIGO.IsNull then begin
         if bImovel = False then begin
            ParamContabeis.sHistoricoCtb := ParamContabeis.sHistoricoCtb + ', Imóvel ';
            bImovel := True;
         end;
         ParamContabeis.sHistoricoCtb := ParamContabeis.sHistoricoCtb + cdsImoveisIMOCODIGO.AsString + ' ';
      end;
      cdsImoveis.Next;
   end;
end;

// -----------------------------------------------------------------------------
// Efetua baixa das parcelas por alterador
//
// -----------------------------------------------------------------------------
function TFrmDistratoContratual.BaixaPorAlterador(const iCodDoc: Integer;
                                                  const fVlrRepac:Extended;
                                                  const iIdContratoImovel: integer;
                                                  var iPlnCodigo:double): Boolean;
var iNumLancto : Integer;
    sMens,sDtLancto, sHist1, sHist2, sHist3, sHist4, sHist5 : String;
    iPlanilha : Integer;
    _cdsIntegra : TCMClientDataSet;
    dValor, dValorTotal : Double;
    CtrlDocumento  : TCtrlImobDocumento;
    CtrlLancamento : TCtrlImobLancamento;
begin
   Result      := True;
   sDtLancto   := DateToStr(dteDataDistrato.Date);
   dValor      := 0;
   dValorTotal := 0;
   _cdsIntegra := TCMClientDataSet.Create(nil);

   CtrlDocumento := TCtrlImobDocumento.Create;
   CtrlDocumento.InitializeAs(Padroes);

   CtrlLancamento := TCtrlImobLancamento.Create;
   CtrlLancamento.InitializeAs(Padroes);

   try
     try
        if ParamContabeis.bFlgIntegraContab then
        begin
          _cdsIntegra.Data := ComunsImobiliarioDB.RetornaRateioPlanoxContrato(iIdContratoImovel);
          while not _cdsIntegra.eof do
          begin
           if _cdsIntegra.RecNo = _cdsIntegra.RecordCount then
              dValor := fVlrRepac - dValorTotal
           else
              dValor := (fVlrRepac * _cdsIntegra.FieldByName('PERCENTRATEIO').asFloat)/100;

           dValorTotal := dValorTotal + dValor;

           if not CtrlLancamento.InsereLancaContab ( '2',
                                                     Sistema.idEmpresa,
                                                     Sistema.idModulo,
                                                     Sistema.idUsuario,
                                                     IntegraBack.Plano,
                                                     ParamContabeis.iUnidNegoc, 0, 0,
                                                     //IntegraBack.PlanoPrevGlobal,
                                                     _cdsIntegra.FieldByName('IDPLANOPREV').asInteger,
                                                     //IntegraBack.PatroGlobal,
                                                     _cdsIntegra.FieldByName('IDPATRO').asInteger,
                                                     iPlnCodigo, 0,
                                                     sDtLancto,
                                                     IntToStr(iCodDoc),
                                                     ParamContabeis.sHistoricoCtb + ' Parcela: ' + qryParcNUMPARCELA.AsString,
                                                     '',
                                                     '',
                                                     '',
                                                     '',
                                                     '03',
                                                     ParamContabeis.sCentroCustoCredito,
                                                     ParamContabeis.sContaContabilCredito,
                                                     ParamContabeis.sCentroCustoDebito,
//                                                     ParamContabeis.sContaContabilDebito,
                                                     dtmLookImobiliario.qryLookAlteradorXTipoImoPLACONTA.asstring,
                                                     '',
                                                     dValor,
                                                     False,
                                                     Sistema.UsaPlanoPatro,
                                                     -1,
                                                     dteDataDistrato.Date, -1, -1,
                                                     True, -1, False, fVlrRepac) then
              raise Exception.Create ( CtrlLancamento.MessageInfo );

           if iPlnCodigo = 0 then
              iPlnCodigo := CtrlLancamento.RetornoPlnCodigo;
           _cdsIntegra.Next;
          end;
        end;
        

        if iCodDoc > 0 then
        begin

           // Grava o alterador escolhido para liquidar o documento
           CtrlDocumento.OpenTransaction := False;
           CtrlDocumento.Prepare( OpLanctoDocumImob, odlAlteradorImob );
           CtrlDocumento.OpenTransaction := False;
           CtrlDocumento.PartidaDobrada  := ParamIntegra.PartidaDobrada;
           CtrlDocumento.UsaPlanoPatro   := Sistema.UsaPlanoPatro;
           CtrlDocumento.IdUsuario       := Sistema.IdUsuario;
           CtrlDocumento.IdEspAcesso     := Sistema.idEspAcesso;
           CtrlDocumento.IdModulo        := Sistema.idModulo;
           CtrlDocumento.CodDocumento    := iCodDoc;


           CtrlDocumento.Lanctodocum.SetValues(StrToDate(sDtLancto),
                                               iCodDoc, 0,
                                               fVlrRepac,
                                               0,
                                               fVlrRepac,
                                               0,
                                               Trunc(iPlnCodigo),
                                               0,
                                               Sistema.idUsuario,
                                               Sistema.idEmpresa, 0,0,
                                               0,0,
                                               //Código do Alterador
                                               dtmLookImobiliario.qryLookAlteradorXTipoImoCODALTERADOR.AsInteger,
                                               '4', '','','',
                                               'Distrato Contratual',
                                               '','','','C',
                                               Sistema.idModulo,
                                             //  IntegraBack.Plano,
                                               //Marcio Sanches Spinosa
                                               dtmLookImobiliario.qryLookAlteradorXTipoImoPLANO.asinteger,
                                               True, False, -1, 0, //'');
                                               dtmLookImobiliario.qryLookAlteradorXTipoImoPLACONTA.asstring);
                                               //Marcio Sanches Spinosa

           if not CtrlDocumento.Insert then
              raise Exception.Create(CtrlDocumento.MessageInfo);

           if (qryAux = nil) then
           begin
             qryAux := TwwQuery.Create(nil);
             qryAux.DatabaseName := 'BaseDados';
           end;

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.ADD('UPDATE DOCUMENTO SET DOCUMENTO.FLGNAOCONCILIADO = NULL WHERE DOCUMENTO.CODDOCUMENTO = '+
                                               IntToStr(iCodDoc)+' AND DOCUMENTO.STATUS = ''2''');
           qryAux.ExecSQL;
           qryAux.Close;
        end;
     except
        Result := False;
        MsgDlg('Houve erro durante a tentativa de integração com o Contas a Pagar/Receber.' +#13+
               CtrlDocumento.MessageInfo , 'Erro', mtError, [mbOk], 0);
     end;
  finally
    FreeandNil(_cdsIntegra);
    FreeAndNil(CtrlDocumento);
    FreeAndNil(CtrlLancamento);      
  end;
end;


function TFrmDistratoContratual.DesfazCAF: Boolean;
var prg : Integer;
    CtrlMovBaixa          : TCtrlImobMovBaixa;
begin
   Result := True;
   prg    := 0;

   FrmAguarde.Mostra('Desfazendo o CAF ...');
   FrmAguarde.Max := cdsImoveis.RecordCount;
   Application.ProcessMessages;

   CtrlMovBaixa := TCtrlImobMovBaixa.Create;
   CtrlMovBaixa.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                           Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
   try
      // Abre query com a data de assinatura do contrato para estornar as baixas
      LimpaParametros(qryAssinatura);
      qryAssinatura.ParamByName('PIDCONTRATO').AsInteger := iContratoSelecao;
      qryAssinatura.Open;

      cdsImoveis.First;
      // Estorna a Baixa no AtivoFixo para cada bem do imovel ( Retorna -1 )
      while not cdsImoveis.eof do begin

         Inc(prg);
         FrmAguarde.Pos := prg;
         Application.ProcessMessages;

         with dtmCaf.qryImovelxBem do begin

            // Abre Bens relativos ao imóvel alienado
            LimpaParametros(dtmCaf.qryImovelxBem);
            ParamByName('PIDIMOVEL').AsInteger  := cdsImoveis.FieldByName('IDIMOVEL').AsInteger;
            Open;

            while not dtmCaf.qryImovelxBem.eof do
            begin
               // Verifica se existe bens baixados na data da movimentação
               LimpaParametros(qryVerifBem);
               qryVerifBem.ParamByName('pIDBEM').AsInteger      := dtmCaf.qryImovelXBemIDBEM.AsInteger;
               qryVerifBem.ParamByName('pDATABAIXA').AsDateTime := qryAssinaturaCONDATAASSINATURA.AsDateTime;
               qryVerifBem.Open;

               if qryVerifBem.RecordCount > 0 then
               begin
                  if not CtrlMovBaixa.EstornaBaixa(54,    // módulo 54 - investimob
                                                   Sistema.IdEmpresa,
                                                   Sistema.IdUsuario,
                                                   dtmCaf.qryImovelXBemIDBEM.AsInteger,
                                                   qryAssinaturaCONDATAASSINATURA.AsDateTime,
                                                   dteDataDistrato.Date, false, false ) then
                     raise Exception.create(CtrlMovBaixa.MessageInfo);
               end;
               qryVerifBem.Close;
               dtmCaf.qryImovelxBem.Next;
            end;
            dtmCaf.qryImovelxBem.Close;
         end;
         cdsImoveis.Next;
      end;
      qryAssinatura.Close;
   except
      on E : Exception do begin
         Result := False;
         MsgDlg(E.message, 'Aviso', mtWarning, [mbOk], 0);
         qryAssinatura.Close;
         qryVerifBem.Close;
      end;
   end;
   FrmAguarde.Apaga;
   FreeAndNil(CtrlMovBaixa);
end;

function TFrmDistratoContratual.RateiaGrupos: Boolean;
var
   sParametro, sSql: String;
begin
   sParametro := '';
   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.IsNull then begin
      sParametro := dtmLookImobiliario.qryLookTipoImovelIDGRUPOTERRENO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOEDIFICACAO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOINST.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOELET.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOAR.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOAR.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOVEICULO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOUTILITARIO.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOUTILITARIO.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMAQUINA.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMAQUINA.AsString + ',';
   end;

   if not dtmLookImobiliario.qryLookTipoImoveLIDGRUPOMOVEL.IsNull then begin
      sParametro := sParametro + dtmLookImobiliario.qryLookTipoImovelIDGRUPOMOVEL.AsString + ',';
   end;

   if sParametro = '' then begin
      MsgDlg('O tipo de imóvel não possui nenhum grupo contábil associado.','Aviso',mtwarning,[mbok],0);
      Result := false;
      exit;
   end else begin
      sParametro := copy(sParametro,1,Length(sParametro)-1);
   end;

   sSQL := 'SELECT C.IDCONTRATOIMOVEL, I.IDIMOVEL, I.IMOCODIGO, I.IMONOME, C.CONNUMERO, '+#13+
           'G.IDGRUPO, G.CLASSE, G.NOME AS CODTIPIMOVEL, '+#13+
           '0 AS PERCENTUAL, 0 AS VLRIMOVEL, CX.VLRVENDA '+#13+
           'FROM CONTRATOXIMOVEL CX, IMOVEL I, CONTRATOIMOVEL C, GRUPO G '+#13+
           'WHERE '+#13+
           '       C.CONNUMERO = '+ QuotedStr(edtNumProp.Text)+#13+
           '  AND  I.IDIMOVEL         = CX.IDIMOVEL '+#13+
           '  AND CX.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ' + #13 +
           '  AND  G.FLGIMOVEL = 1  ' + #13 +
           '  AND  G.TIPO = ''A''   ' + #13 +
           '  AND  G.STATUS = ''A'' ' + #13 +
           '  AND  G.IDGRUPO IN (' + sParametro + ')  ';

   cdsImoveis.Data := CtrlTipoImovel.GetDataPacket(sSQL);

   Result := true;

end;

function TFrmDistratoContratual.TrocaVirgulaPonto(Value: String): String;
var
  iPosVirg : Integer;
begin
  iPosVirg := pos(',',Value);
  if iPosVirg <> 0 then
    Value := copy(Value,1,iPosVirg-1)+'.'+copy(Value,iPosVirg+1,length(Value));
  TrocaVirgulaPonto := Value;
end;

procedure TFrmDistratoContratual.AjustaTaxaDistratoConrtatual(pStrDataDistrato : string;
                                                              pFltValor : Extended;
                                                              pIntIDBem : integer);
var fTaxaDep, fTaxaNova, fTaxaAnt, fDepNova, fDepCaf, fCusto, fReavAnt, fAcresAnt, fReavNova : Extended;
    pIntVidaUtil : integer;
    sSql : String;
    pQryAux : TwwQuery;
begin
   pQryAux              := TwwQuery.create(nil);
   pQryAux.DataBaseName := 'BaseDados';
   pQryAux.Close;
   pQryAux.Sql.Clear;

   pIntVidaUtil         := GetVidaUtilDistratoContratual(pStrDataDistrato, intToStr(pIntIDBem));
   if pIntVidaUtil > 0 then
   begin
      fTaxaDep          := ComunsImobiliario.Arredonda(100 / (pIntVidaUtil / 12), 6);
      fDepNova          := ComunsImobiliario.Arredonda(pFltValor * ((fTaxaDep/12) / 100), 2);

      sSql := 'SELECT BD.TAXADEP, (BM.VALORG + BM.CMBEM) AS VLRCUSTO '+#13+
              '  FROM BEMXMOEDA BM, BEMXDEP BD    '+#13+
              ' WHERE BM.IDBEM = BD.IDBEM         '+#13+
              '   AND BM.MOECODIGO = BD.MOECODIGO '+#13+
              '   AND BM.IDBEM = ' + intToStr(pIntIDBem) +#13+
              '   AND BM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
              '   AND BD.IDBEMXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF);
      pQryAux.sql.Add(sSql);
      pQryAux.open;

      fCusto   := pQryAux.FieldByName('VLRCUSTO').AsFloat;
      fTaxaAnt := pQryAux.FieldByName('TAXADEP').AsFloat;

      pQryAux.Close;
      pQryAux.Sql.Clear;

      sSql := 'SELECT SUM(RM.VALORG + NVL(RM.CMBEM,0)) AS VLRREAV '+#13+
              '  FROM REAVALIACAO R, REAVALXMOEDA RM              '+#13+
              ' WHERE R.DATAREAVALIACAO <> TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', strToDate(pStrDataDistrato))) + ',''DD/MM/YYYY'') '+#13+
              '   AND R.IDREAVALIACAO  = RM.IDREAVALIACAO         '+#13+
              '   AND R.IDBEM      = ' + intToStr(pIntIDBem)      +#13+
              '   AND RM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF);
      pQryAux.sql.Add( sSql );
      pQryAux.open;

      if not pQryAux.IsEmpty then
           fReavAnt := pQryAux.FieldByName('VLRREAV').AsFloat
      else fReavAnt := 0;


      pQryAux.Close;
      pQryAux.Sql.Clear;

      sSql := 'SELECT SUM(RM.VALORG + NVL(RM.CMBEM,0)) AS VLRREAV '+#13+
              '  FROM REAVALIACAO R, REAVALXMOEDA RM              '+#13+
              ' WHERE R.DATAREAVALIACAO = TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', strToDate(pStrDataDistrato))) + ',''DD/MM/YYYY'') '+#13+
              '   AND R.IDREAVALIACAO  = RM.IDREAVALIACAO         '+#13+
              '   AND R.IDBEM      = ' + intToStr(pIntIDBem)      +#13+
              '   AND RM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF);
      pQryAux.sql.Add( sSql );
      pQryAux.open;

      if not pQryAux.IsEmpty then
           fReavNova := pQryAux.FieldByName('VLRREAV').AsFloat
      else fReavNova := 0;

      pQryAux.Close;
      pQryAux.Sql.Clear;


      sSql := 'SELECT SUM(AM.VALORG + NVL(AM.CMBEM,0)) AS VLRACRES '+#13+
              '  FROM ACRESCIMOVALOR A, ACRESCVALORXMOEDA AM       '+#13+
              ' WHERE A.DATAACRESCIMO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', strToDate(pStrDataDistrato))) + ',''DD/MM/YYYY'') '+#13+
              '   AND A.IDACRESCIMO  = AM.IDACRESCIMO             '+#13+
              '   AND A.IDBEM      = ' + intToStr(pIntIDBem)      +#13+
              '   AND AM.MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF);

      pQryAux.sql.Add( sSql );
      pQryAux.open;

      if not pQryAux.IsEmpty then
           fAcresAnt := pQryAux.FieldByName('VLRACRES').AsFloat
      else fAcresAnt := 0;

      pQryAux.Close;
      pQryAux.Sql.Clear;


      fTaxaNova := (1200 * fDepNova - fReavNova * fTaxaDep) / (fCusto + fReavAnt + fAcresAnt);
      fTaxaNova := ComunsImobiliario.Arredonda( fTaxaNova, 6 );

      fDepCaf := (fCusto*(fTaxaNova/12/100)) + (fReavAnt*(fTaxaNova/12/100))  + (fAcresAnt*(fTaxaNova/12/100)) + (fReavNova*(fTaxaDep/12/100));
      fDepCaf := ComunsImobiliario.Arredonda( fDepCaf, 2 );

      if ((fDepCaf      = fDepNova) and (fTaxaAnt <> fTaxaNova)) or
         ((fDepCaf+0.01 = fDepNova) and (fTaxaAnt <> fTaxaNova)) or
         ((fDepCaf-0.01 = fDepNova) and (fTaxaAnt <> fTaxaNova)) then begin
         sSql := 'UPDATE BEMXDEP SET TAXADEP = ' + ComunsImobiliario.StrTran(FloatToStr(fTaxaNova),',','.') +#13+
                 ' WHERE IDBEM     = ' + intToStr(pIntIDBem) +#13+
                 '   AND MOECODIGO = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                 '   AND IDBEMXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF);
         pQryAux.sql.Add( sSql );
         pQryAux.ExecSql;
         pQryAux.Close;
         pQryAux.Sql.Clear;

         sSql := 'UPDATE REAVALXDEP SET TAXADEP = ' + ComunsImobiliario.StrTran(FloatToStr(fTaxaNova),',','.') +#13+
                 ' WHERE MOECODIGO    = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                 '   AND IDREAVALXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF)  +#13+
                 '   AND IDREAVALIACAO IN( SELECT IDREAVALIACAO '+#13+
                 '                           FROM REAVALIACAO   '+#13+
                 '                          WHERE IDBEM = ' + intToStr(pIntIDBem) +#13+
                 '                            AND DATAREAVALIACAO <> TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', strToDate(pStrDataDistrato))) + ',''DD/MM/YYYY'') ) ';
         pQryAux.sql.Add( sSql );
         pQryAux.ExecSql;
         pQryAux.Close;
         pQryAux.Sql.Clear;


         sSql := 'UPDATE ACRESCVALORXDEP SET TAXADEP = ' + ComunsImobiliario.StrTran(FloatToStr(fTaxaNova),',','.') +#13+
                 ' WHERE MOECODIGO       = ' + IntToStr(ModuloImobiliario.InvestImob.iIdMoedaCAF) +#13+
                 '   AND IDACRESCIMOXDEP = ' + IntToStr(ModuloImobiliario.InvestImob.iIdPaisCAF)  +#13+
                 '   AND IDACRESCIMO IN( SELECT IDACRESCIMO    '+#13+
                 '                         FROM ACRESCIMOVALOR '+#13+
                 '                        WHERE IDBEM = ' + intToStr(pIntIDBem) +#13+
                 '                          AND DATAACRESCIMO < TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', strToDate(pStrDataDistrato))) + ',''DD/MM/YYYY'') ) ';
         pQryAux.sql.Add( sSql );
         pQryAux.ExecSql;
         pQryAux.Close;
         pQryAux.Sql.Clear;

      end;
   end;
end;

function TFrmDistratoContratual.GetVidaUtilDistratoContratual(
  pStrDataDistrato, pStrIDBem: string): integer;
  var
    sSql : String;
    qryAux : TWWQuery;
begin
   qryAux := TwwQuery.create(nil);
   qryAux.DataBaseName := 'BaseDados';

   qryAux.close;
   QryAux.Sql.Clear;

   sSql := 'SELECT R.VIDAUTIL FROM REAVALIAXREAVALIA R ' + #13#10 +
   ' WHERE R.IDBEM = ' + pStrIDBem + #13#10 +
   ' AND r.DATAREAVALIACAO = (SELECT MAX(r2.datareavaliacao) ' + #13#10 +
   ' FROM reavaliaxreavalia R2 ' + #13#10 +
   ' WHERE r2.Datareavaliacao <= ' + QuotedStr(pStrDataDistrato) + ')' ;

   QryAux.Sql.Add(sSql);
   qryAux.Open;

   Result := qryAux.FieldByName('VIDAUTIL').AsInteger;
   qryAux.Close;
   FreeAndNil(qryAux);
end;

procedure TFrmDistratoContratual.DBcboAlteradorChange(Sender: TObject);
begin
  inherited;
  btnContinuar.Enabled := (DBcboAlterador.Text <> EmptyStr);
end;

procedure TFrmDistratoContratual.btnContinuarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #27 )then
    DBcboAlterador.LookupValue := '-1';
end;

end.

