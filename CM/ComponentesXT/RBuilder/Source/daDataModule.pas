{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}


unit daDataModule;

interface

{$I ppIfDef.pas}

uses
  SysUtils, Classes, Controls, Forms, Dialogs, Graphics,
  ppComm, ppClass, ppForms, ppTypes, ppRelatv, ppModule, ppReport,
  daDataView, ppDB;

type

  { TdaDataModule }
  TdaDataModule = class(TppReportModule)
    private
      function GetDataViewCount: Integer;
      function GetDataViewForIndex(aIndex: Integer): TdaCustomDataView;

    protected
      procedure Loaded; override;

    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;

      procedure Convert(aVersionNo: Integer); override;

      procedure AddChild(aChild: TppRelative); override;
      procedure InsertChild(aPosition: Integer; aChild: TppRelative); override;
      function  RemoveChild(aChild: TppRelative): Integer; override;

      function AutoSearchFieldsExist: Boolean;
      function IndexOfDataView(aDataView: TdaDataView): Integer;
      function IsValidDataPipelineUserName(aUserName: String): Boolean;
      procedure GetDetailDataViews(aMasterDataView: TdaDataView; aList: TList);
      procedure GetLinkableDataViews(aList: TList);
      procedure GetLinkableDataViewsForDataView(aList: TList; aDataView: TdaDataView);
      function FindDataViewByUserName(aUserName: String): TdaCustomDataView;
      procedure SetParentComponent(Value: TComponent); override;
      procedure UpdateShowAutoSearchDialog;

      procedure Merge(aDataModule: TdaDataModule);
      procedure MergeWithReport(aReport: TppCustomReport);

      property DataViews[Index: Integer]: TdaCustomDataView read GetDataViewForIndex;
      property DataViewCount: Integer read GetDataViewCount;

    end; {class, TdaDataModule}


  function daGetDataModule(aReport: TppCustomReport): TdaDataModule;

implementation

{------------------------------------------------------------------------------}
{ daGetDataModule }

function daGetDataModule(aReport: TppCustomReport): TdaDataModule;
begin
  if (aReport = nil) then
    Result := nil
  else
    Result := TdaDataModule(aReport.GetModuleForClass(TdaDataModule));

end; {class, daGetDataModule }

{******************************************************************************
 *
 ** D A T A   M O D U L E
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataModule.Create }

constructor TdaDataModule.Create(aOwner: TComponent);
begin

  inherited Create(aOwner);

  Template.FileExtension := 'dtm';
  Template.FileFilter    := 'Report Data file (*.dtm)|*.dtm';

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataModule.Destroy }

destructor TdaDataModule.Destroy;
begin

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataModule.Loaded }

procedure TdaDataModule.Loaded;
var
  lMainReport: TppReport;
  lDataView: TdaDataView;
  liIndex: Integer;
begin

  {connect dataviews to report, do this prior to calling inherited}
  for liIndex := 0 to DataViewCount - 1 do
    begin
      lDataView := DataViews[liIndex];

      lDataView.Report := Report;
    end;

  inherited Loaded;

  if (Report = nil) then Exit;

  {if report is a child report, then merge this dataview with the main report}
  if Report.InheritsFrom(TppChildReport) then
    begin
      MergeWithReport(Report.MainReport);

      Free;
    end;

  {set main report to modified of False}
  lMainReport := TppReport(Report.MainReport);

  if (lMainReport <> nil) then
    lMainReport.Modified := False;


end; {procedure, Loaded}


{------------------------------------------------------------------------------}
{ TdaDataModule.Convert }

procedure TdaDataModule.Convert(aVersionNo: Integer);
var
  liIndex: Integer;
begin

  if (aVersionNo < 5200) then
    begin
      for liIndex := 0 to DataViewCount - 1 do
        DataViews[liIndex].Convert(aVersionNo);
    end;

end; {procedure, Convert}

{------------------------------------------------------------------------------}
{ TdaDataModule.SetParentComponent - required method for Components with HasParent = True }

procedure TdaDataModule.SetParentComponent(Value: TComponent);
var
  lDataView: TdaDataView;
  liIndex: Integer;
begin

  if (Value = nil) then
    SetReport(nil)
  else if Value.InheritsFrom(TppChildReport) then
    begin
      MergeWithReport(TppChildReport(Value).MainReport);
      {Free;}
    end
  else
    SetReport(TppCustomReport(Value));

 if (Report <> nil) then
   begin
     for liIndex := 0 to DataViewCount - 1 do
       begin
         lDataView := DataViews[liIndex];

         lDataView.Report := Report;
       end;
   end;

end; {procedure, SetParentComponent}

{------------------------------------------------------------------------------}
{ TdaDataModule.AddChild }

procedure TdaDataModule.AddChild(aChild: TppRelative);
begin
  inherited AddChild(aChild);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  UpdateShowAutoSearchDialog;

end; {procedure, AddChild}

{------------------------------------------------------------------------------}
{ TdaDataModule.InsertChild }

procedure TdaDataModule.InsertChild(aPosition: Integer; aChild: TppRelative);
begin
  inherited InsertChild(aPosition, aChild);

  if (csReading in ComponentState) or (csLoading in ComponentState) then Exit;

  UpdateShowAutoSearchDialog;

end; {procedure, InsertChild}

{------------------------------------------------------------------------------}
{ TdaDataModule.RemoveChild}

function TdaDataModule.RemoveChild(aChild: TppRelative): Integer;
begin
  Result := inherited RemoveChild(aChild);

  if csDestroying in ComponentState then Exit;

  UpdateShowAutoSearchDialog;

end; {function, RemoveChild}

{------------------------------------------------------------------------------}
{ TdaDataModule.UpdateShowAutoSearchDialog}

procedure TdaDataModule.UpdateShowAutoSearchDialog;
begin

  {update main report ShowAutoSearchDialog boolean}
  if (Report <> nil) and (Report.MainReport <> nil) then
    TppReport(Report.MainReport).ShowAutoSearchDialog := AutoSearchFieldsExist;

end; {procedure, UpdateShowAutoSearchDialog}

{------------------------------------------------------------------------------}
{ TdaDataModule.AutoSearchFieldsExist }

function TdaDataModule.AutoSearchFieldsExist: Boolean;
var
  liIndex: Integer;

begin
  Result := False;

  liIndex := 0;

  {determine whether any DataViews have AutoSearchFields}
  while not Result and (liIndex < DataViewCount) do
    if DataViews[liIndex].AutoSearchFieldsExist then
      Result := True
    else
      Inc(liIndex);

end;  {function, AutoSearchFieldsExist}


{------------------------------------------------------------------------------}
{ TdaDataModule.GetDataViewCount }

function TdaDataModule.GetDataViewCount: Integer;
begin
  Result := ChildCount;

end; {function, GetDataViewCount}

{------------------------------------------------------------------------------}
{ TdaDataModule.GetDataViewForIndex }

function TdaDataModule.GetDataViewForIndex(aIndex: Integer): TdaCustomDataView;
begin
  Result := TdaCustomDataView(Children[aIndex]);

end; {function, GetDataViewForIndex}

{------------------------------------------------------------------------------}
{ TdaDataModule.GetDetailDataViews }

procedure TdaDataModule.GetDetailDataViews(aMasterDataView: TdaDataView; aList: TList);
var
  liIndex: Integer;
  lDataView: TdaDataView;
begin

  aList.Clear;

  for liIndex := 0 to DataViewCount - 1 do
    begin
      lDataView := DataViews[liIndex];

      if lDataView.MasterDataView = aMasterDataView then
        aList.Add(lDataView);
    end;

end; {procedure, GetDetailDataViews}

{------------------------------------------------------------------------------}
{ TdaDataModule.GetLinkableDataViewsForDataView }

procedure TdaDataModule.GetLinkableDataViewsForDataView(aList: TList; aDataView: TdaDataView);
var
  liIndex: Integer;
  lDataView: TdaDataView;
begin

  aList.Clear;

  for liIndex := 0 to DataViewCount - 1 do
    begin
      lDataView := DataViews[liIndex];

      if lDataView.IsLinkable and (lDataView <> aDataview) and not(lDataView.InMasterChain(aDataView)) then
        aList.Add(lDataView);
    end;

end; {procedure, GetLinkableDataViewsForDataView}

{------------------------------------------------------------------------------}
{ TdaDataModule.GetLinkableDataViews }

procedure TdaDataModule.GetLinkableDataViews(aList: TList);
var
  liIndex: Integer;
  lDataView: TdaDataView;
begin

  aList.Clear;

  for liIndex := 0 to DataViewCount - 1 do
    begin
      lDataView := DataViews[liIndex];

      if lDataView.IsLinkable then
        aList.Add(lDataView);
    end;

end; {procedure, GetLinkableDataViews}

{------------------------------------------------------------------------------}
{ TdaDataModule.IndexOfDataView }

function TdaDataModule.IndexOfDataView(aDataView: TdaDataView): Integer;
begin
  Result := IndexOfChild(aDataView);
end; {function, IndexOfDataView}

{------------------------------------------------------------------------------}
{ TdaDataModule.Merge }

procedure TdaDataModule.Merge(aDataModule: TdaDataModule);
var
  liIndex: Integer;
begin

  for liIndex := 0 to aDataModule.DataViewCount - 1  do
    aDataModule.DataViews[0].Parent := Self;

end; {procedure, Merge}

{------------------------------------------------------------------------------}
{ TdaDataModule.MergeWithReport }

procedure TdaDataModule.MergeWithReport(aReport: TppCustomReport);
var
  lDataModule: TdaDataModule;
begin

  if (aReport = nil) then Exit;

  {get report's data module}
  lDataModule := daGetDataModule(aReport);

  {Re-assign this data module to the report (if no module exists),
   otherwise merge this module with the report's data module}
  if (lDataModule = nil) then
    SetReport(aReport)
  else
    lDataModule.Merge(Self);

end; {procedure, MergeWithReport}

{------------------------------------------------------------------------------}
{ TdaDataModule.FindDataViewByUserName }

function TdaDataModule.FindDataViewByUserName(aUserName: String): TdaCustomDataView;
var
  liIndex: Integer;
  lDataView: TdaCustomDataView;

begin

  Result  := nil;
  liIndex := 0;

  while (Result = nil) and (liIndex < GetDataViewCount) do
    begin
      lDataView := GetDataViewForIndex(liIndex);

      if (lDataView.UserName = aUserName) then
        Result := lDataView;

      Inc(liIndex);

    end;

end; {function, FindDataViewByUserName}

{------------------------------------------------------------------------------}
{ TdaDataModule.IsValidDataPipelineUserName }

function  TdaDataModule.IsValidDataPipelineUserName(aUserName: String): Boolean;
var
  liIndex: Integer;
  liPipeline: Integer;
  lDataView: TdaCustomDataView;
  lDataPipeline: TppDataPipeline;

begin

  Result := True;
  liIndex := 0;

  while Result and (liIndex < GetDataViewCount) do
    begin
      lDataView := GetDataViewForIndex(liIndex);

      liPipeline := 0;

      while Result and (liPipeline < lDataView.DataPipelineCount) do
        begin
          lDataPipeline := lDataView.DataPipelines[liPipeline];

          if (lDataPipeline.UserName = aUserName) then
            Result := False;

          Inc(liPipeline);

        end;


      Inc(liIndex);

    end;


end; {function, FindDataViewByUserName}



{******************************************************************************
 *
 ** I N I T I A L I Z A T I O N   /   F I N A L I Z A T I O N
 *
{******************************************************************************}

initialization

  RegisterClass(TdaDataModule);

finalization

  UnRegisterClass(TdaDataModule);
end.
