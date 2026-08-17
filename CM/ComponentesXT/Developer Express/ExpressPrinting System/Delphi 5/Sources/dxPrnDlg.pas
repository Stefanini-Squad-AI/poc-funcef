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

unit dxPrnDlg;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Registry, ExtCtrls, StdCtrls, Menus, Buttons, {$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxExtCtrls, dxPSForm, dxPSESys, dxPSGlbl, dxPgsDlg, dxPrnDev;
             
type
  TdxPageNumbers = (pnAll, pnEven, pnOdd);
  TdxPageRanges = (prAll, prCurrent, prRange, prSelection);
  TdxPrintDlgButtonKind = (pdbPrinterProperties, pdbNetwork, pdbPreview, 
    pdbPageSetup, pdbDefineStyles, pdbStyleOptions, pdbHelp);
  TdxPrintDlgButtons = set of TdxPrintDlgButtonKind;
  TdxPrintDlgOption = (pdoPrintToFile, pdoAllPages, pdoCurrentPage, pdoSelection, 
    pdoPageRange, pdoPrintStyles);
  TdxPrintDlgOptions = set of TdxPrintDlgOption;

const
  pdbAll = [Low(TdxPrintDlgButtonKind)..High(TdxPrintDlgButtonKind)];
  pdbDefault = 
    [pdbPrinterProperties, pdbNetwork, pdbPreview, pdbPageSetup, pdbDefineStyles, pdbStyleOptions];
  pdoAll = [Low(TdxPrintDlgOption)..High(TdxPrintDlgOption)];
  pdoDefaultOptionsEnabled = [pdoPrintToFile, pdoAllPages, pdoPageRange];
  pdoDefaultOptionsVisible = [pdoPrintToFile, pdoAllPages, pdoCurrentPage, pdoPageRange];

type
  TdxPageSetupEvent = procedure(Sender: TObject; var ADone: Boolean;
    APreviewBtnClicked, APrintBtnClicked: PBoolean) of object;

  PdxPrintDlgEvents = ^TdxPrintDlgEvents;
  TdxPrintDlgEvents = packed record
    OnClose: TNotifyEvent; {called on the OnHide event}
    OnPageSetup: TdxPageSetupEvent;
    OnShow: TNotifyEvent;
  end;

  PdxPrintDialogData = ^TdxPrintDialogData;
  TdxPrintDialogData = packed record
    Copies: Integer;
    Collate: Boolean;
    FileList: TStrings;
    FileName: string;
    MaxRange: Integer;
    MinRange: Integer;
    PageCount: Integer;
    PageNums: TdxPageNumbers;
    PageRanges: TdxPageRanges;
    Pages: string;
    PrintToFile: Boolean;
    StyleManager: TdxPrintStyleManager;
  end;

  PdxPrintDlgData = ^TdxPrintDlgData;
  TdxPrintDlgData = packed record
    DialogData: PdxPrintDialogData;
    Title: string;
    HelpContext: THelpContext;
    ButtonsEnabled: TdxPrintDlgButtons;
    ButtonsVisible: TdxPrintDlgButtons;
    OptionsEnabled: TdxPrintDlgOptions;
    OptionsVisible: TdxPrintDlgOptions;
    Events: PdxPrintDlgEvents;
    IsCheckUserInput: Boolean;
    PreviewBtnClicked: Boolean;
  end;


  TdxPrintDialog = class(TComponent)
  private
    FButtonsEnabled: TdxPrintDlgButtons;
    FButtonsVisible: TdxPrintDlgButtons;
    FDialogData: TdxPrintDialogData;
    FHelpContext: THelpContext;
    FOptionsEnabled: TdxPrintDlgOptions;    
    FOptionsVisible: TdxPrintDlgOptions;    
    FPreviewBtnClicked: Boolean;
    FPrintBtnClicked: Boolean;
    FTitle: string;
    FUseFileList: Boolean;
    
    FOnClose: TNotifyEvent;
    FOnPageSetup: TdxPageSetupEvent;
    FOnShow: TNotifyEvent;

    function GetCopies: Integer;
    function GetCollate: Boolean;
    function GetFileList: TStrings;
    function GetFileName: string;
    function GetMaxRange: Integer;
    function GetMinRange: Integer;
    function GetPageCount: Integer;
    function GetPageNums: TdxPageNumbers;
    function GetPageRanges: TdxPageRanges;
    function GetPages: string;
    function GetPrintToFile: Boolean;
    function GetStyleManager: TdxPrintStyleManager;
    function IsTitleStored: Boolean;
    procedure SetCopies(Value: Integer);
    procedure SetCollate(Value: Boolean);
    procedure SetFileList(Value: TStrings);
    procedure SetFileName(const Value: string);
    procedure SetMaxRange(Value: Integer);
    procedure SetMinRange(Value: Integer);
    procedure SetPageCount(Value: Integer);
    procedure SetPageNums(Value: TdxPageNumbers);
    procedure SetPageRanges(Value: TdxPageRanges);
    procedure SetPages(const Value: string);
    procedure SetPrintToFile(Value: Boolean);
    procedure SetStyleManager(Value: TdxPrintStyleManager);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    procedure SetMinMaxRanges(AMinRange, AMaxRange: Integer);
    
    property DialogData: TdxPrintDialogData read FDialogData;
    property FileList: TStrings read GetFileList write SetFileList;
    property PageCount: Integer read GetPageCount write SetPageCount;
    property PreviewBtnClicked: Boolean read FPreviewBtnClicked;
    property PrintBtnClicked: Boolean read FPrintBtnClicked;
  published
    property ButtonsEnabled: TdxPrintDlgButtons read FButtonsEnabled write FButtonsEnabled 
      default [pdbPrinterProperties, pdbNetwork, pdbPreview, pdbPageSetup, pdbDefineStyles, pdbStyleOptions];
    property ButtonsVisible: TdxPrintDlgButtons read FButtonsVisible write FButtonsVisible 
      default [pdbPrinterProperties, pdbNetwork, pdbPreview, pdbPageSetup, pdbDefineStyles, pdbStyleOptions];
    property Collate: Boolean read GetCollate write SetCollate
      default False;
    property Copies: Integer read GetCopies write SetCopies
      default 1;
    property FileName: string read GetFileName write SetFileName;
    property HelpContext: THelpContext read FHelpContext write FHelpContext;
    property MaxRange: Integer read GetMaxRange write SetMaxRange
      default 1;
    property MinRange: Integer read GetMinRange write SetMinRange
      default 1;
    property OptionsEnabled: TdxPrintDlgOptions read FOptionsEnabled
      write FOptionsEnabled 
      default [pdoPrintToFile, pdoAllPages, pdoPageRange];
    property OptionsVisible: TdxPrintDlgOptions read FOptionsVisible
      write FOptionsVisible 
      default [pdoPrintToFile, pdoAllPages, pdoCurrentPage, pdoPageRange];
    property PageNums: TdxPageNumbers read GetPageNums write SetPageNums
      default pnAll;
    property PageRanges: TdxPageRanges read GetPageRanges write SetPageRanges
      default prAll;
    property Pages: string read GetPages write SetPages;
    property PrintToFile: Boolean read GetPrintToFile write SetPrintToFile
      default False;
    property StyleManager: TdxPrintStyleManager read GetStyleManager write SetStyleManager;
    property Title: string read FTitle write FTitle 
      stored IsTitleStored;
    property UseFileList: Boolean read FUseFileList write FUseFileList
      default False;

    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnPageSetup: TdxPageSetupEvent read FOnPageSetup write FOnPageSetup;
    property OnShow: TNotifyEvent read FOnShow write FOnShow;
  end;


  TdxfmPrintDialog = class(TCustomdxPSForm)
    ilPrinters: TImageList;
    Panel1: TPanel;
    btnPreview: TBitBtn;
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    pnlPrintStyles: TPanel;
    gbxPrintStyles: TGroupBox;
    lbxPrintStyles: TListBox;
    btnPageSetup2: TButton;
    btnDefineStyles: TButton;
    btnStyleOptions: TButton;
    pmPrintStyles: TPopupMenu;
    miPageSetup: TMenuItem;
    miStyleOptions: TMenuItem;
    miDefineStyles: TMenuItem;
    miLine1: TMenuItem;
    pnlMiddle: TPanel;
    gbxPageRange: TGroupBox;
    lblDescription: TLabel;
    rbtnAllPages: TRadioButton;
    rbtnCurrentPage: TRadioButton;
    rbtnPageRanges: TRadioButton;
    edPageRanges: TEdit;
    rbtnSelection: TRadioButton;
    gbxCopies: TGroupBox;
    chbxCollate: TCheckBox;
    pnlTop: TPanel;
    gbxPrinter: TGroupBox;
    lblName: TLabel;
    lblStatus: TLabel;
    lblType: TLabel;
    lblWhere: TLabel;
    lblComment: TLabel;
    lStatus: TLabel;
    lType: TLabel;
    lWhere: TLabel;
    lComment: TLabel;
    cbxPrinters: TComboBox;
    btnPrinterProperties: TButton;
    btnNetwork: TButton;
    pnlPrintToFile: TPanel;
    chbxPrintToFile: TCheckBox;
    cbxFileName: TComboBox;
    btnBrowse: TButton;
    btnPageSetup: TBitBtn;
    lblNumberOfCopies: TLabel;
    bvlCopiesHolder: TBevel;
    lblNumberOfPages: TLabel;
    cbxNumberOfPages: TComboBox;
    bvlPRWarningHolder: TBevel;
    pbxCollate: TPaintBox;
    
    procedure chbxCollateClick(Sender: TObject);
    procedure btnPrinterPropertiesClick(Sender: TObject);
    procedure cbxPrintersChange(Sender: TObject);
    procedure chbxPrintToFileClick(Sender: TObject);
    procedure edPageRangesChange(Sender: TObject);
    procedure cbxNumberOfPagesChange(Sender: TObject);
    procedure rbtnPagesClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edPageRangesExit(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure btnPageSetupClick(Sender: TObject);
    procedure edPageRangesKeyPress(Sender: TObject; var KEY: Char);
    procedure lblNumberOfPagesClick(Sender: TObject);
    procedure lblNumberOfCopiesClick(Sender: TObject);
    procedure lblNameClick(Sender: TObject);
    procedure btnNetworkClick(Sender: TObject);
    procedure cbxPrintersDrawItem(Control: TWinControl; index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure seCopiesChange(Sender: TObject);
    procedure seCopiesExit(Sender: TObject);
    procedure PageSetup2Click(Sender: TObject);
    procedure lbxPrintStylesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbxPrintStylesClick(Sender: TObject);
    procedure DefineStylesClick(Sender: TObject);
    procedure StyleOptionsClick(Sender: TObject);    
    procedure pmPrintStylesPopup(Sender: TObject);
    procedure cbxFileNameExit(Sender: TObject);
    procedure cbxFileNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure pbxCollatePaint(Sender: TObject);
    procedure pbxCollateDblClick(Sender: TObject);
  private
    FbmpPRWarning: TBitmap;
    FControlsUpdating: Boolean;
    FDialogData: TdxPrintDialogData;
    FGlyphs: array[Boolean] of TBitmap;
    FIsCheckUserInput: Boolean;
    FModified: Boolean;
    FSubscriber: TdxEventSubscriber;
    FPreviewBtnClicked: Boolean;
    FPrintBtnClicked: Boolean;
    FSaveDialogData: TdxPrintDialogData;
    FseCopies: TdxPSSpinEdit;
    FbaPRWarning: TdxPSBitmapAnimator;
    FPrintStylesVisibled: Boolean;

    FOnClose: TNotifyEvent;
    FOnPageSetup: TdxPageSetupEvent;
    FOnShow: TNotifyEvent;
    
    function CheckFileName(const FileName: string): Boolean;
    procedure CheckModified;
    function CheckPageRanges: Boolean;    
    function CheckUserInput: Boolean;
    procedure CollectPrinters;
    procedure ConnectToPrinterDlg;
    procedure CreateControls;
    procedure DocumentPropertiesDlg;
    procedure DrawCollatedPages(DC: hDC; const ADrawRect: TRect; ACollate: Boolean);    
    procedure FillStyles;
    function GetFileName(const S: string): string;
    procedure LoadStrings;    
    procedure PreparePRWarningBitmap(const S: string);
    procedure ReleasePrinterInfos;
    procedure SavePrintDialogData;
    procedure SetActiveControl;
    procedure SetupDialog(const APrintDlgData: TdxPrintDlgData);
    procedure StartSettings;
    procedure StyleListChanged(Sender: TObject);    
    procedure UpdateControlsState;
    procedure UpdatePrinterInfos;
    procedure CMDialogChar(var message: TCMDialogChar); message CM_DIALOGCHAR;
  protected
    procedure CreateWnd; override;
    procedure DoHide; override;
    procedure DoShow; override;
    
    procedure DoPageSetup; dynamic;
    procedure UpdatePrinters;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromRegistry(const APath: string); override;
    procedure SaveToRegistry(const APath: string); override;
    
    function Execute: Boolean;
    procedure ShowPrintStyles(AShow: Boolean);

    property PreviewBtnClicked: Boolean read FPreviewBtnClicked;
    property OnPageSetup: TdxPageSetupEvent read FOnPageSetup write FOnPageSetup;
  end;

function dxPrintDialog(const AData: PdxPrintDlgData): Boolean;

implementation

{$R *.DFM}

uses
{$IFDEF DELPHI6} Variants, {$ENDIF} WinSpool, MATH,
  dxPSRes, dxPSPopupMan, dxPSEngn, dxPSEvnt, dxPSImgs, dxPSUtl;

type
  PIntArray = ^TIntArray;
  TIntArray = array[0..0] of Integer;  

const
  dxSizeReserv = 1000;

type
  TdxPrinterInfos = class(TObject)
  private
    FIsDefault: Boolean;
    FIsNetwork: Boolean;
  public
    constructor Create(AIsNetwork, AIsDefault: Boolean);

    property IsDefault: Boolean read FIsDefault write FIsDefault;
    property IsNetwork: Boolean read FIsNetwork write FIsNetwork;
  end;


{ TdxPrinterInfos }

constructor TdxPrinterInfos.Create(AIsNetwork, AIsDefault: Boolean);
begin
  inherited Create;
  FIsDefault := AIsDefault;
  FIsNetwork := AIsNetwork;
end;

function dxPrintDialog(const AData: PdxPrintDlgData): Boolean;
var
  Dialog: TdxfmPrintDialog;
begin
  Result := False;
  if (AData = nil) or (AData^.DialogData = nil) then 
    Exit;
  Dialog := TdxfmPrintDialog.Create(nil);
  try
    Dialog.SetupDialog(AData^);
    Result := Dialog.Execute;    
    if Result then
      AData^.DialogData^ := Dialog.FDialogData
    else
      AData^.DialogData^ := Dialog.FSaveDialogData;
    AData^.PreviewBtnClicked := Dialog.PreviewBtnClicked;
  finally
    Dialog.Free;
  end;
end;


{ TdxPrintDialog }

constructor TdxPrintDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FillChar(FDialogData, SizeOf(TdxPrintDialogData), 0);
  FDialogData.Copies := 1;
  FDialogData.Collate := False;
  FDialogData.FileList := TStringList.Create;
  FDialogData.FileName := '';
  FDialogData.MaxRange := 1;
  FDialogData.MinRange := 1;
  FDialogData.PageCount := 0;
  FDialogData.PageNums := pnAll;
  FDialogData.PageRanges := prAll;
  FDialogData.Pages := '';
  FDialogData.PrintToFile := False;
  FDialogData.StyleManager := nil;

  FButtonsEnabled := pdbDefault;
  FOptionsEnabled := pdoDefaultOptionsEnabled;
  FHelpContext := 0;
  FPreviewBtnClicked := False;
  FPrintBtnClicked := False;

  FTitle := sdxPrintDialogCaption;
  FUseFileList := False;
  FButtonsVisible := pdbDefault;
  FOptionsVisible := pdoDefaultOptionsVisible;
end;

destructor TdxPrintDialog.Destroy;
begin
  FDialogData.FileList.Free;
  inherited Destroy;
end;

procedure TdxPrintDialog.AssignTo(Dest: TPersistent);

  procedure XorOption(var AOptions: TPrintDialogOptions; AItem: TPrintDialogOption; AValue: Boolean);
  begin
    if AValue then 
      AOptions := AOptions + [AItem]
    else  
      AOptions := AOptions - [AItem];
  end;
  
var
  Dst: Dialogs.TPrintDialog absolute Dest;
  Options: TPrintDialogOptions;
  V: Variant;
  P: PIntArray;
  C: Integer;
begin
  if Dest is Dialogs.TPrintDialog then
  begin
    Dst.Collate := Collate;
    Dst.Copies := Copies;
    Dst.MinPage := MinRange;
    Dst.MaxPage := MaxRange;
    try
      V := MakePageIndexes(Pages);
      P := varArrayLock(V);
      if P <> nil then 
      try
        with TVarData(V).VArray^.Bounds[0] do
          C := LowBound + ElementCount;
      {$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
        Dst.FromPage := MinIntValue(Slice(P^, C));
        Dst.ToPage := MaxIntValue(Slice(P^, C));
      {$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}      
      finally
        varArrayUnLock(V);
      end;
    except
      Dst.FromPage := 1;
      Dst.ToPage := 1;
    end;

    Options := Dst.Options;
    XorOption(Options, poPrintToFile, pdoPrintToFile in OptionsVisible);
    XorOption(Options, poDisablePrintToFile, pdoPrintToFile in OptionsEnabled);
    XorOption(Options, poPageNums, 
      (pdoPageRange in OptionsVisible) and (pdoPageRange in OptionsEnabled));
    XorOption(Options, poSelection, 
      (pdoSelection in OptionsVisible) and (pdoSelection in OptionsEnabled));
    XorOption(Options, poHelp, 
      (pdbHelp in ButtonsVisible) and (pdbHelp in ButtonsEnabled));
    Dst.Options := Options;

    Dst.PrintToFile := PrintToFile;

    if PageRanges = prSelection then
      Dst.PrintRange := Dialogs.prAllPages
    else
      Dst.PrintRange := TPrintRange(PageRanges);
  end;
end;

procedure TdxPrintDialog.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (AComponent = StyleManager) and (Operation = opRemove) then
    StyleManager := nil;
end;

function TdxPrintDialog.Execute: Boolean;
var
  APrintDlgData: TdxPrintDlgData;
  AEvents: TdxPrintDlgEvents;
  ADialogData: TdxPrintDialogData;
begin
  if dxPrintDevice.Printers.Count = 0 then
  begin
    MessageError(sdxPrintDialogNoPrinters);
    Result := False;
    Exit;
  end;
  FillChar(APrintDlgData, SizeOf(TdxPrintDlgData), 0);
  FillChar(AEvents, SizeOf(TdxPrintDlgEvents), 0);
  FillChar(ADialogData, SizeOf(TdxPrintDlgEvents), 0);
  try
    ADialogData.Copies := Copies;
    ADialogData.Collate := Collate;
    if UseFileList then
    begin
      ADialogData.FileList := TStringList.Create;
      ADialogData.FileList.Assign(FileList);
    end;
    ADialogData.FileName := FileName;
    ADialogData.MaxRange := MaxRange;
    ADialogData.MinRange := MinRange;
    ADialogData.PageCount := PageCount;
    ADialogData.PageNums := PageNums;
    ADialogData.PageRanges := PageRanges;
    ADialogData.Pages := Pages;
    ADialogData.PrintToFile := PrintToFile;
    ADialogData.StyleManager := StyleManager;

    APrintDlgData.DialogData := @ADialogData;
    APrintDlgData.HelpContext := HelpContext;
    APrintDlgData.Title := Title;
    APrintDlgData.IsCheckUserInput := not (csDesigning in ComponentState);
{    
    if (csDesigning in ComponentState) then
    begin
      APrintDlgData.OptionsEnabled := pdoAll;
      APrintDlgData.OptionsVisible := pdoAll - [pdoPrintStyles];
      APrintDlgData.ButtonsEnabled := pdbAll;
      APrintDlgData.ButtonsVisible := pdbAll - [pdbPageSetup, pdbPreview];
    end
    else
}    
    begin
      APrintDlgData.OptionsEnabled := OptionsEnabled;
      APrintDlgData.OptionsVisible := OptionsVisible;
      APrintDlgData.ButtonsEnabled := ButtonsEnabled;
      APrintDlgData.ButtonsVisible := ButtonsVisible;
    end;

    AEvents.OnClose := OnClose;
    AEvents.OnPageSetup := OnPageSetup;
    AEvents.OnShow := OnShow;
    APrintDlgData.Events := @AEvents;

    Result := dxPrintDialog(@APrintDlgData);
    FPreviewBtnClicked := APrintDlgData.PreviewBtnClicked;
  finally
    if ADialogData.FileList <> nil then
      ADialogData.FileList.Free;
  end;
end;

procedure TdxPrintDialog.SetMinMaxRanges(AMinRange, AMaxRange: Integer);
begin
  if AMinRange < 1 then AMinRange := 1;
  if AMaxRange < 1 then AMaxRange := 1;  
  if AMaxRange < AMinRange then AMaxRange := AMinRange;
  FDialogData.MaxRange := AMinRange;
  FDialogData.MaxRange := AMaxRange;
end;

procedure TdxPrintDialog.SetMaxRange(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if FDialogData.MaxRange <> Value then
  begin
    if Value < FDialogData.MinRange then Value := FDialogData.MinRange;
    FDialogData.MaxRange := Value;
  end;
end;

procedure TdxPrintDialog.SetMinRange(Value: Integer);
begin
  if Value < 1 then Value := 1;
  if FDialogData.MinRange <> Value then
  begin
    if Value > FDialogData.MaxRange then Value := FDialogData.MaxRange;
    FDialogData.MinRange := Value;
  end;
end;

procedure TdxPrintDialog.SetStyleManager(Value: TdxPrintStyleManager);
begin
  if FDialogData.StyleManager <> Value then
  begin
    FDialogData.StyleManager := Value;
    if StyleManager <> nil then     
      StyleManager.FreeNotification(Self);
  end;
end;

procedure TdxPrintDialog.SetPageRanges(Value: TdxPageRanges);
begin
  if FDialogData.PageRanges <> Value then
  begin
    case Value of
      prAll:
        begin
          OptionsVisible := OptionsVisible + [pdoAllPages];
          OptionsEnabled := OptionsEnabled + [pdoAllPages];
        end;
      prCurrent:
        begin
          OptionsVisible := OptionsVisible + [pdoCurrentPage];
          OptionsEnabled := OptionsEnabled + [pdoCurrentPage];
        end;
      prRange:
        begin
          OptionsVisible := OptionsVisible + [pdoPageRange];
          OptionsEnabled := OptionsEnabled + [pdoPageRange];
        end;
      prSelection:
        begin
          OptionsVisible := OptionsVisible + [pdoSelection];
          OptionsEnabled := OptionsEnabled + [pdoSelection];
        end;
    end;
    FDialogData.PageRanges := Value;
  end;
end;

procedure TdxPrintDialog.SetPageCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  FDialogData.PageCount := Value;
end;

function TdxPrintDialog.GetFileList: TStrings;
begin
  Result := FDialogData.FileList;
end;

procedure TdxPrintDialog.SetFileList(Value: TStrings);
begin
  FDialogData.FileList.Assign(Value);
end;

function TdxPrintDialog.GetPageCount: Integer;
begin
  Result := FDialogData.PageCount;
end;

function TdxPrintDialog.GetCollate: Boolean;
begin
  Result := FDialogData.Collate;
end;

function TdxPrintDialog.GetCopies: Integer;
begin
  Result := FDialogData.Copies;
end;

function TdxPrintDialog.GetFileName: string;
begin
  Result := FDialogData.FileName;
end;

function TdxPrintDialog.GetMaxRange: Integer;
begin
  Result := FDialogData.MaxRange;
end;

function TdxPrintDialog.GetMinRange: Integer;
begin
  Result := FDialogData.MinRange;
end;

function TdxPrintDialog.GetPages: string;
begin
  Result := FDialogData.Pages;
end;

function TdxPrintDialog.GetPageNums: TdxPageNumbers;
begin
  Result := FDialogData.PageNums;
end;

function TdxPrintDialog.GetPageRanges: TdxPageRanges;
begin
  Result := FDialogData.PageRanges;
end;

function TdxPrintDialog.GetStyleManager: TdxPrintStyleManager;
begin
  Result := FDialogData.StyleManager;
end;

function TdxPrintDialog.GetPrintToFile: Boolean;
begin
  Result := FDialogData.PrintToFile;
end;

procedure TdxPrintDialog.SetCollate(Value: Boolean);
begin
  FDialogData.Collate := Value;
end;

procedure TdxPrintDialog.SetCopies(Value: Integer);
begin
  FDialogData.Copies := Value;
end;

procedure TdxPrintDialog.SetFileName(const Value: string);
begin
  FDialogData.FileName := Value;
end;

procedure TdxPrintDialog.SetPages(const Value: string);
begin
  FDialogData.Pages := Value;
end;

procedure TdxPrintDialog.SetPageNums(Value: TdxPageNumbers);
begin
  FDialogData.PageNums := Value;
end;

procedure TdxPrintDialog.SetPrintToFile(Value: Boolean);
begin
  FDialogData.PrintToFile := Value;
end;

function TdxPrintDialog.IsTitleStored: Boolean;
begin
  Result := AnsiCompareStr(FTitle, sdxPrintDialogCaption) <> 0; 
end;

{ utilities }
function GetStatusString(Status: DWORD): string;
begin
  case Status of
    0:
      Result := sdxPrintDialogPSReady;
    PRINTER_STATUS_PAUSED:
      Result := sdxPrintDialogPSPaused;
    PRINTER_STATUS_PENDING_DELETION:
      Result := sdxPrintDialogPSPendingDeletion;
    PRINTER_STATUS_BUSY:
      Result := sdxPrintDialogPSBusy;
    PRINTER_STATUS_DOOR_OPEN:
      Result := sdxPrintDialogPSDoorOpen;
    PRINTER_STATUS_ERROR:
      Result := sdxPrintDialogPSError;
    PRINTER_STATUS_INITIALIZING:
      Result := sdxPrintDialogPSInitializing;
    PRINTER_STATUS_IO_ACTIVE:
      Result := sdxPrintDialogPSIOActive;
    PRINTER_STATUS_MANUAL_FEED:
      Result := sdxPrintDialogPSManualFeed;
    PRINTER_STATUS_NO_TONER:
      Result := sdxPrintDialogPSNoToner;
    PRINTER_STATUS_NOT_AVAILABLE:
      Result := sdxPrintDialogPSNotAvailable;
    PRINTER_STATUS_OFFLINE:
      Result := sdxPrintDialogPSOFFLine;
    PRINTER_STATUS_OUT_OF_MEMORY:
      Result := sdxPrintDialogPSOutOfMemory;
    PRINTER_STATUS_OUTPUT_BIN_FULL:
      Result := sdxPrintDialogPSOutBinFull;
    PRINTER_STATUS_PAGE_PUNT:
      Result := sdxPrintDialogPSPagePunt;
    PRINTER_STATUS_PAPER_JAM:
      Result := sdxPrintDialogPSPaperJam;
    PRINTER_STATUS_PAPER_OUT:
      Result := sdxPrintDialogPSPaperOut;
    PRINTER_STATUS_PAPER_PROBLEM:
      Result := sdxPrintDialogPSPaperProblem;
    PRINTER_STATUS_PRINTING:
      Result := sdxPrintDialogPSPrinting;
    PRINTER_STATUS_PROCESSING:
      Result := sdxPrintDialogPSProcessing;
    PRINTER_STATUS_TONER_LOW:
      Result := sdxPrintDialogPSTonerLow;
    PRINTER_STATUS_USER_INTERVENTION:
      Result := sdxPrintDialogPSUserIntervention;
    PRINTER_STATUS_WAITING:
      Result := sdxPrintDialogPSWaiting;
    PRINTER_STATUS_WARMING_UP:
      Result := sdxPrintDialogPSWarningUp;
  else
    Result := '';
  end;
end;


{ TfmdxPrintDialog }

constructor TdxfmPrintDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxPSGlbl.dxhcPrintDlg;
  FillChar(FDialogData, SizeOf(TdxPrintDialogData), 0);
  FillChar(FSaveDialogData, SizeOf(TdxPrintDialogData), 0);
  CreateControls;
  FGlyphs[False] := TBitmap.Create;
  FGlyphs[True] := TBitmap.Create;
  ilPrinters.GetBitmap(7, FGlyphs[False]);
  ilPrinters.GetBitmap(8, FGlyphs[True]);
{$IFDEF DELPHI4}
  pmPrintStyles.Images := ilPrinters;
  miPageSetup.ImageIndex := 4;
  miDefineStyles.ImageIndex := 5;
{$ENDIF}
  FbmpPRWarning := TBitmap.Create;
  FSubscriber := TdxStyleListChangedSubscriber.Create([TdxSMStyleListChangedEvent]);
  TdxStyleListChangedSubscriber(FSubscriber).OnStyleListChanged := StyleListChanged;
  dxPSRegisterControlWithPopup(lbxPrintStyles);
end;

destructor TdxfmPrintDialog.Destroy;
begin
  dxPSUnregisterControlWithPopup(lbxPrintStyles);
  FSubscriber.Free;
  FbmpPRWarning.Free;
  FGlyphs[True].Free;
  FGlyphs[False].Free;
  inherited Destroy;
end;

procedure TdxfmPrintDialog.FormDestroy(Sender: TObject);
begin
  ReleasePrinterInfos;
end;

procedure TdxfmPrintDialog.CMDialogChar(var message: TCMDialogChar);
begin
  inherited;
  if IsAccel(message.CharCode, gbxPrintStyles.Caption) then
  begin
    ActiveControl := lbxPrintStyles;
    message.Result := 1;
  end;  
end;

procedure TdxfmPrintDialog.StyleListChanged(Sender: TObject);
begin
  if Sender = FDialogData.StyleManager then 
  begin
    FillStyles;
    UpdateControlsState;
  end;  
end;

procedure TdxfmPrintDialog.ReleasePrinterInfos;
var
  Obj: TObject;
  I: Integer;
begin
  for I := 0 to cbxPrinters.Items.Count - 1 do
  begin
    Obj := cbxPrinters.Items.Objects[I];
    if Obj <> nil then Obj.Free;
  end;
end;

function TdxfmPrintDialog.Execute: Boolean;
begin
  StartSettings;
  ShowPrintStyles(FPrintStylesVisibled and (FDialogData.StyleManager <> nil));
  if FDialogData.StyleManager <> nil then
    TdxStyleListChangedSubscriber(FSubscriber).StyleListChanged(FDialogData.StyleManager);
  SetActiveControl;

  Result := ShowModal = mrOk;
end;

procedure TdxfmPrintDialog.LoadStrings;
var
  Ind: Integer;
begin
  Caption := sdxPrintDialogCaption;
  gbxPrinter.Caption := sdxPrintDialogPrinter;
  lblName.Caption :=  sdxPrintDialogName;
  lblStatus.Caption := sdxPrintDialogStatus;
  lblType.Caption := sdxPrintDialogType;
  lblWhere.Caption := sdxPrintDialogWhere;
  lblComment.Caption := sdxPrintDialogComment;
  chbxPrintToFile.Caption := sdxPrintDialogPrintToFile;
  gbxPageRange.Caption := sdxPrintDialogPageRange;
  rbtnAllPages.Caption := sdxPrintDialogAll;
  rbtnCurrentPage.Caption := sdxPrintDialogCurrentPage;
  rbtnSelection.Caption := sdxPrintDialogSelection;
  rBtnPageRanges.Caption := sdxPrintDialogPages;
  lblDescription.Caption := sdxPrintDialogRangeLegend;
  gbxCopies.Caption := sdxPrintDialogCopies;
  
  lblNumberOfPages.Caption := sdxPrintDialogNumberOfPages;
  Ind := cbxNumberOfPages.ItemIndex;
  with cbxNumberOfPages.Items do
  begin
    BeginUpdate;
    try
      Clear;
      Add(sdxPrintDialogAllPages);
      Add(sdxPrintDialogEvenPages);
      Add(sdxPrintDialogOddPages);
    finally
      EndUpdate;
    end;
  end;
  cbxNumberOfPages.ItemIndex := Ind;

  lblNumberOfCopies.Caption := sdxPrintDialogNumberOfCopies;
  chbxCollate.Caption := sdxPrintDialogCollateCopies;

  btnPrinterProperties.Caption := sdxBtnProperties;
  btnNetwork.Caption := sdxBtnNetwork;
  btnBrowse.Caption := sdxBtnBrowse;
  btnPageSetup.Caption := sdxBtnPageSetup;
  btnPreview.Caption := sdxBtnPreview;
  btnOK.Caption := DropEndEllipsis(sdxBtnPrint);
  btnCancel.Caption := sdxBtnCancel;
  btnHelp.Caption := sdxBtnHelp;
                         
  gbxPrintStyles.Caption := sdxPrintDialogPrintStyles;
  btnPageSetup2.Caption := sdxBtnPageSetup;
  btnStyleOptions.Caption := sdxBtnStyleOptions;
  btnDefineStyles.Caption := sdxBtnDefinePrintStyles;
  miPageSetup.Caption := sdxBtnPageSetup;
  miStyleOptions.Caption := sdxBtnStyleOptions;
  miDefineStyles.Caption := sdxBtnDefinePrintStyles;
end;

procedure TdxfmPrintDialog.UpdateControlsState;
const
  EditColor: array[Boolean] of TColor = (clBtnFace, clWindow);
begin
  with chbxPrintToFile do
  begin
    cbxFileName.Enabled := Enabled and Visible and Checked;
    cbxFileName.Color := EditColor[Checked];
    btnBrowse.Enabled := cbxFileName.Enabled;
  end;
  with lbxPrintStyles do
  begin
    btnPageSetup2.Enabled := ItemIndex <> -1;
    btnStyleOptions.Enabled := (ItemIndex <> -1) and 
      TBasedxPrintStyle(Items.Objects[ItemIndex]).OptionsDialogExists;
    btnStyleOptions.Visible := btnStyleOptions.Enabled;
  end;
  btnOK.Enabled := (dxPrintDevice.Printers.Count <> 0) or chbxPrintToFile.Checked;
end;

procedure TdxfmPrintDialog.CheckModified;
begin
  if not FModified then FModified := True;
  UpdateControlsState;
end;
  
procedure TdxfmPrintDialog.PreparePRWarningBitmap(const S: string);
const 
  uFormat: array[Boolean] of UINT = 
    (DT_NOPREFIX or DT_CENTER or DT_WORDBREAK, 
     DT_NOPREFIX or DT_CENTER or DT_SINGLELINE or DT_VCENTER);
  CalcFormat = 
     DT_CALCRECT or DT_SINGLELINE or DT_NOPREFIX or DT_CENTER or DT_VCENTER;
var 
  R, R2: TRect;
  DC: hDC;
begin
  R := Rect(0, 0, bvlPRWarningHolder.Width, bvlPRWarningHolder.Height);
  FbmpPRWarning.Width := R.Right - R.Left;
  FbmpPRWarning.Height := R.Bottom - R.Top;
  DC := FbmpPRWarning.Canvas.Handle;
  FrameRect(DC, R, GetSysColorBrush(COLOR_BTNSHADOW));
  InflateRect(R, -1, -1);  
  FillRect(DC, R, HBRUSH(COLOR_INFOBK + 1));
  ilPrinters.Draw(FbmpPRWarning.Canvas, 2, 
    R.Top + (R.Bottom - R.Top - ilPrinters.Height) div 2, 6);
  InflateRect(R, -1, -1);
  R.Left := 2 + R.Left + ilPrinters.Width + 2;
  SetBkMode(DC, TRANSPARENT);
  SetTextColor(DC, GetSysColor(COLOR_INFOTEXT));
  R2 := R;
  DrawText(DC, PChar(S), Length(S), R, CalcFormat);
  DrawText(DC, PChar(S), Length(S), R2, uFormat[(R.Right - R.Left) < (R2.Right - R2.Left)]);
  FbaPRWarning.Bitmap := FbmpPRWarning;
end;

function IsNetworkPresent: Boolean;
begin
  Result := GetSystemMetrics(SM_NETWORK) and $01 = $01;
end;

procedure TdxfmPrintDialog.CreateControls;
begin
  FseCopies := TdxPSSpinEdit.Create(Self);
  with FseCopies do
  begin
    Parent := gbxCopies;
    BoundsRect := bvlCopiesHolder.BoundsRect;
    MinValue := 0;
    MaxValue := 0;
    OnChange := seCopiesChange;
    OnExit := seCopiesExit;
    Flat := False;
    TabOrder := cbxNumberOfPages.TabOrder + 1;
  end;
  lblNumberOfCopies.FocusControl := FseCopies;
  
  FbaPRWarning := TdxPSBitmapAnimator.Create(Self);
  with FbaPRWarning do
  begin
    Parent := gbxPageRange;
    BoundsRect := bvlPRWarningHolder.BoundsRect;
  end;  
end;

procedure TdxfmPrintDialog.FillStyles;
var
  I: Integer;
  AStyle: TBasedxPrintStyle;
begin
  with lbxPrintStyles do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      for I := 0 to FDialogData.StyleManager.Count - 1 do
      begin
        AStyle := FDialogData.StyleManager[I];
        Items.AddObject(AStyle.StyleCaption, AStyle);
      end;
      ItemIndex := Items.IndexOfObject(FDialogData.StyleManager.CurrentStyle);
    finally
      Items.EndUpdate;
    end;
  end;
end;
  
procedure TdxfmPrintDialog.SetActiveControl;
begin
  if FseCopies.CanFocus then
    ActiveControl := FseCopies
  else 
    if cbxNumberOfPages.CanFocus then 
      ActiveControl := cbxNumberOfPages
    else
      if btnOK.CanFocus then 
        ActiveControl := btnOK;  
end;
  
procedure TdxfmPrintDialog.StartSettings;
begin
  FModified := False;
  FControlsUpdating := True;
  try
    LoadStrings;
    CollectPrinters;
    chbxPrintToFile.Checked := FDialogData.PrintToFile;
    rbtnAllPages.Checked := (FDialogData.PageRanges = prAll);
    rbtnCurrentPage.Checked := (FDialogData.PageRanges = prCurrent);
    rbtnPageRanges.Checked := (FDialogData.PageRanges = prRange);
    rbtnSelection.Checked := (FDialogData.PageRanges = prSelection);
    edPageRanges.Text := FDialogData.Pages;
    cbxNumberOfPages.ItemIndex := Integer(FDialogData.PageNums);
    FseCopies.AsInteger := FDialogData.Copies;
    chbxCollate.Checked := FDialogData.Collate;
    if FDialogData.StyleManager <> nil then
    begin
      btnPageSetup.Caption := sdxBtnPrintStyles;
      btnPageSetup.Glyph := FGlyphs[not pnlPrintStyles.Visible];
    end
    else 
      if Assigned(FOnPageSetup) then
      begin
        btnPageSetup.Caption := sdxBtnPageSetup;
        btnPageSetup.Glyph := nil;
      end;
    cbxPrinters.Enabled := cbxPrinters.Items.Count > 0;
//    if cbxPrinters.Enabled then cbxPrinters.ItemIndex := 0;
    if btnPrinterProperties.Visible and btnPrinterProperties.Enabled then
      btnPrinterProperties.Enabled := cbxPrinters.Items.Count > 0;

    btnHelp.Visible := HelpContext <> 0;
    if HelpContext = 0 then
    begin
      btnOK.BoundsRect := btnCancel.BoundsRect;
      btnCancel.BoundsRect := btnHelp.BoundsRect;
    end;
  finally
    UpdatePrinterInfos;
    UpdateControlsState;
    FControlsUpdating := False;
  end;
end;

procedure TdxfmPrintDialog.SetupDialog(const APrintDlgData: TdxPrintDlgData);
begin
//  FModified := False;
  FControlsUpdating := True;
  try
    FDialogData := APrintDlgData.DialogData^;
    FSaveDialogData := APrintDlgData.DialogData^;

    FIsCheckUserInput := APrintDlgData.IsCheckUserInput;

    with APrintDlgData do
    begin
      { visible }
      btnPrinterProperties.Visible := (pdbPrinterProperties in ButtonsVisible);
      btnNetwork.Visible := (pdbNetwork in ButtonsVisible) and not IsWin95;
      chbxPrintToFile.Visible := (pdoPrintToFile in OptionsVisible);
      cbxFileName.Visible := (pdoPrintToFile in OptionsVisible);
      btnBrowse.Visible := (pdoPrintToFile in OptionsVisible);

      rbtnAllPages.Visible := (pdoAllPages in OptionsVisible);
      rbtnCurrentPage.Visible := (pdoCurrentPage in OptionsVisible);
      rbtnSelection.Visible := (pdoSelection in OptionsVisible);
      rbtnPageRanges.Visible := (pdoPageRange in OptionsVisible);
      lblDescription.Visible := rBtnPageRanges.Visible;
      edPageRanges.Visible := (pdoPageRange in OptionsVisible);
      gbxPageRange.Visible := rbtnAllPages.Visible or rbtnCurrentPage.Visible or
        rbtnSelection.Visible or rbtnPageRanges.Visible;

      btnPageSetup2.Visible := (pdbPageSetup in ButtonsVisible);        
      btnDefineStyles.Visible := (pdbDefineStyles in ButtonsVisible);        
      btnStyleOptions.Visible := (pdbStyleOptions in ButtonsVisible);              

      btnPageSetup.Visible := (pdbPageSetup in ButtonsVisible);
      btnPreview.Visible := (pdbPreview in ButtonsVisible);
      btnHelp.Visible := (pdbHelp in ButtonsVisible);
      if btnPreview.Visible and not btnPageSetup.Visible then
        btnPreview.BoundsRect := btnPageSetup.BoundsRect;

      if not (pdoPrintToFile in OptionsVisible) then
      begin
        pnlPrintToFile.Visible := False;
        pnlTop.Height := pnlTop.Height - pnlPrintToFile.Height;
        Height := Height - pnlPrintToFile.Height;
      end;
      if (DialogData.StyleManager = nil) or not (pdoPrintStyles in OptionsVisible) then
      begin
        pnlPrintStyles.Visible := False;
        Height := Height - pnlPrintStyles.Height;
      end;

      {enable}
      if btnPrinterProperties.Visible then
        btnPrinterProperties.Enabled := (pdbPrinterProperties in ButtonsEnabled);
      if btnNetwork.Visible then
        btnNetwork.Enabled := IsNetworkPresent and (pdbNetwork in ButtonsEnabled);
      if chbxPrintToFile.Visible then
        chbxPrintToFile.Enabled := (pdoPrintToFile in OptionsEnabled);
      if cbxFileName.Visible then
      begin
        cbxFileName.Enabled := (pdoPrintToFile in OptionsEnabled);
        if DialogData.FileList <> nil then 
          cbxFileName.Items := DialogData.FileList;
        cbxFileName.ItemIndex := 0;
//        cbxFileName.Text := DialogData.FileName;
      end;
      if btnBrowse.Visible then
        btnBrowse.Enabled := (pdoPrintToFile in OptionsEnabled);
      if rbtnAllPages.Visible then
        rbtnAllPages.Enabled := (pdoAllPages in OptionsEnabled);
      if rbtnCurrentPage.Visible then
        rbtnCurrentPage.Enabled := (pdoCurrentPage in OptionsEnabled);
      if rbtnSelection.Visible then
        rbtnSelection.Enabled := (pdoSelection in OptionsEnabled);
      if rBtnPageRanges.Visible then
        rBtnPageRanges.Enabled := (pdoPageRange in OptionsEnabled);
      if edPageRanges.Visible then
        edPageRanges.Enabled := (pdoPageRange in OptionsEnabled);
      if lblDescription.Visible then
        lblDescription.Enabled := rBtnPageRanges.Enabled;
      if edPageRanges.Enabled and edPageRanges.Visible then
        edPageRanges.Text := DialogData.Pages;

      if btnPageSetup.Visible then
        btnPageSetup.Enabled := (pdbPageSetup in ButtonsEnabled);
      if btnPreview.Visible then
        btnPreview.Enabled := (pdbPreview in ButtonsEnabled);
      if btnHelp.Visible then
        btnHelp.Enabled := (pdbHelp in ButtonsEnabled);

      Caption := Title;
      if Assigned(Events) then
      begin
        FOnClose := Events^.OnClose;
        FOnShow := Events^.OnShow;
        FOnPageSetup := Events^.OnPageSetup;
      end;
    end;
  finally
    UpdateControlsState;
    FControlsUpdating := False;
  end;
end;

procedure TdxfmPrintDialog.CollectPrinters;
var
  I: Integer;
  APrinterInfo2: WinSpool.PPrinterInfo2;
  ASize: DWORD;
  APrinterHandle: THandle;
  IsNetwork: Boolean;
  IsDefault: Boolean;
begin
  cbxPrinters.Items.BeginUpdate;
  try
    ReleasePrinterInfos;
    cbxPrinters.Items.Clear;
    if dxPrintDevice.Printers <> nil then 
      cbxPrinters.Items := dxPrintDevice.Printers;
    with dxPrintDevice do
    begin
      for I := 0 to Printers.Count - 1 do
        if Printers.Objects[I] <> nil then
          if WinSpool.OpenPrinter(TdxPrintDeviceInfo(Printers.Objects[I]).Device, APrinterHandle, nil) then
          try
            WinSpool.GetPrinter(APrinterHandle, 2, nil, 0, @ASize);
            if ASize > 0 then
            begin
              Inc(ASize, dxSizeReserv);
              APrinterInfo2 := GlobalAllocPtr(GPTR, ASize);
              if APrinterInfo2 <> nil then 
              try
                if WinSpool.GetPrinter(APrinterHandle, 2, APrinterInfo2, ASize, @ASize) then
                  with APrinterInfo2^ do
                  begin
                    IsNetwork := (Attributes and PRINTER_ATTRIBUTE_NETWORK) = PRINTER_ATTRIBUTE_NETWORK;
                    IsDefault := (Attributes and PRINTER_ATTRIBUTE_DEFAULT) = PRINTER_ATTRIBUTE_DEFAULT;
                    cbxPrinters.Items.Objects[I] := TdxPrinterInfos.Create(IsNetwork, IsDefault);
                  end;
              finally
                GlobalFreePtr(APrinterInfo2);
              end;
            end;
          finally
            ClosePrinter(APrinterHandle);
          end;
      if cbxPrinters.Items.Count > 0 then cbxPrinters.ItemIndex := PrinterIndex
    end;
  finally
    cbxPrinters.Items.EndUpdate;
  end;
end;

procedure TdxfmPrintDialog.cbxPrintersDrawItem(Control: TWinControl;
  index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  ASaveMode: Integer;
  IsNetPrinter: Boolean;
  IsDefaultPrinter: Boolean;
begin
  with TComboBox(Control) do
  begin
    Canvas.FillRect(Rect);
    { image }
    InflateRect(Rect, -1, -1);
    Inc(Rect.Left, 5);
    IsNetPrinter := TdxPrinterInfos(Items.Objects[index]).IsNetwork;
    IsDefaultPrinter := TdxPrinterInfos(Items.Objects[index]).IsDefault;
    ilPrinters.Draw(Canvas, Rect.Left, Rect.Top, Integer(IsNetPrinter) + 2 * Integer(IsDefaultPrinter));
    { Text }
    Inc(Rect.Left, 27);
    ASaveMode := SetBkMode(Canvas.Handle, Transparent);
    Windows.DrawText(Canvas.Handle, PChar(Items[index]), Length(Items[index]), Rect,
      DT_SINGLELINE or DT_LEFT or DT_VCENTER);
    SetBkMode(Canvas.Handle, ASaveMode);
  end;
end;

procedure TdxfmPrintDialog.chbxCollateClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  FDialogData.Collate := TCheckBox(Sender).Checked;
  pbxCollate.Invalidate;
  CheckModified;
end;

procedure TdxfmPrintDialog.UpdatePrinterInfos;
var
  APrinterInfo2: WinSpool.PPrinterInfo2;
  ASize: DWORD;
  APrinterHandle: THandle;
begin
  try
    if WinSpool.OpenPrinter(dxPrintDevice.CurrentDevice, APrinterHandle, nil) then
    try
      WinSpool.GetPrinter(APrinterHandle, 2, nil, 0, @ASize);
      if ASize > 0 then
      begin
        Inc(ASize, dxSizeReserv);
        APrinterInfo2 := GlobalAllocPtr(GPTR, ASize);
        if APrinterInfo2 <> nil then
        try
          if WinSpool.GetPrinter(APrinterHandle, 2, APrinterInfo2, ASize, @ASize) then
          begin
            if (APrinterInfo2^.cJobs > 0) then 
              lStatus.Caption := Format(sdxPrintDialogPSPrintingAndWaiting, [APrinterInfo2^.cJobs])
            else
              lStatus.Caption := GetStatusString(APrinterInfo2^.Status);
            if (APrinterInfo2^.Status = 0) then 
              lStatus.Font.Color := Font.Color
            else   
              lStatus.Font.Color := clHighlight;
            lType.Caption := StrPas(APrinterInfo2^.pDriverName);
            lWhere.Caption := StrPas(APrinterInfo2^.pPortName);
            lComment.Caption := StrPas(APrinterInfo2^.pComment);
          end;
        finally
          GlobalFreePtr(APrinterInfo2);
        end;
      end;
    finally
      ClosePrinter(APrinterHandle);
    end;
    FseCopies.MaxValue := dxPrintDevice.MaxCopies;
    FseCopies.MinValue := 1;
  except
    Application.HandleException(Self);
  end;
end;

procedure TdxfmPrintDialog.DocumentPropertiesDlg;
begin
  dxPrintDevice.Copies := FseCopies.AsInteger;
  dxPrintDevice.Collate := chbxCollate.Checked;
  if dxDocumentProperties(Handle) then
  begin
    FseCopies.AsInteger := dxPrintDevice.Copies;
    chbxCollate.Checked := dxPrintDevice.Collate;
    UpdatePrinterInfos;
    CheckModified;
    btnCancel.Caption := sdxBtnClose;
  end;
end;

procedure TdxfmPrintDialog.btnPrinterPropertiesClick(Sender: TObject);
begin
  if dxPrintDevice.Printing then
    MessageWarning(sdxPrintDialogInPrintingState)
  else
    DocumentPropertiesDlg;
end;

procedure TdxfmPrintDialog.cbxPrintersChange(Sender: TObject);
var
  PrevCursor : TCursor;
begin
  if FControlsUpdating then Exit;
  PrevCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    dxPrintDevice.PrinterIndex := TComboBox(Sender).ItemIndex;
  finally
    Screen.Cursor := PrevCursor;
  end;  
  btnCancel.Caption := sdxBtnClose;
  UpdatePrinterInfos;
  CheckModified;
end;

procedure TdxfmPrintDialog.chbxPrintToFileClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  FDialogData.PrintToFile := TCheckBox(Sender).Checked;
  if TCheckBox(Sender).Checked and (cbxFileName.Items.Count > 0) then 
    cbxFileName.ItemIndex := 0;
  CheckModified;
  if TCheckBox(Sender).Checked then ActiveControl := btnBrowse;
end;

procedure TdxfmPrintDialog.edPageRangesChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  if (ActiveControl = Sender) then 
    rBtnPageRanges.Checked := True;
  CheckModified;
end;

procedure TdxfmPrintDialog.cbxNumberOfPagesChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  FDialogData.PageNums := TdxPageNumbers(TComboBox(Sender).ItemIndex);
  CheckModified;
end;

procedure TdxfmPrintDialog.seCopiesChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmPrintDialog.seCopiesExit(Sender: TObject);
begin
  FDialogData.Copies := TdxPSSpinEdit(Sender).AsInteger;
end;

procedure TdxfmPrintDialog.rbtnPagesClick(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  FDialogData.PageRanges := TdxPageRanges(TRadioButton(Sender).Tag);
  CheckModified;
  if Sender = rbtnPageRanges then
    if ActiveControl <> edPageRanges then
    begin
      ActiveControl := edPageRanges;
      edPageRanges.SelectAll;
    end
    else
  else
  begin
    edPageRanges.Text := '';
    FbaPRWarning.State := False;
  end;  
end;

procedure TdxfmPrintDialog.btnBrowseClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    with OpenDialog do 
    begin
      Title := sdxPrintDialogOpenDlgTitle;
      Filter := Format('%s (*.*)|*.*|%s (*.prn)|*.PRN', 
        [sdxPrintDialogOpenDlgAllFiles, sdxPrintDialogOpenDlgPrinterFiles]);
      FilterIndex := 2;
      DefaultExt := 'prn';
      FileName := cbxFileName.Text;
      if Execute then
        cbxFileName.Text := FileName;
    end;    
  finally
    OpenDialog.Free;
  end;
end;

function TdxfmPrintDialog.CheckFileName(const FileName: string): Boolean;
begin
  Result := ValidateFileName(FileName) 
end;

function TdxfmPrintDialog.CheckPageRanges: Boolean;
var  
  V: Variant;
  P: PIntArray;
  C: Integer;
begin
  V := MakePageIndexes(edPageRanges.Text);
  P := varArrayLock(V);
  if (P <> nil) then 
  try
    with TVarData(V).VArray^.Bounds[0] do        
      C := LowBound + ElementCount;
{$IFOPT R+}{$DEFINE PREVRANGECHECK}{$R-}{$ENDIF}
    Result := (MinIntValue(Slice(P^, C)) >= FDialogData.MinRange) and 
        (MaxIntValue(Slice(P^, C)) <= FDialogData.MaxRange)
{$IFDEF SAVERANGECHECK}{$UNDEF PREVRANGECHECK}{$R+}{$ENDIF}
  finally
    varArrayUnlock(V);
  end
  else
    Result := False;
end;

function TdxfmPrintDialog.CheckUserInput: Boolean;
var
  FileName: string;
  RealFileName: string;
begin
  Result := True;
  if chbxPrintToFile.Checked then
  begin
    FileName := cbxFileName.Text;
    Result := (Length(Filename) > 0);
    if Result then
    begin
      if (Length(FileName) > 2) and (FileName[1] = '"') and (FileName[Length(FileName)] = '"') then
        FileName := System.Copy(FileName, 2, Length(FileName) - 2);
      Result := CheckFileName(Filename);
      if Result then
      begin
        RealFileName := GetFileName(cbxFileName.Text);
        Result := not FileExists(RealFileName);
        if not Result then
          Result := MessageQuestion(Format(sdxConfirmOverWrite, [RealFileName]))
      end
      else
        MessageWarning(Format(sdxInvalidFileName, [FileName]));
    end
    else
      MessageWarning(sdxRequiredFileName);
    if not Result then ActiveControl := cbxFileName;
    Exit;
  end;
  if rBtnPageRanges.Checked then
  begin
    Result := (Length(edPageRanges.Text) > 0);
    if Result then
    try
      Result := CheckPageRanges;
      if not Result then
        MessageWarning(Format(sdxPrintDialogPageNumbersOutOfRange, 
          [FDialogData.MinRange, FDialogData.MaxRange]));
    except
      MessageWarning(Format(sdxPrintDialogInvalidPageRanges, [edPageRanges.Text]));
      Result := False;
    end
    else
      MessageWarning(sdxPrintDialogRequiredPageNumbers);
    if not Result then ActiveControl := edPageRanges;
  end;
end;

procedure TdxfmPrintDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    if FIsCheckUserInput then 
      CanClose := CheckUserInput;
    if CanClose then 
      SavePrintDialogData;
  end;
end;
               
function EliminateSpaces(const Source: string): string;
var
  I: Integer;
begin
  I := 1;
  Result := '';
  while I <= Length(Source) do
  begin
    if Source[I] <> ' ' then Result := Result + Source[I];
    Inc(I);
  end;
end;

procedure TdxfmPrintDialog.SavePrintDialogData;
var
  Index: Integer;
begin
  with FDialogData do
  begin
    Pages := EliminateSpaces(edPageRanges.Text);
    FileName := GetFileName(Trim(cbxFileName.Text));
    if FileList <> nil then
    begin
      Index := FileList.IndexOf(FileName);
      if Index = -1 then
        FileList.Insert(0, FDialogData.FileName)
      else
        FileList.Exchange(0, Index);
    end;
  end;  
end;

function TdxfmPrintDialog.GetFileName(const S: string): string;
begin
  if S <> '' then
    if (S[1] = '"') and (S[Length(S)] = '"') then
      Result := System.Copy(S, 2, Length(S) - 2)
    else
      Result := ChangeFileExt(S, '.prn')
  else
    Result := '';
end;

procedure TdxfmPrintDialog.cbxFileNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then ModalResult := mrCancel;
end;

procedure TdxfmPrintDialog.cbxFileNameExit(Sender: TObject);
begin
  FDialogData.FileName := GetFileName(EliminateSpaces(TComboBox(Sender).Text));
end;

procedure TdxfmPrintDialog.edPageRangesExit(Sender: TObject);
var
  b: Boolean;
begin
  TEdit(Sender).Text := EliminateSpaces(TEdit(Sender).Text);
  FDialogData.Pages := TEdit(Sender).Text;
  if rbtnAllPages.Checked or rbtnCurrentPage.Checked or rbtnSelection.Checked or 
    (rbtnAllPages = ActiveControl) or (rbtnCurrentPage = ActiveControl) or 
    (rbtnSelection = ActiveControl) then 
    FbaPRWarning.State := False 
  else
  begin
    try
      b := CheckPageRanges;
      if not b then 
        PreparePRWarningBitmap(Format(sdxPrintDialogPageNumbersOutOfRange, 
          [FDialogData.MinRange, FDialogData.MaxRange]));      
    except
      b := False;
      PreparePRWarningBitmap(Format(sdxPrintDialogInvalidPageRanges, 
        [edPageRanges.Text]));    
    end;  
    if not b and not FbaPRWarning.State and (ActiveControl <> btnOK) and 
      (ActiveControl <> btnCancel) then 
      Beep;
    FbaPRWarning.State := not b;
  end;  
end;

procedure TdxfmPrintDialog.edPageRangesKeyPress(Sender: TObject; var Key: Char);

  function IsValidKey(AKey: Char): Boolean;
  begin      
    Result := AKey in ['0'..'9'];
    if not Result and (Text <> '') then
      Result := AKey in [',', '-', Char(VK_BACK)];
  end;
  
begin
  if not IsValidKey(Key) then
  begin
    MessageBeep(MB_ICONHAND);
    Key := #0;
  end;
end;

procedure TdxfmPrintDialog.btnPreviewClick(Sender: TObject);
begin
  FPreviewBtnClicked := True;
  ModalResult := mrCancel; // mrOK ???
end;

procedure TdxfmPrintDialog.ShowPrintStyles(AShow: Boolean);
begin
  if pnlPrintStyles.Visible <> AShow then
  begin
    pnlPrintStyles.Visible := AShow;
    btnPageSetup.Glyph := FGlyphs[not pnlPrintStyles.Visible];
    Height := Height + (-1 + 2 * Byte(pnlPrintStyles.Visible)) * pnlPrintStyles.Height;
  end;
end;

procedure TdxfmPrintDialog.btnPageSetupClick(Sender: TObject);
begin
  if FDialogData.StyleManager <> nil then
    ShowPrintStyles(not pnlPrintStyles.Visible)
  else
    DoPageSetup;
end;

procedure TdxfmPrintDialog.CreateWnd;
begin
  inherited CreateWnd;
  if Icon.Handle = 0 then
    Icon.Handle := LoadIconFromBitmapRes(DXCP_BMPPRINT);  
  SendMessage(Handle, WM_SETICON, 1, Icon.Handle);
end;

procedure TdxfmPrintDialog.DoHide;
begin
  if Assigned(FOnClose) then FOnClose(Self);
  inherited;
end;

procedure TdxfmPrintDialog.DoShow;
begin
  inherited;
  if Assigned(FOnShow) then FOnShow(Self);
end;

procedure TdxfmPrintDialog.DoPageSetup;
var
  ADone: Boolean;
begin
  if Assigned(FOnPageSetup) then
  begin
    ADone := True;
    try
      FOnPageSetup(Self, ADone, @FPreviewBtnClicked, nil);//@FPrintBtnClicked);
    except
      Application.HandleException(Self);
    end;
    if ADone then
    begin
      UpdatePrinterInfos;
      CheckModified;
      btnCancel.Caption := sdxBtnClose;
    end;
    if FPreviewBtnClicked then ModalResult := mrOK;
  end;
end;

procedure TdxfmPrintDialog.lblNumberOfPagesClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmPrintDialog.lblNumberOfCopiesClick(Sender: TObject);
begin
  TdxPSSpinEdit(TLabel(Sender).FocusControl).SetFocus;
end;

procedure TdxfmPrintDialog.lblNameClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmPrintDialog.ConnectToPrinterDlg;
begin
  if dxConnectToNetPrinter(Self.Handle) then
  begin
    CollectPrinters;
    cbxPrintersChange(cbxPrinters);
    btnCancel.Caption := sdxBtnClose;
  end;
end;

procedure TdxfmPrintDialog.btnNetworkClick(Sender: TObject);
begin
  Self.ConnectToPrinterDlg;
  UpdateControlsState;
end;

procedure TdxfmPrintDialog.UpdatePrinters;
begin
  CollectPrinters;
  UpdatePrinterInfos;
  if (dxPrintDevice.Printers.Count > 0) then
    dxPrintDevice.PrinterIndex := -1
  else
    cbxPrinters.Enabled := False;
  Invalidate;
end;

procedure TdxfmPrintDialog.lbxPrintStylesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  with TListBox(Control) do
    DrawStyleItem(TBasedxPrintStyle(Items.Objects[Index]), TListBox(Control),
      Index, State, Rect, True, False);
end;

procedure TdxfmPrintDialog.lbxPrintStylesClick(Sender: TObject);
begin
  FDialogData.StyleManager.CurrentStyle := 
    TBasedxPrintStyle(lbxPrintStyles.Items.Objects[lbxPrintStyles.ItemIndex]);
  btnCancel.Caption := sdxBtnClose;
end;

procedure TdxfmPrintDialog.DefineStylesClick(Sender: TObject);
begin
  FDialogData.StyleManager.DefinePrintStylesDlg(@FPreviewBtnClicked, nil);
  btnCancel.Caption := sdxBtnClose;
  if FPreviewBtnClicked then ModalResult := mrOK;
end;

procedure TdxfmPrintDialog.PageSetup2Click(Sender: TObject);
var
  Index: Integer;
  Style: TBasedxPrintStyle;  
begin
  Index := lbxPrintStyles.ItemIndex;
  if Index <> -1 then 
  begin
    Style := TBasedxPrintStyle(lbxPrintStyles.Items.Objects[Index]);
    if Style.PageSetupEx(0, @FPreviewBtnClicked, @FPrintBtnClicked) then
      btnCancel.Caption := sdxBtnClose;
    if FPreviewBtnClicked then ModalResult := mrOK;
  end;  
end;

procedure TdxfmPrintDialog.StyleOptionsClick(Sender: TObject);
var
  Style: TBasedxPrintStyle;
begin
  Style := TBasedxPrintStyle(lbxPrintStyles.Items.Objects[lbxPrintStyles.ItemIndex]);
  if Style.SetupOptions then
  begin
    btnCancel.Caption := sdxBtnClose;
    CheckModified;
  end;
end;

procedure TdxfmPrintDialog.pmPrintStylesPopup(Sender: TObject);
begin
  miPageSetup.Enabled := btnPageSetup2.Enabled;
  miStyleOptions.Enabled := btnStyleOptions.Enabled;
end;

const 
  sdxMaximized = 'Maximized';

procedure TdxfmPrintDialog.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  if FDialogData.StyleManager <> nil then
    with TRegistry.Create do
    try
      if OpenKey(APath, True) then
      try
        WriteBool(sdxMaximized, pnlPrintStyles.Visible);
      except
        on ERegistryException do 
        else
          raise;
      end;  
    finally
      Free;
    end;  
end;

procedure TdxfmPrintDialog.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  with TRegistry.Create do
  try
    if OpenKey(APath, False) and ValueExists(sdxMaximized) then
    try
      FPrintStylesVisibled := ReadBool(sdxMaximized);
    except
      on ERegistryException do 
      else
        raise;
    end;  
  finally
    Free;
  end;  
end;

procedure TdxfmPrintDialog.pbxCollateDblClick(Sender: TObject);
begin
  chbxCollate.Checked := not chbxCollate.Checked;
end;
 
procedure TdxfmPrintDialog.pbxCollatePaint(Sender: TObject);
var
  DC: hDC;
  R: TRect;
begin
  DC := TPaintBox(Sender).Canvas.Handle;
  SelectObject(DC, TPaintBox(Sender).Font.Handle);
  SetTextColor(DC, GetSysColor(COLOR_WINDOWTEXT));
  R := TPaintBox(Sender).ClientRect;
  SetBkMode(DC, TRANSPARENT);
  DrawCollatedPages(DC, R, FDialogData.Collate);  
  SelectClipRgn(DC, 0);
end;

procedure TdxfmPrintDialog.DrawCollatedPages(DC: hDC; const ADrawRect: TRect; ACollate: Boolean);

  procedure DrawPages(const APageRect: TRect; const AOffsets: TPoint; 
    ADistance: Integer; ACollate: Boolean);

    procedure DrawPage(var R: TRect; const S: string);
    var
      Size: TSize;
    begin
      DrawEdge(DC, R, BDR_RAISEDOUTER, BF_LEFT or BF_TOP or BF_FLAT);
      DrawEdge(DC, R, BDR_RAISEDOUTER, BF_RIGHT or BF_BOTTOM);
      InflateRect(R, -1, -1);      
      DrawEdge(DC, R, BDR_SUNKENINNER, BF_RIGHT or BF_BOTTOM);      
      Dec(R.Right);
      Dec(R.Bottom);
      FillRect(DC, R, HBRUSH(COLOR_WINDOW{COLOR_BTNHIGHLIGHT} + 1));
      Inc(R.Right);
      Inc(R.Bottom);
      InflateRect(R, 1, 1);
      GetTextExtentPoint32(DC, PChar(S), 1, Size);
      TextOut(DC, R.Right - Size.cX - 2, R.Bottom - Size.cY - 1, PChar(S), 1);
      with R do
        ExcludeClipRect(DC, Left, Top, Right, Bottom);
    end;

    procedure DrawPageColumn(var R: TRect; Index, Count: Integer);
    var
      I: Integer;
      S: string;
    begin
      if not ACollate then S := IntToStr(Index);
      for I := 0 to Count - 1 do 
      begin
        if ACollate then S := IntToStr(I + 1);
        DrawPage(R, S);
        OffsetRect(R, AOffsets.X, -AOffsets.Y);
      end;  
    end;
  
  var
    I, C: Integer;
    R: TRect; 
  begin
    C := 2 + Byte(ACollate);
    for I := 0 to 2 - Byte(ACollate) do 
    begin
      R := APageRect;
      OffsetRect(R, I * ADistance, 0);
      DrawPageColumn(R, I, C);
    end;
  end;

const 
  PageWidth = 19;  
  PageHeight = 24;
  Offsets: TPoint = (X: 10; Y: 8);
var
  R: TRect;
  W, H, Distance, ShiftX, ShiftY: Integer;
begin
  R := Rect(0, 0, PageWidth, PageHeight);
  W := ADrawRect.Right - ADrawRect.Left;
  H := ADrawRect.Bottom - ADrawRect.Top;
  ShiftX := ((W div (3 - Byte(ACollate))) - (PageWidth + Offsets.X * (1 + Byte(ACollate)))) div 2;
  ShiftY := ((H - PageHeight + Offsets.Y * (1 + Byte(ACollate))) div 2);
  OffsetRect(R, ShiftX, ShiftY);
  Distance := W div (3 - Byte(ACollate));
  DrawPages(R, Offsets, Distance, ACollate);
end;

end.
