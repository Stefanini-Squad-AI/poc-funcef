unit FParametroFolha;

interface

// 22030373 - 22030231

// Alterações:
//--------------------------------------------------------------------------------------------------
// Rotina    : (dfm) Novo IR Exterior, FormShow, bbtnConfirmarClick
// Autor(a)  : Edilaine
// Data      : 26/12/2025
// Pendencia : WO29808
// Alteração : Novo cálculo do IR para Exteior
//--------------------------------------------------------------------------------------------------
// Rotina    : FormShow
// Autor(a)  : Edilaine
// Data      : 07/02/2024
// Pendencia : WO7766
// Alteração : Tratamento de casa decimais desc. simplificado
//---------------------------------------------------------------------------------------------------
// Rotina    : (dfm) IR Informativo, FormShow, bbtnConfirmarClick
// Autor(a)  : Edilaine
// Data      : 07/07/2023
// Pendencia : 136670
// Alteração : Criação parametros para Desconto Simplificado MP 1171
//--------------------------------------------------------------------------------------------------
// Rotina    : (dfm) IR Informativo / Regra Ação
// Autor(a)  : Andre Itiro
// Data      : 19/05/2022
// Pendencia : SIG92016
// Alteração : Gravação dos parametros RUBRICAIRINFOACAO, RUBRICAIRINFOACAOAB e REGRACAOJUDGANHA
//--------------------------------------------------------------------------------------------------
// Rotina    : (dfm) IR TOTAL
// Autor(a)  : Andre Itiro
// Data      : 29/09/2016
// Pendencia : SIG71773 (SOL247533-18324)
// Alteração : Gravação dos parametros RUBRICAIRTOTAL, RUBRICAIRTOTALPARC e RUBRICAIRTOTALCOMP
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Andre Imakawa
// Data      : 20/04/2020
// Pendência : SIG99503
// Descricao : Criação dos parametros do mês de abono.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Andre Imakawa
// Data      : 30/03/2020
// Pendência : SIG99272
// Descricao : Criação dos parametros do mês de antecipação do abono.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Felipe A. Santos
// Data      : 29/09/2015
// Pendência : SOL 258357/17801 PPM 1083052
// Descricao : Gravação do Parâmetro RUBRICAIRRFRRAFUND e mudança da forma de gravação do parâmetro
//             RUBRICAIRRFRRA.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Aline Freire
// Data      : 13/07/2011
// Pendência : Sol 155182 Kintana 1228739
// Descricao : Gravação do Parâmetro RUBRICAIRRFRRA.
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Fanauel/Douglas
// Data      : 08/03/2013
// Pendência : Sol 163044 \ Kintana 1388879
// Descricao : **REESTRUTURAÇÃO DA ROTINAS DO REEMBOLSO INSS
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Renato Visoni
// Data      : 23/10/2008
// Rotina    : actCPagarExecute e bbtnConfirmarClick
// Pendência : Sol 99360 \ Kintana 435729
// Descricao : O sistema não estava gravando o campo " Centro de responsabilidade Padrão " na tabela
// PARAMFOLHA
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Bruno Bastos
// Data      : 05/09/2007
// Rotina    : ValidaRubricaIR, ValidaRubricaDeducao
// Pendência : 18830
// Descricao : Não permitir que os parâmetros de rubrica de imposto de renda e de dedução do imposto
//             seja usada em dois desses parâmetros.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 17/04/2007
// Rotina      : Diversas (verificar pelo numero da pendencia)
// Pendência   : 21874
// Descricao   : Permitir entrada do valor para desativação automática da
//   Rubrica individual, no processo de Efetivação de versão de pagamento.
//   Situações em que ocorre a desativação automática da rubrica individual:
//     - data final atingida
//     - parcela atingida
//     - saldo atingido
//   Opções:
//     0 - sem desativação
//     1 - desativação automática individual
//     2 - desativação automática geral (para qualquer registro na condição)
//--------------------------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : fcOutlookListAdiantamento
// Data      : 22/01/2007
// Pendencia : 18728
// Alteração : Desabilitando a opção de adiantamento de benefício
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 11/01/2007
// Pendencia : 18728
// Alteração : Gravação do parametro VERIFICARECEBEDORDUPLICADO
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 04/10/2006
// Pendencia : 22999
// Alteração : Criar parâmetro global para que o mês referencia seja constante
//   no processamento e lançamento de rubrica individual, mesmo que tenha várias
//   parcelas a processar. Isto vai indicar que o valor total de uma referência
//   foi rateado por diversos meses.
//------------------------------------------------------------------------------
// Autor(a)  : Claudio Faria
// Rotina    : Diversas (verificar pelo numero da pendencia)
// Data      : 15/09/2006
// Pendencia : 18767
// Alteração : Gravação dos parametros IDRubCredAdiantaIsento, IDRubAdiantaIsento.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Parametros
// Data      : 21/08/2006
// Pendencia : 23109
// Alteração : Retirar o parâmetro para forçar uso da tabela progressiva de IR
//   sobre resgate de reserva.
//------------------------------------------------------------------------------
// Autor(a)  : Paulo Ramos
// Rotina    : Criar parametros
// Data      : 21/08/2006
// Pendencia : 22312
// Alteração : Tratar novas rubricas para IR regressivo de beneficio vitalicio e de abono vitalicio
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Parâmetro Novo
// Pendência   : 14461 e 21006
// Descricao   : Controle do Preparo de Abono anual de retidos
//               OPÇÕES: 0-NÃO PREPARA,
//                       1-PREPARA RETIDOS EXCETO RECADASTRAMENTO
//                       2-PREPARA TODOS OS RETIDOS
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 19/12/2005
// Rotina      : Parâmetro Novo
// Pendência   : 19506
// Descricao   : Controle do Preparo de Mensal de retidos
//               OPÇÕES: 0-NÃO PREPARA,
//                       1-PREPARA RETIDOS EXCETO TEMPORÁRIOS
//                       2-PREPARA TODOS OS RETIDOS
//------------------------------------------------------------------------------
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, ComCtrls, Db,
  DBTables, Wwquery, Wwdatsrc, DBCtrls, Mask, wwdbedit, wwdblook,
  TB97,FPrincipal, IvDictio, IvMulti, IvEMulti,
  Wwdotdot, Wwdbcomb, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  TB97Tlbr, CmEventosCadastro, Menus, CMProcuraMask, MontaSelect,
  ActnList, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, Spin, Provider, DBClient;

type
  TFrmParametroFolha = class(TfrmOkCancelar)
    fcOutlookBar: TfcOutlookBar;
    btnGerais: TfcShapeBtn;
    btnContraCheque: TfcShapeBtn;
    btnAdiantBenef: TfcShapeBtn;
    fcOutlookListGerais: TfcOutlookList;
    fcOutlookListContraCheque: TfcOutlookList;
    fcOutlookListAdiantamento: TfcOutlookList;
    fcOutlookListMotivos: TfcOutlookList;
    btnMotivos: TfcShapeBtn;
    fcOutlookListPreparo: TfcOutlookList;
    btnProcessoPreparo: TfcShapeBtn;
    fcOutlookListPrevia: TfcOutlookList;
    btnProcessoprevia: TfcShapeBtn;
    fcOutlookListEfetivacao: TfcOutlookList;
    btnProcessoEfetivacao: TfcShapeBtn;
    fcOutlookListRubricas: TfcOutlookList;
    btnRubricas: TfcShapeBtn;
    alPrincipal: TActionList;
    ntbPai: TNotebook;
    actGerais: TAction;
    actContacheque: TAction;
    actAdiantamento: TAction;
    actMotivos: TAction;
    actBeneficios: TAction;
    actContribuicoes: TAction;
    actPreparo: TAction;
    actPrevia: TAction;
    actCorrecao: TAction;
    actArredondamento: TAction;
    actIRRF: TAction;
    actpensao: TAction;
    actCPMF: TAction;
    actEfetivacao: TAction;
    actRubricas: TAction;
    actContabilidade: TAction;
    actCPagar: TAction;
    mmSeparador: TMemo;
    lblSeparador: TLabel;
    rgOpcao: TRadioGroup;
    dbmmRodape: TDBMemo;
    Label17: TLabel;
    dbmmCabec: TDBMemo;
    Label15: TLabel;
    rdgEnvioContribManut: TRadioGroup;
    rdgEnvioContribConc: TRadioGroup;
    GroupBox4: TGroupBox;
    DbChBxCorrigeBenef: TDBCheckBox;
    cmbIRRF: TwwDBLookupCombo;
    Label5: TLabel;
    cmbIRRF_INSS: TwwDBLookupCombo;
    Label39: TLabel;
    cmbIRRFAbono: TwwDBLookupCombo;
    Label40: TLabel;
    cmbIRRF_Pensao_desativado: TwwDBLookupCombo;
    Label42_desativado: TLabel;
    cmbIRRF_PA_desativado: TwwDBLookupCombo;
    Label43_desativado: TLabel;
    cmbIRRF_Comp: TwwDBLookupCombo;
    Label11: TLabel;
    cmbRubDescDepIR: TwwDBLookupCombo;
    Label7: TLabel;
    cmbRubDescIdadeIR: TwwDBLookupCombo;
    Label8: TLabel;
    cmbIRResgReserva: TwwDBLookupCombo;
    Label50: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    dbVlrMinIRRF: TDBRealEdit;
    cboxFlgVlIrMiniAbono: TDBCheckBox;
    GroupBox6: TGroupBox;
    DBCheckBox3: TDBCheckBox;
    grpDebito: TGroupBox;
    Label19: TLabel;
    cmbCCusto: TwwDBLookupCombo;
    GroupBox9: TGroupBox;
    lbDescricaoCCusto: TLabel;
    dblkContaDebito: TwwDBLookupCombo;
    grpCredito: TGroupBox;
    lbCcusto1: TLabel;
    cmbCCusto1: TwwDBLookupCombo;
    grbGrCcusto1: TGroupBox;
    lbDescricaoCCusto1: TLabel;
    dblkContacredito: TwwDBLookupCombo;
    Panel2: TPanel;
    Label13: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    pnlGlobContab: TPanel;
    lblcentrespon: TLabel;
    lbAtividade: TLabel;
    lblContasCaixas: TLabel;
    cmbcentrespon: TwwDBLookupCombo;
    lkcmbDescAtividade: TwwDBLookupCombo;
    dblkpcmbPortForma: TwwDBLookupCombo;
    GroupBox10: TGroupBox;
    dblkRecdes: TwwDBLookupCombo;
    GroupBox11: TGroupBox;
    dblkRecdesFav: TwwDBLookupCombo;
    msTipoDesemb: TMontaSelect;
    GrpCalcAutDeIR: TGroupBox;
    ChkNumDepIR: TCheckBox;
    Label10: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    GroupBox2: TGroupBox;
    cbxIntegraCont: TCheckBox;
    cbxIntegraFinanc: TCheckBox;
    PrintDialog1: TPrintDialog;
    GroupBox13: TGroupBox;
    dblcRegraVerificacao: TwwDBLookupCombo;
    GroupBox15: TGroupBox;
    chkTestaRegra: TCheckBox;
    GroupBox16: TGroupBox;
    dblcCredAdiantamento: TwwDBLookupCombo;
    GroupBox17: TGroupBox;
    cmbAdiantBenef: TwwDBLookupCombo;
    GroupBox18: TGroupBox;
    cmbMotFolhaNormal: TwwDBLookupCombo;
    GroupBox19: TGroupBox;
    cmbMotFolhaAbono: TwwDBLookupCombo;
    GroupBox20: TGroupBox;
    cmbMotDevBenef: TwwDBLookupCombo;
    GroupBox21: TGroupBox;
    cmbMotFolhaAdiantBenef: TwwDBLookupCombo;
    GroupBox22: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    GroupBox23: TGroupBox;
    DBCheckBox2: TDBCheckBox;
    GroupBox26: TGroupBox;
    DBCheckBox7: TDBCheckBox;
    GroupBox27: TGroupBox;
    cmbCMPosBenef: TwwDBLookupCombo;
    GroupBox28: TGroupBox;
    cmbCMNegContrib: TwwDBLookupCombo;
    GroupBox29: TGroupBox;
    cmbCMNegBenef: TwwDBLookupCombo;
    GroupBox30: TGroupBox;
    cmbCMPosContrib: TwwDBLookupCombo;
    GroupBox31: TGroupBox;
    cmbArredonda: TwwDBLookupCombo;
    GroupBox32: TGroupBox;
    cmbArredMesAnt: TwwDBLookupCombo;
    GroupBox33: TGroupBox;
    DBRealEdit1: TDBRealEdit;
    GroupBox7: TGroupBox;
    cmbVlr_CPMF_PA_INSS: TwwDBLookupCombo;
    GroupBox34: TGroupBox;
    cmbVlr_CPMF_PA_INSS_DESC: TwwDBLookupCombo;
    GroupBox35: TGroupBox;
    cmbVlrCPMF_INSS: TwwDBLookupCombo;
    GroupBox36: TGroupBox;
    dbredIndiceCPMF: TDBRealEdit;
    GroupBox5: TGroupBox;
    GroupBox37: TGroupBox;
    cbxApaga: TCheckBox;
    cbxVerifica: TCheckBox;
    GroupBox38: TGroupBox;
    GroupBox39: TGroupBox;
    DBCheckBox5: TDBCheckBox;
    GroupBox41: TGroupBox;
    DBCheckBox8: TDBCheckBox;
    GroupBox42: TGroupBox;
    DBCheckBox10: TDBCheckBox;
    GroupBox43: TGroupBox;
    ChkFlgEstadoRub: TCheckBox;
    GroupBox44: TGroupBox;
    ChkUsaRegraxRub: TCheckBox;
    GroupBox45: TGroupBox;
    dblkGrupoRegra: TwwDBLookupCombo;
    rdgUsaCPMF: TRadioGroup;
    GroupBox46: TGroupBox;
    spnLotes: TSpinEdit;
    actSalfam: TAction;
    GroupBox47: TGroupBox;
    dbrValSalfam: TDBRealEdit;
    GroupBox48: TGroupBox;
    dbrTetoSalfam: TDBRealEdit;
    GroupBox49: TGroupBox;
    dblcSalFam: TwwDBLookupCombo;
    actImportacao: TAction;
    GroupBox50: TGroupBox;
    mkeMascara: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    grpAgrupaPorRubrica: TGroupBox;
    ChkAgrupaRubrica: TCheckBox;
    GroupBox51: TGroupBox;
    cboxEstruturaCalculo: TCheckBox;
    GroupBox53: TGroupBox;
    cboxNegativaBase: TCheckBox;
    rgCodRubrica: TRadioGroup;
    fcOutlookListConvenios: TfcOutlookList;
    btnConvenios: TfcShapeBtn;
    actConvenios: TAction;
    rdgConvenios: TRadioGroup;
    cbxUsaCodRubExtInt: TCheckBox;
    qryAux: TwwQuery;
    qryDescontos: TwwQuery;
    dsRecdes: TDataSource;
    qryMotivo: TwwQuery;
    qryRubricas: TwwQuery;
    qryCodRecDesfav: TQuery;
    QryTipoAgreg: TwwQuery;
    qryCodRecDes: TQuery;
    dsRecDesFav: TDataSource;
    dsContaCredito: TDataSource;
    qryContaCredito: TQuery;
    dsContaDebito: TDataSource;
    qryRecDesemb: TwwQuery;
    qryTipoDocPessoa: TwwQuery;
    qryContaDebito: TQuery;
    qryRubricaEspecial: TwwQuery;
    qryProventos: TwwQuery;
    dsRecDesemb: TwwDataSource;
    qryRegra: TwwQuery;
    qry: TwwQuery;
    qryFLGIMPCERTIF: TFloatField;
    qryIDREGRACALCINSS: TFloatField;
    qryIDMOTIVOCONTRIBP: TFloatField;
    qryIDRUBIRRF: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODALTDESPDESCFO: TFloatField;
    qryCODALTIRCOM: TFloatField;
    qryDATAULTDVR: TDateTimeField;
    qryPRAZODVR: TFloatField;
    qryFLGINTCONTAB: TFloatField;
    qryMARGEMDESCONTOS: TFloatField;
    qryMASCTIPORESERVA: TStringField;
    qryFLGMULTIFUNDACAO: TFloatField;
    qryIDMOTIVOEMPRESTI: TFloatField;
    qryIDMOTIVOCONTRIBA: TFloatField;
    qryIDMOTIVOATRASOAS: TFloatField;
    qryIDMOTIVODEVOLAS: TFloatField;
    qryIDMOTIVOFINANCAS: TFloatField;
    qryIDMOTIVOFOLHABEN: TFloatField;
    qryIDMOTIVOFORNPAG: TFloatField;
    qryIDMOTIVOFORNCOMI: TFloatField;
    qryFLGINTCONTBASS: TFloatField;
    qryFLGINTCPAGAR: TFloatField;
    qryFLGINTCRECEBER: TFloatField;
    qryFLGINTCPAGARPREV: TFloatField;
    qryFLGINTCRECEBERPR: TFloatField;
    qryIDMOTIVOABONO: TFloatField;
    qryIDRUBQUITAEMPREST: TFloatField;
    qryIDRUBQUITAPREV: TFloatField;
    qryIDRUBQUITAASSIST: TFloatField;
    qryIDDOCUMENTO: TFloatField;
    qryIDRUBIRRFINSS: TFloatField;
    qryIDRUBIRRFABONO: TFloatField;
    qryIDRUBIRRFEXT: TFloatField;
    qryIDRUBIRRFPENSAO: TFloatField;
    qryIDMOTIVODEVOLBEN: TFloatField;
    qryIDCONTRACHEQUE: TFloatField;
    qryIDRUBADIANT: TFloatField;
    qryIDMOTIVOADIANT: TFloatField;
    qryIDRUBIRRFPENALIM: TFloatField;
    qryIDMOTIVODIVERG: TFloatField;
    qryIDRUBARRED: TFloatField;
    qryIDRUBARREDMESANT: TFloatField;
    qryIDTIPOAGRECPMF: TFloatField;
    qryIDRUBRICACPMF: TFloatField;
    qryFLGUSAFOLHARESG: TFloatField;
    qryFLGTRATAPREVIAPA: TFloatField;
    qryFLGCALCULOVALORES: TFloatField;
    qryFLGCORRIGEBENEF: TFloatField;
    qryVLRARREDSALARIO: TFloatField;
    qryIDRUBIRRFRESG: TFloatField;
    qryVLRBENEFMIN: TFloatField;
    qryIDRUBCMBENEF: TFloatField;
    qryIDRUBCMCONT: TFloatField;
    qryIDRUBAJCMBENEF: TFloatField;
    qryIDRUBAJCMCONT: TFloatField;
    qryIDMOTDEVOLNAOIDEN: TFloatField;
    qryFLGCALCJUNTO: TFloatField;
    qryPERCCPMF: TFloatField;
    qryIDREGRAVERIFFOLHA: TFloatField;
    qryIDRUBDESCDEP: TFloatField;
    qryIDRUBDESCIDADE: TFloatField;
    qryIDRUBIRRFPROVJUD: TFloatField;
    qryIDRUBIRRFCOMPIR: TFloatField;
    qryVLMINIRFF: TFloatField;
    qryFLGVLIRMINABONO: TFloatField;
    qryFLGRECALCULOSRBMES: TFloatField;
    qryFLGEXECRGBMINMES: TFloatField;
    qryIDRUBCREDADIANT: TFloatField;
    qryCABECARQCC: TStringField;
    qryRODAPEARQCC: TStringField;
    qryFLGOBRIGAALMENTDO: TFloatField;
    qryFLGUSACODRUBEXT: TFloatField;
    qryFLGUSAPRAZORUB: TFloatField;
    qryFLGUSABENEFXRUB: TFloatField;
    qryFLGVERRUBFOLBEN: TFloatField;
    qryFLGVERATIVOS: TFloatField;
    qryIDRUBPENSAO: TFloatField;
    qryIDRUBPALIMINSS: TFloatField;
    ds: TwwDataSource;
    updQry: TUpdateSQL;
    qryGrupoRegra: TwwQuery;
    qryPrograma: TwwQuery;
    grbMensErroValorRegra: TGroupBox;
    chkMensErroValorRegra: TCheckBox;
    grbTrataLoteIndependente: TGroupBox;
    chkTrataLoteIndependente: TCheckBox;
    grbReajustaCancelado: TGroupBox;
    grbPreparaBenefDesativado: TGroupBox;
    grbCancelaFilho: TGroupBox;
    chkReajustaCancelado: TCheckBox;
    chkPreparaBenefDesativado: TCheckBox;
    chkCancelaFilho: TCheckBox;
    grbReajusteEmLote: TGroupBox;
    chkReajusteEmLote: TCheckBox;
    grbConfimaNoFinal: TGroupBox;
    chkConfirmaNoFinal: TCheckBox;
    grbTipoDocPagtoConv: TGroupBox;
    grbTipoDocConvR: TGroupBox;
    dblkTipoDocPagtoConv: TwwDBLookupCombo;
    dblkTipoDocConvR: TwwDBLookupCombo;
    qryTipoDocConvP: TwwQuery;
    qryTipoDocConvR: TwwQuery;
    Label6: TLabel;
    Label14: TLabel;
    cmbIRRFINSSAbono: TwwDBLookupCombo;
    GroupBox1: TGroupBox;
    chkrubacjud: TCheckBox;
    grbCalSalVirtMensalmente: TGroupBox;
    chkCalcSalVirtMensalmente: TCheckBox;
    grbCalculaIrResgateIsento: TGroupBox;
    chkCalculaIrResgateIsento: TCheckBox;
    grbRecalculaBenefCotas: TGroupBox;
    chkRecalculaBenefCotas: TCheckBox;
    grbCalculaDifBenefCotas: TGroupBox;
    chkCalculaDifBenefCotas: TCheckBox;
    GroupBox40: TGroupBox;
    lblcontab: TLabel;
    grbCalcPensAlimAntPrevia: TGroupBox;
    chkCalcPensAlimAntPrevia: TCheckBox;
    gboxTipoRegra: TGroupBox;
    cboxAcessoTipoRegra: TCheckBox;
    cboxControleTipoRegra: TCheckBox;
    dblcTipoRegraPadrao: TwwDBLookupCombo;
    lblTipoRegraPadrao: TLabel;
    qryTipoRegra: TwwQuery;
    gboxPgtoFavOutros: TGroupBox;
    cboxPgtoFavOutros: TCheckBox;
    GroupBox54: TGroupBox;
    dblkPortFormaPatro: TwwDBLookupCombo;
    qryPortFormaPatro: TwwQuery;
    qryIDGRINSTR: TFloatField;
    qryCODPORTFORMAPATRO: TFloatField;
    qryIDFUNDACAO: TFloatField;
    GroupBox55: TGroupBox;
    Label1: TLabel;
    Label16: TLabel;
    dblcIdRubBaseMensalIRRF: TwwDBLookupCombo;
    Label18: TLabel;
    dblcIdRubValorMensalIRRF: TwwDBLookupCombo;
    cboxFlgBaseMensalIRRF: TCheckBox;
    cmbRubDescDepIRAbono: TwwDBLookupCombo;
    Label20: TLabel;
    qryRubDescDepIRAbono: TwwQuery;
    cmbRubDescIdadeIRAbono: TwwDBLookupCombo;
    Label21: TLabel;
    qryRubDescIdadeIRAbono: TwwQuery;
    qryRubConsigCredAbono: TwwQuery;
    qryRubConsigDescAbono: TwwQuery;
    Label22: TLabel;
    cmbRubConsigCredAbono: TwwDBLookupCombo;
    Label26: TLabel;
    cmbRubConsigDescAbono: TwwDBLookupCombo;
    Label27: TLabel;
    cmbRubDescDepIRResgate: TwwDBLookupCombo;
    Label28: TLabel;
    cmbRubDescIdadeIRResgate: TwwDBLookupCombo;
    qryRubDescIdadeIRResgate: TwwQuery;
    qryRubDescDepIRResgate: TwwQuery;
    GroupBox57: TGroupBox;
    cboxNaoRecalculaIRPagPendente: TCheckBox;
    cboxCorrigeReservaMes: TCheckBox;
    GroupBox56: TGroupBox;
    dblcRegraSalFam: TwwDBLookupCombo;
    GroupBox58: TGroupBox;
    dbrMaxLimitePgto: TDBRealEdit;
    Label29: TLabel;
    GroupBox59: TGroupBox;
    Label30: TLabel;
    dbrValorDeduzBase: TDBRealEdit;
    grbAbreDOCTED: TGroupBox;
    cboxAbreDocAlt: TCheckBox;
    cboxAgrupaArqDocAlt: TCheckBox;
    gboxInibeMsgDetalhada: TGroupBox;
    cboxInibeMsgDetalhada: TCheckBox;
    GroupBox52: TGroupBox;
    redBrutoINSSCPMF: TRealEdit;
    gboxMatricula: TGroupBox;
    cboxMatriculaCompleta: TCheckBox;
    GroupBox60: TGroupBox;
    cboxMatriculaDependente: TCheckBox;
    gboxBuscaAdiantamentoPA: TGroupBox;
    cboxBuscaAdiantamentoPA: TCheckBox;
    gboxBuscaAbonoAnteriorPago: TGroupBox;
    cboxBuscaAbonoAnteriorPago: TCheckBox;
    gboxAbateTodasReservasRegra: TGroupBox;
    cboxAbateTodasReservasRegra: TCheckBox;
    GroupBox24: TGroupBox;
    dblcRegraBenefMin: TwwDBLookupCombo;
    gboxGeraAlteradoresCAPConvenio: TGroupBox;
    cboxGeraAlteradoresCAPConvenio: TCheckBox;
    gboxMargemDesconto: TGroupBox;
    dbredValorMargemdesconto: TDBRealEdit;
    lblValorMargemDesconto: TLabel;
    lblTipoMargemDesconto: TLabel;
    cbboxTipoMargemDesconto: TComboBox;
    Label9: TLabel;
    GroupBox14: TGroupBox;
    GroupBox61: TGroupBox;
    cboxEfetuaProvisaoAbono: TCheckBox;
    pnlComp1: TPanel;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox25: TGroupBox;
    DbChBxUsaFolhaResg: TDBCheckBox;
    gboxForcaDataRIndiv: TGroupBox;
    cboxForcaDataRIndiv: TCheckBox;
    qryRubIRRegressiva: TwwQuery;
    lblRubricaIRRFResgateTribRegressiva: TLabel;
    cmbRubricaIRRFResgateTribRegressiva: TwwDBLookupCombo;
    gboxPreparoRetidoMensal: TGroupBox;
    lblPreparoRetidoMensal: TLabel;
    cboxPreparoRetidoMensal: TComboBox;
    gboxPreparoRetidoAbono: TGroupBox;
    cboxPreparoRetidoAbono: TComboBox;
    Label32: TLabel;
    lblRubricaIRRFVitalicioTribRegressiva: TLabel;
    cmbRubricaIRRFVitalicioTribRegressiva: TwwDBLookupCombo;
    lblRubricaIRRFAbonoTribRegressiva: TLabel;
    cmbRubricaIRRFAbonoTribRegressiva: TwwDBLookupCombo;
    gboxRateioPlanoRubrica: TGroupBox;
    Label12: TLabel;
    cbboxRateioPlanoRubrica: TComboBox;
    gboxParcelas: TGroupBox;
    lblFormaParcela: TLabel;
    cbboxTipoParcela: TComboBox;
    GroupBox62: TGroupBox;
    cmbAdiantBenefIsento: TwwDBLookupCombo;
    GroupBox63: TGroupBox;
    dblcCredAdiantamentoIsento: TwwDBLookupCombo;
    qryDescontosIsento: TwwQuery;
    qryProventosIsento: TwwQuery;
    gboxMesRefRIndiv: TGroupBox;
    cboxMesRefRIndiv: TCheckBox;
    gboxRecebedorDuplicado: TGroupBox;
    cboxRecebedorDuplicado: TCheckBox;
    gboxDesativacaoAutomaticaRubricaIndiv: TGroupBox;
    lblDesativacaoAutomaticaRubricaIndiv: TLabel;
    cboxDesativacaoAutomaticaRubricaIndiv: TComboBox;
    mmDesativacaoAutomaticaRubricaIndiv: TMemo;
    GroupBox8: TGroupBox;
    dblPrograma: TwwDBLookupCombo;
    GroupBox12: TGroupBox;
    cmbccusto2: TwwDBLookupCombo;
    gboxCentroResponPadrao: TGroupBox;
    dblcCentroResponPadrao: TwwDBLookupCombo;
    mmCentroResponPadrao: TMemo;
    qryIRRFRRA: TwwQuery;
    dsIRRFRRA: TwwDataSource;
    GroupBox65: TGroupBox;
    dbcbIRRFRRA: TwwDBLookupCombo;
    //dbcbIRRFRRA: TwwDBLookupCombo;
    qryIRRFRRAIDSITHABILITACAO: TFloatField;
    qryIRRFRRADESCRICAO: TStringField;
    qryIRRFRRAFLGHABILITACAOINSS: TFloatField;
    grbRRA: TGroupBox;
    Label31: TLabel;
    cboRRA: TwwDBLookupCombo;
	
	// Felipe A. Santos SOL 258357/17801 PPM 1083052 - qryLkpRRAFund
    qryLkpRRAINSS: TwwQuery;
    cboRRAFund: TwwDBLookupCombo;
    lblRRAIRRFFund: TLabel;
    qryLkpRRAFund: TwwQuery;
    grp1: TGroupBox;
    dblcAdtAbonoFund: TwwDBLookupCombo;
    qryMes: TQuery;
    lblABFund: TLabel;
    lblABINSS: TLabel;
    dblcAdtAbonoINSS: TwwDBLookupCombo;
    GroupBox64: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    dblcAbonoFund: TwwDBLookupCombo;
    dblcAbonoINSS: TwwDBLookupCombo;
    grpIrTotal: TGroupBox;
    lblIRComp: TLabel;
    cboIRComp: TwwDBLookupCombo;
    qryLkpIRComp: TwwQuery;
    Label35: TLabel;
    cboIRCompAB: TwwDBLookupCombo;
    qryLkpIRCompAB: TwwQuery;
    GroupBox66: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    cboIRInformativoAJ: TwwDBLookupCombo;
    cboIRInformativoAJAb: TwwDBLookupCombo;
    qryLkpIRInfoAb: TwwQuery;
    qryLkpIRInfo: TwwQuery;
    Label38: TLabel;
    cboRegraAcao: TwwDBLookupCombo;
    qryLkpRegraIrAcao: TwwQuery;
    grpIrSimples: TGroupBox;
    lblIRSimples: TLabel;
    lblIRSimplesAB: TLabel;
    cboIRSimples: TwwDBLookupCombo;
    cboIRSimplesAB: TwwDBLookupCombo;
    qryLkpIRSimples: TwwQuery;
    qryLkpIRSimplesAB: TwwQuery;
    dbFlgDescSimples: TCheckBox;
    dbrDeducaoDescSimples: TDBRealEdit;
    Label43: TLabel;
    grpDescSimplesAbate: TGroupBox;
    dbFlgDescSimplesIdade: TCheckBox;
    dbFlgDescSimplesDepend: TCheckBox;
    lblIRSimplesINSS: TLabel;
    lblIRSimplesInssAB: TLabel;
    cboIRSimplesINSS: TwwDBLookupCombo;
    cboIRSimplesInssAB: TwwDBLookupCombo;
    qryLkpIRSimplesInss: TwwQuery;
    qryLkpIRSimplesInssAB: TwwQuery;
    GroupBox67: TGroupBox;
    dbFlgNovoIRExt: TCheckBox;
    Label41_desativado: TLabel;
    cmbIRRFExterior_desativado: TwwDBLookupCombo;
    procedure actGeraisExecute(Sender: TObject);
    procedure actContachequeExecute(Sender: TObject);
    procedure actAdiantamentoExecute(Sender: TObject);
    procedure actMotivosExecute(Sender: TObject);
    procedure actPreparoExecute(Sender: TObject);
    procedure actBeneficiosExecute(Sender: TObject);
    procedure actContribuicoesExecute(Sender: TObject);
    procedure actPreviaExecute(Sender: TObject);
    procedure actCorrecaoExecute(Sender: TObject);
    procedure actArredondamentoExecute(Sender: TObject);
    procedure actIRRFExecute(Sender: TObject);
    procedure actpensaoExecute(Sender: TObject);
    procedure actCPMFExecute(Sender: TObject);
    procedure actEfetivacaoExecute(Sender: TObject);
    procedure actRubricasExecute(Sender: TObject);
    procedure actContabilidadeExecute(Sender: TObject);
    procedure actCPagarExecute(Sender: TObject);
    function TiraPontos( Valor  : String) : String;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgUsaCPMFClick(Sender: TObject);
    procedure actSalfamExecute(Sender: TObject);
    procedure actImportacaoExecute(Sender: TObject);
    procedure actConveniosExecute(Sender: TObject);
    procedure qryBeforePost(DataSet: TDataSet);
    procedure dblkGrupoRegraChange(Sender: TObject);
    procedure dblkGrupoRegraExit(Sender: TObject);
    procedure btnProcessopreviaClick(Sender: TObject);
    procedure cboxFlgBaseMensalIRRFClick(Sender: TObject);
    procedure AtribuiRubricaCombobox(Sender: TObject);
    procedure AtribuiRegraCombobox(Sender: TObject);
    procedure cboxAbreDocAltClick(Sender: TObject);
    procedure dbcbIRRFRRAChange(Sender: TObject);
    procedure cdsRRANewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    iFlgdesconto,iObrigaFavorec : Integer;
    bUsaABC, bUsaCRespon: boolean;
    procedure AbreQueryTipoRegra;
    procedure SetaBaseMensalIRRF;
    function ValidaRubricaIR: Boolean;
    function ValidaRubricaDeducao: Boolean;
  public
    { Public declarations }
  end;

var
  FrmParametroFolha: TFrmParametroFolha;

implementation

uses DBaseDados, uAdmPrevFB, UDataBase, UMensErro, USistema, UAutorizacao,
     UFolhaBenef, DIntegracao, uIntegraBack, UModulo, uObjFolha;

Type
   tipoMascara = set of char;
Const
   mascara : tipoMascara = ['9','.'];
   letra   : tipoMascara = ['A'..'z'];
   numero  : tipoMascara = ['0'..'9'];


{$R *.DFM}

function TFrmParametroFolha.TiraPontos( Valor  : String) : String;
var i: LongInt;
begin
  i := Pos('.', Valor);
  while i > 0 do
  begin
    Valor := Copy(Valor,1,i-1)+Copy(Valor,i+1,Length(Valor));
    i := Pos('.', Valor);
  end;
  Result := Valor;
end;

procedure TFrmParametroFolha.actGeraisExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 0;
end;

procedure TFrmParametroFolha.actContachequeExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 1;
end;

procedure TFrmParametroFolha.actAdiantamentoExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 2;
end;

procedure TFrmParametroFolha.actMotivosExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 3;
end;

procedure TFrmParametroFolha.actPreparoExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 4;
end;

procedure TFrmParametroFolha.actBeneficiosExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 5;
end;

procedure TFrmParametroFolha.actContribuicoesExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 6;
end;

procedure TFrmParametroFolha.actPreviaExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 7;
end;

procedure TFrmParametroFolha.actCorrecaoExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 8;
end;

procedure TFrmParametroFolha.actArredondamentoExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 9;
end;

procedure TFrmParametroFolha.actIRRFExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 10;
end;

procedure TFrmParametroFolha.actpensaoExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 11;
end;

procedure TFrmParametroFolha.actCPMFExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 12;
end;

procedure TFrmParametroFolha.actEfetivacaoExecute(Sender: TObject);
begin
  inherited;
   ntbPai.pageIndex := 13;
end;

procedure TFrmParametroFolha.actRubricasExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 16;
end;

procedure TFrmParametroFolha.actContabilidadeExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 14;
end;

procedure TFrmParametroFolha.actCPagarExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 15;
end;

procedure TFrmParametroFolha.FormShow(Sender: TObject);
 var i: integer;
     sValor, sVlrDeduzBase, ssql: string;
     sVlrDeduzSimplif : string;    //edilaine SIG136670
begin
  inherited;
  WindowState := wsMaximized;

  fcOutlookBar.activepage:=btnGerais;
  ntbPai.activepage:='Gerais';

  qryGrupoRegra.Close;
  qryGrupoRegra.Open;

  qryPortFormaPatro.close;
  qryPortFormaPatro.ParamByName('PIDFUNDACAO').AsInteger := iidfundacao;
  qryPortFormaPatro.Open;

  qryTipoDocConvP.Close;
  qryTipoDocConvP.Open;
  qryTipoDocConvR.Close;
  qryTipoDocConvR.Open;

  qryMotivo.Close;
  qryMotivo.Open;

  qry.close;
  qry.parambyname('PIDFUNDACAO').asinteger:=iidfundacao;
  qry.Open;

  QryTipoAgreg.Open;

  qryRecDesemb.close;
  qryRecDesemb.parambyname('PIDFUNDACAO').asinteger:=iidfundacao;
  qryRecDesemb.Open;

  qryContaDebito.close;
  qryContadebito.Parambyname('PIDPLANO').asInteger := Integraback.Plano;
  qryContadebito.Open;

  qryContaCredito.close;
  qryContaCredito.Parambyname('PIDPLANO').asInteger := Integraback.Plano;
  qryContaCredito.Open;

  qryCodRecDes.close;
  qryCodRecDes.parambyname('PIDFUNDACAO').asinteger:=iidfundacao;
  qryCodRecDes.Parambyname('PIDPLANO').asInteger := Integraback.Plano;
  qryCodRecDes.Open;

  qryCodRecDesFav.close;
  qryCodRecDesFav.parambyname('PIDFUNDACAO').asinteger:=iidfundacao;
  qryCodRecDesFav.Parambyname('PIDPLANO').asInteger := Integraback.Plano;
  qryCodRecDesFav.Open;

  If SistemaFolha.FlgUsaCodRubExt = 1 Then
    sSql := 'SELECT P.IDPROVENTO, '+
                   'NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                   'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
            'FROM PROVDESC P '+
            'WHERE P.FLGDESCONTO = 2 '+
              'AND P.FLGESPECIAL IN (1, 2) '+
              'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
            'ORDER BY DESCRICAO '
  else
    sSql := 'SELECT P.IDPROVENTO, '+
                   'P.IDPROVENTO AS CODIGO, '+
                   'P.DESCRICAO AS DESCRICAO '+
            'FROM PROVDESC P '+
            'WHERE P.FLGDESCONTO = 2 '+
              'AND P.FLGESPECIAL IN (1, 2) '+
              'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRICAO ';

  qryRubDescDepIRAbono.Sql.Clear;
  qryRubDescDepIRAbono.Sql.Add(sSql);
  qryRubDescDepIRAbono.Open;

  qryRubDescIdadeIRAbono.Sql.Clear;
  qryRubDescIdadeIRAbono.Sql.Add(sSql);
  qryRubDescIdadeIRAbono.Open;

  If SistemaFolha.FlgUsaCodRubExt = 1 Then
    sSql := ' SELECT IDPROVENTO, '+
                  ' FLGOBRIGAFAVOREC, '+
                  ' DESCRPROVDESC AS DESCRICAO '+
            ' FROM PROVDESC '+
            ' WHERE FLGDESCONTO = 1 '+
              ' AND FLGTPRUBRICA LIKE ''%B%'' '+
            ' ORDER BY DESCRPROVDESC '
  Else
    sSql := ' SELECT IDPROVENTO, '+
                  ' FLGOBRIGAFAVOREC, '+
                  ' DESCRICAO AS DESCRICAO '+
            ' FROM PROVDESC '+
            ' WHERE FLGDESCONTO = 1 '+
              ' AND FLGTPRUBRICA LIKE ''%B%'' '+
            ' ORDER BY DESCRICAO ';

  qryRubConsigDescAbono.Sql.Clear;
  qryRubConsigDescAbono.Sql.Add(sSql);
  qryRubConsigDescAbono.Open;

  If SistemaFolha.FlgUsaCodRubExt = 1 Then
    sSql := ' SELECT IDPROVENTO, '+
                  ' FLGOBRIGAFAVOREC, '+
                  ' DESCRPROVDESC AS DESCRICAO '+
            ' FROM PROVDESC '+
            ' WHERE FLGDESCONTO = 0 '+
              ' AND FLGTPRUBRICA LIKE ''%B%'' '+
            ' ORDER BY DESCRPROVDESC '
  Else
    sSql := ' SELECT IDPROVENTO, '+
                  ' FLGOBRIGAFAVOREC, '+
                  ' DESCRICAO AS DESCRICAO '+
            ' FROM PROVDESC '+
            ' WHERE FLGDESCONTO = 0 '+
              ' AND FLGTPRUBRICA LIKE ''%B%'' '+
            ' ORDER BY DESCRICAO ';

  qryRubConsigCredAbono.Sql.Clear;
  qryRubConsigCredAbono.Sql.Add(sSql);
  qryRubConsigCredAbono.Open;

  If SistemaFolha.FlgUsaCodRubExt = 1 Then
    sSql := ' SELECT IDPROVENTO, CODPROVDESC||'' - ''||DESCRPROVDESC AS DESCRICAO '+
            ' FROM PROVDESC '+
            ' WHERE FLGDESCONTO = 2 AND FLGTPRUBRICA LIKE ''%B%'''+
            ' ORDER BY DESCRICAO '
  Else
    sSql := ' SELECT IDPROVENTO, IDPROVENTO||'' - ''||DESCRICAO AS DESCRICAO '+
            ' FROM PROVDESC '+
            ' WHERE FLGDESCONTO = 2 AND FLGTPRUBRICA LIKE ''%B%'''+
            ' ORDER BY DESCRICAO ';

  qryRubDescIdadeIRResgate.Sql.Clear;
  qryRubDescIdadeIRResgate.Sql.Add(sSql);
  qryRubDescIdadeIRResgate.Open;

  qryRubDescDepIRResgate.Sql.Clear;
  qryRubDescDepIRResgate.Sql.Add(sSql);
  qryRubDescDepIRResgate.Open;

  // QUERIES DE RUBRICAS
  if prmFLGUSACODRUBEXT = 1 then
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                 'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 2 '+
          'AND P.FLGESPECIAL IN (1, 2) '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRPROVDESC '
  else
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'P.IDPROVENTO AS CODIGO, '+
                 'P.DESCRICAO AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 2 '+
          'AND P.FLGESPECIAL IN (1, 2) '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRICAO ';

  qryRubricaEspecial.close;
  qryRubricaEspecial.sql.clear;
  qryRubricaEspecial.sql.Add(ssql);
  qryRubricaEspecial.Open;

  if prmFLGUSACODRUBEXT = 1 then
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                 'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 1 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRPROVDESC '
  else
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'P.IDPROVENTO AS CODIGO, '+
                 'P.DESCRICAO AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 1 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRICAO ';
  qryDescontos.close;
  qryDescontos.sql.clear;
  qryDescontos.sql.Add(ssql);
  qryDescontos.Open;

  if prmFLGUSACODRUBEXT = 1 then
    ssql:=' SELECT P.IDPROVENTO, '+
                 ' P.CODPROVDESC, '+
                 ' NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                 ' NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          ' FROM PROVDESC P '+
          ' WHERE P.FLGDESCONTO = 1 '+
            ' AND P.FLGESPECIAL = 0 '+
            ' AND P.FLGTPRUBRICA LIKE ''%B%'' '+
            ' AND P.CODIRRFDARF = ''5565'' '+
          ' ORDER BY P.DESCRPROVDESC '
  else
    ssql:=' SELECT P.IDPROVENTO, '+
                 ' P.CODPROVDESC, '+
                 ' P.IDPROVENTO AS CODIGO, '+
                 ' P.DESCRICAO AS DESCRICAO '+
          ' FROM PROVDESC P '+
          ' WHERE P.FLGDESCONTO = 1 '+
            ' AND P.FLGESPECIAL = 0 '+
            ' AND P.FLGTPRUBRICA LIKE ''%B%'' '+
            ' AND P.CODIRRFDARF = ''5565'' '+
          ' ORDER BY P.DESCRICAO ';
  qryRubIRRegressiva.close;
  qryRubIRRegressiva.sql.clear;
  qryRubIRRegressiva.sql.Add(ssql);
  qryRubIRRegressiva.Open;

  if prmFLGUSACODRUBEXT = 1 then
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                 'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 0 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRPROVDESC '
  else
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'P.IDPROVENTO AS CODIGO, '+
                 'P.DESCRICAO AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 0 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRICAO ';
  qryproventos.close;
  qryproventos.sql.clear;
  qryproventos.sql.Add(ssql);
  qryproventos.Open;

  if prmFLGUSACODRUBEXT = 1 then
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                 'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 0 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRPROVDESC '
  else
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'P.IDPROVENTO AS CODIGO, '+
                 'P.DESCRICAO AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 0 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRICAO ';
  qryProventosIsento.close;
  qryProventosIsento.sql.clear;
  qryProventosIsento.sql.Add(ssql);
  qryProventosIsento.Open;

  if prmFLGUSACODRUBEXT = 1 then
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'NVL(P.CODPROVDESC,P.IDPROVENTO) AS CODIGO, '+
                 'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 1 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRPROVDESC '
  else
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'P.IDPROVENTO AS CODIGO, '+
                 'P.DESCRICAO AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 1 '+
          'AND P.FLGESPECIAL = 0 '+
          'AND P.FLGTPRUBRICA LIKE ''%B%'' '+
          'ORDER BY P.DESCRICAO ';
  qryDescontosIsento.close;
  qryDescontosIsento.sql.clear;
  qryDescontosIsento.sql.Add(ssql);
  qryDescontosIsento.Open;
  
  if prmFLGUSACODRUBEXT = 1 then
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'NVL(P.DESCRPROVDESC,P.DESCRICAO) AS DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 0 '+
          'AND P.FLGESPECIAL = 0 '+
          'ORDER BY DESCRICAO '
  else
    ssql:='SELECT P.IDPROVENTO, '+
                 'P.CODPROVDESC, '+
                 'P.DESCRICAO '+
          'FROM PROVDESC P '+
          'WHERE P.FLGDESCONTO = 0 '+
          'AND P.FLGESPECIAL = 0 '+
          'ORDER BY IDPROVENTO ';

  qryRubricas.Close;
  qryRubricas.SQL.Clear;
  qryRubricas.SQL.Add(ssql);
  qryRubricas.Open;

  With dtmIntegracao Do
  Begin
    qryCCusto.Close;
    qryCCusto.SQL.Clear;
    sSql := 'SELECT C.IDEMPRESA,C.CODCENTROCUSTO,TRIM(C.CODCENTROCUSTO)||'' - ''||C.NOME AS NOME FROM CENTCUST C '+
            'WHERE C.IDEMPRESA = '+ InttoStr(iidfundacao)+
            'ORDER BY C.CODCENTROCUSTO ';
    qryCCusto.Sql.Add(sSql);
    qryCCusto.Open;
  End;

  if bTestaRegra then
    chkTestaRegra.Checked := True
  else
    chkTestaRegra.Checked := False;

  qryRegra.Close;
  qryRegra.Open;

  qryTipoDocPessoa.Close;
  qryTipoDocPessoa.Open;

  qryPrograma.Open;
  qryIRRFRRA.Open;//Fanuel Marinho SOL163044

  dtmIntegracao.qryFormaPag.Close;
  dtmIntegracao.qryFormaPag.Open;
  dtmIntegracao.qryAtividade.Close;
  dtmIntegracao.qryAtividade.ParamByName('IDEMPRESA').AsString:=IntToStr(iidfundacao);
  dtmIntegracao.qryAtividade.Open;
  dtmIntegracao.qryCentRespon.Close;
  dtmIntegracao.qryCentRespon.Open;
  dtmIntegracao.qrySubConta.close;
  dtmIntegracao.qrySubConta.Open;

  qry.Edit;

  // INICIO - PARAMETROS GRAVADOS NA TABELA PARAMFOLHA
  rdgEnvioContribManut.ItemIndex:=StrToInt(BuscaValorParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO'));
  rdgEnvioContribConc.ItemIndex:=StrToInt(BuscaValorParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO'));

  mmSeparador.text:=BuscaValorParametro(qryAux, 'SEPARADOR2CONTRACHEQUES');

  mkeMascara.text:=BuscaValorParametro(qryAux, 'MASCARAMATRICULA');

  if BuscaValorParametro(qryAux, 'CONTRACHEQUESPORPAGINA') = '2' then
    rgOpcao.itemindex:=1
  else
    rgOpcao.itemindex:=0;

  rgCodRubrica.itemindex:= StrToInt(BuscaValorParametro(qryAux, 'RUBRICACONTRACHEQUE'));

  rdgConvenios.ItemIndex:= StrtoInt(BuscaValorParametro(qryAux, 'MODOCPAGARCONVENIOS'));

  spnLotes.Value := StrToInt(BuscaValorParametro(qryAux, 'FLGNUMLOTES'));

  if BuscaValorParametro(qryAux, 'FLGCAPCONTROLACPMF') = '0' then
  begin
    rdgUsaCPMF.itemindex :=0;
    dblPrograma.Enabled  := false;
    cmbccusto2.Enabled   := false;
  end
  else
  begin
    rdgUsaCPMF.itemindex :=1;
    dblPrograma.Enabled  := true;
    cmbccusto2.Enabled   := true;
  end;

  cboxEstruturaCalculo.checked:=BuscaValorParametro(qryAux, 'FLGUSAMARGEM3070') = '1';

  If BuscaValorParametro(qryAux, 'FLGAPAGAPREVIA') = '0' then
    cbxApaga.checked := false
  else
    cbxApaga.checked := true;

  If BuscaValorParametro(qryAux, 'FLGVERIFICAPARM') = '0' then
    cbxVerifica.checked := false
  else
    cbxVerifica.checked := true;

  If BuscaValorParametro(qryAux, 'FLGINTEGRACONTABIL') = '0' then
    cbxIntegraCont.checked := false
  else
    cbxIntegraCont.checked := true;

  If BuscaValorParametro(qryAux, 'FLGINTEGRAFINANC') = '0' then
    cbxIntegraFinanc.checked := false
  else
    cbxIntegraFinanc.checked := true;

  //DEDUCAOBASEIR0561
  sVlrDeduzBase := BuscaValorParametro(qryAux, 'DEDUCAOBASEIR0561');
  if sVlrDeduzBase <> #255 then
    try
      dbrValorDeduzBase.Value := strtofloat(sVlrDeduzBase);
    except
      dbrValorDeduzBase.Value := 0;
    end;

  //VLRMAXLIMITEFOLHAEXTRA
  sValor:=BuscaValorParametro(qryAux, 'VLRMAXLIMITEFOLHAEXTRA');
  if sValor <> #255 then
    try
      dbrMaxLimitePgto.Value:=strtofloat(sValor);
    except
      dbrMaxLimitePgto.Value:=0;
    end;

  //FlgCalcPensAlimAntPrevia
  If BuscaValorParametro(qryAux, 'FLGCALCPENSALIMANTPREVIA') = '0' Then
    chkCalcPensAlimAntPrevia.Checked := False
  Else
    chkCalcPensAlimAntPrevia.Checked := True;

  //FLGNUMDEPIRNUMDEPSALFAM
  If BuscaValorParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM') = '0' then
    ChkNumDepIR.Checked := False
  else
    ChkNumDepIR.Checked := true;

  //FLGESTADORUB
  If BuscaValorParametro(qryAux, 'FLGESTADORUB') = '0' then
    ChkFlgEstadoRub.Checked := False
  else
    ChkFlgEstadoRub.Checked := true;

  //FLGUSAREGRAXRUB
  If BuscaValorParametro(qryAux, 'FLGUSAREGRAXRUB') = '0' then
    ChkUsaRegraxRub.Checked := False
  Else
    ChkUsaRegraxRub.Checked := True;

  If BuscaValorParametro(qryAux, 'FLGUSACODRUBEXT') = '0' then
    cbxUsaCodRubExtInt.Checked := False
  Else
    cbxUsaCodRubExtInt.Checked := True;

  //FLGAGRUPARUBRICA
  If BuscaValorParametro(qryAux, 'FLGAGRUPARUBRICA') = '0' Then
    ChkAgrupaRubrica.Checked := False
  Else
    ChkAgrupaRubrica.Checked := True;

  //FLGMENSERROVALREGRA
  If BuscaValorParametro(qryAux, 'FLGMENSERROVALREGRA') = '0' Then
    chkMensErroValorRegra.Checked := False
  Else
    chkMensErroValorRegra.Checked := True;

  //FLGREAJUSTACANCELADO
  If BuscaValorParametro(qryAux, 'FLGREAJUSTACANCELADO') = '0' Then
    chkReajustaCancelado.Checked := False
  Else
    chkReajustaCancelado.Checked := True;

  //FLGPREPARABENEFDESATIVADO
  If BuscaValorParametro(qryAux, 'FLGPREPARABENEFDESATIVADO') = '0' Then
    chkPreparaBenefDesativado.Checked := False
  Else
    chkPreparaBenefDesativado.Checked := True;

  //FLGCANCELAFILHO
  If BuscaValorParametro(qryAux, 'FLGCANCELAFILHO') = '0' Then
    chkCancelaFilho.Checked := False
  Else
    chkCancelaFilho.Checked := True;

  //FLGTRATALOTEINDEPENDENTE
  If BuscaValorParametro(qryAux, 'FLGTRATALOTEINDEPENDENTE') = '0' Then
    chkTrataLoteIndependente.Checked := False
  Else
    chkTrataLoteIndependente.Checked := True;

  //FLGABRERUBACJUD
  If BuscaValorParametro(qryAux, 'FLGABRERUBACJUD') = '0' Then
    chkrubacjud.Checked := False
  Else
    chkrubacjud.Checked := True;

  // FLGPARTIDADOBRADA
  If Fazquery(qryAux,'select pacdobrada '+
                     'from paramcontab '+
                     'where idpessoa = '+inttostr(iidfundacao)) then
  begin
    If qryAux.fieldbyname('PACDOBRADA').asstring = 'N' then
    begin
      SistemaFolha.FlgPartidadobrada:=0;
      lblcontab.Caption := 'SIMPLES';
    end
    else
    begin
      SistemaFolha.FlgPartidadobrada:=1;
      lblcontab.Caption := 'PARTIDA DOBRADA';
    end
  end
  else
  begin
    SistemaFolha.FlgPartidadobrada:=0;
    lblcontab.caption := 'SIMPLES';
  end;

  //FLGREAJUSTEEMLOTE
  If BuscaValorParametro(qryAux, 'FLGREAJUSTEEMLOTE') = '0' Then
    chkReajusteEmLote.Checked := False
  Else
    chkReajusteEmLote.Checked := True;

  //CALCSALVIRTTODOMES
  If BuscaValorParametro(qryAux, 'CALCSALVIRTTODOMES') = '0' Then
    chkCalcSalVirtMensalmente.Checked := False
  Else
    chkCalcSalVirtMensalmente.Checked := True;

  //FLGCALCULAIRRESGATEISENTO
  If BuscaValorParametro(qryAux, 'FLGCALCULAIRRESGATEISENTO') = '0' Then
    chkCalculaIrResgateIsento.Checked := False
  Else
    chkCalculaIrResgateIsento.Checked := True;

  //FLGRECALCULABENEFCOTAS
  If BuscaValorParametro(qryAux, 'FLGRECALCULABENEFCOTAS') = '0' Then
    chkRecalculaBenefCotas.Checked := False
  Else
    chkRecalculaBenefCotas.Checked := True;

  //FLGCALCULADIFBENEFCOTAS
  If BuscaValorParametro(qryAux, 'FLGCALCULADIFBENEFCOTAS') = '0' Then
    chkCalculaDifBenefCotas.Checked := False
  Else
    chkCalculaDifBenefCotas.Checked := True;

  //FLGCONFIRMANOFINAL
  If BuscaValorParametro(qryAux, 'FLGCONFIRMANOFINAL') = '0' Then
    chkConfirmaNoFinal.Checked := False
  Else
    chkConfirmaNoFinal.Checked := True;

  //MANTEMMESREFCONSTANTERB
  If BuscaValorParametro(qryAux, 'MANTEMMESREFCONSTANTERB') = '0' Then
    cboxMesRefRIndiv.Checked := False
  Else
    cboxMesRefRIndiv.Checked := True;

  If BuscaValorParametro(qryAux, 'VERIFICARECEBEDORDUPLICADO') = '0' Then
    cboxRecebedorDuplicado.Checked := False
  Else
    cboxRecebedorDuplicado.Checked := True;

  if (qryRegra.Locate('IDREGRA',
      BuscaValorParametro(qryAux, 'REGRASALFAM'),[])) then
    dblcRegraSalFam.Text:=qryRegra.FieldbyName('NOMEREGRA').AsString;

  // INICIO - LOOKUPS - GERAL
  if (QryContaDebito.Locate('PLACONTA',BuscaValorParametro(qryAux, 'PLACONTAD'),[])) then
    dblkContaDebito.Text := QryContaDebito.FieldbyName('PLACONTA').AsString;

  if (QryContaCredito.Locate('PLACONTA',BuscaValorParametro(qryAux, 'PLACONTAC'),[])) then
    dblkContaCredito.Text := QryContaCredito.FieldbyName('PLACONTA').AsString;

  if (qryCodRecDes.Locate('CODTIPRECDES',BuscaValorParametro(qryAux, 'CODTIPRECDES'),[])) then
    dblkRecdes.Text := qryCodRecDes.FieldbyName('DESCRICAO').AsString;

  if (qryCodRecDesfav.Locate('CODTIPRECDES',BuscaValorParametro(qryAux, 'CODTIPRECDESFAV'),[])) then
    dblkRecdesFav.Text := qryCodRecDesFav.FieldbyName('DESCRICAO').AsString;  

  //IDRUBDESCDEPIRRESGATE
  If (qryRubDescDepIRResgate.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBDESCDEPIRRESGATE'),[])) Then
    cmbRubDescDepIRResgate.Text := qryRubDescDepIRResgate.FieldByName('DESCRICAO').AsString;

  //IDRUBDESCIDADEIRRESGATE
  If (qryRubDescIdadeIRResgate.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBDESCIDADEIRRESGATE'),[])) Then
    cmbRubDescIdadeIRResgate.Text := qryRubDescIdadeIRResgate.FieldByName('DESCRICAO').AsString;

  //IDRUBCONSIGDESCABONO
  If (qryRubConsigDescAbono.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBCONSIGDESCABONO'),[])) Then
    cmbRubConsigDescAbono.Text := qryRubConsigDescAbono.FieldByName('DESCRICAO').AsString;

  //IDRUBCONSIGCREDABONO
  If (qryRubConsigCredAbono.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBCONSIGCREDABONO'),[])) Then
    cmbRubConsigCredAbono.Text := qryRubConsigCredAbono.FieldByName('DESCRICAO').AsString;

  //IDRUBDEDIDADEABONO
  If (qryRubDescIdadeIRAbono.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBDEDIDADEABONO'),[])) Then
    cmbRubDescIdadeIRAbono.Text := qryRubDescIdadeIRAbono.FieldByName('DESCRICAO').AsString;

  //IDRUBDEDDEPABONO
  If (qryRubDescDepIRAbono.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBDEDDEPABONO'),[])) Then
    cmbRubDescDepIRAbono.Text := qryRubDescDepIRAbono.FieldByName('DESCRICAO').AsString;

  //IDGRUPOREGRAFOLHA
  If (qryGrupoRegra.Locate('IDGRUPOREGRA',BuscaValorParametro(qryAux, 'IDGRUPOREGRAFOLHA'),[])) Then
    dblkGrupoRegra.Text := qryGrupoRegra.FieldByName('DESCRICAO').AsString;

  AbreQueryTipoRegra;
  If Trim(dblkGrupoRegra.Text) <> '' Then
    If (qryTipoRegra.Locate('IDTIPOREGRA',BuscaValorParametro(qryAux, 'TIPOREGRAPADRAO'),[])) Then
      dblcTipoRegraPadrao.text:=qryTipoRegra.fieldbyname('DESCREGRA').asstring;

  If BuscaValorParametro(qryAux, 'FLGACESSOTIPOREGRA') = '0' then
    cboxAcessoTipoRegra.checked := false
  else
    cboxAcessoTipoRegra.checked := true;

  If BuscaValorParametro(qryAux, 'FLGCONTROLETIPOREGRA') = '0' then
    cboxControleTipoRegra.checked := false
  else
    cboxControleTipoRegra.checked := true;

  If BuscaValorParametro(qryAux, 'FLGEFETUAPAGTOFAVOUTROS') = '0' then
    cboxPgtoFavOutros.checked := false
  else
    cboxPgtoFavOutros.checked := true;

  //TIPDOCCONVP
  If (qryTipoDocConvP.Locate('CODTIPDOC', BuscaValorParametro(qryAux, 'TIPDOCCONVP'), [])) Then
    dblkTipoDocPagtoConv.Text := qryTipoDocConvP.FieldByName('DESCRICAO').AsString;

  //TIPDOCCONVR
  If (qryTipoDocConvR.Locate('CODTIPDOC', BuscaValorParametro(qryAux, 'TIPDOCCONVR'), [])) Then
    dblkTipoDocConvR.Text := qryTipoDocConvR.FieldByName('DESCRICAO').AsString;

  If (qryPrograma.Locate('IDPROGRAMA',BuscaValorParametro(qryAux, 'IDPROGRAMAFOLHA'),[])) Then
    dblPrograma.Text := qryPrograma.FieldByName('DESCPROGRAMA').AsString;

  if (qryRubIRRegressiva.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBIRRFRESERVATRIBREGRESSIVA'),[])) then
    cmbRubricaIRRFResgateTribRegressiva.Text := qryRubIRRegressiva.FieldbyName('DESCRICAO').AsString;

  if (qryRubIRRegressiva.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBIRRFVITALICIOREGR'),[])) then
    cmbRubricaIRRFVitalicioTribRegressiva.Text:=qryRubIRRegressiva.FieldbyName('DESCRICAO').AsString;
  if (qryRubIRRegressiva.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBIRRFABONOREGR'),[])) then
    cmbRubricaIRRFAbonoTribRegressiva.Text:=qryRubIRRegressiva.FieldbyName('DESCRICAO').AsString;

  // LOOKUPS QUE USAM A PROVDESC - INICIO
  if (qryDescontos.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBIRRFINSSABONO'),[])) then
    cmbIRRFINSSAbono.Text := qryDescontos.FieldbyName('DESCRICAO').AsString;

  //Fanuel Marinho SOL163044 - Inicio
  if (qryIRRFRRA.Locate('IDSITHABILITACAO',BuscaValorParametro(qryAux, 'SITUACAOHABILITACAOINSS'),[])) then
    dbcbIRRFRRA.Text := qryIRRFRRA.FieldbyName('DESCRICAO').AsString;
  //Fanuel Marinho SOL163044 - Fim

  if (qryDescontos.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSSDESC'),[])) then
    cmbVlr_CPMF_PA_INSS_DESC.Text := qryDescontos.FieldbyName('DESCRICAO').AsString;

  if (qryProventos.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBCPMFPAINSS'),[])) then
    cmbVlr_CPMF_PA_INSS.Text := qryProventos.FieldbyName('DESCRICAO').AsString;

  if (qryProventos.Locate('IDPROVENTO',BuscaValorParametro(qryAux, 'IDRUBCREDSALFAM'),[])) then
    dblcSalFam.Text := qryProventos.FieldbyName('DESCRICAO').AsString;
  // LOOKUPS QUE USAM A PROVDESC - FIM

  // FIM - LOOKUPS - GERAL

  with dtmintegracao do
  Begin
    If (qrycCusto.Locate('CODCENTROCUSTO',BuscaValorParametro(qryAux, 'CODCCUSTOFINAN'),[])) Then
      cmbccusto2.Text := qrycCusto.FieldByName('NOME').AsString;

    if (QrySubConta.Locate('CODSUBCONTA',BuscaValorParametro(qryAux, 'SUBCONTA'),[])) then
      dblkSubconta.Text := QrySubConta.FieldbyName('NOMESUBCONTA').AsString;

    if (qryFormaPag.Locate('CODPORTFORMA',BuscaValorParametro(qryAux, 'CODPORTFORMA'),[loCaseInsensitive,loPartialKey])) then
      dblkpcmbPortForma.Text  := qryFormaPag.FieldByName('Descricao').AsString;

    if IntegraBack.ObrigaABC = 'N' then
    begin
      lkcmbDescAtividade.Enabled := false;
      bUsaABC := false;
    end
    else
    begin
      bUsaABC := true;
      lkcmbDescAtividade.Enabled := true;
      if (qryAtividade.Locate('UnidNegoc', BuscaValorParametro(qryAux, 'UNIDNEGOC'),
                              [loCaseInsensitive,loPartialKey])) then
        lkcmbDescAtividade.Text := qryAtividade.FieldByName('Nome').AsString;
    end;

    if IntegraBack.ObrigaCRespon = 'N' then
    begin
      cmbcentrespon.Enabled := false;
      bUsaCRespon := false;
    end
    else
    begin
      bUsaCRespon := true;
      cmbcentrespon.Enabled := true;

      If (qryCentRespon.Locate('CodCentroRespon',
                               BuscaValorParametro(qryAux, 'CODCENTRORESPON'),[])) then begin
        cmbcentrespon.Text          := qryCentRespon.FieldByName('Nome').AsString;
        //Renato Visoni Sol 99360 \ Kintana 435729
        dblcCentroResponPadrao.Text := qryCentRespon.FieldByName('Nome').AsString;
        //Fim
      end;

    end;

  end;

  // FIM - PARAMETROS GRAVADOS NA TABELA PARAMFOLHA

  //PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA
  cboxNegativaBase.Checked:=
    BuscaValorParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA') = '1';

  cboxFlgBaseMensalIRRF.checked:=SistemaFolha.FlgUsaBaseMensalIRRF;
  SetaBaseMensalIRRF;

  //CORRIGE RESGATE DE RESERVA NO MÊS DE PAGAMENTO
  cboxCorrigeReservaMes.Checked:=SistemaFolha.FlgCorrigeReservaMes=1;
  //CORRIGE RESGATE DE RESERVA NO MÊS DE PAGAMENTO - até aqui

  cboxNaoRecalculaIRPagPendente.checked:=
    SistemaFolha.FlgNaoRecalcIRPagPendente;

  cboxAbreDocAlt.Checked:=SistemaFolha.FlgAbreDocAlt;

  cboxAgrupaArqDocAlt.Checked:=SistemaFolha.FlgAgrupaArqDocAlt;

  cboxInibeMsgDetalhada.Checked:=SistemaFolha.FlgInibeMsgDetPreparo;

  try
    redBrutoINSSCPMF.Value:=SistemaFolha.LimiteBrutoINSSxCPMF;
  except
    redBrutoINSSCPMF.Value:=0;
  end;
  cboxMatriculaCompleta.Checked:=SistemaFolha.FlgUsaMatriculaCompleta;

  cboxMatriculaDependente.Checked:=SistemaFolha.FlgUsaMatriculaDependente;
  cboxBuscaAdiantamentoPA.Checked:=SistemaFolha.FlgBuscaAdiantamentoPA;
  cboxAbateTodasReservasRegra.Checked:=SistemaFolha.FlgAbateTodasReservasRegra;
  cboxBuscaAbonoAnteriorPago.Checked:=SistemaFolha.FlgBuscaAbonoAnteriorPago;
  cboxGeraAlteradoresCAPConvenio.Checked:=SistemaFolha.FlgGeraAlteradoresCAPConvenio; 

  cbboxTipoMargemDesconto.itemindex:=SistemaFolha.TipoMargemDesconto;
  dbredValorMargemdesconto.Value:=SistemaFolha.VlrMargemDesconto;

  cboxEfetuaProvisaoAbono.checked:=SistemaFolha.FlgUsaProvisaoAbono; 

  cboxForcaDataRIndiv.checked:=SistemaFolha.FlgForcaDataFinalRubIndiv; 

  cbboxTipoParcela.ItemIndex:=SistemaFolha.FormaParcelaPrevia; 

  cboxPreparoRetidoAbono.ItemIndex:=SistemaFolha.PreparoRetidoAbono;
  cboxPreparoRetidoMensal.ItemIndex:=SistemaFolha.PreparoRetidoMensal;

  cbboxRateioPlanoRubrica.ItemIndex:=SistemaFolha.RateioPlanoRubrica;

  cboxDesativacaoAutomaticaRubricaIndiv.ItemIndex:=
    SistemaFolha.DesativacaoAutomaticaRubricaIndiv;

  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - Comentado
  // Aline Freire Sol 155182 Kintana 1228739
  {try
    if cdsLkpProvDesc.active then cdsLkpProvDesc.close;
      cdsLkpProvDesc.Open;
  Except
    on E: Exception do
    begin
      ShowMessage('Erro ao abrir lookup da table PROVDESC! '+E.message);
      Abort;
    end;
  end;

  try
    if cdsRRA.Active then cdsRRA.close;
      cdsRRA.Open;
  Except
    on E: Exception do
    begin
      ShowMessage('Erro ao abrir table PARAMFOLHA referente ao Parâmetro de RRA '+E.message);
      Abort;
    end;
  end;

  //if cdsRRA.RecordCount > 0 then
    if cdsLkpRRAINSS.locate('IDPROVENTO',CdsRRAVALORPARAM.AsFloat,[]) then
    //  cboRRA.Text    := cdsLkpProvDescDESCRICAO.asstring; }
  // Aline Freire Sol 155182 Kintana 1228739
   // Felipe A. Santos - SOL 258357/17801 PPM 1083052 fim - Comentado


   // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início

   qryLkpRRAINSS.Close;
   qryLkpRRAINSS.Open;
   qryLkpRRAFund.Close;
   qryLkpRRAFund.Open;

   // RRA - IRRF - INSS
   if qryLkpRRAINSS.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRRFRRA'), []) then
      cboRRA.Text := qryLkpRRAINSS.FieldByName('DESCRICAO').AsString;

   // RRA - IRRF - Fundação
   if qryLkpRRAFund.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRRFRRAFUND'), []) then
      cboRRAFund.Text := qryLkpRRAFund.FieldByName('DESCRICAO').AsString;

   // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim

   // Andre Imakawa - SIG71773 -  Inicio
   qryLkpIRComp.Close;
   qryLkpIRComp.Open;

   qryLkpIRCompAB.Close;
   qryLkpIRCompAB.Open;

   if qryLkpIRComp.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRTOTALCOMP'), []) then
      cboIRComp.Text := qryLkpIRComp.FieldByName('DESCRICAO').AsString;
   if qryLkpIRCompAB.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRTOTALCOMPAB'), []) then
      cboIRCompAB.Text := qryLkpIRCompAB.FieldByName('DESCRICAO').AsString;
   // Andre Imakawa - SIG71773 -  Fim

   // Andre Imakawa - SIG92016 -  Inicio
   qryLkpIRInfo.Close;
   qryLkpIRInfo.Open;

   qryLkpIRInfoAb.Close;
   qryLkpIRInfoAb.Open;

   qryLkpRegraIrAcao.Close;
   qryLkpRegraIrAcao.Open;

   if qryLkpIRInfo.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRINFOACAO'), []) then
      cboIRInformativoAJ.Text := qryLkpIRInfo.FieldByName('DESCRICAO').AsString;
   if qryLkpIRInfoAb.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRINFOACAOAB'), []) then
      cboIRInformativoAJAb.Text := qryLkpIRInfoAb.FieldByName('DESCRICAO').AsString;
   if qryLkpRegraIrAcao.Locate('IDREGRA', BuscaValorParametro(qryAux, 'REGRACAOJUDGANHA'), []) then
      cboRegraAcao.Text := qryLkpRegraIrAcao.FieldByName('NOMEREGRA').AsString;
   // Andre Imakawa - SIG92016 -  Fim

   //edilaine SIG136670 : inicio
   qryLkpIRSimples.Close;
   qryLkpIRSimples.Open;

   qryLkpIRSimplesAB.Close;
   qryLkpIRSimplesAB.Open;

   qryLkpIRSimplesInss.Close;
   qryLkpIRSimplesInss.Open;

   qryLkpIRSimplesInssAB.Close;
   qryLkpIRSimplesInssAB.Open;


   If BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLES') <> #255 then
     if qryLkpIRSimples.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLES'), []) then
        cboIRSimples.Text := qryLkpIRSimples.FieldByName('DESCRICAO').AsString;

   If BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLESAB') <> #255 then
     if qryLkpIRSimplesAB.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBRICAIRDESCSIMPLESAB'), []) then
        cboIRSimplesAB.Text := qryLkpIRSimplesAB.FieldByName('DESCRICAO').AsString;

   If BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSS') <> #255 then
     if qryLkpIRSimplesInss.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSS'), []) then
        cboIRSimplesINSS.Text := qryLkpIRSimplesInss.FieldByName('DESCRICAO').AsString;

   If BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSSAB') <> #255 then
     if qryLkpIRSimplesInssAB.Locate('IDPROVENTO', BuscaValorParametro(qryAux, 'RUBIRDESCSIMPLESINSSAB'), []) then
        cboIRSimplesInssAB.Text := qryLkpIRSimplesInssAB.FieldByName('DESCRICAO').AsString;

   if BuscaValorParametro(qryAux, 'FLGDESCSIMPLESIRRF') = '1' then
      dbFlgDescSimples.Checked    := true
   else
      dbFlgDescSimples.Checked    := false;

   if BuscaValorParametro(qryAux, 'FLGDESCSIMPLESIDADE') = '1' then
      dbFlgDescSimplesIdade.Checked  := true
   else
      dbFlgDescSimplesIdade.Checked  := false;

   if BuscaValorParametro(qryAux, 'FLGDESCSIMPLESDEPEND') = '1' then
      dbFlgDescSimplesDepend.Checked := true
   else
      dbFlgDescSimplesDepend.Checked := false;

   sVlrDeduzSimplif := BuscaValorParametro(qryAux, 'DEDUCAODESCSIMPLES');
   if sVlrDeduzSimplif <> #255 then
     try
       //dbrDeducaoDescSimples.Value := strtofloat(sVlrDeduzSimplif);                              //edilaine WO7766
       dbrDeducaoDescSimples.Value := strtofloat(StringReplace(sVlrDeduzSimplif, '.', ',', []));   //edilaine WO7766
     except
       dbrDeducaoDescSimples.Value := 0;
    end;
   //edilaine SIG136670 : fim

   //edilaine WO29808 : inicio
   if BuscaValorParametro(qryAux, 'FLGNOVOIREXTERIOR') = '1' then
      dbFlgNovoIRExt.Checked    := true
   else
      dbFlgNovoIRExt.Checked    := false;
   //edilaine WO29808 : fim

   qryMes.Open; //Andre Imakawa - SIG99272
end;

//GUARDA IDPROVENTO DA RUBRICA PARA POSTERIOR GRAVACAO
procedure TFrmParametroFolha.AtribuiRubricaCombobox(Sender: TObject);
begin
  inherited;
  if (sender as twwdblookupcombo).lookuptable.active then
    (sender as twwdblookupcombo).tag:=
      (sender as twwdblookupcombo).lookuptable.FieldbyName('IDPROVENTO').asinteger;
end;

procedure TFrmParametroFolha.AtribuiRegraCombobox(Sender: TObject);
begin
  inherited;
  if (sender as twwdblookupcombo).lookuptable.active then
    (sender as twwdblookupcombo).tag:=
      (sender as twwdblookupcombo).lookuptable.FieldbyName('IDREGRA').asinteger;
end;

procedure TFrmParametroFolha.cboxFlgBaseMensalIRRFClick(Sender: TObject);
begin
  inherited;
  SetaBaseMensalIRRF;
end;

procedure TFrmParametroFolha.SetaBaseMensalIRRF;
begin
  if cboxFlgBaseMensalIRRF.checked then
  begin
    dblcIdRubBaseMensalIRRF.enabled:=true;
    dblcIdRubValorMensalIRRF.enabled:=true;
    if qryRubricaEspecial.Locate('IDPROVENTO', SistemaFolha.IdRubBaseMensalIRRF, []) then
      dblcIdRubBaseMensalIRRF.Text:=qryRubricaEspecial.FieldbyName('DESCRICAO').AsString;
    if qryRubricaEspecial.Locate('IDPROVENTO', SistemaFolha.IdRubValorMensalIRRF, []) then
      dblcIdRubValorMensalIRRF.Text:=qryRubricaEspecial.FieldbyName('DESCRICAO').AsString;
  end
  else
  begin
    dblcIdRubBaseMensalIRRF.enabled:=false;
    dblcIdRubValorMensalIRRF.enabled:=false;
    dblcIdRubBaseMensalIRRF.Text:='';
    dblcIdRubValorMensalIRRF.Text:='';
  end;
end;

procedure TFrmParametroFolha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  LeParam(dtmBaseDados.dbBaseDados.DatabaseName, False);

  with dtmIntegracao do
  begin
    qryTpReceb.Close;
    qryAtividade.Close;
    qryformapag.Close;
    qryCCusto.Close;
    qrycentrespon.Close;
    qrySubConta.Close;
  end;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
  //cdsRRA.close;
  //cdsLkpProvDesc.close;

  qryLkpRRAINSS.Close;
  qryLkpRRAFund.Close;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim

  // Andre Imakawa - SIG71773 - Inicio
  qryLkpIRComp.Close;
  qryLkpIRCompAB.Close;
  // Andre Imakawa - SIG71773 - Fim

  // Andre Imakawa - SIG92016 - Inicio
  qryLkpIRInfo.Close;
  qryLkpIRInfoAb.Close;

  qryLkpRegraIrAcao.Close;
  qryLkpRegraIrAcao.Close;
  // Andre Imakawa - SIG92016 - Fim
end;

procedure TFrmParametroFolha.bbtnConfirmarClick(Sender: TObject);
var sMascara : string;
    i,j : Integer;
    bRepetiu : boolean;
begin
  inherited;
  //Teste rubricas de Imposto de Renda
  if ValidaRubricaIR then
  begin
    MsgDlg('Existe mais de um parâmetro de rubricas de Imposto de Renda utilizando a mesma rubrica.', 'Informação', mtInformation, [mbOk], 0);
    Exit;
  end;

  //Teste rubricas de dedução de Imposto de Renda
  if ValidaRubricaDeducao then
  begin
    MsgDlg('Existe mais de um parâmetro de rubricas de dedução de Imposto de Renda utilizando a mesma rubrica.', 'Informação', mtInformation, [mbOk], 0);
    exit;
  end;

  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início
  // valida se as rubricas de RRA foram preenchidas
  if (Trim(cboRRA.Text) = '') then
  begin
   MsgDlg('É necessário selecionar a Rubrica IRRF - RRA - INSS.', 'Aviso', mtInformation, [mbOk], 0);
   Exit;
  end;

  if (Trim(cboRRAFund.Text) = '') then
  begin
   MsgDlg('É necessário selecionar a Rubrica IRRF - RRA - Fundação.', 'Aviso', mtInformation, [mbOk], 0);
   Exit;
  end;
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim

  if cboxFlgBaseMensalIRRF.checked then
  begin
    if trim(dblcIdRubBaseMensalIRRF.Text) = '' then
    begin
      ShowMessage('É obrigatória a escolha da Rubrica Informativa da Base de IRRF no mês.');
      Exit;
    end;
    if trim(dblcIdRubValorMensalIRRF.Text) = '' then
    begin
      ShowMessage('É obrigatória a escolha da Rubrica Informativa do Valor de IRRF no mês.');
      Exit;
    end;
  end;

  qry.Post;
  qry.CommitUpdates;

  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Alteração de Parâmetros.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  AlterarParametro(qryAux, 'FLGNUMLOTES',IntToStr(spnLotes.Value));

  AlterarParametro(qryAux, 'CONTRACHEQUESPORPAGINA', inttostr(rgOpcao.itemindex+1));
  AlterarParametro(qryAux, 'RUBRICACONTRACHEQUE',IntToStr(rgCodRubrica.itemindex));

  AlterarParametro(qryAux, 'MODOCPAGARCONVENIOS',IntToStr(rdgConvenios.itemindex));

  AlterarParametro(qryAux, 'SEPARADOR2CONTRACHEQUES', mmSeparador.text);
  AlterarParametro(qryAux, 'FLGENVIACONTRIBMANUTENCAO', IntToStr(rdgEnvioContribManut.ItemIndex));
  AlterarParametro(qryAux, 'FLGENVIACONTRIBCONCESSAO', IntToStr(rdgEnvioContribConc.ItemIndex));
  AlterarParametro(qryAux, 'MASCARAMATRICULA', mkeMascara.text);

  If cboxEstruturaCalculo.Checked then
    AlterarParametro(qryAux, 'FLGUSAMARGEM3070', '1')
  else
    AlterarParametro(qryAux, 'FLGUSAMARGEM3070', '0');

  If cbxApaga.Checked then
    AlterarParametro(qryAux, 'FLGAPAGAPREVIA', '1')
  else
    AlterarParametro(qryAux, 'FLGAPAGAPREVIA', '0');

  If rdgUsaCPMF.itemindex = 0 then
  begin
    cmbccusto2.Text := '';
    dblPrograma.Text := '';
    AlterarParametro(qryAux, 'FLGCAPCONTROLACPMF','0');
    dblPrograma.Enabled  := false;
    cmbccusto2.Enabled   := false;
  end
  else
  begin
    AlterarParametro(qryAux, 'FLGCAPCONTROLACPMF','1');
    dblPrograma.Enabled  := true;
    cmbccusto2.Enabled   := true;
  end;

  If  cbxVerifica.checked then
    AlterarParametro(qryAux, 'FLGVERIFICAPARM','1')
  else
    AlterarParametro(qryAux, 'FLGVERIFICAPARM','0');

  If cbxIntegraCont.checked then
    AlterarParametro(qryAux, 'FLGINTEGRACONTABIL','1')
  else
    AlterarParametro(qryAux, 'FLGINTEGRACONTABIL','0');

  If cbxIntegraFinanc.checked then
    AlterarParametro(qryAux, 'FLGINTEGRAFINANC','1')
  else
    AlterarParametro(qryAux, 'FLGINTEGRAFINANC','0');

  //FLGNUMDEPIRNUMDEPSALFAM
  If ChkNumDepIR.Checked then
    AlterarParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM','1')
  else
    AlterarParametro(qryAux, 'FLGNUMDEPIRNUMDEPSALFAM','0');

  //FLGESTADORUB
  If ChkFlgEstadoRub.Checked then
    AlterarParametro(qryAux, 'FLGESTADORUB','1')
  else
    AlterarParametro(qryAux, 'FLGESTADORUB','0');

  //FLGUSAREGRAXRUB
  If ChkUsaRegraxRub.Checked then
    AlterarParametro(qryAux, 'FLGUSAREGRAXRUB','1')
  else
    AlterarParametro(qryAux, 'FLGUSAREGRAXRUB','0');

  If cbxUsaCodRubExtInt.Checked then
    AlterarParametro(qryAux, 'FLGUSACODRUBEXT','1')
  else
    AlterarParametro(qryAux, 'FLGUSACODRUBEXT','0');

  //FLGAGRUPARUBRICA
  If ChkAgrupaRubrica.Checked Then
    AlterarParametro(qryAux, 'FLGAGRUPARUBRICA','1')
  else
    AlterarParametro(qryAux, 'FLGAGRUPARUBRICA','0');

  //FLGMENSERROVALREGRA
  If chkMensErroValorRegra.Checked Then
    AlterarParametro(qryAux, 'FLGMENSERROVALREGRA','1')
  else
    AlterarParametro(qryAux, 'FLGMENSERROVALREGRA','0');

  //FLGREAJUSTACANCELADO
  If chkReajustaCancelado.Checked Then
    AlterarParametro(qryAux, 'FLGREAJUSTACANCELADO','1')
  else
    AlterarParametro(qryAux, 'FLGREAJUSTACANCELADO','0');

  //FLGPREPARABENEFDESATIVADO
  If chkPreparaBenefDesativado.Checked Then
    AlterarParametro(qryAux, 'FLGPREPARABENEFDESATIVADO','1')
  else
    AlterarParametro(qryAux, 'FLGPREPARABENEFDESATIVADO','0');

  //FLGCANCELAFILHO
  If chkCancelaFilho.Checked Then
    AlterarParametro(qryAux, 'FLGCANCELAFILHO','1')
  else
    AlterarParametro(qryAux, 'FLGCANCELAFILHO','0');

  //FLGTRATALOTEINDEPENDENTE
  If chkTrataLoteIndependente.Checked Then
    AlterarParametro(qryAux, 'FLGTRATALOTEINDEPENDENTE','1')
  else
    AlterarParametro(qryAux, 'FLGTRATALOTEINDEPENDENTE','0');

  //FLGABRERUBACJUD
  If chkrubacjud.Checked Then
    AlterarParametro(qryAux, 'FLGABRERUBACJUD','1')
  else
    AlterarParametro(qryAux, 'FLGABRERUBACJUD','0');

  //FLGREAJUSTEEMLOTE
  If chkReajusteEmLote.Checked Then
    AlterarParametro(qryAux, 'FLGREAJUSTEEMLOTE','1')
  else
    AlterarParametro(qryAux, 'FLGREAJUSTEEMLOTE','0');

  //FLGCALCULAIRRESGATEISENTO
  If chkCalculaIrResgateIsento.Checked Then
    AlterarParametro(qryAux, 'FLGCALCULAIRRESGATEISENTO','1')
  else
    AlterarParametro(qryAux, 'FLGCALCULAIRRESGATEISENTO','0');

  //FLGRECALCULABENEFCOTAS
  If chkRecalculaBenefCotas.Checked Then
    AlterarParametro(qryAux, 'FLGRECALCULABENEFCOTAS','1')
  else
    AlterarParametro(qryAux, 'FLGRECALCULABENEFCOTAS','0');

  //FLGCALCULADIFBENEFCOTAS
  If chkCalculaDifBenefCotas.Checked Then
    AlterarParametro(qryAux, 'FLGCALCULADIFBENEFCOTAS','1')
  else
    AlterarParametro(qryAux, 'FLGCALCULADIFBENEFCOTAS','0');

  //DEDUCAOBASEIR0561
  If dbrValorDeduzBase.Value >= 0  Then
    AlterarParametro(qryAux, 'DEDUCAOBASEIR0561', FloatToStr(dbrValorDeduzBase.Value));

  //VLRMAXLIMITEFOLHAEXTRA
  If dbrMaxLimitePgto.Value >= 0  Then
    AlterarParametro(qryAux, 'VLRMAXLIMITEFOLHAEXTRA', FloatToStr(dbrMaxLimitePgto.Value));

  //FlgCalcPensAlimAntPrevia
  If chkCalcPensAlimAntPrevia.Checked Then
    AlterarParametro(qryAux, 'FLGCALCPENSALIMANTPREVIA','1')
  else
    AlterarParametro(qryAux, 'FLGCALCPENSALIMANTPREVIA','0');

  //CALCSALVIRTTODOMES
  If chkCalcSalVirtMensalmente.Checked Then
    AlterarParametro(qryAux, 'CALCSALVIRTTODOMES','1')
  else
    AlterarParametro(qryAux, 'CALCSALVIRTTODOMES','0');

  //FLGCONFIRMANOFINAL
  If chkConfirmaNoFinal.Checked Then
    AlterarParametro(qryAux, 'FLGCONFIRMANOFINAL','1')
  else
    AlterarParametro(qryAux, 'FLGCONFIRMANOFINAL','0');

  //MANTEMMESREFCONSTANTERB
  If cboxMesRefRIndiv.Checked Then
    AlterarParametro(qryAux, 'MANTEMMESREFCONSTANTERB','1')
  else
    AlterarParametro(qryAux, 'MANTEMMESREFCONSTANTERB','0');

  If cboxRecebedorDuplicado.Checked Then
    AlterarParametro(qryAux, 'VERIFICARECEBEDORDUPLICADO','1')
  else
    AlterarParametro(qryAux, 'VERIFICARECEBEDORDUPLICADO','0');

  if (dblkContaDebito.Text <> '') then
    AlterarParametro(qryAux, 'PLACONTAD',dblkContaDebito.Text)
  else
    AlterarParametro(qryAux, 'PLACONTAD','');

  if (dblkContaCredito.Text <> '') then
    AlterarParametro(qryAux, 'PLACONTAC',dblkContaCredito.Text)
  else
    AlterarParametro(qryAux, 'PLACONTAC','');

  // LOOKUPS QUE TRABALHAM COM A PROVDESC - INICIO
  if (cmbVlr_CPMF_PA_INSS.Text <> '') then
  begin
    if qryProventos.locate('descricao', cmbVlr_CPMF_PA_INSS.Text, []) then
      AlterarParametro(qryAux, 'IDRUBCPMFPAINSS', 
        IntToStr(qryProventos.fieldbyname('idprovento').asInteger))
    else
      AlterarParametro(qryAux, 'IDRUBCPMFPAINSS','');
  end
  else
    AlterarParametro(qryAux, 'IDRUBCPMFPAINSS','');

  if (cmbIRRFINSSAbono.Text <> '') then
  begin
    AlterarParametro(qryAux, 'IDRUBIRRFINSSABONO', IntToStr(cmbIRRFINSSAbono.tag))
  end
  else
    AlterarParametro(qryAux, 'IDRUBIRRFINSSABONO','');

  if (cmbRubricaIRRFResgateTribRegressiva.Text <> '') then
    AlterarParametro(qryAux, 'IDRUBIRRFRESERVATRIBREGRESSIVA', IntToStr(cmbRubricaIRRFResgateTribRegressiva.tag))
  else
    AlterarParametro(qryAux, 'IDRUBIRRFRESERVATRIBREGRESSIVA','');

  if (cmbRubricaIRRFVitalicioTribRegressiva.Text <> '') then
    AlterarParametro(qryAux, 'IDRUBIRRFVITALICIOREGR', IntToStr(cmbRubricaIRRFVitalicioTribRegressiva.tag))
  else
    AlterarParametro(qryAux, 'IDRUBIRRFVITALICIOREGR','');

  if (cmbRubricaIRRFAbonoTribRegressiva.Text <> '') then
    AlterarParametro(qryAux, 'IDRUBIRRFABONOREGR', IntToStr(cmbRubricaIRRFAbonoTribRegressiva.tag))
  else
    AlterarParametro(qryAux, 'IDRUBIRRFABONOREGR','');

  if (cmbVlr_CPMF_PA_INSS_DESC.Text <> '') then
  begin
    if qryDescontos.locate('descricao', cmbVlr_CPMF_PA_INSS_DESC.Text, []) then
      AlterarParametro(qryAux, 'IDRUBCPMFPAINSSDESC', //IntToStr(cmbVlr_CPMF_PA_INSS_DESC.tag))
        IntToStr(qryDescontos.fieldbyname('idprovento').asInteger))
    else
      AlterarParametro(qryAux, 'IDRUBCPMFPAINSSDESC','');
  end
  else
    AlterarParametro(qryAux, 'IDRUBCPMFPAINSSDESC','');

  if (dblcSalFam.Text <> '') then
  begin
      AlterarParametro(qryAux, 'IDRUBCREDSALFAM',
        IntToStr(dblcSalFam.tag))
  end
  else
    AlterarParametro(qryAux, 'IDRUBCREDSALFAM','');

  // LOOKUPS QUE TRABALHAM COM A PROVDESC - FIM

  if (dblcRegraSalFam.Text <> '') then
    AlterarParametro(qryAux, 'REGRASALFAM', IntToStr(dblcRegraSalFam.tag))
  else
    AlterarParametro(qryAux, 'REGRASALFAM', '');

  if (cmbccusto2.Text <> '') then
    AlterarParametro(qryAux, 'CODCCUSTOFINAN',dtmIntegracao.qrycCusto.fieldbyname('CODCENTROCUSTO').asString)
  else
    AlterarParametro(qryAux, 'CODCCUSTOFINAN','');

  if (dblPrograma.Text <> '') then
    AlterarParametro(qryAux, 'IDPROGRAMAFOLHA',IntToStr(qryPrograma.fieldbyname('IDPROGRAMA').asInteger))
  else
    AlterarParametro(qryAux, 'IDPROGRAMAFOLHA','');

  //IDRUBCONSIGCREDABONO
  If (cmbRubConsigCredAbono.Text <> '') Then
    AlterarParametro(qryAux, 'IDRUBCONSIGCREDABONO',IntToStr(qryRubConsigCredAbono.fieldbyname('IDPROVENTO').asInteger))
  Else
    AlterarParametro(qryAux, 'IDRUBCONSIGCREDABONO','');

  //IDRUBCONSIGDESCABONO
  If (cmbRubConsigDescAbono.Text <> '') Then
    AlterarParametro(qryAux, 'IDRUBCONSIGDESCABONO',IntToStr(qryRubConsigDescAbono.fieldbyname('IDPROVENTO').asInteger))
  Else
    AlterarParametro(qryAux, 'IDRUBCONSIGDESCABONO','');

  //IDRUBDEDIDADEABONO
  If (cmbRubDescDepIRAbono.Text <> '') Then
    AlterarParametro(qryAux, 'IDRUBDEDIDADEABONO',IntToStr(qryRubDescIdadeIRAbono.fieldbyname('IDPROVENTO').asInteger))
  Else
    AlterarParametro(qryAux, 'IDRUBDEDIDADEABONO','');

  //IDRUBDEDDEPABONO
  If (cmbRubDescDepIRAbono.Text <> '') Then
    AlterarParametro(qryAux, 'IDRUBDEDDEPABONO',IntToStr(qryRubDescDepIRAbono.fieldbyname('IDPROVENTO').asInteger))
  Else
    AlterarParametro(qryAux, 'IDRUBDEDDEPABONO','');

  //IDGRUPOREGRAFOLHA
  If (dblkGrupoRegra.Text <> '') Then
    AlterarParametro(qryAux, 'IDGRUPOREGRAFOLHA',IntToStr(qryGrupoRegra.fieldbyname('IDGRUPOREGRA').asInteger))
  Else
    AlterarParametro(qryAux, 'IDGRUPOREGRAFOLHA','');

    //Fanuel Marinho SITUACAOHABILITACAOINSS  SOL163044
  If (dbcbIRRFRRA.Text <> '') Then
    AlterarParametro(qryAux, 'SITUACAOHABILITACAOINSS',IntToStr(qryIRRFRRA.fieldbyname('IDSITHABILITACAO').asInteger))
  Else
    AlterarParametro(qryAux, 'SITUACAOHABILITACAOINSS','');

  //TIPDOCCONVP
  If (dblkTipoDocPagtoConv.Text <> '') Then
    AlterarParametro(qryAux, 'TIPDOCCONVP', IntToStr(qryTipoDocConvP.FieldByName('CODTIPDOC').AsInteger))
  Else
    AlterarParametro(qryAux, 'TIPDOCCONVP','');

  //TIPDOCCONVR
  If (dblkTipoDocConvR.Text <> '') Then
    AlterarParametro(qryAux, 'TIPDOCCONVR', IntToStr(qryTipoDocConvR.FieldByName('CODTIPDOC').AsInteger))
  Else
    AlterarParametro(qryAux, 'TIPDOCCONVR','');

  with dtmIntegracao do
  begin
    //Renato Visoni Sol 99360 \ Kintana 435729
    If (dblcCentroResponPadrao.Text <> '') then begin
      AlterarParametro(qryAux, 'CODCENTRORESPON',qryCentRespon.FieldByName('CODCENTRORESPON').AsString)
    end else begin
      AlterarParametro(qryAux, 'CODCENTRORESPON','');
    end;
    //Fim

    If (dblkpcmbPortForma.Text <> '') then
      AlterarParametro(qryAux, 'CODPORTFORMA',qryFormaPag.FieldByName('CodPortForma').AsString)
    else
      AlterarParametro(qryAux, 'CODPORTFORMA','');

    if qryCodRecDes.FieldByName('CODTIPRECDES').AsString <> '' then
      AlterarParametro(qryAux, 'CODTIPRECDES',qryCodRecDes.FieldByName('CODTIPRECDES').AsString)
    else
      AlterarParametro(qryAux, 'CODTIPRECDES','');

    if qryCodRecDesFav.FieldByName('CODTIPRECDES').AsString <> '' then
      AlterarParametro(qryAux, 'CODTIPRECDESFAV',qryCodRecDesfav.FieldByName('CODTIPRECDES').AsString)
    else
      AlterarParametro(qryAux, 'CODTIPRECDES','');

    if (lkcmbDescAtividade.Text <> '') then
      AlterarParametro(qryAux, 'UNIDNEGOC',qryAtividade.FieldByName('UnidNegoc').AsString)
    else
      AlterarParametro(qryAux, 'UNIDNEGOC','');

    if (dblkSubConta.Text <> '') then
      AlterarParametro(qryAux, 'SUBCONTA',qrySubConta.FieldByName('CODSUBCONTA').AsString)
    else
      AlterarParametro(qryAux, 'SUBCONTA','');
  end;

  //PARAMETRO PARA CONTROLAR SE BASE DE CALCULO PODE FICAR NEGATIVA
  If cboxNegativaBase.Checked then
    AlterarParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA','1')
  else
    AlterarParametro(qryAux, 'FLGZERABASENEGATIVAPREVIA','0');

  If cboxControleTipoRegra.Checked then
    AlterarParametro(qryAux, 'FLGCONTROLETIPOREGRA','1')
  else
    AlterarParametro(qryAux, 'FLGCONTROLETIPOREGRA','0');

  If cboxAcessoTipoRegra.Checked then
    AlterarParametro(qryAux, 'FLGACESSOTIPOREGRA','1')
  else
    AlterarParametro(qryAux, 'FLGACESSOTIPOREGRA','0');

  If (dblcTipoRegraPadrao.Text <> '') Then
    AlterarParametro(qryAux, 'TIPOREGRAPADRAO', IntToStr(qryTipoRegra.fieldbyname('IDTIPOREGRA').asInteger))
  Else
    AlterarParametro(qryAux, 'TIPOREGRAPADRAO','');

  If cboxPgtoFavOutros.Checked then
    AlterarParametro(qryAux, 'FLGEFETUAPAGTOFAVOUTROS','1')
  else
    AlterarParametro(qryAux, 'FLGEFETUAPAGTOFAVOUTROS','0');

  AlterarParametro(qryAux, 'FLGUSABASEMENSALIRRF',
    inttostr(byte(cboxFlgBaseMensalIRRF.checked)));
  if cboxFlgBaseMensalIRRF.checked then
  begin
      AlterarParametro(qryAux, 'IDRUBBASEMENSALIRRF',
        inttostr(dblcIdRubBaseMensalIRRF.tag));

      AlterarParametro(qryAux, 'IDRUBVALORMENSALIRRF',
        inttostr(dblcIdRubValorMensalIRRF.tag));
  end
  else
  begin
    AlterarParametro(qryAux, 'IDRUBBASEMENSALIRRF', '');
    AlterarParametro(qryAux, 'IDRUBVALORMENSALIRRF', '');
  end;

  If cboxCorrigeReservaMes.Checked then
    AlterarParametro(qryAux, 'FLGCORRIGERESERVAMES', '1')
  else
    AlterarParametro(qryAux, 'FLGCORRIGERESERVAMES', '0');

  If cboxNaoRecalculaIRPagPendente.checked Then
    AlterarParametro(qryAux, 'FLGNAORECALCIRPAGPENDENTE', '1')
  else
    AlterarParametro(qryAux, 'FLGNAORECALCIRPAGPENDENTE', '0');

  If cboxAbreDocAlt.checked Then
    AlterarParametro(qryAux, 'FLGABREDOCALT', '1')
  else
    AlterarParametro(qryAux, 'FLGABREDOCALT', '0');

  If cboxAgrupaArqDocAlt.checked Then
    AlterarParametro(qryAux, 'FLGAGRUPAARQDOCALT', '1')
  else
    AlterarParametro(qryAux, 'FLGAGRUPAARQDOCALT', '0');

  If cboxInibeMsgDetalhada.checked Then
    AlterarParametro(qryAux, 'FLGINIBEMSGDETPREPARO', '1')
  else
    AlterarParametro(qryAux, 'FLGINIBEMSGDETPREPARO', '0');

  If redBrutoINSSCPMF.Value >= 0  Then
    AlterarParametro(qryAux, 'LIMITEBRUTOINSSXCPMF',
      FloatToStr(redBrutoINSSCPMF.Value));

  if cboxMatriculaCompleta.Checked then
    AlterarParametro(qryAux, 'FLGUSAMATRICULACOMPLETA', '1')
  else
    AlterarParametro(qryAux, 'FLGUSAMATRICULACOMPLETA', '0');
  
  if cboxMatriculaDependente.Checked then
    AlterarParametro(qryAux, 'FLGUSAMATRICULADEPENDENTE', '1')
  else
    AlterarParametro(qryAux, 'FLGUSAMATRICULADEPENDENTE', '0');
  
  if cboxBuscaAdiantamentoPA.Checked then
    AlterarParametro(qryAux, 'FLGBUSCAADIANTAMENTOPA', '1')
  else
    AlterarParametro(qryAux, 'FLGBUSCAADIANTAMENTOPA', '0');
  
  if cboxAbateTodasReservasRegra.Checked then
    AlterarParametro(qryAux, 'FLGABATETODASRESERVASREGRA', '1')
  else
    AlterarParametro(qryAux, 'FLGABATETODASRESERVASREGRA', '0');
  
  if cboxBuscaAbonoAnteriorPago.Checked then
    AlterarParametro(qryAux, 'FLGBUSCAABONOANTERIORPAGO', '1')
  else
    AlterarParametro(qryAux, 'FLGBUSCAABONOANTERIORPAGO', '0');
  
  if cboxGeraAlteradoresCAPConvenio.Checked then
    AlterarParametro(qryAux, 'FLGGERAALTERADORESCAPCONVENIO', '1')
  else
    AlterarParametro(qryAux, 'FLGGERAALTERADORESCAPCONVENIO', '0');

  i:=cbboxTipoMargemDesconto.itemindex;
  if i < 0 then
    i:=0;
  AlterarParametro(qryAux, 'TIPOMARGEMDESCONTO', inttostr(i));

  If dbredValorMargemdesconto.Value >= 0  Then
    AlterarParametro(qryAux, 'VLRMARGEMDESCONTO', FloatToStr(dbredValorMargemdesconto.Value));

  if cboxEfetuaProvisaoAbono.Checked then
    AlterarParametro(qryAux, 'FLGUSAPROVISAOABONO', '1')
  else
    AlterarParametro(qryAux, 'FLGUSAPROVISAOABONO', '0');
  
  if cboxForcaDataRIndiv.Checked then
    AlterarParametro(qryAux, 'FLGFORCADATAFINALRUBINDIV', '1')
  else
    AlterarParametro(qryAux, 'FLGFORCADATAFINALRUBINDIV', '0');
  
  i:=cbboxTipoParcela.itemindex;
  if i < 0 then
    i:=0;
  AlterarParametro(qryAux, 'FORMAPARCELAPREVIA', inttostr(i));
  
  i:=cboxPreparoRetidoAbono.ItemIndex;
  if i < 0 then
    i:=0;
  AlterarParametro(qryAux, 'PREPARORETIDOABONO', inttostr(i));
  
  i:=cboxPreparoRetidoMensal.ItemIndex;
  if i < 0 then
    i:=0;
  AlterarParametro(qryAux, 'PREPARORETIDOMENSAL', inttostr(i));
  
  i:=cbboxRateioPlanoRubrica.itemindex;
  if i < 0 then
    i:=0;
  AlterarParametro(qryAux, 'RATEIOPLANORUBRICA', inttostr(i));
  
  i:=cboxDesativacaoAutomaticaRubricaIndiv.itemindex;
  if i < 0 then
    i:=0;
  AlterarParametro(qryAux, 'DESATIVACAOAUTOMATICARUBRICAINDIV', inttostr(i));

  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início - comentado
  // Aline Freire Sol 155182 Kintana 1228739
  {if trim(cboRRA.Text) <> '' then
  begin
    if cdsRRA.RecordCount > 0 then
      AlterarParametro(qryAux, 'RUBRICAIRRFRRA', cdsLkpProvDescIDPROVENTO.asstring)
    else
      InserirParametro(qryAux, 'RUBRICAIRRFRRA','N',cdsLkpProvDescIDPROVENTO.asstring);
  end
  else
  begin
    MessageDlg('É necessário selecionar a Rubrica de IRRF - RRA!',mtCustom,[mbok],0);
    Exit;
  end;}
  // Aline Freire Sol 155182 Kintana 1228739
  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim - comentado

  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - início

  AlterarParametro(qryAux, 'RUBRICAIRRFRRA', qryLkpRRAINSS.FieldByName('IDPROVENTO').AsString);
  AlterarParametro(qryAux, 'RUBRICAIRRFRRAFUND', qryLkpRRAFund.FieldByName('IDPROVENTO').AsString);

  // Felipe A. Santos - SOL 258357/17801 PPM 1083052 - fim

  // Andre Imakawa - SIG71773 - Inicio
  AlterarParametro(qryAux, 'RUBRICAIRTOTALCOMP', qryLkpIRComp.FieldByName('IDPROVENTO').AsString);
  AlterarParametro(qryAux, 'RUBRICAIRTOTALCOMPAB', qryLkpIRCompAB.FieldByName('IDPROVENTO').AsString);
  // Andre Imakawa - SIG71773 - Fim

  // Andre Imakawa - SIG92016 - Inicio
  AlterarParametro(qryAux, 'RUBRICAIRINFOACAO', qryLkpIRInfo.FieldByName('IDPROVENTO').AsString);
  AlterarParametro(qryAux, 'RUBRICAIRINFOACAOAB', qryLkpIRInfoAb.FieldByName('IDPROVENTO').AsString);
  AlterarParametro(qryAux, 'REGRACAOJUDGANHA', qryLkpRegraIrAcao.FieldByName('IDREGRA').AsString);
  // Andre Imakawa - SIG92016 - Fim

  //edilaine SIG136670 : inicio
  AlterarParametro(qryAux, 'RUBRICAIRDESCSIMPLES',   qryLkpIRSimples.FieldByName('IDPROVENTO').AsString);
  AlterarParametro(qryAux, 'RUBRICAIRDESCSIMPLESAB', qryLkpIRSimplesAB.FieldByName('IDPROVENTO').AsString);

  AlterarParametro(qryAux, 'RUBIRDESCSIMPLESINSS',   qryLkpIRSimplesInss.FieldByName('IDPROVENTO').AsString);
  AlterarParametro(qryAux, 'RUBIRDESCSIMPLESINSSAB', qryLkpIRSimplesInssAB.FieldByName('IDPROVENTO').AsString);

  If dbrDeducaoDescSimples.Value >= 0  Then
    AlterarParametro(qryAux, 'DEDUCAODESCSIMPLES', OraNumero(FloatToStr(dbrDeducaoDescSimples.Value)));

  If dbFlgDescSimples.Checked then
    AlterarParametro(qryAux, 'FLGDESCSIMPLESIRRF', '1')
  else
    AlterarParametro(qryAux, 'FLGDESCSIMPLESIRRF', '0');

  if dbFlgDescSimplesIdade.Checked then
    AlterarParametro(qryAux, 'FLGDESCSIMPLESIDADE', '1')
  else
    AlterarParametro(qryAux, 'FLGDESCSIMPLESIDADE', '0');

  if dbFlgDescSimplesDepend.Checked then
    AlterarParametro(qryAux, 'FLGDESCSIMPLESDEPEND', '1')
  else
    AlterarParametro(qryAux, 'FLGDESCSIMPLESDEPEND', '0');
  //edilaine SIG136670 : fim

  //edilaine WO29808 : inicio
  If dbFlgNovoIRExt.Checked then
    AlterarParametro(qryAux, 'FLGNOVOIREXTERIOR', '1')
  else
    AlterarParametro(qryAux, 'FLGNOVOIREXTERIOR', '0');
  //edilaine WO29808 : fim

  CarregaParametros(qryAux);
  bbtnConfirmar.enabled := false;
  bbtnCancelar.enabled  := false;
end;

procedure TFrmParametroFolha.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  qry.Cancel;
  qry.Close;
end;

procedure TFrmParametroFolha.rdgUsaCPMFClick(Sender: TObject);
begin
  inherited;
  If rdgUsaCpmf.ItemIndex = 0 then
  begin
    dblPrograma.Enabled := false;
    cmbccusto2.enabled   := false;
    dblPrograma.text    := '';
    cmbccusto2.text     := '';
  end
  else
  begin
    dblPrograma.Enabled := true;
    cmbccusto2.enabled   := true;
  end;
end;

procedure TFrmParametroFolha.actSalfamExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageindex := 17;
end;

procedure TFrmParametroFolha.actImportacaoExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageindex := 18;
end;

procedure TFrmParametroFolha.actConveniosExecute(Sender: TObject);
begin
  inherited;
  ntbPai.pageIndex := 19;
end;

procedure TFrmParametroFolha.qryBeforePost(DataSet: TDataSet);
begin
  inherited;
  qry.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
end;

procedure TFrmParametroFolha.dblkGrupoRegraChange(Sender: TObject);
begin
  inherited;
  dblcTipoRegraPadrao.text:='';
  if dblkGrupoRegra.text = '' then
  begin
    cboxAcessoTipoRegra.checked:=false;
    cboxAcessoTipoRegra.enabled:=false;
    cboxControleTipoRegra.checked:=false;
    cboxControleTipoRegra.enabled:=false;
    dblcTipoRegraPadrao.enabled:=false;
  end
  else
  begin
    cboxAcessoTipoRegra.enabled:=true;
    cboxControleTipoRegra.enabled:=true;
    dblcTipoRegraPadrao.enabled:=true;
  end;
end;

procedure TFrmParametroFolha.AbreQueryTipoRegra;
begin
  qryTipoRegra.Close;
  if dblkGrupoRegra.text <> '' then
  begin
    qryTipoRegra.parambyname('IDGRUPOREGRA').asinteger:=
      qryGrupoRegra.fieldbyname('IDGRUPOREGRA').asinteger;
    qryTipoRegra.open;
  end;
end;

procedure TFrmParametroFolha.dblkGrupoRegraExit(Sender: TObject);
begin
  inherited;
  AbreQueryTipoRegra;
end;

procedure TFrmParametroFolha.btnProcessopreviaClick(Sender: TObject);
 var fclist: tfcOutlookList;
     fcitem: tfcoutlooklistitem;
     act: taction;
     s:string;
begin
  inherited;
  if sender = btnProcessoPreparo then
    fclist:=fcOutlookListPreparo;
  if sender = btnProcessoPrevia then
    fclist:=fcOutlookListPrevia;
  if sender = btnProcessoEfetivacao then
    fclist:=fcOutlookListEfetivacao;
  if sender = btnConvenios then
    fclist:=fcOutlookListConvenios;
  fcitem:=(fclist.selected as tfcoutlooklistitem);
  if (fcitem = nil) then
    fcitem:=(fclist.items[0] as tfcoutlooklistitem);
  if (fcitem <> nil) then
  begin
    act:=(fcitem.action as taction);
    s:=act.caption;
    if (act <> nil) then
      act.execute;
  end
  else
  begin
    act:=(fclist.action as taction);
    if (act <> nil) then
      act.execute;
  end;
end;

procedure TFrmParametroFolha.cboxAbreDocAltClick(Sender: TObject);
begin
  inherited;
  if not cboxAbreDocAlt.checked then
    cboxAgrupaArqDocAlt.checked:=false;
  cboxAgrupaArqDocAlt.enabled:=cboxAbreDocAlt.checked;
end;

function TFrmParametroFolha.ValidaRubricaIR: Boolean;
begin
  Result := False;

     {Teste se tem algum lookup com valor igual ao cmbIRRF}
  if (( cmbIRRF.Text                               <> ''                                        )   And
     (( cmbIRRF.Tag                                 = cmbIRRF_INSS.Tag                          )   or
      ( cmbIRRF.Tag                                 = cmbIRRFAbono.Tag                          )   or
      ( cmbIRRF.Tag                                 = cmbIRRFINSSAbono.Tag                      )   or
      ( cmbIRRF.Tag                                 = cmbIRResgReserva.Tag                      )   or
      ( cmbIRRF.Tag                                 = cmbRubricaIRRFVitalicioTribRegressiva.Tag )   or
      ( cmbIRRF.Tag                                 = cmbRubricaIRRFAbonoTribRegressiva.Tag     )   or
      ( cmbIRRF.Tag                                 = cmbRubricaIRRFResgateTribRegressiva.Tag   ))) or

     {Teste se tem algum lookup com valor igual ao cmbIRRF_INSS}
     (( cmbIRRF_INSS.Text                          <> ''                                        )   And
     (( cmbIRRF_INSS.Tag                            = cmbIRRFAbono.Tag                          )   or
      ( cmbIRRF_INSS.Tag                            = cmbIRRFINSSAbono.Tag                      )   or
      ( cmbIRRF_INSS.Tag                            = cmbIRResgReserva.Tag                      )   or
      ( cmbIRRF_INSS.Tag                            = cmbRubricaIRRFVitalicioTribRegressiva.Tag )   or
      ( cmbIRRF_INSS.Tag                            = cmbRubricaIRRFAbonoTribRegressiva.Tag     )   or
      ( cmbIRRF_INSS.Tag                            = cmbRubricaIRRFResgateTribRegressiva.Tag   ))) or

     {Teste se tem algum lookup com valor igual ao cmbIRRFAbono}
     (( cmbIRRFAbono.Text                          <> ''                                        )   And
     (( cmbIRRFAbono.Tag                            = cmbIRRFINSSAbono.Tag                      )   or
      ( cmbIRRFAbono.Tag                            = cmbIRResgReserva.Tag                      )   or
      ( cmbIRRFAbono.Tag                            = cmbRubricaIRRFVitalicioTribRegressiva.Tag )   or
      ( cmbIRRFAbono.Tag                            = cmbRubricaIRRFAbonoTribRegressiva.Tag     )   or
      ( cmbIRRFAbono.Tag                            = cmbRubricaIRRFResgateTribRegressiva.Tag   ))) or

     {Teste se tem algum lookup com valor igual ao cmbIRRFINSSAbono}
     (( cmbIRRFINSSAbono.Text                      <> ''                                        )   And
     (( cmbIRRFINSSAbono.Tag                        = cmbIRResgReserva.Tag                      )   or
      ( cmbIRRFINSSAbono.Tag                        = cmbRubricaIRRFVitalicioTribRegressiva.Tag )   or
      ( cmbIRRFINSSAbono.Tag                        = cmbRubricaIRRFAbonoTribRegressiva.Tag     )   or
      ( cmbIRRFINSSAbono.Tag                        = cmbRubricaIRRFResgateTribRegressiva.Tag   ))) or

     {Teste se tem algum lookup com valor igual ao cmbIRResgReserva}
     (( cmbIRResgReserva.Text                      <> ''                                        )   And
     (( cmbIRResgReserva.Tag                        = cmbRubricaIRRFVitalicioTribRegressiva.Tag )   or
      ( cmbIRResgReserva.Tag                        = cmbRubricaIRRFAbonoTribRegressiva.Tag     )   or
      ( cmbIRResgReserva.Tag                        = cmbRubricaIRRFResgateTribRegressiva.Tag   ))) or

     {Teste se tem algum lookup com valor igual ao cmbRubricaIRRFVitalicioTribRegressiva}
     (( cmbRubricaIRRFVitalicioTribRegressiva.Text <> ''                                        )   And
     (( cmbRubricaIRRFVitalicioTribRegressiva.Tag   = cmbRubricaIRRFAbonoTribRegressiva.Tag     )   or
      ( cmbRubricaIRRFVitalicioTribRegressiva.Tag   = cmbRubricaIRRFResgateTribRegressiva.Tag   ))) or

     {Teste se tem algum lookup com valor igual ao cmbRubricaIRRFAbonoTribRegressiva}
     (( cmbRubricaIRRFAbonoTribRegressiva.Text     <> ''                                        )   And
      ( cmbRubricaIRRFAbonoTribRegressiva.Tag       = cmbRubricaIRRFResgateTribRegressiva.Tag   ))  Then
  begin
    Result := True;
  end;
end;

function TFrmParametroFolha.ValidaRubricaDeducao: Boolean;
begin
  Result := False;

     {Teste se tem algum lookup com valor igual ao cmbRubDescDepIR}
  if (( cmbRubDescDepIR.Text        <> ''                           )   And
     (( cmbRubDescDepIR.Tag          = cmbRubDescIdadeIR.Tag        )   or
      ( cmbRubDescDepIR.Tag          = cmbRubDescDepIRAbono.Tag     )   or
      ( cmbRubDescDepIR.Tag          = cmbRubDescIdadeIRAbono.Tag   )   or
      ( cmbRubDescDepIR.Tag          = cmbRubDescDepIRResgate.Tag   )   or
      ( cmbRubDescDepIR.Tag          = cmbRubDescIdadeIRResgate.Tag ))) or

     {Teste se tem algum lookup com valor igual ao cmbRubDescIdadeIR}
     (( cmbRubDescIdadeIR.Text      <> ''                           )   And
     (( cmbRubDescIdadeIR.Tag        = cmbRubDescDepIRAbono.Tag     )   or
      ( cmbRubDescIdadeIR.Tag        = cmbRubDescIdadeIRAbono.Tag   )   or
      ( cmbRubDescIdadeIR.Tag        = cmbRubDescDepIRResgate.Tag   )   or
      ( cmbRubDescIdadeIR.Tag        = cmbRubDescIdadeIRResgate.Tag ))) or

     {Teste se tem algum lookup com valor igual ao cmbRubDescDepIRAbono}
     (( cmbRubDescDepIRAbono.Text   <> ''                           )   And
     (( cmbRubDescDepIRAbono.Tag     = cmbRubDescIdadeIRAbono.Tag   )   or
      ( cmbRubDescDepIRAbono.Tag     = cmbRubDescDepIRResgate.Tag   )   or
      ( cmbRubDescDepIRAbono.Tag     = cmbRubDescIdadeIRResgate.Tag ))) or

     {Teste se tem algum lookup com valor igual ao cmbRubDescIdadeIRAbono}
     (( cmbRubDescIdadeIRAbono.Text <> ''                           )   And
     (( cmbRubDescIdadeIRAbono.Tag   = cmbRubDescDepIRResgate.Tag   )   or
      ( cmbRubDescIdadeIRAbono.Tag   = cmbRubDescIdadeIRResgate.Tag ))) or

     {Teste se tem algum lookup com valor igual ao cmbRubDescDepIRResgate}
     (( cmbRubDescDepIRResgate.Text <> ''                           )   And
      ( cmbRubDescDepIRResgate.Tag   = cmbRubDescIdadeIRResgate.Tag ))  then
  begin
    Result := True;
  end;
end;

procedure TFrmParametroFolha.dbcbIRRFRRAChange(Sender: TObject);
begin
  inherited;
    dbcbIRRFRRA.Text := qryIRRFRRA.FieldbyName('DESCRICAO').AsString;


end;

procedure TFrmParametroFolha.cdsRRANewRecord(DataSet: TDataSet);
begin
  {if cdsRRA.RecordCount = 0 then
  begin
    cdsRRA.Append;
    cdsRRAIDFUNDACAO.AsInteger := 1;
    cdsRRANOMEPARAM.AsString   := 'RUBRICAIRRFRRA';
    cdsRRATIPOPARAM.AsString   := 'N';
  end
  else
    cdsRRA.edit;  }
end;

end.
{------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/04/2 002 A 18/04/2002                        |
| VERSÃO PARA LIBERAÇÃO: 3.02.12J                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do combobox cmbVlr_CPMF_PA_INSS para armazenar o valor do parametro|
|   relativo ao valor do CPMF da pensão alimenticia sobre o beneficio do inss. |
| - Criação do parametro IDRUBCPMFPAINSS, que vai armazenar                    |
|   o valor do CPMF da pensão alimenticia sobre o beneficio do inss.           |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 16/05/2002 A 16/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Eliminação do parametro referente a exclusão de rubricas de pensão         |
|   alimenticia apenas no mes de Janeiro.                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 17/05/2002 A 17/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12R                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente a rubrica de desconto de CPMF para Pensão   |
|   Alimenticia sobre o beneficio do INSS                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/06/2002 A 25/06/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente a cálculo automático de dependentes de IR   |
|   e de Salário Família.                                                      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2002 A 09/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente ao estado em que a rubrica se encontra.     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2002 A 10/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente ao grupo da regra da folha.                 |
| - Criação do parâmetro para saber se o sistema vai usar as rubricas associa_ |
| das ao grupo de regra da folha ou não.                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/07/2002 A 09/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente ao estado em que a rubrica se encontra.     |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/07/2002 A 18/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro referente a integração com a Contabilidade            |
| - Criação do parâmetro referernte a integração com o Financeiro              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro IDPROGRAMAFOLHA do contas a pagar .                   |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13i                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Criação do parametro FLGNUMLOTES que determina a quantidade de lotes que   |
|   podem estar abertos simultaneamente.                                       |
|------------------------------------------------------------------------------|
 DESENVOLVEDOR: FERNANDO JORGE                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 31/07/2002 A 31/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13k                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao dos novos parametros IDRUBCREDSALFAM, VALORSALFAM e TETOSALFAM.   |
| - Criação da Pasta de Salario Familia                                        |
| - Verificação da Checagem se a fundacao trabalha com codigo e descricao      |
|   externos da rubrica para os parametros gravados na tabela PARAMFOLHA.      |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/08/2002 A 06/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13L                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Inclusao do novo parametro MASCARAMATRICULA                                |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2002 A 07/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do novo parâmetro FlgAgrupaRubrica.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13o                                              |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Implementei os parametros relativos a margem de 30% e 70%                  |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/08/2002 A 26/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Alteração do caption do componente GroupBox36 de "Valor da CPMF" para    |
|   "Índice da CPMF"                                                           |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/11/2002 A 20/11/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusâo do Parâmetro FlgMensErroValRegra.                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 18/12/2002 A 18/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão de novos cinco parâmetros:                                      |
|       - Na página do preparo: FlgReajustaCancelado, PreparaBenefDesativado,  |
|       FlgCancelaFilho, FlgReajusteEmLote.                                    |
|                                                                              |
|       - Na página da prévia: FlgTrataLoteIndependente.                       |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/12/2002 A 20/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro FlgConfirmaNoFinal.                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/01/2003 A 10/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão dos parâmetros TipDocConvP e TipDocConvR.                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/01/2003 A 24/01/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro CalcSalVirtTodoMes. (Pendência 10794)              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/04/2003 A 11/04/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FUNCEF)                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Inclusão do parâmetro FlgCalcPensAlimAntPrevia.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/04/2003 A 24/04/2003                         |
| PENDÊNCIA: 13825                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Inclusão de componentes para entrada do Parâmetro para verificar o           |
| cadastramento de regras na Rubrica Individual e ação judicial verificando as |
| regras agrupadas no mesmo tipo de regra.                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/04/2003 A 24/04/2003                         |
| PENDÊNCIA: 13824                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Inclusão de componentes para entrada do parâmetro de tipo de regra padrão    |
| sobre o qual a verificação de cadastramento por tipo de regra não será       |
| realizada.                                                                   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 25/04/2003 A 25/04/2003                         |
| PENDÊNCIA: 13852                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Colocou-se parâmetros em desuso como invisíveis. Alteração no controle dos   |
| painéis ao selecionar as opções e na abertura da tela.                       |
| Parametros tornados invisiveis:                                              |
| - Recalculo beneficio na Fundacao se houver reajuste no INSS ou na Patro.    |
| - Usa folha de resgate em separado.                                          |
| - agrega calculo da suplementacao.                                           |
| - rubricas de correcao de beneficio e contribuicao.                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 06/05/2003 A 06/05/2003                         |
| PENDÊNCIA: 13822                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05                                               |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| Inclusão de componentes para entrada DO PARÂMETRO PARA CONTROLE DE PROCESSA- |
| MENTO DE PAGAMENTOS PARA FAVORECIDOS REGISTRADOS NA PASTA OUTRAS RUBRICAS DA |
| RUBRICA INDIVIDUAL.                                                          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/05/2003 A 26/05/2003                         |
| PENDÊNCIA: 13950                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.05e                                              |
| CLIENTE: FUNCEF                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - A INFORMAÇÃO PORTADOR FORMA DE PATROCINADORA SAIU DA TELA DE CADASTRO DO   |
| BANCOPORTFORMA PARA ESTA TELA DE PARÂMETROS.                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 15/07/2003                         |
| PENDÊNCIA: 14543                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04/08/2003 A 05/08/2003                         |
| PENDÊNCIA: 14554                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.05.00                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CRIAÇÃO DE PARÂMETROS PARA CONTROLAR A UTILIZAÇÃO NA PREVIA DA BASE DE IRRF|
| GERADA NO MÊS EM OUTRAS VERSÕES DA FOLHA NO MESMO MÊS PELA DATA DE PAGTO.    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 13/09/2004 A 13/09/2004                         |
| PENDÊNCIA: 17670                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13f                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - RETIRAR QUERYS DE ESTRUTURA. LOOKUPS DE MARGEM 30 E 70.                    |
| ALTERAÇÃO NO NOME DO CHECKBOX PARA CBOXESTRUTURACALCULO                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24/11/2004 A 24/11/2004                         |
| PENDÊNCIA: 18163                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13u                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Ajuste nas guias de Processo de Preparo.                                   |
| INCORPOREI OS COMPONENTES DA PAGINA BENEFICIOS PARA A PAGINA PREPARO.        |
| RENOMEI A DESCRICAO DO OUTLOOKLIST DE PREPARO PARA BENEFICIOS, E EXCLUIR     |
| O ITEM ANTIGO DE BENEFICIOS.                                                 |
|                                                                              |
|------------------------------------------------------------------------------}






