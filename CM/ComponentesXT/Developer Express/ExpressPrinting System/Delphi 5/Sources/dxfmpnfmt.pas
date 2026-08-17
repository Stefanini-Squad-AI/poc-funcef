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

unit dxfmPNFmt;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, 
  dxPSForm, dxPSGlbl;

type
  TdxfmPageNumberFormat = class(TCustomdxPSForm)
    btnOK: TButton;
    btnCancel: TButton;
    btnHelp: TButton;
    GroupBox1: TGroupBox;
    cbxPageNumberingFormat: TComboBox;
    lblPageNumberFormat: TLabel;
    bvlStartAtHolder: TBevel;
    lblStartAt: TLabel;
    btnDefault: TButton;
    Bevel1: TBevel;
    procedure cbxPageNumberingFormatChange(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure lblPageNumberFormatClick(Sender: TObject);
    procedure lblStartAtClick(Sender: TObject);
  private
    FseStartAt: TCustomEdit;

    FControlsUpdating: Boolean;
    FModified: Boolean;    
    FPageNumberFormats: TStrings;
    FPageNumberFormat: TdxPageNumberFormat;
    FStartPageIndex: Integer;
    FSetPageNumberingFormatAsDefault: Boolean;

    procedure CheckModified;
    procedure CreateControls;
    procedure LoadStrings;
    procedure SetPageNumberFormats(Value: TStrings);
    procedure StartAtChanged(Sender: TObject);
    procedure StartatExit(Sender: TObject);
    procedure StartSettings;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Execute: Boolean;

    property PageNumberFormats: TStrings read FPageNumberFormats write SetPageNumberFormats;
    property PageNumberFormat: TdxPageNumberFormat read FPageNumberFormat write FPageNumberFormat;
    property SetPageNumberingFormatAsDefault: Boolean read FSetPageNumberingFormatAsDefault 
      write FSetPageNumberingFormatAsDefault;
    property StartPageIndex: Integer read FStartPageIndex write FStartPageIndex;
  end;

  PdxPageNumberFormatDlgData = ^TdxPageNumberFormatDlgData;
  TdxPageNumberFormatDlgData = record
    PageNumberFormats: TStrings;
    PageNumberFormat: TdxPageNumberFormat;
    StartPageIndex: Integer;
    ShowAsDefaultButton: Boolean;
    SetPageNumberFormatAsDefault: Boolean;
    HelpContext : THelpContext;
  end;

function dxShowPageNumberFormatDlg(const AFormatsDlgData: PdxPageNumberFormatDlgData): Boolean;

implementation

{$R *.DFM}

uses
  Registry,
  dxExtCtrls, dxPSRes, dxPSUtl;

function dxShowPageNumberFormatDlg(const AFormatsDlgData: PdxPageNumberFormatDlgData): Boolean;
var
  Dialog: TdxfmPageNumberFormat;
begin
  Result := False;
  if (AFormatsDlgData = nil) and (AFormatsDlgData^.PageNumberFormats = nil) then Exit;
  Dialog := TdxfmPageNumberFormat.Create(nil);
  try
    with AFormatsDlgData^ do
    begin
      Dialog.PageNumberFormats := PageNumberFormats;
      Dialog.FPageNumberFormat := PageNumberFormat;
      Dialog.FStartPageIndex := StartPageIndex;
      Dialog.btnDefault.Visible := ShowAsDefaultButton;
    end;
    Result := Dialog.Execute;
    if Result then
      with AFormatsDlgData^ do
      begin
        PageNumberFormat := TdxPageNumberFormat(Dialog.PageNumberFormat);
        StartPageIndex := Dialog.StartPageIndex;
        SetPageNumberFormatAsDefault := Dialog.SetPageNumberingFormatAsDefault;
      end;
  finally
    Dialog.Free;
  end;
end;


type
  TdxIntValueType = 
    (ivtDecimal, ivtLiteral, ivtCapitalLiteral, ivtRoman, ivtCapitalRoman);

  TdxPSValueEdit = class(TdxPSSpinEdit)
  private
    FIntValueType: TdxIntValueType;
    procedure SetIntValueType(Value: TdxIntValueType);
  protected
    function IsValidChar(Key: Char): Boolean; override;
    function GetValue: Extended; override;
    procedure SetValue(NewValue: Extended); override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property IntValueType: TdxIntValueType read FIntValueType write SetIntValueType
      default ivtDecimal;
  end;

constructor TdxPSValueEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIntValueType := ivtDecimal;
  MinValue := 1;
  DefaultValue := 1;
end;

procedure TdxPSValueEdit.SetIntValueType(Value: TdxIntValueType);
var
  V: Integer;
begin
  if (FIntValueType <> Value) then
  begin
    V := AsInteger;
    FIntValueType := Value;
    AsInteger := V;
  end;
end;

function TdxPSValueEdit.IsValidChar(Key: Char): Boolean;
begin
  if ValueType = svtFloat then 
    Result := inherited IsValidChar(Key)
  else 
    case IntValueType of
      ivtDecimal:
        Result := (Key <> '-') and inherited IsValidChar(Key);
      ivtLiteral:
        Result := Key in ['a'..'z'];
      ivtCapitalLiteral:
        Result := Key in ['A'..'Z'];
      ivtRoman:
        Result := Key in ['c', 'd', 'i', 'l', 'm', 'x', 'v'];
      else {ivtCapitalRoman}
        Result := Key in ['C', 'D', 'I', 'L', 'M', 'X', 'V'];
    end;
end;

function TdxPSValueEdit.GetValue: Extended;
var  
  S: string;
begin
  if (ValueType = svtFloat) or (IntValueType = ivtDecimal) then
    Result := inherited GetValue
  else
    try
      S := Trim(GetValueText);
      if S <> '' then 
        case IntValueType of
          ivtLiteral:
            Result := Chars2Int(S, False);
          ivtCapitalLiteral:
            Result := Chars2Int(S, True);
          ivtRoman:
            Result := Roman2Int(S, False);
          else {ivtCapitalRoman}
            Result := Roman2Int(S, True);
        end
      else 
        Result := 1;
      Result := CheckValue(Result);
    except
      Result := Trunc(DefaultValue);
    end;  
end;

procedure TdxPSValueEdit.SetValue(NewValue: Extended);
begin
  if (ValueType = svtFloat) or (IntValueType = ivtDecimal) then
    inherited SetValue(NewValue)
  else
    case IntValueType of
      ivtLiteral:
        Text := Int2Chars(Round(CheckValue(NewValue)), False);
      ivtCapitalLiteral:
        Text := Int2Chars(Round(CheckValue(NewValue)), True);
      ivtRoman:
        Text := Int2Roman(Round(CheckValue(NewValue)), False);
    else{ivtCapitalRoman}
      Text := Int2Roman(Round(CheckValue(NewValue)), True);
    end;
end;


{ TfmPageNumberFormat }

constructor TdxfmPageNumberFormat.Create(AOwner: TComponent);
begin
  HelpContext := dxhcPageNumberFormatDlg;
  inherited Create(AOwner);
  btnHelp.Visible := (HelpContext <> 0);
  if HelpContext <> 0 then 
    BorderIcons := BorderIcons + [biHelp]
  else
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnHelp.BoundsRect;
  end;
  FPageNumberFormats := TStringList.Create;  
  CreateControls;
  LoadStrings;
end;

destructor TdxfmPageNumberFormat.Destroy;
begin
  FPageNumberFormats.Free;
  inherited Destroy;
end;

function TdxfmPageNumberFormat.Execute: Boolean;
begin
  StartSettings;
  FModified := False;
  //btnDefault.Enabled := False;
  //btnOK.Enabled := False;
  Result := (ShowModal = mrOK) and FModified;
end;

procedure TdxfmPageNumberFormat.CheckModified;
begin
  FModified := True;
  //btnDefault.Enabled := FModified;
  //btnOK.Enabled := FModified;
end;

procedure TdxfmPageNumberFormat.StartSettings;
begin
  FControlsUpdating := True;
  try
    with cbxPageNumberingFormat do 
    begin 
      Items.BeginUpdate;
      try
        Items.Clear;
        Items := FPageNumberFormats;
        ItemIndex := Integer(PageNumberFormat);
      finally
        Items.EndUpdate;
      end;
    end;  
    TdxPSValueEdit(FSeStartAt).IntValueType := TdxIntValueType(PageNumberFormat);
    TdxPSValueEdit(FSeStartAt).AsInteger := StartPageIndex;
  finally
    FControlsUpdating := False;
  end;
end;

procedure TdxfmPageNumberFormat.CreateControls;
begin
  FseStartAt := TdxPSValueEdit.Create(Self);
  with TdxPSValueEdit(FseStartAt) do
  begin
    Parent := GroupBox1;
    TabOrder := 1;
    BoundsRect := bvlStartAtHolder.BoundsRect;
    ValueType := svtInteger;
    MinValue := 1;
    MaxValue := 10000;
    Value := 1;
    OnChange := StartAtChanged;
    OnExit := StartAtExit;
  end;
  lblStartAt.FocusControl := FseStartAt;
end;

procedure TdxfmPageNumberFormat.SetPageNumberFormats(Value: TStrings);
begin
  FPageNumberFormats.Assign(Value);
end;

procedure TdxfmPageNumberFormat.LoadStrings;
begin
  Caption := sdxPNFormatsCaption;
  btnOK.Caption := sdxBtnOK;
  btnCancel.Caption := sdxBtnCancel;
  btnHelp.Caption := sdxBtnHelp;
  btnDefault.Caption := sdxBtnDefault;
  lblPageNumberFormat.Caption := sdxPNFormatsNumberFormat;
  lblStartAt.Caption := sdxPNFormatsStartAt;
end;

procedure TdxfmPageNumberFormat.cbxPageNumberingFormatChange(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  TdxPSValueEdit(FseStartAt).IntValueType := TdxIntValueType(TComboBox(Sender).ItemIndex);
  FPageNumberFormat := TdxPageNumberFormat(TComboBox(Sender).ItemIndex);
  CheckModified;
end;

procedure TdxfmPageNumberFormat.StartAtChanged(Sender: TObject);
begin
  if FControlsUpdating then Exit;
  CheckModified;
end;

procedure TdxfmPageNumberFormat.StartAtExit(Sender: TObject);
begin
  FStartPageIndex := TdxPSSpinEdit(Sender).AsInteger;
end;

procedure TdxfmPageNumberFormat.btnDefaultClick(Sender: TObject);
var
  S : string;
begin
  S := Format(sdxPNFormatsChangeDefaultFormat, 
    [cbxPageNumberingFormat.Items[cbxPageNumberingFormat.ItemIndex]]);
  if MessageQuestion(S) then
  begin
    FSetPageNumberingFormatAsDefault := True;
    CheckModified;
  end;  
end;

procedure TdxfmPageNumberFormat.lblPageNumberFormatClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
  TComboBox(ActiveControl).DroppedDown := True;
end;

procedure TdxfmPageNumberFormat.lblStartAtClick(Sender: TObject);
begin
  ActiveControl := TLabel(Sender).FocusControl;
end;

end.
