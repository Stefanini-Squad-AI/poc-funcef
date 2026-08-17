unit FCadLancRateioMT;

(*==============================================================================
Analista : Alex Pereira
Data     : 06/01/04
Pendência: 14451 Nova estrutura para segregação

Métodos atualizados:

Pendentes: TfrmCadLancRateioMT.bbtnConfirmarClick ==> CtrlLancamento.FazRateio

Solução  : Criar a estrutura IDSEGREGACRITER e DATASEGREGACRITER
           no lançamento contábil.

==============================================================================*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, TREdit, StdCtrls, ExtCtrls, fcLabel, Mask, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, TB97,uCtrlPrePlanilhaRA, MontaSelect,
  Db, DBClient,uCtrlContab, uCtrlHistoContab, uCtrlListTerceiros,
  uCMClientDataSet,uCtrlLancamento, uCtrlSubConta, uCtrlContaContabil,CMProcuraMask;

type
  TfrmCadLancRateioMT = class(TfrmOkCancelar)
    dteData: TCMDateTimePicker;
    Label5: TLabel;
    dblkRateio: TwwDBLookupCombo;
    Label4: TLabel;
    Panel1: TPanel;
    lblCCustoRat: TLabel;
    lblSubContaRat: TLabel;
    Label2: TLabel;
    mskSubContaRat: TMaskEdit;
    dblkCCustoRat: TwwDBLookupCombo;
    btnSubContaRat: TBitBtn;
    edtSubContaRat: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    fcLabel4: TfcLabel;
    dblkHistoricoRat: TwwDBLookupCombo;
    Memo2: TMemo;
    pnlDados: TPanel;
    lblCCustoPar: TLabel;
    lblSubContaPar: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    dblkCCustoPar: TwwDBLookupCombo;
    btnSubContaPar: TBitBtn;
    edtSubContaPar: TEdit;
    mskSubContaPar: TMaskEdit;
    Panel10: TPanel;
    Panel11: TPanel;
    fcLabel3: TfcLabel;
    dblkHistoricoPar: TwwDBLookupCombo;
    mskHistPar1: TMaskEdit;
    mskHistPar2: TMaskEdit;
    mskHistPar3: TMaskEdit;
    mskHistPar4: TMaskEdit;
    mskHistPar5: TMaskEdit;
    rdgRateioDebCre: TRadioGroup;
    edtNumDoc: TEdit;
    Label8: TLabel;
    redValor: TRealEdit;
    Label19: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    Label3: TLabel;
    edtAtivProj: TEdit;
    Label7: TLabel;
    btnAtivProj: TBitBtn;
    mskAtivProj: TMaskEdit;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    cmpContaRat: TCMProcuraMaskContabil;
    cmpContaPar: TCMProcuraMaskContabil;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsHistoPadraoPar: TCMClientDataSet;
    CdsHistoPadraoRat: TCMClientDataSet;
    MontaSelectSubConta: TMontaSelect;
    CdsCentroCustoPar: TCMClientDataSet;
    CdsCentroCustoRat: TCMClientDataSet;
    cdsPlanilhaRateio: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    CdsTipoOper: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    mskUnidNegoc: TMaskEdit;
    mskHistRat1: TMaskEdit;
    mskHistRat2: TMaskEdit;
    mskHistRat3: TMaskEdit;
    mskHistRat4: TMaskEdit;
    mskHistRat5: TMaskEdit;
    cdsSubConta: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure dblkHistoricoRatExit(Sender: TObject);
    procedure dblkHistoricoParExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mskAtivProjExit(Sender: TObject);
    procedure cmpContaRatExit(Sender: TObject);
    procedure btnSubContaRatClick(Sender: TObject);
    procedure mskSubContaRatExit(Sender: TObject);
    procedure mskSubContaParExit(Sender: TObject);
    procedure btnSubContaParClick(Sender: TObject);
    procedure cmpContaParExit(Sender: TObject);
  private
    CtrlConta         :TCtrlContaContabil;
    CtrlSubConta      :TCtrlSubConta;
    CtrlPlanilhaRA    :TCtrlPrePlanilhaRA;
    CtrlContab        :TCtrlContab;
    CtrlHistoContab   :TCtrlHistoContab;
    ListTerceiros     :TCtrlListTerceiros;
    CtrlLancamento    :TCtrlLancamento;
    procedure BuscaAtivProj(sAtivProj:string);
    procedure LimpaTela;
    procedure PreencheHistorico(cDebCre:char);
    procedure BuscaSubConta(sDebCre, sSubConta:string);

  public
    { Public declarations }
  end;

var
  frmCadLancRateioMT: TfrmCadLancRateioMT;
  iSubContaCP,iSubcontaRat,iUnidNegoc :Integer;

implementation

{$R *.DFM}

uses UMensErro, uDatabase, DBaseDados, uSistema, uModulo, uData;

procedure TfrmCadLancRateioMT.FormCreate(Sender: TObject);
begin
  inherited;
   // *** Instancia a classe pre-planilha ***
  CtrlPlanilhaRA := TCtrlPrePlanilhaRA.Create;
  CtrlPlanilhaRA.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  cdsPlanilhaRateio.Data := CtrlPlanilhaRA.ListPlanilhaRat(Sistema.IdEmpresa);

   // *** Instancia a classe Lancamento ***
  CtrlLancamento := TCtrlLancamento.Create;
  CtrlLancamento.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadraoPar.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');
  CdsHistoPadraoRat.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');

  // *** Instancia a classe Subconta  ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe conta contabil ***
  CtrlConta := TCtrlContaContabil.Create;
  CtrlConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);


  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAtivProj.Data  := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,'',tapAmbos,toapCodigo);
  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;
  CdsTipoOper.Data  := ListTerceiros.ListTipoOper(True);

  //Atribui a máscara da ativ/proj e o filtro de pessoa ao MontaSelect
  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));

  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(Sistema.idEmpresa));


  cmpContaRat.Plano    := CtrlContab.PlanoParam;
  cmpContaRat.Mascara  := CtrlContab.MascaraContaParam;
  cmpContaPar.Plano    := CtrlContab.PlanoParam;
  cmpContaPar.Mascara  := CtrlContab.MascaraContaParam;

  mskAtivProj.EditMask   := modulo.sMascaraUnidNegoc + ';0; ';
  pnlPlanoPatroC.Visible := Sistema.UsaPlanoPatro;

end;


procedure TfrmCadLancRateioMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
   MontaSelectAtivProj.Executar;
   Repaint;
   If MontaSelectAtivProj.RetornouValor Then
      BuscaAtivProj(MontaSelectAtivProj.ValoresChave[0]);

end;

procedure TfrmCadLancRateioMT.BuscaAtivProj(sAtivProj: string);
begin
   If sAtivProj <> '' Then
   Begin
      cdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,sAtivProj,tapAmbos,toapCodigo);

      If Not cdsAtivProj.isEmpty Then
      Begin
         if cdsAtivProj.FieldByName('UNETIPO').asString = 'S' Then
         Begin
            MsgDlg('A Atividade/Projeto selecionada deve ser Analítica.','Aviso',mtWarning,[mbOk],0);
            mskAtivProj.SetFocus;
            Exit;
         End Else
         Begin
            mskAtivProj.text  := cdsAtivProj.FieldByName('UNECODIGO').asString;
            mskUnidNegoc.text := IntToStr(cdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
            edtAtivProj.text  := cdsAtivProj.FieldByName('NOME').asString;
         End;
      End Else
      Begin
         MsgDlg('O código da Atividade/Projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
         mskAtivProj.SetFocus;
      End;
   End;

end;

procedure TfrmCadLancRateioMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TfrmCadLancRateioMT.LimpaTela;
begin
   dteData.text          := '';
   dblkRateio.text       := '';

   dblkCCustoPar.text       := '';
   mskSubContaPar.text      := '';
   edtSubContaPar.text  := '';
   cmpContaPar.Clear;

   dblkCCustoPar.text    := '';
   lblCCustoPar.enabled  := false;
   dblkCCustoPar.enabled := false;
   dblkCCustoPar.color   := clBtnFace;

   lblSubContaPar.enabled   := false;
   mskSubContaPar.enabled   := false;
   mskSubContaPar.color     := clBtnFace;
   edtSubContaPar.color := clBtnFace;
   btnSubContaPar.enabled   := false;


   dblkCCustoRat.text      := '';
   cmpContaRat.Clear;
   mskSubContaRat.text     := '';
   edtSubContaRat.text     := '';

   dblkCCustoRat.text    := '';
   lblCCustoRat.enabled  := false;
   dblkCCustoRat.enabled := false;
   dblkCCustoRat.color   := clBtnFace;

   lblSubContaRat.enabled   := false;
   mskSubContaRat.enabled   := false;
   mskSubContaRat.color     := clBtnFace;
   edtSubContaRat.color     := clBtnFace;
   btnSubContaRat.enabled   := false;

   mskAtivProj.Text  := '';
   mskUnidNegoc.Text := '';
   edtAtivProj.Text  := '';

   dblkHistoricoPar.text := '';
   dblkHistoricoRat.text := '';
   dblkTipoOper.text     := '';

   mskHistPar1.clear;
   mskHistPar2.clear;
   mskHistPar3.clear;
   mskHistPar4.clear;
   mskHistPar5.clear;

   mskHistRat1.clear;
   mskHistRat2.clear;
   mskHistRat3.clear;
   mskHistRat4.clear;
   mskHistRat5.clear;

   redValor.value := 0;

end;

procedure TfrmCadLancRateioMT.PreencheHistorico(cDebCre: char);
begin
   If cDebCre = 'D' Then
   Begin

      CtrlHistoContab.ArrumaHistorico(CdsHistoPadraoPar.FieldByName('HITDESCR1').asString);

      CtrlHistoContab.FormataLinhasHisto(CtrlHistoContab.Hist1,CtrlHistoContab.Hist2,
                                         CtrlHistoContab.Hist3,CtrlHistoContab.Hist4,
                                         CtrlHistoContab.Hist5);

      mskHistPar1.EditMask := CtrlHistoContab.Hist1;
      mskHistPar2.EditMask := CtrlHistoContab.Hist2;
      mskHistPar3.EditMask := CtrlHistoContab.Hist3;
      mskHistPar4.EditMask := CtrlHistoContab.Hist4;
      mskHistPar5.EditMask := CtrlHistoContab.Hist5;

   End;

   If cDebCre = 'C' Then
   Begin

      CtrlHistoContab.ArrumaHistorico(CdsHistoPadraoRat.FieldByName('HITDESCR1').asString);

      CtrlHistoContab.FormataLinhasHisto(CtrlHistoContab.Hist1,CtrlHistoContab.Hist2,
                                         CtrlHistoContab.Hist3,CtrlHistoContab.Hist4,
                                         CtrlHistoContab.Hist5);

      mskHistRat1.EditMask := CtrlHistoContab.Hist1;
      mskHistRat2.EditMask := CtrlHistoContab.Hist2;
      mskHistRat3.EditMask := CtrlHistoContab.Hist3;
      mskHistRat4.EditMask := CtrlHistoContab.Hist4;
      mskHistRat5.EditMask := CtrlHistoContab.Hist5;

   End;

end;

procedure TfrmCadLancRateioMT.dblkHistoricoRatExit(Sender: TObject);
begin
  inherited;
  PreencheHistorico('C');
end;

procedure TfrmCadLancRateioMT.dblkHistoricoParExit(Sender: TObject);
begin
  inherited;
  PreencheHistorico('D');
end;

procedure TfrmCadLancRateioMT.bbtnConfirmarClick(Sender: TObject);
var
  sDebCre :string;
begin
  inherited;
  If  mskSubContaPar.Text <> '' Then
      iSubContaCP := StrToInt(mskSubContaPar.Text)
  Else
      isubContaCP := 0;

  If  mskSubContaRat.Text <> '' Then
      iSubContaRat:= StrToInt(mskSubContaRat.Text)
  Else
      isubContaRat := 0;

  If mskUnidNegoc.text <> '' Then
     iUnidNegoc := StrToInt(mskUnidNegoc.text)
  Else
     iUnidNegoc := 0;

  If rdgRateioDebCre.itemindex = 0 Then
     sDebCre := 'D'
  Else
     sDebCre := 'C';

   If (dteData.text = '') Then
   Begin
      MsgDlg('Data da Planilha não prenchida.','Aviso',mtWarning,[mbOk],0);
      dteData.SetFocus;
      Exit;
   End;

   If (dblkRateio.text = '') Then
   Begin
      MsgDlg('Planilha de Rateio não prenchida.','Aviso',mtWarning,[mbOk],0);
      dblkRateio.SetFocus;
      Exit;
   End;

   If cmpContaPar.Conta.Numero = '' Then
   Begin
      MsgDlg('Conta Contábil da Contra-Partida não selecionada.','Aviso',mtWarning,[mbOk],0);
      cmpContaPar.SetFocus;
      Exit;
   End;

   If (cmpContaPar.Conta.Numero <> '') And (dblkCCustoPar.enabled = true) And (dblkCCustoPar.text = '') Then
   Begin
     MsgDlg('Conta da Contra-Partida obriga Centro de Custo.','Aviso',mtWarning,[mbOk],0);
     dblkCCustoPar.SetFocus;
     Exit;
   End;

   If cmpContaPar.Conta.Numero = '' Then
   Begin
     MsgDlg('Conta Contábil a ser Rateada não selecionada.','Aviso',mtWarning,[mbOk],0);
     cmpContaPar.SetFocus;
     Exit;
   End;

   If (cmpContaRat.Conta.Numero <> '') And (dblkCCustoRat.enabled = True) And (dblkCCustoRat.text = '') Then
   Begin
     MsgDlg('Conta a ser Rateada obriga Centro de Custo.','Aviso',mtWarning,[mbOk],0);
     dblkCCustoRat.SetFocus;
     Exit;
   End;

   If CtrlContab.ObrigaHistorico = 'S' Then
   Begin
      If dblkHistoricoRat.text = '' Then
      Begin
         MsgDlg('Código do Histórico da Conta a ser Rateada não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblkHistoricoRat.SetFocus;
         Exit;
      End;

      If dblkHistoricoPar.text = '' Then
      Begin
         MsgDlg('Código do Histórico da Contra-Partida não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblkHistoricoPar.SetFocus;
         Exit;
      End;
   End;

   If Sistema.UsaPlanoPatro Then
   Begin
      If dblcPlanoPrevC.text = '' Then
      Begin
         MsgDlg('Plano Previdenciário não preenchido.','Aviso',mtWarning,[mbOk],0);
         dblcPlanoPrevC.SetFocus;
         Exit;
      End;
      If dblcPatroC.text = '' then
      Begin
         MsgDlg('Patrocinadora não preenchida.','Aviso',mtWarning,[mbOk],0);
         dblcPatroC.SetFocus;
         Exit;
      End;
   End;

   If CtrlLancamento.FazRateio(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,
                               CtrlContab.PlanoParam, StrToInt(dblkRateio.lookupValue),
                               StrToIntDef(dblcPlanoPrevC.LookupValue,0),StrToIntDef(dblcPatroC.LookupValue,0),
                               isubContaCP,iSubContaRat, iUnidNegoc,dteData.text,edtNumDoc.text,
                               dblkTipoOper.lookupValue,dblkCCustoPar.LookupValue,cmpContaPar.Conta.Numero,
                               dblkHistoricoPar.LookupValue,mskHistPar1.Text,mskHistPar2.Text,
                               mskHistPar3.Text,mskHistPar4.text,mskHistPar5.Text,
                               dblkCCustoRat.LookupValue,cmpContaRat.Conta.Numero,
                               dblkHistoricoRat.LookupValue,mskHistRat1.Text,mskHistRat2.Text,
                               mskHistRat3.Text,mskHistRat4.text,mskHistRat5.Text,
                               sDebCre,redValor.value,True,Sistema.UsaPlanoPatro,
                               -1, -1) Then

         MsgDlg('Rateio gerado com sucesso. Planilha: '+ CtrlLancamento.MessageInfo + ' Gerada.','Aviso',mtWarning,[mbOk],0)
      Else
         MsgDlg('Foram detectados problemas na geração do Rateio.' + CHR(13) + CtrlLancamento.MessageInfo, 'Erro', mtError, [mbOk], 0);
end;

procedure TfrmCadLancRateioMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPlanilhaRA.Free;
  CtrlContab.Free;
  CtrlHistoContab.Free;
  ListTerceiros.Free;
  CtrlLancamento.Free;
  CtrlSubConta.Free;
  CtrlConta.Free;
end;

procedure TfrmCadLancRateioMT.mskAtivProjExit(Sender: TObject);
begin
  inherited;
   if mskAtivProj.text <> '' Then
      BuscaAtivProj(mskAtivProj.text);

end;

procedure TfrmCadLancRateioMT.cmpContaRatExit(Sender: TObject);
begin
  inherited;
  If cmpContaRat.Conta.ObrigaCentrodeCusto Then
  Begin
    lblCCustoRat.enabled  := true;
    dblkCCustoRat.enabled := true;
    dblkCCustoRat.color   := clWindow;

    CdsCentroCustoRat.Data  := CtrlConta.ListContasxCC(CtrlContab.PlanoParam,Sistema.IdEmpresa,
                                       Trim(cmpContaRat.Conta.Numero),'',tccAmbasCC,toCodigo);

  End Else
  Begin
    dblkCCustoRat.text    := '';
    lblCCustoRat.enabled  := false;
    dblkCCustoRat.enabled := false;
    dblkCCustoRat.color   := clBtnFace;
  End;

  If cmpContaRat.Conta.ObrigaSubConta  Then
  Begin
     lblSubContaRat.enabled   := true;
     mskSubContaRat.enabled   := true;
     mskSubContaRat.color     := clWindow;
     edtSubContaRat.color := clWindow;
     btnSubContaRat.enabled   := true;
   End Else
   Begin
     lblSubContaRat.enabled   := false;
     mskSubContaRat.enabled   := false;
     mskSubContaRat.color     := clBtnFace;
     edtSubContaRat.color := clBtnFace;
     btnSubContaRat.enabled   := false;
   End;


end;

procedure TfrmCadLancRateioMT.btnSubContaRatClick(Sender: TObject);
begin
  inherited;
   MontaSelectSubConta.Executar;
   Repaint;
   if MontaSelectSubConta.RetornouValor Then
   Begin
      BuscaSubConta('R', MontaSelectSubConta.ValoresChave[0]);
   End;

end;

procedure TfrmCadLancRateioMT.mskSubContaRatExit(Sender: TObject);
begin
  inherited;
   If  mskSubContaRat.Text <> '' Then
       BuscaSubConta('R', mskSubContaRat.Text);

end;

procedure TfrmCadLancRateioMT.BuscaSubConta(sDebCre, sSubConta: string);
begin
   cdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToInt(sSubConta));

   If Not cdsSubConta.isEmpty Then
   Begin
      If sDebCre = 'R' Then
      Begin
         mskSubContaRat.text     := IntToStr(cdsSubConta.FieldByName('CODSUBCONTA').asInteger);
         edtSubContaRat.text := cdsSubConta.FieldByName('NOMESUBCONTA').asString;
      End Else
      Begin
         mskSubContaPar.text     := IntToStr(cdsSubConta.FieldByName('CODSUBCONTA').asInteger);
         edtSubContaPar.text := cdsSubConta.FieldByName('NOMESUBCONTA').asString;
      End;
   End Else
   Begin
     MsgDlg('O código da sub-conta informado não existe.','Aviso',mtWarning,[mbOk],0);
     If sDebCre = 'P' Then
        mskSubContaRat.SetFocus
     Else
        mskSubContaPar.SetFocus;
   End;

end;

procedure TfrmCadLancRateioMT.mskSubContaParExit(Sender: TObject);
begin
  inherited;
   If  mskSubContaPar.Text <> '' Then
       BuscaSubConta('P', mskSubContaPar.Text);

end;

procedure TfrmCadLancRateioMT.btnSubContaParClick(Sender: TObject);
begin
  inherited;
   MontaSelectSubConta.Executar;
   Repaint;
   if MontaSelectSubConta.RetornouValor Then
   Begin
      BuscaSubConta('P', MontaSelectSubConta.ValoresChave[0]);
   End;

end;

procedure TfrmCadLancRateioMT.cmpContaParExit(Sender: TObject);
begin
  inherited;
  If cmpContaPar.Conta.ObrigaCentrodeCusto Then
  Begin
    lblCCustoPar.enabled  := true;
    dblkCCustoPar.enabled := true;
    dblkCCustoPar.color   := clWindow;

    CdsCentroCustoPar.Data  := CtrlConta.ListContasxCC(CtrlContab.PlanoParam,Sistema.IdEmpresa,
                                       Trim(cmpContaPar.Conta.Numero),'',tccAmbasCC,toCodigo);

  End Else
  Begin
    dblkCCustoPar.text    := '';
    lblCCustoPar.enabled  := false;
    dblkCCustoPar.enabled := false;
    dblkCCustoPar.color   := clBtnFace;
  End;

  If cmpContaPar.Conta.ObrigaSubConta  Then
  Begin
     lblSubContaPar.enabled   := true;
     mskSubContaPar.enabled   := true;
     mskSubContaPar.color     := clWindow;
     edtSubContaPar.color := clWindow;
     btnSubContaPar.enabled   := true;
   End Else
   Begin
     lblSubContaPar.enabled   := false;
     mskSubContaPar.enabled   := false;
     mskSubContaPar.color     := clBtnFace;
     edtSubContaPar.color := clBtnFace;
     btnSubContaPar.enabled   := false;
   End;

end;

end.
