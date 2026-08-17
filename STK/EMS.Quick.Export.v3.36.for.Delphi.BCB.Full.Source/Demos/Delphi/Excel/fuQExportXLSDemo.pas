unit fuQExportXLSDemo;

interface

uses
  Forms, StdCtrls, Grids, DBGrids, Controls, ExtCtrls, QExport3, QExport3XLS,
  Db, Classes, DBTables, SysUtils, ComCtrls, Dialogs;

type
  TForm1 = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    QExportXLS1: TQExport3XLS;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    tshDataSet: TTabSheet;
    tshDBGrid: TTabSheet;
    tshListView: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    tshStringGrid: TTabSheet;
    ListView1: TListView;
    StringGrid1: TStringGrid;
    gbExportedSheets: TGroupBox;
    chDataSet: TCheckBox;
    chDBGrid: TCheckBox;
    chListView: TCheckBox;
    chStringGrid: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QExportXLS1GetDataParams(Sender: TObject; Sheet, Col,
      Row: Integer; Format: TxlsFormat; var FormatText: String);
    procedure QExportXLS1GetFooterParams(Sender: TObject; Sheet, Col,
      Row: Integer; Format: TxlsFormat; var S: WideString);
    procedure QExportXLS1GetHeaderParams(Sender: TObject; Sheet, Col,
      Row: Integer; Format: TxlsFormat; var S: WideString);
  private
    FFlag: boolean;
    procedure FillListViewAndStringGrid;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
  Path: string;
begin
  Path := ExtractfilePath(Application.ExeName);
  Table1.TableName := Path + 'country.db';
  Table1.Open;
  FillListViewAndStringGrid;
  QExportXLS1.FileName := Path + 'demo.xls';
  FFlag := false;

  chDataSet.Checked := QExportXLS1.Sheets[0].Exported;
  chDbGrid.Checked := QExportXLS1.Sheets[1].Exported;
  chListView.Checked := QExportXLS1.Sheets[2].Exported;
  chStringGrid.Checked := QExportXLS1.Sheets[3].Exported;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Table1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  QExportXLS1.Sheets[0].Exported := chDataSet.Checked;
  QExportXLS1.Sheets[1].Exported := chDBGrid.Checked;
  QExportXLS1.Sheets[2].Exported := chListView.Checked;
  QExportXLS1.Sheets[3].Exported := chStringGrid.Checked;
  QExportXLS1.Execute;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  PageControl1.ActivePage := tshDataSet;
end;

procedure TForm1.FillListViewAndStringGrid;
var
  i: integer;
begin
  Table1.DisableControls;
  try
    Table1.First;
    ListView1.Items.BeginUpdate;
    try
      ListView1.Items.Clear;
      i := 0;
      StringGrid1.Cells[0,0] := 'Name';
      StringGrid1.Cells[1,0] := 'Capital';
      StringGrid1.Cells[2,0] := 'Continent';
      StringGrid1.Cells[3,0] := 'Area';
      StringGrid1.Cells[4,0] := 'Population';
      while not Table1.Eof do begin
        with ListView1.Items.Add do begin
          Caption := Table1['NAME'];
          SubItems.Add(Table1['CAPITAL']);
          SubItems.Add(Table1['CONTINENT']);
          SubItems.Add(Table1.FieldByName('AREA').AsString);
          SubItems.Add(Table1.FieldByName('POPULATION').AsString);
        end;
        StringGrid1.Cells[0, i + 1] := Table1['NAME'];
        StringGrid1.Cells[1, i + 1] := Table1['CAPITAL'];
        StringGrid1.Cells[2, i + 1] := Table1['CONTINENT'];
        StringGrid1.Cells[3, i + 1] := FloatToStr(Table1.FieldByName('AREA').AsFloat / 1000);
        StringGrid1.Cells[4, i + 1] := Table1['POPULATION'];
        Table1.Next;
        Inc(i);
      end;
      Table1.First;
    finally
      ListView1.Items.EndUpdate;
    end;
  finally
    Table1.EnableControls;
  end;
end;

procedure TForm1.QExportXLS1GetDataParams(Sender: TObject; Sheet, Col,
  Row: Integer; Format: TxlsFormat; var FormatText: String);
begin
  if Sheet = 3 then begin
    if Col = 0 then
      FFlag := AnsiCompareText(StringGrid1.Cells[2, Row - 3], 'South America') = 0;
    if FFlag then begin
      Format.Fill.Background := clrGold;
      Format.Fill.Pattern := ptSolid;
    end
    else begin
      Format.Fill.Background := clrPaleBlue;
      Format.Fill.Pattern := ptSolid;
    end;
  end;
end;


procedure TForm1.QExportXLS1GetFooterParams(Sender: TObject; Sheet, Col,
  Row: Integer; Format: TxlsFormat; var S: WideString);
begin
  if Pos('EMS', S) > 0 then begin
    Format.Font.Size := 14;
    Format.Font.Color := clrOrange;
    Format.Font.Name := 'Arial Black';
    Format.Font.Style := Format.Font.Style + [xfsBold];
  end
  else begin
    Format.Font.Size := 12;
    Format.Font.Color := clrBlack;
    Format.Font.Name := 'Arial';
    Format.Font.Style := Format.Font.Style + [xfsBold];
  end;
end;

procedure TForm1.QExportXLS1GetHeaderParams(Sender: TObject; Sheet, Col,
  Row: Integer; Format: TxlsFormat; var S: WideString);
begin
  if Pos('www', S) > 0 then begin
    Format.Font.Color := clrBlue;
    Format.Font.Underline := fulSingle;
    Format.Alignment.Horizontal := halLeft;
  end
  else if Pos('Welcome', S) > 0 then begin
    Format.Alignment.Horizontal := halRight;
  end else begin
    Format.Font.Color := clrBlack;
    Format.Font.Underline := fulNone;
    Format.Alignment.Horizontal := halLeft;
  end;
end;

end.
