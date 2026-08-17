// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
//Analista : Marcus Oliveira
//Data     : 29/06/2007
//Pendência: 25226
//Descrição: Desativado a rotina de grava seqremessa, pois não vi em nenhum momento
//           a necessidade disso
//==================================================================================
//Analista : Antonio Marcos (amf)
//Data     : 19.06.2007
//Descrição: Correção de bug referente ao cdsSeqRemessa.
//==================================================================================
//Analista : Marcus Oliveira
//Data     : 12/04/2007
//Pendência: 24823
//Descrição: Criar um Flag para desativa a o PortadorForma.

{**************************************************************************}
{                                                                          }
{ CM Soluções Informática                                                  }
{ ** Todos os Direitos Reservados                                          }
{ Gerada pelo "CM Bussines Object Builder"                                 }
{ Analista Responsável: Nome do Desenvolvedor                              }
{ Atualizado Em: 04/08/2003 - André Tavares - 04/08/2003 - pendência 14217 }
{                12/09/2003 - André Tavares - pendência 15017              }
{                10/05/2004 - André Tavares - pendência 16550              }
{                25/05/2004 - André Tavares - pendência 15376              }
{                05/08/2005 - andre tavares - pendencia 19543 - ocultar a pasta geral no CAR }
{**************************************************************************}
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
  uCtrlPortadorforma, uCMTypes, uCtrlIntBanco, uCtrlPadroes, uCtrlSeqRemessa, // andre tavares - 19/01/2005 - pendência 18494
  uCtrlParamGlobal,uctrlTipodocrecpag, uCmSqlParams, fcLabel; //André Tavares - pendência 15376 - 25/05/2004

type
  TfrmPortadorFormaMT = class(TFrmCadastroMT)
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
    lblValorMax: TLabel;
    DBEdtValMax: TwwDBEdit;
    CmbFormaPgtoAlt: TComboBox;
    Label8: TLabel;
    Bevel1: TBevel;
    wwDBSpinEdit2: TwwDBSpinEdit;
    Label12: TLabel;
    DbCkAlteradores: TDBCheckBox;
    dsModelosCnab: TwwDataSource;
    CdsParamGlobal: TCMClientDataSet;
    CdsSeqRemessa: TCMClientDataSet;
    DBCheckBox2: TDBCheckBox;
    dsSeqRemessa: TwwDataSource;
    DblkNumEmpresa: TwwDBLookupCombo;
    CmbTipoPgto: TwwDBComboBox;
    Lbltipodoc: TLabel;
    dblkcmbtipdoc: TwwDBLookupCombo;
    CdsTipo: TCMClientDataSet;
    dstipo: TwwDataSource;
    dbchkFlgEncContas: TDBCheckBox;
    Panel1: TPanel;
    dbRdgArqivo: TDBRadioGroup;
    dbchkDTcredito: TDBCheckBox;
    DBFlgAtivo: TDBCheckBox;
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
    procedure CdsBeforeInsert(DataSet: TDataSet);
    procedure CdsBeforeEdit(DataSet: TDataSet);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmbModeloCnabChange(Sender: TObject);
    procedure dbchkDTcreditoClick(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbRdgArqivoChange(Sender: TObject);
  
  private
    { Private declarations }
    CtrlParamGlobal   : TCtrlParamGlobal; // André Tavares - pendência 15376 - 25/05/2004
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
    ctrlSeqRemessa        : TCtrlSeqRemessa; // André Tavares - pendência 18494 - 19/01/2005
    ctrlTipodocrecpag     : TCtrlTipodocrecpag;
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
  application.HintHidePause := 30000;
  Panel1.ShowHint := true;

  // início - andre tavares - pendencia 19543 - 05/08/2005
  TbsEmissao.TabVisible := sistema.idmodulo <> 4;
  DBCheckBox2.Visible   := sistema.idmodulo = 4;
  // fim - andre tavares - pendencia 19543 - 05/08/2005

  // início - andré Tavares - pendência 18494 - 19/01/2005
  CtrlSeqRemessa    := TCtrlSeqRemessa.Create;
  CtrlSeqRemessa.InitializeAs( Padroes );
  CtrlSeqRemessa.cds := cdsSeqRemessa;
  cdsSeqRemessa.Data := CtrlSeqRemessa.ListSeqRemessa;
  // fim    - andré Tavares - pendência 18494 - 19/01/2005

  // início - andré Tavares - pendência 15376 - 25/05/2004
  CtrlParamGlobal    := TCtrlParamGlobal.Create;
  CtrlParamGlobal.InitializeAs( Padroes );
  CdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(sistema.IdEmpresa);
  // fim    - andré Tavares - pendência 15376 - 25/05/2004

  CtrlIntBanco      := TCtrlIntBanco.Create;
  CtrlIntBanco.InitializeAs( Padroes );

  CtrlPortadorconta := TCtrlPortadorconta.create;
  CtrlPortadorconta.InitializeAs( Padroes );

  CdsPortadorConta.Data := CtrlPortadorconta.ListPortadorconta(0,ParamIntegra.RecPag,Sistema.idEmpresa);

  CtrlTipodocrecpag := TCtrlTipodocrecpag.Create;
  CtrlTipodocrecpag.InitializeAs( Padroes );



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
  CtrlModeloscnab.cds  := CdsModelosCnab; //André Tavares - pendência 16550 - 10/05/2004
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

  //amf 19.06.2007 - o portadorforma, usa o cdsSeqRemessa
  ctrlPortadorForma.CdsSeqRemessa := ctrlSeqRemessa.cds;

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
     CdsTipo.Data                := CtrlTipodocrecpag.ListTipodocrecpag(ParamIntegra.RecPag,0);
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
     LblTipoDoc.Visible          := true;
     dblkcmbtipdoc.Visible       := True;
  End
  Else
  Begin
     CdsModeloCheque.data        := CtrlTemplcheque.ListTemplcheque(0);
     DblkNumEmpresa.Parent        := PnlSISPAG;
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
// Daniel Simões - 25/01/2006 - Início------------------------------------------
     HelpContext                 := 30050;
     bbtnAjuda.HelpContext       := 30050;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
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

//início 01/08/2003 - André Tavares - pendência 14643
     If (CmbFormaPgtoAlt.ItemIndex <> -1) And (Trim(CmbModeloCnab.Text) <> '') Then
        Cds.fieldbyname('CODFORMAPGTOALT').AsInteger := CtrlIntBanco.BuscaTipoFormaSisPag(False,
                                                                   False,
                                                                   CmbFormaPgtoAlt.ItemIndex,
                                                                 StrToInt(CmbModeloCnab.LookupValue));
//fim 01/08/2003 - André Tavares - pendência 14643

// inicio - André Tavares - pendência 15017 - 12/09/2003
     if CmbFormaPgtoAlt.text = '' then
     begin
       Cds.fieldbyname('CODFORMAPGTOALT').AsString := '';
     end;
// fim - André Tavares - pendência 15017 - 12/09/2003

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


//início 01/08/2003 - André Tavares - pendência 14643
        If (Cds.fieldbyname('CODFORMAPGTOALT').IsNull) or (CmbModeloCnab.LookupValue = '') Then
           CmbFormaPgtoAlt.ItemIndex := -1
        Else
           CmbFormaPgtoAlt.ItemIndex := CtrlIntBanco.BuscaTipoFormaSisPag(False,
                                           True,
                                           Cds.fieldbyname('CODFORMAPGTOALT').AsInteger,
                                           StrToInt(CmbModeloCnab.LookupValue));
//fim 01/08/2003 - André Tavares - pendência 14643
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
       CmbTipoPgto.Items       := CtrlIntBanco.EncheListaTipoFormaSispag(True,StrToInt(CmbModeloCnab.LookupValue));
       CmbFormaPgto.Items      := CtrlIntBanco.EncheListaTipoFormaSispag(False,StrToInt(CmbModeloCnab.LookupValue));

//início 01/08/2003 - André Tavares - pendência 14643
       CmbFormaPgtoAlt.Items   := CtrlIntBanco.EncheListaTipoFormaSispag(False,StrToInt(CmbModeloCnab.LookupValue));
//fim 01/08/2003 - André Tavares - pendência 14643
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
               Trim(CContabil.Conta.Numero),tccAmbos,toccNome, true, cdsParamGlobal.fieldByName('IDPLANCENTCUST').asFloat);
end;

procedure TfrmPortadorFormaMT.CmeCadastroBeforeConfirma(sender: TObject;  var Accept: Boolean);
var
   sMsg : String;
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
           Not CtrlIntBanco.ValidaNumInscricaoEmpresa(DblkNumEmpresa.LookupValue,
                                            StrToInt(CmbModeloCnab.LookupValue)) Then
        Begin
           MsgDlg('Número da Empresa no Banco Incorreto!','Erro',mtError,[mbOK],0);
           PgPortForma.ActivePage := TbsForma;
           If DblkNumEmpresa.CanFocus Then
              DblkNumEmpresa.SetFocus;
           Accept := False;
        end;
        If (Trim(CmbModeloCnab.Text) <> '')  And
           Not CtrlIntBanco.ValidaNossoNumero(EdtNossoNumero.Text, StrToInt(CmbModeloCnab.LookupValue), sMsg) Then
        Begin
           MsgDlg('Nosso Numero Incorreto!','Erro',mtError,[mbOK],0);
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

//início 01/08/2003 - André Tavares - pendência 14643
       If (CmbFormaPgtoAlt.ItemIndex <> -1) And (Trim(CmbModeloCnab.Text) <> '') Then
          Cds.fieldbyname('CODFORMAPGTOALT').AsInteger :=  CtrlIntBanco.BuscaTipoFormaSisPag(False,
                                                                             False,
                                                                             CmbFormaPgtoAlt.ItemIndex,
                                                                             StrToInt(CmbModeloCnab.LookupValue));
//fim 01/08/2003 - André Tavares - pendência 14643
// inicio - André Tavares - pendência 15017 - 12/09/2003
      if CmbFormaPgtoAlt.text = '' then
      begin
        Cds.fieldbyname('CODFORMAPGTOALT').AsString := '';
      end;
// fim - André Tavares - pendência 15017 - 12/09/2003

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
  Accept := CtrlPortadorforma.GravarPortadorforma(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario)
          and CtrlModeloscnab.GravarModeloscnab; //André Tavares - pendência 16550 - 10/05/2004
end;

procedure TfrmPortadorFormaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin

  inherited;

  Accept := CtrlPortadorforma.GravarPortadorforma(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario)
          and CtrlModeloscnab.GravarModeloscnab //André Tavares - pendência 16550 - 10/05/2004
end;

procedure TfrmPortadorFormaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPortadorforma.GravarPortadorforma(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario)
            and CtrlModeloscnab.GravarModeloscnab //André Tavares - pendência 16550 - 10/05/2004
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

// início André Tavares - pendência 15099
  If CmeCadastro.Operacao = OpInserir Then
    iOldPortadorForma := CtrlPortadorForma.CodPortForma;
// fim André Tavares - pendência 15099

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

procedure TfrmPortadorFormaMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CtrlParamGlobal.Free; // andré Tavares - pendência 15376 - 25/05/2004
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
  CtrlSeqRemessa.free;  // andré Tavares - pendência 18494 - 19/01/2005
  inherited;
end;

procedure TfrmPortadorFormaMT.CdsBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  cdsSeqRemessa.Insert;
end;

procedure TfrmPortadorFormaMT.CdsBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  cdsSeqRemessa.Edit;
end;

procedure TfrmPortadorFormaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  dblkcmbPortadorContar.text := '';
  CmbFormadeRecebimento.text := '';
  dblkcmbtipdoc.Text :='';
  dbseDMais.value := 0;
  edDescricao.Text := '';
  CContabil.Clear;
  cmbCCusto.text := '';
  dblkSubconta.Text := '';
  dblcUnidNegoc.text := '';
  DbEdDescFinan.text := '';
  DbCkAlteradores.Checked := false;
  CmbBloq.Text := '';
  CmbFichaComp.Text := '';
  CmbModeloCnab.Text := '';
  DBCheckBox2.checked := false;
  DblkNumEmpresa.Text := '';
  wwDBEdit1.Text := '';
  EdtNossoNumero.text := '';
  wwDBEdit3.text := '';
  wwDBEdit5.text := '';
  wwDBEdit6.text := '';
  //wwDBEdit7.text := 'C:\';
  wwDBEdit7.text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  //wwDBEdit8.text := 'C:\';
  wwDBEdit8.text := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  CmpForCli.Text := '';
  wwDBComboBox1.text := '';
  wwDBSpinEdit1.value := 0;
  CkbContabEmissao.enabled := false;
  CContabilCheque.Clear;
  CkbIndicaFavorecido.Checked := false;
  DBCheckBox1.checked := false;
  CkbCtrlTalao.checked := false;
end;

procedure TfrmPortadorFormaMT.CmbModeloCnabChange(Sender: TObject);
begin
  inherited;
  If ParamIntegra.RecPag = 'P' Then
  Begin
    if StrToIntDef(CmbModeloCnab.LookupValue, -1) in [55, 56, 57] then  //se modelos do banespa ou banco real (folha de pagamento cnab 240) 
    begin
      DBRadioGroup1.Items.text  := CtrlIntBanco.CodAvisoBanespa(false);
      DBRadioGroup1.Values.text := CtrlIntBanco.CodAvisoBanespa(true);
    end else begin
      DBRadioGroup1.Items.text := 'Não Emite'+#13#10+
                                  'No Agendamento'+#13#10+
                                  'Após Pagamento'+#13#10+
                                  'Agendamento/Pagto'+#13#10+
                                  'Com Cópia Para o Favorecido';

      DBRadioGroup1.Values.text := '0'+#13#10+
                                   '3'+#13#10+
                                   '5'+#13#10+
                                   '9'+#13#10+
                                   '7';
    end;                                                           
  end;
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


procedure TfrmPortadorFormaMT.dbchkDTcreditoClick(Sender: TObject);
begin
  inherited;
  dbRdgArqivoChange(sender);
  if not dbchkDTcredito.checked then
  begin
    dbRdgArqivo.Itemindex := -1;
    dbRdgArqivo.Enabled := false;
  end
  else
  begin
    dbRdgArqivo.Itemindex := 0;
    dbRdgArqivo.Enabled := true;
  end
end;

procedure TfrmPortadorFormaMT.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  dbRdgArqivoChange(sender);
end;

procedure TfrmPortadorFormaMT.dbRdgArqivoChange(Sender: TObject);
begin
  inherited;
  if dbRdgArqivo.Enabled then
  begin
    if dbRdgArqivo.ItemIndex = 0 then
    begin
      Panel1.Hint := 'Funcionalidade disponível somente para o LAYOUT padrão CNAB 240 dos bancos: '+ #13+
                     'Banco do Brasil, Banespa Santander e Abn Anro.'+ #13+
                     'Exemplo: se Data Programada do Documento é 26/03, então a data no arquivo será '+#13+
                     '(Data Programada - FLOAT) = 25/03 se o FLOAT = 1.';
    end
    else
    begin
      Panel1.Hint := 'Funcionalidade disponível somente para o LAYOUT padrão CNAB 240 dos bancos: '+ #13+
                     'Banco do Brasil, Banespa Santander e Abn Anro.'+ #13+
                     'Exemplo: Se Data Programada do Documento é 26/03, então a data no arquivo será '+#13+
                     '(Data Programada + FLOAT) = 27/03 se o FLOAT = 1.';
    end;
    application.HintHidePause := 30000;
    Panel1.ShowHint := true;
  end;
end;

End.
