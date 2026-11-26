unit fUsuxTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Mask, wwdbedit, ComCtrls, Buttons, ExtCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, Db, DBClient,
  uCMClientDataSet,uCmControlObject, DBTables, Wwquery, uCmSqlParams,uSistema,
  ImgList,dBasedados,fUserManager;

type
  TFrmUsuxTabela = class(TfrmOkCancelar)
    Panel1: TPanel;
    Bevel1: TBevel;
    BtnDelAll: TSpeedButton;
    BtnDel: TSpeedButton;
    BtnAddAll: TSpeedButton;
    BtnAdd: TSpeedButton;
    Label3: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    LstGrupoMembros: TListView;
    DbEdNome: TwwDBEdit;
    LstGrupoNaoMembros: TListView;
    cdsNpermitido: TCMClientDataSet;
    ImlImages: TImageList;
    pNPermitido: TCMSqlParams;
    cdsNpermitidoTABLE_NAME: TStringField;
    cdsPermitido: TCMClientDataSet;
    pPermitido: TCMSqlParams;
    cdsPermitidoNOMETABELA: TStringField;
    procedure BtnAddClick(Sender: TObject);
    procedure BtnAddAllClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnDelAllClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     sComando: tStringList;
     fIdUsuario: Integer;
     procedure ExecQuery(sql:string);
     procedure AtlzPermissoes;
     procedure CarregaListView(cds: TCMClientDataSet;fd: string; lv: TListView);
     function  GetIdUsuario: Integer;

  public

  published
    property iIdUsuario: Integer read  GetIdUsuario write fIdUsuario;
  end;

var
  FrmUsuxTabela: TFrmUsuxTabela;

implementation

{$R *.DFM}

procedure TFrmUsuxTabela.BtnAddClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
//  inherited;
  i := 0;
  While i < LstGrupoNaoMembros.Items.Count Do Begin
      If LstGrupoNaoMembros.Items[ i ].Selected Then Begin
         LstItem := LstGrupoMembros.Items.Add;
         LstItem.ImageIndex := 0;
         LstItem.Caption := LstGrupoNaoMembros.Items[ i ].Caption;
         LstItem.SubItems := LstGrupoNaoMembros.Items[ i ].SubItems;
         sComando.Add('INSERT INTO logplanus.USUARIOXTABELA(IDUSUARIO,NOMETABELA) VALUES('+IntToStr(iIdUsuario)+','+QuotedStr(LstItem.Caption)+');');
         LstGrupoNaoMembros.Items[ i ].Delete;
      End Else
          Inc( i );
  End;

end;

procedure TFrmUsuxTabela.BtnAddAllClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
 //inherited;
 While LstGrupoNaoMembros.Items.Count > 0 Do Begin
        LstItem := LstGrupoMembros.Items.Add;
        LstItem.ImageIndex := 0;
        LstItem.Caption := LstGrupoNaoMembros.Items[ 0 ].Caption;
        LstItem.SubItems := LstGrupoNaoMembros.Items[ 0 ].SubItems;
        sComando.Add('INSERT INTO logplanus.USUARIOXTABELA(IDUSUARIO,NOMETABELA) VALUES('+IntToStr(iIdUsuario)+','+QuotedStr(LstItem.Caption)+');');
        LstGrupoNaoMembros.Items[ 0 ].Delete;
  End;
end;

procedure TFrmUsuxTabela.BtnDelClick(Sender: TObject);
Var
   i: Integer;
   LstItem: TListItem;
begin
  //inherited;
  i := 0;

  While i < LstGrupoMembros.Items.Count Do Begin
      If LstGrupoMembros.Items[ i ].Selected Then Begin
         LstItem := LstGrupoNaoMembros.Items.Add;
         LstItem.ImageIndex := 0;
         LstItem.Caption := LstGrupoMembros.Items[ i ].Caption;
         LstItem.SubItems := LstGrupoMembros.Items[ i ].SubItems;
         sComando.Add('DELETE FROM logplanus.USUARIOXTABELA WHERE IDUSUARIO ='+IntToStr(iIdUsuario)+' AND NOMETABELA ='+QuotedStr(LstItem.Caption)+';');
         LstGrupoMembros.Items[ i ].Delete;
      End Else
          Inc( i );
  End;
end;

procedure TFrmUsuxTabela.BtnDelAllClick(Sender: TObject);
Var
   LstItem: TListItem;
begin
  //inherited;
  While LstGrupoMembros.Items.Count > 0 Do Begin
        LstItem := LstGrupoNaoMembros.Items.Add;
        LstItem.ImageIndex := 0;
        LstItem.Caption := LstGrupoMembros.Items[ 0 ].Caption;
        LstItem.SubItems := LstGrupoMembros.Items[ 0 ].SubItems;
        sComando.Add('DELETE FROM logplanus.USUARIOXTABELA WHERE IDUSUARIO ='+IntToStr(iIdUsuario)+' AND NOMETABELA ='+QuotedStr(LstItem.Caption)+';');
        LstGrupoMembros.Items[ 0 ].Delete;
  End;
end;

procedure TFrmUsuxTabela.ExecQuery(sql:string);
var
 qry: twwquery;
begin
  qry:= twwquery.create(nil);
  qry.databasename:= 'BASEDADOS';
  qry.close;
  qry.sql.clear;
  qry.sql.add(sql);
  try
    qry.ExecSQL;
  finally
    FreeAndNil(qry);
  end;
end;


procedure TFrmUsuxTabela.AtlzPermissoes;
Var
   LstItemP,LstItemN: TListItem;
   sFiltro: String;
begin
   LstGrupoMembros.Items.clear;
   LstGrupoNaoMembros.Items.Clear;

  if (cdsPermitido.active) then  cdsPermitido.close;

   pPermitido.Prepare;
   pPermitido.ParamByName('IDUSUARIO').AsString:= IntToStr(iIdUsuario);
   pPermitido.open;
   CarregaListView(cdsPermitido,'NOMETABELA',LstGrupoMembros);

  if (cdsNpermitido.active) then  cdsPermitido.close;

   pNpermitido.Prepare;
   pNpermitido.ParamByName('IDUSUARIO').AsString:= IntToStr(iIdUsuario);
   pNpermitido.Open;
   CarregaListView(cdsNpermitido,'TABLE_NAME',LstGrupoNaoMembros);

end;

procedure TFrmUsuxTabela.CarregaListView(cds: TCMClientDataSet;fd: string; lv: TListView);
var
   LstItem: TListItem;
begin
 While not(cds.eof) do
    begin
       LstItem := lv.Items.Add;
       LstItem.Caption := cds.fieldByname(fd).AsString;
       cds.next;
    end;
end;
procedure TFrmUsuxTabela.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if (dtmBasedados.dbBaseDados.InTransaction) then
     dtmBasedados.dbBaseDados.Rollback;
end;

procedure TFrmUsuxTabela.bbtnConfirmarClick(Sender: TObject);
var
   sTabela: string;
begin
  //inherited;
  sTabela:='';
  try
    if not (dtmBasedados.dbBaseDados.InTransaction) then
     dtmBasedados.dbBaseDados.StartTransaction;

     if sComando.Count > 0 then
        ExecQuery('begin '+ sComando.gettext + ' end;');
     sComando.Clear;

     dtmBasedados.dbBaseDados.Commit;
     AtlzPermissoes;
  except
    on Ex : Exception do
    begin
      AtlzPermissoes;
      MessageDlg(Ex.Message, mtError, [mbOk], 0);
      dtmBasedados.dbBaseDados.Rollback;
    end;
  end;
end;

function TFrmUsuxTabela.GetIdUsuario: Integer;
var qry:TwwQuery;
begin
  try
   qry:= TwwQuery.create(nil);
   qry.dataBaseName:= 'BASEDADOS';

   qry.close;
   qry.sql.clear;
   qry.sql.add(' SELECT IDUSUARIO FROM USUARIOSISTEMA ');
   qry.sql.add(' WHERE NOMEUSUARIO = '+ QuotedStr(DbEdNome.Text));
   qry.open;

   result:=  qry.fieldByname('IDUSUARIO').AsInteger;;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TFrmUsuxTabela.FormCreate(Sender: TObject);
begin
  inherited;
  sComando:= TStringList.create;
  AtlzPermissoes;
end;

end.
