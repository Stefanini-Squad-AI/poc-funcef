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

unit dxPSEngn;

interface

{$I dxPSVer.inc}

uses
  dxPSESys, Classes, Graphics, SysUtils, dxPSGlbl;
  
type
  EdxPSEngine = class(Exception);

  TdxPSEngine = class(TObject)
  private
    FDesignTimeRegistryPath: string;
    FHelpFile: string;
    FLookAndFeel: TdxPSLookAndFeel;
    FRegistryPath: string;
    FSaveFormsPosition: Boolean;
    
    function GetRealRegistryPath: string;
    
    constructor CreateInstance(ADummy: Integer);
    class function GetInstance(AAccessCode: Integer): TdxPSEngine;
    procedure InitializeInstance;
    procedure FinalizeInstance;
  public                       
    constructor Create;
    destructor Destroy; override;

    class function Instance: TdxPSEngine;
    class procedure ReleaseInstance;
    
    property DesignTimeRegistryPath: string read FDesignTimeRegistryPath;   
    property HelpFile: string read FHelpFile write FHelpFile;
    property LookAndFeel: TdxPSLookAndFeel read FLookAndFeel write FLookAndFeel;
    property RealRegistryPath: string read GetRealRegistryPath;
    property RegistryPath: string read FRegistryPath write FRegistryPath;
    property SaveFormsPosition: Boolean read FSaveFormsPosition write FSaveFormsPosition;
  end;


  TdxPSEngineController = class(TComponent)
  private
    FHelpFile: string;
    FLookAndFeel: TdxPSLookAndFeel;    
    FRegistryPath: string;
    FSaveFormsPosition: Boolean;
    
    procedure SetHelpFile(const Value: string);
    procedure SetLookAndFeel(Value: TdxPSLookAndFeel);
    procedure SetRegistryPath(const Value: string);
    procedure SetSaveFormsPosition(Value: Boolean);
    
    function IsCurrent: Boolean;
    function IsDesigning: Boolean;    
  protected
    procedure Loaded; override;
    procedure InitializeEngine; virtual;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
   
   procedure Activate;
  published
    property HelpFile: string read FHelpFile write SetHelpFile;
    property LookAndFeel: TdxPSLookAndFeel read FLookAndFeel write SetLookAndFeel
      default pslfStandard;
    property RegistryPath: string read FRegistryPath write SetRegistryPath;
    property SaveFormsPosition: Boolean read FSaveFormsPosition write SetSaveFormsPosition
      default True;
  end;

function dxPSEngine: TdxPSEngine;

implementation

uses
  Forms, dxExtCtrls, dxPSRes;

const
  PSENGINE_ACCESS = 0;
  PSENGINE_CREATE = 1;
  PSENGINE_RELEASE = 2;

const
  sdxCustomColors = '\CustomColors';
  
resourcestring  
  rsdxPSEngineAccessOnlyThroughInstance = 'Access class %s through Instance only'; 
  rsdxPSEngineIllegalAccessCode = 'Illegal AccessCode %d in GetInstance';
  
function dxPSEngine: TdxPSEngine;
begin
  Result := TdxPSEngine.Instance;
end;
  
{ TdxPSEngine }

procedure PSEngineError(const message: string);
begin
  raise EdxPSEngine.Create(message);
end;
  
constructor TdxPSEngine.Create;
begin
  inherited Create;
  PSEngineError(Format(rsdxPSEngineAccessOnlyThroughInstance, [ClassName]));
end;

constructor TdxPSEngine.CreateInstance(ADummy: Integer);
begin
  inherited Create;
  InitializeInstance;
end;

destructor TdxPSEngine.Destroy;
begin
  FinalizeInstance;
  if GetInstance(PSENGINE_ACCESS) = Self then 
    GetInstance(PSENGINE_RELEASE);
  inherited Destroy;
end;

class function TdxPSEngine.GetInstance(AAccessCode: Integer): TdxPSEngine;
const
  Instance: TdxPSEngine = nil;
begin 
  case AAccessCode of
    PSENGINE_ACCESS:; 
    PSENGINE_CREATE: 
      if Instance = nil then Instance := CreateInstance(0);
    PSENGINE_RELEASE: 
      Instance := nil      
  else
    PSEngineError(Format(rsdxPSEngineIllegalAccessCode, [AAccessCode]));
  end;
  Result := Instance;
end;

class function TdxPSEngine.Instance: TdxPSEngine;
begin
  Result := GetInstance(PSENGINE_CREATE);
end;

class procedure TdxPSEngine.ReleaseInstance;
begin
  GetInstance(PSENGINE_ACCESS).Free;
end;

procedure TdxPSEngine.InitializeInstance;
var
  S: string;
begin
  FDesignTimeRegistryPath := sdxPSRegPathDesignTime;
  FHelpFile := '';
  FRegistryPath := '';
  FSaveFormsPosition := True;

  S := RealRegistryPath;
  if S <> '' then dxRestoreCustomColors(S + sdxCustomColors);
end;

procedure TdxPSEngine.FinalizeInstance;
var
  S: string;
begin
  S := RealRegistryPath;
  if S <> '' then dxSaveCustomColors(S + sdxCustomColors);
end;

function TdxPSEngine.GetRealRegistryPath: string;
begin
  if IsDesignTime then 
    Result := DesignTimeRegistryPath
  else 
    Result := RegistryPath;
end;

type
  TdxPSEngineControllerList = class
  private
    FList: TList;
    function GetCount: Integer;
    function GetActiveController: TdxPSEngineController;
    procedure SetActiveController(Value: TdxPSEngineController);
  public
    destructor Destroy; override;
    
    procedure Add(Value: TdxPSEngineController);
    function IndexOf(Value: TdxPSEngineController): Integer;
    procedure Remove(Value: TdxPSEngineController);    

    property ActiveController: TdxPSEngineController read GetActiveController write SetActiveController;
    property Count: Integer read GetCount;                                                           
  end;

const 
  FEngineControllerList: TdxPSEngineControllerList = nil;
  
function dxPSEngineControllerList: TdxPSEngineControllerList;
begin
  if FEngineControllerList = nil then 
    FEngineControllerList := TdxPSEngineControllerList.Create;
  Result := FEngineControllerList;
end;
  
destructor TdxPSEngineControllerList.Destroy;
begin
  if FList <> nil then FList.Free;
  inherited Destroy;
end;

function TdxPSEngineControllerList.GetActiveController: TdxPSEngineController;
begin
  if FList <> nil then 
    Result := FList[Count - 1]
  else
    Result := nil;
end;

procedure TdxPSEngineControllerList.SetActiveController(Value: TdxPSEngineController);
begin
  if (FList <> nil) and (IndexOf(Value) < Count - 1) then 
  begin
    FList.Remove(Value);
    FList.Add(Value);
  end;
end;

function TdxPSEngineControllerList.GetCount: Integer;
begin
  if FList <> nil then 
    Result := FList.Count
  else
    Result := 0;
end;

procedure TdxPSEngineControllerList.Add(Value: TdxPSEngineController);
begin
  if FList = nil then FList := TList.Create;
  FList.Add(Value);
end;

function TdxPSEngineControllerList.IndexOf(Value: TdxPSEngineController): Integer;
begin
  if FList <> nil then 
    Result := FList.IndexOf(Value)
  else 
    Result := -1
end;

procedure TdxPSEngineControllerList.Remove(Value: TdxPSEngineController);    
begin
  if IndexOf(Value) > -1 then 
  begin
    FList.Remove(Value);
    if Count = 0 then 
    begin 
      FList.Free;
      FList := nil;
    end;                                        
  end;
end;
  
  
{ TdxPSEngineController }

constructor TdxPSEngineController.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHelpFile := '';
  FRegistryPath := '';
  FSaveFormsPosition := True;
  dxPSEngineControllerList.Add(Self);
end;

destructor TdxPSEngineController.Destroy;
begin
  dxPSEngineControllerList.Remove(Self);
  inherited Destroy;
end;

procedure TdxPSEngineController.Activate;
begin
  dxPSEngineControllerList.ActiveController := Self;
end;

function TdxPSEngineController.IsCurrent: Boolean;
begin
  Result := dxPSEngineControllerList.ActiveController = Self;
end;

function TdxPSEngineController.IsDesigning: Boolean;
begin
  Result := csDesigning in ComponentState; 
end;

procedure TdxPSEngineController.Loaded;
begin
  inherited Loaded;
  if not IsDesigning and IsCurrent then InitializeEngine;
end;

procedure TdxPSEngineController.InitializeEngine;
begin
  dxPSEngine.HelpFile := HelpFile;
  dxPSEngine.RegistryPath := RegistryPath;
end;

procedure TdxPSEngineController.SetHelpFile(const Value: string);
begin
  FHelpFile := Value;
  if IsCurrent then dxPSEngine.HelpFile := HelpFile;
end;

procedure TdxPSEngineController.SetLookAndFeel(Value: TdxPSLookAndFeel);
begin
  FLookAndFeel := Value;
  if IsCurrent then dxPSEngine.LookAndFeel := LookAndFeel;
end;

procedure TdxPSEngineController.SetRegistryPath(const Value: string);
begin
  FRegistryPath := Value;
  if IsCurrent then dxPSEngine.RegistryPath := RegistryPath;
end;

procedure TdxPSEngineController.SetSaveFormsPosition(Value: Boolean);
begin
  FSaveFormsPosition := Value;
  if IsCurrent then dxPSEngine.SaveFormsPosition := SaveFormsPosition;
end;

initialization

finalization
  if FEngineControllerList <> nil then FEngineControllerList.Free;
  FEngineControllerList := nil;
  TdxPSEngine.ReleaseInstance;
  
end.
