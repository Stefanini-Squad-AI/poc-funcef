unit RContrato_92695_395894;

//    Sistema.TipoCliente

//    Código   Cliente
//    -------- -------
//    19971    REFER
//    19981    CBS
//    19991    FUNCEF
//    20011    BRTPREV
//    20041    VALIA

// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      :
Autor     :
Pendencia :
Descrição :
----------------------------------------------------------------------------------------------------
Rotina    : FormShow
Data      : 28/03/2007
Autor     : Marchetti
Pendencia : 22042
Descrição : Colocado processo para mostrar form com os contratos da matricula passada pela CentralAP
----------------------------------------------------------------------------------------------------
Rotina    : Sel
Data      : 09/08/2005
Autor     : André Pontes
Pendencia : 19920
Descrição : Se for BrTPrev, a data da situação deve ser a de quitaçào, se o contrato estiver quitado,
            ou a de crédito, se o contrato estiver ativo.
----------------------------------------------------------------------------------------------------
Rotina    : CalculaItensQuitacao
Data      : 14/06/2004 a
Autor     : André Pontes
Pendencia : 16984
Descrição : Passagem da data de falecimento (nesse caso, -1)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 15/07/2003
Autor     : Marchetti
Descrição : Mudança na ordenação dos itens em aberto, colocando por parcela e evento
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 14/07/2003
Autor     : Marchetti
Descrição : Conforme FLGEXCEPCIONAL, Abrir MontaSelect especifico FUNCEF na busca de contrato, visando
            poder consultar contratos de participantes que saíram da FUNCEF.
            (FLGDESATIVADO na PartPrevPlan)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 06/01/2002
Autor     : André Pontes
Descrição : Exibição da data de inclusão, origem e usuário que incluiu o item
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 17/12/2002
Autor     : André Pontes
Descrição : Nova opção de filtro: itens em aberto
            Exibição diferenciada dos itens abonados e quitados
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 13/12/2002
Autor     : André Pontes
Descrição : Novas opções de filtro: por Item e por Evento
----------------------------------------------------------------------------------------------------
Rotina    : - (grpFlgas)
Data      : 12/12/2002
Autor     : André Pontes
Descrição : Só verifica se deve esconder os campos se tiver flgCalcDia = 1 (FUNCEF)
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 18/11/2002
Autor     : Marchetti
Descrição : Na página de Histórico foi criada a coluna que contém o tipo de operação relacionada ao
            item, ou seja, se abate saldo devedor, coloca sinal negativo, se incorpora saldo devedor,
            coloca sinal positivo, se não trata, deixa em branco
----------------------------------------------------------------------------------------------------
Rotina    : qryHistMov
Data      : 18/11/2002
Autor     : Marchetti
Descrição : Colocado comando no SELECT para fazer o DECODE conforme o ITCTRATASALDODEV
----------------------------------------------------------------------------------------------------
Rotina    : Exibição do Histórico (Filtro)
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Não traz o checkbox de filtro de movimentação já marcado
----------------------------------------------------------------------------------------------------
Rotina    : Exibição do Histórico (qryHistMov)
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Itens de quitação por morte são exibidos mesmo quando são selecionados apenas os itens
            centralizadores: quitação por morte tem centralizador (item do líquido) com valor ZERO
----------------------------------------------------------------------------------------------------
Rotina    : btnAtualizaSaldoClick
Data      : 08/10/2002
Autor     : André Pontes
Descrição : Verificação do status do contrato. Se for 'Q' ou 'K', envia msg e não prossegue.
----------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado na query de parcelas restantes um filtro para não se levar em consideração
            item estornado
---------------------------------------------------------------------------------------------------}

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, wwdbdatetimepicker, CMDateTimePicker, TREdit,
   Mask, DBCtrls, ComCtrls, fcLabel, Db, DBTables, Wwquery, Wwdatsrc, Grids,
   Wwdbigrd, Wwdbgrid, wwdblook, fcButton, fcImgBtn,
   fcShapeBtn, wwdbedit, Wwdbspin, Wwdotdot, Wwdbcomb, MontaSelect,
   uCtrlContab, uCtrlPadroes,
   // Marchetti - Pendencia 26267
   UAutorizacao,
   // Fim Marchetti - Pendencia 26267

   uTypesEmptmo, TB97Ctls, UIntegraModulo, uCMFileUtils;

type
   TfrmRelContrato_92695_395894 = class(TfrmSairAjudaImob)
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
      Label4: TLabel;
      Label34: TLabel;
      Label41: TLabel;
      Label18: TLabel;
      DBedtCodInsc: TDBEdit;
      DBedtPlanoPrev: TDBEdit;
      DBedtPatro: TDBEdit;
      DBedtInscricao: TDBEdit;
      DBedtMtrEmpresa: TDBEdit;
      DBedtSitPart: TDBEdit;
      dts: TwwDataSource;
      qry: TwwQuery;
      DBgrdHistMov: TwwDBGrid;
      dtsHistMov: TwwDataSource;
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
      ToolbarSep973: TToolbarSep97;
      btnImprimir: TBitBtn;
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
      qryParcelasRestantes: TwwQuery;
      qryParcelasRestantesPARCELAS_RESTANTES: TFloatField;
      tbsBenefSeguro: TTabSheet;
      qryBenefSeguro: TwwQuery;
      wwDBGrid3: TwwDBGrid;
      dsBenefSeguro: TDataSource;
      pnlHistBaca: TPanel;
      btnAltera: TfcShapeBtn;
      btnNovo: TfcShapeBtn;
      btnExcluir: TfcShapeBtn;
      pnlTitular: TPanel;
      DBedtBeneficiario: TDBEdit;
      Label2: TLabel;
      Image1: TImage;
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
      Bevel1: TBevel;
      DBcboItem: TwwDBLookupCombo;
      chkFiltroEvento: TCheckBox;
      chkFiltroItem: TCheckBox;
      dtsTotalizaAberto: TwwDataSource;
      cboEvento: TComboBox;
      rdgFiltroEmAberto: TRadioGroup;
      fcShapeBtn2: TfcShapeBtn;
      lblInternet: TfcLabel;
      GroupBox3: TGroupBox;
      Label7: TLabel;
      Label9: TLabel;
      Label10: TLabel;
      DBedtBanco: TDBEdit;
      DBedtAgencia: TDBEdit;
      DBedtContaCorrente: TDBEdit;
      GroupBox4: TGroupBox;
      Label64: TLabel;
      Label65: TLabel;
      Label66: TLabel;
      DBEdit15: TDBEdit;
      DBEdit16: TDBEdit;
      DBEdit17: TDBEdit;
      pgcDetalhe: TPageControl;
      TabSheet1: TTabSheet;
      TabSheet2: TTabSheet;
      TabSheet3: TTabSheet;
      Label15: TLabel;
      Label24: TLabel;
      Label37: TLabel;
      Label45: TLabel;
      Label20: TLabel;
      Label59: TLabel;
      Label60: TLabel;
      Label61: TLabel;
      Bevel3: TBevel;
      Bevel4: TBevel;
      Label62: TLabel;
      DBedtEvento: TDBEdit;
      DBedtItem: TDBEdit;
      DBedtDataPrevisao: TCMDateTimePicker;
      DBedtDataEfetiva: TCMDateTimePicker;
      CMDateTimePicker1: TCMDateTimePicker;
      DBEdit1: TDBEdit;
      CMDateTimePicker6: TCMDateTimePicker;
      DBEdit11: TDBEdit;
      CMDateTimePicker7: TCMDateTimePicker;
      DBEdit12: TDBEdit;
      DBEdit13: TDBEdit;
      DBedtCompetencia: TDBEdit;
      label100: TLabel;
      Label28: TLabel;
      DBedtCobranca: TDBEdit;
      DBedtValorPrevisto: TDBEdit;
      Label11: TLabel;
      Label26: TLabel;
      DBedtValorEfetivo: TDBEdit;
      GroupBox2: TGroupBox;
      Label19: TLabel;
      Label16: TLabel;
      Label25: TLabel;
      DBedtTxJuros: TDBEdit;
      DBedtSaldoDev: TDBEdit;
      DBedtDataUltAtualiza: TCMDateTimePicker;
      CMDateTimePicker8: TCMDateTimePicker;
      Label63: TLabel;
      GroupBox6: TGroupBox;
      Label32: TLabel;
      Label33: TLabel;
      DBedtPlanilha: TDBEdit;
      DBedtPlanil: TDBEdit;
      DBedtPlanilhaEstorno: TDBEdit;
      DBedtPlanilEstorno: TDBEdit;
      GroupBox5: TGroupBox;
      Label35: TLabel;
      Label40: TLabel;
      Label52: TLabel;
      DBedtCodDocumento: TDBEdit;
      DBedtDestinoEnvio: TDBEdit;
      DBedtTipoFolha: TDBEdit;
      DBEdit5: TDBEdit;
      DBchkEnvio: TDBCheckBox;
      DBchkBaixado: TDBCheckBox;
      DBCheckBox3: TDBCheckBox;
      DBCheckBox4: TDBCheckBox;
      DBcboTipoDiverg: TwwDBComboBox;
      DBCheckBox6: TDBCheckBox;
      DBchkEstornado: TDBCheckBox;
      CMDateTimePicker5: TCMDateTimePicker;
      Label46: TLabel;
      DBCheckBox1: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      CMDateTimePicker2: TCMDateTimePicker;
      DBCheckBox5: TDBCheckBox;
      DBCheckBox7: TDBCheckBox;
      Bevel2: TBevel;
      Bevel5: TBevel;
      DBCheckBox8: TDBCheckBox;
      CMDateTimePicker9: TCMDateTimePicker;
      Bevel7: TBevel;
      Label67: TLabel;
      wwDBComboBox1: TwwDBComboBox;
      Label68: TLabel;
      Label69: TLabel;
      Bevel6: TBevel;
      Bevel8: TBevel;
      Bevel9: TBevel;
      DBCheckBox9: TDBCheckBox;
      DBCheckBox10: TDBCheckBox;
      DBCheckBox11: TDBCheckBox;
      DBCheckBox12: TDBCheckBox;
      DBEdit18: TDBEdit;
      Label70: TLabel;
    tbsObservacao: TTabSheet;
      DBRichEdit1: TDBRichEdit;
      pgcSecundario: TPageControl;
      TabSheet5: TTabSheet;
      Label43: TLabel;
      Label12: TLabel;
      Label1: TLabel;
      Label3: TLabel;
      Label5: TLabel;
      Label47: TLabel;
      DBedtDataAssinatura: TCMDateTimePicker;
      DBedtDataCredito: TCMDateTimePicker;
      DBedtDataInsc: TCMDateTimePicker;
      DBedtDataPrimParcela: TCMDateTimePicker;
      DBedtDtCancelamento: TCMDateTimePicker;
      DBEdit2: TDBEdit;
      pgcValores: TTabSheet;
      DBedtValSolic: TDBEdit;
      Label17: TLabel;
      DBedtJuros: TDBEdit;
      Label21: TLabel;
      DBedtParcelas: TDBEdit;
      Label44: TLabel;
      dbEdtNumParcDesc: TDBEdit;
      Label71: TLabel;
      edtSaldoDevedor: TRealEdit;
      Label42: TLabel;
      DBedtValorParcela: TDBEdit;
      Label39: TLabel;
      edtParcRestante: TRealEdit;
      Label38: TLabel;
      Label13: TLabel;
      DBedtTipoContrato: TDBEdit;
      DBEdit4: TDBEdit;
      Label51: TLabel;
      DBedtTipoEmptmo: TDBEdit;
      Label14: TLabel;
      TabSheet6: TTabSheet;
      GroupBox1: TGroupBox;
      Label48: TLabel;
      Label49: TLabel;
      Label50: TLabel;
      DBEdit3: TDBEdit;
      CMDateTimePicker3: TCMDateTimePicker;
      CMDateTimePicker4: TCMDateTimePicker;
      CMDateTimePicker10: TCMDateTimePicker;
      Label72: TLabel;
      qryINSCRICAO: TFloatField;
      qryFLGINTERNET: TFloatField;
      qryINSCRICAONUMERO: TFloatField;
      qryDESCSITCONTRATO: TStringField;
      qryDESCFLGFORMAPAG: TStringField;
      qryDESCFLGFORMAREC: TStringField;
      qryDESCCODFORMAPAG: TStringField;
      qryDESCPORTFORMAPAG: TStringField;
      qryDESCPORTFORMAREC: TStringField;
      qryIDSITPART: TFloatField;
      qrySITUACAO: TStringField;
      qryFLGINTERNO: TStringField;
      qryPLANOPREV: TStringField;
      qryPATRO: TStringField;
      qryMATRICULA: TStringField;
      qryTITULAR: TStringField;
      qryBENEFICIARIO: TStringField;
      qryTCEDESCRICAO: TStringField;
      qryIDTIPOEMPTMO: TFloatField;
      qryDESCTIPOEMPTMO: TStringField;
      qryDATAINSC: TDateTimeField;
      qryBANCO: TStringField;
      qryCONTACORRENTE: TStringField;
      qryNUMAGENCIA: TStringField;
      qryIDCONTRATOEMPTMO: TFloatField;
      qryIDCONTRQUITACAO: TFloatField;
      qryIDPESSOA: TFloatField;
      qryIDVERBA: TFloatField;
      qryIDTIPOCONTREMPTMO: TFloatField;
      qryIDPLANOPREV: TFloatField;
      qryIDPATRO: TFloatField;
      qryNUMPARCELAS: TFloatField;
      qryIDINSCRICAOEMPTMO: TFloatField;
      qryIDBENEF: TFloatField;
      qryIDCBANCARIA: TFloatField;
      qryIDCBANCARIADEB: TFloatField;
      qryCODFORMAPAG: TFloatField;
      qryPORTFORMAPAG: TFloatField;
      qryPORTFORMAREC: TFloatField;
      qryDATACANC: TDateTimeField;
      qryDATACREDITO: TDateTimeField;
      qryDATASITUACAO: TDateTimeField;
      qryDATAASSINATURA: TDateTimeField;
      qryDATAPRIMPARC: TDateTimeField;
      qryVLRCONTRATO: TFloatField;
      qryVLRPARCELA: TFloatField;
      qryTXJUROS: TFloatField;
      qryFLGSITUACAO: TStringField;
      qryFLGFORMAREC: TStringField;
      qryFLGFORMAPAG: TStringField;
      qryVLRSALBASE: TFloatField;
      qryVLRMARGEM: TFloatField;
      qryVLRMAXPERMIT: TFloatField;
      qryMOECODIGO: TFloatField;
      qryIDTIPOSUSPEMPTMO: TFloatField;
      qryDATAINICIOSUSP: TDateTimeField;
      qryDATAFIMSUSP: TDateTimeField;
      qryANOSUSPENSAO: TFloatField;
      qryMESSUSPENSAO: TFloatField;
      qryIDPLANOORIGEM: TFloatField;
      qryMOESIGLA: TStringField;
      qryTSEDESCRICAO: TStringField;
      qryNOMERESPONSAVEL: TStringField;
      qryBANCODEB: TStringField;
      qryCONTACORRENTEDEB: TStringField;
      qryNUMAGENCIADEB: TStringField;
      qryNUMPARCDESCONTO: TFloatField;
      Panel3: TPanel;
      Panel4: TPanel;
      chkAtuDia: TCheckBox;
      chkFaixaDatas: TCheckBox;
      edtDataIni: TCMDateTimePicker;
      edtDataFim: TCMDateTimePicker;
      Label73: TLabel;
      Label74: TLabel;
      DBEdit19: TDBEdit;
      btnRefresh: TToolbarButton97;
      btnAjustaSaldo: TBitBtn;
      ToolbarSep974: TToolbarSep97;
      DBEdit20: TDBEdit;
      Label76: TLabel;
      DBEdit21: TDBEdit;
      Label77: TLabel;
      DBCheckBox13: TDBCheckBox;
      DBCheckBox14: TDBCheckBox;
      DBCheckBox15: TDBCheckBox;
      DBCheckBox16: TDBCheckBox;
      DBCheckBox17: TDBCheckBox;
      DBCheckBox18: TDBCheckBox;
      GroupBox7: TGroupBox;
      Label22: TLabel;
      Label23: TLabel;
      DBedtParcela: TDBEdit;
      DBEdit14: TDBEdit;
      DBEdit22: TDBEdit;
      Label78: TLabel;
      DBEdit23: TDBEdit;
      Label79: TLabel;
      DBEdit24: TDBEdit;
      Label80: TLabel;
      qrySITUACAO_PLANO: TStringField;
      qrySITUACAO_FUNC: TStringField;
      DBEdit25: TDBEdit;
      DBEdit26: TDBEdit;
      DBEdit27: TDBEdit;
      qrySITUACAO_INT: TStringField;
      qrySITUACAO_INT_PLANO: TStringField;
      qrySITUACAO_INT_FUNC: TStringField;
      DBEdit28: TDBEdit;
      Label81: TLabel;
      qryPLANOORIGEM: TStringField;
      DBEdit29: TDBEdit;
      Label82: TLabel;
      DBEdit30: TDBEdit;
      Label83: TLabel;
      btnAjustaSituacao: TBitBtn;
      DBText1: TDBText;
      qryTCELEGENDAEXIBE: TStringField;
      qryTCELEGENDACALC: TStringField;
      DBText2: TDBText;
      fcShapeBtn3: TfcShapeBtn;
      qryHistMov: TwwQuery;
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
      qryHistMovFORMACOBRANCA: TStringField;
      qryHistMovTIPOFOLHA: TStringField;
      qryHistMovPLNPLANIL: TFloatField;
      qryHistMovPLANIL_ESTORNO: TFloatField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAQUITABONO: TDateTimeField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovFLGDIVERGPEND: TFloatField;
      qryHistMovFLGSUSPENSAO: TFloatField;
      qryHistMovFLGTIPODIVERG: TFloatField;
      qryHistMovFLGDIVERGTRAT: TFloatField;
      qryHistMovTIPO_OPERACAO: TStringField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovHMEDATAESTORNO: TDateTimeField;
      qryHistMovTRGDTINCLUSAO: TDateTimeField;
      qryHistMovTRGUSERINCLUSAO: TStringField;
      qryHistMovNOMEUSUARIO: TStringField;
      qryHistMovHMEDATA: TDateTimeField;
      qryHistMovVERSAO: TStringField;
      qryHistMovFLGENTRADAMANUAL: TFloatField;
      qryHistMovHMEDATARECEB: TDateTimeField;
      qryHistMovHMEDATADIVERGTRAT: TDateTimeField;
      qryHistMovFLGTIPODIVERGTRAT: TFloatField;
      qryHistMovHMEDATAENVIO: TDateTimeField;
      qryHistMovEVENTO: TStringField;
      qryHistMovORIGEM: TStringField;
      qryHistMovUSU_ESTORNO: TStringField;
      qryHistMovIDTMPDESC: TFloatField;
      qryHistMovHMEPARCELAALT: TFloatField;
      Label84: TLabel;
      Label85: TLabel;
      DBEdit31: TDBEdit;
      DBEdit32: TDBEdit;
      qryHistMovCCDEBFINAN: TStringField;
      qryHistMovCCCREDFINAN: TStringField;
      rdgRecPag: TDBRadioGroup;
      qryHistMovHMERECPAG: TStringField;
      Label86: TLabel;
      DBEdit33: TDBEdit;
      qryCEDIDO: TStringField;
      DBmemObsBenef: TDBMemo;
      qryBenefSeguroIDINSCRICAOEMPTMO: TFloatField;
      qryBenefSeguroIDBENEFSEGURO: TFloatField;
      qryBenefSeguroPERCINDENIZACAO: TFloatField;
      qryBenefSeguroVLRSALDOREC: TFloatField;
      qryBenefSeguroVLRREPASSE: TFloatField;
      qryBenefSeguroDATAREPASSE: TDateTimeField;
      qryBenefSeguroBANCO: TStringField;
      qryBenefSeguroNOME: TStringField;
      qryBenefSeguroOBS: TStringField;
      qryItensAbertoQUANT_ABERTO: TFloatField;
      qryItensAbertoVALOR_TOTAL_ABERTO: TFloatField;
      Bevel10: TBevel;
      Label87: TLabel;
      DBEdit34: TDBEdit;
      qryHistMovTSEDESCRICAO: TStringField;
      DBText3: TDBText;
      DBText4: TDBText;
      qryHistMovSITENVIO: TStringField;
      qryHistMovSTATUS_DOC: TStringField;
      btnAlteraHistContrato: TfcShapeBtn;
      DBEdit35: TDBEdit;
      qryHistMovNODOCUMENTO: TFloatField;
      qryHistMovCONCAT_PARCELAS: TStringField;
      tbsLogTotalprev: TTabSheet;
      qryLogTotalPrev: TwwQuery;
      dsLogTotalPrev: TwwDataSource;
      DBgrdLogContrato: TwwDBGrid;
      DBMemo1: TDBMemo;
      qryLogTotalPrevIDLOGTOTALPREV: TFloatField;
      qryLogTotalPrevIDMODULO: TFloatField;
      qryLogTotalPrevIDCONTRATOEMPTMO: TFloatField;
      qryLogTotalPrevIDHISTMOVEMPTMO: TFloatField;
      qryLogTotalPrevORIGEM: TFloatField;
      qryLogTotalPrevDESC_ORIGEM: TStringField;
      qryLogTotalPrevDESCOPERACAO: TStringField;
      qryLogTotalPrevDATA: TDateTimeField;
      qryLogTotalPrevIDUSUARIO: TFloatField;
      qryLogTotalPrevVERSAO: TStringField;
      qryLogTotalPrevNOMEUSUARIO: TStringField;
      qryLogTotalPrevNOME: TStringField;
      qryDataQuitacao: TwwQuery;
      qryDataQuitacaoDATAQUITACAO: TDateTimeField;
      qryHistMovENVIADO: TStringField;
      DBEdit36: TDBEdit;
      Label88: TLabel;
      Label89: TLabel;
      DBEdit37: TDBEdit;
      tbsLogTotalPrevHist: TTabSheet;
      DBgrdLogHist: TwwDBGrid;
      DBMemo2: TDBMemo;
      dsLogTotalPrevHist: TwwDataSource;
      qryLogTotalPrevHist: TwwQuery;
      DateTimeField1: TDateTimeField;
      StringField1: TStringField;
      StringField2: TStringField;
      StringField3: TStringField;
      StringField4: TStringField;
      StringField5: TStringField;
      FloatField1: TFloatField;
      FloatField2: TFloatField;
      FloatField3: TFloatField;
      FloatField4: TFloatField;
      FloatField5: TFloatField;
      FloatField6: TFloatField;
      btnAlteraObs: TBitBtn;
      Label75: TLabel;
      DBEdit38: TDBEdit;
      qryHistMovHMEVLRBASE: TFloatField;
      rdgMetodo: TRadioGroup;
      qryHistMovHMEDATAEFETIVAORIG: TDateTimeField;
      qryHistMovHMEVLREFETIVOORIG: TFloatField;
      CMDateTimePicker11: TCMDateTimePicker;
      qryHistMovHMEDATAESTORNOALT: TDateTimeField;
      Label90: TLabel;
      Label91: TLabel;
      Label92: TLabel;
      spnParcela: TwwDBSpinEdit;
      chkParcela: TCheckBox;
      TabSheet7: TTabSheet;
      wwDBGrid4: TwwDBGrid;
      wwDBGrid5: TwwDBGrid;
      qryHistMigracoes: TwwQuery;
      dsHistMigracoes: TwwDataSource;
      qryItensMigracoes: TwwQuery;
      dsItensMigracoes: TwwDataSource;
    qryFLGUSAMARGEMALT: TFloatField;
    qryHistObservacao: TwwQuery;
    dsHistObservacao: TDataSource;
    qryHistObservacaoHMEOBSERVACAO: TMemoField;

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
      procedure rdgOrdenaClick(Sender: TObject);
      procedure BitBtn1Click(Sender: TObject);
      procedure DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      procedure cboEventoChange(Sender: TObject);
      procedure qryHistMovHMEVLREFETIVOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
      procedure qryHistMovAfterScroll(DataSet: TDataSet);
      procedure edtDataIniExit(Sender: TObject);
      procedure btnRefreshClick(Sender: TObject);
      procedure btnAjustaSaldoClick(Sender: TObject);
      procedure btnAjustaSituacaoClick(Sender: TObject);
      procedure fcShapeBtn3Click(Sender: TObject);
      procedure btnAlteraHistContratoClick(Sender: TObject);
      procedure pgcDetalheChange(Sender: TObject);
      procedure btnAlteraObsClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure qryHistMigracoesAfterScroll(DataSet: TDataSet);


   private  // Private declarations

      Contab      : TCtrlContab;

      rContrato   : TDadosContrato;
      vLista      : TListaItem;
      iIndiceIni  : Integer;
      iIndiceFim  : Integer;

      procedure Sel(i: Extended);
      procedure DesabilitaVazio;
      procedure PreencheTabelaVirtual;
      procedure AbreQueriesHistorico;
      procedure Imprime;
      function  VerificaPreenchimento: Boolean;


   public   // Public declarations

      // Marchetti - Pendencia 22042
      sMatricula : String;

   end;



var
  frmRelContrato_92695_395894: TfrmRelContrato_92695_395894;



implementation
{$R *.DFM}
uses
   uDataBase, uSistema, uMensErro, UFuncoesEmptmo, dEmptmo, dMS, FProgresso, uDiasUteis, ppTypes,
   DDividaEP, dLookEmptmo, dCalcEmptmo, FCadHistMovEmptmo, DBaseDados, dRelatoriosUsu, uCalcEmptmo,
   FConfigRelatorio, fImpressaoContrato, dAtualizacaoDiaria, FExecBuscaContrato, uLancContab,
   uIntegraBack, FCadObservacao, uVerificaPreenchimento, FExecSelecionaContrato;


procedure TfrmRelContrato_92695_395894.Sel(i: Extended);
begin
   lblTitulo.Caption := '';

   with qry do
   begin
      LimpaParametros(qry);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
      Open;
   end;

   if qry.IsEmpty then
   begin
      MsgDlg('Não foi possível buscar os dados do Contrato.', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   try
      // Troca a cor do texto de acordo com a situação do Contrato
      case qryFLGSITUACAO.AsString[1] of
         'A': lblTitulo.Font.Color  := clNavy;
         'C': lblTitulo.Font.Color  := clMaroon;
         'E': lblTitulo.Font.Color  := clOlive;
         'J': lblTitulo.Font.Color  := clMaroon;
         'K': lblTitulo.Font.Color  := clOlive;
         'Q': lblTitulo.Font.Color  := clGreen;
      end;
   except
   end;


   // ----------------------------------------------------------------------------------------------
{
   if not(qryDATASITUACAO.IsNULL) then
   begin
      lblTitulo.Caption    := qryDESCSITCONTRATO.AsString + ' (' +
                              FormatDateTime('dd/mm/yyyy', qryDATASITUACAO.AsDateTime) + ')';
   end;
}
   // ----------------------------------------------------------------------------------------------


   // André Pontes - pendência 19920 - 09/08/2005
   // ----------------------------------------------------------------------------------------------
   if (Sistema.TipoCliente = 20011) or (qryDATASITUACAO.IsNULL) then
   begin
      case qryFLGSITUACAO.AsString[1] of
         'A': lblTitulo.Caption     := qryDESCSITCONTRATO.AsString + ' (' +
                                       FormatDateTime('dd/mm/yyyy', qryDATACREDITO.AsDateTime) + ')';

         'C': lblTitulo.Caption     := qryDESCSITCONTRATO.AsString + ' (' +
                                       FormatDateTime('dd/mm/yyyy', qryDATACANC.AsDateTime) + ')';


         // ----------------------------------------------------------------------------------------
         'E', 'K', 'Q':
         begin
            with qryDataQuitacao do
            begin
               LimpaParametros(qryDataQuitacao);
               ParamByName('PIDCONTRATOEMPTMO').AsFloat := i;
               Open;

               lblTitulo.Caption     := qryDESCSITCONTRATO.AsString + ' (' +
                                        FormatDateTime('dd/mm/yyyy', qryDataQuitacaoDATAQUITACAO.AsDateTime) + ')';
            end;
         end;
         // ----------------------------------------------------------------------------------------
      end;
   end;
   // ----------------------------------------------------------------------------------------------
   // FIM André Pontes - pendência 19920 - 09/08/2005

   if Sistema.TipoCliente <> 20011 then
   begin
      lblTitulo.Caption    := qryDESCSITCONTRATO.AsString;
   end;

   lblInternet.Visible     := (qryFLGINTERNET.AsInteger = 1);

   with qryBenefSeguro do
   begin
      LimpaParametros(qryBenefSeguro);
      ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
      Open;
   end;

   with qryLogTotalPrev do
   begin
      LimpaParametros(qryLogTotalPrev);
      ParamByName('PIDCONTRATO').AsFloat  := qryIDCONTRATOEMPTMO.AsFloat;
      Open;
   end;

   qryLogTotalPrevHist.Close;

   AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.AbreQueriesHistorico;
var
   sMes : String;
   sAno : String;
begin
   ParametrosSistema;

   with qryTotalizaAberto do
   begin
      LimpaParametros(qryTotalizaAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PHMEDATAPREVISTA').asString    := DateTostr(now);
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then ParamByName('PINIBESUSP').AsInteger := 1;
      Open;
   end;

   with qryItensAberto do
   begin
      LimpaParametros(qryItensAberto);
      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryIDCONTRATOEMPTMO.AsFloat;
      ParamByName('PHMEDATAPREVISTA').asString    := DateTostr(now);
      if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then ParamByName('PINIBESUSP').AsInteger := 1;
      Open;
   end;

   with qryHistMov do
   begin
      LimpaParametros(qryHistMov);

      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;

      ParamByName('PIDCONTRATOEMPTMO').AsFloat  := qryIDCONTRATOEMPTMO.AsFloat;

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

      // Itens em Aberto ---------------------------------------------------------------------------
      if not(chkAtuDia.Checked) then
      begin
         ParamByName('PNAOEXIBEATUDIA').AsInteger := 1;
      end;

      // Datas -------------------------------------------------------------------------------------
      if chkFaixaDatas.Checked then
      begin
         if ( (length(trim(edtDataIni.Text)) > 0) or (length(trim(edtDataFim.Text)) > 0) ) then
         begin
            ParamByName('PFILTRODATA').AsInteger := 1;
            if length(trim(edtDataIni.Text)) > 0 then ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
            if length(trim(edtDataFim.Text)) > 0 then ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
         end;
      end;

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

      if chkFaixaDatas.Checked then
      begin
         if ( (length(trim(edtDataIni.Text)) > 0) or (length(trim(edtDataFim.Text)) > 0) ) then
         begin
            ParamByName('PFILTRODATA').AsInteger := 1;
            if length(trim(edtDataIni.Text)) > 0 then ParamByName('PDATAINI').AsDateTime := edtDataIni.Date;
            if length(trim(edtDataFim.Text)) > 0 then ParamByName('PDATAFIM').AsDateTime := edtDataFim.Date;
         end;
      end;

      // Parcela -----------------------------------------------------------------------------------
      if chkParcela.Checked then ParamByName('PHMEPARCELA').AsInteger := trunc(spnParcela.Value);


      // Ordenação ---------------------------------------------------------------------------------
      ParamByName('PORDEM').AsInteger := (rdgOrdena.ItemIndex + 1);

      ParamByName('PEXCEPCIONAL').AsInteger := dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger;

      Open;
   end;
end;



procedure TfrmRelContrato_92695_395894.btnBuscaContratoClick(Sender: TObject);
var
   MontaSelect : TMontaSelect;
   sValor      : String;
begin
   // **************************************************************************
   // Marchetti - 14/07/2003
   // **************************************************************************
   ParametrosSistema;

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1 then
   begin
      Application.CreateForm(TfrmExecBuscaContrato, frmExecBuscaContrato);
      frmExecBuscaContrato.Filtro := '';
      frmExecBuscaContrato.ShowModal;

      Repaint;

      if frmExecBuscaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         sValor := frmExecBuscaContrato.ValoresChave[0];
         frmExecBuscaContrato.Free;

         Screen.Cursor := crHourGlass;

         qryItensAberto.Close;
         qryHistMovVirtual.Close;
         qryHistMov.Close;

         edtSaldoAtual.Value   := 0;
         edtParcRestante.Value := 0;
         edtSaldoDevedor.Value := 0;

         // Abre a query principal com o participante escolhido
         Sel(StrToFloat(sValor));

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
         (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger)        and
         (qryFLGINTERNO.AsString = 'CA')                        then
         begin
            DBedtSitPart.Text := 'Pensionista';
         end;

         PreencheDadosContrato(qry, rContrato);

         // Pendência 23536 - Marcos Topini
         with qryHistMigracoes do begin
           LimpaParametros(qryHistMigracoes);
           ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
           Open;

           //Pendência 23536 - 15/02/2007 - Alberto
            qryHistMigracoesAfterScroll(qryHistMigracoes)
         end;
         // Fim Pendência 23536

         // Saldo Devedor -----------------------------------------------------------------------------
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat     := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAATUALIZA').AsDateTime   := Sysdate;
            Open;

            if not(IsEmpty) then edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         end;
         // Fim Saldo Devedor -------------------------------------------------------------------------

         // Parcelas Restantes-------------------------------------------------------------------------
         with qryParcelasRestantes do
         begin
            LimpaParametros(qryParcelasRestantes);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
            Open;

            if not(IsEmpty) then edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
         end;
         // Fim Parcelas Restantes --------------------------------------------------------------------

         with qryBenefSeguro do
         begin
            LimpaParametros(qryBenefSeguro);
            ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
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
   end
   else
   begin
      MontaSelect := dtmMS.MS_ContratoEmptmo;

      MontaSelect.Executar;

      // Redesenha o form na volta do MontaSelect
      Repaint;

      if MontaSelect.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         qryItensAberto.Close;
         qryHistMovVirtual.Close;
         qryHistMov.Close;

         edtSaldoAtual.Value   := 0;
         edtParcRestante.Value := 0;
         edtSaldoDevedor.Value := 0;

         // Abre a query principal com o participante escolhido
         Sel(StrToFloat(MontaSelect.ValoresChave[0]));

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
         (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger)           and
         (qryFLGINTERNO.AsString = 'CA') then
         begin
            DBedtSitPart.Text := 'Pensionista';
         end;

         PreencheDadosContrato(qry, rContrato);

         // Pendência 23536 - Marcos Topini
         with qryHistMigracoes do begin
           LimpaParametros(qryHistMigracoes);
           ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
           //ParamByName('IDCONTRATO').AsFloat := StrToFloat(MontaSelect.ValoresChave[0]);
           Open;

           //Pendência 23536 - 15/02/2007 - Alberto
            qryHistMigracoesAfterScroll(qryHistMigracoes)
         end;
         // Fim Pendência 23536


         // Saldo Devedor -----------------------------------------------------------------------------
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat    := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAATUALIZA').AsDateTime   := Sysdate;
            Open;

            if not(IsEmpty) then edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         end;
         // Fim Saldo Devedor -------------------------------------------------------------------------

         // Parcelas Restantes-------------------------------------------------------------------------
         with qryParcelasRestantes do
         begin
            LimpaParametros(qryParcelasRestantes);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
            Open;

            if not(IsEmpty) then edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
         end;
         // Fim Parcelas Restantes --------------------------------------------------------------------

         with qryBenefSeguro do
         begin
            LimpaParametros(qryBenefSeguro);
            ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
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
   // **************************************************************************
end;



procedure TfrmRelContrato_92695_395894.DBgrdHistMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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
            if qryHistMovFLGSUSPENSAO.AsInteger = 1 then AFont.Color := clGreen;
            if qryHistMovFLGQUITADO.AsInteger   = 1 then AFont.Color := clGreen;
            if qryHistMovFLGABONADO.AsInteger   = 1 then AFont.Color := clBlue;
            if qryHistMovFLGESTORNADO.AsInteger = 1 then AFont.Color := clMaroon;
         end;
      end;

   end
   else
   begin
      ABrush.Color := clHighLight;
      AFont.Color  := clHighLightText;
   end;
end;



procedure TfrmRelContrato_92695_395894.DBgrdHistMovTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelContrato_92695_395894.DesabilitaVazio;
var
   TBS      : TTabSheet;
   Group    : TGroupBox;
   i, j, k  : Integer;
begin
   TBS := nil;

   DBedtNumContrato.Color  := clWindow;
   DBedtParticipante.Color := clWindow;

   // PageControl principal ------------------------------------------------------------------------
   for j := 0 to ( pgcDados.ControlCount - 1) do
   begin
      if (pgcDados.Controls[j] is TTabSheet) then TBS := (pgcDados.Controls[j] as TTabSheet);

      for i := 0 to TBS.ControlCount-1 do
      begin
         if (TBS.Controls[i] is TDBEdit) then
         begin
            if (TBS.Controls[i] as TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] as TDBEdit).DataField).IsNull then
            begin
               (TBS.Controls[i] as TDBEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TDBEdit).Color := clWindow;
            end;
         end;  // if TDBEdit

         if (TBS.Controls[i] is TRealEdit) then
         begin
            if (TBS.Controls[i] as TRealEdit).Value = 0 then
            begin
               (TBS.Controls[i] as TRealEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TRealEdit).Color := clWindow;
            end;
         end;  // if TRealEdit

         if (TBS.Controls[i] is TCMDateTimePicker) then
         begin
            if (TBS.Controls[i] as TCMDateTimePicker).DataField <> '' then
            begin
               if (TBS.Controls[i] as TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] as TCMDateTimePicker).DataField).IsNull then
               begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clBtnFace;
               end else begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clWindow;
               end;
            end;
         end;  // if TCMDateTimePicker

         if (TBS.Controls[i] is TGroupBox) then
         begin
            Group := (TBS.Controls[i] as TGroupBox);

            for k := 0 to Group.ControlCount - 1 do
            begin
               if (Group.Controls[k] is TDBEdit) then
               begin
                  if (Group.Controls[k] as TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] as TDBEdit).DataField).IsNull then
                  begin
                     (Group.Controls[k] as TDBEdit).Color := clBtnFace;
                  end else begin
                     (Group.Controls[k] as TDBEdit).Color := clWindow;
                  end;

               end;  // if TDBEdit
            end;  // for Group
         end;  // if TGroupBox
      end;  // for TBS
   end;  // for pgcDados
   // ----------------------------------------------------------------------------------------------

   // PageControl Detalhes -------------------------------------------------------------------------
   for j := 0 to ( pgcSecundario.ControlCount - 1) do
   begin
      if (pgcSecundario.Controls[j] is TTabSheet) then TBS := (pgcSecundario.Controls[j] as TTabSheet);

      for i := 0 to TBS.ControlCount-1 do
      begin
         if (TBS.Controls[i] is TDBEdit) then
         begin
            if (TBS.Controls[i] as TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] as TDBEdit).DataField).IsNull then
            begin
               (TBS.Controls[i] as TDBEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TDBEdit).Color := clWindow;
            end;
         end;  // if TDBEdit

         if (TBS.Controls[i] is TRealEdit) then
         begin
            if (TBS.Controls[i] as TRealEdit).Value = 0 then
            begin
               (TBS.Controls[i] as TRealEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TRealEdit).Color := clWindow;
            end;
         end;  // if TRealEdit

         if (TBS.Controls[i] is TCMDateTimePicker) then
         begin
            if (TBS.Controls[i] as TCMDateTimePicker).DataField <> '' then
            begin
               if (TBS.Controls[i] as TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] as TCMDateTimePicker).DataField).IsNull then
               begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clBtnFace;
               end else begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clWindow;
               end;
            end;
         end;  // if TCMDateTimePicker

         if (TBS.Controls[i] is TGroupBox) then
         begin
            Group := (TBS.Controls[i] as TGroupBox);

            for k := 0 to Group.ControlCount - 1 do
            begin
               if (Group.Controls[k] is TDBEdit) then
               begin
                  if (Group.Controls[k] as TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] as TDBEdit).DataField).IsNull then
                  begin
                     (Group.Controls[k] as TDBEdit).Color := clBtnFace;
                  end else begin
                     (Group.Controls[k] as TDBEdit).Color := clWindow;
                  end;

               end;  // if TDBEdit
            end;  // for Group
         end;  // if TGroupBox
      end;  // for TBS
   end;  // for pgcDados

   DBedtTipoContrato.Color := $00C0FFFF;

   // ----------------------------------------------------------------------------------------------

   // PageControl Detalhes -------------------------------------------------------------------------
   for j := 0 to ( pgcDetalhe.ControlCount - 1) do
   begin
      if (pgcDetalhe.Controls[j] is TTabSheet) then TBS := (pgcDetalhe.Controls[j] as TTabSheet);

      for i := 0 to TBS.ControlCount-1 do
      begin
         if (TBS.Controls[i] is TDBEdit) then
         begin
            if (TBS.Controls[i] as TDBEdit).DataSource.DataSet.FieldByName((TBS.Controls[i] as TDBEdit).DataField).IsNull then
            begin
               (TBS.Controls[i] as TDBEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TDBEdit).Color := clWindow;
            end;
         end;  // if TDBEdit

         if (TBS.Controls[i] is TRealEdit) then
         begin
            if (TBS.Controls[i] as TRealEdit).Value = 0 then
            begin
               (TBS.Controls[i] as TRealEdit).Color := clBtnFace;
            end else begin
               (TBS.Controls[i] as TRealEdit).Color := clWindow;
            end;
         end;  // if TRealEdit

         if (TBS.Controls[i] is TCMDateTimePicker) then
         begin
            if (TBS.Controls[i] as TCMDateTimePicker).DataField <> '' then
            begin
               if (TBS.Controls[i] as TCMDateTimePicker).DataSource.DataSet.FieldByName((TBS.Controls[i] as TCMDateTimePicker).DataField).IsNull then
               begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clBtnFace;
               end else begin
                  (TBS.Controls[i] as TCMDateTimePicker).Color := clWindow;
               end;
            end;
         end;  // if TCMDateTimePicker

         if (TBS.Controls[i] is TGroupBox) then
         begin
            Group := (TBS.Controls[i] as TGroupBox);

            for k := 0 to Group.ControlCount - 1 do
            begin
               if (Group.Controls[k] is TDBEdit) then
               begin
                  if (Group.Controls[k] as TDBEdit).DataSource.DataSet.FieldByName((Group.Controls[k] as TDBEdit).DataField).IsNull then
                  begin
                     (Group.Controls[k] as TDBEdit).Color := clBtnFace;
                  end else begin
                     (Group.Controls[k] as TDBEdit).Color := clWindow;
                  end;

               end;  // if TDBEdit
            end;  // for Group
         end;  // if TGroupBox
      end;  // for TBS
   end;  // for pgcDados
   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmRelContrato_92695_395894.DBgrdHistMovCellChanged(Sender: TObject);
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



procedure TfrmRelContrato_92695_395894.btnImprimirClick(Sender: TObject);
begin
   inherited;

   if MsgDlg('Deseja imprimir o Contrato?', 'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;
      Imprime;
   end;
   Repaint;
end;



procedure TfrmRelContrato_92695_395894.Imprime;
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
         qryAux.Open
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
         '  AND ( DAT.IDDATAVIEW = REP.IDDATAVIEW ) '                                        + #13 +
         '  AND ( DAT.ORIGEMCMDV = REP.ORIGEMCMDV ) ';

         qryAux.Close;
         qryAux.SQL.Clear;
         qryAux.SQL.Text := sSQL;

         try
            qryAux.Open;
            sSqldoUsuario := qryAux.FieldByName('TEMPLATE').AsString;
         except
            MsgDlg('Erro ao buscar modelo para impressão!', 'Empréstimo',
                   mtError, [mbOk], 0);
            Repaint;
            Exit;
         end; (* try..except *)

         (* Abrir query com LAY-OUT do relatorio. Para isto, o campo TEMPLATE tem
            que estar no FieldsEditor e a query tem que ser RequestLive *)
         dtmRelatoriosUsu.qryDoUsuario.Close;
         dtmRelatoriosUsu.qryDoUsuario.ParamByName('IDREPORTS').AsInteger := qryAux.FieldByName('IDREPORTS').AsInteger;
         dtmRelatoriosUsu.qryDoUsuario.ParamByName('ORIGEMCM').AsInteger  := qryAux.FieldByName('ORIGEMCM').AsInteger;

         try
            dtmRelatoriosUsu.qryDoUsuario.Open;
         except
            MsgDlg('Erro ao abrir o layout do Tipo de Contrato.',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;


         if dtmRelatoriosUsu.qryDoUsuario.IsEmpty then
         begin
            MsgDlg('Não foi encontrado layout para o Tipo de Contrato. Favor verificar.',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;
            Exit;
         end;(* if IsEmpty *)


         with dtmRelatoriosUsu do
         begin
            sArquivoTemp := Sistema.TempDir + 'APrevRelContrato.tmp';
            sSQLTemp     := Sistema.TempDir + 'APrevSQLRelContrato.sql';

            qryDoUsuarioTEMPLATE.SaveToFile(sArquivoTemp);

            qryRelatParametrizavel.Close;
            qryRelatParametrizavel.SQL.Clear;
            qryRelatParametrizavel.SQL.Text := sSqldoUsuario;

            qryRelatParametrizavel.SQL.Add(' AND CONTRATOEMPTMO.IDCONTRATOEMPTMO  = ' + FloatToStr(qryIDCONTRATOEMPTMO.AsFloat) );

            qryRelatParametrizavel.SQL.SaveToFile(sSQLTemp);
            qryRelatParametrizavel.Open;

            dsRelatParametrizavel.DataSet                := qryRelatParametrizavel;
            pplRelatParametrizavel.DataSource            := dsRelatParametrizavel;
            rpRelatParametrizavel.Template.SaveTo        := stFile;
            rpRelatParametrizavel.Template.Format        := ftBinary;
            rpRelatParametrizavel.Template.FileName      := sArquivoTemp;
            rpRelatParametrizavel.Template.LoadFromFile;

            rpRelatParametrizavel.DataPipeline           := pplRelatParametrizavel;

            EscondeEspera;
            Repaint;

            (* Visualização do Contrato *)

            frmImpressaoContrato                := TfrmImpressaoContrato.Create(Application);
            frmImpressaoContrato.QryDados       := qryRelatParametrizavel;
            frmImpressaoContrato.idReports      := qryAux.FieldByName('IDREPORTS').AsInteger;
            frmImpressaoContrato.idOrigem       := qryAux.FieldByName('ORIGEMCM').AsInteger;
            frmImpressaoContrato.sNomeRelat     := 'Contrato - ' + qryIDCONTRATOEMPTMO.AsString;

            frmImpressaoContrato.bbtnConfirmarClick(Self);
            frmImpressaoContrato.bbtnSairClick(Self);

            DeleteFile(sArquivoTemp);
            DeleteFile(sSQLTemp);
         end;(* with *)

      end
      else
      begin

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



procedure TfrmRelContrato_92695_395894.btnAtualizaSaldoClick(Sender: TObject);
var
   sArq : String;
begin
   sArq := 'SimulaQuitacao' + '-' +
           FormatDateTime('yyyymmdd-hhnnss', Now) + '-' +
           'matr' + qryMATRICULA.AsString +
           '.log';

   if ( (qryFLGSITUACAO.AsString = 'K') or (qryFLGSITUACAO.AsString = 'Q') ) then
   begin
      MsgDlg('O Contrato já teve o valor de quitação calculado.', 'Empréstimo', mtInformation, [mbOk], 0);
      Repaint;
      Exit;
   end;

   try
//      DesabilitaBotoes;

      // Configurando o Form com a Barra de Progresso que será usado na função CalculaItensAtualiza
      with frmProgresso do
      begin
         BotaoVisivel    := True;
         BotaoHabilitado := True;
      end;

      vLista := nil;

      rContrato.IDSitPart := qryIDSITPART.AsInteger;

      // André Pontes - 06/10/2005
      // Limpa o IDCalculo para que não ocorra erro em uma nova iteração das regras
      dtmEmptmo.Regra.IDCalculo  := 0;
      // FIM André Pontes - 06/10/2005

      if rdgMetodo.ItemIndex = 0 then
      begin
         if not(CalcEmptmo.CalculaItensQuitacao(rContrato,
                                                3,                      // Origem
                                                edtDataQuitacao.Date,
                                                -1,                     // André Pontes - 14/06/2004 - pendência 16984
                                                0,
                                                vLista,
                                                True,
                                                True,
                                                False,
                                                sArq
                                               )) then
         begin
            MsgDlg('Houve ERRO no cálculo dos itens de atualização. Favor verificar a(s) Regra(s) associada(s).',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;

            // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            // por Cancelamento do Usuário, logo o procedimento será abortado
            Exit;
         end;
      end
      else
      begin
         if not(CalcEmptmo.CalculaItensQuitacaoNOVA(rContrato,
                                                    3,                      // Origem
                                                    edtDataQuitacao.Date,
                                                    -1,                     // André Pontes - 14/06/2004 - pendência 16984
                                                    0,
                                                    vLista,
                                                    True,
                                                    True,
                                                    False,
                                                    sArq
                                                   )) then
         begin
            MsgDlg('Houve ERRO no cálculo dos itens de atualização. Favor verificar a(s) Regra(s) associada(s).',
                   'Empréstimo', mtError, [mbOk], 0);
            Repaint;

            // Não foi possível atualizar os itens, ou por problemas no Cálculo, ou
            // por Cancelamento do Usuário, logo o procedimento será abortado
            Exit;
         end;
      end;

      lblSaldoAtualizado.Caption := 'Valor projetado para Quitação em ' + edtDataQuitacao.Text + ':';

      PreencheTabelaVirtual;

   finally
      EscondeFormProgresso;

      if btnAtualizaSaldo.CanFocus then btnAtualizaSaldo.SetFocus;
      Repaint;
   end;
end;



procedure TfrmRelContrato_92695_395894.PreencheTabelaVirtual;
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

      qryHistMovVirtualIDCONTRATOEMPTMO.AsFloat    := rContrato.IDContratoEmptmo;
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



procedure TfrmRelContrato_92695_395894.DBgrdItensAbertoTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelContrato_92695_395894.DBgrdHistMovVirtualTopRowChanged(Sender: TObject);
begin
   inherited;
   (* acerta as cores quando muda a linha da grid *)
   (Sender as TwwDBGrid).Invalidate;
end;



procedure TfrmRelContrato_92695_395894.DBgrdItensAbertoCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmRelContrato_92695_395894.DBgrdHistMovVirtualCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
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



procedure TfrmRelContrato_92695_395894.rdgExibeClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.rdgEstornoClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.chkOrdemClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   // Marchetti - Pendencia 22042
   if Sistema.IdModulo = 19 then
   begin
      btnBuscaContrato.Visible := False;
      Application.CreateForm(TFrmExecSelecionaContrato, frmExecSelecionaContrato);
      frmExecSelecionaContrato.Matricula := sMatricula;
      frmExecSelecionaContrato.ShowModal;

      if frmExecSelecionaContrato.RetornouValor then
      begin
         Screen.Cursor := crHourGlass;

         qryItensAberto.Close;
         qryHistMovVirtual.Close;
         qryHistMov.Close;

         edtSaldoAtual.Value   := 0;
         edtParcRestante.Value := 0;
         edtSaldoDevedor.Value := 0;

         // Abre a query principal com o participante escolhido
         Sel(StrToFloat(frmExecSelecionaContrato.ValoresChave[0]));

         IntegraModulo.iEvento         := 1;
         IntegraModulo.iContratoEmptmo := StrToFloat(frmExecSelecionaContrato.ValoresChave[0]);

         if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) and
            (qryIDPESSOA.AsInteger <> qryIDBENEF.AsInteger)        and
            (qryFLGINTERNO.AsString = 'CA') then
         begin
            DBedtSitPart.Text := 'Pensionista';
         end;

         PreencheDadosContrato(qry, rContrato);

         // Pendência 23536 - Marcos Topini
         with qryHistMigracoes do begin
           LimpaParametros(qryHistMigracoes);
           ParamByName('IDCONTRATO').AsFloat := rContrato.idContratoEmptmo;
           Open;

           //Pendência 23536 - 15/02/2007 - Alberto
            qryHistMigracoesAfterScroll(qryHistMigracoes)
         end;
         // Fim Pendência 23536


         // Saldo Devedor -----------------------------------------------------------------------------
         with dtmCalcEmptmo.qrySaldoAnt do
         begin
            LimpaParametros(dtmCalcEmptmo.qrySaldoAnt);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat    := rContrato.IDContratoEmptmo;
            ParamByName('PHMEDATAATUALIZA').AsDateTime   := Sysdate;
            Open;

            if not(IsEmpty) then edtSaldoDevedor.Value := dtmCalcEmptmo.qrySaldoAntHMESALDODEV.AsCurrency;
         end;
         // Fim Saldo Devedor -------------------------------------------------------------------------

         // Parcelas Restantes-------------------------------------------------------------------------
         with qryParcelasRestantes do
         begin
            LimpaParametros(qryParcelasRestantes);
            ParamByName('PIDCONTRATOEMPTMO').AsFloat   := rContrato.IDContratoEmptmo;
            Open;

            if not(IsEmpty) then edtParcRestante.Value := qryParcelasRestantesPARCELAS_RESTANTES.AsInteger;
         end;
         // Fim Parcelas Restantes --------------------------------------------------------------------

         with qryBenefSeguro do
         begin
            LimpaParametros(qryBenefSeguro);
            ParamByName('PIDINSCRICAOEMPTMO').AsFloat := rContrato.IDINSCRICAOEMPTMO;
            Open;
         end;

         DesabilitaVazio;

         pgcDados.ActivePageIndex := 0;

         Screen.Cursor := crDefault;
      end;
      frmExecSelecionaContrato.Free;
   end;
   // Fim Marchetti - Pendencia 22042

   pgcDados.ActivePageIndex         := 0;

   edtDataQuitacao.Date             := Sysdate;

   cboEvento.ItemIndex              := 0;

   DBspnAnoCobIni.Value             := DiasUteis.ExtraiAno(DiasUteis.SomaMeses(Sysdate, -2));
   cboMesCobIni.ItemIndex           := DiasUteis.ExtraiMes(DiasUteis.SomaMeses(Sysdate, -2)) -1;

   DBspnAnoCobFim.Value             := DiasUteis.ExtraiAno(Sysdate);
   cboMesCobFim.ItemIndex           := DiasUteis.ExtraiAno(Sysdate) -1;

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

   // ----------------------------------------------------------------------------------------------

   if dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger <> 1 then
   begin
      btnAlteraHistContrato.Visible := False;
      btnAjustaSaldo.Visible        := False;
   end;

   if Sistema.TipoCliente = 19981 then
   begin
      btnAlteraHistContrato.Visible := True;
   end;

   if Sistema.IDModulo <> 15 then
   begin
      btnAlteraHistContrato.Visible := False;
      btnAjustaSituacao.Visible     := False;
      btnAjustaSaldo.Visible        := False;
   end;

   // ----------------------------------------------------------------------------------------------

   lblTitulo.Caption                := '';

   pnlTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);

   dtmLookEmptmo.qryLookItemEmprestimo.Open;
   //Pendência 27294 - 01/02/2008
   chkFiltroItem.Enabled := false;
   //Fim Pendência 27294

   if btnBuscaContrato.CanFocus then btnBuscaContrato.SetFocus;

   if (dtmEmptmo.qryParamEmptmoFLGEXCEPCIONAL.AsInteger = 1) or (Sistema.TipoCliente = 20071) then
      rdgOrdena.ItemIndex := 4;

   qryHistMovCCDEBFINAN.EditMask    := IntegraBack.MascaraPlano + ';0; ';
   qryHistMovCCCREDFINAN.EditMask   := IntegraBack.MascaraPlano + ';0; ';

   // Marchetti - pendencia 26267
   Autorizacao.AutorizarForm(self, afNormal);
end;



procedure TfrmRelContrato_92695_395894.chkFaixaDatasClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.fcShapeBtn1Click(Sender: TObject);
begin
   inherited;

   if plnFiltro.Height = 168 then
   begin
      plnFiltro.Height := 0;
   end
   else
   begin
      plnFiltro.Height := 168;
   end;

   Repaint;
end;



procedure TfrmRelContrato_92695_395894.cboMesCobIniExit(Sender: TObject);
begin
   inherited;
   iIndiceFim := cboMesCobIni.ItemIndex;
   if (iIndiceIni <> iIndiceFim) and (chkFiltroCobranca.Checked) then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.DBspnAnoCobIniExit(Sender: TObject);
begin
   inherited;
   if (DBspnAnoCobIni.Modified) and (chkFiltroCobranca.Checked) then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.cboMesCobFimExit(Sender: TObject);
begin
   inherited;
   iIndiceFim := cboMesCobFim.ItemIndex;
   if (iIndiceIni <> iIndiceFim) and (chkFiltroCobranca.Checked) then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.DBspnAnoCobFimExit(Sender: TObject);
begin
   inherited;
   if (DBspnAnoCobFim.Modified) and (chkFiltroCobranca.Checked) then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.cboMesCobIniEnter(Sender: TObject);
begin
   inherited;
   iIndiceIni := cboMesCobIni.ItemIndex;
end;



procedure TfrmRelContrato_92695_395894.cboMesCobFimEnter(Sender: TObject);
begin
   inherited;
   iIndiceIni := cboMesCobFim.ItemIndex;
end;



procedure TfrmRelContrato_92695_395894.qryHistMovVirtualAfterClose(DataSet: TDataSet);
begin
   inherited;
   lblSaldoAtualizado.Caption := 'Valor projetado para Quitação: ';
end;



procedure TfrmRelContrato_92695_395894.pgcDadosChange(Sender: TObject);
begin
   inherited;
   if pgcDados.ActivePage = tbsCondicoes then pnlTitular.Visible := (dtmEmptmo.qryParamEmptmoFLGMOSTRATIT.AsInteger = 0);
   if (pgcDados.ActivePage = tbsDetalheParcela) then
   begin
      LimpaParametros(qryHistObservacao);

      qryHistObservacao.ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      qryHistObservacao.Open;
   end;

end;



procedure TfrmRelContrato_92695_395894.btnNovoClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmCadHistMovEmptmo, frmCadHistMovEmptmo);

   try
      frmCadHistMovEmptmo.qry.Close;
      frmCadHistMovEmptmo.qry.ParamByName('IDHISTMOVEMPTMO').AsFloat := 1;
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



procedure TfrmRelContrato_92695_395894.btnAlteraClick(Sender: TObject);
begin
   inherited;

   Application.CreateForm(TfrmCadHistMovEmptmo, frmCadHistMovEmptmo);

   try
      frmCadHistMovEmptmo.qry.Close;
      frmCadHistMovEmptmo.qry.ParamByName('IDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
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



procedure TfrmRelContrato_92695_395894.btnExcluirClick(Sender: TObject);
var
   qryAux         : TwwQuery;
   rLogTotalPrev  : TLogTotalPrev;
begin
   inherited;

   qryAux               := TwwQuery.Create(Application);
   qryAux.DatabaseName  := 'BASEDADOS';

   if MsgDlg('Deseja realmente excluir este registro?', 'Exclusão', mtConfirmation, [mbYes, mbNo],0) = mrNo then Exit;
   if MsgDlg('Este registro será excluído. Confirma?', 'Exclusão', mtConfirmation, [mbYes, mbNo],0) = mrNo then Exit;

   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := qryHistMovIDHISTMOVEMPTMO.AsFloat;
   rLogTotalPrev.Origem     := 15;
   rLogTotalPrev.Operacao   := 'EXCLUSAO de Historico';
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------

   qryAux.SQL.Add('DELETE FROM HISTMOVEMPTMO WHERE IDHISTMOVEMPTMO = ' + qryHistMovIDHISTMOVEMPTMO.AsString);

   try
      qryAux.ExecSQL;

      qryHistMov.Close;
      qryHistMov.Open;

      qryItensAberto.Close;
      qryItensAberto.Open;

   except
      ShowMessage('Não foi possível apagar este registro.');
   end;
end;



procedure TfrmRelContrato_92695_395894.rdgOrdenaClick(Sender: TObject);
begin
   inherited;
   AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.BitBtn1Click(Sender: TObject);
var
   sFlag          : String;
   sSQL           : String;
   qryAltera      : TwwQuery;
   rLogTotalPrev  : TLogTotalPrev;
begin
   inherited;

   case cboFlgSituacao.ItemIndex of
      0: sFlag := 'A';  // Ativo
      1: sFlag := 'C';  // Cancelado
      2: sFlag := 'E';  // Encerrado
      3: sFlag := 'K';  // Pendente de Quitação
      4: sFlag := 'Q';  // Quitado
      5: sFlag := 'P';  // Pendente de Liberação
   end;

   sSQL :=
   'UPDATE '                                 + #13 +
   '  CONTRATOEMPTMO '                       + #13 +
   'SET '                                    + #13 +
   '  FLGSITUACAO = ' + QuotedStr(sFlag)     + #13 +
   'WHERE '                                  + #13 +
   '  IDCONTRATOEMPTMO = ' + FloatToStr(qryIDCONTRATOEMPTMO.AsFloat);


   qryAltera               := TwwQuery.Create(Application);
   qryAltera.DatabaseName  := 'BASEDADOS';
   qryAltera.SQL.Text      := sSQL;
   qryAltera.ExecSQL;

   qryAltera.Close;
   qryAltera.Free;

   // ----------------------------------------------------------------------------------------------

   LimpaRegistroLog(rLogTotalPrev);

   rLogTotalPrev.IDModulo   := Sistema.IDModulo;
   rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
   rLogTotalPrev.IDHistMov  := -1;
   rLogTotalPrev.Origem     := 15;
   rLogTotalPrev.Operacao   := 'Alteração MANUAL de Situação Contratual para: ' + cboFlgSituacao.Text;
   rLogTotalPrev.Data       := SysDate;
   rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
   rLogTotalPrev.Versao     := Sistema.Versao;

   GravaLogTotalPrev(rLogTotalPrev);

   // ----------------------------------------------------------------------------------------------
end;



procedure TfrmRelContrato_92695_395894.DBcboItemCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
begin
   inherited;
   //Pendência 27294 - 01/02/2008
   chkFiltroItem.Enabled := true;
   //Fim Pendência 27294
   if chkFiltroItem.Checked then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.cboEventoChange(Sender: TObject);
begin
   inherited;
   if chkFiltroEvento.Checked then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.qryHistMovHMEVLREFETIVOGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   inherited;

   if not(qryHistMovHMEVLREFETIVO.IsNull) then
   begin
      Text := FormatFloat('#,#0.00;(#,#0.00)', qryHistMovHMEVLREFETIVO.AsFloat);
   end;

   if qryHistMovFLGSUSPENSAO.AsInteger = 1 then Text := 'suspenso';
   if qryHistMovFLGQUITADO.AsInteger   = 1 then Text := 'quitado';
   if qryHistMovFLGABONADO.AsInteger   = 1 then Text := 'abonado';
   if qryHistMovFLGESTORNADO.AsInteger = 1 then Text := 'estornado';
end;



procedure TfrmRelContrato_92695_395894.qryHistMovAfterScroll(DataSet: TDataSet);
begin
   inherited;
   DesabilitaVazio;
end;



procedure TfrmRelContrato_92695_395894.edtDataIniExit(Sender: TObject);
begin
   inherited;
   if ((edtDataIni.Modified) or (edtDataFim.Modified)) and chkFaixaDatas.Checked then AbreQueriesHistorico;
end;



procedure TfrmRelContrato_92695_395894.btnRefreshClick(Sender: TObject);
var
   IDContrato : Extended;
begin
   inherited;

   btnRefresh.Down := False;
   Application.ProcessMessages;

   IDContrato := qryIDCONTRATOEMPTMO.AsFloat;

   Sel(IDContrato);

   btnRefresh.Down := False;
   Application.ProcessMessages;
end;



procedure TfrmRelContrato_92695_395894.btnAjustaSaldoClick(Sender: TObject);
var
   rLogTotalPrev  : TLogTotalPrev;
begin
   inherited;

   if Sistema.TipoCliente <> 19991 then Exit;

   if qryHistMovHMEDATAATUALIZA.AsDateTime < StrToDate('01/01/2005') then
   begin
      MsgDlg('Não é permitido ajustar saldos anteriores a 01/01/2005', 'Empréstimo', mtWarning, [mbOk], 0);
      Repaint;
      Exit;
   end;

   if not(VerificaPreenchimento) then Exit;

   if MsgDlg('Os saldos devedores serão ajustados a partir de ' +
             FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAATUALIZA.AsDateTime) + '.' + #13 + #13 +
             'Deseja prosseguir?',
             'Empréstimo', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      Repaint;

      dtmAtualizacaoDiaria.ExecutaAjusteSaldo(qryIDCONTRATOEMPTMO.AsFloat,
                                              qryHistMovHMEDATAPREVISTA.AsDateTime,
                                              -1 // O saldo deve ser buscado
                                             );

      // -------------------------------------------------------------------------------------------

      LimpaRegistroLog(rLogTotalPrev);

      rLogTotalPrev.IDModulo   := 15;
      rLogTotalPrev.IDContrato := qryIDCONTRATOEMPTMO.AsFloat;
      rLogTotalPrev.IDHistMov  := -1;
      rLogTotalPrev.Origem     := 15;
      rLogTotalPrev.Operacao   := 'Ajuste de Saldo - a partir de ' + FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAPREVISTA.AsDateTime);
      rLogTotalPrev.Data       := SysDate;
      rLogTotalPrev.IDUsuario  := Sistema.IdUsuario;
      rLogTotalPrev.Versao     := Sistema.Versao;

      GravaLogTotalPrev(rLogTotalPrev);

      // -------------------------------------------------------------------------------------------

      AbreQueriesHistorico;
   end;
end;



function TfrmRelContrato_92695_395894.VerificaPreenchimento: Boolean;
var
   sMsg        : String;
   sDataLanc   : String;
   sMsgContab  : String;
   iEmpresa    : Integer;
   iExercicio  : Integer;
   iPeriodo    : Integer;
begin
	Result := False;

   try
      sDataLanc   := FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAATUALIZA.AsDateTime);
      iEmpresa    := Sistema.idEmpresa;
      sMsgContab  := '';

      if TestaPeriodo(False, 'BaseDados', sDataLanc, '15', iExercicio, iPeriodo, iEmpresa, sMsgContab) <> 0 then
         raise EValidacao.CreateVal('Não é possível usar a Data indicada:' + #13 + '"' + sMsgContab + '"', btnAjustaSaldo);

      if not(Contab.TestaDataBloqueadaProc(iEmpresa, 15, sDataLanc)) then
      begin
         sMsgContab := Contab.MessageInfo;
         raise EValidacao.CreateVal('Não é possível usar a Data indicada:' + #13 + '"' + sMsgContab + '"', btnAjustaSaldo);
      end;

	except
      on ev : EValidacao do
      begin
         Screen.Cursor := crDefault;
         if ev.Show then MsgDlg(ev.message, 'Empréstimo', mtWarning, [mbOk], 0);
			Repaint;
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Exit;
      end;
   end;
   Result := True;
end;



procedure TfrmRelContrato_92695_395894.btnAjustaSituacaoClick(Sender: TObject);
var
   IDContrato     : Extended;
   rLogTotalPrev  : TLogTotalPrev;
begin
   inherited;

   // ----------------------------------------------------------------------------------------------
   //    Acerto da situação do Contrato
   // ----------------------------------------------------------------------------------------------
   CalcEmptmo.AcertaSituacaoContratual(qryIDCONTRATOEMPTMO.AsFloat, 15);

   IDContrato := qryIDCONTRATOEMPTMO.AsFloat;

   Sel(IDContrato);
end;



procedure TfrmRelContrato_92695_395894.fcShapeBtn3Click(Sender: TObject);
var
   rSaldo : TSaldoDevAnt;
begin
   inherited;

   rSaldo := CalcEmptmo.SaldoDevAnt(qryIDCONTRATOEMPTMO.AsFloat,
                                    qryHistMovHMEDATAPREVISTA.AsDateTime,
                                    -1,
                                    -1,
                                    False
                                   );

   MsgDlg('Saldo Devedor em ' + FormatDateTime('dd/mm/yyyy', qryHistMovHMEDATAPREVISTA.AsDateTime) +
          ': ' + #13 +#13 + FormatFloat('#,#0.00', rSaldo.fSaldoDevAnt),
          'Empréstimo', mtInformation, [mbOk], 0);
   Repaint;
end;



procedure TfrmRelContrato_92695_395894.btnAlteraHistContratoClick(Sender: TObject);
begin
   inherited;
   pnlHistBaca.Visible := not(pnlHistBaca.Visible);
end;



procedure TfrmRelContrato_92695_395894.pgcDetalheChange(Sender: TObject);
begin
   inherited;

   if (pgcDetalhe.ActivePage = tbsLogTotalPrevHist) and (qry.Active) and not(qry.IsEmpty) then
   begin
      // Abertura da query de log da Hist
      with qryLogTotalPrevHist do
      begin
         LimpaParametros(qryLogTotalPrevHist);
         ParamByName('PIDHISTMOVEMPTMO').AsFloat   := qryHistMovIDHISTMOVEMPTMO.AsFloat;
         Open;
      end;
   end;

end;


procedure TfrmRelContrato_92695_395894.btnAlteraObsClick(Sender: TObject);
begin
   Application.CreateForm(TfrmCadObservacao, frmCadObservacao);

   try
      frmCadObservacao.qry.Close;
      frmCadObservacao.qry.ParamByName('IDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      frmCadObservacao.qry.Open;

      frmCadObservacao.IDItem := qryHistMovIDITEMEMPTMO.AsInteger;
      frmCadObservacao.iAcao  := 2; // Alteração

      frmCadObservacao.ShowModal;
   finally
      frmCadObservacao.Release;

      qryHistMov.Close;
      qryHistMov.Open;

      LimpaParametros(qryHistObservacao);
      qryHistObservacao.ParamByName('PIDHISTMOVEMPTMO').AsFloat := qryHistMovIDHISTMOVEMPTMO.AsFloat;
      qryHistObservacao.Open;

      qryItensAberto.Close;
      qryItensAberto.Open;;
   end;
end;



procedure TfrmRelContrato_92695_395894.FormCreate(Sender: TObject);
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

   Contab.OpenTransaction := False;
end;



procedure TfrmRelContrato_92695_395894.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Contab.Free;
   inherited;
end;



procedure TfrmRelContrato_92695_395894.qryHistMigracoesAfterScroll(DataSet: TDataSet);
begin
  inherited;

  //Pendência 23536 - 15/02/2007 - Alberto
  with qryItensMigracoes do begin
    Close;
    ParamByName('PIDCONTRATOEMPTMO').Value := qryHistMigracoes.FieldByName('IDCONTRATOEMPTMO').Value;
    ParamByName('PDATAMIGRA').Value        := qryHistMigracoes.FieldByName('DATAMIGRA').Value;
    Open;
  end;
  //Fim Pendência 23536
end;




end.
