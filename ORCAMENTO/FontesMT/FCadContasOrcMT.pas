// Alterações:
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeDetalheEdit
Data      : 22/05/2006
Autor     : André Tavares
Pendencia : 22288
Descrição : se o campo recpag da conta orcamem estiver preenchido, buscar o tipo de desembolsoso
            também pelo campo recpag.
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 21/10/2005
Autor     : andre tavares
Pendencia : 20537
Descrição : faltava um left join na query do montaselect
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 18/10/2005
Autor     : andre tavares
Pendencia : 20472
Descrição : na pasta parametros da conta o campo plano não aparece o nome do plano
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 17/05/2005
Autor     : andre tavares
Pendencia : 17608
Descrição : filtra os planosprevcontail por patro
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 03/03/2004
Autor     : Marchetti
Pendencia : 16014
Descrição : Filtro dos grupos pelo Plano Orçamentário (IDPLANOORCAMEN) / Modulo.iPlanoOrc
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CmeDetalheConfirma
Data      : 23/01/2004
Autor     : Marchetti
Pendencia : 15549
Descrição : Ajuste na gravacao do detalhe da conta
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 07/11/2003
Autor     : André Pontes
Pendencia : 10065
Descrição : Filtro dos grupos pelo Plano Orçamentário (IDPLANOORCAMEN) / Modulo.iPlanoOrc
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    :
Data      : 08/12/2004
Autor     : Rodolpho da Silva
Descrição : Alteração do do tamanho do TField CdsIDCONTAORCAMEN de 25 para 30
---------------------------------------------------------------------------------------------------}

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Davi Ramos                      }
{ Atualizado Em: Julho/2002                             }
{                                                       }
{*******************************************************}
Unit FCadContasOrcMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TB97, TabControlDetalhe, ExtCtrls, wwdblook, TREdit, Mask,   wwdbedit, DBCtrls,
  wwriched, CMTree, IvDictio, IvMulti, IvEMulti, Wwdotdot, Wwdbcomb, CMProcuraMask,
  Parser10, Wwdbspin, fcButton, fcImgBtn, fcShapeBtn, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient,
  uCMClientDataSet, uCtrlCadContasOrc, uCtrlParamIntegra,uCMTypes, uCmSqlParams,
   uCtrlPlanPrevContabPatro, uCtrlPlanPrevContabil,
  uCtrlCadFormulaApuraOrc;

Type
  TfrmCadContasOrcMT = Class( TFrmCadastroMestreDetMT )
    tbsFormulas: TTabSheet;
    tbsContasOrc: TTabSheet;
    tbsFluxoCaixa: TTabSheet;
    tbsArquivoGen: TTabSheet;
    dbeNomeContaOrc: TwwDBEdit;
    lblCodigoConta: TLabel;
    lblNome: TLabel;
    lblFormulaOrc: TLabel;
    lblFormulaReal: TLabel;
    dbcConverte: TDBCheckBox;
    tbsValorInformado: TTabSheet;
    gbValorInformadoRea: TGroupBox;
    dbrValorRealizado: TDBRealEdit;
    gbValorInformadoOrc: TGroupBox;
    dbrValorOrcado: TDBRealEdit;
    pnlFluxoCaixa: TPanel;
    pnlContasOrc: TPanel;
    dbgrdContaOrc: TwwDBGrid;
    dbgrdFluxo: TwwDBGrid;
    tbsContaRea: TTabSheet;
    pnlContasRea: TPanel;
    dbgrdContaRea: TwwDBGrid;
    lblContaRefOrc: TLabel;
    dblcContaRefOrc: TwwDBLookupCombo;
    dbrPercOrc: TDBRealEdit;
    lblPercOrc: TLabel;
    dbrPercRea: TDBRealEdit;
    lblPercRea: TLabel;
    dblcContaRefRea: TwwDBLookupCombo;
    lblContaRefRea: TLabel;
    spbOrcado: TSpeedButton;
    spbRealizado: TSpeedButton;
    dblcUnidNegoc: TwwDBLookupCombo;
    lblUnidNegoc: TLabel;
    dblcCentroRespon: TwwDBLookupCombo;
    lblCentroRespon: TLabel;
    dblcTipoRD: TwwDBLookupCombo;
    lblTipoRD: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    lblCCusto: TLabel;
    dblcAtividade: TwwDBLookupCombo;
    lblAtividade: TLabel;
    dbreFormulaOrcado: TwwDBEdit;
    dbreFormulaReal: TwwDBEdit;
    Label3: TLabel;
    btnCriaSQL: TBitBtn;
    dbrdgSinal: TDBRadioGroup;
    tbsObs: TTabSheet;
    dbeObservacao: TwwDBEdit;
    lblObservacao: TLabel;
    dblcCentRespConta: TwwDBLookupCombo;
    Label4: TLabel;
    dbrgGeracaoDados: TDBRadioGroup;
    btnImportaContab: TToolbarButton97;
    MontaSelectGrupo: TMontaSelect;
    dbcboTipoCalcReal: TwwDBComboBox;
    Label5: TLabel;
    dbcboTipoCalcOrc: TwwDBComboBox;
    Label6: TLabel;
    tbsCond: TTabSheet;
    dbgrdCond: TwwDBGrid;
    Panel2: TPanel;
    Label9: TLabel;
    dblkContaIni: TwwDBLookupCombo;
    Label7: TLabel;
    dbcboCondicao: TwwDBComboBox;
    dbcboTipoIni: TwwDBComboBox;
    dblkContaFim: TwwDBLookupCombo;
    Label8: TLabel;
    dbrValorIni: TDBRealEdit;
    Label10: TLabel;
    dblkContaRes: TwwDBLookupCombo;
    dbcboTipoRes: TwwDBComboBox;
    dbrValorRes: TDBRealEdit;
    Image1: TImage;
    Label11: TLabel;
    memlegenda: TMemo;
    memSQL: TMemo;
    cmccConta: TCMProcuraMaskContabil;
    dbcboCalcValor: TwwDBComboBox;
    Label1: TLabel;
    dbcTransfere: TDBCheckBox;              
    dteDataInativa: TCMDateTimePicker;
    dblkCCustoFluxo: TwwDBLookupCombo;
    Label2: TLabel;
    dbchkInativa: TDBCheckBox;
    Label12: TLabel;
    dteDataAtiva: TCMDateTimePicker;
    Label13: TLabel;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    lblPatroC: TLabel;
    dblcPatroC: TwwDBLookupCombo;
    pnlPlanoPatroF: TPanel;
    lblPlanPrevF: TLabel;
    lblPlatroF: TLabel;
    dblcPlanPrevF: TwwDBLookupCombo;
    dblcPatroF: TwwDBLookupCombo;
    btnTransf: TfcShapeBtn;
    ToolbarSep973: TToolbarSep97;
    dbeGrupo: TCMProcuraMask;
    dbeCodigoContaOrc: TwwDBEdit;
    MontaSelectContaContab: TMontaSelect;
    Label14: TLabel;
    sePosIni1: TwwDBSpinEdit;
    Label15: TLabel;
    sePosFim1: TwwDBSpinEdit;
    Label16: TLabel;
    edConteudo1: TEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    edConteudo2: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    TabSheet1: TTabSheet;
    Label20: TLabel;
    dblcCCustoParamConta: TwwDBLookupCombo;
    Label21: TLabel;
    dblcAtivParamConta: TwwDBLookupCombo;
    pnlPlanoPatroP: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    dblcPatroParamConta: TwwDBLookupCombo;
    Label24: TLabel;
    dblcPlanoContabil: TwwDBLookupCombo;
    CdsDet: TCMClientDataSet;

    dsDetContaOrc    : TwwDataSource;
    dsDetFluxo       : TwwDataSource;
    dsDetContaRea    : TwwDataSource;
    dsContaContabil  : TwwDataSource;
    dsGrupo          : TwwDataSource;
    dsDetCond        : TwwDataSource;
    dsDataView       : TwwDataSource;
    dsTodoDet        : TwwDataSource;                                     
    dsMovOrcamento   : TwwDataSource;

    CdsAux             : TCMClientDataSet;                                
    CdsCCusto          : TCMClientDataSet;
    CdsCCustoConta     : TCMClientDataSet;
    CdsCCustoFluxo     : TCMClientDataSet;
    CdsCenRespConta    : TCMClientDataSet;
    CdsCentroRespon    : TCMClientDataSet;
    CdsContaCondFim    : TCMClientDataSet;
    CdsContaCondIni    : TCMClientDataSet;
    CdsContaCondRes    : TCMClientDataSet;
    CdsContaContab     : TCMClientDataSet;
    CdsContaContabil   : TCMClientDataSet;
    CdsContasOrc       : TCMClientDataSet;
    CdsContasRef       : TCMClientDataSet;
    CdsDataView        : TCMClientDataSet;
    CdsDetCond         : TCMClientDataSet;
    CdsDetContaOrc     : TCMClientDataSet;
    CdsDetContaRea     : TCMClientDataSet;
    CdsDetFluxo        : TCMClientDataSet;
    CdsGrupo           : TCMClientDataSet;
    CdsGrupoAux        : TCMClientDataSet;
    CdsMovOrcamento    : TCMClientDataSet;
    CdsPatro           : TCMClientDataSet;
    CdsPatroConta      : TCMClientDataSet;
    CdsPlanoContabil   : TCMClientDataSet;
    CdsPlanoPrev       : TCMClientDataSet;
    CdsPlanoPrevConta  : TCMClientDataSet;
    CdsTestaComposicao : TCMClientDataSet;
    CdsTipoRD          : TCMClientDataSet;
    CdsTodoDet         : TCMClientDataSet;
    CdsUnidNegoc       : TCMClientDataSet;
    CdsUnidNegocConta  : TCMClientDataSet;
    qryGrupo: TCMSqlParams;
    ClientDataSet1: TClientDataSet;
    CdsDetCondIDCONTACONDINI: TStringField;
    CdsDetCondIDCONTACONDFIM: TStringField;
    CdsDetCondIDCONTACONDRES: TStringField;
    CdsDetCondCONDICAO: TStringField;
    CdsDetCondTIPOCONDINI: TStringField;
    CdsDetCondTIPOCONDRES: TStringField;
    CdsDetCondVLRCONDINI: TFloatField;
    CdsDetCondVLRCONDRES: TFloatField;
    CdsDetCondIDCONTAORCAMEN: TStringField;
    CdsDetCondIDPLANOORCAMEN: TFloatField;
    CdsDetCondIDCOMPCONTASORC: TFloatField;
    CdsDetCondCONDDESCRICAO: TStringField;
    lblAtividade3: TLabel;
    lblAtividade2: TLabel;
    lblAtividade1: TLabel;
    pgbStatus: TProgressBar;
    QryDet: TCMSqlParams;
    Label25: TLabel;
    DbLkFormulaApuracao: TwwDBLookupCombo;
    CdsFormulaApuracao: TCMClientDataSet;
    CdsFormulaApuracaoIDFORMORCADO: TFloatField;
    CdsFormulaApuracaoNOME: TStringField;
    CdsFormulaApuracaoDESCRICAO: TMemoField;
    CdsFormulaApuracaoBASEARREDONDAMENTO: TStringField;
    CdsFormulaApuracaoBASECALCULO: TStringField;
    wwDBLookupCombo1: TwwDBLookupCombo;
    CMSqlParams2: TCMSqlParams;

    {Procedimentos definidos}
    Procedure HabilitaDetalheOrc;
    Procedure HabilitaDetalheRea;

    Procedure CriaConsulta;

    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure dbreFormulaOrcadoEnter(Sender: TObject);
    Procedure dbreFormulaRealEnter(Sender: TObject);
    Procedure dbreFormulaOrcadoExit(Sender: TObject);
    Procedure dbreFormulaRealExit(Sender: TObject);
    Procedure bbtnConfirmarClick(Sender: TObject);
    Procedure spbOrcadoClick(Sender: TObject);
    Procedure spbRealizadoClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure dblcContaRefOrcEnter(Sender: TObject);
    Procedure dblcContaRefReaEnter(Sender: TObject);
    Procedure btnImportaContabClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure dbcboTipoIniCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    Procedure dbcboTipoResCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    Procedure btnCriaSQLClick(Sender: TObject);
    Procedure dbcboTipoCalcRealCloseUp(Sender: TwwDBComboBox;
      Select: Boolean);
    Procedure dbcboTipoCalcOrcCloseUp(Sender: TwwDBComboBox;
      Select: Boolean);
    Procedure dbcboTipoCalcOrcExit(Sender: TObject);
    Procedure dbcboTipoCalcRealExit(Sender: TObject);
    Procedure dbchkInativaClick(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
    Procedure btnTransfClick(Sender: TObject);
    Procedure dbeGrupoExit(Sender: TObject);
    Procedure dblcPlanoContabilCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    Procedure dblcPlanoContabilExit(Sender: TObject);
    procedure MensagemChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcAtividadeCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAtividadeExit(Sender: TObject);
    procedure dblcAtivParamContaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAtivParamContaExit(Sender: TObject);
    procedure dblcUnidNegocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure tbsDetShow(Sender: TObject);
    procedure tbsFluxoCaixaShow(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure dblcCCustoEnter(Sender: TObject);
    procedure dblkContaResEnter(Sender: TObject);
    procedure dblkContaFimEnter(Sender: TObject);
  Private
    { Private declarations }

    Mensagem         : TEdit;
    MsgMsg           : String;

    CtrlCadFormulaApuraOrc : TCtrlCadFormulaApuraOrc;

    CtrlCadContasOrc : TCtrlCadContasOrc;

    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    CtrlPlanPrevContabil    : TCtrlPlanPrevContabil;
    procedure AtualizaLlbAtividade(var lblLocal: TLabel; pUNETIPO,
      pATIVIDADE: String);

    procedure EnableAllCdsControls( bEnable : boolean );

  Public
    { Public declarations }

  End;

var
  frmCadContasOrcMT: TfrmCadContasOrcMT;

implementation

Uses
  USistema, UMensErro, UDatabase, DBaseDados,UFuncaoGeral, UModulo, uString;

{$R *.DFM}
//************************************************
Procedure TfrmCadContasOrcMT.FormCreate(Sender: TObject);

Begin
  Inherited;

  MontaSelectGrupo.Filtro.Add('GRUPOORCAMEN.IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

  qryGrupo.Sql.Add('AND IDPLANOORCAMEN = ' + IntToStr(Modulo.iPlanoOrc));

  pgbStatus.Position := 0;
  pgbStatus.Min      := 0;
  pgbStatus.Max      := 17;
  pgbStatus.Visible  := True;

  Mensagem := TEdit.Create( Nil );
  Mensagem.OnChange := MensagemChange;

  CtrlCadContasOrc := TCtrlCadContasOrc.Create;

  CtrlCadContasOrc.Initialize( DtmBaseDados.dbBaseDados, True,
                               Sistema.ConnectionType,   Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,  True, nil, nil, False );

  CtrlCadFormulaApuraOrc := TCtrlCadFormulaApuraOrc.Create;
  CtrlCadFormulaApuraOrc.InitializeAs(CtrlCadContasOrc);


  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.InitializeAs(CtrlCadContasOrc);

  CtrlPlanPrevContabil := TCtrlPlanPrevContabil.Create;
  CtrlPlanPrevContabil.InitializeAs(CtrlCadContasOrc);
  CdsPlanoPrev.data := CtrlPlanPrevContabil.ListaPlanPrevContabil;

  CtrlCadContasOrc.iPlanoOrc := Modulo.iPlanoOrc;
  CtrlCadContasOrc.idEmpresa := Sistema.IdEmpresa;
  CtrlCadContasOrc.Mensagem  := Mensagem;
  CtrlCadContasOrc.pgbStatus := pgbStatus;

  pgbStatus.Position := 1;
  CtrlCadContasOrc.Cds                := Cds;
  CtrlCadContasOrc.CdsAux             := CdsAux;
  CtrlCadContasOrc.CdsCCusto          := CdsCCusto;
  CtrlCadContasOrc.CdsCCustoConta     := CdsCCustoConta;
  CtrlCadContasOrc.CdsCCustoFluxo     := CdsCCustoFluxo;
  CtrlCadContasOrc.CdsCenRespConta    := CdsCenRespConta;
  CtrlCadContasOrc.CdsCentroRespon    := CdsCentroRespon;
  CtrlCadContasOrc.CdsContaCondFim    := CdsContaCondFim;
  CtrlCadContasOrc.CdsContaCondIni    := CdsContaCondIni;
  CtrlCadContasOrc.CdsContaCondRes    := CdsContaCondRes;
  CtrlCadContasOrc.CdsContaContab     := CdsContaContab;
  CtrlCadContasOrc.CdsContaContabil   := CdsContaContabil;
  CtrlCadContasOrc.CdsContasOrc       := CdsContasOrc;
  CtrlCadContasOrc.CdsContasRef       := CdsContasRef;
  CtrlCadContasOrc.CdsDataView        := CdsDataView;
  CtrlCadContasOrc.CdsDet             := CdsDet;
  CtrlCadContasOrc.CdsDetCond         := CdsDetCond;
  CtrlCadContasOrc.CdsDetContaOrc     := CdsDetContaOrc;
  CtrlCadContasOrc.CdsDetContaRea     := CdsDetContaRea;
  CtrlCadContasOrc.CdsDetFluxo        := CdsDetFluxo;
  CtrlCadContasOrc.CdsGrupo           := CdsGrupo;
  CtrlCadContasOrc.CdsGrupoAux        := CdsGrupoAux;
  CtrlCadContasOrc.CdsMovOrcamento    := CdsMovOrcamento;
  CtrlCadContasOrc.CdsPatro           := CdsPatro;
  CtrlCadContasOrc.CdsPatroConta      := CdsPatroConta;
  CtrlCadContasOrc.CdsPlanoContabil   := CdsPlanoContabil;
  CtrlCadContasOrc.CdsPlanoPrev       := CdsPlanoPrev;
  CtrlCadContasOrc.CdsPlanoPrevConta  := CdsPlanoPrevConta;
  CtrlCadContasOrc.CdsTestaComposicao := CdsTestaComposicao;
  CtrlCadContasOrc.CdsTipoRD          := CdsTipoRD;
  CtrlCadContasOrc.CdsTodoDet         := CdsTodoDet;
  CtrlCadContasOrc.CdsUnidNegoc       := CdsUnidNegoc;
  CtrlCadContasOrc.CdsUnidNegocConta  := CdsUnidNegocConta;

  CtrlCadContasOrc.CdsFormulaApuracao := CdsFormulaApuracao;
  CdsFormulaApuracao.Data := CtrlCadFormulaApuraOrc.ListaFormulaApuraOrc();

  pgbStatus.Position := 2;

  CtrlCadContasOrc.AbreQueries;

  MontaSelectContaContab.Mascaras[0] := ParamIntegra.MascaraPlano + ';0; ';
  MontaSelectContaContab.Filtro.Add( 'PLANOCONTA.PLANO = ' + IntToStr( CtrlCadContasOrc.CdsAuxContab.FieldByName('PLANO').asInteger ) );

  //MontaSelect da Conta Orçamentária (Busca & Controle geral)
  MontaSelect.Filtro.Add('CONTASORCAMEN.IDPLANOORCAMEN = ' + IntToStr( Modulo.iPlanoOrc ) );

  pgbStatus.Visible := False;

  CdsPlanoPrev.data      := CtrlPlanPrevContabil.ListaPlanPrevContabil;
  CdsPlanoPrevConta.data := CtrlPlanPrevContabil.ListaPlanPrevContabil;

End;

//************************************************
Procedure TfrmCadContasOrcMT.FormShow(Sender: TObject);
Begin
 Inherited;

  CtrlCadContasOrc.sCodContaOrc := '';
  CtrlCadContasOrc.sConta       := '';
  CtrlCadContasOrc.bInicioConta := False;

  CtrlCadContasOrc.FazerQryPrincipal;
  CtrlCadContasOrc.iConsulta := -1;

  CtrlCadContasOrc.SelecionaFilhos;
  memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

  dbeGrupo.Mascara  := Modulo.sMascaraGrupo;

  //Seleciona o Plano de Contas
  cmccConta.Mascara := ParamIntegra.MascaraPlano;
  cmccConta.Plano   := ParamIntegra.Plano;
End;

//************************************************
Procedure TfrmCadContasOrcMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
Begin
  FreeAndNil(CtrlCadFormulaApuraOrc);

  Mensagem.Free;
  CtrlCadContasOrc.Free;

  CtrlPlanPrevContabPatro.Free;
  CtrlPlanPrevContabil.Free;
  Inherited;
End;
//************************************************
Procedure TfrmCadContasOrcMT.dbreFormulaOrcadoEnter(Sender: TObject);
Begin
   Inherited;

   //Inicializa a verificação da fórmula
   CtrlCadContasOrc.iPos         := length(dbreFormulaOrcado.text);
   CtrlCadContasOrc.bInicioConta := False;
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.iAbrePar     := 0;
   CtrlCadContasOrc.iFechaPar    := 0;
End;
//************************************************
Procedure TfrmCadContasOrcMT.dbreFormulaRealEnter(Sender: TObject);
Begin
   Inherited;

   //Inicializa a verificação da fórmula
   CtrlCadContasOrc.iPos         := length(dbreFormulaReal.text);
   CtrlCadContasOrc.bInicioConta := False;
   CtrlCadContasOrc.sConta       := '';
   CtrlCadContasOrc.iAbrePar     := 0;
   CtrlCadContasOrc.iFechaPar    := 0;
End;
//************************************************
Procedure TfrmCadContasOrcMT.dbreFormulaOrcadoExit(Sender: TObject);
Begin
  Inherited;

  If ( not CtrlCadContasOrc.VerificaFormula( dbreFormulaOrcado, MsgMsg) ) Then Begin

    MsgDlg( MsgMsg, 'Erro', mtError, [ mbOk ], 0 );
    if dbreFormulaOrcado.canFocus Then dbreFormulaOrcado.SetFocus;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.dbreFormulaRealExit(Sender: TObject);
Begin
  Inherited;

  If ( not CtrlCadContasOrc.VerificaFormula( dbreFormulaReal, MsgMsg ) ) Then Begin

    MsgDlg( MsgMsg, 'Erro', mtError, [ mbOk ], 0 );
    If dbreFormulaReal.canFocus Then dbreFormulaReal.SetFocus;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeCadastroInsert(Sender: TObject);
Begin
  Inherited;

  CtrlCadContasOrc.sCodContaOrc := '';
  memSQL.lines.text             := '';
  CtrlCadContasOrc.iConsulta    := -1;

  CtrlCadContasOrc.SelecionaFilhos;
  memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

  btnImportaContab.enabled  := true;
  dbeCodigoContaOrc.enabled := true;

  CtrlCadContasOrc.ValoresDefault;

  dbrdgSinal.itemIndex := 0;

  //Controla o TabSet de acordo com o cálculo
  HabilitaDetalheOrc;
  HabilitaDetalheRea;

  dbeCodigoContaOrc.Enabled := True;
  dbcboTipoCalcReal.Enabled := True;
  dbcboTipoCalcOrc.Enabled  := True;

  If dbeCodigoContaOrc.canFocus Then dbeCodigoContaOrc.SetFocus;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeCadastroEdit(Sender: TObject);
Begin
   Inherited;
   HabilitaDetalheOrc;
   HabilitaDetalheRea;
   if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeDetalheInsert(Sender: TObject);
Begin
  Inherited;
  if (Cds.State in ([dsInsert,dsEdit])) Then Begin

    if (pgctrlDetalhe.ActivePage.PageIndex = 0) Then Begin

      if dblcPlanoContabil.CanFocus Then dblcPlanoContabil.SetFocus;

    End Else if (pgctrlDetalhe.ActivePage.PageIndex = 2) Then Begin

      if dblcContaRefOrc.CanFocus Then dblcContaRefOrc.SetFocus;

    End Else if (pgctrlDetalhe.ActivePage.PageIndex = 3) Then Begin

      if dblcContaRefRea.CanFocus Then dblcContaRefRea.SetFocus;

    End Else if (pgctrlDetalhe.ActivePage.PageIndex = 4) Then Begin

      if dblcUnidNegoc.CanFocus Then dblcUnidNegoc.SetFocus;
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeDetalheEdit(Sender: TObject);
Begin
  Inherited;
  if (Cds.State in ([dsInsert,dsEdit])) Then Begin

    if trim(CdsDetFluxo.FieldByName('RECPAG').asString) <> '' then
    begin
      CdsTipoRD.Locate('CODTIPRECDES;RECPAG', VarArrayOf([CdsDetFluxo.fieldByName('CODTIPRECDES').asString, CdsDetFluxo.fieldByName('RECPAG').asString]), [loPartialKey]);
      dblcTipoRD.RefreshDisplay;
    end;

    if (pgctrlDetalhe.ActivePage.PageIndex = 0) Then Begin

      if dblcPlanoContabil.CanFocus Then dblcPlanoContabil.SetFocus;

    End Else if (pgctrlDetalhe.ActivePage.PageIndex = 2) Then Begin

      if dblcContaRefOrc.CanFocus Then dblcContaRefOrc.SetFocus;

    End Else if (pgctrlDetalhe.ActivePage.PageIndex = 3) Then Begin

      if dblcContaRefRea.CanFocus Then dblcContaRefRea.SetFocus;

    End Else if (pgctrlDetalhe.ActivePage.PageIndex = 4) Then Begin

      if dblcUnidNegoc.CanFocus Then dblcUnidNegoc.SetFocus;
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.HabilitaDetalheOrc;
Begin

   //Faz o controle do TabSet de acordo com o Tipo de Cálculo do Orcado
   tbsContasOrc.Enabled        := False;
   dbreFormulaOrcado.Enabled   := False;
   spbOrcado.Enabled           := False;
   gbValorInformadoOrc.Enabled := False;
   dbrgGeracaoDados.Enabled    := False;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'M') or (Cds.FieldByName('TIPOCALCORCADO').AsString = 'A') Then Begin
      dbreFormulaOrcado.Enabled := True;
      spbOrcado.Enabled         := True;
      btnTransf.enabled         := false;
   End;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'F') Then Begin
      tbsContasOrc.Enabled := True;
      btnTransf.enabled    := true;
   End;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'C') Then Begin
      tbsCond.Enabled   := True;
      btnTransf.enabled := false;
   End;

   if (Cds.FieldByName('TIPOCALCORCADO').AsString = 'I') Then Begin
      gbValorInformadoOrc.Enabled := True;
      dbrgGeracaoDados.Enabled    := True;
      btnTransf.enabled           := false;
   End;

End;
//************************************************
Procedure TfrmCadContasOrcMT.HabilitaDetalheRea;
Begin

   //Faz o controle do TabSet de acordo com o Tipo de Cálculo do Realizado
   tbsFluxoCaixa.Enabled       := False;
   tbsDet.Enabled              := False;
   tbsContaRea.Enabled         := False;
   tbsArquivoGen.Enabled       := False;
   dbreFormulaReal.Enabled     := False;
   spbRealizado.Enabled        := False;
   gbValorInformadoRea.Enabled := False;
   dbrgGeracaoDados.Enabled    := False;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'M') or (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'A') Then Begin
     dbreFormulaReal.Enabled := True;
     spbRealizado.Enabled    := True;
     btnTransf.enabled       := false;
   End;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'X') Then Begin
      tbsFluxoCaixa.Enabled := True;
      btnTransf.enabled     := false;
   End;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'I') Then Begin
      gbValorInformadoRea.Enabled := True;
      dbrgGeracaoDados.Enabled    := True;
      btnTransf.enabled           := false;
   End;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'P') Then Begin
      tbsDet.Enabled    := True;
      btnTransf.enabled := false;
   End;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'F') Then Begin
      tbsContaRea.Enabled := True;
      btnTransf.enabled   := true;
   End;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'C') Then Begin
      tbsCond.Enabled   := True;
      btnTransf.enabled := false;
   End;

   if (Cds.FieldByName('TIPOCALCREALIZADO').AsString = 'G') Then Begin
      tbsArquivoGen.Enabled := True;
      //btnCriaSQL.Enabled    := True;
      btnTransf.enabled     := false;
   End Else Begin
      memSQL.lines.text     := '';
   End;

End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeCadastroConfirma(Sender: TObject);
Begin

  CtrlCadContasOrc.CadastroConfirma( dbeCodigoContaOrc.Text,
                                     MemSQL.Lines.Text );
  btnImportaContab.enabled := false;
  Inherited;

  btnTransf.enabled := false;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeCadastroCancel(Sender: TObject);
Begin
  Inherited;

  btnImportaContab.enabled := false;
  btnTransf.enabled        := false;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeCadastroDelete(Sender: TObject);
Var
  Excluir : Boolean;

Begin

  Excluir := True;
  Try
    CtrlCadContasOrc.AbreQryMovOrcamento;

    If ( Not CdsMovOrcamento.IsEmpty ) Then Begin

      Excluir := ( MsgDlg( 'Esta conta tem Orçamento lançado para ela. Deseja excluir assim mesmo?',
                           'Confirmação', mtConfirmation, [ mbNo, mbYes], 0 ) = mrYes );
    End;
  Finally

    If ( Excluir ) Then Begin

      CtrlCadContasOrc.CadastroDelete;

      CdsDet.EmptyDataSet;
      CdsDetFluxo.EmptyDataSet;
      CdsDetContaOrc.EmptyDataSet;
      CdsDetcontaRea.EmptyDataSet;

      memSQL.Text := '';
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeCadastroFind(Sender: TObject);
Begin

  //Abre a Busca e seleciona os registros filhos da Conta Orçamentária
  Repaint;

  If (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') Then Begin

    if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
    CtrlCadContasOrc.sCodContaOrc := MontaSelect.ValoresChave[1];

    CtrlCadContasOrc.FazerQryPrincipal;
    CtrlCadContasOrc.iConsulta := Cds.FieldByName('IDDATAVIEW').asInteger;

    CtrlCadContasOrc.SelecionaFilhos;
    memSQL.lines.text := CtrlCadContasOrc.CdsDataView.FieldByName('TEMPLATE').asString;

    if Cds.FieldByName('FLGATIVA').asString = 'I' Then Begin

      dteDataInativa.enabled := true;
      dteDataAtiva.enabled   := true;
    End;
  End;

  dbeCodigoContaOrc.enabled := false;

End;
//************************************************
Procedure TfrmCadContasOrcMT.bbtnConfirmarClick(Sender: TObject);
var
  SaveCursor : TCursor;
Begin

  //Verifica o preenchimento dos campos obrigatórios

  if (Cds.FieldByName('TIPOCALCORCADO').AsString <> 'V') and
     (not Cds.FieldByName('IDFORMORCADO').IsNull) then
    begin
      MsgDlg('Somente Contas Orçamentárias com Tipo de Cálculo Orçado' +#13+
             'igual a Valor Informado Manualmente podem possuir Fórmula' +#13+
             'de Apuração cadastrada!','Erro',mtError,[mbOk],0);
      if DbLkFormulaApuracao.CanFocus then
        DbLkFormulaApuracao.SetFocus;
      EXIT;
    end;

  If dbeCodigoContaOrc.text = '' Then Begin
    MsgDlg('Obrigatório preencher o número da Conta.','Erro',mtError,[mbOk],0);
    if dbeCodigoContaOrc.canFocus Then dbeCodigoContaOrc.SetFocus;
    exit;
  End;

  If trim(dbeNomeContaOrc.text) = '' Then Begin
    MsgDlg('Obrigatório preencher o nome da Conta.','Erro',mtError,[mbOk],0);
    if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
    exit;
  End;

  If ( Cds.FieldByName( 'IDGRUPOORCAMEN' ).IsNull ) Or
     ( Cds.FieldByName( 'IDGRUPOORCAMEN' ).AsInteger < 1 ) Then Begin

    MsgDlg('Obrigatório preencher o Grupo a que esta Conta pertence.','Erro',mtError,[mbOk],0);
    if dbeGrupo.canFocus Then dbeGrupo.SetFocus;
    exit;
  End;

  if dbrdgSinal.ItemIndex < 0 Then Begin
    MsgDlg('Obrigatório selecionar se a Conta é de valor Positivo ou Negativo.','Erro',mtError,[mbOk],0);
    if dbrdgSinal.canFocus Then dbrdgSinal.SetFocus;
    exit;
  End;

  if dbcboCalcValor.ItemIndex < 0 Then Begin
    MsgDlg('Obrigatório selecionar o Tipo de Cálculo dos Valores Acumulados.','Erro',mtError,[mbOk],0);
    if dbcboCalcValor.canFocus Then dbcboCalcValor.SetFocus;
    exit;
  End;

  try
    SaveCursor := Screen.Cursor;
    Screen.Cursor := crHourglass;

    EnableAllCdsControls( False );

    if not CtrlCadContasOrc.VerificaLinhaGrid( CtrlCadContasOrc.CdsDet, 0, 0, 'Conta Contábil', true) Then Begin
      if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
      MsgDlg( CtrlCadContasOrc.MessageInfo,'Aviso', mtWarning,[ mbOk ], 0 );
      exit;
    End;

    if not CtrlCadContasOrc.VerificaLinhaGrid( CtrlCadContasOrc.CdsDetContaOrc, 0, 0, 'Composição de Contas Orçado', true ) Then Begin
      if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
      MsgDlg( CtrlCadContasOrc.MessageInfo,'Aviso', mtWarning,[ mbOk ], 0 );
      exit;
    End;

    if not CtrlCadContasOrc.VerificaLinhaGrid( CtrlCadContasOrc.CdsDetContaRea, 0, 0, 'Composição de Contas Orçado', true) Then Begin
      if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
      MsgDlg( CtrlCadContasOrc.MessageInfo,'Aviso', mtWarning,[ mbOk ], 0 );
      exit;
    End;

    if not CtrlCadContasOrc.VerificaLinhaGrid( CtrlCadContasOrc.CdsDetFluxo, 0, 0, 'Fluxo de Caixa', true) Then Begin
      if dbeNomeContaOrc.canFocus Then dbeNomeContaOrc.SetFocus;
      MsgDlg( CtrlCadContasOrc.MessageInfo,'Aviso', mtWarning,[ mbOk ], 0 );
      exit;
    End;

    pgbStatus.Visible          := True;
    CtrlCadContasOrc.ProcessaConfirma;

  finally
    Screen.Cursor := SaveCursor;
    EnableAllCdsControls( True );
  end;

  pgbStatus.Visible := False;
  Inherited;
End;
//************************************************
Procedure TfrmCadContasOrcMT.spbOrcadoClick(Sender: TObject);
Begin
  Inherited;

  //Busca uma Conta Orçamentária para colocar na fórmula do Orçado
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') Then Begin
     dbreFormulaOrcado.Text := dbreFormulaOrcado.Text + trim(MontaSelect.ValoresChave[1]);
  End;

  If ( Not ( Cds.State in ( [ dsInsert, dsEdit ] ) ) ) Then Begin

    Cds.Edit;
  End;

  Cds.FieldByName('FORMULAORCADO').AsString := dbreFormulaOrcado.Text;
  if dbreFormulaOrcado.canFocus Then dbreFormulaOrcado.SetFocus;
End;
//************************************************
Procedure TfrmCadContasOrcMT.spbRealizadoClick(Sender: TObject);
Begin
  Inherited;

  //Busca uma Conta Orçamentária para colocar na fórmula do Realizado
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') Then Begin
     dbreFormulaReal.Text := dbreFormulaReal.Text + trim(MontaSelect.ValoresChave[1]);
  End;

  Cds.FieldByName('FORMULAREALIZADO').AsString := dbreFormulaReal.Text;
  if dbreFormulaReal.canFocus Then dbreFormulaReal.SetFocus;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CmeDetalheConfirma(Sender: TObject);
var
  rPerc : Double;
Begin
  With CtrlCadContasOrc.dtmCadContasOrcamen Do Begin

    if (Cds.State in ([dsInsert,dsEdit])) Then Begin

      if (pgctrlDetalhe.ActivePage.PageIndex = 0) and (CdsDet.State in ([dsInsert,dsEdit])) Then Begin

        if cmccConta.Valida <> VcOK Then Begin
          if cmccConta.canFocus Then cmccConta.SetFocus;

          exit;
        End;

        CdsDet.FieldByName('IDCONTAORCAMEN').AsString  := Cds.FieldByName('IDCONTAORCAMEN').AsString;
        CdsDet.FieldByName('IDPLANOORCAMEN').AsInteger := Cds.FieldByName('IDPLANOORCAMEN').AsInteger;

        CdsDet.FieldByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
        CdsDet.FieldByName('IDEMPRESA').AsInteger  := Sistema.IdEmpresa;
        CdsDet.FieldByName( 'PLANOME' ).AsString   := dblcPlanoContabil.Text;
        CdsDet.FieldByName( 'NOMECC' ).AsString    := dblcCCusto.Text;
        CdsDet.FieldByName( 'NOMEAP' ).AsString    := dblcAtividade.Text;
        CdsDet.FieldByName( 'NOMEPLANO' ).AsString := dblcPlanoPrevC.Text;
        CdsDet.FieldByName( 'NOMEPATRO' ).AsString := dblcPatroC.Text;
        CdsDet.FieldByName( 'DESCPLANO' ).AsString := CdsPlanoContabil.FieldByName( 'DESCPLANO' ).AsString;
      End;

      If (pgctrlDetalhe.ActivePage.PageIndex = 2) and (CdsDetContaOrc.State in ([dsInsert,dsEdit])) Then Begin

        CdsDetContaOrc.FieldByName( 'NOMECONTAORCAMEN' ).AsString := CdsContasOrc.FieldByName( 'NOMECONTAORCAMEN' ).AsString;

        If trim(edConteudo1.Text) <> '' Then Begin

          rPerc := dbrPercOrc.Value;

          CtrlCadContasOrc.ProcessaDetalheConfirma1( sePosIni1.Value,
                                                     sePosFim1.Value,
                                                     edConteudo1.Text,
                                                     rPerc );
          edConteudo1.Text := '';
          sePosIni1.Value  := 0;
          sePosFim1.Value  := 0;
        End;
      End;

      If (pgctrlDetalhe.ActivePage.PageIndex = 3) and (CdsDetContaRea.State in ([dsInsert,dsEdit])) Then Begin

        CdsDetContaRea.FieldByName( 'NOMECONTAORCAMEN' ).AsString := CdsContasOrc.FieldByName( 'NOMECONTAORCAMEN' ).AsString;

        If trim(edConteudo2.Text) <> '' Then Begin

          rPerc := dbrPercOrc.Value;

          CtrlCadContasOrc.ProcessaDetalheConfirma2( sePosIni2.Value,
                                                     sePosFim2.Value,
                                                     edConteudo2.Text,
                                                     rPerc );
          edConteudo2.Text := '';
          sePosIni2.Value  := 0;
          sePosFim2.Value  := 0;
        End;
      End;

      If (pgctrlDetalhe.ActivePage.PageIndex = 4) and (CdsDetFluxo.State in ([dsInsert,dsEdit])) Then Begin

        If trim(dblcTipoRD.Text) = '' Then Begin

          MsgDlg('Obrigatório preencher o Tipo de Recebimento/Desembolso.','Erro',mtError,[mbOk],0);
          If dblcTipoRD.canFocus Then dblcTipoRD.SetFocus;
          exit;
        End;

        CdsDetFluxo.FieldByName( 'RECPAG' ).AsString     := CdsTipoRD.FieldByName('RECPAG').AsString;
        CdsDetFluxo.FieldByName( 'IDPESSOA' ).AsInteger  := Sistema.IdEmpresa;
        CdsDetFluxo.FieldByName( 'IDEMPRESA' ).AsInteger := Sistema.IdEmpresa;
        CdsDetFluxo.FieldByName( 'NOMECC' ).AsString     := dblkCCustoFluxo.Text;
        CdsDetFluxo.FieldByName( 'NOMEAP' ).AsString     := dblcUnidNegoc.Text;
        CdsDetFluxo.FieldByName( 'NOMECR' ).AsString     := dblcCentroRespon.Text;
        CdsDetFluxo.FieldByName( 'NOMETR' ).AsString     := dblcTipoRD.Text;
        CdsDetFluxo.FieldByName( 'NOMEPLANO' ).AsString  := dblcPlanPrevF.Text;
        CdsDetFluxo.FieldByName( 'NOMEPATRO' ).AsString  := dblcPatroF.Text;
      End;

      If (pgctrlDetalhe.ActivePage.PageIndex = 6) and ( CdsDetCond.State in ([dsInsert,dsEdit])) Then Begin

        If trim(dblkContaIni.Text) = '' Then Begin

          MsgDlg('Obrigatório preencher a Conta Inicial da Condição.','Erro',mtError,[mbOk],0);

          If dblkContaIni.canFocus Then dblkContaIni.SetFocus;
          exit;
        End;

        If trim(dbcboCondicao.Text) = '' Then Begin

          MsgDlg('Obrigatório preencher a Condição.','Erro',mtError,[mbOk],0);
          If dbcboCondicao.canFocus Then dbcboCondicao.SetFocus;
          exit;
        End;

        If trim(dbcboTipoIni.Text) = '' Then Begin

          MsgDlg('Obrigatório preencher o Tipo Inicial.','Erro',mtError,[mbOk],0);
          If dbcboTipoIni.canFocus Then dbcboTipoIni.SetFocus;
          exit;
        End;

        If trim(dbcboTipoRes.Text) = '' Then Begin

          MsgDlg('Obrigatório preencher o Tipo do Resultado.','Erro',mtError,[mbOk],0);
          If dbcboTipoRes.canFocus Then dbcboTipoRes.SetFocus;
          exit;
        End;
      End;
    End;
  End;
  Inherited;
End;                                                        
//************************************************
Procedure TfrmCadContasOrcMT.dblcContaRefOrcEnter(Sender: TObject);
Begin
  Inherited;
  CdsContasOrc.Data := CtrlCadContasOrc.ListaContasOrcamen(Modulo.iPlanoOrc);


  CdsContasOrc.Locate('IDCONTAORCAMEN',
                      CdsDetContaOrc.FieldByName('IDCONTAREFORCADO').AsString,
                      []);
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcContaRefReaEnter(Sender: TObject);
Begin
  Inherited;

End;

//************************************************
Procedure TfrmCadContasOrcMT.dblkContaFimEnter(Sender: TObject);
begin
  inherited;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblkContaResEnter(Sender: TObject);
Begin
  Inherited;
End;

//************************************************
Procedure TfrmCadContasOrcMT.btnImportaContabClick(Sender: TObject);
var
  sConta,
  pdbeNomeContaOrc,
  pdbeCodigoContaOrc : string;

Begin
  Inherited;

  CtrlCadContasOrc.AbreqryAuxContab;

  MontaSelectContaContab.Executar;
  Repaint;
  If MontaSelectContaContab.RetornouValor Then Begin

    pdbeNomeContaOrc   := dbeNomeContaOrc.text;
    pdbeCodigoContaOrc := dbeCodigoContaOrc.text;
    sConta             := MontaSelectContaContab.ValoresChave[0];

    CtrlCadContasOrc.btnImportaContabClick( pdbeNomeContaOrc,
                                            pdbeCodigoContaOrc,
                                            sConta );

    dbeNomeContaOrc.text   := pdbeNomeContaOrc;
    dbeCodigoContaOrc.text := pdbeCodigoContaOrc;
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbcboTipoIniCloseUp(Sender: TwwDBComboBox; Select: Boolean);
Begin
   Inherited;
   if dbcboTipoIni.Text = 'ao Valor' Then Begin
      dbrValorIni.enabled := true;
      dblkContaFim.enabled := false;
   End Else Begin
      dbrValorIni.enabled := false;
      dblkContaFim.enabled := true;
   End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.dbcboTipoResCloseUp(Sender: TwwDBComboBox; Select: Boolean);
Begin
  Inherited;
   if dbcboTipoRes.Text = 'ao Valor' Then Begin
      dbrValorRes.enabled := true;
      dblkContaRes.enabled := false;
   End Else Begin
      dbrValorRes.enabled := false;
      dblkContares.enabled := true;
   End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.btnCriaSQLClick(Sender: TObject);
Begin
  Inherited;

  if memSQL.Lines.text <> '' Then Begin

    if MsgDlg( 'Deseja reescrever a Consulta?', 'Pergunta', mtConfirmation, [ mbYes, mbNo ], 0 ) = mrYes Then Begin

      CriaConsulta;
    End;
  End Else Begin

    CriaConsulta;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcMT.CriaConsulta;
Begin
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbcboTipoCalcRealCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
Begin
  Inherited;

  HabilitaDetalheRea;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbcboTipoCalcOrcCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
Begin
  Inherited;
  HabilitaDetalheOrc;

  if Cds.FieldByName('TIPOCALCORCADO').AsString <> 'V' then
    begin
      Cds.FieldByName('IDFORMORCADO').Clear;
    end;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbcboTipoCalcOrcExit(Sender: TObject);
Begin
  Inherited;

  HabilitaDetalheOrc;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbcboTipoCalcRealExit(Sender: TObject);
Begin
  Inherited;

  HabilitaDetalheRea;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbchkInativaClick(Sender: TObject);
Begin
   Inherited;

   dteDataInativa.enabled := true;
   dteDataAtiva.enabled   := true;
End;

//************************************************
Procedure TfrmCadContasOrcMT.FormActivate(Sender: TObject);
Begin
  Inherited;

  If Not Sistema.UsaPlanoPatro Then Begin
     pnlPlanoPatroF.Visible := False;
     pnlPlanoPatroC.Visible := False;
     pnlPlanoPatroP.Visible := False;
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.btnTransfClick(Sender: TObject);
Begin
  Inherited;

  With CtrlCadContasOrc Do Begin
    if ( CdsDetContaOrc.isEmpty) and (CdsDetContaRea.isEmpty) Then Begin
      MsgDlg('A Composição do Orçado e a Composição do Realizado estão vazias.' + CHR(13) +
               'Transferência não realizada.','Aviso',mtWarning,[mbOk],0);
      exit;
    End;

    if CdsDetContaOrc.isEmpty Then Begin

      ProcessabtnTransfClick1;

    End Else Begin

      ProcessabtnTransfClick2;
    End;
  End;

  MsgDlg('Transferência realizada com sucesso.','Aviso',mtInformation,[mbOk],0);
End;

//************************************************
Procedure TfrmCadContasOrcMT.dbeGrupoExit(Sender: TObject);
Begin
  Inherited;
  If ( ActiveControl.Tag <> 999 ) Then Begin

    If ( dbeGrupo.Valida <> VcOK ) Then Begin

      dbeGrupo.SetFocus
    End Else Begin

      Cds.FieldByName('IDGRUPOORCAMEN' ).AsInteger := CdsGrupo.FieldByName('IDGRUPOORCAMEN' ).AsInteger;

      If ( Cds.State = dsInsert ) And
         ( Not CdsGrupo.FieldByName('FLGSINALGRUPO' ).isNull ) Then Begin

        Cds.FieldByName('FLGSINALCONTA' ).AsString := CdsGrupo.FieldByName('FLGSINALGRUPO' ).AsString;
      End;
    End;;
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcPlanoContabilCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;
  if trim(dblcPlanoContabil.Text) <> '' Then Begin
     cmccConta.Plano   := StrToInt(dblcPlanoContabil.LookUpValue);
     cmccConta.Mascara := CtrlCadContasOrc.CdsPlanoContabil.FieldByName('MASCARA').AsString;
  End Else Begin
     cmccConta.Mascara := ParamIntegra.MascaraPlano;
     cmccConta.Plano   := ParamIntegra.Plano;
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcPlanoContabilExit(Sender: TObject);
Begin
  Inherited;
  if trim(dblcPlanoContabil.Text) <> '' Then Begin
     cmccConta.Plano   := StrToInt(dblcPlanoContabil.LookUpValue);
     cmccConta.Mascara := CtrlCadContasOrc.CdsPlanoContabil.FieldByName('MASCARA').AsString;
  End Else Begin
     cmccConta.Mascara := ParamIntegra.MascaraPlano;
     cmccConta.Plano   := ParamIntegra.Plano;
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.MensagemChange(Sender: TObject);
Begin
  Inherited;

  If ( Mensagem.Text <> '' ) Then Begin

    CtrlCadContasOrc.Confirmado := ( mrYes = Msgdlg( Mensagem.Text, 'Confirmação', mtConfirmation, [ mbNo, mbYes ], 0 ) );
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.AtualizaLlbAtividade( Var lblLocal   : TLabel;
                                                     pUNETIPO   : String;
                                                     pATIVIDADE : String );
Begin

  If ( pATIVIDADE = '' ) Then

    lblLocal.Caption := ''

  Else If ( pUNETIPO = 'A' ) Then

    lblLocal.Caption := 'Analítico'

  Else If ( pUNETIPO = 'S' ) Then Begin

    lblLocal.Caption := 'Sintético';
    MsgDlg( 'Foi selecionado um grupo SINTÉTICO', 'Aviso', mtWarning, [ mbOk ], 0 );

  End Else Begin

    lblLocal.Caption := '';
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.tbsDetShow(Sender: TObject);
Begin

  AtualizaLlbAtividade( lblAtividade1,
                        CdsUnidNegoc.FieldByName( 'UNETIPO' ).AsString,
                        dblcAtividade.Text );
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcAtividadeCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If ( Modified ) Then Begin

    AtualizaLlbAtividade( lblAtividade1,
                          CdsUnidNegoc.FieldByName( 'UNETIPO' ).AsString,
                          dblcAtividade.Text );
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcAtividadeExit(Sender: TObject);
Begin

  AtualizaLlbAtividade( lblAtividade1,
                        CdsUnidNegoc.FieldByName( 'UNETIPO' ).AsString,
                        dblcAtividade.Text );
End;

//************************************************
Procedure TfrmCadContasOrcMT.tbsFluxoCaixaShow(Sender: TObject);
Begin
  Inherited;

  AtualizaLlbAtividade( lblAtividade2,
                        CdsUnidNegoc.FieldByName( 'UNETIPO' ).AsString,
                        dblcUnidNegoc.Text );
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcUnidNegocCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If ( Modified ) Then Begin

    AtualizaLlbAtividade( lblAtividade2,
                          CdsUnidNegoc.FieldByName( 'UNETIPO' ).AsString,
                          dblcUnidNegoc.Text );
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcUnidNegocExit(Sender: TObject);
Begin
  Inherited;

  AtualizaLlbAtividade( lblAtividade2,
                        CdsUnidNegoc.FieldByName( 'UNETIPO' ).AsString,
                        dblcUnidNegoc.Text );
End;

//************************************************
Procedure TfrmCadContasOrcMT.TabSheet1Show(Sender: TObject);
Begin
  Inherited;

  AtualizaLlbAtividade( lblAtividade3,
                        CdsUnidNegocConta.FieldByName( 'UNETIPO' ).AsString,
                        dblcAtivParamConta.Text );
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcAtivParamContaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
  Inherited;

  If ( Modified ) Then Begin

    AtualizaLlbAtividade( lblAtividade3,
                          CdsUnidNegocConta.FieldByName( 'UNETIPO' ).AsString,
                          dblcAtivParamConta.Text );
  End;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcAtivParamContaExit(Sender: TObject);
Begin
  Inherited;

  AtualizaLlbAtividade( lblAtividade3,
                        CdsUnidNegocConta.FieldByName( 'UNETIPO' ).AsString,
                        dblcAtivParamConta.Text );
End;

//************************************************
PRocedure TfrmCadContasOrcMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
Begin

  Accept := False;
  If ( dbcboTipoCalcReal.Value = 'X' ) And
     ( CdsDetFluxo.IsEmpty ) Then Begin

    MsgDlg( 'Foi escolhido tipo de cálculo realizado "Fluxo de Caixa" e não foram informados parâmetros para o mesmo', 'Aviso', mtWarning, [ mbOk ], 0 );
    Exit;
  End;

  if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(strToIntDef(dblcPatroParamConta.LookupValue, -1), strToIntDef(wwDBLookupCombo1.LookupValue, -1)) then
  begin
    MsgDlg( MsgMsg, 'Plano previdenciário e patrocinadora não relacionados.', mtError, [ mbOk ], 0 );
    Accept := false;
    Exit;
  end;


  Accept := True;
  Inherited;
End;

//************************************************
Procedure TfrmCadContasOrcMT.dblcCCustoEnter(Sender: TObject);
Begin
  Inherited;

End;

//************************************************
procedure TfrmCadContasOrcMT.EnableAllCdsControls(bEnable: boolean);
var
  i : integer;
begin
  for i := 0 to ( ComponentCount - 1 ) do
    if ( Components[i] is TClientDataSet ) then
    begin
      if bEnable then
        ( Components[i] as TClientDataSet ).EnableControls
      else
        ( Components[i] as TClientDataSet ).DisableControls;
    end;
end;


End.
