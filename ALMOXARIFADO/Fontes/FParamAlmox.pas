unit FParamAlmox;

interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroCS, MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, DBCtrls,
  Mask, ComCtrls, IvDictio, IvMulti, IvEMulti, TREdit, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, CMDBLookupCombo,ppCtrls;

type
  TfrmParamAlmox = class(TfrmCadastroCS)
    qryTipoDoc: TwwQuery;
    qryAlterador: TwwQuery;
    qryIDPESSOA: TFloatField;
    qryCODALTDEVOLUCAO: TFloatField;
    qryCODTIPDOC: TFloatField;
    qryMASCGRUPOPROD: TStringField;
    qryEXISTEDV: TStringField;
    qryEXISTECOMPRA: TStringField;
    qryRECEBAUTOMATICO: TStringField;
    qryCODTABPRODUTIL: TStringField;
    qryEXISTECONTASPAGAR: TStringField;
    qryEXISTECONTABIL: TStringField;
    qryFLGINFOVALORUN: TStringField;
    qryDATAIMPLANTA: TDateTimeField;
    qryFLGCONTABGRUPO: TStringField;
    PgcParam: TPageControl;
    TbsIntegra: TTabSheet;
    TbsRelat: TTabSheet;
    DBCheckBox1: TDBCheckBox;
    dbchbExisteCPag: TDBCheckBox;
    dbchbExisteContabilidade: TDBCheckBox;
    Label4: TLabel;
    dbclTipoDocumento: TwwDBLookupCombo;
    Label5: TLabel;
    dblcTipoAlterador: TwwDBLookupCombo;
    ImlReports: TImageList;
    QryParamRel: TwwQuery;
    QryParamRelIDPARAMRELATS: TFloatField;
    QryParamRelIDMODULO: TFloatField;
    QryParamRelIDPESSOA: TFloatField;
    QryParamRelNOMECOMPO: TStringField;
    QryParamRelDESCRICAO: TStringField;
    QryParamRelVALOR: TStringField;
    QryParamRelNOMERELATORIO: TStringField;
    UpdParamRel: TUpdateSQL;
    Pnldocpendentes: TPanel;
    TreeAssin: TTreeView;
    dbcbContabTransf: TDBCheckBox;
    qryFLGCONTABTRANSF: TStringField;
    qryPERCREQMAT: TFloatField;
    Label7: TLabel;
    qryFLGINTEGRALIVRO: TStringField;
    chkLivro: TDBCheckBox;
    qryPERCRECEBCOMOC: TFloatField;
    qryIDPATRO: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryPlanoPrev: TwwQuery;
    qryPatro: TwwQuery;
    DBCheckBox2: TDBCheckBox;
    qryFLGUSAGRUPOREQ: TStringField;
    qryFLGREQSEMSALDO: TStringField;
    DBCheckBox3: TDBCheckBox;
    TabGeral: TTabSheet;
    TabPrev: TTabSheet;
    grpGrupos: TGroupBox;
    Label1: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    dbedInput: TDBEdit;
    mskedDisplay: TMaskEdit;
    dbrgInfoValorUN: TDBRadioGroup;
    GroupBox2: TGroupBox;
    edDataImplanta: TCMDateTimePicker;
    grpProdutos: TGroupBox;
    chkbxDV: TDBCheckBox;
    chkContabGrupo: TDBCheckBox;
    Label6: TLabel;
    edPercReqMat: TDBRealEdit;
    Label8: TLabel;
    DBRealEdit1: TDBRealEdit;
    Label9: TLabel;
    Label2: TLabel;
    dblcPrograma: TCMDBLookupCombo;
    lblPlanoPrevC: TLabel;
    lblPatroC: TLabel;
    dblcPatroC: TwwDBLookupCombo;
    dblcPlanoPrevC: TwwDBLookupCombo;
    Label10: TLabel;
    qryPrograma: TwwQuery;
    qryIDPROGRAMA: TFloatField;
    procedure dbedInputExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDataImplantaEnter(Sender: TObject);
    procedure edDataImplantaExit(Sender: TObject);
    procedure TreeAssinEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure TreeAssinEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    procedure MontaArvoreParamRelats;
    Procedure SetMascara;
    Procedure SetAssinatura;
  public
    { Public declarations }
  end;

var
  frmParamAlmox : TfrmParamAlmox;
  bExistemGruposProdCadastrados : Boolean;
  dDataImplanta : TDateTime;
implementation

uses USistema, uModulo, DBaseDados, uDataBase, uMensErro, DRptRelats;

{$R *.DFM}

procedure TfrmParamAlmox.FormCreate(Sender: TObject);
Var
   x : Integer;
begin
  inherited;
  QryParamRel.Close;
  QryParamRel.ParambyName('PIDMODULO').AsInteger := Sistema.IdModulo;
  QryParamRel.ParambyName('PIDPESSOA').AsInteger := Sistema.IdEmpresa;
  QryParamRel.Open;
  If QryParamRel.IsEmpty Then
    Begin
     For x := 1 To 4 Do
       Begin
         QryParamRel.Append;
         QryParamRelIDPARAMRELATS.AsFloat  := LeUltRegistro(nil,'PARAMRELATS');
         QryParamRelIDMODULO.AsFloat       := Sistema.IdModulo;
         QryParamRelIDPESSOA.AsFloat       := Sistema.IdEmpresa;
         QryParamRelNOMECOMPO.AsString     := 'LbAssinatura'+IntToStr(x);
         QryParamRelDESCRICAO.AsString     := 'Assinatura '+IntToStr(x);
         QryParamRelVALOR.AsString         := '';
         QryParamRelNOMERELATORIO.AsString := 'Requisições Cadastradas';
         QryParamRel.Post;
      End;
        AplicaAlteracoes([QryParamRel]);
    End;
  MontaArvoreParamRelats;                                           
  qryAlterador.Close;
  qryAlterador.ParamByName('PEMPRESA').Value:=Sistema.Idempresa;
  qryAlterador.Open;
  //
  qry.Close;
  qry.Params[0].Value := Sistema.IdEmpresa;
  qry.Open;
  //
  bExistemGruposProdCadastrados := FazQuery(DtmBaseDados.qry,'SELECT CODGRUPOPROD FROM GRUPPROD');
  //
  if Trim(dbedInput.Text) <> '' then
    Begin
       SetMascara;
    End;
end;

procedure TfrmParamAlmox.CmeCadastroEdit(Sender: TObject);
Begin
  if(qry.IsEmpty) then
  Begin
     ds.DataSet.Insert;
     qry.FieldByName('IDPESSOA').AsInteger          := Sistema.IdEmpresa;
     qry.FieldByName('EXISTEDV').AsString           := 'F';
     qry.FieldByName('RECEBAUTOMATICO').AsString    := 'F';
     qry.FieldByName('EXISTECOMPRA').AsString       := 'F';
     qry.FieldByName('EXISTECONTASPAGAR').AsString  := 'N';
     qry.FieldByName('EXISTECONTABIL').AsString     := 'N';
     qry.FieldByName('FLGCONTABGRUPO').AsString     := 'S';
     qry.FieldByName('FLGCONTABTRANSF').AsString    := 'N';
     qry.FieldByName('FLGINTEGRALIVRO').AsString    := 'S';
     qry.FieldByName('FLGUSAGRUPOREQ').AsString     := 'N';
     qry.FieldByName('FLGREQSEMSALDO').AsString     := 'S';
  end;
  inherited;
  If bExistemGruposProdCadastrados Then
     GrpGrupos.Enabled   := False
  Else
     Begin
       grpGrupos.Enabled := True;
       dbedInput.SetFocus;
     End;
end;

procedure TfrmParamAlmox.CmeCadastroConfirma(Sender: TObject);
Begin
  inherited;
  Modulo.AtualizarParametros(Sistema.IdEmpresa,
                  Sistema.IdUsuario);
  Modulo.AtualizarParamIntegracao(Sistema.IdEmpresa);
End;

procedure TfrmParamAlmox.dbedInputExit(Sender: TObject);
begin
  inherited;
   if Trim(dbedInput.Text) <> '' then
     Begin
         SetMascara;
     End;
end;

procedure TfrmParamAlmox.edDataImplantaEnter(Sender: TObject);
begin
  inherited;
  if Not qry.FieldByName('DATAIMPLANTA').IsNull then
      dDataImplanta := qry.FieldByName('DATAIMPLANTA').AsDateTime
  Else
      dDataImplanta := 0;
end;

procedure TfrmParamAlmox.edDataImplantaExit(Sender: TObject);
begin
  inherited;
  If dDataImplanta <> 0 Then
     Begin
         If FazQuery(DtmBaseDados.qry,'SELECT MIN(IDMOV) FROM MOVIMENT')
         Then
            Begin
                MsgDlg('Data de implantação não pode ser alterada','Informação',mtInformation,[mbOK],0);
                qry.FieldByName('DATAIMPLANTA').AsDateTime := dDataImplanta;
            End;
     End;
end;

procedure TfrmParamAlmox.MontaArvoreParamRelats;
Var
  sOldNome : string;
  TreeNome, TreeDescricao, TreeFilho: TTreeNode;
Begin
     QryParamRel.First;
     sOldNome := '';
     TreeNome := nil;
     TreeAssin.Items.Clear;
     While Not QryParamRel.Eof Do
     Begin
       If SoldNome <> QryParamRel.FieldByName('NOMERELATORIO').AsString Then
       Begin
        TreeNome := TreeAssin.Items.Add(nil,QryParamRel.FieldByName('NOMERELATORIO').AsString);
        TreeNome.ImageIndex := 0;
        TreeNome.SelectedIndex := 0;
       End;
       TreeDescricao := TreeAssin.Items.AddChild(TreeNome,QryParamRel.FieldByName('DESCRICAO').AsString);
       TreeDescricao.ImageIndex := 1;
       TreeDescricao.SelectedIndex := 1;
       If Trim(QryParamRel.FieldByName('VALOR').AsString) = '' Then
          TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,'Clique Para Inserir\Alterar Assinatura')
       Else
          TreeFilho := TreeAssin.Items.AddChild(TreeDescricao,QryParamRel.FieldByName('VALOR').AsString);
       TreeFilho.ImageIndex := 2;
       TreeFilho.SelectedIndex := 2;
       TreeFilho.StateIndex := QryParamRel.FieldByName('IDPARAMRELATS').AsInteger;
       SOldNome := QryParamRel.FieldByName('NOMERELATORIO').AsString;
       QryParamRel.Next;
     End;
End;

procedure TfrmParamAlmox.TreeAssinEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
  inherited;
  QryParamRel.Locate('IDPARAMRELATS',Node.StateIndex,[]);
  QryParamRel.Edit;
  QryParamRel.FieldByName('VALOR').AsString := S;
  QryParamRel.Post;
end;

procedure TfrmParamAlmox.TreeAssinEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  inherited;
  AllowEdit := (Node.ImageIndex = 2);
end;

procedure TfrmParamAlmox.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  If QryParamRel.UpdatesPending Then
  Begin
    QryParamRel.CancelUpdates;
    MontaArvoreParamRelats;
  End;
end;

procedure TfrmParamAlmox.bbtnConfirmarClick(Sender: TObject);
begin
  Aplicaalteracoes([QryParamRel]);
  inherited;

end;

procedure TfrmParamAlmox.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  SetAssinatura;
end;

procedure TfrmParamAlmox.CmeCadastroAtualizaBotoes(Sender: TObject);
Begin
  inherited;
  sbtnAlterar.Enabled := True;
end;
procedure TfrmParamAlmox.SetMascara;
Var x : Integer;
begin
    mskedDisplay.EditMask := dbedInput.Text + ';0;_';
    mskedDisplay.Text := '';
    For x := 1 To Pred(Length(Trim(dbedInput.Text))) Do
       mskedDisplay.Text := mskedDisplay.Text + IntToStr(x);
end;

procedure TfrmParamAlmox.SetAssinatura;
Var
  LblRelats: TppLabel;
Begin
    If FazQuery(DtmBaseDados.Qry,' SELECT NOMECOMPO,VALOR '+
                                 ' FROM PARAMRELATS '+
                                 ' WHERE (IDMODULO = 5 ) '+
                                 '   AND (IDPESSOA = '+ IntToStr(Sistema.IdEmpresa)  +') ')
    Then
       Begin
          DtmBaseDados.Qry.First;
          While Not DtmBaseDados.Qry.Eof Do
            Begin
                Try
                  LblRelats := (DtmRptRelats.FindComponent(DtmBaseDados.Qry.FieldByName('NOMECOMPO').AsString) As TppLabel);
                  If LblRelats <> nil Then
                     LblRelats.Caption := DtmBaseDados.Qry.FieldByName('VALOR').AsString;
                 Finally
                  DtmBaseDados.Qry.Next;
                 End;
            End;
       End;
end;

end.
