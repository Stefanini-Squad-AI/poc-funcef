unit IvTarD16;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
  Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  IvMulti, IvTargD;

type
  TIvTargetPropertiesDialog = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    List: TListBox;
    AddButton: TButton;
    RemoveButton: TButton;
    EditButton: TButton;
    ClassLabel: TLabel;
    PropertyLabel: TLabel;
    AddDefaultButton: TButton;
    AddAllButton: TButton;
    Label1: TLabel;
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure UpdateButtons(Sender: TObject);
    procedure ListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure AddDefaultButtonClick(Sender: TObject);
    procedure AddAllButtonClick(Sender: TObject);

  private
    function GetItem(i: Integer): TIvTargetProperty;

    procedure AddItem(item: TIvTargetProperty);
    procedure AddNew(
      const targetClassName, targetPropertyName: String;
      targetType: TIvTargetType);

  public
    procedure GetItems(items: TIvTargetProperties);
    procedure SetItems(items: TIvTargetProperties);

    property Items[i: Integer]: TIvTargetProperty read GetItem;
  end;

implementation

{$R *.DFM}

function TIvTargetPropertiesDialog.GetItem(i: Integer): TIvTargetProperty;
begin
  Result := List.Items.Objects[i] as TIvTargetProperty;
end;

procedure TIvTargetPropertiesDialog.GetItems(items: TIvTargetProperties);
var
  i: Integer;
begin
  for i := 0 to List.Items.Count - 1 do
    items.Add(Self.Items[i].Copy);
end;

procedure TIvTargetPropertiesDialog.SetItems(items: TIvTargetProperties);
var
  i: Integer;
begin
  for i := 0 to items.Count - 1 do
    AddItem(items[i].Copy);
  UpdateButtons(Self);
end;

procedure TIvTargetPropertiesDialog.AddItem(item: TIvTargetProperty);
begin
  List.Items.AddObject('', item);
end;

procedure TIvTargetPropertiesDialog.AddButtonClick(Sender: TObject);
var
  dialog: TIvTargetPropertyDialog;
begin
  dialog := TIvTargetPropertyDialog.Create(nil);
  if dialog.ShowModal = mrOk then
  begin
    AddItem(TIvTargetProperty.Create(
      dialog.ClassNameEdit.Text,
      dialog.PropertyNameEdit.Text,
      TIvTargetType(dialog.TypeRadio.ItemIndex)));
    UpdateButtons(Self);
  end;
  dialog.Free;
end;

procedure TIvTargetPropertiesDialog.AddNew(
  const targetClassName, targetPropertyName: String;
  targetType: TIvTargetType);
var
  i: Integer;
begin
  for i := 0 to List.Items.Count - 1 do
  begin
    if (CompareText(Items[i].TargetClassName, targetClassName) = 0) and
      (CompareText(Items[i].TargetPropertyName, targetPropertyName) = 0) and
      (Items[i].TargetType = targetType) then
    begin
      Exit;
    end;
  end;

  { Not found. Adds the target }

  AddItem(TIvTargetProperty.Create(targetClassName, targetPropertyName, targetType));
end;

procedure TIvTargetPropertiesDialog.AddDefaultButtonClick(Sender: TObject);
begin
  AddNew('', 'Caption', ivttInclude);
  AddNew('', 'Hint', ivttInclude);
  AddNew('', 'Items', ivttInclude);
  UpdateButtons(Self);
end;

procedure TIvTargetPropertiesDialog.AddAllButtonClick(Sender: TObject);
begin
  AddDefaultButtonClick(sender);
  AddNew('', 'Lines', ivttInclude);
  AddNew('', 'Hints', ivttInclude);
  AddNew('', 'Tabs', ivttInclude);
  AddNew('', 'DisplayLabel', ivttInclude);
  UpdateButtons(Self);
end;

procedure TIvTargetPropertiesDialog.EditButtonClick(Sender: TObject);
var
  item: TIvTargetProperty;
  dialog: TIvTargetPropertyDialog;
begin
  item := List.Items.Objects[List.ItemIndex] as TIvTargetProperty;
  dialog := TIvTargetPropertyDialog.Create(nil);
  dialog.SetItem(item);
  if dialog.ShowModal = mrOk then
  begin
    item.TargetClassName := dialog.ClassNameEdit.Text;
    item.TargetPropertyName := dialog.PropertyNameEdit.Text;
    item.TargetType := TIvTargetType(dialog.TypeRadio.ItemIndex);
    List.Invalidate;
  end;
  dialog.Free;
end;

procedure TIvTargetPropertiesDialog.RemoveButtonClick(Sender: TObject);
var
  index: Integer;
begin
  TIvTargetProperty(List.Items.Objects[List.ItemIndex] as TIvTargetProperty).Free;
  index := List.ItemIndex;
  List.Items.Delete(index);
  if List.Items.Count > 0 then
  begin
    if index >= List.Items.Count then
      index := List.Items.Count - 1;
    List.ItemIndex := index;
  end;
  UpdateButtons(Self);
end;

procedure TIvTargetPropertiesDialog.UpdateButtons(Sender: TObject);
begin
  EditButton.Enabled := List.ItemIndex <> -1;
  RemoveButton.Enabled := EditButton.Enabled;
end;

procedure TIvTargetPropertiesDialog.ListDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  item: TIvTargetProperty;
begin
  item := List.Items.Objects[Index] as TIvTargetProperty;
  List.Canvas.FillRect(Rect);
  List.Canvas.TextOut(Rect.Left + 2, Rect.Top + 1, item.TargetClassName);
  List.Canvas.TextOut(Rect.Left + 122, Rect.Top + 1, item.TargetPropertyName);
  case item.TargetType of
    ivttInclude: List.Canvas.TextOut(Rect.Left + 230, Rect.Top + 1, 'Include');
    ivttExclude: List.Canvas.TextOut(Rect.Left + 230, Rect.Top + 1, 'Exclude');
  end;
end;

end.
