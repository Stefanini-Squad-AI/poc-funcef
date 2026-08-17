unit FPortadorFormaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, Wwdotdot, Wwdbcomb, cmseldlg, wwidlg, Db, Wwdatsrc,
  DBCtrls, MAHlpBtn, Buttons, ComCtrls, ToolWin, Grids, Wwdbigrd, Wwdbgrid,
  ExtCtrls, DBTables, Wwtable, wwdblook, Wwdbspin,USistema,Umenserro,
  UAutorizacao, TB97,Wwdbdlg, TB97Ctls, TB97Tlbr, TREdit, MontaSelect, IvDictio,
  IvMulti, IvEMulti, CMDBLookupCombo, CMProcuraMask, uProcuraDir,
  CMProcuraSubTipo, BfDialogs, BrowseFolder, CmEventosCadastro, ImgList,
  FCadastroMT, DBClient, uCMClientDataSet, uCtrlPortadorconta, uCtrlFormaRecPag,
  uCtrlTemplbloqcheque, uCtrlTemplcheque, uCtrlConfigbarras, uCtrlModeloscnab,
  uCtrlUnidnegocio, uCtrlINTBANCOXPORTFORM, uCtrlSubConta, uCtrlCentroCusto,
  uCtrlPortadorforma, uCMTypes, uCtrlIntBanco, uCtrlPadroes;

type
  TfrmPortadorFormaMT = class(TfrmCadastroMT)
    PgPortForma: TPageControl;
    TbsContas: TTabSheet;
    lblPortadorConta: TLabel;
    lblDias: TLabel;
    lblDescricao: TLabel;
    lblFormapg: TLabel;
    dbseDMais: TwwDBSpinEdit;
    edDescricao: TwwDBEdit;
    GroupBox1: TGroupBox;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    grbIntContab: TGroupBox;
    CmbFormadeRecebimento: TwwDBLookupCombo;
    TbsForma: TTabSheet;
    lblModeloCheque: TLabel;
    LblRemessa: TLabel;
    GpbDados: TGroupBox;
    CmbBloq: TwwDBLookupCombo;
    CmbCheque: TwwDBLookupCombo;
    wwDBEdit7: TwwDBEdit;
    wwDBEdit8: TwwDBEdit;
    PnlSISPAG: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    SpeedButton3: TSpeedButton;                                        
    SpeedButton4: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    CmbTipoPgto: TComboBox;
    CmbFormaPgto: TComboBox;
    PnlCNAB: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    LblDirRemessa: TLabel;
    LblDirRetorno: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    EdtNossoNumero: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit6: TwwDBEdit;
    wwDBEdit5: TDBRealEdit;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    LblNumEmpresa: TLabel;
    EdtNumEmpresa: TwwDBEdit;
    CmbModeloCnab: TCMDBLookupCombo;
    CContabil: TCMProcuraMaskContabil;
    Label2: TLabel;
    DbEdDescFinan: TwwDBEdit;
    DlgAbrir: TProcuraDirDlg;
    cmbCCusto: TwwDBLookupCombo;
    lblCentroCusto: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    Label20: TLabel;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    TbsEmissao: TTabSheet;
    GpbEmisCheque: TGroupBox;
    CContabilCheque: TCMProcuraMaskContabil;
    CkbContabEmissao: TDBCheckBox;
    LblFichaComp: TLabel;
    CmbFichaComp: TwwDBLookupCombo;
    GpLancDoc: TGroupBox;
    CmpForCli: TCMProcuraForCli;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    wwDBComboBox1: TwwDBComboBox;
    wwDBSpinEdit1: TwwDBSpinEdit;
    CkbIndicaFavorecido: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    CkbCtrlTalao: TDBCheckBox;
    dblkcmbPortadorContar: TwwDBLookupCombo;
    CdsConta: TCMClientDataSet;
    CdsFormaRecPag: TCMClientDataSet;
    CdsModeloCheque: TCMClientDataSet;
    CdsConfigBarras: TCMClientDataSet;
    CdsModelosCnab: TCMClientDataSet;
    CdsUnidNegoc: TCMClientDataSet;
    CdsPortadorConta: TCMClientDataSet;
    CdsModeloBloquete: TCMClientDataSet;
    CdsAux: TCMClientDataSet;
    CdsCCusto: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDescricaoEnter(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CmbTipoPgtoChange(Sender: TObject);
    procedure CmbFormaPgtoChange(Sender: TObject);
    procedure dblkcmbPortadorContarCloseUp(Sender: TObject; LookupTable,
              FillTable: TDataSet; modified: Boolean);
    procedure CmbModeloCnabCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure CmpForCliExit(Sender: TObject);
    procedure CContabilApertouBotao(Sender: TObject);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlIntBanco      : TCtrlIntBanco;
    CtrlPortadorconta : TCtrlPortadorconta;
    CtrlFormaRecPag   : TCtrlFormaRecPag;
    CtrlTemplbloqcheque : TCtrlTemplbloqcheque;
    CtrlTemplcheque     : TCtrlTemplcheque;
    CtrlConfigbarras    : TCtrlConfigbarras;
    CtrlModeloscnab     : TCtrlModeloscnab;
    CtrlUnidnegocio     : TCtrlUnidnegocio;
    CtrlINTBANCOXPORTFORM : TCtrlINTBANCOXPORTFORM;
    CtrlCentroCusto       : TCtrlCentroCusto;
    CtrlPortadorforma     : TCtrlPortadorforma;
    CtrlSubConta          : TCtrlSubConta;
    cLancaFinanc : String;
    iOldPortadorForma :Integer;
    procedure MostraTipoForma;
    procedure SetaLancaFinanc(valor:boolean);
    procedure RecuperaLancaFinanc(ValorTabela :string);
    procedure FazerQryCCusto;
  public
    { Public declarations }
  end;

var
  frmPortadorFormaMT: TfrmPortadorFormaMT;

implementation

Uses
  DBaseDados, uFuncaoGeral, uCtrlParamIntegra;

{$R *.DFM}

procedure TfrmPortadorFormaMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  Inherited;
  pnlFundo.Enabled := True;
End;

procedure TfrmPortadorFormaMT.SetaLancaFinanc(valor:boolean);
begin
  if valor then
  Begin
     cLancaFinanc:='S';
     sbtnSim.Down:=true;
  end
  else
  Begin
     cLancaFinanc:='N';
     sbtnNao.Down:=true;
  end;
end;

procedure TfrmPortadorFormaMT.RecuperaLancaFinanc(ValorTabela:string);
begin
  if ValorTabela='S' then
  begin
     SetaLancaFinanc(true);
     sbtnSim.Down:=true;
  end
  else
  begin
     SetaLancaFinanc(false);
     sbtnNao.Down:=true;
  end;
end;

procedure TfrmPortadorFormaMT.sbtnSimClick(Sender: TObject);
begin
  inherited;
  SetaLancaFinanc(true);
end;

procedure TfrmPortadorFormaMT.sbtnNaoClick(Sender: TObject);
begin
  inherited;
  SetaLancaFinanc(false);
end;

procedure TfrmPortadorFormaMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlIntBanco      := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( Padroes );

  CtrlPortadorconta := TCtrlPortadorconta.create;
  CtrlPortadorconta.InitializeAs( Padroes );

  CdsPortadorConta.Data := CtrlPortadorconta.ListPortadorconta(0,ParamIntegra.RecPag,Sistema.idEmpresa);

  CtrlFormaRecPag := TCtrlFormaRecPag.create;
  CtrlFormaRecPag.InitializeAs( Padroes );
  CdsFormaRecPag.data := CtrlFormaRecPag.ListFormaRecPag( Sistema.idEmpresa, 0, ParamIntegra.RecPag );

  CtrlTemplbloqcheque := TCtrlTemplbloqcheque.create;
  CtrlTemplbloqcheque.InitializeAs( Padroes );

  CtrlTemplcheque     := TCtrlTemplcheque.create;
  CtrlTemplcheque.InitializeAs( Padroes );

  CtrlConfigbarras := TCtrlConfigbarras.create;
  CtrlConfigbarras.InitializeAs( Padroes );
  CdsConfigBarras.data := CtrlConfigbarras.ListConfigbarras;

  CtrlModeloscnab := TCtrlModeloscnab.create;
  CtrlModeloscnab.InitializeAs( Padroes );
  CdsModelosCnab.data := CtrlModeloscnab.ListModeloscnab(0,ParamIntegra.RecPag);

  CtrlUnidnegocio := TCtrlUnidnegocio.create;
  CtrlUnidnegocio.InitializeAs( Padroes );

  CtrlINTBANCOXPORTFORM := TCtrlINTBANCOXPORTFORM.create;
  CtrlINTBANCOXPORTFORM.InitializeAs( Padroes );
  CtrlINTBANCOXPORTFORM.cds := CdsAux;

  CtrlCentroCusto := TCtrlCentroCusto.Create;
  CtrlCentroCusto.InitializeAs( Padroes );

  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.InitializeAs( Padroes );

  CtrlPortadorforma := TCtrlPortadorforma.create;
  CtrlPortadorforma.InitializeAs( Padroes );
  CtrlPortadorforma.cds := Cds;

  PgPortForma.ActivePage := TbsContas;

  If ParamIntegra.IntegraContab Then
  Begin
     GpbEmisCheque.Enabled                           := True;
     grbIntContab.Enabled                            := True;
     CContabil.Plano                                 := ParamIntegra.Plano;
     CContabil.Mascara                               := ParamIntegra.MascaraPlano;
     CContabilCheque.Plano                           := ParamIntegra.Plano;
     CContabilCheque.Mascara                         := ParamIntegra.MascaraPlano;

     CdsSubConta.data := CtrlSubConta.ListSubconta( Sistema.idEmpresa, 0 );
     CdsUnidNegoc.data := CtrlUnidnegocio.ListaUnidnegocio(Sistema.idEmpresa);
     FazerQryCCusto;
  End
  Else
  Begin
     grbIntContab.Enabled := False;
     GpbEmisCheque.Enabled := True;
  End;

  cds.data := CtrlPortadorforma.ListPortadorforma( ParamIntegra.RecPag, -1, Sistema.IdEmpresa );

  If ParamIntegra.RecPag = 'R' Then
  Begin
     CdsModeloBloquete.data      := CtrlTemplbloqcheque.ListTemplbloqcheque;
     CmbBloq.Visible             := True;
     Caption                     := 'Contas Bancárias/Caixas X Tipos de Cobrança';
     LblRemessa.Caption          := 'Modelo de Arquivo de Remessa';
     lblFormapg.Caption          := 'Forma de Recebimento';
     lblModeloCheque.caption     := 'Modelo de Bloquete';
     GpbDados.Caption            := 'Dados Arquivo de Remessa';
     PNLCNAB.Visible             := True;
     GpbEmisCheque.Visible       := False;
     CkbIndicaFavorecido.Visible := False;
     CkbCtrlTalao.Visible        := False;
     HelpContext                 := 40069;
     bbtnAjuda.HelpContext       := 40069;
  End
  Else
  Begin
     CdsModeloCheque.data        := CtrlTemplcheque.ListTemplcheque(0);
     EdtNumEmpresa.Parent        := PnlSISPAG;
     LblNumEmpresa.Parent        := PnlSISPAG;
     GpbEmisCheque.Visible       := true;
     caption                     := 'Contas Bancárias/Caixas x Forma de Pagamento';
     LblRemessa.Caption          :=  'Modelo de Arquivo de Pagamento';
     lblFormapg.caption          :=  'Forma de Pagamento';
     lblModeloCheque.caption     := 'Modelo de Cheque';
     GpbDados.Caption            := 'Dados Arquivo de Pagamento';
     PNLSISPAG.Visible           := True;
     LblFichaComp.Visible        := False;
     CmbFichaComp.Visible        := False;
     CmbBloq.Visible             := False;
     CkbCtrlTalao.Visible        := True;
     HelpContext                 := 30061;
     bbtnAjuda.HelpContext       := 30061;
  End;

  MontaSelect.Filtro.Add('PORTADORFORMA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  MontaSelect.Filtro.Add('PORTADORFORMA.RECPAG = ''' + ParamIntegra.RecPag + '''');

  If ParamIntegra.RecPag = 'P' Then
     CmpForCli.ForCli := fcFornecedor
  Else
     CmpForCli.ForCli := fcCliente;

  CmpForCli.Mensagens.EmBranco  := CmpForCli.Caption + CmpForCli.Mensagens.EmBranco;
  CmpForCli.Mensagens.NaoExiste := CmpForCli.Caption + CmpForCli.Mensagens.NaoExiste;
  CmpForCli.Caption := CmpForCli.Caption+ ' para lançamento de Documento associado a Imposto ';
end;

procedure TfrmPortadorFormaMT.edDescricaoEnter(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao in [OpInserir, OpAlterar]) and (edDescricao.Text = '') then
     Cds.fieldbyname('DESCRICAO').Asstring := dblkcmbPortadorContar.Text + ' - ' +CmbFormadeRecebimento.Text;
end;

procedure TfrmPortadorFormaMT.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DlgAbrir.Caption := LblDirRemessa.Caption;
  If DlgAbrir.Execute Then
    Cds.fieldbyname('PATHARQUIVOREM').AsString := DlgAbrir.Directory;
end;

procedure TfrmPortadorFormaMT.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  DlgAbrir.Caption := LblDirRetorno.Caption;
  If DlgAbrir.Execute Then
    Cds.fieldbyname('PATHARQUIVORET').AsString := DlgAbrir.Directory;
end;

procedure TfrmPortadorFormaMT.CmbTipoPgtoChange(Sender: TObject);
begin
  inherited;
  If ParamIntegra.RecPag = 'P' Then
     If (Trim(CmbModeloCnab.Text) = '') And ((Sender as TComboBox).ItemIndex <> -1) Then
     Begin
        MsgDlg('É nescessário indicar o tipo de Pagamento Eletrônico','Erro',mtError,[mbOK],0);
        (Sender as TComboBox).ItemIndex := -1;
        PgPortForma.ActivePage := TbsForma;
        If CmbModeloCnab.CanFocus Then
           CmbModeloCnab.SetFocus;
    End;
end;

procedure TfrmPortadorFormaMT.CmbFormaPgtoChange(Sender: TObject);
begin
  inherited;
  If ParamIntegra.RecPag = 'P' Then
     If (Trim(CmbModeloCnab.Text) = '') And ((Sender as TComboBox).ItemIndex <> -1) Then
     Begin
        MsgDlg('É nescessário indicar o tipo de Pagamento Eletrônico','Erro',mtError,[mbOK],0);
        (Sender as TComboBox).ItemIndex := -1;
        PgPortForma.ActivePage := TbsForma;
        If CmbModeloCnab.CanFocus Then
           CmbModeloCnab.SetFocus;
     End;
end;

procedure TfrmPortadorFormaMT.dblkcmbPortadorContarCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) And (Modified) And
     (dblkcmbPortadorContar.LookupValue <> '') Then
  Begin
     CdsConta.data := CtrlPortadorconta.ListContaxForma(StrToInt(dblkcmbPortadorContar.LookupValue));
     Cds.fieldbyname('PlaConta').AsString := CdsConta.FieldByName('PlaConta').AsString;
  End;
end;

procedure TfrmPortadorFormaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  PgPortForma.ActivePage := TbsContas;
  SetaLancaFinanc(true);
  cmbCCusto.Text := '';
  PgPortForma.ActivePage := TbsContas;
  If dblkcmbPortadorContar.CanFocus Then
    dblkcmbPortadorContar.SetFocus;
  If PnlSISPAG.Visible Then
    Cds.fieldbyname('FLGEMITEAVISO').AsInteger := 0;

  Cds.fieldbyname('RECPAG').Asstring := ParamIntegra.RecPag;
  Cds.fieldbyname('IDUSUARIOINCLUSAO').Asinteger := Sistema.idUsuario;
  Cds.fieldbyname('IDPESSOA').Asinteger := Sistema.idEmpresa;
  Cds.fieldbyname('FLGOBRIGAFAV').AsString := 'S';
  Cds.fieldbyname('FLGCONTROLACHEQUE').AsString := 'N';

  iOldPortadorForma := -1;
  If sBtnSim.Down Then  SetaLancaFinanc(True)
  Else SetaLancaFinanc(False);
  Cds.fieldbyname('LANCAFINANC').Asstring := cLancaFinanc;
  Cds.fieldbyname('PLANO').Asinteger := ParamIntegra.Plano;
  If (Trim(CmpForCli.Text) = '') Then Cds.fieldbyname('IDFORCLI').Clear;
  iOldPortadorForma := Cds.fieldbyname('CODPORTFORMA').AsInteger;

  FazerQryCCusto;
End;

procedure TfrmPortadorFormaMT.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  iOldPortadorForma := -1;
  If sBtnSim.Down Then  SetaLancaFinanc(True)
  Else SetaLancaFinanc(False);
  Cds.fieldbyname('PLANO').Asinteger := ParamIntegra.Plano;
  If (Trim(CmpForCli.Text) = '') Then Cds.fieldbyname('IDFORCLI').Clear;
  iOldPortadorForma := Cds.fieldbyname('CODPORTFORMA').AsInteger;
  If ParamIntegra.RecPag = 'P' Then
  Begin
     If (CmbTipoPgto.ItemIndex <> -1) And (Trim(CmbModeloCnab.Text) <> '') Then
        Cds.fieldbyname('CODTIPOPAGTO').AsInteger := CtrlIntBanco.BuscaTipoFormaSisPag(True,
                                                                  False,
                                                                   CmbTipoPgto.ItemIndex,
                                                                   StrToInt(CmbModeloCnab.LookupValue));
     If (CmbFormaPgto.ItemIndex <> -1) And (Trim(CmbModeloCnab.Text) <> '') Then
        Cds.fieldbyname('CODFORMAPAGTO').AsInteger := CtrlIntBanco.BuscaTipoFormaSisPag(False,
                                                                   False,
                                                                   CmbFormaPgto.ItemIndex,
                                                                   StrToInt(CmbModeloCnab.LookupValue));
  end;
  Cds.fieldbyname('LANCAFINANC').Asstring := cLancaFinanc;
  If edDescricao.CanFocus Then
     edDescricao.SetFocus;
End;

procedure TfrmPortadorFormaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  PgPortForma.ActivePage := TbsContas;
  If MontaSelect.RetornouValor Then
  Begin
     cds.data := CtrlPortadorforma.ListPortadorforma( ParamIntegra.RecPag, StrToInt(MontaSelect.ValoresChave[0]), Sistema.IdEmpresa );
     FazerQryCCusto;
     PgPortForma.ActivePage := TbsContas;
     RecuperaLancaFinanc(Cds.fieldbyname('LANCAFINANC').Asstring);
     IF ParamIntegra.RecPag = 'P' Then
     Begin
        MostraTipoForma;
        If Cds.fieldbyname('CODTIPOPAGTO').IsNull Then
           CmbTipoPgto.ItemIndex := -1
        Else
        If CmbModeloCnab.LookupValue <> '' Then
           CmbTipoPgto.ItemIndex := CtrlIntBanco.BuscaTipoFormaSisPag(True,
                                          True,
                                          Cds.fieldbyname('CODTIPOPAGTO').AsInteger,
                                          StrToInt(CmbModeloCnab.LookupValue));

        If (Cds.fieldbyname('CODFORMAPAGTO').IsNull) or (CmbModeloCnab.LookupValue = '') Then
           CmbFormaPgto.ItemIndex := -1
        Else
           CmbFormaPgto.ItemIndex := CtrlIntBanco.BuscaTipoFormaSisPag(False,
                                           True,
                                           Cds.fieldbyname('CODFORMAPAGTO').AsInteger,
                                           StrToInt(CmbModeloCnab.LookupValue));
     End;
  End;
End;

procedure TfrmPortadorFormaMT.CmeCadastroDelete(Sender: TObject);
begin
  CdsAux.data := CtrlINTBANCOXPORTFORM.ListINTBANCOXPORTFORM(Cds.fieldbyname('CODPORTFORMA').Asfloat);
  if not Cdsaux.IsEmpty then
  begin
     Cdsaux.Delete;
     CtrlINTBANCOXPORTFORM.GravarINTBANCOXPORTFORM;
  end;
  inherited;
  PgPortForma.ActivePage := TbsContas;
End;

procedure TfrmPortadorFormaMT.CmbModeloCnabCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If (CmeCadastro.Operacao In [OpInserir, OpAlterar]) And Modified Then
      MostraTipoForma;
end;

procedure TfrmPortadorFormaMT.MostraTipoForma;
Begin
  If (ParamIntegra.RecPag = 'P') Then
  Begin
     CmbTipoPgto.Text := '';
     CmbFormaPgto.Text := '';
     If (Trim(CmbModeloCnab.Text) <> '') Then
     Begin
       CmbTipoPgto.Items    := CtrlIntBanco.EncheListaTipoFormaSispag(True,StrToInt(CmbModeloCnab.LookupValue));
       CmbFormaPgto.Items   := CtrlIntBanco.EncheListaTipoFormaSispag(False,StrToInt(CmbModeloCnab.LookupValue));

       CmbTipoPgto.Enabled  := (CtrlIntBanco.ObrigaTipoPagto(CtrlIntBanco.IndiceDoBanco));
       CmbFormaPgto.Enabled := (CtrlIntBanco.ObrigaFormaPagto(CtrlIntBanco.IndiceDoBanco));
     End
     Else
     Begin
       CmbTipoPgto.Items.Clear;
       CmbFormaPgto.Items.Clear;
     End
  End;
End;

procedure TfrmPortadorFormaMT.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  If (ActiveControl.Tag <> 9999) And (CdsUnidNegoc.fieldbyname('UNETIPO').AsString <> 'A') Then
  Begin
     MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarning,[mbOk],0);
     If dblcUnidNegoc.CanFocus Then
        dblcUnidNegoc.SetFocus;
  End;
end;

procedure TfrmPortadorFormaMT.FazerQryCCusto;
begin
  If ParamIntegra.IntegraContab Then
     CdsCCusto.data := CtrlCentroCusto.ListaCentCustCompleto(0,Sistema.IdEmpresa,ParamIntegra.Plano,
               Trim(CContabil.Conta.Numero),tccAmbos,toccNome);
end;

procedure TfrmPortadorFormaMT.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var sMensagem : String;
Begin
 inherited;
  Accept := True;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
     If (Trim(CmbModeloCnab.Text) = '') then
        Cds.FieldByName('CODARQUIVOREMESSA').AsFloat := -1;
     If (ParamIntegra.RecPag = 'R') Then
     Begin
        If (Trim(CmbModeloCnab.Text) <> '') And
           Not CtrlIntBanco.ValidaNumInscricaoEmpresa(EdtNumEmpresa.Text,
                                            StrToInt(CmbModeloCnab.LookupValue)) Then
        Begin
           MsgDlg('Número da Empresa no Banco Incorreto!','Erro',mtError,[mbOK],0);
           PgPortForma.ActivePage := TbsForma;
           If EdtNumEmpresa.CanFocus Then
              EdtNumEmpresa.SetFocus;
           Accept := False;
        end;
        If (Trim(CmbModeloCnab.Text) <> '')  And
           Not CtrlIntBanco.ValidaNossoNumero(EdtNossoNumero.Text, StrToInt(CmbModeloCnab.LookupValue), sMensagem) Then
        Begin
           MsgDlg('Nosso Numero Incorreto!'+#13+sMensagem ,'Erro',mtError,[mbOK],0);
           PgPortForma.ActivePage := TbsForma;
           If EdtNossoNumero.CanFocus Then
              EdtNossoNumero.SetFocus;
           Accept := False;
        end;
     End;
     If CmbFormadeRecebimento.Text = '' Then
     Begin
        MsgDlg('Favor indicar ' + lblFormapg.Caption,'Erro',mtError,[mbOK],0);
        PgPortForma.ActivePage := TbsContas;
        If CmbFormadeRecebimento.CanFocus Then
           CmbFormadeRecebimento.SetFocus;
        Accept := False;
     End;
     If (ParamIntegra.RecPag = 'P') And (CmbModeloCnab.Text <> '') Then
     Begin
        If (CtrlIntBanco.ObrigaTipoPagto(CtrlIntBanco.IndiceDoBanco)) And (CmbTipoPgto.Text = '') Then
        Begin
           MsgDlg('Favor indicar o tipo de pagamento','Erro',mtError,[mbOK],0);
           PgPortForma.ActivePage := TbsForma;
           If CmbTipoPgto.CanFocus Then
              CmbTipoPgto.SetFocus;
           Accept := False;
       End;
       If (CtrlIntBanco.ObrigaFormaPagto(CtrlIntBanco.IndiceDoBanco)) And (CmbFormaPgto.Text = '') Then
       Begin
          MsgDlg('Favor indicar a forma de pagamento','Erro',mtError,[mbOK],0);
          PgPortForma.ActivePage := TbsForma;
          If CmbFormaPgto.CanFocus Then
             CmbFormaPgto.SetFocus;
          Accept := False;
       End;
    End;
    PgPortForma.ActivePage := TbsContas;
    if (edDescricao.Text) = '' then
    begin
       MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOK],0);
       PgPortForma.ActivePage := TbsContas;
       If edDescricao.CanFocus Then
          edDescricao.SetFocus;
       Accept := False;
    end;
    if (dblkcmbPortadorContar.Text) = '' then
    begin
       MsgDlg('Obrigatório preencher a Conta Bancária/Caixa','Erro',mtError,[mbOK],0);
       PgPortForma.ActivePage := TbsContas;
       If dblkcmbPortadorContar.CanFocus Then
          dblkcmbPortadorContar.SetFocus;
       Accept := False;
    end;
    if ParamIntegra.IntegraContab then
    Begin
       If CContabil.Valida <> VcOk Then
          Accept := False;
       If (dblkSubconta.Text = '') And  CContabil.Conta.ObrigaSubConta Then
       begin
          MsgDlg('Obrigatório a Indicação da subconta','Aviso',mtError,[mbOk],0);
          dblkSubconta.SetFocus;
          Accept := False;
       end;
       If CContabil.Conta.ObrigaCentrodeCusto And (cmbCCusto.Text = '') Then
       Begin
          MsgDlg('Obrigatório preencher o centro de custo','Erro',mtError,[mbOK],0);
          Accept := False;
          If cmbCCusto.CanFocus Then
             cmbCCusto.SetFocus;
       End;
       If TbsEmissao <> nil Then
       Begin
          CContabilCheque.PermiteChaveEmBranco := ((Not CkbContabEmissao.Checked) Or (not ParamIntegra.IntegraContab));
          If (ParamIntegra.IntegraContab) And
             (ParamIntegra.RecPag = 'P') And
             (sbtnSim.Down) And
             (CContabilCheque.Valida <> VcOk) Then
          Accept := False;
       End
       Else
       Begin
          If (ParamIntegra.IntegraContab) And
             (ParamIntegra.RecPag = 'P') And
             (sbtnSim.Down) Then
             Accept := False;
       End;
    End;
    Cds.fieldbyname('LANCAFINANC').Asstring := cLancaFinanc;
    If ParamIntegra.RecPag = 'P' Then
    Begin
       If (CmbTipoPgto.ItemIndex <> -1) And (Trim(CmbModeloCnab.Text) <> '') Then
          Cds.fieldbyname('CODTIPOPAGTO').AsInteger := CtrlIntBanco.BuscaTipoFormaSisPag(True,
                                                                           False,
                                                                           CmbTipoPgto.ItemIndex,
                                                                           StrToInt(CmbModeloCnab.LookupValue));
       If (CmbFormaPgto.ItemIndex <> -1) And (Trim(CmbModeloCnab.Text) <> '') Then
          Cds.fieldbyname('CODFORMAPAGTO').AsInteger :=  CtrlIntBanco.BuscaTipoFormaSisPag(False,
                                                                             False,
                                                                             CmbFormaPgto.ItemIndex,
                                                                             StrToInt(CmbModeloCnab.LookupValue));
    End;
  End;
End;

procedure TfrmPortadorFormaMT.CContabilExit(Sender: TObject);
begin
  inherited;
  CContabil.AceitaTipoConta := SoAnalitica;
  FazerQryCCusto;
end;

procedure TfrmPortadorFormaMT.CmpForCliExit(Sender: TObject);
begin
  inherited;
  if (CmeCadastro.Operacao In [OpInserir, OpAlterar]) And (ActiveControl.Tag <> 9999) then
    if (CmpForCli.Valida = VcOk) And (CmpForCli.Text <> '') then
       If ParamIntegra.IntegraContab Then
          if ParamIntegra.RecPag = 'R' then
          Begin
             if trim(CmpForCli.ForCliReg.CContabil) = '' then
             begin
                MsgDlg('Como a contabilidade está integrada, é obrigatório preencher a conta contabil deste Cliente','Erro',mtError,[mbOk],0);
                bbtnCancelar.Click;
                exit;
             end;
          end
          else
          if trim(CmpForCli.ForCliReg.CContabil) = '' then
          begin
             MsgDlg('Como a contabilidade está integrada, é obrigatório preencher a conta contabil deste Fornecedor','Erro',mtError,[mbOk],0);
             bbtnCancelar.Click;
             exit;
          end;
end;

procedure TfrmPortadorFormaMT.CContabilApertouBotao(Sender: TObject);
begin
  inherited;
  CContabil.AceitaTipoConta := Indiferente;
end;

procedure TfrmPortadorFormaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlPortadorforma.GravarPortadorforma(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmPortadorFormaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlPortadorforma.GravarPortadorforma(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmPortadorFormaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlPortadorforma.GravarPortadorforma(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmPortadorFormaMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPortadorforma.MessageInfo <> '' Then
     MsgDlg(CtrlPortadorforma.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmPortadorFormaMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
  begin
    If (iOldPortadorForma <> -1) Then
      Try
        If Not CtrlIntBanco.SetParametros(iOldPortadorForma,ParamIntegra.Recpag) Then
        Begin
          MsgDlg('Os Parâmetros para o arquivo intbanco não foram setados corretamente','Erro',mtError,[mbOK],0);
        End

      Except
      End;


  end;
end;

procedure TfrmPortadorFormaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    CtrlIntBanco.Free;

    CtrlPortadorconta.free;
    CtrlFormaRecPag.free;
    CtrlTemplbloqcheque.free;
    CtrlTemplcheque.free;
    CtrlConfigbarras.free;
    CtrlModeloscnab.free;
    CtrlUnidnegocio.free;
    CtrlINTBANCOXPORTFORM.free;
    CtrlCentroCusto.free;
    CtrlPortadorforma.free;
    CtrlSubConta.free;
end;

End.
