// ***************************** REGISTRO DE ALTERAÇÕES ************************
//N. Sol..........:
//N. Kintana......:
//Data............: 24/05/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Só permitr o dblckTipObjCloseUp do objeto, quando estiver na aba Objetos do Processo
//***************************************************************************************
//Rotina..........: Geral
//N. Sol..........: 49750
//N. Kintana......: 523171
//Data............: 29/09/2010
//Responsável.....: Paulo Nobre
//Descrição.......: Alteração de várias rotinas para a integração contábil
//************************************************************************************************
//Rotina..........: OnClick_OkDetalheEtapas()
//N. Sol..........: 131508
//N. Kintana......: 750182
//Data............: 19/03/2010
//Responsável.....: William Santos
//Descrição.......: Implementação de criticas para os detalhes das etapas.
//************************************************************************************************
//Rotina..........: FormCreate();
//N. Sol..........: 126260
//N. Kintana......: 658259
//Data............: 06/11/2009
//Responsável.....: William Santos
//Descrição.......: Implementado uma nova opção de escolha para as etapas do processo, "Outros".
//                  Foi comentado duas linhas de código para que a tela fique do tamanho correto.
//************************************************************************************************
//Rotina..........: CmeDetalheInsert(), CmeDetalheDelete().
//N. Sol..........: 125096
//N. Kintana......: 642941
//Data............: 20/10/2009
//Responsável.....: William Santos
//Descrição.......: Implemetado ajuste para corrigir a numeração do cadastro das etapas dos Processos de forma crescente.
//************************************************************************************************
//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                    pois não estava gravando valor das custas na hstetapaproctrab.
//************************************************************************************************
//Rotina..........: bbtnOkDetClick()
//N. Sol..........: 123299
//N. Kintana......: 615056
//Data............: 04/08/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para que a critica implementada no sol 122627 seja válida
//                  apenas para a aba etapas.
//*********************************************************************************
//Rotina..........: btnVerHistoricoEtapasClick
//N. Sol..........: 122630
//N. Kintana......: 604044
//Data............: 04/08/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Implementação para criação do histórico para custas lançadas na etapa de
//                  Recurso de Revista e Recurso Ordinário.
//*********************************************************************************
//Rotina..........: bbtnOkDetClick
//N. Sol..........: 122627
//N. Kintana......: 604045
//Data............: 03/08/2009
//Responsável.....: William Santos
//Descrição.......: Implementação de uma crítica para ver se Valor Informado Ao Lado, Se Houver, Refere-se a,
//                  esta preenchido ou não.
//*********************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------

Unit fCustomCadProcesso;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
   IvEMulti, MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls,
   Buttons, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, CMProcura,
   Mask, wwdblook, Wwdbspin, wwdbedit, TREdit, CMProcuraSubTipo, DBCtrls, ImgList, DBClient,
   wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, fCadastroMestreDetMT,
   uCMClientDataSet, uCtrlGlobalRH, uCtrlProcessoTrab, uCtrlVaraJustica, uCtrlListTerceirosRH,
   uCtrlTipRec, uCtrlPeriodo, uCtrlContab, uCtrlPessoaFuncionario, uCtrlTipObjeto, uCtrlMotivo,
   uCtrlTipProc, uCtrlTRT, uCtrlTipAcao, uCtrlTipSent, uCtrlCalcRub, uCtrlHonorarioProcesso,
   uCtrlEtapaProcesso, uCtrlHstObjProcTrab, uCtrlHstEtapaProcTrab, fCmReport, TB97Tlwn, math,
   Wwdbgrd2, Provider, Wwquery, uCtrlEtpDesdobramento, uCMMath, uCmControlObject, uCtrlCorrigeObjEtapasProc,
  uCmSqlParams;

Const
   // Constantes usadas para indicar se o cadastro irá integrar somente com o CAP ou
   // também com o CAR. esta informação depende do Módulo que está sendo usado.
   CAP = 0;
   CAPCAR = 1;

Type
   TfrmCustomCadProcesso = Class(TFrmCadastroMestreDetMT)
      dsEtapa: TwwDataSource;
      dsPartic: TwwDataSource;
      dsProcVinc: TwwDataSource;
      tbshContraparte: TTabSheet;
      tbshOutrosDados: TTabSheet;
      tbshEncer: TTabSheet;
      tbsEtapas: TTabSheet;
      tbshVinculos: TTabSheet;
      rgTipEncer: TDBRadioGroup;
      gbxAcordo: TGroupBox;
      sbspeParc: TwwDBSpinEdit;
      gbxDataEncer: TGroupBox;
      dbedEncerr: TCMDateTimePicker;
      gbxSent: TGroupBox;
      dblckTipSent: TwwDBLookupCombo;
      dbGrdEtapa: TwwDBGrid;
      pnlLigado: TPanel;
      Label37: TLabel;
      spbProcVinc: TSpeedButton;
      spbApagaVinc: TSpeedButton;
      dbedNumVinc: TDBEdit;
      gbxVinculados: TGroupBox;
      dbgdProcessosVinc: TwwDBGrid;
      tbsLitisconsortes: TTabSheet;
      pnlDet2: TPanel;
      dbgrDet2: TwwDBGrid;
      dsLitis: TwwDataSource;
      pnlEtapas: TPanel;
      MontaSelectCidade: TMontaSelect;
      dsUF: TwwDataSource;
      pgCtrlOutrosDados: TPageControl;
      tbshTipos: TTabSheet;
      tbshAdvogados: TTabSheet;
      tbshValores: TTabSheet;
      CMProcuraAdv1: TCMProcuraSubTipo;
      CMProcuraAdv2: TCMProcuraSubTipo;
      CMProcuraAssist: TCMProcuraSubTipo;
      Label34: TLabel;
      dblckAdvCasa: TwwDBLookupCombo;
      dbrgIndTaxaConv: TDBRadioGroup;
      gbxIndice: TGroupBox;
      gbxRegra: TGroupBox;
      dblckMoeda: TwwDBLookupCombo;
      dblckRegraNormal: TwwDBLookupCombo;
      tbshIntegracao: TTabSheet;
      MontaSelectFunc: TMontaSelect;
      sbtnProcurarLitis: TToolbarButton97;
      CdsDet: TCMClientDataSet;
      CdsEtapa: TCMClientDataSet;
      CdsHonorarios: TCMClientDataSet;
      CdsTipoDesemb: TCMClientDataSet;
      CdsTipoOper: TCMClientDataSet;
      CdsVara: TCMClientDataSet;
      CdsTipoDoc: TCMClientDataSet;
      CdsTipoEtapa: TCMClientDataSet;
      gbkTipoDesemb: TGroupBox;
      dblckTipoDesemb: TwwDBLookupCombo;
      gbxContabilizacao: TGroupBox;
      Label44: TLabel;
      Label45: TLabel;
      dblckTipOper: TwwDBLookupCombo;
      rgJuros: TRadioGroup;
      gbxCAPCAR: TGroupBox;
      Label46: TLabel;
      Label47: TLabel;
      dtPagamento: TCMDateTimePicker;
      dblckTipoDoc: TwwDBLookupCombo;
      CdsProcVinc: TCMClientDataSet;
      CdsUF: TCMClientDataSet;
      CdsTipoObj: TCMClientDataSet;
      CdsParamRH: TCMClientDataSet;
      CdsLitis: TCMClientDataSet;
      bbtnParcelamento: TBitBtn;
      CdsMotivo: TCMClientDataSet;
      CdsTipoProc: TCMClientDataSet;
      CdsTRT: TCMClientDataSet;
      CdsTipAcao: TCMClientDataSet;
      CdsAdvCasa: TCMClientDataSet;
      CdsMoeda: TCMClientDataSet;
      CdsRegra: TCMClientDataSet;
      CdsTipSent: TCMClientDataSet;
      GroupBox2: TGroupBox;
      dbedPrevEnc: TCMDateTimePicker;
      Label28: TLabel;
      Label14: TLabel;
      Label8: TLabel;
      dbreCusto: TDBRealEdit;
      redValorAtual: TRealEdit;
      dbreDespesa: TDBRealEdit;
      tbsInstancias: TTabSheet;
      sbtnFicha: TToolbarButton97;
      Label17: TLabel;
      Label15: TLabel;
      lblTRT: TLabel;
      dbedNumJCJ2: TDBEdit;
      dblckVara: TwwDBLookupCombo;
      Label26: TLabel;
      dbedNumTRT: TDBEdit;
      dblckVara2: TwwDBLookupCombo;
      Label27: TLabel;
      dbedNumTST: TDBEdit;
      dblckVara3: TwwDBLookupCombo;
      Label29: TLabel;
      dbedNumExec: TDBEdit;
      Label5: TLabel;
      dblckTipObj: TwwDBLookupCombo;
      lblValorReclamado: TLabel;
      dbedValRecl: TDBRealEdit;
      lblValReal: TLabel;
      dbedValReal: TDBRealEdit;
      Label39: TLabel;
      dbmemObserv: TDBMemo;
      Label20: TLabel;
      dblckTipoEtp: TwwDBLookupCombo;
      Label22: TLabel;
      dtedDataReal: TCMDateTimePicker;
      Label25: TLabel;
      mskedHora: TMaskEdit;
      Label41: TLabel;
      dbedAssunto: TDBEdit;
      Label42: TLabel;
      dbedValRec: TDBRealEdit;
      lblHonor: TLabel;
      redHonor: TRealEdit;
      Label43: TLabel;
      dbmObserv: TDBMemo;
      dbrgCategoria: TDBRadioGroup;
      gbxSitLitis: TGroupBox;
      lblSitLit: TLabel;
      dblckMotivoLit: TwwDBLookupCombo;
      Label1: TLabel;
      dbedNumProcesso: TDBEdit;
      Label30: TLabel;
      dbedNumJCJ: TDBEdit;
      Label2: TLabel;
      dbedDataAju: TCMDateTimePicker;
      Label19: TLabel;
      dbedDataNot: TCMDateTimePicker;
      rgSituacao: TDBRadioGroup;
      gbxSitContraparte: TGroupBox;
      lblSitContraparte: TLabel;
      dblckMotivoContraparte: TwwDBLookupCombo;
      gbxLitisconsorte: TGroupBox;
      spbtnProcLitisconsorte: TSpeedButton;
      edLitisconsorte: TEdit;
      Label3: TLabel;
      dbedPost: TCMDateTimePicker;
      gbxQuantContraparte: TGroupBox;
      spbtnCalcNumContraparte: TBitBtn;
      dbedQtde: TDBEdit;
      Label31: TLabel;
      dblckTipProc: TwwDBLookupCombo;
      Label33: TLabel;
      dblckTipAcao: TwwDBLookupCombo;
      Label35: TLabel;
      dbedPasta: TDBEdit;
      Label36: TLabel;
      ProcuraCidade: TCMProcura;
      Label21: TLabel;
      dbedUF: TwwDBEdit;
      gbxContraparte: TGroupBox;
      edNomeContraparte: TEdit;
      spbtnProcContraparte: TBitBtn;
      tbshHonor: TTabSheet;
      dbgrHonor: TwwDBGrid;
      pnlHonor: TPanel;
      dsHonor: TwwDataSource;
      CdsHonor: TCMClientDataSet;
      CdsAdvog: TCMClientDataSet;
      lblDataPagto: TLabel;
      lblFavorecido: TLabel;
      lblValorHonor: TLabel;
      dtPagamentoHonor: TCMDateTimePicker;
      dblckFavor: TwwDBLookupCombo;
      dbedValHon: TDBRealEdit;
      cbxSucumbencia: TCheckBox;
      lblAvisoHonor1: TLabel;
      lblAvisoEtapa1: TLabel;
      CdsImovel: TCMClientDataSet;
      CdsEventoImovel: TCMClientDataSet;
      bbtnSubstituirContraparte: TBitBtn;
      CdsOutroProc: TCMClientDataSet;
      townOutroProc: TToolWindow97;
      btnFecharDica: TBitBtn;
      dbgrOutroProc: TwwDBGrid;
      dsOutroProc: TwwDataSource;
      dbedNumVara: TwwDBEdit;
      Label4: TLabel;
      CdsCCusto: TCMClientDataSet;
      dblckCCusto: TwwDBLookupCombo;
      Label6: TLabel;
      gbxEstimativaOriginal: TGroupBox;
      Label40: TLabel;
      dbedValProbOrig: TDBRealEdit;
      gbxEstimativaAtual: TGroupBox;
      Label7: TLabel;
      dbedPerc: TDBRealEdit;
      Label24: TLabel;
      dbedValor: TDBRealEdit;
      lblValorOrig: TLabel;
      dbedValorOrig: TDBRealEdit;
      lblTaxaJuros: TLabel;
      dbredJuros: TDBRealEdit;
      dbdtJuros: TCMDateTimePicker;
      lblDataJuros: TLabel;
      redJuros: TDBRealEdit;
      lblDataAval: TLabel;
      dbedDataAval: TCMDateTimePicker;
      townHistObjeto: TToolWindow97;
      dbgrHistObjeto: TwwDBGrid;
      bbtnVerHistObjeto: TBitBtn;
      dsHistObjeto: TwwDataSource;
      CdsHistObjeto: TCMClientDataSet;
      CdsHistObjetoGravar: TCMClientDataSet;
      lblObservHistObjeto: TLabel;
      dbmemObservHist: TDBMemo;
      CMDateTimePicker1: TCMDateTimePicker;
      lblDataHoraIncl: TLabel;
      lblDataAltSit: TLabel;
      dbedDataAltSit: TCMDateTimePicker;
      dbedDataAltSitLitis: TCMDateTimePicker;
      lblAltSitLitis: TLabel;
      dbedCustas: TDBRealEdit;
      lblCustas: TLabel;
      btnContaBanc: TBitBtn;
      bbtnMulta: TBitBtn;
      dbrgIndCondenacao: TDBRadioGroup;
      bbtnCondenacao: TBitBtn;
      lblValorCondenacao: TLabel;
      dbredValorCondenacao: TDBRealEdit;
      dbrgIndHonor: TDBRadioGroup;
      redValorTotal: TDBRealEdit;
      lblNumSeqVinc: TLabel;
      dbedNumSeqVinc: TDBRealEdit;
      dbrgPagtoProv: TDBRadioGroup;
      lblDataPrev: TLabel;
      gbxCentroCustoCParte: TGroupBox;
      dblckCCustoCParte: TwwDBLookupCombo;
      gbxCentroCustoLitis: TGroupBox;
      dblckCCustoLitis: TwwDBLookupCombo;
      tbshHistAlter: TTabSheet;
      dsHistProcesso: TwwDataSource;
      CdsHistProcesso: TCMClientDataSet;
      dbgrdHistAlter: TwwDBGrid;
      CdsHistProcessoGravar: TCMClientDataSet;
      sbtnIncLitis: TToolbarButton97;
      SaveDlg: TSaveDialog;
      OpenDlg: TOpenDialog;
      lblArquivo: TLabel;
      pgbarProgresso: TProgressBar;
      btnVerHistoricoEtapas: TBitBtn;
      btnFechaHistEtapas: TBitBtn;
      townHistEtapa: TToolWindow97;
      cdsHistoricoEtapas: TCMClientDataSet;
      dsHistoricoEtapas: TDataSource;
      dtstprvdr1: TDataSetProvider;
      btnFecharHistObjeto: TBitBtn;
      AuxiEtapa: TwwQuery;
      AuxiEtapaNUMPROCTRAB: TFloatField;
      AuxiEtapaNUMSEQ: TFloatField;
      AuxiEtapaCODTIPORECURSO: TFloatField;
      AuxiEtapaIDIMAGEM: TFloatField;
      AuxiEtapaVALORREC: TFloatField;
      AuxiEtapaDATAPREVOCORR: TDateTimeField;
      AuxiEtapaDATAREALOCOR: TDateTimeField;
      AuxiEtapaOBSERVETAPA: TMemoField;
      AuxiEtapaASSUNTO: TStringField;
      AuxiEtapaTRGDTINCLUSAO: TDateTimeField;
      AuxiEtapaTRGUSERINCLUSAO: TStringField;
      AuxiEtapaFLGVALORABATE: TFloatField;
      AuxiEtapaIDINVESTIMENTO: TFloatField;
      AuxiEtapaIDCONJUNTO: TFloatField;
      AuxiEtapaIDIMOVEL: TFloatField;
      AuxiEtapaIDBEM: TFloatField;
      AuxiEtapaIDPESSOA: TFloatField;
      AuxiEtapaVALOR: TFloatField;
      AuxiEtapaINDPENHORA: TFloatField;
      AuxiEtapaINDVALOR: TFloatField;
      AuxiEtapaFLGIMPORTACAO: TFloatField;
      AuxiEtapaCODDOCUMENTO: TFloatField;
      AuxiEtapaIDPLANPREVCTBPATR: TFloatField;
      AuxiEtapaIDFUNDOINVEST: TFloatField;
      AuxiEtapaIDCBANCARIA: TFloatField;
      AuxiEtapaNUMSEQVINC: TFloatField;
      AuxiEtapaVALORMULTA: TFloatField;
      AuxiEtapaINDMULTA: TFloatField;
      AuxiEtapaFLGINVESTLIDO: TFloatField;
      AuxiEtapaVALORCUSTAS: TFloatField;
      AuxiEtapaVALORJUIZ: TFloatField;
      AuxiEtapaCODPORTADOR: TFloatField;
      AuxiEtapaVALORMULTAPAGA: TFloatField;
      AuxiEtapaDATAINIMULTA: TDateTimeField;
      AuxiEtapaDATAPAGMULTA: TDateTimeField;
      AuxiEtapaIDTIPOCOTA: TFloatField;
      AuxiEtapaIDTIPOINVEST: TFloatField;
      AuxiEtapaIDCUSTODIANTE: TFloatField;
      AuxiEtapaIDOPERRENFIXAPLIC: TFloatField;
      AuxiEtapaIDFIELDEPOS: TFloatField;
      AuxiEtapaIDSITPENHORA: TFloatField;
      AuxiEtapaETAPA: TStringField;
      AuxiEtapaVALORHONOR: TFloatField;
      AuxiEtapaFLGPENHORA: TFloatField;
      AuxiEtapaFLGENCERRAMENTO: TFloatField;
      AuxiEtapaTIPOPENH: TStringField;
      AuxiEtapaBEMPENHORADO: TStringField;
      AuxiEtapaDESCPENHORA: TStringField;
      qryAux: TwwQuery;
      qryAux1: TwwQuery;
      dbrgAbate: TDBRadioGroup;
      btnPenhora: TBitBtn;
      lblTipoDesconstituicao: TLabel;
      wwQuery1: TwwQuery;
      wwQuery1IDSEGREGACRITER: TFloatField;
      wwQuery1DESCRICAO: TStringField;
      wwQuery1ORDEM: TFloatField;
      wwQuery1FLGTIPOSEGREGA: TStringField;
      wwQuery1FLGTIPOCOTACAO: TStringField;
      wwQuery1TRGDTINCLUSAO: TDateTimeField;
      wwQuery1HITCODHIST: TStringField;
      wwQuery1IDPESSOA: TFloatField;
      wwQuery1TIPCODIGO: TStringField;
      wwDataSource1: TwwDataSource;
      lblTipOper: TLabel;
      dblckSubPrograma: TwwDBLookupCombo;
      qryRateioContabil: TwwQuery;
      qryRateioContabilPERCRATEIO: TFloatField;
      dsRateioContabil: TwwDataSource;
      LabelProg: TLabel;
      lkcbPrograma: TwwDBLookupCombo;
      bbRateio: TSpeedButton;
      qryRateioContabilPLANPRVCONTABPATRO: TStringField;
      dbgHisEtapas: TwwDBGrid;
      dbgPerc: TwwDBGrid2;
      CdsPartic: TCMClientDataSet;
      qryAuxVALORRECL: TFloatField;
      qryAuxPERCPROB: TFloatField;
      qryAuxVALORSENTENCA: TFloatField;
      qryAuxPERCORIG: TFloatField;
      qryAuxDATAAVAL: TDateTimeField;
      qryAuxTRGDTINCLUSAO: TDateTimeField;
      qryAuxJUROS: TFloatField;
      qryAuxCORRECAO: TFloatField;
      qryAuxIDTIPOPROC: TFloatField;
      qryAuxTIPCODIGO: TStringField;
      qryAuxFLGCONTABVLPRINC: TFloatField;
      qryAuxFLGTIPOLANCTO: TStringField;
      qryAuxDSCCONTABVLPRINC: TStringField;
      qryAuxDSCTIPOLANCTO: TStringField;
      qryAux1NUMPROCTRAB: TFloatField;
      qryAux1CODTIPOOBJETO: TFloatField;
      qryAux1VALORRECL: TFloatField;
      qryAux1PERCPROB: TFloatField;
      qryAux1PERCORIG: TFloatField;
      qryAux1VALORSENTENCA: TFloatField;
      qryAux1INDVALOR: TFloatField;
      qryAux1DATAINICIO: TDateTimeField;
      qryAux1DATAFINAL: TDateTimeField;
      qryAux1OBSERVACAO: TMemoField;
      qryAux1VALORPROVAVEL: TFloatField;
      qryAux1DESCRICAO: TStringField;
      qryAux1VALORORIG: TFloatField;
      qryAux1DATAAVAL: TDateTimeField;
      qryAux1IDTIPOPROC: TFloatField;
      qryAux1TIPCODIGO: TStringField;
      qryAux1FLGCONTABVLPRINC: TFloatField;
      qryAux1DSCCONTABVLPRINC: TStringField;
      qryAux1FLGCONTABENCERRADO: TFloatField;
      qryAux1DSCCONTABENCERRADO: TStringField;
      MontaSelectProcVinc: TMontaSelect;
      lblPortadorForma: TLabel;
      dblkPortadorForma: TwwDBLookupCombo;
    cdsPortadorFormaCAP: TCMClientDataSet;
    qryPortadorCAP: TCMSqlParams;
    qryTipoDoc: TCMSqlParams;

      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure CmeDetalheInsert(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure spbProcVincClick(Sender: TObject);
      Procedure spbApagaVincClick(Sender: TObject);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure bbtnVoltarDetClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure ProcuraCidadeValidaDados(Sender: TObject);
      Procedure dblckMoedaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      Procedure dblckRegraNormalCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet;
         modified: Boolean);
      Procedure dblckMotivoContraparteChange(Sender: TObject);
      Procedure dblckMotivoLitChange(Sender: TObject);
      Procedure sbtnProcurarLitisClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure CdsEtapaAfterScroll(DataSet: TDataSet);
      Procedure CdsEtapaBeforeEdit(DataSet: TDataSet);
      Procedure dsStateChange(Sender: TObject);
      Procedure CdsDetBeforeEdit(DataSet: TDataSet);
      Procedure CmeDetalheDelete(Sender: TObject);
      Procedure CmeCadastroAfterConfirma(Sender: TObject);
      Procedure CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
      Procedure CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
      Procedure dsDetStateChange(Sender: TObject);
      Procedure dsEtapaStateChange(Sender: TObject);
      Procedure dsLitisStateChange(Sender: TObject);
      Procedure bbtnParcelamentoClick(Sender: TObject);
      Procedure rgTipEncerChange(Sender: TObject);
      Procedure rgSituacaoChange(Sender: TObject);
      Procedure tbcDetalheChange(Sender: TObject);
      Procedure dbrgIndTaxaConvChange(Sender: TObject);
      Procedure dbedNumJCJExit(Sender: TObject);
      Procedure sbtnFichaClick(Sender: TObject);
      Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
      Procedure dbedPercChange(Sender: TObject);
      Procedure dbedValorChange(Sender: TObject);
      Procedure CmeDetalheEdit(Sender: TObject);
      Procedure spbtnProcLitisconsorteClick(Sender: TObject);
      Procedure dbreCustoChange(Sender: TObject);
      Procedure spbtnCalcNumContraparteClick(Sender: TObject);
      Procedure CdsBeforeInsert(DataSet: TDataSet);
      Procedure spbtnProcContraparteClick(Sender: TObject);
      Procedure dblckTipoEtpChange(Sender: TObject);
      Procedure btnPenhoraClick(Sender: TObject);
      Procedure CdsHonorBeforeDelete(DataSet: TDataSet);
      Procedure dsHonorStateChange(Sender: TObject);
      Procedure CdsHonorBeforeEdit(DataSet: TDataSet);
      Procedure cbxSucumbenciaClick(Sender: TObject);
      Procedure CdsEtapaAfterInsert(DataSet: TDataSet);
      Procedure CdsEtapaBeforePost(DataSet: TDataSet);
      Procedure CdsEtapaBeforeDelete(DataSet: TDataSet);
      Procedure dblckMotivoContraparteCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure bbtnSubstituirContraparteClick(Sender: TObject);
      Procedure CdsAfterScroll(DataSet: TDataSet);
      Procedure CmeCadastroConfirma(Sender: TObject);
      Procedure CmeCadastroCancel(Sender: TObject);
      Procedure btnFecharDicaClick(Sender: TObject);
      Procedure CdsBeforePost(DataSet: TDataSet);
      Procedure dbedValorOrigChange(Sender: TObject);
      Procedure dbedValProbOrigChange(Sender: TObject);
      Procedure btnFecharHistObjetoClick(Sender: TObject);

      //---Emerson KT 522313 SOL 112597 inicio. --//
      Procedure btnFechaHistEtapasClick(Sender: TObject);
      //---Emerson KT 522313 SOL 112597 Fim. --//

      Procedure btnFecharHistoObjetoClick(Sender: TObject);

      Procedure CdsDetAfterPost(DataSet: TDataSet);
      Procedure dbedDataAvalEnter(Sender: TObject);
      Procedure CdsDetBeforeDelete(DataSet: TDataSet);
      Procedure dblckMotivoLitCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure btnContaBancClick(Sender: TObject);
      Procedure bbtnMultaClick(Sender: TObject);
      Procedure dbrgIndCondenacaoChange(Sender: TObject);
      Procedure bbtnCondenacaoClick(Sender: TObject);
      Procedure pnlHonorEnter(Sender: TObject);
      Procedure dbrgIndHonorChange(Sender: TObject);
      Procedure CdsAfterPost(DataSet: TDataSet);
      Procedure sbtnApagarClick(Sender: TObject);
      Procedure sbtnIncLitisClick(Sender: TObject);
      Procedure bbtnVerHistObjetoClick(Sender: TObject);
      Procedure btnVerHistoricoEtapasClick(Sender: TObject);
      Procedure sbtnExcluiDetClick(Sender: TObject);
      Procedure dbedNumSeqVincChange(Sender: TObject);
      Procedure sbtnInsDetClick(Sender: TObject);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure dbedNumSeqVincExit(Sender: TObject);
      Procedure dblckTipObjCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
      Procedure bbRateioClick(Sender: TObject);

   Private
      iNumProcTrab: Double; //Renan Cristiano Sol Nº 126385 Kintana 6585269
      dValAntes, dValHonorAntes, IdImovelAntes, IdBemAntes, IdConjuntoAntes: double;
      IdVaraAntes, IdTipoAntes, IdParteAntes: double;
      DataDemissao, DataAvalAntes: TDate;
      sSubProgramaAnt, sNomeSubConta, sMascaraPlaConta: String;
      iProgramaAnt, iSituacao_Original, iNumSeqAtual, IdPatro, IdPlanoPrev: integer;
      bIntegraContab, bIntegraCAPCAR, // Indicam se a tela permite integração
      bFazContab, bFazCAPCAR, // Indicam se deverá ser feita a integração (quando o valor dos objetos é mudado)
      bAlterouValores, bOkDetalhe, bEncerrar, bExecutar, bExecutando, bExibeMensagens: boolean;

      Procedure HabilitarIntegracao;
      Procedure HabilitarPastaIntegracao;
      Procedure HabilitarBtProcVinc(Alterando: boolean);
      Procedure HabilitarTipoEncerramento(Situacao: integer; TipoEncerramento: String);

      Procedure MudarDadosCidade;

      Procedure IniciarValoresContabeis;
      Procedure AcharUltimoNumSeq;
      Procedure FormatarCampoCdsObjetos;
      Procedure CopiarDadosMontaSelect(MSOrigem, MSDestino: TMontaSelect);
      Procedure MontarMontaSelect;
      Procedure MudarParametrosTela;
      Procedure HabilitarDadosEncerramento(Situacao: integer);
      Procedure GravarIntegracao;
      Procedure Progresso(Args: Array Of Variant);
      Procedure FormCloseParamFichaProc(Sender: TObject; Var Action: TCloseAction);
      Procedure ImprimeFichaProc(Const NumProcesso, NomeContraparte, NossoAdv: String);
      Procedure VerificaEtapaExecucao;
      //
      Procedure AtualizaBEM(iSit: Integer; NumProc, NumSeq: double);
      Procedure AtualizaIMOVEL(sSit: String; NumProc, NumSeq: double);
      Procedure TestaSeDesconstituicao(NumProc2, NumSeq2: double);
      //
      Function GravarProcessoTrab: boolean;
      Function ExcluirProcessoTrab: boolean;
      Function TotalValorSentenca: double;
   Protected
      CtrlGlobalRH: TCtrlGlobalRH;
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      CtrlProcessoTrab: TCtrlProcessoTrab;
      CtrlEtpDesdobramento: TCtrlEtpDesdobramento;
      CtrlVaraJustica: TCtrlVaraJustica;
      CtrlTipRec: TCtrlTipRec;
      CtrlPessoaFuncionario: TCtrlPessoaFuncionario;
      CtrlTipObjeto: TCtrlTipObjeto;
      CtrlPeriodo: TCtrlPeriodo;
      CtrlContab: TCtrlContab;
      CtrlMotivo: TCtrlMotivo;
      CtrlTipProc: TCtrlTipProc;
      CtrlTRT: TCtrlTRT;
      CtrlTipAcao: TCtrlTipAcao;
      CtrlTipSent: TCtrlTipSent;
      CtrlHonorarioProcesso: TCtrlHonorarioProcesso;
      CtrlCalcRub: TCtrlCalcRub;
      CtrlEtapaProcesso: TCtrlEtapaProcesso;
      CtrlHstObjProcTrab: TCtrlHstObjProcTrab;

      //---Emerson KT 522313 SOL 112597 inicio. --//
      CtrlHstEtapaProcTrab: TCtrlHstEtapaProcTrab;
      //---Emerson KT 522313 SOL 112597 fim. --//

      CtrlCorrigeObjEtapasProc: TCtrlCorrigeObjEtapasProc;

      iTipoIntegraCAPCAR: integer;

      Procedure OnMudarParametrosTela; Virtual; Abstract;
      Procedure OnMudarDadosParticipante; Virtual;
      Function CriarTelaParamFichaProc: TForm; Virtual; Abstract;
      Function CriarFichaProc: TFrmCmReport; Virtual; Abstract;
      Procedure OnParamFichaProc(Frm: TForm); Virtual; Abstract;
      Procedure OnClick_ProcurarProcesso; Virtual; Abstract;
      Procedure OnClick_ProcurarProcessoComLitisconsortes; Virtual; Abstract;
      Function OnClick_OkDetalheLitisconsortes: boolean; Virtual;
      Function OnClick_OkDetalheObjetos: boolean; Virtual;
      Function OnClick_OkDetalheEtapas: boolean; Virtual;
      Function OnClick_OkDetalheHonor: boolean; Virtual;
      Procedure MudarNomeSubConta(Nome: String); Virtual;
      Function GetDataDemissao: TDate; Virtual;
   Public
      DataAjuizamento, DataNotificacao: TCMDateTimePicker;

      Procedure Sel(SelPrincipal: boolean; NumProcTrab: double);
   End;

Var
   frmCustomCadProcesso: TfrmCustomCadProcesso;
   ValorDesconstituicao: Double;
   sDesconstituicaoOK: String;

Implementation

Uses uCMTypes, uSistema, uMensErro, uCtrlFuncoesRH, uCtrlPadroes, uCtrlParamIntegra,
   fParcelaAcordoMT, fValorRealMT, fProcuraPessoaDoc, uCtrlUsoGeralRH, dCds,
   fCustomParamFichaProc, fAguarde, fCadRegPenhora, fCadRegContaBanc,
   fCadRegMulta, fCadRegCondenacao, FileCtrl, dBaseDados,
   fCadRateioContabil, fCadDepositoJudicial;

{$R *.DFM}

Procedure TfrmCustomCadProcesso.FormCreate(Sender: TObject);
Begin
   Inherited;
   sDesconstituicaoOK := '';
   sbtnIncLitis.Visible := (Sistema.IdModulo <> MODCON) And (Sistema.IdModulo <> PROCJUD);

   CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
      Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlProcessoTrab.InitializeAs(Padroes);
   CtrlProcessoTrab.CdsProcesso := Cds;
   CtrlProcessoTrab.CdsLitisconsortes := CdsLitis;
   CtrlProcessoTrab.CdsObjetos := CdsDet;
   CtrlProcessoTrab.CdsEtapas := CdsEtapa;
   CtrlProcessoTrab.CdsHonorarios := CdsHonorarios;
   CtrlProcessoTrab.CdsHonor := CdsHonor;
   CtrlProcessoTrab.CdsHistProcesso := CdsHistProcessoGravar;
   CtrlProcessoTrab.AssociarCdsImovel(CdsImovel, CdsEventoImovel);
   CtrlProcessoTrab.Progresso := Progresso;

   CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlEtapaProcesso.InitializeAs(Padroes);

   //---Emerson KT 522313 SOL 112597 inicio. --//
   CtrlHstEtapaProcTrab := TCtrlHstEtapaProcTrab.Create;
   CtrlHstEtapaProcTrab.InitializeAs(Padroes);
   CtrlHstEtapaProcTrab.CdsHstetapaproctrab := cdsHistoricoEtapas;
   cdsHistoricoEtapas.Data := CtrlHstEtapaProcTrab.SelecionaHstetapaproctrab(-1, -1, -1); // aqui tá dando pau
   //---Emerson KT 522313 SOL 112597 fim. --//

   CtrlHstObjProcTrab := TCtrlHstObjProcTrab.Create;
   CtrlHstObjProcTrab.InitializeAs(Padroes);
   CtrlHstObjProcTrab.CdsHistObjeto := CdsHistObjetoGravar;
   CdsHistObjetoGravar.Data := CtrlHstObjProcTrab.ListGeral(-1, -1, 0);

   CdsHistProcessoGravar.Data := CtrlProcessoTrab.ListHistAlterDoProcesso(-1);

   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);

   CtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlHonorarioProcesso.InitializeAs(Padroes);

   CtrlVaraJustica := TCtrlVaraJustica.Create;
   CtrlVaraJustica.InitializeAs(Padroes);

   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlListTerceirosRH.InitializeAs(Padroes);

   CtrlTipRec := TCtrlTipRec.Create;
   CtrlTipRec.InitializeAs(Padroes);

   CtrlPessoaFuncionario := TCtrlPessoaFuncionario.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlPessoaFuncionario.InitializeAs(Padroes);

   CtrlTipObjeto := TCtrlTipObjeto.Create;
   CtrlTipObjeto.InitializeAs(Padroes);

   CtrlMotivo := TCtrlMotivo.Create;
   CtrlMotivo.InitializeAs(Padroes);

   CtrlTRT := TCtrlTRT.Create;
   CtrlTRT.InitializeAs(Padroes);

   CtrlTipProc := TCtrlTipProc.Create;
   CtrlTipProc.InitializeAs(Padroes);

   CtrlTipSent := TCtrlTipSent.Create;
   CtrlTipSent.InitializeAs(Padroes);

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.InitializeAs(Padroes);

   CtrlTipAcao := TCtrlTipAcao.Create;
   CtrlTipAcao.InitializeAs(Padroes);

   CtrlCalcRub := TCtrlCalcRub.Create;
   CtrlCalcRub.InitializeAs(Padroes);
   CtrlCalcRub.IdEmpresa := Sistema.IdEmpresa;

   CtrlContab := TCtrlContab.Create;
   CtrlContab.InitializeAs(Padroes);
   CtrlContab.SelecionaParametros(Sistema.IdEmpresa);

   frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);

   CdsParamRH.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT, INDCONTABJUR, FLGCRIASUBCONTA, FLGPERCPROB, MOEDAPROCTRAB, DATAVIGENCIAOBJ');
   CdsTipoEtapa.Data := CtrlTipRec.ListTipRec;

   CdsTipoObj.Data := CtrlTipObjeto.ListTipObjeto;

   CdsMotivo.Data := CtrlMotivo.ListMotivo_Id_e_Descricao('O');
   CdsTRT.Data := CtrlTRT.ListTRT;
   CdsVara.Data := CtrlVaraJustica.ListVaraJustica;
   CdsTipAcao.Data := CtrlTipAcao.ListTipAcao;
   CdsAdvCasa.Data := CtrlListTerceirosRH.ListUsuarioSistema;
   CdsMoeda.Data := CtrlListTerceirosRH.ListMoeda;
   CdsRegra.Data := CtrlListTerceirosRH.ListRegras;
   CdsTipSent.Data := CtrlTipSent.ListTipSent;
   CdsImovel.Data := CtrlListTerceirosRH.ListImovel;
   CdsEventoImovel.Data := CtrlListTerceirosRH.ListEventoImovelVazio;
   CdsCCusto.Data := CtrlListTerceirosRH.ListCCusto(IntToStr(Sistema.IdEmpresa));

   CdsTipoProc.Data := CtrlListTerceirosRH.ListTipProcJUR(0);
   CdsTipoOper.Data := CtrlListTerceirosRH.ListTipoOperacaoJUR;

   CtrlCorrigeObjEtapasProc := TCtrlCorrigeObjEtapasProc.Create;
   CtrlCorrigeObjEtapasProc.InitializeAs(Padroes);

   bIntegraContab := (CdsParamRH.FieldByName('FLGINTEGRACONT').asInteger = 1) And
      (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));

   MudarParametrosTela;
   //   HabilitarIntegracao;
   Sel(true, -1);

   tbshIntegracao.TabVisible := false;
   pgCtrlOutrosDados.ActivePageIndex := 0;
   ValorDesconstituicao := 0;
   bbRateio.Enabled := False;
   dbgPerc.visible := False;
End;

Procedure TfrmCustomCadProcesso.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlProcessoTrab);
   FreeAndNil(CtrlEtapaProcesso);
   FreeAndNil(CtrlHonorarioProcesso);
   FreeAndNil(CtrlHstObjProcTrab);
   FreeAndNil(CtrlVaraJustica);
   FreeAndNil(CtrlGlobalRH);
   FreeAndNil(CtrlTipProc);
   FreeAndNil(CtrlPeriodo);
   FreeAndNil(CtrlContab);
   FreeAndNil(CtrlListTerceirosRH);
   FreeAndNil(CtrlTipRec);
   FreeAndNil(CtrlTipSent);
   FreeAndNil(CtrlMotivo);
   FreeAndNil(CtrlTipObjeto);
   FreeAndNil(CtrlPessoaFuncionario);
   FreeAndNil(CtrlTRT);
   FreeAndNil(CtrlTipAcao);
   FreeAndNil(CtrlCalcRub);
   FreeAndNil(frmProcuraPessoaDoc);

   If Assigned(frmCadRegPenhora) Then
      FreeAndNil(frmCadRegPenhora);

   If Assigned(frmCadDepositoJudicial) Then
      FreeAndNil(frmCadDepositoJudicial);

   FreeAndNil(CtrlCorrigeObjEtapasProc);

   Inherited;
End;

Procedure TfrmCustomCadProcesso.CmeCadastroFind(Sender: TObject);
Begin
   Inherited;
   If (MontaSelect.RetornouValor) Then
      Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
End;

Procedure TfrmCustomCadProcesso.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
   Inherited;
   sbtnProcurarLitis.Enabled := (Cds.State = dsBrowse);
   sbtnFicha.Enabled := Not (Cds.IsEmpty) And (Cds.State = dsBrowse);
End;

Procedure TfrmCustomCadProcesso.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   Sel(false, -1);

   Cds.FieldByName('FLGSITPROC').asInteger := 0;
   Cds.FieldByName('CUSTOPROC').asInteger := 0;
   Cds.FieldByName('DESPESAPROC').asInteger := 0;
   Cds.FieldByName('DATAPREVENCER').asDateTime := Date + Round(365.25 * 5);
   Cds.FieldByName('FLGPARTEATIVA').asInteger := 0;
   Cds.FieldByName('MOEDAPROCTRAB').asFloat := CdsParamRH.FieldByName('MOEDAPROCTRAB').asFloat;
   Cds.FieldByName('TAXAJUROS').asFloat := 1;

   // Caso a moeda indicada
   If (CdsParamRH.FieldByName('MOEDAPROCTRAB').IsNull) Then
      Cds.FieldByName('INDTAXACONV').asInteger := 2 // nenhuma
   Else
      Begin
         Cds.FieldByName('INDTAXACONV').asInteger := 0; // Índice
         Cds.FieldByName('MOEDAPROCTRAB').asFloat := CdsParamRH.FieldByName('MOEDAPROCTRAB').asFloat;
      End;

   CtrlProcessoTrab.ZerarValoresProcesso;
   iNumSeqAtual := 0;
   bAlterouValores := false;
End;

Procedure TfrmCustomCadProcesso.CmeDetalheInsert(Sender: TObject);
Begin
   Inherited;
   If (pgctrlDetalhe.ActivePage = tbsDet) Then
      Begin
         CdsDet.FieldByName('VALORSENTENCA').asFloat := 0;
         dbedValor.Value := CdsDet.FieldByName('VALORPROVAVEL').asFloat;
         CdsDet.FieldByName('DATAAVAL').asDateTime := Date;
         CdsDet.FieldByName('DATAINICIO').asDateTime := Date;
      End
   Else
      If (pgctrlDetalhe.ActivePage = tbsEtapas) Then
         Begin
            btnPenhora.Enabled := False;

            //William M. Santos - SOL nº 125096 KINTANA nº 642491 - INI
            If CdsEtapa.RecordCount = 0 Then
               iNumSeqAtual := 1
            Else
               Inc(iNumSeqAtual);
            CdsEtapa.FieldByName('NUMSEQ').asInteger := iNumSeqAtual;
            //William M. Santos - SOL nº 125096 KINTANA nº 642491 - FIM
         End
      Else
         If (pgctrlDetalhe.ActivePage = tbshHonor) Then
            CdsHonor.FieldByName('DATAPAGTOHONOR').asDateTime := Date;
End;

Procedure TfrmCustomCadProcesso.CmeDetalheEdit(Sender: TObject);
Begin
   Inherited;
   dbedPercChange(Sender);
End;

Procedure TfrmCustomCadProcesso.CmeDetalheDelete(Sender: TObject);
Var
   iNumSeq: integer; //William M. Santos - SOL nº 125096 KINTANA nº 642491
Begin
   If (pgctrlDetalhe.ActivePage = tbsEtapas) And
      (CdsHonorarios.Locate('NUMSEQ', CdsEtapa.FieldByName('NUMSEQ').asInteger, [])) Then
      CdsHonorarios.Delete;

   //William M. Santos - SOL nº 125096 KINTANA nº 642491 - FIM
   If (pgctrlDetalhe.ActivePage = tbsEtapas) Then
      Begin
         iNumSeq := CdsEtapa.FieldByName('NUMSEQ').asInteger;
         If iNumSeq >= iNumSeqAtual Then
            Dec(iNumSeqAtual);
      End;
   //William M. Santos - SOL nº 125096 KINTANA nº 642491 - FIM}
   Inherited;
End;

Procedure TfrmCustomCadProcesso.CmeCadastroAfterConfirma(Sender: TObject);
Begin
   //inherited;
End;

Procedure TfrmCustomCadProcesso.CmeCadastroApplyInsert(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := GravarProcessoTrab;
End;

Procedure TfrmCustomCadProcesso.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := GravarProcessoTrab;
End;

Procedure TfrmCustomCadProcesso.CmeCadastroApplyDelete(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   Accept := ExcluirProcessoTrab;
End;

Procedure TfrmCustomCadProcesso.dsStateChange(Sender: TObject);
Var
   bAlterando: boolean;
Begin
   Inherited;
   bAlterando := (Cds.State In [dsInsert, dsEdit]);

   HabilitarBtProcVinc(bAlterando);
   ProcuraCidade.Enabled := bAlterando;
   CMProcuraAdv1.Enabled := bAlterando;
   CMProcuraAdv2.Enabled := bAlterando;
   CMProcuraAssist.Enabled := bAlterando;
   spbtnCalcNumContraparte.Enabled := bAlterando;

   If (bAlterando) And (dbedNumJCJ.CanFocus) Then
      dbedNumJCJ.SetFocus;
End;

Procedure TfrmCustomCadProcesso.dsLitisStateChange(Sender: TObject);
Begin
   If (CdsLitis.State In [dsInsert, dsEdit]) Then
      Begin
         If (CdsLitis.FieldByName('IDPESSOA').IsNull) Then
            edLitisconsorte.Text := ''
         Else
            edLitisconsorte.Text := CdsLitis.FieldByName('NOME').asString;

         dblckMotivoLitChange(Sender);

         dbredValorCondenacao.Visible := (CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 3) And (rgSituacao.ItemIndex = 1);
         lblValorCondenacao.Visible := (CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 3) And (rgSituacao.ItemIndex = 1);

      End;
End;

Procedure TfrmCustomCadProcesso.dsDetStateChange(Sender: TObject);
Begin
   Inherited;
   If (CdsDet.State In [dsInsert, dsEdit]) And (dblckTipObj.CanFocus) Then
      dblckTipObj.SetFocus;
End;

Procedure TfrmCustomCadProcesso.dsEtapaStateChange(Sender: TObject);
Begin
   If (CdsEtapa.State In [dsInsert, dsEdit]) And (dblckTipoEtp.CanFocus) Then
      dblckTipoEtp.SetFocus;
End;

Procedure TfrmCustomCadProcesso.CdsBeforeInsert(DataSet: TDataSet);
Begin
   Cds.Data := CtrlProcessoTrab.ListProcesso(-1);
   Inherited;
End;

Procedure TfrmCustomCadProcesso.CdsEtapaAfterScroll(DataSet: TDataSet);
Begin
   dtedDataReal.Text := '';
   mskedHora.Text := '';
   If Not (CdsEtapa.FieldByName('DATAREALOCOR').IsNull) Then
      Begin
         dtedDataReal.Date := StrToDate(DateToStr(CdsEtapa.FieldByName('DATAREALOCOR').asDateTime));
         mskedHora.Text := Copy(CdsEtapa.FieldByName('DATAREALOCOR').asString, 12, 5);
      End;
End;

Procedure TfrmCustomCadProcesso.CdsDetBeforeEdit(DataSet: TDataSet);
Begin
   If (CdsDet.FieldByName('VALORSENTENCA').asFloat = 0) Then
      dValAntes := CdsDet.FieldByName('VALORPROVAVEL').asFloat
   Else
      dValAntes := CdsDet.FieldByName('VALORSENTENCA').asFloat;
End;

Procedure TfrmCustomCadProcesso.CdsEtapaBeforeEdit(DataSet: TDataSet);
Begin
   dValAntes := CdsEtapa.FieldByName('VALORCUSTAS').asFloat;
   IdImovelAntes := CdsEtapa.FieldByName('IDIMOVEL').asFloat;
End;

Procedure TfrmCustomCadProcesso.dbedPercChange(Sender: TObject);
Begin
   If (CdsDet.State In [dsInsert, dsEdit]) Then
      Try
         dbedValor.OnChange := Nil;
         dbedValor.Value := roundCM((dbedValRecl.Value * dbedPerc.Value) / 100, 2);
         If (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) Then // sobre Estim.Original
            dbedValor.Value := roundCM((dbedValor.Value * dbedValProbOrig.Value) / 100, 2);
         dbedValor.OnChange := dbedValorChange;
      Except

      End;
End;

Procedure TfrmCustomCadProcesso.dbedValorChange(Sender: TObject);
Begin
   If (CdsDet.State In [dsInsert, dsEdit]) Then
      Try
         dbedPerc.OnChange := Nil;
         dbedPerc.Value := roundCM((dbedValor.Value * 100) / dbedValRecl.Value, 4);
         If (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) Then // sobre Estim.Original
            dbedPerc.Value := roundCM((dbedValor.Value * 100) / dbedValorOrig.Value, 4);
         dbedPerc.OnChange := dbedPercChange;
      Except
      End;
End;

Procedure TfrmCustomCadProcesso.dbedValorOrigChange(Sender: TObject);
Begin
   Inherited;
   If (CdsDet.State In [dsInsert, dsEdit]) Then
      Try
         dbedValProbOrig.Value := FU.Arredondar((dbedValorOrig.Value * 100) / dbedValRecl.Value, 4);
      Except
      End;
End;

Procedure TfrmCustomCadProcesso.dbedValProbOrigChange(Sender: TObject);
Begin
   Inherited;
   If (CdsDet.State In [dsInsert, dsEdit]) Then
      Try
         dbedValorOrig.Value := FU.Arredondar((dbedValRecl.Value * dbedValProbOrig.Value) / 100, 4);
      Except
      End;
End;

Procedure TfrmCustomCadProcesso.rgSituacaoChange(Sender: TObject);
Var
   bOk: boolean;
Begin
   If (Cds.State <> dsEdit) Or (iSituacao_Original = rgSituacao.ItemIndex) Then
      exit;

   If (rgSituacao.ItemIndex = 0) Then
      Begin
         bOk := (MsgDlg('Deseja Reabrir o Processo?', 'Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes);

         If (bOk) Then
            Begin
               Cds.FieldByName('FLGSITPROC').asInteger := 0;
               Cds.FieldByName('DATAEFETENC').Clear;
               bbtnConfirmarClick(rgSituacao);
            End
         Else
            Begin
               rgSituacao.OnChange := Nil;
               rgSituacao.ItemIndex := 1;
               rgSituacao.OnChange := rgSituacaoChange;
            End;
      End
   Else
      Begin
         bOk := (MsgDlg('Deseja Encerrar o Processo?', 'Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes);

         If (bOk) Then
            Begin
               Cds.FieldByName('DATAEFETENC').asDateTime := Date;
               rgTipEncer.ItemIndex := 0;

               tb97BotoesDetalhe.Visible := false;
               pgctrlDetalhe.ActivePage := tbshEncer;
               tbcDetalhe.TabIndex := 7;
               tbcDetalhe.Repaint;
               tbcDetalheChange(Sender);

               bAlterouValores := true;
               CtrlProcessoTrab.ZerarValoresProcesso;
            End
         Else
            Begin
               bbtnCancelarClick(rgSituacao);
               rgSituacao.OnChange := Nil;
               rgSituacao.ItemIndex := 0;
               rgSituacao.OnChange := rgSituacaoChange;
            End;
      End;

   If (bOk) Then
      Begin
         iSituacao_Original := rgSituacao.ItemIndex;
         HabilitarDadosEncerramento(rgSituacao.ItemIndex);
         //         HabilitarPastaIntegracao;
      End;
End;

Procedure TfrmCustomCadProcesso.dbreCustoChange(Sender: TObject);
Begin
   Inherited;
   // Somente para ser sobreposto nas classes-filho
End;

Procedure TfrmCustomCadProcesso.dblckMotivoContraparteChange(Sender: TObject);
Begin
   If (Trim(dblckMotivoContraparte.Text) = '') Then
      lblSitContraparte.Caption := 'Normal'
   Else
      lblSitContraparte.Caption := 'Excl. Por';

   dbedDataAltSit.Enabled := (Trim(dblckMotivoContraparte.Text) <> '');
End;

Procedure TfrmCustomCadProcesso.dblckMotivoContraparteCloseUp(
   Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If (modified) And (Cds.State <> dsBrowse) Then
      Begin
         If (Trim(dblckMotivoContraparte.Text) <> '') Then
            Cds.FieldByName('DATAALTSIT').asString := DateToStr(Date)
         Else
            Cds.FieldByName('DATAALTSIT').Clear;
      End;

   If (modified) And (Trim(dblckMotivoContraparte.Text) <> '') And (Not CdsLitis.IsEmpty) And
      (MsgDlg('Deseja Substituir a Contraparte por um Litisconsorte ?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
         // Rotina de Substituição da Contraparte
         bbtnSubstituirContraparte.Visible := True;
         pgctrlDetalhe.ActivePage := tbsLitisconsortes;
         tbcDetalhe.TabIndex := 1;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);
         MsgDlg('Selecione o Litisconsorte Desejado e Clique "Substituir Contraparte".',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
      End;
End;

Procedure TfrmCustomCadProcesso.dblckMotivoLitChange(Sender: TObject);
Begin
   If (Trim(dblckMotivoLit.Text) = '') Then
      lblSitLit.Caption := 'Normal'
   Else
      lblSitLit.Caption := 'Excl. Por';

   dbedDataAltSitLitis.Enabled := (Trim(dblckMotivoLit.Text) <> '');
End;

Procedure TfrmCustomCadProcesso.dbrgIndTaxaConvChange(Sender: TObject);
Begin
   gbxIndice.Visible := (dbrgIndTaxaConv.ItemIndex = 0);
   gbxRegra.Visible := (dbrgIndTaxaConv.ItemIndex = 1);
   If (Cds.State In [dsInsert, dsEdit]) Then
      Begin
         If Not (gbxIndice.Visible) Then
            Cds.FieldByName('MOEDAPROCTRAB').Clear;
         If Not (gbxRegra.Visible) Then
            Cds.FieldByName('IDREGRA').Clear;
      End;
   dbreCustoChange(Nil);
End;

Procedure TfrmCustomCadProcesso.rgTipEncerChange(Sender: TObject);
Begin
   dbrgIndCondenacao.Visible :=
      (bExecutando) Or (bExecutar) Or
      ((rgTipEncer.ItemIndex In [1, 3]) And
      ((Cds.FieldByName('FLGSITPROC').asInteger = 1) Or (rgSituacao.ItemIndex = 1)) And
      (CtrlProcessoTrab.ContaNossaLitisconsorte(Cds.FieldByName('NumProcTrab').asFloat) > 0));

   If (Cds.State In [dsInsert, dsEdit]) Then
      Begin
         If Not (CdsDet.IsEmpty) And (rgTipEncer.ItemIndex In [1, 3]) Then
            Begin
               If (TfrmValorRealMT.ExibirCalculoValorReal(CdsDet)) Then
                  Begin
                     // Atualizar custo do processo somando todos os valores dos objetos
                     Cds.FieldByName('CUSTOPROC').asFloat := 0;
                     CdsDet.First;
                     While Not (CdsDet.EOF) Do
                        Begin
                           Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
                              CdsDet.FieldByName('VALORSENTENCA').asFloat;
                           CdsDet.Next;
                        End;
                     CdsDet.First;

                     // Atualizar custo do processo subtraindo todos os valores das etapas
                     CdsEtapa.First;
                     While Not (CdsEtapa.EOF) Do
                        Begin
                           Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
                              CdsEtapa.FieldByName('VALORCUSTAS').asFloat;
                           CdsEtapa.Next;
                        End;
                     CdsEtapa.First;

                     // Custo do processo não pode ficar negativo
                     If (Cds.FieldByName('CUSTOPROC').asFloat < 0) Then
                        Cds.FieldByName('CUSTOPROC').asFloat := 0;

                     FormatarCampoCdsObjetos;
                     bAlterouValores := true;
                  End
               Else
                  MsgDlg('Não Esqueça de Atualizar os Valores Reais dos Objetos.',
                     'Aviso', mtInformation, [mbOk, mbHelp], 0);
            End;
         HabilitarTipoEncerramento(rgSituacao.ItemIndex, rgTipEncer.Values[rgTipEncer.ItemIndex]);
      End;
End;

Procedure TfrmCustomCadProcesso.tbcDetalheChange(Sender: TObject);
Begin
   Inherited;
   Dock973.Visible := (tbcDetalhe.detdbGrids[tbcDetalhe.TabIndex] <> '');
   bbtnVerHistObjeto.Visible := (tbcDetalhe.TabIndex = 3) And (Not CdsDet.Eof);
   //---Emerson KT 522313 SOL 112597 inicio. --//
   btnVerHistoricoEtapas.Visible := (tbcDetalhe.TabIndex = 4) And (Not CdsDet.Eof);
   //---Emerson KT 522313 SOL 112597 Fim ------//
End;

Procedure TfrmCustomCadProcesso.ProcuraCidadeValidaDados(Sender: TObject);
Begin
   MudarDadosCidade;
End;

Procedure TfrmCustomCadProcesso.dblckMoedaCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   If (Modified) Then
      dbreCustoChange(Nil);
End;

Procedure TfrmCustomCadProcesso.dblckRegraNormalCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   If (Modified) Then
      dbreCustoChange(Nil);
End;

Procedure TfrmCustomCadProcesso.dbedNumJCJExit(Sender: TObject);
Begin
   Inherited;
   If (ds.State = dsInsert) And (Trim(dbedNumJCJ.Text) <> '') Then
      If (CtrlProcessoTrab.VerificaNumProcesso(Trim(dbedNumJCJ.Text))) Then
         MsgDlg('Existe Processo com esse número.' + CR_LF +
            'Sugiro verificar em Consulta Processo de Qualquer Matéria',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
End;

Procedure TfrmCustomCadProcesso.spbtnCalcNumContraparteClick(Sender: TObject);
Begin
   CtrlProcessoTrab.SetNumContraparte;
End;

Procedure TfrmCustomCadProcesso.spbtnProcLitisconsorteClick(Sender: TObject);
Begin
   If (CdsLitis.State In [dsInsert, dsEdit]) And (frmProcuraPessoaDoc.ShowModal = mrOk) Then
      Begin
         If (CdsLitis.State = dsInsert) Then
            Begin
               CdsOutroProc.Data := CtrlProcessoTrab.VerificaContraParte(frmProcuraPessoaDoc.sIDPessoa);
               If Not (CdsOutroProc.IsEmpty) Then
                  Begin
                     townOutroProc.Top := 200;
                     townOutroProc.BringToFront;
                     townOutroProc.Visible := true;
                     Self.Enabled := false;
                  End;
            End;
         CdsLitis.FieldByName('IDPESSOA').asString := frmProcuraPessoaDoc.sIDPessoa;
         edLitisconsorte.Text := frmProcuraPessoaDoc.sNomePessoa;
      End;
End;

Procedure TfrmCustomCadProcesso.spbtnProcContraparteClick(Sender: TObject);
Begin
   If (Cds.State In [dsInsert, dsEdit]) And (frmProcuraPessoaDoc.ShowModal = mrOk) Then
      Begin
         If (Cds.State = dsInsert) Then
            Begin
               CdsOutroProc.Data := CtrlProcessoTrab.VerificaContraParte(frmProcuraPessoaDoc.sIDPessoa);
               If Not (CdsOutroProc.IsEmpty) Then
                  Begin
                     townOutroProc.Top := 200;
                     townOutroProc.BringToFront;
                     townOutroProc.Visible := true;
                     Self.Enabled := false;
                  End;
            End;
         Cds.FieldByName('IDRECLAMANTE').asString := frmProcuraPessoaDoc.sIDPessoa;
         OnMudarDadosParticipante;
         MudarNomeSubConta(edNomeContraparte.Text);
      End;
End;

Procedure TfrmCustomCadProcesso.btnFecharDicaClick(Sender: TObject);
Begin
   Inherited;
   Self.Enabled := true;
   townOutroProc.Visible := false;
End;

Procedure TfrmCustomCadProcesso.sbtnFichaClick(Sender: TObject);
Begin
   ImprimeFichaProc(dbedNumProcesso.Text, edNomeContraparte.Text, CMProcuraAdv2.Text);
End;

Procedure TfrmCustomCadProcesso.ImprimeFichaProc(Const NumProcesso, NomeContraparte, NossoAdv: String);
Var
   c: integer;
   Frm: TfrmCustomParamFichaProc;
   Rpt: TFrmCmReport;
Begin
   // Criar Form de Parâmetros de acordo com o módulo
   Frm := TfrmCustomParamFichaProc(CriarTelaParamFichaProc);
   Try
      CopiarDadosMontaSelect(MontaSelect, Frm.MontaSelect);
      Frm.MontaSelect.SensivelACaixa[0] := 'S';
      Frm.MontaSelect.ItemsBusca.Add(edNomeContraparte.Text);
      Frm.edNumero.Text := dbedNumProcesso.Text;
      Frm.edNomeContraparte.Text := edNomeContraparte.Text;
      Frm.NomeNossoAdvog := CMProcuraAdv2.Text;
      Frm.OnClose := FormCloseParamFichaProc;

      OnParamFichaProc(Frm); // Indicar Parâmetros de acordo com o módulo

      Frm.HabilitarBtOk;
      If (Frm.ShowModal = mrOk) Then
         Begin
            Rpt := CriarFichaProc; // Criar Relatório de acordo com o módulo
            Try
               Rpt.CrmRptCM.IdReports := Frm.IdReports;
               Rpt.CrmRptCM.IdEmpresa := Sistema.IdEmpresa;
               Rpt.CrmRptCM.OrigemCM := 1;
               Rpt.CrmRptCM.IdModulo := Sistema.IdModulo;
               Rpt.CrmRptCM.IdUsuario := Sistema.IdUsuario;
               For c := 0 To Frm.Cmp_Padrao.Params.Count - 1 Do
                  Rpt.CmpRptCM.ParamValues[c].Value := Frm.Cmp_Padrao.ParamValues[c].Value;
               Rpt.CrmRptCM.Print;
            Finally
               Rpt.Free;
            End;
         End;
   Finally
      Frm.Free;
   End;
End;

Procedure TfrmCustomCadProcesso.sbtnProcurarClick(Sender: TObject);
Begin
   If (TComponent(Sender).Name = 'sbtnProcurar') Then
      MontarMontaSelect;
   Inherited;

End;

Procedure TfrmCustomCadProcesso.sbtnProcurarLitisClick(Sender: TObject);
Begin
   MontaSelect.UsaDistinct := true;
   MontaSelect.Caption := 'Seleciona Processo Incluindo Litisconsortes';

   MontaSelect.Filtro.Clear;

   MontaSelect.CamposChave.Clear;
   MontaSelect.CamposChave.Add('PROCESSOTRAB.NUMPROCTRAB');

   MontaSelect.Tabelas.Clear;
   MontaSelect.Tabelas.Add('PESSOA');
   MontaSelect.Tabelas.Add('PROCESSOTRAB');
   MontaSelect.Tabelas.Add('COPARTPROCTRAB');
   MontaSelect.Tabelas.Add('VARAJUSTICA');

   OnClick_ProcurarProcessoComLitisconsortes;

   MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
   MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
   MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');

   sbtnProcurarClick(Sender);
   sbtnProcurarLitis.Down := false;
End;

Procedure TfrmCustomCadProcesso.bbtnParcelamentoClick(Sender: TObject);
Begin
   If (rgTipEncer.ItemIndex = 1) And (sbspeParc.Value < 1) Then
      Begin
         sbspeParc.SetFocus;
         MsgDlg('Informe o Número de Parcelas a Pagar.', 'Informação', mtInformation, [mbOk, mbHelp], 0);
      End
   Else
      ExibirParcelasDoProcesso(Cds.FieldByName('NUMPROCTRAB').asFloat, Round(sbspeParc.Value),
         dbedEncerr.Date, CdsDet.Data, Cds.State In [dsInsert, dsEdit]);
End;

Procedure TfrmCustomCadProcesso.spbProcVincClick(Sender: TObject);
Begin
   MontaSelectProcVinc.Executar;
   If (MontaSelectProcVinc.RetornouValor) Then
      Begin
         Cds.FieldByName('IDPROCVINCULADO').asFloat := StrToFloat(MontaSelectProcVinc.ValoresChave[0]);
         spbApagaVinc.Enabled := true;
      End;
End;

Procedure TfrmCustomCadProcesso.spbApagaVincClick(Sender: TObject);
Begin
   If (MsgDlg('Confirma a Excluão do Vínculo?', 'Confirmação',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
      Begin
         Cds.FieldByName('IDPROCVINCULADO').Clear;
         Cds.FieldByName('FLGVINCULADO').Clear;
         spbApagaVinc.Enabled := false;
      End;
End;

Procedure TfrmCustomCadProcesso.bbtnOkDetClick(Sender: TObject);
Var
   dPercAtual: double;
   iQtdeObj: integer;
Begin
   bOkDetalhe := false;
   Case (pgctrlDetalhe.ActivePageIndex) Of
      1: If Not (OnClick_OkDetalheLitisconsortes) Then exit; // Litisconsortes
      3: If Not (OnClick_OkDetalheObjetos) Then exit; // Objetos
      4: If Not (OnClick_OkDetalheEtapas) Then exit; // Etapas
      5: If Not (OnClick_OkDetalheHonor) Then exit; // Honorários
   End;

   If (pgctrlDetalhe.ActivePageIndex = 3) Then
      Try
         StrToDate(dbedDataAval.Text);
      Except
         exit;
      End;

   Inherited;

   Case (pgctrlDetalhe.ActivePageIndex) Of
      3: // Objetos
         Begin

            bAlterouValores := true;
            //      HabilitarPastaIntegracao;
         End;
      4: // Etapas
         Begin
            edLitisconsorte.Text := '';
            If bEncerrar Then
               Begin
                  If dsEtapa.State = dsInsert Then
                     bbtnCancelarDetClick(Self);
                  rgSituacao.ItemIndex := 1;
               End;

            If (bExecutar) And (dsEtapa.State = dsInsert) And (rgSituacao.ItemIndex = 0) Then
               Begin
                  iQtdeObj := 0;
                  dPercAtual := 0;
                  CdsDet.First;
                  While Not CdsDet.Eof Do
                     Begin
                        dPercAtual := dPercAtual + CdsDet.FieldByName('PERCPROB').asFloat;
                        If CdsDet.FieldByName('VALORRECL').asFloat > 0 Then
                           inc(iQtdeObj);
                        CdsDet.Next;
                     End;
                  CdsDet.First;
                  If (iQtdeObj > 0) And (dPercAtual / iQtdeObj <> 100) And
                     (MsgDlg('Deseja alterar a probabilidade atual para 100% ?', 'Confirmação',
                     mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
                     Begin
                        CdsDet.First;
                        While Not CdsDet.Eof Do
                           Begin
                              If CdsDet.FieldByName('PERCPROB').asFloat > 0 Then
                                 Begin
                                    CdsDet.Edit;
                                    CdsDet.FieldByName('PERCPROB').asFloat := 100;
                                    CdsDet.Post;
                                 End;
                              CdsDet.Next;
                           End;
                        CdsDet.First;
                        bbtnCancelarDetClick(Self);
                        MsgDlg('Procedimento de ajuste efetuado. Informe/altere o Nº de Execução, se for o caso', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
                        pgctrlDetalhe.ActivePage := tbshOutrosDados;
                        pgCtrlOutrosDados.ActivePage := tbsInstancias;
                        dbedNumExec.SetFocus;
                        bAlterouValores := true;
                        //                        HabilitarPastaIntegracao;
                     End;
               End;

         End;
   End;

   bOkDetalhe := true;

   bbtnConfirmar.enabled := True;
   bbtnCancelar.enabled := True;

   bbtnVoltarDetClick(Self);
End;

Procedure TfrmCustomCadProcesso.bbtnCancelarDetClick(Sender: TObject);
Begin
   If (pgctrlDetalhe.ActivePage = tbsEtapas) And (CdsEtapa.State = dsInsert) Then
      Dec(iNumSeqAtual);
   Inherited;

   //Renan Cristiano Ini
   If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Rollback;
   //Renan Cristiano Fim

   bbtnConfirmar.enabled := True;
   bbtnCancelar.enabled := True;
End;

Procedure TfrmCustomCadProcesso.bbtnVoltarDetClick(Sender: TObject);
Begin
   If (pgctrlDetalhe.ActivePage = tbsEtapas) And (CdsEtapa.State = dsInsert) Then
      Dec(iNumSeqAtual);
   Inherited;

   bbtnConfirmar.enabled := True;
   bbtnCancelar.enabled := True;
End;

Procedure TfrmCustomCadProcesso.bbtnConfirmarClick(Sender: TObject);
Var
   bInserir: boolean;
   sRecPag: String;
   dValorObj, dValorDep, dValorPen, dValorCon, dValorLev: double;
   _CdsAux: TCMClientDataSet;
Begin
   lblTipoDesconstituicao.caption := '';
   If (Trim(dbedNumJCJ.Text) = '') Then
      Begin
         MsgDlg('Número do Processo Não Informado', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dbedNumJCJ.SetFocus;
         exit;
      End;

   If (Trim(edNomeContraparte.Text) = '') Then
      Begin
         MsgDlg('Contraparte Não Identificada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         gbxContraparte.SetFocus;
         exit;
      End;

   If (Trim(dblckVara.Text) = '') Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);

         pgCtrlOutrosDados.ActivePage := tbsInstancias;
         MsgDlg('Vara Não Identificada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dblckVara.SetFocus;
         exit;
      End;

   If (Trim(dbedDataNot.Text) = '') Then
      Begin
         If (Sistema.IdModulo <> PROCPREV) And (Sistema.IdModulo <> PROCJUD) And
            (Sistema.IdModulo <> MODCON) Then
            Begin
               tbcDetalhe.TabIndex := 2;
               tbcDetalhe.Repaint;
               tbcDetalheChange(Sender);
               pgCtrlOutrosDados.ActivePage := tbshTipos;
            End;
         MsgDlg('Data da Notificação Não Identificada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         DataNotificacao.SetFocus;
         exit;
      End;

   If (Trim(dbedDataAju.Text) = '') Then
      Begin
         If (Sistema.IdModulo <> PROCPREV) And (Sistema.IdModulo <> PROCJUD) And
            (Sistema.IdModulo <> MODCON) Then
            Begin
               tbcDetalhe.TabIndex := 2;
               tbcDetalhe.Repaint;
               tbcDetalheChange(Sender);
               pgCtrlOutrosDados.ActivePage := tbshTipos;
            End;
         MsgDlg('Data do Ajuizamento Não Identificada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         DataAjuizamento.SetFocus;
         exit;
      End;

   If (Trim(ProcuraCidade.Text) = '') Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);

         pgCtrlOutrosDados.ActivePage := tbshTipos;
         MsgDlg('Cidade/Estado Onde Corre o Processo Não Identificados', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         ProcuraCidade.SetFocus;
         exit;
      End;

   If (Cds.FieldByName('IDADVOGRECTE').isNull) Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);

         pgCtrlOutrosDados.ActivePage := tbshAdvogados;
         MsgDlg('Escritório/Advogado da Contraparte Não Identificado', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         CMProcuraAdv1.SetFocus;
         exit;
      End;

   If (Cds.FieldByName('IDADVOGRECDA').isNull) Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);

         pgCtrlOutrosDados.ActivePage := tbshAdvogados;
         MsgDlg('Nosso Escritório/Advogado Não Identificado', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         CMProcuraAdv2.SetFocus;
         exit;
      End;

   If (dbredJuros.Value = 0) And (Trim(dbdtJuros.Text) <> '') Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);
         pgCtrlOutrosDados.ActivePage := tbshValores;
         MsgDlg('Taxa de Juros Não Informada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dbredJuros.SetFocus;
         exit;
      End;

   If (dbredJuros.Value > 0) And (Trim(dbdtJuros.Text) = '') Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);
         pgCtrlOutrosDados.ActivePage := tbshValores;
         MsgDlg('Data Inic. Juros Não Identificada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dbdtJuros.SetFocus;
         exit;
      End;

   If (dbrgIndTaxaConv.ItemIndex = 0) And (Trim(dblckMoeda.Text) = '') Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);
         pgCtrlOutrosDados.ActivePage := tbshValores;
         MsgDlg('Indice de Atualização Monetária Não Identificado', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dblckMoeda.SetFocus;
         exit;
      End;

   If (dbrgIndTaxaConv.ItemIndex = 1) And (Trim(dblckRegraNormal.Text) = '') Then
      Begin
         tbcDetalhe.TabIndex := 2;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);
         pgCtrlOutrosDados.ActivePage := tbshValores;
         MsgDlg('Regra de Cálculo da Atualização Monetária Não Identificada', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dblckRegraNormal.SetFocus;
         exit;
      End;

   // Se um dos detalhes estiver em edição, executar primeiro o Ok deste
   If (CdsLitis.State In [dsInsert, dsEdit]) Then
      _CdsAux := CdsLitis
   Else
      If (CdsDet.State In [dsInsert, dsEdit]) Then
         _CdsAux := CdsDet
      Else
         If (CdsEtapa.State In [dsInsert, dsEdit]) Then
            _CdsAux := CdsEtapa
         Else
            _CdsAux := Nil;

   If Assigned(_CdsAux) Then
      Begin
         bbtnOkDetClick(Sender);
         If Not (bOkDetalhe) Then
            exit;
         _CdsAux.Delete;
      End;

   Screen.Cursor := crSQLWait;

   // Deve ter pelo menos um objeto com valor
   dValorObj := 0;
   CdsDet.First;
   While Not CdsDet.Eof Do
      Begin
         dValorObj := dValorObj + CdsDet.FieldByName('VALORRECL').asFloat;
         CdsDet.Next;
      End;
   CdsDet.First;

   Screen.Cursor := crDefault;

   If (dValorObj = 0) Then
      Begin
         tbcDetalhe.TabIndex := 3;
         tbcDetalhe.Repaint;
         tbcDetalheChange(Sender);
         MsgDlg('Deve existir pelo menos um objeto com valor', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         exit;
      End;

   {   If (dbredJuros.Value = 0) And (Trim(dbdtJuros.Text) = '') And
         (bExibeMensagens) And
         (MsgDlg('Tem certeza de que não haverá cálculo de Juros ?', 'Confirmação',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes) Then
         Begin
            tbcDetalhe.TabIndex := 2;
            tbcDetalhe.Repaint;
            tbcDetalheChange(Sender);
            pgCtrlOutrosDados.ActivePage := tbshValores;
            dbredJuros.SetFocus;
            exit;
         End;}

   If (Cds.State = dsInsert) And Not (Cds.FieldByName('DATANOTIF').IsNull) Then
      Cds.FieldByName('DATAPREVENCER').asDateTime :=
         Cds.FieldByName('DATANOTIF').asDateTime + Int(365.25 * 5);

   bInserir := (Cds.State = dsInsert);

   Screen.Cursor := crSQLWait;
   If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
   Screen.Cursor := crDefault;

   //  Refresh;

   Inherited;

   If (bInserir) Then
      Begin
         If (MsgDlg('Gera a ficha do Processo > ' + floattostr(CtrlProcessoTrab.NumProcTrab) + ' ?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
            Begin
               Sel(true, CtrlProcessoTrab.NumProcTrab);
               sbtnFicha.Click;
            End;
      End;

   bExibeMensagens := false;
   //   bbtnVoltarDetClick(Self);
   //   bbtnCancelarClick(Self);
End;

Procedure TfrmCustomCadProcesso.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   //   If (Assigned(Self.ActiveControl)) And
//   If (TComponent(Self.ActiveControl).Name = 'bbtnCancelar') And
   If (Cds.FieldByName('NUMPROCTRAB').asFloat > 0) Then
      Sel(true, Cds.FieldByName('NUMPROCTRAB').asFloat)
   Else
      Begin
         HabilitarDadosEncerramento(Cds.FieldByName('FLGSITPROC').asInteger);
         OnMudarDadosParticipante;
      End;

   AcharUltimoNumSeq;
End;

Procedure TfrmCustomCadProcesso.dblckTipoEtpChange(Sender: TObject);
Begin
   Inherited;
   btnPenhora.Enabled := False;
   //Renan Cristiano SOL Nº 126385 KINTANA 6585269 - INI
   // PauloNobreza
   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1030) Or // Penhora
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1053) Then // Condenção Solidária
      btnPenhora.Enabled := True;
   //Renan Cristiano SOL Nº 126385 KINTANA 6585269 - FIM

   If (CdsTipoEtapa.FieldByName('FLGPENHORA').asInteger = 1) Then
      dbrgAbate.ItemIndex := 1;
   If (CdsTipoEtapa.FieldByName('VALORHONOR').asFloat <> 0) Then
      Begin
         lblHonor.Visible := true;
         redHonor.Visible := true;
         If sbtnInsDet.Down Then
            redHonor.Value := CdsTipoEtapa.FieldByName('VALORHONOR').asFloat;
         //dbedAssunto.Width := 462;
      End
   Else
      Begin
         lblHonor.Visible := false;
         redHonor.Visible := false;
         redHonor.Value := 0;
         //dbedAssunto.Width := 624;
      End;
End;

Procedure TfrmCustomCadProcesso.btnPenhoraClick(Sender: TObject);
Begin
   If dtedDataReal.Text <> '' Then
      If (mskedHora.Text = '  :  ') Then
         CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date
      Else
         CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date +
            StrToTime(mskedHora.Text);

   If CdsEtapa.FieldByName('DATAREALOCOR').IsNull Then
      Begin
         MsgDlg('Informe a Data, antes de abrir esta tela', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
         dtedDataReal.SetFocus;
         exit;
      End;

   //Renan Cristiano Sol Nº 126385 Kintana 6585269 Inicio

   // PauloNobreza

   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1030) Or // Penhora
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
      Begin
         If Not (Assigned(frmCadRegPenhora)) Then
            frmCadRegPenhora := TfrmCadRegPenhora.Create(Application);
         frmCadRegPenhora.ExibirTelaPenhora(CdsEtapa);

      End
   Else
      If CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035 Then // Depósito Judicial
         Begin
            If Not Assigned(frmCadDepositoJudicial) Then
               frmCadDepositoJudicial := TfrmCadDepositoJudicial.Create(Application);

            frmCadDepositoJudicial.ExibirTelaDepositoJudicial(Cds.FieldByName('NUMPROCTRAB').asInteger,
               CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger,
               CdsDet.FieldByName('NUMSEQ').AsInteger);

            frmCadDepositoJudicial.ShowModal;
            dbedValRec.value := frmCadDepositoJudicial.dValor;
         End;

   //Renan Cristiano Sol Nº 126385 Kintana 6585269 Fim

End;

Procedure TfrmCustomCadProcesso.CdsHonorBeforeDelete(DataSet: TDataSet);
Begin
   // Atualizar Total de Despesas
   Cds.FieldByName('DESPESAPROC').asFloat :=
      Cds.FieldByName('DESPESAPROC').asFloat - CdsHonor.FieldByName('VALORHONOR').asFloat *
      FU.IFF(CdsHonor.FieldByName('INDHONOR').asInteger = 0, 1, TotalValorSentenca / 100);
   dValHonorAntes := 0;
   Inherited;
End;

Procedure TfrmCustomCadProcesso.dsHonorStateChange(Sender: TObject);
Begin
   Inherited;
   If (CdsHonor.State In [dsInsert, dsEdit]) Then
      dtPagamentoHonor.SetFocus;
End;

Procedure TfrmCustomCadProcesso.CdsHonorBeforeEdit(DataSet: TDataSet);
Begin
   Inherited;
   dValHonorAntes := CdsHonor.FieldByName('VALORHONOR').asFloat *
      FU.IFF(CdsHonor.FieldByName('INDHONOR').asInteger = 0, 1, TotalValorSentenca / 100);
End;

Procedure TfrmCustomCadProcesso.cbxSucumbenciaClick(Sender: TObject);
Begin
   dbrgIndHonor.Visible := cbxSucumbencia.Checked;
   redValorTotal.Visible := cbxSucumbencia.Checked;

   If (cbxSucumbencia.Checked) Then
      CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDaContraParte(Cds.FieldByName('NUMPROCTRAB').asFloat)
   Else
      CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDoProcesso(Cds.FieldByName('NUMPROCTRAB').asFloat);
End;

Procedure TfrmCustomCadProcesso.CdsEtapaAfterInsert(DataSet: TDataSet);
Begin
   Inherited;
   IdImovelAntes := 0;
End;

Procedure TfrmCustomCadProcesso.CdsEtapaBeforePost(DataSet: TDataSet);
Begin
   Inherited;
   If (IdImovelAntes <> CdsEtapa.FieldByName('IDIMOVEL').asFloat) Or
      ((CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) And
      (CdsEtapa.FieldByName('VALORREC').asFloat < 0)) Then
      Begin
         If (CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) And
            (CdsEtapa.FieldByName('VALORREC').asFloat > 0) Then // Início de Penhora
            Begin
               CtrlProcessoTrab.AtualizarImovel(CdsEtapa.FieldByName('IDIMOVEL').asFloat, true);
               CtrlProcessoTrab.InserirEventoImovel(
                  CdsEtapa.FieldByName('IDIMOVEL').asFloat,
                  CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
                  True,
                  copy(CdsEtapa.FieldByName('OBSERVETAPA').asString, 1, 2000),
                  FU.IFF(CdsEtapa.FieldByName('INDVALOR').asInteger = 3, CdsEtapa.FieldByName('VALOR').asFloat, 100), //EviPercent
                  CdsEtapa.FieldByName('VALORREC').asFloat) //EviVlrAjustado
            End;

         // Término de Penhora
         If ((IdImovelAntes > 0) And // Por Exclusão da Etapa
            (CdsEtapa.FieldByName('IDIMOVEL').asFloat = 0)) Or
            ((IdImovelAntes = 0) And // Por Desconstituição em Nova Etapa
            (CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) And
            (CdsEtapa.FieldByName('VALORREC').asFloat < 0)) Then
            Begin
               CtrlProcessoTrab.AtualizarImovel(FU.IFF(IdImovelAntes > 0, IdImovelAntes,
                  CdsEtapa.FieldByName('IDIMOVEL').asFloat), False);
               CtrlProcessoTrab.InserirEventoImovel(
                  FU.IFF(IdImovelAntes > 0, IdImovelAntes, CdsEtapa.FieldByName('IDIMOVEL').asFloat),
                  CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
                  False,
                  copy(CdsEtapa.FieldByName('OBSERVETAPA').asString, 1, 2000),
                  0, //EviPercent
                  0) //EviVlrAjustado
            End;
      End;

   // Término de Penhora por Desconstituição na Mesma Etapa
   If (IdImovelAntes > 0) And
      (IdImovelAntes = CdsEtapa.FieldByName('IDIMOVEL').asFloat) And
      (CdsEtapa.FieldByName('VALORREC').asFloat < 0) Then
      Begin
         CtrlProcessoTrab.AtualizarImovel(IdImovelAntes, False);
         CtrlProcessoTrab.InserirEventoImovel(
            IdImovelAntes,
            CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
            False,
            copy(CdsEtapa.FieldByName('OBSERVETAPA').asString, 1, 2000),
            0, //EviPercent
            0) //EviVlrAjustado
      End;
End;

Procedure TfrmCustomCadProcesso.CdsEtapaBeforeDelete(DataSet: TDataSet);
Begin
   Inherited;
   IdBemAntes := CdsEtapa.FieldByName('IDBEM').asFloat;
   IdConjuntoAntes := CdsEtapa.FieldByName('IDCONJUNTO').asFloat;

   If (CdsEtapa.FieldByName('IDIMOVEL').asFloat > 0) Then // Término de Penhora
      Begin
         CtrlProcessoTrab.AtualizarImovel(CdsEtapa.FieldByName('IDIMOVEL').asFloat, False);
         CtrlProcessoTrab.InserirEventoImovel(
            CdsEtapa.FieldByName('IDIMOVEL').asFloat,
            CdsEtapa.FieldByName('DATAREALOCOR').asDateTime, //EviData
            False,
            'Penhora Excluída',
            0, //EviPercent
            0) //EviVlrAjustado
      End;
End;

Procedure TfrmCustomCadProcesso.bbtnSubstituirContraparteClick(Sender: TObject);
Var
   sGuardaIdPessoa, sGuardaNome, sGuardaIndTestemunha, sGuardaSit, sGuardaCat,
      sGuardaMotivo, sGuardaPlano, sGuardaPatro: String;
Begin
   If (ds.State In [dsInsert, dsEdit]) Then
      Begin
         If (CdsLitis.FieldByName('SITUACAO').asString <> 'Normal') Then
            Begin
               MsgDlg('Selecione um Litisconsorte em Situação "Normal".',
                  'Aviso', mtInformation, [mbOk, mbHelp], 0);
               exit;
            End;
         sGuardaIdPessoa := Cds.FieldByName('IDRECLAMANTE').AsString;
         sGuardaNome := edNomeContraparte.Text;
         sGuardaIndTestemunha := CdsLitis.FieldByName('INDTESTEMUNHA').AsString;
         sGuardaMotivo := Cds.FieldByName('IDMOTIVO').AsString;
         sGuardaPlano := Cds.FieldByName('IDPLANOPREV').AsString;
         sGuardaPatro := Cds.FieldByName('IDPATRO').AsString;
         sGuardaSit := dblckMotivoContraparte.Text;
         sGuardaCat := CdsLitis.FieldByName('CATEGORIA').AsString;
         Cds.FieldByName('IDRECLAMANTE').AsString := CdsLitis.FieldByName('IDPESSOA').AsString;
         edNomeContraparte.Text := CdsLitis.FieldByName('NOME').asString;
         sbtnExcluiDetClick(Self);
         bbtnSubstituirContraparte.Visible := False;
         Cds.FieldByName('IDMOTIVO').Clear;
         Cds.FieldByName('DATAALTSIT').Clear;
         If (MsgDlg('Deseja Colocar a ex-Contraparte como um Litisconsorte ?', 'Confirmação',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) Then
            Begin
               CdsLitis.Insert;
               CdsLitis.FieldByName('IDPESSOA').AsString := sGuardaIdPessoa;
               CdsLitis.FieldByName('NOME').AsString := sGuardaNome;
               CdsLitis.FieldByName('NUMPROCTRAB').AsString := Cds.FieldByName('NUMPROCTRAB').AsString;
               CdsLitis.FieldByName('INDTESTEMUNHA').AsString := sGuardaIndTestemunha;
               CdsLitis.FieldByName('IDMOTIVO').AsString := sGuardaMotivo;
               CdsLitis.FieldByName('SITUACAO').AsString := sGuardaSit;
               CdsLitis.FieldByName('CATEGORIA').AsString := sGuardaCat;

               If (Trim(sGuardaSit) <> '') Then
                  CdsLitis.FieldByName('DATAALTSIT').asString := DateToStr(Date)
               Else
                  CdsLitis.FieldByName('DATAALTSIT').Clear;

               If (sGuardaPlano <> '') And (sGuardaPatro <> '') Then
                  CdsLitis.FieldByName('IDPLANPREVCTBPATR').AsString :=
                     CtrlProcessoTrab.RetornaPlanoPatro(sGuardaPlano, sGuardaPatro)
               Else
                  CdsLitis.FieldByName('IDPLANPREVCTBPATR').Clear;

               CdsLitis.Post;
            End;
      End;
End;

Procedure TfrmCustomCadProcesso.CdsAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   IdVaraAntes := Cds.FieldByName('IDVARAJUSTICA').AsFloat;
   IdTipoAntes := Cds.FieldByName('IDTIPOPROC').AsFloat;
   IdParteAntes := Cds.FieldByName('FLGPARTEATIVA').AsFloat;
   CdsHistProcesso.Data := CtrlProcessoTrab.ListHistAlterDoProcesso(Cds.FieldByName('NumProcTrab').AsFloat);
   bbtnSubstituirContraparte.Visible := false;

End;

Procedure TfrmCustomCadProcesso.CmeCadastroConfirma(Sender: TObject);
Begin
   Inherited;
   bbtnSubstituirContraparte.Visible := False;
End;

Procedure TfrmCustomCadProcesso.CmeCadastroCancel(Sender: TObject);
Begin
   Inherited;
   bbtnSubstituirContraparte.Visible := False;
   CdsHistObjetoGravar.Data := CtrlHstObjProcTrab.ListGeral(-1, -1, 0);
   CdsHistProcessoGravar.Data := CtrlProcessoTrab.ListHistAlterDoProcesso(-1);
End;

// -----------------------------------------------------------------------------------------
// Funções do Form
// -----------------------------------------------------------------------------------------

Procedure TfrmCustomCadProcesso.Sel(SelPrincipal: boolean; NumProcTrab: double);
Begin
   bExibeMensagens := true;

   iNumProcTrab := NumProcTrab; //Renan Cristiano Sol Nº 126385 Kintana 6585269

   Cds.DisableControls;
   CdsLitis.DisableControls;
   CdsDet.DisableControls;
   CdsEtapa.DisableControls;
   CdsProcVinc.DisableControls;
   CdsUF.DisableControls;

   If (SelPrincipal) Then
      Begin
         Cds.Data := CtrlProcessoTrab.ListProcesso(NumProcTrab);
         spbProcVinc.Enabled := false;
         spbApagaVinc.Enabled := false;
      End;

   CdsLitis.Data := CtrlProcessoTrab.ListDadosLitisconsortes(NumProcTrab);
   CdsDet.Data := CtrlProcessoTrab.ListObjetoXTipo(NumProcTrab, CdsParamRH.FieldByName('FLGPERCPROB').asInteger);
   CdsEtapa.Data := CtrlEtapaProcesso.ListEtapas(NumProcTrab);
   VerificaEtapaExecucao;
   CdsHonorarios.Data := CtrlHonorarioProcesso.ListTabHonorarioEmBranco;
   CdsHonor.Data := CtrlHonorarioProcesso.ListHonorario(NumProcTrab);
   CdsProcVinc.Data := CtrlProcessoTrab.ListProcessosVinculados(NumProcTrab);
   CdsAdvog.Data := CtrlProcessoTrab.ListAdvogadosDoProcesso(NumProcTrab);
   MudarDadosCidade;

   dbreCustoChange(Nil);
   OnMudarDadosParticipante;
   //   HabilitarPastaIntegracao;

   TFloatField(CdsHonor.FieldByName('VALORHONOR')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsEtapa.FieldByName('VALORREC')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsEtapa.FieldByName('VALORCUSTAS')).DisplayFormat := '###,###,##0.00';
   FormatarCampoCdsObjetos;

   dblckMotivoContraparteChange(Nil);

   iSituacao_Original := Cds.FieldByName('FLGSITPROC').asInteger;
   HabilitarDadosEncerramento(Cds.FieldByName('FLGSITPROC').asInteger);
   HabilitarTipoEncerramento(iSituacao_Original, Cds.FieldByName('TIPOENCER').asString);

   DataDemissao := GetDataDemissao;
   IniciarValoresContabeis;

   Cds.EnableControls;
   CdsLitis.EnableControls;
   CdsDet.EnableControls;
   CdsEtapa.EnableControls;
   CdsProcVinc.EnableControls;
   CdsUF.EnableControls;

   bbtnVerHistObjeto.Visible := (tbcDetalhe.TabIndex = 3) And (Not CdsDet.Eof);
   //---Emerson KT 522313 SOL 112597 inicio. --//
   btnVerHistoricoEtapas.Visible := (tbcDetalhe.TabIndex = 4) And (Not CdsDet.Eof);
   //---Emerson KT 522313 SOL 112597 Fim ------//

End;

Procedure TfrmCustomCadProcesso.MudarDadosCidade;
Begin
   If (Cds.FieldByName('IDCIDADES').asInteger = 0) Then
      CdsUF.Data := CtrlListTerceirosRH.ListEstado(-1)
   Else
      CdsUF.Data := CtrlListTerceirosRH.ListEstado(0, Cds.FieldByName('IDCIDADES').asInteger);
End;

Procedure TfrmCustomCadProcesso.HabilitarIntegracao;
Begin
   // Integração com CAPCAR
   bIntegraCAPCAR := False; //(CdsParamRH.FieldByName('FLGINTEGRACAP').asInteger = 1);

   // Integração com a Contabilidade
   bIntegraContab := (CdsParamRH.FieldByName('FLGINTEGRACONT').asInteger = 1) And
      (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));

   If (bIntegraContab) Then
      Begin

         // Pega a Máscara do Plano de Contas
         sMascaraPlaConta := CtrlContab.MascaraContaParam;

         // Pega o ID da Patrocinadora e do Plano Previdenciário
         If (IdPatro <= 0) Or (IdPlanoPrev <= 0) Then
            If (Sistema.UsaPlanoPatro) Then
               Begin
                  IdPatro := CtrlListTerceirosRH.GetIdPatro(Sistema.IdEmpresa);
                  IdPlanoPrev := CtrlListTerceirosRH.GetIdPlanoPrev(Sistema.IdEmpresa);
               End
            Else
               Begin
                  IdPatro := -1;
                  IdPlanoPrev := -1;
               End;
      End;

   If (bIntegraCAPCAR) Or (bIntegraContab) Then
      CtrlProcessoTrab.IniciarIntegracao(Sistema.IdEmpresa, Sistema.IdModulo,
         Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro,
         ParamIntegra.ObrigaAbc, ParamIntegra.ObrigaCRespon,
         ParamIntegra.PlanoPrevGlobal, ParamIntegra.PatroGlobal);
End;

Procedure TfrmCustomCadProcesso.HabilitarPastaIntegracao;
Var
   TipoDocumento: String;
Begin
   // Integração com CAPCAR
{   bFazCAPCAR := (bIntegraCAPCAR) And (bAlterouValores) And
      ((Cds.FieldByName('FLGSITPROC').asInteger = 1) Or (rgSituacao.ItemIndex = 1));
   gbxCAPCAR.Visible := bFazCAPCAR;
   gbkTipoDesemb.Visible := bFazCAPCAR;

   // Somente faz a seleção dos Tipos de Documento e dos Tipos de Desembolso se o sistema
   // está parametrizado para fazer integração com o CAP ou CAR e o processo estiver sendo
   // ou já estava encerrado e for a primeira vez que está passando neste ponto (CdsTipoDoc não ativo).
   If (bFazCAPCAR) And ((Cds.FieldByName('FLGSITPROC').asInteger = 1) Or (rgSituacao.ItemIndex = 1)) And
      Not (CdsTipoDoc.Active) Then
      Begin
         If (Sistema.IdModulo = MODCON) Then
            TipoDocumento := 'P'
         Else
            TipoDocumento := '';

         CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPag(TipoDocumento);
         CdsTipoDesemb.Data := CtrlListTerceirosRH.ListTipoDocRecebDesemb(
            Sistema.IdEmpresa, TipoDocumento, true);
      End;

   // Integração com a Contabilidade
   bFazContab := (bIntegraContab) And (bAlterouValores);
   //   gbxContabilizacao.Visible := bFazContab;

      // Parametrizações comuns ao CAPCAR e Contabilidade
   tbshIntegracao.TabVisible := (bFazContab) Or (bFazCAPCAR);
   If (bFazCAPCAR) Or (bFazContab) Then
      Begin
         If (bFazCAPCAR) Then
            dtPagamento.Date := Date;

         If (bFazCAPCAR) And Not (bFazContab) Then
            tbshIntegracao.Caption := gbxCAPCAR.Caption
         Else
            If Not (bFazCAPCAR) And (bFazContab) Then
               tbshIntegracao.Caption := 'Contabilização'
            Else
               tbshIntegracao.Caption := 'Contabilização e ' + gbxCAPCAR.Caption;
      End;}
End;

Procedure TfrmCustomCadProcesso.HabilitarBtProcVinc(Alterando: boolean);
Begin
   spbProcVinc.Enabled := Alterando;
   spbApagaVinc.Enabled := (Alterando) And Not (Cds.FieldByName('IDPROCVINCULADO').IsNull);
End;

Procedure TfrmCustomCadProcesso.HabilitarTipoEncerramento(Situacao: integer;
   TipoEncerramento: String);
Begin
   gbxAcordo.Visible := (Situacao = 1) And (TipoEncerramento = 'C');
   gbxSent.Visible := (Situacao = 1) And (TipoEncerramento = 'S');
End;

Procedure TfrmCustomCadProcesso.IniciarValoresContabeis;
Begin
   //   bAlterouValores := false;
   //   If (bIntegraContab) Or (bIntegraCAPCAR) Then
     //    CtrlProcessoTrab.IniciarValoresContabeis(DataDemissao);
End;

Procedure TfrmCustomCadProcesso.AcharUltimoNumSeq;
Begin
   CdsEtapa.DisableControls;
   CdsEtapa.First;
   iNumSeqAtual := 0;

   While Not (CdsEtapa.EOF) Do
      Begin
         If (CdsEtapa.FieldByName('NUMSEQ').asInteger > iNumSeqAtual) Then
            iNumSeqAtual := CdsEtapa.FieldByName('NUMSEQ').asInteger;
         CdsEtapa.Next;
      End;

   CdsEtapa.First;
   CdsEtapa.EnableControls;
End;

Procedure TfrmCustomCadProcesso.FormatarCampoCdsObjetos;
Begin
   TFloatField(CdsDet.FieldByName('VALORRECL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsDet.FieldByName('PERCPROB')).DisplayFormat := '###,###,##0.0000';
   TFloatField(CdsDet.FieldByName('PERCORIG')).DisplayFormat := '###,###,##0.0000';
   TFloatField(CdsDet.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsDet.FieldByName('VALORPROVAVEL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsDet.FieldByName('VALORORIG')).DisplayFormat := '###,###,##0.00';
End;

Procedure TfrmCustomCadProcesso.MontarMontaSelect;
Begin
   MontaSelect.UsaDistinct := false;
   MontaSelect.Caption := 'Seleciona Processo';

   MontaSelect.Filtro.Clear;

   MontaSelect.Tabelas.Clear;
   MontaSelect.Tabelas.Add('PESSOA');
   MontaSelect.Tabelas.Add('PROCESSOTRAB');
   MontaSelect.Tabelas.Add('VARAJUSTICA');

   OnClick_ProcurarProcesso;

   MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
   MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
End;

Procedure TfrmCustomCadProcesso.MudarParametrosTela;
Begin
   Case (iTipoIntegraCAPCAR) Of
      CAP: gbxCAPCAR.Caption := 'Contas a Pagar';
      CAPCAR: gbxCAPCAR.Caption := 'Contas a Pagar / Receber';
   End;

   // Mudar Rótulos do Grid de Objetos
   dbgrdDet.Selected.Clear;
   dbgrdDet.Selected.Add('DESCRICAO' + #9 + '40' + #9 + 'Descrição do Objeto Reclamado');
   dbgrdDet.Selected.Add('VALORRECL' + #9 + '16' + #9 + 'Valor Reclamado');
   dbgrdDet.Selected.Add('PERCORIG' + #9 + '10' + #9 + 'Variação Original (%)');
   dbgrdDet.Selected.Add('VALORORIG' + #9 + '12' + #9 + 'Valor Estim. Orig.');
   dbgrdDet.Selected.Add('PERCPROB' + #9 + '17' + #9 + 'Probab. Atual (%)');
   dbgrdDet.Selected.Add('VALORPROVAVEL' + #9 + '12' + #9 + 'Valor Estim. Atual');
   dbgrdDet.Selected.Add('DATAAVAL' + #9 + '12' + #9 + 'Data Avaliação');
   dbgrdDet.Selected.Add('VALORSENTENCA' + #9 + '10' + #9 + 'Valor Real');
   dbgrdDet.Selected.Add('IDTIPOPROC' + #9 + '12' + #9 + 'Programa');
   dbgrdDet.Selected.Add('TIPCODIGO' + #9 + '12' + #9 + 'Sub-Programa');
   dbgrdDet.Selected.Add('DSCCONTABVLPRINC' + #9 + '17' + #9 + 'Contab.Principal');
   dbgrdDet.Selected.Add('DSCCONTABENCERRADO' + #9 + '20' + #9 + 'Encerrado e Contab.');
   dbgrdDet.Selected.Add('TRGDTINCLUSAO' + #9 + '18' + #9 + 'Data Inclusão');

   dblckTipoDesemb.Selected.Clear;
   dblckTipoDesemb.Selected.Add('DESCRICAO' + #9 + '35' + #9 + 'Descrição');

   dblckTipoDoc.Selected.Clear;
   dblckTipoDoc.Selected.Add('DESCRICAO' + #9 + '35' + #9 + 'Descrição');

   DataAjuizamento := dbedDataAju;
   DataNotificacao := dbedDataNot;

   OnMudarParametrosTela;

   MontarMontaSelect;
   CopiarDadosMontaSelect(MontaSelect, MontaSelectProcVinc);
End;

Procedure TfrmCustomCadProcesso.CopiarDadosMontaSelect(MSOrigem, MSDestino: TMontaSelect);
Begin
   MSDestino.Colunas.Text := MSOrigem.Colunas.Text;
   MSDestino.Descricao.Text := MSOrigem.Descricao.Text;
   MSDestino.Filtro.Text := MSOrigem.Filtro.Text;
   MSDestino.Larguras.Text := MSOrigem.Larguras.Text;
   MSDestino.Mascaras.Text := MSOrigem.Mascaras.Text;
   MSDestino.SensivelACaixa.Text := MSOrigem.SensivelACaixa.Text;
   MSDestino.Tabelas.Text := MSOrigem.Tabelas.Text;
   MSDestino.TipoDeDado.Text := MSOrigem.TipoDeDado.Text;
End;

Procedure TfrmCustomCadProcesso.HabilitarDadosEncerramento(Situacao: integer);
Begin
   rgTipEncer.Visible := (Situacao = 1);
   gbxDataEncer.Visible := (Situacao = 1);
   lblValReal.Visible := (Situacao = 1);
   dbedValReal.Visible := (Situacao = 1);
   gbxSent.Visible := (Situacao = 1);
   dbrgIndCondenacao.Visible :=
      (bExecutando) Or (bExecutar) Or
      ((Situacao = 1) And
      ((Cds.FieldByName('TIPOENCER').asString = 'C') Or
      (Cds.FieldByName('TIPOENCER').asString = 'S')) And
      (CtrlProcessoTrab.ContaNossaLitisconsorte(Cds.FieldByName('NumProcTrab').asFloat) > 0));
   bbtnCondenacao.Visible := (dbrgIndCondenacao.Visible) And (dbrgIndCondenacao.ItemIndex = 0); //in [0,1]);
End;

Function TfrmCustomCadProcesso.GravarProcessoTrab: boolean;
Var
   bEditando: boolean;
Begin
   bEditando := (Cds.State = dsEdit);
   Result := CtrlProcessoTrab.GravarProcessoTrab(sNomeSubConta, IdBemAntes, IdConjuntoAntes);
   CdsHistProcessoGravar.Data := CtrlProcessoTrab.ListHistAlterDoProcesso(-1);
   If (Result) Then
      Begin
         Result := CtrlHstObjProcTrab.GravarHstObjProcTrab(CtrlProcessoTrab.NumProcTrab);
         CdsHistObjetoGravar.Data := CtrlHstObjProcTrab.ListGeral(-1, -1, 0);
         If (Result) Then
            Begin
               If (bEditando) Then
                  Begin
                     GravarIntegracao;
                     Sel(true, StrToFloat(MontaSelect.ValoresChave[0]));
                  End;
            End;
      End
   Else
      MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
End;

Function TfrmCustomCadProcesso.ExcluirProcessoTrab: boolean;
Begin
   Result := CtrlProcessoTrab.ExcluirProcessoTrab;

   If (Result) Then
      Begin
         CdsPartic.EmptyDataSet;
         CdsProcVinc.EmptyDataSet;
         If (CdsHistObjeto.Active) And Not (CdsHistObjeto.IsEmpty) Then
            CdsHistObjeto.EmptyDataSet;
         edNomeContraparte.Text := '';
      End
   Else
      MsgDlg(CtrlProcessoTrab.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
End;

Procedure TfrmCustomCadProcesso.GravarIntegracao;
Var
   dValorAtual, dPlnCodigo: Double;
   IdSegregaCriterio: integer;
   sDataEncerramento: String;
   qryPrograma: Twwquery;
Begin
   qryPrograma := Twwquery.Create(Nil);

   {   If (iProgramaAnt <> CdsTipoObj.FieldByName('IDTIPOPROC').asInteger) Or
         (sSubProgramaAnt <> CdsTipoObj.FieldByName('TIPCODIGO').asString) Then
         showmessage('Programa alterado');}

   If (bIntegraContab) Then
      Begin
         // Se Processo foi encerrado
         If (iSituacao_Original = 0) And (Cds.FieldByName('FLGSITPROC').asInteger = 1) Then
            Begin
               sDataEncerramento := Cds.FieldByName('DATAEFETENC').asString;
               dPlnCodigo := 0;

               Try
                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;

                  CdsDet.First;
                  While Not CdsDet.EOF Do
                     Begin
                        // JUR_PROGRAMAXSUBPROGRAMA - Tabela que relaciona todos os Programas com os Sub-Programas
                        // Select feito para buscar o critério de segregação do Programa e Sub-Programa
                        qryPrograma.DataBaseName := 'BaseDados';
                        qryPrograma.Close;
                        qryPrograma.SQL.Clear;
                        qryPrograma.SQL.Add('SELECT P.IDTIPOPROC, P.NOMETIPOPROC, T.TIPCODIGO, T.TIPDESCRICAO, J.IDSEGREGACRITER  ');
                        qryPrograma.SQL.Add('FROM JUR_PROGRAMAXSUBPROGRAMA J, TIPOPROCESSO P, TIPOPER T  ');
                        qryPrograma.SQL.Add('WHERE J.IDTIPOPROC = P.IDTIPOPROC                           ');
                        qryPrograma.SQL.Add('AND T.TIPCODIGO = J.TIPCODIGO                               ');
                        qryPrograma.SQL.Add('AND J.IDTIPOPROC = ' + quotedStr(CdsDet.FieldByName('IDTIPOPROC').asString));
                        qryPrograma.SQL.Add('AND T.TIPCODIGO =  ' + quotedStr(CdsDet.FieldByName('TIPCODIGO').asString));
                        qryPrograma.Open;
                        If Not qryPrograma.EOF Then
                           Begin
                              IdSegregaCriterio := qryPrograma.fieldbyname('IDSEGREGACRITER').asInteger;

                              // Acertando o Valor Atual, gravado da última correção
                              dValorAtual := RoundCM(((CdsDet.FieldByName('PERCPROB').asFloat *
                                 CdsDet.FieldByName('VALORRECL').asFloat) / 100) *
                                 (CdsDet.FieldByName('PERCORIG').asFloat / 100), 2);

                              // Integração com a Contabilidade
                              If Not CtrlCorrigeObjEtapasProc.ContabilizaUsandoCriteriosDeRateios(
                                 '',
                                 '',
                                 '',
                                 0,
                                 '',
                                 'E', // (P)rovisionar ou (E)stornar
                                 0,
                                 idSegregaCriterio, // Id da tabela de rateio da Contabilidade
                                 //                                 CdsDet.FieldByName('NUMPROCTRAB').asString, // Código do Processo
                                 //                                 CdsDet.FieldByName('CODTIPOOBJETO').asFloat, // Id do Objeto
                                 CdsDet.FieldByName('DESCRICAO').asString, // Descrição do Objeto
                                 CdsDet.FieldByName('IDTIPOPROC').asInteger, // Programa
                                 CdsDet.FieldByName('TIPCODIGO').asString, // Sub-Programa
                                 '2', // Tipo do Lançamento (0 - Débito; 1 - Crédito; 2 - Partida Dobrada)
                                 Sistema.IdEmpresa, // Empresa
                                 Sistema.IdModulo, // Módulo de Origem
                                 Sistema.IdUsuario, // Usuário Ativo
                                 0, // Plano de Contas - a função vai fornecer este campo
                                 -1, // Unidade de Negócio
                                 Cds.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Débito
                                 Cds.FieldByName('CODSUBCONTA').asFloat, // Sub-Conta de Crédito
                                 Cds.FieldByName('IDPLANOPREV').asInteger, // Plano
                                 Cds.FieldByName('IDPATRO').asInteger, // Patro
                                 0, // Número da Planilha - a função vai fornecer este campo
                                 0, // Número do Lançamento
                                 sDataEncerramento, // Data encerramento
                                 Copy(sDataEncerramento, 7, 4) + Copy(sDataEncerramento, 3, 3), // Número do Documento
                                 // Histórico concatenado
                                 Copy('Programa: ' + qryPrograma.FieldByName('NOMETIPOPROC').asString, 1, 40), // 1ª Linha
                                 Copy('SubPrograma: ' + qryPrograma.fieldbyname('TIPDESCRICAO').asString, 1, 40), // 2ª Linha
                                 Copy('Encerramento do Processo', 1, 40), // 3ª Linha
                                 Copy('Valor Principal', 1, 40), // 4ª Linha
                                 '', // 5ª Linha da Histórico - a função vai fornecer este campo
                                 //
                                 '', // Centro de Custo para Débito
                                 '', // Conta para Débito - a função vai fornecer este campo
                                 '', // Centro de Custo para Crédito
                                 '', // Conta para Crédito - a função vai fornecer este campo
                                 '', // Código do Histórico Padrão
                                 dValorAtual, // Valor do Lançamento
                                 True, // Indica se os Lançamentos devem ser unidos em uma mesma Planilha
                                 True, // Indica se usa Plano da Patrocinadora
                                 dPlnCodigo
                                 ) Then
                                 Begin
                                    dtmBaseDados.dbBaseDados.Rollback;
                                    Exit;
                                 End;
                           End;

                        CdsDet.Next

                     End;

                  If (dPlnCodigo > 0) Then // Houve contabilização
                     Begin
                        MsgDlg('Processo Contabilizado...Planilha -> ' + floattostr(CtrlListTerceirosRH.GetNumeroPlanilha(dPlnCodigo)), 'Aviso', mtInformation, [mbOk, mbHelp], 0);
                     End;

                  If Not dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.StartTransaction;
                  dtmBaseDados.dbBaseDados.Commit;
               Except
                  On E: Exception Do
                     Begin
                        If dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.Rollback;
                        Raise;
                     End;
               End;
            End;
      End
   Else
      Begin
         Application.MessageBox('Integração Contábil não está ativa. Verifique !', 'Atenção !', MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
      End;

   FreeAndNil(qryPrograma);
End;

Procedure TfrmCustomCadProcesso.Progresso(Args: Array Of Variant);
Begin
   Self.Update;
   frmAguarde.Update;
End;

Procedure TfrmCustomCadProcesso.MudarNomeSubConta(Nome: String);
Begin
   If (CdsParamRH.FieldByName('FLGCRIASUBCONTA').asInteger = 1) Then
      sNomeSubConta := Nome
   Else
      sNomeSubConta := '';
End;

Function TfrmCustomCadProcesso.GetDataDemissao: TDate;
Begin
   Result := 0;
End;

Function TfrmCustomCadProcesso.OnClick_OkDetalheLitisconsortes: boolean;
Begin
   Result := false;

   If (Trim(edLitisconsorte.Text) = '') Then
      Begin
         MsgDlg('Litisconsorte Não Identificado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         exit;
      End;

   If (CdsLitis.FieldByName('INDTESTEMUNHA').isNull) Then
      Begin
         MsgDlg('Categoria Não Identificada.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         // dbrgCategoria.SetFocus;
         exit;
      End;

   If (Trim(edLitisconsorte.Text) <> '') Then
      CdsLitis.FieldByName('NOME').asString := edLitisconsorte.Text;

   CdsLitis.FieldByName('CATEGORIA').asString :=
      FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 0, 'Litisconsorte C.Parte',
      FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 1, 'Testemunha C.Parte',
      FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 2, 'Nossa Testemunha',
      FU.IFF(CdsLitis.FieldByName('INDTESTEMUNHA').asInteger = 3, 'Nossa Litisconsorte',
      'Parte Ré'))));

   CdsLitis.FieldByName('NOME').asString := edLitisconsorte.Text;
   CdsLitis.FieldByName('SITUACAO').asString :=
      FU.IFF(Trim(dblckMotivoLit.Text) = '', 'Normal', dblckMotivoLit.Text);

   Result := true;
End;

Function TfrmCustomCadProcesso.OnClick_OkDetalheObjetos: boolean;
Begin
   Result := false;

   {   If (DataAvalAntes > dbedDataAval.Date) And (dsDet.State = dsEdit) Then
         Begin
            MsgDlg('Você não deve retroagir a data (de ' + DateToStr(DataAvalAntes) +
               ' para ' + DateToStr(dbedDataAval.Date) + ')',
               'Aviso', mtInformation, [mbOk, mbHelp], 0);
            CdsDet.FieldByName('DATAAVAL').asDateTime := DataAvalAntes;
            dbedDataAval.Update;
            dbedDataAval.SetFocus;
            exit;
         End;}

   If (Cds.State = dsEdit) Then // Somente lança na alteração
      Begin
         If Not CdsDet.fieldbyname('TIPCODIGO').isnull Then
            Begin
               If (CdsDet.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]) And (qryRateioContabil.isEmpty) Then
                  Begin
                     MsgDlg('Este Sub-Programa exige inclusão de Rateio', 'Aviso', mtInformation, [mbOk, mbHelp], 0);
                     exit;
                  End;
            End;
      End;

   If (Trim(dblckTipObj.Text) = '') Then
      Begin
         MsgDlg('Objeto Não Identificado.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dblckTipObj.SetFocus;
         exit;
      End;

   {   If (dbedValRecl.Value = 0) And
         (MsgDlg(lblValorReclamado.Caption + ' Não Informado.' + CR_LF + 'Deseja informar agora?',
         'Aviso', mtInformation, [mbYes, mbNo], 0) = mrYes) Then
         Begin
            dbedValRecl.SetFocus;
            exit;
         End;

      If (dbedValor.Value = 0) And (dbedPerc.Value = 0) And (dbedValRecl.Value > 0) And
         (MsgDlg('Valor Esperado é igual a Zero.' + CR_LF + 'Confirma?', 'Confirmação',
         mtConfirmation, [mbYes, mbNo], 0) <> mrYes) Then
         Begin
            dbedPerc.SetFocus;
            exit;
         End;

        if (dbedValProbOrig.Value >= 1000) or (dbedPerc.Value >= 1000) then
        begin
          MsgDlg('Os Percentuais Não Podem Exceder a 999,99.',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
          dbedPerc.SetFocus;
          exit;
        end;
      }

   If (CdsDet.State In [dsInsert]) Then
      Begin
         CdsDet.FieldByName('FLGCONTABVLPRINC').asInteger := 0; // Não contabilizou o objeto
         CdsDet.FieldByName('FLGCONTABENCERRADO').asInteger := 0; // Não contabilizou o processo encerrado
         CdsDet.FieldByName('IDTIPOPROC').asInteger := CdsTipoObj.FieldByName('IDTIPOPROC').asInteger;
         CdsDet.FieldByName('TIPCODIGO').asString := CdsTipoObj.FieldByName('TIPCODIGO').asString;
      End;

   CdsDet.FieldByName('DESCRICAO').asString := dblckTipObj.Text;
   CdsDet.FieldByName('VALORPROVAVEL').asFloat := roundCM((CdsDet.FieldByName('VALORRECL').asFloat * CdsDet.FieldByName('PERCPROB').asFloat) / 100, 2);
   Cds.FieldByName('CUSTOPROC').asFloat := Cds.FieldByName('CUSTOPROC').asFloat +
      (1 - rgSituacao.ItemIndex) * CdsDet.FieldByName('VALORPROVAVEL').asFloat +
      rgSituacao.ItemIndex * CdsDet.FieldByName('VALORSENTENCA').asFloat - dValAntes;

   If (CdsParamRH.FieldByName('FLGPERCPROB').asInteger = 1) Then // sobre Estim.Original
      CdsDet.FieldByName('VALORPROVAVEL').asFloat := roundCM((CdsDet.FieldByName('VALORPROVAVEL').asFloat * CdsDet.FieldByName('PERCORIG').asFloat) / 100, 2);

   Result := true;
End;

Function TfrmCustomCadProcesso.OnClick_OkDetalheEtapas: boolean;
Var
   dValVariacaoCusto: double;
Begin
   Result := false;
   bEncerrar := false;
   bExecutar := false;

   //William M. Santos - Sol nº 131508 Kintana nº 750182 - INI
   If pgctrlDetalhe.ActivePageIndex = 4 Then //Etapas
      Begin
         If (Trim(dblckTipoEtp.Text) = '') Then
            Begin
               MsgDlg('Preencha o Tipo de Etapa.', 'Aviso', mtWarning, [mbOk], 0);
               dblckTipoEtp.SetFocus;
               exit;
            End;

         If (Trim(dtedDataReal.Text) = '') Then
            Begin
               MsgDlg('Preencha a Data.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
               dtedDataReal.SetFocus;
               exit;
            End;

         If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora - Paulo Nobreza
            Begin
               If (dbedNumSeqVinc.Value = 0) Then
                  Begin
                     MsgDlg('É necessário vincular o Nº da Sequência da Penhora que se deseja Desconstituir.', 'Aviso', mtInformation, [mbOk], 0);
                     dbedNumSeqVinc.setfocus;
                     exit;
                  End;

               If sDesconstituicaoOK = 'B' Then
                  AtualizaBEM(0, Cds.FieldByName('NUMPROCTRAB').asinteger, dbedNumSeqVinc.value);
               If sDesconstituicaoOK = 'I' Then
                  AtualizaIMOVEL('N', Cds.FieldByName('NUMPROCTRAB').asinteger, dbedNumSeqVinc.value);

            End;

         If (dbrgAbate.ItemIndex = -1) Then
            Begin
               MsgDlg('É necessário ser informado a que se refere o Valor (Depósito, Penhora, etc).', 'Aviso', mtInformation, [mbOk], 0);
               dbrgAbate.setfocus;
               exit;
            End;

         If (dbedValRec.Value = 0) Then //-- Renan Cristiano SOL 133219 | Kintana 774633
            Begin
               MsgDlg('É necessário informar o Valor.', 'Aviso', mtInformation, [mbOk], 0);
               dbedValRec.setfocus;
               exit;
            End;
      End;
   //William M. Santos - Sol nº 131508 Kintana nº 750182 - FIM

{   If (dbedNumSeqVinc.Value > 0) And
      ((dbedNumSeqVinc.Value > iNumSeqAtual) Or
      (dbedNumSeqVinc.Value = CdsEtapa.FieldByName('NUMSEQ').asInteger)) Then
      Begin
         MsgDlg('Etapa Vinculada Inválida.', 'Aviso', mtWarning, [mbOk], 0);
         dbedNumSeqVinc.SetFocus;
         exit;
      End;}

   CdsEtapa.FieldByName('ETAPA').asString := dblckTipoEtp.Text;

   If (Trim(dbedAssunto.Text) = '') Then
      dbedAssunto.Text := dblckTipoEtp.Text;

   If (CdsEtapa.FieldByName('VALORCUSTAS').asFloat > 0) Then
      Begin
         // Calcular variação da despesa
         dValVariacaoCusto := CdsEtapa.FieldByName('VALORCUSTAS').asFloat - dValAntes;

         // Somar variação ao valor total das despesas
         Cds.FieldByName('DESPESAPROC').asFloat :=
            Cds.FieldByName('DESPESAPROC').asFloat + dValVariacaoCusto;

         // Subtrair a variação ao custo total do processo caso seja indicado
         Cds.FieldByName('CUSTOPROC').asFloat :=
            Cds.FieldByName('CUSTOPROC').asFloat + dValVariacaoCusto;
      End;

   // Gravação do Honorário referente à Etapa
   If (redHonor.Value <> 0) And (redHonor.Visible) And
      Not (Cds.FieldByName('IDADVOGRECDA').IsNull) Then
      Begin
         dmCds.Cds.Data := CtrlHonorarioProcesso.ListHonorario(
            Cds.FieldByName('NUMPROCTRAB').asFloat,
            Cds.FieldByName('IDADVOGRECDA').asFloat, dtedDataReal.Date);
         If (dmCds.Cds.IsEmpty) Then
            Begin
               If (CdsHonorarios.Locate('NUMSEQ', CdsEtapa.FieldByName('NUMSEQ').asInteger, [])) Then
                  CdsHonorarios.Edit
               Else
                  CdsHonorarios.Insert;

               CdsHonorarios.FieldByName('NUMSEQ').asInteger := CdsEtapa.FieldByName('NUMSEQ').asInteger;
               CdsHonorarios.FieldByName('DATAPAGTOHONOR').asDateTime := dtedDataReal.Date;
               CdsHonorarios.FieldByName('IDFORNSERV').asFloat := Cds.FieldByName('IDADVOGRECDA').asFloat;
               CdsHonorarios.FieldByName('VALORHONOR').asFloat := redHonor.Value;
               CdsHonorarios.Post;
            End;
      End;

   lblHonor.Visible := false;
   redHonor.Visible := false;
   redHonor.Value := 0;

   If (mskedHora.Text = '  :  ') Then
      CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date
   Else
      CdsEtapa.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date +
         StrToTime(mskedHora.Text);

   bEncerrar := (CdsTipoEtapa.FieldByName('FLGENCERRAMENTO').asInteger = 1) And
      (Cds.FieldByName('FLGSITPROC').asInteger = 0);

   bExecutar := (CdsTipoEtapa.FieldByName('FLGEXECUCAO').asInteger = 1);

   Result := true;
End;

Function TfrmCustomCadProcesso.OnClick_OkDetalheHonor: boolean;
Begin
   Result := false;
   If (Trim(dtPagamentoHonor.Text) = '') Then
      Begin
         MsgDlg('Preencha a Data.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dtPagamentoHonor.SetFocus;
         exit;
      End;

   If (Trim(dblckFavor.Text) = '') Then
      Begin
         MsgDlg('Indique o Favorecido.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dblckFavor.SetFocus;
         exit;
      End;

   If (dbedValHon.Value = 0) Then
      Begin
         MsgDlg('Preencha o Valor.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
         dbedValHon.SetFocus;
         exit;
      End;

   CdsHonor.FieldByName('NOME').asString := CdsAdvog.FieldByName('NOME').asString;

   // Atualizar Total de Despesas
   Cds.FieldByName('DESPESAPROC').asFloat :=
      Cds.FieldByName('DESPESAPROC').asFloat + CdsHonor.FieldByName('VALORHONOR').asFloat *
      FU.IFF(CdsHonor.FieldByName('INDHONOR').asInteger = 0, 1, TotalValorSentenca / 100) - dValHonorAntes;
   dValHonorAntes := 0;
   Result := true;
End;

Procedure TfrmCustomCadProcesso.OnMudarDadosParticipante;
Begin
   edNomeContraparte.Text := CdsPartic.FieldByName('NOME').asString;
End;

Procedure TfrmCustomCadProcesso.FormCloseParamFichaProc(Sender: TObject;
   Var Action: TCloseAction);
Begin
   Action := caHide;
End;

Procedure TfrmCustomCadProcesso.CdsBeforePost(DataSet: TDataSet);
Begin
   Inherited;
   If dblckCCusto.Text <> '' Then
      Cds.FieldByName('IDEMPRESAPROP').asInteger := Sistema.IdEmpresa;

   If dblckCCustoCParte.Text <> '' Then
      Cds.FieldByName('IDEMPRESAPROP').asInteger := Sistema.IdEmpresa;

   If (dblckCCusto.Text = '') And (dblckCCustoCParte.Text = '') Then
      Cds.FieldByName('IDEMPRESAPROP').Clear;
End;

Procedure TfrmCustomCadProcesso.bbtnVerHistObjetoClick(Sender: TObject);
Begin
   Inherited;
   CdsHistObjeto.Data := CtrlHstObjProcTrab.ListGeral(CdsDet.FieldByName('NumProcTrab').AsFloat,
      CdsDet.FieldByName('CodTipoObjeto').AsFloat, CdsParamRH.FieldByName('FLGPERCPROB').asInteger);

   dbgrHistObjeto.Selected.Clear;
   dbgrHistObjeto.Selected.Add('DATAAVAL' + #9 + '12' + #9 + 'Data Avaliação');
   dbgrHistObjeto.Selected.Add('VALORRECL' + #9 + '16' + #9 + 'Valor Reclamado');
   dbgrHistObjeto.Selected.Add('PERCPROB' + #9 + '12' + #9 + '(%) Probabilidade');
   dbgrHistObjeto.Selected.Add('PERCORIG' + #9 + '12' + #9 + 'Variação Original (%)');
   dbgrHistObjeto.Selected.Add('JUROS' + #9 + '12' + #9 + 'Juros');
   dbgrHistObjeto.Selected.Add('CORRECAO' + #9 + '12' + #9 + 'Correção');
   dbgrHistObjeto.Selected.Add('VALORSENTENCA' + #9 + '12' + #9 + 'Valor Real');
   dbgrHistObjeto.Selected.Add('IDTIPOPROC' + #9 + '12' + #9 + 'Programa');
   dbgrHistObjeto.Selected.Add('TIPCODIGO' + #9 + '12' + #9 + 'Sub-Programa');
   dbgrHistObjeto.Selected.Add('DSCCONTABVLPRINC' + #9 + '17' + #9 + 'Contab.Principal');
   dbgrHistObjeto.Selected.Add('DSCTIPOLANCTO' + #9 + '10' + #9 + 'Tipo Lancto.');
   dbgrHistObjeto.Selected.Add('TRGDTINCLUSAO' + #9 + '20' + #9 + 'Observação');

   TFloatField(CdsHistObjeto.FieldByName('VALORRECL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsHistObjeto.FieldByName('PERCPROB')).DisplayFormat := '###,###,##0.0000';
   TFloatField(CdsHistObjeto.FieldByName('PERCORIG')).DisplayFormat := '###,###,##0.0000';
   TFloatField(CdsHistObjeto.FieldByName('JUROS')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsHistObjeto.FieldByName('CORRECAO')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsHistObjeto.FieldByName('VALORSENTENCA')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsHistObjeto.FieldByName('VALORPROVAVEL')).DisplayFormat := '###,###,##0.00';
   TFloatField(CdsHistObjeto.FieldByName('VALORORIG')).DisplayFormat := '###,###,##0.00';

   townHistObjeto.Visible := true;
   townHistObjeto.Top := 200;
   Self.Enabled := false;
End;

Procedure TfrmCustomCadProcesso.btnFecharHistObjetoClick(Sender: TObject);
Begin
   Inherited;
   townHistObjeto.Visible := false;
   Self.Enabled := true;
End;

Procedure TfrmCustomCadProcesso.CdsDetAfterPost(DataSet: TDataSet);
Begin
   Inherited;
   CdsHistObjetoGravar.Insert;
   CdsHistObjetoGravar.FieldByName('CODTIPOOBJETO').AsFloat := CdsDet.FieldByName('CODTIPOOBJETO').AsFloat;
   CdsHistObjetoGravar.FieldByName('VALORRECL').AsFloat := CdsDet.FieldByName('VALORRECL').AsFloat;
   CdsHistObjetoGravar.FieldByName('PERCPROB').AsFloat := CdsDet.FieldByName('PERCPROB').AsFloat;
   CdsHistObjetoGravar.FieldByName('VALORSENTENCA').AsFloat := CdsDet.FieldByName('VALORSENTENCA').AsFloat;
   CdsHistObjetoGravar.FieldByName('PERCORIG').AsFloat := CdsDet.FieldByName('PERCORIG').AsFloat;
   CdsHistObjetoGravar.FieldByName('OBSERVACAO').AsString := CdsDet.FieldByName('OBSERVACAO').AsString;
   CdsHistObjetoGravar.FieldByName('INDVALOR').AsInteger := CdsDet.FieldByName('INDVALOR').AsInteger;
   CdsHistObjetoGravar.FieldByName('DATAINICIO').AsDateTime := CdsDet.FieldByName('DATAINICIO').AsDateTime;
   CdsHistObjetoGravar.FieldByName('DATAFINAL').AsDateTime := CdsDet.FieldByName('DATAFINAL').AsDateTime;
   CdsHistObjetoGravar.FieldByName('DATAAVAL').AsDateTime := CdsDet.FieldByName('DATAAVAL').AsDateTime;
   CdsHistObjetoGravar.FieldByName('IDTIPOPROC').asInteger := CdsDet.FieldByName('IDTIPOPROC').asInteger;
   CdsHistObjetoGravar.FieldByName('TIPCODIGO').asString := CdsDet.FieldByName('TIPCODIGO').asString;
   CdsHistObjetoGravar.FieldByName('FLGTIPOLANCTO').asString := 'L'; // Log
   CdsHistObjetoGravar.FieldByName('FLGCONTABENCERRADO').asInteger := 0; // Processo encerrado não contabilizado
   CdsHistObjetoGravar.Post;
End;

Procedure TfrmCustomCadProcesso.CdsDetBeforeDelete(DataSet: TDataSet);
Begin
   Inherited;
   CdsHistObjetoGravar.Filter := 'CODTIPOOBJETO = ' + CdsDet.FieldByName('CODTIPOOBJETO').asString;
   CdsHistObjetoGravar.Filtered := true;
   While Not (CdsHistObjetoGravar.EOF) Do
      CdsHistObjetoGravar.Delete;
   CdsHistObjetoGravar.Filtered := false;
   CdsHistObjetoGravar.Filter := '';
End;

Procedure TfrmCustomCadProcesso.dbedDataAvalEnter(Sender: TObject);
Begin
   Inherited;
   DataAvalAntes := dbedDataAval.Date;
End;

Procedure TfrmCustomCadProcesso.dblckMotivoLitCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   If (modified) And (CdsLitis.State <> dsBrowse) Then
      Begin
         If (Trim(dblckMotivoLit.Text) <> '') Then
            CdsLitis.FieldByName('DATAALTSIT').asString := DateToStr(Date)
         Else
            CdsLitis.FieldByName('DATAALTSIT').Clear;
      End;
End;

Procedure TfrmCustomCadProcesso.btnContaBancClick(Sender: TObject);
Begin
   Inherited;
   If Not (Assigned(frmCadRegContaBanc)) Then
      frmCadRegContaBanc := TfrmCadRegContaBanc.Create(Application);

   // SOL 171564 KTN 1538999 - Paulo Nobre
   frmCadRegContaBanc.ExibirTelaContaBanc(0, CdsEtapa);
End;

Procedure TfrmCustomCadProcesso.bbtnMultaClick(Sender: TObject);
Begin
   Inherited;
   If ds.State = dsInsert Then
      Begin
         MsgDlg('A Subtela de Multa só pode ser chamada em processos já cadastrados.' + CR_LF +
            'Conclua o cadastramento deste processo, para poder fazer esta operação.',
            'Aviso', mtInformation, [mbOk, mbHelp], 0);
         exit;
      End;

   If Not (Assigned(frmCadRegMulta)) Then
      frmCadRegMulta := frmCadRegMulta;
   frmCadRegMulta := TfrmCadRegMulta.Create(Application);
   frmCadRegMulta.ExibirTelaMulta(Cds, CdsEtapa, CdsDet);
End;

Procedure TfrmCustomCadProcesso.dbrgIndCondenacaoChange(Sender: TObject);
Begin
   Inherited;
   bbtnCondenacao.Visible := dbrgIndCondenacao.ItemIndex = 0; //in [0,1];
End;

Procedure TfrmCustomCadProcesso.bbtnCondenacaoClick(Sender: TObject);
Begin
   If Not (Assigned(frmCadRegCondenacao)) Then
      frmCadRegCondenacao := TfrmCadRegCondenacao.Create(Application);

   frmCadRegCondenacao.ExibirTelaCondenacao(Cds, CdsLitis, TotalValorSentenca);
End;

Procedure TfrmCustomCadProcesso.pnlHonorEnter(Sender: TObject);
Begin
   Inherited;
   cbxSucumbencia.Checked := (CdsHonor.FieldByName('IDFORNSERV').asFloat > 0) And
      (CdsHonor.FieldByName('IDFORNSERV').asFloat = Cds.FieldByName('IDADVOGRECTE').asFloat);

   cbxSucumbenciaClick(Self);
End;

Function TfrmCustomCadProcesso.TotalValorSentenca: double;
Begin
   Inherited;
   CdsDet.First;
   Result := 0;
   While Not CdsDet.Eof Do
      Begin
         Result := Result + CdsDet.FieldByName('VALORSENTENCA').asFloat;
         CdsDet.Next;
      End;
   CdsDet.First;
End;

Procedure TfrmCustomCadProcesso.dbrgIndHonorChange(Sender: TObject);
Begin
   Inherited;
   redValorTotal.Visible := dbrgIndHonor.ItemIndex = 1;
   redValorTotal.Value := TotalValorSentenca;
End;

Procedure TfrmCustomCadProcesso.CdsAfterPost(DataSet: TDataSet);
Begin
   Inherited;
   If (Cds.FieldByName('IDVARAJUSTICA').AsFloat <> IdVaraAntes) Or
      (Cds.FieldByName('IDTIPOPROC').AsFloat <> IdTipoAntes) Or
      (Cds.FieldByName('FLGPARTEATIVA').AsFloat <> IdParteAntes) Then
      Begin
         CdsHistProcessoGravar.Insert;
         CdsHistProcessoGravar.FieldByName('IDVARAJUSTICA').AsFloat := Cds.FieldByName('IDVARAJUSTICA').AsFloat;
         CdsHistProcessoGravar.FieldByName('FLGPARTEATIVA').AsFloat := Cds.FieldByName('FLGPARTEATIVA').AsFloat;
         CdsHistProcessoGravar.Post;
      End;
End;

Procedure TfrmCustomCadProcesso.sbtnApagarClick(Sender: TObject);
Begin
   CdsHistProcessoGravar.Data := CtrlProcessoTrab.ListHistAlterDoProcesso(Cds.FieldByName('NumProcTrab').AsFloat);
   Inherited;
End;

Procedure TfrmCustomCadProcesso.sbtnIncLitisClick(Sender: TObject);
Var
   lstArquivo, lstErros: TStringList;
   iCategoria, iEmpresa, iMotivo: Integer;
   dValorCond: Double;
   CentroCusto, DataAlt: String;
Begin
   Inherited;
   // Pendência 23799 - Funcef
   OpenDlg.InitialDir := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\'; //Ádler Teodoro de Souza SOL 109421 KINTANA 496332

   If (OpenDlg.Execute) Then
      lblArquivo.Caption := MinimizeName(OpenDlg.FileName, lblArquivo.Canvas, lblArquivo.Width);

   sbtnIncLitis.Down := False;

   If (FileExists(OpenDlg.FileName)) Then
      Begin
         lstArquivo := TStringList.Create;
         lstErros := TStringList.Create;

         lstArquivo.LoadFromFile(OpenDlg.FileName);
         pgbarProgresso.Visible := true;
         pgbarProgresso.Position := 0;
         pgbarProgresso.Min := 0;
         pgbarProgresso.Max := lstArquivo.Count;

         CtrlProcessoTrab.CreateThreadProgresso;

         Case (dbrgCategoria.ItemIndex) Of
            0: iCategoria := 0; // Litisconsorte Contraparte
            1: iCategoria := 3; // Nossa Litisconsorte
            2: iCategoria := 1; // Testemunha Contraparte
            3: iCategoria := 2; // Nossa Testemunha
            4: iCategoria := 4; // Parte Ré
         End;

         dValorCond := dbredValorCondenacao.Value;

         iEmpresa := Sistema.IdEmpresa;
         If (gbxCentroCustoLitis.Visible) And (dblckCCustoLitis.Text <> '') Then
            CentroCusto := CdsCCusto.FieldByName('CODCENTROCUSTO').asString
         Else
            CentroCusto := '';

         DataAlt := dbedDataAltSitLitis.Text;
         If (dblckMotivoLit.Text <> '') Then
            iMotivo := CdsMotivo.FieldByName('IDMOTIVO').asInteger
         Else
            iMotivo := 0;

         If (dsLitis.State = dsInsert) Then
            CdsLitis.delete;

         lstErros := CtrlProcessoTrab.ProcessarTxtLitisconsortes(Cds.FieldByName('NumProcTrab').AsFloat,
            lstArquivo.Text, iCategoria, dValorCond, iEmpresa, CentroCusto, iMotivo, DataAlt);
         If (lstErros.Text = '') Then
            Begin
               CtrlProcessoTrab.FreeThreadProgresso;
               MsgDlg(CtrlProcessoTrab.MessageInfo, 'Informação', mtInformation, [mbOk, mbHelp], 0);
            End
         Else
            Begin
               CtrlProcessoTrab.FreeThreadProgresso;
               MsgDlg(lstErros.Text, 'Erros', mtError, [mbOk, mbHelp], 0);
            End;

         pgbarProgresso.Visible := false;
         pgbarProgresso.Position := 0;

         lstArquivo.Free;
      End
   Else
      MsgDlg('Arquivo a ser lido não encontrado ou não pode ser aberto.', 'Erro', mtError, [mbOk, mbHelp], 0);

   bbtnVoltarDetClick(Sender);
End;

Procedure TfrmCustomCadProcesso.VerificaEtapaExecucao;
Begin
   CdsEtapa.DisableControls;
   CdsEtapa.First;
   bExecutando := False;
   While Not CdsEtapa.Eof Do
      Begin
         If (CdsTipoEtapa.Locate('CODTIPORECURSO', CdsEtapa.FieldByName('CODTIPORECURSO').asInteger, [])) And
            (CdsTipoEtapa.FieldByName('FLGEXECUCAO').asInteger = 1) Then
            Begin
               bExecutando := True;
               break;
            End;
         CdsEtapa.Next;
      End;
   CdsEtapa.First;

   dbrgIndCondenacao.Visible :=
      (bExecutando) Or (bExecutar) Or
      (((Cds.FieldByName('TIPOENCER').asString = 'C') Or
      (Cds.FieldByName('TIPOENCER').asString = 'S')) And
      ((Cds.FieldByName('FLGSITPROC').asInteger = 1) Or (rgSituacao.ItemIndex = 1)) And
      (CtrlProcessoTrab.ContaNossaLitisconsorte(Cds.FieldByName('NUMPROCTRAB').asFloat) > 0));
   bbtnCondenacao.Visible := dbrgIndCondenacao.ItemIndex = 0; //in [0,1];
   CdsEtapa.EnableControls;
End;

Procedure TfrmCustomCadProcesso.btnFecharHistoObjetoClick(Sender: TObject);
Begin
   Inherited;
   townHistObjeto.Visible := false;
   Self.Enabled := true;
End;

Procedure TfrmCustomCadProcesso.btnFechaHistEtapasClick(Sender: TObject);
Begin
   Inherited;
   townHistEtapa.Visible := false;
   Self.Enabled := true;
End;

Procedure TfrmCustomCadProcesso.btnVerHistoricoEtapasClick(Sender: TObject);
Begin
   Inherited;

   cdsHistoricoEtapas.data := CtrlHstEtapaProcTrab.SelecionaHstetapaproctrab(CdsDet.FieldByName('NumProcTrab').AsFloat,
      CdsEtapa.FieldByName('NUMSEQ').AsFloat, CdsEtapa.FieldByName('CODTIPORECURSO').asFloat);

   TFloatField(cdsHistoricoEtapas.FieldByName('ULTIMO_VALOR_ATUALIZADO')).DisplayFormat := '###,###,##0.00';
   TFloatField(cdsHistoricoEtapas.FieldByName('ULTIMA_CUSTAS_ATUALIZADA')).DisplayFormat := '###,###,##0.00';

   townHistEtapa.Caption := 'Histórico da Etapa : ' + CdsEtapa.FieldByName('ETAPA').AsString;
   townHistEtapa.Visible := true;
   townHistEtapa.Top := 200;
   Self.Enabled := false;

   dbgHisEtapas.Columns[0].DisplayLabel := 'Data Última Atualiz.';
   dbgHisEtapas.Columns[1].DisplayLabel := 'Último Valor Atualizado';
   dbgHisEtapas.Columns[1].DisplayWidth := 19;
   dbgHisEtapas.Columns[2].DisplayLabel := 'Última Custas Atualizada';
   dbgHisEtapas.Columns[2].DisplayWidth := 19;
   dbgHisEtapas.Columns[3].DisplayLabel := 'Índice aplicado no Valor';
   dbgHisEtapas.Columns[3].DisplayWidth := 30;
   dbgHisEtapas.Columns[4].DisplayLabel := 'Data/Hora Lancto.';
   dbgHisEtapas.Columns[5].DisplayLabel := 'Usuário';

End;

Procedure TfrmCustomCadProcesso.sbtnExcluiDetClick(Sender: TObject);
Begin
   If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

   If pgctrlDetalhe.ActivePageIndex = 4 Then // Etapas   - PauloNobreza
      Begin
         If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
            Begin
               TestaSeDesconstituicao(Cds.FieldByName('NUMPROCTRAB').asinteger, CdsEtapa.FieldByName('NUMSEQVINC').asinteger);
               If sDesconstituicaoOK = 'B' Then
                  AtualizaBEM(1, Cds.FieldByName('NUMPROCTRAB').asinteger, CdsEtapa.FieldByName('NUMSEQVINC').asinteger);
               If sDesconstituicaoOK = 'I' Then
                  AtualizaIMOVEL('P', Cds.FieldByName('NUMPROCTRAB').asinteger, CdsEtapa.FieldByName('NUMSEQVINC').asinteger);
               If sDesconstituicaoOK = 'V' Then
                  //                  AtualizaINVESTIMENTO('P', cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
                  If sDesconstituicaoOK = 'F' Then
                     //                  AtualizaFUNDOS('P', cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
            End;

         If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Then //Depósito Judicial
            CtrlEtpDesdobramento.ExcluiDesdobramento(iNumProcTrab, 1035, Cds.FieldByName('NUMSEQ').AsInteger);
      End;

   If pgctrlDetalhe.ActivePageIndex = 3 Then // Objetos
      Begin
         If (Not CdsDet.fieldbyname('IDTIPOPROC').isnull) And (Not CdsDet.fieldbyname('TIPCODIGO').isnull) Then
            Begin
               If (CdsDet.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]) Then
                  Begin
                     Screen.Cursor := crSQLWait;
                     qryAux1.SQL.clear;
                     qryAux1.SQL.add('DELETE JURIDICORATEIOCONTABIL   ');
                     qryAux1.SQL.ADD('WHERE NUMPROCTRAB = ' + FloatToStr(Cds.FieldByName('NUMPROCTRAB').asinteger));
                     qryAux1.SQL.ADD('AND CODTIPOOBJETO = ' + FloatToStr(CdsDet.FieldByName('CODTIPOOBJETO').AsInteger));
                     qryAux1.SQL.ADD('AND PROGRAMA = ' + FloatToStr(CdsTipoObj.FieldByName('IDTIPOPROC').asinteger));
                     qryAux1.SQL.ADD('AND SUB_PROGRAMA = ' + FloatToStr(CdsTipoObj.FieldByName('TIPCODIGO').asinteger));
                     qryAux1.ExecSQL;
                     Screen.Cursor := crDefault;
                  End;
            End;
      End;

   Inherited;
End;

Procedure TfrmCustomCadProcesso.dbedNumSeqVincChange(Sender: TObject);
Begin
   Inherited;

End;

//************* novas rotinas ********************************************************************************

Procedure TfrmCustomCadProcesso.AtualizaBEM(iSit: Integer; NumProc, NumSeq: double);
Begin
   Screen.Cursor := crSQLWait;
   qryAux1.SQL.clear;
   qryAux1.SQL.add('SELECT IDBEM, INDPENHORA FROM ETAPAPROCTRAB ');
   qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + FloatToStr(NumProc));
   qryAux1.SQL.add('      AND CODTIPORECURSO = ' + FloatToStr(1030)); // Penhora
   qryAux1.SQL.add('      AND NUMSEQ = ' + FloatToStr(NumSeq));
   qryAux1.Open;
   If Not qryAux1.isEmpty Then
      Begin
         If iSit = 0 Then
            Begin
               CdsEtapa.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
               CdsEtapa.FieldByName('INDVALOR').asInteger := 1;
               CdsEtapa.FieldByName('INDPENHORA').asInteger := qryAux1.FieldByName('INDPENHORA').asinteger;
               CdsEtapa.FieldByName('VALOR').asFloat := dbedValRec.value;
               CdsEtapa.FieldByName('IDBEM').asInteger := qryAux1.FieldByName('IDBEM').asinteger;
            End;
      End;

   qryAux.SQL.clear;
   qryAux.SQL.add('UPDATE BEM SET FLGPENHORA = ' + quotedstr(inttostr(iSit))); // Libera o bem da Penhora
   qryAux.SQL.add('WHERE IDBEM = ' + FloatToStr(qryAux1.FieldByName('IDBEM').asinteger));
   qryAux.ExecSql;

   If iSit = 0 Then
      Begin
         MsgDlg('BEM Desconstituído com sucesso !', 'Aviso', mtInformation, [mbOk], 0);
         lblTipoDesconstituicao.caption := '';
         sDesconstituicaoOK := '';
         dbedValRec.setfocus;
      End;

   Screen.Cursor := crDefault;
End;

Procedure TfrmCustomCadProcesso.AtualizaIMOVEL(sSit: String; NumProc, NumSeq: double);
Begin
   Screen.Cursor := crSQLWait;
   qryAux1.SQL.clear;
   qryAux1.SQL.add('SELECT IDIMOVEL, INDPENHORA FROM ETAPAPROCTRAB ');
   qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + FloatToStr(NumProc));
   qryAux1.SQL.add('      AND CODTIPORECURSO = ' + FloatToStr(1030)); // Penhora
   qryAux1.SQL.add('      AND NUMSEQ = ' + FloatToStr(NumSeq));
   qryAux1.Open;
   If Not qryAux1.isEmpty Then
      Begin
         If sSit = 'N' Then
            Begin
               CdsEtapa.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
               CdsEtapa.FieldByName('INDVALOR').asInteger := 1;
               CdsEtapa.FieldByName('INDPENHORA').asInteger := qryAux1.FieldByName('INDPENHORA').asinteger;
               CdsEtapa.FieldByName('VALOR').asFloat := dbedValRec.value;
               CdsEtapa.FieldByName('IDIMOVEL').asInteger := qryAux1.FieldByName('IDIMOVEL').asinteger;
            End;
      End;

   qryAux.SQL.clear;
   qryAux.SQL.add('UPDATE IMOVEL SET FLGSTATUS = ' + quotedstr(sSit)); // Libera o bem da Penhora
   qryAux.SQL.add('WHERE IDIMOVEL = ' + FloatToStr(qryAux1.FieldByName('IDIMOVEL').asinteger));
   qryAux.ExecSql;

   If sSit = 'N' Then
      Begin
         MsgDlg('IMOVEL Desconstituído com sucesso !', 'Aviso', mtInformation, [mbOk], 0);
         lblTipoDesconstituicao.caption := '';
         sDesconstituicaoOK := '';
         dbedValRec.setfocus;
      End;

   Screen.Cursor := crDefault;
End;

Procedure TfrmCustomCadProcesso.TestaSeDesconstituicao(NumProc2, NumSeq2: double);
Begin
   Screen.Cursor := crSQLWait;
   qryAux1.SQL.clear;
   qryAux1.SQL.add('SELECT IDBEM, IDIMOVEL, IDINVESTIMENTO, IDFUNDOINVEST, VALORREC, INDPENHORA FROM ETAPAPROCTRAB ');
   qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + FloatToStr(NumProc2));
   qryAux1.SQL.add('      AND CODTIPORECURSO = ' + FloatToStr(1030)); // Penhora
   qryAux1.SQL.add('      AND NUMSEQ = ' + FloatToStr(NumSeq2));
   qryAux1.Open;
   Screen.Cursor := crDefault;
   If qryAux1.FieldByName('INDPENHORA').asInteger <> 4 Then // Não for Numerário
      Begin
         If (qryAux1.FieldByName('IDBEM').isnull) And
            (qryAux1.FieldByName('IDIMOVEL').isnull) And
            (qryAux1.FieldByName('IDINVESTIMENTO').isnull) And
            (qryAux1.FieldByName('IDFUNDOINVEST').isnull) Then
            sDesconstituicaoOK := '' // Vinculação informada não remete a uma penhora válida
         Else
            Begin
               If Not (qryAux1.FieldByName('IDBEM').isnull) Then
                  sDesconstituicaoOK := 'B'; // Tem bem penhorado - Bem
               If Not (qryAux1.FieldByName('IDIMOVEL').isnull) Then
                  sDesconstituicaoOK := 'I'; // Tem bem penhorado - Imovel
               If Not (qryAux1.FieldByName('IDINVESTIMENTO').isnull) Then
                  sDesconstituicaoOK := 'V'; // Tem penhora - Investimento
               If Not (qryAux1.FieldByName('IDFUNDOINVEST').isnull) Then
                  sDesconstituicaoOK := 'F'; // Tem penhora - Fundos

               ValorDesconstituicao := qryAux1.FieldByName('VALORREC').asFloat * -1;
            End;
      End
   Else
      Begin
         sDesconstituicaoOK := 'N'; // Tem penhora- Numerário
         ValorDesconstituicao := qryAux1.FieldByName('VALORREC').asFloat * -1;
      End;
End;

Procedure TfrmCustomCadProcesso.sbtnInsDetClick(Sender: TObject);
Begin
   AcharUltimoNumSeq;

   If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Inherited;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

End;

Procedure TfrmCustomCadProcesso.sbtnAltDetClick(Sender: TObject);
Begin
   iProgramaAnt := CdsTipoObj.FieldByName('IDTIPOPROC').asInteger;
   sSubProgramaAnt := CdsTipoObj.FieldByName('TIPCODIGO').asString;

   If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

   Inherited;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;

   // Paulo Nobre - 24/05/2012
   If (pgctrlDetalhe.ActivePage = tbsDet) Then
      dblckTipObjCloseUp(self, CdsTipoObj, CdsDet, False);

   If (Not CdsDet.fieldbyname('IDTIPOPROC').isnull) And (Not CdsDet.fieldbyname('TIPCODIGO').isnull) Then
      Begin
         bbRateio.Enabled := (CdsDet.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]);
         dbgPerc.visible := False;
         If (CdsDet.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]) Then
            Begin
               dbgPerc.visible := True;
               Screen.Cursor := crSQLWait;
               qryRateioContabil.Close;
               qryRateioContabil.SQL.Clear;
               qryRateioContabil.SQL.ADD('SELECT J.PERCRATEIO, V.PLANPRVCONTABPATRO          ');
               qryRateioContabil.SQL.ADD('FROM JURIDICORATEIOCONTABIL J, VWPLANPREVCTBPATR V ');
               qryRateioContabil.SQL.ADD('WHERE J.IDPLANPREVCTBPATR = V.IDPLANPREVCTBPATR    ');
               qryRateioContabil.SQL.ADD('AND J.NUMPROCTRAB = ' + FloatToStr(Cds.FieldByName('NUMPROCTRAB').asinteger));
               qryRateioContabil.SQL.ADD('AND J.CODTIPOOBJETO = ' + FloatToStr(CdsDet.FieldByName('CODTIPOOBJETO').AsInteger));
               qryRateioContabil.SQL.ADD('AND J.PROGRAMA = ' + FloatToStr(CdsDet.FieldByName('IDTIPOPROC').asinteger));
               qryRateioContabil.SQL.ADD('AND J.SUB_PROGRAMA = ' + FloatToStr(CdsDet.FieldByName('TIPCODIGO').asinteger));
               qryRateioContabil.Open;
               Screen.Cursor := crDefault;
            End;
      End;

End;

Procedure TfrmCustomCadProcesso.dbedNumSeqVincExit(Sender: TObject);
Begin
   Inherited;
   If CdsEtapa.FieldByName('NUMSEQVINC').asinteger > 0 Then
      Begin
         If pgctrlDetalhe.ActivePageIndex = 4 Then // Etapas   - PauloNobreza
            Begin
               If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
                  Begin
                     TestaSeDesconstituicao(Cds.FieldByName('NUMPROCTRAB').asinteger, CdsEtapa.FieldByName('NUMSEQVINC').asinteger);
                     If sDesconstituicaoOK <> '' Then
                        Begin
                           If sDesconstituicaoOK = 'B' Then
                              lblTipoDesconstituicao.caption := 'Desconstituição de BEM';
                           If sDesconstituicaoOK = 'I' Then
                              lblTipoDesconstituicao.caption := 'Desconstituição de IMÓVEL';
                           //                           If sDesconstituicaoOK = 'V' Then
                           //                              lblTipoDesconstituicao.caption := 'Desconstituição de INVESTIMENTO';
                           If sDesconstituicaoOK = 'N' Then
                              lblTipoDesconstituicao.caption := 'Desconstituição de NUMERÁRIO';

                           dbedValRec.value := ValorDesconstituicao;
                        End
                     Else
                        Begin
                           MsgDlg('É necessário vincular o Nº da Sequência de uma Penhora de Bem ou Imóvel ou Investimento.', 'Aviso', mtInformation, [mbOk], 0);
                           dbedNumSeqVinc.setfocus;
                        End;
                     btnPenhora.Enabled := False;
                  End
               Else
                  Begin
                     btnPenhora.Enabled := True;
                     lblTipoDesconstituicao.caption := '';
                  End;
            End;
      End;
End;

Procedure TfrmCustomCadProcesso.dblckTipObjCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;

   If (Not CdsTipoObj.fieldbyname('IDTIPOPROC').isnull) And (Not CdsTipoObj.fieldbyname('TIPCODIGO').isnull) Then
      Begin
         cdsDet.fieldbyname('IDTIPOPROC').asInteger := CdsTipoObj.fieldbyname('IDTIPOPROC').asInteger;
         cdsDet.fieldbyname('TIPCODIGO').asString := CdsTipoObj.fieldbyname('TIPCODIGO').asString;

         If (Cds.State = dsEdit) Then // Somente lança na alteração
            Begin
               bbRateio.Enabled := (CdsTipoObj.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]);
               dbgPerc.visible := False;
               If (CdsTipoObj.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]) Then
                  Begin
                     dbgPerc.visible := True;
                     Screen.Cursor := crSQLWait;
                     qryRateioContabil.Close;
                     qryRateioContabil.SQL.Clear;
                     qryRateioContabil.SQL.ADD('SELECT J.PERCRATEIO, V.PLANPRVCONTABPATRO          ');
                     qryRateioContabil.SQL.ADD('FROM JURIDICORATEIOCONTABIL J, VWPLANPREVCTBPATR V ');
                     qryRateioContabil.SQL.ADD('WHERE J.IDPLANPREVCTBPATR = V.IDPLANPREVCTBPATR    ');
                     qryRateioContabil.SQL.ADD('AND J.NUMPROCTRAB = ' + FloatToStr(Cds.FieldByName('NUMPROCTRAB').asinteger));
                     qryRateioContabil.SQL.ADD('AND J.CODTIPOOBJETO = ' + FloatToStr(CdsDet.FieldByName('CODTIPOOBJETO').AsInteger));
                     qryRateioContabil.SQL.ADD('AND J.PROGRAMA = ' + FloatToStr(CdsTipoObj.FieldByName('IDTIPOPROC').asinteger));
                     qryRateioContabil.SQL.ADD('AND J.SUB_PROGRAMA = ' + FloatToStr(CdsTipoObj.FieldByName('TIPCODIGO').asinteger));
                     qryRateioContabil.Open;
                     Screen.Cursor := crDefault;
                  End;
            End;
      End;
End;

Procedure TfrmCustomCadProcesso.bbRateioClick(Sender: TObject);
Begin
   Inherited;
   If Not (Assigned(frmCadRateioContabil)) Then
      frmCadRateioContabil := TfrmCadRateioContabil.Create(Application);

   frmCadRateioContabil.ExibirTelaRateioContabil(
      Cds.FieldByName('NUMPROCTRAB').asinteger,
      CdsDet.FieldByName('CODTIPOOBJETO').asinteger,
      CdsDet.FieldByName('IDTIPOPROC').asinteger, // Programa
      CdsDet.FieldByName('TIPCODIGO').asinteger); // Sub-Programa

   If (Not CdsDet.fieldbyname('IDTIPOPROC').isnull) And (Not CdsDet.fieldbyname('TIPCODIGO').isnull) Then
      Begin
         If (CdsDet.fieldbyname('TIPCODIGO').asInteger In [43, 44, 45, 46]) Then
            Begin
               dbgPerc.visible := True;
               Screen.Cursor := crSQLWait;
               qryRateioContabil.Close;
               qryRateioContabil.SQL.Clear;
               qryRateioContabil.SQL.ADD('SELECT J.PERCRATEIO, V.PLANPRVCONTABPATRO          ');
               qryRateioContabil.SQL.ADD('FROM JURIDICORATEIOCONTABIL J, VWPLANPREVCTBPATR V ');
               qryRateioContabil.SQL.ADD('WHERE J.IDPLANPREVCTBPATR = V.IDPLANPREVCTBPATR    ');
               qryRateioContabil.SQL.ADD('AND J.NUMPROCTRAB = ' + FloatToStr(Cds.FieldByName('NUMPROCTRAB').asinteger));
               qryRateioContabil.SQL.ADD('AND J.CODTIPOOBJETO = ' + FloatToStr(CdsDet.FieldByName('CODTIPOOBJETO').AsInteger));
               qryRateioContabil.SQL.ADD('AND J.PROGRAMA = ' + FloatToStr(CdsDet.FieldByName('IDTIPOPROC').asinteger));
               qryRateioContabil.SQL.ADD('AND J.SUB_PROGRAMA = ' + FloatToStr(CdsDet.FieldByName('TIPCODIGO').asinteger));
               qryRateioContabil.Open;
               Screen.Cursor := crDefault;
            End;
      End;
End;

End.



