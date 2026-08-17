unit FSMTimer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Consts;

  {$I FSM.inc}
type
  TFSMTimer = class(TComponent)
  private
    FEnabled: Boolean;
    FInterval: Cardinal;
    FOnTimer: TNotifyEvent;
    FSyncExecution: Boolean;
    FTimerThread: TThread;
    FUseMutex: Boolean;
    FMutexName: string;
    procedure SetEnabled(Value: Boolean);
    procedure SetInterval(Value: Cardinal);
    procedure SetOnTimer(Value: TNotifyEvent);
    procedure SetMutexName(const Value: string);
    procedure SetUseMutex(const Value: Boolean);
  protected
    procedure Timer; dynamic;
  public        
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Synchronize(Method: TThreadMethod);
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property Interval: Cardinal read FInterval write SetInterval default 1000;
    property SyncExecution: Boolean read FSyncExecution write FSyncExecution default True;
    property UseMutex: Boolean read FUseMutex write SetUseMutex;
    property MutexName: string read FMutexName write SetMutexName;
    property OnTimer: TNotifyEvent read FOnTimer write SetOnTimer;
  end;

procedure Register;

implementation

uses
  FSM_WinApiLib;
  
procedure Register;
begin
  RegisterComponents('FSM', [TFSMTimer]);
end;

type
  TFSMTimerThread = class(TThread)
  private
    FOwner: TFSMTimer;
    FInterval: Cardinal;
    FException: Exception;
    FTimerHandle: THandle;
    FEnabled: Boolean;
    procedure HandleException;
    procedure SetInterval(const Value: Cardinal);
    procedure UpdateTimer;
    procedure WndProc(var Msg: TMessage);
    procedure SetEnabled(const Value: Boolean);
  protected
    procedure Timer;
    procedure Execute; override;
  public
    constructor Create(AOwner: TFSMTimer; Enabled: Boolean);
    destructor Destroy; override;
    property Enabled: Boolean read FEnabled write SetEnabled;
    property Interval: Cardinal read FInterval write SetInterval;
  end;

{ TFSMThreadTimer }

constructor TFSMTimer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTimerThread := TFSMTimerThread.Create(Self, False);
  Enabled := True;
  Interval := 1000;
  FSyncExecution := True;
  FUseMutex  := False;
  FMutexName := '';
end;

destructor TFSMTimer.Destroy;
begin
  Destroying;
  FEnabled := False;
  FOnTimer := nil;
  while FTimerThread.Suspended do FTimerThread.Resume;
  FTimerThread.Terminate;
  if FSyncExecution then FTimerThread.WaitFor;
  inherited Destroy;
end;

procedure TFSMTimer.SetEnabled(Value: Boolean);
begin
  if Value <> FEnabled then
  begin
    FEnabled := Value;
    TFSMTimerThread(FTimerThread).Enabled := Value;
  end;
end;

procedure TFSMTimer.SetInterval(Value: Cardinal);
begin
  if Value <> FInterval then begin
    FInterval := Value;
    TFSMTimerThread(FTimerThread).Interval := Value;
  end;
end;

procedure TFSMTimer.SetMutexName(const Value: string);
begin
  FMutexName := Value;
end;

procedure TFSMTimer.SetOnTimer(Value: TNotifyEvent);
begin
  FOnTimer := Value;
end;

procedure TFSMTimer.SetUseMutex(const Value: Boolean);
begin
  FUseMutex := Value;
end;

procedure TFSMTimer.Synchronize(Method: TThreadMethod);
begin
  if (FTimerThread <> nil) then 
    with TFSMTimerThread(FTimerThread) do 
      if Suspended or Terminated then 
        Method
      else 
        TFSMTimerThread(FTimerThread).Synchronize(Method)
  else 
    Method;
end;

procedure TFSMTimer.Timer;
begin
  if FEnabled and not (csDestroying in ComponentState) and
    Assigned(FOnTimer) then FOnTimer(Self);
end;

{ TFSMTimerThread }

constructor TFSMTimerThread.Create(AOwner: TFSMTimer; Enabled: Boolean);
begin
  FOwner := AOwner;
  inherited Create(not Enabled);
  FInterval := 1000;
  FTimerHandle := AllocateHWnd(WndProc);
  FreeOnTerminate := True;
end;

destructor TFSMTimerThread.Destroy;
begin
  KillTimer(FTimerHandle, 1);
  DeallocateHWnd(FTimerHandle);
  inherited Destroy;
end;

procedure TFSMTimerThread.Execute;
begin
  repeat
  until Terminated;
end;

procedure TFSMTimerThread.HandleException;
begin
  if not (FException is EAbort) then
  begin
    if Assigned(Application.OnException) then
      Application.OnException(Self, FException)
    else
      Application.ShowException(FException);
  end;
end;

procedure TFSMTimerThread.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
  UpdateTimer;
end;

procedure TFSMTimerThread.SetInterval(const Value: Cardinal);
begin
  FInterval := Value;
  UpdateTimer;
end;

procedure TFSMTimerThread.Timer;
  function ThreadClosed: Boolean;
  begin
    Result := Terminated or Application.Terminated or (FOwner = nil);
  end;

var
  hnd: THandle;
begin
  if not ThreadClosed and FOwner.FEnabled then
    with FOwner do
    begin
      if FUseMutex and (Trim(FMutexName) <> '') then
      begin
        hnd := OpenMutex(MUTEX_ALL_ACCESS, False, PChar(FMutexName));
        if hnd = 0 then
          hnd := Createmutex(nil, False, PChar(FMutexName));
        WaitForSingleObject(hnd, INFINITE);
      end else
        hnd := 0;
      if SyncExecution then
        Synchronize(FOwner.Timer)
      else
        try
          FOwner.Timer;
        except
          on E: Exception do
          begin
            FException := E;
            HandleException;
          end;
        end;
      if hnd <> 0 then
        ReleaseMutex(hnd);
    end;
end;

procedure TFSMTimerThread.UpdateTimer;
begin
  KillTimer(FTimerHandle, 1);
  if (FInterval <> 0) and FEnabled then
    if SetTimer(FTimerHandle, 1, FInterval, nil) = 0 then
      raise EOutOfResources.Create(SNoTimers);
end;

procedure TFSMTimerThread.WndProc(var Msg: TMessage);
begin
  with Msg do
    if Msg = WM_TIMER then
      try
        Timer;
      except
        on E: Exception do
        begin
          FException := E;
          HandleException;
        end;
      end
    else
      Result := DefWindowProc(FTimerHandle, Msg, wParam, lParam);
end;

end.
