unit FCadTbTipoGrupoDado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, cmseldlg, wwidlg, Db, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  TB97Ctls, DBCtrls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Mask, DBTables, Wwquery, MontaSelect, CmEventosCadastro, wwDialog,
  ImgList;

type
  TfrmCadTbTipoGrupoDado = class(TfrmCadastro)
    Label6: TLabel;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    qryPrincipal: TwwQuery;
    UpdtSQLTipoGrupoDado: TUpdateSQL;
    qryAux: TwwQuery;
    MontaSelect: TMontaSelect;
    procedure sbtnInserirClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure qryPrincipalAfterPost(DataSet: TDataSet);
    procedure qryPrincipalAfterDelete(DataSet: TDataSet);
    procedure qryPrincipalAfterOpen(DataSet: TDataSet);
    procedure qryPrincipalBeforePost(DataSet: TDataSet);
    procedure sbtnProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTbTipoGrupoDado: TfrmCadTbTipoGrupoDado;
  WidReg: Integer;

implementation

{$R *.DFM}

procedure TfrmCadTbTipoGrupoDado.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbTipoGrupoDado.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  DbEdit1.SetFocus;
end;

procedure TfrmCadTbTipoGrupoDado.qryPrincipalAfterPost(DataSet: TDataSet);
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

procedure TfrmCadTbTipoGrupoDado.qryPrincipalAfterDelete(
  DataSet: TDataSet);
begin
   inherited;
   qryPrincipal.ApplyUpdates;
   qryPrincipal.CommitUpdates;
end;

procedure TfrmCadTbTipoGrupoDado.qryPrincipalAfterOpen(DataSet: TDataSet);
begin
  QryPrincipal.DisableControls;
  If wIdReg > 0 Then
     Begin
       Qryprincipal.Locate('CD_GRUPO',wIdReg,[]);
       wIdReg := 0;
     End;
  QryPrincipal.EnableControls;
end;

procedure TfrmCadTbTipoGrupoDado.qryPrincipalBeforePost(DataSet: TDataSet);
begin

  wIdReg := 0;

  // Caso Botao Incluir Cria Novo Registro
  If SBtnInserir.Down Then
   begin
     qryAux.Open;
     QryPrincipal.FieldByName('CD_GRUPO').AsInteger :=
     qryAux.FieldByName('CD_GRUPO').asInteger + 1;
     qryAux.Close;
     wIdReg := Qryprincipal.FieldByName('CD_GRUPO').AsInteger;
   end;

end;

procedure TfrmCadTbTipoGrupoDado.sbtnProcurarClick(Sender: TObject);
begin
  MontaSelect.Executar;

  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
   QryPrincipal.Locate('CD_GRUPO_LOGICO', MontaSelect.ValoresChave[0], []);

  sbtnProcurar.Down := False;
end;

end.
