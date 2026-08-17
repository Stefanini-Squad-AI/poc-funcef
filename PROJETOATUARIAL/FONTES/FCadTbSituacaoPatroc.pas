{===============================================================================
Unit    :  FCadTbSituacaoPatroc
Form    :  frmCadTbSituacaoPatroc

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 05/09/2000

Objetivo: Cadastrar Situações das Patrocinadoras

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbSituacaoPatroc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, DBTables, Db, Wwquery, cmseldlg, wwidlg, Wwdatsrc, IvDictio,
  IvMulti, IvEMulti, TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Mask, MontaSelect, CmEventosCadastro, wwDialog,
  ImgList;

type
  TfrmCadTbSituacaoPatroc = class(TfrmCadastro)
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    qryAux: TwwQuery;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    QryPrincipalCD_SITUACAO_PATROC: TFloatField;
    QryPrincipalDS_SITUACAO_PATROC: TStringField;
    MontaSelect: TMontaSelect;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure sbtnApagarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure QryPrincipalAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTbSituacaoPatroc: TfrmCadTbSituacaoPatroc;
  wIdReg: Integer;

implementation

{$R *.DFM}

procedure TfrmCadTbSituacaoPatroc.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbSituacaoPatroc.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbSituacaoPatroc.QryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_SITUACAO_PATROC').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;

  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_SITUACAO_PATROC').AsInteger;
end;

procedure TfrmCadTbSituacaoPatroc.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadTbSituacaoPatroc.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbSituacaoPatroc.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe a Situação da Patrocinadora !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbSituacaoPatroc.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_SITUACAO_PATROC',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbSituacaoPatroc.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbSituacaoPatroc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbSituacaoPatroc.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_SITUACAO_PATROC', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
