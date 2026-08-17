
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

unit dxBrhDlg;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, dxPSForm;

type
  TdxBrushDlg = class(TCustomdxPSForm)
    GroupBox1: TGroupBox;
    lblColor: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    lblStyle: TLabel;
    bvlColorHolder: TBevel;
    bvlStyleHolder: TBevel;
    procedure ccbxStyleChange(Sender: TObject);
    procedure ccbxColorChange(Sender: TObject);
    procedure lblClick(Sender: TObject);
  private
    ccbxColor: TCustomComboBox;
    cbxStyle: TCustomComboBox;
    FBrush: TBrush;
    FModified: Boolean;
    FUpdateControls: boolean;
    procedure SetBrush(Value: TBrush);
    procedure DefaultBrush;
    procedure SetUpControls;
    procedure CheckModified;
    procedure UpdateControlsState;
    procedure LoadStrings;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;

    property Brush: TBrush read FBrush write SetBrush;
  end;

function ChooseBrush(ABrush: TBrush): boolean;
function dxEqualBrushes(const ABrushes: array of TBrush): Boolean;

implementation

{$R *.DFM}

uses
  dxExtCtrls,
  dxPSRes;

function dxEqualBrushes(const ABrushes: array of TBrush): Boolean;
var
  I: Integer;
  ABrush: TBrush;
begin
  Result := False;
  if (High(ABrushes) - Low(ABrushes)) > 1 then
  begin
    ABrush := ABrushes[Low(ABrushes)];
    for I := Low(ABrushes) + 1 to High(ABrushes) do
      if (ABrush.Style <> ABrushes[I].Style) or (ABrush.Color <> ABrushes[I].Color) then Exit;
  end;
  Result := True;
end;

function ChooseBrush(ABrush: TBrush): boolean;
begin
  with TdxBrushDlg.Create(nil) do
  try
    Brush := ABrush;
    Result := Execute;
    if Result then ABrush.Assign(Brush);
  finally
    Free;
  end;
end;


{ TBrushDialog }

constructor TdxBrushDlg.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ccbxColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(ccbxColor) do
  begin
    BoundsRect := bvlColorHolder.BoundsRect;
    Parent := GroupBox1;
    ShowColorName := True;
    OnChange := ccbxColorChange;
  end;
  lblColor.FocusControl := ccbxColor;

  cbxStyle := TdxPSBrushStyleCombo.Create(Self);
  with TdxPSBrushStyleCombo(cbxStyle) do
  begin
    BoundsRect := bvlStyleHolder.BoundsRect;
    Parent := GroupBox1;
    ShowStyleName := True;
    OnChange := ccbxStyleChange;
  end;
  lblStyle.FocusControl := cbxStyle;

  FBrush := TBrush.Create;
  DefaultBrush;
  FModified := False;

  ActiveControl := ccbxColor;
end;

destructor TdxBrushDlg.Destroy;
begin
  FBrush.Free;
  inherited Destroy;
end;

function TdxBrushDlg.Execute: Boolean;
begin
  Result := (ShowModal = mrOk) and FModified;
end;

procedure TdxBrushDlg.LoadStrings;
begin
  Caption := sdxBrushDlgCaption;
  lblColor.Caption := sdxColor;
  lblStyle.Caption := sdxStyle;
  btnOk.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
end;

procedure TdxBrushDlg.SetBrush(Value: TBrush);
begin
  if Value <> nil then
    FBrush.Assign(Value)
  else
    DefaultBrush;
  SetupControls;
end;

procedure TdxBrushDlg.DefaultBrush;
begin
  with FBrush do
  begin
    Style := bsSolid;
    Color := clBlack;
    Bitmap := nil;
  end;
end;

procedure TdxBrushDlg.SetupControls;
begin
  FUpdateControls := True;
  try
    LoadStrings;
    TdxPSColorCombo(ccbxColor).ColorValue := Brush.Color;
    TdxPSBrushStyleCombo(cbxStyle).BrushStyle := Brush.Style;
  finally
    UpdateControlsState;
    FUpdateControls := False;
  end;
end;

procedure TdxBrushDlg.CheckModified;
begin
  if not FModified then FModified := True;
  UpdateControlsState;
end;

procedure TdxBrushDlg.UpdateControlsState;
begin
  //btnOk.Enabled := FModified;
end;

procedure TdxBrushDlg.ccbxStyleChange(Sender: TObject);
begin
  CheckModified;
  Brush.Style := TdxPSBrushStyleCombo(Sender).BrushStyle;
end;

procedure TdxBrushDlg.ccbxColorChange(Sender: TObject);
begin
  CheckModified;
  TdxPSBrushStyleCombo(cbxStyle).BrushColor := TdxPSColorCombo(Sender).ColorValue;
  Brush.Color := TdxPSColorCombo(Sender).ColorValue;
end;

procedure TdxBrushDlg.lblClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

end.
