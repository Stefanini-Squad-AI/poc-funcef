unit QExport3XML;

{$I VerCtrl.inc}

interface

uses QExport3, Classes;

type
  TQXMLWriter = class(TQExportWriter)
  public
    procedure StartTag(const TagName, Options: string);
    procedure EndTag(const TagName: string);
    procedure StartEndTag(const TagName, Options: string);
    procedure StartTagLn(const TagName, Options: string);
    procedure EndTagLn(const TagName: string);
    procedure StartEndTagLn(const TagName, Options: string);
  end;

  TXMLOptions = class(TPersistent)
  private
    FStandAlone: Boolean;
    FEncoding: string;
    FVersion: string;
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property Version: string read FVersion write FVersion;
    property Encoding: string read FEncoding write FEncoding;
    property StandAlone: boolean read FStandAlone write FStandAlone default true;
  end;

  TQExport3XML = class(TQExport3Text)
  private
    FOptions: TXMLOptions;
    
    procedure SetOptions(const Value: TXMLOptions);
  protected
    procedure BeginExport; override;
    procedure BeforeExport; override;
    function GetColCaption(Index: integer): string; override;
    procedure WriteCaptionRow; override;
    function GetDataRow(NeedFormat: boolean): string; override;
    procedure WriteDataRow; override;
    procedure AfterExport; override;

    function GetSpecialCharacters: TSpecialCharacters; override;

    function GetWriter: TQXMLWriter;
    function GetWriterClass: TQExportWriterClass; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function NormalString(const S: string): string; override;
  published
    property Options: TXMLOptions read FOptions write SetOptions;
    property Captions;
    property Formats;
    property UserFormats;
  end;

implementation

uses SysUtils, QExport3Common;

const
  SYes = 'yes';
  SNo  = 'no';
  SEncoding  = 'encoding="%s" ';
  SStartXML  = '<?xml version="%s" %sstandalone="%s"?>';
  SStartData = '<DATAPACKET Version="2.0">';
  SEndData   = '</DATAPACKET>';
  SMetaData  = 'METADATA';
  SFields    = 'FIELDS';
  SRowData   = 'ROWDATA';

  SRow          = 'ROW';
  SRowField     = '%s="%s"';
  SField        = 'FIELD';
  SFieldName    = 'FieldName="%s"';
  SDisplayLabel = 'DisplayLabel="%s"';
  SFieldType    = 'FieldType="%s"';
  SFieldClass   = 'FieldClass="%s"';

  STagB = '<';
  STagE = '>';
  STagC = '/';
  SEqual = '=';
  SBlank = ' ';

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

{ TQXMLWriter }

procedure TQXMLWriter.EndTag(const TagName: string);
begin
  Write(STagB +  STagC + TagName + STagE);
end;

procedure TQXMLWriter.EndTagLn(const TagName: string);
begin
  EndTag(TagName);
  EmptyLine;
end;

procedure TQXMLWriter.StartEndTag(const TagName, Options: string);
begin
  Write(STagB + TagName + ' ' + Options + STagC + STagE);
end;

procedure TQXMLWriter.StartEndTagLn(const TagName, Options: string);
begin
  StartEndTag(TagName, Options);
  EmptyLine;
end;

procedure TQXMLWriter.StartTag(const TagName, Options: string);
begin
  if Options <> EmptyStr then Write(STagB + TagName + ' ' + Options + STagE)
  else Write(STagB + TagName + STagE);
end;

procedure TQXMLWriter.StartTagLn(const TagName, Options: string);
begin
  StartTag(TagName, Options);
  EmptyLine;
end;

{ TXMLOptions }

procedure TXMLOptions.Assign(Source: TPersistent);
begin
  if Source is TXMLOptions then begin
    StandAlone := (Source as TXMLOptions).StandAlone;
    Encoding := (Source as TXMLOptions).Encoding;
    Version := (Source as TXMLOptions).Version;
    Exit;
  end;
  inherited;
end;

constructor TXMLOptions.Create;
begin
  inherited;
  FStandAlone := true;
  FVersion := '1.0';
  FEncoding := EmptyStr;
end;

{function StringReplace(const S, OldPattern, NewPattern: string;
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
  end;}

{ TQExport3XML }

constructor TQExport3XML.Create(AOwner: TComponent);
begin
  inherited;
  FOptions := TXMLOptions.Create;
end;

destructor TQExport3XML.Destroy;
begin
  FOptions.Free;
  inherited;
end;

procedure TQExport3XML.BeginExport;
var
  sStandAlone, sEnc: string;
begin
  inherited;
  if FOptions.StandAlone then sStandAlone := SYes
  else sStandAlone := sNo;
  if FOptions.Encoding <> EmptyStr then sEnc := Format(SEncoding, [FOptions.Encoding])
  else sEnc := EmptyStr;
  GetWriter.WriteLn(Format(SStartXML, [FOptions.Version, sEnc, sStandAlone]));
  GetWriter.WriteLn(SStartData);
end;

procedure TQExport3XML.BeforeExport;
begin
  GetWriter.StartTagLn(SRowData, EmptyStr);
end;

function TQExport3XML.GetColCaption(Index: integer): string;
var
  FName: string;
begin
  FName := StringReplace(Columns[Index].Name, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  Result := Format(SFieldName, [FName]) + SBlank;
  Result := Result + Format(SDisplayLabel, [FName]) + SBlank;
  Result := Result + Format(SFieldType,
    [QExportColTypeAsString(Columns[Index].ColType)]) + SBlank;
  Result := Result + Format(SFieldClass, ['TField']);
end;

procedure TQExport3XML.WriteCaptionRow;
var
  i: integer;
begin
  GetWriter.StartTagLn(SMetaData, EmptyStr);
  GetWriter.StartTagLn(SFields, EmptyStr);

  for i := 0 to Columns.Count - 1 do
    GetWriter.StartEndTagLn(SField, GetColCaption(i));

  GetWriter.EndTagLn(SFields);
  GetWriter.EndTagLn(SMetaData);
end;

function TQExport3XML.GetDataRow(NeedFormat: boolean): string;
var
  i: integer;
begin
  Result := EmptyStr;
  for i := 0 to ExportRow.Count - 1 do
    Result := Result + Format(sRowField, [StringReplace(ExportRow[i].Name, ' ', '_', [rfReplaceAll, rfIgnoreCase]),
      ExportRow[i].GetExportedValue(NeedFormat)]) + SBlank;
{  for i := 0 to Columns.Count - 1 do
    Result := Result + Format(sRowField, [Columns[i].Name, GetColData(i, NeedFormat)]) + SBlank;}
  Delete(Result, Length(Result), 1);
end;

procedure TQExport3XML.WriteDataRow;
begin
  GetWriter.StartEndTagLn(SRow, GetDataRow(true));
end;

procedure TQExport3XML.AfterExport;
begin
  GetWriter.EndTagLn(SRowData);
  GetWriter.WriteLn(SEndData);
  inherited;
end;

function TQExport3XML.NormalString(const S: string): string;
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

function TQExport3XML.GetSpecialCharacters: TSpecialCharacters;
begin
  Result := ['<', '>', '&', '"'];
end;

function TQExport3XML.GetWriter: TQXMLWriter;
begin
  Result := TQXMLWriter(inherited GetWriter);
end;

function TQExport3XML.GetWriterClass: TQExportWriterClass;
begin
  Result := TQXMLWriter;
end;

procedure TQExport3XML.SetOptions(const Value: TXMLOptions);
begin
  FOptions.Assign(Value);
end;

end.
