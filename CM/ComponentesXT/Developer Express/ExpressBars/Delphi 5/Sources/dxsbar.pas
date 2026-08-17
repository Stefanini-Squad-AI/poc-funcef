
{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       Express side bar control                                    }
{                                                                   }
{       Copyright (c) 1998-2000 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire contents of this file is protected by U.S. and       }
{   International Copyright Laws. Unauthorized reproduction,        }
{   reverse-engineering, and distribution of all or any portion of  }
{   the code contained in this file is strictly prohibited and may  }
{   result in severe civil and criminal penalties and will be       }
{   prosecuted to the maximum extent possible under the law.        }
{                                                                   }
{   RESTRICTIONS                                                    }
{                                                                   }
{   THIS SOURCE CODE AND ALL RESULTING INTERMEDIATE FILES           }
{   (DCU, OBJ, DLL, ETC.) ARE CONFIDENTIAL AND PROPRIETARY TRADE    }
{   SECRETS OF DEVELOPER EXPRESS INC. THE REGISTERED DEVELOPER IS   }
{   LICENSED TO DISTRIBUTE THE EXPRESSBARS AND ALL ACCOMPANYING VCL }
{   CONTROLS AS PART OF AN EXECUTABLE PROGRAM ONLY.                 }
{                                                                   }
{   THE SOURCE CODE CONTAINED WITHIN THIS FILE AND ALL RELATED      }
{   FILES OR ANY PORTION OF ITS CONTENTS SHALL AT NO TIME BE        }
{   COPIED, TRANSFERRED, SOLD, DISTRIBUTED, OR OTHERWISE MADE       }
{   AVAILABLE TO OTHER INDIVIDUALS WITHOUT EXPRESS WRITTEN CONSENT  }
{   AND PERMISSION FROM DEVELOPER EXPRESS INC.                      }
{                                                                   }
{   CONSULT THE END USER LICENSE AGREEMENT FOR INFORMATION ON       }
{   ADDITIONAL RESTRICTIONS.                                        }
{                                                                   }
{*******************************************************************}

unit dxsbar;

{$I dxSBVer.inc}

interface

uses Classes, Controls, Windows, SysUtils, ExtCtrls, Graphics, Buttons,
StdCtrls, Forms, Messages, Menus, CommCtrl{$IFDEF DELPHI4}, ImgList, ActnList{$ENDIF};

type
  TdxSideBarStore = class;
  TdxStoredSideItem = class;
  TdxSideBarItem = class;

  TdxSideBarItemClickEvent = procedure(Sender: TObject; Item: TdxSideBarItem) of object;

  {$IFDEF DELPHI4}
  TdxSideBarItemActionLink = class(TActionLink)
  protected
    FClient: TdxStoredSideItem;

    procedure AssignClient(AClient: TObject); override;

    function IsCaptionLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsHintLinked: Boolean; override;
    function IsImageIndexLinked: Boolean; override;

    procedure SetCaption(const Value: string); override;
    procedure SetEnabled(Value: Boolean); override;
    procedure SetHint(const Value: string); override;
    procedure SetImageIndex(Value: Integer); override;
    procedure SetVisible(Value: Boolean); override;
  end;

  TdxSideBarItemActionLinkClass = class of TdxSideBarItemActionLink;
  {$ENDIF}


  TdxStoredSideItem = class(TComponent)
  private
    FCategory: Integer;
    FCaption: string;
    FEnabled: Boolean;
    FHint: string;
    FLargeImage: Integer;
    FSmallImage: Integer;
    FOnClick: TdxSideBarItemClickEvent;
    FStore: TdxSideBarStore;
    FPopupMenu: TPopupMenu;
    FAvailableInCustomizeForm: Boolean;
  {$IFDEF DELPHI4}
    FActionLink: TdxSideBarItemActionLink;
  {$ENDIF}

  {$IFDEF DELPHI4}
    function GetAction: TBasicAction;
  {$ENDIF}

  {$IFDEF DELPHI4}
    procedure SetAction(Value: TBasicAction);
  {$ENDIF}
    procedure SetCaption(Value: string);
    procedure SetCategory(Value: Integer);
    procedure SetEnabled(Value: Boolean);
    procedure SetHint(Value: string);
    procedure SetLargeImage(Value: Integer);
    procedure SetSmallImage(Value: Integer);
    procedure SetStore(Value: TdxSideBarStore);

  {$IFDEF DELPHI4}
    procedure DoActionChange(Sender: TObject);
    function IsCaptionStored: Boolean;
    function IsEnabledStored: Boolean;
    function IsHintStored: Boolean;
    function IsImageIndexStored: Boolean;
  {$ENDIF}
  protected
    procedure DoClick(Sender: TObject; Item: TdxSideBarItem);
    procedure ReadState(Reader: TReader); override;
    procedure SetParentComponent(AParent: TComponent); override;
  {$IFDEF DELPHI4}
    procedure Loaded; override;
  {$ENDIF}
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;

  {$IFDEF DELPHI4}
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); dynamic;
    function GetActionLinkClass: TdxSideBarItemActionLinkClass; dynamic;
  {$ENDIF}

  {$IFDEF DELPHI4}
    property ActionLink: TdxSideBarItemActionLink read FActionLink write FActionLink;
  {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    property AvailableInCustomizeForm: Boolean read FAvailableInCustomizeForm write FAvailableInCustomizeForm;
    property Store: TdxSideBarStore read FStore write SetStore;
  published
  {$IFDEF DELPHI4}
    property Action: TBasicAction read GetAction write SetAction;
  {$ENDIF}
    property Caption: string read FCaption write SetCaption {$IFDEF DELPHI4} stored IsCaptionStored{$ENDIF};
    property Category: Integer read FCategory write SetCategory;
    property Enabled: Boolean read FEnabled write SetEnabled {$IFDEF DELPHI4} stored IsEnabledStored{$ENDIF};
    property Hint: string read FHint write SetHint{$IFDEF DELPHI4} stored IsHintStored{$ENDIF};
    property LargeImage: Integer read FLargeImage write SetLargeImage {$IFDEF DELPHI4} stored IsImageIndexStored{$ENDIF};
    property SmallImage: Integer read FSmallImage write SetSmallImage;
    property PopupMenu: TPopupMenu read FPopupMenu write FPopupMenu;
    property OnClick: TdxSideBarItemClickEvent read FOnClick write FOnClick;
  end;

  TdxSideBar = class;

  TdxSideBarStoreDesigner = class(TForm)
  protected
    Store: TdxSideBarStore;

    procedure CloseSideBarStoreEditor; virtual; abstract;
    procedure SideBarStoreEditorUpdate; virtual; abstract;
    procedure SideBarStoreEditorUpdateItem(AItem: TdxStoredSideItem); virtual; abstract;
  end;

  TdxSideBarStoreCustomizeForm = class(TForm)
  protected
    Store: TdxSideBarStore;

    procedure BeginCustomizing;
    procedure EndCustomizing;
  end;

  TdxSideBarStore = class(TComponent)
  private
    FList: TList;
    FBars: TList;
    FCategories: TStrings;
    FLargeImages: TImageList;
    FSmallImages: TImageList;
    FSmallChangeLink: TChangeLink;
    FLargeChangeLink: TChangeLink;
    FDefaultLargeImage: Integer;
    FDefaultSmallImage: Integer;
    FIsCustomizing: Boolean;

    function GetCount: Integer;
    function GetSideBarCount: Integer;
    function GetItem(Index: Integer): TdxStoredSideItem;
    function GetSideBar(Index: Integer): TdxSideBar;
    procedure SetCategories(Value: TStrings);
    procedure SetDefaultLargeImage(Value: Integer);
    procedure SetDefaultSmallImage(Value: Integer);
    procedure SetLargeImages(Value: TImageList);
    procedure SetSmallImages(Value: TImageList);
    procedure DestroyItems;
    procedure OnChangeLink(Sender: TObject);
    procedure RedrawBars;
    procedure RemoveBarItem(StoredItem: TdxStoredSideItem);
  protected
  {$IFDEF DELPHI3}
     procedure GetChildren(Proc: TGetChildProc; Root: TComponent); override;
  {$ELSE}
     procedure GetChildren(Proc: TGetChildProc); override;
  {$ENDIF}
     procedure SetName(const Value: TComponentName); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    Designer: TdxSideBarStoreDesigner;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AddItem(Item: TdxStoredSideItem);
    procedure ExchangeItems(Item1, Item2: TdxStoredSideItem);
    procedure RemoveItem(Item: TdxStoredSideItem);
    procedure UpdateItem(Item: TdxStoredSideItem);
    function GetCountByCategory(St: string): Integer;
    function GetItemByCategory(St: string; Index: Integer): TdxStoredSideItem;
    function GetItemsByCategory(St: string; List: TList): Integer;
    procedure Customize;
    procedure UpdateEditorItem(Item: TdxStoredSideItem);
    property Count: Integer read GetCount;
    property IsCustomizing: Boolean read FIsCustomizing;
    property Items[Index: Integer]: TdxStoredSideItem read GetItem;
    property SideBarCount: Integer read GetSideBarCount;
    property SideBars[Index: Integer]: TdxSideBar read GetSideBar;
  published
    property Categories: TStrings read FCategories write SetCategories;
    property DefaultLargeImage: Integer read FDefaultLargeImage write SetDefaultLargeImage;
    property DefaultSmallImage: Integer read FDefaultSmallImage write SetDefaultSmallImage;
    property LargeImages: TImageList read FLargeImages write SetLargeImages;
    property SmallImages: TImageList read FSmallImages write SetSmallImages;
  end;

  TdxSideGroups = class;
  TdxSideGroup = class;
  TdxSideBarItems = class;

  TdxSideBarItem = class(TCollectionItem)
  private
    FCaption: string;
    FIsDefault: Boolean;
    FLargeImage: Integer;
    FSmallImage: Integer;
    FStoredItem: TdxStoredSideItem;
    FTextHeight: Integer;
    FVisible: Boolean;
    FPartialVisible: Boolean;
    FCustomData: string;
    FHint: string;
    FObject: TObject;
    FTag: LongInt;
    FEnabled: Boolean;

    function GetCaption: string;
    function GetEnabled: Boolean;
    function GetHint: string;
    function GetGroup: TdxSideGroup;
    function GetLargeImage: Integer;
    function GetSmallImage: Integer;
    procedure SetCaption(Value: string);
    procedure SetEnabled(Value: Boolean);
    procedure SetHint(Value: string);
    procedure SetIsDefault(Value: Boolean);
    procedure SetLargeImage(Value: Integer);
    procedure SetSmallImage(Value: Integer);
    procedure SetStoredItem(Value: TdxStoredSideItem);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function MakeVisible: Boolean;

    property Enabled: Boolean read GetEnabled write SetEnabled;
    property Group: TdxSideGroup read GetGroup;
    property ItemObject: TObject read FObject write FObject;
    property Visible: Boolean read FVisible;
  published
    property Caption: string read GetCaption write SetCaption;
    property CustomData: string read FCustomData write FCustomData;
    property Hint: string read GetHint write SetHint;
    property Index;
    property IsDefault: Boolean read FIsDefault write SetIsDefault;
    property LargeImage: Integer read GetLargeImage write SetLargeImage;
    property SmallImage: Integer read GetSmallImage write SetSmallImage;
    property StoredItem: TdxStoredSideItem read FStoredItem write SetStoredItem;
    property Tag: LongInt read FTag write FTag;
  end;

  TdxSideBarItems = class(TCollection)
  private
    Group: TdxSideGroup;
    SideBar: TdxSideBar;

    function GetItem(Index: Integer): TdxSideBarItem;
    procedure SetItem(Index: Integer; Value: TdxSideBarItem);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TdxSideGroup);

    function Add: TdxSideBarItem;
    property Items[Index: Integer]: TdxSideBarItem read GetItem write SetItem; default;
  end;

  TdxSideGroupIconType = (dxsgLargeIcon, dxsgSmallIcon);

  TdxSideGroup = class(TCollectionItem)
  private
    FItems: TdxSideBarItems;
    FTopVisibleItem: Integer;
    FCaption: string;
    FIconType: TdxSideGroupIconType;
    FIsAssigning: Boolean;
    FVisible: Boolean;
    FTag: Integer;
    FDestroying: Boolean;

    function GetActive: Boolean;
    function GetItemCount: Integer;
    procedure SetCaption(Value: string);
    procedure SetIconType(Value: TdxSideGroupIconType);
    procedure SetItems(Value: TdxSideBarItems);
    procedure SetTopVisibleItem(Value: Integer);
    procedure SetVisible(Value: Boolean);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure MakeActive;
    function GetVisibleCount: Integer;

    property Active: Boolean read GetActive;
    property ItemCount: Integer read GetItemCount;
    property TopVisibleItem: Integer read FTopVisibleItem write SetTopVisibleItem;
    property Tag: Integer read FTag write FTag;
  published
    property Caption: string read FCaption write SetCaption;
    property Index;
    property IconType: TdxSideGroupIconType read FIconType write SetIconType;
    property Items: TdxSideBarItems read FItems write SetItems;
    property Visible: Boolean read FVisible write SetVisible default True;
  end;

  TdxSideGroups = class(TCollection)
  private
    SideBar: TdxSideBar;

    function GetItem(Index: Integer): TdxSideGroup;
    function GetVisibleItem(Index: Integer): TdxSideGroup;
    function GetVisibleCount: Integer;
    procedure SetItem(Index: Integer; Value: TdxSideGroup);
  protected
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TdxSideBar);

    function Add: TdxSideGroup;
    property Items[Index: Integer]: TdxSideGroup read GetItem write SetItem; default;
    property VisibleItems[Index: Integer]: TdxSideGroup read GetVisibleItem;
    property VisibleCount: Integer read GetVisibleCount;
  end;

  TdxSideBarChangeGroupCaptionEvent = procedure(Sender: TObject; Group: TdxSideGroup) of object;
  TdxSideBarDragDropItemEvent = procedure(Sender: TObject; Source, Target: TdxSideBarItem;
                                   IsCopy: Boolean) of object;
  TdxSideBarDeleteItemEvent = procedure(Sender: TObject; Item: TdxSideBarItem) of object;

  TdxSideBarFillStyle = (bfsNone, bfsHorz, bfsVert);

  TdxSideBarBackGround = class(TPersistent)
  private
    FBeginColor: TColor;
    FEndColor: TColor;
    FOnChange: TNotifyEvent;
    FFillStyle: TdxSideBarFillStyle;
    FStep: Integer;

    procedure SetBeginColor(Value: TColor);
    procedure SetEndColor(Value: TColor);
    procedure SetFillStyle(Value: TdxSideBarFillStyle);
    procedure SetStep(Value: Integer);
    procedure DoChange;
  public
    constructor Create;
    function IsUsed: Boolean;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property BeginColor: TColor read FBeginColor write SetBeginColor;
    property EndColor: TColor read FEndColor write SetEndColor;
    property FillStyle: TdxSideBarFillStyle read FFillStyle write SetFillStyle;
    property Step: Integer read FStep write SetStep default 2;
  end;

  TdxsbPaintStyle = (sbpsStandard, sbpsFlat);

  TdxSideBar = class(TCustomPanel)
  private
    FLargeImages: TImageList;
    FSmallImages: TImageList;
    FSmallChangeLink: TChangeLink;
    FLargeChangeLink: TChangeLink;

    FActiveGroupIndex: Integer;
    FOldActiveGroupIndex: Integer;
    FActiveGroup: TdxSideGroup;
    FGroups: TdxSideGroups;
    FStore: TdxSideBarStore;
    FGroupFont: TFont;
    FItemFont: TFont;
    FRenameGroup: TdxSideGroup;
    FRenameItem: TdxSideBarItem;
    FRenameEdit: TEdit;
    FCanSelected: Boolean;
    FHintWindow: THintWindow;
    FHintWindowShowing: Boolean;
    FHintTimerID: Integer;
    FSelectedItem: TdxSideBarItem;
    FOnDeleteItem: TdxSideBarDeleteItemEvent;
    FOnChangeActiveGroup: TNotifyEvent;
    FOnChangeFocusedItem: TNotifyEvent;
    FOnChangeSelectedItem: TNotifyEvent;
    FOnChangeGroupCaption: TdxSideBarChangeGroupCaptionEvent;
    FSpaceHeight: Integer;
    FScrollDelay: Integer;
    FScrollButtonUpIsVisible: Boolean;
    FScrollButtonUpIsDown: Boolean;
    FScrollButtonDownIsVisible: Boolean;
    FScrollButtonDownIsDown: Boolean;
    FScrollTimerID: Integer;
    FGroupHeight: Integer;
    FItemHeight: Integer;
    FPaintRect: TRect;
    FMouseFocusedItem: TdxSideBarItem;
    FMouseFocusedItemIsDown: Boolean;
    FMouseFocusedGroup: TdxSideGroup;
    FMouseFocusedGroupIsDown: Boolean;
    FCanvasDC: HDC;
    FDestDropItemIndex: TdxSideBarItem;
    FIsDropBottom: Boolean;
    FEnableDraging: Boolean;
    FDragMode: TDragMode;
    FPointDragging: TPoint;
    FGroupPopupMenu: TPopupMenu;
    FItemPopupMenu: TPopupMenu;
    FTransparentImages: Boolean;
    FImageList: TImageList;
    FAssignFlag: Boolean;
    FOnMouseEnter: TNotifyEvent;
    FOnMouseLeave: TNotifyEvent;
    FOnAfterEdit: TNotifyEvent;
    FOnBeforeEdit: TNotifyEvent;
    FOnDragDropItem: TdxSideBarDragDropItemEvent;
    FOnItemClick: TdxSideBarItemClickEvent;
    FBkPicture: TPicture;
    FBkGround: TdxSideBarBackGround;
    FPaintStyle: TdxsbPaintStyle;
    FRegistryPath: string;
    FStoreInRegistry: Boolean;
    FIsMakingUpdate: Boolean;
    FGroupHeightOffSet: Integer;
    FShowGroups: Boolean;
    FDestroying: Boolean;
    FVisibleGroups: TList;

    function GetGroupCount: Integer;
    procedure SetActiveGroup(Value: TdxSideGroup);
    procedure SetActiveGroupIndex(Value: Integer);
    procedure SetBkGround(Value: TdxSideBarBackGround);
    procedure SetBkPicture(Value: TPicture);
    procedure SetCanSelected(Value: Boolean);
    procedure SetGroupFont(Value: TFont);
    procedure SetGroups(Value: TdxSideGroups);
    procedure SetGroupHeightOffSet(Value: Integer);
    procedure SetItemFont(Value: TFont);
    procedure SetLargeImages(Value: TImageList);
    procedure SetSmallImages(Value: TImageList);
    procedure SetPaintStyle(Value: TdxsbPaintStyle);
    procedure SetScrollDelay(Value: Integer);
    procedure SetShowGroups(Value: Boolean);
    procedure SetSpaceHeight(Value: Integer);
    procedure SetStore(Value: TdxSideBarStore);
    procedure SetTransparentImages(Value: Boolean);
    procedure SetDestDropItemIndex(Value: TdxSideBarItem);
    procedure SetIsDropBottom(Value: Boolean);
    procedure SetDestDropItemIndex_(Value1: TdxSideBarItem; Value2: Boolean);
    procedure SetMouseFocusedItem(Item: TdxSideBarItem);
    procedure SetSelectedItem(Item: TdxSideBarItem);

    procedure DrawGroup(Index: Integer);
    procedure DrawTopGroups;
    procedure DrawBottomGroups;
    procedure DrawItems;
    procedure DrawItem(Index: Integer);
    function DrawItemImage(Index: Integer): Boolean;
    function DrawItemText(Index: Integer): Boolean;
    procedure DrawScrollButtons;
    procedure DrawFillRect(ARect: TRect);
    procedure DrawBorder98;
    procedure HintActivate(AShow: Boolean);
    procedure MakeGroupScrolling;
    function GetFontHeight(AFont: TFont): Integer;
    function GetGroupHeight: Integer;
    function GetItemHeight: Integer;
    function GetGroupRect(Index: Integer): TRect;
    function GetTopFirstBottomGroup: Integer;
    function GetItemTop(Index: Integer): Integer;
    function GetItemImageRect(Index: Integer): TRect;
    function GetItemTextRect(Index: Integer; St: string): TRect;
    function GetItemPaintedImageRect(Index: Integer): TRect;
    function GetItemRect(AItem: TdxSideBarItem): TRect;
    function GetDrawItemTextHeight(St: string; r: TRect): Integer;
    function GetTopVisibleToMakeItemVisible(Index: Integer): Integer;
    function GetPaintRect: TRect;
    function GetLargeImageHeight: Integer;
    function GetLargeImageWidth: Integer;
    function GetSmallImageHeight: Integer;
    function GetSmallImageWidth: Integer;

    function GetVisibleGroup(Index: Integer): TdxSideGroup;
    function GetVisibleIndexByGroup(AGroup: TdxSideGroup): Integer;
    procedure UpdateVisibleGroups;

    function GetFocusedItem(X, Y: Integer): TdxSideBarItem;
    function GetSpacedItem(X, Y: Integer): Integer;
    function GetItemBottomSpace(Item: Integer): TPoint;

    procedure RenameEditExit(Sender: TObject);
    procedure DoGroupMouseFocused(Group: TdxSideGroup; IsDown: Boolean);
    procedure DoItemMouseFocused(Item: TdxSideBarItem; IsDown: Boolean);
    procedure DoItemSelected(Item: TdxSideBarItem);
    procedure DoBkPictureChange(Sender: TObject);
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure WMEraseBkgnd(var Message: TWmEraseBkgnd); message WM_ERASEBKGND;
    procedure WMSetCursor(var Msg: TWMSetCursor); message WM_SETCURSOR;

    procedure OnChangeLink(Sender: TObject);
  protected
    procedure Paint; override;
    procedure WndProc(var Message: TMessage); override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
        X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
        X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure DoItemClick(Item: TdxSideBarItem); virtual;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    procedure DoEndDrag(Target: TObject; X, Y: Integer); override;
    procedure DoStartDrag(var DragObject: TDragObject); override;

    property DestDropItemIndex: TdxSideBarItem read FDestDropItemIndex write SetDestDropItemIndex;
    property IsDropBottom: Boolean read FIsDropBottom write SetIsDropBottom;
    property VisibleGroups[Index: Integer]: TdxSideGroup read GetVisibleGroup;
  public
    property IsMakingUpdate: Boolean read FIsMakingUpdate write FIsMakingUpdate;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;

    procedure Assign(Source: TPersistent); override;
    function GetGroupAtPos(p: TPoint): TdxSideGroup;
    function GetItemAtPos(p: TPoint): TdxSideBarItem;
    function GetPopupGroup: TdxSideGroup;
    function IsGroupEditing: Boolean;
    function IsItemEditing: Boolean;
    function IsEditing: Boolean;
    procedure EditGroup(Group: TdxSideGroup);
    procedure EditItem(Item: TdxSideBarItem);
    procedure EndEdit(Accept: Boolean);

    function GetSmallImages: TImageList;
    function GetLargeImages: TImageList;

    procedure LoadFromRegistry(ARegistryPath: string);
    procedure SaveToRegistry(ARegistryPath: string);


    property ActiveGroup: TdxSideGroup read FActiveGroup write SetActiveGroup;
    property EditControl: TEdit read FRenameEdit;
    property EditingGroup: TdxSideGroup read FRenameGroup;
    property EditingItem: TdxSideBarItem read FRenameItem;
    property FocusedItem: TdxSideBarItem read FMouseFocusedItem;
    property GroupCount: Integer read GetGroupCount;
    property SelectedItem: TdxSideBarItem read FSelectedItem write DoItemSelected;
  published
    property Align default alLeft;
    property BkGround: TdxSideBarBackGround read FBkGround write SetBkGround;
    property BkPicture: TPicture read FBkPicture write SetBkPicture;
    property Color default clGrayText;
    property CanSelected: Boolean read FCanSelected write SetCanSelected;
    property GroupFont: TFont read FGroupFont write SetGroupFont;
    property Groups: TdxSideGroups read FGroups write SetGroups;
    // Have to be defined after property Groups !
    property ActiveGroupIndex: Integer read FActiveGroupIndex write SetActiveGroupIndex;
    property GroupPopupMenu: TPopupMenu read FGroupPopupMenu write FGroupPopupMenu;
    property GroupHeightOffSet: Integer read FGroupHeightOffSet write SetGroupHeightOffSet;
    property ItemFont: TFont read FItemFont write SetItemFont;
    property ItemPopupMenu: TPopupMenu read FItemPopupMenu write FItemPopupMenu;
    property LargeImages: TImageList read FLargeImages write SetLargeImages;
    property PaintStyle: TdxsbPaintStyle read FPaintStyle write SetPaintStyle default sbpsFlat;
    property SmallImages: TImageList read FSmallImages write SetSmallImages;
    property ScrollDelay: Integer read FScrollDelay write SetScrollDelay;
    property SpaceHeight: Integer read FSpaceHeight write SetSpaceHeight;
    property Store: TdxSideBarStore read FStore write SetStore;
    property TransparentImages: Boolean read FTransparentImages write SetTransparentImages;
    property RegistryPath: string read FRegistryPath write FRegistryPath;
    property ShowGroups: Boolean read FShowGroups write SetShowGroups;
    property StoreInRegistry: Boolean read FStoreInRegistry write FStoreInRegistry;
    property OnItemClick: TdxSideBarItemClickEvent read FOnItemClick write FOnItemClick;
    property OnDeleteItem: TdxSideBarDeleteItemEvent read FOnDeleteItem write FOnDeleteItem;
    property OnChangeActiveGroup: TNotifyEvent read FOnChangeActiveGroup write FOnChangeActiveGroup;
    property OnChangeFocusedItem: TNotifyEvent read FOnChangeFocusedItem write FOnChangeFocusedItem;
    property OnChangeGroupCaption: TdxSideBarChangeGroupCaptionEvent
             read FOnChangeGroupCaption write FOnChangeGroupCaption;
    property OnChangeSelectedItem: TNotifyEvent read FOnChangeSelectedItem
             write FOnChangeSelectedItem;
    property BorderStyle;
    property DragCursor;
    property DragMode read FDragMode write FDragMode;
    property Enabled;
    property Ctl3D;
    property Locked;
    property ParentColor;
    property ParentCtl3D;
    property ParentShowHint;
    property ShowHint;
    property Visible;
    property OnAfterEdit: TNotifyEvent read FOnAfterEdit write FOnAfterEdit;
    property OnBeforeEdit: TNotifyEvent read FOnBeforeEdit write FOnBeforeEdit;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragDropItem: TdxSideBarDragDropItemEvent read FOnDragDropItem
                            write FOnDragDropItem;
    property OnDragOver;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnMouseDown;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnResize;
    property OnStartDrag;

    {$IFDEF DELPHI4}
    property Anchors;
    property Constraints;
    property OnStartDock;
    property OnEndDock;
    {$ENDIF}
  end;

  TdxSideBarPopupMenuOption = (sbmIconType, sbmAddGroup, sbmRemoveGroup,
    sbmCustomize, sbmRenameGroup, sbmRenameItem, sbmRemoveItem);

  TdxSideBarPopupMenuOptions = set of TdxSideBarPopupMenuOption;

  TdxSideBarPopupMenu = class(TPopupMenu)
  private
    FOptions: TdxSideBarPopupMenuOptions;
    List: TList;
    Bar: TdxSideBar;
    Group: TdxSideGroup;
    FOnAfterClick: TNotifyEvent;
    FOnPopupClose: TNotifyEvent;
  protected
    procedure BarMenuClick(Sender: TObject);
    procedure DestroyBarItems;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Popup(X, Y: Integer); override;
  published
    property Options: TdxSideBarPopupMenuOptions read FOptions write FOptions;
    property OnAfterClick: TNotifyEvent read FOnAfterClick write FOnAfterClick;
    property OnPopupClose: TNotifyEvent read FOnPopupClose write FOnPopupClose;
  end;

  EdxSideBarError = class(Exception);

  TdxSideBarDragObject = class(TObject)
  private
    FStoredItem: TdxStoredSideItem;
    FItem: TdxSideBarItem;
    FDeleteItem: Boolean;
    FDragObject: TDragControlObject;
    FCancelDrag: Boolean;
  public
    constructor Create(Control: TControl; var DragObject: TDragObject;
              AItem: TdxSideBarItem; AStoredItem: TdxStoredSideItem);
    destructor Destroy; override;
    function EndDrag(Target: TObject; X, Y: Integer): TdxSideBarItem;

    property CancelDrag: Boolean read FCancelDrag write FCancelDrag;
    property DeleteItem: Boolean read FDeleteItem write FDeleteItem;
    property Item: TdxSideBarItem read FItem;
    property StoredItem: TdxStoredSideItem read FStoredItem;
  end;

var
 dxSideBarDragObject: TdxSideBarDragObject;

 //Group scrolling variable. Change them to change the speed of the group scrolling
 dxSideBarGroupScrollStep: Integer = 1;
 dxSideBarGroupScrollIncrement: Integer = 2;
 dxSideBarGroupScrollTimeToIncrement: Integer = 50;  

implementation
{$R dxsbar.res}

uses dxsbstrs, dxsbarcs, Registry, TypInfo;

const
  ScrollButtonHeight = 16;
  ScrollButtonIndention = 3;

  dxSideBarHintShowDelay = 3000;
  dxSideBarDragCursor = -1121;
  dxSideBarDragCopyCursor = -1122;
  dxSideBarDragDeleteCursor = -1123;
  dxSideBarGroupCursor = -1125;

  dxSideBarDefaultLargeImageHeight = 32;
  dxSideBarDefaultLargeImageWidth = 32;
  dxSideBarDefaultSmallImageHeight = 16;
  dxSideBarDefaultSmallImageWidth = 16;

procedure DrawBmpOnCanvas(ACanvas: TCanvas; APicture: TPicture;
  ADrawRect: TRect; AWidth, AHeight: Integer);
var
  dLeft, dTop, dWidth, dHeight, sLeft, sTop : Integer;
  ABmp: TBitmap;
  ACreatedFlag: Boolean;
begin
  ABmp := nil;
  ACreatedFlag := False;
  if (APicture.Graphic is TBitmap) then
    ABmp := APicture.Bitmap;
  if (APicture.Graphic is TIcon) or (APicture.Graphic is TMetaFile) then
  begin
    ABmp := TBitmap.Create;
    ABmp.Height := APicture.Graphic.Height;
    ABmp.Width := APicture.Graphic.Height;
    ABmp.Canvas.Draw(0, 0, APicture.Graphic);
    ACreatedFlag := True;
  end;

  if (ABmp = nil) then begin
    ACanvas.FillRect(ADrawRect);
    Exit;
  end;
  dTop := ADrawRect.Top;
  while (dTop < ADrawRect.Bottom) do begin
     if (dTop mod ABmp.Height <> 0) then
       sTop := dTop - (dTop div ABmp.Height) * ABmp.Height
     else sTop := 0;
     dHeight := ABmp.Height - sTop;
     if (dTop + dHeight > ADrawRect.Bottom) then
       dHeight := ADrawRect.Bottom - dTop;
     dLeft := ADrawRect.Left;
     while (dLeft < ADrawRect.Right) do begin
       if (dLeft mod ABmp.Width <> 0) then
         sLeft := dLeft - (dLeft div ABmp.Width) * ABmp.Width
       else sLeft := 0;
       dWidth := ABmp.Width - sLeft;
       if (dLeft + dWidth > ADrawRect.Right) then
         dWidth := ADrawRect.Right - dLeft;
       BitBlt(ACanvas.Handle, dLeft, dTop, dWidth, dHeight,
         ABmp.Canvas.Handle, sLeft, sTop, SRCCOPY);
       Inc(dLeft, dWidth);
     end;
     Inc(dTop, dHeight);
  end;
  if ACreatedFlag then
    ABmp.Free;
end;

procedure DrawDifColorsOnCanvas(ACanvas: TCanvas; ABeginColor, AEndColor: TColor;
          cdXY: Integer; AIsHorz: Boolean; ADrawRect: TRect; AWidth, AHeight: Integer);
var
  r: TRect;
  FBeginColor, FEndColor, FColor: Integer;
  FBeginColorB, FBeginColorG, FBeginColorR: Byte;
  FEndColorB, FEndColorG, FEndColorR: Byte;
  dColorB, dColorG, dColorR: Real;
  FColorB, FColorG, FColorR: Real;
  brh: HBRUSH;
  FHeight: Integer;
begin

  FBeginColor := ColorToRGB(ABeginColor);
  FEndColor := ColorToRGB(AEndColor);

  FBeginColorB := GetBValue(FBeginColor);
  FBeginColorG := GetGValue(FBeginColor);
  FBeginColorR := GetRValue(FBeginColor);

  FEndColorB := GetBValue(FEndColor);
  FEndColorG := GetGValue(FEndColor);
  FEndColorR := GetRValue(FEndColor);

  if AIsHorz then
    FHeight := AHeight
  else FHeight := AWidth;
  dColorB := (FEndColorB - FBeginColorB) * cdXY /FHeight;
  dColorG := (FEndColorG - FBeginColorG) * cdXY /FHeight;
  dColorR := (FEndColorR - FBeginColorR) * cdXY /FHeight;

  r := ADrawRect;
  if AIsHorz then begin
    r.Top := ADrawRect.Top;
    FColorB := FBeginColorB + dColorB * r.Top / cdXY;
    FColorG := FBeginColorG + dColorG * r.Top / cdXY;
    FColorR := FBeginColorR + dColorR * r.Top / cdXY;
    while (r.Top < ADrawRect.Bottom) do begin
      r.Bottom := r.Top + cdXY;
      if (r.Bottom > ADrawRect.Bottom) then
        r.Bottom := ADrawRect.Bottom;
      FColor := {PALETTE}RGB(Trunc(FColorR), Trunc(FColorG), Trunc(FColorB));
      brh := CreateSolidBrush(FColor);
      Windows.FillRect(ACanvas.Handle, r, brh);
      DeleteObject(brh);
      if (r.Top mod cdXY <> 0) then
        Dec(r.Top, r.Top mod cdXY);
      Inc(r.Top, cdXY);
      FColorB := FColorB + dColorB;
      FColorG := FColorG + dColorG;
      FColorR := FColorR + dColorR;
    end;
  end else begin
    r.Left := ADrawRect.Left;
    FColorB := FBeginColorB + dColorB * r.Left / cdXY;
    FColorG := FBeginColorG + dColorG * r.Left / cdXY;
    FColorR := FBeginColorR + dColorR * r.Left / cdXY;
    while (r.Left < ADrawRect.Right) do begin
      r.Right := r.Left + cdXY;
      if (r.Right > ADrawRect.Right) then
        r.Right := ADrawRect.Right;
      FColor := {PALETTE}RGB(Trunc(FColorR), Trunc(FColorG), Trunc(FColorB));
      brh := CreateSolidBrush(FColor);
      Windows.FillRect(ACanvas.Handle, r, brh);
      DeleteObject(brh);
      if (r.Left mod cdXY <> 0) then
        Dec(r.Left, r.Left mod cdXY);
      Inc(r.Left, cdXY);
      FColorB := FColorB + dColorB;
      FColorG := FColorG + dColorG;
      FColorR := FColorR + dColorR;
    end;
  end;
//  ACanvas.Brush.Color := OldColor;
end;


type
{TStoredSideBarItemsStoreStrings}
TStoredSideBarItemsStoreStrings = class(TStringList)
private
  Owner: TdxSideBarStore;

  procedure ChangeCategory(OldCategory, NewCategory: Integer);
public
  constructor Create(AOwner: TdxSideBarStore);
  procedure Clear; override;
  procedure Delete(Index: Integer); override;
  procedure Insert(Index: Integer; const S: string); override;
  procedure Exchange(Index1, Index2: Integer); override;
  procedure Move(CurIndex, NewIndex: Integer); override;
end;

{TStoredSideBarItemsStoreStrings}

constructor TStoredSideBarItemsStoreStrings.Create(AOwner: TdxSideBarStore);
begin
  inherited Create;
  Owner := AOwner;
  if not (csLoading in Owner.ComponentState) then
    Add(LoadStr(DXSB_DEFAULTGROUP));
end;

procedure TStoredSideBarItemsStoreStrings.ChangeCategory(OldCategory, NewCategory: Integer);
var
  I: Integer;
  List: TList;
begin
  if (OldCategory > -1) and (OldCategory < Count)
  and (NewCategory > -1) and (NewCategory < Count) then begin
    List := TList.Create;
    Owner.GetItemsByCategory(Strings[OldCategory], List);
    for I := 0 to List.Count - 1 do
      TdxStoredSideItem(List[I]).Category := NewCategory;
    List.Free;
  end;
end;

procedure TStoredSideBarItemsStoreStrings.Clear;
begin
  if (Owner.Count > 0) and not (csLoading in Owner.ComponentState) then
    raise EdxSideBarError.Create(LoadStr(DXSB_CANTDELETEGROUP))
  else begin
    inherited Clear;
    if not (csLoading in Owner.ComponentState) then
      Add(LoadStr(DXSB_DEFAULTGROUP));
  end;

end;

procedure TStoredSideBarItemsStoreStrings.Delete(Index: Integer);
var
  I: Integer;
begin
  if (Index > -1 ) and (Index < Count) and (Owner.GetCountByCategory(Strings[Index]) > 0) then
    raise EdxSideBarError.Create(LoadStr(DXSB_CANTDELETEGROUP))
  else begin
    if (Index > -1 ) and (Index < Count) then
      for I := Index to Count - 1 do
        ChangeCategory(I + 1, I);
    inherited Delete(Index);
  end;
  if Count = 0 then
      Add(LoadStr(DXSB_DEFAULTGROUP));
end;

procedure TStoredSideBarItemsStoreStrings.Insert(Index: Integer; const S: string);
var
  I: Integer;
begin
  inherited Insert(Index, S);
  if (Index < Count) and (Index > -1) then
    for I := Count -  1  downto Index + 1 do
      ChangeCategory(I - 1, I);
end;

procedure TStoredSideBarItemsStoreStrings.Exchange(Index1, Index2: Integer);
var
  I: Integer;
  List1: TList;
  List2: TList;
begin
  if (Index1 > -1) and (Index1 < Count)
  and (Index2 > -1) and (Index2 < Count) then begin
    List1 := TList.Create;
    List2 := TList.Create;
    Owner.GetItemsByCategory(Strings[Index1], List1);
    Owner.GetItemsByCategory(Strings[Index2], List2);
    for I := 0 to List1.Count - 1 do
      TdxStoredSideItem(List1[I]).Category := Index2;
    for I := 0 to List2.Count - 1 do
      TdxStoredSideItem(List2[I]).Category := Index1;
    List1.Free;
    List2.Free;
  end;
  inherited Exchange(Index1, Index2);
end;

procedure TStoredSideBarItemsStoreStrings.Move(CurIndex, NewIndex: Integer);
var
  I: Integer;
begin
  if (CurIndex < NewIndex) then begin
    for I := CurIndex + 1 to NewIndex do
      ChangeCategory(I, I - 1);
  end else
    for I := NewIndex to CurIndex - 1 do
      ChangeCategory(I, I + 1);
  inherited Move(CurIndex, NewIndex);
end;

{$IFDEF DELPHI4}

{ TdxSideBarItemActionLink }

procedure TdxSideBarItemActionLink.AssignClient(AClient: TObject);
begin
  FClient := AClient as TdxStoredSideItem;
end;

function TdxSideBarItemActionLink.IsCaptionLinked: Boolean;
begin
  Result := inherited IsCaptionLinked and
    (FClient.Caption = (Action as TCustomAction).Caption);
end;

function TdxSideBarItemActionLink.IsEnabledLinked: Boolean;
begin
  Result := inherited IsEnabledLinked and
    (FClient.Enabled = (Action as TCustomAction).Enabled);
end;

function TdxSideBarItemActionLink.IsHintLinked: Boolean;
begin
  Result := inherited IsHintLinked and
    (FClient.Hint = (Action as TCustomAction).Hint);
end;

function TdxSideBarItemActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FClient.LargeImage = (Action as TCustomAction).ImageIndex);
end;

procedure TdxSideBarItemActionLink.SetCaption(const Value: string);
begin
  if IsCaptionLinked then FClient.Caption := Value;
end;

procedure TdxSideBarItemActionLink.SetEnabled(Value: Boolean);
begin
  if IsEnabledLinked then FClient.Enabled := Value;
end;

procedure TdxSideBarItemActionLink.SetHint(const Value: string);
begin
  if IsHintLinked then FClient.Hint := Value;
end;

procedure TdxSideBarItemActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then FClient.LargeImage := Value;
end;

procedure TdxSideBarItemActionLink.SetVisible(Value: Boolean);
begin
  FClient.Enabled := Value and inherited IsEnabledLinked and TCustomAction(FClient.Action).Enabled;
end;
{$ENDIF}


{TdxStoredSideItem}
constructor TdxStoredSideItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCaption := LoadStr(DXSB_DEFAULTITEMCAPTION);
  FLargeImage := -1;
  FSmallImage := -1;
  FEnabled := True;
  FAvailableInCustomizeForm := True;
end;

destructor TdxStoredSideItem.Destroy;
begin
  if (FStore <> nil) then
    FStore.RemoveItem(Self);
{$IFDEF DELPHI4}
  if FActionLink <> nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end;
{$ENDIF}

  inherited Destroy;
end;

{$IFDEF DELPHI4}
procedure TdxStoredSideItem.Loaded;
begin
  inherited;
  if Action <> nil then ActionChange(Action, True);
end;
{$ENDIF}

procedure TdxStoredSideItem.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = FPopupMenu) then FPopupMenu := nil;
  if (Operation = opRemove) and (AComponent = FStore) then  Store := nil;
{$IFDEF DELPHI4}
  if (Operation = opRemove) and (AComponent = Action) then Action := nil;
{$ENDIF}
end;

function TdxStoredSideItem.GetParentComponent: TComponent;
begin
  Result := FStore;
end;

function TdxStoredSideItem.HasParent: Boolean;
begin
  HasParent := True;
end;

procedure TdxStoredSideItem.ReadState(Reader: TReader);
begin
  inherited ReadState(Reader);
  if Reader.Parent is TdxSideBarStore then Store := TdxSideBarStore(Reader.Parent);
end;

procedure TdxStoredSideItem.SetParentComponent(AParent: TComponent);
begin
  if not (csLoading in ComponentState) then Store := AParent as TdxSideBarStore;
end;

{$IFDEF DELPHI4}
procedure TdxStoredSideItem.ActionChange(Sender: TObject; CheckDefaults: Boolean);
begin
  if Action is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if not CheckDefaults or (Self.Caption = '') or (Self.Caption = LoadStr(DXSB_DEFAULTITEMCAPTION)) then
        Self.Caption := Caption;
      if not CheckDefaults or (Self.Enabled = True) then
        Self.Enabled := Enabled;
      if not CheckDefaults or (Self.Hint = '') then
        Self.Hint := Hint;
      if not CheckDefaults or (Self.LargeImage = -1) then
        Self.LargeImage := ImageIndex;
    end;
end;

function TdxStoredSideItem.GetActionLinkClass: TdxSideBarItemActionLinkClass;
begin
  Result := TdxSideBarItemActionLink;
end;
{$ENDIF}


{$IFDEF DELPHI4}
function TdxStoredSideItem.GetAction: TBasicAction;
begin
  if FActionLink = nil then Result := nil
  else Result := FActionLink.Action;
end;
{$ENDIF}

{$IFDEF DELPHI4}
procedure TdxStoredSideItem.SetAction(Value: TBasicAction);
begin
  if Value = nil then
  begin
    if FActionLink <> nil then
      FActionLink.Free;
    FActionLink := nil;
  end
  else
  begin
    if FActionLink = nil then
      FActionLink := GetActionLinkClass.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    ActionChange(Value, csLoading in Value.ComponentState);
    Value.FreeNotification(Self);
  end;
end;
{$ENDIF}

procedure TdxStoredSideItem.SetCaption(Value: string);
begin
  if (FCaption <> Value) then begin
    FCaption := Value;
    if (FStore <> nil) then
      FStore.UpdateItem(Self);
  end;
end;

procedure TdxStoredSideItem.SetEnabled(Value: Boolean);
begin
  if (FEnabled <> Value) then begin
    FEnabled := Value;
    if (FStore <> nil) then
      FStore.UpdateItem(Self);
  end;
end;

procedure TdxStoredSideItem.SetHint(Value: string);
begin
  if (FHint <> Value) then begin
    FHint := Value;
    if (FStore <> nil) then
      FStore.UpdateItem(Self);
  end;
end;

procedure TdxStoredSideItem.DoClick(Sender: TObject; Item: TdxSideBarItem);
begin
{$IFDEF DELPHI4}
  if Assigned(FOnClick) then
    FOnClick(Sender, Item)
  else if FActionLink <> nil then FActionLink.Execute;
{$ELSE}
  if Assigned(FOnClick) then FOnClick(Sender, Item);
{$ENDIF}
end;

procedure TdxStoredSideItem.SetCategory(Value: Integer);
begin
  if (csLoading in ComponentState) then
    FCategory := Value
  else
    if (FStore <> nil) and (Value > - 1)
    and (Value < FStore.Categories.Count) then begin
      FCategory := Value;
      FStore.UpdateEditorItem(Self)
    end;
end;

procedure TdxStoredSideItem.SetLargeImage(Value: Integer);
begin
  if (FLargeImage <> Value) then begin
    FLargeImage := Value;
    if (FStore <> nil) then
      FStore.UpdateItem(Self);
  end;
end;

procedure TdxStoredSideItem.SetSmallImage(Value: Integer);
begin
  if (FSmallImage <> Value) then begin
    FSmallImage := Value;
    if (FStore <> nil) then
      FStore.UpdateItem(Self);
  end;
end;

procedure TdxStoredSideItem.SetStore(Value: TdxSideBarStore);
begin
  if (FStore <> Value) then begin
    if (FStore <> nil) then
      FStore.RemoveItem(Self);
    FStore := Value;
    if (FStore <> nil) then begin
      FStore.AddItem(Self);
      if not (csLoading in ComponentState) then
        Category := 0;
    end;
  end;
end;

{$IFDEF DELPHI4}
procedure TdxStoredSideItem.DoActionChange(Sender: TObject);
begin
  if Sender = Action then ActionChange(Sender, False);
end;

function TdxStoredSideItem.IsCaptionStored: Boolean;
begin
  Result := (FActionLink = nil) or not FActionLink.IsCaptionLinked;
end;

function TdxStoredSideItem.IsEnabledStored: Boolean;
begin
  Result := (FActionLink = nil) or not FActionLink.IsEnabledLinked;
end;

function TdxStoredSideItem.IsHintStored: Boolean;
begin
  Result := (FActionLink = nil) or not FActionLink.IsHintLinked;
end;

function TdxStoredSideItem.IsImageIndexStored: Boolean;
begin
  Result := (FActionLink = nil) or not FActionLink.IsImageIndexLinked;
end;
{$ENDIF}


procedure TdxSideBarStoreCustomizeForm.BeginCustomizing;
begin
  Store.FIsCustomizing := True;
end;

procedure TdxSideBarStoreCustomizeForm.EndCustomizing;
begin
  Store.FIsCustomizing := False;
end;


{TdxSideBarStore}
constructor TdxSideBarStore.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FList := TList.Create;
  FBars := TList.Create;
  FCategories := TStoredSideBarItemsStoreStrings.Create(Self);
  FLargeChangeLink := TChangeLink.Create;
  FSmallChangeLink := TChangeLink.Create;
  FLargeChangeLink.OnChange := OnChangeLink;
  FSmallChangeLink.OnChange := OnChangeLink;
  FDefaultLargeImage := -1;
  FDefaultSmallImage := -1;

  Designer := nil;
end;

destructor TdxSideBarStore.Destroy;
begin
  FSmallChangeLink.Free;
  FLargeChangeLink.Free;
  if (Designer <> nil) then
    Designer.Free;
  DestroyItems;
  FCategories.Free;
  FBars.Free;
  FList.Free;
  inherited Destroy;
end;

procedure TdxSideBarStore.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then begin
    if (AComponent = LargeImages) then LargeImages := nil;
    if (AComponent = SmallImages) then SmallImages := nil;
  end;
end;

procedure TdxSideBarStore.DestroyItems;
var
  Item: TdxStoredSideItem;
begin
  while FList.Count > 0 do
  begin
    Item := FList.Last;
    RemoveItem(Item);
    Item.Free;
  end;
end;

{$IFDEF DELPHI3}
procedure TdxSideBarStore.GetChildren(Proc: TGetChildProc; Root: TComponent);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Items[I].Owner = Root then Proc(Items[I]);
end;
{$ELSE}
procedure TdxSideBarStore.GetChildren(Proc: TGetChildProc);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    if Items[I].Owner <> Self then Proc(Items[I]);
end;
{$ENDIF}

procedure TdxSideBarStore.SetName(const Value: TComponentName);
var
  I: Integer;
  OldName, ItemName, NamePrefix: TComponentName;
  item: TdxStoredSideItem;
begin
  OldName := Name;
  inherited SetName(Value);
  if (csDesigning in ComponentState) and (Name <> OldName) then
    for I := 0 to Count - 1 do begin
      item := Items[I];
      if item.Owner = Owner then begin
        itemName := item.Name;
        NamePrefix := itemName;
        if Length(NamePrefix) > Length(OldName) then begin
          SetLength(NamePrefix, Length(OldName));
          if CompareText(OldName, NamePrefix) = 0 then begin
            System.Delete(itemName, 1, Length(OldName));
            System.Insert(Value, itemName, 1);
            try
              item.Name := itemName;
            except
              on EComponentError do
            end;
          end;
        end;
      end;
    end;
  if (Designer <> nil) then
     Designer.SideBarStoreEditorUpdate;
end;

function TdxSideBarStore.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TdxSideBarStore.GetSideBarCount: Integer;
begin
  Result := FBars.Count;
end;

function TdxSideBarStore.GetItem(Index: Integer): TdxStoredSideItem;
begin
  if (Index > -1) and (Index < Count) then
    Result := TdxStoredSideItem(FList[INdex])
  else Result := nil;
end;

function TdxSideBarStore.GetSideBar(Index: Integer): TdxSideBar;
begin
  Result := nil;
  if (Index > -1) and (Index < FBars.Count) then
    Result := TdxSideBar(FBars[Index]);
end;

procedure TdxSideBarStore.SetCategories(Value: TStrings);
var
  I: Integer;
begin
  if (Value.Count = 0) then begin
    Categories.Clear;
    Exit;
  end;
  if (Value.Count < FCategories.Count) then begin
    for I := Value.Count to FCategories.Count - 1 do
      if (GetCountByCategory(FCategories[I]) > 0) then begin
        raise EdxSideBarError.Create(LoadStr(DXSB_CANTDELETEGROUP));
        Exit;
      end;
    while Value.Count < Categories.Count do
       FCategories.Delete(FCategories.Count - 1);
  end else begin
    for I := FCategories.Count to Value.Count - 1 do
       FCategories.Add(Value[I]);
  end;
    for I := 0 to Value.Count - 1 do
       FCategories[I]:= Value[I];
end;

procedure TdxSideBarStore.SetDefaultLargeImage(Value: Integer);
begin
  if (Value >= -1) and (FDefaultLargeImage <> Value) then begin
    FDefaultLargeImage := Value;
    RedrawBars;
  end;
end;

procedure TdxSideBarStore.SetDefaultSmallImage(Value: Integer);
begin
  if (Value >= -1) and (FDefaultSmallImage <> Value) then begin
    FDefaultSmallImage := Value;
    RedrawBars;
  end;
end;

procedure TdxSideBarStore.SetLargeImages(Value: TImageList);
begin
  if (FLargeImages <> Value) then begin
    if (FLargeImages <> nil) and not (csDestroying in  FLargeImages.ComponentState) then
      FLargeImages.UnRegisterChanges(FLargeChangeLink);
    FLargeImages := Value;
    if (FLargeImages <> nil) then
    begin
      FLargeImages.RegisterChanges(FLargeChangeLink);
      FLargeImages.FreeNotification(Self);
    end;
    if not (csDestroying in  ComponentState) then
    begin
      RedrawBars;
      if (Designer <> nil) then
        Designer.SideBarStoreEditorUpdate;
    end;
  end;
end;

procedure TdxSideBarStore.SetSmallImages(Value: TImageList);
begin
  if (FSmallImages <> Value) then begin
    if (FSmallImages <> nil) and not (csDestroying in  FSmallImages.ComponentState) then
      FSmallImages.UnRegisterChanges(FSmallChangeLink);
    FSmallImages := Value;
    if (FSmallImages <> nil) then
    begin
      FSmallImages.RegisterChanges(FSmallChangeLink);
      FSmallImages.FreeNotification(Self);
    end;
    if not (csDestroying in  ComponentState) then
    begin
      RedrawBars;
      if (Designer <> nil) then
        Designer.SideBarStoreEditorUpdate;
    end;  
  end;
end;

function TdxSideBarStore.GetCountByCategory(St: string): Integer;
var
  Index, I: Integer;
begin
  Result := 0;
  Index := FCategories.IndexOf(St);
  if (Index > -1) then
    for I := 0 to Count - 1 do
      if (Items[I].Category = Index) then
        Inc(Result);
end;

function TdxSideBarStore.GetItemByCategory(St: string; Index: Integer): TdxStoredSideItem;
var
  List: TList;
begin
  Result := nil;
  List := TList.Create;
  GetItemsByCategory(St, List);
  if (Index < List.Count) then
    Result := TdxStoredSideItem(List[Index]);
  List.Free;
end;

function TdxSideBarStore.GetItemsByCategory(St: string; List: TList): Integer;
var
  Index, I: Integer;
begin
  List.Clear;
  Index := FCategories.IndexOf(St);
  if (Index > -1) then
    for I := 0 to Count - 1 do
      if (Items[I].Category = Index) then
        List.Add(Items[I]);
  Result := List.Count;
end;

procedure TdxSideBarStore.AddItem(Item: TdxStoredSideItem);
begin
  FList.Add(Item);
end;

procedure TdxSideBarStore.ExchangeItems(Item1, Item2: TdxStoredSideItem);
var
  Index1, Index2: Integer;
begin
  Index1 := FList.IndexOf(Item1);
  Index2 := FList.IndexOf(Item2);
  if (Index1 > -1) and (Index2 > -1) then
    FList.Exchange(Index1, Index2);
end;

procedure TdxSideBarStore.RemoveItem(Item: TdxStoredSideItem);
begin
  RemoveBarItem(Item);
  FList.Remove(Item);
end;

procedure TdxSideBarStore.OnChangeLink(Sender: TObject);
begin
  RedrawBars;
end;

procedure TdxSideBarStore.RedrawBars;
var
  I: Integer;
begin
  for I := 0 to FBars.Count - 1 do
    SideBars[I].Repaint;
end;

procedure TdxSideBarStore.RemoveBarItem(StoredItem: TdxStoredSideItem);
var
  I, j, k: Integer;
begin
  if (csDestroying in ComponentState) then Exit;
  for I := 0 to FBars.Count - 1 do
    if not (csDestroying in SideBars[I].ComponentState)
    and (SideBars[I].Groups <> nil) then
      for j := 0 to SideBars[I].Groups.Count - 1 do begin
         k := 0;
         while k < SideBars[I].Groups[j].Items.Count do begin
           if (SideBars[I].Groups[j].Items[k].StoredItem = StoredItem) then
             SideBars[I].Groups[j].Items[k].Free
           else Inc(k);
         end;
      end;
end;

procedure TdxSideBarStore.UpdateItem(Item: TdxStoredSideItem);
begin
  RedrawBars;
  UpdateEditorItem(Item);
end;

procedure TdxSideBarStore.Customize;
begin
  SideBarCustomize(Self);
end;

procedure TdxSideBarStore.UpdateEditorItem(Item: TdxStoredSideItem);
begin
  if (Designer <> nil) then
     Designer.SideBarStoreEditorUpdateItem(Item);
end;

{TdxSideBarItem}
constructor TdxSideBarItem.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FIsDefault := True;
  FTextHeight := 0;
  FEnabled := True;
  FLargeImage := -1;
  FSmallImage := -1;
end;

destructor TdxSideBarItem.Destroy;
var
  IsSelectedFlag: Boolean;
  Bar: TdxSideBar;
begin
  IsSelectedFlag := False;
  Bar := TdxSideBarItems(Collection).SideBar;
  if (Bar <> nil) and  not (csDestroying in Bar.ComponentState) then begin
    if (Bar.IsEditing) then
      Bar.EndEdit(False);
    if (Bar.FSelectedItem = Self) then
      IsSelectedFlag := True;
    if (Bar.FMouseFocusedItem = Self) then
      Bar.FMouseFocusedItem := nil;
  end;
  if (Bar <> nil) and Assigned(Bar.FOnDeleteItem) then
    Bar.FOnDeleteItem(Bar, Self);
  inherited Destroy;
  if (IsSelectedFlag) then
    Bar.SetSelectedItem(nil);
end;

procedure TdxSideBarItem.Assign(Source: TPersistent);
var
  item: TdxSideBarItem;
begin
  if (Source is TdxSideBarItem) then begin
    item := TdxSideBarItem(Source);
    FStoredItem := item.StoredItem;
    FHint := item.Hint;
    FIsDefault := item.IsDefault;
    FCaption := item.Caption;
    FTag := item.Tag;
    FCustomData := item.CustomData;
    FLargeImage := item.LargeImage;
    FSmallImage := item.SmallImage;
    FEnabled := item.Enabled;
  end else inherited Assign(Source);
end;

function TdxSideBarItem.MakeVisible;
var
  Group: TdxSideGroup;
begin
  Group := TdxSideBarItems(Collection).Group;
  Result := FVisible and Group.Active;
  if not Result and Group.Active then
    Group.TopVisibleItem :=
    TdxSideBarItems(Collection).SideBar.GetTopVisibleToMakeItemVisible(Index);
end;

function TdxSideBarItem.GetCaption: string;
begin
  if (FStoredItem <> nil) and IsDefault then
    Result := FStoredItem.Caption
  else Result := FCaption;
end;

function TdxSideBarItem.GetEnabled: Boolean;
begin
  if (FStoredItem <> nil) and IsDefault then
    Result := FStoredItem.Enabled
  else Result := FEnabled;
end;

function TdxSideBarItem.GetHint: string;
begin
  if (FStoredItem <> nil) and IsDefault then
    Result := FStoredItem.Hint
  else Result := FHint;
end;

function TdxSideBarItem.GetGroup: TdxSideGroup;
begin
  if (Collection <> nil) then
   Result := TdxSideBarItems(Collection).Group
  else Result := nil;
end;

function TdxSideBarItem.GetLargeImage: Integer;
begin
  if (FStoredItem <> nil) and IsDefault then
    Result := FStoredItem.LargeImage
  else Result := FLargeImage;
end;

function TdxSideBarItem.GetSmallImage: Integer;
begin
  if (FStoredItem <> nil) and IsDefault then
    Result := FStoredItem.SmallImage
  else Result := FSmallImage;
end;

procedure TdxSideBarItem.SetCaption(Value: string);
var
  ABar: TdxSideBar;
begin
  if (FCaption <> Value) then begin
    FCaption := Value;
    if (FStoredItem <> nil) and (FCaption <> FStoredItem.Caption) then
      IsDefault := False;
    if (Collection <> nil)  then begin
      ABar := TdxSideBarItems(Collection).SideBar;
      if (ABar <> nil) and (ABar.ActiveGroup <> nil) and Visible then
        ABar.DrawItems;
    end;
  end;
end;

procedure TdxSideBarItem.SetEnabled(Value: Boolean);
var
  ABar: TdxSideBar;
begin
  if (FEnabled <> Value) then
  begin
    FEnabled := Value;
    if (FStoredItem <> nil) and (FEnabled <> FStoredItem.Enabled) then
      IsDefault := False;
    if (Collection <> nil)  then begin
      ABar := TdxSideBarItems(Collection).SideBar;
      if (ABar <> nil) and (ABar.ActiveGroup <> nil) and Visible then
        ABar.DrawItems;
    end;    
  end;
end;

procedure TdxSideBarItem.SetHint(Value: string);
begin
  if (FHint <> Value) then begin
    FHint := Value;
    if (FStoredItem <> nil) and (FHint <> FStoredItem.Hint) then
      IsDefault := False;
  end;
end;

procedure TdxSideBarItem.SetIsDefault(Value: Boolean);
begin
  FIsDefault := Value;
  if (FStoredItem <> nil) and (Value) then begin
    Caption := FStoredItem.Caption;
    Hint := FStoredItem.Hint;
    Enabled := FStoredItem.Enabled;
    LargeImage := FStoredItem.LargeImage;
    SmallImage := FStoredItem.SmallImage;
  end;
end;

procedure TdxSideBarItem.SetLargeImage(Value: Integer);
begin
  if (FLargeImage <> Value) then begin
    FLargeImage := Value;
    if (FStoredItem <> nil) and (FLargeImage <> FStoredItem.LargeImage) then
      IsDefault := False;
    if (Collection <> nil) and
    (TdxSideBarItems(Collection).SideBar.ActiveGroup =
    TdxSideBarItems(Collection).Group) then
      TdxSideBarItems(Collection).SideBar.DrawItems;
  end;
end;

procedure TdxSideBarItem.SetSmallImage(Value: Integer);
begin
  if (FSmallImage <> Value) then begin
    FSmallImage := Value;
    if (FStoredItem <> nil) and (FSmallImage <> FStoredItem.SmallImage) then
      IsDefault := False;
    if (Collection <> nil) and
    (TdxSideBarItems(Collection).SideBar.ActiveGroup =
    TdxSideBarItems(Collection).Group) then
      TdxSideBarItems(Collection).SideBar.DrawItems;
  end;
end;

procedure TdxSideBarItem.SetStoredItem(Value: TdxStoredSideItem);
begin
  if (Value <> FStoredItem) then begin
    FStoredItem := Value;
    if (FStoredItem <> nil) and (Collection <> nil)
    and not (csLoading in TdxSideBarItems(Collection).SideBar.ComponentState) then begin
      FCaption := FStoredItem.Caption;
      FSmallImage := FStoredItem.SmallImage;
      FLargeImage := FStoredItem.LargeImage;
      Tag := FStoredItem.Tag;
      FIsDefault := True;
      TdxSideBarItems(Collection).SideBar.Repaint;
    end;
  end;
end;

{TdxSideBarItems}
constructor TdxSideBarItems.Create(AOwner: TdxSideGroup);
begin
  inherited Create(TdxSideBarItem);
  Group := AOwner;
  SideBar := TdxSideGroups(Group.Collection).SideBar;
end;

procedure TdxSideBarItems.Update(Item: TCollectionItem); 
begin
  if (SideBar <> nil) and (SideBar.Owner <> nil)
  and not (csLoading in SideBar.Owner.ComponentState)
  and (SideBar.ActiveGroup = Group) then
    SideBar.DrawItems;
end;

function TdxSideBarItems.Add: TdxSideBarItem;
begin
  Result := TdxSideBarItem(inherited Add);
end;

function TdxSideBarItems.GetItem(Index: Integer): TdxSideBarItem;
begin
  Result := TdxSideBarItem(inherited Items[Index]);
end;

procedure TdxSideBarItems.SetItem(Index: Integer; Value: TdxSideBarItem);
begin
  Items[Index].Assign(Value);
end;


{TdxSideGroup}
constructor TdxSideGroup.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FItems := TdxSideBarItems.Create(Self);
  FCaption := LoadStr(DXSB_DEFAULTGROUPCAPTION);
  FTopVisibleItem := 0;
  FIconType := dxsgLargeIcon;
  FIsAssigning := False;
  FVisible := True;
  if not (csLoading in TdxSideGroups(Collection).SideBar.ComponentState) then
  begin
    if (TdxSideGroups(Collection).SideBar.FActiveGroup = nil) then
      TdxSideGroups(Collection).SideBar.ActiveGroup := Self;
    TdxSideGroups(Collection).SideBar.Repaint;
  end;
end;

destructor TdxSideGroup.Destroy;
var
  Bar: TdxSideBar;
  IsGroupActive: Boolean;
begin
  FDestroying := True;
  Bar := TdxSideGroups(Collection).SideBar;
  IsGroupActive := Active;
  if Bar <> nil then
  begin
    if Bar.FMouseFocusedGroup = Self then
      Bar.FMouseFocusedGroup := nil;
    if Bar.IsEditing then
      Bar.EndEdit(False);
  end;
  FItems.Free;
  inherited Destroy;
  if (Bar <> nil) and not Bar.FDestroying then
  begin
    if IsGroupActive then
      Bar.ActiveGroup := nil;
    if Bar.ActiveGroup <> nil then
      Bar.FActiveGroupIndex := Bar.GetVisibleIndexByGroup(Bar.ActiveGroup);
    Bar.Repaint;
  end;
end;

procedure TdxSideGroup.MakeActive;
begin
  TdxSideGroups(Collection).SideBar.ActiveGroup := Self;
end;

function TdxSideGroup.GetActive: Boolean;
begin
  Result := TdxSideGroups(Collection).SideBar.ActiveGroup = Self;
end;

function TdxSideGroup.GetItemCount: Integer;
begin
  Result := FItems.Count;
end;

function TdxSideGroup.GetVisibleCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  if (Active) and (FTopVisibleItem > -1) and (Items.Count > 0) then
  begin
    I := FTopVisibleItem;
    while (I < Items.Count) and Items[I].Visible do
    begin
      Inc(I);
      Inc(Result);
    end;
  end;
end;

procedure TdxSideGroup.SetCaption(Value: string);
var
  Bar: TdxSideBar;
  SFont: TFont;
begin
  if (FCaption <> Value) then begin
    FCaption := Value;
    if FIsAssigning then Exit;
    Bar := TdxSideGroups(Collection).SideBar;
    if (Bar <> nil) and
    not ((csLoading in Bar.ComponentState) or (csDestroying in Bar.ComponentState)) then begin
      if Assigned(Bar.OnChangeGroupCaption) then
        Bar.OnChangeGroupCaption(Self, Self);
        // ReAssign CanvasDC and Font !!! 
        Bar.FCanvasDC := Bar.Canvas.Handle;
        SFont := Bar.Canvas.Font;
        Bar.Canvas.Font := Bar.GroupFont;
        Bar.DrawGroup(Index);
        Bar.Canvas.Font := SFont;
    end;
  end;
end;

procedure TdxSideGroup.SetIconType(Value: TdxSideGroupIconType);
var
  ABar: TdxSideBar;
begin
  if (FIconType <> Value) then begin
    FIconType := Value;
    if (TopVisibleItem <> 0) then
      TopVisibleItem := 0;
    if FIsAssigning then Exit;
    ABar := TdxSideGroups(Collection).SideBar;
    if (ABar <> nil) and
    not (csLoading in ABar.ComponentState)
    and (Self = ABar.ActiveGroup) then
      ABar.DrawItems;
  end;
end;

procedure TdxSideGroup.SetItems(Value: TdxSideBarItems);
begin
  FTopVisibleItem := 0;
  FItems.Assign(Value);
  if (FItems.Count > 0) then
    FTopVisibleItem := 0;
end;

procedure TdxSideGroup.SetTopVisibleItem(Value: Integer);
var
  Bar: TdxSideBar;
begin
  if (FTopVisibleItem <> Value)
  and (Value > -1) and (Value < Items.Count) then begin
    FTopVisibleItem := Value;
    Bar := TdxSideGroups(Collection).SideBar;
    if (Bar <> nil) and
    not (csLoading in Bar.ComponentState)
    and (Bar.ActiveGroup = Self) then
     Bar.DrawItems;
  end;
end;

procedure TdxSideGroup.SetVisible(Value: Boolean);
var
  Bar: TdxSideBar;
begin
  if (FVisible <> Value) then
  begin
    FVisible := Value;
    Bar := TdxSideGroups(Collection).SideBar;
    if (Bar <> nil) and not (csLoading in Bar.ComponentState) then
      Bar.SetActiveGroup(Bar.ActiveGroup);
  end;
end;

procedure TdxSideGroup.Assign(Source: TPersistent);
begin
  if (Source is TdxSideGroup) then begin
    FIsAssigning := True;
    Caption := TdxSideGroup(Source).Caption;
    IconType := TdxSideGroup(Source).IconType;
    Visible := TdxSideGroup(Source).Visible;
    SetItems(TdxSideGroup(Source).Items);
    FIsAssigning := False;
  end
  else inherited Assign(Source);
end;


{TdxSideGroups}
constructor TdxSideGroups.Create(AOwner: TdxSideBar);
begin
  inherited Create(TdxSideGroup);
  SideBar := AOwner;
end;

function TdxSideGroups.Add: TdxSideGroup;
begin
  Result := TdxSideGroup(inherited Add);
end;

function TdxSideGroups.GetItem(Index: Integer): TdxSideGroup;
begin
  Result := TdxSideGroup(inherited Items[Index]);
end;

function TdxSideGroups.GetVisibleItem(Index: Integer): TdxSideGroup;
var
  I: Integer;
  j: Integer;
begin
  Result := nil;
  j := 0;
  for I := 0 to Count - 1 do
  begin
    if (Items[I].Visible) then
    begin
      if (Index = j) then
        Result := Items[I];
      Inc(j);
    end;
  end;
end;

function TdxSideGroups.GetVisibleCount: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Count - 1 do
    if (Items[I].Visible) then
      Inc(Result);
end;

procedure TdxSideGroups.SetItem(Index: Integer; Value: TdxSideGroup);
begin
  Items[Index].Assign(Value);
end;

procedure TdxSideGroups.Update(Item: TCollectionItem);
begin
  if (SideBar <> nil) and (SideBar.Owner <> nil)
  and not (csLoading in SideBar.Owner.ComponentState)
  and not (csDestroying in SideBar.ComponentState)
  and (Count > 0) then begin
    if (SideBar.FActiveGroup = nil) or (SideBar.FActiveGroup.FDestroying) then
      SideBar.ActiveGroup := Items[0]
    else SideBar.Repaint;
  end;
end;


{TdxSideBarBackGround}
constructor TdxSideBarBackGround.Create;
begin
  inherited Create;
  FBeginColor := clGrayText;
  FEndColor := clGrayText;
  FFillStyle := bfsNone;
  FStep := 2;
end;

function TdxSideBarBackGround.IsUsed: Boolean;
begin
  Result := (FFillStyle <> bfsNone) and (FBeginColor <> EndColor);
end;

procedure TdxSideBarBackGround.SetBeginColor(Value: TColor);
begin
  if (FBeginColor <> Value) then begin
    FBeginColor := Value;
    DoChange;
  end;
end;

procedure TdxSideBarBackGround.SetEndColor(Value: TColor);
begin
  if (FEndColor <> Value) then begin
    FEndColor := Value;
    DoChange;
  end;
end;

procedure TdxSideBarBackGround.SetFillStyle(Value: TdxSideBarFillStyle);
begin
  if (FFillStyle <> Value) then begin
    FFillStyle := Value;
    DoChange;
  end;
end;

procedure TdxSideBarBackGround.SetStep(Value: Integer);
begin
  if (Value <> FStep) and (Value > 0) then
  begin
    FStep := Value;
    DoChange;
  end;
end;

procedure TdxSideBarBackGround.DoChange;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

{TSideBarRenameEdit}
type
TSideBarRenameEdit = class(TEdit)
private
  procedure WMKeyDown(var Message: TMessage); message WM_KEYDOWN;
protected
  procedure CreateParams(var Params: TCreateParams); override;
  procedure KeyPress(var Key: Char); override;
end;

procedure TSideBarRenameEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or WS_BORDER;
  if (TdxSideBar(Owner).FRenameItem <> nil) then begin
    if (TdxSideBar(Owner).ActiveGroup.IconType = dxsgLargeIcon) then
      Params.Style := Params.Style or   ES_MULTILINE or ES_CENTER or ES_AUTOHSCROLL
    else Params.Style := Params.Style or ES_LEFT or ES_AUTOHSCROLL;
  end;
end;

procedure TSideBarRenameEdit.KeyPress(var Key: Char);
var
  r: TRect;
  St: string;
begin
  inherited KeyPress(Key);
  if (TdxSideBar(Owner).FRenameItem <> nil) then begin
    if (TdxSideBar(Owner).ActiveGroup.IconType = dxsgLargeIcon) then
      St := Text + Key
    else St := '';  
    r:= TdxSideBar(Owner).GetItemTextRect(TdxSideBar(Owner).FRenameItem.Index, St);
    if (Left <> r.Left) or (Width <> r.Right - r.Left)
    or (Height <> r.Bottom - r.Top) or (Top <> r.Top) then begin
      Top := r.Top;
      Left := r.Left;
      Width := r.Right - r.Left;
      Height := r.Bottom - r.Top;
    end;
  end;
end;

procedure TSideBarRenameEdit.WMKeyDown(var Message: TMessage);
begin
  if (Message.wparam = VK_RETURN) or (Message.wparam = VK_ESCAPE) then begin
     TdxSideBar(Owner).EndEdit(Message.wparam = VK_RETURN);
     Exit;
  end;
  inherited;
end;

procedure ScrollButtonsTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  Bar: TdxSideBar;
begin
  Bar := TdxSideBar(FindControl(wnd));
  if Bar = nil then Exit;
  if Bar.FScrollButtonUpIsDown or Bar.FScrollButtonDownIsDown then begin
   Bar.FDestDropItemIndex := nil;
   Bar.FIsDropBottom := True;
   if Bar.FScrollButtonUpIsDown then
      Bar.ActiveGroup.TopVisibleItem:= Bar.ActiveGroup.TopVisibleItem - 1;
    if Bar.FScrollButtonDownIsDown then
     Bar.ActiveGroup.TopVisibleItem:= Bar.ActiveGroup.TopVisibleItem + 1;
  end else begin //!!! Kill itself !!!
    KillTimer(Bar.Handle, Bar.FScrollTimerID);
    Bar.FScrollTimerID := -1;
  end;
end;

procedure HintTimerProc(Wnd: HWnd; Msg, TimerID, SysTime: Longint); stdcall;
var
  Bar: TdxSideBar;
begin
  Bar := TdxSideBar(FindControl(wnd));
  if Bar = nil then Exit;
  Bar.HintActivate(False);
  Bar.Hint := '';
  Bar.ShowHint := True;  
  KillTimer(Bar.Handle, Bar.FHintTimerID);
  Bar.FHintTimerID := -1;
end;


{TdxSideBar}
constructor TdxSideBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle - [csSetCaption, csAcceptsControls]
               + [csDesignInteractive];
  FGroups := TdxSideGroups.Create(Self);
  FGroupFont := TFont.Create;
  FItemFont := TFont.Create;
  FImageList := TImageList.Create(Self);
  FItemFont.Color := clWhite;
  FBkPicture := TPicture.Create;
  FBkPicture.OnChange := DoBkPictureChange;
  Color := clGrayText;
  FBkGround := TdxSideBarBackGround.Create;
  FBkGround.OnChange := DoBkPictureChange;

  FActiveGroupIndex := 0;
  FActiveGroup := nil;
  FScrollTimerID := -1;
  FHintTimerID := -1;
  FSpaceHeight := 7;
  FScrollDelay := 300;
  BevelInner := bvNone;
  BevelOuter := bvNone;

  FLargeChangeLink := TChangeLink.Create;
  FSmallChangeLink := TChangeLink.Create;
  FLargeChangeLink.OnChange := OnChangeLink;
  FSmallChangeLink.OnChange := OnChangeLink;

  Align := alLeft;
  Height := 300;
  Width := 150;
  FDestDropItemIndex := nil;
  FEnableDraging := False;
  FIsDropBottom := True;
  FTransparentImages := False;
  FAssignFlag := False;
  FOldActiveGroupIndex := -1;
  FCanSelected := False;
  FHintWindow := THintWindow.Create(Self);
  FHintWindowShowing := False;
  FPaintStyle := sbpsFlat;
  FGroupHeightOffSet := 0;
  FDestroying := False;

  FVisibleGroups := TList.Create;
  FShowGroups := True;
end;

destructor TdxSideBar.Destroy;
begin
  if StoreInRegistry and not (csDesigning in ComponentState) and (RegistryPath <> '') then
    SaveToRegistry(RegistryPath);

  FDestroying := True;  
  FLargeChangeLink.Free;
  FSmallChangeLink.Free;

  Store := nil;
  FHintWindow.Free;
  FImageList.Free;
  FGroupFont.Free;
  FItemFont.Free;
  FGroups.Free;
  FBkPicture.Free;
  FBkGround.Free;

  FVisibleGroups.Free;
  inherited Destroy;
end;

procedure TdxSideBar.Loaded;
begin
  inherited Loaded;
  {load from registry}
  if StoreInregistry and not (csDesigning in ComponentState) and (RegistryPath <> '') then
    LoadFromRegistry(RegistryPath);
  if (ActiveGroup = nil) then
    ActiveGroupIndex := 0;
end;

procedure TdxSideBar.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then begin
    if (AComponent = FGroupPopupMenu) then FGroupPopupMenu := nil;
    if (AComponent = FItemPopupMenu) then FItemPopupMenu := nil;
    if (AComponent = FStore) then Store := nil;
    if (AComponent = LargeImages) then LargeImages := nil;
    if (AComponent = SmallImages) then SmallImages := nil;
  end
end;


procedure TdxSideBar.Assign(Source: TPersistent);
begin
  if (Source is TdxSideBar) then begin
    FAssignFlag := True;
    FMouseFocusedGroup := nil;
    Store := TdxSideBar(Source).Store;
    SetGroups(TdxSideBar(Source).Groups);
    SmallImages := TdxSideBar(Source).SmallImages;
    LargeImages := TdxSideBar(Source).LargeImages;
    FAssignFlag := False;
    Repaint;
  end;

end;

function TdxSideBar.GetGroupCount: Integer;
begin
  Result := FGroups.Count;
end;

procedure TdxSideBar.SetActiveGroup(Value: TdxSideGroup);
var
  OldVisibleCount: Integer;
{$IFDEF DELPHI4}
  I: Integer;
{$ENDIF}  
begin
  {$IFDEF DELPHI4}
  if Store <> nil then
    for I := 0 to Store.Count - 1 do
      with Store.Items[I] do
        if FActionLink <> nil then FActionLink.Update;
  {$ENDIF}

  if (Value <> nil) and not Value.Visible then
    Value := nil;
  OldVisibleCount := FVisibleGroups.Count;

  UpdateVisibleGroups;
  if ((FActiveGroup <> Value) or (OldVisibleCount <> FVisibleGroups.Count))
    and not (csDestroying in ComponentState) then
  begin
    DoItemMouseFocused(nil, False);

    SetMouseFocusedItem(nil);
    FMouseFocusedItemIsDown := False;
    DestDropItemIndex := nil;
    if (Value = nil) and (FVisibleGroups.Count > 0) then
      FActiveGroup := FVisibleGroups[0]
    else
      FActiveGroup := Value;
    if FActiveGroup <> nil then
    begin
     ActiveGroupIndex := GetVisibleIndexByGroup(FActiveGroup);
     FActiveGroup.FTopVisibleItem := 0;
    end
    else
      ActiveGroupIndex := -1;
    if Assigned(FOnChangeActiveGroup) then
      FOnChangeActiveGroup(Self);
    Repaint;
  end;
end;

procedure TdxSideBar.SetActiveGroupIndex(Value: Integer);
var
  I: Integer;
begin
  UpdateVisibleGroups;
  if (FActiveGroupIndex <> Value) then
  begin
    FOldActiveGroupIndex := FActiveGroupIndex;
    if ((Value < 0) or (Value >= FVisibleGroups.Count)) and (FVisibleGroups.Count > 0) then
      FActiveGroupIndex := 0
    else
    begin
      if (FActiveGroupIndex > -1) and (FActiveGroupIndex < FVisibleGroups.Count) then
         with VisibleGroups[FActiveGroupIndex] do
           for I := 0 to Items.Count - 1 do
           begin
             Items[I].FVisible := False;
             Items[I].FPartialVisible := False;
           end;
      FActiveGroupIndex := Value;
    end;
  end;
  if (FVisibleGroups.Count > 0) and (FActiveGroupIndex < FVisibleGroups.Count) then
    ActiveGroup := FVisibleGroups[FActiveGroupIndex];
end;

procedure TdxSideBar.SetBkGround(Value: TdxSideBarBackGround);
begin
  FBkGround := Value;
  Repaint;
end;

procedure TdxSideBar.SetBkPicture(Value: TPicture);
begin
  FBkPicture.Assign(Value);
end;

procedure TdxSideBar.SetCanSelected(Value: Boolean);
begin
  if (FCanSelected <> Value) then begin
    if (FSelectedItem <> nil) then
      DoItemSelected(nil);
    FCanSelected := Value;      
  end;
end;

procedure TdxSideBar.SetGroupFont(Value: TFont);
begin
  FGroupFont.Assign(Value);
  Repaint;
end;

procedure TdxSideBar.SetGroups(Value: TdxSideGroups);
begin
  FGroups.Assign(Value);
  ActiveGroupIndex := 0;
  Repaint;
end;

procedure TdxSideBar.SetGroupHeightOffSet(Value: Integer);
begin
  if (FGroupHeightOffSet <> Value) and (Value > -1) and (Value < 10) then
  begin
    FGroupHeightOffSet := Value;
    Repaint;
  end;
end;

procedure TdxSideBar.SetItemFont(Value: TFont);
begin
  FItemFont.Assign(Value);
  Repaint;
end;

procedure TdxSideBar.SetLargeImages(Value: TImageList);
begin
  if (FLargeImages <> Value) then begin
    if (FLargeImages <> nil) and not (csDestroying in  FLargeImages.ComponentState) then
      FLargeImages.UnRegisterChanges(FLargeChangeLink);
    FLargeImages := Value;
    if (FLargeImages <> nil) then
    begin
      FLargeImages.RegisterChanges(FLargeChangeLink);
      FLargeImages.FreeNotification(Self);
    end;
    if not (csDestroying in  ComponentState) then
      Repaint;
  end;
end;

procedure TdxSideBar.SetSmallImages(Value: TImageList);
begin
  if (FSmallImages <> Value) then begin
    if (FSmallImages <> nil) and not (csDestroying in  FSmallImages.ComponentState) then
      FSmallImages.UnRegisterChanges(FSmallChangeLink);
    FSmallImages := Value;
    if (FSmallImages <> nil) then
    begin
      FSmallImages.RegisterChanges(FSmallChangeLink);
      FSmallImages.FreeNotification(Self);
    end;
    if not (csDestroying in  ComponentState) then
      Repaint;
  end;
end;

procedure TdxSideBar.SetPaintStyle(Value: TdxsbPaintStyle);
begin
  if (FPaintStyle <> Value) then
  begin
    FPaintStyle := Value;
    if (BorderStyle <> bsNone) then
      BorderStyle := bsNone
    else if HandleAllocated then
      Repaint;
  end;
end;

procedure TdxSideBar.SetStore(Value: TdxSideBarStore);
begin
  if (FStore <> Value) then begin
    if not (csLoading in ComponentState) then
      FGroups.Clear;
    ActiveGroup := nil;
    FMouseFocusedGroup := nil;
    if not (csDestroying in ComponentState) {and (csDesigning in ComponentState)} then
      Invalidate;
    if (FStore <> nil) and not (csDestroying in FStore.ComponentState) then
      FStore.FBars.Remove(Self);
    FStore := Value;
    if (FStore <> nil) then
      FStore.FBars.Add(Self);

  end;
end;

procedure TdxSideBar.SetTransparentImages(Value: Boolean);
begin
  if (FTransparentImages <> Value) then begin
    FTransparentImages := Value;
    Repaint;
  end;
end;

procedure TdxSideBar.SetScrollDelay(Value: Integer);
begin
  if (Value > 0) then
   FScrollDelay := Value;
end;

procedure TdxSideBar.SetShowGroups(Value: Boolean);
begin
  if (FShowGroups <> Value) then
  begin
    FShowGroups := Value;
    Repaint;
  end;
end;

procedure TdxSideBar.SetSpaceHeight(Value: Integer);
begin
  if (FSpaceHeight <> Value) and (Value > 4) then begin
    FSpaceHeight := Value;
    DrawItems;
  end;
end;

procedure TdxSideBar.OnChangeLink(Sender: TObject);
begin
  Repaint;
end;

procedure TdxSideBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  r: TRect;
  p: TPoint;
  FHeight: Integer;
  Group: TdxSideGroup;
  Item: TdxSideBarItem;
begin
  if (csDesigning in ComponentState) then
  begin
    inherited  MouseDown(Button, Shift, X, Y);  
    Exit;
  end;
  if (Button = mbRight) then begin
    PopupMenu := nil;
    item := GetFocusedItem(X, Y);
    if (item <> nil) then begin
      if (item.StoredItem <> nil) and (item.StoredItem.PopupMenu <> nil) then
        PopupMenu := item.StoredItem.PopupMenu
      else PopupMenu := FItemPopupMenu;
    end;
    if (PopupMenu = nil) then
      PopupMenu := FGroupPopupMenu;
  end;

  inherited  MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) then begin
    // IsRenameGroup  or Is RenameItem ?
    if (IsEditing) then begin
      EndEdit(True);
      Exit;
    end;
    r := FPaintRect;
    FHeight := FGroupHeight + 1;
    p.X := X;
    p.Y := Y;
    Group := GetGroupAtPos(p);
    if (Group <> nil) then
    begin
      if (FPaintStyle = sbpsStandard) then
        ActiveGroupIndex := GetVisibleIndexByGroup(Group)
      else DoGroupMouseFocused(Group, True);
    end else begin
     //ScrollButtons ?
     if ShowGroups and ((X >= r.Right - ScrollButtonIndention - 1 - ScrollButtonHeight)
     and (X <= r.Right - ScrollButtonIndention - 1)) then begin
       if FScrollButtonUpIsVisible and not FScrollButtonUpIsDown
       and (Y >= r.Top + (FActiveGroupIndex + 1) * FHeight + ScrollButtonIndention)
       and (Y <= r.Top + (FActiveGroupIndex + 1) * FHeight + ScrollButtonIndention + ScrollButtonHeight) then begin
         FScrollButtonUpIsDown := True;
         FScrollTimerID := SetTimer(Handle, 1, FScrollDelay, @ScrollButtonsTimerProc);
         FActiveGroup.TopVisibleItem:= FActiveGroup.TopVisibleItem - 1;
       end;

       if FScrollButtonDownIsVisible and not FScrollButtonDownIsDown
       and (Y <= r.Bottom - (FVisibleGroups.Count - FActiveGroupIndex) * FHeight - ScrollButtonIndention + 1 + ScrollButtonHeight)
       and (Y >=  r.Bottom - (FVisibleGroups.Count - FActiveGroupIndex) * FHeight - ScrollButtonIndention + 1) then begin
         FScrollButtonDownIsDown := True;
         FScrollTimerID := SetTimer(Handle, 1, FScrollDelay, @ScrollButtonsTimerProc);
         FActiveGroup.TopVisibleItem:= FActiveGroup.TopVisibleItem + 1;
       end
     end else begin
       item := GetFocusedItem(X, Y);
       if (item <> nil) then begin
         DoItemMouseFocused(Item, True);
         if (CanSelected) then
           DoItemSelected(Item);
         FEnableDraging := True;
         FPointDragging.X := X;
         FPointDragging.Y := Y;
       end;
     end;
   end;
 end;
end;

procedure TdxSideBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TdxSideBarItem;
  Group: TdxSideGroup;
begin
  inherited  MouseUp(Button, Shift, X, Y);
  if (csDesigning in ComponentState) then Exit;

  if (GetCapture = Handle) then
    ReleaseCapture;
  if not (Button = mbLeft) or (IsGroupEditing) then Exit;

  if (FPaintStyle = sbpsFlat) and (FMouseFocusedGroup <> nil) then
  begin
    DoGroupMouseFocused(FMouseFocusedGroup, False);
    if (GetGroupAtPos(Point(X, Y)) = FMouseFocusedGroup) then
      ActiveGroupIndex := GetVisibleIndexByGroup(FMouseFocusedGroup)
    else
    begin
      Group := FMouseFocusedGroup;
      FMouseFocusedGroup := nil;
      DrawGroup(GetVisibleIndexByGroup(Group));
    end;
  end;
  if FScrollButtonDownIsDown or FScrollButtonUpIsDown then begin
    FScrollButtonDownIsDown := False;
    FScrollButtonUpIsDown := False;
    DrawScrollButtons;
  end else
  if not Dragging and FEnableDraging then begin
    FEnableDraging := False;
    item := GetFocusedItem(X, Y);
    if (item <> nil) then
       DoItemClick(item);
  end;
end;

procedure TdxSideBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Item, OldItem: TdxSideBarItem;
  Group: TdxSideGroup;
begin
  inherited MouseMove(Shift, X, Y);

  if (FPaintStyle = sbpsFlat) then
  begin
    Group := GetGroupAtPos(Point(X, Y));
    if not (ssLeft in Shift) then
      DoGroupMouseFocused(Group, False)
    else
      if (FMouseFocusedGroup <> Group) then
      begin
        FMouseFocusedGroupIsDown := False;
        if (FMouseFocusedGroup <> nil) then
          DrawGroup(GetVisibleIndexByGroup(FMouseFocusedGroup));
      end else
        if (FMouseFocusedGroup <> nil) then
          DoGroupMouseFocused(FMouseFocusedGroup, True);
  end;
  OldItem := FMouseFocusedItem;
  Item := GetFocusedItem(X, Y);
  if not FEnableDraging then
    DoItemMouseFocused(Item, False);

  if not (csDesigning in ComponentState) and (DragMode = dmAutomatic) and FShowGroups then begin
    if FEnableDraging and (((Item = nil) and (OldItem <> nil))
    or ((Item <> nil) and ((X < FPointDragging.X - 5) or (X > FPointDragging.X + 5)
    or (Y < FPointDragging.Y - 5) or (Y > FPointDragging.Y + 5)))) then begin
      if (FMouseFocusedItem = nil) then
        FMouseFocusedItem := OldItem;
      inherited DragMode := dmAutomatic;
      FEnableDraging := False;
      BeginDrag(True);
    end
    else inherited DragMode := dmManual;
  end;
end;

procedure TdxSideBar.WMEraseBkgnd(var Message: TWmEraseBkgnd);
begin
  if (FActiveGroupIndex = -1) or (FVisibleGroups.Count = 0) then
    inherited
  else Message.Result := 1;
end;

procedure TdxSideBar.WMSetCursor(var Msg: TWMSetCursor);
begin
  if (FMouseFocusedGroup <> nil) then
    SetCursor(Screen.Cursors[dxSideBarGroupCursor])
  else
    inherited;
end;

procedure TdxSideBar.UpdateVisibleGroups;
var
  I: Integer;
begin
  FVisibleGroups.Clear;
  for I := 0 to FGroups.Count - 1 do
    if Groups[I].Visible then
      FVisibleGroups.Add(Groups[I]);
end;

procedure TdxSideBar.Paint;
begin
  if FAssignFlag or IsMakingUpdate then
    Exit;

  UpdateVisibleGroups;

  if (FActiveGroupIndex = -1) or (FVisibleGroups.Count = 0) then
  begin
    Canvas.Brush.Color := Color;
    DrawFillRect(ClientRect);
    Exit;
  end;

  //Make it faster !!!
  FGroupHeight := GetGroupHeight;
  FPaintRect := GetPaintRect;
  FCanvasDC := Canvas.Handle;

  if FPaintStyle = sbpsFlat then
    DrawBorder98;

  if FShowGroups then
  begin
    DrawTopGroups;
    DrawBottomGroups;
    if (FOldActiveGroupIndex <> ActiveGroupIndex)
      and (FOldActiveGroupIndex <> -1) and (ActiveGroup <> nil) then
      MakeGroupScrolling;
  end;

  DrawItems;
end;

procedure TdxSideBar.WndProc(var Message: TMessage);
begin
  if (FHintWindowShowing) then
    with Message do
      if ((Msg >= WM_KEYFIRST) and (Msg <= WM_KEYLAST)) or
        ((Msg = CM_ACTIVATE) or (Msg = CM_DEACTIVATE)) or
        (Msg = CM_APPKEYDOWN) or (Msg = CM_APPSYSCOMMAND) or
        (Msg = WM_COMMAND) or ((Msg > WM_MOUSEMOVE) and
        (Msg <= WM_MOUSELAST)) or (Msg = WM_NCMOUSEMOVE) then
         HintActivate(False);
  inherited WndProc(Message);
end;

function TdxSideBar.GetFontHeight(AFont: TFont): Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, AFont.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight;
end;

function TdxSideBar.GetGroupHeight: Integer;
begin
  if not FShowGroups then
    Result := 0
  else
  begin
    Result := FGroupHeightOffSet * 2;
    if (Result = 0) then
    begin
      if (FPaintStyle = sbpsStandard) then
        Result := 4
      else Result := 8;
    end;
    Inc(Result, GetFontHeight(FGroupFont));
  end;
end;

function TdxSideBar.GetItemHeight: Integer;
begin
  Result := GetFontHeight(FItemFont) + 2;
  if (GetSmallImageHeight > Result) then
    Result := GetSmallImageHeight;
end;

function TdxSideBar.GetGroupRect(Index: Integer): TRect;
var
  r: TRect;
begin
  SetRectEmpty(Result);
  if FShowGroups and (Index > -1) and (Index < FVisibleGroups.Count) then
  begin
     r := FPaintRect;
     Result.Left := r.Left;
     Result.Right := r.Right;
     if (Index <= FActiveGroupIndex) then
       Result.Top := r.Top + Index * (FGroupHeight + 1)
     else
     begin
       Result.Top := r.Bottom - (FVisibleGroups.Count - Index) * (FGroupHeight + 1) - 1;
       if PaintStyle = sbpsFlat then
         Inc(Result.Top);
     end;
     Result.Bottom := Result.Top + FGroupHeight;
  end;
end;

function TdxSideBar.GetTopFirstBottomGroup: Integer;
var
  r: TRect;
begin
  if not FShowGroups then
    Result := FPaintRect.Bottom
  else begin
    if (FActiveGroupIndex + 1 < FVisibleGroups.Count) then begin
      r := GetGroupRect(FActiveGroupIndex + 1);
      Result := r.Top;
    end else begin
      r := FPaintRect;
      if (FPaintStyle = sbpsStandard) then
        Result := r.Bottom - FSpaceHeight
      else Result := r.Bottom - 1;
    end;
  end;  
end;

function TdxSideBar.GetPaintRect: TRect;
var
  dxy: Integer;
begin
  if (PaintStyle = sbpsStandard) then
  begin
    Result := ClientRect;
    if ShowGroups then
    begin
      dxy := BevelWidth;
      if (BorderStyle = bsSingle) then
       Inc(dxy, BorderWidth);
      InflateRect(Result, - dxy,  - dxy);
      Inc(Result.Bottom, 2);
    end;
  end else
  begin
    if ShowGroups then
      SetRect(Result, 1, 1, ClientWidth - 1, ClientHeight)
    else SetRect(Result, 1, 0, ClientWidth - 1, ClientHeight);
  end;
end;

function TdxSideBar.GetLargeImages: TImageList;
begin
  Result := FLargeImages;
  if (Result = nil) and (Store <> nil) then
    Result := Store.FLargeImages;
end;

function TdxSideBar.GetSmallImages: TImageList;
begin
  Result := FSmallImages;
  if (Result = nil) and (Store <> nil) then
    Result := Store.FSmallImages;
end;


function TdxSideBar.GetLargeImageHeight: Integer;
begin
  if (GetLargeImages <> nil) then
    Result := GetLargeImages.Height
  else Result := dxSideBarDefaultLargeImageHeight;
end;

function TdxSideBar.GetLargeImageWidth: Integer;
begin
  if (GetLargeImages <> nil) then
    Result := GetLargeImages.Width
  else Result := dxSideBarDefaultLargeImageWidth;
end;

function TdxSideBar.GetSmallImageHeight: Integer;
begin
  if (GetSmallImages <> nil) then
    Result := GetSmallImages.Height
  else Result := dxSideBarDefaultSmallImageHeight;
end;

function TdxSideBar.GetSmallImageWidth: Integer;
begin
  if (GetSmallImages <> nil) then
    Result := GetSmallImages.Width
  else Result := dxSideBarDefaultSmallImageWidth;
end;

function TdxSideBar.GetVisibleGroup(Index: Integer): TdxSideGroup;
begin
  Result := nil;
  if (Index > -1) and (Index < FVisibleGroups.Count) then
    Result := TdxSideGroup(FVisibleGroups[Index]);
end;

function TdxSideBar.GetVisibleIndexByGroup(AGroup: TdxSideGroup): Integer;
begin
  Result := FVisibleGroups.IndexOf(AGroup);
end;

function GetClippedString(DC: HDC; const S: string; Rect: TRect): string;
var
  Width, Len: Integer;
  Size: TSize;
begin
  if S = '' then Result := ''
  else
  begin
    Width := Rect.Right - Rect.Left;
    for Len := Length(S) downto 0 do
    begin
      GetTextExtentPoint32(DC, PChar(Copy(S, 1, Len)), Len, Size);
      if Size.cX <= Width then Break;
    end;
    Result := Copy(S, 1, Len);
  end;
end;

procedure TdxSideBar.DrawGroup(Index: Integer);
var
  r, r1: TRect;
  rgn, rgn1: HRGN;
  FGroupRect: TRect;
  DrawCaption: string;
begin
  if FShowGroups and (Index > - 1) and (Index < FVisibleGroups.Count)
    and not ((FRenameGroup <> nil) and (GetVisibleIndexByGroup(FRenameGroup) = Index)) then
  begin
    FGroupRect := GetGroupRect(Index);
    if Index <> FActiveGroupIndex then
    begin
      Canvas.Brush.Color := Color;
      with FGroupRect do
        SetRect(r, Left, Bottom, Right, Bottom + 1);
      DrawFillRect(r);
      Canvas.Brush.Color := clBtnFace;
    end;

    if (FPaintStyle = sbpsStandard) then
    begin
      r := DrawButtonFace(Canvas, FGroupRect, 1, bsNew, True, False, False);
      DrawCaption := GetClippedString(FCanvasDC, VisibleGroups[Index].Caption, r);
      DrawText(FCanvasDC, PChar(DrawCaption), Length(DrawCaption), r, DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS);
    end
    else
    begin
      Canvas.Brush.Color := clBtnFace;
      Canvas.Font := FGroupFont;
      FCanvasDC := Canvas.Handle;
      r := FGroupRect;

      InflateRect(r, -1, -1);
      r1 := r;
      DrawText(FCanvasDC, PChar(VisibleGroups[Index].Caption),
             Length(VisibleGroups[Index].Caption), r1, DT_CENTER or DT_VCENTER or DT_SINGLELINE or DT_END_ELLIPSIS);
      DrawText(FCanvasDC, PChar(VisibleGroups[Index].Caption),
             Length(VisibleGroups[Index].Caption), r1, DT_CENTER or DT_VCENTER or DT_CALCRECT or DT_END_ELLIPSIS);
      if (r1.Right > r.Right) then
      begin
        r1.Left := r.Left;
        r1.Right := r.Right;
      end;
      OffSetRect(r1, ((r.Right - r.Left) - (r1.Right - r1.Left)) div 2,
        ((r.Bottom - r.Top) - (r1.Bottom - r1.Top)) div 2);
      rgn := CreateRectRgnIndirect(r);
      rgn1 := CreateRectRgnIndirect(r1);
      CombineRgn(rgn, rgn, rgn1, RGN_XOR);

      PaintRgn(FCanvasDC, rgn);
      DeleteObject(rgn1);
      DeleteObject(rgn);

      InflateRect(r, 1, 1);
      if (FMouseFocusedGroup <> nil) and (GetVisibleIndexByGroup(FMouseFocusedGroup) = Index) then
      begin
        if not FMouseFocusedGroupIsDown then
        begin
          DrawEdge(FCanvasDC, r, BDR_RAISEDINNER, BF_TOPLEFT);
          DrawEdge(FCanvasDC, r, BDR_RAISEDOUTER, BF_BOTTOMRIGHT);
          InflateRect(r, -1, -1);
          DrawEdge(FCanvasDC, r, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
          Dec(r.Bottom);
          Dec(r.Right);
        end
        else
        begin
          DrawEdge(FCanvasDC, r, BDR_SUNKENINNER, BF_TOPLEFT);
          DrawEdge(FCanvasDC, r, BDR_SUNKENOUTER, BF_BOTTOMRIGHT);
          InflateRect(r, -1, -1);
          DrawEdge(FCanvasDC, r, BDR_SUNKENOUTER, BF_TOPLEFT);
          Inc(r.Top);
          Inc(r.Left);
        end;
      end
      else
      begin
        DrawEdge(FCanvasDC, r, BDR_RAISEDINNER, BF_TOPLEFT);
        DrawEdge(FCanvasDC, r, BDR_RAISEDINNER, BF_BOTTOMRIGHT);
      end;
      if Index = GroupCount - 1 then
        DrawBorder98;
    end;
  end;
end;

procedure TdxSideBar.DrawTopGroups;
var
  I ,Index: Integer;
  SFont: TFont;
  r: TRect;
  rgn, rgn1: HRGN;
begin
  if not FShowGroups then Exit;

  SFont := Canvas.Font;
  Canvas.Font := GroupFont;
  Index := FActiveGroupIndex;

  if FPaintStyle = sbpsStandard then
  begin
    Canvas.Brush.Color := Color;
    r := GetGroupRect(ActiveGroupIndex);
    I := r.Bottom;
    SetRect(r, r.Left - 1, 0, 1, I);
    rgn := CreateRectRgnIndirect(r);
    SetRect(r, r.Left, 0, ClientWidth, 1);
    rgn1 := CreateRectRgnIndirect(r);
    CombineRgn(rgn, rgn, rgn1, RGN_OR);
    DeleteObject(rgn1);
    SetRect(r, ClientWidth - 1, 0, ClientWidth, I);
    rgn1 := CreateRectRgnIndirect(r);
    CombineRgn(rgn, rgn, rgn1, RGN_OR);
    PaintRgn(Canvas.Handle, rgn);
    DeleteObject(rgn1);
    DeleteObject(rgn);
    Canvas.Brush.Color := clBtnFace;
  end;

  if (FOldActiveGroupIndex > -1) and
  (FOldActiveGroupIndex < Index) then
    Index := FOldActiveGroupIndex;
  for I := 0 to Index do
    DrawGroup(I);
  Canvas.Font := SFont;
end;

procedure TdxSideBar.DrawBottomGroups;
var
  I, Index: Integer;
  SFont: TFont;
  r: TRect;
  rgn, rgn1: HRGN;
begin
  if not FShowGroups then Exit;

  SFont := Canvas.Font;
  Canvas.Font := GroupFont;
  Index := FActiveGroupIndex;
  if (FPaintStyle = sbpsStandard) then
  begin
    Canvas.Brush.Color := Color;
    r := GetGroupRect(FVisibleGroups.Count - 1);
    SetRect(r, r.Left - 1, GetTopFirstBottomGroup, 1, r.Bottom + 1);
    rgn := CreateRectRgnIndirect(r);
    SetRect(r, ClientWidth - 1, r.Top, ClientWidth, r.Bottom);
    rgn1 := CreateRectRgnIndirect(r);
    CombineRgn(rgn, rgn, rgn1, RGN_OR);
    PaintRgn(Canvas.Handle, rgn);
    DeleteObject(rgn1);
    DeleteObject(rgn);
    Canvas.Brush.Color := clBtnFace;
  end;
  if (FOldActiveGroupIndex > Index) then
    Index := FOldActiveGroupIndex;
  for I := Index + 1 to FVisibleGroups.Count - 1 do
    if (I <> FOldActiveGroupIndex) then DrawGroup(I);
  Canvas.Font := SFont;
end;

function TdxSideBar.GetItemTop(Index: Integer): Integer;
var
  I: Integer;
  r: TRect;
begin
  Result := -1;
  r := FPaintRect;
  if FShowGroups then
  begin
    Inc(r.Top,  (ActiveGroupIndex + 1) * (FGroupHeight + 1));
    Dec(r.Bottom, (FVisibleGroups.Count - 1 -  ActiveGroupIndex)* (FGroupHeight + 1));
  end;
  if (FActiveGroup.IconType = dxsgLargeIcon) then begin
    r.Top := r.Top + (Index - FActiveGroup.FTopVisibleItem) *
        (GetLargeImageHeight + FSpaceHeight * 2 + FSpaceHeight div 2);
    for I := FActiveGroup.FTopVisibleItem to Index - 1 do
       Inc(r.Top, FActiveGroup.Items[I].FTextHeight);
  end else begin
     r.Top := r.Top + (Index - FActiveGroup.FTopVisibleItem) *
        (FItemHeight + FSpaceHeight * 2);
   end;
   if (r.Bottom > r.Top + FSpaceHeight ) then
    Result := r.Top;
end;

function TdxSideBar.GetItemImageRect(Index: Integer): TRect;
var
  FTop: Integer;
begin
  Result := GetItemPaintedImageRect(Index);
  FTop := GetTopFirstBottomGroup;
  if (Result.Bottom + FSpaceHeight > FTop) then
     Result.Bottom := FTop - FSpaceHeight;
end;

function TdxSideBar.GetItemPaintedImageRect(Index: Integer): TRect;
var
  y: Integer;
begin
  SetRectEmpty(Result);
  y := GetItemTop(Index);
  if (y = -1) then  Exit;
  Result := FPaintRect;
  Result.Top := y + FSpaceHeight;
  if (FActiveGroup.IconType = dxsgLargeIcon) then begin
    Result.Bottom := Result.Top + GetLargeImageHeight;
    Inc(Result.Left, (Result.Right - Result.Left -  GetLargeImageWidth) div 2);
    Result.Right := Result.Left + GetLargeImageWidth;
  end else begin
    if (Result.Top + FItemHeight + FSpaceHeight >= Result.Bottom) then
        SetRectEmpty(Result)
    else begin
      Inc(Result.Left, FSpaceHeight);
      Result.Right := Result.Left + GetSmallImageWidth;
      Result.Top := Result.Top + (FItemHeight - GetSmallImageHeight) div 2;
      Result.Bottom := Result.Top + FItemHeight;
    end;
  end;
end;

function TdxSideBar.GetItemRect(AItem: TdxSideBarItem): TRect;
var
  r1: TRect;
begin
  Result := GetItemImageRect(AItem.Index);
  if ShowGroups then
    InflateRect(Result, 1, 1)
  else begin
    if (FActiveGroup.IconType = dxsgLargeIcon) then
    begin
      r1 := GetItemTextRect(AItem.Index, AItem.Caption);
      SetRect(Result, FPaintRect.Left, Result.Top - FSpaceHeight, FPaintRect.Right, r1.Bottom + FSpaceHeight div 2 - 1);
    end else
      SetRect(Result, FPaintRect.Left, Result.Top - FSpaceHeight, FPaintRect.Right, Result.Bottom + FSpaceHeight);
  end;
end;

function TdxSideBar.GetItemTextRect(Index: Integer; St: string): TRect;
var
  FHeight, Flag: Integer;
  r: TRect;
begin
  Result := FPaintRect;
  Result.Top := GetItemTop(Index) + FSpaceHeight;
  if (FActiveGroup.IconType = dxsgLargeIcon) then begin
    Inc(Result.Top, GetLargeImageHeight + FSpaceHeight div 2);
    Dec(Result.Bottom, (FGroupHeight + 1)  * (FVisibleGroups.Count - 1 - FActiveGroupIndex));
  end;
  InflateRect(Result, - FSpaceHeight, 0);
  if (FActiveGroup.IconType = dxsgSmallIcon) then begin
    Inc(Result.Left, FSpaceHeight + FItemHeight);
    Result.Bottom := Result.Top + FItemHeight + 4;
    if (St = '') then
      Exit;
  end;
  r := Result;
  FCanvasDC := Canvas.Handle;
  if (FActiveGroup.IconType = dxsgLargeIcon) then
    Flag := DT_CENTER or DT_WORDBREAK or DT_CALCRECT or DT_EDITCONTROL
  else Flag := DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_CALCRECT or DT_EDITCONTROL;
  FHeight := DrawText(FCanvasDC, PChar(St), Length(St), r, Flag);
  if (FActiveGroup.IconType = dxsgSmallIcon) then begin
    Result.Right := r.Right;
    Exit;
  end;
  if (r.Right > Result.Right) then
    r.Right := Result.Right;
  Inc(Result.Left, (Result.Right - Result.Left + r.Left - r.Right) div 2 - 1);
  Result.Right := Result.Left + r.Right - r.Left + 4;
  Result.Bottom := Result.Top + FHeight + 6;
  InflateRect(Result, 1, 1);
  if (ActiveGroupIndex < FVisibleGroups.Count - 1) then begin
    r.Top := GetTopFirstBottomGroup;
    if (Result.Bottom + FSpaceHeight > r.Top) then
     Result.Bottom := r.Top - FSpaceHeight;
  end;
end;


function TdxSideBar.DrawItemImage(Index: Integer): Boolean;
var
  r, r1, r2: TRect;
  ImageIndex: Integer;
  ImageHandle: HImageList;
  bmp: TBitmap;

  procedure SetImageHandle(AImageList: TImageList);
  begin
    ImageHandle := AImageList.Handle;
    if not (FTransparentImages) then begin
      FImageList.Clear;
      bmp := TBitmap.Create;
      AImageList.GetBitmap(ImageIndex, bmp);
      if (FImageList.Height <> AImageList.Height) then
         FImageList.Height := AImageList.Height;
      if (FImageList.Width <> AImageList.Width) then
        FImageList.Width := AImageList.Width;
      FImageList.BKColor := clNone;
      if (FImageList.Count = 0) then
        FImageList.Add(bmp, nil)
      else FImageList.Replace(0, bmp, nil);
      FImageList.ReplaceMasked(0, bmp,  AImageList.BKColor);
      ImageIndex := 0;
      ImageHandle := FImageList.Handle;
      bmp.Free;
    end;
  end;

  procedure CheckSpace;
  begin
    if (ActiveGroupIndex < FVisibleGroups.Count) then begin
      r1.Top := GetTopFirstBottomGroup;
      if (r.Bottom + FSpaceHeight > r1.Top) then
       Result := False;
    end;
  end;

begin
  Result := False;
  r := GetItemPaintedImageRect(Index);
  if (r.Top = 0) then Exit;
  Result := True;
  FCanvasDC := Canvas.Handle;
  if (FActiveGroup.IconType = dxsgLargeIcon) then begin
    ImageIndex := FActiveGroup.Items[Index].LargeImage;
    if (ImageIndex = -1) or (GetLargeImages = nil) or (ImageIndex >= GetLargeImages.Count) then
    begin
      if (Store <> nil) then
        ImageIndex := Store.FDefaultLargeImage
      else ImageIndex := -1;
    end;
    if (ImageIndex = -1) or (ImageIndex >= GetLargeImages.Count) then
      Exit;
    SetImageHandle(GetLargeImages);
    SetRect(r2, 0, 0, GetLargeImageWidth, GetLargeImageHeight);
  end else begin
    ImageIndex := FActiveGroup.Items[Index].SmallImage;
    if (ImageIndex = -1) or (GetSmallImages = nil) or (ImageIndex >= GetSmallImages.Count) then
    begin
      if (Store <> nil) then
        ImageIndex := Store.FDefaultSmallImage
      else ImageIndex := -1;
    end;
    if (ImageIndex = -1) or (ImageIndex >= GetSmallImages.Count) then
    begin
      CheckSpace;
      Exit;
    end;
    SetImageHandle(GetSmallImages);
    SetRect(r2, 0, 0, GetSmallImageWidth, GetSmallImageHeight);
  end;

  CheckSpace;
  if not Result then
  begin
     r.Bottom := r1.Top - FSpaceHeight;
     if (FActiveGroup.IconType = dxsgSmallIcon) then Exit;
     if (r.Bottom - r.Top > 0) then
       r2.Bottom := r.Bottom - r.Top
     else Exit;
  end;

  ImageList_DrawEx(ImageHandle, ImageIndex, FCanvasDC, r.Left, r.Top, r2.Right,
    r2.Bottom, CLR_NONE, CLR_NONE, ILD_NORMAL);
end;

function  TdxSideBar.GetDrawItemTextHeight(St: string; r: TRect): Integer;
var
  Flag: Integer;
begin
  if (FActiveGroup.IconType = dxsgLargeIcon) then
    Flag := DT_CENTER or DT_WORDBREAK or DT_CALCRECT or DT_EDITCONTROL
  else Flag := DT_CENTER or DT_VCENTER or DT_SINGLELINE or  DT_CALCRECT;
  Result := DrawText(FCanvasDC, PChar(St), Length(St), r, Flag);
end;

{$IFDEF DELPHI4}
const
  DT_END_ELLIPSIS = $8000;
{$ENDIF}

function  TdxSideBar.DrawItemText(Index: Integer): Boolean;
var
  St: string;
  r: TRect;
  FHeight: Integer;
  Flag: Integer;
  OldColor: TColor;
begin
  Result := False;
  St := FActiveGroup.Items[Index].Caption;
  r := FPaintRect;
  r.Top := GetItemTop(Index) + FSpaceHeight;
  if (FActiveGroup.IconType = dxsgLargeIcon) then
    Inc(r.Top, GetLargeImageHeight  + FSpaceHeight div 2);
  Dec(r.Bottom, (FGroupHeight + 1)  * (FVisibleGroups.Count - 1 - FActiveGroupIndex) + 1);
  InflateRect(r, - FSpaceHeight, 0);
  if (FActiveGroup.IconType = dxsgSmallIcon) then begin
    Inc(r.Left, FSpaceHeight + FItemHeight);
    FHeight := FItemHeight;
  end else  FHeight := GetDrawItemTextHeight(St, r);
  if (FHeight <= r.Bottom - r.Top - FSpaceHeight) then
   Result := True;
  if (FActiveGroup.IconType = dxsgLargeIcon) then
    Flag := DT_CENTER or DT_WORDBREAK or DT_EDITCONTROL
  else begin
    Flag := DT_LEFT or DT_VCENTER or DT_SINGLELINE  or DT_END_ELLIPSIS;
    r.Bottom := r.Top + FHeight;
  end;
  Canvas.Brush.Style := bsClear;

  if FActiveGroup.Items[Index].Enabled then
    FHeight := DrawText(Canvas.Handle, PChar(St), Length(St), r, Flag)
  else begin
    OldColor := Canvas.Font.Color;
    Canvas.Font.Color := clbtnHighLight;
    OfFSetrect(r, 1, 1);
    DrawText(Canvas.Handle, PChar(St), Length(St), r, Flag);
    Canvas.Font.Color := clbtnShadow;
    OfFSetrect(r, -1, -1);
    FHeight := DrawText(Canvas.Handle, PChar(St), Length(St), r, Flag);
    Canvas.Font.Color := OldColor;
  end;

  FActiveGroup.Items[Index].FTextHeight := FHeight;
end;

procedure TdxSideBar.DrawItem(Index: Integer);
var
  I: Integer;
  r: TRect;
  SColor: TColor;
  SFont: TFont;
begin
  if (FActiveGroup <> nil) and not IsMakingUpdate
  and (Index >= FActiveGroup.FTopVisibleItem) then
  begin
    FCanvasDC := Canvas.Handle;
    if (FActiveGroup.IconType = dxsgSmallIcon) then
      FItemHeight := GetItemHeight;
    r := FPaintRect;
    r.Top := GetItemTop(Index);
    if (r.Top = -1) then Exit;
    if (FPaintStyle = sbpsStandard) or (Index <> FActiveGroup.FTopVisibleItem)
    or not ShowGroups then
      Dec(r.Top, 1);
    if (FPaintStyle = sbpsFlat) then
    begin
      if ShowGroups then
        Dec(r.Left)
    end else begin
      Dec(r.Top);
      Dec(r.Left);
      Inc(r.Right);
    end;
    if ShowGroups then
    begin
      Dec(r.Bottom, (FGroupHeight + 1)  * (FVisibleGroups.Count - 1 - FActiveGroupIndex));
      if (FPaintStyle = sbpsStandard) or (FActiveGroup.Index = FGroups.Count - 1) then
        Dec(r.Bottom);
    end;
    SColor := Canvas.Brush.Color;
    SFont := Canvas.Font;
    Canvas.Brush.Color := Color;
    Canvas.Font := FItemFont;
    DrawFillRect(r);

    if (FActiveGroup.Items = nil) then Exit;
    for I := 0 to FActiveGroup.Items.Count - 1 do begin
       FActiveGroup.Items[I].FVisible := False;
       FActiveGroup.Items[I].FPartialVisible := False;
    end;
    for I := Index to FActiveGroup.Items.Count - 1 do begin
      if not DrawItemImage(I) then begin
        FActiveGroup.Items[I].FPartialVisible := True;
        Break;
      end else FCanvasDC := Canvas.Handle;
      if (FRenameItem = nil) or (FRenameItem.Index <> I) then
        if not DrawItemText(I) then begin
          FActiveGroup.Items[I].FPartialVisible := True;
          Break;
        end;
      FActiveGroup.Items[I].FVisible := True;
    end;
    Canvas.Brush.Color := SColor;
    Canvas.Font := SFont;

    if ShowGroups then
    begin
      FScrollButtonUpIsVisible := FActiveGroup.FTopVisibleItem > 0;
      FScrollButtonUpIsDown := FScrollButtonUpIsDown and FScrollButtonUpIsVisible;
      FScrollButtonDownIsVisible := (I <> FActiveGroup.Items.Count)
        and (FActiveGroup.FTopVisibleItem <> FActiveGroup.Items.Count - 1);
      FScrollButtonDownIsDown := FScrollButtonDownIsDown and FScrollButtonDownIsVisible;
      DrawScrollButtons;
    end else
      if (FPaintStyle = sbpsFlat) then
        DrawBorder98;
  end;
end;

procedure TdxSideBar.DrawItems;
begin
  if (FActiveGroup <> nil) then begin
    DrawItem(FActiveGroup.FTopVisibleItem);
    if (FSelectedItem <> nil) then
      DoItemSelected(FSelectedItem)
  end;
end;

function TdxSideBar.GetTopVisibleToMakeItemVisible(Index: Integer): Integer;
var
  I: Integer;
  h1, h2: Integer;
  r: TRect;
begin
  Result := FActiveGroup.FTopVisibleItem;
  if (Index <= FActiveGroup.FTopVisibleItem) then
    Result := Index;
  if (Index > FActiveGroup.FTopVisibleItem)
  and (Index < FActiveGroup.Items.Count)
  and not (FActiveGroup.Items[Index].Visible) then begin
    FCanvasDC := Canvas.Handle;
    r := FPaintRect;
    h1 := r.Bottom - r.Top - 2 * FSpaceHeight;
    h2 := 0;
    for I := Index downto FActiveGroup.FTopVisibleItem do begin
      Inc(h2, GetLargeImageHeight + 2 * FSpaceHeight + FSpaceHeight div 2);
      Inc(h2, GetDrawItemTextHeight(FActiveGroup.Items[I].Caption, r));
      if (h2 > h1) then Break;
    end;
    Result := I + 1;
    if Index > Result then
      Inc(Result);
  end;
end;

procedure TdxSideBar.DrawScrollButtons;
Const
  FConstPushed: Array[False..True] of Integer =
  (0, DFCS_PUSHED);
var
  r: TRect;
  FHeight, OldTop, OldBottom, OldLeft: Integer;
begin
  if (ActiveGroup = nil) or (ActiveGroup.Items.Count = 0) or not ShowGroups then Exit;

  r := FPaintRect;

  Dec(r.Right, ScrollButtonIndention + 1);
  r.Left := r.Right - ScrollButtonHeight;
  FHeight := FGroupHeight + 1;
  if (FScrollButtonUpIsVisible) then begin
    OldTop := r.Top;
    OldBottom := r.Bottom;
    OldLeft := r.Left;
    r.Top := r.Top + (FActiveGroupIndex + 1) * FHeight + ScrollButtonIndention - 1;
    r.Bottom := r.Top + ScrollButtonHeight;
    if r.Bottom < GetTopFirstBottomGroup then
      DrawFrameControl(Canvas.Handle, r, DFC_SCROLL,
        DFCS_SCROLLUP or FConstPushed[(dxSideBarDragObject = nil) and FScrollButtonUpIsDown]);
    r.Top := OldTop;
    r.Bottom := OldBottom;
    r.Left := OldLeft;
  end;
  if (FScrollButtonDownIsVisible) then begin
    r.Top := r.Bottom - (FVisibleGroups.Count - FActiveGroupIndex) * FHeight - ScrollButtonIndention + 1;
    r.Bottom := r.Top + ScrollButtonHeight;
    if (r.Top > GetGroupRect(FActiveGroupIndex).Bottom) then
      DrawFrameControl(Canvas.Handle, r, DFC_SCROLL,
        DFCS_SCROLLDOWN or FConstPushed[(dxSideBarDragObject = nil) and FScrollButtonDownIsDown]);
  end;
end;

procedure TdxSideBar.DrawFillRect(ARect: TRect);
begin
  if (FBkPicture.Graphic = nil) or (FBkPicture.Graphic.Empty) then begin
    if (FBkGround.IsUsed) then
      DrawDifColorsOnCanvas(Canvas, FBkGround.BeginColor, FBkGround.EndColor, FBkGround.Step,
          (FBkGround.FillStyle = bfsHorz), ARect, ClientWidth, ClientHeight)
    else Canvas.FillRect(ARect);
  end else DrawBmpOnCanvas(Canvas, FBkPicture, ARect, ClientWidth, ClientHeight);
end;

procedure TdxSideBar.DrawBorder98;
var
  r: TRect;
begin
  SetRect(r, 0, 0, ClientWidth, ClientHeight);
  DrawEdge(FCanvasDC, r, BDR_SUNKENOUTER, BF_TOPLEFT);
  DrawEdge(FCanvasDC, r, BDR_SUNKENOUTER, BF_BOTTOMRIGHT);
  if ShowGroups then
  begin
    SetRect(r, 1, 0, Width - 1, GetTopFirstBottomGroup);
    r.Top := GetGroupRect(FActiveGroupIndex).Bottom;
    if not ((FOldActiveGroupIndex <> ActiveGroupIndex)
    and (FOldActiveGroupIndex <> -1) and (ActiveGroup <> nil)) then
      DrawEdge(FCanvasDC, r, BDR_SUNKENINNER, BF_TOPLEFT)
    else DrawEdge(FCanvasDC, r, BDR_SUNKENINNER, BF_LEFT);
  end;
end;

procedure TdxSideBar.HintActivate(AShow: Boolean);
var
  r: TRect;
  p: TPoint;
  AHint: string;
begin
  FHintWindowShowing := False;
  AShow := AShow and (FMouseFocusedItem <> nil) and (FMouseFocusedItem.Hint <> '');
  if AShow and not Dragging then begin
    if (FMouseFocusedItem.Visible) then
      r := GetItemTextRect(FMouseFocusedItem.Index, FMouseFocusedItem.FCaption)
    else r := GetItemImageRect(FMouseFocusedItem.Index);
    p.Y := r.Bottom + 2;
    p.X := 0;
    p := ClientToScreen(p);
    SetRect(r, 0, 0, Width - 2 * FSpaceHeight, 0);
    AHint := GetShortHint(FMouseFocusedItem.Hint);
    r := FHintWindow.CalcHintRect(r.Right - r.Left, AHint, nil);
    if (FMouseFocusedItem.Group.IconType = dxsgLargeIcon) then
      Inc(p.X , (Width - r.Right + r.Left) div 2)
    else Inc(p.X , FSpaceHeight);
    OffsetRect(r, p.X, p.Y);
    InflateRect(r, 1, 1);
    if (FHintTimerID <> -1) then
      KillTimer(Handle, FHintTimerID);
    FHintWindow.Color := Application.HintColor;
    FHintWindow.ActivateHint(r, AHint);
    FHintWindowShowing := True;
    FHintTimerID := SetTimer(Handle, 1, dxSideBarHintShowDelay, @HintTimerProc);
    ShowHint := False;
    Hint := GetLongHint(FMouseFocusedItem.Hint);
  end else begin
    if (FHintTimerID <> -1) then begin
      KillTimer(Handle, FHintTimerID);
      FHintTimerID := -1;
    end;
    if IsWindowVisible(FHintWindow.Handle) then
     ShowWindow(FHintWindow.Handle, SW_HIDE);
  end;
end;

procedure TdxSideBar.MakeGroupScrolling;
var
  r, rs, r1, r2: TRect;
  FHeight, FStep, FHeightGroups: Integer;
  SFont: TFont;
  FirstTime, NextTime: Integer;
  I: Integer;
begin
  r := FPaintRect;
  r1 := GetGroupRect(FOldActiveGroupIndex);
  r2 := GetGroupRect(FActiveGroupIndex);
  FHeight := 0;
  FStep := dxSideBarGroupScrollStep;
  FHeightGroups := abs(FOldActiveGroupIndex - FActiveGroupIndex) * (FGroupHeight + 1);

  if (r1.Top > r2.Top) then begin
    r.Top := r2.Bottom + 1;
    r.Bottom := r1.Bottom + 1;
    r.Bottom := r1.Bottom;
    DrawGroup(FActiveGroupIndex);
  end else begin
    r.Top := r1.Bottom;
    if (FPaintStyle = sbpsFlat) then
      Inc(r.Top);
    if (FActiveGroupIndex < FVisibleGroups.Count - 1) then
      r.Bottom := GetTopFirstBottomGroup
    else
      if (FPaintStyle = sbpsFlat) then
        Dec(r.Bottom, 1);
  end;

  Canvas.Brush.Color := Color;
  if (FPaintStyle = sbpsFlat) then
    Inc(r.Left);
  rs := r;
  SFont := Canvas.Font;
  Canvas.Font := GroupFont;

  FirstTime := GetTickCount;
  if (r1.Top > r2.Top) then begin
    SetRect(r1, r.Left, r.Top, r.Right, r.Bottom);
    while (FHeight < (r.Bottom - r.Top - FHeightGroups - FStep)) do begin
      r1.Top := rs.Top;
      ScrollWindowEx(Handle, 0, FStep, @r1, @r1, 0, nil, 0);

      rs.Bottom := rs.Top + FStep;
      DrawFillRect(rs);
      Inc(rs.Top, FStep);

      NextTime := GetTickCount;
      if (NextTime - FirstTime) > dxSideBarGroupScrollTimeToIncrement then
      begin
        FirstTime := NextTime;
        Inc(FStep, dxSideBarGroupScrollIncrement);
      end;
      Inc(FHeight, FStep);

    end;

    rs.Bottom := r.Bottom;
    rs.Top := rs.Bottom - FHeightGroups;
    DrawFillRect(rs);
    if (FPaintStyle = sbpsFlat) then
    begin
      for I := FActiveGroupIndex - 1 to  FOldActiveGroupIndex do
      begin
        rs := GetGroupRect(I);
        SetPixel(Canvas.Handle, rs.Left, rs.Bottom, ColorToRGB(Color));
      end;
    end;
    FOldActiveGroupIndex := -1;
    DrawBottomGroups;
  end else begin
    SetRect(r1, r.Left, r.Top, r.Right, r.Bottom);
    while (FHeight < (r.Bottom - r.Top - FHeightGroups - FStep)) do begin
      r1.Bottom := rs.Bottom;
      ScrollWindowEx(Handle, 0, -FStep, @r1, @r1, 0, nil, 0);

      rs.Bottom := r.Bottom - FHeight;
      rs.Top := rs.Bottom - FStep;
      DrawFillRect(rs);

      Inc(FHeight, FStep);
      NextTime := GetTickCount;
      if (NextTime - FirstTime) > dxSideBarGroupScrollTimeToIncrement then
      begin
        FirstTime := NextTime;
        Inc(FStep, dxSideBarGroupScrollIncrement);
      end;
    end;
    r1 := GetGroupRect(FOldActiveGroupIndex);
    rs.Top := r1.Bottom;
    rs.Bottom := rs.Top + FHeightGroups;
    DrawFillRect(rs);
    if (FPaintStyle = sbpsFlat) then
    begin
      for I := FOldActiveGroupIndex to FActiveGroupIndex - 1 do
      begin
        rs := GetGroupRect(I);
        SetPixel(Canvas.Handle, rs.Left, rs.Bottom, ColorToRGB(Color));
      end;
    end;
    FOldActiveGroupIndex := -1;
    DrawTopGroups;
  end;
  if (FPaintStyle = sbpsFlat) then
    DrawBorder98;
  Canvas.Font := SFont;
end;

function TdxSideBar.GetGroupAtPos(p: TPoint): TdxSideGroup;
var
  FHeight, gr: Integer;
  r: TRect;
begin
  if not ShowGroups then
  begin
    Result := nil;
    Exit;
  end;
  r := FPaintRect;
  Dec(r.Bottom, 1);
  FHeight := FGroupHeight + 1;
  gr := -1;

  if (p.X >= r.Left) and (p.X <= r.Right) then begin
    //Top Group ?
    if (p.Y > r.Top) and (p.Y < r.Top + (FActiveGroupIndex + 1) * FHeight) then
      gr := (p.Y - r.Top) div FHeight
    else
    //bottom Group ?
    if (p.Y < r.Bottom) and (FActiveGroupIndex < FVisibleGroups.Count - 1) and
    (p.Y > r.Bottom - (FVisibleGroups.Count - 1 - FActiveGroupIndex) *FHeight) then
      gr := FVisibleGroups.Count - 1 - (r.Bottom - p.Y) div FHeight;
  end;
  if (gr > -1) and (gr < FVisibleGroups.Count) then
    Result := FVisibleGroups[gr]
  else Result := nil;
end;

function TdxSideBar.GetPopupGroup: TdxSideGroup;
var
 p: TPoint;
begin
  GetCursorPos(p);
  p := ScreenToCLient(p);
  Result := GetGroupAtPos(p);
  if (Result = nil) then
    Result := FActiveGroup;
end;

function TdxSideBar.GetItemAtPos(p: TPoint): TdxSideBarItem;
var
  r, r1: TRect;
  I: Integer;
begin
  Result := nil;
  r := FPaintRect;
  if (p.X < r.Left) or (p.X > r.Right) then Exit;

  if (FVisibleGroups.Count > 0) and (FActiveGroup <> nil) then
    for I := FActiveGroup.TopVisibleItem to FActiveGroup.Items.Count - 1 do begin
      r := GetItemImageRect(I);
      if not FShowGroups then
        Dec(r.Top, FSpaceHeight);
      if (p.Y < r.Top) then  Break;
      r1 := GetItemTextRect(I, FActiveGroup.Items[I].Caption);
      if FShowGroups then
      begin
        if (FActiveGroup.IconType = dxsgSmallIcon) then begin
          r.Right := r1.Right;
          if (p.Y >= r.Top) and (p.Y <= r.Bottom) and
          (p.X >= r.Left) and (p.X <= r.Right) then begin
            Result := FActiveGroup.Items[I];
            Break;
          end;
        end else begin
          if ((p.Y >= r.Top) and (p.Y <= r.Bottom) and
          (p.X >= r.Left) and (p.X <= r.Right)) or
          ((p.Y >= r.Bottom) and (p.Y <= r1.Bottom) and
          (p.X >= r1.Left) and (p.X <= r1.Right)) then begin
            Result := FActiveGroup.Items[I];
            Break;
          end;
        end;
      end else
      begin
        if (FActiveGroup.IconType = dxsgSmallIcon) then begin
          Inc(r.Bottom, FSpaceHeight);
          if (p.Y >= r.Top) and (p.Y <= r.Bottom) then begin
            Result := FActiveGroup.Items[I];
            Break;
          end;
        end else begin
          Inc(r1.Bottom, FSpaceHeight div 2);
          if ((p.Y >= r.Top) and (p.Y <= r1.Bottom)) then begin
            Result := FActiveGroup.Items[I];
            Break;
          end;
        end;
      end;
    end;
end;

function TdxSideBar.IsGroupEditing: Boolean;
begin
  Result := FRenameGroup <> nil;
end;

function TdxSideBar.IsItemEditing: Boolean;
begin
  Result := FRenameItem <> nil;
end;

function TdxSideBar.IsEditing: Boolean;
begin
  Result := IsGroupEditing or IsItemEditing;
end;

procedure TdxSideBar.EditGroup(Group: TdxSideGroup);
var
  r: TRect;
begin
  if (FRenameGroup <> nil) or (FRenameItem <> nil) then
    EndEdit(True);
  FRenameGroup := Group;

  FRenameEdit := TSideBarRenameEdit.Create(Self);
  r := GetGroupRect(GetVisibleIndexByGroup(Group));
  with FRenameEdit do begin
    Parent := Self;
    BorderStyle := bsNone;
    OnExit := RenameEditExit;
    Font := FGroupFont;
    Top := r.Top;
    Left := r.Left;
    Width := r.Right - r.Left;
    Height := r.Bottom - r.Top;
    Text := Group.Caption;
    Font := FGroupFont;
    if (Font.Color = clWhite) then
      Font.Color := clBlack;
  end;
  if Assigned(FOnBeforeEdit) then
     FOnBeforeEdit(Self);
  FRenameEdit.SetFocus;
end;

procedure TdxSideBar.EditItem(Item: TdxSideBarItem);
var
  r: TRect;
begin
  if (FRenameGroup <> nil) or (FRenameItem <> nil) then
    EndEdit(True);
  FRenameItem := Item;

  ActiveGroupIndex := GetVisibleIndexByGroup(TdxSideBarItems(Item.Collection).Group);
  Item.MakeVisible;
  FRenameEdit := TSideBarRenameEdit.Create(Self);
  r := GetItemTextRect(Item.Index, Item.Caption);
  with FRenameEdit do begin
    Parent := Self;
    BorderStyle := bsNone;
    OnExit := RenameEditExit;
    Font := FGroupFont;
    Top := r.Top;
    Left := r.Left;
    Width := r.Right - r.Left;
    Height := r.Bottom - r.Top - 2;
    Font := FItemFont;
    if (Font.Color = clWhite) then
      Font.Color := clBlack;
    Text := Item.Caption;
  end;
  if Assigned(FOnBeforeEdit) then
     FOnBeforeEdit(Self);
  FRenameEdit.SetFocus;
  SendMessage(FRenameEdit.Handle, EM_SETSEL, 0, 1000);
end;


procedure TdxSideBar.EndEdit(Accept: Boolean);
begin
  if (FRenameEdit.Text <> '') and Accept then
  begin
    if (FRenameGroup <> nil) then
      FRenameGroup.Caption := FRenameEdit.Text;
    if (FRenameItem <> nil) then
      FRenameItem.Caption := FRenameEdit.Text;
  end;
  if Assigned(FOnAfterEdit) then
    FOnAfterEdit(Self);
  FRenameEdit.Free;
  FRenameEdit := nil;    
  FRenameGroup := nil;
  FRenameItem := nil;
  Invalidate;
end;

procedure TdxSideBar.RenameEditExit(Sender: TObject);
begin
  EndEdit(True);
end;

procedure TdxSideBar.DoItemClick(Item: TdxSideBarItem);
begin
  if (Item <> nil) and not Item.Enabled then Exit;
  if (Item <> nil) and (Item.StoredItem <> nil) then
    Item.StoredItem.DoClick(Self, Item);
  if (Assigned(FOnItemClick))
  and ((Item.StoredItem = nil) or not Assigned(Item.StoredItem.FOnClick)) then
    FOnItemClick(Self, Item);
end;

function TdxSideBar.GetFocusedItem(X, Y: Integer): TdxSideBarItem;
var
  p: TPoint;
begin
  p.X := X;
  p.Y := Y;
  Result := GetItemAtPos(p);
end;

function TdxSideBar.GetItemBottomSpace(Item: Integer): TPoint;
begin
  Result.X := GetItemTop(Item) + FSpaceHeight + FSpaceHeight div 2;
  if (FActiveGroup.IconType = dxsgLargeIcon) then
    Inc(Result.X, GetLargeImageHeight + FActiveGroup.Items[Item].FTextHeight + FSpaceHeight div 2)
  else Inc(Result.X, FItemHeight);
  Result.Y := Result.X + FSpaceHeight  + FSpaceHeight div 2;
end;

function TdxSideBar.GetSpacedItem(X, Y: Integer): Integer;
var
  r: TRect;
  I: Integer;
  p: TPoint;
begin
  Result := -1;
  r := FPaintRect;
  r.Bottom := GetTopFirstBottomGroup;
  if (X < r.Left) or (X > r.Right) or (Y > r.Bottom) then Exit;
  if (FVisibleGroups.Count > 0) and (FActiveGroupIndex > -1) then
    for I := FActiveGroup.TopVisibleItem to FActiveGroup.Items.Count - 1 do begin
      if not FActiveGroup.Items[I].Visible then        Exit;
      p := GetItemBottomSpace(I);
      if (Y < p.X) then     Exit;
      if (Y >= p.X) and (Y <= p.Y) then begin
        Result := I;
        Exit;
      end;
    end;

  if (FActiveGroup.Items.Count > 0)
  and FActiveGroup.Items[FActiveGroup.Items.Count - 1].Visible then
    Result := FActiveGroup.Items.Count - 1;
end;

procedure TdxSideBar.SetMouseFocusedItem(Item: TdxSideBarItem);
begin
  if (Item <> FMouseFocusedItem) then begin
    FMouseFocusedItem := Item;
    if Assigned(FOnChangeFocusedItem) then
      FOnChangeFocusedItem(Self);
  end;
end;

procedure TdxSideBar.SetSelectedItem(Item: TdxSideBarItem);
begin
  if (Item <> FSelectedItem) then begin
    FSelectedItem := Item;
    if Assigned(FOnChangeSelectedItem) then
      FOnChangeSelectedItem(Self);
  end;
end;

procedure TdxSideBar.DoGroupMouseFocused(Group: TdxSideGroup; IsDown: Boolean);
var
  OldGroup: TdxSideGroup;
  OldDown: Boolean;
begin
  if (FMouseFocusedGroup <> Group) or (FMouseFocusedGroupIsDown <> IsDown) then begin
    OldGroup := FMouseFocusedGroup;
    FMouseFocusedGroup := Group;
    OldDown := IsDown;
    FMouseFocusedGroupIsDown := IsDown;
    if (OldGroup <> nil) and ((OldGroup <> Group) or (IsDown = OldDown)) then
      DrawGroup(GetVisibleIndexByGroup(OldGroup));
    if (Group <> nil) and (OldGroup <> Group) then
      DrawGroup(GetVisibleIndexByGroup(Group));
  end;
end;


procedure TdxSideBar.DoItemMouseFocused(Item: TdxSideBarItem; IsDown: Boolean);
var
  r: TRect;
  OldColor: TColor;
  DC: HDC;
  HintFlag: Boolean;

  procedure GetRect;
  begin
    r := GetItemRect(FMouseFocusedItem);
  end;
  
begin
  if (FMouseFocusedItem <> Item) or (FMouseFocusedItemIsDown <> IsDown) then begin
    if (FMouseFocusedItem <> nil) and (FMouseFocusedItem <> Item)
    and(FMouseFocusedItem <> FSelectedItem)
    and (FMouseFocusedItem.Visible or FMouseFocusedItem.FPartialVisible) then begin
      GetRect;
      if ((BkPicture.Graphic = nil) or (BkPicture.Graphic.Empty))
      and not (BkGround.IsUsed) then begin
        OldColor := Canvas.Brush.Color;
        Canvas.Brush.Color := Color;
        Canvas.FrameRect(r);
        Canvas.Brush.Color := OldColor;
      end else begin
        DrawFillRect(r);
        DrawItemImage(FMouseFocusedItem.Index);
        if not FShowGroups then
          DrawItemText(FMouseFocusedItem.Index);
      end;
    end;
    if ShowHint and (Item <> FMouseFocusedItem) then
      HintActivate(False);
    HintFlag := Item <> FMouseFocusedItem;
    SetMouseFocusedItem(Item);
    if  not IsDown and HintFlag then
      HintActivate(True);
    FMouseFocusedItemIsDown := IsDown;
    if (FMouseFocusedItem <> nil) and(FMouseFocusedItem <> FSelectedItem) and FMouseFocusedItem.Enabled
    and (FMouseFocusedItem.Visible or FMouseFocusedItem.FPartialVisible) then
    begin
      GetRect;
      DC := Canvas.Handle;
      if IsDown then
        DrawEdge(DC, R, BDR_SUNKENINNER, BF_BOTTOMRIGHT)
      else DrawEdge(DC, R, BDR_RAISEDOUTER, BF_BOTTOMRIGHT);
      Dec(R.Bottom);
      Dec(R.Right);
      if IsDown then
        DrawEdge(DC, R, BDR_SUNKENINNER, BF_TOPLEFT)
      else DrawEdge(DC, R, BDR_RAISEDINNER, BF_TOPLEFT);
    end;
  end;
end;

procedure TdxSideBar.DoItemSelected(Item: TdxSideBarItem);
var
  r: TRect;
  OldColor: TColor;
  DC: HDC;

  procedure GetRect;
  begin
    r := GetItemRect(FSelectedItem);
  end;

begin
  if not FCanSelected then Exit;
  if (FSelectedItem <> Item) and (FSelectedItem <> nil)
  and (FSelectedItem.Visible or FSelectedItem.FPartialVisible)
  and (FSelectedItem.Collection <> nil)
  and (TdxSideBarItems(FSelectedItem.Collection).Group = ActiveGroup) then begin
    GetRect;
    if ((BkPicture.Graphic = nil) or (BkPicture.Graphic.Empty))
    and not (BkGround.IsUsed) then begin
      OldColor := Canvas.Brush.Color;
      Canvas.Brush.Color := Color;
      Canvas.FrameRect(r);
      Canvas.Brush.Color := OldColor;
    end else begin
      DrawFillRect(r);
      DrawItemImage(FSelectedItem.Index);
      if not FShowGroups then
        DrawItemText(FSelectedItem.Index);
    end;
  end;

  SetSelectedItem(Item);

  if (FSelectedItem <> nil) and (FSelectedItem.Collection <> nil)
  and FSelectedItem.Enabled
  and (FSelectedItem.Visible or FSelectedItem.FPartialVisible)
  and (TdxSideBarItems(FSelectedItem.Collection).Group = ActiveGroup) then begin
    GetRect;
    DC := Canvas.Handle;
    DrawEdge(DC, R, BDR_SUNKENINNER, BF_BOTTOMRIGHT);
    Dec(R.Bottom);
    Dec(R.Right);
    DrawEdge(DC, R, BDR_SUNKENINNER, BF_TOPLEFT);
  end;
end;

procedure TdxSideBar.DoBkPictureChange(Sender: TObject);
begin
  Repaint;
end;

procedure TdxSideBar.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnMouseEnter) then
    FOnMouseEnter(Self);
end;

procedure TdxSideBar.CMMouseLeave(var Message: TMessage);
var
  Group: TdxSideGroup;
begin
  inherited;
  if (dxSideBarDragObject <> nil) then
    DestDropItemIndex := nil
  else DoItemMouseFocused(nil, False);
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
  if (FMouseFocusedGroup <> nil) then
  begin
    Group := FMouseFocusedGroup;
    FMouseFocusedGroup := nil;
    DrawGroup(GetVisibleIndexByGroup(Group));
  end;
end;

procedure TdxSideBar.SetDestDropItemIndex_(Value1: TdxSideBarItem; Value2: Boolean);
var
  p, p1, p2, p3: TPoint;
  dxy, fY: Integer;
  r, r1: TRect;
  OldColor: TColor;
begin
  if (FDestDropItemIndex <> Value1) or(FIsDropBottom <> Value2) then begin
    OldColor := Canvas.Brush.Color;
    r := GetPaintRect;
    if (FPaintStyle = sbpsFlat) then
      InflateRect(r, -1, 0);
    if (FDestDropItemIndex <> nil) and
    (TdxSideBarItems(FDestDropItemIndex.Collection).Group = FActiveGroup) then begin
      Canvas.Brush.Color := Color;
      if FIsDropBottom then
        p :=  GetItemBottomSpace(FDestDropItemIndex.Index)
      else begin
       r1 := GetGroupRect(FActiveGroupIndex);
       p.X := r1.Bottom;
       p.Y := r1.Bottom + FSpaceHeight;
      end;
      r.Top := p.X + 1;
      r.Bottom := p.Y - 1;
      DrawFillRect(r)
    end;
    FDestDropItemIndex := Value1;
    FIsDropBottom := Value2;
    if (FDestDropItemIndex <> nil) then begin
      Canvas.Brush.Color := clBlack;
      if FIsDropBottom then begin
        p :=  GetItemBottomSpace(FDestDropItemIndex.Index);
        dxy := (p.Y - p.X) div 2 - 1;
        p1.Y := p.X + dxy;
      end else begin
       r1 := GetGroupRect(FActiveGroupIndex);
       p.X := r1.Bottom + 1;
       p.Y := r1.Bottom + FSpaceHeight - 1;
       dxy := p.Y - p.X - 1;
       p1.Y := p.X;
      end;
      if (dxy > 7) then dxy := 7;
      if FIsDropBottom then
        p2.Y := p1.Y - dxy + 1
      else p2.Y := p1.Y;
      if FIsDropBottom and (FDestDropItemIndex.Index = FActiveGroup.Items.Count - 1)
      and (FDestDropItemIndex.Index - FActiveGroup.TopVisibleItem  + 1 =
      FActiveGroup.GetVisibleCount) then
        p3.Y := p1.Y
      else p3.Y := p1.Y + dxy - 1;
      fY :=  p2.Y + (p3.Y - p2.Y) div 2;
      p1.X := r.Left + dxy  + 3;
      p2.X := r.Left;
      p3.X := r.Left;
      Canvas.Polyline([p1, p2, p3, p1]);
      Canvas.FloodFill(p2.X + 1, fY, clBlack, fsBorder);
      p1.X := r.Right - dxy  - 4;
      p2.X := r.Right - 1;
      p3.X := r.Right - 1;
      Canvas.Polyline([p1, p2, p3, p1]);
      Canvas.FloodFill(p2.X - 1, fY, clBlack, fsBorder);
      r.Top := p1.Y;
      r.Bottom := r.Top + 1;
      DrawFillRect(r);
    end else FIsDropBottom := True;
    Canvas.Brush.Color := OldColor;
  end;
end;

procedure TdxSideBar.SetDestDropItemIndex(Value: TdxSideBarItem);
begin
  SetDestDropItemIndex_(Value, FIsDropBottom);
end;

procedure TdxSideBar.SetIsDropBottom(Value: Boolean);
begin
  SetDestDropItemIndex_(FDestDropItemIndex, Value);
end;

procedure TdxSideBar.DragOver(Source: TObject; X, Y: Integer; State: TDragState;
    var Accept: Boolean);
var
  p: TPoint;
  Group: TdxSideGroup;
  ItemIndex: Integer;
  r: TRect;

  procedure Doexit;
  begin
    if Assigned(OnDragOver) then
    OnDragOver(Self, Source, X, Y, State, Accept);
    Exit;
  end;

begin
  Accept := False;
  if (dxSideBarDragObject = nil) then begin
    Doexit;
    Exit;
  end;

  if (ActiveGroup = nil) then begin
    Accept := True;
    Doexit;
    Exit;
  end;

  if (FScrollTimerID = -1) then
    FScrollTimerID := SetTimer(Handle, 1, FScrollDelay, @ScrollButtonsTimerProc);
  p.X := X;
  p.Y := Y;
  FScrollButtonUpIsDown := False;
  FScrollButtonDownIsDown := False;
  if FScrollButtonUpIsVisible then begin
    r := GetGroupRect(FActiveGroupIndex);
    r.Top := r.Bottom +  FSpaceHeight +  ScrollButtonHeight;
    if (Y > r.Bottom) and (Y < r.Top) then begin
      FScrollButtonUpIsDown := True;
      Doexit;
      Exit;
    end;
  end;
  if FScrollButtonDownIsVisible then begin
    r.Bottom := GetTopFirstBottomGroup;
    r.Top := r.Bottom -  FSpaceHeight - ScrollButtonHeight;
    if (Y > r.Top) and (Y < r.Bottom) then begin
      FScrollButtonDownIsDown := True;
      DoExit;
      Exit;
    end;
  end;

  Group := GetGroupAtPos(p);
  if (Group <> nil) then begin
    ActiveGroup := Group;
    DoExit;
    Exit;
  end;

  ItemIndex := GetSpacedItem(X, Y);
  if (ItemIndex = -1) and (FActiveGroup.Items.Count > 0)
  and (FActiveGroup.TopVisibleItem = 0) then begin
    r := GetGroupRect(FActiveGroupIndex);
    if (X > r.Left) and (X < r.Right)
    and (Y > r.Bottom) and (Y < r.Bottom + FSpaceHeight) then begin
      FDestDropItemIndex := FActiveGroup.Items[FActiveGroup.TopVisibleItem];
      IsDropBottom := False;
      Accept := True;
      DoExit;
      Exit;
    end else IsDropBottom := True;
  end;
  if (ItemIndex <> -1) then begin
    IsDropBottom := True;
    DestDropItemIndex := FActiveGroup.Items[ItemIndex];
    Accept := True;
  end  else begin
    if (FActiveGroup.Items.Count = 0) then
      Accept := True;
    DestDropItemIndex := nil;
    DoItemMouseFocused(GetFocusedItem(X, Y), False);
  end;
  Doexit;
end;

procedure TdxSideBar.DoEndDrag(Target: TObject; X, Y: Integer);
begin
  if (dxSideBarDragObject <> nil) then
  begin
    dxSideBarDragObject.EndDrag(Target, X, Y);
    if Target = nil then
      Invalidate;
  end;
  inherited;
end;

procedure TdxSideBar.DoStartDrag(var DragObject: TDragObject);
var
  Item: TdxSideBarItem;
  p: TPoint;
begin
  inherited;
  GetCursorPos(p);
  p := ScreenToClient(p);
  Item := FMouseFocusedItem;
  if (Item <> nil) then begin
    dxSideBarDragObject := TdxSideBarDragObject.Create(Self, DragObject, Item, nil);
  end;
end;

procedure TdxSideBar.LoadFromRegistry(ARegistryPath: string);
var
  Registry: TRegistry;

  function GetStoredItemByName(ASt: string): TdxStoredSideItem;
  var
    I: Integer;
  begin
    Result := nil;
    if (ASt <> '') and (Store <> nil)  then
      for I := 0 to Store.Count - 1 do
        if (CompareText(Store.Items[I].Name, ASt) = 0) then
        begin
          Result := Store.Items[I];
          Break;
        end;
  end;


  procedure ReadGroupItems(const AKey: string; AGroup: TdxSideGroup);
  var
    I, ItemCount: Integer;
  begin
    with Registry do
    begin
      if ValueExists('ItemCount') then ItemCount := ReadInteger('ItemCount')
      else ItemCount := 0;
      CloseKey;
      for I := 0 to ItemCount - 1 do
        if OpenKey(AKey + '\Item' + IntToStr(I), False) then
          with AGroup.Items.Add do
            try
              if (Store <> nil) then
                StoredItem := GetStoredItemByName(ReadString('StoredItem'));
              Caption := ReadString('Caption');
              CustomData := ReadString('CustomData');
              Hint := ReadString('Hint');
              IsDefault := ReadBool('IsDefault');
              LargeImage := ReadInteger('LargeImage');
              SmallImage := ReadInteger('SmallImage');
              Tag := ReadInteger('Tag');
            finally
              CloseKey;
            end;
    end;
  end;

var
  AGroupCount: Integer;
  AGroup: TdxSideGroup;
  I: Integer;
  AKey: string;
begin
  Registry := TRegistry.Create;
  with Registry do
    if OpenKey(ARegistryPath, False) then
    begin
      if ValueExists('GroupCount') then AGroupCount := ReadInteger('GroupCount')
      else AGroupCount := 0;

      if (AGroupCount > 0) then
         Groups.Clear;

      for I := 0 to AGroupCount - 1 do
      begin
        AGroup := Groups.Add;
        AKey := ARegistryPath + '\Group' + IntToStr(I);
        if OpenKey(AKey, False) then
        begin
          AGroup.Caption := ReadString('Caption');
          AGroup.IconType := TdxSideGroupIconType(ReadInteger('IconType'));
          ReadGroupItems(AKey, AGroup);
        end;
      end;  
    end;
  Registry.Free;
end;

procedure TdxSideBar.SaveToRegistry(ARegistryPath: string);
var
  Registry, SubRegistry: TRegistry;
  Keys, SubKeys: TStringList;

  procedure WriteGroupItems(const AKey: string; AGroup: TdxSideGroup);
  var
    I: Integer;
  begin
    with Registry do
    begin
      WriteInteger('ItemCount', AGroup.ItemCount);
      CloseKey;
      for I := 0 to AGroup.ItemCount - 1 do
        if OpenKey(AKey + '\Item' + IntToStr(I), True) then
          with AGroup.Items[I] do
          begin
            WriteString('Caption', Caption);
            WriteString('CustomData', CustomData);
            WriteString('Hint', Hint);
            WriteBool('IsDefault', IsDefault);
            WriteInteger('LargeImage', LargeImage);
            WriteInteger('SmallImage', SmallImage);
            WriteInteger('Tag', Tag);
            if (StoredItem <> nil) then
              WriteString('StoredItem', StoredItem.Name);
            CloseKey;
          end;
    end;
  end;

var
  I, j: Integer;
  AKey: string;
begin
  if (ARegistryPath = '') then
    Exit;

  Registry := TRegistry.Create;
  with Registry do
    if OpenKey(ARegistryPath, True) then
    begin
      // delete entire previous data from registry
      Keys := TStringList.Create;
      SubKeys := TStringList.Create;
      SubRegistry := TRegistry.Create;
      try
        GetKeyNames(Keys);
        for I := 0 to Keys.Count - 1 do
        begin
          with SubRegistry do
          begin
            OpenKey(ARegistryPath + '\' + Keys[I], False);
            SubRegistry.GetKeyNames(SubKeys);
            for j := 0 to SubKeys.Count - 1 do DeleteKey(SubKeys[j]);
            CloseKey;
          end;
          DeleteKey(Keys[I]);
        end;
      finally
        SubRegistry.Free;
        SubKeys.Free;
        Keys.Free;
      end;

      // write group count
      WriteInteger('GroupCount', Groups.Count);

      // write Groups
      for I := 0 to GroupCount - 1 do
      begin
        AKey := ARegistryPath + '\Group' + IntToStr(I);
        if OpenKey(AKey, True) then
        begin
          WriteString('Caption', Groups[I].Caption);
          WriteInteger('IconType', Ord(Groups[I].IconType));
          WriteGroupItems(AKey, Groups[I]);
        end;
      end;
    end;
  Registry.Free;
end;

var
  SideBarDragObjectHookKey: HHOOK;

function SideBarDragObjectWinProcKey(code: Integer; wparam: WParam; lparam: LParam): LResult; stdcall;
var
  p: TPoint;
begin
  if (wparam = VK_CONTROL) then begin
    GetCursorPos(p);
    Windows.ScreenToClient(GetCapture, p);
    SendMessage(GetCapture, LongInt(WM_MOUSEMOVE), MK_LBUTTON, MAKELONG(p.X, p.Y));
  end;
  Result := CallNextHookEx(SideBarDragObjectHookKey, code, wparam, lparam);
end;

{ TdxSideBarPopupMenu }
constructor TdxSideBarPopupMenu.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Bar := nil;
  List := TList.Create;
  FOptions := [sbmIconType, sbmAddGroup, sbmRemoveGroup, sbmCustomize,
    sbmRenameGroup, sbmRenameItem, sbmRemoveItem];
end;

destructor TdxSideBarPopupMenu.Destroy;
begin
  DestroyBarItems;
  List.Free;
  inherited Destroy;
end;

procedure TdxSideBarPopupMenu.Popup(X, Y: Integer);
var
  MenuItem: TMenuItem;
const
  Flags: array[TPopupAlignment] of Word = (TPM_LEFTALIGN, TPM_RIGHTALIGN,
    TPM_CENTERALIGN);

  procedure InsertNewMenuItem(const ACaption: string;  AEnabled, AChecked: Boolean; ATag: LongInt);
  begin
    MenuItem := NewItem(ACaption, 0, AChecked, AEnabled, BarMenuClick, 0, '');
    MenuItem.Tag := ATag;
    Items.Insert(List.Count, MenuItem);
    List.Add(MenuItem);
  end;

begin
  if (List.Count > 0) then
     DestroyBarItems;
  Bar := nil;
  if (PopupComponent <> nil) and (PopupComponent is TdxSideBar) then
  begin
    Bar := PopupComponent As TdxSideBar;
    Group := Bar.GetPopupGroup;

    if (Bar.FocusedItem = nil) then
    begin
      if (sbmIconType in FOptions) and (Group <> nil) then begin
        InsertNewMenuItem(LoadStr(DXSB_LARGEICONTYPE), True, Group.IconType = dxsgLargeIcon, -101);
        InsertNewMenuItem(LoadStr(DXSB_SMALLICONTYPE), True, Group.IconType = dxsgSmallIcon, -102);
      end;
      if (sbmAddGroup in FOptions) or (sbmRemoveGroup in FOptions)
      or (sbmRenameGroup in FOptions) then begin
        if (List.Count > 0) then
           InsertNewMenuItem('-', True, False, 0);
        if (sbmAddGroup in FOptions) then
          InsertNewMenuItem(LoadStr(DXSB_ADDGROUP), True, False, -201);
        if (sbmRemoveGroup in FOptions) then
          InsertNewMenuItem(LoadStr(DXSB_REMOVEGROUP), Group <> nil, False, -202);
        if (sbmRenameGroup in FOptions) then
          InsertNewMenuItem(LoadStr(DXSB_RENAMEGROUP), Group <> nil, False, -203);
      end;
      if (sbmCustomize in FOptions) and (Bar <> nil) and (Bar.Store <> nil)
      and (Group <> nil) then begin
        if (List.Count > 0)  and (TMenuItem(List.Last).Caption <> '-') then
          InsertNewMenuItem('-', True, False, 0);
        InsertNewMenuItem(LoadStr(DXSB_CUSTOMIZE), True, False, -401);
      end;
    end else begin
      if (sbmRemoveItem in FOptions) then
         InsertNewMenuItem(LoadStr(DXSB_REMOVEITEM), True, False, -301);
      if (sbmRenameItem in FOptions) then
         InsertNewMenuItem(LoadStr(DXSB_RENAMEITEM), True, False, -302);
    end;
    if (Items.Count > List.Count) and (List.Count > 0)
      and (TMenuItem(List.Last).Caption <> '-') then
      InsertNewMenuItem('-', True, False, 0);
  end;
  inherited Popup(X, Y);
  if Assigned(FOnPopupClose) then
    FOnPopupClose(Self);
end;

procedure TdxSideBarPopupMenu.BarMenuClick(Sender: TObject);
var
  tag: LongInt;
  gr: TdxSideGroup;
  item: TdxSideBarItem;
begin
  if not (Sender is TMenuItem) then Exit;
  tag := TMenuItem(Sender).Tag;
    case tag of
      -101: Group.IconType := dxsgLargeIcon;
      -102: Group.IconType := dxsgSmallIcon;
      -201:
      begin
        gr := Bar.Groups.Add;
        Bar.EditGroup(gr);
      end;
      -202: Group.Free;
      -203: Bar.EditGroup(Group);
      -301:
       begin
         item := Bar.FocusedItem;
         Bar.FMouseFocusedItem := nil;
         item.Free;
       end;
      -302: Bar.EditItem(Bar.FocusedItem);
      -401: if (Bar.Store <> nil) then Bar.Store.Customize;
    end;
  if Assigned(FOnAfterClick) then FOnAfterClick(Self);
end;

procedure TdxSideBarPopupMenu.DestroyBarItems;
var
  MenuItem: TMenuItem;
begin
  if (Bar <> nil) then
  begin
    while List.Count > 0 do begin
      MenuItem := TMenuItem(List[0]);
      List.Remove(MenuItem);
      MenuItem.Free;
    end;
    Bar := nil;
  end;
end;

{TdxSideBarDragObject}
type
  TtmpDragObject = class(TDragControlObject)
  protected
    function GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor; override;
  end;

function TtmpDragObject.GetDragCursor(Accepted: Boolean; X, Y: Integer): TCursor;
var
  wnd: TWinControl;
begin
  if Accepted then begin
    if dxSideBarDragObject.FDeleteItem then
      Result := dxSideBarDragDeleteCursor
      else
      begin
        wnd := FindVCLWindow(Point(X, Y));
        if not (GetKeyState(VK_CONTROL) < 0) and ((dxSideBarDragObject.Item <> nil) or (wnd = nil) or not (wnd is TdxSideBar)) then
          Result := dxSideBarDragCursor
        else
          Result := dxSideBarDragCopyCursor;
      end
   end
   else
     Result := crNoDrop;
   dxSideBarDragObject.FDeleteItem := False;
end;


constructor TdxSideBarDragObject.Create(Control: TControl;
  var DragObject: TDragObject; AItem: TdxSideBarItem; AStoredItem: TdxStoredSideItem);
begin
  inherited Create;
  FDragObject := TtmpDragObject.Create(Control);
  DragObject := FDragObject;
  SideBarDragObjectHookKey := SetWindowsHookEx(WH_KEYBOARD,
   SideBarDragObjectWinProcKey, 0, GetCurrentThreadId);
  FItem := AItem;
  if Item <> nil then
    FStoredItem := Item.StoredItem
  else
    FStoredItem := AStoredItem;
end;

destructor TdxSideBarDragObject.Destroy;
begin
  FDragObject.Free;
  inherited;
end;

function TdxSideBarDragObject.EndDrag(Target: TObject; X, Y: Integer): TdxSideBarItem;
var
  Index: Integer;
  FItem: TdxSideBarItem;
begin
  FItem := nil;
  if (Target <> nil) and (Target is TdxSideBar) then
  with TdxSideBar(Target) do
  begin
    if not FCancelDrag then
    begin
      if ActiveGroup = nil then
        Groups.Add;
      Index := -1;
      if ActiveGroup.Items.Count = 0 then
        Index := 0;
      if (DestDropItemIndex <> nil) then
      begin
        Index := DestDropItemIndex.Index;
        if FIsDropBottom then
          Inc(Index);
      end;
      if (Index > -1) and ((GetKeyState(VK_CONTROL) < 0) or not ((Item <> nil)
        and (ActiveGroup = TdxSideBarItems(Item.Collection).Group)
        and (Item.Index = Index))) then
      begin
        FItem := ActiveGroup.Items.Add;
        if (dxSideBarDragObject.Item <> nil) then
          FItem.Assign(dxSideBarDragObject.Item)
        else FItem.StoredItem := dxSideBarDragObject.StoredItem;
        FItem.Index := Index;
      end
      else
        Index := -1;
      DestDropItemIndex := nil;
      FIsDropBottom := True;

      if (Assigned(FOnDragDropItem)) then
        FOnDragDropItem(Self, Item, FItem, (GetKeyState(VK_CONTROL) < 0));

      if (FItem <> nil) then
        DoItemSelected(FItem);
      if (Item <> nil) and (Index > -1) and not (GetKeyState(VK_CONTROL) < 0) then
        Item.Free;
      FMouseFocusedItem := nil;
    end;
    Invalidate;
  end;

  UnhookWindowsHookEx(SideBarDragObjectHookKey);
  Result := FItem;
  Self.Free;
  dxSideBarDragObject := nil;
end;

initialization
  Classes.RegisterClass(TdxStoredSideItem);
  dxSideBarDragObject := nil;
  Screen.Cursors[dxSideBarDragCursor] := LoadCursor(HInstance, 'dxSideBarDragCursor');
  Screen.Cursors[dxSideBarDragCopyCursor] := LoadCursor(HInstance, 'dxSideBarDragCopyCursor');
  Screen.Cursors[dxSideBarDragDeleteCursor] := LoadCursor(HInstance, 'dxSideBarDragDeleteCursor');
  Screen.Cursors[dxSideBarGroupCursor] := LoadCursor(HInstance, 'DXSIDEBARGROUPCURSOR');

finalization
  {IFDEF DELPHI4}
  DestroyCursor(Screen.Cursors[dxSideBarGroupCursor]);
  DestroyCursor(Screen.Cursors[dxSideBarDragDeleteCursor]);
  DestroyCursor(Screen.Cursors[dxSideBarDragCopyCursor]);
  DestroyCursor(Screen.Cursors[dxSideBarDragCursor]);
  {ENDIF}
end.
