// Alterações:
{ --------------------------------------------------------------------------------------------------
{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
{Rotina    : -
Data      : 06/01/2002
Autor     : André Pontes
Descrição : Exibição da data de inclusão, origem e usuário que incluiu o item
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 17/12/2002
Autor     : André Pontes
Descrição : Nova opção de filtro: itens em aberto
            Exibição diferenciada dos itens abonados e quitados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/12/2002
Autor     : André Pontes
Descrição : Novas opções de filtro: por Item e por Evento
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : - (grpFlgas)
Data      : 12/12/2002
Autor     : André Pontes
Descrição : Só verifica se deve esconder os campos se tiver flgCalcDia = 1 (FUNCEF)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/11/2002
Autor     : Marchetti
Descrição : Na página de Histórico foi criada a coluna que contém o tipo de operação relacionada ao
            item, ou seja, se abate saldo devedor, coloca sinal negativo, se incorpora saldo devedor,
            coloca sinal positivo, se não trata, deixa em branco
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryHistMov
Data      : 18/11/2002
Autor     : Marchetti
Descrição : Colocado comando no SELECT para fazer o DECODE conforme o ITCTRATASALDODEV
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Exibição do Histórico (Filtro)
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Não traz o checkbox de filtro de movimentação já marcado
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : Exibição do Histórico (qryHistMov)
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Itens de quitação por morte são exibidos mesmo quando são selecionados apenas os itens
            centralizadores: quitação por morte tem centralizador (item do líquido) com valor ZERO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : btnAtualizaSaldoClick
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Verificação do status do contrato. Se for 'Q' ou 'K', envia msg e não prossegue.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002 
Autor     : Marchetti
Descrição : Colocado na query de parcelas restantes um filtro para não se levar em consideração
            item estornado
---------------------------------------------------------------------------------------------------}
unit RContrato;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
    TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
    Mask, DBCtrls, ComCtrls, fcLabel, Db, DBTables, Wwquery, Wwdatsrc, Grids,
    Wwdbigrd, Wwdbgrid, wwdblook, uCalcEmptmo, fcButton, fcImgBtn,
    fcShapeBtn, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb,

    uTypesEmptmo;

type
   TfrmRelContrato = class(TfrmSairAjudaImob)
      pgcDados: TPageControl;
      tbsCondicoes: TTabSheet;
      Label29: TLabel;
      DBedtNumContrato: TDBEdit;
      btnBuscaContrato: TBitBtn;
      DBedtParticipante: TDBEdit;
      tbsIntegracao: TTabSheet;
      tbsParcelas: TTabSheet;
      Label27: TLabel;
      Label8: TLabel;
      Label13: TLabel;
      Label21: TLabel;
      Label43: TLabel;
      Label12: TLabel;
      Label4: TLabel;
      Label34: TLabel;
      Label41: TLabel;
      Label18: TLabel;
      Label14: TLabel;
      Label17: TLabel;
      Label38: TLabel;
      Label39: TLabel;
      DBedtCodInsc: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtTipoContrato: TDBEdit;
      DBedtDataAssinatura: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtPatro: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtMtrEmpresa: TDBEdit;
      DBedtSitPart: TDBEdit;
      DBedtTipoEmptmo: TDBEdit;
      DBedtParcelas: TDBEdit;
      Label1: TLabel;
      DBedtDataInsc: TCMDateTimePicker;
      Label3: TLabel;
      DBedtDataPrimParcela: TCMDateTimePicker;
      Label5: TLabel;
      DBedtDtCancelamento: TCMDateTimePicker;
      dts: TwwDataSource;
      qry: TwwQuery;
      qryINSCRICAO: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryDESCTIPOEMPTMO: TStringField;
      qryDATAINSC: TDateTimeField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryDATACANC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      DBgrdHistMov: TwwDBGrid;
      dtsHistMov: TwwDataSource;
      qryHistMov: TwwQuery;
      DBedtBanco: TDBEdit;
      Label7: TLabel;
      DBedtAgencia: TDBEdit;
      Label9: TLabel;
      DBedtContaCorrente: TDBEdit;
      Label10: TLabel;
      qryDESCFLGFORMAPAG: TStringField;
      qryDESCFLGFORMAREC: TStringField;
      qryDESCCODFORMAPAG: TStringField;
      qryDESCPORTFORMAPAG: TStringField;
      qryDESCPORTFORMAREC: TStringField;
      grpCredito: TGroupBox;
      DBedtFormaPag: TDBEdit;
      DBedtFormaPagamento: TDBEdit;
      lbFormPag: TLabel;
      Label31: TLabel;
      DBedtCCaixaxFPagto: TDBEdit;
      grpDebito: TGroupBox;
      DBedtFormaRec: TDBEdit;
      Label30: TLabel;
      DBedtFormaRecebimento: TDBEdit;
      tbsDetalheParcela: TTabSheet;
      Label11: TLabel;
      DBedtValorPrevisto: TDBEdit;
      Label15: TLabel;
      Label22: TLabel;
      DBedtEvento: TDBEdit;
      label100: TLabel;
      DBedtCompetencia: TDBEdit;
      Label23: TLabel;
      DBedtParcela: TDBEdit;
      Label24: TLabel;
      DBedtItem: TDBEdit;
      DBedtDataPrevisao: TCMDateTimePicker;
      Label32: TLabel;
      DBedtPlanilha: TDBEdit;
      Label35: TLabel;
      DBedtCodDocumento: TDBEdit;
      Label37: TLabel;
      DBedtDataEfetiva: TCMDateTimePicker;
      Label26: TLabel;
      DBedtValorEfetivo: TDBEdit;
      Label28: TLabel;
      DBedtCobranca: TDBEdit;
      qryTCEDESCRICAO: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      ToolbarSep973: TToolbarSep97;
      btnImprimir: TBitBtn;
    grpFlags: TGroupBox;
      DBchkEnvio: TDBCheckBox;
      DBchkBaixado: TDBCheckBox;
      DBchkEstornado: TDBCheckBox;
      GroupBox2: TGroupBox;
      DBedtTxJuros: TDBEdit;
      Label19: TLabel;
      Label16: TLabel;
      Label25: TLabel;
      DBedtSaldoDev: TDBEdit;
      DBedtDataUltAtualiza: TCMDateTimePicker;
      plnFiltro: TPanel;
      rdgEstorno: TRadioGroup;
      tbsSaldo: TTabSheet;
      btnAtualizaSaldo: TBitBtn;
      tbsItensAberto: TTabSheet;
      updHistMovVirtual: TUpdateSQL;
      dtsHistMovVirtual: TwwDataSource;
      qryHistMovVirtual: TwwQuery;
      qryHistMovVirtualHMEANOCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMEMESCOMPETENCIA: TFloatField;
      qryHistMovVirtualHMESEQCOBRANCA: TFloatField;
      qryHistMovVirtualHMETIPOMOV: TFloatField;
      qryHistMovVirtualHMEDATAPREVISTA: TDateTimeField;
      qryHistMovVirtualHMEVLRPREVISTO: TFloatField;
      qryHistMovVirtualHMESALDODEV: TFloatField;
      qryHistMovVirtualHMETXJUROS: TFloatField;
      qryHistMovVirtualHMEPARCELA: TFloatField;
      qryHistMovVirtualEVENTO: TStringField;
      qryHistMovVirtualANOMES: TStringField;
      qryHistMovVirtualITEDESCRICAO: TStringField;
      qryHistMovVirtualIDCONTRATOEMPTMO: TFloatField;
      qryHistMovVirtualIDITEMEMPTMO: TFloatField;
      rdgExibe: TRadioGroup;
      qryItensAberto: TwwQuery;
      dtsItensAberto: TwwDataSource;
      qryItensAbertoITEDESCRICAO: TStringField;
      qryItensAbertoANOMESCOMP: TStringField;
      qryItensAbertoANOMESCOBR: TStringField;
      qryItensAbertoFLGENVIO: TFloatField;
      qryItensAbertoFLGBAIXADO: TFloatField;
      qryItensAbertoFLGESTORNADO: TFloatField;
      qryItensAbertoHMEANOCOMPETENCIA: TFloatField;
      qryItensAbertoHMEMESCOMPETENCIA: TFloatField;
      qryItensAbertoHMESEQCOBRANCA: TFloatField;
      qryItensAbertoHMETIPOMOV: TFloatField;
      qryItensAbertoIDCONTRATOEMPTMO: TFloatField;
      qryItensAbertoIDITEMEMPTMO: TFloatField;
      qryItensAbertoHMEDATAPREVISTA: TDateTimeField;
      qryItensAbertoHMEVLRPREVISTO: TFloatField;
      qryItensAbertoHMESALDODEV: TFloatField;
      qryItensAbertoHMETXJUROS: TFloatField;
      qryItensAbertoHMEPARCELA: TFloatField;
      qryItensAbertoHMEDATAEFETIVA: TDateTimeField;
      qryItensAbertoHMEDATAATUALIZA: TDateTimeField;
      qryItensAbertoHMEVLREFETIVO: TFloatField;
      qryItensAbertoPLNCODIGO: TFloatField;
      qryItensAbertoPLNCODIGOESTORNO: TFloatField;
      qryItensAbertoCODDOCUMENTO: TFloatField;
      qryItensAbertoIDRUBRICA: TFloatField;
      qryItensAbertoEVENTO: TStringField;
      wwDBGrid2: TwwDBGrid;
      wwDBGrid1: TwwDBGrid;
      qryItensAbertoHMEFORMACOBRANCA: TStringField;
      qryItensAbertoFORMA_COBRANCA: TStringField;
    chkFiltroCobranca: TCheckBox;
      Label36: TLabel;
      cboMesCobIni: TComboBox;
      DBspnAnoCobIni: TwwDBSpinEdit;
      cboMesCobFim: TComboBox;
      DBspnAnoCobFim: TwwDBSpinEdit;
      fcShapeBtn1: TfcShapeBtn;
      lblTitulo: TfcLabel;
      edtSaldoAtual: TRealEdit;
      lblSaldoAtualizado: TLabel;
      edtDataQuitacao: TCMDateTimePicker;
      Label40: TLabel;
      DBedtDestinoEnvio: TDBEdit;
      DBedtTipoFolha: TDBEdit;
      DBCheckBox1: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      DBedtPlanil: TDBEdit;
      edtSaldoDevedor: TRealEdit;
      Label42: TLabel;
      edtParcRestante: TRealEdit;
      qryParcelasRestantes: TwwQuery;
      qryParcelasRestantesPARCELAS_RESTANTES: TFloatField;
      tbsBenefSeguro: TTabSheet;
      qryBenefSeguro: TwwQuery;
      wwDBGrid3: TwwDBGrid;
      dsBenefSeguro: TDataSource;
      Label44: TLabel;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      qryMOECODIGO: TFloatField;
      qryMOESIGLA: TStringField;
      pnlHistBaca: TPanel;
      btnAltera: TfcShapeBtn;
      btnNovo: TfcShapeBtn;
      btnExcluir: TfcShapeBtn;
      qryHistMovITEDESCRICAO: TStringField;
      qryHistMovANOMESCOMP: TStringField;
      qryHistMovANOMESCOBR: TStringField;
      qryHistMovANOMESCOMPET: TStringField;
      qryHistMovANOMESCOB: TStringField;
      qryHistMovFLGENVIO: TFloatField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovFLGESTORNADO: TFloatField;
      qryHistMovFLGABONADO: TFloatField;
      qryHistMovFLGQUITADO: TFloatField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovPLNCODIGO: TFloatField;
      qryHistMovPLNCODIGOESTORNO: TFloatField;
      qryHistMovCODDOCUMENTO: TFloatField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovEVENTO: TStringField;
      qryHistMovFORMACOBRANCA: TStringField;
      qryHistMovTIPOFOLHA: TStringField;
      qryHistMovPLNPLANIL: TFloatField;
      qryHistMovPLANIL_ESTORNO: TFloatField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      CMDateTimePicker1: TCMDateTimePicker;
      Label45: TLabel;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      CMDateTimePicker2: TCMDateTimePicker;
      Label46: TLabel;
      qryHistMovHMEDATAQUITABONO: TDateTimeField;
      DBEdit1: TDBEdit;
      DBEdit2: TDBEdit;
      Label47: TLabel;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryTSEDESCRICAO: TStringField;
      pnlTitular: TPanel;
      DBedtBeneficiario: TDBEdit;
      Label2: TLabel;
      DBCheckBox3: TDBCheckBox;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      DBCheckBox4: TDBCheckBox;
      qryHistMovFLGDIVERGPEND: TFloatField;
      Image1: TImage;
      DBEdit4: TDBEdit;
      Label51: TLabel;
      DBCheckBox5: TDBCheckBox;
      qryHistMovFLGSUSPENSAO: TFloatField;
      DBcboTipoDiverg: TwwDBComboBox;
      qryHistMovFLGTIPODIVERG: TFloatField;
      qryHistMovFLGDIVERGTRAT: TFloatField;
      DBCheckBox6: TDBCheckBox;
      DBEdit5: TDBEdit;
      Label52: TLabel;
      rdgOrdena: TRadioGroup;
      cboFlgSituacao: TComboBox;
      BitBtn1: TBitBtn;
      Panel1: TPanel;
      Panel2: TPanel;
      DBEdit6: TDBEdit;
      DBEdit7: TDBEdit;
      qryItensAbertoHMEDATAVENCTO: TDateTimeField;
      qryItensAbertoITCSEQCALCULO: TFloatField;
      Label53: TLabel;
      Label54: TLabel;
      Label56: TLabel;
      DBEdit9: TDBEdit;
      Label55: TLabel;
      DBEdit8: TDBEdit;
      Label57: TLabel;
      qryTotalizaAberto: TwwQuery;
      qryTotalizaAbertoQUANT_ABERTO: TFloatField;
      qryTotalizaAbertoVALOR_TOTAL_ABERTO: TFloatField;
      Label58: TLabel;
      DBEdit10: TDBEdit;
      qryHistMovTIPO_OPERACAO: TStringField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
    Bevel1: TBevel;
    DBcboItem: TwwDBLookupCombo;
    chkFiltroEvento: TCheckBox;
    chkFiltroItem: TCheckBox;
    dtsTotalizaAberto: TwwDataSource;
    cboEvento: TComboBox;
    rdgFiltroEmAberto: TRadioGroup;
    fcShapeBtn2: TfcShapeBtn;
    DBedtPlanilhaEstorno: TDBEdit;
    Label33: TLabel;
    DBedtPlanilEstorno: TDBEdit;
    Label6: TLabel;
    CMDateTimePicker5: TCMDateTimePicker;
    qryHistMovHMEDATAESTORNO: TDateTimeField;
    CMDateTimePicker6: TCMDateTimePicker;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    Label59: TLabel;
    CMDateTimePicker7: TCMDateTimePicker;
    DBEdit12: TDBEdit;
    Label60: TLabel;
    qryHistMovORIGEM: TStringField;
    qryHistMovTRGDTINCLUSAO: TDateTimeField;
    qryHistMovTRGUSERINCLUSAO: TStringField;
    qryHistMovNOMEUSUARIO: TStringField;
    qryHistMovHMEDATA: TDateTimeField;
    qryFLGINTERNET: TFloatField;
    lblInternet: TfcLabel;
    DBEdit13: TDBEdit;
    Label61: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBEdit14: TDBEdit;
    Label62: TLabel;
    GroupBox1: TGroupBox;
    DBEdit3: TDBEdit;
    Label48: TLabel;
    CMDateTimePicker3: TCMDateTimePicker;
    Label49: TLabel;
    Label50: TLabel;
    CMDateTimePicker4: TCMDateTimePicker;
    qryHistMovVERSAO: TStringField;
    DBCheckBox7: TDBCheckBox;
    qryHistMovFLGENTRADAMANUAL: TFloatField;

      procedure btnBuscaContratoClick(Sender: TObject);
      procedure DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovTopRowChanged(Sender: TObject);
      procedure DBgrdHistMovCellChanged(Sender: TObject);
      procedure btnImprimirClick(Sender: TObject);
      procedure btnAtualizaSaldoClick(Sender: TObject);
      procedure DBgrdItensAbertoTopRowChanged(Sender: TObject);
      procedure DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
      procedure DBgrdItensAbertoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure rdgExibeClick(Sender: TObject);
      procedure rdgEstornoClick(Sender: TObject);
      procedure chkOrdemClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure chkFaixaDatasClick(Sender: TObject);
      procedure fcShapeBtn1Click(Sender: TObject);
      procedure cboMesCobIniExit(Sender: TObject);
      procedure DBspnAnoCobIniExit(Sender: TObject);
      procedure cboMesCobFimExit(Sender: TObject);
      procedure DBspnAnoCobFimExit(Sender: TObject);
      procedure cboMesCobIniEnter(Sender: TObject);
      procedure cboMesCobFimEnter(Sender: TObject);
      procedure qryHistMovVirtualAfterClose(DataSet: TDataSet);
      procedure pgcDadosChange(Sender: TObject);
      procedure btnNovoClick(Sender: TObject);
      procedure btnAlteraClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
      procedure Image1DblClick(Sender: TObject);
      procedure rdgOrdenaClick(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure cboEventoChange(Sender: TObject);
      procedure qryHistMovHMEVLREFETIVOGetText(Sender: TField; var Text: String; DisplayText: Boolean);


   private { Private declarations }

      rContrato   : TDadosContrato;
      vLista      : TListaItem;
      iIndiceIni  : Integer;
      iIndiceFim  : Integer;

      sDiaSldDev  : String;

      procedure Sel(i: Int64);
      procedure DesabilitaVazio;
      procedure PreencheTabelaVirtual;
      procedure AbreQueriesHistorico;
      procedure Imprime;

   public { Public declarations }


   end;



var
  frmRelContrato: TfrmRelContrato;



implementation
{$R *.DFM}
uses
   uSistema, uMensErro, UFuncoesEmptmo, dEmptmo, dMS, FProgresso, uDiasUteis, uModulo, ppTypes,
   DDividaEP, dLookEmptmo, dCalcEmptmo, FCadHistMovEmptmo, DBaseDados, dRelatorios,
   FConfigRelatorio, fImpressaoContrato;




procedure TfrmRelContrato.Sel(i: Int64);
begin
   lblTitulo.Caption := '';

   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := i;
      Open;
   end;

   AbreQueriesHistorico;
end;



procedure TfrmRelContrato.AbreQueriesHistorico;
var
   sMes : String;
   sAno : String;
begin
   with qryTotalizaAberto do
   begin
      LimpaParametros(qryTotalizaAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger  := qryIDCONTRATOEMPTMO.AsInteger;
      Open;
   end;

   with qryItensAberto do
   begin
      LimpaParametros(qryItensAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger  := qryIDCONTRATOEMPTMO.AsInteger;
      Open;
   end;

   with qryHistMov do
   begin
      LimpaParametros(qryHistMov);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := qryIDCONTRATOEMPTMO.AsInteger;

      // Itens de Envio ----------------------------------------------------------------------------
      if rdgExibe.ItemIndex = 1 then ParamByName('PFLGENVIO').AsInteger := 1;

      // Itens Estornados --------------------------------------------------------------------------
      case rdgEstorno.ItemIndex of
         1: ParamByName('PFLGESTORNADO').AsInteger := 0;
         2: ParamByName('PFLGESTORNADO').AsInteger := 1;
      end;

      // Evento ------------------------------------------------------------------------------------
      if ( (chkFiltroEvento.Checked) and (cboEvento.ItemIndex >= 0) ) then
      begin
         ParamByName('PHMETIPOMOV').AsInteger := cboEvento.ItemIndex;
      end;

      // Item --------------------------------------------------------------------------------------
      if ( (chkFiltroItem.Checked) and (cboEvento.ItemIndex >= 0) ) then
      begin
         ParamByName('PIDITEMEMPTMO').AsInteger := StrToInt(DBcboItem.LookupValue);
      end;

      // Itens em Aberto ---------------------------------------------------------------------------
      case rdgFiltroEmAberto.ItemIndex of
         1: ParamByName('PFLGBAIXADO').AsInteger := 1;
         2: ParamByName('PFLGBAIXADO').AsInteger := 0;
      end;

{
      // Datas -------------------------------------------------------------------------------------
      if chkFaixaDatas.Checked then begin
         if ( (length(edtDataIni.Text) > 0) or (length(edtDataFim.Text) > 0) ) then begin
            ParamByName('PFILTRODATA').AsInteger := 1;
            if length(edtDataIni.Text) > 0 then ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
            if length(edtDataFim.Text) > 0 then ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
         end;
      end;

      // Mês de Competência ------------------------------------------------------------------------
      if chkMesCompetencia.Checked then begin
         if ( ((cboMesCompIni.ItemIndex >= 0) and (DBspnAnoCompIni.Value > 1980)) or
              ((cboMesCompFim.ItemIndex >= 0) and (DBspnAnoCompFim.Value > 1980)) ) then
         begin
            ParamByName('PFILTROCOMP').AsInteger := 1;

            if ( (cboMesCompIni.ItemIndex >= 0) and (DBspnAnoCompIni.Value > 1980) ) then begin
               sAno := FormatFloat('0000', DBspnAnoCompIni.Value);
               sMes := FormatFloat('00', cboMesCompIni.ItemIndex + 1);

               ParamByName('PANOMESCOMPINI').AsString := sAno + sMes;
            end;

            if ( (cboMesCompFim.ItemIndex >= 0) and (DBspnAnoCompFim.Value > 1980) ) then begin
               sAno := FormatFloat('0000', DBspnAnoCompFim.Value);
               sMes := FormatFloat('00', cboMesCompFim.ItemIndex + 1);

               ParamByName('PANOMESCOMPFIM').AsString := sAno + sMes;
            end;
         end;
      end;
}

      // Mês de Cobrança ---------------------------------------------------------------------------
      if chkFiltroCobranca.Checked then
      begin
         if ( ((cboMesCobIni.ItemIndex >= 0) and (DBspnAnoCobIni.Value > 1980)) or
              ((cboMesCobFim.ItemIndex >= 0) and (DBspnAnoCobFim.Value > 1980)) ) then
         begin
            ParamByName('PFILTROCOB').AsInteger := 1;

            if ( (cboMesCobIni.ItemIndex >= 0) and (DBspnAnoCobIni.Value > 1980) ) then
            begin
               sAno := FormatFloat('0000', DBspnAnoCobIni.Value);
               sMes := FormatFloat('00', cboMesCobIni.ItemIndex + 1);

               ParamByName('PANOMESCOBINI').AsString := sAno + sMes;
            end;

            if ( (cboMesCobFim.ItemIndex >= 0) and (DBspnAnoCobFim.Value > 1980) ) then
            begin
               sAno := FormatFloat('0000', DBspnAnoCobFim.Value);
               sMes := FormatFloat('00', cboMesCobFim.ItemIndex + 1);

               ParamByName('PANOMESCOBFIM').AsString := sAno + sMes;
            end;
         end;
      end;

      // Ordenação ---------------------------------------------------------------------------------
      ParamByName('PORDEM').AsInteger := (rdgOrdena.ItemIndex + 1);

      Open;
   end;
end;



procedure TfrmRelContrato.btnBuscaContratoClick(Sender: TObject);
begin
   dtmMS.MS_ContratoEmptmo.Executar;

	// Redesenha o form na volta do MontaSelect
   Repaint;

   if dtmMS.MS_ContratoEmptmo.RetornouValor then
   begin
      Screen.Cursor := crHourGlass;

      qryItensAberto.Close;
      qryHistMovVirtual.Close;
      qryHistMov.Close;

      edtSaldoAtual.Value   := 0;
      edtParcRestante.Value := 0;
      edtSaldoDevedor.Value := 0;

      // Abre a query principal com o participante escolhido
      Sel(StrToInt(dtmMS.MS_ContratoEmptmo.ValoresChave[0]));

      // Troca a cor do texto de acordo com a situação do Contrato
      case qryFLGSITUACAO.AsString[1] of
         'A': lblTitulo.Font.Color  := clNavy;
         'C': lblTitulo.Font.Color  := clMaroon;
         'E': lblTitulo.Font.Color  := clOlive;
         'J': lblTitulo.Font.Color  := clMaroon;
         'K': lblTitulo.Font.Color  := clOlive;
         'Q': lblTitulo.Font.Color  := clGreen;
      end;

      lblTitulo.Caption    := qryDESCSITCONTRATO.AsString;
      lblInternet.Visible  := (qryFLGINTERNET.AsInteger = 1);

      PreencheDadosContrato(qry, rContrato);

      // Saldo Devedor -----------------------------------------------------------------------------
      with dtmCalcEmptmo.qrySaldoAnt do
      begin
         LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := rContrato.IDContratoEmptmo;
         ParamByName('PHMEDATAATUALIZA').AsDateTime   := Sysdate;
         Open;

         if not(IsEmpty) then edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
      end;
      // Fim Saldo Devedor -------------------------------------------------------------------------

      // Parcelas Restantes-------------------------------------------------------------------------
      with qryParcelasRestantes do
      begin
         LimpaParametros(qryParcelasRestantes);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger   := rContrato.IDContratoEmptmo;
         Open;

         if not(IsEmpty) then edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
      end;
      // Fim Parcelas Restantes --------------------------------------------------------------------

      with qryBenefSeguro do
      begin
         LimpaParametros(qryBenefSeguro);
         ParamByName('PIDINSCRICAOEMPTMO').AsInteger := rContrato.IDINSCRICAOEMPTMO;
         Open;
      end;

      DesabilitaVazio;

      pgcDados.ActivePageIndex := 0;

      Screen.Cursor := crDefault;
   end
   else
   begin
      DBedtNumContrato.Color  := clBtnFace;
      DBedtParticipante.Color := clBtnFace;
   end; // if MontaSelect.RetornouValor
end;



procedure TfrmRelContrato.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   // faz com que as linhas do grid tenham cores alternadas
   if State <> [gdSelected] then
   begin
      if not(Highlight) then
      begin
         // linhas ímpares = amarelo, linhas pares = branco
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then
         begin
            ABrush.Color := $00C0FFFF; // amarelo bebê
         end
         else
         begin
            ABrush.Color := clWindow;
         end;
      end;

      // fonte fica azul em caso de abono
      // fonte fica verde em caso de quitação
      if not(Highlight) then
      begin
         if Field = qryHistMovHMEDATAEFETIVA then
         begin
            AFont.Color := clWindowText;
            if qryHistMovFLGQUITADO.AsInteger = 1 then AFont.Color := clGreen;
            if qryHistMovFLGABONADO.AsInteger = 1 then AFont.Color := clBlue;
         end;
      end;

      if not(Highlight) then
      begin
         if Field = qryHistMovHMEVLREFETIVO then
         begin
            AFont.Color := clWindowText;
            if qryHistMovFLGESTORNADO.AsInteger = 1 then AFont.Color := clMaroon;
            if qryHistMovFLGABONADO.AsInteger   = 1 then AFont.Color := clBlue;
            if qryHistMovFLGQUITADO.AsInteger   = 1 then AFont.Color := clGreen;
         end;
      end;

   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmRelContrato.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelContrato.DesabilitaVazio;
var
   TBS      : TTabSheet;
   Group    : TGroupBox;
   i, j, k  : Integer;
begin
   TBS := nil;

   DBedtNumContrato.Color  := clWindow;
   DBedtParticipante.Color := clWindow;

   for j := 0 to ( pgcDados.ControlCount - 1) do begin

      if (pgcDados.Controls[j] is TTabSheet) then TBS := (pgcDados.Controls[j] as TTabSheet);

      for i := 0 to TBS.ControlCount-1 do begin

         if (TBS.Controls[i] is TDBEdit) then begin

            if (TBS.Controls[i] as TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] as TDBEdit).DataField).IsNull then
            begin
               (TBS.Controls[i] as TDBEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TDBEdit).Color := clWindow;
            end;

         end;(* if TDBEdit *)

         if (TBS.Controls[i] is TRealEdit) then begin

            if (TBS.Controls[i] as TRealEdit).Value = 0 then
            begin
               (TBS.Controls[i] as TRealEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TRealEdit).Color := clWindow;
            end;

         end;(* if TRealEdit *)


         if (TBS.Controls[i] is TCMDateTimePicker) then begin

            if (TBS.Controls[i] as TCMDateTimePicker).DataField <> '' then begin
               if (TBS.Controls[i] as TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] as TCMDateTimePicker).DataField).IsNull then
               begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clBtnFace;
               end else begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clWindow;
               end;
            end;

         end;(* if TCMDateTimePicker *)


         if (TBS.Controls[i] is TGroupBox) then begin
            Group := (TBS.Controls[i] as TGroupBox);

            for k := 0 to Group.ControlCount-1 do begin

               if (Group.Controls[k] is TDBEdit) then begin

                  if (Group.Controls[k] as TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] as TDBEdit).DataField).IsNull then
                  begin
                     (Group.Controls[k] as TDBEdit).Color := clBtnFace;
                  end else begin
                     (Group.Controls[k] as TDBEdit).Color := clWindow;
                  end;

               end;(* if TDBEdit *)
            end;(* for Group *)
         end;(* if TGroupBox *)
      end;(* for TBS *)
   end;(* for pgcDados *)
end;



procedure TfrmRelContrato.DBgrdHistMovCellChanged(Sender: TObject);
var
   i : Integer;
begin
   try
      for i := 0 to (tbsDetalheParcela.ControlCount - 1) do begin

         if (tbsDetalheParcela.Controls[i] is TDBEdit) then begin

            if (tbsDetalheParcela.Controls[i] as TDBEdit).DataSource.DataSet.FieldByName((tbsDetalheParcela.Controls[i] as TDBEdit).DataField).IsNull then
            begin
               (tbsDetalheParcela.Controls[i] as TDBEdit).Color := clBtnFace;
            end else begin
               (tbsDetalheParcela.Controls[i] as TDBEdit).Color := clWindow;
            end;

         end;(* if TDBEdit *)


         if (tbsDetalheParcela.Controls[i] is TCMDateTimePicker) then begin

            if (tbsDetalheParcela.Controls[i] as TCMDateTimePicker).DataSource.DataSet.FieldByName((tbsDetalheParcela.Controls[i] as TCMDateTimePicker).DataField).IsNull then
            begin
               (tbsDetalheParcela.Controls[i] as TCMDateTimePicker).Color := clBtnFace;
            end else begin
               (tbsDetalheParcela.Controls[i] as TCMDateTimePicker).Color := clWindow;
            end;

         end; // if TCMDateTimePicker *)

      end; // for tbsDetalheParcela *)
   except
      //
   end;
end;



procedure TfrmRelContrato.btnImprimirClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('Deseja imprimir o Contrato?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

      Imprime;

   end;
end;



procedure TfrmRelContrato.Imprime;
var
   sSQL, sSqldoUsuario, sArquivoTemp, sSQLTemp : String;
   qryAux : TwwQuery;
begin
   sSql :=
   'SELECT'                                                                      + #13 +
   '  TIP.IDREPORTS, TIP.ORIGEMCM '                                              + #13 +
   'FROM '                                                                       + #13 +
   '  TIPOCONTREMPTMO  TIP, '                                                    + #13 +
   '  TIPOEMPTMO TEM '                                                           + #13 +
   'WHERE '                                                                      + #13 +
   '      ( TIP.IDTIPOEMPTMO      = TEM.IDTIPOEMPTMO ) '                         + #13 +
   '  AND ( TEM.IDEMPRESAPROP     = ' + IntToStr(Sistema.idEmpresa) + ' ) '      + #13 +
   '  AND ( TIP.IDTIPOCONTREMPTMO = ' + qryIDTIPOCONTREMPTMO.AsString + ' )';

   (* Cria a Query Auxiliar *)
   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';
   qryAux.SQL.Text      := sSQL;

   try

      MostraEspera('Preparando impressão do Contrato...');


      (* Verifica se existe algum relatório parametrizável para o Tipo de Contrato *)
      try
         qryAux.Open;
      except
         MsgDlg('Não há Contrato a imprimir definido para esse Tipo de Contrato.', 'Empréstimo', mtWarning, [mbOk], 0);
         Repaint;
         Exit;
      end;


      (* Vai usar o relatório parametrizado pelo usuário *)
      if not(qryAux.IsEmpty) then begin

         sSql :=
         'SELECT '                                                                           + #13 +
         '  REP.NAME, DAT.TEMPLATE, REP.IDREPORTS, REP.ORIGEMCM '                            + #13 +
         'FROM '                                                                             + #13 +
         '  REPORTS REP, '                                                                   + #13 +
         '  DATAVIEW DAT '                                                                   + #13 +
         'WHERE '                                                                            + #13 +
         '      ( REP.IDREPORTS  = ' + qryAux.FieldByName('IDREPORTS').AsString  + ' ) '     + #13 +
//         '  AND ( REP.ORIGEMCM   = 0 ) '                                                     + #13 +
//         '  AND ( REP.ORIGEMCM   = ' + qryAux.FieldByName('ORIGEMCM').AsString   + ' ) '     + #13 +
         '  AND ( DAT.IDDATAVIEW = REP.IDDATAVIEW ) '                                        + #13 +
         '  AND ( DAT.ORIGEMCMDV = REP.ORIGEMCMDV ) ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;

         try
            qryAux.Open;
            sSqldoUsuario := qryAux.FieldByName('TEMPLATE').AsString;
         except
            MsgDlg('Erro ao tentar localizar relatórios parametrizado do usuário', 'Empréstimo',
                   mtError, [mbOk], 0);
            Repaint;
            Exit;
         end; (* try..except *)

         (* Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
            que estar no FieldsEditor e a query tem que ser RequestLive *)
         dtmRelatorios.qryDoUsuario.Close;
         dtmRelatorios.qryDoUsuario.ParamByName('IDREPORTS').AsInteger := qryAux.FieldByName('IDREPORTS').AsInteger;
         dtmRelatorios.qryDoUsuario.ParamByName('ORIGEMCM').AsInteger  := qryAux.FieldByName('ORIGEMCM').AsInteger;

         try
            dtmRelatorios.qryDoUsuario.Open;
         except
            MsgDlg('Erro ao abrir o layout do Tipo de Contrato.',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;


         if dtmRelatorios.qryDoUsuario.IsEmpty then begin
            MsgDlg('Não foi encontrado layout para o Tipo de Contrato. Favor verificar.',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;(* if IsEmpty *)


         with dtmRelatorios do begin
          // Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
          // sArquivoTemp := Sistema.TempDir + 'APrevRelContrato.tmp';
             sArquivoTemp := ftempregra + '\' + 'APrevRelContrato.tmp';
          // sSQLTemp     := Sistema.TempDir + 'APrevSQLRelContrato.sql';
             sSQLTemp     := ftempregra + '\' + 'APrevSQLRelContrato.sql';

            qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

            qryRelatParametrizavel.Close;
            qryRelatParametrizavel.SQL.Clear;
            qryRelatParametrizavel.SQL.Text := sSqldoUsuario;

            qryRelatParametrizavel.SQL.Add(' AND CONTRATOEMPTMO.IDCONTRATOEMPTMO  = ' + IntToStr(qryIDCONTRATOEMPTMO.AsInteger) );

            qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
            qryRelatParametrizavel.Open;

            dsRelatParametrizavel.DataSet                := qryRelatParametrizavel;
            pplRelatParametrizavel.DataSource            := dsRelatParametrizavel;
            rpRelatParametrizavel.Template.SaveTo        := stFile;
            rpRelatParametrizavel.Template.Format        := ftBinary;
            rpRelatParametrizavel.Template.FileName      := sArquivoTemp;
            rpRelatParametrizavel.Template.LoadFromFile;

            rpRelatParametrizavel.DataPipeline           := pplRelatParametrizavel;
//            dtpRelatParametrizavel.DataSet               := qryRelatParametrizavel;

            EscondeEspera;
            Repaint;

            (* Visualização do Contrato *)

            frmImpressaoContrato  := TfrmImpressaoContrato.Create(Application);
            frmImpressaoContrato.QryDados       := qryRelatParametrizavel;
            frmImpressaoContrato.idReports      := qryAux.FieldByName('IDREPORTS').AsInteger;
            frmImpressaoContrato.idOrigem       := qryAux.FieldByName('ORIGEMCM').AsInteger;
            frmImpressaoContrato.sNomeRelat     := 'Contrato - ' + qryIDCONTRATOEMPTMO.AsString;
            frmImpressaoContrato.bbtnConfirmarClick(Self);
            frmImpressaoContrato.bbtnSairClick(Self);

//            rpRelatParametrizavel.Print;

            DeleteFile(sArquivoTemp);
            DeleteFile(sSQLTemp);
         end;(* with *)

      end else begin

         (* Vai usar o relatório padrão *)
         MsgDlg('É necessário implementar o modelo do Contrato através do módulo Gerador de Relatórios.',
                'Empréstimo', mtInformation, [mbOk], 0);
         Repaint;

      end;(* else not qryAux.IsEmpty *)

   finally
      EscondeEspera;
      qryAux.Free;
   end;
end;



procedure TfrmRelContrato.btnAtualizaSaldoClick(Sender: TObject);
begin
   if ( (qryFLGSITUACAO.AsString = 'K') or (qryFLGSITUACAO.AsString = 'Q') ) then begin
      MsgDlg('O Contrato já teve o valor de quitação calculado.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   try
//      DesabilitaBotoes;

      (* Configurando o Form com a Barra de Progresso que será usado na função CalculaItensAtualiza *)
      with frmProgresso do begin
         BotaoVisivel    := True;
         BotaoHabilitado := True;
      end;

      vLista := nil;
      
      rContrato.IDSitPart := qryIDSITPART.AsInteger;
      
      if not(CalcEmptmo.CalculaItensQuitacao(rContrato,
                                             3, // Origem
                                             sDiaSldDev,
                                             edtDataQuitacao.Date,
                                             vLista,
                                             True, True) ) then
      begin
         MsgDlg('Houve ERRO no cálculo dos itens de atualização. Favor verificar a(s) Regra(s) associada(s).',
                'Empréstimo', mtError, [mbOk], 0);
         Repaint;

         (* Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            por Cancelamento do Usuário, logo o procedimento será abortado *)
         Exit;
      end;

      lblSaldoAtualizado.Caption := 'Saldo atualizado em ' + edtDataQuitacao.Text + ':';

      PreencheTabelaVirtual;

   finally
      EscondeFormProgresso;

      if btnAtualizaSaldo.CanFocus then btnAtualizaSaldo.SetFocus;
      Repaint;

//      HabilitaBotoes;
   end;
end;



procedure TfrmRelContrato.PreencheTabelaVirtual;
var
   i           : Integer;
   sAno, sMes  : String;
   fSaldo      : Currency;
begin
   qryHistMovVirtual.Close;
   qryHistMovVirtual.Open;

   (* Laço que varre o vetor Lista inserindo na tabela virtual TODOS os itens calculados *)

   fSaldo := 0;
   for i := 0 to High(vLista) do begin

      qryHistMovVirtual.Insert;

      qryHistMovVirtualITEDESCRICAO.AsString       := vLista[i].Nome;
      qryHistMovVirtualANOMES.AsString             := sMes + '/' + sAno;
      qryHistMovVirtualHMEANOCOMPETENCIA.AsInteger := vLista[i].AnoCompetencia;
      qryHistMovVirtualHMEMESCOMPETENCIA.AsInteger := vLista[i].MesCompetencia;
      qryHistMovVirtualHMESEQCOBRANCA.AsInteger    := vLista[i].SeqCobranca;
      qryHistMovVirtualHMETIPOMOV.AsInteger        := vLista[i].iEvento;

      case vLista[i].iEvento of
        0: qryHistMovVirtualEVENTO.AsString := 'Concessão';
        1: qryHistMovVirtualEVENTO.AsString := 'Parcela';
        2: qryHistMovVirtualEVENTO.AsString := 'Amortização';
        3: qryHistMovVirtualEVENTO.AsString := 'Quitação';
        4: qryHistMovVirtualEVENTO.AsString := 'Atualização Débito';
      end;(* case *)

      qryHistMovVirtualIDCONTRATOEMPTMO.AsInteger  := rContrato.IDContratoEmptmo;
      qryHistMovVirtualIDITEMEMPTMO.AsInteger      := vLista[i].CodigoItem;
      qryHistMovVirtualHMEDATAPREVISTA.AsDateTime  := vLista[i].DataPrevista;
      qryHistMovVirtualHMEVLRPREVISTO.AsCurrency   := vLista[i].Valor;
      qryHistMovVirtualHMESALDODEV.AsCurrency      := vLista[i].SaldoDevedor;
      qryHistMovVirtualHMETXJUROS.AsCurrency       := vLista[i].TxJuros;
      qryHistMovVirtualHMEPARCELA.AsInteger        := vLista[i].Parcela;

      qryHistMovVirtual.Post;

      if (vLista[i].FlgCentraliza = 1) or (vLista[i].FlgDestacado = 1) then
         fSaldo := fSaldo + vLista[i].Valor;

   end; (* for *)

   edtSaldoAtual.Value          := fSaldo;
end;



procedure TfrmRelContrato.DBgrdItensAbertoTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelContrato.DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelContrato.DBgrdItensAbertoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin

      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmRelContrato.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;

   (* faz com que as linhas do grid tenham cores alternadas *)
   if State <> [gdSelected] then begin

      if not Highlight then begin
         (* linhas ímpares = amarelo, linhas pares = branco *)
         if ((Sender as TwwDBGrid).CalcCellRow mod 2) = 0 then begin
            ABrush.Color := $00C0FFFF; (* amarelo bebê *)
         end else begin
            ABrush.Color := clWhite;
         end;
      end;

   end else begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmRelContrato.rdgExibeClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato.rdgEstornoClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato.chkOrdemClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato.FormShow(Sender: TObject);
begin
   inherited;

   pgcDados.ActivePageIndex         := 0;

   edtDataQuitacao.Date             := Sysdate;

//   edtDataIni.Date                  := DiasUteis.SomaMeses(Sysdate, -2);
//   edtDataIni.Modified              := False;

   cboEvento.ItemIndex              := 0;

//   DBspnAnoCompIni.Value            := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(Sysdate, -2));
//   cboMesCompIni.ItemIndex          := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(Sysdate, -2)) -1;

//   DBspnAnoCompFim.Value            := DiasUteis.ExtraiAno(Sysdate);
//   cboMesCompFim.ItemIndex          := DiasUteis.ExtraiAno(Sysdate) -1;

   DBspnAnoCobIni.Value             := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(Sysdate, -2));
   cboMesCobIni.ItemIndex           := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(Sysdate, -2)) -1;

   DBspnAnoCobFim.Value             := DiasUteis.ExtraiAno(Sysdate);
   cboMesCobFim.ItemIndex           := DiasUteis.ExtraiAno(Sysdate) -1;

//   edtDataIni.ButtonWidth           := 21;
//   edtDataIni.ButtonWidth           := 21;

   DBedtDataInsc.ButtonWidth        := 20;
   DBedtDataCredito.ButtonWidth     := 20;
   DBedtDataAssinatura.ButtonWidth  := 20;
   DBedtDtCancelamento.ButtonWidth  := 20;
   DBedtDataPrimParcela.ButtonWidth := 20;
   DBedtDataPrevisao.ButtonWidth    := 20;
   DBedtDataEfetiva.ButtonWidth     := 20;
   DBedtDataUltAtualiza.ButtonWidth := 20;
   edtDataQuitacao.ButtonWidth      := 20;

   CMDateTimePicker1.ButtonWidth    := 20;
   CMDateTimePicker2.ButtonWidth    := 20;
   CMDateTimePicker3.ButtonWidth    := 20;
   CMDateTimePicker4.ButtonWidth    := 20;
   CMDateTimePicker5.ButtonWidth    := 20; 
   CMDateTimePicker6.ButtonWidth    := 20;


   lblTitulo.Caption                := '';

   ParametrosSistema;
   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         0: sDiaSldDev := 'C';
         1: sDiaSldDev := 'A';
      end;
   end;

   pnlTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   dtmLookEmptmo.qryLookItemEmprestimo.Open;

   if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus; 
end;



procedure TfrmRelContrato.chkFaixaDatasClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;

   if plnFiltro.Height = 150 then begin
      plnFiltro.Height := 0;
   end else begin
      plnFiltro.Height := 150;
   end;

   Repaint;
end;



procedure TfrmRelContrato.cboMesCobIniExit(Sender: TObject);
begin
   inherited;
   iIndiceFim := cboMesCobIni.ItemIndex;
   if iIndiceIni <> iIndiceFim then AbreQueriesHistorico;
end;



procedure TfrmRelContrato.DBspnAnoCobIniExit(Sender: TObject);
begin
   inherited;
   if DBspnAnoCobIni.Modified then AbreQueriesHistorico;
end;



procedure TfrmRelContrato.cboMesCobFimExit(Sender: TObject);
begin
   inherited;
   iIndiceFim := cboMesCobFim.ItemIndex;
   if iIndiceIni <> iIndiceFim then AbreQueriesHistorico;
end;



procedure TfrmRelContrato.DBspnAnoCobFimExit(Sender: TObject);
begin
   inherited;
   iIndiceFim := cboMesCobIni.ItemIndex;
   if iIndiceIni <> iIndiceFim then AbreQueriesHistorico;
end;



procedure TfrmRelContrato.cboMesCobIniEnter(Sender: TObject);
begin
   inherited;
   iIndiceIni := cboMesCobIni.ItemIndex;
end;



procedure TfrmRelContrato.cboMesCobFimEnter(Sender: TObject);
begin
   inherited;
   iIndiceIni := cboMesCobFim.ItemIndex;
end;



procedure TfrmRelContrato.qryHistMovVirtualAfterClose(DataSet: TDataSet);
begin
   inherited;
   lblSaldoAtualizado.Caption := 'Saldo atualizado: ';
end;



procedure TfrmRelContrato.pgcDadosChange(Sender: TObject);
begin
   inherited;
//   pnlHistBaca.Visible := (pgcDados.ActivePage = tbsParcelas);

   if pgcDados.ActivePage = tbsCondicoes then pnlTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   // se for FUNCEF, mostra ou não o grupo com os flags do item
   if pgcDados.ActivePage = tbsDetalheParcela then
   begin
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
      begin
         grpFlags.Visible := (qryHistMovHMECENTRALIZA.AsInteger = 1) or (qryHistMovHMEDESTACADO.AsInteger = 1);
      end;
   end;
end;



procedure TfrmRelContrato.btnNovoClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmCadHistMovEmptmo, frmCadHistMovEmptmo);

   try

      frmCadHistMovEmptmo.qry.Close;
      frmCadHistMovEmptmo.qry.ParamByName('IDHISTMOVEMPTMO').AsInteger := 1;
      frmCadHistMovEmptmo.qry.Open;

      frmCadHistMovEmptmo.IDTipoEP  := qryIDTIPOEMPTMO.AsInteger;
      frmCadHistMovEmptmo.iAcao     := 1; // Inserção

      frmCadHistMovEmptmo.ShowModal;

   finally

      frmCadHistMovEmptmo.Release;

      Repaint;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open;;

   end; (* try...finally *)
end;



procedure TfrmRelContrato.btnAlteraClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmCadHistMovEmptmo, frmCadHistMovEmptmo);

   try
      frmCadHistMovEmptmo.qry.Close;
      frmCadHistMovEmptmo.qry.ParamByName('IDHISTMOVEMPTMO').AsInteger := qryHistMovIDHISTMOVEMPTMO.AsInteger;
      frmCadHistMovEmptmo.qry.Open;


      frmCadHistMovEmptmo.IDItem := qryHistMovIDITEMEMPTMO.AsInteger;
      frmCadHistMovEmptmo.iAcao  := 2; // Alteração

      frmCadHistMovEmptmo.ShowModal;
   finally
      frmCadHistMovEmptmo.Release;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open;;
   end;
end;



procedure TfrmRelContrato.btnExcluirClick(Sender: TObject);
var
   qryAux : TwwQuery;
begin
   inherited;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';

   if MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes, mbNo],0) = mrNo then Exit;
   if MsgDlg('Este registro será excluído. Confirma?', 'Exclusão', mtConfirmation, [mbYes, mbNo],0) = mrNo then Exit;

   qryAux.SQL.Add('DELETE FROM HISTMOVEMPTMO WHERE IDHISTMOVEMPTMO = ' + qryHistMovIDHISTMOVEMPTMO.AsString);

   if not(dtmBaseDados.dbBaseDados.InTransaction) then dtmBaseDados.dbBaseDados.StartTransaction;

   try
      qryAux.ExecSQL;
//      ShowMessage('Registro excluído com sucesso.');

      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Commit;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open;

   except
      ShowMessage('Não foi possível apagar este registro.');
      if dtmBaseDados.dbBaseDados.InTransaction then dtmBaseDados.dbBaseDados.Rollback;
   end;
end;



procedure TfrmRelContrato.Image1DblClick(Sender: TObject);
begin
   if ( (lowercase(Sistema.NomeUsuario) = 'super') or
        (lowercase(Sistema.NomeUsuario) = 'cm') or
        (lowercase(Sistema.NomeUsuario) = 'cm4992') or
//        (lowercase(Sistema.NomeUsuario) = 'cb00730') or
        (pos('cm.', lowercase(Sistema.NomeUsuario)) > 0) or
        (pos('.cm', lowercase(Sistema.NomeUsuario)) > 0)
      ) then
   begin
      pnlHistBaca.Visible := not(pnlHistBaca.Visible);
   end;
end;



procedure TfrmRelContrato.rdgOrdenaClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato.BitBtn1Click(Sender: TObject);
var
   sFlag       : String;
   sSQL        : String;
   qryAltera   : TwwQuery;
begin
   inherited;

   case cboFlgSituacao.ItemIndex of
      0: sFlag := 'A';  // Ativo
      1: sFlag := 'C';  // Cancelado
      2: sFlag := 'E';  // Encerrado
      3: sFlag := 'K';  // Pendente de Quitação
      4: sFlag := 'Q';  // Quitado
   end;

   sSQL :=
   'UPDATE '                                 + #13 +
   '  CONTRATOEMPTMO '                       + #13 +
   'SET '                                    + #13 +
   '  FLGSITUACAO = ' + QuotedStr(sFlag)     + #13 +
   'WHERE '                                  + #13 +
   '  IDCONTRATOEMPTMO = ' + IntToStr(qryIDCONTRATOEMPTMO.AsInteger);


   qryAltera               := TwwQuery.Create(Application);
   qryAltera.DatabaseName  := 'BASEDADOS';
   qryAltera.SQL.Text      := sSQL;
   qryAltera.ExecSQL;

   qryAltera.Close;
   qryAltera.Free;
end;



procedure TfrmRelContrato.FormCreate(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TdtmRelatorios, dtmRelatorios);
end;



procedure TfrmRelContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dtmRelatorios.Free;
   inherited;
end;



procedure TfrmRelContrato.DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   if chkFiltroItem.Checked then AbreQueriesHistorico;
end;



procedure TfrmRelContrato.cboEventoChange(Sender: TObject);
begin
   inherited;
   if chkFiltroEvento.Checked then AbreQueriesHistorico;
end;



procedure TfrmRelContrato.qryHistMovHMEVLREFETIVOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   inherited;

   if not(qryHistMovHMEVLREFETIVO.IsNull) then
   begin
      Text := FormatFloat('#,#0.00;(#,#0.00)', qryHistMovHMEVLREFETIVO.AsFloat);
   end;

   if not(qryHistMovHMEVLREFETIVO.IsNull) then
   begin
      if qryHistMovFLGABONADO.AsInteger   = 1 then Text := 'abonado';
      if qryHistMovFLGQUITADO.AsInteger   = 1 then Text := 'quitado';
      if qryHistMovFLGESTORNADO.AsInteger = 1 then Text := 'estornado';
   end;
end;



end.
