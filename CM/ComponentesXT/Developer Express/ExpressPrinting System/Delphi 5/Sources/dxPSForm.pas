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

unit dxPSForm;

interface

{$I dxPSVer.inc}

uses
  Classes, Controls, Messages, Forms, Registry;

type
  TCustomdxPSForm = class(TForm)
  private
    FHourGlassCursor: Boolean;
    FSaveCursor: TCursor;
    
    procedure InternalLoadPosition(ARegistry: TRegistry);
    procedure InternalSavePosition(ARegistry: TRegistry);
    procedure SetupHelpEventHandler;
  protected
    procedure DoShow; override;
   {$IFNDEF DELPHI4}
    procedure Loaded; override;
   {$ENDIF}
    procedure BeforeConstruction; virtual;
    procedure BeforeShowing; virtual;
    function CanLoadSaveToRegistry: Boolean; virtual;
    function CanFormResized: Boolean; virtual;
    procedure HelpButtonClick(Sender: TObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AfterConstruction; {$IFDEF DELPHI4} override; {$ELSE} virtual; {$ENDIF}
    procedure BeforeDestruction; {$IFDEF DELPHI4} override; {$ELSE} virtual; {$ENDIF}
    
    function GetRealRegistryPath(const APath: string): string; virtual;
    procedure LoadFromRegistry(const APath: string); virtual;
    procedure SaveToRegistry(const APath: string); virtual;
  end;
  
  TdxPSFormClass = class of TCustomdxPSForm;

implementation

uses
  SysUtils, Windows, StdCtrls, dxPSGlbl, dxPSEngn;
  
{ TCustomdxPSForm }

constructor TCustomdxPSForm.Create(AOwner: TComponent);
begin
  BeforeConstruction;
  inherited Create(AOwner);
end;

destructor TCustomdxPSForm.Destroy;
begin
 {$IFNDEF DELPHI4}
  try
    BeforeDestruction;
  finally  
   {$ENDIF}
    if FHourGlassCursor then Screen.Cursor := FSaveCursor;
    inherited Destroy;
   {$IFNDEF DELPHI4}
  end;  
 {$ENDIF}
end;

procedure TCustomdxPSForm.AfterConstruction;
begin
 {$IFDEF DELPHI4}
  inherited AfterConstruction;
 {$ENDIF}     
  if CanLoadSaveToRegistry then 
    LoadFromRegistry(GetRealRegistryPath(dxPSEngine.RealRegistryPath));
  SetupHelpEventHandler;
end;

procedure TCustomdxPSForm.BeforeDestruction;
begin
  if CanLoadSaveToRegistry then 
    SaveToRegistry(GetRealRegistryPath(dxPSEngine.RealRegistryPath));
 {$IFDEF DELPHI4}
  inherited BeforeDestruction;
 {$ENDIF}
end;

{$IFNDEF DELPHI4}
procedure TCustomdxPSForm.Loaded;
begin
  inherited Loaded;
  AfterConstruction;
end;
{$ENDIF}

procedure TCustomdxPSForm.DoShow;
begin
  BeforeShowing;
  inherited DoShow;
end;

procedure TCustomdxPSForm.BeforeConstruction;
begin
  FSaveCursor := Screen.Cursor;
  if (FSaveCursor <> crHourGlass) then
  begin
    Screen.Cursor := crHourGlass;
    FHourGlassCursor := True;
  end;
  HelpFile := dxPSEngine.HelpFile;
end;

procedure TCustomdxPSForm.BeforeShowing;
begin
  if FHourGlassCursor then
  begin
    Screen.Cursor := FSaveCursor;
    FHourGlassCursor := False;
  end;
end;

function TCustomdxPSForm.CanLoadSaveToRegistry: Boolean; 
begin
  Result := dxPSEngine.RealRegistryPath <> '';
end;

function TCustomdxPSForm.CanFormResized: Boolean;
begin
  Result := HandleAllocated and 
    (GetWindowLong(Handle, GWL_STYLE) and WS_THICKFRAME = WS_THICKFRAME);
end;

procedure TCustomdxPSForm.SetupHelpEventHandler;
var
  AButton: TComponent;
begin
  AButton := FindComponent(sdxHelpButtonName);
  if (AButton is TButton) then 
    TButton(AButton).OnClick := HelpButtonClick;
end;

function DropT(const Source: string): string;
begin
  Result := Source;
  if (Source[1] = 'T') or (Source[1] = 't') then 
    System.Delete(Result, 1, 1);
end;

function TCustomdxPSForm.GetRealRegistryPath(const APath: string): string;
begin
  Result := ChangeFileExt(ExtractFileName(Application.ExeName), '');
  Result := APath + '\FormLayouts\' + Result + '.' + DropT(ClassName);
end;

procedure TCustomdxPSForm.LoadFromRegistry(const APath: string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  try
    if Registry.OpenKey(APath, False) then 
    try 
      InternalLoadPosition(Registry);
    except
      on ERegistryException do
      else
        raise;
    end;  
  finally
    Registry.Free;
  end;
end;

procedure TCustomdxPSForm.SaveToRegistry(const APath: string);
var
  Registry: TRegistry;
begin
  Registry := TRegistry.Create;
  try
    if Registry.OpenKey(APath, True) then 
    try
      InternalSavePosition(Registry);
    except
      on ERegistryException do
      else
        raise;
    end;  
  finally
    Registry.Free;
  end;
end;

procedure TCustomdxPSForm.InternalLoadPosition(ARegistry: TRegistry);
var
  R: TRect;
  ScreenWidth, ScreenHeight: Integer;
begin
  with ARegistry do 
  begin
    if ValueExists('WindowState') then 
      WindowState := TWindowState(ReadInteger('WindowState'));
      
    R := BoundsRect;
    
    if ValueExists('Left') then 
      R.Left := ReadInteger('Left');
      
    if ValueExists('Top') then 
      R.Top := ReadInteger('Top');
      
    if CanFormResized then 
    begin
      if ValueExists('Width') then
        R.Right := R.Left + ReadInteger('Width')
      else
        R.Right := R.Left + Width; 
                   
      if ValueExists('Height') then
        R.Bottom := R.Top + ReadInteger('Height')
      else
        R.Bottom := R.Top + Height;
    end
    else
    begin
      R.Right := R.Left + Width;      
      R.Bottom := R.Top + Height;        
    end;  
    
    if WindowState <> wsMaximized then
    begin
      Position := poDesigned;
      if ValueExists('ScreenWidth') then
        ScreenWidth := ReadInteger('ScreenWidth')
      else  
        ScreenWidth := Screen.Width;
      if ValueExists('ScreenHeight') then
        ScreenHeight := ReadInteger('ScreenHeight')
      else  
        ScreenHeight := Screen.Height;
  
      if (Screen.Width <> ScreenWidth) or (Screen.Height <> ScreenHeight) then 
      begin
        if R.Right > Screen.Width then 
          R.Right := Screen.Width;
        if R.Bottom > Screen.Height then 
          R.Bottom := Screen.Height;
      end;
      BoundsRect := R;
    end; 
  end;  
end;

procedure TCustomdxPSForm.InternalSavePosition(ARegistry: TRegistry);
var
  WindowPlacement: TWindowPlacement;
  R: TRect;
begin
  with ARegistry do
  begin
    WriteInteger('ScreenWidth', Screen.Width);
    WriteInteger('ScreenHeight', Screen.Height);    
    WriteInteger('WindowState', Integer(WindowState));

    FillChar(WindowPlacement, SizeOf(TWindowPlacement), 0);
    WindowPlacement.Length := SizeOf(TWindowPlacement);
    if not GetWindowPlacement(Handle, @WindowPlacement) then
      Exit;
    R := WindowPlacement.rcNormalPosition;
    
    WriteInteger('Left', R.Left);
    WriteInteger('Top', R.Top);
    if CanFormResized then 
    begin
      WriteInteger('Width', R.Right - R.Left);
      WriteInteger('Height', R.Bottom - R.Top);
    end;  
  end;
end;

procedure TCustomdxPSForm.HelpButtonClick(Sender: TObject);
begin
  if HelpContext <> 0 then 
    Application.HelpContext(HelpContext);
end;

end.

