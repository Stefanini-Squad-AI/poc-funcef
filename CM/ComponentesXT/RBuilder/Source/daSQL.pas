{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daSQL;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Dialogs, Controls, Forms, Graphics,
  ppComm, ppRelatv, ppUtils, ppTypes, ppDB, ppDsgnDB, ppRTTI,
  daDB, daMetaData;

type

  {enumerated types}
  TdaCalcType = (dacaAvg, dacaCount, dacaMax, dacaMin, dacaSum, dacaExpression, dacaUnknown);

  TdaCopyFilterType = (daftAll, daftSelectable, daftSortable, daftSearchable);

  TdaChildType = (dactSelectField, dactGroupByField, dactOrderByField, dactLocalField,
                  dactForeignField, dactSelectTable, dactTableJoin, dactCriteria, dactCalcField,
                  dactSQLLink, dactMasterLinkField, dactDetailLinkField);

  TdaCriteriaOperatorType = (dacoEqual, dacoNotEqual,
                             dacoLessThan, dacoLessThanOrEqualTo,
                             dacoGreaterThan, dacoGreaterThanOrEqualTo,
                             dacoLike, dacoNotLike,
                             dacoBetween, dacoNotBetween,
                             dacoInList, dacoNotInList,
                             dacoBlank, dacoNotBlank);

  TdaCriteriaType = (dacrField, dacrOR, dacrNOT, dacrBegin, dacrEnd);

  TdaJoinOperatorType = (dajoEqual, dajoNotEqual,
                         dajoGreaterThan, dajoGreaterThanOrEqualTo,
                         dajoLessThan, dajoLessThanOrEqualTo);

  TdaJoinType = (dajtNone, dajtInner, dajtOuter, dajtLeftOuter, dajtRightOuter);

  {exceptions}
  EQueryWizardError = class(Exception)
  end;
  
  {forward declarations}
  TdaSQL = class;
  TdaChild = class;
  TdaTable = class;
  TdaTableJoin = class;
  TdaField = class;
  TdaCalculation = class;
  TdaCriteria = class;
  TdaSQLLink = class;

  TdaChildClass = class of TdaChild;
  TdaSQLClass = class of TdaSQL;


  TdaAddSQLTextEvent = procedure (Sender: TObject; aSQLChild: TdaChild; var aText: String) of object;

  { TdaSQL }
  TdaSQL = class (TppRelative)
    private
      FAddFromClauseText: TdaAddSQLTextEvent;
      FAddGroupByClauseText: TdaAddSQLTextEvent;
      FAddOrderByClauseText: TdaAddSQLTextEvent;
      FAddSelectClauseText: TdaAddSQLTextEvent;
      FAddWhereClauseText: TdaAddSQLTextEvent;

      FAllowSelfJoin: Boolean;
      FAssigning: Boolean;
      FAvailableCriteriaFields: TList;
      FAvailableDetailLinkFields: TList;
      FAvailableFields: TList;
      FAvailableGroupByFields: TList;
      FAvailableMasterLinkFields: TList;
      FAvailableOrderByFields: TList;
      FAvailableSelectFields: TList;
      FAvailableSelectTables: TList;
      FAvailableTables: TList;
      FCalcFields: TList;
      FCalcFieldsOutOfSync: Boolean;
      FCalcSearchCriteriaAdded: Boolean;
      FCriteria: TList;
      FCriteriaOutOfSync: Boolean;
      FLinkBroker: TppRelative;
      FDatabaseName: String;
      FDatabaseType: TppDatabaseType;
      FDataDictionary: TppDataDictionary;
      FDataPipelineName: String;
      FDataSetClass: TdaDataSetClass;
      FDescription: String;
      FDetailLinkFieldsOutOfSync: Boolean;
      FDistinct: Boolean;
      FDriverName: String;
      FEditSQLAsText: Boolean;
      FFieldSortMode: Integer;
      FFieldsOutOfSync: Boolean;
      FGroupByFields: TList;
      FGroupByFieldsOutOfSync: Boolean;
      FGroupByFieldsSynced: Boolean;
      FIndent: Integer;
      FIsCaseSensitive: Boolean;
      FLanguageIndex: LongInt;
      FLineLength: Integer;
      FLinkColor: TColor;
      FMasterLinkFieldsOutOfSync: Boolean;
      FLinkingSQL: Boolean;
      FMagicSQLText: TStrings;
      FMagicSQL: TdaSQL;
      FMasterSQL: TdaSQL;
      FMaxSQLFieldAliasLength: Integer;
      FModified: Boolean;
      FOrderByFields: TList;
      FOrderByFieldsOutOfSync: Boolean;
      FSavedAvailableFields: TList;
      FSelectFields: TList;
      FSelectFieldsOutOfSync: Boolean;
      FSelectTables: TList;
      FSelectTablesOutOfSync: Boolean;
      FSession: TdaSession;
      FSkipWhenNoRecords: Boolean;
      FSQLOutOfSync: Boolean;
      FSQLText: TStrings;
      FSQLType: TppSQLType;
      FStealthMode: Boolean;
      FSyncingGroups: Boolean;
      FTablesOutOfSync: Boolean;
      FWhereAdded: Boolean;

      procedure AddAllSelectFields(aTable: TdaTable);
      function AutoJoin: Boolean;
      procedure AvailableFieldsOutOfSync;
      procedure BuildFromClause;
      procedure BuildGroupByClause;
      procedure BuildOrderByClause;
      procedure BuildSearchCriteria;
      procedure BuildSelectClause;
      procedure BuildSQL89JoinExpression(aJoins: TList);
      procedure BuildSQL92JoinExpression(aJoins: TList);
      procedure BuildWhereClause;
      procedure CalcTypeChangeEvent(Sender: TObject);
      procedure CopyLinkableList(aSourceList, aTargetList: TList; aFilterUsedFields: Boolean);
      function CreateAlias(const aRawTableName: String): String;
      procedure CreateAvailableFieldList;
      procedure CreateAvailableTableList;
      procedure CreateFieldsFromSQL;
      function CreateJoin(aTable1, aTable2: TdaTable): Boolean;
      procedure CreateJoinableTableLists;
      function CreateMagicSQLText: TStrings;
      function CreateTableAlias(aTable: TdaTable): String;
      function CreateTableSQLAlias(aTable: TdaTable): String;
      procedure FreeMatchingFields(aTable: TdaTable; aList: TList; var aOutOfSync: Boolean);
      procedure FreeRelatedFields(aTable: TdaTable);
      function FreeTable(aTable: TdaTable): Boolean;
      function GetAvailableCalcField(aIndex: Integer): TdaField;
      function GetAvailableCalcFieldCount: Integer;
      function GetAvailableCriteria(aIndex: Integer): TdaField;
      function GetAvailableCriteriaCount: Integer;
      function GetAvailableDetailLinkFieldCount: Integer;
      function GetAvailableDetailLinkField(aIndex: Integer): TdaField;
      function GetAvailableField(aIndex: Integer): TdaField;
      function GetAvailableFieldCount: Integer;
      function GetAvailableGroupByField(aIndex: Integer): TdaField;
      function GetAvailableGroupByFieldCount: Integer;
      function GetAvailableMasterLinkFieldCount: Integer;
      function GetAvailableMasterLinkField(aIndex: Integer): TdaField;
      function GetAvailableOrderByField(aIndex: Integer): TdaField;
      function GetAvailableOrderByFieldCount: Integer;
      function GetAvailableSelectField(aIndex: Integer): TdaField;
      function GetAvailableSelectFieldCount: Integer;
      function GetAvailableSelectTable(aIndex: Integer): TdaTable;
      function GetAvailableSelectTableCount: Integer;
      function GetAvailableTable(aIndex: Integer): TdaTable;
      function GetAvailableTableCount: Integer;
      function GetCalcField(aIndex: Integer): TdaCalculation;
      function GetCalcFieldCount: Integer;
      function GetCriteria(aIndex: Integer): TdaCriteria;
      function GetCriteriaCount: Integer;
      function GetFieldsForSQL(aSQL: TStrings; aList: TList): Boolean;
      function GetGroupByField(aIndex: Integer): TdaField;
      function GetGroupByFieldCount: Integer;
      function GetHasGroupsInChain: Boolean;
      function GetHasSearchCriteria: Boolean;
      function GetHasSearchCriteriaInChain: Boolean;
      function GetLink(aIndex: Integer): TdaSQLLink;
      function GetLinkCount: Integer;
      function GetMagicLinkFieldNameCount: Integer;
      function GetMaxSQLFieldAliasLength: Integer;
      function GetOrderByField(aIndex: Integer): TdaField;
      function GetOrderByFieldCount: Integer;
      function GetSelectField(aIndex: Integer): TdaField;
      function GetSelectFieldCount: Integer;
      function GetSelectTable(aIndex: Integer): TdaTable;
      function GetSelectTableCount: Integer;
      function GetSQLText: TStrings;
      procedure InitMagicSQL;
      procedure MatchJoinFieldsViaDictionary(aTable1, aTable2: TdaTable);
      function ResolveCriteria(aCriteria: TdaCriteria; aLastCriteriaType: TdaCriteriaType; var aExpression: String): Boolean;
      procedure SetDataDictionary(aDataDictionary: TppDataDictionary);
      procedure SetEditSQLAsText(Value: Boolean);
      procedure SetLinkingSQL(aValue: Boolean);
      procedure SetMasterSQL(aSQL: TdaSQL);
      procedure SetMaxSQLFieldAliasLength(aTable: TdaTable);
      procedure SetMaxSQLFieldAliasLengthFromTables;
      procedure SetSession(aSession: TdaSession);
      procedure SetSQLText(aSQLText: TStrings);
      procedure SetSQLType(aSQLType: TppSQLType);
      procedure SyncCalcFields;
      procedure SyncCriteria;
      procedure SyncDetailLinkFields;
      procedure SyncFieldList(aAvailableList, aCurrentList: TList);
      procedure SyncFields;
      procedure SyncGroupByFields;
      procedure SyncMasterLinkFields;
      procedure SyncOrderByFields;
      procedure SyncSelectFields;
      procedure SyncSelectTables;
      procedure SyncTableList(aAvailableList, aCurrentList: TList);
      procedure SyncTables;
      procedure UpdateCalcFieldDataTypes(aFieldList: TList);
      procedure UpdateCalcSearchCriteriaDataTypes;
      procedure UpdateJoinableTables;

      procedure ReadDescription(Reader: TReader);

    protected
      procedure AddToSQL(const aSQLText: String);
      procedure AddLineToSQL(const aSQLText: String);

      procedure DoAddFromClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
      procedure DoAddGroupByClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
      procedure DoAddOrderByClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
      procedure DoAddSelectClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
      procedure DoAddWhereClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
      procedure Loaded; override;
      procedure SaveComponents(Proc: TGetChildProc); override;
      function UsesSQL89Joins: Boolean;

      {defines 'fake' properties}
      procedure DefineProperties(Filer: TFiler); override; {contains temporary conversion routine}

      procedure ConvertRawTableNamesToTableNames;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;

      function AddAvailableTable(aAvailableIndex: Integer): TdaTable;
      procedure AddChild(aChild: TppRelative); override;
      function AddCriteria(aType: TdaCriteriaType): TdaCriteria;
      function AddCriteriaField(aTable: TdaTable; const aFieldName: String; aOperator: TdaCriteriaOperatorType; const aValue: String): TdaCriteria;
      function AddGroupByField(aField: TdaField): TdaField;
      function AddOrderByField(aField: TdaField; Ascending: Boolean): TdaField;
      function AddParentheses(aSelectedList: TList): Boolean;
      function AddSelectField(aTable: TdaTable; const aFieldName: String): TdaField;
      function AddTable(const aRawTableName: String): TdaTable;
      function AllowManualJoins: Boolean;
      procedure Assign(Source: TPersistent); override;
      procedure AssignChildren(aChildType: TdaChildType; aSQLDest: TdaSQL);
      function AutoSearchFieldsExist: Boolean;
      procedure AvailableCalcFieldList(aList: TStrings);
      procedure AvailableCriteriaList(aList: TStrings);
      procedure Clear;
      procedure ClearCalcFields;
      procedure ClearCriteria;
      procedure ClearGroupByFields;
      procedure ClearLinkColors;
      procedure ClearOrderByFields;
      procedure ClearSelectFields;
      procedure ClearSelectTables;
      procedure ClearSQLLinks;
      function ContainsFieldName(aString: String): Boolean;
      function ContainsSQLFunctionCall(const aString: String): Boolean;
      procedure Convert(aVersionNo: Integer);
      procedure CreateFieldAliasesForTable(aTable: TdaTable; aFields: TStrings);
      function CreateFieldForTable(aTable: TdaTable; const aFieldName: String): TdaField;
      function CreateFieldFromMetaField(aMetaField: TdaMetaField): TdaField;
      procedure CreateFieldNamesForTable(aTable: TdaTable; aFields: TStrings);
      procedure CreateFieldsForTable(aTable: TdaTable; aFields: TList);
      procedure CreateJoinObjects(const aTableName1, aTableName2, aJoinType, aFieldNames1, aOperators, aFieldNames2: String);
      procedure CreateLink(aMasterField, aDetailField: TdaField);
      procedure CreateSQL; virtual;
      function GetAvailableFieldForLtdSQLString(const aLimitedSQLString: String): TdaField;
      function GetMagicAlias(aField: TdaField): String;
      function GetMagicLinkFieldNames(aIndex: Integer; var aMasterFieldName, aDetailFieldName: String; aMasterMagicSQL: TdaSQL; var aDetailAscending: Boolean): Boolean;
      function GetMagicSQLText: TStrings;
      function GetMagicSQLObject: TdaSQL;
      function GetMagicFieldCount: Integer;
      procedure daFieldToppField(aSourceField: TdaField; aTargetField: TppField);
      function DeselectCalcField(aSelectedIndex: Integer): TdaField;
      function DeselectCriteria(aSelectedIndex: Integer): Boolean;
      function DeselectDetailLinkField(aDetailField: TdaField): TdaField;
      function DeselectField(aSelectedIndex: Integer): TdaField;
      function DeselectGroupByField(aSelectedIndex: Integer): TdaField;
      function DeselectOrderByField(aSelectedIndex: Integer): TdaField;
      function DeselectTable(aSelectedIndex: Integer): TdaTable;
      function EditTableJoin(const aTable1, aTable2: String): Boolean;
      function FieldNameToFieldAlias(const aFieldName: String): String;
      procedure FixUpLinkColors;
      procedure FreeLink(aLink: TdaSQLLink);
      function GetCalcFieldForSQLFieldName(const aSQLFieldName: String): TdaField;
      function GetTableCalcFieldForFieldName(aTable: TdaTable; const aFieldName: String): TdaField;
      function GetTableSelectFieldForFieldName(aTable: TdaTable; const aFieldName: String): TdaField;
      function GetTableSelectFieldForSQLFieldName(const aSQLFieldName: String): TdaField;
      function GetFieldForAlias(const aAlias: String): TdaField;
      function GetFieldForFieldAlias(const aFieldAlias: String): TdaField;
      function GetFieldForFieldName(const aFieldName: String): TdaField;
      function GetFieldForSQLFieldName(const aFieldName: String): TdaField;
      function GetTableForSQLAlias(const aSQLAlias: String): TdaTable;
      function HasAggregates: Boolean;
      function HasGroups: Boolean;
      function IndexOfAvailableDetailLinkField(aField: TdaField): Integer;
      function IndexOfAvailableMasterLinkField(aField: TdaField): Integer;
      function IndexOfChild(aChild: TppRelative): Integer; override;
      function IndexOfRawTableName(const aRawTableName: String): Integer;
      function IndexOfSelectTableName(const aTableName: String): Integer;
      function IndexOfTableAlias(const aTableAlias: String): Integer;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function InsertCriteria(aPosition: Integer; aType: TdaCriteriaType): TdaCriteria;
      function IsAdvantage: Boolean;
      function IsDBISAM: Boolean;
      function IsInterBase: Boolean;
      function IsMSAccess: Boolean;
      function IsMSSQLServer: Boolean;
      function IsOracle: Boolean;
      function IsParadox: Boolean;
      function IsSQLReservedWord(const aString: String): Boolean;
      function IsSybaseASA: Boolean;
      function IsSybaseASE: Boolean;
      procedure MatchJoinFieldsByName(aTable1, aTable2: TdaTable);
      procedure Modification;
      procedure MoveChild(aChild: TdaChild; aCurrentIndex, aNewIndex: Integer);
      procedure NameToSQLString(var aName: String);
      procedure ppFieldTodaField(aSourceField: TppField; aTargetField: TdaField);
      function RemoveChild(aChild: TppRelative): Integer; override;
      function RemoveCriteria(aSelectedIndex: Integer): Boolean;
      function RemoveParentheses(aSelectedList: TList): Boolean;
      procedure RemoveUserCalcFieldAliases;
      function RemoveTable(const aTableSQLAlias: String): Boolean;
      procedure ResetCriteriaLevels;
      procedure Resync;
      function SelectCalcField(aAvailableIndex: Integer): TdaField;
      function SelectCriteria(aAvailableIndex: Integer): TdaCriteria;
      function SelectDetailLinkField(aAvailableIndex: Integer): TdaField;
      function SelectField(aAvailableIndex: Integer): TdaField;
      function SelectGroupByField(aAvailableIndex: Integer): TdaField;
      function SelectMasterLinkField(aAvailableIndex: Integer): TdaField;
      function SelectOrderByField(aAvailableIndex: Integer): TdaField;
      function SelectTable(aAvailableIndex, aJoinIndex: Integer): TdaTable;
      procedure SetAvailableFieldOrder(aSortMode: Integer);
      procedure SyncGroupByFieldsWithSelectFields;
      procedure SyncOrderByFieldsWithCalcFields;
      function Valid: Boolean;
      function ValidateFieldAlias(aField: TdaField; aFixAlias: Boolean): Boolean;
      procedure ValidateSQLFieldName(var aNewSQLFieldName: String; const aOldSQLFieldName: String; aMaxSQLFieldNameLength: Integer);
      function ValidateSQLText(aSQLText: TStrings): Boolean;
      function ValidateLinks: Boolean;
      function SelectFieldsChanged(aNewSQL: TdaSQL): Boolean;
      function SearchCriteriaChanged(aNewSQL: TdaSQL): Boolean;
      function OrderByFieldsChanged(aNewSQL: TdaSQL): Boolean;

      property AllowSelfJoin: Boolean read FAllowSelfJoin write FAllowSelfJoin default False;
      property AvailableCalcFieldCount: Integer read GetAvailableCalcFieldCount;
      property AvailableCalcFields[aIndex: Integer]: TdaField read GetAvailableCalcField;
      property AvailableCriteria[aIndex: Integer]: TdaField read GetAvailableCriteria;
      property AvailableCriteriaCount: Integer read GetAvailableCriteriaCount;
      property AvailableDetailLinkFieldCount: Integer read GetAvailableDetailLinkFieldCount;
      property AvailableDetailLinkFields[aIndex: Integer]: TdaField read GetAvailableDetailLinkField;
      property AvailableFieldCount: Integer read GetAvailableFieldCount;
      property AvailableFields[aIndex: Integer]: TdaField read GetAvailableField;
      property AvailableGroupByFieldCount: Integer read GetAvailableGroupByFieldCount;
      property AvailableGroupByFields[aIndex: Integer]: TdaField read GetAvailableGroupByField;
      property AvailableMasterLinkFieldCount: Integer read GetAvailableMasterLinkFieldCount;
      property AvailableMasterLinkFields[aIndex: Integer]: TdaField read GetAvailableMasterLinkField;
      property AvailableOrderByFieldCount: Integer read GetAvailableOrderByFieldCount;
      property AvailableOrderByFields[aIndex: Integer]: TdaField read GetAvailableOrderByField;
      property AvailableSelectFieldCount: Integer read GetAvailableSelectFieldCount;
      property AvailableSelectFields[aIndex: Integer]: TdaField read GetAvailableSelectField;
      property AvailableSelectTableCount: Integer read GetAvailableSelectTableCount;
      property AvailableSelectTables[aIndex: Integer]: TdaTable read GetAvailableSelectTable;
      property AvailableTableCount: Integer read GetAvailableTableCount;
      property AvailableTables[aIndex: Integer]: TdaTable read GetAvailableTable;
      property CalcFieldCount: Integer read GetCalcFieldCount;
      property CalcFields[aIndex: Integer]: TdaCalculation read GetCalcField;
      property CalcFieldsOutOfSync: Boolean read FCalcFieldsOutOfSync;
      property Criteria[aIndex: Integer]: TdaCriteria read GetCriteria;
      property CriteriaCount: Integer read GetCriteriaCount;
      property CriteriaOutOfSync: Boolean read FCriteriaOutOfSync;
      property DataDictionary: TppDataDictionary read FDataDictionary write SetDataDictionary;
      property DetailLinkFieldsOutOfSync: Boolean read FDetailLinkFieldsOutOfSync write FDetailLinkFieldsOutOfSync;
      property DriverName: String read FDriverName;
      property FieldsOutOfSync: Boolean read FFieldsOutOfSync;
      property GroupByFieldCount: Integer read GetGroupByFieldCount;
      property GroupByFields[aIndex: Integer]: TdaField read GetGroupByField;
      property GroupByFieldsOutOfSync: Boolean read FGroupByFieldsOutOfSync;
      property HasGroupsInChain: Boolean read GetHasGroupsInChain;
      property HasSearchCriteria: Boolean read GetHasSearchCriteria;
      property HasSearchCriteriaInChain: Boolean read GetHasSearchCriteriaInChain;
      property LanguageIndex: LongInt read FLanguageIndex write FLanguageIndex;
      property LineLength: Integer read FLineLength write FLineLength;
      property LinkBroker: TppRelative read FLinkBroker write FLinkBroker;
      property LinkCount: Integer read GetLinkCount;
      property LinkingSQL: Boolean read FLinkingSQL write SetLinkingSQL;
      property Links[aIndex: Integer]: TdaSQLLink read GetLink;
      property MagicLinkFieldNameCount: Integer read GetMagicLinkFieldNameCount;
      property MagicSQLText: TStrings read GetMagicSQLText;
      property MasterLinkFieldsOutOfSync: Boolean read FMasterLinkFieldsOutOfSync write FMasterLinkFieldsOutOfSync;
      property MasterSQL: TdaSQL read FMasterSQL write SetMasterSQL;
      property Modified: Boolean read FModified write FModified;
      property OnAddFromClauseText: TdaAddSQLTextEvent read FAddFromClauseText write FAddFromClauseText;
      property OnAddGroupByClauseText: TdaAddSQLTextEvent read FAddGroupByClauseText write FAddGroupByClauseText;
      property OnAddOrderByClauseText: TdaAddSQLTextEvent read FAddOrderByClauseText write FAddOrderByClauseText;
      property OnAddSelectClauseText: TdaAddSQLTextEvent read FAddSelectClauseText write FAddSelectClauseText;
      property OnAddWhereClauseText: TdaAddSQLTextEvent read FAddWhereClauseText write FAddWhereClauseText;
      property OrderByFieldCount: Integer read GetOrderByFieldCount;
      property OrderByFields[aIndex: Integer]: TdaField read GetOrderByField;
      property OrderByFieldsOutOfSync: Boolean read FOrderByFieldsOutOfSync;
      property SelectFieldCount: Integer read GetSelectFieldCount;
      property SelectFields[aIndex: Integer]: TdaField read GetSelectField;
      property SelectFieldsOutOfSync: Boolean read FSelectFieldsOutOfSync;
      property SelectTableCount: Integer read GetSelectTableCount;
      property SelectTables[aIndex: Integer]: TdaTable read GetSelectTable;
      property SelectTablesOutOfSync: Boolean read FSelectTablesOutOfSync;
      property Session: TdaSession read FSession write SetSession;
      property StealthMode: Boolean read FStealthMode write FStealthMode;
      property SQLOutOfSync: Boolean read FSQLOutOfSync;
      property TablesOutOfSync: Boolean read FTablesOutOfSync;

      property Description: String read FDescription;

    published
      property ChildType;
      property DatabaseName: String read FDatabaseName write FDatabaseName;
      property DatabaseType: TppDatabaseType read FDatabaseType write FDatabaseType default dtOther;
      property DataPipelineName: String read FDataPipelineName write FDataPipelineName;
      property Distinct: Boolean read FDistinct write FDistinct default False;
      property EditSQLAsText: Boolean read FEditSQLAsText write SetEditSQLAsText default False;
      property IsCaseSensitive: Boolean read FIsCaseSensitive write FIsCaseSensitive default False;
      property GroupByFieldsSynced: Boolean read FGroupByFieldsSynced write FGroupByFieldsSynced default False;
      property LinkColor: TColor read FLinkColor write FLinkColor;
      property MaxSQLFieldAliasLength: Integer read GetMaxSQLFieldAliasLength write FMaxSQLFieldAliasLength;
      property SkipWhenNoRecords: Boolean read FSkipWhenNoRecords write FSkipWhenNoRecords default True;
      property SQLText: TStrings read GetSQLText write SetSQLText;
      property SQLType: TppSQLType read FSQLType write SetSQLType default sqBDELocal;

  end; {class, TdaSQL}


  { TdaChild }
  TdaChild = class (TppRelative)
    public
      procedure Assign(Source: TPersistent); override;
      function EqualTo(aChild: TdaChild): Boolean; virtual;
      function GetSQL: TdaSQL;
      function HasParent: Boolean; override;
      function Index: Integer;

    published
      property ChildType;

  end; {class, TdaChild}


  { TdaTable }
  TdaTable = class (TdaChild)
    private
      FAlias: String;
      FJoinable: Boolean;
      FJoinableTableNames: TStrings;
      FJoinTable: String;
      FJoinType: TdaJoinType;
      FOwnerName: String;
      FSQLAlias: String;
      FTableAlias: String;
      FTableJoins: TList;
      FTableName: String;

      function GetRawTableName: String;
      function GetTableJoin(aIndex: Integer): TdaTableJoin;
      function GetTableJoinCount: Integer;
      procedure SetRawTableName(const aTableName: String);

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure AddChild(aChild: TppRelative); override;
      function AddTableJoin(aTable: TdaTable; const aFieldName1, aFieldName2: String; aType: TdaJoinOperatorType): TdaTableJoin;
      procedure Assign(Source: TPersistent); override;
      procedure Clear;
      function DataName: String;
      function IndexOfChild(aChild: TppRelative): Integer; override;
      function IndexOfFirstJoinTable(aSQL: TdaSQL): Integer;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function JoinFieldNames1: String;
      function JoinFieldNames2: String;
      function JoinOperators: String;
      function JoinTableSQLAlias: String;
      function JoinTypeDesc: String;
      function JoinTypeString: String;
      procedure Loaded; override;
      function RemoveChild(aChild: TppRelative): Integer; override;
      function SQLJoinTypeDesc: String;
      function SQLText: String;
      procedure UpdateJoinable(aSelectedTables: TStrings);

      property Joinable: Boolean read FJoinable;
      property JoinableTableNames: TStrings read FJoinableTableNames;
      property RawTableName: String read GetRawTableName write SetRawTableName;
      property TableJoinCount: Integer read GetTableJoinCount;
      property TableJoins[aIndex: Integer]: TdaTableJoin read GetTableJoin;

    published
      property Alias: String read FAlias write FAlias;
      property JoinTable: String read FJoinTable write FJoinTable;
      property JoinType: TdaJoinType read FJoinType write FJoinType default dajtInner;
      property OwnerName: String read FOwnerName write FOwnerName;
      property SQLAlias: String read FSQLAlias write FSQLAlias;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableName: String read FTableName write FTableName;

  end; {class, TdaTable}


  { TdaField }
  TdaField = class (TdaChild)
    private
      FAlias: String;
      FAscending: Boolean;
      FAutoSearch: Boolean;
      FDataType: TppDataType;
      FDisplayFormat: String;
      FDisplayWidth: Integer;
      FFieldAlias: String;
      FFieldName: String;
      FFieldLength: Integer;
      FLinkable: Boolean;
      FLinkColor: TColor;
      FLinkCount: Integer;
      FMandatory: Boolean;
      FSearchable: Boolean;
      FSelectable: Boolean;
      FSelectAll: Boolean;
      FShowAllValues: Boolean;
      FSortable: Boolean;
      FSQLFieldName: String;
      FTableAlias: String;
      FTableName: String;
      FTableSQLAlias: String;

      procedure SetLinkColor(aColor: TColor);

    protected
      procedure SetAlias(const aValue: String); virtual;
      procedure SetDataType(aDataType: TppDataType); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure Clear; virtual;
      function EqualTo(aChild: TdaChild): Boolean; override;
      function GetDescription: String; virtual;
      function LimitedSQLString: String; virtual;
      function OrderByDesc: String;
      function SQLString: String; virtual;
      property Description: String read GetDescription;

      {these properties used by dataview linking only}
      property LinkColor: TColor read FLinkColor write SetLinkColor;
      property LinkCount: Integer read FLinkCount;

    published
      property Alias: String read FAlias write SetAlias;
      property Ascending: Boolean read FAscending write FAscending default True;
      property AutoSearch: Boolean read FAutoSearch write FAutoSearch default False;
      property DataType: TppDataType read FDataType write SetDataType default dtString;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property DisplayWidth: Integer read FDisplayWidth write FDisplayWidth;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldLength: Integer read FFieldLength write FFieldLength;
      property FieldName: String read FFieldName write FFieldName;
      property Linkable: Boolean read FLinkable write FLinkable default True;
      property Mandatory: Boolean read FMandatory write FMandatory default False;
      property Searchable: Boolean read FSearchable write FSearchable default True;
      property Selectable: Boolean read FSelectable write FSelectable default True;
      property SelectAll: Boolean read FSelectAll write FSelectAll default False;
      property ShowAllValues: Boolean read FShowAllValues write FShowAllValues default False;
      property Sortable: Boolean read FSortable write FSortable default True;
      property SQLFieldName: String read FSQLFieldName write FSQLFieldName;
      property TableAlias: String read FTableAlias write FTableAlias;
      property TableName: String read FTableName write FTableName;
      property TableSQLAlias: String read FTableSQLAlias write FTableSQLAlias;

  end; {class, TdaField}


  { TdaCalculation }
  TdaCalculation = class (TdaField)
    private
      FCalcType: TdaCalcType;
      FExpression: String;
      FOnCalcTypeChange: TNotifyEvent;

      function GetCalcFieldAlias: String;
      procedure SetCalcType(aCalcType: TdaCalcType);

    protected
      procedure SetAlias(const aValue: String); override;
      procedure SetDataType(aDataType: TppDataType); override;

    public
      constructor Create(aOwner: TComponent); override;

      procedure Assign(Source: TPersistent); override;

      procedure Clear; override;
      function EqualTo(aChild: TdaChild): Boolean; override;
      function FunctionDesc: String;
      function GetDescription: String; override;
      procedure GenerateSQLFieldName;
      function SQLString: String; override;

      property CalcFieldAlias: String read GetCalcFieldAlias;
      property OnCalcTypeChange: TNotifyEvent read FOnCalcTypeChange write FOnCalcTypeChange;

    published
      property CalcType: TdaCalcType read FCalcType write SetCalcType default dacaUnknown;
      property Expression: String read FExpression write FExpression;

  end; {class, TdaCalculation}


  { TdaTableJoin }
  TdaTableJoin = class (TdaChild)
    private
      FForeignField: TdaField;
      FLocalField: TdaField;
      FOperator: TdaJoinOperatorType;

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure AddChild(aChild: TppRelative); override;
      procedure Assign(Source: TPersistent); override;
      function RemoveChild(aChild: TppRelative): Integer; override;

      property ForeignField: TdaField read FForeignField;
      property LocalField: TdaField read FLocalField;

    published
      property Operator: TdaJoinOperatorType read FOperator write FOperator default dajoEqual;

  end; {class, TdaTableJoin}


  { TdaCriteria }
  TdaCriteria = class (TdaChild)
    private
      FCaseSensitive: Boolean;
      FContainsFieldName: Boolean;
      FCriteriaType: TdaCriteriaType;
      FExpression: String;
      FField: TdaField;
      FLevel: Integer;
      FNumericValues: TList;
      FNumericValuesOutOfSync: Boolean;
      FOperator: TdaCriteriaOperatorType;
      FValue: String;

      {conversion to 5.5}
      FOldShowAllValues: Boolean;

      procedure AddNumericValue(const aValue: String);
      procedure AssignNewField(const aLtdSQLString: String);
      function ExpressionIsFieldName(const aValue: String): Boolean;
      procedure FreeNumericValues;
      function GetValue: String;
      procedure SetValue(const aValue: String);
      procedure SetExpression(const aValue: String);
      procedure UpdateNumericValues;

      {conversion to 5.5}
      procedure ReadShowAllValues(Reader: TReader);
      
    protected
      procedure Loaded; override;
      procedure SaveComponents(Proc: TGetChildProc); override;

      {defines 'fake' properties}
      procedure DefineProperties(Filer: TFiler); override; {contains temporary conversion routine}

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure AddChild(aChild: TppRelative); override;
      procedure Assign(Source: TPersistent); override;
      function AutoSearchDesc: String;
      function Description: String;
      function EqualTo(aChild: TdaChild): Boolean; override;
      function IsExpression: Boolean;
      function IsNumeric: Boolean;
      function MandatoryDesc: String;
      function OperatorDesc: String;
      function RemoveChild(aChild: TppRelative): Integer; override;
      function ShowAllDesc: String;

      property Field: TdaField read FField;

    published
      property CaseSensitive: Boolean read FCaseSensitive write FCaseSensitive default True;
      property ContainsFieldName: Boolean read FContainsFieldName write FContainsFieldName default False;
      property CriteriaType: TdaCriteriaType read FCriteriaType write FCriteriaType default dacrField;
      property Expression: String read FExpression write SetExpression;
      property Level: Integer read FLevel write FLevel;
      property Operator: TdaCriteriaOperatorType read FOperator write FOperator default dacoEqual;
      property Value: String read GetValue write SetValue;

  end; {class, TdaCriteria}


  { TdaNumericValue }
  TdaNumericValue = class (TppRelative)
    private
      FValue: Double;

    published
      property Value: Double read FValue write FValue;

  end; {class, TdaNumericValue}


  { TdaSQLLink }
  TdaSQLLink = class (TdaChild)
    private
      FDetailField: TdaField;
      FLinkColor: TColor;
      FMasterField: TdaField;

      function GetDescription: String;

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Assign(Source: TPersistent); override;

      procedure AddChild(aChild: TppRelative); override;
      function RemoveChild(aChild: TppRelative): Integer; override;

      property Description: String read GetDescription;
      property DetailField: TdaField read FDetailField;
      property LinkColor: TColor read FLinkColor write FLinkColor;
      property MasterField: TdaField read FMasterField;

  end; {class, TdaSQLLink}


  {general procedures}
  function  daDataTypeToString(aDataType: TppDataType): String;
  function  daDaysInMonth(aMonth, aYear: Word): Word;
  function  daContainsInvalidChars(const aFieldName: String): Boolean;
  function  daGetCalcDesc(aCalcType: TdaCalcType): String;
  function  daGetJoinDesc(aType: TdaJoinType): String;
  function  daGetOperatorDesc(aOperator: TdaCriteriaOperatorType): String;
  function  daInsertString(aList: TStrings; aPosition: Integer; const aString: String): Integer;
  function  daInvalidChar(const aName: String): Integer;
  function  daJoinOperatorToString(aType: TdaJoinOperatorType): String;
  function  daJoinTypeToString(const aJoinType: TdaJoinType): String;
  function  daNextDay(aDateTime : TDateTime) : TDateTime;
  function  daPreviousDay(aDateTime : TDateTime) : TDateTime;
  function  daReplicate(Count: Integer; S: String): String;
  function  daStringToJoinOperator(const aOperator: String): TdaJoinOperatorType;
  function  daStringToJoinType(const aJoinType: String): TdaJoinType;
  procedure daWeekStartEnd(aCurrentDateTime: TDateTime; var aStartDateTime, aEndDateTime : TDateTime);

  procedure daAssignChildren(aList: TList; aOwner: TComponent; aParent: TppRelative);
  procedure daCopyList(aSourceList, aTargetList: TList; aCopyFilter: TdaCopyFilterType);
  function  daFindField(aField: TdaField; aList: TList): Integer;
  function  daFindFieldForName(const aTableName, aFieldName: String; aList: TList): Integer;
  function  daFindFieldInStrings(aField: TdaField; aList: TStrings): Integer;
  function  daFindTable(aTable: TdaTable; aList: TList): Integer;
  procedure daFreeChildren(aList: TList);
  procedure daFreeChildrenInStrings(aList: TStrings);
  function  daRestoreAvailableField(aField: TdaField; aAvailableFields, aAvailableFieldList: TList): TdaField;
  function  daRestoreAvailableTable(aTable: TdaTable; aAvailableTables, aAvailableTableList: TList): TdaTable;

const
  dacaNumerics: TppDataTypeSet = [dtInteger, dtLongint, dtSingle, dtDouble, dtExtended, dtCurrency];
  dacaBLOBs:    TppDataTypeSet = [dtBLOB, dtGraphic];

implementation

uses
  daJoinTableDlg, daLinkBroker, daMagicSQL;

{*******************************************************************************
 *
 ** S Q L  L I N K
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQLLink.Create }

constructor TdaSQLLink.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactSQLLink);

  FLinkColor := 0;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaSQLLink.Destroy }

destructor TdaSQLLink.Destroy;
begin

  FMasterField.Free;
  FDetailField.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaSQLLink.Assign }

procedure TdaSQLLink.Assign(Source: TPersistent);
var
  lField: TdaField;
  lNewField: TdaField;
begin

  if (Source is TdaSQLLink) then
    begin
      lField := TdaSQLLink(Source).MasterField;

      if (lField is TdaCalculation) then
        lNewField := TdaCalculation.Create(Parent.Owner)
      else
        lNewField := TdaField.Create(Parent.Owner);

      lNewField.Assign(lField);
      lNewField.ChildType := lField.ChildType;
      lNewField.Parent := Self;

      lField := TdaSQLLink(Source).DetailField;

      if (lField is TdaCalculation) then
        lNewField := TdaCalculation.Create(Parent.Owner)
      else
        lNewField := TdaField.Create(Parent.Owner);

      lNewField.Assign(lField);
      lNewField.ChildType := lField.ChildType;
      lNewField.Parent := Self;

    end;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaSQLLink.AddChild }

procedure TdaSQLLink.AddChild(aChild: TppRelative);
begin

  case TdaChildType(aChild.ChildType) of
     dactMasterLinkField: FMasterField := TdaField(aChild);
     dactDetailLinkField: FDetailField := TdaField(aChild);
     else
       inherited AddChild(aChild);
  end;

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaSQLLink.RemoveChild }

function TdaSQLLink.RemoveChild(aChild: TppRelative): Integer;
begin

  Result := 0;
  
  case TdaChildType(aChild.ChildType) of
     dactMasterLinkField: FMasterField := nil;
     dactDetailLinkField: FDetailField := nil;
     else
       Result := inherited RemoveChild(aChild);
  end;

end; {function, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaSQLLink.SaveComponents }

procedure TdaSQLLink.SaveComponents(Proc: TGetChildProc);
begin
  
  inherited SaveComponents(Proc);
  
  if (FMasterField <> nil) then
    Proc(FMasterField);

  if (FDetailField <> nil) then
    Proc(FDetailField);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaSQLLink.GetDescription }

function TdaSQLLink.GetDescription: String;
begin
  Result := FDetailField.FieldAlias + ' -> ' + FMasterField.FieldAlias;
end; {function, GetDescription}

{*******************************************************************************
 *
 ** S Q L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaSQL.AddAllSelectFields }

procedure TdaSQL.AddAllSelectFields(aTable: TdaTable);
var
  lFields: TList;
  lField: TdaField;
  liIndex: Integer;
begin
  
  lFields := TList.Create;
  
  CreateFieldsForTable(aTable, lFields);
  
  for liIndex := 0 to lFields.Count - 1 do
    begin
      lField := TdaField(lFields[liIndex]);
  
      ValidateFieldAlias(lField, True);
  
      lField.ChildType := Ord(dactSelectField);

      lField.Parent := Self;

      lField.SQLFieldName := GetMagicAlias(lField);
    end;
  
  lFields.Free;
  
end; {procedure, AddAllSelectFields}


{------------------------------------------------------------------------------}
{ TdaSQL.AddAvailableTable }

function TdaSQL.AddAvailableTable(aAvailableIndex: Integer): TdaTable;
var
  lAvailableTable: TdaTable;
  lTable: TdaTable;
begin
  
  {this function can be used for manually building tables, callers
   must take full responsibility for creating valid join conditions
   between the tables}
  
  lAvailableTable := AvailableSelectTables[aAvailableIndex];
  
  lTable := TdaTable.Create(Self);
  lTable.Assign(lAvailableTable);
  
  lTable.Alias := CreateAlias(lTable.TableName);
  lTable.TableAlias := CreateTableAlias(lTable);
  lTable.SQLAlias := CreateTableSQLAlias(lTable);
  
  if (SelectTableCount = 0) then
    lTable.JoinType := dajtNone
  else
    lTable.JoinType := dajtInner;
  
  lTable.ChildType := Ord(dactSelectTable);
  lTable.Parent := Self;
  
  SetMaxSQLFieldAliasLength(lTable);

  Result := lTable;
  
end; {function, AddAvailableTable}


{------------------------------------------------------------------------------}
{ TdaSQL.AddChild }

procedure TdaSQL.AddChild(aChild: TppRelative);
begin
  
  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Add(aChild);
     dactSelectField:  FSelectFields.Add(aChild);
     dactOrderByField: FOrderByFields.Add(aChild);
     dactCriteria:     FCriteria.Add(aChild);
     dactCalcField:    FCalcFields.Add(aChild);
     dactGroupByField: FGroupByFields.Add(aChild);
     dactSQLLink:      aChild.Parent := FLinkBroker;
     else
       inherited AddChild(aChild);
  end;
  
  Modification;
  
end; {procedure, AddChild}


{------------------------------------------------------------------------------}
{ TdaSQL.AddCriteria }

function TdaSQL.AddCriteria(aType: TdaCriteriaType): TdaCriteria;
var
  lCriteria: TdaCriteria;
begin
  
  lCriteria := TdaCriteria.Create(Self);
  lCriteria.CriteriaType := aType;
  lCriteria.Parent := Self;

  ResetCriteriaLevels;
  
  Result := lCriteria;
  
end; {function, AddCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.AddCriteriaField }

function TdaSQL.AddCriteriaField(aTable: TdaTable; const aFieldName: String; aOperator: TdaCriteriaOperatorType; const aValue: String): TdaCriteria;
var
  lCriteria: TdaCriteria;
  lField: TdaField;
begin
  
  lCriteria := TdaCriteria.Create(Self);
  
  lField := CreateFieldForTable(aTable, aFieldName);
  lField.Parent := lCriteria;
  
  lCriteria.Operator := aOperator;
  lCriteria.Value := aValue;
  lCriteria.Parent := Self;
  
  ResetCriteriaLevels;
  
  Result := lCriteria;
  
end; {function, AddCriteriaField}


{------------------------------------------------------------------------------}
{ TdaSQL.AddGroupByField }

function TdaSQL.AddGroupByField(aField: TdaField): TdaField;
var
  lField: TdaField;
begin
  
  lField := TdaField.Create(Self);
  lField.Assign(aField);
  lField.ChildType := Ord(dactGroupByField);
  lField.Parent := Self;
  
  Result := lField;
  
end; {function, AddGroupByField}


{------------------------------------------------------------------------------}
{ TdaSQL.AddOrderByField }

function TdaSQL.AddOrderByField(aField: TdaField; Ascending: Boolean): TdaField;
var
  lField: TdaField;
begin

  if (aField is TdaCalculation) then
    lField := TdaCalculation.Create(Self)
  else
    lField := TdaField.Create(Self);

  lField.Assign(aField);
  lField.ChildType := Ord(dactOrderByField);
  lField.Ascending := Ascending;
  lField.Parent := Self;

  {Since we're cloning this field, get rid of any aliasing done to aField}
  lField.SQLFieldName := lField.FieldName;

  Result := lField;

end; {function, AddOrderByField}


{------------------------------------------------------------------------------}
{ TdaSQL.AddParentheses }

function TdaSQL.AddParentheses(aSelectedList: TList): Boolean;
var
  liItem: Integer;
begin
  
  Result := False;
  
  if (aSelectedList = nil) or (aSelectedList.Count = 0) then Exit;
  
  liItem := Integer(aSelectedList[0]);
  
  InsertCriteria(liItem, dacrBegin);
  
  liItem := Integer(aSelectedList[aSelectedList.Count - 1]);
  
  InsertCriteria(liItem + 2, dacrEnd);
  
  Result := True;
  
end; {function, AddParentheses}

{------------------------------------------------------------------------------}
{ TdaSQL.AddSelectField }

function TdaSQL.AddSelectField(aTable: TdaTable; const aFieldName: String): TdaField;
var
  lField: TdaField;
begin

  if (aFieldName = '*') then
    begin
      AddAllSelectFields(aTable);

      Result := nil;
    end
  else
    begin
      lField := CreateFieldForTable(aTable, aFieldName);
      lField.ChildType := Ord(dactSelectField);
      lField.Parent := Self;

      lField.SQLFieldName := GetMagicAlias(lField);

      Result := lField;
    end;

end; {function, AddSelectField}

{------------------------------------------------------------------------------}
{ TdaSQL.AddTable }

function TdaSQL.AddTable(const aRawTableName: String): TdaTable;
var
  lTable: TdaTable;
begin
  
  {this function can be used for manually building tables, callers
   must take full responsibility for creating valid join conditions
   between the tables}
  lTable := TdaTable.Create(Self);
  lTable.RawTableName := aRawTableName;
  lTable.Alias := CreateAlias(aRawTableName);
  lTable.TableAlias := CreateTableAlias(lTable);
  lTable.SQLAlias := CreateTableSQLAlias(lTable);
  
  if (SelectTableCount = 0) then
    lTable.JoinType := dajtNone
  else
    lTable.JoinType := dajtInner;
  
  lTable.ChildType := Ord(dactSelectTable);
  lTable.Parent := Self;

  SetMaxSQLFieldAliasLength(lTable);

  Result := lTable;
  
end; {function, AddTable}


{------------------------------------------------------------------------------}
{ TdaSQL.AddToSQL }

procedure TdaSQL.AddToSQL(const aSQLText: String);
var
  lsCurrentLine: String;
  lsNewText: String;
  lsIndentation: String;
begin

  lsCurrentLine := FSQLText[FSQLText.Count - 1];

  if (Length(lsCurrentLine) + Length(aSQLText) > FLineLength) then
    begin
      lsIndentation := daReplicate(FIndent, ' ');

      lsNewText := lsIndentation + aSQLText;

      FSQLText.Add(lsNewText);
    end
  else
    FSQLText[FSQLText.Count - 1] := lsCurrentLine + aSQLText;

end; {procedure, AddToSQL}


{------------------------------------------------------------------------------}
{ TdaSQL.AddLineToSQL }

procedure TdaSQL.AddLineToSQL(const aSQLText: String);
begin

  FSQLText.Add(aSQLText);
  
end; {procedure, AddLineToSQL}


{------------------------------------------------------------------------------}
{ TdaSQL.AssignChildren }

procedure TdaSQL.AssignChildren(aChildType: TdaChildType; aSQLDest: TdaSQL);
begin

  if (aSQLDest <> nil) then
  
    case aChildType of
      dactSelectField:
        daAssignChildren(FSelectFields, aSQLDest, aSQLDest);

      dactGroupByField:
        daAssignChildren(FGroupByFields, aSQLDest, aSQLDest);

      dactOrderByField:
        daAssignChildren(FOrderByFields, aSQLDest, aSQLDest);

      dactCriteria:
        daAssignChildren(FCriteria, aSQLDest, aSQLDest);

      dactCalcField:
        daAssignChildren(FCalcFields, aSQLDest, aSQLDest);
        
    end;

end; {procedure, AssignChildren}

{------------------------------------------------------------------------------}
{ TdaSQL.AutoJoin }

function TdaSQL.AutoJoin: Boolean;
begin

  if (FDataDictionary <> nil) and (FDataDictionary.AutoJoin) and not(FDataDictionary.AllowManualJoins) then
    Result := True
  else
    Result := False;

end; {function, AutoJoin}

{------------------------------------------------------------------------------}
{ TdaSQL.AllowManualJoins }

function TdaSQL.AllowManualJoins: Boolean;
begin
  
  if (FDataDictionary <> nil) and (FDataDictionary.AutoJoin) and not(FDataDictionary.AllowManualJoins) then
    Result := False
  else
    Result := True;
  
end; {function, AllowManualJoins}

{------------------------------------------------------------------------------}
{ TdaSQL.Assign }

procedure TdaSQL.Assign(Source: TPersistent);
var
  lSQL: TdaSQL;
begin

  if not(Source is TdaSQL) then Exit;

  FAssigning := True;

  {free all child objects}
  Clear;

  lSQL := TdaSQL(Source);

  FAllowSelfJoin := lSQL.AllowSelfJoin;
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FDatabaseName := lSQL.FDatabaseName;
  FDatabaseType := lSQL.FDatabaseType;
  SetDataDictionary(lSQL.DataDictionary);
  FDataPipelineName := lSQL.DataPipelineName;
  FDataSetClass := lSQL.FDataSetClass;
  FDetailLinkFieldsOutOfSync := True;
  FDistinct := lSQL.FDistinct;
  FEditSQLAsText := lSQL.FEditSQLAsText;
  FFieldsOutOfSync := True;
  FFieldSortMode := lSQL.FFieldSortMode;
  FGroupByFieldsOutOfSync := True;
  FGroupByFieldsSynced := lSQL.FGroupByFieldsSynced;
  FIsCaseSensitive := lSQL.FIsCaseSensitive;
  FLineLength := lSQL.FLineLength;
  FMasterLinkFieldsOutOfSync := True;
  FModified := lSQL.FModified;
  FOrderByFieldsOutOfSync := True;
  FSQLOutOfSync := True;
  FSQLText.Assign(lSQL.FSQLText);
  FSQLType := lSQL.FSQLType;
  FSelectFieldsOutOfSync := True;
  FSelectTablesOutOfSync := True;
  SetSession(lSQL.FSession);
  SetMasterSQL(lSQL.FMasterSQL);
  FTablesOutOfSync := True;

  daAssignChildren(lSQL.FCalcFields, Self, Self);
  daAssignChildren(lSQL.FCriteria, Self, Self);
  daAssignChildren(lSQL.FSelectFields, Self, Self);
  daAssignChildren(lSQL.FGroupByFields, Self, Self);
  daAssignChildren(lSQL.FOrderByFields, Self, Self);
  daAssignChildren(lSQL.FSelectTables, Self, Self);

  FLinkBroker.Assign(lSQL.FLinkBroker);
  
  FAssigning := False;

  FAddSelectClauseText := lSQL.FAddSelectClauseText;
  FAddFromClauseText := lSQL.FAddFromClauseText;
  FAddWhereClauseText := lSQL.FAddWhereClauseText;
  FAddGroupByClauseText := lSQL.FAddGroupByClauseText;
  FAddOrderByClauseText := lSQL.FAddOrderByClauseText;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaSQL.AvailableCalcFieldList }

function TdaSQL.AutoSearchFieldsExist: Boolean;
var
  liIndex: Integer;
begin
  Result := False;
  liIndex := 0;

  while not(Result) and (liIndex < CriteriaCount) do
    begin
      if (Criteria[liIndex].Field <> nil) and (Criteria[liIndex].Field.AutoSearch) then
        Result := True
      else
        Inc(liIndex);
    end;

end; {procedure, AutoSearchFieldsExist}

{------------------------------------------------------------------------------}
{ TdaSQL.AvailableCalcFieldList }

procedure TdaSQL.AvailableCalcFieldList(aList: TStrings);
var
  liIndex: Integer;
  lField: TdaField;
begin
  
  aList.Clear;
  
  for liIndex := 0 to AvailableCalcFieldCount - 1 do
    begin
      lField := AvailableCalcFields[liIndex];
  
      lField.Tag := liIndex;
  
      if lField.DataType in dacaNumerics then
        aList.AddObject(lField.Description, lField);
    end;
  
end; {procedure, AvailableCalcFieldList}


{------------------------------------------------------------------------------}
{ TdaSQL.AvailableCriteriaList }

procedure TdaSQL.AvailableCriteriaList(aList: TStrings);
var
  liIndex: Integer;
  lField: TdaField;
begin
  
  aList.Clear;
  
  for liIndex := 0 to AvailableCriteriaCount - 1 do
    begin
      lField := AvailableCriteria[liIndex];
  
      lField.Tag := liIndex;
  
      if not(lField.DataType in dacaBLOBs) then
        aList.AddObject(lField.Description, lField);
    end;
  
end; {procedure, AvailableCriteriaList}


{------------------------------------------------------------------------------}
{ TdaSQL.AvailableFieldsOutOfSync }

procedure TdaSQL.AvailableFieldsOutOfSync;
begin
  
  FFieldsOutOfSync := True;
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FSelectFieldsOutOfSync := True;
  FGroupByFieldsOutOfSync := True;
  FOrderByFieldsOutOfSync := True;
  FDetailLinkFieldsOutOfSync := True;
  FMasterLinkFieldsOutOfSync := True;
  
end; {procedure, AvailableFieldsOutOfSync}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildFromClause }

procedure TdaSQL.BuildFromClause;
var
  liIndex: Integer;
  lJoins: TList;
  lTable: TdaTable;
  lsText: String;
begin
  
  if (FSelectTables.Count = 0) then Exit;
  
  FSQLText.Add('FROM ');
  FIndent := 5;
  
  lJoins := TList.Create;
  
  for liIndex := 1 to SelectTableCount - 1 do
    begin
      lTable := SelectTables[liIndex];
  
      if (not(IsAdvantage) and (FSQLType in [sqSQL2, sqBDELocal])) or (IsAdvantage and (lTable.JoinType <> dajtInner)) then
        lJoins.Add(lTable);
    end;
  
  if (lJoins.Count > 0) then
    BuildSQL92JoinExpression(lJoins)
  
  else
    begin
      for liIndex := 0 to SelectTableCount - 1 do
        begin
          lTable := SelectTables[liIndex];
  
          lsText := lTable.SQLText;
  
          DoAddFromClauseText(Self, lTable, lsText);
  
          if (liIndex > 0) then
            lsText := ', ' + lsText;
  
          AddToSQL(lsText)
        end;
    end;
  
  lJoins.Free;
  
end; {procedure, BuildFromClause}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildGroupByClause }

procedure TdaSQL.BuildGroupByClause;
var
  liIndex: Integer;
  lField: TdaField;
  lsText: String;
begin
  
  if GroupByFieldCount = 0 then Exit;
  
  FSQLText.Add('GROUP BY ');
  FIndent := 9;
  
  for liIndex := 0 to GroupByFieldCount - 1 do
    begin
      lField := GroupByFields[liIndex];
  
      lsText := lField.SQLString;
  
      DoAddGroupByClauseText(Self, lField, lsText);
  
      if (liIndex < GroupByFieldCount - 1) then
        lsText := lsText + ', ';
  
      AddToSQL(lsText);
    end; {for, each group field}
  
end; {procedure, BuildGroupByClause}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildOrderByClause }

procedure TdaSQL.BuildOrderByClause;
var
  liIndex: Integer;
  lField: TdaField;
  lsText: String;
begin
  
  if (OrderByFieldCount <> 0) and not(FStealthMode) then
    begin
      FSQLText.Add('ORDER BY ');
      FIndent := 9;

      for liIndex := 0 to OrderByFieldCount - 1 do
        begin
          lsText := '';
          
          lField := OrderByFields[liIndex];

          if lField is TdaCalculation then
            {note: do not use lField.Index, because it will return the OrderByFields.IndexOf value}
            lsText := IntToStr(SelectFieldCount + daFindField(lField, FCalcFields) + 1)
          else
            lsText := lField.SQLString;

          if not(lField.Ascending) then
            lsText := lsText + ' DESC';

          DoAddOrderByClauseText(Self, lField, lsText);

          if (liIndex < OrderByFieldCount - 1) then
            lsText := lsText + ', ';

         AddToSQL(lsText);
        end;
    end;
  
end; {procedure, BuildOrderByClause}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildSearchCriteria }

procedure TdaSQL.BuildSearchCriteria;
var
  lLastCriteriaType: TdaCriteriaType;
  lbFirstCriteria: Boolean;
  lCriteria: TdaCriteria;
  liIndex: Integer;
  lsText: String;
  lbORNeeded: Boolean;
begin

  lLastCriteriaType := dacrBegin;
  lbFirstCriteria := True;
  lbORNeeded := False;

  lsText := '';

  for liIndex := 0 to CriteriaCount - 1 do
    begin
      lCriteria := Criteria[liIndex];

      if (((lCriteria.Field <> nil) and not(lCriteria.Field.ShowAllValues)) or (lCriteria.Field = nil)) then

        if ResolveCriteria(lCriteria, lLastCriteriaType, lsText) then
          begin

            if (lbORNeeded) then
              begin
                lbORNeeded := False;

                if (lCriteria.CriteriaType <> dacrOR) then
                  lsText := ' OR ' + lsText;
              end;

            if (lCriteria.CriteriaType = dacrOR) then
              begin
                if (lLastCriteriaType in [dacrField, dacrEnd]) then
                  begin
                    lbORNeeded := True;

                    lLastCriteriaType := dacrOR;
                  end;

                Continue;
              end;


            if FWhereAdded and (lbFirstCriteria) then
              AddToSQL(' AND ')

            else if not(FWhereAdded) then
              begin
                if (FStealthMode) then
                  FSQLText.Add('AND ')
                else
                  FSQLText.Add('WHERE ');

                FWhereAdded := True;
              end;

            lbFirstCriteria := False;


            DoAddWhereClauseText(Self, lCriteria, lsText);

            AddToSQL(lsText);

            lLastCriteriaType := lCriteria.CriteriaType;
          end;

    end;

end; {procedure, BuildSearchCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildSelectClause }

procedure TdaSQL.BuildSelectClause;
var
  liIndex: Integer;
  lField: TdaField;
  lsText: String;
begin

  if (FSelectFields.Count = 0) and (FCalcFields.Count = 0) then Exit;

  if FDistinct then
    begin
      FSQLText.Add('SELECT DISTINCT ');
      FIndent := 16;
    end
  else
    begin
      FSQLText.Add('SELECT ');
      FIndent := 7;
    end;

  {add select fields}
  for liIndex := 0 to SelectFieldCount - 1 do
    begin
      lField := SelectFields[liIndex];
  
      lsText := lField.SQLString;
  
      DoAddSelectClauseText(Self, lField, lsText);
  
      if (liIndex < SelectFieldCount - 1) or (CalcFieldCount > 0) then
        lsText := lsText + ', ';
  
      AddToSQL(lsText);
    end;
  
  {add calc fields}
  RemoveUserCalcFieldAliases;

  for liIndex := 0 to CalcFieldCount - 1 do
    begin
      lField := CalcFields[liIndex];
  
      lsText := lField.SQLString;
  
      DoAddSelectClauseText(Self, lField, lsText);
  
      if (liIndex < CalcFieldCount - 1) then
        lsText := lsText + ', ';
  
      AddToSQL(lsText);
    end;
  
end; {procedure, BuildSelectClause}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildSQL89JoinExpression }

procedure TdaSQL.BuildSQL89JoinExpression(aJoins: TList);
var
  lTable: TdaTable;
  liIndex: Integer;
  liIndex2: Integer;
  lTableJoin: TdaTableJoin;
  lsLocalField: String;
  lsForeignField: String;
  lsOperator: String;
  lsText: String;
begin
  
  for liIndex := 0 to aJoins.Count - 1 do
    begin
      lTable := TdaTable(aJoins[liIndex]);
  
      for liIndex2 := 0 to lTable.TableJoinCount - 1 do
        begin
          lTableJoin := lTable.TableJoins[liIndex2];
  
          lsLocalField := lTableJoin.LocalField.SQLString;
          lsForeignField := lTableJoin.ForeignField.SQLString;
          lsOperator := daJoinOperatorToString(lTableJoin.Operator);
  
          if IsOracle then
            begin
              case lTable.JoinType of
                dajtLeftOuter:  lsLocalField := lsLocalField + ' (+)';
                dajtRightOuter: lsForeignField := lsForeignField + ' (+)';
              end;
            end
  
          else if IsSybaseASE then
            begin
              case lTable.JoinType of
                dajtOuter:      lsOperator := '*' + lsOperator + '*';
                dajtLeftOuter:  lsOperator := '*' + lsOperator;
                dajtRightOuter: lsOperator := lsOperator + '*';
              end;
            end;
  
          lsText := '(' + lsLocalField + ' ' + lsOperator + ' ' + lsForeignField + ')';
  
          DoAddWhereClauseText(Self, lTableJoin, lsText);
  
          if (liIndex2 > 0) then
            lsText := ' AND ' + lsText;
  
          AddToSQL(lsText);
  
        end; {for, each field expression}
  
  
      if (liIndex < aJoins.Count - 1) then
        AddToSQL(' AND ');

    end; {for, each joined table}
  
end; {procedure, BuildSQL89JoinExpression}


{------------------------------------------------------------------------------}
{ TdaSQL.BuildSQL92JoinExpression }

procedure TdaSQL.BuildSQL92JoinExpression(aJoins: TList);
var
  lTable: TdaTable;
  liIndex: Integer;
  liIndex2: Integer;
  lTableJoin: TdaTableJoin;
  lsLocalField: String;
  lsForeignField: String;
  lsOperator: String;
  lsText: String;
begin
  
  if IsMSAccess then
    AddToSQL(daReplicate(aJoins.Count, '('));
  
  lTable := SelectTables[0];
  
  AddToSQL(lTable.SQLText);
  
  for liIndex := 0 to aJoins.Count - 1 do
    begin
      {add first table to from clause}
      lTable := TdaTable(aJoins[liIndex]);
      lsText := ' ' + lTable.SQLJoinTypeDesc + ' ' + lTable.SQLText + ' ON ';
      AddToSQL(lsText);
  
      {add join conditions to remainder of from clause}
      for liIndex2 := 0 to lTable.TableJoinCount - 1 do
        begin
          lTableJoin := lTable.TableJoins[liIndex2];
  
          lsLocalField := lTableJoin.LocalField.SQLString;
          lsForeignField := lTableJoin.ForeignField.SQLString;
          lsOperator := daJoinOperatorToString(lTableJoin.Operator);
  
          lsText := '(' + lsLocalField + ' ' + lsOperator + ' ' + lsForeignField + ')';

          {add closing paren on last field expression}
          if IsMSAccess and (liIndex2 = lTable.TableJoinCount - 1) then
            lsText := lsText + ' )';
  
          DoAddFromClauseText(Self, lTableJoin, lsText);
  
          if (liIndex2 > 0) then
            lsText := ' AND ' + lsText;
  
          AddToSQL(lsText);
        end; {for, each field expression}

    end; {for, each join}

end; {procedure, BuildSQL92JoinExpression}




{------------------------------------------------------------------------------}
{ TdaSQL.BuildWhereClause }

procedure TdaSQL.BuildWhereClause;
var
  lbJoinClause: Boolean;
  lJoins: TList;
  lTable: TdaTable;
  liIndex: Integer;
  lbCloseParenNeeded: Boolean;
begin

  if (FStealthMode) then
    begin
      FSQLText.Add('WHERE (''c'' <> ''c'' )');
      FWhereAdded := True;
    end
  else
    FWhereAdded := False;

  lbJoinClause := UsesSQL89Joins;

  if (CriteriaCount = 0) and not(lbJoinClause) then Exit;

  FIndent := 6;
  lbCloseParenNeeded := False;

  if lbJoinClause then
    begin
      lJoins := TList.Create;

      for liIndex := 1 to SelectTableCount - 1 do
        begin
          lTable := SelectTables[liIndex];

          if not(IsAdvantage) or (IsAdvantage and (lTable.JoinType = dajtInner)) then
            lJoins.Add(lTable);

        end;

      if (lJoins.Count > 0) then
        begin
          if not(FWhereAdded) then
            begin
              FSQLText.Add('WHERE ');
              FWhereAdded := True;
            end
          else
            begin
              FSQLText.Add('AND (');
              lbCloseParenNeeded := True;
            end;

          if (lbJoinClause) then
            BuildSQL89JoinExpression(lJoins);
        end;

      if (lbCloseParenNeeded) then
        AddToSQL(')');

      lJoins.Free;
    end;

end; {procedure, BuildWhereClause}


{------------------------------------------------------------------------------}
{ TdaSQL.UsesSQL89Joins}

function TdaSQL.UsesSQL89Joins: Boolean;
begin
  Result := (SelectTableCount > 1) and ((FSQLType = sqSQL1) or IsAdvantage);
end; {function, UsesSQL89Joins}

{------------------------------------------------------------------------------}
{ TdaSQL.CalcTypeChangeEvent }

procedure TdaSQL.CalcTypeChangeEvent(Sender: TObject);
begin
  
  if HasAggregates then
    SyncGroupByFieldsWithSelectFields
  else
    ClearGroupByFields;
  
end; {procedure, CalcTypeChangeEvent}


{------------------------------------------------------------------------------}
{ TdaSQL.Clear }

procedure TdaSQL.Clear;
begin
  
  FSQLText.Clear;
  
  {these clear calls are in optimized order}
  ClearSelectTables;
  ClearSelectFields;
  ClearGroupByFields;
  ClearOrderByFields;
  ClearCalcFields;
  ClearCriteria;
  ClearSQLLinks;

  {the other available lists need not be freed, since they contain references
   to the fields in the available fields list}
  FSavedAvailableFields.Clear;
  FAvailableSelectFields.Clear;
  FAvailableOrderByFields.Clear;
  FAvailableGroupByFields.Clear;
  FAvailableCriteriaFields.Clear;
  FAvailableMasterLinkFields.Clear;
  FAvailableDetailLinkFields.Clear;
  
end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaSQL.FreeLink }

procedure TdaSQL.FreeLink(aLink: TdaSQLLink);
begin

  FDetailLinkFieldsOutOfSync := True;

  TdaLinkBroker(FLinkBroker).FreeLink(aLink);
  
end; {procedure, FreeLink}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearSQLLinks }

procedure TdaSQL.ClearSQLLinks;
begin

  if (FAssigning) then
    TdaLinkBroker(FLinkBroker).UpdateColors := False;

  TdaLinkBroker(FLinkBroker).FreeLinks;

  if (FAssigning) then
    TdaLinkBroker(FLinkBroker).UpdateColors := True;

  FMasterLinkFieldsOutOfSync := True;
  FDetailLinkFieldsOutOfSync := True;

end; {procedure, ClearSQLLinks}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearCalcFields }

procedure TdaSQL.ClearCalcFields;
begin
  daFreeChildren(FCalcFields);
end; {procedure, ClearCalcFields}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearCriteria }

procedure TdaSQL.ClearCriteria;
begin
  daFreeChildren(FCriteria);
end; {procedure, ClearCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.ClearGroupByFields }

procedure TdaSQL.ClearGroupByFields;
begin
  daFreeChildren(FGroupByFields);
  
  FGroupByFieldsSynced := False;
  FGroupByFieldsOutOfSync := True;
end; {procedure, ClearGroupByFields}



{------------------------------------------------------------------------------}
{ TdaSQL.ClearOrderByFields }

procedure TdaSQL.ClearOrderByFields;
begin
  daFreeChildren(FOrderByFields);
  
  FOrderByFieldsOutOfSync := True;
end; {procedure, ClearOrderByFields}


{------------------------------------------------------------------------------}
{ TdaSQL.ClearSelectFields }

procedure TdaSQL.ClearSelectFields;
begin
  daFreeChildren(FSelectFields);
  
  FSelectFieldsOutOfSync := True;
end; {procedure, ClearSelectFields}


{------------------------------------------------------------------------------}
{ TdaSQL.ClearSelectTables }

procedure TdaSQL.ClearSelectTables;
begin
  
  daFreeChildren(FAvailableTables);
  daFreeChildren(FAvailableFields);
  
  daFreeChildren(FSelectTables);
  
  FTablesOutOfSync := True;
  FSelectTablesOutOfSync := True;
  
  AvailableFieldsOutOfSync;
  
end; {procedure, ClearSelectTables}


{------------------------------------------------------------------------------}
{ TdaSQL.ContainsFieldName }

function TdaSQL.ContainsFieldName(aString: String): Boolean;
var
  liIndex: Integer;
  lFields: TStringList;
  lsField: String;
  lField: TdaField;
begin
  
  Result := False;
  
  
  {get list of fields which can be used}
  lFields := TStringList.Create;

  for liIndex := 0 to FSelectFields.Count - 1 do
    begin
      lField := SelectFields[liIndex];

      lFields.Add(lField.TableSQLAlias + '.' + lField.FieldName);
    end;

  for liIndex := 0 to AvailableFieldCount - 1 do
    begin
      lField := AvailableFields[liIndex];

      lFields.Add(lField.TableSQLAlias + '.' + lField.FieldName);
    end;
  
  
  {search for field in string}
  liIndex := 0;
  aString := Uppercase(aString);
  
  while not(Result) and (liIndex < lFields.Count - 1) do
    begin
      lsField := Uppercase(lFields[liIndex]);
  
      if (Pos(lsField, aString) <> 0) then
        Result := True
      else
        Inc(liIndex);
    end;

  lFields.Free;
  
end; {function, ContainsFieldName}


{------------------------------------------------------------------------------}
{ TdaSQL.ContainsSQLFunctionCall }

function TdaSQL.ContainsSQLFunctionCall(const aString: String): Boolean;
begin
  
  Result := False;
  
  if (FSession <> nil) then
    Result := FSession.ContainsSQLFunctionCall(aString, FDatabaseType);
  
end; {function, ContainsSQLFunctionCall}


{------------------------------------------------------------------------------}
{ TdaSQL.Convert }

procedure TdaSQL.Convert(aVersionNo: Integer);
var
  lDatabaseType: TppDatabaseType;
  liIndex: Integer;
  liIndex2: Integer;
  liTableIndex: Integer;
  lTable: TdaTable;
  lTableJoin: TdaTableJoin;
  lOldAliases: TStrings;
begin

  if (aVersionNo < 5200) and not(EditSQLasText) then
    begin
      SetMaxSQLFieldAliasLengthFromTables;

      TdaLinkBroker(FLinkBroker).Convert(aVersionNo);

      for liIndex := 0 to CriteriaCount - 1 do
        Criteria[liIndex].Field.ShowAllValues := Criteria[liIndex].FOldShowAllValues;

      lOldAliases := TStringList.Create;

      try
        { Store old Table SQL Aliases }
        for liIndex := 0 to SelectTableCount - 1 do
          lOldAliases.Add(SelectTables[liIndex].SQLAlias);

        { Update SQL Aliases }
        for liIndex := 0 to SelectTableCount - 1 do
          SelectTables[liIndex].SQLAlias := CreateTableSQLAlias(SelectTables[liIndex]);

        { Now update fields in Table joins with new aliases }
        for liIndex := 0 to SelectTableCount - 1 do
          begin
            lTable := SelectTables[liIndex];

            for liIndex2 := 0 to lTable.TableJoinCount - 1 do
              begin
                lTableJoin := lTable.TableJoins[liIndex2];

                lTableJoin.LocalField.TableSQLAlias := lTable.SQLAlias;

                liTableIndex := lOldAliases.IndexOf(lTableJoin.ForeignField.TableSQLAlias);

                if (liTableIndex > -1) then
                  lTableJoin.ForeignField.TableSQLAlias := SelectTables[liTableIndex].SQLAlias;
              end;
          end;

      finally
        lOldAliases.Free;
      end;

        
      ConvertRawTableNamesToTableNames;
    end;

  if (aVersionNo < 5000) then
    begin
      if (FSession = nil) or (FDatabaseType <> dtOther) then Exit;

      lDatabaseType := FSession.GetDatabaseType(FDatabaseName);

      if (lDatabaseType <> FDatabaseType) then
        begin
          FDatabaseType := lDatabaseType;

          FModified := True;
        end;
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TdaSQL.ConvertRawTableNamesToTableNames }

procedure TdaSQL.ConvertRawTableNamesToTableNames;
var
  liIndex: Integer;
  liIndex2: Integer;
  lField: TdaField;
begin

  for liIndex := 0 to SelectFieldCount - 1 do
    begin
      lField := SelectFields[liIndex];

      liIndex2 := IndexOfSelectTableName(lField.TableName);

      if (liIndex2 <> -1) then
        begin
          lField.TableName := SelectTables[liIndex2].TableName;
          lField.TableSQLAlias := SelectTables[liIndex2].SQLAlias;
        end;
    end;

  for liIndex := 0 to GroupByFieldCount - 1 do
    begin
      lField := GroupByFields[liIndex];

      liIndex2 := IndexOfSelectTableName(lField.TableName);

      if (liIndex2 <> -1) then
        begin
          lField.TableName := SelectTables[liIndex2].TableName;
          lField.TableSQLAlias := SelectTables[liIndex2].SQLAlias;
        end;
    end;

  for liIndex := 0 to OrderByFieldCount - 1 do
    begin
      lField := OrderByFields[liIndex];

      liIndex2 := IndexOfSelectTableName(lField.TableName);

      if (liIndex2 <> -1) then
        begin
          lField.TableName := SelectTables[liIndex2].TableName;
          lField.TableSQLAlias := SelectTables[liIndex2].SQLAlias;
        end;
    end;

  for liIndex := 0 to CriteriaCount - 1 do
    begin
      lField := Criteria[liIndex].Field;

      if (lField <> nil) then
        begin
          liIndex2 := IndexOfSelectTableName(lField.TableName);

          if (liIndex2 <> -1) then
            begin
              lField.TableName := SelectTables[liIndex2].TableName;
              lField.TableSQLAlias := SelectTables[liIndex2].SQLAlias;
            end;
        end;
    end;

end; {procedure, ConvertRawTableNamesToTableNames}

{------------------------------------------------------------------------------}
{ TdaSQL.CopyLinkableList }

procedure TdaSQL.CopyLinkableList(aSourceList, aTargetList: TList; aFilterUsedFields: Boolean);
var
  liIndex: Integer;
  ldaField: TdaField;
  lbAddField: Boolean;
begin

  if (aSourceList <> nil) and (aTargetList <> nil) then
    begin
      lbAddField := True;

      for liIndex := 0 to aSourceList.Count - 1 do
        begin
          ldaField := TdaField(aSourceList[liIndex]);

          if ldaField.Linkable then
            begin
              if aFilterUsedFields then
                lbAddField := not (TdaLinkBroker(FLinkBroker).IsLinkingField(ldaField));

              if lbAddField then
                aTargetList.Add(aSourceList[liIndex]);
            end;
        end;
    end;
  
end; {procedure, CopyLinkableList}


{------------------------------------------------------------------------------}
{ TdaSQL.Create }

constructor TdaSQL.Create(aOwner: TComponent);
begin
  
  inherited Create(aOwner);

  FAddSelectClauseText := nil;
  FAddFromClauseText := nil;
  FAddWhereClauseText := nil;
  FAddGroupByClauseText := nil;
  FAddOrderByClauseText := nil;
  FAllowSelfJoin := False;
  FAssigning := False;
  FAvailableCriteriaFields := TList.Create;
  FAvailableDetailLinkFields := TList.Create;
  FAvailableMasterLinkFields := TList.Create;
  FAvailableTables := TList.Create;
  FAvailableSelectTables := TList.Create;
  FAvailableSelectFields := TList.Create;
  FAvailableOrderByFields := TList.Create;
  FAvailableGroupByFields := TList.Create;
  FAvailableFields := TList.Create;
  FCalcFields := TList.Create;
  FCalcFieldsOutOfSync := True;
  FCalcSearchCriteriaAdded := False;
  FCriteria := TList.Create;
  FCriteriaOutOfSync := True;
  FLinkBroker := TdaLinkBroker.Create(Self);
  FDataBaseName := '';
  FDataDictionary := nil;
  FDataPipelineName := '';
  FDatabaseType := dtOther;
  FDataSetClass := nil;
  FDetailLinkFieldsOutOfSync := True;
  FDistinct := False;
  FEditSQLAsText := False;
  FFieldsOutOfSync := True;
  FFieldSortMode := 1;
  FGroupByFields := TList.Create;
  FGroupByFieldsOutOfSync := True;
  FGroupByFieldsSynced := False;
  FIsCaseSensitive := False;
  FLineLength := 50;
  FLinkColor := 0;
  FLinkingSQL := False;
  FMagicSQL := nil;
  FMagicSQLText := nil;
  FMasterLinkFieldsOutOfSync := True;
  FMaxSQLFieldAliasLength := 0;
  FModified := False;
  FOrderByFields := TList.Create;
  FOrderByFieldsOutOfSync := True;
  FSkipWhenNoRecords := True;
  FSQLOutOfSync := True;
  FSQLText := TStringList.Create;
  FSQLType := sqBDELocal;
  FSavedAvailableFields := TList.Create;
  FSelectFields := TList.Create;
  FSelectFieldsOutOfSync := True;
  FSelectTables := TList.Create;
  FSelectTablesOutOfSync := True;
  FSession := nil;
  FStealthMode := False;
  FSyncingGroups := False;
  FTablesOutOfSync := True;
  FWhereAdded := False;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaSQL.DefineProperties }

procedure TdaSQL.DefineProperties(Filer: TFiler);
begin

  inherited DefineProperties(Filer);

  {conversion to 5.1}
  Filer.DefineProperty('Description', ReadDescription, nil, False);

end; {constructor, DefineProperties}

{------------------------------------------------------------------------------}
{ TdaSQL.ReadDescription }

procedure TdaSQL.ReadDescription(Reader: TReader);
begin
  FDescription := Reader.ReadString;
end; {procedure, ReadDescription}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAlias }

function TdaSQL.CreateAlias(const aRawTableName: String): String;
var
  lTable: TdaTable;
  liIndex: Integer;
begin
  
  Result := '';
  
  liIndex := IndexOfRawTableName(aRawTableName);
  
  if (liIndex = -1) then Exit;
  
  lTable := AvailableTables[liIndex];

  {get table alias}
  gMetaData.DatabaseName := FDatabaseName;
  gMetaData.DataDictionary := FDataDictionary;
  gMetaData.Session := FSession;

  Result := gMetaData.GetTableAlias(lTable.RawTableName);

end; {function, CreateAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAvailableFieldList }

procedure TdaSQL.CreateAvailableFieldList;
var
  lFields: TList;
  liIndex: Integer;
begin

  daFreeChildren(FAvailableFields);

  FSavedAvailableFields.Clear;

  lFields := TList.Create;

  for liIndex := 0 to SelectTableCount - 1 do
    begin
      CreateFieldsForTable(SelectTables[liIndex], lFields);

      daCopyList(lFields, FAvailableFields, daftAll);
      daCopyList(lFields, FSavedAvailableFields, daftAll);

      lFields.Clear;
    end;

  lFields.Free;

end; {procedure, CreateAvailableFieldList}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldAliasesForTable }

procedure TdaSQL.CreateFieldAliasesForTable(aTable: TdaTable; aFields: TStrings);
var
  lFields: TList;
  liIndex: Integer;
  lField: TdaField;
begin

  aFields.Clear;

  lFields := TList.Create;

  CreateFieldsForTable(aTable, lFields);

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lField := TdaField(lFields[liIndex]);

      aFields.AddObject(lField.FieldAlias, lField);
    end;

  lFields.Free;

end; {procedure, CreateFieldAliasesForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldNamesForTable }

procedure TdaSQL.CreateFieldNamesForTable(aTable: TdaTable; aFields: TStrings);
var
  lFields: TList;
  liIndex: Integer;
  lField: TdaField;
begin

  aFields.Clear;

  lFields := TList.Create;

  CreateFieldsForTable(aTable, lFields);

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lField := TdaField(lFields[liIndex]);

      aFields.AddObject(lField.FieldName, lField);
    end;

  lFields.Free;

end; {procedure, CreateFieldNamesForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldsForTable }

procedure TdaSQL.CreateFieldsForTable(aTable: TdaTable; aFields: TList);
var
  lFields: TList;
  liIndex: Integer;
  lMetaField: TdaMetaField;
  lField: TdaField;
begin

  aFields.Clear;

  lFields := TList.Create;

  gMetaData.DatabaseName := FDatabaseName;
  gMetaData.DataDictionary := FDataDictionary;
  gMetaData.Session := FSession;

  gMetaData.GetFields(aTable.TableName, aTable.DataName, lFields);

  for liIndex := 0 to lFields.Count - 1 do
    begin
      lMetaField := TdaMetaField(lFields[liIndex]);

      lField := CreateFieldFromMetaField(lMetaField);

      lField.TableName := aTable.TableName;
      lField.TableAlias := aTable.TableAlias;
      lField.TableSQLAlias := aTable.SQLAlias;

      aFields.Add(lField);
    end;
  
  lFields.Free;
  
end; {procedure, CreateFieldsForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldForTable }

function TdaSQL.CreateFieldForTable(aTable: TdaTable; const aFieldName: String): TdaField;
var
  lFields: TList;
  liIndex: Integer;
  lMetaField: TdaMetaField;
begin

  lFields := TList.Create;

  gMetaData.DatabaseName := FDatabaseName;
  gMetaData.DataDictionary := FDataDictionary;
  gMetaData.Session := FSession;

  gMetaData.GetFields(aTable.TableName, aTable.DataName, lFields);

  liIndex := 0;
  Result := nil;

  while (Result = nil) and (liIndex < lFields.Count) do
    begin
      lMetaField := TdaMetaField(lFields[liIndex]);

      if (CompareText(lMetaField.Name, aFieldName) = 0) then
        begin
          Result := CreateFieldFromMetaField(lMetaField);

          Result.TableName := aTable.TableName;
          Result.TableAlias := aTable.TableAlias;
          Result.TableSQLAlias := aTable.SQLAlias;
        end

      else
        Inc(liIndex);

    end;

  lFields.Free;

end; {function, CreateFieldForTable}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldFromMetaField }

function TdaSQL.CreateFieldFromMetaField(aMetaField: TdaMetaField): TdaField;
begin

  Result := TdaField.Create(Self);

  Result.AutoSearch := aMetaField.AutoSearch;
  Result.DataType := aMetaField.DataType;
  Result.DisplayFormat := aMetaField.DisplayFormat;
  Result.DisplayWidth := aMetaField.DisplayWidth;
  Result.FieldLength := aMetaField.Length;
  Result.FieldAlias := aMetaField.Alias;
  Result.FieldName := aMetaField.Name;
  Result.Mandatory := aMetaField.Mandatory;
  Result.Selectable := aMetaField.Selectable;
  Result.Searchable := aMetaField.Searchable;
  Result.Sortable := aMetaField.Sortable;

  {redundant or defaulted values}
  Result.Alias := aMetaField.Alias;
  Result.SQLFieldName := aMetaField.Name;

end; {function, CreateFieldFromMetaField}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateFieldsFromSQL }

procedure TdaSQL.CreateFieldsFromSQL;
var
  lFields: TList;
  lSQL: TStrings;
  liIndex: Integer;
  lField: TdaField;
  lDataSetField: TppField;
begin
  
  lSQL := TStringList.Create;
  
  lSQL.Assign(FSQLText);

  Clear;
  
  FSQLText.Assign(lSQL);
  
  lSQL.Free;
  
  lFields := TList.Create;
  
  if (GetFieldsForSQL(FSQLText, lFields)) then
    begin

      for liIndex := 0 to lFields.Count - 1 do
        begin
          lDataSetField := TppField(lFields[liIndex]);
  
          lField := TdaField.Create(Self);

          lField.Alias := lDataSetField.FieldName;
          lField.DataType := lDataSetField.DataType;
          lField.DisplayWidth := lDataSetField.DisplayWidth;
          lField.FieldAlias := lDataSetField.FieldName;
          lField.FieldLength := lDataSetField.FieldLength;
          lField.FieldName := lDataSetField.FieldName;
          lField.SQLFieldName := lDataSetField.FieldName;

          lField.Parent := Self;
  
          {free the dataset field here, we no longer need it}
          lDataSetField.Free;

        end; {for, each field}

    end; {if, fields retrieved}
  
  lFields.Free;
  
end; {procedure, CreateFieldsFromSQL}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateJoin }

function TdaSQL.CreateJoin(aTable1, aTable2: TdaTable): Boolean;
var
  lbShowDialog: Boolean;
begin

  if (FDataDictionary <> nil) and (FDataDictionary.AutoJoin) then
    begin
      lbShowDialog := False;
  
      MatchJoinFieldsViaDictionary(aTable1, aTable2);
  
      if (aTable2.TableJoinCount = 0) and (FDataDictionary.AllowManualJoins) then
        begin
          MatchJoinFieldsByName(aTable1, aTable2);
  
          lbShowDialog := True;
        end;
    end
  else
    begin
      MatchJoinFieldsByName(aTable1, aTable2);
  
      lbShowDialog := True;
    end;
  
  if lbShowDialog then
    Result := EditTableJoin(aTable1.SQLAlias, aTable2.SQLAlias)
  else
    Result := True;
  
end; {procedure, CreateJoin}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateJoinObjects }

procedure TdaSQL.CreateJoinObjects(const aTableName1, aTableName2, aJoinType, aFieldNames1, aOperators, aFieldNames2: String);
var
  lFieldNames1: TStrings;
  lFieldNames2: TStrings;
  lOperators: TStrings;
  lTable1: TdaTable;
  lTable2: TdaTable;
  lsFieldName1: String;
  lsFieldName2: String;
  lOperator: TdaJoinOperatorType;
  liIndex: Integer;
begin
  
  Clear;
  
  if (aTableName1 = '') or (aTableName2 = '') then Exit;
  
  lTable1 := AddTable(aTableName1);
  lTable2 := AddTable(aTableName2);
  
  lTable2.JoinType := daStringToJoinType(aJoinType);
  
  lFieldNames1 := TStringList.Create;
  ppParseString(aFieldNames1, lFieldNames1);
  
  lFieldNames2 := TStringList.Create;
  ppParseString(aFieldNames2, lFieldNames2);
  
  lOperators := TStringList.Create;
  ppParseString(aOperators, lOperators);
  
  for liIndex := 0 to lFieldNames1.Count - 1 do
    begin
      lsFieldName1 := lFieldNames1[liIndex];
      lsFieldName2 := lFieldNames2[liIndex];
      lOperator := daStringToJoinOperator(lOperators[liIndex]);

      lTable2.AddTableJoin(lTable1, lsFieldName1, lsFieldName2, lOperator);
    end;
  
  lFieldNames1.Free;
  lFieldNames2.Free;
  lOperators.Free;
  
end; {procedure, CreateJoinObjects}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateSQL }

procedure TdaSQL.CreateSQL;
begin

  UpdateCalcSearchCriteriaDataTypes;

  FSQLText.Clear;

  SendEventNotify(Self, ciBeforeGenerateSQL, nil);

  BuildSelectClause;

  BuildFromClause;

  BuildWhereClause;

  BuildSearchCriteria;

  BuildGroupByClause;

  BuildOrderByClause;

  SendEventNotify(Self, ciAfterGenerateSQL, nil);

end; {procedure, CreateSQL}

{------------------------------------------------------------------------------}
{ TdaSQL.GetMagicSQLText }

function TdaSQL.GetMagicSQLText: TStrings;
begin

  if FEditSQLAsText then
    Result := FSQLText
  else
    Result := CreateMagicSQLText;

end; {procedure, GetMagicSQLText}


{------------------------------------------------------------------------------}
{ TdaSQL.GetMagicSQLObject }

function TdaSQL.GetMagicSQLObject: TdaSQL;
begin

  Result := FMagicSQL;

end; {procedure, GetMagicSQLObject}


{------------------------------------------------------------------------------}
{ TdaSQL.InitMagicSQL }

procedure TdaSQL.InitMagicSQL;
begin

  if FMagicSQL = nil then
    FMagicSQL := TdaMagicSQL.Create(Self);

end; {procedure, InitMagicSQL}


{------------------------------------------------------------------------------}
{ TdaSQL.CreateMagicSQLText }

function TdaSQL.CreateMagicSQLText: TStrings;
begin

  InitMagicSQL;

  SendEventNotify(Self, ciBeforeGenerateSQL, nil);

  TdaMagicSQL(FMagicSQL).GenerateMagicSQL(Self);

  Result := TdaMagicSQL(FMagicSQL).MagicSQLText;

  SendEventNotify(Self, ciAfterGenerateSQL, nil);
  
end; {function, CreateMagicSQLText}

{------------------------------------------------------------------------------}
{ TdaSQL.GetMagicFieldCount }

function TdaSQL.GetMagicFieldCount: Integer;
begin

  if (FMagicSQL <> nil) then
    Result := TdaMagicSQL(FMagicSQL).MagicFieldCount
  else
    Result := 0;

end; {function, GetMagicFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.CreateTableAlias }

function TdaSQL.CreateTableAlias(aTable: TdaTable): String;
var
  liIndex: Integer;
  liInstance: Integer;
  lTableAliases: TStrings;
  lsTableAlias: String;
begin
  
  {get table alias}
  gMetaData.DatabaseName := FDatabaseName;
  gMetaData.DataDictionary := FDataDictionary;
  gMetaData.Session := FSession;

  Result := gMetaData.GetTableAlias(aTable.RawTableName);

  {check to see if alias is duplicate of another table in the selection}
  lTableAliases := TStringList.Create;
  
  for liIndex := 0 to SelectTableCount - 1 do
    lTableAliases.Add(Uppercase(SelectTables[liIndex].TableAlias));
  
  if (lTableAliases.IndexOf(Uppercase(lsTableAlias)) = -1) then
    begin
      lTableAliases.Free;
  
      Exit;
    end;
  
  liInstance := 2;
  
  Result := lsTableAlias + ' (' + IntToStr(liInstance) + ')';
  
  while (lTableAliases.IndexOf(Result) <> -1) do
    begin
      Result := lsTableAlias + ' (' + IntToStr(liInstance) + ')';
  
      Inc(liInstance);
    end;
  
  lTableAliases.Free;
  
end; {function, CreateTableAlias}


{------------------------------------------------------------------------------}
{ TdaSQL.CreateTableSQLAlias }

function TdaSQL.CreateTableSQLAlias(aTable: TdaTable): String;
var
  liInstance: Integer;
  lSQLAliases: TStrings;
  liIndex: Integer;
  lsTableName: String;
  liPosition: Integer;
  lsOwner: String;
  lbFileBased: Boolean;
  lTable: TdaTable;
begin

  {get table name}
  ppStripOffTableName(aTable.TableName, lsTableName, lsOwner, lbFileBased);
  
  {replace spaces in table name with underlines}
  liPosition := daInvalidChar(lsTableName);
  
  if (liPosition = 1) then
    begin
      lsTableName[1] := 'T';
  
      liPosition := daInvalidChar(lsTableName);
    end;
  
  while (liPosition <> 0) do
    begin
      lsTableName[liPosition] := '_';
  
      liPosition := daInvalidChar(lsTableName);
    end;
  
  {if table name is reserved word, add _TABLE}
  while IsSQLReservedWord(lsTableName) do
    lsTableName := lsTableName + '_TABLE';
  
  Result := lsTableName;
  
  {make sure alias is unique}
  lSQLAliases := TStringList.Create;
  
  for liIndex := 0 to SelectTableCount - 1 do
    begin
      lTable := SelectTables[liIndex];

      if not(lTable = aTable) then
        lSQLAliases.Add(lTable.SQLAlias);
    end;

  liInstance := 2;

  while (lSQLAliases.IndexOf(Result) <> -1) do
    begin
      Result := lsTableName + '_' + IntToStr(liInstance);
  
      Inc(liInstance);
    end;
  
  lSQLAliases.Free;
  
end; {function, CreateTableSQLAlias}


{------------------------------------------------------------------------------}
{ TdaSQL.daFieldToppField }

procedure TdaSQL.daFieldToppField(aSourceField: TdaField; aTargetField: TppField);
begin
  
  if (aSourceField = nil) or (aTargetField = nil) then Exit;
  
  aTargetField.DataType      := aSourceField.DataType;
  aTargetField.DisplayFormat := aSourceField.DisplayFormat;
  aTargetField.FieldName     := aSourceField.FieldName;
  aTargetField.TableName     := aSourceField.TableName;
  
  aTargetField.FieldAlias    := aSourceField.FieldAlias;
  
  aTargetField.Selectable    := aSourceField.Selectable;
  aTargetField.Searchable    := aSourceField.Searchable;
  aTargetField.Sortable      := aSourceField.Sortable;

  aTargetField.AutoSearch    := aSourceField.AutoSearch;
  aTargetField.Mandatory     := aSourceField.Mandatory;
  aTargetField.ShowAllValues := aSourceField.ShowAllValues;

end; {procedure, daFieldToppField}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectCalcField }

function TdaSQL.DeselectCalcField(aSelectedIndex: Integer): TdaField;
var
  liPosition: Integer;
  lField: TdaField;
begin
  
  lField := CalcFields[aSelectedIndex];

  liPosition := daFindField(lField, FAvailableFields);
  
  lField.Free;
  
  if (liPosition <> -1) then
    lField := TdaField(FAvailableFields[liPosition])
  else
    lField := nil;
  
  Result := lField;
  
  FOrderByFieldsOutOfSync := True;
  
  SyncOrderByFieldsWithCalcFields;
  
  if (FCalcFields.Count = 0) and FGroupByFieldsSynced then
    ClearGroupByFields;
  
end; {function, DeselectCalcField}


{------------------------------------------------------------------------------}
{ TdaSQL.DeselectCriteria }

function TdaSQL.DeselectCriteria(aSelectedIndex: Integer): Boolean;
begin

  if not(Criteria[aSelectedIndex].CriteriaType in [dacrBegin, dacrEnd]) then
    begin
      Criteria[aSelectedIndex].Free;
  
      Result := True;
    end
  else
    Result := False;


end; {function, DeselectCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.DeselectDetailLinkField }

function TdaSQL.DeselectDetailLinkField(aDetailField: TdaField): TdaField;
begin
  Result := daRestoreAvailableField(aDetailField, FAvailableFields, FAvailableDetailLinkFields);
end; {function, DeselectDetailLinkField}

{------------------------------------------------------------------------------}
{ TdaSQL.DeselectField }

function TdaSQL.DeselectField(aSelectedIndex: Integer): TdaField;
var
  lField: TdaField;
begin
  
  lField := SelectFields[aSelectedIndex];
  
  Result := daRestoreAvailableField(lField, FAvailableFields, FAvailableSelectFields);
  
  lField.Free;
  
  if (HasAggregates) then
    SyncGroupByFieldsWithSelectFields
  else
    ClearGroupByFields;
  
  FGroupByFieldsOutOfSync := True;
  
end; {function, DeselectField}


{------------------------------------------------------------------------------}
{ TdaSQL.DeselectGroupByField }

function TdaSQL.DeselectGroupByField(aSelectedIndex: Integer): TdaField;
var
  lField: TdaField;
begin
  
  Result := nil;
  
  lField := GroupByFields[aSelectedIndex];
  
  if (daFindField(lField, FSelectFields) <> -1) and (HasAggregates) then Exit;

  Result := daRestoreAvailableField(lField, FAvailableFields, FAvailableGroupByFields);
  
  lField.Free;
  
end; {function, DeselectGroupByField}


{------------------------------------------------------------------------------}
{ TdaSQL.DeselectOrderByField }

function TdaSQL.DeselectOrderByField(aSelectedIndex: Integer): TdaField;
var
  lField: TdaField;
begin
  
  lField := OrderByFields[aSelectedIndex];
  
  if (lField is TdaCalculation) then
    Result := daRestoreAvailableField(lField, FCalcFields, FAvailableOrderByFields)
  else
    Result := daRestoreAvailableField(lField, FAvailableFields, FAvailableOrderByFields);

  lField.Free;
  
end; {function, DeselectOrderByField}


{------------------------------------------------------------------------------}
{ TdaSQL.DeselectTable }

function TdaSQL.DeselectTable(aSelectedIndex: Integer): TdaTable;
var
  lTable: TdaTable;
  liPosition: Integer;
begin
  
  Result := nil;
  
  lTable := SelectTables[aSelectedIndex];
  
  if (aSelectedIndex = 0) and (FDataPipelineName = ppTextToIdentifier(lTable.Alias)) then
    FDataPipelineName := '';

  
  if not(AllowSelfJoin) then
    Result := daRestoreAvailableTable(lTable, FAvailableTables, FAvailableSelectTables)
  else
    begin
      liPosition := daFindTable(lTable, FAvailableTables);
  
      if (liPosition <> -1) then
        Result := TdaTable(FAvailableTables[liPosition])
    end;
  
  if FreeTable(lTable) then
    FSelectTablesOutOfSync := True;
  
  AvailableFieldsOutOfSync;
  
  UpdateJoinableTables;
  
end; {function, DeselectTable}


{------------------------------------------------------------------------------}
{ TdaSQL.Destroy }

destructor TdaSQL.Destroy;
begin
  
  Clear;
  
  FAvailableTables.Free;
  FAvailableFields.Free;
  FAvailableDetailLinkFields.Free;
  FAvailableMasterLinkFields.Free;
  FAvailableSelectFields.Free;
  FAvailableSelectTables.Free;
  FAvailableCriteriaFields.Free;
  FAvailableOrderByFields.Free;
  FAvailableGroupByFields.Free;
  FCalcFields.Free;
  FCriteria.Free;
  FLinkBroker.Free;
  FMagicSQLText.Free;
  FSavedAvailableFields.Free;
  FSelectFields.Free;
  FSelectTables.Free;
  FGroupByFields.Free;
  FOrderByFields.Free;
  FSQLText.Free;
  FMagicSQL.Free;

  inherited Destroy;
  
end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TdaSQL.DoAddFromClauseText }

procedure TdaSQL.DoAddFromClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
begin
  if Assigned(FAddFromClauseText) then FAddFromClauseText(Self, aChild, aText);
end; {procedure, DoAddFromClauseText}


{------------------------------------------------------------------------------}
{ TdaSQL.DoAddGroupByClauseText}

procedure TdaSQL.DoAddGroupByClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
begin
  if Assigned(FAddGroupByClauseText) then FAddGroupByClauseText(Self, aChild, aText);
end; {procedure, DoAddGroupByClauseText}


{------------------------------------------------------------------------------}
{ TdaSQL.DoAddOrderByClauseText}

procedure TdaSQL.DoAddOrderByClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
begin
  if Assigned(FAddOrderByClauseText) then FAddOrderByClauseText(Self, aChild, aText);
end; {procedure, DoAddOrderByClauseText}


{------------------------------------------------------------------------------}
{ TdaSQL.DoAddSelectClauseText}

procedure TdaSQL.DoAddSelectClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
begin
  if Assigned(FAddSelectClauseText) then FAddSelectClauseText(Self, aChild, aText);
end; {procedure, DoAddSelectClauseText}


{------------------------------------------------------------------------------}
{ TdaSQL.DoAddWhereClauseText}

procedure TdaSQL.DoAddWhereClauseText(Sender: TObject; aChild: TdaChild; var aText: String);
begin
  if Assigned(FAddWhereClauseText) then FAddWhereClauseText(Self, aChild, aText);
end; {procedure, DoAddWhereClauseText}


{------------------------------------------------------------------------------}
{ TdaSQL.EditTableJoin}

function TdaSQL.EditTableJoin(const aTable1, aTable2: String): Boolean;
var
  lTable1: TdaTable;
  lTable2: TdaTable;
  lDialog: TdaJoinTableDialog;
begin
  
  lTable1 := GetTableForSQLAlias(aTable1);
  lTable2 := GetTableForSQLAlias(aTable2);
  
  lDialog := TdaJoinTableDialog.Create(Self);
  
  lDialog.Table1 := lTable1;
  lDialog.Table2 := lTable2;
  lDialog.SQL := Self;
  
  lDialog.Initialize;
  
  if (lDialog.ShowModal = mrOK) then
    Result := True
  else
    Result := False;
  
  lDialog.Free;
  
end; {function, EditTableJoin}


{------------------------------------------------------------------------------}
{ TdaSQL.FieldNameToFieldAlias}

function TdaSQL.FieldNameToFieldAlias(const aFieldName: String): String;
var
  liIndex: Integer;
begin
  
  Result := '';
  
  if (aFieldName <> '') then
    begin
      for liIndex := 0 to SelectFieldCount - 1 do
        if SelectFields[liIndex].FieldName = aFieldName then
          begin
            Result := SelectFields[liIndex].FieldAlias;
            Break;
          end;
  
      if Result = '' then
        begin
          for liIndex := 0 to CalcFieldCount - 1 do
            if CalcFields[liIndex].FieldName = aFieldName then
              begin
                Result := CalcFields[liIndex].FieldAlias;
                Break;
              end;
        end;
    end;
  
end; {function, FieldNameToFieldAlias}


{------------------------------------------------------------------------------}
{ TdaSQL.FreeMatchingFields}

procedure TdaSQL.FreeMatchingFields(aTable: TdaTable; aList: TList; var aOutOfSync: Boolean);
var
  lObject: TObject;
  lField: TdaField;
  liIndex: Integer;
begin
  
  for liIndex := aList.Count - 1 downto 0 do
    begin
  
      lObject := aList[liIndex];
  
      if (lObject is TdaField) then
        lField := TdaField(lObject)

      else if (lObject is TdaCriteria) then
        lField := TdaCriteria(lObject).Field
  
      else
        lField :=  nil;
  
      if (lField <> nil) and (CompareText(lField.TableSQLAlias, aTable.SQLAlias) = 0) then
        begin
          lObject.Free;
  
          aOutOfSync := True;
        end;
  
    end;
  
end; {procedure, FreeMatchingFields}


{------------------------------------------------------------------------------}
{ TdaSQL.FreeRelatedFields}

procedure TdaSQL.FreeRelatedFields(aTable: TdaTable);
begin
  
  FreeMatchingFields(aTable, FCalcFields, FCalcFieldsOutOfSync);
  FreeMatchingFields(aTable, FCriteria, FCriteriaOutOfSync);
  FreeMatchingFields(aTable, FSelectFields, FSelectFieldsOutOfSync);
  FreeMatchingFields(aTable, FGroupByFields, FGroupByFieldsOutOfSync);
  FreeMatchingFields(aTable, FOrderByFields, FOrderByFieldsOutOfSync);
  
end; {procedure, FreeRelatedFields}


{------------------------------------------------------------------------------}
{ TdaSQL.FreeTable}

function TdaSQL.FreeTable(aTable: TdaTable): Boolean;
var
  lJoinTable: TdaTable;
  liIndex: Integer;
begin
  
  Result := False;
  
  {search for tables joined to this table}
  liIndex := 0;
  
  while (liIndex < FSelectTables.Count) do
    begin
      lJoinTable := SelectTables[liIndex];
  
      if (lJoinTable <> aTable) and (lJoinTable.JoinTableSQLAlias = aTable.SQLAlias) then
        begin
          Result := True;
  
          FreeTable(lJoinTable);
        end;
  
      Inc(liIndex);
    end;
  
  FreeRelatedFields(aTable);
  
  aTable.Free;
  
end; {function, FreeTable}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCalcField}

function TdaSQL.GetAvailableCalcField(aIndex: Integer): TdaField;
begin
  
  SyncCalcFields;
  
  Result := TdaField(FAvailableFields[aIndex]);
  
end; {function, GetAvailableCalcField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCalcFieldCount}

function TdaSQL.GetAvailableCalcFieldCount: Integer;
begin
  
  SyncCalcFields;
  
  Result := FAvailableFields.Count;
  
end; {function, GetAvailableCalcFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCriteria}

function TdaSQL.GetAvailableCriteria(aIndex: Integer): TdaField;
begin
  
  SyncCriteria;
  
  Result := TdaField(FAvailableCriteriaFields[aIndex]);
  
end; {function, GetAvailableCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableCriteriaCount }

function TdaSQL.GetAvailableCriteriaCount: Integer;
begin
  
  SyncCriteria;
  
  Result := FAvailableCriteriaFields.Count;
  
end; {function, GetAvailableCriteriaCount}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfAvailableDetailLinkField }

function TdaSQL.IndexOfAvailableDetailLinkField(aField: TdaField): Integer;
begin

  SyncDetailLinkFields;

  Result := daFindField(aField, FAvailableDetailLinkFields);

end; {function, IndexOfAvailableDetailLinkField}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfAvailableMasterLinkField }

function TdaSQL.IndexOfAvailableMasterLinkField(aField: TdaField): Integer;
begin

  SyncMasterLinkFields;

  Result := daFindField(aField, FAvailableMasterLinkFields);
  
end; {function, IndexOfAvailableMasterLinkField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableDetailLinkFieldCount }

function TdaSQL.GetAvailableDetailLinkFieldCount: Integer;
begin
  
  SyncDetailLinkFields;
  
  Result := FAvailableDetailLinkFields.Count;
  
end; {function, GetAvailableDetailLinkFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableDetailLinkField }

function TdaSQL.GetAvailableDetailLinkField(aIndex: Integer): TdaField;
begin
  
  SyncDetailLinkFields;
  
  Result := TdaField(FAvailableDetailLinkFields[aIndex]);
  
end; {function, GetAvailableDetailLinkField}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableMasterLinkFieldCount }

function TdaSQL.GetAvailableMasterLinkFieldCount: Integer;
begin

  SyncMasterLinkFields;

  Result := FAvailableMasterLinkFields.Count;

end; {function, GetAvailableMasterLinkFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableMasterLinkField }

function TdaSQL.GetAvailableMasterLinkField(aIndex: Integer): TdaField;
begin

  SyncMasterLinkFields;

  Result := TdaField(FAvailableMasterLinkFields[aIndex]);

end; {function, GetAvailableMasterLinkField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableFieldForLtdSQLString}

function TdaSQL.GetAvailableFieldForLtdSQLString(const aLimitedSQLString: String): TdaField;
var
  liIndex: Integer;
begin

  liIndex := 0;

  Result := nil;

  while (Result = nil) and (liIndex < FAvailableFields.Count) do
    begin
      if (UpperCase(aLimitedSQLString) = UpperCase(TdaField(FAvailableFields[liIndex]).LimitedSQLString)) then
        Result := TdaField(FAvailableFields[liIndex])
      else
        Inc(liIndex);
    end;

end; {function, GetAvailableFieldForLtdSQLString}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableField}

function TdaSQL.GetAvailableField(aIndex: Integer): TdaField;
begin

  SyncFields;

  Result := TdaField(FAvailableFields[aIndex]);

end; {function, GetAvailableField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableFieldCount}

function TdaSQL.GetAvailableFieldCount: Integer;
begin
  
  SyncFields;
  
  Result := FAvailableFields.Count
  
end; {function, GetAvailableFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableGroupByField}

function TdaSQL.GetAvailableGroupByField(aIndex: Integer): TdaField;
begin

  SyncGroupByFields;

  Result := TdaField(FAvailableGroupByFields[aIndex]);

end; {function, GetAvailableGroupByField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableGroupByFieldCount}

function TdaSQL.GetAvailableGroupByFieldCount: Integer;
begin
  
  SyncGroupByFields;
  
  Result := FAvailableGroupByFields.Count;

end; {function, GetAvailableGroupByFieldCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableOrderByField}

function TdaSQL.GetAvailableOrderByField(aIndex: Integer): TdaField;
begin
  
  SyncOrderByFields;

  Result := TdaField(FAvailableOrderByFields[aIndex]);

end; {function, GetAvailableOrderByField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableOrderByFieldCount}

function TdaSQL.GetAvailableOrderByFieldCount: Integer;
begin

  SyncOrderByFields;

  Result := FAvailableOrderByFields.Count;
  
end; {function, GetAvailableOrderByFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectField}

function TdaSQL.GetAvailableSelectField(aIndex: Integer): TdaField;
begin
  
  SyncSelectFields;
  
  Result := TdaField(FAvailableSelectFields[aIndex]);
  
end; {function, GetAvailableSelectField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectFieldCount}

function TdaSQL.GetAvailableSelectFieldCount: Integer;
begin
  
  SyncSelectFields;
  
  Result := FAvailableSelectFields.Count;
  
end; {function, GetAvailableSelectFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectTable}

function TdaSQL.GetAvailableSelectTable(aIndex: Integer): TdaTable;
begin
  
  SyncSelectTables;

  Result := TdaTable(FAvailableSelectTables[aIndex]);
  
end; {function, GetAvailableSelectTable}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableSelectTableCount}

function TdaSQL.GetAvailableSelectTableCount: Integer;
begin
  
  SyncSelectTables;

  Result := FAvailableSelectTables.Count;
  
end; {function, GetAvailableSelectTableCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableTable}

function TdaSQL.GetAvailableTable(aIndex: Integer): TdaTable;
begin
  
  SyncTables;
  
  Result := TdaTable(FAvailableTables[aIndex]);
  
end; {function, GetAvailableTable}


{------------------------------------------------------------------------------}
{ TdaSQL.GetAvailableTableCount}

function TdaSQL.GetAvailableTableCount: Integer;
begin
  
  SyncTables;
  
  Result := FAvailableTables.Count
  
end; {function, GetAvailableTableCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetCalcField}

function TdaSQL.GetCalcField(aIndex: Integer): TdaCalculation;
begin
  Result := TdaCalculation(FCalcFields[aIndex]);
end; {function, GetCalcField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetCalcFieldCount}

function TdaSQL.GetCalcFieldCount: Integer;
begin
  Result := FCalcFields.Count;
end; {function, GetCalcFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetCriteria}

function TdaSQL.GetCriteria(aIndex: Integer): TdaCriteria;
begin
  Result := TdaCriteria(FCriteria[aIndex]);
end; {function, GetCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.GetCriteriaCount}

function TdaSQL.GetCriteriaCount: Integer;
begin
  Result := FCriteria.Count;
end; {function, GetCriteriaCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetTableCalcFieldForFieldName }

function TdaSQL.GetTableCalcFieldForFieldName(aTable: TdaTable; const aFieldName: String): TdaField;
var
  liIndex: Integer;
  lsTableName: String;
begin

  Result := nil;

  liIndex := 0;

  lsTableName := aTable.TableName;

  while (Result = nil) and (liIndex < CalcFieldCount) do
    begin
      if ((CompareText(lsTableName, CalcFields[liIndex].TableName) = 0) and
          (CompareText(aFieldName, CalcFields[liIndex].FieldName) = 0)) then
        Result := CalcFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetTableCalcFieldForFieldName}

{------------------------------------------------------------------------------}
{ TdaSQL.GetTableSelectFieldForFieldName }

function TdaSQL.GetTableSelectFieldForFieldName(aTable: TdaTable; const aFieldName: String): TdaField;
var
  liIndex: Integer;
  lsTableName: String;
begin

  Result := nil;

  liIndex := 0;

  lsTableName := aTable.TableName;

  while (Result = nil) and (liIndex < SelectFieldCount) do
    begin
      if ((CompareText(lsTableName, SelectFields[liIndex].TableName) = 0) and
          (CompareText(aFieldName, SelectFields[liIndex].FieldName) = 0)) then
        Result := SelectFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetTableSelectFieldForFieldName}


{------------------------------------------------------------------------------}
{ TdaSQL.GetCalcFieldForSQLFieldName }

function TdaSQL.GetCalcFieldForSQLFieldName(const aSQLFieldName: String): TdaField;
var
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < CalcFieldCount) do
    begin
      if (CompareText(aSQLFieldName, CalcFields[liIndex].SQLFieldName) = 0) then
        Result := CalcFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetCalcFieldForSQLFieldName}


{------------------------------------------------------------------------------}
{ TdaSQL.GetTableSelectFieldForSQLFieldName }

function TdaSQL.GetTableSelectFieldForSQLFieldName(const aSQLFieldName: String): TdaField;
var
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < SelectFieldCount) do
    begin
      if (CompareText(aSQLFieldName, SelectFields[liIndex].SQLFieldName) = 0) then
        Result := SelectFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetTableSelectFieldForFieldAlias}


{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldForAlias }

function TdaSQL.GetFieldForAlias(const aAlias: String): TdaField;
var
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < SelectFieldCount) do
    begin
      if CompareText(aAlias, SelectFields[liIndex].Alias) = 0 then
        Result := SelectFields[liIndex]
      else
        Inc(liIndex);
    end;

  liIndex := 0;

  while (Result = nil) and (liIndex < CalcFieldCount) do
    begin
      if CompareText(aAlias, CalcFields[liIndex].Alias) = 0 then
        Result := CalcFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetFieldForAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldForFieldAlias }

function TdaSQL.GetFieldForFieldAlias(const aFieldAlias: String): TdaField;
var
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < SelectFieldCount) do
    begin
      if CompareText(aFieldAlias, SelectFields[liIndex].FieldAlias) = 0 then
        Result := SelectFields[liIndex]
      else
        Inc(liIndex);
    end;

  liIndex := 0;

  while (Result = nil) and (liIndex < CalcFieldCount) do
    begin
      if CompareText(aFieldAlias, CalcFields[liIndex].Alias) = 0 then
        Result := CalcFields[liIndex]
      else
        Inc(liIndex);
    end;


end; {function, GetFieldForFieldAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldForFieldName }

function TdaSQL.GetFieldForFieldName(const aFieldName: String): TdaField;
var
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < SelectFieldCount) do
    begin
      if CompareText(aFieldName, SelectFields[liIndex].FieldName) = 0 then
        Result := SelectFields[liIndex]
      else
        Inc(liIndex);
    end;

  liIndex := 0;

  while (Result = nil) and (liIndex < CalcFieldCount) do
    begin
      if CompareText(aFieldName, CalcFields[liIndex].FieldName) = 0 then
        Result := CalcFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetFieldForFieldName}

{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldForSQLFieldName }

function TdaSQL.GetFieldForSQLFieldName(const aFieldName: String): TdaField;
var
  liIndex: Integer;
begin

  Result := nil;

  liIndex := 0;

  while (Result = nil) and (liIndex < SelectFieldCount) do
    begin
      if CompareText(aFieldName, SelectFields[liIndex].SQLFieldName) = 0 then
        Result := SelectFields[liIndex]
      else
        Inc(liIndex);
    end;

  liIndex := 0;

  while (Result = nil) and (liIndex < CalcFieldCount) do
    begin
      if CompareText(aFieldName, CalcFields[liIndex].SQLFieldName) = 0 then
        Result := CalcFields[liIndex]
      else
        Inc(liIndex);
    end;

end; {function, GetFieldForSQLFieldName}

{------------------------------------------------------------------------------}
{ TdaSQL.GetFieldsForSQL}

function TdaSQL.GetFieldsForSQL(aSQL: TStrings; aList: TList): Boolean;
var
  lDataSet: TdaDataSet;
  lsMessage: String;
  lsCaption: String;
begin
  
  Result := True;
  
  lDataSet := FDataSetClass.Create(Self);
  
  lDataSet.DatabaseName := FDatabaseName;
  
  try
    lDataSet.GetFieldsForSQL(aList, aSQL);
  except
    on E: Exception do
      begin
        lsCaption := ppLoadStr(829); {SQL}
        lsMessage := ppLoadStr(777)+ #13#10 + #13#10 + E.Message; {Invalid SQL statement.}
        ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);
  
        aList.Clear;
  
        Result := False;
      end;
  end; {try, except}
  
  lDataSet.Free;

end; {function, GetFieldsForSQL}


{------------------------------------------------------------------------------}
{ TdaSQL.GetGroupByField}

function TdaSQL.GetGroupByField(aIndex: Integer): TdaField;
begin
  Result := TdaField(FGroupByFields[aIndex]);
end; {function, GetGroupByField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetGroupByFieldCount}

function TdaSQL.GetGroupByFieldCount: Integer;
begin
  Result := FGroupByFields.Count;
end; {function, GetGroupByFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetHasGroupsInChain}

function TdaSQL.GetHasGroupsInChain: Boolean;
begin
  
  Result := False;

  if (FMasterSQL <> nil) then
    begin
      Result := FMasterSQL.HasGroups;

      if not (Result) then
        Result := FMasterSQL.HasGroupsInChain;
    end;

end; {function, GetHasGroupsInChain}

{------------------------------------------------------------------------------}
{ TdaSQL.GetHasSearchCriteria}

function TdaSQL.GetHasSearchCriteria: Boolean;
begin

  Result := (CriteriaCount > 0);
  
end; {function, GetHasSearchCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.GetHasSearchCriteriaInChain}

function TdaSQL.GetHasSearchCriteriaInChain: Boolean;
begin
  
  Result := False;

  if (FMasterSQL <> nil) then
    begin
      Result := FMasterSQL.HasSearchCriteria;

      if not (Result) then
        Result := FMasterSQL.HasSearchCriteriaInChain;
    end;

end; {function, GetHasSearchCriteriaInChain}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectFieldsChanged }

function TdaSQL.SelectFieldsChanged(aNewSQL: TdaSQL): Boolean;
var
  liIndex: Integer;
  lField: TdaField;
  lNewField: TdaField;
  lCalc: TdaCalculation;
  lNewCalc: TdaCalculation;
begin

  Result := False;

  if (SelectFieldCount <> aNewSQL.SelectFieldCount) or (CalcFieldCount <> aNewSQL.CalcFieldCount) then
    begin
      Result := True;

      Exit;
    end;

  {compare select fields}
  liIndex := 0;

  while not(Result) and (liIndex < aNewSQL.SelectFieldCount) do
    begin
      lField := SelectFields[liIndex];
      lNewField := aNewSQL.SelectFields[liIndex];

      if not(lField.EqualTo(lNewField)) then
        Result := True
      else
        Inc(liIndex);
    end;

  {compare calc fields}
  liIndex := 0;

  while not(Result) and (liIndex < aNewSQL.CalcFieldCount) do
    begin
      lCalc := CalcFields[liIndex];
      lNewCalc := aNewSQL.CalcFields[liIndex];

      if not(lCalc.EqualTo(lNewCalc)) then
        Result := True
      else
        Inc(liIndex);
    end;


end; {function, SelectFieldsChanged}

{------------------------------------------------------------------------------}
{ TdaSQL.SearchCriteriaChanged }

function TdaSQL.SearchCriteriaChanged(aNewSQL: TdaSQL): Boolean;
var
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lNewCriteria: TdaCriteria;
begin

  Result := False;

  if (CriteriaCount = 0) and (aNewSQL.CriteriaCount = 0) then Exit;

  if (CriteriaCount <> aNewSQL.CriteriaCount) then
    begin
      Result := True;

      Exit;
    end;

  {compare select fields}
  liIndex := 0;

  while not(Result) and (liIndex < aNewSQL.CriteriaCount) do
    begin
      lCriteria := Criteria[liIndex];
      lNewCriteria := aNewSQL.Criteria[liIndex];

      if not(lCriteria.EqualTo(lNewCriteria)) then
        Result := True
      else
        Inc(liIndex);
    end;

end; {function, SearchCriteriaChanged}

{------------------------------------------------------------------------------}
{ TdaSQL.OrderByFieldsChanged }

function TdaSQL.OrderByFieldsChanged(aNewSQL: TdaSQL): Boolean;
var
  liIndex: Integer;
  lOrderByField: TdaField;
  lNewOrderByField: TdaField;
begin

  Result := False;

  if (OrderByFieldCount = 0) and (aNewSQL.OrderByFieldCount = 0) then Exit;

  if (OrderByFieldCount <> aNewSQL.OrderByFieldCount) then
    begin
      Result := True;

      Exit;
    end;

  {compare select fields}
  liIndex := 0;

  while not(Result) and (liIndex < aNewSQL.OrderByFieldCount) do
    begin
      lOrderByField := OrderByFields[liIndex];
      lNewOrderByField := aNewSQL.OrderByFields[liIndex];

      if not(lOrderByField.EqualTo(lNewOrderByField)) then
        Result := True
      else
        Inc(liIndex);
    end;

end; {function, OrderByFieldsChanged}

{------------------------------------------------------------------------------}
{ TdaSQL.ClearLinkColors }

procedure TdaSQL.ClearLinkColors;
begin
  TdaLinkBroker(FLinkBroker).ClearLinkColors;
end; {procedure, ClearLinkColors}

{------------------------------------------------------------------------------}
{ TdaSQL.FixUpLinkColors }

procedure TdaSQL.FixUpLinkColors;
begin
  TdaLinkBroker(FLinkBroker).FixUpLinkColors;
end; {procedure, FixUpLinkColors}

{------------------------------------------------------------------------------}
{ TdaSQL.ValidateLinks }

function TdaSQL.ValidateLinks: Boolean;
begin
  Result := TdaLinkBroker(FLinkBroker).ValidateLinks;
end; {function, ValidateLinks}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateLink }

procedure TdaSQL.CreateLink(aMasterField, aDetailField: TdaField);
begin
  TdaLinkBroker(FLinkBroker).CreateLink(aMasterField, aDetailField);
end; {procedure, CreateLink}

{------------------------------------------------------------------------------}
{ TdaSQL.GetLink }

function TdaSQL.GetLink(aIndex: Integer): TdaSQLLink;
begin
  Result := TdaLinkBroker(FLinkBroker).Links[aIndex];
end; {function, GetLink}

{------------------------------------------------------------------------------}
{ TdaSQL.GetLinkCount }

function TdaSQL.GetLinkCount: Integer;
begin
  Result := TdaLinkBroker(FLinkBroker).LinkCount;
end; {function, GetLinkCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetMagicLinkFieldNameCount }

function TdaSQL.GetMagicLinkFieldNameCount: Integer;
begin

  if (FMagicSQL <> nil) then
    Result := TdaMagicSQL(FMagicSQL).LinkFieldNameCount

  else
    Result := 0;

end; {function, GetMagicLinkFieldNameCount}

{------------------------------------------------------------------------------}
{ TdaSQL.GetMagicLinkFieldNames }

function TdaSQL.GetMagicLinkFieldNames(aIndex: Integer; var aMasterFieldName, aDetailFieldName: String; aMasterMagicSQL: TdaSQL; var aDetailAscending: Boolean): Boolean;
begin

  if (FMagicSQL <> nil) then
    Result := TdaMagicSQL(FMagicSQL).GetLinkFieldNames(aIndex, aMasterFieldName, aDetailFieldName, TdaMagicSQL(aMasterMagicSQL), aDetailAscending)

  else
    Result := False;

end; {procedure, GetMagicLinkFieldNames}


{------------------------------------------------------------------------------}
{ TdaSQL.GetOrderByField}

function TdaSQL.GetOrderByField(aIndex: Integer): TdaField;
begin
  Result := TdaField(FOrderByFields[aIndex]);
end; {function, GetOrderByField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetOrderByFieldCount}

function TdaSQL.GetOrderByFieldCount: Integer;
begin
  Result := FOrderByFields.Count;
end; {function, GetOrderByFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectField}

function TdaSQL.GetSelectField(aIndex: Integer): TdaField;
begin
  Result := TdaField(FSelectFields[aIndex]);
end; {function, GetSelectField}


{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectFieldCount}

function TdaSQL.GetSelectFieldCount: Integer;
begin
  Result := FSelectFields.Count;
end; {function, GetSelectFieldCount}


{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectTable}

function TdaSQL.GetSelectTable(aIndex: Integer): TdaTable;
begin
  Result := TdaTable(FSelectTables[aIndex]);
end; {function, GetSelectTable}


{------------------------------------------------------------------------------}
{ TdaSQL.GetSelectTableCount}

function TdaSQL.GetSelectTableCount: Integer;
begin
  Result := FSelectTables.Count;
end; {function, GetSelectTableCount}



{*******************************************************************************
 *
 ** M A G I C   S Q L   L O G I C
 *
{******************************************************************************}


{------------------------------------------------------------------------------}
{ TdaSQL.GetMagicAlias }

function TdaSQL.GetMagicAlias(aField: TdaField): String;
const
  cReplaceChars: array[0..17] of char = (' ', '#', '(', ')', '.', '"', '*', '+',
                                         '-', '/', '|', '!', '@', '$', '%', '^', '&', '=');
var
  lsAlias: String;
  liIndex: Integer;
  lbStartQuote: Boolean;
  liPosition: Integer;
begin

  if (aField <> nil) then
    begin
      if (aField is TdaCalculation) then
        begin
          lsAlias := TdaCalculation(aField).GetDescription;

          {remove any "AS MyAlias" in the expression}
          liPosition := Pos(' AS ', UpperCase(lsAlias));

          if (liPosition > 0) then
            Delete(lsAlias, liPosition, (Length(lsAlias) - (liPosition - 1)));
        end

      else
        lsAlias := aField.FieldName;
    end
  else
    lsAlias := '';

  liIndex := 1;
  lbStartQuote := False;

  while (liIndex < Length(lsAlias)) do
    begin
      if (lsAlias[liIndex] = '''') then
        begin
          lsAlias[liIndex] := '_';

          if not(lbStartQuote) then
            lbStartQuote := True
          else
            lbStartQuote := False;
        end;

        if lbStartQuote then
          lsAlias[liIndex] := '_';

      Inc(liIndex);
    end;

  for liIndex := Low(cReplaceChars) to High(cReplaceChars) do
    lsAlias := StringReplace(lsAlias, cReplaceChars[liIndex], '_', [rfReplaceAll]);

  {clean up}
  liIndex := 1;

  while (liIndex < Length(lsAlias)) do
    if (lsAlias[liIndex] = '_') and (lsAlias[liIndex + 1] = '_') then
      Delete(lsAlias, liIndex, 1)
    else
      Inc(liIndex);


  {Limit Alias length as appropriate}
  while (Length(lsAlias) > MaxSQLFieldAliasLength) do
    Delete(lsAlias, Length(lsAlias), 1);


  while (lsAlias <> '') and (lsAlias[1] = '_') do
    Delete(lsAlias, 1, 1);

  while (lsAlias <> '') and (lsAlias[Length(lsAlias)] = '_') do
    Delete(lsAlias, Length(lsAlias), 1);

  ValidateSQLFieldName(lsAlias, aField.SQLFieldName, MaxSQLFieldAliasLength);

  Result := lsAlias;

end; {function, GetMagicAlias}


{------------------------------------------------------------------------------}
{ TdaSQL.GetSQLText}

function TdaSQL.GetSQLText: TStrings;
begin

  Result := FSQLText;
  
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;
  
  if (FSQLOutOfSync) then
    if FEditSQLAsText then
      CreateFieldsFromSQL
    else
      CreateSQL;
  
  Result := FSQLText;

end; {function, GetSQLText}


{------------------------------------------------------------------------------}
{ TdaSQL.GetTableForSQLAlias}

function TdaSQL.GetTableForSQLAlias(const aSQLAlias: String): TdaTable;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  
  liIndex := 0;
  lbFound := False;
  
  while not(lbFound) and (liIndex < FSelectTables.Count) do
    begin
      if (CompareText(aSQLAlias, SelectTables[liIndex].SQLAlias) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;
  
  if (lbFound) then
    Result := SelectTables[liIndex]
  else
    Result := nil;
  
end; {function, GetTableForSQLAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateAvailableTableList }

procedure TdaSQL.CreateAvailableTableList;
var
  lTables: TList;
  lAvailableTables: TStringList;
  liIndex: Integer;
  lMetaTable: TdaMetaTable;
  lTable: TdaTable;
begin

  gMetaData.DatabaseName := FDatabaseName;
  gMetaData.DataDictionary := FDataDictionary;
  gMetaData.Session := FSession;

  lTables := TList.Create;
  lAvailableTables := TStringList.Create;

  gMetaData.GetTables(lTables);

  for liIndex := 0 to lTables.Count - 1 do
    begin
      lMetaTable := TdaMetaTable(lTables[liIndex]);

      lTable := TdaTable.Create(Self);

      lTable.OwnerName := lMetaTable.OwnerName;
      lTable.TableName := lMetaTable.Name;
      lTable.Alias := lMetaTable.Alias;
      lTable.TableAlias := lMetaTable.Alias;

      lAvailableTables.AddObject(lTable.TableAlias, lTable);
    end;

  {sort by table alias}
  lAvailableTables.Sort;

  {transfer sorted tables to list}
  daFreeChildren(FAvailableTables);

  for liIndex := 0 to lAvailableTables.Count - 1 do
    FAvailableTables.Add(lAvailableTables.Objects[liIndex]);

  lTables.Free;
  lAvailableTables.Free;

  CreateJoinableTableLists;

end; {procedure, CreateAvailableTableList}

{------------------------------------------------------------------------------}
{ TdaSQL.CreateJoinableTableLists }

procedure TdaSQL.CreateJoinableTableLists;
var
  liIndex: Integer;
  lTable: TdaTable;
begin

  if not(AutoJoin) then Exit;

  for liIndex := 0 to FAvailableTables.Count - 1 do
    begin
      lTable := TdaTable(FAvailableTables[liIndex]);

      FDataDictionary.GetJoinableTableNames(lTable.RawTableName, lTable.JoinableTableNames);
    end;

  UpdateJoinableTables;

end; {procedure, CreateJoinableTableLists}

{------------------------------------------------------------------------------}
{ TdaSQL.UpdateJoinableTables }

procedure TdaSQL.UpdateJoinableTables;
var
  liIndex: Integer;
  lTable: TdaTable;
  lTables: TStrings;
begin

  if not(AutoJoin) then Exit;

  {get list of selected tables}
  lTables := TStringList.Create;

  for liIndex := 0 to SelectTableCount - 1 do
    begin
      lTable := SelectTables[liIndex];

      lTables.Add(lTable.RawTableName);
    end;

  {pass list of selected tables to each available table}
  for liIndex := 0 to FAvailableTables.Count - 1 do
    begin
      lTable := TdaTable(FAvailableTables[liIndex]);

      lTable.UpdateJoinable(lTables);
    end;

  lTables.Free;

end; {procedure, UpdateJoinableTables}

{------------------------------------------------------------------------------}
{ TdaSQL.HasAggregates }

function TdaSQL.HasAggregates: Boolean;
var
  liIndex: Integer;
begin
  
  Result := False;
  
  liIndex := 0;
  
  while not(Result) and (liIndex < CalcFieldCount) do
    begin
  
      if CalcFields[liIndex].CalcType in [dacaCount, dacaAvg, dacaMax, dacaMin, dacaSum] then
        Result := True
      else
        Inc(liIndex);
  
    end;
  
end; {function, HasAggregates}

{------------------------------------------------------------------------------}
{ TdaSQL.HasGroups}

function TdaSQL.HasGroups: Boolean;
begin

  Result := GroupByFieldCount > 0;
  
end; {function, HasGroups}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfChild }

function TdaSQL.IndexOfChild(aChild: TppRelative): Integer;
begin
  
  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  Result := FSelectTables.IndexOf(aChild);
     dactSelectField:  Result := FSelectFields.IndexOf(aChild);
     dactOrderByField: Result := FOrderByFields.IndexOf(aChild);
     dactCriteria:     Result := FCriteria.IndexOf(aChild);
     dactCalcField:    Result := FCalcFields.IndexOf(aChild);
     dactGroupByField: Result := FGroupByFields.IndexOf(aChild);
     else
       Result := inherited IndexOfChild(aChild);
  end;
  
end; {function, IndexOfChild}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfSelectTableName }

function TdaSQL.IndexOfSelectTableName(const aTableName: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  Result := -1;
  
  {determine if customer table is in query}
  liIndex := 0;
  lbFound := False;
  
  while not(lbFound) and (liIndex < SelectTableCount) do
    begin
      lbFound := (CompareText(SelectTables[liIndex].RawTableName, aTableName) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;
  
  if lbFound then
    Result := liIndex;
  
end; {function, IndexOfSelectTableName}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfTableAlias }

function TdaSQL.IndexOfTableAlias(const aTableAlias: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  Result := -1;
  
  {determine if customer table is in query}
  liIndex := 0;
  lbFound := False;
  
  while not(lbFound) and (liIndex < SelectTableCount) do
    begin
      lbFound := (CompareText(SelectTables[liIndex].TableAlias, aTableAlias) = 0);
  
      if not(lbFound) then
        Inc(liIndex);
    end;
  
  if lbFound then
    Result := liIndex;
  
end; {function, IndexOfTableAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.IndexOfRawTableName }

function TdaSQL.IndexOfRawTableName(const aRawTableName: String): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
begin
  Result := -1;
  
  {determine if customer table is in query}
  liIndex := 0;
  lbFound := False;
  
  while not(lbFound) and (liIndex < AvailableTableCount) do
    begin
      lbFound := (CompareText(AvailableTables[liIndex].RawTableName, aRawTableName) = 0);
  
      if not(lbFound) then
        Inc(liIndex);
    end;
  
  if lbFound then
    Result := liIndex;
  
end; {function, IndexOfRawTableName}

{------------------------------------------------------------------------------}
{ TdaSQL.InsertChild }

procedure TdaSQL.InsertChild(aPosition: Integer; aChild: TppRelative);
begin
  
  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Insert(aPosition, aChild);
     dactSelectField:  FSelectFields.Insert(aPosition, aChild);
     dactOrderByField: FOrderByFields.Insert(aPosition, aChild);
     dactCriteria:     FCriteria.Insert(aPosition, aChild);
     dactCalcField:    FCalcFields.Insert(aPosition, aChild);
     dactGroupByField: FGroupByFields.Insert(aPosition, aChild);
     else
       inherited InsertChild(aPosition, aChild);
  end;
  
  Modification;
  
end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TdaSQL.InsertCriteria }

function TdaSQL.InsertCriteria(aPosition: Integer; aType: TdaCriteriaType): TdaCriteria;
var
  lCriteria: TdaCriteria;
begin
  
  lCriteria := TdaCriteria.Create(Self);
  lCriteria.CriteriaType := aType;
  lCriteria.Parent := Self;
  lCriteria.Position := aPosition;
  
  ResetCriteriaLevels;
  
  Result := lCriteria;
  
end; {function, InsertCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.IsAdvantage }

function TdaSQL.IsAdvantage: Boolean;
begin
  Result := (FDatabaseType = dtAdvantage);
end; {function, IsAdvantage}

{------------------------------------------------------------------------------}
{ TdaSQL.IsDBISAM }

function TdaSQL.IsDBISAM: Boolean;
begin
  Result := (FDatabaseType = dtDBISAM);
end; {function, IsDBISAM}

{------------------------------------------------------------------------------}
{ TdaSQL.IsInterBase }

function TdaSQL.IsInterBase: Boolean;
begin
  Result := (FDatabaseType = dtInterBase);
end; {function, IsInterBase}

{------------------------------------------------------------------------------}
{ TdaSQL.IsMSAccess }

function TdaSQL.IsMSAccess: Boolean;
begin
  Result := (FDatabaseType = dtMSAccess);
end; {function, IsMSAccess}

{------------------------------------------------------------------------------}
{ TdaSQL.IsMSSQLServer }

function TdaSQL.IsMSSQLServer: Boolean;
begin
  Result := (FDatabaseType = dtMSSQLServer);
end; {function, IsMSSQLServer}

{------------------------------------------------------------------------------}
{ TdaSQL.IsOracle }

function TdaSQL.IsOracle: Boolean;
begin
  Result := (FDatabaseType = dtOracle);
end; {function, IsOracle}

{------------------------------------------------------------------------------}
{ TdaSQL.IsParadox }

function TdaSQL.IsParadox: Boolean;
begin
  Result := (FDatabaseType = dtParadox);
end; {function, IsParadox}

{------------------------------------------------------------------------------}
{ TdaSQL.IsSQLReservedWord }

function TdaSQL.IsSQLReservedWord(const aString: String): Boolean;
begin
  Result := False;
  
  if (FSession <> nil) then
    Result := FSession.IsSQLReservedWord(aString, FDatabaseType);
  
end; {function, IsSQLReservedWord}

{------------------------------------------------------------------------------}
{ TdaSQL.IsSybaseASA }

function TdaSQL.IsSybaseASA: Boolean;
begin
  Result := (FDatabaseType = dtSybaseASA);
end; {function, IsSybaseASA}

{------------------------------------------------------------------------------}
{ TdaSQL.IsSybaseASE }

function TdaSQL.IsSybaseASE: Boolean;
begin
  Result := (FDatabaseType = dtSybaseASE);
end; {function, IsSybaseASE}

{------------------------------------------------------------------------------}
{ TdaSQL.Loaded }

procedure TdaSQL.Loaded;
begin
  
  inherited Loaded;
  
  FModified := False;
  
  {FSQLOutOfSync := False;
  FTablesOutOfSync := False;
  FFieldsOutOfSync := False;
  FCalcFieldsOutOfSync := False;
  FCriteriaOutOfSync := False;
  FSelectFieldsOutOfSync := False;
  FGroupByFieldsOutOfSync := False;
  FOrderByFieldsOutOfSync := False;
  FDetailLinkFieldsOutOfSync := False;
  FMasterLinkFieldsOutOfSync := False; }

  Resync;
  
end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaSQL.MatchJoinFieldsByName }

procedure TdaSQL.MatchJoinFieldsByName(aTable1, aTable2: TdaTable);
var
  liIndex: Integer;
  liPosition: Integer;
  lFieldNames1: TStrings;
  lFieldNames2: TStrings;
  lsFieldName1: String;
  lsFieldName2: String;
begin

  if (aTable1 = nil) or (aTable2 = nil) then Exit;
  if (aTable1.TableName = '') or (aTable2.TableName = '') then Exit;
  if (aTable1.TableName = aTable2.TableName) then Exit;

  {default join type}
  aTable2.JoinType := dajtInner;
  
  lFieldNames1 := TStringList.Create;
  lFieldNames2 := TStringList.Create;
  
  CreateFieldNamesForTable(aTable1, lFieldNames1);
  CreateFieldNamesForTable(aTable2, lFieldNames2);
  
  liIndex := 0;
  
  {locate field in join fields, with same name as field in fields}
  while (liIndex < lFieldNames1.Count) do
    begin
      liPosition := lFieldNames2.IndexOf(lFieldNames1[liIndex]);
  
      if (liPosition <> -1) then
        begin
          lsFieldName1 := lFieldNames1[liIndex];
          lsFieldName2 := lFieldNames2[liPosition];
  
          aTable2.AddTableJoin(aTable1, lsFieldName1, lsFieldName2, dajoEqual);
        end;
  
      Inc(liIndex);
    end;
  
  for liIndex := 0 to lFieldNames1.Count - 1 do
    TdaField(lFieldNames1.Objects[liIndex]).Free;
  
  for liIndex := 0 to lFieldNames2.Count - 1 do
    TdaField(lFieldNames2.Objects[liIndex]).Free;
  
  lFieldNames1.Free;
  lFieldNames2.Free;
  
end; {procedure, MatchJoinFieldsByName }

{------------------------------------------------------------------------------}
{ TdaSQL.MatchJoinFieldsViaDictionary }

procedure TdaSQL.MatchJoinFieldsViaDictionary(aTable1, aTable2: TdaTable);
var
  liIndex: Integer;
  lsJoinType: String;
  lFieldNames1: TStrings;
  lFieldNames2: TStrings;
  lOperators: TStrings;
  lsFieldName1: String;
  lsFieldName2: String;
  lOperator: TdaJoinOperatorType;
begin
  
  lFieldNames1 := TStringList.Create;
  lFieldNames2 := TStringList.Create;
  lOperators := TStringList.Create;
  lsJoinType := '';
  
  if FDataDictionary.GetJoinData(aTable1.RawTableName, aTable2.RawTableName, lsJoinType, lFieldNames1, lFieldNames2, lOperators) then
    begin
      aTable2.JoinType := TdaJoinType(ppGetEnumStringAsInteger(TypeInfo(TdaJoinType), lsJoinType));
  
      for liIndex := 0 to lFieldNames1.Count - 1 do
        begin
          lsFieldName1 := lFieldNames1[liIndex];
          lsFieldName2 := lFieldNames2[liIndex];
          lOperator := daStringToJoinOperator(lOperators[liIndex]);
  
          aTable2.AddTableJoin(aTable1, lsFieldName1, lsFieldName2, lOperator);
        end;
    end;
  
  lFieldNames1.Free;
  lFieldNames2.Free;
  lOperators.Free;
  
end; {procedure, MatchJoinFieldsViaDictionary}

{------------------------------------------------------------------------------}
{ TdaSQL.Modification }

procedure TdaSQL.Modification;
begin
  
  if (csReading in ComponentState) or (csWriting in ComponentState) or
     (csLoading in ComponentState) or (csDestroying in ComponentState) then Exit;
  
  if (FAssigning) then Exit;
  
  FModified := True;
  
  FSQLOutOfSync := True;
  
end; {procedure, Modification}

{------------------------------------------------------------------------------}
{ TdaSQL.MoveChild }

procedure TdaSQL.MoveChild(aChild: TdaChild; aCurrentIndex, aNewIndex: Integer);
begin
  
  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Move(aCurrentIndex, aNewIndex);
     dactSelectField:  FSelectFields.Move(aCurrentIndex, aNewIndex);
     dactOrderByField: FOrderByFields.Move(aCurrentIndex, aNewIndex);
     dactCriteria:     FCriteria.Move(aCurrentIndex, aNewIndex);
     dactCalcField:    FCalcFields.Move(aCurrentIndex, aNewIndex);
     dactGroupByField: FGroupByFields.Move(aCurrentIndex, aNewIndex);
  end;
  
  Modification;
  
end; {procedure, MoveChild}

{------------------------------------------------------------------------------}
{ TdaSQL.NameToSQLString }

procedure TdaSQL.NameToSQLString(var aName: String);
begin
  if (Length(Trim(aName)) = 0) then Exit;
  
  if daContainsInvalidChars(aName) or IsSQLReservedWord(aName) then
    begin
      if IsMSAccess then
        aName := '[' + aName + ']'
      else
        aName := '"' + aName + '"';
    end;
  
end; {procedure, NameToSQLString}

{------------------------------------------------------------------------------}
{ TdaSQL.Notify }

procedure TdaSQL.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin
  
  inherited Notify(aCommunicator, aOperation);
  
  if (aOperation <> ppopRemove) then Exit;
  
  if (aCommunicator = FDataDictionary) then
    FDataDictionary := nil
  
  else if (aCommunicator = FSession) then
    FSession := nil
  
  else if (aCommunicator = FMasterSQL) then
    FMasterSQL := nil
  
  else if (aCommunicator is TppRelative) and (IndexOfChild(TppRelative(aCommunicator)) <> -1) then
    begin
      if (aCommunicator is TdaTable) then
        FreeRelatedFields(TdaTable(aCommunicator));
    end;
  
end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaSQL.ppFieldTodaField }

procedure TdaSQL.ppFieldTodaField(aSourceField: TppField; aTargetField: TdaField);
begin

  if (aSourceField = nil) or (aTargetField = nil) then Exit;

  aTargetField.DataType      := aSourceField.DataType;
  aTargetField.DisplayFormat := aSourceField.DisplayFormat;
  aTargetField.FieldName     := aSourceField.FieldName;
  aTargetField.SQLFieldName     := aSourceField.FieldName;
  aTargetField.TableName     := aSourceField.TableName;

  aTargetField.FieldAlias    := aSourceField.FieldAlias;
  aTargetField.Alias         := aSourceField.FieldAlias;

  aTargetField.Selectable    := aSourceField.Selectable;
  aTargetField.Searchable    := aSourceField.Searchable;
  aTargetField.Sortable      := aSourceField.Sortable;

  aTargetField.AutoSearch    := aSourceField.AutoSearch;
  aTargetField.Mandatory     := aSourceField.Mandatory;

end; {procedure, ppFieldTodaField}

{------------------------------------------------------------------------------}
{ TdaSQL.RemoveChild }

function TdaSQL.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin
  
  liIndex := IndexOfChild(aChild);

  Result := liIndex;

  if (liIndex = -1) then Exit;

  {We should never get a ChildType of dactSQLLink since we pass links on to
    the broker in AddChild}
  case TdaChildType(aChild.ChildType) of
     dactSelectTable:  FSelectTables.Delete(liIndex);
     dactSelectField:  FSelectFields.Delete(liIndex);
     dactOrderByField: FOrderByFields.Delete(liIndex);
     dactCriteria:     FCriteria.Delete(liIndex);
     dactCalcField:    FCalcFields.Delete(liIndex);
     dactGroupByField: FGroupByFields.Delete(liIndex);
     else
       Result := inherited RemoveChild(aChild);
  end;

  Modification;
  
  if (SelectTableCount = 0) then
    FModified := False;
  
end; {function, RemoveChild}


{------------------------------------------------------------------------------}
{ TdaSQL.RemoveCriteria}

function TdaSQL.RemoveCriteria(aSelectedIndex: Integer): Boolean;
begin
  Criteria[aSelectedIndex].Free;
  
  Result := True;
end; {function, RemoveCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.RemoveParentheses}

function TdaSQL.RemoveParentheses(aSelectedList: TList): Boolean;
var
  liItem: Integer;
  lCriteria1: TdaCriteria;
  lCriteria2: TdaCriteria;
  liIndex: Integer;
  liIncrement: Integer;
  lCriteria: TdaCriteria;
begin
  
  Result := False;
  
  if (aSelectedList = nil) or (aSelectedList.Count = 0) then Exit;
  
  lCriteria1 := nil;
  liIndex := 0;
  liItem := -1;
  
  if (aSelectedList.Count = 1) then
    begin
      liItem := Integer(aSelectedList[0]);
  
      lCriteria := Criteria[liItem];
  
      if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) then
        lCriteria1 := lCriteria
  
      else if (liItem > 0) then
        begin
          liItem := liItem - 1;
  
          lCriteria := Criteria[liItem];
  
          if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) then
            lCriteria1 := lCriteria;
  
        end;
  
    end;
  
  
  while (lCriteria1 = nil) and (liIndex < aSelectedList.Count) do
    begin
      liItem := Integer(aSelectedList[liIndex]);
  
      lCriteria := Criteria[liItem];
  
      if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) then
        lCriteria1 := lCriteria
      else
        Inc(liIndex);
  
    end;
  
  if (lCriteria1 = nil) then Exit;
  
  {count begins to the begin in the selection}
  lCriteria2 := nil;
  
  if (lCriteria1.CriteriaType = dacrBegin) then
    liIncrement := 1
  else
    liIncrement := -1;
  
  liIndex := liItem + liIncrement;
  
  while (lCriteria2 = nil) and (liIndex < CriteriaCount) and (liIndex > -1) do
    begin
      lCriteria := Criteria[liIndex];
  
      if (lCriteria.CriteriaType in [dacrBegin, dacrEnd]) and
         (lCriteria.Level = lCriteria1.Level) then
        lCriteria2 := lCriteria
      else
        liIndex := liIndex + liIncrement;
  
    end;
  
  if (lCriteria2 = nil) then Exit;
  
  Result := True;
  
  lCriteria1.Free;
  lCriteria2.Free;
  
  ResetCriteriaLevels;
  
end; {function, RemoveParentheses}


{------------------------------------------------------------------------------}
{ TdaSQL.RemoveUserCalcFieldAliases}

procedure TdaSQL.RemoveUserCalcFieldAliases;
var
  liIndex: Integer;
  liPosition: Integer;
  lCalc: TdaCalculation;
  lsExpression: String;
begin

  for liIndex := 0 to CalcFieldCount - 1 do
    begin
      lCalc := CalcFields[liIndex];

      lsExpression := lCalc.Expression;

      liPosition := Pos(' AS ', UpperCase(lsExpression));

      if (liPosition > 0) then
        Delete(lsExpression, liPosition, (Length(lsExpression) - (liPosition - 1)));

      lCalc.Expression := lsExpression;
    end;

end; {procedure, RemoveUserCalcFieldAliases}

{------------------------------------------------------------------------------}
{ TdaSQL.RemoveTable}

function TdaSQL.RemoveTable(const aTableSQLAlias: String): Boolean;
var
  lTable: TdaTable;
begin
  
  {this routine will remove the named table and any tables joined to
   the named table (via the FreeTable procedure)}
  Result := False;
  
  lTable := GetTableForSQLAlias(aTableSQLAlias);
  
  if (lTable = nil) then Exit;
  
  Result := FreeTable(lTable);
  
end; {function, RemoveTable}

{------------------------------------------------------------------------------}
{ TdaSQL.ResetCriteriaLevels }

procedure TdaSQL.ResetCriteriaLevels;
var
  lCriteria: TdaCriteria;
  liLevel: Integer;
  liIndex: Integer;
begin

  liLevel := 0;

  for liIndex := 0 to FCriteria.Count - 1 do
    begin
      lCriteria := Criteria[liIndex];

      lCriteria.Level := liLevel;

      if (lCriteria.CriteriaType = dacrBegin) then
        begin
          lCriteria.Level := liLevel;

          Inc(liLevel);
        end

      else if (lCriteria.CriteriaType = dacrEnd) then
        begin
          Dec(liLevel);

          lCriteria.Level := liLevel;
        end

      else
        lCriteria.Level := liLevel;

    end;

end; {procedure, ResetCriteriaLevels}

{------------------------------------------------------------------------------}
{ TdaSQL.ResolveCriteria }

function TdaSQL.ResolveCriteria(aCriteria: TdaCriteria; aLastCriteriaType: TdaCriteriaType; var aExpression: String): Boolean;
  const
    SearchConditions: array[0..13] of String[11] = ('=','<>','<','<=','>','>=','LIKE','NOT LIKE',
                                                    'BETWEEN','NOT BETWEEN','IN','NOT IN','IS NULL','IS NOT NULL');
  var
    lsText: String;
    lsField: String;
    lsWildCard: String;
    lsDateFormat: String;
    lsTimeFormat: String;
    
    { FormatValue }
    function FormatValue(const aValue: String): String;
      var
       lDateTime: TDateTime;
       lcDateSeparator: Char;
       lbContainsTime: Boolean;
      begin

        Result := ppTrimLeft(aValue);
  
        if ContainsSQLFunctionCall(Result) then Exit;

        if aCriteria.ContainsFieldName then Exit;
  
        if not(aCriteria.CaseSensitive) then
          Result := Uppercase(Result);
  
        if (aCriteria.Field.DataType in [dtDate, dtDateTime]) then
          begin

            try
              lDateTime := ppStrToDateTime(aValue);
            except on EConvertError do
              begin
                Result := '';
  
                Exit;
              end;
            end;
  
            lcDateSeparator := DateSeparator;
  
            lsDateFormat := Session.GetSearchCriteriaDateFormat(DatabaseType, DatabaseName);
            lsTimeFormat := Session.GetSearchCriteriaTimeFormat(DatabaseType, DatabaseName);
  
            if (IsOracle or IsSybaseASA or IsSybaseASE or IsMSSQLServer) then
              lbContainsTime := (Pos(#32, Result) <> 0)
            else
              lbContainsTime := (Pos(#32, Result) <> 0) or (aCriteria.Field.DataType = dtDateTime);
  
            try
              DateSeparator := '/';
  
              if lbContainsTime then
                Result := FormatDateTime(lsDateFormat + ' ' + lsTimeFormat, lDateTime)
              else
                Result := FormatDateTime(lsDateFormat, lDateTime);
  
              {add special function call to convert the Oracle date based on the format of the criteria value}
              if (IsOracle) then
                begin
                  if (lbContainsTime) then
                    Result := 'TO_DATE(' + '''' + Result + '''' + ',' + '''' + lsDateFormat + ' HH24:MI:SS' + '''' + ')'
                  else
                    Result := 'TO_DATE(' + '''' + Result + '''' + ',' + '''' + lsDateFormat + '''' + ')';
                end;
  
            finally
              DateSeparator := lcDateSeparator;
            end; {try, finally}
  
  
            if IsMSAccess then
              Result := '#' + Result + '#'
            else if not(IsOracle) then
              Result := '''' + Result + '''';
          end
  
        else if (aCriteria.Field.DataType in [dtBoolean]) and
                (IsAdvantage or IsMSSQLServer or IsOracle or IsSybaseASE or IsSybaseASA) then
          begin
            if (Length(aValue) > 0) and (UpperCase(aValue[1])[1] in ['T', 'Y', '1']) then
              Result := '1'
            else
              Result := '0';
          end
  
        else if (aCriteria.Field.DataType in [dtBoolean]) then
          begin
            if (Length(aValue) > 0) and (UpperCase(aValue[1])[1] in ['T', 'Y', '1']) then
              Result := 'TRUE'
            else
              Result := 'FALSE';
          end
  
        else if (aCriteria.Field.DataType in dacaNumerics) then
          Result := ppFixUpFloatString(aValue, '')
  
        else if not(aCriteria.Operator in [dacoBlank, dacoNotBlank]) then
          begin
  
            if IsMSAccess and (CompareText(FSession.ClassName, 'TdaBDESession') = 0) then
              lsWildCard := '*'
            else
              lsWildCard := '%';
  
            if (aCriteria.Operator in [dacoLike, dacoNotLike]) and (Pos('_', Result) = 0) and (Pos(lsWildCard, Result) = 0) then
              Result := Result + lsWildCard;
  
            if (FSQLType = sqBDELocal) then
              Result := '"' + Result + '"'
            else
              Result := '''' + Result + '''';
  
          end;
  
      end;

    { ResolveOperand }
    function ResolveOperand: String;
    var
      lsValue: String;
      lsOperator: String;
      liIndex: Integer;
      lValues: TStrings;
    begin

      lsOperator := SearchConditions[Ord(aCriteria.Operator)];
  
      case aCriteria.Operator of
  
        dacoEqual, dacoNotEqual, dacoLessThan, dacoLessThanOrEqualTo,
        dacoGreaterThan, dacoGreaterThanOrEqualTo, dacoLike, dacoNotLike:
          lsValue := FormatValue(aCriteria.Value);
  
        dacoBlank, dacoNotBlank:
          lsValue := '';
  
        dacoBetween, dacoNotBetween:
          begin
            lValues := TStringList.Create;
  
            ppParseString(aCriteria.Value, lValues);
  
            if (lValues.Count = 2) then
              lsValue := FormatValue(lValues[0]) + ' AND ' + FormatValue(lValues[1])
            else
              lsValue := '';
  
            lValues.Free;
          end;
  
        dacoInList, dacoNotInList:
          begin
            lValues := TStringList.Create;
  
            ppParseString(aCriteria.Value, lValues);
  
            lsValue := '';
  
            for liIndex := 0 to lValues.Count - 1 do
              begin
                lsValue := lsValue + FormatValue(lValues[liIndex]);
  
                if (liIndex < lValues.Count - 1) then
                  lsValue := lsValue + ',';
              end;
  
            lsValue := '(' + lsValue + ')';
  
            lValues.Free;
          end; {inlist}
  
      end; {case, operator type}
  
  
      Result := lsOperator + ' ' + lsValue;

    end; {procedure, ResolveOperand}
begin

  Result := False;
  
  aExpression := '';
  
  if (aCriteria.Field <> nil) and (aCriteria.Field.AutoSearch) and
     (aCriteria.Value = '') and not(aCriteria.Operator in [dacoBlank, dacoNotBlank]) then Exit;
  
  case aCriteria.CriteriaType of
  
    dacrBegin:
      begin
        lsText := '(';
  
        if (aLastCriteriaType in [dacrField, dacrEnd]) then
          lsText := ' AND ' + lsText;
      end;
  
    dacrEnd:
      lsText := ')';
  
    dacrOR:
      lsText := ' OR ';
  
    dacrNOT:
      begin
        lsText := ' NOT ';
  
        if (aLastCriteriaType in [dacrField, dacrEnd]) then
          lsText := ' AND' + lsText;
      end;
  
    dacrField:
      begin
  
        if not(aCriteria.IsExpression) then
          lsField := aCriteria.Field.SQLString
        else
          lsField := aCriteria.Expression;
  
        if (FSQLType = sqBDELocal) and not(aCriteria.CaseSensitive) then
          lsField := 'UPPER('+ lsField + ')'
  
        else if IsAdvantage and not(aCriteria.CaseSensitive) then
          lsField := 'UCASE('+ lsField + ')';
  
        lsText := '( ' + lsField + ' ' + ResolveOperand + ' )';
  
        if (aLastCriteriaType in [dacrField, dacrEnd]) then
          lsText := ' AND ' + lsText;
      end;
  
  end; {case, Criteria type}
  
  aExpression := lsText;
  
  Result := True;

end; {function, ResolveCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.Resync }

procedure TdaSQL.Resync;
begin
  
  FSQLOutOfSync := True;
  FTablesOutOfSync := True;
  FFieldsOutOfSync := True;
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FSelectFieldsOutOfSync := True;
  FGroupByFieldsOutOfSync := True;
  FOrderByFieldsOutOfSync := True;
  FDetailLinkFieldsOutOfSync := True;
  FMasterLinkFieldsOutOfSync := True;
  
end; {procedure, Resync}

{------------------------------------------------------------------------------}
{ TdaSQL.SaveComponents}

procedure TdaSQL.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin
  
  inherited SaveComponents(Proc);
  
  for liIndex := 0 to (FCalcFields.Count - 1) do
    Proc(FCalcFields[liIndex]);
  
  for liIndex := 0 to (FCriteria.Count - 1) do
    Proc(FCriteria[liIndex]);
  
  for liIndex := 0 to (FSelectFields.Count - 1) do
    Proc(FSelectFields[liIndex]);
  
  for liIndex := 0 to (FGroupByFields.Count - 1) do
    Proc(FGroupByFields[liIndex]);
  
  for liIndex := 0 to (FOrderByFields.Count - 1) do
    Proc(FOrderByFields[liIndex]);
  
  for liIndex := 0 to (FSelectTables.Count - 1) do
    Proc(FSelectTables[liIndex]);

  for liIndex := 0 to (TdaLinkBroker(FLinkBroker).LinkCount - 1) do
    Proc(TdaLinkBroker(FLinkBroker).Links[liIndex]);
  
end; {procedure, SaveComponents}


{------------------------------------------------------------------------------}
{ TdaSQL.SelectCalcField}

function TdaSQL.SelectCalcField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lCalc: TdaCalculation;
begin
  
  lField := AvailableCalcFields[aAvailableIndex];
  
  lCalc := TdaCalculation.Create(Self);
  lCalc.Assign(lField);
  lCalc.Parent := Self;
  lCalc.OnCalcTypeChange := CalcTypeChangeEvent;
  
  lCalc.SQLFieldName := GetMagicAlias(lCalc);

  ValidateFieldAlias(lCalc, True);
  
  Result := lCalc;
  
  FOrderByFieldsOutOfSync := True;
  
  SyncGroupByFieldsWithSelectFields;
  
end; {function, SelectCalcField}


{------------------------------------------------------------------------------}
{ TdaSQL.SelectCriteria}

function TdaSQL.SelectCriteria(aAvailableIndex: Integer): TdaCriteria;
var
  lCriteria: TdaCriteria;
  lField: TdaField;
  lField2: TdaField;
begin

  lCriteria := TdaCriteria.Create(Self);
  lCriteria.Parent := Self;
  
  lField := AvailableCriteria[aAvailableIndex];

  if (lField is TdaCalculation) then
    begin
      lField2 := TdaCalculation.Create(Self);

      FCalcSearchCriteriaAdded := True;
    end
  else
    lField2 := TdaField.Create(Self);

  lField2.Assign(lField);
  lField2.Parent := lCriteria;

  Result := lCriteria;

  ResetCriteriaLevels;

end; {function, SelectCriteria}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectMasterLinkField }

function TdaSQL.SelectMasterLinkField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin

  lField := AvailableMasterLinkFields[aAvailableIndex];

  lNewField := TdaField.Create(Self);

  lNewField.Assign(lField);
  lNewField.ChildType := Ord(dactMasterLinkField);

  Result := lNewField;

end; {function, SelectMasterLinkField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectDetailLinkField }

function TdaSQL.SelectDetailLinkField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin

  lField := TdaField(FAvailableDetailLinkFields[aAvailableIndex]);

  lNewField := TdaField.Create(Self);

  lNewField.Assign(lField);
  lNewField.ChildType := Ord(dactDetailLinkField);

  Result := lNewField;

  FAvailableDetailLinkFields.Delete(aAvailableIndex);

end; {function, SelectDetailLinkField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectField }

function TdaSQL.SelectField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin
  
  lField := AvailableSelectFields[aAvailableIndex];
  
  FAvailableSelectFields.Delete(aAvailableIndex);
  
  lNewField := TdaField.Create(Self);
  lNewField.Assign(lField);
  
  ValidateFieldAlias(lNewField, True);
  
  lNewField.ChildType := Ord(dactSelectField);
  lNewField.Parent := Self;
  
  lNewField.SQLFieldName := GetMagicAlias(lNewField);

  Result := lNewField;
  
  if (HasAggregates) then
    SyncGroupByFieldsWithSelectFields
  else
    ClearGroupByFields;
  
  FGroupByFieldsOutOfSync := True;
  
end; {function, SelectField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectGroupByField }

function TdaSQL.SelectGroupByField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
begin
  lField := AvailableGroupByFields[aAvailableIndex];

  FAvailableGroupByFields.Delete(aAvailableIndex);
  
  lNewField := TdaField.Create(Self);
  lNewField.Assign(lField);
  lNewField.ChildType := Ord(dactGroupByField);
  lNewField.Parent := Self;
  
  Result := lNewField;
end; {function, SelectGroupByField}

{------------------------------------------------------------------------------}
{ TdaSQL.SelectOrderByField}

function TdaSQL.SelectOrderByField(aAvailableIndex: Integer): TdaField;
var
  lField: TdaField;
  lNewField: TdaField;
  {lSelectField: TdaField;}
begin
  
  lField := AvailableOrderByFields[aAvailableIndex];
  
  FAvailableOrderByFields.Delete(aAvailableIndex);
  
  if lField is TdaCalculation then
    lNewField := TdaCalculation.Create(Self)
  else
    lNewField := TdaField.Create(Self);

  lNewField.Assign(lField);
  lNewField.ChildType := Ord(dactOrderByField);
  lNewField.Parent := Self;

  Result := lNewField;
  
end; {function, SelectOrderByField}


{------------------------------------------------------------------------------}
{ TdaSQL.SelectTable}

function TdaSQL.SelectTable(aAvailableIndex, aJoinIndex: Integer): TdaTable;
var
  lAvailableTable: TdaTable;
  lNewTable: TdaTable;
  lTable1: TdaTable;
begin
  
  {get selected table}
  lAvailableTable := AvailableSelectTables[aAvailableIndex];

  if not(FAllowSelfJoin) then
    FAvailableSelectTables.Delete(aAvailableIndex);
  
  lNewTable := TdaTable.Create(Self);
  lNewTable.Assign(lAvailableTable);
  
  lNewTable.JoinType := dajtNone;
  lNewTable.Alias := CreateAlias(lAvailableTable.RawTableName);
  lNewTable.TableAlias := CreateTableAlias(lAvailableTable);
  lNewTable.SQLAlias := CreateTableSQLAlias(lAvailableTable);
  lNewTable.ChildType := Ord(dactSelectTable);
  lNewTable.Parent := Self;
  
  if (SelectTableCount > 1) then
    begin
      {get first table}
      if (aJoinIndex <> -1) then
        lTable1 := SelectTables[aJoinIndex]
      else
        lTable1 := nil;
  
      if (lTable1 <> nil) then
        begin

          if not(CreateJoin(lTable1, lNewTable)) then
            begin
              lNewTable.Free;
              lNewTable := nil;
              
              if not(FAllowSelfJoin) then
                FAvailableSelectTables.Insert(aAvailableIndex, lAvailableTable);
            end;

        end;
  
    end;
  
  Result := lNewTable;
  
  if (Result <> nil) then
    begin
      AvailableFieldsOutOfSync;
  
      UpdateJoinableTables;
    end;
  
  if (Result <> nil) and (FDataPipelineName = '') then
    FDataPipelineName := ppTextToIdentifier(lNewTable.TableAlias);

end; {function, SelectTable}


{------------------------------------------------------------------------------}
{ TdaSQL.SetAvailableFieldOrder}

procedure TdaSQL.SetAvailableFieldOrder(aSortMode: Integer);
var
  liIndex: Integer;
  lFields: TStringList;
  lField: TdaField;
begin
  
  if (FFieldSortMode = aSortMode) then Exit;
  
  FFieldSortMode := aSortMode;
  
  FAvailableFields.Clear;
  
  {create field list in logical order}
  if (FFieldSortMode = 1) then
    begin
      for liIndex := 0 to FSavedAvailableFields.Count - 1 do
        FAvailableFields.Add(TdaField(FSavedAvailableFields[liIndex]));
    end
  
  {create field list in alpha order}
  else
    begin
  
      lFields := TStringList.Create;
  
      {build list of field aliases}
      for liIndex := 0 to FSavedAvailableFields.Count - 1 do
        begin
          lField := TdaField(FSavedAvailableFields[liIndex]);
  
          lFields.AddObject(lField.FieldAlias, lField);
        end;
  
      {sort by field alias}
      lFields.Sort;
  
      {add fields in alpha order}
      for liIndex := 0 to lFields.Count - 1 do
        FAvailableFields.Add(TdaField(lFields.Objects[liIndex]));
  
      lFields.Free;
    end;

  {indicate that fields are out of sync}
  FCalcFieldsOutOfSync := True;
  FCriteriaOutOfSync := True;
  FSelectFieldsOutOfSync := True;
  FGroupByFieldsOutOfSync := True;
  FOrderByFieldsOutOfSync := True;
  FDetailLinkFieldsOutOfSync := True;
  FMasterLinkFieldsOutOfSync := True;
  
end; {procedure, SetAvailableFieldOrder}


{------------------------------------------------------------------------------}
{ TdaSQL.SetDataDictionary}

procedure TdaSQL.SetDataDictionary(aDataDictionary: TppDataDictionary);
begin
  
  if (FDataDictionary <> nil) then
    FDataDictionary.RemoveNotify(Self);
  
  FDataDictionary := aDataDictionary;
  
  if (FDataDictionary <> nil) then
    FDataDictionary.AddNotify(Self);
  
  Modification;
  
end; {procedure, SetDataDictionary}


{------------------------------------------------------------------------------}
{ TdaSQL.SetEditSQLAsText}

procedure TdaSQL.SetEditSQLAsText(Value: Boolean);
var
  lSQL: TStrings;
begin
  
  FEditSQLAsText := Value;
  
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;
  
  if (FEditSQLAsText) then
    begin
      lSQL := TStringList.Create;
  
      lSQL.Assign(FSQLText);
  
      Clear;

      FSQLText.Assign(lSQL);
  
      lSQL.Free;
    end;
  
end; {procedure, SetEditSQLAsText}


{------------------------------------------------------------------------------}
{ TdaSQL.SetLinkingSQL}

procedure TdaSQL.SetLinkingSQL(aValue: Boolean);
begin

  FLinkingSQL := aValue;

  if (FMasterSQL <> nil) then
    FMasterSQL.LinkingSQL := aValue;

end; {procedure, SetLinkingSQL}


{------------------------------------------------------------------------------}
{ TdaSQL.SetMasterSQL}

procedure TdaSQL.SetMasterSQL(aSQL: TdaSQL);
begin

  if (FMasterSQL <> aSQL) then
    begin
      if (FMasterSQL <> nil) then
        FMasterSQL.RemoveNotify(Self);

      FMasterSQL := aSQL;

      if (FMasterSQL <> nil) then
        FMasterSQL.AddNotify(Self);

      FMasterLinkFieldsOutOfSync := True;
      FDetailLinkFieldsOutOfSync := True;

      Modification;
    end;

end; {procedure, SetMasterSQL}


{------------------------------------------------------------------------------}
{ TdaSQL.SetMaxSQLFieldAliasLengthFromTables}

procedure TdaSQL.SetMaxSQLFieldAliasLengthFromTables;
var
  lTable: TdaTable;
  liIndex: Integer;
begin

  for liIndex := 0 to SelectTableCount - 1 do
    begin
      lTable := SelectTables[liIndex];
      SetMaxSQLFieldAliasLength(lTable);
    end;

end; {procedure, SetMaxSQLFieldAliasLengthFromTables}

{------------------------------------------------------------------------------}
{ TdaSQL.SetMaxSQLFieldNameLength}

procedure TdaSQL.SetMaxSQLFieldAliasLength(aTable: TdaTable);
var
  liMaxLength: Integer;
begin

  if (aTable <> nil) then
    begin
      gMetaData.DatabaseName := FDatabaseName;
      gMetaData.DataDictionary := FDataDictionary;
      gMetaData.Session := FSession;

      liMaxLength := gMetaData.GetMaxFieldAliasLength(aTable.RawTableName);

      if (liMaxLength > FMaxSQLFieldAliasLength) then
        FMaxSQLFieldAliasLength := liMaxLength;
    end;

end; {procedure, SetMaxSQLFieldNameLength}


{------------------------------------------------------------------------------}
{ TdaSQL.GetMaxSQLFieldAliasLength}

function TdaSQL.GetMaxSQLFieldAliasLength: Integer;
begin

  if (FMaxSQLFieldAliasLength = 0) then
    SetMaxSQLFieldAliasLengthFromTables;

  Result := FMaxSQLFieldAliasLength;
  
end; {procedure, GetMaxSQLFieldAliasLength}


{------------------------------------------------------------------------------}
{ TdaSQL.SetSession}

procedure TdaSQL.SetSession(aSession: TdaSession);
begin
  

  if (FSession <> nil) then
    FSession.RemoveNotify(Self);
  
  FSession := aSession;
  
  if (FSession <> nil) then
    begin
      FSession.AddNotify(Self);
      FDataSetClass := FSession.DataSetClass;
    end
  else
    FDataSetClass := nil;
  
  Modification;
  
end; {procedure, SetSession}


{------------------------------------------------------------------------------}
{ TdaSQL.SetSQLText}

procedure TdaSQL.SetSQLText(aSQLText: TStrings);
begin
  
  FSQLText.Assign(aSQLText);
  
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;
  
  FEditSQLAsText := True;
  
  Clear;
  
  FSQLText.Assign(aSQLText);

  CreateFieldsFromSQL;
  
  FSQLOutOfSync := False;
  
  Modification;
  
end; {procedure, SetSQLText}


{------------------------------------------------------------------------------}
{ TdaSQL.SetSQLType}

procedure TdaSQL.SetSQLType(aSQLType: TppSQLType);
begin
  
  FSQLType := aSQLType;
  
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;
  
  Modification;
  
end; {procedure, SetSQLType}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncCalcFields}

procedure TdaSQL.SyncCalcFields;
begin
  
  SyncFields;
  
  if not(FCalcFieldsOutOfSync) then Exit;
  
  FCalcFieldsOutOfSync := False;
  
end; {procedure, SyncCalcFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncCriteria}

procedure TdaSQL.SyncCriteria;
begin
  
  SyncFields;
  
  if not(FCriteriaOutOfSync) then Exit;
  
  FAvailableCriteriaFields.Clear;
  
  daCopyList(FAvailableFields, FAvailableCriteriaFields, daftSearchable);

  FCriteriaOutOfSync := False;
  
end; {procedure, SyncCriteria}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncDetailLinkFields}

procedure TdaSQL.SyncDetailLinkFields;
var
  lFields: TList;
begin

  SyncFields;

  if FDetailLinkFieldsOutOfSync then
    begin
      FAvailableDetailLinkFields.Clear;

      CopyLinkableList(FSelectFields, FAvailableDetailLinkFields, True);

      lFields := TList.Create;

      TdaLinkBroker(FLinkBroker).GetDetailFieldList(lFields);

      SyncFieldList(FAvailableDetailLinkFields, lFields);

      lFields.Free;

      FDetailLinkFieldsOutOfSync := False;
    end;
  
end; {procedure, SyncDetailLinkFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncMasterLinkFields}

procedure TdaSQL.SyncMasterLinkFields;
begin

  SyncFields;

  if FMasterLinkFieldsOutOfSync then
    begin
      FAvailableMasterLinkFields.Clear;

      CopyLinkableList(FSelectFields, FAvailableMasterLinkFields, False);
      CopyLinkableList(FCalcFields, FAvailableMasterLinkFields, False);

      FMasterLinkFieldsOutOfSync := False;
    end;

end; {procedure, SyncMasterLinkFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncFieldList}

procedure TdaSQL.SyncFieldList(aAvailableList, aCurrentList: TList);
var
  liIndex: Integer;
  liPosition: Integer;
  lField: TdaField;
begin
  
  for liIndex := 0 to aCurrentList.Count - 1 do
    begin
  
      lField := TdaField(aCurrentList[liIndex]);
  
      liPosition := daFindField(lField, aAvailableList);
  
      if (liPosition <> -1) then
        aAvailableList.Delete(liPosition);
    end;
  
end; {procedure, SyncFieldList}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncFields}

procedure TdaSQL.SyncFields;
begin
  
  if not(FFieldsOutOfSync) then Exit;
  
  CreateAvailableFieldList;
  
  FFieldsOutOfSync := False;
  
end; {procedure, SyncFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncGroupByFields}

procedure TdaSQL.SyncGroupByFields;
begin
  
  SyncFields;
  
  if not(FGroupByFieldsOutOfSync) then Exit;
  
  FAvailableGroupByFields.Clear;

  daCopyList(FAvailableFields, FAvailableGroupByFields, daftSelectable);

  SyncFieldList(FAvailableGroupByFields, FGroupByFields);

  FGroupByFieldsOutOfSync := False;
  
end; {procedure, SyncGroupByFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncGroupByFieldsWithSelectFields}

procedure TdaSQL.SyncGroupByFieldsWithSelectFields;
var
  liPosition: Integer;
  liIndex: Integer;
begin
  
  {if (FSelectFields.Count = 0) and (HasAggregates) then Exit;}
  
  if (FSyncingGroups) then Exit;
  
  FSyncingGroups := True;
  
  ClearGroupByFields;
  
  SyncGroupByFields;
  
  for liIndex := 0 to FSelectFields.Count - 1 do
    begin
      liPosition := daFindField(SelectFields[liIndex], FAvailableGroupByFields);
  
      if (liPosition <> -1) then
        SelectGroupByField(liPosition);
    end;
  
  FGroupByFieldsOutOfSync := True;
  FGroupByFieldsSynced := True;
  
  FSyncingGroups := False;
  
end; {procedure, SyncGroupByFieldsWithSelectFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncOrderByFields}

procedure TdaSQL.SyncOrderByFields;
begin
  
  SyncFields;
  
  if not(FOrderByFieldsOutOfSync) then Exit;
  
  FAvailableOrderByFields.Clear;
  
  daCopyList(FAvailableFields, FAvailableOrderByFields, daftSortable);
  
  daCopyList(FCalcFields, FAvailableOrderByFields, daftAll);
  
  SyncFieldList(FAvailableOrderByFields, FOrderByFields);
  
  FOrderByFieldsOutOfSync := False;
  
end; {procedure, SyncOrderByFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncOrderByFieldsWithCalcFields}

procedure TdaSQL.SyncOrderByFieldsWithCalcFields;
var
  liPosition: Integer;
  liIndex: Integer;
  lField: TdaField;
begin
  
  if (OrderByFieldCount = 0) then Exit;
  
  for liIndex := 0 to FOrderByFields.Count - 1 do
    begin
      lField := OrderByFields[liIndex];
  
      if lField is TdaCalculation then
        begin
          liPosition := daFindField(lField, FCalcFields);
  
          if (liPosition = -1) then
            DeselectOrderByField(liIndex)
          else
            lField.Assign(TdaCalculation(FCalcFields[liPosition]));
  
          FOrderByFieldsOutOfSync := True;
        end;
    end;
  
end; {procedure, SyncOrderByFieldsWithCalcFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncSelectFields}

procedure TdaSQL.SyncSelectFields;
begin
  
  SyncFields;
  
  if not(FSelectFieldsOutOfSync) then Exit;
  
  FAvailableSelectFields.Clear;
  
  daCopyList(FAvailableFields, FAvailableSelectFields, daftSelectable);
  
  SyncFieldList(FAvailableSelectFields, FSelectFields);
  
  FSelectFieldsOutOfSync := False;

end; {procedure, SyncSelectFields}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncSelectTables}

procedure TdaSQL.SyncSelectTables;
begin
  
  SyncTables;
  
  if not(FSelectTablesOutOfSync) then Exit;
  
  FAvailableSelectTables.Clear;
  
  daCopyList(FAvailableTables, FAvailableSelectTables, daftAll);
  
  SyncTableList(FAvailableSelectTables, FSelectTables);
  
  FSelectTablesOutOfSync := False;
  
end; {procedure, SyncSelectTables}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncTableList}

procedure TdaSQL.SyncTableList(aAvailableList, aCurrentList: TList);
var
  liIndex: Integer;
  liPosition: Integer;
  lTable: TdaTable;
begin
  
  for liIndex := 0 to aCurrentList.Count - 1 do
    begin
  
      lTable := TdaTable(aCurrentList[liIndex]);
  
      liPosition := daFindTable(lTable, aAvailableList);
  
      if (liPosition <> -1) and not(FAllowSelfJoin) then
        aAvailableList.Delete(liPosition);
    end;
  
end; {procedure, SyncTableList}


{------------------------------------------------------------------------------}
{ TdaSQL.SyncTables}

procedure TdaSQL.SyncTables;
begin
  
  if not(FTablesOutOfSync) then Exit;
  
  CreateAvailableTableList;
  
  FTablesOutOfSync := False;
  
end; {procedure, SyncTables}


{------------------------------------------------------------------------------}
{ TdaSQL.UpdateCalcSearchCriteriaDataTypes}

procedure TdaSQL.UpdateCalcSearchCriteriaDataTypes;
var
  lFields: TList;
  liIndex: Integer;
  lbFound: Boolean;
  liIndex2: Integer;
  lCriteria: TdaCriteria;
  lCalculation: TdaCalculation;
begin
  
  if not(FCalcSearchCriteriaAdded) then Exit;
  
  FCalcSearchCriteriaAdded := False;
  
  FSQLText.Clear;
  
  BuildSelectClause;
  
  BuildFromClause;
  
  BuildWhereClause;
  
  if not(FWhereAdded) then
    FSQLText.Add(' WHERE ''c'' <> ''c'' ')
  else
    FSQLText.Add(' AND ''c'' <> ''c'' ');
  
  
  lFields := TList.Create;
  
  if (GetFieldsForSQL(FSQLText, lFields)) then
    begin
  
      for liIndex := 0 to CriteriaCount - 1 do
        begin
          lCriteria := Criteria[liIndex];
  
          if (lCriteria.Field is TdaCalculation) then
            begin
  
              liIndex2 := 0;
              lbFound := False;
  
              {find corresponding calc field position}
              while (liIndex2 < CalcFieldCount) and not(lbFound) do
                begin
                  lCalculation := CalcFields[liIndex2];
  
                  if (CompareText(lCalculation.Expression, lCriteria.Field.SQLString) = 0) then
                    lbFound := True
                  else
                    Inc(liIndex2);
  
                end;
  
              if (lbFound) then
                lCriteria.Field.DataType := TppField(lFields[liIndex2]).DataType;
  
            end;
  
        end; {for, each criteria}
        
    end; {if, fields retrieved}
  
  {free fields}
  for liIndex := 0 to lFields.Count - 1 do
    TppField(lFields[liIndex]).Free;
  
  lFields.Free;
  
end; {procedure, UpdateCalcSearchCriteriaDataTypes}

{------------------------------------------------------------------------------}
{ TdaSQL.Valid}

function TdaSQL.Valid: Boolean;
var
  liIndex: Integer;
  lDataSet: TdaDataSet;
  lFields: TList;
  lsCaption: String;
  lsMessage: String;
begin

  Result := True;

  lDataSet := FDataSetClass.Create(Self);
  lDataSet.DatabaseName := FDatabaseName;
  
  lFields := TList.Create;
  
  try
  
    try

      if (FEditSQLAsText) then
        lDataSet.GetFieldsForSQL(lFields, FSQLText)

      else
        begin
          FStealthMode := True;

          {we're just validating SQL, so don't return rows}
          try
            lDataSet.GetFieldsForSQL(lFields, GetSQLText);

            UpdateCalcFieldDataTypes(lFields);

          finally
            FStealthMode := False;
          end;

        end;

    except
      on E: Exception do
        begin
          lsCaption := ppLoadStr(829); {SQL}
          lsMessage := ppLoadStr(777)+ #13#10 + #13#10 + E.Message; {Invalid SQL statement.}
          ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

          Result := False;
        end;
    end; {try, except}
  
  finally
    {free field objects}
    for liIndex := lFields.Count - 1 downto 0 do
      TObject(lFields[liIndex]).Free;

    lDataSet.Free;
    lFields.Free;

  end; {try, finally}

end; {function, Valid}

{------------------------------------------------------------------------------}
{ TdaSQL.ValidateSQLText}

function TdaSQL.ValidateSQLText(aSQLText: TStrings): Boolean;
var
  liIndex: Integer;
  lDataSet: TdaDataSet;
  lFields: TList;
  lsCaption: String;
  lsMessage: String;
begin

  Result := True;

  lDataSet := FDataSetClass.Create(Self);
  lDataSet.DatabaseName := FDatabaseName;
  
  lFields := TList.Create;
  
  try
  
    try
      lDataSet.GetFieldsForSQL(lFields, aSQLText)

    except
      on E: Exception do
        begin
          lsCaption := ppLoadStr(829); {SQL}
          lsMessage := ppLoadStr(777)+ #13#10 + #13#10 + E.Message; {Invalid SQL statement.}
          ppMessageDlg(lsCaption, lsMessage, mtError, [mbOK], 0);

          Result := False;
        end;
    end; {try, except}
  
  finally

    {free field objects}
    for liIndex := lFields.Count - 1 downto 0 do
      TObject(lFields[liIndex]).Free;

    lDataSet.Free;
    lFields.Free;

  end; {try, finally}

end; {function, ValidateSQLText}

{------------------------------------------------------------------------------}
{ TdaSQL.UpdateCalcFieldDataTypes }

procedure TdaSQL.UpdateCalcFieldDataTypes(aFieldList: TList);
var
  liIndex: Integer;
  liIndex2: Integer;
  lField: TdaField;
  lDataSetField: TppField;
  lCurrentDataSetField: TppField;
begin

  for liIndex := 0 to CalcFieldCount - 1 do
    begin
      lField := CalcFields[liIndex];

      lDataSetField := nil;
      liIndex2 := 0;

      while (lDataSetField = nil) and (liIndex2 < aFieldList.Count) do
        begin
          lCurrentDataSetField := TppField(aFieldList[liIndex2]);

          if (CompareText(lField.SQLFieldName, lCurrentDataSetField.FieldName) = 0) then
            lDataSetField := lCurrentDataSetField
          else
            Inc(liIndex2);
        end;

      if (lDataSetField <> nil) then
        lField.DataType := lDataSetField.DataType;
    end;
end; {function, UpdateCalcFieldDataTypes}

{------------------------------------------------------------------------------}
{ TdaSQL.ValidateFieldAlias }

function TdaSQL.ValidateFieldAlias(aField: TdaField; aFixAlias: Boolean): Boolean;
var
  lField: TdaField;
  lFields: TStringList;
  liIndex: Integer;
  lsAlias: String;
  liIncrement: Integer;
begin

  {these should be maintained dynamically in FFieldAliases}
  lFields := TStringList.Create;

  for liIndex := 0 to SelectFieldCount - 1 do
    begin
      lField := SelectFields[liIndex];

      if (aField <> lField) then
        lFields.Add(lField.Alias);
    end;

  for liIndex := 0 to CalcFieldCount - 1 do
    begin
      lField := CalcFields[liIndex];

      if (aField <> lField) then
        lFields.Add(lField.Alias);
    end;
  
  lsAlias := aField.Alias;
  liIndex := lFields.IndexOf(lsAlias);

  Result := (liIndex = -1);
  
  {assign new, non-conflicting alias}
  if not(Result) and (aFixAlias) then
    begin
  
      liIncrement := 2;

      while (liIndex <> -1) do
        begin
          lsAlias := aField.Alias + ' (' + IntToStr(liIncrement) + ')';

          liIndex := lFields.IndexOf(lsAlias);

          Inc(liIncrement);
        end;

      aField.Alias := lsAlias;
    end;

  lFields.Free;

end; {function, ValidateFieldAlias}

{------------------------------------------------------------------------------}
{ TdaSQL.ValidateSQLFieldNames }

procedure TdaSQL.ValidateSQLFieldName(var aNewSQLFieldName: String; const aOldSQLFieldName: String; aMaxSQLFieldNameLength: Integer);
var
  lFieldNames: TStringList;
  liIndex: Integer;
  liPosition: Integer;
  liIncrement: Integer;
  lsIncrement: String;
  lsSQLFieldName: String;
begin

  {these should be maintained dynamically in FFieldAliases}
  lFieldNames := TStringList.Create;
  lsSQLFieldName := aNewSQLFieldName;

  try
    for liIndex := 0 to SelectFieldCount - 1 do
      lFieldNames.AddObject(SelectFields[liIndex].SQLFieldName, SelectFields[liIndex]);

    for liIndex := 0 to CalcFieldCount - 1 do
      lFieldNames.AddObject(CalcFields[liIndex].SQLFieldName, CalcFields[liIndex]);

    {Remove the field from the list so that it won't find itself}
    liPosition := lFieldNames.IndexOf(aOldSQLFieldName);

    if (liPosition > -1) then
      lFieldNames.Delete(liPosition);

    {Now look for conflicts with new name}
    liPosition := lFieldNames.IndexOf(lsSQLFieldName);

    if (liPosition > -1) or (IsSQLReservedWord(lsSQLFieldName)) then
      begin
        liIncrement := 2;

        {Limit Alias length as appropriate}
        while (Length(lsSQLFieldName) > aMaxSQLFieldNameLength - 2) do
          Delete(lsSQLFieldName, Length(lsSQLFieldName), 1);

        while (liPosition > -1) or (IsSQLReservedWord(aNewSQLFieldName)) do
          begin
            if (liIncrement < 10) then
              lsIncrement := '_' + IntToStr(liIncrement)
            else
              lsIncrement := IntToStr(liIncrement);
              
            aNewSQLFieldName := lsSQLFieldName + lsIncrement;

            liPosition := lFieldNames.IndexOf(aNewSQLFieldName);

            Inc(liIncrement);
          end;

      end;
  finally
    lFieldNames.Free;
  end;

end; {procedure, ValidateSQLFieldNames}

{*******************************************************************************
 *
 ** C H I L D
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaChild.Assign }

procedure TdaChild.Assign(Source: TPersistent);
begin

  {do call direct 'set' routine here, calling routine should set the Parent after calling assign}
  {SetTheChildType(TdaChild(Source).ChildType);}
  
end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaChild.GetSQL }

function TdaChild.GetSQL: TdaSQL;
begin
  if (Parent is TdaSQL) then
    Result := TdaSQL(Parent)

  else if (Owner is TdaSQL) then
    Result := TdaSQL(Owner)

  else if (Parent is TdaChild) then
    Result := TdaChild(Parent).GetSQL
  
  else
    Result := nil;
end; {function, GetSQL}

{------------------------------------------------------------------------------}
{ TdaChild.HasParent }

function TdaChild.HasParent: Boolean;
begin
  Result := True;
end; {function, HasParent}

{------------------------------------------------------------------------------}
{ TdaChild.Index }

function TdaChild.Index: Integer;
begin
  if (Parent <> nil) then
    Result := Parent.IndexOfChild(Self)
  else
    Result := -1;
end; {function, Index}

{------------------------------------------------------------------------------}
{ TdaChild.Index }

function TdaChild.EqualTo(aChild: TdaChild): Boolean;
begin
  Result := False;
end; {function, EqualTo}


{*******************************************************************************
 *
 ** T A B L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{TdaTable.AddChild}

procedure TdaTable.AddChild(aChild: TppRelative);
begin
  
  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    FTableJoins.Add(aChild)
  else
    inherited AddChild(aChild);
  
end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaTable.AddTableJoin }

function TdaTable.AddTableJoin(aTable: TdaTable; const aFieldName1, aFieldName2: String; aType: TdaJoinOperatorType): TdaTableJoin;
var
  lTableJoin: TdaTableJoin;
  lField1: TdaField;
  lField2: TdaField;
  lSQL: TdaSQL;
begin
  
  Result := nil;
  
  lSQL := GetSQL;
  
  if (lSQL = nil) then Exit;
  
  lTableJoin := TdaTableJoin.Create(Self);
  
  lTableJoin.Operator := aType;
  
  lField1 := lSQL.CreateFieldForTable(aTable, aFieldName1);
  lField2 := lSQL.CreateFieldForTable(Self, aFieldName2);
  
  if (lField1 <> nil) then
    begin
      lField1.ChildType := Ord(dactForeignField);
      lField1.Parent := lTableJoin;
    end;
  
  if (lField2 <> nil) then
    begin
      lField2.ChildType := Ord(dactLocalField);
      lField2.Parent := lTableJoin;
    end;
  
  lTableJoin.Parent := Self;
  
  Result := lTableJoin;
  
end; {function, AddTableJoin}


{------------------------------------------------------------------------------}
{TdaTable.Assign}

procedure TdaTable.Assign(Source: TPersistent);
var
  lSourceTable: TdaTable;
begin
  
  inherited Assign(Source);

  if not(Source is TdaTable) then Exit;
  
  Clear;
  
  lSourceTable := TdaTable(Source);
  
  FAlias  := lSourceTable.Alias;
  FTableAlias  := lSourceTable.TableAlias;
  FOwnerName := lSourceTable.OwnerName;
  FTableName := lSourceTable.TableName;
  FSQLAlias := lSourceTable.SQLAlias;
  FJoinType := lSourceTable.JoinType;
  FJoinTable := lSourceTable.JoinTable;
  
  daAssignChildren(lSourceTable.FTableJoins, Owner, Self);
  
end; {procedure, Assign}


{------------------------------------------------------------------------------}
{TdaTable.Clear}

procedure TdaTable.Clear;
begin
  
  FAlias := '';
  FOwnerName := '';
  FTableAlias := '';
  FTableName := '';
  FSQLAlias := '';
  FJoinType := dajtInner;
  FJoinTable := '';
  
  daFreeChildren(FTableJoins);
  
end; {procedure, Clear}


{------------------------------------------------------------------------------}
{TdaTable.Create}

constructor TdaTable.Create(aOwner: TComponent);
begin
  
  inherited Create(aOwner);
  
  ChildType := Ord(dactSelectTable);
  
  FJoinable := True;
  FJoinableTableNames := TStringList.Create;
  FTableJoins := TList.Create;
  
  Clear;
  
end; {constructor, Create}


{------------------------------------------------------------------------------}
{TdaTable.DataName}

function TdaTable.DataName: String;
var
  lSQL: TdaSQL;
  lsOwnerName: String;
  lsTableName: String;
begin
  
  lSQL := GetSQL;
  
  if (lSQL <> nil) and (Length(FOwnerName) > 0) then
    begin
      lsOwnerName := FOwnerName;
      lsTableName := FTableName;
  
      lSQL.NameToSQLString(lsOwnerName);
      lSQL.NameToSQLString(lsTableName);
  
      Result := lsOwnerName + '.' + lsTableName;
    end
  else
    begin
      lsTableName := GetRawTableName;
  
      lSQL.NameToSQLString(lsTableName);
  
      Result := lsTableName;
    end;
    
end; {function, DataName}


{------------------------------------------------------------------------------}
{TdaTable.Destroy}

destructor TdaTable.Destroy;
begin
  
  daFreeChildren(FTableJoins);
  
  FJoinableTableNames.Free;
  FTableJoins.Free;

  inherited Destroy;
  
end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{TdaTable.GetRawTableName}

function TdaTable.GetRawTableName: String;
begin
  if (Length(FOwnerName) > 0) then
    Result := FOwnerName + '.' + FTableName
  else
    Result := FTableName;
end; {function, GetRawTableName}


{------------------------------------------------------------------------------}
{TdaTable.GetTableJoin}

function TdaTable.GetTableJoin(aIndex: Integer): TdaTableJoin;
begin
  Result := TdaTableJoin(FTableJoins[aIndex]);
end; {function, GetTableJoin}


{------------------------------------------------------------------------------}
{TdaTable.GetTableJoinCount}

function TdaTable.GetTableJoinCount: Integer;
begin
  Result := FTableJoins.Count;
end; {function, GetTableJoinCount}


{------------------------------------------------------------------------------}
{TdaTable.IndexOfChild}

function TdaTable.IndexOfChild(aChild: TppRelative): Integer;
begin
  
  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    Result := FTableJoins.IndexOf(aChild)
  else
    Result := inherited IndexOfChild(aChild);
  
end; {function, IndexOfChild}


{------------------------------------------------------------------------------}
{TdaTable.IndexOfFirstJoinTable}

function TdaTable.IndexOfFirstJoinTable(aSQL: TdaSQL): Integer;
var
  liIndex: Integer;
  lsTableName: String;
begin
  
  if (aSQL.SelectTableCount > 0) and (aSQL.DataDictionary <> nil) and (aSQL.DataDictionary.AutoJoin) and not(aSQL.DataDictionary.AllowManualJoins) then
    begin
      Result := -1;
  
      if not(FJoinable) then Exit;
      
      liIndex := aSQL.SelectTableCount - 1;
  
      while (Result = -1) and (liIndex <> -1) do
        begin
          lsTableName := aSQL.SelectTables[liIndex].RawTableName;
  
          if (FJoinableTableNames.IndexOf(lsTableName) <> -1) then
            Result := liIndex
          else
            Dec(liIndex);
        end;
    end
  else
    begin
      if (aSQL.SelectTableCount > 0) then
        Result := aSQL.SelectTableCount - 1
      else
        Result := -1;
    end;
  
end; {function, IndexOfFirstJoinTable}


{------------------------------------------------------------------------------}
{TdaTable.InsertChild}

procedure TdaTable.InsertChild(aPosition: Integer; aChild: TppRelative);
begin
  
  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    FTableJoins.Insert(aPosition, aChild)
  else
    inherited InsertChild(aPosition, aChild);
  
end; {procedure, InsertChild}


{------------------------------------------------------------------------------}
{TdaTable.JoinFieldNames1}

function TdaTable.JoinFieldNames1: String;
var
  liIndex: Integer;
  lJoin: TdaTableJoin;
begin
  
  Result := '';
  
  for liIndex := 0 to FTableJoins.Count - 1 do
    begin
      lJoin := TdaTableJoin(FTableJoins[liIndex]);
  
      Result := Result + lJoin.LocalField.FieldName;
  
      if (liIndex < FTableJoins.Count - 1) then
        Result := Result + ',';
    end;
  
end; {function, JoinFieldNames1}


{------------------------------------------------------------------------------}
{TdaTable.JoinFieldNames2}

function TdaTable.JoinFieldNames2: String;
var
  liIndex: Integer;
  lJoin: TdaTableJoin;
begin
  
  Result := '';
  
  for liIndex := 0 to FTableJoins.Count - 1 do
    begin
      lJoin := TdaTableJoin(FTableJoins[liIndex]);
  
      Result := Result + lJoin.ForeignField.FieldName;
  
      if (liIndex < FTableJoins.Count - 1) then
        Result := Result + ',';
    end;
  
end; {function, JoinFieldNames2}


{------------------------------------------------------------------------------}
{TdaTable.JoinOperators}

function TdaTable.JoinOperators: String;
var
  liIndex: Integer;
  lJoin: TdaTableJoin;
begin
  
  Result := '';
  
  for liIndex := 0 to FTableJoins.Count - 1 do
    begin
      lJoin := TdaTableJoin(FTableJoins[liIndex]);
  
      Result := Result + daJoinOperatorToString(lJoin.Operator);
  
      if (liIndex < FTableJoins.Count - 1) then
        Result := Result + ',';
    end;
  
end; {function, JoinOperators}


{------------------------------------------------------------------------------}
{TdaTable.JoinTableSQLAlias}

function TdaTable.JoinTableSQLAlias: String;
begin
  if (TableJoinCount > 0) then
    Result := TableJoins[0].ForeignField.TableSQLAlias
  else
    Result := '';
end; {function, JoinTableSQLAlias}


{------------------------------------------------------------------------------}
{TdaTable.JoinTypeDesc}

function TdaTable.JoinTypeDesc: String;
begin
  Result := daGetJoinDesc(FJoinType);
end; {function, JoinTypeDesc}


{------------------------------------------------------------------------------}
{TdaTable.JoinTypeString}

function TdaTable.JoinTypeString: String;
begin
  Result := daJoinTypeToString(FJoinType);
end; {function, JoinTypeString}


{------------------------------------------------------------------------------}
{TdaTable.Loaded}

procedure TdaTable.Loaded;
begin
  
  inherited Loaded;
  
  if (FAlias = '') then
    FAlias := FTableAlias;
  
end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{TdaTable.RemoveChild}

function TdaTable.RemoveChild(aChild: TppRelative): Integer;
var
  liIndex: Integer;
begin
  
  liIndex := IndexOfChild(aChild);
  
  Result := liIndex;
  
  if (liIndex = -1) then Exit;
  
  if (TdaChildType(aChild.ChildType) = dactTableJoin) then
    FTableJoins.Delete(liIndex)
  else
    Result := inherited RemoveChild(aChild);
  
end; {function, RemoveChild}


{------------------------------------------------------------------------------}
{TdaTable.SaveComponents}

procedure TdaTable.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin
  
  inherited SaveComponents(Proc);
  
  for liIndex := 0 to (FTableJoins.Count - 1) do
    Proc(FTableJoins[liIndex]);
  
end; {procedure, SaveComponents}


{------------------------------------------------------------------------------}
{TdaTable.SetRawTableName}

procedure TdaTable.SetRawTableName(const aTableName: String);
var
  lsTable: String;
  lsOwner: String;
  lbFileBased: Boolean;
begin

  ppStripOffTableName(aTableName, lsTable, lsOwner, lbFileBased);

  if (lbFileBased) then
    begin
      FOwnerName := '';
      FTableName := lsTable + '.' + lsOwner;
    end
  else
    begin
      FOwnerName := lsOwner;
      FTableName := lsTable;
    end;

end; {procedure, SetRawTableName}


{------------------------------------------------------------------------------}
{TdaTable.SQLJoinTypeDesc}

function TdaTable.SQLJoinTypeDesc: String;
var
  lSQL: TdaSQL;
begin
  
  lSQL := GetSQL;
  
  if (lSQL <> nil) and (lSQL.SQLType = sqSQL1) then
    begin
      case FJoinType of
        dajtNone:       Result := '';
        dajtInner:      Result := '';
        dajtOuter:      Result := '*=*';
        dajtLeftOuter:  Result := '*=';
        dajtRightOuter: Result := '=*';
      end;
    end
  else
    begin
      case FJoinType of
        dajtNone:       Result := '';
        dajtInner:      Result := 'INNER JOIN';
        dajtOuter:      Result := 'FULL OUTER JOIN';
        dajtLeftOuter:  Result := 'LEFT OUTER JOIN';
        dajtRightOuter: Result := 'RIGHT OUTER JOIN';
      end;
    end;
  
end; {function, SQLJoinTypeDesc}


{------------------------------------------------------------------------------}
{TdaTable.SQLText}

function TdaTable.SQLText: String;
var
  lsTableName: String;
  lsOwnerName: String;
  lsSQLAlias: String;
  lSQL: TdaSQL;
begin
  
  lSQL := GetSQL;
  
  lsOwnerName := FOwnerName;
  lsTableName := FTableName;
  lsSQLAlias := FSQLAlias;
  
  if (lSQL <> nil) and (lSQL.SQLType = sqBDELocal) then
    begin
      lSQL.NameToSQLString(lsSQLAlias);
  
      Result := '"' + lsTableName + '"' + ' ' + lsSQLAlias
    end
  
  else
    begin
      lSQL.NameToSQLString(lsOwnerName);
      lSQL.NameToSQLString(lsTableName);
      lSQL.NameToSQLString(lsSQLAlias);
  
      if (Length(lsOwnerName) > 0) then
        Result := lsOwnerName + '.' + lsTableName + ' ' + lsSQLAlias
      else
        Result := lsTableName + ' ' + lsSQLAlias;
    end;
  
end; {function, SQLText}


{------------------------------------------------------------------------------}
{TdaTable.UpdateJoinable}

procedure TdaTable.UpdateJoinable(aSelectedTables: TStrings);
var
  lbFound: Boolean;
  liIndex: Integer;
  lsTableName: String;
begin
  
  if (aSelectedTables.Count = 0) then
    FJoinable := True
  
  else if (FJoinableTableNames.Count = 0) then
    FJoinable := False
  
  else if (aSelectedTables.IndexOf(RawTableName) <> -1) then
    begin
      if (FJoinableTableNames.IndexOf(RawTableName) = -1) then
        FJoinable := False
      else
        FJoinable := True;
    end
  
  else
    begin
      lbFound := False;
      liIndex := 0;
  
      while not(lbFound) and (liIndex < aSelectedTables.Count) do
        begin
          lsTableName := aSelectedTables[liIndex];
  
          if (FJoinableTableNames.IndexOf(lsTableName) <> -1) then
            lbFound := True
          else
            Inc(liIndex);
  
        end;
        
      FJoinable := lbFound;
    end;
  
  
end; {procedure, UpdateJoinable}

{*******************************************************************************
 *
 ** F I E L D 
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaField.Create }

constructor TdaField.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactSelectField);

  Clear;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaField.Destroy }

destructor TdaField.Destroy;
begin

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaField.Assign }

procedure TdaField.Assign(Source: TPersistent);
var
  lSourceField: TdaField;
begin
  
  inherited Assign(Source);
  
  if not(Source is TdaField) then Exit;
  
  lSourceField := TdaField(Source);
  
  FAlias         := lSourceField.Alias;
  FAscending     := lSourceField.Ascending;
  FAutoSearch    := lSourceField.AutoSearch;
  FDataType      := lSourceField.DataType;
  FDisplayFormat := lSourceField.DisplayFormat;
  FDisplayWidth  := lSourceField.DisplayWidth;
  FFieldAlias    := lSourceField.FieldAlias;
  FFieldLength   := lSourceField.FieldLength;
  FFieldName     := lSourceField.FieldName;
  FLinkable      := lSourceField.Linkable;
  FLinkColor     := lSourceField.LinkColor;
  FLinkCount     := lSourceField.LinkCount;
  FMandatory     := lSourceField.Mandatory;
  FSelectable    := lSourceField.Selectable;
  FSearchable    := lSourceField.Searchable;
  FShowAllValues := lSourceField.ShowAllValues;
  FSortable      := lSourceField.Sortable;
  FSQLFieldName  := lSourceField.SQLFieldName;
  FTableAlias    := lSourceField.TableAlias;
  FTableName     := lSourceField.TableName;
  FTableSQLAlias := lSourceField.TableSQLAlias;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaField.Clear }

procedure TdaField.Clear;
begin

  FAlias := '';
  FAscending := True;
  FAutoSearch := False;
  FDataType := dtString;
  FDisplayFormat := '';
  FDisplayWidth := 0;
  FFieldAlias := '';
  FFieldLength := 0;
  FFieldName := '';
  FLinkable := True;
  FLinkColor := 0;
  FLinkCount := 0;
  FMandatory := False;
  FSearchable := True;
  FSelectable := True;
  FSelectAll := False;
  FShowAllValues := False;
  FSortable := True;
  FSQLFieldName := '';
  FTableAlias := '';
  FTableName := '';
  FTablesQLAlias := '';

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaField.Index }

function TdaField.EqualTo(aChild: TdaChild): Boolean;
var
  lCompareField: TdaField;
begin

  lCompareField := TdaField(aChild);

  Result := (FAlias = lCompareField.Alias) and
            (FAscending = lCompareField.Ascending) and
            (FAutoSearch = lCompareField.AutoSearch) and
            (FDataType = lCompareField.DataType) and
            (FDisplayFormat = lCompareField.DisplayFormat) and
            (FDisplayWidth = lCompareField.DisplayWidth) and
            (FFieldAlias = lCompareField.FieldAlias) and
            (FFieldLength = lCompareField.FieldLength) and
            (FFieldName = lCompareField.FieldName) and
            (FMandatory = lCompareField.Mandatory) and
            (FSelectable = lCompareField.Selectable) and
            (FSearchable = lCompareField.Searchable) and
            (FShowAllValues = lCompareField.ShowAllValues) and
            (FSortable = lCompareField.Sortable) and
            (FSQLFieldName  = lCompareField.SQLFieldName) and
            (FTableAlias = lCompareField.TableAlias) and
            (FTableName = lCompareField.TableName) and
            (FTablesQLAlias = lCompareField.TableSQLAlias);

end; {function, EqualTo}


{------------------------------------------------------------------------------}
{ TdaField.SetAlias }

procedure TdaField.SetAlias(const aValue: String);
begin
  FAlias := aValue;
end; {procedure, SetAlias}


{------------------------------------------------------------------------------}
{ TdaField.SetDataType }

procedure TdaField.SetDataType(aDataType: TppDataType);
begin

  FDataType := aDataType;

  FLinkable := FDataType in [dtBoolean,
                             dtDate,
                             dtTime,
                             dtDateTime,
                             dtInteger,
                             dtSingle,
                             dtDouble,
                             dtExtended,
                             dtCurrency,
                             dtChar,
                             dtString,
                             dtLongint]

end; {procedure, SetDataType}

{------------------------------------------------------------------------------}
{ TdaField.SetLinkColor }

procedure TdaField.SetLinkColor(aColor: TColor);
begin

  if (csReading in ComponentState) then
    FLinkColor := aColor

  else
    begin
      if (aColor = 0) and (FLinkCount > 0) then
        Dec(FLinkCount);

       if (FLinkCount = 0) then
         FLinkColor := aColor;

       if (aColor <> 0) then
         Inc(FLinkCount);
    end;

end; {procedure, SetLinkColor}

{------------------------------------------------------------------------------}
{ TdaField.GetDescription }

function TdaField.GetDescription: String;
begin
  Result := TableAlias + '.' + FieldAlias + ' ' + OrderByDesc;
end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TdaField.OrderByDesc }

function TdaField.OrderByDesc: String;
begin

  Result := '';

  if (ChildType <> Ord(dactOrderByField)) then Exit;

  if not(Ascending) then
    Result := '(' + ppLoadStr(752) + ')'; {Descending}

end; {function, OrderByDesc}

{------------------------------------------------------------------------------}
{ TdaField.LimitedSQLString }

function TdaField.LimitedSQLString: String;
var
  lsTable: String;
  lsField: String;
  lSQL: TdaSQL;
begin
  
  if (FTableSQLAlias = '') or (FFieldName = '') then Exit;
  
  lSQL := GetSQL;

  lsTable := FTableSQLAlias;
  lsField := FFieldName;
  
  lSQL.NameToSQLString(lsTable);
  lSQL.NameToSQLString(lsField);
  
  Result := lsTable + '.' + lsField;

end; {function, LimitedSQLString}

{------------------------------------------------------------------------------}
{ TdaField.SQLString }

function TdaField.SQLString: String;
var
  lsTable: String;
  lsField: String;
  lSQL: TdaSQL;
  lsAliasOperator: String;
begin

  if (FTableSQLAlias = '') or (FFieldName = '') then Exit;
  
  lSQL := GetSQL;
  
  lsTable := FTableSQLAlias;
  lsField := FFieldName;
  
  lSQL.NameToSQLString(lsTable);
  lSQL.NameToSQLString(lsField);
  
  Result := lsTable + '.' + lsField;

  {if the SQLField name is not the same as the FieldName, this field needs to be aliased}
  if (lSQL.IsMSAccess) then
    lsAliasOperator := ' AS '
  else
    lsAliasOperator := ' ';

  if (Length(FSQLFieldName) <> 0) and (FSQLFieldName <> FFieldName) then
    Result := Result + lsAliasOperator + FSQLFieldName;

end; {function, SQLString}


{*******************************************************************************
 *
 ** C A L C U L A T I O N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCalculation.Create }

constructor TdaCalculation.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactCalcField);

  Clear;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaCalculation.Assign }

procedure TdaCalculation.Assign(Source: TPersistent);
var
  lSource: TdaCalculation;
begin
  
  inherited Assign(Source);

  Linkable := False;

  if not(Source is TdaCalculation) then Exit;

  lSource := TdaCalculation(Source);

  FCalcType := lSource.CalcType;
  FExpression := lSource.Expression;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaCalculation.EqualTo }

function TdaCalculation.EqualTo(aChild: TdaChild): Boolean;
var
  lCompareCalc: TdaCalculation;
begin

  Result := inherited EqualTo(aChild);

  if not(Result) then Exit;

  lCompareCalc := TdaCalculation(aChild);

  Result := (FCalcType = lCompareCalc.CalcType) and
            (FExpression = lCompareCalc.Expression);

end; {function, EqualTo}

{------------------------------------------------------------------------------}
{ TdaCalculation.Clear }

procedure TdaCalculation.Clear;
begin

  inherited Clear;

  Linkable := False;

  FCalcType := dacaSum;
  FExpression := '';
  
end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TdaCalculation.FunctionDesc }

function TdaCalculation.FunctionDesc: String;
begin
  Result := daGetCalcDesc(FCalcType);
end; {function, FunctionDesc}

{------------------------------------------------------------------------------}
{ TdaCalculation.GetCalcFieldAlias }

function TdaCalculation.GetCalcFieldAlias: String;
begin

  Result := '';

  if (CalcType = dacaCount) then
    Result := ppLoadStr(740) + '(*)' {Count(*)}

  else if (CalcType = dacaExpression) then
    Result := FExpression
  
  else
    Result := daGetCalcDesc(CalcType) + '(' + FieldAlias + ')';
  
end; {function, GetCalcFieldAlias}

{------------------------------------------------------------------------------}
{ TdaCalculation.GetDescription }

function TdaCalculation.GetDescription: String;
begin
  
  {build text description of field}
  if (CalcType = dacaCount) then
    Result := ppLoadStr(740) + '(*)' {Count(*)}
  else if (CalcType = dacaExpression) then
    Result := FExpression
  else
    Result := daGetCalcDesc(CalcType) + '(' + TableAlias + '.' + FieldAlias + ')';
  
  Result := Result + ' ' + OrderByDesc;
  
end; {function, GetDescription}

{------------------------------------------------------------------------------}
{ TdaCalculation.SetDataType }

procedure TdaCalculation.SetDataType(aDataType: TppDataType);
begin

  inherited SetDataType(aDataType);

  Linkable := False;

  GenerateSQLFieldName;

end; {procedure, SetDataType}


{------------------------------------------------------------------------------}
{ TdaCalculation.SetAlias }

procedure TdaCalculation.SetAlias(const aValue: String);
begin

  inherited SetAlias(aValue);

  GenerateSQLFieldName;

end; {procedure, SetAlias}


{------------------------------------------------------------------------------}
{ TdaCalculation.SetCalcType }

procedure TdaCalculation.SetCalcType(aCalcType: TdaCalcType);
begin

  FCalcType := aCalcType;

  if (csLoading in ComponentState) or (csReading in ComponentState) then Exit;

  if Assigned(FOnCalcTypeChange) then FOnCalcTypeChange(Self);

end; {procedure, SetCalcType}


{------------------------------------------------------------------------------}
{ TdaCalculation.GenerateSQLFieldName }

procedure TdaCalculation.GenerateSQLFieldName;
var
  lSQL: TdaSQL;
begin

  lSQL := GetSQL;

  SQLFieldName := lSQL.GetMagicAlias(Self);

end; {procedure, GenerateSQLFieldName}


{------------------------------------------------------------------------------}
{ TdaCalculation.SQLString }

function TdaCalculation.SQLString: String;
var
  lSQL: TdaSQL;
  lsAliasOperator: String;
begin

  Result := LimitedSQLString;

  case FCalcType of
    dacaCount: Result := 'COUNT(*)';
    dacaAvg:   Result := 'AVG(' + Result + ')';
    dacaSum:   Result := 'SUM(' + Result + ')';
    dacaMin:   Result := 'MIN(' + Result + ')';
    dacaMax:   Result := 'MAX(' + Result + ')';
    dacaExpression: Result := FExpression;
  end;

  lSQL := GetSQL;

  {if the SQLField name is not the same as the FieldName, this field needs to be aliased}
  if (lSQL.IsMSAccess) then
    lsAliasOperator := ' AS '
  else
    lsAliasOperator := ' ';

  if (Length(FSQLFieldName) <> 0) and (FSQLFieldName <> FFieldName) then
    Result := Result + lsAliasOperator + FSQLFieldName

end; {function, SQLString}


{*******************************************************************************
 *
 ** C R I T E R I A
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCriteria.Create }

constructor TdaCriteria.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  ChildType := Ord(dactCriteria);
  
  FCaseSensitive := True;
  FContainsFieldName := False;
  FCriteriaType := dacrField;
  FField := nil;
  FOperator := dacoEqual;
  FValue := '';
  FLevel := 0;
  FNumericValues := TList.Create;
  FNumericValuesOutOfSync := False;
  FOldShowAllValues := False;
  
end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaCriteria.Destroy }

destructor TdaCriteria.Destroy;
begin

  FreeNumericValues;

  FNumericValues.Free;
  FField.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaCriteria.DefineProperties }

procedure TdaCriteria.DefineProperties(Filer: TFiler);
begin

  inherited DefineProperties(Filer);

  {conversion to 5.1}
  Filer.DefineProperty('ShowAllValues', ReadShowAllValues, nil, False);

end; {constructor, DefineProperties}

{------------------------------------------------------------------------------}
{ TdaCriteria.ReadShowAllValues }

procedure TdaCriteria.ReadShowAllValues(Reader: TReader);
begin
  FOldShowAllValues := Reader.ReadBoolean;
end; {procedure, ReadShowAllValues}

{------------------------------------------------------------------------------}
{ TdaCriteria.AddChild }

procedure TdaCriteria.AddChild(aChild: TppRelative);
begin

  if (aChild is TdaField) then
    begin
      FField.Free;

      FField := TdaField(aChild);
    end

  else if (aChild is TdaNumericValue) then
    FNumericValues.Add(aChild)

  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaCriteria.RemoveChild }

function TdaCriteria.RemoveChild(aChild: TppRelative): Integer;
begin

  if (FField = aChild) then
    begin
      FField := nil;

      Result := 0;
    end

  else if (aChild is TdaNumericValue) then
    Result := FNumericValues.Remove(aChild)

  else
    Result := inherited RemoveChild(aChild);

end; {function, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaCriteria.SaveComponents }

procedure TdaCriteria.SaveComponents(Proc: TGetChildProc);
var
  liIndex: Integer;
begin

  inherited SaveComponents(Proc);

  if (FField <> nil) then
    Proc(FField);

  for liIndex := 0 to FNumericValues.Count - 1 do
    Proc(FNumericValues[liIndex]);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaCriteria.Loaded }

procedure TdaCriteria.Loaded;
var
  liIndex: Integer;
  ldValue: Double;
begin
  
  inherited Loaded;

  
  if IsNumeric and (Length(FValue) > 0) and (FNumericValues.Count = 0) and not(FContainsFieldName)  then
    begin
      FNumericValuesOutOfSync := True;
  
      UpdateNumericValues;

      {update string version of criteria}
      FValue := '';

      for liIndex := 0 to FNumericValues.Count - 1 do
        begin
          if (Length(FValue) > 0) then
            FValue := FValue + ',';

          ldValue := TdaNumericValue(FNumericValues[liIndex]).Value;

          if (FField.DataType in [dtDate]) then
             FValue := FValue + DateToStr(ldValue)

          else if (FField.DataType in [dtDateTime]) then
            FValue := FValue + DateTimeToStr(ldValue)

          else if (FField.DataType = dtInteger) then
            FValue := FValue + IntToStr(Trunc(ldValue))

          else if (FField.DataType in dacaNumerics) then
            FValue := FValue + FloatToStr(ldValue);

        end;
    end;
  

end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TdaCriteria.Assign }

procedure TdaCriteria.Assign(Source: TPersistent);
var
  lSourceCriteria: TdaCriteria;
  lField: TdaField;
  lClass: TdaChildClass;
begin

  inherited Assign(Source);

  if not(Source is TdaCriteria) then Exit;

  lSourceCriteria := TdaCriteria(Source);

  FCaseSensitive := lSourceCriteria.CaseSensitive;
  FContainsFieldName := lSourceCriteria.ContainsFieldName;
  FCriteriaType := lSourceCriteria.CriteriaType;
  FExpression := lSourceCriteria.Expression;
  FOperator := lSourceCriteria.Operator;
  FValue := lSourceCriteria.Value;

  if (FField <> nil) then
    FField.Free;

  if (lSourceCriteria.Field <> nil) then
    begin
      lClass := TdaChildClass(lSourceCriteria.Field.ClassType);

      lField := TdaField(lClass.Create(Self));
      lField.Assign(lSourceCriteria.Field);
      lField.ChildType := lSourceCriteria.Field.ChildType;
      lField.Parent := Self;
    end;

end; {procedure, Assign}

{------------------------------------------------------------------------------}
{ TdaCriteria.EqualTo }

function TdaCriteria.EqualTo(aChild: TdaChild): Boolean;
var
  lCompareCriteria: TdaCriteria;
begin

  Result := inherited EqualTo(aChild);

  if not(Result) then Exit;

  lCompareCriteria := TdaCriteria(aChild);

  Result := lCompareCriteria.Field.EqualTo(FField) and
            (FCaseSensitive = lCompareCriteria.CaseSensitive) and
            (FCriteriaType = lCompareCriteria.CriteriaType) and
            (FOperator = lCompareCriteria.Operator) and
            (FValue = lCompareCriteria.Value);

end; {function, EqualTo}

{------------------------------------------------------------------------------}
{ TdaCriteria.Description }

function TdaCriteria.Description: String;
begin

  case FCriteriaType of
    dacrField:  Result := FField.Description + ' ' + OperatorDesc + ' ' + FValue;
    dacrBegin:  Result := ppLoadStr(731); {begin}
    dacrEnd:    Result := ppLoadStr(758); {end}
    dacrOR:     Result := ppLoadStr(803); {OR}
    dacrNOT:    Result := ppLoadStr(794); {NOT}
  end;

end; {function, Description}

{------------------------------------------------------------------------------}
{ TdaCriteria.AutoSearchDesc }

function TdaCriteria.AutoSearchDesc: String;
begin
  if (FField <> nil) and (FField.AutoSearch) then
    Result := 'Yes'
  else
    Result := '';
end; {function, AutoSearchDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.ShowAllDesc }

function TdaCriteria.ShowAllDesc: String;
begin
  if (FField <> nil) and (FField.ShowAllValues) then
    Result := 'Yes'
  else
    Result := '';
end; {function, ShowAllDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.MandatoryDesc }

function TdaCriteria.MandatoryDesc: String;
begin
  if (FField <> nil) and (FField.Mandatory) then
    Result := 'Yes'
  else
    Result := '';
end; {function, MandatoryDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.OperatorDesc }

function TdaCriteria.OperatorDesc: String;
begin
  Result := daGetOperatorDesc(FOperator);
end; {function, OperatorDesc}

{------------------------------------------------------------------------------}
{ TdaCriteria.IsExpression }

function TdaCriteria.IsExpression: Boolean;
begin
  Result := (FExpression <> '');
end; {function, IsExpression}

{------------------------------------------------------------------------------}
{ TdaCriteria.IsNumeric }

function TdaCriteria.IsNumeric: Boolean;
begin
  Result := (FField <> nil) and ((FField.DataType in dacaNumerics) or (FField.DataType in [dtDate, dtDateTime]));
end; {function, IsNumeric}

{------------------------------------------------------------------------------}
{ TdaCriteria.GetValue }

function TdaCriteria.GetValue: String;
begin

  Result := FValue;

  if (csWriting in ComponentState) or (csDestroying in ComponentState) then Exit;

  if not(FContainsFieldName) then
    UpdateNumericValues;

end; {function, GetValue}

{------------------------------------------------------------------------------}
{ TdaCriteria.SetValue }

procedure TdaCriteria.SetValue(const aValue: String);
begin
  
  FValue := aValue;
  
  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  FContainsFieldName := GetSQL.ContainsFieldName(FValue);

  if IsNumeric and not(FContainsFieldName) then
    FNumericValuesOutOfSync := True;

end; {procedure, SetValue}


{------------------------------------------------------------------------------}
{ TdaCriteria.SetExpression }

procedure TdaCriteria.SetExpression(const aValue: String);
begin

  if (aValue <> FExpression) then
    if (ExpressionIsFieldName(aValue)) then
      begin
        if (UpperCase(aValue) <> UpperCase(FField.LimitedSQLString)) then
          AssignNewField(aValue);

        FExpression := '';
      end

    else
      FExpression := aValue;

end; {procedure, SetExpression}

{------------------------------------------------------------------------------}
{ TdaCriteria.AssignNewField }

procedure TdaCriteria.AssignNewField(const aLtdSQLString: String);
var
  lField: TdaField;
  lField2: TdaField;
  lSQL: TdaSQL;
  lOldField: TdaField;
begin

  lOldField := nil;
  lSQL := GetSQL;

  if (FField <> nil) then
    begin
      lOldField := TdaField.Create(nil);
      lOldField.Assign(FField);

      FField.Free;
    end;

  lField := lSQL.GetAvailableFieldForLtdSQLString(aLtdSQLString);

  if (lField is TdaCalculation) then
    lField2 := TdaCalculation.Create(Self)

  else
    lField2 := TdaField.Create(Self);

  lField2.Assign(lField);

  if (lOldField <> nil) then
    begin
      lField2.AutoSearch := lOldField.AutoSearch;
      lField2.Mandatory := lOldField.Mandatory;
      lField2.ShowAllValues := lOldField.ShowAllValues
    end;

  lField2.Parent := Self;

end; {procedure, AssignNewField}

{------------------------------------------------------------------------------}
{ TdaCriteria.AddNumericValue }

procedure TdaCriteria.AddNumericValue(const aValue: String);
var
  lNumericValue: TdaNumericValue;
  ldValue: Double;
begin

  if (FField = nil) or not(IsNumeric) then Exit;

  if (FField.DataType in [dtDate, dtDateTime]) then
      try
        ldValue := ppStrToDateTime(aValue)
      except on EConvertError do
        ldValue := Now;
      end

  else if (FField.DataType in [dtInteger]) then
      try
        ldValue := StrToInt(aValue)
      except on EConvertError do
        ldValue := 0;
      end

  else if (FField.DataType in dacaNumerics) then
      try
        ldValue := StrToFloat(aValue)
      except on EConvertError do
        ldValue := 0;
      end

  else
    ldValue := 0;

  lNumericValue := TdaNumericValue.Create(Self);
  lNumericValue.Value := ldValue;
  lNumericValue.Parent := Self;

end; {procedure, AddNumericValue}

{------------------------------------------------------------------------------}
{ TdaCriteria.UpdateNumericValues }

procedure TdaCriteria.UpdateNumericValues;
var
  liIndex: Integer;
  lsValue: String;
  lValues: TStrings;
begin

  if not(FNumericValuesOutOfSync) then Exit;

  FNumericValuesOutOfSync := False;

  FreeNumericValues;

  if not(IsNumeric) then Exit;

  lValues := TStringList.Create;

  ppParseString(FValue, lValues);

  for liIndex := 0 to lValues.Count - 1 do
    begin
      lsValue := lValues[liIndex];

      AddNumericValue(lsValue);
    end;

  lValues.Free;

end; {procedure, UpdateNumericValues}

{------------------------------------------------------------------------------}
{ TdaCriteria.FreeNumericValues }

procedure TdaCriteria.FreeNumericValues;
var
  liIndex: Integer;
begin

  for liIndex := 0 to FNumericValues.Count - 1 do
    TObject(FNumericValues[0]).Free;

  FNumericValues.Clear;

end; {procedure, FreeNumericValues}


{------------------------------------------------------------------------------}
{ TdaCriteria.FreeNumericValues }

function TdaCriteria.ExpressionIsFieldName(const aValue: String): Boolean;
var
  lSQL: TdaSQL;
  liIndex: Integer;
begin

  Result := False;

  lSQL := GetSQL;

  liIndex := 0;

  while not(Result) and (liIndex < lSQL.SelectFieldCount) do
    if (UpperCase(aValue) = UpperCase(lSQL.SelectFields[liIndex].LimitedSQLString)) then
      Result := True
    else
      Inc(liIndex);

end; {procedure, FreeNumericValues}



{*******************************************************************************
 *
 ** T A B L E J O I N
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{TdaTableJoin.AddChild}

procedure TdaTableJoin.AddChild(aChild: TppRelative);
begin

  case TdaChildType(aChild.ChildType) of

    dactLocalField:
      begin
        FLocalField.Free;

        FLocalField := TdaField(aChild);
      end;

    dactForeignField:
      begin
        FForeignField.Free;
  
        FForeignField := TdaField(aChild);
      end;
  
  end;
  
end; {procedure, AddChild}


{------------------------------------------------------------------------------}
{TdaTableJoin.Assign}

procedure TdaTableJoin.Assign(Source: TPersistent);
var
  lSourceTableJoin: TdaTableJoin;
  lField: TdaField;
begin
  
  inherited Assign(Source);
  
  if not(Source is TdaTableJoin) then Exit;
  
  lSourceTableJoin := TdaTableJoin(Source);
  
  FOperator := lSourceTableJoin.Operator;
  
  FForeignField.Free;
  FLocalField.Free;
  
  lField := TdaField.Create(Owner);
  lField.Assign(lSourceTableJoin.ForeignField);
  lField.ChildType := Ord(dactForeignField);
  lField.Parent := Self;
  
  lField := TdaField.Create(Owner);
  lField.Assign(lSourceTableJoin.LocalField);
  lField.ChildType := Ord(dactLocalField);
  lField.Parent := Self;
  
end; {procedure, Assign}


{------------------------------------------------------------------------------}
{TdaTableJoin.Create}

constructor TdaTableJoin.Create(aOwner: TComponent);
begin
  
  inherited Create(aOwner);
  
  ChildType := Ord(dactTableJoin);
  
  FForeignField := nil;
  FLocalField := nil;
  
  FOperator := dajoEqual;
  
end; {constructor, Create}


{------------------------------------------------------------------------------}
{TdaTableJoin.Destroy}

destructor TdaTableJoin.Destroy;
begin
  
  FForeignField.Free;
  FLocalField.Free;
  
  inherited Destroy;
  
end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{TdaTableJoin.RemoveChild}

function TdaTableJoin.RemoveChild(aChild: TppRelative): Integer;
begin
  
  Result := 0;
  
  if (FLocalField = aChild) then
    FLocalField := nil
  
  else if (FForeignField = aChild) then
    FForeignField := nil
  
  else
    Result := inherited RemoveChild(aChild);
  
end; {function, RemoveChild}


{------------------------------------------------------------------------------}
{TdaTableJoin.SaveComponents}

procedure TdaTableJoin.SaveComponents(Proc: TGetChildProc);
begin
  
  inherited SaveComponents(Proc);
  
  if (FLocalField <> nil) then
    Proc(FLocalField);
  
  if (FForeignField <> nil) then
    Proc(FForeignField);
  
end; {procedure, SaveComponents}


{******************************************************************************
 *
 ** G E N E R A L   P R O C E D U R E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ daInvalidChar }

function daInvalidChar(const aName: String): Integer;
begin

  Result := 0;

  if (Length(aName) > 0) and (StrToIntDef(aName[1], -1) in [0..9]) then
    Result := 1

  else
    begin
      if (Result = 0) then Result := Pos(' ', aName);
      if (Result = 0) then Result := Pos('/', aName);
      if (Result = 0) then Result := Pos('.', aName);
      if (Result = 0) then Result := Pos(',', aName);
      if (Result = 0) then Result := Pos('-', aName);
    end;
end; {function, daInvalidChar}

{------------------------------------------------------------------------------}
{ daContainsInvalidChars }

function daContainsInvalidChars(const aFieldName: String): Boolean;
begin

  Result := (daInvalidChar(aFieldName) <> 0);

  if not(Result) and (Length(aFieldName) > 0) then Result := (aFieldName[1] = '_');

end; {function, daContainsInvalidChars}

{------------------------------------------------------------------------------}
{ daRestoreAvailableTable }

function daRestoreAvailableTable(aTable: TdaTable; aAvailableTables, aAvailableTableList: TList): TdaTable;
var
  liPosition: Integer;
  liPosition2: Integer;
  lTable: TdaTable;
  lTable2: TdaTable;
  liIndex: Integer;
  lbFound: Boolean;
begin

  Result := nil;

  liPosition := daFindTable(aTable, aAvailableTables);

  if (liPosition = -1) then Exit;

  lTable := TdaTable(aAvailableTables[liPosition]);

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aAvailableTableList.Count) do
    begin
      lTable2 := TdaTable(aAvailableTableList[liIndex]);

      liPosition2 := daFindTable(lTable2, aAvailableTables);

      if (liPosition2 > liPosition) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  lTable.Tag := liIndex;

  aAvailableTableList.Insert(liIndex, lTable);

  Result := lTable;

end; {procedure, daRestoreAvailableTable}

{------------------------------------------------------------------------------}
{ daRestoreAvailableField }

function daRestoreAvailableField(aField: TdaField; aAvailableFields, aAvailableFieldList: TList): TdaField;
var
  liPosition: Integer;
  liPosition2: Integer;
  lField: TdaField;
  lField2: TdaField;
  liIndex: Integer;
  lbFound: Boolean;
begin

  Result := nil;

  liPosition := daFindField(aField, aAvailableFields);

  if (liPosition = -1) then Exit;

  lField := TdaField(aAvailableFields[liPosition]);

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aAvailableFieldList.Count) do
    begin
      lField2 := TdaField(aAvailableFieldList[liIndex]);

      liPosition2 := daFindField(lField2, aAvailableFields);

      if (liPosition2 > liPosition) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  lField.Tag := liIndex;

  aAvailableFieldList.Insert(liIndex, lField);

  Result := lField;

end; {procedure, daRestoreAvailableField}

{------------------------------------------------------------------------------}
{ daInsertString }

function daInsertString(aList: TStrings; aPosition: Integer; const aString: String): Integer;
begin

  if (aList.Count = 0) then
    aPosition := 0

  else if (aPosition > aList.Count - 1) then
    aPosition := aList.Count;

  aList.Insert(aPosition, aString);

  Result := aPosition;
  
end; {function, daInsertString}

{------------------------------------------------------------------------------}
{ daStringToJoinOperator }

function daStringToJoinOperator(const aOperator: String): TdaJoinOperatorType;
begin

  if (aOperator = '=') then
    Result := dajoEqual

  else if (aOperator = '<>') then
    Result := dajoNotEqual

  else if (aOperator = '<') then
    Result := dajoLessThan

  else if (aOperator = '<=') then
    Result := dajoLessThanOrEqualTo

  else if (aOperator = '>') then
    Result := dajoGreaterThan

  else if (aOperator = '>=') then
    Result := dajoGreaterThanOrEqualTo

  else
    Result := dajoEqual;

end; {function, daStringToJoinOperator}

{------------------------------------------------------------------------------}
{ daJoinOperatorToString }

function daJoinOperatorToString(aType: TdaJoinOperatorType): String;
begin
  case aType of
    dajoEqual:                Result := '=';
    dajoNotEqual:             Result := '<>';
    dajoLessThan:             Result := '<';
    dajoLessThanOrEqualTo:    Result := '<=';
    dajoGreaterThan:          Result := '>';
    dajoGreaterThanOrEqualTo: Result := '>=';
  end;
end; {function, daJoinOperatorToString}

{------------------------------------------------------------------------------}
{ daDataTypeToString }

function daDataTypeToString(aDataType: TppDataType): String;
begin
  Result := ppGetEnumName(TypeInfo(TppDataType), Ord(aDataType));
end; {function, daDataTypeToString}

{------------------------------------------------------------------------------}
{ daJoinTypeToString }

function daJoinTypeToString(const aJoinType: TdaJoinType): String;
begin
  Result := ppGetEnumName(TypeInfo(TdaJoinType), Ord(aJoinType));
end; {function, daJoinTypeToString}

{------------------------------------------------------------------------------}
{ daStringToJoinType }

function daStringToJoinType(const aJoinType: String): TdaJoinType;
begin
  Result := TdaJoinType(ppGetEnumStringAsInteger(TypeInfo(TdaJoinType), aJoinType));
end; {function, daStringToJoinType}

{------------------------------------------------------------------------------}
{ daGetJoinDesc }

function daGetJoinDesc(aType: TdaJoinType): String;
begin
  case aType of
    dajtNone:       Result := '';
    dajtInner:      Result := ppLoadStr(773); {Inner}
    dajtOuter:      Result := ppLoadStr(765); {Full Outer}
    dajtLeftOuter:  Result := ppLoadStr(784); {Left Outer}
    dajtRightOuter: Result := ppLoadStr(815); {Right Outer}
  end;
end; {procedure, daGetJoinDesc}

{------------------------------------------------------------------------------}
{ daFindFieldForName }

function daFindFieldForName(const aTableName, aFieldName: String; aList: TList): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := -1;

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lField := TdaField(aList[liIndex]);

      lbFound := (CompareText(aTableName, lField.TableName) = 0) and
                 (CompareText(aFieldName, lField.FieldName) = 0);

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindFieldForName}

{------------------------------------------------------------------------------}
{ daFindField }

function daFindField(aField: TdaField; aList: TList): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := -1;

  lbFound := False;
  liIndex := 0;

  if (aField = nil) then Exit;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lField := TdaField(aList[liIndex]);

      if (CompareText(aField.TableName, lField.TableName) = 0) then
        begin
          if aField is TdaCalculation then
            lbFound := (CompareText(aField.Alias, lField.Alias) = 0)
          else
            lbFound := (CompareText(aField.FieldName, lField.FieldName) = 0);
        end;

      if not(lbFound) then
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindField}

{------------------------------------------------------------------------------}
{ daFindFieldInStrings }

function daFindFieldInStrings(aField: TdaField; aList: TStrings): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lField: TdaField;
begin

  Result := -1;
  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lField := TdaField(aList.Objects[liIndex]);

      if (CompareText(aField.TableName, lField.TableName) = 0) and
         (CompareText(aField.FieldName, lField.FieldName) = 0) then
         lbFound := True
      else
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindFieldInStrings}

{------------------------------------------------------------------------------}
{ daFindTable }

function daFindTable(aTable: TdaTable; aList: TList): Integer;
var
  liIndex: Integer;
  lbFound: Boolean;
  lTable: TdaTable;
begin

  Result := -1;

  lbFound := False;
  liIndex := 0;

  while not(lbFound) and (liIndex < aList.Count) do
    begin
      lTable := TdaTable(aList[liIndex]);

      if (CompareText(aTable.TableName, lTable.TableName) = 0) then
        lbFound := True
      else
        Inc(liIndex);
    end;

  if lbFound then
    Result := liIndex;

end; {procedure, daFindTable}

{------------------------------------------------------------------------------}
{ daCopyList }

procedure daCopyList(aSourceList, aTargetList: TList; aCopyFilter: TdaCopyFilterType);
var
  liIndex: Integer;
  lField: TdaField;
  lbAdd: Boolean;
begin

  if (aCopyFilter = daftAll) then
    begin
      for liIndex := 0 to aSourceList.Count - 1 do
        aTargetList.Add(aSourceList[liIndex]);
    end
  else
    begin

      for liIndex := 0 to aSourceList.Count - 1 do
        begin
          lField := TdaField(aSourceList[liIndex]);

          case aCopyFilter of
            daftSelectable:  lbAdd := lField.Selectable;
            daftSearchable:  lbAdd := lField.Searchable;
            daftSortable:    lbAdd := lField.Sortable;
          else
            lbAdd := False;
          end;

          if lbAdd then
            aTargetList.Add(aSourceList[liIndex]);

        end;

    end;

end; {procedure, daCopyList}

{------------------------------------------------------------------------------}
{ daAssignChildren }

procedure daAssignChildren(aList: TList; aOwner: TComponent; aParent: TppRelative);
var
  liIndex: Integer;
  lChild: TdaChild;
  lNewChild: TdaChild;
  lClass: TdaChildClass;
begin

  for liIndex := 0 to aList.Count - 1 do
    begin
      lChild := TdaChild(aList[liIndex]);

      {get an instance of the class}
      lClass := TdaChildClass(lChild.ClassType);

      {instantiate a data view of the selected type}
      if (lClass <> nil) then
        begin
          lNewChild := lClass.Create(aOwner);
          lNewChild.Assign(lChild);
          lNewChild.ChildType := lChild.ChildType;
          lNewChild.Parent := aParent;
        end;

    end;

end; {procedure, daAssignChildren}

{------------------------------------------------------------------------------}
{ daFreeChildren }

procedure daFreeChildren(aList: TList);
var
  liIndex: Integer;
begin

  for liIndex := aList.Count - 1 downto 0 do
    TdaChild(aList[liIndex]).Free;

  aList.Clear;

end; {procedure, daFreeChildren}

{------------------------------------------------------------------------------}
{ daFreeChildrenInStrings }

procedure daFreeChildrenInStrings(aList: TStrings);
var
  liIndex: Integer;
begin

  for liIndex := aList.Count - 1 downto 0 do
    TdaChild(aList.Objects[liIndex]).Free;

  aList.Clear;

end; {procedure, daFreeChildrenInStrings}

{------------------------------------------------------------------------------}
{ daGetOperatorDesc }

function daGetOperatorDesc(aOperator: TdaCriteriaOperatorType): String;
begin

  case aOperator of
    dacoEqual:                Result := '=';
    dacoNotEqual:             Result := '<>';
    dacoLessThan:             Result := '<';
    dacoLessThanOrEqualTo:    Result := '<=';
    dacoGreaterThan:          Result := '>';
    dacoGreaterThanOrEqualTo: Result := '>=';
    dacoLike:                 Result := ppLoadStr(785); {Like}
    dacoNotLike:              Result := ppLoadStr(798); {Not Like}
    dacoBetween:              Result := ppLoadStr(732); {Between}
    dacoNotBetween:           Result := ppLoadStr(795); {Not Between}
    dacoInList:               Result := ppLoadStr(772); {In List}
    dacoNotInList:            Result := ppLoadStr(797); {Not In List}
    dacoBlank:                Result := ppLoadStr(733); {Blank}
    dacoNotBlank:             Result := ppLoadStr(796); {Not Blank}
  end;

end; {procedure, daGetOperatorDesc}

{------------------------------------------------------------------------------}
{ daGetCalcDesc }

function daGetCalcDesc(aCalcType: TdaCalcType): String;
begin

  case aCalcType of
    dacaCount:      Result := ppLoadStr(740); {Count}
    dacaAvg:        Result := ppLoadStr(729); {Avg}
    dacaSum:        Result := ppLoadStr(832); {Sum}
    dacaMin:        Result := ppLoadStr(788); {Min}
    dacaMax:        Result := ppLoadStr(787); {Max}
    dacaExpression: Result := ppLoadStr(759); {Expression}
    else
      Result := '';
  end;

end; {function, daGetCalcDesc}

{------------------------------------------------------------------------------}
{ daReplicate }

function daReplicate(Count: Integer; S: String): String;
var
  R: Integer;
begin

  Result := '';

  for R := 1 to Count do
    Result := Result + S;

end; {function, daReplicate}

{------------------------------------------------------------------------------}
{ daNextDay }

function daNextDay(aDateTime: TDateTime): TDateTime;
var
  lwYear: Word;
  lwMonth: Word;
  lwDay: Word;
begin

  DecodeDate(aDateTime, lwYear, lwMonth, lwDay);

  Inc(lwDay);

  if (lwDay > daDaysInMonth(lwMonth, lwYear)) then
    begin
      lwDay := 1;

      Inc(lwMonth);

      if lwMonth > 12 then
        begin
          lwMonth := 1;

          Inc(lwYear);
        end;

    end;

  Result := EncodeDate(lwYear, lwMonth, lwDay);

end; {function, daNextDay}

{------------------------------------------------------------------------------}
{ daPreviousDay }

function daPreviousDay(aDateTime: TDateTime): TDateTime;
var
  lwYear: Word;
  lwMonth: Word;
  lwDay: Word;
begin

  DecodeDate(aDateTime, lwYear, lwMonth, lwDay);

  Dec(lwDay);

  if (lwDay = 0) then
    begin
      Dec(lwMonth);

      if lwMonth = 0 then
        begin
          Dec(lwYear);

          lwMonth := 12;
        end;

    lwDay := daDaysInMonth(lwMonth, lwYear);
  end;

  Result := EncodeDate(lwYear, lwMonth, lwDay);

end; {function, daPreviousDay}

{------------------------------------------------------------------------------}
{ daWeekStartEnd }

procedure daWeekStartEnd(aCurrentDateTime: TDateTime; var aStartDateTime, aEndDateTime: TDateTime);
var
  liDOW: Integer;
  liDay: Integer;
begin
  liDOW := DayOfWeek(aCurrentDateTime);

  liDay := liDOW;

  aStartDateTime := aCurrentDateTime;

  while liDay > 1 do
    begin
      aStartDateTime := daPreviousDay(aStartDateTime);

      Dec(liDay);
    end;

  liDay := liDOW;

  aEndDateTime := aCurrentDateTime;

  while liDay < 7 do
    begin
      aEndDateTime := daNextDay(aEndDateTime);

      Inc(liDay);
    end;

end; {function, daWeekStartEnd}

{------------------------------------------------------------------------------}
{ daDaysInMonth }

function daDaysInMonth(aMonth, aYear: Word): Word;
const
  Days: array[1..12] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);
begin

  if ((aYear mod 4) = 0) then {leap year}
    begin
      {Century years not divisible by 400 are not leap years}
      if ((aYear mod 100) = 0) then
        begin
          if ((aYear mod 400) = 0) then
            Days[2] := 29
          else
            Days[2] := 28;
        end
      else
        Days[2] := 29
    end
  else
    Days[2] := 28;

  Result := Days[aMonth];

end; {function, daDaysInMonth}




{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClasses([TdaTable, TdaField, TdaCalculation, TdaTableJoin, TdaCriteria, TdaNumericValue, TdaSQL, TdaSQLLink]);

finalization

  UnRegisterClasses([TdaTable, TdaField, TdaCalculation, TdaTableJoin, TdaCriteria, TdaNumericValue, TdaSQL, TdaSQLLink]);

end.








