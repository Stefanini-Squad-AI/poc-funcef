unit QExport3XML_MYSQL;

{$I VerCtrl.inc}

interface

uses QExport3, Classes;

type
  TQXML_MYSQL_Writer = class(TQExportWriter)
  public
    procedure StartTag(const TagName, Options: string);
    procedure EndTag(const TagName: string);
    procedure StartEndTag(const TagName, Options: string);
    procedure StartTagLn(const TagName, Options: string);
    procedure EndTagLn(const TagName: string);
    procedure StartEndTagLn(const TagName, Options: string);
  end;

  TQExport3XML_MYSQL = class(TQExport3Text)
  private
    FEncoding: string;
    FStatement: string;
  protected
    procedure BeginExport; override;
    procedure BeforeExport; override;
    function GetColCaption(Index: integer): string; override;
    procedure WriteCaptionRow; override;
    function GetColData(ExportCol: TQExportCol): string; override;
    function GetDataRow(NeedFormat: boolean): string; override;
    procedure WriteDataRow; override;
    procedure AfterExport; override;

    function GetSpecialCharacters: TSpecialCharacters; override;

    function GetWriter: TQXML_MYSQL_Writer;
    function GetWriterClass: TQExportWriterClass; override;
  public
    function NormalString(const S: string): string; override;
  published
    property Encoding: string read FEncoding write FEncoding;
    property Statement: string read FStatement write FStatement;
    //property Captions;
    property Formats;
    //property UserFormats;
  end;

implementation

uses SysUtils, QExport3Common, QExport3Types;

const
  sStartXML        = '<?xml version="%s"%s?>';
  sResultSetStart  = '<resultset statement="%s">';
  sResultSetFinish = '</resultset>';
  sRowStart        = '<row>';
  sRowFinish       = '</row>';
  sColStart        = '<%s>';
  sColFinish       = '</%s>';

{$IFDEF VCL3}
type
  TReplaceFlags = set of (rfReplaceAll, rfIgnoreCase);

function StringReplace(const S, OldPattern, NewPattern: string;
  Flags: TReplaceFlags): string;
var
  SearchStr, Patt, NewStr: string;
  Offset: Integer;
begin
  if rfIgnoreCase in Flags then
  begin
    SearchStr := AnsiUpperCase(S);
    Patt := AnsiUpperCase(OldPattern);
  end else
  begin
    SearchStr := S;
    Patt := OldPattern;
  end;
  NewStr := S;
  Result := '';
  while SearchStr <> '' do
  begin
    Offset := AnsiPos(Patt, SearchStr);
    if Offset = 0 then
    begin
      Result := Result + NewStr;
      Break;
    end;
    Result := Result + Copy(NewStr, 1, Offset - 1) + NewPattern;
    NewStr := Copy(NewStr, Offset + Length(OldPattern), MaxInt);
    if not (rfReplaceAll in Flags) then
    begin
      Result := Result + NewStr;
      Break;
    end;
    SearchStr := Copy(SearchStr, Offset + Length(Patt), MaxInt);
  end;
end;
{$ENDIF}

{ TQXML_MYSQL_Writer }

procedure TQXML_MYSQL_Writer.EndTag(const TagName: string);
begin
//  Write(STagB +  STagC + TagName + STagE);
end;

procedure TQXML_MYSQL_Writer.EndTagLn(const TagName: string);
begin
  EndTag(TagName);
  EmptyLine;
end;

procedure TQXML_MYSQL_Writer.StartEndTag(const TagName, Options: string);
begin
//  Write(STagB + TagName + ' ' + Options + STagC + STagE);
end;

procedure TQXML_MYSQL_Writer.StartEndTagLn(const TagName, Options: string);
begin
  StartEndTag(TagName, Options);
  EmptyLine;
end;

procedure TQXML_MYSQL_Writer.StartTag(const TagName, Options: string);
begin
//  if Options <> EmptyStr then Write(STagB + TagName + ' ' + Options + STagE)
//  else Write(STagB + TagName + STagE);
end;

procedure TQXML_MYSQL_Writer.StartTagLn(const TagName, Options: string);
begin
  StartTag(TagName, Options);
  EmptyLine;
end;

{ TQExport3XML_MYSQL }

procedure TQExport3XML_MYSQL.BeginExport;
begin
  inherited;
  if FEncoding <> EmptyStr then
    GetWriter.WriteLn(Format(sStartXML, ['1.0', ' ' + Format('encoding="%s"', [FEncoding])]))
  else
    GetWriter.WriteLn(Format(sStartXML, ['1.0', '']));
  GetWriter.WriteLn(Format(sResultSetStart, [FStatement]));
end;

procedure TQExport3XML_MYSQL.BeforeExport;
begin
//  GetWriter.StartTagLn(SRowData, EmptyStr);
end;

function TQExport3XML_MYSQL.GetColCaption(Index: integer): string;
{var
  FName: string;}
begin
{  FName := StringReplace(Columns[Index].Name, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  Result := Format(SFieldName, [FName]) + SBlank;
  Result := Result + Format(SDisplayLabel, [FName]) + SBlank;
  Result := Result + Format(SFieldType,
    [QExportColTypeAsString(Columns[Index].ColType)]) + SBlank;
  Result := Result + Format(SFieldClass, ['TField']);}
end;

procedure TQExport3XML_MYSQL.WriteCaptionRow;
{var
  i: integer;}
begin
{  GetWriter.StartTagLn(SMetaData, EmptyStr);
  GetWriter.StartTagLn(SFields, EmptyStr);

  for i := 0 to Columns.Count - 1 do
    GetWriter.StartEndTagLn(SField, GetColCaption(i));

  GetWriter.EndTagLn(SFields);
  GetWriter.EndTagLn(SMetaData);}
end;

function TQExport3XML_MYSQL.GetColData(ExportCol: TQExportCol): string;
var
  Index, p: integer;
begin
  Index := ExportCol.ColumnIndex;
  if Columns.GetColumnIsNull(Index) then Result := Formats.NullString
  else begin
    Result := inherited GetColData(ExportCol);
    case Columns[Index].ColType of
      ectFloat,
      ectCurrency: begin
        p := Pos(SysUtils.ThousandSeparator, Result);
        while p > 0 do begin
          Delete(Result, p, 1);
          p := Pos(SysUtils.ThousandSeparator, Result);
        end;
        p := Pos(SysUtils.DecimalSeparator, Result);
        while p > 0 do begin
          Delete(Result, p, 1);
          Insert('.', Result, p);
          p := Pos(SysUtils.DecimalSeparator, Result);
        end;
      end;
    end;
  end;
end;

function TQExport3XML_MYSQL.GetDataRow(NeedFormat: boolean): string;
var
  i: integer;
begin
  Result := EmptyStr;
  for i := 0 to ExportRow.Count - 1 do begin
    if Result <> EmptyStr then
      Result := Result + #13#10;
    Result := Result + Format(sColStart, [ExportRow[i].Name]);
    Result := Result + ExportRow[i].GetExportedValue(NeedFormat);
    Result := Result + Format(sColFinish, [ExportRow[i].Name]);
  end;
end;

procedure TQExport3XML_MYSQL.WriteDataRow;
begin
  GetWriter.WriteLn(sRowStart);
  GetWriter.WriteLn(GetDataRow(true));
  GetWriter.WriteLn(sRowFinish);
end;

procedure TQExport3XML_MYSQL.AfterExport;
begin
  GetWriter.WriteLn(sResultSetFinish);
  inherited;
end;

function TQExport3XML_MYSQL.NormalString(const S: string): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(S) do begin
    if S[i] in GetSpecialCharacters then begin
      case S[i] of
       '<': Result := Result + '&lt;';
       '>': Result := Result + '&gt;';
       '"': Result := Result + '&quot;';
       '&': Result := Result + '&amp;';
      end;
    end
    else Result := Result + S[i];
  end;
end;

function TQExport3XML_MYSQL.GetSpecialCharacters: TSpecialCharacters;
begin
  Result := ['<', '>', '&', '"'];
end;

function TQExport3XML_MYSQL.GetWriter: TQXML_MYSQL_Writer;
begin
  Result := TQXML_MYSQL_Writer(inherited GetWriter);
end;

function TQExport3XML_MYSQL.GetWriterClass: TQExportWriterClass;
begin
  Result := TQXML_MYSQL_Writer;
end;

end.
