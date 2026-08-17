unit IvTargsd;

{$I IVMULTI.INC}

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls, ComCtrls,
  IvMulti;

type
  TIvTargetPropertiesDialog = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    AddButton: TButton;
    RemoveButton: TButton;
    EditButton: TButton;
    HelpButton: TButton;
    DetectButton: TButton;
    List: TListView;
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure RemoveButtonClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure DetectButtonClick(Sender: TObject);
    procedure UpdateButtons(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);

  private
    FTranslator: TIvTranslator;

  protected
    procedure ClearList;

    function GetItem(i: Integer): TIvTargetProperty;

    procedure AddItem(item: TIvTargetProperty);
    procedure AddNew(
      const targetClassName, targetPropertyName: String;
      targetType: TIvTargetType);
    procedure UpdateListItem(listItem: TListItem);

  public
    procedure GetItems(items: TIvTargetProperties);
    procedure SetItems(items: TIvTargetProperties);

    property Items[i: Integer]: TIvTargetProperty read GetItem;
    property Translator: TIvTranslator read FTranslator write FTranslator;
  end;

implementation

{$R *.DFM}

uses
  Registry,
  IvDictio, IvTargD, IvParser;

function TIvTargetPropertiesDialog.GetItem(i: Integer): TIvTargetProperty;
begin
  Result := List.Items[i].Data;
end;

procedure TIvTargetPropertiesDialog.AddItem(item: TIvTargetProperty);
var
  listItem: TListItem;
begin
  listItem := List.Items.Add;
  listItem.SubItems.Add('');
  listItem.SubItems.Add('');
  listItem.Data := item;
  UpdateListItem(listItem);
end;

procedure TIvTargetPropertiesDialog.UpdateListItem(listItem: TListItem);
const
  TYPES_C: array[TIvTargetType] of String = ('Include', 'Exclude');
var
  target: TIvTargetProperty;
begin
  target := listItem.Data;
  listItem.Caption := target.TargetClassName;
  listItem.SubItems[0] := target.TargetPropertyName;
  listItem.SubItems[1] := TYPES_C[target.TargetType];
end;

procedure TIvTargetPropertiesDialog.AddNew(
  const targetClassName, targetPropertyName: String;
  targetType: TIvTargetType);
var
  i: Integer;
begin
  for i := 0 to List.Items.Count - 1 do
  begin
    if TIvTargetProperties.DoesMatch(Items[i], targetClassName, targetPropertyName) and
      (Items[i].TargetType = targetType) then
    begin
      Exit;
    end;
  end;

  // Not found. Adds the target

  AddItem(TIvTargetProperty.Create(targetClassName, targetPropertyName, targetType));
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

procedure TIvTargetPropertiesDialog.DetectButtonClick(Sender: TObject);
var
  i: Integer;
  targets: TIvTargetProperties;
begin
  if FTranslator = nil then
    Exit;

  targets := TIvTargetProperties.Create;
  try
    FTranslator.DetectTargets(targets, False);
    for i := 0 to targets.Count - 1 do
    begin
      with targets[i] do
        AddNew(TargetClassName, TargetPropertyName, TargetType);
    end;
  finally
    targets.Free;
  end;

  UpdateButtons(Self);
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

procedure TIvTargetPropertiesDialog.EditButtonClick(Sender: TObject);
var
  item: TIvTargetProperty;
  dialog: TIvTargetPropertyDialog;
begin
  item := List.Selected.Data;
  dialog := TIvTargetPropertyDialog.Create(nil);
  dialog.SetItem(item);
  if dialog.ShowModal = mrOk then
  begin
    item.TargetClassName := dialog.ClassNameEdit.Text;
    item.TargetPropertyName := dialog.PropertyNameEdit.Text;
    item.TargetType := TIvTargetType(dialog.TypeRadio.ItemIndex);
    UpdateListItem(List.Selected);
  end;
  dialog.Free;
end;

procedure TIvTargetPropertiesDialog.RemoveButtonClick(Sender: TObject);
var
  index: Integer;
begin
  TIvTargetProperty(List.Selected.Data).Free;
  index := List.Selected.Index;
  List.Items.Delete(index);
  if List.Items.Count > 0 then
  begin
    if index >= List.Items.Count then
      index := List.Items.Count - 1;
    List.Items[index].Selected := True;
  end;
  UpdateButtons(Self);
end;

procedure TIvTargetPropertiesDialog.UpdateButtons(Sender: TObject);
begin
  EditButton.Enabled := List.Selected <> nil;
  RemoveButton.Enabled := EditButton.Enabled;
end;

procedure TIvTargetPropertiesDialog.HelpButtonClick(Sender: TObject);
begin
  WinHelp(
    Handle,
    PChar(GetMLRegistryValue('RootDir', '') + '\docs\ivmulti.hlp'),
    HELP_CONTEXT,
    20000);
end;

procedure TIvTargetPropertiesDialog.ClearList;
var
  i: Integer;
begin
  for i := 0 to List.Items.Count - 1 do
    TIvTargetProperty(List.Items[i].Data).Free;
  List.Items.Clear;  
end;

procedure TIvTargetPropertiesDialog.FormDestroy(Sender: TObject);
begin
  ClearList;
end;

procedure TIvTargetPropertiesDialog.ListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = VK_DELETE) and (List.Selected <> nil) then
    RemoveButtonClick(Self)
  else if key = VK_INSERT then
    AddButtonClick(Self);
end;

procedure TIvTargetPropertiesDialog.FormCreate(Sender: TObject);
begin
{$IFDEF IVWIDE}
  List.RowSelect := True;
{$ENDIF}
end;

end.
