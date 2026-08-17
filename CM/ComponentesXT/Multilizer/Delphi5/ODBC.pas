unit Odbc;

interface

const
  SQL_ODBC_VER = 10;

  SQL_SUCCESS = 0;
  SQL_SUCCESS_WITH_INFO = 1;
  SQL_NO_DATA = 100;
  SQL_NO_TOTAL = -4;

  SQL_COMMIT = 0;
  SQL_ROLLBACK = 1;

  SQL_PARAM_INPUT = 1;

  SQL_NULL_DATA = -1;
  SQL_NTS = -3;


  SQL_CLOSE = 0;
  SQL_DROP = 1;
  SQL_UNBIND = 2;
  SQL_RESET_PARAMS = 3;


  SQL_FETCH_NEXT = 1;
  SQL_FETCH_FIRST = 2;
  SQL_FETCH_LAST = 3;
  SQL_FETCH_PRIOR = 4;
  SQL_FETCH_ABSOLUTE = 5;
  SQL_FETCH_RELATIVE = 6;


  SQL_HANDLE_ENV = 1;
  SQL_HANDLE_DBC = 2;
  SQL_HANDLE_STMT = 3;
  SQL_HANDLE_DESC = 4;


  SQL_NULL_HANDLE = nil;


  SQL_ATTR_ODBC_VERSION = 200;
  SQL_OV_ODBC2 = 2;
  SQL_OV_ODBC3 = 3;
  SQL_IS_INTEGER = -6;

  // Connection attributes
  SQL_ACCESS_MODE        = 101;
  SQL_AUTOCOMMIT         = 102;
  SQL_LOGIN_TIMEOUT      = 103;
  SQL_OPT_TRACE          = 104;
  SQL_OPT_TRACEFILE      = 105;
  SQL_TRANSLATE_DLL      = 106;
  SQL_TRANSLATE_OPTION   = 107;
  SQL_TXN_ISOLATION      = 108;
  SQL_CURRENT_QUALIFIER  = 109;
  SQL_ODBC_CURSORS       = 110;
  SQL_QUIET_MODE         = 111;
  SQL_PACKET_SIZE        = 112;

  // SQL_AUTOCOMMIT options
  SQL_AUTOCOMMIT_OFF     = 0;
  SQL_AUTOCOMMIT_ON      = 1;
  SQL_AUTOCOMMIT_DEFAULT = SQL_AUTOCOMMIT_ON;

  //  SQL types
  SQL_BIGINT = -5;
  SQL_BINARY = -2;
  SQL_BIT = -7;
  SQL_CHAR = 1;
  SQL_DATE = 9;
  SQL_DECIMAL = 3;
  SQL_DOUBLE = 8;
  SQL_FLOAT = 6;
  SQL_INTEGER = 4;
  SQL_LONGVARBINARY = -4;
  SQL_LONGVARCHAR = -1;
  SQL_NUMERIC = 2;
  SQL_REAL = 7;
  SQL_SMALLINT = 5;
  SQL_TIME = 10;
  SQL_TIMESTAMP = 11;
  SQL_TINYINT = -6;
  SQL_VARBINARY = -3;
  SQL_VARCHAR = 12;


  // C types
  SQL_C_BINARY = SQL_BINARY;
  SQL_C_BIT = SQL_BIT;
  SQL_C_CHAR = SQL_CHAR;
  SQL_C_DATE = SQL_DATE;
  SQL_C_DEFAULT = 0;
  SQL_C_DOUBLE = SQL_DOUBLE;
  SQL_C_FLOAT = SQL_FLOAT;
  SQL_C_SLONG = SQL_INTEGER - 20;
  SQL_C_SSHORT = SQL_INTEGER;
  SQL_C_STINYINT = SQL_INTEGER;
  SQL_C_TIME = SQL_TIME;
  SQL_C_TIMESTAMP = SQL_TIMESTAMP;
  SQL_C_ULONG = SQL_INTEGER - 20;
  SQL_C_USHORT = SQL_INTEGER;
  SQL_C_UTINYINT = SQL_INTEGER;

  SQL_TXN_CAPABLE = 46;

  // SQL_TXN_CAPABLE values

  SQL_TC_NONE = 0;
  SQL_TC_DML = 1;
  SQL_TC_ALL = 2;
  SQL_TC_DDL_COMMIT = 3;
  SQL_TC_DDL_IGNORE = 4;


type
  TOdbcHandle = Pointer;
  TOdbcRetCode = Smallint;

  TOdbcDateStruct = record
    year: Word;
    month: Word;
    day: Word;
  end;

  TOdbcTimeStruct = record
    hour: Word;
    minute: Word;
    second: Word;
  end;

  TOdbcTimestampStruct = record
    year: Word;
    month: Word;
    day: Word;
    hour: Word;
    minute: Word;
    second: Word;
    fraction: Longint;
  end;

// Handles

{$IFDEF IVSTATICODBC}
function SQLAllocEnv(var handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLAllocEnv = function(var handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLFreeEnv(handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLFreeEnv = function(handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLAllocConnect(envHandle: Pointer; var handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLAllocConnect = function(envHandle: Pointer; var handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLFreeConnect(handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLFreeConnect = function(handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLAllocStmt(connectHandle: Pointer; var handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLAllocStmt = function(connectHandle: Pointer; var handle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLFreeStmt(handle: TOdbcHandle; option: Word): TOdbcRetCode; stdcall;
{$ELSE}
TSQLFreeStmt = function(handle: TOdbcHandle; option: Word): TOdbcRetCode; stdcall;
{$ENDIF}


// Connection

{$IFDEF IVSTATICODBC}
function SQLGetInfo(
  connectionHandle: TOdbcHandle;
  infoType: Word;
  infoValue: Pointer;
  bufferLength: Word;
  var stringLength: Word): TOdbcRetCode; stdcall;
{$ELSE}
TSQLGetInfo = function(
  connectionHandle: TOdbcHandle;
  infoType: Word;
  infoValue: Pointer;
  bufferLength: Word;
  var stringLength: Word): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLConnect(
  connect: TOdbcHandle;
  dataSource: PChar;
  dataSourceLength: Integer;
  userId: PChar;
  userIdLength: Integer;
  password: PChar;
  passwordLength: Integer): TOdbcRetCode; stdcall;
{$ELSE}
TSQLConnect = function(
  connect: TOdbcHandle;
  dataSource: PChar;
  dataSourceLength: Integer;
  userId: PChar;
  userIdLength: Integer;
  password: PChar;
  passwordLength: Integer): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLSetConnectOption(
  connectionHandle: TOdbcHandle;
  option: Word;
  param: Longint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLSetConnectOption = function(
  connectionHandle: TOdbcHandle;
  option: Word;
  param: Longint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLTransact(
  environmentHandle: TOdbcHandle;
  connectionHandle: Pointer;
  param: Word): TOdbcRetCode; stdcall;
{$ELSE}
TSQLTransact = function(
  environmentHandle: TOdbcHandle;
  connectionHandle: Pointer;
  param: Word): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLExecDirect(
  connect: TOdbcHandle;
  sql: PChar;
  sqlLength: LongInt): TOdbcRetCode; stdcall;
{$ELSE}
TSQLExecDirect = function(
  connect: TOdbcHandle;
  sql: PChar;
  sqlLength: LongInt): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLPrepare(
  connect: TOdbcHandle;
  sql: PChar;
  sqlLength: LongInt): TOdbcRetCode; stdcall;
{$ELSE}
TSQLPrepare = function(
  connect: TOdbcHandle;
  sql: PChar;
  sqlLength: LongInt): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLExecute(statementHandle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLExecute = function(statementHandle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLFetch(statementHandle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ELSE}
TSQLFetch = function(statementHandle: TOdbcHandle): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLExtendedFetch(
  statementHandle: TOdbcHandle;
  fetchOrientation: Smallint;
  fetchOffset: Integer;
  var rowCount: Integer;
  var rowStatus: SMallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLExtendedFetch = function(
  statementHandle: TOdbcHandle;
  fetchOrientation: Smallint;
  fetchOffset: Integer;
  var rowCount: Integer;
  var rowStatus: SMallint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLFetchScroll(
  statementHandle: TOdbcHandle;
  fetchOrientation: Smallint;
  fetchOffset: Integer): TOdbcRetCode; stdcall;
{$ELSE}
TSQLFetchScroll = function(
  statementHandle: TOdbcHandle;
  fetchOrientation: Smallint;
  fetchOffset: Integer): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLNumResultCols(statementHandle: TOdbcHandle; var columnCount: Smallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLNumResultCols = function(statementHandle: TOdbcHandle; var columnCount: Smallint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLNumParams(statementHandle: TOdbcHandle; var parameterCount: Smallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLNumParams = function(statementHandle: TOdbcHandle; var parameterCount: Smallint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLError(
  env: TOdbcHandle;
  hdbc: TOdbcHandle;
  hstmt: TOdbcHandle;
  SQLState: PChar;
  var NativeError: Integer;
  Buffer: PChar;
  Buflen: Integer;
  var Outlen: Integer): TOdbcRetCode; stdcall;
{$ELSE}
TSQLError = function(
  env: TOdbcHandle;
  hdbc: TOdbcHandle;
  hstmt: TOdbcHandle;
  SQLState: PChar;
  var NativeError: Integer;
  Buffer: PChar;
  Buflen: Integer;
  var Outlen: Integer): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLDescribeCol(
  statementHandle: TOdbcHandle;
  columnNumber: Smallint;
  columnName: PChar;
  bufferLength: Smallint;
  var nameLength: Smallint;
  var dataType: Smallint;
  var columnSize: Integer;
  var decimalDigits: Smallint;
  var nullable: Smallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLDescribeCol = function(
  statementHandle: TOdbcHandle;
  columnNumber: Smallint;
  columnName: PChar;
  bufferLength: Smallint;
  var nameLength: Smallint;
  var dataType: Smallint;
  var columnSize: Integer;
  var decimalDigits: Smallint;
  var nullable: Smallint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLBindCol(
  statementHandle: TOdbcHandle;
  columnNumber: Smallint;
  targetType: Smallint;
  targetTypePrt: Pointer;
  bufferLength: Integer;
  var strLen: Integer): TOdbcRetCode; stdcall;
{$ELSE}
TSQLBindCol = function(
  statementHandle: TOdbcHandle;
  columnNumber: Smallint;
  targetType: Smallint;
  targetTypePrt: Pointer;
  bufferLength: Integer;
  var strLen: Integer): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLGetData(
  statementHandle: TOdbcHandle;
  columnNumber: Smallint;
  targetType: Smallint;
  targetTypePrt: Pointer;
  bufferLength: Integer;
  var strLen: Integer): TOdbcRetCode; stdcall;
{$ELSE}
TSQLGetData = function(
  statementHandle: TOdbcHandle;
  columnNumber: Smallint;
  targetType: Smallint;
  targetTypePrt: Pointer;
  bufferLength: Integer;
  var strLen: Integer): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLDescribeParam(
  hstmt: TOdbcHandle;
  ipar: Word;
  var fSqlType: Smallint;
  var cbColDef: Longint;
  var ibScale: Smallint;
  var fNullable: Smallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLDescribeParam = function(
  hstmt: TOdbcHandle;
  ipar: Word;
  var fSqlType: Smallint;
  var cbColDef: Longint;
  var ibScale: Smallint;
  var fNullable: Smallint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLBindParameter(
  hstmt: TOdbcHandle;
  ipar: Word;
  fParamType: Smallint;
  cType: Smallint;
  fSqlType: Smallint;
  cbColDef: Integer;
  ibScale: Smallint;
  rgbValue: Pointer;
  cbValueMax: Integer;
  var pcbValue: Integer): TOdbcRetCode; stdcall;
{$ELSE}
TSQLBindParameter = function(
  hstmt: TOdbcHandle;
  ipar: Word;
  fParamType: Smallint;
  cType: Smallint;
  fSqlType: Smallint;
  cbColDef: Integer;
  ibScale: Smallint;
  rgbValue: Pointer;
  cbValueMax: Integer;
  var pcbValue: Integer): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLDataSources(
  environmentHandle: TOdbcHandle;
  direction: Word;
  serverName: PChar;
  bufferLength1: Smallint;
  var nameLength1: Smallint;
  descriction: PChar;
  bufferLength2: Smallint;
  var nameLength2: Smallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLDataSources = function(
  environmentHandle: TOdbcHandle;
  direction: Word;
  serverName: PChar;
  bufferLength1: Smallint;
  var nameLength1: Smallint;
  descriction: PChar;
  bufferLength2: Smallint;
  var nameLength2: Smallint): TOdbcRetCode; stdcall;
{$ENDIF}

{$IFDEF IVSTATICODBC}
function SQLTables(
  statementHandle: TOdbcHandle;
  catalogName: PChar;
  nameLength1: Smallint;
  schemaName: PChar;
  nameLength2: Smallint;
  tableName: PChar;
  nameLength3: Smallint;
  tableType: PChar;
  nameLength4: Smallint): TOdbcRetCode; stdcall;
{$ELSE}
TSQLTables = function(
  statementHandle: TOdbcHandle;
  catalogName: PChar;
  nameLength1: Smallint;
  schemaName: PChar;
  nameLength2: Smallint;
  tableName: PChar;
  nameLength3: Smallint;
  tableType: PChar;
  nameLength4: Smallint): TOdbcRetCode; stdcall;
{$ENDIF}

function IsODBCAvailable: Boolean;
procedure DoODBCInitialization;

{$IFNDEF IVSTATICODBC}
var
  SQLAllocEnv: TSQLAllocEnv;
  SQLFreeEnv: TSQLFreeEnv;
  SQLAllocConnect: TSQLAllocConnect;
  SQLFreeConnect: TSQLFreeConnect;
  SQLAllocStmt: TSQLAllocStmt;
  SQLFreeStmt: TSQLFreeStmt;
  SQLGetInfo: TSQLGetInfo;
  SQLBindCol: TSQLBindCol;
  SQLBindParameter: TSQLBindParameter;
  SQLConnect: TSQLConnect;
  SQLDataSources: TSQLDataSources;
  SQLDescribeCol: TSQLDescribeCol;
  SQLDescribeParam: TSQLDescribeParam;
  SQLError: TSQLError;
  SQLExecDirect: TSQLExecDirect;
  SQLExecute: TSQLExecute;
  SQLExtendedFetch: TSQLExtendedFetch;
  SQLFetch: TSQLFetch;
  SQLFetchScroll: TSQLFetch;
  SQLGetData: TSQLGetData;
  SQLNumParams: TSQLNumParams;
  SQLNumResultCols: TSQLNumResultCols;
  SQLPrepare: TSQLPrepare;
  SQLSetConnectOption: TSQLSetConnectOption;
  SQLTables: TSQLTables;
  SQLTransact: TSQLTransact;
{$ENDIF}

implementation

{$IFNDEF IVSTATICODBC}
uses
  Windows, SysUtils;

var
  module: THandle;
{$ENDIF}

function IsODBCAvailable: Boolean;
begin
{$IFDEF IVSTATICODBC}
  Result := True;
{$ELSE}
  // Try to initialize driver. If it fails then
  // ODBC is not available (ie. module is 0).

  DoODBCInitialization;
  Result := module <> 0;
{$ENDIF}
end;

{$IFDEF IVSTATICODBC}
function SQLAllocEnv; stdcall; external 'ODBC32.DLL'
function SQLFreeEnv; stdcall; external 'ODBC32.DLL'
function SQLAllocConnect; stdcall; external 'ODBC32.DLL'
function SQLFreeConnect; stdcall; external 'ODBC32.DLL'
function SQLAllocStmt; stdcall; external 'ODBC32.DLL'
function SQLFreeStmt; stdcall; external 'ODBC32.DLL'
function SQLGetInfo; stdcall; external 'ODBC32.DLL'
function SQLBindCol; stdcall; external 'ODBC32.DLL'
function SQLBindParameter; stdcall; external 'ODBC32.DLL'
function SQLConnect; stdcall; external 'ODBC32.DLL'
function SQLDataSources; stdcall; external 'ODBC32.DLL'
function SQLDescribeCol; stdcall; external 'ODBC32.DLL'
function SQLDescribeParam; stdcall; external 'ODBC32.DLL'
function SQLError; stdcall; external 'ODBC32.DLL'
function SQLExecDirect; stdcall; external 'ODBC32.DLL'
function SQLExecute; stdcall; external 'ODBC32.DLL'
function SQLExtendedFetch; stdcall; external 'ODBC32.DLL'
function SQLFetch; stdcall; external 'ODBC32.DLL'
function SQLFetchScroll; stdcall; external 'ODBC32.DLL'
function SQLGetData; stdcall; external 'ODBC32.DLL'
function SQLNumParams; stdcall; external 'ODBC32.DLL'
function SQLNumResultCols; stdcall; external 'ODBC32.DLL'
function SQLPrepare; stdcall; external 'ODBC32.DLL'
function SQLSetConnectOption; stdcall; external 'ODBC32.DLL'
function SQLTables; stdcall; external 'ODBC32.DLL'
function SQLTransact; stdcall; external 'ODBC32.DLL'

{$ELSE}

function GetAddress(const name: String): TFarProc;
begin
  Result := GetProcAddress(module, PChar(name));
  if Result = nil then
    raise Exception.Create(name + ' function not found');
end;


// Initialize ODBC driver if it is not yet initialized

procedure DoODBCInitialization;
begin
{$IFDEF NOODBC}
  module := 0;
{$ELSE}
  // If module is already loaded then no need to do anything

  if module <> 0 then
    Exit;

  module := LoadLibrary('ODBC32.DLL');
{$ENDIF}

  if module <> 0 then
  begin
    SQLAllocEnv := GetAddress('SQLAllocEnv');
    SQLFreeEnv := GetAddress('SQLFreeEnv');
    SQLAllocConnect := GetAddress('SQLAllocConnect');
    SQLFreeConnect := GetAddress('SQLFreeConnect');
    SQLAllocStmt := GetAddress('SQLAllocStmt');
    SQLFreeStmt := GetAddress('SQLFreeStmt');
    SQLGetInfo := GetAddress('SQLGetInfo');
    SQLBindCol := GetAddress('SQLBindCol');
    SQLBindParameter := GetAddress('SQLBindParameter');
    SQLConnect := GetAddress('SQLConnect');
    SQLDataSources := GetAddress('SQLDataSources');
    SQLDescribeCol := GetAddress('SQLDescribeCol');
    SQLDescribeParam := GetAddress('SQLDescribeParam');
    SQLError := GetAddress('SQLError');
    SQLExecDirect := GetAddress('SQLExecDirect');
    SQLExecute := GetAddress('SQLExecute');
    SQLExtendedFetch := GetAddress('SQLExtendedFetch');
    SQLFetch := GetAddress('SQLFetch');
    SQLFetchScroll := GetAddress('SQLFetch');
    SQLGetData := GetAddress('SQLGetData');
    SQLNumParams := GetAddress('SQLNumParams');
    SQLNumResultCols := GetAddress('SQLNumResultCols');
    SQLPrepare := GetAddress('SQLPrepare');
    SQLSetConnectOption := GetAddress('SQLSetConnectOption');
    SQLTables := GetAddress('SQLTables');
    SQLTransact := GetAddress('SQLTransact');
  end;
end;

initialization
  { MN 21.8. Initialize ODBC driver in Initialization block }
  { only in VCL compilation. VB compilation initializes the }
  { driver when the first IvODBCDictionary object is created. }
  module := 0;
{$IFNDEF IVVB}
  DoODBCInitialization;
{$ENDIF}
finalization
  if module <> 0 then
    FreeLibrary(module);
{$ENDIF}
end.
