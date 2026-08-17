unit FCadGrupoContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastro, CmEventosCadastro, cmseldlg, wwDialog, wwidlg, ImgList, Db,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, DBCtrls, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids, DBGrids, DBTables,
  Wwquery;

type
  TfrmCadGrupoContabil = class(TfrmCadastro)
    DBGrdGrupo: TDBGrid;
    QryPrincipal: TwwQuery;
    UpdtSQLPrincipal: TUpdateSQL;
    QryMaxCodGrupo: TwwQuery;
    QryMaxCodGrupoMAX_COD: TFloatField;
    QryPrincipalDS_GRUPO_CONTABIL: TStringField;
    QryPrincipalCD_GRUPO_CONTABIL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryPrincipalAfterPost(DataSet: TDataSet);
    procedure QryPrincipalBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadGrupoContabil: TfrmCadGrupoContabil;

implementation
{$R *.DFM}

procedure TfrmCadGrupoContabil.FormCreate(Sender: TObject);
begin
  QryPrincipal.Open;

  inherited;
end;

procedure TfrmCadGrupoContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  QryPrincipal.Close;

  inherited;
end;

procedure TfrmCadGrupoContabil.QryPrincipalAfterPost(DataSet: TDataSet);
begin
  QryPrincipal.ApplyUpdates;
  QryPrincipal.CommitUpdates;
end;

procedure TfrmCadGrupoContabil.QryPrincipalBeforePost(DataSet: TDataSet);
begin
  if Trim(QryPrincipalDS_GRUPO_CONTABIL.asString) = '' then
   begin
     MessageDlg('Informe o nome do Grupo.', mtWarning, [mbOk], 0);
     QryPrincipalDS_GRUPO_CONTABIL.FocusControl;
     Abort;
   end;

  if QryPrincipal.State = dsInsert then
   Try
     QryMaxCodGrupo.Close;
     QryMaxCodGrupo.Open;

     QryPrincipalCD_GRUPO_CONTABIL.asInteger := (QryMaxCodGrupoMAX_COD.asInteger + 1);
   Finally
     QryMaxCodGrupo.Close;
   End;
end;

end.
