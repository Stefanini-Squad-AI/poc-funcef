unit fuQExportDialogDemo;

interface

uses
  Forms, QExport3Dialog, Db, DBTables, Grids, ComCtrls, DBGrids, StdCtrls,
  Classes, Controls, ExtCtrls, SysUtils, QExport3, Dialogs;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    PageControl1: TPageControl;
    tshDataSet: TTabSheet;
    tshListView: TTabSheet;
    tshDBGrid: TTabSheet;
    DBGrid1: TDBGrid;
    ListView1: TListView;
    DBGrid2: TDBGrid;
    tshStringGrid: TTabSheet;
    StringGrid1: TStringGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    QExportDialog1: TQExport3Dialog;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    procedure FillListView;
    procedure FillStringGrid;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

const
  DataArray: array[0..4, 0..4] of string =
    (('1', 'ALEX', '01.05.1974', '270.36', 'true'),
     ('2', 'MARIA', '14.03.1977', '199.95', 'false'),
     ('3', 'MARK', '15.06.1976', '154.55', 'true'),
     ('4', 'JOHN', '22.08.1979', '400.12', 'true'),
     ('5', 'HELEN', '09.08.1974', '414.63', 'false'));

procedure TForm1.FormCreate(Sender: TObject);
var
  n: integer;
begin
  FillListView;
  FillStringGrid;

  Session.GetDatabaseNames(ComboBox1.Items);
  if ComboBox1.Items.Count > 0 then begin
    n := ComboBox1.Items.IndexOf('DBDEMOS');
    if n > -1 then
      ComboBox1.ItemIndex := n
    else begin
      n := ComboBox1.Items.IndexOf('BCDEMOS');
      if n > -1 then ComboBox1.ItemIndex := n
      else ComboBox1.ItemIndex := 0;
    end;
    ComboBox1.OnChange(nil);
  end;

  QExportDialog1.FileName := ExtractFilePath(Application.ExeName) + 'demo.xls';
  PageControl1.ActivePage := tshDataSet;
  PageControl1.OnChange(nil);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if Table1.Active then Table1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if PageControl1.ActivePage = tshDataSet
    then QExportDialog1.ExportSource := esDataSet
    else if PageControl1.ActivePage = tshDBGrid
         then QExportDialog1.ExportSource := esDBGrid
         else if PageControl1.ActivePage = tshListView
              then QExportDialog1.ExportSource := esListView
              else if PageControl1.ActivePage = tshStringGrid
                   then QExportDialog1.ExportSource := esStringGrid;

  QExportDialog1.Execute;
end;

procedure TForm1.FillListView;
var
  I, J: Integer;
begin
  with ListView1.Items do
    for I := 0 to 4 do
      with Add do begin
        Caption := DataArray[I,0];
        for J := 1 to 4 do
          SubItems.Add(DataArray[I,J]);
      end;
end;

procedure TForm1.FillStringGrid;
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
      for J := 0 to 4 do
        Cells[J, I + 1] := DataArray[I, J];
  end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
var
  Index1, Index2: Integer;
begin
  if (PageControl1.ActivePage = tshDataSet) or
     (PageControl1.ActivePage = tshDBGrid) then begin
    Index1 := ComboBox1.ItemIndex;
    Index2 := ComboBox2.ItemIndex;
    if PageControl1.ActivePage = tshDataSet then
      Panel2.Parent := tshDataSet
    else Panel2.Parent := tshDBGrid;
    ComboBox1.ItemIndex := Index1;
    ComboBox2.ItemIndex := Index2;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Session.GetTableNames(ComboBox1.Text, '', True, False, ComboBox2.Items);
  if ComboBox2.Items.Count > 0 then
    ComboBox2.ItemIndex := 0;
  ComboBox2.OnChange(nil);
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  if Table1.Active then Table1.Close;
  if ComboBox2.ItemIndex > -1 then begin
    if Table1.Active then Table1.Close;
    Table1.DatabaseName := ComboBox1.Text;
    Table1.TableName := ComboBox2.Text;
    try
      Table1.Open;
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
  end;
end;

end.
