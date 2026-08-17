//*****************************************************************************************************
//Rotina.............: spbInformeRendimentoPFClick
//N. SIG.............: 134189
//Data da Alteração..: 03/01/2023
//Responsável........: Edilaine
//Descrição..........: Ações de equacionamento Transitado em Julgado- Implementação DIRF
//*****************************************************************************************************
//Rotina.............:  (DFM) qryBenefCompMovFolhasProc
//N. SIG.............: 113550
//Data da Alteração..: 17/02/2021
//Responsável........: edilaine
//Descrição..........: buscando número da ação e percentual errado
//*****************************************************************************************************
//Rotina.............:  (DFM) qryBenefCompMovFolhasProc
//N. SIG.............: 113338
//Data da Alteração..: 10/02/2021
//Responsável........: edilaine
//Descrição..........: Ajuste na ordenação para compensar todos os IDINFORMES antes de mudar a fontepagadora
//*****************************************************************************************************
//Rotina.............:  (DFM) qryBenefCompMovFolhasProc, qryBenefValoresACompensarPorFolhaPLACONTA
//N. SIG.............: 96359
//Data da Alteração..: 16/01/2020
//Responsável........: edilaine
//Descrição..........: Ajuste no numero de processo da compensaçao
//*****************************************************************************************************
//N. SIG.............: 96222
//Data da Alteração..: 10/01/2020
//Responsável........: Ewerton Beltramini, Rafael Vasconcelos
//Descrição..........: Inclusão de parametro na procudure SP_BuscaPensao.
//*****************************************************************************************************
//Rotina.............: spbProcessarMovimentoClick
//N. SIG.............: 85183.92415
//Data da Alteração..: 23/10/2019
//Responsável........: Taffarel/Darivaldo
//Descrição..........: Inclusão da chamada da procedure CM.SP_FB_BUSCA_DIRF_PENSAO_INSS
//*****************************************************************************************************
//Rotina                : spbExpBenefSel, SpeedButton4, SpeedButton7, SpeedButton6, spbExpMov
//N. SIG                : 89051
//Data da Alteração:    : 19/07/2019
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Taffarel Sevaybriker
//Descrição             : Erro ao fechar caixa de diálogo do componente qeMovPrepDARF
//******************************************************************************
//Rotina.............: (dfm) qryBenefValoresACompensar, qryBenefValoresACompensarPorFolha
//N. SIG.............: 81284
//Data da Alteração..: 30/01/2019
//Responsável........: Edilaine
//Descrição..........: Compensa outros valores de ação judicial
//*****************************************************************************************************
//Rotina.............: (dfm) qryBenefCompMovFolhasProc
//N. SIG.............: 80964
//Data da Alteração..: 25/01/2019
//Responsável........: Edilaine
//Descrição..........: Compensa resgate regressivo
//*****************************************************************************************************
//Rotina.............: spbProcessarSelecoesClick
//N. SIG.............: 58888
//Data da Alteração..: 04/12/2017
//Responsável........: André Imakawa
//Descrição..........: Isenção Retroativa, processar a partir do mes de isenção.
//*****************************************************************************************************
//Rotina.............: spbProcessarSelecoesClick
//N. SIG.............: 39921
//Data da Alteração..: 21/02/2017
//Responsável........: André Imakawa
//Descrição..........: Passando novo parametro da rotina _MontarTABTrabalhoComMovDosBeneficiarios
//*****************************************************************************************************
//Rotina.............: Alteração no form
//N. SIG.............: 35321/36080
//Data da Alteração..: 17/01/2016
//Responsável........: André Imakawa
//Descrição..........: Alteração na query qryBenefValoresACompensar, qryBenefCompMovFolhasProc,
//                     SqlBenefSelecionadoCompensa e qryBenefValoresACompensarPorFolha, para buscar
//                     dados de folha de Resgate.
//*****************************************************************************************************
//Rotina.............: spbProcessarSelecoesClick  
//N. SIG.............: 30783
//Data da Alteração..: 10/10/2016
//Responsável........: Paulo Nobre
//Descrição..........: Ajustes na rotina de Isenção Retroativa, pois a mesma não estava levando em
//                     consideração as datas de processamento de cada folha, para localizar os
//                     parametros conforme sua vigência.
//*****************************************************************************************************
//Rotina.............: spbInformeRendimentoPFClick
//N. SIG.............: 21776
//Data da Alteração..: 11/08/2016
//Alteração Form.....:
//Responsável........: Paulo Nobre
//Descrição..........: Incluir chamada da consulta do Informe de Rendimento
//*****************************************************************************************************
//Rotina.............: FormShow, spbDesfazBuscaIndivClick, spbDesfazerProcsEncerramentoClick,
//                     spbDesfazerBUSCA2Click, spbProcessarSelecoesClick,
//N. SIG.............: 26821
//Data da Alteração..: 09/08/2016
//Responsável........: Paulo Nobre / André Imakawa
//Descrição..........: Solicitamos correção no processo de fazer e desfazer busca, pois não está
//                     considerando o filtro Natureza do Rendimento e o DARF gerado
//*****************************************************************************************************
//Rotina.............: _ProcessarMovimentoDaBUSCA
//N. SIG.............: 19503
//Data da Alteração..: 25/04/2016
//Alteração Form.....: mudança na condição de verificação de valores
//Responsável........: William Moreira
//Descrição..........: A contra partida do idInforme 61 não era lançada
//*****************************************************************************************************
//Rotina             : spbLocalizarArqClick
//N. SOL..........   : 269633
//N. PPM..........   : 1337929
//Data da Alteração: : 24/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Colocado um TRIM no CPF na carga do arquivo externo
//*****************************************************************************************************
//Rotina             : Componentes da Interface
//N. SOL..........   : 269130
//N. PPM..........   : 1284502
//Data da Alteração: : 03/02/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acertos gerais nas combobox da versão e natureza
//                     Aberto possibilidade de desfazer todas as versões
//*****************************************************************************************************
//Rotina             : _ProcessarMovimentoDaQUITACAO
//N. SOL..........   : 268775
//N. PPM..........   : 1268748
//Data da Alteração: : 27/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Incluir a barra de progresso no Compensa e Quitação
//*****************************************************************************************************
//Rotina             : FormShow, spbLocalizarArqClick
//N. SOL..........   : 268054
//N. PPM..........   : 1245481
//Data da Alteração: : 15/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Incluindo recurso para salvar e recuperar a lista externa lida
//*****************************************************************************************************
//Rotina             : Interface
//N. SOL..........   : 257831/18009
//N. PPM..........   : 1207646
//Data da Alteração: : 05/01/2016
//Alteração Form:    :
//Responsável:       : Paulo Nobre
//Descrição          : Acerto para as novas linhas criadas no Informe
//***************************************************************************
//Rotina             : Geral
//N. SOL..........   : 227955/17939
//N. PPM..........   : 1176698 (KTN 2063433)
//Data da Alteração: : 01/03/2015
//Alteração Form:    : FrmBUSCA_DIRFFolhaBeneficios
//Responsável:       : Paulo Nobre
//Descrição          : Redesenho de nova funcionalidade de BUSCA
//***************************************************************************
Unit FBUSCA_DIRFFolhaBeneficios;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, ExtCtrls, wwdbdatetimepicker,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet, FileCtrl, TEdNum,
  ComCtrls, MontaSelect, DBTables, DBCtrls, fFrameLista, uCmSqlParams,
  QExport3Dialog, Grids, Wwdbigrd, Wwdbgrid, Wwintl, ImgList, wwDialog,
  Wwlocate, wwSpeedButton, wwDBNavigator, Mask, uDiasUteis,
  wwdbedit, ppBands, ppPrnabl, ppClass, ppCtrls, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  CMProcura, TREdit, jpeg, ppVar, Wwquery, QExport3,
  uFuncoesUteisIR, uCtrlModuloIRRF, uCtrlBUSCA_DIRFFolhaBeneficios,
  TXComp, TXRB, Wwfltdlg, wwidlg, Menus, wwclearpanel, Wwdatsrc, Wwdbdlg,
  Gauges, fTelaAut, wwstorep;

Const CorDaZebra = clBtnFace; // $00C0FFFF;
Const DirLogBusca = 'C:\Planus\Temp\LogBusca';

Const MSG001 = 'Obrigatório preencher a Data Inicial. Verifique !'; //  <OK>
Const MSG002 = 'Obrigatório preencher a Data Final. Verifique !'; //  <OK>
Const MSG003 = 'Data Inicial não pode ser superior a Data Final. Verifique !'; // <OK>
Const MSG004 = 'Datas devem estar dentro do mesmo Ano/Mês. Verifique !'; //  <OK>
Const MSG005 = 'Lista de Beneficiários está vazia. Verifique !'; // <OK>
Const MSG006 = 'Deseja Selecionar todos os Beneficiários ?'; // <SIM> <NÃO>
Const MSG007 = 'Deseja processar para todas as Versões da Folha ?'; // <SIM> <NÃO>
Const MSG008 = 'Deseja processar para todas as Naturezas de Rendimento ?'; // <SIM> <NÃO>
Const MSG009 = 'Confirma Processamento dos Beneficiários marcados ?'; // <SIM> <NÃO>
Const MSG010 = 'Não há Beneficiários Marcados/Selecionados. Verifique !'; //  <SIM> <NÃO>
Const MSG011 = 'Não há Movimento encontrado para os critérios fornecidos. Verifique !'; // <Ok>
Const MSG012 = 'Confirma processo de Desfazer as Quitações ?'; // <SIM> <NÃO>
Const MSG013 = 'Confirma processo de Desfazer a BUSCA ?'; // <SIM> <NÃO>
Const MSG014 = 'Confirma processo de Desfazer a Folha Selecionada ?'; // <SIM> <NÃO>
Const MSG015 = 'Confirma processo de Desfazer as Compensações ?'; // <SIM> <NÃO>
Const MSG016 = 'Deseja Desfazer para todas as Versões da Folha ?'; // <SIM> <NÃO>
Const MSG017 = 'Deseja Desfazer para todas as Naturezas de Rendimento ?'; // <SIM> <NÃO>

Type
  TfrmBUSCA_DIRFFolhaBeneficios = Class(TfrmSairAjuda)
    cdsNaturRendimento: TCMClientDataSet;
    cdsVersoesFolha: TCMClientDataSet;
    SQLNaturRendimento: TCMSqlParams;
    SQLVersoesFolha: TCMSqlParams;
    cdsVersoesFolhaORDEM: TFloatField;
    cdsVersoesFolhaHISTORICO: TStringField;
    cdsVersoesFolhaIDHSTFOLHABENEF: TFloatField;
    cdsVersoesFolhaDATAPREVPAGTO: TDateTimeField;
    cdsNaturRendimentoCODNATUREZA: TStringField;
    cdsNaturRendimentoDESCRICAO: TStringField;
    dsBeneficiariosSelecionados: TDataSource;
    CdsBeneficiariosSelecionados: TCMClientDataSet;
    SqlBeneficiariosSelecionados: TCMSqlParams;
    pcProcessaBusca: TPageControl;
    tbsCritSel: TTabSheet;
    Panel1: TPanel;
    tbsListaPessoa: TTabSheet;
    Panel2: TPanel;
    grpDataProc: TGroupBox;
    lblDataInicial: TLabel;
    Label1: TLabel;
    dedDataFim: TCMDateTimePicker;
    dedDataIni: TCMDateTimePicker;
    GroupBox2: TGroupBox;
    dblcVersaoFolha: TwwDBLookupCombo;
    GroupBox3: TGroupBox;
    dblcNatRendimento: TwwDBLookupCombo;
    LocalizaBenefBUSCA: TwwLocateDialog;
    wwIntl_Port: TwwIntl;
    tbsConsultaMov: TTabSheet;
    dbgConsultaMov: TwwDBGrid;
    cdsConsultaMovBenef: TCMClientDataSet;
    dsConsultaMovBenef: TwwDataSource;
    sqlConsultaMovBenef: TCMSqlParams;
    cdsConsultaMovBenefIDDARF: TFloatField;
    cdsConsultaMovBenefIDLANCIRRF: TFloatField;
    cdsConsultaMovBenefIDHSTFOLHABENEF: TFloatField;
    cdsConsultaMovBenefIDPROCJUD: TFloatField;
    cdsConsultaMovBenefCODNATUREZA: TStringField;
    cdsConsultaMovBenefIDINFORME: TFloatField;
    cdsConsultaMovBenefNOMEINFORME: TStringField;
    cdsConsultaMovBenefCODDIRF: TFloatField;
    cdsConsultaMovBenefCODINFORME: TFloatField;
    cdsConsultaMovBenefVLRLANC: TFloatField;
    cdsConsultaMovBenefFLGTIPOREG: TStringField;
    cdsConsultaMovBenefDATAPAGAMENTO: TDateTimeField;
    cdsConsultaMovBenefFONTEPAGADORA: TFloatField;
    Panel4: TPanel;
    ListaDeImagens: TImageList;
    Panel5: TPanel;
    DBEdit1: TDBEdit;
    CdsBeneficiariosSelecionadosIDHSTFOLHABENEF: TFloatField;
    CdsBeneficiariosSelecionadosCPFRESP: TStringField;
    CdsBeneficiariosSelecionadosNOMERESP: TStringField;
    CdsBeneficiariosSelecionadosDATANASC: TDateTimeField;
    CdsBeneficiariosSelecionadosMARCADO: TStringField;
    DBEdit2: TDBEdit;
    meQtd: TStaticText;
    spbExpBenefSel: TSpeedButton;
    spbMarcaTodos: TSpeedButton;
    spbInverterSel: TSpeedButton;
    wwDBNavigator4: TwwDBNavigator;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    frmFrameListaBenef1: TfrmFrameListaBenef;
    cdsConsultaMovBenefNUMDOCUMENTO: TStringField;
    cdsConsultaMovBenefNOME: TStringField;
    cdsConsultaMovBenefIDBENEFIRRF: TFloatField;
    CdsBeneficiariosSelecionadosDATAPAGAMENTO: TDateTimeField;
    DevRptCM: TExtraOptions;
    rptMovBeneficiario: TppReport;
    ppDetailBand4: TppDetailBand;
    ppParameterList1: TppParameterList;
    ppMovBeneficiario: TppBDEPipeline;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBImage1: TppDBImage;
    qryEmpresa: TwwQuery;
    qryEmpresaIDPESSOA: TFloatField;
    qryEmpresaNOMEEMPRESA: TStringField;
    qryEmpresaRAZAOSOCIAL: TStringField;
    qryEmpresaIDENDERECO: TFloatField;
    qryEmpresaCEP: TStringField;
    qryEmpresaIMAGEM: TBlobField;
    dsEmpresa: TwwDataSource;
    ppEmpresa: TppBDEPipeline;
    ppEmpresappField1: TppField;
    ppEmpresappField2: TppField;
    ppEmpresappField3: TppField;
    ppEmpresappField4: TppField;
    ppEmpresappField5: TppField;
    ppEmpresappField6: TppField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText9: TppDBText;
    ppLabel13: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel18: TppLabel;
    ppLabel17: TppLabel;
    ppLabel15: TppLabel;
    cdsConsultaMovBenefHISTORICO: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable2: TppSystemVariable;
    cdsConsultaMovBenefFLGPENSAOALIM: TFloatField;
    ppShape4: TppShape;
    Panel54: TPanel;
    ppSummaryBand1: TppSummaryBand;
    ppTotalInforme: TppDBCalc;
    pplblTotalInforme: TppLabel;
    ppShape3: TppShape;
    cdsConsultaMovBenefTRGDTINCLUSAO: TDateTimeField;
    ppBeneficiariosSelecionados: TppBDEPipeline;
    cdsConsultaMovBenefQTDMESES: TFloatField;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    Label5: TLabel;
    cdsConsultaMovBenefIDMODULO: TFloatField;
    spbProcessarMovimento: TSpeedButton;
    SpeedButton2: TSpeedButton;
    spbDesfazBuscaIndiv: TSpeedButton;
    cdsBenefSelecionadoQuitacao: TCMClientDataSet;
    SqlBenefSelecionadoQuitacao: TCMSqlParams;
    cdsBenefSelecionadoQuitacaoNUMDOCUMENTO: TStringField;
    cdsBenefSelecionadoQuitacaoNOME: TStringField;
    cdsBenefSelecionadoQuitacaoANO_EXERCICIO: TStringField;
    cdsBenefSelecionadoQuitacaoMARCADO: TStringField;
    LocalizaBenefQuitacao: TwwLocateDialog;
    btnavFiltrarSelecao: TwwNavButton;
    FiltrarBenefSel: TwwFilterDialog;
    dbgBenefSel: TwwDBGrid;
    cdsBenefSelecionadoQuitacaoULTIMA_DATA_PAGTO: TDateTimeField;
    cdsBenefSelecionadoQuitacaoDATANASC: TDateTimeField;
    CdsAnoQuitacao: TCMClientDataSet;
    SqlAnoQuitacao: TCMSqlParams;
    CdsAnoQuitacaoANO_QUITACAO: TStringField;
    dsVersoesFolha: TDataSource;
    dsBenefSelecionadoQuitacao: TDataSource;
    cdsBenefSelecionadoQuitacaoTEM_QUITACAO: TStringField;
    btnavLocalizarBenef: TwwNavButton;
    cdsBenefSelecionadoQuitacaoULTIMA_VERSAO_FOLHA: TFloatField;
    Panel7: TPanel;
    ChkGeraListaBeneficiarios: TCheckBox;
    chkApresentaMovAnual: TCheckBox;
    tbsDesfazer: TTabSheet;
    Panel8: TPanel;
    spbDesfazerBUSCA2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dedDataFim2: TCMDateTimePicker;
    dedDataIni2: TCMDateTimePicker;
    GroupBox4: TGroupBox;
    dblcVersaoFolha2: TwwDBLookupCombo;
    ChkGeraListaBeneficiarios2: TCheckBox;
    qryLista2: TwwQuery;
    dsLista2: TwwDataSource;
    qryLista2IDTITULAR: TFloatField;
    qryLista2IDPESSOA: TFloatField;
    qryLista2MATRICULA: TStringField;
    qryLista2MATRICULADEP: TStringField;
    qryLista2NOMEDEP: TStringField;
    qryLista2NOMETITULAR: TStringField;
    qryLista2NUMDOCUMENTO: TStringField;
    qryAux: TwwQuery;
    cdsVersoesFolhaMESREFERENCIA: TStringField;
    ppDBText12: TppDBText;
    ppLabel6: TppLabel;
    ppDBText20: TppDBText;
    DBEdit3: TDBEdit;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    spbSelecionar: TSpeedButton;
    cdsConsultaMovBenefPERCACAO: TFloatField;
    ppLabel23: TppLabel;
    ppDBText22: TppDBText;
    GroupBox5: TGroupBox;
    dblcNatRendimento2: TwwDBLookupCombo;
    cdsNaturRendimento2: TCMClientDataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    SQLNaturRendimento2: TCMSqlParams;
    ppLabel24: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    cdsConsultaMovBenefDATAINICIO: TDateTimeField;
    cdsConsultaMovBenefDATAFINAL: TDateTimeField;
    ppLabel25: TppLabel;
    cdsConsultaMovBenefDATANASC: TDateTimeField;
    cdsConsultaMovBenefBENEFIDADEFOLHA: TFloatField;
    ppLabel11: TppLabel;
    ppDBText4: TppDBText;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppShape5: TppShape;
    ppLabel26: TppLabel;
    ppDBText25: TppDBText;
    ppLabel10: TppLabel;
    cdsConsultaMovBenefDATAINIMOLGRAVE: TDateTimeField;
    cdsConsultaMovBenefDATAFIMMOLGRAVE: TDateTimeField;
    cdsBenefSelecionadoIsencao: TCMClientDataSet;
    dsBenefSelecionadoIsencao: TwwDataSource;
    SqlBenefSelecionadoIsencao: TCMSqlParams;
    cdsBenefSelecionadoIsencaoNUMDOCUMENTO: TStringField;
    cdsBenefSelecionadoIsencaoNOME: TStringField;
    cdsBenefSelecionadoIsencaoDTINIMOLGRAVE_ATUAL: TDateTimeField;
    cdsBenefSelecionadoIsencaoDTFIMMOLGRAVE_ATUAL: TDateTimeField;
    dsBenefFolhasProcessadas: TwwDataSource;
    cdsBenefSelecionadoIsencaoMARCADO: TStringField;
    qryBenefFolhasProcessadas: TwwQuery;
    qryBenefFolhasProcessadasIDHSTFOLHABENEF: TFloatField;
    qryBenefFolhasProcessadasDATAINIMOLGRAVE: TDateTimeField;
    qryBenefFolhasProcessadasDATAFIMMOLGRAVE: TDateTimeField;
    qryBenefFolhasProcessadasNUMDOCUMENTO: TStringField;
    LocalizaBenefIsencao: TwwLocateDialog;
    qryBenefFolhasProcessadasDATAPAGAMENTO: TDateTimeField;
    qryFolhasExercicioISENCAO: TwwQuery;
    dsFolhasExercicioISENCAO: TwwDataSource;
    qryFolhasExercicioISENCAOIDHSTFOLHABENEF: TFloatField;
    qryFolhasExercicioISENCAODATAPREVPAGTO: TDateTimeField;
    tbsEncPeriodo: TTabSheet;
    pcEncerramentoPeriodo: TPageControl;
    tbsAvaliaIsencao: TTabSheet;
    tbsQuitacao: TTabSheet;
    Panel13: TPanel;
    Panel14: TPanel;
    wwDBGrid3: TwwDBGrid;
    Panel9: TPanel;
    Panel16: TPanel;
    dbgBenefIsencao: TwwDBGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    wwDBGrid2: TwwDBGrid;
    Panel15: TPanel;
    SpeedButton4: TSpeedButton;
    spbMarcaTodosIsencao: TSpeedButton;
    spbInverterSelIsencao: TSpeedButton;
    wwDBNavigator5: TwwDBNavigator;
    wwNavButton17: TwwNavButton;
    wwNavButton18: TwwNavButton;
    wwNavButton19: TwwNavButton;
    wwNavButton20: TwwNavButton;
    wwNavButton21: TwwNavButton;
    Panel6: TPanel;
    spbInverterSelQuitacao: TSpeedButton;
    spbMarcaTodosQuitacao: TSpeedButton;
    SpeedButton1: TSpeedButton;
    meQtd2: TStaticText;
    mePerc2: TStaticText;
    wwDBNavigator2: TwwDBNavigator;
    wwNavButton5: TwwNavButton;
    wwNavButton11: TwwNavButton;
    wwNavButton12: TwwNavButton;
    wwNavButton13: TwwNavButton;
    btnavLocalizarQuitacao: TwwNavButton;
    dbgMovQuitacao: TwwDBGrid;
    Panel17: TPanel;
    cdsConsultaMovBenefDTINIMOLGRAVE_ATUAL: TDateTimeField;
    cdsConsultaMovBenefDTFIMMOLGRAVE_ATUAL: TDateTimeField;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppShape6: TppShape;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel21: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppShape7: TppShape;
    tbsCompValNeg: TTabSheet;
    Panel23: TPanel;
    Label10: TLabel;
    dblcAnoExercicio: TwwDBLookupCombo;
    spbSelecionarBeneficiarios: TSpeedButton;
    spbProcessarSelecoes: TSpeedButton;
    spbDesfazerProcsEncerramento: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ppShape8: TppShape;
    cdsBenefSelecionadoCompensa: TCMClientDataSet;
    dsBenefSelecionadoCompensa: TwwDataSource;
    SqlBenefSelecionadoCompensa: TCMSqlParams;
    cdsBenefSelecionadoCompensaNUMDOCUMENTO: TStringField;
    cdsBenefSelecionadoCompensaNOME: TStringField;
    ChkGeraListaBeneficiariosEncerramento: TCheckBox;
    cdsBenefSelecionadoCompensaMARCADO: TStringField;
    qryBenefValoresACompensar: TwwQuery;
    dsBenefValoresACompensar: TwwDataSource;
    Panel25: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    wwDBNavigator6: TwwDBNavigator;
    wwNavButton22: TwwNavButton;
    wwNavButton23: TwwNavButton;
    wwNavButton24: TwwNavButton;
    wwNavButton25: TwwNavButton;
    wwNavButton26: TwwNavButton;
    LocalizaBenefCompensa: TwwLocateDialog;
    meQtd3: TStaticText;
    mePerc3: TStaticText;
    Panel3: TPanel;
    dbgBenefACompensar: TwwDBGrid;
    cdsConsultaMovBenefFLGLANC_QUITACAOBUSCA: TStringField;
    Panel12: TPanel;
    Panel19: TPanel;
    Panel21: TPanel;
    dbgCompValores: TwwDBGrid;
    Panel18: TPanel;
    Panel24: TPanel;
    dsBenefCompMovFolhasProc: TwwDataSource;
    cdsBenefSelecionadoCompensaANOREF: TStringField;
    dbgCompMovFolhas: TwwDBGrid;
    cdsConsultaMovBenefFLGLANC_COMPENSABUSCA: TStringField;
    wwDBNavigator7: TwwDBNavigator;
    wwNavButton27: TwwNavButton;
    wwNavButton28: TwwNavButton;
    wwNavButton29: TwwNavButton;
    wwNavButton30: TwwNavButton;
    wwNavButton31: TwwNavButton;
    FiltrarCompMovFolhas: TwwFilterDialog;
    ppLabel31: TppLabel;
    ppDBText28: TppDBText;
    spbApagaFolhaSel: TSpeedButton;
    SpeedButton6: TSpeedButton;
    qeBenefCompMovFolhasProc: TQExport3Dialog;
    SpeedButton10: TSpeedButton;
    qryBenefCompMovFolhasProc: TwwQuery;
    qryBenefCompMovFolhasProcNUMDOCUMENTO: TStringField;
    qryBenefCompMovFolhasProcIDHSTFOLHABENEF: TFloatField;
    qryBenefCompMovFolhasProcIDINFORME: TFloatField;
    qryBenefCompMovFolhasProcNOMEINFORME: TStringField;
    qryBenefCompMovFolhasProcFONTEPAGADORA: TFloatField;
    qryBenefCompMovFolhasProcCODNATUREZA: TStringField;
    qryBenefCompMovFolhasProcCODDIRF: TFloatField;
    qryBenefCompMovFolhasProcFLGTIPOREG: TStringField;
    qryBenefCompMovFolhasProcDATAPAGAMENTO: TDateTimeField;
    qryBenefCompMovFolhasProcDESC_MES: TStringField;
    qryBenefCompMovFolhasProcFLGPENSAOALIM: TFloatField;
    qryBenefCompMovFolhasProcFLGNATUREZA: TStringField;
    qryBenefCompMovFolhasProcPLANO: TFloatField;
    qryBenefCompMovFolhasProcIDPATRO: TFloatField;
    qryBenefCompMovFolhasProcCODCENTRORESPON: TStringField;
    qryBenefCompMovFolhasProcCODCENTROCUSTO: TStringField;
    qryBenefCompMovFolhasProcIDMODULORESPON: TFloatField;
    qryBenefCompMovFolhasProcIDPROGRAMA: TFloatField;
    qryBenefCompMovFolhasProcFLGLANC_COMPENSABUSCA: TStringField;
    qryBenefCompMovFolhasProcTEM_COMPENSA: TStringField;
    qryBenefCompMovFolhasProcVLRLANC: TFloatField;
    cdsConsultaMovBenefFLGNATUREZA: TStringField;
    cdsConsultaMovBenefTIPOMOV: TStringField;
    qryBenefCompMovFolhasProcTIPOMOV: TStringField;
    Label2: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    qryBenefValoresACompensarPorFolha: TwwQuery;
    FloatField1: TFloatField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField4: TStringField;
    FloatField5: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField6: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField10: TFloatField;
    StringField11: TStringField;
    StringField12: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    qryBenefValoresACompensarNUMDOCUMENTO: TStringField;
    qryBenefValoresACompensarIDINFORME: TFloatField;
    qryBenefValoresACompensarNOMEINFORME: TStringField;
    qryBenefValoresACompensarFONTEPAGADORA: TFloatField;
    qryBenefValoresACompensarCODNATUREZA: TStringField;
    qryBenefValoresACompensarFLGLANC_COMPENSABUSCA: TStringField;
    qryBenefValoresACompensarTEM_COMPENSA: TStringField;
    qryBenefValoresACompensarFLGTIPOREG: TStringField;
    qryBenefValoresACompensarFLGNATUREZA: TStringField;
    qryBenefValoresACompensarTIPOMOV: TStringField;
    qryBenefValoresACompensarVLRLANC: TFloatField;
    cdsBenefSelecionadoCompensaTEM_COMPENSA: TStringField;
    cdsBenefSelecionadoCompensaIDPROCJUD: TFloatField;
    cdsBenefSelecionadoIsencaoANO_EXERCICIO: TStringField;
    Panel26: TPanel;
    Panel27: TPanel;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    btnavFiltrar: TwwNavButton;
    btnavDesfazerFiltro: TwwNavButton;
    spbImpExtrato: TSpeedButton;
    spbExpMov: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel28: TPanel;
    Panel29: TPanel;
    imgSitFiltroConsMov: TImage;
    CdsBeneficiariosSelecionadosDATAMORTE: TDateTimeField;
    Panel30: TPanel;
    Shape3: TShape;
    Label4: TLabel;
    cdsConsultaMovBenefDATAMORTE: TDateTimeField;
    ppLabel32: TppLabel;
    ppDBText29: TppDBText;
    OpenDialog1: TOpenDialog;
    Panel31: TPanel;
    rdgSelTipoLista: TRadioGroup;
    pnlListaArquivo: TPanel;
    lbCPFBeneficiarios: TListBox;
    Panel32: TPanel;
    spbLocalizarArq: TSpeedButton;
    Label6: TLabel;
    Panel33: TPanel;
    cdsConsultaMovBenefMATRICULA: TStringField;
    DBEdit4: TDBEdit;
    ppLabel14: TppLabel;
    ppDBText17: TppDBText;
    btnLimpar: TSpeedButton;
    stListaCPFExt: TStaticText;
    tbsLogBusca: TTabSheet;
    memResult: TMemo;
    CdsBeneficiariosSelecionadosIDRESPONSAVEL: TFloatField;
    qryBenefValoresACompensarPorFolhaPLACONTA: TStringField;
    cdsConsultaMovBenefVLRIRRF: TFloatField;
    cdsConsultaMovBenefIDPATRO: TFloatField;
    cdsConsultaMovBenefIDPLANOPREV: TFloatField;
    lblTipoListas: TLabel;
    cdsConsultaMovBenefFLGIRRF: TStringField;
    CdsBeneficiariosSelecionadosUSUARIO: TStringField;
    ppLabel16: TppLabel;
    ppLabel33: TppLabel;
    ppDBText15: TppDBText;
    ppDBText30: TppDBText;
    FitrarMovimento: TwwFilterDialog;
    wwDBNavigator2Button: TwwNavButton;
    FiltraMovQuitacao: TwwFilterDialog;
    Panel20: TPanel;
    gProgresso: TGauge;
    CdsBeneficiariosSelecionadosHISTORICO: TStringField;
    wwDBNavigator8: TwwDBNavigator;
    wwNavButton32: TwwNavButton;
    wwNavButton33: TwwNavButton;
    wwNavButton34: TwwNavButton;
    wwNavButton35: TwwNavButton;
    wwNavButton36: TwwNavButton;
    FiltrarValoresACompensar: TwwFilterDialog;
    qryBenefCompMovFolhasProcNUMMES: TStringField;
    qryBenefCompMovFolhasProcMES: TStringField;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    spbInformeRendimentoPF: TSpeedButton;
    LocalizaFolhas: TwwLocateDialog;
    meQtd4: TStaticText;
    wwDBNavigator9: TwwDBNavigator;
    wwNavButton37: TwwNavButton;
    wwNavButton38: TwwNavButton;
    wwNavButton39: TwwNavButton;
    wwNavButton40: TwwNavButton;
    wwNavButton41: TwwNavButton;
    Panel22: TPanel;
    gProgressoIsencao: TGauge;
    qryTemp: TwwQuery;
    FloatField2: TFloatField;
    StringField10: TStringField;
    FloatField9: TFloatField;
    StringField15: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField15: TFloatField;
    StringField19: TStringField;
    StringField20: TStringField;
    DateTimeField2: TDateTimeField;
    FloatField16: TFloatField;
    StringField21: TStringField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    StringField22: TStringField;
    StringField23: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    cdsBenefSelecionadoCompensaINFORME: TFloatField;
    qeBenefSelecionados: TQExport3Dialog;
    qeBenefSelecionadoIsencao: TQExport3Dialog;
    qeBenefSelecionadoCompensa: TQExport3Dialog;
    qeBenefSelecionadoQuitacao: TQExport3Dialog;
    qeConsultaMovBenef: TQExport3Dialog;
    Procedure frmFrameListaBenef1bbtnIncluiBenefClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormShow(Sender: TObject);
    Procedure ChkGeraListaBeneficiariosClick(Sender: TObject);
    Procedure spbSelecionarClick(Sender: TObject);
    Procedure spbMarcaTodosClick(Sender: TObject);
    Procedure spbInverterSelClick(Sender: TObject);
    Procedure frmFrameListaBenef1bbtnExcluiCorrenteClick(Sender: TObject);
    Procedure frmFrameListaBenef1bbtnIncluiListaClick(Sender: TObject);
    Procedure frmFrameListaBenef1bbtnExcluiTudoClick(Sender: TObject);
    Procedure dbgConsultaMovCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    Procedure dbgConsultaMovCalcTitleImage(Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
    Procedure dbgConsultaMovTitleButtonClick(Sender: TObject; AFieldName: String);
    Procedure spbExpMovClick(Sender: TObject);
    Procedure spbExpBenefSelClick(Sender: TObject);
    Procedure spbDesfazBuscaIndivClick(Sender: TObject);
    Procedure dblcVersaoFolhaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; Modified: Boolean);
    Procedure dedDataIniChange(Sender: TObject);
    Procedure spbImpExtratoClick(Sender: TObject);
    Procedure dbgBenefSelCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    Procedure btnavDesfazerFiltroClick(Sender: TObject);
    Procedure btnavFiltrarClick(Sender: TObject);
    Procedure dbgConsultaMovDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbProcessarMovimentoClick(Sender: TObject);
    Procedure cdsBenefSelecionadoQuitacaoAfterScroll(DataSet: TDataSet);
    Procedure spbMarcaTodosQuitacaoClick(Sender: TObject);
    Procedure spbInverterSelQuitacaoClick(Sender: TObject);
    Procedure ChkGeraListaBeneficiariosEncerramentoClick(Sender: TObject);
    Procedure dbgMovQuitacaoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure dblcNatRendimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
    Procedure dedDataFimChange(Sender: TObject);
    Procedure dbgMovQuitacaoDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbDesfazerProcsEncerramentoClick(Sender: TObject);
    Procedure btnavLocalizarBenefClick(Sender: TObject);
    Procedure dbgBenefSelDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbDesfazerBUSCA2Click(Sender: TObject);
    Procedure ChkGeraListaBeneficiarios2Click(Sender: TObject);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure dedDataIni2Change(Sender: TObject);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure dblcVersaoFolha2CloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure spbSelecionarBeneficiariosClick(Sender: TObject);
    Procedure wwDBGrid2CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure spbMarcaTodosIsencaoClick(Sender: TObject);
    Procedure spbInverterSelIsencaoClick(Sender: TObject);
    Procedure spbProcessarSelecoesClick(Sender: TObject);
    Procedure SpeedButton4Click(Sender: TObject);
    Procedure dblcAnoExercicioChange(Sender: TObject);
    Procedure dbgBenefIsencaoDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure pcEncerramentoPeriodoChange(Sender: TObject);
    Procedure SpeedButton5Click(Sender: TObject);
    Procedure SpeedButton7Click(Sender: TObject);
    Procedure SpeedButton8Click(Sender: TObject);
    Procedure SpeedButton9Click(Sender: TObject);
    Procedure cdsBenefSelecionadoCompensaAfterScroll(DataSet: TDataSet);
    Procedure dbgCompValoresCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    Procedure dbgCompValoresDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure dbgCompMovFolhasDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure spbApagaFolhaSelClick(Sender: TObject);
    Procedure SpeedButton6Click(Sender: TObject);
    Procedure SpeedButton10Click(Sender: TObject);
    Procedure dbgBenefACompensarDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure CdsBeneficiariosSelecionadosAfterScroll(DataSet: TDataSet);
    Procedure spbLocalizarArqClick(Sender: TObject);
    Procedure rdgSelTipoListaClick(Sender: TObject);
    Procedure btnLimparClick(Sender: TObject);
    Procedure lbCPFBeneficiariosDblClick(Sender: TObject);
    Procedure spbInformeRendimentoPFClick(Sender: TObject);
    Procedure cdsBenefSelecionadoIsencaoAfterScroll(DataSet: TDataSet);
  Private
    ModuloIRRF: TCtrlModuloIRRF;
    oBUSCADIRF: TCtrlBUSCA_DIRFFolhaBeneficios;
    tsListaDeBeneficiarios: TStringList;

    Procedure SalvarArquivoLog(Const pVersao: Integer; pCodNatureza: String);
    Function TotalizaColunaGridMov(pCampo: String; pDecimal: Integer): String;
    Procedure _ApagaConteudoDaTabDeTrabalho(Const pVersaoFolha: Integer);
    Function _AtualizaTabDeTrabalho: Boolean;
    Procedure _ApresentaMovBeneficiariosProcessamentoBUSCA(pSit: Integer);
    Procedure _AjustaLabelListasInternaExterna;
    Procedure _ApagarFolhasSelecionadasGrid(pVersaoFolhaMov: Integer);
  Public
    { Public declarations }
  End;

Var frmBUSCA_DIRFFolhaBeneficios: TfrmBUSCA_DIRFFolhaBeneficios;
  iVersaoFolha: Integer;
  sCodNatureza: String;
  bMostraContadores: Boolean;
  iAno, iMes, iDia: Word;

Implementation

Uses USistema, UMensErro, UDatabase, DBaseDados, FAguarde, FProgresso, FPreview, FConfigRelatInformeMT;

{$R *.DFM}

Procedure TfrmBUSCA_DIRFFolhaBeneficios.FormCreate(Sender: TObject);
Begin
  Inherited;
  ModuloIRRF := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  oBUSCADIRF := TCtrlBUSCA_DIRFFolhaBeneficios.Create;
  oBUSCADIRF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  tsListaDeBeneficiarios := tStringList.create;

  If Not DirectoryExists(DirLogBusca) Then
    ForceDirectories(DirLogBusca);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.FormShow(Sender: TObject);
Var sMes, sAno, sUltDia: String;
  dDataVenc, dtFim: TDateTime;
Begin
  Inherited;
  //
  // COMPORTAMENTOS INICIAIS
  //
  // Comportamento default de componentes
  pcProcessaBusca.ActivePage := tbsCritSel;
  tbsListaPessoa.TabVisible := False;
  //  tbsLogBusca.TabVisible := False;
  frmFrameListaBenef1.DefineLista(0);
  ppTotalInforme.Visible := False;
  pplblTotalInforme.Visible := False;
  chkGeraListaBeneficiarios.Checked := false;
  chkApresentaMovAnual.Checked := false;
  pcEncerramentoPeriodo.ActivePage := tbsAvaliaIsencao;
  tbsAvaliaIsencao.Highlighted := True;
  tbsCompValNeg.Highlighted := False;
  tbsQuitacao.Highlighted := False;
  ChkGeraListaBeneficiariosEncerramento.visible := False;
  spbDesfazerProcsEncerramento.Enabled := False;
  spbSelecionarBeneficiarios.Caption := '&Avaliar Isenções Retroativas';
  spbSelecionarBeneficiarios.Hint := 'Avaliar a existência de Beneficiários que tiveram Isenções Retroativas';
  spbProcessarSelecoes.Caption := '&Processar Isenções';
  spbProcessarSelecoes.Hint := 'Refazer as Folhas conforme as novas Datas de Isenção';
  imgSitFiltroConsMov.Visible := False;
  rdgSelTipoLista.ItemIndex := 0;

  // Carregando as datas com valores defaults
  dDataVenc := ModuloIRRF.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 3, True);
  sAno := inttostr(DiasUteis.ExtraiAno(dDataVenc));
  dedDataIni.Date := strtodate('01/01/' + sAno);
  dedDataFim.Date := strtodate('31/12/' + sAno);
  dedDataIni.Text := DateToStr(dedDataIni.Date);
  dedDataFim.Text := DateToStr(dedDataFim.Date);
  dedDataIni2.Date := strtodate('01/01/' + sAno);
  dedDataFim2.Date := strtodate('31/12/' + sAno);
  dedDataIni2.Text := DateToStr(dedDataIni2.Date);
  dedDataFim2.Text := DateToStr(dedDataFim2.Date);
  // Abrindo e carregando datasets
  Screen.Cursor := crSQLWait;
  cdsVersoesFolha.data := oBUSCADIRF._ListaVersoesFolha;
  dblcVersaoFolha.LookupValue := '-1'; // Todas as versões como default
  dblcVersaoFolha2.LookupValue := '-1'; // Todas as versões como default
  cdsNaturRendimento.data := oBUSCADIRF._ListaNatuRendimento('0');
  cdsNaturRendimento2.data := cdsNaturRendimento.data;
  dblcNatRendimento.LookupValue := '0000'; // Natureza (Resgate Prev. Comp./Mod. CD/Variavel. - Não Optante Tribut.) como Default
  dblcNatRendimento2.LookupValue := '0000'; // Todas as Natureza como default
  CdsAnoQuitacao.data := oBUSCADIRF._ListaExerciciosDispEncerramento;
  dblcAnoExercicio.LookupValue := inttostr(DiasUteis.ExtraiAno(date)); // Ano Corrente
  SqlConsultaMovBenef.Open;
  SqlBenefSelecionadoQuitacao.Open;
  SqlBenefSelecionadoIsencao.Open;
  // Os SQL´s das querys abaixo, estão descritas dentro do próprio componente
  qryFolhasExercicioISENCAO.Close;
  qryFolhasExercicioISENCAO.Open;
  SqlBenefSelecionadoCompensa.Open;
  qryBenefFolhasProcessadas.Close;
  qryBenefFolhasProcessadas.Open;
  qryBenefValoresACompensar.Close;
  qryBenefValoresACompensar.Open;
  qryBenefCompMovFolhasProc.Close;
  qryBenefCompMovFolhasProc.Open;
  _ApresentaMovBeneficiariosProcessamentoBUSCA(0);

  bMostraContadores := True;
  CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);
  If Not CdsBeneficiariosSelecionados.isEmpty Then
    Begin
      dblcVersaoFolha.LookupValue := CdsBeneficiariosSelecionados.Fieldbyname('IDHSTFOLHABENEF').asString;
      dblcVersaoFolha2.LookupValue := CdsBeneficiariosSelecionados.Fieldbyname('IDHSTFOLHABENEF').asString;
      cdsNaturRendimento.data := oBUSCADIRF._ListaNatuRendimento(dblcVersaoFolha.LookupValue); // Paulo / Andre - SIG26821
      cdsNaturRendimento2.data := cdsNaturRendimento.data;
      dblcNatRendimento.LookupValue := '0000'; // Todas como Default
      dblcNatRendimento2.LookupValue := dblcNatRendimento.LookupValue; // Todas como Default
      sMes := IntToStr(DiasUteis.ExtraiMes(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      sAno := IntToStr(DiasUteis.ExtraiAno(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      dtFim := DiasUteis.UltDiaMes(strtoint(sAno), strtoint(sMes));
      sUltDia := IntToStr(DiasUteis.ExtraiDia(dtFim));
      dedDataIni.Date := strtodate('01' + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataFim.Date := strtodate(sUltDia + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataIni2.Date := strtodate('01' + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataFim2.Date := strtodate(sUltDia + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
    End;

  Screen.Cursor := crDefault;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios._AjustaLabelListasInternaExterna;
Begin
  If (Not frmFrameListaBenef1.qryLista.IsEmpty) And (lbCPFBeneficiarios.Items.Count <> 0) Then
    lblTipoListas.caption := '( I + E )'
  Else If (Not frmFrameListaBenef1.qryLista.IsEmpty) And (lbCPFBeneficiarios.Items.Count = 0) Then
    lblTipoListas.caption := '( I )'
  Else If (frmFrameListaBenef1.qryLista.IsEmpty) And (lbCPFBeneficiarios.Items.Count <> 0) Then
    lblTipoListas.caption := '( E )'
  Else
    lblTipoListas.caption := '( )';
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  FreeAndNil(oBUSCADIRF);
  FreeAndNil(ModuloIRRF);
  FreeAndNil(tsListaDeBeneficiarios);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SalvarArquivoLog(Const pVersao: Integer; pCodNatureza: String);
Var sFile: String;
Begin
  Inherited;
  If pVersao <> -1 Then
    sFile := DirLogBusca + '\Fol_' + IntToStr(pVersao) + '_' + FormatDateTime('hhMMss', Time()) + '.Log'
  Else
    sFile := DirLogBusca + '\Fol_Todas_Resgate_' + pCodNatureza + '_' + FormatDateTime('hhMMss', Time()) + '.Log';
  memResult.Lines.SaveToFile(sFile);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbSelecionarClick(Sender: TObject);
Var iSel1: Word;
Begin
  Inherited;
  oBUSCADIRF.InicializaFormulario();

  If dedDataIni.Text = EmptyStr Then
    Begin
      MsgDlg(MSG001, 'Atenção', mtWarning, [mbOK], 0);
      pcProcessaBusca.ActivePage := tbsCritSel;
      dedDataIni.SetFocus;
      Exit;
    End;

  If dedDataFim.Text = EmptyStr Then
    Begin
      MsgDlg(MSG002, 'Atenção', mtWarning, [mbOK], 0);
      pcProcessaBusca.ActivePage := tbsCritSel;
      dedDataFim.SetFocus;
      Exit;
    End;

  If dedDataIni.Date > dedDataFim.Date Then
    Begin
      MsgDlg(MSG003, 'Atenção', mtWarning, [mbOK], 0);
      pcProcessaBusca.ActivePage := tbsCritSel;
      dedDataIni.SetFocus;
      Exit;
    End;

  If dblcVersaoFolha.LookupValue <> '-1' Then // Uma Folha selecionada
    Begin
      If FormatDateTime('yyyymm', dedDataIni.Date) <> FormatDateTime('yyyymm', dedDataFim.Date) Then
        Begin
          MsgDlg(MSG004, 'Atenção', mtWarning, [mbOK], 0);
          pcProcessaBusca.ActivePage := tbsCritSel;
          dedDataIni.SetFocus;
          Exit;
        End;
    End;

  If ChkGeraListaBeneficiarios.Checked Then
    Begin
      If rdgSelTipoLista.ItemIndex = 0 Then // Interna
        Begin
          If frmFrameListaBenef1.qryLista.IsEmpty Then
            Begin
              MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
              pcProcessaBusca.ActivePage := tbsListaPessoa;
              Exit;
            End
          Else
            Begin
              // Carregando um componente TStringList com os Beneficiários da qrylista da aba "Lista de Beneficiários"
              tsListaDeBeneficiarios.Clear;
              frmFrameListaBenef1.qryLista.DisableControls;
              With frmFrameListaBenef1.qryLista Do
                Begin
                  First;
                  While Not EOF Do
                    Begin
                      tsListaDeBeneficiarios.Add(FieldByName('NUMDOCUMENTO').asString);
                      Next;
                    End;
                  First;
                End;
              frmFrameListaBenef1.qryLista.EnableControls;
            End
        End
      Else // Externa
        Begin
          If lbCPFBeneficiarios.Items.Text = EmptyStr Then
            Begin
              MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
              pcProcessaBusca.ActivePage := tbsListaPessoa;
              Exit;
            End
          Else
            Begin
              tsListaDeBeneficiarios.Clear;
              tsListaDeBeneficiarios.Text := lbCPFBeneficiarios.Items.Text;
            End;
        End;
    End
  Else
    Begin
      If Application.MessageBox(MSG006, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDNO Then
        Begin
          pcProcessaBusca.ActivePage := tbsCritSel;
          dedDataIni.SetFocus;
          Exit;
        End;
    End;

  iVersaoFolha := strtoint(dblcVersaoFolha.LookupValue);
  sCodNatureza := dblcNatRendimento.LookupValue;

  If iVersaoFolha = -1 Then // Todas
    Begin
      If Application.MessageBox(MSG007, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDNO Then
        Begin
          pcProcessaBusca.ActivePage := tbsCritSel;
          dblcVersaoFolha.SetFocus;
          dblcVersaoFolha.Selected;
          Exit;
        End;

      If sCodNatureza = '0000' Then
        Begin
          MsgDlg('É necessário selecionar uma Natureza. Verifique !', 'Atenção', mtWarning, [mbOK], 0);
          pcProcessaBusca.ActivePage := tbsCritSel;
          dblcNatRendimento.SetFocus;
          dblcNatRendimento.Selected;
          Exit;
        End;
    End;

  Screen.Cursor := crSQLWait;

  // Verificando se já existe algum movimento montado na tabela de trabalho
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT IDHSTFOLHABENEF       ');
  qryAux.SQL.Add('FROM MOV_GERALBUSCA          ');
  qryAux.SQL.Add('WHERE IDHSTFOLHABENEF = ' + inttostr(iVersaoFolha));
  qryAux.Open;
  Screen.Cursor := crDefault;
  If qryAux.EOF Then
    Begin
      // Se não encontrado movimento na tabela de trabalho
      _ApagaConteudoDaTabDeTrabalho(-1);
      If _AtualizaTabDeTrabalho Then
        _ApresentaMovBeneficiariosProcessamentoBUSCA(1)
      Else
        Application.MessageBox(MSG011, 'Atenção !', Mb_IconExclamation);
    End
  Else
    Begin
      // Se encontrado movimento na tabela de trabalho e este for diferente da versão da folha que se deseja Processar
      If (qryAux.Fieldbyname('IDHSTFOLHABENEF').asInteger <> iVersaoFolha) Then
        Begin
          _ApagaConteudoDaTabDeTrabalho(-1);
          If _AtualizaTabDeTrabalho Then
            _ApresentaMovBeneficiariosProcessamentoBUSCA(1)
          Else
            Application.MessageBox(MSG011, 'Atenção !', Mb_IconExclamation);
        End
      Else
        Begin
          // Se encontrado movimento na tabela de trabalho e este for igual ao da versão
          // da folha que se deseja Processar, então,
          iSel1 := Application.MessageBox('Existe Movimento Selecionado desa Folha !' + #13 + #13 +
            'Inclui este novamente ?', 'Atenção !', MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON2);
          If iSel1 = IDYES Then
            Begin
              _ApagaConteudoDaTabDeTrabalho(-1);
              If _AtualizaTabDeTrabalho Then
                _ApresentaMovBeneficiariosProcessamentoBUSCA(1)
              Else
                Application.MessageBox(MSG011, 'Atenção !', Mb_IconExclamation);
            End
          Else If iSel1 = IDNO Then
            _ApresentaMovBeneficiariosProcessamentoBUSCA(1);
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios._ApagaConteudoDaTabDeTrabalho(Const pVersaoFolha: Integer);
Begin
  Screen.Cursor := crSQLWait;
  Try
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Add('DELETE FROM MOV_GERALBUSCA');
    If pVersaoFolha <> -1 Then
      qryAux.SQL.Add('WHERE IDHSTFOLHABENEF = ' + inttostr(pVersaoFolha));
    qryAux.EXECSQL;

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;
  Except
    On E: Exception Do
      Begin
        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.RollBack;

        Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
      End;
  End;
  Screen.Cursor := crDefault;
End;

Function TfrmBUSCA_DIRFFolhaBeneficios._AtualizaTabDeTrabalho: Boolean;
Begin
  Try
    frmAguarde.pbAguarde.Visible := false;
    frmAguarde.Mostra('Montando Base de Trabalho...');

    Screen.Cursor := crSQLWait;
    If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

    Result := oBUSCADIRF._MontarTABTrabalhoComMovDosBeneficiarios(
      Trim(sCodNatureza),
      iVersaoFolha,
      dedDataIni.Date,
      dedDataFim.Date,
      ChkGeraListaBeneficiarios.checked,
      tsListaDeBeneficiarios); // Lista de Beneficiários

    If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Commit;

    Screen.Cursor := crDefault;

    frmAguarde.pbAguarde.Visible := True;
    frmAguarde.Apaga;
  Except
    On E: Exception Do
      Begin
        If dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.RollBack;

        Screen.Cursor := crDefault;
        Result := False;
        Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
      End;
  End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios._ApresentaMovBeneficiariosProcessamentoBUSCA(pSit: Integer);
Var sMes, sAno, sUltDia: String;
  dtFim: TDateTime;
Begin
  frmAguarde.pbAguarde.Visible := false;
  If pSit = 0 Then
    Begin
      frmAguarde.Mostra('Carregando o último Movimento...');

      // Paulo Nobre SOL 268054 PPM 1245481
      stListaCPFExt.caption := '0';
      If FileExists(DirLogBusca + '\ListaExternaBeneficiarios.Txt') Then
        Begin
          With TStringList.Create Do
            Begin
              LoadFromFile(DirLogBusca + '\ListaExternaBeneficiarios.Txt');
              lbCPFBeneficiarios.Items.Text := Text;
              lbCPFBeneficiarios.Repaint;
              stListaCPFExt.caption := inttostr(lbCPFBeneficiarios.Items.Count);
              Clear;
              Free;
            End;

          _AjustaLabelListasInternaExterna;
          Application.ProcessMessages;
        End;
    End
  Else If pSit = 1 Then
    frmAguarde.Mostra('Apresentando os Beneficiários...');

  // Selecionando os Beneficiários para a BUSCA
  CdsBeneficiariosSelecionados.DisableControls;
  CdsBeneficiariosSelecionados.Close;
  CdsBeneficiariosSelecionados.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoBUSCA(-1);
  CdsBeneficiariosSelecionados.EnableControls;

  If pSit <> -1 Then
    Begin
      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;
    End;

  spbProcessarMovimento.Enabled := True;
  cdsConsultaMovBenef.Filtered := False;

  CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

  If (Not CdsBeneficiariosSelecionados.isEmpty) And
    (dblcVersaoFolha.LookupValue <> '-1') And
    (dblcNatRendimento.LookupValue = '0000') Then
    Begin
      chkGeraListaBeneficiarios2.Checked := chkGeraListaBeneficiarios.Checked;
      dblcVersaoFolha.LookupValue := CdsBeneficiariosSelecionados.Fieldbyname('IDHSTFOLHABENEF').asString;
      dblcVersaoFolha2.LookupValue := CdsBeneficiariosSelecionados.Fieldbyname('IDHSTFOLHABENEF').asString;
      cdsNaturRendimento.data := oBUSCADIRF._ListaNatuRendimento(dblcVersaoFolha.LookupValue);
      cdsNaturRendimento2.data := cdsNaturRendimento.data;
      dblcNatRendimento.LookupValue := '0000'; // Todas como Default
      dblcNatRendimento2.LookupValue := dblcNatRendimento.LookupValue; // Todas como Default
      sMes := IntToStr(DiasUteis.ExtraiMes(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      sAno := IntToStr(DiasUteis.ExtraiAno(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      dtFim := DiasUteis.UltDiaMes(strtoint(sAno), strtoint(sMes));
      sUltDia := IntToStr(DiasUteis.ExtraiDia(dtFim));
      dedDataIni.Date := strtodate('01' + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataFim.Date := strtodate(sUltDia + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataIni2.Date := strtodate('01' + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataFim2.Date := strtodate(sUltDia + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
    End;

  If pcProcessaBusca.ActivePage = tbsCritSel Then
    Begin
      dblcVersaoFolha.Setfocus;
      dblcVersaoFolha.Selected;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.ChkGeraListaBeneficiariosClick(Sender: TObject);
Begin
  Inherited;
  tbsListaPessoa.TabVisible := ChkGeraListaBeneficiarios.Checked;
  chkGeraListaBeneficiarios2.Checked := chkGeraListaBeneficiarios.Checked;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbMarcaTodosClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  CdsBeneficiariosSelecionados.AfterScroll := Nil;
  If (Not CdsBeneficiariosSelecionados.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Beneficiários...', True, False, True, 0, CdsBeneficiariosSelecionados.RecordCount);
      CdsBeneficiariosSelecionados.DisableControls;
      CdsBeneficiariosSelecionados.First;
      While Not CdsBeneficiariosSelecionados.Eof Do
        Begin
          CdsBeneficiariosSelecionados.Edit;
          CdsBeneficiariosSelecionados.FieldByName('MARCADO').AsString := 'S';

          CdsBeneficiariosSelecionados.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      CdsBeneficiariosSelecionados.First;
      CdsBeneficiariosSelecionados.EnableControls;
      frmProgresso.EscondeFormProgresso;

    End;
  CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbInverterSelClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  CdsBeneficiariosSelecionados.AfterScroll := Nil;
  If (Not CdsBeneficiariosSelecionados.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Beneficiários...', True, False, True, 0, CdsBeneficiariosSelecionados.RecordCount);
      CdsBeneficiariosSelecionados.DisableControls;
      CdsBeneficiariosSelecionados.First;
      While Not CdsBeneficiariosSelecionados.Eof Do
        Begin
          CdsBeneficiariosSelecionados.Edit;
          If CdsBeneficiariosSelecionados.FieldByName('MARCADO').AsString = 'S' Then
            CdsBeneficiariosSelecionados.FieldByName('MARCADO').AsString := 'N'
          Else
            CdsBeneficiariosSelecionados.FieldByName('MARCADO').AsString := 'S';

          CdsBeneficiariosSelecionados.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      CdsBeneficiariosSelecionados.First;
      CdsBeneficiariosSelecionados.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;

  CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.frmFrameListaBenef1bbtnIncluiBenefClick(Sender: TObject);
Begin
  Inherited;
  frmFrameListaBenef1.bbtnIncluiBenefClick(Sender);
  _AjustaLabelListasInternaExterna;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.frmFrameListaBenef1bbtnExcluiCorrenteClick(Sender: TObject);
Begin
  Inherited;
  frmFrameListaBenef1.bbtnExcluiCorrenteClick(Sender);
  _AjustaLabelListasInternaExterna;

End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.frmFrameListaBenef1bbtnIncluiListaClick(Sender: TObject);
Begin
  Inherited;
  frmFrameListaBenef1.bbtnIncluiListaClick(Sender);
  _AjustaLabelListasInternaExterna;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.frmFrameListaBenef1bbtnExcluiTudoClick(Sender: TObject);
Begin
  Inherited;
  frmFrameListaBenef1.bbtnExcluiTudoClick(Sender);
  _AjustaLabelListasInternaExterna;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgConsultaMovCalcTitleImage(
  Sender: TObject; Field: TField;
  Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
  Inherited;
  If (Field.FieldName = 'FONTEPAGADORA') Or
    (Field.FieldName = 'IDINFORME') Or
    (Field.FieldName = 'CODNATUREZA') Or
    (Field.FieldName = 'HISTORICO') Then
    Begin
      TitleImageAttributes.ImageIndex := 0;
      If Trim(cdsConsultaMovBenef.IndexName) = Trim('desc' + Field.FieldName) Then
        TitleImageAttributes.ImageIndex := 1;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgConsultaMovTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
  Inherited;
  Try
    If (Not cdsConsultaMovBenef.Active) Or
      (cdsConsultaMovBenef.IsEmpty) Or
      ((AFieldName <> 'FONTEPAGADORA') And
      (AFieldName <> 'IDINFORME') And
      (AFieldName <> 'CODNATUREZA') And
      (AFieldName <> 'HISTORICO')) Then
      Exit;

    If (Trim(cdsConsultaMovBenef.IndexName) = Trim('asc' + AFieldName)) Then
      cdsConsultaMovBenef.IndexName := 'desc' + AFieldName
    Else
      cdsConsultaMovBenef.IndexName := 'asc' + AFieldName;

  Finally
    cdsConsultaMovBenef.First;
  End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbExpMovClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsConsultaMovBenef.isEmpty Then
    Begin
      cdsConsultaMovBenef.First;
      qeConsultaMovBenef.FileName := DirLogBusca + '\MOV_' + cdsConsultaMovBenef.FieldByName('NUMDOCUMENTO').AsString + '.xls';
      qeConsultaMovBenef.Execute;
      cdsConsultaMovBenef.First;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbExpBenefSelClick(Sender: TObject);
Begin
  Inherited;
  If Not CdsBeneficiariosSelecionados.isEmpty Then
    Begin
      CdsBeneficiariosSelecionados.AfterScroll := Nil;
      qeBenefSelecionados.FileName := DirLogBusca + '\MOVBENEF_SELECIONADOS.xls';
      qeBenefSelecionados.Execute;
      cdsBeneficiariosSelecionados.First;
      CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbDesfazBuscaIndivClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsConsultaMovBenef.IsEmpty Then
    Begin
      If Application.MessageBox(MSG014, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            // Paulo / Andre - SIG26821 - Inicio
            If oBUSCADIRF._DesfazerProcessosBUSCA(
              cdsConsultaMovBenef.FieldByName('NUMDOCUMENTO').AsString,
              cdsConsultaMovBenef.FieldByName('IDHSTFOLHABENEF').AsInteger,
              dedDataIni.date,
              dedDataFim.date,
              '0000',
              False,
              Nil) Then
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);
              End
            Else
              Application.MessageBox('Existe DARF gerado para os Lançamentos de IR. Verifique !', 'Atenção !', Mb_IconExclamation);
            // Paulo / Andre - SIG26821 - Fim

            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

                Screen.Cursor := crDefault;

                Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dblcVersaoFolhaCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Var sMes, sAno, sUltDia: String;
  dDataVenc, dtFim: TDateTime;
Begin
  Inherited;
  cdsNaturRendimento.data := oBUSCADIRF._ListaNatuRendimento('0');
  cdsNaturRendimento2.data := cdsNaturRendimento.data;
  dblcNatRendimento.LookupValue := '0000'; // Todas Naturezas como Default
  dblcNatRendimento2.LookupValue := dblcNatRendimento.LookupValue; // Todas como Default

  dDataVenc := ModuloIRRF.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 3, True);
  sAno := inttostr(DiasUteis.ExtraiAno(dDataVenc));
  dedDataIni.Date := strtodate('01/01/' + sAno);
  dedDataFim.Date := strtodate('31/12/' + sAno);
  dedDataIni.Text := DateToStr(dedDataIni.Date);
  dedDataFim.Text := DateToStr(dedDataFim.Date);
  If dblcVersaoFolha.LookupValue <> '-1' Then // Uma Folha selecionada
    Begin
      sMes := IntToStr(DiasUteis.ExtraiMes(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      sAno := IntToStr(DiasUteis.ExtraiAno(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      dtFim := DiasUteis.UltDiaMes(strtoint(sAno), strtoint(sMes));
      sUltDia := IntToStr(DiasUteis.ExtraiDia(dtFim));
      dedDataIni.Date := strtodate('01' + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataFim.Date := strtodate(sUltDia + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
    End;

  dblcVersaoFolha2.LookupValue := dblcVersaoFolha.LookupValue;
  dblcNatRendimento2.LookupValue := dblcNatRendimento.LookupValue;
  dedDataIni2.Date := dedDataIni.Date;
  dedDataFim2.Date := dedDataFim.Date;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dedDataIniChange(Sender: TObject);
Var sAno: String;
Begin
  Inherited;
  If cdsVersoesFolha.fieldbyname('IDHSTFOLHABENEF').asInteger = -1 Then
    Begin
      sAno := inttostr(DiasUteis.ExtraiAno(dedDataIni.date));
      dedDataFim.Date := strtodate('31/12/' + sAno);
    End
  Else
    dedDataFim.Date := TrazUltDiaData(dedDataIni.date);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbImpExtratoClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsConsultaMovBenef.isEmpty Then
    Begin
      qryEmpresa.Close;
      qryEmpresa.Open;
      cdsConsultaMovBenef.First;
      cdsConsultaMovBenef.DisableControls;
      TfrmPreview.CreateModalPreview(Application, rptMovBeneficiario, rptMovBeneficiario.PrinterSetup.DocumentName);
      qryEmpresa.Close;
      cdsConsultaMovBenef.First;
      cdsConsultaMovBenef.EnableControls;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgBenefSelCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  // faz com que as linhas do grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = Cinza, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgConsultaMovCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited; // faz com que as linhas do grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        // linhas ímpares = Cinza, linhas pares = branco
        If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
          ABrush.Color := CorDaZebra
        Else
          ABrush.Color := clWhite;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.btnavDesfazerFiltroClick(Sender: TObject);
Begin
  Inherited;
  cdsConsultaMovBenef.Filtered := False;
  imgSitFiltroConsMov.Visible := cdsConsultaMovBenef.Filtered;
  ppTotalInforme.Visible := False;
  pplblTotalInforme.Visible := False;
  dbgConsultaMov.ColumnByName('VLRLANC').FooterValue := '0,00';
  dbgConsultaMov.ColumnByName('VLRIRRF').FooterValue := TotalizaColunaGridMov('VLRIRRF', 2);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.btnavFiltrarClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsConsultaMovBenef.isEmpty Then
    Begin
      dbgConsultaMov.ColumnByName('VLRLANC').FooterValue := '0,00';
      dbgConsultaMov.ColumnByName('VLRIRRF').FooterValue := '0,00';
      If FitrarMovimento.Execute Then
        Begin
          If cdsConsultaMovBenef.Filtered Then
            Begin
              imgSitFiltroConsMov.Visible := cdsConsultaMovBenef.Filtered;
              dbgConsultaMov.ColumnByName('VLRLANC').FooterValue := TotalizaColunaGridMov('VLRLANC', 2);
              dbgConsultaMov.ColumnByName('VLRIRRF').FooterValue := TotalizaColunaGridMov('VLRIRRF', 2);
              pplblTotalInforme.Caption := 'Total do Informe > ' + cdsConsultaMovBenef.fieldbyname('IDINFORME').asString + ' : ';
              ppTotalInforme.Visible := True;
              pplblTotalInforme.Visible := True;
            End;
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgConsultaMovDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not cdsConsultaMovBenef.isEmpty Then
    Begin
      If cdsConsultaMovBenef.fieldbyname('FLGLANC_QUITACAOBUSCA').asString = 'S' Then
        dbgConsultaMov.Canvas.Font.Color := clBlue;

      If cdsConsultaMovBenef.fieldbyname('FLGLANC_COMPENSABUSCA').asString = 'S' Then
        dbgConsultaMov.Canvas.Font.Color := clMaroon;

      dbgConsultaMov.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Function TfrmBUSCA_DIRFFolhaBeneficios.TotalizaColunaGridMov(pCampo: String; pDecimal: Integer): String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  cdsConsultaMovBenef.DisableControls;
  cdsConsultaMovBenef.First;
  While Not cdsConsultaMovBenef.EOF Do
    Begin
      dTotalFiltro := dTotalFiltro + cdsConsultaMovBenef.Fieldbyname(pCampo).asFloat;

      cdsConsultaMovBenef.Next;
    End;
  cdsConsultaMovBenef.enableControls;
  cdsConsultaMovBenef.First;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, pDecimal);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbProcessarMovimentoClick(Sender: TObject);
var
  SP_BuscaPensao : TwwStoredProc;
Begin
  Inherited;
  If chkApresentaMovAnual.checked Then
    Begin
      Application.MessageBox('Não é possível Processar com a opção de "Apresentar' + #13 +
        'todo Movimento do Exercício" Ativa. Verifique !', 'Atenção !', Mb_IconExclamation);
      Exit;
    End;

  CdsBeneficiariosSelecionados.AfterScroll := Nil;
  If CdsBeneficiariosSelecionados.Locate('MARCADO', 'S', []) Then
    Begin
      If CdsBeneficiariosSelecionados.Locate('MARCADO', 'N', []) Then
        Begin
          cdsConsultaMovBenef.DisableControls;
          // Filtrando a Grid somente para mostrar e processar os marcados
          CdsBeneficiariosSelecionados.Filtered := False;
          CdsBeneficiariosSelecionados.Filter := 'MARCADO = ''S'' ';
          CdsBeneficiariosSelecionados.Filtered := True;
          cdsConsultaMovBenef.EnableControls;
        End;

      If Application.MessageBox(MSG009, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          // Carregando, novamente, o componente TStringList agora com os Beneficiários que estão na GRID,
          // pois podem não serem todos os que estavam na qrylista da aba "Lista de Beneficiários"
          CdsBeneficiariosSelecionados.AfterScroll := Nil;
          tsListaDeBeneficiarios.Clear;
          CdsBeneficiariosSelecionados.DisableControls;
          CdsBeneficiariosSelecionados.First;
          With CdsBeneficiariosSelecionados Do
            Begin
              First;
              While Not EOF Do
                Begin
                  tsListaDeBeneficiarios.Add(FieldByName('CPFRESP').asString);
                  Next;
                End;
              First;
            End;
          CdsBeneficiariosSelecionados.EnableControls;
          CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
          //
          // PROCESSAMENTO DA BUSCA
          // Chamando a execução do Processamento Principal
          //

          iVersaoFolha := strtoint(dblcVersaoFolha.LookupValue);
          sCodNatureza := dblcNatRendimento.LookupValue;

          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            If oBUSCADIRF._ProcessarMovimentoDaBUSCA(
              dedDataIni.Date,
              dedDataFim.Date,
              iVersaoFolha,
              Trim(sCodNatureza),
              CdsBeneficiariosSelecionados,
              CdsConsultaMovBenef,
              tsListaDeBeneficiarios,
              chkGeraListaBeneficiarios.checked,
              gProgresso) Then
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                CdsBeneficiariosSelecionados.Filtered := False;
                CdsBeneficiariosSelecionados.First;
                Screen.Cursor := crDefault;

                // Atualizando o Movimento das quitações com a última folha
                If Not cdsBenefSelecionadoQuitacao.isEmpty Then
                  Begin
                    //
                    frmAguarde.pbAguarde.Visible := false;
                    frmAguarde.Mostra('Atualizando Quitações selecionadas...');

                    // Atualizando o movimento das quitações
                    cdsBenefSelecionadoQuitacao.DisableControls;
                    cdsBenefSelecionadoQuitacao.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoQUITACAO(
                      dblcAnoExercicio.text,
                      tsListaDeBeneficiarios, // Lista de Beneficiários
                      ChkGeraListaBeneficiariosEncerramento.checked);

                    cdsBenefSelecionadoQuitacao.EnableControls;
                    cdsBenefSelecionadoQuitacao.First;

                    frmAguarde.pbAguarde.Visible := True;
                    frmAguarde.Apaga;
                  End;

                spbProcessarMovimento.Enabled := False;

                bMostraContadores := True;
                CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

                SalvarArquivoLog(iVersaoFolha, sCodNatureza);
                Application.MessageBox(pchar(oBUSCADIRF.sMensagemProcessamento), 'Atenção !', MB_ICONINFORMATION + MB_OK);
                If pcProcessaBusca.ActivePage = tbsCritSel Then
                  Begin
                    dblcVersaoFolha.Setfocus;
                    dblcVersaoFolha.Selected;
                  End;
              End
            Else
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

                CdsBeneficiariosSelecionados.Filtered := False;
                Screen.Cursor := crDefault;

                Application.MessageBox(pchar(oBUSCADIRF.sMensagemProcessamento), 'Atenção !', MB_ICONINFORMATION + MB_OK);

                oBUSCADIRF.InicializaFormulario();
                meQtd.Caption := Format('%.2d / %.2d', [CdsBeneficiariosSelecionados.RecNo, CdsBeneficiariosSelecionados.RecordCount]);
                spbProcessarMovimento.Enabled := Not CdsBeneficiariosSelecionados.isEmpty;
              End
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

                Screen.Cursor := crDefault;
                CdsBeneficiariosSelecionados.Filtered := False;
                oBUSCADIRF.InicializaFormulario();
                meQtd.Caption := Format('%.2d / %.2d', [CdsBeneficiariosSelecionados.RecNo, CdsBeneficiariosSelecionados.RecordCount]);
                spbProcessarMovimento.Enabled := Not CdsBeneficiariosSelecionados.isEmpty;

                Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End
      Else
        Begin
          pcProcessaBusca.ActivePage := tbsCritSel;
          CdsBeneficiariosSelecionados.Filtered := False;
          CdsBeneficiariosSelecionados.First;
          meQtd.Caption := Format('%.2d / %.2d', [CdsBeneficiariosSelecionados.RecNo, CdsBeneficiariosSelecionados.RecordCount]);
          dedDataIni.setfocus;
        End;

        //SIG85183.92415 - início
        If rdgSelTipoLista.ItemIndex = 0 Then //Interno  SIG  Rafael 96222
         begin
             try
               SP_BuscaPensao := TwwStoredProc.Create(self);
               SP_BuscaPensao.DatabaseName := 'BaseDados';
               SP_BuscaPensao.StoredProcName := 'CM.SP_FB_BUSCA_DIRF_PENSAO_INSS';
               SP_BuscaPensao.Params.CreateParam (Ftfloat, 'IN_IDHSTFOLHABENEF', ptInput).AsFloat := StrtoFloat(dblcVersaoFolha.LookupValue);
               SP_BuscaPensao.Params.CreateParam (Ftinteger, 'IN_IDLISTA', ptInput).AsInteger := StrToInt(frmFrameListaBenef1.qryLista.ParamByName('IDLISTA').AsString);  //Ewerton Beltramini - Sig96222
               SP_BuscaPensao.Prepare;
               SP_BuscaPensao.ExecProc;
             finally
                FreeAndNil(SP_BuscaPensao);
             end;
         end;

        //SIG85183.92415 - fim
    End
  Else
    Application.MessageBox(PChar(MSG010), 'Atenção !', Mb_IconExclamation);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.cdsBenefSelecionadoQuitacaoAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  If (Not cdsBenefSelecionadoQuitacao.isEmpty) Then
    Begin
      meQtd2.Caption := Format('%.2d / %.2d', [cdsBenefSelecionadoQuitacao.RecNo, cdsBenefSelecionadoQuitacao.RecordCount]);
      mePerc2.Caption := floattostrf(((cdsBenefSelecionadoQuitacao.RecNo / cdsBenefSelecionadoQuitacao.RecordCount) * 100), ffnumber, 5, 2) + ' % ';
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbMarcaTodosQuitacaoClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If (Not cdsBenefSelecionadoQuitacao.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Beneficiários...', True, False, True, 0, cdsBenefSelecionadoQuitacao.RecordCount);
      cdsBenefSelecionadoQuitacao.DisableControls;
      cdsBenefSelecionadoQuitacao.First;
      While Not cdsBenefSelecionadoQuitacao.Eof Do
        Begin
          cdsBenefSelecionadoQuitacao.Edit;
          cdsBenefSelecionadoQuitacao.FieldByName('MARCADO').AsString := 'S';

          cdsBenefSelecionadoQuitacao.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      cdsBenefSelecionadoQuitacao.First;
      cdsBenefSelecionadoQuitacao.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbInverterSelQuitacaoClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If (Not cdsBenefSelecionadoQuitacao.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Beneficiários...', True, False, True, 0, cdsBenefSelecionadoQuitacao.RecordCount);
      cdsBenefSelecionadoQuitacao.DisableControls;
      cdsBenefSelecionadoQuitacao.First;
      While Not cdsBenefSelecionadoQuitacao.Eof Do
        Begin
          cdsBenefSelecionadoQuitacao.Edit;
          If cdsBenefSelecionadoQuitacao.FieldByName('MARCADO').AsString = 'S' Then
            cdsBenefSelecionadoQuitacao.FieldByName('MARCADO').AsString := 'N'
          Else
            cdsBenefSelecionadoQuitacao.FieldByName('MARCADO').AsString := 'S';

          cdsBenefSelecionadoQuitacao.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      cdsBenefSelecionadoQuitacao.First;
      cdsBenefSelecionadoQuitacao.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.ChkGeraListaBeneficiariosEncerramentoClick(Sender: TObject);
Begin
  Inherited;
  tbsListaPessoa.TabVisible := ChkGeraListaBeneficiariosEncerramento.Checked;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgMovQuitacaoCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  // faz com que as linhas da grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = Cinza, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dblcNatRendimentoCloseUp(
  Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  //  spbProcessarMovimento.Enabled := False;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dedDataFimChange(Sender: TObject);
Begin
  Inherited;
  //  If iVersaoFolha <> -1 Then // Todas
  //    spbProcessarMovimento.Enabled := False;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgMovQuitacaoDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If Not cdsBenefSelecionadoQuitacao.isEmpty Then
    Begin
      If Field.Name = 'cdsBenefSelecionadoQuitacaoULTIMA_FOLHA' Then
        dbgMovQuitacao.Canvas.Font.Style := [fsbold];

      If Field.Name = 'cdsBenefSelecionadoQuitacaoTEM_QUITACAO' Then
        Begin
          dbgMovQuitacao.Canvas.Font.Style := [fsbold];
          If cdsBenefSelecionadoQuitacao.fieldbyname('TEM_QUITACAO').asString = 'Não' Then
            dbgMovQuitacao.Canvas.Font.Color := clRed
          Else
            dbgMovQuitacao.Canvas.Font.Color := clGreen;

          dbgMovQuitacao.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbDesfazerProcsEncerramentoClick(Sender: TObject);
Begin
  Inherited;
  // Desfazer lançamentos gerados do Compensa Valor negativo
  If pcEncerramentoPeriodo.ActivePage = tbsCompValNeg Then
    Begin
      If cdsBenefSelecionadoCompensa.Locate('MARCADO', 'S', []) Then
        Begin
          If Application.MessageBox(pchar(MSG015), 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
            Begin
              // Carregando o componente TStringList com os Beneficiários que estão na GRID
              CdsBeneficiariosSelecionados.AfterScroll := Nil;
              tsListaDeBeneficiarios.Clear;
              cdsBenefSelecionadoCompensa.DisableControls;
              cdsBenefSelecionadoCompensa.First;
              With cdsBenefSelecionadoCompensa Do
                Begin
                  First;
                  While Not EOF Do
                    Begin
                      tsListaDeBeneficiarios.Add(cdsBenefSelecionadoCompensa.FieldByName('NUMDOCUMENTO').asString);
                      Next;
                    End;
                  First;
                End;
              cdsBenefSelecionadoCompensa.EnableControls;
              CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
              cdsBenefSelecionadoCompensa.First;

              Try
                Screen.Cursor := crSQLWait;

                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Desfazendo as Compensações');

                qryBenefValoresACompensar.DisableControls;
                qryBenefCompMovFolhasProc.DisableControls;

                cdsBenefSelecionadoCompensa.First;
                While Not cdsBenefSelecionadoCompensa.EOF Do
                  Begin
                    If (cdsBenefSelecionadoCompensa.fieldByname('TEM_COMPENSA').asString = 'Sim') Then
                      Begin

                        oBUSCADIRF._DesfazerProcessoCompensaOuQuitacao(
                          'C', // Compensa
                          cdsBenefSelecionadoCompensa.fieldByname('ANOREF').asString,
                          cdsBenefSelecionadoCompensa.fieldByname('NUMDOCUMENTO').asString,
                          -1);
                      End;

                    cdsBenefSelecionadoCompensa.Next;
                  End;

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                cdsBenefSelecionadoCompensa.DisableControls;
                cdsBenefSelecionadoCompensa.Close;
                cdsBenefSelecionadoCompensa.Data := oBUSCADIRF._AvaliarOcorrDeBenefValoresNegativosACompensar(
                  dblcAnoExercicio.text,
                  tsListaDeBeneficiarios, // Lista de Beneficiários
                  ChkGeraListaBeneficiariosEncerramento.checked);
                cdsBenefSelecionadoCompensa.Open;
                cdsBenefSelecionadoCompensa.EnableControls;
                dbgBenefACompensar.RefreshDisplay;

                qryBenefValoresACompensar.Close;
                qryBenefValoresACompensar.Open;
                qryBenefCompMovFolhasProc.Close;
                qryBenefCompMovFolhasProc.Open;

                qryBenefValoresACompensar.EnableControls;
                qryBenefCompMovFolhasProc.EnableControls;

                CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

                Screen.Cursor := crDefault;

                frmAguarde.pbAguarde.Visible := True;
                frmAguarde.Apaga;
              Except
                On E: Exception Do
                  Begin
                    frmAguarde.pbAguarde.Visible := True;
                    frmAguarde.Apaga;

                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.RollBack;

                    Screen.Cursor := crDefault;
                    Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  End;
              End;
            End;
        End
      Else
        Application.MessageBox(PChar(MSG010), 'Atenção !', Mb_IconExclamation);
    End
  Else
    Begin
      // Desfazer lançamentos gerados da Quitação
      If pcEncerramentoPeriodo.ActivePage = tbsQuitacao Then
        Begin
          If cdsBenefSelecionadoQuitacao.Locate('MARCADO', 'S', []) Then
            Begin
              If Application.MessageBox(MSG012, ' Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
                Begin
                  Try
                    Screen.Cursor := crSQLWait;
                    If Not dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.StartTransaction;

                    frmAguarde.pbAguarde.Visible := false;
                    frmAguarde.Mostra('Desfazendo Quitações selecionadas');

                    cdsBenefSelecionadoQuitacao.DisableControls;
                    cdsBenefSelecionadoQuitacao.First;
                    While Not cdsBenefSelecionadoQuitacao.EOF Do
                      Begin
                        If (cdsBenefSelecionadoQuitacao.fieldByname('TEM_QUITACAO').asString = 'Sim') Then
                          Begin

                            oBUSCADIRF._DesfazerProcessoCompensaOuQuitacao(
                              'Q', // Quitação
                              cdsBenefSelecionadoQuitacao.fieldByname('ANO_EXERCICIO').asString,
                              cdsBenefSelecionadoQuitacao.fieldByname('NUMDOCUMENTO').asString,
                              //William Moreira da Silva - SIG 19503
                              -1);

                            //cdsBenefSelecionadoQuitacao.FieldByName('ULTIMA_VERSAO_FOLHA').AsInteger);
                            //William Moreira da Silva - SIG 19503
                          End;

                        cdsBenefSelecionadoQuitacao.Next;
                      End;

                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Commit;

                    // Atualizando o movimento das quitações
                    cdsBenefSelecionadoQuitacao.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoQUITACAO(
                      dblcAnoExercicio.text,
                      tsListaDeBeneficiarios, // Lista de Beneficiários
                      ChkGeraListaBeneficiariosEncerramento.checked);
                    cdsBenefSelecionadoQuitacao.EnableControls;

                    cdsBenefSelecionadoQuitacao.First;
                    dbgMovQuitacao.RefreshDisplay;

                    CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

                    Screen.Cursor := crDefault;

                    frmAguarde.pbAguarde.Visible := True;
                    frmAguarde.Apaga;
                  Except
                    On E: Exception Do
                      Begin
                        frmAguarde.pbAguarde.Visible := True;
                        frmAguarde.Apaga;

                        If dtmBaseDados.dbBaseDados.InTransaction Then
                          dtmBaseDados.dbBaseDados.RollBack;

                        Screen.Cursor := crDefault;
                        Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                      End;
                  End;
                End;
            End
          Else
            Application.MessageBox(PChar(MSG010), 'Atenção !', Mb_IconExclamation);
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.btnavLocalizarBenefClick(Sender: TObject);
Begin
  Inherited;
  // Desliga o scroll enquanto o componente executa a localização
  CdsBeneficiariosSelecionados.AfterScroll := Nil;
  If LocalizaBenefBUSCA.Execute Then
    Begin
      // Ativa o scroll após a localização
      CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
      // Executa o scroll após a localização
      CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);
    End
  Else
    // Ativa o scroll após a localização
    CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgBenefSelDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not CdsBeneficiariosSelecionados.isEmpty Then
    Begin
      If Field.Name = 'CdsBeneficiariosSelecionadosIDHSTFOLHABENEF' Then
        dbgBenefSel.Canvas.Font.Style := [fsbold];

      dbgBenefSel.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbDesfazerBUSCA2Click(Sender: TObject);
Var sMsg: String;
Begin
  Inherited;

  iVersaoFolha := strtoint(dblcVersaoFolha2.LookupValue); // Paulo / Andre - SIG26821
  sCodNatureza := dblcNatRendimento2.LookupValue; // Paulo / Andre - SIG26821

  If iVersaoFolha = -1 Then // Todas
    Begin
      If Application.MessageBox(MSG016, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDNO Then
        Begin
          pcProcessaBusca.ActivePage := tbsDesfazer;
          dblcVersaoFolha2.SetFocus;
          dblcVersaoFolha2.Selected;
          Exit;
        End;
    End;

  If sCodNatureza = '0000' Then // Todas
    Begin
      If Application.MessageBox(MSG017, 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDNO Then
        Begin
          pcProcessaBusca.ActivePage := tbsDesfazer;
          dblcNatRendimento2.SetFocus;
          Exit;
        End;
    End;

  sMsg := MSG013;
  If (Not ChkGeraListaBeneficiarios2.checked) And (iVersaoFolha = -1) Then
    sMsg := '** PROCESSO LENTO ** - ' + sMsg;

  If Application.MessageBox(pchar(sMsg), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
    Begin
      Try
        Screen.Cursor := crSQLWait;
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        If ChkGeraListaBeneficiarios2.Checked Then
          Begin
            If rdgSelTipoLista.ItemIndex = 0 Then
              Begin
                If frmFrameListaBenef1.qryLista.IsEmpty Then
                  Begin
                    MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
                    Begin
                      pcProcessaBusca.ActivePage := tbsListaPessoa;
                      Exit;
                    End;
                  End
                Else
                  Begin
                    // Carregando um componente TStringList com os Beneficiários da qrylista da aba "Lista de Beneficiários"
                    tsListaDeBeneficiarios.Clear;
                    frmFrameListaBenef1.qryLista.DisableControls;
                    With frmFrameListaBenef1.qryLista Do
                      Begin
                        First;
                        While Not EOF Do
                          Begin
                            tsListaDeBeneficiarios.Add(FieldByName('NUMDOCUMENTO').asString);
                            Next;
                          End;
                        First;
                      End;
                    frmFrameListaBenef1.qryLista.EnableControls;
                  End;
              End
            Else
              Begin
                If lbCPFBeneficiarios.Items.Text = EmptyStr Then
                  Begin
                    MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
                    pcProcessaBusca.ActivePage := tbsListaPessoa;
                    Exit;
                  End
                Else
                  Begin
                    tsListaDeBeneficiarios.Clear;
                    tsListaDeBeneficiarios.Text := lbCPFBeneficiarios.Items.Text;
                  End;
              End;
          End;

        Screen.Cursor := crSQLWait;

        frmAguarde.pbAguarde.Visible := false;
        frmAguarde.Mostra('Desfazendo a BUSCA...');
        //
        // Rotina para desfazer a BUSCA de forma geral
        //
        // Paulo / Andre - SIG26821 - Inicio
        If oBUSCADIRF._DesfazerProcessosBUSCA(
          '', // CPF
          iVersaoFolha,
          dedDataIni2.date,
          dedDataFim2.date,
          Trim(sCodNatureza),
          ChkGeraListaBeneficiarios2.checked,
          tsListaDeBeneficiarios) Then
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;
          End
        Else
          Application.MessageBox('Existe DARF gerado para os Lançamentos de IR. Verifique !', 'Atenção !', Mb_IconExclamation);
        // Paulo / Andre - SIG26821 - Fim

        CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

        spbProcessarMovimento.Enabled := Not CdsBeneficiariosSelecionados.isEmpty;

        frmAguarde.pbAguarde.Visible := True;
        frmAguarde.Apaga;
        Screen.Cursor := crDefault;

        dblcVersaoFolha2.setfocus;
      Except
        On E: Exception Do
          Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.RollBack;

            Screen.Cursor := crDefault;

            frmAguarde.pbAguarde.Visible := True;
            frmAguarde.Apaga;

            Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
          End;
      End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.ChkGeraListaBeneficiarios2Click(Sender: TObject);
Begin
  Inherited;
  tbsListaPessoa.TabVisible := ChkGeraListaBeneficiarios2.Checked;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton3Click(Sender: TObject);
Begin
  Inherited;
  WinExec('Calc.Exe', SW_Show);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dedDataIni2Change(Sender: TObject);
Var sAno: String;
Begin
  Inherited;
  sAno := FormatDateTime('yyyy', dedDataIni2.Date);
  dedDataFim2.Date := strtodate('31/12/' + sAno);
  dedDataFim2.Text := DateToStr(dedDataFim2.Date);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  Inherited;

  // Quando digitado o ESC, caso as grids estejam filtradas,
  // então estas voltarão ao seu estado normal sem o filtro.
  If key = #27 Then
    Begin
      If pcProcessaBusca.ActivePage = tbsConsultaMov Then
        Begin
          If cdsConsultaMovBenef.Filtered Then
            btnavDesfazerFiltroClick(self);
        End;
      If pcProcessaBusca.ActivePage = tbsCritSel Then
        Begin
          If CdsBeneficiariosSelecionados.Filtered Then
            CdsBeneficiariosSelecionados.Filtered := False;
        End;
      If (pcProcessaBusca.ActivePage = tbsEncPeriodo) And (pcEncerramentoPeriodo.ActivePage = tbsCompValNeg) Then
        Begin
          If qryBenefCompMovFolhasProc.Filtered Then
            qryBenefCompMovFolhasProc.Filtered := False;
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dblcVersaoFolha2CloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Var sMes, sAno, sUltDia: String;
  dtFim, dDataVenc: TDateTime;
Begin
  Inherited;
  cdsNaturRendimento2.data := oBUSCADIRF._ListaNatuRendimento('0');
  dDataVenc := ModuloIRRF.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 3, True);
  sAno := inttostr(DiasUteis.ExtraiAno(dDataVenc));
  dedDataIni2.Date := strtodate('01/01/' + sAno);
  dedDataFim2.Date := strtodate('31/12/' + sAno);
  dedDataIni2.Text := DateToStr(dedDataIni2.Date);
  dedDataFim2.Text := DateToStr(dedDataFim2.Date);
  dblcNatRendimento2.LookupValue := '0000'; // Todas naturezas como Default
  If dblcVersaoFolha2.LookupValue <> '-1' Then // Uma Folha selecionada
    Begin
      sMes := IntToStr(DiasUteis.ExtraiMes(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      sAno := IntToStr(DiasUteis.ExtraiAno(cdsVersoesFolha.FieldByName('DATAPREVPAGTO').asDateTime));
      dtFim := DiasUteis.UltDiaMes(strtoint(sAno), strtoint(sMes));
      sUltDia := IntToStr(DiasUteis.ExtraiDia(dtFim));
      dedDataIni2.Date := strtodate('01' + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
      dedDataFim2.Date := strtodate(sUltDia + '/' + strzero(2, sMes) + '/' + strzero(2, sAno));
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbSelecionarBeneficiariosClick(Sender: TObject);
Var bMovimentoVazio: Boolean;
  sMsg: String;
Begin
  Inherited;
  bMovimentoVazio := False;
  sMsg := '';
  If pcEncerramentoPeriodo.ActivePage = tbsAvaliaIsencao Then
    Begin
      frmAguarde.pbAguarde.Visible := false;
      frmAguarde.Mostra('Avaliando Isenções Retroativas');

      Cursor := crSQLWait; ;
      cdsBenefSelecionadoIsencao.DisableControls;
      cdsBenefSelecionadoIsencao.Close;
      cdsBenefSelecionadoIsencao.Data := oBUSCADIRF._AvaliarOcorrenciaDeIsencaoRetroativa(dblcAnoExercicio.text);
      cdsBenefSelecionadoIsencao.EnableControls;
      qryBenefFolhasProcessadas.Close;
      qryBenefFolhasProcessadas.Open;
      Cursor := crDefault;

      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;

      If cdsBenefSelecionadoIsencao.isEmpty Then
        Application.MessageBox('Não encontrado Movimento de Isenções Retroativas. Verifique !', 'Atenção !', Mb_IconExclamation);
    End
  Else If (pcEncerramentoPeriodo.ActivePage = tbsCompValNeg) Or (pcEncerramentoPeriodo.ActivePage = tbsQuitacao) Then
    Begin
      If ChkGeraListaBeneficiariosEncerramento.Checked Then
        Begin
          If rdgSelTipoLista.ItemIndex = 0 Then
            Begin
              If frmFrameListaBenef1.qryLista.IsEmpty Then
                Begin
                  MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
                  Begin
                    If (pcEncerramentoPeriodo.ActivePage = tbsQuitacao) Then
                      Begin
                        If Not cdsBenefSelecionadoQuitacao.isEmpty Then
                          Begin
                            cdsBenefSelecionadoQuitacao.active := False;
                            SqlBenefSelecionadoQuitacao.Open;
                          End;
                      End;
                    Exit;
                  End;
                End
              Else
                Begin
                  // Carregando um componente TStringList com os Beneficiários da qrylista da aba "Lista de Beneficiários"
                  tsListaDeBeneficiarios.Clear;
                  frmFrameListaBenef1.qryLista.DisableControls;
                  With frmFrameListaBenef1.qryLista Do
                    Begin
                      First;
                      While Not EOF Do
                        Begin
                          tsListaDeBeneficiarios.Add(FieldByName('NUMDOCUMENTO').asString);
                          Next;
                        End;
                      First;
                    End;
                  frmFrameListaBenef1.qryLista.EnableControls;
                End;
            End
          Else
            Begin
              If lbCPFBeneficiarios.Items.Text = EmptyStr Then
                Begin
                  MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
                  pcProcessaBusca.ActivePage := tbsListaPessoa;
                  Exit;
                End
              Else
                Begin
                  tsListaDeBeneficiarios.Clear;
                  tsListaDeBeneficiarios.Text := lbCPFBeneficiarios.Items.Text;
                End;
            End;
        End
      Else
        Begin
          If Application.MessageBox(pchar('Deseja selecionar todos os Beneficiários p/ o Ano de ' + dblcAnoExercicio.text + ' ?'), 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDNO Then
            Begin
              pcProcessaBusca.ActivePage := tbsQuitacao;
              dblcAnoExercicio.SetFocus;
              Exit;
            End;
        End;

      Screen.Cursor := crSQLWait;
      //
      frmAguarde.pbAguarde.Visible := False;
      frmAguarde.Mostra('Selecionando os Beneficiários...');

      // COMPENSA VALOR NEGATIVO
      If (pcEncerramentoPeriodo.ActivePage = tbsCompValNeg) Then
        Begin
          qryBenefValoresACompensar.DisableControls;
          qryBenefCompMovFolhasProc.DisableControls;

          cdsBenefSelecionadoCompensa.DisableControls;
          cdsBenefSelecionadoCompensa.Close;
          cdsBenefSelecionadoCompensa.Data := oBUSCADIRF._AvaliarOcorrDeBenefValoresNegativosACompensar(
            dblcAnoExercicio.text,
            tsListaDeBeneficiarios, // Lista de Beneficiários
            ChkGeraListaBeneficiariosEncerramento.checked);
          cdsBenefSelecionadoCompensa.Open;
          cdsBenefSelecionadoCompensa.EnableControls;
          dbgBenefACompensar.RefreshDisplay;

          qryBenefValoresACompensar.Close;
          qryBenefValoresACompensar.Open;
          qryBenefCompMovFolhasProc.Close;
          qryBenefCompMovFolhasProc.Open;

          qryBenefValoresACompensar.EnableControls;
          qryBenefCompMovFolhasProc.EnableControls;

          bMovimentoVazio := (cdsBenefSelecionadoCompensa.isEmpty);
          sMsg := 'Não encontrado Movimento de Valores a Compensar. Verifique !'
        End
      Else // QUITAÇÃO
        Begin
          cdsBenefSelecionadoQuitacao.DisableControls;
          cdsBenefSelecionadoQuitacao.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoQUITACAO(
            dblcAnoExercicio.text,
            tsListaDeBeneficiarios, // Lista de Beneficiários
            ChkGeraListaBeneficiariosEncerramento.checked);
          cdsBenefSelecionadoQuitacao.EnableControls;
          cdsBenefSelecionadoQuitacao.First;
          bMovimentoVazio := (cdsBenefSelecionadoQuitacao.isEmpty);
          sMsg := 'Não encontrado Movimento de Quitações. Verifique !'
        End;

      frmAguarde.pbAguarde.Visible := True;
      frmAguarde.Apaga;

      Cursor := crDefault;

      If bMovimentoVazio Then
        Application.MessageBox(pchar(sMsg), 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.wwDBGrid2CalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  // faz com que as linhas da grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = Cinza, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbMarcaTodosIsencaoClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsBenefSelecionadoIsencao.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Beneficiários...', True, False, True, 0, cdsBenefSelecionadoIsencao.RecordCount);
      cdsBenefSelecionadoIsencao.DisableControls;
      cdsBenefSelecionadoIsencao.First;
      While Not cdsBenefSelecionadoIsencao.Eof Do
        Begin
          cdsBenefSelecionadoIsencao.Edit;
          cdsBenefSelecionadoIsencao.FieldByName('MARCADO').AsString := 'S';

          cdsBenefSelecionadoIsencao.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      cdsBenefSelecionadoIsencao.First;
      cdsBenefSelecionadoIsencao.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbInverterSelIsencaoClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsBenefSelecionadoIsencao.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Beneficiários...', True, False, True, 0, cdsBenefSelecionadoIsencao.RecordCount);
      cdsBenefSelecionadoIsencao.DisableControls;
      cdsBenefSelecionadoIsencao.First;
      While Not cdsBenefSelecionadoIsencao.Eof Do
        Begin
          cdsBenefSelecionadoIsencao.Edit;
          If cdsBenefSelecionadoIsencao.FieldByName('MARCADO').AsString = 'S' Then
            cdsBenefSelecionadoIsencao.FieldByName('MARCADO').AsString := 'N'
          Else
            cdsBenefSelecionadoIsencao.FieldByName('MARCADO').AsString := 'S';

          cdsBenefSelecionadoIsencao.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      cdsBenefSelecionadoIsencao.First;
      cdsBenefSelecionadoIsencao.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbProcessarSelecoesClick(Sender: TObject);
Var bProblema: Boolean;
Begin
  Inherited;
  // Paulo Nobre - SIG 30783 - inicio
  // ISENÇÃO RETRAOTIVA
  If pcEncerramentoPeriodo.ActivePage = tbsAvaliaIsencao Then
    Begin
      If cdsBenefSelecionadoIsencao.Locate('MARCADO', 'S', []) Then
        Begin
          If cdsBenefSelecionadoIsencao.Locate('MARCADO', 'N', []) Then
            Begin
              cdsBenefSelecionadoIsencao.DisableControls;
              // Filtrando a Grid somente para mostrar e processar os marcados
              cdsBenefSelecionadoIsencao.Filtered := False;
              cdsBenefSelecionadoIsencao.Filter := 'MARCADO = ''S'' ';
              cdsBenefSelecionadoIsencao.Filtered := True;
              cdsBenefSelecionadoIsencao.EnableControls;
            End;

          If Application.MessageBox(pchar('Uma vez realizado  este procedimento, o mesmo não  poderá  ser' + #13 +
            'realizado  novamente  com as datas atuais  de  início e  fim da' + #13 +
            'moléstia grave, sendo assim, a título meramente organizacional,' + #13 +
            'exporte a relação destes Beneficiários selecionados para Excel.' + #13 + #13 +
            'Confirma o Processo de Refazer as BUSCAS considerando as Isenções ? '), 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
            Begin
              bProblema := False;
              // Carregando o componente TStringList com os Beneficiários que estão na GRID
              CdsBeneficiariosSelecionados.AfterScroll := Nil;
              tsListaDeBeneficiarios.Clear;
              cdsBenefSelecionadoIsencao.DisableControls;
              cdsBenefSelecionadoIsencao.First;
              With cdsBenefSelecionadoIsencao Do
                Begin
                  First;
                  While Not EOF Do
                    Begin
                      tsListaDeBeneficiarios.Add(cdsBenefSelecionadoIsencao.FieldByName('NUMDOCUMENTO').asString);
                      Next;
                    End;
                  First;
                End;
              cdsBenefSelecionadoIsencao.EnableControls;
              CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
              cdsBenefSelecionadoIsencao.First;

              Try
                Screen.Cursor := crSQLWait;
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                gProgressoIsencao.Progress := 0;
                gProgressoIsencao.MinValue := 0;
                gProgressoIsencao.MaxValue := qryFolhasExercicioISENCAO.RecordCount;

                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Desfazendo/Refazendo as BUSCAS...');

                //
                // Realizar a refazimento da BUSCA para cada folha selecionada do Exercicio
                //
                qryFolhasExercicioISENCAO.First;
                While Not qryFolhasExercicioISENCAO.EOF Do
                  Begin
                    gProgressoIsencao.Progress := gProgressoIsencao.Progress + 1;

                    // Desfazendo a BUSCA da folha selecionada
                    // Paulo / Andre - SIG26821 - Inicio
                    If oBUSCADIRF._DesfazerProcessosBUSCA(
                      '', // CPF
                      qryFolhasExercicioISENCAO.fieldbyname('IDHSTFOLHABENEF').asInteger,
                      0,
                      0,
                      '0000', // Natureza
                      True,
                      tsListaDeBeneficiarios,
                      1) Then // Andre Imakawa - SIG 58888
                      Begin
                        // Apagando todo conteúdo da Tabela de Trabalho
                        _ApagaConteudoDaTabDeTrabalho(-1);

                        // Montando a Tabela de Trabalho com o Movimento da folha selecionada
                        If oBUSCADIRF._MontarTABTrabalhoComMovDosBeneficiarios(
                          '0000', // Natureza
                          qryFolhasExercicioISENCAO.fieldbyname('IDHSTFOLHABENEF').asInteger,
                          0,
                          0,
                          True,
                          tsListaDeBeneficiarios,
                          1) Then  // Andre Imakawa - SIG 39921
                          Begin
                            // Selecionando o Mov. gravado na Tabela de Trabalho para a BUSCA
                            CdsBeneficiariosSelecionados.Close;
                            CdsBeneficiariosSelecionados.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoBUSCA(qryFolhasExercicioISENCAO.fieldbyname('IDHSTFOLHABENEF').asInteger); ;
                            CdsBeneficiariosSelecionados.First;

                            // Refazendo o Processando da BUSCA
                            If Not oBUSCADIRF._ProcessarMovimentoDaBUSCA(
                              0,
                              qryFolhasExercicioISENCAO.fieldbyname('DATAPREVPAGTO').asDateTime,
                              qryFolhasExercicioISENCAO.fieldbyname('IDHSTFOLHABENEF').asInteger,
                              '0000', // Natureza
                              CdsBeneficiariosSelecionados,
                              CdsConsultaMovBenef,
                              tsListaDeBeneficiarios,
                              True,
                              Nil) Then
                              Begin
                                Application.MessageBox(pchar(oBUSCADIRF.sMensagemProcessamento), 'Atenção !', MB_ICONINFORMATION + MB_OK);
                                bProblema := True;
                                Break;
                              End;
                          End;
                      End
                    Else
                      Begin
                        Application.MessageBox('Existe DARF gerado para os Lançamentos de IR. Verifique !', 'Atenção !', Mb_IconExclamation);
                        bProblema := True;
                        Break;
                      End;
                    // Paulo / Andre - SIG26821 - Fim

                    // Pulando p/ a próxima folha
                    qryFolhasExercicioISENCAO.Next;
                  End;

                If Not bProblema Then
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.Commit;
                  End;

                gProgressoIsencao.Progress := 0;

                frmAguarde.pbAguarde.Visible := True;
                frmAguarde.Apaga;

                cdsBenefSelecionadoIsencao.Filtered := False;
                qryFolhasExercicioISENCAO.First;

                qryBenefFolhasProcessadas.Close;
                qryBenefFolhasProcessadas.Open;

                bMostraContadores := True;
                CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

                Screen.Cursor := crDefault;

                dblcAnoExercicio.Setfocus;
              Except
                On E: Exception Do
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.RollBack;
                    Screen.Cursor := crDefault;

                    cdsBenefSelecionadoIsencao.Filtered := False;
                    Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  End;
              End;
            End;
        End
      Else
        Application.MessageBox(PChar(MSG010), 'Atenção !', Mb_IconExclamation);
      // Paulo Nobre - SIG 30783 - fim
    End // COMPENSA VALOR NEGATIVO
  Else If pcEncerramentoPeriodo.ActivePage = tbsCompValNeg Then
    Begin
      If cdsBenefSelecionadoCompensa.Locate('MARCADO', 'S', []) Then
        Begin
          If Application.MessageBox('Confirma o Processo de Compensar os Valores Negativos ? ', 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
            Begin
              // Carregando o componente TStringList com os Beneficiários que estão na GRID
              CdsBeneficiariosSelecionados.AfterScroll := Nil;
              tsListaDeBeneficiarios.Clear;
              cdsBenefSelecionadoCompensa.DisableControls;
              cdsBenefSelecionadoCompensa.First;
              With cdsBenefSelecionadoCompensa Do
                Begin
                  First;
                  While Not EOF Do
                    Begin
                      tsListaDeBeneficiarios.Add(cdsBenefSelecionadoCompensa.FieldByName('NUMDOCUMENTO').asString);
                      Next;
                    End;
                  First;
                End;
              cdsBenefSelecionadoCompensa.EnableControls;
              CdsBeneficiariosSelecionados.AfterScroll := CdsBeneficiariosSelecionadosAfterScroll;
              cdsBenefSelecionadoCompensa.First;

              Try
                Screen.Cursor := crSQLWait;
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Processando Compensações...');

                qryBenefValoresACompensar.DisableControls;
                qryBenefCompMovFolhasProc.DisableControls;

                // PROCESSA MOVIMENTO DO COMPENSA
                oBUSCADIRF._ProcessarMovimentoDoCompensa(
                  dblcAnoExercicio.text,
                  cdsBenefSelecionadoCompensa,
                  qryBenefValoresACompensar,
                  qryBenefValoresACompensarPorFolha,
                  qryBenefCompMovFolhasProc,
                  tsListaDeBeneficiarios, // Lista de Beneficiários
                  ChkGeraListaBeneficiariosEncerramento.checked,
                  gProgresso);

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                frmAguarde.pbAguarde.Visible := True;
                frmAguarde.Apaga;

                cdsBenefSelecionadoCompensa.DisableControls;
                cdsBenefSelecionadoCompensa.Close;
                cdsBenefSelecionadoCompensa.Data := oBUSCADIRF._AvaliarOcorrDeBenefValoresNegativosACompensar(
                  dblcAnoExercicio.Text,
                  tsListaDeBeneficiarios, // Lista de Beneficiários
                  ChkGeraListaBeneficiariosEncerramento.checked);
                cdsBenefSelecionadoCompensa.Open;
                cdsBenefSelecionadoCompensa.EnableControls;
                dbgBenefACompensar.RefreshDisplay;

                qryBenefValoresACompensar.Close;
                qryBenefValoresACompensar.Open;
                qryBenefCompMovFolhasProc.Close;
                qryBenefCompMovFolhasProc.Open;

                qryBenefValoresACompensar.EnableControls;
                qryBenefCompMovFolhasProc.EnableControls;

                bMostraContadores := True;
                CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

                Screen.Cursor := crDefault;

                Application.MessageBox(pchar('Processo de "Compensação" Finalizado !' + #13 + #13 +
                  'Próximo passo é a Realização do Processo de Quitação !'), 'Atenção !', MB_ICONINFORMATION + MB_OK);

                dblcAnoExercicio.Setfocus;
              Except
                On E: Exception Do
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.RollBack;
                    Screen.Cursor := crDefault;

                    frmAguarde.pbAguarde.Visible := True;
                    frmAguarde.Apaga;

                    Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  End;
              End;
            End;
        End
      Else
        Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
    End // QUITAÇÃO
  Else If pcEncerramentoPeriodo.ActivePage = tbsQuitacao Then
    Begin
      If cdsBenefSelecionadoQuitacao.Locate('MARCADO', 'S', []) Then
        Begin
          If Application.MessageBox(pchar('Este processo só deve ser rodado após o Encerramento do Exercício.' + #13 +
            'Verifique se foi realizada a Avaliação das Isenções Retroativas  e' + #13 +
            'a Compensação dos Valores Negativos. Caso estes procedimentos  não' + #13 +
            'tenham ocorrido, favor não prosseguir com a Quitação !' + #13 + #13 +
            'Confirma o Processo de Quitação p/ os Beneficiários selecionados ? '), 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
            Begin
              Try
                Screen.Cursor := crSQLWait;
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                frmAguarde.pbAguarde.Visible := false;
                frmAguarde.Mostra('Processando Quitações selecionadas');
                //
                // PROCESSAMENTO DA QUITAÇÃO
                //
                // Paulo Nobre SOL 268775 PPM 1268748
                oBUSCADIRF._ProcessarMovimentoDaQUITACAO(cdsBenefSelecionadoQuitacao, gProgresso);
                //
                //
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                // Atualizando o movimento das quitações
                cdsBenefSelecionadoQuitacao.DisableControls;
                cdsBenefSelecionadoQuitacao.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoQUITACAO(
                  dblcAnoExercicio.text,
                  tsListaDeBeneficiarios, // Lista de Beneficiários
                  ChkGeraListaBeneficiariosEncerramento.checked);

                cdsBenefSelecionadoQuitacao.EnableControls;

                cdsBenefSelecionadoQuitacao.First;
                dbgMovQuitacao.RefreshDisplay;

                bMostraContadores := True;
                CdsBeneficiariosSelecionadosAfterScroll(CdsBeneficiariosSelecionados);

                Screen.Cursor := crDefault;

                frmAguarde.pbAguarde.Visible := True;
                frmAguarde.Apaga;

                Application.MessageBox(pchar('Processo de "Quitação" Finalizado !'), 'Atenção !', MB_ICONINFORMATION + MB_OK);

                dblcAnoExercicio.Setfocus;
              Except
                On E: Exception Do
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.RollBack;
                    Screen.Cursor := crDefault;

                    frmAguarde.pbAguarde.Visible := True;
                    frmAguarde.Apaga;

                    Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  End;
              End;
            End;
        End
      Else
        Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton4Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsBenefSelecionadoIsencao.isEmpty Then
    Begin
      qeBenefSelecionadoIsencao.FileName := DirLogBusca + '\MOVBENEF_ISENCAORETRO.xls';
      qeBenefSelecionadoIsencao.Execute;
      cdsBenefSelecionadoIsencao.First;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dblcAnoExercicioChange(Sender: TObject);
Begin
  Inherited;
  If pcEncerramentoPeriodo.ActivePage = tbsAvaliaIsencao Then
    Begin
      Screen.Cursor := crSQLWait;
      qryFolhasExercicioISENCAO.Close;
      qryFolhasExercicioISENCAO.Parambyname('pAnoExercicio').asString := dblcAnoExercicio.text;
      qryFolhasExercicioISENCAO.Open;
      Screen.Cursor := crDefault;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgBenefIsencaoDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If Not cdsBenefSelecionadoIsencao.isEmpty Then
    Begin
      If (Field.Name = 'cdsBenefSelecionadoIsencaoDTINIMOLGRAVE_ATUAL') Or
        (Field.Name = 'cdsBenefSelecionadoIsencaoDTFIMMOLGRAVE_ATUAL') Then
        Begin
          dbgBenefIsencao.Canvas.Font.Style := [fsbold];
          dbgBenefIsencao.Canvas.Font.color := clRed;
        End;

      dbgBenefIsencao.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.pcEncerramentoPeriodoChange(Sender: TObject);
Begin
  Inherited;
  ChkGeraListaBeneficiariosEncerramento.visible := False;
  spbDesfazerProcsEncerramento.Enabled := True;
  If pcEncerramentoPeriodo.ActivePage = tbsAvaliaIsencao Then
    Begin
      spbDesfazerProcsEncerramento.Enabled := False;
      tbsAvaliaIsencao.Highlighted := True;
      tbsCompValNeg.Highlighted := False;
      tbsQuitacao.Highlighted := False;
      spbSelecionarBeneficiarios.Caption := '&Avaliar Isenções Retroativas';
      spbSelecionarBeneficiarios.Hint := 'Avaliar a existência de Beneficiários que tiveram Isenções Retroativas';
      spbProcessarSelecoes.Caption := '&Processar Isenções';
      spbProcessarSelecoes.Hint := 'Refazer as Folhas conforme as novas Datas de Isenção';
    End
  Else If pcEncerramentoPeriodo.ActivePage = tbsCompValNeg Then
    Begin
      tbsAvaliaIsencao.Highlighted := False;
      tbsCompValNeg.Highlighted := True;
      tbsQuitacao.Highlighted := False;
      ChkGeraListaBeneficiariosEncerramento.visible := True;
      spbSelecionarBeneficiarios.Caption := '&Selecionar Beneficiários';
      spbSelecionarBeneficiarios.Hint := 'Selecionar os Beneficiários para Compensar Valores Negativos';
      spbProcessarSelecoes.Caption := '&Processar Compensa';
      spbProcessarSelecoes.Hint := 'Executar o Processamento de Compensar Valores Negativos';
    End
  Else If pcEncerramentoPeriodo.ActivePage = tbsQuitacao Then
    Begin
      tbsAvaliaIsencao.Highlighted := False;
      tbsCompValNeg.Highlighted := False;
      tbsQuitacao.Highlighted := True;
      ChkGeraListaBeneficiariosEncerramento.visible := True;
      spbSelecionarBeneficiarios.Caption := '&Selecionar Beneficiários';
      spbSelecionarBeneficiarios.Hint := 'Selecionar os Beneficiários para a Quitação';
      spbProcessarSelecoes.Caption := '&Processar Quitaçao';
      spbProcessarSelecoes.Hint := 'Executar o Processamento da Quitação';
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton5Click(Sender: TObject);
Begin
  Inherited;
  pcProcessaBusca.ActivePage := tbsEncPeriodo;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton7Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsBenefSelecionadoCompensa.isEmpty Then
    Begin
      qeBenefSelecionadoCompensa.FileName := DirLogBusca + '\MOVBENEF_COMPENSA.xls';
      qeBenefSelecionadoCompensa.Execute;
      cdsBenefSelecionadoCompensa.First;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton8Click(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsBenefSelecionadoCompensa.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Beneficiários...', True, False, True, 0, cdsBenefSelecionadoCompensa.RecordCount);
      cdsBenefSelecionadoCompensa.DisableControls;
      cdsBenefSelecionadoCompensa.First;
      While Not cdsBenefSelecionadoCompensa.Eof Do
        Begin
          cdsBenefSelecionadoCompensa.Edit;
          cdsBenefSelecionadoCompensa.FieldByName('MARCADO').AsString := 'S';

          cdsBenefSelecionadoCompensa.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      cdsBenefSelecionadoCompensa.First;
      cdsBenefSelecionadoCompensa.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton9Click(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsBenefSelecionadoCompensa.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Beneficiários...', True, False, True, 0, cdsBenefSelecionadoCompensa.RecordCount);
      cdsBenefSelecionadoCompensa.DisableControls;
      cdsBenefSelecionadoCompensa.First;
      While Not cdsBenefSelecionadoCompensa.Eof Do
        Begin
          cdsBenefSelecionadoCompensa.Edit;
          If cdsBenefSelecionadoCompensa.FieldByName('MARCADO').AsString = 'S' Then
            cdsBenefSelecionadoCompensa.FieldByName('MARCADO').AsString := 'N'
          Else
            cdsBenefSelecionadoCompensa.FieldByName('MARCADO').AsString := 'S';

          cdsBenefSelecionadoCompensa.Next;
          oBUSCADIRF.AtualizaFrmProgresso(iContador);
        End;
      cdsBenefSelecionadoCompensa.First;
      cdsBenefSelecionadoCompensa.EnableControls;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.cdsBenefSelecionadoCompensaAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  If (Not cdsBenefSelecionadoCompensa.isEmpty) Then
    Begin
      meQtd3.Caption := Format('%.2d / %.2d', [cdsBenefSelecionadoCompensa.RecNo, cdsBenefSelecionadoCompensa.RecordCount]);
      mePerc3.Caption := floattostrf(((cdsBenefSelecionadoCompensa.RecNo / cdsBenefSelecionadoCompensa.RecordCount) * 100), ffnumber, 5, 2) + ' % ';
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgCompValoresCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
  // faz com que as linhas da grid tenham cores alternadas
  If State <> [gdSelected] Then
    Begin
      If Not Highlight Then
        Begin
          // linhas ímpares = Cinza, linhas pares = branco
          If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
            ABrush.Color := CorDaZebra
          Else
            ABrush.Color := clWhite;
        End;
    End
  Else
    Begin
      ABrush.Color := clHighLight;
      AFont.Color := clHighLightText;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgCompValoresDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If Not qryBenefValoresACompensar.isEmpty Then
    Begin
      If Field.Name = 'qryBenefSelCompensaValoresIDHSTFOLHABENEF' Then
        dbgCompValores.Canvas.Font.Style := [fsbold];

      If qryBenefValoresACompensar.fieldbyname('FLGLANC_COMPENSABUSCA').asString = 'S' Then
        dbgCompValores.Canvas.Font.Color := clMaroon;

      dbgCompValores.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgCompMovFolhasDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If Not qryBenefCompMovFolhasProc.isEmpty Then
    Begin
      If Field.Name = 'qryBenefCompMovFolhasProcIDHSTFOLHABENEF' Then
        dbgCompMovFolhas.Canvas.Font.Style := [fsbold];

      If qryBenefCompMovFolhasProc.fieldbyname('FLGLANC_COMPENSABUSCA').asString = 'S' Then
        dbgCompMovFolhas.Canvas.Font.Color := clMaroon;

      dbgCompMovFolhas.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbApagaFolhaSelClick(Sender: TObject);
Begin
  Inherited;
  _ApagarFolhasSelecionadasGrid(CdsBeneficiariosSelecionados.fieldbyname('IDHSTFOLHABENEF').asInteger);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios._ApagarFolhasSelecionadasGrid(pVersaoFolhaMov: Integer);
Var sMsg: String;
Begin
  If pVersaoFolhaMov <> -1 Then
    sMsg := 'Deseja Apagar a Folha Selecionada na Grid ?'
  Else
    sMsg := 'Deseja Apagar Todas as Folhas Selecionada na Grid ?';

  If Application.MessageBox(pchar(sMsg), 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
    Begin
      Screen.Cursor := crSQLWait;

      // Apagando todo o movimento da folha selecionada na Grid
      _ApagaConteudoDaTabDeTrabalho(pVersaoFolhaMov);

      // Selecionando os Beneficiários para a BUSCA
      CdsBeneficiariosSelecionados.Close;
      CdsBeneficiariosSelecionados.Data := oBUSCADIRF._SelecionarBeneficiariosProcessamentoBUSCA(-1);

      _ApresentaMovBeneficiariosProcessamentoBUSCA(-1);

      cdsConsultaMovBenef.Data := oBUSCADIRF._ConsultaMovimentoDoBeneficiario(
        CdsBeneficiariosSelecionados.FieldByName('CPFRESP').AsString,
        dedDataIni.date,
        dedDataFim.date,
        pVersaoFolhaMov,
        chkApresentaMovAnual.Checked);
      tbsConsultaMov.Highlighted := Not cdsConsultaMovBenef.IsEmpty;

      dblcVersaoFolha.SetFocus;
      dblcVersaoFolha.Selected;

      Screen.Cursor := crDefault;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton6Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsBenefSelecionadoQuitacao.isEmpty Then
    Begin
      qeBenefSelecionadoQuitacao.FileName := DirLogBusca + '\MOVBENEF_QUITACAO.xls';
      qeBenefSelecionadoQuitacao.Execute;
      cdsBenefSelecionadoQuitacao.First;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.SpeedButton10Click(Sender: TObject);
Begin
  Inherited;
  If Not qryBenefCompMovFolhasProc.isEmpty Then
    Begin
      qeBenefCompMovFolhasProc.FileName := DirLogBusca + '\BENEF_MOVCOMPENSAFOLHA.xls';
      qeBenefCompMovFolhasProc.Execute;
      qryBenefCompMovFolhasProc.First;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.dbgBenefACompensarDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not cdsBenefSelecionadoCompensa.isEmpty Then
    Begin
      If Field.Name = 'cdsBenefSelecionadoCompensaTEM_COMPENSA' Then
        Begin
          dbgMovQuitacao.Canvas.Font.Style := [fsbold];
          If cdsBenefSelecionadoCompensa.fieldbyname('TEM_COMPENSA').asString = 'Não' Then
            dbgBenefACompensar.Canvas.Font.Color := clRed
          Else
            dbgBenefACompensar.Canvas.Font.Color := clGreen;

          dbgBenefACompensar.DefaultDrawDataCell(Rect, Field, State);
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.CdsBeneficiariosSelecionadosAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  If bMostraContadores = True Then
    meQtd.Caption := Format('%.2d / %.2d', [CdsBeneficiariosSelecionados.RecNo, CdsBeneficiariosSelecionados.RecordCount]);

  If (Not CdsBeneficiariosSelecionados.isEmpty) Then
    Begin
      cdsConsultaMovBenef.DisableControls;
      cdsConsultaMovBenef.Data := oBUSCADIRF._ConsultaMovimentoDoBeneficiario(
        CdsBeneficiariosSelecionados.FieldByName('CPFRESP').AsString,
        dedDataIni.date,
        dedDataFim.date,
        CdsBeneficiariosSelecionados.FieldByName('IDHSTFOLHABENEF').AsInteger,
        chkApresentaMovAnual.Checked);
      cdsConsultaMovBenef.EnableControls;

      dbgConsultaMov.ColumnByName('VLRLANC').FooterValue := '0,00';
      dbgConsultaMov.ColumnByName('VLRIRRF').FooterValue := '0,00';
      If cdsConsultaMovBenef.Filtered Then
        dbgConsultaMov.ColumnByName('VLRLANC').FooterValue := TotalizaColunaGridMov('VLRLANC', 2);

      dbgConsultaMov.ColumnByName('VLRIRRF').FooterValue := TotalizaColunaGridMov('VLRIRRF', 2);
      dbgConsultaMov.ColumnByName('QTDMESES').FooterValue := TotalizaColunaGridMov('QTDMESES', 0);

      tbsConsultaMov.Highlighted := Not cdsConsultaMovBenef.IsEmpty;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbLocalizarArqClick(Sender: TObject);
Begin
  Inherited;
  // Paulo Nobre SOL 268054 PPM 1245481
  If OpenDialog1.Execute Then
    Begin
      If FileExists(OpenDialog1.FileName) Then
        Begin
          With TStringList.Create Do
            Begin
              LoadFromFile(OpenDialog1.FileName);
              // Paulo Nobre SOL 269633 PPM 1337929
              lbCPFBeneficiarios.Items.Text := oBUSCADIRF._Tiramascara(Trim(Text));
              stListaCPFExt.caption := inttostr(lbCPFBeneficiarios.Items.Count);
              SaveToFile(DirLogBusca + '\ListaExternaBeneficiarios.Txt');
              Clear;
              Free;

              _AjustaLabelListasInternaExterna;

            End;
        End;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.rdgSelTipoListaClick(Sender: TObject);
Begin
  Inherited;
  If rdgSelTipoLista.ItemIndex = 0 Then
    Begin
      pnlListaArquivo.Visible := False;
      frmFrameListaBenef1.Visible := True;
    End
  Else
    Begin
      frmFrameListaBenef1.Visible := False;
      pnlListaArquivo.Visible := True;
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.btnLimparClick(Sender: TObject);
Begin
  Inherited;
  lbCPFBeneficiarios.Clear;
  stListaCPFExt.caption := inttostr(lbCPFBeneficiarios.Items.Count);
  _AjustaLabelListasInternaExterna;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.lbCPFBeneficiariosDblClick(Sender: TObject);
Begin
  Inherited;
  lbCPFBeneficiarios.Items.Delete(lbCPFBeneficiarios.ItemIndex);
  stListaCPFExt.caption := inttostr(lbCPFBeneficiarios.Items.Count);
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.spbInformeRendimentoPFClick(Sender: TObject);
Begin
  Inherited;
  // Paulo Nobre - SIG 21776
  If Not cdsConsultaMovBenef.isEmpty Then
    Begin
      AbrirForm(frmConfigRelatInformeMT, TfrmConfigRelatInformeMT, False);
      frmConfigRelatInformeMT.HabilitaImpressao(True);
      frmConfigRelatInformeMT.bbtnGeraTxt.Visible := False;
      //edilaine SIG134189 : inicio
      {frmConfigRelatInformeMT.CdsModelo.Filtered := False;
      frmConfigRelatInformeMT.CdsModelo.Filter := 'MODELOCARTA LIKE ''%2015%'' ';
      frmConfigRelatInformeMT.CdsModelo.Filtered := True;
      }//edilaine SIG134189 : inicio
      frmConfigRelatInformeMT.CdsModelo.First;
      frmConfigRelatInformeMT.CmbModelo.LookupValue := frmConfigRelatInformeMT.CdsModelo.fieldbyname('IDCARTACOBRANCA').asstring;
      frmConfigRelatInformeMT.rgSistema.ItemIndex := 1; // Folha de Benefícios
      frmConfigRelatInformeMT.edtData.Text := FormatDateTime('yyyy', cdsVersoesFolha.FieldByName('DATAPREVPAGTO').AsDateTime);
      frmConfigRelatInformeMT.meCPF.Text := CdsBeneficiariosSelecionados.FieldByName('CPFRESP').AsString;
      frmConfigRelatInformeMT.edtNome.Text := 'USUARIO TESTE';
      frmConfigRelatInformeMT.dtdtData.Date := Date;
      //frmConfigRelatInformeMT.BtnImprimeClick(self); //edilaine SIG134189
    End;
End;

Procedure TfrmBUSCA_DIRFFolhaBeneficios.cdsBenefSelecionadoIsencaoAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  // Paulo Nobre - SIG 30783
  If (Not cdsBenefSelecionadoIsencao.isEmpty) Then
    meQtd4.Caption := Format('%.2d / %.2d', [cdsBenefSelecionadoIsencao.RecNo, cdsBenefSelecionadoIsencao.RecordCount]);
End;

End.

