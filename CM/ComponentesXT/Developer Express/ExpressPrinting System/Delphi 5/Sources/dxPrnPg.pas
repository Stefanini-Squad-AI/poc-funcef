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

unit dxPrnPg;

interface

{$I dxPSVer.inc}

uses
  Classes, SysUtils, Windows, Controls, Graphics, Dialogs, CommDlg, Messages,
  dxBase, dxPSGlbl, dxPSUtl, dxWrap, dxPrnDev, dxBkgnd;
  
type
  TdxHFPageType = (ptHeader, ptFooter);
  TdxMeasurementUnits = (muDefault, muInches, muMillimeters);
  TdxPageTitlePart = (tpLeft, tpCenter, tpRight);
  TdxPageTitleParts = set of TdxPageTitlePart;
  TdxScaleMode = (smAdjust, smFit);
  TdxMarginType = (mtLeft, mtTop, mtRight, mtBottom, mtHeader, mtFooter);
  TdxMarginTypes = set of TdxMarginType;
  TdxPrinterPageUpdateCode = 
    (ucMarginLeft, ucMarginTop, ucMarginRight, ucMarginBottom, ucMarginHeader, 
     ucMarginFooter, ucScale);
  TdxPrinterPageUpdateCodes = set of TdxPrinterPageUpdateCode;
  
const
  mtAll: TdxMarginTypes = 
    [mtLeft, mtTop, mtRight, mtBottom, mtHeader, mtFooter];
  ucAll: TdxPrinterPageUpdateCodes = 
    [ucMarginLeft, ucMarginTop, ucMarginRight, ucMarginBottom, ucMarginHeader, 
     ucMarginFooter, ucScale];
  ucMargins: TdxPrinterPageUpdateCodes =     
    [ucMarginLeft, ucMarginTop, ucMarginRight, ucMarginBottom, ucMarginHeader, 
     ucMarginFooter];

  dxDefaultDMPaper = Windows.DMPAPER_FIRST;  
  dxDefaultPaperSource = Windows.DMBIN_AUTO;
  dxDefaultHFFont = 'Tahoma';
    
type  
  TdxPrinterPage = class;
  TdxPrinterPageObject = class;
  
  TdxPrinterPageObject = class(TdxBaseObject)
  private
    FBackground: TdxBackground;
    FPage: TdxPrinterPage;
    procedure SetBackground(Value: TdxBackground);
  protected
    procedure AssignInternal(Source: TPersistent); override;
    procedure Changed; dynamic;
    procedure LockUpdate(ALockState: TdxLockState); override;
    
    property Background: TdxBackground read FBackground write SetBackground;
    property Page: TdxPrinterPage read FPage;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TdxPageObjectClass = class of TdxPrinterPageObject;

  
  TCustomdxPageObject = class(TdxPrinterPageObject)
  private
    FFont: TFont;
    FTextAlignY: array[TdxPageTitlePart] of TdxTextAlignY;
    FTitles: array[TdxPageTitlePart] of TStrings;

    function GetPartialTextAlignY(Index: Integer): TdxTextAlignY;    
    function GetPartialTitle(Index: Integer): TStrings;
    function GetTitle(Index: TdxPageTitlePart): TStrings;
    function GetTextAlignY(Index: TdxPageTitlePart): TdxTextAlignY;
    procedure SetPartialTextAlignY(Index: Integer; Value: TdxTextAlignY);
    procedure SetPartialTitle(Index: Integer; Value: TStrings);
    procedure SetTextAlignY(Index: TdxPageTitlePart; Value: TdxTextAlignY);
    procedure SetTitle(Index: TdxPageTitlePart; Value: TStrings);
    procedure SetFont(Value: TFont);

    procedure FontChange(Sender: TObject);
    procedure TitleChange(Sender: TObject);
  protected
    procedure AssignInternal(Source: TPersistent); override;
  public
    constructor Create; override;
    destructor Destroy; override;

    property CenterTextAlignY: TdxTextAlignY Index 0 read GetPartialTextAlignY write SetPartialTextAlignY
      default taCenterY;
    property CenterTitle: TStrings Index 1 read GetPartialTitle write SetPartialTitle;
    property Font: TFont read FFont write SetFont;
    property LeftTextAlignY: TdxTextAlignY Index 0 read GetPartialTextAlignY write SetPartialTextAlignY
      default taCenterY;
    property LeftTitle: TStrings Index 0 read GetPartialTitle write SetPartialTitle;
    property Page;
    property RightTextAlignY: TdxTextAlignY Index 2 read GetPartialTextAlignY write SetPartialTextAlignY
      default taCenterY;
    property RightTitle: TStrings Index 2 read GetPartialTitle write SetPartialTitle;
    property TextAlignY[Index: TdxPageTitlePart]: TdxTextAlignY read GetTextAlignY
      write SetTextAlignY;
    property Titles[Index: TdxPageTitlePart]: TStrings read GetTitle write SetTitle;
  published
    property Background;
  end;

  TdxPageHeader = class(TCustomdxPageObject)
  public
    property Titles; default;
  published
    property CenterTextAlignY;
    property CenterTitle;
    property Font;
    property LeftTextAlignY;
    property LeftTitle;
    property RightTextAlignY;
    property RightTitle;
  end;

  TdxPageFooter = class(TCustomdxPageObject)
  public
    property Titles; default;
  published
    property CenterTextAlignY;
    property CenterTitle;
    property Font;
    property LeftTextAlignY;
    property LeftTitle;
    property RightTextAlignY;
    property RightTitle;
  end;


  TdxPrinterPage = class(TdxPrinterPageObject)
  private
    FCenterOnPageH: Boolean;
    FCenterOnPageV: Boolean;
    FDMPaper: Integer;
    FFitToPagesByTall: Integer;
    FFitToPagesByWide: Integer;
    FGrayShading: Boolean;
    FHFG: TdxRectWrapper;
    FLastMU: TdxMeasurementUnits;
    FMargins: TdxRectWrapper;
    FMeasurementUnits: TdxMeasurementUnits;
    FMinMargins: TdxRectWrapper;
    FOrientation: TdxPrinterOrientation;
    FPageFooter: TdxPageFooter;
    FPageHeader: TdxPageHeader;
    FPageOrder: TdxPageOrder;
    FPageSize: TdxPointWrapper;
    FPaperSource: Integer;
    FReverseTitlesOnEvenPages: Boolean;
    FScaleFactor: Integer;
    FScaleMode: TdxScaleMode;

    FOnChange: TNotifyEvent;
    FOnMarginChange: TNotifyEvent;
    
    FAssigning: Boolean;
    FPageSizeLocked: Boolean;    
    
    function GetHFG(index: Integer): Integer;
    function GetRealMeasurementUnits: TdxMeasurementUnits;
    function GetRealPageSize: TPoint;    
    procedure SetDMPaper(Value: Integer);
    procedure SetFitToPagesByTall(Value: Integer);
    procedure SetFitToPagesByWide(Value: Integer);
    procedure SetHFG(index: Integer; Value: Integer);
    procedure SetMargins(Value: TdxRectWrapper);
    procedure SetMeasurementUnits(Value: TdxMeasurementUnits);
    procedure SetMinMargins(Value: TdxRectWrapper);
    procedure SetOrientation(Value: TdxPrinterOrientation);
    procedure SetPageHeader(Value: TdxPageHeader);
    procedure SetPageFooter(Value: TdxPageFooter);
    procedure SetPageSize(Value: TdxPointWrapper);
    procedure SetPaperSource(Value: Integer);
    procedure SetRealPageSize(const Value: TPoint);
    procedure SetScaleFactor(Value: Integer);

    procedure HFGChanging(Sender: TObject; ASides: TdxRectSides; 
      var Values: array of Integer);
    procedure HFGChanged(Sender: TObject; ASides: TdxRectSides);
    procedure LockUpdated(Sender: TdxBaseObject; ALockState: TdxLockState);
    procedure MarginsChanged(Sender: TObject; ASides: TdxRectSides);
    procedure MarginsChanging(Sender: TObject; ASides: TdxRectSides;  
      var Values: array of Integer);
    procedure MinMarginsChanged(Sender: TObject; ASides: TdxRectSides);
    procedure MinMarginsChanging(Sender: TObject; ASides: TdxRectSides; 
      var Values: array of Integer);
    procedure PageSizeChanging(Sender: TObject; ACoords: TdxPointCoords; 
      var Values: array of Integer);
    procedure PageSizeChanged(Sender: TObject; ACoords: TdxPointCoords);
    procedure ReadLastMU(Reader: TReader);
    procedure ReadMU(Reader: TReader);
    procedure WriteLastMU(Writer: TWriter);
    procedure WriteMU(Writer: TWriter);

    function CanSwapMargins: Boolean;
    constructor CreateInstance(Dummy: Integer{$IFDEF DELPHI4} = 0{$ENDIF});
    procedure FindDMPaperByPageSize;
    procedure FixMinMargins;
    procedure FixMargins;
    function IsLoading: Boolean;
    function RestPageSizeX: Integer;
    function RestPageSizeY: Integer;
    procedure SetPaperSizeByDMPaper;
    procedure SwapMargins;
  protected
    procedure DefineProperties(Filer: TFiler); override;

    procedure AssignInternal(Source: TPersistent); override;
    procedure Changed; override;
    procedure MarginChange; dynamic;
    procedure PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes); virtual;
    
    procedure ReadPrinterInfos;
    procedure UpdateMeasurementUnits;
  public
    constructor Create; override;
    destructor Destroy; override;
    function GetNamePath: string; override;
    
    procedure ApplyToPrintDevice;
    procedure FixMarginsOutside;
    function GetInnerMeasurementUnits: TdxMeasurementUnits; 
    procedure GetRealMinMargins(var AMinLeft, AMinRight, AMinTop, AMinBottom: Integer);
    function IsEqual(ABaseObject: TdxBaseObject): Boolean; override;
    procedure RestoreDefaults;

    procedure MapRect2LoMetric(var R: TRect);
    function FooterLoMetric: Integer;
    function FooterRect: TRect;
    function FooterRectLoMetric: TRect;
    function HeaderLoMetric: Integer;
    function HeaderRect: TRect;
    function HeaderRectLoMetric: TRect;
    function MarginsLoMetric: TRect;
    function MinMarginsLoMetric: TRect;
    function MinPrintableArea: Integer;
    function MinPrintableAreaLoMetric: Integer;
    function PageSizeLoMetric: TPoint;
    function PageSizePixels: TPoint;
    function PaintRectLoMetric: TRect;
    function PaintRectPixels: TRect;
    function RealPageSizeLoMetric: TPoint;
    function RealPageSizePixels: TPoint;
    function ValidateMargins: Boolean;
    
    property RealMeasurementUnits: TdxMeasurementUnits read GetRealMeasurementUnits;
    property RealPageSize: TPoint read GetRealPageSize write SetRealPageSize;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnMarginChange: TNotifyEvent read FOnMarginChange write FOnMarginChange;
  published
    property Background;
    property CenterOnPageH: Boolean read FCenterOnPageH write FCenterOnPageH
      default False;
    property CenterOnPageV: Boolean read FCenterOnPageV write FCenterOnPageV
      default False;
    property DMPaper: Integer read FDMPaper write SetDMPaper
      default dxDefaultDMPaper; {DMPAPER_FIRST = DMPAPER_LETTER}
    property FitToPagesByTall: Integer read FFitToPagesByTall write SetFitToPagesByTall
      default 1;
    property FitToPagesByWide: Integer read FFitToPagesByWide write SetFitToPagesByWide
      default 1;
    property Footer: Integer index 3 read GetHFG write SetHFG
      default 0;
    property GrayShading: Boolean read FGrayShading write FGrayShading
      default False;
    property Header: Integer index 1 read GetHFG write SetHFG
      default 0;
    property Margins: TdxRectWrapper read FMargins write SetMargins;
    property MeasurementUnits: TdxMeasurementUnits read FMeasurementUnits
      write SetMeasurementUnits stored False default muDefault;
    property MinMargins: TdxRectWrapper read FMinMargins write SetMinMargins;
    property Orientation: TdxPrinterOrientation read FOrientation write SetOrientation
      default poPortrait;
    property PageFooter: TdxPageFooter read FPageFooter write SetPageFooter;
    property PageHeader: TdxPageHeader read FPageHeader write SetPageHeader;
    property PageOrder: TdxPageOrder read FPageOrder write FPageOrder
      default poOverThenDown;
    property PageSize: TdxPointWrapper read FPageSize write SetPageSize;
    property PaperSource: Integer read FPaperSource write SetPaperSource
      default dxDefaultPaperSource; {DMBIN_AUTO = 7}
    property ReverseTitlesOnEvenPages: Boolean read FReverseTitlesOnEvenPages
      write FReverseTitlesOnEvenPages default False;
    property ScaleFactor: Integer read FScaleFactor write SetScaleFactor
      default 100;
    property ScaleMode: TdxScaleMode read FScaleMode write FScaleMode
      default smAdjust;
  end;

function DefaultPrinterPage: TdxPrinterPage;
function GetDefaultMeasurementUnits: TdxMeasurementUnits;
procedure RereadDefaultPrinterPage;

implementation

uses
  Forms,
  dxPPAttr;

const
  dxMinScaleFactor = 10;
  dxMaxScaleFactor = 500;

var
  FDefaultPrinterPage: TdxPrinterPage = nil;

function DefaultPrinterPage: TdxPrinterPage;
begin
  if FDefaultPrinterPage = nil then 
    FDefaultPrinterPage := TdxPrinterPage.CreateInstance(0);
  Result := FDefaultPrinterPage;
end;

procedure RereadDefaultPrinterPage;
begin
  DefaultPrinterPage.ReadPrinterInfos;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM OFF}   
  {$ENDIF}
{$ENDIF}

function GetDefaultMeasurementUnits: TdxMeasurementUnits;
begin
  if GetLocaleChar(LOCALE_USER_DEFAULT, LOCALE_IMEASURE, '0') = '0' then
    Result := muMillimeters
  else
    Result := muInches;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM ON}    
  {$ENDIF}
{$ENDIF}

function MMToInch(Value: Integer): Integer;
begin
  Result := MulDiv(Value, 10, 254);
end;

function InchToMM(Value: Integer): Integer;
begin
  Result := MulDiv(Value, 254, 10);
end;

function Pt_MMToInch(const Value: TPoint): TPoint;
begin
  Result.X := MMToInch(Value.X);
  Result.Y := MMToInch(Value.Y);
end;

function Pt_InchToMM(const Value: TPoint): TPoint;
begin
  Result.X := InchToMM(Value.X);
  Result.Y := InchToMM(Value.Y);
end;

function Rect_MMToInch(const Value: TRect): TRect;
begin
  Result.Left := MMToInch(Value.Left);
  Result.Right := MMToInch(Value.Right);
  Result.Bottom := MMToInch(Value.Bottom);
  Result.Top := MMToInch(Value.Top);
end;

function Rect_InchToMM(const Value: TRect): TRect;
begin
  Result.Left := InchToMM(Value.Left);
  Result.Top := InchToMM(Value.Top);
  Result.Right := InchToMM(Value.Right);
  Result.Bottom := InchToMM(Value.Bottom);
end;

procedure GetDefaultPageInfo(var AMinMargins, AMargins: TRect; 
  var AHeader, AFooter: Integer; var APageSize: TPoint; var ADMPaper: Integer; 
  var AOrientation: TdxPrinterOrientation);
var
  Ind: Integer;
begin
  AMinMargins := Rect(0, 0, 0, 0);
  AOrientation := poPortrait;
  ADMPaper := dxDefaultDMPaper;
  Ind := Papers.FindByDMPaper(ADMPaper);
  if Ind = -1 then 
  begin
    ADMPaper := DMPAPER_LETTER;
    Ind := Papers.FindByDMPaper(ADMPaper);
  end;  
  case GetDefaultMeasurementUnits of
    muMillimeters:
      begin
        AMargins := dxDefaultInitialMargins;
        AHeader := dxDefaultInitialHeader;
        AFooter := dxDefaultInitialFooter;        
        APageSize := Point(Papers[Ind].Size.cX * 100, Papers[Ind].Size.cY * 100);
      end;
    muInches:
      begin
        AMargins := Rect_MMToInch(dxDefaultInitialMargins);
        AHeader := MMToInch(dxDefaultInitialHeader);
        AFooter := MMToInch(dxDefaultInitialFooter);
        APageSize := 
          Point(MulDiv(Papers[Ind].Size.cX, 1000, 254), MulDiv(Papers[Ind].Size.cY, 1000, 254));
      end;
  end;
end;

type
  TdxPageBackground = class(TdxBackground)
  private
    FPageObject: TdxPrinterPageObject;
  protected
    procedure DoChange(AChangeWhats: TdxBackgroundParams); override;
  public
    property PageObject: TdxPrinterPageObject read FPageObject;
  end;

procedure TdxPageBackground.DoChange(AChangeWhats: TdxBackgroundParams);
begin
  inherited DoChange(AChangeWhats);
  if Assigned(FPageObject) then FPageObject.Changed;
end;


{ TdxPrinterPageObject }

constructor TdxPrinterPageObject.Create;
begin
  inherited Create;
  FBackground := TdxPageBackground.Create;
  TdxPageBackground(FBackground).FPageObject := Self;
end;

destructor TdxPrinterPageObject.Destroy;
begin
  FBackground.Free;
  inherited Destroy;
end;

procedure TdxPrinterPageObject.AssignInternal(Source: TPersistent);
begin
  inherited AssignInternal(Source);
  FBackground.Assign(TdxPrinterPageObject(Source).FBackground);
end;

procedure TdxPrinterPageObject.LockUpdate(ALockState: TdxLockState);
begin
  inherited LockUpdate(ALockState);
  if ALockState = lsUnLock then Changed;
end;

procedure TdxPrinterPageObject.SetBackground(Value: TdxBackground);
begin
  FBackground.Assign(Value);
end;

procedure TdxPrinterPageObject.Changed;
begin
  if (UpdateCount = 0) and (Page <> nil) then 
    Page.Changed;
end;


{ TCustomdxPageObject }

constructor TCustomdxPageObject.Create;
var
  I: TdxPageTitlePart;
begin
  inherited Create;
  for I := Low(TdxPageTitlePart) to High(TdxPageTitlePart) do
  begin
    FTitles[I] := TStringList.Create;
    TStringList(FTitles[I]).OnChange := TitleChange;
    FTextAlignY[I] := taCenterY;
  end;
  FFont := TFont.Create;
  FFont.Name := dxDefaultHFFont;{'Tahoma'}
  FFont.OnChange := FontChange;
end;

destructor TCustomdxPageObject.Destroy;
var
  I: TdxPageTitlePart;
begin
  for I := Low(TdxPageTitlePart) to High(TdxPageTitlePart) do
    FTitles[I].Free;
  FFont.Free;
  inherited Destroy;
end;

procedure TCustomdxPageObject.AssignInternal(Source: TPersistent);
var
  I: TdxPageTitlePart;
begin
  inherited AssignInternal(Source);
  for I := Low(TdxPageTitlePart) to High(TdxPageTitlePart) do
  begin
    Titles[I] := TCustomdxPageObject(Source).Titles[I];
    FTextAlignY[I] := TCustomdxPageObject(Source).FTextAlignY[I];
  end;
  Font := TCustomdxPageObject(Source).Font;
end;          

function TCustomdxPageObject.GetPartialTextAlignY(Index: Integer): TdxTextAlignY;    
begin
  Result := TextAlignY[TdxPageTitlePart(Index)]
end;

procedure TCustomdxPageObject.SetPartialTextAlignY(Index: Integer; Value: TdxTextAlignY);
begin
  TextAlignY[TdxPageTitlePart(Index)] := Value;
end;

function TCustomdxPageObject.GetPartialTitle(Index: Integer): TStrings;
begin
  Result := Titles[TdxPageTitlePart(Index)]
end;

procedure TCustomdxPageObject.SetPartialTitle(Index: Integer; Value: TStrings);
begin
  Titles[TdxPageTitlePart(Index)] := Value;
end;

function TCustomdxPageObject.GetTitle(Index: TdxPageTitlePart): TStrings;
begin
  Result := FTitles[Index]
end;

procedure TCustomdxPageObject.SetTitle(Index: TdxPageTitlePart; Value: TStrings);
begin
  FTitles[Index].Assign(Value);
end;

function TCustomdxPageObject.GetTextAlignY(Index: TdxPageTitlePart): TdxTextAlignY;
begin
  Result := FTextAlignY[Index]
end;

procedure TCustomdxPageObject.SetTextAlignY(Index: TdxPageTitlePart; Value: TdxTextAlignY);
begin
  if FTextAlignY[Index] <> Value then
  begin
    FTextAlignY[Index] := Value;
    Changed;
  end;
end;

procedure TCustomdxPageObject.SetFont(Value: TFont);
begin
  if (FFont <> Value) then FFont.Assign(Value);
end;

procedure TCustomdxPageObject.FontChange(Sender: TObject);
begin
  Changed;
end;

procedure TCustomdxPageObject.TitleChange(Sender: TObject);
begin
  Changed;
end;


{ TdxPrinterPage }

constructor TdxPrinterPage.CreateInstance(Dummy: Integer{$IFDEF DELPHI4} = 0{$ENDIF});
begin
  inherited Create;
  FPage := Self;
  FCenterOnPageH := False;
  FCenterOnPageV := False;
  FMeasurementUnits := muDefault;
  FLastMU := GetInnerMeasurementUnits;
  FMargins := TdxRectWrapper.Create(0, 0, 0, 0);
  FMinMargins := TdxRectWrapper.Create(0, 0, 0, 0);
  FOrientation := poPortrait;
  FPageSize := TdxPointWrapper.Create(0, 0);
  FHFG := TdxRectWrapper.Create(0, 0, 0, 0);
  DMPaper := dxDefaultDMPaper;
  FFitToPagesByTall := 1;
  FFitToPagesByWide := 1;
  FGrayShading := False;
  FReverseTitlesOnEvenPages := False;
  FPageOrder := poOverThenDown;
  FPageHeader := TdxPageHeader.Create;
  FPageHeader.FPage := Self;
  FPageFooter := TdxPageFooter.Create;
  FPageFooter.FPage := Self;
  FPaperSource := dxDefaultPaperSource;{Windows.DMBIN_AUTO}
  FScaleFactor := 100;
  FScaleMode := smAdjust;
end;

constructor TdxPrinterPage.Create;
begin
  CreateInstance(0);
  if not Assigned(FDefaultPrinterPage) then
    RereadDefaultPrinterPage;
  RestoreDefaults;
  OnLockUpdate := LockUpdated;
  FMargins.OnChanged := MarginsChanged;
  FMargins.OnChanging := MarginsChanging;
  FHFG.OnChanging := HFGChanging;
  FHFG.OnChanged := HFGChanged;
  FMinMargins.OnChanging := MinMarginsChanging;
  FMinMargins.OnChanged := MinMarginsChanged;
  FPageSize.OnChanging := PageSizeChanging;
  FPageSize.OnChanged := PageSizeChanged;
end;

destructor TdxPrinterPage.Destroy;
begin
  FMargins.Free;
  FMinMargins.Free;
  FHFG.Free;
  FPageSize.Free;
  FPageHeader.Free;
  FPageFooter.Free;
  inherited Destroy;
end;

function TdxPrinterPage.CanSwapMargins: Boolean;
begin
  Result := not IsLoading and not FAssigning;
end;

function TdxPrinterPage.IsLoading: Boolean;
var
  AOwner: TPersistent;
begin
  AOwner := GetOwner;
  Result := (AOwner <> nil) and (AOwner is TComponent) and 
    (csLoading in TComponent(AOwner).ComponentState);
end;

procedure TdxPrinterPage.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('_dxMeasurementUnits_', ReadMU, WriteMU, True);
  Filer.DefineProperty('_dxLastMU_', ReadLastMU, WriteLastMU, True);
  if (Filer is TReader) then UpdateMeasurementUnits;
end;

procedure TdxPrinterPage.ReadMU(Reader: TReader);
begin
  FMeasurementUnits := TdxMeasurementUnits(Reader.ReadInteger);
end;

procedure TdxPrinterPage.WriteMU(Writer: TWriter);
begin
  Writer.WriteInteger(Integer(FMeasurementUnits));
end;

procedure TdxPrinterPage.ReadLastMU(Reader: TReader);
begin
  FLastMU := TdxMeasurementUnits(Reader.ReadInteger);
end;

procedure TdxPrinterPage.WriteLastMU(Writer: TWriter);
begin
  Writer.WriteInteger(Integer(FLastMU));
end;

function TdxPrinterPage.IsEqual(ABaseObject: TdxBaseObject): Boolean;
begin
  Result := inherited IsEqual(ABaseObject) and
    FBackground.IsEqual(TdxPrinterPage(ABaseObject).Background) and
    (CenterOnPageH = TdxPrinterPage(ABaseObject).CenterOnPageH) and
    (CenterOnPageV = TdxPrinterPage(ABaseObject).CenterOnPageV) and
    (PageOrder = TdxPrinterPage(ABaseObject).PageOrder) and
    (GrayShading = TdxPrinterPage(ABaseObject).GrayShading) and
    (ScaleFactor = TdxPrinterPage(ABaseObject).ScaleFactor) and
    (ReverseTitlesOnEvenPages = TdxPrinterPage(ABaseObject).ReverseTitlesOnEvenPages) and
    FMargins.IsEqual(TdxPrinterPage(ABaseObject).Margins.Rect) and
    FMinMargins.IsEqual(TdxPrinterPage(ABaseObject).MinMargins.Rect) and
    PageSize.IsEqual(TdxPrinterPage(ABaseObject).PageSize.Point) and
    (MeasurementUnits = TdxPrinterPage(ABaseObject).MeasurementUnits) and
    (Orientation = TdxPrinterPage(ABaseObject).Orientation) and
    (DMPaper = TdxPrinterPage(ABaseObject).DMPaper) and
    (PaperSource = TdxPrinterPage(ABaseObject).PaperSource) and 
    PageHeader.IsEqual(TdxPrinterPage(ABaseObject).PageHeader) and
    PageFooter.IsEqual(TdxPrinterPage(ABaseObject).PageFooter) and
    FHFG.IsEqual(TdxPrinterPage(ABaseObject).FHFG.Rect);
end;

procedure TdxPrinterPage.AssignInternal(Source: TPersistent);
var
  Src: TdxPrinterPage absolute Source;
begin
  FAssigning := True;
  try
    Background := Src.Background;
    CenterOnPageH := Src.CenterOnPageH;
    CenterOnPageV := Src.CenterOnPageV;
    DMPaper := Src.DMPaper;
    GrayShading := Src.GrayShading;
    MeasurementUnits := Src.MeasurementUnits;
    MinMargins.Rect := Src.MinMargins.Rect;
    Margins := Src.Margins;
    Header := Src.Header;
    Footer := Src.Footer;
    if (DMPaper >= DMPAPER_USER) then PageSize := Src.PageSize;
    Orientation := Src.Orientation;
    PageHeader := Src.PageHeader;
    PageFooter := Src.PageFooter;
    PageOrder := Src.PageOrder;
    PaperSource :=  Src.PaperSource;
    ReverseTitlesOnEvenPages := Src.ReverseTitlesOnEvenPages;
    ScaleMode := Src.ScaleMode;
    if (ScaleMode = smAdjust) then
    begin
      FitToPagesByWide := Src.FitToPagesByWide;
      FitToPagesByTall := Src.FitToPagesByTall;
      ScaleFactor := Src.ScaleFactor;
    end
    else
    begin
      ScaleFactor := Src.ScaleFactor;
      FitToPagesByWide := Src.FitToPagesByWide;
      FitToPagesByTall := Src.FitToPagesByTall;
    end;
  finally
    FAssigning := False;
  end;  
end;

function TdxPrinterPage.GetNamePath: string;
begin
  Result := ClassName;
end;

procedure TdxPrinterPage.RestoreDefaults;
begin
  if (Self <> FDefaultPrinterPage) and (FDefaultPrinterPage <> nil) then
    Assign(DefaultPrinterPage);
end;

procedure TdxPrinterPage.UpdateMeasurementUnits;
var
  MU: TdxMeasurementUnits;
begin
  MU := GetDefaultMeasurementUnits;
  if (MeasurementUnits = muDefault) and (MU <> FLastMU) then
  begin
    FLastMU := MU;
    BeginUpdate;
    try
      case MU of
        muMillimeters:
          begin
            PageSize.Point := Pt_InchToMM(PageSize.Point);
            MinMargins.Rect := Rect_InchToMM(MinMargins.Rect);
            Header := InchToMM(Header);
            Footer := InchToMM(Footer);
            Margins.Rect := Rect_InchToMM(Margins.Rect);
          end;

        muInches:
          begin
            PageSize.Point := Pt_MMToInch(PageSize.Point);
            MinMargins.Rect := Rect_MMToInch(MinMargins.Rect);
            Header := MMToInch(Header);
            Footer := MMToInch(Footer);
            Margins.Rect := Rect_MMToInch(Margins.Rect);
          end;
      end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TdxPrinterPage.ReadPrinterInfos;
var
  AMinMargins: TRect;
  AMargins: TRect;
  APageSize: TPoint;
  AHeader, AFooter: Integer;
  ADMPaper: Integer;
  AOrientation: TdxPrinterOrientation;
begin
  GetDefaultPageInfo(AMinMargins, AMargins, AHeader, AFooter, APageSize, ADMPaper, AOrientation);
  FMinMargins.Rect := AMinMargins;
  FMargins.Rect := AMargins;
  FHFG.Top := AHeader;
  FHFG.Bottom := AFooter;
  FPageSize.Point := APageSize;
  FDMPaper := ADMPaper;
  FOrientation := AOrientation;
end;

function TdxPrinterPage.MinPrintableArea: Integer;
begin
  Result := dxDefaultMinPrintableArea;
  case GetInnerMeasurementUnits of
    muInches:
      Result := MMToInch(Result);
  end;
end;

function TdxPrinterPage.MinPrintableAreaLoMetric: Integer;
begin
  Result := MulDiv(dxDefaultMinPrintableArea, 1, 100);
end;

procedure TdxPrinterPage.MinMarginsChanging(Sender: TObject; ASides: TdxRectSides;
  var Values: array of Integer);
begin
  if IsLoading or (UpdateCount <> 0) then Exit;
  if rsLeft in ASides then       
    Values[0] := MinMax(Values[0], 0, RestPageSizeX - MinMargins.Right);
  if rsTop in ASides then             
    Values[1] := MinMax(Values[1], 0, RestPageSizeY - MinMargins.Bottom);
  if rsRight in ASides then             
    Values[2] := MinMax(Values[2], 0, RestPageSizeX - MinMargins.Left);
  if rsBottom in ASides then               
    Values[3] := MinMax(Values[3], 0, RestPageSizeY - MinMargins.Top);
end;

procedure TdxPrinterPage.MinMarginsChanged(Sender: TObject; ASides: TdxRectSides);
begin
  if IsLoading or (UpdateCount <> 0) then Exit;
  if rsLeft in ASides then 
  begin
    FMargins.Left := 
      MinMax(FMargins.Left, FMinMargins.Left, RestPageSizeX);
    FMargins.Right := 
      MinMax(FMargins.Right, FMinMargins.Right, RestPageSizeX - FMargins.Left);
  end;
  if rsTop in ASides then   
  begin
    Header := 
      MinMax(Header, FMinMargins.Top, RestPageSizeY);
    Footer := 
      MinMax(Footer, FMinMargins.Bottom, RestPageSizeY - Header);
    FMargins.Top := 
      MinMax(FMargins.Top, Header, RestPageSizeY - Footer);
    FMargins.Bottom := 
      MinMax(FMargins.Bottom, Footer, RestPageSizeY - Header);
  end;
  if rsRight in ASides then   
  begin
    FMargins.Right := 
      MinMax(FMargins.Right, FMinMargins.Right, RestPageSizeX);
    FMargins.Left := 
      MinMax(FMargins.Left, FMinMargins.Left, RestPageSizeX - FMargins.Right);
  end;
  if rsBottom in ASides then     
  begin
    Footer := 
      MinMax(Footer, FMinMargins.Bottom, RestPageSizeY);
    Header := 
      MinMax(Header, FMinMargins.Top, RestPageSizeY - Footer);
    FMargins.Bottom := 
      MinMax(FMargins.Bottom, Footer, RestPageSizeY - Header);
    FMargins.Top := 
      MinMax(FMargins.Bottom, Header, RestPageSizeY - Footer);
  end;
end;

procedure TdxPrinterPage.LockUpdated(Sender: TdxBaseObject; ALockState: TdxLockState);
begin
  if ALockState = lsUnlock then PageParamsChange(ucAll);
end;

procedure TdxPrinterPage.PageParamsChange(AUpdateCodes: TdxPrinterPageUpdateCodes);
begin
  if (UpdateCount = 0) and (ucMargins * AUpdateCodes <> []) then 
    MarginChange;
end;

procedure TdxPrinterPage.MarginChange;
begin
  if Assigned(FOnMarginChange) then FOnMarginChange(Self);
end;

procedure TdxPrinterPage.MarginsChanged(Sender: TObject; ASides: TdxRectSides);
begin
  if IsLoading or (UpdateCount <> 0) then Exit;
  PageParamsChange(TdxPrinterPageUpdateCodes(ASides));
end;

procedure TdxPrinterPage.MarginsChanging(Sender: TObject; ASides: TdxRectSides;
  var Values: array of Integer);
begin
  if IsLoading or (UpdateCount <> 0) then Exit;
  if rsLeft in ASides then 
    Values[0] := MinMax(Values[0], FMinMargins.Left, RestPageSizeX - Margins.Right);  
  if rsTop in ASides then 
    Values[1] := MinMax(Values[1], Header, RestPageSizeY - Margins.Bottom);       
  if rsRight in ASides then 
    Values[2] := MinMax(Values[2], FMinMargins.Right, RestPageSizeX - Margins.Left);      
  if rsBottom in ASides then 
    Values[3] := MinMax(Values[3], Footer, RestPageSizeY - Margins.Top);
end;

procedure TdxPrinterPage.PageSizeChanging(Sender: TObject; ACoords: TdxPointCoords;
  var Values: array of Integer);
begin
  if IsLoading then Exit;
  if pcX in ACoords then 
    Values[0] := Max(Values[0], MinPrintableArea);
  if pcY in ACoords then 
    Values[1] := Max(Values[1], MinPrintableArea);
end;

procedure TdxPrinterPage.PageSizeChanged(Sender: TObject; ACoords: TdxPointCoords);
begin
  if IsLoading or (UpdateCount <> 0) then Exit;  
  BeginUpdate;
  try
    FixMinMargins;
    FixMargins;
    if not FPageSizeLocked then FindDMPaperByPageSize;;
  finally
    EndUpdate;
  end;
end;

procedure TdxPrinterPage.SetFitToPagesByTall(Value: Integer);
var
  ScaleChanged: Boolean;
begin
  ScaleChanged := FFitToPagesByTall <> Value;
  FFitToPagesByTall := Value;
  ScaleMode := smFit;
  if ScaleChanged then PageParamsChange([ucScale]);
end;

procedure TdxPrinterPage.SetFitToPagesByWide(Value: Integer);
var
  ScaleChanged: Boolean;
begin
  ScaleChanged := FFitToPagesByWide <> Value;
  FFitToPagesByWide := Value;  
  ScaleMode := smFit;
  if ScaleChanged then PageParamsChange([ucScale]);
end;

procedure TdxPrinterPage.SetScaleFactor(Value: Integer);
var
  ScaleChanged: Boolean;
begin
  if Value < dxMinScaleFactor then Value := dxMinScaleFactor;
  if Value > dxMaxScaleFactor then Value := dxMaxScaleFactor;
  ScaleChanged := ScaleFactor <> Value;
  FScaleFactor := Value;
  ScaleMode := smAdjust;
  if ScaleChanged then PageParamsChange([ucScale]);
end;

procedure TdxPrinterPage.SetPaperSource(Value: Integer);
begin
  if Value < Windows.DMBIN_FIRST then 
    Value := Windows.DMBIN_FIRST;
  if (Value > Windows.DMBIN_LAST) and (Value < Windows.DMBIN_USER) then 
    Value := Windows.DMBIN_LAST;
  if FPaperSource <> Value then
    FPaperSource := Value;
end;

procedure TdxPrinterPage.SetPageSize(Value: TdxPointWrapper);
begin
  PageSize.Assign(Value);
end;

procedure TdxPrinterPage.HFGChanging(Sender: TObject; ASides: TdxRectSides;
  var Values: array of Integer);
begin
  if UpdateCount <> 0 then Exit;
  if rsTop in ASides then 
    Values[1] := MinMax(Values[1], FMinMargins.Top, RestPageSizeY - Margins.Bottom);
  if rsBottom in ASides then 
    Values[3] := MinMax(Values[3], FMinMargins.Bottom, RestPageSizeY - Margins.Top);
end;

procedure TdxPrinterPage.HFGChanged(Sender: TObject; ASides: TdxRectSides);
begin
  if UpdateCount <> 0 then Exit;
  BeginUpdate;
  try
    FixMargins;
  finally
    EndUpdate;
  end;    
end;

procedure TdxPrinterPage.FindDMPaperByPageSize;
var
  Index: Integer;
begin
  with PageSizeLoMetric do 
    Index := dxPPAttr.Papers.FindBySize(X, Y);
  if Index <> -1 then 
    FDMPaper := dxPPAttr.Papers[Index].DMPaper
  else  
    FDMPaper := DMPAPER_USER;
end;

procedure TdxPrinterPage.FixMinMargins;
begin
  FMinMargins.Left := MinMax(FMinMargins.Left, 0, RestPageSizeX);
  if RestPageSizeX = 0 then
    FMinMargins.Right := 0
  else  
    FMinMargins.Right := MinMax(FMinMargins.Right, 0, RestPageSizeX - FMinMargins.Left);
      
  FMinMargins.Top := MinMax(FMinMargins.Top, 0, RestPageSizeY);
  if RestPageSizeY = 0 then
    FMinMargins.Bottom := 0
  else
    FMinMargins.Bottom := MinMax(FMinMargins.Bottom, 0, RestPageSizeY - FMinMargins.Top);
end;

procedure TdxPrinterPage.FixMargins;
begin
  Header := 
    MinMax(Header, FMinMargins.Top, RestPageSizeY - FMinMargins.Bottom);
  Footer := 
    MinMax(Footer, FMinMargins.Bottom, RestPageSizeY - Header);
  FMargins.Left := 
    MinMax(FMargins.Left, FMinMargins.Left, RestPageSizeX - FMinMargins.Right);
  FMargins.Right := 
    MinMax(FMargins.Right, FMinMargins.Right, RestPageSizeX - FMargins.Left);
  FMargins.Top := 
    MinMax(FMargins.Top, Header, RestPageSizeY - Footer);
  FMargins.Bottom := 
    MinMax(FMargins.Bottom, Footer, RestPageSizeY - Header);
end;

procedure TdxPrinterPage.GetRealMinMargins(
  var AMinLeft, AMinRight, AMinTop, AMinBottom: Integer);
begin
  AMinLeft := 0;
  AMinRight := 0;
  AMinTop := 0;
  AMinBottom := 0;
  if dxInitPrintDevice(False) and (dxPrintDevice.Printers.Count > 0) then
  begin
    AMinLeft := 
      MulDiv(dxPrintDevice.PhysOffsetX, 1000, GetDeviceCaps(dxPrintDevice.Handle, LOGPIXELSX));
    AMinTop := 
      MulDiv(dxPrintDevice.PhysOffsetY, 1000, GetDeviceCaps(dxPrintDevice.Handle, LOGPIXELSY));
    case Page.GetInnerMeasurementUnits of
      muInches:;
      muMillimeters:
        begin
          AMinLeft := MulDiv(AMinLeft, 254, 10);
          AMinTop := MulDiv(AMinTop, 254, 10);
        end;
    end;
    AMinRight := AMinLeft;
    AMinBottom := AMinTop;
  end;
  if MinMargins.Left > AMinLeft then 
    AMinLeft := MinMargins.Left;
  if MinMargins.Right > AMinRight then 
    AMinRight := MinMargins.Right;  
  if MinMargins.Top > AMinTop then 
    AMinTop := MinMargins.Top;
  if MinMargins.Bottom > AMinBottom then 
    AMinBottom := MinMargins.Bottom;  
end;

procedure TdxPrinterPage.ApplyToPrintDevice;
var
  Paper: TdxPaperInfo;
begin
  dxPrintDevice.ColorMode := not GrayShading;
  dxPrintDevice.Orientation := Orientation;
  dxPrintDevice.SelectPaper(DMPaper);
  if DMPaper >= DMPAPER_USER then
  begin
    Paper := TdxPaperInfo(dxPrintDevice.Papers.Objects[dxPrintDevice.PaperIndex]);
    Paper.Width := PageSizeLoMetric.X;
    Paper.Height := PageSizeLoMetric.Y;
  end;
  dxPrintDevice.SelectBin(PaperSource);
end;

procedure TdxPrinterPage.FixMarginsOutside;
var
  AMinLeft, AMinRight, AMinTop, AMinBottom: Integer;
begin
  GetRealMinMargins(AMinLeft, AMinRight, AMinTop, AMinBottom);
  BeginUpdate;
  try
    if Header < AMinTop then 
      Header := AMinTop;
    if Footer < AMinBottom then 
      Footer := AMinBottom;
    if Margins.Left < AMinLeft then 
      Margins.Left := AMinLeft;
    if Margins.Right < AMinRight then 
      Margins.Right := AMinRight;
    FixMargins;
  finally
    EndUpdate;
  end;  
end;

function TdxPrinterPage.GetInnerMeasurementUnits: TdxMeasurementUnits;
begin
  if MeasurementUnits = muDefault then
    Result := GetDefaultMeasurementUnits
  else
    Result := MeasurementUnits;
end;

function TdxPrinterPage.MinMarginsLoMetric: TRect;
begin
  case GetInnerMeasurementUnits of
    muInches:
      Result := ScaleRect(Rect_InchToMM(MinMargins.Rect), 1, 100, 1, 100);
    else {muMillimeters}
      Result := ScaleRect(MinMargins.Rect, 1, 100, 1, 100);
  end;
end;

function TdxPrinterPage.FooterLoMetric: Integer;
begin
  case GetInnerMeasurementUnits of
    muInches:
      Result := MulDiv(InchToMM(Footer), 1, 100);
    else {muMillimeters}
      Result := MulDiv(Footer, 1, 100);
  end;
end;

function TdxPrinterPage.HeaderLoMetric: Integer;
begin
  case GetInnerMeasurementUnits of
    muInches:
      Result := MulDiv(InchToMM(Header), 1, 100);
    else {muMillimeters}
      Result := MulDiv(Header, 1, 100);
  end;
end;

function TdxPrinterPage.MarginsLoMetric: TRect;
begin
  case GetInnerMeasurementUnits of
    muInches:
      Result := ScaleRect(Rect_InchToMM(Margins.Rect), 1, 100, 1, 100);
    else {muMillimeters}
      Result := ScaleRect(Margins.Rect, 1, 100, 1, 100);
  end;    
end;

function TdxPrinterPage.GetRealPageSize: TPoint;
var
  V: Integer;
begin
  Result := PageSize.Point;
  if Orientation = poLandscape then 
    with Result do 
    begin
      V := X;
      X := Y;
      Y := V;
    end;
end;

procedure TdxPrinterPage.SetRealPageSize(const Value: TPoint);
begin
  if Orientation = poPortrait then   
    PageSize.Point := Value
  else {dxpoLandscape} 
    PageSize.Point := Point(Value.Y, Value.X);
end;

function TdxPrinterPage.RealPageSizeLoMetric: TPoint;    
var
  V: Integer;
begin
  Result := PageSizeLoMetric;
  if Orientation = poLandscape then 
    with Result do 
    begin
      V := X;
      X := Y;
      Y := V;
    end;
end;

function TdxPrinterPage.RealPageSizePixels: TPoint;
var
  V: Integer;
begin
  Result := PageSizePixels;
  if Orientation = poLandscape then 
    with Result do 
    begin
      V := X;
      X := Y;
      Y := V;
    end;
end;

function TdxPrinterPage.PageSizeLoMetric: TPoint;
begin
  case GetInnerMeasurementUnits of
    muInches:
      Result := ScalePoint(Pt_InchToMM(PageSize.Point), 1, 100);
    else {muMillimeters}
      Result := ScalePoint(PageSize.Point, 1, 100);
  end;
end;

function TdxPrinterPage.PageSizePixels: TPoint;
begin
  Result := ScalePoint(RealPageSizeLoMetric, Screen.PixelsPerInch, 254);
end;

function TdxPrinterPage.PaintRectLoMetric: TRect;
begin
  with MarginsLoMetric, RealPageSizeLoMetric do
    Result := Rect(Left, Top, X - Right, Y - Bottom)
end;

function TdxPrinterPage.PaintRectPixels: TRect;
begin
  Result := 
    ScaleRect(PaintRectLoMetric, Screen.PixelsPerInch, 254, Screen.PixelsPerInch, 254);
end;

procedure TdxPrinterPage.SetMinMargins(Value: TdxRectWrapper);
begin
  FMinMargins.Assign(Value);
end;

procedure TdxPrinterPage.SetMargins(Value: TdxRectWrapper);
begin
  FMargins.Assign(Value);
end;

procedure TdxPrinterPage.SetDMPaper(Value: Integer);
begin
  if (FDMPaper <> Value) then
  begin
    FDMPaper := Value;
    SetPaperSizeByDMPaper;
  end;  
end;

procedure TdxPrinterPage.SetPaperSizeByDMPaper;
var
  PaperSize: TPoint;
  I: Integer;
  Paper: TdxPaperInfo;
begin    
  PaperSize := Point(0, 0);
  I := dxPPAttr.Papers.FindByDMPaper(FDMPaper);
  if (I > -1) then 
    PaperSize := ScalePoint(TPoint(dxPPAttr.Papers[I].Size), 100, 1)
  else 
    if (dxPrintDevice.Papers <> nil) and (dxPrintDevice.Papers.Count > 0) then
      for I := 0 to dxPrintDevice.Papers.Count - 1 do 
      begin
        Paper := TdxPaperInfo(dxPrintDevice.Papers.Objects[I]);
        if Paper.DMPaper = FDMPaper then
        begin
          PaperSize := ScalePoint(TPoint(Paper.Size), 100, 1);
          Break;
        end;
      end;
    
  if (PaperSize.X <> 0) and (PaperSize.Y <> 0) then 
  begin
    FPageSizeLocked := True;
    try
      case GetInnerMeasurementUnits of
        muInches:
          PageSize.Point := Pt_MMToInch(PaperSize);
        muMillimeters:
          PageSize.Point := PaperSize;
      end;
    finally
      FPageSizeLocked := False;
    end;  
  end
end;

procedure TdxPrinterPage.SetOrientation(Value: TdxPrinterOrientation);
begin
  if (FOrientation <> Value) then
  begin
    FOrientation := Value;
    if CanSwapMargins then SwapMargins;
  end;
end;

procedure TdxPrinterPage.SwapMargins;
var
  V, V2: Integer;
begin
  BeginUpdate;
  try
    if Orientation = poLandscape then
    begin
      V := MinMargins.Left;
      MinMargins.Left := MinMargins.Bottom;
      V2 := MinMargins.Top;
      MinMargins.Top := V;
      V := MinMargins.Right;
      MinMargins.Right := V2;
      MinMargins.Bottom := V;
        
      V := Margins.Left;
      Margins.Left := Margins.Bottom;
      V2 := Margins.Top;
      Margins.Top := V;
      V := Margins.Right;
      Margins.Right := V2;
      Margins.Bottom := V;
    end
    else
    begin
      V := MinMargins.Bottom;
      MinMargins.Bottom := MinMargins.Left;
      V2 := MinMargins.Right;
      MinMargins.Right := V;
      V := MinMargins.Top;
      MinMargins.Top := V2;
      MinMargins.Left := V;
        
      V := Margins.Bottom;
      Margins.Bottom := Margins.Left;
      V2 := Margins.Right;
      Margins.Right := V;
      V := Margins.Top;
      Margins.Top := V2;
      Margins.Left := V;
    end;
    FixMargins;
  finally
    EndUpdate;
  end;
end;  

function TdxPrinterPage.GetRealMeasurementUnits: TdxMeasurementUnits;
begin
  if (MeasurementUnits = muDefault) then
    Result := GetDefaultMeasurementUnits
  else
    Result := MeasurementUnits;
end;

procedure TdxPrinterPage.SetMeasurementUnits(Value: TdxMeasurementUnits);
var
  DMU: TdxMeasurementUnits;
begin
  if (FMeasurementUnits <> Value) then
  begin
    DMU := GetDefaultMeasurementUnits;
    if ((Value = muDefault) and (FMeasurementUnits <> DMU)) or
      ((FMeasurementUnits = muDefault) and (Value <> DMU)) or
      ((Value <> muDefault) and (FMeasurementUnits <> muDefault)) then
    begin
      FMeasurementUnits := Value;
      FLastMU := GetInnerMeasurementUnits;
      BeginUpdate;
      try
        case FLastMU of
          muInches:
            begin
              MinMargins.Rect := Rect_MMToInch(MinMargins.Rect);
              Header := MMToInch(Header);
              Footer := MMToInch(Footer);
              Margins.Rect := Rect_MMToInch(Margins.Rect);
              PageSize.Point := Pt_MMToInch(PageSize.Point);
            end;
          muMillimeters:
            begin
              MinMargins.Rect := Rect_InchToMM(MinMargins.Rect);
              Header := InchToMM(Header);
              Footer := InchToMM(Footer);
              Margins.Rect := Rect_InchToMM(Margins.Rect);
              PageSize.Point := Pt_InchToMM(PageSize.Point);
            end;
        end;
      finally
        EndUpdate;
      end;
    end
    else
      FMeasurementUnits := Value;
  end;
end;

function TdxPrinterPage.HeaderRect: TRect;
begin
  Result := 
    Rect(Margins.Left, Header, RealPageSize.X - Margins.Right, Margins.Top);
end;

function TdxPrinterPage.FooterRect: TRect;
begin
  Result := 
    Rect(Margins.Left, RealPageSize.Y - Margins.Bottom,
      RealPageSize.X - Margins.Right, RealPageSize.Y - Footer);
end;

procedure TdxPrinterPage.MapRect2LoMetric(var R: TRect);
begin
  case GetInnerMeasurementUnits of
    muInches:
      R := ScaleRect(Rect_InchToMM(R), 1, 100, 1, 100);
    muMillimeters:
      R := ScaleRect(R, 1, 100, 1, 100);
  end;
end;

function TdxPrinterPage.HeaderRectLoMetric: TRect;
begin
  Result := HeaderRect;
  MapRect2LoMetric(Result);
end;

function TdxPrinterPage.FooterRectLoMetric: TRect;
begin
  Result := FooterRect;
  MapRect2LoMetric(Result);
end;

function TdxPrinterPage.GetHFG(Index: Integer): Integer;
var
  ASide: TdxRectSide absolute Index;
begin
  Result := FHFG[ASide];
end;

procedure TdxPrinterPage.SetHFG(Index: Integer; Value: Integer);
var
  ASide: TdxRectSide absolute Index;
begin
  if (Value < 0) then Value := 0;
  FHFG[ASide] := Value;
end;

procedure TdxPrinterPage.SetPageHeader(Value: TdxPageHeader);
begin
  FPageHeader.Assign(Value);
end;

procedure TdxPrinterPage.SetPageFooter(Value: TdxPageFooter);
begin
  FPageFooter.Assign(Value);
end;

procedure TdxPrinterPage.Changed;
begin
  if (UpdateCount = 0) then
    if Assigned(FOnChange) then FOnChange(Self);
end;

function TdxPrinterPage.RestPageSizeX: Integer;
begin
  Result := RealPageSize.X - MinPrintableArea;
end;

function TdxPrinterPage.RestPageSizeY: Integer;
begin
  Result := RealPageSize.Y - MinPrintableArea;
end;

function TdxPrinterPage.ValidateMargins: Boolean;
var
  APhysOffsetX, APhysOffsetY: Integer;
begin
  Result := True;
  if not dxInitPrintDevice(False) then Exit;
  with dxPrintDevice do
  begin
    APhysOffsetX := MulDiv(PhysOffsetX, 254, GetDeviceCaps(Handle, LOGPIXELSX));
    APhysOffsetY := MulDiv(PhysOffsetY, 254, GetDeviceCaps(Handle, LOGPIXELSY));
  end;
  with MarginsLoMetric do
    Result := (Left >= APhysOffsetX) and (Top >= APhysOffsetY) and
              (Right >= APhysOffsetX) and (Bottom >= APhysOffsetY);
end;

initialization

finalization
  if Assigned(FDefaultPrinterPage) then FDefaultPrinterPage.Free;
  FDefaultPrinterPage := nil;

end.

