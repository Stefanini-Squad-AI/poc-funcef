{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDataView;

interface

{$I ppIfDef.pas}

uses
  Windows, Messages, Classes, Dialogs, SysUtils, Forms, ExtCtrls, Graphics,
  ppComm, ppClass, ppDB, ppTmplat, ppTypes, ppUtils, ppRTTI,
  daForms;

type

  TdaDataViewTemplate = class;

  
  { TdaCustomDataView }
  TdaCustomDataView = class(TdaDataView)
    private
      FHeight: Integer;
      FLeft: Integer;
      FNameColumnWidth: Integer;
      FSizeColumnWidth: Integer;
      FSortMode: Integer;
      FTemplate: TdaDataViewTemplate;
      FTop: Integer;
      FTypeColumnWidth: Integer;
      FWidth: Integer;

      procedure SetTemplate(aTemplate: TdaDataViewTemplate);

    protected
      procedure Loaded; override;
      procedure ReportBeforePrintEvent; virtual;

      function GetDataPipelineCount: Integer; override;
      function GetDataPipelineForIndex(aIndex: Integer): TppDataPipeline; override;
      function GetLinkColor: TColor; override;
      procedure SetActive(aValue: Boolean); override;
      procedure SetLinkColor(aColor: TColor); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Convert(aVersionNo: Integer); override;

      procedure Transfer(aSource: TppCommunicator); override;

      procedure EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList); override;

      class function ClassBitmap: THandle; override;
      class function ClassDescription: String; override;
      class function DataDesignerClass: TClass; virtual;
      class function PreviewFormClass: TFormClass; override;
      class function DesignFormClass: TFormClass; {override;}
      class function IsTemplate: Boolean; override;

      function AddDataPipeline(aDataPipeline: TppDataPipeline): Integer; override;
      function RemoveDataPipeline(aDataPipeline: TppDataPipeline): Integer; override;

      {descendents can override these}
      function AutoSearchFieldsExist: Boolean; virtual;
      procedure Init; virtual;
      procedure CreateDataPipelines; virtual;
      procedure CreatePipelineFields(aDataPipeline: TppDataPipeline); virtual;
      procedure ConnectPipelinesToData; virtual;
      procedure DefineDataSelection; virtual;

      function CreateAutoLink(aDataViews: TList; aDataDictionary: TObject): Boolean; override;
      procedure CreateLink(aMasterDataView: TdaDataView; aMasterFieldAlias, aDetailFieldAlias: String); override;
      procedure DeleteLink(aIndex: Integer); override;
      procedure Design; override;
      function GetLinkColorForField(aFieldName: String): TColor; override;
      function GetLinkCount: Integer; override;
      function GetLinkDescription: String; override;
      procedure GetLinkFieldNames(aIndex: Integer; var aMasterSQLFieldName, aDetailSQLFieldName: String); override;
      function GetMagicFieldCount: Integer; override;
      procedure GetMagicSQL(aSQLText: TStrings); override;
      procedure Link(aLinkableDataViews: TList); override;
      procedure LinkChanged; override;
      function InMasterChain(aDataView: TdaDataView): Boolean; override;
      function IsLinkable: Boolean; override;
      procedure OutOfSync; override;
      procedure Preview; override;
      procedure Sync; override;
      procedure UpdateEnabledOptions(aLinkableDataViews: TList); override;

      property Template: TdaDataViewTemplate read FTemplate write SetTemplate;

    published
      property Height: Integer read FHeight write FHeight;
      property Left: Integer read FLeft write FLeft;
      property NameColumnWidth: Integer read FNameColumnWidth write FNameColumnWidth;
      property SizeColumnWidth: Integer read FSizeColumnWidth write FSizeColumnWidth;
      property SortMode: Integer read FSortMode write FSortMode;
      property Top: Integer read FTop write FTop;
      property TypeColumnWidth: Integer read FTypeColumnWidth write FTypeColumnWidth;
      property Width: Integer read FWidth write FWidth;

  end; {class TdaCustomDataView}

  TdaCustomDataViewClass = class of TdaCustomDataView;



  { TdaDataViewTemplate }
  TdaDataViewTemplate = class(TppTemplate)
    private
      FDataView: TdaDataView;
      FNewDataView: TdaDataView;
      FSaveDataView: TdaDataView;
      FSaveOwner: TComponent;

    protected
      {functions used by Reader during load }
      procedure LoadCallback(Component: TComponent); override;
      procedure LoadSetName(Reader: TReader; Component: TComponent; var Name: string); override;

      function  LoadStart: Boolean; override;
      procedure LoadEnd(aLoaded: Boolean); override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure New; override;

  end; {class, TdaDataViewTemplate }

  {general routines}
  procedure daGetDataViewClasses(aList: TStrings);
  procedure daGetDataViewTemplates(aList: TStrings);
  procedure daGetDataViewWizardClasses(aSessionClass: TClass; aList: TStrings);

  procedure daRegisterDataView(aDataViewClass: TdaDataViewClass);
  procedure daUnRegisterDataView(aDataViewClass: TdaDataViewClass);

  procedure daGetDataViewSessionClasses(aList: TStrings);

  
implementation

uses
  daDB;

var
  FDataViewList: TStringList = nil;

{******************************************************************************
 *
 ** C U S T O M   D A T A  V I E W
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Create }

constructor TdaCustomDataView.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  EventNotifies := [ciProducerBeforePrint];

  UserName := ppTextToIdentifier('Query_' + GetDescription);

  FHeight := 0;
  FLeft := 0;
  FNameColumnWidth := 105;
  FSizeColumnWidth := 35;
  FSortMode := 0;
  FTemplate := TdaDataViewTemplate.Create(Self);
  FTop := 0;
  FTypeColumnWidth := 52;
  FWidth := 0;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Destroy }

destructor TdaCustomDataView.Destroy;
begin

  FTemplate.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.EventNotify }

procedure TdaCustomDataView.EventNotify(aCommunicator: TppCommunicator; aEventID: Integer; aParams: TraParamList);
begin

  inherited EventNotify(aCommunicator, aEventID, aParams);

  if (aCommunicator = Report) and (aEventID = ciProducerBeforePrint) then
    ReportBeforePrintEvent;

end; {procedure, EventNotify}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Loaded }

procedure TdaCustomDataView.Loaded;
begin

  inherited Loaded;

  if DataPipelineCount = 0 then Exit;

  ConnectPipelinesToData;

end; {procedure, Loaded}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ReportBeforePrintEvent }

procedure TdaCustomDataView.ReportBeforePrintEvent;
begin

  if not Active then
    SetActive(True);

end; {procedure, ReportBeforePrintEvent}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetDataPipelineCount }

function TdaCustomDataView.GetDataPipelineCount: Integer;
begin
  Result := ChildCount;
end; {function, GetDataPipelineCount}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetDataPipelineForIndex }

function TdaCustomDataView.GetDataPipelineForIndex(aIndex: Integer): TppDataPipeline;
begin
  if (aIndex > ChildCount - 1) then
    Result := nil
  else
    Result := TppDataPipeline(Children[aIndex]);
end; {function, GetDataPipelineForIndex}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.AddDataPipeline }

function TdaCustomDataView.AddDataPipeline(aDataPipeline: TppDataPipeline): Integer;
begin
  AddChild(aDataPipeline);

  Result := ChildCount - 1;
end; {function, AddDataPipeline}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.RemoveDataPipeline }

function TdaCustomDataView.RemoveDataPipeline(aDataPipeline: TppDataPipeline): Integer;
begin
  Result := RemoveChild(aDataPipeline)
end; {function, RemoveDataPipeline}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.IsTemplate }

class function TdaCustomDataView.IsTemplate: Boolean;
begin
  Result := False;
end; {function, IsTemplate}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ClassDescription }

class function TdaCustomDataView.ClassDescription: String;
begin
  Result := ClassName;
end; {function, ClassDescription}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ClassBitmap }

class function TdaCustomDataView.ClassBitmap: THandle;
begin
  Result := ppBitmapFromResource('DANODATAVIEW');
end; {class function, ClassBitmap}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DataDesignerClass }

class function TdaCustomDataView.DataDesignerClass: TClass;
begin
  Result := nil;
end; {class function, DataDesignerClass}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.PreviewFormClass }

class function TdaCustomDataView.PreviewFormClass: TFormClass;
begin
  Result := TFormClass(GetClass('TdaPreviewDataDialog'));
end; {class function, PreviewFormClass}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DesignFormClass }

class function TdaCustomDataView.DesignFormClass: TFormClass;
begin
  Result := nil;
end; {class function, DesignFormClass}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.SetTemplate }

procedure TdaCustomDataView.SetTemplate(aTemplate: TdaDataViewTemplate);
begin
  FTemplate.Assign(aTemplate);
end; {procedure, SetTemplate}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.SetActive }

procedure TdaCustomDataView.SetActive(aValue: Boolean);
var
  liIndex: Integer;
begin

  if aValue and (DataPipelineCount = 0) then
    Init;

  {open or close each pipeline}
  for liIndex := 0 to DataPipelineCount - 1 do
    if aValue then
      DataPipelines[liIndex].Open
    else
      DataPipelines[liIndex].Close;


  inherited SetActive(aValue);

end; {procedure, SetActive}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.AutoSearchFieldsExist }

function TdaCustomDataView.AutoSearchFieldsExist: Boolean;
begin
  {descendants should override this function to true if the DataView
   contains auto search fields}
  Result := False;
end;  {function, AutoSearchFieldsExist}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Init }

procedure TdaCustomDataView.Init;
var
  liIndex: Integer;

begin
  if (DataPipelineCount > 0) then Exit;

  CreateDataPipelines;
  ConnectPipelinesToData;

  for liIndex := 0 to DataPipelineCount-1 do
    CreatePipelineFields(DataPipelines[liIndex]);


end; {procedure, Init}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.CreateDataPipelines }

procedure TdaCustomDataView.CreateDataPipelines;
begin
  {descendants should add code here to create a DataPipeline}

end; {procedure, CreateDataPipelines}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.ConnectPipelinesToData }

procedure TdaCustomDataView.ConnectPipelinesToData;
begin
  {descendants should add code here to connect a DataPipeline(s) to data
  (for example: connect a DBPipeline to a TDataSource}

end; {procedure, ConnectPipelinesToData}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.CreatePipelineFields }

procedure TdaCustomDataView.CreatePipelineFields(aDataPipeline: TppDataPipeline);
begin
  {descendants should add code here to create DataPipeline Fields}

end; {procedure, CreatePipelineFields}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DefineDataSelection }

procedure TdaCustomDataView.DefineDataSelection;
begin
  {add selection criteria here}

end; {procedure, DefineDataSelection}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Design }

procedure TdaCustomDataView.Design;
var
  lForm: TdaCustomDesignDataDialog;
  lFormClass: TFormClass;
begin

  lFormClass := DesignFormClass;

  if (lFormClass = nil) or not lFormClass.InheritsFrom(TdaCustomDesignDataDialog) then Exit;

  lForm := TdaCustomDesignDataDialog(lFormClass.Create(Application));

  lForm.DataView := Self;
  lForm.LanguageIndex := LanguageIndex;

  lForm.ShowModal;

  lForm.Free;

end; {procedure, Design}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.CreateAutoLink }

function TdaCustomDataView.CreateAutoLink(aDataViews: TList; aDataDictionary: TObject): Boolean;
begin

  {called when the data view is first created, allows the data view to search
   for automatic link possibilities with other dataviews using the Data
   Dictionary auto join information }

  Result := False;

end; {function, CreateAutoLink}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.DeleteLink }

procedure TdaCustomDataView.DeleteLink(aIndex: Integer);
begin

  {called when a link is selected in the data workspace and the delete key is pressed}

end; {procedure, DeleteLink}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.CreateLink }

procedure TdaCustomDataView.CreateLink(aMasterDataView: TdaDataView; aMasterFieldAlias, aDetailFieldAlias: String);
begin

  {called when a field has been dragged from one dataview over the field of
   another dataview.  The field aliases passed are the FieldAlias as they appear
   in the field objects of the Pipelines[0] pipeline of the dataview.}

end; {procedure, CreateLink}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Link }

procedure TdaCustomDataView.Link(aLinkableDataViews: TList);
begin

  {called when the link button on the dataview window is clicked}

end; {procedure, Link}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.InMasterChain }

function TdaCustomDataView.InMasterChain(aDataView: TdaDataView): Boolean;
begin
  Result := False;
end; {procedure, InMasterChain}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.IsLinkable }

function TdaCustomDataView.IsLinkable: Boolean;
begin
  {treat as abastract - descendants must override}
  Result := False;
end; {function, IsLinkable}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.LinkChanged }

procedure TdaCustomDataView.LinkChanged;
begin

end; {procedure, LinkChanged}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetLinkCount }

function TdaCustomDataView.GetLinkCount: Integer;
begin
  Result := 0;
end; {function, GetLinkCount}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetLinkFieldNames }

procedure TdaCustomDataView.GetLinkFieldNames(aIndex: Integer; var aMasterSQLFieldName, aDetailSQLFieldName: String);
begin

end; {procedure, GetLinkFieldNames}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetLinkDescription }

function TdaCustomDataView.GetLinkDescription: String;
begin
  Result := ClassName;
end; {function, GetLinkDescription}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetMagicFieldCount }

function TdaCustomDataView.GetMagicFieldCount: Integer;
begin
  Result := 0;
end; {function, GetMagicFieldCount}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetMagicSQL }

procedure TdaCustomDataView.GetMagicSQL(aSQLText: TStrings);
begin

end; {function, GetMagicSQL}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetLinkColorForField }

function TdaCustomDataView.GetLinkColorForField(aFieldName: String): TColor;
begin
  Result := 0;
end; {function, GetLinkColorForField}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.GetLinkColor }

function TdaCustomDataView.GetLinkColor: TColor;
begin
  Result := 0;
end; {function, GetLinkColor}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.SetLinkColor }

procedure TdaCustomDataView.SetLinkColor(aColor: TColor);
begin

end; {procedure, SetLinkColor}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.UpdateEnabledOptions }

procedure TdaCustomDataView.UpdateEnabledOptions(aLinkableDataViews: TList);
begin

end; {procedure, UpdateEnabledOptions}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.OutOfSync }

procedure TdaCustomDataView.OutOfSync;
begin

  { called when the data settings change, indicates to the dataview that the
   the SQL must be regenerated }

end; {procedure, OutOfSync}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Sync }

procedure TdaCustomDataView.Sync;
begin

  { called when the Design workspace is becoming active and the Data workspace
    is becoming inactive.  Forces the dataview to update its data access objects
    (usually TQuery) so that the design workspace can make the data active.}

end; {procedure, Sync}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Preview }

procedure TdaCustomDataView.Preview;
var
  lForm: TdaCustomPreviewDataDialog;
  lFormClass: TFormClass;

begin

  lFormClass := PreviewFormClass;

  if (lFormClass = nil) or not lFormClass.InheritsFrom(TdaCustomPreviewDataDialog) then Exit;

  lForm := TdaCustomPreviewDataDialog(lFormClass.Create(Application));

  lForm.DataView := Self;
  lForm.LanguageIndex := LanguageIndex;

  lForm.ShowModal;

  lForm.Free;

end; {procedure, Preview}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Convert }

procedure TdaCustomDataView.Convert(aVersionNo: Integer);
begin

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TdaCustomDataView.Transfer }

procedure TdaCustomDataView.Transfer(aSource: TppCommunicator);
var
  liIndex: Integer;
  lSource: TdaCustomDataView;

begin

  inherited Transfer(aSource);

  if not (aSource is TdaCustomDataView) then Exit;

  lSource := TdaCustomDataView(aSource);

  {change owner for pipelines}
  for liIndex := 0 to lSource.DataPipelineCount - 1 do
    begin
      lSource.DataPipelines[liIndex].DataView := Self;
      lSource.DataPipelines[liIndex].ChangeOwner(Owner);
    end;

end; {procedure, Transfer}

{******************************************************************************
 *
 ** D A T A V I E W   T E M P L A T E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.Create }

constructor TdaDataViewTemplate.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  FDataView     := TdaDataView(aOwner);
  Root          := aOwner;

  FNewDataView    := nil;
  FSaveDataView   := nil;

  FSaveOwner      := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.Destroy }

destructor TdaDataViewTemplate.Destroy;
begin
  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.New }

procedure TdaDataViewTemplate.New;
var
  lNewDataView: TdaDataView;
  lDataViewClass: TComponentClass;

begin
  {create and assign new report}
  lDataViewClass := TComponentClass(FDataView.ClassType);
  lNewDataView := TdaDataView(lDataViewClass.Create(nil));

  FDataView.Transfer(lNewDataView);

  lNewDataView.Free;

  inherited New;

end; {procedure, New}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadStart }

function TdaDataViewTemplate.LoadStart: Boolean;
begin

  inherited LoadStart;

  Result := False;

  if FDataView = nil then Exit;

  FSaveDataView := TdaDataViewClass(FDataView.ClassType).Create(nil);
  FSaveDataView.Transfer(FDataView);

  Result := True;

end; {function, LoadStart}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadEnd }

procedure TdaDataViewTemplate.LoadEnd(aLoaded: Boolean);
begin

  if aLoaded then
    begin
      {assign new template }
      FDataView.Transfer(FNewDataView);
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

  inherited LoadEnd(aLoaded);

end; {procedure, LoadEnd}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadCallback }

procedure TdaDataViewTemplate.LoadCallback(Component: TComponent);
begin

  if (Component is TdaDataView) then
    FNewDataView := TdaDataView(Component);

end; {procedure, LoadCallback}

{------------------------------------------------------------------------------}
{ TdaDataViewTemplate.LoadSetName }

procedure TdaDataViewTemplate.LoadSetName(Reader: TReader; Component: TComponent; var Name: string);
begin

  inherited LoadSetName(Reader, Component, Name);
  
  if FDataView = nil then Exit;

  if (Reader.Root = FDataView.Owner) and (FDataView.Owner.FindComponent(Name) <> nil) then
    Name := FDataView.GetValidName(Component);

end; {procedure, LoadSetName}



{******************************************************************************
 *
 ** G E N E R A L   R O U T I N E S
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ ppDataViews }

function ppDataViewClasses: TStrings;
begin

  if (FDataViewList = nil) then
    FDataViewList := TStringList.Create;

  Result := FDataViewList;

end; {function, ppDataViewClasses}

{------------------------------------------------------------------------------}
{ daGetDataViewClasses }

procedure daGetDataViewClasses(aList: TStrings);
begin

  aList.Assign(ppDataViewClasses);

end; {procedure, daGetDataViewTemplates}


{------------------------------------------------------------------------------}
{ daGetDataViewTemplates }

procedure daGetDataViewTemplates(aList: TStrings);
var
  liIndex: Integer;

begin

  aList.Assign(ppDataViewClasses);

  for liIndex := aList.Count-1 downto  0 do
    {delete any items that do not apply }
    if not TdaDataViewClass(aList.Objects[liIndex]).IsTemplate then
      aList.Delete(liIndex);

end; {procedure, daGetDataViewTemplates}

{------------------------------------------------------------------------------}
{ daGetDataViewWizardClasses }

procedure daGetDataViewWizardClasses(aSessionClass: TClass; aList: TStrings);
var
  liIndex: Integer;
  lDataViewClass: TdaDataViewClass;

begin

  aList.Assign(ppDataViewClasses);

  for liIndex := aList.Count-1 downto 0 do
    begin
      lDataViewClass := TdaDataViewClass(aList.Objects[liIndex]);

      {delete any items that do not apply}
      if (lDataViewClass.SessionClass <> aSessionClass) or
         (TdaDataViewClass(aList.Objects[liIndex]).IsTemplate) then
        aList.Delete(liIndex);

    end;

end; {procedure, daGetDataViewWizardClasses}


{------------------------------------------------------------------------------}
{ daGetDataViewSessionClasses }

procedure daGetDataViewSessionClasses(aList: TStrings);
var
  liIndex: Integer;
  lDataViewClass: TdaDataViewClass;
  lDataViewClasses: TStrings;
  lSessionClass: TdaSessionClass;

begin

  lDataViewClasses := ppDataViewClasses;

  aList.Clear;

  for liIndex := lDataViewClasses.Count-1 downto 0 do
    begin
      lDataViewClass := TdaDataViewClass(lDataViewClasses.Objects[liIndex]);

      lSessionClass := TdaSessionClass(lDataViewClass.SessionClass);

      if aList.IndexOf(lSessionClass.ClassDescription) < 0 then
        aList.AddObject(lSessionClass.ClassDescription, TObject(lSessionClass));

    end;


end; {procedure, daGetDataViewSessionClasses}





{------------------------------------------------------------------------------}
{ daRegisterDataView }

procedure daRegisterDataView(aDataViewClass: TdaDataViewClass);
var
  liIndex: Integer;
begin

  liIndex :=  ppDataViewClasses.IndexOf(aDataViewClass.ClassDescription);

  if liIndex >= 0 then Exit;

  RegisterClass(aDataViewClass);

  ppDataViewClasses.AddObject(aDataViewClass.ClassDescription, TObject(aDataViewClass));

end; {procedure, daRegisterDataView}

{------------------------------------------------------------------------------}
{ daUnRegisterDataView }

procedure daUnRegisterDataView(aDataViewClass: TdaDataViewClass);
var
  liIndex: Integer;
begin

  if (aDataViewClass = nil) then Exit;

  if (FDataViewList = nil) then Exit;

  UnRegisterClass(aDataViewClass);

  liIndex := ppDataViewClasses.IndexOf(aDataViewClass.ClassDescription);

  if liIndex >= 0 then
    ppDataViewClasses.Delete(liIndex);

end; {procedure, daUnRegisterDataView}

{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

finalization

  FDataViewList.Free;
  FDataViewList := nil;

end.

