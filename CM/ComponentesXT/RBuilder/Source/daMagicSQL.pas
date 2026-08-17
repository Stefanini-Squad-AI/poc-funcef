{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daMagicSQL;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Dialogs, Controls, Forms, Graphics,
  daSQL, daLinkBroker, ppUtils;

type

  { TdaMagicSQL }

  { TdaMagicSQL encapsulates the functionality to retrieve the MagicSQL statement
    used by DADE QueryDataViews for DataView Linking }
  TdaMagicSQL = class (TdaSQL)
    private
      FMagicFieldCount: Integer;
      FMagicSQLText: TStrings;

      { ** LinkFieldLists ** }
      FDetailLinkFieldNames: TStrings;
      FMasterLinkFieldNames: TStrings;

      { ** MagicSQL building methods ** }
      procedure GetLinks(aSQL: TdaSQL);
      procedure GetSQLInfo(aSQL: TdaSQL; aChildsLinks: TList);
      procedure GetSelectTables(aSQL: TdaSQL; aChildsLinks: TList);
      procedure GetSelectFields(aSQL: TdaSQL; aChildsLinks: TList);
      procedure GetSelectFieldsFromDetail(aSQL: TdaSQL; aChildsLinks: TList);
      procedure GetSelectFieldsFromMaster(aSQL: TdaSQL; aChildsLinks: TList);
      procedure GetAllFields(aSQL: TdaSQL);
      procedure GetSearchCriteria(aSQL: TdaSQL);
      procedure GetOrderByFields(aSQL: TdaSQL);
      function GetSQLFieldNameForLimitedSQLString(const aLtdSQLString: String): String;

      procedure AddMagicOrderByField(aField: TdaField; aAscending: Boolean; const aMasterLinkFieldName, aDetailLinkFieldName: String);
      procedure AddMagicTableJoin(aMasterTable, aDetailTable: TdaTable; aMasterField, aDetailField: TdaField; aType: TdaJoinOperatorType);
      function AddMagicSelectField(aTable: TdaTable; aField: TdaField): TdaField;
      procedure AddMasterFieldsAsSelectFields(aDetailSQL: TdaSQL);
      procedure AddMasterFieldsAsGroupByFields(aDetailSQL: TdaSQL);
      procedure AddMasterFieldsAsOrderByFields(aDetailSQL: TdaSQL; aLowestDetail: Boolean);

      procedure AddMasterLinkFieldsAsMagicSelect(aSQL: TdaSQL; aChildsLinks: TList);
      procedure AddDetailLinkFieldsAsMagicOrderBy(aSQL: TdaSQL);
      procedure AssignOrderByFields(aDetailSQL: TdaSQL);

      procedure UpdateSQLFieldNames;

      {asseses whether we should get aSQL's select tables}
      function ShouldGetTablesFromMaster(aSQL: TdaSQL): Boolean;

      { ** LinkFieldLists ** }
      procedure AddLinkFieldNames(const aMasterFieldName, aDetailFieldName: String; aDetailAscending: Boolean);
      procedure ClearLinkFieldNameLists;
      procedure InitLinkFieldNameLists;

      { ** General methods ** }
      function CloneFieldForTableJoin(aField: TdaField; aTable: TdaTable; aTableJoin: TdaTableJoin): TdaField;
      function FieldExistsInOrderBys(aField: TdaField): Boolean;
      function FieldExistsInSelectFields(aField: TdaField): Boolean;
      function FieldNameInLinks(const aFieldName: String; aSQL: TdaSQL; aAsMaster: Boolean): Boolean;
      function GetLinksListForSQL(aSQL: TdaSQL): TList;

      { Determines whether aSQL has MasterSQL }
      function HasMaster(aSQL: TdaSQL): Boolean;
      procedure Init(aSQL: TdaSQL);
      function GetLinkFieldNameCount: Integer;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      function GenerateMagicSQL(aDetailSQL: TdaSQL): Boolean; virtual;
      function GetLinkFieldNames(aIndex: Integer; var aMasterFieldName, aDetailFieldName: String; aMasterMagicSQL: TdaMagicSQL; var aDetailAscending: Boolean): Boolean;

      property LinkFieldNameCount: Integer read GetLinkFieldNameCount;
      property MagicSQLText: TStrings read FMagicSQLText;
      property MagicFieldCount: Integer read FMagicFieldCount write FMagicFieldCount;
  end;

implementation


{*******************************************************************************
 *
 ** M A G I C S Q L
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaMagicSQL.Create }

constructor TdaMagicSQL.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);
                  
  FMagicFieldCount := 0;

end; {constructor, Create}



{------------------------------------------------------------------------------}
{ TdaMagicSQL.Destroy }

destructor TdaMagicSQL.Destroy;
begin

  FMagicSQLText.Free;
  FDetailLinkFieldNames.Free;
  FMasterLinkFieldNames.Free;

  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GenerateMagicSQL }

function TdaMagicSQL.GenerateMagicSQL(aDetailSQL: TdaSQL): Boolean;
begin

  Init(aDetailSQL);

  GetSQLInfo(aDetailSQL, nil);

  MasterSQL := aDetailSQL.MasterSQL;

  LinkingSQL := True;

  try
    FMagicSQLText.Assign(SQLText);
  finally
    LinkingSQL := False;
  end;

  Result := True;

end; {function, GenerateMagicSQL}



{------------------------------------------------------------------------------}
{ TdaMagicSQL.ShouldGetTablesFromMaster }

function TdaMagicSQL.ShouldGetTablesFromMaster(aSQL: TdaSQL): Boolean;
var
  liIndex: Integer;
begin

  {if aSQL is Master, we only add its table(s) if it has OrderBy fields (which
     are not linking fields) or more than one SelectTable}

  Result := (aSQL.SelectTableCount > 1) or (aSQL.CriteriaCount > 0);

  liIndex := 0;

  while (not(Result)) and (liIndex < aSQL.OrderByFieldCount) do
    if not(FieldNameInLinks(aSQL.OrderByFields[liIndex].FieldName, aSQL, True)) then
      Result := True
    else
      Inc(liIndex);

end; {function, ShouldGetTablesFromMaster}



{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSearchCriteria }

procedure TdaMagicSQL.GetSearchCriteria(aSQL: TdaSQL);
begin

  aSQL.AssignChildren(dactCriteria, Self);

end; {function, GetSearchCriteria}

{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetOrderByFields }
{ Called internally to retrieve OrderBy fields from aSQL }

procedure TdaMagicSQL.GetOrderByFields(aSQL: TdaSQL);
var
  liIndex: Integer;
  lTable: TdaTable;
  lField: TdaField;
  lOrderByField: TdaField;
begin

  {Add columns for any OrderBy fields which are not linking fields}
  for liIndex := 0 to aSQL.OrderByFieldCount - 1 do
    begin
      lOrderByField := aSQL.OrderByFields[liIndex];

      if not(FieldNameInLinks(lOrderByField.FieldName, aSQL, True)) then
        begin
          lField := nil;

          lTable := GetTableForSQLAlias(lOrderByField.TableSQLAlias);

          {look in Select fields}
          if (lTable <> nil) then
            lField := GetTableSelectFieldForFieldName(lTable, lOrderByField.FieldName);

          {look in Calc fields}
          if (lField = nil) then
            lField := GetTableCalcFieldForFieldName(lTable, lOrderByField.FieldName);

          if (lField = nil) then
            lField := AddMagicSelectField(lTable, lOrderByField);

          AddMagicOrderByField(lField, lOrderByField.Ascending, lOrderByField.LimitedSQLString, lField.LimitedSQLString);
        end;
    end;

end; {procedure, GetOrderByFields}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSelectFields }
{ Called internally to retrieve Select fields from aSQL }

procedure TdaMagicSQL.GetSelectFields(aSQL: TdaSQL; aChildsLinks: TList);
begin

  if (aChildsLinks = nil) then
    GetAllFields(aSQL)

  else
    if (HasMaster(aSQL)) then
      GetSelectFieldsFromDetail(aSQL, aChildsLinks)
    else
      GetSelectFieldsFromMaster(aSQL, aChildsLinks);

end; {procedure, GetSelectFields}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.UpdateSQLFieldNames }

procedure TdaMagicSQL.UpdateSQLFieldNames;
var
  liIndex: Integer;
  lField: TdaField;
begin

  for liIndex := 0 to FMagicFieldCount {SelectFieldCount} - 1 do
    begin
      lField := SelectFields[liIndex];
      lField.SQLFieldName := GetMagicAlias(lField);
    end;

  for liIndex := 0 to CalcFieldCount - 1 do
    begin
      lField := CalcFields[liIndex];
      lField.SQLFieldName := GetMagicAlias(lField);
    end;

end; {procedure, UpdateSQLFieldNames}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AssignOrderByFields }

procedure TdaMagicSQL.AssignOrderByFields(aDetailSQL: TdaSQL);
var
  liIndex: Integer;
  lField: TdaField;
  lNewField: TdaField;
begin

  for liIndex := 0 to aDetailSQL.OrderByFieldCount - 1 do
    begin
      lField := aDetailSQL.OrderByFields[liIndex];

      if not(FieldExistsInOrderBys(lField)) then
        begin
          if (lField is TdaCalculation) then
            lNewField := TdaCalculation.Create(Self)
          else
            lNewField := TdaField.Create(Self);

          lNewField.Assign(lField);
          lNewField.ChildType := lField.ChildType;
          lNewField.Parent := Self;
        end;

    end; 

end; {procedure, AssignOrderByFields}

{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetAllFields }

procedure TdaMagicSQL.GetAllFields(aSQL: TdaSQL);
begin

  if (aSQL <> nil) then
    begin
      aSQL.AssignChildren(dactSelectField, Self);
      aSQL.AssignChildren(dactCalcField, Self);

      AddMasterFieldsAsGroupByFields(aSQL);

      aSQL.AssignChildren(dactGroupByField, Self);

      {Faux orderby fields from the master should go before the detail's}
      AddMasterFieldsAsOrderByFields(aSQL, True);

      AddDetailLinkFieldsAsMagicOrderBy(aSQL);

      AssignOrderByFields(aSQL);

      {Now that all fields are added, validate the SQLFieldNames}
      UpdateSQLFieldNames;
    end;

end; {procedure, GetAllFields}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSelectFieldsFromDetail }

procedure TdaMagicSQL.GetSelectFieldsFromDetail(aSQL: TdaSQL; aChildsLinks: TList);
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
  lTable: TdaTable;
begin

  {We need to add any fields that are involved in linking either as Master or as
   detail part of link.}

  AddMasterFieldsAsSelectFields(aSQL);

  AddMasterLinkFieldsAsMagicSelect(aSQL, aChildsLinks);

  AddMasterFieldsAsOrderByFields(aSQL, False);

  {using aSQL's links, add fields as Detail}
  for liIndex := 0 to aSQL.LinkCount - 1 do
    begin
      lSQLLink := TdaSQLLink(aSQL.Links[liIndex]);

      lTable := GetTableForSQLAlias(lSQLLink.DetailField.TableSQLAlias);

      AddMagicSelectField(lTable, lSQLLink.DetailField);
    end;

  AddDetailLinkFieldsAsMagicOrderBy(aSQL);

end; {procedure, GetSelectFieldsFromDetail}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSelectFieldsFromMaster }

procedure TdaMagicSQL.GetSelectFieldsFromMaster(aSQL: TdaSQL; aChildsLinks: TList);
begin

  {if aChildsLinks is nil, then aSQL is the bottom detail}
  if (aChildsLinks = nil) then
    GetAllFields(aSQL)

  else
    {if we added tables from this master, then we should add its link fields}
    if (ShouldGetTablesFromMaster(aSQL)) then
      AddMasterLinkFieldsAsMagicSelect(aSQL, aChildsLinks);

end; {procedure, GetSelectFieldsFromMaster}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSelectTables }
{ Called internally to retrieve Select tables from aSQL }

procedure TdaMagicSQL.GetSelectTables(aSQL: TdaSQL; aChildsLinks: TList);
var
  liIndex: Integer;
  liIndex2: Integer;
  ldaTable: TdaTable;
  ldaMasterTable: TdaTable;
  lTableJoin: TdaTableJoin;
  lSQLLink: TdaSQLLink;
begin

  {if not HasMaster, then aSQL is the Topmost master. If aChildsLinks is nil,
   then aSQL is the bottom most detail. If both, then aSQL is not linked}

  if not(HasMaster(aSQL)) then
    if (not(ShouldGetTablesFromMaster(aSQL)) and (aChildsLinks <> nil)) then Exit;

  {Add aSQL's tables}
  for liIndex := 0 to aSQL.SelectTableCount - 1 do
    begin
      ldaTable := GetTableForSQLAlias(aSQL.SelectTables[liIndex].SQLAlias);

      if (ldaTable = nil) then
        begin
          ldaTable := AddTable(aSQL.SelectTables[liIndex].RawTableName);

          if (ldaTable <> nil) and (aSQL.SelectTables[liIndex].JoinType <> dajtNone) then
            ldaTable.JoinType := aSQL.SelectTables[liIndex].JoinType;
        end;
    end;

  {Now add TableJoins}
  for liIndex := 0 to aSQL.SelectTableCount - 1 do
    begin
      for liIndex2 := 0 to aSQL.SelectTables[liIndex].TableJoinCount - 1 do
        begin
          lTableJoin := aSQL.SelectTables[liIndex].TableJoins[liIndex2];

          if (lTableJoin <> nil) then
            begin
              ldaTable := GetTableForSQLAlias(lTableJoin.LocalField.TableSQLAlias);
              ldaMasterTable := GetTableForSQLAlias(lTableJoin.ForeignField.TableSQLAlias);

              AddMagicTableJoin(ldaMasterTable, ldaTable, lTableJoin.ForeignField, lTableJoin.LocalField, lTableJoin.Operator);
            end;
        end;
    end;

  {Add TableJoins for Links}
  for liIndex := 0 to aSQL.LinkCount - 1 do
    begin
      lSQLLink := TdaSQLLink(aSQL.Links[liIndex]);

      ldaTable := GetTableForSQLAlias(lSQLLink.DetailField.TableSQLAlias);
      ldaMasterTable := GetTableForSQLAlias(lSQLLink.MasterField.TableSQLAlias);

      AddMagicTableJoin(ldaMasterTable, ldaTable, lSQLLink.MasterField, lSQLLink.DetailField, dajoEqual);
    end;


end; {procedure, GetSelectTables}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMagicTableJoin }

procedure TdaMagicSQL.AddMagicTableJoin(aMasterTable, aDetailTable: TdaTable;
  aMasterField, aDetailField: TdaField; aType: TdaJoinOperatorType);
var
  lTableJoin: TdaTableJoin;
  lMasterField: TdaField;
  lDetailField: TdaField;
begin

  if (aDetailTable = nil) then
    raise Exception.Create('TdaMagicSQL.AddMagicTableJoin: aDetailTable cannot be nil.');

  if (aMasterField = nil) then
    raise Exception.Create('TdaMagicSQL.AddMagicTableJoin: aMasterField cannot be nil.');

  if (aDetailField = nil) then
    raise Exception.Create('TdaMagicSQL.AddMagicTableJoin: aDetailField cannot be nil.');

  lTableJoin := TdaTableJoin.Create(aDetailTable);
  lTableJoin.Operator := aType;

  if (aMasterTable <> nil) then
    begin
      lMasterField := CloneFieldForTableJoin(aMasterField, aMasterTable, lTableJoin);
      lMasterField.ChildType := Ord(dactForeignField);
    end;

  lDetailField := CloneFieldForTableJoin(aDetailField, aDetailTable, lTableJoin);
  lDetailField.ChildType := Ord(dactLocalField);

  lTableJoin.Parent := aDetailTable;

end; {function, AddMagicTableJoin}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMasterFieldsAsSelectFields }
{ if the Master SQL does not add its tables to the MagicSQL, the 1st level detail
  needs to add its own linking fields to the Select in place of the Master's. i.e.,
  in Customer/Orders/Items, Orders needs to add its CustomerID field to the Magic Select }

procedure TdaMagicSQL.AddMasterFieldsAsSelectFields(aDetailSQL: TdaSQL);
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
  lTable: TdaTable;
begin

  if (aDetailSQL <> nil) and (aDetailSQL.MasterSQL <> nil) and
      not(HasMaster(aDetailSQL.MasterSQL)) and not(ShouldGetTablesFromMaster(aDetailSQL.MasterSQL)) then

    begin
      for liIndex := 0 to aDetailSQL.LinkCount - 1 do
        begin
          lSQLLink := TdaSQLLink(aDetailSQL.Links[liIndex]);

          lTable := GetTableForSQLAlias(lSQLLink.DetailField.TableSQLAlias);

          AddMagicSelectField(lTable, lSQLLink.DetailField);
        end;
    end;

end; {function, AddMasterFieldsAsSelectFields}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMasterFieldsAsGroupByFields }

procedure TdaMagicSQL.AddMasterFieldsAsGroupByFields(aDetailSQL: TdaSQL);
var
  liIndex: Integer;
begin

  if (aDetailSQL.HasGroups) and (HasMaster(aDetailSQL)) then
    for liIndex := 0 to FMagicFieldCount - 1 do
      AddGroupByField(SelectFields[liIndex]);

end; {function, AddMasterFieldsAsGroupByFields}

{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMasterFieldsAsOrderByFields }
{ if the Master SQL does not add its tables to the MagicSQL, the 1st level detail
  needs to add its own linking fields to the OrderBys in place of the Master's. i.e.,
  in Customer/Orders/Items, Orders needs to add its CustomerID field to the Magic OrderBys }

procedure TdaMagicSQL.AddMasterFieldsAsOrderByFields(aDetailSQL: TdaSQL; aLowestDetail: Boolean);
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
  lTable: TdaTable;
  lField: TdaField;
  lsMasterName: String;
begin

  if (aDetailSQL <> nil) and (aDetailSQL.MasterSQL <> nil) and
      not(HasMaster(aDetailSQL.MasterSQL)) and not(ShouldGetTablesFromMaster(aDetailSQL.MasterSQL)) then

    begin
      for liIndex := 0 to aDetailSQL.LinkCount - 1 do
        begin
          lSQLLink := TdaSQLLink(aDetailSQL.Links[liIndex]);

          lTable := GetTableForSQLAlias(lSQLLink.DetailField.TableSQLAlias);

          lField := GetTableSelectFieldForFieldName(lTable, lSQLLink.DetailField.FieldName);

          if (aLowestDetail) then
            lsMasterName := lSQLLink.MasterField.LimitedSQLString
          else
            lsMasterName := lSQLLink.DetailField.LimitedSQLString;

          AddMagicOrderByField(lField, True, lsMasterName, lSQLLink.DetailField.LimitedSQLString);
        end;
    end;
    
end; {function, AddMasterFieldsAsOrderByFields}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMasterLinkFieldsAsMagicSelect }

procedure TdaMagicSQL.AddMasterLinkFieldsAsMagicSelect(aSQL: TdaSQL; aChildsLinks: TList);
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
  lTable: TdaTable;
begin

  for liIndex := 0 to aChildsLinks.Count - 1 do
    begin
      lSQLLink := TdaSQLLink(aChildsLinks[liIndex]);

      lTable := GetTableForSQLAlias(lSQLLink.MasterField.TableSQLAlias);

      AddMagicSelectField(lTable, lSQLLink.MasterField);
    end; {for liIndex...}

end; {procedure, AddMasterLinkFieldsAsMagicSelect}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddDetailLinkFieldsAsMagicOrderBy }

procedure TdaMagicSQL.AddDetailLinkFieldsAsMagicOrderBy(aSQL: TdaSQL);
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
  lTable: TdaTable;
  lField: TdaField;
  lLinks: TList;
begin

  lLinks := GetLinksListForSQL(aSQL);

  if (lLinks <> nil) then
    try
    
      for liIndex := 0 to lLinks.Count - 1 do
      begin
        lSQLLink := TdaSQLLink(lLinks[liIndex]);

        lTable := GetTableForSQLAlias(lSQLLink.DetailField.TableSQLAlias);

        lField := GetTableSelectFieldForFieldName(lTable, lSQLLink.DetailField.FieldName);

        if (lField <> nil) then
          AddMagicOrderByField(lField, True, lSQLLink.MasterField.LimitedSQLString, lSQLLink.DetailField.LimitedSQLString);
      end; {for liIndex...}
      
    finally
      lLinks.Free;
    end;

end; {procedure, AddDetailLinkFieldsAsMagicOrderBy}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMagicOrderByField }

procedure TdaMagicSQL.AddMagicOrderByField(aField: TdaField; aAscending: Boolean; const aMasterLinkFieldName, aDetailLinkFieldName: String);
begin

  if (aField <> nil) and not(FieldExistsInOrderBys(aField)) then
    begin
      AddOrderByField(aField, aAscending);

      AddLinkFieldNames(aMasterLinkFieldName, aDetailLinkFieldName, aAscending);
    end;

end; {procedure, AddMagicOrderByField}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddMagicSelectField }

function TdaMagicSQL.AddMagicSelectField(aTable: TdaTable; aField: TdaField): TdaField;
var
  lField: TdaField;
begin

  if not(FieldExistsInSelectFields(aField)) then
    begin
      lField := TdaField.Create(Self);

      lField.Assign(aField);

      lField.TableName := aTable.TableName;
      lField.TableAlias := aTable.TableAlias;
      lField.TableSQLAlias := aTable.SQLAlias;

      {Assure magic field is renamed}
      lField.SQLFieldName := GetMagicAlias(lField);

      lField.ChildType := Ord(dactSelectField);
      lField.Parent := Self;

      Inc(FMagicFieldCount);

      Result := lField;
    end
  else
    Result := GetTableSelectFieldForFieldName(aTable, aField.FieldName);

end; {procedure, AddMagicSelectField}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.FieldExistsInOrderBys }

function TdaMagicSQL.FieldExistsInOrderBys(aField: TdaField): Boolean;
var
  liIndex: Integer;
begin

  Result := False;
  liIndex := 0;

  if (OrderByFieldCount > 0) and (aField <> nil) then
    while (Result = False) and (liIndex < OrderByFieldCount) do
      begin
        Result := ((CompareText(OrderByFields[liIndex].FieldName, aField.FieldName) = 0) and
                   (CompareText(OrderByFields[liIndex].TableName, aField.TableName) = 0));
        inc(liIndex);
      end;

end; {function, FieldExistsInOrderBys}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.FieldExistsInOrderBys }

function TdaMagicSQL.FieldExistsInSelectFields(aField: TdaField): Boolean;
var
  liIndex: Integer;
begin

  Result := False;
  liIndex := 0;

  if (SelectFieldCount > 0) and (aField <> nil) then
    while (Result = False) and (liIndex < SelectFieldCount) do
      begin
        Result := ((CompareText(SelectFields[liIndex].FieldName, aField.FieldName) = 0) and
                   (CompareText(SelectFields[liIndex].TableName, aField.TableName) = 0));
        inc(liIndex);
      end;

end; {function, FieldExistsInOrderBys}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSQLInfo }
{ Recursive method called internally to get linking info from all SQL objects in chain }

procedure TdaMagicSQL.GetSQLInfo(aSQL: TdaSQL; aChildsLinks: TList);
var
  lLinks: TList;
begin

  if (HasMaster(aSQL)) then
    begin
      lLinks := GetLinksListForSQL(aSQL);

      try
        GetSQLInfo(aSQL.MasterSQL, lLinks);

      finally
        lLinks.Free;
      end;

    end;

  GetSelectTables(aSQL, aChildsLinks);
  GetSelectFields(aSQL, aChildsLinks);
  GetSearchCriteria(aSQL);
  GetOrderByFields(aSQL);

end; {procedure, GetSQLInfo}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.HasMaster }

function TdaMagicSQL.HasMaster(aSQL: TdaSQL): Boolean;
begin

  Result := False;

  if (aSQL <> nil) then
    Result := (aSQL.MasterSQL <> nil);

end; {function, HasMaster}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.InitLinkFieldNameLists }
{ Creates LinkFieldName lists on demand }

procedure TdaMagicSQL.InitLinkFieldNameLists;
begin

  if (FDetailLinkFieldNames = nil) then
    FDetailLinkFieldNames := TStringList.Create;

  if (FMasterLinkFieldNames = nil) then
    FMasterLinkFieldNames := TStringList.Create;

end; {procedure, InitLinkFieldNameLists}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.ClearLinkFieldNameLists }

procedure TdaMagicSQL.ClearLinkFieldNameLists;
begin

  InitLinkFieldNameLists;

  FDetailLinkFieldNames.Clear;

  FMasterLinkFieldNames.Clear;

end; {procedure, ClearLinkFieldNameLists}

{------------------------------------------------------------------------------}
{ TdaMagicSQL.Init }

procedure TdaMagicSQL.Init(aSQL: TdaSQL);
begin

  if (aSQL <> nil) then
    begin
      Clear;

      if (FMagicSQLText = nil) then
        FMagicSQLText := TStringList.Create;

      DatabaseName := aSQL.DatabaseName;
      DatabaseType := aSQL.DatabaseType;
      IsCaseSensitive := aSQL.IsCaseSensitive;
      SQLType := aSQL.SQLType;
      Session := aSQL.Session;
      DataDictionary := aSQL.DataDictionary;
      Distinct := aSQL.Distinct;

      MagicFieldCount := 0;
      ClearLinkFieldNameLists;

      GetLinks(aSQL);
    end;

end; {procedure, Init}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetLinks }

procedure TdaMagicSQL.GetLinks(aSQL: TdaSQL);
begin

  TdaLinkBroker(LinkBroker).UpdateColors := False;
  TdaLinkBroker(LinkBroker).Assign(aSQL.LinkBroker);

end; {procedure, GetLinks}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetLinkFieldNameCount }

function TdaMagicSQL.GetLinkFieldNameCount: Integer;
begin

  InitLinkFieldNameLists;

  Result := FDetailLinkFieldNames.Count;

end; {function, GetLinkFieldNameCount}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetSQLFieldNameForLimitedSQLString }

function TdaMagicSQL.GetSQLFieldNameForLimitedSQLString(const aLtdSQLString: String): String;
var
  liIndex: Integer;
  lField: TdaField;
begin

  Result := '';

  liIndex := 0;

  while (liIndex < SelectFieldCount) and (Result = '') do
    begin
      lField := SelectFields[liIndex];

      if (lField <> nil) then
        if (ppEqual(aLtdSQLString, lField.LimitedSQLString)) then
          Result := lField.SQLFieldName

        else
          Inc(liIndex);
    end;

end; {function, GetSQLFieldNameForLimitedSQLString}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetLinkFieldNames }
{ The LinkFieldName lists contain all the field names that are to be used in creating
  pipeline links. Field names are added to the lists as we add link fields and
  OrderBy fields from the linked SQL objects. }

function TdaMagicSQL.GetLinkFieldNames(aIndex: Integer; var aMasterFieldName, aDetailFieldName: String; aMasterMagicSQL: TdaMagicSQL; var aDetailAscending: Boolean): Boolean;
begin

  if (aMasterMagicSQL = nil) then
    raise Exception.Create('TdaMagicSQL.GetLinkFieldNames: aMasterMagicSQL cannot be nil.');

  InitLinkFieldNameLists;

  Result := False;

  if (aIndex < FDetailLinkFieldNames.Count) then
    begin
      aMasterFieldName := aMasterMagicSQL.GetSQLFieldNameForLimitedSQLString(FMasterLinkFieldNames[aIndex]);

      aDetailFieldName := GetSQLFieldNameForLimitedSQLString(FDetailLinkFieldNames[aIndex]);

      aDetailAscending := Boolean(FDetailLinkFieldNames.Objects[aIndex]);

      Result := True;
    end;

end; {function, GetLinkFieldNames}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.AddLinkFieldNames }

procedure TdaMagicSQL.AddLinkFieldNames(const aMasterFieldName, aDetailFieldName: String; aDetailAscending: Boolean);
begin

  InitLinkFieldNameLists;

  FDetailLinkFieldNames.AddObject(aDetailFieldName, Pointer(aDetailAscending));

  FMasterLinkFieldNames.Add(aMasterFieldName);

end; {procedure, AddLinkFieldNames}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.FieldNameInLinks }

function TdaMagicSQL.FieldNameInLinks(const aFieldName: String; aSQL: TdaSQL; aAsMaster: Boolean): Boolean;
var
  liIndex: Integer;
  lSQLLink: TdaSQLLink;
  lsFieldName: String;
begin

  Result := False;

  if (aFieldName <> '') and (aSQL <> nil) then
    begin
      liIndex := 0;

      while (not(Result)) and (liIndex < aSQL.LinkCount) do
        begin
          lSQLLink := TdaSQLLink(aSQL.Links[liIndex]);

          if aAsMaster then
            lsFieldName := lSQLLink.MasterField.FieldName
          else
            lsFieldName := lSQLLink.DetailField.FieldName;

          if (aFieldName = lsFieldName) then
            Result := True
          else
            Inc(liIndex);

        end;

    end;

end;  {function, FieldNameInLinks}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.CloneFieldForTableJoin }

function TdaMagicSQL.CloneFieldForTableJoin(aField: TdaField; aTable: TdaTable; aTableJoin: TdaTableJoin): TdaField;
begin

  Result := nil;

  if (aField <> nil) and (aTable <> nil) and (aTableJoin <> nil) then
    begin
      Result := TdaField.Create(Self);
      Result.Assign(aField);

      {Since we're cloning this field, get rid of any aliasing}
      Result.SQLFieldName := Result.FieldName;

      Result.Parent := aTableJoin;;
      Result.TableName := aTable.TableName;
      Result.TableAlias := aTable.TableAlias;
      Result.TableSQLAlias := aTable.SQLAlias;
    end;

end;  {function, CloneFieldForTableJoin}


{------------------------------------------------------------------------------}
{ TdaMagicSQL.GetLinksListForSQL }

function TdaMagicSQL.GetLinksListForSQL(aSQL: TdaSQL): TList;
var
  liIndex: Integer;
begin

  Result := TList.Create;

  if (aSQL <> nil) then
    for liIndex := 0 to aSQL.LinkCount - 1 do
      Result.Add(aSQL.Links[liIndex]);

end;  {function, GetLinksListForSQL}


end.
