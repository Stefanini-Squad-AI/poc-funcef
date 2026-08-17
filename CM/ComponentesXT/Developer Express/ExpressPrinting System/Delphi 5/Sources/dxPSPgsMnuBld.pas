{*******************************************************************}
{                                                                   }
{       Developer Express Visual Component Library                  }
{       ExpressPrinting System(tm) COMPONENT SUITE                  }
{                                                                   }
{       Copyright (C) 1998-2001 Developer Express Inc.              }
{       ALL RIGHTS RESERVED                                         }
{                                                                   }
{   The entire coVisntents of this file is protected by U.S. and    }
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

unit dxPSPgsMnuBld;

interface

{$I dxPSVer.inc}

uses
  Classes, dxPgsDlg;
  
type
  TdxPSPageSetupMenuBuilderClass = class of TAbstractdxPSPageSetupMenuBuilder;  
  TAbstractdxPSPageSetupMenuBuilder = class
  public
    constructor Create; virtual;
    procedure BuildPageSetupMenu(ARootItem: TObject; AData: Pointer; 
      AIncludeDefineItem: Boolean; AStyles: TStringList; ACurrentStyle: TBasedxPrintStyle;
      AOnStyleClick, AOnDefineStylesClick: TNotifyEvent); virtual; abstract;
    class function ExtractPrintStyleFromObj(Obj: TObject): TBasedxPrintStyle; virtual;
  end;

  TdxStandardPSPageSetupMenuBuilder = class(TAbstractdxPSPageSetupMenuBuilder)
  public    
    procedure BuildPageSetupMenu(ARootItem: TObject; AData: Pointer; 
      AIncludeDefineItem: Boolean; AStyles: TStringList; ACurrentStyle: TBasedxPrintStyle;
      AOnStyleClick, AOnDefineStylesClick: TNotifyEvent); override;
    class function ExtractPrintStyleFromObj(Obj: TObject): TBasedxPrintStyle; override;
  end;

function dxPSActivePageSetupMenuBuilderClass: TdxPSPageSetupMenuBuilderClass;
procedure dxPSRegisterPageSetupMenuBuilderClass(AMenuBuilderClass: TdxPSPageSetupMenuBuilderClass);
procedure dxPSUnregisterPageSetupMenuBuilderClass(AMenuBuilderClass: TdxPSPageSetupMenuBuilderClass);
  
implementation

uses
  Menus, dxPSRes;

var
  FMenuBuilderClasses: TList = nil;
    
function dxPSActivePageSetupMenuBuilderClass: TdxPSPageSetupMenuBuilderClass;
begin
  if (FMenuBuilderClasses <> nil) and (FMenuBuilderClasses.Count > 0) then
    Result := TdxPSPageSetupMenuBuilderClass(FMenuBuilderClasses.Last)
  else  
    Result := TdxStandardPSPageSetupMenuBuilder;
end;

procedure dxPSRegisterPageSetupMenuBuilderClass(AMenuBuilderClass: TdxPSPageSetupMenuBuilderClass);
begin
  if FMenuBuilderClasses = nil then FMenuBuilderClasses := TList.Create;
  FMenuBuilderClasses.Add(AMenuBuilderClass);
end;

procedure dxPSUnregisterPageSetupMenuBuilderClass(AMenuBuilderClass: TdxPSPageSetupMenuBuilderClass);
begin
  if FMenuBuilderClasses = nil then Exit;
  FMenuBuilderClasses.Remove(AMenuBuilderClass);
  if FMenuBuilderClasses.Count = 0 then 
  begin
    FMenuBuilderClasses.Free;
    FMenuBuilderClasses := nil;
  end;  
end;

procedure dxPSUnregisterAllMenuBuilderClasses;
begin
  while FMenuBuilderClasses <> nil do 
    dxPSUnregisterPageSetupMenuBuilderClass(FMenuBuilderClasses.Last);
end;


{ TAbstractdxPSPageSetupMenuBuilder }

constructor TAbstractdxPSPageSetupMenuBuilder.Create;
begin
  inherited Create;
end;

class function TAbstractdxPSPageSetupMenuBuilder.ExtractPrintStyleFromObj(Obj: TObject): TBasedxPrintStyle;
begin
  Result := nil;
end;

    
{ TStandarddxPageSetupMenuBuilder }

class function TdxStandardPSPageSetupMenuBuilder.ExtractPrintStyleFromObj(Obj: TObject): TBasedxPrintStyle;
begin
  Result := TBasedxPrintStyle(TMenuItem(Obj).Tag);
end;

procedure TdxStandardPSPageSetupMenuBuilder.BuildPageSetupMenu(ARootItem: TObject; 
  AData: Pointer; AIncludeDefineItem: Boolean; AStyles: TStringList; 
  ACurrentStyle: TBasedxPrintStyle; AOnStyleClick, AOnDefineStylesClick: TNotifyEvent);

  procedure AddMenuItem(AParent: TMenuItem; AStyle: TBasedxPrintStyle);
  var
    MenuItem: TMenuItem;
  begin
    MenuItem := TMenuItem.Create(AParent);
    with MenuItem do 
    begin
      Caption := AStyle.StyleCaption;
      GroupIndex := 1;
      Hint := AStyle.Description;
      RadioItem := True;
     {$IFDEF DELPHI6}
      AutoCheck := True;
     {$ENDIF}
      Tag := Integer(AStyle);
      OnClick := AOnStyleClick;
    end;  
    AParent.Add(MenuItem);
  end;

  procedure ClearMenuItems(AMenuItem: TMenuItem); 
  var
    CurItem: TMenuItem;
  begin
    with AMenuItem do
      while Count > 0 do 
      begin 
        CurItem := Items[Count - 1];
        Remove(CurItem);
        CurItem.Free;
      end;  
  end;
  
var
  MenuItem: TMenuItem absolute ARootItem;
  I: Integer;
  MI: TMenuItem;
begin
  if not (ARootItem is TMenuItem) then Exit;
  ClearMenuItems(MenuItem);
  
  for I := 0 to AStyles.Count - 1 do
    AddMenuItem(MenuItem, TBasedxPrintStyle(AStyles.Objects[I]));
  if MenuItem.Count > 0 then 
    MenuItem[ACurrentStyle.Index].Checked := True;
  
  if AIncludeDefineItem then
  begin
    if MenuItem.Count > 0 then MenuItem.Add(NewLine);
    MI := TMenuItem.Create(MenuItem);
    MI.Caption := sdxDefinePrintStylesMenuItem;
    MI.OnClick := AOnDefineStylesClick;
    MenuItem.Add(MI);
  end;
end;  

initialization
   
finalization
  dxPSUnregisterAllMenuBuilderClasses;
  
end.
 
