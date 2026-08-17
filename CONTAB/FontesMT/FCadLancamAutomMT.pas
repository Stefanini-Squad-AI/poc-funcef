//ALTERAÇÕES
(*==============================================================================
Rotina..........: QntVigenciaPlanilha
N. Sol..........: 127363
N. Kintana......: 674938
Data............: 25/11/2009
Responsável.....: Marilza Colpani
Descrição.......: Ao excluir uma planilha da tela Cadastro/Planilhas/Lançamentos Automáticos,
que seja atualizada essa exclusão na tela Planilhas/Automático/Lançamento Automático.
================================================================================
Analista : Antonio Marcos
Data     : 23.12.2005
Alteração: Alguns campos no cadastro de planilhas de lançamentos automáticos, não
           estavam sendo atualizados ao pressionar o OK do (Detalhe). A atualização
           ocorria somente após pressionar o OK do (Mestre).
==============================================================================*)
(*==============================================================================
Analista : Antonio Marcos
Data     : 22.12.2005
Pendência: 15328: Cadastros/Planilhas/Lançamentos Automático/Detalhe
==============================================================================*)
//------------------------------------------------------------------------------
// Rotinas   : CmeCadastroInsert
// Data      : 10/07/2004
// Autor     : David Ayrolla
// Pendência : 16743
// Descrição : Incluído campo FLGINTEGRAPLAN na tabela PREPLANILHA.
//------------------------------------------------------------------------------
(*==============================================================================
Analista : Alex Pereira
Data     : 08/01/04
Pendência: 14451 Nova estrutura para segregação
           FLGSEGREGACRITER
==============================================================================*)

{ 25/07/03 Alex - Pend. 14503 - Se uma das contas possuir:
                                Plano / Patro / Ativid/Proj
                                todas as outras também deverão possuir
  29/07/03 Alex - Pend. 14503 - Conforme análise com Darcy em 29/07 retirar
                                restrição pois na REFER não é utilizado
  29/07/03 Alex - Pend. 14503 - As contas de Lançamento devem possuir mesmos:
                                Plano / Patro / Ativid/Proj
                                (verificado com Ivete-CBS )
  22/10/03 Alex - Pend 15148  - se Possuir valor Fixo não deve possuir Conta Base
                              - se for um rateio por valor fixo obrigar o preenchimento
                                de plano / patro / ativ. Proj.
  24/10/03 Alex - Pend 15148  - Obriar tipo de operação no detalhe, para contas 'D'/'C'
}
unit FCadLancamAutomMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,uCtrlPrePlanilhaLA,
  wwdblook, Wwdotdot, Wwdbcomb, wwdbedit, CMProcuraMask, DBCtrls, TREdit,
  Mask,uCtrlContab, uCtrlContaContabil,Wwdbspin, DBTables, Wwquery,
  uCtrlHistoContab,uCtrlListTerceiros, wwclient,
  uCMTypes, uCtrlParamIntegra, uCmSqlParams, wwdbdatetimepicker,
  CMDateTimePicker;


type
  TfrmCadLancamAutomMT = class(TFrmCadastroMestreDetMT)
    edDescAutomatico: TDBEdit;
    lblPrePronta: TLabel;
    edFase: TDBEdit;
    Label4: TLabel;
    redParcelaAtual: TDBRealEdit;
    Label8: TLabel;
    redNumParcelas: TDBRealEdit;
    Label7: TLabel;
    redValorFixo: TDBRealEdit;
    Label6: TLabel;
    dbgrDiaPer: TDBRadioGroup;
    rgBase: TDBRadioGroup;
    cmpConta: TCMProcuraMaskContabil;
    rgNatureza: TDBRadioGroup;
    edPerc: TwwDBEdit;
    lblPanperc: TLabel;
    cboSinal: TwwDBComboBox;
    Label2: TLabel;
    edOrdem: TwwDBEdit;
    Label3: TLabel;
    dbeNumDoc: TwwDBEdit;
    Label9: TLabel;
    cboBase: TwwDBComboBox;
    Label1: TLabel;
    dblkCCusto: TwwDBLookupCombo;
    lblPPPCentroCusto: TLabel;
    dblkSubConta: TwwDBLookupCombo;
    Label5: TLabel;
    dblkAtivProj: TwwDBLookupCombo;
    Label15: TLabel;
    dblkcmbHistPadrao: TwwDBLookupCombo;
    lblPPPHistPadrao: TLabel;
    dblkTipoOper: TwwDBLookupCombo;
    Label10: TLabel;
    dbsePeriodo: TwwDBSpinEdit;
    CdsCentroCusto: TCMClientDataSet;
    CdsSubConta: TCMClientDataSet;
    CdsTipoOper: TCMClientDataSet;
    CdsAtivProj: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    CdsHistoPadrao: TCMClientDataSet;
    sbtnDuplicaPlanilha: TToolbarButton97;
    CdsPreDetalhe: TwwClientDataSet;
    rdgSegregacao: TDBRadioGroup;
    dbchkIntegraPlanilha: TDBCheckBox;
    dbckInativo: TDBCheckBox;
    sbtnCriaData: TToolbarButton97;
    dtDataComposicao: TCMDateTimePicker;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbgrDiaPerClick(Sender: TObject);
    procedure cmpContaExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure rgNaturezaClick(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure sbtnDuplicaPlanilhaClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CdsPreDetalheBeforePost(DataSet: TDataSet);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnCriaDataClick(Sender: TObject);
    procedure dtDataComposicaoCloseUp(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);
  private
    CtrlPrePlanilhaLA   : TCtrlPrePlanilhaLA;
    CtrlContab        : TCtrlContab;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlHistoContab   : TCtrlHistoContab;
    ListTerceiros     : TCtrlListTerceiros;

    CtrlParamIntegra    : TCtrlParamIntegra;

    //Cássio - SOL Nº 116466 KINTANA Nº 550163
    iIdPrePlanilha : Integer;
    //Data Set criado para auxiliar no processo de Criação de Vigência
    _cdsCriaData : TCmClientDataSet;

    procedure HabilitaCamposDetalhe;
    procedure FormataGrid;
    procedure LevantaBotao;
    //Cássio - SOL Nº 116466 KINTANA Nº 550163
    //Rotina para habilitar e desabilitar componentes
    procedure HabilitaComponentesMestre(bEstado: boolean);
    function QntVigenciaPlanilha(iIdPancodigo : Integer) : integer;
    function VerificaDataVigenciaPrePlanilha(iPanCodigo: Integer; dDataVigPrePlanilha: TDateTime): Boolean;

  public
    { Public declarations }
  end;

var
  frmCadLancamAutomMT: TfrmCadLancamAutomMT;

implementation

uses uModulo,uSistema, uMensErro, uDataBase, dBaseDados, FSM_FxLib, uString;

{$R *.DFM}

procedure TfrmCadLancamAutomMT.LevantaBotao;
begin
     sbtnDuplicaPlanilha.Down := false;
end;
procedure TfrmCadLancamAutomMT.FormataGrid;
begin
   TStringField(CdsPreDetalhe.FieldByName('PLACONTA')).EditMask       := CtrlContab.MascaraContaParam + ';0; ';
   TStringField(CdsPreDetalhe.FieldByName('CODCENTROCUSTO')).EditMask := modulo.sMascaraCCusto + ';0; ';
end;

procedure TfrmCadLancamAutomMT.HabilitaCamposDetalhe;
begin
  if rgNatureza.ItemIndex = 2 then begin
     edPerc.Enabled   := true;
     cboSinal.Enabled := true;
     cboBase.Enabled  := true;
     edOrdem.Enabled  := true;
     dblkcmbHistPadrao.Enabled := false;
  end else begin
     edPerc.Enabled   := false;
     cboSinal.Enabled := false;
     cboBase.Enabled  := false;
     edOrdem.Enabled  := false;
     dblkcmbHistPadrao.Enabled := true;
  end;
End;


procedure TfrmCadLancamAutomMT.FormCreate(Sender: TObject);
begin
  inherited;

  // *** Instancia a classe principal pre-planilha ***
  CtrlPrePlanilhaLA := TCtrlPrePlanilhaLA.Create(Sistema.IdEmpresa);
  CtrlPrePlanilhaLA.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlPrePlanilhaLA.cdsPrePlanilha := Cds;
  Cds.Data := CtrlPrePlanilhaLA.ListPrePlanilha(-1,Sistema.idempresa,'L');

  CtrlPrePlanilhaLA.cdsPreDetalhe := CdsPreDetalhe;
  CdsPreDetalhe.Data := CtrlPrePlanilhaLA.ListCdsDetalheLA(-1, -1);
  TwwClientDataSet(CdsPreDetalhe).ControlType.Add('DEBITO;CheckBox;D;N');
  TwwClientDataSet(CdsPreDetalhe).ControlType.Add('CREDITO;CheckBox;C;N');
  TwwClientDataSet(CdsPreDetalhe).ControlType.Add('BASE;CheckBox;B;N');


  CtrlPrePlanilhaLA.cdsCopiaPrePlanilha := Cds;
  CtrlPrePlanilhaLA.cdsCopiaPreDetalhe  := CdsPreDetalhe;

  CtrlParamIntegra := TCtrlParamIntegra.Create;
  CtrlParamIntegra.InitializeAs(CtrlPrePlanilhaLA);
  CtrlParamIntegra.GetParams(Sistema.IdEmpresa, 0, '', '', tiSistema);
  rdgSegregacao.Visible := CtrlParamIntegra.SegregaVirtual;

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

  // *** Instancia a classe Historico Contab ***
  CtrlHistoContab := TCtrlHistoContab.Create;
  CtrlHistoContab.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsHistoPadrao.Data := CtrlHistoContab.ListHistoContab(Sistema.IdEmpresa,tohCodigo,'');

  // *** Instancia a classe ListTerceiros ***
  ListTerceiros  := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsAtivProj.Data  := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,'',tapAmbos,toapCodigo);
  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;
  CdsTipoOper.Data  := ListTerceiros.ListTipoOper(True);


  // *** Adiciona filtro no montaselect ***
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
  //MontaSelect.Filtro.Add('IDPESSOA = ' + IntToStr(Sistema.idempresa));
  MontaSelect.Filtro.Add('PREPLANILHA.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim

  cmpConta.Plano         := CtrlContab.PlanoParam;
  cmpConta.Mascara       := CtrlContab.MascaraContaParam;
  pnlPlanoPatroC.Visible := Sistema.UsaPlanoPatro;

  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
  sbtnCriaData.Enabled := False;
  dtDataComposicao.Enabled := False;
  iIdPrePlanilha := -1;
  _cdsCriaData := TCMClientDataSet.Create(nil);
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim

end;

procedure TfrmCadLancamAutomMT.dbgrDiaPerClick(Sender: TObject);
begin
  inherited;
  If dbgrDiaPer.ItemIndex = 2 Then
  Begin
     dbsePeriodo.Enabled := True;
  End Else
  Begin
     dbsePeriodo.Enabled := False;
     Cds.FieldByName('PANPERIODOGERA').AsInteger := 0;
  End;

end;

procedure TfrmCadLancamAutomMT.cmpContaExit(Sender: TObject);
begin
  inherited;

    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
      cmpConta.SetFocus;
      Exit;
    End;

    //---verifica se obriga o centro de custo ---
    If cmpConta.Conta.ObrigaCentrodeCusto Then
    Begin
      dblkCCusto.enabled  := true;
      dblkCCusto.color    := clWindow;
      CdsCentroCusto.Data :=  CtrlContaContabil.ListContasxCC(CtrlContab.PlanoParam,Sistema.idEmpresa,Trim(cmpConta.Conta.Numero),'',tccAmbasCC,toNome);
    End Else
    Begin
      dblkCCusto.Text    := '';
      dblkCCusto.color   := clBtnFace;
      dblkCCusto.enabled := false;
    End;

    If cmpConta.Conta.ObrigaSubConta then
    Begin
      dblkSubConta.Enabled := True;
      dblkCCusto.color     := clWindow;
      CdsSubConta.Data     := CtrlContaContabil.ListContasxSC(CtrlContab.PlanoParam,Sistema.IdEmpresa,0,cmpConta.Conta.Numero,toNome);
    End Else
    Begin
      dblkSubConta.Enabled := False;
      dblkCCusto.color     := clBtnFace;
    End;

end;

procedure TfrmCadLancamAutomMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var
 iDeb, iCre, iBas : integer;
 iPlnD, iPtrD, iUniD, iPlnC, iPtrC, iUniC : Integer;
begin
   inherited;

   if Trim(edDescAutomatico.Text) = '' Then
   Begin
      MsgDlg('Nome da planilha não foi preenchido','Erro',mtError,[mbOk],0);
      edDescAutomatico.SetFocus;
      Accept := false;
   End;

   If edFase.Text = '' then begin
      MsgDlg('Fase da planilha não foi preenchida','Erro',mtError,[mbOk],0);
      edFase.SetFocus;
      Accept := false;
   End;

   If CtrlPrePlanilhaLA.PlanilhaTemNomesIguais(Trim(edDescAutomatico.Text),Cds.FieldByName('PANCODIGO').AsFloat) Then
   Begin
      MsgDlg('Já existe uma planilha cadastrada com esse nome','Erro',mtError,[mbOk],0);
      edDescAutomatico.SetFocus;
      Accept := false;
   End;

   If Cds.FieldByName('PANCONTAPERC').isNull Then
   Begin
      MsgDlg('Natureza do resultado da base não preenchida','Erro',mtError,[mbOk],0);
      rgBase.SetFocus;
      Accept := false;
   End;

   //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
   if trim(dtDataComposicao.Text) = '' then
   begin
    MsgDlg('Necessário informar a data de composição da planilha', 'Erro', mtError, [mbOk], 0);
    dtDataComposicao.Enabled := True;
    dtDataComposicao.SetFocus;
    Accept := False;
   end
   else
   begin
    if sbtnCriaData.Down then
    begin
      CdsPreDetalhe.First;
      while not CdsPreDetalhe.Eof do
      begin
        CdsPreDetalhe.Edit;
        CdsPreDetalhe.FieldByName('DATAVIGPREPLANILHA').AsDateTime := dtDataComposicao.Date;
        CdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').asInteger := Sistema.IdUsuario;
        CdsPreDetalhe.Post;
        CdsPreDetalhe.Next;
      end;
    end;
   end;
   //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim

   iDeb := 0;
   iCre := 0;
   iBas := 0;

   iPlnD := 0;
   iPlnC := 0;
   iPtrD := 0;
   iPtrC := 0;
   iUniD := 0;
   iUniC := 0;

   CdsPreDetalhe.First;
   While not CdsPreDetalhe.EOF do
   Begin
      If CdsPreDetalhe.FieldByName('PANTIPO').AsString = 'D' then begin
         iDeb := iDeb + 1;
         if CdsPreDetalhe.FieldByName('IDPLANOPREV').IsNull then
            iPlnD := -99
         else
            iPlnD := CdsPreDetalhe.FieldByName('IDPLANOPREV').AsInteger;

         if CdsPreDetalhe.FieldByName('IDPATRO').IsNull then
            iPtrD := -99
         else
            iPtrD := CdsPreDetalhe.FieldByName('IDPATRO').AsInteger;

         if CdsPreDetalhe.FieldByName('UNIDNEGOC').IsNull then
            iUniD := -99
         else
            iUniD := CdsPreDetalhe.FieldByName('UNIDNEGOC').AsInteger;

      end else if CdsPreDetalhe.FieldByName('PANTIPO').AsString = 'C' then begin
         iCre := iCre + 1;
         if CdsPreDetalhe.FieldByName('IDPLANOPREV').IsNull then
            iPlnC := -99
         else
            iPlnC := CdsPreDetalhe.FieldByName('IDPLANOPREV').AsInteger;

         if CdsPreDetalhe.FieldByName('IDPATRO').IsNull then
            iPtrC := -99
         else
            iPtrC := CdsPreDetalhe.FieldByName('IDPATRO').AsInteger;

         if CdsPreDetalhe.FieldByName('UNIDNEGOC').IsNull then
            iUniC := -99
         else
            iUniC := CdsPreDetalhe.FieldByName('UNIDNEGOC').AsInteger;

      end else
         iBas := iBas + 1;

      CdsPreDetalhe.Next;
   End;

   If (iDeb = 0) Then
   Begin
      MsgDlg('Obrigatório ter uma Conta de Débito','Erro',mtError,[mbOk],0);
      if not sbtnCriaData.Down then
        edDescAutomatico.SetFocus;
      Accept := false;
      Exit;
   End;

   If (iCre = 0) Then
   Begin
      MsgDlg('Obrigatório ter uma Conta de Crédito','Erro',mtError,[mbOk],0);
      if not sbtnCriaData.Down then
        edDescAutomatico.SetFocus;
      Accept := false;
      Exit;
   End;

   If (iDeb > 1) Then
   Begin
      MsgDlg('Somente é possível ter uma Conta a Débito','Erro',mtError,[mbOk],0);
      if not sbtnCriaData.Down then
        edDescAutomatico.SetFocus;
      Accept := false;
      Exit;
   End;

   If (iCre > 1) Then
   Begin
      MsgDlg('Somente é possível ter uma Conta a Crédito','Erro',mtError,[mbOk],0);
      if not sbtnCriaData.Down then
        edDescAutomatico.SetFocus;
      Accept := false;
      Exit;
   End;

   if (iPlnD <> iPlnC) then begin
     MsgDlg('As contas de lançamento do detalhe devem possuir mesmo Plano','Erro',mtError,[mbOk],0);
     if not sbtnCriaData.Down then
      edDescAutomatico.SetFocus;
     Accept := false;
     Exit;
   end;

   if (iPtrD <> iPtrC) then begin
     MsgDlg('As contas de lançamento do detalhe devem possuir mesma Patrocinadora','Erro',mtError,[mbOk],0);
     if not sbtnCriaData.Down then
      edDescAutomatico.SetFocus;
     Accept := false;
     Exit;
   end;

   if (iUniD <> iUniC) then begin
     MsgDlg('As contas de lançamento do detalhe devem possuir mesma Atividade/Projeto','Erro',mtError,[mbOk],0);
     if not sbtnCriaData.Down then
      edDescAutomatico.SetFocus;
     Accept := false;
     Exit;
   end;

   If (iBas = 0) and (redValorFixo.Value = 0) Then
   Begin
      MsgDlg('Obrigatório ter pelo menos uma Conta Base','Erro',mtError,[mbOk],0);
      if not sbtnCriaData.Down then
        edDescAutomatico.SetFocus;
      Accept := false;
      Exit;
   End;

   // se Possuir valor Fixo não deve possuir base
   if (iBas > 0) and (redValorFixo.Value > 0) then begin
      MsgDlg('Se possuir valor fixo, não deve existir Conta Base','Erro',mtError,[mbOk],0);
      if not sbtnCriaData.Down then
        edDescAutomatico.SetFocus;
      Accept := false;
      Exit;
   end;

   // se for um rateio por valor fixo obrigar o preenchimento de plano / patro / ativ. Proj.
   if redValorFixo.Value <> 0 then begin
      if (iPlnC = -99) or (iPtrC = -99) or (iUniC = -99) then begin
         MsgDlg('Se for um lançamento por valor fixo. Os campos: Plano, Patrocinadora e Atividade/Projeto devem ser preenchidos.','Erro',mtError,[mbOk],0);
         if not sbtnCriaData.Down then
          edDescAutomatico.SetFocus;
         Accept := false;
      end;
   end;
end;

procedure TfrmCadLancamAutomMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   Cds.Data := CtrlPrePlanilhaLA.ListPrePlanilha(Cds.FieldByName('PANCODIGO').AsFloat,
                               Sistema.IdEmpresa,Cds.FieldByName('PANIDENTIFICACAO').AsString);

   // *** preenche o cds detalhe ***
   CdsPreDetalhe.Data := CtrlPrePlanilhaLA.ListCdsDetalheLA(Cds.FieldByName('PANCODIGO').AsFloat, dtDataComposicao.Date);
   FormataGrid;

   //Cássio - SOL Nº116466 KINTANA Nº 550163
   if sbtnCriaData.Down then
   begin
    sbtnCriaData.Down := False;
    CmeCadastro.Cancel(Self);
   end;
end;

procedure TfrmCadLancamAutomMT.CmeCadastroInsert(Sender: TObject);
begin
  Cds.Data := CtrlPrePlanilhaLA.ListPrePlanilha(-1,-1,'');
  inherited;

   Cds.FieldByName('PANIDENTIFICACAO').AsString := 'L';
   Cds.FieldByName('PANPARCATUAL').asInteger    := 0;
   Cds.FieldByName('PANPROCESSADA').AsString    := 'N';
   Cds.FieldByName('PANCONTAPERC').AsString     := 'D';
   Cds.FieldByName('FLGPERIODOGERA').AsString   := 'P';
   Cds.FieldByName('IDPESSOA').AsInteger        := Sistema.idempresa;
   Cds.FieldByName('PANINATIVO').AsString       := 'N';

   Cds.FieldByName('FLGINTEGRAPLAN').AsString   := 'N';

   CdsPreDetalhe.Data := CtrlPrePlanilhaLA.ListCdsDetalheLA(Cds.FieldByName('PANCODIGO').asFloat, dtDataComposicao.Date);
   FormataGrid;

   //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
   sbtnCriaData.Enabled := False;
   dtDataComposicao.Enabled := True;
//   dtDataComposicao.Date := Now;
   edDescAutomatico.Enabled := True;
   edDescAutomatico.SetFocus;
   //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim

   dbsePeriodo.Enabled          := False;

   If edDescAutomatico.canFocus Then edDescAutomatico.SetFocus;

end;

procedure TfrmCadLancamAutomMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;

  If Cds.FieldByName('FLGPERIODOGERA').IsNull Then
     Cds.FieldByName('FLGPERIODOGERA').AsString   := 'P';

  If Cds.FieldByName('FLGPERIODOGERA').AsString = 'E' Then
     dbsePeriodo.Enabled := True
  Else
     dbsePeriodo.Enabled := False;

  If edDescAutomatico.canFocus Then edDescAutomatico.SetFocus;

  //Cássio - SOL Nº 116466 KINTANA Nº 550163
  dtDataComposicao.Enabled := False;
  sbtnCriaData.Enabled := False;
end;

procedure TfrmCadLancamAutomMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;

   If MontaSelect.RetornouValor Then
   Begin
      // *** preeenche o cds mestre ****
      Cds.Data := CtrlPrePlanilhaLA.ListPrePlanilha(StrToInt(MontaSelect.ValoresChave[1]),Sistema.IdEmpresa,MontaSelect.ValoresChave[2]);

      // *** preenche o cds detalhe ***
      CdsPreDetalhe.Data := CtrlPrePlanilhaLA.ListCdsDetalheLA(StrToInt(MontaSelect.ValoresChave[1]),
                                                               StrToDate(MontaSelect.ValoresChave[3]));

      FormataGrid;

      //Cássio - SOl Nº 116466 KINTANA Nº 550163 - Início
      //Preenche o campo de Data da Composição
      dtDataComposicao.Date := CdsPreDetalhe.FieldByName('DATAVIGPREPLANILHA').AsDateTime;
      sbtnCriaData.Enabled := True;
      iIdPrePlanilha := StrToInt(MontaSelect.ValoresChave[1]);
   End;
end;

procedure TfrmCadLancamAutomMT.CmeDetalheConfirma(Sender: TObject);
begin

   If CdsPreDetalhe.State in [dsInsert, dsEdit] Then
   Begin

      If cmpConta.Conta.Numero = '' Then
      Begin
         MsgDlg('Conta Contábil não selecionada.','Erro',mtError,[mbOk],0);
         cmpConta.SetFocus;
         Exit;
      End;

      If CdsPreDetalhe.FieldByName('PANTIPO').IsNull Then
      Begin
        MsgDlg('Natureza não informada','Erro',mtError,[mbOk],0);
        rgNatureza.SetFocus;
        Exit;
      End;

      If (rgNatureza.ItemIndex = 1) or (rgNatureza.ItemIndex = 0) Then
      Begin
         If CtrlContaContabil.TestaContaContabil(CtrlContab.PlanoParam,0,0,0,cmpConta.Conta.Numero,false,false) Then
         Begin
            If CtrlContaContabil.TipoContaContabil = 'S' Then
            Begin
              MsgDlg('Conta selecionada não é analítica','Erro',mtError,[mbOk],0);
              cmpConta.SetFocus;
              Exit;
            End;
         End;
      End Else
      Begin
         If (edPerc.Text  = '') Then
         Begin
            MsgDlg('Percentual não preenchido','Erro',mtError,[mbOk],0);
            edPerc.SetFocus;
            Exit;
         End;

         If (cboBase.Text = '') Then
         Begin
            MsgDlg('Base do rateio não preenchida','Erro',mtError,[mbOk],0);
            cboBase.SetFocus;
            Exit;
         End;

         If (cboSinal.Text = '') Then
         Begin
            MsgDlg('Sinal não prenchido','Erro',mtError,[mbOk],0);
            cboSinal.SetFocus;
            Exit;
         End;

         If (edOrdem.Text = '') Then
         Begin
            MsgDlg('Ordem da base não preenchida','Erro',mtError,[mbOk],0);
            edOrdem.SetFocus;
            Exit;
         End;
      End;

      If (dblkCCusto.Text <> '') then
          CdsPreDetalhe.FieldByName('IDEMPRESA').AsInteger := Sistema.idempresa;
   End;

   inherited;

end;

procedure TfrmCadLancamAutomMT.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  HabilitaCamposDetalhe;
  cmpConta.SetFocus;
  rgNatureza.Setfocus;

end;

procedure TfrmCadLancamAutomMT.CmeCadastroDelete(Sender: TObject);
begin

//  CdsPreDetalhe.First;
//  While not CdsPreDetalhe.EOF do
//     CdsPreDetalhe.Delete;

  inherited;

end;

procedure TfrmCadLancamAutomMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  CdsPreDetalhe.FieldByName('PANTIPO').AsString            := 'B';
  CdsPreDetalhe.FieldByName('IDUSUARIOINCLUSAO').AsInteger := Sistema.IdUsuario;
  CdsPreDetalhe.FieldByName('PLANO').AsInteger             := CtrlContab.PlanoParam;
  CdsPreDetalhe.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;

  HabilitaCamposDetalhe;
  cmpConta.SetFocus;
  //Cássio - SOL Nº 116466 KINTANA Nº550163
  sbtnCriaData.Enabled := False;

end;

procedure TfrmCadLancamAutomMT.rgNaturezaClick(Sender: TObject);
begin
  inherited;
  HabilitaCamposDetalhe;

end;

procedure TfrmCadLancamAutomMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if QntVigenciaPlanilha(iIdPrePlanilha) > 1 then
  begin
      Accept := CtrlPrePlanilhaLA.ApagarPreDetalhe(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
      dtDataComposicao.Clear;
  end
  else
      accept := CtrlPrePlanilhaLA.Apagar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadLancamAutomMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlPrePlanilhaLA.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;

end;

procedure TfrmCadLancamAutomMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlPrePlanilhaLA.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
  Cds.EnableControls;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163
  dtDataComposicao.Clear; 
  dtDataComposicao.Enabled := False;
  sbtnCriaData.Enabled := False;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163
end;

procedure TfrmCadLancamAutomMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPrePlanilhaLA.Free;
  CtrlContab.Free;
  CtrlContaContabil.Free;
  CtrlHistoContab.Free;
  ListTerceiros.Free;
  CtrlParamIntegra.Free;
  //Cássio - SOL Nº116466 KINTANA Nº 550163
  FreeAndNil(_cdsCriaData);
end;

procedure TfrmCadLancamAutomMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlPrePlanilhaLA.MessageInfo <> '' Then
     MsgDlg(CtrlPrePlanilhaLA.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadLancamAutomMT.sbtnDuplicaPlanilhaClick(Sender: TObject);
var
  bOk :Boolean;
  NewName : string;

begin
  inherited;

  If Cds.State in [dsBrowse] Then
  Begin
    If Trim(edDescAutomatico.Text) = '' Then
    Begin
      MsgWarning('É necessário selecionar uma planilha para ser duplicada');
      LevantaBotao;
      Exit;
    End;

    // *** pede o nome da planilha ***
    NewName := edDescAutomatico.Text;
    Repeat
       bOK :=InputQuery(Application.Title, 'Digite o nome da nova Planilha: ', NewName);
       if (bOK) and (length(NewName) > 60) then
          MsgWarning('Nome maior que 60 posições');
    Until (length(NewName) <= 60) or (not bOK);

    // *** Copia aplanilha atual ***
    If Not CtrlPrePlanilhaLA.CopiouLancamentoAut(NewName) Then
    Begin
       MsgDlg(CtrlPrePlanilhaLA.MessageInfo,'Erro',mtError,[mbOK],0);
       LevantaBotao;
    End Else
    Begin
       MsgDlg('Planilha Duplicada com Sucesso.','Aviso',mtError,[mbOk],0);
       LevantaBotao;
       Exit;
    End;
  End Else
  Begin
       MsgDlg('A Planilha não ser Duplicada em Estado de Movimentação.','Aviso',mtError,[mbOk],0);
       LevantaBotao;
  End;

end;

procedure TfrmCadLancamAutomMT.bbtnOkDetClick(Sender: TObject);
begin
  CdsPreDetalhe.FieldByName('DEBITO').asString  := CdsPreDetalhe.FieldByName('PANTIPO').asString;
  CdsPreDetalhe.FieldByName('CREDITO').asString := CdsPreDetalhe.FieldByName('PANTIPO').asString;
  CdsPreDetalhe.FieldByName('BASE').asString    := CdsPreDetalhe.FieldByName('PANTIPO').asString;
  // Obriar tipo de operação
  if ((CdsPreDetalhe.FieldByName('PANTIPO').asString = 'D') or
     (CdsPreDetalhe.FieldByName('PANTIPO').asString = 'C')) and
     (dblkTipoOper.Text = '') then begin
      MsgDlg('O tipo de Operação é obrigatório','Erro',mtError,[mbOK],0);
      exit;
  end;

  inherited;
end;

procedure TfrmCadLancamAutomMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  CdsPreDetalhe.Data := CtrlPrePlanilhaLA.ListCdsDetalheLA(-1, -1);
  Cds.Data := CtrlPrePlanilhaLA.ListPrePlanilha(-1,-1,'');

  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
  dtDataComposicao.Enabled := False;
  dtDataComposicao.Clear;
  sbtnCriaData.Down := False;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim
end;

procedure TfrmCadLancamAutomMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  Cds.FieldByName('FLGSEGREGACRITER').AsString := 'D';
end;

procedure TfrmCadLancamAutomMT.CdsPreDetalheBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('TipoBase').AsString  := cboBase.Text;
  DataSet.FieldByName('NomePlano').AsString := dblcPlanoPrevC.Value;
  DataSet.FieldByName('RazaoSocial').AsString := dblcPatroc.Value;
  if dblkCCusto.Text <> '' then
  begin
    CdsCentroCusto.Data :=  CtrlContaContabil.ListContasxCC(CtrlContab.PlanoParam,Sistema.idEmpresa,Trim(DataSet.FieldByName('PLACONTA').AsString),'',tccAmbasCC,toNome);
    DataSet.FieldByName('CODEXTERNO').AsString := CdsCentroCusto.FieldByName('CODEXTERNO').AsString;
  end
  else
    DataSet.FieldByName('CODEXTERNO').Clear;

  inherited;
end;

procedure TfrmCadLancamAutomMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163
  dtDataComposicao.Enabled := False;
end;

procedure TfrmCadLancamAutomMT.sbtnCriaDataClick(Sender: TObject);
begin
  inherited;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
  sbtnAlterarClick(Self);
  HabilitaComponentesMestre(False);
  dtDataComposicao.Clear;
  dtDataComposicao.Enabled := True;
  dtDataComposicao.SetFocus;

  _cdsCriaData.Data := CdsPreDetalhe.Data;
  CdsPreDetalhe.Close;
  CdsPreDetalhe.Data := CtrlPrePlanilhaLA.ListCdsDetalheLA(-1, -1);
  _cdsCriaData.First;
  while not _cdsCriaData.Eof do
  begin
    CdsPreDetalhe.Insert;
    CdsPreDetalhe.FieldByName('PANCODIGO').AsInteger         := _cdsCriaData.FieldByName('PANCODIGO').AsInteger;
    CdsPreDetalhe.FieldByName('PANNUMLANC').AsInteger        := _cdsCriaData.FieldByName('PANNUMLANC').AsInteger;
    CdsPreDetalhe.FieldByName('PLANO').AsInteger             := _cdsCriaData.FieldByName('PLANO').AsInteger;
    CdsPreDetalhe.FieldByName('PANCONTABASE').AsString       := _cdsCriaData.FieldByName('PANCONTABASE').AsString;
    CdsPreDetalhe.FieldByName('CODCENTROCUSTO').AsString     := _cdsCriaData.FieldByName('CODCENTROCUSTO').AsString;
    CdsPreDetalhe.FieldByName('PANCCUSTOBASE').AsString      := _cdsCriaData.FieldByName('PANCCUSTOBASE').AsString;
    CdsPreDetalhe.FieldByName('IDEMPRESA').AsInteger         := _cdsCriaData.FieldByName('IDEMPRESA').AsInteger;
    CdsPreDetalhe.FieldByName('IDPESSOA').AsInteger          := _cdsCriaData.FieldByName('IDPESSOA').AsInteger;
    CdsPreDetalhe.FieldByName('PLACONTA').AsString           := _cdsCriaData.FieldByName('PLACONTA').AsString;
    CdsPreDetalhe.FieldByName('HITCODHIST').AsString         := _cdsCriaData.FieldByName('HITCODHIST').AsString;
    CdsPreDetalhe.FieldByName('PANPERC').AsFloat             := _cdsCriaData.FieldByName('PANPERC').AsFloat;
    CdsPreDetalhe.FieldByName('PANTIPO').AsString            := _cdsCriaData.FieldByName('PANTIPO').AsString;
    CdsPreDetalhe.FieldByName('PANORIGEM').AsString          := _cdsCriaData.FieldByName('PANORIGEM').AsString;
    CdsPreDetalhe.FieldByName('PANBASE').AsString            := _cdsCriaData.FieldByName('PANBASE').AsString;
    CdsPreDetalhe.FieldByName('PANTIPOBASE').AsString        := _cdsCriaData.FieldByName('PANTIPOBASE').AsString;
    CdsPreDetalhe.FieldByName('CODSUBCONTA').AsInteger       := _cdsCriaData.FieldByName('CODSUBCONTA').AsInteger;
    CdsPreDetalhe.FieldByName('UNIDNEGOC').AsInteger         := _cdsCriaData.FieldByName('UNIDNEGOC').AsInteger;
    CdsPreDetalhe.FieldByName('NUMDOC').AsString             := _cdsCriaData.FieldByName('NUMDOC').AsString;
    CdsPreDetalhe.FieldByName('TIPCODIGO').AsString          := _cdsCriaData.FieldByName('TIPCODIGO').AsString;
    CdsPreDetalhe.FieldByName('IDPLANOPREV').AsInteger       := _cdsCriaData.FieldByName('IDPLANOPREV').AsInteger;
    CdsPreDetalhe.FieldByName('IDPATRO').AsInteger           := _cdsCriaData.FieldByName('IDPATRO').AsInteger;
    CdsPreDetalhe.FieldByName('RAZAOSOCIAL').AsString        := _cdsCriaData.FieldByName('RAZAOSOCIAL').AsString;
    CdsPreDetalhe.FieldByName('NOMEPLANO').AsString          := _cdsCriaData.FieldByName('NOMEPLANO').AsString;
    CdsPreDetalhe.FieldByName('DEBITO').AsString             := _cdsCriaData.FieldByName('DEBITO').AsString;
    CdsPreDetalhe.FieldByName('CREDITO').AsString            := _cdsCriaData.FieldByName('CREDITO').AsString;
    CdsPreDetalhe.FieldByName('BASE').AsString               := _cdsCriaData.FieldByName('BASE').AsString;
    CdsPreDetalhe.FieldByName('AMBOS').AsString              := _cdsCriaData.FieldByName('AMBOS').AsString;
    CdsPreDetalhe.FieldByName('TIPOBASE').AsString           := _cdsCriaData.FieldByName('TIPOBASE').AsString;
    CdsPreDetalhe.FieldByName('CODEXTERNO').AsString         := _cdsCriaData.FieldByName('CODEXTERNO').AsString;
    CdsPreDetalhe.Post;
    _cdsCriaData.Next;
  end;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim
end;

procedure TfrmCadLancamAutomMT.HabilitaComponentesMestre(bEstado: boolean);
begin
  edDescAutomatico.Enabled := bEstado;
  redValorFixo.Enabled := bEstado;
  redNumParcelas.Enabled := bEstado;
  redParcelaAtual.Enabled := bEstado;
  rdgSegregacao.Enabled := bEstado;
  dbchkIntegraPlanilha.Enabled := bEstado;
  dbckInativo.Enabled := bEstado;
  rgBase.Enabled := bEstado;
  dbgrDiaPer.Enabled := bEstado;
end;

function TfrmCadLancamAutomMT.QntVigenciaPlanilha(
  iIdPancodigo: Integer): integer;
var
  cdsAux : TCmClientDataSet;
  sSQL : string;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    //Marilza Colpani - SOL 127363/Kintana 674938
    sSQL := 'SELECT DISTINCT (D.DATAVIGPREPLANILHA) AS QNTVIGENCIA ' +
            '  FROM PREDETALHE D, ' +
            '       PREPLANILHA P ' +
            ' WHERE D.PANCODIGO = P.PANCODIGO' +
            '   AND D.PANCODIGO = ' + IntToStr(iIdPancodigo);

    cdsAux.Data := CtrlPrePlanilhaLA.GetDataPacket(sSQL);
    Result := cdsAux.RecordCount;

// Marilza - comentado para atender o SOL 127363
//    sSQL := 'SELECT COUNT(D.PANCODIGO) AS QNTVIGENCIA ' +
//          '  FROM PREDETALHE D, ' +
//          '       PREPLANILHA P ' +
//          ' WHERE D.PANCODIGO = ' + IntToStr(iIdPancodigo) +
//          '   AND D.PANCODIGO = P.PANCODIGO';
//
//    cdsAux.Data := CtrlPrePlanilhaLA.GetDataPacket(sSQL);
//    Result := cdsAux.FieldByName('QNTVIGENCIA').asInteger;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TfrmCadLancamAutomMT.dtDataComposicaoCloseUp(Sender: TObject);
var
  sMes, sAno, sDia: word;
begin
  inherited;
  //Cássio - SOL Nº116466 - KINTANA Nº550163 - Início
  if trim(dtDataComposicao.Text) <> '' then
  begin
    DecodeDate(dtDataComposicao.Date, sAno, sMes, sDia);
    if dtDataComposicao.Date <> StrToDateTime('01/'+ IntToStr(sMes)+'/'+ IntToStr(sAno)) then
    begin
      MsgDlg('Data de Composição da planilha deve ser definida para o 1º dia do período desejado', 'Informação', mtWarning, [mbOk], 0);
      dtDataComposicao.Clear;
      dtDataComposicao.SetFocus;
      CmeDetalhe.Cancel(Self);
      Exit;
    end;

    if sbtnCriaData.Down then
    begin
      if VerificaDataVigenciaPrePlanilha(StrToInt(MontaSelect.ValoresChave[1]),
                                         dtDataComposicao.Date) then
      begin
        MsgDlg('Data de Composição já utilizada para esta Planilha', 'Informação', mtWarning, [mbOk], 0);
        dtDataComposicao.Clear;
        dtDataComposicao.SetFocus;
        CmeDetalhe.Cancel(Self);
      end;
    end;
  end;
  //Cássio - SOL Nº116466 - KINTANA Nº550163 - Fim
end;

function TfrmCadLancamAutomMT.VerificaDataVigenciaPrePlanilha(
  iPanCodigo: Integer; dDataVigPrePlanilha: TDateTime): Boolean;
var
  sSQL : string;
  cdsAux : TCmClientDataSet;
begin
  cdsAux := TCMClientDataSet.Create(nil);
  try
    sSQL := 'SELECT COUNT(PANNUMLANC) AS QNTPREDETALHE ' +
            '  FROM PREDETALHE ' +
            ' WHERE PANCODIGO = ' + IntToStr(iPanCodigo) +
            '   AND DATAVIGPREPLANILHA = ' + QuotedStr(DateToStr(dDataVigPrePlanilha));
    cdsAux.Data := CtrlPrePlanilhaLA.GetDataPacket(sSQL);

    if (cdsAux.IsEmpty) or (cdsAux.FieldByName('QNTPREDETALHE').asInteger < 1) then
      Result := False
    else
      Result := True;
  finally
    FreeAndNil(cdsAux);
  end;
end;

procedure TfrmCadLancamAutomMT.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Início
  if Trim(dtDataComposicao.Text) = '' then
  begin
    MsgDlg('Defina uma data de composição', 'Aviso', mtWarning, [mbOk], 0);
    dtDataComposicao.SetFocus;
    Abort;
  end
  else
    if CdsPreDetalhe.State in [dsEdit, dsInsert] then
      CdsPreDetalhe.FieldByName('DATAVIGPREPLANILHA').AsDateTime := dtDataComposicao.Date;
  //Cássio - SOL Nº 116466 KINTANA Nº 550163 - Fim
end;

end.
