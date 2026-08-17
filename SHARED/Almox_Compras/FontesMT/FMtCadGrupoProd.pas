{-------------------------------------------------------------------------------
 Data       : 25.08.2006
 Autor      : Antonio Marcos (amf)
 Pendência  : 22549
 Descrição  : Retirada o combobox Natureza de Estoque
----------------------------------------------------------------------------------
// ATUALIZADO : Andre Tavares - 26/02/2004 - pendência 15703 - inclusão do filtro ATIVO na quey spTipoDesemb.
//              andre tavares - 28/12/2004 - pendencia 17167 - gravar sempre o campo recpag = 'P'
----------------------------------------------------------------------------------}

unit FMtCadGrupoProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  ComCtrls, CMTree, uCtrlGrupoProd, uCtrlGeral, CMDBLookupCombo, wwdblook,
  DBCtrls, Mask, DBCtrls2, DBTables, Wwquery, fcButton, fcImgBtn, Provider,
  uCMTreeViewMT, uCMTypes, uCtrlparamIntegra, uFuncaoGeral, uCmSqlParams,
  Grids, DBGrids;

type
  TFrmMtCadGrupoProd = class(TFrmCadastroMT)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edDescGrupo: TDBEdit2;
    edCodGrupoProd: TDBEdit2;
    dblcGrpAtivoFixo: TwwDBLookupCombo;
    DbLkTipoDesemb: TwwDBLookupCombo;
    Label5: TLabel;
    cdsTipoDesemb: TCMClientDataSet;
    cdsGrpAtivoFixo: TCMClientDataSet;
    cdsNatuEstoque: TCMClientDataSet;
    TreeGrupoProd: TCMTreeViewMT;
    spTipoDesemb: TCMSqlParams;
    spGrpAtivoFixo: TCMSqlParams;
    spNatuEstoque: TCMSqlParams;
    cdsTree: TCMClientDataSet;
    dsTree: TwwDataSource;
    rgStatus: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure edCodGrupoProdExit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure TreeGrupoProdChange(Sender: TObject);
  private
    { Private declarations }
    bMontaArvore : Boolean;
    GrupoProd    : TCtrlGrupoProd;
    Geral        : TCtrlGeral;
    //
    Procedure Sel( sCodGrupoProd : String );

  public
    { Public declarations }
  end;

var
  FrmMtCadGrupoProd: TFrmMtCadGrupoProd;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uModulo, DBasedados;

procedure TFrmMtCadGrupoProd.FormCreate(Sender: TObject);
begin
  inherited;

  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  GrupoProd.cds := cds;
  //
  Geral := TCtrlGeral.Create;
  Geral.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  //
  CdsTree.Data := GrupoProd.Procurar;
  //
  Sel(CdsTree.FieldByName('CODGRUPOPROD').AsString);
  //
  if cds.IsEmpty then
     CmeCadastro.Operacao := opVazio
  else
     CmeCadastro.Operacao := opIdle;
  //
  bMontaArvore := True;
  TreeGrupoProd.Mascara := Modulo.sMascaraGrupoProd;
  TreeGrupoProd.MontaArvore;
  bMontaArvore := False;
  //
  spTipoDesemb.Open;
  spGrpAtivoFixo.Open;
  spNatuEstoque.Open;

  If ParamIntegra.IntegraContab  Then
     DbLkTipoDesemb.Enabled := True
  else
     DbLkTipoDesemb.Enabled := False;

  TStringField(cds.FieldByName('CODGRUPOPROD')).EditMask := Modulo.sMascaraGrupoProd + ';0; ';
  TStringField(cds.FieldByName('CODGRUPOPROD')).EditMask := Modulo.sMascaraGrupoProd + ';0; ';
end;

procedure TFrmMtCadGrupoProd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Begin
        Sel(MontaSelect.ValoresChave[0]);
        cdsTree.Locate('CodGrupoProd',MontaSelect.ValoresChave[0],[loPartialKey]);
     End;
end;

procedure TFrmMtCadGrupoProd.edCodGrupoProdExit(Sender: TObject);
var
   iGrauMax : Integer;
   iGrau    : Integer;
   iNum     : Integer;
begin
  inherited;
  If Trim(edCodGrupoProd.Text) <> '' then
    Begin
       if Not Geral.VerificaGrau(Modulo.sMascaraGrupoProd,edCodGrupoProd.Text) Then
          Begin
            MsgDlg(Geral.MessageInfo ,'Erro',mtError,[mbOk],0);
            edCodGrupoProd.SetFocus;
            exit;
          end;
       if (CmeCadastro.Operacao = opAlterar ) And (GrupoProd.JaExisteGrupo(edCodGrupoProd.Text)) Then
          Begin
            MsgDlg('Já exite este grupo cadastrado' ,'Erro',mtError,[mbOk],0);
            edCodGrupoProd.SetFocus;
            exit;
          end;
       inum := FuncaoGeral.VerificaPai('GRUPPROD','CODGRUPOPROD',Modulo.sMascaraGrupoProd,edCodGrupoProd.Text);
       if (cds.State in dsEditModes) And(iNum < 0) Then
          Begin
              Case iNum Of
                -2 : MsgDlg('Código já cadastrado','Erro',mtError,[mbOk],0);
                -1 : MsgDlg('Código digitado não tem pai. Verifique','Erro',mtError,[mbOk],0);
              End;
             edCodGrupoProd.SetFocus;
             exit;
          end;

       iGrauMax := Geral.CalcGrauMax(Modulo.sMascaraGrupoProd);
       iGrau    := Geral.CalcGrau(Modulo.sMascaraGrupoProd,edCodGrupoProd.Text);

       if iGrau = iGrauMax then
          cds.FieldByName('STATUSGRUPO').AsString := 'A'
       else
          cds.FieldByName('STATUSGRUPO').AsString := 'S';
  end;
end;

procedure TFrmMtCadGrupoProd.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  TreeGrupoProd.Enabled := False;
  edCodGrupoProd.Enabled := True;
  edCodGrupoProd.SetFocus;
  Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
  Cds.FieldByName('RECPAG').AsString := 'P';
end;

procedure TFrmMtCadGrupoProd.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  TreeGrupoProd.Enabled  := False;
  edCodGrupoProd.Enabled := False;
  edDescGrupo.SetFocus;
end;

procedure TFrmMtCadGrupoProd.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GrupoProd.Excluir;
  If Accept Then
     If Not CdsTree.IsEmpty Then
        Begin
            CdsTree.Data := GrupoProd.Procurar;
            bMontaArvore := True;
            TreeGrupoProd.MontaArvore;
            bMontaArvore := False;
        End;
end;

procedure TFrmMtCadGrupoProd.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GrupoProd.Grava;
  If Accept Then
     Begin
        cdsTree.Edit;
        cdsTree.FieldByName('STATUSGRUPO').AsString    := cds.FieldByName('STATUSGRUPO').AsString;
        cdsTree.FieldByName('DESCGRUPOPROD').AsString  := cds.FieldByName('DESCGRUPOPROD').AsString;
        cdsTree.Post;
     End;
end;

procedure TFrmMtCadGrupoProd.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
Var
   sCodGruProd, sStatus, sDesc :String;
begin
  inherited;
  sCodGruProd := cds.FieldByName('CODGRUPOPROD').AsString;
  sStatus     := cds.FieldByName('STATUSGRUPO').AsString;
  sDesc       := cds.FieldByName('DESCGRUPOPROD').AsString;


  Accept := GrupoProd.Grava;

  If Accept Then
     Begin
        cdsTree.Append;
        cdsTree.FieldByName('CODGRUPOPROD').AsString   := sCodGruProd;
        cdsTree.FieldByName('STATUSGRUPO').AsString    := sStatus;
        cdsTree.FieldByName('DESCGRUPOPROD').AsString  := sDesc;
        cdsTree.Post;
     End;
end;

procedure TFrmMtCadGrupoProd.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(GrupoProd.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMtCadGrupoProd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GrupoProd.Free;
  Geral.Free;
end;

procedure TFrmMtCadGrupoProd.Sel(sCodGrupoProd : String);
begin
  cds.Data := GrupoProd.Procurar(sCodGrupoProd);

  TStringField(cds.FieldByName('CODGRUPOPROD')).EditMask := Modulo.sMascaraGrupoProd + ';0; ';
  TStringField(cds.FieldByName('CODGRUPOPROD')).EditMask := Modulo.sMascaraGrupoProd + ';0; ';

end;

procedure TFrmMtCadGrupoProd.CmeCadastroDelete(Sender: TObject);
begin
  If GrupoProd.PossuiSubGrupo(cds.fieldByName('CODGRUPOPROD').asString) Then
     MsgDlg('Exclusão proibida. Grupo possui sub-grupos','Erro',mtError,[mbOk],0)
  Else
     inherited;

end;

procedure TFrmMtCadGrupoProd.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  TreeGrupoProd.Enabled := Not bbtnConfirmar.Enabled;
end;

procedure TFrmMtCadGrupoProd.TreeGrupoProdChange(Sender: TObject);
begin
  inherited;
  If (Not bMontaArvore) And (dsTree.State = dsBrowse) Then
     Sel(cdsTree.FieldByName('CODGRUPOPROD').AsString);
end;

end.



