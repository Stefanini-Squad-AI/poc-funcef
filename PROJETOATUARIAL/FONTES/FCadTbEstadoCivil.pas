{===============================================================================
Unit    :  FCadTbEstadoCivil
Form    :  frmCadTbEstadoCivil

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar os Estados Civis

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbEstadoCivil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, CmEventosCadastro,
  wwDialog, ImgList;

type
  TfrmCadTbEstadoCivil = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    QryPrincipal: TwwQuery;
    qryAux: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipalCD_ESTADO_CIVIL: TStringField;
    QryPrincipalDS_ESTADO_CIVIL: TStringField;
    MontaSelect: TMontaSelect;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
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
  frmCadTbEstadoCivil: TfrmCadTbEstadoCivil;
  WidReg: String;

implementation

uses DBaseDados;

{$R *.DFM}

procedure TfrmCadTbEstadoCivil.sbtnInserirClick(Sender: TObject);
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

procedure TfrmCadTbEstadoCivil.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit3.Enabled := false;
end;

procedure TfrmCadTbEstadoCivil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbEstadoCivil.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbEstadoCivil.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  wIdReg := '';
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_ESTADO_CIVIL').AsString;
end;

procedure TfrmCadTbEstadoCivil.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadTbEstadoCivil.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbEstadoCivil.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe o Estado Civil !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(DBEdit3.text) = '' then
   begin
    ShowMessage('Informe o código do Estado Civil !');
    DBEdit3.SetFocus;
    exit;
   end;   
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbEstadoCivil.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg <> '' Then
     Begin
       Qryprincipal.Locate('CD_ESTADO_CIVIL',wIdReg,[]);
       wIdReg := '';
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbEstadoCivil.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DBEdit3 do
   begin
     enabled := true;
     color := clSilver;
   end;
end;

procedure TfrmCadTbEstadoCivil.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_ESTADO_CIVIL', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
