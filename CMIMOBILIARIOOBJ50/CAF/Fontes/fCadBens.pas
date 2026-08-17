unit fCadBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, ComCtrls, Grids, Wwdbigrd, TREdit,
  wwdbedit, wwdblook, Mask, CMTree, fcLabel, wwdbdatetimepicker,
  CMDateTimePicker, Wwdbgrid, CmEventosCadastro, ImgList
  {$IFNDEF VERSAO0505},uCMTypes, CMProcuraSubTipo {$ENDIF};

type
  TfrmCadBens = class(TfrmCadastroCS)
    qrySelConjunto: TwwQuery;
    MSConjunto: TMontaSelect;
    qryRateio: TwwQuery;
    qryRateioCODCENTROCUSTO: TStringField;
    qryRateioDESCCCUSTO: TStringField;
    qryRateioPARTICIPACAO: TFloatField;
    dsRateio: TwwDataSource;
    pgctlBem: TPageControl;
    TabIdent: TTabSheet;
    bbtnSelClasse: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    TabValores: TTabSheet;
    TabDocAquis: TTabSheet;
    TabContab: TTabSheet;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    eValOrg: TRealEdit;
    eCmValOrg: TRealEdit;
    eValDepIni: TRealEdit;
    eCMValDepIni: TRealEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    eValFis: TRealEdit;
    eDepFis: TRealEdit;
    GroupBox3: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    eValGer: TRealEdit;
    eDepGer: TRealEdit;
    Label44: TLabel;
    edValHistorico: TRealEdit;
    Label16: TLabel;
    edDataNota: TCMDateTimePicker;
    edNota: TEdit;
    edComplNota: TEdit;
    Label14: TLabel;
    Label19: TLabel;
    edQtde: TEdit;
    Label7: TLabel;
    edDescBem: TMemo;
    Label9: TLabel;
    edDataInclusao: TCMDateTimePicker;
    Label8: TLabel;
    bbtnSelGrupo: TBitBtn;
    Label10: TLabel;
    edTaxaDep: TRealEdit;
    Label11: TLabel;
    Label12: TLabel;
    edDataInicioDep: TCMDateTimePicker;
    Label18: TLabel;
    Label17: TLabel;
    bbtnSelAtivProjeto: TBitBtn;
    bbtnSelSubConta: TBitBtn;
    Label27: TLabel;
    cmbControle: TComboBox;
    Label29: TLabel;
    cmbSituacao: TwwDBLookupCombo;
    GroupBox4: TGroupBox;
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
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    eReavValOrg: TRealEdit;
    eReavCMValOrg: TRealEdit;
    eReavValDepIni: TRealEdit;
    eReavCMValDepIni: TRealEdit;
    eReavData: TCMDateTimePicker;
    eReavTaxaDep: TRealEdit;
    eReavObs: TEdit;
    eUltReavValOrg: TRealEdit;
    eUltReavCMValOrg: TRealEdit;
    eUltReavValDepIni: TRealEdit;
    eUltReavCMValDepIni: TRealEdit;
    eUltReavData: TCMDateTimePicker;
    eUltReavTaxaDep: TRealEdit;
    eUltReavObs: TEdit;
    dsSelConjunto: TwwDataSource;
    qrySelClasse: TwwQuery;
    qrySelSituacao: TwwQuery;
    qrySelSituacaoDESCSITUACAO: TStringField;
    qrySelSituacaoIDSITUACAO: TFloatField;
    qrySelAtivProj: TwwQuery;
    qrySelAtivProjNOME: TStringField;
    qrySelAtivProjUNECODIGO: TStringField;
    qrySelAtivProjUNIDNEGOC: TFloatField;
    qrySelAtivProjIDPESSOA: TFloatField;
    qryPlaca: TwwQuery;
    qryPlacaPLACA: TFloatField;
    qryPlacaDESBEM: TStringField;
    qrySelTerceiro: TwwQuery;
    qrySelTerceiroNOME: TStringField;
    qrySelTerceiroIDPESSOA: TFloatField;
    MSFornec: TMontaSelect;
    MSTerceiros: TMontaSelect;
    MSSubConta: TMontaSelect;
    MSAtivProjeto: TMontaSelect;
    qrySelFornec: TwwQuery;
    qrySelFornecNOME: TStringField;
    qrySelFornecIDPESSOA: TFloatField;
    qrySelFornecRAZAOSOCIAL: TStringField;
    qrySelFornecIDFORCLI: TFloatField;
    qrySelSubConta: TwwQuery;
    qrySelSubContaNOMESUBCONTA: TStringField;
    qrySelSubContaIDPESSOA: TFloatField;
    qrySelSubContaCODSUBCONTA: TFloatField;
    qrySelGrupo: TwwQuery;
    qryParamCaf: TwwQuery;
    qryParamCafALUGUELINTERNO: TFloatField;
    qryParamCafSEQBEMEMP: TFloatField;
    qryParamCafEDITACODBEM: TFloatField;
    qryParamCafMOEDAFISCAL: TFloatField;
    qryParamCafMOEDAGERENCIAL: TFloatField;
    qryParamCafMOEDAOFICIAL: TFloatField;
    qryParamCafMASCCODGRUPO: TStringField;
    qryParamCafSISTEMAS: TStringField;
    qryParamCafINTEGRACONTAB: TStringField;
    qryParamCafINTEGRACAP: TStringField;
    qryParamCafINTEGRACAR: TStringField;
    qryReavaliacao: TwwQuery;
    qryReavaliacaoIDREAVALIACAO: TFloatField;
    qryReavaliacaoIDMOVIMENTACAO: TFloatField;
    qryReavaliacaoIDBEM: TFloatField;
    qryReavaliacaoIDPESSOA: TFloatField;
    qryReavaliacaoVALORG: TFloatField;
    qryReavaliacaoVALFIS: TFloatField;
    qryReavaliacaoVALGER: TFloatField;
    qryReavaliacaoTAXADEP: TFloatField;
    qryReavaliacaoDEPLANC: TFloatField;
    qryReavaliacaoDEPFIS: TFloatField;
    qryReavaliacaoDEPGER: TFloatField;
    qryReavaliacaoCMBEM: TFloatField;
    qryReavaliacaoCMDEP: TFloatField;
    qryReavaliacaoDATAULTDEP: TDateTimeField;
    qryReavaliacaoDATAREAVALIACAO: TDateTimeField;
    qryReavaliacaoFLGDEPREC: TFloatField;
    qryReavaliacaoFLGULTREAVAL: TFloatField;
    pnlConjunto: TPanel;
    Label3: TLabel;
    dbeDescConjunto: TDBMemo;
    Label6: TLabel;
    dbgRateio: TwwDBGrid;
    Label4: TLabel;
    dbeDescLocalizacao: TwwDBEdit;
    Label5: TLabel;
    dbeNomeResponsavel: TwwDBEdit;
    qryReaval: TwwQuery;
    qryReavalIDMOVIMENTACAO: TFloatField;
    qryReavalTAXADEPANT: TFloatField;
    qryReavalOBS: TStringField;
    MSClasse: TMontaSelect;
    MSGrupos: TMontaSelect;
    qryHistMov: TwwQuery;
    qryHistMovIDMOVIMENTACAO: TFloatField;
    qrySelConjuntoDESCCONJUNTO: TStringField;
    qrySelConjuntoIDCONJUNTO: TFloatField;
    qrySelConjuntoIDLOCALIZACAO: TFloatField;
    qrySelConjuntoIDRESPONSAVEL: TFloatField;
    qrySelConjuntoDESCLOCALIZACAO: TStringField;
    qrySelConjuntoDESCRESPONSAVEL: TStringField;
    qrySelConjuntoIDPESSOA: TFloatField;
    qrySelClasseIDCLASSEBEM: TFloatField;
    qrySelClasseCODHIERARQ: TStringField;
    qrySelClasseDESCRICAO: TStringField;
    qrySelClasseANASINT: TStringField;
    qrySelGrupoNOME: TStringField;
    qrySelGrupoIDGRUPO: TFloatField;
    qrySelGrupoDEPRECIACAO: TFloatField;
    qrySelGrupoULTIDBEM: TFloatField;
    qrySelGrupoCLASSE: TStringField;
    edDescClasse: TwwDBEdit;
    dsClasse: TwwDataSource;
    dsFornec: TwwDataSource;
    dsTerceiro: TwwDataSource;
    dsGrupo: TwwDataSource;
    dsSubConta: TwwDataSource;
    dsAtivProj: TwwDataSource;
    edDescGrupo: TwwDBEdit;
    edDescSubConta: TwwDBEdit;
    edAtivProjeto: TwwDBEdit;
    qrySelConjuntoDISPONIVEL: TFloatField;
    qrySelConjuntoALUGADO: TFloatField;
    qryBuscaGrupo: TwwQuery;
    qrySelFornecCODSUBCONTA: TFloatField;
    qryAux: TwwQuery;
    qryParamCafFLGCLSDESBEM: TFloatField;
    Toolbar972: TToolbar97;
    bbtnSelConjunto: TToolbarButton97;
    bbtnNovoConjunto: TToolbarButton97;
    edProcesso: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    pnlPlaca: TPanel;
    Label13: TLabel;
    edPlaca: TMaskEdit;
    bbtnGeraPlaca: TBitBtn;
    Label28: TLabel;
    edNumSerie: TEdit;
    Label43: TLabel;
    bbtnLivros: TBitBtn;
    pnlLivros: TPanel;
    bbtnRetornaPlaca: TBitBtn;
    edPubAutor: TEdit;
    edPubEditora: TEdit;
    edPubAno: TRealEdit;
    Label52: TLabel;
    Label53: TLabel;
    Ano: TLabel;
    edEmpenho: TEdit;
    qryBuscaGrupoIDGRUPO: TFloatField;
    edIdOpcional: TMaskEdit;
    qrySelClasseMASCARAIDOPCIONAL: TStringField;
    qrySelGrupoFLGSEMPLACA: TFloatField;
    qryVerificaClasse: TwwQuery;
    qryVerificaClasseIDCLASSEBEM: TFloatField;
    qryVerificaClasseIDGRUPO: TFloatField;
    qryVerificaGrupo: TwwQuery;
    qryVerificaGrupoIDGRUPO: TFloatField;
    qryImovelxBem: TwwQuery;
    updImovelxBem: TUpdateSQL;
    qryImovelxBemIDIMOVEL: TFloatField;
    qryImovelxBemIDBEM: TFloatField;
    qryImovelxBemIDPESSOA: TFloatField;
    qryImovelxBemIXBGRUPO: TStringField;
    qryImovelxBemIXBPERCENT: TFloatField;
    qryBemSel: TwwQuery;
    qryBemSelIDSELBAIXA: TFloatField;
    qrySelBem: TwwQuery;
    qrySelBemIDBEM: TFloatField;
    qrySelBemIDPESSOA: TFloatField;
    qrySelBemIDFORNSERV: TFloatField;
    qrySelBemIDTERCEIRO: TFloatField;
    qrySelBemIDCLASSEBEM: TFloatField;
    qrySelBemIDMODULO: TFloatField;
    qrySelBemCODSUBCONTA: TFloatField;
    qrySelBemIDITENSRECDEV: TFloatField;
    qrySelBemUNIDNEGOC: TFloatField;
    qrySelBemIDIMAGEM: TFloatField;
    qrySelBemIDSITUACAO: TFloatField;
    qrySelBemIDCONJUNTO: TFloatField;
    qrySelBemIDGRUPO: TFloatField;
    qrySelBemREGISTRO: TStringField;
    qrySelBemDESBEM: TStringField;
    qrySelBemDTAINCLUSAO: TDateTimeField;
    qrySelBemDTANOTA: TDateTimeField;
    qrySelBemDATAINICIODEP: TDateTimeField;
    qrySelBemTAXADEP: TFloatField;
    qrySelBemPROPBAIXA: TFloatField;
    qrySelBemCONTROLE: TStringField;
    qrySelBemVALORG: TFloatField;
    qrySelBemVALFIS: TFloatField;
    qrySelBemDEPFIS: TFloatField;
    qrySelBemVALGER: TFloatField;
    qrySelBemDEPGER: TFloatField;
    qrySelBemVALDEPINI: TFloatField;
    qrySelBemNUMSERIE: TStringField;
    qrySelBemBAIXATOTAL: TStringField;
    qrySelBemIDNOTA: TStringField;
    qrySelBemCOMPLNOTA: TStringField;
    qrySelBemDEPLANC: TFloatField;
    qrySelBemCMDEP: TFloatField;
    qrySelBemCMBEM: TFloatField;
    qrySelBemDATAULTDEP: TDateTimeField;
    qrySelBemDATARECALCDEP: TDateTimeField;
    qrySelBemPLACA: TFloatField;
    qrySelBemVALHISTORICO: TFloatField;
    qrySelBemFLGDEPREC: TFloatField;
    qrySelBemFLGSAIDATEMP: TFloatField;
    qrySelBemPRIORIDADE: TFloatField;
    qrySelBemDATAINSTALACAO: TDateTimeField;
    qrySelBemDATATERMINOGAR: TDateTimeField;
    qrySelBemIDOPCIONAL: TStringField;
    qrySelBemPROCESSOAQUIS: TStringField;
    qrySelBemEMPENHOAQUIS: TStringField;
    qrySelBemPUBAUTOR: TStringField;
    qrySelBemPUBEDITORA: TStringField;
    qrySelBemPUBANO: TFloatField;
    qrySelBemDESCCONJUNTO: TStringField;
    qrySelBemNOME: TStringField;
    qrySelBemDESCSITUACAO: TStringField;
    qrySelBemNOMEFORN: TStringField;
    qrySelBemNOMECLASSE: TStringField;
    qrySelBemFLGIMOVEL: TFloatField;
    qrySelBemFLGBEMINTCONTAB: TFloatField;
    qrySelBemDTACONTAB: TDateTimeField;
    qryAltBem: TwwQuery;
    qryAltBemIDBEM: TFloatField;
    qryAltBemIDPESSOA: TFloatField;
    qryAltBemIDCONJUNTO: TFloatField;
    qryAltBemIDTERCEIRO: TFloatField;
    qryAltBemIDGRUPO: TFloatField;
    qryAltBemCODSUBCONTA: TFloatField;
    qryAltBemIDCLASSEBEM: TFloatField;
    qryAltBemIDMODULO: TFloatField;
    qryAltBemIDITENSRECDEV: TFloatField;
    qryAltBemIDFORNSERV: TFloatField;
    qryAltBemIDSITUACAO: TFloatField;
    qryAltBemIDIMAGEM: TFloatField;
    qryAltBemREGISTRO: TStringField;
    qryAltBemCONTROLE: TStringField;
    qryAltBemPLACA: TFloatField;
    qryAltBemDESBEM: TStringField;
    qryAltBemIDNOTA: TStringField;
    qryAltBemCOMPLNOTA: TStringField;
    qryAltBemDTANOTA: TDateTimeField;
    qryAltBemNUMSERIE: TStringField;
    qryAltBemDTAINCLUSAO: TDateTimeField;
    qryAltBemVALHISTORICO: TFloatField;
    qryAltBemVALORG: TFloatField;
    qryAltBemCMBEM: TFloatField;
    qryAltBemVALFIS: TFloatField;
    qryAltBemVALGER: TFloatField;
    qryAltBemDATAINICIODEP: TDateTimeField;
    qryAltBemVALDEPINI: TFloatField;
    qryAltBemTAXADEP: TFloatField;
    qryAltBemDEPLANC: TFloatField;
    qryAltBemCMDEP: TFloatField;
    qryAltBemDEPFIS: TFloatField;
    qryAltBemDEPGER: TFloatField;
    qryAltBemDATAULTDEP: TDateTimeField;
    qryAltBemDATARECALCDEP: TDateTimeField;
    qryAltBemFLGDEPREC: TFloatField;
    qryAltBemPROPBAIXA: TFloatField;
    qryAltBemBAIXATOTAL: TStringField;
    qryAltBemIDOPCIONAL: TStringField;
    qryAltBemUNIDNEGOC: TFloatField;
    qryAltBemPROCESSOAQUIS: TStringField;
    qryAltBemEMPENHOAQUIS: TStringField;
    qryAltBemPUBAUTOR: TStringField;
    qryAltBemPUBEDITORA: TStringField;
    qryAltBemPUBANO: TFloatField;
    qryAltBemFLGBEMINTCONTAB: TFloatField;
    qryAltBemDTACONTAB: TDateTimeField;
    updAltBem: TUpdateSQL;
    pnlIntegraContab: TPanel;
    ckbFlgBemIntContab: TCheckBox;
    Label54: TLabel;
    edDtaContab: TCMDateTimePicker;
    qryBemSelSBXTERMO: TFloatField;
    qryBemSelSBTIPOMOV: TFloatField;
    qrySelBemIDLOCALIZACAO: TFloatField;
    qrySelBemIDRESPONSAVEL: TFloatField;
    CMProcuraForCli: TCMProcuraForCli;
    Label49: TLabel;
    edFornec: TwwDBEdit;
    bbtnSelFornec: TBitBtn;
    CMProcuraTerceiro: TCMProcuraSubTipo;
    Label48: TLabel;
    edTerceiro: TwwDBEdit;
    bbtnSelTerceiro: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnSelConjuntoClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnNovoConjuntoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelClasseClick(Sender: TObject);
    procedure bbtnSelFornecClick(Sender: TObject);
    procedure bbtnSelTerceiroClick(Sender: TObject);
    procedure bbtnSelGrupoClick(Sender: TObject);
    procedure bbtnSelSubContaClick(Sender: TObject);
    procedure bbtnSelAtivProjetoClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure edValHistoricoExit(Sender: TObject);
    procedure qrySelGrupoAfterOpen(DataSet: TDataSet);
    procedure qrySelFornecAfterOpen(DataSet: TDataSet);
    procedure bbtnGeraPlacaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDataInclusaoExit(Sender: TObject);
    procedure bbtnLivrosClick(Sender: TObject);
    procedure bbtnRetornaPlacaClick(Sender: TObject);
    procedure pgctlBemChange(Sender: TObject);
    procedure eValOrgExit(Sender: TObject);
    procedure eValDepIniExit(Sender: TObject);
    procedure edDataInicioDepExit(Sender: TObject);
    procedure edDtaContabExit(Sender: TObject);
    procedure CMProcuraForCliExit(Sender: TObject);
    procedure CMProcuraTerceiroExit(Sender: TObject);
  private
    { Private declarations }
    MensagemErro : String;
  public
    { Public declarations }
    sMascaraGrupo, sMascaraEmpresa, sCodPlaca, sRegistro,
    sMoedaFiscal, sMoedaGerencial,
    ProximoCodigo, CodigoAnterior                                  : String;
    bFlgAltRestrita, bEdPlaca, bIntegraContab, bFlgAltCtrlFisico   : Boolean;
    fReavValFis, fReavDepFis, fReavValGer, fReavDepGer,
    fUltReavValFis, fUltReavDepFis, fUltReavValGer, fUltReavDepGer,
    fCotDia, fCotFiscal, fCotGerencial                             : Extended;
    iIdItensRecDev, iIdModulo                                      : Integer;
    //------------------------------------------------------------------------------------
    procedure AtualizaCampos;
    procedure LimpaCampos;
    procedure MudaChave(iIdPessoa,iIdBem : Integer);
    procedure HabilitaCampos(bOpcao : boolean);
    function  VerificaEntrada : Boolean;
    function  Executa_Alteracao_Restrita : boolean;
    function  PlacaUnica(sPlaca : string) : boolean;
    function  ComplZeros(sCodigo : String; iTam : Integer) : string;
    function  ExecutaAlteracaoFisica(iModulo,iConjunto,iTerceiro,iGrupo,iSubConta,
              iAtivProjeto,iClasseBem,iFornec : Integer; fPlaca : double;
              iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,sComplNota,
              sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,fValOrg,
              fCmBem : double; dDataIniDep : tDateTime; fValIniDep, fTaxaDep, fDepLanc,
              fCmDep, fValFis, fValGer, fDepFis, fDepGer, fPropBaixa : Double;
              sIdOpcional, sProcessoAquis, sEmpenhoAquis,
              sPubAutor,sPubEditora, sPubAno : string;
              bFlgBemIntContab : Boolean; dDtaContab : tDateTime) : Boolean;
    function  EstornaMovInicial(iModulo, iEmpresaProp, iBem : Integer;
                                dDataMov, dDataEst : tDate;
                                bFlgContab : Boolean) : Integer;
    function  ExecAltTotal(iIdBem, iModulo,iEmpresaProp,iConjunto,iTerceiro,
              iGrupo,iSubConta,iAtivProjeto,iClasseBem,iFornec : integer;
              sPlaca : String; iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,
              sComplNota, sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,
              fValOrg,fCmBem : double; dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,
              fCmDep,fPropBaixa : double;
              fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep : double; sReavTaxaDep : String;
              dReavData : tDateTime; sReavObs : String; fUltReavValOrg,fUltReavCmBem,
              fUltReavDepLanc, fUltReavCmDep : double; sUltReavTaxaDep : String;
              dUltReavData : tDateTime; sUltReavObs, sIdOpcional,
              sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno : String;
              bBemIntContab : Boolean; dDtaContab :tDateTime) : Boolean;
  end;

var
  frmCadBens: TfrmCadBens;

implementation

uses uSistema, dBasedados, uDatabase, fCadConjunto, uMensErro, uIntegraBack, uAtivoFixo,
     uVerificaPreenchimento, dAtivoFixo, uLancContab, uFormManager;

{$R *.DFM}

//========================================================================================
procedure TfrmCadBens.FormCreate(Sender: TObject);
var
   iAux : Integer;

begin
   Screen.Cursor := crSQLWait;
   inherited;
   qrySelBem.Prepare;
   qrySelConjunto.Prepare;
   qryRateio.Prepare;
   qrySelClasse.Prepare;
   qrySelSituacao.Prepare;
   qryPlaca.Prepare;
   qrySelFornec.Prepare;
   qrySelTerceiro.Prepare;
   qrySelGrupo.Prepare;
   qrySelSubConta.Prepare;
   qrySelAtivProj.Prepare;
   qryParamCaf.Prepare;
   qryReavaliacao.Prepare;
   qryReaval.Prepare;
   qryBemSel.Prepare;
   //-------------------------------------------------------------------------------------
   qryParamCaf.Close;
   qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
   qryParamCaf.Open;
   qrySelSituacao.Open;
   //-------------------------------------------------------------------------------------
   sMascaraEmpresa := '';
   for iAux := 1 to length(trim(inttostr(Sistema.IdEmpresa))) do
   begin
      sMascaraEmpresa := sMascaraEmpresa + '9';
   end;
   //-------------------------------------------------------------------------------------
   sMascaraGrupo := qryParamCafMASCCODGRUPO.AsString;
   while pos('.',sMascaraGrupo) <> 0 do
   begin
      sMascaraGrupo := AtivoFixo.TiraCaracter(sMascaraGrupo,'.');
   end;
   //-------------------------------------------------------------------------------------
   // Seta Forma de geração de código da Placa do Bem
   //-------------------------------------------------------------------------------------
   bEdPlaca := (qryParamCafEDITACODBEM.AsFloat = 1);
   //-------------------------------------------------------------------------------------
   if bEdPlaca then
   begin
      edPlaca.Enabled    := False;
      edPlaca.Color      := clMenu;
      edPlaca.Font.Color := clBlack;
   end else
   begin
      edPlaca.Enabled    := True;
      edPlaca.Color      := clWindow;
      edPlaca.Font.Color := clWindowText;
   end;
   //-------------------------------------------------------------------------------------
   MSConjunto.Filtro.Add('CONJUNTO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSFornec.Filtro.Add('EMPRESAFORN.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSGrupos.Filtro.Add('PLANOGRUPO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   MSAtivProjeto.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + inttostr(Sistema.IdEmpresa));
   //-------------------------------------------------------------------------------------
   if (qryParamCAFSEQBEMEMP.AsFloat = 0) then {sequencial por empresa}
   begin
      sCodPlaca := 'E';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 1) then {sequencial por grupo}
   begin
      sCodPlaca := 'G';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 2) then {sequencial por classe}
   begin
      sCodPlaca := 'C';
   end else
   if (qryParamCAFSEQBEMEMP.AsFloat = 3) then {sequencial}
   begin
      sCodPlaca := 'S';
   end;
   //-------------------------------------------------------------------------------------
   edPlaca.EditMask := '999999999;0; ';
   if bEdPlaca then
   begin
      if (sCodPlaca = 'G') or (sCodPlaca = 'C') then
         edPlaca.EditMask := sMascaraGrupo + '.9999999;0; '
      else
      if (sCodPlaca = 'E') then
         edPlaca.EditMask := sMascaraEmpresa + '.999999999;0; ';
   end;
   //-------------------------------------------------------------------------------------
   bIntegraContab := qryParamCafINTEGRACONTAB.AsString = 'S';
   //-------------------------------------------------------------------------------------
   sMoedaFiscal    := qryParamCafMOEDAFISCAL.AsString;
   sMoedaGerencial := qryParamCafMOEDAGERENCIAL.AsString;
   //-------------------------------------------------------------------------------------
   bFlgAltRestrita   := False;
   bFlgAltCtrlFisico := False;
   bbtnNovoConjunto.Enabled := False;
   bbtnSelConjunto.Enabled  := False;
   pgctlBem.ActivePage := TabIdent;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.sbtnProcurarClick(Sender: TObject);
begin
   Screen.Cursor    := crSQLWait;
   CmeCadastro.Operacao := opProcurar;
   dtmAtivoFixo.MSBem.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if dtmAtivoFixo.MSBem.RetornouValor then
   begin
      MudaChave(StrtoInt(trim(dtmAtivoFixo.MSBem.ValoresChave[0])),
                StrtoInt(trim(dtmAtivoFixo.MSBem.ValoresChave[1])));
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
      sbtnAlterar.Enabled := True;
      sbtnApagar.Enabled  := True;
      AtualizaCampos;
   end else
   begin
      CmeCadastro.Operacao := opVazio;
      CmeCadastro.AtualizaBotoes(Self);
      sbtnAlterar.Enabled := False;
      sbtnApagar.Enabled  := False;
      LimpaCampos;
   end;
   bFlgAltRestrita   := False;
   bFlgAltCtrlFisico := False;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.AtualizaCampos;
begin
   qrySelConjunto.Close;
   qrySelConjunto.ParamByName('IDPESSOA').AsInteger    := qrySelBem.FieldByName('IDPESSOA').AsInteger;
   qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := qrySelBem.FieldByName('IDCONJUNTO').AsInteger;
   qrySelConjunto.Open;
   qryRateio.Close;
   qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelBem.FieldByName('IDPESSOA').AsInteger;
   qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelBem.FieldByName('IDCONJUNTO').AsInteger;
   qryRateio.Open;
   //-------------------------------------------------------------------------------------
   qrySelClasse.Close;
   qrySelClasse.ParamByName('PIDCLASSEBEM').AsInteger := qrySelBem.FieldByName('IDCLASSEBEM').AsInteger;
   qrySelClasse.Open;
   if not qrySelClasse.FieldByName('MASCARAIDOPCIONAL').IsNull then
      edIdOpcional.EditMask := qrySelClasse.FieldByName('MASCARAIDOPCIONAL').AsString + ';0; '
   else
      edIdOpcional.EditMask := '';
   //-------------------------------------------------------------------------------------
   if qrySelBemCONTROLE.Value = 'T' then
      cmbControle.Text  := cmbControle.Items[0];
   if qrySelBemCONTROLE.Value = 'F' then
      cmbControle.Text  := cmbControle.Items[1];
   //-------------------------------------------------------------------------------------
   cmbSituacao.LookupValue := qrySelBem.FieldByName('IDSITUACAO').AsString;
   cmbSituacao.Text        := qrySelBem.FieldByName('DESCSITUACAO').AsString;
   //-------------------------------------------------------------------------------------
   edDescBem.Text    := qrySelBemDESBEM.AsString;
   edPlaca.Text      := qrySelBemPLACA.AsString;
   edNumSerie.Text   := qrySelBemNUMSERIE.AsString;
   edIdOpcional.Text := qrySelBemIDOPCIONAL.AsString;
   edPubAutor.Text   := qrySelBemPUBAUTOR.AsString;
   edPubEditora.Text := qrySelBemPUBEDITORA.AsString;
   edPubAno.Text     := qrySelBemPUBANO.AsString;
   //-------------------------------------------------------------------------------------
   edDataInclusao.Date := qrySelBemDTAINCLUSAO.AsDateTime;
   edNota.Text         := qrySelBemIDNOTA.AsString;
   edComplNota.Text    := qrySelBemCOMPLNOTA.AsString;
   edDataNota.Date     := qrySelBemDTANOTA.AsDateTime;
   edProcesso.Text     := qrySelBemPROCESSOAQUIS.AsString;
   edEmpenho.Text      := qrySelBemEMPENHOAQUIS.AsString;
   //-------------------------------------------------------------------------------------
   sRegistro           := qrySelBemREGISTRO.AsString;
   //-------------------------------------------------------------------------------------
   if qrySelBemIDITENSRECDEV.IsNull then
      iIdItensRecDev := 0
   else
      iIdItensRecDev := qrySelBemIDITENSRECDEV.AsInteger;
   iIdModulo := qrySelBemIDMODULO.AsInteger;
   //-------------------------------------------------------------------------------------
   qrySelFornec.Close;
   qrySelFornec.ParamByName('IDFORCLI').AsInteger  := qrySelBem.FieldByName('IDFORNSERV').AsInteger;
   qrySelFornec.ParamByName('IDEMPRESA').AsInteger := qrySelBem.FieldByName('IDPESSOA').AsInteger;
   qrySelFornec.Open;
   //-------------------------------------------------------------------------------------
   edQtde.Text          := '1';
   edValHistorico.Value := qrySelBem.FieldByName('VALHISTORICO').AsFloat;
   //-------------------------------------------------------------------------------------
   if qrySelConjunto.FieldByName('ALUGADO').AsInteger = 1 then
   begin
      CMProcuraTerceiro.Enabled := True;
      bbtnSelTerceiro.Enabled := True;
      qrySelTerceiro.Close;
      qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := qrySelBem.FieldByName('IDTERCEIRO').AsInteger;
      qrySelTerceiro.Open;
   end else
   begin
      CMProcuraTerceiro.Enabled := False;
      bbtnSelTerceiro.Enabled := False;
      qrySelTerceiro.Close;
   end;
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
   qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qrySelBemIDGRUPO.AsInteger;
   qrySelGrupo.Open;
   //-------------------------------------------------------------------------------------
   edTaxaDep.Value := qrySelBemTAXADEP.AsFloat;
   edDataInicioDep.Date := qrySelBemDATAINICIODEP.AsDateTime;
   ckbFlgBemIntContab.Checked := qrySelBemFLGBEMINTCONTAB.AsInteger = 1;
   edDtaContab.Date := qrySelBemDTACONTAB.AsDateTime;
   //-------------------------------------------------------------------------------------
   qrySelSubConta.Close;
   qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
   qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qrySelBemCODSUBCONTA.AsInteger;
   qrySelSubConta.Open;
   //-------------------------------------------------------------------------------------
   qrySelAtivProj.Close;
   qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := qrySelBemIDPESSOA.AsInteger;
   qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := qrySelBemUNIDNEGOC.AsInteger;
   qrySelAtivProj.Open;
   //-------------------------------------------------------------------------------------
   eValOrg.Value       := qrySelBemVALORG.AsFloat;
   eValDepIni.Value    := qrySelBemDEPLANC.AsFloat;
   eCMValOrg.Value     := qrySelBemCMBEM.AsFloat;
   eCMValDepIni.Value  := qrySelBemCMDEP.AsFloat;
   eDepFis.Text        := FormatFloat('#,0.00;(#,0.00)',qrySelBemDEPFIS.AsFloat);
   eDepGer.Text        := FormatFloat('#,0.00;(#,0.00)',qrySelBemDEPGER.AsFloat);
   eValFis.Text        := FormatFloat('#,0.00;(#,0.00)',qrySelBemVALFIS.AsFloat);
   eValGer.Text        := FormatFloat('#,0.00;(#,0.00)',qrySelBemVALGER.AsFloat);
   //-------------------------------------------------------------------------------------
   qryReavaliacao.Close;
   qryReavaliacao.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
   qryReavaliacao.ParamByName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
   qryReavaliacao.Open;
   if qryReavaliacao.IsEmpty then
   begin
      eReavValOrg.Value      := 0;
      eReavValDepIni.Value   := 0;
      eReavCmValOrg.Value    := 0;
      eReavCmValDepIni.Value := 0;
      eReavData.Text         := '';
      eReavObs.Text          := '';
      eReavTaxaDep.Text      := '0';
      fReavValFis            := 0;
      fReavDepFis            := 0;
      fReavValGer            := 0;
      fReavDepGer            := 0;
      //----------------------------------------------------------------------------------
      eUltReavValOrg.Value      := 0;
      eUltReavValDepIni.Value   := 0;
      eUltReavCmValOrg.Value    := 0;
      eUltReavCmValDepIni.Value := 0;
      eUltReavData.Text         := '';
      eUltReavObs.Text          := '';
      eUltReavTaxaDep.Text      := '0';
      fUltReavValFis            := 0;
      fUltReavDepFis            := 0;
      fUltReavValGer            := 0;
      fUltReavDepGer            := 0;
   end else
   begin
      while not (qryReavaliacao.EOF) do
      begin
         if qryReavaliacao.FieldByName('FLGULTREAVAL').AsInteger = 1 then
         begin
            eUltReavValOrg.Value      := qryReavaliacao.FieldByName('VALORG').AsFloat;
            eUltReavValDepIni.Value   := qryReavaliacao.FieldByName('DEPLANC').AsFloat;
            eUltReavCmValOrg.Value    := qryReavaliacao.FieldByName('CMBEM').AsFloat;
            eUltReavCmValDepIni.Value := qryReavaliacao.FieldByName('CMDEP').AsFloat;
            eUltReavTaxaDep.Value     := qryReavaliacao.FieldByName('TAXADEP').AsFloat;
            eUltReavData.Date         := qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime;
            fUltReavValFis            := qryReavaliacao.FieldByName('VALFIS').AsFloat;
            fUltReavDepFis            := qryReavaliacao.FieldByName('DEPFIS').AsFloat;
            fUltReavValGer            := qryReavaliacao.FieldByName('VALGER').AsFloat;
            fUltReavDepGer            := qryReavaliacao.FieldByName('DEPGER').AsFloat;
            //-------------------------------------------------------------------------
            qryReaval.Close;
            qryReaval.ParamByName('PIDMOVIMENTACAO').AsInteger := qryReavaliacao.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryReaval.Open;
            eUltReavObs.Text := qryReaval.FieldByName('OBS').AsString;
         end else
         begin
            eReavValOrg.Value      := qryReavaliacao.FieldByName('VALORG').AsFloat;
            eReavValDepIni.Value   := qryReavaliacao.FieldByName('DEPLANC').AsFloat;
            eReavCmValOrg.Value    := qryReavaliacao.FieldByName('CMBEM').AsFloat;
            eReavCmValDepIni.Value := qryReavaliacao.FieldByName('CMDEP').AsFloat;
            eReavTaxaDep.Value     := qryReavaliacao.FieldByName('TAXADEP').AsFloat;
            eReavData.Date         := qryReavaliacao.FieldByName('DATAREAVALIACAO').AsDateTime;
            fReavValFis            := qryReavaliacao.FieldByName('VALFIS').AsFloat;
            fReavDepFis            := qryReavaliacao.FieldByName('DEPFIS').AsFloat;
            fReavValGer            := qryReavaliacao.FieldByName('VALGER').AsFloat;
            fReavDepGer            := qryReavaliacao.FieldByName('DEPGER').AsFloat;
            //-------------------------------------------------------------------------
            qryReaval.Close;
            qryReaval.ParamByName('PIDMOVIMENTACAO').AsInteger := qryReavaliacao.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryReaval.Open;
            eReavObs.Text := qryReaval.FieldByName('OBS').AsString;
         end;
         qryReavaliacao.Next;
      end;
   end;
   bFlgAltRestrita   := False;
   bFlgAltCtrlFisico := False;
end;
//========================================================================================
procedure TfrmCadBens.LimpaCampos;
begin
   qrySelConjunto.Close;
   qryRateio.Close;
   //-------------------------------------------------------------------------------------
   qrySelClasse.Close;
   cmbControle.Text        := cmbControle.Items[0];
   cmbSituacao.LookupValue := '';
   cmbSituacao.Text        := '';
   edDescBem.Text          := '';
   edPlaca.Text            := '';
   edNumSerie.Text         := '';
   edIdOpcional.EditMask   := '';
   edIdOpcional.Text       := '';
   edPubAutor.Text         := '';
   edPubEditora.Text       := '';
   edPubAno.Text           := '';
   iIdItensRecDev          := 0;
   iIdModulo               := Sistema.IdModulo;
   //-------------------------------------------------------------------------------------
   edDataInclusao.Text    := '';
   edNota.Text            := '';
   edComplNota.Text       := '';
   edDataNota.Text        := '';
   edProcesso.Text        := '';
   edEmpenho.Text         := '';
   sRegistro              := 'I';
   edQtde.Text            := '1';
   edValHistorico.Value   := 0;
   qrySelFornec.Close;
   qrySelTerceiro.Close;
   //-------------------------------------------------------------------------------------
   ckbFlgBemIntContab.Checked := bIntegraContab;
   edDtaContab.Text := '';
   edTaxaDep.Value := 0;
   edDataInicioDep.Text := '';
   qrySelGrupo.Close;
   qrySelSubConta.Close;
   qrySelAtivProj.Close;
   //-------------------------------------------------------------------------------------
   eValOrg.Value       := 0;
   eValDepIni.Value    := 0;
   eCMValOrg.Value     := 0;
   eCMValDepIni.Value  := 0;
   eDepFis.Text        := FormatFloat('#,0.00;(#,0.00)',0);
   eDepGer.Text        := FormatFloat('#,0.00;(#,0.00)',0);
   eValFis.Text        := FormatFloat('#,0.00;(#,0.00)',0);
   eValGer.Text        := FormatFloat('#,0.00;(#,0.00)',0);
   //-------------------------------------------------------------------------------------
   eReavValOrg.Value         := 0;
   eReavValDepIni.Value      := 0;
   eReavCmValOrg.Value       := 0;
   eReavCmValDepIni.Value    := 0;
   eReavData.Text            := '';
   eReavObs.Text             := '';
   eReavTaxaDep.Text         := '0';
   fReavValFis               := 0;
   fReavDepFis               := 0;
   fReavValGer               := 0;
   fReavDepGer               := 0;
   eUltReavValOrg.Value      := 0;
   eUltReavValDepIni.Value   := 0;
   eUltReavCmValOrg.Value    := 0;
   eUltReavCmValDepIni.Value := 0;
   eUltReavData.Text         := '';
   eUltReavObs.Text          := '';
   eUltReavTaxaDep.Text      := '0';
   fUltReavValFis            := 0;
   fUltReavDepFis            := 0;
   fUltReavValGer            := 0;
   fUltReavDepGer            := 0;
end;
//========================================================================================
procedure TfrmCadBens.MudaChave(iIdPessoa,iIdBem: Integer);
begin
   qrySelBem.Close;
   qrySelBem.ParamByName('PIDPESSOA').AsInteger := iIdPessoa;
   qrySelBem.ParamByName('PIDBEM').AsInteger    := iIdBem;
   qrySelBem.Open;
end;
//========================================================================================
procedure TfrmCadBens.sbtnInserirClick(Sender: TObject);
begin
   CmeCadastro.Operacao := opInserir;
   CmeCadastro.RepetirInsert := True;
   CmeCadastro.AtualizaBotoes(Self);
   bbtnNovoConjunto.Enabled := True;
   bbtnSelConjunto.Enabled  := True;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
   HabilitaCampos(True);
   toolbar971.SetFocus;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelConjuntoClick(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   MSConjunto.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBens.Invalidate;
   frmCadBens.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSConjunto.ValoresChave.Count > 0) and (MSConjunto.ValoresChave[0] <> '') then
   begin
      qrySelConjunto.Close;
      qrySelConjunto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := StrToInt(MSConjunto.ValoresChave[0]);
      qrySelConjunto.Open;
      qryRateio.Close;
      qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelConjunto.FieldByName('IDPESSOA').AsInteger;
      qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjunto.FieldByName('IDCONJUNTO').AsInteger;
      qryRateio.Open;
      //----------------------------------------------------------------------------------
      if qrySelConjunto.FieldByName('ALUGADO').AsInteger = 1 then
      begin
         CMProcuraTerceiro.Enabled := True;
         bbtnSelTerceiro.Enabled := True;
         qrySelTerceiro.Close;
         qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDTERCEIRO.AsInteger;
         qrySelTerceiro.Open;
      end else
      begin
         CMProcuraTerceiro.Enabled := False;
         bbtnSelTerceiro.Enabled := False;
         qrySelTerceiro.Close;
      end;
      //----------------------------------------------------------------------------------
      toolbar971.SetFocus;
   end;
   Screen.Cursor := crDefault;
   bbtnSelConjunto.Down := False;
end;
//========================================================================================
procedure TfrmCadBens.bbtnNovoConjuntoClick(Sender: TObject);
var
   iIdConjunto : Integer;

begin
   frmCadConjunto := TfrmCadConjunto.Create(Self);
   frmCadConjunto.FormStyle := FsNormal;
   frmCadConjunto.Visible   := False;
   frmCadConjunto.Top       := 76;
   frmCadConjunto.ShowModal;
   //-------------------------------------------------------------------------------------
   iIdConjunto := frmCadConjunto.qryUltConj.Fieldbyname('IDCONJUNTO').AsInteger;
   frmCadConjunto.qryUltConj.Close;
   frmCadConjunto.qryUltConj.UnPrepare;
   frmCadConjunto.Release;
   //-------------------------------------------------------------------------------------
   qrySelConjunto.Close;
   qrySelConjunto.ParamByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
   qrySelConjunto.ParamByName('PIDCONJUNTO').AsInteger := iIdConjunto;
   qrySelConjunto.Open;
   qryRateio.Close;
   qryRateio.ParamByName('PIDPESSOA').AsInteger   := qrySelConjunto.Fieldbyname('IDPESSOA').AsInteger;
   qryRateio.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjunto.Fieldbyname('IDCONJUNTO').AsInteger;
   qryRateio.Open;
   //-------------------------------------------------------------------------------------
   if qrySelConjunto.FieldByName('ALUGADO').AsInteger = 1 then
   begin
      CMProcuraTerceiro.Enabled := True;
      bbtnSelTerceiro.Enabled := True;
      qrySelTerceiro.Close;
      qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDTERCEIRO.AsInteger;
      qrySelTerceiro.Open;
   end else
   begin
      CMProcuraTerceiro.Enabled := False;
      bbtnSelTerceiro.Enabled := False;
      qrySelTerceiro.Close;
   end;
   //-------------------------------------------------------------------------------------
   bbtnNovoConjunto.Down := False;
end;
//========================================================================================
procedure TfrmCadBens.HabilitaCampos(bOpcao : boolean);
begin
   pnlFundo.Enabled := bOpcao;
end;
//========================================================================================
procedure TfrmCadBens.sbtnAlterarClick(Sender: TObject);
begin
   if qrySelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
   begin
      MsgDlg('Bem totalmente baixado não pode ser alterado!','Erro',mtError,[mbOk],0);
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
   end;
   //-------------------------------------------------------------------------------------
   if qrySelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
   begin
      MsgDlg('Bem em Saída Temporária não pode ser alterado!','Erro',mtError,[mbOk],0);
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
   end;
   //-------------------------------------------------------------------------------------
   qryHistMov.Close;
   qryHistMov.ParamByName('PIDPESSOA').AsFloat := qrySelBemIDPESSOA.AsFloat;
   qryHistMov.ParamByName('PIDBEM').AsFloat    := qrySelBemIDBEM.AsFloat;
   qryHistMov.Open;
   //-------------------------------------------------------------------------------------
   bFlgAltRestrita   := False;
   bFlgAltCtrlFisico := (qrySelBemCONTROLE.AsString <> 'T') or (qrySelBemCONTROLE.IsNull);
   if (not qryHistMov.IsEmpty) or (qrySelBemFLGDEPREC.AsInteger = 1) or
      ((qrySelBemTAXADEP.AsFloat = 0) and ((date - qrySelBemDATAINICIODEP.AsDateTime) > 60)) then
   begin
      MsgDlg('Bem já movimentado ou totalmente depreciado. Alteração Restrita .',
             'Atenção',mtInformation,[mbOk],0);
      bFlgAltRestrita := True;
   end else
   begin
      qryBemSel.Close;
      qryBemSel.ParamByName('PIDPESSOA').AsFloat := qrySelBemIDPESSOA.AsFloat;
      qryBemSel.ParamByName('PIDBEM').AsFloat    := qrySelBemIDBEM.AsFloat;
      qryBemSel.Open;
      //----------------------------------------------------------------------------------
      if not qryBemSel.IsEmpty then
      begin
         if qryBemSel.FieldByName('SBTIPOMOV').AsInteger = 0 then // 0 - Baixa, 1 - Transferência
         begin
            MsgDlg('Bem selecionado no Termo de Baixa ' + qryBemSel.FieldByName('SBXTERMO').AsString + ' ainda não executado.' + #13 +
                   'Alteração Restrita.','Erro',mtError,[mbOk],0)
         end else
         begin
            MsgDlg('Bem selecionado no Termo de Transferência ' + qryBemSel.FieldByName('SBXTERMO').AsString + ' ainda não executado.' + #13 +
                   'Alteração Restrita.','Erro',mtError,[mbOk],0);
         end;
         bFlgAltRestrita := True;
      end;
   end;
   qryBemSel.Close;
   qryHistMov.Close;

   CmeCadastro.Operacao      := opAlterar;
   CmeCadastro.RepetirInsert := False;
   CmeCadastro.AtualizaBotoes(Self);
   //-------------------------------------------------------------------------------------
   HabilitaCampos(True);
   cmbControle.Enabled := False;
   if bFlgAltRestrita then
   begin
      edDataInclusao.Enabled := False;
      edQtde.Enabled         := False;
      edValHistorico.Enabled := False;
      TabContab.Enabled      := False;
      TabValores.Enabled     := False;
   end else
   begin
      bbtnNovoConjunto.Enabled := True;
      bbtnSelConjunto.Enabled  := True;
   end;
end;
//========================================================================================
procedure TfrmCadBens.bbtnConfirmarClick(Sender: TObject);
var
   iBemOld, iExercicio, iPeriodo,
   iPlanilha, iTerceiro, iFornecedor,
   iSubConta, iAtivProjeto             : Integer;
   bInsert, bIdbem                     : boolean;
   sMensagem, sControle                : string;
   dReavData, dUltReavData, dDtaContab : tDateTime;

begin
   if not ((CmeCadastro.Operacao = opInserir) or (CmeCadastro.Operacao = opAlterar)) then
      exit;
   //-------------------------------------------------------------------------------------
   if not VerificaEntrada then
      exit;
   //-------------------------------------------------------------------------------------
   bbtnConfirmar.Enabled := False;
   bbtnCancelar.Enabled  := False;
   Screen.Cursor := crSQLWait;
   bInsert := CmeCadastro.RepetirInsert and (CmeCadastro.Operacao = opInserir);
   iBemOld := -1;
   //-------------------------------------------------------------------------------------
   if qrySelTerceiro.IsEmpty then
   begin
      iTerceiro := -1;
   end else
   begin
      iTerceiro := qrySelTerceiro.FieldByName('IDPESSOA').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   if qrySelFornec.IsEmpty then
   begin
      iFornecedor := -1;
   end else
   begin
      iFornecedor := qrySelFornec.FieldByName('IDFORCLI').AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   if cmbControle.Text = 'Físico' then
   begin
      sControle := 'F'
   end else
   begin
      if cmbControle.Text = 'Total' then
      begin
         sControle := 'T';
      end;
   end;
   //-------------------------------------------------------------------------------------
   if eReavData.Text = '' then
   begin
      dReavData := 0;
   end else
   begin
      dReavData := eReavData.Date;
   end;
   //-------------------------------------------------------------------------------------
   if eUltReavData.Text = '' then
   begin
      dUltReavData := 0;
   end else
   begin
      dUltReavData := eUltReavData.Date;
   end;
   //-------------------------------------------------------------------------------------
   if qrySelSubConta.IsEmpty then
   begin
      iSubConta := 0;
   end else
   begin
      iSubConta := qrySelSubContaCODSUBCONTA.AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   if qrySelAtivProj.IsEmpty then
   begin
      iAtivProjeto := -1;
   end else
   begin
      iAtivProjeto := qrySelAtivProjUNIDNEGOC.AsInteger;
   end;
   //-------------------------------------------------------------------------------------
   try
      StartTransacao;
      //----------------------------------------------------------------------------------
      // REGISTRA ALTERAÇÕES REALIZADAS NO BEM
      //----------------------------------------------------------------------------------
      if CmeCadastro.Operacao = opAlterar then
      begin
         //-------------------------------------------------------------------------------
         // ALTERAÇÃO EM BEM COM CONTROLE FÍSICO
         //-------------------------------------------------------------------------------
         if bFlgAltCtrlFisico then
         begin
            bIdbem := ExecutaAlteracaoFisica(iIdModulo,
                                             qrySelConjunto.Fieldbyname('IDCONJUNTO').AsInteger,
                                             iTerceiro,
                                             qrySelGrupoIDGRUPO.AsInteger,
                                             iSubConta,
                                             iAtivProjeto,
                                             trunc(qrySelClasseIDCLASSEBEM.AsFloat),
                                             iFornecedor,
                                             strtofloat(edPlaca.Text),
                                             qrySelSituacaoIDSITUACAO.AsInteger,
                                             sRegistro,
                                             sControle,
                                             edDescBem.Text,
                                             edNota.Text,
                                             edComplNota.Text,
                                             edNumSerie.Text,
                                             edDataNota.Date,
                                             edDataInclusao.Date,
                                             edValHistorico.Value,
                                             eValOrg.Value,
                                             eCmValOrg.Value,
                                             edDataInicioDep.Date,
                                             eValDepIni.Value,
                                             edTaxaDep.Value,
                                             eValDepIni.Value,
                                             eCmValDepIni.Value,
                                             eValFis.Value,
                                             eValGer.Value,
                                             eDepFis.Value,
                                             eDepGer.Value,
                                             0,
                                             edIdOpcional.Text,
                                             edProcesso.Text,
                                             edEmpenho.Text,
                                             edPubAutor.Text,
                                             edPubEditora.Text,
                                             edPubAno.Text,
                                             ckbFlgBemIntContab.Checked,
                                             edDtaContab.Date);
            if not bIdBem then
               Raise Exception.Create('Cadastro de Bem : Alteração' + #13 + #13 + MensagemErro);
         end else
         //-------------------------------------------------------------------------------
         // ALTERAÇÃO EM BEM COM CONTROLE TOTAL
         //-------------------------------------------------------------------------------
         begin
            //----------------------------------------------------------------------------
            // ALTERAÇÃO TOTAL DO BEM
            //----------------------------------------------------------------------------
            if not bFlgAltRestrita then
            begin
               if bIntegraContab and ckbFlgBemIntContab.Checked then
                  if not AtivoFixo.VerificaPeriodoContabil(Sistema.IdEmpresa,edDtaContab.Date,
                                                           iExercicio,iPeriodo,sMensagem) then
                     Raise Exception.Create(AtivoFixo.MensagemErro);
               //-------------------------------------------------------------------------
               //  Se o bem estiver com DTACONTAB nulo, assumir DATAINICIODEP
               //-------------------------------------------------------------------------
               if qrySelBemDTACONTAB.IsNull then
                  dDtaContab := qrySelBemDATAINICIODEP.AsDateTime
               else
                  dDtaContab := qrySelBemDTACONTAB.AsDateTime;
               //-------------------------------------------------------------------------
               //  ESTORNA A MOVIMENTACAO INICIAL DO BEM
               //-------------------------------------------------------------------------
               iPlanilha := EstornaMovInicial(iIdModulo,Sistema.IdEmpresa,
                                              qrySelBem.FieldByName('IDBEM').AsInteger,
                                              qrySelBem.FieldByName('DATAINICIODEP').AsDateTime,
                                              dDtaContab, ckbFlgBemIntContab.Checked);
               if iPlanilha < 0 then
                  Raise Exception.Create('Erro no estorno da movimentação inicial do bem.' + #13 +
                                          MensagemErro);
               //-------------------------------------------------------------------------
               // REGISTRA AS ALTERAÇÕES NO BEM COM CONTROLE TOTAL
               //-------------------------------------------------------------------------
               bIdBem := ExecAltTotal(qrySelBemIDBEM.AsInteger,
                                      iIdModulo,
                                      Sistema.IdEmpresa,
                                      qrySelConjunto.Fieldbyname('IDCONJUNTO').AsInteger,
                                      iTerceiro,
                                      qrySelGrupoIDGRUPO.AsInteger,
                                      iSubConta,
                                      iAtivProjeto,
                                      trunc(qrySelClasseIDCLASSEBEM.AsFloat),
                                      iFornecedor,
                                      edPlaca.Text,
                                      qrySelSituacaoIDSITUACAO.AsInteger,
                                      sRegistro,
                                      sControle,
                                      edDescBem.Text,
                                      edNota.Text,
                                      edComplNota.Text,
                                      edNumSerie.Text,
                                      edDataNota.Date,
                                      edDataInclusao.Date,
                                      edValHistorico.Value,
                                      eValOrg.Value,
                                      eCmValOrg.Value,
                                      edDataInicioDep.Date,
                                      eValDepIni.Value,
                                      edTaxaDep.Value,
                                      eValDepIni.Value,
                                      eCmValDepIni.Value,
                                      0,
                                      eReavValOrg.Value,
                                      eReavCmValOrg.Value,
                                      eReavValDepIni.Value,
                                      eReavCmValDepIni.Value,
                                      eReavTaxaDep.Text,
                                      dReavData,
                                      eReavObs.Text,
                                      eUltReavValOrg.Value,
                                      eUltReavCmValOrg.Value,
                                      eUltReavValDepIni.Value,
                                      eUltReavCmValDepIni.Value,
                                      eUltReavTaxaDep.Text,
                                      dUltReavData,
                                      eUltReavObs.Text,
                                      edIdOpcional.Text,
                                      edProcesso.Text,
                                      edEmpenho.Text,
                                      edPubAutor.Text,
                                      edPubEditora.Text,
                                      edPubAno.Text,
                                      ckbFlgBemIntContab.Checked,
                                      edDtaContab.Date);
               if not bIdBem then
                  Raise Exception.Create('Cadastro de Bem : Alteração' + #13 + #13 + MensagemErro)
               else
                  MsgDlg('BEM Alterado.','Informação',mtInformation,[mbOk],0);
            end else
            //----------------------------------------------------------------------------
            begin
               if not Executa_Alteracao_Restrita then
                  Raise Exception.Create('Cadastro de Bem : Alteração Restrita' + #13 + #13 + MensagemErro);
               //-------------------------------------------------------------------------
               CommitTransacao;
               HabilitaCampos(True);
               cmbControle.Enabled    := True;
               edDataInclusao.Enabled := True;
               edQtde.Enabled         := True;
               edValHistorico.Enabled := True;
               TabContab.Enabled      := True;
               TabValores.Enabled     := True;
               LimpaCampos;
               //-------------------------------------------------------------------------
               CmeCadastro.Operacao := opIdle;
               CmeCadastro.AtualizaBotoes(Self);
               Screen.Cursor := crDefault;
               pgctlBem.ActivePage := TabIdent;
               exit;
            end;
         end;
      end;
      //----------------------------------------------------------------------------------
      // REGISTRA A INCLUSÃO DO BEM
      //----------------------------------------------------------------------------------
      if CmeCadastro.Operacao = opInserir then
      begin
         if bIntegraContab and ckbFlgBemIntContab.Checked then
            if not AtivoFixo.VerificaPeriodoContabil(Sistema.IdEmpresa,edDtaContab.Date,
                                                     iExercicio,iPeriodo,sMensagem) then
               Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         bIdBem := AtivoFixo.ExecutaEntradaBem(iBemOld,
                             iIdModulo,
                             Sistema.IdEmpresa,
                             qrySelConjunto.Fieldbyname('IDCONJUNTO').AsInteger,
                             iTerceiro,
                             qrySelGrupoIDGRUPO.AsInteger,
                             iSubConta,
                             iAtivProjeto,
                             trunc(qrySelClasseIDCLASSEBEM.AsFloat),
                             iIdItensRecDev,
                             iFornecedor,
                             -1,                                       // IDIMAGEM
                             edPlaca.Text,
                             qrySelSituacaoIDSITUACAO.AsInteger,
                             sRegistro,
                             sControle,
                             edDescBem.Text,
                             edNota.Text,
                             edComplNota.Text,
                             edNumSerie.Text,
                             edDataNota.Date,
                             edDataInclusao.Date,
                             edValHistorico.Value,
                             eValOrg.Value,
                             eCmValOrg.Value,
                             edDataInicioDep.Date,
                             eValDepIni.Value,
                             edTaxaDep.Value,
                             eValDepIni.Value,
                             eCmValDepIni.Value,
                             0,
                             -1,
                             -1,
                             -1,                                       
                             eReavValOrg.Value,
                             eReavCmValOrg.Value,
                             eReavValDepIni.Value,
                             eReavCmValDepIni.Value,
                             eReavTaxaDep.Text,
                             dReavData,
                             eReavObs.Text,
                             eUltReavValOrg.Value,
                             eUltReavCmValOrg.Value,
                             eUltReavValDepIni.Value,
                             eUltReavCmValDepIni.Value,
                             eUltReavTaxaDep.Text,
                             dUltReavData,
                             eUltReavObs.Text,
                             edIdOpcional.Text,
                             edProcesso.Text,
                             edEmpenho.Text,
                             edPubAutor.Text,
                             edPubEditora.Text,
                             edPubAno.Text,
                             ckbFlgBemIntContab.Checked,
                             edDtaContab.Date,
                             True,
                             strtoint(edQtde.Text));
         //-------------------------------------------------------------------------------
         if not bIdBem then
         begin
            Raise Exception.Create(AtivoFixo.MensagemErro);
         end else
         begin
            CommitTransacao;
            //----------------------------------------------------------------------------
            if strtoint(edQtde.Text) = 1 then
               Msgdlg('BEM Cadastrado.','Informação',mtInformation,[mbOk],0)
            else
               Msgdlg('BENS Cadastrados.','Informação',mtInformation,[mbOk],0);
            //----------------------------------------------------------------------------
            HabilitaCampos(True);
            LimpaCampos;
         end;
      end else
      begin
         CommitTransacao;
         HabilitaCampos(True);
         cmbControle.Enabled := True;
         LimpaCampos;
      end;
      //----------------------------------------------------------------------------------
      CmeCadastro.Operacao := opIdle;
      if bInsert then
         sbtnInserir.Click
      else
      begin
         CmeCadastro.AtualizaBotoes(Self);
         bbtnNovoConjunto.Enabled := False;
         bbtnSelConjunto.Enabled  := False;
      end;
   except
      On E : Exception do
      begin
         RollBackTransacao;
         //-------------------------------------------------------------------------------
         // Retorna o valor anterior do gerador automático de placas (Caso esteja ativado)
         //-------------------------------------------------------------------------------
         if bEdPlaca then
         begin
            qryParamCAF.Close;
            qryAux.Close;
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + CodigoAnterior +
                           ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
            qryAux.ExecSQL;
            qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
            qryParamCaf.Open;
         end;
         //-------------------------------------------------------------------------------
         if strtoint(edQtde.Text) = 1 then
            MsgDlg('Bem não Cadastrado!' + #13 + #13 +
                   'Causa : ' + E.Message ,
                   'Erro',mtError,[mbOk],0)
         else
            MsgDlg('Bens não Cadastrados!' + #13 + #13 +
                   'Causa : ' + E.Message ,
                   'Erro',mtError,[mbOk],0);
      end;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
   pgctlBem.ActivePage   := TabIdent;
   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;
end;
//========================================================================================
procedure TfrmCadBens.bbtnCancelarClick(Sender: TObject);
begin
   inherited;
   cmbControle.Enabled      := True;
   edDataInclusao.Enabled   := True;
   edQtde.Enabled           := True;
   edValHistorico.Enabled   := True;
   TabContab.Enabled        := True;
   TabValores.Enabled       := True;
   bbtnNovoConjunto.Enabled := False;
   bbtnSelConjunto.Enabled  := False;
   //-------------------------------------------------------------------------------------
   // Retorna o valor anterior do gerador automático de placas (Caso esteja ativado)
   //-------------------------------------------------------------------------------------
   if bEdPlaca and (CodigoAnterior <> '') then
   begin
      qryParamCAF.Close;
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' + CodigoAnterior +
                     ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
      qryAux.ExecSQL;
      qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
      qryParamCaf.Open;
   end;
   //-------------------------------------------------------------------------------------
   LimpaCampos;
   pgctlBem.ActivePage := TabIdent;
end;
//========================================================================================
function TfrmCadBens.VerificaEntrada : Boolean;
begin
	 Result := False;
   try
      // Conjunto
      if (qrySelConjuntoIDCONJUNTO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar o Conjunto do Bem!', ToolBar971);
      // Classe
      if (qrySelClasseIDCLASSEBEM.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Classe do Bem!', bbtnSelClasse);
      // Controle
      if (cmbControle.Text = '') then
         Raise EValidacao.CreateVal('É necessário selecionar a Forma de Controle do Bem!', cmbControle);
      // Controle
      if (qrySelSituacaoIDSITUACAO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Situação do Bem!', cmbSituacao);
      // Descrição do Bem
      if (edDescBem.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a Descrição do Bem!', edDescBem);
      // Número de Tombamento Patrimonial
      if (qrySelGrupoFLGSEMPLACA.AsInteger = 0) then
         if (edPlaca.Text = '') then
            Raise EValidacao.CreateVal('É necessário informar o Número de Tombamento Patrimonial do Bem!', edPlaca);
      if (edPlaca.Text <> '') then
         if (not PlacaUnica(edPlaca.Text)) then
            Raise EValidacao.CreateVal('O Número de Tombamento Patrimonial do Bem deve ser exclusivo!', edPlaca);
      // Data de Inclusao
      if (edDataInclusao.Text = '') then
      begin
         Raise EValidacao.CreateVal('É necessário informar a Data de Entrada do Bem no patrimonio', edDataInclusao);
      end else
      if (not ckbFlgBemIntContab.Checked) and ((edDataInclusao.Date - date) > 28) then
         Raise EValidacao.CreateVal('A Data de Entrada do Bem no patrimonio está no futuro', edDataInclusao);
      // Quantidade
      if (edQtde.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a quantidade de bens que será gerada', edQtde);
      // Valor Historico de Aquisição
      if (edValHistorico.Value = 0) then
         Raise EValidacao.CreateVal('É necessário informar o valor histórico de aquisição dos bens', edValHistorico);
      // Grupo
      if (qrySelGrupoIDGRUPO.IsNull) then
         Raise EValidacao.CreateVal('É necessário selecionar a Grupo do Bem!', bbtnSelGrupo);
      // Data de Contabilização
      if (ckbFlgBemIntContab.Checked) and (edDtaContab.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a data de registro da entrada do bem na contabilidade!', edDtaContab);
      // Data de Inicio da Depreciação
      if (edDataInicioDep.Text = '') then
         Raise EValidacao.CreateVal('É necessário informar a data de inicio da depreciação do bem!', edDataInicioDep);
      // Valor da Depreciacao inicial deve ser inferior ao valor do bem
      if FormatFloat('#0.00',eValDepIni.Value + eCMvalDepIni.Value) > FormatFloat('#0.00',eValOrg.Value + eCmValOrg.Value) then
         Raise EValidacao.CreateVal('Valor da depreciação inicial não pode ser maior que valor de aquisição em Moeda Corrente!', eValOrg);
      // Bens com Controle Físico não sofrem reavaliação
      if (cmbControle.Text = 'Físico') and (((eReavValOrg.Value + eReavCmValOrg.Value) -
                                             (eReavValDepIni.Value + eReavCmValDepIni.Value)) > 0) then
         Raise EValidacao.CreateVal('Não pode haver lançamento de reavaliação em bem com controle físico!', eReavValOrg);
      // Bens com Controle Físico não sofrem reavaliação
      if (cmbControle.Text = 'Físico') and (((eUltReavValOrg.Value + eUltReavCmValOrg.Value) -
                                             (eUltReavValDepIni.Value + eUltReavCmValDepIni.Value)) > 0) then
         Raise EValidacao.CreateVal('Não pode haver lançamento de reavaliação em bem com controle físico!', eUltReavValOrg);
   except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then
            MsgDlg(ev.message, 'Atenção', mtWarning, [mbOk], 0);
         Repaint;
         if ev.Control.CanFocus then
            ev.Control.SetFocus;
         exit;
      end;
   end;
   Result := True;
end;
//========================================================================================
function TfrmCadBens.Executa_Alteracao_Restrita : Boolean;
begin
   try
      qryAltBem.Close;
      qryAltBem.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
      qryAltBem.ParamByName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
      qryAltBem.Open;
      //----------------------------------------------------------------------------------
      qryAltBem.Edit;
      qryAltBemDESBEM.AsString      := edDescBem.Text;
      qryAltBemNUMSERIE.AsString    := edNumSerie.Text;
      qryAltBemPLACA.AsFloat        := strtofloat(edPlaca.Text);
      qryAltBemIDCLASSEBEM.AsFloat  := qrySelClasseIDCLASSEBEM.AsFloat;
      qryAltBemIDSITUACAO.AsInteger := qrySelSituacaoIDSITUACAO.AsInteger;
      qryAltBemIDNOTA.AsString      := edNota.Text;
      qryAltBemCOMPLNOTA.AsString   := edComplNota.Text;
      qryAltBemDTANOTA.AsDateTime   := edDataNota.Date;
      qryAltBemIDOPCIONAL.AsString  := edIdOpcional.Text;
      qryAltBemPUBAUTOR.AsString    := edPubAutor.Text;
      qryAltBemPUBEDITORA.AsString  := edPubEditora.Text;
      qryAltBemPUBANO.AsString      := edPubAno.Text;
      //----------------------------------------------------------------------------------
      qryAltBem.Post;
      qryAltBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Alteracao do Bem ' + qrySelBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      Msgdlg('BEM Alterado.','Informação',mtInformation,[mbOk],0);
      Result := True;
   except
      On E : Exception do
      begin
         MsgDlg('BEM não Alterado' + #13 + #13 + 'Erro Grave - Excessão : ' + E.Message,'Erro', mtError, [mbOk], 0);
         Result := False;
      end;
   end;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelClasseClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSClasse.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSClasse.RetornouValor then
   begin
      qrySelClasse.Close;
      qrySelClasse.ParamByName('PIDCLASSEBEM').AsInteger := StrToInt(MSClasse.ValoresChave[0]);
      qrySelClasse.Open;
      if not qrySelClasseMASCARAIDOPCIONAL.IsNull then
         edIdOpcional.EditMask := qrySelClasseMASCARAIDOPCIONAL.AsString + ';0; '
      else
         edIdOpcional.EditMask := '';
   end;
   //-------------------------------------------------------------------------------------
   // Seleciona o Grupo Contábil
   //-------------------------------------------------------------------------------------
   if (CmeCadastro.Operacao = opInserir) or (not qrySelGrupo.Active) then
   begin
      qryBuscaGrupo.Close;
      qryBuscaGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryBuscaGrupo.ParamByName('PIDLOCAL').AsInteger  := qrySelConjunto.FieldByName('IDLOCALIZACAO').AsInteger;
      qryBuscaGrupo.ParamByName('PIDCLASSE').AsInteger := qrySelClasse.FieldByName('IDCLASSEBEM').AsInteger;
      qryBuscaGrupo.Open;
      if not qryBuscaGrupo.IsEmpty then
      begin
         qrySelGrupo.Close;
         qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
         qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := qryBuscaGrupo.FieldByName('IDGRUPO').AsInteger;
         qrySelGrupo.Open;
      end else
      begin
         qrySelGrupo.Close;
      end;
      //----------------------------------------------------------------------------------
      // Se for inclusão e o parâmetro estiver setado, incluir na descricao
      //----------------------------------------------------------------------------------
      if not qryParamCAF.Active then
      begin
         qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
         qryParamCaf.Open;
      end;
      if (qryParamCafFLGCLSDESBEM.AsInteger = 1) and (edDescBem.Text = '') then
      begin
         edDescBem.Text := qrySelClasseDESCRICAO.AsString;
      end;
   end;
   //-------------------------------------------------------------------------------------
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelFornecClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSFornec.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSFornec.RetornouValor then
   begin
      qrySelFornec.Close;
      qrySelFornec.ParamByName('IDFORCLI').AsInteger  := StrToInt(MSFornec.ValoresChave[0]);
      qrySelFornec.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qrySelFornec.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.CMProcuraForCliExit(Sender: TObject);
begin
   inherited;
   if CMProcuraForCli.Valida = vcOk then
   begin
      qrySelFornec.Close;
      qrySelFornec.ParamByName('IDFORCLI').AsFloat    := CMProcuraForCli.ForCliReg.Id;
      qrySelFornec.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
      qrySelFornec.Open;
   end;
end;
//========================================================================================
procedure TfrmCadBens.CMProcuraTerceiroExit(Sender: TObject);
begin
   inherited;
   if CMProcuraTerceiro.Valida = vcOk then
   begin
      qrySelTerceiro.Close;
      qrySelTerceiro.ParamByName('PIDPESSOA').AsFloat := CMProcuraTerceiro.SubTipoReg.Id;
      qrySelTerceiro.Open;
   end;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelTerceiroClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSTerceiros.Executar;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if MSTerceiros.RetornouValor then
   begin
      qrySelTerceiro.Close;
      qrySelTerceiro.ParamByName('PIDPESSOA').AsInteger := StrToInt(MSTerceiros.ValoresChave[0]);
      qrySelTerceiro.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelGrupoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSGrupos.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBens.Invalidate;
   frmCadBens.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   qrySelGrupo.Close;
   if (MSGrupos.RetornouValor) then
   begin
      qrySelGrupo.ParamByName('PIDGRUPO').AsInteger  := StrToInt(MSGrupos.ValoresChave[0]);
      qrySelGrupo.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelGrupo.Open;
      //----------------------------------------------------------------------------------
      // Verificar se o Grupo está relacionado com a Classe do Bem
      //----------------------------------------------------------------------------------
      qryVerificaClasse.Close;
      qryVerificaClasse.ParamByName('PIDGRUPO').AsInteger     := qrySelGrupoIDGRUPO.AsInteger;
      qryVerificaClasse.ParamByName('PIDCLASSEBEM').AsInteger := qrySelClasseIDCLASSEBEM.AsInteger;
      qryVerificaClasse.Open;
      if qryVerificaClasse.IsEmpty then
      begin
         MsgDlg('Grupo escolhido é inválido para a Classe selecionada do Bem. '+
                'Selecione o Grupo Correto','Erro',mtError,[mbOk],0);
         qrySelGrupo.Close;
         exit;
      end;
      //----------------------------------------------------------------------------------
      // Verificar se a mudança de conjunto irá acarretar uma mudança de grupo
      //----------------------------------------------------------------------------------
      qryVerificaGrupo.Close;
      qryVerificaGrupo.ParamByName('IDPESSOA').AsInteger    := Sistema.IdEmpresa;
      qryVerificaGrupo.ParamByName('PIDGRUPO').AsInteger    := qrySelGrupoIDGRUPO.AsInteger;
      qryVerificaGrupo.ParamByName('PIDCONJUNTO').AsInteger := qrySelConjuntoIDCONJUNTO.AsInteger;
      qryVerificaGrupo.Open;
      if qryVerificaGrupo.IsEmpty then
      begin
         MsgDlg('Grupo selecionado inválido para o Conjunto/Localização/Centro de Custo do Bem. '+ #13 +
                'Selecione o Grupo Correto','Erro',mtError,[mbOk],0);
         qrySelGrupo.Close;
         exit;
      end;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelSubContaClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSSubConta.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBens.Invalidate;
   frmCadBens.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSSubConta.ValoresChave.Count > 0) and (MSSubConta.ValoresChave[0] <> '') then
   begin
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := StrToInt(MSSubConta.ValoresChave[0]);
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.bbtnSelAtivProjetoClick(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crSQLWait;
   MSAtivProjeto.Executar;
   //-------------------------------------------------------------------------------------
   frmCadBens.Invalidate;
   frmCadBens.Repaint;
   Application.ProcessMessages;
   //-------------------------------------------------------------------------------------
   if (MSAtivProjeto.ValoresChave.Count > 0) and (MSAtivProjeto.ValoresChave[0] <> '') then
   begin
      qrySelAtivProj.Close;
      qrySelAtivProj.ParamByName('PIDATIVPROJETO').AsInteger := StrToInt(MSAtivProjeto.ValoresChave[0]);
      qrySelAtivProj.ParamByName('PIDPESSOA').AsInteger      := Sistema.IdEmpresa;
      qrySelAtivProj.Open;
   end;
   Screen.Cursor := crDefault;
end;
//========================================================================================
procedure TfrmCadBens.sbtnApagarClick(Sender: TObject);
var
   iPlanilha : Integer;

begin
   if CmeCadastro.Operacao = opIdle then
   begin
      CmeCadastro.Operacao := opApagar;
      //----------------------------------------------------------------------------------
      if qrySelBem.FieldByName('BAIXATOTAL').AsString = 'S' then
      begin
         MsgDlg('Bem totalmente baixado não pode ser alterado!','Erro',mtError,[mbOk],0);
         CmeCadastro.Operacao := opIdle;
         CmeCadastro.AtualizaBotoes(Self);
         PgCtlBem.ActivePage := TabIdent;
         Exit;
      end;
      //----------------------------------------------------------------------------------
      if qrySelBem.FieldByName('FLGSAIDATEMP').AsInteger = 1 then
      begin
         MsgDlg('Bem em Saída Temporária não pode ser alterado!','Erro',mtError,[mbOk],0);
         CmeCadastro.Operacao := opIdle;
         CmeCadastro.AtualizaBotoes(Self);
         PgCtlBem.ActivePage := TabIdent;
         Exit;
      end;
      //----------------------------------------------------------------------------------
      qryHistMov.Close;
      qryHistMov.ParamByName('PIDPESSOA').AsFloat := qrySelBem.FieldByName('IDPESSOA').AsFloat;
      qryHistMov.ParamByName('PIDBEM').AsFloat    := qrySelBem.FieldByName('IDBEM').AsFloat;
      qryHistMov.Open;
      //----------------------------------------------------------------------------------
      if not qryHistMov.IsEmpty then
      begin
         MsgDlg('Bens já movimentados não podem ser removidos. ','Erro',mtError,[mbOk],0);
      end else
      begin
         if MsgDlg('Deseja realmente apagar este registro ?','Remoção de Bem',
                   mtConfirmation,[mbYes, mbNo],0)= mrYes then
         begin
            iPlanilha := AtivoFixo.EstornaEntrada(iIdModulo,Sistema.IdEmpresa,
                                                  qrySelBemIDBEM.AsInteger,
                                                  qrySelBemDATAINICIODEP.AsDateTime,
                                                  qrySelBemDATAINICIODEP.AsDateTime,True,True);
            if iPlanilha < 0 then
               MsgDlg('EXCLUSÃO NÃO EFETUADA ! '+ #13 + #13 +
                      'Causa : ' + AtivoFixo.MensagemErro,
                      'Erro',mtError,[mbOk],0);
         end;
      end;
      qryHistMov.Close;
      LimpaCampos;
      //----------------------------------------------------------------------------------
      CmeCadastro.Operacao := opIdle;
      CmeCadastro.AtualizaBotoes(Self);
   end;
   PgCtlBem.ActivePage := TabIdent;
end;
//========================================================================================
function TfrmCadBens.PlacaUnica(sPlaca : string) : boolean;
var
   sPlacaAux : String;

begin
   if (CmeCadastro.Operacao = opInserir) then
   begin
      Screen.Cursor := crSQLWait;
      sPlacaAux := sPlaca;
      //----------------------------------------------------------------------------------
      while (pos('.',sPlacaAux) <> 0) do
      begin
         sPlacaAux := AtivoFixo.TiraCaracter(sPlacaAux,'.');
      end;
      //----------------------------------------------------------------------------------
      if not qryPlaca.Prepared then
         qryPlaca.Prepare;
      //----------------------------------------------------------------------------------
      qryPlaca.Close;
      qryPlaca.ParambyName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
      qryPlaca.ParambyName('PPLACA').AsString := sPlacaAux;
      qryPlaca.Open;
      Result := qryPlaca.IsEmpty ;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
   end else
   begin
      Result := True;
   end;
end;
//========================================================================================
procedure TfrmCadBens.edValHistoricoExit(Sender: TObject);
begin
   inherited;
   eValorg.Value := edValHistorico.Value;
end;
//========================================================================================
procedure TfrmCadBens.qrySelGrupoAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if (not qrySelGrupo.IsEmpty) then
      if (CmeCadastro.Operacao = opAlterar) and
         (edTaxaDep.Value <> qrySelGrupoDEPRECIACAO.AsFloat) then
      begin
         if MsgDlg('A taxa de depreciação cadastrada é diferente da taxa padrão cadastrada no '+
                   'Cadastro de Grupos Contábeis.'+ #13 + 'Deseja substituir pela taxa padrão ?',
                   'Confirmação', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
            edTaxaDep.Value := qrySelGrupoDEPRECIACAO.AsFloat;
      end else
            edTaxaDep.Value := qrySelGrupoDEPRECIACAO.AsFloat;
end;
//========================================================================================
procedure TfrmCadBens.qrySelFornecAfterOpen(DataSet: TDataSet);
begin
   inherited;
   if (not qrySelFornec.IsEmpty) and (CmeCadastro.Operacao = opInserir) then
   begin
      qrySelSubConta.Close;
      qrySelSubConta.ParamByName('PSUBCONTA').AsInteger := qrySelFornecCODSUBCONTA.AsInteger;
      qrySelSubConta.ParamByName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
      qrySelSubConta.Open;
   end;
end;
//========================================================================================
procedure TfrmCadBens.bbtnGeraPlacaClick(Sender: TObject);
var
   sDigMascPlaca : String;

begin
   inherited;
   if CmeCadastro.Operacao = opInserir then
   begin
      if bEdPlaca then
      begin
         //-------------------------------------------------------------------------------
         // Calcula o Número da Próxima Placa de Patrimônio
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' SELECT PROXIMAPLACA, DIGMASCPLACA '+
                        ' FROM PARAMETROSCAFMANUT '+
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.Open;
         if (qryAux.FieldByName('PROXIMAPLACA').AsFloat <= 0) then
         begin
            ProximoCodigo := '1';
         end else
         begin
            ProximoCodigo := FloatToStr(qryAux.FieldByName('PROXIMAPLACA').AsFloat);
         end;
         CodigoAnterior := ProximoCodigo;
         sDigMascPlaca := StringOfChar('0',qryAux.FieldByName('DIGMASCPLACA').AsInteger);
         //-------------------------------------------------------------------------------
         qryParamCAF.Close;
         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Add(' UPDATE PARAMETROSCAFMANUT SET PROXIMAPLACA = ' +
                        floattostr(strtofloat(ProximoCodigo) + 1) +
                        ' WHERE (IDPESSOA = ' + inttostr(Sistema.IdEmpresa) + ')');
         qryAux.ExecSQL;
         qryParamCaf.ParamByName('PIDPESSOA').AsFloat := Sistema.IdEmpresa;
         qryParamCaf.Open;
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'G' then
         begin
            if (Length(ProximoCodigo) > 7) then
            begin
               MsgDlg(' Número de Bens Cadastrados para o Grupo Terminou!' +
                      ' Crie um Novo Grupo ou mude de Grupo.',
                      'Erro', mtError, [mbOk], 0);
               exit;
            end;
            if qrySelGrupo.FieldbyName('CLASSE').IsNull then
            begin
               MsgDlg('Selecione um Grupo Contábil!', 'Erro', mtError, [mbOk], 0);
               exit;
            end else
            begin
               edPlaca.Text := floattostr(strtofloat(qrySelGrupoCLASSE.AsString +
                                          ComplZeros(ProximoCodigo,7))) + sDigMascPlaca;
            end;
         end else
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'C' then
         begin
            if (Length(ProximoCodigo) > 7) then
            begin
               MsgDlg(' Número de Bens Cadastrados para a Classe Terminou!'+
                      ' Crie uma Nova Classe ou mude de Classe.',
                      'Erro', mtError, [mbOk], 0);
               exit;
            end;
            if qrySelClasse.FieldbyName('CODHIERARQ').IsNull then
            begin
               MsgDlg('Selecione uma Classe!', 'Erro', mtError, [mbOk], 0);
               exit;
            end else
            begin
               edPlaca.Text := floattostr(strtofloat(qrySelClasse.FieldbyName('CODHIERARQ').AsString +
                                          ComplZeros(ProximoCodigo,7))) + sDigMascPlaca;
            end;
         end else
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'E' then
         begin
            edPlaca.Text := floattostr(strtofloat(IntToStr(Sistema.IdEmpresa) +
                                       ComplZeros(ProximoCodigo,7))) + sDigMascPlaca;
         end else
         //-------------------------------------------------------------------------------
         if sCodPlaca = 'S' then
         begin
            edPlaca.Text := ProximoCodigo + sDigMascPlaca;
         end;
      end;
      //----------------------------------------------------------------------------------
   end;
end;
//========================================================================================
function TfrmCadBens.ComplZeros(sCodigo : String; iTam : Integer) : string;
var
   iCont, iLen            : integer;
   sFull, sZeros, sResult : string;

begin
   sZeros := '';
   for iCont := 1 to iTam do
   begin
      sZeros := sZeros + '0';
   end;
   sFull := sZeros + trim(sCodigo);
   //-------------------------------------------------------------------------------------
   iLen := length(sFull);
   sResult := '';
   iCont := iTam;
   while iCont >= 1 do
   begin
      sResult := sFull[iLen] + sResult;
      iCont := iCont - 1;
      iLen  := iLen - 1;
   end;
   //-------------------------------------------------------------------------------------
   Result := sResult;
end;
//========================================================================================
procedure TfrmCadBens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   qrySelBem.Close;
   qrySelConjunto.Close;
   qryRateio.Close;
   qrySelClasse.Close;
   qrySelSituacao.Close;
   qryPlaca.Close;
   qrySelFornec.Close;
   qrySelTerceiro.Close;
   qrySelGrupo.Close;
   qrySelSubConta.Close;
   qrySelAtivProj.Close;
   qryParamCaf.Close;
   qryReavaliacao.Close;
   qryReaval.Close;
   qryBemSel.Close;
   //-------------------------------------------------------------------------------------
   qrySelBem.UnPrepare;
   qrySelConjunto.UnPrepare;
   qryRateio.UnPrepare;
   qrySelClasse.UnPrepare;
   qrySelSituacao.UnPrepare;
   qryPlaca.UnPrepare;
   qrySelFornec.UnPrepare;
   qrySelTerceiro.UnPrepare;
   qrySelGrupo.UnPrepare;
   qrySelSubConta.UnPrepare;
   qrySelAtivProj.UnPrepare;
   qryParamCaf.UnPrepare;
   qryReavaliacao.UnPrepare;
   qryReaval.UnPrepare;
   qryBemSel.UnPrepare;
end;
//========================================================================================
procedure TfrmCadBens.edDataInclusaoExit(Sender: TObject);
begin
   inherited;
   if (CmeCadastro.Operacao = opInserir) then
   begin
      if edDataInicioDep.Text = '' then
         edDataInicioDep.Date := edDataInclusao.Date;
      if edDtaContab.Text = '' then
         edDtaContab.Date := edDataInclusao.Date;
   end else
   if (CmeCadastro.Operacao = opAlterar) and (edDataInclusao.Date <> edDataInicioDep.Date) then
      if MsgDlg('As datas de entrada e inicio da depreciação estão diferentes.' + #13 +
                'Deseja que a data de inicio da depreciação seja igual a data de entrada ' +
                'do bem na empresa ?','Confirmação',
                mtConfirmation,[mbYes, mbNo],0)= mrYes then
         if edDataInicioDep.Text = '' then
            edDataInicioDep.Date := edDataInclusao.Date;
end;
//========================================================================================
procedure TfrmCadBens.bbtnLivrosClick(Sender: TObject);
begin
   inherited;
   pnlPlaca.SendToBack;
end;
//========================================================================================
procedure TfrmCadBens.bbtnRetornaPlacaClick(Sender: TObject);
begin
   inherited;
   pnlLivros.SendToBack;
end;
//========================================================================================
procedure TfrmCadBens.pgctlBemChange(Sender: TObject);
begin
   inherited;
   pnlPlaca.BringToFront;
end;
//========================================================================================
procedure TfrmCadBens.eValOrgExit(Sender: TObject);
begin
   inherited;
   if (edDataInclusao.Text <> '') then
   begin
      eValFis.Value := eValOrg.Value / AtivoFixo.Cotacao_Moeda(sMoedaFiscal,
                                       edDataInclusao.Date,True);
      eValGer.Value := eValOrg.Value / AtivoFixo.Cotacao_Moeda(sMoedaGerencial,
                                       edDataInclusao.Date,True);
   end else
   begin
      MsgDlg('Informe a Data de Entrada do Bem!','Erro', mtError, [mbOk], 0);
   end;
end;
//========================================================================================
procedure TfrmCadBens.eValDepIniExit(Sender: TObject);
begin
   inherited;
   if (edDataInclusao.Text <> '') then
   begin
      eDepFis.Value := eValDepIni.Value / AtivoFixo.Cotacao_Moeda(sMoedaFiscal,
                                          edDataInclusao.Date,True);
      eDepGer.Value := eValDepIni.Value / AtivoFixo.Cotacao_Moeda(sMoedaGerencial,
                                          edDataInclusao.Date,True);
   end else
   begin
      MsgDlg('Informe a Data de Entrada do Bem!','Erro', mtError, [mbOk], 0);
   end;
end;
//========================================================================================
procedure TfrmCadBens.edDataInicioDepExit(Sender: TObject);
begin
   inherited;
   if (edDataInicioDep.Date < edDataInclusao.Date) then
      MsgDlg('A Data de Inicio de Depreciação está anterior a Data de Entrada.' + #13 +
             'Isso pode gerar distorção nos lançamentos da contabilidade',
             'Atenção',mtWarning,[mbOk],0);
   if (edDtaContab.Date < edDataInicioDep.Date) then
      MsgDlg('A Data de Inicio de Depreciação está anterior a data de registro ' + #13 +
             'da entrada do bem na contabilidade. Isto pode gerar distorção nos '+ #13 +
             'lançamentos da contabilidade', 'Atenção',mtWarning,[mbOk],0);
end;
//========================================================================================
procedure TfrmCadBens.edDtaContabExit(Sender: TObject);
begin
   inherited;
   if (edDtaContab.Date < edDataInclusao.Date) then
      MsgDlg('A data de registro da entrada do bem na contabilidade está ' + #13 +
             'anterior a Data de Entrada. Isso pode gerar distorção nos ' + #13 +
             'lançamentos da contabilidade',
             'Atenção',mtWarning,[mbOk],0);
end;
//========================================================================================
function  TfrmCadBens.ExecutaAlteracaoFisica(iModulo,iConjunto,iTerceiro,iGrupo,iSubConta,
          iAtivProjeto,iClasseBem,iFornec : Integer; fPlaca : double; iSituacao : integer; sRegistro,
          sControle,sDescBem,sIdNota,sComplNota,sNumSerie : string; dDataNota,
          dDataInclusao : tDateTime; fValHist,fValOrg,fCmBem : double;
          dDataIniDep : tDateTime; fValIniDep, fTaxaDep, fDepLanc,
          fCmDep, fValFis, fValGer, fDepFis, fDepGer, fPropBaixa : Double;
          sIdOpcional, sProcessoAquis, sEmpenhoAquis, sPubAutor,
          sPubEditora, sPubAno : string;
          bFlgBemIntContab : Boolean; dDtaContab : tDateTime) : Boolean;
Var
   cSeparador : Char;

begin
   try
      qryAltBem.Close;
      qryAltBem.ParamByName('PIDPESSOA').AsInteger := qrySelBemIDPESSOA.AsInteger;
      qryAltBem.ParamByName('PIDBEM').AsInteger    := qrySelBemIDBEM.AsInteger;
      qryAltBem.Open;
      //----------------------------------------------------------------------------------
      with qryAltBem do
      begin
         Edit;
         FieldByName('IDCONJUNTO').asInteger     := iConjunto;           // IDCONJUNTO
         FieldByName('IDGRUPO').asInteger        := iGrupo;              // IDGRUPO
         FieldByName('IDCLASSEBEM').asFloat      := iClasseBem;          // IDCLASSEBEM
         FieldByName('IDMODULO').asInteger       := iModulo;             // IDMODULO
         FieldByName('IDSITUACAO').asInteger     := iSituacao;           // IDSITUACAO
         FieldByName('REGISTRO').asString        := sRegistro;           // REGISTRO
         FieldByName('CONTROLE').asString        := sControle;           // CONTROLE
         FieldByName('PLACA').asFloat            := fPlaca;              // PLACA
         FieldByName('DESBEM').asString          := sDescBem;            // DESBEM
         FieldByName('DTAINCLUSAO').asDateTime   := dDataInclusao;       // DTAINCLUSAO
         FieldByName('VALHISTORICO').asCurrency  := fValHist;            // VALHISTORICO
         FieldByName('VALORG').asCurrency        := fValOrg;             // VALORG
         FieldByName('VALFIS').asCurrency        := fValFis;             // VALFIS
         FieldByName('VALGER').asCurrency        := fValGer;             // VALGER
         FieldByName('DATAINICIODEP').asDateTime := dDataIniDep;         // DATAINICIODEP
         FieldByName('TAXADEP').asFloat          := fTaxaDep;            // TAXADEP
         FieldByName('DATAULTDEP').asDateTime    := dDataIniDep;         // DATAULTDEP
         FieldByName('IDOPCIONAL').asString      := sIdOpcional;         // IDOPCIONAL
         //-------------------------------------------------------------------------------
         FieldByName('IDFORNSERV').asInteger        := iFornec;          // IDFORNSERV
         if iFornec <= 0 then FieldByName('IDFORNSERV').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('IDTERCEIRO').asInteger        := iTerceiro;        // IDTERCEIRO
         if iTerceiro <= 0 then FieldByName('IDTERCEIRO').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('IDNOTA').asString             := sIdNota;          // IDNOTA
         if sIdNota = '' then FieldByName('IDNOTA').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('DTANOTA').asDateTime          := dDataNota;        // DTANOTA
         if dDataNota <= 0 then FieldByName('DTANOTA').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('DATAULTDEP').asDateTime       := dDataIniDep;      // DATAULTDEP
         if dDataIniDep <= 0 then FieldByName('DATAULTDEP').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('DATARECALCDEP').Clear;                             // DATARECALCDEP
         //-------------------------------------------------------------------------------
         FieldByName('PROPBAIXA').asFloat            := fPropBaixa;      // PROPBAIXA
         if fPropBaixa < 0 then FieldByName('PROPBAIXA').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('VALDEPINI').asCurrency         := fValIniDep;      // VALDEPINI
         if fValIniDep < 0 then FieldByName('VALDEPINI').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('DEPLANC').asCurrency           := fDepLanc;        // DEPLANC
         if fDepLanc < 0 then FieldByName('DEPLANC').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('CMBEM').asCurrency             := fCmBem;          // CMBEM
         if fCmBem < 0 then FieldByName('CMBEM').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('CMDEP').asCurrency             := fCmDep;          // CMDEP
         if fCmDep < 0 then FieldByName('CMDEP').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('DEPFIS').asCurrency            := fDepFis;         // DEPFIS
         if fDepFis < 0 then FieldByName('DEPFIS').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('DEPGER').asCurrency            := fDepGer;         // DEPGER
         if fDepGer < 0 then FieldByName('DEPGER').asFloat := 0;
         //-------------------------------------------------------------------------------
         FieldByName('CODSUBCONTA').asInteger        := iSubConta;       // CODSUBCONTA
         if iSubConta <= 0 then FieldByName('CODSUBCONTA').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('UNIDNEGOC').asInteger          := iAtivProjeto;    // UNIDNEGOC
         if iAtivProjeto <= 0 then FieldByName('UNIDNEGOC').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('NUMSERIE').asString            := sNumSerie;       // NUMSERIE
         if sNumSerie = '' then FieldByName('NUMSERIE').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('COMPLNOTA').asString           := sComplNota;      // COMPLNOTA
         if sComplNota = '' then FieldByName('COMPLNOTA').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('PROCESSOAQUIS').asString       := sProcessoAquis;
         if sProcessoAquis = '' then FieldByName('PROCESSOAQUIS').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('EMPENHOAQUIS').asString        := sEmpenhoAquis;
         if sEmpenhoAquis = '' then FieldByName('EMPENHOAQUIS').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('PUBAUTOR').asString            := sPubAutor;
         if sPubAutor = '' then FieldByName('PUBAUTOR').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('PUBEDITORA').asString          := sPubEditora;
         if sPubEditora = '' then FieldByName('PUBEDITORA').Clear;
         //-------------------------------------------------------------------------------
         FieldByName('PUBANO').asString              := sPubAno;
         if sPubAno = '' then FieldByName('PUBANO').Clear;
         //-------------------------------------------------------------------------------
         if bFlgBemIntContab then
            FieldByName('FLGBEMINTCONTAB').asInteger := 1
         else
            FieldByName('FLGBEMINTCONTAB').asInteger := 0;
         //-------------------------------------------------------------------------------
         FieldByName('DTACONTAB').asDateTime         := dDtaContab;
         if dDtaContab <= 0 then FieldByName('DTACONTAB').Clear;
         //-------------------------------------------------------------------------------
      end;
      qryAltBem.Post;
      qryAltBem.ApplyUpdates;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela HISTORICOMOVIMENTACAO
      //----------------------------------------------------------------------------------
      cSeparador       := DecimalSeparator;
      DecimalSeparator := '.';
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' + #13 +
                         ' SET DATAMOVIMENTACAO = TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataInclusao)+''',''DD/MM/YYYY''), ' + #13 +
                         '     VALOFI           = ' + FormatFloat('#0.00',fValOrg) + #13 +
                         ' WHERE (IDBEM =    ' + qrySelBem.FieldByName('IDBEM').AsString + ')' + #13 +
                         '   AND (IDPESSOA = ' + qrySelBem.FieldByName('IDPESSOA').AsString + ')' + #13 +
                         '   AND (IDTIPOMOVIMENTACAO = 03)';
      qryAux.ExecSQL;
      //----------------------------------------------------------------------------------
      DecimalSeparator := cSeparador;
      //----------------------------------------------------------------------------------
      if sControle = 'F' then
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível atualizar o Registro de Histórico');
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDLOCALIZACAO,IDRESPONSAVEL ' + #13 +
                         ' FROM CONJUNTO ' + #13 +
                         ' WHERE (IDCONJUNTO = ' + inttostr(iConjunto) + ')';
      qryAux.Open;
      if not AtivoFixo.AtualizaSaldoContabBem(iModulo,
                                              qrySelBemIDPESSOA.AsInteger,
                                              qrySelBemIDBEM.AsInteger,
                                              dDataInclusao,0,0,0,0,0,0,0,0,0,0,0,0,
                                              iGrupo,
                                              qryAux.FieldByName('IDLOCALIZACAO').AsInteger,
                                              qryAux.FieldByName('IDRESPONSAVEL').AsInteger,
                                              2) then
         Raise Exception.Create(AtivoFixo.MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Alteracao do Bem ' + qrySelBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
function TfrmCadBens.EstornaMovInicial(iModulo, iEmpresaProp, iBem : Integer;
                                       dDataMov, dDataEst : tDate;
                                       bFlgContab : Boolean) : Integer;
var
   iResult,
   iExercicio,iPeriodo           : Integer;
   sMascara,sMensagem            : String;
   qryAux                        : TwwQuery;
   bRemovePlanContab             : Boolean;
   aPlanilha                     : array [1..12] of Integer;
   aDataMov                      : array [1..12] of tDateTime;
   iTotPlan, iPlan               : Integer;

begin
   try
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryReavaliacao.Prepared then qryReavaliacao.Prepare;
      end;
      //-------------------------------------------------------------------------------------
      qryAux := TwwQuery(dtmAtivoFixo.qryAux);
      //-------------------------------------------------------------------------------------
      // verifica se ja houve movimentação no bem após sua entrada
      //-------------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                         ' FROM   HISTORICOMOVIMENTACAO ' +
                         ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                         '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                         '   AND (IDTIPOMOVIMENTACAO <> 1)   /* ENTRADA TOTAL                                      */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 3)   /* ENTRADA FISICA                                     */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 17)  /* INCLUSAO DE DEPRECIACAO                            */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 15)  /* CORRECAO MONETARIA                                 */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 21)  /* CORRECAO MONETARIA DA DEPRECIACAO                  */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 32)  /* INCLUSAO DO SALDO DE REAVALIACAO                   */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 33)  /* INCLUSAO DA DEPRECIACAO DO SALDO DE REAVALIACAO    */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 22)  /* CORRECAO MONETARIA DA REAVALIACAO                  */'+
                         '   AND (IDTIPOMOVIMENTACAO <> 19)  /* CORRECAO MONETARIA DA DEPRECIACAO DA REAVALIACAO   */';
      qryAux.Open;
      if not qryAux.IsEmpty then
         Raise Exception.Create('Existe movimentação após a Entrada. Consulte Movimentação!');
      //----------------------------------------------------------------------------------
      // Estorna Lancamento da Contabilidade
      //----------------------------------------------------------------------------------
      if AtivoFixo.IntegraContab(iEmpresaProp) or (bFlgContab) then
      begin
         if AtivoFixo.VerificaPeriodoContabil(iEmpresaProp,dDataEst,iExercicio,iPeriodo,
                                              sMensagem) then
         begin
            qryAux.Close;
            qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO,DATAMOVIMENTACAO,PLNCODIGO '+
                               ' FROM   HISTORICOMOVIMENTACAO '+
                               ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ') '+
                               '   AND (IDBEM    = ' + inttostr(iBem) + ') ';
            qryAux.Open;
            iTotPlan := 0;
            while not qryAux.EOF do
            begin
               iTotPlan := iTotPlan + 1;
               if not ((qryAux.FieldByName('PLNCODIGO').AsInteger <= 0) or
                       (qryAux.FieldByName('PLNCODIGO').IsNull)) then
               begin
                  aPlanilha[iTotPlan] := qryAux.FieldByName('PLNCODIGO').AsInteger;
                  aDataMov[iTotPlan]  := qryAux.FieldByName('DATAMOVIMENTACAO').AsDateTime;
               end;
               qryAux.Next;
            end;
            //----------------------------------------------------------------------------
            // RETIRA O LINK DA PLANILHA CONTÁBIL
            //----------------------------------------------------------------------------
            qryAux.Close;
            qryAux.SQL.Text := ' UPDATE HISTORICOMOVIMENTACAO ' +
                               ' SET PLNCODIGO = NULL '+
                               ' WHERE IDMOVIMENTACAO IN (SELECT IDMOVIMENTACAO '+
                               '                          FROM HISTORICOMOVIMENTACAO'+
                               '                          WHERE (IDBEM    = ' + inttostr(iBem) + ')' +
                               '                            AND (IDPESSOA = ' + inttostr(iEmpresaProp) + '))';
            qryAux.ExecSQL;
            //----------------------------------------------------------------------------
            bRemovePlanContab := AtivoFixo.RemovePlanContab(iEmpresaProp);
            //----------------------------------------------------------------------------
            iPlan := 1;
            while iPlan <= iTotPlan do
            begin
               if not bRemovePlanContab then
               begin
                  iResult := EstornaLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                         datetostr(aDataMov[iPlan]), iExercicio, iPeriodo,
                                         iEmpresaProp, sMascara);
                  if iResult = -1 then
                     Raise Exception.Create('Estorno da Planilha Contábil não foi permitido!');
               end else
               begin
                  with dtmAtivoFixo.qryParamCaf do
                  begin
                     if not Active then
                     begin
                        Close;
                        ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
                        Open;
                     end;
                     //-------------------------------------------------------------------
                     iResult := ExcluiLanc(True, aPlanilha[iPlan], 'BASEDADOS',
                                           inttostr(Sistema.IdModulo),
                                           FieldByName('PLANOVIGENTE').AsInteger, iEmpresaProp,
                                           Sistema.IdUsuario, True, 0, sMascara);
                  end;
                  //----------------------------------------------------------------------
                  if iResult = -1 then
                     Raise Exception.Create('Remoção da Planilha Contábil não foi permitida!');
               end;
               iPlan := iPlan + 1;
            end;
         end else
         begin
            Raise Exception.Create(AtivoFixo.MensagemErro);
         end;
      end;
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         //-------------------------------------------------------------------------------
         // Remove as Reavaliacoes Iniciais, se houverem
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' SELECT IDMOVIMENTACAO '+
                            ' FROM   HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')' +
                            '   AND (IDTIPOMOVIMENTACAO = 32)  /* INCLUSAO DO SALDO DE REAVALIACAO */';
         qryAux.Open;
         while not qryAux.Eof do
         begin
            qryEstornaReavaliacao.ParamByName('PIDMOVIMENTACAO').AsInteger := qryAux.FieldByName('IDMOVIMENTACAO').AsInteger;
            qryEstornaReavaliacao.ExecSQL;
            qryAux.Next;
         end;
         //-------------------------------------------------------------------------------
         qryAux.Close;
         qryAux.SQL.Text := ' DELETE FROM HISTORICOMOVIMENTACAO ' +
                            ' WHERE (IDPESSOA = ' + inttostr(iEmpresaProp) + ')' +
                            '   AND (IDBEM    = ' + inttostr(iBem) + ')';
         qryAux.ExecSQL;
         if qryAux.RowsAffected <= 0 then
            Raise Exception.Create('Não foi possível remover os lançamentos iniciais do bem!');
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      if not AtivoFixo.AtualizaSaldoContabBem(iModulo,
                                              iEmpresaProp, iBem,
                                              dDataMov,0,0,0,0,0,0,0,0,0,0,0,0,
                                              qrySelBem.FieldByName('IDGRUPO').AsInteger,
                                              qrySelBem.FieldByName('IDLOCALIZACAO').AsInteger,
                                              qrySelBem.FieldByName('IDRESPONSAVEL').AsInteger,
                                              2) then
         Raise Exception.Create(AtivoFixo.MensagemErro);
      //----------------------------------------------------------------------------------
      if not Sistema.GravaLogOperacoes('Estorno da Entrada do Bem ' + qrySelBem.FieldByName('PLACA').AsString) then
         raise Exception.Create('Erro ao gravar Log de Operação');
      //----------------------------------------------------------------------------------
      Result := 1;
   except
      On E : Exception do
      begin
         Result := -1;
         MensagemErro := E.Message;
      end;
   end;
end;
//========================================================================================
function TfrmCadBens.ExecAltTotal(iIdBem,iModulo,iEmpresaProp,iConjunto,iTerceiro,iGrupo,
         iSubConta,iAtivProjeto,iClasseBem,iFornec : integer; sPlaca : String;
         iSituacao : integer; sRegistro,sControle,sDescBem,sIdNota,sComplNota,
         sNumSerie : string; dDataNota,dDataInclusao : tDateTime; fValHist,fValOrg,
         fCmBem : double; dDataIniDep : tDateTime; fValIniDep,fTaxaDep,fDepLanc,fCmDep,
         fPropBaixa : double;
         fReavValOrg,fReavCmBem,fReavDepLanc,fReavCmDep : double; sReavTaxaDep : String;
         dReavData : tDateTime; sReavObs : String; fUltReavValOrg,fUltReavCmBem,
         fUltReavDepLanc, fUltReavCmDep : double; sUltReavTaxaDep : String;
         dUltReavData : tDateTime; sUltReavObs, sIdOpcional,
         sProcessoAquis, sEmpenhoAquis, sPubAutor, sPubEditora, sPubAno : String;
         bBemIntContab : Boolean; dDtaContab : tDateTime) : boolean;

var
   iPlanoConta,iExercicio,iPeriodo,iPlanilha,
   iSeqHist, iIdReavaliacao, iIdUltReavaliacao,
   iPlanResult, iTipoMovimentacao,
   iaIdHistMov, iAux                                 : Integer;
   sDebito, sDebitoCM, sCredito, sCreditoCM,
   sCCDebito, sCCDebitoCM, sCCCredito, sCCCreditoCM,
   sAtivProjeto, sMoeda, sBaixaTotal, sMensagem      : String;
   fPlaca, fValFis, fValGer, fDepFis, fDepGer,
   fReavValFis, fReavValGer,
   fReavDepFis, fReavDepGer,
   fUltReavValFis, fUltReavValGer,
   fUltReavDepFis, fUltReavDepGer                    : Double;
   bTransacao, bIdbem, bCtaxCCusto                   : Boolean;
   aIdHistMov                                        : array [1..4] of Integer;

begin
   try
      with dtmAtivoFixo do
      begin
         if not qryBem.Prepared then qryBem.Prepare;
         if not qryRegistraMovimentacao.Prepared then qryRegistraMovimentacao.Prepare;
         if not qryRegistraValorMovimentacao.Prepared then qryRegistraValorMovimentacao.Prepare;
         if not qryGrupos.Prepared then qryGrupos.Prepare;
         if not qryConjunto.Prepared then qryConjunto.Prepare;
         if not qryPessoa.Prepared then qryPessoa.Prepare;
         if not qryClasseBem.Prepared then qryClasseBem.Prepare;
         if not qrySubConta.Prepared then qrySubConta.Prepare;
         if not qryPlaca.Prepared then qryPlaca.Prepare;
         if not qrySituacao.Prepared then qrySituacao.Prepare;
      end;
      //----------------------------------------------------------------------------------
      // Valida os parâmetros obrigatórios para entrada de bens
      //----------------------------------------------------------------------------------
      with dtmAtivoFixo do
      begin
         if sRegistro = '' then
            raise Exception.Create('É obrigatório fornecer o Código de Registro do bem!')
         else
            if not ((sRegistro = 'I') or (sRegistro = 'O')) then
               raise Exception.Create('Código de Registro do Bem inválido!');
         //-------------------------------------------------------------------------------
         if sRegistro = 'O' then
            sControle := 'F';
         //-------------------------------------------------------------------------------
         if sControle = '' then
            raise Exception.Create('É obrigatório fornecer o Código de Controle do bem!')
         else
            if not ((sControle = 'T') or (sControle = 'F')) then
               raise Exception.Create('Código de Controle do Bem inválido!');
         //-------------------------------------------------------------------------------
         if iModulo <= 0 then
            raise Exception.Create('É obrigatório fornecer o código do MODULO!');
         //-------------------------------------------------------------------------------
         if iEmpresaProp <= 0 then
            raise Exception.Create('É obrigatório fornecer o código da EMPRESA PROPRIETÁRIA!')
         else begin
            qryPessoa.Close;
            qryPessoa.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryPessoa.Open;
            if qryPessoa.isEmpty then
               raise Exception.Create('Código da EMPRESA PROPRIETÁRIA inválido ou não cadastrado!');
         end;
         //-------------------------------------------------------------------------------
         if iConjunto <= 0 then
            raise Exception.Create('É obrigatório fornecer o código do CONJUNTO do bem!')
         else begin
            qryConjunto.Close;
            qryConjunto.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
            qryConjunto.ParamByName('PIDCONJUNTO').AsInteger := iConjunto;
            qryConjunto.Open;
            if qryConjunto.isEmpty then
               raise Exception.Create('Código do CONJUNTO do bem inexistente ou inválido!');
         end;
         //-------------------------------------------------------------------------------
         if iGrupo <= 0 then
            raise Exception.Create('É obrigatório fornecer o código do GRUPO do bem!')
         else begin
            qryGrupos.Close;
            qryGrupos.ParamByName('PIDPESSOA').AsInteger := iEmpresaProp;
            qryGrupos.ParamByName('PIDGRUPO').AsInteger := iGrupo;
            qryGrupos.Open;
            if qryGrupos.isEmpty then
               raise Exception.Create('Código do GRUPO do bem inexistente ou inválido!')
         end;
         //-------------------------------------------------------------------------------
         if iClasseBem <= 0 then
            raise Exception.Create('É obrigatório fornecer o código da CLASSE do bem!')
         else begin
            qryClasseBem.Close;
            qryClasseBem.ParamByName('PIDCLASSEBEM').AsInteger := iClasseBem;
            qryClasseBem.Open;
            if qryClasseBem.isEmpty then
               raise Exception.Create('Código de CLASSE de bem inexistente ou inválido!')
         end;
         //-------------------------------------------------------------------------------
         if iSubConta > 0 then
         begin
            qrySubConta.Close;
            qrySubConta.ParamByName('PIDPESSOA').AsInteger   := iEmpresaProp;
            qrySubConta.ParamByName('PIDSUBCONTA').AsInteger := iSubConta;
            qrySubConta.Open;
            if qrySubConta.isEmpty then
               raise Exception.Create('Código de SubConta inexistente ou inválido!');
         end;
         //-------------------------------------------------------------------------------
         if iFornec > 0 then
         begin
            qryPessoa.Close;
            qryPessoa.ParamByName('PIDPESSOA').AsInteger := iFornec;
            qryPessoa.Open;
            if qryPessoa.isEmpty then
               raise Exception.Create('Código do FORNECEDOR inválido ou não cadastrado!');
         end;
         //-------------------------------------------------------------------------------
         if sPlaca = '' then
            fPlaca := -1
         else
            fPlaca := strtofloat(sPlaca);
         //-------------------------------------------------------------------------------
         if fPlaca <= 0 then
         begin
            if qryGrupos.FieldByName('FLGSEMPLACA').AsInteger = 0 then
               raise Exception.Create('É obrigatório fornecer o Número de TOMBAMENTO do bem!');
         end else
         begin
            qryPlaca.Close;
            qryPlaca.ParamByName('PIDPLACA').AsFloat := fPlaca;
            qryPlaca.ParamByName('IDPESSOA').AsInteger := iEmpresaProp;
            qryPlaca.Open;
            if (not qryPlaca.isEmpty) and (qryPlaca.FieldByName('IDBEM').AsInteger <> iIdBem) then
               raise Exception.Create('Número de TOMBAMENTO já alocado a outro Bem ('+qryPlaca.FieldByName('IDBEM').AsString + ' '
                                       + ' - ' + qryPlaca.FieldByName('DESBEM').AsString + ')!');
         end;
         //-------------------------------------------------------------------------------
         if iSituacao <= 0 then
            raise Exception.Create('É obrigatório fornecer a ID da SITUAÇÃO do bem!')
         else begin
            qrySituacao.Close;
            qrySituacao.ParamByName('PIDSITUACAO').AsInteger := iSituacao;
            qrySituacao.Open;
            if qrySituacao.isEmpty then
               raise Exception.Create('ID da SITUAÇÃO do bem inválido ou inexistente!');
         end;
         //-------------------------------------------------------------------------------
         if sDescBem = '' then
            raise Exception.Create('É obrigatório fornecer a DESCRIÇÃO do bem!');
         //-------------------------------------------------------------------------------
         if (fValOrg = 0) and (sControle = 'T') then
            raise Exception.Create('O VALOR DE AQUISIÇÃO do bem está Zerado!');
         //-------------------------------------------------------------------------------
         sBaixaTotal := 'N';
         if fPropBaixa <> -1 then
            if (fPropBaixa < 0) or (fPropBaixa > 100) then
               raise Exception.Create('Proporção da Baixa Inválida!')
            else
               if fPropBaixa = 100 then
                  sBaixaTotal := 'S';
         //-------------------------------------------------------------------------------
         if ((fValIniDep + fCmDep) > (fValOrg + fCmBem)) then
            raise Exception.Create('Valor da depreciação inicial não pode ser maior que valor de aquisição !');
         //-------------------------------------------------------------------------------
         // Verificações relativas a reavaliação (se houver)
         //-------------------------------------------------------------------------------
         if ((fReavValOrg <> 0) or (fReavDepLanc <> 0)) and (dReavData <= 0) then
            raise Exception.Create('A data da última reavaliação do bem deve ser fornecida!');
      end;
      //----------------------------------------------------------------------------------
      // Le a Unidade de Negocio da Tabela de Parametros Globais
      //----------------------------------------------------------------------------------
      if iAtivProjeto <= 0 then
      begin
         with dtmAtivoFixo.qryParamCAF do
         begin
            Close;
            ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
            Open;
            if not IsEmpty then
               sAtivProjeto := FieldByName('ATIVPROJETO').AsString
            else
               sAtivProjeto := '';
            Close;
         end;
      end else
         sAtivProjeto := inttostr(iAtivProjeto);
      //-------------------------------------------------------------------------------------
      with dtmAtivoFixo.qryParamCAF do
      begin
         Close;
         ParamByName('PIDPESSOA').asInteger := Sistema.IdEmpresa;
         Open;
         //----------------------------------------------------------------------------------
         // Calcula os valores fornecidos em moeda fiscal e gerencial
         //----------------------------------------------------------------------------------
         fValFis := fValOrg / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                      dDataInclusao,
                                                      True);
         fValGer := fValOrg / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                      dDataInclusao,
                                                      True);
         fDepFis := fValIniDep / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                         dDataInclusao,
                                                         True);
         fDepGer := fValIniDep / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                         dDataInclusao,
                                                         True);
      end;
      //----------------------------------------------------------------------------------
      // Altera os dados do cadastro de bens
      //----------------------------------------------------------------------------------
      bIdbem := ExecutaAlteracaoFisica(iModulo,iConjunto,iTerceiro,iGrupo,iSubConta,
                iAtivProjeto,iClasseBem,iFornec,fPlaca,iSituacao,
                sRegistro,sControle,sDescBem,sIdNota,sComplNota,sNumSerie,dDataNota,
                dDataInclusao,fValHist,fValOrg,fCmBem,dDataIniDep,fValIniDep,fTaxaDep,
                fDepLanc,fCmDep,fValFis,fValGer,fDepFis,fDepGer,fPropBaixa, sIdOpcional,
                sProcessoAquis,sEmpenhoAquis,sPubAutor,sPubEditora,sPubAno,
                bBemIntContab,dDtaContab);
      if not bIdbem then
         Raise Exception.Create(MensagemErro);
      //----------------------------------------------------------------------------------
      // Registra o Historico da Entrada do Bem
      //----------------------------------------------------------------------------------
      iaIdHistMov := 0;
      if sControle = 'T' then
      begin
         iTipoMovimentacao := 01;
      end else
      begin
         iTipoMovimentacao := 03;
      end;
      iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, iTipoMovimentacao,
                                                 dDataInclusao, -1,
                                                 fValOrg, fValFis, fValGer,
                                                 -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',
                                                 0,True);
      if iSeqHist = -1 then
         Raise Exception.Create(AtivoFixo.MensagemErro);
      inc(iaIdHistMov);
      aIdHistMov[iaIdHistMov] := iSeqHist;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Correção Monetaria Inicial do Bem
      //----------------------------------------------------------------------------------
      if fCmBem > 0 then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 15,
                                                    dDataInclusao, -1,
                                                    fCmBem, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Depreciação Inicial do Bem
      //----------------------------------------------------------------------------------
      if fValIniDep > 0 then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 17,
                                                    dDataInclusao, -1,
                                                    fValIniDep,fDepFis,fDepGer,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
      //----------------------------------------------------------------------------------
      if fCmDep > 0 then
      begin
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 21,
                                                    dDataInclusao, -1,
                                                    fCmDep, 0, 0,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
      end;
      //----------------------------------------------------------------------------------
      // Lançamentos Contábeis
      //----------------------------------------------------------------------------------
      if bIntegraContab and ckbFlgBemIntContab.Checked and (sControle = 'T') then
      begin
         if not AtivoFixo.VerificaPeriodoContabil(iEmpresaProp,dDtaContab,iExercicio,
                                                  iPeriodo,sMensagem) then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo do
         begin
            if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
            if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
            if not qryContaSemCC.Prepared then qryContaSemCC.Prepare;
            if not qryCCrd.Prepared       then qryCCrd.Prepare;
            if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
            if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
            qryMontaCtb.Open;
         end;
         //-------------------------------------------------------------------------------
         if not dtmAtivoFixo.qryParamCAF.Active then
         begin
            dtmAtivoFixo.qryParamCAF.Close;
            dtmAtivoFixo.qryParamCAF.ParamByName('PIDPESSOA').asInteger := iEmpresaProp;
            dtmAtivoFixo.qryParamCAF.Open;
         end;
         //-------------------------------------------------------------------------------
         bCtaxCCusto := dtmAtivoFixo.qryParamCAF.FieldByName('FLGCTADEPREC').AsInteger = 1;
         //-------------------------------------------------------------------------------
         iPlanilha := AtivoFixo.ContabilizaEntrada(iModulo,iEmpresaProp,iGrupo,iConjunto,iIdBem,
                                                   dDtaContab,fValOrg,fValIniDep,fCmBem,fCmDep,
                                                   sDescBem,sAtivProjeto,sRegistro,'E',iSubConta,
                                                   floattostr(fPlaca),
                                                   bCtaxCCusto);
         if iPlanilha <= 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         iPlanilha := AtivoFixo.RegistraPlanilhaContabil(iModulo, iEmpresaProp, iExercicio, iPeriodo,
                                                         dDtaContab, sMensagem);
         if iPlanilha < 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra no Historico a Planilha Gerada
         //-------------------------------------------------------------------------------
         with dtmAtivoFixo.qryHistCtb do
         begin
            iAux := 1;
            while iAux <= iaIdHistMov do
            begin
               ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
               ParamByName('PPLNCODIGO').AsInteger := iPlanilha;
               ExecSQL;
               inc(iAux);
            end;
         end;
      end;
      dtmAtivoFixo.qryMontaCtb.Close;
      //----------------------------------------------------------------------------------
      // Registra o Saldo das Reavaliações
      //----------------------------------------------------------------------------------
      if dReavData > 0 then
      begin
         iaIdHistMov := 0;
         with dtmAtivoFixo.qryParamCAF do
         begin
            //----------------------------------------------------------------------------
            // Calcula os valores fornecidos em moeda fiscal e gerencial
            //----------------------------------------------------------------------------
            fReavValFis := fReavValOrg / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                       dReavData,
                                                       True);
            fReavValGer := fReavValOrg / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                       dReavData,
                                                       True);
            fReavDepFis := fReavDepLanc / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                        dReavData,
                                                        True);
            fReavDepGer := fReavDepLanc / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                        dReavData,
                                                        True);
         end;
         //-------------------------------------------------------------------------------
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 32,
                                                    dReavData, -1,
                                                    fReavValOrg,fReavValFis,fReavValGer,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,fTaxaDep,fValOrg,sReavObs,0,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Reavaliacao
         //-------------------------------------------------------------------------------
         iIdReavaliacao := AtivoFixo.RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                           fReavValOrg,fReavValFis,fReavValGer,fReavCmBem,
                           fReavDepLanc,fReavDepFis,fReavDepGer,fReavCmDep,
                           strtofloat(sReavTaxaDep),dReavData,0,-1,-1,True);
         if iIdReavaliacao <= 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         if fReavCmBem <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 22,
                                                       dReavData, -1,
                                                       fReavCmBem, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial da Reavaliacao do Bem
         //-------------------------------------------------------------------------------
         if fReavDepLanc <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 33,
                                                       dReavData, iIdReavaliacao,
                                                       fReavDepLanc,fReavDepFis,fReavDepGer,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if fReavCmDep <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 19,
                                                       dReavData, -1,
                                                       fReavCmDep, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if bIntegraContab and ckbFlgBemIntContab.Checked and (sControle = 'T') then
         begin
            if not AtivoFixo.VerificaPeriodoContabil(iEmpresaProp, dDtaContab, iExercicio,
                                                     iPeriodo, sMensagem) then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryContaSemCC.Prepared then qryContaSemCC.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
               qryMontaCtb.Open;
            end;
            //----------------------------------------------------------------------------
            iPlanResult := AtivoFixo.ContabilizaEntradaReav(iModulo,iEmpresaProp,iGrupo,iConjunto,
                                                  iIdBem,dDtaContab,fReavValOrg,fReavDepLanc,
                                                  fReavCmBem,fReavCmDep,sDescBem,sAtivProjeto,
                                                  sRegistro,'E','R',iSubConta,
                                                  floattostr(fPlaca), True);
            dtmAtivoFixo.qryMontaCtb.Close;
            if iPlanResult <= 0 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            iPlanResult := AtivoFixo.RegistraPlanilhaContabil(iModulo, iEmpresaProp, iExercicio, iPeriodo,
                                                              dDtaContab, sMensagem);
            if iPlanResult <= 0 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            // Registra no Historico a Planilha Gerada
            //----------------------------------------------------------------------------
            with dtmAtivoFixo.qryHistCtb do
            begin
               iAux := 1;
               while iAux <= iaIdHistMov do
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
                  ParamByName('PPLNCODIGO').AsInteger := iPlanResult;
                  ExecSQL;
                  inc(iAux);
               end;
            end;
         end;
      end;
      dtmAtivoFixo.qryMontaCtb.Close;
      //----------------------------------------------------------------------------------
      // Registra a Ultima Reavaliação
      //----------------------------------------------------------------------------------
      if dUltReavData > 0 then
      begin
         iaIdHistMov := 0;
         with dtmAtivoFixo.qryParamCAF do
         begin
            //----------------------------------------------------------------------------
            // Calcula os valores fornecidos em moeda fiscal e gerencial
            //----------------------------------------------------------------------------
            fUltReavValFis := fUltReavValOrg / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                       dUltReavData,
                                                       True);
            fUltReavValGer := fUltReavValOrg / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                       dUltReavData,
                                                       True);
            fUltReavDepFis := fUltReavDepLanc / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAFISCAL').asString,
                                                        dUltReavData,
                                                        True);
            fUltReavDepGer := fUltReavDepLanc / AtivoFixo.Cotacao_Moeda(FieldByName('MOEDAGERENCIAL').asString,
                                                        dUltReavData,
                                                        True);
         end;
         //-------------------------------------------------------------------------------
         iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 32,
                                                    dUltReavData, -1,
                                                    fUltReavValOrg,fUltReavValFis,fUltReavValGer,
                                                    -1,-1,-1,-1,-1,-1,-1,-1,fTaxaDep,fValOrg,sUltReavObs,0,True);
         if iSeqHist = -1 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         inc(iaIdHistMov);
         aIdHistMov[iaIdHistMov] := iSeqHist;
         //-------------------------------------------------------------------------------
         // Registra a Reavaliacao
         //-------------------------------------------------------------------------------
         iIdUltReavaliacao := AtivoFixo.RegistraReavaliacao(iIdBem,iEmpresaProp,iSeqHist,
                              fUltReavValOrg,fUltReavValFis,fUltReavValGer,fUltReavCmBem,
                              fUltReavDepLanc,fUltReavDepFis,fUltReavDepGer,fUltReavCmDep,
                              strtofloat(sUltReavTaxaDep),dUltReavData,1,-1,-1,True);
         if iIdUltReavaliacao <= 0 then
            Raise Exception.Create(AtivoFixo.MensagemErro);
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetaria Inicial da Reavaliação do Bem
         //-------------------------------------------------------------------------------
         if fUltReavCmBem <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 22,
                                                       dUltReavData, -1,
                                                       fUltReavCmBem, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Depreciação Inicial da Reavaliacao do Bem
         //-------------------------------------------------------------------------------
         if fUltReavDepLanc <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 33,
                                                       dUltReavData, iIdUltReavaliacao,
                                                       fUltReavDepLanc,fUltReavDepFis,fUltReavDepGer,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Registra o Historico da Correção Monetária da Depreciação Inicial do Bem
         //-------------------------------------------------------------------------------
         if fUltReavCmDep <> 0 then
         begin
            iSeqHist := AtivoFixo.RegistraMovimentacao(iIdBem, iEmpresaProp, iModulo, 19,
                                                       dUltReavData, -1,
                                                       fUltReavCmDep, 0, 0,
                                                       -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,'',0,True);
            if iSeqHist = -1 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            inc(iaIdHistMov);
            aIdHistMov[iaIdHistMov] := iSeqHist;
         end;
         //-------------------------------------------------------------------------------
         // Lançamentos Contábeis
         //-------------------------------------------------------------------------------
         if bIntegraContab and ckbFlgBemIntContab.Checked and (sControle = 'T') then
         begin
            if not AtivoFixo.VerificaPeriodoContabil(iEmpresaProp, dDtaContab, iExercicio,
                                                     iPeriodo, sMensagem) then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            with dtmAtivoFixo do
            begin
               if not qryMontaCtb.Prepared   then qryMontaCtb.Prepare;
               if not qryGrupoCtb.Prepared   then qryGrupoCtb.Prepare;
               if not qryContaSemCC.Prepared then qryContaSemCC.Prepare;
               if not qryCCrd.Prepared       then qryCCrd.Prepare;
               if not qryPlanoConta.Prepared then qryPlanoConta.Prepare;
               if not qryHistCtb.Prepared    then qryHistCtb.Prepare;
               qryMontaCtb.Open;
            end;
            //----------------------------------------------------------------------------
            iPlanResult := AtivoFixo.ContabilizaEntradaReav(iModulo,iEmpresaProp,iGrupo,iConjunto,
                                                            iIdBem,dDtaContab,fUltReavValOrg,fUltReavDepLanc,
                                                            fUltReavCmBem,fUltReavCmDep,sDescBem,sAtivProjeto,
                                                            sRegistro,'E','R',iSubConta,floattostr(fPlaca),
                                                            True);
            dtmAtivoFixo.qryMontaCtb.Close;
            if iPlanResult <= 0 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            iPlanResult := AtivoFixo.RegistraPlanilhaContabil(iModulo, iEmpresaProp, iExercicio, iPeriodo,
                                                              dDtaContab, sMensagem);
            if iPlanResult <= 0 then
               Raise Exception.Create(AtivoFixo.MensagemErro);
            //----------------------------------------------------------------------------
            // Registra no Historico a Planilha Gerada
            //----------------------------------------------------------------------------
            with dtmAtivoFixo.qryHistCtb do
            begin
               iAux := 1;
               while iAux <= iaIdHistMov do
               begin
                  ParamByName('PIDMOVIMENTACAO').AsInteger := aIdHistMov[iAux];
                  ParamByName('PPLNCODIGO').AsInteger := iPlanResult;
                  ExecSQL;
                  inc(iAux);
               end;
            end;
            dtmAtivoFixo.qryMontaCtb.Close;
         end;
      end;
      //----------------------------------------------------------------------------------
      // Atualiza a tabela SALDOCONTABBEM
      //----------------------------------------------------------------------------------
      qryAux.Close;
      qryAux.SQL.Text := ' SELECT IDLOCALIZACAO,IDRESPONSAVEL ' + #13 +
                         ' FROM CONJUNTO ' + #13 +
                         ' WHERE (IDCONJUNTO = ' + inttostr(iConjunto) + ')';
      qryAux.Open;
      if not AtivoFixo.AtualizaSaldoContabBem(iModulo, iEmpresaProp, iIdBem,
                                              dDataInclusao,0,0,0,0,0,0,0,0,0,0,0,0,
                                              iGrupo,
                                              qryAux.FieldByName('IDLOCALIZACAO').AsInteger,
                                              qryAux.FieldByName('IDRESPONSAVEL').AsInteger,
                                              2) then
         Raise Exception.Create(AtivoFixo.MensagemErro);
      //----------------------------------------------------------------------------------
      Result := True;
   except
      On E : Exception do
      begin
         Result := False;
         MensagemErro := E.Message;
      end;
   end;
end;

end.
