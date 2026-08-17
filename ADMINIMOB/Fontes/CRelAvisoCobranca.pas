{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------

	   Emissão de Avisos de Cobrança

	Autor          :  André Pontes
	Data de Início :
	Data de Término:

--------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.18 / 5.10.17 / 5.10.16
Pendência    : 27228
Responsável  : Daniel Simões
Data         : 21/01/2008
Descrição    : Inclusão do campo 'VALOR_OUTROS' na query 'qryDiscriminado' ...
--------------------------------------------------------------------------------
Padrão      : 5.10.19
Pendência   : 26812
Responsável : Daniel Simões
Data        : 06/12/2007
Descrição   : Ajuste na query do relatório para não trazer registros
              discriminados duplicados...
--------------------------------------------------------------------------------

Modificações   :  04/07/2000  1) Opção de só exibir documentos em aberto
                              2) Melhoria da cláusula de ordenação dos lançamentos
                  28/07/2000  3) Tabela DOCUMENTO na query
                  18/10/2000  4) Incorporados todos os modelos de aviso de cobrança
                                 na mesma tela - exportação pelo word (Alex)
                  09/12/2000  5) Usando dtmMS.MS_Contrato (André Pontes)
                  12/03/2001  6) Trocado o LookUp do debitado para MontaSelect (Alex)
                  30/01/2004  7) Modificado o nome do PipiLine para pplConsulta, pois
                                 estava entrando em Loop contínuo - (Marcio Motta)
                              8) Implementado período de vencimento - (Marcio Motta)
                  27/04/2004  9) Temporariamente dasabilitada a facilidade de impressão
                                 pelo WORD;
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}


unit CRelAvisoCobranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Menus, ppBands, ppClass, ppProd, ppReport, Db,
  Wwdatsrc, ppEndUsr, ppComm, ppCache, ppDB, ppDBBDE, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  fcButton, fcImgBtn, fcShapeBtn, FCadastroCS, MontaSelect, TB97Ctls,
  FCadastro, cmseldlg, wwidlg, Mask, wwdbedit, Wwdotdot, fPreview,
  Wwdbcomb, wwdblook, Pptypes, Wwdbspin, ppPrvDlg, ppforms, CRel, WordOle,
  Word_TLB, uExtensoCM, ppRelatv, ppDBPipe, wwdbdatetimepicker, jclSysUtils,
  CMDateTimePicker, mContrato, mLocatario, uCtrlEventoImovel;

const
   ArqCMCartaCob = 'AvisoCobranca.tmp';
   vNomeMes : array[1..12] of string = ('JAN', 'FEV', 'MAR', 'ABR', 'MAI', 'JUN', 'JUL', 'AGO', 'SET', 'OUT', 'NOV', 'DEZ');
   vNumMes  : array[1..12] of string = ('01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12');


type
  TcfgRelAvisoCobranca = class(TcfgRel)
    qryEmpresaClienteX: TwwQuery;
    qryEmpresaClienteXIDFORCLI: TFloatField;
    qryEmpresaClienteXIDPESSOA: TFloatField;
    qryEmpresaClienteXCONTACCLIENTE: TStringField;
    qryEmpresaClienteXSUBCONTACLIENTE: TFloatField;
    qryEmpresaClienteXSUBCONTALOCATARIO: TFloatField;
    qryEmpresaClienteXNOME: TStringField;
    pplconsulta: TppBDEPipeline;
    rptImprime: TppReport;
    RpImprimeHeaderBand1: TppHeaderBand;
    RpImprimeDetailBand1: TppDetailBand;
    RpImprimeFooterBand1: TppFooterBand;
    dsSql: TwwDataSource;
    ds: TwwDataSource;
    qryTemplate: TwwQuery;
    qryReports: TwwQuery;
    qryReportsNAME: TStringField;
    qryReportsIDREPORTS: TFloatField;
    qryReportsORIGEMCM: TFloatField;
    qryReportsTEMPLATE: TBlobField;
    qryCobranca: TwwQuery;
    qryCobrancaDESCALC: TStringField;
    qryCobrancaDataPagamento: TDateField;
    qryCobrancadataatual: TStringField;
    qryCobrancadatajuros: TStringField;
    qryCobrancadatames: TStringField;
    qryCobrancaContratoExtenso: TStringField;
    qryCobrancaIMONOME: TStringField;
    qryCobrancaIDIMOVELMESTRE: TFloatField;
    qryCobrancaCONNUMERO: TStringField;
    qryCobrancaCONNOME: TStringField;
    e: TFloatField;
    qryCobrancaCONDIASTOLERANCIA: TFloatField;
    qryCobrancaFLGTIPODIATOLERA: TStringField;
    qryCobrancaIDCIDADES: TFloatField;
    qryCobrancaNOME_IMOVEL: TStringField;
    qryCobrancaRAZAOSOCIAL: TStringField;
    qryCobrancaNOME_CONTATO: TStringField;
    qryCobrancaCODPORTADOR: TFloatField;
    qryCobrancaIDBANCO: TFloatField;
    qryCobrancaIDAGENCIA: TFloatField;
    qryCobrancaCONTA_CORRENTE: TStringField;
    qryCobrancaNOME_BANCO: TStringField;
    qryCobrancaNUMBANCO: TStringField;
    qryCobrancaNUMAGENCIA: TStringField;
    qryCobrancaIDLANCIMOVEL: TFloatField;
    qryCobrancaIDIMOVEL: TFloatField;
    qryCobrancaIDCONTRATOIMOVEL: TFloatField;
    qryCobrancaIDTIPOCUSTORECIMO: TFloatField;
    qryCobrancaIDPESSOA: TFloatField;
    qryCobrancaPLNCODIGO: TFloatField;
    qryCobrancaCODDOCUMENTO: TFloatField;
    qryCobrancaVLRLANCPAGAR: TFloatField;
    qryCobrancaVLRLANCOMPAGAR: TFloatField;
    qryCobrancaMOEDAPAGAR: TFloatField;
    qryCobrancaVLRLANCRECEB: TFloatField;
    qryCobrancaVLRLANCOMRECEB: TFloatField;
    qryCobrancaMOEDARECEB: TFloatField;
    qryCobrancaVLRMULTA: TFloatField;
    qryCobrancaVLRJUROS: TFloatField;
    qryCobrancaVLRCORRECAOMON: TFloatField;
    qryCobrancaFLGTIPOLANCAMENTO: TStringField;
    qryCobrancaRECPAG: TStringField;
    qryCobrancaMESREFERENCIA: TFloatField;
    qryCobrancaANOREFERENCIA: TFloatField;
    qryCobrancaMESCOMPETENCIA: TFloatField;
    qryCobrancaANOCOMPETENCIA: TFloatField;
    qryCobrancaDATALANCAMENTO: TDateTimeField;
    qryCobrancaDATAVENCIMENTO: TDateTimeField;
    qryCobrancaDATACORRECAO: TDateTimeField;
    qryCobrancaFLGMULTACALCULADA: TFloatField;
    qryCobrancaFLGAGRUPAR: TStringField;
    qryCobrancaFLGAGRUPADO: TFloatField;
    qryCobrancaCODTIPDOC: TFloatField;
    qryCobrancaDESCCUSTORECIMO: TStringField;
    qryCobrancaRECCUSTO: TStringField;
    qryCobrancaNUMLANCTO: TFloatField;
    qryCobrancaOPERACAO: TStringField;
    qryCobrancaDATALANCTO: TDateTimeField;
    qryCobrancaDESCRICAO: TStringField;
    qryCobrancaVALOR: TFloatField;
    qryCobrancaNOME_AGENCIA: TStringField;
    qryCobrancaDATA: TDateTimeField;
    qryCobrancaNOME_MESTRE: TStringField;
    qryCobrancaNOME_EXTENSO: TStringField;
    qryCobrancaIDPAIS: TFloatField;
    qryCobrancaCODESTADO: TStringField;
    Label2: TLabel;
    DBcboModeloAviso: TwwDBLookupCombo;
    memReports: TMemo;
    rdgOrdenacao: TRadioGroup;
    qryTemplateIDCARTACOBRANCA: TFloatField;
    qryTemplateMODELOCARTA: TStringField;
    qryTemplateIDREPORTS: TFloatField;
    qryTemplateORIGEMCM: TFloatField;
    qryTemplateFLGTIPOCARTA: TStringField;
    qryNomesImovel: TwwQuery;
    qryCobrancadesc: TStringField;
    qryCobrancaValorExtenso: TStringField;
    qryCobrancames: TStringField;
    dlgWord: TOpenDialog;
    memImoveis: TMemo;
    edtWord: TEdit;
    Label7: TLabel;
    btnWord: TBitBtn;
    btnLimpaWord: TBitBtn;
    qryConsolidado: TwwQuery;
    qryConsolidadoDESCALC: TStringField;
    qryConsolidadoDataPagamento: TDateField;
    qryConsolidadodataatual: TStringField;
    qryConsolidadodatajuros: TStringField;
    qryConsolidadodatames: TStringField;
    qryConsolidadoContratoExtenso: TStringField;
    qryConsolidadodesc: TStringField;
    qryConsolidadoValorExtenso: TStringField;
    qryConsolidadomes: TStringField;
    qryConsolidadoDESCCUSTORECIMO: TStringField;
    qryConsolidadoCODTIPDOC: TFloatField;
    qryConsolidadoRECCUSTO: TStringField;
    qryConsolidadoCONNUMERO: TStringField;
    qryConsolidadoCONNOME: TStringField;
    qryConsolidadoCODPORTFORMA: TFloatField;
    qryConsolidadoCONDIASTOLERANCIA: TFloatField;
    qryConsolidadoFLGTIPODIATOLERA: TStringField;
    qryConsolidadoIDPAIS: TFloatField;
    qryConsolidadoCODESTADO: TStringField;
    qryConsolidadoIDCIDADES: TFloatField;
    qryConsolidadoRAZAOSOCIAL: TStringField;
    qryConsolidadoNOME_CONTATO: TStringField;
    qryConsolidadoCODPORTADOR: TFloatField;
    qryConsolidadoIDBANCO: TFloatField;
    qryConsolidadoIDAGENCIA: TFloatField;
    qryConsolidadoCONTA_CORRENTE: TStringField;
    qryConsolidadoNOME_BANCO: TStringField;
    qryConsolidadoNOME_AGENCIA: TStringField;
    qryConsolidadoNUMBANCO: TStringField;
    qryConsolidadoNUMAGENCIA: TStringField;
    qryConsolidadoIDCONTRATOIMOVEL: TFloatField;
    qryConsolidadoIDTIPOCUSTORECIMO: TFloatField;
    qryConsolidadoIDPESSOA: TFloatField;
    qryConsolidadoFLGTIPOLANCAMENTO: TStringField;
    qryConsolidadoRECPAG: TStringField;
    qryConsolidadoMESREFERENCIA: TFloatField;
    qryConsolidadoANOREFERENCIA: TFloatField;
    qryConsolidadoMESCOMPETENCIA: TFloatField;
    qryConsolidadoANOCOMPETENCIA: TFloatField;
    qryConsolidadoDATAVENCIMENTO: TDateTimeField;
    qryConsolidadoDATACORRECAO: TDateTimeField;
    qryConsolidadoFLGMULTACALCULADA: TFloatField;
    qryConsolidadoFLGAGRUPAR: TStringField;
    qryConsolidadoFLGAGRUPADO: TFloatField;
    qryConsolidadoOPERACAO: TStringField;
    qryConsolidadoDATALANCTO: TDateTimeField;
    qryConsolidadoDATA: TDateTimeField;
    qryConsolidadoDESCRICAO: TStringField;
    qryConsolidadoVALOR: TFloatField;
    rdoModelo: TRadioGroup;
    qryNomesImovelIDIMOVEL: TFloatField;
    qryNomesImovelNOME_MESTRE: TStringField;
    qryNomesImovelNOME_IMOVEL: TStringField;
    qryNomesImovelCIMVLRAJUSTADO: TFloatField;
    qryNomesImovelIDIMOVELMESTRE: TFloatField;
    qryDiscriminado: TwwQuery;
    qryDiscriminadoDESCCUSTORECIMO: TStringField;
    qryDiscriminadoCONNUMERO: TStringField;
    qryDiscriminadoCONNOME: TStringField;
    qryDiscriminadoCODESTADO: TStringField;
    qryDiscriminadoRAZAOSOCIAL: TStringField;
    qryDiscriminadoNOME_CONTATO: TStringField;
    qryDiscriminadoCONTA_CORRENTE: TStringField;
    qryDiscriminadoNOME_BANCO: TStringField;
    qryDiscriminadoNOME_AGENCIA: TStringField;
    qryDiscriminadoNUMBANCO: TStringField;
    qryDiscriminadoNUMAGENCIA: TStringField;
    qryDiscriminadoMESREFERENCIA: TFloatField;
    qryDiscriminadoANOREFERENCIA: TFloatField;
    qryDiscriminadoMESCOMPETENCIA: TFloatField;
    qryDiscriminadoANOCOMPETENCIA: TFloatField;
    qryDiscriminadoDATAVENCIMENTO: TDateTimeField;
    qryDiscriminadoVALOR: TFloatField;
    qryDiscriminadoVALOR_MULTA: TFloatField;
    qryDiscriminadoVALOR_JUROS: TFloatField;
    qryDiscriminadoVALOR_CORRMON: TFloatField;
    qryDiscriminadoValorTotal: TCurrencyField;
    qryDiscriminadoMes: TStringField;
    qryDiscriminadoValorExtenso: TStringField;
    qryDiscriminadoContratoExtenso: TStringField;
    qryDiscriminadoCONDATAASSINATURA: TDateTimeField;
    qryDiscriminadoCONDATAINICIO: TDateTimeField;
    qryCobrancaCONDATAREAJUSTE: TDateTimeField;
    qryCobrancaVLR_ATUAL_CONTRATO: TFloatField;
    qryCobrancaVLR_ANT_CONTRATO: TFloatField;
    qryConsolidadoCONDATAREAJUSTE: TDateTimeField;
    qryConsolidadoVLR_ATUAL_CONTRATO: TFloatField;
    qryConsolidadoVLR_ANT_CONTRATO: TFloatField;
    qryDiscriminadoCONDATAREAJUSTE: TDateTimeField;
    qryDiscriminadoVLR_ATUAL_CONTRATO: TFloatField;
    qryDiscriminadoVLR_ANT_CONTRATO: TFloatField;
    qryConsolidadoAVISO_REAJUSTE: TStringField;
    qryCobrancaAVISO_REAJUSTE: TStringField;
    qryDiscriminadoAVISO_REAJUSTE: TStringField;
    Extenso: TExtensoCM;
    qryCobrancaENDERECO: TStringField;
    qryConsolidadoENDERECO: TStringField;
    qryDiscriminadoENDERECO: TStringField;
    qryConsolidadoCONINDICEREAJUSTE: TFloatField;
    qryConsolidadoCONPERREAJUSTE: TFloatField;
    qryDiscriminadoCONINDICEREAJUSTE: TFloatField;
    qryDiscriminadoCONPERREAJUSTE: TFloatField;
    qryCobrancaCONINDICEREAJUSTE: TFloatField;
    qryCobrancaCONPERREAJUSTE: TFloatField;
    ChkVisualiza: TCheckBox;
    GroupBox1: TGroupBox;
    molLocatario1: TmolLocatario;
    molContrato1: TmolContrato;
    chkPendente: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtDataIni: TCMDateTimePicker;
    Label8: TLabel;
    edtDataFim: TCMDateTimePicker;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    lblMesVencimento: TLabel;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    chkIgnoraCompetencia: TCheckBox;
    qryDiscriminadoDesc: TStringField;
    qryDiscriminadoIDCONTRATOIMOVEL: TFloatField;
    GroupBox4: TGroupBox;
    Panel1: TPanel;
    memEvento: TMemo;
    qryConsolidadoCODDOCUMENTO: TFloatField;
    qryDiscriminadoCODDOCUMENTO: TFloatField;
    qryBuscaModelo: TwwQuery;
    qryBuscaModeloCODDOCUMENTO: TFloatField;
    qryBuscaModeloIDCARTACOBRANCA: TFloatField;
    qryBuscaModeloEVIDATA: TDateTimeField;
    qryConsolidadoAREA_LOCADA: TFloatField;
    qryConsolidadoNOME_CIDADE: TStringField;
    qryConsolidadoCEP: TStringField;
    qryCobrancaDATAPROGRAMADA: TDateTimeField;
    qryConsolidadoDATAPROGRAMADA: TDateTimeField;
    qryDiscriminadoDATAPROGRAMADA: TDateTimeField;
    qryCobrancaCEP: TStringField;
    qryCobrancaAREA_LOCADA: TFloatField;
    qryDiscriminadoCEP: TStringField;
    qryEnviosAnteriores: TwwQuery;
    qryEnviosAnterioresEVIDATA: TDateTimeField;
    qryCobrancaDatasAnteriores: TStringField;
    qryConsolidadoDatasAnteriores: TStringField;
    qryDiscriminadoDatasAnteriores: TStringField;
    qryImovelLocado: TwwQuery;
    qryImovelLocadoIDCONTRATOIMOVEL: TFloatField;
    qryImovelLocadoIMOVEL_LOCADO: TStringField;
    qryCobrancaImovelLocado: TStringField;
    qryConsolidadoImovelLocado: TStringField;
    qryDiscriminadoImovelLocado: TStringField;
    qryDiscriminadoAREA_LOCADA: TFloatField;
    qryDiscriminadoVALOR_OUTROS: TFloatField;
    qryDiscriminadoVALOR_BAIXA: TFloatField;

    procedure qryCobrancaCalcFields(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboMesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryConsolidadoCalcFields(DataSet: TDataSet);
    procedure rdoModeloClick(Sender: TObject);
    procedure qryDiscriminadoCalcFields(DataSet: TDataSet);
    procedure btnWordClick(Sender: TObject);
    procedure btnLimpaWordClick(Sender: TObject);
    procedure edtWordChange(Sender: TObject);
    procedure chkIgnoraCompetenciaClick(Sender: TObject);
    procedure DBspnAnoChange(Sender: TObject);
    procedure molLocatario1btnBuscaLocatarioClick(Sender: TObject);
    procedure molContrato1btnBuscaContratoClick(Sender: TObject);
    procedure edtDataFimCloseUp(Sender: TObject);
    procedure edtDataIniCloseUp(Sender: TObject);
    procedure DBcboModeloAvisoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


  private { Private declarations }
    sFiltroMS         : string;
    CtrlEventoImovel  : TCtrlEventoImovel;

    function VerificaPreenchimento: boolean;
    function BuscaModeloAutomatico: Integer;
    procedure MontaQuery; override;
    procedure MontaTemplate;

    // procedimentos para imprimir pelo word
    procedure ImprimeWordQuery(WinWord: TWord);
    procedure ImprimeWord;
    procedure ImprimeWordDetalhe(WinWord: TWord);
    procedure BuscaImoveisContrato(const iIdContrato : Integer);
    procedure GravaEvento;
  public { Public declarations }

  end;



var
  cfgRelAvisoCobranca: TcfgRelAvisoCobranca;


implementation
{$R *.DFM}
uses
   uDataBase, dBaseDados, uSistema, uMensErro, uModeloRelatCM, uDiasInUteis, UComunsImobiliario, uVerificaPreenchimento,
   uIntegraBack, uFuncoesImob, dLookImobiliario, DMS, uModuloImobiliario;



procedure TcfgRelAvisoCobranca.ImprimeWordDetalhe(WinWord: TWord);
begin
   WinWord.Abre(edtWord.Text);

   WinWord.Substitui('<DESCCUSTORECIMO>',qryDiscriminadoDESCCUSTORECIMO.AsString);
   WinWord.Substitui('<CONNUMERO>',qryDiscriminadoCONNUMERO.AsString);
   WinWord.Substitui('<CONNOME>',qryDiscriminadoCONNOME.AsString);
   WinWord.Substitui('<CODESTADO>',qryDiscriminadoCODESTADO.AsString);
   WinWord.Substitui('<RAZAOSOCIAL>',qryDiscriminadoRAZAOSOCIAL.AsString);
   WinWord.Substitui('<NOME_CONTATO>',qryDiscriminadoNOME_CONTATO.AsString);
   WinWord.Substitui('<ENDERECO>',qryDiscriminadoENDERECO.AsString);
   WinWord.Substitui('<CONTA_CORRENTE>',qryDiscriminadoCONTA_CORRENTE.AsString);
   WinWord.Substitui('<NOME_BANCO>',qryDiscriminadoNOME_BANCO.AsString);
   WinWord.Substitui('<NOME_AGENCIA>',qryDiscriminadoNOME_AGENCIA.AsString);
   WinWord.Substitui('<NUMBANCO>',qryDiscriminadoNUMBANCO.AsString);
   WinWord.Substitui('<NUMAGENCIA>',qryDiscriminadoNUMAGENCIA.AsString);
   WinWord.Substitui('<MESREFERENCIA>',qryDiscriminadoMESREFERENCIA.AsString);
   WinWord.Substitui('<ANOREFERENCIA>',qryDiscriminadoANOREFERENCIA.AsString);
   WinWord.Substitui('<MESCOMPETENCIA>',qryDiscriminadoMESCOMPETENCIA.AsString);
   WinWord.Substitui('<COMPETENCIA>',qryDiscriminadoANOCOMPETENCIA.AsString);
   WinWord.Substitui('<DATAVENCIMENTO>',qryDiscriminadoDATAVENCIMENTO.AsString);
   WinWord.Substitui('<VALOR>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoVALOR.AsCurrency));
   WinWord.Substitui('<VALOR_MULTA>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoVALOR_MULTA.AsCurrency));
   WinWord.Substitui('<VALOR_JUROS>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoVALOR_JUROS.AsCurrency));
   WinWord.Substitui('<VALOR_CORRMON>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoVALOR_CORRMON.AsCurrency));
   WinWord.Substitui('<VALOR_OUTROS>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoVALOR_OUTROS.AsCurrency)); // Daniel - 27228
   WinWord.Substitui('<ValorTotal>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoValorTotal.AsCurrency));
   WinWord.Substitui('<ValorTotal1>',FormatFloat('#,##0.00;(#,##0.00)',qryDiscriminadoValorTotal.AsCurrency));
   WinWord.Substitui('<Mes>',qryDiscriminadoMes.AsString);
   WinWord.Substitui('<ValorExtenso>',qryDiscriminadoValorExtenso.AsString);
   WinWord.Substitui('<ContratoExtenso>',qryDiscriminadoContratoExtenso.AsString);
   WinWord.Substitui('<CONDATAASSINATURA>',qryDiscriminadoCONDATAASSINATURA.AsString);
   WinWord.Substitui('<CONDATAINICIO>',qryDiscriminadoCONDATAINICIO.AsString);
   WinWord.Substitui('<CONDATAREAJUSTE>',qryDiscriminadoCONDATAREAJUSTE.AsString);
   WinWord.Substitui('<VLR_ATUAL_CONTRATO>',qryDiscriminadoVLR_ATUAL_CONTRATO.AsString);
   WinWord.Substitui('<VLR_ANT_CONTRATO>',qryDiscriminadoVLR_ANT_CONTRATO.AsString);
   WinWord.Substitui('<AVISO_REAJUSTE>',qryDiscriminadoAVISO_REAJUSTE.AsString);

  {Todo -oGleyber -cNovo: 07/05/01 Utiliza o checklist para vizualizar ou não a impressão no word}
   If not chkVisualiza.Checked then
     Begin
       WinWord.Imprime;
       WinWord.Fecha;
     End;
end;

procedure TcfgRelAvisoCobranca.ImprimeWordQuery(WinWord: TWord);
begin
  qryDiscriminado.First;

  while not qryDiscriminado.EOF do begin
     // Chama procedure para substituir campos
     ImprimeWordDetalhe(WinWord);

     qryDiscriminado.Next;
  end;
end;

procedure TcfgRelAvisoCobranca.ImprimeWord;
var
   WinWord: TWord;
begin
   if not assigned(WinWord) then
      WinWord := TWord.Create;

   try
{ TODO -oGleyber -cNovo : 07/05/01 - Adicionado checkbox para controlar visualização do arquivo word }
      If not chkVisualiza.Checked then
         WinWord.Application.Visible := False
      else
         WinWord.Application.Visible := True;

      ImprimeWordQuery(WinWord);
   finally
      If not chkVisualiza.Checked then
         FreeAndNil(WinWord);
   end;
end;




function TcfgRelAvisoCobranca.VerificaPreenchimento: boolean;
begin
   Result := False;
   try
      if (edtDataIni.Text <> '') and (edtDataFim.Text = '') then
         raise EValidacao.CreateVal('Para filtro por período de vencimento é necessário' + #13 +
                                    'informar data inicial e data final!', edtDataFim);

      if (edtDataFim.Text <> '') and (edtDataIni.Text = '') then
         raise EValidacao.CreateVal('Para filtro por período de vencimento é necessário' + #13 +
                                    'informar data inicial e data final!', edtDataIni);

      if (edtDataFim.Date < edtDataIni.Date) then
         raise EValidacao.CreateVal('A data inicial está maior que a data final!', edtDataIni);

      // Quando Recibo Discrimando estiver marcado, verifica também se o caminho do arquivo
      // WORD está preenchido antes de enviar mensagem ao usuário - Marcio Motta - 02/02/2004 - Pendência: 16015
      case rdoModelo.ItemIndex of
         0 : begin
                if (DBcboModeloAviso.LookupValue = '') then
                   raise EValidacao.CreateVal('É necessário indicar o Modelo do Aviso de Cobrança!', DBcboModeloAviso);
             end;

         1 : begin
                if (DBcboModeloAviso.LookupValue = '') then
                   raise EValidacao.CreateVal('É necessário indicar o Modelo do Aviso de Cobrança!', DBcboModeloAviso);
             end;

         2 : begin
                if (DBcboModeloAviso.LookupValue = '') and (edtWord.Text = '') then
                   raise EValidacao.CreateVal('É necessário indicar o Modelo do Recibo Discriminado' + #13 +
                                              'ou o arquivo WORD para a impressão!', DBcboModeloAviso);
             end;
      end;

      // ignora (ou não) a Competência
      if not(chkIgnoraCompetencia.Checked) then begin
         if (cboMes.ItemIndex < 0) and (edtDataIni.Text = '') then
            raise EValidacao.CreateVal('É necessário indicar o Mês de Competência!', cboMes);

         if (DBspnAno.Value <= 0) and (edtDataIni.Text = '') then
            raise EValidacao.CreateVal('É necessário indicar o Ano!', DBspnAno);
      end;
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



procedure TcfgRelAvisoCobranca.MontaQuery;
begin
   case qryTemplateFLGTIPOCARTA.AsString[1] of

      'I':
      begin    // aviso de cobrança
         with qryCobranca do begin
            LimpaParametros(qryCobranca);

            SQL.Text :=
            'SELECT ' + #13 +

            '   I.IMONOME, I.IDIMOVELMESTRE, IM.IMONOME AS NOME_MESTRE, ' + #13 +
            '   CI.CONNUMERO, CI.CONNOME, CI.CODPORTFORMA, ' + #13 +
            '   CI.CONDIASTOLERANCIA, CI.FLGTIPODIATOLERA, ' + #13 +
            '   CI.IDPAIS, CI.CODESTADO, CI.IDCIDADES, ' + #13 +
            '   CI.CONDATAREAJUSTE, ' + #13+
            '   CI.CONINDICEREAJUSTE, CI.CONPERREAJUSTE, ' + #13+
            '   CI.CONVLRAJUSTADO AS VLR_ATUAL_CONTRATO, ' + #13 +
            '   CI.CONVLRTOTAL AS VLR_ANT_CONTRATO, '+ #13 +

            '   DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, CX.CIMDESCRICAO) AS NOME_IMOVEL, ' + #13 +

            '   IM.IMONOME||'' - ''||DECODE(CX.CIMDESCRICAO, NULL, I.IMONOME, CX.CIMDESCRICAO) AS NOME_EXTENSO, ' + #13 +

            '   P.RAZAOSOCIAL, ' + #13 +
            '   CP.NOME AS NOME_CONTATO, ' + #13 +
            '   E.LOGRADOURO||'', ''||E.NUMERO||'', ''||E.COMPLEMENTO AS ENDERECO, ' + #13 +

            // Marchetti - Pendencia 19889

            '   E.CEP, ' + #13 +
            '   I.IMOAREA AS AREA_LOCADA, ' + #13 +
            '   D.DATAPROGRAMADA, ' + #13 +

            // Fim Marchetti - Pendencia 19889

            '   PF.CODPORTADOR, ' + #13 +
            '   PC.IDBANCO, PC.IDAGENCIA, PC.NOCONTACORR AS CONTA_CORRENTE, ' + #13 +

            '   PB.NOME AS NOME_BANCO, PA.NOME AS NOME_AGENCIA, ' + #13 +
            '   B.NUMBANCO, A.NUMAGENCIA, ' + #13 +

            '   LI.IDLANCIMOVEL, ' + #13 +
            '   LI.IDIMOVEL, LI.IDCONTRATOIMOVEL, LI.IDTIPOCUSTORECIMO, ' + #13 +
            '   LI.IDPESSOA, LI.PLNCODIGO, LI.CODDOCUMENTO, ' + #13 +
            '   LI.VLRLANCPAGAR, LI.VLRLANCOMPAGAR, LI.MOEDAPAGAR, ' + #13 +
            '   LI.VLRLANCRECEB, LI.VLRLANCOMRECEB, LI.MOEDARECEB, ' + #13 +
            '   LI.VLRMULTA, LI.VLRJUROS, LI.VLRCORRECAOMON, ' + #13 +
            '   LI.FLGTIPOLANCAMENTO, LI.RECPAG, ' + #13 +
            '   LI.MESREFERENCIA, LI.ANOREFERENCIA, ' + #13 +
            '   LI.MESCOMPETENCIA, LI.ANOCOMPETENCIA, ' + #13 +
            '   LI.DATALANCAMENTO, LI.DATAVENCIMENTO, ' + #13 +
            '   LI.DATACORRECAO, LI.FLGMULTACALCULADA, ' + #13 +
            '   LI.FLGAGRUPAR, LI.FLGAGRUPADO, ' + #13 +

            '   TR.CODTIPDOC, TR.DESCCUSTORECIMO, TR.RECCUSTO, ' + #13 +
            '   LD.NUMLANCTO, LD.OPERACAO, LD.DATALANCTO, ' + #13 +

            '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
            '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)) AS DATA, ' + #13 +

            '   TA.DESCRICAO, ' + #13 +
            '   DECODE(LD.DEBCRE, ''D'', LD.VALOR, LD.VALOR * -1) AS VALOR ' + #13 +

            'FROM ' + #13 +
            '   PESSOA P, PESSOA PB, PESSOA PA, ' + #13 +
            '   LANCAMENTOSIMOVEL LI, TIPOCUSTORECIMOV  TR, ' + #13 +
            '   CONTRATOXIMOVEL CX, CONTRATOIMOVEL CI, ' + #13 +
            '   PORTADORFORMA PF, PORTADORCONTA PC, ' + #13 +
            '   DOCUMENTO D, IMOVEL I, IMOVEL IM, ENDPESS E, ' + #13 +
            '   LANCTODOCUM LD, TIPOALTERADOR TA, ' + #13 +
            '   BANCO B, AGENCIABANCARIA A, ' + #13 +
            '   ( ' + #13 +
            '   SELECT ' + #13 +
            '      CXP.IDENDERECO, CXP.IDCONTATO, CXP.NOME ' + #13 +
            '   FROM ' + #13 +
            '      CONTATOPESS CXP, ' + #13 +
            '      ( ' + #13 +
            '      SELECT ' + #13 +
            '         MIN(IDCONTATO) AS IDCONTATO, IDENDERECO ' + #13 +
            '      FROM ' + #13 +
            '         CONTATOPESS ' + #13 +
            '      GROUP BY ' + #13 +
            '         IDENDERECO ' + #13 +
            '      ) CON ' + #13 +
            '   WHERE ' + #13 +
            '      ( CON.IDCONTATO = CXP.IDCONTATO ) ' + #13 +
            '   ) CP ' + #13 +

            'WHERE ' + #13 +
            '  ( LI.RECPAG = ''R'' ) ' + #13;

            if not(chkIgnoraCompetencia.Checked) then
            SQL.Text := SQL.Text +
            '  AND ( LI.MESCOMPETENCIA = ' + IntToStr(cboMes.ItemIndex + 1) + ' ) ' + #13 +
            '  AND ( LI.ANOCOMPETENCIA = ' + IntToStr(trunc(DBspnAno.Value)) + ' ) ' + #13;

            if molContrato1.iContrato > 0 then
            SQL.Text := SQL.Text +
            '  AND ( LI.IDCONTRATOIMOVEL = ' + IntToStr(molContrato1.iContrato) + ' ) ' + #13;

            if molLocatario1.iLocatario > 0 then
            SQL.Text := SQL.Text +
            '  AND ( CI.IDLOCATARIO = ' + IntToStr(molLocatario1.iLocatario) + ' ) ' + #13;

            if length(trim(edtDataIni.Text)) > 0 then
            SQL.Text := SQL.Text +
            '  AND (LI.DATAVENCIMENTO BETWEEN :DATAINI AND :DATAFIM )' + #13;

            if chkPendente.Checked then
            SQL.Text := SQL.Text +
            '  AND ( (RTRIM(D.STATUS) <> ''2'') OR (D.STATUS IS NULL) ) ' + #13;

            SQL.Text := SQL.Text +
            '  AND ( LI.IDIMOVEL = CX.IDIMOVEL ) ' + #13 +
            '  AND ( LD.CODALTERADOR = TA.CODALTERADOR(+) ) ' + #13 +
            '  AND ( LI.CODDOCUMENTO = LD.CODDOCUMENTO ) ' + #13 +
            '  AND ( LD.CODDOCUMENTO = D.CODDOCUMENTO ) ' + #13 +
            '  AND ( LI.IDIMOVEL = I.IDIMOVEL ) ' + #13 +
            '  AND ( LI.IDCONTRATOIMOVEL = CI.IDCONTRATOIMOVEL ) ' + #13 +
            '  AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL ) ' + #13 +
            '  AND ( LI.IDCONTRATOIMOVEL = CX.IDCONTRATOIMOVEL ) ' + #13 +
            '  AND ( CI.IDLOCATARIO = P.IDPESSOA ) ' + #13 +
            '  AND ( P.IDENDCOBRANCA = E.IDENDERECO(+) ) ' + #13 +
            '  AND ( P.IDPESSOA = E.IDPESSOA(+) ) ' + #13 +
            '  AND ( TR.IDTIPOCUSTORECIMO = LI.IDTIPOCUSTORECIMO ) ' + #13 +
            '  AND ( P.IDENDCOBRANCA = CP.IDENDERECO(+) ) ' + #13 +
            '  AND ( CI.CODPORTFORMA = PF.CODPORTFORMA ) ' + #13 +
            '  AND ( PF.CODPORTADOR = PC.CODPORTADOR ) ' + #13 +
            '  AND ( PC.IDAGENCIA = PA.IDPESSOA ) ' + #13 +
            '  AND ( PC.IDAGENCIA = A.IDPESSOA ) ' + #13 +
            '  AND ( A.IDBANCO = PB.IDPESSOA ) ' + #13 +
            '  AND ( A.IDBANCO = B.IDPESSOA ) ' + #13 +

            'ORDER BY ' + #13;

            case rdgOrdenacao.ItemIndex of
               0: SQL.Text := SQL.Text +
                  '   IM.IMONOME, I.IMONOME, ' + #13 +
                  '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, LI.CODDOCUMENTO, ' + #13 +
                  '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
                  '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)) ';

               1: SQL.Text := SQL.Text +
                  '   LI.ANOCOMPETENCIA, LI.MESCOMPETENCIA, LI.CODDOCUMENTO, ' + #13 +
                  '   DECODE(RTRIM(LD.OPERACAO), ''1'', LI.DATAVENCIMENTO, ' + #13 +
                  '      DECODE(RTRIM(LD.OPERACAO), ''2'', LI.DATAVENCIMENTO, LD.DATALANCTO)), ' + #13 +
                  '   IM.IMONOME, I.IMONOME ';
            end;

            if length(trim(edtDataIni.Text)) > 0 then
            ParamByName('DATAINI').asString := edtDataIni.Text;

            if length(trim(edtDataFim.Text)) > 0 then
            ParamByName('DATAFIM').asString := edtDataFim.Text;

            Open;
         end;
      end;

      'S':
      begin    // aviso de cobrança consolidado
         LimpaParametros(qryConsolidado);
         with qryConsolidado do begin

            if not(chkIgnoraCompetencia.Checked) then begin
               ParamByName('PMESCOMPETENCIA').AsInteger := cboMes.ItemIndex + 1;
               ParamByName('PANOCOMPETENCIA').AsInteger := trunc(DBspnAno.Value);
            end;

            if molContrato1.iContrato > 0 then begin
               ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
            end;

            if molLocatario1.iLocatario > 0 then begin
               ParamByName('PIDLOCATARIO').AsInteger := molLocatario1.iLocatario;
            end;

            if length(trim(edtDataIni.Text)) > 0 then
               ParamByName('DATAINI').asString := edtDataIni.Text;

            if length(trim(edtDataFim.Text)) > 0 then
               ParamByName('DATAFIM').asString := edtDataFim.Text;

            if chkPendente.Checked then begin
               ParamByName('STATUS').AsString := 'P';
            end;

            Open;
         end;
      end;

      'D':
      begin    // recibo discriminado
         LimpaParametros(qryDiscriminado);
         with qryDiscriminado do begin

            if not(chkIgnoraCompetencia.Checked) then begin
               ParamByName('PMESCOMPETENCIA').AsInteger := cboMes.ItemIndex + 1;
               ParamByName('PANOCOMPETENCIA').AsInteger := trunc(DBspnAno.Value);
            end;

            if molContrato1.iContrato > 0 then begin
               ParamByName('PIDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato;
            end;

            if molLocatario1.iLocatario > 0 then begin
               ParamByName('PIDLOCATARIO').AsInteger := molLocatario1.iLocatario;
            end;

            if length(trim(edtDataIni.Text)) > 0 then
            ParamByName('DATAINI').asString := edtDataIni.Text;

            if length(trim(edtDataFim.Text)) > 0 then
            ParamByName('DATAFIM').asString := edtDataFim.Text;

            if chkPendente.Checked then begin
               ParamByName('STATUS').AsString := 'P';
            end;

            Open;
         end;
      end

   else
      MsgDlg('O tipo de relatório selecionado não está previsto nesta tela.','Escolha outro Modelo',mtwarning,[mbok],0);
   end;
end;



procedure TcfgRelAvisoCobranca.MontaTemplate;
begin
   // Limpa os parâmetros da Query
   LimpaParametros(qryTemplate);

   // De acordo com o MODELO DE COBRANÇA escolhido pelo usuário, configura a qryTemplate
   // e habilita ou desabilita opções do WORD e opção de ignorar competência

   case rdoModelo.ItemIndex of
     0: begin
           qryTemplate.ParamByName('PFLGTIPOCARTA').AsString := 'I';
           edtWord.Clear;
           btnWord.Enabled := false;
           btnLimpaWord.Enabled := false;
           dsSql.DataSet := qryCobranca;
        end;

     1: begin
           qryTemplate.ParamByName('PFLGTIPOCARTA').AsString := 'S';
           edtWord.Clear;
           btnWord.Enabled := false;
           btnLimpaWord.Enabled := false;
           dsSql.DataSet := qryConsolidado;
        end;

     2: begin
           qryTemplate.ParamByName('PFLGTIPOCARTA').AsString := 'D';
           btnWord.Enabled := true;
           btnLimpaWord.Enabled := true;
           dsSql.DataSet := qryDiscriminado;
        end;
   end;

   qryTemplate.Open;
   qryTemplate.First;

   DBcboModeloAviso.LookupValue := IntToStr(qryTemplate.FieldByName('IDCARTACOBRANCA').AsInteger);
end;



procedure TcfgRelAvisoCobranca.qryCobrancaCalcFields(DataSet: TDataSet);
var
   sContratoExtenso  : string;
   sValExtenso       : string;
   fValorReajuste    : double;
   iDia, iMes, iAno  : word;
   iIndiceReajuste   : integer;
   iPeridodoReajuste : integer;
   dDataUltReajuste  : TDateTime;
   dDataMenosHum     : TDateTime;
   sDatasAnteriores  : String;
   sImovelLocado     : String;
begin
   inherited;

   // Marchetti - Pendencia 19889

   // Recupera as datas dos envios anteriores de aviso de cobrança
   sDatasAnteriores := '';
   LimpaParametros(qryEnviosAnteriores);
   qryEnviosAnteriores.ParamByName('PCODDOCUMENTO').AsInteger := qryCobrancaCODDOCUMENTO.AsInteger;
   qryEnviosAnteriores.Open;
   while not qryEnviosAnteriores.Eof do
   begin
      if sDatasAnteriores <> '' then sDatasAnteriores := sDatasAnteriores + ', ';
      sDatasAnteriores := sDatasAnteriores + FormatDateTime('dd/mm/yyyy',qryEnviosAnterioresEVIDATA.AsDateTime);
      qryEnviosAnteriores.Next;
   end;

   qryCobrancaDatasAnteriores.AsString := sDatasAnteriores;

   sImovelLocado    := '';
   LimpaParametros(qryImovelLocado);
   qryImovelLocado.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryCobrancaIDCONTRATOIMOVEL.AsInteger;
   qryImovelLocado.Open;
   while not qryImovelLocado.Eof do
   begin
      if sImovelLocado <> '' then sImovelLocado := sImovelLocado + ', ';
      sImovelLocado := sImovelLocado + qryImovelLocadoIMOVEL_LOCADO.AsString;
      qryImovelLocado.Next;
   end;

   qryCobrancaImovelLocado.AsString := sImovelLocado;
   // Fim Marchetti - Pendencia 19889

   // Gerar o aviso de reajuste se possuir reajuste dentro do mes
   qryCobrancaAVISO_REAJUSTE.AsString := '';
   DecodeDate(qryCobrancaCONDATAREAJUSTE.AsDateTime,iAno,iMes,iDia);
   if (iAno = DBspnAno.Value) and (iMes = cboMes.ItemIndex+1) then begin


{ TODO -oGleyber -cNovo : 04/05/2001 - Cálculo de percentual de reajuste utilizando a função CalculaFatorCorrecao }
      iIndiceReajuste   := qryCobrancaCONINDICEREAJUSTE.AsInteger;
      iPeridodoReajuste := qryCobrancaCONPERREAJUSTE.AsInteger;
      dDataUltReajuste  := DiasInUteis.SomaMeses(qryCobrancaCONDATAREAJUSTE.AsDateTime, (-1) * iPeridodoReajuste);
      dDataMenosHum     := DiasInUteis.SomaMeses(qryCobrancaCONDATAREAJUSTE.AsDateTime, (-1));
      fValorReajuste    := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dDataUltReajuste, dDataMenosHum, False);
      fValorReajuste    := (fValorReajuste-1)*100;

      qryCobrancaAVISO_REAJUSTE.AsString := 'Contrato Reajustado em '+formatfloat('0.00%',fValorReajuste);
   end;

   Extenso.Valor := qryCobrancaVALOR.AsFloat;
   Extenso.Escreve;
   sValExtenso := '( ' + Extenso.Extenso + ' )';
   qryCobrancaValorExtenso.AsString := sValExtenso;
   qryCobrancaMES.asString   := vNomeMes[qryCobrancaMESREFERENCIA.AsInteger] + '/' + FormatFloat('0000', qryCobrancaANOREFERENCIA.Value);

   // Contrato Extenso
   sContratoExtenso := '';
   if not(qryCobrancaCONNUMERO.isNULL) then sContratoExtenso := qryCobrancaCONNUMERO.asString;
   if ( (not(qryCobrancaCONNOME.isNULL)) and (sContratoExtenso<>'') ) then sContratoExtenso := sContratoExtenso + ' - ';
   if not(qryCobrancaCONNOME.isNULL) then sContratoExtenso := sContratoExtenso + ' - ' + qryCobrancaCONNOME.asString;
   qryCobrancaCONTRATOEXTENSO.asString   := sContratoExtenso;

   // Data limite para pagamento
   if qryCobrancaDATAVENCIMENTO.asDateTime = qryCobrancaDATACORRECAO.asDateTime then begin
      if qryCobrancaCONDIASTOLERANCIA.asInteger > 0 then begin
         if qryCobrancaFLGTIPODIATOLERA.asString = 'U' then begin
            qryCobrancaDATAPAGAMENTO.asDateTime := DiasInUteis.SomaDiasUteis(qryCobrancaDATAVENCIMENTO.asDateTime, qryCobrancaCONDIASTOLERANCIA.asInteger, qryCobrancaIDCIDADES.asInteger, qryCobrancaIDPAIS.asInteger, qryCobrancaCODESTADO.AsString, True, False, False);
         end else begin
            qryCobrancaDATAPAGAMENTO.asDateTime := qryCobrancaDATAVENCIMENTO.asDateTime + qryCobrancaCONDIASTOLERANCIA.asInteger;
         end;
      end else begin
         qryCobrancaDATAPAGAMENTO.asDateTime := qryCobrancaDATAVENCIMENTO.asDateTime;
      end;
   end;

   // Operação
   if qryCobrancaOPERACAO.asString = '2' then begin
      if qryCobrancaRECPAG.asString = 'R' then begin
          qryCobrancaDESCALC.asString := ''; //'A Receber'
      end else begin
          if qryCobrancaRECPAG.asString = 'P' then begin
             qryCobrancaDESCALC.asString := ''; // 'A Pagar';
          end;
      end;
   end else begin
      if qryCobrancaOPERACAO.asString = '5' then begin
         if qryCobrancaRECPAG.asString ='R' then begin
            qryCobrancaDESCALC.asString := 'Recebimento'
         end else begin
            if qryCobrancaRECPAG.asString = 'P' then begin
               qryCobrancaDESCALC.asString := 'Pagamento';
            end;
         end;
      end else begin
         if qryCobrancaOPERACAO.asString = '4' then begin
            qryCobrancaDESCALC.asString := qryCobrancaDESCRICAO.asString;
         end;
      end;
   end;

   qryCobrancaDATAATUAL.asString  := 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy', Date);
   qryCobrancaDATAMES.asString    := cboMes.Text;

   if molContrato1.iContrato <= 0 then
      BuscaImoveisContrato(qryCobrancaIDCONTRATOIMOVEL.AsInteger);

   qryCobrancaDESC.asString := memImoveis.text;
end;



procedure TcfgRelAvisoCobranca.bbtnConfirmarClick(Sender: TObject);
begin
   if VerificaPreenchimento then begin

      // Se o nome do modelo de relatório interno estiver definido executa as rotinas necessárias
      // para a montagem do no modelo especificado - Marcio Motta - 02/02/2004 - Pendência: 16015
      if (dbCboModeloAviso.Text <> '') then begin
         qryReports.Close;
         qryReports.ParamByName('PIDREPORTS').asInteger  := qryTemplate.FieldByName('IDREPORTS').asInteger;
         qryReports.ParamByName('PORIGEMCM').asInteger   := qryTemplate.FieldByName('ORIGEMCM').asInteger;
         qryReports.Open;

         memReports.Lines.Clear;
         memReports.Lines.Text := qryReports.FieldByName('TEMPLATE').asString;
         memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaCob);

         // acha e troca as referências ao pipeline antigo no arquivo de modelo aberto no MEMO
         ModeloRelatCM.SetaDataPipeline('cfgRelAvisoCobranca', 'pplConsulta', 'frmCadAvisoCobranca', 'ppConsulta', memReports);

         // salva em disco o arquivo com as alteracões
         memReports.Lines.SaveToFile(Sistema.TempDir + ArqCMCartaCob);

         // carrega o template e imprime o relatório
         rptImprime.Template.FileName := Sistema.TempDir + ArqCMCartaCob;
         rptImprime.Template.LoadFromFile;

         ModeloRelatCM.SetaDadosRpt(rptImprime, pplConsulta, ArqCMCartaCob);
      end;

      MontaQuery;

      // Verifica se dados foram retornados pela query - Marcio Motta - 02/02/2004 - Pendência: 16015
      case rdoModelo.ItemIndex of
         0 : if qryCobranca.IsEmpty then begin
                MsgDlg('Não existem dados para a emissão do relatório desejado!', 'Aviso', mtWarning, [mbOk], 0);
                Exit;
             end;

         1 : if qryConsolidado.IsEmpty then begin
                MsgDlg('Não existem dados para a emissão do relatório desejado!', 'Aviso', mtWarning, [mbOk], 0);
                Exit;
             end;

         2 : if qryDiscriminado.IsEmpty then begin
                MsgDlg('Não existem dados para a emissão do relatório desejado!', 'Aviso', mtWarning, [mbOk], 0);
                Exit;
             end;
      end;

      DesabilitaBotoes;

      // Se arquivo modelo do WORD for selecionado, imprime pelo WORD
      if edtWord.Text <> '' then begin
         ImprimeWord;
      //senão imprime direto pelo sistema
      end else begin
         TFrmPreview.CreateModalPreview( Self,
                                         rptImprime,
                                         rptImprime.PrinterSetup.DocumentName)
      end;

      if MsgDlg('Registra Evento para os Documentos?','Confirma',mtConfirmation,[mbYes,mbNo],0) = mrYes then begin
         GravaEvento;
      end;

      HabilitaBotoes;
   end;
end;



procedure TcfgRelAvisoCobranca.FormCreate(Sender: TObject);
begin
   inherited;
   sFiltroMS := dtmMS.MS_Contrato.Filtro.Text;
   dtmMS.MS_Contrato.Filtro.Add('C.FLGSTATUS = ''V''');

   // Inicializa os Frames (MOL)
   molContrato1.btnLimpaContratoClick(Self);
   molLocatario1.btnLimpaLocatarioClick(Self);

   ppRegisterForm(TppCustomPreviewer, TppPrintPreview);

   // abre a query de tipos de relatórios.
   MontaTemplate;

   // Cria e inicializa o Ctrl de Eventos
   CtrlEventoImovel := TCtrlEventoImovel.Create;
   CtrlEventoImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                               Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                               ComunsImobiliario.MensErroMT);
end;



procedure TcfgRelAvisoCobranca.FormShow(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex  := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value    := DiasInUteis.ExtraiAno(Date);

end;



procedure TcfgRelAvisoCobranca.cboMesChange(Sender: TObject);
begin
   inherited;
   // preenche a data de lançamento e o ano de referência/competência
   // edtDataVenc.Date  := DiasInUteis.UltDiaMes(StrToInt(IntToStr(trunc(DBspnAno.Value))), (cboMes.ItemIndex + 1));

   // Se mês competência for selecionada, desmarca Ignorar competência e limpa as datas do período de vencimento
   // Marcio Motta - 30/01/2004 - Pendência: 16015
   if cboMes.Text <> '' then begin
      chkIgnoraCompetencia.Checked := false;
      edtDataIni.Clear;
      edtDataFim.Clear;
   end;
end;



procedure TcfgRelAvisoCobranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil( CtrlEventoImovel );
   
   dtmMS.MS_Contrato.Filtro.Text := sFiltroMS;
   Release;
end;



procedure TcfgRelAvisoCobranca.qryConsolidadoCalcFields(DataSet: TDataSet);
var
   sContratoExtenso : string;
   sValExtenso      : string;
   fValorReajuste   : double;
   iDia, iMes, iAno : word;
{ TODO -oGleyber -cNovo : 04/05/2001 - Criadas variaveis para cálculo do índice. }
   iIndiceReajuste  : integer;
   iPeridodoReajuste: integer;
   dDataUltReajuste : TDateTime;
   dDataMenosHum    : TDateTime;
   sDatasAnteriores : String;
   sImovelLocado    : String;
begin
   inherited;

   // Marchetti - Pendencia 19889

   // Recupera as datas dos envios anteriores de aviso de cobrança
   sDatasAnteriores := '';
   LimpaParametros(qryEnviosAnteriores);
   qryEnviosAnteriores.ParamByName('PCODDOCUMENTO').AsInteger := qryConsolidadoCODDOCUMENTO.AsInteger;
   qryEnviosAnteriores.Open;
   while not qryEnviosAnteriores.Eof do
   begin
      if sDatasAnteriores <> '' then sDatasAnteriores := sDatasAnteriores + ', ';
      sDatasAnteriores := sDatasAnteriores + FormatDateTime('dd/mm/yyyy',qryEnviosAnterioresEVIDATA.AsDateTime);
      qryEnviosAnteriores.Next;
   end;

   qryConsolidadoDatasAnteriores.AsString := sDatasAnteriores;

   sImovelLocado    := '';
   LimpaParametros(qryImovelLocado);
   qryImovelLocado.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryConsolidadoIDCONTRATOIMOVEL.AsInteger;
   qryImovelLocado.Open;
   while not qryImovelLocado.Eof do
   begin
      if sImovelLocado <> '' then sImovelLocado := sImovelLocado + ', ';
      sImovelLocado := sImovelLocado + qryImovelLocadoIMOVEL_LOCADO.AsString;
      qryImovelLocado.Next;
   end;

   qryConsolidadoImovelLocado.AsString := sImovelLocado;

   // Fim Marchetti - Pendencia 19889


   // Gerar o aviso de reajuste se possuir reajuste dentro do mes
   qryConsolidadoAVISO_REAJUSTE.AsString := '';
   DecodeDate(qryConsolidadoCONDATAREAJUSTE.AsDateTime,iAno,iMes,iDia);
   if (iAno = DBspnAno.Value) and (iMes = cboMes.ItemIndex+1) then begin

{ TODO -oGleyber -cNovo : 04/05/2001 - Cálculo de percentual de reajuste utilizando a função CalculaFatorCorrecao }

      iIndiceReajuste   := qryConsolidadoCONINDICEREAJUSTE.AsInteger;
      iPeridodoReajuste := qryConsolidadoCONPERREAJUSTE.AsInteger;
      dDataUltReajuste  := DiasInUteis.SomaMeses(qryConsolidadoCONDATAREAJUSTE.AsDateTime, (-1) * iPeridodoReajuste);
      dDataMenosHum     := DiasInUteis.SomaMeses(qryConsolidadoCONDATAREAJUSTE.AsDateTime, (-1));
      fValorReajuste    := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dDataUltReajuste, dDataMenosHum, False);
      fValorReajuste    := (fValorReajuste-1)*100;

      qryConsolidadoAVISO_REAJUSTE.AsString := 'Contrato Reajustado em '+formatfloat('0.00%',fValorReajuste);
   end;

   Extenso.Valor := qryConsolidadoVALOR.AsFloat;
   Extenso.Escreve;
   sValExtenso := '( ' + Extenso.Extenso + ' )';
   qryConsolidadoValorExtenso.asString := sValExtenso;

   qryConsolidadoMES.asString   := vNomeMes[qryConsolidadoMESREFERENCIA.AsInteger] + '/' + FormatFloat('0000', qryConsolidadoANOREFERENCIA.Value);


   // Contrato Extenso
   sContratoExtenso := '';
   if not(qryConsolidadoCONNUMERO.isNULL) then sContratoExtenso := qryConsolidadoCONNUMERO.asString;
   if ( (not(qryConsolidadoCONNOME.isNULL)) and (sContratoExtenso<>'') ) then sContratoExtenso := sContratoExtenso + ' - ';
   if not(qryConsolidadoCONNOME.isNULL)     then sContratoExtenso := sContratoExtenso + qryConsolidadoCONNOME.asString;
   qryConsolidadoCONTRATOEXTENSO.asString   := sContratoExtenso;

   // Data limite para pagamento
   if qryConsolidadoDATAVENCIMENTO.asDateTime = qryConsolidadoDATACORRECAO.asDateTime then begin
      if qryConsolidadoCONDIASTOLERANCIA.asInteger > 0 then begin
         if qryConsolidadoFLGTIPODIATOLERA.asString = 'U' then begin
            qryConsolidadoDATAPAGAMENTO.asDateTime := DiasInUteis.SomaDiasUteis(qryConsolidadoDATAVENCIMENTO.asDateTime, qryConsolidadoCONDIASTOLERANCIA.asInteger, qryConsolidadoIDCIDADES.asInteger, qryConsolidadoIDPAIS.asInteger, qryConsolidadoCODESTADO.AsString, True, False, False);
         end else begin
            qryConsolidadoDATAPAGAMENTO.asDateTime := qryConsolidadoDATAVENCIMENTO.asDateTime + qryConsolidadoCONDIASTOLERANCIA.asInteger;
         end;
      end else begin
         qryConsolidadoDATAPAGAMENTO.asDateTime := qryConsolidadoDATAVENCIMENTO.asDateTime;
      end;
   end;

   // Operação
   if qryConsolidadoOPERACAO.asString = '2' then begin
      if qryConsolidadoRECPAG.asString = 'R' then begin
          qryConsolidadoDESCALC.asString := ''; //'A Receber'
      end else begin
          if qryConsolidadoRECPAG.asString = 'P' then begin
             qryConsolidadoDESCALC.asString := ''; // 'A Pagar';
          end;
      end;
   end else begin
      if qryConsolidadoOPERACAO.asString = '5' then begin
         if qryConsolidadoRECPAG.asString ='R' then begin
            qryConsolidadoDESCALC.asString := 'Recebimento'
         end else begin
            if qryConsolidadoRECPAG.asString = 'P' then begin
               qryConsolidadoDESCALC.asString := 'Pagamento';
            end;
         end;
      end else begin
         if qryConsolidadoOPERACAO.asString = '4' then begin
            qryConsolidadoDESCALC.asString := qryConsolidadoDESCRICAO.asString;
         end;
      end;
   end;

   qryConsolidadoDATAATUAL.asString  := 'Rio de Janeiro, ' + FormatDateTime('dd "de" mmmm "de" yyyy', Date);
   qryConsolidadoDATAMES.asString    := cboMes.Text;

   if molContrato1.iContrato <= 0 then
      BuscaImoveisContrato(qryConsolidadoIDCONTRATOIMOVEL.AsInteger);

   qryConsolidadoDESC.asString := memImoveis.text;
end;



procedure TcfgRelAvisoCobranca.rdoModeloClick(Sender: TObject);
begin
   inherited;
   MontaTemplate;
end;



procedure TcfgRelAvisoCobranca.qryDiscriminadoCalcFields(DataSet: TDataSet);
var
   sContratoExtenso : string;
   sValExtenso      : string;
   fValorContrato   : Currency;
   fValorReajuste   : double;
   iDia, iMes, iAno : word;

{ TODO -oGleyber -cNovo : 04/05/2001 - Criadas variaveis para cálculo do índice. }
   iIndiceReajuste  : integer;
   iPeridodoReajuste: integer;
   dDataUltReajuste : TDateTime;
   dDataMenosHum    : TDateTime;
   sDatasAnteriores : String;
   sImovelLocado    : String;
begin
   inherited;


   // Marchetti - Pendencia 19889

   // Recupera as datas dos envios anteriores de aviso de cobrança
   sDatasAnteriores := '';
   LimpaParametros(qryEnviosAnteriores);
   qryEnviosAnteriores.ParamByName('PCODDOCUMENTO').AsInteger := qryDiscriminadoCODDOCUMENTO.AsInteger;
   qryEnviosAnteriores.Open;
   while not qryEnviosAnteriores.Eof do
   begin
      if sDatasAnteriores <> '' then sDatasAnteriores := sDatasAnteriores + ', ';
      sDatasAnteriores := sDatasAnteriores + FormatDateTime('dd/mm/yyyy',qryEnviosAnterioresEVIDATA.AsDateTime);
      qryEnviosAnteriores.Next;
   end;

   qryDiscriminadoDatasAnteriores.AsString := sDatasAnteriores;

   sImovelLocado    := '';
   LimpaParametros(qryImovelLocado);
   qryImovelLocado.ParamByName('PIDCONTRATOIMOVEL').AsInteger := qryDiscriminadoIDCONTRATOIMOVEL.AsInteger;
   qryImovelLocado.Open;
   while not qryImovelLocado.Eof do
   begin
      if sImovelLocado <> '' then sImovelLocado := sImovelLocado + ', ';
      sImovelLocado := sImovelLocado + qryImovelLocadoIMOVEL_LOCADO.AsString;
      qryImovelLocado.Next;
   end;

   qryDiscriminadoImovelLocado.AsString := sImovelLocado;

   // Fim Marchetti - Pendencia 19889


   // Gerar o aviso de reajuste se possuir reajuste dentro do mes
   qryDiscriminadoAVISO_REAJUSTE.AsString := '';
   DecodeDate(qryDiscriminadoCONDATAREAJUSTE.AsDateTime, iAno, iMes, iDia);

   if (iAno = DBspnAno.Value) and (iMes = cboMes.ItemIndex+1) then begin

{ TODO -oGleyber -cNovo : 04/05/2001 - Cálculo de percentual de reajuste utilizando a função CalculaFatorCorrecao }
//    calcula o percentual de reajuste - NOVO

      iIndiceReajuste   := qryDiscriminadoCONINDICEREAJUSTE.AsInteger;
      iPeridodoReajuste := qryDiscriminadoCONPERREAJUSTE.AsInteger;
      dDataUltReajuste  := DiasInUteis.SomaMeses(qryDiscriminadoCONDATAREAJUSTE.AsDateTime, (-1) * iPeridodoReajuste);
      dDataMenosHum     := DiasInUteis.SomaMeses(qryDiscriminadoCONDATAREAJUSTE.AsDateTime, (-1));
      fValorReajuste    := FuncoesImob.CalculaFatorCorrecao(iIndiceReajuste, dDataUltReajuste, dDataMenosHum, False);
      fValorReajuste    := (fValorReajuste-1)*100;

      qryDiscriminadoAVISO_REAJUSTE.AsString := 'Contrato Reajustado em ' + FormatFloat('0.00%', fValorReajuste);
   end;

   fValorContrato := qryDiscriminadoVALOR.AsCurrency + qryDiscriminadoVALOR_CORRMON.AsCurrency + qryDiscriminadoVALOR_JUROS.AsCurrency + qryDiscriminadoVALOR_MULTA.AsCurrency - qryDiscriminadoVALOR_BAIXA.AsCurrency;
   Extenso.Valor := fValorContrato;
   Extenso.Escreve;
   sValExtenso := '( ' + Extenso.Extenso + ' )';

   qryDiscriminadoValorTotal.AsCurrency := fValorContrato;
   qryDiscriminadoValorExtenso.asString := sValExtenso;
   qryDiscriminadoMes.asString := vNomeMes[qryDiscriminadoMESCOMPETENCIA.AsInteger] + '/' + FormatFloat('0000', qryDiscriminadoANOCOMPETENCIA.AsInteger);

   // Contrato Extenso
   sContratoExtenso := '';
   if not(qryDiscriminadoCONNUMERO.isNULL) then sContratoExtenso := qryDiscriminadoCONNUMERO.asString;
   if ( (not(qryDiscriminadoCONNOME.isNULL)) and (sContratoExtenso<>'') ) then sContratoExtenso := sContratoExtenso + ' - ';
   if not(qryDiscriminadoCONNOME.isNULL) then sContratoExtenso := sContratoExtenso + ' - ' + qryDiscriminadoCONNOME.AsString;
   qryDiscriminadoContratoExtenso.asString := sContratoExtenso;

   if molContrato1.iContrato <= 0 then
      BuscaImoveisContrato(qryDiscriminadoIDCONTRATOIMOVEL.AsInteger);

   qryDiscriminadoDESC.asString := memImoveis.text;
end;



procedure TcfgRelAvisoCobranca.btnWordClick(Sender: TObject);
begin
   inherited;
   if dlgWord.Execute then begin
      edtWord.Text := dlgWord.FileName;

      // Se escolhido um modelo de documento WORD para a impressão do recibo, limpa o modelo
      // de relatório - Marcio Motta - 30/01/2004 - Pendência: 16015
      if dbCboModeloAviso.Text <> '' then
         dbCboModeloAviso.Clear;
   end;
end;



procedure TcfgRelAvisoCobranca.btnLimpaWordClick(Sender: TObject);
begin
   inherited;
   edtWord.Clear;
end;



procedure TcfgRelAvisoCobranca.edtWordChange(Sender: TObject);
begin
  inherited;
  chkVisualiza.Enabled := edtWord.Text <> '';
end;



procedure TcfgRelAvisoCobranca.chkIgnoraCompetenciaClick(Sender: TObject);
begin
  inherited;
  // Se Ignorar Competência estiver marcado, limpa o conteúdo ref. a competência
  // Marcio Motta - 30/01/2004 - Pendência: 16015
  if chkIgnoraCompetencia.Checked then begin
     cboMes.ItemIndex := -1;
     dbSpnAno.Clear;
  end;
end;

procedure TcfgRelAvisoCobranca.DBspnAnoChange(Sender: TObject);
begin
  inherited;
   // Se ano competência for selecionada, desmarca Ignorar competência e limpa as datas do período de vencimento
   // Marcio Motta - 30/01/2004 - Pendência: 16015
   if dbSpnAno.Text <> '' then begin
      chkIgnoraCompetencia.Checked := false;
      edtDataIni.Clear;
      edtDataFim.Clear;
   end;
end;

procedure TcfgRelAvisoCobranca.molLocatario1btnBuscaLocatarioClick(
  Sender: TObject);
begin
  inherited;
  molLocatario1.btnBuscaLocatarioClick(Sender);

  // Se escolhido um Locatário, inicializa o Frame(MOL) de contratos
  // Marcio Motta - 30/01/2004 - Pendência: 16015
  molContrato1.btnLimpaContratoClick(Self);

  // Busca o próximo modelo de carta
  BuscaModeloAutomatico;
end;

procedure TcfgRelAvisoCobranca.molContrato1btnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContrato1.btnBuscaContratoClick(Sender);

  // Preenche o nome do locatário responsável pelo contrato
  // Marcio Motta - 30/01/2004 - Pendência: 16015
  molLocatario1.edtLocatario.Text := molContrato1.sNomeLocatario;

  //  Busca a relação de imóveis do Contrato
  BuscaImoveisContrato(molContrato1.iContrato);

  // Busca o próximo modelo de carta
  BuscaModeloAutomatico;

end;

procedure TcfgRelAvisoCobranca.edtDataFimCloseUp(Sender: TObject);
begin
  inherited;
  // Se existir data de fim, apaga mês e ano de competência
  // Marcio Motta - 30/01/2004 - Pendência: 16015
  if self.Text <> '' then begin
     cboMes.ItemIndex := -1;
     dbSpnAno.Clear;
  end;
end;

procedure TcfgRelAvisoCobranca.edtDataIniCloseUp(Sender: TObject);
begin
  inherited;
  // Se existir data de início, apaga mês e ano de competência
  // Marcio Motta - 30/01/2004 - Pendência: 16015
  if edtDataIni.Text <> '' then begin
     cboMes.ItemIndex := -1;
     dbSpnAno.Clear;
  end;
end;

procedure TcfgRelAvisoCobranca.BuscaImoveisContrato(const iIdContrato: Integer);
var
   iIdImovel: integer;
begin
// Seleciona os imóveis do contrato e lista no memo
// Marcio Motta - 30/01/2004 - Pendência: 16015

   Screen.Cursor           := crHourGlass;
   with qryNomesImovel do begin
      LimpaParametros(qryNomesImovel);
      ParamByName('CONTRATO').asInteger := iIdContrato;
      Open;

      First;
      memImoveis.Lines.Clear;
      iIdImovel := -1;
      while not(EOF) do begin
         if (iIdImovel <>  qryNomesImovelIDIMOVELMESTRE.AsInteger) then begin
            memImoveis.Lines.Text := memImoveis.Lines.Text + qryNomesImovelNOME_MESTRE.AsString + ': '+qryNomesImovelNOME_IMOVEL.AsString;
            iIdImovel := qryNomesImovelIDIMOVELMESTRE.AsInteger;
         end else begin
            memImoveis.Lines.Text := memImoveis.Lines.Text +' / ' + qryNomesImovelNOME_IMOVEL.AsString;
         end;
         Next;
      end;
   end;
   Screen.Cursor := crDefault;
end;

procedure TcfgRelAvisoCobranca.DBcboModeloAvisoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Se for selecionado um modelo de relatório, apaga conteúdo ref. ao modelo de arquivo WORD
  // e a opção de visualização - Marcio Motta - 30/01/2004 - Pendência: 16015
   if Trim(DbCboModeloAviso.Text) <> '' then begin
      edtWord.Clear;
      chkVisualiza.Checked := False;
   end;
end;

procedure TcfgRelAvisoCobranca.GravaEvento;
var iCodDocumento : Integer;
begin
   case rdoModelo.ItemIndex of
      0 : if not qryCobranca.IsEmpty then begin
             qryCobranca.First;
             iCodDocumento := -1;
             while not qryCobranca.Eof do begin
                if qryCobrancaCODDOCUMENTO.AsInteger <> iCodDocumento then begin
                   CtrlEventoImovel.RegistraEvento(-1,-1,-1,qryCobrancaCODDOCUMENTO.AsInteger,
                                                   Sistema.IdUsuario, 'CC', DBcboModeloAviso.Text,
                                                   memEvento.Text, Date(), -1, -1, 0, 0, 0, True,
                                                   'N', 0, qryTemplateIDCARTACOBRANCA.AsInteger);
                   iCodDocumento := qryCobrancaCODDOCUMENTO.AsInteger;
                end;
                qryCobranca.Next;
             end;
          end;

      1 : if not qryConsolidado.IsEmpty then begin
             qryConsolidado.First;
             iCodDocumento := -1;
             while not qryConsolidado.Eof do begin
                if qryConsolidadoCODDOCUMENTO.AsInteger <> iCodDocumento then begin
                   CtrlEventoImovel.RegistraEvento(-1,-1,-1,qryConsolidadoCODDOCUMENTO.AsInteger,
                                                   Sistema.IdUsuario, 'CC', DBcboModeloAviso.Text,
                                                   memEvento.Text, Date(), -1, -1, 0, 0, 0, True,
                                                   'N', 0, qryTemplateIDCARTACOBRANCA.AsInteger);
                   iCodDocumento := qryConsolidadoCODDOCUMENTO.AsInteger;
                end;
                qryConsolidado.Next;
             end;
          end;

      2 : if not qryDiscriminado.IsEmpty then begin
             qryDiscriminado.First;
             iCodDocumento := -1;
             while not qryDiscriminado.Eof do begin
                if qryDiscriminadoCODDOCUMENTO.AsInteger <> iCodDocumento then begin
                   CtrlEventoImovel.RegistraEvento(-1,-1,-1,qryDiscriminadoCODDOCUMENTO.AsInteger,
                                                   Sistema.IdUsuario, 'CC', DBcboModeloAviso.Text,
                                                   memEvento.Text, Date(), -1, -1, 0, 0, 0, True,
                                                   'N', 0, qryTemplateIDCARTACOBRANCA.AsInteger);
                   iCodDocumento := qryDiscriminadoCODDOCUMENTO.AsInteger;
                end;
                qryDiscriminado.Next;
             end;
          end;
   end;
end;

function TcfgRelAvisoCobranca.BuscaModeloAutomatico: Integer;
var iIdUltCarta, iIdProxCarta : Integer;
begin
   Result := -1;
   if (molContrato1.iContrato > 0) or (molLocatario1.iLocatario > 0) then begin
      LimpaParametros(qryBuscaModelo);
      if molContrato1.iContrato > 0   then qryBuscaModelo.ParamByName('IDCONTRATOIMOVEL').AsInteger := molContrato1.iContrato ;
      if molLocatario1.iLocatario > 0 then qryBuscaModelo.ParamByName('IDFORCLI').AsInteger := molLocatario1.iLocatario;
      qryBuscaModelo.Open;

      if qryBuscaModelo.IsEmpty then begin
         iIdProxCarta := ModuloImobiliario.AdminImob.iIdCartaCobranca1;
      end else begin
         iIdUltCarta := qryBuscaModeloIDCARTACOBRANCA.AsInteger;
         if iIdUltCarta = ModuloImobiliario.AdminImob.iIdCartaCobranca1 then
            iIdProxCarta := ModuloImobiliario.AdminImob.iIdCartaCobranca2;
         if iIdUltCarta = ModuloImobiliario.AdminImob.iIdCartaCobranca2 then
            iIdProxCarta := ModuloImobiliario.AdminImob.iIdCartaCobranca3;
         if iIdUltCarta = ModuloImobiliario.AdminImob.iIdCartaCobranca3 then
            iIdProxCarta := ModuloImobiliario.AdminImob.iIdCartaCobranca4;
         if iIdUltCarta = ModuloImobiliario.AdminImob.iIdCartaCobranca4 then
            iIdProxCarta := ModuloImobiliario.AdminImob.iIdCartaCobranca4;
      end;
      Result := iIdProxCarta;

      if iIdProxCarta > 0 then begin
         LimpaParametros(qryTemplate);
         qryTemplate.ParamByName('PIDCARTACOBRANCA').AsInteger := iIdProxCarta;
         qryTemplate.Open;
         if qryTemplate.FieldByName('FLGTIPOCARTA').AsString = 'I' then rdoModelo.ItemIndex := 0;
         if qryTemplate.FieldByName('FLGTIPOCARTA').AsString = 'S' then rdoModelo.ItemIndex := 1;
         if qryTemplate.FieldByName('FLGTIPOCARTA').AsString = 'D' then rdoModelo.ItemIndex := 2;
         DBcboModeloAviso.LookupValue := IntToStr(iIdProxCarta);
      end;
   end;
end;

end.
