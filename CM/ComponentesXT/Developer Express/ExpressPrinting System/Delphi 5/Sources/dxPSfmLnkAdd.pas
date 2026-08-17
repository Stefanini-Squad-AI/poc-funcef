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

unit dxPSfmLnkAdd;

interface

{$I dxPSVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, Registry, {$IFDEF DELPHI6} DesignIntf, {$ELSE} DsgnIntf, {$ENDIF}
  dxPSForm, dxPSCore;

type
{$IFDEF DELPHI4}
  {$IFDEF DELPHI6}
    TFormDesigner = IDesigner;
  {$ELSE}
    TFormDesigner = IFormDesigner;
  {$ENDIF}  
{$ENDIF}

  TdxfmSelectComponent = class(TCustomdxPSForm)
    btnOK: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    cbxComponents: TComboBox;
    chbxOnlyUnLinked: TCheckBox;
    Label1: TLabel;
    btnHelp: TButton;
    chbxOnlyInCurrentModule: TCheckBox;
    Bevel1: TBevel;
    procedure cbxComponentsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chbxClick(Sender: TObject);
    procedure cbxComponentsChange(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private
    FFormDesigner: TFormDesigner;
    FComponent: TComponent;
    FOldComponent: TComponent;
    FLinkList: TList;
    FReportLink: TBasedxReportLink;
    procedure BuildLinkList;
    procedure EnumComp(const S: string);
    procedure EnumLinks(const S: string);
    procedure FillList;
    procedure SetComponent(Value: TComponent);
  public
    constructor Create(AOwner: TComponent); override;
    
    procedure LoadFromRegistry(const APath: string); override; 
    procedure SaveToRegistry(const APath: string); override;
    function Execute: Boolean;
  end;

function dxSelectComponent(Pt: PPoint; AReportLink: TBasedxReportLink;
  AFormDesigner: TFormDesigner; var AComponent: TComponent): Boolean;

implementation

{$R *.DFM}

uses
  TypInfo,
  dxPSUtl, dxPSGlbl;

function dxSelectComponent(Pt: PPoint; AReportLink: TBasedxReportLink;
  AFormDesigner: TFormDesigner; var AComponent: TComponent): Boolean;
begin
  with TdxfmSelectComponent.Create(nil) do
  try
    if Pt <> nil then
    begin
      Left := Pt^.X;
      Top := Pt^.Y;
    end
    else
      Position := poScreenCenter;
      
    FReportLink := AReportLink;
    FFormDesigner := AFormDesigner;
    SetComponent(AComponent);
    FOldComponent := AComponent;
    
    Result := Execute;
    if Result then AComponent := FComponent;
  finally
    Free;
  end;
end;

{ TdxfmSelectComponent }

constructor TdxfmSelectComponent.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  HelpContext := dxPSGlbl.dxhcAddLinkDlg;
  btnHelp.Visible := HelpContext <> 0;
  if not btnHelp.Visible then
  begin
    btnOK.BoundsRect := btnCancel.BoundsRect;
    btnCancel.BoundsRect := btnHelp.BoundsRect;
  end;
  FLinkList := nil;
end;

function TdxfmSelectComponent.Execute: Boolean;
begin
  FillList;
  Result := (ShowModal = mrOK) and (FComponent <> nil) and (FOldComponent <> FComponent);
end;

procedure TdxfmSelectComponent.SetComponent(Value: TComponent);
var
  Index: Integer;
begin
  if FComponent <> Value then
  begin
    FComponent := Value;
    Index := cbxComponents.Items.IndexOfObject(FComponent);
    if (Index = -1) and (cbxComponents.Items.Count > 0) then Index := 0;
    cbxComponents.ItemIndex := Index;
  end;
end;

procedure TdxfmSelectComponent.EnumLinks(const S: string);
var
  Comp: TComponent;
begin
  if FFormDesigner <> nil then
  begin
    Comp := FFormDesigner.GetComponent(S);
    if Comp is TBasedxReportLink then FLinkList.Add(Comp);
  end;
end;

procedure TdxfmSelectComponent.BuildLinkList;
begin
  if FFormDesigner <> nil then
    FFormDesigner.GetComponentNames(GetTypeData(TComponent.ClassInfo), EnumLinks);
end;

procedure TdxfmSelectComponent.EnumComp(const S: string);
var
  Comp: TComponent;
  I: Integer;
  CompClass: TComponentClass;
begin
  Comp := nil;
  if FFormDesigner <> nil then Comp := FFormDesigner.GetComponent(S);
  
  if (Comp = nil) or (Comp is TBasedxReportLink) or (Comp is TCustomdxComponentPrinter) then 
    Exit;
  
  if FLinkList <> nil then
    for I := 0 to FLinkList.Count - 1 do
      if TBasedxReportLink(FLinkList[I]).Component = Comp then Exit;
      
  CompClass := TComponentClass(Comp.ClassType);
  if (not chbxOnlyInCurrentModule.Checked or (System.Pos('.', S) = 0)) and
    (((FReportLink = nil) and dxPSIsSupportedCompClass(CompClass)) or
    ((FReportLink <> nil) and FReportLink.IsSupportedCompClass(CompClass))) then
    cbxComponents.Items.AddObject(S, Comp);
end;

procedure TdxfmSelectComponent.FillList;
var
  Comp: TComponent;
  Index: Integer;
begin
  Comp := nil;
  if cbxComponents.ItemIndex > -1 then
    Comp := TComponent(cbxComponents.Items.Objects[cbxComponents.ItemIndex]);

  cbxComponents.Items.BeginUpdate;
  try
    cbxComponents.Items.Clear;
    if chbxOnlyUnLinked.Checked then
    begin
      FLinkList := TList.Create;
      BuildLinkList;
    end;
    if FFormDesigner <> nil then
      FFormDesigner.GetComponentNames(GetTypeData(PTypeInfo(TComponent.ClassInfo)), EnumComp);
    if chbxOnlyUnLinked.Checked then FLinkList.Free;
    FLinkList := nil;
  finally
    cbxComponents.Items.EndUpdate;
  end;

  Index := -1;
  with cbxComponents do   
  begin
    if Comp <> nil then 
      Index := Items.IndexOfObject(Comp);
    if (Index = -1) and (Items.Count > 0) then 
      Index := 0;
    ItemIndex := Index;
    if ItemIndex > -1 then
      FComponent := TComponent(Items.Objects[ItemIndex]);
    DropDownCount := Min(Items.Count, 20);  
  end;
end;

procedure TdxfmSelectComponent.cbxComponentsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);

  function GetMaxItemWidth: Integer;
  var
    I, W: Integer;
  begin
    with TComboBox(Control) do 
    begin
      Result := 0;
      for I := 0 to Items.Count - 1 do
      begin
        W := Canvas.TextWidth(Items[I]);
        if Result < W then Result := W;
      end;
      Inc(Result, 10);
    end;
  end;

const
  DrawFlags: UINT = DT_LEFT or DT_VCENTER or DT_SINGLELINE;
var
  MaxItemWidth: Integer;
  S: string;
  Flags: UINT;
begin
  MaxItemWidth := GetMaxItemWidth;
  with TComboBox(Control), Canvas do
  begin
    FillRect(Rect);
    InflateRect(Rect, -2, 0);
    Windows.DrawText(Handle, PChar(Items[Index]), Length(Items[Index]), Rect, DrawFlags);
    if MaxItemWidth > ((Rect.Right - Rect.Left) div 2) then
    begin
      Flags := DrawFlags + DT_END_ELLIPSIS;
      MoveTo(Rect.Left + MaxItemWidth - 3, Rect.Top);
      LineTo(Rect.Left + MaxItemWidth - 3, Rect.Bottom);
      Inc(Rect.Left, MaxItemWidth);
    end
    else
    begin
      Flags := DrawFlags;
      MoveTo(Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Top);
      LineTo(Rect.Left + (Rect.Right - Rect.Left) div 2, Rect.Bottom);
      Rect.Left := (Rect.Right - Rect.Left) div 2 + 7;
    end;
    S := Items.Objects[Index].ClassName;
    Windows.DrawText(Handle, PChar(S), Length(S), Rect, Flags);
  end;
end;

procedure TdxfmSelectComponent.chbxClick(Sender: TObject);
begin
  FillList;
end;

procedure TdxfmSelectComponent.cbxComponentsChange(Sender: TObject);
begin
  with TComboBox(Sender) do
    FComponent := TComponent(Items.Objects[ItemIndex]);
end;

procedure TdxfmSelectComponent.Label1Click(Sender: TObject);
begin
  TComboBox(TLabel(Sender).FocusControl).DroppedDown := True;
end;
  
const
  sdxOnlyWithoutLinks = 'OnlyWithoutLinks';
  sdxOnlyInCurrentModule = 'OnlyInCurrentModule';
  
procedure TdxfmSelectComponent.LoadFromRegistry(const APath: string);
begin
  inherited LoadFromRegistry(APath);
  with TRegistry.Create do 
  try
    if OpenKey(APath, False) then
    try
      if ValueExists(sdxOnlyWithoutLinks) then 
        chbxOnlyUnLinked.Checked := ReadBool(sdxOnlyWithoutLinks);
      if ValueExists(sdxOnlyInCurrentModule) then 
        chbxOnlyInCurrentModule.Checked := ReadBool(sdxOnlyInCurrentModule);
    except
    end;
  finally
    Free;
  end;
end;
  
procedure TdxfmSelectComponent.SaveToRegistry(const APath: string);
begin
  inherited SaveToRegistry(APath);
  with TRegistry.Create do 
  try
    if OpenKey(APath, True) then
    try
      WriteBool(sdxOnlyWithoutLinks, chbxOnlyUnLinked.Checked);
      WriteBool(sdxOnlyInCurrentModule, chbxOnlyInCurrentModule.Checked);
    except
    end;
  finally
    Free;
  end;
end;

end.

