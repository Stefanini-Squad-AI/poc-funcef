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

unit dxPSRELnk;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Graphics, ComCtrls, RichEdit, dxPSCore, dxPSGlbl, dxPrnPg;

type
  TAbstractdxRichEditReportLink = class;


  TdxPSREPageRenderInfo = class(TdxPSPageRenderInfo)
  public
    FirstChar: Integer;
    LastChar: Integer;
  end;

  
  TdxPSREReportLinkRenderInfo = class(TdxPSReportRenderInfo)
  private
    FDetailsTwipsRect: TRect;
    FFormatRange: TFormatRange;    
    FPageTwipsRect: TRect;

    function GetREHandle: HWND;
    function GetREReportLink: TAbstractdxRichEditReportLink;
    
    procedure DoFormatRichEdit;    
    procedure FormatRichEdit;
    procedure PrepareFormatRange;
    procedure SetupFormatRangeForNonSelection;
    procedure UnprepareFormatRange;
  protected
    FirstChar: Integer;
    LastChar: Integer;

    procedure CalcPageSizes; override;
    procedure CalcPagesRenderInfos; override;
    procedure DoCalcRenderInfos; override;
    procedure FreeRenderInfos; override;
    function GetPageRenderInfoClass: TdxPSPageRenderInfoClass; override;
    function GetUnitsPerInch: Integer; override;
    function LoMetricValueToInternalUnits(Value: Integer): Integer; override;
    
    property REHandle: HWND read GetREHandle;
    property REReportLink: TAbstractdxRichEditReportLink read GetREReportLink;
  end;


  TdxPSREReportRenderer = class(TdxPSReportRenderer)
  private
    function GetREHandle: HWND;
    function GetREPageRenderInfo: TdxPSREPageRenderInfo;
    function GetRERenderInfo: TdxPSREReportLinkRenderInfo;
    function GetREReportLink: TAbstractdxRichEditReportLink;
  protected
    function GetUnitsPerInch: Integer; override;
    procedure PrepareRects;
    procedure PrepareRenderPage; override;
    procedure RenderPageContent; override;
    procedure UnprepareRects;
    procedure UnprepareRenderPage; override;

    property REHandle: HWND read GetREHandle;
    property REPageRenderInfo: TdxPSREPageRenderInfo read GetREPageRenderInfo;    
    property RERenderInfo: TdxPSREReportLinkRenderInfo read GetRERenderInfo;
    property REReportLink: TAbstractdxRichEditReportLink read GetREReportLink;
  end;

    
  TdxRichEditVersion = 1..2;
  
  TAbstractdxRichEditReportLink = class(TBasedxReportLink)
  private
    FOnlySelected: Boolean;
    FRichEditVersion: TdxRichEditVersion;

    procedure SetOnlySelected(Value: Boolean);
    procedure SetRichEditVersion(Value: TdxRichEditVersion);
    
    procedure GetCharRange(var ASelStart, ASelLength: Integer);
    function TextExists: Boolean;
  protected
    procedure ConstructReport(AReportCells: TdxReportCells); override;
    function DoGetRendererClass: TdxPSReportRendererClass; override;
    function GetRealScaleFactor: Integer; override;
    function GetRenderInfoClass: TdxPSReportRenderInfoClass; override;
    procedure InternalRestoreDefaults; override;
    function SupportsTitle: Boolean; override;
    
    function GetRichEditHandle: HWND; virtual; abstract;
    function TryLoadRichEditDLL(AVersion: Integer): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    property REHandle: HWND read GetRichEditHandle;
  published
    property OnlySelected: Boolean read FOnlySelected write SetOnlySelected
      default False;
    property RichEditVersion: TdxRichEditVersion read FRichEditVersion write SetRichEditVersion
      default 1;
  end;

  
  TdxRichEditReportLink = class(TAbstractdxRichEditReportLink)
  private
    function GetRichEdit: TRichEdit;
  protected
    function GetRichEditHandle: HWND; override;
  public
    property RichEdit: TRichEdit read GetRichEdit;
  end;
  
implementation

uses
  Messages, Forms, dxPSUtl;

{ TdxPSREReportLinkRenderInfo }

procedure TdxPSREReportLinkRenderInfo.DoCalcRenderInfos;
begin
  CalcPageSizes;
  CalcHeaderAndFooterRects;  
  CalcPageHeaderAndFooterRects;
  CalcPagesRenderInfos;
end;

procedure TdxPSREReportLinkRenderInfo.FreeRenderInfos;
begin
  inherited FreeRenderInfos;
  FillChar(FFormatRange, SizeOf(TFormatRange), 0);
  FirstChar := 0;
  LastChar := 0;  
  FillChar(FDetailsTwipsRect, SizeOf(TRect), 0);
  FillChar(FPageTwipsRect, SizeOf(TRect), 0);  
end;

function TdxPSREReportLinkRenderInfo.GetUnitsPerInch: Integer;
begin
  Result := Screen.PixelsPerInch;
end;

procedure TdxPSREReportLinkRenderInfo.CalcPagesRenderInfos; 
var 
  I: Integer;
begin
  FormatRichEdit;
  PageColCount := 1;
  PageRowCount := VirtualPageCount;
  for I := 0 to VirtualPageCount - 1 do
  begin
    PageRenderInfos[I].DetailRect := PrinterPage.PaintRectPixels;
    SetupPageRenderInfoFlags(I);
  end;  
end;

procedure TdxPSREReportLinkRenderInfo.CalcPageSizes;
begin
  inherited CalcPageSizes;
  WindowScalePair.Numerator := 100;  
  WindowScalePair.Denominator := 100;
  PageSize := PrinterPage.PageSizePixels;
end;

function TdxPSREReportLinkRenderInfo.LoMetricValueToInternalUnits(Value: Integer): Integer;
begin
  // we must don't take into account the scale factor
  Result := MulDiv(Value, UnitsPerInch, 254);
end;

procedure TdxPSREReportLinkRenderInfo.PrepareFormatRange;
var
  SelStart, SelLength: Integer;
begin            
  FPageTwipsRect.BottomRight := ScalePoint(PrinterPage.RealPageSizeLoMetric, 1440, 254);
  FDetailsTwipsRect := ScaleRect(PrinterPage.PaintRectLoMetric, 1440, 254, 1440, 254);
  //OffsetRect(FTwipsRect, -FTwipsRect.Left, -FTwipsRect.Top);
  
  REReportLink.GetCharRange(SelStart, SelLength);
  if SelLength = 0 then
    SetupFormatRangeForNonSelection
  else
  begin
    FirstChar := SelStart;
    LastChar := SelStart + SelLength;
  end;

  with FFormatRange do 
  begin 
    hDC := GetDC(0);
    hdcTarget := hDC;
    rc := FDetailsTwipsRect;
    rcPage := FPageTwipsRect;
    if SelLength = 0 then 
      chrg.cpMax := -1
    else  
      chrg.cpMax := LastChar;
  end;
   
  SendMessage(REHandle, EM_FORMATRANGE, 0, 0);
end;

procedure TdxPSREReportLinkRenderInfo.SetupFormatRangeForNonSelection;
var
  TextLenEx: TGetTextLengthEx;
begin
  FirstChar := 0;
  if REReportLink.RichEditVersion > 1 then 
  begin
    with TextLenEx do 
    begin
      Flags := GTL_DEFAULT;
      CodePage := CP_ACP;
    end;
    LastChar := 
      SendMessage(REHandle, EM_GETTEXTLENGTHEX, wParam(@TextLenEx), 0);
  end
  else
    LastChar := SendMessage(REHandle, WM_GETTEXTLENGTH, 0, 0);    
end;

procedure TdxPSREReportLinkRenderInfo.UnprepareFormatRange;
begin
  SendMessage(REHandle, EM_FORMATRANGE, 0, 0);
  ReleaseDC(0, FFormatRange.hDC);
end;

procedure TdxPSREReportLinkRenderInfo.DoFormatRichEdit;
var
  PageRenderInfo: TdxPSREPageRenderInfo;
begin
  VirtualPageCount := 0;
  repeat
    FFormatRange.rc := FDetailsTwipsRect;
    FFormatRange.rcPage := FPageTwipsRect;    
    PageRenderInfo := TdxPSREPageRenderInfo.Create(Self);
    if VirtualPageCount = 0 then
      PageRenderInfo.FirstChar := FirstChar
    else
      PageRenderInfo.FirstChar := TdxPSREPageRenderInfo(PageRenderInfos[VirtualPageCount - 1]).LastChar;
    
    FFormatRange.chrg.cpMin := PageRenderInfo.FirstChar;
    PageRenderInfo.LastChar := 
      SendMessage(REHandle, EM_FORMATRANGE, 0, Longint(@FFormatRange));
    if PageRenderInfo.LastChar > LastChar then
      PageRenderInfo.LastChar := LastChar;
    
    ReallocMem(PageRenderInfos, (VirtualPageCount + 1) * SizeOf(TdxPSREPageRenderInfo));
    PageRenderInfos^[VirtualPageCount] := PageRenderInfo;
    Inc(VirtualPageCount);
    
  until (PageRenderInfo.LastChar >= LastChar) or (PageRenderInfo.LastChar = -1);
end;

procedure TdxPSREReportLinkRenderInfo.FormatRichEdit;
begin
  PrepareFormatRange;
  try 
    if LastChar > 0 then DoFormatRichEdit;
  finally
    UnprepareFormatRange;   
  end;
end;

function TdxPSREReportLinkRenderInfo.GetPageRenderInfoClass: TdxPSPageRenderInfoClass;
begin
  Result := TdxPSREPageRenderInfo;
end;

function TdxPSREReportLinkRenderInfo.GetREHandle: HWND;
begin
  Result := REReportLink.REHandle;
end;

function TdxPSREReportLinkRenderInfo.GetREReportLink: TAbstractdxRichEditReportLink;
begin
  Result := TAbstractdxRichEditReportLink(ReportLink);
end;


{ TdxPSREReportLinkRenderInfo }

function TdxPSREReportRenderer.GetREHandle: HWND;
begin
  Result := REReportLink.REHandle;
end;

function TdxPSREReportRenderer.GetREPageRenderInfo: TdxPSREPageRenderInfo;
begin
  Result := TdxPSREPageRenderInfo(PageRenderInfo);  
end;

function TdxPSREReportRenderer.GetRERenderInfo: TdxPSREReportLinkRenderInfo;
begin
  Result := TdxPSREReportLinkRenderInfo(RenderInfo);
end;

function TdxPSREReportRenderer.GetREReportLink: TAbstractdxRichEditReportLink;
begin
  Result := TAbstractdxRichEditReportLink(ReportLink);
end;

function TdxPSREReportRenderer.GetUnitsPerInch: Integer;
begin
  if IsPrinterDC(DC) then
    Result := PPI
  else
    Result := inherited GetUnitsPerInch;
end;

procedure TdxPSREReportRenderer.PrepareRenderPage;
begin
  PrepareRects;
  inherited PrepareRenderPage;
end;

procedure TdxPSREReportRenderer.PrepareRects;
begin
  with RenderInfo do 
  begin
    PageSize.X := MulDiv(PageSize.X, PPI, UnitsPerInch);
    PageSize.Y := MulDiv(PageSize.Y, PPI, UnitsPerInch);
    PageHeaderRect := ScaleRect(PageHeaderRect, PPI, UnitsPerInch, PPI, UnitsPerInch);
    PageFooterRect := ScaleRect(PageFooterRect, PPI, UnitsPerInch, PPI, UnitsPerInch);    
    TitleRect := ScaleRect(TitleRect, PPI, UnitsPerInch, PPI, UnitsPerInch);    
  end;
end;

procedure TdxPSREReportRenderer.RenderPageContent;
var
  FormatRange: TFormatRange;
  ClipRect: TRect;
  Rgn: HRGN;
  LastChar: Integer;
begin         
  FillChar(FormatRange, SizeOf(TFormatRange), 0);
  with FormatRange do 
  begin
    hDC := DC;
    hdcTarget := 0;
    rc := RERenderInfo.FDetailsTwipsRect;
    rcPage := RERenderInfo.FPageTwipsRect;
    chrg.cpMin := REPageRenderInfo.FirstChar;
    chrg.cpMax := REPageRenderInfo.LastChar;
  end;  

  ClipRect := 
    ScaleRect(PageRenderInfo.DetailRect, PPI, RenderInfo.UnitsPerInch, PPI, RenderInfo.UnitsPerInch);
  Rgn := TdxPSReportRenderer.IntersectClipRect(DC, ClipRect);
  SendMessage(REHandle, EM_FORMATRANGE, 0, 0);
  try
    LastChar := SendMessage(REHandle, EM_FORMATRANGE, 1, Longint(@FormatRange));
    
    if REPageRenderInfo.LastChar <> LastChar then
    begin 
      REPageRenderInfo.LastChar := LastChar;
      if RenderingPageIndex < RenderInfo.VirtualPageCount - 1 then 
        TdxPSREPageRenderInfo(RenderInfo.PageRenderInfos^[RenderingPageIndex + 1]).FirstChar := LastChar;
        
      if IsPrinterDC(DC) and ReportLink.ComponentPrinter.PreviewExists then 
        ReportLink.ComponentPrinter.PreviewWindow.InvalidatePage(RenderingPageIndex);
    end;  
  finally
    SendMessage(REHandle, EM_FORMATRANGE, 0, 0);
  end;
  TdxPSReportRenderer.RestoreClipRgn(DC, Rgn);
end;

procedure TdxPSREReportRenderer.UnprepareRects;
begin
  with RenderInfo do 
  begin
    PageSize.X := MulDiv(PageSize.X, UnitsPerInch, PPI);
    PageSize.Y := MulDiv(PageSize.Y, UnitsPerInch, PPI);
    PageHeaderRect := ScaleRect(PageHeaderRect, UnitsPerInch, PPI, UnitsPerInch, PPI);
    PageFooterRect := ScaleRect(PageFooterRect, UnitsPerInch, PPI, UnitsPerInch, PPI);    
    TitleRect := ScaleRect(TitleRect, UnitsPerInch, PPI, UnitsPerInch, PPI);    
  end;
end;

procedure TdxPSREReportRenderer.UnprepareRenderPage;
begin
  inherited UnprepareRenderPage;
  UnprepareRects;
end;


{ TAbstractdxRichEditReportLink }

constructor TAbstractdxRichEditReportLink.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRichEditVersion := 1;
end;

procedure TAbstractdxRichEditReportLink.ConstructReport(AReportCells: TdxReportCells);
begin
end;
                                         
function TAbstractdxRichEditReportLink.DoGetRendererClass: TdxPSReportRendererClass;
begin
  Result := TdxPSREReportRenderer;
end;

function TAbstractdxRichEditReportLink.GetRealScaleFactor: Integer;
begin
  Result := 100;
end;

function TAbstractdxRichEditReportLink.GetRenderInfoClass: TdxPSReportRenderInfoClass;
begin
  Result := TdxPSREReportLinkRenderInfo;
end;

procedure TAbstractdxRichEditReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  OnlySelected := False;
end;

function TAbstractdxRichEditReportLink.SupportsTitle: Boolean;
begin
  Result := False;
end;

function TAbstractdxRichEditReportLink.TryLoadRichEditDLL(AVersion: Integer): Boolean;
const
  REVersions: array[Boolean] of string = ('RICHED32.DLL', 'RICHED20.DLL');
var
  OldError: Longint;
  LibHandle: THandle;
begin  
  OldError := SetErrorMode(SEM_NOOPENFILEERRORBOX);
  try
    LibHandle := LoadLibrary(PChar(REVersions[AVersion > 1]));
    try
      if (LibHandle > 0) and (LibHandle < HINSTANCE_ERROR) then LibHandle := 0;
      Result := LibHandle <> 0;
    finally
      if LibHandle <> 0 then FreeLibrary(LibHandle);
    end;  
  finally
    SetErrorMode(OldError);
  end;
end;

procedure TAbstractdxRichEditReportLink.GetCharRange(var ASelStart, ASelLength: Integer);
var
  CharRange: TCharRange;
begin
  ASelStart := 0;
  ASelLength := 0;
  if (REHandle <> 0) and OnlySelected and TextExists then
  begin
    SendMessage(REHandle, EM_EXGETSEL, 0, Longint(@CharRange));
    ASelStart := CharRange.cpMin;
    ASelLength := CharRange.cpMax - CharRange.cpMin;
  end;  
end;

procedure TAbstractdxRichEditReportLink.SetOnlySelected(Value: Boolean);
begin
  if FOnlySelected <> Value then 
  begin
    FOnlySelected := Value;
    LinkModified(True);
  end;  
end;

procedure TAbstractdxRichEditReportLink.SetRichEditVersion(Value: TdxRichEditVersion);
begin
  if FRichEditVersion <> Value then 
    if TryLoadRichEditDLL(Value) then 
    begin
      FRichEditVersion := Value;
      LinkModified(True);
    end;  
end;

function TAbstractdxRichEditReportLink.TextExists: Boolean;
begin
  Result := (REHandle <> 0) and (SendMessage(REHandle, WM_GETTEXTLENGTH, 0, 0) > 0); 
end;

{ TdxRichEditReportLink }

function TdxRichEditReportLink.GetRichEdit: TRichEdit;
begin
  Result := TRichEdit(Component);
end;
    
function TdxRichEditReportLink.GetRichEditHandle: HWND;
begin
  if RichEdit <> nil then
    Result := RichEdit.Handle
  else
    Result := 0;
end;

initialization
  dxPSRegisterReportLink(TdxRichEditReportLink, TRichEdit, nil);
  
finalization
  dxPSUnregisterReportLink(TdxRichEditReportLink, TRichEdit, nil);

end.
