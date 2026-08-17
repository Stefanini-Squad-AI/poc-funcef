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

unit dxPSfmTtl;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, dxPSCore, dxPSForm;

type
  TdxfmReportTitleProperties = class(TCustomdxPSForm)
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    pctlMain: TPageControl;
    tshText: TTabSheet;
    memText: TMemo;
    FontDialog: TFontDialog;
    tshProperties: TTabSheet;
    lblMode: TLabel;
    cbxMode: TComboBox;
    Bevel1: TBevel;
    lblTextAlign: TLabel;
    lblTextAlignY: TLabel;
    Bevel5: TBevel;
    Bevel4: TBevel;
    lblColor: TLabel;
    bvlColorHolder: TBevel;
    lblTextAlignX: TLabel;
    Image3: TImage;
    cbxTextAlignX: TComboBox;          
    cbxTextAlignY: TComboBox;
    chbxAdjustOnScale: TCheckBox;
    edFont: TEdit;
    btnFont: TButton;
    btnRestoreDefaults: TButton;
    Bevel2: TBevel;
    chbxTransparent: TCheckBox;
    procedure TitleChanged(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRestoreDefaultsClick(Sender: TObject);
  private
     FActivePage: Integer;  
     FccbxColor: TCustomComboBox;
     FModified: Boolean;
     FReportTitle: TdxReportTitle;

     procedure SetReportTitle(Value: TdxReportTitle);
     
     procedure CreateControls;  
     procedure InitializeControls;
     procedure LoadStrings;
     procedure SaveUserInput;
     procedure SetModified(Value: Boolean);
     procedure CMDialogChar(var message: TCMDialogChar); message CM_DIALOGCHAR;

     property Modified: Boolean read FModified write SetModified;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromRegistry(const APath: string); override;
    procedure SaveToRegistry(const APath: string); override;
    
    function Execute: Boolean;
    property ReportTitle: TdxReportTitle read FReportTitle write SetReportTitle;
  end;
  
  PdxReportTitlePropertiesDlgData = ^TdxReportTitlePropertiesDlgData;
  TdxReportTitlePropertiesDlgData = record
    HelpContext: Integer;
    ReportTitle: TdxReportTitle;
  end;

function dxShowReportTitlePropertiesDlg(const AData: PdxReportTitlePropertiesDlgData): Boolean;
  
implementation

{$R *.DFM}

uses
  Registry,
  dxPrnDev, dxPSRes, dxPSUtl, dxPSGlbl, dxExtCtrls;
  
function dxShowReportTitlePropertiesDlg(const AData: PdxReportTitlePropertiesDlgData): Boolean;
var
  Dialog: TdxfmReportTitleProperties;
begin
  Result := False;
  if AData = nil then Exit;

  Dialog := TdxfmReportTitleProperties.Create(nil);
  try
    Dialog.HelpContext := AData^.HelpContext;
    Dialog.ReportTitle := AData^.ReportTitle;
    Result := Dialog.Execute;
    if Result then
      AData^.ReportTitle.Assign(Dialog.ReportTitle);
  finally
    Dialog.Free;
  end;
end;


{ TdxfmReportTitleProperties }

constructor TdxfmReportTitleProperties.Create(AOwner: TComponent);
begin
  HelpContext := dxhcTitlePropertiesDlg;
  inherited Create(AOwner);
  if HelpContext = 0 then 
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnHelp.BoundsRect;
    btnHelp.Visible := False;
    BorderIcons := BorderIcons - [biHelp];
  end;
  FReportTitle := TdxReportTitle.Create(nil);
  CreateControls;
  LoadStrings;
end;

destructor TdxfmReportTitleProperties.Destroy;
begin
  FReportTitle.Free; 
  inherited Destroy;
end;

function TdxfmReportTitleProperties.Execute: Boolean;
begin
  InitializeControls;
  with pctlMain do 
    ActivePage := Pages[FActivePage];
  Modified := False;
  Result := (ShowModal = mrOK) and Modified;
end;

procedure TdxfmReportTitleProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrOK then SaveUserInput;
end;

procedure TdxfmReportTitleProperties.InitializeControls;
begin
  chbxAdjustOnScale.Checked := ReportTitle.AdjustOnReportScale;
  TdxPSColorCombo(FccbxColor).ColorValue := ReportTitle.Color;
  FontInfoToText(ReportTitle.Font, edFont);
  cbxMode.ItemIndex := Integer(ReportTitle.Mode);
  memText.Text := ReportTitle.Text;
  cbxTextAlignX.ItemIndex := Integer(ReportTitle.TextAlignX);
  cbxTextAlignY.ItemIndex := Integer(ReportTitle.TextAlignY);
  chbxTransparent.Checked := ReportTitle.Transparent;
  
  FccbxColor.Enabled := not chbxTransparent.Checked;
end;

procedure TdxfmReportTitleProperties.SetModified(Value: Boolean);
begin
  if FModified <> Value then 
  begin
    FModified := Value;
    //btnOK.Enabled := Value;
    FccbxColor.Enabled := not chbxTransparent.Checked;
  end;
end;

procedure TdxfmReportTitleProperties.TitleChanged(Sender: TObject);
begin
  Modified := True;    
end;

procedure TdxfmReportTitleProperties.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (ActiveControl = memText) and (Key = VK_ESCAPE) and (Shift = []) then 
    ModalResult := mrCancel;
end;

procedure TdxfmReportTitleProperties.SetReportTitle(Value: TdxReportTitle);
begin
  FReportTitle.Assign(Value);
end;

procedure TdxfmReportTitleProperties.CreateControls;
begin
  FccbxColor := TdxPSColorCombo.Create(Self);
  with TdxPSColorCombo(FccbxColor) do
  begin
    BoundsRect := bvlColorHolder.BoundsRect;
    Parent := tshProperties;
    ColorTypes := [ctPure];
    AutoColor := dxDefaultColor;
    ShowAutoColor := True;
    TabOrder := chbxTransparent.TabOrder + 1;
    OnChange := TitleChanged;
  end;  
  lblColor.FocusControl := FccbxColor;
end;

procedure TdxfmReportTitleProperties.LoadStrings;
begin
  Caption := sdxReportTitleDlgCaption;
  btnOK.Caption := sdxBtnOk;
  btnCancel.Caption := sdxBtnCancel;
  btnHelp.Caption := sdxBtnHelp;
  btnRestoreDefaults.Caption := sdxBtnRestoreDefaults;  
  
  lblMode.Caption := sdxMode;  
  cbxMode.Clear;
  cbxMode.Items.Add(sdxTitleModeNone);
  cbxMode.Items.Add(sdxTitleModeOnFirstPage);
  cbxMode.Items.Add(sdxTitleModeOnEveryTopPage);
    
  tshText.Caption := sdxText;
  tshProperties.Caption := sdxProperties;
  lblColor.Caption := sdxColor;
  btnFont.Caption := sdxBtnFont;
  chbxAdjustOnScale.Caption := sdxAdjustOnScale;
  
  lblTextAlign.Caption := DropAmpersand(sdxAlignment);
  lblTextAlignX.Caption := sdxTextAlignHorz + ':';
  cbxTextAlignX.Clear;
  cbxTextAlignX.Items.Add(sdxTextAlignLeft);
  cbxTextAlignX.Items.Add(sdxTextAlignCenter);
  cbxTextAlignX.Items.Add(sdxTextAlignRight);    
  
  lblTextAlignY.Caption := sdxTextAlignVert + ':'; 
  cbxTextAlignY.Clear;
  cbxTextAlignY.Items.Add(sdxTextAlignTop);
  cbxTextAlignY.Items.Add(sdxTextAlignVCenter);
  cbxTextAlignY.Items.Add(sdxTextAlignBottom);    

  chbxTransparent.Caption := sdxTransparent;
end;

procedure TdxfmReportTitleProperties.SaveUserInput;
begin
  FReportTitle.AdjustOnReportScale := chbxAdjustOnScale.Checked;
  FReportTitle.Color := TdxPSColorCombo(FccbxColor).ColorValue;
  FReportTitle.Mode := TdxReportTitleMode(cbxMode.ItemIndex);
  FReportTitle.Text := memText.Text;
  FReportTitle.TextAlignX := TdxTextAlignX(cbxTextAlignX.ItemIndex);
  FReportTitle.TextAlignY := TdxTextAlignY(cbxTextAlignY.ItemIndex);  
  FReportTitle.Transparent := chbxTransparent.Checked;
end;

procedure TdxfmReportTitleProperties.CMDialogChar(var message: TCMDialogChar);
var
  I: Integer;
begin
  inherited;
  with pctlMain do
    for I := 0 to PageCount - 1 do
      if IsAccel(message.CharCode, Pages[I].Caption) then
      begin
        message.Result := 1;
        ActivePage := Pages[I];
        Exit;
      end;
end;

procedure TdxfmReportTitleProperties.btnFontClick(Sender: TObject);
begin
  FontDialog.Font := ReportTitle.Font;
  if dxPrintDevice.Printers.Count > 0 then
    FontDialog.Device := fdPrinter
  else
    FontDialog.Device := fdScreen;
  if FontDialog.Execute then
  begin
    ReportTitle.Font := FontDialog.Font;
    FontInfoToText(ReportTitle.Font, edFont);
    TitleChanged(nil);
  end;
end;

const 
  sdxActivePage = 'ActivePage'; //not localize
  
procedure TdxfmReportTitleProperties.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  with TRegistry.Create do
  try
    if OpenKey(APath, False) then
    try
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

procedure TdxfmReportTitleProperties.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  with TRegistry.Create do
  try
    if OpenKey(APath, True) then
    try
      WriteInteger(sdxActivePage, pctlMain.ActivePage.PageIndex);
    except
      on ERegistryException do
      else
        raise;
    end;  
  finally
    Free;
  end;  
end;

procedure TdxfmReportTitleProperties.btnRestoreDefaultsClick(
  Sender: TObject);
begin
  FReportTitle.RestoreDefaults;
  InitializeControls;
  TitleChanged(nil);
end;

end.
