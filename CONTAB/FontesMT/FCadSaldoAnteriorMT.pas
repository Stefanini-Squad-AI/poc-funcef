
unit FCadSaldoAnteriorMT;

(*==============================================================================
Analista           : Marcus Oliveira
Data               : 18/05/2007
Pendência          : 25055
Descrição          : Envia um mensagem de erro quando o usuário tenta passar uma conta
                     Sintética
(*==============================================================================
Analista           : Antonio Marcos Fernandes de Souza (amf)
Data               : 23.12.2005
Pendência          : 15329
Alteração          : O wwwDBlookUpComboBox estava considerando o codcentrocusto.
                     Passou a utilizar na propriedade selected o codexterno.
==============================================================================*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, Mask, wwdblook, MontaSelect, uCtrlPeriodo,
  Db, DBClient, uCMClientDataSet, uCtrlContaContabil, uCtrlListTerceiros, uCtrlPlanoSaldo,
  CMProcuraMask, uCtrlSubConta,uCtrlContab,
  uCMTypes;



type
  TfrmCadSaldoAnteriorMT = class(TfrmOkCancelar)
    Label8: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkCCusto: TwwDBLookupCombo;
    Label15: TLabel;
    btnSeleciona: TBitBtn;
    btnAtivProj: TBitBtn;
    edtNomeAtivProj: TEdit;
    mskUnidNegoc: TMaskEdit;
    mskAtivProj: TMaskEdit;
    Label1: TLabel;
    btnSubConta: TBitBtn;
    edtNomeSubConta: TEdit;
    mskSubConta: TMaskEdit;
    Label16: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    sbtnCreditoCorrente: TSpeedButton;
    sbtnDebitoCorrente: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    sbtnCreditoOficial: TSpeedButton;
    sbtnDebitoOficial: TSpeedButton;
    sbtnCreditoHistorico: TSpeedButton;
    sbtnDebitoHistorico: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    sbtnCreditoGer1: TSpeedButton;
    sbtnDebitoGer1: TSpeedButton;
    sbtnCreditoGer2: TSpeedButton;
    sbtnDebitoGer2: TSpeedButton;
    sbtnCreditoGer3: TSpeedButton;
    sbtnDebitoGer3: TSpeedButton;
    redSaldoCorrente: TRealEdit;
    redSaldoOficial: TRealEdit;
    redSaldoHistorico: TRealEdit;
    redSaldoGer3: TRealEdit;
    redSaldoGer2: TRealEdit;
    redSaldoGer1: TRealEdit;
    MontaSelectAtivProj: TMontaSelect;
    CdsExercicio: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    CdsSaldoDaConta: TCMClientDataSet;
    cmpConta: TCMProcuraMaskContabil;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    MontaSelectSubConta: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskSubContaExit(Sender: TObject);
    procedure btnSubContaClick(Sender: TObject);
    procedure btnSelecionaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskAtivProjExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure cmpContaExit(Sender: TObject);
  private
    { Private declarations }
    iUnidNegoc, iSubConta  :integer;
    dDebitoCorrente, dDebitoOficial, dDebitoHist :Double;
    dDebitoGer, dDebitoGeren1, dDebitoGeren2     :Double;
    dCreditoCor, dCreditoOficial,dCreditoHist    :Double;
    dCreditoGer, dCreditoGeren1, dCreditoGeren2  :Double;
    dOrcadoDebito, dOrcadoCredito                : Double;
    iPlanoPrev,iPatro  :integer;
    sCcusto  :string;
    ObrigaCentroCusto :string;
    ObrigaSubConta    :string;
    sTipoConta        :string;

    CtrlPeriodo       :TCtrlPeriodo;
    CtrlContaContabil :TCtrlContaContabil;
    CtrlSubConta      :TCtrlSubConta;
    ListTerceiros     :TCtrlListTerceiros;
    CtrlPlanoSaldo    :TCtrlPlanoSaldo;
    CtrlContab        :TCtrlContab;
    procedure InicializaVariaveis;
    procedure VerificaBotoes;
    procedure TrazDadosParaTela;
    procedure LimpaControles;
  public
    { Public declarations }
  end;

var
  frmCadSaldoAnteriorMT: TfrmCadSaldoAnteriorMT;

implementation

uses UMensErro, uDatabase, DBaseDados, uSistema,
     uModulo,  uFuncaoGeral;

{$R *.DFM}

procedure TfrmCadSaldoAnteriorMT.TrazDadosParaTela;
begin
   If CdsSaldoDaConta.FieldByName('PLSDEBITOCORRENTE').asFloat = 0 Then
   Begin
      If CdsSaldoDaConta.FieldByName('PLSCREDITOCOR').asFloat = 0 Then
      Begin
         redSaldoCorrente.value  := 0;
         sbtnDebitoCorrente.down := true;
      End Else
      Begin
         redSaldoCorrente.value   := CdsSaldoDaConta.FieldByName('PLSCREDITOCOR').asFloat;
         sbtnCreditoCorrente.down := true;
      End;
   End Else
   Begin
      redSaldoCorrente.value   := CdsSaldoDaConta.FieldByName('PLSDEBITOCORRENTE').asFloat;
      sbtnDebitoCorrente.down  := true;
   End;
   //-----------------------------------------------------------------------
   If CdsSaldoDaConta.FieldByName('PLSDEBITOOFICIAL').asFloat = 0 Then
   Begin
      If CdsSaldoDaConta.FieldByName('PLSCREDITOOFICIAL').asFloat = 0 Then
      Begin
         redSaldoOficial.value  := 0;
         sbtnDebitoOficial.down := true;
      End Else
      Begin
         redSaldoOficial.value   := CdsSaldoDaConta.FieldByName('PLSCREDITOOFICIAL').asFloat;
         sbtnCreditoOficial.down := true;
      End;
   End Else
   Begin
      redSaldoOficial.value   := CdsSaldoDaConta.FieldByName('PLSDEBITOOFICIAL').asFloat;
      sbtnDebitoOficial.down  := true;
   End;
   //-----------------------------------------------------------------------
   If CdsSaldoDaConta.FieldByName('PLSDEBITOHIST').asFloat = 0 Then
   Begin
      If CdsSaldoDaConta.FieldByName('PLSCREDITOHIST').asFloat = 0 Then
      Begin
         redSaldoHistorico.value  := 0;
         sbtnDebitoHistorico.down := true;
      End Else
      Begin
         redSaldoHistorico.value   := CdsSaldoDaConta.FieldByName('PLSCREDITOHIST').asFloat;
         sbtnCreditoHistorico.down := true;
      End;
   End Else
   Begin
      redSaldoHistorico.value   := CdsSaldoDaConta.FieldByName('PLSDEBITOHIST').asFloat;
      sbtnDebitoHistorico.down  := true;
   End;
   //-----------------------------------------------------------------------
   If CdsSaldoDaConta.FieldByName('PLSDEBITOGER').asFloat = 0 Then
   Begin
     If CdsSaldoDaConta.FieldByName('PLSCREDITOGER').asFloat = 0 Then
     Begin
       redSaldoGer1.value  := 0;
       sbtnDebitoGer1.down := true;
     End Else
     Begin
       redSaldoGer1.value   := CdsSaldoDaConta.FieldByName('PLSCREDITOGER').asFloat;
       sbtnCreditoGer1.down := true;
     End;
   End Else
   Begin
     redSaldoGer1.value   := CdsSaldoDaConta.FieldByName('PLSDEBITOGER').asFloat;
     sbtnDebitoGer1.down  := true;
   End;
   //-----------------------------------------------------------------------
   If CdsSaldoDaConta.FieldByName('PLSDEBITOGEREN1').asFloat = 0 Then
   Begin
     If CdsSaldoDaConta.FieldByName('PLSCREDITOGEREN1').asFloat = 0 Then
     Begin
        redSaldoGer2.value  := 0;
        sbtnDebitoGer2.down := true;
     End Else
     Begin
        redSaldoGer2.value   := CdsSaldoDaConta.FieldByName('PLSCREDITOGEREN1').asFloat;
        sbtnCreditoGer2.down := true;
     End;
   End Else
   Begin
     redSaldoGer2.value   := CdsSaldoDaConta.FieldByName('PLSDEBITOGEREN1').asFloat;
     sbtnDebitoGer2.down  := true;
   End;
   //-----------------------------------------------------------------------
   If CdsSaldoDaConta.FieldByName('PLSDEBITOGEREN2').asFloat = 0 Then
   Begin
     If CdsSaldoDaConta.FieldByName('PLSCREDITOGEREN2').asFloat = 0 Then
     Begin
       redSaldoGer3.value  := 0;
       sbtnDebitoGer3.down := true;
     End Else
     Begin
       redSaldoGer3.value   := CdsSaldoDaConta.FieldByName('PLSCREDITOGEREN2').asFloat;
       sbtnCreditoGer3.down := true;
     End;
   End Else
   Begin
     redSaldoGer3.value   := CdsSaldoDaConta.FieldByName('PLSDEBITOGEREN2').asFloat;
     sbtnDebitoGer3.down  := true;
   End;

end;

procedure TfrmCadSaldoAnteriorMT.VerificaBotoes;
begin
    InicializaVariaveis;

    If sbtnDebitoCorrente.down Then
    Begin
       dDebitoCorrente := redSaldoCorrente.value;
       dCreditoCor     := 0;
    End Else
    Begin
      dDebitoCorrente := 0;
      dCreditoCor     := redSaldoCorrente.value;
    End;

    If sbtnDebitoOficial.down Then
    Begin
       dDebitoOficial  := redSaldoOficial.value;
       dCreditoOficial := 0;
    End Else
    Begin
       dDebitoOficial  := 0;
       dCreditoOficial := redSaldoOficial.value;;
    End;

    If sbtnDebitoHistorico.down Then
    Begin
       dDebitoHist  := redSaldoHistorico.value;
       dCreditoHist := 0;
    End Else
    Begin
       dDebitoHist  := 0;
       dCreditoHist := redSaldoHistorico.value;
    End;

    If sbtnDebitoGer1.down Then
    Begin
       dDebitoGer  :=  redSaldoGer1.value;
       dCreditoGer := 0;
    End Else
    Begin
       dDebitoGer  := 0;
       dCreditoGer := redSaldoGer1.value;
    End;

    If sbtnDebitoGer2.down Then
    Begin
       dDebitoGeren1  :=  redSaldoGer2.value;
       dCreditoGeren1 := 0;
    End Else
    Begin
       dDebitoGeren1  := 0;
       dCreditoGeren1 := redSaldoGer2.value;
    End;

    If sbtnDebitoGer3.down Then
    Begin
       dDebitoGeren2  := redSaldoGer3.value;
       dCreditoGeren2 := 0;
    End Else
    Begin
       dDebitoGeren2  := 0;
       dCreditoGeren2 := redSaldoGer3.value;
    End;

end;


procedure TfrmCadSaldoAnteriorMT.InicializaVariaveis;
begin
   sCcusto         := '';
   iUnidNegoc      := 0;
   iSubConta       := 0;
   dDebitoCorrente := 0;
   dDebitoOficial  := 0;
   dDebitoHist     := 0;
   dDebitoGer      := 0;
   dDebitoGeren1   := 0;
   dDebitoGeren2   := 0;
   dCreditoCor     := 0;
   dCreditoOficial := 0;
   dCreditoHist    := 0;
   dCreditoGer     := 0;
   dCreditoGeren1  := 0;
   dCreditoGeren2  := 0;
   dOrcadoDebito   := 0;
   dOrcadoCredito  := 0;

   If mskAtivProj.text = '' Then
   Begin
       CtrlPlanoSaldo.RetornaUnidNegoc(Sistema.IdEmpresa);
       iUnidNegoc := CtrlPlanoSaldo.UnidNegoc;
   End Else
       iUnidNegoc := CdsAtivProj.FieldByName('UNIDNEGOC').AsInteger;
   //----------------------------------------------
   If mskSubConta.text <> '' Then
      iSubConta := StrToInt(mskSubConta.text)
   Else
      iSubConta := 0;
   //----------------------------------------------
   If dblkCCusto.text <> '' Then
   Begin
      sCcusto  := Trim(CdsCentroCusto.FieldByName('CODCENTROCUSTO').asString);
   End Else
   Begin
      sCcusto   := '';
   End;
   //----------------------------------------------
   If dblcPlanoPrevC.text <> '' Then
       iPlanoPrev :=  StrToInt(dblcPlanoPrevC.LookupValue)
   Else
       iPlanoPrev := 0;
   //----------------------------------------------
   If dblcPatroC.text <> '' Then
       iPatro :=  StrToInt(dblcPatroC.LookupValue)
    Else
        iPatro := 0;

end;


procedure TfrmCadSaldoAnteriorMT.LimpaControles;
begin
   dblkCCusto.text         := '';
   mskSubConta.text        := '';
   edtNomeSubConta.text    := '';
   mskAtivProj.text        := '';
   edtNomeAtivProj.text    := '';
   mskUnidNegoc.text       := '';
   dblcPlanoPrevC.Text     := '';
   dblcPatroC.Text         := '';
   cmpConta.Clear;

   dblkCCusto.enabled      := false;
   dblkCCusto.color        := clBtnFace;

   mskSubConta.enabled     := false;
   mskSubConta.color       := clBtnFace;
   edtNomeSubConta.enabled := false;
   edtNomeSubConta.color   := clBtnFace;
   btnSubConta.enabled     := false;

   redSaldoCorrente.value  := 0;
   redSaldoOficial.value   := 0;
   redSaldoHistorico.value := 0;
   redSaldoGer1.value      := 0;
   redSaldoGer2.value      := 0;
   redSaldoGer3.value      := 0;

   sbtnDebitoCorrente.down  := true;
   sbtnDebitoOficial.down   := true;
   sbtnDebitoHistorico.down := true;
   sbtnDebitoGer1.down      := true;
   sbtnDebitoGer2.down      := true;
   sbtnDebitoGer3.down      := true;


end;


procedure TfrmCadSaldoAnteriorMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe saldo ***
  CtrlPlanoSaldo := TCtrlPlanoSaldo.Create;
  CtrlPlanoSaldo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe subconta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAtivProj.Data  := ListTerceiros.ListAtivProj(-1,0,'',tapAmbos,toapCodigo);
  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;


  // *** Instancia a classe geral ContaContab ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe periodo ***
  CtrlPeriodo   := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa,True);

  // *** Instancia a classe geral CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  // *** Atribui mascaras para os campos ***
  cmpConta.Plano        := CtrlContab.PlanoParam;
  cmpConta.Mascara      := CtrlContab.MascaraContaParam;
  mskAtivProj.EditMask  := Modulo.sMascaraUnidNegoc + ';0; ';

  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

  pnlPlanoPatroC.Enabled := Sistema.UsaPlanoPatro;
end;


procedure TfrmCadSaldoAnteriorMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
  MontaSelectAtivProj.Executar;
  Repaint;
  If MontaSelectAtivProj.RetornouValor Then
  Begin
    CdsAtivProj.Data    := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,StrToFloat(MontaSelectAtivProj.ValoresChave[1]),MontaSelectAtivProj.ValoresChave[0],tapAmbos,toapCodigo);
    If CdsAtivProj.FieldByName('UNETIPO').AsString = 'S' Then
    Begin
      MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
      mskAtivProj.SetFocus;
      Exit;
    End Else
    Begin
      mskAtivProj.text     := CdsAtivProj.FieldByName('UNECODIGO').asString;
      mskUnidNegoc.text    := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
      edtNomeAtivProj.Text := CdsAtivProj.FieldByName('NOME').asString;
    End;
  End;

end;

procedure TfrmCadSaldoAnteriorMT.mskSubContaExit(Sender: TObject);
begin
  inherited;
  If (trim(mskSubConta.Text) <> '')  And (trim(mskSubConta.Text) <> '0') Then
  Begin

    CdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(Trim(mskSubConta.Text)));

    If CdsSubConta.IsEmpty Then
    Begin
      MsgDlg('Subconta não existe ou não é permitida para esta conta contábil','Aviso',mtWarning,[mbOk],0);
      mskSubConta.SetFocus;
      Exit;
    End;
    edtNomeSubConta.Text := CdsSubConta.FieldByName('NOMESUBCONTA').asString;
  End;


end;

procedure TfrmCadSaldoAnteriorMT.btnSubContaClick(Sender: TObject);
begin
   inherited;
  MontaSelectSubConta.Executar;
  Repaint;
  If MontaSelectSubConta.RetornouValor Then
  Begin
    CdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(MontaSelectsubConta.ValoresChave[0]));
    mskSubConta.text := CdsSubConta.FieldByName('CODSUBCONTA').asString;
    edtNomeSubConta.Text := CdsSubConta.FieldByName('NOMESUBCONTA').asString;
  End;

end;

procedure TfrmCadSaldoAnteriorMT.btnSelecionaClick(Sender: TObject);
begin
   inherited;

   InicializaVariaveis;

   CdsSaldoDaConta.Data := CtrlPlanoSaldo.RetornaSaldoDaConta(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),
                                                              iUnidNegoc,CtrlContab.PlanoParam,iSubConta,
                                                              StrToIntDef(dblcPlanoPrevC.LookupValue,0),
                                                              StrToIntDef(dblcPatroC.LookupValue,0),
                                                              Trim(cmpConta.Conta.Numero),sCcusto);


   If  CdsSaldoDaConta.IsEmpty Then
   Begin
       MsgDlg('Nenhum saldo encontrado para a Conta Contábil selecionada.','Aviso',mtWarning,[mbOK],0);
       Exit;
   End;

   { Caso contrario, Controla valores nos edits e os botões}

   TrazDadosParaTela;

end;


procedure TfrmCadSaldoAnteriorMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlanoSaldo.Free;
  CtrlContaContabil.Free;
  CtrlPeriodo.Free;
  CtrlSubConta.Free;
  ListTerceiros.Free;
  CtrlContab.Free;

end;

procedure TfrmCadSaldoAnteriorMT.mskAtivProjExit(Sender: TObject);
begin
  inherited;
  If mskAtivProj.text <> '' Then
  Begin

    CdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,Trim(mskAtivProj.Text),tapAmbos,toapCodigo);

    If Not CdsAtivProj.IsEmpty Then
    Begin
       If CdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
       Begin
         MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
         mskAtivProj.SetFocus;
         Exit;
       End Else
       Begin
         mskAtivProj.text     := CdsAtivProj.FieldByName('UNECODIGO').asString;
         mskUnidNegoc.text    := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
         edtNomeAtivProj.Text := CdsAtivProj.FieldByName('NOME').asString;
       End
    End Else
    Begin
       MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
       mskAtivProj.SetFocus;
    End;

  End;
end;


procedure TfrmCadSaldoAnteriorMT.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   {verifica campos obrigatorios}
   InicializaVariaveis;

   If dblkExercicio.text = '' Then
   Begin
      MessageDlg('Exercício não selecionado.',mtWarning,[mbOK],0);
      dblkExercicio.SetFocus;
      Abort;
   End;
   // *** Se a conta é sintética, envia critica ***
   if sTipoConta = 'S' then
   begin
      MsgDlg('A Conta contábil não pode ser Sintética', 'Erro', mtError, [mbOK], 0);
      Abort;
      cmpConta.SetFocus;
   end;

   If cmpConta.Conta.Numero = '' Then
   Begin
      MessageDlg('Conta Contábil não informada.',mtWarning,[mbOK],0);
      cmpConta.SetFocus;
      Abort;
   End;

   If (ObrigaCentroCusto = 'S') and (dblkCCusto.text = '') Then
   Begin
     MessageDlg('A Conta selecionada obriga Centro de Custo.',mtWarning,[mbOK],0);
     dblkCCusto.SetFocus;
      Abort;
   End;

   If (ObrigaSubConta = 'S') and (mskSubConta.Text = '') Then
   Begin
     MessageDlg('A Conta selecionada obriga uma Sub Conta.',mtWarning,[mbOK],0);
     mskSubConta.SetFocus;
      Abort;
   End;

   VerificaBotoes;

   CdsSaldoDaConta.Data := CtrlPlanoSaldo.RetornaSaldoDaConta(Sistema.IdEmpresa,StrToInt(dblkExercicio.text),
                                                              iUnidNegoc,CtrlContab.PlanoParam,iSubConta,
                                                              StrToIntDef(dblcPlanoPrevC.LookupValue,0),
                                                              StrToIntDef(dblcPatroC.LookupValue,0),
                                                              Trim(cmpConta.Conta.Numero),sCcusto);
   If CdsSaldoDaConta.IsEmpty Then
   Begin
     {Se a conta não tiver saldo, inclui}

     If CtrlPlanoSaldo.InserePlanoSaldo(CtrlContab.PlanoParam,iUnidNegoc,Sistema.IdUsuario,Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdEmpresa,StrToInt(dblkExercicio.text),
                             0,iPatro,iPlanoPrev,iSubConta,trim(cmpConta.Conta.Numero),sCcusto, sTipoConta, dDebitoCorrente,
                             dCreditoCor, dDebitoOficial, dCreditoOficial, dDebitoHist,dCreditoHist,dDebitoGer,
                             dCreditoGer,dDebitoGeren1,dCreditoGeren1,dDebitoGeren2,dCreditoGeren2,dOrcadoDebito,
                             dOrcadoCredito) Then
       LimpaControles
     Else Begin
            MsgDlg(CtrlPlanoSaldo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
            Exit;
          End
   End Else
   Begin
     If CtrlPlanoSaldo.AlteraSaldoAnterior(Sistema.IdEmpresa,Sistema.idModulo,Sistema.IdUsuario,CdsSaldoDaConta.FieldByName('IDPLANOSALDO').asInteger,
                                        dDebitoCorrente, dCreditoCor, dDebitoOficial, dCreditoOficial,
                                        dDebitoHist,dCreditoHist,dDebitoGer,dCreditoGer,dDebitoGeren1,
                                        dCreditoGeren1,dDebitoGeren2,dCreditoGeren2) Then
        LimpaControles
     Else Begin
            MsgDlg(CtrlPlanoSaldo.MessageInfo,'Aviso',mtWarning,[mbOk],0);
            Exit;
          End;

   End;

end;


procedure TfrmCadSaldoAnteriorMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
   LimpaControles;

end;

procedure TfrmCadSaldoAnteriorMT.cmpContaExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
       cmpConta.SetFocus;
       LimpaControles;
       Exit;
    End;

    // *** Pega o tipo da conta ***
    If CtrlContaContabil.TestaContaContabil(CtrlContab.PlanoParam,Sistema.idEmpresa,1,StrToIntDef(dblkExercicio.LookupValue,0),cmpConta.Conta.Numero,True,True) Then
       sTipoConta := CtrlContaContabil.TipoContaContabil;

    // *** Verifica se a conta obriga Sub-Conta ***
    If cmpConta.Conta.ObrigaSubConta Then
    Begin
       mskSubConta.enabled   := true;
       mskSubConta.color     := clWindow;
       btnSubConta.enabled   := true;
       edtNomeSubConta.color := clWindow;
       CdsSubConta.Data      := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,0);
    End Else
    Begin
       mskSubConta.color     := clBtnFace;
       mskSubConta.Text      := '';
       mskSubConta.enabled   := false;
       btnSubConta.enabled   := false;
       edtNomeSubConta.color := clbtnFace;
    End;

    // *** verifica se obriga o centro de custo ***
    If cmpConta.Conta.ObrigaCentrodeCusto Then
    Begin
       dblkCCusto.enabled := true;
       dblkCCusto.color   := clWindow;
       CdsCentroCusto.Data :=  CtrlContaContabil.ListContasxCC(CtrlContab.PlanoParam,Sistema.idEmpresa,Trim(cmpConta.Conta.Numero),'',tccAmbasCC,toCodigo);
    End Else
    Begin
       dblkCCusto.color   := clBtnFace;
       dblkCCusto.enabled := false;
    End;

end;

end.
