unit IvLoSelD;

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
  TIvLocaleSelectDialog = class(TForm)
    ListBox: TListBox;
    CancelButton: TButton;
    OkButton: TButton;
    HelpButton: TButton;
    Translator: TIvTranslator;
    procedure ListBoxDblClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);

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

  function SelectLocale(
    parent: TControl;
    dictionary: TIvDictionary;
    const msg: String;
    options: TIvLanguageDialogOptions;
    helpContext: THelpContext;
    var locale: Integer): Boolean;

implementation

{$R *.DFM}

function SelectLocale(
  parent: TControl;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext;
  var locale: Integer): Boolean;
var
  dialog: TIvLocaleSelectDialog;
begin
  if not dictionary.IsOpen then
    raise EIvMulti.Create(
      'Dictionary is not open' +
      #10#13'You must open the dictionary before you can change the locale');

  Result := False;
  dialog := TIvLocaleSelectDialog.CreateParam(
    nil,
    dictionary,
    msg,
    options,
    helpContext);

  if not (ivloNoCenter in options) then
    IvCenterControl(parent, dialog);

  if dialog.ShowModal = mrOk then
  begin
    locale := dialog.Locale;
    Result := True;
  end;
  dialog.Free;
end;

constructor TIvLocaleSelectDialog.CreateParam(
  owner: TComponent;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext);
var
  i: Integer;
  str: String;
  locale: TIvLocale;
  locales: TList;
begin
  inherited Create(owner);

  if msg <> '' then
    Caption := msg;

  Screen.Cursor := crHourglass;
  Self.HelpContext := helpContext;

  { Gets the sub language ids }

  locales := TList.Create;
  dictionary.GetLocales(locales);

  for i := 0 to locales.Count - 1 do
  begin
    locale := TIvLocale(locales[i]);

{$IFDEF WIN32}
    if (not (ivloShowAllLanguages in options)) and
      ((dictionary.CheckLevel = ivclCodePage) and
       (not dictionary.IsLocaleSupportedByCodePage(locale))) or
      ((dictionary.CheckLevel = ivclSystem) and
       (not IvIsCodePageSupportedBySystem(locale.CodePage))) then
    begin
      Continue;
    end;
{$ENDIF}

    if ivloUseNativeLanguage in options then
      str := locale.GetDisplayName(ivdnNative, dictionary)
    else
      str := locale.GetDisplayName(ivdnTranslated, dictionary);

    ListBox.Items.AddObject(str, TObject(locale.Locale));
  end;

  dictionary.FreeList(locales);

  Translator.Dictionary := dictionary;
  Translator.Translate;

  for i := 0 to listBox.Items.Count - 1 do
  begin
    if dictionary.Locale = Integer(listBox.Items.Objects[i]) then
    begin
      ListBox.ItemIndex := i;
      Break;
    end;
  end;

  Screen.Cursor := crDefault;
end;

function TIvLocaleSelectDialog.GetLocale: Integer;
begin
  Result := Integer(ListBox.Items.Objects[ListBox.ItemIndex]);
end;

procedure TIvLocaleSelectDialog.ListBoxDblClick(Sender: TObject);
begin
  Close;
  ModalResult := idOK;
end;

procedure TIvLocaleSelectDialog.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

end.
