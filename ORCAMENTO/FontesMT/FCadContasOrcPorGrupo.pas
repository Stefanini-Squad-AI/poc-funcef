Unit
  FCadContasOrcPorGrupo;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, CMProcuraMask, Wwdotdot, Wwdbcomb, Mask, wwdbedit, Wwdbspin,
  ComCtrls, ToolWin, uCmSqlParams, uCtrlCadContasOrcPorGrupo, FAguarde;

Type
  TfrmCadContasOrcPorGrupoMT = class(TFrmCadastroMT)
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
    edtConta: TEdit;
    Label2: TLabel;
    cboCampo: TwwDBComboBox;
    Label1: TLabel;
    CdsAtivProj: TCMClientDataSet;
    CdsCentroDeCusto: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    BitBtn1: TBitBtn;
    CdsCAMPO1: TStringField;
    sqlGrupo: TCMSqlParams;
    cdsGrupo: TCMClientDataSet;
    dtsGrupo: TDataSource;
    MontaSelectGrupo: TMontaSelect;
    dbeGrupo: TCMProcuraMask;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCCRefreshClick(Sender: TObject);
    procedure btnAPRefreshClick(Sender: TObject);
    procedure btnPPRefreshClick(Sender: TObject);
    procedure btnPTRefreshClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  Private
    { Private declarations }

    CtrlCadContasOrcPorGrupo : TCtrlCadContasOrcPorGrupo;
    Procedure Carregar( pCdsLocal : TClientDataSet;
                        pLtvLocal : TListView);
  Public
    { Public declarations }
  End;

Var
  frmCadContasOrcPorGrupoMT: TfrmCadContasOrcPorGrupoMT;

Implementation

Uses
  uSistema, dBaseDados, uModulo;

{$R *.DFM}
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.FormCreate(Sender: TObject);
Begin
  Inherited;
  dbeGrupo.Mascara := Modulo.sMascaraGrupo;
  cdsGrupo.Close;
  With sqlGrupo Do Begin
    If Not Prepared Then Prepare;
    ParamByName('CODGRUPOORC').AsString := '';
    cdsGrupo.Data := Data;
  End;
  Cds.Open;
  CtrlCadContasOrcPorGrupo := TCtrlCadContasOrcPorGrupo.Create;
  CtrlCadContasOrcPorGrupo.Initialize( DtmBaseDados.dbBaseDados, True,
                                     Sistema.ConnectionType,   Sistema.ConnectionSide,
                                     Sistema.AppRemoteServer,  True, nil, nil, False );
  CtrlCadContasOrcPorGrupo.pIdEmpresa      := Sistema.IdEmpresa;
  CtrlCadContasOrcPorGrupo.CdsAtivProj     := CdsAtivProj;
  CtrlCadContasOrcPorGrupo.CdsCentroDeCusto:= CdsCentroDeCusto;
  CtrlCadContasOrcPorGrupo.CdsPlanoPrev    := CdsPlanoPrev;
  CtrlCadContasOrcPorGrupo.CdsPatro        := CdsPatro;

  frmAguarde.Mostra( 'Lendo Centro de Custo');
  BtnCCRefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Atividade/Projeto');
  BtnAPRefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Plano Previdenciário');
  BtnPPRefreshClick( Self );

  frmAguarde.Mostra( 'Lendo Patrocinadora');
  BtnPTRefreshClick( Self );

  frmAguarde.Apaga;
  bbtnCancelarClick( Self );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Inherited;

  CtrlCadContasOrcPorGrupo.Free;
  Cds.Close;
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.BtnCCRefreshClick(Sender: TObject);
Begin
  CdsCentroDeCusto.Data := CtrlCadContasOrcPorGrupo.ListaCentroDeCusto;
  ltvCCSelecionados.Items.Clear;
  Carregar( CdsCentroDeCusto, ltvCCDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.btnAPRefreshClick(Sender: TObject);
Begin
  CdsAtivProj.Data := CtrlCadContasOrcPorGrupo.ListaAtivProj;
  ltvAPSelecionados.Items.Clear;
  Carregar( CdsAtivProj, ltvAPDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.btnPPRefreshClick(Sender: TObject);
Begin
  CdsPlanoPrev.Data := CtrlCadContasOrcPorGrupo.ListaPlanoPrev;
  ltvPPSelecionados.Items.Clear;
  Carregar( CdsPlanoPrev, ltvPPDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.btnPTRefreshClick(Sender: TObject);
Begin
  CdsPatro.Data := CtrlCadContasOrcPorGrupo.ListaPatro;
  ltvPTDisponiveis.Items.Clear;
  Carregar( CdsPatro, ltvPTDisponiveis );
End;
//************************************************
Procedure TfrmCadContasOrcPorGrupoMT.Carregar( pCdsLocal : TClientDataSet;
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
Procedure TfrmCadContasOrcPorGrupoMT.CmeCadastroFind(Sender: TObject);
Begin
  Inherited;
  If ( MontaSelect.RetornouValor ) Then Begin

    EdtConta.Text := MontaSelect.ValoresChave[ 1 ];
  End;
End;

procedure TfrmCadContasOrcPorGrupoMT.sbtnInserirClick(Sender: TObject);
begin
  dbeGrupo.Enabled := False;
  cboCampo.Enabled := False;
end;

procedure TfrmCadContasOrcPorGrupoMT.sbtnAlterarClick(Sender: TObject);
begin
  dbeGrupo.Enabled := True;
  cboCampo.Enabled := True;
end;

procedure TfrmCadContasOrcPorGrupoMT.sbtnApagarClick(Sender: TObject);
begin
  dbeGrupo.Enabled := True;
end;

procedure TfrmCadContasOrcPorGrupoMT.bbtnCancelarClick(Sender: TObject);
begin
  sbtnInserir.Enabled := True;
  sbtnAlterar.Enabled := True;
  sbtnApagar.Enabled  := True;
end;

End.
