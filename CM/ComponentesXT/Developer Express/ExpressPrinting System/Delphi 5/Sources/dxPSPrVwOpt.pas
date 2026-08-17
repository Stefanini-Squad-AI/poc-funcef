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

unit dxPSPrVwOpt;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls,
  dxPreVw, dxPSForm, dxPrnPg;

type
  PdxPreviewOptionsDlgData = ^TdxPreviewOptionsDlgData;
  TdxPreviewOptionsDlgData = record
    HelpContext: Integer;  
    MarginColor: TColor;
    MeasurementUnits: TdxMeasurementUnits;
    ShowMarginsHintWhileDragging: Boolean;
    ShowMarginHints: Boolean;
    ShowMargins: Boolean;
    ZoomOnMouseRoll: Boolean;    
    ZoomStep: Integer;
  end;

  TdxfmOptions = class(TCustomdxPSForm)
    PageControl1: TPageControl;
    tshGeneral: TTabSheet;
    Bevel1: TBevel;
    gbxShow: TGroupBox;
    gbxMeasurementUnits: TGroupBox;
    lblMeasurementUnits: TLabel;
    cbxMeasurementUnits: TComboBox;
    chbxShowMargins: TCheckBox;
    chbxShowMarginsHints: TCheckBox;
    chbxShowMarginsHintsWhileDragging: TCheckBox;
    gbxMarginsColor: TGroupBox;
    lblMarginsColor: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    bvlMarginColorHolder: TBevel;
    gbxZoomOpt: TGroupBox;
    chbxZoomOnRoll: TCheckBox;
    lblZoomStep: TLabel;
    bvlZoomStepHolder: TBevel;
    procedure FormChanged(Sender: TObject);
    procedure lblMeasurementUnitsClick(Sender: TObject);
    procedure lblMarginsColorClick(Sender: TObject);
    procedure lblZoomStepClick(Sender: TObject);
  private
    FControlsUpdating: Boolean;
    FData: TdxPreviewOptionsDlgData;
    FModified: Boolean;
    FccbxColor: TCustomComboBox;
    FseZoomStep: TCustomEdit;
    
    procedure CheckModified;
    procedure CreateControls;
    procedure LoadStrings;
    procedure StartSettings;
    procedure UpdateControlsState;
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean;
  end;

function dxShowPSPreviewOptionsDlg(const AData: PdxPreviewOptionsDlgData): Boolean;

implementation

{$R *.DFM}

uses
  dxExtCtrls, dxPSGlbl, dxPSRes;

function dxShowPSPreviewOptionsDlg(const AData: PdxPreviewOptionsDlgData): Boolean;
var
  Form: TdxfmOptions;
begin
  Result := False;
  if AData = nil then Exit;
  
  Form := TdxfmOptions.Create(nil);
  try
    Form.FData := AData^;
    Result := Form.Execute;
    if Result then AData^ := Form.FData;
  finally
    Form.Free;
  end;
end;


{ TfmOptions }  

constructor TdxfmOptions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxhcPreviewPreferencesDlg;
  CreateControls;
  LoadStrings;
end;

procedure TdxfmOptions.LoadStrings;
begin
  Caption := sdxPreferenceDlgCaption;
  gbxShow.Caption := sdxPreferenceDlgShow;
  tshGeneral.Caption := sdxPreferenceDlgTab1;
  lblMeasurementUnits.Caption := sdxPreferenceDlgMeasurementUnits;
  with cbxMeasurementUnits do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      Items.Add(sdxUnitsDefaultName);
      Items.Add(sdxUnitsInchesName);
      Items.Add(sdxUnitsMillimetersName);
    finally
      Items.EndUpdate;
    end;
  end;
  chbxShowMargins.Caption := sdxPreferenceDlgMargins;
  chbxShowMarginsHints.Caption := sdxPreferenceDlgMarginsHints;
  chbxShowMarginsHintsWhileDragging.Caption := sdxPreferenceDlgMargingWhileDragging;
  lblMarginsColor.Caption := sdxPreferenceDlgMarginsColor;
  chbxZoomOnRoll.Caption := sdxPreferenceDlgZoomScroll;
  lblZoomStep.Caption := sdxPreferenceDlgZoomStep;
  btnOK.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
  btnHelp.Caption := sdxBtnHelp;
end;

procedure TdxfmOptions.CheckModified;
begin
  FModified := True;
  UpdateControlsState;
end;

function IsIntelliMousePresent: Boolean;
begin
  Result := Boolean(GetSystemMetrics(SM_MOUSEWHEELPRESENT));
end;

procedure TdxfmOptions.UpdateControlsState;
begin
//  btnOk.Enabled := FModified;
  chbxZoomOnRoll.Enabled := IsIntelliMousePresent;
end;

procedure TdxfmOptions.StartSettings;
begin
  FModified := False;
  FControlsUpdating := True;
  try
    chbxShowMargins.Checked := FData.ShowMargins;
    chbxShowMarginsHints.Checked := FData.ShowMarginHints;
    chbxShowMarginsHintsWhileDragging.Checked := FData.ShowMarginsHintWhileDragging;
    chbxZoomOnRoll.Checked := FData.ZoomOnMouseRoll;

    cbxMeasurementUnits.ItemIndex := Integer(FData.MeasurementUnits);
    TdxPSColorCombo(FccbxColor).ColorValue := FData.MarginColor;
    TdxPSSpinEdit(FseZoomStep).Value := FData.ZoomStep;
    
    btnHelp.Visible := (HelpContext <> 0);
    if (HelpContext = 0) then
    begin
      btnOK.BoundsRect := btnCancel.BoundsRect;
      btnCancel.BoundsRect := btnHelp.BoundsRect;
    end;
  finally
    FControlsUpdating := False;
  end;
  UpdateControlsState;
end;

procedure TdxfmOptions.CreateControls;
begin
  FccbxColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxColor) do
  begin
    Parent := gbxMarginsColor;
    BoundsRect := bvlMarginColorHolder.BoundsRect;
    ShowColorName := True;
    ColorTypes := [ctPure];
    ShowAutoColor := True;
    AutoColor := clWindowText;
    ShowCustomColor := False;
    OnChange := FormChanged;
  end;
  lblMarginsColor.FocusControl := FccbxColor;

  FseZoomStep := TdxPSSpinEdit.Create(Self);
  with TdxPSSpinEdit(FseZoomStep) do
  begin
    Parent := gbxZoomOpt;
    BoundsRect := bvlZoomStepHolder.BoundsRect;
    MaxValue := 20;
    MinValue := 1;
    DefaultValue := Value;
    LegendText := '%';
    OnChange := FormChanged;
  end;
  lblZoomStep.FocusControl := FseZoomStep;
end;

function TdxfmOptions.Execute: Boolean;
begin
  StartSettings;
  Result := (ShowModal = mrOk) and FModified;
  
  if Result then 
  begin
    FData.MeasurementUnits := TdxMeasurementUnits(cbxMeasurementUnits.ItemIndex);  
    FData.MarginColor := TdxPSColorCombo(FccbxColor).ColorValue;
    FData.ZoomStep := TdxPSSpinEdit(FseZoomStep).AsInteger;

    FData.ShowMargins := chbxShowMargins.Checked;
    FData.ShowMarginHints := chbxShowMarginsHints.Checked;
    FData.ShowMarginsHintWhileDragging := chbxShowMarginsHintsWhileDragging.Checked;
    FData.ZoomOnMouseRoll := chbxZoomOnRoll.Checked;
  end;
end;

procedure TdxfmOptions.FormChanged(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmOptions.lblMeasurementUnitsClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmOptions.lblMarginsColorClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TCustomComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmOptions.lblZoomStepClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
end;

end.
