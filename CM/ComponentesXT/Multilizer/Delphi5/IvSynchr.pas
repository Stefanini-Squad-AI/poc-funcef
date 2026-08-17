unit IvSynchr;

{$I IVMULTI.INC}

interface

uses
  Windows, Sysutils, Messages, Classes;

type
  TIvSynchroObject = class(TObject)
  public
    procedure Acquire; virtual;
    procedure Release; virtual;
  end;

  TIvHandleObject = class(TIvSynchroObject)
  private
    FHandle: THandle;
    FLastError: Integer;

  public
    destructor Destroy; override;
    property LastError: Integer read FLastError;
    property Handle: THandle read FHandle;
  end;

  TIvWaitResult = (ivwrSignaled, ivwrTimeout, ivwrAbandoned, ivwrError);

  TIvEvent = class(TIvHandleObject)
  public
    constructor Create(
      EventAttributes: PSecurityAttributes;
      ManualReset, InitialState: Boolean;
      const Name: string);
    function WaitFor(Timeout: Longint): TIvWaitResult;
    procedure SetEvent;
    procedure ResetEvent;
  end;

  TIvSimpleEvent = class(TIvEvent)
  public
    constructor Create;
  end;

  TIvCriticalSection = class(TIvSynchroObject)
  private
    FSection: TRTLCriticalSection;

  public
    constructor Create;
    destructor Destroy; override;
    procedure Acquire; override;
    procedure Release; override;
    procedure Enter;
    procedure Leave;
  end;

implementation

{ TIvSynchroObject }

procedure TIvSynchroObject.Acquire;
begin
end;

procedure TIvSynchroObject.Release;
begin
end;

{ TIvHandleObject }

destructor TIvHandleObject.Destroy;
begin
  CloseHandle(FHandle);
  inherited Destroy;
end;

{ TIvEvent }

constructor TIvEvent.Create(
  EventAttributes: PSecurityAttributes;
  ManualReset, InitialState: Boolean;
  const Name: string);
begin
  FHandle := CreateEvent(EventAttributes, ManualReset, InitialState, PChar(Name));
end;

function TIvEvent.WaitFor(Timeout: Longint): TIvWaitResult;
begin
  case WaitForSingleObject(Handle, Timeout) of
    WAIT_ABANDONED: Result := ivwrAbandoned;
    WAIT_OBJECT_0: Result := ivwrSignaled;
    WAIT_TIMEOUT: Result := ivwrTimeout;
    WAIT_FAILED:
      begin
        Result := ivwrError;
        FLastError := GetLastError;
      end;
  else
    Result := ivwrError;
  end;
end;

procedure TIvEvent.SetEvent;
begin
  Windows.SetEvent(Handle);
end;

procedure TIvEvent.ResetEvent;
begin
  Windows.ResetEvent(Handle);
end;

{ TIvSimpleEvent }

constructor TIvSimpleEvent.Create;
begin
  FHandle := CreateEvent(nil, True, False, nil);
end;

{ TIvCriticalSection }

constructor TIvCriticalSection.Create;
begin
  inherited Create;
  InitializeCriticalSection(FSection);
end;

destructor TIvCriticalSection.Destroy;
begin
  DeleteCriticalSection(FSection);
  inherited Destroy;
end;

procedure TIvCriticalSection.Acquire;
begin
  EnterCriticalSection(FSection);
end;

procedure TIvCriticalSection.Release;
begin
  LeaveCriticalSection(FSection);
end;

procedure TIvCriticalSection.Enter;
begin
  Acquire;
end;

procedure TIvCriticalSection.Leave;
begin
  Release;
end;

end.
