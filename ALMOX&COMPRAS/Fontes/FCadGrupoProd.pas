unit FCadGrupoProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, DBCtrls2,
  ComCtrls, CMTree, cmseldlg, wwidlg, Wwdatsrc, MAHlpBtn, Buttons,
    ToolWin, ExtCtrls, TB97, wwdblook, wwdbedit, Wwdotdot,
  Wwdbcomb, Wwtable, TB97Ctls, TB97Tlbr, MontaSelect, IvDictio, IvMulti,
  IvEMulti, CmEventosCadastro, wwDialog, ImgList, CMDBLookupCombo;

type
  TfrmCadGrupoProd = class(TfrmCadastro)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dbedDescGrupo: TDBEdit2;
    qryGrupoProd: TwwQuery;
    dbrdAnaSint: TDBRadioGroup;
    GbTipDesemb: TGroupBox;
    QryTipoDesemb: TwwQuery;
    QryTipoDesembCODTIPRECDES: TStringField;
    QryTipoDesembRECPAG: TStringField;
    QryTipoDesembIDPESSOA: TFloatField;
    QryTipoDesembPLANO: TFloatField;
    QryTipoDesembPLACONTA: TStringField;
    QryTipoDesembIDUSUARIOINCLUSAO: TFloatField;
    QryTipoDesembDESCRICAO: TStringField;
    QryTipoDesembANASINT: TStringField;
    QryTipoDesembPLACONTACREDITO: TStringField;
    dsTipoDesemb: TwwDataSource;
    QryJoin: TwwQuery;
    dsJoin: TwwDataSource;
    QryJoinCODTIPRECDES: TStringField;
    QryJoinRECPAG: TStringField;
    QryJoinIDPESSOA: TFloatField;
    QryJoinPLANO: TFloatField;
    QryJoinPLACONTA: TStringField;
    QryJoinIDUSUARIOINCLUSAO: TFloatField;
    QryJoinDESCRICAO: TStringField;
    QryJoinANASINT: TStringField;
    QryJoinPLACONTACREDITO: TStringField;
    QryJoinCODGRUPOPROD: TStringField;
    QryJoinDESCGRUPOPROD: TStringField;
    QryJoinSTATUSGRUPO: TStringField;
    QryJoinCODPAI: TStringField;
    QryJoinCODTIPRECDES_1: TStringField;
    QryJoinRECPAG_1: TStringField;
    QryJoinIDPESSOA_1: TFloatField;
    qryGrupoProdCODGRUPOPROD: TStringField;
    qryGrupoProdDESCGRUPOPROD: TStringField;
    qryGrupoProdSTATUSGRUPO: TStringField;
    qryGrupoProdCODPAI: TStringField;
    qryGrupoProdCODTIPRECDES: TStringField;
    qryGrupoProdRECPAG: TStringField;
    qryGrupoProdIDPESSOA: TFloatField;
    DbLkTipoDesemb: TwwDBLookupCombo;
    MontaSelect: TMontaSelect;
    dbedCodGrupProd: TDBEdit2;
    treeGrupoProd: TCMTreeView;
    qryGrpAtivoFixo: TwwQuery;
    dblcGrpAtivoFixo: TwwDBLookupCombo;
    Label3: TLabel;
    qryGrupoProdIDGRUPO: TFloatField;
    qryGrupoProdIDNATUREZAESTOQUE: TFloatField;
    Label4: TLabel;
    qryNatuEst: TwwQuery;
    dblcNatuEst: TCMDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure treeGrupoProdChange(Sender: TObject);
    procedure dbedCodGrupProdExit(Sender: TObject);
    Procedure CmeCadastroDelete(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    bMontandoArvore: boolean;
  public
    { Public declarations }
  end;

var
  frmCadGrupoProd: TfrmCadGrupoProd;

implementation

uses uMensErro,UModulo,uSistema,uIntegraBack,uString,uFuncaoGeral,
     uDatabase,DBasedados;

{$R *.DFM}
procedure TfrmCadGrupoProd.FormCreate(Sender: TObject);
var
   Filtro : string;
begin
   QryTipoDesemb.Close;
   QryTipoDesemb.Sql.Text := ' Select * From TipoRecebDesemb Where (ANASINT = ''A'') And '+
                             ' (RecPag = ''P'') AND ATIVO = ''S'' ';
   QryTipoDesemb.Open;

   Filtro:='';
   Filtro:=Filtro + ' SELECT * FROM '+Sistema.PrefixoServidor+'GRUPPROD ';
   Filtro:=Filtro + ' ORDER BY CODGRUPOPROD';

   qryGrupoProd.close;
   qryGrupoProd.sql.Text := Filtro;
   qryGrupoProd.open;

   QryJoin.Close;
   QryJoin.Sql.Text :=' Select * From '+Sistema.PrefixoServidor+'TipoRecebDesemb T, '+
                       Sistema.PrefixoServidor+'GrupProd G '+
                       ' Where G.CodTipRecDes = T.CodTipRecDes  AND T.ATIVO = ''S'' ';

   QryJoin.Open;

   inherited;
   If IntegraBack.Contabilidade= 'S' Then
      GbTipDesemb.Enabled:= True
   else
      GbTipDesemb.Enabled := False;

   TreeGrupoProd.Mascara := Modulo.sMascaraGrupoProd;
   qryGrupoProdCODGRUPOPROD.EditMask := Modulo.sMascaraGrupoProd + ';0; ';

   bMontandoArvore := True;
   TreeGrupoProd.MontaArvore;
   bMontandoArvore := False;

   TreeGrupoProd.Enabled :=  not QryGrupoProd.IsEmpty;

   qryGrpAtivoFixo.Open;

   qryGrupoProd.First;

end;

procedure TfrmCadGrupoProd.bbtnConfirmarClick(Sender: TObject);
begin
  if dbedCodGrupProd.Text = '' then
  Begin
     MsgDlg('Obrigatório preencher o Código do Grupo de Produtos','Erro',mtError,[mbOk],0);
     dbedCodGrupProd.SetFocus;
     exit;
  end;
  if dbedDescGrupo.Text = '' then
  Begin
     MsgDlg('Obrigatório preencher a Descrição do Grupo de Produtos','Erro',mtError,[mbOk],0);
     dbedDescGrupo.SetFocus;
     exit;
  end;
  if (DbLkTipoDesemb.Text = '') and (Modulo.sExisteCPag = 'S') then
  Begin
     MsgDlg('Obrigatório preencher o Tipo de Desembolso','Erro',mtError,[mbOk],0);
     DbLkTipoDesemb.SetFocus;
     exit;
  end;
  If sbtnInserir.down Then
  Begin
     GbTipDesemb.Enabled:= True;
  end
  else
  Begin
     GbTipDesemb.Enabled:= False;
  end;
  if DbLkTipoDesemb.Text <> '' then
  begin
    qryGrupoProd.FieldByName('CodTipRecDes').AsString:= QryTipoDesemb.FieldByName('CodTipRecDes').AsString;
    qryGrupoProd.FieldByName('IdPessoa').AsInteger:= Sistema.IdEmpresa;
    qryGrupoProd.FieldByName('RECPAG').AsString:='P';
  end;
  inherited;
  TreeGrupoProd.Enabled :=  not QryGrupoProd.IsEmpty;
  dbNav.Visible := False;
end;

procedure TfrmCadGrupoProd.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  TreeGrupoProd.Enabled :=  not QryGrupoProd.IsEmpty;
  dbNav.Visible := False;
end;

procedure TfrmCadGrupoProd.treeGrupoProdChange(Sender: TObject);
begin
 inherited;
  if Not bMontandoArvore Then
     Begin
        QryTipoDesemb.Locate('CodTipRecDes',qryGrupoProd.FieldByName('CodTipRecDes').AsString,[loPartialKey]);
        If QryTipoDesemb.Locate('CodTipRecDes',qryGrupoProd.FieldByName('CodTipRecDes').AsString,[loPartialKey]) Then
            DbLkTipoDesemb.Text:= QryTipoDesemb.FieldByName('Descricao').AsString
        Else
            DbLkTipoDesemb.Text:= '';
     End;
end;

procedure TfrmCadGrupoProd.CmeCadastroFind(Sender: TObject);
Var
  sCodigo : String;
begin
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.count > 0) and (MontaSelect.ValoresChave[0] <> '') then
  Begin
      sCodigo:=MontaSelect.ValoresChave[0]+' ';
      qryGrupoProd.Locate('CodGrupoProd',sCodigo,[loPartialKey]);
  End;
end;

procedure TfrmCadGrupoProd.dbedCodGrupProdExit(Sender: TObject);
var iGrauMax,iGrau:Integer;
begin
  inherited;
  If Ds.DataSet.State in [dsInsert,dsEdit] Then
     Begin
        if Trim(dbedCodGrupProd.Text) <> '' then
          Begin
             if FuncaoGeral.VerificaGrau(Modulo.sMascaraGrupoProd,dbedCodGrupProd.Text) =  -1 then
                Begin
                  MsgDlg('Código digitado não está de acordo com a máscara. Verifique','Erro',mtError,[mbOk],0);
                  dbedCodGrupProd.SetFocus;
                  exit;
                end;
             if FuncaoGeral.VerificaPai('GRUPPROD','CODGRUPOPROD',Modulo.sMascaraGrupoProd,dbedCodGrupProd.Text) =  -2 then
                 Begin
                    MsgDlg('Código já cadastrado','Erro',mtError,[mbOk],0);
                    dbedCodGrupProd.SetFocus;
                    exit;
                 end;
             if FuncaoGeral.VerificaPai('GRUPPROD','CODGRUPOPROD',Modulo.sMascaraGrupoProd,dbedCodGrupProd.Text) =  -1 then
                  Begin
                    MsgDlg('Código digitado não tem pai. Verifique','Erro',mtError,[mbOk],0);
                    dbedCodGrupProd.SetFocus;
                    exit;
                  end;
             iGrauMax:=FuncaoGeral.CalcGrauMax(Modulo.sMascaraGrupoProd);
             iGrau   :=FuncaoGeral.CalcGrau(Modulo.sMascaraGrupoProd,dbedCodGrupProd.Text);
             dbrdAnaSint.Enabled:=True;
             if iGrau = iGrauMax then
                 Begin
                    qryGrupoProd.FieldByName('StatusGrupo').AsString := 'A';
                    dbrdAnaSint.Enabled:=False;
                 end
             else
             qryGrupoProd.FieldByName('StatusGrupo').AsString := 'S';
         end;
     End;
end;

procedure TfrmCadGrupoProd.CmeCadastroDelete(Sender: TObject);
Begin
   If FazQuery(DtmBaseDados.qry,' SELECT CODGRUPOPROD '+
                                ' FROM GRUPPROD '+
                                ' WHERE (CODGRUPOPROD LIKE '''+qryGrupoProd.FieldByName('CODGRUPOPROD').asString+''' || ''%'' ) '+
                                '   AND (RTRIM(CODGRUPOPROD) <> '''+qryGrupoProd.FieldByName('CODGRUPOPROD').asString+''')')
   Then
      MsgDlg('Exclusão proibida. Grupo possui sub-grupos','Erro',mtError,[mbOk],0)
   Else
      inherited;

End;

procedure TfrmCadGrupoProd.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  TreeGrupoProd.Enabled:= False;
  GbTipDesemb.Enabled:= True;
  dbedCodGrupProd.Enabled:=True;
  dbedCodGrupProd.SetFocus;
end;

procedure TfrmCadGrupoProd.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  treeGrupoProd.Enabled:= False;
  GbTipDesemb.Enabled:= True;
  dbedCodGrupProd.Enabled:=False;
  dbedDescGrupo.SetFocus;
end;

procedure TfrmCadGrupoProd.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;

end;

end.
