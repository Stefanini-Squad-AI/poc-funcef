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

unit dxPSPrVw;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Messages, Controls, {$IFDEF DELPHI4}ImgList,{$ENDIF} 
  ComCtrls, ExtCtrls, Forms, 
  dxPSCore, dxBkgnd, dxPrnPg, dxPSESys, dxPrevw, dxPSPrVwOpt;

type
  TfmPreviewStatusSection = (ssCurrentPage, ssPageCount, ssPaperSize, ssStatus);
  TfmPreviewStatusSections = set of TfmPreviewStatusSection;
  
const   
  pssAll: TfmPreviewStatusSections = [ssCurrentPage, ssPageCount, ssPaperSize, ssStatus];

type
  TCustomdxPSPreviewWindow = class(TBasedxPreviewWindow)
  private
    FBuildEventsSubscriber: TdxEventSubscriber;    
    FComponentPrinter: TCustomdxComponentPrinter;
    FCurrentHFMode: TdxHFPageType;
    FCurrentHFTitlePart: TdxPageTitlePart;
    FCurrentOpCompleted: Double;
    FCurrentProgressValue: Integer;
    FEnableOptions: TdxPreviewEnableOptions;
    FFullPageCount: Integer;
    FHFFunctionList: TStringList;
    FLastGoodZoomFactor: Integer;    
    FLastOpCompleted: Integer;
    FPredefinedZooms: TStringList;
    FPrintEventsSubscriber: TdxEventSubscriber;
    FSaveZoomPosition: Boolean;
    FShowMarginBar: Boolean;
    FShowPageMargins: Boolean;
    FShowStatusBar: Boolean;
    FStyleSubscriber: TdxEventSubscriber;
    FUpdateCount: Integer;
    FVisibleOptions: TdxPreviewVisibleOptions;

    function GetFlat: Boolean;
    function GetPrinterPage: TdxPrinterPage;
    function GetShowMarginBar: Boolean;
    function GetShowPageMargins: Boolean;
    function GetShowStatusBar: Boolean;

    procedure SetCurrentHFMode(Value: TdxHFPageType);
    procedure SetCurrentHFTitlePart(Value: TdxPageTitlePart);
    procedure SetCurrentOpCompleted(const Value: Double);
    procedure SetShowMarginBar(Value: Boolean);
    procedure SetShowPageMargins(Value: Boolean);
    procedure SetShowStatusBar(Value: Boolean);

    procedure DrawStatusFrame(AStatusBar: TStatusBar; var R: TRect);
    procedure DrawStatusText(AStatusBar: TStatusBar; const AText: string; 
      const R: TRect; AHighlighted: Boolean);
    procedure FillEffectsApply(Sender: TObject);
   {$IFNDEF DELPHI4}    
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   {$ENDIF}    
    procedure MarginBarDblClick(Sender: TObject);
    procedure MarginBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure PreviewAfterDragMargin(Sender: TObject; AMargin: TdxPreviewMargin);
    procedure PreviewBeforeDragMargin(Sender: TObject; AMargin: TdxPreviewMargin);
    procedure PreviewCalcPageCount(Sender: TObject);
    procedure PreviewCanShowMarginHint(Sender: TObject; var ACanShowHint: Boolean);
    procedure PreviewDblClick(Sender: TObject);
    procedure PreviewDragMargin(Sender: TObject; AMargin: TdxPreviewMargin);
    procedure PreviewMarginsChanged(Sender: TObject; AMargin: TdxPreviewMargin);
    procedure PreviewSelectedPageChanged(Sender: TObject; APageIndex: Integer);
    procedure PreviewSelectingPage(Sender: TObject; APageIndex: Integer; var ACanSelect: Boolean);
    procedure PreviewZoomFactorChanged(Sender: TObject);
    procedure PreviewZoomModeChanged(Sender: TObject);
    procedure StatusBarDblClick(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure StatusBarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

    procedure EndGenerateReport(Sender: TObject; AReportLink: TBasedxReportLink);
    procedure GenerateReportProgress(Sender: TObject; AReportLink: TBasedxReportLink; APercentDone: Double);
    procedure StartGenerateReport(Sender: TObject; AReportLink: TBasedxReportLink);
        
    procedure EndPrint(Sender: TObject; AReportLink: TBasedxReportLink);
    procedure NewPage(Sender: TObject; AReportLink: TBasedxReportLink; APageIndex: Integer);
    procedure StartPrint(Sender: TObject; AReportLink: TBasedxReportLink; FullPageCount: Integer);    
    
    procedure LoadZooms;
    procedure RefreshProgressBar(Value: Double);    
    procedure UpdateMarginBar;
    procedure WMSettingChange(var message: TMessage); message WM_SETTINGCHANGE;    
  protected
    FMarginBar: TStatusBar;
    FPreview: TdxPreview;
    FPreviewPanel: TPanel;
    FStatusBar: TStatusBar;

    FMarginsValid: Boolean;
    FReleased: Boolean;

    procedure Activate; override;    
   {$IFDEF DELPHI4}    
    procedure DoClose(var AAction: TCloseAction); override;
   {$ENDIF}    
    procedure DoShow; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure WndProc(var message: TMessage); override;

    function GetActivePageIndex: Integer; override;
    function GetBackground: TdxBackground; override;
    function GetComponentPrinter: TCustomdxComponentPrinter; override;
    function GetPageCount: Integer; override;
    function GetPreviewEnableOptions: TdxPreviewEnableOptions; override;
    function GetPreviewVisibleOptions: TdxPreviewVisibleOptions; override;
    function GetSaveZoomPosition: Boolean; override;
    function GetVisiblePageSize: TPoint; override;
    function GetZoomFactor: Integer; override;
    procedure SetActivePageIndex(Value: Integer); override;
    procedure SetBackground(const Value: TdxBackground); override;
    procedure SetComponentPrinter(const Value: TCustomdxComponentPrinter); override;
    procedure SetPageCount(Value: Integer); override;
    procedure SetPreviewEnableOptions(const Value: TdxPreviewEnableOptions); override;
    procedure SetPreviewVisibleOptions(const Value: TdxPreviewVisibleOptions); override;
    procedure SetSaveZoomPosition(Value: Boolean); override;
    procedure SetZoomFactor(Value: Integer); override;

    procedure BeginUpdate; override;
    procedure CancelUpdate; override;   
    procedure EndUpdate; override;
    function Locked: Boolean; override;

    function CanChangeMargins: Boolean;
    function CanClosePreviewWindow: Boolean; virtual;
    function CanDesign: Boolean;
    function CanPageSetup: Boolean;    
    function CanPrint: Boolean;
    function CanPrintDialog: Boolean;    
    function CanPrintStyle: Boolean;
    
    procedure DoActivePageChanged(AValue: Integer);
    procedure DoClearHF;
    procedure DoDesignReport;
    procedure DoInsertHF(const S: string);
    procedure DoPageSetupReport(APageIndex: Integer);
    procedure DoPrintReport(AShowDialog: Boolean);
    procedure DoSetupZoomFactor(AZoomFactor, APageXCount, APageYCount: Integer; 
      AZoomMode: TdxPreviewZoomMode);
    procedure DoShowEmptyPages(Value: Boolean);
    procedure DoShowFormatDateTimeDlg;
    procedure DoShowFormatPageNumbersDlg;
    procedure DoShowHFBackgroundDlg(const Pt: TPoint);
    procedure DoShowMultiplySelectPagesDlg(
      AImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
      AImageIndex: Integer; const Pt: TPoint; AYShift: Integer);
    procedure DoShowOptionsDlg;
    procedure DoShowPageBackgroundDlg(const Pt: TPoint);
    procedure DoShowPageFooters(Value: Boolean);
    procedure DoShowPageHeaders(Value: Boolean);
    procedure DoShowZoomDlg;
    procedure DoShrinkToPageWidth(Value: Boolean);
    procedure DoInvokeHelp;
    
    function IsBuilding: Boolean;
    function IsEnabled(AOption: TdxPreviewEnableOption): Boolean;
    function IsPrinting: Boolean;
    function IsVisible(AOption: TdxPreviewVisibleOption): Boolean;
   {$IFNDEF DELPHI4}
    procedure InvalidateMarginPanel(AMargin: TdxPreviewMargin);
   {$ENDIF}
    procedure InvalidatePagesHeadersOrFooters;
    function MarginStatusPanel(AMargin: TdxPreviewMargin): TStatusPanel;
    procedure PrepareProgress;
    procedure UnprepareProgress;
    procedure RefreshStatusBar(AStatusSections: TfmPreviewStatusSections);
    procedure RefreshMarginBar(AMargin: TdxPreviewMargin);
    function SectionStatusPanel(AStatusSection: TfmPreviewStatusSection): TStatusPanel;
    procedure SetZoomFactorByText(const AText: string);
    
    procedure LoadPropertiesFromRegistry(const APath: string);
    procedure SavePropertiesToRegistry(const APath: string);
    procedure SavePreferences(AData: TdxPreviewOptionsDlgData);
            
    procedure CreateControls; virtual;
    procedure CreateEventSubscribers; virtual;
    procedure CreateMarginBar; virtual;    
    procedure CreatePreview; virtual;
    procedure CreatePreviewPanel; virtual;
    procedure CreateStatusBar; virtual;
    procedure DoAfterPrintReport(AShowDialog: Boolean); virtual;
    procedure DoPreviewAfterDragMargin(APreview: TdxPreview; AMargin: TdxPreviewMargin); virtual;
    procedure DoPreviewBeforeDragMargin(APreview: TdxPreview; AMargin: TdxPreviewMargin); virtual;
    procedure DoPreviewDblClick(APreview: TdxPreview); virtual;    
    procedure DoPreviewDragMargin(APreview: TdxPreview; AMargin: TdxPreviewMargin); virtual;
    procedure DoPreviewMarginChanged(APreview: TdxPreview; AMargin: TdxPreviewMargin); virtual;
    procedure DoPreviewZoomFactorChanged(APreview: TdxPreview); virtual;
    procedure DoPreviewZoomModeChanged(APreview: TdxPreview); virtual;
    procedure DoShowHFToolBar(Value: Boolean); virtual;
    function GetPreviewCanShowMarginHint(APreview: TdxPreview): Boolean; virtual;
    procedure LoadStrings; virtual;
    procedure StyleListChanged(Sender: TObject); virtual;
    function ValidateMargins: Boolean; virtual;    
    
    property ComponentPrinter: TCustomdxComponentPrinter read GetComponentPrinter;
    property CurrentHFMode: TdxHFPageType read FCurrentHFMode write SetCurrentHFMode;
    property CurrentHFTitlePart: TdxPageTitlePart read FCurrentHFTitlePart write SetCurrentHFTitlePart;
    property CurrentOpCompleted: Double read FCurrentOpCompleted write SetCurrentOpCompleted;
    property HFFunctionList: TStringList read FHFFunctionList;
    property PredefinedZooms: TStringList read FPredefinedZooms;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   {$IFDEF DELPHI4}    
    function CloseQuery: Boolean; override;
   {$ENDIF}    
    procedure AfterConstruction; override;
    procedure GoToFirstPage; override;
    procedure GoToLastPage; override;
    procedure GoToNextPage; override;
    procedure GoToPrevPage; override;
    procedure InitContent; override;
    procedure InvalidateContent; override;
    procedure InvalidatePage(APageIndex: Integer); override;
    procedure InvalidateAllPages; override;
    procedure InvalidatePagesContent; override;
    procedure InvalidatePagesHeaderContent; override;
    procedure InvalidatePagesFooterContent; override;
    procedure LoadFromRegistry(const APath: string); override;
    procedure SaveToRegistry(const APath: string); override;    
    procedure UpdateControls; override;

    property Flat: Boolean read GetFlat;
    property Preview: TdxPreview read FPreview;
    property PrinterPage: TdxPrinterPage read GetPrinterPage;
    property ShowMarginBar: Boolean read GetShowMarginBar write SetShowMarginBar;
    property ShowPageMargins: Boolean read GetShowPageMargins write SetShowPageMargins;
    property ShowStatusBar: Boolean read GetShowStatusBar write SetShowStatusBar;
  end;

function GetCurrentPrinterAsHint: string;
  
function AddStatusPanel(AStatusBar: TStatusBar; AAlignment: TAlignment; 
  AStyle: TStatusPanelStyle; ABevel: TStatusPanelBevel; const AText: string; 
  AWidth: Integer): TStatusPanel;
  
implementation

uses
  CommCtrl, SysUtils, MATH, Registry, Graphics, 
  dxPSGlbl, dxPSEvnt, dxPSUtl, dxPgsDlg, dxPSEngn, dxPrnDev, dxfmclr, dxPSRes, 
  dxfmDTFmt, dxfmPNFmt, dxfmmnpg, dxfmZoom;

const
  dxPredefinedZoomValueCount = 8;
  WMPS_UPDATEMARGINS = WM_USER + 1;
  
function GetCurrentPrinterAsHint: string;
begin
  Result := dxPrintDevice.CurrentDevice;
  if Length(Result) > 0 then Result := ' (' + Result + ')';
end;    
 
function GetFlatStatusPanelColor: TColor;
var
  Offset: Byte;
begin
  Offset := (255 - GetGValue(ColorToRGB(clBtnFace))) div 4;
  Result := FindNearestColor(OffsetColor(clBtnFace, Offset, Offset, Offset));
end;

function GetFlatStatusPanelHighLightColor: TColor;
begin
  Result := FindNearestColor(OffsetColor(clHighLight, 172, 153, 104));
end;

function GetStatusColor(AStatusBar: TStatusBar): TColor;
begin
 {$IFDEF DELPHI4}
  Result := AStatusBar.Color;
 {$ELSE}
  Result := clBtnFace; 
 {$ENDIF}
end;

function GetStatusPanelBkColor(AStatusBar: TStatusBar; AFlat, AHighlighted: Boolean): TColor;
begin
  if AHighlighted then 
    if AFlat then 
      Result := GetFlatStatusPanelHighLightColor
    else
      Result := clHighLight
  else 
    if AFlat then 
      Result := GetFlatStatusPanelColor
    else
      Result := GetStatusColor(AStatusBar);
  Result := ColorToRGB(Result);
end;

function GetStatusPanelTextColor(AStatusBar: TStatusBar; AFlat, AHighlighted: Boolean): TColor;
begin
  if AFlat or not AHighlighted then 
    Result := AStatusBar.Font.Color
  else  
    Result := clHighlightText;
  Result := ColorToRGB(Result);
end;

function AddStatusPanel(AStatusBar: TStatusBar; AAlignment: TAlignment; 
  AStyle: TStatusPanelStyle; ABevel: TStatusPanelBevel; const AText: string; 
  AWidth: Integer): TStatusPanel;
begin
  Result := AStatusBar.Panels.Add;
  with Result do
  begin
    Alignment := AAlignment;
    Bevel := ABevel;
    Style := AStyle;
    Text := AText;
    Width := AWidth;
  end;
end;
  
function LoMetricToThousandthsOfInch(Value: Integer): Integer;
begin
  Result := MulDiv(Value, 1000, 254);
end;

function LoMetricToThousandthsOfMM(Value: Integer): Integer;
begin
  Result := 100 * Value;
end;

function StrPercentDrop(const S: string): string;
var
  I: Integer;
begin
  I := Length(S);
  while (I > 0) and (S[I] = '%') do Dec(I);
  Result := System.Copy(S, 1, I);
end;


{ TCustomdxPSPreviewWindow }  

constructor TCustomdxPSPreviewWindow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFNDEF DELPHI4}      
  OnClose := FormClose;
  OnCloseQuery := FormCloseQuery;
{$ENDIF}    
  FCurrentHFTitlePart := tpLeft;
  FEnableOptions := [Low(TdxPreviewEnableOption)..High(TdxPreviewEnableOption)] - [peoHelp];
  FLastGoodZoomFactor := 100;
  FVisibleOptions := [Low(TdxPreviewVisibleOption)..High(TdxPreviewVisibleOption)] - [pvoHelp];
end;

destructor TCustomdxPSPreviewWindow.Destroy;
begin
  FBuildEventsSubscriber.Free;
  FPrintEventsSubscriber.Free;
  FPredefinedZooms.Free;
  FStyleSubscriber.Free;
  FHFFunctionList.Free;
  inherited Destroy;
end;

procedure TCustomdxPSPreviewWindow.AfterConstruction;
begin
  FSaveZoomPosition := True;
  FShowPageMargins := True;
  FShowStatusBar := True;
  FShowMarginBar := True;
  LoadZooms;
  FHFFunctionList := TStringList.Create;
  dxGetHFFunctionsList(FHFFunctionList);
  CreateControls;
  LoadStrings;
  inherited AfterConstruction;
end;

procedure TCustomdxPSPreviewWindow.Activate;
begin
  ActiveControl := FPreview;
  inherited Activate;
end;

{$IFDEF DELPHI4}    
function TCustomdxPSPreviewWindow.CloseQuery: Boolean;
begin
  Result := CanClosePreviewWindow;
  if Result then Result := inherited CloseQuery;
end;

procedure TCustomdxPSPreviewWindow.DoClose(var AAction: TCloseAction);
begin
  inherited DoClose(AAction);
  AAction := caFree;
end;
{$ENDIF}    

procedure TCustomdxPSPreviewWindow.DoShow;
begin
  inherited DoShow;
  //Bug in Win2K and ComCtl32.dll from IE 5.0-5.5
  PostMessage(Handle, WMPS_UPDATEMARGINS, 0, 0);
end;  

procedure TCustomdxPSPreviewWindow.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_ESCAPE) and dxPrintDevice.Printing and (ComponentPrinter <> nil) then
    ComponentPrinter.AbortPrinting := True;
end;

procedure TCustomdxPSPreviewWindow.WndProc(var message: TMessage);
begin
  inherited;
  if message.Msg = WMPS_UPDATEMARGINS then UpdateMarginBar;
end;

procedure TCustomdxPSPreviewWindow.WMSettingChange(var message: TMessage);
begin
  inherited;
  RefreshMarginBar(nil);
  RefreshStatusBar([ssPaperSize]);
end;

procedure TCustomdxPSPreviewWindow.CreateControls;
begin
  CreateStatusBar;
  CreatePreviewPanel;
  CreatePreview;
  CreateMarginBar;
  CreateEventSubscribers;
end;

const
  Bevels: array[Boolean] of TStatusPanelBevel = (pbLowered, pbNone);
  Heights: array[Boolean] of Integer = (20, 22);
  
procedure TCustomdxPSPreviewWindow.CreateStatusBar;
begin
  FStatusBar := TStatusBar.Create(Self);
  with FStatusBar do 
  begin 
    Parent := Self;
    Height := Heights[Flat];
    ShowHint := True;
    OnDblClick := StatusBarDblClick;
    OnDrawPanel := StatusBarDrawPanel;
    OnMouseMove := StatusBarMouseMove;
  end;  

  AddStatusPanel(FStatusBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxPage) +  ':', 40);
  AddStatusPanel(FStatusBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 45);  
  AddStatusPanel(FStatusBar, taCenter,       psText,      pbNone, sdxOf, 20);    
  AddStatusPanel(FStatusBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 45);      
  AddStatusPanel(FStatusBar, taLeftJustify,  psText,      pbNone,       sdxPages, 50);    
  AddStatusPanel(FStatusBar, taLeftJustify,  psOwnerDraw, Bevels[Flat], '', 4);        
  AddStatusPanel(FStatusBar, taRightJustify, psText,      pbNone,       sdxPaperSize, 80);
  AddStatusPanel(FStatusBar, taLeftJustify,  psOwnerDraw, Bevels[Flat], '', 150);   
  AddStatusPanel(FStatusBar, taRightJustify, psText,      pbNone,       sdxStatus, 60);
  AddStatusPanel(FStatusBar, taLeftJustify,  psOwnerDraw, Bevels[Flat], sdxStatusReady, -1);  
end;

procedure TCustomdxPSPreviewWindow.CreateMarginBar;
begin
  FMarginBar := TStatusBar.Create(Self);
  with FMarginBar do
  begin
    Parent := FPreviewPanel;
    Align := alTop;  
    Height := Heights[Flat];
    SizeGrip := False;
    OnDblClick := MarginBarDblClick;
    OnDrawPanel := MarginBarDrawPanel;
  end;  

  AddStatusPanel(FMarginBar, taLeftJustify,  psText,      pbNone,       DropAmpersand(sdxMargins), 55);
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxLeft), 40);  
  AddStatusPanel(FMarginBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 70);    
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxTop), 40);        
  AddStatusPanel(FMarginBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 70);        
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxRight), 50); 
  AddStatusPanel(FMarginBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 70);   
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxBottom), 60);
  AddStatusPanel(FMarginBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 70);     
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxHeader2), 50); 
  AddStatusPanel(FMarginBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 70);   
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       DropAmpersand(sdxFooter2), 50);
  AddStatusPanel(FMarginBar, taRightJustify, psOwnerDraw, Bevels[Flat], '', 70);     
  AddStatusPanel(FMarginBar, taRightJustify, psText,      pbNone,       '', -1);
end;

procedure TCustomdxPSPreviewWindow.CreatePreviewPanel;
begin
  FPreviewPanel := TPanel.Create(Self);
  with FPreviewPanel do 
  begin
    Parent := Self;
    Align := alClient;
    BevelInner := bvNone;
    BevelOuter := bvNone;  
    Caption := '';
  end;  
end;

procedure TCustomdxPSPreviewWindow.CreatePreview;
begin
  FPreview := TdxPreview.Create(Self);
  with FPreview do
  begin
    Parent := FPreviewPanel;
    Align := alClient;
    if Flat then
      LookAndFeel := plfUltraFlat
    else  
      LookAndFeel := plfStandard;
      
    if IsWin95 then 
      OptionsBehavior := OptionsBehavior - [pobThumbTracking];    
    
    OnCanShowMarginHint := PreviewCanShowMarginHint;
    OnDblClick := PreviewDblClick;
    OnSelectingPage := PreviewSelectingPage;
    
    TdxPreviewPageBackground(PageBackground).OnApply := FillEffectsApply;
  end;
end;

procedure TCustomdxPSPreviewWindow.CreateEventSubscribers;
begin
  FPrintEventsSubscriber := TdxPSPrintReportSubscriber.Create([TdxPSPrintEvent]);
  TdxPSPrintReportSubscriber(FPrintEventsSubscriber).OnEndPrint := EndPrint;
  TdxPSPrintReportSubscriber(FPrintEventsSubscriber).OnProgressPrint := NewPage;
  TdxPSPrintReportSubscriber(FPrintEventsSubscriber).OnStartPrint := StartPrint;
  
  FBuildEventsSubscriber := TdxPSBuildReportSubscriber.Create([TdxPSBuildEvent]);  
  TdxPSBuildReportSubscriber(FBuildEventsSubscriber).OnEndGenerateReport := EndGenerateReport;
  TdxPSBuildReportSubscriber(FBuildEventsSubscriber).OnGenerateReportProgress := GenerateReportProgress;
  TdxPSBuildReportSubscriber(FBuildEventsSubscriber).OnStartGenerateReport := StartGenerateReport;

  FStyleSubscriber := TdxStyleListChangedSubscriber.Create([TdxSMStyleListChangedEvent]);
  TdxStyleListChangedSubscriber(FStyleSubscriber).OnStyleListChanged := StyleListChanged;
end;

procedure TCustomdxPSPreviewWindow.BeginUpdate;
begin
  FPreview.BeginUpdate;
  Inc(FUpdateCount);
end;

procedure TCustomdxPSPreviewWindow.CancelUpdate;
begin
  if FUpdateCount <> 0 then 
  begin
    FPreview.CancelUpdate;
    Dec(FUpdateCount);
  end;
end;

procedure TCustomdxPSPreviewWindow.EndUpdate;
begin
  if FUpdateCount <> 0 then 
  begin
    FPreview.EndUpdate;
    Dec(FUpdateCount);
    if FUpdateCount = 0 then UpdateControls;
  end;
end;

function TCustomdxPSPreviewWindow.Locked: Boolean;
begin
  Result := FUpdateCount <> 0;
end;

procedure TCustomdxPSPreviewWindow.LoadZooms;
begin
  FPredefinedZooms := TStringList.Create;
  with FPredefinedZooms do
  begin
    AddObject('500%', TObject(500));
    AddObject('200%', TObject(200));
    AddObject('150%', TObject(150));
    AddObject('100%', TObject(100));
    AddObject('75%', TObject(75));
    AddObject('50%', TObject(50));
    AddObject('25%', TObject(25));
    AddObject('10%', TObject(10));
    AddObject(sdxPageWidth, TObject(-1));
    AddObject(sdxWholePage, TObject(-1));
    AddObject(sdxTwoPages, TObject(-1));
    AddObject(sdxFourPages, TObject(-1));
    AddObject(sdxWidenToSourceWidth, TObject(-1));
  end;
end;

function TCustomdxPSPreviewWindow.CanClosePreviewWindow: Boolean;
begin
  Result := True;
  if not FReleased and (ComponentPrinter <> nil) then
  begin
    Result := not (IsBuilding or IsPrinting) or Application.Terminated;
    FReleased := not Application.Terminated and 
      (IsBuilding or (IsPrinting and MessageQuestion(sdxAbortPrinting)));
    if FReleased then ComponentPrinter.AbortPrinting := True;
  end;
end;
  
function TCustomdxPSPreviewWindow.GetActivePageIndex: Integer;
begin
  if FPreview <> nil then
    Result := FPreview.SelPageIndex
  else
    Result := 0;
end;

function TCustomdxPSPreviewWindow.GetBackground: TdxBackground;
begin
  if FPreview <> nil then
    Result := FPreview.PageBackground
  else
    Result := nil;
end;

function TCustomdxPSPreviewWindow.GetComponentPrinter: TCustomdxComponentPrinter;
begin
  Result := FComponentPrinter;
end;

function TCustomdxPSPreviewWindow.GetVisiblePageSize: TPoint;
begin
  if FPreview <> nil then
    Result := FPreview.VisiblePageSize
  else
    Result := Point(0, 0);
end;

function TCustomdxPSPreviewWindow.GetZoomFactor: Integer;
begin
  if FPreview <> nil then
    Result := FPreview.ZoomFactor
  else
    Result := 100;
end;

function TCustomdxPSPreviewWindow.GetFlat: Boolean;
begin
  Result := dxPSEngine.LookAndFeel = pslfFlat;
end;

function TCustomdxPSPreviewWindow.GetPrinterPage: TdxPrinterPage;
begin
  if (ComponentPrinter <> nil) and (ComponentPrinter.CurrentLink <> nil) then 
    Result := ComponentPrinter.CurrentLink.RealPrinterPage
  else
    Result := nil;
end;

function TCustomdxPSPreviewWindow.GetPreviewEnableOptions: TdxPreviewEnableOptions;
begin
  Result := FEnableOptions;
end;

function TCustomdxPSPreviewWindow.GetPreviewVisibleOptions: TdxPreviewVisibleOptions;
begin
  Result := FVisibleOptions;
end;

function TCustomdxPSPreviewWindow.GetPageCount: Integer;
begin
  if FPreview <> nil then 
    Result := FPreview.PageCount
  else
    Result := 0;
end;

function TCustomdxPSPreviewWindow.GetSaveZoomPosition: Boolean;
begin
  Result := FSaveZoomPosition;
end;

function TCustomdxPSPreviewWindow.GetShowMarginBar: Boolean;
begin
  Result := FShowMarginBar;
end;

function TCustomdxPSPreviewWindow.GetShowPageMargins: Boolean;
begin
  Result := FShowPageMargins;
end;

function TCustomdxPSPreviewWindow.GetShowStatusBar: Boolean;
begin
  Result := FShowStatusBar;
end;

procedure TCustomdxPSPreviewWindow.SetActivePageIndex(Value: Integer);
begin
  if FPreview <> nil then FPreview.SelPageIndex := Value;
end;

procedure TCustomdxPSPreviewWindow.SetZoomFactor(Value: Integer);
begin
  if FPreview <> nil then FPreview.ZoomFactor := Value;
end;

procedure TCustomdxPSPreviewWindow.SetBackground(const Value: TdxBackground);
begin
  if FPreview <> nil then FPreview.PageBackground := Value;
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.SetComponentPrinter(const Value: TCustomdxComponentPrinter);
begin
  FComponentPrinter := Value;
  if ComponentPrinter = nil then Exit;

  SaveZoomPosition := ComponentPrinter.PreviewOptions.SaveZoomPosition;
  FPreview.OnDrawPageContent := PaintPage;
  FPreview.OnCalcPageCount := PreviewCalcPageCount;
  FPreview.OnSelectedPageChanged := PreviewSelectedPageChanged;
  FPreview.OnAfterDragMargin := PreviewAfterDragMargin;
  FPreview.OnBeforeDragMargin := PreviewBeforeDragMargin;
  FPreview.OnDragMargin := PreviewDragMargin;
  FPreview.OnMarginChanged := PreviewMarginsChanged;
  FPreview.OnZoomFactorChanged := PreviewZoomFactorChanged;
  FPreview.OnZoomModeChanged := PreviewZoomModeChanged;

  InitContent;
  UpdateControls;
  FMarginsValid := ValidateMargins;
  StyleListChanged(ComponentPrinter.CurrentLink.StyleManager);  
end;

procedure TCustomdxPSPreviewWindow.SetPageCount(Value: Integer);
begin
  if FPreview <> nil then FPreview.PageCount := Value;
end;

procedure TCustomdxPSPreviewWindow.SetPreviewEnableOptions(const Value: TdxPreviewEnableOptions);
begin
  FEnableOptions := Value;
  if (ComponentPrinter <> nil) and not ComponentPrinter.CurrentLink.CheckToDesign then
    FEnableOptions := FEnableOptions - [peoReportDesign];
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.SetPreviewVisibleOptions(const Value: TdxPreviewVisibleOptions);
begin
  FVisibleOptions := Value;
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.SetSaveZoomPosition(Value: Boolean);
begin
  FSaveZoomPosition := Value;
  if FPreview <> nil then 
    if SaveZoomPosition then 
      FPreview.OptionsStore := FPreview.OptionsStore + [posZoom]
    else
      FPreview.OptionsStore := FPreview.OptionsStore - [posZoom];
end;

procedure TCustomdxPSPreviewWindow.SetShowMarginBar(Value: Boolean);
begin
  if FShowMarginBar <> Value then
  begin
    FShowMarginBar := Value;
    if not (csLoading in ComponentState) then UpdateControls;
  end;
end;

procedure TCustomdxPSPreviewWindow.SetShowPageMargins(Value: Boolean);
begin
  if FShowPageMargins <> Value then
  begin
    FShowPageMargins := Value;
    if FShowPageMargins then 
      Preview.OptionsView := Preview.OptionsView + [povMargins]
    else
      Preview.OptionsView := Preview.OptionsView - [povMargins];
    FPreview.Margins[pmGutter].Visible := False;
    UpdateControls;
  end;
end;

procedure TCustomdxPSPreviewWindow.SetShowStatusBar(Value: Boolean);
begin
  if (FShowStatusBar <> Value) then
  begin
    FShowStatusBar := Value;
    UpdateControls;
  end;
end;

procedure TCustomdxPSPreviewWindow.SetCurrentHFMode(Value: TdxHFPageType);
begin
  FCurrentHFMode := Value;
end;

procedure TCustomdxPSPreviewWindow.SetCurrentHFTitlePart(Value: TdxPageTitlePart);
begin
  FCurrentHFTitlePart := Value;
end;

procedure TCustomdxPSPreviewWindow.SetCurrentOpCompleted(const Value: Double);
begin
  FCurrentOpCompleted := Value;
  RefreshProgressBar(CurrentOpCompleted / 100);
end;

procedure TCustomdxPSPreviewWindow.GoToFirstPage;
begin
  if FPreview <> nil then FPreview.SelectFirstPage;
end;

procedure TCustomdxPSPreviewWindow.GoToLastPage;
begin
  if FPreview <> nil then FPreview.SelectLastPage;
end;

procedure TCustomdxPSPreviewWindow.GoToNextPage;
begin
  if FPreview <> nil then FPreview.SelectNextPage;
end;

procedure TCustomdxPSPreviewWindow.GoToPrevPage;
begin
  if FPreview <> nil then FPreview.SelectPrevPage;
end;

procedure TCustomdxPSPreviewWindow.LoadStrings;
begin
{
  with FMarginBar do 
  begin
    Panels[0].Text := DropAmpersand(sdxMargins);
    Panels[1].Text := DropAmpersand(sdxLeft);
    Panels[3].Text := DropAmpersand(sdxTop);
    Panels[5].Text := DropAmpersand(sdxRight);
    Panels[7].Text := DropAmpersand(sdxBottom);
    Panels[9].Text := DropAmpersand(sdxHeader2);
    Panels[11].Text := DropAmpersand(sdxFooter2);
    Hint := sdxHintDoubleClickForChangeMargins;
  end;
}
  
  with FStatusBar do 
  begin
    Panels[0].Text := DropAmpersand(sdxPage) + ':';
    Panels[2].Text := AnsiLowerCase(sdxOf);
    Panels[4].Text := sdxPages;
    Panels[6].Text := sdxPaperSize;
    Panels[8].Text := sdxStatus;
    Panels[9].Text := sdxStatusReady;
  end;  
end;

procedure TCustomdxPSPreviewWindow.StyleListChanged(Sender: TObject);
begin
end;

function  TCustomdxPSPreviewWindow.ValidateMargins: Boolean;
begin
  Result := (ComponentPrinter = nil) or ComponentPrinter.CurrentLink.RealPrinterPage.ValidateMargins;
end;

procedure TCustomdxPSPreviewWindow.InitContent;
var
  Link: TBasedxReportLink;
  Page: TdxPrinterPage;
  R: TRect;
begin
  Link := ComponentPrinter.CurrentLink;
  Page := PrinterPage;
  FPreview.OriginalPageSize.Point := Page.PageSizeLoMetric;
  FPreview.Orientation := TdxPreviewPaperOrientation(Page.Orientation);
  FPreview.MinUsefulSize := Point(Page.MinPrintableAreaLoMetric, Page.MinPrintableAreaLoMetric);
  FPreview.PageCount := Link.VisiblePageCount;
  FPreview.MaxZoomFactor := 500;
  FPreview.MinZoomFactor := 10;
  FPreview.MinHeaderSize := 0;
  FPreview.MinFooterSize := 0;
  
  FPreview.MeasurementUnits := TdxPreviewMeasurementUnits(Page.MeasurementUnits);
  R := Page.MinMarginsLoMetric;
  FPreview.Margins[pmLeft].MinValue := R.Left;
  FPreview.Margins[pmTop].MinValue := R.Top;
  FPreview.Margins[pmRight].MinValue := R.Right;
  FPreview.Margins[pmBottom].MinValue := R.Bottom;

  R := Page.MarginsLoMetric;
  FPreview.Margins[pmGutter].Visible := False;
  FPreview.Margins[pmHeader].Value := Page.HeaderLoMetric;
  FPreview.Margins[pmFooter].Value := Page.FooterLoMetric;
  FPreview.Margins[pmLeft].Value := R.Left;
  FPreview.Margins[pmTop].Value := R.Top;
  FPreview.Margins[pmRight].Value := R.Right;
  FPreview.Margins[pmBottom].Value := R.Bottom;
  FPreview.MinFooterSize := 0;
  FPreview.MinHeaderSize := 0;
  FPreview.PageBackground := Page.Background;

  if not SaveZoomPosition then FPreview.ZoomFactor := 100;
end;

procedure TCustomdxPSPreviewWindow.InvalidateContent;
begin
  if FPreview <> nil then FPreview.Invalidate;
end;

procedure TCustomdxPSPreviewWindow.InvalidatePage(APageIndex: Integer);
begin
  if FPreview <> nil then FPreview.InvalidatePage(APageIndex);
end;

procedure TCustomdxPSPreviewWindow.InvalidateAllPages;
begin
  if FPreview <> nil then FPreview.InvalidatePages;
end;

procedure TCustomdxPSPreviewWindow.InvalidatePagesContent;
begin
  if FPreview <> nil then FPreview.InvalidatePagesContent;
end;

procedure TCustomdxPSPreviewWindow.InvalidatePagesHeaderContent;
begin
  if FPreview <> nil then FPreview.InvalidatePagesHeader;
end;

procedure TCustomdxPSPreviewWindow.InvalidatePagesFooterContent;
begin
  if FPreview <> nil then FPreview.InvalidatePagesFooter;
end;

procedure TCustomdxPSPreviewWindow.UpdateControls;
begin
  if Locked then Exit;
  BeginUpdate;
  try
    if CanChangeMargins then 
      Preview.OptionsBehavior := Preview.OptionsBehavior + [pobAllowDragMargins]
    else  
      Preview.OptionsBehavior := Preview.OptionsBehavior - [pobAllowDragMargins];    
  
    RefreshStatusBar(pssAll);
    RefreshMarginBar(nil);

    FMarginBar.Visible := ShowMarginBar;
    FStatusBar.Visible := ShowStatusBar;
    FMarginBar.ShowHint := CanChangeMargins;  
    
    //if ComponentPrinter <> nil then
    //   Preview.Enabled := not (cpsPrinting in ComponentPrinter.State);
  finally
    CancelUpdate;
  end;  
end;

// event handlers

{$IFNDEF DELPHI4}    
procedure TCustomdxPSPreviewWindow.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := CanClosePreviewWindow;
end;

procedure TCustomdxPSPreviewWindow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;
{$ENDIF}    

procedure TCustomdxPSPreviewWindow.DrawStatusFrame(AStatusBar: TStatusBar; var R: TRect);
var
  DC: HDC;
  Brush: HBRUSH;
begin
  DC := AStatusBar.Canvas.Handle;
  Brush := CreateSolidBrush(ColorToRGB(GetStatusColor(AStatusBar)));
  FillRect(DC, Rect(R.Left, R.Bottom - 1, R.Right, R.Bottom), Brush);
  DeleteObject(Brush);
  Dec(R.Bottom);
  FrameRect(DC, R, GetSysColorBrush(COLOR_BTNSHADOW));
  InflateRect(R, -1, -1);
end;

procedure TCustomdxPSPreviewWindow.DrawStatusText(AStatusBar: TStatusBar;
  const AText: string; const R: TRect; AHighlighted: Boolean);
const
  fuOptions: array[Boolean] of UINT = (0, ETO_OPAQUE);
var
  DC: HDC;
  W: Integer;
begin
  DC := AStatusBar.Canvas.Handle;
  SetTextColor(DC, GetStatusPanelTextColor(AStatusBar, Flat, AHighlighted));
  SetBkColor(DC, GetStatusPanelBkColor(AStatusBar, Flat, AHighlighted));

  W := AStatusBar.Canvas.TextWidth(AText);
  if W > R.Right - R.Left - 2 then 
    W := R.Right - R.Left - 2;
  
  ExtTextOut(DC, R.Right - W - 1, R.Top + 1 + Byte(not Flat),
    fuOptions[AHighlighted or Flat], @R, PChar(AText), Length(AText), nil);
end;
  
procedure TCustomdxPSPreviewWindow.FillEffectsApply(Sender: TObject);
begin
  FPreview.PageBackground := TdxBackground(Sender);
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.PreviewMarginsChanged(Sender: TObject; AMargin: TdxPreviewMargin);
var
  V: Integer;
begin
  if Locked then Exit;
  
  V := AMargin.Value;
  case FPreview.GetInnerMeasurementUnits of
    pmuInches:
      V := LoMetricToThousandthsOfInch(V);
    pmuMillimeters:
      V := LoMetricToThousandthsOfMM(V);
  end;
    
  if PrinterPage <> nil then
    case AMargin.MarginType of
      pmLeft:
        PrinterPage.Margins.Left := V;
      pmTop:
        PrinterPage.Margins.Top := V;
      pmRight:
        PrinterPage.Margins.Right := V;
      pmBottom:
        PrinterPage.Margins.Bottom := V;
      pmFooter:
        PrinterPage.Footer := V;
      pmHeader: 
        PrinterPage.Header := V;
    end;
  DoPreviewMarginChanged(TdxPreview(Sender), AMargin);
end;

procedure TCustomdxPSPreviewWindow.PreviewAfterDragMargin(Sender: TObject; AMargin: TdxPreviewMargin);
begin
  DoPreviewAfterDragMargin(TdxPreview(Sender), AMargin);
{$IFNDEF DELPHI4}
  FMarginBar.Panels.EndUpdate;
{$ENDIF}
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.PreviewBeforeDragMargin(Sender: TObject; AMargin: TdxPreviewMargin);
begin
{$IFNDEF DELPHI4}
  FMarginBar.Panels.BeginUpdate;
{$ENDIF}
  DoPreviewBeforeDragMargin(TdxPreview(Sender), AMargin);
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.PreviewDragMargin(Sender: TObject; AMargin: TdxPreviewMargin);
begin
  DoPreviewDragMargin(TdxPreview(Sender), AMargin);  
end;

procedure TCustomdxPSPreviewWindow.PreviewCalcPageCount(Sender: TObject);
begin
  if ComponentPrinter <> nil then
  begin
    FPreview.PageCount := ComponentPrinter.CurrentLink.VisiblePageCount;
    if FPreview.DraggingMargin = nil then UpdateControls;
  end;
end;
  
procedure TCustomdxPSPreviewWindow.PreviewZoomFactorChanged(Sender: TObject);
begin
  DoPreviewZoomFactorChanged(TdxPreview(Sender));
end;

procedure TCustomdxPSPreviewWindow.PreviewZoomModeChanged(Sender: TObject);
begin
  DoPreviewZoomModeChanged(TdxPreview(Sender));
end;

procedure TCustomdxPSPreviewWindow.PreviewCanShowMarginHint(Sender: TObject;
  var ACanShowHint: Boolean);
begin
  ACanShowHint := GetPreviewCanShowMarginHint(TdxPreview(Sender));
end;

procedure TCustomdxPSPreviewWindow.PreviewSelectingPage(Sender: TObject; 
  APageIndex: Integer; var ACanSelect: Boolean);
begin
  if (ComponentPrinter <> nil) and ComponentPrinter.CurrentLink.ShowEmptyPages and 
    ComponentPrinter.CurrentLink.IsEmptyPage(APageIndex) then 
    ACanSelect := False;
end;  

procedure TCustomdxPSPreviewWindow.PreviewSelectedPageChanged(Sender: TObject; APageIndex: Integer);
begin
  if ComponentPrinter <> nil then
    with ComponentPrinter.CurrentLink do
      CurrentPage := VirtualPageIndexToRealPageIndex(APageIndex) + 1;
  //SectionStatusPanel(ssCurrentPage).Text := IntToStr(ComponentPrinter.CurrentLink.CurrentPage);      
  UpdateControls;
  FStatusBar.Update;
end;

procedure TCustomdxPSPreviewWindow.PreviewDblClick(Sender: TObject);
var
  HitTests: TdxPreviewHitTests;
  Pt: TPoint;
begin
  DoPreviewDblClick(TdxPreview(Sender));
  GetCursorPos(Pt);
  Pt := FPreview.ScreenToClient(Pt);
  HitTests := FPreview.GetHitInfoAt(Pt.X, Pt.Y);
  if (phtNoWhere in HitTests) and CanDesign then
    DoDesignReport
  else 
    if (HitTests * phtMargins <> []) and CanChangeMargins and CanPageSetup then
      DoPageSetupReport(1);
end;

procedure TCustomdxPSPreviewWindow.StatusBarDblClick(Sender: TObject);
var
  R: TRect;
  Pt: TPoint;
begin
  if CanPageSetup then 
    with FStatusBar do 
    begin
      Perform(SB_GETRECT, 7, Longint(@R));
      MapWindowPoints(Handle, 0, R, 2);
      GetCursorPos(Pt);
      if PtInRect(R, Pt) then DoPageSetupReport(0);
    end;
end;

procedure TCustomdxPSPreviewWindow.StatusBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const 
  PtInRect: Boolean = False;
var 
  R: TRect;
  Pt: TPoint;
begin
  if CanPageSetup then 
    with FStatusBar do 
    begin
      Perform(SB_GETRECT, 7, Integer(@R));
      Pt := Point(X, Y);
      if Windows.PtInRect(R, Pt) xor PtInRect then
      begin 
        PtInRect := not PtInRect;
        Application.CancelHint;
        if PtInRect then 
          Hint := sdxHintDoubleClickForChangePaperSize
        else 
          Hint := '';
      end;    
    end;  
end;

procedure TCustomdxPSPreviewWindow.StatusBarDrawPanel(StatusBar: TStatusBar; 
  Panel: TStatusPanel; const Rect: TRect);
var
  DC: HDC;
  R: TRect;
  S: string;
  BkColor: TColor;
  SaveRight: Integer;
  Brush: HBRUSH;
begin        
  R := Rect;
  if Panel <> StatusBar.Panels[StatusBar.Panels.Count - 1] then
  begin
    if Flat then DrawStatusFrame(StatusBar, R);
    DrawStatusText(StatusBar, Panel.Text, R, False);
  end  
  else    
  begin
    BkColor := GetSysColor(COLOR_BTNFACE);
    if cpsBuilding in ComponentPrinter.State then
      S := Format(sdxBuildingReport, [FCurrentProgressValue])
    else 
      if cpsPrinting in ComponentPrinter.State then
        S := Format(sdxPrintingReport, [FCurrentProgressValue])
      else
        if ValidateMargins then
          S := sdxStatusReady
        else 
        begin
          BkColor := GetSysColor(COLOR_INFOBK);
          S := sdxOutsideMargins;
        end;  
    if Flat then 
      DrawStatusFrame(StatusBar, R)
    else
      InflateRect(R, -1, -1);
    DC := StatusBar.Canvas.Handle;
    if ComponentPrinter.State * [cpsBuilding, cpsPrinting] <> [] then 
    begin
      SetBkMode(DC, TRANSPARENT);
      if Flat then  
      begin
        SaveRight := R.Right;
        R.Right := Round(R.Left + CurrentOpCompleted / 100 * (Rect.Right - Rect.Left));
        Brush := CreateSolidBrush(GetStatusPanelBkColor(StatusBar, Flat, True));
        FillRect(DC, R, Brush);
        DeleteObject(Brush);
        R.Right := SaveRight;
        ExtTextOut(DC, R.Left + 1 + Byte(Flat), R.Top + Byte(Flat), ETO_CLIPPED, @R, PChar(S), Length(S), nil);            
      end
      else     
      begin
        ExtTextOut(DC, R.Left + 1 + Byte(Flat), R.Top + Byte(Flat), ETO_CLIPPED, @R, PChar(S), Length(S), nil);    
        R.Right := Round(R.Left + CurrentOpCompleted / 100 * (Rect.Right - Rect.Left));
        DrawEdge(DC, R, BDR_RAISEDINNER, BF_RECT);
      end;    
    end
    else
    begin
      SetBkColor(DC, BkColor);
      ExtTextOut(DC, R.Left + 1 + Byte(Flat), R.Top + Byte(Flat), ETO_OPAQUE or ETO_CLIPPED, @R, PChar(S), Length(S), nil);
    end;  
  end;
end;

procedure TCustomdxPSPreviewWindow.MarginBarDblClick(Sender: TObject);
begin
  if CanPageSetup then DoPageSetupReport(1);
end;

procedure TCustomdxPSPreviewWindow.MarginBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var
  R: TRect;  
begin           
  R := Rect;
  if Flat then DrawStatusFrame(StatusBar, R);
  DrawStatusText(StatusBar, Panel.Text, R, 
    (Preview.DraggingMargin <> nil) and (MarginStatusPanel(Preview.DraggingMargin) = Panel));
end;

procedure TCustomdxPSPreviewWindow.DoShowFormatDateTimeDlg;
begin
  if ComponentPrinter.CurrentLink.ShowDateTimeFormatsDlg then
  begin
    FPreview.InvalidatePagesHeader;
    FPreview.InvalidatePagesFooter;
  end;
end;

procedure TCustomdxPSPreviewWindow.DoShowFormatPageNumbersDlg;
begin
  if ComponentPrinter.CurrentLink.ShowPageNumberFormatsDlg then 
  begin
    FPreview.InvalidatePagesHeader;
    FPreview.InvalidatePagesFooter;
  end;
end;

procedure TCustomdxPSPreviewWindow.DoInvokeHelp;
begin
  if HelpContext <> 0 then Application.HelpContext(HelpContext);
end;

procedure TCustomdxPSPreviewWindow.DoShowHFToolBar(Value: Boolean);
begin
end;

procedure TCustomdxPSPreviewWindow.DoShowZoomDlg;
begin
  dxZoomDlg(Preview);
end;

procedure TCustomdxPSPreviewWindow.DoShowPageBackgroundDlg(const Pt: TPoint);
begin
  if dxChooseBackgroundDlg(FPreview.PageBackground, Pt, nil) then
    if PrinterPage <> nil then
      PrinterPage.Background := FPreview.PageBackground;
end;

procedure TCustomdxPSPreviewWindow.DoShowMultiplySelectPagesDlg(
  AImageList: {$IFDEF DELPHI4}TCustomImageList{$ELSE}TImageList{$ENDIF};
  AImageIndex: Integer; const Pt: TPoint; AYShift: Integer);
var
  Origin: TPoint;
  MaxColCount, MaxRowCount, ColCount, RowCount: Integer;  
begin
  Origin := Pt;
  Inc(Origin.Y, AYShift);
  MaxColCount := 
     Floor((FPreview.ClientWidth - 2 * FPreview.Indent) /
           (FPreview.Indent + MulDiv(FPreview.PageSize.X, FPreview.MinZoomFactor, 100)));
//  AMaxColCount := (MulDiv(Preview.ClientWidth, 100, Preview.ZoomFactor) - dxPreviewIndent) div
//     (MulDiv(Preview.PageSize.X, 10, 100) + dxPreviewIndent);
  MaxRowCount := 
    Floor((FPreview.ClientHeight - 2 * FPreview.Indent) /
          (FPreview.Indent + MulDiv(FPreview.PageSize.Y, FPreview.MinZoomFactor, 100)));
    
  if MaxColCount = 0 then MaxColCount := 1;
  if MaxRowCount = 0 then MaxRowCount := 1;
  if MaxColCount > 3 then 
    ColCount := 3
  else 
    ColCount := MaxColCount;
  if MaxRowCount > 2 then 
    RowCount := 2
  else 
    RowCount := MaxRowCount;
    
  if dxChooseMultiplePages(AImageList, AImageIndex, Origin, AYShift, 
    MaxColCount, MaxRowCount, ColCount, RowCount) then
  begin
    FPreview.ZoomMode := pzmPages;
    FPreview.SetPageXYCount(ColCount, RowCount);
  end;
end;

procedure TCustomdxPSPreviewWindow.DoShowEmptyPages(Value: Boolean);
begin
  if ComponentPrinter <> nil then
    with ComponentPrinter.CurrentLink do 
    begin
      ShowEmptyPages := Value;
      if FPreview.PageCount <> VisiblePageCount then 
        FPreview.PageCount := VisiblePageCount
      else
        FPreview.Invalidate;
    end;    
  UpdateControls;  
end;

procedure TCustomdxPSPreviewWindow.DoShowOptionsDlg;
var
  Data: TdxPreviewOptionsDlgData;
begin
  FillChar(Data, SizeOf(TdxPreviewOptionsDlgData), 0);
  with Data do 
  begin
    MarginColor := Preview.MarginColor;
    MeasurementUnits := TdxMeasurementUnits(Preview.MeasurementUnits);
    ShowMarginsHintWhileDragging := pohShowOnDrag in Preview.OptionsHint;
    ShowMarginHints := pohShowForMargins in Preview.OptionsHint;
    ShowMargins := povMargins in Preview.OptionsView;
    ZoomOnMouseRoll := pozZoomOnMouseRoll in Preview.OptionsZoom;
    ZoomStep := Preview.ZoomStep;
  end;
  
  if dxShowPSPreviewOptionsDlg(@Data) then SavePreferences(Data);    
  
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.DoShrinkToPageWidth(Value: Boolean);
begin
  if ComponentPrinter <> nil then
    with ComponentPrinter.CurrentLink do 
      if FPreview.PageCount <> VisiblePageCount then 
        FPreview.PageCount := VisiblePageCount
      else
        FPreview.Invalidate;
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.DoDesignReport;
begin
  if ComponentPrinter <> nil then
  begin
    ComponentPrinter.DesignReport(nil);
    UpdateControls;
  end;   
end;

procedure TCustomdxPSPreviewWindow.DoPageSetupReport(APageIndex: Integer);
var
  PrintBtnClicked: Boolean;
  pPrintBtnClicked: PBoolean;  
begin
  if CanPrintDialog then
    pPrintBtnClicked := @PrintBtnClicked
  else  
    pPrintBtnClicked := nil; 
  if ComponentPrinter.PageSetupEx(APageIndex, nil, pPrintBtnClicked, nil) then
  begin
    InitContent;
    UpdateControls;
  end;
  if (pPrintBtnClicked <> nil) and pPrintBtnClicked^ then 
    DoPrintReport(True);
end;

procedure TCustomdxPSPreviewWindow.DoPrintReport(AShowDialog: Boolean);
begin
  ComponentPrinter.Print(AShowDialog, nil, nil);
  if not ComponentPrinter.AbortPrinting then 
  begin
    if AShowDialog then UpdateControls;
    DoAfterPrintReport(AShowDialog);  
  end;  
  if FReleased then Release;
end;

function TCustomdxPSPreviewWindow.CanDesign: Boolean;
begin
  Result := IsVisible(pvoReportDesign) and IsEnabled(peoReportDesign) and 
    (ComponentPrinter <> nil) and ComponentPrinter.CurrentLink.CheckToDesign and 
    not IsPrinting and not IsBuilding;
   {(ComponentPrinter.CurrentLink.PageCount > 0) and } 
end;

function TCustomdxPSPreviewWindow.CanPrint: Boolean;
begin
  Result := CanPrintDialog and (dxPrintDevice.Printers.Count > 0);
end;

function TCustomdxPSPreviewWindow.CanPrintDialog: Boolean;
begin
  Result := IsVisible(pvoPrint) and IsEnabled(peoPrint) and (ComponentPrinter <> nil) and 
    (ComponentPrinter.CurrentLink.PageCount > 0) and not IsPrinting;
end;

function TCustomdxPSPreviewWindow.CanPrintStyle: Boolean;
begin
  Result := (ComponentPrinter <> nil) and (ComponentPrinter.CurrentLink.StyleManager <> nil) and 
    IsVisible(pvoPrintStyles);
end;

function TCustomdxPSPreviewWindow.CanPageSetup: Boolean;
begin
  Result := IsVisible(pvoPageSetup) and IsEnabled(peoPageSetup) 
    and (ComponentPrinter <> nil) and not IsPrinting;
end;

function TCustomdxPSPreviewWindow.CanChangeMargins: Boolean;
begin
  Result := IsEnabled(peoCanChangeMargins) and not IsPrinting and not IsBuilding;
end;

function TCustomdxPSPreviewWindow.IsEnabled(AOption: TdxPreviewEnableOption): Boolean;
begin
  Result := AOption in FEnableOptions;
end;

function TCustomdxPSPreviewWindow.IsVisible(AOption: TdxPreviewVisibleOption): Boolean;
begin
  Result := AOption in FVisibleOptions;
end;

function TCustomdxPSPreviewWindow.IsBuilding: Boolean;
begin
  Result := (ComponentPrinter <> nil) and (cpsBuilding in ComponentPrinter.State);
end;

function TCustomdxPSPreviewWindow.IsPrinting: Boolean;
begin
  Result := dxPrintDevice.Printing;
end;

{$IFNDEF DELPHI4}
procedure TCustomdxPSPreviewWindow.InvalidateMarginPanel(AMargin: TdxPreviewMargin);
const
  OwnerDraw: array[TStatusPanelStyle] of Integer = (0, SBT_OWNERDRAW);
  Borders: array[TStatusPanelBevel] of Integer = (SBT_NOBORDERS, 0, SBT_POPOUT);
var
  Panel: TStatusPanel;
  Flags: Integer;
  S: string;
  R: TRect;
begin
  Panel := MarginStatusPanel(AMargin);
  Flags := OwnerDraw[Panel.Style] or Borders[Panel.Bevel];
  S := Preview.MarginValueToString(AMargin.DraggingValue);
  SendMessage(FMarginBar.Handle, SB_SETTEXT, Panel.Index or Flags, Longint(PChar(S)));
  SendMessage(FMarginBar.Handle, SB_GETRECT, Panel.Index, Longint(@R));
  InvalidateRect(FMarginBar.Handle, @R, False);
end;
{$ENDIF}

procedure TCustomdxPSPreviewWindow.InvalidatePagesHeadersOrFooters;
begin
  if CurrentHFMode = ptHeader then
    FPreview.InvalidatePagesHeader
  else
    FPreview.InvalidatePagesFooter;
end;

procedure TCustomdxPSPreviewWindow.RefreshStatusBar(AStatusSections: TfmPreviewStatusSections);
var
  R: TRect;
begin
  if ComponentPrinter <> nil then 
  begin
    if ssCurrentPage in AStatusSections then   
      SectionStatusPanel(ssCurrentPage).Text := IntToStr(ComponentPrinter.CurrentLink.CurrentPage);
    if ssPageCount in AStatusSections then 
      SectionStatusPanel(ssPageCount).Text := IntToStr(ComponentPrinter.CurrentLink.PageCount);
  end;
      
  if ssPaperSize in AStatusSections then 
    SectionStatusPanel(ssPaperSize).Text := FPreview.PageSizeToString;

  if ssStatus in AStatusSections then 
  begin
    SendMessage(FStatusBar.Handle, SB_GETRECT, FStatusBar.Panels.Count - 1, Longint(@R));
    InvalidateRect(FStatusBar.Handle, @R, False);
  end;  
end;

procedure TCustomdxPSPreviewWindow.RefreshMarginBar(AMargin: TdxPreviewMargin);
begin
  with FPreview do 
    if AMargin <> nil then
    begin
    {$IFNDEF DELPHI4}
      MarginStatusPanel(AMargin).Text := MarginValueToString(AMargin.DraggingValue);
      //InvalidateMarginPanel(AMargin);
    {$ELSE}  
      MarginStatusPanel(AMargin).Text := MarginValueToString(AMargin.DraggingValue);
    {$ENDIF}
    end  
    else
    begin
      MarginStatusPanel(Margins[pmLeft]).Text := MarginValueToString(Margins[pmLeft].Value);
      MarginStatusPanel(Margins[pmTop]).Text := MarginValueToString(Margins[pmTop].Value);    
      MarginStatusPanel(Margins[pmRight]).Text := MarginValueToString(Margins[pmRight].Value);    
      MarginStatusPanel(Margins[pmBottom]).Text := MarginValueToString(Margins[pmBottom].Value);     
      MarginStatusPanel(Margins[pmHeader]).Text := MarginValueToString(Margins[pmHeader].Value);     
      MarginStatusPanel(Margins[pmFooter]).Text := MarginValueToString(Margins[pmFooter].Value);     
    end;  
end;

function TCustomdxPSPreviewWindow.MarginStatusPanel(AMargin: TdxPreviewMargin): TStatusPanel;
const 
  Indexes: array [TdxPreviewMarginType] of Integer = (2, 4, 6, 8, 14, 10, 12);
begin
  Result := FMarginBar.Panels[Indexes[AMargin.MarginType]];
end;

function TCustomdxPSPreviewWindow.SectionStatusPanel(AStatusSection: TfmPreviewStatusSection): TStatusPanel;
const 
  Indexes: array [TfmPreviewStatusSection] of Integer = (1, 3, 7, 9);
begin
  Result := FStatusBar.Panels[Indexes[AStatusSection]];
end;

procedure TCustomdxPSPreviewWindow.DoPreviewMarginChanged(APreview: TdxPreview; 
  AMargin: TdxPreviewMargin);
begin
  if FPreview.DraggingMargin = nil then RefreshMarginBar(AMargin);
end;

procedure TCustomdxPSPreviewWindow.DoPreviewAfterDragMargin(APreview: TdxPreview; 
  AMargin: TdxPreviewMargin);
var
  MarginsValid: Boolean;  
begin
  RefreshMarginBar(AMargin);
  MarginsValid := ValidateMargins;
  if (MarginsValid <> FMarginsValid) and not MarginsValid then 
    Beep;
  FMarginsValid := MarginsValid;
  RefreshStatusBar([ssStatus]);
end;

procedure TCustomdxPSPreviewWindow.DoPreviewBeforeDragMargin(APreview: TdxPreview; 
  AMargin: TdxPreviewMargin);
begin
  RefreshMarginBar(AMargin);
end;

procedure TCustomdxPSPreviewWindow.DoPreviewDragMargin(APreview: TdxPreview; 
  AMargin: TdxPreviewMargin);
begin
  RefreshMarginBar(AMargin);
end;

procedure TCustomdxPSPreviewWindow.DoPreviewZoomFactorChanged(APreview: TdxPreview);
begin
end;

procedure TCustomdxPSPreviewWindow.DoPreviewZoomModeChanged(APreview: TdxPreview);
begin
end;

function TCustomdxPSPreviewWindow.GetPreviewCanShowMarginHint(APreview: TdxPreview): Boolean;
begin
  Result := True;
end;

procedure TCustomdxPSPreviewWindow.DoPreviewDblClick(APreview: TdxPreview);
begin
end;

procedure TCustomdxPSPreviewWindow.DoAfterPrintReport(AShowDialog: Boolean);
begin
end;

procedure TCustomdxPSPreviewWindow.DoSetupZoomFactor(AZoomFactor, APageXCount, 
  APageYCount: Integer; AZoomMode: TdxPreviewZoomMode);
begin
  FPreview.ZoomMode := AZoomMode;
  case FPreview.ZoomMode of 
    pzmNone: 
      FPreview.ZoomFactor := AZoomFactor;
    pzmPages: 
      FPreview.SetPageXYCount(APageXCount, APageYCount);
  end;
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.DoActivePageChanged(AValue: Integer);
var
  Link: TBasedxReportLink;
begin
  if ComponentPrinter <> nil then 
  begin
    Link := ComponentPrinter.CurrentLink;
    if Link.ShowEmptyPages then
      ActivePageIndex := Link.RealPageIndexToVirtualPageIndex(AValue, True)
    else
      ActivePageIndex := AValue;
  end;    
end;

procedure TCustomdxPSPreviewWindow.DoInsertHF(const S: string);
var
  Strings: TStrings;
begin
  if CurrentHFMode = ptHeader then
    Strings := PrinterPage.PageHeader.Titles[CurrentHFTitlePart]
  else
    Strings := PrinterPage.PageFooter.Titles[CurrentHFTitlePart];
  Strings.Text := Strings.Text + S;
  InvalidatePagesHeadersOrFooters;
end;

procedure TCustomdxPSPreviewWindow.DoClearHF;
begin
  if PrinterPage = nil then Exit;
  with PrinterPage do
  begin
    if CurrentHFMode = ptHeader then
      PageHeader.Titles[CurrentHFTitlePart].Text := ''
    else
      PageFooter.Titles[CurrentHFTitlePart].Text := '';
    InvalidatePagesHeadersOrFooters;
  end;
end;

procedure TCustomdxPSPreviewWindow.DoShowHFBackgroundDlg(const Pt: TPoint);
var
  Background: TdxBackground;
begin
  if CurrentHFMode = ptHeader then
    Background := PrinterPage.PageHeader.Background
  else
    Background := PrinterPage.PageFooter.Background;
  if dxChooseBackgroundDlg(Background, Pt, nil) then
    InvalidatePagesHeadersOrFooters;
end;

procedure TCustomdxPSPreviewWindow.DoShowPageHeaders(Value: Boolean);
begin
  ComponentPrinter.CurrentLink.ShowPageHeader := Value;
  FPreview.InvalidatePagesHeader;
end;

procedure TCustomdxPSPreviewWindow.DoShowPageFooters(Value: Boolean);
begin
  ComponentPrinter.CurrentLink.ShowPageFooter := Value;
  FPreview.InvalidatePagesFooter;
end;

procedure TCustomdxPSPreviewWindow.PrepareProgress;
begin
  FLastOpCompleted := 0;    
  CurrentOpCompleted := 0;
  FCurrentProgressValue := 0;
  FStatusBar.SizeGrip := False;
  FStatusBar.Update;
end;

procedure TCustomdxPSPreviewWindow.UnprepareProgress;
begin
  FStatusBar.SizeGrip := True;
end;


procedure TCustomdxPSPreviewWindow.GenerateReportProgress(Sender: TObject;
  AReportLink: TBasedxReportLink; APercentDone: Double {mask : '##0.00'});
begin
  if Sender <> ComponentPrinter then Exit;
  FCurrentProgressValue := Trunc(APercentDone);
  CurrentOpCompleted := APercentDone;
end;

procedure TCustomdxPSPreviewWindow.EndGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  if Sender <> ComponentPrinter then Exit;
  UnprepareProgress;
  if (FPreview.SelPageIndex > ComponentPrinter.CurrentLink.PageCount - 1) then
    FPreview.SelPageIndex := ComponentPrinter.CurrentLink.PageCount - 1;
end;

procedure TCustomdxPSPreviewWindow.StartGenerateReport(Sender: TObject;
  AReportLink: TBasedxReportLink);
begin
  if Sender <> ComponentPrinter then Exit;
  FPreview.PageCount := 0;
  FPreview.Update;
  PrepareProgress;
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.EndPrint(Sender: TObject; AReportLink: TBasedxReportLink);
begin
  if Sender <> ComponentPrinter then Exit;
  UnprepareProgress;
  UpdateControls;
end;

procedure TCustomdxPSPreviewWindow.NewPage(Sender: TObject; AReportLink: TBasedxReportLink;
  APageIndex: Integer);
begin
  if Sender <> ComponentPrinter then Exit;
  FCurrentProgressValue := APageIndex;
  CurrentOpCompleted := APageIndex / FFullPageCount * 100;
end;

procedure TCustomdxPSPreviewWindow.StartPrint(Sender: TObject; AReportLink: TBasedxReportLink;
  FullPageCount: Integer);
begin
  if Sender <> ComponentPrinter then Exit;
  FFullPageCount := FullPageCount;
  UpdateControls;
  PrepareProgress;
end;

procedure TCustomdxPSPreviewWindow.RefreshProgressBar(Value: Double);
var
  R: TRect;  
begin
  with FStatusBar do 
    SendMessage(Handle, SB_GETRECT, Panels.Count - 1, Integer(@R));
  Value := R.Left + Value * (R.Right - R.Left); 
  if FLastOpCompleted <> Trunc(Value) then
  begin
    FLastOpCompleted := Trunc(Value);
    InvalidateRect(FStatusBar.Handle, @R, False);
    FStatusBar.Update;
  end;  
end;

procedure TCustomdxPSPreviewWindow.UpdateMarginBar;
var
  I: Integer;
  R: TRect;
begin
  with FMarginBar do
  begin
    Perform(CM_RECREATEWND, 0, 0);
    Refresh;
    Canvas.Font := Font;
    for I := 0 to Panels.Count - 1 do
      if Panels[I].Style = psOwnerDraw then
      begin
        Perform(SB_GETRECT, I, LPARAM(@R));
        InflateRect(R, -1, -1);
        MarginBarDrawPanel(FMarginBar, Panels[I], R);
      end;
  end;  
end;

procedure TCustomdxPSPreviewWindow.SetZoomFactorByText(const AText: string);
var
  V, I, PageXCount, PageYCount: Integer;
begin
  I := FPredefinedZooms.IndexOf(AText);
  if I > -1 then
    if I < dxPredefinedZoomValueCount then
    begin
      FPreview.ZoomMode := pzmNone;
      FPreview.ZoomFactor := Integer(FPredefinedZooms.Objects[I]);
    end
    else
    begin
      if I = dxPredefinedZoomValueCount then
        FPreview.ZoomMode := pzmPageWidth
      else
        FPreview.ZoomMode := pzmPages;
      case I - dxPredefinedZoomValueCount of
        1: FPreview.SetPageXYCount(1, 1);
        2: FPreview.SetPageXYCount(2, 1);
        3: FPreview.SetPageXYCount(2, 2);
        4: begin
             ComponentPrinter.CurrentLink.GetPageColRowCount(PageXCount, PageYCount);
             FPreview.SetPageXYCount(PageXCount, 1);
           end;
      end;
    end
  else
  begin
    try
      V := StrToInt(StrPercentDrop(AText));
    except
      try
        V := Round(StrToFloat(StrPercentDrop(AText)));
      except
        V := FLastGoodZoomFactor;
      end;
    end;
    FPreview.ZoomFactor := V;
  end;
  FLastGoodZoomFactor := FPreview.ZoomFactor;
end;

procedure TCustomdxPSPreviewWindow.SavePreferences(AData: TdxPreviewOptionsDlgData);
begin
  with Preview do
  begin
    Margins[pmGutter].Visible := False;

    if AData.ShowMarginHints then 
      OptionsHint := OptionsHint + [pohShowForMargins]
    else
      OptionsHint := OptionsHint - [pohShowForMargins];

    if AData.ShowMarginsHintWhileDragging then
      OptionsHint := OptionsHint + [pohShowOnDrag]
    else
      OptionsHint := OptionsHint - [pohShowOnDrag];
    
    if AData.ZoomOnMouseRoll then
      OptionsZoom := OptionsZoom + [pozZoomOnMouseRoll]
    else
      OptionsZoom := OptionsZoom - [pozZoomOnMouseRoll];

    ZoomStep := AData.ZoomStep;
    MarginColor := AData.MarginColor;    
    MeasurementUnits :=
      dxPreVw.TdxPreviewMeasurementUnits(AData.MeasurementUnits);
  end;
  
  ShowPageMargins := AData.ShowMargins;
  PrinterPage.MeasurementUnits := AData.MeasurementUnits;
end;

procedure TCustomdxPSPreviewWindow.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  SavePropertiesToRegistry(APath);
end;

procedure TCustomdxPSPreviewWindow.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  LoadPropertiesFromRegistry(APath);
end;

const
  sdxShowMarginBar = 'MarginBar';
  sdxShowStatusBar = 'StatusBar';

procedure TCustomdxPSPreviewWindow.SavePropertiesToRegistry(const APath: string);

  procedure DoStore(const ARegistryPath: string);
  begin
    Preview.SaveToRegistry(ARegistryPath + '\PreviewControl');
    
    with TRegistry.Create do      
    try
      if OpenKey(ARegistryPath, True) then
      try
        WriteBool(sdxShowMarginBar, ShowMarginBar);
        WriteBool(sdxShowStatusBar, ShowStatusBar);
      except  
        on ERegistryException do
        else
          raise;
      end;
    finally
      Free;
    end;   
  end;
   
begin
  DoStore(APath);
  if IsDesignTime and (dxPSEngine.RegistryPath <> '') then
    DoStore(dxPSEngine.RegistryPath);  
end;

procedure TCustomdxPSPreviewWindow.LoadPropertiesFromRegistry(const APath: string);
begin
  FPreview.LoadFromRegistry(APath + '\PreviewControl');
  ShowPageMargins := povMargins in FPreview.OptionsView;
  
  with TRegistry.Create do 
  try
    if OpenKey(APath, False) then
    try
      if ValueExists(sdxShowMarginBar) then 
        ShowMarginBar := ReadBool(sdxShowMarginBar);
      if ValueExists(sdxShowStatusBar) then 
        ShowStatusBar := ReadBool(sdxShowStatusBar);
    except  
      on ERegistryException do
      else
        raise;
    end;
  finally
    Free;
  end;
end;

end.
