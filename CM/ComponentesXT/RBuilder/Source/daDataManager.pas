{******************************************************************************}
{                                                                              }
{                ReportBuilder Data Access Development Environment             }
{                                                                              }
{             Copyright (c) 1996, 2000 Digital Metaphors Corporation           }
{                                                                              }
{******************************************************************************}

unit daDataManager;

interface

{$I ppIfDef.pas}

uses
  Messages, SysUtils, Classes, Controls, Dialogs, Graphics, Forms, Menus, IniFiles, StdCtrls, Windows, ExtCtrls,
  ppClass, ppComm, ppTypes, ppUtils, ppDsIntf, ppWizard, ppForms, ppDB, ppDsgner, ppDsgnDB,
  daDataModule, daDB, daDataWizard, daDataWizardManager, daDataView, daDataViewToolWin, daForms, daLinkManager;

type

  TppDataViewWindowList = class;

  { TdaDataManager

    Handles the coordination of the various visual elements displayed in the
    Data workspace, including the tool windows for each dataview and any links
    which may have been established between them.  Utilizes the DataWizardManager
    for the creation of new dataviews, but takes responsibility for configuring
    and displaying the dataview once it has been created. }

  TdaDataManager = class(TppDesignModule)
    private
      FCurrentReport: TppCustomReport;
      FDataModule: TdaDataModule;
      FDataViewWindows: TppDataViewWindowList;
      FReportDesigner: TppDesignerWindow;
      FFileMenu: TMenuItem;
      FLinkManager: TdaLinkManager;
      FMenu: TMainMenu;
      FMenuItemDataSettings: TMenuItem;
      FMenuItemImportFromFile: TMenuItem;
      FPaintBox: TPaintBox;
      FReport: TppCustomReport;
      FWalkieTalkie: TppCommunicator;
      FWizardManager: TdaDataWizardManager;
      FWorkSpace: TdaScrollBox;

      function  AddDataViewWindow(aDataView: TdaDataView): TdaDataViewToolWin;
      procedure AdjustDataViewTops(aMergeDataModule: TdaDataModule);
      procedure CalcWindowPosition(aDataViewWindow: TdaDataViewToolWin);
      procedure CreateControls;
      procedure CreateMenu;
      procedure DisplayMetaData;
      procedure FreeAllVisualControls;
      procedure FreeVisualControls(aDataView: TdaDataView);
      function GetDataModuleForReport: TdaDataModule;
      procedure HideVisualControls;
      procedure IntitializeDataViewWindows;
      procedure InitializeStatusBar;
      procedure SetDataViewsOutOfSync;
      procedure SetAllowDataSettingsChange(aValue: Boolean);
      procedure SetDataModule(aDataModule: TdaDataModule);
      procedure SetReport(aReport: TppCustomReport);
      procedure ShowVisualControls;
      procedure SyncDataViews;
      procedure UpdateDataViewWindows;

      {event handlers}
      procedure EditDataViewEvent(Sender: TObject);
      procedure FileMenuClickEvent(Sender: TObject);
      procedure FileMenuItemClickEvent(Sender: TObject);
      procedure DataModuleRemoveChildEvent(Sender: TObject);
      procedure DataModuleLanguageChangedEvent(Sender: TObject);
      procedure DeleteDataViewEvent(Sender: TObject);
      procedure DesignerDataSettingsChangeEvent(Sender: TObject);
      procedure WalkieTalkieNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType);
      procedure WorkspaceMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    protected
      procedure SetComponent(aComponent: TComponent); override;
      procedure SetLanguageIndex(aLanguageIndex: Integer); override;

    public
      constructor CreateModule(aParent: TWinControl; aComponentDesigner: TppComponentDesigner); override;
      destructor Destroy; override;

      procedure ActiveChanging(var aAllowChange: Boolean); override;
      procedure LoadStart; override;
      procedure SaveStateInfo; override;
      procedure LoadStateInfo; override;
      procedure SaveStart; override;

      function DesignDataView(aDataView: TdaDataView): Boolean;
      procedure DisplayDataSettingsDialog;
      procedure ExportDataModule(aTarget: TppSaveToType);
      function GetDefaultDescription: String;
      function GetToolWindowForDataView(aDataView: TdaDataView): TdaDataViewToolWin;
      procedure ImportDataModule(aSource: TppSaveToType);
      procedure MergeDataModule(aSource: TppSaveToType);
      procedure NewDataView;
      procedure UpdateEnabledOptions;

      property DataModule: TdaDataModule read FDataModule write SetDataModule;
      property DataViewWindows: TppDataViewWindowList read FDataViewWindows;

   end; {class, TdaDataManager}


  { TppDataViewWindowList

    Manages a dual list of ToolWindows and their corresponding DataViews,
    thus allowing access via an Index or a DataView }

  TppDataViewWindowList = class
    private
      FToolWindows: TList;
      FDataViews: TList;

      function GetCount: Integer;
      function GetDataViewWindow(aIndex: Integer): TdaDataViewToolWin;

    public
      constructor Create;
      destructor Destroy; override;

      procedure Add(aDataViewToolWin: TdaDataViewToolWin);
      procedure Clear;
      procedure Delete(aIndex: Integer);
      function GetWindowForDataView(aDataView: TdaDataView): TdaDataViewToolWin;
      function IndexOfDataView(aDataView: TdaDataView): Integer;
      procedure Remove(aDataViewToolWin: TdaDataViewToolWin);

      property Count: Integer read GetCount;
      property ToolWindows[Index: Integer]: TdaDataViewToolWin read GetDataViewWindow; default;

  end; {class, TppDataViewWindowList}



implementation

uses
  daMetaDataDlg;
  
type
  TdaFileMenuCommandType = (fmDataSettings, fmNew, fmClose, fmImport, fmMerge, fmExport, fmImportFromFile, fmExportToFile);

const
  cMenuCaptions: array [0..0] of Integer = (704); {&File}

  {'&Data Settings', '&New', 'Close', '&Import', '&Merge', '&Export', '&Import From File', '&Export To File', }
  cFileMenuCaptions: array [Low(TdaFileMenuCommandType)..High(TdaFileMenuCommandType)] of Integer =
                     (701, 708, 132, 705, 707, 702, 706, 703);


{------------------------------------------------------------------------------}
{ daDefaultDatabaseType }

function daDefaultDatabaseType(aDataOwner: TComponent; const aSessionType, aDatabaseName: String): TppDatabaseType;
var
  lSessionClass: TdaSessionClass;
  lSession: TdaSession;
begin

  Result := dtOther;

  lSessionClass := daGetSessionClass(aSessionType);

  if (lSessionClass <> nil) then
    begin
      lSession := lSessionClass.Create(nil);
      lSession.DataOwner := aDataOwner;
 
      Result := lSession.GetDatabaseType(aDatabaseName);

      lSession.Free;
    end;

end; {function, daDefaultDatabaseType}

{******************************************************************************
 *
 ** D A T A   M A N A G E R
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TdaDataManager.CreateModule }

constructor TdaDataManager.CreateModule(aParent: TWinControl; aComponentDesigner: TppComponentDesigner);
begin

  inherited CreateModule(aParent, aComponentDesigner);

  Caption := ppLoadStr(742); {Data}
  OrderIndex := 1;

  FCurrentReport := nil;
  FDataModule := nil;
  FDataViewWindows := TppDataViewWindowList.Create;
  FLinkManager := TdaLinkManager.Create(Self);
  FPaintBox := nil;
  FReport := nil;
  FWalkieTalkie := TppCommunicator.Create(nil);
  FWalkieTalkie.OnNotify := WalkieTalkieNotifyEvent;
  FWizardManager := TdaDataWizardManager.Create(nil);
  FWizardManager.DataManager := Self;
  FWorkspace := nil;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TdaDataManager.Destroy }

destructor TdaDataManager.Destroy;
begin

  if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
    TppDataSettings(FReportDesigner.DataSettings).OnChange := nil;

  FLinkManager.Free;

  {clear the data view window list, this
   will avoid the access violation that occurs
   when SetDataModule(nil) tries to free them explicity}
  FDataViewWindows.Clear;

  SetDataModule(nil);

  FDataViewWindows.Free;
  FWizardManager.Free;
  FWalkieTalkie.Free;

  inherited Destroy;

end; {constructor, Destroy}

{------------------------------------------------------------------------------}
{ TdaDataManager.WalkieTalkieNotifyEvent }

procedure TdaDataManager.WalkieTalkieNotifyEvent(Sender: TObject; aCommunicator: TppCommunicator; aOperation: TppOperationType);
begin

  if (aOperation = ppopRemove) and (aCommunicator = FDataModule) then
    FDataModule := nil;

end; {procedure, WalkieTalkieNotifyEvent}


{------------------------------------------------------------------------------}
{ TdaDataManager.SetComponent }

procedure TdaDataManager.SetComponent(aComponent: TComponent);
begin

  if (aComponent <> nil) and not (aComponent is TppCustomReport) then Exit;

  inherited SetComponent(aComponent);

  SetReport(TppCustomReport(aComponent));

end; {procedure, SetComponent}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetReport }

procedure TdaDataManager.SetReport(aReport: TppCustomReport);
begin

  {do nothing, if this tab has never been active}
  if (FWorkspace = nil) then Exit;

  FReport := aReport;

  SetDataModule(daGetDataModule(FReport));

  if (FReport <> nil) then
     SetLanguageIndex(FReport.LanguageIndex);

end; {procedure, SetReport}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetDataModule }

procedure TdaDataManager.SetDataModule(aDataModule: TdaDataModule);
begin

  if (FDataModule = aDataModule) then Exit;

  if (FDataModule <> nil) then
    begin
      FDataModule.RemoveNotify(FWalkieTalkie);

      FDataModule.OnRemoveChild := nil;
      FDataModule.OnLanguageChanged := nil;
    end;

  FDataModule := aDataModule;
  FLinkManager.DataModule := aDataModule;
  FWizardManager.DataModule := aDataModule;

  if FDataModule <> nil then
    begin
      IntitializeDataViewWindows;

      FDataModule.OnRemoveChild := DataModuleRemoveChildEvent;
      FDataModule.OnLanguageChanged := DataModuleLanguageChangedEvent;
      
      FDataModule.AddNotify(FWalkieTalkie);
    end;

end; {procedure, SetDataModule}

{------------------------------------------------------------------------------}
{ TdaDataManager.DataModuleRemoveChildEvent}

procedure TdaDataManager.DataModuleRemoveChildEvent(Sender: TObject);
var
  lDataView: TdaDataView;
begin

  lDataView := TdaDataView(Sender);

  FreeVisualControls(lDataView);

end; {procedure, DataModuleRemoveChildEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.DataModuleLanguageChangedEvent}

procedure TdaDataManager.DataModuleLanguageChangedEvent(Sender: TObject);
begin

  if (FReport <> nil) then
    SetLanguageIndex(FReport.LanguageIndex);

end; {procedure, DataModuleLanguageChangedEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetAllowDataSettingsChange }

procedure TdaDataManager.SetAllowDataSettingsChange(aValue: Boolean);
var
  liIndex: Integer;
begin

  FMenuItemDataSettings.Visible := aValue;

  liIndex := FFileMenu.IndexOf(FMenuItemDataSettings);

  {set the line "-" item  visibility also}
  FFileMenu.Items[liIndex+1].Visible := FMenuItemDataSettings.Visible;

end; {procedure, SetAllowDataSettingsChange}

{------------------------------------------------------------------------------}
{ TdaDataManager.CreateControls }

procedure TdaDataManager.CreateControls;
begin

  CreateMenu;

  {create workspace scrollbox}
  FWorkSpace := TdaScrollBox.Create(Parent);
  FWorkSpace.Parent := Parent;
  FWorkSpace.Align := alClient;
  FWorkSpace.Color := clBtnFace;

  {create workspace paintbox}
  FPaintBox := TPaintBox.Create(FWorkSpace);
  FPaintBox.Parent := FWorkSpace;
  FPaintBox.Align := alClient;

  FLinkManager.SetVisualControls(FWorkspace, FPaintBox);

  {enable display of meta data cache}
  FPaintBox.OnMouseDown := WorkspaceMouseDownEvent;

end; {procedure, CreateControls}

{------------------------------------------------------------------------------}
{ TdaDataManager.WorkspaceMouseDownEvent }

procedure TdaDataManager.WorkspaceMouseDownEvent(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (ssCtrl in Shift) then
    DisplayMetaData;
end; {procedure, WorkspaceMouseDownEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.DisplayMetaData }

procedure TdaDataManager.DisplayMetaData;
var
  lDialog: TForm;
begin

  lDialog := TdaMetaDataDialog.Create(Owner);

  lDialog.ShowModal;

  lDialog.Free;

end; {procedure, DisplayMetaData}

{------------------------------------------------------------------------------}
{ TdaDataManager.CreateMenu }

procedure TdaDataManager.CreateMenu;
var
  lMenuItem: TMenuItem;
  lFileCommandType: TdaFileMenuCommandType;
begin
        
  FMenu := TMainMenu.Create(Parent);

  FFileMenu := TMenuItem.Create(Parent);
  FFileMenu.Caption := ppLoadStr(cMenuCaptions[0]);
  FFileMenu.OnClick := FileMenuClickEvent;

  FMenu.Items.Add(FFileMenu);

  {create File menu and subitems: Open, Save, SaveAs}
  for lFileCommandType := Low(TdaFileMenuCommandType) to High(TdaFileMenuCommandType) do
    begin
      lMenuItem := TMenuItem.Create(Parent);

      if (lFileCommandType <> fmClose) then
        lMenuItem.Caption := ppLoadStrWithEllipses(cFileMenuCaptions[lFileCommandType])
      else
        lMenuItem.Caption := ppLoadStr(cFileMenuCaptions[lFileCommandType]);

      lMenuItem.Tag     := Ord(lFileCommandType);
      lMenuItem.OnClick := FileMenuItemClickEvent;

      if (lFileCommandType = fmDataSettings) then
        FMenuItemDataSettings := lMenuItem;

      if (lFileCommandType = fmImportFromFile) then
        FMenuItemImportFromFile := lMenuItem;

      {insert separator}
      if (lFileCommandType in [fmDataSettings, fmClose, fmExport]) then
        begin
          FFileMenu.Add(lMenuItem);
          lMenuItem := TMenuItem.Create(Parent);
          lMenuItem.Caption := '-';
        end;
        
      FFileMenu.Add(lMenuItem);
    end;

end; {procedure, CreateMenu}

{------------------------------------------------------------------------------}
{ TdaDataManager.LoadStateInfo }

procedure TdaDataManager.LoadStateInfo;
var
  lIniFile: TIniFile;
begin

  if FWorkSpace = nil then Exit;

  lIniFile := TIniFile.Create('RBuilder.ini');

  FWizardManager.DataSettings.LoadStateInfo(lIniFile, FDataModule);

  lIniFile.Free;

end; {procedure, LoadStateInfo}

{------------------------------------------------------------------------------}
{ TdaDataManager.SaveStateInfo }

procedure TdaDataManager.SaveStateInfo;
var
  lIniFile: TIniFile;
begin

  if FWorkspace = nil then Exit;

  lIniFile := TIniFile.Create('RBuilder.ini');

  FWizardManager.DataSettings.SaveStateInfo(lIniFile);

  lIniFile.Free;

end; {procedure, SaveStateInfo}

{------------------------------------------------------------------------------}
{ TdaDataManager.GetToolWindowForDataView }

function TdaDataManager.GetToolWindowForDataView(aDataView: TdaDataView): TdaDataViewToolWin;
begin

  Result := FDataViewWindows.GetWindowForDataView(aDataView);

end; {function, GetToolWindowForDataView}

{------------------------------------------------------------------------------}
{ TdaDataManager.GetDataModuleForReport }

function TdaDataManager.GetDataModuleForReport: TdaDataModule;
begin

 {create a new data module, if needed}
  if (FReport = nil) then
    Result := nil

  else if (daGetDataModule(FReport) = nil) then
    Result := TdaDataModule.CreateForReport(FReport)

  else
    Result := daGetDataModule(FReport);

end; {procedure, GetDataModuleForReport}

{------------------------------------------------------------------------------}
{ TdaDataManager.LoadStart }

procedure TdaDataManager.LoadStart;
var
  liIndex: Integer;
begin

  if (FDataModule = nil) then Exit;

  for liIndex := FDataModule.DataViewCount - 1 downto 0 do
    FDataModule.DataViews[liIndex].Free;

end; {procedure, LoadStart}

{------------------------------------------------------------------------------}
{ TdaDataManager.SaveStart }

procedure TdaDataManager.SaveStart;
var
  liIndex: Integer;
begin

  if (FDataModule = nil) then Exit;

  for liIndex := FDataViewWindows.Count - 1 downto 0 do
    FDataViewWindows[liIndex].SaveState;

end; {procedure, SaveStart}

{------------------------------------------------------------------------------}
{ TdaDataManager.ActiveChanging }

procedure TdaDataManager.ActiveChanging(var aAllowChange: Boolean);
var
  lbFirstTime: Boolean;
  lDataSettings: TppDataSettings;
begin


  if (ComponentDesigner = nil) then Exit;

  if Active then
    begin
      HideVisualControls;

      SaveStateInfo;

      if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
        lDataSettings := TppDataSettings(FReportDesigner.DataSettings)
      else
        lDataSettings := nil;

      if (lDataSettings <> nil) and not(lDataSettings.EqualTo(FWizardManager.DataSettings)) then
        lDataSettings.Assign(FWizardManager.DataSettings);

      {must do this after assigning data settings}
      if (FDataModule <> nil) and FDataModule.Modified then
        SyncDataViews;
    end

  else
    begin

      lbFirstTime := (FWorkspace = nil);

      if lbFirstTime then
        begin
         FReportDesigner := TppDesignerWindow(ComponentDesigner);

         CreateControls;

         if (FReportDesigner <> nil) then
           SetReport(FReportDesigner.Report);

         LoadStateInfo;

         if (FReportDesigner.DataSettings <> nil) then
           TppDataSettings(FReportDesigner.DataSettings).OnChange := DesignerDataSettingsChangeEvent;

        end;

      SetDataModule(GetDataModuleForReport);

      FCurrentReport := TppCustomReport(ComponentDesigner.CurrentComponent);

      ComponentDesigner.Menu := FMenu;

      if (FReport <> nil) and not (csDesigning in FReport.ComponentState) then
        begin
          if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
            begin
              lDataSettings := TppDataSettings(FReportDesigner.DataSettings);

              if (lDataSettings.DatabaseType = dtOther) then
                lDataSettings.DatabaseType := daDefaultDatabaseType(DataModule.Owner, lDataSettings.SessionType, lDataSettings.DatabaseName);

              FWizardManager.DataSettings := lDataSettings;

            end;

          SetAllowDataSettingsChange(FReportDesigner.AllowDataSettingsChange);
        end;

      InitializeStatusBar;

      UpdateDataViewWindows;

      {workspace must have focus, otherwise any delete keystrokes will be captured by parent tabsheet}
      FWorkspace.SetFocus;

      ShowVisualControls;
    end;


end; {procedure, ActiveChanging}

{------------------------------------------------------------------------------}
{ TdaDataManager.HideVisualControls }

procedure TdaDataManager.HideVisualControls;
var
  liIndex: Integer;
begin

  FPaintBox.Visible := False;

  for liIndex := 0 to FDataViewWindows.Count - 1 do
    FDataViewWindows[liIndex].Visible := False;

end; {procedure, HideVisualControls}

{------------------------------------------------------------------------------}
{ TdaDataManager.ShowVisualControls }

procedure TdaDataManager.ShowVisualControls;
var
  liIndex: Integer;
begin

  for liIndex := 0 to FDataViewWindows.Count - 1 do
    FDataViewWindows[liIndex].Visible := True;

  FPaintBox.Visible := True;

end; {procedure, ShowVisualControls}

{------------------------------------------------------------------------------}
{ TdaDataManager.DesignerDataSettingsChangeEvent }

procedure TdaDataManager.DesignerDataSettingsChangeEvent(Sender: TObject);
begin

  if (FReportDesigner <> nil) and (FReportDesigner.DataSettings <> nil) then
    begin
      FWizardManager.DataSettings := TppDataSettings(FReportDesigner.DataSettings);

      SetDataViewsOutOfSync;
    end;

end; {procedure, DesignerDataSettingsChangeEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.IntitializeDataViewWindows }

procedure TdaDataManager.IntitializeDataViewWindows;
var
  liIndex: Integer;
  lDataView: TdaCustomDataView;
  lToolWindow: TdaDataViewToolWin;
begin

  if (FDataModule = nil) then
    raise Exception.Create('TdaDataManager.IntitializeDataViewWindows: Attempting to initialize Data Manager without data module assigned.');

  for liIndex := 0 to FDataModule.DataViewCount-1 do
    begin
      lDataView := FDataModule.DataViews[liIndex];

      lToolWindow := AddDataViewWindow(lDataView);

      if (lDataView.Width > 0) then
        begin
          lToolWindow.RestoreState;

          {make sure window is wihin visible area}
          if lToolWindow.Left >=  FWorkSpace.ClientWidth then
            lToolWindow.Left := FWorkSpace.ClientWidth - 25;

          if lToolWindow.Top >=  FWorkSpace.ClientHeight then
            lToolWindow.Top := FWorkSpace.ClientHeight - 25;
        end;

    end;

  FLinkManager.InitializeVisualLinks;

  UpdateEnabledOptions;

  FPaintBox.Refresh;

end; {procedure, IntitializeDataViewWindows}

{------------------------------------------------------------------------------}
{ TdaDataManager.UpdateDataViewWindows }

procedure TdaDataManager.UpdateDataViewWindows;
var
  liIndex: Integer;
  lDataView: TdaCustomDataView;
begin

  if (FDataModule = nil) then Exit;

  for liIndex := 0 to FDataModule.DataViewCount - 1 do
    begin
      lDataView := FDataModule.DataViews[liIndex];

      if FDataViewWindows.IndexOfDataView(lDataView) < 0 then
        begin
          AddDataViewWindow(lDataView);

          UpdateEnabledOptions;
        end;
    end;

end; {procedure, UpdateDataViewWindows}

{------------------------------------------------------------------------------}
{ TdaDataManager.UpdateEnabledOptions }

procedure TdaDataManager.UpdateEnabledOptions;
var
  liIndex: Integer;
  lDataView: TdaCustomDataView;
  lToolWindow: TdaDataViewToolWin;
  lEnabledOptions: TppDataEditTypes;
  lDataViews: TList;
begin

  if (FDataViewWindows = nil) then Exit;

  lDataViews := TList.Create;
  FDataModule.GetLinkableDataViews(lDataViews);

  for liIndex := 0 to FDataViewWindows.Count - 1 do
    begin
      lToolWindow := FDataViewWindows[liIndex];

      lDataView := lToolWindow.DataView;

      if (lDataView <> nil) then
        begin
          lEnabledOptions := lDataView.EnabledOptions;

          lDataView.UpdateEnabledOptions(lDataViews);

          if (lEnabledOptions <> lDataView.EnabledOptions) then
            lToolWindow.UpdateEnabledOptions;
        end;
    end;

  lDataViews.Free;

end; {procedure, UpdateEnabledOptions}

{------------------------------------------------------------------------------}
{ TdaDataManager.AddDataViewWindow }

function TdaDataManager.AddDataViewWindow(aDataView: TdaDataView): TdaDataViewToolWin;
var
  lToolWindow: TdaDataViewToolWin;
begin

  lToolWindow := TdaDataViewToolWin.Create(FWorkSpace);
  lToolWindow.Parent := FWorkSpace;
  lToolWindow.DataView := TdaCustomDataView(aDataView);

  lToolWindow.OnDeleteDataView := DeleteDataViewEvent;
  lToolWindow.OnEditDataView := EditDataViewEvent;

  lToolWindow.OnDeleteKeyDown := FLinkManager.DataViewDeleteKeyDownEvent;
  lToolWindow.OnDeleteLink := FLinkManager.DataViewDeleteLinkEvent;
  lToolWindow.OnEndLink := FLinkManager.DataViewEndLinkEvent;
  lToolWindow.OnLinking := FLinkManager.DataViewLinkingEvent;
  lToolWindow.OnSelectField := FLinkManager.DataViewSelectFieldEvent;
  lToolWindow.OnStartLink := FLinkManager.DataViewStartLinkEvent;

  CalcWindowPosition(lToolWindow);

  lToolWindow.Visible := True;
  
  {this call must be made, otherwise the column headers are blank}
  lToolWindow.ListView.Refresh;

  FDataViewWindows.Add(lToolWindow);

  Result := lToolWindow;

end; {procedure, AddDataViewWindow}

{------------------------------------------------------------------------------}
{ TdaDataManager.CalcWindowPosition }

procedure TdaDataManager.CalcWindowPosition(aDataViewWindow: TdaDataViewToolWin);
var
  liIndex: Integer;
  lWindow: TdaDataViewToolWin;
  liRight: Integer;
  liMaxRight: Integer;
  liBottom: Integer;
  lbOpeningFound: Boolean;
  liSpace: Integer;
  lWindows: TStringList;
begin

  {set top}
  aDataViewWindow.Top := 10;


  {set window height, so that all fields are shown}
  aDataViewWindow.Height := aDataViewWindow.ShowAllFieldsHeight + 60;


  {set width}
  aDataViewWindow.Width := 200;
  {lToolWindow.Width := 274;} {old width which shows all tool buttons}


  {set left}
  lWindows := TStringList.Create;

  {build a list of the dataview windows ordered from left to right}
  for liIndex := 0 to FDataViewWindows.Count - 1 do
    begin
      lWindow := DataViewWindows[liIndex];

      lWindows.AddObject(Format('%8d', [lWindow.Left]), lWindow);
    end;

  lWindows.Sort;

  {search for a dataview windows sized space between the existing windows.}
  liMaxRight := 0;
  liRight := 0;
  lbOpeningFound := False;
  liIndex := 0;

  while not(lbOpeningFound) and (liIndex < lWindows.Count) do
    begin
      lWindow := TdaDataViewToolWin(lWindows.Objects[liIndex]);

      if (liRight <> 0) then
        begin
          liSpace := lWindow.Left - liRight;

          if (liSpace > 188) then
            begin
              lbOpeningFound := True;

            end;
        end;

      if not(lbOpeningFound) then
        begin
          liRight := lWindow.Left + lWindow.Width;

          if (liRight > liMaxRight) then
            liMaxRight := liRight;
        end;

      Inc(liIndex);
    end;

  lWindows.Free;

  if (liMaxRight = 0) then
    aDataViewWindow.Left := 10
  else
    aDataViewWindow.Left := liMaxRight + 50;

  {make sure window is within visible area}
  if (aDataViewWindow.Left >= FWorkSpace.ClientWidth) then
    aDataViewWindow.Left := FWorkSpace.ClientWidth - 25;

  liBottom := aDataViewWindow.Top + aDataViewWindow.Height;

  if (liBottom >= FWorkSpace.ClientHeight) then
    aDataViewWindow.Height := aDataViewWindow.Height - ((liBottom - FWorkSpace.ClientHeight) + 25);


end;{procedure, CalcWindowPosition}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetDataViewsOutOfSync }

procedure TdaDataManager.SetDataViewsOutOfSync;
var
  liIndex: Integer;
begin
  if (FDataModule = nil) then Exit;

  for liIndex := 0 to FDataModule.DataViewCount - 1 do
    FDataModule.DataViews[liIndex].OutOfSync;

end; {procedure, SetDataViewsOutOfSync}

{------------------------------------------------------------------------------}
{ TdaDataManager.SyncDataViews }

procedure TdaDataManager.SyncDataViews;
var
  liIndex: Integer;
  lSaveCursor: TCursor;
begin

  if (FDataModule = nil) then Exit;

  lSaveCursor := Screen.Cursor;

  Screen.Cursor := crHourGlass;

  try
    for liIndex := 0 to FDataModule.DataViewCount - 1 do
      FDataModule.DataViews[liIndex].Sync;
  finally
    Screen.Cursor := lSaveCursor;
  end;

end; {procedure, SyncDataViews}

{------------------------------------------------------------------------------}
{ TdaDataManager.FreeAllVisualControls }

procedure TdaDataManager.FreeAllVisualControls;
var
  liIndex: Integer;
begin

  for liIndex := FDataViewWindows.Count - 1 downto 0 do
    FreeVisualControls(FDataViewWindows[liIndex].DataView);

end; {procedure, FreeAllVisualControls}

{------------------------------------------------------------------------------}
{ TdaDataManager.FreeVisualControls }

procedure TdaDataManager.FreeVisualControls(aDataView: TdaDataView);
var
  liIndex: Integer;
  lDataViewWindow: TdaDataViewToolWin;
begin

  liIndex := FDataViewWindows.IndexOfDataView(aDataView);

  if (liIndex <> -1) then
    begin
      {remove any links}
      FLinkManager.RemoveVisualLinksForDataView(aDataView);

      lDataViewWindow := FDataViewWindows[liIndex];

      lDataViewWindow.SaveState;

      {remove the data view window}
      FDataViewWindows.Delete(liIndex);
      lDataViewWindow.Free;
    end;

end; {procedure, FreeVisualControls}

{------------------------------------------------------------------------------}
{ TdaDataManager.DeleteDataViewEvent }

procedure TdaDataManager.DeleteDataViewEvent(Sender: TObject);
var
  lDataView: TdaDataView;
begin

  lDataView := TdaDataViewToolWin(Sender).DataView;

  {must call this before dataview is freed}
  FLinkManager.DataViewDeleted(lDataView);

  lDataView.Free;

  FDataModule.Modified := True;

  UpdateEnabledOptions;

end;  {procedure, DeleteDataViewEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.NewDataView }

procedure TdaDataManager.NewDataView;
var
  lDataView: TdaCustomDataView;
  lDataDictionary: TppDataDictionary;
begin

  if (FDataModule = nil) then
    raise Exception.Create('TdaDataManager.NewDataView: Attempting to create a new dataview without a data module assigned.');

  if (FReport = nil) then
    raise Exception.Create('TdaDataManager.NewDataView: Attempting to create a new dataview without a report assigned.');


  if FWizardManager.NewDataView(lDataView) then
    begin
      {always assign current report to dataview}
      lDataView.Report := FCurrentReport;

      AddDataViewWindow(lDataView);

      if FWizardManager.DataSettings.UseDataDictionary then
        lDataDictionary := FWizardManager.DataSettings.DataDictionary
      else
        lDataDictionary := nil;

      FLinkManager.NewDataView(lDataView, lDataDictionary);

      UpdateEnabledOptions;

      FDataModule.Modified := True;
    end;

end; {procedure, NewDataView}

{------------------------------------------------------------------------------}
{ TdaDataManager.EditDataViewEvent }

procedure TdaDataManager.EditDataViewEvent(Sender: TObject);
var
  lDataView: TdaDataView;
begin

  lDataView := TdaDataViewToolWin(Sender).DataView;

  if lDataView.EditMode = ppemPreview then
    lDataView.Preview

  else if lDataView.EditMode = ppemLink then
    FLinkManager.EditLinks(lDataView)

  else if DesignDataView(lDataView) then
    begin
      TdaDataViewToolWin(Sender).UpdateEnabledOptions;

      TdaDataViewToolWin(Sender).Refresh;

      FDataModule.Modified := True;
    end;

end;  {procedure, EditDataViewEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.DesignDataView }

function TdaDataManager.DesignDataView(aDataView: TdaDataView): Boolean;
begin

  aDataView.Active := False;

  Result := FWizardManager.DesignDataView(TdaCustomDataView(aDataView));

end;  {procedure, DesignDataView}

{------------------------------------------------------------------------------}
{ TdaDataManager.GetDefaultDescription }

function TdaDataManager.GetDefaultDescription: String;
var
  liPos: Integer;
begin

  Result := '';

  if (FDataModule = nil) or (FReport = nil) then Exit;


  Result := FDataModule.Template.Description;

  if Result = '' then
    Result := FReport.MainReport.Template.Description + ' ' + ppLoadStr(742); {Data}

  liPos := Pos('.', Result);

  if (liPos <> 0) then
    Result := Copy(Result, 1, liPos - 1);

end; {function, GetDefaultDescription}

{------------------------------------------------------------------------------}
{ TdaDataManager.ImportDataModule }

procedure TdaDataManager.ImportDataModule(aSource: TppSaveToType);
begin

  if (FDataModule = nil) then
    raise Exception.Create('TdaDataManager.ImportDataModule: Attempting to import a data module without a data module assigned.');


  FDataModule.Template.InitializeSettings(FReport.Template);
  FDataModule.Template.SaveTo := aSource;

  if FDataModule.Template.ShowOpenDialog then
    begin
      {delete old dataview windows}
      FreeAllVisualControls;

      FDataModule.Template.Load;

      {add new data views}
      IntitializeDataViewWindows;

      {connect report to first dataview}
      if FDataModule.DataViewCount > 0 then
        FDataModule.DataViews[0].Report := FReport;

      FDataModule.Modified := True;
    end;

end;  {procedure, ImportDataModule}

{------------------------------------------------------------------------------}
{ TdaDataManager.MergeDataModule }

procedure TdaDataManager.MergeDataModule(aSource: TppSaveToType);
var
  lMergeDataModule: TdaDataModule;
  lDummyOwner: TComponent;
  lComponent: TComponent;
  lDataView: TdaDataView;
  liIndex: Integer;
begin

  if (FDataModule = nil) then
    raise Exception.Create('TdaDataManager.MergeDataModule: Attempting to merge a data module without a data module assigned.');


  {create a temporary module}
  lDummyOwner := TComponent.Create(nil);
  lMergeDataModule := TdaDataModule.Create(lDummyOwner);

  lMergeDataModule.Template.InitializeSettings(FReport.Template);
  lMergeDataModule.Template.SaveTo := aSource;

  try

    if lMergeDataModule.Template.ShowOpenDialog then
      begin
        {delete old dataview windows}
        FreeAllVisualControls;

        lMergeDataModule.Template.Load;

        {position new dataviews below existing dataviews}
        AdjustDataViewTops(lMergeDataModule);

        {transfer components to new owner}
        for liIndex := 0 to lDummyOwner.ComponentCount - 1 do
          begin
            lComponent := lDummyOwner.Components[0];

            lDummyOwner.RemoveComponent(lComponent);

            FDataModule.Owner.InsertComponent(lComponent);

            if (lComponent is TdaDataView) then
              begin
                lDataView := TdaDataView(lComponent);

                {force a validation of the user name, given the new owner}
                lDataView.UserName := lDataView.UserName;
              end;
          end;

        {merge with existing data module}
        FDataModule.Merge(lMergeDataModule);

        {add new data views}
        IntitializeDataViewWindows;

        FDataModule.Modified := True;
      end;

  finally
    lDummyOwner.Free;
  end;

end;  {procedure, MergeDataModule}

{------------------------------------------------------------------------------}
{ TdaDataManager.AdjustDataViewTops }

procedure TdaDataManager.AdjustDataViewTops(aMergeDataModule: TdaDataModule);
var
  liIndex: Integer;
  liBottom: Integer;
  liMaxBottom: Integer;
  liTop: Integer;
  liMinTop: Integer;
  lDataView: TdaCustomDataView;
begin

  liMaxBottom := 0;

  for liIndex := 0 to FDataModule.DataViewCount - 1 do
    begin
      lDataView := FDataModule.DataViews[liIndex];

      liBottom := lDataView.Top + lDataView.Height;

      if (liBottom > liMaxBottom) then
        liMaxBottom := liBottom;
    end;

  liMinTop := 2000;

  for liIndex := 0 to aMergeDataModule.DataViewCount - 1 do
    begin
      lDataView := aMergeDataModule.DataViews[liIndex];

      liTop := lDataView.Top;

      if (liTop < liMinTop) then
        liMinTop := liTop;
    end;


  for liIndex := 0 to aMergeDataModule.DataViewCount - 1 do
    begin
      lDataView := aMergeDataModule.DataViews[liIndex];

      lDataView.Top := (lDataView.Top - liMinTop) + liMaxBottom + 50;
    end;

end;  {procedure, AdjustDataViewTops}

{------------------------------------------------------------------------------}
{ TdaDataManager.ExportDataModule }

procedure TdaDataManager.ExportDataModule(aTarget: TppSaveToType);
begin

  if (FDataModule = nil) then
    raise Exception.Create('TdaDataManager.ExportDataModule: Attempting to export a dataview without a data module assigned.');

  if (FReport = nil) then
    raise Exception.Create('TdaDataManager.ExportDataModule: Attempting to export a dataview without a report assigned.');


  FDataModule.Template.InitializeSettings(FReport.Template);
  FDataModule.Template.SaveTo := aTarget;

  FDataModule.Template.Description := GetDefaultDescription;

  if FDataModule.Template.ShowSaveDialog then
    begin
      if (aTarget = stFile) then
        FDataModule.Template.Format := ftASCII;

      FDataModule.Template.Save;
    end;

end; {procedure, ExportDataModule}

{------------------------------------------------------------------------------}
{ TdaDataManager.FileMenuClickEvent }

procedure TdaDataManager.FileMenuClickEvent(Sender: TObject);
var
  liIndex: Integer;
begin

  {set visibility of explicit file import and export options}
  FMenuItemImportFromFile.Visible := FReportDesigner.AllowSaveToFile and (FCurrentReport.Template.SaveTo = stDataBase);

  liIndex := FFileMenu.IndexOf(FMenuItemImportFromFile);

  FFileMenu.Items[liIndex - 1].Visible := FMenuItemImportFromFile.Visible;
  FFileMenu.Items[liIndex + 1].Visible := FMenuItemImportFromFile.Visible;


end; {procedure, FileMenuClickEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.FileMenuItemClickEvent }

procedure TdaDataManager.FileMenuItemClickEvent(Sender: TObject);
begin

  case TdaFileMenuCommandType(TMenuItem(Sender).Tag) of
    fmDataSettings: DisplayDataSettingsDialog;
    fmNew: NewDataView;
    fmImport: ImportDataModule(stDatabase);
    fmMerge: MergeDataModule(stDatabase);
    fmExport: ExportDataModule(stDatabase);
    fmExportToFile: ExportDataModule(stFile);
    fmImportFromFile: ImportDataModule(stFile);
    fmClose:  ComponentDesigner.Perform(WM_CLOSE, 0, 0); {note: send a message, do not call close}
  end;

end; {procedure, FileMenuItemClickEvent}

{------------------------------------------------------------------------------}
{ TdaDataManager.DisplayDataSettingsDialog }

procedure TdaDataManager.DisplayDataSettingsDialog;
var
  lDataSettingsDlg: TppCustomDataSettingsDialog;
  lFormClass: TFormClass;
begin

  if (FDataModule = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomDataSettingsDialog);

  lDataSettingsDlg := TppCustomDataSettingsDialog(lFormClass.Create(Application));
  lDataSettingsDlg.DataModule := FDataModule;
  lDataSettingsDlg.LanguageIndex := FCurrentReport.LanguageIndex;
  lDataSettingsDlg.DataSettings := FWizardManager.DataSettings;

  lDataSettingsDlg.ShowModal;

  lDataSettingsDlg.Free;

end; {procedure, DisplayDataSettingsDialog}

{------------------------------------------------------------------------------}
{ TdaDataManager.SetLanguageIndex}

procedure TdaDataManager.SetLanguageIndex(aLanguageIndex: Longint);
var
  liIndex: Integer;
  lMenuItem: TMenuItem;
  lMenuCommandType: TdaFileMenuCommandType;
begin

  inherited SetLanguageIndex(aLanguageIndex);

  Caption := ppLoadStr(742); {Data}

  if FFileMenu <> nil then
    begin
      FFileMenu.Caption := ppLoadStr(cMenuCaptions[0]);

      for liIndex := 0 to FFileMenu.Count-1 do
        begin
          lMenuItem :=  FFileMenu.Items[liIndex];

          if lMenuItem.Tag > 0 then
            begin
              lMenuCommandType := TdaFileMenuCommandType(lMenuItem.Tag);

              lMenuItem.Caption := ppLoadStrWithEllipses(cFileMenuCaptions[lMenuCommandType]);
            end;
        end;
    end;

  {update tool windows}
  for liIndex := 0 to FDataViewWindows.Count - 1 do
    FDataViewWindows[liIndex].LanguageIndex := aLanguageIndex;

  FLinkManager.LanguageIndex := aLanguageIndex;

end; {procedure, SetLanguageIndex}

{------------------------------------------------------------------------------}
{ TdaDataManager.InitializeStatusBar}

procedure TdaDataManager.InitializeStatusBar;
begin

  StatusBar.SimplePanel := True;
  StatusBar.SimpleText  := ppLoadStr(180);

end; {procedure, InitializeStatusBar}

  
{******************************************************************************
 *
 ** D A T A V I E W   W I N D O W   L I S T
 *
{******************************************************************************}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.Create }

constructor TppDataViewWindowList.Create;
begin

  inherited Create;

  FToolWindows := TList.Create;
  FDataViews := TList.Create;

end; {constructor, Create}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.Destroy }

destructor TppDataViewWindowList.Destroy;
begin

  FToolWindows.Free;
  FDataViews.Free;

  inherited Destroy;

end; {destructor, Destroy}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.GetCount }

function TppDataViewWindowList.GetCount: Integer;
begin
  Result := FToolWindows.Count;
end; {function, GetCount}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.GetDataViewWindow }

function TppDataViewWindowList.GetDataViewWindow(aIndex: Integer): TdaDataViewToolWin;
begin
  Result := TdaDataViewToolWin(FToolWindows[aIndex]);
end; {function, GetDataViewWindow}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.GetWindowForDataView }

function TppDataViewWindowList.GetWindowForDataView(aDataView: TdaDataView): TdaDataViewToolWin;
var
  liIndex: Integer;
begin

  liIndex := IndexOfDataView(aDataView);

  if liIndex >= 0 then
    Result := GetDataViewWindow(liIndex)
  else
    Result := nil;

end; {function, GetWindowForDataView}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.Add }

procedure TppDataViewWindowList.Add(aDataViewToolWin: TdaDataViewToolWin);
begin
  FToolWindows.Add(aDataViewToolWin);
  FDataViews.Add(aDataViewToolWin.DataView);

end; {procedure, Add}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.Clear }

procedure TppDataViewWindowList.Clear;
begin

  FToolWindows.Clear;
  FDataViews.Clear;

end; {procedure, Clear}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.Delete }

procedure TppDataViewWindowList.Delete(aIndex: Integer);
begin

  FToolWindows.Delete(aIndex);
  FDataViews.Delete(aIndex);

end; {procedure, Delete}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.IndexOfDataView }

function TppDataViewWindowList.IndexOfDataView(aDataView: TdaDataView): Integer;
begin
  Result := FDataViews.IndexOf(aDataView);

end; {procedure, IndexOfDataView}

{------------------------------------------------------------------------------}
{ TppDataViewWindowList.Remove }

procedure TppDataViewWindowList.Remove(aDataViewToolWin: TdaDataViewToolWin);
var
  liIndex: Integer;
begin

  liIndex := FToolWindows.Remove(aDataViewToolWin);

  FDataViews.Delete(liIndex);

end; {procedure, Remove}




end.
