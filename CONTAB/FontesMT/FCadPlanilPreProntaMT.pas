unit FCadPlanilPreProntaMT;

(*==============================================================================
Analista           : Marcus Oliveira
Data               : 21/12/2006
Pendência          : 23804
Descrição          : Incluído combos que não apareciam na Grid.
==============================================================================*)
(*==============================================================================
Analista           : Marcus Oliveira
Data               : 06.09.2006
Pendência          : 23265
Descrição          : Caso a Segregação Virtual não esteja ativa,
                     não criticar o critério para segregação
==============================================================================*)
(*==============================================================================
Analista           : Antonio Marcos Fernandes de Souza (amf)
Data               : 21.12.2005
Pendência          : 15320
Alteração          : "De/Para" Alterar exibição de Centro de Custo
==============================================================================*)

// Atualizações: André Tavares - pendência 16618 - 17/05/2004 -
//               Descrição: Inclusão dos campos NumOrdem, Plano Previdenciário,
//                          Patrocinadora e Critério de segregação.


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, Mask, DBCtrls,
  CMProcuraMask, wwdbedit, wwdblook, uCtrlSubConta, uCtrlPrePlanilhaPP,
  uCtrlHistoContab, uCtrlContaContabil,uCtrlContab,uCtrlListTerceiros,
  uCMTypes, uCtrlSegregacao, uCtrlPlanPrevContabPatro, Wwdbspin,
  uCmSqlParams, uCtrlParamIntegra;

type
  TfrmCadPlanilPreProntaMT = class(TFrmCadastroMestreDetMT)
    lblPrePronta: TLabel;
    edDescPrePronta: TDBEdit;
    cmpConta: TCMProcuraMaskContabil;
    dbrNatureza: TDBRadioGroup;
    Label1: TLabel;
    dblkCCusto: TwwDBLookupCombo;
    Label10: TLabel;
    dblkHist: TwwDBLookupCombo;
    Label9: TLabel;
    dbeNumDoc: TwwDBEdit;
    Label3: TLabel;
    mskAtivProj: TMaskEdit;
    edtAtivProj: TEdit;
    btnAtivProj: TBitBtn;
    dblkTipoOper: TwwDBLookupCombo;
    Label4: TLabel;
    Label2: TLabel;
    CdsPreDetalhe: TCMClientDataSet;
    MontaSelectAtivProj: TMontaSelect;
    CdsHistoPadrao: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsCentroCusto: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    mskUnidNegoc: TMaskEdit;
    cdsDetCopia: TCMClientDataSet;
    chkMantem: TCheckBox;
    sbtnCopiar: TToolbarButton97;
    cdsMestreCopia: TCMClientDataSet;
    dblkSubConta: TwwDBLookupCombo;
    CdsPlanPrevContabil: TCMClientDataSet;
    dblkPlanoPrev: TwwDBLookupCombo;
    Label5: TLabel;
    CdsPatro: TCMClientDataSet;
    dblkPatro: TwwDBLookupCombo;
    Label6: TLabel;
    CdsSegrega: TCMClientDataSet;
    PnlSegregaCriter: TPanel;
    dblkSegrega: TwwDBLookupCombo;
    Label7: TLabel;
    spNumOrdem: TwwDBSpinEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cmpContaExit(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAtivProjClick(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure dblkPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbgrdDetTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    CtrlPrePlanilhaPP : TCtrlPrePlanilhaPP;
    CtrlHistoContab   : TCtrlHistoContab;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlSubconta      : TCtrlSubConta;
    CtrlContab        : TCtrlContab;
    ListTerceiros     : TCtrlListTerceiros;
    CtrlSegregacao    : TCtrlSegregacao;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;
    procedure HabilitarCriterioSegregacao;

  public
    { Public declarations }
  end;

var
  frmCadPlanilPreProntaMT: TfrmCadPlanilPreProntaMT;
  NomePla :string;

implementation

uses UMensErro, uDatabase, DBaseDados,  uSistema,
     uModulo, uFuncaoGeral;

{$R *.DFM}


procedure TfrmCadPlanilPreProntaMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal pre-planilha ***
  CtrlPrePlanilhaPP := TCtrlPrePlanilhaPP.Create;
  CtrlPrePlanilhaPP.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPrePlanilhaPP.cdsPrePlanilha := Cds;
  Cds.Data := CtrlPrePlanilhaPP.ListPrePlanilha(-1,-1,'');

  CtrlPrePlanilhaPP.cdsPrePlanilhaCopia := CdsMestreCopia;
  CdsMestreCopia.Data := CtrlPrePlanilhaPP.ListPrePlanilha(-1,-1,'');

  // *** Instancia a classe CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  CtrlPrePlanilhaPP.cdsPreDetalhe      := CdsPreDetalhe;
  CdsPreDetalhe.Data := CtrlPrePlanilhaPP.ListCdsDetalhePP(-1, true);

  CtrlPrePlanilhaPP.cdsPreDetalheCopia := CdsDetCopia;
  CdsDetCopia.Data := CtrlPrePlanilhaPP.ListCdsDetalhePP(-1, true);

  // *** Atribui mascaras para os campos do CdsDetalhe ***
  TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';


  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');


  // *** Instancia a classe SubConta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);


  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAtivProj.Data  := ListTerceiros.ListAtivProj(-1,0,'',tapAmbos,toapNome);
  CdsTipoOper.Data  := ListTerceiros.ListTipoOper(True);

  CdsPlanPrevContabil.data := ListTerceiros.ListPlanoPrev;
  CdsPatro.data            := ListTerceiros.ListPlanoPatro;

  CtrlSegregacao := TCtrlSegregacao.Create;
  CtrlSegregacao.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                            Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  CtrlSegregacao.GetParams (Sistema.IdEmpresa);

  pnlSegregaCriter.Visible := CtrlSegregacao.SegregaVirtual;

  CdsSegrega.Data := CtrlSegregacao.ListaSegregaCriter;

  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContabPatro.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);


  // *** Instancia a classe ContaContabil ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Atribui mascaras para os campos ***
  cmpConta.Plano        := CtrlContab.PlanoParam;
  cmpConta.Mascara      := CtrlContab.MascaraContaParam;
  mskAtivProj.EditMask  := Modulo.sMascaraUnidNegoc + ';0; ';

  // *** Completa os filtros dos Monta Selects ***
  MontaSelectAtivProj.Mascaras[0] := modulo.sMascaraUnidNegoc + ';0; ';
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));

  MontaSelect.Filtro.Add('PREPLANILHA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));


end;

procedure TfrmCadPlanilPreProntaMT.cmpContaExit(Sender: TObject);
begin
  inherited;

    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
      cmpConta.SetFocus;
      Exit;
    End;

    //---verifica se obriga o subconta ---
    dblkSubConta.Text    := '';
    If cmpConta.Conta.ObrigaSubConta Then
    Begin
       dblkSubConta.enabled := true;
       dblkSubConta.color   := clWindow;
       CdsSubConta.Data     := CtrlContaContabil.ListContasxSC(CtrlContab.PlanoParam,Sistema.idEmpresa,0,Trim(cmpConta.Conta.Numero),toNome);
     End Else
     Begin
       dblkSubConta.color   := clBtnFace;
       dblkSubConta.enabled := false;
    End;


    //---verifica se obriga o centro de custo ---
    dblkCCusto.Text    := '';
    If cmpConta.Conta.ObrigaCentrodeCusto Then
    Begin
       dblkCCusto.enabled  := true;
       dblkCCusto.color    := clWindow;
       CdsCentroCusto.Data := CtrlContaContabil.ListContasxCC(CtrlContab.PlanoParam,Sistema.idEmpresa,Trim(cmpConta.Conta.Numero),'',tccAmbasCC,toCodigo);
     End Else
     Begin
       dblkCCusto.color   := clBtnFace;
       dblkCCusto.enabled := false;
    End;
end;



procedure TfrmCadPlanilPreProntaMT.CmeCadastroAfterConfirma(
  Sender: TObject);
begin
  //inherited;
  Cds.Data := CtrlPrePlanilhaPP.ListPrePlanilha(Cds.FieldByName('PANCODIGO').asFloat,
                                                Sistema.Idempresa,Cds.FieldByName('PANIDENTIFICACAO').asString);
  CdsPreDetalhe.Data := CtrlPrePlanilhaPP.ListCdsDetalhePP(Cds.FieldByName('PANCODIGO').asFloat, true);

  // *** Atribui mascaras para os campos do CdsDetalhe ***
  TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';


end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlPrePlanilhaPP.Apagar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlPrePlanilhaPP.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=  CtrlPrePlanilhaPP.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsPreDetalhe.First;
   while Not CdsPreDetalhe.Eof do
      CdsPreDetalhe.Delete;
  inherited;

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

    //Redesenha o form na volta do MontaSelect
    Repaint;

    //se houve busca, abre a query principal com apenas o registro buscado
    If MontaSelect.RetornouValor Then
    Begin

      //*** Abre o cds princial (mestre) ***
      Cds.Data := CtrlPrePlanilhaPP.ListPrePlanilha(StrToFloat(MontaSelect.ValoresChave[0]),Sistema.IdEmpresa,MontaSelect.ValoresChave[1]);
      NomePla := Cds.FieldByName('PANDESCRICAO').asString;

      //*** Abre o cds filho (detalhe) ***
      CdsPreDetalhe.Data := CtrlPrePlanilhaPP.ListCdsDetalhePP(StrToFloat(MontaSelect.ValoresChave[0]), true);

      // somente habilita se for plano e patro comuns
      HabilitarCriterioSegregacao;

     // *** Atribui mascaras para os campos do CdsDetalhe ***
     TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
     TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';

      CdsAtivProj.Data  := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,CdsPreDetalhe.FieldByName('UNIDNEGOC').asFloat,CdsPreDetalhe.FieldByName('UNECODIGO').asString,tapAmbos,toapNome);
      mskAtivProj.text  := CdsAtivProj.FieldByName('UNECODIGO').asString;
      mskUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
      edtAtivProj.text  := CdsAtivProj.FieldByName('NOME').asString;

    End;

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroBeforeConfirma(
  sender: TObject; var Accept: Boolean);
begin
  inherited;

  If Cds.State in [dsInsert, dsEdit] Then
  Begin

     If (edDescPrePronta.Text = '') Then
     Begin
        MsgDlg('Descrição da Planilha Pré-Pronta não informada.','Erro',mtError,[mbOk],0);
        Accept := False;
     End;

    If CtrlPrePlanilhaPP.PlanilhaTemNomesIguais(Trim(edDescPrePronta.Text),Cds.FieldByName('PANCODIGO').AsFloat) Then
    Begin
       MsgDlg('Já existe uma planilha cadastrada com esse nome','Erro',mtError,[mbOk],0);
       edDescPrePronta.SetFocus;
       Accept := false;
    End;

    if (trim(dblkPatro.text) <> '') and (trim(dblkPlanoPrev.text) <> '') then begin
      if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(CdsPreDetalhe.fieldByName('IDPATRO').asInteger,
             CdsPreDetalhe.fieldByName('IDPLANOPREV').asInteger) then
      begin
         MsgDlg('Relacionamento Plano Previdenciário x Patrocinadoa inválido.','Erro',mtError,[mbOk],0);
         DblkPlanoprev.SetFocus;
         Accept := false;
      end;
    end;

    //Não há critério de segregração quando a Flag da Segragação não está ativo.
    if CtrlSegregacao.SegregaVirtual then
    begin
      // se for plano e patro comum, então obriga o preenchimento do segregaCriter
      if (CtrlSegregacao.PatroComum = CdsPreDetalhe.fieldByName('IDPATRO').asInteger) and
         (CtrlSegregacao.PlanoPrevComum = CdsPreDetalhe.fieldByName('IDPLANOPREV').asInteger) and
         (trim(dblkSegrega.text) = '') then  begin

        MsgDlg('É obrigatório o preenchimento do Critério para Segregação com Plano Prev. e Patro Comuns.','Erro',mtError,[mbOk],0);

        dblkSegrega.setFocus;
        Accept := false;
      end;
    end;

  End;

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If edDescPrePronta.canFocus Then edDescPrePronta.SetFocus;

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Data := CtrlPrePlanilhaPP.ListPrePlanilha(-1,-1,'');
  inherited;
  //Define o os valores default do registro que se está inserindo

  Cds.FieldByName('PANIDENTIFICACAO').AsString := 'P';
  Cds.FieldByName('PANPROCESSADA').AsString    := 'N';
  Cds.FieldByName('IDPESSOA').AsInteger        := Sistema.idempresa;

  CdsPreDetalhe.Data := CtrlPrePlanilhaPP.ListCdsDetalhePP(Cds.FieldByName('PANCODIGO').asFloat, true);

  // *** Atribui mascaras para os campos do CdsDetalhe ***
  TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('UNECODIGO')).EditMask      := modulo.sMascaraUnidNegoc + ';0; ';
  TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';

  If edDescPrePronta.canFocus Then edDescPrePronta.SetFocus;

end;

procedure TfrmCadPlanilPreProntaMT.CmeDetalheConfirma(Sender: TObject);
var
  sconta :string;
begin
   If CdsPreDetalhe.State in [dsInsert, dsEdit] Then
   Begin
      if (trim(dblkPatro.text) <> '') and (trim(dblkPlanoPrev.text) <> '') then
        if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(CdsPreDetalhe.fieldByName('IDPATRO').asInteger,
               CdsPreDetalhe.fieldByName('IDPLANOPREV').asInteger) then
        begin
           MsgDlg('Relacionamento Plano Previdenciário x Patrocinadoa inválido.','Erro',mtError,[mbOk],0);
           DblkPlanoprev.SetFocus;
           Exit;
        end;
      if CtrlSegregacao.SegregaVirtual then
      begin
      // se for plano e patro comum, então obriga o preenchimento do segregaCriter
      if (CtrlSegregacao.PatroComum = CdsPreDetalhe.fieldByName('IDPATRO').asInteger) and
         (CtrlSegregacao.PlanoPrevComum = CdsPreDetalhe.fieldByName('IDPLANOPREV').asInteger) and
         (trim(dblkSegrega.text) = '') then
      begin
        MsgDlg('É obrigatório o preenchimento do Critério para Segregação com Plano Prev. e Patro Comuns.','Erro',mtError,[mbOk],0);
        dblkSegrega.setFocus;
        exit;
        end;
      end;

      //*** Faz a verificação do preenchimento dos campos ***
      If cmpConta.Conta.Numero = '' Then
      Begin
         MsgDlg('Conta Contábil não selecionada.','Erro',mtError,[mbOk],0);
         cmpConta.SetFocus;
         Exit;
      End Else
      Begin
         CdsPreDEtalhe.FieldByName('PLANO').asInteger   := CtrlContab.PlanoParam;
      End;

      If (dblkHist.Text = '') Then
      Begin
         MsgDlg('Histórico não selecionado.','Erro',mtError,[mbOk],0);
         dblkHist.SetFocus;
         Exit;
      End;

      If Trim(mskAtivProj.text) <> '' Then
      Begin
        CdsPreDetalhe.FieldByName('UNIDNEGOC').asInteger := StrToInt(mskUnidNegoc.Text)
      End;

      IF (dblkTipoOper.Text = '') then
      Begin
         MsgDlg('Tipo de operação não selecionado.', 'Erro', mtError, [mbOk], 0);
         dblkTipoOper.SetFocus;
         Exit;
      End;


      //Atribui o campo na mão pois a query não dá refresh no join
      CdsPreDetalhe.FieldByName('PLANOME').AsString   := cmpConta.Conta.Nome;
      CdsPreDetalhe.FieldByName('UNECODIGO').AsString := CdsAtivProj.FieldByName('UNECODIGO').asString;

      sconta := CdsPreDetalhe.FieldByName('PLACONTA').AsString;

   End;

   inherited;

end;

procedure TfrmCadPlanilPreProntaMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
   mskAtivProj.text := '';
   edtAtivProj.text := '';

   CdsPreDetalhe.FieldByName('IDPESSOA').AsInteger          := Sistema.idempresa;
   CdsPreDetalhe.FieldByName('PLANO').AsInteger             := CtrlContab.PlanoParam;
   CdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
   CdsPreDetalhe.FieldByName('PANTIPO').AsString            := 'D';

   cmpConta.SetFocus;

end;

procedure TfrmCadPlanilPreProntaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPrePlanilhaPP.Free;
  CtrlHistoContab.Free;
  ListTerceiros.Free;
  CtrlContaContabil.Free;
  CtrlSubconta.Free;
  CtrlContab.Free;
  CtrlSegregacao.free;
  CtrlPlanPrevContabPatro.free;
end;

procedure TfrmCadPlanilPreProntaMT.btnAtivProjClick(Sender: TObject);
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
        mskUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
        edtAtivProj.text  := CdsAtivProj.FieldByName('NOME').asString;
      End;
   End;

end;

procedure TfrmCadPlanilPreProntaMT.mskAtivProjExit(Sender: TObject);
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
           mskUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
           edtAtivProj.text  := CdsAtivProj.FieldByName('NOME').asString;
        End;
     End Else
     Begin
        MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
        mskAtivProj.SetFocus;
     End;

  End;

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroAbortConfirma(
  sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPrePlanilhaPP.MessageInfo <> '' Then
     MsgDlg(CtrlPrePlanilhaPP.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadPlanilPreProntaMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
   // *** Limpa campos ***
   mskUnidNegoc.text := '';
   mskAtivProj.text := '';
   edtAtivProj.text := '';

   cmpConta.Setfocus;
   dbrNatureza.SetFocus;
   // *** edita campos ***
   mskUnidNegoc.Text := IntToStr(CdsPreDetalhe.FieldByName('UNIDNEGOC').AsInteger);
   mskAtivProj.Text  := CdsPreDetalhe.FieldByName('UNECODIGO').AsString;

end;

procedure TfrmCadPlanilPreProntaMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlPrePlanilhaPP.ListPrePlanilha(-1,-1,'');
  CdsPreDetalhe.Data := CtrlPrePlanilhaPP.ListCdsDetalhePP(-1, true);


end;


procedure TfrmCadPlanilPreProntaMT.sbtnCopiarClick(Sender: TObject);
begin
  inherited;
  If Trim(NomePla) = Trim(edDescPrePronta.Text) then
  Begin
     MsgDlg('O nome da planilha precisa ser alterado.','Erro',mtError,[mbOk],0);
     if sbtnCopiar.Down then sbtnCopiar.Down := false;
     Exit;
   End;

  If (edDescPrePronta.Text = '') Then
  Begin
     MsgDlg('Descrição da Planilha Pré-Pronta não informada.','Erro',mtError,[mbOk],0);
     if sbtnCopiar.Down then sbtnCopiar.Down := false;
     Exit;
   End;

  If CtrlPrePlanilhaPP.PlanilhaTemNomesIguais(Trim(edDescPrePronta.Text),Cds.FieldByName('PANCODIGO').AsFloat) Then
  Begin
     MsgDlg('Já existe uma planilha cadastrada com esse nome','Erro',mtError,[mbOk],0);
     edDescPrePronta.SetFocus;
     if sbtnCopiar.Down then sbtnCopiar.Down := false;
     Exit;
  End;

  //=======================================================
  If CdsPreDetalhe.State in [dsInsert, dsEdit] Then
  Begin

    //*** Faz a verificação do preenchimento dos campos ***
    If cmpConta.Conta.Numero = '' Then
    Begin
      MsgDlg('Conta Contábil não selecionada.','Erro',mtError,[mbOk],0);
      cmpConta.SetFocus;
      Exit;
    End Else
    Begin
      CdsPreDEtalhe.FieldByName('PLANO').asInteger   := CtrlContab.PlanoParam;
    End;

    If (dblkHist.Text = '') Then
    Begin
      MsgDlg('Histórico não selecionado.','Erro',mtError,[mbOk],0);
      dblkHist.SetFocus;
      Exit;
    End;

     If Trim(mskAtivProj.text) <> '' Then
     Begin
       CdsPreDetalhe.FieldByName('UNIDNEGOC').asInteger := StrToInt(mskUnidNegoc.Text)
     End;

     CdsPreDetalhe.FieldByName('PLANOME').AsString   := cmpConta.Conta.Nome;
     CdsPreDetalhe.FieldByName('UNECODIGO').AsString := CdsAtivProj.FieldByName('UNECODIGO').asString;

  End;
  //=======================================================
   If CtrlPrePlanilhaPP.CopiarPrePlanilha(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario,edDescPrePronta.Text) Then
   Begin
     MsgDlg('Copia efetuada  com sucesso.','Aviso',mtWarning,[mbOk], 0);
   End Else
   Begin
     MsgDlg(CtrlPrePlanilhaPP.MessageInfo,'Erro',mtError,[mbOk],0);
   End;
  //=======================================================

  if sbtnCopiar.Down then sbtnCopiar.Down := false;
end;

procedure TfrmCadPlanilPreProntaMT.dblkPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // somente habilita se for plano e patro comuns
     if dblkPatro.Selected.GetText <> '' then
        HabilitarCriterioSegregacao
        else
        dblkPatro.Enabled:= False;

  if not dblkSegrega.Enabled then
  begin
    CdsPreDetalhe.fieldByName('IDSEGREGACRITER').Clear;
    dblkSegrega.text := '';
    dblkSegrega.LookupValue := '';
  end;

  if (trim(dblkPatro.text) <> '') and (trim(dblkPlanoPrev.text) <> '') then
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(CdsPreDetalhe.fieldByName('IDPATRO').asInteger,
           CdsPreDetalhe.fieldByName('IDPLANOPREV').asInteger) then
    begin
       MsgDlg('Relacionamento Plano Previdenciário x Patrocinadoa inválido.','Erro',mtError,[mbOk],0);
       DblkPlanoprev.SetFocus;
    end;
end;




procedure TfrmCadPlanilPreProntaMT.dbgrdDetTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
  CdsPreDetalhe.IndexFieldNames := AFieldName;
end;


procedure TfrmCadPlanilPreProntaMT.HabilitarCriterioSegregacao;
begin
dblkSegrega.Enabled := ((CtrlSegregacao.PatroComum = CdsPreDetalhe.fieldByName('IDPATRO').asInteger) and
                       ((CtrlSegregacao.PlanoPrevComum = CdsPreDetalhe.fieldByName('IDPLANOPREV').asInteger) or
                        (CtrlSegregacao.PlanoPrevAdm = CdsPreDetalhe.FieldByName('IDPLANOPREV').AsInteger)));

end;

end.
