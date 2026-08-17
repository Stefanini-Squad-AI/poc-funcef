{===============================================================================
Unit    :  FCadTbSituacaoFund
Form    :  frmCadTbSituacaoFund

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 05/09/2000

Objetivo: Cadastrar Situações das Fundações

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbSituacaoFund;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, DBTables, Wwquery, MontaSelect, CmEventosCadastro, wwDialog,
  ImgList;

type
  TfrmCadTbSituacaoFund = class(TfrmCadastro)
    qryAux: TwwQuery;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    QryPrincipalCD_SITUACAO_FUNDACAO: TFloatField;
    QryPrincipalDS_SITUACAO_FUNDACAO: TStringField;
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
  frmCadTbSituacaoFund: TfrmCadTbSituacaoFund;
  WidReg: Integer;

implementation

{$R *.DFM}

procedure TfrmCadTbSituacaoFund.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbSituacaoFund.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbSituacaoFund.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_SITUACAO_FUNDACAO').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;

  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_SITUACAO_FUNDACAO').AsInteger;
end;

procedure TfrmCadTbSituacaoFund.QryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadTbSituacaoFund.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbSituacaoFund.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe a Situação da Fundação !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbSituacaoFund.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_SITUACAO_FUNDACAO',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbSituacaoFund.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbSituacaoFund.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbSituacaoFund.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_SITUACAO_FUNDACAO', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
