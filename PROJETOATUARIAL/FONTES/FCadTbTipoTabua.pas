{===============================================================================
Unit    :  FCadTbTipoTabua
Form    :  frmCadTbTipoTabua

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar os Tipos de Tábua

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbTipoTabua;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, CmEventosCadastro,
  wwDialog, ImgList;

type
  TfrmCadTbTipoTabua = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    QryPrincipalCD_TIPO_TABUA: TFloatField;
    QryPrincipalDS_TIPO_TABUA: TStringField;
    QryPrincipalIR_DOMINIO_SISTEMA: TStringField;
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
  frmCadTbTipoTabua: TfrmCadTbTipoTabua;
  WidReg: Integer;

implementation

{$R *.DFM}

procedure TfrmCadTbTipoTabua.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbTipoTabua.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbTipoTabua.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbTipoTabua.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbTipoTabua.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_TIPO_TABUA').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;
   
  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_TIPO_TABUA').AsInteger;
end;

procedure TfrmCadTbTipoTabua.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadTbTipoTabua.sbtnApagarClick(Sender: TObject);
begin
  if not(qryPrincipal.FieldByName('IR_DOMINIO_SISTEMA').isNull) then
   begin
     SBtnApagar.Down := false;
     ShowMessage('Registro de utilização interna do sistema');
     exit;
   end;
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbTipoTabua.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe o Tipo da Tábua !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbTipoTabua.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_TIPO_TABUA',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbTipoTabua.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_TIPO_TABUA', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

end.
