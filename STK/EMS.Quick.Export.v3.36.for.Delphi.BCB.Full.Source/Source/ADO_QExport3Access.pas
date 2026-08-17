unit ADO_QExport3Access;

interface

{$I VerCtrl.inc}

uses Classes, ADODB, SysUtils, DB, Dialogs, ComObj, {$IFDEF VCL6}Variants, {$ENDIF}
  QExport3, ADO_QExport3Database;

type

  TQAccessWriter = class(TQExportWriter)
  private
    FADOCommandInsert: TADOCommand;
    procedure CreateTable(const ConnectStr: string; const TableName, Command: string);
    procedure CreateInsertCommand(const FName: string;
      const InsertCommandDML: string; ParamTypes: array of TFieldType);
    procedure CreateAccessDatabase(const DatabaseFile: string);
  public
    constructor Create(AOwner: TQExport3; AStream: TStream); override;
    destructor Destroy; override;
    procedure WriteData(Num: integer; const Data: string);
  end;
  
  TADO_QExport3Access = class(TQExport3Database)
  private
    FOleObject: Variant;
    FPassword: string;
    procedure SetPassword(const Value: string);
  protected
    function GetWriterClass: TQExportWriterClass; override;
    function GetWriter: TQAccessWriter;
    procedure BeginExport; override;
    procedure WriteDataRow; override;
    procedure ShowResult; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Password: string read FPassword write SetPassword;
    property DatabaseName; // FileName
    property TableName;
    property AutoCreateDatabase default true;
    property AutoCreateTable default true;
    property ShowFile default false;
    property PrintFile default false;
  end;

implementation

uses QExport3StrIDs, QExport3Types;

const
  ConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s';
  PasswordString = ';Jet OLEDB:Database Password=%s';
  CreateTableDDL = 'create table %s (%s)';
  InsertDML = 'insert into %s(%s) values(%s)';
  TableNameDef = 'ExportResult';

constructor TADO_QExport3Access.Create(AOwner: TComponent);
begin
  inherited;
  TableName := TableNameDef;
  AutoCreateTable := true;
  AutoCreateDatabase := true;
  ShowFile := false;
  PrintFile := false;
  FPassword := EmptyStr;
end;

function TADO_QExport3Access.GetWriter: TQAccessWriter;
begin
  Result := TQAccessWriter(inherited GetWriter);
end;

function TADO_QExport3Access.GetWriterClass: TQExportWriterClass;
begin
  Result := TQAccessWriter;
end;

procedure TADO_QExport3Access.BeginExport;
var
  i: integer;
  CreateFieldsList, InsertFieldsList, InsertParamsList, FieldName, FieldSQLType: string;
  FieldTypes: array of TFieldType;
  connStr: string;
begin
  inherited;
  CreateFieldsList := '';
  InsertFieldsList := '';
  InsertParamsList := '';
  SetLength(FieldTypes, Columns.Count);
  for i := 0 to Columns.Count - 1 do
  begin
    FieldName := inherited GetColCaption(i);
    if FieldName = '' then
      FieldName := Format('FIELD%d', [i])
    else
      FieldName := Format('[%s]', [FieldName]);
    case Columns[i].ColType of
      ectInteger, ectBigint:
        begin
          FieldSQLType := 'integer';
          FieldTypes[i] := ftInteger;
        end;
      ectString:
        begin
          if Columns[i].IsBlob or Columns[i].IsMemo  then
          begin
            FieldSQLType:='memo';
            FieldTypes[i] := ftstring;
          end
          else begin
            if Columns[i].Length > 255 then
              Columns[i].Length := 255;

            FieldSQLType := Format('char(%d)', [Columns[i].Length]);
            FieldTypes[i] := ftString;
          end;
        end;
      ectFloat:
        begin
          FieldSQLType := 'double';
          FieldTypes[i] := ftFloat;
        end;
      ectCurrency:
        begin
          FieldSQLType := 'currency';
          FieldTypes[i] := ftCurrency;
        end;
      ectDate, ectTime, ectDateTime:
        begin
          FieldSQLType := 'datetime';
          FieldTypes[i] := ftDateTime;
        end;
      ectBoolean:
        begin
          FieldSQLType := 'LOGICAL';
          FieldTypes[i] := ftBoolean;
        end;
      else begin
        FieldSQLType := 'longtext';
        FieldTypes[i] := ftBlob;
      end;
    end;
    if i > 0 then
    begin
      CreateFieldsList := CreateFieldsList + ',';
      InsertFieldsList := InsertFieldsList + ',';
      InsertParamsList := InsertParamsList + ',';
    end;
    CreateFieldsList := CreateFieldsList + FieldName + ' ' + FieldSQLType;
    InsertFieldsList := InsertFieldsList + FieldName;
    InsertParamsList := InsertParamsList + Format(':PARAM%d', [i]);
  end;

  if FPassword <> EmptyStr then
    connStr := ConnectionString + Format(PasswordString, [FPassword])
  else
    connStr := ConnectionString;

  if AutoCreateDatabase then
     GetWriter.CreateAccessDatabase(DatabaseName);
  if AutoCreateTable then
    GetWriter.CreateTable(Format(connStr, [DatabaseName]),
      TableName, Format(CreateTableDDL, [TableName, CreateFieldsList]));
  GetWriter.CreateInsertCommand(DatabaseName,
      Format(InsertDML, [TableName, InsertFieldsList, InsertParamsList]),
      FieldTypes);
  SetLength(FieldTypes, 0);
end;

procedure TADO_QExport3Access.WriteDataRow;
var
  i: integer;
  str: string;
begin
  for i := 0 to ExportRow.Count - 1 do begin
    str := ExportRow[i].GetExportedValue(false); //inherited GetColData(i, false);
    if str = Formats.NullString then
      str := '';
    GetWriter.WriteData(i, str);
  end;
  GetWriter.FADOCommandInsert.Execute;
end;

procedure TADO_QExport3Access.ShowResult;
var
  arg1, arg2, arg3: OleVariant;
begin
  if ShowFile or PrintFile then begin
    FOleObject := Unassigned;
    try
      FOleObject := CreateOleObject('Access.Application');
    except
      on E: EOleError do begin
         FOleObject := Unassigned;
         raise Exception.Create(QExportLoadStr(QEM_ExportAccessOleError));
      end;
    end;
    FOleObject.OpenCurrentDatabase(DatabaseName, false);
    arg1 := TableName;
    arg2 := 0;
    arg3 := 1;
    if ShowFile then FOleObject.Visible := true;
    FOleObject.DoCmd.OpenTable(arg1, arg2, arg3);
    if PrintFile then FOleObject.DoCmd.PrintOut;
    if not ShowFile then FOleObject := Unassigned;
  end;
end;


//****TQAceessWriter**********************************************************

constructor TQAccessWriter.Create(AOwner: TQExport3; AStream: TStream);
begin
   inherited;
   FADOCommandInsert:=TADOCommand.Create(nil);
end;

destructor TQAccessWriter.Destroy;
begin
   FADOCommandInsert.Free;
   inherited;
end;

procedure TQAccessWriter.CreateTable(const ConnectStr: string; const TableName, Command: string);
var
  FADOCommandDDL: TADOCommand;
  Tables: TStrings;
  TableExists: boolean;
  FConnection: TADOConnection;
begin
  FConnection := TADOConnection.Create(nil);
  try
    FConnection.ConnectionString := ConnectStr;
    FConnection.LoginPrompt := false;
    FConnection.Open;
    try
      Tables := TStringList.Create;
      try
        FConnection.GetTableNames(Tables);
        TableExists := Tables.IndexOf(TableName) > -1;
      finally
        Tables.Free;
      end;
    finally
      FConnection.Close;
    end;
  finally
    FConnection.Free;
  end;

  if TableExists then Exit;

  FADOCommandDDL := TADOCommand.Create(nil);
  try
    FADOCommandDDL.ConnectionString := ConnectStr;
    FADOCommandDDL.CommandText := Command;
    FADOCommandDDL.Execute;
  finally
    FADOCommandDDL.Free;
  end;
end;

procedure TQAccessWriter.CreateInsertCommand(const FName: string;
  const InsertCommandDML: string; ParamTypes: array of TFieldType);
var
  i: integer;
  connStr: string;
begin
  if (Owner as TADO_QExport3Access).Password <> EmptyStr then
    connStr := ConnectionString + Format(PasswordString, [(Owner as TADO_QExport3Access).Password])
  else
    connStr := ConnectionString;

  FADOCommandInsert.ConnectionString := Format(connStr, [FName]);
  FADOCommandInsert.CommandText := InsertCommandDML;
  for i:=0 to Length(ParamTypes) - 1 do
    FADOCommandInsert.Parameters[i].DataType := ParamTypes[i];
  FADOCommandInsert.ExecuteOptions := [eoExecuteNoRecords];
  FADOCommandInsert.Prepared := true;
end;

procedure TQAccessWriter.CreateAccessDatabase(const DatabaseFile: string);
var
  Access: Variant;
begin
  if FileExists(DatabaseFile) then Exit;
  try
    Access := CreateOleObject('Access.Application');
    Access.NewCurrentDatabase(DatabaseFile);
  finally
    if not VarIsEmpty(Access) then Access.Quit;
  end;
end;

procedure TQAccessWriter.WriteData(Num: integer; const Data: string); begin
  if Data = '' then
    FADOCommandInsert.Parameters[Num].Value := Unassigned
  else
    FADOCommandInsert.Parameters[Num].Value := Data;
end;

procedure TADO_QExport3Access.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

end.
