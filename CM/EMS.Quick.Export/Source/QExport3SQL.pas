unit QExport3SQL;

{$I VerCtrl.inc}

interface

uses QExport3, Classes;

type
  TQExport3SQL = class(TQExport3FormatTextSQL)
  private
    FCommitAfterScript: boolean;
    FCreateTable: boolean;
    FStatementTerm: char;
    FCommitRecCount: integer;
    FCommitStatement: string;
    FTableName: string;
    FColumnString: string;
    FFormatValues: Boolean;
    function GetNullValue: string;
    procedure SetNullValue(const Value: string);
  protected
    procedure BeginExport; override;
    function GetColData(ExportCol: TQExportCol): string; override;
    function GetDataRow(NeedFormat: boolean): string; override;
    procedure WriteDataRow; override;
    procedure EndExport; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property TableName: string read FTableName write FTableName;
    property CommitRecCount: integer read FCommitRecCount
      write FCommitRecCount default 0;
    property CommitAfterScript: boolean read FCommitAfterScript
      write FCommitAfterScript default false;
    property CommitStatement: string read FCommitStatement write FCommitStatement;
    property CreateTable: boolean read FCreateTable
      write FCreateTable default false;
    property StatementTerm: char read FStatementTerm
      write FStatementTerm default ';';
    property NullValue: string read GetNullValue write SetNullValue;
    property FormatValues: Boolean read FFormatValues
      write FFormatValues default False; 
  end;


implementation

uses SysUtils, DBConsts, QExport3Common, QExport3Types{$IFDEF VCL9}, Windows{$ENDIF};

{ TQExport3SQL }

constructor TQExport3SQL.Create(AOwner: TComponent);
begin
  inherited;
  FCommitRecCount := 0;
  FCommitAfterScript := False;
  FCommitStatement := S_Commit;
  FCreateTable := false;
  FStatementTerm := ';';
  Formats.NullString := S_NULL_STRING;
  FFormatValues := False;
end;

procedure TQExport3SQL.BeginExport;
var
  i: integer;
  str: string;
begin
  inherited;
  for i := 0 to Header.Count - 1 do
    GetWriter.WriteLn(Header[i]);
  if FCreateTable and (FTableName <> EmptyStr) then
  begin
    GetWriter.WriteLn(Format(S_CreateTable + '(', [FTableName]));
    str := EmptyStr;
    for i := 0 to Columns.Count - 1 do
    begin
      str := str + Format('  %s  %s', [Columns[i].Name, Columns[i].SQLType]);
      str := str + ',' + CRLF;
    end;
    Delete(str, Length(str) - 2, 3);
    str := str + ');' + CRLF;
    GetWriter.WriteLn(str);
  end;
  //**************
  FColumnString := EmptyStr;
  for i := 0 to Columns.Count - 1 do
    FColumnString := FColumnString + Columns[i].Name + ',';

  if FColumnString[Length(FColumnString)] = ',' then
    Delete(FColumnString, Length(FColumnString), 1);
end;

procedure TQExport3SQL.EndExport;
var
  i: integer;
begin
  if FCommitAfterScript and (FCommitStatement <> EmptyStr) then
    GetWriter.WriteLn(FCommitStatement);
  for i := 0 to Footer.Count - 1 do GetWriter.WriteLn(Footer[i]);
  inherited;
end;

function TQExport3SQL.GetColData(ExportCol: TQExportCol): string;
var
  Index, p: integer;
begin
  Index := ExportCol.ColumnIndex;
  if Columns.GetColumnIsNull(Index) then
    Result := Formats.NullString
  else begin
    Result := inherited GetColData(ExportCol);
    case Columns[Index].ColType of
      ectString,
      ectDate,
      ectTime,
      ectDateTime: Result := AnsiQuotedStr(Result, '''');
      ectBoolean:
        if (AnsiCompareText(STextTrue, Trim(inherited GetColData(ExportCol))) = 0) or
           (AnsiCompareText(Formats.BooleanTrue, Trim(inherited GetColData(ExportCol))) = 0)
          then Result := Formats.BooleanTrue
          else Result := Formats.BooleanFalse;
      ectFloat,
      ectCurrency: begin
        p := Pos(SysUtils.ThousandSeparator, Result);
        while p > 0 do
        begin
          Delete(Result, p, 1);
          p := Pos(SysUtils.ThousandSeparator, Result);
        end;
        if SysUtils.DecimalSeparator <> '.' then
        begin
          p := Pos(SysUtils.DecimalSeparator, Result);
          while p > 0 do
          begin
            Delete(Result, p, 1);
            Insert('.', Result, p);
            p := Pos(SysUtils.DecimalSeparator, Result);
          end;
        end;  
      end;
    end;
  end;
  Result := Result + ',';
end;

function TQExport3SQL.GetDataRow(NeedFormat: boolean): string;
begin
  Result := Format(S_Insert + CRLF + '  (%s)' + CRLF + S_Values, [FTableName, FColumnString]);
  Result := Result + '(' + inherited GetDataRow(NeedFormat);
  Delete(Result, Length(Result), 1);
  Result := Result + ')' + FStatementTerm;
end;

procedure TQExport3SQL.WriteDataRow;
begin
  GetWriter.WriteLn(GetDataRow(FFormatValues));
  GetWriter.EmptyLine;
  if (FCommitRecCount > 0) and (RecordCounter mod FCommitRecCount = 0) and
     (FCommitStatement <> EmptyStr)  then begin
    GetWriter.WriteLn(FCommitStatement);
    GetWriter.EmptyLine;
  end;
end;

function TQExport3SQL.GetNullValue: string;
begin
  Result := Formats.NullString;
end;

procedure TQExport3SQL.SetNullValue(const Value: string);
begin
  if Formats.NullString <> Value then
    Formats.NullString := Value;
end;

end.
