//******************************************************************************
//Rotina                : SpeedButton3Click
//N. SIG                : 89051
//Data da Alteração:    : 19/07/2019
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Taffarel Sevaybriker
//Descrição             : Erro ao fechar caixa de diálogo do componente qeMovPrepDARF
//******************************************************************************
//Rotina                : spbGravarMovDarfClick
//N. SIG                : 79320
//Data da Alteração:    : 05/12/2018
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Everson Luiz Pereira da Cunha
//Descrição             : Carregar novamente o grid dbgMovDARF após ter gravado
//******************************************************************************
//Rotina                : Geral
//N. SIG                : 50508
//Data da Alteração:    : 11/09/2018
//Alteração Form:       : frmPrepararDARFFolBenef(dfm)
//Responsável:          : Fabio Sampaio
//Descrição             : Ajustado campo de período de cobrança para período de
//                        pagamento;
//******************************************************************************
//Rotina                : Geral
//N. SIG                : 50508
//Data da Alteração:    : 23/05/2018
//Alteração Form:       : frmPrepararDARFFolBenef(dfm)
//Responsável:          : Taffarel Sevaybriker
//Descrição             : Retirado campo de Mês Ref. do grid e filtro de Referência da tela.
//                        Ajustados campos de período de cobrança para buscar a data do combo
//                        de mês de referência.  
//*******************************************************************************
//Rotina                : spbGravarMovDarfClick
//Alteração Form:       : cdsMovSelDARF
//N. SIG                : 61511
//Data da Alteração:    : 15/01/2018
//Responsável:          : Edilaine
//Descrição             : Ajuste campos Plano e IdPlanoPrev gravados na estrutura IRRFFOLHABENEF
//*******************************************************************************
//Rotina                : Geral
//N. SIG                : 47588
//Data da Alteração:    : 06/06/2017
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Paulo Nobre / correção - William Santana
//Descrição             : NOVO - Inclusao das rotinas do Lançamento Manual do IRRF
//*******************************************************************************
//Rotina                : Geral
//N. SIG                : 34742
//Data da Alteração:    : 06/12/2016
//Alteração Form:       : frmPrepararDARFFolBenef
//Responsável:          : Paulo Nobre
//Descrição             : Nova Funcionalidade
//*******************************************************************************
Unit FPrepararDARFFolBenef;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, wwdblook, ExtCtrls, wwdbdatetimepicker, uCmMath,
  CMDateTimePicker, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, Db, DBClient, uCMClientDataSet, FileCtrl, TEdNum,
  ComCtrls, MontaSelect, DBTables, DBCtrls, uCmSqlParams,
  QExport3Dialog, Grids, Wwdbigrd, Wwdbgrid, Wwintl, ImgList, wwDialog,
  Wwlocate, wwSpeedButton, wwDBNavigator, Mask, uDiasUteis,
  wwdbedit, ppBands, ppPrnabl, ppClass, ppCtrls, ppDB, ppDBPipe, ppDBBDE,
  ppParameter, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  CMProcura, TREdit, jpeg, ppVar, Wwquery, QExport3,
  TXComp, TXRB, Wwfltdlg, wwidlg, Menus, wwclearpanel, Wwdatsrc, Wwdbdlg,
  wwriched, DBGrids, ppStrtch, ppRichTx, ppMemo, ppModule, Gauges, TB97Ctls,
  uCtrlModuloIRRF, CMProcuraSubTipo, CmParamReport,
  uFuncoesUteisIR, uCtrlFuncoesRH, uCtrlPrepararDARFFolBenef, raCodMod;

Const CorDaZebra = clBtnFace; // $00FDD2D0
Const iClientHeight = 600; // Altura padrão do Form
Const iClientWidth = 1209; // Largura padrão do Form
Const iTop = 90;

  // Mensagens Gerais
Const MSG001 = 'Obrigatório preencher a Natureza do Rendimento !';
Const MSG002 = 'Selecione uma Versão da Folha !';
Const MSG003 = 'Ano de Referência não pode ser MENOR que o Ano de Cobrança !';
Const MSG004 = 'Mês de Referência não pode ser MENOR que o Mês de Cobrança !';
Const MSG005 = 'Mês de Referência só pode ser 01 mês anterior ao Mês de Cobrança !';
Const MSG006 = 'Não localizado Movimento para os critérios Selecionados !';
Const MSG007 = 'Não há Lançamento(s) Marcado(s) !';
Const MSG008 = 'Movimento Selecionado Gravado com sucesso !';
Const MSG009 = 'Lançamento possui DARF Gerado !';
Const MSG010 = 'Foi(ram) encontrado(s) Lançamento(s) com DARF gerado !';
Const MSG011 = 'Obrigatório preencher a Data Inicial'; //  <OK>
Const MSG012 = 'Obrigatório preencher a Data Final'; //  <OK>
Const MSG013 = 'Data Inicial não pode ser superior a Data Final'; // <OK>
  // Paulo Nobre - SIG 47588 - Inicio
Const MSG014 = 'Confirma Exclusão deste Lançamento ?';
Const MSG015 = 'Sem Movimento para esta Operação';
Const MSG016 = 'Obrigatório preencher o Nome do Beneficiário';
Const MSG017 = 'Obrigatório preencher o Plano Previdenciário';
Const MSG018 = 'Obrigatório preencher a Patrocinadora';
Const MSG019 = 'Não existe relacionamento entre o Plano e a Patrocinadora';
Const MSG020 = 'Obrigatório informar o Valor Base';
Const MSG021 = 'Obrigatório informar o Valor do IRRF';
Const MSG022 = 'Valor do IRRF não pode ser Maior ou Igual ao Valor Base';
Const MSG023 = 'Lançamento não pode ser usado como Base de Referência por possuir DARF Gerado !';
Const MSG024 = 'O Lançamento não foi salvo ! Abandona ?';
  // Paulo Nobre - SIG 47588 - Fim

Type

  TfrmPrepararDARFFolBenef = Class(TfrmSairAjuda)
    pcMovDARF: TPageControl;
    tbsSelMovDARF: TTabSheet;
    tbsPrepMovDARF: TTabSheet;
    ListaDeImagens: TImageList;
    DevRptCM: TExtraOptions;
    LMovSelDARF: TwwLocateDialog;
    qeMovSelDARF: TQExport3Dialog;
    dsMovSelDARF: TwwDataSource;
    Panel1: TPanel;
    dsMovPrepDARF: TwwDataSource;
    SqlMovPrepDARF: TCMSqlParams;
    wwIntl_Port: TwwIntl;
    LMovPrepDARF: TwwLocateDialog;
    qryAux1: TwwQuery;
    SpeedButton4: TSpeedButton;
    Panel9: TPanel;
    spbGravarMovDarf: TSpeedButton;
    Panel5: TPanel;
    spbExpBenefSel: TSpeedButton;
    spbMarcaTodos: TSpeedButton;
    spbInverterSel: TSpeedButton;
    spbCalc: TSpeedButton;
    stQtd1: TStaticText;
    wwDBNavigator4: TwwDBNavigator;
    btnavLocalizarBenef: TwwNavButton;
    wwNavButton6: TwwNavButton;
    wwNavButton7: TwwNavButton;
    wwNavButton8: TwwNavButton;
    wwNavButton9: TwwNavButton;
    spbSelDarf: TSpeedButton;
    cdsVersoesFolha: TCMClientDataSet;
    cdsVersoesFolhaHISTORICO: TStringField;
    cdsVersoesFolhaMESREFERENCIA: TStringField;
    cdsVersoesFolhaDATAPREVPAGTO: TDateTimeField;
    cdsVersoesFolhaIDHSTFOLHABENEF: TFloatField;
    cdsVersoesFolhaORDEM: TFloatField;
    SQLVersoesFolha: TCMSqlParams;
    dsVersoesFolha: TDataSource;
    cdsNaturRendimento: TCMClientDataSet;
    cdsNaturRendimentoDESCRICAO: TStringField;
    cdsNaturRendimentoCODNATUREZA: TStringField;
    SQLNaturRendimento: TCMSqlParams;
    MSBeneficiario: TMontaSelect;
    cdsMovSelDARF: TCMClientDataSet;
    SQLMovSelDARF: TCMSqlParams;
    dbgMovDARF: TwwDBGrid;
    cdsMovSelDARFMARCADO: TStringField;
    cdsMovSelDARFIDHSTFOLHABENEF: TFloatField;
    cdsMovSelDARFIDRESPONSAVEL: TFloatField;
    cdsMovSelDARFMESCOBRANCA: TStringField;
    cdsMovSelDARFMES: TStringField;
    cdsMovSelDARFIDPESSOA: TFloatField;
    cdsMovSelDARFIDPESSJUR: TFloatField;
    cdsMovSelDARFNOME: TStringField;
    cdsMovSelDARFCODIRRFDARF: TStringField;
    cdsMovSelDARFDATAPAGAMENTO: TDateTimeField;
    cdsMovSelDARFCODPROVDESC: TStringField;
    cdsMovSelDARFIDMOTIVO: TFloatField;
    cdsMovSelDARFVALORPROVENTO: TFloatField;
    cdsMovSelDARFVALORINFO: TFloatField;
    cdsMovSelDARFIDINFORME: TFloatField;
    cdsMovSelDARFFONTEPAGADORA: TFloatField;
    cdsMovSelDARFFLGTIPODESC: TStringField;
    cdsMovSelDARFIDPLANOCONTABIL: TFloatField;
    cdsMovSelDARFIDPATRO: TFloatField;
    cdsMovSelDARFDESCRICAO: TStringField;
    cdsMovSelDARFDESCPROVENTO: TStringField;
    cdsMovSelDARFCODTIPRECDES: TStringField;
    cdsMovSelDARFIDPLANOPREV: TFloatField;
    cdsMovSelDARFPLACONTAC: TStringField;
    cdsMovSelDARFNOMEPATRO: TStringField;
    cdsMovSelDARFCODCENTROCUSTO: TStringField;
    cdsMovSelDARFIDPROGRAMA: TFloatField;
    cdsMovSelDARFNOMEPLANO: TStringField;
    cdsMovSelDARFCODCENTRORESPON: TStringField;
    qryFLGRegExcluido: TQuery;
    cdsMovSelDARFNUMDOCUMENTO: TStringField;
    cdsMovSelDARFPLANO: TFloatField;               //edilaine - SIG61511
    pnlCritSel: TPanel;
    grpDataProc: TGroupBox;
    gbxVersaoFol: TGroupBox;
    gbNatureza: TGroupBox;
    dblcNatRendimento: TwwDBLookupCombo;
    rdgTipo: TRadioGroup;
    gbPeriodosCobRef: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image2: TImage;
    Image1: TImage;
    edAnoCob: TEdit;
    UpDown1: TUpDown;
    cbMesCob: TComboBox;
    edAnoRef: TEdit;
    UpDown2: TUpDown;
    cbMesRef: TComboBox;
    Panel2: TPanel;
    Panel4: TPanel;
    spbExcluirMovPrepDARF: TSpeedButton;
    spbSelMovGravado: TSpeedButton;
    Panel6: TPanel;
    spbIndisponibiliza: TSpeedButton;
    SpeedButton3: TSpeedButton;
    spbDisponibiliza: TSpeedButton;
    stQtd2: TStaticText;
    dbgPrepMovDARF: TwwDBGrid;
    wwDBNavigator1: TwwDBNavigator;
    wwNavButton1: TwwNavButton;
    wwNavButton2: TwwNavButton;
    wwNavButton3: TwwNavButton;
    wwNavButton4: TwwNavButton;
    wwNavButton5: TwwNavButton;
    FitrarMovPrepDARF: TwwFilterDialog;
    cdsMovPrepDARF: TCMClientDataSet;
    cdsMovPrepDARFIDLANCIRRFFOLHABENEF: TFloatField;
    cdsMovPrepDARFIDHSTFOLHABENEF: TFloatField;
    cdsMovPrepDARFNUMDOCUMENTO: TStringField;
    cdsMovPrepDARFIDPESSOA: TFloatField;
    cdsMovPrepDARFNOME: TStringField;
    cdsMovPrepDARFCODNATUREZA: TStringField;
    cdsMovPrepDARFIDPATRO: TFloatField;
    cdsMovPrepDARFIDPLANOPREV: TFloatField;
    cdsMovPrepDARFIDMOTIVO: TFloatField;
    cdsMovPrepDARFIDINFORME: TFloatField;
    cdsMovPrepDARFIDDARF: TFloatField;
    cdsMovPrepDARFCODTIPRECDES: TStringField;
    cdsMovPrepDARFCODPROVDESC: TStringField;
    cdsMovPrepDARFFONTEPAGADORA: TFloatField;
    cdsMovPrepDARFPLANO: TFloatField;                
    cdsMovPrepDARFPLACONTA: TStringField;
    cdsMovPrepDARFMESCOBRANCA: TStringField;
    cdsMovPrepDARFMESREFERENCIA: TStringField;
    cdsMovPrepDARFDATAPAGAMENTO: TDateTimeField;
    cdsMovPrepDARFDATAVENCIMENTO: TDateTimeField;
    cdsMovPrepDARFVLRIMPOSTO: TFloatField;
    cdsMovPrepDARFVLRBASE: TFloatField;
    cdsMovPrepDARFFLGREGEXCLUIDO: TStringField;
    cdsMovPrepDARFFLGTIPOFOLHA: TStringField;
    cdsMovPrepDARFIDPROGRAMA: TFloatField;
    cdsMovPrepDARFCODCENTROCUSTO: TStringField;
    cdsMovPrepDARFCODCENTRORESPON: TStringField;
    cdsMovPrepDARFNOMEPLANO: TStringField;
    cdsMovPrepDARFNOMEPATRO: TStringField;
    gbPeriodoCob: TGroupBox;
    lblDataInicial: TLabel;
    Label6: TLabel;
    deDataFim: TCMDateTimePicker;
    deDataIni: TCMDateTimePicker;
    gbBenefi: TGroupBox;
    Label3: TLabel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label9: TLabel;
    meCPFBenef: TMaskEdit;
    edNomeBenef: TEdit;
    spbGeradorDARF: TSpeedButton;
    dblcVersaoFolha: TwwDBLookupCombo;
    cdsNaturRendimentoDESCRICAOCOMPL: TStringField;
    cdsMovSelDARFIDPROCJUD: TFloatField;
    cdsMovPrepDARFIDPROCJUD: TFloatField;
    cdsMovPrepDARFCODDOCUMENTO: TFloatField;
    cdsMovPrepDARFFLGTIPOINCLUSAO: TStringField;
    tbsLancManual: TTabSheet;
    Panel3: TPanel;
    Dock974: TDock97;
    lblTitDet: TLabel;
    Toolbar974: TToolbar97;
    btnInc1: TToolbarButton97;
    btnAlt1: TToolbarButton97;
    btnExc1: TToolbarButton97;
    ImageList1: TImageList;
    dbgLancManual: TwwDBGrid;
    pnlDadosLM: TPanel;
    Label10: TLabel;
    dbeValorBase: TDBRealEdit;
    Dock973: TDock97;
    tb97Detalhe: TToolbar97;
    btnCon1: TBitBtn;
    btnCan1: TBitBtn;
    qryLancManual: TwwQuery;
    dsLancManual: TwwDataSource;
    updLancManual: TUpdateSQL;
    qryLancManualIDLANCIRRFFOLHABENEF: TFloatField;
    qryLancManualIDHSTFOLHABENEF: TFloatField;
    qryLancManualNUMDOCUMENTO: TStringField;
    qryLancManualIDPESSOA: TFloatField;
    qryLancManualNOME: TStringField;
    qryLancManualCODNATUREZA: TStringField;
    qryLancManualIDPATRO: TFloatField;
    qryLancManualIDPLANOPREV: TFloatField;
    qryLancManualIDMOTIVO: TFloatField;
    qryLancManualIDINFORME: TFloatField;
    qryLancManualIDDARF: TFloatField;
    qryLancManualCODDOCUMENTO: TFloatField;
    qryLancManualIDPROCJUD: TFloatField;
    qryLancManualCODTIPRECDES: TStringField;
    qryLancManualCODPROVDESC: TStringField;
    qryLancManualFONTEPAGADORA: TFloatField;
    qryLancManualPLANO: TFloatField;
    qryLancManualPLACONTA: TStringField;
    qryLancManualMESCOBRANCA: TStringField;
    qryLancManualMESREFERENCIA: TStringField;
    qryLancManualDATAPAGAMENTO: TDateTimeField;
    qryLancManualDATAVENCIMENTO: TDateTimeField;
    qryLancManualVLRIMPOSTO: TFloatField;
    qryLancManualVLRBASE: TFloatField;
    qryLancManualFLGREGEXCLUIDO: TStringField;
    qryLancManualFLGTIPOFOLHA: TStringField;
    qryLancManualIDPROGRAMA: TFloatField;
    qryLancManualCODCENTROCUSTO: TStringField;
    qryLancManualCODCENTRORESPON: TStringField;
    qryLancManualFLGTIPOINCLUSAO: TStringField;
    qryLancManualNOMEPLANO: TStringField;
    qryLancManualNOMEPATRO: TStringField;
    lblPatroC: TLabel;
    lblPlanoPrevC: TLabel;
    dblcPatro: TwwDBLookupCombo;
    dblcPlanoPrev: TwwDBLookupCombo;
    Label16: TLabel;
    dbeValorIRRF: TDBRealEdit;
    Panel18: TPanel;
    dbgBaseLanc: TwwDBGrid;
    cdsLookPatro: TCMClientDataSet;
    cdsLookPlanoPrev: TCMClientDataSet;
    CmpFunc: TGroupBox;
    CMPessoa: TCMProcura;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    qeMovPrepDARF: TQExport3Dialog;
    Procedure FormShow(Sender: TObject);
    Procedure spbSelDarfClick(Sender: TObject);
    Procedure spbCalcClick(Sender: TObject);
    Procedure cdsMovSelDARFAfterScroll(DataSet: TDataSet);
    Procedure dbgMovDARFCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
    Procedure spbInverterSelClick(Sender: TObject);
    Procedure spbMarcaTodosClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure spbExpBenefSelClick(Sender: TObject);
    Procedure spbGravarMovDarfClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure rdgTipoClick(Sender: TObject);
    Procedure cbMesCobChange(Sender: TObject);
    Procedure edAnoCobChange(Sender: TObject);
    Procedure SpeedButton9Click(Sender: TObject);
    Procedure SpeedButton8Click(Sender: TObject);
    Procedure spbIndisponibilizaClick(Sender: TObject);
    Procedure cdsMovPrepDARFAfterScroll(DataSet: TDataSet);
    Procedure spbExcluirMovPrepDARFClick(Sender: TObject);
    Procedure dbgMovDARFFieldChanged(Sender: TObject; Field: TField);
    Procedure dbgPrepMovDARFDrawDataCell(Sender: TObject;
      Const Rect: TRect; Field: TField; State: TGridDrawState);
    Procedure dbgPrepMovDARFFieldChanged(Sender: TObject; Field: TField);
    Procedure SpeedButton3Click(Sender: TObject);
    Procedure spbSelMovGravadoClick(Sender: TObject);
    Procedure pcMovDARFChange(Sender: TObject);
    Procedure deDataIniChange(Sender: TObject);
    Procedure dblcNatRendimentoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure spbGeradorDARFClick(Sender: TObject);
    //Procedure deDataFimChange(Sender: TObject); //Taffarel - SIG50508
    Procedure btnInc1Click(Sender: TObject);
    Procedure btnCan1Click(Sender: TObject);
    Procedure btnCon1Click(Sender: TObject);
    Procedure btnExc1Click(Sender: TObject);
    Procedure pcMovDARFChanging(Sender: TObject; Var AllowChange: Boolean);
    Procedure btnAlt1Click(Sender: TObject);
    Procedure CMPessoaValidaDados(Sender: TObject);
    Procedure dbgBaseLancDrawDataCell(Sender: TObject; Const Rect: TRect;
      Field: TField; State: TGridDrawState);
    Procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    procedure dblcVersaoFolhaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  Private
    { Private declarations }
    ModuloIRRF: TCtrlModuloIRRF;
    oDARFFolBenef: TCtrlPrepararDARFFolBenef;
    tsListaDeDocumentos: TStringList;

    Function _TotalizaColunaGridSelMovDARF: String;
    Function _TotalizaColunaGridMovPrepDARF: String;
    Function _TotalizaColunaGridMovLancManual: String;
    Function _ExisteLanComIDDARFGravado: Boolean;
    Procedure _SelecionaMovimentos(iSit: Integer);
  Public
    { Public declarations }
  End;

Var
  frmPrepararDARFFolBenef: TfrmPrepararDARFFolBenef;
  sPathArquivosLog: String;
  sPeriodoCob, sPeriodoRef: String;
  iContador: Integer;
  sAnoAtual: String;
  dDataVenc: TDateTime;
  iMes: Integer;
  // Paulo Nobre - SIG 47588 - Inicio
  iV0, iV2, iV3, iV4, iV5, iV6, iV9, iV10, iV12: Integer;
  sV1, sV7, sV8, sV11, sV13, sV14, sV15, sV16: String;
  dV17, dV18: TDateTime;
  fV19, fV20: Double;
  bManLancManual: Boolean;
  // Paulo Nobre - SIG 47588 - Fim

Implementation

Uses DBaseDados, USistema, UDatabase, uFormManager, FAguarde, FProgresso, FPreview, UMensErro, uModulo,
  FGeraDARF_Novo;

{$R *.DFM}

Procedure TfrmPrepararDARFFolBenef.FormCreate(Sender: TObject);
Begin
  Inherited;
  // Ajustando a tela para o tamanho padrão definido nas constantes
  ClientHeight := iClientHeight;
  ClientWidth := iClientWidth;
  Top := iTop;

  tsListaDeDocumentos := tStringList.create;

  ModuloIRRF := TCtrlModuloIRRF.Create;
  ModuloIRRF.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  oDARFFolBenef := TCtrlPrepararDARFFolBenef.Create;
  oDARFFolBenef.Initialize(DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType, Sistema.ConnectionSide,
    Sistema.AppRemoteServer, True, Nil, Nil, False);

  sPathArquivosLog := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogMovDARF';

  If Not DirectoryExists(sPathArquivosLog) Then
    ForceDirectories(sPathArquivosLog);

  btnCan1Click(Self); //William Santana - SIG 47588
End;

Procedure TfrmPrepararDARFFolBenef.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  FreeAndNil(ModuloIRRF);
  FreeAndNil(oDARFFolBenef);
End;

Procedure TfrmPrepararDARFFolBenef.FormShow(Sender: TObject);
Begin
  Inherited;

  // Paulo Nobre - SIG 47588 - Inicio
  bManLancManual := False;

  // Abrindo e carregando datasets
  Screen.Cursor := crSQLWait;
  SQLMovSelDARF.Open;
  SqlMovPrepDARF.Open;
  cdsNaturRendimento.data := oDARFFolBenef._ListaNatuRendimento;
  cdsVersoesFolha.data := oDARFFolBenef._ListaVersoesFolha;
  dblcVersaoFolha.LookupValue := '-1'; // Todas as versões como default
  qryLancManual.Close;
  qryLancManual.Open;
  cdsLookPlanoPrev.Data := oDARFFolBenef._ListPlanoPrev;
  cdsLookPatro.Data := oDARFFolBenef._ListPatrocinadora;
  Screen.Cursor := crDefault;

  // Inicializando defaults dos componentes
  pcMovDARF.ActivePage := tbsSelMovDARF;


  //Carregando os períodos com valores defaults
  dDataVenc := ModuloIRRF.CalcProxDiaSemana(Sistema.IdEmpresa, Date, 0, True);
  sAnoAtual := inttostr(DiasUteis.ExtraiAno(dDataVenc));
  iMes := DiasUteis.ExtraiMes(dDataVenc);

  // Macete para ajustar o itemindex do combox de forma a trazer o mes correto
  If iMes = 1 Then // janeiro
    Begin
      cbMesCob.ItemIndex := 0;
      cbMesRef.ItemIndex := 0;
    End
  Else
    Begin
      cbMesCob.ItemIndex := iMes - 1;
      cbMesRef.ItemIndex := iMes - 1;
    End;
  edAnoCob.Text := sAnoAtual;
  edAnoRef.Text := sAnoAtual;
  deDataIni.Date := strtodate('01/' + inttostr(iMes) + '/' + sAnoAtual);
  deDataFim.Date := TrazUltDiaData(deDataIni.date);
  deDataIni.Text := DateToStr(deDataIni.Date);
  deDataFim.Text := DateToStr(deDataFim.Date);
  //
  rdgTipo.itemindex := 0; // Default seleção pela versão da folha
  gbxVersaoFol.Visible := (rdgTipo.itemindex = 0);
  gbPeriodosCobRef.Visible := (rdgTipo.itemindex = 1);
  spbGravarMovDarf.Enabled := ((Not cdsMovSelDARF.isempty) And (pcMovDARF.activepage = tbsSelMovDARF));
  spbGeradorDARF.Enabled := ((Not cdsMovPrepDARF.isempty) And (pcMovDARF.activepage = tbsSelMovDARF));
  spbExcluirMovPrepDARF.Enabled := (Not cdsMovPrepDARF.isempty);
  dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := '0,00';
  dbgPrepMovDARF.ColumnByName('VLRIMPOSTO').FooterValue := '0,00';
  dbgLancManual.ColumnByName('VLRIMPOSTO').FooterValue := '0,00';
  pcMovDARF.activepage := tbsSelMovDARF;
  gbBenefi.visible := (pcMovDARF.ActivePage = tbsSelMovDARF);
  gbPeriodoCob.visible := (pcMovDARF.ActivePage = tbsPrepMovDARF);

  tbsLancManual.Highlighted := False;
  tbsLancManual.Enabled := False;

  If tbsSelMovDARF.Enabled Then
    dblcNatRendimento.Setfocus;
  // Paulo Nobre - SIG 47588 - Fim
End;

Function TfrmPrepararDARFFolBenef._TotalizaColunaGridSelMovDARF: String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  cdsMovSelDARF.AfterScroll := Nil;
  cdsMovSelDARF.DisableControls;
  cdsMovSelDARF.First;
  While Not cdsMovSelDARF.EOF Do
    Begin
      If cdsMovSelDARF.fieldByname('MARCADO').asString = 'S' Then // Sim
        If Not cdsMovSelDARF.Fieldbyname('VALORPROVENTO').isNull Then
          dTotalFiltro := dTotalFiltro + cdsMovSelDARF.Fieldbyname('VALORPROVENTO').asFloat;

      cdsMovSelDARF.Next;
    End;
  cdsMovSelDARF.AfterScroll := cdsMovSelDARFAfterScroll;
  cdsMovSelDARF.First;
  cdsMovSelDARF.enableControls;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Function TfrmPrepararDARFFolBenef._TotalizaColunaGridMovPrepDARF: String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  cdsMovPrepDARF.AfterScroll := Nil;
  cdsMovPrepDARF.DisableControls;
  cdsMovPrepDARF.First;
  While Not cdsMovPrepDARF.EOF Do
    Begin
      If (cdsMovPrepDARF.fieldByname('FLGREGEXCLUIDO').asString = 'N') Then // Não
        If Not cdsMovPrepDARF.Fieldbyname('VLRIMPOSTO').isNull Then
          dTotalFiltro := dTotalFiltro + cdsMovPrepDARF.Fieldbyname('VLRIMPOSTO').asFloat;

      cdsMovPrepDARF.Next;
    End;
  cdsMovPrepDARF.AfterScroll := cdsMovPrepDARFAfterScroll;
  cdsMovPrepDARF.First;
  cdsMovPrepDARF.enableControls;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Function TfrmPrepararDARFFolBenef._ExisteLanComIDDARFGravado: Boolean;
Begin
  Result := False;
  Screen.Cursor := crSQLWait;
  cdsMovPrepDARF.AfterScroll := Nil;
  cdsMovPrepDARF.DisableControls;
  cdsMovPrepDARF.First;
  While Not cdsMovPrepDARF.EOF Do
    Begin
      If Not cdsMovPrepDARF.fieldByname('IDDARF').isNull Then
        Result := True;

      cdsMovPrepDARF.Next;
    End;
  cdsMovPrepDARF.AfterScroll := cdsMovSelDARFAfterScroll;
  cdsMovPrepDARF.First;
  cdsMovPrepDARF.enableControls;
  Screen.Cursor := crDefault;
End;

Procedure TfrmPrepararDARFFolBenef.spbSelDarfClick(Sender: TObject);
Begin
  _SelecionaMovimentos(0); // Paulo Nobre - SIG 47588
End;

Procedure TfrmPrepararDARFFolBenef._SelecionaMovimentos(iSit: Integer);
Var iSel1: Word;
  sMsgTexto: String; // Paulo Nobre - SIG 47588
Begin
  If dblcNatRendimento.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG001, 'Atenção', mtWarning, [mbOK], 0);
      dblcNatRendimento.SetFocus;
      Exit;
    End;

  If pcMovDARF.ActivePage = tbsSelMovDARF Then // aba Selecionar Movimento dos DARF´s
    Begin
      If (rdgTipo.itemindex = 0) And ((dblcVersaoFolha.LookupValue = EmptyStr) Or (dblcVersaoFolha.LookupValue = '-1')) Then
        Begin
          MsgDlg(MSG002, 'Atenção', mtWarning, [mbOK], 0);
          dblcVersaoFolha.LookupValue := '-1'; // Todas as Forma de Pagamento como default
          dblcVersaoFolha.SetFocus;
          Exit;
        End;

        //Taffarel - SIG50508 - início
      {If strtoint(edAnoRef.text) < strtoint(edAnoCob.text) Then
        Begin
          MsgDlg(MSG003, 'Atenção', mtWarning, [mbOK], 0);
          edAnoRef.Text := edAnoCob.Text;
          edAnoRef.SetFocus;
          Exit;
        End;

      // Mes de Refencia só pode ser menor um mes do que o mes de cobranca
      If (cbMesCob.Itemindex - cbMesRef.Itemindex) > 1 Then
        Begin
          MsgDlg(MSG005, 'Atenção', mtWarning, [mbOK], 0);
          cbMesRef.ItemIndex := cbMesCob.ItemIndex;
          cbMesRef.SetFocus;
          exit;
        End;}
        //Taffarel - SIG50508 - fim

      sPeriodoCob := edAnoCob.text + '/' + oDARFFolBenef._CompletaZeroEsq(inttostr(cbMesCob.itemindex + 1), 2);
      sPeriodoRef := edAnoRef.text + '/' + oDARFFolBenef._CompletaZeroEsq(inttostr(cbMesRef.itemindex + 1), 2);

      If Application.MessageBox('Confirma Seleção do Movimento ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
        Begin
          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra('Selecionando Movimento...');

          Screen.Cursor := crSQLWait;

          cdsMovSelDARF.DisableControls;
          cdsMovSelDARF.Close;
          cdsMovSelDARF.Data := oDARFFolBenef._SelecionaMovDARF(
            dblcNatRendimento.lookupValue,
            dblcVersaoFolha.LookupValue,
            sPeriodoCob,
            sPeriodoRef,
            meCPFBenef.text);
          cdsMovSelDARF.Open;
          cdsMovSelDARF.EnableControls;

          spbGravarMovDarf.Enabled := (Not cdsMovSelDARF.isempty);

          dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
          cdsMovSelDARFAfterScroll(cdsMovSelDARF);

          cdsMovSelDARF.First;

          Screen.Cursor := crDefault;
          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;

          dblcNatRendimento.setfocus;

          If cdsMovSelDARF.isEmpty Then
            Application.MessageBox(MSG006, 'Atenção !', Mb_IconExclamation);
        End;
    End
  Else // Se acionado pela aba "Movimento Gravado dos DARF´s"
    Begin
      If deDataIni.Text = EmptyStr Then
        Begin
          MsgDlg(MSG011, 'Atenção', mtWarning, [mbOK], 0);
          deDataIni.SetFocus;
          Exit;
        End;

      If deDataFim.Text = EmptyStr Then
        Begin
          MsgDlg(MSG012, 'Atenção', mtWarning, [mbOK], 0);
          deDataFim.SetFocus;
          Exit;
        End;

      If deDataIni.Date > deDataFim.Date Then
        Begin
          MsgDlg(MSG013, 'Atenção', mtWarning, [mbOK], 0);
          deDataIni.SetFocus;
          Exit;
        End;
      // Paulo Nobre - SIG 47588 - Inicio
      iSel1 := IDYES;
      If iSit = 1 Then // só faz a pergunta se chamada pelo botão "Selecionar"
        Begin
          iSel1 := Application.MessageBox('Confirma Seleção do Movimento Gravado ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
          sMsgTexto := 'Selecionando';
        End
      Else
        sMsgTexto := 'Atualizando';

      If iSel1 = IDYES Then
        Begin
          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra(sMsgTexto + ' Movimento Gravado...');

          Screen.Cursor := crSQLWait;

          // Selecionado Movimento da tabela Gravada
          cdsMovPrepDARF.DisableControls;
          cdsMovPrepDARF.Close;
          cdsMovPrepDARF.Data := oDARFFolBenef._SelecionaMovPrepDARF(
            dblcNatRendimento.lookupValue,
            dblcVersaoFolha.LookupValue,
            deDataIni.Date,
            deDataFim.date);
          cdsMovPrepDARF.Open;

          dbgPrepMovDARF.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovPrepDARF;
          cdsMovPrepDARFAfterScroll(cdsMovPrepDARF);
          cdsMovPrepDARF.First;
          cdsMovPrepDARF.EnableControls;
          dbgPrepMovDARF.RefreshDisplay;

          spbExcluirMovPrepDARF.Enabled := (Not cdsMovPrepDARF.isempty);
          spbGeradorDARF.Enabled := (Not cdsMovPrepDARF.isempty);

          If iSit In [1, 2] Then // Só atualiza os dados do lançamento manual quando chamado pelo botão "Selecionar" ou "Gravar"
            Begin
              tbsLancManual.Enabled := (Not cdsMovPrepDARF.isempty);
              tbsLancManual.Highlighted := (Not cdsMovPrepDARF.IsEmpty);
              qryLancManual.DisableControls;
              qryLancManual.Close;
              qryLancManual.SQL.Text := oDARFFolBenef._SelecionaLancManualIRRF(
                dblcNatRendimento.lookupValue,
                dblcVersaoFolha.LookupValue,
                deDataIni.Date,
                deDataFim.date);
              qryLancManual.Open;
              qryLancManual.EnableControls;
              dbgLancManual.RefreshDisplay;

              dbgLancManual.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovLancManual;
            End;

          Screen.Cursor := crDefault;
          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;

          dblcNatRendimento.setfocus;

          If cdsMovPrepDARF.isEmpty Then
            Application.MessageBox(MSG006, 'Atenção !', Mb_IconExclamation);
        End;
      // Paulo Nobre - SIG 47588 - Fim
    End;
End;

Procedure TfrmPrepararDARFFolBenef.spbCalcClick(Sender: TObject);
Begin
  Inherited;
  WinExec('Calc.Exe', SW_Show);
End;

Procedure TfrmPrepararDARFFolBenef.cdsMovSelDARFAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  stQtd1.Caption := Format('%.2d / %.2d', [cdsMovSelDARF.RecNo, cdsMovSelDARF.RecordCount]);
End;

Procedure TfrmPrepararDARFFolBenef.dbgMovDARFCalcCellColors(
  Sender: TObject; Field: TField; State: TGridDrawState;
  Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
  Inherited;
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

Procedure TfrmPrepararDARFFolBenef.spbInverterSelClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If Not cdsMovSelDARF.isEmpty Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando/desmar. todos os Lançamentos...', True, False, True, 0, cdsMovSelDARF.RecordCount);
      Application.ProcessMessages;
      cdsMovSelDARF.DisableControls;
      cdsMovSelDARF.AfterScroll := Nil;
      cdsMovSelDARF.First;
      While Not cdsMovSelDARF.Eof Do
        Begin
          cdsMovSelDARF.Edit;
          If cdsMovSelDARF.FieldByName('MARCADO').AsString = 'S' Then // Sim
            cdsMovSelDARF.FieldByName('MARCADO').AsString := 'N' // Não
          Else
            cdsMovSelDARF.FieldByName('MARCADO').AsString := 'S'; // Sim

          cdsMovSelDARF.Next;
          oDARFFolBenef._AtualizaFrmProgresso(iContador);
        End;
      dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
      cdsMovSelDARF.EnableControls;
      cdsMovSelDARF.First;
      cdsMovSelDARF.AfterScroll := cdsMovSelDARFAfterScroll;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.spbMarcaTodosClick(Sender: TObject);
Var iContador: Integer;
Begin
  Inherited;
  If (Not cdsMovSelDARF.isEmpty) Then
    Begin
      iContador := 0;
      frmProgresso.MostraFormProgresso('Aguarde, marcando todos os Lançamentos...', True, False, True, 0, cdsMovSelDARF.RecordCount);
      Application.ProcessMessages;
      cdsMovSelDARF.DisableControls;
      cdsMovSelDARF.AfterScroll := Nil;
      cdsMovSelDARF.First;
      While Not cdsMovSelDARF.Eof Do
        Begin
          cdsMovSelDARF.Edit;

          If cdsMovSelDARF.FieldByName('MARCADO').AsString = 'N' Then
            cdsMovSelDARF.FieldByName('MARCADO').AsString := 'S'; // Sim

          cdsMovSelDARF.Next;
          oDARFFolBenef._AtualizaFrmProgresso(iContador);
        End;
      dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
      cdsMovSelDARF.EnableControls;
      cdsMovSelDARF.First;
      cdsMovSelDARF.AfterScroll := cdsMovSelDARFAfterScroll;
      frmProgresso.EscondeFormProgresso;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.spbExpBenefSelClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovSelDARF.isEmpty Then
    Begin
      cdsMovSelDARF.AfterScroll := Nil;
      qeMovSelDARF.FileName := sPathArquivosLog + '\MOVSELDARF.XLS';
      qeMovSelDARF.Execute;
      cdsMovSelDARF.First;
      cdsMovSelDARF.AfterScroll := cdsMovSelDARFAfterScroll;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.spbSelMovGravadoClick(Sender: TObject);
Begin
  Inherited;
  _SelecionaMovimentos(1); // Paulo Nobre - SIG 47588
End;

Procedure TfrmPrepararDARFFolBenef.spbGravarMovDarfClick(Sender: TObject);
Var iSel1: Word;
Begin
  Inherited;
  If cdsMovSelDARF.Locate('MARCADO', 'S', []) Then // Sim
    Begin
      // Filtro para caso haja pelo um 'N', então filtra, caso contrário todos estão marcados
      If cdsMovSelDARF.Locate('MARCADO', 'N', []) Then // Não
        Begin
          // Filtrando a Grid somente para mostrar e processar os marcados
          Screen.Cursor := crSQLWait;
          cdsMovSelDARF.Filtered := False;
          cdsMovSelDARF.Filter := 'MARCADO = ''S'' '; // Sim
          cdsMovSelDARF.Filtered := True;
          dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
          Screen.Cursor := crDefault;
        End;

      If Application.MessageBox('Confirma Gravação do Movimento dos DARF´s ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO) = IDYES Then
        Begin
          iSel1 := IDYES;
          // Evitando a regravação de um lançamentro
          If oDARFFolBenef._ExisteLancamentoGravado(
            cdsMovSelDARF.fieldByname('CODIRRFDARF').asString, // CODNATUREZA
            cdsMovSelDARF.fieldByname('IDHSTFOLHABENEF').asString,
            cdsMovSelDARF.fieldByname('MESCOBRANCA').asString,
            cdsMovSelDARF.fieldByname('MES').asString) Then
            Begin
              iSel1 := Application.MessageBox('Foi encontrado Movimento Gravado para os critérios fornecidos (Natureza/Ver.Folha ou Períodos). ' + #13 + #13 +
                'Deseja continuar assim mesmo ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
            End;

          If iSel1 = IDYES Then
            Begin
              Try
                If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

                cdsMovSelDARF.DisableControls;
                cdsMovSelDARF.First;
                iContador := 0;
                frmProgresso.MostraFormProgresso('Aguarde...Gravando Movimento', True, False, True, 0, cdsMovSelDARF.RecordCount);

                While Not cdsMovSelDARF.EOF Do
                  Begin
                    // Inserindo/gravando o lançamento
                    qryAux1.Close;
                    qryAux1.SQL.Clear;
                    qryAux1.SQL.add('INSERT INTO IRRFFOLHABENEF ( ');
                    qryAux1.SQL.add('IDLANCIRRFFOLHABENEF,      ');
                    qryAux1.SQL.add('IDHSTFOLHABENEF,           ');
                    qryAux1.SQL.add('NUMDOCUMENTO,              ');
                    qryAux1.SQL.add('IDPESSOA,                  ');
                    qryAux1.SQL.add('CODNATUREZA,               ');
                    qryAux1.SQL.add('IDPATRO,                   ');
                    qryAux1.SQL.add('IDPLANOPREV,               ');
                    qryAux1.SQL.add('IDMOTIVO,                  ');
                    qryAux1.SQL.add('IDINFORME,                 ');
                    qryAux1.SQL.add('IDDARF,                    ');
                    qryAux1.SQL.add('CODDOCUMENTO,              ');
                    qryAux1.SQL.add('IDPROCJUD,                 ');
                    qryAux1.SQL.add('CODTIPRECDES,              ');
                    qryAux1.SQL.add('CODPROVDESC,               ');
                    qryAux1.SQL.add('FONTEPAGADORA,             ');
                    qryAux1.SQL.add('PLANO,                     ');
                    qryAux1.SQL.add('PLACONTA,                  ');
                    qryAux1.SQL.add('IDPROGRAMA,                ');
                    qryAux1.SQL.add('CODCENTROCUSTO,            ');
                    qryAux1.SQL.add('CODCENTRORESPON,           ');
                    qryAux1.SQL.add('MESCOBRANCA,               ');
                    qryAux1.SQL.add('MESREFERENCIA,             ');
                    qryAux1.SQL.add('DATAPAGAMENTO,             ');
                    qryAux1.SQL.add('DATAVENCIMENTO,            ');
                    qryAux1.SQL.add('VLRIMPOSTO,                ');
                    qryAux1.SQL.add('VLRBASE,                   ');
                    qryAux1.SQL.add('FLGREGEXCLUIDO,            ');
                    qryAux1.SQL.add('FLGTIPOFOLHA,              ');
                    qryAux1.SQL.add('TRGUSERINCLUSAO,           ');
                    qryAux1.SQL.add('TRGDTINCLUSAO,             ');
                    qryAux1.SQL.add('FLGTIPOINCLUSAO )          ');
                    qryAux1.SQL.add('VALUES (                   ');
                    qryAux1.SQL.add('SEQIRRFFOLHABENEF.NEXTVAL, ');
                    qryAux1.SQL.add(':pIDHSTFOLHABENEF,         ');
                    qryAux1.SQL.add(':pNUMDOCUMENTO,            ');
                    qryAux1.SQL.add(':pIDPESSOA,                ');
                    qryAux1.SQL.add(':pCODNATUREZA,             ');
                    qryAux1.SQL.add(':pIDPATRO,                 ');
                    qryAux1.SQL.add(':pIDPLANOPREV,             ');
                    qryAux1.SQL.add(':pIDMOTIVO,                ');
                    qryAux1.SQL.add(':pIDINFORME,               ');
                    qryAux1.SQL.add('NULL,                      '); // IDDARF
                    qryAux1.SQL.add('NULL,                      '); // CODDOCUMENTO
                    qryAux1.SQL.add(':pIDPROCJUD,               ');
                    qryAux1.SQL.add(':pCODTIPRECDES,            ');
                    qryAux1.SQL.add(':pCODPROVDESC,             ');
                    qryAux1.SQL.add(':pFONTEPAGADORA,           ');
                    qryAux1.SQL.add(':pPLANO,                   ');
                    qryAux1.SQL.add(':pPLACONTA,                ');
                    qryAux1.SQL.add(':pIDPROGRAMA,              ');
                    qryAux1.SQL.add(':pCODCENTROCUSTO,          ');
                    qryAux1.SQL.add(':pCODCENTRORESPON,         ');
                    qryAux1.SQL.add(':pMESCOBRANCA,             ');
                    qryAux1.SQL.add(':pMESREFERENCIA,           ');
                    qryAux1.SQL.add(':pDATAPAGAMENTO,           ');
                    qryAux1.SQL.add(':pDATAVENCIMENTO,          ');
                    qryAux1.SQL.add(':pVLRIMPOSTO,              ');
                    qryAux1.SQL.add(':pVLRBASE,                 ');
                    qryAux1.SQL.add(':pFLGREGEXCLUIDO,          ');
                    qryAux1.SQL.add(':pFLGTIPOFOLHA,            ');
                    qryAux1.SQL.add('NULL,                      ');
                    qryAux1.SQL.add('NULL,                      ');
                    qryAux1.SQL.add(':pFLGTIPOINCLUSAO  )       '); // Paulo Nobre - SIG 47588
                    qryAux1.ParamByName('pIDHSTFOLHABENEF').asInteger := cdsMovSelDARF.fieldByname('IDHSTFOLHABENEF').asInteger;
                    qryAux1.ParamByName('pNUMDOCUMENTO').asString := cdsMovSelDARF.fieldByname('NUMDOCUMENTO').asString;
                    qryAux1.ParamByName('pIDPESSOA').asInteger := cdsMovSelDARF.fieldByname('IDRESPONSAVEL').asInteger;
                    qryAux1.ParamByName('pCODNATUREZA').asString := cdsMovSelDARF.fieldByname('CODIRRFDARF').asString;
                    qryAux1.ParamByName('pIDPATRO').asInteger := cdsMovSelDARF.fieldByname('IDPATRO').asInteger;
                    //qryAux1.ParamByName('pIDPLANOPREV').asInteger := cdsMovSelDARF.fieldByname('IDPLANOPREV').asInteger;       //edilaine - SIG61511
                    qryAux1.ParamByName('pIDPLANOPREV').asInteger := cdsMovSelDARF.fieldByname('IDPLANOCONTABIL').asInteger;     //edilaine - SIG61511
                    qryAux1.ParamByName('pIDMOTIVO').asInteger := cdsMovSelDARF.fieldByname('IDMOTIVO').asInteger;
                    qryAux1.ParamByName('pIDINFORME').asInteger := cdsMovSelDARF.fieldByname('IDINFORME').asInteger;
                    qryAux1.ParamByName('pIDPROCJUD').asInteger := cdsMovSelDARF.fieldByname('IDPROCJUD').asInteger;
                    qryAux1.ParamByName('pCODTIPRECDES').asString := cdsMovSelDARF.fieldByname('CODTIPRECDES').asString;
                    qryAux1.ParamByName('pCODPROVDESC').asString := cdsMovSelDARF.fieldByname('CODPROVDESC').asString;
                    qryAux1.ParamByName('pFONTEPAGADORA').asInteger := cdsMovSelDARF.fieldByname('FONTEPAGADORA').asInteger;
                    //qryAux1.ParamByName('pPLANO').asInteger := cdsMovSelDARF.fieldByname('IDPLANOCONTABIL').asInteger;        //edilaine - SIG61511
                    qryAux1.ParamByName('pPLANO').asInteger := cdsMovSelDARF.fieldByname('PLANO').asInteger;                    //edilaine - SIG61511
                    qryAux1.ParamByName('pPLACONTA').asString := cdsMovSelDARF.fieldByname('PLACONTAC').asString;
                    qryAux1.ParamByName('pIDPROGRAMA').asInteger := cdsMovSelDARF.fieldByname('IDPROGRAMA').asInteger;
                    qryAux1.ParamByName('pCODCENTROCUSTO').asString := cdsMovSelDARF.fieldByname('CODCENTROCUSTO').asString;
                    qryAux1.ParamByName('pCODCENTRORESPON').asString := cdsMovSelDARF.fieldByname('CODCENTRORESPON').asString;
                    qryAux1.ParamByName('pMESCOBRANCA').asString := cdsMovSelDARF.fieldByname('MESCOBRANCA').asString;
                    qryAux1.ParamByName('pMESREFERENCIA').asString := cdsMovSelDARF.fieldByname('MES').asString;
                    qryAux1.ParamByName('pDATAPAGAMENTO').asDateTime := cdsMovSelDARF.fieldByname('DATAPAGAMENTO').asDateTime;
                    qryAux1.ParamByName('pDATAVENCIMENTO').asDateTime := cdsMovSelDARF.fieldByname('DATAPAGAMENTO').asDateTime;
                    qryAux1.ParamByName('pVLRIMPOSTO').asFloat := cdsMovSelDARF.fieldByname('VALORPROVENTO').asFloat;
                    qryAux1.ParamByName('pVLRBASE').asFloat := cdsMovSelDARF.fieldByname('VALORINFO').asFloat;
                    qryAux1.ParamByName('pFLGREGEXCLUIDO').asString := 'N'; // Não
                    qryAux1.ParamByName('pFLGTIPOFOLHA').asString := '0'; // Folha de Beneficios
                    qryAux1.ParamByName('pFLGTIPOINCLUSAO').asString := 'A'; // Inclusa de forma Automática      // Paulo Nobre - SIG 47588
                    qryAux1.ExecSQL;

                    cdsMovSelDARF.Next;
                    oDARFFolBenef._AtualizaFrmProgresso(iContador);
                  End;

                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Commit;

                frmProgresso.EscondeFormProgresso;

                cdsMovSelDARF.Filtered := False;
                dbgMovDARF.RefreshDisplay;

                //Everson Cunha - SIG79320 - Início
                cdsMovSelDARF.Close;
                cdsMovSelDARF.Data := oDARFFolBenef._SelecionaMovDARF(
                  dblcNatRendimento.lookupValue,
                  dblcVersaoFolha.LookupValue,
                  sPeriodoCob,
                  sPeriodoRef,
                  meCPFBenef.text);
                cdsMovSelDARF.Open;
                //Everson Cunha - SIG79320 - Fim

                cdsMovSelDARF.IndexName := 'ascNome';
                cdsMovSelDARF.EnableControls;

                qryAux1.Close;

                pcMovDARF.ActivePage := tbsPrepMovDARF;
                pcMovDARF.OnChange(self);
                gbPeriodoCob.Repaint;

                _SelecionaMovimentos(2); // Paulo Nobre - SIG 47588
              Except
                On E: Exception Do
                  Begin
                    If dtmBaseDados.dbBaseDados.InTransaction Then
                      dtmBaseDados.dbBaseDados.RollBack;

                    cdsMovSelDARF.Filtered := False;
                    dbgMovDARF.RefreshDisplay;
                    cdsMovSelDARF.IndexName := 'ascNome';
                    frmProgresso.EscondeFormProgresso;
                    dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
                    Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
                  End;
              End;
            End
          Else
            Begin
              cdsMovSelDARF.Filtered := False;
              dbgMovDARF.RefreshDisplay;
              cdsMovSelDARF.IndexName := 'ascNome';
              dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
              cdsMovSelDARF.First;
            End;
        End
      Else
        Begin
          cdsMovSelDARF.Filtered := False;
          dbgMovDARF.RefreshDisplay;
          cdsMovSelDARF.IndexName := 'ascNome';
          dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
          cdsMovSelDARF.First;
        End;
    End
  Else
    Begin
      Application.MessageBox(MSG007, 'Atenção !', Mb_IconExclamation);
      cdsMovSelDARF.first;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.rdgTipoClick(Sender: TObject);
Begin
  Inherited;
  gbxVersaoFol.Visible := (rdgTipo.itemindex = 0);
  gbPeriodosCobRef.Visible := (rdgTipo.itemindex = 1);
  If rdgTipo.itemindex = 1 Then
    Begin
      dblcVersaoFolha.LookupValue := '-1'; // Selecione uma versão de folha
    End
  Else
    Begin
      dblcVersaoFolha.SetFocus;
      dblcVersaoFolha.Selected;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.cbMesCobChange(Sender: TObject);
Begin
  Inherited;
  cbMesRef.ItemIndex := cbMesCob.ItemIndex;

  // Alterado por FHBS - 12/09/2018 - SIG50508
  if pcMovDARF.ActivePage = tbsPrepMovDARF then
  begin
    deDataIni.Date := strtodate('01/' + oDARFFolBenef._CompletaZeroEsq(inttostr(cbMesCob.itemindex + 1), 2) + '/' + edAnoCob.Text);
    deDataFim.Date := TrazUltDiaData(deDataIni.date);
    deDataIni.Text := DateToStr(deDataIni.Date);
    deDataFim.Text := DateToStr(deDataFim.Date);
  end;
  // Fim - Alterado por FHBS - 12/09/2018 - SIG50508
End;

Procedure TfrmPrepararDARFFolBenef.edAnoCobChange(Sender: TObject);
Begin
  Inherited;
  edAnoRef.Text := edAnoCob.Text;


  // Alterado por FHBS - 12/09/2018 - SIG50508
  if pcMovDARF.ActivePage = tbsPrepMovDARF then
  begin
    deDataIni.Date := strtodate('01/' + oDARFFolBenef._CompletaZeroEsq(inttostr(cbMesCob.itemindex + 1), 2) + '/' + edAnoCob.Text);
    deDataFim.Date := TrazUltDiaData(deDataIni.date);
    deDataIni.Text := DateToStr(deDataIni.Date);
    deDataFim.Text := DateToStr(deDataFim.Date);
  end;
  // Fim - Alterado por FHBS - 12/09/2018 - SIG50508
End;

Procedure TfrmPrepararDARFFolBenef.SpeedButton9Click(Sender: TObject);
Begin
  Inherited;
  If MSBeneficiario.Executar = MrOk Then
    Begin
      If MSBeneficiario.RetornouValor Then
        Begin
          Begin
            meCPFBenef.Text := MSBeneficiario.ValoresChave[2]; // CPF
            edNomeBenef.Text := MSBeneficiario.ValoresChave[1]; // Nome
          End;
        End;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.SpeedButton8Click(Sender: TObject);
Begin
  Inherited;
  meCPFBenef.Clear;
  edNomeBenef.Clear;
End;

Procedure TfrmPrepararDARFFolBenef.spbIndisponibilizaClick(Sender: TObject);
Var RegAtual1: TBookMark;
Begin
  Inherited;
  If Not cdsMovPrepDARF.isEmpty Then
    Begin
      If cdsMovPrepDARF.fieldByname('IDDARF').isnull Then // Só apaga os Importados
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            cdsMovPrepDARF.DisableControls;
            qryFLGRegExcluido.Close;
            If cdsMovPrepDARF.FieldByName('FLGREGEXCLUIDO').AsString = 'N' Then
              qryFLGRegExcluido.parambyname('pFLGREGEXCLUIDO').AsString := 'S'
            Else
              qryFLGRegExcluido.parambyname('pFLGREGEXCLUIDO').AsString := 'N';
            qryFLGRegExcluido.parambyname('pIDLANCIRRFFOLHABENEF').AsInteger := cdsMovPrepDARF.FieldByName('IDLANCIRRFFOLHABENEF').AsInteger;
            qryFLGRegExcluido.ExecSQL;
            cdsMovPrepDARF.EnableControls;

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            RegAtual1 := cdsMovPrepDARF.GetBookmark; // Salvando o ponteiro do Registro atual

            cdsMovPrepDARF.DisableControls;
            cdsMovPrepDARF.Close;
            cdsMovPrepDARF.Data := oDARFFolBenef._SelecionaMovPrepDARF(
              dblcNatRendimento.lookupValue,
              dblcVersaoFolha.LookupValue,
              deDataIni.Date,
              deDataFim.date);
            cdsMovPrepDARF.Open;
            cdsMovPrepDARF.EnableControls;

            dbgPrepMovDARF.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovPrepDARF;
            cdsMovPrepDARFAfterScroll(cdsMovPrepDARF);

            If RegAtual1 <> Nil Then
              cdsMovPrepDARF.GotoBookmark(RegAtual1); // Voltando ao Reg. atual

            Screen.Cursor := crDefault;
          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;

                Application.MessageBox(PChar(E.Message), 'Atenção !', Mb_IconExclamation);
              End;
          End;
        End
      Else
        Application.MessageBox(MSG009, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TfrmPrepararDARFFolBenef.cdsMovPrepDARFAfterScroll(DataSet: TDataSet);
Begin
  Inherited;
  stQtd2.Caption := Format('%.2d / %.2d', [cdsMovPrepDARF.RecNo, cdsMovPrepDARF.RecordCount]);
  spbIndisponibiliza.visible := (cdsMovPrepDARF.FieldByName('FLGREGEXCLUIDO').AsString = 'N');
  spbDisponibiliza.visible := (cdsMovPrepDARF.FieldByName('FLGREGEXCLUIDO').AsString = 'S');
End;

Procedure TfrmPrepararDARFFolBenef.spbExcluirMovPrepDARFClick(Sender: TObject);
Begin
  Inherited;
  If Not _ExisteLanComIDDARFGravado Then
    Begin
      If Application.MessageBox('Confirma Exclusão de todo Movimento Selecionado ?', 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES Then
        Begin

          frmAguarde.pbAguarde.Visible := false;
          frmAguarde.Mostra('Excluindo Movimento...');

          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            Screen.Cursor := crSQLWait;

            oDARFFolBenef._ApagaMovGravadoDARF(
              dblcNatRendimento.lookupValue,
              dblcVersaoFolha.LookupValue,
              deDataIni.Date,
              deDataFim.date);

            If dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.Commit;

            cdsMovPrepDARF.DisableControls;
            cdsMovPrepDARF.Close;
            cdsMovPrepDARF.Data := oDARFFolBenef._SelecionaMovPrepDARF(
              dblcNatRendimento.lookupValue,
              dblcVersaoFolha.LookupValue,
              deDataIni.Date,
              deDataFim.date);
            cdsMovPrepDARF.Open;
            cdsMovPrepDARF.EnableControls;
            dbgPrepMovDARF.RefreshDisplay; // Paulo Nobre - SIG 47588

            dbgPrepMovDARF.ColumnByName('VLRIMPOSTO').FooterValue := '0.00';
            cdsMovPrepDARFAfterScroll(cdsMovPrepDARF);

            // Paulo Nobre - SIG 47588 - Inicio

            tbsLancManual.Enabled := (Not cdsMovPrepDARF.isempty);
            tbsLancManual.Highlighted := (Not cdsMovPrepDARF.IsEmpty);
            qryLancManual.DisableControls;
            qryLancManual.Close;
            qryLancManual.SQL.Text := oDARFFolBenef._SelecionaLancManualIRRF(
              dblcNatRendimento.lookupValue,
              dblcVersaoFolha.LookupValue,
              deDataIni.Date,
              deDataFim.date);
            qryLancManual.Open;
            qryLancManual.EnableControls;
            dbgLancManual.RefreshDisplay;

            dbgLancManual.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovLancManual;

            // Paulo Nobre - SIG 47588 - Fim

          Except
            On E: Exception Do
              Begin
                If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.RollBack;

                Application.MessageBox(pchar(E.Message), 'Atenção !', Mb_IconExclamation);
              End
          End;

          tbsLancManual.Highlighted := False;
          tbsLancManual.Enabled := False;
          Screen.Cursor := crDefault;
          frmAguarde.pbAguarde.Visible := True;
          frmAguarde.Apaga;
          dblcNatRendimento.setfocus;
        End
    End
  Else
    Application.MessageBox(MSG010, 'Atenção !', Mb_IconExclamation);

  cdsMovPrepDARF.First;
End;

Procedure TfrmPrepararDARFFolBenef.dbgMovDARFFieldChanged(Sender: TObject; Field: TField);
Var RegAtual1: TBookMark;
Begin
  Inherited;
  RegAtual1 := cdsMovSelDARF.GetBookmark; // Salvando o ponteiro do Registro atual
  dbgMovDARF.ColumnByName('VALORPROVENTO').FooterValue := _TotalizaColunaGridSelMovDARF;
  If RegAtual1 <> Nil Then
    cdsMovSelDARF.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
End;

Procedure TfrmPrepararDARFFolBenef.dbgPrepMovDARFDrawDataCell(
  Sender: TObject; Const Rect: TRect; Field: TField;
  State: TGridDrawState);
Begin
  Inherited;
  If Not cdsMovPrepDARF.isEmpty Then
    Begin
      If cdsMovPrepDARF.fieldByname('FLGREGEXCLUIDO').asString = 'S' Then
        Begin
          dbgPrepMovDARF.Canvas.Font.Style := [fsStrikeout];
          dbgPrepMovDARF.Canvas.Font.Color := clRed;
        End;

      // Paulo Nobre - SIG 47588 - Inicio
      If cdsMovPrepDARF.fieldByname('FLGTIPOINCLUSAO').asString = 'M' Then
        dbgPrepMovDARF.Canvas.Font.Color := clBlue;
      // Paulo Nobre - SIG 47588 - Fim

      If field.FieldName = 'IDDARF' Then
        Begin
          dbgPrepMovDARF.Canvas.Font.Color := clBlue;
          dbgPrepMovDARF.Canvas.Font.Style := [fsbold];
        End;

      dbgPrepMovDARF.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Procedure TfrmPrepararDARFFolBenef.dbgPrepMovDARFFieldChanged(Sender: TObject; Field: TField);
Var RegAtual1: TBookMark;
Begin
  Inherited;
  RegAtual1 := cdsMovPrepDARF.GetBookmark; // Salvando o ponteiro do Registro atual
  dbgPrepMovDARF.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovPrepDARF;
  If RegAtual1 <> Nil Then
    cdsMovPrepDARF.GotoBookmark(RegAtual1); // Voltando ao Reg. atual
End;

Procedure TfrmPrepararDARFFolBenef.SpeedButton3Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovPrepDARF.isEmpty Then
    Begin
      cdsMovPrepDARF.AfterScroll := Nil;
      qeMovPrepDARF.FileName := sPathArquivosLog + '\MOVPREPDARF.XLS';
      qeMovPrepDARF.Execute;
      cdsMovPrepDARF.First;
      cdsMovPrepDARF.AfterScroll := cdsMovPrepDARFAfterScroll;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.pcMovDARFChange(Sender: TObject);
Begin
  Inherited;
  gbBenefi.visible := (pcMovDARF.ActivePage = tbsSelMovDARF);
  gbPeriodoCob.visible := (pcMovDARF.ActivePage = tbsPrepMovDARF);
  If pcMovDARF.ActivePage = tbsPrepMovDARF Then
    Begin
      deDataIni.Date := strtodate('01/' + oDARFFolBenef._CompletaZeroEsq(inttostr(cbMesCob.itemindex + 1), 2) + '/' + edAnoCob.Text);
      deDataFim.Date := TrazUltDiaData(deDataIni.date);
      deDataIni.Text := DateToStr(deDataIni.Date);
      deDataFim.Text := DateToStr(deDataFim.Date);
    End;

  rdgTipo.enabled := (pcMovDARF.ActivePage = tbsSelMovDARF);

  // Paulo Nobre - SIG 47588 - Inicio
  If bManLancManual = True Then
    Begin
      dbgPrepMovDARF.RefreshDisplay;
      Application.ProcessMessages;
      _SelecionaMovimentos(3);
      bManLancManual := False;
    End;
  // Paulo Nobre - SIG 47588 - Fim
End;

Procedure TfrmPrepararDARFFolBenef.deDataIniChange(Sender: TObject);
Begin
  Inherited;
  If deDataIni.text <> '' Then
    Begin
      deDataFim.Date := TrazUltDiaData(deDataIni.date);
      //dblcVersaoFolha.LookupValue := '-1'; // Todas as versões como default //Taffarel - SIG50508
    End;
End;

Procedure TfrmPrepararDARFFolBenef.dblcNatRendimentoCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  If rdgTipo.itemindex = 0 Then // Versão da Folha
    Begin
      dblcVersaoFolha.SetFocus;
      dblcVersaoFolha.Selected;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.spbGeradorDARFClick(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovPrepDARF.isEmpty Then
    Begin
      AbrirForm(frmGeraDARF_Novo, TfrmGeraDARF_Novo, False);
      frmGeraDARF_Novo.Tag := 1; // Identificar que foi chamada por aqui
      sAnoAtual := inttostr(DiasUteis.ExtraiAno(cdsMovPrepDARF.fieldbyname('DATAPAGAMENTO').asDateTime));
      iMes := DiasUteis.ExtraiMes(cdsMovPrepDARF.fieldbyname('DATAPAGAMENTO').asDateTime);
      frmGeraDARF_Novo.deDataIni.Date := strtodate('01/' + inttostr(iMes) + '/' + sAnoAtual);
      frmGeraDARF_Novo.deDataFim.Date := TrazUltDiaData(frmGeraDARF_Novo.deDataIni.date);
      frmGeraDARF_Novo.deDataIni.Text := datetostr(frmGeraDARF_Novo.deDataIni.Date);
      frmGeraDARF_Novo.deDataFim.Text := datetostr(frmGeraDARF_Novo.deDataFim.date);
      frmGeraDARF_Novo.dblcNatureza.LookupValue := dblcNatRendimento.LookupValue;
      frmGeraDARF_Novo.spbSelDarfClick(self);
    End;
End;

//Taffarel - SIG50508 - início
{Procedure TfrmPrepararDARFFolBenef.deDataFimChange(Sender: TObject);
Begin
  Inherited;
  dblcVersaoFolha.LookupValue := '-1'; // Todas as versões como default
End;}
//Taffarel - SIG50508 - fim

// Paulo Nobre - SIG 47588 - Inicio

Procedure TfrmPrepararDARFFolBenef.btnInc1Click(Sender: TObject);
Begin
  Inherited;
  If Not cdsMovPrepDARF.fieldByname('IDDARF').isnull Then
    Begin
      Application.MessageBox(MSG023, 'Atenção !', Mb_IconExclamation);
      btnInc1.Down := false;
      Exit;
    End;

  btnInc1.down := True;
  If qryLancManual.State <> dsInsert Then
    Begin
      Try
        If Not dtmBaseDados.dbBaseDados.InTransaction Then
          dtmBaseDados.dbBaseDados.StartTransaction;

        dbgLancManual.enabled := False;
        pnlDadosLM.enabled := True;

        btnAlt1.enabled := False;
        btnExc1.enabled := False;
        btnCon1.Enabled := True;
        btnCan1.Enabled := True;

        iV0 := cdsMovPrepDARF.fieldbyname('IDHSTFOLHABENEF').asInteger;
        sV1 := cdsMovPrepDARF.fieldByname('CODNATUREZA').asString;
        iV2 := cdsMovPrepDARF.fieldByname('PLANO').asInteger;
        iV3 := cdsMovPrepDARF.fieldByname('IDPATRO').asInteger;
        iV4 := cdsMovPrepDARF.fieldByname('IDMOTIVO').asInteger;
        iV5 := cdsMovPrepDARF.fieldByname('IDINFORME').asInteger;
        iV6 := cdsMovPrepDARF.fieldByname('IDPROCJUD').asInteger;
        sV7 := cdsMovPrepDARF.fieldByname('CODTIPRECDES').asString;
        sV8 := cdsMovPrepDARF.fieldByname('CODPROVDESC').asString;
        iV9 := cdsMovPrepDARF.fieldByname('FONTEPAGADORA').asInteger;
        iV10 := cdsMovPrepDARF.fieldByname('IDPLANOPREV').asInteger;
        sV11 := cdsMovPrepDARF.fieldByname('PLACONTA').asString;
        iV12 := cdsMovPrepDARF.fieldByname('IDPROGRAMA').asInteger;
        sV13 := cdsMovPrepDARF.fieldByname('CODCENTROCUSTO').asString;
        sV14 := cdsMovPrepDARF.fieldByname('CODCENTRORESPON').asString;
        sV15 := cdsMovPrepDARF.fieldByname('MESCOBRANCA').asString;
        sV16 := cdsMovPrepDARF.fieldByname('MESREFERENCIA').asString;
        dV17 := cdsMovPrepDARF.fieldByname('DATAPAGAMENTO').asDateTime;
        dV18 := cdsMovPrepDARF.fieldByname('DATAVENCIMENTO').asDateTime;
        fV19 := cdsMovPrepDARF.fieldByname('VLRIMPOSTO').asFloat;
        fV20 := cdsMovPrepDARF.fieldByname('VLRBASE').asFloat;

        qryLancManual.Insert;
        qryLancManual.fieldbyname('PLANO').asInteger := iV2;
        qryLancManual.fieldbyname('IDPATRO').asInteger := iV3;
        qryLancManual.fieldByname('VLRBASE').asFloat := fV20;
        dblcPlanoPrev.Setfocus;
        dblcPlanoPrev.SelectAll;
      Except
        btnCan1Click(Self);
        Raise;
      End;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.CMPessoaValidaDados(Sender: TObject);
Begin
  Inherited;
  If MSBeneficiario.RetornouValor Then
    Begin
      qryLancManual.fieldbyname('IDPESSOA').asString := MSBeneficiario.ValoresChave[0]; // IdPessoa
      qryLancManual.fieldbyname('NOME').asString := MSBeneficiario.ValoresChave[1]; // Nome
      qryLancManual.fieldbyname('NUMDOCUMENTO').asString := MSBeneficiario.ValoresChave[2]; // CPF
      dblcPlanoPrev.Setfocus;
      dblcPlanoPrev.SelectAll;
    End;
End;

Procedure TfrmPrepararDARFFolBenef.btnAlt1Click(Sender: TObject);
Begin
  Inherited;
  If Not qryLancManual.isEmpty Then
    Begin
      btnAlt1.down := True;
      If qryLancManual.State <> dsEdit Then
        Begin
          Try
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            dbgLancManual.enabled := False;
            pnlDadosLM.enabled := True;

            btnInc1.enabled := False;
            btnExc1.enabled := False;
            btnCon1.Enabled := True;
            btnCan1.Enabled := True;

            qryLancManual.Edit;
            dblcPlanoPrev.Setfocus;
            dblcPlanoPrev.SelectAll;
          Except
            btnCan1Click(Self);
            Raise;
          End;
        End;
    End
  Else
    Begin
      btnAlt1.Down := False;
      Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
    End;
End;

Procedure TfrmPrepararDARFFolBenef.btnExc1Click(Sender: TObject);
Begin
  Inherited;
  If Not qryLancManual.isEmpty Then
    Begin
      btnExc1.Down := True;
      If Application.MessageBox(MSG014, 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES Then
        Begin
          Try
            Screen.Cursor := crSQLWait;
            If Not dtmBaseDados.dbBaseDados.InTransaction Then
              dtmBaseDados.dbBaseDados.StartTransaction;

            qryLancManual.Delete;
            qryLancManual.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            bManLancManual := True;

            qryLancManual.DisableControls;
            qryLancManual.Close;
            qryLancManual.SQL.Text := oDARFFolBenef._SelecionaLancManualIRRF(
              dblcNatRendimento.lookupValue,
              dblcVersaoFolha.LookupValue,
              deDataIni.Date,
              deDataFim.date);
            qryLancManual.Open;
            qryLancManual.EnableControls;
            dbgLancManual.RefreshDisplay;

            dbgLancManual.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovLancManual;

            Screen.Cursor := crDefault;

            btnExc1.Down := False;
          Except
            btnCan1Click(Self);
            Raise;
          End;
        End
      Else
        btnExc1.Down := False;
    End
  Else
  begin
    Application.MessageBox(MSG015, 'Atenção !', Mb_IconExclamation);
    btnExc1.Down := False;
  end;
End;

Procedure TfrmPrepararDARFFolBenef.btnCan1Click(Sender: TObject);
Begin
  Inherited;
  If dtmBaseDados.dbBaseDados.InTransaction Then
    Begin
      If qryLancManual.state In [dsEdit, dsInsert] Then
        qryLancManual.CancelUpdates;

      dtmBaseDados.dbBaseDados.RollBack;
    End;

  dbgLancManual.enabled := True;
  pnlDadosLM.enabled := False;

  btnInc1.enabled := True;
  btnAlt1.enabled := True;
  btnExc1.enabled := True;
  btnCon1.Enabled := False;
  btnCan1.Enabled := False;

  btnInc1.Down := False;
  btnAlt1.Down := False;
End;

Procedure TfrmPrepararDARFFolBenef.btnCon1Click(Sender: TObject);
Begin
  Inherited;

  If CMPessoa.Text = EmptyStr Then
    Begin
      MsgDlg(MSG016, 'Atenção', mtWarning, [mbOK], 0);
      Exit;
    End;

  If dblcPlanoPrev.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG017, 'Atenção', mtWarning, [mbOK], 0);
      dblcPlanoPrev.SetFocus;
      dblcPlanoPrev.SelectAll;
      Exit;
    End;

  If dblcPatro.LookupValue = EmptyStr Then
    Begin
      MsgDlg(MSG018, 'Atenção', mtWarning, [mbOK], 0);
      dblcPatro.SetFocus;
      dblcPatro.SelectAll;
      Exit;
    End;

  If Not oDARFFolBenef._ValidaPlanoPatro(StrToInt(dblcPlanoPrev.LookupValue), StrToInt(dblcPatro.LookupValue)) Then
    Begin
      MsgDlg(MSG019, 'Atenção', mtInformation, [mbOk], 0);
      Exit;
    End;

   //Taffarel Sevaybriker - SIG54355 - início
  {If dbeValorBase.Value = 0.00 Then
    Begin
      MsgDlg(MSG020, 'Atenção', mtWarning, [mbOK], 0);
      dbeValorBase.SetFocus;
      Exit;
    End;}

  {If dbeValorIRRF.Value = 0.00 Then
    Begin
      MsgDlg(MSG021, 'Atenção', mtWarning, [mbOK], 0);
      dbeValorIRRF.SetFocus;
      Exit;
    End;}

  {If ( Abs(roundCM(dbeValorIRRF.Value, 2)) >= Abs(roundCM(dbeValorBase.Value, 2))) Then     //edilaine - SIG47588
    Begin
      MsgDlg(MSG022, 'Atenção', mtWarning, [mbOK], 0);
      dbeValorIRRF.SetFocus;
      Exit;
    End;}
	//Taffarel Sevaybriker - SIG54355 - fim

  Try
    If dtmBaseDados.dbBaseDados.InTransaction Then
      Begin
        If qryLancManual.State In [dsInsert, dsEdit] Then
          Begin
            Screen.Cursor := crSQLWait;
            If qryLancManual.State = dsInsert Then
              Begin
                qryAux1.Close;
                qryAux1.SQL.Clear;
                qryAux1.SQL.add('SELECT SEQIRRFFOLHABENEF.NEXTVAL SEQ FROM DUAL ');
                qryAux1.Open;

                qryLancManual.fieldByname('IDLANCIRRFFOLHABENEF').asInteger := qryAux1.fieldByname('SEQ').asInteger;
                qryLancManual.fieldbyname('IDHSTFOLHABENEF').asInteger := iV0;
                qryLancManual.fieldByname('CODNATUREZA').asString := sV1;
                qryLancManual.fieldByname('IDMOTIVO').asInteger := iV4;
                qryLancManual.fieldByname('IDINFORME').asInteger := iV5;
                qryLancManual.fieldByname('IDPROCJUD').asInteger := iV6;
                qryLancManual.fieldByname('CODTIPRECDES').asString := sV7;
                qryLancManual.fieldByname('CODPROVDESC').asString := sV8;
                qryLancManual.fieldByname('FONTEPAGADORA').asInteger := iV9;
                qryLancManual.fieldByname('IDPLANOPREV').asInteger := iV10;
                qryLancManual.fieldByname('PLACONTA').asString := sV11;
                qryLancManual.fieldByname('IDPROGRAMA').asInteger := iV12;
                qryLancManual.fieldByname('CODCENTROCUSTO').asString := sV13;
                qryLancManual.fieldByname('CODCENTRORESPON').asString := sV14;
                qryLancManual.fieldByname('MESCOBRANCA').asString := sV15;
                qryLancManual.fieldByname('MESREFERENCIA').asString := sV16;
                qryLancManual.fieldByname('DATAPAGAMENTO').asDateTime := dV17;
                qryLancManual.fieldByname('DATAVENCIMENTO').asDateTime := dV18;
                qryLancManual.fieldByname('FLGREGEXCLUIDO').asString := 'N'; // Não
                qryLancManual.fieldByname('FLGTIPOFOLHA').asString := '0'; // Folha de Beneficios
                qryLancManual.fieldByname('FLGTIPOINCLUSAO').asString := 'M'; // Inclusão Manual
                qryAux1.Close;
              End;

            Application.ProcessMessages;
            qryLancManual.Post;
            qryLancManual.ApplyUpdates;
            dtmBaseDados.dbBaseDados.Commit;

            bManLancManual := True;

            qryLancManual.DisableControls;
            qryLancManual.Close;
            qryLancManual.SQL.Text := oDARFFolBenef._SelecionaLancManualIRRF(
              dblcNatRendimento.lookupValue,
              dblcVersaoFolha.LookupValue,
              deDataIni.Date,
              deDataFim.date);
            qryLancManual.Open;
            qryLancManual.EnableControls;
            dbgLancManual.RefreshDisplay;

            dbgLancManual.ColumnByName('VLRIMPOSTO').FooterValue := _TotalizaColunaGridMovLancManual;

            qryLancManual.first;

            Screen.Cursor := crDefault;

            btnCan1Click(Self);
          End;
      End;
  Except
    btnCan1Click(Self);
    Raise;
  End;
End;

Procedure TfrmPrepararDARFFolBenef.pcMovDARFChanging(Sender: TObject;
  Var AllowChange: Boolean);
Begin
  Inherited;
  AllowChange := (qryLancManual.State = dsBrowse);
End;

Procedure TfrmPrepararDARFFolBenef.dbgBaseLancDrawDataCell(Sender: TObject;
  Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
  Inherited;
  If Not cdsMovPrepDARF.isEmpty Then
    Begin
      If cdsMovPrepDARF.fieldByname('FLGREGEXCLUIDO').asString = 'S' Then
        Begin
          dbgBaseLanc.Canvas.Font.Style := [fsStrikeout];
          dbgBaseLanc.Canvas.Font.Color := clRed;
        End;

      If cdsMovPrepDARF.fieldByname('FLGTIPOINCLUSAO').asString = 'M' Then
        dbgBaseLanc.Canvas.Font.Color := clBlue;

      If field.FieldName = 'IDDARF' Then
        Begin
          dbgBaseLanc.Canvas.Font.Color := clBlue;
          dbgBaseLanc.Canvas.Font.Style := [fsbold];
        End;

      dbgBaseLanc.DefaultDrawDataCell(Rect, Field, State);
    End;
End;

Function TfrmPrepararDARFFolBenef._TotalizaColunaGridMovLancManual: String;
Var dTotalFiltro: Double;
Begin
  dTotalFiltro := 0.00;
  Screen.Cursor := crSQLWait;
  qryLancManual.DisableControls;
  qryLancManual.First;
  While Not qryLancManual.EOF Do
    Begin
      If Not qryLancManual.Fieldbyname('VLRIMPOSTO').isNull Then
        dTotalFiltro := dTotalFiltro + qryLancManual.Fieldbyname('VLRIMPOSTO').asFloat;

      qryLancManual.Next;
    End;
  qryLancManual.First;
  qryLancManual.enableControls;
  Screen.Cursor := crDefault;
  Result := floattostrf(dTotalFiltro, ffnumber, 12, 2);
End;

Procedure TfrmPrepararDARFFolBenef.FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
Begin
  Inherited;
  If qryLancManual.State In [dsEdit, dsInsert] Then
    Begin
      If Application.MessageBox(MSG024, 'Atenção !', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) = IDYES Then
        Begin
          btnCan1Click(Self);
          qryLancManual.Close;
          CanClose := True;
        End
      Else
        CanClose := False;
    End
  Else
    Begin
      qryLancManual.Close;
      CanClose := True;
    End;

  // Paulo Nobre - SIG 47588 - Fim
End;

//Taffarel - SIG50508 - início
procedure TfrmPrepararDARFFolBenef.dblcVersaoFolhaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  if not((dblcVersaoFolha.LookupValue = '-1') or (dblcVersaoFolha.LookupValue = EmptyStr)) then
  begin
    cdsVersoesFolha.Filtered := False;
    cdsVersoesFolha.Filter := 'IDHSTFOLHABENEF =' + QuotedStr(dblcVersaoFolha.LookupValue);
    cdsVersoesFolha.Filtered := True;

    sAnoAtual := Copy(cdsVersoesFolha.fieldByname('MESREFERENCIA').asString, 0, 4);
    iMes :=  StrToInt(Copy(cdsVersoesFolha.fieldByname('MESREFERENCIA').asString, 6, 2));

    cdsVersoesFolha.Filter := '';
    cdsVersoesFolha.Filtered := False;

    dblcVersaoFolha.SetFocus;
    dblcVersaoFolha.Selected;

    // Macete para ajustar o itemindex do combox de forma a trazer o mes correto
    If iMes = 1 Then // janeiro
      Begin
        cbMesCob.ItemIndex := 0;
        cbMesRef.ItemIndex := 0;
      End
    Else
      Begin
        cbMesCob.ItemIndex := iMes - 1;
        cbMesRef.ItemIndex := iMes - 1;
      End;
    edAnoCob.Text := sAnoAtual;
    edAnoRef.Text := sAnoAtual;
    deDataIni.Date := strtodate('01/' + inttostr(iMes) + '/' + sAnoAtual);
    deDataFim.Date := TrazUltDiaData(deDataIni.date);
    deDataIni.Text := DateToStr(deDataIni.Date);
    deDataFim.Text := DateToStr(deDataFim.Date);
  end
end;
//Taffarel - SIG50508 - fim

End.

