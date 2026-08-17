unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, ExtCtrls, dxdborgc, dxorgchr, ComCtrls,
  Menus, StdCtrls, Spin;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Options1: TMenuItem;
    Exit1: TMenuItem;
    AddNode1: TMenuItem;
    AddChildeNode1: TMenuItem;
    RenameNode1: TMenuItem;
    DeleteNode1: TMenuItem;
    PC: TPageControl;
    tsTree: TTabSheet;
    tsDBTree: TTabSheet;
    Tree: TdxOrgChart;
    DBGrid1: TDBGrid;
    Table1: TTable;
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    DBTree: TdxDbOrgChart;
    TreeLarge: TImageList;
    ItZoom: TMenuItem;
    ItRotated: TMenuItem;
    ItAnimated: TMenuItem;
    It3D: TMenuItem;
    N1: TMenuItem;
    ItFullExpand: TMenuItem;
    ItFullCollapse: TMenuItem;
    Panel1: TPanel;
    ColorDialog: TColorDialog;
    Table1ID: TAutoIncField;
    Table1PARENT: TIntegerField;
    Table1NAME: TStringField;
    Table1CDATE: TDateField;
    Table1CBY: TStringField;
    Table1WIDTH: TIntegerField;
    Table1HEIGHT: TIntegerField;
    Table1TYPE: TStringField;
    Table1COLOR: TIntegerField;
    Table1IMAGE: TIntegerField;
    Table1IMAGEALIGN: TStringField;
    Table1ORDER: TIntegerField;
    Table1ALIGN: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    NameEdit: TEdit;
    seWidth: TSpinEdit;
    seHeight: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbShape: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    seImageIndex: TSpinEdit;
    Label7: TLabel;
    cbImageAlignment: TComboBox;
    cbAlign: TComboBox;
    Label8: TLabel;
    PColor: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure AddNode1Click(Sender: TObject);
    procedure AddChildeNode1Click(Sender: TObject);
    procedure RenameNode1Click(Sender: TObject);
    procedure DeleteNode1Click(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure ItZoomClick(Sender: TObject);
    procedure ItRotatedClick(Sender: TObject);
    procedure ItAnimatedClick(Sender: TObject);
    procedure It3DClick(Sender: TObject);
    procedure ItFullExpandClick(Sender: TObject);
    procedure ItFullCollapseClick(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBTreeCreateNode(Sender: TObject; Node: TdxOcNode);
    procedure Table1AfterInsert(DataSet: TDataSet);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure Table1TYPEChange(Sender: TField);
    procedure Table1ALIGNChange(Sender: TField);
    procedure Table1IMAGEALIGNChange(Sender: TField);
    procedure TreeChanging(Sender: TObject; Node: TdxOcNode;
      var Allow: Boolean);
    procedure NameEditChange(Sender: TObject);
    procedure PColorClick(Sender: TObject);
    procedure TreeCreateNode(Sender: TObject; Node: TdxOcNode);
  private
    { Private declarations }
    FChange : Boolean;
  public
    { Public declarations }
    function GetShape(ShapeName : String) : TdxOcShape;
    function GetNodeAlign(AlignName : String) : TdxOcNodeAlign;
    function GetImageAlign(AlignName : String) : TdxOcImageAlign;
  end;

var
  MainForm: TMainForm;

implementation

uses Options;

{$R *.DFM}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Table1.Close;
  Table1.DataBaseName := ExtractFilePath(Application.ExeName);
  Table1.Open;
  DBTree.WidthFieldName  := 'Width';
  DBTree.HeightFieldName := 'Height';
  PCChange(PC);
  FChange := True;
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.AddNode1Click(Sender: TObject);
var
  Node : TdxOcNode;
begin
  if PC.ActivePage = tsDBTree then begin
    Table1.DisableControls;
    if (DBTree.Selected <> nil) then
      Node := DBTree.Insert(DBTree.Selected, Nil)
    else Node := DBTree.Add(nil, nil);
    Node.Text := 'New topic';
    Node.Color := clWhite;
    Node.Shape := shRectangle;
    DBTree.Selected := Node;
    Table1.EnableControls;
  end;

  if PC.ActivePage = tsTree then begin
    if (Tree.Selected <> nil) then
      Node := Tree.Insert(Tree.Selected, Nil)
    else Node := Tree.Add(nil, nil);
    Node.Text := 'New topic';
    Node.Color := clWhite;
    Node.Shape := shRectangle;
    Tree.Selected := Node;
  end;

end;

procedure TMainForm.AddChildeNode1Click(Sender: TObject);
var
  Node : TdxOcNode;
begin
  if PC.ActivePage = tsTree then begin
    Table1.DisableControls;
    if (Tree.Selected <> nil) then
      Node := Tree.AddChild(Tree.Selected, Nil)
    else Node := Tree.Add(nil, nil);
    Node.Text := 'New topic';
    Node.Color := clWhite;
    Node.Shape := shRectangle;
    if Tree.Selected <> nil then Tree.Selected.Expanded := True;
    Tree.Selected := Node;
    Table1.EnableControls;
  end;
  if PC.ActivePage = tsDBTree then begin
    if (DBTree.Selected <> nil) then
      Node := DBTree.AddChild(DBTree.Selected, Nil)
    else Node := DBTree.Add(nil, nil);
    Node.Text := 'New topic';
    Node.Color := clWhite;
    Node.Shape := shRectangle;
    if DBTree.Selected <> nil then DBTree.Selected.Expanded := True;
    DBTree.Selected := Node;
  end;
end;

procedure TMainForm.RenameNode1Click(Sender: TObject);
begin
  if PC.ActivePage = tsTree then
    if (Tree.Selected <> nil) then
      Tree.ShowEditor;

  if PC.ActivePage = tsDBTree then
    if (DBTree.Selected <> nil) then
      DBTree.ShowEditor;
end;

procedure TMainForm.DeleteNode1Click(Sender: TObject);
begin
  if PC.ActivePage = tsTree then
    if (Tree.Selected <> nil) then
      Tree.Delete(Tree.Selected);

  if PC.ActivePage = tsDBTree then
    if (DBTree.Selected <> nil) then
      DBTree.Delete(DBTree.Selected);
end;

procedure TMainForm.PCChange(Sender: TObject);
begin
  if PC.ActivePage = tsTree then
   with Tree do begin
     ItZoom.Checked := Zoom;
     ItRotated.Checked := Rotated;
     ItAnimated.Checked := ocAnimate in Options;
     It3D.Checked := ocRect3D in Options;
  end;
  if PC.ActivePage = tsDBTree then
   with DBTree do begin
     ItZoom.Checked := Zoom;
     ItRotated.Checked := Rotated;
     ItAnimated.Checked := ocAnimate in Options;
     It3D.Checked := ocRect3D in Options;
  end;
end;

procedure TMainForm.ItZoomClick(Sender: TObject);
begin
 TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
 if PC.ActivePage = tsTree then
   Tree.Zoom := TMenuItem(Sender).Checked;
 if PC.ActivePage = tsDBTree then
   DBTree.Zoom := TMenuItem(Sender).Checked;
end;

procedure TMainForm.ItRotatedClick(Sender: TObject);
begin
 TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
 if PC.ActivePage = tsTree then
   Tree.Rotated := TMenuItem(Sender).Checked;
 if PC.ActivePage = tsDBTree then
   DBTree.Rotated := TMenuItem(Sender).Checked;
end;

procedure TMainForm.ItAnimatedClick(Sender: TObject);
begin
 TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
 if PC.ActivePage = tsTree then begin
   if TMenuItem(Sender).Checked then
     Tree.Options := Tree.Options + [ocAnimate]
   else
     Tree.Options := Tree.Options - [ocAnimate];
 end;
 if PC.ActivePage = tsDBTree then begin
   if TMenuItem(Sender).Checked then
     DBTree.Options := DBTree.Options + [ocAnimate]
   else
     DBTree.Options := DBTree.Options - [ocAnimate];
 end;

end;

procedure TMainForm.It3DClick(Sender: TObject);
begin
 TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
 if PC.ActivePage = tsTree then begin
   if TMenuItem(Sender).Checked then
     Tree.Options := Tree.Options + [ocRect3D]
   else
     Tree.Options := Tree.Options - [ocRect3D];
 end;

 if PC.ActivePage = tsDBTree then begin
   if TMenuItem(Sender).Checked then
     DBTree.Options := DBTree.Options + [ocRect3D]
   else
     DBTree.Options := DBTree.Options - [ocRect3D];
 end;

end;

procedure TMainForm.ItFullExpandClick(Sender: TObject);
begin
  if PC.ActivePage = tsTree then
    Tree.FullExpand;
  if PC.ActivePage = tsDBTree then
    DBTree.FullExpand;
end;

procedure TMainForm.ItFullCollapseClick(Sender: TObject);
begin
  if PC.ActivePage = tsTree then
    Tree.FullCollapse;
  if PC.ActivePage = tsDBTree then
    DBTree.FullCollapse;
end;

procedure TMainForm.Options1Click(Sender: TObject);
begin
 OptionsForm.ShowModal;
end;

procedure TMainForm.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.FieldName = 'COLOR' then begin
    DBGrid1.Canvas.Brush.Color := Table1.FieldByName('Color').AsInteger;
    DBGrid1.Canvas.FillRect(Rect);
  end;
end;

procedure TMainForm.DBTreeCreateNode(Sender: TObject; Node: TdxOcNode);
begin
  with Node, Table1 do
  begin
    if FindField('width').AsInteger > 50 then
      Width := FindField('width').AsInteger;
    if FindField('height').AsInteger > 50 then
      Height := FindField('height').AsInteger;
    Shape := GetShape(FindField('type').AsString);
    Color := FindField('color').AsInteger;
    Node.ChildAlign := GetNodeAlign(FindField('Align').AsString);
    Node.ImageAlign := GetImageAlign(FindField('ImageAlign').AsString);
  end;
end;

procedure TMainForm.Table1AfterInsert(DataSet: TDataSet);
begin
  with Table1, DBTree do begin
    FindField('Height').AsInteger := DefaultNodeHeight;
    FindField('Width').AsInteger := DefaultNodeWidth;
    FindField('Type').AsString := 'Rectangle';
    FindField('Color').AsInteger := clWhite;
    FindField('Image').AsInteger := -1;
    FindField('ImageAlign').AsString := 'Left-Top';
    FindField('Align').AsString := 'Center';
  end;
end;

procedure TMainForm.DBGrid1DblClick(Sender: TObject);
begin
  if TDBGrid(Sender).SelectedField.FieldName = 'COLOR' then
    if ColorDialog.Execute then
      with TDBGrid(Sender).DataSource.DataSet do begin
        Edit;
        FieldByName('COLOR').AsInteger := ColorDialog.Color;
        Post;
        DBTree.Selected.Color := ColorDialog.Color;
      end;
end;

procedure TMainForm.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    Key := 0;
    DBGrid1DblClick(Sender);
  end;
  if Key = VK_DOWN then begin
    Key := 0;
    TDBGrid(Sender).DataSource.DataSet.Next;
  end;
end;

procedure TMainForm.DBGrid1ColEnter(Sender: TObject);
begin
  with TDBGrid(Sender) do
    if SelectedField.FieldName = 'COLOR' then
      Options := Options - [dgEditing]
    else
      Options := Options + [dgEditing];

end;

function TMainForm.GetShape(ShapeName : String) : TdxOcShape;
const ShapeArray: array[0..3] of string = ('Rectange', 'Round Rect', 'Ellipse', 'Diamond');
var i : integer;
begin
  Result := TdxOcShape(0);
  for i := 0 to 3 do
    if AnsiUpperCase(ShapeArray[i]) = AnsiUpperCase(ShapeName) then  begin
      Result := TdxOcShape(i);
      break;
    end;
end;

procedure TMainForm.Table1TYPEChange(Sender: TField);
begin
  if Table1.State = dsEdit then
    DBTree.Selected.Shape := GetShape(Sender.AsString);
end;

function TMainForm.GetNodeAlign(AlignName : String) : TdxOcNodeAlign;
const AlignArray: array[0..2] of string = ('Left', 'Center', 'Right');
var i : integer;
begin
  Result := TdxOcNodeAlign(0);
  for i := 0 to 2 do
    if AnsiUpperCase(AlignArray[i]) = AnsiUpperCase(AlignName) then  begin
      Result := TdxOcNodeAlign(i);
      break;
    end;
end;


procedure TMainForm.Table1ALIGNChange(Sender: TField);
begin
  if Table1.State = dsEdit then
    DBTree.Selected.ChildAlign := GetNodeAlign(Sender.AsString);
end;

function TMainForm.GetImageAlign(AlignName : String) : TdxOcImageAlign;
const AlignArray: array[0..12] of string = (
   'None',
   'Left-Top', 'Left-Center', 'Left-Bottom',
   'Right-Top', 'Right-Center', 'Right-Bottom',
   'Top-Left', 'Top-Center', 'Top-Right',
   'Bottom-Left', 'Bottom-Center', 'Bottom-Right'
   );
var i : integer;
begin
  Result := TdxOcImageAlign(0);
  for i := 0 to 12 do
    if AnsiUpperCase(AlignArray[i]) = AnsiUpperCase(AlignName) then  begin
      Result := TdxOcImageAlign(i);
      break;
    end;
end;


procedure TMainForm.Table1IMAGEALIGNChange(Sender: TField);
begin
  if Table1.State = dsEdit then
    DBTree.Selected.ImageAlign := GetImageAlign(Sender.AsString);
end;

procedure TMainForm.TreeChanging(Sender: TObject; Node: TdxOcNode;
  var Allow: Boolean);
begin
  with Node do begin
    FChange := False;
    NameEdit.Text := Text;
    seWidth.Value := Width;
    seHeight.Value := Height;
    if Integer(Shape) < cbShape.Items.Count then
      cbShape.ItemIndex := Integer(Shape);
    seImageIndex.Value := ImageIndex;
    if Integer(ImageAlign) < cbImageAlignment.Items.Count then
      cbImageAlignment.ItemIndex := Integer(ImageAlign);
    if Integer(ChildAlign) < cbAlign.Items.Count then
      cbAlign.ItemIndex := Integer(ChildAlign);
    PColor.Color := Color;
    FChange := True;
  end;
end;

procedure TMainForm.NameEditChange(Sender: TObject);
begin
 if (Tree.Selected <> nil) and FChange then
  with Tree.Selected do begin
    Text := NameEdit.Text;
    Width := seWidth.Value;
    Height := seHeight.Value;
    Shape := TdxOcShape(cbShape.ItemIndex);
    ImageIndex := seImageIndex.Value;
    ImageAlign := TdxOcImageAlign(cbImageAlignment.ItemIndex);
    ChildAlign := TdxOcNodeAlign(cbAlign.ItemIndex);
    Color := PColor.Color;
  end;
end;

procedure TMainForm.PColorClick(Sender: TObject);
begin
  if ColorDialog.Execute then begin
    PColor.Color := ColorDialog.Color;
    NameEditChange(nil);
  end;
end;

procedure TMainForm.TreeCreateNode(Sender: TObject; Node: TdxOcNode);
begin
  with Node do begin
    Shape := shRectangle;
    Color := clWhite;
    Node.ChildAlign := caCenter;
    Node.ImageAlign := iaLT;
  end;

end;

end.
