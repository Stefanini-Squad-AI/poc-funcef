unit FParamFinancMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, DBCtrls, ComCtrls, CMProcuraMask, wwdbdatetimepicker,
  CMDateTimePicker, CMDBLookupCombo, Mask, wwdbedit, StdCtrls, wwdblook,
  Buttons, MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro,
  ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr,
  TB97Ctls, TB97, ExtCtrls, uCtrlParamFinanc, uCtrlParamRelats, uCtrlListTercFinanc,
  ppCtrls,uCtrlTiposAplic, uCtrlParamIntegra,
  {$IFDEF VERSAO0505} uComum {$ELSE} uCMTypes {$ENDIF};

const
   NUMASS_FIN = 6;


type
  TParamRel = record
                 IDPARAMRELATS: Integer;
                 IDMODULO     : Integer;
                 IDPESSOA     : Integer;
                 NOMECOMPO    : String;
                 DESCRICAO    : String;
                 VALOR        : String;
                 NOMERALATORIO: String;
              end;

  TFrmParamFinancMT = class(TFrmCadastroMT)
    pgcParametros: TPageControl;
    tbsGeral: TTabSheet;
    tbsGeral2: TTabSheet;
    tbsNaoIdent: TTabSheet;
    tbsRelatorios: TTabSheet;
    tbsFluxoCaixa: TTabSheet;
    TabSheet1: TTabSheet;
    ImlReports: TImageList;
    cdsParamRelat: TCMClientDataSet;
    cdsAlteradorJuros: TCMClientDataSet;
    cdsAlteradorCMonetaria: TCMClientDataSet;
    cdsAlteradorVCambial: TCMClientDataSet;
    cdsTipoAplicacao: TCMClientDataSet;
    cdsTipoDoc: TCMClientDataSet;
    cdsCentroCusto: TCMClientDataSet;
    cdsSubConta: TCMClientDataSet;
    pnlGeral1: TPanel;
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
    pnlGeral2: TPanel;
    lblTipoAplic: TLabel;
    Label4: TLabel;
    gbTrocaTipo: TGroupBox;
    lblTroca: TLabel;
    lblFinalCAR: TLabel;
    lblFinalCAP: TLabel;
    dbcbTroca: TDBCheckBox;
    dbedFinalCAR: TwwDBEdit;
    dbedFinalCAP: TwwDBEdit;
    dbcbConfirmaRP: TDBCheckBox;
    dblcTipoAplic: TCMDBLookupCombo;
    dbckCalcImposto: TDBCheckBox;
    edDataBloqDisp: TCMDateTimePicker;
    dbckImprimeCheque: TDBCheckBox;
    pnlLancNIDent: TPanel;
    gbIntContab: TGroupBox;
    lblCentroCusto: TLabel;
    lblSubConta: TLabel;
    dblcCCusto: TwwDBLookupCombo;
    dbccConta: TCMProcuraMaskContabil;
    dblcSubConta: TwwDBLookupCombo;
    pnlParamRelat: TPanel;
    Pnldocpendentes: TPanel;
    TreeAssin: TTreeView;
    pnlFluxoCaixa: TPanel;
    gpbDiasBloqueioFluxo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedNumDiasBloqueioCurto: TDBEdit;
    dbedNumDiasBloqueioMedio: TDBEdit;
    dbedNumDiasBloqueioLongo: TDBEdit;
    dbckbAtualizaFlx: TDBCheckBox;
    dbckExibeColExpandidas: TDBCheckBox;
    gpbTitulos: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dbeTituloSaldoAnt: TDBEdit;
    dbeTituloSaldoTransp: TDBEdit;
    dbckExibeDesemb: TDBCheckBox;
    pnlInvest: TPanel;
    GroupBox1: TGroupBox;
    dblcTipoDocurmento: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure sbtnSimClick(Sender: TObject);
    procedure sbtnNaoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbcbTrocaClick(Sender: TObject);
    procedure TreeAssinEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TreeAssinEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure dbccContaExit(Sender: TObject);
  private
    { Private declarations }
    CtrlParamFinanc: TCtrlParamFinanc;
    CtrlParamRelats: TCtrlParamRelats;
    CtrlTipoAplic : TCtrlTiposAplic;
    CtrlListTerceiros : TCtrlListTercFinanc;
    LstParamRel: TStringList;
    ParamRel: Array [0..19] of TParamRel;
    procedure MontaArvoreParamRelats;
    procedure VerificaContabilidade;
    procedure AtualizaRelatorios;
    function CriaNovoRegistroParametros: Boolean;
  public
    { Public declarations }
  end;

var
  FrmParamFinancMT: TFrmParamFinancMT;

implementation

{$R *.DFM}

uses uSistema, dBaseDados, uMensErro;//, DRelatoriosCFinan;

procedure TFrmParamFinancMT.FormCreate(Sender: TObject);
var
   X, TotAss: Integer;
begin
   inherited;
   LstParamRel := TStringList.Create;

   //Inicializa CtrlListTerceiros
   CtrlListTerceiros:=TCtrlListTercFinanc.Create;
   CtrlListTerceiros.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds de Alteradores: Juros
   cdsAlteradorJuros.Data:=CtrlListTerceiros.ListAlteradores(Sistema.IdEmpresa,'P','C','S');

   //Carrega cds de Alteradores: Correção Monetária
   cdsAlteradorCMonetaria.Data:=CtrlListTerceiros.ListAlteradores(Sistema.IdEmpresa,'P','C','N');

   //Carrega cds de Alteradores: Variação Cambial
   cdsAlteradorVCambial.Data:=CtrlListTerceiros.ListAlteradores(Sistema.IdEmpresa,'P','C','N');

   //Inicializa CtrlParamFinanc
   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.Initialize(dtmBaseDados.dbBaseDados,True);

   cds.Data:=CtrlParamFinanc.ListParamFinanc(Sistema.IdEmpresa);
   CtrlParamFinanc.CdsParamFinanc:=cds;

   VerificaContabilidade;

   //Cria um Novo Registro de Parâmetros caso ainda não exista para a empresa corrente
   if cds.IsEmpty then CriaNovoRegistroParametros;

   //Habilita/Desabilita Controles da Tela conforme conteúdo dos campos:
   // "FLGSEPARADATA" e "INTEGRACONTAB"
   if cds.FieldByName('FLGSEPARADATA').AsString = 'N' then
    begin
       dbedFinalCAR.Enabled:=False;
       dbedFinalCAP.Enabled:=False;
    end
   else
    begin
       dbedFinalCAR.Enabled:=True;
       dbedFinalCAP.Enabled:=True;
    end;

   sbtnSim.Down:=(cds.FieldByName('INTEGRACONTAB').AsString = 'S');
   sbtnNao.Down:=not(cds.FieldByName('INTEGRACONTAB').AsString = 'S');


   //Carrega cds de Centro de Custo
   cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,
                                                                ParamIntegra.Plano,
                                                                cds.FieldByName('Contalancnaoident').AsString);

   //Carrega cds de SubConta
   cdsSubConta.Data:=CtrlListTerceiros.ListSubConta(Sistema.IdEmpresa,
                                                    ParamIntegra.Plano,
                                                    cds.FieldByName('Contalancnaoident').AsString);

   //Carrega cds de Tipos de Documento
   cdsTipoDoc.Data:=CtrlListTerceiros.ListTipoDoc('');

   //Inicializa CtrlParamRelats
   CtrlParamRelats:=TCtrlParamRelats.Create;
   CtrlParamRelats.Initialize(dtmBaseDados.dbBaseDados,True);

   CtrlParamRelats.CdsParamRelats:=cdsParamRelat;

   //Inicializa CtrlListTipoAplic
   CtrlTipoAplic:=TCtrlTiposAplic.Create;
   CtrlTipoAplic.Initialize(dtmBaseDados.dbBaseDados,True);

   //Carrega cds de Tipo de Aplicação
   cdsTipoAplicacao.Data:=CtrlTipoAplic.ListTipoAplicacao(Sistema.IdEmpresa,0);

   //Carrega cds Param Relat
   cdsParamRelat.Data:=CtrlParamRelats.ListParamRelats(Sistema.IdEmpresa,Sistema.IdModulo);

   //Cria Registros no cds Param Relat caso não exista nenhum cadastrado 
   if (cdsParamRelat.IsEmpty) then
    begin
       TotAss := NUMASS_FIN-1;
       ParamRel[0].IDPARAMRELATS := 0;
       ParamRel[0].IDMODULO:= Sistema.IdModulo;
       ParamRel[0].IDPESSOA:= Sistema.IdEmpresa;
       ParamRel[0].NOMERALATORIO:= 'Transferência de Fundos';
       ParamRel[0].NOMECOMPO:= 'rpEmisTransfLabel8';
       ParamRel[0].DESCRICAO:= 'Assinatura 1';

       ParamRel[1].IDPARAMRELATS := 0;
       ParamRel[1].IDMODULO:= Sistema.IdModulo;
       ParamRel[1].IDPESSOA:= Sistema.IdEmpresa;
       ParamRel[1].NOMERALATORIO:= 'Transferência de Fundos';
       ParamRel[1].NOMECOMPO:= 'rpEmisTransfLabel9';
       ParamRel[1].DESCRICAO:= 'Assinatura 2';

       ParamRel[2].IDPARAMRELATS := 0;
       ParamRel[2].IDMODULO:= Sistema.IdModulo;
       ParamRel[2].IDPESSOA:= Sistema.IdEmpresa;
       ParamRel[2].NOMERALATORIO:= 'Transferência de Fundos';
       ParamRel[2].NOMECOMPO:= 'rpEmisTransfLabel10';
       ParamRel[2].DESCRICAO:= 'Assinatura 3';

       ParamRel[3].IDPARAMRELATS := 0;
       ParamRel[3].IDMODULO:= Sistema.IdModulo;
       ParamRel[3].IDPESSOA:= Sistema.IdEmpresa;
       ParamRel[3].NOMERALATORIO:= 'Transferência de Fundos';
       ParamRel[3].NOMECOMPO:= 'rpEmisTransfLabel11';
       ParamRel[3].DESCRICAO:= 'Assinatura 4';

       ParamRel[4].IDPARAMRELATS := 0;
       ParamRel[4].IDMODULO:= Sistema.IdModulo;
       ParamRel[4].IDPESSOA:= Sistema.IdEmpresa;
       ParamRel[4].NOMERALATORIO:= 'Transferência de Fundos';
       ParamRel[4].NOMECOMPO:= 'rpEmisTransfLabel12';
       ParamRel[4].DESCRICAO:= 'Assinatura 5';

       ParamRel[5].IDPARAMRELATS := 0;
       ParamRel[5].IDMODULO:= Sistema.IdModulo;
       ParamRel[5].IDPESSOA:= Sistema.IdEmpresa;
       ParamRel[5].NOMERALATORIO:= 'Transferência de Fundos';
       ParamRel[5].NOMECOMPO:= 'rpEmisTransfLabel13';
       ParamRel[5].DESCRICAO:= 'Assinatura 6';

       for X:=0 to TotAss do
       begin
          cdsParamRelat.Append;
          cdsParamRelat.FieldByName('IDPARAMRELATS').AsFloat  := ParamRel[X].IDPARAMRELATS;
          cdsParamRelat.FieldByName('IDMODULO').AsFloat       := ParamRel[X].IDMODULO;
          cdsParamRelat.FieldByName('IDPESSOA').AsFloat       := ParamRel[X].IDPESSOA;
          cdsParamRelat.FieldByName('NOMECOMPO').AsString     := ParamRel[X].NOMECOMPO;
          cdsParamRelat.FieldByName('DESCRICAO').AsString     := ParamRel[X].DESCRICAO;
          cdsParamRelat.FieldByName('VALOR').AsString         := '';
          cdsParamRelat.FieldByName('NOMERELATORIO').AsString := ParamRel[X].NOMERALATORIO;
          cdsParamRelat.Post;
       end;

       //CtrlParamRelats.AplicaDados;
    end;

   MontaArvoreParamRelats;

   pgcParametros.ActivePageIndex:=0;
end;

procedure TFrmParamFinancMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   CtrlParamFinanc.Free;
   CtrlParamRelats.Free;
   CtrlTipoAplic.Free;
   CtrlListTerceiros.Free;
   LstParamRel.Free;
   inherited;
end;

procedure TFrmParamFinancMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
   inherited;
   sbtnAlterar.Enabled:=True;
   pnlFundo.Enabled:=True;
   pnlGeral1.Enabled:=sbtnAlterar.Down;
   pnlGeral2.Enabled:=sbtnAlterar.Down;
   pnlLancNIDent.Enabled:=sbtnAlterar.Down;
   pnlParamRelat.Enabled:=sbtnAlterar.Down;
   pnlFluxoCaixa.Enabled:=sbtnAlterar.Down;
   pnlInvest.Enabled:=sbtnAlterar.Down;
end;

procedure TFrmParamFinancMT.dbccContaExit(Sender: TObject);
begin
   inherited;

   if dbccConta.Valida <> VcOk then
    begin
       dbccConta.SetFocus;
       Exit;
    end
   else
    begin
       cds.FieldByName('PLANO').AsFloat:=ParamIntegra.Plano;
       if dbccConta.Conta.ObrigaCentrodeCusto then
        begin
           cds.FieldByName('IDEMPRESA').Value := Sistema.IdEmpresa;
           dblcCCusto.Enabled := True;

          //Carrega cds de Centro de Custo
          cdsCentroCusto.Close;
          cdsCentroCusto.Data:=CtrlListTerceiros.ListCentroCustoxConta(Sistema.IdEmpresa,
                                                                       ParamIntegra.Plano,
                                                                       Trim(dbccConta.Conta.Numero));
          dblcCCusto.SetFocus;
        end
       else
        begin
           dblcCCusto.Enabled := False;
           cds.FieldByName('CCUSTOLANCNAOID').Clear;
           cds.FieldByName('IDEMPRESA').Clear;
        end;

       if dbccConta.Conta.ObrigaSubConta then
        begin
           //Carrega cds de SubConta
           cdsSubConta.Close;
           cdsSubConta.Data:=CtrlListTerceiros.ListSubConta(Sistema.IdEmpresa,
                                                            ParamIntegra.Plano,
                                                            Trim(dbccConta.Conta.Numero));
           dblcSubConta.Enabled := True;
        end
       else
        begin
           dblcSubConta.Enabled := False;
           cds.FieldByName('SUBCONTANAOIDENT').Clear;
        end;
    end;
end;

procedure TFrmParamFinancMT.dbcbTrocaClick(Sender: TObject);
begin
   if not(cds.State in [dsInsert,dsEdit]) then Exit;

   if dbcbTroca.Checked Then
    begin
       dbedFinalCAR.Enabled:=True;
       dbedFinalCAP.Enabled:=True;
    end
   else
    begin
       cds.FieldByName('TRDFINALCAR').Clear;
       cds.FieldByName('TRDFINALCAP').Clear;
       dbedFinalCAR.Enabled:=False;
       dbedFinalCAP.Enabled:=False;
    end;
end;

procedure TFrmParamFinancMT.sbtnSimClick(Sender: TObject);
begin
   inherited;
   sbtnSim.Down := True;
   cds.FieldByName('INTEGRACONTAB').AsString := 'S';
   VerificaContabilidade;
end;

procedure TFrmParamFinancMT.sbtnNaoClick(Sender: TObject);
begin
   inherited;
   sbtnNao.Down := True;
   cds.FieldByName('INTEGRACONTAB').AsString := 'N';
   VerificaContabilidade;
end;

procedure TFrmParamFinancMT.TreeAssinEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
var
  sAux: String;
begin
  inherited;
  sAux := LstParamRel[Node.AbsoluteIndex];
  cdsParamRelat.Locate('IDPARAMRELATS',sAux,[]);
  cdsParamRelat.Edit;
  cdsParamRelat.FieldByName('VALOR').AsString := S;
  cdsParamRelat.Post;
end;

procedure TFrmParamFinancMT.TreeAssinEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
   inherited;
   AllowEdit := (Node.ImageIndex = 2);
end;

procedure TFrmParamFinancMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
   if ParamIntegra.IntegraContab then
    begin
       if Trim(dbccConta.Conta.Numero) = '' then
        begin
           MsgDlg('Obrigatório preencher a Conta Contábil','Erro',mtError,[mbOk],0);
           dbccConta.SetFocus;
           Abort;
        end;

       if dbccConta.Valida <> VcOk then
        begin
           pgcParametros.ActivePage:=tbsNaoIdent;
           dbccConta.SetFocus;
           Abort;
        end
       else
        begin
           cds.FieldByName('PLANO').AsFloat:=ParamIntegra.Plano;
           if (dbccConta.Conta.ObrigaCentrodeCusto) and (Trim(dblcCCusto.Text) = '') then
            begin
               MsgDlg('Obrigatório preencher o Centro de Custo para esta Conta Contábil','Erro',mtError,[mbOk],0);
               cds.FieldByName('IDEMPRESA').Value       := Sistema.IdEmpresa;
               dblcCCusto.Enabled := True;
               pgcParametros.ActivePage:=tbsNaoIdent;
               dblcCCusto.SetFocus;
               Abort;
            end
           else
            begin
               dblcCCusto.Enabled := False;
               cds.FieldByName('CCUSTOLANCNAOID').Clear;
               cds.FieldByName('IDEMPRESA').Clear;
            end;
        end;
    end;
   inherited;
end;

procedure TFrmParamFinancMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
   inherited;
   AtualizaRelatorios;
end;

procedure TFrmParamFinancMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlParamFinanc.AplicaAtualParamFinanc;
   if Accept then CtrlParamRelats.AplicaDados;
end;

procedure TFrmParamFinancMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
   inherited;
   Accept:=CtrlParamFinanc.AplicaAtualParamFinanc;
   if Accept then CtrlParamRelats.AplicaDados;
end;

procedure TFrmParamFinancMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
   inherited;
   MsgDlg(CtrlParamFinanc.MessageInfo,'Erro',mtError,[mbOK],0);
end;

//==============================================================================

procedure TFrmParamFinancMT.MontaArvoreParamRelats;
var
  sOldNome : string;
  TreeNome, TreeDescricao, TreeFilho: TTreeNode;
begin
   cdsParamRelat.First;
   sOldNome := '';
   TreeNome := nil;

   TreeAssin.Items.Clear;
   LstParamRel.Clear;

   while not(cdsParamRelat.Eof) do
   begin
      if (SoldNome <> cdsParamRelat.FieldByName('NOMERELATORIO').AsString) Then
       begin
          TreeNome := TreeAssin.Items.Add(nil,cdsParamRelat.FieldByName('NOMERELATORIO').AsString);
          TreeNome.ImageIndex := 0;
          TreeNome.SelectedIndex := 0;
          LstParamRel.Add(cdsParamRelat.FieldByName('IDPARAMRELATS').AsString);
       end;

      TreeDescricao := TreeAssin.Items.AddChild(TreeNome,cdsParamRelat.FieldByName('DESCRICAO').AsString);
      LstParamRel.Add(cdsParamRelat.FieldByName('IDPARAMRELATS').AsString);
      TreeDescricao.ImageIndex := 1;
      TreeDescricao.SelectedIndex := 1;

      if Trim(cdsParamRelat.FieldByName('VALOR').AsString) = '' then
         TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,'Clique Para Inserir\Alterar Assinatura')
      else
         TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,cdsParamRelat.FieldByName('VALOR').AsString);

      LstParamRel.Add(cdsParamRelat.FieldByName('IDPARAMRELATS').AsString);
      TreeFilho.ImageIndex := 2;
      TreeFilho.SelectedIndex := 2;

      SOldNome := cdsParamRelat.FieldByName('NOMERELATORIO').AsString;
      cdsParamRelat.Next;
   end;
end;

procedure TFrmParamFinancMT.VerificaContabilidade;
begin
   if ParamIntegra.IntegraContab then
    begin
       dbccConta.Plano:=ParamIntegra.Plano;
       dbccConta.Mascara:=ParamIntegra.MascaraPlano;
       tbsNaoIdent.Visible:=True;
    end
   else
    tbsNaoIdent.Visible:=False;
end;

function TFrmParamFinancMT.CriaNovoRegistroParametros: Boolean;
begin
   Result:=True;
   cds.Append;
   cds.FieldByName('IDPESSOA').AsFloat           := Sistema.IdEmpresa;
   cds.FieldByName('INTEGRACONTAB').AsString     := 'N';
   cds.FieldByName('FLGORCADOPREVISTO').AsString := 'N';
   cds.FieldByName('FLGSEPARADATA').AsString     := 'N';
   cds.FieldByName('FLGCALCIMPOSTO').AsString    := 'N';
   cds.FieldByName('FLGCONFIRMARECPAG').AsString := 'N';
   cds.FieldByName('FLGSEPARADATA').AsString     := 'N';
   sbtnNao.Down   := True;
   cds.Post;
   bbtnConfirmarClick(nil);
end;

procedure TFrmParamFinancMT.AtualizaRelatorios;
begin
   //Carrega cds Param Relat
   cdsParamRelat.Data:=CtrlParamRelats.ListParamRelats(Sistema.IdEmpresa,Sistema.IdModulo);

  {if not(cdsParamRelat.IsEmpty) then
   begin
      cdsParamRelat.First;
      while not(cdsParamRelat.Eof) do
      begin
         try
           (dtmRelatoriosCFinan.FindComponent(cdsParamRelat.FieldByName('NOMECOMPO').AsString) As TppLabel).Caption :=
                                cdsParamRelat.FieldByName('VALOR').AsString;
         finally
            cdsParamRelat.Next;
         end;
      end;
  end;}

end;

end.
