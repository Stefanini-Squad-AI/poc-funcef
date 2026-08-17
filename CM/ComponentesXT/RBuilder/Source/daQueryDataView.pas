{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daQueryDataView;

interface

{$I ppIfDef.pas}

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ExtCtrls, Graphics,
  ppComm, ppClass, ppRelatv, ppDB, ppUtils, ppTypes, ppForms, ppReport, ppRTTI, ppEndUsr, ppDsgnDB,
  daDB, daDataView, daSQL, daForms, daDataModule;
  
type

  { TdaGenerateSQLEvent

    Used to establish communication between the dataview and the SQL object during
    the genaration of the SQL (i.e. BeforeGenerateSQL, AfterGenerateSQL }

  TdaGenerateSQLEvent = procedure(Sender: TObject; aSQL: TdaSQL) of object;


  { TdaQueryDataView

    Abstract ancestor for query based DataViews that use the Query Wizard and
    Query Designer. An example of a descendant is TdaBDEQueryDataView which
    contains a BDE-based TQuery component }

  TdaQueryDataView = class (TdaCustomDataView)
    private
      FClearingMasterDataView: Boolean;
      FLinkedAutoSearchFields: TList;
      FMasterDataViewUserName: String;
      FOnAfterGenerateSQL: TdaGenerateSQLEvent;
      FOnBeforeGenerateSQL: TdaGenerateSQLEvent;
      FRemovingAutoSearchFields: Boolean;
      FSession: TdaSession;
      FSettingActive: Boolean;
      FSQL: TdaSQL;
      FQueryOutOfSync: Boolean;

      procedure AddAutoSearchFields;
      procedure AutoSearchFieldChangeEvent(Sender: TObject);
      procedure ClearMasterDataView;
      procedure ClearLinks;
      procedure CreateAutoSearchFields(aReport: TppReport);
      procedure CreateCriteriaForAutoSearchField(aAutoSearchField: TppAutoSearchField);
      procedure CreateField(aDataPipeline: TppDataPipeline; aField: TdaField);
      procedure CreateLinkObject(aMasterDataView: TdaDataView; const aMasterFieldAlias, aDetailFieldAlias: String);
      procedure CreatePipelineLinks(aDataPipeline: TppDataPipeline);
      function DisplayLinkDialog(aSQLObjects: TList; var aMasterSQLIndex: Integer): Boolean;
      procedure FixUpMasterDataView;
      procedure FixUpRename;
      procedure FreeAutoSearchFields(aReport: TppReport);
      function GetMasterQueryDataView: TdaQueryDataView;
      procedure RemoveAutoSearchFields;
      procedure ReportCreateAutoSearchCriteriaEvent(aAutoSearchField: TObject);
      procedure ReportGetAutoSearchValuesEvent;
      procedure SetSQL(aSQL: TdaSQL);
      procedure SQLToDataView;
      procedure UpdateAutoSearchFields;
      procedure UpdateUserName;
      procedure ValidateLinks;

    protected
      procedure SaveComponents(Proc: TGetChildProc); override;
      procedure Loaded; override;

      function GetDescription: String; override;
      function GetLinkColor: TColor; override;
      procedure RefreshQuery; virtual;
      procedure ReportBeforePrintEvent; override;
      procedure SetActive(aValue: Boolean); override;
      procedure SetAutoSearchTabOrder(aValue: Integer); override;
      procedure SetLinkColor(aColor: TColor); override;
      procedure SetMasterDataView(aDataView: TdaDataView); override;
      procedure SetQueryOutOfSync(aValue: Boolean);
      procedure SetReport(aReport: TppCustomReport); override;
      procedure SetUserName(const aUserName: TComponentName); override;
      procedure SQLChanged; virtual;
      procedure UpdateShowAutoSearchDialog;

      procedure DoAfterGenerateSQL(aSQL: TdaSQL); virtual;
      procedure DoBeforeGenerateSQL(aSQL: TdaSQL); virtual;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Convert(aVersionNo: Integer); override;
      
      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      class function DataDesignerClass: TClass; override;

      function AutoSearchFieldsExist: Boolean; override;
      procedure Init; override;

      { streaming routines for saving SQL object }
      procedure AddChild(aChild: TppRelative); override;
      function daOperatorToppOperator(aOperator: TdaCriteriaOperatorType): TppSearchOperatorType;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function ppOperatorTodaOperator(aOperator: TppSearchOperatorType): TdaCriteriaOperatorType;
      function RemoveChild(aChild: TppRelative): Integer; override;

      { allow for the use of TdaSQL descendants }
      class function SQLClass: TdaSQLClass; virtual;

      { DataView Linking }
      function CreateAutoLink(aLinkableDataViews: TList; aDataDictionary: TObject): Boolean; override;
      procedure CreateLink(aMasterDataView: TdaDataView; aMasterFieldAlias, aDetailFieldAlias: String); override;
      procedure DeleteLink(aIndex: Integer); override;
      function GetAutoLinks(aMasterDataView: TdaQueryDataView; aDataDictionary: TppDataDictionary): Boolean;
      function GetLinkColorForField(aFieldName: String): TColor; override;
      function GetLinkCount: Integer; override;
      function GetLinkDescription: String; override;
      procedure GetLinkFieldNames(aIndex: Integer; var aMasterSQLFieldName, aDetailSQLFieldName: String); override;
      function GetMagicFieldCount: Integer; override;
      procedure GetMagicSQL(aSQLText: TStrings); override;
      procedure GetMagicSQLObject(var aMagicSQL: TdaSQL);
      function InMasterChain(aDataView: TdaDataView): Boolean; override;
      function IsLinkable: Boolean; override;
      procedure Link(aLinkableDataViews: TList); override;
      procedure LinkChanged; override;
      procedure OutOfSync; override;
      procedure Sync; override;
      procedure UpdateEnabledOptions(aLinkableDataViews: TList); override;
      procedure UpdateLinkColors(aUpdateUpward: Boolean);
      procedure UpdatePipelineFieldName(const aOldSQLFieldName, aNewSQLFieldName: String);

      property MasterQueryDataView: TdaQueryDataView read GetMasterQueryDataView;
      property OnAfterGenerateSQL: TdaGenerateSQLEvent read FOnAfterGenerateSQL write FOnAfterGenerateSQL;
      property OnBeforeGenerateSQL: TdaGenerateSQLEvent read FOnBeforeGenerateSQL write FOnBeforeGenerateSQL;
      property Session: TdaSession read FSession;
      property SQL: TdaSQL read FSQL write SetSQL;

    published
      property AutoSearchTabOrder;
      property MasterDataViewUserName: String read FMasterDataViewUserName write FMasterDataViewUserName;

  end; {class, TdaQueryDataView}



implementation

{*******************************************************************************
 *
 ** Q U E R Y   D A T A V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Create }

constructor TdaQueryDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  EventNotifies := EventNotifies + [ciReportGetAutoSearchValues,
                                    ciBeforeGenerateSQL,
                                    ciAfterGenerateSQL,
                                    ciReportCreateAutoSearchCriteria,
                                    ciSQLLinkChanged,
                                    ciSQLSelectFieldsChanged,
                                    ciSQLSearchCriteriaChanged,
                                    ciSQLOrderByFieldsChanged,
                                    ciSQLConvertedToText,
                                    ciSQLNameChanged];


  EditOptions := EditOptions + [ppemLink];
  EnabledOptions := EnabledOptions + [ppemLink];

  FClearingMasterDataView := False;
  FLinkedAutoSearchFields := TList.Create;
  FMasterDataViewUserName := '';
  FOnAfterGenerateSQL := nil;
  FOnBeforeGenerateSQL := nil;
  FQueryOutOfSync := False;
  FRemovingAutoSearchFields := False;
  FSettingActive := False;

  {create session}
  FSession := TdaSessionClass(SessionClass).Create(Self);
  FSession.DataOwner := aOwner;

  {create sql object}
  FSQL := SQLClass.Create(Self);
  FSQL.AddEventNotify(Self);
  FSQL.Session := FSession;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Destroy }

destructor TdaQueryDataView.Destroy;
begin
  
  RemoveAutoSearchFields;

  if (MasterDataView <> nil) then
    ClearMasterDataView;

  FSQL.Free;
  FSession.Free;
  FLinkedAutoSearchFields.Free;

  inherited Destroy;
  
end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Convert }

procedure TdaQueryDataView.Convert(aVersionNo: Integer);
var
  liIndex: Integer;
  lField: TdaField;
  lsOldFieldName: String;
  lDataPipeline: TppDataPipeline;
begin

  FSQL.Convert(aVersionNo);

  if (aVersionNo < 5200) and (DataPipelineCount > 0) and not(FSQL.EditSQLasText) then
    begin

      lDataPipeline := DataPipelines[0];

      {update aliasing for Select Fields}
      for liIndex := 0 to FSQL.SelectFieldCount - 1 do
        begin
          lField := FSQL.SelectFields[liIndex];

          lsOldFieldName := lField.SQLFieldName;

          lField.SQLFieldName := FSQL.GetMagicAlias(lField);

          if (lField.TableName[1] = '"') then
            lField.TableName := ppExtractQuotedStr(lField.TableName);

          if (Report <> nil) then
            Report.ConvertDataFieldNames(lDataPipeline, lsOldFieldName, lField.SQLFieldName);
        end;

      {update aliasing for Calc Fields}
      for liIndex := 0 to FSQL.CalcFieldCount - 1 do
        begin
          lField := FSQL.CalcFields[liIndex];

          lsOldFieldName := lField.SQLFieldName;

          lField.SQLFieldName := FSQL.GetMagicAlias(lField);

          if (lField.TableName[1] = '"') then
            lField.TableName := ppExtractQuotedStr(lField.TableName);

          if (Report <> nil) then
            Report.ConvertDataFieldNames(lDataPipeline, lsOldFieldName, lField.SQLFieldName);
        end;

      SQL.Valid;

      FQueryOutOfSync := True;

      SQLChanged;

      SQLToDataView;
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Notify }

procedure TdaQueryDataView.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  {remove corresponding criteria}
  if (aOperation = ppopRemove) and (aCommunicator is TppAutoSearchField) and (FLinkedAutoSearchFields.IndexOf(aCommunicator) <> -1) then
    begin
      if not(FRemovingAutoSearchFields) then
        TppAutoSearchField(aCommunicator).Criteria.Free;

      FLinkedAutoSearchFields.Remove(aCommunicator);
      FQueryOutOfSync := True;

    end

  {clear the master dataview reference and free the links}
  else if (aCommunicator is TdaQueryDataView) and (aCommunicator = MasterDataView) then
    begin

      case aOperation of
        ppopRemove: ClearMasterDataView;
        ppopUserNameChange: FMasterDataViewUserName := MasterDataView.UserName;
      end;

    end;

end; {procedure, Notify}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.EventNotify }

procedure TdaQueryDataView.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
var
  lField: Integer;
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = FSQL) then

    case aEventID of
      ciBeforeGenerateSQL:
        DoBeforeGenerateSQL(FSQL);

      ciAfterGenerateSQL:
        DoAfterGenerateSQL(FSQL);
    end

  else if (aCommunicator = Report) then

    case aEventID of
      ciReportGetAutoSearchValues:
        ReportGetAutoSearchValuesEvent;

      ciReportCreateAutoSearchCriteria:
        begin
          aParams.GetParamValue(0, lField);

          ReportCreateAutoSearchCriteriaEvent(TppAutoSearchField(lField));
        end;

    end

  else if (aCommunicator = MasterDataView) then

    case aEventID of

      ciSQLConvertedToText:
        ClearLinks;

      ciSQLSelectFieldsChanged:
        ValidateLinks;

      ciSQLSearchCriteriaChanged, ciSQLOrderByFieldsChanged, ciSQLLinkChanged:
        SetQueryOutOfSync(True);

      ciSQLNameChanged:
        DoOnNameChange;

    end;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetUserName }

procedure TdaQueryDataView.SetUserName(const aUserName: TComponentName);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    inherited SetUserName(aUserName)
  else
    begin
      RemoveAutoSearchFields;

      inherited SetUserName(aUserName);

      AddAutoSearchFields;
    end;

  if (aUserName <> UserName) then
    begin
      FixUpRename;

      Modification;
    end;

end; {procedure, SetUserName}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.FixUpRename }

procedure TdaQueryDataView.FixUpRename;
var
  lsNewName: String;
begin

  lsNewName := Copy(UserName, Length('Query_')+ 1, Length(UserName));

  FSQL.DataPipelineName := lsNewName;

end; {procedure, FixUpRename}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetReport }

procedure TdaQueryDataView.SetReport(aReport: TppCustomReport);
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    inherited SetReport(aReport)

  else
    begin
      RemoveAutoSearchFields;

      inherited SetReport(aReport);

      AddAutoSearchFields;
    end;

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetSQL }

procedure TdaQueryDataView.SetSQL(aSQL: TdaSQL);
var
  lbNameChanged: Boolean;
  lbSelectFieldsChanged: Boolean;
  lbSearchCriteriaChanged: Boolean;
  lbSortChanged: Boolean;
begin

  if (csReading in ComponentState) or (csLoading in ComponentState) then
    begin
      FSQL.Assign(aSQL);

      FQueryOutOfSync := True;
    end

  else
    begin
      {determine what changes were made}
      lbNameChanged := (aSQL.DataPipelineName <> DataPipelines[0].UserName);

      if not(FSQL.EditSQLAsText) and (aSQL.EditSQLAsText) then
        begin
          if (MasterDataView <> nil) then
            ClearLinks;

          {must do this after clearing the links}
          EnabledOptions := [ppemText, ppemPreview];

          {assign the new sql object}
          FSQL.Assign(aSQL);

          SendEventNotify(Self, ciSQLConvertedToText, nil);

          {indicate that the SQL object is now out of sync with the Query object}
          FQueryOutOfSync := True;

          Modification;

          RefreshQuery;
        end
      else
        begin
          lbSelectFieldsChanged := FSQL.SelectFieldsChanged(aSQL);
          lbSearchCriteriaChanged := FSQL.SearchCriteriaChanged(aSQL);
          lbSortChanged := FSQL.OrderByFieldsChanged(aSQL);

          {assign the new sql object}
          FSQL.Assign(aSQL);

          {update the main report.ShowAutoSearchDialog boolean property - do this after
           the assign above}
          UpdateShowAutoSearchDialog;

          {free any previously created autosearch fields and create new ones}
          UpdateAutoSearchFields;

          {if select fields were changed, notify detail dataviews}
          if lbSelectFieldsChanged then
            SendEventNotify(Self, ciSQLSelectFieldsChanged, nil);

          {if search criteria were changed, notify detail dataviews}
          if lbSearchCriteriaChanged then
            SendEventNotify(Self, ciSQLSearchCriteriaChanged, nil);

          {if sort changed, notify detail dataviews}
          if lbSortChanged then
            SendEventNotify(Self, ciSQLOrderByFieldsChanged, nil);

          {indicate that the SQL object is now out of sync with the Query object}
          FQueryOutOfSync := True;

          Modification;

          {if the selected fields were changed, then resync the SQL and Query object immediately}
          if lbSelectFieldsChanged then
            begin
              ValidateLinks;

              RefreshQuery;
            end;

        end;

        if lbNameChanged then
          begin
            UpdateUserName;

            SendEventNotify(Self, ciSQLNameChanged, nil);
          end;

    end;


end; {procedure, SetSQL}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetQueryOutOfSync }

procedure TdaQueryDataView.SetQueryOutOfSync(aValue: Boolean);
begin

  {close any active datasets}
  if (Active) and (aValue) then
    SetActive(False);

  {indicate that the Query object is out of sync with the SQL object}
  FQueryOutOfSync := aValue;

  {notify detail dataviews that master query has changed}
  if FQueryOutOfSync then
    SendEventNotify(Self, ciSQLLinkChanged, nil);

  Modification;

end; {procedure, SetQueryOutOfSync}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetActive }

procedure TdaQueryDataView.SetActive(aValue: Boolean);
begin

  FSettingActive := True;

  {if Query object is out of sync with the SQL object, then refresh the query before making dataview active}
  if aValue and (FQueryOutOfSync) then
    RefreshQuery;

  inherited SetActive(aValue);

  FSettingActive := False;

end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SQLClass }

class function TdaQueryDataView.SQLClass: TdaSQLClass;
begin
  Result := TdaSQL;
end; {function, SQLClass}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.DataDesignerClass }

class function TdaQueryDataView.DataDesignerClass: TClass;
begin
  Result := GetClass('TdaQueryDesigner');
end; {function, DataDesignerClass}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Init }

procedure TdaQueryDataView.Init;
begin

  if (FSQL <> nil) then Exit;

  FSQL := SQLClass.Create(Self);

  {descendants should add code here to create a DataPipeline}

end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdateUserName }

procedure TdaQueryDataView.UpdateUserName;
var
  lDataPipeline: TppDataPipeline;
begin

  lDataPipeline := DataPipelines[0];

  {assign dataview user name}
  UserName := 'Query_' + ppTextToIdentifier(FSQL.DataPipelineName);

  lDataPipeline.UserName := FSQL.DataPipelineName;
  lDataPipeline.Name := lDataPipeline.UserName;

end; {procedure, UpdateUserName}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.RefreshQuery }

procedure TdaQueryDataView.RefreshQuery;
begin

  if not(FSettingActive) and (Active) then
    SetActive(False);

  {transfer SQL statement to TQuery object}
  SQLChanged;

  {transfer new info in SQL object to dataview}
  SQLToDataView;

  {refresh the dataview window with the new TppField objects}
  LinkChanged;

  FQueryOutOfSync := False;

end; {procedure, RefreshQuery}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SQLChanged }

procedure TdaQueryDataView.SQLChanged;
begin

  {descendants can add code here update implementation specific objects.
   For example update a TQuery object with SQL and DatabaseName }

end; {procedure, SQLChanged}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SQLToDataView }

procedure TdaQueryDataView.SQLToDataView;
var
  liIndex: Integer;
  lDataPipeline: TppDataPipeline;
begin

  if (DataPipelineCount = 0) then
    raise Exception.Create('TdaQueryDataView.SQLToDataView: No data pipeline to assign query to.')
  else
    lDataPipeline := DataPipelines[0];

  {free the links and the fields}
  lDataPipeline.FreeFields;
  lDataPipeline.FreeLinks;

  {create the fields}
  for liIndex := 0 to FSQL.SelectFieldCount - 1 do
    CreateField(lDataPipeline, FSQL.SelectFields[liIndex]);

  for liIndex := 0 to FSQL.CalcFieldCount - 1 do
    CreateField(lDataPipeline, FSQL.CalcFields[liIndex]);

  {configure linking}
  if (MasterDataView <> nil) then
    begin
      lDataPipeline.MasterDataPipeline := MasterDataView.DataPipelines[0];
      lDataPipeline.SkipWhenNoRecords := FSQL.SkipWhenNoRecords;

      if not(SQL.EditSQLAsText) then
        CreatePipelineLinks(lDataPipeline);
    end

  else
    lDataPipeline.MasterDataPipeline := nil;

end; {procedure, SQLToDataView}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateField }

procedure TdaQueryDataView.CreateField(aDataPipeline: TppDataPipeline; aField: TdaField);
var
  lField: TppField;
begin

  {create field from field map}
  lField := TppField.Create(nil);

  lField.DataType      := aField.DataType;
  lField.DisplayFormat := aField.DisplayFormat;
  lField.DisplayWidth  := aField.DisplayWidth;
  lField.FieldAlias    := aField.Alias;
  lField.FieldLength   := aField.FieldLength;
  lField.FieldName     := aField.SQLFieldName;
  lField.Linkable      := aField.Linkable;
  lField.TableName     := aField.TableSQLAlias;
  lField.Searchable    := aField.Searchable;
  lField.Selectable    := aField.Selectable;
  lField.Sortable      := aField.Sortable;

  lField.DataPipeline := aDataPipeline;

end; {procedure, CreateField}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.DoAfterGenerateSQL }

procedure TdaQueryDataView.DoAfterGenerateSQL(aSQL: TdaSQL);
begin
  if Assigned(FOnAfterGenerateSQL) then FOnAfterGenerateSQL(Self, aSQL);
end; {procedure, DoAfterGenerateSQL}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.DoBeforeGenerateSQL }

procedure TdaQueryDataView.DoBeforeGenerateSQL(aSQL: TdaSQL);
begin
  if Assigned(FOnBeforeGenerateSQL) then FOnBeforeGenerateSQL(Self, aSQL);
end; {procedure, DoBeforeGenerateSQL}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ReportBeforePrintEvent }

procedure TdaQueryDataView.ReportBeforePrintEvent;
begin

  if FQueryOutOfSync then
    begin
      RefreshQuery;

      Report.Engine.Reset;
    end;

  inherited ReportBeforePrintEvent;

end; {procedure, ReportBeforePrintEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SaveComponents }

procedure TdaQueryDataView.SaveComponents(Proc: TGetChildProc);
begin

  inherited SaveComponents(Proc);

  if (FSQL <> nil) then
    Proc(FSQL);

end; {procedure, SaveComponents}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AddChild }

procedure TdaQueryDataView.AddChild(aChild: TppRelative);
begin

  if (aChild is TdaSQL) then
    begin
      FSQL.Free;

      FSQL := TdaSQL(aChild);

      FSQL.AddEventNotify(Self);
    end
  else
    inherited AddChild(aChild);

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.InsertChild }

procedure TdaQueryDataView.InsertChild(aPosition: Integer; aChild: TppRelative);
begin

  if (aChild is TdaSQL) then
    begin
      FSQL.Free;

      FSQL := TdaSQL(aChild);

      FSQL.AddEventNotify(Self);
    end
  else
    inherited InsertChild(aPosition, aChild);

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.RemoveChild }

function TdaQueryDataView.RemoveChild(aChild: TppRelative): Integer;
begin

  Result := -1;

  if (aChild is TdaSQL) then
    begin
      FSQL.RemoveEventNotify(Self);

      FSQL := nil
    end
  else
    Result := inherited RemoveChild(aChild);

end; {function, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Loaded }

procedure TdaQueryDataView.Loaded;
begin

  inherited Loaded;

  {reestablish connection with master dataview}
  FixUpMasterDataView;

  FSQL.FixUpLinkColors;

  if FSQL.EditSQLAsText then
    EnabledOptions := [ppemText, ppemPreview];

  FSQL.AddEventNotify(Self);
  FSQL.Session := FSession;

  {re-assign this here - due to timing issues:
   setting the DataOwner enables the descendant classes to
   initialize a list of connection objects, such as TDatabase or TADOConnection, etc.}
  FSession.DataOwner := Owner;

  FSQL.Modified := False;

  UpdateAutoSearchFields;

  UpdateShowAutoSearchDialog;

  if (Report <> nil) and not(Report.Converted) then
    Report.Modified := False;

  {the first time the dataview is made active, regen the SQL}
  FQueryOutOfSync := True;

 {check validity of the datapipelne username}
  if (DataPipelineCount = 1) and (FSQL.DataPipelineName <> DataPipelines[0].UserName) then
    begin
      {attempt to set datapipeline to value of FSQL.DataPipeline}
      DataPipelines[0].UserName := FSQL.DataPipelineName;

      {if above attempt failed, then set the FSQL.DataPipelineName to the DataPipeline's UserName value}
      if DataPipelines[0].UserName <> FSQL.DataPipelineName then
        begin
         FSQL.DataPipelineName := DataPipelines[0].UserName;
         UpdateUserName;
        end;

    end;   
  

end; {procedure, Loaded}

{*******************************************************************************
 *
 **  A U T O S E A R C H
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AutoSearchFieldsExist }
function TdaQueryDataView.AutoSearchFieldsExist: Boolean;
begin
  {DataView.AutoSearchFieldsExists is called by DataModule.AutoSearchFieldsExist to
    determine whether any dataviews in the data module have auto search fields}
  Result := FSQL.AutoSearchFieldsExist;
end; {procedure, AutoSearchFieldsExist}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.RemoveAutoSearchFields }

procedure TdaQueryDataView.RemoveAutoSearchFields;
var
  lMainReport: TppReport;
begin

  if (Report = nil) or (csDestroying in Report.ComponentState) then Exit;

  lMainReport := TppReport(Report.MainReport);

  if (lMainReport <> nil) then
    begin
      FRemovingAutoSearchFields := True;

      try
        FreeAutoSearchFields(lMainReport);

      finally
        FRemovingAutoSearchFields := False;
      end;

    end;

end; {procedure, RemoveAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.FreeAutoSearchFields }

procedure TdaQueryDataView.FreeAutoSearchFields(aReport: TppReport);
var
  liIndex: Integer;
  lField: TppAutoSearchField;
  lFreeFields: TList;
begin

  lFreeFields := TList.Create;

  for liIndex := 0 to aReport.AutoSearchFieldCount - 1 do
    begin
      lField := aReport.AutoSearchFields[liIndex];

      if (lField.DataView = Self) then
        lFreeFields.Add(lField);
    end;

  for liIndex := 0 to lFreeFields.Count - 1 do
    TObject(lFreeFields[liIndex]).Free;

  lFreeFields.Free;

end; {procedure, FreeAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AddAutoSearchFields }

procedure TdaQueryDataView.AddAutoSearchFields;
var
  lMainReport: TppReport;
begin

  if (Report <> nil) then
    begin
      lMainReport := TppReport(Report.MainReport);

      if (lMainReport <> nil) then
        CreateAutoSearchFields(lMainReport);

    end;

end; {procedure, AddAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.AutoSearchFieldChangeEvent }

procedure TdaQueryDataView.AutoSearchFieldChangeEvent(Sender: TObject);
var
  lField: TppAutoSearchField;
  lCriteria: TdaCriteria;
  lFieldOperator: TdaCriteriaOperatorType;
begin
  
  lField := TppAutoSearchField(Sender);
  lCriteria := TdaCriteria(lField.Criteria);
  
  if (lCriteria.Field.FieldName <> lField.FieldName) then
    begin
      CreateCriteriaForAutoSearchField(lField);

      SQL.Modification;
  
      Report.Reset;
    end

  else
    begin
  
      if (lCriteria.Value <> lField.SearchExpression) then
        begin
          lCriteria.Value := lField.SearchExpression;
  
          SQL.Modification;

          Report.Reset;
        end;
  
      lFieldOperator := ppOperatorTodaOperator(lField.SearchOperator);
  
      if (lCriteria.Operator <> lFieldOperator) then
        begin
          lCriteria.Operator := lFieldOperator;
  
          SQL.Modification;
  
          Report.Reset;
        end;
  
      if (lCriteria.Field.ShowAllValues <> lField.ShowAllValues) then
        begin
          lCriteria.Field.ShowAllValues := lField.ShowAllValues;
  
          SQL.Modification;
  
          Report.Reset;
        end;
  
      if (lCriteria.Field.Mandatory <> lField.Mandatory) then
        begin
          lCriteria.Field.Mandatory := lField.Mandatory;
  
          SQL.Modification;
  
          Report.Reset;
        end;

    end;

end; {procedure, AutoSearchFieldChangeEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateAutoSearchFields }

procedure TdaQueryDataView.CreateAutoSearchFields(aReport: TppReport);
var
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lField: TppAutoSearchField;
begin

  for liIndex := 0 to FSQL.CriteriaCount - 1 do
    begin
      lCriteria := FSQL.Criteria[liIndex];

      if (lCriteria.Field <> nil) and (lCriteria.Field.AutoSearch) then
        begin
          lField := TppAutoSearchField.Create(Self);

          if (lCriteria.IsExpression) then
            lField.FieldAlias := lCriteria.Expression
          else
            lField.FieldAlias := lCriteria.Field.Alias;

          lField.FieldName := lCriteria.Field.FieldName;
          lField.DataType := lCriteria.Field.DataType;
          lField.SearchExpression := lCriteria.Value;
          lField.SearchOperator := daOperatorToppOperator(lCriteria.Operator);
          lField.ShowAllValues := lCriteria.Field.ShowAllValues;
          lField.Mandatory := lCriteria.Field.Mandatory;
          lField.TableAlias := lCriteria.Field.TableAlias;
          lField.TableName := lCriteria.Field.TableName;
  
          {save a pointer to the corresponding criteria and dataview}
          lField.Criteria := lCriteria;
          lField.DataView := Self;
          lField.OnChange := AutoSearchFieldChangeEvent;
  
          lField.Parent := aReport;
        end;
  
    end;
  
end; {procedure, CreateAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateCriteriaForAutoSearchField }

procedure TdaQueryDataView.CreateCriteriaForAutoSearchField(aAutoSearchField: TppAutoSearchField);
var
  lCriteria: TdaCriteria;
  lFields: TStrings;
  liIndex: Integer;
  lbMandatory: Boolean;
  lbShowAllValues: Boolean;
begin

  {get all available criteria fields}
  lFields := TStringList.Create;

  try
    if (SQL.AvailableCriteriaCount = 0) then
      SQL.Resync;
  
    SQL.AvailableCriteriaList(lFields);
  
    {set string list entries to field names}
    for liIndex := 0 to lFields.Count - 1 do
      lFields[liIndex] := TdaField(lFields.Objects[liIndex]).FieldName;
  
    {find corresponding field position}
    liIndex := lFields.IndexOf(aAutoSearchField.FieldName);
  
    if (liIndex <> -1) then
      begin
        lCriteria := SQL.SelectCriteria(liIndex);
  
        {link the autosearch field object to the criteria object}
        aAutoSearchField.DataView := Self;
        aAutoSearchField.Criteria := lCriteria;
        aAutoSearchField.OnChange := AutoSearchFieldChangeEvent;
  
        {assign the search expression and operator to the criteria}
        lCriteria.Value := aAutoSearchField.SearchExpression;
        lCriteria.Operator := ppOperatorTodaOperator(aAutoSearchField.SearchOperator);
  
        {save these property values from the autosearch field object}
        lbMandatory := aAutoSearchField.Mandatory;
        lbShowAllValues := aAutoSearchField.ShowAllValues;
  
        {update the autosearch field with the official information from the SQL object}
        SQL.daFieldToppField(lCriteria.Field, aAutoSearchField);
  
        {restore the autosearch related property values provided by the autosearchs field object}
        lCriteria.Field.AutoSearch := True;
        lCriteria.Field.ShowAllValues := lbShowAllValues;
        lCriteria.Field.Mandatory := lbMandatory;
  
      end;
  finally
    lFields.Free;
  end;
  
end; {procedure, CreateCriteriaForAutoSearchField}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ReportCreateAutoSearchCriteriaEvent }

procedure TdaQueryDataView.ReportCreateAutoSearchCriteriaEvent(aAutoSearchField: TObject);
var
  lppField: TppAutoSearchField;
  lDesigner: TppDesigner;
  liIndex: Integer;
begin

  {get data dictionary from designer}
  if (SQL.DataDictionary = nil) then
    begin
      {find a designer component in owner}
      lDesigner := nil;
      liIndex := 0;
  
      while (liIndex < Owner.ComponentCount) and (lDesigner = nil) do
        begin
           if (Owner.Components[liIndex] is TppDesigner) then
             lDesigner := TppDesigner(Owner.Components[liIndex])
           else
             Inc(liIndex);
        end;

      if (lDesigner <> nil) and (lDesigner.Report = Report) and (lDesigner.DataSettings.UseDataDictionary) then
        SQL.DataDictionary := TppDataDictionary(lDesigner.DataSettings.DataDictionary)
      else
        SQL.DataDictionary := nil;
    end;

  lppField := TppAutoSearchField(aAutoSearchField);

  if (CompareText(lppField.DataPipelineName, DataPipelines[0].UserName) <> 0) then Exit;

  CreateCriteriaForAutoSearchField(lppField);

  FLinkedAutoSearchFields.Add(lppField);

  lppField.AddNotify(Self);

end; {procedure, ReportCreateAutoSearchCriteriaEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ReportGetAutoSearchValuesEvent }

procedure TdaQueryDataView.ReportGetAutoSearchValuesEvent;
var
  liIndex: Integer;
  lCriteria: TdaCriteria;
  lField: TppAutoSearchField;
  lMainReport: TppReport;
  lbRefresh: Boolean;
begin

  if (Report = nil) then Exit;

  lMainReport := TppReport(Report.MainReport);

  if (lMainReport = nil) then Exit;


  lbRefresh := False;

  {if modal result is ok, then transfer auto search field values to auto search criteria}
  for liIndex := 0 to lMainReport.AutoSearchFieldCount - 1 do
    begin
      lField := lMainReport.AutoSearchFields[liIndex];

      if (lField.DataView = Self) then
        begin
         lCriteria := TdaCriteria(lField.Criteria);

          lCriteria.Value := lField.SearchExpression;
          
          lbRefresh := True;
        end;
    end;

  if lbRefresh then
    begin
      FQueryOutOfSync := True;

      SendEventNotify(Self, ciSQLSearchCriteriaChanged, nil);
    end;

end; {procedure, ReportGetAutoSearchValuesEvent}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetAutoSearchTabOrder }

procedure TdaQueryDataView.SetAutoSearchTabOrder(aValue: Integer);
var
  lMainReport: TppReport;
begin

  inherited SetAutoSearchTabOrder(aValue);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  if (Report <> nil) then
    begin
      lMainReport := TppReport(Report.MainReport);

      if (lMainReport <> nil) then
        lMainReport.Modified := True;
    end;

end; {procedure, SetAutoSearchTabOrder}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdateAutoSearchFields}

procedure TdaQueryDataView.UpdateAutoSearchFields;
begin

  RemoveAutoSearchFields;

  AddAutoSearchFields;

end; {procedure, UpdateAutoSearchFields}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdateShowAutoSearchDialog}

procedure TdaQueryDataView.UpdateShowAutoSearchDialog;
begin
  if (Parent <> nil) and (Parent is TdaDataModule) then
    TdaDataModule(Parent).UpdateShowAutoSearchDialog;

end; {procedure, UpdateShowAutoSearchDialog}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.daOperatorToppOperator }

function TdaQueryDataView.daOperatorToppOperator(aOperator: TdaCriteriaOperatorType): TppSearchOperatorType;
begin

  case aOperator of
    dacoEqual: Result := soEqual;
    dacoNotEqual: Result := soNotEqual;
    dacoLessThan: Result := soLessThan;
    dacoLessThanOrEqualTo: Result := soLessThanOrEqualTo;
    dacoGreaterThan: Result := soGreaterThan;
    dacoGreaterThanOrEqualTo: Result := soGreaterThanOrEqualTo;
    dacoLike: Result := soLike;
    dacoNotLike: Result := soNotLike;
    dacoBetween: Result := soBetween;
    dacoNotBetween: Result := soNotBetween;
    dacoInList: Result := soInList;
    dacoNotInList: Result := soNotInList;
    dacoBlank: Result := soBlank;
    dacoNotBlank: Result := soNotBlank;
  else
    Result := soEqual;
  end;
  
end; {function, daOperatorToppOperator}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ppOperatorTodaOperator }

function TdaQueryDataView.ppOperatorTodaOperator(aOperator: TppSearchOperatorType): TdaCriteriaOperatorType;
begin
  
  case aOperator of
    soEqual: Result := dacoEqual;
    soNotEqual: Result := dacoNotEqual;
    soLessThan: Result := dacoLessThan;
    soLessThanOrEqualTo: Result := dacoLessThanOrEqualTo;
    soGreaterThan: Result := dacoGreaterThan;
    soGreaterThanOrEqualTo: Result := dacoGreaterThanOrEqualTo;
    soLike: Result := dacoLike;
    soNotLike: Result := dacoNotLike;
    soBetween: Result := dacoBetween;
    soNotBetween: Result := dacoNotBetween;
    soInList: Result := dacoInList;
    soNotInList: Result := dacoNotInList;
    soBlank: Result := dacoBlank;
    soNotBlank: Result := dacoNotBlank;
  else
    Result := dacoEqual;
  end;

end; {function, ppOperatorTodaOperator}

{*******************************************************************************
 *
 **  D A T A V I E W   L I N K I N G
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.OutOfSync }

procedure TdaQueryDataView.OutOfSync;
begin

  { called when the data settings change, indicates to the dataview that the
    SQL must be regenerated }

  if Active then
    Active := False;

  FQueryOutOfSync := True;

end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Sync }

procedure TdaQueryDataView.Sync;
begin

  { called when the Design workspace is becoming active and the Data workspace
    is becoming inactive. Forces the dataview to update its data access objects
    (usually a TQuery) so that the Design workspace can access the data.}

  if FQueryOutOfSync then
    RefreshQuery;

end; {procedure, Sync}


{------------------------------------------------------------------------------}
{ TdaQueryDataView.DeleteLink }

procedure TdaQueryDataView.DeleteLink(aIndex: Integer);
var
  lLink: TdaSQLLink;
begin

  lLink := FSQL.Links[aIndex];

  FSQL.FreeLink(lLink);

  if (FSQL.LinkCount = 0) then
    SetMasterDataView(nil)
  else
    MasterDataView.LinkChanged;

  SetQueryOutOfSync(True);

  if not(csDestroying in ComponentState) then
    DoOnDeleteLink;

end; {procedure, DeleteLink}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetMasterDataView }

procedure TdaQueryDataView.SetMasterDataView(aDataView: TdaDataView);
begin

  {notify master dataview that linking has changed}
  if (MasterDataView <> nil) and (MasterDataView <> aDataView) then
    MasterDataView.LinkChanged;

  inherited SetMasterDataView(aDataView);

  {update master data pipeline property of detail data pipeline}
  if (csReading in ComponentState) or (csDestroying in ComponentState) then Exit;

  if MasterDataView <> nil then
    begin
      FMasterDataViewUserName := MasterDataView.UserName;

      FSQL.MasterSQL := MasterQueryDataView.SQL;
    end
  else
    begin
      FMasterDataViewUserName := '';
      
      FSQL.MasterSQL := nil;
    end;

  {notify master dataview that linking has changed}
  if (MasterDataView <> nil) then
    MasterDataView.LinkChanged;

  Modification;
  
end; {procedure, SetMasterDataView}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ClearMasterDataView }

procedure TdaQueryDataView.ClearMasterDataView;
begin

  FClearingMasterDataView := True;

  try
    if (FSQL <> nil) then
      FSQL.ClearSQLLinks;

    SetMasterDataView(nil);

    LinkChanged;

    SendEventNotify(Self, ciSQLLinkChanged, nil);

  finally
    FClearingMasterDataView := False;
  end;

end; {procedure, ClearMasterDataView}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ClearLinks }

procedure TdaQueryDataView.ClearLinks;
begin

  if (MasterDataView = nil) then Exit;

  SetMasterDataView(nil);

  FSQL.ClearSQLLinks;

  DoOnDeleteLink;
  
  LinkChanged;

  SetQueryOutOfSync(True);

end; {procedure, ClearLinks}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.ValidateLinks }

procedure TdaQueryDataView.ValidateLinks;
begin

  if (MasterDataView = nil) then Exit;

  {check to see if links are still valid, if links are invalid, the links will be freed and the MasterDataView will be set to nil}
  if not(FSQL.ValidateLinks) then
    begin
      if (FSQL.MasterSQL = nil) then
        SetMasterDataView(nil);

      DoOnDeleteLink;

      LinkChanged;

      SetQueryOutOfSync(True);
    end;

end; {procedure, ValidateLinks}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetMagicFieldCount }

function TdaQueryDataView.GetMagicFieldCount: Integer;
begin
  Result := FSQL.GetMagicFieldCount;
end; {procedure, GetMagicFieldCount}


{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetMagicSQLObject }

procedure TdaQueryDataView.GetMagicSQLObject(var aMagicSQL: TdaSQL);
begin

  {Generate MagicSQL if necessary}
  Sync;

  aMagicSQL := FSQL.GetMagicSQLObject;

end; {procedure, GetMagicSQLObject}


{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetMagicSQL }

procedure TdaQueryDataView.GetMagicSQL(aSQLText: TStrings);
begin
  aSQLText.Assign(FSQL.MagicSQLText);
end; {procedure, GetMagicSQL}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetLinkColorForField }

function TdaQueryDataView.GetLinkColorForField(aFieldName: String): TColor;
var
  lField: TdaField;
begin

  Result := 0;

  if (csDestroying in ComponentState) then Exit;

  lField := FSQL.GetFieldForSQLFieldName(aFieldName);

  if (lField <> nil) then
    Result := lField.LinkColor;

end; {function, GetLinkColorForField}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetLinkColor }

function TdaQueryDataView.GetLinkColor: TColor;
begin
  Result := FSQL.LinkColor;
end; {function, GetLinkColor}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.SetLinkColor }

procedure TdaQueryDataView.SetLinkColor(aColor: TColor);
begin
  FSQL.LinkColor := aColor;
end; {function, SetLinkColor}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.IsLinkable }

function TdaQueryDataView.IsLinkable: Boolean;
begin

  Result := True;

  if (csDestroying in ComponentState) then Exit;

  Result := not(FSQL.EditSQLAsText);
  
end; {function, IsLinkable}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.InMasterChain }

function TdaQueryDataView.InMasterChain(aDataView: TdaDataView): Boolean;
begin

  Result := (aDataView = MasterDataView);

  if not(Result) and (MasterDataview <> nil) then
    Result := MasterDataview.InMasterChain(aDataView);

end; {function, InMasterChain}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetMasterQueryDataView }

function TdaQueryDataView.GetMasterQueryDataView: TdaQueryDataView;
begin
  Result := TdaQueryDataView(MasterDataView);
end; {function, GetMasterQueryDataView}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.FixUpMasterDataView }

procedure TdaQueryDataView.FixUpMasterDataView;
var
  lDataModule: TdaDataModule;
  lMasterDataView: TdaDataView;
begin

  if (FMasterDataViewUserName = '') then Exit;

  lDataModule := TdaDataModule(Parent);

  lMasterDataView := lDataModule.FindDataViewByUserName(FMasterDataViewUserName);

  if (lMasterDataView <> nil) then
    SetMasterDataView(lMasterDataView)
  else
    raise Exception.Create('TdaQueryDataView.FixUpMasterDataView: Could not find master dataview: ' + FMasterDataViewUserName);

end; {procedure, FixUpMasterDataView}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetDescription }

function TdaQueryDataView.GetDescription: String;
begin
  if (FSQL <> nil) then
    Result := FSQL.DataPipelineName
  else
    Result := inherited GetDescription;
end;  {procedure, GetDescription}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetLinkDescription }

function TdaQueryDataView.GetLinkDescription: String;
begin

  if (MasterQueryDataView <> nil) then
    Result := GetDescription + ' ' + ppLoadStr(847) + ' ' +  MasterQueryDataView.GetDescription {'Linked to'}

  else
    Result := GetDescription;

end; {function, GetLinkDescription}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.LinkChanged }

procedure TdaQueryDataView.LinkChanged;
begin

  if (csDestroying in ComponentState) then Exit;

  DoOnLinkChange;

end; {procedure, LinkChanged}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.Link }

procedure TdaQueryDataView.Link(aLinkableDataViews: TList);
var
  liIndex: Integer;
  lSQLList: TList;
  lDataView: TdaDataView;
  liMasterSQLIndex: Integer;
begin

  if (aLinkableDataViews <> nil) then
    begin
      lSQLList := TList.Create;
      try
      
        for liIndex := 0 to aLinkableDataViews.Count - 1 do
          lSQLList.Add(TdaQueryDataView(aLinkableDataViews[liIndex]).SQL);

        if DisplayLinkDialog(lSQLList, liMasterSQLIndex) then
          begin

           if (FSQL.MasterSQL = nil) then
             ClearMasterDataView

            else
              begin
                lDataView := TdaQueryDataView(aLinkableDataViews[liMasterSQLIndex]);

                SetMasterDataView(lDataView);

                FSQL.ClearLinkColors;
                FSQL.FixUpLinkColors;

                SetQueryOutOfSync(True);

                LinkChanged;
              end;

           end;

      finally
        lSQLList.Free;
      end;
    end;

end; {procedure, Link}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.DisplayLinkDialog }

function TdaQueryDataView.DisplayLinkDialog(aSQLObjects: TList; var aMasterSQLIndex: Integer): Boolean;
var
  lFormClass: TFormClass;
  lLinkDialog: TdaCustomLinkDataViewDialog;
begin

  lFormClass := ppGetFormClass(TdaCustomLinkDataViewDialog);

  lLinkDialog := TdaCustomLinkDataViewDialog(lFormClass.Create(Self));
  lLinkDialog.SetDetailSQL(SQL);

  lLinkDialog.AddSQLObjects(aSQLObjects);

  try
    Result := lLinkDialog.Execute;

    if Result then
      begin
        aMasterSQLIndex := aSQLObjects.IndexOf(lLinkDialog.GetMasterSQL);
        UpdateLinkColors(True);
      end

    else
      aMasterSQLIndex := -1;
      
  finally
    lLinkDialog.Free;
  end;

end; {function, DisplayLinkDialog}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetLinkCount }

function TdaQueryDataView.GetLinkCount: Integer;
begin
  Result := FSQL.LinkCount;
end; {function, GetLinkCount}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetLinkFieldNames }

procedure TdaQueryDataView.GetLinkFieldNames(aIndex: Integer; var aMasterSQLFieldName, aDetailSQLFieldName: String);
var
  lLink: TdaSQLLink;
begin

  lLink := FSQL.Links[aIndex];

  aMasterSQLFieldName := lLink.MasterField.SQLFieldName;
  aDetailSQLFieldName := lLink.DetailField.SQLFieldName;

end; {procedure, GetLinkFieldNames}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateLinkObject }

procedure TdaQueryDataView.CreateLinkObject(aMasterDataView: TdaDataView; const aMasterFieldAlias, aDetailFieldAlias: String);
var
  lMasterField: TdaField;
  lDetailField: TdaField;
  lsOldMasterSQLFieldName: String;
  lsOldDetailSQLFieldName: String;
begin

  lMasterField := FSQL.MasterSQL.GetFieldForAlias(aMasterFieldAlias);
  lDetailField := FSQL.GetFieldForAlias(aDetailFieldAlias);

  lsOldMasterSQLFieldName := lMasterField.SQLFieldName;
  lsOldDetailSQLFieldName := lDetailField.SQLFieldName;

  FSQL.CreateLink(lMasterField, lDetailField);

  {if AutoLinking, aMasterDataView may be nil}
  if (aMasterDataView <> nil) then
    begin
      aMasterDataView.OutOfSync;
      TdaQueryDataView(aMasterDataView).UpdatePipelineFieldName(lsOldMasterSQLFieldName, lMasterField.SQLFieldName);
    end;
    
  UpdatePipelineFieldName(lsOldDetailSQLFieldName, lDetailField.SQLFieldName);

  if (aMasterDataView <> nil) then
    aMasterDataView.LinkChanged;

end; {procedure, CreateLinkObject}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateLink }

procedure TdaQueryDataView.CreateLink(aMasterDataView: TdaDataView; aMasterFieldAlias, aDetailFieldAlias: String);
begin

  if (aMasterDataView = nil) or (aMasterFieldAlias = '') or (aDetailFieldAlias = '') or
     (aMasterDataView = Self) or (aMasterDataView.InMasterChain(Self)) then Exit;

  if (MasterDataView <> nil) then
    FSQL.ClearSQLLinks;

  SetMasterDataView(aMasterDataView);

  CreateLinkObject(aMasterDataView, aMasterFieldAlias, aDetailFieldAlias);

  SetQueryOutOfSync(True);

  LinkChanged;

end; {procedure, CreateLink}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreateAutoLink }

function TdaQueryDataView.CreateAutoLink(aLinkableDataViews: TList; aDataDictionary: TObject): Boolean;
var
  lDataDictionary: TppDataDictionary;
  lDataView: TdaQueryDataView;
  liIndex: Integer;
  lLinkedDataViews: TList;
begin

  Result := False;

  {called when the data view is first created, allows the data view to search
   for automatic link possibilities with other dataviews using the Data
   Dictionary }
  
  lDataDictionary := TppDataDictionary(aDataDictionary);
  
  if (lDataDictionary = nil) or not(lDataDictionary.AutoJoin) then Exit;

  lLinkedDataViews := TList.Create;

  for liIndex := 0 to aLinkableDataViews.Count - 1 do
    begin
      lDataView := TdaQueryDataView(aLinkableDataViews[liIndex]);

      {Don't involve dataviews with more than one table in AutoJoining}
      if (lDataView.SQL.SelectTableCount = 1) then
        begin
          {attempt to link to this dataview as a detail, if successful, add this dataview to the 'linked' list}
          if (MasterDataView = nil) and GetAutoLinks(lDataView, lDataDictionary) then
            lLinkedDataViews.Add(lDataView)

          {attempt to link to this dataview as a master, if successful, add this dataview to the 'linked' list }
          else if (lDataView.MasterDataView = nil) and lDataView.GetAutoLinks(Self, lDataDictionary) then
            lLinkedDataViews.Add(lDataView);

        end;

    end;

  {transfer the newly linked dataviews into the LinkableDataViews parameter}
  aLinkableDataViews.Clear;
  
  for liIndex := 0 to lLinkedDataViews.Count - 1 do
    begin
      if (liIndex = 0) then
        aLinkableDataViews.Add(Self);

      aLinkableDataViews.Add(lLinkedDataViews[liIndex]);
    end;

  Result := (lLinkedDataViews.Count <> 0);

  lLinkedDataViews.Free;

end; {function, CreateAutoLink}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.GetAutoLinks }

function TdaQueryDataView.GetAutoLinks(aMasterDataView: TdaQueryDataView; aDataDictionary: TppDataDictionary): Boolean;
var
  lMasterSQL: TdaSQL;
  liIndex: Integer;
  liIndex2: Integer;
  liIndex3: Integer;
  lsJoinType: String;
  lMasterFieldNames: TStrings;
  lDetailFieldNames: TStrings;
  lOperators: TStrings;
  lsMasterFieldName: String;
  lsDetailFieldName: String;
  lJoinType: TdaJoinType;
  lsMasterTableName: String;
  lsDetailTableName: String;
  lMasterField: TdaField;
  lDetailField: TdaField;
  lbAllFieldsFound: Boolean;
begin
  
  Result := False;

  lMasterSQL := aMasterDataView.SQL;

  lMasterFieldNames := TStringList.Create;
  lDetailFieldNames := TStringList.Create;
  lOperators := TStringList.Create;
  lsJoinType := '';

  liIndex := 0;

  while not(Result) and (liIndex < lMasterSQL.SelectTableCount) do
    begin
      lsMasterTableName := lMasterSQL.SelectTables[liIndex].RawTableName;

      liIndex2 := 0;

      while not(Result) and (liIndex2 < SQL.SelectTableCount) do
        begin
          lsDetailTableName := SQL.SelectTables[liIndex2].RawTableName;

          lMasterFieldNames.Clear;
          lDetailFieldNames.Clear;
          lOperators.Clear;
          lsJoinType := '';

          {if we have not found a master, try to make the current dataview our master}
          if aDataDictionary.GetLinkData(lsMasterTableName, lsDetailTableName, lsJoinType, lMasterFieldNames, lDetailFieldNames, lOperators) then
            begin
              {make sure all fields needed for linking are in the queries}
              liIndex3 := 0;
              lbAllFieldsFound := True;

              while (lbAllFieldsFound) and (liIndex3 < lMasterFieldNames.Count) do
                begin
                  lsMasterFieldName := lMasterFieldNames[liIndex3];
                  lsDetailFieldName := lDetailFieldNames[liIndex3];

                  lMasterField := aMasterDataView.SQL.GetFieldForFieldName(lsMasterFieldName);
                  lDetailField := SQL.GetFieldForFieldName(lsDetailFieldName);

                  if (lMasterField = nil) or (lDetailField = nil) then
                    lbAllFieldsFound := False
                  else
                    begin
                      lMasterFieldNames[liIndex3] := lMasterField.FieldAlias;
                      lDetailFieldNames[liIndex3] := lDetailField.FieldAlias;

                      Inc(liIndex3);
                    end;
                end;

              {link the dataviews}
              if (lbAllFieldsFound) then
                begin
                  Result := True;

                  lJoinType := TdaJoinType(ppGetEnumStringAsInteger(TypeInfo(TdaJoinType), lsJoinType));

                  if (lJoinType = dajtInner) then
                    DataPipelines[0].SkipWhenNoRecords := True
                  else
                    DataPipelines[0].SkipWhenNoRecords := False;

                  FSQL.MasterSQL := lMasterSQL;
                  
                  for liIndex3 := 0 to lMasterFieldNames.Count - 1 do
                    begin
                      lsMasterFieldName := lMasterFieldNames[liIndex3];
                      lsDetailFieldName := lDetailFieldNames[liIndex3];

                      CreateLinkObject(MasterDataView, lsMasterFieldName, lsDetailFieldName);
                    end;
                end;

            end;

          Inc(liIndex2);

        end; {while, each detail table}

      Inc(liIndex);

    end; {while, each master table}

  lMasterFieldNames.Free;
  lDetailFieldNames.Free;
  lOperators.Free;

  {update master dataview, notify any children}
  if (Result) then
    begin
      SetMasterDataView(aMasterDataView);

      SetQueryOutOfSync(True);

      LinkChanged;
    end;

end; {function, GetAutoLinks}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdateEnabledOptions }

procedure TdaQueryDataView.UpdateEnabledOptions(aLinkableDataViews: TList);
var
  lbLinkableDataViewsFound: Boolean;
  liIndex: Integer;
  lDataView: TdaQueryDataView;
begin

  lbLinkableDataViewsFound := False;
  liIndex := 0;

  while not(lbLinkableDataViewsFound) and (liIndex < aLinkableDataViews.Count) do
    begin
      lDataView := TdaQueryDataView(aLinkableDataViews[liIndex]);

      if (lDataView <> Self) and lDataView.IsLinkable and not(lDataView.InMasterChain(Self)) then
        lbLinkableDataViewsFound := True
      else
        Inc(liIndex);
    end;

  if (lbLinkableDataViewsFound) and not(FSQL.EditSQLAsText) then
    EnabledOptions := EnabledOptions + [ppemLink]
  else
    EnabledOptions := EnabledOptions - [ppemLink];

end; {procedure, UpdateEnabledOptions}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdateLinkColors }

procedure TdaQueryDataView.UpdateLinkColors(aUpdateUpward: Boolean);
var
  lDataModule: TdaDataModule;
  lDataViews: TList;
  liIndex: Integer;
  lDataView: TdaDataView;
begin

  FSQL.FixupLinkColors;

  {Call Master's FixupLinkColors}
  if (aUpdateUpward) then
    begin
      if (MasterQueryDataView <> nil) then
        MasterQueryDataView.SQL.FixUpLinkColors;
    end

  {Call childrens' FixupLinkColors}
  else
    begin
      lDataViews := TList.Create;

      try
        lDataModule := TdaDataModule(Parent);

        lDataModule.GetLinkableDataViews(lDataViews);

        for liIndex := 0 to lDataViews.Count - 1 do
          begin
            lDataView := TdaDataView(lDataViews[liIndex]);

            if (lDataView is TdaQueryDataView) and (TdaQueryDataView(lDataView).InMasterChain(Self)) then
              TdaQueryDataView(lDataView).SQL.FixupLinkColors;
          end;
      finally
        lDataViews.Free;
      end;
    end;

end; {procedure, UpdateLinkColors}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.UpdatePipelineFieldName }

procedure TdaQueryDataView.UpdatePipelineFieldName(const aOldSQLFieldName, aNewSQLFieldName: String);
var
  lDataPipeline: TppDataPipeline;
  liIndex: Integer;
  lbFound: Boolean;
begin

  lDataPipeline := DataPipelines[0];

  if (lDataPipeline <> nil) then
    begin
      lbFound := False;
      liIndex := 0;

      while not(lbFound) and (liIndex < lDataPipeline.FieldCount) do
        if (ppEqual(aOldSQLFieldName, lDataPipeline.Fields[liIndex].FieldName)) then
          begin
            lDataPipeline.Fields[liIndex].FieldName := aNewSQLFieldName;
            lbFound := True;
          end
        else
          Inc(liIndex);

    end;

end; {procedure, UpdatePipelineFieldName}

{------------------------------------------------------------------------------}
{ TdaQueryDataView.CreatePipelineLinks }

procedure TdaQueryDataView.CreatePipelineLinks(aDataPipeline: TppDataPipeline);
var
  liIndex: Integer;
  lLink: TppMasterFieldLink;
  lsMasterFieldName: String;
  lsDetailFieldName: String;
  lbDetailAscending: Boolean;
  lMasterMagicSQL: TdaSQL;
begin

  if (aDataPipeline = nil) then
    raise Exception.Create('TdaQueryDataView.CreatePipelineLinks: Could not create links, no data pipeline found.');

  if (MasterQueryDataView <> nil) then
    MasterQueryDataView.GetMagicSQLObject(lMasterMagicSQL);

  for liIndex := 0 to FSQL.MagicLinkFieldNameCount - 1 do
    begin
      lsMasterFieldName := '';
      lsDetailFieldName := '';
      lbDetailAscending := True;

      if FSQL.GetMagicLinkFieldNames(liIndex, lsMasterFieldName, lsDetailFieldName, lMasterMagicSQL, lbDetailAscending) then
        begin
          lLink := TppMasterFieldLink.Create(nil);

          lLink.MasterFieldName := lsMasterFieldName;
          lLink.DetailFieldName := lsDetailFieldName;
          lLink.IsCaseSensitive := FSQL.IsCaseSensitive;

          if (lbDetailAscending) then
            lLink.DetailSortOrder := soAscending
          else
            lLink.DetailSortOrder := soDescending;

          lLink.Parent := aDataPipeline;
        end;
    end;

end; {procedure, CreatePipelineLinks}


end.
