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

unit dxPSGlbl;

interface

{$I dxPSVer.inc}

uses
  Classes, Windows, Graphics, Messages;

type
  PBoolean = ^Boolean;
  PBooleanArray = ^TBooleanArray;
  TBooleanArray = array[0..0] of Boolean;
  
  TdxPageOrder = (poOverThenDown, poDownThenOver);
  TdxPageNumberFormat = (pnfNumeral, pnfChars, pnfUpperChars, pnfRoman, pnfUpperRoman);

  TdxPSLookAndFeel = (pslfStandard, pslfFlat);
    
{ Moved here from dxPSCore.pas }
  TdxTextAlignX = (taLeft, taCenterX, taRight);
  TdxTextAlignY = (taTop, taCenterY, taBottom);
  
const
  WMPS_PRINTSTYLELISTCHANGED = WM_USER + 1;
  WMPS_PRINTERLISTCHANGED = WM_USER + 2;

{$IFNDEF DELPHI4}
  DFCS_TRANSPARENT = $800;
{$ENDIF}  

  { cell formats }

  { sides }
  dxFormatLeftSide = $00000001;
  dxFormatTopSide = $00000002;
  dxFormatRightSide = $00000004;
  dxFormatBottomSide = $00000008;
  dxFormatRect = $0000000F;
  { alignment }
  dxFormatTextAlignXLeft = $00000010;
  dxFormatTextAlignXCenter = $00000020;
  dxFormatTextAlignXRight = $00000030;
  dxFormatTextAlignYTop = $00000040;
  dxFormatTextAlignYCenter = $00000080;
  dxFormatTextAlignYBottom = $000000C0;
  { attribs }
  dxFormatVisible = $00000100;
  dxFormatEndEllipsis = $00000200;
  dxFormatMultiline = $00000400;
  dxFormatTransparent = $00000800;
  dxFormatImageTransparent = $00001000;
  dxFormatFlatCheckMarks = $00002000;
  dxFormatCheckChecked = $00004000;
  dxFormatCheckEnabled = $00008000;
  { edge style / mode}
  dxFormatEdgeMode3DEffects = $00010000;
  dxFormatEdgeModeShadow = $00020000;
  dxFormatEdgeMode = dxFormatEdgeMode3DEffects or dxFormatEdgeModeShadow;
  dxFormatInnerEdgeSunken = $00040000;
  dxFormatInnerEdgeRaised = $00080000;
  dxFormatInnerEdge = dxFormatInnerEdgeSunken or dxFormatInnerEdgeRaised;
  dxFormatOuterEdgeSunken = $00100000;
  dxFormatOuterEdgeRaised = $00200000;
  dxFormatOuterEdge = dxFormatOuterEdgeSunken or dxFormatOuterEdgeRaised;
  { sort order}
  dxFormatSortUp = $00400000;
  dxFormatSortDown = $00800000;
  dxFormatSortOrder = dxFormatSortUp or dxFormatSortDown;
  { shadow position}
  dxFormatShadowPosTopRight = $01000000;
  dxFormatShadowPosBottomRight = $02000000;
  dxFormatShadowPosBottomLeft = $03000000;
  dxFormatShadowPos = 
    dxFormatShadowPosTopRight or dxFormatShadowPosBottomRight or dxFormatShadowPosBottomLeft;
  { check position }
  dxFormatCheckPosCenter = $04000000;
  dxFormatCheckPosRight = $08000000;
  dxFormatCheckPos = dxFormatCheckPosCenter or dxFormatCheckPosRight;
  { parent }
  dxFormatParentColor = $10000000;
  dxFormatReserved1 = $20000000;
  { misc. }
  dxFormatMakeSpaceForEmptyImage = $40000000;
  dxFormatSelected = $80000000;


  dxPSVer = 2;
  dxPSVerMajor = dxPSVer;
  dxPSVerMinor = 1;
      
  sdxPSLayoutsRunTimeRegistryKey = '\Developer Express\PrintingSystem\FormLayouts';
  sdxPSRegPath = 'Software\Developer Express\PrintingSystem';
  sdxPSRegPathDesignTime = sdxPSRegPath + '\DesignTime';
  sdxPSRegPathRunTime = sdxPSRegPath + '\RunTime';
  sdxPSPreviewRegPathDesignTime = sdxPSRegPathDesignTime + '\Preview';
  sdxPSPreviewRegPathRunTime = sdxPSRegPathRunTime + '\Preview';
  sdxPSFEFDlgRegPathDesignTime = sdxPSRegPathDesignTime + '\FEFDlg';
  sdxPSFEFDlgRegPathRunTime = sdxPSRegPathRunTime + '\FEFDlg';
  dxDefaultMinPrintableArea: Integer = 50000; {in thousandths of mm}
  dxDefaultInitialMargins: TRect = 
    (Left: 12700; Top: 12700; Right: 12700; Bottom: 12700); {in thousandths of mm}
  dxDefaultInitialHeader: Integer = 6350; {in thousandths of mm}
  dxDefaultInitialFooter: Integer = 6350; {in thousandths of mm}
  dxStyleGlyphSize: TPoint = (X: 32; Y: 32);

{ help context constants }

  { DesignTime }
  dxhcChoosePageSizeDlg: THelpContext = 0;
  dxhcAddLinkDlg: THelpContext = 0;
  dxhcAddEmptyLinkDlg: THelpContext = 0;
  dxhcReportLinkDesignWindow: THelpContext = 0;
  dxhcPrintStylesDesignWindow: THelpContext = 0;
  dxhcAddStyleDlg: THelpContext = 0;
  dxhcTemplateDesignWindow: THelpContext = 0;

  { DesignTime - RunTime }
  dxhcStringGridReportLinkDesigner: THelpContext = 0;
  dxhcDrawGridReportLinkDesigner: THelpContext = 0;
  dxhcListBoxReportLinkDesigner: THelpContext = 0;
  dxhcCheckListBoxReportLinkDesigner: THelpContext = 0;
  dxhcTreeListReportLinkDesigner: THelpContext = 0;
  dxhcTreeViewReportLinkDesigner: THelpContext = 0;
  dxhcOrgChartReportLinkDesigner: THelpContext = 0;
  dxhcFlowChartReportLinkDesigner: THelpContext = 0;
  dxhcInspectorGridReportLinkDesigner: THelpContext = 0;
  dxhcMasterViewReportLinkDesigner: THelpContext = 0;
 
  dxhcPrintDlg: THelpContext = 0;
  dxhcPageSetupDlg: THelpContext = 0;
  dxhcFEFDlg: THelpContext = 0;
  dxhcPreviewPreferencesDlg: THelpContext = 0;
  dxhcZoomDlg: THelpContext = 0;
  dxhcDefinePrintStyleDlg: THelpContext = 0;
  dxhcDateTimeFormatDlg: THelpContext = 0;
  dxhcPageNumberFormatDlg: THelpContext = 0;
  dxhcTitlePropertiesDlg: THelpContext = 0;  
  
  sdxHelpButtonName = 'btnHelp'; // not localize
  
function IsDesignTime: Boolean;
function GetPSRegRoot: string;
function GetPSRegPreview: string;

var
  IsWin95: Boolean;
  IsWin2K: Boolean;
  CheckHeight, CheckWidth: Integer;
  
implementation

uses
  SysUtils;

function IsDesignTime: Boolean;
var
  AppName: string;
begin
  AppName := ExtractFileName(ParamStr(0));
  Result := (CompareText(AppName, 'delphi32.exe') = 0) or 
            (CompareText(AppName, 'bcb.exe') = 0);
end;

function GetPSRegRoot: string;
begin
  if IsDesignTime then
    Result := sdxPSRegPathDesignTime
  else
    Result := sdxPSRegPathRunTime;
end;

function GetPSRegPreview: string;
begin
  if IsDesignTime then
    Result := sdxPSPreviewRegPathDesignTime
  else
    Result := sdxPSPreviewRegPathRunTime;
end;

procedure GetCheckSizes;
begin
  with TBitmap.Create do
  try
    Handle := LoadBitmap(0, PChar(OBM_CHECKBOXES));
    CheckWidth := Width div 4;
    CheckHeight := Height div 3;
  finally
    Free;
  end;
end;

initialization
  GetCheckSizes;
  IsWin95 := (Win32Platform = VER_PLATFORM_WIN32_WINDOWS) or 
             (Win32Platform = VER_PLATFORM_WIN32s);
  IsWin2K := (Win32Platform = VER_PLATFORM_WIN32_NT) and 
             (Win32MajorVersion >= 5)

end.

