unit IvMulti;

{$I IVMULTI.INC}

interface

uses
{$IFDEF WIN32}
  Windows,
{$ELSE}
  WinTypes, WinProcs,
{$ENDIF}
{$IFDEF _DEBUG}
  DebugFil,
{$ENDIF}
  SysUtils, Classes, Dialogs, Forms, Controls, Graphics, TypInfo,
  IvDictio, IvCommon;

const
  TARGETS_C = 'Targets.txt';

  TARGETS_VERSION_C = 1;

type
  TIvTargetType = (ivttInclude, ivttExclude);

  TIvTargetProperty = class(TObject)
  protected
    FTargetClassName: String;
    FTargetPropertyName: String;
    FTargetType: TIvTargetType;

  public
    constructor Create(
      const targetClassName, targetPropertyName: String;
      targetType: TIvTargetType);
    constructor CreateDefault;

    procedure Assign(target: TIvTargetProperty);
    function IsEqual(target: TIvTargetProperty): Boolean;
    function Copy: TIvTargetProperty;

    function IsDefault: Boolean;
    procedure SetDefault;

    property TargetClassName: String read FTargetClassName write FTargetClassName;
    property TargetPropertyName: String read FTargetPropertyName write FTargetPropertyName;
    property TargetType: TIvTargetType read FTargetType write FTargetType;
  end;

  TIvTargetProperties = class(TPersistent)
  protected
    FExcludeCount: Integer;
    FItems: TList;

    function GetCount: Integer;
    function GetItems(index: Integer): TIvTargetProperty;

    procedure ReadData(reader: TReader);

    procedure DefineProperties(Filer: TFiler); override;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Assign(source: TPersistent); override;
    function IsEqual(targets: TIvTargetProperties): Boolean;
    function Copy: TIvTargetProperties;

    function IsDefault: Boolean;
    procedure SetDefault;

    function Find(item: TIvTargetProperty): Integer;

    function Add(item: TIvTargetProperty): Integer;
    procedure Delete(index: integer);

    function IsObjectInTargets(const obj: String): Boolean;
    function IsComponentInTargets(const component: TComponent): Boolean;
    function IsPropertyInTargets(const obj, name: String): Boolean;
    function IsPropertyExcluded(const obj, name: String): Boolean;

    class function DoesMatch(target: TIvTargetProperty; const obj, name: String): Boolean;

    property Count: Integer read GetCount;
    property ExcludeCount: Integer read FExcludeCount write FExcludeCount;
    property Items[index: Integer]: TIvTargetProperty read GetItems; default;
  end;

  { TIvTranslator }

  TIvTranslator = class;

  TIvTranslateNotifyEvent = procedure(translator: TIvTranslator; component: TComponent) of object;

  TIvRestriction = (ivrBuildInTranslation, ivrCustomTranslation, ivrFlip,
    ivrReadingOrder, ivrThisComponentOnly, ivrCharset);
  TIvRestrictions = set of TIvRestriction;

  TIvRestrictComponentEvent = procedure(
    translator: TIvTranslator;
    component: TComponent;
    var restrictions: TIvRestrictions) of object;
  TIvRestrictObjectEvent = procedure(
    translator: TIvTranslator;
    obj: TObject;
    var translate: Boolean) of object;
  TIvRestrictPropertyEvent = procedure(
    translator: TIvTranslator;
    obj: TObject;
    const name: String;
    var translate: Boolean) of object;

  TIvTranslatorOption = (ivtoAutoTranslate, ivtoCheckFont, ivtoScaleMultiByte,
    ivtoMirrorBiDirectional, ivtoChangeFontCharset, ivtoUpdateLocaleProperty,
    ivtoAutoOpen, ivtoTranslateSystemMenu, ivtoTranslateOCX, ivtoForceCharsetChange);
  TIvTranslatorOptions = set of TIvTranslatorOption;

  TIvCharsetChange = (ivccDisabled, ivccNormal, ivccAll);

  TIvReadingOrder = (ivroLeftToRight, ivroRightToLeft);

  TIvChangeReadingOrderEvent = procedure(
    translator: TIvTranslator;
    component: TComponent;
    readingOrder: TIvReadingOrder) of object;

  TIvBidirectionalState = class(TObject)
  public
{$IFDEF IVVB}
    DefaultFontName: String;
    DefaultFontSize: longint;
{$ENDIF}
    Control: TControl;
    Flipped: Boolean;
    OriginalLeft: Integer;
    ReadingOrder: TIvReadingOrder;

    constructor Create(const control: TControl);
  end;

  TIvTranslatorTableItem = class(TObject)
  public
    Obj: TObject;
    Component: String;
    PropertyName: String;
    Native: String;
    NativeNoHotkey: String;
    Current: String;

    constructor Create(
      obj: TObject;
      const component, propertyName, native, nativeNoHotkey, current: String);
  end;

  TIvTranslatorTable = class(TObject)
  protected
    FRows: TList;

    function GetCount: Integer;
    function GetItem(row: Integer): TIvTranslatorTableItem;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(item: TIvTranslatorTableItem);
    procedure Clear;

    property Count: Integer read GetCount;
    property Items[row: Integer]: TIvTranslatorTableItem read GetItem;
  end;

  TIvModule = class(TComponent)
  public
    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean; virtual;

    function FlipControl(
      translator: TIvTranslator;
      control: TControl;
      state: TIvBidirectionalState): Boolean; virtual;

    function UnFlipControl(
      translator: TIvTranslator;
      control: TControl;
      state: TIvBidirectionalState): Boolean; virtual;

    function ChangeComponentReadingOrder(
      translator: TIvTranslator;
      component: TComponent): Boolean; virtual;
  end;

  TIvModules = class(TObject)
  private
    FItems: TList;

    function GetCount: Integer;
    function GetItems(index: Integer): TIvModule;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(item: TIvModule);

    function TranslateComponent(
      translator: TIvTranslator;
      component: TComponent): Boolean;

{$IFDEF IVPRO32}
    function FlipControl(
      translator: TIvTranslator;
      control: TControl;
      state: TIvBidirectionalState): Boolean;

    function UnFlipControl(
      translator: TIvTranslator;
      control: TControl;
      state: TIvBidirectionalState): Boolean;

    function ChangeComponentReadingOrder(
      translator: TIvTranslator;
      component: TComponent): Boolean;
{$ENDIF}

    property Count: Integer read GetCount;
    property Items[index: Integer]: TIvModule read GetItems; default;
  end;

  TIvTranslator = class(TIvCustomTranslator)
  protected
    FTranslatedObjects: TList;
    FNativeLayout: TIvReadingOrder;
    FReadingOrder: TIvReadingOrder;
    FHost: TComponent;
    FTranslatorTable: TIvTranslatorTable;
    FTargets: TIvTargetProperties;
    FOptions: TIvTranslatorOptions;
    FCharsetChange: TIvCharsetChange;
    FRestrictions: TIvRestrictions;
    FDefaultFontName: String;
    FDefaultFontSize: Integer;
    FMultiByteScale: Integer;
    FBidirectionalStates: TList;
    FOnTranslate: TIvTranslateNotifyEvent;
    FOnScale: TIvTranslateNotifyEvent;
    FOnRestrictComponent: TIvRestrictComponentEvent;
    FOnRestrictObject: TIvRestrictObjectEvent;
    FOnRestrictProperty: TIvRestrictPropertyEvent;

    function GetAutoOpen: Boolean;
    procedure SetAutoOpen(value: Boolean);

    function GetHost: TComponent; virtual;

    procedure SetTargets(value: TIvTargetProperties);

    procedure Notification(component: TComponent; operation: TOperation); override;

    procedure TranslateHost; override;
    procedure TranslateObject(obj: TObject; restrictions: TIvRestrictions); virtual;
    procedure TranslateSubComponent(
      component: TComponent;
      parentRestrictions: TIvRestrictions); virtual;

    procedure CheckHostFont; virtual;

    function GetBidirectionalState(control: TControl; allocNew: Boolean): TIvBidirectionalState;

    procedure FlipControl(control: TControl; state: TIvBidirectionalState); virtual;
    procedure UnFlipControl(control: TControl; state: TIvBidirectionalState); virtual;

    procedure LanguageChanged(languageChanged, localeChanged: Boolean); override;

    procedure ReadTargets(reader: TReader);
    procedure WriteTargets(writer: TWriter);

    procedure DefineProperties(Filer: TFiler); override;

    procedure Loaded; override;

{$IFDEF WIN32}
    function GetSystemMenuWinHandle: THandle; override;
{$ENDIF}

    procedure TranslateComponent(component: TComponent); virtual;
    procedure ChangeComponentReadingOrder(component: TComponent); virtual;

  public
    constructor Create(owner: TComponent); override;
    destructor Destroy; override;

    procedure Translate; override;
    procedure Unbind; override;
    procedure UnbindAndSetNative; override;

    procedure AddObjectTargets(
      obj: TObject;
      targets: TIvTargetProperties;
      prompt: Boolean);

    function DoTranslateString(
      obj: TObject;
      const propertyName, value: String): String;
    function DoTranslateContextString(
      obj: TObject;
      const component, propertyName, value: String): String;

    procedure DoTranslateStrings(
      obj: TObject;
      const component, propertyName: String; value: TStrings);

    procedure TranslateForm(host: TComponent); virtual;

    procedure Open(host: TComponent); virtual;
    procedure Close; virtual;

    procedure DetectTargets(
      targets: TIvTargetProperties;
      prompt: Boolean);

    function GetNativePropertyValue(
      component: TObject;
      const propertyName: String): String;
    function GetNativePropertyValueEx(
      component: TObject;
      const propertyName, currentValue: String): String;

    procedure UpdateControl(control: TControl); virtual;
    procedure UpdateControls; virtual;

    property Host: TComponent read GetHost;
    property ReadingOrder: TIvReadingOrder read FReadingOrder;
    property TranslatorTable: TIvTranslatorTable read FTranslatorTable;

  published
    property NativeLayout: TIvReadingOrder read FNativeLayout write FNativeLayout default ivroLeftToRight;
    property Targets: TIvTargetProperties read FTargets write SetTargets;
    property CharsetChange: TIvCharsetChange read FCharsetChange write FCharsetChange default ivccNormal;
    property Options: TIvTranslatorOptions read FOptions write FOptions default
      [ivtoAutoTranslate, ivtoCheckFont, ivtoScaleMultiByte, ivtoMirrorBiDirectional,
       ivtoAutoOpen, ivtoTranslateSystemMenu, ivtoTranslateOCX];
    property MultiByteScale: Integer read FMultiByteScale write FMultiByteScale default 100;
    property OnTranslate: TIvTranslateNotifyEvent read FOnTranslate write FOnTranslate;
    property OnScale: TIvTranslateNotifyEvent read FOnScale write FOnScale;
    property OnRestrictComponent: TIvRestrictComponentEvent read FOnRestrictComponent write FOnRestrictComponent;
    property OnRestrictObject: TIvRestrictObjectEvent read FOnRestrictObject write FOnRestrictObject;
    property OnRestrictProperty: TIvRestrictPropertyEvent read FOnRestrictProperty write FOnRestrictProperty;
  end;

procedure IvCenterControl(parent, control: TControl);

var
  Modules: TIvModules;

implementation

uses
{$IFDEF IVVB}
  CompOCX,
{$ENDIF}
{$IFDEF IVWIDE}
  Checklst,
{$ENDIF}
  Messages, StdCtrls, Menus,
  IvParser;

const
  NO_DICTIONARY_C = 'No dictionary has been assigned to the translator component (%s on "%s" form)';
  NO_TARGETS_C = 'No target properties has been assigned to the translator component (%s on "%s" form)';
  INVALID_HOST_C = 'The host component (owner) of the translator must be a TControl (%s on "%s" form)';
  DETECT_ERROR_C = 'The detection of the targets properties failed!'#13#10'Set the Targets property manually.';


{ TIvTargetProperty }

constructor TIvTargetProperty.Create(
  const targetClassName, targetPropertyName: String;
  targetType: TIvTargetType);
begin
  inherited Create;
  FTargetClassName := targetClassName;
  FTargetPropertyName := targetPropertyName;
  FTargetType := targetType;
end;

constructor TIvTargetProperty.CreateDefault;
begin
  Create('', '', ivttInclude);
end;

function TIvTargetProperty.Copy: TIvTargetProperty;
begin
  Result := TIvTargetProperty.Create(FTargetClassName, FTargetPropertyName, FTargetType);
end;

procedure TIvTargetProperty.Assign(target: TIvTargetProperty);
begin
  FTargetClassName := target.FTargetClassName;
  FTargetPropertyName := target.FTargetPropertyName;
  FTargetType := target.FTargetType;
end;

function TIvTargetProperty.IsEqual(target: TIvTargetProperty): Boolean;
begin
  Result :=
    (FTargetClassName = target.FTargetClassName) and
    (FTargetPropertyName = target.FTargetPropertyName) and
    (FTargetType = target.FTargetType);
end;

function TIvTargetProperty.IsDefault: Boolean;
begin
  Result := (FTargetPropertyName = '') and
    (FTargetClassName = '') and
    (FTargetType = ivttInclude);
end;

procedure TIvTargetProperty.SetDefault;
begin
  FTargetClassName := '';
  FTargetPropertyName := '';
  FTargetType := ivttInclude;
end;


{ TIvTargetProperties }

constructor TIvTargetProperties.Create;
begin
  inherited Create;
  FExcludeCount := 0;
  FItems := TList.Create;
end;

destructor TIvTargetProperties.Destroy;
begin
  SetDefault;
  FItems.Free;
  inherited Destroy;
end;

procedure TIvTargetProperties.Assign(source: TPersistent);
var
  i: Integer;
begin
  if source is TIvTargetProperties then
  begin
    SetDefault;
    FExcludeCount := TIvTargetProperties(source).FExcludeCount;
    for i := 0 to TIvTargetProperties(source).Count - 1 do
      Add(TIvTargetProperty(TIvTargetProperties(source).Items[i].Copy));
    Exit;
  end;
  inherited Assign(source);
end;

function TIvTargetProperties.IsEqual(targets: TIvTargetProperties): Boolean;
var
  i, j: Integer;
  found: Boolean;
begin
  if Count = targets.Count then
  begin
    for i := 0 to Count - 1 do
    begin
      found := False;

      for j := 0 to targets.Count - 1 do
      begin
        if Items[i].IsEqual(targets.Items[j]) then
        begin
          found := True;
          Break;
        end;
      end;

      if not found then
      begin
        Result := False;
        Exit;
      end;
    end;
    
    Result := True;
  end
  else
    Result := False;
end;

procedure TIvTargetProperties.ReadData(reader: TReader);
var
  i, count: Integer;
  target: TIvTargetProperty;
begin
  SetDefault;
  reader.ReadListBegin;
  count := reader.ReadInteger;
  for i := 0 to count - 1 do
  begin
    target := TIvTargetProperty.CreateDefault;
    target.TargetClassName := reader.ReadString;
    target.TargetPropertyName := reader.ReadString;
    FItems.Add(target);
  end;
  reader.ReadListEnd;
end;

procedure TIvTargetProperties.DefineProperties(filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('Data', ReadData, nil, filer is TReader);
end;

function TIvTargetProperties.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TIvTargetProperties.GetItems(index: Integer): TIvTargetProperty;
begin
  Result := FItems[index];
end;

function TIvTargetProperties.Find(item: TIvTargetProperty): Integer;
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    if Items[i].IsEqual(item) then
    begin
      Result := i;
      Exit;
    end;
    
  Result := -1;
end;

function TIvTargetProperties.Add(item: TIvTargetProperty): Integer;
begin
  Result := FItems.Add(item);
  if item.TargetType = ivttExclude then
    Inc(FExcludeCount);
end;

procedure TIvTargetProperties.Delete(index: integer);
begin
  if Items[index].TargetType = ivttExclude then
    Dec(FExcludeCount);
  FItems.Delete(index);
end;

function TIvTargetProperties.Copy: TIvTargetProperties;
begin
  Result := TIvTargetProperties.Create;
  Result.Assign(Self);
end;

function TIvTargetProperties.IsDefault: Boolean;
begin
  Result := Count = 0;
end;

procedure TIvTargetProperties.SetDefault;
var
  I: Integer;
begin
  FExcludeCount := 0;
  for i := 0 to Count - 1 do
    Items[i].Free;
  FItems.Clear;
end;

class function TIvTargetProperties.DoesMatch(
  target: TIvTargetProperty;
  const obj, name: String): Boolean;
begin
  { If the target class name is null or matches to the object and the target
    propety name matches to the name the property should be translated.

    Similary the property should be translated if a target is a class target.
    This means a target with no property name. In such a case all string
    properties of the class should be translated. }

  Result :=
    (((target.TargetClassName = '') or
      (CompareText(target.TargetClassName, obj) = 0)) and
    (CompareText(name, target.TargetPropertyName) = 0)) or
    ((CompareText(target.TargetClassName, obj) = 0) and
     (target.TargetPropertyName = ''));
end;

function TIvTargetProperties.IsPropertyExcluded(const obj, name: String): Boolean;
var
  i: Integer;
  target: TIvTargetProperty;
begin
  Result := False;

  if FExcludeCount > 0 then
  begin
    for i := 0 to Count - 1 do
    begin
      target := Items[i];
      if (target.TargetType = ivttExclude) and DoesMatch(target, obj, name) then
      begin
        Result := True;
        Break;
      end;
    end;
  end;
end;

function TIvTargetProperties.IsPropertyInTargets(const obj, name: String): Boolean;
var
  i: Integer;
  target: TIvTargetProperty;
begin
  Result := False;

  { If the targets properties contains exclude targets checks them first }

  if IsPropertyExcluded(obj, name) then
    Exit;

  { Checks if any include target matches the give property }

  for i := 0 to Count - 1 do
  begin
    target := Items[i];
    if (target.TargetType = ivttInclude) and DoesMatch(target, obj, name) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function TIvTargetProperties.IsObjectInTargets(const obj: String): Boolean;
var
  i: Integer;
  target: TIvTargetProperty;

  function DoesMatch: Boolean;
  begin
    Result :=
      (CompareText(target.TargetClassName, obj) = 0) and
      (target.TargetPropertyName = '');
  end;

begin
  Result := False;

  { If the targets properties contains exclude targets checks them first }

  if FExcludeCount > 0 then
  begin
    for i := 0 to Count - 1 do
    begin
      target := Items[i];
      if (target.TargetType = ivttExclude) and DoesMatch then
        Exit;
    end;
  end;

  { Checks if any include target matches the give property }

  for i := 0 to Count - 1 do
  begin
    target := Items[i];
    if (target.TargetType = ivttInclude) and DoesMatch then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function TIvTargetProperties.IsComponentInTargets(const component: TComponent): Boolean;
var
  i: Integer;
  target: TIvTargetProperty;

  function DoesMatch: Boolean;
  begin
    Result :=
      (CompareText(target.TargetClassName, component.ClassName) = 0) and
      (CompareText(target.TargetPropertyName, '') = 0);
  end;

begin
  Result := False;

  { If the targets properties contains exclude targets checks them first }

  if FExcludeCount > 0 then
  begin
    for i := 0 to Count - 1 do
    begin
      target := Items[i];
      if (target.TargetType = ivttExclude) and DoesMatch then
        Exit;
    end;
  end;

  { Checks if any include target matches the give property }

  for i := 0 to Count - 1 do
  begin
    target := Items[i];
    if (target.TargetType = ivttInclude) and DoesMatch then
    begin
      Result := True;
      Exit;
    end;
  end;
end;


{ TIvBidirectionalState }

constructor TIvBidirectionalState.Create(const control: TControl);
begin
  inherited Create;
{$IFDEF IVPRO}
 {$IFDEF IVVB}
  if TObject(control) is TComponentOCX then
  begin
    Self.Control := control;
    OriginalLeft := TComponentOCX(control).Left;
    DefaultFontName := TComponentOCX(control).FontName;
    DefaultFontSize := TComponentOCX(control).FontSize;
    Exit;
  end;
 {$ENDIF}

  Self.Control := control;
  OriginalLeft := control.Left;
{$ENDIF}
end;


{ TIvTranslatorTable }

constructor TIvTranslatorTableItem.Create(
  obj: TObject;
  const component, propertyName, native, nativeNoHotkey, current: String);
begin
  inherited Create;
  Self.obj := obj;
  Self.component := component;
  Self.propertyName := propertyName;
  Self.native := native;
  Self.nativeNoHotkey := nativeNoHotkey;
  Self.current := current;
end;

constructor TIvTranslatorTable.Create;
begin
  inherited Create;
  FRows := TList.Create;
end;

destructor TIvTranslatorTable.Destroy;
begin
  Clear;
  FRows.Free;
  inherited Destroy;
end;

procedure TIvTranslatorTable.Clear;
var
  i: Integer;
begin
  for i := 0 to FRows.Count - 1 do
    TIvTranslatorTableItem(FRows[i]).Free;
  FRows.Clear;
end;

function TIvTranslatorTable.GetCount: Integer;
begin
  Result := FRows.Count;
end;

function TIvTranslatorTable.GetItem(row: Integer): TIvTranslatorTableItem;
begin
  Result := FRows[row];
end;

procedure TIvTranslatorTable.Add(item: TIvTranslatorTableItem);
begin
  FRows.Add(item);
end;


{ TIvModule }

function TIvModule.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
begin
  Result := False;
end;

function TIvModule.FlipControl(
  translator: TIvTranslator;
  control: TControl;
  state: TIvBidirectionalState): Boolean;
begin
  Result := False;
end;

function TIvModule.UnFlipControl(
  translator: TIvTranslator;
  control: TControl;
  state: TIvBidirectionalState): Boolean;
begin
  Result := False;
end;

function TIvModule.ChangeComponentReadingOrder(
  translator: TIvTranslator;
  component: TComponent): Boolean;
begin
  Result := False;
end;


{ TIvModules }

constructor TIvModules.Create;
begin
  inherited Create;
  FItems := TList.Create;
end;

destructor TIvModules.Destroy;
var
  i: Integer;
begin
  for i := 0 to FItems.Count - 1 do
    TObject(FItems[i]).Free;
  FItems.Free;
  inherited Destroy;
end;

function TIvModules.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TIvModules.GetItems(index: Integer): TIvModule;
begin
  Result := FItems[index];
end;

procedure TIvModules.Add(item: TIvModule);
var
  i: Integer;
begin
  { Adds the module the the module list if it is not already there. }

  for i := 0 to Count - 1 do
    if Items[i].ClassType = item.ClassType then
      Exit;

  FItems.Add(item);
end;

function TIvModules.TranslateComponent(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count - 1 do
    if Items[i].TranslateComponent(translator, component) then
    begin
      Result := True;
      Break;
    end;
end;

{$IFDEF IVPRO32}
function TIvModules.FlipControl(
  translator: TIvTranslator;
  control: TControl;
  state: TIvBidirectionalState): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count - 1 do
    if Items[i].FlipControl(translator, control, state) then
    begin
      Result := True;
      Break;
    end;
end;

function TIvModules.UnFlipControl(
  translator: TIvTranslator;
  control: TControl;
  state: TIvBidirectionalState): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count - 1 do
    if Items[i].UnFlipControl(translator, control, state) then
    begin
      Result := True;
      Break;
    end;
end;

function TIvModules.ChangeComponentReadingOrder(
  translator: TIvTranslator;
  component: TComponent): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Count - 1 do
    if Items[i].ChangeComponentReadingOrder(translator, component) then
    begin
      Result := True;
      Exit;
    end;
end;
{$ENDIF}


{ TIvTranslator }

constructor TIvTranslator.Create(owner: TComponent);
var
  detectType: TIvDetectType;
begin
  inherited Create(owner);

  FNativeLayout := ivroLeftToRight;
  FHost := nil;
  FTranslatorTable := TIvTranslatorTable.Create;
  FTargets := TIvTargetProperties.Create;
  FTranslatedObjects := TList.Create;

  FOptions := [ivtoAutoTranslate, ivtoCheckFont, ivtoScaleMultiByte,
    ivtoMirrorBiDirectional, ivtoAutoOpen, ivtoTranslateSystemMenu, ivtoTranslateOCX];

  FCharsetChange := ivccNormal;

  FMultiByteScale := 100;

{$IFDEF IVPRO32}
  FBidirectionalStates := TList.Create;
{$ENDIF}

  if IsDesignTime and not (csReading in owner.ComponentState) and
    not (csLoading in owner.ComponentState) then
  begin
    detectType :=
      TIvDetectType(StrToIntDef(GetMLRegistryValue(DETECT_C, IntToStr(Integer(ivdtEnabled))), Integer(ivdtEnabled)));
    if (detectType = ivdtEnabled) or
      ((detectType = ivdtPrompt) and (MessageDlg(
        'Do you want the translator component to detect the default targets?',
        mtInformation,
        [mbYes, mbNo],
        0) = mrYes)) then
    begin
      DetectTargets(FTargets, False);
    end;
  end;
end;

destructor TIvTranslator.Destroy;
begin
  Unbind;
  FTranslatedObjects.Free;
  FTranslatorTable.Free;
  FTargets.Free;
{$IFDEF IVPRO32}
  while FBidirectionalStates.Count > 0 do
  begin
    TObject(FBidirectionalStates[0]).Free;
    FBidirectionalStates.Delete(0);
  end;
  FBidirectionalStates.Free;
{$ENDIF}
  inherited Destroy;
end;

function TIvTranslator.GetAutoOpen: Boolean;
begin
  Result := ivtoAutoOpen in FOptions;
end;

procedure TIvTranslator.SetAutoOpen(value: Boolean);
begin
  if value then
    FOptions := FOptions + [ivtoAutoOpen]
  else
    FOptions := FOptions - [ivtoAutoOpen];
end;

function TIvTranslator.GetHost: TComponent;
begin
  if FHost <> nil then
    Result := FHost
  else
    Result := Owner;
end;

procedure TIvTranslator.SetTargets(value: TIvTargetProperties);
begin
  FTargets.Assign(value);
end;

function TIvTranslator.DoTranslateString(
  obj: TObject;
  const propertyName, value: String): String;
begin
  Result := DoTranslateContextString(obj, '', propertyName, value);
end;

function TIvTranslator.DoTranslateContextString(
  obj: TObject;
  const component, propertyName, value: String): String;
var
  i: Integer;
  item: TIvTranslatorTableItem;
  valueNoHotkey: String;
{$IFDEF IVVCL5}
  isMenu, hasHotkey: Boolean;
{$ENDIF}

  function Translate(const str, strNoHotkey, component: String): String;
  var
    ok: Boolean;
{$IFNDEF IVVB}
    thisHost: TClass;
{$ENDIF}
  begin
    if FDictionary = nil then
    begin
      Result := str;
      Exit;
    end;

    { Not found. Gets the translation from the dictionary. }

    if FDictionary.ContextType = [] then
    begin
      { Flat dictionary }

      ok := FDictionary.TranslateString(str, Result);
{$IFDEF IVVCL5}
      if not ok and isMenu and hasHotkey then
        ok := FDictionary.TranslateString(strNoHotkey, Result);
{$ENDIF}
      Result := FDictionary.CheckTranslation(str, Result, ok);
    end
    else
    begin
      { Context sensitive dictionary }

{$IFDEF IVVB}
      ok := FDictionary.TranslateContextString(str, Host.Name, component, Result);
{$ELSE}
      thisHost := Host.ClassType;
      repeat
        ok := FDictionary.TranslateContextString(str, thisHost.ClassName, component, Result);
  {$IFDEF IVVCL5}
        if not ok and isMenu and hasHotkey then
          ok := FDictionary.TranslateContextString(strNoHotkey, thisHost.ClassName, component, Result);
  {$ENDIF}
        thisHost := thisHost.ClassParent;
      until ok or (thisHost = TForm) or
  {$IFDEF IVWIDE}
        (thisHost = TCustomForm) or
  {$ENDIF}
        (thisHost = TComponent);
{$ENDIF}

      if ok then
        Result := FDictionary.CheckTranslation(str, Result, ok)
      else
      begin
        { Could not tranlsate the string in a context sensitive way.
          Translates in a flat way. }

        Result := FDictionary.Translate(str);
      end;
    end;
  end;

  function RemoveHotkey(const value: String): String;
{$IFDEF IVVCL5}
  var
    i: Integer;
{$ENDIF}
  begin
{$IFDEF IVVCL5}
    if isMenu then
    begin
      i := Pos('&', value);
      if i > 0 then
      begin
        Result := value;
        Delete(Result, i, 1);
      end
      else
        Result := value;
      hasHotkey := i > 0;
    end
    else
{$ENDIF}
      Result := value;
  end;

  function CheckString(const str: String): String;
  begin
{$IFDEF IVVCL5}
    if isMenu then
      Result := RemoveHotkey(str)
    else
{$ENDIF}
      Result := str;
  end;

begin
  Result := value;
  if value = '' then
    Exit;

{$IFDEF IVVCL5}
  isMenu := obj is TMenuItem;
{$ENDIF}
  valueNoHotkey := CheckString(value);

  { Scans the translator table to find the string.
    If finds the string, gets the native string and translates it. }

  for i := 0 to FTranslatorTable.Count - 1 do
  begin
    item := FTranslatorTable.Items[i];
    if (item.Obj = obj) and
      (item.PropertyName = propertyName) and
      (item.Current = valueNoHotkey) then
    begin
      Result := Translate(item.Native, item.NativeNoHotkey, item.Component);
      item.Current := CheckString(Result);
      Exit;
    end;
  end;

  { Not found. Translates the string and adds it to the table }

  Result := Translate(value, valueNoHotkey, component);
  FTranslatorTable.Add(TIvTranslatorTableItem.Create(
    obj,
    component,
    propertyName,
    value,
    valueNoHotkey,
    CheckString(Result)));
end;

procedure TIvTranslator.DoTranslateStrings(
  obj: TObject;
  const component, propertyName: String; value: TStrings);

  procedure TranslateStrings(value: TStrings);
  var
    i: Integer;
  begin
    value.BeginUpdate;
    try
      for i := 0 to value.Count - 1 do
        value[i] := DoTranslateContextString(obj, component, propertyName, value[i]);
    finally
      value.EndUpdate;
    end;
  end;

  procedure TranslateStringList(value: TStringList);
  var
    i: Integer;
    oldSorted: Boolean;
  begin
    value.BeginUpdate;
    try
      oldSorted := value.Sorted;
      value.Sorted := False;
      for i := 0 to value.Count - 1 do
        value[i] := DoTranslateContextString(obj, component, propertyName, value[i]);
      value.Sorted := oldSorted;
    finally
      value.EndUpdate;
    end;
  end;

begin
  if value.Count = 0 then
    Exit;

  if value is TStringList then
    TranslateStringList(TStringList(value))
  else
    TranslateStrings(value);
end;

procedure TIvTranslator.TranslateObject(obj: TObject; restrictions: TIvRestrictions);
var
  found, canTranslate, doTranslate: Boolean;
  i, j, k, oldIndex, locale: Integer;
  componentName, str: String;
  item: PPropInfo;
  list: TIvPropInfoList;
  strings: TStrings;
  objectProperty: TObject;
  component, ownerComponent: TComponent;
  filter: TTypeKinds;
  oldSelected: TList;
{$IFDEF WIN32}
  collection: TCollection;
{$ENDIF}
begin
  if (obj is TIvDictionary) or (obj is TIvTranslator) or (obj is TFont) then
    Exit;

  { Checks of the object has already been translated. Prevents recursion if
    there are cross references. }

  for i := 0 to FTranslatedObjects.Count - 1 do
    if FTranslatedObjects[i] = obj then
      Exit;
  FTranslatedObjects.Add(obj);

  { Checks the restriction }

  canTranslate := True;
  if Assigned(FOnRestrictObject) then
    FOnRestrictObject(self, obj, canTranslate);
  if not canTranslate then
    Exit;

  { Gets the properties of the object }

  filter := [tkClass, tkString
{$IFDEF WIN32}
  , tkLString
{$ENDIF}
  ];

  if (ivtoUpdateLocaleProperty in Options)
{$IFDEF IVPRO32}
    or ((ivtsMirrored in State) and ((FDictionary = nil) or not IvIsLocaleBidirectional(Dictionary.LanguageLocale))) or
    (not (ivtsMirrored in State) and (FDictionary <> nil) and IvIsLocaleBidirectional(Dictionary.LanguageLocale))
{$ENDIF}
  then
  begin
    filter := filter + [tkInteger];
  end;

  list := TIvPropInfoList.Create(obj, filter);
  try
    componentName := '';
    if obj is TComponent then
    begin
      component := TComponent(obj);
      if component <> FHost then
        componentName := component.name;
    end
    else
      component := nil;

    for i := 0 to list.Count - 1 do
    begin
      { Checks if the property is read only.
        In that case it is not translated }

      item := list.Items[i];
      if (item^.SetProc = nil) or (item^.GetProc = nil) then
        Continue;

      { Checks if the translation of the property is restricted.
        In that case it is not translated }

      canTranslate := True;
      if Assigned(FOnRestrictProperty) then
        FOnRestrictProperty(self, obj, item^.Name, canTranslate);
      if not canTranslate then
        Continue;

      case item^.PropType^.Kind of
{$IFDEF WIN32}
        tkLString,
{$ENDIF}
        tkString:
        begin
          { A string property.
            The Name property of a component is not translated. }

          if ((component = nil) or (CompareText(item^.Name, 'name') <> 0)) and
            FTargets.IsPropertyInTargets(obj.ClassName, item^.Name) then
          begin
            str := GetStrProp(obj, item);
            if str <> '' then
              SetStrProp(
                obj,
                item,
                DoTranslateContextString(obj, componentName, item^.Name, str));
          end;
        end;

        tkInteger:
        begin
          { If the object is a locale aware object, updates the Locale property }

          if (component <> nil) and
            {(ivtoUpdateLocaleProperty in Options) and}
            (CompareText(item^.Name, 'locale') = 0) and
            not (ivrFlip in restrictions) then
          begin
            if FDictionary = nil then
              locale := 0
            else
              locale := FDictionary.LanguageLocale;
            SetOrdProp(obj, item, locale);
          end;
        end;

        tkClass:
        begin
          { The property is an embedded class }

          objectProperty := TObject(GetOrdProp(obj, item));

          if objectProperty is TStrings then
          begin
            { The property is a string list }

            if FTargets.IsPropertyInTargets(obj.ClassName, item^.Name) then
            begin
              strings := TStrings(objectProperty);

              { Save the selected index if the object is either a list or combo box }

              doTranslate := True;
              oldIndex := 0;
              oldSelected := nil;
              if obj is TCustomListBox then
              begin
                oldIndex := TCustomListBox(obj).ItemIndex;

                if (obj is TListBox) and TListBox(obj).MultiSelect then
                begin
                  oldSelected := TList.Create;
                  for k := 0 to TListBox(obj).Items.Count - 1 do
                    oldSelected.Add(Pointer(TListBox(obj).Selected[k]));
                end;
{$IFDEF IVWIDE}
                if obj is TCheckListBox then
                begin
                  oldSelected := TList.Create;
                  for k := 0 to TCheckListBox(obj).Items.Count - 1 do
                    oldSelected.Add(Pointer(TCheckListBox(obj).Checked[k]));
                end;
{$ENDIF}
              end
              else if obj is TCustomComboBox then
                with TCustomComboBox(obj) do
                begin
                  doTranslate := Visible;
                  if Visible then
                    oldIndex := ItemIndex
                  else
                    oldIndex := -1
                end;

              if doTranslate and (obj.ClassName <> 'TOutline') then
              begin
                DoTranslateStrings(obj, componentName, item^.Name, strings);
              end;

              { Restores the saved item index of the list or combo box }

              if obj is TCustomListBox then
              begin
{$IFDEF IVWIDE}
                if obj is TCheckListBox then
                  for k := 0 to TCheckListBox(obj).Items.Count - 1 do
                    TCheckListBox(obj).Checked[k] := Boolean(oldSelected[k]);
{$ENDIF}
                if (obj is TListBox) and TListBox(obj).MultiSelect then
                  for k := 0 to TListBox(obj).Items.Count - 1 do
                    TListBox(obj).Selected[k] := Boolean(oldSelected[k]);

                if oldIndex <> -1 then
                  TCustomListBox(obj).ItemIndex := oldIndex
              end
              else if obj is TCustomComboBox then
              begin
                if oldIndex <> -1 then
                  TCustomComboBox(obj).ItemIndex := oldIndex;
              end;

              oldSelected.Free;
            end;
          end
{$IFDEF WIN32}
          else if objectProperty is TCollection then
          begin
            { The property is a collection }

            collection := TCollection(objectProperty);
            for j := 0 to collection.Count - 1 do
              TranslateObject(collection.Items[j], restrictions);
          end
{$ENDIF}
{$IFDEF IVWIDE}
          else if objectProperty is TFont then
          begin
            { Changes the charset of the font object
              Do not change TColumnTitle.Font. This is because a bug in VCL that
              causes the application exception if the charset of TColumnTitle
              is changed. }

            if (FDictionary <> nil) and
              (FCharsetChange <> ivccDisabled) and
              not (ivrCharset in restrictions) and
              (obj.ClassName <> 'TColumnTitle') then
            begin
              { Changing of the font character set requires an allocated
                windows handle. }

              if (FCharsetChange = ivccNormal) and (obj is TWinControl) and not TWinControl(obj).HandleAllocated then
              begin
                doTranslate := (TWinControl(obj).Parent <> nil) and (TWinControl(obj).Parent.HandleAllocated);
                if doTranslate then
                try
                  TWinControl(obj).HandleNeeded;
                except
                  doTranslate := False;
                end;
              end
              else
                doTranslate := True;

              if doTranslate and (TFont(objectProperty).Charset <> Dictionary.LanguageData.Charset) then
                TFont(objectProperty).Charset := Dictionary.LanguageData.Charset;
            end;
          end
{$ENDIF}
          else if objectProperty is TComponent then
          begin
            if component <> nil then
            begin
              { The property is another component.
                Scans the components of the owner component. If finds the same
                component does not translate the component. }

              found := False;
              ownerComponent := component.Owner;
              if ownerComponent <> nil then
              begin
                for j := 0 to ownerComponent.ComponentCount - 1 do
                begin
                  if objectProperty = ownerComponent.Components[j] then
                  begin
                    found := True;
                    Break;
                  end;
                end;
              end;

              if not found then
                TranslateObject(objectProperty, restrictions);
            end;
          end
          else if objectProperty <> nil then
            TranslateObject(objectProperty, restrictions);
        end;
      end;
    end;
  finally
    list.Free;
  end;
end;

procedure TIvTranslator.Translate;
begin
  if ivtsBound in FState then
    TranslateHost
  else
  begin
    if FDictionary = nil then
    begin
      { If there is not dictionaris in the application, raises an exception.
        If the dictionary name was given, finds a dictionary that matches the
        name.
        If no name was given or the name was not found uses the first
        dictionary. }

      if Dictionaries.Count = 0 then
      begin
        { We don't want to throw an exception at design time }

        if IsDesignTime then
          Exit;
        raise EIvMulti.Create(Format(NO_DICTIONARY_C, [Name, Host.Name]));
      end;

      if FDictionaryName <> '' then
        FDictionary := Dictionaries.FindDictionary(FDictionaryName);

      if FDictionary = nil then
        FDictionary := Dictionaries[0];
    end;

    if FDictionary.IsDesignTime or (not FDictionary.CanBeOpened) or (FTargets.Count = 0) then
      Exit;

    if not FDictionary.IsOpen then
      FDictionary.Open;

{$IFDEF IVVB}
    if Host is TComponentOCX then
    begin
      FDefaultFontName := TComponentOCX(Host).FontName;
      FDefaultFontSize := TComponentOCX(Host).FontSize;
    end
    else
{$ENDIF}
    begin
{$IFDEF IVWIDE}
      if Host is TCustomForm then
      begin
        FDefaultFontName := TCustomForm(Host).Font.Name;
        FDefaultFontSize := TCustomForm(Host).Font.Size;
      end
{$ELSE}
      if Host is TForm then
      begin
        FDefaultFontName := TForm(Host).Font.Name;
        FDefaultFontSize := TForm(Host).Font.Size;
      end
{$ENDIF}
      else
      begin
        FDefaultFontName := '';
        FDefaultFontSize := 0;
      end;
    end;

    if FHost = nil then
      FHost := Owner;
    TranslateHost;
    LanguageChanged(True, True);
    FDictionary.AddTranslator(Self);
  end;

  inherited Translate;
end;

procedure TIvTranslator.Unbind;
begin
  inherited Unbind;
  FTranslatorTable.Clear;
  FHost := nil;
end;

procedure TIvTranslator.UnbindAndSetNative;
begin
  if ivtsBound in FState then
  begin
    inherited Unbind;
    TranslateHost;
  end;
  inherited UnbindAndSetNative;
end;

procedure TIvTranslator.Open(host: TComponent);
begin
  TranslateForm(host);
end;

procedure TIvTranslator.TranslateForm(host: TComponent);
begin
  FHost := host;
  Translate;
end;

procedure TIvTranslator.Close;
var
  oldLocale: Integer;
  oldOptions: TIvDictionaryOptions;
begin
  if FDictionary <> nil then
  begin
    oldOptions := FDictionary.Options;
    oldLocale := FDictionary.Locale;
    FDictionary.Options := FDictionary.Options - [ivdoAutoTranslate];
    FDictionary.Language := 0;
    Translate;
    FDictionary.Locale := oldLocale;
    FDictionary.Options := oldOptions;
  end;
  Unbind;
end;

function TIvTranslator.GetNativePropertyValue(
  component: TObject;
  const propertyName: String): String;
var
  i: Integer;
begin
  for i := 0 to FTranslatorTable.Count - 1 do
  begin
    if (FTranslatorTable.Items[i].Obj = component) and
      (CompareText(FTranslatorTable.Items[i].PropertyName, propertyName) = 0) then
    begin
      Result := FTranslatorTable.Items[i].Native;
      Exit;
    end;
  end;

  raise Exception.Create('Property has not been translated');
end;

function TIvTranslator.GetNativePropertyValueEx(
  component: TObject;
  const propertyName, currentValue: String): String;
var
  i: Integer;
begin
  for i := 0 to FTranslatorTable.Count - 1 do
  begin
    if (FTranslatorTable.Items[i].Obj = component) and
      (CompareText(FTranslatorTable.Items[i].PropertyName, propertyName) = 0) and
      (CompareText(FTranslatorTable.Items[i].Current, currentValue) = 0) then
    begin
      Result := FTranslatorTable.Items[i].Native;
      Exit;
    end;
  end;

  raise Exception.Create('Property has not been translated');
end;

procedure TIvTranslator.LanguageChanged(languageChanged, localeChanged: Boolean);
begin
  if (ivtsBound in FState) and (ivtoAutoTranslate in FOptions) then
    Translate;

  if languageChanged and Assigned(FOnLanguageChange) then
    FOnLanguageChange(Self);

  if localeChanged and Assigned(FOnLocaleChange) then
    FOnLocaleChange(Self);
end;

procedure TIvTranslator.CheckHostFont;
{$IFDEF IVANSI}
const
  MICROSOFT_SANS_SERIF_FONT_C = 'Microsoft Sans Serif';
  MS_SANS_SERIF_FONT_C = 'MS Sans Serif';
  MS_SYSTEM_FONT_C = 'System';
  ARIAL_FONT_C = 'Arial';
{$ENDIF}
var
  fontSize: Integer;
  fontName: String;
{$IFDEF IVANSI}
  names: TStringList;
{$ENDIF}

{$IFDEF IVANSI}
  function DoesListContainFontname(const value: String): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 0 to names.Count - 1 do
      if CompareText(names[i], value) = 0 then
      begin
        Result := True;
        Exit;
      end;
  end;
{$ENDIF}

begin
  { Checks first the custom font name of the current language. If it is
    not given the original font name of the host is used. }

  fontName := FDictionary.LanguageData.FontName;
  if fontName = '' then
    fontName := FDefaultFontName;

  fontSize := FDictionary.LanguageData.FontSize;
  if fontSize = 0 then
    fontSize := FDefaultFontSize;

{$IFDEF IVANSI}
  { Delphi 2.0 and C++Builder 1.0 do not have support for font character sets.
    That's why the font to be used must support the current character set-
    If it do not match the following fonts are tried:
    'Microsoft Sanf Serif' -> 'MS Sanf Serif' -> 'System' -> 'Arial' in this order.
    If none of above matches the first font that support the character set is
    used. }

  names := TStringList.Create;
  try
    IvGetFontNames(
      [IvCodeToCharset(IvLangIdToCharset(FDictionary.Locale))],
      names);

    if DoesListContainFontname(fontName) then
      fontName := fontName
    else if DoesListContainFontname(FDefaultFontName) then
      fontName := FDefaultFontName
    else if DoesListContainFontname(MICROSOFT_SANS_SERIF_FONT_C) then
      fontName := MICROSOFT_SANS_SERIF_FONT_C
    else if DoesListContainFontname(MS_SANS_SERIF_FONT_C) then
      fontName := MS_SANS_SERIF_FONT_C
    else if DoesListContainFontname(MS_SYSTEM_FONT_C) then
      fontName := MS_SYSTEM_FONT_C
    else if DoesListContainFontname(ARIAL_FONT_C) then
      fontName := ARIAL_FONT_C
    else if names.Count > 0 then
      fontName := names[0];
  finally
    names.Free;
  end;
{$ENDIF}

  { Sets the new font name, size and charset for the host form }

{$IFDEF IVWIDE}
  if (Host is TCustomForm) then
  begin
    with TCustomForm(Host) do
    begin
      if HandleAllocated then
      begin
        if fontName <> Font.Name then
          Font.Name := fontName;

        if fontSize <> Font.Size then
          Font.Size := fontSize;

        {if (FDictionary.LanguageData.Charset <> Font.Charset) and (FDictionary.LanguageData.Charset <> ANSI_CHARSET) then}
        if FDictionary.LanguageData.Charset <> Font.Charset then
          Font.Charset := FDictionary.LanguageData.Charset;
      end;
    end;
  end;
{$ELSE}
  if (Host is TForm) then
  begin
    with TForm(Host) do
    begin
      if HandleAllocated then
      begin
        if fontName <> Font.Name then
          Font.Name := fontName;

        if fontSize <> Font.Size then
          Font.Size := fontSize;
      end;
    end;
  end;
{$ENDIF}
end;

procedure TIvTranslator.TranslateHost;
var
  mdi: Boolean;
{$IFDEF IVPRO32}
  oldState: TIvTranslatorState;
{$ENDIF}
{$IFDEF IVVB}
  vbFormHost: boolean;
{$ENDIF}
{$IFDEF IVVCL5}
  i: Integer;
  menu: TMenu;
  menus: TList;
  subComponent: TComponent;
  menuItem: TMenuItem;
{$ENDIF}

{$IFDEF IVVCL5}
  procedure RethinkHotkeys(menuItem: TMenuItem);
  var
    i: Integer;
  begin
    for i := 0 to menuItem.Count - 1 do
      RethinkHotkeys(menuItem.Items[i]);
    menuItem.RethinkHotkeys;
  end;
{$ENDIF}

begin
  inherited TranslateHost;

  FTranslatedObjects.Clear;

  if Host is TForm then
    mdi := TForm(Host).FormStyle = fsMDIChild
  else
    mdi := False;

  { If the dictionary uses multiple translation, prescans the from to get the
    translations. }

  if FDictionary <> nil then
  begin
{$IFDEF IVPRO32}
    if Dictionary.LanguageData.CharsetType = ivcsBiDirectional then
      FReadingOrder := ivroRightToLeft
    else
      FReadingOrder := ivroLeftToRight;
{$ENDIF}
  end;

  if Assigned(FOnBeforeTranslate) then
    FOnBeforeTranslate(Self);

{$IFDEF IVVB}
  vbFormHost := ((Host is TComponentOCX) and (TComponentOCX(Host).IsFormObject));
{$ENDIF}

  { Check the host font }

  if (FDictionary <> nil) and (ivtoCheckFont in FOptions) and (
{$IFDEF IVVB}
    (vbFormHost = TRUE) or
{$ENDIF}
{$IFDEF IVVB}
    ((Host is TComponentOCX) and (TComponentOCX(Host).IsFormObject)) or
{$ENDIF}
{$IFDEF IVWIDE}
    (Host is TCustomForm)) then
{$ELSE}
    (Host is TForm)) then
{$ENDIF}
  begin
    CheckHostFont;
  end;

{$IFDEF IVVCL5}
  menus := TList.Create;
  try
    // Disables the automatic hotkey mapping

    for i := 0 to Host.ComponentCount - 1 do
    begin
      subComponent := Host.Components[i];
      if subComponent is TMenu then
      begin
        menu := TMenu(subComponent);
        if menu.AutoHotkeys = maAutomatic then
        begin
          menu.AutoHotkeys := maManual;
          menus.Add(menu);
        end;
      end;
    end;
{$ENDIF}

    { Translates the host component }

    TranslateSubComponent(Host, []);

{$IFDEF IVVCL5}
    // Enables the automatic hotkey mapping again:
    // - Sets the auto hotkeys on
    // - Adds and removes a new item to the menu.
    //   This makes it to rethink the hotkeys

    for i := 0 to menus.Count - 1 do
    begin
      menu := menus[i];
      menu.AutoHotkeys := maAutomatic;
      menuItem := TMenuItem.Create(nil);
      try
        menu.Items.Add(menuItem);
        menu.Items.Remove(menuItem);
      finally
        menuItem.Free;
      end;
    end;
  finally
    menus.Free;
  end;
{$ENDIF}

{$IFDEF WIN32}
  if ivtoTranslateSystemMenu in FOptions then
    TranslateSystemMenu(GetSystemMenuWinHandle, mdi);
{$ENDIF}

{$IFDEF IVPRO}
  { Scales the host component if needed }

  if (FDictionary <> nil) and (ivtoScaleMultiByte in FOptions) and (FMultiByteScale <> 100) and (
{$IFDEF IVVB}
    (vbFormHost = TRUE) or
{$ENDIF}
    (Host is TWinControl)) then
  begin
    if FDictionary.LanguageData.CharsetType = ivcsMultiByte then
    begin
      if not (ivtsScaled in FState) then
      begin
        if (Host is TForm) and TForm(Host).AutoScroll then
          raise EIvMulti.Create('Cannot scale a form (' + TForm(Host).Name + ') that has AutoScroll property set True');

{$IFDEF IVVB}
        if vbFormHost then
          TComponentOCX(Host).ScaleBy(FMultiByteScale, 100)
        else
{$ENDIF}
          TWinControl(Host).ScaleBy(FMultiByteScale, 100);

        FState := FState + [ivtsScaled];
        if Assigned(FOnScale) then
          FOnScale(Self, Host);
      end;
    end
    else
    begin
      if(ivtsScaled in FState) then
      begin
{$IFDEF IVVB}
        if vbFormHost then
          TComponentOCX(Host).ScaleBy(100, FMultiByteScale)
        else
{$ENDIF}
          TWinControl(Host).ScaleBy(100, FMultiByteScale);

        FState := FState - [ivtsScaled];
        if Assigned(FOnScale) then
          FOnScale(Self, Host);
      end;
    end;
  end;
{$ENDIF}

{$IFDEF IVPRO32}
  { Sets the reading order of the host component if needed }

  if (ivtoMirrorBiDirectional in FOptions) then
  begin
    oldState := FState;

    if FReadingOrder <> FNativeLayout then
      FState := FState + [ivtsMirrored]
    else
      FState := FState - [ivtsMirrored];

    { If the bidirectional state has been changed redraws the menu }

    if (Host is TWinControl) and (oldState <> FState) then
    begin
      SetWindowPos(
        TWinControl(Host).Handle,
        0,
        0,
        0,
        0,
        0,
        SWP_NOMOVE or SWP_NOSIZE or SWP_DRAWFRAME);
    end;
  end;
{$ENDIF}

  if Assigned(FOnAfterTranslate) then
    FOnAfterTranslate(Self);
end;

function TIvTranslator.GetBidirectionalState(control: TControl; allocNew: Boolean): TIvBidirectionalState;
{$IFDEF IVPRO32}
var
  i: Integer;
 {$IFDEF IVVB}
  componentOCX: TComponentOCX;
 {$ENDIF}
{$ENDIF}
begin
{$IFDEF IVPRO32}
  {$IFDEF IVVB}
  componentOCX := nil;
  if TObject(control) is TComponentOCX then
    componentOCX := TComponentOCX(control);
  {$ENDIF}

  for i := 0 to FBidirectionalStates.Count - 1 do
  begin
    Result := FBidirectionalStates[i];

  {$IFDEF IVVB}
    if (componentOCX <> nil) then begin
      if (Result.Control = TControl(componentOCX.VBDispatch)) then
        Exit
    end
    else
  {$ENDIF}
      if Result.Control = control then
        Exit;
  end;

  if allocNew then
  begin
    Result := TIvBidirectionalState.Create(control);
{$IFDEF IVVB}
    { OCX: Dispatch is permanent object in VB instead of TComponentOCX }
    if componentOCX <> nil then
      Result.Control := TControl(componentOCX.VBDispatch);
{$ENDIF}
    FBidirectionalStates.Add(Result);
  end
  else
    Result := nil;
{$ELSE}
  Result := nil;
{$ENDIF}
end;

procedure TIvTranslator.UpdateControl(control: TControl);
{$IFDEF IVPRO32}
var
  i: Integer;
  state: TIvBidirectionalState;
{$ENDIF}
begin
{$IFDEF IVPRO32}
  if not (ivtsMirrored in FState) or (control.Parent = nil) or (control = Host) then
    Exit;

  for i := 0 to FBidirectionalStates.Count - 1 do
  begin
    state := TIvBidirectionalState(FBidirectionalStates[i]);
    if (state.Control = control) and state.Flipped  then
    begin
      control.Left := control.Parent.ClientWidth - control.Width - state.OriginalLeft;
      Exit;
    end;
  end;
{$ENDIF}
end;

procedure TIvTranslator.UpdateControls;
{$IFDEF IVPRO32}
var
  i, left: Integer;
{$ENDIF}
begin
{$IFDEF IVPRO32}
  if not (ivtsMirrored in FState) then
    Exit;

  for i := 0 to FBidirectionalStates.Count - 1 do
    with TIvBidirectionalState(FBidirectionalStates[i]) do
    begin
      if (Control = Host) or (Control.Parent = nil) then
        Continue;
        
      left := Control.Parent.ClientWidth - Control.Width - OriginalLeft;
      if Flipped and (left <> Control.Left) then
        Control.Left := left;
    end;
{$ENDIF}
end;

procedure TIvTranslator.FlipControl(control: TControl; state: TIvBidirectionalState);
begin
{$IFDEF IVPRO32}
  if Modules.FlipControl(Self, control, state) then
    Exit;

  if not state.Flipped then
  begin
    state.Flipped := True;
    state.ReadingOrder := ivroRightToLeft;
    control.Left := control.Parent.ClientWidth - control.Width - control.Left;
  end;
{$ENDIF}
end;

procedure TIvTranslator.UnFlipControl(control: TControl; state: TIvBidirectionalState);
begin
{$IFDEF IVPRO32}
  if Modules.UnFlipControl(Self, control, state) then
    Exit;

  if state.Flipped then
  begin
    state.Flipped := False;
    state.ReadingOrder := ivroLeftToRight;
    control.Left := state.OriginalLeft;
  end;
{$ENDIF}
end;

procedure TIvTranslator.TranslateComponent(component: TComponent);
var
  str: String;
begin
  Modules.TranslateComponent(Self, component);

  if (component is TCustomMemo) then
  begin
    if FTargets.IsPropertyInTargets(component.ClassName, 'Text') then
      with TCustomMemo(component) do
      begin
        str := Text;
        while (str <> '') and ((str[Length(str)] = #10) or (str[Length(str)] = #13)) do
          Delete(str, Length(str), 1);

        Text := DoTranslateContextString(
          component,
          component.Name,
          'Text',
          str);
      end;
  end;
end;

procedure TIvTranslator.TranslateSubComponent(
  component: TComponent;
  parentRestrictions: TIvRestrictions);
var
  i: Integer;
  restrictions, childRestrictions: TIvRestrictions;
  subComponent: TComponent;
{$IFDEF IVPRO32}
  changeReadingOrder: Boolean;
  bidirectionalState: TIvBidirectionalState;
{$ENDIF}
begin
{$IFDEF WIN32}
  { If the translation of the OCX component is disabled and the component is an
    OCX nothing is done. }

  if not (ivtoTranslateOCX in FOptions) and (csCheckPropAvail in component.ComponentStyle) then
    Exit;
{$ENDIF}

  { Gets the restriction for the component }

  restrictions := parentRestrictions;
  if Assigned(FOnRestrictComponent) then
    FOnRestrictComponent(Self, component, restrictions);

  { Translates the sub components }

  if ivrThisComponentOnly in restrictions then
    childRestrictions := []
  else
    childRestrictions := restrictions;

  for i := 0 to component.ComponentCount - 1 do
  begin
    subComponent := component.Components[i];
{$IFDEF IVWIDE}
    if not (subComponent is TCustomForm) then
{$ELSE}
    if not (subComponent is TForm) then
{$ENDIF}
      TranslateSubComponent(subComponent, childRestrictions);
  end;

  { Performs build in translation }

  if not (ivrBuildInTranslation in restrictions) then
    TranslateObject(component, restrictions);

  { Performs custom translation }

  if not (ivrCustomTranslation in restrictions) then
    TranslateComponent(component);

{$IFDEF IVPRO32}
  if ivtoMirrorBidirectional in FOptions then
  begin
    { Changes the component reading order and flips/unflips it }

    changeReadingOrder := True;
    if (component is TControl)
  {$IFDEF IVVB}
      or (component is TComponentOCX)
  {$ENDIF}
    then
    begin
      bidirectionalState := GetBidirectionalState(TControl(component), True);
      changeReadingOrder := bidirectionalState.ReadingOrder <> FReadingOrder;

      { Flips/unflips the control }

      if not (ivrFlip in restrictions) then
      begin
        if component = Host then
          bidirectionalState.ReadingOrder := FReadingOrder
        else
        begin
          if FReadingOrder <> FNativeLayout then
            FlipControl(TControl(component), bidirectionalState)
          else
            UnFlipControl(TControl(component), bidirectionalState);
        end;
      end;
   end;

   { Sets the component reading order }

    if not (ivrReadingOrder in restrictions) and changeReadingOrder then
      ChangeComponentReadingOrder(component);
  end;
{$ENDIF}

  if Assigned(FOnTranslate) then
    FOnTranslate(Self, component);

  if component is TControl then
    TControl(component).Invalidate;
end;

procedure TIvTranslator.ChangeComponentReadingOrder(component: TComponent);
{$IFDEF IVPRO32}
  {$IFNDEF IVBIDI}
var
  style, newStyle: Integer;
  info: TMenuItemInfo;
  buffer: array[0..255] of Char;
  {$ENDIF}
{$ENDIF}
begin
{$IFDEF IVPRO32}
  if Modules.ChangeComponentReadingOrder(Self, component) then
    Exit;

  {$IFNDEF IVBIDI}
  { ML can right align some standard VCL's components }

  if component is TLabel then
    with TLabel(component) do
    begin
      if Alignment = taLeftJustify then
        Alignment := taRightJustify
      else if Alignment = taRightJustify then
        Alignment := taLeftJustify;
    end
  else if component is TRadioButton then
    with TRadioButton(component) do
    begin
      if Alignment = taLeftJustify then
        Alignment := taRightJustify
      else if Alignment = taRightJustify then
        Alignment := taLeftJustify;
    end
  else if component is TCheckBox then
    with TCheckBox(component) do
    begin
      if Alignment = taLeftJustify then
        Alignment := taRightJustify
      else if Alignment = taRightJustify then
        Alignment := taLeftJustify;
    end
  else if component is TMemo then
    with TMemo(component) do
    begin
      if Alignment = taLeftJustify then
        Alignment := taRightJustify
      else if Alignment = taRightJustify then
        Alignment := taLeftJustify;
    end
  else if component is TMenu then
  begin
    info.cbSize := SizeOf(info);
    info.fMask := MIIM_TYPE;
    info.dwTypeData := buffer;
    info.cch := Sizeof(buffer);
    GetMenuItemInfo(TMenu(component).Handle, 0, True, info);
    if ReadingOrder = ivroRightToLeft then
      style := info.fType or MFT_RIGHTORDER or MFT_RIGHTJUSTIFY
    else
      style := info.fType and not (MFT_RIGHTORDER or MFT_RIGHTJUSTIFY);
    if style <> Integer(info.fType) then
    begin
      info.fType := style;
      SetMenuItemInfo(TMenu(component).Handle, 0, True, info);
    end;
  end;

  { Changes the Window style of a window component }

  if component is TWinControl then
  begin
    { Extended style }

    style := GetWindowLong(TWinControl(component).Handle, GWL_EXSTYLE);
    if readingOrder = ivroRightToLeft then
      newStyle := style or WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING
    else
      newStyle := style and not (WS_EX_RIGHT or WS_EX_LEFTSCROLLBAR or WS_EX_RTLREADING);
    if newStyle <> style then
      SetWindowLong(TWinControl(component).Handle, GWL_EXSTYLE, newStyle);

    { Normal style }

    style := GetWindowLong(TWinControl(component).Handle, GWL_STYLE);
    newStyle := style;
    if (component is TCustomCheckBox) or (component is TRadioButton) then
    begin
      if readingOrder = ivroRightToLeft then
        newStyle := newStyle or BS_RIGHT or BS_RIGHTBUTTON
      else
        newStyle := newStyle and not (BS_RIGHT or BS_RIGHTBUTTON);
    end
    else if component is TCustomEdit then
    begin
      if readingOrder = ivroRightToLeft then
        newStyle := newStyle or ES_RIGHT
      else
        newStyle := newStyle and not ES_RIGHT;
    end;
    if newStyle <> style then
      SetWindowLong(TWinControl(component).Handle, GWL_STYLE, newStyle);
  end;
  {$ENDIF}
{$ENDIF}
end;

procedure TIvTranslator.DetectTargets(
  targets: TIvTargetProperties;
  prompt: Boolean);
var
  i: Integer;
begin
  { Scans all the sub componets adding the targets they need }

  try
    AddObjectTargets(Host, targets, prompt);
    for i := 0 to Host.ComponentCount - 1 do
      AddObjectTargets(Host.Components[i], targets, prompt);
  except
    MessageDlg(DETECT_ERROR_C, mtError, [mbOK], 0);
  end;
end;

procedure TIvTranslator.AddObjectTargets(
  obj: TObject;
  targets: TIvTargetProperties;
  prompt: Boolean);
const
  DEFAULT_TARGET_COUNT_C = 6;
  DEFAULT_TARGETS_C: array[0..DEFAULT_TARGET_COUNT_C - 1] of String =
  (
    'Caption',
    'Hint',
    'Items',
    'Lines',
    'Hints',
    'Tabs'
  );
var
  i, j: Integer;
  found: Boolean;
  item: PPropInfo;
  list: TIvPropInfoList;
  objectProperty: TObject;
  availableTargets: TIvTargetProperties;
  fileName, line, objectName, propertyName: String;
  f: TextFile;
  parser: TIvStringParser;
  component, ownerComponent: TComponent;

  procedure Add(obj: TObject; name: String; check, useClassName: Boolean);
  var
    id: Integer;
    str: String;
{$IFNDEF WIN32}
    buffer: array[0..255] of Char;
{$ENDIF}
  begin
    { If the property has been excluded it is not added }

    if targets.IsPropertyExcluded(obj.ClassName, name) then
      Exit;

    { The property is added if it is included into the avaiable targets and
      it is not included to the targets }

    if (not check or (check and (availableTargets <> nil) and availableTargets.IsPropertyInTargets(obj.ClassName, name))) and
      not targets.IsPropertyInTargets(obj.ClassName, name) then
    begin
      if prompt then
        id := MessageBox(
          0,
{$IFDEF WIN32}PChar({$ELSE}StrPCopy(buffer,{$ENDIF}
          'The translator can translate the ' + obj.ClassName + '.' + name +
            ' property and all the other "' + name + '" properties on the "' + Host.Name + '" form.'#13#10 +
            'Do you want to add them to the targets?'),
          'A new target property found',
          MB_YESNOCANCEL)
      else
        id := IDYES;

      case id of
        IDYES:
        begin
          if useClassName then
            str := obj.ClassName
          else
            str := '';
          targets.Add(TIvTargetProperty.Create(str, name, ivttInclude));
        end;

        IDNO: targets.Add(TIvTargetProperty.Create(obj.ClassName, name, ivttExclude));
      end;
    end;
  end;

  function IsClass(obj: TObject; const className: String): Boolean;
  var
    str: String;
    classObj: TClass;
  begin
    Result := False;
    classObj := obj.ClassType;
    while classObj <> nil do
    begin
      str := classObj.ClassName;

      if classObj.ClassName = className then
      begin
        Result := True;
        Exit;
      end
      else if classObj.ClassName = 'TControl' then
        Exit
      else
        classObj := classObj.ClassParent;
    end;
  end;

begin
  { Do not scan dictionary or translator objects }

  if (obj is TIvDictionary) or (obj is TIvTranslator) then
    Exit;

  { Adds the complex targets }

  if IsClass(obj, 'TCustomMemo') then
    Add(obj, 'Text', False, True);

  if IsClass(obj, 'TStringGrid') then
    Add(obj, 'Cells', False, False);

  if IsClass(obj, 'TCustomOutline') then
    Add(obj, 'Lines', False, False);

{$IFDEF WIN32}
  if IsClass(obj, 'TCustomTreeView') then
    Add(obj, 'Items', False, False);

  if IsClass(obj, 'TCustomListView') then
  begin
    Add(obj, 'Items', False, False);
    Add(obj, 'Caption', False, False);
  end;
{$ENDIF}

  { Gets the available targets }

  fileName := GetMLRegistryValue(ROOT_DIR_C, '.') + '\' + TARGETS_C;
  availableTargets := TIvTargetProperties.Create;
  try
    { Reads the available targets from the TARGET.TXT file }

    if (fileName <> '') and FileExists(fileName) then
    begin
      parser := TIvStringParser.CreateValue('', ',');
      try
        AssignFile(f, fileName);
        Reset(f);
        try
          while not Eof(f) do
          begin
            Readln(f, line);
            if (line = '') or (line[1] = ';') or (line[1] = ':') then
              Continue;

            parser.Value := line;
            objectName := parser.GetString;
            propertyName := parser.GetString;
            availableTargets.Add(TIvTargetProperty.Create(objectName, propertyName, ivttInclude));
          end;
        finally
          CloseFile(f);
        end;
      finally
        parser.Free;
      end;
    end;

    { If the file does not exists or is null uses the default targets }

    if availableTargets.Count = 0 then
    begin
      for i := 0 to DEFAULT_TARGET_COUNT_C - 1 do
        availableTargets.Add(TIvTargetProperty.Create('', DEFAULT_TARGETS_C[i], ivttInclude));
    end;

    { If available targets contains items, scan the componet to find those
      targets. }

    list := TIvPropInfoList.Create(
      obj,
      [tkClass, tkString{$IFDEF WIN32}, tkLString{$ENDIF}]);

    try
      for i := 0 to list.Count - 1 do
      begin
        { Checks if the property is read only.
          In that case it is not translated }

        item := list.Items[i];
        if (item^.SetProc = nil) or (item^.GetProc = nil) then
          Continue;

        case item^.PropType^.Kind of
{$IFDEF WIN32}
          tkLString,
{$ENDIF}
          tkString:
          begin
            Add(obj, item^.Name, True, False);
          end;

          tkClass:
          begin
            { The property is an embedded class }

            try
              objectProperty := TObject(GetOrdProp(obj, item));

              if objectProperty <> nil then
              begin
                if availableTargets.IsObjectInTargets(objectProperty.ClassName) then
                begin
                  if not targets.IsObjectInTargets(objectProperty.ClassName) then
                    targets.Add(TIvTargetProperty.Create(objectProperty.ClassName, '', ivttInclude));
                end
                else if objectProperty is TStrings then
                  Add(obj, item^.Name, True, False)
{$IFDEF WIN32}
                else if objectProperty is TCollection then
                begin
                  { The property is a collection }

                  with TCollection(objectProperty) do
                    for j := 0 to Count - 1 do
                      AddObjectTargets(Items[j], targets, prompt);
                end
{$ENDIF}
                else if objectProperty is TComponent then
                begin
                  if obj is TComponent then
                  begin
                    component := TComponent(obj);

                    { The property is another component.
                      Scans the components of the owner component to avoid
                      circular references. }

                    found := False;
                    ownerComponent := component.Owner;
                    if ownerComponent <> nil then
                    begin
                      for j := 0 to ownerComponent.ComponentCount - 1 do
                      begin
                        if objectProperty = ownerComponent.Components[j] then
                        begin
                          found := True;
                          Break;
                        end;
                      end;
                    end;

                    if not found then
                      AddObjectTargets(objectProperty, targets, prompt);
                  end;
                end
                else if objectProperty <> nil then
                  AddObjectTargets(objectProperty, targets, prompt);
              end;
            except
              { The detection of this property failed. The most probably
                reason for this is a bad desing of the component. For example
                the TTable component raises an exaception if the MasterSource
                property is read in the early state of the component. }
            end;
          end;
        end;
      end;
    finally
      list.Free;
    end;
  finally
    availableTargets.Free;
  end;
end;

procedure TIvTranslator.Loaded;
begin
  { Translates the host if auto translate is on and the dictionary is given. }

  if not IsDesignTime and
    (ivtoAutoOpen in FOptions) and
    ((FDictionary <> nil) or (Dictionaries.Count > 0)) then
  begin
    Translate;
  end;
end;

procedure TIvTranslator.Notification(component: TComponent; operation: TOperation);
begin
  inherited Notification(component, operation);

  if IsDesignTime and not (csReading in owner.ComponentState) and (operation = opInsert) then
  begin
    { Scans the component to add new targets }

    try
      AddObjectTargets(component, FTargets, False);
    except
      MessageDlg(DETECT_ERROR_C, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TIvTranslator.ReadTargets(reader: TReader);
var
  i, version: Integer;
  target: TIvTargetProperty;
begin
  FTargets.ExcludeCount := 0;

  reader.ReadListBegin;
  version := reader.ReadInteger;
  if version > TARGETS_VERSION_C then
    raise EIvMulti.Create('Unknown target properties data version: ' + IntToStr(version));

  for i := 0 to reader.ReadInteger - 1 do
  begin
    { Reads the target from the stream }

    target := TIvTargetProperty.CreateDefault;
    reader.ReadListBegin;
    target.TargetClassName := reader.ReadString;
    target.TargetPropertyName := reader.ReadString;
    target.TargetType := TIvTargetType(reader.ReadInteger);
    reader.ReadListEnd;

    { Check if the target already exists. If not then adds the target. }

    if FTargets.Find(target) = -1 then
    begin
      if target.TargetType = ivttExclude then
        FTargets.ExcludeCount := FTargets.ExcludeCount + 1;
      FTargets.Add(target);
    end
    else
      target.Free;
  end;
  reader.ReadListEnd;
end;

procedure TIvTranslator.WriteTargets(writer: TWriter);
var
  i, j, count: Integer;
  exists: Boolean;
  targets: TIvTargetProperties;
begin
{$IFDEF WIN32}
  if (writer.Ancestor <> nil) and (writer.Ancestor is TIvTranslator) then
  begin
    targets := TIvTranslator(writer.Ancestor).Targets;
    count := 0;
    for i := 0 to FTargets.Count - 1 do
    begin
      { Checks of the parent form contains the target }

      exists := False;
      for j := 0 to targets.Count - 1 do
      begin
        if targets[j].IsEqual(FTargets[i]) then
        begin
          exists := True;
          Break;
        end;
      end;

      if not exists then
        Inc(count);
    end;
  end
  else
{$ENDIF}
  begin
    targets := nil;
    count := FTargets.Count;
  end;

  writer.WriteListBegin;
  writer.WriteInteger(TARGETS_VERSION_C);
  writer.WriteInteger(count);
  for i := 0 to FTargets.Count - 1 do
  begin
    { Checks of the parent form contains the target }

    exists := False;
    if targets <> nil then
    begin
      for j := 0 to targets.Count - 1 do
      begin
        if targets[j].IsEqual(FTargets[i]) then
        begin
          exists := True;
          Break;
        end;
      end;
    end;

    { Writes the target of the parent does not contain it. }

    if not exists then
    begin
      writer.WriteListBegin;
      with FTargets[i] do
      begin
        writer.WriteString(TargetClassName);
        writer.WriteString(TargetPropertyName);
        writer.WriteInteger(Integer(TargetType));
      end;
      writer.WriteListEnd;
    end;
  end;
  writer.WriteListEnd;
end;

procedure TIvTranslator.DefineProperties(filer: TFiler);

  function HasTargetsData: Boolean;
  begin
    if filer is TReader then
      Result := True
    else
    begin
      Result := FTargets.Count > 0;
{$IFDEF WIN32}
      if (filer.Ancestor <> nil) and (filer.Ancestor is TIvTranslator)then
        Result := Result and not FTargets.IsEqual(TIvTranslator(filer.Ancestor).Targets);
{$ENDIF}
    end;
  end;

begin
  inherited DefineProperties(filer);

  filer.DefineProperty('TargetsData', ReadTargets, WriteTargets, HasTargetsData);
end;

{$IFDEF WIN32}
{ Return handle to a window containing the system menu }

function TIvTranslator.GetSystemMenuWinHandle: THandle;
begin
  { Return 0 if host does not have system menu }

  Result := 0;
  if Host is TWinControl then
  begin
    with TWinControl(Host) do
    begin
      if HandleAllocated then
        Result := Handle;
    end;
  end;
end;
{$ENDIF}


{ Helper functions }

procedure IvCenterControl(parent, control: TControl);
begin
  if parent = nil then
  begin
    control.Left := (Screen.Width - control.Width) div 2;
    control.Top := (Screen.Height - control.Height) div 2;
  end
  else
  begin
    control.Left := parent.Left + (parent.Width - control.Width) div 2;
    control.Top := parent.Top + (parent.Height - control.Height) div 2;
  end;

  if control.Left < 0 then
    control.Left := 0;

  if control.Top < 0 then
    control.Top := 0;
end;

{$IFDEF WIN32}
initialization
  Modules := TIvModules.Create;
finalization
  Modules.Free;
  Modules := nil;
{$ELSE}
begin
  Modules := TIvModules.Create;
{$ENDIF}
end.
