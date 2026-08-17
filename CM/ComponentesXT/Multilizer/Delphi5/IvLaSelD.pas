unit IvLaSelD;

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
  TIvLanguageSelectDialog = class(TForm)
    ListBox: TListBox;
    CancelButton: TButton;
    OkButton: TButton;
    HelpButton: TButton;
    Translator: TIvTranslator;
    procedure ListBoxDblClick(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);

  protected
    function GetLanguage: Integer;

  public
    constructor CreateParam(
      owner: TComponent;
      dictionary: TIvDictionary;
      const msg: String;
      options: TIvLanguageDialogOptions;
      helpContext: THelpContext);

    property Language: Integer read GetLanguage;
  end;

  function SelectLanguage(
    parent: TControl;
    dictionary: TIvDictionary;
    const msg: String;
    options: TIvLanguageDialogOptions;
    helpContext: THelpContext;
    var language: Integer): Boolean;

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
  dialog: TIvLanguageSelectDialog;
begin
  if not dictionary.IsOpen then
    raise EIvMulti.Create(
      'Dictionary is not open' +
      #10#13'You must open the dictionary before you can change the language');

  Result := False;
  dialog := TIvLanguageSelectDialog.CreateParam(
    nil,
    dictionary,
    msg,
    options,
    helpContext);

  if not (ivloNoCenter in options) then
    IvCenterControl(parent, dialog);

  if dialog.ShowModal = mrOk then
  begin
    language := dialog.Language;
    Result := True;
  end;
  dialog.Free;
end;

constructor TIvLanguageSelectDialog.CreateParam(
  owner: TComponent;
  dictionary: TIvDictionary;
  const msg: String;
  options: TIvLanguageDialogOptions;
  helpContext: THelpContext);
var
  i, first: Integer;
  language: TIvLanguage;
begin
  inherited Create(owner);

  if msg <> '' then
    Caption := msg;

  Self.HelpContext := helpContext;
  if helpContext = 0 then
    HelpButton.Hide;

  Translator.Dictionary := dictionary;
  if dictionary.Languages[0].Primary = LANG_NEUTRAL then
    first := 1
  else
    first := 0;

  if not (ivloUseNativeLanguage in options) then
    Translator.Targets.Add(TIvTargetProperty.Create('', 'Items', ivttInclude));

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

    if ivloUseNativeLanguage in options then
      ListBox.Items.AddObject(language.NativeName, TObject(i))
    else
      ListBox.Items.AddObject(language.EnglishName, TObject(i));
  end;

  Translator.Translate;

  for i := 0 to listBox.Items.Count - 1 do
    if dictionary.ActiveLanguage = Integer(listBox.Items.Objects[i]) then
    begin
      ListBox.ItemIndex := i;
      Break;
    end;
end;

function TIvLanguageSelectDialog.GetLanguage: Integer;
begin
  Result := Integer(ListBox.Items.Objects[ListBox.ItemIndex]);
end;

procedure TIvLanguageSelectDialog.ListBoxDblClick(Sender: TObject);
begin
  Close;
  ModalResult := idOK;
end;

procedure TIvLanguageSelectDialog.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

end.
