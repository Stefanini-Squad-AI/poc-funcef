//******************************************************************************
//Data	      : 07/10/2011
//Responsável : Otacilio Aquino
//Kintana     : 1445208
//SOL         : 166117
//Motivo(S)   : Alteração nos valores dos relatórios após alteração de vigencia da data de contabilização.
//******************************************************************************
//Data	      : 22/06/2011
//Responsável : Otacilio Aquino
//Kintana     : 1229326
//SOL         : 155955/4501
//Motivo(S)   : Alteração na regra da boleta para inclusão da carteira junto ao agrupamento já existente
//******************************************************************************
//Data       : 10/03/2009
//SOL        : 110922
//Kintana    : 508333
//Rotina     : Parametros do Sistema (Renda Variável)
//Responsável: William Santos
//Problema   : Como medida preventiva, solicitamos bloquear o campo Último Fechamento",
//              já que para este módulo não se pode alterar esta data.
//Solução    : Na propriedade(.DFM) "Enabled" do label e do campo foi atribuido False.
//******************************************************************************
// Data	     : 20/06/2008
// Codigo    : AL_37
// Pendencia :
// SOL       :
// Desc      : Ajuste no parâmetro de Fundo em Processamento
//******************************************************************************
// Data	     : 12/05/2008
// Codigo    : AL_36
// Pendencia : 25129
// SOL       : 58645
// Desc      : Implementação na integração por Módulos do item Opções de Indice
//******************************************************************************
// Data	     : 04/04/2008
// Codigo    : AL_35
// Pendência : 27707
// SOL       : 82025
// Desc      : Liberação da alteração das datas de fechamento dos módulos
//******************************************************************************
// Data	     : 17/01/2008
// Codigo    : AL_34
// Pendência : 26744
// SOL       : 71043
// Desc      : Implementação de campos para os fundos de tipo FMI
//******************************************************************************
// Data      : 03/10/2007
// Código    : AL_31
// Desc      : Passado o campo VLRDIVERG para a aba de Renda Variável pois é
//             utilizado na alteração de taxas de Renda Variavel
//******************************************************************************
// Data      : 27/06/2007
// Código    : AL_30
// Pendencia : 25703
// Motivo    : Retirada a autorização de alteração das datas de último fechamento
//             para todos os módulos do Sistema.
//******************************************************************************
// Data      : 26/04/2007
// Código    : AL_29
// Pendencia : 24388
// SOL       : 53035
// Desc      : Implementaacao do campo DTAFIMCARTGERENC para  filtrar na
//              View VWCARTEIRASRV
//******************************************************************************
// Data      : 16/03/2007
// Código    : AL_28
// Pendencia : 24774
// SOL       : 55877
// Desc      : Implementação de Bloqueio Contabil e Financeiro por Módulo
//******************************************************************************
// Data      : 16/02/2007
// Código    : AL_27
// Pendencia : 22779
// SOL       : 43633
// Desc      : Implementação de mais de um TRC entre Planos
//******************************************************************************
// Data      : 23/01/2007
// Código    : AL_26
// Pendencia : 23705
// SOL       : 40671
// Desc      : Implementação do paramentro IDMOTBLOQPENFDO, IDCARTEIRARF para Bloqueio de
//             Fundos e Penhora com o Jurídico
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_26
// Pendencia : 22492
// Desc      : Implementação de Contabilização em dias úteis para ativos de
//             Renda Fixa que geram registros em dias não uteis
//             Contabiliza FLGCONTABDIAUTIL
//******************************************************************************
// Data	    : 14/09/2006
// Código   : AL_25
// Motivo   : Inclusão dos FLGEMABERTURAFIC, IDUSREMABERTURAFIC,
//            IDUSREMABERTURAFIP e FLGEMABERTURAFIP no registro do Parâmetro
//*****************************************************************************
//Data	    : 21/02/2006
//Código    : Al_24
//Motivo(S) : Ajustes nos controles de sistema em fechamento, se desmarcar já
//               exclui o nome do usuário
//******************************************************************************
// Data     : 09/02/2006
// Código   : AL_23
// Motivo   : Criação da pasta de CPMF e dos campos PZORECCPMF na PARAMINVEST
//            para identificar o dia para recolhimento do CPMF
//******************************************************************************
// Data     : 03/02/2006
// Código   : AL_22
// Motivo   : Criação do campo MASCSCLASSIFANBID na PARAMINVEST para tratar a máscara
//            do código da Classificacao ANBID
//******************************************************************************
// Data     : 06/12/2005
// Código   : AL_21
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP e DTAREGIMECXCOMP na PARAMINVEST
//            para testar a utilização de regime de Caixa ou Competência nas
//            Operações de Renda Fixa
//******************************************************************************
// Data	    : 23/11/2005
// Código   : AL_20
// Motivo   : Volta a qry de LookUp do dblUsuarioProcRF para qryUsuarioProcRF,
//              ao invés do dtmBaseDados.Cds
//******************************************************************************
// Data	    : 14/10/2005
// Código   : AL_19
// Motivo   : Inclusão dos tipo de operação IDTIPOOPERDIRDSA e IDTIPOOPERDIRDSR
//            no registro do Parâmetro
//******************************************************************************
// Data     : 13/10/2005
// Código   : AL_18
// Motivo   : Inclusão do Parâmetro IDTIPOOPERRFRAC na qry e form
//******************************************************************************
// Data     : 28/04/2005
// Código   : AL_17
// Motivo   : Inclusão do Parâmetro FLGPOUPAPROPDIA na qry
//*******************************************************************************
// Data     : 03/05/2005
// Linha    : AL_16
// Descrição: Ajuste no Lay-Out dos paineis de Direitos e CM. (DFM)
//*******************************************************************************
// Data     : 19/01/2005
// Linha    : AL_15
// Descrição: Acrescentado campo no Form que indica o Tipo de Fundo, que controla
//            qual campo vai ser alterado no PARAMINVEST
//*******************************************************************************
// Data     : 19/01/2005
// Query    : qryTipoFundo
//*******************************************************************************
// Data     : 19/01/2005
// Descrição: Acrescentado campos na Query e no Form referenciado ao processo de
//            abertura(Fundos) ou fechamento(RV)
//********************************************************************************************************
// Data     : 04/01/2005
// Motivo   : Inclusão do Campo DIFRESGFUNDOS na ficha Fundos. (Alteração no DFM)
//********************************************************************************************************
// Data     : 06/12/2004
// Motivo   : Implementação do
//********************************************************************************************************
// Data     : 29/11/2004
// Motivo   : Implementação do FLGRECPAGRV
//******************************************************************************
//Data	    : 10/11/2004
//Origem    : FUNCEF
//Query     : qryAutorizaOper
//Motivo(S) : Acrescentado o campo FLGATIVO e filtrando a consulta por FLGATIVO
//********************************************************************************************************
// Data     : 30/09/2004
// Motivo   : Implementacao da DTMUDACPMF
//********************************************************************************************************
// Data     : 10/09/2004
// Motivo   : Alteração de Captions e Mudaça de Campos para a Tbs CM
//********************************************************************************************************
// Data     : 04/08/2004
// Código   : AL_1
// Função   : Alterada a Query e incluido um componente checkbox
// Motivo   : Controle do processo de abertura
//********************************************************************************************************
// Data     : 16/06/2004
// Origem   : CM
// Motivo   : Melhoria de Lay-out  de Renda Fixa
//********************************************************************************************************
// Data     : 09/06/2004
// Origem   : CM
// Motivo   : Melhoria de Lay-out
//********************************************************************************************************
// Data     : 24/05/2004
// Origem   : CM
// Motivo   : Melhoria de Lay-out
//********************************************************************************************************
// Data     : 17/05/2004
// Origem   : CM
// Motivo   : Implementacao do campo FLGINTFINLIQ
//********************************************************************************************************
// Data     : 07/05/2004
// Origem   : CM
// Motivo   : Implementacao do campo FLGIMPLANTRF
//********************************************************************************************************
// Data     : 14/04/2004
// Origem   : CM
// Função   : pgcDetalhes
// Motivo   : Acerto no Caption da Label63 que estava escrito "AtraZo" ao invés de "AtraSo"
//********************************************************************************************************

unit FParamInvest;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, StdCtrls, Mask, wwdbedit, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97, MAHlpBtn, Buttons, ExtCtrls, Udatabase,
  TB97Ctls, TB97Tlbr, DBCtrls, wwdblook, IvDictio, IvMulti, IvEMulti,
  Wwdotdot, Wwdbcomb, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  ComCtrls, CmEventosCadastro, ImgList, UOperacaoInvest,UBibliotecaInvest,
  fcLabel, uCtrlParamInvest, Wwdbspin;

type
  TFrmParamInvest = class(TfrmCadastroCS)
    qryaux: TwwQuery;
    QryBuscaMoeda: TwwQuery;
    QryBuscaMoedaMOECODIGO: TFloatField;
    QryBuscaMoedaMOEDESC: TStringField;
    qryIndicador: TwwQuery;
    qryIndicadorDESCPARAMEMISSOR: TStringField;
    qryIndicadorIDPARAMEMISSOR: TFloatField;
    pgcDetalhes: TPageControl;
    tbsRFixa: TTabSheet;
    Label16: TLabel;
    qryTpoDespInv: TwwQuery;
    qryTpoDespInvDESCTIPODESPINV: TStringField;
    qryTpoDespInvIDTIPODESPINVEST: TFloatField;
    QryTipoContrato: TwwQuery;
    QryTipoContratoIDTIPOCONTRINVEST: TFloatField;
    QryTipoContratoDESCTIPOCTINVEST: TStringField;
    qryTipoOperacao: TwwQuery;
    qryTipoOperacaoDESCTIPOOPERACAO: TStringField;
    qryTipoOperacaoIDTIPOOPERACAO: TFloatField;
    QryTipoCliente: TwwQuery;
    QryPrograma: TwwQuery;
    QryProgramaIDPROGRAMA: TFloatField;
    QryProgramaDESCPROGRAMA: TStringField;
    QryTipoClienteIDTIPOCLIENTE: TFloatField;
    QryTipoClienteDESCRICAO: TStringField;
    qryBolsaValores: TwwQuery;
    qryBolsaValoresIDBOLSAVALORES: TFloatField;
    qryBolsaValoresSGLBOLSAVALORES: TStringField;
    tbsBMF: TTabSheet;
    qryTipoInvestBMF: TwwQuery;
    qryTipoInvestBMFIDTIPOINVESTIDOR: TFloatField;
    qryTipoInvestBMFDESCTPINVESTIDOR: TStringField;
    qryMercadoBMF: TwwQuery;
    qryMercadoBMFIDMERCADO: TFloatField;
    qryMercadoBMFDESCMERCADO: TStringField;
    qryBuscaPendencia: TwwQuery;
    qryBuscaPendenciaDESCTIPOOPERACAO: TStringField;
    qryBuscaPendenciaIDTIPOOPERACAO: TFloatField;
    qryTpPeriodicidade: TwwQuery;
    qryTpPeriodicidadeIDTPPERIODICIDADE: TFloatField;
    qryTpPeriodicidadeNOME: TStringField;
    qryIDPARAMINVEST: TFloatField;
    qryMOECODIGO: TFloatField;
    d: TStringField;
    qryMASCCLASSIFINV: TStringField;
    qryVLRDIVERG: TFloatField;
    qryVLRCOTAINICART: TFloatField;
    qryDATAULTFECH: TDateTimeField;
    qryDATAULTFECHRF: TDateTimeField;
    qryFLGORDMOVINV: TStringField;
    qryPERCPUORDMOVINV: TFloatField;
    qryPERCIMPRENDA: TFloatField;
    qryPUCDB: TFloatField;
    qryFLGPROVISIONAIRRF: TStringField;
    qryFLGPROVISIONAIRRV: TStringField;
    qryMOEDAATU: TFloatField;
    qryPERCPARTICEMPR: TFloatField;
    qryPERCPARTICRECUR: TFloatField;
    qryIDTIPODESPINVEST: TFloatField;
    qryIDTIPODESPIRAPU: TFloatField;
    qryIDPARAMPATRLIQ: TFloatField;
    qryMOEDAATULIT: TFloatField;
    qryIDTIPOCONTRRF: TFloatField;
    qryIDTIPOOPERDIRDIV: TFloatField;
    qryIDTIPOOPERDIRJUR: TFloatField;
    qryIDTIPOOPERDIRBON: TFloatField;
    qryIDTIPOOPERDIRSUB: TFloatField;
    qryIDTIPOOPERDIRGRU: TFloatField;
    qryIDTIPOOPERDIRDES: TFloatField;
    qryIDTIPOOPERDIRCIS: TFloatField;
    qryIDTIPOOPERDIRINC: TFloatField;
    qryIDTIPOOPERDIRPER: TFloatField;
    qryIDTIPOCLIENTECOR: TFloatField;
    qryIDTIPOCLIENTEEMI: TFloatField;
    qryIDTIPOCLIENTECUS: TFloatField;
    qryIDPROGRAMA: TFloatField;
    qryIDBVSP: TFloatField;
    qryIDTIPOINVESTIDOR: TFloatField;
    qryIDMERCADO: TFloatField;
    qryIDTIPOOPERLIQPEND: TFloatField;
    qryIDBMF: TFloatField;
    qryIDTPPERIODICIDADE: TFloatField;
    qryDATAULTIMPCOT: TDateTimeField;
    qryIDTIPOOPERDIRALT: TFloatField;
    qryIDRAMOFORCOR: TFloatField;
    qryIDRAMOFOREMI: TFloatField;
    qryIDRAMOFORCUS: TFloatField;
    qryFLGLIBERAIDLOTE: TStringField;
    qrySTARET: TStringField;
    bvlBMF: TBevel;
    QryRamoFornecedor: TwwQuery;
    QryRamoFornecedorIDRAMOFORNECEDOR: TFloatField;
    QryRamoFornecedorDESCRAMOFORNECEDOR: TStringField;
    tbsFundos: TTabSheet;
    qryDATAULTFECHFDO: TDateTimeField;
    qryTIPOMENU: TStringField;
    qryMOEDAGER: TFloatField;
    qryIDTIPODESPIRPROV: TFloatField;
    qryIDTIPOINVEST: TFloatField;
    qryIDTIPOCONTRFIN: TFloatField;
    qryDATAULTFECHBMF: TDateTimeField;
    qryIDTIPOOPERDIRRES: TFloatField;
    qryFLGUSASUBCONTA: TStringField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryPERCDEVRV: TFloatField;
    qryPERCDEVBMF: TFloatField;
    qryDIASEMANACPMF: TStringField;
    qryDIASUTEISCPMF: TFloatField;
    qryCustodiante: TwwQuery;
    qryCustodianteIDCUSTODIANTE: TFloatField;
    qryCustodianteSGLCUSTODIANTE: TStringField;
    qryIDCUSTODIARENFIX: TFloatField;
    qryTipoRegraRF: TwwQuery;
    qryTipoRegraRFIDTIPOREGRA: TFloatField;
    qryTipoRegraRFDESCREGRA: TStringField;
    qryIDTIPOREGRARV: TFloatField;
    qryIDTIPOREGRARF: TFloatField;
    qryIDTIPOREGRABMF: TFloatField;
    qryTipoRegraRV: TwwQuery;
    StringField6: TStringField;
    FloatField15: TFloatField;
    qryTipoRegraBMF: TwwQuery;
    StringField7: TStringField;
    FloatField16: TFloatField;
    qryFLGIMPLANTRF: TStringField;
    qryFLGCONTABILIZA: TStringField;
    qryContraParte: TwwQuery;
    qryContraParteNOME: TStringField;
    qryContraParteIDPESSOA: TFloatField;
    qryFLGINTCAPCAR: TStringField;
    qryIDCONTRAPARTERF: TFloatField;
    qryAutorizaOper: TwwQuery;
    qryAutorizaOperIDUSUARIO: TFloatField;
    qryAutorizaOperNOMEUSUARIO: TStringField;
    qryIDAUTORIZAORDEM: TFloatField;
    QryClasseTitulo: TwwQuery;
    QryClasseTituloIDCLASSETIT: TFloatField;
    QryClasseTituloDESCCLASSETIT: TStringField;
    qryIDCLASSETIT: TFloatField;
    qryFLGEMPACOES: TStringField;
    qryIDCARTEMPACOES: TFloatField;
    qryCarteiraInvest: TwwQuery;
    qryCarteiraInvestIDCARTEIRAINVEST: TFloatField;
    qryCarteiraInvestDESCCARTINVEST: TStringField;
    qryIDREGRAEMPACOES: TFloatField;
    qryRegraEmpAcoes: TwwQuery;
    qryRegraEmpAcoesIDREGRA: TFloatField;
    qryRegraEmpAcoesNOMEREGRA: TStringField;
    qryIDMOTBLOQEMPAC: TFloatField;
    qryFLGCARTGERENC: TStringField;
    qryIDINDEXPOUPANCA: TFloatField;
    qryJUROSPOUPANCA: TFloatField;
    qryMotivoBloqueio: TwwQuery;
    qryMotivoBloqueioIDMOTIVOBLOQUEIO: TFloatField;
    qryMotivoBloqueioDESCMOTBLOQ: TStringField;
    QryBuscaMoedaMOESIGLA: TStringField;
    qryIDTIPOOPERDIRMUL: TFloatField;
    qryIDPLANPREVCTBPATR: TFloatField;
    qryIDOPERAMORTPRINC: TFloatField;
    qryIDOPERINCJUROS: TFloatField;
    qryIDOPERPAGTOJUROS: TFloatField;
    qryPatroPlanPrevContab: TwwQuery;
    qryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField;
    qryPatroPlanPrevContabIDPLANOPREV: TFloatField;
    qryPatroPlanPrevContabIDPATRO: TFloatField;
    qryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField;
    qryItemRenFix: TwwQuery;
    qryFLGESPECFUNDO: TStringField;
    qryFLGCOMPVARRV: TStringField;
    qryPRZVENCBMF: TFloatField;
    qryPRZVENCCFIANCA: TFloatField;
    qryIDCLASSPOUPBLOQ: TFloatField;
    qryTipoRegraRent: TwwQuery;
    StringField8: TStringField;
    FloatField17: TFloatField;
    qryIDTIPOREGRARENT: TFloatField;
    qryTipoRegraAtuarial: TwwQuery;
    StringField9: TStringField;
    FloatField18: TFloatField;
    qryIDTIPOREGRAATUAR: TFloatField;
    qryFLGPLANPREVCTBPAT: TStringField;
    qryIDCLASSNTN: TFloatField;
    qryIDTIPOOPERDIRREE: TFloatField;
    tbsEmprestimo: TTabSheet;
    qryDATAULTFECHEMP: TDateTimeField;
    qryIDTIPOOPERDIRPROV: TFloatField;
    qryIDTIPOOPEROPCCP: TFloatField;
    qryIDTIPOOPEROPCVD: TFloatField;
    qryMOEDAEQM: TFloatField;
    qryIDCARTOPCIND: TFloatField;
    qryIDCARTOPC: TFloatField;
    qryIDCARTAVISTA: TFloatField;
    qryIDMOTBLOQOPC: TFloatField;
    tbsOpcoes: TTabSheet;
    qryDIFMAXOPCIND: TFloatField;
    qryIDTIPOREGRAOPCIN: TFloatField;
    qryIDTIPOREGRAEMPAC: TFloatField;
    qryIDTIPODESPDVCOR: TFloatField;
    qryGrupoRegra: TwwQuery;
    qryIDGRUPOREGRAINV: TFloatField;
    qryGrupoRegraIDGRUPOREGRA: TFloatField;
    qryGrupoRegraDESCRICAO: TStringField;
    qryTipoRegraOpcAc: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    qryTipoRegraOpcInd: TwwQuery;
    StringField2: TStringField;
    FloatField2: TFloatField;
    qryTipoRegraEmpAc: TwwQuery;
    StringField3: TStringField;
    FloatField3: TFloatField;
    qryFLGDEMO: TStringField;
    qryFLGINTFINLIQ: TStringField;
    qryFLGRFEMABERTURA: TStringField;
    qryIDUSUARIOPROCRF: TFloatField;
    qryUsuarioProcRF: TwwQuery;
    qryUsuarioProcRFNOME: TStringField;
    qryUsuarioProcRFIDUSUARIO: TFloatField;
    qryDTMUDACPMF: TDateTimeField;
    qryFLGRECPAGRV: TStringField;
    qryIDTIPOOPERDIRDSU: TFloatField;
    qryFLGRVEMABERTURA: TStringField;
    qryIDUSUARIOPROCRV: TFloatField;
    qryFLGEMABERTURAFIB: TStringField;
    qryIDUSREMABERTURAFIB: TFloatField;
    qryFLGEMABERTURAFAC: TStringField;
    qryIDUSREMABERTURAFAC: TFloatField;
    qryFLGEMABERTURAFIF: TStringField;
    qryIDUSREMABERTURAFIF: TFloatField;
    qryFLGEMABERTURAFAO: TStringField;
    qryIDUSREMABERTURAFAO: TFloatField;
    qryFLGEMABERTURAFID: TStringField;
    qryIDUSREMABERTURAFID: TFloatField;
    qryFLGEMABERTURAFPT: TStringField;
    qryIDUSREMABERTURAFPT: TFloatField;
    qryDIFRESGFUNDOS: TFloatField;
    QryTipoFundo: TwwQuery;
    QryTipoFundoDESCTIPOFUNDOINV: TStringField;
    QryTipoFundoIDTIPOFUNDOINVEST: TFloatField;
    QryTipoFundoIDTIPOINVEST: TFloatField;
    QryTipoFundoDATAULTFECH: TDateTimeField;
    QryTipoFundoTRGDTINCLUSAO: TDateTimeField;
    QryTipoFundoTRGUSERINCLUSAO: TStringField;
    qryFLGPOUPAPROPDIA: TStringField;
    qryIDTIPOOPERRFRAC: TFloatField;
    qryIDTIPOOPERDIRDSA: TFloatField;
    qryIDTIPOOPERDIRDSR: TFloatField;
    qryFLGREGIMECXCOMP: TStringField;
    qryDTAREGIMECXCOMP: TDateTimeField;
    //23
    qryPZORECCPMF: TFloatField;
    qryDATAINIRECCPMF: TDateTimeField;
    qryMASCSCLASSIFANBID: TStringField;
    tbsSistema: TTabSheet;
    pnlSistema: TPanel;
    tbsRVariavel: TTabSheet;
    pnlRVariavel: TPanel;
    pgcRvariavel: TPageControl;
    tbsRVGeral: TTabSheet;
    pnlRVGeral: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    Label44: TLabel;
    lblCartAVista: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label48: TLabel;
    dbdDtaFechRv: TCMDateTimePicker;
    dtpDataUltImpCot: TCMDateTimePicker;
    dblkCartAVista: TwwDBLookupCombo;
    dblBovespa: TwwDBLookupCombo;
    dblTipoOperLiqPend: TwwDBLookupCombo;
    dbrPercDevRV: TDBRealEdit;
    dbckFlgCompVarRV: TDBCheckBox;
    Panel1: TPanel;
    dbckFLGRECPAGRV: TDBCheckBox;
    chkRVEmAbertura: TDBCheckBox;
    dblUsuarioProcRV: TwwDBLookupCombo;
    tbsDireitos: TTabSheet;
    pnlDireitos: TPanel;
    Panel7: TPanel;
    Label21: TLabel;
    Label20: TLabel;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    dblDividendos: TwwDBLookupCombo;
    dblJurosCapital: TwwDBLookupCombo;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    Panel8: TPanel;
    Label28: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    dblIncorporacao: TwwDBLookupCombo;
    dblGrupamento: TwwDBLookupCombo;
    dblDesdobramento: TwwDBLookupCombo;
    dblPermuta: TwwDBLookupCombo;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    Panel26: TPanel;
    Label78: TLabel;
    lblRecFracionado: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    dblDireitoSubscricao: TwwDBLookupCombo;
    dblkRecFracionado: TwwDBLookupCombo;
    dblSubscricaoAcao: TwwDBLookupCombo;
    dblSubscricaoRFixa: TwwDBLookupCombo;
    pnlRFixa: TPanel;
    Panel9: TPanel;
    Label14: TLabel;
    Label52: TLabel;
    Label56: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label58: TLabel;
    dbdDtaFechRf: TCMDateTimePicker;
    dblCustodianteRenFix: TwwDBLookupCombo;
    dblkContraParte: TwwDBLookupCombo;
    dblkOperIncJuros: TwwDBLookupCombo;
    dblkOperPagtoJuros: TwwDBLookupCombo;
    dblkOperAmortPrinc: TwwDBLookupCombo;
    dblkClassePoupanca: TwwDBLookupCombo;
    Panel10: TPanel;
    Label69: TLabel;
    Label62: TLabel;
    lblTaxaJurosPoupanca: TLabel;
    dblCassePoupBloq: TwwDBLookupCombo;
    dblkMoedaPoupanca: TwwDBLookupCombo;
    dbreTaxaJurosPoupanca: TDBRealEdit;
    chkRFEmAbertura: TDBCheckBox;
    dblUsuarioProcRF: TwwDBLookupCombo;
    dbckFlgPoupApropDia: TDBCheckBox;
    pnlBmf: TPanel;
    Panel11: TPanel;
    Label68: TLabel;
    Label37: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label49: TLabel;
    lblPrzVencBMF: TLabel;
    dbdDtaFechBMF: TCMDateTimePicker;
    dblBMF: TwwDBLookupCombo;
    dblTipoInvestidorBMF: TwwDBLookupCombo;
    dblMercadoBMF: TwwDBLookupCombo;
    dbrPercDevBMF: TDBRealEdit;
    dbrePrzVencBMF: TDBRealEdit;
    Panel12: TPanel;
    pnlFundos: TPanel;
    Panel13: TPanel;
    Label45: TLabel;
    lblDifResgate: TLabel;
    lblTipoFundo: TLabel;
    lblMaskANBID: TLabel;
    dbdDtaFechFdo: TCMDateTimePicker;
    dbrDifResgate: TDBRealEdit;
    dblTipoFundo: TwwDBLookupCombo;
    chkFundosEmAbertura: TDBCheckBox;
    dblUsuarioProcFundos: TwwDBLookupCombo;
    dbeMaskANBID: TDBEdit;
    Panel14: TPanel;
    pnlEmprestimo: TPanel;
    Panel5: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Label59: TLabel;
    Label74: TLabel;
    dbcFlgEmpAcoes: TDBCheckBox;
    dblkRegraEmpAcoes: TwwDBLookupCombo;
    dblkMotivoBloqueio: TwwDBLookupCombo;
    dblkCartEmpAcoes: TwwDBLookupCombo;
    dtpUltFechEmp: TCMDateTimePicker;
    Panel6: TPanel;
    pnlOpcao: TPanel;
    Panel21: TPanel;
    grpOpcoesAcoes: TGroupBox;
    lblCartOpcoes: TLabel;
    lblTPOperCpOpc: TLabel;
    lblTPOperVdOpc: TLabel;
    dblkCartOpcoes: TwwDBLookupCombo;
    dblkTPOperCpOpc: TwwDBLookupCombo;
    dblkTPOperVdOpc: TwwDBLookupCombo;
    grpOpcoesIndices: TGroupBox;
    Label79: TLabel;
    lblCarOpcoesInd: TLabel;
    lblMotBloqOpc: TLabel;
    dbrLimDifCestaOpcInd: TDBRealEdit;
    dblkCartOpcInd: TwwDBLookupCombo;
    dblkMotBloqOpc: TwwDBLookupCombo;
    Panel22: TPanel;
    Label73: TLabel;
    dbReestruturacaoSoc: TwwDBLookupCombo;
    Label75: TLabel;
    dblResgFdoAnuncioProv: TwwDBLookupCombo;
    tbsRegra: TTabSheet;
    pnlRegra: TPanel;
    Panel20: TPanel;
    lblGrupoRegra: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label54: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    dblkGrupoRegra: TwwDBLookupCombo;
    dblTipoRegraRent: TwwDBLookupCombo;
    dblTipoRegraAtuarial: TwwDBLookupCombo;
    dblTipoRegraRV: TwwDBLookupCombo;
    dblTipoRegraRF: TwwDBLookupCombo;
    dblTipoRegraBMF: TwwDBLookupCombo;
    Panel19: TPanel;
    lblTpRegraOpcAc: TLabel;
    lblTpRegraOpcInd: TLabel;
    lblTpRegraEmpAcoes: TLabel;
    dblkTpRegraOpcAc: TwwDBLookupCombo;
    dblkTpRegraOpcInd: TwwDBLookupCombo;
    dblkTpRegraEmpAcoes: TwwDBLookupCombo;
    //AL_25
    qryFLGEMABERTURAFIP: TStringField;
    qryIDUSREMABERTURAFIP: TFloatField;
    qryFLGEMABERTURAFIC: TStringField;
    qryIDUSREMABERTURAFIC: TFloatField;
    qryFLGCONTABDIAUTIL: TStringField;
    qryMotBloqPenFdo: TwwQuery;
    qryMotBloqPenFdoIDMOTIVOBLOQUEIO: TFloatField;
    qryMotBloqPenFdoDESCMOTBLOQ: TStringField;
    qryMotBloqPenFdoSIGLAMOTBLOQ: TStringField;
    dblkBloqPenFdo: TwwDBLookupCombo;
    Label85: TLabel;
    //AL_26
    qryIDMOTBLOQPENFDO: TFloatField;
    dblkCarteiraRF: TwwDBLookupCombo;
    qryCarteiraRF: TwwQuery;
    qryCarteiraRFIDCARTEIRAINVEST: TFloatField;
    qryCarteiraRFDESCCARTINVEST: TStringField;
    lblCarteiraRF: TLabel;
    qryIDCARTEIRARF: TFloatField;
    qryFLGINTCONTABRF: TStringField;
    qryFLGINTCONTABRV: TStringField;
    qryFLGINTCONTABBMF: TStringField;
    qryFLGINTCONTABFRF: TStringField;
    qryFLGINTCONTABFRV: TStringField;
    qryFLGINTCONTABFIM: TStringField;
    qryFLGINTCONTABFDC: TStringField;
    qryFLGINTCONTABFIP: TStringField;
    //AL_29
    qryDATAMOVCDBLIB: TDateTimeField;
    //AL_36
    qryFLGINTCONTABOPI: TStringField;
    Label4: TLabel;
    dbrLimiteVlrDiverg: TDBRealEdit;
    pgcSistema: TPageControl;
    tbsGeral: TTabSheet;
    pnlGeral: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Label64: TLabel;
    Label57: TLabel;
    lblPrzVencCFianca: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DbLkcBuscaMoeda: TwwDBLookupCombo;
    dblkPlanPrevCtbPatro: TwwDBLookupCombo;
    dblAutorizaOrdem: TwwDBLookupCombo;
    dbrePrzVencCFianca: TDBRealEdit;
    DBEdMascara: TwwDBEdit;
    DbMascClassif: TDBEdit;
    Panel4: TPanel;
    Label17: TLabel;
    Label76: TLabel;
    Label86: TLabel;
    dbckCartGerenc: TDBCheckBox;
    dbdDtaMudaCpmf: TCMDateTimePicker;
    dbchRegCxComp: TDBCheckBox;
    dtRegCxComp: TCMDateTimePicker;
    DblIndiceEQM: TwwDBLookupCombo;
    CMDateTimePicker1: TCMDateTimePicker;
    tbsImpostos: TTabSheet;
    pnlImpostos: TPanel;
    Panel18: TPanel;
    Label18: TLabel;
    Label77: TLabel;
    dblIndexadorIR: TwwDBLookupCombo;
    dtpDataUltRet: TCMDateTimePicker;
    dbckStaRET: TDBCheckBox;
    ckbProvRV: TDBCheckBox;
    ckbProvRF: TDBCheckBox;
    Panel28: TPanel;
    tbsCpmf: TTabSheet;
    pnlCpmf: TPanel;
    Panel29: TPanel;
    Label84: TLabel;
    Label82: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label83: TLabel;
    dbdDtaIniRecCPMF: TCMDateTimePicker;
    dbcPzoCPMF: TwwDBComboBox;
    dbcDiaSemCPMF: TwwDBComboBox;
    dbeDiasUteisCPMF: TwwDBEdit;
    Panel17: TPanel;
    tbsIntContFin: TTabSheet;
    pnlIntContFin: TPanel;
    pnlIntContFinGeral: TPanel;
    gpbCliente: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dblCorretora: TwwDBLookupCombo;
    dblEmissor: TwwDBLookupCombo;
    dblCustodiate: TwwDBLookupCombo;
    gpbFornecedor: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    dblRamoForCor: TwwDBLookupCombo;
    dblRamoForEmi: TwwDBLookupCombo;
    dblRamoForCus: TwwDBLookupCombo;
    Panel16: TPanel;
    pgcContFin: TPageControl;
    tbsContFinGeral: TTabSheet;
    Panel15: TPanel;
    Label33: TLabel;
    dbckContabDiaUtil: TDBCheckBox;
    dbckIntFinLiq: TDBCheckBox;
    dbchPlanPrevPatro: TDBCheckBox;
    dbckUsaSubConta: TDBCheckBox;
    dblPrograma: TwwDBLookupCombo;
    tbsContFinModulos: TTabSheet;
    Panel31: TPanel;
    pnlMensagemContabFinan: TPanel;
    fcLabel1: TfcLabel;
    pnlBloqRF: TPanel;
    pnlMensBloqRF: TPanel;
    Panel33: TPanel;
    chkFlgIntContabRF: TDBCheckBox;
    pnlBloqRV: TPanel;
    pnlMensBloqRV: TPanel;
    Panel36: TPanel;
    chkFlgIntContabRV: TDBCheckBox;
    pnlBloqBMF: TPanel;
    pnlMensBloqBMF: TPanel;
    Panel35: TPanel;
    chkFlgIntContabBMF: TDBCheckBox;
    pnlBloqFRF: TPanel;
    pnlMensBloqFRF: TPanel;
    Panel37: TPanel;
    chkFlgIntContabFRF: TDBCheckBox;
    pnlBloqFRV: TPanel;
    pnlMensBloqFRV: TPanel;
    Panel38: TPanel;
    chkFlgIntContabFRV: TDBCheckBox;
    pnlBloqFIM: TPanel;
    pnlMensBloqFIM: TPanel;
    Panel39: TPanel;
    chkFlgIntContabFIM: TDBCheckBox;
    pnlBloqFDC: TPanel;
    pnlMensBloqFDC: TPanel;
    Panel40: TPanel;
    chkFlgIntContabFDC: TDBCheckBox;
    pnlBloqFIP: TPanel;
    pnlMensBloqFIP: TPanel;
    Panel41: TPanel;
    chkFlgIntContabFIP: TDBCheckBox;
    //AL_34
    qryFLGEMABERTURAFMI: TStringField;
    qryIDUSREMABERTURAFMI: TFloatField;
    //AL_36
    pnlBloqOPI: TPanel;
    pnlMensBloqOPI: TPanel;
    Panel25: TPanel;
    chkFlgIntContabOPI: TDBCheckBox;
    //--Emerson SOL 110583 KT 505562 10.03.2009 Inicio--//
    qryREGRABOLETA: TStringField;
    //--Emerson SOL 110583 KT 505562 10.03.2009 Fim-----//
    dbrgGeracaoBoleta: TDBRadioGroup;
    Label5: TLabel;
    qryFATORCALC2: TFloatField;
    dbsFatorCalc: TwwDBSpinEdit;
    //Ricardo Cristiano - 07/06/2010 - N. Sol 124730 -  N. Kintana 668611
    Label43: TLabel;
    dblAlteracaoTipo: TwwDBLookupCombo;
    Label63: TLabel;
    dblkOperMultaAtrazo: TwwDBLookupCombo;
    dbRestituicaoCapital: TwwDBLookupCombo;
    Label46: TLabel;
    dblCisao: TwwDBLookupCombo;
    Label27: TLabel;
    dblSubscricao: TwwDBLookupCombo;
    Label24: TLabel;
    dblBonificacao: TwwDBLookupCombo;
    Label23: TLabel;
    pnlPrazo: TPanel;
    pnlPrazoDet: TPanel;
    Label7: TLabel; 
    Label8: TLabel; 
    Label9: TLabel; 
    dbcbxTipoDataDir: TwwDBComboBox;
    dtDataVigDir: TCMDateTimePicker;
    qryDATAVIGDIR: TDateTimeField;
    qryTPDATAVIGDIR: TStringField;
    //Ricardo Cristiano - 15/01/2011 - N. Sol 84432 -  N. Kintana 523253
    dblkCartOrigEmpAcoes: TwwDBLookupCombo;
    Label10: TLabel;
    Label118: TLabel;    
    qryIDCARTORIGEMPACOES: TFloatField;
    //23 - Fim
    procedure DBEdMascaraKeyPress(Sender: TObject; var Key: Char);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure DbMascClassifKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure HabilitaTabSheets;
    procedure DesabilitaTabSheets;
    procedure dbdDtaFechRfEnter(Sender: TObject);
    procedure dblTipoRegraRVExit(Sender: TObject);
    procedure dblTipoFundoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblTipoFundoChange(Sender: TObject);
    procedure dbchRegCxCompExit(Sender: TObject);    
    procedure dbeMaskANBIDKeyPress(Sender: TObject; var Key: Char);
    procedure chkRVEmAberturaClick(Sender: TObject);
    procedure chkRFEmAberturaClick(Sender: TObject);
    //AL_28
    procedure VerBloqClick(Sender: TObject);
    procedure qryAfterOpen(DataSet: TDataSet);
    //AL_37
    procedure chkFundosEmAberturaClick(Sender: TObject);
    procedure dbsFatorCalcKeyPress(Sender: TObject; var Key: Char);
    procedure CmeCadastroConfirma(Sender: TObject);

  private
    { Private declarations }
    sSql : String;
    dDataFechRF : TDateTime;
    //AL_28
    procedure VerModuloBloqueado(iModulo: Word; bIntegra: Boolean);

  public
    { Public declarations }
  end;

var
  FrmParamInvest: TFrmParamInvest;

implementation

uses DBaseDados, UMensErro, uRendaFixa, FAutorizaParametros,FTelaAut,USistema, UOperComum,
     UFundoComum, URendaVariavel;

{$R *.DFM}

procedure TFrmParamInvest.DBEdMascaraKeyPress(Sender: TObject;
  var Key: Char);
begin
 inherited;
  if  (key = '.') and (Copy(dbedMascara.Text,Length(dbedMascara.Text),1) = '.') then
  begin
     MessageBeep(0);
     ShowMessage('Digitar 9 ou . ');
     key := #0;
     Exit;
  end;
  if (key <> '9') and (key <> '.') and (key <> #8) then
  begin
     MessageBeep(0);
     ShowMessage('Digitar 9 ou . ');
     key := #0;
     Exit;
  end;
  if (key <> '9') and (Length(dbedMascara.Text) = 0)  then
  begin
     MessageBeep(0);
     ShowMessage('Digitar 9 ou . ');
     key := #0;
  end;
end;

procedure TFrmParamInvest.sbtnInserirClick(Sender: TObject);
begin
   try
      with qryAux do
      begin
         Close;
         sSql := 'Select P.IdParamInvest ,P.MascSetorEmissor from PARAMINVEST P';
         Sql.Clear;
         Sql.Add(sSql);
         Open;
         if not IsEmpty then
            ShowMessage('Já Existe Máscara Cadastrada')
         else
            inherited;
         Close;
      end;
   except
      Raise;
   end;
end;

procedure TFrmParamInvest.bbtnConfirmarClick(Sender: TObject);
begin
  if dDataFechRF > dbdDtaFechRf.DateTime then
  begin
     if MsgDlg('A alteração da data do fechamento de Renda Fixa '+#13+
               'implicará na exclusão de todas as atualizações '+#13+
               'com data superior a ' + dbdDtaFechRf.Text,
               'Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrYes then
     begin
        if MsgDlg('Exclui Também as Operações Cadastradas ?', 'Confirmação',
                  mtConfirmation,[mbYes, mbNo],0) = mrYes then
        begin
           //AL_27
           if not RendaFixa.ExcluiHistRenFix(dbdDtaFechRf.DateTime,False,-1,-1,-1,-1,True) then
              Exit;
        end
        else
        begin
           //AL_27
           if not RendaFixa.ExcluiHistRenFix(dbdDtaFechRf.DateTime,False,-1,-1,-1,-1,False) then
              Exit;
        end;
     end;
  end;
  //AL_21 Ini
  if (dbchRegCxComp.checked) and (Trim(dtRegCxComp.Text) = '') then
  begin
      MsgDlg('Falta informar a Data Inicial de utilização de Regime de Caixa.','Mensagem do Sistema',mtWarning,[MbOk],0);
      if dtRegCxComp.CanFocus then
         dtRegCxComp.SetFocus;
      Exit;
  end;
  if ds.DataSet.State in [dsInsert] then
  Begin
     if qry.FieldByName('IDPARAMINVEST').AsInteger <= 0 then
        qry.FieldByName('IDPARAMINVEST').AsInteger := LeUltRegistro(nil,'PARAMINVEST');
  end;
  inherited;
// Reabilita Mascara
  DBEdMascara.Enabled    := True;
  DBEdMascara.Color      := ClWhite;
  DbMascClassif.Enabled  := True;
  DbMascClassif.Color    := ClWhite;
  pgcDetalhes.ActivePage := tbsSistema;
  //AL_28
  pgcContFin.ActivePage := tbsContFinGeral;
  DesabilitaTabSheets;
  //Aqui ele já faz a operação RetParamInvest1
  CtrlPInv.GetParamsInvest(Sistema.IdEmpresa);



end;

procedure TFrmParamInvest.sbtnApagarClick(Sender: TObject);
begin
   try
      with qryAux do
      begin
         Close;
         sSql := 'Select P.IdParamInvest ,P.MascSetorEmissor from PARAMINVEST P';
         Sql.Clear;
         Sql.Add(sSql);
         Open;
         if not IsEmpty then
            ShowMessage('Máscara já em Uso')
         else
            inherited;
         Close;
      end;
   except
      Raise;
   end;
end;

procedure TFrmParamInvest.FormShow(Sender: TObject);
begin
   inherited;

   DesabilitaTabSheets;
   sbtnAlterar.Enabled:=True;

   qry.Open;
   qryBuscaPendencia.Open;
   qryBuscaMoeda.Open;
   qryIndicador.Open;
   qryTpoDespInv.Open;
   qryTipoContrato.Open;
   qryTipoOperacao.Open;
   qryTipoCliente.Open;
   qryRamoFornecedor.Open;
   qryPrograma.Open;
   qryContraParte.Open;
   qryAutorizaOper.Open;
   qryClasseTitulo.Open;
   qryCarteiraInvest.Open;
   qryMotivoBloqueio.Open;
   qryPatroPlanPrevContab.Open;
   qryItemRenFix.Open;
   qryGrupoRegra.Open;
   qryUsuarioProcRF.Open;   

   //AL_15 - 19/01/2005
   QryTipoFundo.Close;
   QryTipoFundo.ParamByName('IDTIPOINVEST').AsInteger := iTipoInvestUsu;
   QryTipoFundo.Open;
   //AL_15 -- Fim
   OperComum.LimpaParametros(qryTipoRegraEmpAc);

   OperComum.LimpaParametros(qryRegraEmpAcoes);
   if not qryIDTIPOREGRAEMPAC.IsNull then
      qryRegraEmpAcoes.ParamByName('IDTIPOREGRA').AsInteger := qryIDTIPOREGRAEMPAC.AsInteger;
   qryRegraEmpAcoes.Open;

   OperComum.LimpaParametros(qryTipoRegraRV);
   OperComum.LimpaParametros(qryTipoRegraRF);
   OperComum.LimpaParametros(qryTipoRegraBMF);
   OperComum.LimpaParametros(qryTipoRegraAtuarial);
   OperComum.LimpaParametros(qryTipoRegraRent);
   OperComum.LimpaParametros(qryTipoRegraOpcAc);
   OperComum.LimpaParametros(qryTipoRegraOpcInd);
   OperComum.LimpaParametros(qryTipoRegraEmpAc);

   if not qryIDGRUPOREGRAINV.IsNull then
   begin
      qryTipoRegraRV.ParamByName('IDGRUPOREGRAINV').AsInteger       := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraRF.ParamByName('IDGRUPOREGRAINV').AsInteger       := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraBMF.ParamByName('IDGRUPOREGRAINV').AsInteger      := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraAtuarial.ParamByName('IDGRUPOREGRAINV').AsInteger := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraRent.ParamByName('IDGRUPOREGRAINV').AsInteger     := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraOpcAc.ParamByName('IDGRUPOREGRAINV').AsInteger    := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraOpcInd.ParamByName('IDGRUPOREGRAINV').AsInteger   := qryIDGRUPOREGRAINV.AsInteger;
      qryTipoRegraEmpAc.ParamByName('IDGRUPOREGRAINV').AsInteger    := qryIDGRUPOREGRAINV.AsInteger;
   end;
   qryTipoRegraRV.Open;
   qryTipoRegraRF.Open;
   qryTipoRegraBMF.Open;
   qryTipoRegraAtuarial.Open;
   qryTipoRegraRent.Open;
   qryTipoRegraOpcAc.Open;
   qryTipoRegraOpcInd.Open;
   qryTipoRegraEmpAc.Open;

   // AL_24
   if qryFLGRVEMABERTURA.AsString = 'S' then
      dblUsuarioProcRV.Enabled := True
   else
      dblUsuarioProcRV.Enabled := False;

   if qryFLGRFEMABERTURA.AsString = 'S' then
      dblUsuarioProcRF.Enabled := True
   else
      dblUsuarioProcRF.Enabled := False;

   dbckCartGerenc.Checked   := (qryFLGCARTGERENC.AsString = 'S');
   dbchRegCxComp.Checked    := (qryFLGREGIMECXCOMP.AsString = 'S');

   dbckStaRET.Checked       := (qrySTARET.AsString = 'S');

   ckbProvRV.Checked        := (qryFLGPROVISIONAIRRV.AsString = 'S');
   ckbProvRF.Checked        := (qryFLGPROVISIONAIRRF.AsString = 'S');

   dbckUsaSubConta.Checked  := (qryFLGUSASUBCONTA.AsString = 'S');
   dbchPlanPrevPatro.Checked:= (qryFLGPLANPREVCTBPAT.AsString = 'S');
   dbckIntFinLiq.Checked    := (qryFLGINTFINLIQ.AsString = 'S');

   chkRFEmAbertura.Checked  := (qryFLGRFEMABERTURA.AsString = 'S');
   dbckFlgPoupApropDia.Checked := (qryFLGPOUPAPROPDIA.AsString = 'S');
   dbcFlgEmpAcoes.Checked   := (qryFLGEMPACOES.AsString = 'S');
   //AL_26
   dbckContabDiaUtil.Checked := (qryFLGCONTABDIAUTIL.AsString = 'S');

   //AL_28
   chkFlgIntContabRF.Checked  := (qryFLGINTCONTABRF.AsString = 'S');
   chkFlgIntContabRV.Checked  := (qryFLGINTCONTABRV.AsString = 'S');
   chkFlgIntContabBMF.Checked := (qryFLGINTCONTABBMF.AsString = 'S');
   chkFlgIntContabFRF.Checked := (qryFLGINTCONTABFRF.AsString = 'S');
   chkFlgIntContabFRV.Checked := (qryFLGINTCONTABFRV.AsString = 'S');
   chkFlgIntContabFIM.Checked := (qryFLGINTCONTABFIM.AsString = 'S');
   chkFlgIntContabFDC.Checked := (qryFLGINTCONTABFDC.AsString = 'S');
   chkFlgIntContabFIP.Checked := (qryFLGINTCONTABFIP.AsString = 'S');
   //AL_36
   chkFlgIntContabOPI.Checked := (qryFLGINTCONTABOPI.AsString = 'S');

   pgcDetalhes.ActivePage := tbsSistema;
   pgcContFin.ActivePage := tbsContFinGeral;

end;

procedure TFrmParamInvest.sbtnAlterarClick(Sender: TObject);
begin
   inherited;
   if qryFLGDEMO.isNull then qryFLGDEMO.AsString := 'N';

   //AL_35
//   if (Pos('.CM',Sistema.NomeUsuario) <> 0) or
//      (AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk) then
   if AbrirFormModal(frmAutorizaParametros,TfrmAutorizaParametros) = mrOk then
   begin
      HabilitaTabSheets;

      //AL_30
//      dbdDtaFechRv.Enabled     := (Pos('.CM',Sistema.NomeUsuario) <> 0);
//      dtpDataUltImpCot.Enabled := (Pos('.CM',Sistema.NomeUsuario) <> 0);
//      dbdDtaFechRf.Enabled     := (Pos('.CM',Sistema.NomeUsuario) <> 0);
//      dbdDtaFechFdo.Enabled    := (Pos('.CM',Sistema.NomeUsuario) <> 0);
//      dtpUltFechEmp.Enabled    := (Pos('.CM',Sistema.NomeUsuario) <> 0);
//      dbdDtaFechBMF.Enabled    := (Pos('.CM',Sistema.NomeUsuario) <> 0);

      // Verifica se Existe Registro de Setor
      with qryAux do
      begin
         Close;
         sSql := 'Select SE.CodSetorEmissor from SetorEmissor SE';
         Sql.Clear;
         Sql.Add(sSql);
         Open;
         If not IsEmpty Then
         Begin
            DBEdMascara.Enabled:=False;
            DBEdMascara.Color  :=ClBtnFace;
         End
         Else
         Begin
            DBEdMascara.Enabled:=True;
            DBEdMascara.Color  :=ClWhite;
            Inherited;
         End;
         Close;
      end;
      // Verifica se Existe Registro Classificacao
      with qryAux do
      begin
         Close;
         sSql := 'SELECT CODCLASSINVEST FROM CLASSIFINVEST ';
         Sql.Clear;
         Sql.Add(sSql);
         Open;
         If not IsEmpty Then
         Begin
            DbMascClassif.Enabled:=False;
            DbMascClassif.Color  :=ClBtnFace;
         End
         Else
         Begin
            DbMascClassif.Enabled:=True;
            DbMascClassif.Color  :=ClWhite;
            Inherited;
        End;
        Close;
      end;
   end;
end;

procedure TFrmParamInvest.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
// Reabilita Mascara

   DBEdMascara.Enabled    :=True;
   DBEdMascara.Color      :=ClWhite;
   DbMascClassif.Enabled  :=True;
   DbMascClassif.Color    :=ClWhite;
   pgcDetalhes.ActivePage := tbsSistema;
   DesabilitaTabSheets;

end;

procedure TFrmParamInvest.DbMascClassifKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (key <> '9') and (key <> '.') and (key <> #8) then
   begin
      MessageBeep(0);
      ShowMessage('Digitar 9 ou . ');
      key := #0;
      Exit;
   end;
end;

procedure TFrmParamInvest.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   qry.Close;
   qryaux.Close;
   QryBuscaMoeda.Close;
   QryIndicador.Close;
   QryTpoDespInv.Close;
   qryTipoOperacao.Close;
   QryTipoContrato.Close;
   QryTipoCliente.Close;
   QryPrograma.Close;
   QryRamoFornecedor.Close;
   qryContraParte.Close;
   qryAutorizaOper.Close;
   QryClasseTitulo.Close;
   qryCarteiraInvest.Close;
   qryRegraEmpAcoes.Close;
   qryMotivoBloqueio.Close;
   qryPatroPlanPrevContab.Close;
   qryItemRenFix.Close;
   qryGrupoRegra.Close;
   qryTipoRegraRV.Close;
   qryTipoRegraRF.Close;
   qryTipoRegraBMF.Close;
   qryTipoRegraAtuarial.Close;
   qryTipoRegraRent.Close;
   qryMercadoBMF.Close;
   qryBuscaPendencia.Close;
   qryBolsaValores.Close;
   qryTipoInvestBMF.Close;
   qryTpPeriodicidade.Close;
   qryCustodiante.Close;
   qryTipoRegraOpcAc.Close;
   qryTipoRegraOpcInd.Close;
   qryTipoRegraEmpAc.Close;
   //AL_26
   qryMotBloqPenFdo.Close;
   qryCarteiraRF.Close;
end;

procedure TFrmParamInvest.FormCreate(Sender: TObject);
begin
  inherited;
   pgcDetalhes.ActivePage := tbsSistema;
end;

procedure TFrmParamInvest.HabilitaTabSheets;
var I: Integer;
begin
   pnlFundo.Enabled      := True;
   pnlFundo.Enabled      := True;
   pnlRVariavel.Enabled  := True;
   pnlSistema.Enabled    := True;

   pgcDetalhes.Enabled   := True;
   for I := 0 to pgcDetalhes.ControlCount -1 do
      if pgcDetalhes.Controls[I] is TTabSheet then
         TTabSheet(pgcDetalhes.Controls[I]).Enabled  := True;

   pgcSistema.Enabled   := True;
   for I := 0 to pgcSistema.ControlCount -1 do
      if pgcSistema.Controls[I] is TTabSheet then
         TTabSheet(pgcSistema.Controls[I]).Enabled   := True;

   //AL_28
   tbsIntContFin.Enabled := True;
   pnlIntContFinGeral.Enabled := True;
   pgcContFin.Enabled   := True;
   for I := 0 to pgcContFin.ControlCount -1 do
      if pgcContFin.Controls[I] is TTabSheet then
         TTabSheet(pgcContFin.Controls[I]).Enabled   := True;


   pgcRvariavel.Enabled   := True;
   for I := 0 to pgcRvariavel.ControlCount -1 do
      if pgcRvariavel.Controls[I] is TTabSheet then
         TTabSheet(pgcRvariavel.Controls[I]).Enabled := True;

end;

procedure TFrmParamInvest.DesabilitaTabSheets;
var I: Integer;
begin
   pnlFundo.Enabled      := True;
   pnlRVariavel.Enabled  := True;
   pnlSistema.Enabled    := True;

   //AL_15 - 19/01/2005
   dbLTipoFundo.Text              := '';
   chkFundosEmAbertura.DataField  := '';
   dblUsuarioProcFundos.DataField := '';
   chkFundosEmAbertura.Enabled    := False;
   dblUsuarioProcFundos.Enabled   := False;

   pgcDetalhes.Enabled   := True;
   for I := 0 to pgcDetalhes.ControlCount -1 do
      if pgcDetalhes.Controls[I] is TTabSheet then
         TTabSheet(pgcDetalhes.Controls[I]).Enabled  := False;

   tbsSistema.Enabled   := True;
   pgcSistema.Enabled   := True;
   for I := 0 to pgcSistema.ControlCount -1 do
      if pgcSistema.Controls[I] is TTabSheet then
         TTabSheet(pgcSistema.Controls[I]).Enabled   := False;

   //AL_28
   tbsIntContFin.Enabled := True;
   pnlIntContFinGeral.Enabled := False;
   pgcContFin.Enabled   := True;
   for I := 0 to pgcContFin.ControlCount -1 do
      if pgcContFin.Controls[I] is TTabSheet then
         TTabSheet(pgcContFin.Controls[I]).Enabled   := False;

   tbsRVariavel.Enabled := True;
   pgcRvariavel.Enabled := True;
   for I := 0 to pgcRvariavel.ControlCount -1 do
      if pgcRvariavel.Controls[I] is TTabSheet then
         TTabSheet(pgcRvariavel.Controls[I]).Enabled := False;

end;

procedure TFrmParamInvest.dbdDtaFechRfEnter(Sender: TObject);
begin
  inherited;
  dDataFechRF := dbdDtaFechRf.DateTime;
end;

procedure TFrmParamInvest.dblTipoRegraRVExit(Sender: TObject);
begin
  inherited;
   qryRegraEmpAcoes.Close;
   if Trim(dblTipoRegraRV.Text) = '' then
      qryRegraEmpAcoes.ParamByName('IDTIPOREGRA').Clear
   else
      qryRegraEmpAcoes.ParamByName('IDTIPOREGRA').AsInteger := StrToInt(dblTipoRegraRV.LookupValue);
   qryRegraEmpAcoes.Open;
end;

procedure TFrmParamInvest.dblTipoFundoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
var sCampoFundo: String;
begin
  inherited;
   //AL_15 - 19/01/2005
   if Trim(dbLTipoFundo.Text) <> '' then
   begin
      sCampoFundo                    := UFundoComum.LocalizaCampoFundo(StrToInt(dblTipoFundo.LookupValue));
      chkFundosEmAbertura.DataField  := 'FLGEMABERTURA'+sCampoFundo;
      dblUsuarioProcFundos.DataField := 'IDUSREMABERTURA'+sCampoFundo;
      chkFundosEmAbertura.Enabled    := True;
      dblUsuarioProcFundos.Enabled   := True;
   end;
end;

procedure TFrmParamInvest.dblTipoFundoChange(Sender: TObject);
begin
   inherited;
   //AL_15 - 19/01/2005
   if Trim(dbLTipoFundo.Text) = '' then
   begin
      chkFundosEmAbertura.DataField  := '';
      dblUsuarioProcFundos.DataField := '';
      chkFundosEmAbertura.Enabled    := False;
      dblUsuarioProcFundos.Enabled   := False;
   end;
end;

//AL_21
procedure TFrmParamInvest.dbchRegCxCompExit(Sender: TObject);
begin
  inherited;
   if not dbchRegCxComp.checked then
     qryDTAREGIMECXCOMP.Clear;
end;

//AL_2
procedure TFrmParamInvest.dbeMaskANBIDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (key <> '9') and (key <> '.') and (key <> #8) then
   begin
      MessageBeep(0);
      ShowMessage('Digitar 9 ou . ');
      key := #0;
      Exit;
   end;
end;

procedure TFrmParamInvest.chkRVEmAberturaClick(Sender: TObject);
begin
  inherited;
  // AL_24
  if not chkRVEmAbertura.Checked then
  begin
     if qry.State in [dsInsert, dsEdit] then
     begin
        qryIDUSUARIOPROCRV.Clear;
        dblUsuarioProcRV.Enabled := False;
        dblUsuarioProcRV.Text := '';
        dblUsuarioProcRV.PerformSearch;
     end;
  end
  else
     dblUsuarioProcRV.Enabled := True;
end;

procedure TFrmParamInvest.chkRFEmAberturaClick(Sender: TObject);
begin
  inherited;
  // AL_24
  if not chkRFEmAbertura.Checked then
  begin
     if qry.State in [dsInsert, dsEdit] then
     begin
        qryIDUSUARIOPROCRF.Clear;
        dblUsuarioProcRF.Enabled := False;
        dblUsuarioProcRF.Text := '';
        dblUsuarioProcRF.PerformSearch;
     end;
  end
  else
     dblUsuarioProcRF.Enabled := True;

end;

//AL_28
procedure TFrmParamInvest.VerModuloBloqueado(iModulo: Word; bIntegra: Boolean);
begin
   case iModulo of
   1: begin
         if not bIntegra then
         begin
            pnlMensBloqRF.Color := $007575FF;
            pnlMensBloqRF.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqRF.Color := $0097E18A;
            pnlMensBloqRF.Caption := 'Integra';
         end;
      end;
   2: begin
         if not bIntegra then
         begin
            pnlMensBloqRV.Color := $007575FF;
            pnlMensBloqRV.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqRV.Color := $0097E18A;
            pnlMensBloqRV.Caption := 'Integra';
         end;
      end;
   5: begin
         if not bIntegra then
         begin
            pnlMensBloqFRF.Color := $007575FF;
            pnlMensBloqFRF.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFRF.Color := $0097E18A;
            pnlMensBloqFRF.Caption := 'Integra';
         end;
      end;
   6: begin
         if not bIntegra then
         begin
            pnlMensBloqFRV.Color := $007575FF;
            pnlMensBloqFRV.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFRV.Color := $0097E18A;
            pnlMensBloqFRV.Caption := 'Integra';
         end;
      end;
   7: begin
         if not bIntegra then
         begin
            pnlMensBloqFIM.Color := $007575FF;
            pnlMensBloqFIM.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFIM.Color := $0097E18A;
            pnlMensBloqFIM.Caption := 'Integra';
         end;
      end;
   8: begin
         if not bIntegra then
         begin
            pnlMensBloqBMF.Color := $007575FF;
            pnlMensBloqBMF.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqBMF.Color := $0097E18A;
            pnlMensBloqBMF.Caption := 'Integra';
         end;
      end;
   9: begin
         if not bIntegra then
         begin
            pnlMensBloqFDC.Color := $007575FF;
            pnlMensBloqFDC.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFDC.Color := $0097E18A;
            pnlMensBloqFDC.Caption := 'Integra';
         end;
      end;
   10:begin
         if not bIntegra then
         begin
            pnlMensBloqFIP.Color := $007575FF;
            pnlMensBloqFIP.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqFIP.Color := $0097E18A;
            pnlMensBloqFIP.Caption := 'Integra';
         end;
      end;
   //AL_36
   11:begin
         if not bIntegra then
         begin
            pnlMensBloqOPI.Color := $007575FF;
            pnlMensBloqOPI.Caption := 'Não Integra';
         end
         else
         begin
            pnlMensBloqOPI.Color := $0097E18A;
            pnlMensBloqOPI.Caption := 'Integra';
         end;
      end;

   end;
end;

procedure TFrmParamInvest.VerBloqClick(Sender: TObject);
begin
  VerModuloBloqueado(TDBCheckBox(Sender).Tag, TDBCheckBox(Sender).Checked);
end;

procedure TFrmParamInvest.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  VerModuloBloqueado(1, qryFLGINTCONTABRF.AsString = 'S');
  VerModuloBloqueado(2, qryFLGINTCONTABRV.AsString = 'S');
  VerModuloBloqueado(5, qryFLGINTCONTABFRF.AsString = 'S');
  VerModuloBloqueado(6, qryFLGINTCONTABFRV.AsString = 'S');
  VerModuloBloqueado(7, qryFLGINTCONTABFIM.AsString = 'S');
  VerModuloBloqueado(8, qryFLGINTCONTABBMF.AsString = 'S');
  VerModuloBloqueado(9, qryFLGINTCONTABFDC.AsString = 'S');
  VerModuloBloqueado(10, qryFLGINTCONTABFIP.AsString = 'S');
  //AL_36
  VerModuloBloqueado(11, qryFLGINTCONTABOPI.AsString = 'S');
end;

//AL_37
procedure TFrmParamInvest.chkFundosEmAberturaClick(Sender: TObject);
var sCampoFundo: String;
begin
  inherited;
  if not chkFundosEmAbertura.Checked then
  begin
     if qry.State in [dsInsert, dsEdit] then
     begin
        sCampoFundo := UFundoComum.LocalizaCampoFundo(StrToInt(dblTipoFundo.LookupValue));
        qry.FindField('IDUSREMABERTURA'+sCampoFundo).Clear;

        dblUsuarioProcFundos.Text    := '';
        dblUsuarioProcFundos.PerformSearch;

        dblUsuarioProcFundos.Enabled := False;
     end;
  end
  else
     dblUsuarioProcFundos.Enabled := True;
end;

procedure TFrmParamInvest.dbsFatorCalcKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = '0' then begin
    key := #0;
  end;

end;

procedure TFrmParamInvest.CmeCadastroConfirma(Sender: TObject);
var iNumeroID: Integer;
begin
  inherited;

  // Kintana Nº1445208 SOL Nº166117  Otacilio ** Inicio **
  try
    if (Trim(dbcbxTipoDataDir.Text) = '') or (Trim(dtDataVigDir.Text) = '') then
      Exit;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

    dtmBaseDados.dbBaseDados.StartTransaction;
    iNumeroID := 0;

    qryaux.Close;
    qryaux.SQL.Clear;
    qryaux.SQL.Text := 'DELETE FROM CM.PARAMDATADIRETOS ' +
                       'WHERE DATAVIGENTE >= TO_DATE(' + QuotedStr(dtDataVigDir.Text) + ', ''DD/MM/YYYY'')';
    qryaux.ExecSQL;

    sSql := '';
    qryaux.Close;
    qryaux.SQL.Clear;
    iNumeroID := LeUltRegistro(nil, 'PARAMDATADIRETOS');
    sSql      := 'INSERT INTO CM.PARAMDATADIRETOS ' +
                 '(IDPARAMDATADIRETOS, '          +
                 'TPDATAVIGDIR, '                 +
                 'DATAVIGENTE) VALUES '          +
                 '(' + IntToStr(iNumeroID)       +
                 ',' + IntToStr(dbcbxTipoDataDir.ItemIndex) +
                 ', TO_DATE(' + QuotedStr(dtDataVigDir.Text) + ', ''DD/MM/YYYY''))';
    qryaux.SQL.Text := sSql;
    qryaux.ExecSQL;

    dtmBaseDados.dbBaseDados.Commit;
  except
    on E: Exception do
    begin
      dtmBaseDados.dbBaseDados.Rollback;
      MessageBox(Handle, PChar('Erro ao gravar histórico data vigencia. ' + E.Message), 'Atenção', MB_OK + MB_ICONWARNING);
    end;
  end;
  // Kintana Nº1445208 SOL Nº166117  Otacilio ** Fim **

end;

end.
