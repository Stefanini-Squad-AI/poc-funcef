unit main;

// This sample demonstrates two features
//
// 1) How to implement custom language and locale controls
//
// 2) How to rearrange components based on the active locale
//
// The application lets the user input the address infromation. The visible
// fields are controlled by the active locale. ADDRESS.TXT contains the address
// information of each country.

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, IvDictio, IvAMulti, IvMulti, ExtCtrls, IvBinDic;

type
  TMainForm = class(TForm)
    LanguageGroup: TGroupBox;
    LanguageCombo: TComboBox;
    LocaleGroup: TGroupBox;
    LocaleCombo: TComboBox;
    MainMenu1: TMainMenu;
    OptionsMenu: TMenuItem;
    BindMenu: TMenuItem;
    IvTranslator1: TIvTranslator;
    IvDictionary1: TIvBinaryDictionary;
    AddressGroup: TGroupBox;
    FirstNameLabel: TLabel;
    FirstName: TEdit;
    MiddleNameLabel: TLabel;
    MiddleName: TEdit;
    LastNameLabel: TLabel;
    LastName: TEdit;
    CompanyLabel: TLabel;
    Company: TEdit;
    Address1Label: TLabel;
    Address1: TEdit;
    Address2Label: TLabel;
    Address2: TEdit;
    CityLabel: TLabel;
    City: TEdit;
    StateLabel: TLabel;
    State: TEdit;
    CountryLabel: TLabel;
    Country: TEdit;
    PostalCodeLabel: TLabel;
    PostalCode: TEdit;
    EditMenu: TMenuItem;
    ClearMenu: TMenuItem;
    Info1: TMenuItem;
    Customlocales1: TMenuItem;
    Systemlocales1: TMenuItem;
    Alllocales1: TMenuItem;
    N1: TMenuItem;
    Locale1: TMenuItem;
    procedure ClearMenuClick(Sender: TObject);
    procedure BindMenuClick(Sender: TObject);
    procedure OptionsMenuClick(Sender: TObject);
    procedure LanguageComboChange(Sender: TObject);
    procedure LocaleComboChange(Sender: TObject);
    procedure IvTranslator1LanguageChange(Sender: TObject);
    procedure IvTranslator1LocaleChange(Sender: TObject);
    procedure Alllocales1Click(Sender: TObject);
    procedure Customlocales1Click(Sender: TObject);
    procedure Systemlocales1Click(Sender: TObject);
    procedure Locale1Click(Sender: TObject);

  private
    procedure ShowList(title: String; list: TList; id: Boolean);
    procedure ArrangeItems;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

uses
  IvParser, ListDlg, IvMlUtil;

procedure TMainForm.ShowList(title: String; list: TList; id: Boolean);
var
  i: Integer;
  dialog: TListDialog;
begin
  dialog := TListDialog.Create(nil);
  try
    dialog.Caption := IvDictionary1.Translate(title);
    for i := 0 to list.Count - 1 do
      if id then
        dialog.List.Items.Add(IntToStr(Integer(list[i])))
      else
        dialog.List.Items.Add(IntToStr(TIvLocale(list[i]).Locale));
    dialog.ShowModal;
  finally
    dialog.Free;
  end;  
end;

procedure TMainForm.ArrangeItems;
var
  x, y, tabOrder: Integer;
  str, item: String;
  f: TextFile;
  parser: TIvAnsiParser;

  procedure Show(editLabel: TLabel; edit: TEdit);
  begin
    // Sets the positions of the label and edit control

    editLabel.Left := x;
    editLabel.Top := y + 2;
    editLabel.Show;
    Inc(x, editLabel.Width + 8);
    if (x < 88) then
      x := 88;

    edit.Left := x;
    edit.Top := y;
    edit.TabOrder := tabOrder;
    edit.Show;
    Inc(x, edit.Width + 8);

    Inc(tabOrder);
  end;

begin
  // Hides all items

  FirstName.Hide;
  FirstNameLabel.Hide;
  MiddleName.Hide;
  MiddleNameLabel.Hide;
  LastName.Hide;
  LastNameLabel.Hide;
  Company.Hide;
  CompanyLabel.Hide;
  Address1.Hide;
  Address1Label.Hide;
  Address2.Hide;
  Address2Label.Hide;
  City.Hide;
  CityLabel.Hide;
  State.Hide;
  StateLabel.Hide;
  Country.Hide;
  CountryLabel.Hide;
  PostalCode.Hide;
  PostalCodeLabel.Hide;

  // Finds the address infromation of the current country

  AssignFile(f, ExtractFilePath(Application.ExeName) + 'address.txt');
  Reset(f);
  while not Eof(f) do
  begin
    Readln(f, str);
    if str = IvDictionary1.LocaleData.EnglishCountryName then
      Break;
  end;

  if not Eof(f) then
  begin
    // Reads the order of the address items from the address file

    parser := TIvAnsiParser.Create;
    parser.Separator := ' ';
    y := 16;
    tabOrder := 0;

    while True do
    begin
      Readln(f, str);
      if str = '' then
        Break;

      parser.Value := str;
      x := 8;
      while not parser.Eol do
      begin
        item := parser.GetString;
        if item = 'FirstName' then
          Show(FirstNameLabel, FirstName)
        else if item = 'MiddleName' then
          Show(MiddleNameLabel, MiddleName)
        else if item = 'LastName' then
          Show(LastNameLabel, LastName)
        else if item = 'Company' then
          Show(CompanyLabel, Company)
        else if item = 'Address1' then
          Show(Address1Label, Address1)
        else if item = 'Address2' then
          Show(Address2Label, Address2)
        else if item = 'City' then
          Show(CityLabel, City)
        else if item = 'State' then
        begin
          StateLabel.Caption := IvDictionary1.Translate('State'); //ivlm
          Show(StateLabel, State);
        end
        else if item = 'Province' then
        begin
          StateLabel.Caption := IvDictionary1.Translate('Province'); //ivlm
          Show(StateLabel, State);
        end
        else if item = 'Country' then
          Show(CountryLabel, Country)
        else if item = 'PostalCode' then
        begin
          PostalCodeLabel.Caption := IvDictionary1.Translate('Postal Code'); //ivlm
          Show(PostalCodeLabel, PostalCode);
        end
        else if item = 'Zip' then
        begin
          PostalCodeLabel.Caption := IvDictionary1.Translate('Zip'); //ivlm
          Show(PostalCodeLabel, PostalCode);
        end;
      end;
      Inc(y, 24);
    end;

    parser.Free;
  end
  else
  begin
    // Here you could place the default oder
  end;

  CloseFile(f);
end;

procedure TMainForm.ClearMenuClick(Sender: TObject);
begin
  FirstName.Text := '';
  MiddleName.Text := '';
  LastName.Text := '';
  Company.Text := '';
  Address1.Text := '';
  Address2.Text := '';
  City.Text := '';
  State.Text := '';
  Country.Text := '';
  PostalCode.Text := '';
end;

procedure TMainForm.BindMenuClick(Sender: TObject);
begin
  // Toggles the bind locale flag

  if IvDictionary1.Binding = ivbiNone then
    IvDictionary1.Binding := ivbiLocaleToLanguage
  else
    IvDictionary1.Binding := ivbiNone;
end;

procedure TMainForm.OptionsMenuClick(Sender: TObject);
begin
  BindMenu.Checked := IvDictionary1.Binding = ivbiLocaleToLanguage;
end;

procedure TMainForm.IvTranslator1LanguageChange(Sender: TObject);
var
  i: Integer;
  list: TList;
begin
  // Gets languages

  LanguageCombo.Items.Clear;
  list := TList.Create;
  IvDictionary1.GetLanguageDatas(list);
  for i := 0 to list.Count - 1 do
  begin
    with TIvLanguage(list[i]) do
    begin
      if Primary <> LANG_NEUTRAL then
        LanguageCombo.Items.AddObject(IvDictionary1.Translate(EnglishName), TObject(i));
    end;
  end;
  IvDictionary1.FreeList(list);

  // Selects the active language

  for i := 0 to LanguageCombo.Items.Count - 1 do
  begin
    if Integer(LanguageCombo.Items.Objects[i]) = IvDictionary1.ActiveLanguage then
    begin
      LanguageCombo.ItemIndex := i;
      Break;
    end;
  end;
end;

procedure TMainForm.IvTranslator1LocaleChange(Sender: TObject);
var
  i: Integer;
  list: TList;
begin
  // Gets locales

  list := TList.Create;
  IvDictionary1.GetLocales(list);
  LocaleCombo.Items.Clear;
  for i := 0 to list.Count - 1 do
  begin
    with TIvLocale(list[i]) do
    begin
      LocaleCombo.Items.AddObject(GetDisplayName(ivdnTranslated, IvDictionary1), TObject(Locale));
    end;
  end;
  IvDictionary1.FreeList(list);

  // Selects the active language

  for i := 0 to LocaleCombo.Items.Count - 1 do
  begin
    if Integer(LocaleCombo.Items.Objects[i]) = IvDictionary1.Locale then
    begin
      LocaleCombo.ItemIndex := i;
      Break;
    end;
  end;

  ArrangeItems;
end;

procedure TMainForm.LanguageComboChange(Sender: TObject);
begin
  // Select a new language.
  // If the language and locale have been bound the locale changes also.

  IvDictionary1.Language := Integer(LanguageCombo.Items.Objects[LanguageCombo.ItemIndex]);
end;

procedure TMainForm.LocaleComboChange(Sender: TObject);
begin
  // Select a new locale
  // If the language and locale have been bound the language changes also.

  IvDictionary1.Locale := Integer(LocaleCombo.Items.Objects[LocaleCombo.ItemIndex]);
end;

procedure TMainForm.Customlocales1Click(Sender: TObject);
var
  list: TList;
begin
  list := TList.Create;
  IvDictionary1.GetLocaleDatas(list);
  ShowList('Custom Locale Ids', list, False); //ivlm
  IvDictionary1.FreeList(list);
end;

procedure TMainForm.Systemlocales1Click(Sender: TObject);
var
  list: TList;
begin
  list := TList.Create;
  IvDictionary1.GetSystemLocaleIds(list);
  ShowList('System Locale Ids', list, True); //ivlm
  list.Free;
end;

procedure TMainForm.Alllocales1Click(Sender: TObject);
var
  list: TList;
begin
  list := TList.Create;
  IvDictionary1.GetLocaleIds(list);
  ShowList('All Locale Ids', list, True); //ivlm
  list.Free;
end;

procedure TMainForm.Locale1Click(Sender: TObject);
var
  locale: TIvLocale;
begin
  // Gets the locale date for Arabic (Saudi-Arabia) and
  // shows the english country name.

  locale := TIvLocale.Create;
  IvDictionary1.GetLocaleDataById(IvMakeLcId(LANG_ARABIC, SUBLANG_ARABIC_SAUDI_ARABIA), locale);
  IvShowMessage(locale.EnglishCountryName, IvDictionary1);
  locale.Free;
end;

end.

