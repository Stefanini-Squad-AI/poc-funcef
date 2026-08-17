unit RCursos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RSimples, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, Wwquery, Wwtable,
  IvDictio, IvMulti, IvEMulti;

type
  TrelCursos = class(TrelSimples)
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;

    qrbDescricao: TQRChildBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRExpr1: TQRExpr;
    qrdbDescricao: TQRDBText;
    tblCurso: TwwTable;
    qryCurso: TwwQuery;

    procedure FormCreate(Sender: TObject);
    procedure qryCursoFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure qrbDescricaoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  relCursos: TrelCursos;

implementation

uses FSelRelCurso;

{$R *.DFM}



procedure TrelCursos.FormCreate(Sender: TObject);
begin
  inherited;
  qrbDescricao.Enabled := (frmSelRelCurso.rgImprDescr.ItemIndex = 0);
  qryCurso.Filtered := (frmSelRelCurso.rgSelTudo.ItemIndex = 1);
  qryCurso.SQL.Clear;
  qryCurso.SQL.Add('Select IDCURSO,DESCRICAO,ABREV,CODGRPTREIN from CURSO');
  if  (frmSelRelCurso.rgSequencia.ItemIndex = 1)  then
      qryCurso.SQL.Add(' order by DESCRICAO')
  else
      qryCurso.SQL.Add(' order by IDCURSO');

  qryCurso.Open;
  tblCurso.Open;
end;

procedure TrelCursos.qryCursoFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
var
  I : Integer;
begin
  inherited;
     Accept := False;
     for  I := 0 to (frmSelRelCurso.lstGrupo.Items.Count - 1) do begin
          if frmSelRelCurso.lstGrupo.Items[I] = ''  then  break;
          if frmSelRelCurso.lstCodGrupo.Items[I] =
             qryCurso.FieldByName('CODGRPTREIN').Value  then begin
             Accept := True;
             break;
          end;
     end;
end;


procedure TrelCursos.qrbDescricaoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  tblCurso.FindKey([qryCurso.FieldByName('IDCURSO').Value]);
end;

end.
