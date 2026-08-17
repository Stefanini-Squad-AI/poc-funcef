unit IvSuSeld;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}               
  Classes, Graphics, Forms, Controls, Buttons, StdCtrls,
  IvDictio, IvMulti;

type
  TIvSubLanguageSelectDialog = class(TForm)
    ListBox: TListBox;
    CancelButton: TButton;
    OkButton: TButton;
    Translator: TIvTranslator;
    HelpButton: TButton;
    procedure ListBoxDblClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  protected
    function GetLocale: Integer;

  public
    constructor CreateParam(
      owner: TComponent;
      dictionary: TIvDictionary;
      const msg: String;
      options: TIvLanguageDialogOptions;
      helpContext: THelpContext);

    property Locale: Integer read GetLocale;
  end;

  function SelectSublanguage(
    parent: TControl;
    dictionary: TIvDictionary;
    const msg: String;
    options: TIvLanguageDialogOptions;
    helpContext: THelpContext;
    var langId: Integer): Boolean;

implementation

uses
  SysUtils;

{$R *.DFM}

function SelectSublanguage(
  parent: TControl;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext;
  var langId: Integer): Boolean;
var
  dialog: TIvSubLanguageSelectDialog;
begin
  if not dictionary.IsOpen then
    raise EIvMulti.Create(
      'Dictionary is not open' +
      #10#13'You must open the dictionary before you can change the language');

  Result := False;
  dialog := TIvSubLanguageSelectDialog.CreateParam(
    nil,
    dictionary,
    msg,
    options,
    helpContext);

  if not (ivloNoCenter in options) then
    IvCenterControl(parent, dialog);

  if dialog.ShowModal = mrOk then
  begin
    langId := dialog.Locale;
    Result := True;
  end;
  dialog.Free;
end;

constructor TIvSubLanguageSelectDialog.CreateParam(
  owner: TComponent;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext);
var
  i, j, k, first, langId: Integer;
  found: Boolean;
  locales: TList;
  subs: TStringList;
  displayName: TIvDisplayName;
  language: TIvLanguage;
  locale: TIvLocale;
begin
  inherited Create(owner);

  if msg <> '' then
    Caption := msg;

  Self.HelpContext := helpContext;

  Translator.Dictionary := dictionary;
  Translator.Translate;

  { Gets the sub language ids }

  if dictionary.Languages[0].Primary = LANG_NEUTRAL then
    first := 1
  else
    first := 0;

  Screen.Cursor := crHourglass;
  locales := TList.Create;
  dictionary.GetLocales(locales);

  for i := first to dictionary.LanguageCount - 1 do
  begin
    language := dictionary.Languages[i];

{$IFDEF WIN32}
    if (not (ivloShowAllLanguages in options)) and
      ((dictionary.CheckLevel = ivclCodePage) and
       (not dictionary.IsLanguageSupportedByCodePage(language))) or
      ((dictionary.CheckLevel = ivclSystem) and
       (not dictionary.IsLanguageSupportedBySystem(language))) then
    begin
      Continue;
    end;
{$ENDIF}

    subs := TStringList.Create;
    dictionary.GetSubLanguages(language, subs, ivloUseNativeLanguage in options);
    for j := 0 to subs.Count - 1 do
    begin
      langId := Integer(subs.Objects[j]);

      { Checks if the list already contains the locale }

      found := False;
      for k := 0 to listBox.Items.Count - 1 do
      begin
        if Integer(listBox.Items.Objects[k]) = langId  then
        begin
          found := True;
          Break;
        end;
      end;

      if found then
        Continue;

      { Adds the locale to the list }

      if ivloUseNativeLanguage in options then
        displayName := ivdnNative
      else
        displayName := ivdnTranslated;

      for k := 0 to locales.Count - 1 do
      begin
        locale := TIvLocale(locales[k]);
        if locale.Locale = langId then
        begin
          ListBox.Items.AddObject(
            locale.GetDisplayName(displayName, dictionary),
            TObject(langId));
          Break;
        end;    
      end;
    end;
    subs.Free;
  end;

  dictionary.FreeList(locales);
  Screen.Cursor := crDefault;

  for i := 0 to listBox.Items.Count - 1 do
    if dictionary.Locale = Integer(listBox.Items.Objects[i]) then
    begin
      ListBox.ItemIndex := i;
      Break;
    end;
end;

function TIvSubLanguageSelectDialog.GetLocale: Integer;
begin
  Result := Integer(ListBox.Items.Objects[ListBox.ItemIndex]);
end;

procedure TIvSubLanguageSelectDialog.ListBoxDblClick(Sender: TObject);
begin
  Close;
  ModalResult := idOK;
end;

procedure TIvSubLanguageSelectDialog.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

procedure TIvSubLanguageSelectDialog.FormActivate(Sender: TObject);
begin
  if HelpContext = 0 then
    HelpButton.Hide;
end;

end.
