{===============================================================================
Unit    :  FCadTbGrauInstrucao
Form    :  frmCadTbGrauInstrucao

Autor   : Rômulo Coriolano de Melo
Empresa : Fórmula Informática Ltda.

Data    : 13/07/2000

Objetivo: Cadastrar os Graus de Instrução

Propriedades Publicadas:
Métodos Publicos:
Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------

================================================================================}
unit FCadTbGrauInstrucao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, Db, DBTables, Wwquery, StdCtrls, Mask, DBCtrls, cmseldlg,
  wwidlg, Wwdatsrc, IvDictio, IvMulti, IvEMulti, TB97Ctls, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, MontaSelect, CmEventosCadastro,
  wwDialog, ImgList;

type
  TfrmCadTbGrauInstrucao = class(TfrmCadastro)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    qryAux: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryPrincipal: TwwQuery;
    QryPrincipalCD_GRAU_INSTRUCAO: TFloatField;
    QryPrincipalDS_GRAU_INSTRUCAO: TStringField;
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
  frmCadTbGrauInstrucao: TfrmCadTbGrauInstrucao;
  WidReg: Integer;

implementation

{$R *.DFM}

procedure TfrmCadTbGrauInstrucao.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbGrauInstrucao.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbGrauInstrucao.FormShow(Sender: TObject);
begin
  inherited;
  qryPrincipal.Open;
end;

procedure TfrmCadTbGrauInstrucao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPrincipal.Close;
end;

procedure TfrmCadTbGrauInstrucao.QryPrincipalBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_GRAU_INSTRUCAO').AsInteger :=
             (qryAux.FieldByName('Max_CD').asInteger + 1);
     qryAux.Close;
   end;//if sBtnInserir.down

  wIdReg := 0;
  if qryPrincipal.State = dsInsert Then
    wIdReg := Qryprincipal.FieldByName('CD_GRAU_INSTRUCAO').AsInteger;
end;

procedure TfrmCadTbGrauInstrucao.QryPrincipalAfterPost(
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

procedure TfrmCadTbGrauInstrucao.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  qryPrincipal.ApplyUpdates;
  qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbGrauInstrucao.bbtnConfirmarClick(Sender: TObject);
begin
  if trim(DBEdit1.text) = '' then
   begin
    ShowMessage('Informe o Grau de Instrução !');
    DBEdit1.SetFocus;
    exit;
   end;
  inherited;
  DBEdit1.SetFocus;
end;

procedure TfrmCadTbGrauInstrucao.QryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_GRAU_INSTRUCAO',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbGrauInstrucao.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_GRAU_INSTRUCAO', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;   
end;

end.
