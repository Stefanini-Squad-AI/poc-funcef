unit fuCustomSourceDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, QExport3CustomSource, Grids, QExport3, QExport3XLS;

type
  TfmCustomSourceDemo = class(TForm)
    paTop: TPanel;
    Label1: TLabel;
    qeCustomSource1: TqeCustomSource;
    StringGrid1: TStringGrid;
    paButtons: TPanel;
    buExport: TButton;
    QExport3XLS1: TQExport3XLS;
    procedure buExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qeCustomSource1GetColumnValue(Sender: TObject;
      RecNo: Integer; Column: TqeCustomColumn; var Value: Variant);
    procedure qeCustomSource1GetNextRecord(Sender: TObject; RecNo: Integer;
      var Eof: Boolean);
  private
    procedure FillStringGrid;
  public
    { Public declarations }
  end;

var
  fmCustomSourceDemo: TfmCustomSourceDemo;

implementation

{$R *.DFM}

const
  DataArray: array[0..4, 0..4] of string =
    (('1', 'ALEX', '01.05.1974', '270.36', 'true'),
     ('2', 'MARIA', '14.03.1977', '199.95', 'false'),
     ('3', 'MARK', '15.06.1976', '154.55', 'true'),
     ('4', 'JOHN', '22.08.1979', '400.12', 'true'),
     ('5', 'HELEN', '09.08.1974', '414.63', 'false'));

procedure TfmCustomSourceDemo.buExportClick(Sender: TObject);
begin
  qeCustomSource1.Eof := false;
  QExport3XLS1.Execute;
end;

procedure TfmCustomSourceDemo.FillStringGrid;
var
  I, J: Integer;
begin
  with StringGrid1 do begin
    Cells[0, 0] := 'CODE';
    Cells[1, 0] := 'NAME';
    Cells[2, 0] := 'DATE';
    Cells[3, 0] := 'SALARY';
    Cells[4, 0] := 'IS_MALE';

    for I := 0 to 4 do
      for J := 0 to 4 do begin
        Cells[J, I + 1] := DataArray[I, J];
        if J = 3 then                                                                       
          Cells[J, I + 1] := StringReplace(Cells[J, I + 1], '.',
            SysUtils.DecimalSeparator, [rfReplaceAll, rfIgnoreCase]);
      end;
  end;
end;

procedure TfmCustomSourceDemo.FormCreate(Sender: TObject);
begin
  QExport3XLS1.FileName := ExtractFilePath(Application.ExeName) + 'CustomSourceDemo.xls';
  FillStringGrid;
end;

procedure TfmCustomSourceDemo.qeCustomSource1GetColumnValue(
  Sender: TObject; RecNo: Integer; Column: TqeCustomColumn;
  var Value: Variant);
begin
  if Column.Index = 3 then
    Value := StringReplace(DataArray[RecNo - 1, Column.Index], '.',
            SysUtils.DecimalSeparator, [rfReplaceAll, rfIgnoreCase])
  else Value := DataArray[RecNo - 1, Column.Index];
end;

procedure TfmCustomSourceDemo.qeCustomSource1GetNextRecord(Sender: TObject;
  RecNo: Integer; var Eof: Boolean);
begin
  Eof := RecNo = 5; 
end;

end.
