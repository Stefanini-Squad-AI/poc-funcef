unit FTransferePerfilInves;

{-------------------------------------------------------------------------------
--------------------------------------------------------------------------------
N.Chamado.....: WO30317
Dt.Alteração..: 06/01/2026
Responsável...: Paulo Nobre
Descrição.....: Na função "MontaSQLDados", inclusão do CAST no campo CPF_MASCARA
---------------------------------------------------------------------------------
Pendência   : SIG118263
Responsável : Ewerton Beltramini
Data        : 12/11/2021
Descrição   : Acrescentar a liberação de incluir os itens 133 e 138 para todos
              os casos, com exceção do que estão em PERDA EFETIVA.
--------------------------------------------------------------------------------
Alterações  : MontaSQLDados
Pendência   : 67062
Responsável : Edilaine
Data        : 11/05/2018
Descrição   : não busca itens de transferência para contratos quitados por morte
--------------------------------------------------------------------------------
Alterações  : (.dfm  udpHME) TransfereItens, MontaSQLTransferidos, PeriodoContabilBloqueado
              ProximoPeriodo
Pendência   : 61284
Responsável : Edilaine
Data        : 09/01/2018
Descrição   : os itens de transferência devem ser lançados sempre no último dia
              do mês referência
--------------------------------------------------------------------------------
Alterações  : criação da funcionalidade
Pendência   : SIG56660
Responsável : Edilaine
Data        : 22/11/2017
Descrição   : Transfere de Perfil de Investimentos na contabilização de contratos

================================================================================
obs: para carregar campos no cdsTransf
- altere a consulta em qryTransfDados
- botao direito sobre o cdsTransf e selecionar "Assign Local Data..."
- selecione o objeto qryTransfDados
- botao direito sobre o cdsTransf e selecionar "Fields Editor..."
- botao direito no Fields Editor e selecionar "Add Fields..." e escolher campo
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ExtCtrls, StdCtrls, Wwdbspin, Mask, wwdbedit, Wwdotdot,
  Wwdbcomb, mListaPlano, mListaPatro, mContratoEmptmo, wwdblook, fcLabel,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, Db, DBTables, Wwquery, uCtrlPadroes,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppVar, ppPrnabl,
  ppBands, ppCache, ppDB, ppDBPipe, ppDBBDE, TB97Ctls, ImgList, fPreviewExport,
  uCtrlContab, Provider, DBClient, uCMClientDataSet, ComObj;

type
  TSelecaoDados = (sdMarcaTudo, sdDesmarcaTudo);
  TfrmTransferePerfilInvest = class(TfrmSairAjuda)
    fcLabel1: TfcLabel;
    nbPrincipal: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    DBcboTipoEmptmo: TwwDBLookupCombo;
    DBcboTipoContrato: TwwDBLookupCombo;
    molContratoEmptmo: TmolContratoEmptmo;
    molListaPatro: TmolListaPatro;
    molListaPlano: TmolListaPlano;
    dbcboMes: TwwDBComboBox;
    dbspnAno: TwwDBSpinEdit;
    btnCarregar: TBitBtn;
    mmoResult: TMemo;
    Panel2: TPanel;
    mmoErro: TMemo;
    Panel1: TPanel;
    btnVoltar: TBitBtn;
    btnImprimir: TBitBtn;
    Bevel1: TBevel;
    Panel3: TPanel;
    mmoInfTransf: TMemo;
    btnContinuar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    chkListaTransf: TCheckBox;
    pnlgrid: TPanel;
    pnlSelecao: TPanel;
    grdTransf: TwwDBGrid;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnDesfaz: TBitBtn;
    bbtnImpReg: TBitBtn;
    qryTransfDados: TwwQuery;
    qryAux: TwwQuery;
    rpRelatorioTransf: TppReport;
    bndCabecalho: TppHeaderBand;
    bndDetalhe: TppDetailBand;
    bndRodape: TppFooterBand;
    ppLabel16: TppLabel;
    lbl_Titulo: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLine9: TppLine;
    ppLabel28: TppLabel;
    ppLabel41: TppLabel;
    ppLabel37: TppLabel;
    ppImage2: TppImage;
    lbl_Periodo: TppLabel;
    ppMutuario: TppLabel;
    ppMatricula: TppLabel;
    ppContrato: TppLabel;
    ppPlanoOri: TppLabel;
    ppPlanoDest: TppLabel;
    ppSaldoInad: TppLabel;
    ppSaldoDev: TppLabel;
    ppSaldoTot: TppLabel;
    ppRelatorioTransf: TppBDEPipeline;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    dbMutuario: TppDBText;
    dbMatricula: TppDBText;
    dbContrato: TppDBText;
    dbPlanoOri: TppDBText;
    dbPlanoDest: TppDBText;
    dbSdInad: TppDBText;
    dbSdDev: TppDBText;
    dbSdTotal: TppDBText;
    ppLine1: TppLine;
    lbl_Rodape: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    qryTransfDadosMUTUARIO: TStringField;
    qryTransfDadosMATRICULA: TStringField;
    qryTransfDadosCPF: TStringField;
    qryTransfDadosPLANONOME: TStringField;
    qryTransfDadosNOMEPERFIL_SAIDA: TStringField;
    qryTransfDadosNOMEPERFIL_ENTRADA: TStringField;
    qryTransfDadosPLANOCONTAB_SAI: TStringField;
    qryTransfDadosPLANOCONTAB_ENTRA: TStringField;
    qryTransfDadosIDPERFIL_SAIDA: TFloatField;
    qryTransfDadosIDPERFIL_ENTRADA: TFloatField;
    qryTransfDadosCONTRATO: TFloatField;
    qryTransfDadosMODALIDADE: TStringField;
    qryTransfDadosSITUACAO: TStringField;
    qryTransfDadosSALDOTRANSF: TFloatField;
    qryTransfDadosSALDOINAD: TFloatField;
    qryTransfDadosSALDOTOTAL: TFloatField;
    qryTransfDadosNUMPARCVENCE: TFloatField;
    qryTransfDadosVLRPARCVENCE: TFloatField;
    qryTransfDadosDTFIM: TDateTimeField;
    qryTransfDadosDATACREDITO: TDateTimeField;
    ImlPadrao: TImageList;
    btnMarca: TToolbarButton97;
    qryTransfDadosTRANSFERIDO: TStringField;
    qryInsert: TwwQuery;
    qryBuscaItens: TwwQuery;
    qryTransfDadosFLGESCOLHA: TFloatField;
    qryDelete: TwwQuery;
    qryHME: TwwQuery;
    udpHME: TUpdateSQL;
    qryDesfaz: TwwQuery;
    qryTransfDadosCPF_MASCARA: TStringField;
    dbTransferido: TppDBText;
    cdsTransf: TCMClientDataSet;
    dsTransf: TDataSource;
    cdsTransfFLGESCOLHA: TFloatField;
    cdsTransfMUTUARIO: TStringField;
    cdsTransfMATRICULA: TStringField;
    cdsTransfCPF: TStringField;
    cdsTransfPLANONOME: TStringField;
    cdsTransfNOMEPERFIL_SAIDA: TStringField;
    cdsTransfNOMEPERFIL_ENTRADA: TStringField;
    cdsTransfPLANOCONTAB_SAI: TStringField;
    cdsTransfPLANOCONTAB_ENTRA: TStringField;
    cdsTransfCONTRATO: TFloatField;
    cdsTransfMODALIDADE: TStringField;
    cdsTransfSITUACAO: TStringField;
    cdsTransfSALDOTRANSF: TFloatField;
    cdsTransfSALDOINAD: TFloatField;
    cdsTransfSALDOTOTAL: TFloatField;
    cdsTransfNUMPARCVENCE: TFloatField;
    cdsTransfVLRPARCVENCE: TFloatField;
    cdsTransfDTFIM: TDateTimeField;
    cdsTransfDATACREDITO: TDateTimeField;
    cdsTransfTRANSFERIDO: TStringField;
    cdsTransfIDPERFIL_SAIDA: TFloatField;
    cdsTransfIDPERFIL_ENTRADA: TFloatField;
    cdsTransfCPF_MASCARA: TStringField;
    qryTransfDadosSALDO_PROV_PERDA: TFloatField;
    qryTransfDadosIDTRANSPERFILINVEST: TFloatField;
    cdsTransfSALDO_PROV_PERDA: TFloatField;
    cdsTransfIDTRANSPERFILINVEST: TFloatField;
    chkIncErro: TCheckBox;
    btnHabFiltro: TBitBtn;
    SaveDlg: TSaveDialog;
    procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
    procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
    procedure molListaPlanobtnInvertePlanoClick(Sender: TObject);
    procedure molListaPlanobtnMarcaTodosPlanoClick(Sender: TObject);
    procedure molContratoEmptmobtnBuscaContratoClick(Sender: TObject);
    procedure molContratoEmptmobtnLimpaContratoClick(Sender: TObject);
    procedure DBcboTipoEmptmoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure DBcboTipoEmptmoExit(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnDesfazClick(Sender: TObject);
    procedure mmoInfTransfChange(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure bbtnImpRegClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure lbl_PeriodoPrint(Sender: TObject);
    procedure btnMarcaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsTransfAfterOpen(DataSet: TDataSet);
    procedure btnHabFiltroClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
    iAnoSel, iMesSel : Integer;
    dDataIni         : TDateTime;
    sAnoMes          : string; 
    sDataLanca       : string;
    sLinhaDados      : string;

    bItemComValor : Boolean;

    bPermissaoFaz    : Boolean;
    bPermissaoDesfaz : Boolean;
    StatusSelecao    : TSelecaoDados;

    rVlrPrevisto     : Extended;

    Sheet    : Variant;
    Contab   : TCtrlContab;

    function  MontaSQLDados(const sData: String; iIdContrato : integer = 0): String;
    function  MontaSQLContab(const sData: String) : string;
    function  MontaSQLItens(const sData: String; idContrato : double) : string;
    function  MontaSQLTransferidos(const sData: String; idContrato : double) : string;
    function  PeriodoContabilBloqueado : boolean;

    procedure AbreQueriesFiltro;
    procedure CarregaDados(bTelaInicio: Boolean = false);
    procedure ProximoPeriodo;
    procedure MarcaDesmarcaItens;
    procedure BloqueiaFiltro( bBloqueio : Boolean);
    procedure MontaArquivoExcel;

    procedure TransfereItens;
    procedure Contabiliza;

  public
    { Public declarations }
  end;

var
  frmTransferePerfilInvest: TfrmTransferePerfilInvest;

implementation

{$R *.DFM}

uses
   uFuncoesEmptmo, uSistema, dLookEmptmo, uVerificaPreenchimento, dEmptmo,
   uLancContab, uMensErro, dBaseDados, uIntegraEmptmo, uDatabase, UTypesEmptmo,
   UDiasUteis;

   
function iif(condicao : boolean; sVerdade, sFalso : string) : string;     overload;
begin
  if condicao then Result := sVerdade
              else Result := sFalso;
end;

//edilaine - SIG61284 - inicio
function iif(condicao : boolean; iVerdade, iFalso : integer) : integer;   overload;
begin
  if condicao then Result := iVerdade
              else Result := iFalso;
end;
//edilaine - SIG61284 - fim

function TfrmTransferePerfilInvest.MontaSQLTransferidos(
  const sData: String; idContrato: double): string;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT  '                                                                             + #13 +
   '   NVL(CONTAB.PLNCODIGO, 0) AS PLNCODIGO,                '                            + #13 +
   '   ITC.FLGTRANSPERFIL, ITC.FLGTIPOITEM, ITC.ITCEVENTO,   '                            + #13 +
   '   ITC.FLGCENTRALIZA, ITC.FLGDESTACADO, ITC.IDITEMEMPTMO,'                            + #13 +
   '   HME.IDHISTMOVEMPTMO,   '                                                           + #13 +
   '   HME.IDCONTRATOEMPTMO,  '                                                           + #13 +
   '   HME.IDITEMEMPTMO,      '                                                           + #13 +
   '   HME.HMETIPOMOV,        '                                                           + #13 +
   '   HME.HMEORIGEM,         '                                                           + #13 +
   '   HME.HMEDATAATUALIZA,   '                                                           + #13 +
   '   HME.HMECENTRALIZA,     '                                                           + #13 +
   '   HME.HMEDESTACADO,      '                                                           + #13 +
   '   HME.FLGENTRADAMANUAL,  '                                                           + #13 +
   '   HME.VERSAO,            '                                                           + #13 +
   '   HME.HMERECPAG,         '                                                           + #13 +
   '   HME.HMEVLRPREVISTO,    '                                                           + #13 +
   '   HME.FLGENVIO,          '                                                           + #13 +
   '   HME.FLGBAIXADO,        '                                                           + #13 +
   '   HME.HMEVLREFETIVO,     '                                                           + #13 +
   '   HME.HMEDATAEFETIVA,    '                                                           + #13 +
   '   HME.HMEDATAPREVISTA,   '                                                           + #13 +
   '   HME.HMESALDODEV,       '                                                           + #13 +
   '   HME.HMESEQCOBRANCA,    '                                                           + #13 +  //edilaine - SIG61284
   '   DECODE(HME.HMETIPOMOV, 0, ''HMECONCESSAO'',      '                                 + #13 +
   '                          1, ''HMEPRESTACAO'',      '                                 + #13 +
   '                          2, ''HMEAMORTIZACAO'',    '                                 + #13 +
   '                          3, ''HMEQUITACAO'',       '                                 + #13 +
   '                          4, ''HMEENCARGOS'',       '                                 + #13 +
   '                          5, ''HMEATUDIARIA'',      '                                 + #13 +
   '                          6, ''HMEMIGRACAO'',       '                                 + #13 +
   '                          7, ''HMEAJUSTECOBRANCA'', '                                 + #13 +
   '                          8, ''HMEAJUSTESALDODEV'' ) AS DOMINIO '                     + #13 +
   'FROM  '                                                                               + #13 +
   '     HISTMOVEMPTMO HME   '                                                            + #13 +
   'JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO    '           + #13 +
   'JOIN ITEMXTIPOCONTR ITC  ON HME.IDITEMEMPTMO = ITC.IDITEMEMPTMO           '           + #13 +
   '                        AND ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '           + #13 +
   '                        AND ITC.FLGTRANSPERFIL IS NOT NULL                '           + #13 +
   'JOIN TRANSPERFILINVEST TP ON TP.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO   '           + #13 +
   '                         AND TP.MESANOCOMPET = '+Quotedstr(sData)                     + #13 +
   'LEFT JOIN HMECONTABILIZACAO CONTAB ON CONTAB.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO '  + #13 +

   'WHERE '                                                                               + #13 +
   '      CON.IDCONTRATOEMPTMO  = '+FloatToStr(IDContrato)                                + #13 +
   '  AND TO_CHAR(HME.HMEDATAPREVISTA, ''YYYY/MM'') = '+Quotedstr(sData)                  + #13 +

   'ORDER BY 1 desc '                                                                     + #13;
   Result := sSQL;
end;


function TfrmTransferePerfilInvest.MontaSQLItens(const sData: String; idContrato: double): string;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT  '                                                                             + #13 +
   '       ITC.FLGTRANSPERFIL, '                                                          + #13 +
   '       ITC.FLGTIPOITEM,    '                                                          + #13 +
   '       ITC.FLGCENTRALIZA,  '                                                          + #13 +
   '       ITC.FLGDESTACADO,   '                                                          + #13 +
   '       ITC.IDITEMEMPTMO,   '                                                          + #13 +
   '       ITC.ITCEVENTO,      '                                                          + #13 +
   '       CON.IDPLANOPREV,    '                                                          + #13 +
   '       CON.IDPLANOORIGEM   '                                                          + #13 +
   '      ,CON.FLGPERDAEFETIVA '                                                          + #13 +    //SIG118263
   '   FROM CONTRATOEMPTMO  CON                                                     '     + #13 +
   '   JOIN TIPOCONTREMPTMO TCE ON CON.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO    '     + #13 +
   '   JOIN ITEMXTIPOCONTR  ITC ON ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO    '     + #13 +
   '                           AND ITC.FLGTRANSPERFIL IS NOT NULL                   '     + #13 +
   '  WHERE CON.IDCONTRATOEMPTMO = '+FloatToStr(IDContrato)                               + #13;

   Result := sSQL;
end;


function TfrmTransferePerfilInvest.MontaSQLContab(const sData: String): string;
var
  sSQL : string;
begin
  sSQL :=
   'SELECT  '                                                                             + #13 +
   '   HME.HMEDATAPREVISTA,   '                                                           + #13 +
   '   HME.IDHISTMOVEMPTMO,   '                                                           + #13 +
   '   HME.IDCONTRATOEMPTMO,  '                                                           + #13 +
   '   HME.IDITEMEMPTMO,      '                                                           + #13 +
   '   ITE.ITEDESCRICAO,      '                                                           + #13 +
   '   HME.HMEVLRPREVISTO,    '                                                           + #13 +
   '   HME.HMEVLREFETIVO,     '                                                           + #13 +
   '   HME.HMEFORMACOBRANCA,  '                                                           + #13 +
   '   CON.IDTIPOCONTREMPTMO, '                                                           + #13 +
   '   DECODE(ITC.FLGTRANSPERFIL, ''S'', TP.IDPERFILINVESTANT, '                          + #13 +
   '                                     TP.IDPERFILINVESTATU) AS IDPLANOORIGEM, '        + #13 +
   '   CON.IDPLANOPREV,       '                                                           + #13 +
   '   CON.IDPATRO,           '                                                           + #13 +
   '   ITC.TIPCODIGO,         '                                                           + #13 +
   '   PIE.PLANO,             '                                                           + #13 +
   '   PIE.CCDEBFOLHA,        '                                                           + #13 +
   '   PIE.CCCREDFOLHA,       '                                                           + #13 +
   '   PIE.CCUSTDEBFOLHA,     '                                                           + #13 +
   '   PIE.CCUSTCREDFOLHA,    '                                                           + #13 +
   '   PIE.SUBCDEBFOLHA,      '                                                           + #13 +
   '   PIE.SUBCCREDFOLHA,     '                                                           + #13 +
   '   PIE.TIPORECDESFOLHA,   '                                                           + #13 +
   '   PIE.CCDEBFINAN,        '                                                           + #13 +
   '   PIE.CCUSTDEBFINAN,     '                                                           + #13 +
   '   PIE.SUBCDEBFINAN,      '                                                           + #13 +
   '   PIE.CCCREDFINAN,       '                                                           + #13 +
   '   PIE.CCUSTCREDFINAN,    '                                                           + #13 +
   '   PIE.SUBCCREDFINAN,     '                                                           + #13 +
   '   PIE.RECPAGFOLHA,       '                                                           + #13 +
   '   PIE.TIPORECDESFINAN,   '                                                           + #13 +
   '   PIE.RECPAGFINAN,       '                                                           + #13 +
   '   PIE.UNIDNEGOC,         '                                                           + #13 +
   '   PIE.CODCENTRORESPON    '                                                           + #13 +
   'FROM                      '                                                           + #13 +
   '   HISTMOVEMPTMO HME      '                                                           + #13 +
   '   JOIN CONTRATOEMPTMO CON ON CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO   '         + #13 +
   '   JOIN ITEMXTIPOCONTR ITC ON ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '         + #13 +
   '                          AND ITC.IDITEMEMPTMO = HME.IDITEMEMPTMO           '         + #13 +
   '                          AND ITC.FLGTRANSPERFIL IS NOT NULL                '         + #13 +

   '   JOIN TIPOCONTREMPTMO TCE ON TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '        + #13 +
   '   JOIN TIPOEMPTMO TEP ON TEP.IDTIPOEMPTMO = TCE.IDTIPOEMPTMO                '        + #13 +

   '   JOIN ITEMEMPTMO ITE ON HME.IDITEMEMPTMO = ITE.IDITEMEMPTMO                '        + #13 +
   '   JOIN PARAMINTEGRAEP PIE ON PIE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO  '        + #13 +
   '                          AND PIE.IDITEMEMPTMO = HME.IDITEMEMPTMO            '        + #13 +

   '   JOIN TRANSPERFILINVEST TP ON TP.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO   '        + #13 +
   '                            AND TP.MESANOCOMPET = '+Quotedstr(sData)                  + #13 +

   '   LEFT JOIN HMECONTABILIZACAO CONTAB ON CONTAB.IDHISTMOVEMPTMO = HME.IDHISTMOVEMPTMO'+ #13 +

   'WHERE '                                                                               + #13 +
   '       TEP.IDEMPRESAPROP = 1   '                                                      + #13 +
   '   AND HME.HMEVLRPREVISTO <> 0 '                                                      + #13 +
   '   AND TO_CHAR(HME.HMEDATAPREVISTA, ''YYYY/MM'') = '+Quotedstr(sData)                 + #13 +
   '   AND CON.IDPATRO      IN (' + molListaPatro.PegaPatro + ') '                        + #13 +
   '   AND CON.IDPLANOPREV  IN (' + molListaPlano.PegaPlano + ') '                        + #13 +
   '   AND CONTAB.PLNCODIGO IS NULL '                                                     + #13 +
   '   AND NVL(ITC.FLGNAOCONTAB, 0) = 0  '                                                + #13 +
   '   AND (NVL(CON.FLGPERDAEFETIVA,0) = 0 OR '                                           + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND ITC.FLGCONTABILIZAPERDAEFETIVA = 1) OR  '         + #13 +
   '       (CON.FLGPERDAEFETIVA = 1 AND HME.HMEDATAPREVISTA <= CON.DATAPERDAEFETIVA))'    + #13;

   if (molContratoEmptmo.IDContrato > 0) then
      sSQL := sSQL + '   AND CON.IDCONTRATOEMPTMO = '+FloatToStr(molContratoEmptmo.IDContrato);

   if DBcboTipoEmptmo.LookupValue <> '' then
      sSQL := sSQL + '   AND TEP.IDTIPOEMPTMO = '+ DBcboTipoEmptmo.LookupValue;

   if DBcboTipoContrato.LookupValue <> '' then
      sSQL := sSQL + '   AND CON.IDTIPOCONTREMPTMO = '+ DBcboTipoContrato.LookupValue;

   Result := sSQL;
end;

function TfrmTransferePerfilInvest.MontaSQLDados(const sData: String; iIdContrato : integer = 0): String;
var
  sSQL : string;
  sCampoIdTransf : string;
begin
  if chkListaTransf.Checked then
     sCampoIdTransf := 'TPI.IDTRANSPERFILINVEST,'
  else
     sCampoIdTransf := '0 AS IDTRANSPERFILINVEST,';

  sSQL :=
   'SELECT  '                                                                             + #13 +
   '       1 AS FLGESCOLHA,        '                                                      + #13 +
   '       PE.NOME AS MUTUARIO,    '                                                      + #13 +
   '       D.MATRICULA,            '                                                      + #13 +
   // Paulo Nobre - WO30317 - Inicio
   '       CAST(DECODE(PE.NUMDOCUMENTO, NULL, NULL, '                                          + #13 +
   '                               TRANSLATE(TO_CHAR(PE.NUMDOCUMENTO/100,''000,000,000.00''),'',.'',''.-'')) AS VARCHAR2(14)) AS CPF_MASCARA, ' + #13 +
   // Paulo Nobre - WO30317 - Fim
   '       PE.NUMDOCUMENTO AS CPF, '                                                      + #13 +
   '       PP.NOME AS  PLANONOME,  '                                                      + #13 +
   '       PXE.NOMEPERFIL_SAIDA,   '                                                      + #13 +
   '       PXE.NOMEPERFIL_ENTRADA, '                                                      + #13 +
   '       PXE.PLANOCONTAB_SAI,    '                                                      + #13 +
   '       PXE.PLANOCONTAB_ENTRA,  '                                                      + #13 +
   '       PXE.IDPERFIL_SAIDA,     '                                                      + #13 +
   '       PXE.IDPERFIL_ENTRADA,   '                                                      + #13 +
   '       CON.IDCONTRATOEMPTMO AS CONTRATO,  '                                           + #13 +
   '       TEP.DESCTIPOEMPTMO AS MODALIDADE,  '                                           + #13 +
   '       DECODE(CON.FLGSITUACAO, ''A'', ''Ativo'',        '                             + #13 +
   '                               ''C'', ''Cancelado'',    '                             + #13 +
   '                               ''E'', ''Encerrado'',    '                             + #13 +
   '                               ''Q'', ''Quitado'',      '                             + #13 +
   '                               ''R'', ''Refinanciado'', '                             + #13 +
   '                               ''S'', ''Suspenso'',     '                             + #13 +
   '                               ''P'', ''Pendente de Liberação'',  '                   + #13 +
   '                               ''K'', ''Pendente de Quitação'', '''') AS SITUACAO, '  + #13 +
   '       NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPTMO, LAST_DAY(PXE.DTFIM)),0) SALDOTRANSF,     ' + #13 +
   '       NVL(CM.PCK_EMPRESTIMO.FN_SALDOINADIMPLENTE(CON.IDCONTRATOEMPTMO, LAST_DAY(PXE.DTFIM)+1),0) SALDOINAD,' + #13 +
   '       NVL((SELECT SUM(DECODE(HA.IDITEMEMPTMO,56,HA.VLRPREVISTO, -HA.VLRPREVISTO))     '  + #13 +
   '          FROM HMEATUDIARIA HA                                                     '  + #13 +
   '         WHERE HA.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO                          '  + #13 +
   '           AND HA.IDITEMEMPTMO IN (56,71,129)                                      '  + #13 +
   '           AND TO_CHAR(HA.DATAPREVISTA,''YYYY/MM'') <= TO_CHAR(PXE.DTFIM,''YYYY/MM'') '  + #13 +
   '           AND HA.FLGESTORNADO = 0),0) AS SALDO_PROV_PERDA,                        '  + #13 +
   '       (NVL(CM.PCK_EMPRESTIMO.FN_SALDODEVEDOR(CON.IDCONTRATOEMPTMO, LAST_DAY(PXE.DTFIM)),0)+  '  + #13 +
   '        NVL(CM.PCK_EMPRESTIMO.FN_SALDOINADIMPLENTE(CON.IDCONTRATOEMPTMO, LAST_DAY(PXE.DTFIM)+1),0)) AS SALDOTOTAL, '  + #13 +
   '       (SELECT COUNT(*)                                                            '  + #13 +
   '          FROM HMEPRESTACAO HP                                                     '  + #13 +
   '         WHERE HP.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO                          '  + #13 +
   '           AND HP.FLGQUITABONOESTORNO = 0                                          '  + #13 +
   '           AND HP.VLREFETIVO IS NULL                                               '  + #13 +
   '           AND HP.NATUREZAITEM = 2                                                 '  + #13 +
   '           AND TO_CHAR(HP.DATAPREVISTA,''YYYY/MM'') < TO_CHAR(PXE.DTFIM,''YYYY/MM'')) NUMPARCVENCE, '  + #13 +
   '       NVL(CON.VLRPARCATRASO,0) AS VLRPARCVENCE,   '                                  + #13 +
   '       PXE.DTFIM,           '                                                         + #13 +
   '       CON.DATACREDITO,     '                                                         + #13 +
   '       '+sCampoIdTransf                                                               + #13 +
   '       ''.'' AS TRANSFERIDO '                                                         + #13 +
   '    FROM                  '                                                           + #13 +
   '       CONTRATOEMPTMO CON '                                                           + #13 +
   '       JOIN PESSOA PE ON PE.IDPESSOA = CON.IDBENEF   '                                + #13 +
   '       JOIN DEPENTIT D ON D.IDTITULAR = CON.IDPESSOA '                                + #13 +
   '                      AND D.IDPESSOA = CON.IDBENEF   '                                + #13 +
   '       JOIN PLANPREV PP ON PP.IDPLANOPREV = CON.IDPLANOPREV '                         + #13 +
                                                                                          
   '       JOIN (SELECT TF.PLANOCONTAB_ENTRA,         '                                   + #13 +
   '                         TF.PLANOCONTAB_SAI,      '                                   + #13 +
   '                         TF.NOMEPERFIL_ENTRADA,   '                                   + #13 +
   '                         TF.NOMEPERFIL_SAIDA,     '                                   + #13 +
   '                         TF.IDPERFIL_ENTRADA,     '                                   + #13 +
   '                         TF.IDPERFIL_SAIDA,       '                                   + #13 +
   '                         TF.DTFIM,                '                                   + #13 +
   '                         TF.IDPESSOA,             '                                   + #13 +
   '                         TF.IDPLANOPREV,          '                                   + #13 +
   '                         TF.IDPESSJUR             '                                   + #13 +
   '                  FROM CM.VW_EMP_TRANSFPERFIL TF  '                                   + #13 +
   '                 WHERE TO_CHAR(TF.DTFIM, ''YYYY/MM'') = '+Quotedstr(sData)            + #13 +
   '            ) PXE ON PXE.IDPESSOA    = CON.IDPESSOA     '                             + #13 +
   '                 AND PXE.IDPLANOPREV = CON.IDPLANOPREV  '                             + #13 +
   '                 AND PXE.IDPESSJUR   = CON.IDPATRO      '                             + #13 +
   '       JOIN TIPOCONTREMPTMO TCE ON TCE.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '    + #13 +
   '       JOIN TIPOEMPTMO TEP ON TEP.IDTIPOEMPTMO = TCE.IDTIPOEMPTMO '                   + #13;

   if chkListaTransf.Checked then
      sSQL := sSQL +
      '       JOIN TRANSPERFILINVEST TPI ON TPI.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO'  + #13 +
      '                                 AND TPI.MESANOCOMPET = '+Quotedstr(sData)         + #13;
   sSQL := sSQL +
   '    WHERE '                                                                           + #13 +
   '           TEP.IDEMPRESAPROP = 1  '                                                   + #13 +
   '       AND CON.DATACREDITO <= PXE.DTFIM  '                                            + #13 +
   '       AND CON.IDPATRO      IN (' + molListaPatro.PegaPatro + ') '                    + #13 +
   '       AND CON.IDPLANOPREV  IN (' + molListaPlano.PegaPlano + ') '                    + #13 +

   '       AND CON.FLGSITUACAO <> ''C''  '                                                + #13 +
   '       AND (CON.FLGSITUACAO IN (''A'',''K'',''E'') OR '                               + #13 +
   '           (CON.FLGSITUACAO = ''Q'' AND               '                               + #13 +
   //edilaine - SIG67062 - inicio
   //'          TO_CHAR(PXE.DTFIM, ''YYYY/MM'') < (SELECT TO_CHAR(MAX(HME.DATAPREVISTA),''YYYY/MM'') ' + #13 +
   '            TO_CHAR(PXE.DTFIM, ''YYYY/MM'') <= (SELECT TO_CHAR(MAX(HME.DATAPREVISTA),''YYYY/MM'') ' + #13 +
   //edilaine - SIG67062 - fim
   '                                                 FROM HMEQUITACAO HME              '  + #13 +
   '                                                WHERE NVL(HME.FLGESTORNADO,0) = 0  '  + #13 +
   '                                                  AND HME.NATUREZAITEM = 2         '  + #13 +
   '                                                  AND HME.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO))) ' + #13 +

   '       AND EXISTS (SELECT 1 '                                                         + #13 +
   '                     FROM PERFILINVXELEG PIE  '                                       + #13 +
   '                    WHERE TO_CHAR(PIE.DTFIM,''YYYY/MM'') = '+Quotedstr(sData)         + #13 +
   '                      AND PIE.IDPESSOA    = CON.IDPESSOA     '                        + #13 +
   '                      AND PIE.IDPLANOPREV = CON.IDPLANOPREV  '                        + #13 +
   '                      AND PIE.IDPESSJUR   = CON.IDPATRO)     '                        + #13 +

   '       AND EXISTS (SELECT 1  '                                                        + #13 +
   '                     FROM ITEMXTIPOCONTR  ITC  '                                      + #13 +
   '                    WHERE ITC.IDTIPOCONTREMPTMO = CON.IDTIPOCONTREMPTMO '             + #13 +
   '                      AND ITC.FLGTRANSPERFIL IS NOT NULL ) '                          + #13;

   if not chkListaTransf.Checked then
      sSQL := sSQL +
   '       AND NOT EXISTS (SELECT 1 '                                                     + #13 +
   '                      FROM TRANSPERFILINVEST TP '                                     + #13 +
   '                     WHERE TP.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO '               + #13 +
   '                       AND TP.MESANOCOMPET = '+Quotedstr(sData)+')'                   + #13;

   if (iIdContrato = -1) then
      sSQL := sSQL + '   AND CON.IDCONTRATOEMPTMO = -1 ' + #13
   else if (molContratoEmptmo.IDContrato > 0) then
      sSQL := sSQL + '   AND CON.IDCONTRATOEMPTMO = '+FloatToStr(molContratoEmptmo.IDContrato) + #13;

   if DBcboTipoEmptmo.LookupValue <> '' then
      sSQL := sSQL + '   AND TEP.IDTIPOEMPTMO = '+ DBcboTipoEmptmo.LookupValue  + #13;

   if DBcboTipoContrato.LookupValue <> '' then
      sSQL := sSQL + '   AND CON.IDTIPOCONTREMPTMO = '+ DBcboTipoContrato.LookupValue   + #13;

   sSQL := sSQL + ' ORDER BY PE.NOME ';
   
   Result := sSQL;
end;


procedure TfrmTransferePerfilInvest.molListaPatrobtnInvertePatroClick(
  Sender: TObject);
begin
  inherited;
  molListaPatro.btnInvertePatroClick(Sender);
end;

procedure TfrmTransferePerfilInvest.molListaPatrobtnMarcaTodosPatroClick(
  Sender: TObject);
begin
  inherited;
  molListaPatro.btnMarcaTodosPatroClick(Sender);
end;

procedure TfrmTransferePerfilInvest.molListaPlanobtnInvertePlanoClick(
  Sender: TObject);
begin
  inherited;
  molListaPlano.btnInvertePlanoClick(Sender);
end;

procedure TfrmTransferePerfilInvest.molListaPlanobtnMarcaTodosPlanoClick(
  Sender: TObject);
begin
  inherited;
  molListaPlano.btnMarcaTodosPlanoClick(Sender);
end;

procedure TfrmTransferePerfilInvest.molContratoEmptmobtnBuscaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnBuscaContratoClick(Sender);
end;

procedure TfrmTransferePerfilInvest.molContratoEmptmobtnLimpaContratoClick(
  Sender: TObject);
begin
  inherited;
  molContratoEmptmo.btnLimpaContratoClick(Sender);
end;

procedure TfrmTransferePerfilInvest.DBcboTipoEmptmoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;

procedure TfrmTransferePerfilInvest.DBcboTipoEmptmoExit(Sender: TObject);
begin
  inherited;
   // seleciona apenas os Tipos de Contrato do Tipo de Empréstimo selecionado
   with dtmLookEmptmo.qryLookTipoContr do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoContr);

      if DBcboTipoEmptmo.LookupValue <> '' then
      begin
         ParamByName('PIDTIPOEMPTMO').AsInteger    := StrToInt(DBcboTipoEmptmo.LookupValue);
         ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
         Open;

         DBcboTipoContrato.Enabled := True;
      end
      else
      begin
         DBcboTipoContrato.Enabled := False;
      end;
   end;
end;

procedure TfrmTransferePerfilInvest.btnCarregarClick(Sender: TObject);
begin
  inherited;

  if UFuncoesEmptmo.bBuscaMutuario then
  begin
    MessageBox(handle,'O processo não poderá ser executado.'+#13#10+
                      'O usuário é o próprio mutuário do '+
                      'contrato de empréstimo!','Atenção',MB_ICONWARNING + MB_OK);
    Abort;
  end;


  if (dbcboMes.Text = '') or (dbspnAno.Text = '') then
  begin
    MsgDlg('É obrigatório informar o Mês/Ano de Competência!', 'Empréstimo', mtError, [mbOk], 0);
    Repaint;
    if dbcboMes.Text = '' then
       dbcboMes.SetFocus
    else
       dbspnAno.SetFocus;
       
    Exit;
  end;

  //----------------------------------------------------------------------------
  // Carrega dados
  //----------------------------------------------------------------------------

  CarregaDados();
  BloqueiaFiltro(True);

  StatusSelecao := sdMarcaTudo;
  btnMarca.ImageIndex := 10;

  bbtnConfirmar.Enabled := (not chkListaTransf.Checked) and (not cdsTransf.IsEmpty) and (bPermissaoFaz);
  bbtnDesfaz.Enabled    := (chkListaTransf.Checked) and (not cdsTransf.IsEmpty) and (bPermissaoDesfaz);
  bbtnImpReg.Enabled    := (not cdsTransf.IsEmpty);
end;


procedure TfrmTransferePerfilInvest.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  iAnoSel := Word(Trunc(dbspnAno.Value));
  iMesSel := (dbcboMes.ItemIndex + 1);

  cdsTransf.DisableControls;
  cdsTransf.Filtered := false;
  cdsTransf.Filter   := 'FLGESCOLHA = 1';
  cdsTransf.Filtered := True;
  try
    if cdsTransf.IsEmpty then
    begin
      MsgDlg('É necessário selecionar pelo menos um registro.', 'Empréstimo', mtError, [mbOk], 0);
      exit;
    end;
  finally
    cdsTransf.Filtered := false;
    cdsTransf.Filter   := '';
    cdsTransf.EnableControls;
  end;

  if PeriodoContabilBloqueado() then
  begin
    if MsgDlg( 'Período fechado! Deseja realizar a transferência no próximo período?', 'Empréstimo', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
       ProximoPeriodo()
    else
       Exit;
  end;

  TB97oKCancelar.Visible := false;

  nbPrincipal.PageIndex := 1;
end;


procedure TfrmTransferePerfilInvest.TransfereItens;
begin

  sLinhaDados := '';

  // abre consulta para insert das movimentações
  qryHME.Close;
  qryHME.Sql.Text := MontaSQLTransferidos(sAnoMes, -1);
  qryHME.Open;

  if not qryInsert.Prepared then
     qryInsert.Prepare;

  {filtra so selecionados}
  cdsTransf.Filtered := false;
  cdsTransf.Filter   := 'FLGESCOLHA = 1';
  cdsTransf.Filtered := True;

  while not cdsTransf.Eof do
  begin

   //Mutuário                       Matrícula CPF            Plano Previdenciário           Nome Perfil Anterior
   //------------------------------ --------- -------------- ------------------------------ ----------------------------
   //OEMJSAUCTM EURTIWGAPK          0194990   055.028.960-72 REG/REPLAN                     PERFIL REG REPLAN SALDADO

    sLinhaDados := UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('MUTUARIO').AsString,        ' ', 31) +
                   UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('MATRICULA').AsString,       ' ', 09) +
                   UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('CPF_MASCARA').AsString,     ' ', 16) +
                   UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('PLANONOME').AsString,       ' ', 31) +
                   UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('NOMEPERFIL_SAIDA').AsString,' ', 30);

    {faz a transferencia de planos dos itens}
    try
      qryBuscaItens.Close;
      qryBuscaItens.sql.clear;
      qryBuscaItens.SQL.Text := MontaSQLItens(cdsTransf.FieldByName('DTFIM').AsString, cdsTransf.FieldByName('CONTRATO').AsFloat);
      qryBuscaItens.open;

(*    (Descomentar bloco abaixo: Caso seja preciso limitar as inclusões, a quando só existirem algum rVlrPrevisto maior que zero.
       Tb descomentar a linha no if de verificação logo abaixo, antes do insert (variavel de controle: bItemComValor))

      //Ewerton Beltramini - 12/11/2021 - SIG118263 - Inicio... (Verifica se existe algum lançamento maior que zero)
      bItemComValor := False;
      while not qryBuscaItens.eof do
      begin
            rVlrPrevisto := 0;
            case qryBuscaItens.FieldByName('FLGTIPOITEM').AsInteger of
                  1: rVlrPrevisto := cdsTransf.FieldByName('SALDOTRANSF').asFloat;
                  2: rVlrPrevisto := cdsTransf.FieldByName('SALDOINAD').asFloat;
                  3: rVlrPrevisto := cdsTransf.FieldByName('SALDO_PROV_PERDA').asFloat;
            end;

            if (rVlrPrevisto <> 0) then
                bItemComValor := True;

            qryBuscaItens.next;
      end;

      qryBuscaItens.First;
      //Ewerton Beltramini - 12/11/2021 - SIG118263 - Fim.
*)

      qryHME.CancelUpdates;

      while not qryBuscaItens.eof do
      begin

        case qryBuscaItens.FieldByName('FLGTIPOITEM').AsInteger of
          1: rVlrPrevisto := cdsTransf.FieldByName('SALDOTRANSF').asFloat;
          2: rVlrPrevisto := cdsTransf.FieldByName('SALDOINAD').asFloat;
          3: rVlrPrevisto := cdsTransf.FieldByName('SALDO_PROV_PERDA').asFloat;
        end;

        if (rVlrPrevisto <> 0)
           or (    (qryBuscaItens.FieldByName('IDITEMEMPTMO').AsInteger in [133,138])                //Ewerton Beltramini - 12/11/2021 - SIG118263
               //and (bItemComValor) (só permite entrar quando existe algum valor maior de zero)     //Ewerton Beltramini - 12/11/2021 - SIG118263
               and (qryBuscaItens.FieldByName('FLGPERDAEFETIVA').AsInteger <> 1) ) then              //Ewerton Beltramini - 12/11/2021 - SIG118263
        begin
          qryHME.Insert;
          //sequence
          {dtmEmptmo.qrySeqHistMov.Open;
          qryHME.FieldByName('IDHISTMOVEMPTMO').AsFloat := dtmEmptmo.qrySeqHistMovSEQHISTMOVEMPTMO.AsFloat;
          dtmEmptmo.qrySeqHistMov.Close; }

          qryHME.FieldByName('IDCONTRATOEMPTMO').AsFloat    := cdsTransf.FieldByName('CONTRATO').AsFloat;
          qryHME.FieldByName('IDITEMEMPTMO').AsInteger      := qryBuscaItens.FieldByName('IDITEMEMPTMO').AsInteger;
          qryHME.FieldByName('HMETIPOMOV').AsInteger        := qryBuscaItens.FieldByName('ITCEVENTO').AsInteger;
          qryHME.FieldByName('HMEORIGEM').AsInteger         :=  12;  //manual
          qryHME.FieldByName('HMEDATAATUALIZA').AsString    := sDataLanca;
          qryHME.FieldByName('HMECENTRALIZA').AsInteger     := qryBuscaItens.FieldByName('FLGCENTRALIZA').AsInteger;
          qryHME.FieldByName('HMEDESTACADO').AsInteger      := qryBuscaItens.FieldByName('FLGDESTACADO').AsInteger;
          qryHME.FieldByName('FLGENTRADAMANUAL').AsInteger  :=  1;
          qryHME.FieldByName('VERSAO').AsString             := Sistema.Versao;
          qryHME.FieldByName('HMERECPAG').AsString          := '';
          qryHME.FieldByName('HMEVLRPREVISTO').AsCurrency   := rVlrPrevisto;
          qryHME.FieldByName('FLGENVIO').AsString           := '';
          qryHME.FieldByName('FLGBAIXADO').AsString         := '';
          qryHME.FieldByName('HMEVLREFETIVO').AsCurrency    := rVlrPrevisto;
          qryHME.FieldByName('HMEDATAEFETIVA').AsString     := sDataLanca;
          qryHME.FieldByName('HMEDATAPREVISTA').AsString    := sDataLanca;
          qryHME.FieldByName('HMESALDODEV').AsCurrency      := cdsTransf.FieldByName('SALDOTRANSF').AsCurrency;
          qryHME.FieldByName('HMESEQCOBRANCA').AsInteger    := 1;     //edilaine - SIG61284
          qryHME.Post;
        end;

        qryBuscaItens.next;
      end;

      //efetiva lançamentos
      qryHME.ApplyUpdates;

      mmoResult.Lines.Add( sLinhaDados );

      cdsTransf.Edit;
      cdsTransf.FieldByName('TRANSFERIDO').AsString := 'S';
      cdsTransf.Post;
except
      cdsTransf.Edit;
      cdsTransf.FieldByName('TRANSFERIDO').AsString := 'N';
      cdsTransf.Post;

      qryHME.CancelUpdates;

      mmoErro.Lines.Add( sLinhaDados );
    end;

    cdsTransf.next;
  end;

  cdsTransf.first;
  cdsTransf.Filtered := false;
  cdsTransf.Filter   := '(FLGESCOLHA = 1) AND (TRANSFERIDO = ''S'')';
  cdsTransf.Filtered := True;
  while not cdsTransf.eof do
  begin
    {Registra os parametros da transferencia na TRANSFPERFI}
    qryInsert.close;
    qryInsert.ParamByName('PERFILANT').AsInteger  := cdsTransf.FieldByName('IDPERFIL_SAIDA').AsInteger;
    qryInsert.ParamByName('PERFILATU').AsInteger  := cdsTransf.FieldByName('IDPERFIL_ENTRADA').AsInteger;
    qryInsert.ParamByName('IDCONTRATO').Asfloat   := cdsTransf.FieldByName('CONTRATO').AsFloat;
    qryInsert.ParamByName('MESANO').AsString      := Copy(sDataLanca,7,4)+'/'+Copy(sDataLanca,4,2);
    qryInsert.ParamByName('INFORMACAO').AsString  := mmoInfTransf.Text;
    qryInsert.ExecSQL;

    cdsTransf.next;
  end;
end;



procedure TfrmTransferePerfilInvest.btnContinuarClick(Sender: TObject);
begin
  inherited;

  try
    (* limpa os memos de resultado e erro *)
    mmoResult.Clear;
    mmoErro.Clear;

    dDataIni := Now;
    mmoResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmoResult.Lines.Add(' ');

    mmoResult.Lines.Add(' ');
    mmoResult.Lines.Add('Mutuário                       Matrícula CPF            Plano Previdenciário           Nome Perfil Anterior        ');
    mmoResult.Lines.Add('------------------------------ --------- -------------- ------------------------------ ----------------------------');

    mmoErro.Lines.Add(' ');
    mmoErro.Lines.Add('Mutuário                       Matrícula CPF            Plano Previdenciário           Nome Perfil Anterior        ');
    mmoErro.Lines.Add('------------------------------ --------- -------------- ------------------------------ ----------------------------');
    mmoErro.WordWrap := false;

    MostraEspera('Realizando Transferência de Perfis de Investimentos');

    try
       cdsTransf.DisableControls;

       StartTransacao;

       {Busca itens para transferencia}
       TransfereItens();

       {Contabiliza itens gerados na transferencia}
//       Contabiliza();

       CommitTransacao;
    except
       RollbackTransacao;
    end;

  finally
    EscondeEspera;

    mmoResult.Lines.Add(' ');
    mmoResult.Lines.Add('Final do Processo      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmoResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

    cdsTransf.Filtered := false;
    cdsTransf.Filter   := '';
    cdsTransf.First;
    cdsTransf.EnableControls;

    nbPrincipal.PageIndex := 2;
  end;

end;


procedure TfrmTransferePerfilInvest.btnVoltarClick(Sender: TObject);
begin
  inherited;

  TB97oKCancelar.Visible := true;
  nbPrincipal.PageIndex  := 0;
end;

procedure TfrmTransferePerfilInvest.FormShow(Sender: TObject);
begin
  inherited;

  ParametrosSistema;

  nbPrincipal.PageIndex := 0;

  //edilaine - SIG61284 - inicio
  dbcboMes.ItemIndex := iif(DiasUteis.ExtraiMes(date) = 1, 11, DiasUteis.ExtraiMes(date)-2);
  dbspnAno.Value     := DiasUteis.ExtraiAno(date) - iif(DiasUteis.ExtraiMes(date) = 1, 1, 0);
  //edilaine - SIG61284 - fim

  bPermissaoFaz    := bbtnConfirmar.Enabled;
  bPermissaoDesfaz := bbtnDesfaz.Enabled;

  AbreQueriesFiltro();

  CarregaDados(True);

  bbtnConfirmar.Enabled := (not chkListaTransf.Checked) and (not cdsTransf.IsEmpty) and (bPermissaoFaz);
  bbtnDesfaz.Enabled    := (chkListaTransf.Checked) and (not cdsTransf.IsEmpty) and (bPermissaoDesfaz);
end;

procedure TfrmTransferePerfilInvest.CarregaDados(bTelaInicio: Boolean = false);
var
  sSQLDados : string;
  iAno      : Integer;
  iMes      : integer;
begin
  iAno    := Word(Trunc(dbspnAno.Value));
  iMes    := (dbcboMes.ItemIndex + 1);
  sAnoMes := IntToStr(iAno)+'/'+CompletaInicio( IntToStr(iMes), '0', 2);

  cdsTransf.close;

  if chkListaTransf.Checked then
     sSQLDados := MontaSQLDados(sAnoMes)
  else if bTelaInicio then
     sSQLDados := MontaSQLDados(sAnoMes, -1)
  else
     sSQLDados := MontaSQLDados(sAnoMes);

  try
    cdsTransf.Data := Contab.GetDataPacket( sSQLDados);
  except
    MsgDlg('Erro ao Carregar Dados!', 'Empréstimo', mtError, [mbOk], 0);
    Repaint;
    Exit;
  end;
end;

function TfrmTransferePerfilInvest.PeriodoContabilBloqueado : Boolean;
var
  sMsgContab : string;
  iEmpresa   : integer;
begin

  // Chamada da função TestaPeríodo para verificar se pode(m) ser lançada(s) planilha(s) de
  // transferência no período indicado
  sMsgContab := '';
  iEmpresa   := Sistema.idEmpresa;

  //edilaine - SIG61284 - inicio
  {sDataLanca  := DateToStr( DiasUteis.UltDiaUtilMes(Sistema.idEmpresa,
                                                    iAnoSel,
                                                    iMesSel,
                                                    true,      // bConsideraBancario
                                                    true,      // bConsideraExtraordinario
                                                    true));    // bSabadoUtil }

  sDataLanca  := DateToStr( DiasUteis.UltDiaMes(iAnoSel,iMesSel) );
  //edilaine - SIG61284 - fim

  Result := TestaPeriodo(False, 'BaseDados', sDataLanca, '15', iAnoSel, iMesSel, iEmpresa, sMsgContab) <> 0;

end;


procedure TfrmTransferePerfilInvest.bbtnDesfazClick(Sender: TObject);
var
  lstContab, s : string;
begin
  inherited;

  iAnoSel := Word(Trunc(dbspnAno.Value));
  iMesSel := (dbcboMes.ItemIndex + 1);
  if PeriodoContabilBloqueado() then
  begin
     MsgDlg('Período fechado! Não é possível desfazer a transferência', 'Empréstimo', mtInformation, [mbOk], 0);
     Exit;
  end;

  sLinhaDados := '';

  try
    (* limpa os memos de resultado e erro *)
    mmoResult.Clear;
    mmoErro.Clear;
    mmoErro.WordWrap := true;

    dDataIni := Now;
    mmoResult.Lines.Add('Início do Processo: ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmoResult.Lines.Add(' ');

    mmoResult.Lines.Add(' ');
    mmoResult.Lines.Add('Mutuário                       Matrícula CPF            Plano Previdenciário           Nome Perfil Anterior        ');
    mmoResult.Lines.Add('------------------------------ --------- -------------- ------------------------------ ----------------------------');

    lstContab := '';
    
    MostraEspera('Realizando Desfaz Transferência de Perfis de Investimentos');

    try
       if qryHME.UpdatesPending then
          qryHME.CancelUpdates;

       StartTransacao;

       {filtra so selecionados}
       cdsTransf.DisableControls;
       cdsTransf.Filtered := false;
       cdsTransf.Filter   := 'FLGESCOLHA = 1';
       cdsTransf.Filtered := True;

       while not cdsTransf.Eof do
       begin

         sLinhaDados := UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('MUTUARIO').AsString,        ' ', 31) +
                        UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('MATRICULA').AsString,       ' ', 09) +
                        UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('CPF_MASCARA').AsString,     ' ', 16) +
                        UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('PLANONOME').AsString,       ' ', 31) +
                        UFuncoesEmptmo.CompletaFim(cdsTransf.FieldByName('NOMEPERFIL_SAIDA').AsString,' ', 30);

         {desfaz a transferencia de planos dos itens}
         try
           qryHME.Close;
           qryHME.Sql.Text := MontaSQLTransferidos(sAnoMes, cdsTransf.FieldByName('CONTRATO').AsFloat);
           qryHME.open;

           {só desfaz se nao contabilizou}
           if qryHME.FieldByName('PLNCODIGO').AsInteger = 0 then
           begin
             {só desfaz se nao contabilizou}
             while not qryHME.eof do
             begin
               {desfaz contabilizacao
               if (qryHME.FieldByName('PLNCODIGO').AsString <> '') and
                  (Pos('.'+qryHME.FieldByName('PLNCODIGO').AsString+'.', lstPlanilha) = 0) then
               begin
                 IntegraEmptmo.DesfazContabilizacaoPorPlanilha(qryHME.FieldByName('PLNCODIGO').AsFloat, True);
                 lstPlanilha := lstPlanilha + '.'+qryHME.FieldByName('PLNCODIGO').AsString+'.';
               end; }

               {desfaz movimento}
               qryAux.Close;
               qryAux.SQL.Text := 'DELETE FROM '+qryHME.FieldByName('DOMINIO').AsString +
                                  ' WHERE IDHISTMOVEMPTMO = '+ qryHME.FieldByName('IDHISTMOVEMPTMO').AsString;
               qryAux.ExecSQL;

               qryHME.Next;
             end;

             {Desfaz TRANSPERFILINVEST}
             qryAux.Close;
             qryAux.SQL.Text := 'DELETE FROM TRANSPERFILINVEST '+
                                ' WHERE IDTRANSPERFILINVEST = '+ cdsTransf.FieldByName('IDTRANSPERFILINVEST').AsString;
             qryAux.ExecSQL;

             mmoResult.Lines.Add( sLinhaDados );

             cdsTransf.Edit;
             cdsTransf.FieldByName('TRANSFERIDO').AsString := 'S';
             cdsTransf.Post;
           end
           else
           begin
             lstContab := lstContab + iif(lstContab = '','', ', ') + cdsTransf.FieldByName('CONTRATO').AsString;

             cdsTransf.Edit;
             cdsTransf.FieldByName('TRANSFERIDO').AsString := 'N';
             cdsTransf.Post;
           end;

         except
           cdsTransf.Edit;
           cdsTransf.FieldByName('TRANSFERIDO').AsString := 'N';
           cdsTransf.Post;

           s := FormatDateTime('hh:mm:ss', Now) + ' - ' + cdsTransf.FieldByName('CONTRATO').AsString;

           mmoResult.Lines.Add(s + ': ERRO ao excluir lançamentos');

         end;

         cdsTransf.next;
       end;

       CommitTransacao;
    except
       RollbackTransacao;
    end;

  finally
    EscondeEspera;

    mmoResult.Lines.Add(' ');
    mmoResult.Lines.Add('Final do Processo      : ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now));
    mmoResult.Lines.Add('Tempo total do Processo: ' + FormatDateTime('hh:nn:ss', (Now - dDataIni)));

    if lstContab <> '' then
    begin
      mmoErro.Lines.Add(' ');
      mmoErro.Lines.Add('Contratos com itens contabilizados: ');
      mmoErro.Lines.Add('  '+lstContab );
    end;

    cdsTransf.Filtered := false;
    cdsTransf.Filter   := '';
    cdsTransf.EnableControls;

    TB97oKCancelar.visible := false;
    nbPrincipal.PageIndex  := 2;
  end;

end;

procedure TfrmTransferePerfilInvest.AbreQueriesFiltro;
begin
   // Preenche a listbox de patrocinadoras...
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatrobtnMarcaTodosPatroClick(self);

   // Preenche a listbox de Planos...
   molListaPlano.PreenchePlano;
   // ...e marca todos por default
   molListaPlanobtnMarcaTodosPlanoClick(self);

   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;

   // Tipo de Contrato
   LimpaParametros(dtmLookEmptmo.qryLookPlanPrev);
   dtmLookEmptmo.qryLookPlanPrev.Open;
end;

procedure TfrmTransferePerfilInvest.ProximoPeriodo;
begin
  qryAux.close;
  qryAux.SQL.Text := 'select PEREXERCICIO, PERNUMERO '+
                     '  from periodo                 '+
                     ' where perbloque = ''N''       '+
                     '   and perexercicio >= '+IntToStr(iAnoSel) +
                     '   and pernumero >= '+IntToStr(iMesSel) +
                     '   and rownum = 1  ' +
                     ' order by perexercicio, pernumero';
  qryAux.Open;
  if not qryAux.eof then
  begin
    iAnoSel := qryAux.Fields[0].AsInteger;
    iMesSel := qryAux.Fields[1].AsInteger;

    //edilaine - SIG61284 - inicio
    {sDataLanca  := DateToStr( DiasUteis.UltDiaUtilMes(Sistema.idEmpresa,
                                                      iAnoSel,
                                                      iMesSel,
                                                      true,      // bConsideraBancario
                                                      true,      // bConsideraExtraordinario
                                                      true));    // bSabadoUtil }

    sDataLanca  := DateToStr( DiasUteis.UltDiaMes(iAnoSel,iMesSel) );
    //edilaine - SIG61284 - fim
  end;
end;

procedure TfrmTransferePerfilInvest.mmoInfTransfChange(Sender: TObject);
begin
  inherited;
  btnContinuar.enabled := mmoInfTransf.text <> '';
end;


procedure TfrmTransferePerfilInvest.bbtnImpRegClick(Sender: TObject);
begin
  inherited;

  cdsTransf.IndexName := 'Transferidos';

  TfrmPreviewExport.CreateModalPreviewExpPipe(Application,
                                              rpRelatorioTransf, 'Relatório de Transferência de Perfil de Investimento');

  cdsTransf.IndexName := '';
end;

procedure TfrmTransferePerfilInvest.btnImprimirClick(Sender: TObject);
begin
  inherited;

  cdsTransf.IndexName := 'Resultado';

  cdsTransf.filtered  := false;
  if chkIncErro.Checked then
     cdsTransf.Filter    := 'TRANSFERIDO <> ''.'' '
  else
     cdsTransf.Filter    := 'TRANSFERIDO = ''S'' ';
  cdsTransf.Filtered  := true;

  TfrmPreviewExport.CreateModalPreviewExpPipe(Application,
                                              rpRelatorioTransf, 'Relatório de Transferência de Perfil de Investimento');

  cdsTransf.IndexName := '';
  cdsTransf.filtered  := false;
  cdsTransf.Filter    := '';
end;

procedure TfrmTransferePerfilInvest.lbl_PeriodoPrint(Sender: TObject);
begin
  inherited;
  lbl_Periodo.Caption := 'Período: '+ dbcboMes.Text +' de '+ dbspnAno.text;
end;

procedure TfrmTransferePerfilInvest.btnMarcaClick(Sender: TObject);
begin
  inherited;

  if StatusSelecao = sdDesmarcaTudo then
  begin
    btnMarca.ImageIndex := 10;
    btnMarca.Caption    := 'Desmarcar Todos';
    StatusSelecao := sdMarcaTudo;
  end
  else
  begin
    btnMarca.ImageIndex := 9;
    btnMarca.Caption    := 'Marcar Todos   ';
    StatusSelecao := sdDesmarcaTudo;
  end;
  
  MarcaDesmarcaItens;
end;

procedure TfrmTransferePerfilInvest.MarcaDesmarcaItens;
begin
  cdsTransf.DisableControls;
  cdsTransf.First;

  while not cdsTransf.Eof do
  begin
    cdsTransf.edit;
    cdsTransf.FieldByName('FLGESCOLHA').AsString := iif(StatusSelecao = sdMarcaTudo, '1', '0');
    cdsTransf.Post;

    cdsTransf.Next;
  end;

  cdsTransf.First;
  cdsTransf.EnableControls;
end;

procedure TfrmTransferePerfilInvest.FormCreate(Sender: TObject);
begin
  inherited;
   Contab := TCtrlContab.Create;
   Contab.Initialize(dtmBaseDados.dbBaseDados,
                     True,
                     Sistema.ConnectionType,
                     Sistema.ConnectionSide,
                     Sistema.AppRemoteServer,
                     True
                    );
end;

procedure TfrmTransferePerfilInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   Contab.Free;
end;


procedure TfrmTransferePerfilInvest.Contabiliza;
var
   iPlanilha      : Integer;
   iResult        : Integer;
   iContador      : Integer;
   sResult        : TStringList;
   sErro          : TStringList;
   sSQLContab     : String;
   sHistorico, s  : String;
   dDataContab    : TDateTime;
begin
   try
      sErro := TStringList.Create;

      dDataContab := StrToDate( sDataLanca );

      // ----------------------------------------------------------------------------------------
      //    Contabilização "normal" dos itens de transferência
      // ----------------------------------------------------------------------------------------
      MostraEspera('Selecionando Itens a contabilizar em ' +dbcboMes.Text+'/'+dbspnAno.text+ '...');

      sSQLContab  := MontaSQLContab( FormatDateTime('YYYY/MM', dDataContab) );
      sHistorico  := 'EMPRESTIMOS DE PARTICIPANTES - Transferência, ref: ' +dbcboMes.Text+'/'+dbspnAno.text;

      EscondeEspera;

      // ----------------------------------------------------------------------------------------
      mmoResult.Lines.Add('');
      mmoResult.Lines.Add(s + sDataLanca + ': Processo de Contabilização das Transferências');

      iResult     := IntegraEmptmo.ContabilizaItens('C',
                                                    'N',
                                                    sSQLContab,
                                                    sHistorico,
                                                    iContador,
                                                    sResult,
                                                    sErro,
                                                    iPlanilha,
                                                    True,
                                                    12,   //IDTIPOMOV,
                                                    molListaPatro.PegaPatro,
                                                    molListaPlano.PegaPlano,
                                                    dDataContab
                                                   );
      // ----------------------------------------------------------------------------------------

      s := FormatDateTime('hh:mm:ss', Now) + ' - ';

      case iResult of
         -8 : begin   //edilaine - SIG57627 - inicio
                mmoResult.Lines.Add(s + sDataLanca + ': ERRO - falta parametrização do Perfil de Investimento');
                mmoResult.Lines.Add( sErro.text );
              end;    //edilaine - SIG57627 - fim
         -6 : mmoResult.Lines.Add(s + sDataLanca + ': ERRO - período contábil');
         -5 : mmoResult.Lines.Add(s + sDataLanca + ': ERRO ao efetuar lançamento contábil');
         -4 : mmoResult.Lines.Add(s + sDataLanca + ': ERRO ao buscar parâmetros para integração');
         -3 : mmoResult.Lines.Add(s + sDataLanca + ': ERRO ao criar tabela para agrupar lançamentos');
         -2 : mmoResult.Lines.Add(s + sDataLanca + ': Não foram encontrados itens a contabilizar');
         -1 : mmoResult.Lines.Add(s + sDataLanca + ': ERRO ao selecionar os itens a contabilizar');
         0  : mmoResult.Lines.Add(s + sDataLanca + ': Contabilização efetuada na planilha ' + IntToStr(iPlanilha));
      end;

      {if iResult <> 0 then
      begin
         RollbackTransacao;
      end
      else
      begin
         CommitTransacao;
      end; }
      // ----------------------------------------------------------------------------------------
      //    FIM Contabilização "normal" dos itens de tranferência
      // ----------------------------------------------------------------------------------------

   finally
      mmoResult.Lines.Add(' ');
     sErro.Free;
   end;
end;


procedure TfrmTransferePerfilInvest.cdsTransfAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TNumericField(cdsTransf.FindField('SALDOTRANSF')).DisplayFormat  := '#,##0.00';
  TNumericField(cdsTransf.FindField('SALDOINAD')).DisplayFormat    := '#,##0.00';
  TNumericField(cdsTransf.FindField('SALDOTOTAL')).DisplayFormat   := '#,##0.00';
  TNumericField(cdsTransf.FindField('VLRPARCVENCE')).DisplayFormat := '#,##0.00';
  TNumericField(cdsTransf.FindField('SALDO_PROV_PERDA')).DisplayFormat := '#,##0.00';
end;

procedure TfrmTransferePerfilInvest.BloqueiaFiltro(bBloqueio: Boolean);
begin
  btnCarregar.Enabled       := not bBloqueio;
  chkListaTransf.Enabled    := not bBloqueio;
  molListaPlano.Enabled     := not bBloqueio;
  molListaPatro.Enabled     := not bBloqueio;
  dbcboMes.Enabled          := not bBloqueio;
  dbspnAno.Enabled          := not bBloqueio;
  DBcboTipoEmptmo.Enabled   := not bBloqueio;
  DBcboTipoContrato.Enabled := not bBloqueio;
  molContratoEmptmo.Enabled := not bBloqueio;

  if not bBloqueio then
     CarregaDados(True);
end;

procedure TfrmTransferePerfilInvest.btnHabFiltroClick(Sender: TObject);
begin
  inherited;
  molContratoEmptmobtnLimpaContratoClick(sender);
  DBcboTipoEmptmo.LookupValue := '';
  chkListaTransf.checked      := false;
  BloqueiaFiltro(false);

  bbtnConfirmar.Enabled := false;
  bbtnDesfaz.Enabled    := false;
  bbtnImpReg.Enabled    := false;
end;

procedure TfrmTransferePerfilInvest.btnExportarClick(Sender: TObject);
begin
  inherited;
  try
    MontaArquivoExcel();

    Screen.Cursor := crDefault;
    MsgDlg('Resultado da transferência de perfis exportado com sucesso.', 'Aviso', mtInformation, [mbOk], 0);
  Except
    on e: Exception do
     begin
       Screen.Cursor := crDefault;
       Application.MessageBox(pchar('Erro ao exportar: ' + e.Message ),'Erro', MB_ICONERROR );
     end;
  end;

end;

procedure TfrmTransferePerfilInvest.MontaArquivoExcel;
   procedure FormataColunas(grdDados : TwwDBGrid; qryDados : TwwQuery; iCol : byte);
   var  sCampo : string;
   begin
     for iCol := 0 to grdDados.GetColCount-1 do
     begin
       sCampo := grdDados.Columns[icol].FieldName;
       if sCampo <> '' then
       begin
         if (qryDados.FieldByName(sCampo).DataType = ftFloat) then
            Sheet.Columns[icol+1].NumberFormat := '@'
         else if (qryDados.FieldByName(sCampo).DataType = ftInteger) then
            Sheet.Columns[icol+1].NumberFormat := '@';
       end;
     end;
   end;

   procedure InsereCabColunas(grdDados : TwwDBGrid; iCol : byte);
   var  sColuna : string;
   begin
     for iCol := 0 to grdDados.GetColCount-1 do
     begin
       sColuna := grdDados.Columns[icol].DisplayLabel;
       Sheet.Cells[1, iCol+1] := #9+Trim(sColuna);
     end;
   end;

   procedure InsereDadosPlanilha(grdDados : TwwDBGrid; qryDados : TwwQuery; iLin, iCol : byte );
   var  sCampo : string;
   begin
     iLin := 2;
     qryDados.DisableControls;
     qryDados.First;
     while not qryDados.Eof do
     begin
       for iCol := 0 to grdDados.GetColCount-1 do
       begin
          sCampo := grdDados.Columns[icol].FieldName;
          if sCampo <> '' then
          begin
            if (qryDados.FieldByName(sCampo).DataType = ftFloat) then
               Sheet.Cells[iLin, iCol+1] := qryDados.FieldByName(sCampo).AsString
            else if (qryDados.FieldByName(sCampo).DataType = ftInteger) then
               Sheet.Cells[iLin, iCol+1] := qryDados.FieldByName(sCampo).AsString
            else
               Sheet.Cells[iLin, iCol+1] := #9+qryDados.FieldByName(sCampo).AsString;
          end;
       end;
       qryDados.next;
       inc(iLin);
     end;
     qryDados.first;
     qryDados.EnableControls;
   end;
var
  sNomeArquivo : string;
  iCol, iLin   : byte;
  ExcelApp     : Variant;
begin

   with SaveDlg do
       if Execute then
          sNomeArquivo := FileName;

   Screen.Cursor := crHourGlass;

   try

//      lstDados.Add('MATRICULA'+#59+'CPF'+#59+'NOME'+#59+'SEXO'+#59+'PATRO'+#59+'PLANO'+#59+'DTDEMISSAO'+#59+'DTADPLANO'+#59+'IDADE'+#59+'DTATUAL'+#59+'ELEGIVEL1'+#59+'SALDOCONTA'+#59+'RESPOUP'+#59+'ELEGIVEL2'+#59+'VLRASERPORTADO'+#59+'VLRPORTADO'+#59+'TOTPORTADO'+#59+'ELEGIVEL3'+#59+'VLRTRIB'+#59+'VLRNAOTRIB'+#59+'RESGBRUTO'+#59+'ELEGIVEL4'+#59+'SALPART'+#59+'VLRINIPART'+#59+'PERCPART'+#59+'VLRINIPATRO'+#59+'PERCPATRO'+#59+'VLRINICADM'+#59+'PERCCADM'+#59+'VLRINICRISCO'+#59+'PERCCRISCO');

      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Visible := false;
      ExcelApp.WorkBooks.Add(1);
      ExcelApp.DisplayAlerts := False;

      //---- Prazo de Acumulação
      ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count].Name:='Transferidos';
      sheet := ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count];

      FormataColunas(grdTransf, qryTransfDados, iCol);
      InsereCabColunas(grdTransf, iCol);
      if not qryTransfDados.IsEmpty then
         InsereDadosPlanilha(grdTransf, qryTransfDados, iLin, iCol );

      ExcelApp.columns.AutoFit;

      //---- Prazo de Acumulação
      ExcelApp.WorkBooks[1].Sheets.Add(null, Sheet);
      ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count].Name:='Erros encontrados';
      sheet := ExcelApp.WorkBooks[1].WorkSheets[ExcelApp.WorkBooks[1].WorkSheets.count];

      FormataColunas(grdTransf, qryTransfDados, iCol);
      InsereCabColunas(grdTransf, iCol);
      if not qryTransfDados.IsEmpty then
         InsereDadosPlanilha(grdTransf, qryTransfDados, iLin, iCol );

      ExcelApp.columns.AutoFit;

   finally
     (* Fecha o Arquivo Independente do resultado da Operação *)
     ExcelApp.ActiveWorkbook.SaveAs( sNomeArquivo );
     ExcelApp.DisplayAlerts:= 0;
     ExcelApp.ActiveWorkbook.Close(False);
     ExcelApp.Quit;
     ExcelApp := Unassigned;
   end;

end;

end.

