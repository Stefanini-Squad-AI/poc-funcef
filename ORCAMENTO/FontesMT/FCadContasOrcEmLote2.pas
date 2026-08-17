Unit
  FCadContasOrcEmLote2;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, CMProcuraMask, Wwdotdot, Wwdbcomb, Mask, wwdbedit, Wwdbspin,
  ComCtrls, ToolWin, uCmSqlParams, uCtrlCadContasOrcPorGrupo, FAguardeOrc;

Type
  TfrmCadContasOrcEmLote2MT = class(TFrmCadastroMT)
    imgBotoes: TImageList;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    edConteudo1: TEdit;
    edConteudo2: TEdit;
    edConteudo3: TEdit;
    edConteudo4: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    dbcboTipoCalcReal: TwwDBComboBox;
    wwDBComboBox1: TwwDBComboBox;
    wwDBComboBox2: TwwDBComboBox;
    wwDBComboBox3: TwwDBComboBox;
    TabSheet5: TTabSheet;
    ltvCCDisponiveis: TListView;
    ltvCCSelecionados: TListView;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    BtnCCRefresh: TToolButton;
    TabSheet6: TTabSheet;
    ltvAPDisponiveis: TListView;
    ltvapSelecionados: TListView;
    ToolBar2: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    btnAPRefresh: TToolButton;
    TabSheet7: TTabSheet;
    ltvPPDisponiveis: TListView;
    ltvPPSelecionados: TListView;
    ToolBar3: TToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    btnPPRefresh: TToolButton;
    TabSheet8: TTabSheet;
    ltvPTDisponiveis: TListView;
    ltvPTSelecionados: TListView;
    ToolBar4: TToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    btnPTRefresh: TToolButton;
    Panel1: TPanel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    dbeGrupo: TCMProcuraMask;
    Label2: TLabel;
    wwDBComboBox4: TwwDBComboBox;
    Label1: TLabel;
    sqlGrupo: TCMSqlParams;
    CdsAtivProj: TCMClientDataSet;
    CdsCentroDeCusto: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCCRefreshClick(Sender: TObject);
    procedure btnAPRefreshClick(Sender: TObject);
    procedure btnPPRefreshClick(Sender: TObject);
    procedure btnPTRefreshClick(Sender: TObject);
  Private
    { Private declarations }

    CtrlCadContasOrcEmLote : TCtrlCadContasOrcEmLote;
    Procedure Carregar( pCdsLocal : TClientDataSet;
                        pLtvLocal : TListView);
  Public
    { Public declarations }
  End;

Var
  frmCadContasOrcEmLote2MT: TfrmCadContasOrcEmLote2MT;

Implementation

Uses
  uSistema, dBaseDados;

{$R *.DFM}
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.FormCreate(Sender: TObject);
Begin
  Inherited;

  CtrlCadContasOrcEmLote := TCtrlCadContasOrcEmLote.Create;
  CtrlCadContasOrcEmLote.Initialize( DtmBaseDados.dbBaseDados, True,
                                     Sistema.ConnectionType,   Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,  True, nil, nil, False );
  CtrlCadContasOrcEmLote.pIdEmpresa := Sistema.IdEmpresa;

  frmAguardeOrc.Mostra( 'Lendo Centro de Custo');
  BtnCCRefreshClick( Self );

  frmAguardeOrc.Mostra( 'Lendo Atividade/Projeto');
  BtnAPRefreshClick( Self );

  frmAguardeOrc.Mostra( 'Lendo Plano Previdenciário');
  BtnPPRefreshClick( Self );

  frmAguardeOrc.Mostra( 'Lendo Patrocinadora');
  BtnPTRefreshClick( Self );

  frmAguardeOrc.Apaga;
End;
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;

  CtrlCadContasOrcEmLote.Free;
End;
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.BtnCCRefreshClick(Sender: TObject);
Begin
  Inherited;

  CdsCentroDeCusto.Data := CtrlCadContasOrcEmLote.ListaCentroDeCusto;

  ltvCCSelecionados.Items.Clear;
  Carregar( CdsCentroDeCusto, ltvCCDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.btnAPRefreshClick(Sender: TObject);
Begin
  Inherited;

  CdsAtivProj.Data := CtrlCadContasOrcEmLote.ListaAtivProj;
  ltvAPSelecionados.Items.Clear;
  Carregar( CdsAtivProj, ltvAPDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.btnPPRefreshClick(Sender: TObject);
Begin
  Inherited;

  CdsPlanoPrev.Data := CtrlCadContasOrcEmLote.ListaPlanoPrev;
  ltvPPSelecionados.Items.Clear;
  Carregar( CdsPlanoPrev, ltvPPDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.btnPTRefreshClick(Sender: TObject);
Begin
  Inherited;

  CdsPatro.Data := CtrlCadContasOrcEmLote.ListaPatro;
  ltvPTDisponiveis.Items.Clear;
  Carregar( CdsPatro, ltvPTDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcEmLote2MT.Carregar( pCdsLocal : TClientDataSet;
                                              pLtvLocal : TListView );
Begin

  pLtvLocal.Items.Clear;

  While ( Not pCdsLocal.EOF ) Do Begin

    pLtvLocal.Items.Add;
    pLtvLocal.Items.Item[ pltvLocal.Items.Count - 1 ].Caption := pCdsLocal.FieldByName( 'NOME' ).AsString;
    pCdsLocal.Next;
  End;
End;
//************************************************
End.
