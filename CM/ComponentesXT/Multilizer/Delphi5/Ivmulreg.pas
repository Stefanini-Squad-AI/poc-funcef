{
  Registers the dictionary, translator and module components of Multilizer.

  Copyrights 1995-2000 Innoview Data Technologies Oy
}

unit IvMulReg;

{$I IVMULTI.INC}

interface

uses
  Classes, DsgnIntf;

type
  TIvFileNameProperty = class(TStringProperty)
  protected
    procedure BrowseFileName(const filter: String);

  public
    function GetAttributes: TPropertyAttributes; override;
  end;

  TIvMLDFileNameProperty = class(TIvFileNameProperty)
  public
    procedure Edit; override;
  end;

  TIvDictionaryNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

procedure Register;

implementation

uses
{$IFDEF WIN32}
  Windows, Registry,
  IvTargsD, IvLanguD, IvWReader, IvWParser, IvPassWD,
  {$IFDEF IVWIDE}
  IvDSMult, IvMLTP,
  {$ENDIF}
  {$IFNDEF VER93}
  ODBC, IvODBCDic, IvConnection,
  {$ENDIF}
{$ELSE}
  WinTypes, WinProcs,
  IvTarD16,
{$ENDIF}
  Forms, Controls, Dialogs, SysUtils, TypInfo,
  IvCommon, IvTargD, IvMulti, IvFiMult, IvBinDic, IvLaSelD, IvSuSelD,
  IvLoSelD, IvParser, IvReader, IvMlUtil, IvFiltEd, IvUsrDic, IvDictio,
  IvAMulti, IvTestDi, IvAboutD, IvConMod, IvDlgMod;


{ TIvTargetPropertiesProperty }

type
  TIvTargetPropertiesProperty = class(TClassProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

function TIvTargetPropertiesProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;

procedure TIvTargetPropertiesProperty.Edit;
var
  translator: TIvTranslator;
  targets: TIvTargetProperties;
  dialog: TIvTargetPropertiesDialog;
begin
  translator := GetComponent(0) as TIvTranslator;
  dialog := TIvTargetPropertiesDialog.Create(nil);
  dialog.SetItems(TIvTargetProperties(GetOrdValue));
{$IFDEF WIN32}
  dialog.Translator := translator;
{$ENDIF}

  try
    if dialog.ShowModal = mrOk then
    begin
      targets := TIvTargetProperties.Create;
      dialog.GetItems(targets);
      SetOrdValue(LongInt(targets));
      targets.Free;
    end;
  finally
    dialog.Free;
  end;
end;


{ TIvDictionaryEditor }

type
  TIvDictionaryEditor = class(TComponentEditor)
  public
    function GetVerbCount: Integer; override;
    function GetVerb(index: Integer): String; override;

    procedure ExecuteVerb(index: Integer); override;
    procedure Edit; override;
  end;

function TIvDictionaryEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

function TIvDictionaryEditor.GetVerb(index: Integer): String;
begin
  case index of
    0: Result := 'About...';
  end;
end;

procedure TIvDictionaryEditor.ExecuteVerb(index: Integer);
begin
  case index of
    0: Edit;
  end;
end;

procedure TIvDictionaryEditor.Edit;
var
  dialog: TIvAboutDialog;
begin
  dialog := TIvAboutDialog.Create(nil);
  try
    dialog.ShowModal;
  finally
    dialog.Free;
  end;
end;


{ TIvTranslatorEditor }

type
  TIvTranslatorEditor = class(TComponentEditor)
  public
    function GetVerbCount: Integer; override;
    function GetVerb(index: Integer): String; override;

    procedure ExecuteVerb(index: Integer); override;
    procedure Edit; override;

    procedure About;
{$IFDEF WIN32}
    procedure DetectTargets;
{$ENDIF}
  end;

const
  DEFAULT_TARGET_COUNT_C = 7;
  DEFAULT_TARGETS_C: array[0..DEFAULT_TARGET_COUNT_C - 1] of String =
  (
    'Caption',
    'Hint',
    'Items',
    'Lines',
    'Hints',
    'Tabs',
    'Text'
  );

function TIvTranslatorEditor.GetVerbCount: Integer;
begin
{$IFDEF WIN32}
  Result := 3;
{$ELSE}
  Result := 2;
{$ENDIF}
end;

function TIvTranslatorEditor.GetVerb(index: Integer): String;
begin
  case index of
    0: Result := 'About...';
    1: Result := 'Targets...';
{$IFDEF WIN32}
    2: Result := 'Detect targets';
{$ENDIF}
  end;
end;

procedure TIvTranslatorEditor.ExecuteVerb(index: Integer);
begin
  case index of
    0: About;
    1: Edit;
{$IFDEF WIN32}
    2: DetectTargets;
{$ENDIF}
  end;
end;

{$IFDEF WIN32}
procedure TIvTranslatorEditor.DetectTargets;
begin
  with Component as TIvTranslator do
    DetectTargets(Targets, False);
end;
{$ENDIF}

procedure TIvTranslatorEditor.About;
var
  dialog: TIvAboutDialog;
begin
  dialog := TIvAboutDialog.Create(nil);
  try
    dialog.ShowModal;
  finally
    dialog.Free;
  end;
end;

procedure TIvTranslatorEditor.Edit;
var
  translator: TIvTranslator;
  dialog: TIvTargetPropertiesDialog;
begin
  translator := Component as TIvTranslator;
  dialog := TIvTargetPropertiesDialog.Create(nil);
  dialog.SetItems(translator.Targets);
{$IFDEF WIN32}
  dialog.Translator := translator;
{$ENDIF}

  try
    if dialog.ShowModal = mrOk then
    begin
      translator.Targets.SetDefault;
      dialog.GetItems(translator.Targets);
      Designer.Modified;
    end;
  finally
    dialog.Free;
  end;
end;

{ TIvDictionaryNameProperty }

function TIvDictionaryNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;

procedure TIvDictionaryNameProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  for i := 0 to Dictionaries.Count - 1 do
    if Dictionaries[i].DictionaryName <> '' then
      Proc(Dictionaries[i].DictionaryName);
end;

{ TIvPrimaryLanguageProperty }

type
  TIvPrimaryLanguageProperty = class(TIntegerProperty)
  public
    procedure SetValue(const value: String); override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TIvPrimaryLanguageProperty.SetValue(const value: String);
var
  i, primary: Integer;
  tempValue, str: String;
  dictionary: TIvDictionary;
  parser: TIvStringParser;
begin
  dictionary := GetComponent(0) as TIvDictionary;

  { If locale has been bound to language the changing of the property is not
    possible. }

  if dictionary.Binding = ivbiLocaleToLanguage then
    dictionary.Binding := ivbiLanguageToLocale;
{
    raise EPropertyError.Create(
      'The PrimaryLanguage property has been bound to the Language property!'#13#10 +
      'Change it or set the Binding property to ivbiLanguageToLocale');
}

  { Gets the primary id }

  parser := TIvStringParser.CreateValue(value, ' ');
  try
    tempValue := parser.GetString;
  finally
    parser.Free;
  end;

  { Checks the value and sets the property }

  primary := -1;
  try
    dictionary.Open;
    if tempValue = '0' then
      primary := LANG_NEUTRAL
    else
    begin
      for i := 0 to dictionary.LanguageCount - 1 do
      begin
        str := IntToStr(dictionary.Languages[i].Primary);
        if tempValue = str then
        begin
          primary := dictionary.Languages[i].Primary;
          Break;
        end;
      end;
    end;

    { Updates the primary and the sub ids of the dictionary }

    if primary >= 0 then
    begin
      { Sets the primary and sub languages }

      SetOrdValue(primary);
      dictionary.SubLanguage := SUBLANG_NEUTRAL;

      { If the language has been bound to locale, sets the language }

      if dictionary.Binding = ivbiLanguageToLocale then
        dictionary.Language := dictionary.LocaleToLanguage(dictionary.Locale);
    end
    else
      raise EPropertyError.Create('''' + value + ''' is not supported by the dictionary');
  finally
    dictionary.Close;
  end;
end;

procedure TIvPrimaryLanguageProperty.GetValues(Proc: TGetStrProc);
var
  i, j: Integer;
  str: String;
  found: Boolean;
  languages: TStringList;
  dictionary: TIvDictionary;
  language: TIvLanguage;
begin
  dictionary := GetComponent(0) as TIvDictionary;

  languages := TStringList.Create;
  try
    try
      dictionary.Open;
      for i := dictionary.DefaultLanguage to dictionary.LanguageCount - 1 do
      begin
        language := dictionary.Languages[i];

        found := False;
        for j := 0 to languages.Count - 1 do
        begin
          if Integer(languages.Objects[j]) = language.Primary then
          begin
            found := True;
            Break;
          end;
        end;

        if not found then
        begin
          str := dictionary.ComposeLocaleName(
            language.EnglishName,
            '',
            language.Primary,
            SUBLANG_NEUTRAL,
            language.CodePage,
            False,
            nil);
          if str = '' then
            str := dictionary.Languages[i].EnglishName;
          languages.AddObject(IntToStr(language.Primary) + ' - ' + str, TObject(language.Primary));
         end;
      end;
    finally
      dictionary.Close;
    end;

    Proc('0 - Default');
    for i := 0 to languages.Count - 1 do
      Proc(languages[i]);
  finally
    languages.Free;
  end;
end;

function TIvPrimaryLanguageProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;


{ TIvSubLanguageProperty }

type
  TIvSubLanguageProperty = class(TIntegerProperty)
  public
    procedure SetValue(const value: String); override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TIvSubLanguageProperty.SetValue(const value: String);
var
  sub: Integer;
  parser: TIvStringParser;
  dictionary: TIvDictionary;
begin
  dictionary := GetComponent(0) as TIvDictionary;

  { If locale has been bound to language the changing of the property is not
    possible. }

  if dictionary.Binding = ivbiLocaleToLanguage then
    dictionary.Binding := ivbiLanguageToLocale;
{
    raise EPropertyError.Create(
      'The PrimaryLanguage property has been bound to the Language property!'#13#10 +
      'Change it or set the Binding property to ivbiLanguageToLocale');
}

  { Checks the value }

  parser := TIvStringParser.CreateValue(value, ' ');
  try
    try
      sub := parser.GetInteger;
    except
      raise EPropertyError.Create('''' + value + ''' is not an integer');
    end;

    if (sub < 0) or (sub > $3F) then
      raise EPropertyError.Create('''' + value + ''' is not a valid sub language value');

    SetOrdValue(sub);

    { If the language has been bound to locale, sets the language }

    if dictionary.Binding = ivbiLanguageToLocale then
    begin
      try
        dictionary.Open;
        dictionary.Language := dictionary.LocaleToLanguage(dictionary.Locale);
      finally
        dictionary.Close;
      end;
    end;
  finally
    parser.Free;
  end;
end;

procedure TIvSubLanguageProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  locales: TList;
  locale: TIvLocale;
  dictionary: TIvDictionary;
begin
  dictionary := GetComponent(0) as TIvDictionary;
  if dictionary.PrimaryLanguage = LANG_NEUTRAL then
  begin
    { Primary language is neutral }

    Proc('0 - Neutral');
    Proc('1 - User default');
    Proc('2 - System default');
  end
  else
  begin
    { Primary language is a specific langauge }

    locales := TList.Create;
    dictionary.Open;
    try
      Proc('0 - Neutral');
      dictionary.GetLocales(locales);
      for i := 0 to locales.Count - 1 do
      begin
        locale := TIvLocale(locales[i]);
        if locale.Primary = dictionary.PrimaryLanguage then
          Proc(IntToStr(locale.Sub) + ' - ' + locale.EnglishCountryName);
      end;
    finally
      dictionary.Close;
      dictionary.FreeList(locales);
    end;
  end;
end;

function TIvSubLanguageProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;


{ TIvLanguageProperty }

type
  TIvLanguageProperty = class(TIntegerProperty)
  public
    procedure SetValue(const value: String); override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TIvLanguageProperty.SetValue(const value: String);
var
  language: Integer;
  parser: TIvStringParser;
  dictionary: TIvDictionary;
begin
  dictionary := GetComponent(0) as TIvDictionary;

  { If language has been bound to locale the changing of the property is not
    possible. }

  if dictionary.Binding = ivbiLanguageToLocale then
    dictionary.Binding := ivbiLocaleToLanguage;
{
    raise EPropertyError.Create(
      'The Language property has been bound to the PrimaryLanguage and the SubLanguage properties!'#13#10 +
      'Change them or set the Binding property to ivbiLocaleToLanguage');
}

  { Sets the language }

  parser := TIvStringParser.CreateValue(value, ' ');
  try
    language := StrToIntDef(parser.GetString, -1);
    SetOrdValue(language);
  finally
    parser.Free;
  end;

  { If locale has been bound to language, sets it. }

  if dictionary.Binding = ivbiLocaleToLanguage then
  begin
    case language of
      -2:
      begin
        dictionary.PrimaryLanguage := 0;
        dictionary.SubLanguage := SUBLANG_SYS_DEFAULT;
      end;

      -1:
      begin
        dictionary.PrimaryLanguage := 0;
        dictionary.SubLanguage := SUBLANG_DEFAULT;
      end;
    else
      try
        dictionary.Open;
        dictionary.Locale := dictionary.Languages[language].Locale;
      finally
        dictionary.Close;
      end;
    end;
  end;
end;

procedure TIvLanguageProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  languages: TList;
  dictionary: TIvDictionary;
begin
  languages := TList.Create;
  try
    dictionary := GetComponent(0) as TIvDictionary;
    try
      dictionary.Open;
      dictionary.GetLanguageDatas(languages);
    finally
      dictionary.Close;
    end;

    Proc('-2 - System default');
    Proc('-1 - User default');
    for i := 0 to languages.Count - 1 do
      with TIvLanguage(languages[i]) do
      begin
        if Primary = LANG_NEUTRAL then
          Proc('0 - Native')
        else
          Proc(IntToStr(i) + ' - ' + EnglishName);
      end;
  finally
    TIvDictionary.FreeList(languages);
  end;
end;

function TIvLanguageProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;


{ TIvFileNameProperty }

function TIvFileNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paDialog
{$IFDEF WIN32}
    , paRevertable
{$ENDIF}
    ];
end;

procedure TIvFileNameProperty.BrowseFileName(const filter: String);
var
  dlg: TOpenDialog;
begin
  dlg := TOpenDialog.Create(nil);
  dlg.Filename := GetValue;
  dlg.Filter := filter;
  dlg.HelpContext := 0;
  dlg.Options := dlg.Options + [ofShowHelp, ofPathMustExist, ofFileMustExist];

  try
    if dlg.Execute then
      SetValue(dlg.Filename);
  finally
    dlg.Free;
  end;
end;


{ TIvMLDFileNameProperty }

procedure TIvMLDFileNameProperty.Edit;
begin
  BrowseFileName('Multilizer dictionary files (*.mld)|*.mld|All files (*.*)|*.*|');
end;


{ TIvTextFileNameProperty }

type
  TIvTextFileNameProperty = class(TIvFileNameProperty)
  public
    procedure Edit; override;
  end;

procedure TIvTextFileNameProperty.Edit;
begin
  BrowseFileName('Text files (*.txt)|*.txt|All files (*.*)|*.*|');
end;


{ TIvTestPrimaryProperty }

type
  TIvTestPrimaryProperty = class(TIntegerProperty)
  public
    procedure SetValue(const value: String); override;
    procedure GetValues(Proc: TGetStrProc); override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TIvTestPrimaryProperty.SetValue(const value: String);
var
  parser: TIvStringParser;
begin
  parser := TIvStringParser.CreateValue(value, ' ');
  try
    SetOrdValue(StrToIntDef(parser.GetString, 0));
  finally
    parser.Free;
  end;
end;

procedure TIvTestPrimaryProperty.GetValues(Proc: TGetStrProc);
const
  PRIMARIES_C: array[1..64] of String =
  (
    'Arabic',
    'Bulgarian',
    'Catalan',
    'Chinese',
    'Czech',
    'Danish',
    'German',
    'Greek',
    'English',
    'Spanish',
    'Finnish',
    'French',
    'Hebrew',
    'Hungarian',
    'Icelandic',
    'Italian',
    'Japanese',
    'Korean',
    'Dutch',
    'Norwegian',
    'Polish',
    'Portuguese',
    'Rhaeto-Romanic',
    'Romanian',
    'Russian',
    'Croatian/Serbian',
    'Slovak',
    'Albanian',
    'Swedish',
    'Thai',
    'Turkish',
    'Urdu',
    'Indonesian',
    'Ukrainian',
    'Belarusian',
    'Slovenian',
    'Estonian',
    'Latvian',
    'Lithuanian',
    '',
    'Farsi',
    'Vietnamese',
    '',
    '',
    'Basque',
    'Sorbian',
    'Macedonian',
    'Sutu',
    'Tsonga',
    'Tswana',
    'Venda',
    'Xhosa',
    'Zulu',
    'Afrikaans',
    '',
    'Faeroese',
    'Hindi',
    'Maltese',
    'Sami',
    'Scots Gaelic',
    '',
    '',
    '',
    ''
  );
var
  i: Integer;
  value, str: String;
  languages: TStringList;
begin
  languages := TStringList.Create;
  try
    for i := 1 to 64 do
    begin
      value := IntToStr(i);
{$IFDEF WIN32}
      str := GetLocaleStr(IvMakeLangId(i, SUBLANG_NEUTRAL), LOCALE_SENGLANGUAGE, '');
{$ELSE}
      str := '';
{$ENDIF}
      if str = '' then
        str := PRIMARIES_C[i];
      if str <> '' then
        value := value + ' - ' + TIvDictionary.ComposeLanguageName(str, i, 0, False, nil);
      languages.Add(value);
    end;

    Proc('0 - Default');
    for i := 0 to languages.Count - 1 do
      Proc(languages[i]);
  finally
    languages.Free;
  end;
end;

function TIvTestPrimaryProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList{$IFDEF WIN32}, paRevertable{$ENDIF}];
end;


{$IFDEF WIN32}
{ TIvCheckLevelProperty }

type
  TIvCheckLevelProperty = class(TEnumProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
  end;

function TIvCheckLevelProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paMultiSelect, paRevertable];
end;


  {$IFDEF IVWIDE}
type
  TIvMDSDictionaryNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

var
  LastMDSAddress, LastMDSUserName, LastMDSPassword: String;

function TIvMDSDictionaryNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TIvMDSDictionaryNameProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
  list: TStringList;
  dictionary: TIvServerDictionary;
  dialog: TIvPasswordDialog;
begin
  // Creates a temporaly dictionary that gets the available dictionary names.

  dictionary := TIvServerDictionary.Create(nil);

  if dictionary.Address = '' then
  begin
    MessageDlg(
      'You have not specified the Address property.',
      mtInformation,
      [mbOK],
      0);
    Exit;
  end;

  try
    with GetComponent(0) as TIvServerDictionary do
    begin
      dictionary.Address := Address;
      dictionary.Port := Port;
    end;

    while True do
    begin
      // Asks the user id

      if LastMDSAddress = dictionary.Address then
      begin
        // The user has previously logged in to this server

        dictionary.UserName := LastMDSUserName;
        dictionary.Password := LastMDSPassword;
      end
      else
      begin
        dialog := TIvPasswordDialog.Create(nil);
        try
          dialog.SavePassword.Visible := False;
          if dialog.ShowModal = mrOK then
          begin
            dictionary.UserName := dialog.UserName.Text;
            dictionary.Password := dialog.Password.Text;
          end
          else
            Exit;
        finally
          dialog.Free;
        end;
      end;

      // Makes a connection to MDS and gets the dictionary name

      try
        LastMDSAddress := '';
        LastMDSUserName := '';
        LastMDSPassword := '';
        try
          dictionary.Login;
        except
          on e: Exception do
          begin
            MessageDlg(
              'Could not log in to the Dictionary Server: ' + e.Message,
              mtError,
              [mbOK],
              0);
            Exit;
          end;
        end;

        list := TStringList.Create;
        dictionary.GetDictionaries(list, nil, nil);
        for i := 0 to list.Count - 1 do
          Proc(list[i]);
        list.Free;

        LastMDSAddress := dictionary.Address;
        LastMDSUserName := dictionary.UserName;
        LastMDSPassword := dictionary.Password;

        Break;
      finally
        dictionary.Logout;
      end;
    end;
  finally
    dictionary.Free;
  end;
end;
  {$ENDIF}

  {$IFNDEF VER93}
// TIvODBCTableNameProperty

type
  TIvODBCTableNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

var
  connection: TIvConnection;

function TIvODBCTableNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TIvODBCTableNameProperty.GetValues(Proc: TGetStrProc);
var
  dialog: TIvPasswordDialog;
  resultSet: TIvResultSet;
  dictionary: TIvODBCDictionary;
begin
  dictionary := GetComponent(0) as TIvODBCDictionary;

  // If the data source has changed since last connect, closes the connection

  if dictionary.DataSource <> connection.DataSource then
    connection.Close;
  connection.DataSource := dictionary.DataSource;

  // Connects to the database

  while True do
  begin
    // If the connection is not active and the user name/password was not given
    // ask them.

    if (not connection.Active) and
      ((dictionary.UserName = '') or (dictionary.Password = '')) then
    begin
      // No user id given. Asks one

      dialog := TIvPasswordDialog.Create(nil);
      try
        dialog.UserName.Text := dictionary.UserName;
        dialog.Password.Text := dictionary.Password;
        if dialog.ShowModal = mrOK then
        begin
          connection.UserName := dialog.UserName.Text;
          connection.Password := dialog.Password.Text;
        end
        else
          Exit;
      finally
        dialog.Free;
      end;
    end;

    resultSet := nil;
    try
      connection.Open;

      resultSet := connection.SelectTables;
      while resultSet.Next do
      begin
        if CompareText(resultSet.Columns[3].AsString, 'TABLE') = 0 then
          Proc(resultSet.Columns[2].AsString);
      end;
      resultSet.Free;
      Break;
    except
      resultSet.Free;
      connection.Close;
      dictionary.UserName := '';
      dictionary.Password := '';
      raise;
    end;
  end;
end;

// TIvDataSourceProperty

type
  TIvDataSourceProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

function TIvDataSourceProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TIvDataSourceProperty.GetValues(Proc: TGetStrProc);
var
  i: Integer;
begin
  for i := 0 to IvEnvironment.DataSourceCount - 1 do
    Proc(IvEnvironment.DataSources[i].ServerName);
end;
  {$ENDIF}
{$ENDIF}

procedure Register;
begin
  { Dictionary components }

  RegisterComponents(ML_SHEET_C, [TIvBinaryDictionary]);
  RegisterComponents(ML_SHEET_C, [TIvTextDictionary]);
{$IFDEF WIN32}
  {$IFDEF IVWIDE}
  RegisterComponents(ML_SHEET_C, [TIvServerDictionary]);
  {$ENDIF}
  {$IFNDEF VER93}
  if IsODBCAvailable then
    RegisterComponents(ML_SHEET_C, [TIvODBCDictionary]);
  {$ENDIF}
{$ENDIF}
  RegisterComponents(ML_SHEET_C, [TIvUserDictionary]);
  RegisterComponents(ML_SHEET_C, [TIvTestDictionary]);

  { Translator component }

  RegisterComponents(ML_SHEET_C, [TIvTranslator]);

  { Module components }

  RegisterComponents(ML_SHEET_C, [TIvControlModule]);
  RegisterComponents(ML_SHEET_C, [TIvDialogModule]);

  { Property editors }

  RegisterPropertyEditor(
    TypeInfo(Integer),
    TIvDictionary,
    'PrimaryLanguage',
    TIvPrimaryLanguageProperty);

  RegisterPropertyEditor(
    TypeInfo(Integer),
    TIvDictionary,
    'SubLanguage',
    TIvSubLanguageProperty);

  RegisterPropertyEditor(
    TypeInfo(Integer),
    TIvDictionary,
    'Language',
    TIvLanguageProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvBinaryDictionary,
    'FileName',
    TIvMLDFileNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvTextDictionary,
    'FileName',
    TIvTextFileNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvTextDictionary,
    'LanguageFileName',
    TIvTextFileNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvTextDictionary,
    'LocaleFileName',
    TIvTextFileNameProperty);

  RegisterPropertyEditor(
    TypeInfo(String),
    TIvCustomTranslator,
    'DictionaryName',
    TIvDictionaryNameProperty);

  RegisterPropertyEditor(
    TypeInfo(TIvTargetProperties),
    TIvTranslator,
    'Targets',
    TIvTargetPropertiesProperty);

  RegisterPropertyEditor(
    TypeInfo(Integer),
    TIvTestDictionary,
    'TestPrimary',
    TIvTestPrimaryProperty);

{$IFDEF IVWIDE}
  RegisterPropertyEditor(
    TypeInfo(String),
    TIvServerDictionary,
    'RemoteDictionaryName',
    TIvMDSDictionaryNameProperty);
{$ENDIF}

{$IFDEF WIN32}
  RegisterPropertyEditor(
    TypeInfo(TIvCheckLevel),
    TIvDictionary,
    'CheckLevel',
    TIvCheckLevelProperty);

  {$IFNDEF VER93}
  if IsODBCAvailable then
  begin
    RegisterPropertyEditor(
      TypeInfo(String),
      TIvODBCDictionary,
      'TableName',
      TIvODBCTableNameProperty);

    RegisterPropertyEditor(
      TypeInfo(String),
      TIvODBCDictionary,
      'LanguageTableName',
      TIvODBCTableNameProperty);

    RegisterPropertyEditor(
      TypeInfo(String),
      TIvODBCDictionary,
      'LocaleTableName',
      TIvODBCTableNameProperty);

    RegisterPropertyEditor(
      TypeInfo(String),
      TIvODBCDictionary,
      'DataSource',
      TIvDataSourceProperty);
  end;
  {$ENDIF}
{$ENDIF}

  RegisterComponentEditor(TIvTranslator, TIvTranslatorEditor);
  RegisterComponentEditor(TIvDictionary, TIvDictionaryEditor);
end;

end.

