unit uExcel;

interface

uses WinTypes, Forms, Classes, DdeMan, SysUtils;

type
  TExcel = class(TComponent)
  private
      FMacro     : TFileName;
      FMacroPath : TFileName;
      FDDE       : TDdeClientConv;
      FConnected : Boolean;
      FExeName   : TFileName;
      FDecimals  : Integer;
      FOnClose   : TNotifyEvent;
      FOnOpen    : TNotifyEvent;
      FBatch     : Boolean;
      FMin       : Integer;
      FMax       : Integer;
      FFirstRow  : Integer;
      FFirstCol  : Integer;
      FLastCol   : Integer;
      FLines     : TStrings;    { using TStringList }
      FCells     : TStrings;    { using TStringList }
    procedure SetExeName(const Value: TFileName);
    procedure SetConnect(const Value: Boolean);
    procedure SetMin    (const Value: Integer);
    procedure SetMax    (const Value: Integer);
    function GetSelection: string;
    function GetReady: Boolean;
  protected
    procedure DoRect(Top, Left, Bottom, Right: Integer;
                     Data: TStrings; Request: Boolean);
    procedure CheckConnection; virtual;
    procedure LinkSystem;
    procedure OpenLink(Sender: TObject);
    procedure ShutDown(Sender: TObject);
    procedure LocateExcel; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Connect;
    procedure Disconnect;
    procedure Wait;
    procedure ProcessMessages;
    function Request(const Item: string): string;
    procedure Exec  (const Cmd : string);
    procedure Run   (const Mn  : string);
    procedure Select(Row, Col: Integer);
    procedure PutStr(Row, Col: Integer; const s: string);
    procedure PutExt(Row, Col: Integer; e: Extended); virtual;
    procedure PutInt(Row, Col: Integer; i: Longint);  virtual;
    procedure PutDay(Row, Col: Integer; d: TDateTime);virtual;
    procedure BatchStart(FirstRow, FirstCol: Integer);
    procedure BatchCancel;
    procedure BatchSend;
    procedure GetRange(R: TRect; Lines: TStrings);
    function GetCell(Row, Col: Integer): string;
    procedure OpenMacroFile(const Fn: TFileName; Hide: Boolean);
    procedure CloseMacroFile;
    property DDE: TDdeCLientConv   read FDDE;
    property Connected: Boolean    read FConnected write SetConnect;
    property Ready    : Boolean    read GetReady;
    property Selection: string     read GetSelection;
    property Lines    : TStrings   read FLines;
    property FirstRow : Integer    read FFirstRow;
    property LastCol  : Integer    read FLastCol   write FLastCol;
    property BatchOn  : Boolean    read FBatch;
  published
    property ExeName  : TFileName  read FExeName   write SetExeName;
    property Decimals : Integer    read FDecimals  write FDecimals;
    property BatchMin : Integer    read FMin       write SetMin;
    property BatchMax : Integer    read FMax       write SetMax;
    property OnClose: TNotifyEvent read FOnClose   write FOnClose;
    property OnOpen : TNotifyEvent read FOnOpen    write FOnOpen;
  end;

procedure Register;

{$I EXCELS.INC}      

implementation
uses WinProcs, ShellAPI;

procedure Register;
begin
  RegisterComponents('Liska', [TExcel]);
end;

{ TExcel }

constructor TExcel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if not (csDesigning in ComponentState) then
  begin
    FDDE := TDdeClientConv.Create(nil);
    FDDE.ConnectMode := ddeManual;
    FDDE.OnOpen  := OpenLink;
    FDDE.OnClose := ShutDown;
  end;
  SetExeName('Excel');
  FDecimals := 2;
  FBatch := False;
  FMin := 200;
  FMax := 250;
end;

destructor TExcel.Destroy;
begin
  if not (csDesigning in ComponentState) then FDDE.Free;
  if FLines <> nil then FLines.Free;
  if FCells <> nil then FCells.Free;
  inherited Destroy;
end;

procedure TExcel.SetExeName(const Value: TFileName);
begin
  Disconnect;
  FExeName := ChangeFileExt(Value, '');
  if not (csDesigning in ComponentState) then
    FDDE.ServiceApplication := FExeName;
end;

procedure TExcel.SetConnect(const Value: Boolean);
begin
  if FConnected = Value then Exit;
  if Value then Connect
           else Disconnect;
end;

procedure TExcel.SetMin(const Value: Integer);
begin
  if Value > FMax then FMin := FMax
                  else FMin := Value;
end;

procedure TExcel.SetMax(const Value: Integer);
begin
  if Value < FMin then FMax := FMin
                  else FMax := Value;
end;

function TExcel.GetSelection: string;
begin
  Result := Request('Selection');
end;

function TExcel.GetReady: Boolean;
begin
  Result := 'Ready' = Request('Status');
end;

procedure TExcel.DoRect(Top, Left, Bottom, Right: Integer;
                        Data: TStrings; Request: Boolean);
  var
      i : Integer;
      Sel, Item : string;
      RowMark,
      ColMark : Char;
      Reply : PChar;
begin
  Wait;
  Select(1, 1);                          
  Sel := Selection;
  i := Pos('!', Sel);
  if i = 0 then raise Exception.Create(msgNoTable);
  RowMark := Sel[i+1];                   { Some nationalized version }
  ColMark := Sel[i+3];                   {  using other then R and C }
  FDDE.OnOpen  := nil;
  FDDE.OnClose := nil;                   { Disable event handlers }
try
  FDDE.SetLink('Excel', Copy(Sel, 1, i-1));  { Topic = Sheet name }
  ProcessMessages;
  if not FDDE.OpenLink then
    raise Exception.Create(msgNoLink);
  ProcessMessages;
  Item := Format('%s%d%s%d:%s%d%s%d', [RowMark, Top, ColMark, Left,
                                    RowMark, Bottom, ColMark, Right]);
  if Request then
  begin
    Reply := FDDE.RequestData(Item);
    if Reply <> nil then Data.SetText(Reply);
    StrDispose(Reply);
  end
  else if not FDDE.PokeDataLines(Item, Data) then
    raise Exception.Create('"'+ Item + msgNotAccepted);
finally
  ProcessMessages;
  LinkSystem;
  ProcessMessages;
  FDDE.OpenLink;
  FDDE.OnOpen  := OpenLink;              { Enable event handlers }
  FDDE.OnClose := ShutDown;
  if not Connected and Assigned(FOnClose) then FOnClose(Self);
end;
end;

procedure TExcel.LinkSystem;
begin
  FDDE.SetLink('Excel', 'System');
end;

procedure TExcel.CheckConnection;
begin
  if not Connected then
    raise Exception.Create(msgNoConnect);
end;

procedure TExcel.OpenLink(Sender: TObject);
begin
  FConnected := True;
  if Assigned(FOnOpen) then FOnOpen(Self);
end;

procedure TExcel.ShutDown(Sender: TObject);
begin
  FConnected := False;
  if Assigned(FOnClose) then FOnClose(Self);
end;

procedure TExcel.LocateExcel;
  const
      BuffSize = 255;
  var
      Buff: array[0..BuffSize] of Char;
      Fn  : string;
      Len : Longint;
begin
  Len := BuffSize;
  StrPCopy(Buff, '.XLS');
  if (RegQueryValue(HKEY_CLASSES_ROOT, Buff, Buff, Len)
    = ERROR_SUCCESS) and (StrScan(Buff,'E') <> nil) then
  begin
    StrCat(Buff, '\Shell\Open\Command');
    Len := BuffSize;
    if RegQueryValue(HKEY_CLASSES_ROOT, Buff, Buff, Len)
      = ERROR_SUCCESS then
    begin
      Fn := StrPas(StrUpper(Buff));
      Len := Pos('EXCEL.EXE', Fn);
      Delete(Fn, Len + Length('EXCEL.EXE'), 255);
      if Buff[0] = '"' then Delete(Fn, 1, 1);
      if FileExists(Fn) then
        ExeName := Fn;
    end;
  end;
end;

procedure TExcel.Connect;
begin
  if FConnected then Exit;
  LinkSystem;
  if FDDE.OpenLink then Exit;
  LocateExcel;
  if FDDE.OpenLink then Exit;            { Try again }
  ProcessMessages;
  if FDDE.OpenLink then Exit;            { Once more }
  raise Exception.Create(msgNoExcel);
end;

procedure TExcel.Disconnect;
begin
  if FConnected then FDDE.CloseLink;
end;

procedure TExcel.Wait;
  const
        TryCount = 64;
  var
      i : Integer;
begin
  i := 0;
  repeat
    if Ready then Break;    { Waiting for Excel }
    Inc(i);
  until i = TryCount;
  if i = TryCount then
    raise Exception.Create(msgNoRespond);
end;

procedure TExcel.ProcessMessages;
begin
{$IFDEF WIN32}
  Application.HandleMessage;
{$ELSE}
  Application.ProcessMessages;
{$ENDIF}
end;

function TExcel.Request(const Item: string): string;
  var
      Reply : PChar;
begin
  CheckConnection;
  ProcessMessages;
  Reply := FDDE.RequestData(Item);
  if Reply = nil then Result := msgNoReply
                 else Result := StrPas(Reply);
  StrDispose(Reply);
end;

procedure TExcel.Exec(const Cmd: string);
  var
      a : array[0..555] of Char;
begin
  CheckConnection;
  StrPCopy(a, Cmd);
  if FDDE.ExecuteMacro(a, False) then
    ProcessMessages
  else
  begin
    Wait;
    if FDDE.ExecuteMacro(a, True ) then
      ProcessMessages
    else
      raise Exception.Create('"' + Cmd + msgNotAccepted);
  end
end;

procedure TExcel.Run(const Mn: string);
begin
  if FMacro = '' then
    raise Exception.Create(msgNoMacro);
  Exec('[RUN("' + FMacro + '!' + Mn + '";FALSE)]');
end;

procedure TExcel.Select(Row, Col: Integer);
begin
  Exec(Format('[SELECT("R%dC%d")]', [Row, Col]));
end;

procedure TExcel.PutStr(Row, Col: Integer; const s: string);
  procedure SendMin;
    var
        i : Integer;
  begin
    FCells.Clear;
    for i:=0 to FMin-1 do
    begin
      FCells.Add(FLines[0]);          { FCells as work space }
      FLines.Delete(0);
    end;
    DoRect(FFirstRow, FFirstCol, FFirstRow + FMin - 1, FLastCol,
           FCells, False);
    Inc(FFirstRow, FMin);
  end;

  procedure DoBatch;
    var
        i, j, Index : Integer;
        Line : string;
  begin
    Index := Row - FFirstRow;                { Index to modify }
    if Index >= Lines.Count then
      for i:=Lines.Count to Index do         { Expand if needed }
        Lines.Add('');
    if Lines.Count > FMax then               { Send if needed }
    begin
      SendMin;
      Index := Row - FFirstRow;              { Recalc Index }
    end;
    if Col > FLastCol then FLastCol := Col;  { Adjust to max }
    Line := Lines[Index];
    FCells.Clear;                            { Empty FCells }
    j := 1;
    for i:=1 to Length(Line) do              { Line disasseble }
      if Line[i] = #9 then begin
                             FCells.Add(Copy(Line, j, i-j));
                             j := i + 1;
                           end;
    FCells.Add(Copy(Line, j, Length(Line) + 1 - j));
    if FCells.Count < Col - FFirstCol + 1 then
      for i:=FCells.Count to Col-FFirstCol do{ Expand if needed }
        FCells.Add('');
    FCells[Col-FFirstCol] := s;              { Replace cell }
    Line := FCells[0];
    for i:=1 to FCells.Count-1 do            { Line reasseble }
      Line := Line + #9 + FCells[i];
    Lines[Index] := Line;                    { Replace line }
  end;

begin           { TExcel.PutStr }
  if BatchOn and (Col >= FFirstCol) and (Row >= FFirstRow) then
    DoBatch
  else
    Exec(Format('[FORMULA("%s","R%dC%d")]', [s, Row, Col]));
end;

procedure TExcel.PutExt(Row, Col: Integer; e: Extended);
begin
  PutStr(Row, Col, Format('%0.*f', [Decimals, e]));
end;

procedure TExcel.PutInt(Row, Col: Integer; i: Longint);
begin
  PutStr(Row, Col, IntToStr(i));
end;

procedure TExcel.PutDay(Row, Col: Integer; d: TDateTime);
begin
  PutStr(Row, Col, DateToStr(d));
end;

procedure TExcel.BatchStart(FirstRow, FirstCol: Integer);
begin
  if FLines = nil then FLines := TStringList.Create
                  else FLines.Clear;
  if FCells = nil then FCells := TStringList.Create
                  else FCells.Clear;
  FFirstRow := FirstRow;
  FFirstCol := FirstCol;
  FLastCol  := FirstCol;
  FBatch := True;
end;

procedure TExcel.BatchCancel;
begin
  if FLines <> nil then FLines.Free;
  if FCells <> nil then FCells.Free;
  FLines := nil;
  FCells := nil;
  FBatch := False;
end;

procedure TExcel.BatchSend;
begin
  if FLines <> nil then
    DoRect(FFirstRow, FFirstCol, FFirstRow + FLines.Count - 1,
           FLastCol, FLines, False);
  BatchCancel
end;

procedure TExcel.GetRange(R: TRect; Lines: TStrings);
begin
  DoRect(R.Top, R.Left, R.Bottom, R.Right, Lines, True);
end;

function TExcel.GetCell(Row, Col: Integer): string;
  var
      Data : TStringList;
begin
  Result := msgNoReply;
  Data := TStringList.Create;
try
  DoRect(Row, Col, Row, Col, Data, True);
  if Data.Count = 1 then Result := Data[0];
finally
  Data.Free
end; end;

procedure TExcel.OpenMacroFile(const Fn: TFileName; Hide: Boolean);
begin
  if FMacroPath = Fn then Exit;
  CloseMacroFile;
  Exec('[OPEN("' + Fn + '")]');
  if Hide then  Exec('[HIDE()]');
  FMacroPath := Fn;
  FMacro := ExtractFileName(Fn);
end;

procedure TExcel.CloseMacroFile;
begin
  if FMacro <> '' then
  try
    Exec('[UNHIDE("' + FMacro + '")]');
    Exec('[ACTIVATE("' + FMacro + '")]');
    Exec('[CLOSE(FALSE)]');
  finally
    FMacro := '';
    FMacroPath := '';
  end;
end;

end.
