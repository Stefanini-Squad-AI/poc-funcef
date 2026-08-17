unit IvLanguD;

{$I IVMULTI.INC}

interface

uses
  Windows, ComCtrls, SysUtils, Classes, Forms, Dialogs, Controls, StdCtrls,
  IvDictio, IvMulti, IvConMod;

type
  TIvLanguageDialogType = (ivldtLanguage, ivldtSubLanguage, ivldtLocale);

  TIvLanguageDialog = class(TForm)
    TreeView: TTreeView;
    OKButton: TButton;
    CancelButton: TButton;
    HelpButton: TButton;
    Translator: TIvTranslator;
    procedure FormActivate(Sender: TObject);
    procedure TreeViewDblClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);

  protected
    function GetSelectedValue: Integer;

  public
    constructor CreateParam(
      owner: TComponent;
      dictionary: TIvDictionary;
      const msg: String;
      options: TIvLanguageDialogOptions;
      dialogType: TIvLanguageDialogType;
      helpContext: THelpContext);

    property SelectedValue: Integer read GetSelectedValue;
  end;

  function SelectLanguage(
    parent: TControl;
    dictionary: TIvDictionary;
    const msg: String;
    options: TIvLanguageDialogOptions;
    helpContext: THelpContext;
    var language: Integer): Boolean;

  function SelectSublanguage(
    parent: TControl;
    dictionary: TIvDictionary;
    const msg: String;
    options: TIvLanguageDialogOptions;
    helpContext: THelpContext;
    var langId: Integer): Boolean;

  function SelectLocale(
    parent: TControl;
    dictionary: TIvDictionary;
    const msg: String;
    options: TIvLanguageDialogOptions;
    helpContext: THelpContext;
    var locale: Integer): Boolean;

  procedure FillTreeViewWithLocales(
    treeView: TTreeView;
    locales: TList;
    options: TIvLanguageDialogOptions;
    dictionary: TIvDictionary);

implementation

{$R *.DFM}

function SelectLanguage(
  parent: TControl;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext;
  var language: Integer): Boolean;
var
  dialog: TIvLanguageDialog;
begin
  if not dictionary.IsOpen then
    raise EIvMulti.Create(
      'Dictionary is not open' +
      #10#13'You must open the dictionary before you can change the language');

  Result := False;
  dialog := TIvLanguageDialog.CreateParam(
    nil,
    dictionary,
    msg,
    options,
    ivldtLanguage,
    helpContext);
  try
    if not (ivloNoCenter in options) then
      IvCenterControl(parent, dialog);

    if dialog.ShowModal = idOK then
    begin
      language := dialog.SelectedValue;
      Result := True;
    end;
  finally
    Screen.Cursor := crDefault;
    dialog.Free;
  end;
end;

function SelectSublanguage(
  parent: TControl;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext;
  var langId: Integer): Boolean;
var
  dialog: TIvLanguageDialog;
begin
  if not dictionary.IsOpen then
    raise EIvMulti.Create(
      'Dictionary is not open' +
      #10#13'You must open the dictionary before you can change the language');

  Result := False;
  dialog := TIvLanguageDialog.CreateParam(
    nil,
    dictionary,
    msg,
    options,
    ivldtSubLanguage,
    helpContext);
  try
    if not (ivloNoCenter in options) then
      IvCenterControl(parent, dialog);

    if dialog.ShowModal = idOK then
    begin
      langId := dialog.SelectedValue;
      Result := True;
    end;
  finally
    Screen.Cursor := crDefault;
    dialog.Free;
  end;
end;

function SelectLocale(
  parent: TControl;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext;
  var locale: Integer): Boolean;
var
  dialog: TIvLanguageDialog;
begin
  if not dictionary.IsOpen then
    raise EIvMulti.Create(
      'Dictionary is not open' +
      #10#13'You must open the dictionary before you can change the locale');

  Result := False;
  Screen.Cursor := crHourglass;
  dialog := TIvLanguageDialog.CreateParam(
    nil,
    dictionary,
    msg,
    options,
    ivldtLocale,
    helpContext);
  try
    if not (ivloNoCenter in options) then
      IvCenterControl(parent, dialog);

    if dialog.ShowModal = idOK then
    begin
      locale := dialog.SelectedValue;
      Result := True;
    end;
  finally
    Screen.Cursor := crDefault;
    dialog.Free;
  end;
end;

procedure FillTreeViewWithLocales(
  treeView: TTreeView;
  locales: TList;
  options: TIvLanguageDialogOptions;
  dictionary: TIvDictionary);

  procedure AddCountry(node: TTreeNode; locale: TIvLocale);
  var
    str: String;
  begin
    if ivloUseNativeLanguage in options then
    begin
      str := locale.NativeCountryName;
      if locale.Primary = LANG_NORWEGIAN then
        case locale.Sub of
          SUBLANG_NORWEGIAN_BOKMAL: str := str + ' (bokmål)';
          SUBLANG_NORWEGIAN_NYNORSK: str := str + ' (nynorsk)';
        end;
    end
    else
      str := TIvDictionary.ComposeCountryName(
        locale.EnglishCountryName,
        locale.Primary,
        locale.Sub,
        locale.CodePage,
        False,
        nil);

    TreeView.Items.AddChildObject(node, str, TObject(locale.Locale));
  end;

var
  i: Integer;
  str: String;
  found: Boolean;
  node: TTreeNode;
  locale: TIvLocale;
begin
  for i := 0 to locales.Count - 1 do
  begin
    locale := TIvLocale(locales[i]);
    if (not (ivloShowAllLanguages in options)) and
      (dictionary <> nil) and
      (((dictionary.CheckLevel = ivclCodePage) and
       (not dictionary.IsLocaleSupportedByCodePage(locale))) or
      ((dictionary.CheckLevel = ivclSystem) and
       (not IvIsCodePageSupportedBySystem(locale.CodePage)))) then
    begin
      Continue;
    end;

    // Checks of the tree view already contains the language of the locale.

    found := False;
    node := TreeView.TopItem;
    while node <> nil do
    begin
      if Integer(node.Data) = locale.Primary then
      begin
        // Yes. Adds the country

        AddCountry(node, locale);
        found := True;
        Break;
      end;

      node := node.GetNextSibling;
    end;

    // If not found adds a new language and country.

    if not found then
    begin
      if ivloUseNativeLanguage in options then
        str := locale.NativeLanguageName
      else
        str := locale.EnglishLanguageName;

      node := TreeView.Items.AddObject(
        nil,
        TIvDictionary.ComposeLanguageName(
          str,
          locale.Primary,
          locale.CodePage,
          False,
          nil),
        TObject(locale.Primary));
      AddCountry(node, locale);
    end;
  end;
end;

constructor TIvLanguageDialog.CreateParam(
  owner: TComponent;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  dialogType: TIvLanguageDialogType;
  helpContext: THelpContext);
var
  name: String;
  found: Boolean;
  i, j, k, first, langId: Integer;
  subs: TStringList;
  locales: TList;
  node: TTreeNode;
  language: TIvLanguage;

  procedure SelectNode(locale: Integer);
  var
    node: TTreeNode;
  begin
    // Select the active sublanguage

    node := TreeView.TopItem;
    while node <> nil do
    begin
      if IvGetPrimaryFromLocale(locale) = IvGetPrimaryFromLocale(Integer(node.Data)) then
      begin
        // Found the right language. Now finds the right country.

        node := node.GetFirstChild;
        while node <> nil do
        begin
          if IvGetSubFromLocale(locale) = IvGetSubFromLocale(Integer(node.Data)) then
          begin
            node.Selected := True;
            Exit;
          end;

          // Moves to the next country

          node := node.GetNextSibling;
        end;
        Exit;
      end;

      // Moves to the next language

      node := node.GetNextSibling;
    end;
  end;

begin
  inherited Create(owner);

  Self.HelpContext := helpContext;
  if helpContext = 0 then
    HelpButton.Hide;

  if msg = '' then
    case dialogType of
      ivldtLanguage: Caption := 'Select Language';
      ivldtSubLanguage: Caption := 'Select Sublanguage';
      ivldtLocale: Caption := 'Select Locale';
    end
  else
    Caption := msg;

  Translator.Dictionary := dictionary;
  if not (ivloUseNativeLanguage in options) then
    Translator.Targets.Add(TIvTargetProperty.Create('', 'Items', ivttInclude));

  case dialogType of
    ivldtLanguage:
    begin
      // Builds up the language list

      if dictionary.Languages[0].Primary = LANG_NEUTRAL then
        first := 1
      else
        first := 0;

      for i := first to dictionary.LanguageCount - 1 do
      begin
        language := dictionary.Languages[i];

        if (not (ivloShowAllLanguages in options)) and
          ((dictionary.CheckLevel = ivclCodePage) and
           (not dictionary.IsLanguageSupportedByCodePage(language))) or
          ((dictionary.CheckLevel = ivclSystem) and
           (not dictionary.IsLanguageSupportedBySystem(language))) then
        begin
          Continue;
        end;

        if ivloUseNativeLanguage in options then
          name := dictionary.Languages[i].NativeName
        else
          name := dictionary.Languages[i].EnglishName;
        TreeView.Items.AddObject(nil, name, TObject(i));
      end;

      // Translates the dialog

      Translator.Translate;
{$IFNDEF VER110}
      TreeView.SortType := stText;
{$ENDIF}

      // Select the active language

      for i := 0 to TreeView.Items.Count - 1 do
      begin
        if dictionary.ActiveLanguage = Integer(TreeView.Items[i].Data) then
        begin
          TreeView.Items[i].Selected := True;
          Break;
        end;
      end;
    end;

    ivldtSublanguage:
    begin
      if dictionary.Languages[0].Primary = LANG_NEUTRAL then
        first := 1
      else
        first := 0;

      for i := first to dictionary.LanguageCount - 1 do
      begin
        language := dictionary.Languages[i];

        if (not (ivloShowAllLanguages in options)) and
          ((dictionary.CheckLevel = ivclCodePage) and
           (not dictionary.IsLanguageSupportedByCodePage(language))) or
          ((dictionary.CheckLevel = ivclSystem) and
           (not dictionary.IsLanguageSupportedBySystem(language))) then
        begin
          Continue;
        end;

        // Checks if the language already exist in the tree

        node := nil;
        for j := 0 to TreeView.Items.Count - 1 do
        begin
          if Integer(TreeView.Items[j].Data) = language.Primary then
          begin
            node := TreeView.Items[j];
            Break;
          end;
        end;

        // If not found, adds the language to the tree

        if node = nil then
        begin
          if ivloUseNativeLanguage in options then
            name := language.NativeName
          else
            name := language.EnglishName;
          node := TreeView.Items.AddObject(nil, name, TObject(language.Primary));
        end;

        // Adds the locales of the language to the tree

        subs := TStringList.Create;
        dictionary.GetSubLanguages(language, subs, ivloUseNativeLanguage in options);
        for j := 0 to subs.Count - 1 do
        begin
          // Checks if the tree already contains the locale

          found := False;
          langId := Integer(subs.Objects[j]);
          for k := 0 to TreeView.Items.Count - 1 do
          begin
            if Integer(TreeView.Items[k].Data) = langId then
            begin
              found := True;
              Break;
            end;
          end;

          // If not, adds the locale to the tree

          if not found then
            TreeView.Items.AddChildObject(node, subs[j], TObject(langId));
        end;
        subs.Free;
      end;

      // Translates the dialog

      Translator.Translate;
      TreeView.SortType := stText;
      SelectNode(dictionary.LanguageLocale);
    end;

    ivldtLocale:
    begin
      // Dialog shows all available locales

      locales := TList.Create;
      try
        dictionary.GetLocales(locales);
        FillTreeViewWithLocales(TreeView, locales, options, dictionary);
      finally
        dictionary.FreeList(locales);
      end;  

      // Translates the dialog

      Translator.Translate;
      TreeView.SortType := stText;
      SelectNode(dictionary.Locale);
    end;
  end;
end;

function TIvLanguageDialog.GetSelectedValue: Integer;
begin
  Result := Integer(TreeView.Selected.Data);
end;

procedure TIvLanguageDialog.FormActivate(Sender: TObject);
begin
  if HelpContext = 0 then
    HelpButton.Hide;
end;

procedure TIvLanguageDialog.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TIvLanguageDialog.TreeViewDblClick(Sender: TObject);
begin
  if (TreeView.Selected = nil) or (TreeView.Selected.Count > 0) then
    Exit;

  Close;
  ModalResult := idOK;
end;

end.

