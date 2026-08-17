unit IvConnection;

interface

uses
  Classes;

type
  TIvConnection = class;
  TIvStatement = class;
  TIvResultSet = class;

  TIvTransactionSupport = (ivtsNone, ivtsDML, ivtsAll, ivtsCommit, ivtsIgnore);

  // Connection

  TIvDataSourceInfo = class(TObject)
  private
    FServerName: String;
    FDescriction: String;

  public
    constructor Create(serverName: String; description: String);

    property ServerName: String read FServerName;
    property Descriction: String read FDescriction;
  end;

  TIvTableInfo = class(TObject)
  private
    FTableName: String;
    FDescriction: String;

  public
    constructor Create(tableName: String; description: String);

    property TableName: String read FTableName;
    property Descriction: String read FDescriction;
  end;

  TIvEnvironment = class(TObject)
  private
    FConnections: TList;
    FDataSources: TList;
    FHandle: Pointer;

    constructor Create;

    function GetConnectionCount: Integer;
    function GetConnections(index: Integer): TIvConnection;
    function GetDataSourceCount: Integer;
    function GetDataSources(index: Integer): TIvDataSourceInfo;

    procedure AddConnection(item: TIvConnection);
    procedure RemoveConnection(item: TIvConnection);

    procedure ClearDataSources;

  public
    destructor Destroy; override;

    function ConnectionByName(name: String): TIvConnection;

    property ConnectionCount: Integer read GetConnectionCount;
    property Connections[index: Integer]: TIvConnection read GetConnections;
    property DataSourceCount: Integer read GetDataSourceCount;
    property DataSources[index: Integer]: TIvDataSourceInfo read GetDataSources;
    property Handle: Pointer read FHandle;
  end;

  TIvConnection = class(TObject)
  private
    FAutoCommit: Boolean;
    FHandle: Pointer;
    FConnectionName: String;
    FDataSource: String;
    FPassword: String;
    FUsername: String;

    function GetActive: Boolean;

    procedure SetActive(value: Boolean);
    procedure SetAutoCommit(value: Boolean);
    procedure SetConnectionName(value: String);

    procedure HandleReturn(code: Integer);

  public
    constructor Create; virtual;
    destructor Destroy; override;

    function CreateStatement: TIvStatement;
    function CreateResultSet: TIvResultSet;

    function SelectTables: TIvResultSet;

    function GetTransactionSupport: TIvTransactionSupport;

    procedure Open;
    procedure Close;
    procedure Execute(const sql: String);

    procedure Commit;
    procedure Rollback;

    property Active: Boolean read GetActive write SetActive;
    property AutoCommit: Boolean read FAutoCommit write SetAutoCommit;
    property ConnectionName: String read FConnectionName write SetConnectionName;
    property DataSource: String read FDataSource write FDataSource;
    property Handle: Pointer read FHandle;
    property Password: String read FPassword write FPassword;
    property Username: String read FUsername write FUsername;
  end;

  // Statement

  TIvParameter = class(TObject)
  private
    FOwner: TIvStatement;
    FIndex: Integer;
    FCType: Integer;
    FSqlType: Smallint;
    FColDef: Longint;
    FScale: Smallint;
    FNullable: Smallint;
    FBuffer: Pointer;
    FBufferSize: Integer;

    function GetNumber: Integer;

    procedure SetAsBoolean(value: Boolean);
    procedure SetAsCurrency(value: Currency);
    procedure SetAsDate(value: TDateTime);
    procedure SetAsDateTime(value: TDateTime);
    procedure SetAsFloat(value: Double);
    procedure SetAsInteger(value: Integer);
    procedure SetAsStream(value: TStream);
    procedure SetAsString(value: String);
    procedure SetAsTime(value: TDateTime);

    procedure SetData(cType: Integer; const buffer; bufferSize: Integer);

    constructor Create(owner: TIvStatement; index: Integer);

    property Number: Integer read GetNumber;

  public
    destructor Destroy; override;

    procedure SetNull;

    property AsBoolean: Boolean write SetAsBoolean;
    property AsDate: TDateTime write SetAsDate;
    property AsDateTime: TDateTime write SetAsDateTime;
    property AsCurrency: Currency write SetAsCurrency;
    property AsFloat: Double write SetAsFloat;
    property AsInteger: Integer write SetAsInteger;
    property AsStream: TStream write SetAsStream;
    property AsString: String write SetAsString;
    property AsTime: TDateTime write SetAsTime;
  end;

  TIvStatement = class(TObject)
  private
    FConnection: TIvConnection;
    FHandle: Pointer;
    FParameters: TList;

    function GetParameterCount: Integer;
    function GetParameters(index: Integer): TIvParameter;

    procedure LoadParameters;
    procedure ClearParameters;

    procedure HandleReturn(code: Integer);

  protected
    constructor Create(connection: TIvConnection); virtual;

  public
    destructor Destroy; override;

    procedure ExecuteDirect(const sql: String); virtual;
    procedure Prepare(const sql: String); virtual;
    procedure Execute; virtual;
    procedure Close; virtual;

    procedure InitParameters;

    property Handle: Pointer read FHandle;
    property ParameterCount: Integer read GetParameterCount;
    property Parameters[index: Integer]: TIvParameter read GetParameters;
  end;

  // Resultset

  TIvColumn = class(TObject)
  private
    FOwner: TIvResultSet;
    FIndex: Integer;
    FName: String;
    FDataType: Smallint;
    FSize: Integer;
    FDecimalDigits: Smallint;
    FNullable: Smallint;
    FWasNull: Boolean;

    function GetAsBoolean: Boolean;
    function GetAsDate: TDateTime;
    function GetAsDateTime: TDateTime;
    function GetAsCurrency: Currency;
    function GetAsFloat: Double;
    function GetAsInteger: Integer;
    function GetAsStream: TMemoryStream;
    function GetAsString: String;
    function GetAsTime: TDateTime;
    function GetIsBlob: Boolean;
    function GetNumber: Integer;

    function GetData(
      targetType: Smallint;
      var buffer;
      bufferLength: Integer;
      var indicator: Integer): Integer;

    constructor Create(owner: TIvResultSet; index: Integer);

    property Number: Integer read GetNumber;

  public
    destructor Destroy; override;

    property AsBoolean: Boolean read GetAsBoolean;
    property AsDate: TDateTime read GetAsDate;
    property AsDateTime: TDateTime read GetAsDateTime;
    property AsCurrency: Currency read GetAsCurrency;
    property AsFloat: Double read GetAsFloat;
    property AsInteger: Integer read GetAsInteger;
    property AsStream: TMemoryStream read GetAsStream;
    property AsString: String read GetAsString;
    property AsTime: TDateTime read GetAsTime;
    property IsBlob: Boolean read GetIsBlob;
    property DataType: Smallint read FDataType;
    property Name: String read FName;
    property Size: Integer read FSize;
    property WasNull: Boolean read FWasNull;
  end;

  TIvResultSet = class(TIvStatement)
  private
    FColumns: TList;
    FEOF: Boolean;

    function GetColumnCount: Integer;
    function GetColumns(index: Integer): TIvColumn;

    procedure LoadColumns;
    procedure ClearColumns;

  protected
    constructor Create(connection: TIvConnection); override;

  public
    destructor Destroy; override;

    function ColumnByName(const name: String): TIvColumn;

    procedure ExecuteDirect(const sql: String); override;
    procedure ExecuteDirectFast(const sql: String);
    procedure Prepare(const sql: String); override;
    procedure Execute; override;

    function Next: boolean;

    property EOF: Boolean read FEOF;
    property ColumnCount: Integer read GetColumnCount;
    property Columns[index: Integer]: TIvColumn read GetColumns;
  end;

var
  IvEnvironment: TIvEnvironment;

{$IFDEF IVVB}
{ MN 21.8. VB version needs this function }
procedure DoIvEnvironmentInitialization;
{$ENDIF}

implementation

uses
  SysUtils,
  Dialogs,
  Windows,
  ODBC;

procedure HandleError(
  code: Integer;
  environment: Pointer;
  connection: Pointer;
  statement: Pointer);
var
  native: Integer;
  outLen: Integer;
  buffer1: array[0..15] of Char;
  buffer2: array[0..255] of Char;
begin
  if (code <> SQL_SUCCESS) and (code <> SQL_SUCCESS_WITH_INFO) then
  begin
    SQLError(environment, connection, statement, buffer1, native, buffer2, 255, outlen);
    raise Exception.Create(StrPas(buffer2));
  end;
end;


{ TIvDataSourceInfo }

constructor TIvDataSourceInfo.Create(serverName: String; description: String);
begin
  FServerName := serverName;
  FDescriction := description;
end;


{ TIvTableInfo }

constructor TIvTableInfo.Create(tableName: String; description: String);
begin
  FTableName := tableName;
  FDescriction := description;
end;


{ TIvEnvironment }

constructor TIvEnvironment.Create;
var
  code: Integer;
  length1: Smallint;
  length2: Smallint;
  buffer1: array[0..255] of Char;
  buffer2: array[0..255] of Char;
begin
  inherited Create;
  FConnections := TList.Create;
  FDataSources := TList.Create;

  SQLAllocEnv(FHandle);

  code := SQLDataSources(
    FHandle,
    SQL_FETCH_FIRST,
    buffer1,
    SizeOf(buffer1),
    length1,
    buffer2,
    SizeOf(buffer2),
    length2);

  while code = SQL_SUCCESS do
  begin
    FDataSources.Add(TIvDataSourceInfo.Create(StrPas(buffer1), StrPas(buffer2)));

    code := SQLDataSources(
      FHandle,
      SQL_FETCH_NEXT,
      buffer1,
      SizeOf(buffer1),
      length1,
      buffer2,
      SizeOf(buffer2),
      length2);
  end;
end;

destructor TIvEnvironment.Destroy;
begin
  SqlFreeEnv(FHandle);
  ClearDataSources;
  FDataSources.Free;
  inherited Destroy;
end;

procedure TIvEnvironment.ClearDataSources;
var
  i: Integer;
begin
  for i := 0 to DataSourceCount - 1 do
    DataSources[i].Free;

  FDataSources.Clear;
end;

function TIvEnvironment.GetConnectionCount: Integer;
begin
  Result := FConnections.Count;
end;

function TIvEnvironment.GetConnections(index: Integer): TIvConnection;
begin
  Result := FConnections[index];
end;

function TIvEnvironment.GetDataSourceCount: Integer;
begin
  Result := FDataSources.Count;
end;

function TIvEnvironment.GetDataSources(index: Integer): TIvDataSourceInfo;
begin
  Result := FDataSources[index];
end;

procedure TIvEnvironment.AddConnection(item: TIvConnection);
begin
  FConnections.Add(item);
end;

procedure TIvEnvironment.RemoveConnection(item: TIvConnection);
begin
  FConnections.Remove(item);
end;

function TIvEnvironment.ConnectionByName(name: String): TIvConnection;
var
  i: Integer;
begin
  for i := 0 to ConnectionCount - 1 do
  begin
    Result := Connections[i];

    if Result.ConnectionName = name then
      Exit;
  end;

  Result := nil;
end;


{ TIvConnection }

constructor TIvConnection.Create;
begin
  inherited Create;

  { MN 21.8. If ODBC was not available then throw exception }
  if IvEnvironment = nil then
     raise Exception.Create('ODBC is not available. Maybe ODBC32.DLL library is missing?');

  IvEnvironment.AddConnection(Self);
  FAutoCommit := True;
end;

destructor TIvConnection.Destroy;
begin
  IvEnvironment.RemoveConnection(Self);
  Close;
  inherited Destroy;
end;

function TIvConnection.GetTransactionSupport: TIvTransactionSupport;
var
  len: Word;
  value, code: Integer;
begin
  value := Word(ivtsNone);
  code := SQLGetInfo(FHandle, SQL_TXN_CAPABLE, @value, Sizeof(value), len);
  HandleReturn(code);
  Result := TIvTransactionSupport(value);
end;

function TIvConnection.GetActive: Boolean;
begin
  Result := (FHandle <> nil);
end;

procedure TIvConnection.SetActive(value: Boolean);
var
  code: Integer;
begin
  if Active <> value then
  begin
    if value then
    begin
      SQLAllocConnect(IvEnvironment.Handle, FHandle);

      code := SQLConnect(
        FHandle,
        PChar(FDataSource),
        Length(FDataSource),
        PChar(FUsername),
        Length(FUsername),
        PChar(FPassword),
        Length(FPassword));

      HandleReturn(code);
    end
    else
    begin
      SqlFreeConnect(FHandle);
      FHandle := nil;
    end;
  end;
end;

procedure TIvConnection.SetAutoCommit(value: Boolean);
var
  param: Longint;
  code: Integer;
begin
  if FAutoCommit <> value then
  begin
    if value then
      param := SQL_AUTOCOMMIT_ON
    else
      param := SQL_AUTOCOMMIT_OFF;

    code := SQLSetConnectOption(FHandle, SQL_AUTOCOMMIT, param);
    HandleReturn(code);
    FAutoCommit := value;
  end;
end;

procedure TIvConnection.SetConnectionName(value: String);
begin
  FConnectionName := value;
end;

function TIvConnection.CreateStatement: TIvStatement;
begin
  Result := TIvStatement.Create(Self);
end;

function TIvConnection.CreateResultSet: TIvResultSet;
begin
  Result := TIvResultSet.Create(Self);
end;

procedure TIvConnection.Execute(const sql: String);
var
  statement: TIvStatement;
begin
  statement := CreateStatement;
  statement.ExecuteDirect(sql);
  statement.Free;
end;

function TIvConnection.SelectTables: TIvResultSet;
var
  code: Integer;
begin
  Result := CreateResultSet;

  code := SQLTables(
    Result.Handle,
    nil,
    0,
    nil, //PChar(FUsername),
    0, //Length(FUsername),
    nil,
    0,
    nil,
    0);

  Result.HandleReturn(code);

  Result.LoadColumns;
end;

procedure TIvConnection.Open;
begin
  Active := True;
end;

procedure TIvConnection.Close;
begin
  Active := False;
end;

procedure TIvConnection.Commit;
var
  code: Integer;
begin
  code := SQLTransact(IvEnvironment.Handle, FHandle, SQL_COMMIT);
  HandleReturn(code);
end;

procedure TIvConnection.Rollback;
var
  code: Integer;
begin
  code := SQLTransact(IvEnvironment.Handle, FHandle, SQL_ROLLBACK);
  HandleReturn(code);
end;

procedure TIvConnection.HandleReturn(code: Integer);
begin
  HandleError(code, IvEnvironment.Handle, FHandle, nil);
end;


{ TIvParameter }

constructor TIvParameter.Create(
  owner: TIvStatement;
  index: Integer);
begin
  inherited Create;
  FOwner := owner;
  FIndex := index;
end;

destructor TIvParameter.Destroy;
begin
  FreeMem(FBuffer);
  inherited Destroy;
end;

function TIvParameter.GetNumber: Integer;
begin
  Result := FIndex + 1;
end;

procedure TIvParameter.SetData(
  cType: Integer;
  const buffer;
  bufferSize: Integer);
var
  code: Integer;
begin
  FCType := cType;

  code := SQLDescribeParam(
    FOwner.Handle,
    Number,
    FSqlType,
    FColDef,
    FScale,
    FNullable);

  FOwner.HandleReturn(code);

  FBufferSize := bufferSize;
  GetMem(FBuffer, FBufferSize);
  Move(buffer, FBuffer^, bufferSize);

  if FBufferSize = 0 then
    FBufferSize := SQL_NULL_DATA;

  if FCType = SQL_C_CHAR then
    FBufferSize := SQL_NTS;

  code := SQLBindParameter(
    FOwner.Handle,
    Number,
    SQL_PARAM_INPUT,
    FCType,
    FSqlType,
    FColDef,
    FScale,
    FBuffer,
    0,
    FBufferSize);

  FOwner.HandleReturn(code);
end;

procedure TIvParameter.SetAsStream(value: TStream);
var
  tmp: TMemoryStream;
begin
  tmp := TMemoryStream.Create;
  tmp.LoadFromStream(value);

  SetData(SQL_C_BINARY, tmp.Memory^, tmp.Size);

  tmp.Free;
end;

procedure TIvParameter.SetAsBoolean(value: Boolean);
begin
  SetData(SQL_C_BIT, value, SizeOf(value));
end;

procedure TIvParameter.SetAsCurrency(value: Currency);
var
  tmp: Double;
begin
  tmp := value;
  SetData(SQL_C_DOUBLE, tmp, SizeOf(tmp));
end;

procedure TIvParameter.SetAsDate(value: TDateTime);
var
  tmp: TOdbcDateStruct;
begin
  DecodeDate(value, tmp.year, tmp.month, tmp.day);
  SetData(SQL_C_DATE, tmp, SizeOf(tmp));
end;

procedure TIvParameter.SetAsFloat(value: Double);
begin
  SetData(SQL_C_DOUBLE, value, SizeOf(value));
end;

procedure TIvParameter.SetAsInteger(value: Integer);
begin
  SetData(SQL_C_SLONG, value, SizeOf(value));
end;

procedure TIvParameter.SetAsString(value: String);
begin
  SetData(SQL_C_CHAR, PChar(value)^, Length(value) + 1);
end;

procedure TIvParameter.SetAsTime(value: TDateTime);
var
  tmp: TOdbcTimeStruct;
  fraction: Word;
begin
  DecodeTime(value, tmp.hour, tmp.minute, tmp.second, fraction);
  SetData(SQL_C_TIME, tmp, SizeOf(tmp));
end;

procedure TIvParameter.SetAsDateTime(value: TDateTime);
var
  tmp: TOdbcTimestampStruct;
  fraction: Word;
begin
  DecodeDate(value, tmp.year, tmp.month, tmp.day);
  DecodeTime(value, tmp.hour, tmp.minute, tmp.second, fraction);
  tmp.fraction := fraction;
  SetData(SQL_C_TIMESTAMP, tmp, SizeOf(tmp));
end;

procedure TIvParameter.SetNull;
var
  code: Integer;
begin
  FBufferSize := SQL_NULL_DATA;

  code := SQLDescribeParam(
    FOwner.Handle,
    Number,
    FSqlType,
    FColDef,
    FScale,
    FNullable);

  FOwner.HandleReturn(code);

  code := SQLBindParameter(
    FOwner.Handle,
    Number,
    SQL_PARAM_INPUT,
    SQL_C_CHAR,
    FSqlType,
    FColDef,
    FScale,
    nil,
    0,
    FBufferSize);

  FOwner.HandleReturn(code);
end;


{ TIvStatement }

constructor TIvStatement.Create(connection: TIvConnection);
begin
  inherited Create;
  FConnection := connection;
  SQLAllocStmt(FConnection.Handle, FHandle);
  FParameters := TList.Create;
end;

destructor TIvStatement.Destroy;
begin
  ClearParameters;
  FParameters.Free;
  SQLFreeStmt(FHandle, SQL_DROP);
  inherited Destroy;
end;

procedure TIvStatement.HandleReturn(code: Integer);
begin
  HandleError(code, IvEnvironment.Handle, FConnection.Handle, FHandle);
end;

procedure TIvStatement.ExecuteDirect(const sql: String);
var
  code: Integer;
begin
  code := SQLExecDirect(FHandle, PChar(sql), Length(sql));
  HandleReturn(code);
end;

procedure TIvStatement.LoadParameters;
var
  i: Integer;
  code: Smallint;
  count: Smallint;
begin
  ClearParameters;

  code := SQLNumParams(FHandle, count);
  HandleReturn(code);

  for i := 0 to count - 1 do
    FParameters.Add(TIvParameter.Create(Self, i));
end;

procedure TIvStatement.ClearParameters;
var
  i: Integer;
begin
  for i := 0 to ParameterCount - 1 do
    Parameters[i].Free;

  FParameters.Clear;
end;

function TIvStatement.GetParameterCount: Integer;
begin
  Result := FParameters.Count;
end;

function TIvStatement.GetParameters(index: Integer): TIvParameter;
begin
  Result := FParameters[index];
end;

procedure TIvStatement.Prepare(const sql: String);
var
  code: Integer;
begin
  code := SQLPrepare(FHandle, PChar(sql), Length(sql));
  HandleReturn(code);

  LoadParameters;
end;

procedure TIvStatement.InitParameters;
var
  i: Integer;
begin
  for i := 0 to ParameterCount - 1 do
    Parameters[i].SetNull;
end;

procedure TIvStatement.Execute;
var
  code: Integer;
begin
  code := SQLExecute(FHandle);
  HandleReturn(code);
end;

procedure TIvStatement.Close;
begin
  SQLFreeStmt(FHandle, SQL_CLOSE);
end;


{ TIvColumn }

constructor TIvColumn.Create(
  owner: TIvResultSet;
  index: Integer);
var
  code: Integer;
  columnName: array[0..255] of Char;
  columnNameLength: Smallint;
begin
  inherited Create;
  FOwner := owner;
  FIndex := index;
  columnNameLength := 0;

  code := SQLDescribeCol(
    FOwner.Handle,
    Number,
    columnName,
    SizeOf(columnName),
    columnNameLength,
    FDataType,
    FSize,
    FDecimalDigits,
    FNullable);

  owner.HandleReturn(code);

  FName := StrPas(columnName);
end;

destructor TIvColumn.Destroy;
begin
  inherited Destroy;
end;

function TIvColumn.GetIsBlob: Boolean;
begin
  Result := False;
end;

function TIvColumn.GetNumber: Integer;
begin
  Result := FIndex + 1;
end;

function TIvColumn.GetData(
  targetType: Smallint;
  var buffer;
  bufferLength: Integer;
  var indicator: Integer): Integer;
begin
  Result := SQLGetData(
    FOwner.Handle,
    Number,
    targetType,
    @buffer,
    bufferLength,
    indicator);

  FWasNull := (indicator = SQL_NULL_DATA);
  FOwner.HandleReturn(Result);
end;

function TIvColumn.GetAsStream: TMemoryStream;
var
  code: Integer;
  length: Integer;
  numBytes: Integer;
  buffer: array[0..65535] of Byte;
begin
  Result := TMemoryStream.Create;

  repeat
    code := GetData(SQL_C_BINARY, buffer, SizeOf(buffer), length);

    if length > 0 then
    begin
      if (length > SizeOf(buffer)) or (length = SQL_NO_TOTAL) then
        numBytes := SizeOf(buffer)
      else
        numBytes := length;

      Result.Write(buffer, numBytes);
    end;
  until (code = SQL_SUCCESS);

  Result.Seek(0, soFromBeginning);
end;

function TIvColumn.GetAsBoolean: Boolean;
var
  length: Integer;
begin
  GetData(SQL_C_BIT, Result, SizeOf(Result), length);
end;

function TIvColumn.GetAsDate: TDateTime;
var
  length: Integer;
  tmp: TOdbcDateStruct;
begin
  GetData(SQL_C_DATE, tmp, SizeOf(tmp), length);
  Result := EncodeDate(tmp.year, tmp.month, tmp.day);
end;

function TIvColumn.GetAsCurrency: Currency;
var
  length: Integer;
  tmp: Double;
begin
  GetData(SQL_C_DOUBLE, tmp, SizeOf(Result), length);
  Result := tmp;
end;

function TIvColumn.GetAsFloat: Double;
var
  length: Integer;
begin
  GetData(SQL_C_DOUBLE, Result, SizeOf(Result), length);
end;

function TIvColumn.GetAsInteger: Integer;
var
  length: Integer;
begin
  GetData(SQL_C_SLONG, Result, SizeOf(Result), length);
end;

function TIvColumn.GetAsString: String;
var
  code: Integer;
  length: Integer;
  buffer: array[0..255] of Char;
begin
  Result := '';

  repeat
    code := GetData(SQL_C_CHAR, buffer, SizeOf(buffer), length);

    if length > 0 then
      Result := Result + StrPas(buffer);
  until (code = SQL_SUCCESS)
end;

function TIvColumn.GetAsTime: TDateTime;
var
  len: Integer;
  tmp: TOdbcTimeStruct;
begin
  GetData(SQL_C_TIME, tmp, SizeOf(tmp), len);
  Result := EncodeTime(tmp.hour, tmp.minute, tmp.second, 0);
end;

function TIvColumn.GetAsDateTime: TDateTime;
var
  len: Integer;
  tmp: TOdbcTimestampStruct;
begin
  GetData(SQL_C_TIMESTAMP, tmp, SizeOf(tmp), len);

  Result := EncodeDate(tmp.year, tmp.month, tmp.day) +
    EncodeTime(tmp.hour, tmp.minute, tmp.second, 0);
end;


{ TIvResultSet }

constructor TIvResultSet.Create(connection: TIvConnection);
begin
  inherited Create(connection);
  FColumns := TList.Create;
end;

destructor TIvResultSet.Destroy;
begin
  ClearColumns;
  FColumns.Free;
  inherited Destroy;
end;

function TIvResultSet.GetColumnCount: Integer;
begin
  Result := FColumns.Count;
end;

function TIvResultSet.GetColumns(index: Integer): TIvColumn;
begin
  Result := FColumns[index];
end;

function TIvResultSet.ColumnByName(const name: String): TIvColumn;
var
  i: Integer;
begin
  for i := 0 to ColumnCount - 1 do
  begin
    Result := Columns[i];

    if LowerCase(Result.Name) = LowerCase(name) then
      Exit;
  end;

  raise Exception.Create(Format('Column %s not found', [name]));
end;

procedure TIvResultSet.LoadColumns;
var
  count: Smallint;
  code: Integer;
  i: Integer;
begin
  ClearColumns;
  code := SQLNumResultCols(FHandle, count);
  HandleReturn(code);

  for i := 0 to count - 1 do
    FColumns.Add(TIvColumn.Create(Self, i));
end;

procedure TIvResultSet.ClearColumns;
var
  i: Integer;
begin
  for i := 0 to ColumnCount - 1 do
    Columns[i].Free;

  FColumns.Clear;
end;

procedure TIvResultSet.ExecuteDirect(const sql: String);
begin
  inherited ExecuteDirect(sql);
  LoadColumns;
end;

procedure TIvResultSet.ExecuteDirectFast(const sql: String);
begin
  inherited ExecuteDirect(sql);
end;

procedure TIvResultSet.Prepare(const sql: String);
begin
  inherited Prepare(sql);
end;

procedure TIvResultSet.Execute;
begin
  inherited Execute;
  LoadColumns;
end;

function TIvResultSet.Next: Boolean;
var
  code: Integer;
begin
  code := SQLFetch(FHandle);

  if code <> SQL_NO_DATA then
    HandleReturn(code);

  Result := (code <> SQL_NO_DATA);
  FEOF := not Result;
end;

{ MN 21.8. Initialize IvEvironment object }

procedure DoIvEnvironmentInitialization;
begin
{$IFDEF IVSTATICODBC}
  IvEnvironment := TIvEnvironment.Create;
{$ELSE}

  { MN 21.8. If environment object is already created then no need to do 
    anything }

  if IvEnvironment <> nil then
    Exit;

  IvEnvironment := nil;
  if IsODBCAvailable then
    IvEnvironment := TIvEnvironment.Create;
{$ENDIF}
end;

initialization
  { MN 21.8. VCL compilation initializes the ODBC environment }
  { already in Initialization block, but VB version calls     }
  { DoIvEnvironmentInitialization when the first OCX/ActiveX  }
  { ODBC dictionary object is created at runtime.             }
  IvEnvironment := nil;
{$IFNDEF IVVB}
  DoIvEnvironmentInitialization;
{$ENDIF}

finalization
  IvEnvironment.Free;
end.
