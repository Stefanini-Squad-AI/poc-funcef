unit Main;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, MultForm,
  IvMulti, IvFiMult, IvAMulti, IvDictio, IvBinDic, IvDlgMod;

type
  TMainForm = class(TMultilingualForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    SpeedPanel: TPanel;
    OpenButton: TSpeedButton;
    SaveButton: TSpeedButton;
    ExitButton: TSpeedButton;
    StatusBar: TStatusBar;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    LanguageButton: TSpeedButton;
    LocaleButton: TSpeedButton;
    Options1: TMenuItem;
    Language1: TMenuItem;
    Sublanguage1: TMenuItem;
    Languagenative1: TMenuItem;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Contents1: TMenuItem;
    N2: TMenuItem;
    Dictionary: TIvBinaryDictionary;
    IvDialogModule1: TIvDialogModule;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure UpdateMenuItems(Sender: TObject);
    procedure FileNewItemClick(Sender: TObject);
    procedure FileOpenItemClick(Sender: TObject);
    procedure FileExitItemClick(Sender: TObject);
    procedure WindowCascadeItemClick(Sender: TObject);
    procedure WindowTileItemClick(Sender: TObject);
    procedure WindowArrangeItemClick(Sender: TObject);
    procedure WindowMinimizeItemClick(Sender: TObject);
    procedure Language1Click(Sender: TObject);
    procedure Languagenative1Click(Sender: TObject);
    procedure Sublanguage1Click(Sender: TObject);
    procedure FileSaveItemClick(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
    procedure HelpAboutItemClick(Sender: TObject);
    procedure FileSaveAsItemClick(Sender: TObject);
    procedure Contents1Click(Sender: TObject);
    procedure DictionaryLanguageChange(Sender: TObject);
    procedure TranslatorLanguageChange(Sender: TObject);

  private
    procedure ShowHint(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  IvLaSelD, IvLanguD,
  Child, Details, About;

procedure TMainForm.ShowHint(Sender: TObject);
begin
  // Shows hints on the status bar

  StatusBar.SimpleText := Application.Hint;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  Application.OnHint := ShowHint;
  Screen.OnActiveFormChange := UpdateMenuItems;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Screen.OnActiveFormChange := nil;
end;

procedure TMainForm.UpdateMenuItems(Sender: TObject);
begin
  FileSaveItem.Enabled := MDIChildCount > 0;
  FileSaveAsItem.Enabled := MDIChildCount > 0;
  FileCloseItem.Enabled := MDIChildCount > 0;

  WindowCascadeItem.Enabled := MDIChildCount > 0;
  WindowTileItem.Enabled := MDIChildCount > 0;
  WindowArrangeItem.Enabled := MDIChildCount > 0;
  WindowMinimizeItem.Enabled := MDIChildCount > 0;

  SaveButton.Enabled := MDIChildCount > 0;
end;

procedure TMainForm.FileNewItemClick(Sender: TObject);
var
  child: TChildForm;
  dialog: TDetailsDialog;
begin
  dialog := TDetailsDialog.Create(nil);
  if dialog.ShowModal = idOK then
  begin
    child := TChildForm.Create(Application);

    // The following line contains Language Manager tag, ivlm. This makes
    // LM to find the string on the line. That is 'Person'

    child.Caption := MlFormat('Person %d', [MDIChildCount]);
    child.FirstNameLabel.Caption := dialog.FirstNameEdit.Text;
    child.LastNameLabel.Caption := dialog.LastNameEdit.Text;
    child.Sex := dialog.Sex;
    child.PersonHeight := dialog.PersonHeight;
    child.PersonWeight := dialog.PersonWeight;
    child.DateOfBirth := dialog.DateOfBirth;
    child.DescriptionLabel.Caption := dialog.DescriptionMemo.Lines.Text;
    child.ColorPanel.Color := dialog.ColorPanel.Color;
  end;
  dialog.Free;
end;

procedure TMainForm.FileOpenItemClick(Sender: TObject);
var
  child: TChildForm;
begin
  if OpenDialog.Execute then
  begin
    child := TChildForm.Create(Application);
    child.Open(OpenDialog.FileName);
  end;
end;

procedure TMainForm.FileSaveAsItemClick(Sender: TObject);
begin
  if SaveDialog.Execute then
    (ActiveMDIChild as TChildForm).SaveAs(SaveDialog.FileName);
end;

procedure TMainForm.FileSaveItemClick(Sender: TObject);
var
  child: TChildForm;
begin
  child := ActiveMDIChild as TChildForm;
  if child.FileName = '' then
    FileSaveAsItemClick(Sender)
  else
    child.Save;
end;

procedure TMainForm.FileCloseItemClick(Sender: TObject);
begin
  if ActiveMDIChild <> nil then
    ActiveMDIChild.Close;
end;

procedure TMainForm.FileExitItemClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.WindowCascadeItemClick(Sender: TObject);
begin
  Cascade;
end;

procedure TMainForm.WindowTileItemClick(Sender: TObject);
begin
  Tile;
end;

procedure TMainForm.WindowArrangeItemClick(Sender: TObject);
begin
  ArrangeIcons;
end;

procedure TMainForm.WindowMinimizeItemClick(Sender: TObject);
var
  i: Integer;
begin
  for i := MDIChildCount - 1 downto 0 do
    MDIChildren[i].WindowState := wsMinimized;
end;

procedure TMainForm.Language1Click(Sender: TObject);
var
  language: Integer;
begin
  // Selects the current language

  if SelectLanguage(Self, Dictionary, '', [], 0, language) then
    Dictionary.Language := language;
end;

procedure TMainForm.Languagenative1Click(Sender: TObject);
var
  point: TPoint;
  dialog: TIvLanguageSelectDialog;
begin
  // Selects the current language and sets the default locale of that language.
  // Uses the native language names and no form, just a popup list box.

  dialog := TIvLanguageSelectDialog.CreateParam(
    nil,
    Translator.Dictionary,
    '',
    [ivloUseNativeLanguage],
    helpContext);
  GetCursorPos(point);
  dialog.ScreenToClient(point);
  dialog.Left := point.x;
  dialog.Top := point.y;
  dialog.Position := poDefaultSizeOnly;
  dialog.BorderStyle := bsNone;
  dialog.ListBox.Left := 0;
  dialog.ListBox.Top := 0;
  dialog.ListBox.Width := 100;
  dialog.ListBox.Height := 100;
  dialog.ClientWidth := dialog.ListBox.Width;
  dialog.ClientHeight := dialog.ListBox.Height;
  if dialog.ShowModal = mrOk then
    Dictionary.Language := dialog.Language;
  dialog.Free;
end;

procedure TMainForm.Sublanguage1Click(Sender: TObject);
var
  langId: Integer;
begin
  // Selects the current locale

  if SelectSublanguage(Self, Dictionary, '', [], 0, langId) then
    Dictionary.Locale := langId;
end;

procedure TMainForm.Contents1Click(Sender: TObject);
begin
  inherited;
  Application.HelpContext(0);
end;

procedure TMainForm.HelpAboutItemClick(Sender: TObject);
var
  dialog: TAboutDialog;
begin
  dialog := TAboutDialog.Create(nil);
  try
    dialog.ShowModal;
  finally
    dialog.Free;
  end;
end;

// This event will be called every time the language has changed.
// Write any application code that depends on the active language

procedure TMainForm.DictionaryLanguageChange(Sender: TObject);
begin
  inherited;

  // Changes the help file to correspond the current language

  Application.HelpFile := Translate('english.hlp');
end;

// This event will be called every time the translator has translated the form.
// Write any form code that depends on the active language

procedure TMainForm.TranslatorLanguageChange(Sender: TObject);
begin
  inherited;

  // Updates the Caption property of the main form.
  // This is done because the caption contains a combined string of the main
  // caption and the child caption. ML can not automatically translate this.

  if (ActiveMDIChild <> nil) and (ActiveMDIChild.WindowState = wsMaximized) then
    Caption := Translate('Person File');

  // Updates the short cuts to match the active language

  case Dictionary.ActiveLanguage of
    // English and US English

    1, 2:
    begin
      FileNewItem.ShortCut := ShortCut(Word('N'), [ssCtrl]);
      FileOpenItem.ShortCut := ShortCut(Word('O'), [ssCtrl]);
      FileSaveItem.ShortCut := ShortCut(Word('S'), [ssCtrl]);
    end;

    // Finnish

    3:
    begin
      FileNewItem.ShortCut := ShortCut(Word('U'), [ssCtrl]);
      FileOpenItem.ShortCut := ShortCut(Word('A'), [ssCtrl]);
      FileSaveItem.ShortCut := ShortCut(Word('T'), [ssCtrl]);
    end;
  end;
end;

end.
