{===============================================================================
Unit    :  FCadTbGrauDependencia
Form    :  frmCadTbGrauDependencia

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar os Graus de Dependência

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbGrauDependencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, CmEventosCadastro,
  wwDialog, ImgList;

type
  TfrmCadTbGrauDependencia = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    MontaSelect: TMontaSelect;
    QryPrincipalCD_GRAU_DEPENDENCIA: TStringField;
    QryPrincipalDS_GRAU_DEPENDENCIA: TStringField;
    procedure sbtnAlterarClick(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTbGrauDependencia: TfrmCadTbGrauDependencia;
  WidReg: String;
  
implementation

{$R *.DFM}

procedure TfrmCadTbGrauDependencia.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit3.Enabled := false;
end;

procedure TfrmCadTbGrauDependencia.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  with DBEdit3 do
   begin
     enabled := true;
     color := clWindow;
     ReadOnly := false;
   end;
  DbEdit3.SetFocus;
end;

procedure TfrmCadTbGrauDependencia.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbGrauDependencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbGrauDependencia.QryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  wIdReg := '';
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_GRAU_DEPENDENCIA').AsString;
end;

procedure TfrmCadTbGrauDependencia.QryPrincipalAfterPost(
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

procedure TfrmCadTbGrauDependencia.sbtnApagarClick(Sender: TObject);
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

procedure TfrmCadTbGrauDependencia.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe o Grau de Dependência !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(DBEdit3.text) = '' then
   begin
    ShowMessage('Informe o código do Grau de Dependência !');
    DBEdit3.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbGrauDependencia.QryPrincipalAfterOpen(
  DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg <> '' Then
     Begin
       Qryprincipal.Locate('CD_GRAU_DEPENDENCIA',wIdReg,[]);
       wIdReg := '';
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbGrauDependencia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DBEdit3 do
   begin
     enabled := true;
     color := clSilver;
   end;
end;

procedure TfrmCadTbGrauDependencia.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_GRAU_DEPENDENCIA', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
