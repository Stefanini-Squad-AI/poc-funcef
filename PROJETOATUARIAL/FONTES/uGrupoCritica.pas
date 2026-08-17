{===============================================================================
Unit    :  uGrupoCritica
Form    :  frmGrupoCritica

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 07/08/2000

Objetivo: Cadastrar Grupos de Crítica.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit uGrupoCritica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, StdCtrls, DBCtrls, wwdblook, Mask, cmseldlg, wwidlg, Db,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn, Buttons,
  TB97Tlbr, TB97, ExtCtrls, DBTables, Wwquery, CmEventosCadastro, wwDialog,
  ImgList;

type
  TfrmGrupoCritica = class(TfrmCadastro)
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBLkTipoGrupo: TwwDBLookupCombo;
    Label2: TLabel;
    DBMemocondicao: TDBMemo;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    qryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryTipoGrupoPartic: TwwQuery;
    qryTipoGrupoParticNO_GRUPO_PARTIC: TStringField;
    qryTipoGrupoParticCD_GRUPO_PARTIC: TFloatField;
    qryTipoGrupoParticDS_CONDICAO_EQUADRAMENTO: TMemoField;
    qryTipoGrupoParticDS_SQL_ENQUADRAMENTO: TMemoField;
    dsTipoGrupoPartic: TDataSource;
    qryPrincipalCD_GRUPO_PARTIC: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryPrincipalNR_ORDEM: TFloatField;
    qryPrincipalNO_GRUPO_PARTIC: TStringField;
    qryCondicao: TwwQuery;
    qryCondicaoDS_CONDICAO_EQUADRAMENTO: TMemoField;
    dsCondicao: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbnavClick(Sender: TObject; Button: TNavigateBtn);
    procedure DBLkTipoGrupoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrupoCritica: TfrmGrupoCritica;
  wIdReg: Integer;

implementation

uses uGlobal, FTelaAut, uVersaoBase;

{$R *.DFM}

procedure TfrmGrupoCritica.FormCreate(Sender: TObject);
begin
  if uGlobal.WG_CD_VERSAO = 0 then
   begin
     MessageDlg('Selecione uma Versão da Base de Trabalho !',
        mtWarning, [mbOk], 0);
     AbrirForm(frmVersaoBase,TfrmVersaoBase,False );
     close;
     exit;
   end
  else
   begin
     qryPrincipal.Close;
     qryPrincipal.ParamByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
     qryPrincipal.ParamByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
     qryPrincipal.ParamByName('CD_PLANO').asinteger := WG_CD_PLANO;
   end;  
  inherited;
  qryTipoGrupoPartic.Open;

  qryCondicao.Open;

  if DBEdit1.Text = '' then
    DBMemoCondicao.Text := '';
end;

procedure TfrmGrupoCritica.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBLkTipoGrupo.Visible := true;
  DBEdit1.Visible := false;
  DBLkTipoGrupo.Text := '';
  DBMemoCondicao.Text := '';
  DBEdit2.SetFocus;
end;

procedure TfrmGrupoCritica.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBLkTipoGrupo.Visible := true;
  DBEdit1.Visible := false;
  DBLkTipoGrupo.Text := DBEdit1.Text;  
  DBLkTipoGrupo.Enabled := false;
  DBEdit2.SetFocus;
end;

procedure TfrmGrupoCritica.bbtnConfirmarClick(Sender: TObject);
begin
  if  trim(DBLkTipoGrupo.Text) = '' then
   begin
    ShowMessage('Campo Obrigatório não Preenchido !');
    DBLkTipoGrupo.SetFocus;
    exit;
   end;
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmGrupoCritica.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  DBLkTipoGrupo.Visible := false;
  DBEdit1.Visible := true;
  DBLkTipoGrupo.Enabled := true;
end;

procedure TfrmGrupoCritica.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;

  if DBEdit1.Text = '' then
    DBMemoCondicao.Text := '';
end;

procedure TfrmGrupoCritica.qryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PESSOA_PATROC').asinteger := WG_CD_PESSOA_PATROC;
    qryPrincipal.FieldByName('CD_PESSOA_ENTID').asinteger := WG_CD_PESSOA_ENTID;
    qryPrincipal.FieldByName('CD_PLANO').asinteger := WG_CD_PLANO;
    qryPrincipal.FieldByName('CD_GRUPO_PARTIC').asinteger :=
                   qryTipoGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
   end;

  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := qryPrincipal.FieldByName('CD_GRUPO_PARTIC').asinteger;
end;

procedure TfrmGrupoCritica.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmGrupoCritica.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  qryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       qryPrincipal.Locate('CD_GRUPO_PARTIC',wIdReg,[]);
       wIdReg := 0;
     End;
  qryPrincipal.EnableControls;
end;

procedure TfrmGrupoCritica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryTipoGrupoPartic.Close;
end;

procedure TfrmGrupoCritica.dbnavClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  qryCondicao.Close;
  qryCondicao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                 qryPrincipal.FieldByName('CD_GRUPO_PARTIC').asInteger;
  qryCondicao.Open;
end;

procedure TfrmGrupoCritica.DBLkTipoGrupoChange(Sender: TObject);
begin
  qryCondicao.Close;
  qryCondicao.ParamByName('CD_GRUPO_PARTIC').asInteger :=
                 qryTipoGrupoPartic.FieldByName('CD_GRUPO_PARTIC').asInteger;
  qryCondicao.Open;
end;

end.
