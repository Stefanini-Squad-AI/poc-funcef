{===============================================================================
Unit    :  FCadTbTipoCategoriaPro
Form    :  frmCadTbTipoCategoriaPro

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar os Tipos de Categoria Profissional

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbTipoCategoriaPro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, CmEventosCadastro, wwDialog, ImgList,
  MontaSelect;

type
  TfrmCadTbTipoCategoriaPro = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    QryPrincipalCD_TIPO_CAT_PROF_ESP: TFloatField;
    QryPrincipalDS_TIPO_CAT_PROF_ESP: TStringField;
    MontaSelect: TMontaSelect;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTbTipoCategoriaPro: TfrmCadTbTipoCategoriaPro;
  WidReg: Integer;

implementation

{$R *.DFM}

procedure TfrmCadTbTipoCategoriaPro.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbTipoCategoriaPro.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbTipoCategoriaPro.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbTipoCategoriaPro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbTipoCategoriaPro.QryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;

  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_TIPO_CAT_PROF_ESP').AsInteger;
end;

procedure TfrmCadTbTipoCategoriaPro.QryPrincipalAfterPost(
  DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;   
end;

procedure TfrmCadTbTipoCategoriaPro.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbTipoCategoriaPro.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe o Tipo de Categoria Profissional !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbTipoCategoriaPro.QryPrincipalAfterOpen(
  DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_TIPO_CAT_PROF_ESP',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbTipoCategoriaPro.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_TIPO_CAT_PROF_ESP', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

end.
