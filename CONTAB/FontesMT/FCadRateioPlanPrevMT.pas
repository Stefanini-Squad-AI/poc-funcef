unit FCadRateioPlanPrevMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, wwdblook, CMDBLookupCombo, StdCtrls, CMProcuraMask,
  ExtCtrls, DBCtrls, Mask, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid,
  ComCtrls, TabControlDetalhe,uCtrlPrePlanilha, uCtrlContab,
  uCtrlContaContabil,  uCtrlHistoContab,  uCtrlListTerceiros,
  uCtrlPrePlanilhaRPP, uCMTypes;


type
  TfrmCadRateioPlanPrevMT = class(TFrmCadastroMestreDetMT)
    lblPrePronta: TLabel;
    edDescAutomatico: TDBEdit;
    dbckInativo: TDBCheckBox;
    CdsPreDetalhe: TCMClientDataSet;
    dbrgTipoConta: TDBRadioGroup;
    cmccConta: TCMProcuraMaskContabil;
    dbrgDebCre: TDBRadioGroup;
    Label1: TLabel;
    dblcHistPadrao: TCMDBLookupCombo;
    lblCentCust: TLabel;
    dblcCentroCusto: TCMDBLookupCombo;
    lblAtivProj: TLabel;
    dblcAtivProj: TCMDBLookupCombo;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsHistoPadrao: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure dbrgTipoContaClick(Sender: TObject);
    procedure cmccContaExit(Sender: TObject);
    procedure dbrgDebCreClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
  private
    CtrlPrePlanilhaRPP: TCtrlPrePlanilhaRPP;
    CtrlContab        : TCtrlContab;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlHistoContab   : TCtrlHistoContab;
    ListTerceiros     : TCtrlListTerceiros;
    procedure FazOnClickDbrg;
  public
    { Public declarations }
  end;

var
  frmCadRateioPlanPrevMT: TfrmCadRateioPlanPrevMT;
  sContraPartida : String;


implementation

Uses uSistema, uMensErro, uDataBase, dBaseDados;

{$R *.DFM}

procedure TfrmCadRateioPlanPrevMT.FazOnClickDbrg;
begin
   If dbrgTipoConta.ItemIndex = 0 Then
  Begin
     dbrgDebCre.Enabled       := False;
     dblcHistPadrao.Enabled   := False;
     pnlPlanoPatroC.Enabled   := True;
     cmccConta.Caption        := ' Conta Base ';
  End Else
  Begin
     If dbrgTipoConta.ItemIndex = 1 Then
     Begin
        dbrgDebCre.Enabled       := False;
        dblcHistPadrao.Enabled   := True;
        pnlPlanoPatroC.Enabled   := False;
        cmccConta.Caption        := ' Conta Destino ';
     End Else
     Begin
        dbrgDebCre.Enabled       := True;
        dblcHistPadrao.Enabled   := False;
        pnlPlanoPatroC.Enabled   := False;
        cmccConta.Caption        := ' Contra-Partida ';
        CdsPreDetalhe.FieldByName('PANTIPO').AsString   := 'D';
     End;
  End;

end;


procedure TfrmCadRateioPlanPrevMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal pre-planilha ***
  CtrlPrePlanilhaRPP := TCtrlPrePlanilhaRPP.Create;
  CtrlPrePlanilhaRPP.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPrePlanilhaRPP.cdsPrePlanilha := Cds;
  Cds.Data := CtrlPrePlanilhaRPP.ListPrePlanilha(-1,-1,'');

  CtrlPrePlanilhaRPP.cdsPreDetalhe := CdsPreDetalhe;
  CdsPreDetalhe.Data := CtrlPrePlanilhaRPP.ListCdsDetalheRPP(-1);

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


   // *** Instancia a classe ContaContabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsPatro.Data       := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data   := ListTerceiros.ListPlanoPrev;
  CdsCentroCusto.Data := ListTerceiros.ListCentroCusto(Sistema.IdEmpresa,'','');
  CdsAtivProj.Data    := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,'',tapAmbos,toapNome);


  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');

  // *** Adiciona filtro no monta select ***
  MontaSelect.Filtro.Add('PREPLANILHA.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));

  // *** Iniciliza parametros para as contas ***
  cmccConta.Plano    := CtrlContab.PlanoParam;
  cmccConta.Mascara  := CtrlContab.MascaraContaParam;
  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;

end;

procedure TfrmCadRateioPlanPrevMT.dbrgTipoContaClick(Sender: TObject);
begin
  inherited;
  FazOnClickDbrg;
end;

procedure TfrmCadRateioPlanPrevMT.cmccContaExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) and (cmccConta.Valida <> VcOK) Then
    Begin
     cmccConta.SetFocus;
     exit;
    End;

end;

procedure TfrmCadRateioPlanPrevMT.dbrgDebCreClick(Sender: TObject);
begin
  inherited;
  FazOnClickDbrg;
end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
   Begin
      // *** preeenche o cds mestre ****
      Cds.Data := CtrlPrePlanilhaRPP.ListPrePlanilha(StrToInt(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa,MontaSelect.ValoresChave[1]);

      // *** preenche o cds detalhe ***
      CdsPreDetalhe.Data := CtrlPrePlanilhaRPP.ListCdsDetalheRPP(StrToInt(MontaSelect.ValoresChave[0]));
      TStringField(CdsPreDetalhe.FieldByName('CONTABASE')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
      TStringField(CdsPreDetalhe.FieldByName('CONTADESTINO')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
      TStringField(CdsPreDetalhe.FieldByName('CONTRAPARTIDA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';

   End;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
var iContCPD, iContCPC, iContCO, iContDE  : Integer;
    sCompl : String;

begin
  inherited;
  If Cds.State in [dsInsert, dsEdit] Then
  Begin

     If edDescAutomatico.Text = '' Then
     Begin
       MsgDlg('Nome da planilha não foi preenchido','Erro',mtError,[mbOk],0);
       edDescAutomatico.SetFocus;
       Accept := false;
     End;

     If CtrlPrePlanilhaRPP.PlanilhaTemNomesIguais(Trim(edDescAutomatico.Text),Cds.FieldByName('PANCODIGO').AsFloat) Then
     Begin
        MsgDlg('Já existe uma planilha cadastrada com esse nome','Erro',mtError,[mbOk],0);
        edDescAutomatico.SetFocus;
        Accept := false;
     End;

     //
     iContCO := 0;
     iContDE := 0;
     iContCPD:= 0;
     iContCPC:= 0;
     CdsPreDetalhe.First;
     While not CdsPreDetalhe.EOF do
     Begin
        If CdsPreDetalhe.FieldByName('PANORIGEM').AsString = 'O' Then
        Begin
           iContCO := iContCO + 1;
           sCompl  := 'Origem';
        End Else
        Begin
           If CdsPreDetalhe.FieldByName('PANORIGEM').AsString = 'D' Then
           Begin
              iContDE := iContDE + 1;
              sCompl  := 'Destino';
           End Else
           Begin
              If CdsPreDetalhe.FieldByName('PANTIPO').AsString = 'D' Then
              Begin
                 iContCPD := iContCPD + 1;
                 sCompl  := 'de Contra-Partida a Débito';
              End Else
              Begin
                 iContCPC := iContCPC + 1;
                 sCompl  := 'de Contra-Partida a Crédito';
              End;
           End;
        End;

      If (CdsPreDetalhe.FieldByName('PANCONTABASE').IsNull) Then
      Begin
         MsgDlg('Obrigatório preencher a Conta '+sCompl,'Erro',mtError,[mbOk],0);
         edDescAutomatico.SetFocus;
         Accept := false;
      End;

      If cmccConta.Valida <> VcOk Then
      Begin
         edDescAutomatico.SetFocus;
         exit;
      End;
      CdsPreDetalhe.Next;
   End;

     If iContCO = 0  Then
     Begin
        MsgDlg('Obrigatório ter pelo menos uma Conta Base','Erro',mtError,[mbOk],0);
        edDescAutomatico.SetFocus;
        Accept := false;
     End;

     If iContDE = 0  Then
     Begin
        MsgDlg('Obrigatório ter pelo menos uma Conta Destino','Erro',mtError,[mbOk],0);
        edDescAutomatico.SetFocus;
        Accept := false;
     End;

     If iContCPD <> 1  Then
     Begin
        MsgDlg('Deve-se ter 1 conta de contra-partida a Débito ao invés de '+IntToStr(iContCPD),'Erro',mtError,[mbOk],0);
        edDescAutomatico.SetFocus;
        Accept := false;
     End;

     If iContCPC <> 1  Then
     Begin
        MsgDlg('Deve-se ter 1 conta de contra-partida a Crédito '+IntToStr(iContCPC),'Erro',mtError,[mbOk],0);
        edDescAutomatico.SetFocus;
        Accept := false;
     End;
   End;
end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlPrePlanilhaRPP.Apagar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlPrePlanilhaRPP.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept :=   CtrlPrePlanilhaRPP.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  //inherited;
  // *** preeenche o cds mestre ****
  Cds.Data := CtrlPrePlanilhaRPP.ListPrePlanilha(Cds.FieldByName('PANCODIGO').AsFloat,
                            Sistema.IdEmpresa,Cds.FieldByName('PANIDENTIFICACAO').AsString);

  // *** preenche o cds detalhe ***
  CdsPreDetalhe.Data := CtrlPrePlanilhaRPP.ListCdsDetalheRPP(Cds.FieldByName('PANCODIGO').AsFloat);

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Data := CtrlPrePlanilhaRPP.ListPrePlanilha(-1,-1,'');
  inherited;

  // *** Inicializa o cds mestre o os campos default ***
  Cds.FieldByName('PANIDENTIFICACAO').AsString := 'T';
  Cds.FieldByName('PANINATIVO').AsString       := 'N';
  Cds.FieldByName('IDPESSOA').AsInteger        := Sistema.IdEmpresa;
  Cds.FieldByName('PANCONTAPERC').AsString     := 'C';

  CdsPreDetalhe.Data := CtrlPrePlanilhaRPP.ListCdsDetalheRPP(Cds.FieldByName('PANCODIGO').asInteger);
  TStringField(CdsPreDetalhe.FieldByName('CONTABASE')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CONTADESTINO')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CONTRAPARTIDA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';


  sContraPartida  := '';

  edDescAutomatico.SetFocus;

end;

procedure TfrmCadRateioPlanPrevMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPrePlanilhaRPP.Free;
  CtrlContab.Free;
  CtrlContaContabil.Free;
  ListTerceiros.Free;
  CtrlHistoContab.Free;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If edDescAutomatico.CanFocus Then edDescAutomatico.SetFocus;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroDelete(Sender: TObject);
begin
  // *** Apagar os registros do detalhe antes do apply e commit ***
  CdsPreDetalhe.First;
  While not CdsPreDetalhe.EOF do
     CdsPreDetalhe.Delete;
     
  inherited;

end;

procedure TfrmCadRateioPlanPrevMT.CmeDetalheConfirma(Sender: TObject);
begin
   If CdsPreDetalhe.State in [dsedit, dsinsert] Then
   Begin
      If CdsPreDetalhe.FieldByName('PANORIGEM').AsString = 'O' Then
         CdsPreDetalhe.FieldByName('CONTABASE').AsString := CdsPreDetalhe.FieldByName('PANCONTABASE').AsString
      Else
         If CdsPreDetalhe.FieldByName('PANORIGEM').AsString = 'D' Then
            CdsPreDetalhe.FieldByName('CONTADESTINO').AsString := CdsPreDetalhe.FieldByName('PANCONTABASE').AsString
         Else
            CdsPreDetalhe.FieldByName('CONTRAPARTIDA').AsString := CdsPreDetalhe.FieldByName('PANCONTABASE').AsString;

     CdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').AsInteger  := Sistema.IdUsuario;
     CdsPreDetalhe.FieldByName('PLANO').AsInteger              := CtrlContab.PlanoParam;

   End;

  inherited;

end;

procedure TfrmCadRateioPlanPrevMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  dbrgDebCre.Enabled     := CdsPreDetalhe.FieldByName('PANORIGEM').AsString = 'C';
  dblcHistPadrao.Enabled := CdsPreDetalhe.FieldByName('PANORIGEM').AsString = 'D';

  dbrgTipoConta.SetFocus;

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPrePlanilhaRPP.MessageInfo <> '' Then
     MsgDlg(CtrlPrePlanilhaRPP.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadRateioPlanPrevMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlPrePlanilhaRPP.ListPrePlanilha(-1,-1,'');
  CdsPreDetalhe.Data := CtrlPrePlanilhaRPP.ListCdsDetalheRPP(-1);

end;

procedure TfrmCadRateioPlanPrevMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsPreDetalhe.FieldByName('PANORIGEM').AsString  := 'O';
  dblcHistPadrao.Enabled    := False;
  dbrgDebCre.Enabled        := False;
  dbrgTipoConta.SetFocus;

end;

end.
