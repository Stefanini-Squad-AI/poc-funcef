unit IvWMLDFi;

{$I IVMULTI.INC}

{$A-} { Byte align }

interface

uses
  Windows, Classes,
  IvCommon, IvDictio, IvMLDFil, IvMLTP, IvStrLst;

type
  TIvWriteableMLDFile = class(TIvMLDFile)
  protected
    FFileName: String;
    FTempFileName: String;

    procedure WriteByte(value: Integer);
    procedure WriteBoolean(value: Boolean);
    procedure WriteWord(value: Integer);
    procedure WriteDWord(value: Longint);
    procedure WriteChar(value: Char; codePage: Integer);
    procedure WriteChars(const value: String; len, codePage: Integer);
    procedure WriteAnsiChars(const value: String; len: Integer);
    procedure WriteWideChars(value: TIvWideString; len: Integer);
    procedure WriteString(const value: String; codePage: Integer);

    procedure StartBlock;
    procedure EndBlock;

    procedure WriteHeader;

  public
    procedure GetAnsiTranslations(
      list: TIvStringList;
      context: TIvContext;
      count: Integer);
    procedure GetWideTranslations(
      list: TIvWideStringList;
      context: TIvContext;
      count: Integer);

    procedure OpenForUpdate(const fileName: String);
    procedure Edit(
      const fileName: String;
      byteOrder: TIvByteOrder;
      characterSet: TIvCharacterSet;
      context: TIvContextType;
      version: Integer);

    procedure WriteLanguage(value: TIvLanguage);

    procedure WriteAnsiString(const value: String);
    procedure WriteAnsiTranslation(
      list: TIvStringList;
      context: TIvContext);

    procedure WriteWideString(const value: WideString);
    procedure WriteWideTranslation(
      list: TIvWideStringList;
      context: TIvContext);

    procedure WriteLocale(value: TIvLocale);

    procedure WriteInfo(
      const description, owner: String;
      users: TStrings);

    procedure SetInfo(
      const description, owner: String;
      users: TStrings);

    procedure Post;
    procedure Cancel;

    property FileName: String read FFileName;
  end;

implementation

uses
  SysUtils;

function IvNow(system: Boolean): TDateTime;
var
  SystemTime: TSystemTime;
begin
  if system then
    GetSystemTime(SystemTime)
  else
    GetLocalTime(SystemTime);
  with SystemTime do
    Result :=
      EncodeDate(wYear, wMonth, wDay) +
      EncodeTime(wHour, wMinute, wSecond, wMilliseconds);
end;

procedure TIvWriteableMLDFile.GetAnsiTranslations(
  list: TIvStringList;
  context: TIvContext;
  count: Integer);
var
  i, c: Integer;
  str, form, component: String;
begin
  if count < 0 then
    count := FHeader.languageCount;

  c := count;
  if c > FHeader.languageCount then
    c := FHeader.languageCount;

  for i := 0 to c - 1 do
  begin
    str := ReadAnsiString;
    list.Add(str);

    if i = 0 then
    begin
      if ivctForm in ContextType then
        form := ReadAnsiString;

      if ivctComponent in ContextType then
        component := ReadAnsiString;

      if context <> nil then
      begin
        context.Form := form;
        context.Component := component;
      end;
    end;
  end;

  for i := c to FHeader.languageCount - 1 do
    str := ReadAnsiString;

  for i := c to count - 1 do
    list.Add('');
end;

procedure TIvWriteableMLDFile.GetWideTranslations(
  list: TIvWideStringList;
  context: TIvContext;
  count: Integer);
var
  i, c: Integer;
  str, form, component: WideString;
begin
  if count < 0 then
    count := FHeader.languageCount;

  c := count;
  if c > FHeader.languageCount then
    c := FHeader.languageCount;

  for i := 0 to c - 1 do
  begin
    str := ReadWideString;
    list.Add(str);

    if i = 0 then
    begin
      if ivctForm in ContextType then
        form := ReadWideString;

      if ivctComponent in ContextType then
        component := ReadWideString;

      if context <> nil then
      begin
        context.Form := form;
        context.Component := component;
      end;
    end;
  end;

  for i := c to FHeader.languageCount - 1 do
    str := ReadWideString;

  for i := c to count - 1 do
    list.Add('');
end;

procedure TIvWriteableMLDFile.OpenForUpdate(const fileName: String);
begin
  Close;
  FStream := TFileStream.Create(fileName, fmOpenReadWrite);
  ReadHeader;
end;

procedure TIvWriteableMLDFile.Edit(
  const fileName: String;
  byteOrder: TIvByteOrder;
  characterSet: TIvCharacterSet;
  context: TIvContextType;
  version: Integer);
var
  i: Integer;
begin
  Close;

  FTempFileName := IvGetTempFileName('dic');
  FFileName := fileName;
  FStream := TFileStream.Create(FTempFileName, fmCreate or fmOpenReadWrite);
  FFreeStream := True;

  if version > MLD_VERSION_C then
    version := MLD_VERSION_C;
  if version < 3 then
    context := [];

  FHeader.tag := MLD_TAG_C;
  FHeader.version := version;
  FHeader.byteOrder := byteOrder;
  FHeader.characterSet := characterSet;
  FHeader.context := TIvContext.ContextTypeToCode(context);
  FHeader.languageCount := 0;
  FHeader.languageOffset := 0;
  FHeader.translationCount := 0;
  FHeader.translationOffset := 0;
  FHeader.localeCount := 0;
  FHeader.localeOffset := 0;
  FHeader.infoSize := 0;
  FHeader.infoOffset := 0;
  for i := 0 to Sizeof(FHeader.reserved1) - 1 do
    FHeader.reserved1[i] := 0;
  for i := 0 to Sizeof(FHeader.reserved2) - 1 do
    FHeader.reserved2[i] := 0;
  WriteHeader;
end;

procedure TIvWriteableMLDFile.WriteByte(value: Integer);
var
  b: Byte;
begin
  b := value;
  FStream.WriteBuffer(b, Sizeof(b));
end;

procedure TIvWriteableMLDFile.WriteBoolean(value: Boolean);
begin
  WriteByte(Byte(value));
end;

procedure TIvWriteableMLDFile.WriteWord(value: Integer);
var
  w: Word;
begin
  w := value;
  if ByteOrder = ivboBigEndian then
    IvChangeWordByteOrder(w);
  FStream.WriteBuffer(w, Sizeof(w));
end;

procedure TIvWriteableMLDFile.WriteDWord(value: Longint);
var
  dw: DWord;
begin
  dw := value;
  if ByteOrder = ivboBigEndian then
    IvChangeDWordByteOrder(dw);
  FStream.WriteBuffer(dw, Sizeof(dw));
end;

procedure TIvWriteableMLDFile.WriteChar(value: Char; codePage: Integer);
begin
  WriteChars(value, 1, codePage);
end;

{ WriteXXXChars }

procedure TIvWriteableMLDFile.WriteChars(const value: String; len, codePage: Integer);
begin
  if CharacterSet = ivcsUnicode then
    WriteWideChars(IvStrToWStr(value, codePage), len)
  else
    WriteAnsiChars(value, len);
end;

procedure TIvWriteableMLDFile.WriteAnsiChars(const value: String; len: Integer);
begin
  if len > 0 then
    FStream.WriteBuffer(value[1], len);
end;

procedure TIvWriteableMLDFile.WriteWideChars(value: TIvWideString; len: Integer);
begin
  if len > 0 then
  begin
    if ByteOrder = ivboBigEndian then
     IvChangeStringByteOrder(value);
    FStream.WriteBuffer(value[1], 2*len);
  end;
end;

{ WriteXXXString }

procedure TIvWriteableMLDFile.WriteString(const value: String; codePage: Integer);
begin
  if CharacterSet = ivcsUnicode then
    WriteWideString(IvStrToWStr(value, codePage))
  else
    WriteAnsiString(value);
end;

procedure TIvWriteableMLDFile.WriteAnsiString(const value: String);
var
  len: Word;
begin
  len := Length(value);
  WriteWord(len);
  WriteAnsiChars(value, len);
end;

procedure TIvWriteableMLDFile.WriteWideString(const value: WideString);
var
  len: Word;
begin
  len := Length(value);
  WriteWord(len);
  WriteWideChars(value, len);
end;

procedure TIvWriteableMLDFile.Post;
begin
  WriteHeader;
  Close;
  DeleteFile(FFileName);
  if not MoveFile(PChar(FTempFileName), PChar(FFileName)) then
    raise Exception.Create('Could not post the MLD file');
end;

procedure TIvWriteableMLDFile.Cancel;
begin
  Close;
  DeleteFile(FTempFileName);
end;

procedure TIvWriteableMLDFile.WriteHeader;
var
  header: TIvMLDHeader;
begin
  header := FHeader;
  if header.ByteOrder = ivboBigEndian then
  begin
    IvChangeWordByteOrder(header.languageCount);
    IvChangeDWordByteOrder(header.languageOffset);
    IvChangeWordByteOrder(header.translationCount);
    IvChangeDWordByteOrder(header.translationOffset);
    IvChangeWordByteOrder(header.localeCount);
    IvChangeDWordByteOrder(header.localeOffset);
    IvChangeWordByteOrder(header.infoSize);
    IvChangeDWordByteOrder(header.infoOffset);
  end;
  FStream.Seek(0, soFromBeginning);
  FStream.WriteBuffer(header, Sizeof(header));
end;

procedure TIvWriteableMLDFile.StartBlock;
begin
  if FHeader.version >= 3 then
  begin
    FBlockSize := FStream.Position;
    WriteWord(0);
  end;
end;

procedure TIvWriteableMLDFile.EndBlock;
var
  position: Integer;
begin
  if FHeader.version >= 3 then
  begin
    position := FStream.Position;
    FStream.Seek(FBlockSize, soFromBeginning);
    WriteWord(position - FBlockSize);
    FStream.Seek(position, soFromBeginning);
  end;
end;

procedure TIvWriteableMLDFile.WriteLanguage(value: TIvLanguage);

  procedure WriteISOCode(const code: String);
  begin
    if code = '' then
    begin
      if CharacterSet = ivcsUnicode then
        WriteWideChars(#0#0, 2)
      else
        WriteAnsiChars(#0#0, 2);
    end
    else
      WriteChars(code, 2, CP_ACP);
  end;

begin
  if FHeader.languageCount = 0 then
    FHeader.languageOffset := FStream.Position;

  StartBlock;

  WriteWord(value.Primary);
  if FHeader.version >= 2 then
    WriteISOCode(value.ISOLanguage);

  WriteWord(value.DefaultSub);
  if FHeader.version >= 2 then
    WriteISOCode(value.ISODefaultCountry);

  WriteString(value.AllSubs, CP_ACP);
  if FHeader.version >= 2 then
    WriteString(value.ISOAllCountries, CP_ACP);

  if FHeader.version >= 3 then
    WriteWord(value.Charset);
  WriteWord(value.CodePage);
  WriteByte(value.OptionsAsInt);

  WriteString(value.EnglishName, CP_ACP);
  WriteString(value.NativeName, value.CodePage);
  WriteString(value.FontName, CP_ACP);
  WriteByte(value.FontSize);

  EndBlock;

  Inc(FHeader.languageCount);
end;

procedure TIvWriteableMLDFile.WriteAnsiTranslation(
  list: TIvStringList;
  context: TIvContext);
var
  i: Integer;
begin
  if FHeader.translationCount = 0 then
    FHeader.translationOffset := FStream.Position;

  for i := 0 to list.Count - 1 do
  begin
    WriteAnsiString(list[i]);
    if (i = 0) and (context <> nil) and (Version >= 3) then
    begin
      if UseFormContext then
        WriteAnsiString(context.Form);
      if UseComponentContext then
        WriteAnsiString(context.Component);
    end;
  end;
  Inc(FHeader.translationCount);
end;

procedure TIvWriteableMLDFile.WriteWideTranslation(
  list: TIvWideStringList;
  context: TIvContext);
var
  i: Integer;
begin
  if FHeader.translationCount = 0 then
    FHeader.translationOffset := FStream.Position;

  for i := 0 to list.Count - 1 do
  begin
    WriteWideString(list[i]);
    if (i = 0) and (Version >= 3) then
    begin
      if UseFormContext then
        WriteWideString(context.Form);
      if UseComponentContext then
        WriteWideString(context.Component);
    end;
  end;
  Inc(FHeader.translationCount);
end;

procedure TIvWriteableMLDFile.WriteLocale(value: TIvLocale);
var
  i, codePage: Integer;
begin
  if FHeader.localeCount = 0 then
    FHeader.localeOffset := FStream.Position;

  StartBlock;

  WriteWord(value.Primary);
  if FHeader.version >= 2 then
    WriteChars(value.ISOLanguage, 2, CP_ACP);

  WriteWord(value.Sub);
  if FHeader.version >= 2 then
    WriteChars(value.ISOCountry, 2, CP_ACP);

  if FHeader.version >= 3 then
    WriteWord(value.Charset);
  codePage := value.CodePage;
  WriteWord(codePage);
  WriteBoolean(value.IsCustom);

  WriteString(value.EnglishLanguageName, CP_ACP);
  WriteString(value.EnglishCountryName, CP_ACP);
  WriteString(value.NativeLanguageName, codePage);
  WriteString(value.NativeCountryName, codePage);
  WriteString(value.Win16LanguageName, CP_ACP);
  WriteString(value.Win16CountryName, CP_ACP);

  WriteByte(Byte(value.MeasurementSystem));
  WriteString(value.CurrencyString, codePage);
  WriteByte(Byte(value.CurrencyFormat));
  WriteByte(Byte(value.NegCurrFormat));
  WriteByte(value.CurrencyDecimals);
  WriteChar(value.ThousandSeparator, codePage);
  WriteChar(value.DecimalSeparator, codePage);

  WriteChar(value.DateSeparator, codePage);
  WriteString(value.ShortDateFormat, codePage);
  WriteString(value.LongDateFormat, codePage);

  WriteChar(value.TimeSeparator, codePage);
  WriteString(value.TimeAMString, codePage);
  WriteString(value.TimePMString, codePage);
  WriteBoolean(value.TimeLeadingZeros);
  WriteByte(Byte(value.TimeFormat));
  WriteByte(Byte(value.TimeMarkPosition));

  WriteByte(Byte(value.CalendarType));
  WriteByte(Byte(value.OptionalCalendarType));
  WriteByte(Byte(value.FirstDayOfWeek));
  WriteByte(Byte(value.FirstWeekOfYear));

  for i := 1 to 12 do
    WriteString(value.ShortMonthNames[i], codePage);
  for i := 1 to 12 do
    WriteString(value.LongMonthNames[i], codePage);
  for i := 1 to 7 do
    WriteString(value.ShortDayNames[i], codePage);
  for i := 1 to 7 do
    WriteString(value.LongDayNames[i], codePage);

  EndBlock;

  Inc(FHeader.localeCount);
end;

procedure TIvWriteableMLDFile.WriteInfo(
  const description, owner: String;
  users: TStrings);
var
  i: Integer;
  time: TDateTime;
  year, month, day, hour, min, sec, mSec: Word;
begin
  FHeader.infoOffset := FStream.Position;

  WriteString(description, CP_ACP);
  WriteString(owner, CP_ACP);
  if users = nil then
    WriteWord(0)
  else
  begin
    WriteWord(users.Count);
    for i := 0 to users.Count - 1 do
      WriteString(users[i], CP_ACP);
  end;

  if FHeader.version >= 3 then
  begin
    // Gets the current system time (GMT) and writes it to the file

    time := IvNow(True);

    DecodeDate(time, year, month, day);
    WriteByte(day);
    WriteByte(month);
    WriteWord(year);

    DecodeTime(time, hour, min, sec, mSec);
    WriteByte(hour);
    WriteByte(min);
    WriteByte(sec);
  end;

  FHeader.infoSize := DWORD(FStream.Position) - FHeader.infoOffset;
end;

procedure TIvWriteableMLDFile.SetInfo(
  const description, owner: String;
  users: TStrings);
begin
  GoInfoSection;
  WriteInfo(description, owner, users);
end;

end.
