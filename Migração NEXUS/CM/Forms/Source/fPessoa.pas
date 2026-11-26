{
--------------------------------------------------------------------------------------------------
WO          : 41032 (40760)
Responsável : Edilaine
Data        : 07/07/2026
Descrição   : Trocar componente para apresentação das fotos
--------------------------------------------------------------------------------------------------
 Alteração  : AplicaUpdates, Grava
 Autor(a)   : Edilaine Ferraresi
 Data       : 23/07/2018
 SIG        : 71995
 Descricao  : Inconsistencia na finalização do cadastro de representante legal
------------------------------------------------------------------------------------------------
Alteração  : PessoaChangePessoa (deixar metodo dinamico para override), bObrigaVinculoTelxEnd
Autor(a)   : Edilaine Ferraresi
Data       : 11/11/2017
SIG        : 33979
Descricao  : Reestruturação da tela do elegível
--------------------------------------------------------------------------------------------------
Nº SIG......: 22093
Data........: 13/09/2016
Responsável.: Darivaldo Alencar
Descrição...: Criar campo para NIF no Consulta geral de pessoas e na tela elegível participante
Alterações..: Alteração no modo de exibição e obrigatoriedade dos campos da aba Documentação.
--------------------------------------------------------------------------------------------------
Nº SOL......: 261809
Nº PPM..: 1071821
Data........: 22/09/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Alteração de nome de LBL
Alterações DFM: Alteração no DFM
--------------------------------------------------------------------------------------------------
Nº SOL......: 250389/17574
Nº PPM..: 992385
Data........: 05/08/2015
Responsável.: Higor Nayde Ferreira
Descrição...: Criação de flg para primeira habilitação e categoria
Alterações DFM: Criação dos checkBoxs primeira habilitação e categoria
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 1059049
Nº KINTANA..: 149075
Data........: 14/12/2010
Responsável.: Thaise Amaral Martins
Descrição...: Na função PossuiVinculo, colocar o tipo de situação em 'A' ou 'F'
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 24591
Nº KINTANA..: 524457
Data........: 28/10/2010
Responsável.: Thaise Amaral Martins
Descrição...: Desabilitando campos que só podem ser alterados no módulo Folha de Pagamento caso
              o funcionário possua vínculo empregatício com a Funcef.
              Além da uCtrlPessoa no fPessoaMT, esta alteração da mesma forma foi feita em:
              fPessoaMT
              fCadFunc <- Herda de fPessoaMT
              fCadForne <- Herda de fCadFunc
              fCadElegivel <- Herda de fPessoa
-------------------------------------------------------------------------------------------------- }

// andre tavares - pendência 18016 - 15/02/2004

unit Fpessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, Pessoa, Menus, Db, StdCtrls, checklst, ComCtrls,
  wwdblook, DBCtrls, Mask, wwdbedit, MontaSelect, DBTables, wwQuery,
  Wwdatsrc, TB97, MAHlpBtn, Buttons, Grids, Wwdbigrd, Wwdbgrid,
  TabControlDetalhe, ExtCtrls, DBaseDados, UDataBase, UMensErro, ftelaaut,
  uAutorizacao, ExtDlgs, fCadastroCS, TB97Tlbr, TB97Ctls,
  IvDictio, IvMulti, IvEMulti, consts, CMDBLookupCombo, Wwdbspin, ImgList,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, TREdit, JPEG;


type
  TfrmPessoa = class(TfrmCadMestreDetalheCS)
    sbtnFisJur: TToolbarButton97;
    dbedDocumento: TwwDBEdit;
    dbedNomeFantasia: TDBEdit;
    dbedRazaoSocial: TDBEdit;
    lblDocumento: TLabel;
    lblNome: TLabel;
    LabelRAZAOSOCIAL: TLabel;
    dbedemail: TwwDBEdit;
    lblEMail: TLabel;
    lblPdGrupo: TLabel;
    lblPdLocal: TLabel;
    dbedNomeEndereco: TDBEdit;
    lblPdLogradouro: TLabel;
    dbedLogradouro: TDBEdit;
    lblPdComplemento: TLabel;
    DBEDCOMPLEMENTO: TwwDBEdit;
    lblPdCidade: TLabel;
    lblPdEstado: TLabel;
    dbedEstado: TwwDBEdit;
    dbedBairro: TwwDBEdit;
    DBNUMERO: TDBEdit;
    lblPdNumero: TLabel;
    lblPdCEP: TLabel;
    dbedCEP: TwwDBEdit;
    dbedPais: TwwDBEdit;
    tbsDocumento: TTabSheet;
    tbsTelefone: TTabSheet;
    tbsContato: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    lblDDI: TLabel;
    lblDDD: TLabel;
    lblNumTelefone: TLabel;
    DBEDDDI: TDBEdit;
    DBEDDDD: TDBEdit;
    DBEDNUMERO: TwwDBEdit;
    GroupBox4: TGroupBox;
    chkTipoTelefone: TCheckListBox;
    GroupBox5: TGroupBox;
    mnbm: TLabel;
    lblPdeMail: TLabel;
    lblPdNome: TLabel;
    lblPdSetor: TLabel;
    dbedcontatonome: TDBEdit;
    dbedcontatoemail: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox6: TGroupBox;
    lblBairro: TLabel;
    tb97TituloDetalhe: TToolbar97;
    dbedPaiDetalhe: TwwDBEdit;
    dbgTelefone: TwwDBGrid;
    dbgContato: TwwDBGrid;
    dbgContatoRamal: TwwDBGrid;
    dblcTelefone: TCMDBLookupCombo;
    dbgTelefoneRamal: TwwDBGrid;
    dblcContato: TCMDBLookupCombo;
    updSubTipo: TUpdateSQL;
    qrySubTipo: TwwQuery;
    dsSubTipo: TwwDataSource;
    dsPessoaFisica: TwwDataSource;
    updPessoaFisica: TUpdateSQL;
    qryPessoaFisica: TwwQuery;
    Pessoa: TPessoa;
    ImageList1: TImageList;
    qryTelefone: TwwQuery;
    updTelefone: TUpdateSQL;
    dsTelefone: TwwDataSource;
    dsEndereco: TwwDataSource;
    updEndereco: TUpdateSQL;
    qryEndereco: TwwQuery;
    qryContato: TwwQuery;
    updContato: TUpdateSQL;
    dsContato: TwwDataSource;
    qryRamal: TwwQuery;
    updRamal: TUpdateSQL;
    dsRamal: TwwDataSource;
    qryDocumento: TwwQuery;
    dsDocumento: TwwDataSource;
    updDocumento: TUpdateSQL;
    qryEscolhePessoa: TwwQuery;
    qryEscolhePessoaIDPESSOA: TFloatField;
    qryEscolhePessoaNOME: TStringField;
    qryEscolhePessoaRAZAOSOCIAL: TStringField;
    qryEscolhePessoaNUMDOCUMENTO: TStringField;
    dsEscolhePessoa: TwwDataSource;
    qryRamalIDCONTATO: TFloatField;
    qryRamalIDTELEFONE: TFloatField;
    qryRamalRAMAL: TStringField;
    qryRamalNUMERO: TStringField;
    qryRamalNOME: TStringField;
    qryDocumentoIDDOCUMENTO: TFloatField;
    qryDocumentoNOMEDOCUMENTO: TStringField;
    qryDocumentoMASCARA: TStringField;
    qryDocumentoOBRIGAUF: TStringField;
    qryDocumentoOBRIGAORGAO: TStringField;
    qryDocumentoOBRIGAEMISSAO: TStringField;
    qryDocumentoIDPESSOA: TFloatField;
    qryDocumentoIDIMAGEM: TFloatField;
    qryDocumentoIDPAIS: TFloatField;
    qryDocumentoNUMDOCUMENTO: TStringField;
    qryDocumentoORGAO: TStringField;
    qryDocumentoDATAEMISSAO: TDateTimeField;
    qryTelefoneIDTELEFONE: TFloatField;
    qryTelefoneIDPESSOA: TFloatField;
    qryTelefoneIDENDERECO: TFloatField;
    qryTelefoneDDI: TStringField;
    qryTelefoneDDD: TStringField;
    qryTelefoneTIPO: TStringField;
    qryIDPESSOA: TFloatField;
    qryNOME: TStringField;
    qryTIPO: TStringField;
    qryRAZAOSOCIAL: TStringField;
    qryNUMDOCUMENTO: TStringField;
    qryIDDOCUMENTO: TFloatField;
    qryEMAIL: TStringField;
    qryIDGRUPO: TFloatField;
    qryContatoIDCONTATO: TFloatField;
    qryContatoIDENDERECO: TFloatField;
    qryContatoNOME: TStringField;
    qryContatoEMAIL: TStringField;
    qryContatoCARGO: TStringField;
    qryContatoSETOR: TStringField;
    OpenPictureDialog1: TOpenPictureDialog;
    qryImagem: TwwQuery;
    updImagem: TUpdateSQL;
    qryIDIMAGEM: TFloatField;
    updImagensDoc: TUpdateSQL;
    qryImagensDoc: TwwQuery;
    dsImagem: TwwDataSource;
    dsImagensDoc: TwwDataSource;
    qryTipoDoc: TwwQuery;
    qryTelefoneTComercial: TStringField;
    qryTelefoneTParticular: TStringField;
    qryTelefoneTFax: TStringField;
    qryTelefoneTCelular: TStringField;
    qryTelefoneTRecado: TStringField;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    qryContatoTelefone: TStringField;
    qryRamalIDTELCONTATO: TFloatField;
    lblNasc: TLabel;
    lblObs: TLabel;
    DBMemo1: TDBMemo;
    qryContatoNASCIMENTO: TDateTimeField;
    qryContatoOBS: TMemoField;
    qryContatoIDPESSOA: TFloatField;
    qryImagemIDIMAGEM: TFloatField;
    qryImagemIMAGEM: TBlobField;
    qryImagemDESCRIMAGEM: TStringField;
    qryImagensDocIDIMAGEM: TFloatField;
    qryImagensDocIMAGEM: TBlobField;
    qryImagensDocDESCRIMAGEM: TStringField;
    SpeedButton1: TSpeedButton;
    MSGrupo: TMontaSelect;
    edDBGrupo: TwwDBEdit;
    qryNOMEGRUPO: TStringField;
    qryEstado: TwwQuery;
    qryEnderecoIDPESSOA: TFloatField;
    qryEnderecoIDENDERECO: TFloatField;
    qryEnderecoIDCIDADES: TFloatField;
    qryEnderecoNUMERO: TStringField;
    qryEnderecoCOMPLEMENTO: TStringField;
    qryEnderecoBAIRRO: TStringField;
    qryEnderecoCIDADE: TStringField;
    qryEnderecoNOME: TStringField;
    qryEnderecoCEP: TStringField;
    qryCidade: TwwQuery;
    dsCidade: TwwDataSource;
    cmbCidade: TCMDBLookupCombo;
    qryCidadeIDCIDADES: TFloatField;
    qryCidadeNOMECIDADE: TStringField;
    qryCidadeCODESTADO: TStringField;
    qryCidadeNOMEESTADO: TStringField;
    qryCidadeIDPAIS: TFloatField;
    qryCidadeNOMEPAIS: TStringField;
    qryEnderecoNOMECIDADE: TStringField;
    qryEnderecoNOMEESTADO: TStringField;
    qryEnderecoNOMEPAIS: TStringField;
    lblPdPais: TLabel;
    qryIDENDCOMERCIAL: TFloatField;
    qryIDENDRESIDENCIAL: TFloatField;
    qryIDENDENTREGA: TFloatField;
    qryIDENDCOBRANCA: TFloatField;
    qryIDENDCORRESP: TFloatField;
    grpTipoEnd: TGroupBox;
    chkTipoEndereco: TCheckListBox;
    qryDocumentoIDESTADO: TFloatField;
    qryEnderecoLOGRADOURO: TStringField;
    qryTelefoneNUMERO: TStringField;
    DbeHomePage_Padrao: TwwDBEdit;
    LblHomePage_Padrao: TLabel;
    qryHOMEPAGE: TStringField;
    qryNaturalidade_Padrao: TwwQuery;
    qryNaturalidade_PadraoCODESTADO: TStringField;
    qryNaturalidade_PadraoNOMEESTADO: TStringField;
    qryNaturalidade_PadraoIDPAIS: TFloatField;
    qryNaturalidade_PadraoNOMEPAIS: TStringField;
    qryNaturalidade_PadraoNOMENACIONALIDADE: TStringField;
    DsNaturalidade_Padrao: TwwDataSource;
    PgCtrlPesFisica_Padrao: TPageControl;
    TbsDocumentos_Padrao: TTabSheet;
    TbsDadosPessoais_Padrao: TTabSheet;
    PnlDocumentos_Padrao: TPanel;
    pnlItemsDoc: TPanel;
    pnlNomeDoc: TPanel;
    DBText1: TDBText;
    pnlOrgao: TPanel;
    lblPdOrgao: TLabel;
    wwDBEdit1: TwwDBEdit;
    pnlEmissao: TPanel;
    lblPdEmiss: TLabel;
    pnlUF: TPanel;
    lblPdUF: TLabel;
    dbcmbEstadoDoc: TCMDBLookupCombo;
    pnlNumDoc: TPanel;
    edDocNumDocumento: TwwDBEdit;
    pnlFoto: TPanel;
    lstDocumentos: TListView;
    BvlDadosNasc_Padrao: TBevel;
    BvlNatur_Padrao: TBevel;
    LblNomePai_Padrao: TLabel;
    LblNomeMae_Padrao: TLabel;
    LblNaturalidade_Padrao: TLabel;
    LblNacionalidade_Padrao: TLabel;
    LblDataNasc_Padrao: TLabel;
    LblTipoSang_Padrao: TLabel;
    CkbIsentoIrrf_Padrao: TDBCheckBox;
    dbrgrpSexo_Padrao: TDBRadioGroup;
    dbrgrpEstCivil_Padrao: TDBRadioGroup;
    EdtNomePai_Padrao: TwwDBEdit;
    EdtNomeMae_Padrao: TwwDBEdit;
    CmbNaturalidade_Padrao: TwwDBLookupCombo;
    DbedNacionalidade_Padrao: TwwDBEdit;
    EdtTipoSang_Padrao: TwwDBEdit;
    GpNumDepend_Padrao: TGroupBox;
    LblDepenIr_Padrao: TLabel;
    LblDepenSal_Padrao: TLabel;
    LblTotalDepende_Padrao: TLabel;
    SpinDepenIr_Padrao: TwwDBSpinEdit;
    SpinDepenSal_Padrao: TwwDBSpinEdit;
    SpinTotalDepente_Padrao: TwwDBSpinEdit;
    Bevel1: TBevel;
    PnlAssociaFoto_Padrao: TPanel;
    btnAssociarimgPessoa: TButton;
    SbImagePessoa_Padrao: TScrollBox;
    imgPessoa: TDBImage;
    EdtDataNasc_Padrao: TCMDateTimePicker;
    CMDateTimePicker2: TCMDateTimePicker;
    EdtDataFalec_Padrao: TCMDateTimePicker;
    Label1: TLabel;
    DBDateEdit2: TCMDateTimePicker;
    qryIDMODULORESPON: TFloatField;
    qryNOMEMODULO: TStringField;
    PnlValidade: TPanel;
    LblDtValidade: TLabel;
    CMDateTimePicker1: TCMDateTimePicker;
    qryDocumentoFLGOBRIGAVALIDADE: TStringField;
    qryDocumentoDATAVALIDADE: TDateTimeField;
    qryTipoDocIDDOCUMENTO: TFloatField;
    qryTipoDocNOMEDOCUMENTO: TStringField;
    qryTipoDocIDREGRA: TFloatField;
    qryTipoDocFISICAJURIDICA: TStringField;
    qryTipoDocMASCARA: TStringField;
    qryTipoDocDOCCHAVE: TStringField;
    qryTipoDocOBRIGAUF: TStringField;
    qryTipoDocOBRIGAORGAO: TStringField;
    qryTipoDocOBRIGAEMISSAO: TStringField;
    qryTipoDocFLGOBRIGAVALIDADE: TStringField;
    EdtvlrPensao_Padrao: TDBRealEdit;
    EdtlrlINSS_Padrao: TDBRealEdit;
    LbVlrlINSS_Padrao: TLabel;
    LblvlrPensao_Padrao: TLabel;
    qryPessoaFisicaVLRINSS: TFloatField;
    qryPessoaFisicaVLRPENSAO: TFloatField;
    qryPessoaFisicaIDCIDADES: TFloatField;
    qryPessoaFisicaPERCIRRFJUD: TFloatField;
    qryPessoaFisicaSTATUSPROCJUD: TFloatField;
    qryPessoaFisicaDATACONCLIMINAR: TDateTimeField;
    qryPessoaFisicaDATACONCJULG: TDateTimeField;
    qryPessoaFisicaVLRTOTCOMPIR: TFloatField;
    qryPessoaFisicaVLRPARCCOMPIR: TFloatField;
    qryPessoaFisicaINICIOCOMPIR: TStringField;
    qryPessoaFisicaVLRENQUADRAMENTO: TFloatField;
    qryPessoaFisicaINICIOINVALIDEZ: TDateTimeField;
    qryPessoaFisicaFIMINVALIDEZ: TDateTimeField;
    qryPessoaFisicaFLGDESTCC: TFloatField;
    qryPessoaFisicaIDSINDICATO: TFloatField;
    qryPessoaFisicaIDPESSOA: TFloatField;
    qryPessoaFisicaCODESTADO: TStringField;
    qryPessoaFisicaIDPAIS: TFloatField;
    qryPessoaFisicaIDFONTRECR: TFloatField;
    qryPessoaFisicaIDGRINSTR: TFloatField;
    qryPessoaFisicaIDPROFISS: TFloatField;
    qryPessoaFisicaNOMEPAI: TStringField;
    qryPessoaFisicaNOMEMAE: TStringField;
    qryPessoaFisicaDATAMORTE: TDateTimeField;
    qryPessoaFisicaDATANASC: TDateTimeField;
    qryPessoaFisicaSEXO: TStringField;
    qryPessoaFisicaTIPOSANG: TStringField;
    qryPessoaFisicaESTCIVIL: TStringField;
    qryPessoaFisicaNUMDEPIRRF: TFloatField;
    qryPessoaFisicaNUMDEPSALF: TFloatField;
    qryPessoaFisicaNUMDEPTOT: TFloatField;
    qryPessoaFisicaFLGISENTOIRRF: TFloatField;
    qryPessoaFisicaIDESTADO: TFloatField;
    qryPessoaFisicaCORPESSOA: TFloatField;
    qryPessoaFisicaFLGDEFICIENTE: TFloatField;
    qryPessoaFisicaFLGMOLESTIAGRAVE: TFloatField;
    qryPessoaFisicaDATAMOLESTIAGRAVE: TDateTimeField;
    qryPessoaFisicaFLGSOMAIRSUPINSS: TFloatField;
    qryEstadoIDESTADO: TFloatField;
    qryEstadoCODESTADO: TStringField;
    qryEstadoNOMEESTADO: TStringField;
    qryEstadoIDPAIS: TFloatField;
    qryEstadoNOMEPAIS: TStringField;
    qryEstadoMASCARACPOSTAL: TStringField;
    qryEnderecoTIPOEND_PADRAO: TStringField;
    qryTipoDocOficial: TwwQuery;
    lblMsg: TLabel;
    qQueryAux: TwwQuery;
    pnlDataHabilitacao: TPanel;
    lblDtHabilitacao: TLabel; //SOL 261809 PPM..: 1071821 Higor Nayde
    pnlCategoria: TPanel;
    lblCategoria: TLabel;   //SOL 261809 PPM..: 1071821 Higor Nayde
    edtCategoria: TwwDBEdit;
    qryDocumentoCATEGCNH: TStringField;
    qryDocumentoOBRIGAPRMHAB: TStringField;
    qryDocumentoOBRIGACATG: TStringField;
    qryTipoDocOBRIGACATG: TStringField;
    qryTipoDocOBRIGAPRMHAB: TStringField;
    CMDateTimePicker38: TCMDateTimePicker;
    qryDocumentoDTPRIMEIRACNH: TDateTimeField;
    pnlPais: TPanel;
    Label91: TLabel;
    dbcmdPais: TCMDBLookupCombo;
    qryTipoDocOBRIGAPRMHAB_1: TStringField;
    qryTipoDocOBRIGACATG_1: TStringField;
    qryTipoDocEXIBEUF: TStringField;
    qryTipoDocEXIBEORGAO: TStringField;
    qryTipoDocEXIBEEMISSAO: TStringField;
    qryTipoDocEXIBEVALIDADE: TStringField;
    qryTipoDocEXIBEPRMHAB: TStringField;
    qryTipoDocEXIBECATG: TStringField;
    qryTipoDocEXIBEPAIS: TStringField;
    qryTipoDocOBRIGAPAIS: TStringField;
    qryDocumentoEXIBEUF: TStringField;
    qryDocumentoEXIBEORGAO: TStringField;
    qryDocumentoEXIBEEMISSAO: TStringField;
    qryDocumentoEXIBEVALIDADE: TStringField;
    qryDocumentoEXIBEPRMHAB: TStringField;
    qryDocumentoEXIBECATG: TStringField;
    qryDocumentoEXIBEPAIS: TStringField;
    qryDocumentoOBRIGAPAIS: TStringField;
    qryPais: TwwQuery;
    qryPaisIDPAIS: TFloatField;
    qryPaisNOMEPAIS: TStringField;
    qryPaisCODINTERNACIONAL: TStringField;
    pnlTipoDocumento: TPanel;
    LbTpDocumento: TLabel;
    dbcmbTipoDocumento: TCMDBLookupCombo;
    qryTipoDocumento: TwwQuery;
    qryDocumentoIDTIPODOCPESSOAXMASC: TFloatField;
    qryDocumentoFLGMULTIPLAMASCARA: TStringField;
    qryTipoDocFLGMULTIPLAMASCARA: TStringField;
    imgPessoa1: TImage;
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure dbedDocumentoExit(Sender: TObject);
    procedure sbtnFisJurClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbcDetalheChange(Sender: TObject);
    procedure chkTipoTelefoneClick(Sender: TObject);
    procedure DesvincularClick(Sender: TObject);
    procedure dbgContatoRamalExit(Sender: TObject);
    procedure qryRamalAfterInsert(DataSet: TDataSet);
    procedure dblcTelefoneCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcContatoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbedNomeFantasiaExit(Sender: TObject);
    procedure pnlItemsDocResize(Sender: TObject);
    procedure lstDocumentosChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure dbcmbEstadoDocChange(Sender: TObject);
    procedure dsStateChange(Sender: TObject);
    procedure edDocNumDocumentoExit(Sender: TObject);
    procedure btnAssociarimgPessoaClick(Sender: TObject);
    procedure lstDocumentosDblClick(Sender: TObject);
    procedure btnLimpaImgPessoaClick(Sender: TObject);
    procedure dsDocumentoStateChange(Sender: TObject);
    procedure qryNOMEChange(Sender: TField);
    procedure dsImagemDataChange(Sender: TObject; Field: TField);
    procedure qryTelefoneCalcFields(DataSet: TDataSet);
    procedure dbgTelefoneRamalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryRamalUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure dbgContatoRamalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsTelefoneDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edDBGrupoChange(Sender: TObject);
    procedure edDBGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDBGrupoCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure dsCidadeDataChange(Sender: TObject; Field: TField);
    procedure qryEnderecoIDCIDADESChange(Sender: TField);
    procedure dsEnderecoDataChange(Sender: TObject; Field: TField);
    procedure chkTipoEnderecoClickCheck(Sender: TObject);
    procedure qryEnderecoBeforeDelete(DataSet: TDataSet);
    procedure PnlAssociaFoto_PadraoResize(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure PessoaChangePessoa(IdPessoa: Integer);   dynamic;        //edilaine - SIG33979
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryEnderecoCalcFields(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure PintarCampos(lEdit: Array of TComponent; Color: TColor);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dbcmbTipoDocumentoChange(Sender: TObject);


  private

         JaExiste : Boolean;
         lTelefone, lEndereco, lBanco, lContato: String;
         bTtravarCadastro: Boolean;

         function Grava(bApagaFilhos:Boolean):integer;

         procedure AtuDocumentos;
         procedure AtuTipo;
         procedure MudaTipo;
         procedure RamalCheck;
         procedure MostraDocumento;
         procedure InsereDocumento;
         procedure AssociaImagem(ds : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
         procedure MudaDocumento;
         procedure Ramal(Alteracao:integer);
         
  protected
         procedure AplicaUpdates(const DataSets: array of TDBDataSet);      //edilaine - SIG71995

  public
      bObrigaVinculoTelxEnd : Boolean;   //edilaine - SIG33979
      bControleTransFilho   : Boolean;   //edilaine - SIG33979
      bExecutaCommitDados   : boolean;   //edilaine - SIG71995

      function PossuiVinculo(sIDPessoa: Integer): Boolean;//Thaise - Verificar se a pessoa possui vinculo empregaticio com a FUNCEF
      function TravaAlteracao(idPessoa: Integer):boolean; //Thaise - Verificar se o modulo é folha de pagamento e chamar a Função PossuiVinculoEmpregaticio,
                                                          //pra retornar se a alteração pode ou não ser alterada.
      procedure HabilitarCampos; //Thaise - Destrava os campos mediante comit ou cancelamento na operação.
      //Darivaldo Alencar SIG 22093 -inicio
      function ValidaEntrada: boolean;
      function SoNumero(fField : String): String;
      function SelMascara(sIdDocumento: String; sIdTipoDocPessoaxMasc: String): String;
      function CarregaTipoDocumento (sIdDocumento: String;sIdTipoDocPessoaxMasc: String): String;
      //Darivaldo Alencar SIG 22093 -fim
  published
  end;

var
  frmPessoa: TfrmPessoa;
  sImagem  : string;

implementation
uses fEscolhePessoa, fImagemDoc, uSistema{$IFNDEF VER0505}, uCMTypes {$ENDIF};

{$R *.DFM}


procedure TfrmPessoa.bbtnCancelarDetClick(Sender: TObject);
begin
  CmeDetalhe.Cancel(Self);
end;



procedure TfrmPessoa.sbtnFisJurClick(Sender: TObject);
begin
   inherited;

   Pessoa.EJuridica := not(Pessoa.EJuridica);
   MudaTipo;
end;



procedure TfrmPessoa.MudaTipo;
begin
   Pessoa.HabilitaPessoa;

   //Início - Rodolpho da Silva - 09/03/2007
   // Esta rotina não pode ser desta forma, pois
   //assim, só seriam listados os documentos de PJ.
   //No problema do CadastroPrev, não seria possível inserir
   //nenhum participante (PF). A pendência 24024 é resolvida
   //pela qry nos componentes qryDocumento e qryTipoDoc
   {if Pessoa.EJuridica then
   begin
        qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString := 'J';
        qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'J';
   end

   else If Pessoa.EJuridica then
   begin  //Marcus Oliveira P. 24024
        qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString := 'F';
        qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'F';
   end
   else
   begin
        qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString := 'A';
        qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'A';
   end;}

   if Pessoa.EJuridica then
   begin
        qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString   := 'J';
        qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'J';
   end
   else
   begin
        qryTipoDoc.ParamByName('IDFISICAJURIDICA').AsString   := 'F';
        qryDocumento.ParamByName('IDFISICAJURIDICA').AsString := 'F';
   end;
   //Fim - Rodolpho da Silva - 09/03/2007

   qryTipoDoc.Close;
   qryTipoDoc.Open;
   qryDocumento.Close;
   qryDocumento.Open;

   //Adiciona PageControl Para Pessoa Física
   if (Pessoa.EJuridica) or not(Pessoa.UsaPessoaFisica) then
   begin
      PgCtrlPesFisica_Padrao.Visible := False;
      PnlDocumentos_Padrao.parent := tbsDocumento
   end
   else
   begin
      PnlDocumentos_Padrao.parent := TbsDocumentos_Padrao;
      PgCtrlPesFisica_Padrao.Visible := True;
      PgCtrlPesFisica_Padrao.ActivePage := TbsDocumentos_Padrao;
   end;

   AtuDocumentos;
end;



procedure TfrmPessoa.FormCreate(Sender: TObject);
var i : integer;
begin
     inherited;
     tbsDocumento.PageIndex := 0;
     for i := 0 to Pessoa.SQLFiltro.Count-1 do
         MontaSelect.Filtro.Add(Pessoa.SQLFiltro[i]);

     Pessoa.IdEmpresaPropria := Sistema.IdEmpresa;

     qry.Prepare;
     qryEndereco.Prepare;
     qryTelefone.Prepare;
     qryContato.Prepare;
     qrySubTipo.Prepare;
     qryImagem.Prepare;
     qryImagensDoc.Prepare;
     qryPessoaFisica.Prepare;
     qryDocumento.Prepare;
     qryRamal.Prepare;
     qryEstado.Open;
     qryPais.Open;//Darivaldo Alencar SIG 22093

     MudaTipo;

     tbcDetalhe.TabIndex := 0;
     tbcDetalheChange(tbcDetalhe);

     if Sistema.SoUpperPessoa then
     begin
       dbedNomeFantasia.CharCase := ecUpperCase;
       dbedRazaoSocial.CharCase := ecUpperCase;
     end
     else
     begin
       dbedNomeFantasia.CharCase := ecNormal;
       dbedRazaoSocial.CharCase := ecNormal;
     end;

     bObrigaVinculoTelxEnd := true;   //edilaine - SIG33979
     bControleTransFilho   := false;  //edilaine - SIG33979
     bExecutaCommitDados   := true;   //edilaine - SIG71995
end;

procedure TfrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     qry.Close;
     qry.Unprepare;

     qryDocumento.Close;
     qryDocumento.Unprepare;
     qryEndereco.Close;
     qryEndereco.Unprepare;
     qryTelefone.Close;
     qryTelefone.Unprepare;
     qryContato.Close;
     qryContato.Unprepare;
     qryRamal.Close;
     qryRamal.Unprepare;
     qrySubTipo.Close;
     qrySubTipo.Unprepare;
     qryPessoaFisica.Close;
     qryPessoaFisica.Unprepare;
     qryImagem.Close;
     qryImagem.Unprepare;
     qryImagensDoc.Close;
     qryImagensDoc.Unprepare;
     qryEstado.Close;
     qryPais.close;//Darivaldo Alencar SIG 22093
     inherited;
end;

function TfrmPessoa.Grava(bApagaFilhos:Boolean):integer;
begin
     qryRamal.Filtered := false;
     qryTelefone.Filtered := false;
     try
        // Não grava documento em branco
        with qryDocumento do
        begin
             First;
             while not(EOF) do
             begin
                  if TRIM(FieldByName('NUMDOCUMENTO').AsString) = '' then
                  begin
                       if qryImagensDoc.Locate('IDIMAGEM',FieldByName('IDIMAGEM').AsFloat,[]) then
                          qryImagensDoc.Delete;
                       delete;
                  end
                  else
                  begin
                       Edit;
                       if State in [dsEdit] then
                       begin
                            FieldByName('IDPESSOA').AsFloat := qry.FieldByName('IDPESSOA').AsFloat;
                            Post;
                       end;
                       next;
                  end;
             end;
             first;

             //if bApagaFilhos then
             //begin
             //
             //end;

             //edilaine - SIG71995 - inicio
             if bExecutaCommitDados then
             begin
               //edilaine - SIG33979 - inicio
               if bControleTransFilho then
                  AplicaAlteracoesInTransacao([qry, qrySubTipo, qryDocumento, qryPessoaFisica, qryEndereco, qryTelefone, qryContato, qryRamal, qryImagem, qryImagensDoc])
               else
                  AplicaAlteracoes([qry, qrySubTipo, qryDocumento, qryPessoaFisica, qryEndereco, qryTelefone, qryContato, qryRamal, qryImagem, qryImagensDoc]);
               //edilaine - SIG33979 - fim
             end
             else
             begin
               AplicaUpdates([qry, qrySubTipo, qryDocumento, qryPessoaFisica, qryEndereco, qryTelefone, qryContato, qryRamal, qryImagem, qryImagensDoc]);
             end;
             //edilaine - SIG71995 - fim

             Result := 0;
        end;

     except on EDBEngineError do
            begin
                 qry.Edit;
                 qrySubTipo.Edit;
                 if not(Pessoa.EJuridica) then qryPessoaFisica.Edit;
                 raise;
            end;
     end;
     qryRamal.Filtered := true;
     qryTelefone.Filtered := true;
end;

procedure TfrmPessoa.tbcDetalheChange(Sender: TObject);
begin
     inherited;
     if qryEndereco.IsEmpty then
        if ((pgctrlDetalhe.ActivePage = tbsTelefone) and (bObrigaVinculoTelxEnd)) or   //edilaine - SIG33979
           (pgctrlDetalhe.ActivePage = tbsContato) then
        begin
             MsgDlg('Cadastre pelo menos um endereço', 'Atenção', mtInformation, [mbOk],0);
             tbcDetalhe.TabIndex := tbcDetalhe.TabIndex-1;
             if (pgctrlDetalhe.ActivePage = tbsContato) then
                tbcDetalhe.TabIndex := tbcDetalhe.TabIndex-1;
             pgctrlDetalhe.ActivePage := tbsDet;
             tbcDetalheChange(tbcDetalhe);
             exit;
        end;
         if (pgctrlDetalhe.ActivePage = tbsDet) then
          begin
               dbedPaiDetalhe.Visible := true;
               dbedPaiDetalhe.DataSource := dsEndereco;
               dbedPaiDetalhe.DataField := 'NOME';
               tb97TituloDetalhe.Visible := true;
          end
          else if (pgctrlDetalhe.ActivePage = tbsTelefone) then
          begin
               dbedPaiDetalhe.Visible := true;
               dbedPaiDetalhe.DataSource := dsEndereco;
               dbedPaiDetalhe.DataField := 'NOME';
               //edilaine - SIG33979 - inicio
               if bObrigaVinculoTelxEnd then
                  qryTelefone.Filter := 'IDENDERECO = '''+FloatToStr(qryEnderecoIDENDERECO.AsFloat)+'''';
               //edilaine - SIG33979 - inicio
               qryRamal.Filter := 'IDTELEFONE = '''+FloatToStr(qryTelefoneIDTELEFONE.AsFloat)+'''';
               tb97TituloDetalhe.Visible := true;
          end
          else if (pgctrlDetalhe.ActivePage = tbsContato) then
          begin
               dbedPaiDetalhe.Visible := true;
               dbedPaiDetalhe.DataSource := dsEndereco;
               dbedPaiDetalhe.DataField := 'NOME';
               qryContato.Filter := 'IDENDERECO = '''+FloatToStr(qryEnderecoIDENDERECO.AsFloat)+'''';
               qryRamal.Filter := 'IDCONTATO = '''+FloatToStr(qryContatoIDCONTATO.AsFloat)+'''';
               tb97TituloDetalhe.Visible := true;
          end
          else
          begin
               dbedPaiDetalhe.Visible := false;
               dbedPaiDetalhe.DataSource := nil;
               dbedPaiDetalhe.DataField := '';
               tb97TituloDetalhe.Visible := false;
          end;
end;

procedure TfrmPessoa.chkTipoTelefoneClick(Sender: TObject);
var
   sTipo : string;
begin
     inherited;
          if (qryTelefone.State in [dsInsert,dsEdit]) then
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
               qryTelefoneTIPO.AsString := sTipo;
          end;
end;

procedure TfrmPessoa.DesvincularClick(Sender: TObject);
begin
  inherited;
  try
     qryRamal.Delete;
  except end;
end;

procedure TfrmPessoa.dbgContatoRamalExit(Sender: TObject);
begin
     inherited;
     RamalCheck;
end;

procedure TfrmPessoa.qryRamalAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if pgCtrlDetalhe.ActivePage=tbsContato then
     qryRamalIDCONTATO.AsFloat := qryContatoIDCONTATO.AsFloat
  else
      qryRamalIDTELEFONE.AsFloat := qryTelefoneIDTELEFONE.AsFloat;

  qryRamalIDTELCONTATO.AsFloat := LeUltRegistro(nil,'TELCONTATO');
end;

procedure TfrmPessoa.dblcTelefoneCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
       with FillTable do
       begin
            Edit;
            FieldByName('IDTELEFONE').AsFloat := LookUpTable.FieldByName('IDTELEFONE').AsFloat;
            FieldByName('NUMERO').AsString := LookUpTable.FieldByName('NUMERO').AsString;
            Post;
       end;
  end;
end;

procedure TfrmPessoa.dblcContatoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if modified then
  begin
       FillTable.Edit;
       FillTable.FieldByName('IDCONTATO').AsFloat := LookUpTable.FieldByName('IDCONTATO').AsFloat;
       FillTable.FieldByName('NOME').AsString := LookUpTable.FieldByName('NOME').AsString;
       FillTable.Post;
  end;
end;

procedure TfrmPessoa.dbedNomeFantasiaExit(Sender: TObject);
begin
     if (dbedNomeFantasia.Modified) and (dbedDocumento.Text = '') and (dbedNomeFantasia.text <> '') then
     begin
          with qryEscolhePessoa do
          begin
               if FazQuery( qryEscolhePessoa,
                           'SELECT PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL , PESSOA.NUMDOCUMENTO '+
                           'FROM PESSOA WHERE (PESSOA.IDPESSOA <> '+FloatToStr(qryIDPESSOA.AsFloat)+' ) and '+
                           '( PESSOA.NOME = '''+dbedNomeFantasia.text+''')') then
               begin
                    Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

                    JaExiste := true;
                    if Pessoa.EJuridica then
                    begin
                       MsgDlg('Já existe cadastro com este Nome Fantasia', Caption, mtWarning , [mbOk], 0);
                       frmEscolhePessoa.sNomeCodigo := 'Nome fantasia';
                    end
                    else
                    begin
                         MsgDlg('Já existe cadastro com este Nome', Caption, mtWarning , [mbOk], 0);
                         frmEscolhePessoa.sNomeCodigo := 'Nome';
                    end;

                    frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;
                    if frmEscolhePessoa.ShowModal = mrOK then
                    begin
                         bbtnCancelarClick(Self);
                         Pessoa.ChangePessoa( FieldByName('IDPESSOA').AsInteger);
                         sbtnAlterarClick(Self);
                    end;
               end;
          end;

          if qry.State in [dsInsert, dsEdit] then
          begin
               if not(Pessoa.EJuridica) then
                  qryRAZAOSOCIAL.AsString := dbedNomeFantasia.text
               else
                   if qryRAZAOSOCIAL.AsString = '' then
                      qryRAZAOSOCIAL.AsString := dbedNomeFantasia.text;
          end;
     end;
     inherited;
end;

procedure TfrmPessoa.dbedDocumentoExit(Sender: TObject);
var tempItem : TListItem;
begin
     if (dbedDocumento.modified) and (dbedDocumento.text <> '') then
     begin
          if Pessoa.DocumValido(dbedDocumento.text) then
          begin
               if FazQuery( qryEscolhePessoa, 'SELECT PESSOA.IDPESSOA , PESSOA.NOME, PESSOA.RAZAOSOCIAL ,'+
                          'PESSOA.NUMDOCUMENTO FROM PESSOA WHERE (PESSOA.IDPESSOA <> '+qryIDPESSOA.AsString+
                          ') and (PESSOA.NUMDOCUMENTO = '''+dbedDocumento.text+''') ') then
               begin
                    Application.CreateForm(TfrmEscolhePessoa, frmEscolhePessoa);

                    JaExiste := true;
                    MsgDlg('Este '+lblDocumento.Caption+' já existe no cadastro', Caption, mtWarning , [mbOk], 0);
                    frmEscolhePessoa.sNomeCodigo := lblDocumento.Caption;
                    frmEscolhePessoa.dbgEscolhe.DataSource := dsEscolhePessoa;
                    if frmEscolhePessoa.ShowModal = mrOK then
                    begin
                         bbtnCancelarClick(Self);
                         Pessoa.ChangePessoa( qryEscolhePessoaIDPESSOA.AsInteger);
                         sbtnAlterarClick(Self);
                    end
                    else
                    begin
                         if not(Sistema.DuplicaDocPessoa) then
                         begin
                           MsgDlg('Não é permitido a duplicidade de número de documento no cadastro de Pessoa.', Caption, mtWarning , [mbOk], 0);
                           bbtnCancelarClick(Self);
                         end;
                    end;
               end;
               //Atualiza a tabela de Documentos
               if CmeCadastro.Operacao in [opInserir,opAlterar] then
               with qryDocumento do
               begin
                    tempItem := lstDocumentos.Selected;
                    lstDocumentos.Selected := lstDocumentos.FindData(0, TObject(Pessoa.IdDocChave), true,false);
                    Edit;
                    FieldByname('NUMDOCUMENTO').AsString := dbedDocumento.text;
                    edDocNumDocumentoExit(Self);
                    lstDocumentos.Selected := tempItem;
               end;
          end
          else
          begin
               if CmeCadastro.Operacao in [opInserir,opAlterar] then
               begin
                    MsgDlg('Preencha o campo '+lblDocumento.Caption+' corretamente', Caption, mtError , [mbOk,mbHelp], 0);
                    qryNUMDOCUMENTO.clear ;
                    if dbedDocumento.CanFocus then dbedDocumento.setfocus;
               end;
          end;
     end;
     inherited;
end;

procedure TfrmPessoa.AtuDocumentos;
var li : TListItem;
begin
     with qryDocumento do
     begin
          lstDocumentos.Onchange := nil;
          lstDocumentos.Items.clear;
          First;
          while not(EOF) do
          begin
               li := lstDocumentos.Items.Add;
               li.Caption := FieldByName('NOMEDOCUMENTO').AsString;
               li.Data := TObject(FieldByName('IDDOCUMENTO').AsInteger);
               if FieldByName('IDIMAGEM').IsNull then
               begin
                    li.ImageIndex := 0;
               end
               else
               begin
                    li.ImageIndex := 1;
               end;
               FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
               edDocNumDocumento.SelectAll;
               li.SubItems.Add(edDocNumDocumento.SelText);
               edDocNumDocumento.ClearSelection;
               next;
          end;
          if recordcount > 1 then
          begin
               lstDocumentos.OnChange := lstDocumentosChange;
               lstDocumentos.Items[0].Selected := true;
               lstDocumentos.Items[0].Focused := true;
          end;
     end;
end;


procedure TfrmPessoa.pnlItemsDocResize(Sender: TObject);
begin
     inherited;
     with pnlItemsDoc do
     begin
          Height := tbsDocumento.Height;
          left := lstDocumentos.Width+1;
          Top := 0;
     end;
end;

procedure TfrmPessoa.lstDocumentosChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
   inherited;
   if Item.Selected then  MudaDocumento;
end;


procedure TfrmPessoa.dbcmbEstadoDocChange(Sender: TObject);
begin
//Darivaldo Alencar SIG 22093 -inicio
//   inherited;
//
//   with qryDocumento do
//      if not(State in [dsInactive,dsBrowse]) then
//         FieldByname('IDPAIS').AsFloat := qryEstadoIDPAIS.AsFloat;
//Darivaldo Alencar SIG 22093 -fim
end;



procedure TfrmPessoa.dsStateChange(Sender: TObject);
begin
   inherited;

   if qry.State in [dsInsert, dsEdit] then
   begin
      dsDocumento.AutoEdit := true;
      sbtnFisJur.Enabled   := false;
   end
   else
   begin
      dsDocumento.AutoEdit := false;
      sbtnFisJur.Enabled   := true;
   end;

   sbtnFisJur.Enabled      := qry.isEmpty;


   AutorizarForm(afSoDesabilitar);
end;



procedure TfrmPessoa.edDocNumDocumentoExit(Sender: TObject);
begin
  inherited;
     if lstDocumentos.Selected <> nil then
     begin
          edDocNumDocumento.SelectAll;
          lstDocumentos.Selected.SubItems[0] := edDocNumDocumento.SelText;
          edDocNumDocumento.ClearSelection;
     end;
end;

procedure TfrmPessoa.AtuTipo;
begin
     inherited;
     if CmeCadastro.Operacao <> opInserir then
     begin
          if (Pessoa.TipoPessoa = tpOpcional)  then
          begin
               if not(qry.IsEmpty) then
                  if qryTIPO.AsString = 'F' then
                     Pessoa.EJuridica := false
                  else
                      Pessoa.EJuridica := true;
               MudaTipo;
          end;
          InsereDocumento;
          AtuDocumentos;
     end;
end;


procedure TfrmPessoa.RamalCheck;
begin
     with qryRamal do
     begin
          if (FieldByName('IDCONTATO').IsNull) or
             (FieldByName('IDTELEFONE').IsNull) then
             Cancel
          else
              try
                 Post;
              except end;
          dbgContatoRamal.Invalidate ;
          dbgTelefoneRamal.Invalidate ;
     end;
end;
procedure TfrmPessoa.btnAssociarimgPessoaClick(Sender: TObject);
begin
  inherited;
  AssociaImagem(dsImagem, TBlobField(qryImagemIMAGEM), TFloatField(qryIDIMAGEM), 'Foto');
  Autorizacao.CarregarImagem(TBlobField(qryImagemIMAGEM), imgPessoa1);   //edilaine WO41032
end;

procedure TfrmPessoa.lstDocumentosDblClick(Sender: TObject);
begin
  inherited;
  MostraDocumento;
end;

procedure TfrmPessoa.MostraDocumento;
begin
     lstDocumentosChange(self, lstDocumentos.Selected, ctState);
     //MudaDocumento;
     if CmeCadastro.Operacao in [opInserir,opAlterar] then qryDocumento.Edit;
     AssociaImagem(dsImagensDoc, TBlobField(qryImagensDocIMAGEM), TFloatField(qryDocumentoIDIMAGEM), lstDocumentos.Selected.Caption );
     if CmeCadastro.Operacao in [opInserir,opAlterar] then qryDocumento.Post;
     if qryDocumentoIDIMAGEM.IsNull then
     begin
        lstDocumentos.Selected.ImageIndex := 0;
        if (qryDocumentoNUMDOCUMENTO.AsString = 'Não informado') and
           (CmeCadastro.Operacao in [opInserir,opAlterar]) then
        begin
             qryDocumento.Edit;
             qryDocumentoNUMDOCUMENTO.Clear;
             qryDocumento.Post;
        end;
     end
     else
     begin
          lstDocumentos.Selected.ImageIndex := 1;
          if (TRIM(qryDocumentoNUMDOCUMENTO.AsString) = '') and
             (CmeCadastro.Operacao in [opInserir,opAlterar]) then
          begin
               qryDocumento.Edit;
               if TRIM(qryDocumentoMASCARA.AsString) = '' then
                  qryDocumentoNUMDOCUMENTO.AsString := 'Não informado'
               else
                  qryDocumentoNUMDOCUMENTO.AsString := '0';
               qryDocumento.Post;
          end;
      end;
      lstDocumentos.Selected.SubItems[0] := qryDocumentoNUMDOCUMENTO.AsString;
end;



procedure TfrmPessoa.btnLimpaImgPessoaClick(Sender: TObject);
begin
   inherited;

   if not(qryImagem.EOF) and (MsgDlg('Deseja desassociar a imagem?', 'Confirmar', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
   begin
      Repaint;
      qryImagem.Delete;
      qryIDIMAGEM.Clear;
   end;

   Repaint;
end;



procedure TfrmPessoa.InsereDocumento;
begin
     if (qry.State <> dsInactive) then
     begin
     qryTipoDoc.First;
     while not qryTipoDoc.EOF do
     with qryDocumento do
     begin
         if not qryDocumento.Locate('IDDOCUMENTO',qryTipoDocIDDOCUMENTO.AsFloat,[]) then
         begin
            Insert;
            qryDocumentoIDDOCUMENTO.AsFloat    := qryTipoDocIDDOCUMENTO.AsFloat;
            qryDocumentoNOMEDOCUMENTO.AsString := qryTipoDocNOMEDOCUMENTO.AsString;
            qryDocumentoMASCARA.AsString       := qryTipoDocMASCARA.AsString;
            qryDocumentoOBRIGAUF.AsString      := qryTipoDocOBRIGAUF.AsString;
            qryDocumentoOBRIGAORGAO.AsString   := qryTipoDocOBRIGAORGAO.AsString;
            qryDocumentoOBRIGAEMISSAO.AsString := qryTipoDocOBRIGAEMISSAO.AsString;
            qryDocumentoIDPESSOA.AsFloat       := qryIDPESSOA.AsFloat;
            qryDocumentoFLGOBRIGAVALIDADE.AsString := qryTipoDocFLGOBRIGAVALIDADE.AsString;
            qryDocumentoOBRIGACATG.AsString   := qryTipoDocOBRIGACATG.AsString;
            qryDocumentoOBRIGAPRMHAB.AsString := qryTipoDocOBRIGAPRMHAB.AsString;

            // Início - Darivaldo Alencar - SIG 22093
            qryDocumento.FieldByName('EXIBEUF').AsString           := qryTipoDoc.FieldByName('EXIBEUF').AsString;
            qryDocumento.FieldByName('EXIBEORGAO').AsString        := qryTipoDoc.FieldByName('EXIBEORGAO').AsString;
            qryDocumento.FieldByName('EXIBEEMISSAO').AsString      := qryTipoDoc.FieldByName('EXIBEEMISSAO').AsString;
            qryDocumento.FieldByName('EXIBEVALIDADE').AsString     := qryTipoDoc.FieldByName('EXIBEVALIDADE').AsString;
            qryDocumento.FieldByName('EXIBEPRMHAB').AsString       := qryTipoDoc.FieldByName('EXIBEPRMHAB').AsString;
            qryDocumento.FieldByName('EXIBECATG').AsString         := qryTipoDoc.FieldByName('EXIBECATG').AsString;
            qryDocumento.FieldByName('EXIBEPAIS').AsString         := qryTipoDoc.FieldByName('EXIBEPAIS').AsString;
            qryDocumento.FieldByName('OBRIGAPAIS').AsString        := qryTipoDoc.FieldByName('OBRIGAPAIS').AsString;
            qryDocumento.FieldByName('FLGMULTIPLAMASCARA').AsString:= qryTipoDoc.FieldByName('FLGMULTIPLAMASCARA').AsString;
            // Término - Darivaldo Alencar - SIG 22093
            Post;
         end;  
         qryTipoDoc.next;
      end;
   end;
end;


procedure TfrmPessoa.dsDocumentoStateChange(Sender: TObject);
begin
  inherited;
  if (dsDocumento.State = dsEdit) and (not(CmeCadastro.Operacao in [opInserir,opAlterar])) then
  begin
       qryDocumento.Cancel;
       if lstDocumentos.CanFocus then
          lstDocumentos.SetFocus;
  end;
end;

procedure TfrmPessoa.AssociaImagem(ds : TwwDataSource; pImagem : TBlobField; Campo : TFloatField; Descricao : string);
var frmImgDoc : TfrmImagemDoc;
begin
     try
        Application.CreateForm(tfrmImagemDoc, frmImgDoc);
        with frmImgDoc do
        begin
             dsImagem := ds;
             Imagem   := pImagem;
             CampoPai := Campo;

             bbtnAssociar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
             bbtnLimpar.Enabled := (CmeCadastro.Operacao in [opInserir,opAlterar]);
             Caption := Descricao;
             ShowModal;
        end;
     finally
          frmImgDoc.free;
     end;
end;

procedure TfrmPessoa.MudaDocumento;
var
  sMask : String;
begin
     with qryDocumento do
     begin
          if Active then
          begin
               Locate('IDDOCUMENTO', Integer(lstDocumentos.Selected.Data),[]);
               qryImagensDoc.Locate('IDIMAGEM', FieldByName('IDIMAGEM').AsFloat,[]);
               FieldByName('NUMDOCUMENTO').EditMask := Pessoa.MaskField(FieldByName('MASCARA').AsString);
                //Darivaldo Alencar SIG 22093 -inicio
                //               pnlEmissao.Visible := (FieldByName('OBRIGAEMISSAO').AsString = 'S') ;
                //               pnlUF.Visible := (FieldByName('OBRIGAUF').AsString = 'S');
                //               pnlOrgao.Visible := (FieldByName('OBRIGAORGAO').AsString = 'S');
                //               PnlValidade.Visible := (FieldByName('FLGOBRIGAVALIDADE').AsString = 'S');
                //               //Higor Nayde Nº SOL250389/17574 NºPPM992385
                //               pnlCategoria.VIsible := (FieldByName('OBRIGACATG').AsString = 'S');
                //               pnlDataHabilitacao.VIsible := (FieldByName('OBRIGAPRMHAB').AsString = 'S');
                //               //Higor Nayde Nº SOL250389/17574 NºPPM992385
                //               //Thaise - Os campos só podem ser travados e pintados se a flag mostrar que o cadastro
                //               //tem que ser travado, e somente campos especificados na RM
                 pnlEmissao.Visible         := (FieldByName('EXIBEEMISSAO').AsString = 'S') ;
                 pnlUF.Visible              := (FieldByName('EXIBEUF').AsString = 'S');
                 pnlOrgao.Visible           := (FieldByName('EXIBEORGAO').AsString = 'S');
                 PnlValidade.Visible        := (FieldByName('EXIBEVALIDADE').AsString = 'S');
                 pnlCategoria.VIsible       := (FieldByName('EXIBECATG').AsString = 'S');
                 pnlDataHabilitacao.VIsible := (FieldByName('EXIBEPRMHAB').AsString = 'S');
                 pnlPais.VIsible            := (FieldByName('EXIBEPAIS').AsString = 'S');
                 //Darivaldo Alencar SIG 22093 -fim

               pnlTipoDocumento.Visible := (FieldByName('FLGMULTIPLAMASCARA').AsString = 'S');
               if (FieldByName('FLGMULTIPLAMASCARA'). AsString = 'S') then
               begin
                   if (FieldByName('IDTIPODOCPESSOAXMASC').asString <> EmptyStr) then
                   begin
                   qryTipoDocumento.Locate('IDTIPODOCPESSOAXMASC',FieldByName('IDTIPODOCPESSOAXMASC').asString,[]);
                   dbcmbTipoDocumento.text := qryTipoDocumento.FieldByName('Nome').asString;
                   if ((FieldByName('IDTIPODOCPESSOAXMASC').asString) <> EmptyStr ) then
                      sMask := SelMascara(FieldByName('IDDOCUMENTO').asString,FieldByName('IDTIPODOCPESSOAXMASC').asString);
                   SelMascara(FieldByName('IDDOCUMENTO').AsString,EmptyStr);
                   end
                   else
                   begin
                     dbcmbTipoDocumento.LookupValue := ' ';
                     dbcmbTipoDocumento.text := ' ';
                   end;
               end;

               if bTtravarCadastro then
               begin
                 if  (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Identidade') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cart. Indentidade Profissional') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Trabalho') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cert Milit -Serie/CSM/RMDN/Cat') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cert Militar - Tipo/Numero') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'CPF') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'CRC') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Dt. Instr. Part. Contratual') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Matricula Caixa') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Matricula Funcef') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'MIBA') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'NUMERO DO AVISO DE RECEBIMENTO') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'PIS/PASEP') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Registro de Aposentadoria') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Titulo de Eleitor - Numero') or
                     (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Titulo de Eleitor - Zona/Secao') then
                 begin
                   edDocNumDocumento.Enabled:= False;
                   PintarCampos([edDocNumDocumento], clGray);

                   if  qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Identidade' then
                   begin
                     wwDBEdit1.Enabled:= False;
                     dbcmbEstadoDoc.Enabled:= False;
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2], clGray);
                   end;

                   if  qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Cart. Indentidade Profissional' then
                   begin
                     wwDBEdit1.Enabled:= False;
                     dbcmbEstadoDoc.Enabled:= False;
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2], clGray);
                   end;

                   if qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'Carteira de Trabalho' then
                   begin
                     dbcmbEstadoDoc.Enabled:= False;
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([dbcmbEstadoDoc, CMDateTimePicker2], clGray);
                   end;

                   if (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'NUMERO DO AVISO DE RECEBIMENTO') or
                      (qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring = 'PIS/PASEP') then
                   begin
                     CMDateTimePicker2.Enabled:= False;
                     PintarCampos([CMDateTimePicker2], clGray);
                   end;
                 end
                 else
                 begin
                   edDocNumDocumento.Enabled:= true;
                   wwDBEdit1.Enabled:= True;
                   dbcmbEstadoDoc.Enabled:= True;
                   CMDateTimePicker2.Enabled:= True;
                   PintarCampos([edDocNumDocumento, wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2], clWindow);
                 end;
               end;
          end;
     end;
end;

procedure TfrmPessoa.qryNOMEChange(Sender: TField);
begin
  inherited;
  if not Pessoa.EJuridica then
     qryRazaoSocial.AsString := qryNome.AsString;
end;

procedure TfrmPessoa.dsImagemDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Pessoa.MostraFoto then
  begin
     imgPessoa.Left := 0;
     imgPessoa.Top := 0;

     if (Field = nil) then
        if qryImagemIMAGEM.IsNull then
        begin
           imgPessoa.Visible := false;
           imgPessoa.Width := 0;
           imgPessoa.Height := 0;
        end
        else
        begin
           imgPessoa.Width := imgPessoa.Picture.Width + 2;
           imgPessoa.Height := imgPessoa.Picture.Height + 2;
           imgPessoa.Visible := true;
        end;
  end;
end;

procedure TfrmPessoa.qryTelefoneCalcFields(DataSet: TDataSet);
begin
     inherited;

     with qryTelefone do
     begin
          if Pos('C', FieldByName('TIPO').AsString) > 0 then
             FieldByName('TComercial').AsString := 'Sim'
          else
             FieldByName('TComercial').AsString := '';

          if Pos('P', FieldByName('TIPO').AsString) > 0 then
             FieldByName('TParticular').AsString := 'Sim'
          else
             FieldByName('TParticular').AsString := '';

          if Pos('F', FieldByName('TIPO').AsString) > 0 then
             FieldByName('TFax').AsString := 'Sim'
          else
             FieldByName('TFax').AsString := '';

          if Pos('L', FieldByName('TIPO').AsString) > 0 then
             FieldByName('TCelular').AsString := 'Sim'
          else
             FieldByName('TCelular').AsString := '';

          if Pos('R', FieldByName('TIPO').AsString) > 0 then
             FieldByName('TRecado').AsString := 'Sim'
          else
             FieldByName('TRecado').AsString := '';
     end;

end;

procedure TfrmPessoa.dbgTelefoneRamalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
     Ramal(2);
  if Key = VK_INSERT then
     Ramal(0);
  if Key = VK_F2 then
     Ramal(1);
end;

procedure TfrmPessoa.Ramal(Alteracao:integer);
begin
  try
     RamalCheck;
     case Alteracao of
          0 : qryRamal.Append;
          1 : qryRamal.Edit;
          2 : qryRamal.Delete;
     end;
  except end;
end;

procedure TfrmPessoa.qryRamalUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  inherited;
  if EDBEngineError(E).Errors[0].ErrorCode = 9732 then // Campo nulo
     UpdateAction := uaSkip;
end;

procedure TfrmPessoa.dbgContatoRamalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
     Ramal(2);
  if Key = VK_INSERT then
     Ramal(0);
  if Key = VK_F2 then
     Ramal(1);
end;

procedure TfrmPessoa.dsTelefoneDataChange(Sender: TObject; Field: TField);
var
   i : integer;
   sTipo : string;
begin
     inherited;
     if (Field = nil) or (Field = qryTelefoneTIPO) then
     begin
          // Atualiza os campos de tipo de telefone
          for i := 0 to chkTipoTelefone.Items.Count-1 do
              chkTipoTelefone.State[i] := cbUnChecked;

          sTipo := TRIM(qryTelefoneTIPO.AsString);
          for i := 1 to LENGTH(sTipo) do begin
              if 'C' = Copy(sTipo,i,1) then
                 chkTipoTelefone.State[0] := cbChecked;
              if 'P' = Copy(sTipo,i,1) then
                 chkTipoTelefone.State[1] := cbChecked;
              if 'F' = Copy(sTipo,i,1) then
                 chkTipoTelefone.State[2] := cbChecked;
              if 'L' = Copy(sTipo,i,1) then
                 chkTipoTelefone.State[3] := cbChecked;
              if 'R' = Copy(sTipo,i,1) then
                 chkTipoTelefone.State[4] := cbChecked;
          end;
     end;
end;

procedure TfrmPessoa.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  MSGrupo.Executar;
  if (MSGrupo.RetornouValor) and
     (CmeCadastro.Operacao in [opInserir, opAlterar]) then
  begin
     qryIDGRUPO.AsFloat := StrToIntDef(MSGrupo.ValoresChave[0],0);
     qryNOMEGRUPO.AsString := MSGrupo.ValoresChave[1];
  end;
end;

procedure TfrmPessoa.edDBGrupoChange(Sender: TObject);
begin
  inherited;
  eddbgrupo.selectall;
end;

procedure TfrmPessoa.edDBGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
  begin
       qryIDGRUPO.Clear;
       qryNOMEGRUPO.Clear;
  end;

end;

procedure TfrmPessoa.edDBGrupoCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
  inherited;
  if eddbGrupo.Text <> qryNOMEGRUPO.AsString then
     eddbGrupo.Text := qryNOMEGRUPO.AsString;
end;

procedure TfrmPessoa.dsCidadeDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = nil then
     if qryEstadoMASCARACPOSTAL.AsString = '' then
        qryEnderecoCEP.EditMask := ''
     else
        qryEnderecoCEP.EditMask := qryEstadoMASCARACPOSTAL.AsString+';0; '; 
end;

procedure TfrmPessoa.qryEnderecoIDCIDADESChange(Sender: TField);
begin
  inherited;
     qryEnderecoNOMECIDADE.AsString := qryCidadeNOMECIDADE.AsString;
     qryEnderecoNOMEESTADO.AsString := qryCidadeNOMEESTADO.AsString;
     qryEnderecoNOMEPAIS.AsString   := qryCidadeNOMEPAIS.AsString;
end;

procedure TfrmPessoa.dsEnderecoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field = nil then
  begin
       if (qryEnderecoIdEndereco.IsNull) then
       begin
            chkTipoEndereco.Checked[0] := false;
            chkTipoEndereco.Checked[1] := false;
            chkTipoEndereco.Checked[2] := false;
            chkTipoEndereco.Checked[3] := false;
            chkTipoEndereco.Checked[4] := false;
       end
       else
       begin
            chkTipoEndereco.Checked[0] := (qryIdEndComercial.AsFloat = qryEnderecoIdEndereco.AsFloat);
            chkTipoEndereco.Checked[1] := (qryIdEndResidencial.AsFloat = qryEnderecoIdEndereco.AsFloat);
            chkTipoEndereco.Checked[2] := (qryIdEndEntrega.AsFloat = qryEnderecoIdEndereco.AsFloat) ;
            chkTipoEndereco.Checked[3] := (qryIdEndCobranca.AsFloat = qryEnderecoIdEndereco.AsFloat);
            chkTipoEndereco.Checked[4] := (qryIdEndCorresp.AsFloat = qryEnderecoIdEndereco.AsFloat);
       end;
  end;
end;

procedure TfrmPessoa.chkTipoEnderecoClickCheck(Sender: TObject);
var
Campo : TField;
begin
  inherited;
  Campo := nil;
  case chkTipoEndereco.ItemIndex of
       0 : Campo := qryIdEndComercial;
       1 : Campo := qryIdEndResidencial;
       2 : Campo := qryIdEndEntrega;
       3 : Campo := qryIdEndCobranca;
       4 : Campo := qryIdEndCorresp;
  end;

  if chkTipoEndereco.Checked[chkTipoEndereco.ItemIndex] then
     Campo.AsFloat := qryEnderecoIdEndereco.AsFloat
  else
       Campo.Clear;

end;

procedure TfrmPessoa.qryEnderecoBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (qryIdEndComercial.AsFloat = qryEnderecoIdEndereco.AsFloat) then
      qryIdEndComercial.clear;

  if (qryIdEndResidencial.AsFloat = qryEnderecoIdEndereco.AsFloat) then
      qryIdEndResidencial.clear;

  if (qryIdEndEntrega.AsFloat = qryEnderecoIdEndereco.AsFloat) then
      qryIdEndEntrega.clear;

  if (qryIdEndCobranca.AsFloat = qryEnderecoIdEndereco.AsFloat) then
      qryIdEndCobranca.clear;

  if (qryIdEndCorresp.AsFloat = qryEnderecoIdEndereco.AsFloat) then
      qryIdEndCorresp.clear;
end;

procedure TfrmPessoa.PnlAssociaFoto_PadraoResize(Sender: TObject);
begin
  inherited;
  btnAssociarimgPessoa.Left :=
                      Round(((PnlAssociaFoto_Padrao.Width - btnAssociarimgPessoa.Width)/2) + 4);
end;

procedure TfrmPessoa.CmeCadastroFind(Sender: TObject);
begin
   inherited;

   if MontaSelect.RetornouValor then
   begin
      Pessoa.ChangePessoa(StrToIntDef(MontaSelect.ValoresChave[0],0));
      Autorizacao.CarregarImagem(TBlobField(qryImagemIMAGEM), imgPessoa1);   //edilaine WO41032
   end;
end;



procedure TfrmPessoa.CmeCadastroInsert(Sender: TObject);
begin
   Pessoa.ChangePessoa(0);
   HabilitarCampos; 
   inherited;

   JaExiste := false;

   qryIDPESSOA.AsFloat := LeUltRegistro(nil, 'PESSOA');

   if Pessoa.EJuridica then
      qryTIPO.AsString := 'J'
   else
      qryTIPO.AsString := 'F';

   if (Pessoa.SaveModuloRespon) and (Sistema.ViculaModuloxPessoa) then
     qryIDMODULORESPON.AsFloat := Sistema.IdModulo;

   if dbedDocumento.CanFocus then dbedDocumento.SetFocus;

   qrySubTipo.Insert;
   qrySubTipo.FieldByName(Pessoa.NomeCampoId).AsFloat := qryIDPESSOA.AsFloat;

   if not(Pessoa.EJuridica) then
   begin
      qryPessoaFisica.Insert;
      qryPessoaFisicaIDPESSOA.AsFloat := qryIDPESSOA.AsFloat;
   end;

   InsereDocumento;

   AtuDocumentos;
   HabilitarCampos;
end;



procedure TfrmPessoa.CmeCadastroEdit(Sender: TObject);
begin
  JaExiste := true;

  inherited;

  if dbedDocumento.CanFocus then
     dbedDocumento.setfocus;

  if qrySubTipo.RecordCount = 1 then
  begin
       qrySubTipo.Edit;
       if Pessoa.TipoPessoa = tpOpcional then
          if Pessoa.EJuridica then
             qryTIPO.AsString := 'J'
          else
              qryTIPO.AsString := 'F';

  end
  else
  begin
       qrySubTipo.Insert;
       qrySubTipo.FieldByName(Pessoa.NomeCampoId).AsFloat := qryIDPESSOA.AsFloat;
  end;

  //Atualiza o Módulo Responsável Pela Manutenção do Pessoa
  if Pessoa.SaveModuloRespon and Sistema.ViculaModuloxPessoa then
     qryIDMODULORESPON.AsFloat := Sistema.IdModulo;

  if not Pessoa.EJuridica then
  begin
       if qryPessoaFisica.RecordCount = 1 then
          qryPessoaFisica.Edit

       else
       begin
            qryPessoaFisica.Insert;
            qryPessoaFisicaIDPESSOA.AsFloat := qryIDPESSOA.AsFloat;
       end;
  end;

  //Thaise - bTtravaCadastro para indicar se terá que travar ou não os campos.
  bTtravarCadastro:= False;

  //Thaise
  //Verificando se a alteração tem que ser travada atendendo 2 premissas:
  //se o módulo <> Folha de Pagamento
  //Se a pessoa possui vinculo empregatício com a Funcef
  if TravaAlteracao(qry.FieldByName('IDPESSOA').AsInteger) then
  begin
    bTtravarCadastro:= True;
    dbedDocumento.Enabled:= False;
    dbedNomeFantasia.Enabled:= False;
    dbedemail.Enabled:= False;
    DbeHomePage_Padrao.Enabled:= False;
    lblMsg.Visible:= True;
    lblMsg.Caption:= '* Os Campos bloqueados só podem ser'#13#10 +
                     'alterados no módulo Folha de Pagamento';

    wwDBEdit1.Enabled:= False;
    dbcmbEstadoDoc.Enabled:= False;
    CMDateTimePicker2.Enabled:= False;
    edDocNumDocumento.Enabled:= False;

    PintarCampos([wwDBEdit1, dbcmbEstadoDoc, CMDateTimePicker2, edDocNumDocumento], clGray);

    //Obtendo o ID do telefone, Endereço e Contato que já está salvo no cadastro;
    //Ficará salvo na lista para fixar os registros filhos que já existem na tabela e já estão comitados;
    lTelefone:= '';
    qryTelefone.First;
    while not qryTelefone.Eof do
    begin
      lTelefone:= lTelefone + ' ' + qryTelefone.FieldByName('IDTELEFONE').AsString;
      qryTelefone.Next;
    end;

    lEndereco:= '';
    qryEndereco.First;
    while not qryEndereco.Eof do
    begin
      lEndereco:= lEndereco + ' ' + qryEndereco.FieldByName('IDENDERECO').AsString;
      qryEndereco.Next;
    end;

    lContato:= '';
    qryContato.First;
    while not qryContato.Eof do
    begin
      lContato:= lContato + ' ' + qryContato.FieldByName('IDCONTATO').AsString;
      qryContato.Next;
    end;

    //Thaise - Pintar os campos em seguida, para indicar
    //que os campos bloqueados e pintados não podem ser alterados
    PintarCampos([dbedContatoNome, dbedcontatoemail, DBEdit2, DBEdit3, DBMemo1,
                  GroupBox6, dbgContatoRamal, dblcTelefone, GroupBox5, dbgTelefoneRamal,
                  chkTipoTelefone, GroupBox4, DBEDDDI, DBEDDDD, DBEDNUMERO, dbedNomeEndereco,
                  dbedLogradouro, DBEDCOMPLEMENTO, cmbCidade, DBNUMERO, dbedCEP,
                  dbedPais, chkTipoEndereco, grpTipoEnd, dbedDocumento, dbedNomeFantasia,
                  dbedemail, DbeHomePage_Padrao], clGray);

  end;

end;

procedure TfrmPessoa.CmeCadastroConfirma(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
     CmeDetalhe.Confirma(Self);
     FazerVoltarDet;
     case Grava(False) of
       0 : Pessoa.SaveSubtipo(self);
       1 : MsgDlg('Não foi possivel atualizar os dados', Caption, mtError , [mbOk,mbHelp], 0);
     end;
  finally
     FazerVoltarDet;

     if dbedDocumento.CanFocus then dbedDocumento.SetFocus;
     Screen.Cursor := crDefault;
     CmeCadastro.AtualizaBotoes(Self);
  end;
  HabilitarCampos;
end;



procedure TfrmPessoa.CmeCadastroDelete(Sender: TObject);
begin
  try
     if (not qrySubTipo.IsEmpty) then qrySubTipo.Delete;

     Grava(True);

     Pessoa.ChangePessoa(0);
  except
     Raise;
  end;
end;



procedure TfrmPessoa.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;

   btnAssociarimgPessoa.Enabled := (CmeCadastro.Operacao in [opInserir, opAlterar]);

   if Pessoa.TipoPessoa = tpOpcional then
   begin
      sbtnFisJur.Enabled := not(CmeCadastro.Operacao in [opInserir, opAlterar, opProcurar]);
   end;
end;



procedure TfrmPessoa.CmeCadastroCancel(Sender: TObject);
begin
   inherited;
   edDocNumDocumentoExit(Self);
   HabilitarCampos;
   Autorizacao.CarregarImagem(TBlobField(qryImagemIMAGEM), imgPessoa1);   //edilaine WO41032
end;



procedure TfrmPessoa.CmeCadastroBeforeConfirma(sender: TObject; var Accept: Boolean);
begin
  inherited;
  // início - andre tavares - pendência 18016 - 15/02/2004
  {
  qryTipoDocOficial.Close;
  qryTipoDocOficial.Open;
  qryDocumento.DisableControls;
  qryDocumento.first;
  while not qryDocumento.eof do
  begin
    qryTipoDocOficial.Locate('IDDOCUMENTO', qryDocumento.FieldByname('IDDOCUMENTO').asInteger, [locaseinsensitive]);
    if (trim(qryTipoDocOficial.fieldByName('SIGLADOCUMENTO').asString) = 'CNPJ:') or
       (trim(qryTipoDocOficial.fieldByName('SIGLADOCUMENTO').asString) = 'CGC:') or
       (trim(qryTipoDocOficial.fieldByName('SIGLADOCUMENTO').asString) = 'CPF:') then
         qry.fieldbyName('NUMDOCUMENTO').asString := qryDocumento.FieldByname('NUMDOCUMENTO').AsString;
    qryDocumento.Next;
  end;
  qryDocumento.EnableControls;
  }
  // fim - andre tavares - pendência 18016 - 15/02/2004

  if qryNOME.AsString = '' then
  begin
       MsgDlg('Nome não pode estar em branco', Caption, mtError , [mbOk], 0);
       Accept := false;
  end
  else
   //andré tavares - pendência 22551 - 26/08/2006
   //if Sistema.ObrigaDocPessoa and Pessoa.ObrigaDocumento and qryNUMDOCUMENTO.IsNull then
   If (Sistema.ObrigaDocPessoa) And Pessoa.ObrigaDocumento And ((qryNUMDOCUMENTO.IsNull ) OR (qryNUMDOCUMENTO.AsString = '')) Then
    begin
       MsgDlg('É Obrigatória a indicação do ' + lblDocumento.Caption, Caption, mtError , [mbOk], 0);
       Accept := false;
    end
    else
        Accept := true;
end;

procedure TfrmPessoa.PessoaChangePessoa(IdPessoa: Integer);
// -------------------------------------------------------------------------------------------------
   procedure MudaQry(pqry:TwwQuery);
   begin
      with pqry do
      begin
         if (pqry.Active) and (pqry.CachedUpdates) then
            CancelUpdates;
         ParamByName('IdPessoa').AsFloat := IdPessoa;
         Close;
         Open;
      end;
   end;
// -------------------------------------------------------------------------------------------------
begin
   MudaQry(qry);
   MudaQry(qrySubTipo);
   MudaQry(qryImagem);
   MudaQry(qryImagensDoc);
   MudaQry(qryPessoaFisica);
   MudaQry(qryDocumento);
   MudaQry(qryEndereco);
   MudaQry(qryTelefone);
   MudaQry(qryContato);
   MudaQry(qryRamal);
   Pessoa.ChangeSubtipo(IdPessoa);

   AtuTipo;

   tbcDetalheChange(tbcDetalhe);
end;



procedure TfrmPessoa.CmeDetalheInsert(Sender: TObject);
begin
  inherited;

  if pgCtrlDetalhe.ActivePage = tbsDet then
  begin //Endereços
     qryEnderecoIDPESSOA.AsFloat := qryIDPESSOA.AsFloat;

     qryEnderecoIDENDERECO.AsFloat := LeUltRegistro(nil, 'ENDPESS');
     qryEnderecoNOMEESTADO.AsString := '';
     qryEnderecoNOMEPAIS.AsString := '';

     if dbedNomeEndereco.CanFocus then
        dbedNomeEndereco.SetFocus ;

  end
  else if pgCtrlDetalhe.ActivePage = tbsTelefone then
   begin //Telefones
             //edilaine - SIG33979 - inicio
             if not bObrigaVinculoTelxEnd then
                qryTelefoneIDENDERECO.AsFloat := -1
             else
                qryTelefoneIDENDERECO.AsFloat := qryEnderecoIDENDERECO.AsFloat;
             //edilaine - SIG33979 - fim
             qryTelefoneIDTELEFONE.AsFloat := LeUltRegistro(nil, 'TELENDPESS');
             qryRamal.Filter := 'IDTELEFONE = '''+FloatToStr(qryTelefoneIDTELEFONE.AsFloat)+'''';
             chkTipoTelefone.State[0] := cbChecked;
             qryTelefoneTIPO.AsString := 'C';
             if dbedNumero.CanFocus then
                dbedNumero.SetFocus ;
       end

  else if pgCtrlDetalhe.ActivePage = tbsContato then
  begin //Contatos
             qryContatoIDENDERECO.AsFloat := qryEnderecoIDENDERECO.AsFloat;
             qryContatoIDCONTATO.AsFloat := LeUltRegistro(nil, 'CONTATOPESS');
             qryRamal.Filter := 'IDCONTATO = '''+FloatToStr(qryContatoIDCONTATO.AsFloat)+'''';
             if dbedContatoNome.CanFocus then
                dbedContatoNome.SetFocus ;
       end;
end;



procedure TfrmPessoa.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  if pgCtrlDetalhe.ActivePage = tbsDet then
    if dbedNomeEndereco.CanFocus then
       dbedNomeEndereco.SetFocus
  else
  if pgCtrlDetalhe.ActivePage = tbsTelefone then
  begin
      qryRamal.Filter := 'IDTELEFONE = '''+FloatToStr(qryTelefoneIDTELEFONE.AsFloat)+'''';
      if dbedNumero.CanFocus then
         dbedNumero.SetFocus;
  end
  else
  if pgCtrlDetalhe.ActivePage = tbsContato then
  begin
      qryRamal.Filter := 'IDCONTATO = '''+FloatToStr(qryContatoIDCONTATO.AsFloat)+'''';
      if dbedCOntatoNome.CanFocus then
         dbedCOntatoNome.SetFocus ;
  end;
end;



procedure TfrmPessoa.CmeDetalheConfirma(Sender: TObject);
var
   lInh : boolean;
begin
   lInh := true;

   if (pgCtrlDetalhe.ActivePage = tbsDet) then
   begin
      if (not qryEndereco.isEmpty) and (qryEnderecoNOME.AsString = '') then     //edilaine - 33979
      begin
         MsgDlg('Digite um nome que identifique o endereço', Caption, mtWarning , [mbOk], 0);
         Repaint;

         if dbedNomeEndereco.CanFocus then dbedNomeEndereco.SetFocus;
         lInh := false;
      end;

      if (not qryEndereco.isEmpty) and (qryEnderecoIDCIDADES.IsNull) then       //edilaine - 33979
      begin
         MsgDlg('Escolha a cidade onde está localizado este endereço', Caption, mtWarning , [mbOk], 0);
         Repaint;

         if cmbCidade.CanFocus then cmbCidade.SetFocus;

         lInh := false;
      end;
   end;

  if lInh then inherited;
end;



procedure TfrmPessoa.sbtnAlterarClick(Sender: TObject);
begin
   if not(qryIDMODULORESPON.IsNull) and (Sistema.ViculaModuloxPessoa) and (qryIDMODULORESPON.AsFloat <> Sistema.IdModulo) then
   begin
      MsgDlg('Este registro só pode ser alterado no Sistema: ' + QryNomeModulo.AsString, 'Atenção', mtInformation, [mbOk], 0);
      Repaint;
   end
   else
   begin
      inherited;
   end;
end;



procedure TfrmPessoa.sbtnApagarClick(Sender: TObject);
begin
  if (not qryIDMODULORESPON.IsNull) and
     (Sistema.ViculaModuloxPessoa) and
     (qryIDMODULORESPON.AsFloat <> Sistema.IdModulo) then
    MsgDlg('Este registro só pode ser alterado no Sistema: ' + QryNomeModulo.AsString, 'Atenção', mtInformation, [mbOk],0)
  else
    inherited;
end;

procedure TfrmPessoa.qryEnderecoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (qryEnderecoIdEndereco.IsNull) then
     qryEnderecoTIPOEND_PADRAO.Clear
  else
  begin
     if (qryIdEndComercial.AsFloat = qryEnderecoIdEndereco.AsFloat) then
         qryEnderecoTIPOEND_PADRAO.AsString := 'Comercial';

     if (qryIdEndResidencial.AsFloat = qryEnderecoIdEndereco.AsFloat) then
         qryEnderecoTIPOEND_PADRAO.AsString := 'Residencial';

     if (qryIdEndEntrega.AsFloat = qryEnderecoIdEndereco.AsFloat) then
         qryEnderecoTIPOEND_PADRAO.AsString := 'Entrega';

     if (qryIdEndCobranca.AsFloat = qryEnderecoIdEndereco.AsFloat) then
         qryEnderecoTIPOEND_PADRAO.AsString := 'Cobrança';

     if (qryIdEndCorresp.AsFloat = qryEnderecoIdEndereco.AsFloat) then
         qryEnderecoTIPOEND_PADRAO.AsString := 'Correspondência';
  end;
end;

procedure TfrmPessoa.sbtnProcurarClick(Sender: TObject);
begin
   inherited;

   // André Pontes - pendência 15647 - 12/05/2004
   sbtnFisJur.Enabled := qry.isEmpty;
   // André Pontes - pendência 15647 - 12/05/2004
end;

procedure TfrmPessoa.sbtnAltDetClick(Sender: TObject);
begin
  //Thaise - Caso não possa fazer alterações nos campos, verifico na lista de Telefone, Endereço e Contato
  //se o ID referente na query existe na lista salva. Se existir, não permito alterações.
  if bTtravarCadastro then
  begin
    if pos(qryTelefone.FieldByName('IDTELEFONE').Asstring, lTelefone) > 0 then
    begin
      DBEDDDI.Enabled:= False;
      DBEDDDD.Enabled:= False;
      DBEDNUMERO.Enabled:= False;
      GroupBox4.Enabled:= False;
      GroupBox5.Enabled:= False;

      PintarCampos([GroupBox5, dbgTelefoneRamal, chkTipoTelefone, GroupBox4, DBEDDDI,
                    DBEDDDD, DBEDNUMERO], clGray);
    end
    else
    begin
      DBEDDDI.Enabled:= True;
      DBEDDDD.Enabled:= True;
      DBEDNUMERO.Enabled:= True;
      GroupBox4.Enabled:= True;
      GroupBox5.Enabled:= True;
      PintarCampos([GroupBox5, dbgTelefoneRamal, chkTipoTelefone, GroupBox4, DBEDDDI,
                    DBEDDDD, DBEDNUMERO], clWindow);

    end;

    if pos(qryEndereco.FieldByName('IDENDERECO').AsString, lEndereco) > 0 then
    begin
      dbedNomeEndereco.Enabled:= False;
      dbedLogradouro.Enabled:= False;
      DBNUMERO.Enabled:= False;
      DBEDCOMPLEMENTO.Enabled:= False;
      dbedBairro.Enabled:= False;
      dbedCEP.Enabled:= False;
      cmbCidade.Enabled:= False;
      dbedEstado.Enabled:= False;
      dbedPais.Enabled:= False;
      grpTipoEnd.Enabled:= False;

      PintarCampos([dbedNomeEndereco, dbedBairro, dbedEstado, dbedLogradouro, DBEDCOMPLEMENTO, cmbCidade,
                    DBNUMERO, dbedCEP, dbedPais, chkTipoEndereco, grpTipoEnd, dbedPais], clGray);

    end
    else
    begin
      dbedNomeEndereco.Enabled:= True;
      dbedLogradouro.Enabled:= True;
      DBNUMERO.Enabled:= True;
      DBEDCOMPLEMENTO.Enabled:= True;
      dbedBairro.Enabled:= True;
      dbedCEP.Enabled:= True;
      cmbCidade.Enabled:= True;
      dbedEstado.Enabled:= True;
      dbedPais.Enabled:= True;
      grpTipoEnd.Enabled:= True;
      PintarCampos([dbedNomeEndereco, dbedBairro, dbedEstado, dbedLogradouro, DBEDCOMPLEMENTO, cmbCidade,
                    DBNUMERO, dbedCEP, dbedPais, chkTipoEndereco, grpTipoEnd, dbedPais], clWindow);
    end;

    if pos(qryContato.FieldByName('IDCONTATO').AsString, lContato) > 0 then
    begin
      dbedContatoNome.Enabled:= False;
      GroupBox6.Enabled:= False;
      dbedcontatoemail.Enabled:= False;
      DBDateEdit2.Enabled:= False;
      DBEdit2.Enabled:= False;
      DBMemo1.Enabled:= False;
      DBEdit3.Enabled:= False;
      PintarCampos([dbedContatoNome, dbedcontatoemail, DBEdit2, DBEdit3,
                    DBMemo1, GroupBox6, dbgContatoRamal, dblcTelefone, DBDateEdit2], clGray);
    end
    else
    begin
      dbedContatoNome.Enabled:= True;
      GroupBox6.Enabled:= True;
      dbedcontatoemail.Enabled:= True;
      DBDateEdit2.Enabled:= True;
      DBEdit2.Enabled:= True;
      DBMemo1.Enabled:= True;
      DBEdit3.Enabled:= True;
      PintarCampos([dbedContatoNome, dbedcontatoemail, DBEdit2, DBEdit3,
                    DBMemo1, GroupBox6, dbgContatoRamal, dblcTelefone, DBDateEdit2], clWindow);
    end;
  end;
  inherited;
end;

procedure TfrmPessoa.sbtnInsDetClick(Sender: TObject);
begin
  //Thaise - Ao adicionar um registro novo, não devemos bloquear nenhum campo.
  //Ele poderá ser inserido, excluido e alterado antes da operação ser comitada DEFINITIVAMENTE.
  //Por isso, se o cadastro for inserido, os campos serão destravados e pindados na cor original.
  if bTtravarCadastro then
    DBEDDDI.Enabled:= True;
    DBEDDDD.Enabled:= True;
    DBEDNUMERO.Enabled:= True;
    GroupBox4.Enabled:= True;
    GroupBox5.Enabled:= True;
    dbedNomeEndereco.Enabled:= True;
    dbedLogradouro.Enabled:= True;
    DBNUMERO.Enabled:= True;
    DBEDCOMPLEMENTO.Enabled:= True;
    dbedBairro.Enabled:= True;
    dbedCEP.Enabled:= True;
    cmbCidade.Enabled:= True;
    dbedEstado.Enabled:= True;
    dbedPais.Enabled:= True;
    grpTipoEnd.Enabled:= True;
    dbedContatoNome.Enabled:= True;
    GroupBox6.Enabled:= True;
    dbedcontatoemail.Enabled:= True;
    DBDateEdit2.Enabled:= True;
    DBEdit2.Enabled:= True;
    DBMemo1.Enabled:= True;
    DBEdit3.Enabled:= True;
    PintarCampos([dbedContatoNome, dbedcontatoemail, DBEdit2, DBEdit3, DBMemo1,
                  GroupBox6, dbgContatoRamal, dblcTelefone, GroupBox5, dbgTelefoneRamal,
                  chkTipoTelefone, GroupBox4, DBEDDDI, DBEDDDD, DBEDNUMERO, dbedNomeEndereco,
                  dbedLogradouro, DBEDCOMPLEMENTO, cmbCidade, DBNUMERO, dbedCEP,
                  dbedPais, chkTipoEndereco, grpTipoEnd, dbedBairro, dbedEstado, dbedPais, DBDateEdit2], clWindow);

  inherited;
end;

function TfrmPessoa.PossuiVinculo(sIDPessoa: Integer): Boolean;
begin
  result := false;
  qQueryAux.Close;
  qQueryAux.ParamByName('IDPESSOA').AsInteger:= sIDPessoa;
  qQueryAux.Open;

  if not qQueryAux.IsEmpty then
    result := true;
end;

function TfrmPessoa.TravaAlteracao(idPessoa: Integer): boolean;
begin
  Result:= False;
  if Sistema.IdModulo <> 21 then
    if PossuiVinculo(idPessoa) then
      Result:= True;
end;

procedure TfrmPessoa.sbtnExcluiDetClick(Sender: TObject);
begin
  //Thaise - Caso não possa fazer alterações nos campos, verifico na lista de Telefone, Endereço e Contato
  //se o ID referente na query existe na lista salva. Se existir, não permito exclusões.
  if pgctrlDetalhe.ActivePage = tbsTelefone then
  begin
    if pos(QryTelefone.FieldByName('IDTELEFONE').Asstring, lTelefone) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    if pos(qryEndereco.FieldByName('IDENDERECO').AsString, lEndereco) > 0  then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  if pgctrlDetalhe.ActivePage = tbsContato then
  begin
    if pos(qryContato.FieldByName('IDCONTATO').AsString, lContato) > 0 then
    begin
      MessageDlg('A operação só pode ser feita no módulo Folha de Pagamento.', mtInformation, [mbOK], 0);
      Abort;
    end;
  end;

  inherited;

end;

procedure TfrmPessoa.HabilitarCampos;
begin
    DBEDDDI.Enabled:= True;
    DBEDDDD.Enabled:= True;
    DBEDNUMERO.Enabled:= True;
    GroupBox4.Enabled:= True;
    GroupBox5.Enabled:= True;
    dbedNomeEndereco.Enabled:= True;
    dbedLogradouro.Enabled:= True;
    DBNUMERO.Enabled:= True;
    DBEDCOMPLEMENTO.Enabled:= True;
    dbedBairro.Enabled:= True;
    dbedCEP.Enabled:= True;
    cmbCidade.Enabled:= True;
    dbedEstado.Enabled:= True;
    dbedPais.Enabled:= True;
    grpTipoEnd.Enabled:= True;
    dbedContatoNome.Enabled:= True;
    GroupBox6.Enabled:= True;
    dbedcontatoemail.Enabled:= True;
    DBDateEdit2.Enabled:= True;
    DBEdit2.Enabled:= True;
    DBMemo1.Enabled:= True;
    DBEdit3.Enabled:= True;
    edDocNumDocumento.Enabled:= True;
    dbedDocumento.Enabled:= True;
    dbedNomeFantasia.Enabled:= True;
    dbedemail.Enabled:= True;
    DbeHomePage_Padrao.Enabled:= True;
    wwDBEdit1.Enabled:= True;
    dbcmbEstadoDoc.Enabled:= True;
    CMDateTimePicker2.Enabled:= True;

    if bTtravarCadastro then
      PintarCampos([dbedContatoNome, dbedcontatoemail, DBEdit2, DBEdit3, DBMemo1,
                    GroupBox6, dbgContatoRamal, dblcTelefone, GroupBox5, dbgTelefoneRamal,
                    chkTipoTelefone, GroupBox4, DBEDDDI, DBEDDDD, DBEDNUMERO, dbedNomeEndereco,
                    dbedLogradouro, DBEDCOMPLEMENTO, cmbCidade, DBNUMERO, dbedCEP,
                    dbedPais, chkTipoEndereco, grpTipoEnd, dbedDocumento, dbedNomeFantasia,
                    dbedemail, DbeHomePage_Padrao, edDocNumDocumento, wwDBEdit1,
                    dbcmbEstadoDoc, CMDateTimePicker2, dbedBairro, dbedEstado, dbedPais, DBDateEdit2], clWindow);
    lblMsg.Visible:= False;
    bTtravarCadastro:= False;
end;

procedure TfrmPessoa.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmPessoa.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmPessoa.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmPessoa.PintarCampos(lEdit: array of TComponent;
  Color: TColor);
var x: integer;
begin
  //Thaise - Função criada para pintar os campos de maneira dinâmica.

  //1) Declaro lEdit como uma lista de Componentes - pode ser qualquer componente de TObject;
  //2) Coloco a cor desejada para a variável Color, do tipo TColor;
  //3) Faço um laço 'For' para a minha lista inteira de componentes e verifico o tipo de classe que ele pertence, para então pintar.
  for x:= 0 to High(lEdit) do
  begin
    if TObject(lEdit[x]).ClassType = TwwDBEdit then
      TwwDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBEdit then
      TDBEdit(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TGroupBox then
      TGroupBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCheckListBox then
      TCheckListBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBGrid then
      TwwDBGrid(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBMemo then
      TDBMemo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TwwDBLookupCombo then
      TwwDBLookupCombo(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TRadioGroup then
      TRadioGroup(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBCheckBox then
      TDBCheckBox(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TCMDateTimePicker then
      TCMDateTimePicker(lEdit[x]).Color:= Color;

    if TObject(lEdit[x]).ClassType = TDBRealEdit then
      TDBRealEdit(lEdit[x]).Color:= Color;
  end;
end;

//Darivaldo Alencar SIG 22093 -inicio
function TfrmPessoa.ValidaEntrada: boolean;
var
  iIdDocumento: Integer;
begin
   result:= true;
   pnlItemsDoc.visible:= false;
   iIdDocumento:= qryDocumento.fieldbyname('IDDOCUMENTO').asInteger;
   qryDocumento.first;
   while not(qryDocumento.eof) do
   begin

    if (qryDocumento.fieldByname('NUMDOCUMENTO').asString = EmptyStr) then
     begin
        qryDocumento.next;
        continue;
     end;

   if (qryDocumento.FieldByName('OBRIGAEMISSAO').AsString = 'S') and (CMDateTimePicker2.Text = EmptyStr) and (CMDateTimePicker2.visible) then
     begin
       MsgDlg('Obrigatório preencher a Data da Emissão do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
       result:= false;
       break;
     end;
  if (qryDocumento.FieldByName('OBRIGAUF').AsString = 'S') and (dbcmbEstadoDoc.Text = EmptyStr) and (dbcmbEstadoDoc.visible )then
    begin
      MsgDlg('Obrigatório preencher a Unidade de Federação do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGAORGAO').AsString = 'S') and (wwDBEdit1.Text = EmptyStr)and (wwDBEdit1.visible) then
    begin
      MsgDlg('Obrigatório preencher o Órgão Emissor do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('FLGOBRIGAVALIDADE').AsString = 'S') and (CMDateTimePicker1.Text = EmptyStr) and (CMDateTimePicker1.visible)then
    begin
      MsgDlg('Obrigatório preencher a Data de Validade do documento ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGACATG').AsString = 'S') and (edtCategoria.Text = EmptyStr) and (edtCategoria.visible)then
    begin
      MsgDlg('Obrigatório preencher a Categoria do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGAPRMHAB').AsString = 'S') and (CMDateTimePicker38.Text = EmptyStr) and (CMDateTimePicker38.visible)then
    begin
      MsgDlg('Obrigatório preencher a Data da primeira habilitação do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
  if (qryDocumento.FieldByName('OBRIGAPAIS').AsString = 'S') and (dbcmdPais.Text = EmptyStr) and (dbcmdPais.visible) then
    begin
      MsgDlg('Obrigatório preencher o País do documento: ' + qryDocumento.FieldByName('NOMEDOCUMENTO').Asstring,'Aviso',mtWarning,[mbOK],0);
      result:= false;
      break;
    end;
    qryDocumento.Next;
  end;
  qryDocumento.locate('IDDOCUMENTO',iIdDocumento,[]);
  pnlItemsDoc.visible:= true;
end;

procedure TfrmPessoa.bbtnConfirmarClick(Sender: TObject);
begin
  if not (ValidaEntrada) then Abort; // Darivaldo Alencar - SIG 22093
  inherited;
end;

procedure TfrmPessoa.dbcmbTipoDocumentoChange(Sender: TObject);
var
  sText, sNumDocumentoAntigo, sMask: String;
  iQtdMask: Integer;
begin
  inherited;
  dbcmbTipoDocumento.OnChange := Nil;
  sText := dbcmbTipoDocumento.Text;
  with qryDocumento do
      if not (State in [dsInactive,dsBrowse]) then
      begin
        FieldByname('NUMDOCUMENTO').EditMask := StringReplace(Pessoa.MaskField(SelMascara(FieldByname('IDDOCUMENTO').asString,qryTipoDocumento.FieldByName('IDTIPODOCPESSOAXMASC').asString)), '#', 'a', [rfReplaceAll]);
      end;

      if (sText <> EmptyStr) then
      begin
          if (qryDocumento.fieldbyname('idtipodocpessoaxmasc').asstring <> EmptyStr)
            and (qryDocumento.state <> dsBrowse)  then
          begin
              if (qryDocumento.FieldByName('idtipodocpessoaxmasc').asString <> qryDocumento.fieldbyname('idtipodocpessoaxmasc').asstring) then
              begin
                sNumDocumentoAntigo := qryDocumento.FieldByName('NUMDOCUMENTO').asString;
                qryDocumento.FieldByname('NUMDOCUMENTO').clear;
                sMask := qryDocumento.FieldByName('NUMDOCUMENTO').EditMask;
                iQtdMask := Length(SoNumero(sMask)) - 1;
                qryDocumento.FieldByName('NUMDOCUMENTO').asString := Copy(sNumDocumentoAntigo,1,iQtdMask);
                edDocNumDocumentoExit(self);
              end;
          qryDocumento.Edit;
          qryDocumento.FieldByName('idtipodocpessoaxmasc').asString := qryDocumento.fieldbyname('idtipodocpessoaxmasc').asstring;
          qryDocumento.Post;
          end;
      end;
  CarregaTipoDocumento(qryDocumento.FieldByName('IDDOCUMENTO').asString, EmptyStr);  //Carrega novamente os itens do Cds
  dbcmbTipoDocumento.Text := sText;
  dbcmbTipoDocumento.OnChange := dbcmbTipoDocumentoChange;
end;


function TfrmPessoa.SoNumero(fField : String): String;
var
  I : Byte;
begin
  Result := EmptyStr;
  for I := 1 To Length(fField) do
     if ((fField [I] In ['0'..'9']) or (fField [I] = '#')) Then
      Result := Result + fField [I];
end;

function  TfrmPessoa.CarregaTipoDocumento (sIdDocumento: String;sIdTipoDocPessoaxMasc: String): String;
begin
  SelMascara(sIdDocumento,sIdTipoDocPessoaxMasc);
end;


function TfrmPessoa.SelMascara(sIdDocumento: String; sIdTipoDocPessoaxMasc: String): String;
var sSql : string;
begin
  sSqL :='SELECT TX.IDTIPODOCPESSOAXMASC, TX.IDDOCUMENTO, ' +
                         ' TX.NOME, TX.MASCARA ' +
                         ' FROM TIPODOCPESSOAXMASC TX ';
  if (sIdDocumento <> EmptyStr) then
  begin
    sSQL := sSQL + 'where TX.IDDOCUMENTO = ' + QuotedStr(sIdDocumento);
    if (sIdTipoDocPessoaxMasc <> EmptyStr) then
    sSQL := sSQL + 'and TX.IDTIPODOCPESSOAXMASC = ' + QuotedStr(sIdTipoDocPessoaxMasc);
  end;
  sSQL := sSQL + ' ORDER BY TX.IDTIPODOCPESSOAXMASC';

  qryTipoDocumento.close;
  qryTipoDocumento.sql.clear;
  qryTipoDocumento.sql.add(sSql);
  qryTipoDocumento.open;

  result:= Trim(qryTipoDocumento.fieldbyname('Mascara').asString);
end;

//edilaine - SIG71995 - inicio
procedure TfrmPessoa.AplicaUpdates(const DataSets: array of TDBDataSet);
var
  I: Integer;
begin
  try
     for I := 0 to High(DataSets) do
     begin
         if DataSets[I].Database = dtmBaseDados.dbBaseDados then
            DataSets[I].ApplyUpdates;
     end;
  except
    raise;
  end;
end;
//edilaine - SIG71995 - fim


end.


