{******************************************************************************}
{                                                                              }
{           ReportBuilder Data Access Developement Environment (DADE)          }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}
{      Originally modified to be used with dbIsam by:                          }
{                          Wes Petersen, LexCraft                              }
{                          Jon Lloyd Duerdoth, Welsh Dragon Computing          }
{      We give no guarantees as to the functionality of the modifications.     }
{      You should be prepared to validate any application using this code.     }
{                                                                              }
{       Modified 1999.07.21 by Jon Lloyd Duerdoth to be consistent with the    }
{                        Version 4.11 release of RBuilder.  This version       }
{                        implemented GetQuery instead of GetTable to match     }
{                        the modules written by Digital Metaphors              }
{                                                                              }
{       Modified 1999.10.15 by Jon Lloyd Duerdoth to be consistent with the    }
{                        Version 4.2 release of Report Builder. This version   }
{                        reinstates GetTable instead of GetQuery since         }
{                        David Johnson indicated a much better performance     }
{                        for databases with large numbers of tables. I've      }
{                        left the old code in if you wish to change back.      }
{                                                                              }
{       Modified 2000.04.12 by Digital Metaphors to be consistent with         }
{                        RB 5. Also fixed problem associated with using        }
{                        a table rather than a query to implement the          }
{                        TdaDBISAMDataSet class.                               }
{                                                                              }
{       Modified (unknown date) by Graham Wood                                 }
{		                   set RequestLive to True to improve speed    }
{                        where possible,                                       }
{                                                                              }
{       Modified 2000.10.24 by Jon Lloyd Duerdoth to work with RB 5.5          }
{                        and  DBISAM 2.04.                                     }
{                        Added:                                                }
{                          function GetSearchCriteriaDateFormat                }
{                               (aDatabaseType: TppDatabaseType;               }
{                                const aDatabaseName: String): String;override;}
{                        to solve the problem of regional date formats.        }
{                                                                              }
{******************************************************************************}


unit daDBISAM;

interface

uses Classes, SysUtils, Forms, ExtCtrls,  DB,  Dialogs,
     ppComm, ppClass, ppDBPipe, ppDB, ppClasUt, ppTypes,
     daDB, daQueryDataView, daDataView, daPreviewDataDlg,
     DBISAMTb, DBISAMLb, DBISAMEN;

type

  {DBISAM DataView Classes:
     1.  DBISAM TDataSet descendants
           - TDataSets that can be children of a DataView.
           - Override the HasParent method of TComponent to return True
           - Must be registerd with the Delphi IDE using the RegisterNoIcon
             procedure
       a. TdaChildDBISAMQuery - TDbIsamQuery descendant that can be a child
                                of a DataView
       b. TdaChildDBISAMTable - TDbIsamTable descendant that can be a child
                                of a DataView
     2.  TdaDBISAMSession
           - descendant of TppSession
           - implements GetDatabaseNames, GetTableNames, etc.
     3.  TdaDBISAMDataSet
          - descendant of TppDataSet
          - implements GetFieldNames for SQL
     4.  TdaDBISAMQueryDataView
          - descendant of TppQueryDataView
          - uses the above classes to create the required
            Query -> DataSource -> Pipeline -> Report connection
          - uses the TdaSQL object built by the QueryWizard to assign
            SQL to the TDbIsamQuery etc.
      }

  { TdaChildDBISAMQuery }
  TdaChildDBISAMQuery = class(TDBISAMQuery)
    public
      function HasParent: Boolean; override;

    end;  {class, TdaChildDBISAMQuery}

  { TdaChildDBISMTable }
  TdaChildDBISAMTable = class(TDBISAMTable)
    public
      function HasParent: Boolean; override;

    end;  {class, TdaChildDBISAMTable}


  { TdaDBISAMSession }
  TdaDBISAMSession = class(TdaSession)
    private
      procedure AddDatabase(aDatabase: TComponent);

    protected
      procedure SetDataOwner(aDataOwner: TComponent); override;

    public
      class function ClassDescription: String; override;
      class function DataSetClass: TdaDataSetClass; override;
      class function DatabaseClass: TComponentClass; override;

      function  DefaultSQLType(aDatabaseType: TppDatabaseType): TppSQLType; override;
      procedure GetDatabaseNames(aList: TStrings); override;
      function  GetDatabaseType(const aDatabaseName: String): TppDatabaseType; override;
      procedure GetTableNames(const aDatabaseName: String; aList: TStrings); override;
      function ValidDatabaseTypes: TppDatabaseTypes; override;
      function GetSearchCriteriaDateFormat(aDatabaseType: TppDatabaseType;
                            const aDatabaseName: String): String;override;

  end; {class, TdaDBISAMSession}



  { TdaDBISAMDataSet }
  TdaDBISAMDataSet = class(TdaDataSet)
    private
 {     FDataSet: TDBISAMQuery;}
      FDataSet: TDBISAMTable;

      function GetDataSet: TDataSet;

    protected
      procedure BuildFieldList; override;
      function  GetActive: Boolean; override;
      procedure SetActive(Value: Boolean); override;
      procedure SetDatabaseName(const aDatabaseName: String); override;
      procedure SetDataName(const aDataName: String); override;

      property DataSet: TDataSet read GetDataSet;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function ClassDescription: String; override;

      procedure GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings); override;
      procedure GetFieldsForSQL(aList: TList; aSQL: TStrings); override;

  end; {class, TdaDBISAMDataSet}


  { TdaDBISAMQueryDataView }
  TdaDBISAMQueryDataView = class(TdaQueryDataView)
    private
      FDataSource: TppChildDataSource;
      FQuery: TdaChildDBISAMQuery;

    protected
      procedure SQLChanged; override;
      
    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      class function PreviewFormClass: TFormClass; override;
      class function SessionClass: TClass; override;

      procedure Init; override;
      procedure ConnectPipelinesToData; override;


    published
      property DataSource: TppChildDataSource read FDataSource;

  end; {class, TdaDBISAMQueryDataView}


  {global functions to access default DBISAM session and database}

  {utility routines}

  {global functions to access default DBISAM connection}
  function daGetDefaultDBISAMConnection: TDBISAMDatabase;

  {utility routines}
  procedure daGetDBISAMConnectionNames(aList: TStrings);
  function daGetDBISAMConnectionForName(aDatabaseName: String): TDBISAMDatabase;

  function daGetDBISAMConnectionList: TppComponentList;

  {Delphi design time registration}
  procedure Register;


implementation

const
  cDefaultDatabase = 'DefaultDBISAMDatabase';

var
  FDBISAMDatabase: TDBISAMDatabase;
  FDBISAMConnectionList: TppComponentList;


{******************************************************************************
 *
 ** R E G I S T E R
 *
{******************************************************************************}

procedure Register;
begin
  {DBISAM DataAccess Components}
  RegisterNoIcon([TdaChildDBISAMQuery, TdaChildDBISAMTable]);

  {DbIsam DataViews}
  RegisterNoIcon([TdaDBISAMQueryDataView]);
end;

{******************************************************************************
 *
 ** C H I L D   dbIsam  D A T A   A C C E S S   C O M P O N  E N T S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChildDBISAMQuery.HasParent }
function TdaChildDBISAMQuery.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChildDBISAMTable.HasParent }
function TdaChildDBISAMTable.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}


{******************************************************************************
 *
 ** dbIsam   S E S S I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.ClassDescription }

class function TdaDBISAMSession.ClassDescription: String;
begin
  Result := 'DBISAMSession';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.DataSetClass }

class function TdaDBISAMSession.DataSetClass: TdaDataSetClass;
begin
  Result := TdaDBISAMDataSet;
end; {class function, DataSetClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.DatabaseClass }

class function TdaDBISAMSession.DatabaseClass: TComponentClass;
begin
  Result := TDBISAMDatabase;
end; {class function, DatabaseClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.GetTableNames }

procedure TdaDBISAMSession.GetTableNames(const aDatabaseName: String; aList: TStrings);
var
  lDatabase: TDBISAMDatabase;
begin
  {get the database}
  lDatabase := daGetDBISAMConnectionForName(aDatabaseName);

  {connection must be active to get table names}
  if not lDatabase.Connected then
    lDatabase.Connected := True;

  if lDatabase.Connected then
    lDatabase.Session.GetTableNames(aDatabaseName, aList);
    {First param changed from lDatabase to aDatabaseName for DBISAM}

end; {procedure, GetTableNames}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.SetDataOwner }

procedure TdaDBISAMSession.SetDataOwner(aDataOwner: TComponent);
var
  lList: TStringList;
begin

  inherited SetDataOwner(aDataOwner);

  lList := TStringList.Create;

  {refresh database names}
  GetDatabaseNames(lList);

  lList.Free;

end; {procedure, SetDataOwner}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.GetDatabaseType }

function TdaDBISAMSession.GetDatabaseType(const aDatabaseName: String): TppDatabaseType;
begin
  Result := dtDbIsam;
end; {function, GetDatabaseType}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.GetDatabaseNames }

procedure TdaDBISAMSession.GetDatabaseNames(aList: TStrings);
var
  liIndex: Integer;

begin

  {call utility routine to get list of database names}
  daGetDBISAMConnectionNames(aList);

  {get additional names from Database objects residing on Owner}
  daGetDatabaseObjectsFromOwner(TdaSessionClass(Self.ClassType), aList, DataOwner);

  {build list of connection objects}
  for liIndex := 0 to aList.Count-1 do
    if aList.Objects[liIndex] <> nil then
      AddDatabase(TComponent(aList.Objects[liIndex]));

end; {procedure, GetDatabaseNames}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.AddDatabase }

procedure TdaDBISAMSession.AddDatabase(aDatabase: TComponent);
begin

  if daGetDBISAMConnectionList.IndexOf(aDatabase) < 0 then
    FDBISAMConnectionList.Add(aDatabase);

end; {procedure, AddDatabase}

{------------------------------------------------------------------------------}
{ TdaDBISAMSession.GetSearchCriteriaDateFormat }

function TdaDBISAMSession.GetSearchCriteriaDateFormat(aDatabaseType: TppDatabaseType; const aDatabaseName: String): String;
var
  lSessionLanguageSettings: TLanguageSettings;
  lsShortDateFormat: String;
begin

  GetDefaultLanguageSettings(Session.LanguageID, Session.SortID, lSessionLanguageSettings);

  lsShortDateFormat := lSessionLanguageSettings.ShortDateFormat;

   // make sure the format is a 4 digit year (i.e. yyyy)
   if (Pos('yyy', lsShortDateFormat) > 0) then
     lsShortDateFormat := StringReplace(lsShortDateFormat, 'yyy', 'yyyy', [rfIgnoreCase])

   else if (Pos('yy', lsShortDateFormat) > 0) then
     lsShortDateFormat := StringReplace(lsShortDateFormat, 'yy', 'yyyy', [rfIgnoreCase])

   else if Pos('y', lsShortDateFormat) > 0 then
     lsShortDateFormat := StringReplace(lsShortDateFormat, 'y', 'yyyy', [rfIgnoreCase]);

   Result := lsShortDateFormat;

end; {function, GetSearchCriteriaDateFormat }

{------------------------------------------------------------------------------}
{ TdaDbIsamSession.ValidDatabaseTypes }
function TdaDBISAMSession.ValidDatabaseTypes: TppDatabaseTypes;
begin
   Result := [dtDBISAM];
end; {function, ValidDatabaseTypes }

{------------------------------------------------------------------------------}
{ TdaDbIsamSession.DefaultSQLType }

function TdaDbIsamSession.DefaultSQLType(aDatabaseType: TppDatabaseType): TppSQLType;
begin
  Result := sqSQL2;
end; {function, DefaultSQLType}


{******************************************************************************
 *
 ** dbIsam   D A T A S E T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.Create }

constructor TdaDBISAMDataSet.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FDataSet := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.Destroy }

destructor TdaDBISAMDataSet.Destroy;
begin
  FDataSet.Free;
  
  inherited Destroy;
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.ClassDescription }

class function TdaDBISAMDataSet.ClassDescription: String;
begin
  Result := 'DBISAMDataSet';
end; {class function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetActive }

function TdaDBISAMDataSet.GetActive: Boolean;
begin
  Result := GetDataSet.Active;
end; {function, GetActive}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.SetActive }

procedure TdaDBISAMDataSet.SetActive(Value: Boolean);
begin
  GetDataSet.Active := Value;
end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetDataSet }

function TdaDBISAMDataSet.GetDataSet: TDataSet;
begin

  {create DBISAM dataset, if needed}
  if (FDataSet = nil) then
{   FDataSet := TDBISAMQuery.Create(Self);}
    FDataSet := TDBISAMTable.Create(Self);

  Result := FDataSet;
  
end; {procedure, GetDataSet}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.SetDatabaseName }

procedure TdaDBISAMDataSet.SetDatabaseName(const aDatabaseName: String);
begin
  inherited SetDatabaseName(aDatabaseName);

  {dataset cannot be active to set database property}
  if GetDataSet.Active then
    FDataSet.Active := False;

  {get DBISAM database for name}
  FDataSet.DatabaseName := aDatabaseName;

end; {procedure, SetDatabaseName}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.SetDataName }

procedure TdaDBISAMDataSet.SetDataName(const aDataName: String);
const
  lcDoubleQuote = #34;
var
  lsTableName: String;
begin

  inherited SetDataName(aDataName);

  {dataset cannot be active to set table name property}
  if GetDataset.Active then
    FDataSet.Active := False;

  {strip off any double quotes which may be added by the DataDictionary Builder}
  lsTableName := StringReplace(aDataName, lcDoubleQuote, '', [rfReplaceAll]);
  
  FDataSet.TableName := lsTableName;

  {construct an SQL statment that returns an empty result set,
   this is used to get the field information }
{  FDataSet.SQL.Text := 'SELECT * FROM ' + aDataName +
                     ' WHERE ''c'' <> ''c'' ';}

end; {procedure, SetDataName}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.BuildFieldList }

procedure TdaDBISAMDataSet.BuildFieldList;
var
  liIndex: Integer;
  lDBISAMField: TField;
  lField: TppField;
begin

  inherited BuildFieldList;

  {set dataset to active}
  if not(GetDataSet.Active) then
    try
      FDataSet.Active := True;
    except
      on E:Exception do
        Exit;
    end;

  {create TppField objects for each field in the table}
  for liIndex := 0 to FDataSet.FieldCount - 1 do
    begin
      lDBISAMField := FDataSet.Fields[liIndex];

      lField := TppField.Create(nil);

      lField.TableName := FDataSet.TableName;
      lField.FieldName := lDBISAMField.FieldName;
      lField.FieldAlias := lDBISAMField.DisplayLabel;
      lField.FieldLength := lDBISAMField.Size;
      lField.DataType := ppConvertFieldType(lDBISAMField.DataType);
      lField.DisplayWidth := lDBISAMField.DisplayWidth;


      AddField(lField);
    end;

end; {function, BuildFieldList}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetFieldNamesForSQL }

procedure TdaDBISAMDataSet.GetFieldNamesForSQL(aList: TStrings; aSQL: TStrings);
var
  lQuery: TDBISAMQuery;
begin

  aList.Clear;

  {create a temporary DBISAM query}
  lQuery := TDBISAMQuery.Create(Self);

  {set the database and SQL properties}
  lQuery.DatabaseName := DatabaseName;
  lQuery.SQL := aSQL;
  lQuery.RequestLive := false;  //Added by GDW to improve query speed.

  {get the field names}
  lQuery.GetFieldNames(aList);

  lQuery.Free;

end; {procedure, GetFieldNamesForSQL}

{------------------------------------------------------------------------------}
{ TdaDBISAMDataSet.GetFieldsForSQL }

procedure TdaDBISAMDataSet.GetFieldsForSQL(aList: TList; aSQL: TStrings);
var
  lQuery: TDBISAMQuery;
  lDBISAMField: TField;
  lField: TppField;
  liIndex: Integer;
begin

  aList.Clear;

  {create a temporary DbIsam query}
  lQuery := TDBISAMQuery.Create(Self);

  try

    {assign database and SQL properties}
    lQuery.DatabaseName := DatabaseName;
    lQuery.SQL := aSQL;
    lQuery.RequestLive := True; //Added by GDW to improve query speed.

    lQuery.Active := True;

    {create a TppField object for each field in the query}
    for liIndex := 0 to lQuery.FieldCount - 1 do
      begin
        lDBISAMField := lQuery.Fields[liIndex];

        lField := TppField.Create(nil);

        lField.FieldName := lDBISAMField.FieldName;
        lField.FieldAlias := lDBISAMField.DisplayLabel;
        lField.FieldLength := lDBISAMField.Size;
        lField.DataType := ppConvertFieldType(lDBISAMField.DataType);
        lField.DisplayWidth := lDBISAMField.DisplayWidth;

        aList.Add(lField);
      end;

  finally
    lQuery.Free;

  end;

end; {procedure, GetFieldsForSQL}


{******************************************************************************
 *
 ** D B I S A M   Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.Create }

constructor TdaDBISAMQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);
  {notes: 1. must use ChildQuery, ChildDataSource, ChildPipeline etc.
          2. use Self as owner for Query, DataSource etc.
          3. do NOT assign a Name }

  FQuery := TdaChildDBISAMQuery.Create(Self);

  FDataSource := TppChildDataSource.Create(Self);
  FDataSource.DataSet := FQuery;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.Destroy }

destructor TdaDBISAMQueryDataView.Destroy;
begin

  FDataSource.Free;
  FQuery.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.PreviewFormClass }

class function TdaDBISAMQueryDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.SessionClass }

class function TdaDBISAMQueryDataView.SessionClass: TClass;
begin
  Result := TdaDBISAMSession;
end; {class function, SessionClass}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.ConnectPipelinesToData }

procedure TdaDBISAMQueryDataView.ConnectPipelinesToData;
begin

  if DataPipelineCount = 0 then Exit;

  {need to reconnect here}
  TppDBPipeline(DataPipelines[0]).DataSource := FDataSource;

end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.Init }
procedure TdaDBISAMQueryDataView.Init;
var
  lDataPipeline: TppChildDBPipeline;
begin

  inherited Init;

  if DataPipelineCount > 0 then Exit;

  {note: DataView's owner must own the DataPipeline }
  lDataPipeline := TppChildDBPipeline(ppComponentCreate(Self, TppChildDBPipeline));
  lDataPipeline.DataSource := FDataSource;

  lDataPipeline.AutoCreateFields := False;

  {add DataPipeline to the dataview }
  lDataPipeline.DataView := Self;

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaDBISAMQueryDataView.SQLChanged }

procedure TdaDBISAMQueryDataView.SQLChanged;
begin

  if FQuery.Active then
    FQuery.Close;

  FQuery.DatabaseName := SQL.DatabaseName;
  FQuery.SQL := SQL.MagicSQLText;

end; {procedure, WizardCompleted}

{******************************************************************************
 *
 ** P R O C E D U R E S   A N D   F U N C T I O N S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daGetDBISAMConnectionList }

function daGetDBISAMConnectionList: TppComponentList;
begin
  if (FDBISAMConnectionList = nil) then
    FDBISAMConnectionList := TppComponentList.Create(nil);

  Result := FDBISAMConnectionList;

end; {function, daGetADSConnectionList}

{------------------------------------------------------------------------------}
{ daGetDBISAMConnectionNames }

procedure daGetDBISAMConnectionNames(aList: TStrings);
begin
  {can add code here to read a list from an .ini file, etc.}

end; {function, daGetDBISAMConnectionNames}


{------------------------------------------------------------------------------}
{ daGetDefaultDBISAMConnection }

function daGetDefaultDBISAMConnection: TDBISAMDatabase;
begin

  {create the default DBISAM database, if needed}
  if (FDBISAMDatabase = nil) then
    begin
      {create default DBISAM database}
      FDBISAMDatabase := TDBISAMDatabase.Create(nil);
      FDBISAMDatabase.Name := cDefaultDatabase;
    end;

  Result := FDBISAMDatabase;

end; {function, daGetDefaultDBISAMDatabase}

{------------------------------------------------------------------------------}
{ daGetDBISAMConnectionForName }

function daGetDBISAMConnectionForName(aDatabaseName: String): TDBISAMDatabase;
var
  liIndex: Integer;

begin
  Result := nil;

  liIndex := 0;

 {check for a database object with this name}
  while (Result = nil) and (liIndex < daGetDBISAMConnectionList.Count) do
    begin
      if (AnsiCompareStr(FDBISAMConnectionList[liIndex].Name, aDatabaseName) = 0) then
        Result :=  TDBISAMDatabase(FDBISAMConnectionList[liIndex]);
      Inc(liIndex);
    end;

  if (Result <> nil) then Exit;

  {use the default database object}
  Result := daGetDefaultDBISAMConnection;

  {set DatabaseName property, if needed}
  if (Result.DatabaseName <> aDatabaseName) then
    begin
      if Result.Connected then
        Result.Connected := False;
      Result.DatabaseName := aDatabaseName;

    end;

end; {function, daGetDBISAMConnectionForName}



initialization

  {register the DBISAM descendant classes}
  RegisterClasses([TdaChildDBISAMQuery, TdaChildDBISAMTable]);

  {register DADE descendant session, dataset, dataview}
  daRegisterSession(TdaDBISAMSession);
  daRegisterDataSet(TdaDBISAMDataSet);
  daRegisterDataView(TdaDBISAMQueryDataView);

  {initialize internal reference variables}
  FDBISAMDatabase := nil;

finalization

  {free the default database object}
  FDBISAMDatabase.Free;

  {unregister the DbIsam descendant classes}
  UnRegisterClasses([TdaChildDBISAMQuery, TdaChildDBISAMTable]);

  {unregister DADE descendant the session, dataset, dataview}
  daUnRegisterSession(TdaDBISAMSession);
  daUnRegisterDataSet(TdaDBISAMDataSet);
  daUnRegisterDataView(TdaDBISAMQueryDataView);
  
end.
