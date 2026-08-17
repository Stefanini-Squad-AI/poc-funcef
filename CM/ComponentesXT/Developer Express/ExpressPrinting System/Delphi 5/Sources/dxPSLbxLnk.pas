
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

unit dxPSLbxLnk;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, checklst,
  dxPSCore, dxPSGrLnks, dxPSGlbl{$IFDEF DELPHI4}, ImgList{$ENDIF};

type
  TdxListBoxPaintOption = (lbxpoBorder, lbxpoHorzLines);
  TdxListBoxPaintOptions = set of TdxListBoxPaintOption;

  TdxListBoxReportLink = class(TdxCustomListBoxReportLink)
  private
    FOptions: TdxListBoxPaintOptions;
    FPaintItemsGraphics: Boolean;
    FTransparentGraphics: Boolean;
    
    function GetOptions: TdxListBoxPaintOptions;
    function GetListBox: TListBox;
    procedure SetOptions(Value: TdxListBoxPaintOptions);
    procedure SetPaintItemsGraphics(Value: Boolean);
    procedure SetTransparentGraphics(Value: Boolean);
  protected
    procedure AssignData(ACol, ARow: Integer; ADataItem: TAbstractdxReportCellData); override;
    function GetDataItemClass(ACol: Integer): TdxReportCellDataClass; override;
    procedure InternalRestoreDefaults; override;
    function IsDrawBorder: Boolean; override;
    function IsDrawHorzLines: Boolean; override;
    procedure SetDrawMode(Value: TdxGridDrawMode); override;
  public
    procedure Assign(Source: TPersistent); override;
    
    property ListBox: TListBox read GetListBox;
  published
    property Color;
    property EndEllipsis;
    property EvenColor;
    property EvenFont;
    property Font;
    property OddColor;
    property OddFont;
    property Options: TdxListBoxPaintOptions read GetOptions write SetOptions
      default [lbxpoBorder..lbxpoHorzLines];
    property Multiline;
    property PaintItemsGraphics: Boolean read FPaintItemsGraphics write SetPaintItemsGraphics
      default False;
    property RowAutoHeight;
    property ScaleFonts;
    property SupportedCustomDraw;
    property Transparent;
    property TransparentGraphics: Boolean read FTransparentGraphics write SetTransparentGraphics
      default False;
    property UseHorzDelimiters;
    property UseVertDelimiters;
    property Width;
    
    property OnCustomDrawItem;
  end;

  TdxLBxReportLinkDesignWindow = class(TAbstractdxReportLinkDesignWindow)
    pnlPreView: TPanel;
    Panel10: TPanel;
    lblPreview: TStaticText;
    PageControl1: TPageControl;
    tshOptions: TTabSheet;
    pnlOptions: TPanel;
    tshColor: TTabSheet;
    pnlColor: TPanel;
    tshFont: TTabSheet;
    pnlFont: TPanel;
    btnFont: TButton;
    edFont: TEdit;
    FD: TFontDialog;
    lblGridLinesColor: TLabel;
    gbxTransparent: TGroupBox;
    lblColor: TLabel;
    chbxTransparent: TCheckBox;
    ilPreview: TImageList;
    bvlColorHolder: TBevel;
    bvlLineColorHolder: TBevel;
    tshBehaviors: TTabSheet;
    Panel1: TPanel;
    Image3: TImage;
    lblSelection: TLabel;
    Bevel3: TBevel;
    chbxOnlySelected: TCheckBox;
    lblEvenColor: TLabel;
    bvlEvenColorHolder: TBevel;
    btnEvenFont: TButton;
    edEvenFont: TEdit;
    chbxPaintItemGraphics: TCheckBox;
    lblShow: TLabel;
    Bevel11: TBevel;
    chbxShowBorders: TCheckBox;
    chbxShowHorzLines: TCheckBox;
    lblMiscellaneous: TLabel;
    Bevel4: TBevel;
    lblDrawMode: TLabel;
    cbxDrawMode: TComboBox;
    chbxRowAutoHeight: TCheckBox;
    chbxTransparentGraphics: TCheckBox;
    procedure chbxOnlySelectedClick(Sender: TObject);
    procedure ccbxColorChange(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure pbxPreviewPaint(Sender: TObject);
    procedure chbxPaintItemGraphicsClick(Sender: TObject);
    procedure chbxTransparentClick(Sender: TObject);
    procedure lblComboClick(Sender: TObject);
    procedure chbxShowBordersClick(Sender: TObject);
    procedure cbxDrawModeChange(Sender: TObject);
    procedure chbxRowAutoHeightClick(Sender: TObject);
    procedure chbxTransparentGraphicsClick(Sender: TObject);
  private
    FccbxColor: TCustomComboBox;
    FccbxEvenColor: TCustomComboBox;
    FccbxGridLineColor: TCustomComboBox;
  
    FItemCount: Integer;
    FPaintWidth: Integer;
    FPaintHeight: Integer;
    FPreviewBox: TCustomPanel;
    FPreviewFont: TFont;
    FRectHeight: Integer;
    FRectWidth: Integer;

    procedure CreateControls;
    function GetListBoxReportLink: TdxListBoxReportLink;
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
    property ListBoxReportLink: TdxListBoxReportLink read GetListBoxReportLink;
  end;

const
  dxDefaultListBoxPaintOptions: TdxListBoxPaintOptions = 
    [Low(TdxListBoxPaintOption)..High(TdxListBoxPaintOption)];

  dxListBoxStrings: array[0..4] of string =
    ('ExpressBars', 'ExpressMasterView', 'ExpressQuantumTreeList', 
     'ExpressQuantumDBGrid', 'ExpressPrinting System');

implementation

{$R *.DFM}

uses
  CommCtrl, dxExtCtrls, dxPSRes, dxPrnDev, dxPSUtl;


{ TdxListBoxReportLink }

procedure TdxListBoxReportLink.Assign(Source: TPersistent);
begin
  inherited Assign(Source);
  if (Source is TdxListBoxReportLink) then
  begin
    Options := TdxListBoxReportLink(Source).Options;
    PaintItemsGraphics := TdxListBoxReportLink(Source).PaintItemsGraphics;
  end;
end;

procedure TdxListBoxReportLink.InternalRestoreDefaults;
begin
  inherited InternalRestoreDefaults;
  Options := dxDefaultListBoxPaintOptions; {[Low(TdxListBoxPaintOptions)..High(TdxListBoxPaintOptions)]}
  PaintItemsGraphics := False;
  TransparentGraphics := False;
end;

function TdxListBoxReportLink.GetListBox: TListBox;
begin
  Result := TListBox(Component);
end;

function TdxListBoxReportLink.IsDrawBorder: Boolean;
begin
  Result := lbxpoBorder in Options;
end;

function TdxListBoxReportLink.IsDrawHorzLines: Boolean;
begin
  Result := lbxpoHorzLines in Options;
end;

procedure TdxListBoxReportLink.SetDrawMode(Value: TdxGridDrawMode);
begin
  if Value > gdmOddEven then Value := gdmOddEven;
  inherited SetDrawMode(Value);
end;

procedure TdxListBoxReportLink.AssignData(ACol, ARow: Integer; ADataItem: TAbstractdxReportCellData);
begin
  inherited AssignData(ACol, ARow, ADataItem);
  if ADataItem is TdxReportCellImage then
    with TdxReportCellImage(ADataItem) do 
    begin
      MakeSpaceForEmptyImage := True;
      ImageTransparent := TransparentGraphics;
      if (ListBox.Items.Objects[ARow] <> nil) and (ListBox.Items.Objects[ARow] is TGraphic) then
        Image := TGraphic(ListBox.Items.Objects[ARow]);
    end;
end;

function TdxListBoxReportLink.GetDataItemClass(ACol: Integer): TdxReportCellDataClass;
begin
  if PaintItemsGraphics then
    Result := TdxReportCellImage
  else
    Result := inherited GetDataItemClass(ACol);
end;

procedure TdxListBoxReportLink.SetPaintItemsGraphics(Value: Boolean);
begin
  if (FPaintItemsGraphics <> Value) then
  begin
    FPaintItemsGraphics := Value;
    LinkModified(True);
  end;
end;

procedure TdxListBoxReportLink.SetTransparentGraphics(Value: Boolean);
begin
  if (FTransparentGraphics <> Value) then
  begin
    FTransparentGraphics := Value;
    LinkModified(True);
  end;
end;

function TdxListBoxReportLink.GetOptions: TdxListBoxPaintOptions;
begin
  Result := FOptions;
end;

procedure TdxListBoxReportLink.SetOptions(Value: TdxListBoxPaintOptions);
begin
  if (FOptions <> Value) then
  begin
    FOptions := Value;
    LinkModified(True);
  end;
end;


{ TdxLBxReportLinkDesignWindow }

constructor TdxLBxReportLinkDesignWindow.Create(AOwner: TComponent);
begin
  HelpContext := dxhcListBoxReportLinkDesigner;
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

destructor TdxLBxReportLinkDesignWindow.Destroy;
begin
  FPreviewFont.Free;
  inherited Destroy;
end;

procedure TdxLBxReportLinkDesignWindow.CreateControls;
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
//   DropDownCount := Items.Count;
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

procedure TdxLBxReportLinkDesignWindow.LoadStrings;
var
  Ind: Integer;
begin
  inherited LoadStrings;
  tshOptions.Caption := sdxOptions;
  tshFont.Caption := sdxFonts;
  tshColor.Caption := sdxColors;
  tshBehaviors.Caption := sdxBehaviors;
  lblPreview.Caption := DropAmpersand(sdxPreview);

  lblShow.Caption := sdxShow;
  chbxShowBorders.Caption := sdxBorderLines;
  chbxShowHorzLines.Caption := sdxHorzLines;
  
  lblMiscellaneous.Caption := sdxMiscellaneous;
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
  
  lblSelection.Caption := sdxSelection;
  chbxOnlySelected.Caption := sdxOnlySelected;
end;

function TdxLBxReportLinkDesignWindow.GetListBoxReportLink: TdxListBoxReportLink;
begin
  Result := TdxListBoxReportLink(ReportLink);
end;

procedure TdxLBxReportLinkDesignWindow.CMDialogChar(var message: TCMDialogChar);
var
  I: Integer;
begin
  inherited;
  with PageControl1 do
    for I := 0 to PageControl1.PageCount - 1 do
      if IsAccel(message.CharCode, Pages[I].Caption) then
      begin
        message.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

procedure TdxLBxReportLinkDesignWindow.UpdateControlsState;

  function IsPaintItemsGraphics: Boolean;
  var
    i: Integer;
    Obj: TObject;
  begin
    Result := True;
      with ListBoxReportLink.ListBox do
        for i := 0 to Items.Count - 1 do
        begin
          Obj := Items.Objects[i];
          try
            if Assigned(Obj) and (Obj is TGraphic) then Exit;
          except
          end;
        end;
    Result := False;
  end;
  
begin
  inherited UpdateControlsState;       
  
  FccbxColor.Enabled := not chbxTransparent.Checked;
  lblColor.Enabled := FccbxColor.Enabled;
  FccbxEvenColor.Enabled := not chbxTransparent.Checked and
    (ListBoxReportLink.DrawMode in [gdmOddEven, gdmChess]);
  lblEvenColor.Enabled := FccbxEvenColor.Enabled;
  
  chbxOnlySelected.Enabled := 
    (ListBoxReportLink.ListBox = nil) or ListBoxReportLink.ListBox.MultiSelect;
  chbxPaintItemGraphics.Enabled := 
    (ListBoxReportLink.ListBox = nil) or IsPaintItemsGraphics;
  chbxTransparentGraphics.Enabled := chbxPaintItemGraphics.Checked;
  if (ListBoxReportLink.DrawMode in [gdmOddEven, gdmChess]) then
  begin
    lblColor.Caption := sdxOddColor;
    btnFont.Caption := sdxBtnOddFont;
  end
  else
  begin
    lblColor.Caption := sdxColor;
    btnFont.Caption := sdxBtnFont;
  end;
  btnEvenFont.Enabled := ListBoxReportLink.DrawMode in [gdmOddEven, gdmChess];
//    (ListBoxReportLink.ListBox.Style in [lbOwnerDrawVariable, lbOwnerDrawFixed]);
end;

procedure TdxLBxReportLinkDesignWindow.DoInitialize;
begin
  inherited DoInitialize;
  chbxShowBorders.Checked := (lbxpoBorder in ListBoxReportLink.Options);
  chbxShowHorzLines.Checked := (lbxpoHorzLines in ListBoxReportLink.Options);
  chbxPaintItemGraphics.Checked := ListBoxReportLink.PaintItemsGraphics;
  chbxTransparentGraphics.Checked := ListBoxReportLink.TransparentGraphics;  
  cbxDrawMode.ItemIndex := Integer(ListBoxReportLink.DrawMode);  
  
  chbxTransparent.checked := ListBoxReportLink.Transparent;
  TdxPSColorCombo(FccbxColor).ColorValue := ColorToRGB(ListBoxReportLink.Color);
  TdxPSColorCombo(FccbxEvenColor).ColorValue := ColorToRGB(ListBoxReportLink.EvenColor);  
  TdxPSColorCombo(FccbxGridLineColor).ColorValue := ColorToRGB(ListBoxReportLink.GridLineColor);
  
  FontInfoToText(ListBoxReportLink.Font, edFont);          
  FontInfoToText(ListBoxReportLink.EvenFont, edEvenFont);
  
  chbxOnlySelected.Checked := ListBoxReportLink.OnlySelected;
end;

procedure TdxLBxReportLinkDesignWindow.PaintPreview(ACanvas: TCanvas; R: TRect);
const
  C = 5;
var
  DC: hDC;
  Brush: HBRUSH;
  i, dY, Offset: Integer;
  R2: TRect;
  PrevBkMode: Integer;
  PrevFont: HFONT;
  PrevFontColor: COLORREF;
  S: string;
begin
  DC := ACanvas.Handle;
  FillRect(DC, R, HBRUSH(COLOR_WINDOW + 1));
  InflateRect(R, -4, -4);
  R2 := R;
  dY := (R.Bottom - R.Top) div C;
  with ListBoxReportLink do
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
        Brush := CreateSolidBrush(ColorToRGB(ListBoxReportLink.GetCellColor(0, i)));
        FillRect(DC, R, Brush);
        DeleteObject(Brush);
      end;  
      Offset := 1;
      if PaintItemsGraphics then
      begin
        Inc(R.Left);
        ImageList_DrawEx(ilPreview.Handle, 0, DC, R.Left, R.Top + (dY - ilPreview.Height) div 2, 
          0, 0, CLR_NONE, CLR_NONE, ILD_NORMAL);
        Inc(Offset, ilPreview.Width + 1);
      end;
      Inc(R.Left, Offset);
      InflateRect(R, -2, -2);
      FPreviewFont.Assign(ListBoxReportLink.GetCellFont(0, i));
      FPreviewFont.Size := 8;
      SelectObject(DC, FPreviewFont.Handle);
      SetTextColor(DC, ColorToRGB(FPreviewFont.Color));
      S := dxListBoxStrings[i];
      Windows.DrawText(DC, PChar(S), Length(S), R, 
        DT_NOPREFIX or DT_SINGLELINE or dxDrawTextTextAlignX[TextAlignX] or dxDrawTextTextAlignY[TextAlignY]);  
    end;
    SetTextColor(DC, PrevFontColor);    
    SelectObject(DC, PrevFont);
    SetBkMode(DC, PrevBkMode);
  end;
end;

procedure TdxLBxReportLinkDesignWindow.chbxOnlySelectedClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  ListBoxReportLink.OnlySelected := TCheckBox(Sender).checked;
  Modified := True;
end;

procedure TdxLBxReportLinkDesignWindow.chbxPaintItemGraphicsClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  ListBoxReportLink.PaintItemsGraphics := TCheckBox(Sender).Checked;
  Modified := True;
  FPreviewBox.Invalidate;
end;

procedure TdxLBxReportLinkDesignWindow.chbxTransparentGraphicsClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  ListBoxReportLink.TransparentGraphics := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxLBxReportLinkDesignWindow.chbxRowAutoHeightClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  ListBoxReportLink.RowAutoHeight := TCheckBox(Sender).Checked;
  Modified := True;
end;

procedure TdxLBxReportLinkDesignWindow.cbxDrawModeChange(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  ListBoxReportLink.DrawMode := TdxGridDrawMode(TComboBox(Sender).ItemIndex);
  Modified := True;
  UpdatePreview;
end;

procedure TdxLBxReportLinkDesignWindow.chbxShowBordersClick(
  Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  with TCheckBox(Sender) do
    if Checked then 
      ListBoxReportLink.Options := ListBoxReportLink.Options + [TdxListBoxPaintOption(Tag)]
    else  
      ListBoxReportLink.Options := ListBoxReportLink.Options - [TdxListBoxPaintOption(Tag)];
  Modified := True;
  UpdatePreview;
end;

procedure TdxLBxReportLinkDesignWindow.chbxTransparentClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  ListBoxReportLink.Transparent := TCheckBox(Sender).Checked;
  Modified := True;
  UpdatePreview;
end;

procedure TdxLBxReportLinkDesignWindow.UpdatePreview;
begin
  FPreviewBox.Invalidate;
end;
  
procedure TdxLBxReportLinkDesignWindow.ccbxColorChange(Sender: TObject);
var
  AColor: TColor;
begin
  if LockControlsUpdate then Exit;
  AColor := TdxPSColorCombo(Sender).ColorValue;
  case TdxPSColorCombo(Sender).Tag of
    0: ListBoxReportLink.Color := AColor;
    1: ListBoxReportLink.EvenColor := AColor;
    2: ListBoxReportLink.GridLineColor := AColor;
  end;
  Modified := True;
  UpdatePreview;
end;

procedure TdxLBxReportLinkDesignWindow.btnFontClick(Sender: TObject);
begin
  if LockControlsUpdate then Exit;
  case TComponent(Sender).Tag of
    0: FD.Font := ListBoxReportLink.Font;
    1: FD.Font := ListBoxReportLink.EvenFont;
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
          ListBoxReportLink.Font := FD.Font;
          FontInfoToText(ListBoxReportLink.Font, edFont);          
        end;
      1:
        begin
          ListBoxReportLink.EvenFont := FD.Font;
          FontInfoToText(ListBoxReportLink.EvenFont, edEvenFont);
        end;
    end;
    Modified := True;
    UpdatePreview;
  end;
end;

procedure TdxLBxReportLinkDesignWindow.pbxPreviewPaint(Sender: TObject);
begin
  with TdxPSPaintPanel(Sender) do
    PaintPreview(Canvas, ClientRect);
end;

procedure TdxLBxReportLinkDesignWindow.lblComboClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

initialization
  dxPSRegisterReportLink(TdxListBoxReportLink, TListBox, TdxLBxReportLinkDesignWindow);

finalization
  dxPSUnregisterReportLink(TdxListBoxReportLink, TListBox, TdxLBxReportLinkDesignWindow);

end.
