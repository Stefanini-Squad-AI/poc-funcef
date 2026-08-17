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

unit dxPSReg;

interface

{$I dxPSVer.inc}

procedure Register;

implementation

{$IFNDEF DELPHI6}
  {Delphi6 doesn't support Bitmaps in MenuItem}
  {$IFDEF DELPHI5}
    {$DEFINE IDE_MENUBITMAPS}
  {$ENDIF}
{$ENDIF}

uses
  Windows, Classes, SysUtils, ShellAPI, Forms, TypInfo, Graphics, Dialogs, 
 {$IFDEF DELPHI6} DesignIntf, DesignEditors, DesignMenus, VCLEditors, {$ELSE} DsgnIntf, {$ENDIF}
 {$IFDEF IDE_MENUBITMAPS} Menus, {$ENDIF} {$IFDEF DELPHI4} ImgList, {$ENDIF} 
  dxRegEd, dxPPAttr, dxPreVw, dxPSCore, dxPSGlbl, dxWrap, dxPrnPg, dxPSUtl, 
  dxPrnDlg, dxPgsDlg, dxPSfmStlAdd, dxPSfmLnkAdd, dxPSfmLnkAddE, dxPSEngn,
  dxPSfmTtl, dxPSfmStlDsg, dxPSPrVwDsg, dxPSfmLnkDsg, dxBkgnd, dxBrhDlg;

const
  sdxPSComponentPage = 'ExpressPrinting System';
  sdxReportLinks = 'Edit ReportLinks...';
  sdxPrintStyles = 'Edit PrintStyles...';
  sdxAddNewStyle = '&Add...';
  sdxAddNewLink = '&Add...';
  sdxAddNewEmtpyLink = 'Add E&mpty...';
  sdxPageBackground = 'Page Bac&kground...';
  sdxClearBackground = 'Clea&r Background';
  sdxRestoreDefaults = 'Rest&ore Defaults';  
  sdxRestoreOriginal = 'Restore Or&iginal';  
  sdxMakeCurrent = '&Make Current';
  sdxPageSetupDialog = 'PageSetup Dialog...';
  sdxPageSetup = 'Page Set&up...';  
  sdxPrintDialog = 'Print Dialog...';
  sdxPrint = '&Print...';
  sdxPrintPreview = 'Print Pre&view...';
  sdxShowReportDesigner = 'Show D&esigner...';
  sdxDesignerNoAvailable = 'Designer not available';
  sdxClickForSetupEffects = 'Click for setup effects...';
  sdxClickForPageSetup = 'Click for Page Setup...';
  sdxCustomPaperSize = 'CustomSize - DMPAPER_USER #';
  sdxCustomBin = 'CustomBin - DMBIN_USER #';
  sdxWEBPage = 'http://www.devexpress.com';
  sdxDevex = 'Developer Express Inc.';
  sdxPrintingSystem: string = 'ExpressPrinting System ';

{$IFDEF IDE_MENUBITMAPS}
var
  FBmpWEB: TBitmap;
  FBmpItems: TBitmap;
  FBmpPrint: TBitmap;
  FBmpPageSetup: TBitmap;
  FBmpPageBackground: TBitmap;
  FBmpDesigner: TBitmap;
  FBmpPrintPreview: TBitmap;
  FBmpNewEmpty: TBitmap;
  FBmpNew: TBitmap;
{$ENDIF}


function TryStartWEBPage(const APage: string): Boolean;
begin
  Result := ShellExecute(0, nil, PChar(APage), nil, nil, SW_SHOWNORMAL) >= 32;
end;

type
  TdxComponentPrinterEditor = class(TComponentEditor)
  private
   {$IFDEF DELPHI5}    
    procedure AddLink(ALinkClass: TdxReportLinkClass; AComponent: TComponent);
    function AddNewEmptyLink: Boolean;    
    function AddNewLink: Boolean;
    function InDataModule: Boolean;
   {$ENDIF}
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
   {$IFDEF IDE_MENUBITMAPS}
    procedure PrepareItem(Index: Integer; const AItem: TMenuItem); override;
   {$ENDIF}
  end;


  TdxReportLinkEditor = class(TComponentEditor)
  private
    function ReportLink: TBasedxReportLink;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    {$IFDEF DELPHI5}
    procedure PrepareItem(Index: Integer; 
      const AItem: {$IFDEF DELPHI6} IMenuItem {$ELSE} TMenuItem {$ENDIF}); override;    
    {$ENDIF}  
  end;
  

  TdxPrintStyleManagerEditor = class(TComponentEditor)
  private
  {$IFDEF DELPHI5}    
    function AddNewStyle: Boolean;
    function InDataModule: Boolean;
  {$ENDIF}
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
   {$IFDEF IDE_MENUBITMAPS}
    procedure PrepareItem(Index: Integer; const AItem: TMenuItem); override;
   {$ENDIF}
  end;

  
  TdxPrintStyleEditor = class(TComponentEditor)
  private
    function PrintStyle: TBasedxPrintStyle;
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    {$IFDEF DELPHI5}
    procedure PrepareItem(Index: Integer; 
      const AItem: {$IFDEF DELPHI6} IMenuItem {$ELSE} TMenuItem{$ENDIF}); override;    
    {$ENDIF}  
  end;

  
  TdxPageSetupDialogEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  {$IFDEF DELPHI5}  
    procedure PrepareItem(Index: Integer; 
      const AItem: {$IFDEF DELPHI6} IMenuItem {$ELSE} TMenuItem{$ENDIF}); override;
  {$ENDIF}
  end;


  TdxPrintDialogEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
   {$IFDEF IDE_MENUBITMAPS}
    procedure PrepareItem(Index: Integer; const AItem: TMenuItem); override;
   {$ENDIF}
  end;


  TdxReportLinkComponentPropertyEditor = class(TComponentProperty)
  private
    FCompList: TStringList;
    procedure EnumComp(Proc: TGetStrProc);
    procedure CheckProc(const S: string);
  public
    destructor Destroy; override;
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure Initialize; override;
  end;


  TdxIndexPropertyEditor = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
  end;
  

  TdxReportLinkDesignerPropertyEditor = class(TPropertyEditor)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;
  

{$IFDEF DELPHI5}
  TdxPrintStyleImageIndexPropertyEditor = class(TIntegerProperty
  {$IFDEF DELPHI6}
   ,ICustomPropertyDrawing, ICustomPropertyListDrawing
  {$ENDIF})
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
    
    procedure ListMeasureHeight(const Value: string; ACanvas: TCanvas;
      var AHeight: Integer); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure ListMeasureWidth(const Value: string;
      ACanvas: TCanvas; var AWidth: Integer); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure ListDrawValue(const Value: string; ACanvas: TCanvas;
      const ARect: TRect; ASelected: Boolean); {$IFNDEF DELPHI6} override;{$ENDIF}
    procedure PropDrawValue(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean); {$IFNDEF DELPHI6} override;{$ENDIF}
   {$IFDEF DELPHI6}  
    { ICustomPropertyDrawing }
    procedure PropDrawName(ACanvas: TCanvas; const ARect: TRect;
      ASelected: Boolean);
   {$ENDIF}
  end;
{$ENDIF}


  TdxRegistryPathPropertyEditor = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


  TdxCPMeasurementsPropertyEditor = class(TEnumProperty)
  private
    function DropPrefix(const Source: string): string;
  public
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
    function GetValue: string; override;
  end;


  TdxPrinterPagePropertyEditor = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


  TdxReportTitlePropertyEditor = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;
  

  TdxPrinterPagePropertyEditor2 = class(TClassProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


  TdxPointWrapperEditor = class(TClassProperty)
  private
    function PointWrapper: TdxPointWrapper;
  public
    function GetValue: string; override;
  end;


  TdxRectWrapperEditor = class(TClassProperty)
  private
    function RectWrapper: TdxRectWrapper;
  public
    function GetValue: string; override;
  end;


  TdxBackgroundEffectsPropertyEditor = class(TPropertyEditor)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;


  TdxBrushPropertyEditor = class(TClassProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;


  TTTFontPropertyEditor = class(TFontProperty)
  public
    procedure Edit; override;
  end;


  TdxShowPgsDlgPropertyEditor = class(TPropertyEditor)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure Edit; override;
  end;


  TdxDMPaperPropertyEditor = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;


  TdxPaperSourcePropertyEditor = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;


  TdxPageNumberFormatsPropertyEditor = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

  
  TdxDateFormatsPropertyEditor = class(TIntegerProperty)
  private
    FStrings: TStrings;
  public
    destructor Destroy; override;
    procedure Initialize; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;


  TdxTimeFormatsPropertyEditor = class(TIntegerProperty)
  private
    FStrings: TStrings;
  public
    destructor Destroy; override;
    procedure Initialize; override;
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

 {$IFDEF DELPHI6}
  TdxComponentPrinterSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TdxPrintStyleManagerSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TdxPageSetupDialogSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;

  TdxPrintDialogSelectionEditor = class(TSelectionEditor)
  public
    procedure RequiresUnits(Proc: TGetStrProc); override;
  end;
  
 {$ENDIF}

{ TdxComponentPrinterEditor }

{$IFDEF DELPHI5}    
function TdxComponentPrinterEditor.InDataModule: Boolean;
begin
  Result := Component.Owner is TDataModule;
end;

procedure TdxComponentPrinterEditor.AddLink(ALinkClass: TdxReportLinkClass;
  AComponent: TComponent);
var
  NewLink: TBasedxReportLink;
begin
  NewLink := 
    TBasedxReportLink(Designer.CreateComponent(ALinkClass, Designer.GetRoot, 0, 0, 0, 0));
  if NewLink = nil then 
    Exit;
  NewLink.Name := dxReportLinkUniqueName(TdxComponentPrinter(Component), NewLink);
  NewLink.ComponentPrinter := TdxComponentPrinter(Component);
  if AComponent = nil then 
    Exit;
  NewLink.Component := AComponent;
  with Designer do
    if (GetRoot.FindComponent(AComponent.Name) <> AComponent) and 
      not IsComponentLinkable(AComponent) then
      MakeComponentLinkable(AComponent)
end;
  
function TdxComponentPrinterEditor.AddNewLink: Boolean;
var
  Comp: TComponent;
  LinkClass: TdxReportLinkClass;
begin
  Comp := nil;
  Result := dxSelectComponent(nil, nil, Designer, Comp);
  if Result then
  begin
    LinkClass := dxPSLinkClassByCompClass(TComponentClass(Comp.ClassType));
    Result := LinkClass <> nil;
    if Result then
      AddLink(LinkClass, Comp);
  end;
end;

function TdxComponentPrinterEditor.AddNewEmptyLink: Boolean;
var
  LinkClass: TdxReportLinkClass;
begin
  LinkClass := dxSelectReportLink;
  Result := LinkClass <> nil;
  if Result then
    AddLink(LinkClass, nil);
end;

{$ENDIF}

procedure TdxComponentPrinterEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then 
    dxShowReportLinkDesigner(TCustomdxComponentPrinter(Component), Designer)
  else  
{$IFDEF DELPHI5}    
    if Index in [1, 2] then
    begin
      if InDataModule then 
        if Index = 1 then 
        begin
          if AddNewLink then Designer.Modified
        end
        else
          if AddNewEmptyLink then Designer.Modified             
    end
    else
{$ENDIF}    
      TryStartWEBPage(sdxWEBPage);
end;

function TdxComponentPrinterEditor.GetVerb(Index: Integer): string;
begin
{$IFDEF DELPHI5}  
  if InDataModule then 
    case Index of
      0: Result := sdxPrintStyles;
      1: Result := sdxAddNewLink;
      2: Result := sdxAddNewEmtpyLink;      
      3: Result := '-';
      4: Result := sdxPrintingSystem;
      5: Result := sdxWEBPage;
      6: Result := sdxDevex;
    end
  else
{$ENDIF}  
  case Index of
    0: Result := sdxReportLinks;
    1: Result := '-';
    2: Result := sdxPrintingSystem;
    3: Result := sdxWEBPage;
    4: Result := sdxDevex;
  end;
end;

function TdxComponentPrinterEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 5{$IFDEF DELPHI5} + 2 * Byte(InDataModule){$ENDIF};
end;

{$IFDEF IDE_MENUBITMAPS}
procedure TdxComponentPrinterEditor.PrepareItem(Index: Integer; const AItem: TMenuItem);
begin
  if InDataModule then
    case Index of
      0: AItem.Bitmap := FBmpItems;
      1: AItem.Bitmap := FBmpNew;
      2: AItem.Bitmap := FBmpNewEmpty;
      5: AItem.Bitmap := FBmpWEB;
    end
  else
    case Index of
      0: AItem.Bitmap := FBmpItems;
      3: AItem.Bitmap := FBmpWEB;
    end;
end;
{$ENDIF}


{ TdxReportLinkEditor }

function TdxReportLinkEditor.ReportLink: TBasedxReportLink;
begin
  Result := TBasedxReportLink(Component);
end;

procedure TdxReportLinkEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: 
      if ReportLink.ComponentPrinter.DesignReport(ReportLink) then Designer.Modified;
    1: 
      begin
        ReportLink.IsCurrentLink := True;
        Designer.Modified;
      end;
    3: 
      begin 
        ReportLink.RestoreFromOriginal;
        Designer.Modified;
      end;  
    4: 
      begin
        ReportLink.RestoreDefaults;
        ReportLink.PrinterPage.RestoreDefaults;
        Designer.Modified;
      end;
    6:       
      if ReportLink.PrinterPage.Background.SetupEffects then 
        Designer.Modified;
    7: 
      begin
        ReportLink.PrinterPage.Background.Mode := bmNone;
        ReportLink.PrinterPage.Background.Picture := nil;
        Designer.Modified;
      end;
    9: 
      if ReportLink.PageSetup then Designer.Modified;
    10: 
      dxShowPreviewWindow(ReportLink.ComponentPrinter, Designer);
    11: 
      if ReportLink.Print(True, nil) then Designer.Modified;
  end;
end;

function TdxReportLinkEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sdxShowReportDesigner;
    1: Result := sdxMakeCurrent;
    2: Result := '-';  
    3: Result := sdxRestoreOriginal;
    4: Result := sdxRestoreDefaults;
    5: Result := '-';
    6: Result := sdxPageBackground;
    7: Result := sdxClearBackground;
    8: Result := '-';
    9: Result := sdxPageSetup;
    10: Result := sdxPrintPreview;
    11: Result := sdxPrint;    
  end;
end;

function TdxReportLinkEditor.GetVerbCount: Integer;
begin
  Result := 12;
end;

{$IFDEF DELPHI5}
procedure TdxReportLinkEditor.PrepareItem(Index: Integer; 
  const AItem: {$IFDEF DELPHI6} IMenuItem {$ELSE} TMenuItem{$ENDIF});
begin
  case Index of
    0:
      begin
        AItem.Enabled := TBasedxReportLink(Component).CheckToDesign;
       {$IFDEF IDE_MENUBITMAPS}
        AItem.Bitmap := FBmpDesigner;
       {$ENDIF}
      end;  
    1: AItem.Enabled := not TBasedxReportLink(Component).IsCurrentLink;
   {$IFDEF IDE_MENUBITMAPS}    
    6: AItem.Bitmap := FBmpPageBackground;
    9: AItem.Bitmap := FBmpPageSetup;
   {$ENDIF}
    10: 
      begin
        AItem.Enabled := TBasedxReportLink(Component).Component <> nil; //DataProviderPresent;
       {$IFDEF IDE_MENUBITMAPS}        
        AItem.Bitmap := FBmpPrintPreview;
       {$ENDIF} 
      end;  
    11: 
      begin
        AItem.Enabled := TBasedxReportLink(Component).Component <> nil; //DataProviderPresent;
       {$IFDEF IDE_MENUBITMAPS}
        AItem.Bitmap := FBmpPrint;
       {$ENDIF}
      end;  
  end;
end;
{$ENDIF}

{ TdxReportLinkComponentPropertyEditor }

destructor TdxReportLinkComponentPropertyEditor.Destroy;
begin
  FCompList.Free;
  inherited Destroy;
end;

procedure TdxReportLinkComponentPropertyEditor.Initialize;
begin
  FCompList := TStringList.Create;
end;

function TdxReportLinkComponentPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList, paRevertable];
end;

procedure TdxReportLinkComponentPropertyEditor.GetValues(Proc: TGetStrProc);
begin
  EnumComp(Proc);
end;

procedure TdxReportLinkComponentPropertyEditor.CheckProc(const S: string);
var
  Comp: TComponent;
begin
  Comp := Designer.GetComponent(S);
  if (Comp = nil) or (Comp is TBasedxReportLink) or (Comp is TCustomdxComponentPrinter) then
    Exit;
  if TBasedxReportLink(GetComponent(0)).IsSupportedCompClass(TComponentClass(Comp.ClassType)) then
    FCompList.Add(S)
end;

procedure TdxReportLinkComponentPropertyEditor.EnumComp(Proc: TGetStrProc);
var
  I: Integer;
begin
  FCompList.Clear;
  Designer.GetComponentNames(GetTypeData(PTypeInfo(TComponent.ClassInfo)), CheckProc);
  for I := 0 to FCompList.Count - 1 do
    Proc(FCompList[I]);
end;

{ TdxIndexPropertyEditor }

function TdxIndexPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes - [paMultiSelect];
end;


{ TdxReportLinkDesignerPropertyEditor }

function TdxReportLinkDesignerPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly];
  if TBasedxReportLink(GetComponent(0)).CheckToDesign then 
    Result := Result + [paDialog];
end;

function TdxReportLinkDesignerPropertyEditor.GetValue: string;
begin
  if TBasedxReportLink(GetComponent(0)).CheckToDesign then
    Result := DropAmpersand(sdxShowReportDesigner)
  else
    Result := sdxDesignerNoAvailable;
end;

procedure TdxReportLinkDesignerPropertyEditor.Edit;
begin
  if TBasedxReportLink(GetComponent(0)).DesignReport then
    Designer.Modified;
end;


{$IFDEF DELPHI5}

{ TdxPrintStyleImageIndexPropertyEditor }

function TdxPrintStyleImageIndexPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paValueList, paSortList, paRevertable];
end;

procedure TdxPrintStyleImageIndexPropertyEditor.GetValues(Proc: TGetStrProc);
var
  PrintStyle: TBasedxPrintStyle;
  I: Integer;
begin
  PrintStyle := TBasedxPrintStyle(GetComponent(0));
  if PrintStyle.StyleManager.Images <> nil then 
    for I := 0 to PrintStyle.StyleManager.Images.Count - 1 do 
      Proc(IntToStr(I));
end;

procedure TdxPrintStyleImageIndexPropertyEditor.ListMeasureHeight(const Value: string; 
  ACanvas: TCanvas; var AHeight: Integer);
var
  Images: TCustomImageList;  
begin
  Images := TBasedxPrintStyle(GetComponent(0)).StyleManager.Images;
  if Images <> nil then 
    AHeight := Images.Height + 2 + 2;
end;  

procedure TdxPrintStyleImageIndexPropertyEditor.ListMeasureWidth(const Value: string;
  ACanvas: TCanvas; var AWidth: Integer);
var
  Images: TCustomImageList;  
begin
  Images := TBasedxPrintStyle(GetComponent(0)).StyleManager.Images;
  if Images <> nil then 
    AWidth := AWidth + Images.Width + 2 + 2;
end;

procedure TdxPrintStyleImageIndexPropertyEditor.ListDrawValue(const Value: string; 
  ACanvas: TCanvas; const ARect: TRect; ASelected: Boolean);
var
  R: TRect;
  Images: TCustomImageList;  
  I: Integer;
begin
  R := ARect;
  ACanvas.FillRect(R);
  Images := TBasedxPrintStyle(GetComponent(0)).StyleManager.Images;
  if Images <> nil then 
  try
    I := StrToInt(Value);
    if (I > -1) and (I < Images.Count) then 
    begin
      Images.Draw(ACanvas, R.Left + 2, R.Top + 2, I);
      Inc(R.Left, Images.Width + 2);
    end;  
  except
  end;
 {$IFDEF DELPHI6} 
  DefaultPropertyListDrawValue(Value, ACanvas, R, ASelected);
 {$ELSE}  
  inherited ListDrawValue(Value, ACanvas, R, ASelected);
 {$ENDIF}  
end;  

procedure TdxPrintStyleImageIndexPropertyEditor.PropDrawValue(ACanvas: TCanvas; 
  const ARect: TRect; ASelected: Boolean);
var
  S: string;
begin
  S := GetVisualValue;
  if (S <> '') and ASelected then 
    ListDrawValue(S, ACanvas, ARect, ASelected)
  else  
 {$IFDEF DELPHI6} 
  DefaultPropertyDrawValue(Self, ACanvas, ARect);
 {$ELSE}  
  inherited PropDrawValue(ACanvas, ARect, ASelected);
 {$ENDIF}  
end;  
{$ENDIF}


{$IFDEF DELPHI6}  
{ ICustomPropertyDrawing }
procedure TdxPrintStyleImageIndexPropertyEditor.PropDrawName(ACanvas: TCanvas; 
  const ARect: TRect; ASelected: Boolean);
begin
  DefaultPropertyDrawName(Self, ACanvas, ARect);
end;  
{$ENDIF}

{ TdxRegistryPathPropertyEditor }

procedure TdxRegistryPathPropertyEditor.Edit;
var
  S: string;
begin
  S := Value;
  if dxGetRegistryPath(S) then
  begin
    Value := S;
    Designer.Modified;
  end;
end;

function TdxRegistryPathPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;


{ TdxCPMeasurementsPropertyEditor }

function TdxCPMeasurementsPropertyEditor.DropPrefix(const Source: string): string;
begin
  { drop "mu" prefix}
  Result := Copy(Source, 3, Length(Source) - 2);
end;

procedure TdxCPMeasurementsPropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
  EnumType: PTypeInfo;
  EnumName: string;
begin
  EnumType := GetPropType;
  with GetTypeData(EnumType)^ do
    for I := MinValue to MaxValue do
    begin
      EnumName := GetEnumName(EnumType, I);
      if CompareText(EnumName, 'muDefault') = 0 then
        EnumName := EnumName + 
          Format(' ( %s )', [DropPrefix(GetEnumName(TypeInfo(TdxMeasurementUnits), Integer(GetDefaultMeasurementUnits)))]);
      Proc(EnumName);
    end;
end;

function TdxCPMeasurementsPropertyEditor.GetValue: string;
begin
  Result := inherited GetValue + ' (in thousandths)';
end;

procedure TdxCPMeasurementsPropertyEditor.SetValue(const Value: string);
begin
  if Pos(GetEnumName(TypeInfo(TdxMeasurementUnits), 0), Value) > 0 then
    SetOrdValue(0)
  else
    inherited SetValue(Value)
end;


{ TdxPrinterPagePropertyEditor }

procedure TdxPrinterPagePropertyEditor.Edit;
var
  ReportLink: TBasedxReportLink;
  I: Integer;
begin
  ReportLink := TBasedxReportLink(GetComponent(0));
  if ReportLink.PageSetup then
  begin
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        TBasedxReportLink(GetComponent(I)).PrinterPage.Assign(ReportLink.PrinterPage);
    Designer.Modified;
  end;
end;

function TdxPrinterPagePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;


{ TdxReportTitlePropertyEditor }

procedure TdxReportTitlePropertyEditor.Edit; 
var
  ReportLink: TBasedxReportLink;
  I: Integer;
begin
  ReportLink := TBasedxReportLink(GetComponent(0));
  if ReportLink.ShowTitlePropertiesDlg then
  begin
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        TBasedxReportLink(GetComponent(I)).ReportTitle.Assign(ReportLink.ReportTitle);
    Designer.Modified;
  end;
end;

function TdxReportTitlePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;


{ TdxPrinterPagePropertyEditor2 }

procedure TdxPrinterPagePropertyEditor2.Edit;
var
  I: Integer;
  PrintStyle: TBasedxPrintStyle;
begin
  PrintStyle := TBasedxPrintStyle(GetComponent(0));
  if PrintStyle.PageSetup then
  begin
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        TBasedxPrintStyle(GetComponent(I)).PrinterPage.Assign(PrintStyle.PrinterPage);
    Designer.Modified;
  end;
end;

function TdxPrinterPagePropertyEditor2.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;


{ TdxPointWrapperEditor }

function TdxPointWrapperEditor.PointWrapper: TdxPointWrapper;
begin
  Result := TdxPointWrapper(GetOrdValue);
end;

function TdxPointWrapperEditor.GetValue: string;
var
  P: TdxPointWrapper;
begin
  P := PointWrapper;
  if P <> nil then
    FmtStr(Result, '(X : %d; Y : %d)', [P.X, P.Y])
  else
    Result := inherited GetValue;
end;


{ TdxRectWrapperEditor }

function TdxRectWrapperEditor.RectWrapper: TdxRectWrapper;
begin
  Result := TdxRectWrapper(GetOrdValue);
end;

function TdxRectWrapperEditor.GetValue: string;
var
  R: TdxRectWrapper;
begin
  R := RectWrapper;
  if R <> nil then
    FmtStr(Result, '(Bottom : %d; Left : %d; Right : %d; Top : %d)', [R.Bottom, R.Left, R.Right, R.Top])
  else
    Result := inherited GetValue;
end;

{ TdxBackgroundEffectsPropertyEditor }

function TdxBackgroundEffectsPropertyEditor.GetValue: string;
begin
  Result := sdxClickForSetupEffects;
end;

procedure TdxBackgroundEffectsPropertyEditor.Edit;
begin
  if TdxBackground(GetComponent(0)).SetupEffects then
    Designer.Modified;
end;

function TdxBackgroundEffectsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;


{ TdxBrushPropertyEditor }

procedure TdxBrushPropertyEditor.Edit;
var
  I: Integer;
begin
  if ChooseBrush(TBrush(GetOrdValue)) then
  begin
    if PropCount > 1 then
      for I := 1 to PropCount - 1 do
        TBrush(GetOrdValueAt(I)).Assign(TBrush(GetOrdValue));
    Designer.Modified;
  end;
end;

function TdxBrushPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog];
end;


{ TTTFontPropertyEditor }

procedure TTTFontPropertyEditor.Edit;
const
  hcDFontEditor = 25000;
var
  FontDialog: TFontDialog;
begin
  FontDialog := TFontDialog.Create(Application);
  try
    FontDialog.Font := TFont(GetOrdValue);
    FontDialog.Device := fdPrinter;
    FontDialog.HelpContext := hcDFontEditor;
    if FontDialog.Execute then
      SetOrdValue(Longint(FontDialog.Font));
  finally
    FontDialog.Free;
  end;
end;


{ TdxPrintStyleManagerEditor  }

{$IFDEF DELPHI5}    
function TdxPrintStyleManagerEditor.InDataModule: Boolean;
begin
  Result := Component.Owner is TDataModule;
end;

function TdxPrintStyleManagerEditor.AddNewStyle: Boolean;
var
  StyleClass: TdxPrintStyleClass;
  Style: TBasedxPrintStyle;
begin
  StyleClass := dxSelectStyleClass(nil);
  Result := StyleClass <> nil;
  if Result then 
  begin
    Style := TBasedxPrintStyle(Designer.CreateComponent(StyleClass, Designer.GetRoot, 0, 0, 0, 0));
    if Style <> nil then
    begin
      Style.Name := dxPrintStyleUniqueName(TdxPrintStyleManager(Component), Style);
      Style.StyleManager := TdxPrintStyleManager(Component);
    end;
  end;  
end;
{$ENDIF}

procedure TdxPrintStyleManagerEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then 
    dxShowPrintStylesDesigner(TdxPrintStyleManager(Component), Designer)
  else  
   {$IFDEF DELPHI5}    
    if Index = 1 then
      if InDataModule and AddNewStyle then 
        Designer.Modified
      else  
    else
   {$ENDIF}    
      TryStartWEBPage(sdxWEBPage);
end;

function TdxPrintStyleManagerEditor.GetVerb(Index: Integer): string;
begin
{$IFDEF DELPHI5}  
  if InDataModule then 
    case Index of
      0: Result := sdxPrintStyles;
      1: Result := sdxAddNewStyle;
      2: Result := '-';
      3: Result := sdxPrintingSystem;
      4: Result := sdxWEBPage;
      5: Result := sdxDevex;
    end
  else
{$ENDIF}  
    case Index of
      0: Result := sdxPrintStyles;
      1: Result := '-';
      2: Result := sdxPrintingSystem;
      3: Result := sdxWEBPage;
      4: Result := sdxDevex;
    end;
end;

function TdxPrintStyleManagerEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 5{$IFDEF DELPHI5}+ Byte(InDataModule){$ENDIF};
end;

{$IFDEF IDE_MENUBITMAPS}
procedure TdxPrintStyleManagerEditor.PrepareItem(Index: Integer; const AItem: TMenuItem);
begin
  if InDataModule then 
    case Index of
      0: AItem.Bitmap := FBmpItems;
      1: AItem.Bitmap := FBmpNew;
      4: AItem.Bitmap := FBmpWEB;
    end
  else
    case Index of
      0: AItem.Bitmap := FBmpItems;
      3: AItem.Bitmap := FBmpWEB;
    end
end;
{$ENDIF}


{ TdxPrintStyleEditor }

function TdxPrintStyleEditor.PrintStyle: TBasedxPrintStyle;
begin
  Result := TBasedxPrintStyle(Component);
end;

procedure TdxPrintStyleEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: 
      if PrintStyle.PageSetup then Designer.Modified;    
    1:
      begin 
        PrintStyle.IsCurrentStyle := True;
        Designer.Modified;
      end;  
    3:begin 
        PrintStyle.RestoreDefaults;
        Designer.Modified;
      end;  
    5: 
       if PrintStyle.PrinterPage.Background.SetupEffects then 
         Designer.Modified;        
    6: 
      begin
        PrintStyle.PrinterPage.Background.Mode := bmNone;
        PrintStyle.PrinterPage.Background.Picture := nil;        
        Designer.Modified;
      end;  
  end;
end;

function TdxPrintStyleEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sdxPageSetup;
    1: Result := sdxMakeCurrent;
    2: Result := '-';
    3: Result := sdxRestoreDefaults;
    4: Result := '-';
    5: Result := sdxPageBackground;    
    6: Result := sdxClearBackground;
  end;
end;

function TdxPrintStyleEditor.GetVerbCount: Integer;
begin
  Result := 7;
end;

{$IFDEF DELPHI5}
procedure TdxPrintStyleEditor.PrepareItem(Index: Integer; 
  const AItem: {$IFDEF DELPHI6} IMenuItem {$ELSE} TMenuItem{$ENDIF});
begin
  case Index of
   {$IFDEF IDE_MENUBITMAPS}  
    0: AItem.Bitmap := FBmpPageSetup;
   {$ENDIF}
    1: AItem.Enabled := not TBasedxPrintStyle(Component).IsCurrentStyle;
   {$IFDEF IDE_MENUBITMAPS}  
    5: AItem.Bitmap := FBmpPageBackground;      
   {$ENDIF}    
  end;
end;
{$ENDIF}

{ TdxPageSetupDialogEditor }

procedure TdxPageSetupDialogEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: TdxPageSetupDialog(Component).Execute;
    1: ; {-}
    2, 3, 4: TryStartWEBPage(sdxWEBPage);
  end;
end;

function TdxPageSetupDialogEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sdxPageSetupDialog;
    1: Result := '-';
    2: Result := sdxPrintingSystem;
    3: Result := sdxWEBPage;
    4: Result := sdxDevex;
  end;
end;

function TdxPageSetupDialogEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 5;
end;

{$IFDEF DELPHI5}  
procedure TdxPageSetupDialogEditor.PrepareItem(Index: Integer; 
  const AItem: {$IFDEF DELPHI6} IMenuItem {$ELSE} TMenuItem{$ENDIF});
begin
  case Index of
    0:
      begin
       {$IFDEF IDE_MENUBITMAPS}      
        AItem.Bitmap := FBmpPageSetup;
       {$ENDIF}
        AItem.Enabled := TdxPageSetupDialog(Component).PrintStyle <> nil;
      end;
    3: 
     {$IFDEF IDE_MENUBITMAPS} 
      AItem.Bitmap := FBmpWEB; 
     {$ENDIF}
  end;
end;
{$ENDIF}

{ TdxPrintDialogEditor }

procedure TdxPrintDialogEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: TdxPrintDialog(Component).Execute;
    1: ; {-}
    2, 3, 4: TryStartWEBPage(sdxWEBPage);
  end;
end;

function TdxPrintDialogEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := sdxPrintDialog;
    1: Result := '-';
    2: Result := sdxPrintingSystem;
    3: Result := sdxWEBPage;
    4: Result := sdxDevex;
  end;
end;

function TdxPrintDialogEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 5;
end;

{$IFDEF IDE_MENUBITMAPS}
procedure TdxPrintDialogEditor.PrepareItem(Index: Integer; const AItem: TMenuItem);
begin
  case Index of
    0: AItem.Bitmap := FBmpPrint;
    3: AItem.Bitmap := FBmpWEB;
  end;
end;
{$ENDIF}

{ TdxShowPgsDlgPropertyEditor }

function TdxShowPgsDlgPropertyEditor.GetValue: string;
begin
  Result := sdxClickForPageSetup;
end;

procedure TdxShowPgsDlgPropertyEditor.Edit;
begin
  if TBasedxPrintStyle(GetComponent(0)).PageSetup then
    Designer.Modified;
end;

function TdxShowPgsDlgPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

{ TdxDMPaperPropertyEditor }

function TdxDMPaperPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TdxDMPaperPropertyEditor.GetValue: string;
var
  Index: Integer;
begin
  Index := dxPPAttr.Papers.FindByDMPaper(GetOrdValue);
  if Index <> -1 then
    Result := dxPPAttr.Papers[Index].Name
  else
    Result := sdxCustomPaperSize + IntToStr(GetOrdValue);
end;

procedure TdxDMPaperPropertyEditor.SetValue(const Value: string);
var
  Index: Integer;
begin
  Index := dxPPAttr.Papers.FindByName(Value);
  if Index <> -1 then
    SetOrdValue(dxPPAttr.Papers[Index].DMPaper)
  else
    inherited SetValue(Value);
end;

procedure TdxDMPaperPropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to dxPPAttr.Papers.Count - 1 do
    Proc(dxPPAttr.Papers[I].Name);
end;


{ TdxPaperSourcePropertyEditor }

function TdxPaperSourcePropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TdxPaperSourcePropertyEditor.GetValue: string;
var
  Index: Integer;
begin
  Index := dxPPAttr.Bins.FindByValue(GetOrdValue);
  if Index <> -1 then
    Result := dxPPAttr.Bins[Index].Name
  else
    Result := sdxCustomBin + IntToStr(GetOrdValue);
end;

procedure TdxPaperSourcePropertyEditor.SetValue(const Value: string);
var
  Index: Integer;
begin
  Index := dxPPAttr.Bins.FindByName(Value);
  if Index <> -1 then
    SetOrdValue(dxPPAttr.Bins[Index].Value)
  else
    inherited SetValue(Value);
end;

procedure TdxPaperSourcePropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to dxPPAttr.Bins.Count - 1 do
    Proc(dxPPAttr.Bins[I].Name);
end;

{ TdxPageNumberFormatEditor }

function TdxPageNumberFormatsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TdxPageNumberFormatsPropertyEditor.GetValue: string;
begin
  Result := PageNumberFormats[GetOrdValue];
end;

procedure TdxPageNumberFormatsPropertyEditor.SetValue(const Value: string);
var
  I: Integer;
begin
  // case insensitive - PageNumberFormats.IndexOf(Value);
  for I := 0 to PageNumberFormats.Count - 1 do
    if AnsiCompareStr(PageNumberFormats[I], Value) = 0 then
    begin
      SetOrdValue(I);
      Exit;
    end;
  inherited SetValue(Value);
end;

procedure TdxPageNumberFormatsPropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to PageNumberFormats.Count - 1 do
    Proc(PageNumberFormats[I]);
end;


{ TdxDateFormatEditor }

procedure TdxDateFormatsPropertyEditor.Initialize;
begin
  inherited Initialize;
  FStrings := TStringList.Create;
  GetFormatedDateStrings(Now, DateFormats, FStrings);
end;

destructor TdxDateFormatsPropertyEditor.Destroy;
begin
  FStrings.Free;
  inherited Destroy;
end;

function TdxDateFormatsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TdxDateFormatsPropertyEditor.GetValue: string;
begin
  Result := FStrings[GetOrdValue];
end;

procedure TdxDateFormatsPropertyEditor.SetValue(const Value: string);
var
  Index: Integer;
begin
  Index := FStrings.IndexOf(Value);
  if Index <> -1 then
    SetOrdValue(Index)
  else
    inherited SetValue(Value);
end;

procedure TdxDateFormatsPropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to FStrings.Count - 1 do
    Proc(FStrings[I]);
end;


{ TdxTimeFormatEditor }

procedure TdxTimeFormatsPropertyEditor.Initialize;
begin
  inherited Initialize;
  FStrings := TStringList.Create;
  GetFormatedTimeStrings(Now, TimeFormats, FStrings);
end;

destructor TdxTimeFormatsPropertyEditor.Destroy;
begin
  FStrings.Free;
  inherited Destroy;
end;

function TdxTimeFormatsPropertyEditor.GetAttributes: TPropertyAttributes;
begin
  Result := [paReadOnly, paMultiSelect, paDialog, paValueList, paRevertable];
end;

function TdxTimeFormatsPropertyEditor.GetValue: string;
begin
  Result := FStrings[GetOrdValue];
end;

procedure TdxTimeFormatsPropertyEditor.SetValue(const Value: string);
var
  Index: Integer;
begin
  Index := FStrings.IndexOf(Value);
  if Index <> -1 then
    SetOrdValue(Index)
  else
    inherited SetValue(Value);
end;

procedure TdxTimeFormatsPropertyEditor.GetValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  for I := 0 to FStrings.Count - 1 do
    Proc(FStrings[I]);
end;

{$IFDEF DELPHI6}
{ TdxComponentPrinterSelectionEditor }

procedure TdxComponentPrinterSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('dxPSGlbl');
  Proc('dxPSUtl');
  Proc('dxPSEngn');
  Proc('dxPrnPg'); 
  Proc('dxBkgnd');
  Proc('dxWrap');
  Proc('dxPrnDev');
end;  

{ TdxPrintStyleManagerSelectionEditor }

procedure TdxPrintStyleManagerSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('dxPSGlbl');
  Proc('dxPSUtl');
  Proc('dxPrnPg');
  Proc('dxBkgnd');
  Proc('dxWrap');  
  Proc('dxPrnDev');
end;  

{ TdxPageSetupDialogSelectionEditor }

procedure TdxPageSetupDialogSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('dxPSGlbl');
  Proc('dxPSUtl');
  Proc('dxPrnPg');  
  Proc('dxBkgnd');
  Proc('dxWrap');
end;  

{ TdxPrintDialogSelectionEditor }

procedure TdxPrintDialogSelectionEditor.RequiresUnits(Proc: TGetStrProc);
begin
  Proc('dxPrnDev');
end;  

{$ENDIF}

procedure Register;
begin
  RegisterComponents(sdxPSComponentPage, 
    [TdxComponentPrinter, TdxPrintStyleManager, TdxPrintDialog, TdxPageSetupDialog, TdxPSEngineController]);
  RegisterNoIcon([TBasedxReportLink, TBasedxPrintStyle, TdxPSPrintStyle]);

  RegisterComponentEditor(TdxComponentPrinter, TdxComponentPrinterEditor);
  RegisterComponentEditor(TdxPrintStyleManager, TdxPrintStyleManagerEditor);
  RegisterComponentEditor(TBasedxReportLink, TdxReportLinkEditor);
  RegisterComponentEditor(TBasedxPrintStyle, TdxPrintStyleEditor);  
  RegisterComponentEditor(TdxPageSetupDialog, TdxPageSetupDialogEditor);
  RegisterComponentEditor(TdxPrintDialog, TdxPrintDialogEditor);
 {$IFDEF DELPHI5}
  RegisterPropertyEditor(TypeInfo(Integer), TBasedxPrintStyle, 'ImageIndex', 
    TdxPrintStyleImageIndexPropertyEditor);
 {$ENDIF}  
  RegisterPropertyEditor(TypeInfo(TdxPointWrapper), nil, '', TdxPointWrapperEditor);
  RegisterPropertyEditor(TypeInfo(TdxRectWrapper), nil, '', TdxRectWrapperEditor);
  
  RegisterPropertyEditor(TypeInfo(TComponent),
    TBasedxReportLink, 'Component', TdxReportLinkComponentPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer), 
    TBasedxReportLink, 'Index', TdxIndexPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer), 
    TBasedxPrintStyle, 'Index', TdxIndexPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Boolean),
    TBasedxReportLink, 'ShowDesigner', TdxReportLinkDesignerPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxPrinterPage),
    TBasedxReportLink, 'PrinterPage', TdxPrinterPagePropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxReportTitle), TBasedxReportLink,
    'ReportTitle', TdxReportTitlePropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer),
    TdxPrinterPage, 'DMPaper', TdxDMPaperPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer), TdxPrinterPage, 
    'PaperSource', TdxPaperSourcePropertyEditor);
    
  // unregistered property editors
  RegisterPropertyEditor(TypeInfo(string), TdxPreviewOptions, 'HelpFile', nil);
  RegisterPropertyEditor(TypeInfo(string), TdxPreviewOptions, 'RegistryPath', nil);
  RegisterPropertyEditor(TypeInfo(Boolean), TdxPreviewOptions, 'SavePosition', nil);
  RegisterPropertyEditor(TypeInfo(string), TBasedxReportLink, 'ReportTitleText', nil);
  RegisterPropertyEditor(TypeInfo(TdxReportTitleMode), TBasedxReportLink, 'ReportTitleMode', nil);  

  RegisterPropertyEditor(TypeInfo(string), TdxPSEngineController, 
    'RegistryPath', TdxRegistryPathPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxMeasurementUnits),
    TdxPrinterPage, 'MeasurementUnits', TdxCPMeasurementsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Boolean),
    TdxBackground, 'Effects', TdxBackgroundEffectsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TBrush), nil, '', TdxBrushPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TFont), TBasedxReportLink, '', TTTFontPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Boolean),         
    TBasedxPrintStyle, 'ShowPageSetupDlg', TdxShowPgsDlgPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxPrinterPage),
    TBasedxPrintStyle, 'PrinterPage', TdxPrinterPagePropertyEditor2);
  RegisterPropertyEditor(TypeInfo(Integer),
    TBasedxReportLink, 'DateFormat', TdxDateFormatsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer),
    TdxComponentPrinter, 'DateFormat', TdxDateFormatsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer),
    TBasedxReportLink, 'TimeFormat', TdxTimeFormatsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(Integer),
    TdxComponentPrinter, 'TimeFormat', TdxTimeFormatsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxPageNumberFormat),
    TBasedxReportLink, 'PageNumberFormat', TdxPageNumberFormatsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(TdxPageNumberFormat),
    TdxComponentPrinter, 'PageNumberFormat', TdxPageNumberFormatsPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TdxPageSetupDialog,
    'RegistryPath', TdxRegistryPathPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TdxPrintDialog,
    'RegistryPath', TdxRegistryPathPropertyEditor);
  RegisterPropertyEditor(TypeInfo(string), TdxComponentPrinter,
    'RegistryPath', TdxRegistryPathPropertyEditor);
 {$IFDEF DELPHI6}
  RegisterSelectionEditor(TCustomdxComponentPrinter, TdxComponentPrinterSelectionEditor); 
  RegisterSelectionEditor(TdxPrintStyleManager, TdxPrintStyleManagerSelectionEditor);
  RegisterSelectionEditor(TdxPageSetupDialog, TdxPageSetupDialogSelectionEditor);
  RegisterSelectionEditor(TdxPrintDialog, TdxPrintDialogSelectionEditor);
 {$ENDIF}   
end;

initialization
  sdxPrintingSystem := sdxPrintingSystem + Format('%d.%d', [dxPSVerMajor, dxPSVerMinor]);
  
{$IFDEF IDE_MENUBITMAPS}
  FBmpDesigner := TBitmap.Create;
  FBmpDesigner.LoadFromResourceName(hInstance, 'DESIGNER');
  FBmpDesigner.Transparent := True;
  FBmpNewEmpty := TBitmap.Create;
  FBmpNewEmpty.LoadFromResourceName(hInstance, 'ADDEMPTY');
  FBmpNewEmpty.Transparent := True;
  FBmpNew := TBitmap.Create;
  FBmpNew.LoadFromResourceName(hInstance, 'ADD');
  FBmpNew.Transparent := True;
  FBmpPrintPreview := TBitmap.Create;
  FBmpPrintPreview.LoadFromResourceName(hInstance, 'PREVIEW');
  FBmpPrintPreview.Transparent := True;
  FBmpPageBackground := TBitmap.Create;
  FBmpPageBackground.LoadFromResourceName(hInstance, 'BACKGROUND');
  FBmpPageBackground.Transparent := True;
  FBmpPrint := TBitmap.Create;
  FBmpPrint.LoadFromResourceName(hInstance, 'PRINTDIALOG');
  FBmpPrint.Transparent := True;
  FBmpPageSetup := TBitmap.Create;
  FBmpPageSetup.LoadFromResourceName(hInstance, 'PAGESETUPDIALOG');
  FBmpPageSetup.Transparent := True;
  FBmpItems := TBitmap.Create;
  FBmpItems.LoadFromResourceName(hInstance, 'PROPERTY');
  FBmpItems.Transparent := True;
  FBmpWEB := TBitmap.Create;
  FBmpWEB.LoadFromResourceName(hInstance, 'WEB');
  FBmpWEB.Transparent := True;
  
finalization
  FBmpWEB.Free;
  FBmpItems.Free;
  FBmpPrint.Free;
  FBmpPageSetup.Free;
  FBmpPageBackground.Free;
  FBmpPrintPreview.Free;  
  FBmpNew.Free;
  FBmpNewEmpty := TBitmap.Create;
  FBmpDesigner.Free;
{$ENDIF}

end.

