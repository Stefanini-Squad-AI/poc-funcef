//---------------------------------------------------------------------
//
// ComPort serial communication component
//
// Copyright (c) 1998, 99 Erik Salaj
//
//---------------------------------------------------------------------

unit ComPort;

{$ifdef VER110} // C++ Builder 3
  {$ObjExportAll On}
{$endif VER110}

interface

uses
  Windows, SysUtils, Classes, Dialogs, DsgnIntf, Forms;

type
  TDeviceNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure GetValues(Proc: TGetStrProc); override;
  end;

  EComError = class(Exception);

  TCustomComPort = class;

  TComThread = class(TThread)
  private
    FComPort: TCustomComPort;
  public
    constructor Create(ComPort: TCustomComPort);
    procedure Execute; override;
  end;

  TBaudRate = (brDefault, br110, br300, br600, br1200, br2400, br4800, br9600,
               br10400, br14400, br19200, br28800, br38400, br56000, br57600,
               br115200, br128000, br256000);
  TParity = (paDefault, paNone, paOdd, paEven, paMark, paSpace);
  TStopBits = (sbDefault, sb1, sb1_5, sb2);
  TDataBits = (dbDefault, db4, db5, db6, db7, db8);
  TOption = (opCheckParity, opOutputCTSFlow, opOutputDSRFlow,
             opDSRSensitivity, opTXContinueOnXOff,
             opUseErrorChar, opDiscardNullBytes, opAbortOnError);
  TOptions = set of TOption;
  TModemStatusValue = (msCTS, msDSR, msRing, msRLSD);
  TModemStatus = set of TModemStatusValue;
  TLineError = (leBreak, leDeviceNotSelected, leFrame, leIO, leMode, leOutOfPaper,
                leOverrun, leDeviceTimeOut, leRxOverflow, leParity, leTxFull);
  TLineErrors = set of TLineError;
  TDTRControl = (dcDefault, dcDisable, dcEnable, dcHandshake);
  TRTSControl = (rcDefault, rcDisable, rcEnable, rcHandshake, rcToggle);
  TXOnXOffControl = (xcDefault, xcDisable, xcInput, xcOutput, xcInputOutput);
  TPriorityClass = (pcDefault, pcIdle, pcNormal, pcHigh, pcRealTime);
  TReadWriteEvent = procedure (Sender: TObject; Buffer: Pointer; Length: Integer; WaitOnCompletion: Boolean) of object;
  TComAction = (caFail, caAbort);
  TComErrorEvent = procedure (ComPort: TCustomComPort; E: EComError; var Action: TComAction) of object;
  TLineErrorEvent = procedure (Sender: TObject; LineErrors: TLineErrors) of object;

  TFlowControl = class(TPersistent)
  private
    FComPort: TCustomComPort;
    FDTRControl: TDTRControl;
    FRTSControl: TRTSControl;
    FXOnXOffControl: TXOnXOffControl;
    FXOnLimit: WORD;
    FXOffLimit: WORD;
    procedure SetDTRControl(Value: TDTRControl);
    procedure SetRTSControl(Value: TRTSControl);
    procedure SetXOnXOffControl(Value: TXOnXOffControl);
    procedure SetXOnLimit(Value: WORD);
    procedure SetXOffLimit(Value: WORD);
  public
    constructor Create(ComPort: TCustomComPort);
  published
    property DTR: TDTRControl read FDTRControl write SetDTRControl default dcDefault;
    property RTS: TRTSControl read FRTSControl write SetRTSControl default rcDefault;
    property XOnXOff: TXOnXOffControl read FXOnXOffControl write SetXOnXOffControl default xcDefault;
    property XOnLimit: WORD read FXOnLimit write SetXOnLimit default 0;
    property XOffLimit: WORD read FXOffLimit write SetXOffLimit default 0;
  end;

  TCharacters = class(TPersistent)
  private
    FComPort: TCustomComPort;
    FXOn: Char;
    FXOff: Char;
    FError: Char;
    FEof: Char;
    FEvent: Char;
    procedure SetXOn(Value: Char);
    procedure SetXOff(Value: Char);
    procedure SetError(Value: Char);
    procedure SetEof(Value: Char);
    procedure SetEvent(Value: Char);
  public
    constructor Create(ComPort: TCustomComPort);
  published
    property XOn: Char read FXOn write SetXOn default #17;
    property XOff: Char read FXOff write SetXOff default #19;
    property Error: Char read FError write SetError default #0;
    property Eof: Char read FEof write SetEof default #0;
    property Event: Char read FEvent write SetEvent default #0;
  end;

  TBufferSizes = class(TPersistent)
  private
    FComPort: TCustomComPort;
    FInput: Integer;
    FOutput: Integer;
    procedure SetInput(Value: Integer);
    procedure SetOutput(Value: Integer);
  public
    constructor Create(ComPort: TCustomComPort);
  published
    property Input: Integer read FInput write SetInput default 4096;
    property Output: Integer read FOutput write SetOutput default 2048;
  end;

  TTimeouts = class(TPersistent)
  private
    FComPort: TCustomComPort;
    FReadInterval: Integer;
    FReadMultiplier: Integer;
    FReadConstant: Integer;
    FWriteMultiplier: Integer;
    FWriteConstant: Integer;
    procedure SetReadInterval(Value: Integer);
    procedure SetReadMultiplier(Value: Integer);
    procedure SetReadConstant(Value: Integer);
    procedure SetWriteMultiplier(Value: Integer);
    procedure SetWriteConstant(Value: Integer);
  public
    constructor Create(ComPort: TCustomComPort);
  published
    property ReadInterval: Integer read FReadInterval write SetReadInterval default 0;
    property ReadMultiplier: Integer read FReadMultiplier write SetReadMultiplier default 0;
    property ReadConstant: Integer read FReadConstant write SetReadConstant default 0;
    property WriteMultiplier: Integer read FWriteMultiplier write SetWriteMultiplier default 0;
    property WriteConstant: Integer read FWriteConstant write SetWriteConstant default 0;
  end;

  TCustomComPort = class(TComponent)
  private
    FActive: Boolean;
    FHandle: THandle;
    FReadEventHandle: THandle;
    FWriteEventHandle: THandle;
    FReadOverlapped: TOverlapped;
    FWriteOverlapped: TOverlapped;
    FComThread: TComThread;
    FEventMask: DWord;
    FRequestedReadCount: DWord;
    FRequestedWriteCount: DWord;
    FOriginalPriorityClass: DWord;

    FBaudRate: TBaudRate;
    FBufferSizes: TBufferSizes;
    FCharacters: TCharacters;
    FDataBits: TDataBits;
    FDeviceName: String;
    FFlowControl: TFlowControl;
    FParity: TParity;
    FPriorityClass: TPriorityClass;
    FOptions: TOptions;
    FStopBits: TStopBits;
    FSynchronizeEvents: Boolean;
    FTimeouts: TTimeouts;

    FAfterRead: TReadWriteEvent;
    FAfterWrite: TReadWriteEvent;
    FBeforeRead: TReadWriteEvent;
    FBeforeWrite: TReadWriteEvent;
    FOnBreak: TNotifyEvent;
    FOnCTSChange: TNotifyEvent;
    FOnDSRChange: TNotifyEvent;
    FOnError: TComErrorEvent;
    FOnEvent1: TNotifyEvent;
    FOnEvent2: TNotifyEvent;
    FOnLineError: TLineErrorEvent;
    FOnPrinterError: TNotifyEvent;
    FOnRing: TNotifyEvent;
    FOnRLSDChange: TNotifyEvent;
    FOnRx80PercFull: TNotifyEvent;
    FOnRxChar: TNotifyEvent;
    FOnRxFlag: TNotifyEvent;
    FOnTxEmpty: TNotifyEvent;

    function GetAbout: String;
    function GetActive: Boolean;
    function GetLineErrors: TLineErrors;
    function GetModemStatus: TModemStatus;
    procedure SetAbout(const Value: String);
    procedure SetActive(const Value: Boolean);
    procedure SetBaudRate(Value: TBaudRate);
    procedure SetBufferSizes(Value: TBufferSizes);
    procedure SetCharacters(Value: TCharacters);
    procedure SetDataBits(Value: TDataBits);
    procedure SetDeviceName(const Value: String);
    procedure SetFlowControl(Value: TFlowControl);
    procedure SetOptions(Value: TOptions);
    procedure SetParity(Value: TParity);
    procedure SetPriorityClass(Value: TPriorityClass);
    procedure SetStopBits(Value: TStopBits);
    procedure SetSynchronizeEvents(Value: Boolean);
    procedure SetTimeouts(Value: TTimeouts);

    procedure SetOnBreak(Value: TNotifyEvent);
    procedure SetOnCTSChange(Value: TNotifyEvent);
    procedure SetOnDSRChange(Value: TNotifyEvent);
    procedure SetOnEvent1(Value: TNotifyEvent);
    procedure SetOnEvent2(Value: TNotifyEvent);
    procedure SetOnLineError(Value: TLineErrorEvent);
    procedure SetOnPrinterError(Value: TNotifyEvent);
    procedure SetOnRing(Value: TNotifyEvent);
    procedure SetOnRLSDChange(Value: TNotifyEvent);
    procedure SetOnRx80PercFull(Value: TNotifyEvent);
    procedure SetOnRxChar(Value: TNotifyEvent);
    procedure SetOnRxFlag(Value: TNotifyEvent);
    procedure SetOnTxEmpty(Value: TNotifyEvent);

    procedure CheckActive;
    procedure CheckInactive;
    procedure SetComDCB;
    procedure SetComEventMask;
    procedure SetComBufferSizes;
    procedure SetComTimeouts;
  protected
    procedure CreateHandle; virtual;
    procedure FreeHandle;
    procedure Loaded; override;
    procedure Check(Value: Boolean);
    procedure RaiseError(const ErrorMsg: String);
    procedure ThreadDoEvent;
    procedure ThreadProc;

    property About: String read GetAbout write SetAbout stored False;
    property Active: Boolean read GetActive write SetActive;
    property BaudRate: TBaudRate read FBaudRate write SetBaudRate default brDefault;
    property BufferSizes: TBufferSizes read FBufferSizes write SetBufferSizes;
    property Characters: TCharacters read FCharacters write SetCharacters;
    property DataBits: TDataBits read FDataBits write SetDataBits default dbDefault;
    property DeviceName: String read FDeviceName write SetDeviceName;
    property LineErrors: TLineErrors read GetLineErrors;
    property FlowControl: TFlowControl read FFlowControl write SetFlowControl;
    property ModemStatus: TModemStatus read GetModemStatus stored False;
    property Options: TOptions read FOptions write SetOptions;
    property Parity: TParity read FParity write SetParity default paDefault;
    property PriorityClass: TPriorityClass read FPriorityClass write SetPriorityClass default pcDefault;
    property StopBits: TStopBits read FStopBits write SetStopBits default sbDefault;
    property SynchronizeEvents: Boolean read FSynchronizeEvents write SetSynchronizeEvents default True;
    property Timeouts: TTimeouts read FTimeouts write SetTimeouts;

    property AfterRead: TReadWriteEvent read FAfterRead write FAfterRead;
    property AfterWrite: TReadWriteEvent read FAfterWrite write FAfterWrite;
    property BeforeRead: TReadWriteEvent read FBeforeRead write FBeforeRead;
    property BeforeWrite: TReadWriteEvent read FBeforeWrite write FBeforeWrite;
    property OnBreak: TNotifyEvent read FOnBreak write SetOnBreak;
    property OnCTSChange: TNotifyEvent read FOnCTSChange write SetOnCTSChange;
    property OnDSRChange: TNotifyEvent read FOnDSRChange write SetOnDSRChange;
    property OnError: TComErrorEvent read FOnError write FOnError;
    property OnEvent1: TNotifyEvent read FOnEvent1 write SetOnEvent1;
    property OnEvent2: TNotifyEvent read FOnEvent2 write SetOnEvent2;
    property OnLineError: TLineErrorEvent read FOnLineError write SetOnLineError;
    property OnPrinterError: TNotifyEvent read FOnPrinterError write SetOnPrinterError;
    property OnRing: TNotifyEvent read FOnRing write SetOnRing;
    property OnRLSDChange: TNotifyEvent read FOnRLSDChange write SetOnRLSDChange;
    property OnRx80PercFull: TNotifyEvent read FOnRx80PercFull write SetOnRx80PercFull;
    property OnRxChar: TNotifyEvent read FOnRxChar write SetOnRxChar;
    property OnRxFlag: TNotifyEvent read FOnRxFlag write SetOnRxFlag;
    property OnTxEmpty: TNotifyEvent read FOnTxEmpty write SetOnTxEmpty;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure Read(Buf: Pointer; Count: Integer; WaitForCompletion: Boolean);
    procedure Write(Buf: Pointer; Count: Integer; WaitForCompletion: Boolean);
    function ReadString: String;
    procedure WriteString(const Value: String);
    function ReadChar: Char;
    procedure WriteChar(Value: Char);
    function ReadByte: Byte;
    procedure WriteByte(Value: Byte);
    function ReadWord: Word;
    procedure WriteWord(Value: Word);
    function ReadDWord: DWord;
    procedure WriteDWord(Value: DWord);
    function InputCount: DWord;
    function OutputCount: DWord;
    function ReadPending: Boolean;
    function WritePending: Boolean;
    procedure WaitForReadCompletion;
    procedure WaitForWriteCompletion;
    procedure PurgeInput;
    procedure PurgeOutput;

    procedure ConfigDialog;
    procedure ClearBreak;
    procedure ClearDTR;
    procedure ClearRTS;
    procedure ResetDevice;
    procedure SetBreak;
    procedure SetDTR;
    procedure SetRTS;
    procedure SetXOn;
    procedure SetXOff;
    procedure TransmitChar(Value: Char);
    property Handle: THandle read FHandle;
  end;

  TComPort = class(TCustomComPort)
  published
    property About;
    property Active;
    property BaudRate;
    property BufferSizes;
    property Characters;
    property DataBits;
    property DeviceName;
    property FlowControl;
    property LineErrors;
    property ModemStatus;
    property Options;
    property Parity;
    property PriorityClass;
    property StopBits;
    property SynchronizeEvents;
    property Timeouts;

    property AfterRead;
    property AfterWrite;
    property BeforeRead;
    property BeforeWrite;
    property OnBreak;
    property OnCTSChange;
    property OnDSRChange;
    property OnError;
    property OnEvent1;
    property OnEvent2;
    property OnLineError;
    property OnPrinterError;
    property OnRing;
    property OnRLSDChange;
    property OnRx80PercFull;
    property OnRxChar;
    property OnRxFlag;
    property OnTxEmpty;
  end;

implementation

const
  SComOpen = 'Não é possível efetuar essa operação pois a porta está aberta';
  SComClosed = 'Não é possível efetuar essa operação pois a porta está fechada';
  SComCantCreateThread = 'Não foi possível criar a "Thread"';
  SComTimeout = 'Timeout';

//---------------------------------------------------------------------
//
// TComThread
//

constructor TComThread.Create(ComPort: TCustomComPort);
begin
  inherited Create(True);
  FComPort := ComPort;
  Priority := tpTimeCritical;
end;

procedure TComThread.Execute;
begin
  repeat
    FComPort.ThreadProc;
  until Terminated;
end;

//---------------------------------------------------------------------
//
// TCustomComPort
//

constructor TCustomComPort.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHandle := INVALID_HANDLE_VALUE;
  FDeviceName := 'COM2';
  FOriginalPriorityClass := $FFFFFFFF;
  FSynchronizeEvents := True;
  FFlowControl := TFlowControl.Create(Self);
  FCharacters := TCharacters.Create(Self);
  FBufferSizes := TBufferSizes.Create(Self);
  FTimeouts := TTimeouts.Create(Self);
end;

destructor TCustomComPort.Destroy;
begin
  Close;
  FTimeouts.Free;
  FBufferSizes.Free;
  FCharacters.Free;
  FFlowControl.Free;
  inherited Destroy;
end;

function TCustomComPort.GetAbout: String;
begin
  Result := 'Version 1.3, Copyright (c) 1998, 99 Erik Salaj, http://www.cybermagic.co.nz/winsoft';
end;

procedure TCustomComPort.SetAbout(const Value: String);
begin
end;

procedure TCustomComPort.RaiseError(const ErrorMsg: String);
var Action: TComAction;
begin
  try
    raise EComError.Create(ErrorMsg);
  except
    on E: EComError do
    begin
      Action := caFail;
      if Assigned(FOnError) then
        FOnError(Self, E, Action);
      if Action = caAbort then
        SysUtils.Abort
      else
        raise;
    end;
  end;
end;

procedure TCustomComPort.Check(Value: Boolean);
var LastError: DWord;
begin
  if not Value then
  begin
    LastError := GetLastError;
    if (LastError <> 0) and (LastError <> ERROR_IO_PENDING) then
    begin
      SetLastError(0);
      RaiseError('Error ' + IntToStr(LastError));
    end;
  end;
end;

procedure TCustomComPort.SetBaudRate(Value: TBaudRate);
begin
  if FBaudRate <> Value then
  begin
    FBaudRate := Value;
    SetComDCB;
  end;
end;

procedure TCustomComPort.SetDataBits(Value: TDataBits);
begin
  if FDataBits <> Value then
  begin
    FDataBits := Value;
    SetComDCB;
  end;
end;

procedure TCustomComPort.SetParity(Value: TParity);
begin
  if FParity <> Value then
  begin
    FParity := Value;
    SetComDCB;
  end;
end;

procedure TCustomComPort.SetStopBits(Value: TStopBits);
begin
  if FStopBits <> Value then
  begin
    FStopBits := Value;
    SetComDCB;
  end;
end;

procedure TCustomComPort.SetOptions(Value: TOptions);
begin
  if FOptions <> Value then
  begin
    FOptions := Value;
    SetComDCB;
  end;
end;

procedure TCustomComPort.SetComDCB;
const
  flagBinary           = $00000001;
  flagParity           = $00000002;
  flagOutCTSFlow       = $00000004;
  flagOutDSRFlow       = $00000008;
  flagDTRControl       = $00000030;
  flagDSRSensitivity   = $00000040;
  flagTxContinueOnXoff = $00000080;
  flagOutX             = $00000100;
  flagInX              = $00000200;
  flagErrorChar        = $00000400;
  flagNull             = $00000800;
  flagRTSControl       = $00003000;
  flagAbortOnError     = $00004000;
  flagDummy            = $FFFF8000;

  ComBaudRate: array [TBaudRate] of Integer =
    (0, CBR_110, CBR_300, CBR_600, CBR_1200, CBR_2400, CBR_4800, CBR_9600, 10400, CBR_14400,
     CBR_19200, 28800, CBR_38400, CBR_56000, CBR_57600, CBR_115200, CBR_128000, CBR_256000);
  ComParity: array [TParity] of Integer =
    (0, NOPARITY, ODDPARITY, EVENPARITY, MARKPARITY, SPACEPARITY);
  ComStopBits: array [TStopBits] of Integer =
    (0, ONESTOPBIT, ONE5STOPBITS, TWOSTOPBITS);
  ComDataBits: array [TDataBits] of Integer =
    (0, 4, 5, 6, 7, 8);
  ComDTRControl: array [TDTRControl] of Integer =
    (0, DTR_CONTROL_DISABLE shl 4, DTR_CONTROL_ENABLE shl 4, DTR_CONTROL_HANDSHAKE shl 4);
  ComRTSControl: array [TRTSControl] of Integer =
    (0, RTS_CONTROL_DISABLE shl 12, RTS_CONTROL_ENABLE shl 12,
     RTS_CONTROL_HANDSHAKE shl 12, RTS_CONTROL_TOGGLE shl 12);
  ComXOnXOffControl: array [TXOnXOffControl] of Integer =
    (0, 0, flagInX, flagOutX, flagInX or flagOutX);
  ComOptions: array [TOption] of Integer =
    (flagParity, flagOutCTSFlow, flagOutDSRFlow, flagDSRSensitivity,
     flagTxContinueOnXoff, flagErrorChar, flagNull, flagAbortOnError);
var
  DCB: TDCB;
  Option: TOption;
begin
  if Active and not (csDesigning in ComponentState) then
  begin
    DCB.DCBLength := SizeOf(DCB);
    Check(GetCommState(FHandle, DCB));
    with DCB do
    begin
      if FBaudRate <> brDefault then BaudRate := ComBaudRate[FBaudRate];
      if FDataBits <> dbDefault then ByteSize := ComDataBits[FDataBits];
      if FParity <> paDefault   then Parity   := ComParity[FParity];
      if FStopBits <> sbDefault then StopBits := ComStopBits[FStopBits];

      with FCharacters do
      begin
        XOnChar := XOn;
        XOffChar := XOff;
        ErrorChar := Error;
        EofChar := Eof;
        EvtChar := Event;
      end;

      with FFlowControl do
      begin
        if DTR <> dcDefault then
          Flags := (Flags and not flagDTRControl) or ComDTRControl[DTR];
        if RTS <> rcDefault then
          Flags := (Flags and not flagRTSControl) or ComRTSControl[RTS];
        if XOnXOff <> xcDefault then
          Flags := (Flags and not (flagInX or flagOutX)) or ComXOnXOffControl[XOnXOff];

        XonLim := XOnLimit;
        XoffLim := XOffLimit;
      end;

      for Option := Low(Option) to High(Option) do
        if Option in FOptions then
          Flags := Flags or ComOptions[Option]
        else
          Flags := Flags and not ComOptions[Option];
    end;
    Check(SetCommState(FHandle, DCB));
  end;
end;

procedure TCustomComPort.SetOnBreak(Value: TNotifyEvent);
begin
  if @FOnBreak <> @Value then
  begin
    FOnBreak := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnCTSChange(Value: TNotifyEvent);
begin
  if @FOnCTSChange <> @Value then
  begin
    FOnCTSChange := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnDSRChange(Value: TNotifyEvent);
begin
  if @FOnDSRChange <> @Value then
  begin
    FOnDSRChange := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnLineError(Value: TLineErrorEvent);
begin
  if @FOnLineError <> @Value then
  begin
    FOnLineError := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnPrinterError(Value: TNotifyEvent);
begin
  if @FOnPrinterError <> @Value then
  begin
    FOnPrinterError := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnEvent1(Value: TNotifyEvent);
begin
  if @FOnEvent1 <> @Value then
  begin
    FOnEvent1 := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnEvent2(Value: TNotifyEvent);
begin
  if @FOnEvent2 <> @Value then
  begin
    FOnEvent2 := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnRing(Value: TNotifyEvent);
begin
  if @FOnRing <> @Value then
  begin
    FOnRing := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnRLSDChange(Value: TNotifyEvent);
begin
  if @FOnRLSDChange <> @Value then
  begin
    FOnRLSDChange := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnRx80PercFull(Value: TNotifyEvent);
begin
  if @FOnRx80PercFull <> @Value then
  begin
    FOnRx80PercFull := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnRxChar(Value: TNotifyEvent);
begin
  if @FOnRxChar <> @Value then
  begin
    FOnRxChar := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnRxFlag(Value: TNotifyEvent);
begin
  if @FOnRxFlag <> @Value then
  begin
    FOnRxFlag := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetOnTxEmpty(Value: TNotifyEvent);
begin
  if @FOnTxEmpty <> @Value then
  begin
    FOnTxEmpty := Value;
    SetComEventMask;
  end;
end;

procedure TCustomComPort.SetComEventMask;
var EventMask: DWord;
begin
  if Active and not (csDesigning in ComponentState) then
  begin
    EventMask := 0;
    if Assigned(FOnBreak)        then EventMask := EventMask or EV_BREAK;
    if Assigned(FOnCTSChange)    then EventMask := EventMask or EV_CTS;
    if Assigned(FOnDSRChange)    then EventMask := EventMask or EV_DSR;
    if Assigned(FOnLineError)    then EventMask := EventMask or EV_ERR;
    if Assigned(FOnEvent1)       then EventMask := EventMask or EV_EVENT1;
    if Assigned(FOnEvent2)       then EventMask := EventMask or EV_EVENT2;
    if Assigned(FOnPrinterError) then EventMask := EventMask or EV_PERR;
    if Assigned(FOnRing)         then EventMask := EventMask or EV_RING;
    if Assigned(FOnRLSDChange)   then EventMask := EventMask or EV_RLSD;
    if Assigned(FOnRx80PercFull) then EventMask := EventMask or EV_RX80FULL;
    if Assigned(FOnRxChar)       then EventMask := EventMask or EV_RXCHAR;
    if Assigned(FOnRxFlag)       then EventMask := EventMask or EV_RXFLAG;
    if Assigned(FOnTxEmpty)      then EventMask := EventMask or EV_TXEMPTY;

    with FComThread do
      if (EventMask = 0) and not Suspended then
        Suspend;

    Check(SetCommMask(FHandle, EventMask));

    with FComThread do
      if (EventMask <> 0) and Suspended then
        Resume;
  end;
end;

procedure TCustomComPort.Loaded;
begin
  inherited Loaded;
  SetActive(FActive);
end;

function TCustomComPort.GetActive: Boolean;
begin
  if not (csDesigning in ComponentState) then
    Result := FHandle <> INVALID_HANDLE_VALUE
  else
    Result := FActive;
end;

procedure TCustomComPort.SetActive(const Value: Boolean);
begin
  if Active <> Value then
    if not (csDesigning in ComponentState) then
      if not (csLoading in ComponentState) then
        if Value then Open else Close;
  FActive := Value;
end;

procedure TCustomComPort.CheckActive;
begin
  if not Active then
    RaiseError(SComClosed);
end;

procedure TCustomComPort.CheckInactive;
begin
  if not (csDesigning in ComponentState) then
    if Active then
      RaiseError(SComOpen);
end;

procedure TCustomComPort.SetDeviceName(const Value: String);
begin
  if FDeviceName <> Value then
  begin
    CheckInactive;
    FDeviceName := Value;
  end;
end;

procedure TCustomComPort.SetSynchronizeEvents(Value: Boolean);
begin
  if FSynchronizeEvents <> Value then
  begin
    CheckInactive;
    FSynchronizeEvents := Value;
  end;
end;

procedure TCustomComPort.SetPriorityClass(Value: TPriorityClass);
begin
  if FPriorityClass <> Value then
  begin
    CheckInactive;
    FPriorityClass := Value;
  end;  
end;

procedure TCustomComPort.Open;
begin
  if not Active then
    CreateHandle;
end;

procedure TCustomComPort.Close;
begin
  FreeHandle;
end;

procedure TCustomComPort.ThreadProc;
begin
  WaitCommEvent(FHandle, FEventMask, nil);
  if not FComThread.Terminated then
    if not FSynchronizeEvents then
      ThreadDoEvent
    else
      FComThread.Synchronize(ThreadDoEvent)
end;

procedure TCustomComPort.ThreadDoEvent;
begin
  try

    if FEventMask and EV_BREAK <> 0 then
      if Assigned(FOnBreak) then FOnBreak(Self);

    if FEventMask and EV_CTS <> 0 then
      if Assigned(FOnCTSChange) then FOnCTSChange(Self);

    if FEventMask and EV_DSR <> 0 then
      if Assigned(FOnDSRChange) then FOnDSRChange(Self);

    if FEventMask and EV_ERR <> 0 then
      if Assigned(FOnLineError) then FOnLineError(Self, LineErrors);

    if FEventMask and EV_EVENT1 <> 0 then
      if Assigned(FOnEvent1) then FOnEvent1(Self);

    if FEventMask and EV_EVENT2 <> 0 then
      if Assigned(FOnEvent2) then FOnEvent2(Self);

    if FEventMask and EV_PERR <> 0 then
      if Assigned(FOnPrinterError) then FOnPrinterError(Self);

    if FEventMask and EV_RING <> 0 then
      if Assigned(FOnRing) then FOnRing(Self);

    if FEventMask and EV_RLSD <> 0 then
      if Assigned(FOnRLSDChange) then FOnRLSDChange(Self);

    if FEventMask and EV_RX80FULL <> 0 then
      if Assigned(FOnRx80PercFull) then FOnRx80PercFull(Self);

    if FEventMask and EV_RXCHAR <> 0 then
      if Assigned(FOnRxChar) then FOnRxChar(Self);

    if FEventMask and EV_RXFLAG <> 0 then
      if Assigned(FOnRxFlag) then FOnRxFlag(Self);

    if FEventMask and EV_TXEMPTY <> 0 then
      if Assigned(FOnTxEmpty) then FOnTxEmpty(Self);

  except
    on E: Exception do Application.HandleException(E);
  end;
end;

procedure TCustomComPort.PurgeInput;
begin
  if Active then
    Check(PurgeComm(FHandle, PURGE_RXABORT or PURGE_RXCLEAR));
end;

procedure TCustomComPort.PurgeOutput;
begin
  if Active then
    Check(PurgeComm(FHandle, PURGE_TXABORT or PURGE_TXCLEAR));
end;

procedure TCustomComPort.SetComBufferSizes;
begin
  if Active and not (csDesigning in ComponentState) then
    Check(SetupComm(FHandle, FBufferSizes.Input, FBufferSizes.Output));
end;

procedure TCustomComPort.SetComTimeouts;
var CommTimeouts: TCommTimeouts;
begin
  if Active and not (csDesigning in ComponentState) then
    with FTimeouts, CommTimeouts do
    begin
      Check(GetCommTimeouts(FHandle, CommTimeouts));
      ReadIntervalTimeout := ReadInterval;
      ReadTotalTimeoutMultiplier := ReadMultiplier;
      ReadTotalTimeoutConstant := ReadConstant;
      WriteTotalTimeoutMultiplier := WriteMultiplier;
      WriteTotalTimeoutConstant := WriteConstant;
      Check(SetCommTimeouts(FHandle, CommTimeOuts));
    end;
end;

procedure TCustomComPort.CreateHandle;
const
  WinPriorityClass: array [TPriorityClass] of DWord =
  ( 0, IDLE_PRIORITY_CLASS, NORMAL_PRIORITY_CLASS,
    HIGH_PRIORITY_CLASS, REALTIME_PRIORITY_CLASS);
begin
  FreeHandle;
  SetLastError(0);
  try
    if PriorityClass <> pcDefault then
    begin
      FOriginalPriorityClass := GetPriorityClass(GetCurrentProcess);
      Windows.SetPriorityClass(GetCurrentProcess, WinPriorityClass[PriorityClass]);
    end;

    // read event object
    FReadEventHandle := CreateEvent(nil, True, True, nil);
    Check(FReadEventHandle <> 0);

    // write event object
    FWriteEventHandle := CreateEvent(nil, True, True, nil);
    Check(FWriteEventHandle <> 0);

    // create thread
    FComThread := TComThread.Create(Self);
    if FComThread = nil then
      RaiseError(SComCantCreateThread);

    // open comm port
    FHandle := CreateFile(PChar(FDeviceName), GENERIC_READ or GENERIC_WRITE,
                          0, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, 0);
    Check(FHandle <> INVALID_HANDLE_VALUE);

    PurgeInput;
    PurgeOutput;

    SetComBufferSizes;
    SetComDCB;
    SetComTimeouts;
    SetComEventMask;

  except
    FreeHandle;
    raise;
  end;
end;

procedure TCustomComPort.FreeHandle;
begin
  if FHandle <> INVALID_HANDLE_VALUE then
  begin
    PurgeInput;
    PurgeOutput;
    WaitForReadCompletion;
    WaitForWriteCompletion;
  end;

  if FComThread <> nil then
  begin
    FComThread.Terminate;
    SetCommMask(FHandle, 0);
    FComThread.Free;
    FComThread := nil;
  end;

  if FHandle <> INVALID_HANDLE_VALUE then
  begin
    CloseHandle(FHandle);
    FHandle := INVALID_HANDLE_VALUE;
  end;

  if FWriteEventHandle <> 0 then
  begin
    CloseHandle(FWriteEventHandle);
    FWriteEventHandle := 0;
  end;

  if FReadEventHandle <> 0 then
  begin
    CloseHandle(FReadEventHandle);
    FReadEventHandle := 0;
  end;

  if FOriginalPriorityClass <> $FFFFFFFF then
  begin
    Windows.SetPriorityClass(GetCurrentProcess, FOriginalPriorityClass);
    FOriginalPriorityClass := $FFFFFFFF;
  end;
end;

procedure TCustomComPort.WaitForReadCompletion;
var ReadCount: DWord;
begin
  if ReadPending then
  begin
    Check(GetOverlappedResult(FHandle, FReadOverlapped, ReadCount, True));
    if FRequestedReadCount <> ReadCount then
      RaiseError(SComTimeout);
  end;
end;

procedure TCustomComPort.WaitForWriteCompletion;
var WriteCount: DWord;
begin
  if WritePending then
  begin
    Check(GetOverlappedResult(FHandle, FWriteOverlapped, WriteCount, True));
    if FRequestedWriteCount <> WriteCount then
      RaiseError(SComTimeout);
  end;
end;

function TCustomComPort.InputCount: DWord;
var
  Errors: DWord;
  ComStat: TComStat;
begin
  Check(ClearCommError(FHandle, Errors, @ComStat));
  Result := ComStat.cbInQue;
end;

function TCustomComPort.OutputCount: DWord;
var
  Errors: DWord;
  ComStat: TComStat;
begin
  Check(ClearCommError(FHandle, Errors, @ComStat));
  Result := ComStat.cbOutQue;
end;

function TCustomComPort.GetLineErrors: TLineErrors;
const
  ComError: array [TLineError] of Integer =
  (CE_BREAK, CE_DNS, CE_FRAME, CE_IOE, CE_MODE, CE_OOP,
   CE_OVERRUN, CE_PTO, CE_RXOVER, CE_RXPARITY, CE_TXFULL);
var
  Errors: DWord;
  LineError: TLineError;
begin
  Check(ClearCommError(FHandle, Errors, nil));
  Result := [];
  for LineError := Low(TLineError) to High(TLineError) do
    if Errors and ComError[LineError] <> 0 then
      Result := Result + [LineError];
end;

function TCustomComPort.ReadPending: Boolean;
begin
  if FReadEventHandle <> 0 then
    Result := WaitForSingleObject(FReadEventHandle, 0) <> WAIT_OBJECT_0
  else
    Result := False;
end;

function TCustomComPort.WritePending: Boolean;
begin
  if FWriteEventHandle <> 0 then
    Result := WaitForSingleObject(FWriteEventHandle, 0) <> WAIT_OBJECT_0
  else
    Result := False;
end;

procedure TCustomComPort.Read(Buf: Pointer; Count: Integer; WaitForCompletion: Boolean);
var ReadCount: DWord;
begin
  CheckActive;

  if Assigned(FBeforeRead) then
    FBeforeRead(Self, Buf, Count, WaitForCompletion);

  WaitForReadCompletion;

  FRequestedReadCount := Count;
  if FRequestedReadCount > 0 then
  begin
    FillChar(FReadOverlapped, SizeOf(FReadOverlapped), 0);
    FReadOverlapped.hEvent := FReadEventHandle;
    Check(ResetEvent(FReadEventHandle));

    Check(ReadFile(FHandle, Buf^, Count, ReadCount, @FReadOverlapped));
    if WaitForCompletion then
      WaitForReadCompletion;
  end;

  if Assigned(FAfterRead) then
    FAfterRead(Self, Buf, Count, WaitForCompletion);
end;

procedure TCustomComPort.Write(Buf: Pointer; Count: Integer; WaitForCompletion: Boolean);
var WriteCount: DWord;
begin
  CheckActive;

  if Assigned(FBeforeWrite) then
    FBeforeWrite(Self, Buf, Count, WaitForCompletion);

  WaitForWriteCompletion;

  FRequestedWriteCount := Count;
  if FRequestedWriteCount > 0 then
  begin
    FillChar(FWriteOverlapped, SizeOf(FWriteOverlapped), 0);
    FWriteOverlapped.hEvent := FWriteEventHandle;
    Check(ResetEvent(FWriteEventHandle));

    Check(WriteFile(FHandle, Buf^, Count, WriteCount, @FWriteOverlapped));
    if WaitForCompletion then
      WaitForWriteCompletion;
  end;

  if Assigned(FAfterWrite) then
    FAfterWrite(Self, Buf, Count, WaitForCompletion);
end;

function TCustomComPort.ReadString: String;
begin
  SetLength(Result, InputCount);
  Read(@Result[1], Length(Result), True);
end;

procedure TCustomComPort.WriteString(const Value: String);
begin
  Write(@Value[1], Length(Value), False);
end;

function TCustomComPort.ReadChar: Char;
begin
  Read(@Result, 1, True);
end;

procedure TCustomComPort.WriteChar(Value: Char);
begin
  Write(@Value, 1, False);
end;

function TCustomComPort.ReadByte: Byte;
begin
  Read(@Result, 1, True);
end;

procedure TCustomComPort.WriteByte(Value: Byte);
begin
  Write(@Value, 1, False);
end;

function TCustomComPort.ReadWord: Word;
begin
  Read(@Result, 2, True);
end;

procedure TCustomComPort.WriteWord(Value: Word);
begin
  Write(@Value, 2, False);
end;

function TCustomComPort.ReadDWord: DWord;
begin
  Read(@Result, 4, True);
end;

procedure TCustomComPort.WriteDWord(Value: DWord);
begin
  Write(@Value, 4, False);
end;

procedure TCustomComPort.ConfigDialog;
var
  CommConfig: TCommConfig;
  Size: DWord;
begin
  CheckActive;
  Size := SizeOf(CommConfig);
  Check(GetCommConfig(FHandle, CommConfig, Size));
  if CommConfigDialog(PChar(FDeviceName), 0, CommConfig) then
    Check(SetCommConfig(FHandle, CommConfig, SizeOf(CommConfig)));
end;

procedure TCustomComPort.TransmitChar(Value: Char);
begin
  CheckActive;
  Check(TransmitCommChar(FHandle, Value));
end;

procedure TCustomComPort.SetBreak;
begin
  CheckActive;
  Check(SetCommBreak(FHandle));
end;

procedure TCustomComPort.ClearBreak;
begin
  CheckActive;
  Check(ClearCommBreak(FHandle));
end;

procedure TCustomComPort.SetDTR;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, Windows.SETDTR));
end;

procedure TCustomComPort.ClearDTR;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, CLRDTR));
end;

procedure TCustomComPort.SetRTS;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, Windows.SETRTS));
end;

procedure TCustomComPort.ClearRTS;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, CLRRTS));
end;

procedure TCustomComPort.SetXOn;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, Windows.SETXON));
end;

procedure TCustomComPort.SetXOff;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, Windows.SETXOFF));
end;

procedure TCustomComPort.ResetDevice;
begin
  CheckActive;
  Check(EscapeCommFunction(FHandle, RESETDEV));
end;

function TCustomComPort.GetModemStatus: TModemStatus;
var ModemStat: DWord;
begin
  CheckActive;
  Check(GetCommModemStatus(FHandle, ModemStat));
  Result := [];
  if ModemStat and MS_CTS_ON  <> 0 then Result := Result + [msCTS];
  if ModemStat and MS_DSR_ON  <> 0 then Result := Result + [msDSR];
  if ModemStat and MS_RING_ON <> 0 then Result := Result + [msRing];
  if ModemStat and MS_RLSD_ON <> 0 then Result := Result + [msRLSD];
end;

procedure TCustomComPort.SetFlowControl(Value: TFlowControl);
begin
  FFlowControl.Assign(Value);
end;

procedure TCustomComPort.SetCharacters(Value: TCharacters);
begin
  FCharacters.Assign(Value);
end;

procedure TCustomComPort.SetBufferSizes(Value: TBufferSizes);
begin
  FBufferSizes.Assign(Value);
end;

procedure TCustomComPort.SetTimeouts(Value: TTimeouts);
begin
  FTimeouts.Assign(Value);
end;

//---------------------------------------------------------------------
//
// TFlowControl
//

constructor TFlowControl.Create(ComPort: TCustomComPort);
begin
  inherited Create;
  FComPort := ComPort;
end;

procedure TFlowControl.SetDTRControl(Value: TDTRControl);
begin
  if FDTRControl <> Value then
  begin
    FDTRControl := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TFlowControl.SetRTSControl(Value: TRTSControl);
begin
  if FRTSControl <> Value then
  begin
    FRTSControl := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TFlowControl.SetXOnXOffControl(Value: TXOnXOffControl);
begin
  if FXOnXOffControl <> Value then
  begin
    FXOnXOffControl := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TFlowControl.SetXOnLimit(Value: WORD);
begin
  if FXOnLimit <> Value then
  begin
    FXOnLimit := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TFlowControl.SetXOffLimit(Value: WORD);
begin
  if FXOffLimit <> Value then
  begin
    FXOffLimit := Value;
    FComPort.SetComDCB;
  end;
end;

//---------------------------------------------------------------------
//
// TCharacters
//

constructor TCharacters.Create(ComPort: TCustomComPort);
begin
  inherited Create;
  FComPort := ComPort;
  FXon := #17;
  FXoff := #19;
end;

procedure TCharacters.SetXOn(Value: Char);
begin
  if FXOn <> Value then
  begin
    FXOn := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TCharacters.SetXOff(Value: Char);
begin
  if FXOff <> Value then
  begin
    FXOff := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TCharacters.SetError(Value: Char);
begin
  if FError <> Value then
  begin
    FError := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TCharacters.SetEof(Value: Char);
begin
  if FEof <> Value then
  begin
    FEof := Value;
    FComPort.SetComDCB;
  end;
end;

procedure TCharacters.SetEvent(Value: Char);
begin
  if FEvent <> Value then
  begin
    FEvent := Value;
    FComPort.SetComDCB;
  end;
end;

//---------------------------------------------------------------------
//
// TBufferSize
//

constructor TBufferSizes.Create(ComPort: TCustomComPort);
begin
  inherited Create;
  FComPort := ComPort;
  FInput := 4096;
  FOutput := 2048;
end;

procedure TBufferSizes.SetInput(Value: Integer);
begin
  if FInput <> Value then
  begin
    FInput := Value;
    FComPort.SetComBufferSizes;
  end;
end;

procedure TBufferSizes.SetOutput(Value: Integer);
begin
  if FOutput <> Value then
  begin
    FOutput := Value;
    FComPort.SetComBufferSizes;
  end;
end;

//---------------------------------------------------------------------
//
// TTimeouts
//

constructor TTimeouts.Create(ComPort: TCustomComPort);
begin
  inherited Create;
  FComPort := ComPort;
end;

procedure TTimeouts.SetReadInterval(Value: Integer);
begin
  if FReadInterval <> Value then
  begin
    FReadInterval := Value;
    FComPort.SetComTimeouts;
  end;
end;

procedure TTimeouts.SetReadMultiplier(Value: Integer);
begin
  if FReadMultiplier <> Value then
  begin
    FReadMultiplier := Value;
    FComPort.SetComTimeouts;
  end;
end;

procedure TTimeouts.SetReadConstant(Value: Integer);
begin
  if FReadConstant <> Value then
  begin
    FReadConstant := Value;
    FComPort.SetComTimeouts;
  end;
end;

procedure TTimeouts.SetWriteMultiplier(Value: Integer);
begin
  if FWriteMultiplier <> Value then
  begin
    FWriteMultiplier := Value;
    FComPort.SetComTimeouts;
  end;
end;

procedure TTimeouts.SetWriteConstant(Value: Integer);
begin
  if FWriteConstant <> Value then
  begin
    FWriteConstant := Value;
    FComPort.SetComTimeouts;
  end;
end;

function TDeviceNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paValueList, paSortList];
end;

procedure TDeviceNameProperty.GetValues(Proc: TGetStrProc);
begin
  Proc('COM1');
  Proc('COM2');
  Proc('COM3');
  Proc('COM4');
end;

end.
