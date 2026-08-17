unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, checklst, StdCtrls, Grids, ComCtrls, ShellAPI, ToolWin, Db, DBTables, Buttons,
  dxPSCore, dxPSdxTLLnk, dxTLClms, dxTL, dxCntner;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miDesigner: TMenuItem;
    miHelp: TMenuItem;
    miPageSetup: TMenuItem;
    miPrintPreview: TMenuItem;
    miPrint: TMenuItem;
    N1: TMenuItem;
    miExit: TMenuItem;
    miDX: TMenuItem;
    dxComponentPrinter1: TdxComponentPrinter;
    ToolBar1: TToolBar;
    tbSetup: TToolButton;
    tbPreview: TToolButton;
    tbPrint: TToolButton;
    tbDevider: TToolButton;
    tbDesigner: TToolButton;
    tbDX: TToolButton;
    tbSeparator: TToolButton;
    tbExit: TToolButton;
    ilButtons: TImageList;
    dxComponentPrinter1Link1: TdxTreeListReportLink;
    ilTLItems: TImageList;
    ilDBTreelist: TImageList;
    dxTreeList: TdxTreeList;
    dxTreeListColumn1: TdxTreeListColumn;
    dxTreeListColumn2: TdxTreeListSpinColumn;
    dxTreeListColumn4: TdxTreeListPickColumn;
    dxTreeListColumn3: TdxTreeListColumn;
    dxTreeListColumn5: TdxTreeListColumn;
    tbSelected: TToolButton;
    procedure miDXClick(Sender: TObject);
    procedure miPageSetupClick(Sender: TObject);
    procedure miPrintPreviewClick(Sender: TObject);
    procedure miPrintClick(Sender: TObject);
    procedure miDesignerClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure dxTreeListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dxTreeListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dxTreeListEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure dxTreeListGetSelectedIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxTreeListCompare(Sender: TObject; Node1,
      Node2: TdxTreeListNode; var Compare: Integer);
    procedure tbSelectedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure RefreshSort(Sender : TdxTreeList);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation


{$R *.DFM}

procedure TMainForm.miDXClick(Sender: TObject);
begin
  ShellExecute(Handle, PChar('OPEN'), PChar('http://www.devexpress.com'), Nil, Nil, SW_SHOWMAXIMIZED);
end;

procedure TMainForm.miPageSetupClick(Sender: TObject);
begin
  dxComponentPrinter1.PageSetup(nil);
end;

procedure TMainForm.miPrintPreviewClick(Sender: TObject);
begin
  dxComponentPrinter1.Preview(True,nil);
end;

procedure TMainForm.miPrintClick(Sender: TObject);
begin
  dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TMainForm.miDesignerClick(Sender: TObject);
begin
  dxComponentPrinter1.DesignReport(nil);
end;

procedure TMainForm.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.dxTreeListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  AItem, AnItem: TdxTreeListNode;
  AttachMode: TdxTreeListNodeAttachMode;
  HT: TdxTreeListHitTest;
begin
  if dxTreeList.SelectedCount = 0 then Exit;
  HT := dxTreeList.GetHitTestInfoAt(X, Y);
  AnItem := dxTreeList.GetNodeAt(X, Y);
  if HT in [htButton, htIcon, htStateIcon, htLabel, htNowhere, htIndent] then
  begin
    AttachMode := natlInsert;
    if HT in [htButton, htIcon, htStateIcon, htLabel] then
      AttachMode := natlAddChild
    else if HT = htNowhere then
    begin
      AnItem := dxTreeList.Items[0];
      AttachMode := natlAdd;
    end
    else if HT = htIndent then AttachMode := natlInsert;
    while dxTreeList.SelectedCount > 0 do
    begin
      AItem := dxTreeList.SelectedNodes[0];
      AItem.Selected := False;
      AItem.MoveTo(AnItem, AttachMode);
    end;
  end;
  RefreshSort(dxTreeList);
end;

procedure TMainForm.dxTreeListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source = dxTreeList then Accept := True
  Else Accept := False;
end;

procedure TMainForm.dxTreeListEdited(Sender: TObject;
  Node: TdxTreeListNode);
begin
  RefreshSort(dxTreeList);
end;

procedure TMainForm.dxTreeListGetSelectedIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  Index := Node.ImageIndex;
end;

procedure TMainForm.dxTreeListCompare(Sender: TObject; Node1,
  Node2: TdxTreeListNode; var Compare: Integer);
var i : integer;
begin
  with TdxTreeList(Sender) do begin
    i := 0;
    while i < ColumnCount do begin
      if Columns[i].Sorted <> csNone then break;
      inc(i);
    end;

    if i < ColumnCount then
      begin
        if Columns[i].Caption = 'Budget' then
          try
            Compare := Round(StrToFloat(Node1.Values[i]) - StrToFloat(Node2.Values[i]));
          except
            Compare := 0;
          end
        else Compare := CompareStr(Node1.Values[i], Node2.Values[i]);
      end
    else
      Compare := 0;
  end;
end;

procedure TMainForm.RefreshSort(Sender : TdxTreeList);
var PrevSort : TdxTreeListColumnSort;
    i : integer;
begin
  with Sender do begin
    i := 0;
    while i < ColumnCount do begin
      if Columns[i].Sorted <> csNone then break;
      inc(i);
    end;

    if i < ColumnCount then begin
      PrevSort := Columns[i].Sorted;
      if Columns[i].Sorted = csUp then Columns[i].Sorted := csDown
      else Columns[i].Sorted := csUp;
      Columns[i].Sorted := PrevSort;
    end;
  end;
end;

procedure TMainForm.tbSelectedClick(Sender: TObject);
begin
  dxComponentPrinter1Link1.OnlySelected := tbSelected.Down;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  DataFile: String;
begin
    DataFile := ExtractFilePath(Application.ExeName)+'\example.dat';
    if FileExists(DataFile) then dxTreeList.LoadFromFile(DataFile);
    dxTreeList.FullExpand;
end;

end.
