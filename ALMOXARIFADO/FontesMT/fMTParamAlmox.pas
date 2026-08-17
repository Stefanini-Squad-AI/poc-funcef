{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Adicionado campo DIAUTILMENSAL à tela somente para display
                                                    ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
-------------------------------------------------------------------------------------------------- }

// andre tavares - pendência 17580 - 16/05/2005
unit fMTParamAlmox;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
   CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
   MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
   ComCtrls, wwdblook, TREdit, DBCtrls, wwdbdatetimepicker,
   CMDateTimePicker, Mask, uCtrlAlmoxCompra, uCmTypes, CMDBLookupCombo,
   uCtrlPrograma, uCtrlPlanPrevContabPatro, uCtrlPatro, uCmSqlParams;

type
   TFrmMTParamAlmox = class(TFrmCadastroMT)
      PgcParam: TPageControl;
      TbsIntegra: TTabSheet;
      Label4: TLabel;
      Label5: TLabel;
      DBCheckBox1: TDBCheckBox;
      dbchbExisteCPag: TDBCheckBox;
      dbchbExisteContabilidade: TDBCheckBox;
      dbclTipoDocumento: TwwDBLookupCombo;
      dblcTipoAlterador: TwwDBLookupCombo;
      dbcbContabTransf: TDBCheckBox;
      chkLivro: TDBCheckBox;
      DBCheckBox2: TDBCheckBox;
      DBCheckBox3: TDBCheckBox;
      TbsRelat: TTabSheet;
      Pnldocpendentes: TPanel;
      TreeAssin: TTreeView;
      CdsParamRel: TCMClientDataSet;
      ImlReports: TImageList;
      cdsAlterador: TCMClientDataSet;
      cdsTipoDoc: TCMClientDataSet;
      cdsPlano: TCMClientDataSet;
      cdsPatro: TCMClientDataSet;
      TabPrev: TTabSheet;
      lblPlanoPrevC: TLabel;
      dblcPlanoPrevC: TwwDBLookupCombo;
      lblPatroC: TLabel;
      dblcPatroC: TwwDBLookupCombo;
    tabGeral: TTabSheet;
      Label6: TLabel;
      Label8: TLabel;
      Label7: TLabel;
      Label9: TLabel;
      grpGrupos: TGroupBox;
      Label1: TLabel;
      Panel2: TPanel;
      Label3: TLabel;
      Edit1: TEdit;
      Edit2: TEdit;
      dbedInput: TDBEdit;
      mskedDisplay: TMaskEdit;
      dbrgInfoValorUN: TDBRadioGroup;
      GrpDataImplata: TGroupBox;
      edDataImplanta: TCMDateTimePicker;
      grpProdutos: TGroupBox;
      chkbxDV: TDBCheckBox;
      chkContabGrupo: TDBCheckBox;
      edPercReqMat: TDBRealEdit;
      DBRealEdit1: TDBRealEdit;
      CdsPrograma: TCMClientDataSet;
      Label10: TLabel;
      dblcPrograma: TCMDBLookupCombo;
      DBCheckBox4: TDBCheckBox;
    CMSqlParams1: TCMSqlParams;
    Bevel1: TBevel;
    Bevel2: TBevel;
    edGaruGrp: TDBRealEdit;
    Label2: TLabel;
    Bevel3: TBevel;
    dbchkTestaGrau: TDBCheckBox;
    dbeDiaUtil: TDBEdit;
    lblDataLimite: TLabel;

      procedure FormCreate(Sender: TObject);
      procedure CmeCadastroInsert(Sender: TObject);
      procedure dbedInputEnter(Sender: TObject);
      procedure TreeAssinEdited(Sender: TObject; Node: TTreeNode; var S: String);
      procedure TreeAssinEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
      procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
      procedure CmeCadastroAbortConfirma(sender: TObject; OrigemAbortConfirma: TOrigemAbortConfirma);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure CmeCadastroAfterConfirma(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcPatroCCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);


   private  // Private declarations

      AlmoxCompra : TCtrlAlmoxCompra;
        PlanPrev    : TCtrlPlanPrevContabPatro;
      Patro       : TCtrlPatro;
      Programa    : TCtrlPrograma;

      procedure MontaArvoreParamRelats;
      procedure SetMascara;

   public   // Public declarations

   end;



var
  FrmMTParamAlmox: TFrmMTParamAlmox;



implementation
{$R *.DFM}
uses
   uSistema, DBaseDados, uModulo, uMensErro;




procedure TFrmMTParamAlmox.FormCreate(Sender: TObject);
begin
   inherited;
   AlmoxCompra := TCtrlAlmoxCompra.Create;
   AlmoxCompra.Initialize(DtmBaseDados.dbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          True
                         );

   AlmoxCompra.Cds         := Cds;
   AlmoxCompra.CdsParamRel := CdsParamRel;
   AlmoxCompra.PreparaAssinatura(Sistema.IdEmpresa,Sistema.IdModulo);

   Programa := TCtrlPrograma.Create;
   Programa.InitializeAs(AlmoxCompra);

   PlanPrev := TCtrlPlanPrevContabPatro.Create;

   PlanPrev.InitializeAs(AlmoxCompra);

   Patro    := TCtrlPatro.Create;
   Patro.InitializeAs(AlmoxCompra);

   CdsParamRel.Data := AlmoxCompra.ListAssinaturas(Sistema.IdEmpresa,Sistema.IdModulo);

   MontaArvoreParamRelats;

   Cds.Data          := AlmoxCompra.GetParalmox(Sistema.IdEmpresa);

   cdsAlterador.Data := AlmoxCompra.ListAlterardor(Sistema.IdEmpresa);
   cdsTipoDoc.Data   := AlmoxCompra.ListTipoDoc;

   cdsPatro.Data     := Patro.ListaPatroParaOrcamento(0, 0);
   cdsPlano.Data     := PlanPrev.ListaPlanoPatro;

   cdsPrograma.Data  := Programa.ListaPrograma;

   if Trim(dbedInput.Text) <> '' then SetMascara;

   // Tratamento da data de implantação
   GrpDataImplata.Enabled := Not AlmoxCompra.ExisteMovimentacao;

   
   lblDataLimite.Caption:= 'Data limite para requisição'#13#10  +
                           'de materiais (dia útil mensal)';
end;



procedure TFrmMTParamAlmox.MontaArvoreParamRelats;
Var
  sOldNome : string;
  TreeNome, TreeDescricao, TreeFilho: TTreeNode;
Begin
     CdsParamRel.First;
     sOldNome := '';
     TreeNome := nil;
     TreeAssin.Items.Clear;
     While Not CdsParamRel.Eof Do
     Begin
       If SoldNome <> CdsParamRel.FieldByName('NOMERELATORIO').AsString Then
       Begin
        TreeNome := TreeAssin.Items.Add(nil,CdsParamRel.FieldByName('NOMERELATORIO').AsString);
        TreeNome.ImageIndex := 0;
        TreeNome.SelectedIndex := 0;
       End;
       TreeDescricao := TreeAssin.Items.AddChild(TreeNome,CdsParamRel.FieldByName('DESCRICAO').AsString);
       TreeDescricao.ImageIndex := 1;
       TreeDescricao.SelectedIndex := 1;
       If Trim(CdsParamRel.FieldByName('VALOR').AsString) = '' Then
          TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,'Clique Para Inserir\Alterar Assinatura')
       Else
          TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,CdsParamRel.FieldByName('VALOR').AsString);
       TreeFilho.ImageIndex := 2;
       TreeFilho.SelectedIndex := 2;
       TreeFilho.StateIndex := CdsParamRel.FieldByName('IDPARAMRELATS').AsInteger;
       SOldNome := CdsParamRel.FieldByName('NOMERELATORIO').AsString;
       CdsParamRel.Next;
     End;

end;




procedure TFrmMTParamAlmox.CmeCadastroInsert(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := False;
  inherited;
  If Cds.IsEmpty Then
     Begin
        Cds.FieldByName('IDPESSOA').AsInteger         := Sistema.IdEmpresa;
        Cds.FieldByName('EXISTEDV').AsString          := 'F';
        Cds.FieldByName('RECEBAUTOMATICO').AsString   := 'F';
        Cds.FieldByName('EXISTECOMPRA').AsString      := 'F';
        Cds.FieldByName('EXISTECONTASPAGAR').AsString := 'N';
        Cds.FieldByName('EXISTECONTABIL').AsString    := 'N';
        Cds.FieldByName('FLGCONTABGRUPO').AsString    := 'S';
        Cds.FieldByName('FLGCONTABTRANSF').AsString   := 'N';
        Cds.FieldByName('FLGINTEGRALIVRO').AsString   := 'S';
        Cds.FieldByName('FLGUSAGRUPOREQ').AsString    := 'N';
        Cds.FieldByName('FLGREQSEMSALDO').AsString    := 'S';
     End
  Else
     Begin
        Cds.Cancel;

        Cds.Data := AlmoxCompra.GetParalmox(Sistema.IdEmpresa);

        Cds.Edit;
     End;

end;




procedure TFrmMTParamAlmox.dbedInputEnter(Sender: TObject);
begin
  inherited;
   if Trim(dbedInput.Text) <> '' then
     Begin
         SetMascara;
     End;
end;




procedure TFrmMTParamAlmox.TreeAssinEdited(Sender: TObject;
  Node: TTreeNode; var S: String);
begin
  inherited;
  CdsParamRel.Locate('IDPARAMRELATS',Node.StateIndex,[]);
  CdsParamRel.Edit;
  CdsParamRel.FieldByName('VALOR').AsString := S;
  CdsParamRel.Post;
end;




procedure TFrmMTParamAlmox.TreeAssinEditing(Sender: TObject;
  Node: TTreeNode; var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := (Node.ImageIndex = 2);
end;




procedure TFrmMTParamAlmox.SetMascara;
Var x : Integer;
begin
    mskedDisplay.EditMask := dbedInput.Text + ';0;_';
    mskedDisplay.Text := '';
    For x := 1 To Pred(Length(Trim(dbedInput.Text))) Do
       mskedDisplay.Text := mskedDisplay.Text + IntToStr(x);
end;



procedure TFrmMTParamAlmox.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AlmoxCompra.GravaParalmox;
end;




procedure TFrmMTParamAlmox.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := AlmoxCompra.GravaParalmox;
end;




procedure TFrmMTParamAlmox.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( AlmoxCompra.MessageInfo,'Erro',mtError,[mbOk],0);
end;




procedure TFrmMTParamAlmox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  AlmoxCompra.Free;
end;




procedure TFrmMTParamAlmox.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Cds.Data := AlmoxCompra.GetParalmox(Sistema.IdEmpresa);
end;




procedure TFrmMTParamAlmox.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  Modulo.AtualizarParametros(Sistema.IdEmpresa, Sistema.IdUsuario);
  Modulo.AtualizarParamIntegracao(Sistema.IdEmpresa);
end;




procedure TFrmMTParamAlmox.FormShow(Sender: TObject);
begin
   inherited;
   PgcParam.ActivePageIndex := 0; 
end;



procedure TFrmMTParamAlmox.dblcPatroCCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cdsPlano.Data := PlanPrev.ListaPlanoPatro(-1, strToIntDef(dblcPatroC.lookupValue, -1), -1);
end;

end.
