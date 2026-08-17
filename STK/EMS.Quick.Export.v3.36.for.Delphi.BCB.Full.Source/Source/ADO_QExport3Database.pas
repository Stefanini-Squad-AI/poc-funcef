unit ADO_QExport3Database;

interface

uses QExport3;

type

  TQExport3Database = class(TQExport3)
  private
    FDatabaseName: string;
    FTableName: string;
    FAutoCreateDatabase: boolean;
    FAutoCreateTable: boolean;
    FShowFile: boolean;
    FPrintFile: boolean;
  protected
    property TableName:string read FTableName write FTableName;
    property AutoCreateDatabase:boolean read FAutoCreateDatabase write FAutoCreateDatabase;
    property AutoCreateTable:boolean read FAutoCreateTable write FAutoCreateTable;
    procedure ShowResult; virtual;
  public
    procedure Execute; override;
    property ShowFile: boolean read FShowFile write FShowFile;
    property PrintFile: boolean read FPrintFile write FPrintFile;
  published
    property DatabaseName: string read FDatabaseName write FDatabaseName;
    property Captions;
    property AllowCaptions;
    property ColumnsLength;
    property Formats;
    property UserFormats;
  end;

implementation

uses ShellApi;

procedure TQExport3Database.Execute;
begin
  FWriter := GetWriterClass.Create(Self, nil);
  try
    DoExport;
  finally
    FWriter.Free;
  end;
  ShowResult;
end;

procedure TQExport3Database.ShowResult;
begin
end;

end.
