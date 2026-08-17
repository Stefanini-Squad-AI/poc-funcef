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

unit dxPSESys;

interface

{$I dxPSVer.inc}

uses
  Classes, SysUtils;

type  
  EdxEventSystem = class(Exception);

  TdxEventSubscriber = class;
  
  TdxEvent = class;
  TdxEventClass = class of TdxEvent;
  
  TdxPSEventSystem = class
  private
    FEventClasses: TList;
    FSubscribers: TList;
    
    function GetCount: Integer;
    function GetEventClass(Index: Integer): TdxEventClass;
    function GetSubscriberCount: Integer;
    function GetSubscriber(Index: Integer): TdxEventSubscriber;
    procedure MoveSubscriber(ACurIndex, ANewIndex: Integer);
    
    constructor CreateInstance(ADummy: Integer);    
    class function GetInstance(AAccessCode: Integer): TdxPSEventSystem;
    procedure InitializeInstance;
    procedure FinalizeInstance;
  public
    constructor Create;
    destructor Destroy; override;
    
    class function Instance: TdxPSEventSystem; {$IFDEF DELPHI4} overload; virtual; {$ENDIF}
    class procedure ReleaseInstance;

    procedure ProcessEvent(var AEvent: TdxEvent);
    
    procedure RegisterEventClass(AEventClass: TdxEventClass);
    procedure UnregisterEventClass(AEventClass: TdxEventClass);

    procedure RegisterSubscriber(ASubscriber: TdxEventSubscriber);
    procedure UnregisterSubscriber(ASubscriber: TdxEventSubscriber);

    property Count: Integer read GetCount;
    property EventClasses[Index: Integer]: TdxEventClass read GetEventClass;
    property SubscriberCount: Integer read GetSubscriberCount;
    property Subscribers[Index: Integer]: TdxEventSubscriber read GetSubscriber;
  end;


  TdxEventSubscriber = class
  private
    FEnabled: Boolean;
    FEventClasses: TList;
    FRegistered: Boolean;
    
    function GetCount: Integer;
    function GetEventClass(Index: Integer): TdxEventClass;
    function GetIndex: Integer;
    procedure SetIndex(Value: Integer);
    procedure SetRegistered(Value: Boolean);
  protected
    procedure ProcessEvent(AEvent: TdxEvent); virtual; abstract;
  public
    constructor Create(const AEventClasses: array of TdxEventClass);
    destructor Destroy; override;
    
    procedure Add(AEventClass: TdxEventClass);
    procedure Remove(AEventClass: TdxEventClass);
    function SupportsEventClass(AEventClass: TdxEventClass): Boolean;
    
    property Count: Integer read GetCount;
    property Enabled: Boolean read FEnabled write FEnabled default True;
    property EventClasses[Index: Integer]: TdxEventClass read GetEventClass;    
    property Index: Integer read GetIndex write SetIndex;
    property Registered: Boolean read FRegistered write SetRegistered default True;
  end;

  
  TdxEvent = class
  private
    FBreak: Boolean;
    FRegistered: Boolean;
    FSender: TObject;
    
    procedure SetRegistered(Value: Boolean);
  public 
    constructor Create(ASender: TObject);
    
    property Break: Boolean read FBreak write FBreak;     
    property Sender: TObject read FSender;
    property Registered: Boolean read FRegistered write SetRegistered;
  end;

function dxPSEventSystem: TdxPSEventSystem;
procedure dxPSProcessEvent(var AEvent: TdxEvent);

implementation

uses
  Forms, TypInfo;

function dxPSEventSystem: TdxPSEventSystem;
begin
  Result := TdxPSEventSystem.Instance;
end;

procedure dxPSProcessEvent(var AEvent: TdxEvent);
begin
  dxPSEventSystem.ProcessEvent(AEvent);
end;
  
const
  EVENTSYSTEM_ACCESS = 0;
  EVENTSYSTEM_CREATE = 1;
  EVENTSYSTEM_RELEASE = 2;

resourcestring
  rsdxEventSystemAccessOnlyThroughInstance = 'Access class %s through Instance only'; 
  rsdxEventSystemIllegalAccessCode = 'Illegal AccessCode %d in GetInstance';
  
{ TdxPSEventSystem }

procedure EventSystemError(const message: string);
begin
  raise EdxEventSystem.Create(message);
end;
  
constructor TdxPSEventSystem.Create;
begin
  inherited Create;
  EventSystemError(Format(rsdxEventSystemAccessOnlyThroughInstance, [ClassName]));
end;

constructor TdxPSEventSystem.CreateInstance(ADummy: Integer);    
begin
  inherited Create;
  InitializeInstance;
end;

destructor TdxPSEventSystem.Destroy;
begin
  FinalizeInstance;
  if GetInstance(EVENTSYSTEM_ACCESS) = Self then 
    GetInstance(EVENTSYSTEM_RELEASE);
  inherited Destroy;
end;

class function TdxPSEventSystem.GetInstance(AAccessCode: Integer): TdxPSEventSystem;
const
  FInstance: TdxPSEventSystem = nil;
begin 
  case AAccessCode of
    EVENTSYSTEM_ACCESS:; 
    EVENTSYSTEM_CREATE: 
      if FInstance = nil then FInstance := CreateInstance(0);
    EVENTSYSTEM_RELEASE: 
      FInstance := nil      
  else
    EventSystemError(Format(rsdxEventSystemIllegalAccessCode, [AAccessCode]));
  end;
  Result := FInstance;
end;

class function TdxPSEventSystem.Instance: TdxPSEventSystem;
begin
  Result := GetInstance(EVENTSYSTEM_CREATE);
end;

class procedure TdxPSEventSystem.ReleaseInstance;
begin
  GetInstance(EVENTSYSTEM_ACCESS).Free;
end;

procedure TdxPSEventSystem.InitializeInstance;
begin
  FEventClasses := TList.Create;
  FSubscribers := TList.Create;
end;

procedure TdxPSEventSystem.FinalizeInstance;
begin
  while Count > 0 do 
    UnregisterEventClass(EventClasses[Count - 1]);
  FEventClasses.Free;

  while SubscriberCount > 0 do 
    UnregisterSubscriber(Subscribers[SubscriberCount - 1]);
  FSubscribers.Free;    
end;

procedure TdxPSEventSystem.ProcessEvent(var AEvent: TdxEvent);
var
  I: Integer;
  Subscriber: TdxEventSubscriber;
begin
  if (AEvent <> nil) and AEvent.Registered then 
  try
    for I := 0 to SubscriberCount - 1 do
    begin
      Subscriber := Subscribers[I];
      if Subscriber.SupportsEventClass(TdxEventClass(AEvent.ClassType)) and Subscriber.Enabled then
      begin
        try
          Subscriber.ProcessEvent(AEvent);
        except
          Application.HandleException(Self);
        end;  
        if AEvent.Break then Break;
      end;  
    end;  
  finally
    AEvent.Free;
    AEvent := nil;
  end;  
end;

function TdxPSEventSystem.GetCount: Integer;
begin
  Result := FEventClasses.Count;
end;

function TdxPSEventSystem.GetEventClass(Index: Integer): TdxEventClass;
begin
  Result := TdxEventClass(FEventClasses[Index]);
end;

function TdxPSEventSystem.GetSubscriberCount: Integer;
begin
  Result := FSubscribers.Count;
end;

function TdxPSEventSystem.GetSubscriber(Index: Integer): TdxEventSubscriber;
begin
  Result := TdxEventSubscriber(FSubscribers[Index]);
end;

procedure TdxPSEventSystem.MoveSubscriber(ACurIndex, ANewIndex: Integer);
begin
  FSubscribers.Move(ACurIndex, ANewIndex);
end;

procedure TdxPSEventSystem.RegisterEventClass(AEventClass: TdxEventClass);
begin
  if (AEventClass <> nil) and (FEventClasses.IndexOf(AEventClass) = -1)  then 
    FEventClasses.Add(AEventClass);
end;

procedure TdxPSEventSystem.UnregisterEventClass(AEventClass: TdxEventClass);
begin
  FEventClasses.Remove(AEventClass);
end;

procedure TdxPSEventSystem.RegisterSubscriber(ASubscriber: TdxEventSubscriber);
begin
  if (ASubscriber <> nil) and  (FSubscribers.IndexOf(ASubscriber) = -1) then
    FSubscribers.Add(ASubscriber);
end;

procedure TdxPSEventSystem.UnregisterSubscriber(ASubscriber: TdxEventSubscriber);
begin
  FSubscribers.Remove(ASubscriber);
end;
   

{ TdxEventSubscriber }

constructor TdxEventSubscriber.Create(const AEventClasses: array of TdxEventClass);
var
  I: Integer;
begin
  inherited Create;
  FEnabled := True;
  FEventClasses := TList.Create;
  for I := Low(AEventClasses) to High(AEventClasses) do 
    Add(AEventClasses[I]);
  FRegistered := False;
  SetRegistered(True);
end;

destructor TdxEventSubscriber.Destroy;
begin
  SetRegistered(False);
  while FEventClasses.Count > 0 do 
    Remove(FEventClasses.Last);
  FEventClasses.Free;
  inherited Destroy;
end;

procedure TdxEventSubscriber.SetRegistered(Value: Boolean);  
begin
  if FRegistered <> Value then 
  begin
    FRegistered := Value;
    if FRegistered then
      dxPSEventSystem.RegisterSubscriber(Self)
    else  
      dxPSEventSystem.UnregisterSubscriber(Self);    
  end;
end;
  
function TdxEventSubscriber.GetCount: Integer;
begin
  Result := FEventClasses.Count;
end;

function TdxEventSubscriber.GetEventClass(Index: Integer): TdxEventClass;
begin
  Result := TdxEventClass(FEventClasses[Index]);
end;

function TdxEventSubscriber.GetIndex: Integer;
begin
  Result := dxPSEventSystem.FSubscribers.IndexOf(Self);
end;

procedure TdxEventSubscriber.SetIndex(Value: Integer);
var
  CurIndex: Integer;
begin
  if not Registered then 
    Exit;
  if Value < 0 then 
    Value := 0;
  if Value > dxPSEventSystem.SubscriberCount - 1 then 
    Value := dxPSEventSystem.SubscriberCount - 1;
  CurIndex := GetIndex;
  if CurIndex <> Value then 
    dxPSEventSystem.MoveSubscriber(CurIndex, Value);
end;

procedure TdxEventSubscriber.Add(AEventClass: TdxEventClass);
begin
  if not SupportsEventClass(AEventClass) then FEventClasses.Add(AEventClass);
end;

function TdxEventSubscriber.SupportsEventClass(AEventClass: TdxEventClass): Boolean;
begin
  Result := (AEventClass <> nil) and (FEventClasses.IndexOf(AEventClass) <> -1);
end;

procedure TdxEventSubscriber.Remove(AEventClass: TdxEventClass);
begin
   FEventClasses.Remove(AEventClass);
end;


{ TdxEvent }

constructor TdxEvent.Create(ASender: TObject);
begin
  inherited Create;
  FSender := ASender;
  SetRegistered(True);
end;

procedure TdxEvent.SetRegistered(Value: Boolean);  
var 
  EventClass: TdxEventClass;
begin
  if FRegistered <> Value then 
  begin
    FRegistered := Value;
    EventClass := TdxEventClass(ClassType); 
    if FRegistered then
      dxPSEventSystem.RegisterEventClass(EventClass)
    else  
      dxPSEventSystem.UnregisterEventClass(EventClass);
  end;
end;

initialization            

finalization
  TdxPSEventSystem.ReleaseInstance;
  
end.
