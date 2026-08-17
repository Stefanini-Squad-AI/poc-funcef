unit FCadPlanilRateioMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, DBCtrls, StdCtrls, CMProcuraMask, TREdit, wwdblook,
  Mask, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  Buttons, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ComCtrls,
  TabControlDetalhe, ExtCtrls,uCtrlContab,uCtrlPrePlanilhaRA,
  uCtrlSubConta,uCtrlContaContabil,uCtrlListTerceiros,
  uCMTypes;


type
  TfrmCadPlanilRateioMT = class(TFrmCadastroMestreDetMT)
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    mskAtivProj: TMaskEdit;
    edtUnidNegoc: TEdit;
    btnAtivProj: TBitBtn;
    dblkCCustoBase: TwwDBLookupCombo;
    dblkTipoOper: TwwDBLookupCombo;
    dbePercent: TDBRealEdit;
    cmpContaBase: TCMProcuraMaskContabil;
    mskSubConta: TMaskEdit;
    cmpConta: TCMProcuraMaskContabil;
    dblkCCusto: TwwDBLookupCombo;
    btnSubConta: TBitBtn;
    CdsSubConta: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsCentroCustoBase: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    MontaSelectSubConta: TMontaSelect;
    CdsPreDetalhe: TCMClientDataSet;
    lblPrePronta: TLabel;
    edDescRateio: TDBEdit;
    grpContaperc: TDBRadioGroup;
    procedure cmpContaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskSubContaExit(Sender: TObject);
    procedure btnSubContaClick(Sender: TObject);
    procedure grpContapercClick(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure cmpContaBaseExit(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private

    rTotal : Double;
    CtrlPrePlanilhaRA  : TCtrlPrePlanilhaRA;
    CtrlContaContabil  : TCtrlContaContabil;
    CtrlSubconta       : TCtrlSubConta;
    CtrlContab         : TCtrlContab;
    ListTerceiros      : TCtrlListTerceiros;

  public
    { Public declarations }
  end;

var
  frmCadPlanilRateioMT: TfrmCadPlanilRateioMT;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema,
     uModulo, uFuncaoGeral;

{$R *.DFM}


procedure TfrmCadPlanilRateioMT.cmpContaExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
      cmpConta.SetFocus;
      Exit;
    End;


end;

procedure TfrmCadPlanilRateioMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe principal pre-planilha ***
  CtrlPrePlanilhaRA := TCtrlPrePlanilhaRA.Create;
  CtrlPrePlanilhaRA.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPrePlanilhaRA.cdsPrePlanilha := Cds;
  Cds.Data := CtrlPrePlanilhaRA.ListPrePlanilha(-1,-1,'');

  CtrlPrePlanilhaRA.cdsPreDetalhe := CdsPreDetalhe;

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);

  CdsPreDetalhe.Data := CtrlPrePlanilhaRA.ListCdsDetalheRA(-1);
  TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask   := modulo.sMascaraContas + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('PANCCUSTOBASE')).EditMask  := CtrlContab.MascaraContaParam + ';0; ';

  // *** Instancia a classe SubConta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe ContaContabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsCentroCusto.Data     := ListTerceiros.ListCentroCusto(Sistema.IdEmpresa,'','A');
  CdsCentroCustoBase.Data := ListTerceiros.ListCentroCusto(Sistema.IdEmpresa,'','A');
  CdsTipoOper.Data        := ListTerceiros.ListTipoOper(True);
  CdsAtivProj.Data        := ListTerceiros.ListAtivProj(-1,0,'',tapAmbos,toapNome);


  // *** Atribui mascaras para os campos ***
  cmpConta.Plano        := CtrlContab.PlanoParam;
  cmpConta.Mascara      := CtrlContab.MascaraContaParam;
  cmpContaBase.Plano    := CtrlContab.PlanoParam;
  cmpContaBase.Mascara  := CtrlContab.MascaraContaParam;
  mskAtivProj.EditMask  := Modulo.sMascaraUnidNegoc + ';0; ';

  // *** Atribui filtros para os monta select ***
  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));
  MontaSelect.Filtro.Add('PREPLANILHA.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));

end;

procedure TfrmCadPlanilRateioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ListTerceiros.Free;
  CtrlPrePlanilhaRA.Free;
  CtrlContaContabil.Free;
  CtrlSubconta.Free;
  CtrlContab.Free;

end;

procedure TfrmCadPlanilRateioMT.mskSubContaExit(Sender: TObject);
begin
  inherited;
  If mskSubConta.text <> '' Then
  Begin
     CdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(mskSubConta.Text));

     If  Not CdsSubConta.isEmpty Then
     Begin
        mskSubConta.text := CdsSubConta.FieldByName('CODSUBCONTA').asString;
     End Else
     Begin
        MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
        If mskSubConta.CanFocus Then mskSubConta.SetFocus;
     End;
  End;

end;

procedure TfrmCadPlanilRateioMT.btnSubContaClick(Sender: TObject);
begin
  inherited;
   MontaSelectSubConta.Executar;
   Repaint;
   If MontaSelectSubConta.RetornouValor Then
   Begin
      CdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(MontaSelectSubConta.ValoresChave[1]));
      mskSubConta.text := CdsSubConta.FieldByName('CODSUBCONTA').asString;
   End;

end;

procedure TfrmCadPlanilRateioMT.grpContapercClick(Sender: TObject);
begin
  inherited;
   If grpContaPerc.itemIndex = 0 Then
   Begin
      dbePercent.enabled := false;
      dbePercent.color   := clBtnFace;

      cmpConta.enabled      := false;
      dblkCCusto.enabled     := false;
      dblkCCusto.color       := clBtnFace;
      mskSubConta.enabled   := false;
      mskSubConta.color     := clBtnFace;
      mskAtivProj.enabled   := false;
      mskAtivProj.color     := clBtnFace;
      btnSubConta.enabled   := false;
      btnAtivProj.enabled   := false;

      cmpContaBase.enabled  := true;
      dblkCCustoBase.enabled := true;
      dblkCCustoBase.color   := clWindow;

   End Else
   Begin
      dbePercent.enabled := true;
      dbePercent.color   := clWindow;

      cmpConta.enabled       := true;
      dblkCCusto.enabled     := true;
      dblkCCusto.color       := clWindow;
      mskSubConta.enabled    := true;
      mskSubConta.color      := clWindow;
      mskAtivProj.enabled    := true;
      mskAtivProj.color      := clWindow;
      btnSubConta.enabled    := true;
      btnAtivProj.enabled    := true;

      cmpContaBase.enabled   := false;
      dblkCCustoBase.enabled := false;
      dblkCCustoBase.color   := clBtnFace;
   End;

end;

procedure TfrmCadPlanilRateioMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
   MontaSelectAtivProj.Executar;
   Repaint;

   If MontaSelectAtivProj.RetornouValor Then
   Begin
      CdsAtivProj.Data :=  ListTerceiros.ListAtivProj(Sistema.IdEmpresa,StrToFloat(MontaSelectAtivProj.ValoresChave[1]),MontaSelectAtivProj.ValoresChave[0],tapAmbos,toapNome);

      If CdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
      Begin
        MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
        btnAtivProj.SetFocus;
        Exit;
      End Else
      Begin
        mskAtivProj.text  := CdsAtivProj.FieldByName('UNECODIGO').asString;
        edtUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
      End;
   End;

end;

procedure TfrmCadPlanilRateioMT.mskAtivProjExit(Sender: TObject);
begin
  inherited;
  If mskAtivProj.text <> '' Then
  Begin

     CdsAtivProj.Data :=  ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,mskAtivProj.Text,tapAmbos,toapNome);

     If not CdsAtivProj.isEmpty Then
     Begin
        If CdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
        Begin
           MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
           mskAtivProj.SetFocus;
           Exit;
        End Else
        Begin
           edtUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
        End;
     End Else
     Begin
        MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
        mskAtivProj.SetFocus;
     End;

  End;

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;

   //* ** Faz a verificação do preenchimento dos campos ***
   If Cds.State in [dsInsert, dsEdit] Then
   Begin
     If (edDescRateio.Text = '') Then
     Begin
        MsgDlg('Descrição da Planilha de Rateio não informada.','Erro',mtError,[mbOk],0);
        edDescRateio.SetFocus;
        Accept := False;
     End;

     If CtrlPrePlanilhaRA.PlanilhaTemNomesIguais(Trim(edDescRateio.Text),Cds.FieldByName('PANCODIGO').AsFloat) Then
     Begin
       MsgDlg('Já existe uma planilha cadastrada com esse nome','Erro',mtError,[mbOk],0);
       edDescRateio.SetFocus;
       Accept := false;
     End
  End;

end;



procedure TfrmCadPlanilRateioMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsPreDetalhe.First;
   while Not CdsPreDetalhe.Eof do
      CdsPreDetalhe.Delete;

  inherited;

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlPrePlanilhaRA.Apagar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlPrePlanilhaRA.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlPrePlanilhaRA.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
     //inherited;
     Cds.Data := CtrlPrePlanilhaRA.ListPrePlanilha(Cds.FieldByName('PANCODIGO').asFloat,
                               Sistema.IdEmpresa,Cds.FieldByName('PANIDENTIFICACAO').asString);

     //*** Abre o cds filho (detalhe) ***
     CdsPreDetalhe.Data := CtrlPrePlanilhaRA.ListCdsDetalheRA(Cds.FieldByName('PANCODIGO').asFloat);
     TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask   := modulo.sMascaraContas + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('PANCCUSTOBASE')).EditMask  := CtrlContab.MascaraContaParam + ';0; ';

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

  // *** Redesenha o form na volta do MontaSelect  ***
  Repaint;

  If MontaSelect.RetornouValor Then
  Begin

     //*** Abre o cds princial (mestre) ***
     Cds.Data := CtrlPrePlanilhaRA.ListPrePlanilha(StrToFloat(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa,MontaSelect.ValoresChave[1]);

     If Cds.FieldByName('PANCONTAPERC').asString = 'P' Then
        rTotal := CtrlPrePlanilhaRA.TotalPerc(Cds.FieldByName('PANCODIGO').asFloat)
     Else
        rTotal := CtrlPrePlanilhaRA.ContaBase(Cds.FieldByName('PANCODIGO').asFloat);

     //*** Abre o cds filho (detalhe) ***
     CdsPreDetalhe.Data := CtrlPrePlanilhaRA.ListCdsDetalheRA(StrToFloat(MontaSelect.ValoresChave[0]));
     TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask   := modulo.sMascaraContas + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('PANCCUSTOBASE')).EditMask  := CtrlContab.MascaraContaParam + ';0; ';

     grpContaPercClick(self);
  End;

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If edDescRateio.canFocus Then edDescRateio.SetFocus;

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroInsert(Sender: TObject);
begin
   Cds.Data := CtrlPrePlanilhaRA.ListPrePlanilha(-1,-1,'');
   rTotal := 0;
   inherited;

   //Define o os valores default do registro que se está inserindo
   Cds.FieldByName('PANIDENTIFICACAO').AsString := 'R';
   Cds.FieldByName('IDPESSOA').AsInteger        := Sistema.idempresa;
   Cds.FieldByName('PANCONTAPERC').AsString     := 'C';
   Cds.FieldByName('PANPROCESSADA').AsString    := 'N';

   grpContaPercClick(self);

  CdsPreDetalhe.Data := CtrlPrePlanilhaRA.ListCdsDetalheRA(Cds.FieldByName('PANCODIGO').asFloat);
  TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('PANCONTABASE')).EditMask   := modulo.sMascaraContas + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('PANCCUSTOBASE')).EditMask  := CtrlContab.MascaraContaParam + ';0; ';

   If edDescRateio.canFocus Then edDescRateio.SetFocus;

end;

procedure TfrmCadPlanilRateioMT.CmeDetalheConfirma(Sender: TObject);
begin

    If CdsPreDetalhe.State in [dsInsert, dsEdit] Then
    Begin

      If Cds.FieldByName('PANCONTAPERC').asString = 'C' Then
      Begin
         If cmpContaBase.Conta.Numero = '' Then
         Begin
            MsgDlg('Conta Contábil Base devem ser selecionada.','Aviso',mtWarning,[mbOk],0);
            cmpContaBase.SetFocus;
            Exit;
         End;

         If rTotal = 1 Then
         Begin
            MsgDlg('Apenas uma Conta Base pode ser atribuída para este Rateio.','Aviso',mtWarning,[mbOk],0);
            cmpContaBase.SetFocus;
            Exit;
         End;

         rTotal := rTotal + 1;
      End Else
      Begin

         // *** Faz a verificação do preenchimento dos campos ***
         If (cmpConta.Conta.Numero = '') And (dblkCCusto.Text = '') Then
         Begin
            MsgDlg('Conta Contábil ou Centro de Custo devem ser selecionados.','Aviso',mtWarning,[mbOk],0);
            cmpConta.SetFocus;
            Exit;
         End;

         If (dbePercent.value = 0) Then
         Begin
            MsgDlg('Percentual deve ser preenchido.','Aviso',mtWarning,[mbOk],0);
            dbePercent.SetFocus;
            Exit;
         End;

         rTotal := rTotal + dbePercent.value;
      End;

      //Grava os campos a partir das mask-edit's
      If cmpConta.Conta.Numero <> '' Then
      Begin
         CdsPreDetalhe.FieldByName('PLANO').asInteger   := CtrlContab.PlanoParam;
      End;

      If cmpContaBase.Conta.Numero <> '' Then
      Begin
         CdsPreDetalhe.FieldByName('PLANO').asInteger       := CtrlContab.PlanoParam;
      End;

      If Trim(mskSubConta.text) <> '' Then
      Begin
         CdsPreDetalhe.FieldByName('IDPESSOA').asInteger    := Sistema.idEmpresa;
         CdsPreDetalhe.FieldByName('CODSUBCONTA').asString  := mskSubConta.text;
      End;

      If Trim(mskAtivProj.text) <> '' then begin
      Begin
         CdsPreDetalhe.FieldByName('IDPESSOA').asInteger    := Sistema.idEmpresa;
         CdsPreDetalhe.FieldByName('UNIDNEGOC').asString    := edtUnidNegoc.text;
      End;

      If Trim(dblkCCusto.text) <> '' Then
      Begin
         CdsPreDetalhe.FieldByName('IDEMPRESA').asInteger     := Sistema.idEmpresa;
      End;

      If Trim(dblkCCustoBase.text) <> '' Then
      Begin
         CdsPreDetalhe.FieldByName('IDEMPRESA').asInteger    := Sistema.idEmpresa;
      End;

    End;
end;
   inherited;


end;

procedure TfrmCadPlanilRateioMT.CmeDetalheEdit(Sender: TObject);
begin
   inherited;
   If Cds.FieldByName('PANCONTAPERC').asString = 'C' Then
      rTotal := rTotal - 1
   Else
      rTotal := rTotal - CdsPreDetalhe.FieldByName('PANPERC').asFloat;

   If grpContaPerc.itemIndex = 0 Then
   Begin
      mskSubConta.Text  := '';
      cmpContaBase.SetFocus;
      dblkCCustoBase.Setfocus;
   End Else
   Begin
     dblkCCustoBase.Text := '';
     mskAtivProj.Text    := CdsPreDetalhe.FieldByName('UNECODIGO').asString;
     edtUnidNegoc.Text   := CdsPreDetalhe.FieldByName('UNIDNEGOC').asString;
     mskSubConta.Text    := CdsPreDetalhe.FieldByName('CODSUBCONTA').asString;
     cmpConta.SetFocus;
     mskAtivProj.Setfocus;
   End;


end;

procedure TfrmCadPlanilRateioMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
   mskSubConta.text   := '';
   mskAtivProj.text   := '';
   edtUnidNegoc.text  := '';

   CdsPreDetalhe.FieldByName('IDPESSOA').AsInteger          := Sistema.idempresa;
   CdsPreDetalhe.FieldByName('PLANO').AsInteger             := CtrlContab.PlanoParam;
   CdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;


end;

procedure TfrmCadPlanilRateioMT.cmpContaBaseExit(Sender: TObject);
begin
  inherited;
    If (ActiveControl.Tag <> 999) and (cmpContaBase.Valida <> VcOK) Then
    Begin
      cmpContaBase.SetFocus;
      Exit;
    End;

end;

procedure TfrmCadPlanilRateioMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPrePlanilhaRA.MessageInfo <> '' Then
     MsgDlg(CtrlPrePlanilhaRA.MessageInfo,'Erro',mtError,[mbOK],0);

end;

end.
