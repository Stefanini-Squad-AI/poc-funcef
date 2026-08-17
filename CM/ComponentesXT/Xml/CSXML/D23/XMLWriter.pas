{:
PURPOSE AND IMPLEMENTATION:
	This unit defines classes for writing data out to a well-formed standalone XML
  document.  These classes only support a subset of the XML 1.0 recommendation
  and have not been analyzed for conformance with the recommendation.  This
  module also only supports 8-bit character sets and makes no special allowances
  for UTF-8.

  This was written for Delphi 5.  It may work for other versions, but does
  require method overloading which was introduced in Delphi 4.

HISTORY:
	09/11/00 - Created by Colin Patrick Sarsfield

DISCLAIMER:
  Use at your own risk.

COPYRIGHT:
	Released into the public domain by Colin Sarsfield 9/13/00
}
unit XMLWriter;

interface

uses
  Classes, SysUtils;

type
  TXMLTagType = (xttStarting, xttEnding, xttStartingAndEnding, xttEndingSameLine);

  TXMLWriter = class
  private
    FCached: Boolean;
    FCache: String;
    FIndentation: Integer;
  protected
    procedure WriteBuffer(const Buffer; Count: Longint); virtual; abstract;
  public
    constructor Create(Cached: Boolean);
    procedure EndDoc; virtual;
    procedure StartDoc; virtual;
    procedure WriteInteger(const Value: Integer);
    procedure WriteExtendedPrec(const Value: Extended; Format: TFloatFormat; Precision, Digits: Integer);
    procedure WriteExtended(const Value: Extended; Decimals: Integer);
    procedure WriteDouble(const Value: Double; Decimals: Integer);
    procedure WriteSingle(const Value: Single; Decimals: Integer);
    procedure WriteString(const Value: String);
    procedure WriteBasicDataString(const Name: String; const Value: String);
    procedure WriteBasicDataInteger(const Name: String; const Value: Integer);
    procedure WriteBasicDataBoolean(const Name: String; const Value: Boolean);
    procedure WriteBasicDataDateTime(const Name: String; const Value: TDateTime);
    procedure WriteBasicDataSingle(const Name: String; const Value: Single; const Decimals: Integer);
    procedure WriteBasicDataStringList(const Name: String; StringList: TStringList);
    procedure WriteStandaloneDocumentDeclaration;
    procedure WriteStr(const Value: String); virtual;
    procedure WriteTag(const Name: String; TagType: TXMLTagType; Open: Boolean);
    procedure WriteTagParamString(const ParamName, Value: String);
    procedure WriteTagParamInteger(const ParamName: String; const Value: Integer);
    procedure WriteTagParamSingle(const ParamName: String; const Value: Single; const Decimals: Integer);
    procedure WriteTagClose(TagType: TXMLTagType);
    procedure WriteLineEnd;
  end;

  TXMLStreamWriter = class(TXMLWriter)
  private
    FStream: TStream;
    FDestroyStream: Boolean;
  protected
    procedure WriteBuffer(const Buffer; Count: Longint); override;
  public
    constructor Create(AStream: TStream; Cached: Boolean; DestroyStream: Boolean);
    destructor Destroy; override;
  end;

  TXMLStringWriter = class(TXMLWriter)
  private
    FXMLString: String;
  protected
    procedure WriteBuffer(const Buffer; Count: Longint); override;
  public
    property XMLString: String read FXMLString;
  end;

implementation

uses
  StrLib;

{ TXMLStreamWriter }

constructor TXMLStreamWriter.Create(AStream: TStream; Cached: Boolean;
    DestroyStream: Boolean);
begin
  inherited Create(Cached);
  FDestroyStream := DestroyStream;
  FStream := AStream;
end;

destructor TXMLStreamWriter.Destroy;
begin
  if FDestroyStream then FStream.Free;
  inherited;
end;

procedure TXMLStreamWriter.WriteBuffer(const Buffer; Count: Longint);
begin
  FStream.Write(Buffer, Count);
end;

{ TXMLWriter }

procedure TXMLWriter.WriteString(const Value: String);
var
  ConvStr: String;
  i: Integer;
begin
  for i := 1 to Length(Value) do begin
    if Ord(Value[i]) > 127 then
      ConvStr := ConvStr + '&#' + IntToStr(Ord(Value[i])) + ';'
    else if Value[i] = '<' then
      ConvStr := ConvStr + '&lt;'
    else if Value[i] = '>' then
      ConvStr := ConvStr + '&gt;'
    else if Value[i] = '''' then
      ConvStr := ConvStr + '&apos;'
    else if Value[i] = '"' then
      ConvStr := ConvStr + '&quot;'
    else if Value[i] = '&' then
      ConvStr := ConvStr + '&amp;'
    else
      ConvStr := ConvStr + Value[i];
  end;
  WriteStr(ConvStr);
end;

procedure TXMLWriter.WriteInteger(const Value: Integer);
begin
  WriteStr(IntToStr(Value));
end;

procedure TXMLWriter.WriteExtendedPrec(const Value: Extended; Format: TFloatFormat;
  Precision, Digits: Integer);
begin
  WriteStr(FloatToStrF(Value, Format, Precision, Digits));
end;

procedure TXMLWriter.WriteExtended(const Value: Extended; Decimals: Integer);
begin
  WriteExtendedPrec(Value, ffFixed, 18, Decimals);
end;

procedure TXMLWriter.WriteDouble(const Value: Double; Decimals: Integer);
begin
  WriteExtendedPrec(Value, ffFixed, 15, Decimals);
end;

procedure TXMLWriter.EndDoc;
begin
  if FCached then
    WriteBuffer(FCache[1], Length(FCache));
end;

procedure TXMLWriter.StartDoc;
begin
  FCache := '';
  FIndentation := 0;
end;

procedure TXMLWriter.WriteSingle(const Value: Single; Decimals: Integer);
begin
  WriteExtendedPrec(Value, ffFixed, 7, Decimals);
end;

procedure TXMLWriter.WriteLineEnd;
var
  Str: String;
begin
  SetLength(Str, 2 + FIndentation shl 1);
  if FIndentation > 0 then
    FillChar(Str[3], FIndentation shl 1, ' ');
  Str[1] := #13;
  Str[2] := #10;
  WriteStr(Str);
end;

procedure TXMLWriter.WriteStandaloneDocumentDeclaration;
begin
  WriteStr('<?xml version="1.0" standalone="yes"?>');
end;

procedure TXMLWriter.WriteTag(const Name: String; TagType: TXMLTagType;
  Open: Boolean);
var
  Str: String;
begin
  Str := '<';
  if TagType = xttStartingAndEnding then
    WriteLineEnd
  else if TagType = xttStarting then begin
    WriteLineEnd;
    Inc(FIndentation)
  end else if TagType in [xttEnding, xttEndingSameLine] then begin
    Str := Str + '/';
    Dec(FIndentation);
    if TagType = xttEnding then
      WriteLineEnd;
  end;
  Str := Str + Name;
  WriteStr(Str);
  if not Open then
    WriteTagClose(TagType);
end;

procedure TXMLWriter.WriteTagClose(TagType: TXMLTagType);
begin
  if TagType = xttStartingAndEnding then
    WriteStr('/>')
  else
    WriteStr('>')
end;

procedure TXMLWriter.WriteStr(const Value: String);
begin
  if FCached then
    FCache := FCache + Value
  else
    WriteBuffer(Value[1], Length(Value));
end;

constructor TXMLWriter.Create(Cached: Boolean);
begin
  FCached := Cached;
end;

procedure TXMLWriter.WriteBasicDataString(const Name, Value: String);
begin
  if Value = '' then Exit;
  WriteTag(Name, xttStarting, False);
  WriteStr(Value);
  WriteTag(Name, xttEndingSameLine, False);
end;

procedure TXMLWriter.WriteBasicDataInteger(const Name: String;
  const Value: Integer);
begin
  WriteBasicDataString(Name, IntToStr(Value));
end;

procedure TXMLWriter.WriteBasicDataStringList(const Name: String; StringList: TStringList);
var
  i: Integer;
begin
  if StringList.Count = 0 then Exit;
  WriteTag(Name, xttStarting, False);
  for i := 0 to Pred(StringList.Count) do
    WriteBasicDataString('S', StringList[i]);
  WriteTag(Name, xttEnding, False);
end;

procedure TXMLWriter.WriteBasicDataBoolean(const Name: String;
  const Value: Boolean);
begin
  if Value then
    WriteTag(Name, xttStartingAndEnding, False);
end;

procedure TXMLWriter.WriteBasicDataDateTime(const Name: String;
  const Value: TDateTime);
begin
  if Value <> 0 then
    WriteBasicDataString(Name, DateTimeToStr(Value));
end;

procedure TXMLWriter.WriteBasicDataSingle(const Name: String;
  const Value: Single; const Decimals: Integer);
begin
  WriteBasicDataString(Name, FloatToStrF(Value, ffFixed, 7, Decimals));
end;

procedure TXMLWriter.WriteTagParamSingle(const ParamName: String; const Value: Single; const Decimals: Integer);
begin
  WriteTagParamString(ParamName, FloatToStrF(Value, ffFixed, 7, Decimals));
end;

procedure TXMLWriter.WriteTagParamString(const ParamName, Value: String);
begin
  WriteStr(' ' + ParamName + '="');
  WriteStr(Value);
  WriteStr('"');
end;

procedure TXMLWriter.WriteTagParamInteger(const ParamName: String; const Value: Integer);
begin
  WriteTagParamString(ParamName, IntToStr(Value));
end;

{ TXMLStringWriter }

procedure TXMLStringWriter.WriteBuffer(const Buffer; Count: LongInt);
begin
  FXMLString := FXMLString + Copy(PChar(@Buffer), 1, Count);
end;

end.
