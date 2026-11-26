{******************************************************************************}
{                                                                              }
{                    ReportBuilder Report Component Library                    }
{                                                                              }
{             Copyright (c) 1996-1998 Digital Metaphors Corporation            }
{                                                                              }
{******************************************************************************}

unit dvDataVw;

interface

uses
  Windows,
  WinProcs, WinTypes,
  Messages, Classes, Dialogs, SysUtils,
  ppComm, ppClass, ppReport, ppBands, ppCtrls, ppTypes, ppTmplat, ppUtils, ppDB,
  ppVar;

type

  TppFieldMap = class;
  TppDataMap  = class;
  TppDataView = class;
  TppDataViewTemplate = class;
  TppDataViewClass = class of TppDataView;


  TppSortOrderType = (soAscending, soDescending);

  {This unit contains the ancestor classes used to implement DataViews. It is
   unlikely that you will need to modify these classes. Sample DataViews that
   inherit from TppDataView are located in myDataVw.pas }

  {Summary of classes defined in this unit:

     1. TppFieldMap
          - FieldMaps are used to translate readable FieldAliases displayed to
            the end-user into DataPipeline, DataField attributes used by ReportBuilder
            data-aware components.

     2. TppDataMap
          - DataMaps are used to translate readable DataAliases displayed to
            the user into Master/Detail DataPipeline attributes used by ReportBuilder
            reports. These are useful for defining dataviews that contain
            master/detail/detail relationships.

     3. TppDataView
          - DataViews are containers for all data access components: tables, queries,
            data sources, data pipelines, etc. Additionally DataViews contain
            DataMaps and FieldMaps used to translate a user friendly
            view of the database into the underlying implementation.

          - DataViews have built-in event handlers that are assigned to TppDesigner
            events at run-time. This enables the Report Designer to communicate
            with the DataViews. (The DataView eventhandlers are assigned to
            TppDesigner by the report notebook.)

          - DataViews have a Template property that enables them to be loaded
            and saved to files and database BLOB fields.

     4. TppDataViewTemplate
          - TppTemplate descendant class used by the DataView to load and save
            templates to a file or database BLOB field.}


  { TppFieldMap }
  TppFieldMap = class(TComponent)
    private
      FComponent: TComponent;
      FDataPipeline: TppDataPipeline;
      FFieldAlias: String;
      FFieldName: String;
      FColumnWidth: Integer;
      FDisplayFormat: String;
      FGroupOrder: Integer;
      FLabel: TComponent;
      FOnFormat: TppFormatEvent;
      FSearchable: Boolean;
      FSortable: Boolean;
      FSortOrder: Integer;
      FSearchValue: String;
      FSelectable: Boolean;
      FSortUsed: Boolean;
      FSearchUsed: Boolean;
      FSelectOrder: Integer;
      FSortType: TppSortOrderType;
      FTableName: String;

      {used for conversion to 3.0}
      FDataSource: String;

      {used for conversion to 3.0 }
      procedure ReadDataSource(Reader: TReader);
      procedure ReadOnFormatText(Reader: TReader);

    protected
      {used for conversion to 3.0}
      procedure DefineProperties(Filer: TFiler); override;

      procedure ReadState(Reader: TReader); override;

    public

      constructor Create(aOwner: TComponent); override;

{$IFDEF WIN32  }
      function  GetParentComponent: TComponent; override;
      procedure SetParentComponent(Value: TComponent); override;
{$ENDIF }

      function  HasParent: Boolean; override;
      function CustomDisplayFormat: Boolean;

      {used by ReportWizard when generating report}
      property ColumnWidth: Integer read FColumnWidth write FColumnWidth;
      property ppComponent: TComponent read FComponent write FComponent;
      property ppLabel: TComponent read FLabel write FLabel;

      {used for conversion to 3.0}
      property DataSource: String read FDataSource;

    published
      property DataPipeline: TppDataPipeline read FDataPipeline write FDataPipeline;
      property DisplayFormat: String read FDisplayFormat write FDisplayFormat;
      property FieldAlias: String read FFieldAlias write FFieldAlias;
      property FieldName: String read FFieldName write FFieldName;
      property GroupOrder: Integer read FGroupOrder write FGroupOrder;
      property OnFormat: TppFormatEvent read FOnFormat write FOnFormat;
      property Searchable: Boolean read FSearchable write FSearchable;
      property SearchUsed: Boolean read FSearchUsed write FSearchUsed;
      property SearchValue: String read FSearchValue write FSearchValue;
      property Selectable: Boolean read FSelectable write FSelectable;
      property SelectOrder: Integer read FSelectOrder write FSelectOrder;
      property Sortable: Boolean read FSortable write FSortable;
      property SortOrder: Integer read FSortOrder write FSortOrder;
      property SortType: TppSortOrderType read FSortType write FSortType;
      property SortUsed: Boolean read FSortUsed write FSortUsed;
      property TableName: String read FTableName write FTableName;

  end; {class TppFieldMap }



  { TppDataMap }
  TppDataMap = class(TComponent)
    private
      FDataAlias: String;
      FDataMaps: TList;
      FDataView: TppDataView;
      FDetailPipeline: TppDataPipeline;
      FLevel: Integer;
      FMasterPipeline: TppDataPipeline;
      FParent: TppDataMap;
 
      function  AddDataMap(aDataMap: TppDataMap): Integer;
      function  GetDataMap(Index: Integer): TppDataMap;
      function  GetDataMapCount: Integer;
      function  GetDataView: TppDataView;
      function  GetHasChildren: Boolean;
      function  GetLevel: Integer;
      procedure SetDataView(aDataView: TppDataView);
      procedure SetParent(aDataMap: TppDataMap);
      function  RemoveDataMap(aDataMap: TppDataMap): Integer;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      property DataView: TppDataView read GetDataView write SetDataView;
      property HasChildren: Boolean read GetHasChildren;
      property Parent: TppDataMap read FParent write SetParent;
      property DataAlias: String read FDataAlias write FDataAlias;
      property DetailPipeline: TppDataPipeline read FDetailPipeline write FDetailPipeline;
      property Level: Integer read GetLevel;
      property MasterPipeline: TppDataPipeline read FMasterPipeline write FMasterPipeline;

      property DataMaps[Index: Integer]: TppDataMap read GetDataMap; default;
      property DataMapCount: Integer read GetDataMapCount;

  end; {class, TppDataMap}


  { TppDataView }
  TppDataView = class(TppCommunicator)
    private
      FActive: Boolean;
      FClassDescription: String;
      FCustomDisplayFormats: Boolean;
      FDataMapList: TStringList;
      FFieldMapList: TStringList;
      FReport: TppCustomReport;
      FSaveComponents: Boolean;
      FTemplate: TppDataViewTemplate;
      FVersion: String;
      FVersionNo: Integer;

      function  GetDataMap(Index: Integer): TppDataMap;
      function  GetDataMapCount: Integer;
      function  GetFieldMap(Index: Integer): TppFieldMap;
      function  GetFieldMapCount: Integer;
      procedure SetReport(aReport: TppCustomReport);
      procedure SetTemplate(aTemplate: TppDataViewTemplate);

      {read/write private 'fake' properties}
      procedure ReadVersion(Reader: TReader);
      procedure WriteVersion(Writer: TWriter);

    protected
      {defines 'fake' properties}
      procedure DefineProperties(Filer: TFiler); override;
      procedure ConvertToLatestVersion; virtual;

{$IFDEF WIN32 }
      procedure GetChildren(Proc: TGetChildProc; aRoot: TComponent); override;
{$ELSE }
      procedure WriteComponents(Writer: TWriter); override;
      procedure WriteState(Writer: TWriter); override;
{$ENDIF }

      procedure Loaded; override;
      procedure SetActive(Value: Boolean); virtual;
      procedure FreeDataMaps;
      procedure FreeFieldMaps;

      property SaveComponents: Boolean read FSaveComponents write FSaveComponents;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType); override;
      function  AddDataMap(aDataMap: TppDataMap): Integer;
      function  AddFieldMap(aFieldMap: TppFieldMap): Integer;
      procedure ClearFieldMapValues;
      function  CreateDataMap(const aDataAlias: String; aMasterPipeline, aDetailPipeline: TppDataPipeline;
                                     aParentDataMap: TppDataMap): Integer;
      procedure CreateDataMaps; virtual;
      function  CreateFieldMap(const aTableName, aFieldName, aFieldAlias: String; aDataPipeline: TppDataPipeline;
                                     aSearchable, aSortable: Boolean): Integer;
      procedure CreateFieldMaps; virtual;
      function  DataMapByAlias(aDataAlias: String): TppDataMap;
      function  DataMapByPipeline(aMasterPipeline, aDetailPipeline: TppDataPipeline): TppDataMap;
      procedure Design; virtual;
      function  FindDataMap(aDataMap: TppDataMap): Integer;
      function  FindFieldMap(aFieldMap: TppFieldMap): Integer;
      function  FieldMapByAlias(aFieldAlias: String): TppFieldMap;
      function  FieldMapByField(aDataPipeline: TppDataPipeline; const aDataField: String): TppFieldMap;
      function  FieldPositionByAlias(aFieldAlias: String): Integer;
      function  GetDataAliases: TStrings; virtual;
      function  GetDataMapForReport(aReport: TppCustomReport): TppDataMap;
      function  GetReportForDataMap(aDataMap: TppDataMap): TppCustomReport;
      function  GetValidName(aComponent: TComponent): String; Override;
      procedure Preview; virtual;
      function  RemoveDataMap(aDataMap: TppDataMap): Integer;
      function  RemoveFieldMap(aFieldMap: TppFieldMap): Integer;
      procedure ReportAssigned; virtual;
      procedure Transfer(aDataView: TppDataView); virtual;

      {run-time event handlers used to communicate with TppDesigner }
      procedure AssignField(Sender: TObject); virtual;
      function  GetFieldAliases: TStrings; virtual;
      procedure GetDisplayFormats(Sender: TObject; DisplayFormats: TStrings); virtual;

{$IFDEF WIN32 }
      procedure GetAliasForField(Sender: TObject; aDataPipeline: TObject;
                                 const aDataField: String; var aFieldAlias: String); virtual;
      procedure GetFieldForAlias(Sender: TObject; const aFieldAlias: String;
                                 var aDataPipeline: TObject; var aDataField: String); virtual;
{$ELSE}
      procedure GetAliasForField(Sender: TObject; aDataPipeline: TObject;
                                 const aDataField: String; var aFieldAlias: OpenString); virtual;
      procedure GetFieldForAlias(Sender: TObject; const aFieldAlias: String;
                                 var aDataPipeline: TObject; var aDataField: OpenString); virtual;
{$ENDIF}

      {used for conversion to 3.0}
      procedure ConvertReport(aReport: TppCustomReport); virtual;

      property Active: Boolean read FActive write SetActive;
      property DataMaps[Index: Integer]: TppDataMap read GetDataMap;
      property DataMapCount: Integer read GetDataMapCount;
      property CustomDisplayFormats: Boolean read FCustomDisplayFormats write FCustomDisplayFormats;
      property FieldMaps[Index: Integer]: TppFieldMap read GetFieldMap;
      property FieldMapCount: Integer read GetFieldMapCount;
      property Template: TppDataViewTemplate read FTemplate write SetTemplate;
      property Version: String read FVersion;
      property VersionNo: Integer read FVersionNo;

    published


{$IFDEF WIN32}
      {this must be published so that the OnFormat event of DBText can save the reference}
      procedure Format(Sender: TObject; DisplayFormat: String; DataType: TppDataType;
                                 Value: Variant; var Text: String); virtual;
{$ELSE}
      {this must be published so that the OnFormat event of DBText can save the reference}
      procedure Format(Sender: TObject; DisplayFormat: String; DataType: TppDataType;
                                 Value: Pointer; var Text: String); virtual;
{$ENDIF}

      property ClassDescription: String read FClassDescription write FClassDescription;
      property Report: TppCustomReport read FReport write SetReport;

  end; {class TppDataView}



  { TppDataViewTemplate }
  TppDataViewTemplate = class(TppTemplate)
    private
      FDataView: TppDataView;
      FNewDataView: TppDataView;
      FSaveDataView: TppDataView;
      FSaveOwner: TComponent;

    protected

      {functions used by Reader during load }
      procedure LoadCallback(Component: TComponent); override;
      procedure LoadSetName(Reader: TReader; Component: TComponent; var Name: string); override;

      function LoadStart: Boolean; override;
      procedure LoadEnd(aLoaded: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure New; override;

  end; {class, TppDataViewTemplate }


  {general routines}
  function CreateDataView(const aClassName: String; aOwner: TComponent): TppDataView;

  
implementation

{******************************************************************************
 *
 ** G E N E R A L   R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ CreateDataView }

function CreateDataView(const aClassName: String; aOwner: TComponent): TppDataView;
var
  lClass: TComponentClass;
begin
  {get an instance of the class for this dataview}
  lClass := TComponentClass(GetClass(aClassName));

  {instantiate a data view of the selected type}
  if (lClass <> nil) then
    Result := TppDataView(lClass.Create(aOwner))

  else
    Result := nil;

end;


{******************************************************************************
 *
 ** D A T A   M A P
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataMap.Create }

constructor TppDataMap.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataAlias      := '';
  FDataMaps       := nil;
  FDetailPipeline := nil;
  FLevel          := 1;
  FMasterPipeline := nil;
  FParent         := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataMap.Destroy }

destructor TppDataMap.Destroy;
begin

  FDataMaps.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataMap.AddDataMap }

function TppDataMap.AddDataMap(aDataMap: TppDataMap): Integer;
begin
  if FDataMaps = nil then
    FDataMaps := TList.Create;

  Result := FDataMaps.Add(aDataMap);

end; {function, AddDataMap}

{------------------------------------------------------------------------------}
{ TppDataMap.GetDataMap }

function TppDataMap.GetDataMap(Index: Integer): TppDataMap;
begin

  if FDataMaps = nil then
    Result := nil
  else
    Result := TppDataMap(FDataMaps[Index]);

end; {function, GetDataMap}

{------------------------------------------------------------------------------}
{ TppDataMap.GetDataMap }

function TppDataMap.GetDataMapCount: Integer;
begin

  if FDataMaps = nil then
    Result := 0
  else
    Result := FDataMaps.Count;

end; {function, GetDataMapCount}

{------------------------------------------------------------------------------}
{ TppDataMap.GetDataMap }

function TppDataMap.GetHasChildren: Boolean;
begin

  if FDataMaps = nil then
    Result := False
  else
    Result := (FDataMaps.Count > 0);

end; {function, GetDataMap}


{------------------------------------------------------------------------------}
{ TppDataMap.GetDataView }

function TppDataMap.GetDataView: TppDataView;
begin

  if FParent = nil then
    Result := FDataView
  else
    Result := FParent.DataView;

end; {function, GetDataView}

{------------------------------------------------------------------------------}
{ TppDataMap.GetLevel }

function TppDataMap.GetLevel: Integer;
begin

  if FParent = nil then
    Result := 0
  else
    Result := FParent.Level + 1;

end; {function, GetLevel}

{------------------------------------------------------------------------------}
{ TppDataMap.SetDataView }

procedure TppDataMap.SetDataView(aDataView: TppDataView);
begin

  if (FParent <> nil) and (FParent.DataView <> aDataView) then
    FParent.RemoveDataMap(Self);

  FDataView := aDataView;

end; {procedure, SetParent}


{------------------------------------------------------------------------------}
{ TppDataMap.SetParent }

procedure TppDataMap.SetParent(aDataMap: TppDataMap);
begin

  if FParent <> nil then
    FParent.RemoveDataMap(Self);

  FParent := aDataMap;

  if FParent <> nil then
    FParent.AddDataMap(Self);

end; {procedure, SetParent}

{------------------------------------------------------------------------------}
{ TppDataMap.RemoveDataMap }

function TppDataMap.RemoveDataMap(aDataMap: TppDataMap): Integer;
begin

  if FDataMaps = nil then
    Result := -1
  else
    Result := FDataMaps.Remove(aDataMap);

  if FDataMaps.Count = 0 then
    begin
      FDataMaps.Free;
      FDataMaps := nil;
    end;
    
end; {function, RemoveDataMap}

{******************************************************************************
 *
 ** F I E L D   M A P
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppFieldMap.Create }

constructor TppFieldMap.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataPipeline   := nil;
  FDisplayFormat  := '';
  FFieldAlias     := '';
  FFieldName      := '';
  FGroupOrder     := -1;
  FOnFormat       := nil;
  FSearchable     := False;
  FSortable       := False;
  FSortUsed       := False;
  FSortOrder      := -1;
  FSortType       := soAscending;
  FSearchValue    := '';
  FSearchUsed     := False;
  FSelectable     := True;
  FSelectOrder    := -1;

end;

{------------------------------------------------------------------------------}
{ TppFieldMap.DefineProperties }

procedure TppFieldMap.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('DataSource', ReadDataSource, nil, False);
  Filer.DefineProperty('OnFormatText', ReadOnFormatText, nil, False);

end; {procedure, DefineProperties}

{------------------------------------------------------------------------------}
{ TppFieldMap.ReadDataSource }

procedure TppFieldMap.ReadDataSource(Reader: TReader);
begin
  FDataSource := Reader.ReadIdent;

end; {procedure, ReadDataSource}


{------------------------------------------------------------------------------}
{ TppFieldMap.ReadOnFormatText }

procedure TppFieldMap.ReadOnFormatText(Reader: TReader);
begin
  Reader.ReadIdent;

end; {procedure, ReadOnFormatText}

{------------------------------------------------------------------------------}
{ TppFieldMap.CustomDisplayFormat }

function TppFieldMap.CustomDisplayFormat: Boolean;
begin
  Result := Assigned(FOnFormat);
end;


{------------------------------------------------------------------------------}
{ TppFieldMap.HasParent }

function TppFieldMap.HasParent: Boolean;
begin
  Result := True;
end;

{------------------------------------------------------------------------------}
{ TppFieldMap.ReadState }

procedure TppFieldMap.ReadState(Reader: TReader);
begin

  inherited ReadState(Reader);

{$IFDEF WINDOWS}

  if Reader.Parent is TppDataView then
    TppDataView(Reader.Parent).AddFieldMap(Self);

{$ENDIF}


end; {procedure, ReadState}



{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppFieldMap.GetParentComponent - required method for Components with HasParent = True }

function TppFieldMap.GetParentComponent: TComponent;
begin
  Result := Owner;
end;

{------------------------------------------------------------------------------}
{ TppFieldMap.SetParentComponent - required method for Components with HasParent = True }

procedure TppFieldMap.SetParentComponent(Value: TComponent);
begin

  if (Value is TppDataView) then
    TppDataView(Value).AddFieldMap(Self);

end;


{$ENDIF}


{******************************************************************************
 *
 ** D A T A  V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataView.Create }

constructor TppDataView.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);

  FClassDescription := '';
  FCustomDisplayFormats := False;
  FDataMapList := TStringList.Create;
  FFieldMapList := TStringList.Create;
  FReport := nil;
  FSaveComponents := False;
  FTemplate := TppDataViewTemplate.Create(Self);
  FVersion := '1.0';

end; {constructor, Create}


{------------------------------------------------------------------------------}
{ TppDataView.Destroy }

destructor TppDataView.Destroy;
begin

  FreeDataMaps;
  FreeFieldMaps;

  FDataMapList.Free;
  FFieldMapList.Free;
  FTemplate.Free;
  
  inherited Destroy;

end; {destructor, Destroy}


{------------------------------------------------------------------------------}
{ TppDataView.Notify }

procedure TppDataView.Notify(aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  inherited Notify(aCommunicator, aOperation);

  if (aOperation = ppopRemove) and (aCommunicator is TppCustomReport) then

    if aCommunicator = FReport then
      SetReport(nil);

end;

{------------------------------------------------------------------------------}
{ TppDataView.FreeDataMaps }

procedure TppDataView.FreeDataMaps;
var
  liDataMap: Integer;

begin
  for liDataMap := DataMapCount-1 downto 0 do
    DataMaps[liDataMap].Free;

  FDataMapList.Clear;
end;

{------------------------------------------------------------------------------}
{ TppDataView.FreeFieldMaps }

procedure TppDataView.FreeFieldMaps;
var
  liFieldMap: Integer;

begin
  for liFieldMap := FieldMapCount-1 downto 0 do
    FieldMaps[liFieldMap].Free;

  FFieldMapList.Clear;
end;

{------------------------------------------------------------------------------}
{ TppDataView.Loaded }

procedure TppDataView.Loaded;
begin
  inherited Loaded;

  CreateDataMaps;

end;

{------------------------------------------------------------------------------}
{ TppDataView.ConvertToLatestVersion }

procedure TppDataView.ConvertToLatestVersion;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataView.SetActive }

procedure TppDataView.SetActive(Value: Boolean);
begin
  FActive := Value;
end;

{------------------------------------------------------------------------------}
{ TppDataView.SetSearchValues }

procedure TppDataView.SetReport(aReport: TppCustomReport);
begin

  if FReport <> nil then
    FReport.RemoveNotify(Self);

  FReport := aReport;

  if FReport <> nil then
    FReport.AddNotify(Self);

  ReportAssigned;

end;

{------------------------------------------------------------------------------}
{ TppDataView.ReportAssigned }

procedure TppDataView.ReportAssigned;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataView.Transfer }

procedure TppDataView.Transfer(aDataView: TppDataView);
var
  liFieldMap: Integer;
  lFieldMap: TppFieldMap;
begin

  {re-assign properties}
  FClassDescription := aDataView.ClassDescription;
  FVersion          := aDataView.Version;
  FVersionNo        := aDataView.VersionNo;

  FreeFieldMaps;

  for liFieldMap := aDataView.FieldMapCount-1 downto 0 do
    begin
      lFieldMap := aDataView.FieldMaps[liFieldMap];

      if lFieldMap.CustomDisplayFormat then
        lFieldMap.OnFormat := Format;

      aDataView.RemoveFieldMap(lFieldMap);

      AddFieldMap(lFieldMap);
    end;

  if (FVersionNo < ppVersionToInt(ppVersion)) then
    ConvertToLatestVersion;

end; {procedure, Transfer}

{------------------------------------------------------------------------------}
{ TppDataView.Design }

procedure TppDataView.Design;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataView.GetValidName }

function TppDataView.GetValidName(aComponent: TComponent): String;
var
  lsNamingPrefix: String;

begin

  lsNamingPrefix := ppGetStdNamingPrefix(aComponent);

  if (csDesigning in ComponentState) then
    Result := ppGetUniqueName(Owner, lsNamingPrefix, aComponent)

  else  {run-time designing }
    Result := ppGetUniqueName(Self, lsNamingPrefix, aComponent);

end;

{------------------------------------------------------------------------------}
{ TppDataView.ClearFieldMapValues }

procedure TppDataView.ClearFieldMapValues;
var
  liFieldMap: Integer;
  lFieldMap: TppFieldMap;
begin
  for liFieldMap := 0 to FFieldMapList.Count-1 do
    begin
      lFieldMap := TppFieldMap(FFieldMapList.Objects[liFieldMap]);
      lFieldMap.SearchValue := '';
      lFieldMap.SearchUsed := False;
      lFieldMap.SortUsed := False;
      lFieldMap.SortType := soAscending;
      lFieldMap.SortOrder := -1;
    end;
end;

{------------------------------------------------------------------------------}
{ TppDataView.CreateDataMaps }

procedure TppDataView.CreateDataMaps;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataView.CreateFieldMaps }

procedure TppDataView.CreateFieldMaps;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataView.Preview }

procedure TppDataView.Preview;
begin

end;

{------------------------------------------------------------------------------}
{ TppDataView.SetTemplate }

procedure TppDataView.SetTemplate(aTemplate: TppDataViewTemplate);
begin
  FTemplate.Assign(aTemplate);
end; {procedure, SetTemplate}


{------------------------------------------------------------------------------}
{ TppDataView.GetDataMap }

function TppDataView.GetDataMap(Index: Integer): TppDataMap;
begin
  Result := TppDataMap(FDataMapList.Objects[Index]);
end; {procedure, GetDataMap}

{------------------------------------------------------------------------------}
{ TppDataView.GetFieldMap }

function TppDataView.GetFieldMap(Index: Integer): TppFieldMap;
begin
  Result := TppFieldMap(FFieldMapList.Objects[Index]);
end; {procedure, GetFieldMap}

{------------------------------------------------------------------------------}
{ TppDataView.GetDataMapCount }

function TppDataView.GetDataMapCount: Integer;
begin
  Result := FDataMapList.Count;
end; {procedure, GetDataMapCount}

{------------------------------------------------------------------------------}
{ TppDataView.GetFieldMapCount }

function TppDataView.GetFieldMapCount: Integer;
begin
  Result := FFieldMapList.Count;
end; {procedure, GetFieldMapCount}

{------------------------------------------------------------------------------}
{ TppDataView.FindDataMap }

function  TppDataView.FindDataMap(aDataMap: TppDataMap): Integer;
begin
  Result := FDataMapList.IndexOfObject(aDataMap);
end; {procedure, FindDataMap}

{------------------------------------------------------------------------------}
{ TppDataView.FindFieldMap }

function  TppDataView.FindFieldMap(aFieldMap: TppFieldMap): Integer;
begin
  Result := FFieldMapList.IndexOfObject(aFieldMap);
end; {procedure, FindFieldMap}

{------------------------------------------------------------------------------}
{ TppDataView.FieldMapByField }

function TppDataView.FieldMapByField(aDataPipeline: TppDataPipeline; const aDataField: String): TppFieldMap;
var
  lFieldMap: TppFieldMap;
  liField: Integer;
  lbFound: Boolean;

begin

  liField   := 0;
  lbFound   := False;
  lFieldMap := nil;

  while not lbFound and (liField < FFieldMapList.Count) do
    begin
      lFieldMap := TppFieldMap(FFieldMapList.Objects[liField]);

      if (lFieldMap.FieldName = aDataField) and (lFieldMap.DataPipeline = aDataPipeline) then
        lbFound := True
      else
        Inc(liField);

    end;

  if lbFound then
    Result := lFieldMap
  else
    Result := nil;

end;

{------------------------------------------------------------------------------}
{ TppDataView.GetDataMapForReport }

function TppDataView.GetDataMapForReport(aReport: TppCustomReport): TppDataMap;
var
  lMasterPipeline,
  lDetailPipeline: TppDataPipeline;

begin

  {get the data pipelines assigned to this report}
  lMasterPipeline := aReport.DataPipeline;
  lDetailPipeline := TppDetailBand(aReport.GetBand(btDetail,0 )).DataPipeline;

  {get the data map for associated with teh data pipelines}
  Result := DataMapByPipeline(lMasterPipeline, lDetailPipeline);

end;


{------------------------------------------------------------------------------}
{ TppDataView.GetReportForDataMap }

function TppDataView.GetReportForDataMap(aDataMap: TppDataMap): TppCustomReport;
var
  lReport: TppCustomReport;
  liComponents: Integer;
  liComponent: Integer;

begin

  Result := nil;

  if FReport = nil then Exit;

  liComponents := ComponentCount;
  liComponent  := 0;

  while (Result = nil) and (liComponent < liComponents) do
    begin

      if Components[liComponent] is TppCustomReport then
        begin

          lReport :=  TppCustomReport(Components[liComponent]);

          if (aDataMap.MasterPipeline = lReport.DataPipeline) and
             (aDataMap.DetailPipeline = TppDetailBand(lReport.GetBand(btDetail,0 )).DataPipeline) then

             Result := lReport;
        end;

      Inc(liComponent);

    end;


end;



{------------------------------------------------------------------------------}
{ TppDataView.DataMapByPipeline }

function TppDataView.DataMapByPipeline(aMasterPipeline, aDetailPipeline: TppDataPipeline): TppDataMap;
var
  lDataMap: TppDataMap;
  liMap: Integer;

begin

  liMap  := 0;
  Result := nil;

  while (Result = nil) and (liMap < FDataMapList.Count) do
    begin
      lDataMap := DataMaps[liMap];

      if (lDataMap.MasterPipeline = aMasterPipeline) and
         (lDataMap.DetailPipeline = aDetailPipeline) then
        Result := lDataMap
      else
        Inc(liMap);

    end;

end;

{------------------------------------------------------------------------------}
{ TppDataView.DataMapByAlias }

function TppDataView.DataMapByAlias(aDataAlias: String): TppDataMap;
var
  liDataMap: Integer;

begin
  liDataMap := FDataMapList.IndexOf(aDataAlias);

  if liDataMap >= 0 then
    Result := DataMaps[liDataMap]
  else
    Result := nil;

end;

{------------------------------------------------------------------------------}
{ TppDataView.FieldMapByAlias }

function TppDataView.FieldMapByAlias(aFieldAlias: String): TppFieldMap;
var
  liFieldMap: Integer;

begin
  liFieldMap := FFieldMapList.IndexOf(aFieldAlias);

  if liFieldMap >= 0 then
    Result := FieldMaps[liFieldMap]
  else
    Result := nil;

end;

{------------------------------------------------------------------------------}
{ TppDataView.FieldPositionByAlias }

function  TppDataView.FieldPositionByAlias(aFieldAlias: String): Integer;
begin
  Result := FFieldMapList.IndexOf(aFieldAlias);
end;

{------------------------------------------------------------------------------}
{ TppDataView.AddFieldMap }

function TppDataView.AddFieldMap(aFieldMap: TppFieldMap): Integer;
begin
  Result := FFieldMapList.AddObject(aFieldMap.FieldAlias, aFieldMap);

end;


{------------------------------------------------------------------------------}
{ TppDataView.AddDataMap }

function TppDataView.AddDataMap(aDataMap: TppDataMap): Integer;
begin
  if (aDataMap.Parent = nil) then
    Result := FDataMapList.AddObject(aDataMap.DataAlias, aDataMap)
  else
    begin
      Result := FDataMapList.IndexOfObject(aDataMap.Parent) + 1;
      FDataMapList.InsertObject(Result, aDataMap.DataAlias, aDataMap);
    end;
end;

{------------------------------------------------------------------------------}
{ TppDataView.CreateDataMap }

function TppDataView.CreateDataMap(const aDataAlias: String; aMasterPipeline, aDetailPipeline: TppDataPipeline;
                                     aParentDataMap: TppDataMap): Integer;
var
  lDataMap: TppDataMap;

begin
  lDataMap := TppDataMap.Create(Self);

  lDataMap.DataView := Self;

  if aDataAlias = '' then
    lDataMap.DataAlias := aMasterPipeline.Name
  else
    lDataMap.DataAlias := aDataAlias;

  lDataMap.MasterPipeline := aMasterPipeline;
  lDataMap.DetailPipeline := aDetailPipeline;

  if (aParentDataMap <> nil) then
    lDataMap.Parent := aParentDataMap;

  Result := AddDataMap(lDataMap);

end;

{------------------------------------------------------------------------------}
{ TppDataView.CreateFieldMap }

function TppDataView.CreateFieldMap(const aTableName, aFieldName, aFieldAlias: String; aDataPipeline: TppDataPipeline;
                                    aSearchable, aSortable: Boolean): Integer;
var
  lFieldMap : TppFieldMap;

begin

  lFieldMap := TppFieldMap.Create(Self);

  if aFieldAlias = '' then
    lFieldMap.FieldAlias  := aFieldName
  else
    lFieldMap.FieldAlias  := aFieldAlias;

  lFieldMap.TableName     := aTableName;
  lFieldMap.FieldName     := aFieldName;
  lFieldMap.DataPipeline  := aDataPipeline;
  lFieldMap.Searchable    := aSearchable;
  lFieldmap.Sortable      := aSortable;

  Result := AddFieldMap(lFieldmap);

end;

{------------------------------------------------------------------------------}
{ TppDataView.RemoveDataMap }

function TppDataView.RemoveDataMap(aDataMap: TppDataMap): Integer;
var
  liDataMap: Integer;

begin
  liDataMap := FDataMapList.IndexOfObject(aDataMap);

  aDataMap.DataView := nil;
  aDataMap.Parent   := nil;

  if liDataMap >= 0 then
    FDataMapList.Delete(liDataMap);

  Result := liDataMap;

end;

{------------------------------------------------------------------------------}
{ TppDataView.RemoveFieldMap }

function TppDataView.RemoveFieldMap(aFieldMap: TppFieldMap): Integer;
var
  liFieldMap: Integer;

begin
  liFieldMap := FFieldMapList.IndexOfObject(aFieldMap);

  if liFieldMap >= 0 then
    FFieldMapList.Delete(liFieldMap);

  Result := liFieldMap;

end;

{------------------------------------------------------------------------------}
{ TppDataView.GetDataAliases }

function TppDataView.GetDataAliases: TStrings;
begin
  Result := FDataMapList;
end;

{------------------------------------------------------------------------------}
{ TppDataView.GetFieldAliases }

function TppDataView.GetFieldAliases: TStrings;
begin
  Result := FFieldMapList;
end;

{------------------------------------------------------------------------------}
{ TppDataView.AssignField }

procedure TppDataView.AssignField(Sender: TObject);
var
  lFieldMap: TppFieldMap;
  lDBText: TppDBText;
  lsDataField: String;
  lDataPipeline: TppDataPipeline;
begin

  {assign default DisplayFormat and custom DisplayFormat event handler}
  if (Sender is TppDBText) then
    begin
      lDBText := TppDBText(Sender);

      lsDataField := lDBText.DataField;
      lDataPipeline := lDBText.DataPipeline;

      lFieldMap := FieldMapByField(lDataPipeline, lsDataField);

      if (lFieldMap <> nil) then
        begin
          TppDBText(Sender).OnFormat      := lFieldMap.OnFormat;
          TppDBText(Sender).DisplayFormat := lFieldMap.DisplayFormat;
        end;

    end; {if, Sender is DBText}

end; {procedure, AssignField}

{------------------------------------------------------------------------------}
{ TppDataView.GetAliasForField }

procedure TppDataView.GetAliasForField(Sender: TObject; aDataPipeline: TObject;
                                       const aDataField: String; var aFieldAlias: String);
var
  lFieldMap: TppFieldMap;
  lDataPipeline: TppDataPipeline;

begin

  lDataPipeline := TppDataPipeline(aDataPipeline);

  lFieldMap := FieldMapByField(lDataPipeline, aDataField);

  if (lFieldMap <> nil) then
    aFieldAlias := lFieldMap.FieldAlias
  else
    aFieldAlias := '';

end;

{------------------------------------------------------------------------------}
{ TppDataView.GetFieldForAlias }

procedure TppDataView.GetFieldForAlias(Sender: TObject; const aFieldAlias: String;
                                       var aDataPipeline: TObject; var aDataField: String);
var
  lFieldMap: TppFieldMap;
begin

  lFieldMap := FieldMapByAlias(aFieldAlias);

  if (lFieldMap <> nil) then
    begin
      aDataPipeline := lFieldMap.DataPipeline;
      aDataField := lFieldMap.FieldName;
    end
  else
    begin
      aDataPipeline := nil;
      aDataField := '';
    end;

end;

{------------------------------------------------------------------------------}
{ TppDataView.GetDisplayFormats }

procedure TppDataView.GetDisplayFormats(Sender: TObject; DisplayFormats: TStrings);
var
  lDataType: TppDataType;
  lsField: String;
  lDBText: TppDBText;
begin

  lDataType := dtNotKnown;

  if (Sender is TppDBText) then
    begin
      lDBText := TppDBText(Sender);

      lsField := lDBText.DataField;

      if (lsField <> '') and (lDBText.DataPipeline <> nil) then
        lDataType := lDBText.DataPipeline.GetFieldDataType(lsField);

    end

  else if Sender is TppVariable then
    lDataType := TppCalc(Sender).CustomType;

  {get standard display formats}
  ppGetDisplayFormats(lDataType, DisplayFormats);

end;

{------------------------------------------------------------------------------}
{ TppDataView.Format}

{$IFDEF WIN32}
procedure TppDataView.Format(Sender: TObject; DisplayFormat: String; DataType: TppDataType; Value: Variant; var Text: String);
{$ELSE}
procedure TppDataView.Format(Sender: TObject; DisplayFormat: String; DataType: TppDataType; Value: Pointer; var Text: String);
{$ENDIF}
begin
  {apply standard formatting}
  Text := ppFormat(DisplayFormat, DataType, Value);
end;


{$IFDEF WIN32}

{------------------------------------------------------------------------------}
{ TppDataView.GetChildren }

procedure TppDataView.GetChildren(Proc: TGetChildProc; aRoot: TComponent);
var
  liComponent: Integer;
begin

  {write field maps and components if requested}
  for liComponent := (ComponentCount - 1) downto 0  do
    if (Components[liComponent] is TppFieldMap) or (FSaveComponents) then
      Proc(Components[liComponent]);

end;


{$ELSE}

{------------------------------------------------------------------------------}
{ TppDataView.WriteState }

procedure TppDataView.WriteState(Writer: TWriter);
var
  lSaveList: TList;
  lOwnedComponent: TComponent;
  liComponent: Integer;

begin

  lSaveList := TList.Create;

  {remove non-FieldMap components}
  if not(FSaveComponents) then
    begin
      for liComponent := ComponentCount-1 downto 0 do
        if not (Components[liComponent] is TppFieldMap) then
          begin
            lOwnedComponent := Components[liComponent];
            lSaveList.Add(lOwnedComponent);
            RemoveComponent(lOwnedComponent);
          end;
    end;

  inherited WriteState(Writer);

  {re-add non-FieldMap components}
  if not(FSaveComponents) then
    for liComponent := 0 to lSaveList.Count-1 do
      InsertComponent(TComponent(lSaveList[liComponent]));

 lSaveList.Free;

end;

{------------------------------------------------------------------------------}
{ TppDataView.WriteComponents }

procedure TppDataView.WriteComponents(Writer: TWriter);
var
  liFieldMap: Integer;
  lFieldMap: TppFieldMap;

begin

  {write field maps }
  for liFieldMap := (FFieldMapList.Count - 1) downto 0 do
    begin
      lFieldMap := FieldMaps[liFieldMap];

      if lFieldMap.Owner = Writer.Root then
        Writer.WriteComponent(lFieldMap);

    end;

end; {procedure, WriteComponents}


{$ENDIF}

{------------------------------------------------------------------------------}
{ TppDataView.ConvertReport }

procedure TppDataView.ConvertReport(aReport: TppCustomReport);
begin

end; {procedure, ConvertReport}

{------------------------------------------------------------------------------}
{ TppDataView.DefineProperties - read/write private 'fake' properties }

procedure TppDataView.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);

  Filer.DefineProperty('Version', ReadVersion, WriteVersion, True);
end;

{------------------------------------------------------------------------------}
{ TppDataView.ReadVersion }

procedure TppDataView.ReadVersion(Reader: TReader);
begin
  FVersion:= Reader.ReadString;

  FVersionNo := ppVersionToInt(FVersion);
end;

{------------------------------------------------------------------------------}
{ TppDataView.WriteVersion }

procedure TppDataView.WriteVersion(Writer: TWriter);
begin
  Writer.WriteString(ppVersion);
end;

{******************************************************************************
 *
 ** D A T A V I E W   T E M P L A T E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataViewTemplate.Create }

constructor TppDataViewTemplate.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataView     := TppDataView(aOwner);
  Root          := aOwner;
 { Root          := FDataView.Owner; }

  FNewDataView    := nil;
  FSaveDataView   := nil;

  FSaveOwner      := nil;


end;

{------------------------------------------------------------------------------}
{ TppDataViewTemplate.Destroy }

destructor TppDataViewTemplate.Destroy;
begin
  inherited Destroy;

end;

{------------------------------------------------------------------------------}
{ TppDataViewTemplate.New }

procedure TppDataViewTemplate.New;
var
  lNewDataView: TppDataView;
  lDataViewClass: TComponentClass;

begin
  {create and assign new report}
  lDataViewClass := TComponentClass(FDataView.ClassType);
  lNewDataView := TppDataView(lDataViewClass.Create(nil));

  FDataView.Transfer(lNewDataView);

  lNewDataView.Free;

  inherited New;

end;

{------------------------------------------------------------------------------}
{ TppDataViewTemplate.LoadStart }

function TppDataViewTemplate.LoadStart: Boolean;
begin

  Result := False;

  if FDataView = nil then Exit;


  FSaveDataView := TppDataView.Create(nil);
  FSaveDataView.Transfer(FDataView);

  {remove object from owner }
  if Owner = nil then
    FSaveOwner := nil
  else
    FSaveOwner := Owner.Owner;

  if FSaveOwner <> nil then
    FSaveOwner.RemoveComponent(Owner);

  Result := True;

end;


{------------------------------------------------------------------------------}
{ TppDataViewTemplate.LoadEnd }

procedure TppDataViewTemplate.LoadEnd(aLoaded: Boolean);
begin

  if aLoaded then
    begin
      {assign new template }
      FDataView.Transfer(FNewDataView);

      inherited LoadEnd(aLoaded);
    end
  else
    {restore original dataview}
    FDataView.Transfer(FSaveDataView);

  FSaveDataView.Free;

  if FNewDataView <> nil then
    begin
      FNewDataView.Free;
      FNewDataView := nil;
    end;

  if FSaveOwner <> nil then
    FSaveOwner.InsertComponent(Owner);


end;

{------------------------------------------------------------------------------}
{ TppDataViewTemplate.LoadCallback }

procedure TppDataViewTemplate.LoadCallback(Component: TComponent);
begin

  if (Component is TppDataView) then
    FNewDataView := TppDataView(Component);

end;

{------------------------------------------------------------------------------}
{ TppDataViewTemplate.LoadSetName }

procedure TppDataViewTemplate.LoadSetName(Reader: TReader; Component: TComponent; var Name: string);
begin

  inherited LoadSetName(Reader, Component, Name);
  
  if FDataView = nil then Exit;

  if (Reader.Root = FDataView.Owner) and (FDataView.Owner.FindComponent(Name) <> nil) then
    Name := FDataView.GetValidName(Component);

end;



initialization

  {this is necessary to support the dynamic creation of these classes at run-time}
  RegisterClasses([TppDataView, TppFieldMap]);

end.

