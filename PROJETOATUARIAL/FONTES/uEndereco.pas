{===============================================================================
Unit    :  uEndereco
Form    :  frmEndereco

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar o Endereço de uma Patrocinadora ou Entidade de Previdência

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uEndereco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, DBCtrls, wwdblook, DBTables, Db, Wwquery,
  Wwdatsrc;

type
  TfrmEndereco = class(TfrmOkCancelar)
    DBEdit6: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    Label5: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    LkcTbUF: TwwDBLookupCombo;
    ds: TwwDataSource;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryUF: TwwQuery;
    qryUFCD_UF: TStringField;
    QryPrincipalCD_PESSOA: TFloatField;
    QryPrincipalNO_PESSOA: TStringField;
    QryPrincipalDS_ENDERECO: TStringField;
    QryPrincipalNR_ENDERECO: TFloatField;
    QryPrincipalDS_COMPLEMENTO: TStringField;
    QryPrincipalNO_BAIRRO: TStringField;
    QryPrincipalNO_MUNICIPIO: TStringField;
    QryPrincipalCD_UF: TStringField;
    QryPrincipalNR_CEP: TStringField;
    QryPrincipalNR_FONE_1: TStringField;
    QryPrincipalNR_FONE_2: TStringField;
    QryPrincipalNO_CORREIO_ELETRONICO: TStringField;
    QryPrincipalNO_PAGINA_WEB: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEndereco: TfrmEndereco;

implementation

uses uPatrocinadora, uEntidadePrevidencia;

{$R *.DFM}

procedure TfrmEndereco.FormShow(Sender: TObject);
begin
  if qryPrincipal.Active then
    qryPrincipal.Close;
  qryUF.Open; //abre a Query das UF's

  // Passa os Parâmetros necessários
  // Se for Endereço de uma Patrocinadora
  try
   if (frmPatrocinadora <> nil) and (frmPatrocinadora.CodPessoa <> 0) then
    if frmPatrocinadora.qryPrincipal.State = dsBrowse then
     begin
      qryPrincipal.ParamByName('CD').asInteger := frmPatrocinadora.CodPessoa;
      LkcTbUF.Text := frmPatrocinadora.QryPrincipal.FieldByName('CD_UF').asString;
     end;
   except end;
  // Passa os Parâmetros necessários
  // Se for Endereço de uma Entidade de Previdência
  try
   if (frmEntidadePrevidencia <> nil) and (frmEntidadePrevidencia.CodPessoa <> 0) then
    if frmEntidadePrevidencia.QryPrincipal.State = dsBrowse then
     begin
      qryPrincipal.ParamByName('CD').asInteger := frmEntidadePrevidencia.CodPessoa;
      LkcTbUF.Text := frmEntidadePrevidencia.QryPrincipal.FieldByName('CD_UF').asString;
     end;
   except end;

  qryPrincipal.Open; //abre a Query Principal
  qryPrincipal.Edit; //Põe no modo Edit a Query Principal
end;

procedure TfrmEndereco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
  qryUF.close;

  // Atualiza a Query Principal de Patrocinadora
  try
   if frmPatrocinadora.CodPessoa <> 0 then
    if frmPatrocinadora.QryPrincipal.Active then
     begin
       frmPatrocinadora.CodPessoa := 0;
       frmPatrocinadora.QryPrincipal.Close;
       frmPatrocinadora.QryPrincipal.Open;
     end;
   except end;
  // Atualiza a Query Principal de Entidade de Previdencia
  try
   if frmEntidadePrevidencia.CodPessoa <> 0 then
    if frmEntidadePrevidencia.QryPrincipal.Active then
     begin
       frmEntidadePrevidencia.CodPessoa := 0;
       frmEntidadePrevidencia.QryPrincipal.Close;
       frmEntidadePrevidencia.QryPrincipal.Open;
     end;
   except end;
end;

procedure TfrmEndereco.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  qryPrincipal.FieldByName('CD_UF').AsString := LkcTbUF.Text;
end;

procedure TfrmEndereco.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  try
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
  except
   bbtnCancelar.Click;
   exit;
  end;     
end;

procedure TfrmEndereco.bbtnConfirmarClick(Sender: TObject);
begin
  qryPrincipal.Post;
  bbtnSair.Click;
end;

procedure TfrmEndereco.bbtnCancelarClick(Sender: TObject);
begin
  bbtnSair.Click;
end;

end.
