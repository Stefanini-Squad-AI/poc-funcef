unit FCadElemDemoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMestreDetMT, Mask, Buttons, StdCtrls, DBCtrls, wwdbedit,
  Wwdotdot, Wwdbcomb, TREdit, ExtCtrls, wwdblook, MontaSelect, Db,
  DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, Grids,
  Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe,uCtrlDemonstrativo,
  uCtrlListTerceiros,uCtrlElemDemonstrativo, CMProcuraMask,
  uCtrlContaContabil,uCtrlSubConta,uCtrlContab, DBTables, Wwquery,
  Provider, uCMTypes;


type
  TfrmCadElemDemoMT = class(TFrmCadastroMestreDetMT)
    Label4: TLabel;
    dblkDemo: TwwDBLookupCombo;
    rdgTipo: TDBRadioGroup;
    dbeDesc: TDBEdit;
    lblFormaRecPag: TLabel;
    dbeCodigo: TDBEdit;
    dbrLinha: TDBRealEdit;
    Label9: TLabel;
    Label12: TLabel;
    gbAnaVert: TGroupBox;
    Label10: TLabel;
    Label13: TLabel;
    dblkDemo100: TwwDBLookupCombo;
    dblkDemo1001: TwwDBLookupCombo;
    dbcbIndentacao: TwwDBComboBox;
    Label8: TLabel;
    dbcbSeparador: TwwDBComboBox;
    Label2: TLabel;
    dbckAcumulado: TDBCheckBox;
    tbsSomatorio: TTabSheet;
    tbsConfiguracao: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    sbtMais: TSpeedButton;
    Label11: TLabel;
    sbtMenos: TSpeedButton;
    sbtVezes: TSpeedButton;
    sbtDiv: TSpeedButton;
    sbtPercent: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dblkElemDet: TwwDBLookupCombo;
    dbcboCondicao: TwwDBComboBox;
    dbcboTipo: TwwDBComboBox;
    dblkElementoCondicao: TwwDBLookupCombo;
    dbrValor: TDBRealEdit;
    dbgrdSomatorio: TwwDBGrid;
    dbrgTipoNegativo: TDBRadioGroup;
    dbrgNatureza: TDBRadioGroup;
    dbckLinhaMonetaria: TDBCheckBox;
    dbckSaltaPagina: TDBCheckBox;
    dbckNegrito: TDBCheckBox;
    dbckDecimais: TDBCheckBox;
    dblcTraco: TwwDBComboBox;
    Label3: TLabel;
    Label5: TLabel;
    mskAtivProj: TMaskEdit;
    Label7: TLabel;
    btnAtivProj: TBitBtn;
    mskSubConta: TMaskEdit;
    btnSubConta: TBitBtn;
    Label6: TLabel;
    MontaSelectSubConta: TMontaSelect;
    MontaSelectAtivProj: TMontaSelect;
    CdsDemonstrativo: TCMClientDataSet;
    CdsPercentual: TCMClientDataSet;
    CdsPatro: TCMClientDataSet;
    CdsValor: TCMClientDataSet;
    CdsPlanoPrev: TCMClientDataSet;
    dsDetSomatorio: TwwDataSource;
    CdsDetSomatorio: TCMClientDataSet;
    CdsDetConta: TCMClientDataSet;
    cmpConta: TCMProcuraMaskContabil;
    dblkCCusto: TwwDBLookupCombo;
    CdsCentroCusto: TCMClientDataSet;
    mskUnidNegoc: TMaskEdit;
    CdsAtivProj: TCMClientDataSet;
    CdsDemoSoma: TCMClientDataSet;
    CdsDemoCond: TCMClientDataSet;
    sbtnCopiar: TToolbarButton97;
    CdsSubConta: TCMClientDataSet;
    pnlPlanoPatroC: TPanel;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPlanoPrevC: TwwDBLookupCombo;
    dblcPatroC: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure cmpContaExit(Sender: TObject);
    procedure mskAtivProjExit(Sender: TObject);
    procedure btnAtivProjClick(Sender: TObject);
    procedure rdgTipoChange(Sender: TObject);
    procedure rdgTipoClick(Sender: TObject);
    procedure dblkDemoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblkDemoExit(Sender: TObject);
    procedure mskSubContaExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeDetalheConfirma(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure dbcboCondicaoCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure dbcboTipoCloseUp(Sender: TwwDBComboBox; Select: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure btnSubContaClick(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    dIndice,dSalvaDemo: Double;
    CtrlDemonstrativo : TCtrlDemonstrativo;
    ListTerceiros     : TCtrlListTerceiros;
    CtrlElemDemo      : TCtrlElemDemonstrativo;
    CtrlContaContabil : TCtrlContaContabil;
    CtrlSubConta      : TCtrlSubConta;
    CtrlContab        : TCtrlContab;
    procedure processaTipo;
    procedure FazCloseUp;
    procedure FazOnCalcField;
    function VerificaPreenchimentoDetalhe: boolean;
    function VerificaDetSomatorio: boolean;

  public
    { Public declarations }
  end;

var
  frmCadElemDemoMT: TfrmCadElemDemoMT;

implementation

uses UMensErro, uDatabase, DBaseDados,uSistema,
     uModulo, uFuncaoGeral, uVerificaPreenchimento,FCopiaDemonstrativoMT;

{$R *.DFM}


function TfrmCadElemDemoMT.VerificaDetSomatorio: boolean;
begin
  Result := False;
  try
    // Demonstrativo
    if length(trim(dblkElemDet.Text)) = 0 then
      raise EValidacao.CreateVal('Elemento do Demonstrativo do Somatório não informado.', dblkElemDet);
  except
    on ev : EValidacao do
    begin
      if ev.Show then
        MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
      Repaint;
      ev.Control.SetFocus;
      Exit;
    end;
  end;
  Result := True;
end;

function TfrmCadElemDemoMT.VerificaPreenchimentoDetalhe : boolean;
var
   bPreenchido : boolean;
begin
  bPreenchido := True;
  // só verifica se estiver fazendo uma inclusão ou alteração
  if (cds.State in [dsInsert, dsEdit]) then
  begin
    if (tbcDetalhe.tabIndex = 1) and (cdsDetSomatorio.State in [dsInsert, dsEdit]) then
    begin
      bPreenchido := False;
      if VerificaDetSomatorio then
        bPreenchido := True;
    end;
  end else
  begin
    bPreenchido := True;
  end;
  Result := bPreenchido;
end;

procedure TfrmCadElemDemoMT.FazOnCalcField;
var
  sOper, sCond : string;

begin
    {*** simula o evento onCalcField de uma query *** }

    CdsDetSomatorio.First;

    While Not CdsDetSomatorio.Eof do
    Begin
       CdsDetSomatorio.Edit;

       sOper := CdsDetSomatorio.FieldByName('FLGOPERACAO').asString;

       If sOper <> '' Then
       Begin
          Case sOper[1] of
            'S' : CdsDetSomatorio.FieldByName('OPERACAO').asString := 'Soma';
            'U' : CdsDetSomatorio.FieldByName('OPERACAO').asString := 'Subtração';
            'D' : CdsDetSomatorio.FieldByName('OPERACAO').asString := 'Divisão';
            'M' : CdsDetSomatorio.FieldByName('OPERACAO').asString := 'Multiplicação';
            'P' : CdsDetSomatorio.FieldByName('OPERACAO').asString := 'Percentual';
          End;
       End;

       If CdsDetSomatorio.FieldByName('ELECONDICAO').isNull Then
       Begin
           sCond := '';
       End Else
       Begin

         sCond := sCond + 'Se o resultado for ';

         If CdsDetSomatorio.FieldByName('ELECONDICAO').asString = '<=' then
            sCond := sCond + 'menor ou igual que ';

         If CdsDetSomatorio.FieldByName('ELECONDICAO').asString = '<' then
            sCond := sCond + 'menor que ';

         If CdsDetSomatorio.FieldByName('ELECONDICAO').asString = '=' then
            sCond := sCond + 'igual a';

         If CdsDetSomatorio.FieldByName('ELECONDICAO').asString = '>' then
            sCond := sCond + 'maior que ';

         If CdsDetSomatorio.FieldByName('ELECONDICAO').asString = '>=' then
            sCond := sCond + 'maior ou igual que ';

         If CdsDetSomatorio.FieldByName('ELECONDICAO').asString = '<>' then
            sCond := sCond + 'diferente d';

         If CdsDetSomatorio.FieldByName('ELETIPOCOND').asString = 'V' then
            sCond := sCond + 'o valor ' + FormatFloat('###,###,###,##0.00', CdsDetSomatorio.FieldByName('ELEVALORCOND').asFloat);

         If CdsDetSomatorio.FieldByName('ELETIPOCOND').asString = 'E' then
            sCond := sCond + 'o elemento escolhido';

       End;

      CdsDetSomatorio.FieldByName('CONDICAO').asString := sCond;

      CdsDetSomatorio.Post;

      CdsDetSomatorio.Next;
    End;

    CdsDetSomatorio.First;

end;

procedure TfrmCadElemDemoMT.FazCloseUp;
begin
  If dblkDemo.text <> '' Then
    dSalvaDemo := StrToInt(dblkDemo.LookUpValue);

    {*** pega a sequencia do demonstrativo ***}
    CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,CdsDemonstrativo.FieldByName('IDDEMONSTRATIVO').asFloat,False);

    {*** preenche combo de percentual ***}
    CdsPercentual.Data :=  CtrlElemDemo.ListElemDemonstrativo(CdsDemonstrativo.FieldByName('IDDEMONSTRATIVO').asFloat,-1,-1,-1);

    {*** preenche combo de valor ***}
    CdsValor.Data := CtrlElemDemo.ListElemDemonstrativo(CdsDemonstrativo.FieldByName('IDDEMONSTRATIVO').asFloat,-1,-1,-1);

    {*** preenche combo elem. do demonstrativo da condição *** }
    CdsDemoCond.Data := CtrlElemDemo.ListElemDemonstrativo(CdsDemonstrativo.FieldByName('IDDEMONSTRATIVO').asFloat,-1,-1,-1);

    {*** preenche combo elem. do demonstrativo *** }
    CdsDemoSoma.Data := CtrlElemDemo.ListElemDemonstrativo(CdsDemonstrativo.FieldByName('IDDEMONSTRATIVO').asFloat,-1,-1,-1);

    {*** Define o Valor da Próxima linha ***}
    If Cds.State in [dsInsert] Then
    Begin
      If CtrlElemDemo.RetornaElemOrdemLinha(CdsDemonstrativo.FieldByName('IDDEMONSTRATIVO').asFloat) Then
      Begin
         Cds.FieldByName('ELEORDEMLINHA').asFloat := CtrlElemDemo.ProximaElemOrdemLinha;
         dbrLinha.value := CtrlElemDemo.ProximaElemOrdemLinha;
      End Else
      Begin
        MsgDlg('O numero da Linha não foi Gerado.','Erro',mtError,[mbOk],0);
      End;
    End;
    
end;

procedure TfrmCadElemDemoMT.ProcessaTipo;
begin
   //Habilita e desabilita os tabSet's de acordo com a seleção
  case rdgTipo.ItemIndex of
    0:
    begin
      tbsDet.enabled           := true;
      tbsSomatorio.enabled     := false;
      tbcDetalhe.TabIndex      := 0;
      pgctrlDetalhe.ActivePage := tbsDet;
    end;
    1:
    begin
      tbsDet.enabled           := false;
      tbsSomatorio.enabled     := true;
      tbcDetalhe.TabIndex      := 1;
      pgctrlDetalhe.ActivePage := tbsSomatorio;
    end;
    2:
    begin
      tbsDet.enabled           := false;
      tbsSomatorio.enabled     := false;
      tbcDetalhe.TabIndex      := 0;
      pgctrlDetalhe.ActivePage := tbsDet;
    end;
  end;
  tbcDetalheChange(tbcDetalhe);

end;

procedure TfrmCadElemDemoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe principal ***
  CtrlElemDemo := TCtrlElemDemonstrativo.Create;
  CtrlElemDemo.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                           Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsPercentual.Data := CtrlElemDemo.ListElemDemonstrativo(-1,-1,-1,-1);
  CdsValor.Data      := CtrlElemDemo.ListElemDemonstrativo(-1,-1,-1,-1);
  CdsDemoCond.Data   := CtrlElemDemo.ListElemDemonstrativo(-1,-1,-1,-1);
  CdsDemoSoma.Data   := CtrlElemDemo.ListElemDemonstrativo(-1,-1,-1,-1);

  // *** Atribui os cds mestre e os detalhes da tela com os da classe de negocio ***
  CtrlElemDemo.cdsMestre       := Cds;
  Cds.Data := CtrlElemDemo.ListCdsMestre(-1);

  CtrlElemDemo.cdsDetalheConta := CdsDetConta;
  CdsDetConta.Data := CtrlElemDemo.ListCdsDetConta(-1);

  CtrlElemDemo.cdsDetalheSoma  := CdsDetSomatorio;
  CdsDetSomatorio.Data := CtrlElemDemo.ListCdsDetSomatorio(-1);

  // *** Instancia a classe demonstrativo ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                               Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CdsDemonstrativo.Data := CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,0,True);

  // *** Instancia a classe terceiros ***
  ListTerceiros := TCtrlListTerceiros.Create;
  ListTerceiros.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                    Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  CdsAtivProj.Data := ListTerceiros.ListAtivProj(-1,0,'',tapAmbos,toapNome);

  CdsPatro.Data     := ListTerceiros.ListPlanoPatro;
  CdsPlanoPrev.Data := ListTerceiros.ListPlanoPrev;

  // *** Instancia a classe subconta ***
  CtrlSubConta := TCtrlSubConta.Create;
  CtrlSubConta.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                          Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  // *** Instancia a classe geral ContaContab ***
  CtrlContaContabil := TCtrlContaContabil.Create;
  CtrlContaContabil.Initialize(dtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,False);

  // *** Instancia a classe geral CtrlContab ***
  CtrlContab := TCtrlContab.Create;
  CtrlContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                       Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
     MsgDlg(CtrlContab.MessageInfo,'Erro',MtError,[mbOk],0);


  TStringField(cdsDetConta.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(cdsDetConta.FieldByName('CODCENTROCUSTO')).EditMask := Modulo.sMascaraCCusto + ';0; ';

  dSalvaDemo := 0;
  cmpConta.Plano        := CtrlContab.PlanoParam;
  cmpConta.Mascara      := CtrlContab.MascaraContaParam;
  mskAtivProj.EditMask  := Modulo.sMascaraUnidNegoc + ';0; ';
  CdsCentroCusto.Data   := ListTerceiros.ListCentroCusto(Sistema.idEmpresa,'','S');

  MontaSelect.Filtro.Add('DEMONSTRATIVO.IDPESSOA = ' + IntToStr(sistema.IdEmpresa));
  MontaSelectSubConta.Filtro.Add('SUBCONTA.IDPESSOA = ' + IntToStr(sistema.idEmpresa));
  MontaSelectAtivProj.Filtro.Add('UNIDNEGOCIO.IDPESSOA = ' + IntToStr(sistema.idEmpresa));


end;

procedure TfrmCadElemDemoMT.tbcDetalheChange(Sender: TObject);
begin
  Repaint;
  inherited;

end;

procedure TfrmCadElemDemoMT.cmpContaExit(Sender: TObject);
begin
  inherited;

    If (ActiveControl.Tag <> 999) and (cmpConta.Valida <> VcOK) Then
    Begin
       cmpConta.SetFocus;
       Exit;
    End;

end;

procedure TfrmCadElemDemoMT.mskAtivProjExit(Sender: TObject);
begin
  inherited;

  If mskAtivProj.text <> '' Then
  Begin

    CdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,Trim(mskAtivProj.Text),tapAmbos,toapNome);

    If Not CdsAtivProj.IsEmpty Then
    Begin
       mskAtivProj.text  := CdsAtivProj.FieldByName('UNECODIGO').asString;
       mskUnidNegoc.text := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
    End Else
    Begin
       MsgDlg('O código da atividade/projeto informado não existe.','Aviso',mtWarning,[mbOk],0);
       mskAtivProj.SetFocus;
    End;
    
  End;

end;

procedure TfrmCadElemDemoMT.btnAtivProjClick(Sender: TObject);
begin
  inherited;
  MontaSelectAtivProj.Executar;
  Repaint;
  If MontaSelectAtivProj.RetornouValor Then
  Begin
    CdsAtivProj.Data := ListTerceiros.ListAtivProj(Sistema.IdEmpresa,0,Trim(MontaSelectAtivProj.ValoresChave[1]),tapAmbos,toapNome);
    mskAtivProj.text    := CdsAtivProj.FieldByName('UNECODIGO').asString;
    mskUnidNegoc.text   := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').asInteger);
  End;

end;

procedure TfrmCadElemDemoMT.rdgTipoChange(Sender: TObject);
begin
  inherited;
  ProcessaTipo;
end;

procedure TfrmCadElemDemoMT.rdgTipoClick(Sender: TObject);
begin
  inherited;
  processaTipo;
end;

procedure TfrmCadElemDemoMT.dblkDemoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  FazCloseUp;
end;

procedure TfrmCadElemDemoMT.dblkDemoExit(Sender: TObject);
begin
  inherited;
  FazCloseUp;

end;

procedure TfrmCadElemDemoMT.mskSubContaExit(Sender: TObject);
begin
  inherited;
  if mskSubConta.text <> '' then
  begin
    {*** Verifica se a subconta existe *** }
    CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(mskSubConta.Text));
    If CtrlSubConta.AchouSubConta Then
    Begin
       mskSubConta.text  := CtrlSubConta.NomeSubConta;
    End Else
    Begin
       MsgDlg('O código da sub-conta informada não existe.','Aviso',mtWarning,[mbOk],0);
       mskSubConta.SetFocus;
    End;
  End;

end;

procedure TfrmCadElemDemoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  {*** Faz a verificação do preenchimento dos campos *** }
  If Cds.State in [dsInsert, dsEdit] Then
  Begin
    if VerificaPreenchimentoDetalhe Then
    Begin
        {---- Demonstrativo ---}
        If dblkDemo.Text = '' Then
        Begin
          MsgDlg('Demonstrativo não selecionado.','Erro',mtError,[mbOk],0);
          dblkDemo.SetFocus;
          Accept := False;
        End;

        {---- Descrição ----}
        If dbeDesc.Text = '' Then
        Begin
          MsgDlg('Descrição do Elemento do Demonstrativo não informada.','Erro',mtError,[mbOk],0);
          dbeDesc.SetFocus;
          Accept := False;
        End;

        {---- Tipo ---- }
        If rdgTipo.ItemIndex < 0 Then
        Begin
          MsgDlg('Tipo do Elemento não selecionado.','Erro',mtError,[mbOk],0);
          Accept := False;
        End;

        {---- No.Linha ---- }
        If dbrLinha.value = 0 Then
        Begin
          MsgDlg('Número da Linha não informado.','Erro',mtError,[mbOk],0);
          dbrLinha.SetFocus;
          Accept := False;
        End;

        {---- Separador ---- }
        If dbcbSeparador.Text = '' Then
        Begin
          MsgDlg('Tipo de Separador da Linha não selecionado.','Erro',mtError,[mbOk],0);
          dbcbSeparador.SetFocus;
          Accept := False;
        End;

        {---- Indentação ---- }
        If dbcbIndentacao.Text = '' Then
        Begin
          MsgDlg('Nível de Indentação da Linha não selecionado.','Erro',mtError,[mbOk],0);
          dbcbIndentacao.SetFocus;
          Accept := False;
        End;
    End;
  End;

end;

procedure TfrmCadElemDemoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlElemDemo.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadElemDemoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Cds.DisableControls;
  accept := CtrlElemDemo.Gravar;
  Cds.EnableControls;

end;

procedure TfrmCadElemDemoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept :=   CtrlElemDemo.Apagar;

end;

procedure TfrmCadElemDemoMT.CmeCadastroDelete(Sender: TObject);
begin
   CdsDetConta.First;
   while Not CdsDetConta.Eof do
      CdsDetConta.Delete;

   CdsDetSomatorio.First;
   while Not CdsDetSomatorio.Eof do
      CdsDetSomatorio.Delete;

  inherited;

end;

procedure TfrmCadElemDemoMT.FormShow(Sender: TObject);
begin
  inherited;
  pnlPlanoPatroC.Visible := Sistema.UsaPlanoPatro;
  tbcDetalhe.TabIndex        := 0;
  pgctrlDetalhe.ActivePage   := tbsDet;
end;

procedure TfrmCadElemDemoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   dblkDemo.SetFocus;
   tbcDetalheChange(tbcDetalhe);

end;

procedure TfrmCadElemDemoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;

  {*** Define o id do registro que se está inserindo, para poder gravar no detalhe ***}

  Cds.FieldByName('IDELEMDEMONSTRAT').asFloat := dIndice;
  Cds.FieldByName('IDDEMONSTRATIVO').AsFloat  := dSalvaDemo;

  rdgTipo.ItemIndex := 0;

  Cds.FieldByName('ELETIPOELEM').AsString     := 'C';
  Cds.FieldByName('FLGTIPONEGATIVO').AsString := 'M';
  Cds.FieldByName('FLGNATUREZA').AsString     := 'D';
  Cds.FieldByName('FLGTIPOLINHA').AsString    := 'E';
  Cds.FieldByName('FLGINDENTACAO').AsString   := '1';
  Cds.FieldByName('FLGTRACO').AsString        := 'VA';
  Cds.FieldByName('FLGMONETARIA').AsString    := 'S';
  Cds.FieldByName('FLGSALTAPAGINA').AsString  := 'N';
  Cds.FieldByName('FLGNEGRITO').AsString      := 'N';
  Cds.FieldByName('FLGDECIMAIS').AsString     := 'S';
  Cds.FieldByName('FLGACUMULADO').AsString    := 'N';

  rdgTipoClick(Self);

  CdsDetConta.Data     := CtrlElemDemo.ListCdsDetConta(-1);
  TStringField(cdsDetConta.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(cdsDetConta.FieldByName('CODCENTROCUSTO')).EditMask := Modulo.sMascaraCCusto + ';0; ';

  CdsDetSomatorio.Data := CtrlElemDemo.ListCdsDetSomatorio(-1);
  FazOnCalcField;

  tbcDetalheChange(tbcDetalhe);

  If dblkDemo.CanFocus then
      dblkDemo.SetFocus;


end;

procedure TfrmCadElemDemoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  {*** Redesenha o form na volta do MontaSelect *** }
  Repaint;

  {*** se houve busca, preenche o cds principal com apenas o registro
  { buscado  e os cds filhos *** }
  If MontaSelect.RetornouValor Then
  Begin
    dIndice := StrToInt(MontaSelect.ValoresChave[0]);

    Cds.Data := CtrlElemDemo.ListCdsMestre(dIndice);

    If Not Cds.IsEmpty Then
    Begin
      dblkDemo100.Text  := Cds.FieldByName('ELEDESC100').AsString;
      dblkDemo1001.Text := Cds.FieldByName('ELEDESC1001').AsString;

      {*** Abre o Detalhe de contas e somatorio ***}
      CdsDetConta.Data     := CtrlElemDemo.ListCdsDetConta(dIndice);
      TStringField(cdsDetConta.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
      TStringField(cdsDetConta.FieldByName('CODCENTROCUSTO')).EditMask := Modulo.sMascaraCCusto + ';0; ';

      CdsDetSomatorio.Data := CtrlElemDemo.ListCdsDetSomatorio(dIndice);
      FazOnCalcField;
    End;


  End;

end;

procedure TfrmCadElemDemoMT.CmeDetalheConfirma(Sender: TObject);
begin
  If (Cds.State in [dsInsert, dsEdit]) Then
  Begin
    {*** movimenta os campos para o detconta antes de gravar *** }
    If (tbcDetalhe.tabIndex = 0) And (CdsDetConta.State in [dsInsert, dsEdit]) Then
    Begin
       CdsDetConta.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;

       If Trim(mskSubConta.text) <> '' Then
          CdsDetConta.FieldByName('CODSUBCONTA').asInteger := StrToInt(mskSubConta.text);

       If Trim(mskUnidNegoc.text) <> '' Then
          CdsDetConta.FieldByName('UNIDNEGOC').asInteger := StrToInt(mskUnidNegoc.text);

       If dblkCCusto.text <> '' then
       Begin
          CdsDetConta.FieldByName('IDEMPRESA').asInteger     := Sistema.IdEmpresa;
       End;

       If cmpconta.conta.numero <> '' then
       Begin
          CdsDetConta.FieldByName('PLANO').asInteger   := CtrlContab.PlanoParam;
          CdsDetConta.FieldByName('PLACONTA').asString := cmpConta.Conta.numero;
       End;

    End;

    {*** movimenta os campos para o detsomatorio antes de gravar *** }
    If (tbcDetalhe.tabIndex = 1) and (CdsDetSomatorio.State in [dsInsert, dsEdit]) Then
    Begin

      CdsDetSomatorio.FieldByName('ELEDESCELEM').AsString := dblkElemDet.Text;

      If sbtMais.down Then
        CdsDetSomatorio.FieldByName('FLGOPERACAO').asString := 'S';

      If sbtMenos.down Then
        CdsDetSomatorio.FieldByName('FLGOPERACAO').asString := 'U';

      If sbtVezes.down Then
        CdsDetSomatorio.FieldByName('FLGOPERACAO').asString := 'M';

      if sbtDiv.down Then
        CdsDetSomatorio.FieldByName('FLGOPERACAO').asString := 'D';

      If sbtPercent.down Then
         CdsDetSomatorio.FieldByName('FLGOPERACAO').asString := 'P';
    End;
  End;
  inherited;

end;

procedure TfrmCadElemDemoMT.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  case tbcDetalhe.TabIndex of
    0:
    Begin
      CdsDetConta.FieldByName('IDELEMDEMONSTRAT').asFloat := dIndice;

      dblkCCusto.text   := '';
      mskSubConta.text  := '';
      mskUnidNegoc.text := '';
      mskAtivProj.text  := '';

      If cmpConta.CanFocus Then
         cmpConta.SetFocus;
    End;
    1:
    Begin
      CdsDetSomatorio.FieldByName('IDELEMDEMONSTRAT').asFloat   := dIndice;
      CdsDetSomatorio.FieldByName('FLGOPERACAO').asString       := 'S';

      sbtMais.down := true;

      If dblkElemDet.CanFocus then
         dblkElemDet.SetFocus;
    End;
  End;

end;

procedure TfrmCadElemDemoMT.CmeDetalheEdit(Sender: TObject);
var
  sOper : string;
begin
  inherited;
  case tbcDetalhe.TabIndex of
    0:
    Begin
      If Not CdsDetConta.FieldByName('CODSUBCONTA').isNull Then
         mskSubConta.Text := CdsDetConta.FieldByName('CODSUBCONTA').AsString;

      If Not CdsDetConta.FieldByName('UNIDNEGOC').isNull Then
      Begin
        mskUnidNegoc.Text := CdsDetConta.FieldByName('UNIDNEGOC').AsString;
        mskAtivProj.Text  := IntToStr(CdsAtivProj.FieldByName('UNIDNEGOC').AsInteger);
      End;

      If cmpConta.Conta.Numero <> '' Then
         cmpConta.SetFocus;
    End;
    1:
    Begin
       sOper := CdsDetSomatorio.FieldByName('FLGOPERACAO').asString;
       Case sOper[1] of
          'S' : sbtMais.down    := true;
          'U' : sbtMenos.down   := true;
          'D' : sbtDiv.down     := true;
          'M' : sbtVezes.down   := true;
          'P' : sbtPercent.down := true;
        End;

      If dblkElemDet.CanFocus then
         dblkElemDet.SetFocus;
    End;
  End;

end;

procedure TfrmCadElemDemoMT.dbcboCondicaoCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  CdsDetSomatorio.FieldByName('ELETIPOCOND').asString := 'V';

end;

procedure TfrmCadElemDemoMT.dbcboTipoCloseUp(Sender: TwwDBComboBox;
  Select: Boolean);
begin
  inherited;
  If dbcboTipo.Text = 'Valor' then
  Begin
    dbrValor.enabled := true;
    dblkElementoCondicao.enabled := false;
  End Else
  Begin
    dbrValor.enabled := false;
    dblkElementoCondicao.enabled := true;
  End;

end;

procedure TfrmCadElemDemoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDemonstrativo.Free;
  ListTerceiros.Free;
  CtrlElemDemo.Free;
  CtrlContaContabil.Free;
  CtrlSubConta.Free;
  CtrlContab.Free;

end;

procedure TfrmCadElemDemoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 // inherited;
  Cds.Data := CtrlElemDemo.ListCdsMestre(Cds.FieldByName('IDELEMDEMONSTRAT').asFloat);
  CdsDetConta.Data     := CtrlElemDemo.ListCdsDetConta(Cds.FieldByName('IDELEMDEMONSTRAT').asFloat);

  TStringField(cdsDetConta.FieldByName('PLACONTA')).EditMask := CtrlContab.MascaraContaParam + ';0; ';
  TStringField(cdsDetConta.FieldByName('CODCENTROCUSTO')).EditMask := Modulo.sMascaraCCusto + ';0; ';

  CdsDetSomatorio.Data := CtrlElemDemo.ListCdsDetSomatorio(Cds.FieldByName('IDELEMDEMONSTRAT').asFloat);
  FazOnCalcField;

end;

procedure TfrmCadElemDemoMT.sbtnCopiarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmCopiaDemonstrativoMT, frmCopiaDemonstrativoMT);
  frmCopiaDemonstrativoMT.ShowModal;
  sbtnCopiar.Down := false;
end;

procedure TfrmCadElemDemoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlElemDemo.MessageInfo <> '' Then
     MsgDlg(CtrlElemDemo.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmCadElemDemoMT.btnSubContaClick(Sender: TObject);
begin
  inherited;
  MontaSelectSubConta.Executar;
  Repaint;
  If MontaSelectSubConta.RetornouValor Then
  Begin
    CdsSubConta.Data := CtrlSubConta.ListSubConta(Sistema.IdEmpresa,StrToFloat(MontaSelectsubConta.ValoresChave[0]));
    mskSubConta.text := CdsSubConta.FieldByName('CODSUBCONTA').asString;
  End;

end;

procedure TfrmCadElemDemoMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlElemDemo.ListCdsMestre(-1);
  CdsDetConta.Data := CtrlElemDemo.ListCdsDetConta(-1);
  CdsDetSomatorio.Data := CtrlElemDemo.ListCdsDetSomatorio(-1);
end;



procedure TfrmCadElemDemoMT.sbtnApagarClick(Sender: TObject);
begin
  if Cds.FieldByName('IDDEMONSTRATIVO').AsInteger < 0 then
  begin
     MsgDlg('Este tipo de Elemento de Demonstrativo é um padrão SPC e não pode ser excluído!','Aviso',mtWarning,[mbOk],0);
     sbtnApagar.Down := False;
  end
  else
     inherited;
end;




procedure TfrmCadElemDemoMT.sbtnAlterarClick(Sender: TObject);
begin
  if Cds.FieldByName('IDDEMONSTRATIVO').AsInteger < 0 then
  begin
     MsgDlg('Este tipo de Elemento de Demonstrativo é um padrão SPC e não pode ser alterado!','Aviso',mtWarning,[mbOk],0);
     sbtnAlterar.Down := False;
  end
  else
     inherited;

end;

end.
