unit QExport3DBF;

{$I VerCtrl.inc}

interface

uses QExport3, Classes, IniFiles, SysUtils;

const
  dBaseIII = $03;
  dBaseIIIMemo = $83;
  dBaseIVMemo = $8B;
  dBaseIVSQL = $63;
  FoxPro = $05;
  FoxProMemo = $F5;

  dftString  = 'C';  // char (symbol(s))
  dftBoolean = 'L';  // boolean
  dftNumber  = 'N';  // number
  dftDate    = 'D';  // date
  dftMemo    = 'M';  // memo
  dftFloat   = 'F';  // float -- not in DBaseIII

  MAX_FIELD_NAME_LEN = 10;

type

  TFieldName = array[1..MAX_FIELD_NAME_LEN] of Char;

  TDBFHeader = packed record { *** First record ***  L=32 }
   {+0} DBType,
   {+1} Year,
   {+2} Month,
   {+3} Day: Byte;
   {+4} RecCount: LongInt;
   {+8} HeaderSize: Word;
   {+10} RecordSize: Longint;
   {+14} FDelayTrans: Byte;
   {+15} Reserve2: array[1..13] of Byte;
   {+28} FlagMDX: Byte;
   {+29} Reserve3: array[1..3] of Byte;
  end;

  PDBFFieldDescriptor = ^TDBFFieldDescriptor;
  TDBFFieldDescriptor = packed record { *** Field Descriptor *** L= 32 }
    {+0}  FieldName: TFieldName;
    {+10} FieldEnd: Char;
    {+11} FieldType: Char;
    {+12} FieldDisp: LongInt;
    {+16} FieldLen,
    {+17} FieldDec: Byte;
    {+18} A1: array[1..13] of Byte;
    {+31} FlagTagMDX: Byte;
  end;

  //TMemoType = (mtNone, mtDBT, mtFPT);
  TQExport3DBF = class;

  TQDBFWriter = class(TQExportWriter)
  private
    DBFHeader: TDBFHeader;
    DList: TList;

    MemoStream: TFileStream;
    MemoRecord: PByteArray;
    NextMemoRecord: integer;

    function GetDBFExport: TQExport3DBF;
  protected
    property DBFExport: TQExport3DBF read GetDBFExport;
  public
    constructor Create(AOwner: TQExport3; AStream: TStream); override;
    destructor Destroy; override;
    procedure AddFieldDef(Descriptor: PDBFFieldDescriptor);
    procedure CreateDBF;
    procedure DestroyDBF;
    procedure WriteData(Num: integer; const Data: string);
    function WriteMemo(Index: integer): integer;
  end;

  TQExport3DBF = class(TQExport3Text)
  private
    FColumnsPrecision: TStrings;
    FOldDecimalSeparator: char;
    FDefaultFloatSize: integer;
    FDefaultFloatDecimal: integer;
    function GetMemoFileName: string;
    function GetNullValue: string;
    procedure SetNullValue(const Value: string);
    procedure SetColumnsPrecision(Value: TStrings);
    procedure GetColumnSizeDecimal(const ColumnName: string; var Size,
      Decimal: integer);
  protected
    function GetWriterClass: TQExportWriterClass; override;
    function GetWriter: TQDBFWriter;

    procedure BeginExport; override;
    procedure EndExport; override;
    procedure BeforeExport; override;
    procedure AfterExport; override;

    procedure WriteDataRow; override;
    procedure SaveProperties(IniFile: TIniFile); override;
    procedure LoadProperties(IniFile: TIniFile); override;

    property MemoFileName: string read GetMemoFileName;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property ColumnsLength;
    property ColumnsPrecision: TStrings read FColumnsPrecision
      write SetColumnsPrecision;
    property DefaultFloatSize: integer read FDefaultFloatSize
      write FDefaultFloatSize default 15;
    property DefaultFloatDecimal: integer read FDefaultFloatDecimal
      write FDefaultFloatDecimal default 4;
    property NullValue: string read GetNullValue write SetNullValue;
  end;

  TShortFieldNameGenerator = class
  private
    FFieldNames: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function GetShortFieldName(AFieldName: string): string;
  end;

implementation

uses QExport3Common, DB, QExport3Types{$IFDEF VCL9}, Windows{$ENDIF};

{ TQDBFWriter }

procedure TQDBFWriter.AddFieldDef(Descriptor: PDBFFieldDescriptor);
begin
  DList.Add(Descriptor);
end;

constructor TQDBFWriter.Create(AOwner: TQExport3; AStream: TStream);
begin
  inherited;
  DList := TList.Create;
end;

procedure TQDBFWriter.CreateDBF;
var
  B: Byte;
  I: Integer;
  Y, M, D : Word;
begin
  FillChar(DBFHeader, 32, #0);
  DecodeDate(Date, Y, M, D);
  with DBFHeader do begin

    if (Owner as TQExport3DBF).Columns.ContainsBLOB and
       (Stream is TFileStream) then begin
      DBType := dBaseIIIMemo;
      MemoStream := TFileStream.Create((Owner as TQExport3DBF).MemoFileName, fmCreate);
      GetMem(MemoRecord, 512);
      FillChar(MemoRecord^, 512, #0);
      MemoStream.WriteBuffer(MemoRecord^, 512);
      NextMemoRecord := 1;
    end
    else DBType := dBaseIII;

    Year := Y - 1900;
    Month := M;
    Day := D;
    HeaderSize := (DList.Count + 1) * 32 + 1;
    RecordSize := 1;
    for I := 0 to DList.Count - 1 do
      RecordSize := RecordSize + PDBFFieldDescriptor(DList[I])^.FieldLen;
  end;
  Stream.WriteBuffer(DBFHeader, SizeOf(DBFHeader));
  for I := 0 to DList.Count - 1 do
    Stream.WriteBuffer(PDBFFieldDescriptor(DList[I])^, 32);
  B := $0D; // End of DBF Header
  Stream.WriteBuffer(B, SizeOf(B));
end;

destructor TQDBFWriter.Destroy;
var
  i: Integer;
begin
  for i := 0 to DList.Count - 1 do
    if Assigned(DList.Items[i]) then
      Dispose(PDBFFieldDescriptor(DList.Items[i]));
  DList.Free;
  inherited;
end;

procedure TQDBFWriter.DestroyDBF;
begin
  if Assigned(MemoStream) then begin
    MemoStream.Seek(0, soFromBeginning);
    MemoStream.Write(NextMemoRecord, SizeOf(Integer));
    MemoStream.Free;
  end;
end;

function TQDBFWriter.GetDBFExport: TQExport3DBF;
begin
  Result := Owner as TQExport3DBF;
end;

procedure TQDBFWriter.WriteData(Num: integer; const Data: string);
const
  NewRecordMarker: Byte = $20;
  STrue  = 'TRUE';
  SFalse = 'FALSE';
  SDBFTrue  = 'T';
  SDBFFalse = 'F';
var
  CurPos, RCount: integer;
  _Data: string;
  DD: TDateTime;
begin
  SetLength(_Data, PDBFFieldDescriptor(DList[Num])^.FieldLen);
  FillChar(_Data[1], Length(_Data), ' ');
  if Data <> EmptyStr then begin
    case PDBFFieldDescriptor(DList[Num])^.FieldType of
      dftString:
          if Length(Data) > 255 // !!!
            then Move(Data[1], _Data[1], 255) // !!!
            else Move(Data[1], _Data[1], Length(Data));
      dftNumber:
         Move(Data[1], _Data[Length(_Data) - Length(Data) + 1], Length(Data));
      dftDate: begin
          DD := StrToDateTime(Data);
          _Data := FormatDateTime('yyyymmdd', DD);
         if _Data = EmptyStr then begin
           SetLength(_Data, 8);
           FillChar(_Data[1], 8, ' ');
         end;
      end;
      dftBoolean: begin
        if Pos(STrue, UpperCase(Data)) > 0 then
          _Data[1] := SDBFTrue
        else
        if Pos(SFalse, UpperCase(Data)) > 0 then
          _Data[1] := SDBFFalse
        else
          _Data[1] := ' ';
      end;
    end;
  end;
  if Num = 0 then begin
      Stream.WriteBuffer(NewRecordMarker, 1); // it's new record
      // update record count
      CurPos := Stream.Position; // save current position
      Stream.Position := 4;
      Stream.ReadBuffer(RCount, 4);
      Inc(RCount);
      Stream.Position := 4;
      Stream.WriteBuffer(RCount, 4);
      Stream.Position := CurPos; // restore current position
  end;
  Write(_Data);
  RCount := Length(_Data);
  if RCount = 0 then SysUtils.Beep;
end;

function TQDBFWriter.WriteMemo(Index: integer): integer;
var
  Field: TField;
  FieldBuffer: TMemoryStream;
  Size, Position: integer;
  Finish: byte;
begin
  Result := -1;
  if not ((Owner as TQExport3DBF).ExportSource in [esDataSet, esDBGrid]) then Exit;

  Field := nil;
  case (Owner as TQExport3DBF).ExportSource of
    esDataSet: Field := DBFExport.DataSet.FindField(DBFExport.Columns.Items[Index].Name);
    {$IFNDEF NOGUI}
    esDBGrid: Field := DBFExport.DBGrid.DataSource.DataSet.FindField(DBFExport.Columns[Index].Name);
    {$ENDIF}
  end;
  if not Assigned(Field) or not (Field is TBlobField) then Exit;
                                              
  Size := (Field as TBlobField).BlobSize;
  if (Size <= 0) or (Size > 65536) then Exit;
  FieldBuffer := TMemoryStream.Create;
  try
    (Field as TBlobField).SaveToStream(FieldBuffer);
    Finish := $1A;
    FieldBuffer.WriteBuffer(Finish, SizeOf(Byte));
    FieldBuffer.WriteBuffer(Finish, SizeOf(Byte));
    FieldBuffer.Position := 0;

    Result := NextMemoRecord;
    while (FieldBuffer.Size - FieldBuffer.Position) > 512 do begin
      FillChar(MemoRecord^, 512, #0);
      FieldBuffer.ReadBuffer(MemoRecord^, 512);
      MemoStream.Write(MemoRecord^, 512);
      Inc(NextMemoRecord);
    end;
    Size := FieldBuffer.Size;
    Position := FieldBuffer.Position;
    if (Size - Position) > 0 then begin
      FillChar(MemoRecord^, 512, #0);
      FieldBuffer.ReadBuffer(MemoRecord^, Size - Position);
      MemoStream.WriteBuffer(MemoRecord^, 512);
      Inc(NextMemoRecord);
    end;
  finally
    FieldBuffer.Free;
  end;
end;

{ TQExport3DBF }

constructor TQExport3DBF.Create(AOwner: TComponent);
begin
  inherited;
  FColumnsPrecision := TStringList.Create;
  FDefaultFloatSize := 15;
  FDefaultFloatDecimal := 4;
  Formats.NullString := S_NULL_STRING;
end;

destructor TQExport3DBF.Destroy;
begin
  FColumnsPrecision.Free;
  inherited;
end;

procedure TQExport3DBF.AfterExport;
begin
  SysUtils.DecimalSeparator := FOldDecimalSeparator;
  inherited;
end;

procedure TQExport3DBF.BeforeExport;
begin
  inherited;
  FOldDecimalSeparator := SysUtils.DecimalSeparator;
  SysUtils.DecimalSeparator := '.';
end;

procedure TQExport3DBF.BeginExport;
var
  sfnGen: TShortFieldNameGenerator; 
  i, CurrDisp: integer;
  FD: PDBFFieldDescriptor;
  str: string;
  s, d: integer;
begin
  inherited;
  CurrDisp := 0;
  sfnGen := TShortFieldNameGenerator.Create;
  try
    for i := 0 to Columns.Count - 1 do
    begin
      //if Columns[i].IsBlob and not Columns[i].IsMemo then Continue;
      New(FD);
      FillChar(FD^, 32, #0);

      str := Columns[i].Name;

      if Length(str) > 10 then
        str := sfnGen.GetShortFieldName(str);
      
      Move(UpperCase(str)[1], FD^.FieldName, Length(str));
      FD^.FieldEnd := #0;

      if Columns[i].IsBlob then
      begin
        FD^.FieldType := dftMemo;
        FD^.FieldLen := 10;
        FD^.FieldDec := 0;
      end
      else begin
        case Columns[i].ColType of
          ectInteger: begin
            FD^.FieldType := dftNumber;
            FD^.FieldLen := 11;
            FD^.FieldDec := 0;
          end;
          ectBigint: begin
            FD^.FieldType := dftNumber;
            FD^.FieldLen := 20;
            FD^.FieldDec := 0;
          end;
    (*        ftInteger, ftAutoInc: begin
            FD^.FieldType := dftNumber;
            FD^.FieldLen := 11;
            FD^.FieldDec := 0;
          end;
          ftSmallint: begin
            FD^.FieldType := dftNumber;
            FD^.FieldLen := 6;
            FD^.FieldDec := 0;
          end;
          ftWord: begin
            FD^.FieldType := dftNumber;
            FD^.FieldLen := 5;
            FD^.FieldDec := 0;
          end; *)
          ectString: begin
            FD^.FieldType := dftString;
            {if GetColSize(i) > 255 then} FD^.FieldLen := Columns[i].Length;
            //else FD^.FieldLen := GetColSize(i) - 1;
            FD^.FieldDec := 0;
          end;
    (*        ftString{$IFDEF VCL4}, ftWideString{$ENDIF}: begin
            FD^.FieldType := dftString;
            if Dataset.Fields[I].Size > 255 then
              FD^.FieldLen := 254
            else
              FD^.FieldLen := Dataset.Fields[I].Size - 1;
            FD^.FieldDec := 0;
          end; *)
          ectFloat, ectCurrency: begin
            s := FDefaultFloatSize;
            d := FDefaultFloatDecimal;
            GetColumnSizeDecimal(Columns[i].Name, s, d);

            FD^.FieldType := dftNumber;
            FD^.FieldLen := s;
            FD^.FieldDec := d;
          end;
          ectDate, ectTime, ectDateTime: begin
            FD^.FieldType := dftDate;
            FD^.FieldLen := 8;
            FD^.FieldDec := 0;
          end;
          ectBoolean: begin
            FD^.FieldType := dftBoolean;
            FD^.FieldLen := 1;
            FD^.FieldDec := 0;
          end
          else begin
            FD^.FieldType := dftString;
            FD^.FieldLen := 10;
            FD^.FieldDec := 0;
          end;
        end;
      end;
      FD^.FieldDisp := CurrDisp;
      CurrDisp := CurrDisp + FD^.FieldLen;
      GetWriter.AddFieldDef(FD);
    end;
  finally
    sfnGen.Free;
  end;
  GetWriter.CreateDBF;
end;

procedure TQExport3DBF.EndExport;
begin
  GetWriter.Write(Chr($1A));
  GetWriter.DestroyDBF;
  inherited;
end;

function TQExport3DBF.GetMemoFileName: string;
begin
  Result := ChangeFileExt(FileName, '.dbt');
end;

function TQExport3DBF.GetNullValue: string;
begin
  Result := Formats.NullString;
end;

procedure TQExport3DBF.SetNullValue(const Value: string);
begin
  if Formats.NullString <> Value then
    Formats.NullString := Value;
end;

procedure TQExport3DBF.SetColumnsPrecision(Value: TStrings);
begin
  FColumnsPrecision.Assign(Value);
end;

procedure TQExport3DBF.GetColumnSizeDecimal(const ColumnName: string; var Size,
  Decimal: integer);
var
  j: integer;
  str: string;
begin
  Size := FDefaultFloatSize;
  Decimal := FDefaultFloatDecimal;

  j := FColumnsPrecision.IndexOfName(ColumnName);
  if j > -1 then begin
    str := FColumnsPrecision.Values[FColumnsPrecision.Names[j]];
    j := Pos(',', str);
    if j > 0 then begin
      Size := StrToIntDef(Copy(str, 1, j - 1), 0);
      Decimal := StrToIntDef(Copy(str, j + 1, Length(str) - j), 0);
      if (Size <= 0) and (Decimal <= 0) then begin
        Size := FDefaultFloatSize;
        Decimal := FDefaultFloatDecimal;
      end;
    end;
  end;
end;

function TQExport3DBF.GetWriter: TQDBFWriter;
begin
  Result := TQDBFWriter(inherited GetWriter);
end;

function TQExport3DBF.GetWriterClass: TQExportWriterClass;
begin
  Result := TQDBFWriter;
end;

procedure TQExport3DBF.LoadProperties(IniFile: TIniFile);
begin
  inherited;
  with IniFile do begin
    ColumnsLength.Clear;
    ReadSectionValues(S_LENGTH, ColumnsLength);
  end;
end;

procedure TQExport3DBF.SaveProperties(IniFile: TIniFile);
var
  i: integer;
begin
  inherited;
  with IniFile do begin
    EraseSection(S_LENGTH);
    for i := 0 to ColumnsLength.Count - 1 do
      WriteString(S_LENGTH, Format('%s%d', [S_Line, i]), ColumnsLength[i]);
  end;
end;

procedure TQExport3DBF.WriteDataRow;
var
  i, Address: integer;
  fmtstr, str: string;
  s, d: integer;
begin
  for i := 0 to ExportRow.Count - 1 do begin

    //if Columns[i].IsBlob and not Columns[i].IsMemo then Continue;

    str := inherited GetColData(ExportRow[i]);
    if AnsiCompareText(str, 'null') = 0 then str := EmptyStr;
    if Columns[i].ColType in [ectFloat, ectCurrency] then begin
      if str = EmptyStr then begin
        str := Formats.NullString;
        GetWriter.WriteData(i, str);
      end
      else begin
        s := FDefaultFloatSize;
        d := FDefaultFloatDecimal;
        GetColumnSizeDecimal(ExportRow[i].Name, s, d);
        fmtstr := Format('%%%d.%df', [s, d]);
        str := Format({'%15.4f'}fmtstr, [StrToFloat(str)]);
        GetWriter.WriteData(i, str)
      end;
    end
    else if Columns[i].IsBlob then begin
      if (GetWriter.Stream is TFileStream) then begin
        Address := GetWriter.WriteMemo(i);
        str := '          ';
        if Address > -1 then begin
          str := IntToStr(Address);
          while Length(str) < 10 do str := ' ' + str;
        end;
        GetWriter.Stream.Write(str[1], 10);
      end
    end
    else GetWriter.WriteData(i, str);
  end;
end;

{ TShortFieldNameGenerator }

constructor TShortFieldNameGenerator.Create;
begin
  inherited;
  FFieldNames := TStringList.Create;
  FFieldNames.Sorted := True;
  FFieldNames.Duplicates := dupIgnore;
end;

destructor TShortFieldNameGenerator.Destroy;
begin
  FFieldNames.Free;
  inherited;
end;

function TShortFieldNameGenerator.GetShortFieldName(AFieldName: string): string;

  function GetNumberString(const AValue: Integer): string;
  begin
    Result := Format('~%d', [AValue]);
  end;

var
  i: Integer;
  ns: string;
begin
  Delete(AFieldName, MAX_FIELD_NAME_LEN + 1, MaxInt);
  Result := AFieldName;
  if FFieldNames.Find(AFieldName, i) then
  begin
    FFieldNames.Objects[i] := TObject(Integer(FFieldNames.Objects[i]) + 1);
    ns := GetNumberString(Integer(FFieldNames.Objects[i]));
    Delete(AFieldName, MAX_FIELD_NAME_LEN - Length(ns) + 1, Length(ns));
    Result := AFieldName + ns;
  end
  else
    FFieldNames.AddObject(AFieldName, TObject(0));
end;

end.

