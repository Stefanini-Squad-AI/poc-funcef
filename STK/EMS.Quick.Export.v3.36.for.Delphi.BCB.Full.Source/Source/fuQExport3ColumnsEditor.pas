unit fuQExport3ColumnsEditor;

interface

uses
  Windows, Classes,  Forms, Controls, StdCtrls, Buttons, ExtCtrls,
  QExport3, Db, Grids, DbGrids, ComCtrls, QExport3CustomSource, 
  {$IFDEF VCL4}ImgList,{$ENDIF} ToolWin;

type
  TfmQExport3ColumnsEditor = class(TForm)
    bOK: TBitBtn;
    bCancel: TBitBtn;
    lvAvailable: TListView;
    lvExported: TListView;
    laAvailable: TLabel;
    DstLabel: TLabel;
    Bevel1: TBevel;
    ToolBar1: TToolBar;
    ImageList: TImageList;
    tbtAddSelected: TToolButton;
    tbtAddAll: TToolButton;
    tbtDelSelected: TToolButton;
    tbtDelAll: TToolButton;
    ToolBar2: TToolBar;
    tbtMoveColumnUp: TToolButton;
    tbtMoveColumnDown: TToolButton;
    procedure lvExportedDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvExportedDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvAvailableDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lvAvailableDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tbtAddSelectedClick(Sender: TObject);
    procedure tbtAddAllClick(Sender: TObject);
    procedure tbtDelSelectedClick(Sender: TObject);
    procedure tbtDelAllClick(Sender: TObject);
    procedure lvAvailableChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvExportedChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure tbtMoveColumnUpClick(Sender: TObject);
    procedure tbtMoveColumnDownClick(Sender: TObject);
  private
    FexportSource: TQExportSource;
    FDataSet: TDataSet;
    FCustomSource: TqeCustomSource;
    FDBGrid: TDBGrid;
    FListView: TListView;
    FStringGrid: TStringGrid;
    FExportedFields: TStrings;
    procedure FillFields;
    procedure TuneImages;
    procedure ApplyChanges;
    procedure TuneButtons;
    procedure MoveListItems(Source, Destination: TListView; All: boolean;
      Index: integer);
  end;

function RunQExportColumnsEditor(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource; DBGrid: TDBGrid;
  ListView: TListView; StringGrid: TStringGrid;
  ExportedFields: TStrings): boolean;

implementation

uses QExport3Common;

{$R *.DFM}

function RunQExportColumnsEditor(ExportSource: TQExportSource;
  DataSet: TDataSet; CustomSource: TqeCustomSource; DBGrid: TDBGrid;
  ListView: TListView; StringGrid: TStringGrid;
  ExportedFields: TStrings): boolean;
begin
  with TfmQExport3ColumnsEditor.Create(Application) do
  try
    FExportSource := ExportSource;
    FDataSet := DataSet;
    FCustomSource := CustomSource;
    FDBGrid := DBGrid;
    FListView := ListView;
    FStringGrid := StringGrid;
    FExportedFields := ExportedFields;
    FillFields;
    Result := ShowModal = mrOk;
    if Result then ApplyChanges;
  finally
    Free;
  end;
end;

procedure TfmQExport3ColumnsEditor.lvExportedDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = lvAvailable;
end;

procedure TfmQExport3ColumnsEditor.lvExportedDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  MoveListItems(lvAvailable, lvExported, false, -1);
end;

procedure TfmQExport3ColumnsEditor.lvAvailableDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  MoveListItems(lvExported, lvAvailable, false, -1);
end;

procedure TfmQExport3ColumnsEditor.lvAvailableDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := Source = lvExported;
end;

procedure TfmQExport3ColumnsEditor.FillFields;
var
  AvailableColumns,
  ExportedColumns: TStringList;
  i: integer;
begin
  AvailableColumns := TStringList.Create;
  try
    ExportedColumns := TStringList.Create;
    try
      QExportGetColumns(FExportSource, FDataSet, FCustomSource, FDBGrid,
        FListView, FStringGrid, FExportedFields, AvailableColumns,
        ExportedColumns);

      lvExported.Items.BeginUpdate;
      try
        lvExported.Items.Clear;
        for i := 0 to ExportedColumns.Count - 1 do
          with lvExported.Items.Add do begin
            Caption := ExportedColumns[i];
            Data := ExportedColumns.Objects[i]
          end;
        if lvExported.Items.Count > 0 then begin
          lvExported.Items[0].Focused := true;
          lvExported.Items[0].Selected := true;
        end;
      finally
        lvExported.Items.EndUpdate;
      end;

      lvAvailable.Items.BeginUpdate;
      try
        lvAvailable.Items.Clear;
        for i := 0 to AvailableColumns.Count - 1 do
          with lvAvailable.Items.Add do begin
            Caption := AvailableColumns[i];
            Data := AvailableColumns.Objects[i];
          end;
        if lvAvailable.Items.Count > 0 then begin
          lvAvailable.Items[0].Focused := true;
          lvAvailable.Items[0].Selected := true;
        end;
      finally
        lvAvailable.Items.EndUpdate;
      end;
      TuneImages;
    finally
      ExportedColumns.Free;
    end;
  finally
    AvailableColumns.Free;
  end;
  TuneButtons;
end;

procedure TfmQExport3ColumnsEditor.TuneImages;
var
  i: integer;
begin
  lvExported.Items.BeginUpdate;
  try
    for i := 0 to lvExported.Items.Count - 1 do
      lvExported.Items[i].ImageIndex := 6;
  finally
    lvExported.Items.EndUpdate;
  end;

  lvAvailable.Items.BeginUpdate;
  try
    for i := 0 to lvAvailable.Items.Count - 1 do
      if (lvExported.Items.Count = 0) and
         (Integer(lvAvailable.Items[i].Data) = 0) then
        lvAvailable.Items[i].ImageIndex := 6
      else lvAvailable.Items[i].ImageIndex := 7;
  finally
    lvAvailable.Items.EndUpdate;
  end;
end;

procedure TfmQExport3ColumnsEditor.ApplyChanges;
var
  i: integer;
begin
  FExportedFields.Clear;
  for i := 0 to lvExported.Items.Count - 1 do
    FExportedFields.Add(lvExported.Items[i].Caption);
end;

procedure TfmQExport3ColumnsEditor.TuneButtons;
begin
  tbtAddSelected.Enabled := (lvAvailable.Items.Count > 0) and
    (lvAvailable.SelCount > 0);
  tbtAddAll.Enabled := lvAvailable.Items.Count > 0;
  tbtDelSelected.Enabled := (lvExported.Items.Count > 0) and
    (lvExported.SelCount > 0);
  tbtDelAll.Enabled := lvExported.Items.Count > 0;
  tbtMoveColumnUp.Enabled := (lvExported.Items.Count > 0) and
    Assigned(lvExported.ItemFocused) and (lvExported.ItemFocused.Index > 0);
  tbtMoveColumnDown.Enabled := (lvExported.Items.Count > 0) and
    Assigned(lvExported.ItemFocused) and
    (lvExported.ItemFocused.Index < lvExported.Items.Count - 1);
end;

procedure TfmQExport3ColumnsEditor.MoveListItems(Source,
  Destination: TListView; All: boolean; Index: integer);
var
  i, N: integer;
  List: TList;
  tmpCaption: string;
  tmpData: Pointer;
  tmpImageIndex: integer;
begin
  if Source <> Destination then begin
    List := TList.Create;
    try
      N := Source.ItemFocused.Index;
      for i := 0 to Source.Items.Count - 1 do
        if Source.Items[i].Selected or All then
          List.Add(Pointer(i));
      for i := List.Count - 1 downto 0 do begin
        with Destination.Items.Add do begin
          Caption := Source.Items[Integer(List[i])].Caption;
          Data := Source.Items[Integer(List[i])].Data;
        end;
        Source.Items.Delete(Integer(List[i]));
        List.Delete(i);
      end;
      N := MinimumInt(N, Source.Items.Count - 1);
      for i := 0 to Source.Items.Count - 1 do begin
        Source.Items[i].Focused := i = N; 
        Source.Items[i].Selected := i = N; 
      end;
      if (Destination.Items.Count > 0) and not
         Assigned(Destination.ItemFocused) then begin
        Destination.Items[0].Focused := true;
        Destination.Items[0].Selected := true;
      end;
    finally
      List.Free;
    end;
    TuneImages;
    TuneButtons;
  end
  else begin
    Source.Items.BeginUpdate;
    try
      tmpCaption := Source.Items[Index].Caption;
      tmpData := Source.Items[Index].Data;
      tmpImageIndex := Source.Items[Index].ImageIndex;

      Source.Items[Index].Caption := Source.ItemFocused.Caption;
      Source.Items[Index].Data := Source.ItemFocused.Data;
      Source.Items[Index].ImageIndex := Source.ItemFocused.ImageIndex;

      Source.ItemFocused.Caption := tmpCaption;
      Source.ItemFocused.Data := tmpData;
      Source.ItemFocused.ImageIndex := tmpImageIndex;

      for i := 0 to Source.Items.Count - 1 do begin
        Source.Items[i].Focused := i = Index;
        Source.Items[i].Selected := i = Index;
      end;
    finally
      Source.Items.EndUpdate;
    end;
    TuneButtons;
  end;
end;

procedure TfmQExport3ColumnsEditor.tbtAddSelectedClick(Sender: TObject);
begin
  MoveListItems(lvAvailable, lvExported, false, -1);
end;

procedure TfmQExport3ColumnsEditor.tbtAddAllClick(Sender: TObject);
begin
  MoveListItems(lvAvailable, lvExported, true, -1);
end;

procedure TfmQExport3ColumnsEditor.tbtDelSelectedClick(Sender: TObject);
begin
  MoveListItems(lvExported, lvAvailable, false, -1);
end;

procedure TfmQExport3ColumnsEditor.tbtDelAllClick(Sender: TObject);
begin
  MoveListItems(lvExported, lvAvailable, true, -1);
end;

procedure TfmQExport3ColumnsEditor.lvAvailableChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  TuneButtons;
end;

procedure TfmQExport3ColumnsEditor.lvExportedChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  TuneButtons;
end;

procedure TfmQExport3ColumnsEditor.tbtMoveColumnUpClick(Sender: TObject);
begin
  MoveListItems(lvExported, lvExported, false, lvExported.ItemFocused.Index - 1);
end;

procedure TfmQExport3ColumnsEditor.tbtMoveColumnDownClick(Sender: TObject);
begin
  MoveListItems(lvExported, lvExported, false, lvExported.ItemFocused.Index + 1);
end;

end.
