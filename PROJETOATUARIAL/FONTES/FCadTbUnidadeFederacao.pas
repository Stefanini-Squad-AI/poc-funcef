{===============================================================================
Unit    :  FCadTbUnidadeFederacao
Form    :  frmCadTbUnidadeFederacao

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar as Unidade da Federação

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbUnidadeFederacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, CmEventosCadastro,
  wwDialog, ImgList;

type
  TfrmCadTbUnidadeFederacao = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipalCD_UF: TStringField;
    QryPrincipalDS_UF: TStringField;
    MontaSelect: TMontaSelect;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTbUnidadeFederacao: TfrmCadTbUnidadeFederacao;
  WidReg: String;

implementation

{$R *.DFM}

procedure TfrmCadTbUnidadeFederacao.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  with DBEdit1 do
   begin
     enabled := true;
     color := clWindow;
     ReadOnly := false;
   end;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbUnidadeFederacao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.Enabled := false;
  DbEdit2.SetFocus;
end;

procedure TfrmCadTbUnidadeFederacao.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbUnidadeFederacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbUnidadeFederacao.QryPrincipalAfterPost(
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

procedure TfrmCadTbUnidadeFederacao.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbUnidadeFederacao.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  with DBEdit1 do
   begin
     enabled := true;
     color := clSilver;
   end;
end;

procedure TfrmCadTbUnidadeFederacao.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe a Sigla da Unidade da Federação !');
    DBEdit1.SetFocus;
    exit;
   end;
  if trim(DBEdit2.text) = '' then
   begin
    ShowMessage('Informe o Nome da Unidade da Federação !');
    DBEdit2.SetFocus;
    exit;
   end;
  inherited;
  if SBtnInserir.Down then
   DBEdit1.SetFocus
  else
   DBEdit2.SetFocus;
end;

procedure TfrmCadTbUnidadeFederacao.QryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
   wIdReg := '';
   if qryPrincipal.State = dsInsert Then
      wIdReg := Qryprincipal.FieldByName('CD_UF').AsString;
end;

procedure TfrmCadTbUnidadeFederacao.QryPrincipalAfterOpen(
  DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg <> '' Then
     Begin
       Qryprincipal.Locate('CD_UF',wIdReg,[]);
       wIdReg := '';
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbUnidadeFederacao.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_UF', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

end.
