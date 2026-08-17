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

unit dxPSChLbxLnk;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, CheckLst,
  dxPSCore, dxPSGrLnks, dxPSGlbl;

type
  TdxCheckListBoxPaintOption = (chlbxpoBorder, chlbxpoHorzLines, chlbxpoFlatCheckMarks);
  TdxCheckListBoxPaintOptions = set of TdxCheckListBoxPaintOption;

  TdxCheckListBoxReportLink = class(TdxCustomListBoxReportLink)
  private
    FOptions: TdxCheckListBoxPaintOptions;
    function GetOptions: TdxCheckListBoxPaintOptions;
    function GetCheckListBox: TCheckListBox;
    procedure SetOptions(Value: TdxCheckListBoxPaintOptions);
    function IsFlatCheckMarks: Boolean;
  protected
    procedure AssignData(ACol, ARow: Integer; ADataItem: TAbstractdxReportCellData); override;
    function GetDataItemClass(ACol: Integer): TdxReportCellDataClass; override;
    procedure InternalRestoreDefaults; override;
{$IFDEF DELPHI4}
    procedure InternalRestoreFromOriginal; override;
{$ENDIF}
    function IsDrawBorder: Boolean; override;
    function IsDrawHorzLines: Boolean; override;
    procedure SetDrawMode(Value: TdxGridDrawMode); override;
  public
    procedure Assign(Source: TPersistent); override;

    property CheckListBox: TCheckListBox read GetCheckListBox;
  published
//    property AutoWidth;
    property Color;
    property EndEllipsis;
    property EvenColor;
    property EvenFont;
    property Font;
    property OddColor;
    property OddFont;
    property Options: TdxCheckListBoxPaintOptions read GetOptions write SetOptions
      default [chlbxpoBorder..chlbxpoFlatCheckMarks];
    property Multiline;
    property RowAutoHeight;
    property ScaleFonts;
    property SupportedCustomDraw;
    property Transparent;
    property UseHorzDelimiters;
    property UseVertDelimiters;
    property Width;
    
    property OnCustomDrawItem;
  end;

  TdxChlbxReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    pnlPreView: TPanel;
    lblPreview: TStaticText;
    Panel10: TPanel;
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    pnlOptions: TPanel;
    tshColor: TTabSheet;
    pnlColor: TPanel;
    lblGridLinesColor: TLabel;
    chbxTransparent: TCheckBox;
    tshFont: TTabSheet;
    pnlFont: TPanel;
    btnFont: TButton;
    edFont: TEdit;
    FD: TFontDialog;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    bvlLineColorHolder: TBevel;
    chbxShowBorders: TCheckBox;
    chbxShowHorzLines: TCheckBox;
    chbxFlatCheckMarks: TCheckBox;
    lblShow: TLabel;
    Bevel11: TBevel;
    lblMiscellaneous: TLabel;
    Bevel4: TBevel;
    lblDrawMode: TLabel;
    cbxDrawMode: TComboBox;
    btnEvenFont: TButton;
    edEvenFont: TEdit;
    lblEvenColor: TLabel;
    bvlEvenColorHolder: TBevel;
    chbxRowAutoHeight: TCheckBox;
    procedure ccbxColorChange(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure pbxPreviewPaint(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure lblComboClick(Sender: TObject);
    procedure cbxDrawModeChange(Sender: TObject);
    procedure chbxShowBordersClick(Sender: TObject);
    procedure chbxRowAutoHeightClick(Sender: TObject);
  private
    FccbxColor: TCustomComboBox;
    FccbxEvenColor: TCustomComboBox;
    FccbxGridLineColor: TCustomComboBox;
  
    FItemCount: Integer;
    FPaintWidth: Integer;
    FPaintHeight: Integer;
    FPreviewBox: TCustomPanel;
    FPreviewFont: TFont;
    FRectWidth: Integer;
    FRectHeight: Integer;
    
    procedure CreateControls;
    function GetCheckListBoxReportLink: TdxCheckListBoxReportLink;
    procedure CMDialogChar(var message: TCMDialogChar); message CM_DIALOGCHAR;
  protected
    procedure DoInitialize; override;
    procedure LoadStrings; override;
    procedure PaintPreview(ACanvas: TCanvas; R: TRect); override;
    procedure UpdateControlsState; override;
    procedure UpdatePreview; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    property CheckListBoxReportLink: TdxCheckListBoxReportLink read GetCheckListBoxReportLink;
  end;

const
  dxDefaultCheckListBoxPaintOptions: TdxCheckListBoxPaintOptions =
    [chlbxpoBorder, chlbxpoHorzLines, chlbxpoFlatCheckMarks];
    
  dxCheckListBoxStrings: array[0..4] of string =
    ('ExpressBars', 'ExpressMasterView', 'ExpressQuantumTreeList',
    'ExpressQuantumDBGrid', 'ExpressPrinting System');

implementation
uses
  dxExtCtrls, dxPSRes, dxPrnDev, dxPSUtl;

{$R *.DFM}

{ = ========================================================================== }
{ TdxCheckListBoxReportLink class realization                                  }
{ = ========================================================================== }

procedure TdxCheckListBoxReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxCheckListBoxReportLink) then
    Options := TdxCheckListBoxReportLink(Source).Options;
end;

procedure TdxCheckListBoxReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  Options := dxDefaultCheckListBoxPaintOptions; {[Low(TdxCheckListBoxPaintOptions)..High(TdxCheckListBoxPaintOptions)]}
end;

{$IFDEF DELPHI4}

procedure TdxCheckListBoxReportLink.InternalRestoreFromOriginal;
begin
  inherited InternalRestoreFromOriginal;
  if CheckListBox.Flat then
    Options := Options + [chlbxpoFlatCheckMarks]
  else
    Options := Options - [chlbxpoFlatCheckMarks];
end;
{$ENDIF}

function TdxCheckListBoxReportLink.IsDrawBorder: Boolean;
begin
  Result := chlbxpoBorder in Options;
end;

function TdxCheckListBoxReportLink.IsDrawHorzLines: Boolean;
begin
  Result := chlbxpoHorzLines in Options;
end;

procedure TdxCheckListBoxReportLink.SetDrawMode(Value: TdxGridDrawMode);
begin
  if (Value > gdmOddEven) then Value := gdmOddEven;
  inherited SetDrawMode(Value);
end;

function TdxCheckListBoxReportLink.GetCheckListBox: TCheckListBox;
begin
  Result := TCheckListBox(Component);
end;

procedure TdxCheckListBoxReportLink.AssignData(ACol, ARow: Integer; ADataItem: TAbstractdxReportCellData);
begin
  inherited AssignData(ACol, ARow, ADataItem);
  with TdxReportCellCheck(ADataItem) do
  begin
    CheckPos := ccpLeft;
    Checked := CheckListBox.State[ARow] > cbUnchecked;
    Enabled := CheckListBox.State[ARow] < cbGrayed;
{$IFDEF DELPHI5}
    Enabled := Enabled and CheckListBox.ItemEnabled[ARow];
{$ENDIF}
    FlatBorder := IsFlatCheckMarks;
  end;
end;

function TdxCheckListBoxReportLink.GetDataItemClass(ACol: Integer): TdxReportCellDataClass;
begin
  Result := TdxReportCellCheck;
end;

function TdxCheckListBoxReportLink.IsFlatCheckMarks: Boolean;
begin
  Result := chlbxpoFlatCheckMarks in Options;
end;

function TdxCheckListBoxReportLink.GetOptions: TdxCheckListBoxPaintOptions;
begin
  Result := FOptions;
end;

procedure TdxCheckListBoxReportLink.SetOptions(Value: TdxCheckListBoxPaintOptions);
begin
  if (FOptions <> Value) then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;

{ = ========================================================================== }
{ TdxChlbxReportLinkDesignWindow. class realization                            }
{ = ========================================================================== }
constructor TdxChlbxReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcCheckListBoxReportLinkDesigner;
  inherited Create(AOwner);
  CreateControls;
  FItemCount := 5;
  FRectWidth := FPreviewBox.Width - 15;
  FRectHeight := (FPreviewBox.Height - 15) div FItemCount;
  FPaintWidth := FRectWidth + 1;
  FPaintHeight := FItemCount * (FRectHeight + 1);
  PageControl1.ActivePage := PageControl1.Pages[0];
  FPreviewFont := TFont.Create;
end;

destructor TdxChlbxReportLinkDesignWindow.Destroy;
begin
  FPreviewFont.Free;
  inherited Destroy;
end;

procedure TdxChlbxReportLinkDesignWindow.CreateControls;
var
  R: TRect;
begin
  FccbxColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxColor) do
  begin
    BoundsRect := bvlColorHolder.BoundsRect;
    Tag := 0;
    Parent := gbxTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblColor.FocusControl := FccbxColor;

  FccbxEvenColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxEvenColor) do
  begin
    BoundsRect := bvlEvenColorHolder.BoundsRect;
    Tag := 1;
    Parent := gbxTransparent;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblEvenColor.FocusControl := FccbxEvenColor;

  FccbxGridLineColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxGridLineColor) do
  begin
    BoundsRect := bvlLineColorHolder.BoundsRect;
    Tag := 2;
    Parent := pnlColor;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowAutoColor := True;
    AutoColor := dxDefaultGridLineColor;
//    DropDownCount := Items.Count;
    OnChange := ccbxColorChange;
  end;
  lblGridLinesColor.FocusControl := FccbxGridLineColor;
  FPreviewBox := TdxPSPaintPanel.Create(Self);
  with TdxPSPaintPanel(FPreviewBox) do
  begin
    Parent := pnlPreview;
    R := pnlPreview.BoundsRect;
    OffsetRect(R, -R.Left, -R.Top);
    InflateRect(R, -1, -1);
    BoundsRect := R;
    EdgeInner := esNone;
    EdgeOuter := esNone;
    OnPaint := pbxPreviewPaint;
  end;
end;

function TdxChlbxReportLinkDesignWindow.GetCheckListBoxReportLink: TdxCheckListBoxReportLink;
begin
  Result := TdxCheckListBoxReportLink(ReportLink);
end;

procedure TdxChlbxReportLinkDesignWindow.LoadStrings;
var
  Ind: Integer;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFont.Caption := sdxFonts;
  tshColor.Caption := sdxColors;
  lblPreview.Caption := DropAmpersand(sdxPreview);

  lblShow.Caption := sdxShow;
  chbxShowBorders.Caption := sdxBorderLines;
  chbxShowHorzLines.Caption := sdxHorzLines;
  
  lblMiscellaneous.Caption := sdxMiscellaneous;
  chbxFlatCheckMarks.Caption := sdxFlatCheckMarks;
  chbxRowAutoHeight.Caption := sdxRowAutoHeight;
  lblDrawMode.Caption := sdxDrawMode;
  Ind := cbxDrawMode.ItemIndex;
  cbxDrawMode.Items.BeginUpdate;
  try
    cbxDrawMode.Items.Clear;
    cbxDrawMode.Items.Add(sdxDrawModeStrict);
    cbxDrawMode.Items.Add(sdxDrawModeOddEven);
  finally
    cbxDrawMode.Items.EndUpdate;
  end;
  cbxDrawMode.ItemIndex := Ind;

  chbxTransparent.Caption := sdxTransparent;
  lblColor.Caption := sdxColor;
  lblEvenColor.Caption := sdxEvenColor;
  lblGridLinesColor.Caption := sdxGridLinesColor;

  btnFont.Caption := sdxBtnFont;
  btnEvenFont.Caption := sdxBtnEvenFont;
end;

procedure TdxChlbxReportLinkDesignWindow.CMDialogChar(var message: TCMDialogChar);
var
  I: Integer;
begin
  with PageControl1 do
    for I := 0 to PageControl1.PageCount - 1 do
      if IsAccel(message.CharCode, Pages[I].Caption) then
      begin
        message.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

procedure TdxChlbxReportLinkDesignWindow.UpdateControlsState;
begin
  inherited UpdateControlsState;
  FccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := FccbxColor.Enabled;
  FccbxEvenColor.Enabled := not chbxTransparent.Checked and
    (CheckListBoxReportLink.DrawMode in [gdmOddEven, gdmChess]);
  lblEvenColor.Enabled := FccbxEvenColor.Enabled;
  
  btnEvenFont.Enabled := (CheckListBoxReportLink.DrawMode in [gdmOddEven, gdmChess]);
  if (CheckListBoxReportLink.DrawMode in [gdmOddEven, gdmChess]) then
  begin
    lblColor.Caption := sdxOddColor;
    btnFont.Caption := sdxBtnOddFont;
  end
  else
  begin
    lblColor.Caption := sdxColor;
    btnFont.Caption := sdxBtnFont;
  end;
end;

procedure TdxChlbxReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  chbxShowBorders.Checked := (chlbxpoBorder in CheckListBoxReportLink.Options);
  chbxShowHorzLines.Checked := (chlbxpoHorzLines in CheckListBoxReportLink.Options);
  chbxFlatCheckMarks.Checked := (chlbxpoFlatCheckMarks in CheckListBoxReportLink.Options);
  cbxDrawMode.ItemIndex := Integer(CheckListBoxReportLink.DrawMode);

  chbxTransparent.Checked := CheckListBoxReportLink.Transparent;
  TdxPSColorCombo(FccbxColor).ColorValue := ColorToRGB(CheckListBoxReportLink.Color);
  TdxPSColorCombo(FccbxEvenColor).ColorValue := ColorToRGB(CheckListBoxReportLink.EvenColor);
  TdxPSColorCombo(FccbxGridLineColor).ColorValue := ColorToRGB(CheckListBoxReportLink.GridLineColor);

  FontInfoToText(CheckListBoxReportLink.Font, edFont);
  FontInfoToText(CheckListBoxReportLink.EvenFont, edEvenFont);
end;

procedure TdxChlbxReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
const
  C = 5;
  dxState: array[TCheckBoxState] of UINT = (DFCS_BUTTONCHECK,
    DFCS_BUTTONCHECK or DFCS_CHECKED, DFCS_BUTTON3STATE or DFCS_CHECKED);
  State: array[0..C - 1] of TCheckBoxState = 
    (cbUnchecked, cbChecked, cbGrayed, cbUnchecked, cbChecked);
  dxFlatBorder: array[Boolean] of UINT = (0, DFCS_FLAT);
var
  DC: hDC;
  Brush: HBRUSH;
  i, dY: Integer;
  R2: TRect;
  PrevBkMode: Integer;
  PrevFont: HFONT;
  PrevFontColor: COLORREF;
  uState: UINT;
  S: string;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
  InflateRect(R, -4, -4);
  R2 := R;
  dY := (R.Bottom - R.Top) div C;
  with CheckListBoxReportLink do
  begin
    Brush := SelectObject(DC, CreateSolidBrush(ColorToRGB(GridLineColor)));
    for i := 0 to C do
      if (((i = 0) or (i = C)) and IsDrawBorder) or ((i > 0) and (i < C) and IsDrawHorzLines) then
      begin
        R := Rect(R2.Left + 1, R2.Top + i * dY, R2.Right - 1, R2.Top + i * dY + 1);
        PatBlt(DC, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top, PATCOPY);
      end;
    if IsDrawBorder then
    begin
      R := Rect(R2.Left, R2.Top, R2.Left + 1, R2.Top + dY * C + 1);
      PatBlt(DC, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top, PATCOPY);
      R := Rect(R2.Right - 1, R2.Top, R2.Right, R2.Top + dY * C + 1);
      PatBlt(DC, R.Left, R.Top, R.Right - R.Left, R.Bottom - R.Top, PATCOPY);
    end;
    DeleteObject(SelectObject(DC, Brush));
    PrevBkMode := SetBkMode(DC, Windows.TRANSPARENT);
    PrevFont := GetCurrentObject(DC, OBJ_FONT);
    PrevFontColor := GetTextColor(DC);
    for i := 0 to C - 1 do
    begin
      R := Rect(R2.Left + 1, R2.Top + i * dY + 1, R2.Right - 1, R2.Top + (i + 1) * dY +
        Byte(not IsDrawHorzLines and (i < C - 1)));
      if not Transparent then
      begin
        Brush := CreateSolidBrush(ColorToRGB(CheckListBoxReportLink.GetCellColor(0, i)));
        FillRect(DC, R, Brush);
        DeleteObject(Brush);
      end;  
      InflateRect(R, -2, -2);
      Inc(R.Left, CheckWidth + 2);
      FPreviewFont.Assign(CheckListBoxReportLink.GetCellFont(0, i));
      FPreviewFont.Size := 8;
      SelectObject(DC, FPreviewFont.Handle);
      SetTextColor(DC, ColorToRGB(FPreviewFont.Color));
      S := dxCheckListBoxStrings[i];
      Windows.DrawText(DC, PChar(S), Length(S), 
        R, DT_NOPREFIX or DT_SINGLELINE or 
        dxDrawTextTextAlignX[TextAlignX] or dxDrawTextTextAlignY[TextAlignY]);
      R := Bounds(R2.Left + 2, R2.Top + i * dY + 1 + (dY - CheckHeight) div 2, 
        CheckWidth, CheckHeight);
      uState := DFCS_TRANSPARENT or dxState[State[i]] or dxFlatBorder[IsFlatCheckMarks];
      DrawFrameControl(DC, R, DFC_BUTTON, uState);
    end;
    SetTextColor(DC, PrevFontColor);
    SelectObject(DC, PrevFont);
    SetBkMode(DC, PrevBkMode);
  end;
end;

procedure TdxChlbxReportLinkDesignWindow.chbxShowBordersClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TCheckBox(Sender) do
    if Checked then 
      CheckListBoxReportLink.Options := CheckListBoxReportLink.Options + [TdxCheckListBoxPaintOption(Tag)]
    else  
      CheckListBoxReportLink.Options := CheckListBoxReportLink.Options - [TdxCheckListBoxPaintOption(Tag)];
  Modified := True;
  UpdatePreview;
end;

procedure TdxChlbxReportLinkDesignWindow.chbxRowAutoHeightClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  CheckListBoxReportLink.RowAutoHeight := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxChlbxReportLinkDesignWindow.cbxDrawModeChange(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  CheckListBoxReportLink.DrawMode := TdxGridDrawMode(TComboBox(Sender).ItemIndex);
  Modified := True;
  UpdatePreview;
end;

procedure TdxChlbxReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  CheckListBoxReportLink.Transparent := TCheckBox(Sender).checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxChlbxReportLinkDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;

procedure TdxChlbxReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: CheckListBoxReportLink.Color := AColor;
    1: CheckListBoxReportLink.EvenColor := AColor;    
    2: CheckListBoxReportLink.GridLineColor := AColor;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxChlbxReportLinkDesignWindow.btnFontClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TComponent(Sender).Tag of
    0: FD.Font := CheckListBoxReportLink.Font;
    1: FD.Font := CheckListBoxReportLink.EvenFont;
  end;
  if (dxPrintDevice.Printers.Count > 0) then
    FD.Device := fdPrinter
  else
    FD.Device := fdScreen;
  if FD.Execute then
  begin
    case TComponent(Sender).Tag of
      0:
        begin
          CheckListBoxReportLink.Font := FD.Font;
          FontInfoToText(CheckListBoxReportLink.Font, edFont);
        end;
      1:
        begin
          CheckListBoxReportLink.EvenFont := FD.Font;
          FontInfoToText(CheckListBoxReportLink.EvenFont, edEvenFont);          
        end;
    end;
    Modified := True;
    UpdatePreview;
  end;
end;

procedure TdxChlbxReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
    PaintPreview(Canvas, ClientRect);
end;

procedure TdxChlbxReportLinkDesignWindow.lblComboClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

initialization
  dxPSRegisterReportLink(TdxCheckListBoxReportLink, TCheckListBox, TdxChlbxReportLinkDesignWindow);

finalization
  dxPSUnRegisterReportLink(TdxCheckListBoxReportLink, TCheckListBox, TdxChlbxReportLinkDesignWindow);

end.

