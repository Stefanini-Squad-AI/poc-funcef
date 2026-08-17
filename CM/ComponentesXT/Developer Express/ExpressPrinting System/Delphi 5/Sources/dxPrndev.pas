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

unit dxPrnDev;

interface

{$I dxPSVer.inc}

uses
  Windows, Classes, SysUtils, Graphics, Messages;

type
  TdxPrinterState = (psNoHandle, psHandleIC, psHandleDC);
  TdxDuplexMode = (dmSimplex, dmHorizontal, dmVertical);
  TdxPrinterOrientation = (poPortrait, poLandscape);
  TdxPrinterCapability = (pcCopies, pcOrientation, pcCollation);
  TdxPrinterCapabilities = set of TdxPrinterCapability;

  EdxPrintDevice = class(Exception);

  TdxPrintDevice = class(TObject)
  private
    FAborted: Boolean;
    FAutoRefresh: Boolean;
    FBins: TStrings;
    FCanvas: TCanvas;
    FCapabilities: TdxPrinterCapabilities;
    FCurrentDevice: PChar;
    FCurrentDriver: PChar;
    FCurrentPort: PChar;
    FDC: hDC;
    FPrinterIndex: Integer;
    FDeviceHandle: THandle;
    FDeviceMode: PDeviceMode;
    FDeviceModeChanged: Boolean;
    FhDeviceMode: THandle;
    FFileName: string;
    FFonts: TStrings;
    FMaxCopies: Integer;
    FMaxExtents: Integer;
    FMinExtents: Integer;
    FPageNumber: Integer;
    FPapers: TStrings;
    FPrinters: TStrings;
    FPersistentDeviceMode: Boolean;
    FPrinting: Boolean;
    FState: TdxPrinterState;
    FTitle: string;
    FWindowHandle: hWnd;

    FOnNewPage: TNotifyEvent;
    FOnPrinterChange: TNotifyEvent;
    FOnRefresh: TNotifyEvent;

    function GetBinIndex: Integer;
    function GetBins: TStrings;
    function GetCanvas: TCanvas;
    function GetPrinterIndex: Integer;
    function GetDeviceMode: PDeviceMode;
    function GetDuplex: TdxDuplexMode;
    function GetFonts: TStrings;
    function GetHandle: HDC;
    function GethDeviceMode: THandle;
    function GetMaxExtents(Index: Integer): Integer;
    function GetMinExtents(Index: Integer): Integer;
    function GetCollate: Boolean;
    function GetColorMode: Boolean;
    function GetCurrentDevice: PChar;
    function GetCurrentDriver: PChar;
    function GetCurrentPort: PChar;
    function GetNumCopies: Integer;
    function GetOrientation: TdxPrinterOrientation;
    function GetPageHeight: Integer;
    function GetPageHeightLoMetric: Integer;
    function GetPageWidth: Integer;
    function GetPageWidthLoMetric: Integer;
    function GetPaperIndex: Integer;
    function GetPapers: TStrings;
    function GetPhysOffset(Index: Integer): Integer;
    function GetPrinters: TStrings;

    procedure SetBinIndex(Value: Integer);
    procedure SetCollate(Value: Boolean);
    procedure SetColorMode(Value: Boolean);
    procedure SetPrinterIndex(Value: Integer);
    procedure SetDuplex(Value: TdxDuplexMode);
    procedure SetNumCopies(Value: Integer);
    procedure SetOrientation(Value: TdxPrinterOrientation);
    procedure SetPaperIndex(Value: Integer);
    procedure SetPrinterCapabilities(Value: Integer);

    procedure CheckPrinting(Value: Boolean);
    procedure ClosePrintDevice;
    procedure FixMinMaxExtents;    
    procedure FreeBins;
    procedure FreeCanvas;
    procedure FreeFonts;
    procedure FreePapers;
    procedure FreePrinters;
    procedure InternalSelectPaperBySize(var AWidth, AHeight: Integer);
    procedure OpenPrintDevice(AIndex: Integer);
    procedure SetState(Value: TdxPrinterState);
    procedure SetToDefaultPrintDevice;
    procedure WndProc(var message: TMessage);
  protected
    procedure DoNewPage; dynamic;
    procedure DoPrinterChange; dynamic;
    procedure DoRefresh; dynamic;
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure Abort;
    function BeginDoc: Integer; {returns the print job identifier for the document}
    procedure EndDoc;
    function FindPrintDevice(ADevice, APort: PChar): Integer;
    function IsDeviceModeChanged: Boolean;
    procedure NewPage;
    procedure Refresh;
    procedure ResetDC(IsForced: Boolean);
    procedure ResetPrintDevice;
    
    function FindBin(ABin: Integer): Integer; {$IFDEF DELPHI4}overload; {$ENDIF}
   {$IFDEF DELPHI4}
    function FindBin(const ABinName: string): Integer; overload;
   {$ENDIF}    
    function FindBinByName(const ABinName: string): Integer;
    function FindPaper(APaper: Integer): Integer; {$IFDEF DELPHI4}overload; {$ENDIF}
   {$IFDEF DELPHI4}
    function FindPaper(const APaperName: string): Integer; overload;
    function FindPaper(const APaperSize: TPoint): Integer; overload;
   {$ENDIF}    
    function FindPaperByName(const APaperName: string): Integer;
    function FindPaperBySizes(AWidth, AHeight: Integer): Integer;
    function IsAutoSelectBin(AIndex: Integer): Boolean;
    function IsEnvelopePaper(AIndex: Integer): Boolean;
    function IsSupportDuplex: Boolean;
    function IsUserPaperSize(AIndex: Integer): Boolean;
    function IsUserPaperSource(AIndex: Integer): Boolean;
    function SelectBin(Value: Integer): Boolean; {$IFDEF DELPHI4}overload; {$ENDIF}
   {$IFDEF DELPHI4}
    function SelectBin(const ABinName: string): Boolean; overload;
   {$ENDIF}    
    function SelectBinByName(const ABinName: string): Boolean;
    function SelectPaper(Value: Integer): Boolean; {$IFDEF DELPHI4}overload; {$ENDIF}
   {$IFDEF DELPHI4}
    function SelectPaper(const APaperName: string): Boolean; overload;
    function SelectPaper(var AWidth, AHeight: Integer): Boolean; overload;
   {$ENDIF}
    function SelectPaperByName(const APaperName: string): Boolean;
    function SelectPaperBySizes(var AWidth, AHeight: Integer): Boolean;
    
    property Aborted: Boolean read FAborted;
    property AutoRefresh: Boolean read FAutoRefresh write FAutoRefresh;
    property BinIndex: Integer read GetBinIndex write SetBinIndex;
    property Bins: TStrings read GetBins;
    property Canvas: TCanvas read GetCanvas;
    property Capabilities: TdxPrinterCapabilities read FCapabilities;
    property Collate: Boolean read GetCollate write SetCollate;
    property ColorMode: Boolean read GetColorMode write SetColorMode;
    property Copies: Integer read GetNumCopies write SetNumCopies;
    property CurrentDevice: PChar read GetCurrentDevice;
    property CurrentDriver: PChar read GetCurrentDriver;
    property CurrentPort: PChar read GetCurrentPort;
    property DeviceMode: PDeviceMode read GetDeviceMode;
    property Duplex: TdxDuplexMode read GetDuplex write SetDuplex;
    property FileName: string read FFileName write FFileName;
    property Fonts: TStrings read GetFonts;
    property Handle: HDC read GetHandle;
    property hDeviceMode: THandle read GethDeviceMode;
    property MaxCopies: Longint read FMaxCopies;
    property MaxExtentX: Integer index 0 read GetMaxExtents;
    property MaxExtentY: Integer index 1 read GetMaxExtents;
    property MinExtentX: Integer index 0 read GetMinExtents;
    property MinExtentY: Integer index 1 read GetMinExtents;
    property Orientation: TdxPrinterOrientation read GetOrientation write SetOrientation;
    property PageHeight: Integer read GetPageHeight;
    property PageHeightLoMetric: Integer read GetPageHeightLoMetric;
    property PageWidth: Integer read GetPageWidth;
    property PageWidthLoMetric: Integer read GetPageWidthLoMetric;
    property PageNumber: Integer read FPageNumber;
    property PaperIndex: Integer read GetPaperIndex write SetPaperIndex;
    property Papers: TStrings read GetPapers;
    property PersistentDeviceMode: Boolean read FPersistentDeviceMode write FPersistentDeviceMode;
    property PhysOffsetX: Integer Index 0 read GetPhysOffset;
    property PhysOffsetY: Integer Index 1 read GetPhysOffset;
    property PrinterIndex: Integer read GetPrinterIndex write SetPrinterIndex;
    property Printers: TStrings read GetPrinters;
    property Printing: Boolean read FPrinting;
    property Title: string read FTitle write FTitle;

    property OnNewPage: TNotifyEvent read FOnNewPage write FOnNewPage;
    property OnPrinterChange: TNotifyEvent read FOnPrinterChange write FOnPrinterChange;
    property OnRefresh: TNotifyEvent read FOnRefresh write FOnRefresh;
  end;

  TdxPrintDeviceInfo = class(TObject)
  private
    FDevice: PChar;
    FDriver: PChar;
    FPort: PChar;
  public
    constructor Create(ADriver, ADevice, APort: PChar);
    destructor Destroy; override;
    function IsEqual(ADriver, ADevice, APort: PChar): Boolean;
    
    property Device: PChar read FDevice;
    property Driver: PChar read FDriver;
    property Port: PChar read FPort;
  end;

  TdxPaperInfo = class(TObject)
  private
    FDMPaper: Integer;
    FName: string;
    FPrintDevice: TdxPrintDevice;
    FSize: TPoint;

    function GetSize(Index: Integer): Integer;
    procedure SetSize(Index: Integer; Value: Integer);
  public
    constructor Create(APrintDevice: TdxPrintDevice);
    procedure Assign(Source: TdxPaperInfo);
    function IsEqual(Source: TdxPaperInfo): Boolean;

    property DMPaper: Integer read FDMPaper;
    property Height: Integer index 1 read GetSize write SetSize;
    property Name: string read FName;
    property Size: TPoint read FSize;
    property Width: Integer index 0 read GetSize write SetSize;
  end;

function dxConnectToNetPrinter(ParentWnd: hWnd): Boolean;
function dxDocumentProperties(ParentWnd: hWnd): Boolean;
function dxInitPrintDevice(RaiseException: Boolean): Boolean;
function dxIsDefaultPrinter(ADevice: PChar): Boolean;
function dxPrintDevice: TdxPrintDevice;
function dxPrintDeviceAllocated: Boolean;
procedure dxReleasePrintDevice;
function dxSetPrintDevice(APrintDevice: TdxPrintDevice): TdxPrintDevice;

implementation

uses
  Controls, Forms, WinSpool,
  dxPSGlbl, dxPSUtl, dxPSRes;

const  
  dxDefaultMaxPaperExtents = 5000;
  dxDefaultMinPaperExtents = 500;
  
var
  FPrintDevice: TdxPrintDevice = nil;
  
{.$DEFINE DEBUG_PRINTDEVICE}  

{$IFDEF DEBUG_PRINTDEVICE}
var
  FLogFile: TextFile;

procedure RewriteLog;
begin
  Rewrite(FLogFile);
end;

procedure WriteLog(const S: string);
begin
  WriteLn(FLogFile, S);
end;

{$ENDIF}

  
function FetchStr(var Str: PChar): PChar;
var
  P: PChar;
begin
  Result := Str;
  if Str = nil then Exit;
  P := Str;
  while P^ = ' ' do
    Inc(P);
  Result := P;
  while (P^ <> #0) and (P^ <> ',') do
    Inc(P);
  if P^ = ',' then
  begin
    P^ := #0;
    Inc(P);
  end;
  Str := P;
end;

procedure RaiseError(const Msg: string);
begin
  raise EdxPrintDevice.Create(Msg);
end;

function IsEqualPoint(const P1, P2: TPoint): Boolean;
begin
  Result := (P1.X = P2.X) and (P1.Y = P2.Y);
end;

function AbortProc(Prn: HDC; Error: Integer): Bool; stdcall;
begin
{$IFDEF DEBUG_PRINTDEVICE}
  WriteLog('AbortProc');
{$ENDIF}  
//  Application.ProcessMessages;
  Result := not FPrintDevice.Aborted;
end;

function dxPrintDeviceAllocated: Boolean;
begin
  Result := Assigned(FPrintDevice);
end;

function dxPrintDevice: TdxPrintDevice;
begin
  if FPrintDevice = nil then FPrintDevice := TdxPrintDevice.Create;
  Result := FPrintDevice;
end;

function dxConnectToNetPrinter(ParentWnd: hWnd): Boolean;
var
  Handle: THandle;
begin
  if IsWin95 then 
    Result := False
  else  
  begin
    Handle := ConnectToPrinterDlg(ParentWnd, 0);
    Result := Handle <> 0;
    if Result then
    begin
      ClosePrinter(Handle);
      dxPrintDevice.Refresh;
    end;
  end;  
end;

function dxDocumentProperties(ParentWnd: hWnd): Boolean;
var
  AhNewDevMode: THandle;
  ANewDevMode: PDevMode;
begin
  Result := False;
  AhNewDevMode := 0;
  try
    AhNewDevMode := CopyData(dxPrintDevice.hDeviceMode);
    if AhNewDevMode <> 0 then
    try
      ANewDevMode := GlobalLock(AhNewDevMode);
      try
        with dxPrintDevice do
          Result := DocumentProperties(ParentWnd, FDeviceHandle, CurrentDevice,
            ANewDevMode^, DeviceMode^, DM_IN_PROMPT or DM_OUT_BUFFER or DM_IN_BUFFER) = IDOK;
      finally
        GlobalUnlock(AhNewDevMode);
      end;
    finally
      if Result then
        with dxPrintDevice do
        begin
          while GlobalUnlock(FhDeviceMode) do;
          GlobalFree(FhDeviceMode);
          FhDeviceMode := AhNewDevMode;
          FDeviceMode := GlobalLock(FhDeviceMode);
        end
      else 
        if (AhNewDevMode <> 0) then GlobalFree(AhNewDevMode);
    end;
  except
    if AhNewDevMode <> 0 then GlobalFree(AhNewDevMode);
  end;
end;

{$HINTS OFF}

function dxInitPrintDevice(RaiseException: Boolean): Boolean;
var
  Stub: HDC;
begin
  Result := True;
  try
    Result := dxPrintDevice.Printers.Count > 0;
    if Result then Stub := dxPrintDevice.Handle;
  except
    Result := False;
    if RaiseException then raise;
  end;
end;
{$HINTS ON}

procedure dxReleasePrintDevice;
begin
  dxSetPrintDevice(nil).Free;
end;

function dxSetPrintDevice(APrintDevice: TdxPrintDevice): TdxPrintDevice;
begin
  Result := FPrintDevice;
  FPrintDevice := APrintDevice;
end;

function dxIsDefaultPrinter(ADevice: PChar): Boolean;
var
  DefaultPrinter: array[0..79] of Char;
  Cur, Device: PChar;
begin
  GetProfileString('WINDOWS', 'DEVICE', '', DefaultPrinter, SizeOf(DefaultPrinter) - 1);
  Cur := DefaultPrinter;
  Device := FetchStr(Cur);
  Result := StrIComp(ADevice, Device) = 0;
end;


{ TdxPrintDeviceInfo }

constructor TdxPrintDeviceInfo.Create(ADriver, ADevice, APort: PChar);
begin
  inherited Create;
  FDriver := StrNew(ADriver);
  FDevice := StrNew(ADevice);
  FPort := StrNew(APort);
end;

destructor TdxPrintDeviceInfo.Destroy;
begin
  StrDispose(FPort);
  StrDispose(FDevice);
  StrDispose(FDriver);
  inherited Destroy;
end;

function TdxPrintDeviceInfo.IsEqual(ADriver, ADevice, APort: PChar): Boolean;
begin
  Result := (StrIComp(FDevice, ADevice) = 0) and ((FPort = nil) or (StrIComp(FPort, APort) = 0));
end;

{  TdxPrintDeviceCanvas }
type
  TdxPrintDeviceCanvas = class(TCanvas)
  private
    FPrintDevice: TdxPrintDevice;
  protected
    procedure CreateHandle; override;
    procedure Changing; override;
    procedure UpdateFont;
  public
    constructor Create(APrintDevice: TdxPrintDevice);
  end;

constructor TdxPrintDeviceCanvas.Create(APrintDevice: TdxPrintDevice);
begin
  inherited Create;
  FPrintDevice := APrintDevice;
end;

procedure TdxPrintDeviceCanvas.CreateHandle;
begin
  FPrintDevice.SetState(psHandleIC);
  UpdateFont;
  Handle := FPrintDevice.FDC;
end;

procedure TdxPrintDeviceCanvas.Changing;
begin
  FPrintDevice.CheckPrinting(True);
  inherited Changing;
  UpdateFont;
end;

procedure TdxPrintDeviceCanvas.UpdateFont;
var
  FontSize: Integer;
begin
  if GetDeviceCaps(FPrintDevice.FDC, LOGPIXELSY) <> Font.PixelsPerInch then
  begin
    FontSize := Font.Size;
    Font.PixelsPerInch := GetDeviceCaps(FPrintDevice.FDC, LOGPIXELSY);
    Font.Size := FontSize;
  end;
end;


{ TdxPaperInfo }

constructor TdxPaperInfo.Create(APrintDevice: TdxPrintDevice);
begin
  inherited Create;
  FPrintDevice := APrintDevice;
end;

function TdxPaperInfo.IsEqual(Source: TdxPaperInfo): Boolean;
begin
  Result := 
    (DMPaper = Source.DMPaper) and (FName = Source.Name) and IsEqualPoint(Size, Source.Size);
end;

procedure TdxPaperInfo.Assign(Source: TdxPaperInfo);
begin
  FDMPaper := Source.FDMPaper;
  FName := Source.FName;
  FSize := Source.FSize;
end;

function TdxPaperInfo.GetSize(Index: Integer): Integer;
begin
  if Index = 0 then
    Result := FSize.X
  else
    Result := FSize.Y;
end;

procedure TdxPaperInfo.SetSize(Index: Integer; Value: Integer);
begin
  if DMPaper < DMPAPER_USER then Exit;
  if Index = 0 then
  begin
    FSize.X := Value;
    if (FPrintDevice <> nil) and (FPrintDevice.DeviceMode <> nil) then
      FPrintDevice.DeviceMode^.dmPaperWidth := FSize.X;
  end
  else
  begin
    FSize.Y := Value;
    if (FPrintDevice <> nil) and (FPrintDevice.DeviceMode <> nil) then
      FPrintDevice.DeviceMode^.dmPaperlength := FSize.Y;
  end;
end;


{ TdxPrintDevice }

constructor TdxPrintDevice.Create;
begin
  inherited Create;
  FWindowHandle := {$IFDEF DELPHI6}Classes.{$ENDIF}AllocatehWnd(WndProc);
  FPrinterIndex := -MaxInt;
  FAutoRefresh := False;
  FPersistentDeviceMode := True;
end;

destructor TdxPrintDevice.Destroy;
begin
  if Printing then EndDoc;
  SetState(psNoHandle);
  if IsWindow(FWindowHandle) then 
    {$IFDEF DELPHI6}Classes.{$ENDIF}DeallocatehWnd(FWindowHandle);
  FWindowHandle := 0;
  ClosePrintDevice;
  FreePrinters;
  inherited Destroy;
end;

procedure TdxPrintDevice.WndProc(var message: TMessage);
var
  Msg: TMsg;
begin
  if (message.Msg = WM_SETTINGCHANGE) then
  begin
    if AutoRefresh then
      PostMessage(FWindowHandle, WMPS_PRINTERLISTCHANGED, 0, 0);
  end
  else 
    if (message.Msg = WMPS_PRINTERLISTCHANGED) and AutoRefresh then
      if not FPrinting then
      begin
        while PeekMessage(Msg, FWindowHandle, WMPS_PRINTERLISTCHANGED, 
          WMPS_PRINTERLISTCHANGED, PM_REMOVE) do  ;
        Refresh;
      end
      else
        PostMessage(FWindowHandle, WMPS_PRINTERLISTCHANGED, 0, 0);
end;

procedure TdxPrintDevice.SetState(Value: TdxPrinterState);
type
  TCreateHandleFunc = function(DriverName, DeviceName, Output: PChar;
    InitData: PDeviceMode): HDC stdcall;
var
  CreateHandleFunc: TCreateHandleFunc;
begin
  if Value <> FState then
  begin
    CreateHandleFunc := nil;
    case Value of
      psNoHandle:
        begin
          CheckPrinting(False);
          if FCanvas <> nil then 
            FCanvas.Handle := 0;
          DeleteDC(FDC);
          FDC := 0;
        end;
      psHandleIC:
        if FState <> psHandleDC then
          CreateHandleFunc := CreateIC
        else
          Exit;
      psHandleDC:
        begin
          if FCanvas <> nil then 
            FCanvas.Handle := 0;
          if FDC <> 0 then 
            DeleteDC(FDC);
          CreateHandleFunc := CreateDC;
        end;
    end;
    if Assigned(CreateHandleFunc) then
      with TdxPrintDeviceInfo(Printers.Objects[PrinterIndex]) do
      begin
        FDC := CreateHandleFunc(FDriver, FDevice, FPort, FDeviceMode);
        if FDC = 0 then 
          RaiseError(sdxInvalidPrintDevice);
        if FCanvas <> nil then 
          FCanvas.Handle := FDC;
      end;
    FState := Value;
  end;
end;

procedure TdxPrintDevice.CheckPrinting(Value: Boolean);
begin
  if Printing <> Value then
    if Value then
      RaiseError(sdxNotPrinting)
    else
      RaiseError(sdxPrinting);
end;

procedure TdxPrintDevice.Abort;
begin
  CheckPrinting(True);
  AbortDoc(Canvas.Handle);
  FAborted := True;
  EndDoc;
end;

function TdxPrintDevice.BeginDoc: Integer;
var
  DocInfo: TDocInfo;
begin
  Application.ProcessMessages;
{$IFDEF DEBUG_PRINTDEVICE}
  RewriteLog;
  WriteLog('BeginDoc');
{$ENDIF}  
  CheckPrinting(False);
  SetState(psNoHandle);
  SetState(psHandleDC);
  Canvas.Refresh;
  TdxPrintDeviceCanvas(Canvas).UpdateFont;
  FPrinting := True;
  FAborted := False;
  FPageNumber := 1;
  FillChar(DocInfo, SizeOf(DocInfo), 0);
  with DocInfo do
  begin
    cbSize := SizeOf(DocInfo);
    lpszDocName := PChar(Title);
    if FileName <> '' then lpszOutput := PChar(FileName);
  end;
  SetAbortProc(FDC, AbortProc);
  Result := StartDoc(FDC, DocInfo);
  if Result > 0 then 
    StartPage(FDC)
  else 
  begin
    FPrinting := False;
    FAborted := False;
    SetState(psNoHandle);
    FPageNumber := 0;
  end;
end;

procedure TdxPrintDevice.EndDoc;
begin
{$IFDEF DEBUG_PRINTDEVICE}
  WriteLog('EndDoc');
{$ENDIF}  
  CheckPrinting(True);
  EndPage(FDC);
  if not Aborted then Windows.EndDoc(FDC);
  FPrinting := False;
  FAborted := False;
  SetState(psNoHandle);
  FPageNumber := 0;
end;

procedure TdxPrintDevice.NewPage;
begin
{$IFDEF DEBUG_PRINTDEVICE}
  WriteLog('NewPage');
{$ENDIF}  
  CheckPrinting(True);
  EndPage(FDC);
  Inc(FPageNumber);
  Application.ProcessMessages;
  DoNewPage;
  ResetDC(False);
  StartPage(FDC);
  Canvas.Refresh;
end;

procedure TdxPrintDevice.DoNewPage;
begin
  if Assigned(FOnNewPage) then FOnNewPage(Self)
end;

function TdxPrintDevice.IsDeviceModeChanged: Boolean;
begin
  Result := FDeviceModeChanged;
end;

procedure TdxPrintDevice.DoPrinterChange;
begin
  if Assigned(FOnPrinterChange) then FOnPrinterChange(Self);
end;

procedure TdxPrintDevice.DoRefresh;
begin
  if Assigned(FOnRefresh) then FOnRefresh(Self);
end;

procedure TdxPrintDevice.SetPrinterCapabilities(Value: Integer);
begin
  FCapabilities := [];
  if Value and DM_ORIENTATION <> 0 then Include(FCapabilities, pcOrientation);
  if Value and DM_COPIES <> 0 then Include(FCapabilities, pcCopies);
  if Value and DM_COLLATE <> 0 then Include(FCapabilities, pcCollation);
end;

function TdxPrintDevice.GetCanvas: TCanvas;
begin
  if FCanvas = nil then FCanvas := TdxPrintDeviceCanvas.Create(Self);
  Result := FCanvas;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

function TdxPrintDevice.GetFonts: TStrings;
begin
  if not Assigned(FFonts) then
  try
    SetState(psHandleIC);
    FFonts := TStringList.Create;
    EnumFonts(FDC, nil, @EnumFontsProc, Pointer(FFonts));
  except
    FFonts.Free;
    FFonts := nil;
    raise;
  end;
  Result := FFonts;
end;

function TdxPrintDevice.GetHandle: HDC;
begin
  SetState(psHandleIC);
  Result := FDC;
end;

function TdxPrintDevice.GetMaxExtents(Index: Integer): Integer;
begin
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if Index = 0 then
      Result := LOWORD(FMaxExtents)
    else
      Result := HIWORD(FMaxExtents);
  end
  else
    Result := dxDefaultMaxPaperExtents;
end;

function TdxPrintDevice.GetMinExtents(Index: Integer): Integer;
begin
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if Index = 0 then
      Result := LOWORD(FMinExtents)
    else
      Result := HIWORD(FMinExtents);
  end
  else
    Result := dxDefaultMinPaperExtents;
end;

function TdxPrintDevice.GetPhysOffset(Index: Integer): Integer;
const
  PhysicalOffsets: array[0..1] of Integer = (PHYSICALOFFSETX, PHYSICALOFFSETY);
begin
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    try
      Result := GetDeviceCaps(Handle, PhysicalOffsets[Index]);
    except
      Result := 0;
    end;  
  end
  else
    Result := 0;
end;

function TdxPrintDevice.GetDuplex: TdxDuplexMode;
begin
  Result := dmSimplex;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then
      Result := TdxDuplexMode(FDeviceMode^.dmDuplex - 1)
  end;
end;

procedure TdxPrintDevice.SetDuplex(Value: TdxDuplexMode);
begin
  //CheckPrinting(False);
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then
      if IsSupportDuplex then
      begin
        FDeviceMode^.dmDuplex := Integer(Value) + 1;
        FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_DUPLEX;
        FDeviceModeChanged := True;
      end;
  end;    
end;

function TdxPrintDevice.IsSupportDuplex: Boolean;
begin
  Result := (FDeviceMode <> nil) and ((FDeviceMode^.dmFields and DM_DUPLEX) > 0);
end;

function TdxPrintDevice.GetColorMode: Boolean;
const
  ColorModes: array[DMCOLOR_MONOCHROME..DMCOLOR_COLOR] of Boolean = (False, True);
begin
  Result := False;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then Result := ColorModes[FDeviceMode^.dmColor - 1];
  end;
end;

function TdxPrintDevice.GetCollate: Boolean;
const
  Collations: array[DMCOLLATE_FALSE..DMCOLLATE_TRUE] of Boolean = (False, True);
begin
  Result := False;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then Result := Collations[FDeviceMode^.dmCollate]
  end;    
end;

procedure TdxPrintDevice.SetColorMode(Value: Boolean);
const
  ColorModes: array[Boolean] of ShortInt = (DMCOLOR_MONOCHROME, DMCOLOR_COLOR);
begin
  //CheckPrinting(False);
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then
    begin
      FDeviceMode^.dmColor := ColorModes[Value];
      FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_DUPLEX;      
      FDeviceModeChanged := True;
    end;
  end;  
end;

procedure TdxPrintDevice.SetCollate(Value: Boolean);
const
  Collations: array[Boolean] of ShortInt = (DMCOLLATE_FALSE, DMCOLLATE_TRUE);
begin
  //CheckPrinting(False);
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then
    begin
      FDeviceMode^.dmCollate := Collations[Value];
      FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_COLLATE;      
      FDeviceModeChanged := True;
    end;
  end;  
end;

function TdxPrintDevice.GetCurrentDevice: PChar;
begin
  Result := nil;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then Result := FCurrentDevice;
  end;    
end;

function TdxPrintDevice.GetCurrentDriver: PChar;
begin
  Result := nil;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then Result := FCurrentDriver;
  end;    
end;

function TdxPrintDevice.GetCurrentPort: PChar;
begin
  Result := nil;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then Result := FCurrentPort;
  end;    
end;

function TdxPrintDevice.GetNumCopies: Integer;
begin
  Result := 0;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then Result := FDeviceMode^.dmCopies;
  end;    
end;

procedure TdxPrintDevice.SetNumCopies(Value: Integer);
begin
  CheckPrinting(False);
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then
    begin
      FDeviceMode^.dmCopies := Value;
      FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_COPIES;
      FDeviceModeChanged := True;
    end;
  end;  
end;

function TdxPrintDevice.GetOrientation: TdxPrinterOrientation;
begin
  Result := poPortrait;
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if (FhDeviceMode <> 0) and (FDeviceMode^.dmOrientation = DMORIENT_LANDSCAPE) then
      Result := poLandscape;
  end;
end;

procedure TdxPrintDevice.SetOrientation(Value: TdxPrinterOrientation);
const
  Orientations: array[TdxPrinterOrientation] of Integer = 
    (DMORIENT_PORTRAIT, DMORIENT_LANDSCAPE);
begin
  //CheckPrinting(False);
  if Printers.Count > 0 then 
  begin
    GetPrinterIndex;
    if FhDeviceMode <> 0 then
    begin
      FDeviceMode^.dmOrientation := Orientations[Value];
      FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_ORIENTATION;
      FDeviceModeChanged := True;
    end;
  end;  
end;

function TdxPrintDevice.GetPageHeight: Integer;
begin
  SetState(psHandleIC);
  Result := GetDeviceCaps(FDC, VertRes);
end;

function TdxPrintDevice.GetPageHeightLoMetric: Integer;
begin
  SetState(psHandleIC);
  Result := 10 * GetDeviceCaps(FDC, VertSize);
end;

function TdxPrintDevice.GetPageWidth: Integer;
begin
  SetState(psHandleIC);
  Result := GetDeviceCaps(FDC, HorzRes);
end;

function TdxPrintDevice.GetPageWidthLoMetric: Integer;
begin
  SetState(psHandleIC);
  Result := 10 * GetDeviceCaps(FDC, HorzSize);
end;

function TdxPrintDevice.GetPrinterIndex: Integer;
begin
  if (FPrinterIndex = -MaxInt) then SetToDefaultPrintDevice;
  Result := FPrinterIndex;
end;

procedure TdxPrintDevice.SetPrinterIndex(Value: Integer);
begin
  CheckPrinting(False);
  if (Value < -1) or (Value >= Printers.Count) then
    RaiseError(sdxPrinterIndexError)
  else 
    if Value = -1 then
    begin
      FPrinterIndex := -MaxInt;
      GetPrinterIndex;
    end
    else
      OpenPrintDevice(Value);
  SetState(psNoHandle);
end;

function TdxPrintDevice.GetBins: TStrings;
const
  dxBinLength = SizeOf(Word);
  dxBinNameLength = 24;
type
  TdxBin = Word;
  TdxBins = array[0..0] of TdxBin;
  PdxBins = ^TdxBins;
  TdxBinName = array[0..dxBinNameLength - 1] of char;
  TdxBinNames = array[0..0] of TdxBinName;
  PdxBinNames = ^TdxBinNames;
var
  ABins: PdxBins;
  ABinNames: PdxBinNames;
  ACount: Integer;
  I: Integer;
  AName: string;
  AValue: TdxBin;
  ACapability: UINT;
begin
  if FBins = nil then
  try
    if Printers.Count > 0 then
    begin
      GetPrinterIndex;
      if DeviceMode = nil then
      begin
        Result := nil;
        Exit;
      end;
      ACapability := DC_BINS;
      ACount := WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, 
         ACapability, nil, nil);
      if ACount > 0 then
      begin
        ABins := AllocMem(dxBinLength * ACount);
        try
          if WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, ACapability, PChar(ABins), nil) <> -1 then
          begin
            ABinNames := AllocMem(dxBinNameLength * ACount);
            try
              ACapability := DC_BINNAMES;
              if WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, ACapability, PChar(ABinNames), nil) <> -1 then
              begin
                FBins := TStringList.Create;
{$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
                for I := 0 to ACount - 1 do
                begin
                  AName := ABinNames^[I];
                  AValue := ABins^[I];
                  FBins.AddObject(AName, TObject(AValue));
                end;
{$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}
              end;
            finally
              FreeMem(ABinNames, dxBinNameLength * ACount);
            end;
          end;
        finally
          FreeMem(ABins, dxBinLength * ACount);
        end;
      end;
    end
    else
    begin
      FBins := TStringList.Create;
      FBins.AddObject(sdxDefaultTray, TObject(DMBIN_USER));
    end;
  except
    if FBins <> nil then FBins.Free;
    FBins := nil;
    raise;
  end;
  Result := FBins;
end;

function TdxPrintDevice.GetPapers: TStrings;
const
  dxPaperNameLength = 64;
  dxPaperValueLength = SizeOf(Word);
  dxPaperSizeLength = SizeOf(TPoint);
type
  TdxPaperSize = TPoint;
  TdxPaperSizes = array[0..0] of TdxPaperSize;
  PdxPaperSizes = ^TdxPaperSizes;
  TdxPaperValue = Word;
  TdxPaperValues = array[0..0] of TdxPaperValue;
  PdxPaperValues = ^TdxPaperValues;
  TdxPaperName = array[0..dxPaperNameLength - 1] of char;
  TdxPaperNames = array[0..0] of TdxPaperName;
  PdxPaperNames = ^TdxPaperNames;
var
  APaperNames: PdxPaperNames;
  APaperValues: PdxPaperValues;
  APaperSizes: PdxPaperSizes;
  ACount: Integer;
  I: Integer;
  AName: string;
  AValue: Integer;
  ASize: TPoint;
  APaper: TdxPaperInfo;
  ACapability: UINT;
  ASaveFirstDMPaper: TPoint;
  NoStandardPapers: Boolean;
begin
  if FPapers = nil then
  try
    NoStandardPapers := True;
    if Printers.Count > 0 then
    begin
      GetPrinterIndex;
      if DeviceMode = nil then
      begin
        Result := nil;
        Exit;
      end;
      ACapability := DC_PAPERNAMES;
      ACount := WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, 
        ACapability, nil, nil);
      if ACount > 0 then
      begin
        APaperNames := AllocMem(dxPaperNameLength * ACount);
        try
          if WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, ACapability, PChar(APaperNames), nil) <> -1 then
          begin
            NoStandardPapers := False;
            ACapability := DC_PAPERS;
            APaperValues := AllocMem(dxPaperValueLength * ACount);
            try
              if WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, ACapability, PChar(APaperValues), nil) <> -1 then
              begin
                ACapability := DC_PAPERSIZE;
                APaperSizes := AllocMem(dxPaperSizeLength * ACount);
                try
                  if WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, ACapability, PChar(APaperSizes), nil) <> -1 then
                  begin
                    NoStandardPapers := False;
                    FPapers := TStringList.Create;
                   {$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
                    for I := 0 to ACount - 1 do
                    begin
                      AName := APaperNames^[I];
                      AValue := APaperValues^[I];
                      ASize := APaperSizes^[I];
                      APaper := TdxPaperInfo.Create(Self);
                      with APaper do
                      begin
                        FSize := ASize;
                        FDMPaper := AValue;
                        FName := AName;
                      end;
                      FPapers.AddObject(APaper.Name, APaper);
                      if AValue = DMPAPER_FIRST then ASaveFirstDMPaper := ASize;
                    end;
                   {$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}
                    if Pos('Custom', FPapers[ACount - 1]) = 0 then
                    begin
                      APaper := TdxPaperInfo.Create(Self);
                      with APaper do
                      begin
                        FSize := ASaveFirstDMPaper;
                        FDMPaper := DMPAPER_USER;
                        FName := sdxCustomSize;
                      end;
                      FPapers.AddObject(APaper.Name, APaper);
                    end;
                  end;
                finally
                  FreeMem(APaperSizes, dxPaperSizeLength * ACount);
                end;
              end;
            finally
              FreeMem(APaperValues, dxPaperValueLength * ACount);
            end;
          end;
        finally
          FreeMem(APaperNames, dxPaperNameLength * ACount);
        end;
      end;
    end;
    if NoStandardPapers then
    begin
      FPapers := TStringList.Create;
      APaper := TdxPaperInfo.Create(Self);
      with APaper do
      begin
        FSize := Point(2100, 2970); {A4}
        FDMPaper := DMPAPER_USER;
        FName := sdxCustomSize;
      end;
      FPapers.AddObject(APaper.Name, APaper);
    end;
  except
    if FPapers <> nil then FPapers.Free;
    FPapers := nil;
    raise;
  end;
  Result := FPapers;
end;

procedure TdxPrintDevice.FixMinMaxExtents;
var
  I: Integer;
  MaxSize, MinSize, PaperSize: TPoint;
begin
  if (FMaxExtents = -1) or (FMaxExtents = 0) {fu. drivers writers} then
  begin
    LongRec(FMaxExtents).Lo := 254 * 30;
    LongRec(FMaxExtents).Hi := 254 * 30;
  end;
  if (FMinExtents = -1) or (FMinExtents = 0) {fu. drivers writers} then
  begin                                                  
    LongRec(FMinExtents).Lo := 254;
    LongRec(FMinExtents).Hi := 254;
  end;
  if Papers <> nil then 
  begin
    MaxSize := Point(LOWORD(FMaxExtents), HIWORD(FMaxExtents));
    MinSize := Point(LOWORD(FMinExtents), HIWORD(FMinExtents));
    for I := 0 to Papers.Count - 1 do
    begin
      PaperSize := TdxPaperInfo(Papers.Objects[I]).Size;
      if PaperSize.X < MinSize.X then MinSize.X := PaperSize.X;
      if PaperSize.X > MaxSize.X then MaxSize.X := PaperSize.X;
      if PaperSize.Y < MinSize.Y then MinSize.Y := PaperSize.Y;
      if PaperSize.Y > MaxSize.Y then MaxSize.Y := PaperSize.Y;
    end;
    if MinSize.X <> LOWORD(FMinExtents) then LongRec(FMinExtents).Lo := MinSize.X;
    if MinSize.Y <> HIWORD(FMinExtents) then LongRec(FMinExtents).Hi := MinSize.Y;
    if MaxSize.X <> LOWORD(FMaxExtents) then LongRec(FMaxExtents).Lo := MaxSize.X;
    if MaxSize.Y <> HIWORD(FMaxExtents) then LongRec(FMaxExtents).Hi := MaxSize.Y;
  end;  
  if LOWORD(FMinExtents) < 500 then LongRec(FMinExtents).Lo := 500;
  if HIWORD(FMinExtents) < 500 then LongRec(FMinExtents).Hi := 500;
  if LOWORD(FMaxExtents) < LOWORD(FMinExtents) then
    LongRec(FMaxExtents).Lo := LOWORD(FMinExtents);
  if HIWORD(FMaxExtents) < HIWORD(FMinExtents) then
    LongRec(FMaxExtents).Hi := HIWORD(FMinExtents);
end;

function TdxPrintDevice.GetPrinters: TStrings;
var
  LineCur, Port, Buffer, PrinterInfo: PChar;
  Level, Flags, Count, NumInfo: DWORD;
  I: Integer;
begin
  if FPrinters = nil then
  begin
    FPrinters := TStringList.Create;
    Result := FPrinters;
    try
      if Win32Platform = VER_PLATFORM_WIN32_NT then
      begin
        Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
        Level := 2;//4;
      end
      else
      begin
        Flags := PRINTER_ENUM_LOCAL;
        Level := 5;
      end;
      Count := 0;
      EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
      if (Count = 0) then Exit;
      GetMem(Buffer, Count);
      try
        if not EnumPrinters(Flags, nil, Level, PByte(Buffer), Count, Count, NumInfo) then
          Exit;
        PrinterInfo := Buffer;
        for I := 0 to NumInfo - 1 do
        begin
          if Level = 2 then
            with PPrinterInfo2(PrinterInfo)^ do
            begin
              FPrinters.AddObject(pPrinterName, 
                 TdxPrintDeviceInfo.Create(pDriverName, pPrinterName, pPortName));
              Inc(PrinterInfo, sizeof(TPrinterInfo2));
            end
          else
            with PPrinterInfo5(PrinterInfo)^ do
            begin
              LineCur := pPortName;
              Port := FetchStr(LineCur);
              while Port^ <> #0 do
              begin
                FPrinters.AddObject(Format(sdxDeviceOnPort, [pPrinterName, Port]),
                  TdxPrintDeviceInfo.Create(nil, pPrinterName, Port));
                Port := FetchStr(LineCur);
              end;
              Inc(PrinterInfo, SizeOf(TPrinterInfo5));
            end;
        end;
      finally
        FreeMem(Buffer, Count);
      end;
    except
      FPrinters.Free;
      FPrinters := nil;
      raise;
    end;
  end;
  Result := FPrinters;
end;

procedure TdxPrintDevice.SetToDefaultPrintDevice;
var
  I: Integer;
  ByteCnt, StructCnt: DWORD;
  DefaultPrinter: array[0..256] of Char;
  Cur, Device: PChar;
  PrinterInfo: PPrinterInfo5;
begin
  ByteCnt := 0;
  StructCnt := 0;
  if not EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, nil, 0, ByteCnt,
    StructCnt) and (GetLastError <> ERROR_INSUFFICIENT_BUFFER) then
  begin
    if GetLastError = ERROR_INVALID_NAME then
      RaiseError(sdxNoDefaultPrintDevice)
    else
    {$IFDEF DELPHI6}
      RaiseLastOSError;
    {$ELSE}  
      RaiseLastWin32Error;
    {$ENDIF}  
  end;
  PrinterInfo := AllocMem(ByteCnt);
  try
    if EnumPrinters(PRINTER_ENUM_DEFAULT, nil, 5, PrinterInfo, ByteCnt, ByteCnt, StructCnt) then
    begin
      if (StructCnt > 0) then Device := PrinterInfo.pPrinterName
      else
      begin
        GetProfileString('windows', 'device', '', DefaultPrinter, SizeOf(DefaultPrinter) - 1);
        Cur := DefaultPrinter;
        Device := FetchStr(Cur);
      end;
      with Printers do
        for I := 0 to Count - 1 do
          if (StrIComp(TdxPrintDeviceInfo(Objects[I]).FDevice, Device) = 0) then
          begin
            OpenPrintDevice(I);
            Exit;
          end;
    end;
  finally
    FreeMem(PrinterInfo);
  end;
  RaiseError(sdxNoDefaultPrintDevice);
end;

procedure TdxPrintDevice.FreePrinters;
var
  I: Integer;
begin
  if Assigned(FPrinters) then
  begin
    for I := 0 to FPrinters.Count - 1 do
      FPrinters.Objects[I].Free;
    FPrinters.Free;
    FPrinters := nil;
  end;
end;

procedure TdxPrintDevice.FreeFonts;
begin
  if Assigned(FFonts) then
  begin
    FFonts.Free;
    FFonts := nil;
  end;
end;

procedure TdxPrintDevice.FreeCanvas;
begin
  if Assigned(FCanvas) then
  begin
    FCanvas.Free;
    FCanvas := nil;
  end;
end;

procedure TdxPrintDevice.FreePapers;
var
  I: Integer;
begin
  if FPapers <> nil then
  begin
    for I := 0 to FPapers.Count - 1 do
      FPapers.Objects[I].Free;
    FPapers.Free;
    FPapers := nil;
  end;
end;

procedure TdxPrintDevice.FreeBins;
begin
  if FBins <> nil then
  begin
    FBins.Free;
    FBins := nil;
  end;
end;

function TdxPrintDevice.IsUserPaperSource(AIndex: Integer): Boolean;
begin
  Result := (Bins <> nil) and (AIndex > -1) and (AIndex < Bins.Count) and
    (Integer(Papers.Objects[AIndex]) >= DMBIN_USER);
end;

function TdxPrintDevice.IsUserPaperSize(AIndex: Integer): Boolean;
begin
  Result := (Papers <> nil) and (AIndex > -1) and (AIndex < Papers.Count) and 
    ((Pos('Custom', TdxPaperInfo(Papers.Objects[AIndex]).Name) > 0) or 
     (TdxPaperInfo(Papers.Objects[AIndex]).DMPaper >= DMPAPER_USER));
end;

function TdxPrintDevice.IsAutoSelectBin(AIndex: Integer): Boolean;
begin
  Result := (Bins <> nil) and (AIndex > -1) and (AIndex < Bins.Count) and
    (Pos('Auto', Bins[AIndex]) > 0);
end;

function TdxPrintDevice.IsEnvelopePaper(AIndex: Integer): Boolean;
begin
  Result := (Papers <> nil) and (AIndex > -1) and (AIndex < Papers.Count) and
    (Pos('Env', Papers[AIndex]) > 0);
end;

function TdxPrintDevice.FindBin(ABin: Integer): Integer;
begin
  Result := -1;
  if Bins <> nil then Result := Bins.IndexOfObject(TObject(ABin));
end;

function TdxPrintDevice.FindBinByName(const ABinName: string): Integer;
begin
  Result := -1;
  if Bins <> nil then Result := Bins.IndexOf(ABinName);
end;

function TdxPrintDevice.FindPaper(APaper: Integer): Integer;
begin
  if Papers <> nil then
    for Result := 0 to Papers.Count - 1 do
      if TdxPaperInfo(Papers.Objects[Result]).DMPaper = APaper then 
        Exit;
  Result := -1;
end;

function TdxPrintDevice.FindPaperByName(const APaperName: string): Integer;
begin
  Result := -1;
  if Papers <> nil then
    Result := Papers.IndexOf(APaperName);
end;

function TdxPrintDevice.FindPaperBySizes(AWidth, AHeight: Integer): Integer;
begin
  if Papers <> nil then
  begin
    for Result := 0 to Papers.Count - 1 do
      if IsEqualPoint(TdxPaperInfo(Papers[Result]).Size, Point(AWidth, AHeight)) then
        Exit;
    Result := Papers.Count - 1;
  end
  else
    Result := -1;
end;

function TdxPrintDevice.GetBinIndex: Integer;
begin
  if FhDeviceMode <> 0 then
  begin
    Result := FindBin(FDeviceMode^.dmDefaultSource);
    if (Result = -1) and (FBins <> nil) and (FBins.Count > 0) then 
      Result := 0;
  end  
  else
    Result := 0;
end;

function TdxPrintDevice.GetPaperIndex: Integer;
begin
  if FhDeviceMode <> 0 then
  begin
    Result := FindPaper(FDeviceMode^.dmPaperSize);
    if (Result = -1) and (FPapers <> nil) and (FPapers.Count > 0) then 
      Result := 0;    
  end  
  else
    Result := 0;
end;

procedure TdxPrintDevice.SetBinIndex(Value: Integer);
begin
  if (FhDeviceMode <> 0) and (Bins <> nil) and (Value > -1) and (Value < Bins.Count) and
    (FDeviceMode^.dmDefaultSource <> Value) then
  begin
    FDeviceMode^.dmDefaultSource := Integer(Bins.Objects[Value]);
    FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_DEFAULTSOURCE;
    FDeviceModeChanged := True;
  end;
end;

procedure TdxPrintDevice.SetPaperIndex(Value: Integer);
begin
  if (FhDeviceMode <> 0) and (Papers <> nil) and (Value > -1) and (Value < Papers.Count) then
  begin
    FDeviceMode^.dmPaperSize := TdxPaperInfo(Papers.Objects[Value]).DMPaper;
    FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_PAPERSIZE;
    if Value = Papers.Count - 1 then
      FDeviceMode^.dmFields := FDeviceMode^.dmFields or DM_PAPERWIDTH or DM_PAPERLENGTH;
    FDeviceModeChanged := True;
  end;
end;

function TdxPrintDevice.SelectBin(Value: Integer): Boolean;
var
  Index: Integer;
begin
  Index := FindBin(Value);
  Result := Index > -1;
  if Result then BinIndex := Index;
end;

function TdxPrintDevice.SelectBinByName(const ABinName: string): Boolean;
var
  Index: Integer;
begin
  Index := FindBinByName(ABinName);
  Result := Index > -1;
  if Result then BinIndex := Index;
end;

function TdxPrintDevice.SelectPaper(Value: Integer): Boolean;
var
  Index: Integer;
begin
  Index := FindPaper(Value);
  Result := Index > -1;
  if Result then PaperIndex := Index;
end;

function TdxPrintDevice.SelectPaperByName(const APaperName: string): Boolean;
var
  Index: Integer;
begin
  Index := FindPaperByName(APaperName);
  Result := Index > -1;
  if Result then PaperIndex := Index;
end;

function TdxPrintDevice.SelectPaperBySizes(var AWidth, AHeight: Integer): Boolean;
var
  Index: Integer;
begin
  Index := FindPaperBySizes(AWidth, AHeight);
  Result := Index > -1;
  if not Result then Exit;
  PaperIndex := Index; // setting FDeviceModeChanged := True;
  if DeviceMode = nil then Exit;
  if PaperIndex = Papers.Count - 1 then 
    InternalSelectPaperBySize(AWidth, AHeight)
  else
  begin
    DeviceMode^.dmPaperWidth := 0;
    DeviceMode^.dmPaperLength := 0;
  end;
end;

procedure TdxPrintDevice.InternalSelectPaperBySize(var AWidth, AHeight: Integer);
begin
  if AWidth > MaxExtentX then AWidth := MaxExtentX;
  if AWidth < MinExtentX then AWidth := MinExtentX;
  if AHeight > MaxExtentY then AHeight := MaxExtentY;
  if AHeight < MinExtentY then AHeight := MinExtentY;
  with DeviceMode^ do
  begin
    if dmPaperWidth <> AWidth then
      TdxPaperInfo(Papers.Objects[Papers.Count - 1]).Width := AWidth;
    if dmPaperLength <> AHeight then
      TdxPaperInfo(Papers.Objects[Papers.Count - 1]).Height := AHeight;
  end;
end;

{$IFDEF DELPHI4}

function TdxPrintDevice.FindBin(const ABinName: string): Integer;
begin
  Result := FindBinByName(ABinName);
end;

function TdxPrintDevice.FindPaper(const APaperName: string): Integer;
begin
  Result := FindPaperByName(APaperName);
end;

function TdxPrintDevice.FindPaper(const APaperSize: TPoint): Integer;
begin
  Result := FindPaperBySizes(APaperSize.X, APaperSize.Y);
end;

function TdxPrintDevice.SelectBin(const ABinName: string): Boolean;
begin
  Result := SelectBinByName(ABinName);
end;

function TdxPrintDevice.SelectPaper(const APaperName: string): Boolean;
begin
  Result := SelectPaperByName(APaperName);
end;

function TdxPrintDevice.SelectPaper(var AWidth, AHeight: Integer): Boolean;
begin
  Result := SelectPaperBySizes(AWidth, AHeight);
end;
{$ENDIF}

procedure TdxPrintDevice.Refresh;
var
  ADevice, APort: PChar;
  APrinterIndex: Integer;
  AhDeviceMode: THandle;
begin
  ADevice := StrNew(FCurrentDevice);
  try
    APort := StrNew(FCurrentPort);
    try
      AhDeviceMode := 0;
      if FhDeviceMode <> 0 then AhDeviceMode := CopyData(FhDeviceMode);
      try
        ClosePrintDevice;
        FreePrinters;
        GetPrinters;
        if AhDeviceMode <> 0 then
        begin
          APrinterIndex := FindPrintDevice(ADevice, APort);
          if APrinterIndex <> -1 then
          begin
            OpenPrintDevice(APrinterIndex);
            if FhDeviceMode <> 0 then
            begin
              while GlobalUnLock(FhDeviceMode) do;
              GlobalFree(FhDeviceMode);
              FDeviceMode := nil;
              FhDeviceMode := CopyData(AhDeviceMode);
              FDeviceMode := GlobalLock(FhDeviceMode);
            end;
          end
          else 
            if Printers.Count > 0 then GetPrinterIndex;
        end;
      finally
        if AhDeviceMode <> 0 then GlobalFree(AhDeviceMode);
      end;
    finally
      StrDispose(APort);
    end;
  finally
    StrDispose(ADevice);
  end;
  DoRefresh;
end;

function TdxPrintDevice.FindPrintDevice(ADevice, APort: PChar): Integer;
begin
  if Printers.Count > 0 then
    for Result := 0 to Printers.Count - 1 do
      if TdxPrintDeviceInfo(Printers.Objects[Result]).IsEqual(nil, ADevice, APort) then Exit;
  Result := -1;
end;

procedure TdxPrintDevice.OpenPrintDevice(AIndex: Integer);
const
  dmFields: UINT = DM_ORIENTATION or DM_PAPERSIZE or DM_PAPERLENGTH or
    DM_PAPERWIDTH or DM_SCALE or DM_COPIES or DM_DEFAULTSOURCE or DM_PRINTQUALITY or
    DM_COLOR or DM_DUPLEX or DM_YRESOLUTION or DM_TTOPTION or DM_COLLATE or
    DM_FORMNAME or DM_LOGPIXELS or DM_BITSPERPEL or DM_PELSWIDTH or DM_PELSHEIGHT;
var
  Stub: TDeviceMode;
  Buf: array [0..1000] of Integer;
  MemSize: Integer;
  SavehDeviceMode: THandle;
  SaveDeviceMode: PDeviceMode;
  SavePaperWidth, SavePaperHeight: Integer;

  procedure RestoreDeviceMode;
  begin
    SaveDeviceMode := GlobalLock(SavehDeviceMode);
    try
      with SaveDeviceMode^ do 
      begin
        Copies := dmCopies;
        Duplex := TdxDuplexMode(dmDuplex - 1);
        Orientation := TdxPrinterOrientation(dmOrientation - 1);
        if not SelectPaper(dmPaperSize) then
          SelectPaperBySizes(SavePaperWidth, SavePaperHeight);
        SelectBin(dmDefaultSource);
      end;
    finally
      GlobalUnLock(SavehDeviceMode);
    end;
  end;

begin
  if FPrinterIndex = AIndex then Exit;
  SavehDeviceMode := 0;
  if PersistentDeviceMode and (FhDeviceMode <> 0) then
  begin
    SavehDeviceMode := CopyData(FhDeviceMode);
    if (Papers <> nil) and (PaperIndex > -1) and (PaperIndex < Papers.Count) then
      with TdxPaperInfo(Papers.Objects[PaperIndex]) do
      begin
        SavePaperWidth := Width;
        SavePaperHeight := Height;
      end;
  end;
  try
    ClosePrintDevice;
    with TdxPrintDeviceInfo(Printers.Objects[AIndex]) do
    begin
      FCurrentDevice := StrNew(FDevice);
      FCurrentDriver := StrNew(FDriver);
      FCurrentPort := StrNew(FPort);
    end;
    if OpenPrinter(FCurrentDevice, FDeviceHandle, nil) then
    begin
      MemSize := DocumentProperties(Application.Handle, FDeviceHandle, FCurrentDevice, Stub, Stub, 0);
      if MemSize <= 0 then 
      begin
        ClosePrintDevice;      
        Exit;
      end;
      
      FhDeviceMode := GlobalAlloc(GHND, MemSize);
      if FhDeviceMode = 0 then 
      begin
        ClosePrintDevice;      
        Exit;
      end;
      
      FDeviceMode := GlobalLock(FhDeviceMode);
      FDeviceMode^.dmFields := dmFields;
      if DocumentProperties(0, FDeviceHandle, FCurrentDevice, FDeviceMode^, Stub, DM_OUT_BUFFER) <> IDOK then
      begin
        ClosePrintDevice;
        Exit;
      end;
      FPrinterIndex := AIndex;
      
      SetPrinterCapabilities(FDeviceMode^.dmFields);
      
      FMaxCopies := 
        WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, DC_COPIES, @Buf, nil);
      FMaxExtents := 
        WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, DC_MAXEXTENT, @Buf, nil);
      FMinExtents := 
        WinSpool.DeviceCapabilities(FCurrentDevice, FCurrentPort, DC_MINEXTENT, @Buf, nil);
        
      FixMinMaxExtents;
        
      if PersistentDeviceMode and (SavehDeviceMode <> 0) then
        RestoreDeviceMode;
      DoPrinterChange;
    end;
  finally
    if SavehDeviceMode <> 0 then GlobalFree(SavehDeviceMode);
  end;
end;

procedure TdxPrintDevice.ClosePrintDevice;
begin
  StrDispose(FCurrentDevice);
  FCurrentDevice := nil;
  StrDispose(FCurrentDriver);
  FCurrentDriver := nil;
  StrDispose(FCurrentPort);
  FCurrentPort := nil;
  FreeBins;
  FreePapers;
  FreeFonts;
  if FhDeviceMode <> 0 then
  begin
    while GlobalUnlock(FhDeviceMode) do;
    GlobalFree(FhDeviceMode);
    FhDeviceMode := 0;
    FDeviceMode := nil;
  end;
  if FDeviceHandle <> 0 then
  begin
    ClosePrinter(FDeviceHandle);
    FDeviceHandle := 0;
  end;
  SetState(psNoHandle);
  FreeCanvas;
  FPrinterIndex := -MaxInt;
end;

procedure TdxPrintDevice.ResetPrintDevice;
var
  Index: Integer;
begin
  Index := PrinterIndex;
  ClosePrintDevice;
  OpenPrintDevice(Index);
end;

procedure TdxPrintDevice.ResetDC(IsForced: Boolean);
var
  ACanvas: TCanvas;
  ABrushBitmap: TBitmap;

  procedure SaveCanvas;
  begin
    ACanvas := TdxPrintDeviceCanvas.Create(Self);
    with ACanvas do
    begin
      OnChanging := Canvas.OnChanging;
      OnChange := Canvas.OnChange;
      Canvas.OnChanging := nil;
      Canvas.OnChange := nil;

      Brush := Canvas.Brush;
      ABrushBitmap := nil;
      if Brush.Bitmap <> nil then ABrushBitmap := Brush.Bitmap;
      Font := Canvas.Font;
      Pen := Canvas.Pen;
      PenPos := Canvas.PenPos;
      CopyMode := Canvas.CopyMode;
    end;
  end;

  procedure RestoreCanvas;
  begin
    with Canvas do
    begin
      Brush := ACanvas.Brush;
      if ABrushBitmap <> nil then Brush.Bitmap := ABrushBitmap;
      Font := ACanvas.Font;
      Pen := ACanvas.Pen;
      PenPos := ACanvas.PenPos;
      CopyMode := ACanvas.CopyMode;
      OnChanging := ACanvas.OnChanging;
      OnChange := ACanvas.OnChange;
    end;
    ACanvas.Free;
  end;

begin
  if IsDeviceModeChanged or IsForced then
  begin
    FDeviceModeChanged := False;
    SaveCanvas;
    try
      if FDeviceMode <> nil then Windows.ResetDC(FDC, FDeviceMode^);
    finally
      RestoreCanvas;
    end;
  end;
end;

function TdxPrintDevice.GetDeviceMode: PDeviceMode;
begin
  if Printers.Count > 0 then
  begin
    GetPrinterIndex;
    Result := FDeviceMode;
  end
  else
    Result := nil;
end;

function TdxPrintDevice.GethDeviceMode: THandle;
begin
  if Printers.Count > 0 then
  begin
    GetPrinterIndex;
    Result := FhDeviceMode;
  end
  else
    Result := 0;
end;

initialization           
{$IFDEF DEBUG_PRINTDEVICE}
  AssignFile(FLogFile, 'PrinterLog.txt');
  Rewrite(FLogFile);
{$ENDIF}
 
finalization
  if FPrintDevice <> nil then FPrintDevice.Free;
  FPrintDevice := nil;

{$IFDEF DEBUG_PRINTDEVICE}
  CloseFile(FLogFile);
{$ENDIF}  
  
end.

