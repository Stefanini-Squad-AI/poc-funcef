{===============================================================================
Unit    :  uContatos
Form    :  frmContatos

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar os Contatos de uma Patrocinadora ou Entidade de Previcência

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uContatos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, DBTables, Wwquery;

type
  TfrmContatos = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label9: TLabel;
    Label4: TLabel;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    qryAux: TwwQuery;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipalCD_PESSOA_CONTATO: TFloatField;
    QryPrincipalSQ_PESSOA_CONTATO: TFloatField;
    QryPrincipalNO_PESSOA_CONTATO: TStringField;
    QryPrincipalDS_CARGO: TStringField;
    QryPrincipalNR_FONE_TRAB_1: TStringField;
    QryPrincipalNR_FONE_TRAB_2: TStringField;
    QryPrincipalNR_FONE_RES: TStringField;
    QryPrincipalNR_CELULAR: TStringField;
    QryPrincipalNR_FAX: TStringField;
    QryPrincipalDS_OBSERV: TMemoField;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContatos: TfrmContatos;
  WidReg: Integer;
  CodP: Integer;

implementation

uses uPatrocinadora, uEntidadePrevidencia;

{$R *.DFM}

procedure TfrmContatos.sbtnInserirClick(Sender: TObject);
begin
 inherited;
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD').asInteger := CodP;
  qryPrincipal.Open;
  qryPrincipal.Insert;
  DBEdit6.SetFocus;
end;

procedure TfrmContatos.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit6.SetFocus;
end;

procedure TfrmContatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmContatos.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.ParamByName('CD').asInteger := CodP;
     QryPrincipal.FieldByName('CD_PESSOA_CONTATO').AsInteger := CodP;
     qryAux.Open;
     QryPrincipal.FieldByName('SQ_PESSOA_CONTATO').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;
   
  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('SQ_PESSOA_CONTATO').AsInteger;
end;

procedure TfrmContatos.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit6.Text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DBEdit6.SetFocus;
    exit;
   end;
  inherited;
  DBEdit6.SetFocus;
  bbtnCancelar.Click;
  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD').asInteger := CodP;
  qryPrincipal.Open;  
end;

procedure TfrmContatos.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmContatos.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmContatos.FormCreate(Sender: TObject);
begin
  if qryPrincipal.Active then
    qryPrincipal.Close;
  // Passa os Parâmetros necessários
  // Se for Contato de uma Patrocinadora
  try
   if (frmPatrocinadora <> nil) and (frmPatrocinadora.CodPessoa <> 0) then
    if frmPatrocinadora.qryPrincipal.State = dsBrowse then
     begin
      CodP := frmPatrocinadora.CodPessoa;
      qryPrincipal.ParamByName('CD').asInteger := frmPatrocinadora.CodPessoa;
     end;
   except end;
  // Passa os Parâmetros necessários
  // Se for Contato de uma Entidade de Previdência
  try
   if (frmEntidadePrevidencia <> nil) and (frmEntidadePrevidencia.CodPessoa <> 0) then
    if frmEntidadePrevidencia.QryPrincipal.State = dsBrowse then
     begin
      CodP := frmEntidadePrevidencia.CodPessoa;
      qryPrincipal.ParamByName('CD').asInteger := frmEntidadePrevidencia.CodPessoa;
     end; 
   except end;

  inherited;
end;

procedure TfrmContatos.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('SQ_PESSOA_CONTATO',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

end.
