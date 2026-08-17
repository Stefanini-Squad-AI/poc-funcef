unit QExport3ASCII;

{$I VerCtrl.inc}

interface

uses Classes, QExport3, IniFiles;

type
  TQExportASCIIType = (etTXT, etCSV, etDIF, etSYLK);
  TExportState = (stFetching, stWritting);

  TQExport3ASCII = class(TQExport3FormatText)
  private
    FExportType: TQExportASCIIType;
    FCSVComma: char;
    FCSVQuote: char;
    FCSVQuoteStrings: boolean;
    FTXTSpacing: integer;

    FExportState: TExportState;
    FTotalRows: integer;

    procedure SetExportType(const Value: TQExportASCIIType);
  protected
    procedure BeginExport; override;
    function GetColCaption(Index: integer): string; override;
    function GetColData(ExportCol: TQExportCol): string; override;
    function GetCaptionRow: string; override;
    procedure WriteCaptionRow; override;
    function GetDataRow(NeedFormat: boolean): string; override;
    procedure WriteDataRow; override;
    procedure EndExport; override;
    procedure RecordFetched(RecNo: integer); dynamic;
    procedure SaveProperties(IniFile: TIniFile); override;
    procedure LoadProperties(IniFile: TIniFile); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Abort; override;
    function NormalString(const S: string): string; override;
  published
    property ExportType: TQExportASCIIType read FExportType
      write SetExportType default etTXT;
    property CSVComma: char read FCSVComma write FCSVComma;
    property CSVQuote: char read FCSVQuote write FCSVQuote default '"';
    property CSVQuoteStrings: boolean read FCSVQuoteStrings
      write FCSVQuoteStrings default true;
    property TXTSpacing: integer read FTXTSpacing write FTXTSpacing default 1;

    property AutoCalcColWidth default true;
    property ColumnsAlign;
    property ColumnsWidth;
    property OnFetchedRecord;
  end;

implementation

uses SysUtils, Db, QExport3Common, QExport3Types;

{ TQExport3ASCII }

constructor TQExport3ASCII.Create(AOwner: TComponent);
begin
  inherited;
  FExportType := etTXT;
  FCSVComma := GetListSeparator;
  FCSVQuote := '"';
  FCSVQuoteStrings := true;
  FTXTSpacing := 1;
  AutoCalcColWidth := true;
  FTotalRows := 0;
end;

procedure TQExport3ASCII.Abort;
var
  i: integer;
begin
  case FExportType of
    etTXT:
      case FExportState of
        stFetching: begin
        end;
        stWritting: begin
          GetWriter.EmptyLine;
          for i := 0 to Footer.Count - 1 do GetWriter.WriteLn(Footer[i]);
        end;
      end;
    etSylk: if FExportState = stWritting then GetWriter.WriteLn('E');
    etDIF: begin
      GetWriter.WriteLn('-1,0');
      GetWriter.WriteLn('EOD');
    end;
    etCSV: begin
      GetWriter.EmptyLine;
      for i := 0 to Footer.Count - 1 do GetWriter.WriteLn(Footer[i] + FCSVComma);
    end;
  end;
  inherited;
end;

procedure TQExport3ASCII.BeginExport;
var
  i: integer;
  Bookmark: TBookmark;
begin
  inherited;
  AutoCalcColWidth := AutoCalcColWidth and (ExportType = etTXT);
  case ExportType of
    etTXT: begin
      if Title <> EmptyStr then begin
        GetWriter.WriteLn(Title);
        GetWriter.CharLine('-', 80);
        GetWriter.EmptyLine;
      end;
      for i := 0 to Header.Count - 1 do
        GetWriter.WriteLn(Header[i]);
    end;
    etDIF: begin             // DIF header
      FTotalRows := 0;
      GetWriter.WriteLn('TABLE');
      GetWriter.WriteLn('0,1');
      GetWriter.WriteLn('"' + Title + '"');
      GetWriter.WriteLn('VECTORS');
      GetWriter.WriteLn('0,' + IntToStr(Columns.Count));
      GetWriter.WriteLn('""');
      GetWriter.WriteLn('TUPLES');
      Bookmark := GetBookmark;
      try
        FExportState := stFetching;
        First;
        Skip(SkipRecCount);
        RecordCounter := 0;
        while (not EndOfFile) and
          ((ExportRecCount = 0) or (RecordCounter < ExportRecCount)) do begin
          if Aborted and not CanContinue then Exit;
          Next;
          RecordFetched(RecordCounter);
        end;
        GoToBookmark(Bookmark);
      finally
        FreeBookmark(Bookmark);
      end;
      GetWriter.WriteLn('0,' + IntToStr(FTotalRows));
      GetWriter.WriteLn('""');
      GetWriter.WriteLn('DATA');
      GetWriter.Writeln('0,0');
    end;
    etSylk: GetWriter.WriteLn('ID;PVASCIIEXPORT');
    etCSV: for i := 0 to Header.Count - 1 do
             GetWriter.WriteLn(Header[i] {+ FCSVComma});
  end;
end;

function TQExport3ASCII.GetColCaption(Index: integer): string;
var
  str: string;
begin
  Result := inherited GetColCaption(Index);

  case ExportType of
    etCSV: begin
      if FCSVQuoteStrings and (CSVQuote <> #0) then
        Result := AnsiQuotedStr(Result, CSVQuote);
      Result := Result + FCSVComma;
    end;
    etDIF: begin
      str := EmptyStr;
      if Index = 0 then str := '-1,0' + CRLF + 'BOT' + CRLF;
      Result := str + '1,0' + CRLF + '"' + Result + '"' + CRLF;
    end;
    etSylk: Result := 'C;X' + IntToStr(Index + 1) + ';Y1;K"' + Result + '"' + CRLF;
    etTXT: begin
      case Columns[Index].ColAlign of
        ecaLeft:
          Result := GetWriter.PadR(Result, ' ', Columns[Index].Width);
        ecaRight:
          Result := GetWriter.PadL(Result, ' ', Columns[Index].Width);
        ecaCenter:
          Result := GetWriter.PadC(Result, ' ', Columns[Index].Width);
      end;
      if FTXTSpacing > 0
        then Result := GetWriter.PadR(Result, ' ', Length(Result) + FTXTSpacing);
    end;
  end;
end;

function TQExport3ASCII.GetColData(ExportCol: TQExportCol): string;
var
  Index: integer;
begin
  Result := EmptyStr;
  Index := ExportCol.ColumnIndex;

  case FExportType of
    etCSV: begin
      Result := inherited GetColData(ExportCol);
      if FCSVQuoteStrings and (CSVQuote <> #0) then
        Result := AnsiQuotedStr(Result, CSVQuote);
      Result := Result + FCSVComma;
    end;
    etDIF: begin
      if Index = 0 then begin
        Result := Result + '-1,0' + CRLF;
        Result := Result + 'BOT' + CRLF;
      end;
      if Columns[Index].ColType = ectString then begin
        Result := Result + '1,0' + CRLF;
        Result := Result + '"' + inherited GetColData(ExportCol) + '"' + CRLF;
      end
      else begin
         Result := Result + Format('0,%s', [inherited GetColData(ExportCol)]) + CRLF;
         Result := Result + 'V' + CRLF;
      end;
    end;
    etSylk: begin
      Result := 'C;X' + IntToStr(Index + 1) +
                ';Y' + IntToStr(RecordCounter + Integer(AllowCaptions))+
                ';K"' + inherited GetColData(ExportCol) + '"' + CRLF;
    end;
    etTXT: begin
      Result := inherited GetColData(ExportCol);
      case Columns[Index].ColAlign of
        ecaLeft:
          Result := GetWriter.PadR(Result, ' ', Columns[Index].Width);
        ecaRight:
          Result := GetWriter.PadL(Result, ' ', Columns[Index].Width);
        ecaCenter:
          Result := GetWriter.PadC(Result, ' ', Columns[Index].Width);
      end;
      if FTXTSpacing > 0
        then Result := GetWriter.PadR(Result, ' ', Length(Result) + FTXTSpacing);
    end;
  end;
end;

function TQExport3ASCII.GetCaptionRow: string;
begin
  Result := inherited GetCaptionRow;
  if (FExportType = etCSV) then
    Delete(Result, Length(Result), 1);
  if FExportType in [etCSV, etTXT] then Result := Result + CRLF;
end;

procedure TQExport3ASCII.WriteCaptionRow;
var
  s: string;
begin
  s := GetCaptionRow;
  if s <> EmptyStr then GetWriter.Write(s);
end;

function TQExport3ASCII.GetDataRow(NeedFormat: boolean): string;
begin
  Result := inherited GetDataRow(NeedFormat);
  if (FExportType = etCSV) then
    Delete(Result, Length(Result), 1);
  if FExportType in [etCSV, etTXT] then Result := Result + CRLF;
end;

procedure TQExport3ASCII.WriteDataRow;
begin
  GetWriter.Write(GetDataRow(true));
end;

procedure TQExport3ASCII.EndExport;
var
  i: integer;
begin
  case ExportType of
    etDIF: begin
      GetWriter.WriteLn('-1,0');
      GetWriter.WriteLn('EOD');
    end;
    etTXT: for i := 0 to Footer.Count - 1 do
             GetWriter.WriteLn(Footer[i]);
    etSylk: GetWriter.WriteLn('E');
    etCSV: for i := 0 to Footer.Count - 1 do
             GetWriter.WriteLn(Footer[i] + FCSVComma);
  end;
  inherited;
end;

function TQExport3ASCII.NormalString(const S: string): string;
begin
  Result := inherited NormalString(S);
  if S = EmptyStr then Exit;
end;

procedure TQExport3ASCII.RecordFetched(RecNo: integer);
begin
  if Assigned(OnFetchedRecord) then OnFetchedRecord(Self, RecNo);
end;

procedure TQExport3ASCII.SetExportType(const Value: TQExportASCIIType);
begin
  if FExportType <> Value then begin
    FExportType := Value;
    if FExportType = etTXT then AutoCalcColWidth := true;
  end;
end;

procedure TQExport3ASCII.LoadProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do begin
    ExportType := TQExportASCIIType(ReadInteger(S_ASCII, S_ASCII_ExportType,
      Integer(ExportType)));
    CSVComma := Str2Char(ReadString(S_ASCII, S_CSV_Comma, Char2Str(CSVComma)));
    CSVQuote := Str2Char(ReadString(S_ASCII, S_CSV_Quote, Char2Str(CSVQuote)));
    FCSVQuoteStrings := ReadBool(S_ASCII, S_CSV_QuoteStrings, CSVQuoteStrings);
    TXTSpacing := ReadInteger(S_ASCII, S_TXT_Spacing, TXTSpacing);
    AutoCalcColWidth := ReadBool(S_ASCII, S_ASCII_AutoCalcColWidth, AutoCalcColWidth);

    ColumnsAlign.Clear;
    ReadSectionValues(S_ALIGN, ColumnsAlign);
    ColumnsWidth.Clear;
    ReadSectionValues(S_WIDTH, ColumnsWidth);
  end;
end;

procedure TQExport3ASCII.SaveProperties(IniFile: TIniFile);
var
  i: integer;
begin
  inherited;
  with IniFile do begin
    WriteInteger(S_ASCII, S_ASCII_ExportType, Integer(ExportType));
    WriteString(S_ASCII, S_CSV_Comma, Char2Str(CSVComma));
    WriteString(S_ASCII, S_CSV_Quote, Char2Str(CSVQuote));
    WriteBool(S_ASCII, S_CSV_QuoteStrings, CSVQuoteStrings);
    WriteInteger(S_ASCII, S_TXT_Spacing, TXTSpacing);
    WriteBool(S_ASCII, S_ASCII_AutoCalcColWidth, AutoCalcColWidth);

    EraseSection(S_ALIGN);
    for i := 0 to ColumnsAlign.Count - 1 do
      WriteString(S_ALIGN, Format('%s%d', [S_Line, i]), ColumnsAlign[i]);
    EraseSection(S_WIDTH);
    for i := 0 to ColumnsWidth.Count - 1 do
      WriteString(S_WIDTH, Format('%s%d', [S_Line, i]), ColumnsWidth[i]);
  end;
end;

end.
