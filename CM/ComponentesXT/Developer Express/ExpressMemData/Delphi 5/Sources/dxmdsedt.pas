{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressMemData - CLX/VCL Edition                            }
{                                                                   }
{       Copyright (c) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, DPU, SO, ETC.) ARE CONFIDENTIAL AND PROPRIETARY }
{   TRADE SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER}
{   IS LICENSED TO DISTRIBUTE THE EXPRESSMEMDATA                    }
{   AS PART OF AN EXECUTABLE PROGRAM ONLY.                          }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxmdsedt;

interface
{$I dxmdver.inc}

uses
{$IFNDEF LINUX}
  Windows, Classes, Controls, Forms, StdCtrls, dxmdaset, ExtCtrls, Menus,
    {$IFDEF DELPHI6}DesignIntf{$ELSE}DsgnIntf{$ENDIF};
{$ELSE}
  Classes, Controls, QForms, dxmdaset, DesignIntf, QExtCtrls, QStdCtrls,
  QControls, QMenus, QTypes, Types;
{$ENDIF}


type

  {$IFDEF LINUX}
  IFormDesigner = IDesigner;
  {$ENDIF}
  {$IFDEF DELPHI6}
  IFormDesigner = IDesigner;
  {$ENDIF}

  TfrmdxMemDataEditor = class(TForm)
    ListBox: TListBox;
    pnButtons: TPanel;
    BAdd: TButton;
    BDelete: TButton;
    BUp: TButton;
    BDown: TButton;
    pmColumns: TPopupMenu;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miUp: TMenuItem;
    miDown: TMenuItem;
    N1: TMenuItem;
    miShowButtons: TMenuItem;
    miSelectAll: TMenuItem;
    procedure ListBoxClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BAddClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure miUpClick(Sender: TObject);
    procedure miDownClick(Sender: TObject);
    procedure miSelectAllClick(Sender: TObject);
    procedure miShowButtonsClick(Sender: TObject);
    procedure ListBoxDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBoxStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure ListBoxEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure ListBoxDragDrop(Sender, Source: TObject; X, Y: Integer);
  private
  public
    Data: TdxMemData;
    FormDesigner: {$IFDEF DELPHI4}IFormDesigner{$ELSE}TFormDesigner{$ENDIF};

    procedure FillList;
  end;

function ShowdxMemDataEditor(AData: TdxMemData; FormDesigner: {$IFDEF DELPHI4}IFormDesigner{$ELSE}TFormDesigner{$ENDIF}): Boolean;

implementation

uses DB, dxmdseda {$IFDEF DELPHI5}, Contnrs {$ENDIF};
{$R *.dfm}

var
  FormList: TList;

const
  OldDragIndex: Integer = -1;

type
  TMemDataSetDesigner = class(TDataSetDesigner)
  private
   AForm: TfrmdxMemDataEditor;
   FDestroying: Boolean;
  public
    destructor Destroy; override;
    procedure DataEvent(Event: TDataEvent; Info: Longint); override;
  end;

destructor TMemDataSetDesigner.Destroy;
begin
  FDestroying := True;
  if AForm <> nil then
    AForm.Close;
  inherited Destroy;
end;

procedure TMemDataSetDesigner.DataEvent(Event: TDataEvent; Info: Longint);
var
  i, j: Integer;
begin
  if AForm <> nil then
    with AForm do
    begin
      ListBox.Items.BeginUpdate;
      for i := 0 to Data.FieldCount - 1 do
        if Data.Fields[i].Owner = Data.Owner then
        begin
          j := ListBox.Items.IndexOfObject(Data.Fields[i]);
          if j > -1 then
            ListBox.Items[j] := Data.Fields[i].FieldName;
        end;
      ListBox.Items.EndUpdate;
    end;
end;

function ShowdxMemDataEditor(AData: TdxMemData; FormDesigner: {$IFDEF DELPHI4}IFormDesigner{$ELSE}TFormDesigner{$ENDIF}): Boolean;
var
  AForm: TfrmdxMemDataEditor;
  i: Integer;
begin
  AForm := nil;
  for i := 0 to FormList.Count - 1 do
    if TfrmdxMemDataEditor(FormList[i]).Data = AData then
    begin
      AForm := TfrmdxMemDataEditor(FormList[i]);
      Break;
    end;
  if AForm = nil then
  begin
    AForm := TfrmdxMemDataEditor.Create(nil);
    {$IFDEF LINUX}
    AForm.ListBox.DragMode := dmManual;
    {$ENDIF}
    AForm.Data := AData;
    AForm.FormDesigner := FormDesigner;
    TMemDataSetDesigner.Create(AData);
    TMemDataSetDesigner(AData.Designer).AForm := AForm;
    FormList.Add(AForm);
  end;
  with AForm do
  begin
    FillList;
    Caption := 'Editing ' + Data.Name + '.Fields';
    Show;
    Result := True;
  end;
end;

procedure TfrmdxMemDataEditor.FillList;
Var
  i: Integer;
begin
  ListBox.Items.BeginUpdate;
  ListBox.Items.Clear;
  for i := 0 to Data.FieldCount - 1 do
    if Data.Fields[i].Owner = Data.Owner then
      ListBox.Items.AddObject(Data.Fields[i].FieldName, Data.Fields[i]);
  ListBox.Items.EndUpdate;
  ListBoxClick(nil);
end;

{$IFDEF DELPHI5}
  {$IFNDEF DELPHI6}
    {$DEFINE MAKEIPERSISTENT}
  {$ENDIF}
{$ENDIF}

procedure TfrmdxMemDataEditor.ListBoxClick(Sender: TObject);
var
  List: {$IFDEF DELPHI5}IDesignerSelections{$ELSE}TComponentList{$ENDIF};
  i: Integer;
begin
  if (csDesigning in Data.ComponentState) then
  begin
    {$IFDEF DELPHI5}
    List := CreateSelectionList;
    {$ELSE}
    List := TComponentList.Create;
    {$ENDIF}
    try
      for i := 0 to Listbox.Items.Count - 1 do
        if Listbox.Selected[i] then
          List.Add({$IFDEF MAKEIPERSISTENT}MakeIPersistent{$ENDIF}(TComponent(Listbox.Items.Objects[i])));
        if List.Count > 0 then
          FormDesigner.SetSelections(List)
        else
          FormDesigner.SelectComponent(Data);
    finally
    {$IFNDEF DELPHI5}
      List.Free;
    {$ENDIF}
    end;
  end;
  BDelete.Enabled := Listbox.SelCount > 0;
  BUp.Enabled := Listbox.SelCount > 0;
  BDown.Enabled := Listbox.SelCount > 0;
end;

procedure TfrmdxMemDataEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (Data <> nil) and Not (csDestroying in Data.ComponentState)
  and (Data.Designer <> nil) and not TMemDataSetDesigner(Data.Designer).FDestroying then
  begin
    TMemDataSetDesigner(Data.Designer).AForm := nil;
    Data.Designer.Free;
  end;
  FormList.Remove(self);
  Action := caFree;
end;

procedure TfrmdxMemDataEditor.BAddClick(Sender: TObject);
var
  AField: TField;
  P: TPoint;
begin
  P := Point(BAdd.Left + BAdd.Width, BAdd.Top);
  P := ClientToScreen(P);
  Data.Close;
  AField := GetMemDataNewFieldType(Data, P.X, P.Y, FormDesigner);
  if AField <> nil then
  begin
    FillList;
    ListBox.Selected[ListBox.Items.Count-1] := True;
    ListBox.ItemIndex := ListBox.Items.Count-1;
    ListBox.SetFocus;
    ListBoxClick(nil);
  end;
end;

procedure TfrmdxMemDataEditor.BDeleteClick(Sender: TObject);
var
  i, OldIndex: Integer;
  List: TList;
begin
  if Data <> nil then
  begin
    OldIndex := ListBox.ItemIndex;
    List := TList.Create;
    for i := 0 to ListBox.Items.Count - 1 do
     if ListBox.Selected[i] then
        List.Add(ListBox.Items.Objects[i]);
    for i := 0 to List.Count - 1 do
       TField(List[i]).Free;
    List.Free;
    FillList;
    if OldIndex >= ListBox.Items.Count then
      OldIndex := ListBox.Items.Count - 1;
    if (OldIndex <> -1) and (ListBox.Items.Count > 0) then
      ListBox.Selected[OldIndex] := True;
    ListBox.SetFocus;
    ListBoxClick(nil);
  end;
end;

procedure TfrmdxMemDataEditor.miUpClick(Sender: TObject);
var
  i, c: Integer;
  List: TList;
begin
  if Data <> nil then
  begin
    List := TList.Create;
    for i := 0 to ListBox.Items.Count - 1 do
      if ListBox.Selected[i] then
        List.Add(ListBox.Items.Objects[i]);
    for i := 0 to List.Count - 1 do
      TField(List[i]).Index := TField(List[i]).Index - 1;
    FillList;
    for i := 0 to List.Count - 1 do
    begin
      c := ListBox.Items.IndexOfObject(TField(List[i]));
      if c <> -1 then
        ListBox.Selected[c] := True;
    end;
    List.Free;
    ListBoxClick(nil);
  end;
end;

procedure TfrmdxMemDataEditor.miDownClick(Sender: TObject);
var
  i, c: Integer;
  List: TList;
begin
  if Data <> nil then
  begin
    List := TList.Create;
    for i := 0 to ListBox.Items.Count - 1 do
      if ListBox.Selected[i] then
        List.Add(ListBox.Items.Objects[i]);
    for i := List.Count - 1 downto 0 do
      TField(List[i]).Index := TField(List[i]).Index + 1;
    FillList;
    for i := 0 to List.Count - 1 do
    begin
      c := ListBox.Items.IndexOfObject(TField(List[i]));
      if c <> -1 then
        ListBox.Selected[c] := True;
    end;
    List.Free;
    ListBoxClick(nil);
  end;
end;

procedure TfrmdxMemDataEditor.miSelectAllClick(Sender: TObject);
var
  i: Integer;
begin
  with ListBox do
    for i := 0 to Items.Count - 1 do
      Selected[i] := True;
  ListBox.SetFocus;
  ListBoxClick(nil);
end;

procedure TfrmdxMemDataEditor.miShowButtonsClick(Sender: TObject);
begin
  miShowButtons.Checked := not miShowButtons.Checked;
  pnButtons.Visible := miShowButtons.Checked;
end;

procedure TfrmdxMemDataEditor.ListBoxDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  Index: Integer;
begin
  Accept := Source = ListBox;
  if not Accept then
    Exit;
  Index := ListBox.ItemAtPos(Point(X, Y){$IFNDEF LINUX}, True{$ENDIF});
  if OldDragIndex <> Index then
  begin
    if OldDragIndex <> -1 then
      ListBox.Selected[OldDragIndex] := False;
    if Index <> -1 then
      if not ListBox.Selected[Index] then
      begin
        ListBox.Selected[Index] := True;
        OldDragIndex := Index;
      end
      else
        OldDragIndex := -1;
  end;
  if (Index <> -1) then
    ListBox.ItemIndex := Index;
end;

procedure TfrmdxMemDataEditor.ListBoxStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  OldDragIndex := -1;
end;

procedure TfrmdxMemDataEditor.ListBoxEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
  if OldDragIndex <> -1 then
  begin
    ListBox.Selected[OldDragIndex] := False;
    OldDragIndex := -1;
  end;
end;

procedure TfrmdxMemDataEditor.ListBoxDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  i, c, Index: Integer;
  List: TList;
begin
  if OldDragIndex <> -1 then
  begin
    ListBox.Selected[OldDragIndex] := False;
    OldDragIndex := -1;
  end;
  Index := ListBox.ItemAtPos(Point(X, Y){$IFNDEF LINUX}, True{$ENDIF});
  if (Index <> -1) and (Data <> nil) then
  begin
    List := TList.Create;
    for i := ListBox.Items.Count - 1 downto 0 do
      if ListBox.Selected[i] then
        List.Add(ListBox.Items.Objects[i]);
    if TField(List[0]).Index > Index then
      for i := 0 to List.Count - 1 do
        TField(List[i]).Index := Index + 1
    else
      for i := List.Count - 1 downto 0 do
        TField(List[i]).Index := Index + 1;

    FillList;
    for i := 0 to List.Count - 1 do
    begin
      c := ListBox.Items.IndexOfObject(TField(List[i]));
      if c <> -1  then
        ListBox.Selected[c] := True;
    end;
    ListBoxClick(nil);
    List.Free;
  end;
end;

initialization
  FormList := TList.Create;

finalization
  FormList.Free;

end.

