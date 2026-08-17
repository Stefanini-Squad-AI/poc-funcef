unit FParamFinanc;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook, ComCtrls, DBCtrls,
  CMTree, Mask, TB97Ctls, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  CMProcuraMask, ppCtrls, wwdbedit, CMDBLookupCombo,
  CmEventosCadastro, ImgList, wwdbdatetimepicker, CMDateTimePicker,
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};

CONST
   NUMASS_FIN = 6;

Type
   TParamRel = Record
      IDPARAMRELATS: Integer;
      IDMODULO     : Integer;
      IDPESSOA     : Integer;
      NOMECOMPO    : String;
      DESCRICAO    : String;
      VALOR        : String;
      NOMERALATORIO: String;
End;

type
  TfrmParamFinanc = class(TfrmCadastroCS)
    pcnParametros: TPageControl;
    tbsGeral: TTabSheet;
    grpIntegracao: TGroupBox;
    sbtnSim: TSpeedButton;
    sbtnNao: TSpeedButton;
    grpAlterador: TGroupBox;
    lblJuros: TLabel;
    lblCorMonet: TLabel;
    lblVarCambial: TLabel;
    dblcJuros: TwwDBLookupCombo;
    dblcCorrecao: TwwDBLookupCombo;
    dblcVariacao: TwwDBLookupCombo;
    qryAlterador: TwwQuery;
    qryAlterador1: TwwQuery;
    tbsNaoIdent: TTabSheet;
    gbIntContab: TGroupBox;
    lblCentroCusto: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    qryccusto: TwwQuery;
    tbsRelatorios: TTabSheet;
    dbccConta: TCMProcuraMaskContabil;
    Pnldocpendentes: TPanel;
    UpdParamRel: TUpdateSQL;
    QryParamRel: TwwQuery;
    QryParamRelIDPARAMRELATS: TFloatField;
    QryParamRelIDMODULO: TFloatField;
    QryParamRelIDPESSOA: TFloatField;
    QryParamRelNOMECOMPO: TStringField;
    QryParamRelDESCRICAO: TStringField;
    QryParamRelVALOR: TStringField;
    QryParamRelNOMERELATORIO: TStringField;
    ImlReports: TImageList;
    TreeAssin: TTreeView;
    lblSubConta: TLabel;
    dblcSubConta: TwwDBLookupCombo;
    qrySubConta: TwwQuery;
    tbsGeral2: TTabSheet;
    gbTrocaTipo: TGroupBox;
    lblTroca: TLabel;
    lblFinalCAR: TLabel;
    lblFinalCAP: TLabel;
    dbcbTroca: TDBCheckBox;
    dbedFinalCAR: TwwDBEdit;                              
    dbedFinalCAP: TwwDBEdit;
    dbcbConfirmaRP: TDBCheckBox;
    qryTipoAplic: TwwQuery;
    lblTipoAplic: TLabel;
    dblcTipoAplic: TCMDBLookupCombo;
    dbckCalcImposto: TDBCheckBox;
    tbsFluxoCaixa: TTabSheet;
    gpbDiasBloqueioFluxo: TGroupBox;
    dbedNumDiasBloqueioCurto: TDBEdit;
    dbedNumDiasBloqueioMedio: TDBEdit;
    dbedNumDiasBloqueioLongo: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    dblcTipoDocurmento: TwwDBLookupCombo;
    qryTipoDocumento: TwwQuery;
    Label4: TLabel;
    edDataBloqDisp: TCMDateTimePicker;
    dbckImprimeCheque: TDBCheckBox;
    dbckbAtualizaFlx: TDBCheckBox;
    dbckExibeColExpandidas: TDBCheckBox;
    gpbTitulos: TGroupBox;
    dbeTituloSaldoAnt: TDBEdit;
    dbeTituloSaldoTransp: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbckExibeDesemb: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure VerificaContabilidade;
    procedure FazerQryCCusto;
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure dbccContaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeAssinEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TreeAssinEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure FazQrySubC;
    procedure dbcbTrocaClick(Sender: TObject);
  private
    LstParamRel: TStringList;
    ParamRel: Array [0..19] of TParamRel;
    procedure MontaArvoreParamRelats;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamFinanc: TfrmParamFinanc;

implementation

{$R *.DFM}
uses uMensErro,uDataBase, DBaseDados,{UModulo,} uSistema,{uFuncaoGeral,} UIntegraBack,
     DRelatoriosCFinan;

procedure TfrmParamFinanc.FormCreate(Sender: TObject);
Var
  X, TotAss: Integer;
begin
  inherited;
  LstParamRel := TStringList.Create;
  QryParamRel.Close;
  QryParamRel.Prepare;
  QryParamRel.ParambyName('PIDMODULO').AsInteger := Sistema.IdModulo;
  QryParamRel.ParambyName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  QryParamRel.Open;

  qryTipoDocumento.Open;

  If QryParamRel.IsEmpty Then
  Begin
     TotAss := NUMASS_FIN-1;
     ParamRel[0].IDPARAMRELATS := LeUltRegistro(nil,'PARAMRELATS');
     ParamRel[0].IDMODULO:= Sistema.IdModulo;
     ParamRel[0].IDPESSOA:= Sistema.IdEmpresa;
     ParamRel[0].NOMERALATORIO:= 'Transferência de Fundos';
     ParamRel[0].NOMECOMPO:= 'rpEmisTransfLabel8';
     ParamRel[0].DESCRICAO:= 'Assinatura 1';

     ParamRel[1].IDPARAMRELATS := LeUltRegistro(nil,'PARAMRELATS');
     ParamRel[1].IDMODULO:= Sistema.IdModulo;
     ParamRel[1].IDPESSOA:= Sistema.IdEmpresa;
     ParamRel[1].NOMERALATORIO:= 'Transferência de Fundos';
     ParamRel[1].NOMECOMPO:= 'rpEmisTransfLabel9';
     ParamRel[1].DESCRICAO:= 'Assinatura 2';

     ParamRel[2].IDPARAMRELATS := LeUltRegistro(nil,'PARAMRELATS');
     ParamRel[2].IDMODULO:= Sistema.IdModulo;
     ParamRel[2].IDPESSOA:= Sistema.IdEmpresa;
     ParamRel[2].NOMERALATORIO:= 'Transferência de Fundos';
     ParamRel[2].NOMECOMPO:= 'rpEmisTransfLabel10';
     ParamRel[2].DESCRICAO:= 'Assinatura 3';

     ParamRel[3].IDPARAMRELATS := LeUltRegistro(nil,'PARAMRELATS');
     ParamRel[3].IDMODULO:= Sistema.IdModulo;
     ParamRel[3].IDPESSOA:= Sistema.IdEmpresa;
     ParamRel[3].NOMERALATORIO:= 'Transferência de Fundos';
     ParamRel[3].NOMECOMPO:= 'rpEmisTransfLabel11';
     ParamRel[3].DESCRICAO:= 'Assinatura 4';

     ParamRel[4].IDPARAMRELATS := LeUltRegistro(nil,'PARAMRELATS');
     ParamRel[4].IDMODULO:= Sistema.IdModulo;
     ParamRel[4].IDPESSOA:= Sistema.IdEmpresa;
     ParamRel[4].NOMERALATORIO:= 'Transferência de Fundos';
     ParamRel[4].NOMECOMPO:= 'rpEmisTransfLabel12';
     ParamRel[4].DESCRICAO:= 'Assinatura 5';

     ParamRel[5].IDPARAMRELATS := LeUltRegistro(nil,'PARAMRELATS');
     ParamRel[5].IDMODULO:= Sistema.IdModulo;
     ParamRel[5].IDPESSOA:= Sistema.IdEmpresa;
     ParamRel[5].NOMERALATORIO:= 'Transferência de Fundos';
     ParamRel[5].NOMECOMPO:= 'rpEmisTransfLabel13';
     ParamRel[5].DESCRICAO:= 'Assinatura 6';
     
     For X:=0 To TotAss Do
     Begin
       QryParamRel.Append;
       QryParamRelIDPARAMRELATS.AsFloat  := ParamRel[X].IDPARAMRELATS;
       QryParamRelIDMODULO.AsFloat       := ParamRel[X].IDMODULO;
       QryParamRelIDPESSOA.AsFloat       := ParamRel[X].IDPESSOA;
       QryParamRelNOMECOMPO.AsString     := ParamRel[X].NOMECOMPO;
       QryParamRelDESCRICAO.AsString     := ParamRel[X].DESCRICAO;
       QryParamRelVALOR.AsString         := '';
       QryParamRelNOMERELATORIO.AsString := ParamRel[X].NOMERALATORIO;
       QryParamRel.Post;
     End;
     Aplicaalteracoes([QryParamRel]);
  End;
  MontaArvoreParamRelats;
end;

procedure TfrmParamFinanc.FormActivate(Sender: TObject);
begin
  inherited;
  pnlFundo.Enabled     :=True;
  sbtnApagar.Enabled   :=False;
  sbtnProcurar.Enabled :=False;
  sbtnInserir.Enabled  :=False;
  tbsGeral.Enabled     :=False;
  tbsNaoIdent.Enabled  :=False;
  tbsRelatorios.Enabled:=False;
  //
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Text:='SELECT * '+
{  qry.SQL.text := 'SELECT  IDPESSOA, CODJUROS, CODCORMONET, CODVARCAMBIAL, ' +
                  'INTEGRACONTAB, FLGORCADOPREVISTO, SUBCONTANAOIDENT, ' +
                  'IDEMPRESA, CCUSTOLANCNAOID, PLANO, CONTALANCNAOIDENT, ' +
                  'FLGSEPARADATA, TRDFINALCAP, TRDFINALCAR, FLGCONFIRMARECPAG, ' +
                  'TIPOAPLICACAO, FLGCALCIMPOSTO, FLGATUALFLX '+}
                  'FROM PARAMFINANC WHERE IDPESSOA = '+ IntToStr(Sistema.IdEmpresa);
  qry.Open;

  //
  if qry.FieldByName('INTEGRACONTAB').AsString = 'S' then
     sbtnSim.Down   := True
  else
     sbtnNao.Down   := True;
  //
  qryTipoAplic.Close;
  qryTipoAplic.Open;
  //
  qryAlterador.Close;
  qryAlterador.SQL.Clear;
  qryAlterador.SQL.text := 'SELECT CODALTERADOR,DESCRICAO FROM TIPOALTERADOR WHERE  IDPESSOA = '+ IntToStr(Sistema.IdEmpresa)+' AND RECPAG = ''P'' AND ACRESDECRES = ''C'' AND CONVERTE = ''S''';
  qryAlterador.Open;
  //
  qryAlterador1.Close;
  qryAlterador1.SQL.Clear;
  qryAlterador1.SQL.text := 'SELECT CODALTERADOR,DESCRICAO FROM TIPOALTERADOR WHERE  IDPESSOA = '+ IntToStr(Sistema.IdEmpresa)+' AND RECPAG = ''P'' AND ACRESDECRES = ''C'' AND CONVERTE = ''N''';
  qryAlterador1.Open;
  //
  VerificaContabilidade;
  //
  pcnParametros.ActivePageIndex:=0;
end;

procedure TfrmParamFinanc.CmeCadastroEdit(Sender: TObject);
begin
  tbsGeral.Enabled     :=True;
  tbsNaoIdent.Enabled  :=True;
  tbsRelatorios.Enabled:=True;
  pnlFundo.Enabled     :=True;
  //
  if (qry.IsEmpty) then
  Begin
     ds.DataSet.Insert;
     qry.FieldByName('INTEGRACONTAB').AsString     := 'N';
     qry.FieldByName('FLGORCADOPREVISTO').AsString := 'N';
     qry.FieldByName('FLGSEPARADATA').AsString     := 'N';
     qry.FieldByName('IDPESSOA').AsInteger         := Sistema.IdEmpresa;
     sbtnNao.Down   := True;
  end;
  inherited;
  if qry.FieldByName('FLGCALCIMPOSTO').isNull Then
     qry.FieldByName('FLGCALCIMPOSTO').AsString := 'N';
  if qry.FieldByName('FLGCONFIRMARECPAG').isNull Then
     qry.FieldByName('FLGCONFIRMARECPAG').AsString := 'N';
  if qry.FieldByName('FLGSEPARADATA').isNull Then
     qry.FieldByName('FLGSEPARADATA').AsString := 'N';
  if qry.FieldByName('FLGSEPARADATA').AsString = 'N' then begin
     dbedFinalCAR.Enabled:=False;
     dbedFinalCAP.Enabled:=False;
  end else begin
     dbedFinalCAR.Enabled:=True;
     dbedFinalCAP.Enabled:=True;
  end;
  if qry.FieldByName('INTEGRACONTAB').AsString = 'S' then
     sbtnSim.Down   := True
  else
     sbtnNao.Down   := True;
   //pcnParametros.ActivePage:=tbsGeral;
   //grpIntegracao.SetFocus;
end;

procedure TfrmParamFinanc.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  Aplicaalteracoes([QryParamRel]);
  IntegraBack.BuscaParamIntegra('PARAMFINANC','INTEGRACONTAB',' ');
  If FazQuery(DtmBaseDados.Qry,'SELECT NOMECOMPO,VALOR FROM PARAMRELATS WHERE (IDMODULO = '+ IntToStr(Sistema.IdModulo)  + ') AND '+
                               '(IDPESSOA = '+ IntToStr(Sistema.idEmpresa) + ')' ) then
   begin
      While Not DtmBaseDados.Qry.Eof Do
      Begin
         Try
           (dtmRelatoriosCFinan.FindComponent(DtmBaseDados.Qry.FieldByName('NOMECOMPO').AsString) As TppLabel).Caption := DtmBaseDados.Qry.FieldByName('VALOR').AsString;
         Finally
           DtmBaseDados.Qry.Next;
         End;
      End;
  End;
end;

procedure TfrmParamFinanc.sbtnSimClick(Sender: TObject);
begin
  inherited;
  sbtnSim.Down := True;
  qry.FieldByName('INTEGRACONTAB').AsString := 'S';
  IntegraBack.BuscaParamIntegra('PARAMFINANC','INTEGRACONTAB',' ');
  VerificaContabilidade;
end;

procedure TfrmParamFinanc.sbtnNaoClick(Sender: TObject);
begin
  inherited;
  sbtnNao.Down := True;
  qry.FieldByName('INTEGRACONTAB').AsString := 'N';
  IntegraBack.BuscaParamIntegra('PARAMFINANC','INTEGRACONTAB',' ');
  VerificaContabilidade;
end;

procedure TfrmParamFinanc.bbtnConfirmarClick(Sender: TObject);
begin
   if Integraback.Contabilidade = 'S' then
    begin
       pcnParametros.ActivePage := tbsNaoIdent;
       if trim(dbccConta.Conta.Numero) = '' then
       begin
          MsgDlg('Obrigatório preencher a Conta Contábil','Erro',mtError,[mbOk],0);
          dbccConta.SetFocus;
          exit;
       end;

       If dbccConta.Valida <> VcOk then
        begin
           dbccConta.SetFocus;
           exit;
        end
       else
        begin
           qry.FieldByName('PLANO').AsInteger := IntegraBack.Plano;
           if (dbccConta.Conta.ObrigaCentrodeCusto) and (trim(dblcCCusto.Text) = '') then
            begin
               MsgDlg('Obrigatório preencher o Centro de Custo para esta Conta Contábil','Erro',mtError,[mbOk],0);
               qry.FieldByName('IDEMPRESA').Value       := Sistema.IdEmpresa;
               dblcCCusto.Enabled := True;
               FazerQryCCusto;
               dblcCCusto.SetFocus;
            end
           else
            begin
               dblcCCusto.Enabled := False;
               qry.FieldByName('CCUSTOLANCNAOID').Value := Null;
               qry.FieldByName('IDEMPRESA').Value       := Null;
            end;
        end;
       pcnParametros.ActivePage := tbsGeral;
    end;
    
   inherited;
   tbsGeral.Enabled     :=False;
   tbsNaoIdent.Enabled  :=False;
   tbsRelatorios.Enabled:=False;
   pnlFundo.Enabled     :=True;
end;

procedure TfrmParamFinanc.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  tbsGeral.Enabled     :=False;
  tbsNaoIdent.Enabled  :=False;
  tbsRelatorios.Enabled:=False;
  pnlFundo.Enabled     :=True;
  If QryParamRel.UpdatesPending Then
  Begin
    QryParamRel.CancelUpdates;
    MontaArvoreParamRelats;
  End;
end;

procedure TfrmParamFinanc.VerificaContabilidade;
begin
  if IntegraBack.Contabilidade = 'S' then
  Begin
     dbccConta.Plano     := IntegraBack.Plano;
     dbccConta.Mascara   := IntegraBack.MascaraPlano;
     tbsNaoIdent.Enabled := True;
  end
  else
     tbsNaoIdent.Enabled := False;
end;

procedure TfrmParamFinanc.FazerQryCCusto;
begin
  qryCCusto.Close;
  qryCCusto.SQL.Clear;
  qryCCusto.SQL.text:= 'SELECT C.CODCENTROCUSTO,C.NOME FROM CENTCUST C, CONTASxCC CC  '+
                       'WHERE (CC.PLANO = '+ InttoStr(IntegraBack.Plano)+') AND '+
                       '      (CC.PLACONTA = '''+trim(dbccConta.Conta.Numero)+ ''') AND '+
                       '      (CC.IDEMPRESA = '+IntToStr(Sistema.idEmpresa)+ ') AND '+
                       '      (C.CODCENTROCUSTO = CC.CODCENTROCUSTO) AND '+
                       '      (C.IDEMPRESA      = CC.IDEMPRESA)';
  qryCCusto.Open;
end;

procedure TfrmParamFinanc.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnInserir.Enabled  :=False;
  sbtnAlterar.Enabled  :=True;
  sbtnApagar.Enabled   :=False;
  sbtnProcurar.Enabled :=False;
  if qry.State in [dsInsert,dsEdit] then
     tbsFluxoCaixa.Enabled:=True
  else
     tbsFluxoCaixa.Enabled:=False;
end;

procedure TfrmParamFinanc.dbccContaExit(Sender: TObject);
begin
  inherited;
  If dbccConta.Valida <> VcOk then begin
     dbccConta.SetFocus;
     exit;
  end else begin
     qry.FieldByName('PLANO').AsInteger := IntegraBack.Plano;
     if dbccConta.Conta.ObrigaCentrodeCusto then begin
        qry.FieldByName('IDEMPRESA').Value := Sistema.IdEmpresa;
        dblcCCusto.Enabled := True;
        FazerQryCCusto;
        dblcCCusto.SetFocus;
     end else begin
        dblcCCusto.Enabled := False;
        qry.FieldByName('CCUSTOLANCNAOID').Clear;
        qry.FieldByName('IDEMPRESA').Clear;
     end;
     if dbccConta.Conta.ObrigaSubConta then begin
        FazQrySubC;
        dblcSubConta.Enabled := True;
     end else begin
        dblcSubConta.Enabled := False;
        qry.FieldByName('SUBCONTANAOIDENT').Clear;
     end;
  end;
end;


procedure TfrmParamFinanc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryParamRel.Close;
  QryParamRel.UnPrepare;
  LstParamRel.Free;
end;

procedure TfrmParamFinanc.MontaArvoreParamRelats;
Var
  sOldNome : string;
  TreeNome, TreeDescricao, TreeFilho: TTreeNode;
Begin
     QryParamRel.First;
     sOldNome := '';
     TreeNome := nil;

     TreeAssin.Items.Clear;
     LstParamRel.Clear;

     While Not QryParamRel.Eof Do
     Begin
       If SoldNome <> QryParamRel.FieldByName('NOMERELATORIO').AsString Then
       Begin
        TreeNome := TreeAssin.Items.Add(nil,QryParamRel.FieldByName('NOMERELATORIO').AsString);
        TreeNome.ImageIndex := 0;
        TreeNome.SelectedIndex := 0;
        LstParamRel.Add(QryParamRel.FieldByName('IDPARAMRELATS').AsString);
       End;

       TreeDescricao := TreeAssin.Items.AddChild(TreeNome,QryParamRel.FieldByName('DESCRICAO').AsString);
       LstParamRel.Add(QryParamRel.FieldByName('IDPARAMRELATS').AsString);
       TreeDescricao.ImageIndex := 1;
       TreeDescricao.SelectedIndex := 1;

       If Trim(QryParamRel.FieldByName('VALOR').AsString) = '' Then
          TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,'Clique Para Inserir\Alterar Assinatura')
       Else
          TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,QryParamRel.FieldByName('VALOR').AsString);

       LstParamRel.Add(QryParamRel.FieldByName('IDPARAMRELATS').AsString);
       TreeFilho.ImageIndex := 2;
       TreeFilho.SelectedIndex := 2;

       SOldNome := QryParamRel.FieldByName('NOMERELATORIO').AsString;
       QryParamRel.Next;
     End;
End;

procedure TfrmParamFinanc.TreeAssinEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
Var
  sAux: String;
begin
  inherited;
  sAux := LstParamRel[Node.AbsoluteIndex];
  QryParamRel.Locate('IDPARAMRELATS',sAux,[]);
  QryParamRel.Edit;
  QryParamRel.FieldByName('VALOR').AsString := S;
  QryParamRel.Post;
end;

procedure TfrmParamFinanc.TreeAssinEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := (Node.ImageIndex = 2);
end;

procedure TfrmParamFinanc.FazQrySubC;
begin
  qrySubConta.Close;
  qrySubConta.ParamByName('pPLACONTA').AsString  :=trim(dbccConta.Conta.Numero);
  qrySubConta.ParamByName('pPLANO').AsInteger    :=IntegraBack.Plano;
  qrySubConta.ParamByName('pIDPESSOA').AsInteger :=Sistema.IdEmpresa;
  qrySubConta.Open;
end;

procedure TfrmParamFinanc.dbcbTrocaClick(Sender: TObject);
begin
  inherited;
  if (qry.state in [dsedit,dsinsert]) then
   begin
      if dbcbTroca.Checked Then
       begin
          dbedFinalCAR.Enabled:=True;
          dbedFinalCAP.Enabled:=True;
       end
      else
       begin
          qry.FieldByName('TRDFINALCAR').Clear;
          qry.FieldByName('TRDFINALCAP').Clear;
          dbedFinalCAR.Enabled:=False;
          dbedFinalCAP.Enabled:=False;
       end;
   end;
end;

end.
