{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDataViewToolWin;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons,
  StdCtrls, ExtCtrls, Menus, ComCtrls,
  ppClass, ppComm, ppTypes, ppTreeVw, ppToolWn, ppUtils, ppTB97x,
  daDataView, daForms;

type

  TdaDataTreeBuilder = class;


  { LinkEvent - used by the OnStartLink, OnLinking, and OnEndLink events to communicate drag information back to the Data Manager. }

  TdaLinkEvent = procedure(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String) of object;


  
  { TdaDataViewToolWin

    visual representation of the dataview in the Data workspace }

  TdaDataViewToolWin = class(TForm)
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
    procedure FormResize(Sender: TObject);
    private
      FDataExplorer: TppDataExplorer;
      FDataView: TdaCustomDataView;
      FItemFieldNames: TStringList;
      FLanguageIndex: Longint;
      FLinking: Boolean;
      FLinkStartPoint: TPoint;
      FLinkItem: TListItem;
      FListView: TppReportListView;
      FListViewFont: TFont;
      FOnDeleteDataView: TNotifyEvent;
      FOnEditDataView: TNotifyEvent;
      FOnDeleteLink: TNotifyEvent;
      FOnEndLink: TdaLinkEvent;
      FOnDeleteKeyDown: TKeyEvent;
      FOnLinking: TdaLinkEvent;
      FOnSelectField: TNotifyEvent;
      FOnSortFields: TNotifyEvent;
      FOnStartLink: TdaLinkEvent;
      FPopupMenu: TPopupMenu;
      FToolbar: TPanel;
      FTreeBuilder: TdaDataTreeBuilder;
      FTreeView: TppReportTreeView;
      FWalkieTalkie: TppCommunicator;

      procedure BuildItemFieldNameCrossRef;
      procedure CreateControls;
      procedure CreateMenu;
      procedure CreateToolbar;
      procedure DataViewDeleteLinkEvent(Sender: TObject);
      procedure DataViewLinkChangeEvent(Sender: TObject);
      procedure DataViewNameChangeEvent(Sender: TObject);
      procedure DisplayMagicSQL;
      procedure DisplayMagicData;
      procedure SetDataView(aDataView: TdaCustomDataView);
      procedure SetLanguageIndex(aLanguageIndex: Integer);
      procedure SetLinking(aValue: Boolean);
      procedure UpdateCaption;
      procedure WalkieTalkieNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType);

      procedure AfterBuildTreeEvent(Sender: TObject);
      function GetItemForFieldName(aFieldName: String): TListItem;
      procedure ListViewDrawItemEvent(Sender: TCustomListView; Item: TListItem; Rect: TRect; State: TOwnerDrawState);
      procedure ListViewKeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure ListViewMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure ListViewMouseMoveEvent(Sender: TObject; Shift: TShiftState; X,Y: Integer);
      procedure ListViewMouseUpEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
      procedure ListViewSortEvent(Sender: TObject);
      procedure ListViewVerticalScrollEvent(Sender: TObject);
      procedure MagicSQLDialogCloseEvent(Sender: TObject; var Action: TCloseAction);
      procedure MenuItemClickEvent(Sender: TObject);
      procedure ToolbarButtonClickEvent(Sender: TObject);

      {triggers}
      procedure DoOnDeleteLink(Sender: TObject);
      procedure DoOnDeleteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure DoOnSelectField;
      procedure DoOnStartLink(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String);
      procedure DoOnEndLink(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String);
      procedure DoOnLinking(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String);

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure WndProc(var Message: TMessage); override;

      procedure AddEventNotify(aCommunicator: TppCommunicator);
      procedure Delete;
      function GetFieldPosition(aFieldName: String): TRect;
      procedure Refresh;
      function ShowAllFieldsHeight: Integer;
      procedure RestoreState;
      procedure SaveState;
      procedure UpdateEnabledOptions;

      property DataView: TdaCustomDataView read FDataView write SetDataView;
      property LanguageIndex: Longint read FLanguageIndex write SetLanguageIndex;
      property Linking: Boolean read FLinking write SetLinking;
      property ListView: TppReportListView read FListView;
      property OnSelectField: TNotifyEvent read FOnSelectField write FOnSelectField;
      property OnStartLink: TdaLinkEvent read FOnStartLink write FOnStartLink;
      property OnDeleteDataView: TNotifyEvent read FOnDeleteDataView write FOnDeleteDataView;
      property OnDeleteKeyDown: TKeyEvent read FOnDeleteKeyDown write FOnDeleteKeyDown;
      property OnDeleteLink: TNotifyEvent read FOnDeleteLink write FOnDeleteLink;
      property OnEditDataView: TNotifyEvent read FOnEditDataView write FOnEditDataView;
      property OnEndLink: TdaLinkEvent read FOnEndLink write FOnEndLink;
      property OnLinking: TdaLinkEvent read FOnLinking write FOnLinking;

  end; {class, TdaDataViewToolWin}


  { TdaDataTreeBuilder }

  TdaDataTreeBuilder = class(TppDataTreeBuilder)
    private
      FDataView: TdaCustomDataView;

    public
      procedure BuildTree; override;

      property DataView: TdaCustomDataView read FDataView write FDataView;

  end; {class, TdaDataTreeBuilder}

implementation

uses
  ppDB;

type
  TdaMenuOptionType = (moDelete);

const

  cDataToolResNames: array [Low(TppDataEditType)..High(TppDataEditType)] of String =
                 ('DAALL', 'DAPREVIEW', 'DATABLES', 'DAFIELDS', 'DACALCS', 'DAGROUP', 'DASEARCH', 'DASORT', 'DALINK', 'DATEXTONLY');

  {'All', 'Preview', 'Tables', 'Fields', 'Calc', 'Group', 'Search', 'Sort', 'Link', 'Edit SQL'}
  cDataToolHints: array [Low(TppDataEditType)..High(TppDataEditType)] of Integer =
                        (717, 807, 836, 763, 735, 767, 818, 827, 848, 829);

  {'Delete'}
  cMenuOptionCaptions: array [Low(TdaMenuOptionType)..High(TdaMenuOptionType)] of Integer =
                             (750);

{$R *.DFM}

{******************************************************************************
 *
 ** D A T A V I E W   T O O L   W I N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Create }

constructor TdaDataViewToolWin.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FListView := nil;
  FDataExplorer := nil;
  FItemFieldNames := TStringList.Create;
  FLanguageIndex := 0;
  FLinking := False;
  FLinkStartPoint := Point(-1, -1);
  FLinkItem := nil;
  FOnDeleteDataView := nil;
  FOnDeleteLink := nil;
  FOnEndLink := nil;;
  FOnEditDataView := nil;
  FOnDeleteKeyDown := nil;
  FOnLinking := nil;;
  FOnSelectField := nil;
  FOnSortFields := nil;
  FOnStartLink := nil;;
  FPopupMenu := nil;
  FToolbar := nil;
  FTreeView := nil;
  FWalkieTalkie := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Destroy }

destructor TdaDataViewToolWin.Destroy;
begin

  if (FDataView <> nil) then
    begin
      FDataView.OnLinkChange := nil;
      FDataView.OnDeleteLink := nil;
      FDataView.OnNameChange := nil;
    end;

  FItemFieldNames.Free;
  FListViewFont.Free;
  FTreeBuilder.Free;
  FDataExplorer.Free;
  FWalkieTalkie.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.WalkieTalkieNotifyEvent }

procedure TdaDataViewToolWin.WalkieTalkieNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin
  if (aCommunicator = FDataView) and (aOperation = ppopRemove) then
    FDataView := nil;
end; {procedure, WalkieTalkieNotifyEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.FormCanResize }

procedure TdaDataViewToolWin.FormResize(Sender: TObject);
begin
  FWalkieTalkie.SendEventNotify(FWalkieTalkie, ciWindowResized, nil);
end; {procedure, FormResize)

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.FormCanResize }

procedure TdaDataViewToolWin.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  {do not let window resizing hide toolbar}
  if (NewHeight < 53) then
    begin
      NewHeight := 53;

      Resize := False;
    end;
end; {destructor, FormCanResize}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.AddEventNotify }

procedure TdaDataViewToolWin.AddEventNotify(aCommunicator: TppCommunicator);
begin

  FWalkieTalkie.AddEventNotify(aCommunicator);

  if (FListView <> nil) then
    FListView.AddEventNotify(aCommunicator);

end; {procedure, AddEventNotify}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.GetFieldPosition }

function TdaDataViewToolWin.GetFieldPosition(aFieldName: String): TRect;
var
  lItem: TListItem;
begin

  lItem := GetItemForFieldName(aFieldName);

  Result.Left := Left;

  if (lItem.Top < 0) then
    Result.Top := Top
  else
    Result.Top := Top + FListView.Parent.Top + lItem.Top + 27;

  Result.Right := Left + Width;
  Result.Bottom := Result.Top + 10;

  if (Result.Bottom >  (Top + Height)) then
    begin
      Result.Top := (Top + Height) - 10;
      Result.Bottom := Result.Top + 10;
    end;

end; {function, GetFieldPosition}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.GetItemForFieldName }

function TdaDataViewToolWin.GetItemForFieldName(aFieldName: String): TListItem;
var
  liPosition: Integer;
begin

  liPosition := FItemFieldNames.IndexOf(aFieldName);

  if (liPosition <> -1) then
    Result := TListItem(FItemFieldNames.Objects[liPosition])
  else
    Result := nil;

  if (Result = nil) then
    raise Exception.Create('TdaDataViewToolWin.GetItemForFieldName: Attempt to retrieve TListItem for the ' + aFieldName + ' field, but no item was found.');
    
end; {function, GetItemForFieldName}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.WndProc }

procedure TdaDataViewToolWin.WndProc(var Message: TMessage);
begin

  inherited WndProc(Message);

  if (FWalkieTalkie <> nil) and (Message.Msg = WM_WINDOWPOSCHANGED) then
    FWalkieTalkie.SendEventNotify(FWalkieTalkie, ciWindowPosChanged, nil);

end; {procedure, WndProc}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.CreateControls }

procedure TdaDataViewToolWin.CreateControls;
begin

  CreateToolbar;

  Height := 305;

  FDataExplorer := TppDataExplorer.Create(Self, ppeoVertical);

  FTreeView := FDataExplorer.TreeView;
  FTreeView.ShowRoot := False;

  if (FDataView.DataPipelineCount = 1) then
    begin
      FDataExplorer.TreePanel.Visible := False;
      FDataExplorer.ListTitleBar.Visible := False;
      FDataExplorer.Splitter.Visible := False;
    end;

  FListView := FDataExplorer.ListView;
  FListView.MultiSelect := False;
  FListView.AllowDrag := False;
  FListView.OnKeyDown := ListViewKeyDownEvent;

  FListView.BorderStyle := bsNone;
  FListView.Columns[0].Width := 105;
  FListView.Columns[1].Width := 52;
  FListView.Columns[2].Width := 35;
  FListView.Sortable := True;

  if (FDataView.IsLinkable) then
    begin
      FListViewFont := TFont.Create;
      FListViewFont.Assign(FListView.Font);
      
      FListView.OwnerDraw := True;
      FListView.OnDrawItem := ListViewDrawItemEvent;

      FListView.OnMouseDown := ListViewMouseDownEvent;
      FListView.OnMouseMove := ListViewMouseMoveEvent;
      FListView.OnMouseUp := ListViewMouseUpEvent;
      FListView.OnVerticalScroll := ListViewVerticalScrollEvent;
    end;


  FTreeBuilder := TdaDataTreeBuilder.Create(FTreeView);

  FTreeView.AfterBuildTree := AfterBuildTreeEvent;

  {this needs to be last}
  CreateMenu;

  UpdateEnabledOptions;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ShowAllFieldsHeight }

function TdaDataViewToolWin.ShowAllFieldsHeight: Integer;
begin

  if (FListView <> nil) and (FListView.Items.Count > 0) then
    Result := FListView.Items[FListView.Items.Count - 1].Top + 30
  else
    Result := Height;

end; {function, ShowAllFieldsHeight}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.CreateToolbar }

procedure TdaDataViewToolWin.CreateToolbar;
var
  lButton: TSpeedButton;
  lEditType: TppDataEditType;
  liOffSet: Integer;
  lBevel: TBevel;
begin

  if (FToolbar <> nil) then
    FToolbar.Free;

  FToolbar := TPanel.Create(Self);
  FToolbar.Parent := Self;
  FToolbar.BevelOuter := bvNone;
  FToolbar.Height := 26;
  FToolbar.Top := 0;
  FToolbar.Align := alTop;

  liOffset := 0;

  {remove the edit as text and preview options for linkable dataviews, these
   will be accessible from the popup menu only}
  for lEditType := Low(TppDataEditType) to High(TppDataEditType) do
    if lEditType in FDataView.EditOptions then
      begin

        {add a separator bevel}
        if (lEditType in [ppemText, ppemTables, ppemLink]) then
          begin
            lBevel := TBevel.Create(FToolbar);
            lBevel.Parent := FToolbar;
            lBevel.Shape := bsLeftLine;
            lBevel.Top := 3;
            lBevel.Left := 7 + liOffset;
            lBevel.Width := 2;
            lBevel.Height := FToolbar.Height - 6;
            liOffset := lBevel.Left + lBevel.Width + 7;
          end;

        lButton := TSpeedButton.Create(FToolbar);
        lButton.Parent := FToolbar;
        lButton.Flat := True;
        lButton.Glyph.Handle := ppBitmapFromResource(cDataToolResNames[lEditType]);
        lButton.Tag := Ord(lEditType);
        lButton.OnClick := ToolbarButtonClickEvent;

        lButton.Hint := ppLoadStr(cDataToolHints[lEditType]);

        lButton.Top  := 2;
        lButton.Left := 2 + liOffset;

        liOffset := lButton.Left + lButton.Width;
      end;

end; {procedure, CreateToolbar}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.CreateMenu }

procedure TdaDataViewToolWin.CreateMenu;
var
  lEditType: TppDataEditType;
  lMenuItem: TMenuItem;
  lMenuOption: TdaMenuOptionType;
begin

  if (FPopupMenu <> nil) then
    FPopupMenu.Free;

  FPopupMenu := TPopupMenu.Create(Self);

  PopupMenu := FPopupMenu;
  FListView.PopupMenu := FPopupMenu;
  FTreeView.PopupMenu := FPopupMenu;


  for lEditType := Low(TppDataEditType) to High(TppDataEditType) do
    if lEditType in FDataView.EditOptions then
      begin

        {add a separator line}
        if (lEditType in [ppemText, ppemTables, ppemLink]) then
          begin
            lMenuItem := TMenuItem.Create(FPopupMenu);
            lMenuItem.Caption := '-';
            FPopupMenu.Items.Add(lMenuItem);
          end;

        lMenuItem := TMenuItem.Create(FPopupMenu);
        lMenuItem.Tag := Ord(lEditType);
        lMenuItem.OnClick := ToolbarButtonClickEvent;

        lMenuItem.Caption := ppLoadStr(cDataToolHints[lEditType]);

        FPopupMenu.Items.Add(lMenuItem);
      end;


  {add a separator line}
  lMenuItem := TMenuItem.Create(FPopupMenu);
  lMenuItem.Caption := '-';
  FPopupMenu.Items.Add(lMenuItem);


  {add delete option}
  for lMenuOption := Low(TdaMenuOptionType) to High(TdaMenuOptionType) do
    begin
      lMenuItem := TMenuItem.Create(FPopupMenu);
      lMenuItem.Tag := Ord(lMenuOption);
      lMenuItem.OnClick := MenuItemClickEvent;

      lMenuItem.Caption := ppLoadStr(cMenuOptionCaptions[lMenuOption]);

      FPopupMenu.Items.Add(lMenuItem);
    end;


end; {procedure, CreateMenu}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ToolbarButtonClickEvent }

procedure TdaDataViewToolWin.ToolbarButtonClickEvent(Sender: TObject);
var
  lDataEditType: TppDataEditType;
begin

  if (FDataView = nil) then Exit;

  lDataEditType := TppDataEditType(TComponent(Sender).Tag);

  FDataView.EditMode := lDataEditType;

  if Assigned(FOnEditDataView) then FOnEditDataView(Self);

  UpdateEnabledOptions;

end;  {procedure, ToolbarButtonClickEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.UpdateEnabledOptions }

procedure TdaDataViewToolWin.UpdateEnabledOptions;
var
  liIndex: Integer;
  lbEnabled: Boolean;
  lToolbarButton: TppToolbarButton;
  lEditType: TppDataEditType;
  
begin

  if (FToolbar = nil) then Exit;

  for liIndex := 0 to FToolbar.ControlCount-1 do
   if (FToolbar.Controls[liIndex].Tag > 0) then
    begin
      lToolbarButton := TppToolbarButton(FToolbar.Controls[liIndex]);
      lEditType := TppDataEditType(lToolbarButton.Tag);

      lbEnabled := lEditType in FDataView.EnabledOptions;

      lToolbarButton.Enabled := lbEnabled;
      FPopupMenu.Items[liIndex].Enabled := lbEnabled;
    end;


end;  {procedure, UpdateEnabledOptions}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.MenuItemClickEvent }

procedure TdaDataViewToolWin.MenuItemClickEvent(Sender: TObject);
var
 lMenuOption: TdaMenuOptionType;
 
begin

  if (FDataView = nil) then Exit;

  lMenuOption := TdaMenuOptionType(TComponent(Sender).Tag);

  case lMenuOption of
 
    moDelete: Delete;

  end;

end;  {procedure, MenuItemClickEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SetDataView }

procedure TdaDataViewToolWin.SetDataView(aDataView: TdaCustomDataView);
begin

  if (FWalkieTalkie = nil) then
    begin
      FWalkieTalkie := TppCommunicator.Create(nil);
      FWalkieTalkie.OnNotify := WalkieTalkieNotifyEvent;
    end;

  if (FDataView <> nil) then
    begin
      FDataView.RemoveNotify(FWalkieTalkie);

      FDataView.OnDeleteLink := nil;
      FDataView.OnLinkChange := nil;
      FDataView.OnNameChange := nil;
    end;

  FDataView := aDataView;

  if (FDataView <> nil) then
    begin
      FDataView.AddNotify(FWalkieTalkie);

      FDataView.OnDeleteLink := DataViewDeleteLinkEvent;
      FDataView.OnLinkChange := DataViewLinkChangeEvent;
      FDataView.OnNameChange := DataViewNameChangeEvent;
    end;

  UpdateCaption;

  CreateControls;

  FTreeBuilder.DataView := FDataView;

  FTreeView.BuildTree;
  FTreeView.FullExpand;

end; {procedure, SetDataView}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Delete }

procedure TdaDataViewToolWin.Delete;
var
  lsMessage: String;
begin

  {'Are you sure want to delete the dataview <name>?'}
  lsMessage := ppLoadStr(724);
  lsMessage := ppSetMessageParameters(lsMessage);
  lsMessage := Format(lsMessage, [Caption]);

  if MessageDlg(lsMessage, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if Assigned(FOnDeleteDataView) then FOnDeleteDataView(Self);
    end;


end; {procedure, Delete}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.Refresh }

procedure TdaDataViewToolWin.Refresh;
begin

  UpdateCaption;

  FTreeView.BuildTree;

  {notify all concerned visual links that the field order may have changed}
  FWalkieTalkie.SendEventNotify(FWalkieTalkie, ciListViewSort, nil);

end; {procedure, Refresh}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.BuildItemFieldNameCrossRef }

procedure TdaDataViewToolWin.BuildItemFieldNameCrossRef;
var
  liIndex: Integer;
  lItem: TListItem;
  lField: TppField;
begin

  FItemFieldNames.Clear;

  for liIndex := 0 to FListView.Items.Count - 1 do
    begin
      lItem := FListView.Items[liIndex];

      lField := TppField(lItem.Data);

      FItemFieldNames.AddObject(lField.FieldName, lItem);
    end;

  FItemFieldNames.Sort;

end; {procedure, BuildItemFieldNameCrossRef}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.AfterBuildTreeEvent }

procedure TdaDataViewToolWin.AfterBuildTreeEvent(Sender: TObject);
begin

  if FDataView.DataPipelineCount > 0 then
    begin
      {must disable sorting event handler while building listview}
      FListView.OnSort := nil;

      FListView.CurrentObject := FDataView.DataPipelines[0];

      BuildItemFieldNameCrossRef;

      FListView.OnSort := ListViewSortEvent;
    end;

end; {procedure, CustomBuildTreeEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SetLanguageIndex }

procedure TdaDataViewToolWin.SetLanguageIndex(aLanguageIndex: Integer);
var
  liIndex: Integer;
  lButton: TControl;
  lEditType: TppDataEditType;

begin

  FLanguageIndex := aLanguageIndex;

  if (FDataView <> nil) then
    FDataView.LanguageIndex := aLanguageIndex;

{  FTreeView.LanguageIndex := aLanguageIndex;}

  for liIndex := 0 to FToolbar.ControlCount-1 do
    if (FToolbar.Controls[liIndex].Tag > 0) then
    begin
      lButton := FToolbar.Controls[liIndex];
      lEditType := TppDataEditType(lButton.Tag);
      lButton.Hint := ppLoadStr(cDataToolHints[lEditType]);
    end;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.RestoreState }

procedure TdaDataViewToolWin.RestoreState;
begin

  Left := FDataView.Left;
  Top := FDataView.Top;
  Width := FDataView.Width;
  Height := FDataView.Height;

  FListView.Columns[0].Width := FDataView.NameColumnWidth;
  FListView.Columns[1].Width := FDataView.TypeColumnWidth;
  FListView.Columns[2].Width := FDataView.SizeColumnWidth;

  FListView.SortMode := FDataView.SortMode;

end; {procedure, RestoreState}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SaveState }

procedure TdaDataViewToolWin.SaveState;
begin

  if (FDataView = nil) then Exit;
  if (FListView = nil) then Exit;
  if (FListView.Columns.Count <> 3) then Exit;

  FDataView.SortMode := FListView.SortMode;

  FDataView.NameColumnWidth := FListView.Columns[0].Width;
  FDataView.TypeColumnWidth := FListView.Columns[1].Width;
  FDataView.SizeColumnWidth := FListView.Columns[2].Width;

  FDataView.Left := Left;
  FDataView.Top := Top;
  FDataView.Width := Width;
  FDataView.Height := Height;

end; {procedure, SaveState}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewKeyDownEvent }

procedure TdaDataViewToolWin.ListViewKeyDownEvent(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DELETE) then
    DoOnDeleteKeyDown(Sender, Key, Shift)
end; {procedure, ListViewKeyDownEvent

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewVerticalScrollEvent }

procedure TdaDataViewToolWin.ListViewVerticalScrollEvent(Sender: TObject);
begin
  FWalkieTalkie.SendEventNotify(FWalkieTalkie, ciListViewScroll, nil);
end; {procedure, ListViewVerticalScrollEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewSortEvent }

procedure TdaDataViewToolWin.ListViewSortEvent(Sender: TObject);
begin
  FWalkieTalkie.SendEventNotify(FWalkieTalkie, ciListViewSort, nil);
end; {procedure, ListViewSortEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewDrawItemEvent }

procedure TdaDataViewToolWin.ListViewDrawItemEvent(Sender: TCustomListView; Item: TListItem; Rect: TRect; State: TOwnerDrawState);
var
  lField: TppField;
  lColor: TColor;
  lsFieldName: String;
begin

  if (FDataView = nil) or (csDestroying in FDataView.ComponentState) then Exit;

  if (FDataView.IsLinkable) then
    begin

      lField := TppField(Item.Data);

      try
        lsFieldName := lField.FieldName;
      except
        raise Exception.Create('TdaDataViewToolWin.ListViewDrawItemEvent: Bad field reference');
      end;

      lColor := FDataView.GetLinkColorForField(lField.FieldName);

      if (lColor <> 0) then
        begin
          FListViewFont.Style := FListViewFont.Style + [fsBold];
          FListViewFont.Color := lColor;
        end
      else
        begin
          FListViewFont.Style := [];
          FListViewFont.Color := clBlack;
        end;

    end;

  TppReportListView(Sender).DefaultOwnerDrawPlus(Item, Rect, State, FListViewFont);

end; {procedure, ListViewDrawItemEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewMouseDownEvent }

procedure TdaDataViewToolWin.ListViewMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lPoint: TPoint;
  lField: TppField;
begin

  if not(FDataView.IsLinkable) then Exit;

  if (ssCtrl in Shift) then
    DisplayMagicSQL

  else if (ssShift in Shift) then
    DisplayMagicData

  else
    begin
      FLinkStartPoint := Point(X, Y);

      lPoint := FListView.ScreenToClient(Mouse.CursorPos);

      FLinkItem := FListView.GetItemAt(lPoint.X, lPoint.Y);

      if (FLinkItem <> nil) then
        begin
          lField := TppField(FLinkItem.Data);

          if (lField.Linkable) then
            DoOnSelectField
          else
            FLinkItem := nil;
        end;
    end;
    
end; {procedure, ListViewMouseDownEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewMouseMoveEvent }

procedure TdaDataViewToolWin.ListViewMouseMoveEvent(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  lPoint: TPoint;
  lsFieldAlias: String;
  lField: TppField;
begin

  if not(FDataView.IsLinkable) then Exit;

  if not(FLinking) and (ppemLink in FDataView.EnabledOptions) and (FLinkStartPoint.X <> -1) and (FLinkItem <> nil) and ((Abs(X - FLinkStartPoint.X) > 3) or (Abs(Y - FLinkStartPoint.Y) > 3)) then
    begin
      FLinking := True;

      lsFieldAlias := FLinkItem.Caption;

      DoOnStartLink(Self, FDataView, lsFieldAlias);
    end

  else if not(FLinking) and (FLinkStartPoint.X = -1) then
    begin
      lPoint := FListView.ScreenToClient(Mouse.CursorPos);

      FLinkItem := FListView.GetItemAt(lPoint.X, lPoint.Y);

      if (FLinkItem <> nil) then
        begin
          lField := TppField(FLinkItem.Data);

          if (lField.Linkable) then
            lsFieldAlias := FLinkItem.Caption
          else
            lsFieldAlias := '';
        end
      else
        lsFieldAlias := '';

      DoOnLinking(Self, FDataView, lsFieldAlias);
    end;

end; {procedure, ListViewMouseMoveEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.ListViewMouseUpEvent }

procedure TdaDataViewToolWin.ListViewMouseUpEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  lsFieldAlias: String;
  lPoint: TPoint;
  lField: TppField;
begin

  if not(FDataView.IsLinkable) then Exit;

  lsFieldAlias := '';

  if (FLinkStartPoint.X = -1) then
    begin
      lPoint := FListView.ScreenToClient(Mouse.CursorPos);

      FLinkItem := FListView.GetItemAt(lPoint.X, lPoint.Y);

      if (FLinkItem <> nil) then
        begin
          lField := TppField(FLinkItem.Data);

          if (lField.Linkable) then
            lsFieldAlias := FLinkItem.Caption;
        end;
    end;

  DoOnEndLink(Self, FDataView, lsFieldAlias);

  SetLinking(False);

end; {procedure, ListViewMouseUpEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.SetLinking }

procedure TdaDataViewToolWin.SetLinking(aValue: Boolean);
begin

  FLinking := aValue;

  if not(FLinking) then
    begin
      FLinkStartPoint := Point(-1, -1);
      FLinkItem := nil;
    end;

end; {procedure, SetLinking}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DoOnDeleteKeyDown }

procedure TdaDataViewToolWin.DoOnDeleteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FOnDeleteKeyDown) then FOnDeleteKeyDown(Sender, Key, Shift);
end; {procedure, DoOnDeleteKeyDown

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DoOnSelectField }

procedure TdaDataViewToolWin.DoOnSelectField;
begin
  if Assigned(FOnSelectField) then FOnSelectField(Self);
end; {procedure, DoOnSelectField}
{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DoOnDeleteLink }

procedure TdaDataViewToolWin.DoOnDeleteLink(Sender: TObject);
begin
  if Assigned(FOnDeleteLink) then FOnDeleteLink(Sender);
end; {procedure, DoOnDeleteLink}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DoOnStartLink }

procedure TdaDataViewToolWin.DoOnStartLink(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String);
begin
  if Assigned(FOnStartLink) then FOnStartLink(Sender, aDataView, aFieldAlias);
end; {procedure, DoOnStartLink}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DoOnLinking }

procedure TdaDataViewToolWin.DoOnLinking(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String);
begin
  if Assigned(FOnLinking) then FOnLinking(Sender, aDataView, aFieldAlias);
end; {procedure, DoOnLinking}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DoOnEndLink }

procedure TdaDataViewToolWin.DoOnEndLink(Sender: TObject; aDataView: TdaDataView; aFieldAlias: String);
begin
  if Assigned(FOnEndLink) then FOnEndLink(Sender, aDataView, aFieldAlias);
end; {procedure, DoOnEndLink}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DataViewDeleteLinkEvent }

procedure TdaDataViewToolWin.DataViewDeleteLinkEvent(Sender: TObject);
begin
  DoOnDeleteLink(Self);

  Refresh;
end; {procedure, DataViewDeleteLinkEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DataViewLinkChangeEvent }

procedure TdaDataViewToolWin.DataViewLinkChangeEvent(Sender: TObject);
begin
  Refresh;
end; {procedure, DataViewLinkChangeEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DataViewNameChangeEvent }

procedure TdaDataViewToolWin.DataViewNameChangeEvent(Sender: TObject);
begin
  UpdateCaption;
end; {procedure, DataViewNameChangeEvent}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.UpdateCaption }

procedure TdaDataViewToolWin.UpdateCaption;
begin

  if (FDataView <> nil) then
    begin

      if (FDataView.GetLinkCount > 0) then
        Caption := FDataView.GetLinkDescription
      else
        Caption := FDataView.Description;

    end;

end; {procedure, UpdateCaption}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DisplayMagicData }

procedure TdaDataViewToolWin.DisplayMagicData;
var
  lForm: TdaCustomPreviewDataDialog;
  lFormClass: TFormClass;
begin

  lFormClass := FDataView.PreviewFormClass;

  if (lFormClass = nil) or not lFormClass.InheritsFrom(TdaCustomPreviewDataDialog) then Exit;

  lForm := TdaCustomPreviewDataDialog(lFormClass.Create(Application));

  lForm.ShowMagicFields := True;
  lForm.DataView := FDataView;
  lForm.LanguageIndex := LanguageIndex;

  lForm.ShowModal;

  lForm.Free;

end; {procedure, DisplayMagicData}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.DisplayMagicSQL }

procedure TdaDataViewToolWin.DisplayMagicSQL;
var
  lDialog: TForm;
  lMemo: TMemo;
  liTextHeight: Integer;
  liTextWidth: Integer;
  liWidth: Integer;
  liIndex: Integer;
  lPosition: TPoint;
begin

  lPosition := Parent.ClientToScreen(Point(Left, Top));

  lDialog := TForm.Create(Owner);
  lDialog.BorderStyle := bsSizeToolWin;
  lDialog.FormStyle := fsStayOnTop;
  lDialog.Caption := 'Magic SQL - ' + FDataView.GetLinkDescription;
  lDialog.Enabled := True;
  lDialog.Left := lPosition.X + 10;
  lDialog.Top := lPosition.Y + 20;
  lDialog.OnClose := MagicSQLDialogCloseEvent;

  lDialog.Font.Name := 'Courier New';
  lDialog.Font.Size := 9;

  lMemo := TMemo.Create(lDialog);
  lMemo.Parent := lDialog;
  lMemo.Width := 500;

  FDataView.GetMagicSQL(lMemo.Lines);

  liTextWidth := lDialog.Canvas.TextWidth('W');
  liTextHeight := lDialog.Canvas.TextHeight('W');

  liTextWidth := liTextWidth * 50;

  for liIndex := 0 to lMemo.Lines.Count - 1 do
    begin
      liWidth := lDialog.Canvas.TextWidth(lMemo.Lines[liIndex]);

      if (liWidth > liTextWidth) then
        liTextWidth := liWidth;
    end;

  if (liTextWidth < 500) then
    lDialog.ClientWidth := liTextWidth + 20
  else
    lDialog.ClientWidth := 500;
    
  lDialog.ClientHeight := (liTextHeight * lMemo.Lines.Count) + 20;

  lMemo.Align := alClient;

  lDialog.ShowModal;

  lDialog.Free;

end; {procedure, DisplayMagicSQL}

{------------------------------------------------------------------------------}
{ TdaDataViewToolWin.MagicSQLDialogCloseEvent }

procedure TdaDataViewToolWin.MagicSQLDialogCloseEvent(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end; {procedure, MagicSQLDialogCloseEvent}

{******************************************************************************
 *
 ** D A T A   T R E E   B U I L D E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataTreeBuilder.BuildTree }

procedure TdaDataTreeBuilder.BuildTree;
var
  liIndex: Integer;

begin

  inherited BuildTree;

  if FDataView = nil then Exit;

  {add pipelines}
  for liIndex := 0 to FDataView.DataPipelineCount-1 do
    AddPipelineNode(FDataView.DataPipelines[liIndex]);

end; {procedure, BuildTree}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N
 *
{******************************************************************************}

initialization
  RegisterClass(TdaDataViewToolWin);
end.
