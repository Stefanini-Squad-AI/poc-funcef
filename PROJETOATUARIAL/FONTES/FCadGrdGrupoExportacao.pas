{===============================================================================
Unit    :  FCadGrdGrupoExportacao
Form    :  frmCadGrdGrupoExportacao

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 27/09/2000

Objetivo: Cadastrar Grupos de Exportação de um Participante.

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadGrdGrupoExportacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGrid, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti,
  IvEMulti, TB97Ctls, MAHlpBtn, DBCtrls, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, DBTables, Wwquery, wwdblook,
  CmEventosCadastro, wwDialog, ImgList;

type    
  TfrmCadGrdGrupoExportacao = class(TfrmCadastroGrid)
    qryPrincipal: TwwQuery;
    qryGExportacao: TwwQuery;
    LkcTbGExport: TwwDBLookupCombo;
    Label4: TLabel;
    qryPrincipalCD_VERSAO: TFloatField;
    qryPrincipalCD_PARTIC: TFloatField;
    qryPrincipalCD_GRUPO_PARTIC: TFloatField;
    qryPrincipalCD_PESSOA_PATROC: TFloatField;
    qryPrincipalCD_PESSOA_ENTID: TFloatField;
    qryPrincipalCD_PLANO: TFloatField;
    qryGExportacaoCD_GRUPO_PARTIC: TFloatField;
    qryGExportacaoCD_PESSOA_PATROC: TFloatField;
    qryGExportacaoCD_PESSOA_ENTID: TFloatField;
    qryGExportacaoCD_PLANO: TFloatField;
    qryGExportacaoNR_ORDEM: TFloatField;
    qryGExportacaoNO_GRUPO_PARTIC: TStringField;
    qryPrincipalNO_GRUPO_PARTIC: TStringField;
    UpdtSQLPrincipal: TUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    wIdReg: Integer;    
  end;

var
  frmCadGrdGrupoExportacao: TfrmCadGrdGrupoExportacao;

implementation

uses fParticipante;

{$R *.DFM}

procedure TfrmCadGrdGrupoExportacao.FormCreate(Sender: TObject);
begin

  qryPrincipal.Close;
  qryPrincipal.ParamByName('CD_VERSAO').asInteger :=
                                frmParticipante.qryPrincipal.FieldByName('CD_VERSAO').asInteger;
  qryPrincipal.ParamByName('CD_PARTIC').asInteger :=
                                frmParticipante.qryPrincipal.FieldByName('CD_PARTIC').asInteger;
  qryPrincipal.Open;

  inherited;
  qryGExportacao.Open;
end;

procedure TfrmCadGrdGrupoExportacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryGExportacao.Close;
end;

procedure TfrmCadGrdGrupoExportacao.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(LkcTbGExport.Text) = '' then
   begin
     ShowMessage('Informe o Grupo de Exportação');
     LkcTbGExport.SetFocus;
     exit;
   end;
  inherited;
  bbtnCancelar.Click;
end;

procedure TfrmCadGrdGrupoExportacao.sbtnApagarClick(Sender: TObject);
begin
  try
    inherited;
    qryPrincipal.ApplyUpdates;
    qryPrincipal.CommitUpdates;
  except
    bbtnCancelar.Click;
  end;  
end;

procedure TfrmCadGrdGrupoExportacao.qryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if SBtnInserir.Down then
   begin
    qryPrincipal.FieldByName('CD_PARTIC').AsInteger :=
                        qryPrincipal.ParamByName('CD_PARTIC').asInteger;
    qryPrincipal.FieldByName('CD_VERSAO').asInteger :=
                        qryPrincipal.ParamByName('CD_VERSAO').asInteger;
    qryPrincipal.FieldByName('CD_GRUPO_PARTIC').asInteger :=
                        qryGExportacao.FieldByName('CD_GRUPO_PARTIC').asInteger;
    qryPrincipal.FieldByName('CD_PESSOA_PATROC').AsInteger :=
                        qryGExportacao.FieldByName('CD_PESSOA_PATROC').asInteger;
    qryPrincipal.FieldByName('CD_PESSOA_ENTID').asInteger :=
                        qryGExportacao.FieldByName('CD_PESSOA_ENTID').asInteger;
    qryPrincipal.FieldByName('CD_PLANO').AsInteger :=
                        qryGExportacao.FieldByName('CD_PLANO').asInteger;
   end
  else if SBtnAlterar.Down then
   qryPrincipal.FieldByName('CD_GRUPO_PARTIC').asInteger :=
                        qryGExportacao.FieldByName('CD_GRUPO_PARTIC').asInteger;

  wIdReg := 0;
  wIdReg := Qryprincipal.FieldByName('CD_PARTIC').AsInteger;
end;

procedure TfrmCadGrdGrupoExportacao.qryPrincipalAfterPost(
  DataSet: TDataSet);
begin
  try
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
   qryPrincipal.Close;
   qryPrincipal.Open;
  except
   bbtnCancelar.Click;
   exit;
  end;
end;

procedure TfrmCadGrdGrupoExportacao.qryPrincipalAfterOpen(
  DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
    Qryprincipal.Locate('CD_PARTIC',wIdReg,[]);
  QryPrincipal.EnableControls;
end;

end.
