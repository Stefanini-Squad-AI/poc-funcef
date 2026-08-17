{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
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
{   LICENSED TO DISTRIBUTE THE EXPRESSPRINTINGSYSTEM AND            }
{   ALL ACCOMPANYING VCL CONTROLS AS PART OF AN                     }
{   EXECUTABLE PROGRAM ONLY.                                        }
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

unit dxPSfmLnkDsg;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, ComCtrls, Buttons, 
 {$IFDEF DELPHI6}DesignIntf, DesignWindows, {$ELSE} DsgnIntf, DsgnWnds, LibIntf, {$ENDIF}
 {$IFDEF DELPHI4}ImgList, {$ENDIF} dxPSCore, dxPSDsgProxies;

type
  TdxfmReportLinkDesignWindow = class(TDesignWindow)
    pmLinks: TPopupMenu;
    pnlButtons: TPanel;
    btnAdd: TButton;
    btnDelete: TButton;
    btnShowDesigner: TButton;
    miAdd: TMenuItem;
    miDelete: TMenuItem;
    miLine1: TMenuItem;
    miShowDesigner: TMenuItem;
    miLine2: TMenuItem;
    miSelectAll: TMenuItem;
    btnSelectAll: TButton;
    btnRestoreOriginal: TButton;
    btnChangeComponent: TButton;
    miChangeComponent: TMenuItem;
    btnPrintPreview: TButton;
    btnPrint: TButton;
    miPrintPreview: TMenuItem;
    miPrint: TMenuItem;
    btnPageSetup: TButton;
    miPageSetup: TMenuItem;
    miLine3: TMenuItem;
    miCopy: TMenuItem;
    miCut: TMenuItem;
    miPaste: TMenuItem;
    miRestoreDefaults: TMenuItem;
    miLine: TMenuItem;
    miShowButtons: TMenuItem;
    miLine5: TMenuItem;
    ilLinks: TImageList;
    btnMoveUp: TButton;
    btnMoveDown: TButton;
    miMoveUp: TMenuItem;
    miMoveDown: TMenuItem;
    miBackgroundEffects: TMenuItem;
    miAddStandard: TMenuItem;
    N1: TMenuItem;
    miBackgroundClear: TMenuItem;
    N2: TMenuItem;
    btnRestoreDefaults: TButton;
    miRestoreOriginal: TMenuItem;
    miSetAsCurrent: TMenuItem;
    lbxLinks: TListBox;
    miEdit: TMenuItem;
    N3: TMenuItem;
    miBackground: TMenuItem;
    miAddExisting: TMenuItem;
    btnAdd1: TBitBtn;
    pmAdd: TPopupMenu;
    miAdd1: TMenuItem;
    miAddStandard1: TMenuItem;
    miAddExisting1: TMenuItem;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddClick(Sender: TObject);
    procedure AddEmptyClick(Sender: TObject);
    procedure AddStandardClick(Sender: TObject);    
    procedure lbxLinksClick(Sender: TObject);
    procedure LinkDesignClick(Sender: TObject);
    procedure SetAsCurrentClick(Sender: TObject);
    procedure LinkChangeComponentClick(Sender: TObject);
    procedure RestoreDefaultsClick(Sender: TObject);
    procedure RestoreOriginalClick(Sender: TObject);
    procedure PageSetupClick(Sender: TObject);
    procedure PrintPreviewClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure lbxLinksDblClick(Sender: TObject);
    procedure lbxLinksStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure lbxLinksEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure lbxLinksDragOver(Sender, Source: TObject; X, Y: Integer; 
      State: TDragState; var Accept: Boolean);
    procedure lbxLinksDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lbxLinksKeyPress(Sender: TObject; var Key: Char);
    procedure EditClick(Sender: TObject);
    procedure MoveUpClick(Sender: TObject);
    procedure MoveDownClick(Sender: TObject);
    procedure lbxLinksDrawItem(Control: TWinControl; Index: Integer; 
      Rect: TRect; State: TOwnerDrawState);
    procedure BackgroundClick(Sender: TObject);
    procedure ClearBackgroundClick(Sender: TObject);
    procedure pmLinksPopup(Sender: TObject);
    procedure ShowButtonsClick(Sender: TObject);
    procedure btnAdd1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FController: TCustomdxComponentPrinter;
    FSaveCursor: TCursor;
    FSaveDragIndex: Integer;

    function GetCurrentLink: TBasedxReportLink;
    function GetControllerDesigner: TAbstractdxReportLinkDesigner;
    function GetRegistryPath: string;
    function GetSelected(Index: Integer): Boolean;
    function GetSelectedCount: Integer;
    function GetLinkCount: Integer;
    function GetLink(Index: Integer): TBasedxReportLink;
    procedure SetController(Value: TCustomdxComponentPrinter);
    procedure SetSelected(Index: Integer; Value: Boolean);

    function CanAdd: Boolean;
    function CanAddExisting: Boolean;    
    function CanAddStandard: Boolean;
    function CanBackgroundClear: Boolean;
    function CanBackgroundEffects: Boolean;
    function CanChangeComponent: Boolean;
    function CanCopy: Boolean;
    function CanCut: Boolean;
    function CanDelete: Boolean;
    function CanMoveDown: Boolean;
    function CanMoveUp: Boolean;
    function CanPaste: Boolean;
    function CanPageSetup: Boolean;
    function CanPrint: Boolean;
    function CanPrintPreview: Boolean;
    function CanRestoreDefaults: Boolean;
    function CanRestoreOriginal: Boolean;
    function CanSelectAll: Boolean;
    function CanSetAsCurrent: Boolean;
    function CanShowDesigner: Boolean;    
   {$IFDEF DELPHI5}
    procedure CheckAddLink;
   {$ENDIF}
    procedure CheckDeleteLink;
    procedure Copy;
    procedure Cut;
    procedure Delete;
    procedure DeleteItem(AItem: TBasedxReportLink);
    procedure DrawDragRect;
    function GetMinWindowSize: TPoint;
    procedure GetSelections(const ASelections: TdxDesignSelectionList);
    procedure HandleException;
    function IndexOf(AItem: TBasedxReportLink): Integer;
    procedure InternalAddLink(ALinkClass: TdxReportLinkClass; AComponent: TComponent);
    procedure MakeLinkable(AComponent: TComponent);
    procedure MoveSelection(ADelta: Integer);
    procedure Paste;
    procedure PrepareAddStandardItem(AMenuItem: TMenuItem);
    procedure RefreshList;
    procedure RestoreLayout;
    procedure Select(AItem: TPersistent; AddToSelection: Boolean);
    procedure SelectAll;
    procedure SelectController;
    procedure StartWait;
    procedure StopWait;
    procedure StoreLayout;
    procedure UpdateCaption;
    procedure UpdateControlsState;
    procedure UpdateHScrollBar;
    procedure UpdateItem(AItem: TBasedxReportLink);
    procedure UpdateMenuState;
    procedure UpdateSelections(const ASelections: TdxDesignSelectionList);

    procedure WMGetMinMaxInfo(var message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMNCCreate(var Message: TWMNCCreate); message WM_NCCREATE;
    procedure WMNCDestroy(var message: TWMNCCreate); message WM_NCDESTROY;
  protected
    procedure Activated; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    function UniqueName(Comp: TComponent): string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

   {$IFDEF DELPHI6}
    function EditAction(Action: TEditAction): Boolean; override;
    procedure ItemDeleted(const ADesigner: IDesigner; Item: TPersistent); override;
    procedure ItemsModified(const Designer: IDesigner); override;
    procedure SelectionChanged(const ADesigner: IDesigner; const ASelection: IDesignerSelections); override;
   {$ELSE}
    procedure ComponentDeleted(Component: {$IFDEF DELPHI4} IPersistent {$ELSE} TComponent {$ENDIF}); override;
    procedure EditAction(Action: TEditAction); override;
    procedure SelectionChanged(ASelection: {$IFDEF DELPHI5} TDesignerSelectionList {$ELSE} TComponentList{$ENDIF}); override;
    procedure FormModified; override;
   {$ENDIF}
    function GetEditState: TEditState; override;

    property CurrentLink: TBasedxReportLink read GetCurrentLink;
    property Controller: TCustomdxComponentPrinter read FController write SetController;
    property ControllerDesigner: TAbstractdxReportLinkDesigner read GetControllerDesigner;
    property RegistryPath: string read GetRegistryPath;
    property Selected[Index: Integer]: Boolean read GetSelected write SetSelected;
    property SelectedCount: Integer read GetSelectedCount;
    property LinkCount: Integer read GetLinkCount;
    property Links[Index: Integer]: TBasedxReportLink read GetLink;
  end;

procedure dxShowReportLinkDesigner(AComponentPrinter: TCustomdxComponentPrinter;
  AFormDesigner: TFormDesigner);
function dxReportLinkUniqueName(AComponentPrinter: TCustomdxComponentPrinter; 
  AComponent: TComponent): string;
  
implementation

{$R *.DFM}

uses
  Registry, ExptIntf, VirtIntf, ToolIntf, 
 {$IFDEF DELPHI4} CommCtrl, {$ENDIF}
 {$IFDEF DELPHI5}
  DesignConst,
 {$ELSE}
   {$IFDEF DELPHI4} 
    LibConst, 
   {$ENDIF}
 {$ENDIF}
  dxPrnPg, dxBkgnd, dxPSGlbl, dxPSUtl, dxPSPrVwDsg, dxPSfmLnkAdd, dxPSfmLnkAddE;

const
  sdxCantPasteComponent: string = 'Can''t paste component %s here !';
  sdxCantCreateUniqueName: string = 'Can''t create unique name for %s.';
  sdxLinkDesigner = 'Edit %s%s%s Links';  
 {$IFNDEF DELPHI4}
  SCantDeleteAncestor: string = 
    'Selection contains a component introduced in an ancestor form which cannot be deleted.';
 {$ENDIF}
  { not localize }
  sdxButtonBar = 'ButtonBar';
  sdxWidth = 'Width';
  sdxHeight = 'Height';
 
type
  TdxReportLinkDesigner = class(TAbstractdxReportLinkDesigner)
  private
    FDesignWindow: TdxfmReportLinkDesignWindow;
    FFormDesigner: TFormDesigner;
    FUpdateCount: Integer;

    function GetDesignWindow: TdxfmReportLinkDesignWindow;
    procedure Activate;
  protected
    procedure Modified; override;
    procedure Update(AItem: TBasedxReportLink); override;
  public
    constructor Create(AComponentPrinter: TCustomdxComponentPrinter; AFormDesigner: TFormDesigner);
    destructor Destroy; override;

    procedure BeginUpdate; override;
    procedure CancelUpdate; override;
    procedure EndUpdate; override;

    property DesignWindow: TdxfmReportLinkDesignWindow read GetDesignWindow;
    property FormDesigner: TFormDesigner read FFormDesigner;
  end;

procedure dxShowReportLinkDesigner(AComponentPrinter: TCustomdxComponentPrinter; 
  AFormDesigner: TFormDesigner);
begin
  if AComponentPrinter.ReportLinkDesigner = nil then
    TdxReportLinkDesigner.Create(AComponentPrinter, AFormDesigner);
  TdxReportLinkDesigner(AComponentPrinter.ReportLinkDesigner).Activate;
end;

function dxReportLinkUniqueName(AComponentPrinter: TCustomdxComponentPrinter; 
  AComponent: TComponent): string;
var
  I, J: Integer;
  S: string;
  NameExists: Boolean;
  Item: TBasedxReportLink;
begin
  S := AComponentPrinter.Name +
    AComponentPrinter.GetNewLinkName(TBasedxReportLink(AComponent));
  for I := 1 to High(Integer) do
  begin
    Result := Format(S, [I]);
    NameExists := False;
    Item := AComponentPrinter.LinkByName(Result);
    if Item = nil then
    begin
      for J := 0 to AComponentPrinter.Owner.ComponentCount - 1 do
        if CompareText(AComponentPrinter.Owner.Components[J].Name, Result) = 0 then
        begin
          NameExists := True;
          Break;
        end;
      if not NameExists then Exit;
    end;
  end;
  raise Exception.CreateFmt(sdxCantCreateUniqueName, [AComponent.ClassName]);
end;

{ TdxReportLinkDesigner }

constructor TdxReportLinkDesigner.Create(AComponentPrinter: TCustomdxComponentPrinter;
  AFormDesigner: TFormDesigner);
begin
  inherited Create(AComponentPrinter);
  FFormDesigner := AFormDesigner;
end;

destructor TdxReportLinkDesigner.Destroy;
begin
  if FDesignWindow <> nil then
  begin
    FDesignWindow.Designer := nil;
    FDesignWindow.Free;
  end;
  inherited Destroy;
end;

procedure TdxReportLinkDesigner.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TdxReportLinkDesigner.CancelUpdate;
begin
  if FUpdateCount <> 0 then Dec(FUpdateCount);
end;

procedure TdxReportLinkDesigner.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    if FUpdateCount = 0 then Update(nil);
  end;
end;

function TdxReportLinkDesigner.GetDesignWindow: TdxfmReportLinkDesignWindow;
begin
  if FDesignWindow = nil then
  begin
    FDesignWindow := TdxfmReportLinkDesignWindow.Create(nil);
    FDesignWindow.Designer := FormDesigner;
    FDesignWindow.Controller := ComponentPrinter;
  end;
  Result := FDesignWindow;
end;

procedure TdxReportLinkDesigner.Activate;
begin
  DesignWindow.Show;
end;

procedure TdxReportLinkDesigner.Modified;
begin
  if FormDesigner <> nil then FormDesigner.Modified;
end;

procedure TdxReportLinkDesigner.Update(AItem: TBasedxReportLink);
begin
  if (FUpdateCount = 0) and (FDesignWindow <> nil) then
    DesignWindow.UpdateItem(AItem);
end;


{ TdxfmReportLinkDesigner }

constructor TdxfmReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxPSGlbl.dxhcReportLinkDesignWindow;
  inherited Create(AOwner);
  
 {$IFDEF DELPHI4}
  pmLinks.Images := ilLinks;
  pmAdd.Images := ilLinks;  
  miAdd.ImageIndex := 0;
  miAdd1.ImageIndex := 0;
  miCopy.ImageIndex := 1;
  miCut.ImageIndex := 2;
  miPaste.ImageIndex := 3;
  miDelete.ImageIndex := 4;
  miShowDesigner.ImageIndex := 6;
  miPageSetup.ImageIndex := 7;
  miPrintPreview.ImageIndex := 8;
  miPrint.ImageIndex := 9;
  miMoveUp.ImageIndex := 11;
  miMoveDown.ImageIndex := 12;
  miBackgroundEffects.ImageIndex := 13;
 {$ENDIF}

  miCut.Tag := Integer(eaCut);
  miCopy.Tag := Integer(eaCopy);
  miPaste.Tag := Integer(eaPaste);
  miDelete.Tag := Integer(eaDelete);
  miSelectAll.Tag := Integer(eaSelectAll);

  btnDelete.Tag := Integer(eaDelete);
  btnSelectAll.Tag := Integer(eaSelectAll);

  RestoreLayout;
end;

destructor TdxfmReportLinkDesignWindow.Destroy;
begin
  StoreLayout;
  if ControllerDesigner <> nil then
    TdxReportLinkDesigner(ControllerDesigner).FDesignWindow := nil;
  inherited Destroy;
end;

procedure TdxfmReportLinkDesignWindow.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  MenuItem: TMenuItem;
begin
  MenuItem := pmLinks.FindItem(Key, fkShortCut);
  if (MenuItem <> nil) and MenuItem.Enabled and MenuItem.Visible then
  begin
    MenuItem.Click;
    Key := 0;
  end
  else
    if Key = VK_ESCAPE then
    begin
      Close;
      Key := 0;
    end;
end;

procedure TdxfmReportLinkDesignWindow.FormResize(Sender: TObject);
begin
  UpdateHScrollBar;
end;

procedure TdxfmReportLinkDesignWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not (csDestroying in Controller.ComponentState) then
    SelectController;
  Action := caFree;
end;

procedure TdxfmReportLinkDesignWindow.AddClick(Sender: TObject);
var
  Component: TComponent;
  Origin: TPoint;
  LinkClass: TdxReportLinkClass;
begin
 {$IFDEF DELPHI5}
  CheckAddLink;
 {$ENDIF}
  Component := nil;
  Origin := ClientToScreen(Point(btnAdd.Left + btnAdd.Width, btnAdd.Top - 40));
  if dxSelectComponent(@Origin, nil, Designer, Component) then
  begin
    LinkClass := dxPSLinkClassByCompClass(TComponentClass(Component.ClassType));
    if LinkClass <> nil then
      InternalAddLink(LinkClass, Component);
  end;
end;

procedure TdxfmReportLinkDesignWindow.btnAdd1Click(Sender: TObject);
begin
  with btnAdd do 
    pmAdd.Popup(ClientOrigin.X, ClientOrigin.Y + Height);
end;

procedure TdxfmReportLinkDesignWindow.AddEmptyClick(Sender: TObject);
var
  LinkClass: TdxReportLinkClass;
begin
 {$IFDEF DELPHI5}
  CheckAddLink;
 {$ENDIF}
  LinkClass := dxSelectReportLink;
  if LinkClass <> nil then
    InternalAddLink(LinkClass, nil);
end;

procedure TdxfmReportLinkDesignWindow.AddStandardClick(Sender: TObject);
var
  LinkClass: TdxReportLinkClass;
begin
 {$IFDEF DELPHI5}
  CheckAddLink;
 {$ENDIF}
  LinkClass := TdxReportLinkClass(TComponent(Sender).Tag);
  if LinkClass <> nil then
    InternalAddLink(LinkClass, nil);
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksClick(Sender: TObject);
var
  Selections: TdxDesignSelectionList;
begin
  Selections := CreateDesignSelectionList;
  GetSelections(Selections);
  Designer.SetSelections(Selections);
end;

procedure TdxfmReportLinkDesignWindow.LinkDesignClick(Sender: TObject);
begin
  CurrentLink.IsCurrentLink := True;
  if Controller.DesignReport(CurrentLink) then Designer.Modified;
end;

procedure TdxfmReportLinkDesignWindow.SetAsCurrentClick(Sender: TObject);
begin
  Controller.CurrentLink := CurrentLink;
end;

procedure TdxfmReportLinkDesignWindow.LinkChangeComponentClick(Sender: TObject);
var
  Component: TComponent;
  Origin: TPoint;
begin
  Component := CurrentLink.Component;
  Origin := 
    ClientToScreen(Point(btnChangeComponent.Left + btnChangeComponent.Width, btnChangeComponent.Top - 40));
  if dxSelectComponent(@Origin, CurrentLink, Designer, Component) then
  begin
    CurrentLink.Component := Component;
    Designer.Modified;
  end;
end;

procedure TdxfmReportLinkDesignWindow.RestoreDefaultsClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to LinkCount - 1 do
    if Selected[I] or (SelectedCount = 0) then
    begin
      Links[I].RestoreDefaults;
      Links[I].RealPrinterPage.RestoreDefaults;
    end;  
end;

procedure TdxfmReportLinkDesignWindow.RestoreOriginalClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to LinkCount - 1 do
    if (Selected[I] or (SelectedCount = 0)) and (Links[I].Component <> nil) then
      Links[I].RestoreFromOriginal;
end;

procedure TdxfmReportLinkDesignWindow.PageSetupClick(Sender: TObject);
begin
  CurrentLink.IsCurrentLink := True;
  if CurrentLink.PageSetup then Designer.Modified;
end;

procedure TdxfmReportLinkDesignWindow.PrintPreviewClick(Sender: TObject);
begin
  CurrentLink.IsCurrentLink := True;
  dxShowPreviewWindow(Controller, Designer);  
end;

procedure TdxfmReportLinkDesignWindow.PrintClick(Sender: TObject);
begin
  CurrentLink.IsCurrentLink := True;
  Controller.Print(True, nil, nil);
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksDblClick(Sender: TObject);
begin
  if CanShowDesigner then 
    LinkDesignClick(Sender)
  else
    if CanPrintPreview then   
      PrintPreviewClick(Sender)
    else
      if CanPageSetup then   
        PageSetupClick(Sender);
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  FSaveDragIndex := -1;
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksEndDrag(Sender, Target: TObject; 
  X, Y: Integer);
begin
  DrawDragRect;
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksDragOver(Sender, Source: TObject; 
  X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  Index: Integer;
begin
  Accept := Sender = Source;
  if Accept then
    with TListBox(Sender) do
    begin
      Index := ItemAtPos(Point(X, Y), True);
      Accept := (Index <> -1) and (FSaveDragIndex <> ItemIndex);
      DrawDragRect;
      FSaveDragIndex := Index;
      DrawDragRect;
    end;
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksDragDrop(Sender, Source: TObject; 
  X, Y: Integer);
begin
  MoveSelection(FSaveDragIndex - TListBox(Sender).ItemIndex);
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13, #33..#126:
      begin
        if Key = #13 then Key := #0;
        ActivateInspector(Key);
        Key := #0;
      end;
    #27:
      begin
        SelectController;
        Key := #0;
      end;
  end;
end;

procedure TdxfmReportLinkDesignWindow.EditClick(Sender: TObject);
begin
  EditAction(TEditAction(TComponent(Sender).Tag));
end;

procedure TdxfmReportLinkDesignWindow.MoveUpClick(Sender: TObject);
begin
  MoveSelection(-1);
end;

procedure TdxfmReportLinkDesignWindow.MoveDownClick(Sender: TObject);
begin
  MoveSelection(1);
end;

procedure TdxfmReportLinkDesignWindow.lbxLinksDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  S: string;
begin
  with TListBox(Control), Canvas do
  begin
    FillRect(Rect);
      InflateRect(Rect, -2, -2);
    if Links[Index].IsCurrentLink then
      Font.Style := Font.Style + [fsBold];
    SetBkMode(Handle, TRANSPARENT);
    S := Items[Index];
    DrawText(Handle, PChar(S), Length(S), Rect, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
    SetBkMode(Handle, OPAQUE);
    if Links[Index].IsCurrentLink then
      Font.Style := Font.Style - [fsBold];
  end;
end;

procedure TdxfmReportLinkDesignWindow.BackgroundClick(Sender: TObject);
var
  Background: TdxBackground;
  I: Integer;
begin
  StartWait;
  try
    Background := TdxBackground.Create;
    try
      for I := 0 to LinkCount - 1 do
        if Selected[I] or (SelectedCount = 0) then
        begin
          Background.Assign(Links[I].RealPrinterPage.Background);
          Break;
        end;
      if Background.SetupEffects then
      begin
        for I := 0 to LinkCount - 1 do
          if Selected[I] or (SelectedCount = 0) then
            Links[I].RealPrinterPage.Background := Background;
        Designer.Modified;
      end;
    finally
      Background.Free;
    end;
  finally
    StopWait;
  end;
end;

procedure TdxfmReportLinkDesignWindow.ClearBackgroundClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to LinkCount - 1 do
    if Selected[I] or (SelectedCount = 0) then
      with Links[I] do
      begin
        RealPrinterPage.Background.Mode := bmNone;
        RealPrinterPage.Background.Picture := nil;
      end;
  Designer.Modified;
end;

procedure TdxfmReportLinkDesignWindow.pmLinksPopup(Sender: TObject);
begin
  UpdateMenuState;
end;

procedure TdxfmReportLinkDesignWindow.ShowButtonsClick(Sender: TObject);
begin
  pnlButtons.Visible := not pnlButtons.Visible;
end;

{$IFDEF DELPHI6}
function TdxfmReportLinkDesignWindow.EditAction(Action: TEditAction): Boolean;
{$ELSE}
procedure TdxfmReportLinkDesignWindow.EditAction(Action: TEditAction);
{$ENDIF}
begin
{$IFDEF DELPHI6}
  Result := True;
{$ENDIF}
  case Action of
    eaCut: Cut;
    eaCopy: Copy;
    eaPaste: Paste;
    eaDelete: Delete;
    eaSelectAll: SelectAll;
  end;
end;

function TdxfmReportLinkDesignWindow.GetEditState: TEditState;
begin
  Result := [];
  if CanCut then
    Result := Result + [esCanCut];
  if CanCopy then
    Result := Result + [esCanCopy];
  if CanPaste then
    Result := Result + [esCanPaste];
  if CanDelete then
    Result := Result + [esCanDelete];
 {$IFDEF DELPHI4}
  if CanSelectAll then
    Result := Result + [esCanSelectAll];
 {$ENDIF}  
end;

{$IFDEF DELPHI6}

procedure TdxfmReportLinkDesignWindow.ItemDeleted(const ADesigner: IDesigner;
  Item: TPersistent);
begin
  inherited;
  if (ADesigner = Designer) and (Item is TBasedxReportLink) and
    (Controller <> nil) and not (csDestroying in Controller.ComponentState) then
    DeleteItem(TBasedxReportLink(Item));
end;

procedure TdxfmReportLinkDesignWindow.ItemsModified(const Designer: IDesigner);
begin
  inherited;
  UpdateCaption;
end;

procedure TdxfmReportLinkDesignWindow.SelectionChanged(const ADesigner: IDesigner;
  const ASelection: IDesignerSelections);
begin
  inherited;
  if ADesigner = Designer then UpdateSelections(ASelection);
end;

{$ELSE}

procedure TdxfmReportLinkDesignWindow.ComponentDeleted(
  Component: {$IFDEF DELPHI4} IPersistent {$ELSE} TComponent {$ENDIF});
var
  Item: TPersistent;
begin
  inherited;
  Item := dxPSDsgProxies.TryExtractPersistent(Component);
  if (Item is TBasedxReportLink) and (Controller <> nil) and 
    not (csDestroying in Controller.ComponentState) then
    DeleteItem(TBasedxReportLink(Item));
end;

procedure TdxfmReportLinkDesignWindow.SelectionChanged(
  ASelection: {$IFDEF DELPHI5} TDesignerSelectionList {$ELSE} TComponentList {$ENDIF});
begin
  inherited;
  UpdateSelections(ASelection);
end;

procedure TdxfmReportLinkDesignWindow.FormModified;
begin
  inherited;
  UpdateCaption;
end;
{$ENDIF}

procedure TdxfmReportLinkDesignWindow.Activated;
var
  Selections: TdxDesignSelectionList;
begin
  inherited Activated;
  Selections := CreateDesignSelectionList;
  try
    Designer.GetSelections(Selections);
    UpdateSelections(Selections);
  finally
    FreeDesignSelectionList(Selections);
  end;
end;

procedure TdxfmReportLinkDesignWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := Style or WS_THICKFRAME;
end;

procedure TdxfmReportLinkDesignWindow.CreateWnd;
begin
  inherited CreateWnd;
  SendMessage(Handle, WM_SETICON, 1, Icon.Handle)
end;

function TdxfmReportLinkDesignWindow.UniqueName(Comp: TComponent): string;
begin
  Result := dxReportLinkUniqueName(Controller, Comp);
end;

function TdxfmReportLinkDesignWindow.GetCurrentLink: TBasedxReportLink;
begin
  if LinkCount <> 0 then
    Result := Links[lbxLinks.ItemIndex]
  else
    Result := nil;
end;

function TdxfmReportLinkDesignWindow.GetControllerDesigner: TAbstractdxReportLinkDesigner;
begin
  if Controller <> nil then
    Result := Controller.ReportLinkDesigner
  else
    Result := nil;
end;

function TdxfmReportLinkDesignWindow.GetRegistryPath: string;
begin
  Result :=
    ToolServices.GetBaseRegistryKey + '\' + sdxPSLayoutsRunTimeRegistryKey + '\' + DropT(ClassName);
end;

function TdxfmReportLinkDesignWindow.GetSelected(Index: Integer): Boolean;
begin
  Result := lbxLinks.Selected[Index]
end;

function TdxfmReportLinkDesignWindow.GetSelectedCount: Integer;
begin
  Result := lbxLinks.SelCount;
end;

function TdxfmReportLinkDesignWindow.GetLinkCount: Integer;
begin
  Result := lbxLinks.Items.Count;
end;

function TdxfmReportLinkDesignWindow.GetLink(Index: Integer): TBasedxReportLink;
begin
  Result := TBasedxReportLink(lbxLinks.Items.Objects[Index]);
end;

procedure TdxfmReportLinkDesignWindow.SetController(Value: TCustomdxComponentPrinter);
begin
  if FController <> Value then
  begin
    FController := Value;
    UpdateCaption;
    RefreshList;
  end;
end;

procedure TdxfmReportLinkDesignWindow.SetSelected(Index: Integer; Value: Boolean);
begin
  lbxLinks.Selected[Index] := Value;
end;

function TdxfmReportLinkDesignWindow.CanAdd: Boolean;
begin
 {$IFDEF DELPHI5}
  Result := not ((Controller <> nil) and (Controller.Owner <> nil) and
    (csInline in Controller.Owner.ComponentState));
 {$ELSE}
  Result := True;
 {$ENDIF}
end;

function TdxfmReportLinkDesignWindow.CanAddExisting: Boolean;
begin
  Result := CanAdd and (CurrentLink <> nil);
end;

function TdxfmReportLinkDesignWindow.CanAddStandard: Boolean;
begin
  Result := CanAdd;
end;

function TdxfmReportLinkDesignWindow.CanBackgroundClear: Boolean;
begin
  Result := LinkCount <> 0;
end;

function TdxfmReportLinkDesignWindow.CanBackgroundEffects: Boolean;
begin
  Result := LinkCount <> 0;
end;

function TdxfmReportLinkDesignWindow.CanChangeComponent: Boolean;
begin
  Result := SelectedCount = 1;
end;

function TdxfmReportLinkDesignWindow.CanCopy: Boolean;
begin
  Result := SelectedCount <> 0;
end;

function TdxfmReportLinkDesignWindow.CanCut: Boolean;
begin
  Result := CanCopy and CanDelete;
end;

function TdxfmReportLinkDesignWindow.CanDelete: Boolean;
var
  I: Integer;
begin
  Result := SelectedCount <> 0;
  if Result then
    for I := 0 to LinkCount - 1 do
      if Selected[I] and (csAncestor in Links[I].ComponentState) then
      begin
        Result := False;
        Exit;
      end;
end;

function TdxfmReportLinkDesignWindow.CanMoveDown: Boolean;
var
  I, Counter: Integer;
begin
  Counter := 0;
  for I := LinkCount - 1 downto 0 do
  begin
    if not Selected[I] then
    begin
      Result := Counter < SelectedCount;
      Exit;
    end;
    Inc(Counter);
  end;
  Result := False;
end;

function TdxfmReportLinkDesignWindow.CanMoveUp: Boolean;
var
  I: Integer;
begin
  for I := 0 to LinkCount - 1 do
    if not Selected[I] then
    begin
      Result := I < SelectedCount;
      Exit;
    end;
  Result := False;
end;

function TdxfmReportLinkDesignWindow.CanPaste: Boolean;
begin
  Result := CanAdd and ClipboardComponents {$IFDEF DELPHI5} and Designer.CanPaste {$ENDIF};
end;

function TdxfmReportLinkDesignWindow.CanPageSetup: Boolean;
begin
  Result := SelectedCount = 1;
end;

function TdxfmReportLinkDesignWindow.CanPrint: Boolean;
begin
  Result := (SelectedCount = 1) and (CurrentLink.Component <> nil); // CurrentLink.DataProviderPresent;
end;

function TdxfmReportLinkDesignWindow.CanPrintPreview: Boolean;
begin
  Result := (SelectedCount = 1) and (CurrentLink.Component <> nil); // CurrentLink.DataProviderPresent;  
end;

function TdxfmReportLinkDesignWindow.CanRestoreDefaults: Boolean;
begin
  Result := CurrentLink <> nil;
end;

function TdxfmReportLinkDesignWindow.CanRestoreOriginal: Boolean;
begin
  Result := LinkCount > 0;
end;

function TdxfmReportLinkDesignWindow.CanSelectAll: Boolean;
begin
  Result := LinkCount <> SelectedCount;
end;

function TdxfmReportLinkDesignWindow.CanSetAsCurrent: Boolean;
begin
  Result := (SelectedCount = 1) and not CurrentLink.IsCurrentLink;
end;

function TdxfmReportLinkDesignWindow.CanShowDesigner: Boolean;    
begin
  Result := (SelectedCount = 1) and CurrentLink.CheckToDesign;
end;

{$IFDEF DELPHI5}
procedure TdxfmReportLinkDesignWindow.CheckAddLink;
begin
  if not CanAdd then
    raise Exception.CreateRes(@SCantAddToFrame);
end;
{$ENDIF}

procedure TdxfmReportLinkDesignWindow.CheckDeleteLink;
begin
  if not CanDelete then
   {$IFDEF DELPHI5}
    raise Exception.CreateRes(@SCantDeleteAncestor);
   {$ELSE}
    raise Exception.Create(SCantDeleteAncestor);
   {$ENDIF}
end;

procedure TdxfmReportLinkDesignWindow.Copy;
var
  Components: TdxDesignSelectionList;
begin
  Components := CreateDesignSelectionList;
  try
    GetSelections(Components);
    CopyComponents(Controller.Owner, Components);
  finally
    FreeDesignSelectionList(Components);
  end;
  UpdateHScrollBar;
end;

procedure TdxfmReportLinkDesignWindow.Cut;
begin
  Copy;
  CheckDeleteLink;
  Delete;
end;

procedure TdxfmReportLinkDesignWindow.Delete;
var
  Selections: TdxDesignSelectionList;
  I, ItemIndex: Integer;
  Item: TComponent;
begin
  StartWait;
  try
    ControllerDesigner.BeginUpdate;
    try
      Selections := CreateDesignSelectionList;
      try
        GetSelections(Selections);
        ItemIndex := lbxLinks.ItemIndex;
        for I := 0 to Selections.Count - 1 do
        begin
          Item := TComponent(Selections[I]);
          if not (csAncestor in Item.ComponentState) then Item.Free;
        end;
        if ItemIndex < 0 then
          ItemIndex := 0;
        if ItemIndex > LinkCount - 1 then
          ItemIndex := LinkCount - 1;
      finally
        FreeDesignSelectionList(Selections);
      end;
    finally
      ControllerDesigner.CancelUpdate;
    end;  
    if ItemIndex <> -1 then
      Select(Links[ItemIndex], False)
    else
      SelectController;
    UpdateHScrollBar;  
  finally
    StopWait;
  end;
end;

procedure TdxfmReportLinkDesignWindow.DeleteItem(AItem: TBasedxReportLink);
var
  Index, ItemIndex: Integer;
begin
  Index := IndexOf(AItem);
  if Index <> -1 then
  begin
    ItemIndex := lbxLinks.ItemIndex;
    lbxLinks.Items.Delete(Index);
    if ItemIndex < 0 then
      ItemIndex := 0;
    if ItemIndex > LinkCount - 1 then
      ItemIndex := LinkCount - 1;
    if ItemIndex <> -1 then
      Select(Links[ItemIndex], False)
    else
      SelectController;
    UpdateHScrollBar;
  end;
end;

procedure TdxfmReportLinkDesignWindow.DrawDragRect;
begin
  with lbxLinks do
    if (FSaveDragIndex <> -1) and (FSaveDragIndex <> ItemIndex) then
      Canvas.DrawFocusRect(ItemRect(FSaveDragIndex));
end;

function TdxfmReportLinkDesignWindow.GetMinWindowSize: TPoint;
begin
  Result.X := 300;
  Result.Y := btnPrint.Top + btnPrint.Height +
    GetSystemMetrics(SM_CYCAPTION) + 2 * GetSystemMetrics(SM_CXFRAME) + 4;
end;

procedure TdxfmReportLinkDesignWindow.GetSelections(const ASelections: TdxDesignSelectionList);
var
  I: Integer;
begin
  for I := 0 to LinkCount - 1 do
    if Selected[I] then
      ASelections.Add(Links[I]);
  if ASelections.Count = 0 then
    ASelections.Add(Controller);
end;

procedure TdxfmReportLinkDesignWindow.HandleException;
begin
  if ToolServices <> nil then
    ToolServices.RaiseException(ReleaseException);
end;

function TdxfmReportLinkDesignWindow.IndexOf(AItem: TBasedxReportLink): Integer;
begin
  Result := lbxLinks.Items.IndexOfObject(AItem);
end;

procedure TdxfmReportLinkDesignWindow.InternalAddLink(ALinkClass: TdxReportLinkClass; 
  AComponent: TComponent);
var
  Link: TBasedxReportLink;
begin
//  ALink := TBasedxReportLink(Designer.CreateComponent(ALinkClass, Designer.GetRoot, 0, 0, 0, 0));
  ControllerDesigner.BeginUpdate;
  try
    Link := Controller.AddEmptyLinkEx(ALinkClass, Designer.GetRoot);
    Link.Component := AComponent;
    Link.Name := UniqueName(Link);
  finally
    ControllerDesigner.CancelUpdate;
  end;
  if AComponent <> nil then 
    Self.MakeLinkable(AComponent);
  lbxLinks.Items.AddObject(Link.Name, Link);
  Select(Link, False);
  UpdateHScrollBar;
  lbxLinks.Update;
  ActiveControl := lbxLinks;
end;

procedure TdxfmReportLinkDesignWindow.MakeLinkable(AComponent: TComponent);
begin
  with Designer do 
    if (GetRoot.FindComponent(AComponent.Name) <> AComponent) and not IsComponentLinkable(AComponent) then
      MakeComponentLinkable(AComponent)
end;

procedure TdxfmReportLinkDesignWindow.MoveSelection(ADelta: Integer);

  procedure MoveDown(ADelta: Integer);
  var
    I, Index: Integer;
  begin
    for I := LinkCount - 1 downto 0 do
      if Selected[I] then
      begin
        Index := Links[I].Index;
        Inc(Index, ADelta);
        if Index > LinkCount - 1 then
          Index := LinkCount - 1;
//        while (Index < LinkCount) and Selected[Index] do
//          Inc(Index);
        Links[I].Index := Index;
      end;
  end;

  procedure MoveUp(ADelta: Integer);
  var
    I, Index: Integer;
  begin
    for I := 0 to LinkCount - 1 do
      if Selected[I] then
      begin
        Index := Links[I].Index;
        Inc(Index, ADelta);
        if Index < 0 then
          Index := 0;
//        while (Index > -1) and Selected[Index] do
//          Dec(Index);
        Links[I].Index := Index;
      end;
  end;

begin
  ControllerDesigner.BeginUpdate;
  try
    if ADelta > 0 then
      MoveDown(ADelta)
    else
      MoveUp(ADelta);
  finally
    ControllerDesigner.EndUpdate;
  end;
end;

procedure TdxfmReportLinkDesignWindow.Paste;
var
  Components: TdxDesignSelectionList;
  I: Integer;
begin
  Components := CreateDesignSelectionList;
  try
    StartWait;
    try
      lbxLinks.Items.BeginUpdate;
      try
        ControllerDesigner.BeginUpdate;
        try
          PasteComponents(Controller.Owner, Controller, Components);
        finally
          ControllerDesigner.EndUpdate;
        end;
        for I := LinkCount - 1 downto LinkCount - Components.Count do
          Selected[I] := True;
        Designer.SetSelections(Components);
      finally
        lbxLinks.Items.EndUpdate;
      end;
    finally
      StopWait;
    end;
  finally
    FreeDesignSelectionList(Components);
  end;
  UpdateHScrollBar;
end;

procedure TdxfmReportLinkDesignWindow.PrepareAddStandardItem(AMenuItem: TMenuItem);
begin
  if CanAddExisting then 
  begin
    AMenuItem.Caption := 'Add ' + DropT(CurrentLink.ClassName);
    AMenuItem.Tag := Integer(CurrentLink.ClassType);
  end;
end;

procedure TdxfmReportLinkDesignWindow.RefreshList;
var
  Selections: TdxDesignSelectionList;
  I, Index: Integer;
  Item: TBasedxReportLink;
  Component: TPersistent;
begin
  lbxLinks.Items.BeginUpdate;
  try
    Selections := CreateDesignSelectionList;
    try
      GetSelections(Selections);

      lbxLinks.Items.Clear;
      if Controller = nil then Exit;

      for I := 0 to Controller.LinkCount - 1 do
      begin
        Item := Controller.ReportLink[I];
        if Item.Owner = Controller.Owner then 
          lbxLinks.Items.AddObject(Item.Name, Item);
      end;

      for I := 0 to Selections.Count - 1 do
      begin
        Component := Selections[I];
        if Component is TBasedxReportLink then
        begin
          Index := IndexOf(TBasedxReportLink(Component));
          if Index <> -1 then
            Selected[Index] := True;
        end;
      end;
    finally
      FreeDesignSelectionList(Selections);
    end;
  finally
    lbxLinks.Items.EndUpdate;
  end;
end;

procedure TdxfmReportLinkDesignWindow.RestoreLayout;
begin
  with TRegistry.Create do
  try
    try
      if OpenKey(RegistryPath, False) then
      begin
        if ValueExists(sdxButtonBar) then
          pnlButtons.Visible := ReadBool(sdxButtonBar);
        if ValueExists(sdxWidth) then
          Width := ReadInteger(sdxWidth);
        if ValueExists(sdxHeight) then
          Height := ReadInteger(sdxHeight);
      end;
    except
      HandleException;
    end;
  finally
    Free;
  end;
end;                               

procedure TdxfmReportLinkDesignWindow.Select(AItem: TPersistent; AddToSelection: Boolean);
var
  Selections: TdxDesignSelectionList;
begin
  Selections := CreateDesignSelectionList;
  if AddToSelection then
    Designer.GetSelections(Selections);
  Selections.Add(AItem);
  Designer.SetSelections(Selections);
end;

procedure TdxfmReportLinkDesignWindow.SelectAll;
var
  Selections: TdxDesignSelectionList;
  I: Integer;
begin
  Selections := CreateDesignSelectionList;
  for I := 0 to LinkCount - 1 do
    Selections.Add(Links[I]);
  Designer.SetSelections(Selections);
end;

procedure TdxfmReportLinkDesignWindow.SelectController;
begin
  Select(Controller, False);
end;

procedure TdxfmReportLinkDesignWindow.StartWait;
begin
  FSaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
end;

procedure TdxfmReportLinkDesignWindow.StopWait;
begin
  Screen.Cursor := FSaveCursor;
end;

procedure TdxfmReportLinkDesignWindow.StoreLayout;
begin
  with TRegistry.Create do
  try
    try
      if OpenKey(RegistryPath, True) then
      begin
        WriteBool(sdxButtonBar, pnlButtons.Visible);
        WriteInteger(sdxWidth, Width);
        WriteInteger(sdxHeight, Height);
      end;
    except
      HandleException;
    end;
  finally
    Free;
  end;
end;

procedure TdxfmReportLinkDesignWindow.UpdateCaption;
var
  NewCaption: string;
begin
  if (Controller <> nil) and (Controller.Owner <> nil) then
    NewCaption := Format(sdxLinkDesigner, [Controller.Owner.Name, '.', Controller.Name]);
  if Caption <> NewCaption then
    Caption := NewCaption;
end;

procedure TdxfmReportLinkDesignWindow.UpdateControlsState;
begin
  btnAdd.Enabled := CanAdd;
  btnAdd1.Enabled := CanAdd;  
  btnDelete.Enabled := CanDelete;
  btnSelectAll.Enabled := CanSelectAll;
  btnMoveUp.Enabled := CanMoveUp;
  btnMoveDown.Enabled := CanMoveDown;
  btnShowDesigner.Enabled := CanShowDesigner;
  btnChangeComponent.Enabled := CanChangeComponent;
  btnRestoreDefaults.Enabled := CanRestoreDefaults;
  btnRestoreOriginal.Enabled := CanRestoreOriginal;
  btnPageSetup.Enabled := CanPageSetup;
  btnPrintPreview.Enabled := CanPrintPreview;
  btnPrint.Enabled := CanPrint;
end;

procedure TdxfmReportLinkDesignWindow.UpdateHScrollBar;
var
  I, W, W2: Integer;
begin
  W := 0;
  with lbxLinks, Items do
  begin
    for I := 0 to Count - 1 do
    begin
      if I = Controller.CurrentLinkIndex then
        Canvas.Font.Style := [fsBold]
      else
        Canvas.Font.Style := [];
      W2 := 4 + Canvas.TextWidth(Items[I]);
      if W2 > W then W := W2;
    end;
    Perform(LB_SETHORIZONTALEXTENT, W, 0);
    Canvas.Font.Style := [];
  end;
end;

procedure TdxfmReportLinkDesignWindow.UpdateItem(AItem: TBasedxReportLink);
var
  Index: Integer;
begin
  if AItem <> nil then
  begin
    Index := IndexOf(AItem);
    if Index <> -1 then
    begin
      lbxLinks.Items[Index] := AItem.Name;
      UpdateHScrollBar;
    end
  end
  else
    RefreshList;
  UpdateControlsState;
end;

procedure TdxfmReportLinkDesignWindow.UpdateMenuState;
begin
  miAdd.Enabled := CanAdd;
  miAdd1.Enabled := CanAdd;
  miAddStandard.Visible := CanAddStandard;
  miAddStandard1.Visible := CanAddStandard;
  miAddExisting.Visible := CanAddExisting;
  miAddExisting1.Visible := CanAddExisting;  
  PrepareAddStandardItem(miAddExisting);
  PrepareAddStandardItem(miAddExisting1);  
  
  miCut.Enabled := CanCut;
  miCopy.Enabled := CanCopy;
  miPaste.Enabled := CanPaste;
  miDelete.Enabled := CanDelete;
  miSelectAll.Enabled := CanSelectAll;
  miMoveUp.Enabled := CanMoveUp;
  miMoveDown.Enabled := CanMoveDown;
  miShowDesigner.Enabled := CanShowDesigner;
  miSetAsCurrent.Enabled := CanSetAsCurrent;
  miChangeComponent.Enabled := CanChangeComponent;
  miRestoreDefaults.Enabled := CanRestoreDefaults;
  miRestoreOriginal.Enabled := CanRestoreOriginal;  
  miPageSetup.Enabled := CanPageSetup;
  miPrintPreview.Enabled := CanPrintPreview;
  miPrint.Enabled := CanPrint;  
  miBackgroundEffects.Enabled := CanBackgroundEffects;
  miBackgroundClear.Enabled := CanBackgroundClear;
  miShowButtons.Checked := pnlButtons.Visible;
  
  if CanShowDesigner then 
    miShowDesigner.Default := True
  else  
    if CanPrintPreview then   
      miPrintPreview.Default := True
    else
      if CanPageSetup then   
        miPageSetup.Default := True;
end;

procedure TdxfmReportLinkDesignWindow.UpdateSelections(const ASelections: TdxDesignSelectionList);

  function InSelection(ALink: TBasedxReportLink): Boolean;
  var
    I: Integer;
  begin
    for I := 0 to ASelections.Count - 1 do
      if ALink = ASelections[I] then
      begin
        Result := True;
        Exit;
      end;
    Result := False;
  end;

var
  I: Integer;
begin
  if (ASelections = nil) or (Controller = nil) or (csDestroying in Controller.ComponentState) or 
    (ControllerDesigner = nil) or (TdxReportLinkDesigner(ControllerDesigner).FUpdateCount <> 0) then
    Exit;
  for I := 0 to LinkCount - 1 do
    if Selected[I] xor InSelection(Links[I]) then
      Selected[I] := not Selected[I];
  UpdateControlsState;
end;

procedure TdxfmReportLinkDesignWindow.WMGetMinMaxInfo(var message: TWMGetMinMaxInfo);
begin
  inherited;
  message.MinMaxInfo^.ptMinTrackSize := GetMinWindowSize;
end;

procedure TdxfmReportLinkDesignWindow.WMNCCreate(var Message: TWMNCCreate);
var
  SysMenu: HMENU;
  Info: TMenuItemInfo;
  S: array[0..31] of Char;
  ItemExist: Boolean;
begin
  SysMenu := GetSystemMenu(Handle, False);
  Info.cbSize := SizeOf(Info){$IFDEF DELPHI4} - SizeOf(HBITMAP){$ENDIF};
  Info.fMask := MIIM_ID or MIIM_TYPE;
  Info.dwTypeData := @S[0];
  Info.cch := 32;
  ItemExist := GetMenuItemInfo(SysMenu, SC_SIZE, False, Info);
  inherited;
  if ItemExist then
    InsertMenuItem(SysMenu, 0, True, Info);
end;

procedure TdxfmReportLinkDesignWindow.WMNCDestroy(var message: TWMNCCreate);
begin
  GetSystemMenu(Handle, True);
  inherited;
end;

end.
