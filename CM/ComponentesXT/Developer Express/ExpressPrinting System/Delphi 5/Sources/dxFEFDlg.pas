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

unit dxFEFDlg;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Consts,
  StdCtrls, ExtCtrls, ComCtrls, Grids, ExtDlgs, Menus, Registry,
{$IFDEF DELPHI4}ImgList, {$ENDIF}
  dxPSForm, dxBkgnd;

type
  TdxFillAs = (faNone, faTexture, faPattern, faPicture);

  TdxFEFDialog = class(TCustomdxPSForm)
    PageControl1: TPageControl;
    tshTexture: TTabSheet;
    tshPattern: TTabSheet;
    tshPicture: TTabSheet;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    dgTexture: TDrawGrid;
    pnlTextureName: TPanel;
    lblForeground: TLabel;
    lblBackground: TLabel;
    dgPattern: TDrawGrid;
    pnlPatternName: TPanel;
    btnOtherTexture: TButton;
    sbxPicture: TScrollBox;
    pnlPictureName: TPanel;
    btnSelectPicture: TButton;
    cbxPaintMode: TComboBox;
    lblPaintMode: TLabel;
    Bevel4: TBevel;
    pnlPicture: TPanel;
    pbxPicture: TPaintBox;
    btnPreview: TButton;
    btnInvert: TButton;
    bvlForeColorHolder: TBevel;
    bvlBackColorHolder: TBevel;
    pnlPreview: TPanel;
    pbxPreview: TPaintBox;
    lblSample: TLabel;
    btnHelp: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    pmPicture: TPopupMenu;
    miCut: TMenuItem;
    miCopy: TMenuItem;
    miPaste: TMenuItem;
    miDelete: TMenuItem;
    miPreview: TMenuItem;
    miLoad: TMenuItem;
    ilMenu: TImageList;
    N2: TMenuItem;
    procedure dgTextureDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dgPatternDrawCell(Sender: TObject; Col, Row: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SelectPictureClick(Sender: TObject);
    procedure btnOtherTextureClick(Sender: TObject);
    procedure dgTextureClick(Sender: TObject);
    procedure dgPatternClick(Sender: TObject);
    procedure pbxPreviewPaint(Sender: TObject);
    procedure pbxPicturePaint(Sender: TObject);
    procedure cbxColorChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PicturePreviewClick(Sender: TObject);
    procedure cbxPaintModeChange(Sender: TObject);
    procedure lblPaintModeClick(Sender: TObject);
    procedure lblForegroundClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure dgTextureDblClick(Sender: TObject);
    procedure dgPatternDblClick(Sender: TObject);
    procedure dgTextureMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dgPatternMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnInvertClick(Sender: TObject);
    procedure pmPicturePopup(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
    procedure miPasteClick(Sender: TObject);
    procedure miDeleteClick(Sender: TObject);
    procedure miCutClick(Sender: TObject);
  private
    cbxBackColor: TCustomComboBox;
    cbxForeColor: TCustomComboBox;
    FActivePage: Integer;
    FApplied: Boolean;
    FBackground: TdxBackground;
    FbmpPattern: TBitmap;
    FbmpCurrentPattern: TBitmap;
    FbmpTexture: TBitmap;
    FControlsUpdating: Boolean;
    FFirstApplied: Boolean;
    FHourGlassCursor: Boolean;
    FInitialDir: string;
    FModified: Boolean;
    FOriginalBackground: TdxBackground;
    FOtherPicture: TGraphic;
    FOtherPictureName: string;
    FOtherTexture: TBitmap;
    FOtherTextureName: string;
    FPatternNames: TStringList;
    FPatternWasSelected: Boolean;
    FPicture: TGraphic;
    FPictureExists: Boolean;
    FPreviewWhat: TdxFillAs;
    FSaveCursor: TCursor;
    FTextureWasSelected: Boolean;
    FTextureNames: TStringList;
    FOnApply: TNotifyEvent;

    function GetBackColor: TColor;
    function GetForeColor: TColor;
    function GetOtherPicture(AGraphicClass: TGraphicClass): TGraphic;
    function GetOtherTexture: TBitmap;
    function GetPaintMode: TdxPicturePaintMode;
    function GetPicture: TGraphic;
    function GetSelectWhat: TdxFillAs;
    procedure SetBackColor(Value: TColor);
    procedure SetBackground(Value: TdxBackground);
    procedure SetForeColor(Value: TColor);
    procedure SetOtherTexture(Value: TBitmap);
    procedure SetPaintMode(Value: TdxPicturePaintMode);
    procedure SetPicture(Value: TGraphic);
    procedure SetSelectWhat(Value: TdxFillAs);

    procedure AssignPicture(AImage: TGraphic);
    procedure CheckModified;
    function CopyPattern(I, J: Integer): TBitmap;
    function CopyTexture(I, J: Integer): TBitmap;
    procedure CreateControls;
    procedure DrawSelectedFrame(ADrawGrid: TDrawGrid; Rect: TRect);
    procedure DoApply;
    procedure DoInvertColors;
    procedure FreeResources;
    function InternalLoadImage(var AImage: TGraphic; const AFileName: string): Boolean;
    procedure LoadImage(var AImage: TGraphic; AWhat: Integer);
    procedure LoadResources;
    procedure MapPatternColors;
    procedure opdlgShow(Sender: TObject);
    procedure PaintPicture;
    procedure PaintPreview;
    procedure StartSetting;
    procedure SetupDialog;
    procedure UpdateControlsState;

    procedure CMDialogChar(var Msg: TCMDialogChar); message CM_DIALOGCHAR;
    procedure WMCancelMode(var Msg: TWMCancelMode); message WM_CANCELMODE;

    property BackColor: TColor read GetBackColor write SetBackColor;
    property ForeColor: TColor read GetForeColor write SetForeColor;
    property OtherTexture: TBitmap read GetOtherTexture write SetOtherTexture;
    property PaintMode: TdxPicturePaintMode read GetPaintMode write SetPaintMode;
    property Picture: TGraphic read GetPicture write SetPicture;
    property SelectWhat: TdxFillAs read GetSelectWhat write SetSelectWhat;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;

    procedure LoadFromRegistry(const APath: string); override;
    procedure SaveToRegistry(const APath: string); override;

    property Background: TdxBackground read FBackground write SetBackground;
    property OnApply: TNotifyEvent read FOnApply write FOnApply;
  end;

function dxFEFDialog(ABackground: TdxBackground): Boolean;
function StandardGetGraphicClassProc(const AFileName: string): TGraphicClass;

type
  TdxGetGraphicClassProc = function(const AFileName: string): TGraphicClass;

var
  GetGraphicClassProc: TdxGetGraphicClassProc = StandardGetGraphicClassProc;

implementation

{$R *.DFM}

uses
  ClipBrd,
  dxPSGlbl, dxExtCtrls, dxPSPopupMan, dxPcPrVw, dxPSRes, dxPSImgs, dxPSUtl;

const
  cTextureCount: TPoint = (X: 4; Y: 6);
  cTextureSize: TPoint = (X: 64; Y: 64);
  cPatternCount: TPoint = (X: 8; Y: 6);
  cPatternSize: TPoint = (X: 8; Y: 8);

type
  TGraphicAccess = class(TGraphic);
  TGraphicClassAccess = class of TGraphicAccess;

function dxCreateMappedBmp(ASource: TBitmap;
  const OldColors, NewColors: array of TColor): TBitmap;
var
  i, j, k: Integer;
begin
  Result := TBitmap.Create;
  try
    Result.Width := ASource.Width;
    Result.Height := ASource.Height;
    for i := 0 to ASource.Width - 1 do
      for j := 0 to ASource.Height - 1 do
        for k := Low(OldColors) to High(OldColors) do
          if (ASource.Canvas.Pixels[i, j] = OldColors[k]) then
          begin
            Result.Canvas.Pixels[i, j] := NewColors[k];
            Break;
          end
          else
            Result.Canvas.Pixels[i, j] := ASource.Canvas.Pixels[i, j];
  except
    Result.Free;
    raise;
  end;
end;

(*
type
  PColorTriple = ^TColorTriple;
  TColorTriple = record
    0: Red, Green, Blue: Byte;
  end;

  PColorTripleArray = ^TColorTripleArray;
  TColorTripleArray = array[0..0] of TColorTriple;

function dxCreateMappedBmp2(ASource: TBitmap;
    const OldColors, NewColors: array of TColorTriple): TBitmap;
var
  i, j, k: Integer;
  ScanLine: PColorTripleArray;
  ColotTriple: PColorTriple;
begin
  Result := TBitmap.Create;
  try
    Result.Assign(ASource);
    for i := 0 to ASource.Height - 1 do
    begin
      ScanLine := PColorTripleArray(Result.ScanLine[i]);
      for j := 0 to ASource.Width - 1 do
      begin
{$IFOPT R+} {$DEFINE PREVRANGECHECK} {$R-} {$ENDIF}
        ColorTriple := Addr(ScanLine^[j]);
{$IFDEF SAVERANGECHECK} {$UNDEF PREVRANGECHECK} {$R+} {$ENDIF}
        for k := Low(OldColors) to High(OldColors) do
          if CompareMem(ColorTriple, @OldColors[k], SizeOf(TColorTriple)) <> 0 then
          begin
            ColorTriple^ := NewColors[k];
            Break;
          end;
      end;
    end;
  except
    Result.Free;
    raise;
  end;
end;
*)


type
  TdxBackgroundHack = class(TdxBackground);

function dxFEFDialog(ABackground: TdxBackground): Boolean;
var
  FEFDlg: TdxFEFDialog;
  b: TBitmap;
begin
  Result := False;
  if ABackground = nil then Exit;

  FEFDlg := TdxFEFDialog.Create(nil);
  try
    FEFDlg.Background := ABackground;
    FEFDlg.FOriginalBackground := ABackground;
    FEFDlg.OnApply := TdxBackgroundHack(ABackground).OnApply;
    Result := FEFDlg.Execute or not FEFDlg.FFirstApplied; {at least one time the button "Apply" was pressed}
    if FEFDlg.ModalResult <> mrOK then Exit;
    if Result then
    begin
      ABackground.BkColor := FEFDlg.BackColor;
      ABackground.Brush.Color := FEFDlg.ForeColor;
      ABackground.Picture := FEFDlg.Picture;
      case FEFDlg.SelectWhat of
        faTexture:
          ABackground.Mode := bmBrushBitmap;
        faPattern:
          begin
            b := TBitmap(ABackground.Picture);
            b.Width := cPatternSize.X;
            b.Height := cPatternSize.Y;
            b.Canvas.Draw(-FEFDlg.dgPattern.Col * cPatternSize.X,
              -FEFDlg.dgPattern.Row * cPatternSize.Y, FEFDlg.FbmpCurrentPattern);
            ABackground.Mode := bmBrushBitmap;
          end;
        faPicture:
          begin
            ABackground.Mode := bmPicture;
            ABackground.PictureMode := FEFDlg.PaintMode;
          end;
      end;
    end;
  finally
    FEFDlg.Free;
  end;
end;

function StandardGetGraphicClassProc(const AFileName: string): TGraphicClass;
var
  Extention: string;
begin
  Result := nil;
  Extention := ExtractFileExt(AFileName);
  if CompareText(Extention, '.' + GraphicExtension(TBitmap)) = 0 then
    Result := TBitmap
  else
    if CompareText(Extention, '.' + GraphicExtension(TMetafile)) = 0 then
      Result := TMetafile
    else
      if CompareText(Extention, '.wmf') = 0 then
        Result := TMetafile;
end;

{ TdxFEFDialog }

constructor TdxFEFDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxhcFEFDlg;

  FFirstApplied := True;
  CreateControls;
  LoadResources;
  FPreviewWhat := faNone;
  FPatternWasSelected := False;
  FTextureWasSelected := False;
  FPictureExists := False;
{$IFDEF DELPHI4}
  pmPicture.Images := ilMenu;
  miLoad.ImageIndex := 0;
  miPreview.ImageIndex := 1;
  miCut.ImageIndex := 2;
  miCopy.ImageIndex := 3;
  miPaste.ImageIndex := 4;
  miDelete.ImageIndex := 5;
{$ENDIF}
  dxPSRegisterControlWithPopup(sbxPicture);
end;

destructor TdxFEFDialog.Destroy;
begin
  dxPSUnregisterControlWithPopup(sbxPicture);
  if FPatternNames <> nil then FPatternNames.Free;
  if FTextureNames <> nil then FTextureNames.Free;
  if FBackground <> nil then FBackground.Free;
  FreeResources;
  if FPicture <> nil then FPicture.Free;
  if FOtherTexture <> nil then FOtherTexture.Free;
  if FOtherPicture <> nil then FOtherPicture.Free;
  inherited Destroy;
end;

procedure TdxFEFDialog.CreateControls;
begin
  cbxForeColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(cbxForeColor) do
  begin
    BoundsRect := bvlForeColorHolder.BoundsRect;
    Parent := tshPattern;
    TabOrder := 1;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowCustomColor := False;
//    DropDownCount := Items.Count;
    OnChange := cbxColorChange;
  end;
  lblForeground.FocusControl := cbxForeColor;

  cbxBackColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(cbxBackColor) do
  begin
    BoundsRect := bvlBackColorHolder.BoundsRect;
    Parent := tshPattern;
    TabOrder := 2;
    ColorTypes := [ctPure];
    ShowColorName := True;
    ShowCustomColor := False;
//    DropDownCount := Items.Count;
    OnChange := cbxColorChange;
  end;
  lblBackground.FocusControl := cbxBackColor;

  FBackground := TdxBackground.Create;
  FPicture := TBitmap.Create;
  FPatternNames := TStringList.Create;
  FTextureNames := TStringList.Create;
end;

procedure TdxFEFDialog.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WindowClass.Style := Params.WindowClass.Style or CS_SAVEBITS;
end;

procedure TdxFEFDialog.Loaded;
begin
  inherited Loaded;
  if (Screen.PixelsPerInch > 96) then
  begin
    dgTexture.DefaultColWidth := (dgTexture.Width - GetSystemMetrics(SM_CXHSCROLL) - 1) div 4 - 1;
    dgTexture.Width := dgTexture.Width - 1;
    dgTexture.DefaultRowHeight := dgTexture.DefaultColWidth;
    dgTexture.Height := dgTexture.Height - 2;
    dgPattern.Width := dgPattern.Width - dgPattern.Width mod dgPattern.ColCount + 7;
    dgPattern.DefaultColWidth := (dgPattern.Width - 1) div dgPattern.ColCount;
    dgPattern.Height := dgPattern.Height - dgPattern.Height mod dgPattern.RowCount + 11;
    dgPattern.DefaultRowHeight := dgPattern.Height div dgPattern.RowCount;
  end;
  with dgTexture do
    pnlTextureName.SetBounds(Left, BoundsRect.Bottom + 3, Width, pnlTextureName.Height);
  with dgPattern do
    pnlPatternName.SetBounds(Left, BoundsRect.Bottom + 3, Width, pnlPatternName.Height);
  btnInvert.SetBounds(dgPattern.Left, btnInvert.Top, dgPattern.Width, btnInvert.Height);
end;

procedure TdxFEFDialog.CMDialogChar(var Msg: TCMDialogChar);
var
  I: Integer;
begin
  inherited;
  with PageControl1 do
    for I := 0 to PageCount - 1 do
      if IsAccel(Msg.CharCode, Pages[I].Caption) then
      begin
        Msg.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

procedure TdxFEFDialog.WMCancelMode(var Msg: TWMCancelMode);
begin
  inherited;
  dgPattern.Invalidate;
  dgTexture.Invalidate;
end;

function TdxFEFDialog.Execute: Boolean;
begin
  StartSetting;
  Result := (ShowModal = mrOk) and FModified;
end;

procedure TdxFEFDialog.SetBackground(Value: TdxBackground);
begin
  FBackground.Assign(Value);
  SetupDialog;
  UpdateControlsState;
end;

procedure TdxFEFDialog.SetupDialog;
var
  bmp: TBitmap;
  I, J: Integer;
begin
  FControlsUpdating := True;
  try
    cbxPaintMode.ItemIndex := Integer(Background.PictureMode);
    ForeColor := FBackground.Brush.Color;
    BackColor := FBackground.BkColor;
    if (BackColor = ForeColor) and (ForeColor = clWhite) then ForeColor := clBlack;
    MapPatternColors;
    if Assigned(FBackground.Picture) then
    begin
      case FBackground.Mode of
        bmNone: ;
        bmBrush: ;
        bmBrushBitmap:
          begin
            PageControl1.ActivePage := tshPattern;
            for I := 0 to cPatternCount.X - 1 do
              for J := 0 to cPatternCount.Y - 1 do
              begin
                bmp := CopyPattern(I, J);
                try
                  if dxIsEqualBitmap(bmp, TBitmap(FBackground.Picture)) then
                  begin
                    FPatternWasSelected := True;
                    dgPattern.Col := I;
                    dgPattern.Row := J;
                    FPicture.Assign(TBitmap(FBackground.Picture));
                    FPreviewWhat := faPattern;
                    dgPatternClick(dgPattern);
                  end;
                finally
                  bmp.Free;
                end;
              end;

            PageControl1.ActivePage := tshTexture;
            for I := 0 to cTextureCount.X - 1 do
              for J := 0 to cTextureCount.Y - 1 do
              begin
                bmp := CopyTexture(I, J);
                try
                  if dxIsEqualBitmap(bmp, TBitmap(FBackground.Picture)) then
                  begin
                    FTextureWasSelected := True;
                    dgTexture.Col := I;
                    dgTexture.Row := J;
                    if (dgTexture.Row > 2) then dgTexture.TopRow := dgTexture.Row - 2;
                    FPicture.Assign(TBitmap(FBackground.Picture));
                    FPreviewWhat := faTexture;
                    dgTextureClick(dgTexture);
                  end;
                finally
                  bmp.Free;
                end;
              end;
          end;

        bmPicture:
          begin
            FPicture.Assign(TBitmap(FBackground.Picture));
            GetOtherPicture(TGraphicClass(FBackground.Picture.ClassType)).Assign(FBackground.Picture);
            FPictureExists := True;
            FPreviewWhat := faPicture;
            PageControl1.ActivePage := tshPicture;
            PaintPicture;
          end;
      end;
    end;
  finally
    FControlsUpdating := False;
  end;
  pbxPreview.Invalidate;
end;

procedure TdxFEFDialog.UpdateControlsState;
var
  b: Boolean;
begin
  b := FModified and (FPicture <> nil) and not FPicture.Empty;
  btnApply.Visible := Assigned(OnApply);
  btnApply.Enabled := b and not FApplied;
 // btnOK.Enabled := b;
  btnInvert.Enabled := BackColor <> ForeColor;
  btnPreview.Enabled := (FOtherPicture <> nil) and
    ((FOtherPicture.Width > sbxPicture.ClientWidth) or
    (FOtherPicture.Height > sbxPicture.ClientHeight));
  cbxPaintMode.Enabled := FOtherPicture <> nil;
  lblPaintMode.Enabled := FOtherPicture <> nil;
end;

procedure TdxFEFDialog.CheckModified;
begin
  if not FModified then FModified := True;
  FApplied := False;
  UpdateControlsState;
end;

procedure TdxFEFDialog.StartSetting;
begin
  FModified := False;
  FControlsUpdating := True;
  try
    with PageControl1 do
      ActivePage := Pages[FActivePage];
    btnHelp.Visible := HelpContext <> 0;
  finally
    UpdateControlsState;
    FControlsUpdating := False;
  end;
end;

procedure TdxFEFDialog.LoadResources;
var
  Ind: Integer;
begin
  FbmpPattern := TBitmap.Create;
  FbmpPattern.Width := cPatternCount.X * cPatternSize.X;
  FbmpPattern.Height := cPatternCount.Y * cPatternSize.Y;
  FbmpPattern.LoadFromResourceID(SysInit.HInstance, DXFEF_PATTERNS);

  FbmpTexture := TBitmap.Create;
  FbmpTexture.Width := cTextureCount.X * cTextureSize.X;
  FbmpTexture.Height := cTextureCount.Y * cTextureSize.Y;
  FbmpTexture.LoadFromResourceID(SysInit.HInstance, DXFEF_TEXTURES);

  miLoad.Caption := sdxMenuLoad;
  miPreview.Caption := sdxMenuPreview;
  miCut.Caption := sdxMenuEditCut;
  miCopy.Caption := sdxMenuEditCopy;
  miPaste.Caption := sdxMenuEditPaste;
  miDelete.Caption := sdxMenuEditDelete;

  tshTexture.Caption := sdxTexture;
  tshPattern.Caption := sdxPattern;
  tshPicture.Caption := sdxPicture;
  btnOtherTexture.Caption := sdxBtnOtherTexture;
  lblForeground.Caption := sdxForeground;
  lblBackground.Caption := sdxBackground;
  btnInvert.Caption := sdxBtnInvertColors;
  btnPreview.Caption := sdxBtnPreview;
  btnSelectPicture.Caption := sdxBtnSelectPicture;
  lblPaintMode.Caption := sdxPaintMode;
  lblSample.Caption := sdxSample;
  btnOK.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
  btnApply.Caption := sdxBtnApply;
  Caption := sdxFEFCaption;
  Ind := cbxPaintMode.ItemIndex;
  with cbxPaintMode.Items do
  begin
    BeginUpdate;
    try
      Clear;
      Add(sdxPaintModeCenter);
      Add(sdxPaintModeStretch);
      Add(sdxPaintModeTile);
      Add(sdxPaintModeProportional);
    finally
      EndUpdate;
    end;
  end;
  cbxPaintMode.ItemIndex := Ind;

  with FPatternNames do
  begin
    BeginUpdate;
    try
      Clear;
      Add(sdxPatternGray5);
      Add(sdxPatternGray10);
      Add(sdxPatternGray20);
      Add(sdxPatternGray25);
      Add(sdxPatternGray30);
      Add(sdxPatternGray40);
      Add(sdxPatternGray50);
      Add(sdxPatternGray60);
      Add(sdxPatternGray70);
      Add(sdxPatternGray75);
      Add(sdxPatternGray80);
      Add(sdxPatternGray90);
      Add(sdxPatternLightDownwardDiagonal);
      Add(sdxPatternLightUpwardDiagonal);
      Add(sdxPatternDarkDownwardDiagonal);
      Add(sdxPatternDarkUpwardDiagonal);
      Add(sdxPatternWideDownwardDiagonal);
      Add(sdxPatternWideUpwardDiagonal);
      Add(sdxPatternLightVertical);
      Add(sdxPatternLightHorizontal);
      Add(sdxPatternNarrowVertical);
      Add(sdxPatternNarrowHorizontal);
      Add(sdxPatternDarkVertical);
      Add(sdxPatternDarkHorizontal);
      Add(sdxPatternDashedDownward);
      Add(sdxPatternDashedUpward);
      Add(sdxPatternDashedVertical);
      Add(sdxPatternDashedHorizontal);
      Add(sdxPatternSmallConfetti);
      Add(sdxPatternLargeConfetti);
      Add(sdxPatternZigZag);
      Add(sdxPatternWave);
      Add(sdxPatternDiagonalBrick);
      Add(sdxPatternHorizantalBrick);
      Add(sdxPatternWeave);
      Add(sdxPatternPlaid);
      Add(sdxPatternDivot);
      Add(sdxPatternDottedGrid);
      Add(sdxPatternDottedDiamond);
      Add(sdxPatternShingle);
      Add(sdxPatternTrellis);
      Add(sdxPatternSphere);
      Add(sdxPatternSmallGrid);
      Add(sdxPatternLargeGrid);
      Add(sdxPatternSmallCheckedBoard);
      Add(sdxPatternLargeCheckedBoard);
      Add(sdxPatternOutlinedDiamond);
      Add(sdxPatternSolidDiamond);
    finally
      EndUpdate;
    end;
  end;
  with FTextureNames do
  begin
    BeginUpdate;
    try
      Clear;
      Add(sdxTextureNewSprint);
      Add(sdxTextureGreenMarble);
      Add(sdxTextureBlueTissuePaper);
      Add(sdxTexturePapyrus);
      Add(sdxTextureWaterDroplets);
      Add(sdxTextureCork);
      Add(sdxTextureRecycledPaper);
      Add(sdxTextureWhiteMarble);
      Add(sdxTexturePinkMarble);
      Add(sdxTextureCanvas);
      Add(sdxTexturePaperBag);
      Add(sdxTextureWalnut);
      Add(sdxTextureParchment);
      Add(sdxTextureBrownMarble);
      Add(sdxTexturePurpleMesh);
      Add(sdxTextureDenim);
      Add(sdxTextureFishFossil);
      Add(sdxTextureOak);
      Add(sdxTextureStationary);
      Add(sdxTextureGranite);
      Add(sdxTextureBouquet);
      Add(sdxTextureWonenMat);
      Add(sdxTextureSand);
      Add(sdxTextureMediumWood);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TdxFEFDialog.FreeResources;
begin
  FbmpPattern.Free;
  FbmpCurrentPattern.Free;
  FbmpTexture.Free;
end;

procedure TdxFEFDialog.dgTextureDrawCell(Sender: TObject;
  Col, Row: Integer; Rect: TRect; State: TGridDrawState);
var
  R: TRect;
  DrawGrid: TDrawGrid absolute Sender;
  DC: hDC;
  BPP: Integer;
  DoHalftone: Boolean;
  Pt: TPoint;
  ABitmap: Windows.TBitmap;
  BltMode: Integer;
begin
  DC := DrawGrid.Canvas.Handle;
  R := Rect;
  if not ((gdSelected in State) and FTextureWasSelected) then
  begin
    if not Assigned(FOtherTexture) or
      (Assigned(FOtherTexture) and ((Row < DrawGrid.RowCount - 1) or (Col = 0)))
      then
    begin
      //DrawEdge(DC, Rect, BDR_SUNKENOUTER, BF_RIGHT or BF_BOTTOM or BF_FLAT);
      DrawEdge(DC, R, EDGE_SUNKEN, BF_RECT);
      InflateRect(R, -2, -2);
    end;
  end
  else
    InflateRect(R, -2, -2);

  BltMode := GetStretchBltMode(DC);
  if not Assigned(FOtherTexture) or (Row < DrawGrid.RowCount - 1) then
  begin
    BPP := GetDeviceCaps(DC, BITSPIXEL) * GetDeviceCaps(DC, PLANES);
    GetObject(FbmpTexture.Handle, SizeOf(Windows.TBitmap), @ABitmap);
    DoHalftone := (BPP <= 8) and (BPP < (ABitmap.bmBitsPixel * ABitmap.bmPlanes));
    if DoHalftone then
    begin
      GetBrushOrgEx(DC, Pt);
      SetStretchBltMode(DC, HALFTONE);
      SetBrushOrgEx(DC, Pt.x, Pt.y, @Pt);
    end
    else if not FbmpTexture.Monochrome then
      SetStretchBltMode(DC, STRETCH_DELETESCANS);
  end;
  if not Assigned(FOtherTexture) then
    Windows.StretchBlt(DC, R.Left, R.Top, R.Right - R.Left,
      R.Bottom - R.Top, FbmpTexture.Canvas.Handle, Col * cTextureSize.X,
      Row * cTextureSize.Y, cTextureSize.X, cTextureSize.Y, SRCCOPY)
  else if (Row < DrawGrid.RowCount - 1) then
    Windows.StretchBlt(DC, R.Left, R.Top, R.Right - R.Left,
      R.Bottom - R.Top, FbmpTexture.Canvas.Handle, Col * cTextureSize.X,
      Row * cTextureSize.Y, cTextureSize.X, cTextureSize.Y, SRCCOPY)
  else if (Col = 0) then
    DrawGrid.Canvas.StretchDraw(R, FOtherTexture)
  else
    Windows.FillRect(DC, Rect, hBrush(COLOR_BTNFACE + 1));
  SetStretchBltMode(DC, BltMode);

  if (gdSelected in State) then
    if (FTextureWasSelected and not Assigned(FOtherTexture)) or
      (Assigned(FOtherTexture) and ((Row < DrawGrid.RowCount - 1) or (DrawGrid.Col = 0)))
      then
      DrawSelectedFrame(DrawGrid, Rect);
end;

procedure TdxFEFDialog.dgPatternDrawCell(Sender: TObject; Col,
  Row: Integer; Rect: TRect; State: TGridDrawState);
var
  APrevBrush: TBrush;
  ABrushBitmap: TBitmap;
  Pt: TPoint;
  DC: hDC;
begin
  DC := TDrawGrid(Sender).Canvas.Handle;
  if not ((gdSelected in State) and FPatternWasSelected) then
    DrawEdge(DC, Rect, EDGE_SUNKEN, BF_RECT);
  InflateRect(Rect, -2, -2);
  APrevBrush := TBrush.Create;
  try
    APrevBrush.Assign(TDrawGrid(Sender).Canvas.Brush);
    ABrushBitmap := CopyPattern(Col, Row);
    try
      SetBrushOrgEx(DC, Rect.Left, Rect.Top, @Pt);
      with TDrawGrid(Sender).Canvas do
      begin
        Brush.Bitmap := ABrushBitmap;
        FillRect(Rect);
        Brush.Bitmap := nil;
        Brush := APrevBrush;
      end;
      SetBrushOrgEx(DC, Pt.X, Pt.Y, nil);
    finally
      ABrushBitmap.Free;
    end;
  finally
    APrevBrush.Free;
  end;
  if (gdSelected in State) and FPatternWasSelected then
  begin
    InflateRect(Rect, 2, 2);
    DrawSelectedFrame(TDrawGrid(Sender), Rect);
  end;
end;

procedure TdxFEFDialog.DrawSelectedFrame(ADrawGrid: TDrawGrid; Rect: TRect);
var
  APrevColor: TColor;
  APrevMode: Integer;
  DC: hDC;
begin
  with ADrawGrid do
  begin
    DC := Canvas.Handle;
    if (ActiveControl = ADrawGrid) and Self.Active then
    begin
      //InflateRect(Rect, 2, 2);
      APrevMode := SetBkMode(DC, TRANSPARENT);
      APrevColor := Canvas.Pen.Color;
      Canvas.Pen.Color := clBtnText;
      Canvas.Pen.Style := psDot;
      with Rect do
        Canvas.Polyline([TopLeft, Point(Right - 1, Top), Point(Right - 1, Bottom - 1),
          Point(Left, Bottom - 1), TopLeft]);
      Canvas.Pen.Style := psSolid;
      Canvas.Pen.Color := APrevColor;
      SetBkMode(DC, APrevMode);
      InflateRect(Rect, -1, -1);
    end;
    DrawEdge(DC, Rect, BDR_SUNKENOUTER, BF_RECT or BF_MONO);
    InflateRect(Rect, -1, -1);
    FrameRect(DC, Rect, GetSysColorBrush(COLOR_BTNHIGHLIGHT));
  end;
end;

const
  sdxInitialDir = 'InitialDir'; //not localize
  sdxActivePage = 'ActivePage'; //not localize

procedure TdxFEFDialog.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  with TRegistry.Create do
  try
    if OpenKey(APath, False) then
    try
      if ValueExists(sdxInitialDir) then
        FInitialDir := ReadString(sdxInitialDir);
      if ValueExists(sdxActivePage) then
        FActivePage := ReadInteger(sdxActivePage);
    except
      on ERegistryException do
    else
      raise;
    end;
  finally
    Free;
  end;
end;

procedure TdxFEFDialog.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  with TRegistry.Create do
  try
    if OpenKey(APath, True) then
    try
      WriteString(sdxInitialDir, FInitialDir);
      WriteInteger(sdxActivePage, PageControl1.ActivePage.PageIndex);
    except
      on ERegistryException do
    else
      raise;
    end;
  finally
    Free;
  end;
end;

procedure TdxFEFDialog.SelectPictureClick(Sender: TObject);
var
  Graphic: TGraphic;
begin
  Graphic := nil;
  try
    LoadImage(Graphic, 1);
    if Graphic <> nil then AssignPicture(Graphic);
  finally
    if Graphic <> nil then Graphic.Free;
  end;
end;

procedure TdxFEFDialog.AssignPicture(AImage: TGraphic);
begin
  if AImage is TMetafile then
  begin
    FPicture.Free;
    FPicture := TBitmap.Create;
    FPicture.Width := AImage.Width;
    FPicture.Height := AImage.Height;
    TBitmap(FPicture).Palette := AImage.Palette;
    TBitmap(FPicture).Canvas.Draw(0, 0, AImage);
  end
  else
    SetPicture(AImage);
  GetOtherPicture(TGraphicClass(FPicture.ClassType)).Assign(FPicture);
  PaintPicture;
  CheckModified;
  FPreviewWhat := faPicture;
  pbxPreview.Invalidate;
  FPictureExists := True;
end;

procedure TdxFEFDialog.PaintPicture;
begin
  if FPicture <> nil then
  begin
    pnlPicture.SetBounds(0, 0, FPicture.Width, FPicture.Height);
    pbxPicture.Invalidate;
  end;
end;

procedure TdxFEFDialog.pbxPicturePaint(Sender: TObject);
begin
  if (FOtherPicture <> nil) then
    TPaintBox(Sender).Canvas.Draw(0, 0, FOtherPicture);
end;

type
  TGraphicHack = class(TGraphic);

procedure TdxFEFDialog.btnOtherTextureClick(Sender: TObject);
var
  APicture: TGraphic;
begin
  APicture := nil;
  try
    LoadImage(APicture, 0);
    if (APicture <> nil) then
    begin
      if (APicture is TMetafile) then
      begin
        FPicture.Free;
        FPicture := TBitmap.Create;
        FPicture.Width := cTextureSize.X;
        FPicture.Height := cTextureSize.Y;
        TBitmap(FPicture).Palette := APicture.Palette;
        TGraphicHack(APicture).Draw(TBitmap(FPicture).Canvas, Rect(0, 0, APicture.Width, APicture.Height));
      end
      else
        SetPicture(APicture);
      if (FOtherTexture = nil) then
        dgTexture.RowCount := dgTexture.RowCount + 1;
      OtherTexture.Assign(FPicture);
      dgTexture.Col := 0;
      dgTexture.Row := dgTexture.RowCount - 1;
      if not FTextureWasSelected then
        FTextureWasSelected := True;
      dgTexture.Invalidate;
      CheckModified;
      FPreviewWhat := faTexture;
      pbxPreview.Refresh;
    end;
  finally
    if (APicture <> nil) then APicture.Free;
  end;
end;

procedure TdxFEFDialog.opdlgShow(Sender: TObject);
begin
  Screen.Cursor := FSaveCursor;
  FHourGlassCursor := False;
end;

procedure TdxFEFDialog.LoadImage(var AImage: TGraphic; AWhat: Integer);
var
  opdlg: TOpenPictureDialog;
  AName: string;
  BufImg: TBitmap;
  IcoRegistered: Boolean;
begin
  FSaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  FHourGlassCursor := True;
  opdlg := TOpenPictureDialog.Create(nil);
  try
    opdlg.OnShow := opdlgShow;
    IcoRegistered := (System.Pos('ico', GraphicFilter(TGraphic)) > 0);
    if IcoRegistered then TPicture.UnregisterGraphicClass(TIcon);
    try
      opdlg.InitialDir := FInitialDir;
      opdlg.Filter := GraphicFilter(TGraphic);
      if opdlg.Execute then
      begin
        if not InternalLoadImage(AImage, opdlg.Filename) then Exit;
        FInitialDir := ExtractFileDir(opdlg.Filename);
        AName := ChangeFileExt(ExtractFileName(opdlg.Filename), '');
        case AWhat of
          0: {textures}
            begin
              FOtherTextureName := AName;
              pnlTextureName.Caption := AName;
              if (AImage is TMetafile) then
              else if (AImage is TBitmap) then
              begin
                AImage.Width := cTextureSize.X;
                AImage.Height := cTextureSize.Y;
              end
              else
              begin
                BufImg := TBitmap.Create;
                try
                  BufImg.Assign(AImage);
                  BufImg.Width := cTextureSize.X;
                  BufImg.Height := cTextureSize.Y;
                  AImage.Assign(BufImg);
                finally
                  BufImg.Free;
                end;
              end;
            end;

          1: {pictures}
            begin
              FOtherPictureName := AName;
              pnlPictureName.Caption := AName;
            end;
        end;
        CheckModified;
      end;
    finally
      if IcoRegistered then TPicture.RegisterFileFormat('ico', SVIcons, TIcon);
    end;
  finally
    opdlg.Free;
    if FHourGlassCursor then Screen.Cursor := FSaveCursor;
  end;
end;

function TdxFEFDialog.InternalLoadImage(var AImage: TGraphic; const AFileName: string): Boolean;
var
  AGraphicClass: TGraphicClass;
begin
  Result := False;
  if Assigned(GetGraphicClassProc) then
    AGraphicClass := GetGraphicClassProc(AFileName)
  else
    AGraphicClass := nil;
  if Assigned(AGraphicClass) then
  begin
    if Assigned(AImage) then AImage.Free;
    AImage := nil;
    try
      AImage := TGraphicClassAccess(AGraphicClass).Create;
      AImage.LoadFromFile(AFileName);
      Result := True;
    except
      AImage.Free;
      AImage := nil;
      Result := False;
    end;
  end;
end;

function TdxFEFDialog.GetPicture: TGraphic;
begin
  Result := FPicture;
end;

function TdxFEFDialog.GetPaintMode: TdxPicturePaintMode;
begin
  if (cbxPaintMode.ItemIndex > -1) then
    Result := TdxPicturePaintMode(cbxPaintMode.ItemIndex)
  else
    Result := ppmCenter;
end;

procedure TdxFEFDialog.SetPicture(Value: TGraphic);
begin
  if (FPicture = nil) then FPicture := TBitmap.Create;
  FPicture.Assign(Value);
end;

procedure TdxFEFDialog.SetPaintMode(Value: TdxPicturePaintMode);
begin
  if (PaintMode <> Value) then
    cbxPaintMode.ItemIndex := Integer(Value);
end;

procedure TdxFEFDialog.PaintPreview;
var
  APrevBrush: TBrush;
  ABrushBitmap: TBitmap;
  R: TRect;
  AWidth, AHeight: Integer;
  I, J: Integer;
begin
  case FPreviewWhat of
    faTexture:
      if FTextureWasSelected then
      begin
        AWidth := Picture.Width;
        AHeight := Picture.Height;
        for i := 0 to pbxPreview.Width div AWidth do
          for j := 0 to pbxPreview.Height div AHeight do
            pbxPreview.Canvas.Draw(i * AWidth, j * AHeight, Picture);
      end;

    faPattern:
      if FPatternWasSelected then
      begin
        APrevBrush := TBrush.Create;
        try
          APrevBrush.Assign(pbxPreview.Canvas.Brush);
          ABrushBitmap := CopyPattern(dgPattern.Col, dgPattern.Row);
          try
            R := pbxPreview.ClientRect;
            InflateRect(R, 2, 2);
            pbxPreview.Canvas.Brush.Bitmap := ABrushBitmap;
            pbxPreview.Canvas.FillRect(R);
            pbxPreview.Canvas.Brush.Bitmap := nil;
            pbxPreview.Canvas.Brush := APrevBrush;
          finally
            ABrushBitmap.Free;
          end;
        finally
          APrevBrush.Free;
        end;
      end;

    faPicture:
      if Assigned(FOtherPicture) then
      begin
        R := pbxPreview.ClientRect;
        InflateRect(R, 2, 2);
        pbxPreview.Canvas.StretchDraw(R, FOtherPicture);
      end;
  end;
end;

procedure TdxFEFDialog.dgTextureClick(Sender: TObject);
var
  DrawGrid: TDrawGrid absolute Sender;
begin
  if Assigned(FPicture) then FPicture.Free;
  FPicture := nil;
  if Assigned(FOtherTexture) then
  begin
    if (DrawGrid.Row = DrawGrid.RowCount - 1) and (DrawGrid.Col > 0) then
      Exit
    else if (DrawGrid.Row < DrawGrid.RowCount - 1) then
      FPicture := CopyTexture(DrawGrid.Col, DrawGrid.Row)
    else if (DrawGrid.Col = 0) then
      SetPicture(OtherTexture);
  end
  else
    FPicture := CopyTexture(DrawGrid.Col, DrawGrid.Row);
  if not FTextureWasSelected then
  begin
    FTextureWasSelected := True;
    DrawGrid.Invalidate();
  end;
  FPreviewWhat := faTexture;
  pbxPreview.Invalidate();
  if Assigned(FOtherTexture) and (DrawGrid.Col = 0) and (DrawGrid.Row = DrawGrid.RowCount - 1) then
    pnlTextureName.Caption := FOtherTextureName
  else
    pnlTextureName.Caption := FTextureNames[DrawGrid.Col * cTextureCount.Y + DrawGrid.Row];
  CheckModified;
end;

procedure TdxFEFDialog.dgPatternClick(Sender: TObject);
var
  DrawGrid: TDrawGrid absolute Sender;
begin
  if not FPatternWasSelected then
  begin
    FPatternWasSelected := True;
    DrawGrid.Invalidate;
  end;
  if Assigned(FPicture) then FPicture.Free;
  FPicture := nil;
  FPicture := CopyPattern(DrawGrid.Col, DrawGrid.Row);
  FPreviewWhat := faPattern;
  pbxPreview.Refresh;
  pnlPatternName.Caption := FPatternNames[DrawGrid.Col * cTextureCount.Y + DrawGrid.Row];
  CheckModified;
end;

procedure TdxFEFDialog.pbxPreviewPaint(Sender: TObject);
begin
  PaintPreview;
end;

procedure TdxFEFDialog.MapPatternColors;
begin
  if Assigned(FbmpCurrentPattern) then FbmpCurrentPattern.Free;
  FbmpCurrentPattern := dxCreateMappedBmp(FbmpPattern, [clWhite, clBlack], [BackColor, ForeColor]);
end;

procedure TdxFEFDialog.cbxColorChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  FPreviewWhat := faPattern;
  MapPatternColors;
  pbxPreview.Invalidate;
  dgPattern.Invalidate;
  if (dgPattern.Col > -1) and (dgPattern.Row > -1) then CheckModified();
end;

function TdxFEFDialog.CopyTexture(i, j: Integer): TBitmap;
begin
  Result := TBitmap.Create;
  with Result do
  try
    Width := cTextureSize.X;
    Height := cTextureSize.Y;
    Canvas.Draw(-i * cTextureSize.X, -j * cTextureSize.Y, FbmpTexture);
  except
    Free;
    raise;
  end;
end;

function TdxFEFDialog.CopyPattern(i, j: Integer): TBitmap;
begin
  Result := TBitmap.Create;
  with Result do
  try
    Width := cPatternSize.X;
    Height := cPatternSize.Y;
    Canvas.Draw(-i * cPatternSize.X, -j * cPatternSize.Y, FbmpCurrentPattern);
  except
    Result.Free;
    raise;
  end;
end;

procedure TdxFEFDialog.PageControl1Change(Sender: TObject);
begin
  FApplied := False;
  FPreviewWhat := TdxFillAs(TPageControl(Sender).ActivePage.PageIndex + 1);
  if Assigned(FPicture) then FPicture.Free;
  FPicture := nil;
  case FPreviewWhat of
    faTexture:
      if FTextureWasSelected then
        if (FOtherTexture <> nil) then
        begin
          if (dgTexture.Row < dgTexture.RowCount - 1) then
            FPicture := CopyTexture(dgTexture.Col, dgTexture.Row)
          else
            if (dgTexture.Col = 0) then
              SetPicture(OtherTexture);
        end
        else
          FPicture := CopyTexture(dgTexture.Col, dgTexture.Row);
    faPattern:
      if FPatternWasSelected then
        FPicture := CopyPattern(dgPattern.Col, dgPattern.Row);
    faPicture:
      if Assigned(FOtherPicture) then SetPicture(FOtherPicture);
  end;
  pbxPreview.Invalidate;
  UpdateControlsState;
end;

procedure TdxFEFDialog.PicturePreviewClick(Sender: TObject);
begin
  dxShowPicturePreview(Picture);
end;

procedure TdxFEFDialog.cbxPaintModeChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

function TdxFEFDialog.GetSelectWhat: TdxFillAs;
begin
  Result := faNone;
  if FTextureWasSelected and (PageControl1.ActivePage.PageIndex = 0) then
    Result := faTexture
  else
    if FPatternWasSelected and (PageControl1.ActivePage.PageIndex = 1) then
      Result := faPattern
    else
      if FPictureExists and (PageControl1.ActivePage.PageIndex = 2) then
        Result := faPicture;
end;

procedure TdxFEFDialog.SetSelectWhat(Value: TdxFillAs);
begin
  case Value of
    faNone: ;
    faTexture:
      begin
        FTextureWasSelected := True;
        PageControl1.ActivePage := PageControl1.Pages[0];
      end;
    faPattern:
      begin
        FPatternWasSelected := True;
        PageControl1.ActivePage := PageControl1.Pages[1];
      end;
    faPicture:
      begin
        FPictureExists := True;
        PageControl1.ActivePage := PageControl1.Pages[2];
      end;
  end;
end;

function TdxFEFDialog.GetOtherTexture: TBitmap;
begin
  if not Assigned(FOtherTexture) then FOtherTexture := TBitmap.Create;
  Result := FOtherTexture;
end;

procedure TdxFEFDialog.SetOtherTexture(Value: TBitmap);
begin
  if Assigned(Value) then
    GetOtherTexture.Assign(Value)
  else if Assigned(FOtherTexture) then
  begin
    FOtherTexture.Free;
    FOtherTexture := nil;
  end;
end;

function TdxFEFDialog.GetOtherPicture(AGraphicClass: TGraphicClass): TGraphic;
begin
  if (FOtherPicture <> nil) then FOtherPicture.Free;
  FOtherPicture := nil;
  if (AGraphicClass <> nil) then
    FOtherPicture := TGraphicClassAccess(AGraphicClass).Create;
  Result := FOtherPicture;
end;

function TdxFEFDialog.GetForeColor: TColor;
begin
  Result := TColor(cbxForeColor.Items.Objects[cbxForeColor.ItemIndex]);
end;

procedure TdxFEFDialog.SetForeColor(Value: TColor);
begin
  TdxPSColorCombo(cbxForeColor).ColorValue := Value;
  cbxColorChange(cbxForeColor); {???}
end;

function TdxFEFDialog.GetBackColor: TColor;
begin
  Result := TColor(cbxBackColor.Items.Objects[cbxBackColor.ItemIndex]);
end;

procedure TdxFEFDialog.SetBackColor(Value: TColor);
begin
  TdxPSColorCombo(cbxBackColor).ColorValue := Value;
  cbxColorChange(cbxBackColor); {???}
end;

procedure TdxFEFDialog.lblPaintModeClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxFEFDialog.lblForegroundClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TdxPSColorCombo(ActiveControl).DroppedDown := True;
end;

procedure TdxFEFDialog.DoApply;
var
  B: TBitmap;
begin
  if Assigned(FOnApply) then
  begin
    Background.BeginUpdate;
    try
      Background.BkColor := BackColor;
      Background.Brush.Color := ForeColor;
      Background.Picture := Picture;
      case SelectWhat of
        faTexture:
          begin
            Background.Picture := Picture;
            Background.Mode := bmBrushBitmap;
          end;

        faPattern:
          begin
            B := TBitmap(Background.Picture);
            B.Width := cPatternSize.X;
            B.Height := cPatternSize.Y;
            B.Canvas.Draw(-dgPattern.Col * cPatternSize.X, -dgPattern.Row * cPatternSize.Y, FbmpCurrentPattern);
            Background.Mode := bmBrushBitmap;
          end;

        faPicture:
          begin
            Background.Mode := bmPicture;
            Background.PictureMode := PaintMode;
          end;
      end;
      if FOriginalBackground <> nil then FOriginalBackground.Assign(Background);
      FOnApply(Background);
    finally
      Background.EndUpdate;
    end;
  end;
end;

procedure TdxFEFDialog.btnApplyClick(Sender: TObject);
begin
  DoApply;
  FApplied := True;
  if FFirstApplied then
  begin
    btnCancel.Caption := sdxBtnClose;
    FFirstApplied := False;
  end;
  UpdateControlsState;
end;

procedure TdxFEFDialog.dgTextureDblClick(Sender: TObject);
begin
  if Assigned(FPicture) then btnOK.Click;
end;

procedure TdxFEFDialog.dgPatternDblClick(Sender: TObject);
begin
  if Assigned(FPicture) then btnOK.Click;
end;

procedure TdxFEFDialog.dgTextureMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
  ATextureLastCol: Longint = -2;
  ATextureLastRow: Longint = -2;
var
  DrawGrid: TDrawGrid absolute Sender;
  ACol, ARow: Longint;
begin
  DrawGrid.MouseToCell(X, Y, ACol, ARow);
  if (ACol <> ATextureLastCol) or (ARow <> ATextureLastRow) then
  begin
    Application.CancelHint;
    if (ACol > -1) and (ARow > -1) then
      if not Assigned(FOtherTexture) then
        DrawGrid.Hint := FTextureNames[ACol * cTextureCount.Y + ARow]
      else if Assigned(FOtherTexture) and (ACol = 0) and (ARow = DrawGrid.RowCount - 1) then
        DrawGrid.Hint := FOtherTextureName
      else if (ARow < DrawGrid.RowCount - 1) then
        DrawGrid.Hint := FTextureNames[ACol * cTextureCount.Y + ARow]
      else
        DrawGrid.Hint := '';
  end;
  ATextureLastCol := ACol;
  ATextureLastRow := ARow;
end;

procedure TdxFEFDialog.dgPatternMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
const
  APatternLastCol: Longint = -2;
  APatternLastRow: Longint = -2;
var
  DrawGrid: TDrawGrid absolute Sender;
  ACol, ARow: Longint;
begin
  DrawGrid.MouseToCell(X, Y, ACol, ARow);
  if (ACol <> APatternLastCol) or (ARow <> APatternLastRow) then
  begin
    Application.CancelHint;
    if (ACol > -1) and (ARow > -1) then
      DrawGrid.Hint := FPatternNames[ACol * cPatternCount.Y + ARow];
  end;
  APatternLastCol := ACol;
  APatternLastRow := ARow;
end;

procedure TdxFEFDialog.btnInvertClick(Sender: TObject);
begin
  DoInvertColors;
  if (dgPattern.Col > -1) and (dgPattern.Row > -1) then CheckModified;
end;

procedure TdxFEFDialog.DoInvertColors;
var
  ASaveColor: TColor;
begin
  dgPattern.Perform(WM_SETREDRAW, WPARAM(False), 0);
  btnInvert.Perform(WM_SETREDRAW, WPARAM(False), 0);
  ASaveColor := ForeColor;
  ForeColor := BackColor;
  BackColor := ASaveColor;
  dgPattern.Perform(WM_SETREDRAW, WPARAM(True), 0);
  dgPattern.Invalidate;
  btnInvert.Perform(WM_SETREDRAW, WPARAM(True), 0);
  btnInvert.Invalidate;
end;

procedure TdxFEFDialog.pmPicturePopup(Sender: TObject);
begin
  miPreview.Enabled := btnPreview.Enabled;
  miCut.Enabled := FOtherPicture <> nil;
  miCopy.Enabled := FOtherPicture <> nil;
  miPaste.Enabled := ClipBoard.HasFormat(CF_PICTURE);
  miDelete.Enabled := FOtherPicture <> nil;
end;

procedure TdxFEFDialog.miCopyClick(Sender: TObject);
begin
  ClipBoard.Assign(FOtherPicture);
end;

procedure TdxFEFDialog.miPasteClick(Sender: TObject);
var
  AImage: TPicture;
begin
  AImage := TPicture.Create;
  try
    AImage.Assign(Clipboard);
    if (AImage.Graphic <> nil) and not AImage.Graphic.Empty then
      AssignPicture(AImage.Graphic);
  finally
    AImage.Free;
  end;
end;

procedure TdxFEFDialog.miDeleteClick(Sender: TObject);
begin
  GetOtherPicture(nil);
  pbxPicture.Invalidate;
  pbxPreview.Invalidate;
end;

procedure TdxFEFDialog.miCutClick(Sender: TObject);
begin
  miCopy.Click;
  miDelete.Click;
end;

end.
