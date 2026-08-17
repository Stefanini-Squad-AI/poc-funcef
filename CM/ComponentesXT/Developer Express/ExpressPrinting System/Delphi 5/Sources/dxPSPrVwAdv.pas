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

unit dxPSPrVwAdv;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, Menus, ComCtrls, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxBar, dxBarPopupMenuEd, dxBarExtItems, dxPSESys, dxPrevw, dxPSPrvw;

type
  TdxfmPreviewWdxBar = class(TCustomdxPSPreviewWindow)
    dxBarManager: TdxBarManager;
    bbFile: TdxBarSubItem;
    bbToolsOptions: TdxBarButton;
    bbFileDesign: TdxBarButton;
    bbFilePrint: TdxBarButton;
    bbFilePrintDialog: TdxBarButton;
    bbView: TdxBarSubItem;
    bbZoomPercent100: TdxBarButton;
    bbZoomPageWidth: TdxBarButton;
    bbZoomWholePage: TdxBarButton;
    bbZoomTwoPages: TdxBarButton;
    bbGoToPage: TdxBarSubItem;
    bbGoToFirstPage: TdxBarButton;
    bbGoToPrevPage: TdxBarButton;
    bbGoToNextPage: TdxBarButton;
    bbGoToLastPage: TdxBarButton;
    bbHelp: TdxBarSubItem;
    bbHelpTopics: TdxBarButton;
    bbZoomFourPages: TdxBarButton;
    ilToolBar: TImageList;
    bbZoomWidenToSourceWidth: TdxBarButton;
    seActivePage: TdxBarSpinEdit;
    pmPreview: TdxBarPopupMenu;
    MainMenu1: TMainMenu;
    bbViewToolbars: TdxBarToolbarsListItem;
    bbZoomMultiplePages: TdxBarButton;
    cbxPredefinedZoom: TdxBarImageCombo;
    bbZoomSetup: TdxBarButton;
    bbFileExit: TdxBarButton;
    bbFormatShrinkToPageWidth: TdxBarButton;
    bbViewMargins: TdxBarButton;
    bbViewMarginBar: TdxBarButton;
    bbViewStatusBar: TdxBarButton;
    bsiShortcutPreview: TdxBarSubItem;
    bsiInsertHFAutoText: TdxBarSubItem;
    bbInsertHFPageNumber: TdxBarButton;
    bbInsertHFTotalPages: TdxBarButton;
    bbInsertHFPageOfPages: TdxBarButton;
    bbInsertHFDate: TdxBarButton;
    bbInsertHFTime: TdxBarButton;
    bbInsertHFDateTime: TdxBarButton;
    bbViewHFSwitchHeaderFooter: TdxBarButton;
    bbInsertHFUserName: TdxBarButton;
    bbInsertHFMachineName: TdxBarButton;
    bbViewHFClose: TdxBarButton;
    bbFormatHeaderAndFooter: TdxBarButton;
    bbViewSwitchToLeftPart: TdxBarButton;
    bbViewSwitchToCenterPart: TdxBarButton;
    bbViewSwitchToRightPart: TdxBarButton;
    bbFormatHFClear: TdxBarButton;
    bbFormat: TdxBarSubItem;
    bbEdit: TdxBarSubItem;
    bbFilePageSetup: TdxBarButton;
    bliInsertAutoTextEntries: TdxBarListItem;
    bbInsertEditAutoText: TdxBarButton;
    bbFormatHFBackground: TdxBarButton;
    bbFormatDateTime: TdxBarButton;
    bbFormatPageNumbering: TdxBarButton;
    bbEditFind: TdxBarButton;
    bbEditFindNext: TdxBarButton;
    bbEditReplace: TdxBarButton;
    bbViewPageHeaders: TdxBarButton;
    bbViewPageFooters: TdxBarButton;
    bbViewPages: TdxBarSubItem;
    bbFormatPageBackground: TdxBarButton;
    bbViewZoom: TdxBarSubItem;
    bbToolsCustomize: TdxBarButton;
    bbTools: TdxBarSubItem;
    bbHelpAbout: TdxBarButton;
    bbInsert: TdxBarSubItem;
    bbFormatShowHideEmptyPages: TdxBarButton;
    bsiNewMenuNewMenu: TdxBarSubItem;
    pmPrintStyles: TdxBarPopupMenu;
    bliPrintStyles: TdxBarListItem;
    bbDefinePrintStyles: TdxBarButton;
    procedure PageSetupClick(Sender: TObject);
    procedure ZoomClick(Sender: TObject);
    procedure GoToPageClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure DesignClick(Sender: TObject);
    procedure PageBackgroundClick(Sender: TObject);
    procedure bbViewMarginsClick(Sender: TObject);
    procedure HelpClick(Sender: TObject);
    procedure bbViewMarginBarClick(Sender: TObject);
    procedure bbViewStatusBarClick(Sender: TObject);
    procedure seActivePageChange(Sender: TObject);
    procedure cbxPredefinedZoomChange(Sender: TObject);
    procedure seActivePageButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure bbZoomMultiplePagesClick(Sender: TObject);
    procedure bbZoomSetupClick(Sender: TObject);
    procedure cbxPredefinedZoomClick(Sender: TObject);
    procedure bbFormatShrinkToPageWidthClick(Sender: TObject);
    procedure miCustomizePopupClick(Sender: TObject);
    procedure dxBarManagerBarVisibleChange(Sender: TdxBarManager;
      ABar: TdxBar);
    procedure bbViewHFCloseClick(Sender: TObject);
    procedure bbFormatHeaderAndFooterClick(Sender: TObject);
    procedure InsertHFClick(Sender: TObject);
    procedure bbViewHFSwitchHeaderFooterClick(Sender: TObject);
    procedure bbFormatDateTimeClick(Sender: TObject);
    procedure SwitchPartClick(Sender: TObject);
    procedure bbFormatHFClearClick(Sender: TObject);
    procedure bliInsertAutoTextEntriesClick(Sender: TObject);
    procedure bbFormatHFBackgroundClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure bbFormatPageNumbersClick(Sender: TObject);
    procedure bbViewPageHeadersClick(Sender: TObject);
    procedure bbViewPageFootersClick(Sender: TObject);
    procedure bbToolsCustomizeClick(Sender: TObject);
    procedure dxBarManagerShowCustomizingForm(Sender: TObject);
    procedure dxBarManagerHideCustomizingForm(Sender: TObject);
    procedure bbFormatShowHideEmptyPagesClick(Sender: TObject);
    procedure bbToolsOptionsClick(Sender: TObject);
  private
    function CalcWindowPos(Sender: TObject): TPoint;
    procedure EnabledHFItems(Value: Boolean);
    procedure EnableItemsWhileBuilding(Value: Boolean);
    function HFBar: TdxBar;
    procedure LoadBarManagerFromRegistry(const APath: string);
    procedure SaveBarManagerToRegistry(const APath: string);
    procedure SetBarItemVisibility(Item: TdxBarItem; Value: Boolean);
    function ShortcutBar: TdxBar;
    procedure ShowHFBar(Value: Boolean);
    procedure ShowShortCutBar(Value: Boolean);
    procedure UpdateHFState(Value: Boolean);
  protected
    procedure DoAfterPrintReport(AShowDialog: Boolean); override;
    procedure DoPreviewDblClick(APreview: TdxPreview); override;
    procedure DoPreviewZoomFactorChanged(APreview: TdxPreview); override;
    procedure DoPreviewZoomModeChanged(APreview: TdxPreview); override;
    procedure DoShowHFToolBar(Value: Boolean); override;
    function GetPreviewCanShowMarginHint(APreview: TdxPreview): Boolean; override;
    procedure LoadStrings; override;
    procedure StyleListChanged(Sender: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;

    procedure AfterConstruction; override;
    procedure InitContent; override;
    procedure LoadFromRegistry(const APath: string); override;
    procedure SaveToRegistry(const APath: string); override;
    procedure UpdateControls; override;
  end;

implementation

{$R *.DFM}

uses
  Registry, CommCtrl, MATH,
  dxPSRes, dxPrnPg, dxPSGlbl, dxPSCore, dxPSUtl, dxPrnDev, dxPSEngn, dxPgsDlg, 
  dxPSEvnt, dxPSPopupMan, dxPSPgsMnuBld;

const
  PageSelectorImageIndex = 35;

type
  TdxBarPSPopupMenuBuilder = class(TAbstractdxPSPopupMenuBuilder)
  private
    FBarHostForm: TCustomForm;
    FBarManager: TdxBarManager;
  protected
    function BuildPopup(const AControl: TControl; 
      const APopupMenu: TPopupMenu): TComponent; override;
    class function CanShowPopup(const APopupMenu: TPopupMenu): Boolean; override;
    procedure FreePopup(var APopupMenu: TComponent); override;
    procedure InvokePopup(const X, Y: Integer; const AControl: TControl; 
      const APopupMenu: TComponent); override;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TdxBarPSPageSetupMenuBuilder = class(TAbstractdxPSPageSetupMenuBuilder)
  public   
    procedure BuildPageSetupMenu(ARootItem: TObject; AData: Pointer; 
      AIncludeDefineItem: Boolean; AStyles: TStringList; ACurrentStyle: TBasedxPrintStyle;
      AOnStyleClick, AOnDefineStylesClick: TNotifyEvent); override;
    class function ExtractPrintStyleFromObj(Obj: TObject): TBasedxPrintStyle; override;
  end;

  
function VisibleToBarItemVisible(AValue: Boolean): TdxBarItemVisible;
{ivNever, ivInCustomizing, ivAlways}
begin
  Result := TdxBarItemVisible(2 * Byte(AValue));
end;
  
{ TdxBarPSPopupMenuBuilder }  

constructor TdxBarPSPopupMenuBuilder.Create;
begin
  inherited Create;
  FBarHostForm := TCustomForm.CreateNew(nil);
  FBarManager := TdxBarManager.Create(FBarHostForm);
  if dxPSEngine.LookAndFeel = pslfFlat then 
    FBarManager.Style := bmsFlat
  else  
    FBarManager.Style := bmsEnhanced;
end;
     
destructor TdxBarPSPopupMenuBuilder.Destroy;
begin
  FBarHostForm.Free;
  inherited Destroy;
end;

class function TdxBarPSPopupMenuBuilder.CanShowPopup(const APopupMenu: TPopupMenu): Boolean;
begin
  Result := inherited CanShowPopup(APopupMenu) and (ActiveBarControl = nil);
end;

function TdxBarPSPopupMenuBuilder.BuildPopup(const AControl: TControl; 
  const APopupMenu: TPopupMenu): TComponent;

  function IsSeparator(ABarItem: TdxBarItem): Boolean;
  begin
    Result := ABarItem.Caption = '-';
  end;

  function CreateItem(AMenuItem: TMenuItem): TdxBarItem;
  const 
    BarItemClasses: array[Boolean] of TdxBarItemClass = (TdxBarButton, TdxBarSubItem);
  var
    BarItemClass: TdxBarItemClass;
  begin
    Result := nil;
    BarItemClass := BarItemClasses[AMenuItem.Count > 0];
    if BarItemClass = nil then Exit;
    
    Result := BarItemClass.Create(FBarHostForm);
   {$IFDEF DELPHI4}
    Result.Action := AMenuItem.Action;
    Result.ImageIndex := AMenuItem.ImageIndex;
    Result.Glyph := AMenuItem.Bitmap;
   {$ENDIF}
    Result.Caption := AMenuItem.Caption;
    Result.Enabled := AMenuItem.Enabled;
    Result.HelpContext := AMenuItem.HelpContext;
    Result.Hint := AMenuItem.Hint;
    Result.ShortCut := AMenuItem.ShortCut;
    Result.Tag := AMenuItem.Tag;
    Result.Visible := VisibleToBarItemVisible(AMenuItem.Visible);
    if not (Result is TdxBarSubItem) then
      Result.OnClick := AMenuItem.OnClick;
    if Result is TdxBarButton then
    begin
      if AMenuItem.Checked or AMenuItem.RadioItem then
        TdxBarButton(Result).ButtonStyle := bsChecked;
      if AMenuItem.RadioItem then
        TdxBarButton(Result).GroupIndex := AMenuItem.GroupIndex;
      TdxBarButton(Result).Down := AMenuItem.Checked;
    end;
  end;

  procedure FixBeginGroup(AItemLinks: TdxBarItemLinks);
  var
    I: Integer;
    ItemLink: TdxBarItemLink;
  begin
    for I := AItemLinks.Count - 1 downto 0 do
    begin
      ItemLink := AItemLinks.Items[I];
      if IsSeparator(ItemLink.Item) then
      begin
        ItemLink.Free;
        if I < AItemLinks.Count then
          AItemLinks.Items[I].BeginGroup := True;
      end;
    end;
  end;

  procedure ProcessSubMenu(AItemLinks: TdxBarItemLinks; AMenuItem: TMenuItem);
  var
    I: Integer;
    MI: TMenuItem;
    Item: TdxBarItem;
  begin
    for I := 0 to AMenuItem.Count - 1 do
    begin
      MI := AMenuItem.Items[I];
      Item := CreateItem(MI);
      if Item <> nil then
      begin
        AItemLinks.Add.Item := Item;
        if Item is TdxBarSubItem then
          ProcessSubMenu(TdxBarSubItem(Item).ItemLinks, MI);
      end;
    end;
    FixBeginGroup(AItemLinks);
  end;

begin
  Result := nil;
  if (APopupMenu <> nil) and (APopupMenu.Items.Count > 0) then
  begin
    Result := TdxBarPopupMenu.Create(FBarHostForm);
    try
     {$IFDEF DELPHI4}
      FBarManager.Images := APopupMenu.Images;
     {$ENDIF}
      ProcessSubMenu(TdxBarPopupMenu(Result).ItemLinks, APopupMenu.Items);
    except
     {$IFDEF DELPHI4}
      FBarManager.Images := nil;
     {$ENDIF}
      Result.Free;
      raise;
    end;
  end;
end;

procedure TdxBarPSPopupMenuBuilder.FreePopup(var APopupMenu: TComponent);
var
  I: Integer;
begin
  for I := 0 to FBarManager.ItemCount - 1 do
    FBarManager.Items[I].Free;
  APopupMenu.Free;
  APopupMenu := nil;
end;

procedure TdxBarPSPopupMenuBuilder.InvokePopup(const X, Y: Integer;
  const AControl: TControl; const APopupMenu: TComponent);
begin
  if APopupMenu is TdxBarPopupMenu then
    TdxBarPopupMenu(APopupMenu).Popup(X, Y);
end;
  
{ TdxBarPSPageSetupMenuBuilder } 

class function TdxBarPSPageSetupMenuBuilder.ExtractPrintStyleFromObj(Obj: TObject): TBasedxPrintStyle;
begin
  with TdxBarListItem(Obj) do 
    Result := TBasedxPrintStyle(Items.Objects[ItemIndex]);
end;

procedure TdxBarPSPageSetupMenuBuilder.BuildPageSetupMenu(ARootItem: TObject; 
  AData: Pointer; AIncludeDefineItem: Boolean; AStyles: TStringList; 
  ACurrentStyle: TBasedxPrintStyle; AOnStyleClick, AOnDefineStylesClick: TNotifyEvent);
begin
  if not (ARootItem is TdxBarListItem) then Exit;
    
  with TdxBarListItem(ARootItem) do 
  begin
    Items.Clear;  
    Items := AStyles;
    if Items.Count > 0 then ItemIndex := ACurrentStyle.Index;
    OnClick := AOnStyleClick;
  end;
      
  if AIncludeDefineItem and (TObject(AData) is TdxBarButton) then
    with TdxBarButton(AData) do
    begin
      Caption := sdxDefinePrintStylesMenuItem;
      OnClick := AOnDefineStylesClick;
    end;
end;

  
{ utility routines }

function AddPercentageChar(const S: string): string;
begin
  Result := S;
  if Result[Length(Result)] <> '%' then
    Result := Result + '%';
end;

procedure ProcessMessages;
begin
  Application.ProcessMessages;
end;
  
{ TdxfmPreviewWdxBar }

constructor TdxfmPreviewWdxBar.Create(AOwner: TComponent);
var
  Bar: TdxBar;
begin
  inherited Create(AOwner);
 {$IFDEF EXPRESSBARS4}
  if dxPSEngine.LookAndFeel = pslfFlat then
    dxBarManager.Style := bmsFlat
  else  
    dxBarManager.Style := bmsEnhanced;
 {$ENDIF}
  
//  dxBarManager.PopupMenuLinks[0].Control := Preview;
  ShowHFBar(False);
  Bar := ShortCutBar;
  if Bar <> nil then Bar.Hidden := True;
end;

procedure TdxfmPreviewWdxBar.AfterConstruction;
begin
  inherited AfterConstruction;
  cbxPredefinedZoom.DropDownCount := PredefinedZooms.Count;
  seActivePage.Value := 1;
  dxBarManager.PopupMenuLinks[0].Control := Preview;
end;

procedure TdxfmPreviewWdxBar.LoadStrings;
begin
  inherited LoadStrings;
  with dxBarManager do
  begin
    Bars[0].Caption := sdxMenuBar;
    Bars[1].Caption := sdxStandardBar;
    Bars[2].Caption := sdxHeaderFooterBar;
    Bars[3].Caption := sdxShortCutMenusBar;

    Categories[0] := DropAmpersand(sdxMenuFile);
    Categories[1] := DropAmpersand(sdxMenuEdit);
    Categories[2] := DropAmpersand(sdxMenuInsert);
    Categories[3] := DropAmpersand(sdxMenuView);
    Categories[4] := DropAmpersand(sdxMenuFormat);
    Categories[5] := DropAmpersand(sdxMenuZoom);
    Categories[6] := DropAmpersand(sdxMenuTools);
    Categories[7] := DropAmpersand(sdxMenuGotoPage);
    Categories[8] := DropAmpersand(sdxMenuHelp);
    Categories[9] := DropAmpersand(sdxMenuBuiltInMenus);
    Categories[10] := DropAmpersand(sdxMenuShortCutMenus);
    Categories[11] := DropAmpersand(sdxMenuNewMenu);
  end;

  bbFile.Caption := sdxMenuFile;
  bbFileDesign.Caption := sdxMenuFileDesign;
  bbFilePrintDialog.Caption := sdxMenuFilePrint;
  bbFilePrint.Caption := DropEndEllipsis(sdxMenuFilePrint);
  bbFilePageSetup.Caption := sdxMenuFilePageSetup;
  bbFileExit.Caption := sdxMenuFileExit;

  bbEdit.Caption := sdxMenuEdit;
  bbEditFind.Caption := sdxMenuEditFind;
  bbEditFindNext.Caption := sdxMenuEditFindNext;
  bbEditReplace.Caption := sdxMenuEditReplace;

  bbInsert.Caption := sdxMenuInsert;
  bsiInsertHFAutoText.Caption := sdxMenuInsertAutoText;
  bbInsertEditAutoText.Caption := sdxMenuInsertEditAutoTextEntries;
  bliInsertAutoTextEntries.Caption := sdxMenuInsertAutoTextEntries;
  bbInsertHFPageNumber.Caption := sdxMenuInsertPageNumber;
  bbInsertHFTotalPages.Caption := sdxMenuInsertTotalPages;
  bbInsertHFPageOfPages.Caption := sdxMenuInsertPageOfPages;
  bbInsertHFDateTime.Caption := sdxMenuInsertDateTime;
  bbInsertHFDate.Caption := sdxMenuInsertDate;
  bbInsertHFTime.Caption := sdxMenuInsertTime;
  bbInsertHFUserName.Caption := sdxMenuInsertUserName;
  bbInsertHFMachineName.Caption := sdxMenuInsertMachineName;

  bbView.Caption := sdxMenuView;
  bbViewMargins.Caption := sdxMenuViewMargins;
  bbViewMarginBar.Caption := sdxMenuViewMarginsStatusBar;
  bbViewStatusBar.Caption := sdxMenuViewPagesStatusBar;
  bbViewToolbars.Caption := sdxMenuViewToolBars;
  bbViewZoom.Caption := sdxMenuZoom;
  bbZoomPercent100.Caption := sdxMenuZoomPercent100;
  bbZoomPageWidth.Caption := sdxMenuZoomPageWidth;
  bbZoomWholePage.Caption := sdxMenuZoomWholePage;
  bbZoomTwoPages.Caption := sdxMenuZoomTwoPages;
  bbZoomFourPages.Caption := sdxMenuZoomFourPages;
  bbZoomMultiplePages.Caption := sdxMenuZoomMultiplyPages;
  bbZoomWidenToSourceWidth.Caption := sdxMenuZoomWidenToSourceWidth;
  bbZoomSetup.Caption := sdxMenuZoomSetup;
  bbViewPages.Caption := sdxMenuPages;
  bbViewPageHeaders.Caption := sdxMenuViewPagesHeaders;
  bbViewPageFooters.Caption := sdxMenuViewPagesFooters;
  bbViewSwitchToLeftPart.Caption := sdxMenuViewSwitchToLeftPart;
  bbViewSwitchToRightPart.Caption := sdxMenuViewSwitchToRightPart;
  bbViewSwitchToCenterPart.Caption := sdxMenuViewSwitchToCenterPart;
  bbViewHFSwitchHeaderFooter.Caption := sdxMenuViewHFSwitchHeaderFooter;
  bbViewHFClose.Caption := sdxMenuViewHFClose;

  bbFormat.Caption := sdxMenuFormat;
  bbFormatHeaderAndFooter.Caption := sdxMenuFormatHeaderAndFooter;
  bbFormatDateTime.Caption := sdxMenuFormatDateTime;
  bbFormatPageNumbering.Caption := sdxMenuFormatPageNumbering;
  bbFormatPageBackground.Caption := sdxMenuFormatPageBackground;
  bbFormatShrinkToPageWidth.Caption := sdxMenuFormatShrinkToPage;
  bbFormatShowHideEmptyPages.Caption := sdxMenuShowEmptyPages;
  bbFormatHFBackground.Caption := sdxMenuFormatHFBackground;
  bbFormatHFClear.Caption := sdxMenuFormatHFClear;

  bbGotoPage.Caption := sdxMenuGotoPage;
  bbGotoFirstPage.Caption := sdxMenuGotoPageFirst;
  bbGotoPrevPage.Caption := sdxMenuGotoPagePrev;
  bbGotoNextPage.Caption := sdxMenuGotoPageNext;
  bbGotoLastPage.Caption := sdxMenuGotoPageLast;

  bbToolsCustomize.Caption := sdxMenuToolsCustomize;
  bbToolsOptions.Caption := sdxMenuToolsOptions;

  bbHelp.Caption := sdxMenuHelp;
  bbHelpTopics.Caption := sdxMenuHelpTopics;
  bbHelpAbout.Caption := sdxMenuHelpAbout;

  cbxPredefinedZoom.Caption := sdxMenuZoom + ':';
  seActivePage.Caption := sdxMenuActivePage;

  bsiShortcutPreview.Caption := sdxMenuShortcutPreview;

  bsiNewMenuNewMenu.Caption := sdxMenuNewMenu;

  { hints }
  bbFileDesign.Hint := sdxHintFileDesign;
  bbFilePrint.Hint := sdxHintFilePrint + GetCurrentPrinterAsHint;
  bbFilePrintDialog.Hint := sdxHintFilePrintDialog;
  bbFilePageSetup.Hint := sdxHintFilePageSetup;
  bbFileExit.Hint := sdxHintFileExit;

  bbEditFind.Hint := sdxHintEditFind;
  bbEditFindNext.Hint := sdxHintEditFindNext;
  bbEditReplace.Hint := sdxHintEditReplace;               

  bbInsertEditAutoText.Hint := sdxHintInsertEditAutoTextEntries;
  bbInsertHFPageNumber.Hint := sdxHintInsertPageNumber;
  bbInsertHFTotalPages.Hint := sdxHintInsertTotalPages;
  bbInsertHFPageOfPages.Hint := sdxHintInsertPageOfPages;
  bbInsertHFDateTime.Hint := sdxHintInsertDateTime;
  bbInsertHFDate.Hint := sdxHintInsertDate;
  bbInsertHFTime.Hint := sdxHintInsertTime;
  bbInsertHFUserName.Hint := sdxHintInsertUserName;
  bbInsertHFMachineName.Hint := sdxHintInsertMachineName;
  
  bbViewMargins.Hint := sdxHintViewMargins;
  bbViewMarginBar.Hint := sdxHintViewMarginsStatusBar;
  bbViewStatusBar.Hint := sdxHintViewPagesStatusBar;
  cbxPredefinedZoom.Hint := sdxHintViewZoom;
  bbZoomPercent100.Hint := sdxHintZoomPercent100;
  bbZoomPageWidth.Hint := sdxHintZoomPageWidth;
  bbZoomWholePage.Hint := sdxHintZoomWholePage;
  bbZoomTwoPages.Hint := sdxHintZoomTwoPages;
  bbZoomFourPages.Hint := sdxHintZoomFourPages;
  bbZoomMultiplePages.Hint := sdxHintZoomMultiplyPages;
  bbZoomWidenToSourceWidth.Hint := sdxHintZoomWidenToSourceWidth;
  bbZoomSetup.Hint := sdxHintZoomSetup;
  bbViewPageHeaders.Hint := sdxHintViewPagesHeaders;
  bbViewPageFooters.Hint := sdxHintViewPagesFooters;
  bbViewSwitchToLeftPart.Hint := sdxHintViewSwitchToLeftPart;
  bbViewSwitchToRightPart.Hint := sdxHintViewSwitchToRightPart;
  bbViewSwitchToCenterPart.Hint := sdxHintViewSwitchToCenterPart;
  bbViewHFSwitchHeaderFooter.Hint := sdxHintViewHFSwitchHeaderFooter;
  bbViewHFClose.Hint := sdxHintViewHFClose;

  bbFormatDateTime.Hint := sdxHintFormatDateTime;
  bbFormatPageNumbering.Hint := sdxHintFormatPageNumbering;
  bbFormatPageBackground.Hint := sdxHintFormatPageBackground;
  bbFormatShrinkToPageWidth.Hint := sdxHintFormatShrinkToPage;
  bbFormatHFBackground.Hint := sdxHintFormatHFBackground;
  bbFormatHFClear.Hint := sdxHintFormatHFClear;

  bbGotoFirstPage.Hint := sdxHintGotoPageFirst;
  bbGotoPrevPage.Hint := sdxHintGotoPagePrev;
  bbGotoNextPage.Hint := sdxHintGotoPageNext;
  bbGotoLastPage.Hint := sdxHintGotoPageLast;
  seActivePage.Hint := sdxHintActivePage;

  bbToolsCustomize.Hint := sdxHintToolsCustomize;
  bbToolsOptions.Hint := sdxHintToolsOptions;

  bbHelpTopics.Hint := sdxHintHelpTopics;
  bbHelpAbout.Hint := sdxHintHelpAbout;
end;

procedure TdxfmPreviewWdxBar.StyleListChanged(Sender: TObject);
begin
  with ComponentPrinter.CurrentLink do
    if Sender = StyleManager then 
      BuildPageSetupMenu(bliPrintStyles, bbDefinePrintStyles, True);     
end;

procedure TdxfmPreviewWdxBar.bbViewMarginsClick(Sender: TObject);
begin
  if Locked then Exit;
  ShowPageMargins := TdxBarButton(Sender).Down;
end;

procedure TdxfmPreviewWdxBar.bbViewMarginBarClick(Sender: TObject);
begin
  if Locked then Exit;
  ShowMarginBar := TdxBarButton(Sender).Down;
end;

procedure TdxfmPreviewWdxBar.bbViewStatusBarClick(Sender: TObject);
begin
  if Locked then Exit;
  ShowStatusBar := TdxBarButton(Sender).Down;
end;

procedure TdxfmPreviewWdxBar.DesignClick(Sender: TObject);
begin
  DoDesignReport;
end;

procedure TdxfmPreviewWdxBar.PrintClick(Sender: TObject);
const
  BtnClicked: Boolean = False;
begin
  if BtnClicked then Exit;
  ProcessMessages;
  BtnClicked := True;
  try
    DoPrintReport(Boolean(TComponent(Sender).Tag));
  finally
    BtnClicked := False;
  end;
end;

procedure TdxfmPreviewWdxBar.PageSetupClick(Sender: TObject);
const
  BtnClicked: Boolean = False;
begin
  if BtnClicked then Exit;
  ProcessMessages;
  BtnClicked := True;
  try
    DoPageSetupReport(0);
  finally
    BtnClicked := False;
  end;
end;

procedure TdxfmPreviewWdxBar.PageBackgroundClick(Sender: TObject);
begin
  ProcessMessages;
  DoShowPageBackgroundDlg(CalcWindowPos(Sender));
end;

procedure TdxfmPreviewWdxBar.bbFormatShrinkToPageWidthClick(Sender: TObject);
begin
  if ComponentPrinter <> nil then
    with ComponentPrinter.CurrentLink do
    begin
      ShrinkToPageWidth := not ShrinkToPageWidth;
      DoShrinkToPageWidth(ShrinkToPageWidth);
    end;
end;

procedure TdxfmPreviewWdxBar.bbFormatShowHideEmptyPagesClick(Sender: TObject);
begin
  if Locked then Exit;
  DoShowEmptyPages(TdxBarButton(Sender).Down);
end;

procedure TdxfmPreviewWdxBar.bbZoomSetupClick(Sender: TObject);
begin
  ProcessMessages;
  DoShowZoomDlg;
end;

procedure TdxfmPreviewWdxBar.cbxPredefinedZoomClick(Sender: TObject);
begin
  ProcessMessages;
  DoShowZoomDlg;
end;

procedure TdxfmPreviewWdxBar.bbZoomMultiplePagesClick(Sender: TObject);
var
  Link: TdxBarItemLink;
  R: TRect;
  YShift: Integer;
begin
  Link := TdxBarItem(Sender).ClickItemLink;
  if (Link <> nil) and (Link.Control <> nil) then
  begin
    R := Link.ItemRect;
    MapWindowPoints(Link.BarControl.Handle, 0, R, 2);
    YShift := R.Bottom - R.Top;
  end
  else
  begin
    GetWindowRect(Preview.Handle, R);
    OffsetRect(R, 3, 0);
    YShift := 3;
  end;
  DoShowMultiplySelectPagesDlg(ilToolBar, PageSelectorImageIndex, R.TopLeft, YShift);
end;

procedure TdxfmPreviewWdxBar.GoToPageClick(Sender: TObject);
begin
  case TComponent(Sender).Tag of
    0: GoToFirstPage;
    1: GoToPrevPage;
    2: GoToNextPage;
    3: GoToLastPage;
  end;
end;

procedure TdxfmPreviewWdxBar.CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TdxfmPreviewWdxBar.HelpClick(Sender: TObject);
begin
  ProcessMessages;
  DoInvokeHelp;
end;

procedure TdxfmPreviewWdxBar.DoPreviewDblClick(APreview: TdxPreview);
begin
  ShowHFBar(False);
end;

procedure TdxfmPreviewWdxBar.DoPreviewZoomFactorChanged(APreview: TdxPreview);
begin
  cbxPredefinedZoom.Text := AddPercentageChar(IntToStr(ZoomFactor));
end;

procedure TdxfmPreviewWdxBar.DoPreviewZoomModeChanged(APreview: TdxPreview);
begin
  cbxPredefinedZoom.Text := AddPercentageChar(IntToStr(ZoomFactor));
end;

function TdxfmPreviewWdxBar.GetPreviewCanShowMarginHint(APreview: TdxPreview): Boolean;
begin
  Result := ActiveBarControl = nil;
end;

procedure TdxfmPreviewWdxBar.DoAfterPrintReport(AShowDialog: Boolean);
begin
  if AShowDialog then
    bbFilePrint.Hint := sdxHintFilePrint + GetCurrentPrinterAsHint;
end;

procedure TdxfmPreviewWdxBar.ZoomClick(Sender: TObject);
var
  PageXCount, PageYCount: Integer;
  ZoomMode: TdxPreviewZoomMode;
begin
  case TComponent(Sender).Tag of
    0: ZoomMode := pzmNone;
    1: ZoomMode := pzmPageWidth;
  else
    ZoomMode := pzmPages;
  end;
  PageXCount := 1;
  PageYCount := 1;
  if ZoomMode = pzmPages then
    case TComponent(Sender).Tag of
      3: PageXCount := 2;
      4:
        begin
          PageXCount := 2;
          PageYCount := 2;
        end;
      5: ComponentPrinter.CurrentLink.GetPageColRowCount(PageXCount, PageYCount);
    end;
  DoSetupZoomFactor(100, PageXCount, PageYCount, ZoomMode);
end;

procedure TdxfmPreviewWdxBar.InitContent;
begin
  inherited InitContent;
  if ComponentPrinter <> nil then
    seActivePage.MaxValue := ComponentPrinter.CurrentLink.PageCount;
  cbxPredefinedZoom.Text := IntToStr(ZoomFactor) + '%';
end;

procedure TdxfmPreviewWdxBar.SetBarItemVisibility(Item: TdxBarItem; Value: Boolean);
begin
  Item.Visible := VisibleToBarItemVisible(Value);
end;

procedure TdxfmPreviewWdxBar.UpdateControls;
const
  ButtonStyles: array[Boolean] of TdxBarButtonStyle = (bsDefault, bsDropDown);
var
  PagesExists: Boolean;
  PageXCount, PageYCount, Ind: Integer;
begin
  if Locked then Exit;
  inherited UpdateControls;
  
  PagesExists := FPreview.PageCount > 0;
  BeginUpdate;
  try
    EnableItemsWhileBuilding(True);
    bbFileExit.Enabled := not IsPrinting;
    bbFileDesign.Enabled := CanDesign;
    bbFilePrint.Enabled := CanPrint;
    bbFilePrintDialog.Enabled := CanPrintDialog;
    bbFilePageSetup.Enabled := CanPageSetup;
    bbFilePageSetup.ButtonStyle := ButtonStyles[CanPrintStyle];    
    
    if ComponentPrinter <> nil then
      bbFormatShowHideEmptyPages.Down := ComponentPrinter.CurrentLink.ShowEmptyPages;
    bbFormatPageBackground.Enabled := IsEnabled(peoPageBackground) and not IsPrinting;
    bbFormatShrinkToPageWidth.Enabled := PagesExists and not IsPrinting;
    if ComponentPrinter <> nil then
      with ComponentPrinter.CurrentLink do
      begin
        bbFormatShrinkToPageWidth.Down := ShrinkToPageWidth;
        SetBarItemVisibility(bbFormatShowHideEmptyPages, EmptyPagesCanExist);
        bbFormatShowHideEmptyPages.Down := ShowEmptyPages;
      end;

    bbZoomPageWidth.Enabled := PagesExists;
    bbZoomPercent100.Enabled := PagesExists;
    bbZoomWholePage.Enabled := PagesExists;
    bbZoomTwoPages.Enabled := PagesExists and (FPreview.PageCount > 1);
    bbZoomFourPages.Enabled := PagesExists and (FPreview.PageCount > 3);
    bbZoomMultiplePages.Enabled := PagesExists;
    if ComponentPrinter <> nil then
    begin
      ComponentPrinter.CurrentLink.GetPageColRowCount(PageXCount, PageYCount);
      bbZoomWidenToSourceWidth.Enabled := PageXCount > 1;
    end;
    cbxPredefinedZoom.Enabled := bbZoomPageWidth.Enabled;
    bbZoomSetup.Enabled := bbZoomPageWidth.Enabled;

    bbGoToFirstPage.Enabled := PagesExists and (FPreview.SelPageIndex <> 0);
    bbGoToPrevPage.Enabled := PagesExists and (Preview.SelPageIndex <> 0);
    bbGoToNextPage.Enabled := PagesExists and (Preview.SelPageIndex <> FPreview.PageCount - 1);
    bbGoToLastPage.Enabled := PagesExists and (Preview.SelPageIndex <> FPreview.PageCount - 1);
    seActivePage.Enabled := Preview.PageCount > 1;

    bbHelp.Enabled := IsEnabled(peoHelp);
    bbHelpTopics.Enabled := IsEnabled(peoHelp);
    //bbHelpAbout.Enabled := IsEnabled(peoHelp);

    bbViewMargins.Down := ShowPageMargins;
    bbViewMarginBar.Down := ShowMarginBar;
    bbViewStatusBar.Down := ShowStatusBar;
    if ComponentPrinter <> nil then
    begin
      bbViewPageHeaders.Down := ComponentPrinter.CurrentLink.ShowPageHeader;
      bbViewPageFooters.Down := ComponentPrinter.CurrentLink.ShowPageFooter;
    end;

    SetBarItemVisibility(bbFileDesign, IsVisible(pvoReportDesign));
    SetBarItemVisibility(bbFilePrint, IsVisible(pvoPrint));
    SetBarItemVisibility(bbFilePrintDialog, IsVisible(pvoPrint));
    SetBarItemVisibility(bbFilePageSetup, IsVisible(pvoPageSetup));
    SetBarItemVisibility(bbFormatPageBackground, IsVisible(pvoPageBackground));
    SetBarItemVisibility(bbHelp, IsVisible(pvoHelp));
    SetBarItemVisibility(bbHelpTopics, IsVisible(pvoHelp));
    //SetBarItemVisibility(bbHelpAbout, IsVisible(pvoHelp));

    if seActivePage.Enabled then
    begin
      seActivePage.MinValue := 1;
      if ComponentPrinter <> nil then
        with ComponentPrinter.CurrentLink do
        begin
          seActivePage.MaxValue := PageCount;
          seActivePage.Value := VirtualPageIndexToRealPageIndex(FPreview.SelPageIndex) + 1;
        end
    end
    else
      seActivePage.Value := -1;
    if IsBuilding or IsPrinting then EnableItemsWhileBuilding(False);
    EnabledHFItems(HFBar.Visible);

    { Categories visibility }

    { Edit }
    Ind := dxBarManager.Categories.IndexOf(DropAmpersand(sdxMenuEdit));
    if Ind <> -1 then
      dxBarManager.CategoryVisible[Ind] := False;
      
    { Help }
    Ind := dxBarManager.Categories.IndexOf(DropAmpersand(sdxMenuHelp));
    if Ind <> -1 then
      dxBarManager.CategoryVisible[Ind] := 
        (bbHelpTopics.Visible = ivAlways) or (bbHelpAbout.Visible = ivAlways);
        
    { Shortcut Menus }
    Ind := dxBarManager.Categories.IndexOf(DropAmpersand(sdxMenuShortCutMenus));
    if Ind <> -1 then
      dxBarManager.CategoryVisible[Ind] := False;
  finally
    CancelUpdate;
  end;
end;

procedure TdxfmPreviewWdxBar.DoShowHFToolBar(Value: Boolean);
begin
  ShowHFBar(Value);
end;

procedure TdxfmPreviewWdxBar.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  SaveBarManagerToRegistry(APath);
end;

procedure TdxfmPreviewWdxBar.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  LoadBarManagerFromRegistry(APath);
end;

procedure TdxfmPreviewWdxBar.SaveBarManagerToRegistry(const APath: string);
begin
  with TRegistry.Create do
  try
    if OpenKey(APath + '\Version', True) then
    try
      WriteInteger('Major', dxPSVerMajor);
      WriteInteger('Minor', dxPSVerMinor);
    except
      on ERegistryException do
      else
        raise;
    end;
  finally
    Free;
  end;
  dxBarManager.SaveToRegistry(APath + '\ToolBars');
end;

procedure TdxfmPreviewWdxBar.LoadBarManagerFromRegistry(const APath: string);
var
  IsSameVersion: Boolean;
begin
  with TRegistry.Create do
  try
    IsSameVersion := OpenKey(APath + '\Version', False);
    if IsSameVersion then
    try
      IsSameVersion := ValueExists('Major') and ValueExists('Minor');
      if IsSameVersion then
        IsSameVersion := (ReadInteger('Major') = dxPSVerMajor) and 
                         (ReadInteger('Minor') = dxPSVerMinor);
    except
      on ERegistryException do
        IsSameVersion := False
      else
        raise;
    end;
  finally
    Free;
  end;

  if IsSameVersion then
  begin
    dxBarManager.LoadFromRegistry(APath + '\ToolBars');
    pmPreview.ItemLinks := bsiShortcutPreview.ItemLinks;
  end
  else
    bsiShortcutPreview.ItemLinks := pmPreview.ItemLinks;
end;

procedure TdxfmPreviewWdxBar.seActivePageChange(Sender: TObject);
var
  V: Integer;
begin
  if Locked then Exit;
  V := seActivePage.IntCurValue;
  if V < seActivePage.MinValue then V := Round(seActivePage.MinValue);
  if V > seActivePage.MaxValue then V := Round(seActivePage.MaxValue);
  DoActivePageChanged(V - 1);
end;

procedure TdxfmPreviewWdxBar.seActivePageButtonClick(
  Sender: TdxBarSpinEdit; Button: TdxBarSpinEditButton);
begin
  if Locked then Exit;
  case Button of
    sbUp: 
      GoToNextPage;
    sbDown: 
      GoToPrevPage;
  end;
end;

procedure TdxfmPreviewWdxBar.cbxPredefinedZoomChange(Sender: TObject);
begin
  SetZoomFactorByText(cbxPredefinedZoom.Text);
  if cbxPredefinedZoom.DroppedDown then Windows.SetFocus(Preview.Handle);
  UpdateControls;
  cbxPredefinedZoom.Text := AddPercentageChar(IntToStr(ZoomFactor));
end;
                
procedure TdxfmPreviewWdxBar.dxBarManagerBarVisibleChange(Sender: TdxBarManager;
  ABar: TdxBar);
begin
  if ABar = HFBar then UpdateHFState(ABar.Visible);
end;

procedure TdxfmPreviewWdxBar.miCustomizePopupClick(Sender: TObject);
begin
  ShowdxBarSubMenuEditor(pmPreview.ItemLinks);
end;

procedure TdxfmPreviewWdxBar.bbViewHFCloseClick(Sender: TObject);
begin
  DoShowHFToolBar(False);
end;

procedure TdxfmPreviewWdxBar.bbFormatHeaderAndFooterClick(Sender: TObject);
begin
  DoShowHFToolBar(TdxBarButton(Sender).Down);
end;

procedure TdxfmPreviewWdxBar.InsertHFClick(Sender: TObject);
begin
  DoInsertHF(HFFunctionList[TComponent(Sender).Tag]);
end;

procedure TdxfmPreviewWdxBar.bbFormatHFClearClick(Sender: TObject);
begin
  DoClearHF;
end;

procedure TdxfmPreviewWdxBar.bbViewHFSwitchHeaderFooterClick(Sender: TObject);
begin
  CurrentHFMode := TdxHFPageType(not TdxBarButton(Sender).Down);
end;

procedure TdxfmPreviewWdxBar.bbFormatDateTimeClick(Sender: TObject);
begin
  ProcessMessages;
  DoShowFormatDateTimeDlg;
end;

procedure TdxfmPreviewWdxBar.bbFormatPageNumbersClick(Sender: TObject);
begin
  ProcessMessages;
  DoShowFormatPageNumbersDlg;
end;

procedure TdxfmPreviewWdxBar.SwitchPartClick(Sender: TObject);
begin
  CurrentHFTitlePart := TdxPageTitlePart(TdxBarButton(Sender).Tag)
end;

procedure TdxfmPreviewWdxBar.bliInsertAutoTextEntriesClick(Sender: TObject);
var
  S: string;
begin
  ProcessMessages;
  with TdxBarListItem(Sender) do
    S := Items[ItemIndex];
end;

procedure TdxfmPreviewWdxBar.bbFormatHFBackgroundClick(Sender: TObject);
begin
  ProcessMessages;
  DoShowHFBackgroundDlg(CalcWindowPos(Sender));
end;

procedure TdxfmPreviewWdxBar.bbViewPageHeadersClick(Sender: TObject);
begin
  if Locked then Exit;
  DoShowPageHeaders(TdxBarButton(Sender).Down);
end;

procedure TdxfmPreviewWdxBar.bbViewPageFootersClick(Sender: TObject);
begin
  if Locked then Exit;
  DoShowPageFooters(TdxBarButton(Sender).Down);
end;

procedure TdxfmPreviewWdxBar.bbToolsCustomizeClick(Sender: TObject);
begin
  dxBarManager.Customizing(True);
end;

procedure TdxfmPreviewWdxBar.bbToolsOptionsClick(Sender: TObject);
begin
  DoShowOptionsDlg;
end;

procedure TdxfmPreviewWdxBar.dxBarManagerShowCustomizingForm(Sender: TObject);
begin
  ShowShortCutBar(True);
end;

procedure TdxfmPreviewWdxBar.dxBarManagerHideCustomizingForm(Sender: TObject);
begin
  ShowShortCutBar(False);
end;

procedure TdxfmPreviewWdxBar.ShowShortCutBar(Value: Boolean);
var
  Bar: TdxBar;
begin
  Bar := ShortcutBar;
  if Bar <> nil then
  begin
    Bar.Hidden := not Value;
    Bar.Visible := False;
    if Value then
      bsiShortcutPreview.ItemLinks := pmPreview.ItemLinks
    else
      pmPreview.ItemLinks := bsiShortcutPreview.ItemLinks;
  end;
end;

function TdxfmPreviewWdxBar.CalcWindowPos(Sender: TObject): TPoint;
var
  Link: TdxBarItemLink;
  R: TRect;
begin
  Link := TdxBarItem(Sender).ClickItemLink;
  if (Link <> nil) and (Link.Control <> nil) then
  begin
    R := Link.ItemRect;
    MapWindowPoints(Link.BarControl.Handle, 0, R, 2);
    Result.X := R.Left;
    Result.Y := R.Bottom;
  end
  else
    Result := Preview.ClientOrigin;
end;

procedure TdxfmPreviewWdxBar.EnableItemsWhileBuilding(Value: Boolean);
const
  CategoryCount = 4;
  CategoryIndexes: array[0..CategoryCount - 1] of Integer = (0, 1, 2, 4);
var
  Items: TList;
  I, J: Integer;
begin
  Items := TList.Create;
  try
    for I := 0 to CategoryCount - 1 do
    begin
      dxBarManager.GetItemsByCategory(CategoryIndexes[I], Items);
      for J := 0 to Items.Count - 1 do
        TdxBarItem(Items.List^[J]).Enabled := Value;
    end;
  finally
    Items.Free;
  end;
  bbFileExit.Enabled := True;
end;

procedure TdxfmPreviewWdxBar.EnabledHFItems(Value: Boolean);
begin
  bsiInsertHFAutoText.Enabled := Value;
  bbInsertHFPageNumber.Enabled := Value;
  bbInsertHFTotalPages.Enabled := Value;
  bbInsertHFPageOfPages.Enabled := Value;
  bbInsertHFDate.Enabled := Value;
  bbInsertHFTime.Enabled := Value;
  bbInsertHFDateTime.Enabled := Value;
  bbViewHFSwitchHeaderFooter.Enabled := Value;
  bbInsertHFUserName.Enabled := Value;
  bbInsertHFMachineName.Enabled := Value;
  bbViewHFClose.Enabled := Value;
  bbViewSwitchToLeftPart.Enabled := Value;
  bbViewSwitchToCenterPart.Enabled := Value;
  bbViewSwitchToRightPart.Enabled := Value;
  bbFormatHFClear.Enabled := Value;
  bbInsertEditAutoText.Enabled := Value;
  bliInsertAutoTextEntries.Enabled := Value;
  bbFormatHFBackground.Enabled := Value;
end;

function TdxfmPreviewWdxBar.HFBar: TdxBar;
begin
  Result := dxBarManager.BarByCaption(DropAmpersand(sdxHeaderFooterBar));
end;

function TdxfmPreviewWdxBar.ShortcutBar: TdxBar;
begin
  Result := dxBarManager.BarByCaption(DropAmpersand(sdxShortCutMenusBar));
end;

procedure TdxfmPreviewWdxBar.ShowHFBar(Value: Boolean);
var
  Bar: TdxBar;
begin
  Bar := HFBar;
  if Bar <> nil then Bar.Visible := Value;
end;

procedure TdxfmPreviewWdxBar.UpdateHFState(Value: Boolean);
begin
  EnabledHFItems(Value);
  if Preview <> nil then
    if Value then
      Preview.OptionsZoom := Preview.OptionsZoom - [pozZoomOnClick]
    else
      Preview.OptionsZoom := Preview.OptionsZoom + [pozZoomOnClick];
  bbFormatHeaderAndFooter.Down := Value;
  if Value then CurrentHFMode := ptHeader;
end;
                                                
initialization
  dxPSRegisterPopupMenuBuilderClass(TdxBarPSPopupMenuBuilder);
  dxPSRegisterPageSetupMenuBuilderClass(TdxBarPSPageSetupMenuBuilder);
  dxPSRegisterPreviewWindow(TdxfmPreviewWdxBar);
  
finalization
  dxPSUnregisterPreviewWindow(TdxfmPreviewWdxBar);
  dxPSUnregisterPageSetupMenuBuilderClass(TdxBarPSPageSetupMenuBuilder);
  dxPSUnregisterPopupMenuBuilderClass(TdxBarPSPopupMenuBuilder);
  
end.
