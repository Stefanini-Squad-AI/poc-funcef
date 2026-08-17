//ATUALIZAÇÃO: André Tavares - pendência 15375 - 24/05/2004 -
//Utilização do método ListCentroCusto com parametrização e utilização do código externo

unit FCadContasMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, ComCtrls, Mask,
  wwdbedit, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, CMProcuraMask,
  DBCtrls, uCalcDv, CmEventosCadastro, ImgList, FCadastroMT,
  DBClient, uCMClientDataSet, uCtrlPortadorconta, uCtrlMoeda, uCtrlSubConta,
  uCtrlUnidNegocio, uCtrlCentroCusto, uCtrlTerceirosCAPCAR, uCMTypes,
  uctrlParamGlobal, uCmSqlParams, Wwdbspin; // André Tavares - pendência 15375 - 24/05/2004

type
  TfrmCadContasMT = class(TFrmCadastroMT)
    gbIntContab: TGroupBox;
    dbeDescricao: TwwDBEdit;
    dbeContaCorrente: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    lblBanco: TLabel;
    dblcAgencia: TwwDBLookupCombo;
    lblAgencia: TLabel;
    lblConta: TLabel;
    lblDescricao: TLabel;
    dblcMoeda: TwwDBLookupCombo;
    lblMoeda: TLabel;
    CContabil: TCMProcuraMaskContabil;
    dbckGeraFluxo: TDBCheckBox;
    lblCentroCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    Label20: TLabel;
    dblkSubconta: TwwDBLookupCombo;
    lblUnidNegoc: TLabel;
    dblcUnidNegoc: TwwDBLookupCombo;
    DBRadioGroup1: TDBRadioGroup;
    CdsBanco: TCMClientDataSet;
    CdsAgencia: TCMClientDataSet;
    CdsMoeda: TCMClientDataSet;
    Cdsccusto: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    CdsUnidNegocS: TCMClientDataSet;
    Label1: TLabel;
    wwDBEdit1: TwwDBEdit;
    cdsParamGlobal: TCMClientDataSet;
    DBCheckBox1: TDBCheckBox;
    dbSpDiasApura: TwwDBSpinEdit;
    lblCpmf: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dblcAgenciaEnter(Sender: TObject);
    procedure FazerQryCCusto;
    procedure FazerQryAgencia;
    procedure dbeDescricaoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CContabilExit(Sender: TObject);
    procedure dblcBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcUnidNegocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    CalculaDvConta :TCalcDv;
    CtrlPortadorconta    : TCtrlPortadorconta;
    CtrlMoeda            : TCtrlMoeda;
    CtrlSubConta         : TCtrlSubConta;
    CtrlUnidNegocio      : TCtrlUnidNegocio;
    CtrlCentroCusto      : TCtrlCentroCusto;
    CtrlTerceirosCAPCAR  : TCtrlTerceirosCAPCAR;
    CtrlParamGlobal      : TCtrlParamGlobal; // André Tavares - pendência 15375 - 24/05/2004

    pRecPag              : String;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; lRecPag : String = ''); reintroduce;

  end;

var
  frmCadContasMT: TfrmCadContasMT;

implementation

{$R *.DFM}

uses uMensErro, uDataBase, uCtrlParamIntegra, uSistema, uCtrlPadroes;

constructor TfrmCadContasMT.Create(AOwner: TComponent; lRecPag: String);
begin
   inherited Create(AOwner);

   if trim(lRecPag) = '' then
     pRecPag := ParamIntegra.RecPag
   else
     pRecPag := lRecPag;

end;

procedure TfrmCadContasMT.FormActivate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Add('PORTADORCONTA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
end;

procedure TfrmCadContasMT.dblcAgenciaEnter(Sender: TObject);
begin
  inherited;
  FazerQryAgencia;
end;

procedure TfrmCadContasMT.CmeCadastroFind(Sender: TObject);
begin
if MontaSelect.RetornouValor then
begin
   cds.data := CtrlPortadorconta.ListPortadorconta ( StrToInt(MontaSelect.ValoresChave[0]));
   FazerQryAgencia;
   FazerQryCCusto;
end;
end;

procedure TfrmCadContasMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dblcBanco.SetFocus;
  Cds.FieldByName('FLGGRAVAFLUXO').AsString :='S';
  Cds.FieldByName('FLGSTATUS').AsString     := 'A';
  FazerQryCCusto;
end;

procedure TfrmCadContasMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dblcBanco.SetFocus;
  if Cds.FieldByName('FLGGRAVAFLUXO').isNull then
     Cds.FieldByName('FLGGRAVAFLUXO').AsString:='S';
  If Cds.FieldByName('FLGSTATUS').isNull Then
     Cds.FieldByName('FLGSTATUS').AsString := 'A';
  If CdsBanco.fieldbyname('MASCARACC').IsNull Then
     Cds.fieldbyname('NOCONTACORR').EditMask := ''
  Else
     Cds.fieldbyname('NOCONTACORR').EditMask := CdsBanco.fieldbyname('MASCARACC').AsString + ';1; ';
end;

procedure TfrmCadContasMT.FazerQryAgencia;
begin
  CdsAgencia.data := CtrlTerceirosCapCar.ListAgencia(CdsBanco.FieldByName('IDPessoa').AsInteger );
end;

procedure TfrmCadContasMT.FazerQryCCusto;
begin
   If ParamIntegra.IntegraContab Then
   Begin
      //início - André Tavares - pendência 15375 - 24/05/2004
      //Cdsccusto.data := CtrlCentroCusto.ListaCentroCusto( Sistema.IdEmpresa);
      Cdsccusto.data := CtrlCentroCusto.ListaCentroCusto( Sistema.IdEmpresa, '',
                        true, 1, '', cdsParamGlobal.fieldByName('IDPLANCENTCUST').asFloat);
      //fim - André Tavares - pendência 15375 - 24/05/2004
   End;
end;

procedure TfrmCadContasMT.dbeDescricaoEnter(Sender: TObject);
begin
  inherited;
  if dbeDescricao.Text = '' then
     Cds.FieldByName('DESCRICAO').AsString := dblcBanco.Text+' '+dblcAgencia.Text+' '+dbeContaCorrente.Text;
end;

procedure TfrmCadContasMT.FormCreate(Sender: TObject);
begin
  inherited;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if pRecPag = 'P' then
  begin
    HelpContext           := 30047; //30059;
    bbtnAjuda.HelpContext := 30047; //30059;
  end
  else
  begin
    // OBS.: Não mexi no Help Context do Contas a Receber...
    HelpContext           := 40067;
    bbtnAjuda.HelpContext := 40067;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

  CalculaDvConta      := TCalcDv.Create;
  CtrlPortadorconta   := TCtrlPortadorconta.create;
  CtrlMoeda           := TCtrlMoeda.Create;
  CtrlSubConta        := TCtrlSubConta.Create;
  CtrlUnidNegocio     := TCtrlUnidNegocio.Create;
  CtrlCentroCusto     := TCtrlCentroCusto.Create;
  CtrlTerceirosCAPCAR := TCtrlTerceirosCapCar.Create;
  CtrlParamGlobal     := TCtrlParamGlobal.Create; // André Tavares - pendência 15375 - 24/05/2004

  CtrlPortadorconta.InitializeAs(Padroes);
  CtrlMoeda.InitializeAs(Padroes);
  CtrlSubConta.InitializeAs(Padroes);
  CtrlUnidNegocio.InitializeAs(Padroes);
  CtrlCentroCusto.InitializeAs(Padroes);
  CtrlTerceirosCapCar.InitializeAs(Padroes);
  CtrlParamGlobal.InitializeAs(Padroes);  // André Tavares - pendência 15375 - 24/05/2004
  cdsParamGlobal.Data := CtrlParamGlobal.ListaParamGlobal(sistema.IdEmpresa); // André Tavares - pendência 15375 - 24/05/2004

  CdsBanco.data         := CtrlTerceirosCapCar.ListBanco;
  CtrlPortadorconta.cds := cds;
  cds.Data              := CtrlPortadorconta.ListPortadorconta(-1);

  If ParamIntegra.IntegraContab Then
  Begin
    gbIntContab.Enabled := True;
    CContabil.Plano     := ParamIntegra.Plano;
    CContabil.Mascara   := ParamIntegra.MascaraPlano;
    CdsSubConta.data    := CtrlSubConta.ListSubconta (Sistema.idEmpresa, 0 );
    CdsUnidNegocS.data  := CtrlUnidNegocio.ListaUnidNegocio(Sistema.idEmpresa);
    CdsMoeda.data       := CtrlMoeda.ListaMoeda;
  End
  Else
    gbIntContab.Enabled := False;
end;

procedure TfrmCadContasMT.CContabilExit(Sender: TObject);
begin
  inherited;
  FazerQryCCusto;
  If dblcCCusto.CanFocus Then dblcCCusto.SetFocus;
end;


procedure TfrmCadContasMT.dblcBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If CdsBanco.fieldbyname('MASCARACC').IsNull Then
     Cds.fieldbyname('NOCONTACORR').EditMask := ''
  Else
     Cds.fieldbyname('NOCONTACORR').EditMask := CdsBanco.fieldbyname('MASCARACC').AsString + ';1; ';
end;

procedure TfrmCadContasMT.dblcAgenciaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  If Modified Then
     dblcAgencia.LookupValue := dblcAgencia.LookupValue;
end;

procedure TfrmCadContasMT.dblcUnidNegocExit(Sender: TObject);
begin
  inherited;
  If ((ActiveControl = nil) Or (ActiveControl.Tag <> 9999)) And
     (CdsUnidNegocs.fieldbyname('UNETIPO').AsString <> 'A') Then
  Begin
     MsgDlg('Atividade\Projeto tem de ser analítico','Atenção',mtWarning,[mbOk],0);
     If dblcUnidNegoc.CanFocus Then dblcUnidNegoc.SetFocus;
  End;
end;

procedure TfrmCadContasMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CalculaDvConta.Free;
//início - André Tavares - pendência 15375 - 24/05/2004
    CtrlPortadorconta.free;
    CtrlMoeda.free;
    CtrlSubConta.free;
    CtrlUnidNegocio.free;
    CtrlCentroCusto.free;
    CtrlTerceirosCAPCAR.free;
    CtrlParamGlobal.free;
//fim - André Tavares - pendência 15375 - 24/05/2004
end;

procedure TfrmCadContasMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := true;
  If (Trim(dbeContaCorrente.Text) <> '')  And
     (CdsBanco.fieldbyname('FLGVALIDACC').AsString <> 'N') And
     (Not CalculaDvConta.ValidaConta(CdsBanco.FieldByName('NUMBANCO').AsString,
                                    CdsAgencia.FieldByName('NUMAGENCIA').AsString,
                                    dbeContaCorrente.Text,True)) Then Accept := False;

  if trim(dbeDescricao.text) = '' then
     begin
       MsgDlg('Obrigatório preencher a Descrição da Conta','Erro',mtError,[mbOk],0);
       dbeDescricao.SetFocus;
       Accept := False;
     end;

  if ParamIntegra.IntegraContab then
  Begin
     if CContabil.Valida <> VcOk  then  Accept := False;

     If (dblkSubconta.Text = '') And  CContabil.Conta.ObrigaSubConta Then
     begin
        MsgDlg('Obrigatório a Indicação da subconta','Aviso',mtError,[mbOk],0);
        dblkSubconta.SetFocus;
        Accept := False;
     end;

     if (trim(dblcCCusto.Text) = '') and (CContabil.Conta.ObrigaCentrodeCusto) then
     begin
       MsgDlg('Obrigatório preencher o Centro de Custo','Erro',mtError,[mbOk],0);
       If dblcCCusto.CanFocus Then dblcCCusto.SetFocus;
       Accept := False;
     end;
  end;

  If CmeCadastro.Operacao In [OpInserir, OpAlterar] Then
  Begin
    Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    If Cds.FieldByName('PLACONTA').IsNull Then
       Cds.FieldByName('PLANO').Clear
    Else
      Cds.FieldByName('PLANO').AsInteger := ParamIntegra.Plano;
  End;
end;

procedure TfrmCadContasMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlPortadorconta.GravarPortadorconta(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmCadContasMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlPortadorconta.GravarPortadorconta(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmCadContasMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
Accept := CtrlPortadorconta.GravarPortadorconta(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario);
end;

procedure TfrmCadContasMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmCadContasMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If OrigemAbortConfirma in [ OaApplyInsert, OaApplyDelete, OaApplyEdit ] Then
     MsgDlg(CtrlPortadorconta.MessageInfo, 'Erro', MtError, [MbOk], 0);
end;

end.
