unit QExport3CustomSource;

{$I VerCtrl.inc}

interface

uses Classes, QExport3Types {$IFDEF VCL6}, Variants{$ENDIF};

type
  TqeCustomColumns = class;

  TqeCustomColumn = class(TCollectionItem)
  private
    FHolder: TqeCustomColumns;
    FColumnName: string;
    FColumnType: TQExportColType;
    FCaption: string;
    FWidth: integer;
    FSize: integer;
    procedure SetColumnName(const Value: string);
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    function AsString: string;
  published
    property ColumnName: string read FColumnName write SetColumnName;
    property ColumnType: TQExportColType read FColumnType
      write FColumnType default ectString;
    property Caption: string read FCaption write FCaption;
    property Width: integer read FWidth write FWidth default 15;
    property Size: integer read FSize write FSize default 15;
  end;

  TqeCustomSource = class;

  TqeCustomColumns = class(TCollection)
  private
    FCustomSource: TqeCustomSource;
  protected
    function GetOwner: TPersistent; override;
    function GetItem(Index: integer): TqeCustomColumn;
    procedure SetItem(Index: integer; Value: TqeCustomColumn);
  public
    constructor Create(CustomSource: TqeCustomSource);

    function Add: TqeCustomColumn;
    function IndexOf(const ColumnName: string): integer;

    property CustomSource: TqeCustomSource read FCustomSource;
    property Items[Index: integer]: TqeCustomColumn read GetItem
      write SetItem; default;
  end;

  TGetNextRecordEvent = procedure(Sender: TObject; RecNo: integer;
    var Eof: boolean) of object;
  TGetColumnValueEvent = procedure(Sender: TObject; RecNo: integer;
    Column: TqeCustomColumn; var Value: Variant) of object;

  TqeCustomSource = class(TComponent)
  private
    FColumns: TqeCustomColumns;
    FRecNo: integer;
    FEof: boolean;

    FOnGetNextRecord: TGetNextRecordEvent;
    FOnGetColumnValue: TGetColumnValueEvent;

    function GetColCount: integer;
    procedure SetColumns(const Value: TqeCustomColumns);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function ColumnByName(const ColumnName: string): TqeCustomColumn;
    procedure First;
    procedure Next;

    property ColCount: integer read GetColCount;
    property Eof: boolean read FEof write FEof;
    property RecNo: integer read FRecNo write FRecNo;
  published
    property Columns: TqeCustomColumns read FColumns write SetColumns;

    property OnGetNextRecord: TGetNextRecordEvent read FOnGetNextRecord
      write FOnGetNextRecord;
    property OnGetColumnValue: TGetColumnValueEvent read FOnGetColumnValue
      write FOnGetColumnValue;
  end;


implementation

uses SysUtils{$IFDEF VCL9}, Windows{$ENDIF};

const
  sColumn = 'Column%d';

{ TqeCustomColumn }

constructor TqeCustomColumn.Create(Collection: TCollection);
var
  Str: string;
  N: integer;
begin
  inherited;
  FHolder := Collection as TqeCustomColumns;
  N := 0;
  Str := Format(sColumn, [N]);
  if Assigned(FHolder) then
    while FHolder.IndexOf(Str) > -1 do begin
      Inc(N);
      Str := Format(sColumn, [N]);
    end;
  FColumnName := Str;
  FColumnType := ectString;
  FCaption := FColumnName;
  FWidth := 15;
  FSize := 15;
end;

function TqeCustomColumn.AsString: string;
var
  Value: Variant;
begin
  Result := EmptyStr;

  if Assigned(FHolder) and Assigned(FHolder.CustomSource) and
       Assigned(FHolder.CustomSource.OnGetColumnValue) then begin
    Value := NULL;
    FHolder.CustomSource.OnGetColumnValue(FHolder.CustomSource,
      FHolder.CustomSource.RecNo, Self, Value);
    Result := VarToStr(Value);
  end;
end;

function TqeCustomColumn.GetDisplayName: string;
begin
  Result := FColumnName;
end;

procedure TqeCustomColumn.SetColumnName(const Value: string);
begin
  if FColumnName <> Value then begin
    if Value = EmptyStr then Exit;
    if Assigned(FHolder) then
      if FHolder.IndexOf(Value) > -1 then Exit;
    FColumnName := Value;
  end;
end;

{ TqeCustomColumns }

constructor TqeCustomColumns.Create(CustomSource: TqeCustomSource);
begin
  inherited Create(TqeCustomColumn);
  FCustomSource := CustomSource;
end;

function TqeCustomColumns.Add: TqeCustomColumn;
begin
  Result := inherited Add as TqeCustomColumn;
end;

function TqeCustomColumns.IndexOf(const ColumnName: string): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to Count - 1 do
    if AnsiCompareText(Items[i].ColumnName, ColumnName) = 0 then begin
      Result := i;
      Break;
    end;
end;

function TqeCustomColumns.GetOwner: TPersistent;
begin
  Result := FCustomSource;
end;

function TqeCustomColumns.GetItem(Index: integer): TqeCustomColumn;
begin
  Result := inherited GetItem(Index) as TqeCustomColumn;
end;

procedure TqeCustomColumns.SetItem(Index: integer; Value: TqeCustomColumn);
begin
  inherited SetItem(Index, Value);
end;

{ TqeCustomSource }

constructor TqeCustomSource.Create(AOwner: TComponent);
begin
  inherited;
  FColumns := TqeCustomColumns.Create(Self);
  FRecNo := 1;
  FEof := false;
end;

destructor TqeCustomSource.Destroy;
begin
  FColumns.Free;
  inherited;
end;

function TqeCustomSource.ColumnByName(const ColumnName: string): TqeCustomColumn;
var
  i: integer;
begin
  Result := nil;
  i := Columns.IndexOf(ColumnName);
  if i > - 1 then
    Result := Columns[i];
end;

procedure TqeCustomSource.First;
begin
  FRecNo := 1;
end;

procedure TqeCustomSource.Next;
var
  IsEof: boolean;
begin
  if FEof then Exit;
  IsEof := false;
  if Assigned(FOnGetNextRecord) then FOnGetNextRecord(Self, FRecNo, IsEof);
  if not IsEof
    then Inc(FRecNo)
    else FEof := true;
end;

function TqeCustomSource.GetColCount: integer;
begin
  Result := FColumns.Count;
end;

procedure TqeCustomSource.SetColumns(const Value: TqeCustomColumns);
begin
  FColumns.Assign(Value);
end;

end.
