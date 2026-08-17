Unit
  FCadContasOrcPorGrupo2;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, ToolWin, StdCtrls, Wwdbspin, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, CMProcuraMask, Db, Wwdatsrc, uCmSqlParams, DBClient,
  uCMClientDataSet, TB97Ctls, ImgList, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, uCtrlCadContasOrcPorGrupo,
  FAguarde, MontaSelect, TREdit, Grids, DBGrids, Math, uRecCodigo;

Type
  TfrmCadContasOrcPorGrupo2MT = class(TfrmOkCancelar)
    ImlPadrao: TImageList;
    imgBotoes: TImageList;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    CdsCentroDeCusto: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsGrupoOrc: TCMClientDataSet;
    pnlUm: TPanel;
    Label1: TLabel;
    edtConta: TEdit;
    btnProcurar: TBitBtn;
    pgcCompo: TPageControl;
    tbsCodigo: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosIni5: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    sePosFim5: TwwDBSpinEdit;
    cboParaCada1: TwwDBComboBox;
    cboParaCada2: TwwDBComboBox;
    cboParaCada3: TwwDBComboBox;
    cboParaCada4: TwwDBComboBox;
    cboParaCada5: TwwDBComboBox;
    edConteudo1: TDBRealEdit;
    edConteudo2: TDBRealEdit;
    edConteudo3: TDBRealEdit;
    edConteudo4: TDBRealEdit;
    edConteudo5: TDBRealEdit;
    tbsCentroCusto: TTabSheet;
    ltvCCDisponiveis: TListView;
    ltvCCSelecionados: TListView;
    ToolBar1: TToolBar;
    btnCCDisponiveis: TToolButton;
    btnCCSelecionados: TToolButton;
    btnCCDisponiveisTodos: TToolButton;
    btnCCSelecionadosTodos: TToolButton;
    BtnCCRefresh: TToolButton;
    tbsAtividade: TTabSheet;
    ltvAPDisponiveis: TListView;
    ltvapSelecionados: TListView;
    ToolBar2: TToolBar;
    btnAPDisponiveis: TToolButton;
    btnAPSelecionados: TToolButton;
    btnAPDisponiveisTodos: TToolButton;
    btnAPSelecionadosTodos: TToolButton;
    btnAPRefresh: TToolButton;
    tbsPlanoPrev: TTabSheet;
    ltvPPDisponiveis: TListView;
    ltvPPSelecionados: TListView;
    ToolBar3: TToolBar;
    btnPPDisponiveis: TToolButton;
    btnPPSelecionados: TToolButton;
    btnPPDisponiveisTodos: TToolButton;
    btnPPSelecionadosTodos: TToolButton;
    btnPPRefresh: TToolButton;
    tbsPatro: TTabSheet;
    ltvPTDisponiveis: TListView;
    ltvPTSelecionados: TListView;
    ToolBar4: TToolBar;
    btnPTDisponiveis: TToolButton;
    btnPTSelecionados: TToolButton;
    btnPTDisponiveisTodos: TToolButton;
    btnPTSelecionadosTodos: TToolButton;
    btnPTRefresh: TToolButton;
    MontaSelect: TMontaSelect;
    tbsGrupoOrc: TTabSheet;
    sttNomeConta: TStaticText;
    ToolBar5: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    BtnGORefresh: TToolButton;
    ltvGODisponiveis: TListView;
    ltvGOSelecionados: TListView;
    btnCORefresh: TBitBtn;
    CdsBase: TCMClientDataSet;
    CdsBaseBASGRUP: TStringField;
    CdsBaseBASCENT: TStringField;
    CdsBaseBASATIV: TStringField;
    CdsBaseBASPLAN: TStringField;
    CdsBaseBASPATR: TStringField;
    CdsBaseBASCONTA: TStringField;
    tbsStatus: TTabSheet;
    dbgBase: TDBGrid;
    sttLinhas: TStaticText;
    CdsOrigem: TCMClientDataSet;
    tbsCampos: TTabSheet;
    ltvCPDisponiveis: TListView;
    ltvCPSelecionados: TListView;
    ToolBar6: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    memStatus: TMemo;
    Label3: TLabel;
    dtsBase: TDataSource;
    rdgAcao: TRadioGroup;
    CdsBaseBASQUANT: TIntegerField;
    CdsBaseBASGRUPTXT: TStringField;
    CdsBaseBASCENTTXT: TStringField;
    CdsBaseBASATIVTXT: TStringField;
    CdsBaseBASPLANTXT: TStringField;
    CdsBaseBASPATRTXT: TStringField;
    btnFiltrar: TSpeedButton;
    gpbSequencialFixo1: TGroupBox;
    rdgSequencial1: TRadioButton;
    rdgFixo1: TRadioButton;
    gpbSequencialFixo2: TGroupBox;
    rdgSequencial2: TRadioButton;
    rdgFixo2: TRadioButton;
    gpbSequencialFixo3: TGroupBox;
    rdgSequencial3: TRadioButton;
    rdgFixo3: TRadioButton;
    gpbSequencialFixo4: TGroupBox;
    rdgSequencial4: TRadioButton;
    rdgFixo4: TRadioButton;
    gpbSequencialFixo5: TGroupBox;
    rdgSequencial5: TRadioButton;
    rdgFixo5: TRadioButton;
    btnMostrarContas: TSpeedButton;
    CdsContas: TCMClientDataSet;
    dtsContas: TDataSource;
    dbgContas: TDBGrid;
    Procedure FormCreate(Sender: TObject);
    Procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure BtnCCRefreshClick(Sender: TObject);
    Procedure btnAPRefreshClick(Sender: TObject);
    Procedure btnPPRefreshClick(Sender: TObject);
    Procedure btnPTRefreshClick(Sender: TObject);
    Procedure sbtnInserirClick(Sender: TObject);
    Procedure sbtnAlterarClick(Sender: TObject);
    Procedure sbtnApagarClick(Sender: TObject);
    Procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);

    Procedure DisponiveisClick(Sender: TObject);
    Procedure DisponiveisTodosClick(Sender: TObject);
    Procedure SelecionadosClick(Sender: TObject);
    Procedure SelecionadosTodosClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure BtnGORefreshClick(Sender: TObject);
    procedure btnCORefreshClick(Sender: TObject);
    procedure TestaTipoDoCbo(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure sePosIni2Change(Sender: TObject);
    procedure sePosIni3Change(Sender: TObject);
    procedure sePosIni4Change(Sender: TObject);
    procedure sePosFim1Change(Sender: TObject);
    procedure sePosFim2Change(Sender: TObject);
    procedure sePosFim3Change(Sender: TObject);
    procedure sePosFim4Change(Sender: TObject);
    procedure sePosFim2AfterUpClick(Sender: TObject);
    procedure sePosFim3AfterUpClick(Sender: TObject);
    procedure sePosFim4AfterUpClick(Sender: TObject);
    procedure sePosFim5AfterUpClick(Sender: TObject);
    procedure sePosFim2AfterDownClick(Sender: TObject);
    procedure sePosFim3AfterDownClick(Sender: TObject);
    procedure sePosFim4AfterDownClick(Sender: TObject);
    procedure ltvDisponiveisDblClick(Sender: TObject);
    procedure ltvSelecionadosDblClick(Sender: TObject);
    procedure edtContaExit(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure rdgSequencialClick(Sender: TObject);
    Procedure rdgFixoClick(Sender: TObject);
    procedure btnMostrarContasClick(Sender: TObject);
  Private
    { Private declarations }
    CtrlCadContasOrcPorGrupo : TCtrlCadContasOrcPorGrupo;
    Operacao                 : Integer;
    arrCodigo                : Array Of TrecCodigo;

    Function  MontaBase : Boolean;

    Procedure MoverDePara( ltvDisp,
                           ltvSelec : TListView );
    Procedure Carregar( pCdsLocal : TClientDataSet;
                        pLtvLocal : TListView;
                        pCampo    : String);
    Procedure IncluirEm(pLtvDestino: TListView; pCaption,
      pSubItems0: String);
    Procedure RetirarDe(pLtvDestino: TListView; pPosicao: Integer);
    Procedure AtuaSequencial( pItem : String;
                              pSeq,
                              pFix  : TRadioButton;
                              pGru  : TGroupBox );
    Procedure btnFiltrarDesativar;
    Procedure btnFiltrarAtivar;
    Function  ValidaFormacao : Boolean;
    Function TestaSelecionados( pOrigem : String;
                                pLtv    : TListView;
                                Var pMaximo : Integer ): Boolean;
    Procedure EsconderDbgContas;
  Public
    { Public declarations }
  End;

Const
  opInativo = 0;
  opInsere  = 1;
  opaltera  = 2;
  opExclui  = 3;

  AcEstimar     = 0;
  AcEstimarAgir = 1;
  AcAgir        = 2;

Var
  frmCadContasOrcPorGrupo2MT: TfrmCadContasOrcPorGrupo2MT;

Implementation

Uses
  uSistema, dBaseDados, uModulo, uMensErro;

{$R *.DFM}
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.FormCreate(Sender: TObject);
Begin
  Inherited;
  memStatus.Clear;
  sttLinhas.Caption := '';
  CtrlCadContasOrcPorGrupo := TCtrlCadContasOrcPorGrupo.Create;
  CtrlCadContasOrcPorGrupo.Initialize( DtmBaseDados.dbBaseDados, True,
                                     Sistema.ConnectionType,   Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,  True, nil, nil, False );
  CtrlCadContasOrcPorGrupo.pIdEmpresa      := Sistema.IdEmpresa;
  CtrlCadContasOrcPorGrupo.pPlano          := Modulo.iPlanoOrc;
  CtrlCadContasOrcPorGrupo.CdsGrupoOrc     := CdsGrupoOrc;
  CtrlCadContasOrcPorGrupo.CdsAtivProj     := CdsAtivProj;
  CtrlCadContasOrcPorGrupo.CdsCentroDeCusto:= CdsCentroDeCusto;
  CtrlCadContasOrcPorGrupo.CdsPlanoPrev    := CdsPlanoPrev;
  CtrlCadContasOrcPorGrupo.CdsPatro        := CdsPatro;
  CtrlCadContasOrcPorGrupo.CdsBase         := CdsBase;
  CtrlCadContasOrcPorGrupo.CdsOrigem       := CdsOrigem;
  CtrlCadContasOrcPorGrupo.CdsConta        := CdsContas;
  CtrlCadContasOrcPorGrupo.memStatus       := memStatus;

  frmAguarde.Mostra( 'Lendo Grupo Orçamentário    ');
  BtnGORefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Centro de Custo       ');
  BtnCCRefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Atividade/Projeto     ');
  BtnAPRefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Plano Previdenciário');
  BtnPPRefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Patrocinadora         ');
  BtnPTRefreshClick( Self );

  frmAguarde.Apaga;
  bbtnCancelarClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;
  CdsBase.Close;
  CtrlCadContasOrcPorGrupo.Free;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sbtnInserirClick(Sender: TObject);
Begin
  Operacao            := opInsere;
  tbsCampos.Enabled   := False;
  tbsGrupoOrc.Enabled := False;
  pnlUm.Enabled       := True;
  pgcCompo.Enabled    := True;
  Toolbar971.Enabled  := False;

  pgcCompo.ActivePage := tbsCampos;
  SelecionadosTodosClick( Self );            // Limpa os campos selecionados
  DisponiveisTodosClick( Self );             // Acrescenta todos os disponívies
  edtConta.SetFocus;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sbtnAlterarClick(Sender: TObject);
Begin
  Operacao            := opAltera;
  tbsCampos.Enabled   := True;
  tbsGrupoOrc.Enabled := True;

  pnlUm.Enabled       := True;
  pgcCompo.Enabled    := True;
  Toolbar971.Enabled  := False;
  pgcCompo.Activepage := tbsCampos;
  edtConta.SetFocus;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sbtnApagarClick(Sender: TObject);
Begin
  Operacao            := opExclui;
  tbsCampos.Enabled   := True;
  tbsGrupoOrc.Enabled := True;
  pnlUm.Enabled       := True;
  pgcCompo.Enabled    := True;
  Toolbar971.Enabled  := False;
  pgcCompo.ActivePage := tbsGrupoOrc;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sbtnProcurarClick(Sender: TObject);
Begin
  MontaSelect.Executar;
  If ( MontaSelect.RetornouValor ) Then Begin
    EdtConta.Text        := MontaSelect.ValoresChave[ 1 ];
    sttNomeConta.Caption := MontaSelect.ValoresChave[ 2 ];
    pnlUm.Enabled        := True;
    pgcCompo.Enabled     := True;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnProcurarClick(Sender: TObject);
Begin
  sbtnProcurarClick( Self );
  edtContaExit( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.bbtnCancelarClick(Sender: TObject);
Begin
  memStatus.Tag      := -1;
  Operacao           := opInativo;
  sbtnInserir.Down   := False;
  sbtnAlterar.Down   := False;
  sbtnApagar.Down    := False;
  sbtnProcurar.Down  := False;

  pnlUm.Enabled      := False;
  pgcCompo.Enabled   := False;
  Toolbar971.Enabled := True;

  edtConta.Text         := '';
  sttNomeConta.Caption  := '';
  rdgAcao.ItemIndex     := AcEstimar;

  pgcCompo.ActivePage   := tbsCampos;
  SelecionadosTodosClick( Self );
  btnFiltrarDesativar;

  btnCORefreshClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.BtnGORefreshClick(Sender: TObject);
Begin
  CdsGrupoOrc.Data := CtrlCadContasOrcPorGrupo.ListaGrupoOrc;
  ltvGOSelecionados.Items.Clear;
  Carregar( CdsGrupoOrc, ltvGODisponiveis, 'CODGRUPOORC' );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.BtnCCRefreshClick(Sender: TObject);
Begin
  CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto;
  ltvCCSelecionados.Items.Clear;
  Carregar( CdsCentroDeCusto, ltvCCDisponiveis, 'CODCENTROCUSTO' );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnAPRefreshClick(Sender: TObject);
Begin
  CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj;
  ltvAPSelecionados.Items.Clear;
  Carregar( CdsAtivProj, ltvAPDisponiveis, 'UNECODIGO' );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnPPRefreshClick(Sender: TObject);
Begin
  CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev;
  ltvPPSelecionados.Items.Clear;
  Carregar( CdsPlanoPrev, ltvPPDisponiveis, '' );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnPTRefreshClick(Sender: TObject);
Begin
  CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro;
  ltvPTDisponiveis.Items.Clear;
  Carregar( CdsPatro, ltvPTDisponiveis, '' );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.Carregar( pCdsLocal : TClientDataSet;
                                                pLtvLocal : TListView;
                                                pCampo    : String );
Begin
  pLtvLocal.Items.Clear;

  While ( Not pCdsLocal.EOF ) Do Begin

    pLtvLocal.Items.Add;
    pLtvLocal.Items.Item[ pltvLocal.Items.Count - 1 ].Caption := Copy( Trim ( pCdsLocal.FieldByName( 'NOME' ).AsString ), 1, 30 );
    pltvLocal.Items.Item[ pltvLocal.Items.Count - 1 ].SubItems.Add( IntToStr ( pCdsLocal.RecNo ) );

    If ( pCampo <> '' ) Then Begin
      pLtvLocal.Items.Item[ pltvLocal.Items.Count - 1 ].Caption :=
      pLtvLocal.Items.Item[ pltvLocal.Items.Count - 1 ].Caption +
                            StringOfChar( ' ', 31 - Length( pLtvLocal.Items.Item[ pltvLocal.Items.Count - 1 ].Caption ) ) +
                            Trim ( pCdsLocal.FieldByName( pCampo ).AsString );
    End;
    pCdsLocal.Next;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.DisponiveisClick(Sender: TObject);
Begin
  If pgcCompo.ActivePage = tbsCampos Then Begin
    MoverDePara( ltvCPDisponiveis, ltvCPSelecionados );
    ltvCPSelecionados.AlphaSort;

  End Else If pgcCompo.ActivePage = tbsCentroCusto Then
    MoverDePara( ltvCCDisponiveis, ltvCCSelecionados )

  Else If pgcCompo.ActivePage = tbsAtividade Then
    MoverDePara( ltvAPDisponiveis, ltvAPSelecionados )

  Else If pgcCompo.ActivePage = tbsPlanoPrev Then
    MoverDePara( ltvPPDisponiveis, ltvPPSelecionados )

  Else If pgcCompo.ActivePage = tbsPatro Then
    MoverDePara( ltvPTDisponiveis, ltvPTSelecionados )

  Else If pgcCompo.ActivePage = tbsGrupoOrc Then
    MoverDePara( ltvGODisponiveis, ltvGOSelecionados );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.DisponiveisTodosClick(Sender: TObject);
Var
  Posicao,
  Maximo  : Integer;
Begin
  Maximo := 0;
  If pgcCompo.ActivePage = tbsCampos Then
    Maximo := ltvCPDisponiveis.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsCentroCusto Then
    Maximo := ltvCCDisponiveis.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsAtividade Then
    Maximo := ltvAPDisponiveis.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsPlanoPrev Then
    Maximo := ltvPPDisponiveis.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsPatro Then
    Maximo := ltvPTDisponiveis.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsGrupoOrc Then
    Maximo := ltvGODisponiveis.Items.Count - 1;

  For Posicao := Maximo DownTo 0 Do
    DisponiveisClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.SelecionadosClick(Sender: TObject);
Begin
  If pgcCompo.ActivePage = tbsCampos Then Begin
    MoverDePara( ltvCPSelecionados, ltvCPDisponiveis );
    ltvCPDisponiveis.AlphaSort;

  End Else If pgcCompo.ActivePage = tbsCentroCusto Then
    MoverDePara( ltvCCSelecionados, ltvCCDisponiveis )

  Else If pgcCompo.ActivePage = tbsAtividade Then
    MoverDePara( ltvAPSelecionados, ltvAPDisponiveis )

  Else If pgcCompo.ActivePage = tbsPlanoPrev Then
    MoverDePara( ltvPPSelecionados, ltvPPDisponiveis )

  Else If pgcCompo.ActivePage = tbsPatro Then
    MoverDePara( ltvPTSelecionados, ltvPTDisponiveis )

  Else If pgcCompo.ActivePage = tbsGrupoOrc Then
    MoverDePara( ltvGOSelecionados, ltvGODisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.SelecionadosTodosClick(Sender: TObject);
Var
  Posicao,
  Maximo  : Integer;
Begin
  Maximo := 0;
  If pgcCompo.ActivePage = tbsCampos Then
    Maximo := ltvCPSelecionados.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsCentroCusto Then
    Maximo := ltvCCSelecionados.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsAtividade Then
    Maximo := ltvAPSelecionados.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsPlanoPrev Then
    Maximo := ltvPPSelecionados.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsPatro Then
    Maximo := ltvPTSelecionados.Items.Count - 1

  Else If pgcCompo.ActivePage = tbsGrupoOrc Then
    Maximo := ltvGOSelecionados.Items.Count - 1;

  For Posicao := Maximo DownTo 0 Do
    SelecionadosClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.MoverDePara( ltvDisp,
                                                   ltvSelec : TListView );
Var
  Posicao : Integer;
Begin
  If ( ltvDisp.Items.Count > 0 ) Then Begin

    If ( ltvDisp.Selected = Nil ) Then Begin

      Posicao := 0;

    End Else Begin

      Posicao := ltvDisp.Selected.Index;
    End;

    IncluirEm( ltvSelec,
               ltvDisp.Items[ Posicao ].Caption,
               ltvDisp.Items[ Posicao ].SubItems[ 0 ] );
    RetirarDe( ltvDisp, Posicao );
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.IncluirEm( pLtvDestino : TListView;
                                                 pCaption,
                                                 pSubItems0 : String );
Begin
  pltvDestino.Items.Add;
  pltvDestino.Items.Item[ pltvDestino.Items.Count - 1 ].Caption := pCaption;
  pltvDestino.Items.Item[ pltvDestino.Items.Count - 1 ].SubItems.Add( pSubItems0 );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.RetirarDe( pLtvDestino : TListView;
                                                 pPosicao    : Integer );
Begin

 pLtvDestino.Items.Delete( pPosicao );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnCORefreshClick(Sender: TObject);
Begin
  sePosIni1.Value := 1;
  sePosIni2.Value := 2;
  sePosIni3.Value := 0;
  sePosIni4.Value := 0;
  sePosIni5.Value := 0;

  sePosFim1.Value := 1;
  sePosFim2.Value := 0;
  sePosFim3.Value := 0;
  sePosFim4.Value := 0;
  sePosFim5.Value := 0;

  cboParaCada1.ItemIndex := -1;
  cboParaCada2.ItemIndex := -1;
  cboParaCada3.ItemIndex := -1;
  cboParaCada4.ItemIndex := -1;
  cboParaCada5.ItemIndex := -1;

  TestaTipoDoCbo( cboParaCada1 );
  TestaTipoDoCbo( cboParaCada2 );
  TestaTipoDoCbo( cboParaCada3 );
  TestaTipoDoCbo( cboParaCada4 );
  TestaTipoDoCbo( cboParaCada5 );
{
  rdgSequencial1.Checked := True;
  rdgSequencial2.Checked := True;
  rdgSequencial3.Checked := True;
  rdgSequencial4.Checked := True;
  rdgSequencial5.Checked := True;

  rdgFixo1.Checked := False;
  rdgFixo2.Checked := False;
  rdgFixo3.Checked := False;
  rdgFixo4.Checked := False;
  rdgFixo5.Checked := False;
}
  edConteudo1.Text := '';
  edConteudo2.Text := '';
  edConteudo3.Text := '';
  edConteudo4.Text := '';
  edConteudo5.Text := '';
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.TestaTipoDoCbo(Sender: TObject);
Begin
  If ( UpperCase( TwwDBComboBox( Sender ).Name ) = 'CBOPARACADA1' ) Then Begin

    AtuaSequencial( TwwDBComboBox( Sender ).Value,
                    rdgSequencial1,
                    rdgFixo1,
                    gpbSequencialFixo1 );

  End Else If ( UpperCase( TwwDBComboBox( Sender ).Name ) = 'CBOPARACADA2' ) Then Begin

    AtuaSequencial( TwwDBComboBox( Sender ).Value,
                    rdgSequencial2,
                    rdgFixo2,
                    gpbSequencialFixo2 );

  End Else If ( UpperCase( TwwDBComboBox( Sender ).Name ) = 'CBOPARACADA3' ) Then Begin

    AtuaSequencial( TwwDBComboBox( Sender ).Value,
                    rdgSequencial3,
                    rdgFixo3,
                    gpbSequencialFixo3 );

  End Else If ( UpperCase( TwwDBComboBox( Sender ).Name ) = 'CBOPARACADA4' ) Then Begin

    AtuaSequencial( TwwDBComboBox( Sender ).Value,
                    rdgSequencial4,
                    rdgFixo4,
                    gpbSequencialFixo4 );

  End Else If ( UpperCase( TwwDBComboBox( Sender ).Name ) = 'CBOPARACADA5' ) Then Begin

    AtuaSequencial( TwwDBComboBox( Sender ).Value,
                    rdgSequencial5,
                    rdgFixo5,
                    gpbSequencialFixo5 );
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.AtuaSequencial( pItem : String;
                                                      pSeq,
                                                      pFix  : TRadioButton;
                                                      pGru  : TGroupBox );
Begin
  If ( pItem = 'PP' ) Or
     ( pItem = 'PT' ) Then Begin
    pSeq.Checked := True;
    pSeq.Enabled := True;
    pFix.Enabled := False;
  End Else Begin
    pSeq.Checked := True;
    pSeq.Enabled := False;
    pFix.Enabled := False;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosIni2Change(Sender: TObject);
Begin
  If ( sePosFim2.Value <> 0 ) Then Begin
    sePosIni3.Value := sePosIni2.Value + sePosFim2.Value;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosIni3Change(Sender: TObject);
Begin
  If ( sePosFim3.Value <> 0 ) Then Begin
    sePosIni4.Value := sePosIni3.Value + sePosFim3.Value;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosIni4Change(Sender: TObject);
Begin
  If ( sePosFim4.Value <> 0 ) Then Begin
    sePosIni5.Value := sePosIni4.Value + sePosFim4.Value;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim1Change(Sender: TObject);
Begin
  sePosIni2.Value := sePosIni1.Value + sePosFim1.Value;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim2Change(Sender: TObject);
Begin
  If ( sePosIni2.Value <> 0 ) Then Begin
    sePosIni3.Value := sePosIni2.Value + sePosFim2.Value;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim3Change(Sender: TObject);
Begin
  If ( sePosIni3.Value <> 0 ) Then Begin
    sePosIni4.Value := sePosIni3.Value + sePosFim3.Value;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim4Change(Sender: TObject);
Begin
  If ( sePosIni4.Value <> 0 ) Then Begin
    sePosIni5.Value := sePosIni4.Value + sePosFim4.Value;
  End;
End;
//************************************************
procedure TfrmCadContasOrcPorGrupo2MT.sePosFim2AfterUpClick( Sender: TObject);
Begin
  If ( sePosIni2.Value = 0 ) Then Begin
    sePosFim2.Value := sePosFim2.Value - 1;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim3AfterUpClick( Sender: TObject);
Begin
  If ( sePosIni3.Value = 0 ) Then Begin
    sePosFim3.Value := sePosFim3.Value - 1;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim4AfterUpClick( Sender: TObject);
Begin
  If ( sePosIni4.Value = 0 ) Then Begin
    sePosFim4.Value := sePosFim4.Value - 1;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim5AfterUpClick( Sender: TObject);
Begin
  If ( sePosIni5.Value = 0 ) Then Begin
    sePosFim5.Value := sePosFim5.Value - 1;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim2AfterDownClick( Sender: TObject);
Begin
  If ( sePosFim3.Value <> 0 ) And
     ( sePosFim2.Value  = 0 ) Then Begin

    sePosFim2.Value := 1;
  End;

  If ( sePosFim2.Value = 0 ) Then Begin
    sePosIni3.Value := 0;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim3AfterDownClick( Sender: TObject);
Begin
  If ( sePosFim4.Value <> 0 ) And
     ( sePosFim3.Value  = 0 ) Then Begin

    sePosFim3.Value := 1;
  End;

  If ( sePosFim3.Value = 0 ) Then Begin
    sePosIni4.Value := 0;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.sePosFim4AfterDownClick( Sender: TObject);
Begin
  If ( sePosFim5.Value <> 0 ) And
     ( sePosFim4.Value  = 0 ) Then Begin

    sePosFim4.Value := 1;
  End;

  If ( sePosFim4.Value = 0 ) Then Begin
    sePosIni5.Value := 0;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.bbtnConfirmarClick(Sender: TObject);
Var
  Posicao : Integer;
Begin
  memStatus.Tag      := 0;
  EsconderDbgContas;
  If ( Operacao = opInativo ) Then Begin

    MsgDlg( 'É necessário indicar uma operação ', 'Aviso', mtWarning, [ mbOk ], 0 );
    Exit;
  End Else If ( ( Operacao = opInsere ) Or ( Operacao = opAltera ) ) And
     ( Trim( edtConta.Text ) = '' ) Then Begin

    edtConta.SetFocus;
    MsgDlg( 'É necessário informar uma conta a partir da qual os dados serão espelhados',
            'Aviso', mtWarning, [ mbOk ], 0 );
    Exit;
  End Else If ( Operacao = opAltera ) And
              ( ltvCpSelecionados.Items.Count = 0 ) Then Begin

    pgcCompo.ActivePage := tbsCampos;
    MsgDlg( 'É necessário informar o campo que será espelhado',
            'Aviso', mtWarning, [ mbOk ], 0 );
    Exit;
  End Else If ( ltvGOSelecionados.Items.Count = 0 ) And
              ( ltvCCSelecionados.Items.Count = 0 ) And
              ( ltvAPSelecionados.Items.Count = 0 ) And
              ( ltvPPSelecionados.Items.Count = 0 ) And
              ( ltvPTSelecionados.Items.Count = 0 ) Then Begin

    pgcCompo.ActivePage := tbsGrupoOrc;
    MsgDlg( 'É necessário selecionar algum' + #13 + #10 +
            'Grupo Orçamentário / Centro de Custo / Atividade' + #13 + #10 +
            'Plano Previdenciário / Patrocinadora',
            'Aviso', mtWarning, [ mbOk ], 0 );
    Exit;
  End Else If ( Operacao = opExclui ) And
              ( rdgAcao.ItemIndex <> AcEstimar ) Then Begin

    If ( mrNo = MsgDlg( 'Serão excluídos, além da conta, os saldos e as as composições' + #13 + #10 +
                               'Deseja prosseguir?', 'Exclusão - Atenção', mtWarning, [ mbNo, mboK ], 0 ) ) Then Begin
      Exit;
    End Else If ( mrNo = MsgDlg( 'Os dados serão permanentemente excluídos do banco de dados' + #13 + #10 +
                                 'Deseja prosseguir?', 'Exclusão - Atenção', mtWarning, [ mbNo, mboK ], 0 ) ) Then Begin
      Exit;
    End;
  End;

  btnFiltrarDesativar;
  pgcCompo.ActivePage := tbsStatus;
  memStatus.Clear;

  cdsBase.DisableControls;
  If ( MontaBase ) Then Begin

    CtrlCadContasOrcPorGrupo.Estimar( Operacao = opInsere );

    If ( rdgAcao.ItemIndex <> AcEstimar ) Then Begin

      If ( Operacao = opInsere ) Then Begin

        If ( ValidaFormacao ) Then Begin        // Consiste os parâmetros escolhidos
                                                // Com o código formado
          CtrlCadContasOrcPorGrupo.Inclusao( edtConta.Text,
                                             arrCodigo,
                                             ltvCPSelecionados );
          CtrlCadContasOrcPorGrupo.GravaLog( 'Fim do Log' );
        End;
      End Else If ( Operacao = opAltera ) Then Begin

        btnFiltrarAtivar;
        Posicao := 0;
        While ( Posicao < ltvCpSelecionados.Items.Count ) Do Begin

          If Not ( CtrlCadContasOrcPorGrupo.Alteracao( edtConta.Text,
                                                       ltvCpSelecionados.Items[ Posicao ].SubItems[ 0 ] ) ) Then Begin
            Posicao := ltvCpSelecionados.Items.Count;       // Para sair do loop
          End;

          Inc( Posicao );
        End;
        CtrlCadContasOrcPorGrupo.GravaLog( 'Fim do Log' );

      End Else If ( Operacao = opExclui ) Then Begin

        btnFiltrarAtivar;
        CtrlCadContasOrcPorGrupo.Exclusao;
        CtrlCadContasOrcPorGrupo.GravaLog( 'Fim do Log' );
      End;
    End;
  End;
  cdsBase.EnableControls;
End;
//************************************************
Function  TfrmCadContasOrcPorGrupo2MT.MontaBase : Boolean;
Var
  PosGrup,
  PosCent,
  PosAtiv,
  PosPlan,
  PosPatr        : Integer;
  TxtBASGRUP,
  TxtBASCENT,
  TxtBASATIV,
  TxtBASPLAN,
  TxtBASPATR,
  TxtBASCONTA,
  TxtBASGRUPTXT,
  TxtBASCENTTXT,
  TxtBASATIVTXT,
  TxtBASPLANTXT,
  TxtBASPATRTXT  : String;
Begin
  Try
    CdsBase.Close;
    CdsBase.CreateDataSet;

    PosGrup := ltvGOSelecionados.Items.Count - 1;
    Repeat

      If ( PosGrup = -1 ) Then Begin             // Grupo vazio

        TxtBASGRUP        := '';
        TxtBASGRUPTXT     := '';
      End Else Begin

        CdsGrupoOrc.RecNo := StrToInt( ltvGOSelecionados.Items[ PosGrup ].SubItems[ 0 ] );
        TxtBASGRUP        := CdsGrupoOrc.FieldByName( 'IDGRUPOORCAMEN' ).AsString;
        TxtBASGRUPTXT     := CdsGrupoOrc.FieldByName( 'NOME' ).AsString;
      End;

      PosCent := ltvCCSelecionados.Items.Count - 1;
      // Combina todos os parâmetros selecionados
      Repeat

        If ( PosCent = -1 ) Then Begin           // Grupo vazio

          TxtBASCENT             := '';
          TxtBASCENTTXT          := '';
        End Else Begin

          CdsCentroDeCusto.RecNo := StrToInt( ltvCCSelecionados.Items[ PosCent ].SubItems[ 0 ] );
          TxtBASCENT             := CdsCentroDeCusto.FieldByName( 'CODCENTROCUSTO' ).AsString;
          TxtBASCENTTXT          := CdsCentroDeCusto.FieldByName( 'NOME' ).AsString;
        End;

        PosAtiv := ltvAPSelecionados.Items.Count - 1;
        Repeat

          If ( PosAtiv = -1 ) Then Begin         // Grupo vazio

            TxtBASATIV        := '';
            TxtBASATIVTXT     := '';
          End Else Begin

            CdsAtivProj.RecNo := StrToInt( ltvAPSelecionados.Items[ PosAtiv ].SubItems[ 0 ] );
            TxtBASATIV        := CdsAtivProj.FieldByName( 'UNIDNEGOC' ).AsString;
            TxtBASATIVTXT     := CdsAtivProj.FieldByName( 'NOME' ).AsString;
          End;

          PosPlan := ltvPPSelecionados.Items.Count - 1;
          Repeat

            If ( PosPlan = -1 ) Then Begin       // Grupo vazio

              TxtBASPLAN         := '';
              TxtBASPLANTXT      := '';
            End Else Begin
              CdsPlanoPrev.RecNo := StrToInt( ltvPPSelecionados.Items[ PosPlan ].SubItems[ 0 ] );
              TxtBASPLAN         := CdsPlanoPrev.FieldByName( 'IDPLANOPREV' ).AsString;
              TxtBASPLANTXT      := CdsPlanoPrev.FieldByName( 'NOME' ).AsString;
            End;

            PosPatr := ltvPTSelecionados.Items.Count - 1;
            Repeat

              If ( PosPatr = -1 ) Then Begin     // Grupo vazio

                TxtBASPATR     := '';
                TxtBASPATRTXT  := '';
              End Else Begin

                CdsPatro.RecNo := StrToInt( ltvPTSelecionados.Items[ PosPatr ].SubItems[ 0 ] );
                TxtBASPATR     := CdsPatro.FieldByName( 'IDPESSOA' ).AsString;
                TxtBASPATRTXT  := CdsPatro.FieldByName( 'NOME' ).AsString;
              End;

              If ( TxtBASGRUP <> '' ) Or
                 ( TxtBASCENT <> '' ) Or
                 ( TxtBASATIV <> '' ) Or
                 ( TxtBASPLAN <> '' ) Or
                 ( TxtBASPATR <> '' ) Or
                 ( TxtBASCONTA <> '' ) Then Begin

                CdsBase.AppendRecord( [ TxtBASGRUP,    TxtBASCENT,    TxtBASATIV,
                                        TxtBASPLAN,    TxtBASPATR,    TxtBASCONTA,
                                        0,             TxtBASGRUPTXT, TxtBASCENTTXT,
                                        TxtBASATIVTXT, TxtBASPLANTXT, TxtBASPATRTXT ] );
                sttLinhas.Caption := IntToStr( CdsBase.Recordcount );
                sttLinhas.Repaint;
              End;

              Dec( PosPatr );
              Application.ProcessMessages;

            Until ( PosPatr < 0 ) Or
                  ( memStatus.Tag = -1 );

            Dec( PosPlan );
          Until ( PosPlan < 0 ) Or
                ( memStatus.Tag = -1 );

          Dec( PosAtiv );
        Until ( PosAtiv < 0 ) Or
              ( memStatus.Tag = -1 );

        Dec( PosCent );
      Until ( PosCent < 0 ) Or
            ( memStatus.Tag = -1 );

      Dec( PosGrup );
    Until ( PosGrup < 0 ) Or
          ( memStatus.Tag = -1 );

    Result := ( memStatus.Tag = 0 );
  Except
    On E : Exception Do Begin
      Result := False;
      MsgDlg( E.Message, 'Erro', mtError, [ mbOk ], 0 );
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.ltvDisponiveisDblClick( Sender: TObject);
Begin
  DisponiveisClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.ltvSelecionadosDblClick( Sender: TObject);
Begin
  SelecionadosClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.edtContaExit(Sender: TObject);
Var
  Posicao : Integer;
Begin
  edtConta.Text := Trim( edtConta.Text );

  If ( edtConta.Text = '' ) Then Begin

    sttNomeConta.Caption := '';
  End Else Begin

    // Lê os dados da conta espelho
    CtrlCadContasOrcPorGrupo.PopulaOrigem( edtConta.Text );

    If ( CdsOrigem.IsEmpty ) Then Begin
      edtConta.SetFocus;
      MsgDlg( 'Conta orçamentária não existe', 'Aviso', mtWarning, [ mbOk ], 0 );
    End Else Begin
      sttNomeConta.Caption := CdsOrigem.FieldByName( 'NOMECONTAORCAMEN' ).AsString;

      If ( Operacao = opInsere ) Then Begin

        pgcCompo.ActivePage := tbsGrupoOrc;       // Retira de selecionados
        BtnGORefreshClick( Self );                // se já estiver lá

        CdsGrupoOrc.First;                    // Localiza o mesmo grupo da conta espelho
        While ( Not CdsGrupoOrc.EOF ) And
              ( CdsGrupoOrc.FieldByName( 'IDGRUPOORCAMEN').AsFloat <>
                CdsOrigem.FieldByName( 'IDGRUPOORCAMEN').AsFloat ) Do Begin
          CdsGrupoOrc.Next;
        End;

        Posicao := 0;                         // Localiza o grupo nos disponíveis
        While ( CdsGrupoOrc.RecNo <> StrToInt( ltvGODisponiveis.Items[ Posicao ].SubItems[ 0 ] ) ) Do Begin
          Inc( Posicao );
        End;

        // Seleciona o grupo da conta
        ltvGODisponiveis.Items.Item[ Posicao ].Selected := True;
        DisponiveisClick( Self );
      End;
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnFiltrarClick(Sender: TObject);
Begin
  If ( cdsBase.Filtered ) Then Begin
    btnFiltrarDesativar;
  End Else Begin
    If ( Not CdsBase.IsEmpty ) Then Begin
      btnFiltrarAtivar;
    End
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnFiltrarDesativar;
Begin
  cdsBase.Filtered   := False;
  cdsBase.Filter     := '';
  btnFiltrar.Caption := 'Desativado';
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnFiltrarAtivar;
Begin
  CdsBase.Filtered := False;
  CdsBase.Filter   := 'BASQUANT <> 0';
  CdsBase.Filtered := True;
  btnFiltrar.Caption := 'Ativado';
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.rdgSequencialClick(Sender: TObject);
Begin
  If Not ( Sender As TRadioButton ).Checked Then Begin
    ( Sender As TRadioButton ).Checked := True;

    If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGSEQUENCIAL1' ) Then

      rdgFixo1.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGSEQUENCIAL2' ) Then

      rdgFixo2.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGSEQUENCIAL3' ) Then

      rdgFixo3.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGSEQUENCIAL4' ) Then

      rdgFixo4.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGSEQUENCIAL5' ) Then Begin

      rdgFixo5.Checked := False;
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.rdgFixoClick(Sender: TObject);
Begin
  If Not ( Sender As TRadioButton ).Checked Then Begin
    ( Sender As TRadioButton ).Checked := True;

    If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGFIXO1' ) Then

      rdgSequencial1.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGFIXO2' ) Then

      rdgSequencial2.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGFIXO3' ) Then

      rdgSequencial3.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGFIXO4' ) Then

      rdgSequencial4.Checked := False

    Else If ( UpperCase( ( Sender As TRadioButton ).Name ) = 'RDGFIXO5' ) Then Begin

      rdgSequencial5.Checked := False
    End;
  End;
End;
//************************************************
Function TfrmCadContasOrcPorGrupo2MT.ValidaFormacao: Boolean;
Var
  Posicao,
  Maximo,
  Minimo    : Integer;
  Mensagem  : String;
Begin
  //-----------------------------------  Atribui os campos do código à matriz
  SetLength( arrCodigo, 5 );
  arrCodigo[ 0 ].Inicio  := Trunc( sePosIni1.Value );
  arrCodigo[ 0 ].Digitos := Trunc( sePosFim1.Value );
  arrCodigo[ 0 ].Campo   := cboParaCada1.Value;
  If rdgSequencial1.Checked Then
    arrCodigo[ 0 ].SeqFix  := 'S'
  Else
    arrCodigo[ 0 ].SeqFix  := 'F';
  arrCodigo[ 0 ].Valor   := Trunc( edConteudo1.Value );
  //-----------------------------------
  arrCodigo[ 1 ].Inicio  := Trunc( sePosIni2.Value );
  arrCodigo[ 1 ].Digitos := Trunc( sePosFim2.Value );
  arrCodigo[ 1 ].Campo   := cboParaCada2.Value;
  If rdgSequencial2.Checked Then
    arrCodigo[ 1 ].SeqFix  := 'S'
  Else
    arrCodigo[ 1 ].SeqFix  := 'F';
  arrCodigo[ 1 ].Valor   := Trunc( edConteudo2.Value );
  //-----------------------------------
  arrCodigo[ 2 ].Inicio  := Trunc( sePosIni3.Value );
  arrCodigo[ 2 ].Digitos := Trunc( sePosFim3.Value );
  arrCodigo[ 2 ].Campo   := cboParaCada3.Value;
  If rdgSequencial3.Checked Then
    arrCodigo[ 2 ].SeqFix  := 'S'
  Else
   arrCodigo[ 2 ].SeqFix  := 'F';
  arrCodigo[ 2 ].Valor   := Trunc( edConteudo3.Value );
  //-----------------------------------
  arrCodigo[ 3 ].Inicio  := Trunc( sePosIni4.Value );
  arrCodigo[ 3 ].Digitos := Trunc( sePosFim4.Value );
  arrCodigo[ 3 ].Campo   := cboParaCada4.Value;
  If rdgSequencial4.Checked Then
    arrCodigo[ 3 ].SeqFix  := 'S'
  Else
    arrCodigo[ 3 ].SeqFix  := 'F';
  arrCodigo[ 3 ].Valor   := Trunc( edConteudo4.Value );
  //-----------------------------------
  arrCodigo[ 4 ].Inicio  := Trunc( sePosIni5.Value );
  arrCodigo[ 4 ].Digitos := Trunc( sePosFim5.Value );
  arrCodigo[ 4 ].Campo   := cboParaCada5.Value;
  If rdgSequencial5.Checked Then
    arrCodigo[ 4 ].SeqFix  := 'S'
  Else
    arrCodigo[ 4 ].SeqFix  := 'F';
  arrCodigo[ 4 ].Valor   := Trunc( edConteudo5.Value );
  //-----------------------------------
  Maximo   := 0;
  Mensagem := '';

  If ( ltvGOSelecionados.Items.Count <> 0 ) And
     ( Not TestaSelecionados( 'GO', ltvGOSelecionados, Maximo ) ) Then Begin

    Mensagem := Mensagem + '- Foram selecionados ' + IntToStr( ltvGOSelecionados.Items.Count ) +
                           ' Grupos Orçamentários mas a quantidade de dígitos somente suporta ' +
                           IntToStr( Maximo ) + #13 + #10;
  End;

  If ( ltvCCSelecionados.Items.Count <> 0 ) And
     ( Not TestaSelecionados( 'CC', ltvCCSelecionados, Maximo ) ) Then Begin

    Mensagem := Mensagem + '- Foram selecionados ' + IntToStr( ltvCCSelecionados.Items.Count ) +
                           ' Centros de Custos mas a quantidade de dígitos somente suporta ' +
                           IntToStr( Maximo ) + #13 + #10;
  End;

  If ( ltvAPSelecionados.Items.Count <> 0 ) And
     ( Not TestaSelecionados( 'AP', ltvAPSelecionados, Maximo ) ) Then Begin

    Mensagem := Mensagem + '- Foram selecionados ' + IntToStr( ltvAPSelecionados.Items.Count ) +
                           ' Atividades/Projetos mas a quantidade de dígitos somente suporta ' +
                           IntToStr( Maximo ) + #13 + #10;
  End;

  If ( ltvPPSelecionados.Items.Count <> 0 ) And
     ( Not TestaSelecionados( 'PP', ltvPPSelecionados, Maximo ) ) Then Begin

    Mensagem := Mensagem + '- Foram selecionados ' + IntToStr( ltvPPSelecionados.Items.Count ) +
                           ' Planos Previdenciários mas a quantidade de dígitos somente suporta ' +
                           IntToStr( Maximo ) + #13 + #10;

  End;

  If ( ltvPTSelecionados.Items.Count <> 0 ) And
     ( Not TestaSelecionados( 'PT', ltvPTSelecionados, Maximo ) ) Then Begin

    Mensagem := Mensagem + '- Foram selecionados ' + IntToStr( ltvPTSelecionados.Items.Count ) +
                           ' Patrocinadoras mas a quantidade de dígitos somente suporta ' +
                           IntToStr( Maximo ) + #13 + #10;
  End;

  For Posicao := 0 To Length( arrCodigo ) - 1 Do Begin

    If ( arrCodigo[ Posicao ].Campo   = '' ) And
       ( arrCodigo[ Posicao ].Inicio  <> 0 ) And
       ( arrCodigo[ Posicao ].Digitos <> 0 ) Then Begin

      Mensagem := Mensagem + '- Foi indicada uma parte do código que não está relacionada com' + #13 + #10 +
                             'Grupo Orçamentário / Centro de Custo / Atividade' + #13 + #10 +
                             'Plano Previdenciário / Patrocinadora' + #13 + #10;
    End;
    //---------------------------------
    If ( arrCodigo[ Posicao ].Campo = 'GO' ) Then Begin

      If ( ltvGOSelecionados.Items.Count = 0 ) Then Begin

        Mensagem := Mensagem + '- Não foram selecionados Grupos Orçamentários para suprir o código formado' + #13 + #10;
      End Else Begin

        Minimo := CtrlCadContasOrcPorGrupo.TamanhoMinimo( CdsGrupoOrc, ltvGOSelecionados, 'CODGRUPOORC' );
        If ( arrCodigo[ Posicao ].Digitos < Minimo ) Then Begin

          Mensagem := Mensagem + 'O tamanho mínimo para o Grupo Orçamentário selecionado é ' + IntToStr( Minimo ) + #13 + #10;
        End;
      End;
    //---------------------------------
    End Else If ( arrCodigo[ Posicao ].Campo = 'CC' ) Then Begin

      If ( ltvCCSelecionados.Items.Count = 0 ) Then Begin

        Mensagem := Mensagem + '- Não foram selecionados Centros de Custos para suprir o código formado' + #13 + #10;
      End Else Begin

        Minimo := CtrlCadContasOrcPorGrupo.TamanhoMinimo( CdsCentroDeCusto, ltvCCSelecionados, 'CODCENTROCUSTO' );
        If ( arrCodigo[ Posicao ].Digitos < Minimo ) Then Begin

          Mensagem := Mensagem + 'O tamanho mínimo para os Centros de Custos selecionados é ' + IntToStr( Minimo ) + #13 + #10;
        End;
      End;
    //---------------------------------
    End Else If ( arrCodigo[ Posicao ].Campo = 'AP' ) Then Begin

      If ( ltvAPSelecionados.Items.Count = 0 ) Then Begin

        Mensagem := Mensagem + '- Não foram selecionados Atividades/Projetos para suprir o código formado' + #13 + #10;
      End Else Begin

        Minimo := CtrlCadContasOrcPorGrupo.TamanhoMinimo( CdsAtivProj, ltvAPSelecionados, 'UNECODIGO' );
        If ( arrCodigo[ Posicao ].Digitos < Minimo ) Then Begin

          Mensagem := Mensagem + 'O tamanho mínimo para as Atividades/Projetos selecionados é ' + IntToStr( Minimo ) + #13 + #10;
        End;
      End;
    //---------------------------------
    End Else If ( arrCodigo[ Posicao ].Campo = 'PP' ) And
                ( ltvPPSelecionados.Items.Count = 0 ) Then Begin

      Mensagem := Mensagem + '- Não foram selecionados Planos Previdenciários para suprir o código formado' + #13 + #10;

    //---------------------------------
    End Else If ( arrCodigo[ Posicao ].Campo = 'PT' ) And
                ( ltvPTSelecionados.Items.Count = 0 ) Then Begin

      Mensagem := Mensagem + '- Não foram selecionadas Patrocinadoras para suprir o código formado' + #13 + #10;
    End;
  End;

  If ( Mensagem = '' ) Then Begin
    Result := True;

  End Else Begin
    Result := False;
    CtrlCadContasOrcPorGrupo.GravaLog( Mensagem );

    MsgDlg( Mensagem, 'Aviso', mtWarning, [ mbOk ], 0 );
  End;
End;
//************************************************
Function TfrmCadContasOrcPorGrupo2MT.TestaSelecionados( pOrigem : String;
                                                        pLtv    : TListView;
                                                        Var pMaximo : Integer ) : Boolean;
Var
  Posicao : Integer;
Begin
  Posicao := 0;
  While ( Posicao < Length( arrCodigo ) ) And                // Localiza a linha referente
        ( arrCodigo[ Posicao ].Campo <> pOrigem )  Do Begin  // ao grupo

    Inc( Posicao );
  End;

  If ( Posicao = Length( arrCodigo ) ) Then Begin           // Não Achou

    pMaximo := 0;
    Result  := False;

  End Else Begin

    pMaximo := Trunc( ( Power( 10, arrCodigo[ Posicao ].Digitos ) - 1 ) );
    Result  := ( pLtv.Items.count <= pMaximo )
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.btnMostrarContasClick( Sender: TObject );
Begin
  If ( dbgContas.Visible ) Then Begin           // Grid está populado

    EsconderDbgContas;
  End Else Begin

    If ( Not CdsBase.IsEmpty ) And
       ( cdsBase.FieldByName( 'BASQUANT' ).AsInteger <> 0 ) Then Begin

      CtrlCadContasOrcPorGrupo.BuscaContas( False );
      dbgContas.Visible := True;
      dbgContas.BringToFront;
      btnMostrarContas.Caption := 'Esconder';
    End;
  End;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupo2MT.EsconderDbgContas;
Begin
  dbgContas.Visible := False;
  btnMostrarContas.Caption := 'Mostrar';
End;
//************************************************
End.

