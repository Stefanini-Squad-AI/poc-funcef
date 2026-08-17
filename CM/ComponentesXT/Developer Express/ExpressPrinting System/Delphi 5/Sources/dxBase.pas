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

unit dxBase;

interface

{$I dxPSVer.inc}

uses
  Classes;

type
  TdxBaseObject = class;

  TdxLockState = (lsUnlock, lsLock);
  TdxLockUpdateEvent = procedure(Sender: TdxBaseObject; ALockState: TdxLockState) of object;

  TdxBaseObject = class(TPersistent)
  private
    FUpdateCount: Integer;
    FOnLockUpdate: TdxLockUpdateEvent;
  protected
    procedure AssignInternal(Source: TPersistent); virtual;
    procedure LockUpdate(ALockState: TdxLockState); dynamic;
    function IsLocked: Boolean;

    property UpdateCount: Integer read FUpdateCount;
    property OnLockUpdate: TdxLockUpdateEvent read FOnLockUpdate write FOnLockUpdate;
  public
    constructor Create; virtual;
    procedure Assign(Source: TPersistent); override;

    procedure BeginUpdate;
    procedure CancelUpdate;
    function Clone: TdxBaseObject; virtual;
    procedure EndUpdate;
    function IsEqual(ABaseObject: TdxBaseObject): Boolean; virtual;
    procedure LoadFromFile(const AFileName: string); dynamic;
    procedure LoadFromStream(AStream: TStream); dynamic;
    procedure SaveToFile(const AFileName: string); dynamic;
    procedure SaveToStream(AStream: TStream); dynamic;
  end;

  TdxBaseObjectClass = class of TdxBaseObject;

procedure dxSaveBaseObject(AStream: TStream; ABaseObject: TdxBaseObject);
procedure dxLoadBaseObject(AStream: TStream; ABaseObject: TdxBaseObject);

implementation

uses
  SysUtils;

{ TdxBaseObject }

constructor TdxBaseObject.Create;
begin
  inherited Create;
end;

procedure TdxBaseObject.Assign(Source: TPersistent);
begin
  if Source = Self then Exit;
  if Source is TdxBaseObject then
  begin
    BeginUpdate;
    try
      AssignInternal(Source);
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
end;

procedure TdxBaseObject.AssignInternal(Source: TPersistent);
begin
  {descendent implementation}
end;

function TdxBaseObject.Clone: TdxBaseObject;
begin
  Result := TdxBaseObjectClass(ClassType).Create;
  try
    Result.Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;

function TdxBaseObject.IsEqual(ABaseObject: TdxBaseObject): Boolean;
begin
  Result := ABaseObject is ClassType;
end;

function TdxBaseObject.IsLocked: Boolean;
begin
  Result := FUpdateCount > 0;
end;

procedure TdxBaseObject.LockUpdate(ALockState: TdxLockState);
begin
  if Assigned(FOnLockUpdate) then
    FOnLockUpdate(Self, ALockState);
end;

procedure TdxBaseObject.BeginUpdate;
begin
  if UpdateCount = 0 then LockUpdate(lsLock);
  Inc(FUpdateCount);
end;

procedure TdxBaseObject.CancelUpdate;
begin
  if FUpdateCount <> 0 then Dec(FUpdateCount);
end;

procedure TdxBaseObject.EndUpdate;
begin
  if FUpdateCount <> 0 then
  begin
    Dec(FUpdateCount);
    if UpdateCount = 0 then LockUpdate(lsUnLock);
  end;
end;

procedure TdxBaseObject.SaveToFile(const AFileName: string);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmCreate);
  try
    SaveToStream(AStream);
  finally
    AStream.Free;
  end;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM OFF}	
  {$ENDIF}
{$ENDIF}

procedure TdxBaseObject.LoadFromFile(const AFileName: string);
var
  AStream: TFileStream;
begin
  AStream := TFileStream.Create(AFileName, fmOpenRead or fmShareDenyRead);
  try
    LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

{$IFDEF DELPHI6}
  {$IFDEF MSWINDOWS}
    {$WARN SYMBOL_PLATFORM ON}	
  {$ENDIF}
{$ENDIF}

procedure TdxBaseObject.SaveToStream(AStream: TStream);
begin
  dxSaveBaseObject(AStream, Self);
end;

procedure TdxBaseObject.LoadFromStream(AStream: TStream);
begin
  dxLoadBaseObject(AStream, Self);
end;

type
  TdxSaver = class(TComponent)
  private
    FSaveObject: TdxBaseObject;
  published
    property SaveObject: TdxBaseObject read FSaveObject write FSaveObject;
  end;

procedure dxSaveBaseObject(AStream: TStream; ABaseObject: TdxBaseObject);
var
  ASaver: TdxSaver;
begin
  Assert(Assigned(ABaseObject));
  ASaver := TdxSaver.Create(nil);
  try
    ASaver.SaveObject := ABaseObject;
    AStream.WriteComponent(ASaver);
  finally
    ASaver.Free;
  end;
end;

procedure dxLoadBaseObject(AStream: TStream; ABaseObject: TdxBaseObject);
var
  ASaver: TdxSaver;
begin
  Assert(Assigned(ABaseObject));
  ASaver := TdxSaver.Create(nil);
  try
    ASaver.SaveObject := ABaseObject;
    AStream.ReadComponent(ASaver);
  finally
    ASaver.Free;
  end;
end;

end.
