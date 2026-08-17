unit DelphiParsers;

interface

uses
  Windows, SysUtils, Classes, contnrs;

type
  TUnit = class(TPersistent)
  public
    Name: string;
    Path: string;
    FormName: string;
    FormPath: string;
    OriginalIndex: Integer;
  end;

  TDfmParser = class(TPersistent)
  private
    FLines: TStrings;
    procedure SetLines(const Value: TStrings);
  protected
  public
    procedure LoadFromFile(const FileName: string);
    constructor Create;
    destructor Destroy; override;
  published
    property Lines: TStrings read FLines write SetLines;
  end;

  TDprParser = class(TPersistent)
  private
    FLines: TStrings;
    FUnits: TObjectList;
    FName: string;
    procedure SetLines(const Value: TStrings);
    procedure SetName(const Value: string);
    function GetUnit(Index: Integer): TUnit;
  protected
  public
    procedure ParseIt;
    procedure LoadFromFile(const FileName: string);
    constructor Create;
    destructor Destroy; override;
    function UnitCount: Integer;
    property Units[Index: Integer]: TUnit read GetUnit;
  published
    property Lines: TStrings read FLines write SetLines;
    property Name: string read FName write SetName stored false;
  end;

implementation

{ TDfmParser }

constructor TDfmParser.Create;
begin
  FLines := TStringList.Create;
  inherited Create;
end;

destructor TDfmParser.Destroy;
begin
  FLines.Free;
  inherited Destroy;
end;

procedure TDfmParser.LoadFromFile(const FileName: string);
var
  InStream,
  OutStream : TMemoryStream;
begin
  InStream := TMemoryStream.Create;
  OutStream := TMemoryStream.Create;
  try
    InStream.LoadFromFile(FileName);
    OutStream.Size := 2 * InStream.Size; // estimado para cima
    InStream.Seek(0, soFromBeginning);
    try
      ObjectResourceToText(InStream,OutStream);
    except
      raise;
    end;
    OutStream.Seek(0, soFromBeginning);
    FLines.BeginUpdate;
    FLines.LoadFromStream(OutStream);
  finally
    FLines.EndUpdate;
    InStream.Free;
    OutStream.Free;
  end;
end;

procedure TDfmParser.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

{ TDprParser }

constructor TDprParser.Create;
begin
  inherited Create;
  FLines := TStringList.Create;
  FUnits := TObjectList.Create;
end;

destructor TDprParser.Destroy;
begin
  FLines.Free;
  FUnits.Free;
  inherited Destroy;
end;

function TDprParser.GetUnit(Index: Integer): TUnit;
begin
  Result := TUnit(FUnits[Index]);
end;

procedure TDprParser.LoadFromFile(const FileName: string);
begin
  FLines.LoadFromFile(FileName);
end;

procedure TDprParser.ParseIt;
var
  i, ixi, ixf : integer;
  tmpLine, tmpWord: string;
  InUses : Boolean;
  Un : TUnit;
begin
  FUnits.Clear;
  InUses := False;
  for i := 0 to Pred(FLines.Count) do
  begin
    tmpLine := Trim(FLines[i]);
    tmpWord := Copy(tmpLine, 1, Pos(' ', tmpLine)-1);
    if AnsiCompareText(tmpWord, 'program') = 0 then
      FName := Trim(Copy(tmpLine, 9, Length(tmpLine)));
    if (AnsiCompareText(tmpWord, 'uses') = 0) or (AnsiCompareText(tmpLine, 'uses') = 0) then
    begin
      InUses := True;
      continue;
    end;
    if InUses and (tmpLine <> '') and (Pos(' in ', tmpLine) > 0)then
    begin
      Un := TUnit.Create;
      Un.OriginalIndex := i;
      Un.Name := Trim(tmpWord);
      ixi := Pos('in ''', tmpLine) + 4;
      ixf := Pos('.pas''', tmpLine) + 4;
      Un.Path := Copy(tmpLine, ixi, ixf - ixi);
      ixi := Pos('{', tmpLine);
      ixf := Pos('}', tmpLine);
      if (ixi > 0) and (ixf > 0) then
      begin
        Un.FormName := Copy(tmpLine, ixi + 1, ixf - ixi -1);
        Un.FormPath := StringReplace(Un.Path, '.pas', '.dfm', [rfIgnoreCase]);
      end;
      FUnits.Add(Un);
      Un := nil;
      if (Pos(';', tmpLine) > 0) then
        InUses := False;
    end;
    if AnsiCompareText(tmpWord, 'begin') = 0 then
      break;
  end;
end;

procedure TDprParser.SetLines(const Value: TStrings);
begin
  FLines.Assign(Value);
end;

procedure TDprParser.SetName(const Value: string);
begin
  FName := Value;
end;

function TDprParser.UnitCount: Integer;
begin
  Result := FUnits.Count;
end;

end.
