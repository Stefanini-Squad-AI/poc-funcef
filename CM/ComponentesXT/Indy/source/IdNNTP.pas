unit IdNNTP;

interface

uses
  Classes,
  IdException,
  IdGlobal,
  IdTCPConnection,
  IdMessage,
  IdMessageClient;

{ 2000-Jun-23 J. Peter Mugaas
   - GetNewGroupsList, GetNewGroupsList, and GetNewNewsList No longer require
     an Event handler if you provide a TStrings to those procedures
   - ParseXOVER was added so that you could parse XOVER data
   - ParseNewsGroup was ripped from GetNewGroupsList so that newsgroups can
     be parsed while not downloading newsgroups
   - moved some duplicate code into a separate procedure
   - the IdNNTP now uses the Indy exceptions and IdResourceStrings to facilitate
     internationalization
  2000-Apr-28 Mark L. Holmes
   -Ported to Indy
  2000-Apr-28
   -Final Version
  1999-Dec-29 MTL
   -Moved to new Palette Scheme (Winshoes Servers)
  Original Authors: Chad Z. /Hower (Kudzu), AHeid, Mark Holmes
}

type
  // Most users of this component should use "mtReader"
  TModeType = (mtStream, mtIHAVE, mtReader);

  TConnectionResult = (crCanPost, crNoPost, crAuthRequired, crTempUnavailable);
  TModeSetResult = (mrCanStream, mrNoStream, mrCanIHAVE, mrNoIHAVE, mrCanPost, mrNoPost);

  TEventStreaming = procedure (const AMesgID: string; var AAccepted: Boolean)of object;
  TNewsTransportEvent = procedure (AMsg: TStringList) of object;
  TEventNewsgroupList = procedure(const ANewsgroup: string; const ALow, AHigh: Cardinal;
		const AType: string; var ACanContinue: Boolean) of object;

  TEventNewNewsList = procedure(const AMsgID: string; var ACanContinue: Boolean) of object;

  TIdNNTP = class(TIdMessageClient)
  protected
    FlMsgHigh,
    FlMsgLow,
    FlMsgNo: Cardinal;
    FsMsgID: string;
    FlMsgCount : Cardinal;
    FNewsAgent: string;
    FOnNewsgroupList,
    FOnNewGroupsList: TEventNewsgroupList;
    FOnNewNewsList: TEventNewNewsList;
    fOnSendCheck: TNewsTransportEvent;
    fOnSendTakethis: TNewsTransportEvent;
    // when threads return
    //fOnDisconnect: TServerEvent;
    fModeType: TModeType;
    fConectionResult: TConnectionResult;
    fModeResult: TModeSetResult;
    //fOnConnect: TServerEvent;
    fOnSendIHAVE: TNewsTransportEvent;
    FbSetMode: Boolean;
    fPassword: string;
    fUserId: string;
    //
    function ConvertDateTimeDist(ADate: TDateTime; AGMT: boolean;
     const ADistributions: string): string;
    procedure SetModeType(const AValue: TModeType);
    procedure setConnectionResult(const AValue: TConnectionResult);
    procedure SetModeResult(const AValue: TModeSetResult);
    function Get(const ACmd: string; const AMsgNo: Cardinal; const AMsgID: string;
     AMsg: TIDMessage): Boolean;
    // TODO: Change SetArticle and others to be two versions and overloaded.
    // or at least rearrange parameter order so that ID can be optional.
    function SetArticle(const ACmd: string; const AMsgNo: Cardinal; const AMsgID: string): Boolean;
    procedure ProcessGroupList(const ACmd: string; const AResponse: integer;
     const AListEvent: TEventNewsgroupList);
  public
    constructor Create(AOwner: TComponent); override;
    procedure Connect; override;
    procedure Disconnect; override;
    function GetArticle(const AMsgNo: Cardinal; const AMsgID: string; AMsg: TIdMessage): Boolean;
    function GetBody(const AMsgNo: Cardinal; const AMsgID: string; AMsg: TIdMessage): Boolean;
    function GetHeader(const AMsgNo: Cardinal; const AMsgID: string; AMsg: TIdMessage): Boolean;
    procedure GetNewsgroupList; overload;
    procedure GetNewsgroupList(AList : TStrings); overload;
    procedure GetNewGroupsList(const ADate: TDateTime; const AGMT: boolean;
     const ADistributions: string); overload;
    procedure GetNewGroupsList(const ADate: TDateTime; const AGMT: boolean;
     const ADistributions: string; AList : TStrings); overload;
    procedure GetNewNewsList(const ANewsgroups: string;
      const ADate: TDateTime; const AGMT: boolean; ADistributions: string); overload;
    procedure GetNewNewsList(const ANewsgroups: string; const ADate: TDateTime;
      const AGMT: boolean; ADistributions: string; AList : TStrings); overload;
    procedure GetOverviewFMT(var AResponse: TStringList);
    function Next: Boolean;
    function Previous: Boolean;
    function SelectArticle(const AMsgNo: Cardinal): Boolean;
    procedure SelectGroup(const AGroup: string);
    procedure Send(AMsg: TidMessage);
    procedure SendIHAVE(AMsg: TStringList);
    procedure SendCheck(AMsgID: TStringList; var AResponses: TStringList);
    function SendCmd(const AOut: string; const AResponse: Array of SmallInt): SmallInt; override;
    function SendTakeThis(AMsg: TStringList) : String;
    procedure SendXHDR(const AHeader: string; const AParam: String; var AResponse: TStringList);
    procedure SendXOVER(const AParm : String; var AResponse: TStringList);
    //
    property MsgID: string read fsMsgID;
    property MsgNo: Cardinal read FlMsgNo;
    property MsgHigh: Cardinal read FlMsgHigh;
    property MsgLow: Cardinal read FlMsgLow;
    property GreetingResult: TConnectionResult read fConectionResult write setConnectionResult;
    property ModeResult: TModeSetResult read fModeResult write SetModeResult;
    property MsgCount: Cardinal read flMsgCount write flMsgCount;
  published
    property NewsAgent: string read FNewsAgent write FNewsAgent;
    property Mode : TModeType read fModeType write SetModeType default mtReader;
    property Password: string read fPassword write fPassword;
    property UserId: string read fUserId write fUserId;
    property SetMode : Boolean read FbSetMode write FbSetMode default True;
    //property OnDisconnect :TserverEvent read fOnDisconnect write fOnDisconnect;
    //property OnConnect: TServerEvent read fOnConnect write fOnConnect;
    property OnSendCheck :TNewsTransportEvent read fOnSendCheck
                                              write fOnSendCheck;
    property OnSendIHAVE: TNewsTransportEvent read fOnSendIHAVE
                                              write fOnSendIHAVE;
    property OnSendTakeThis: TNewsTransportEvent read fOnSendTakethis
                                                 write fOnSendTakethis;
    property OnNewsgroupList: TEventNewsgroupList read FOnNewsgroupList
                                                  write FOnNewsgroupList;
    property OnNewGroupsList: TEventNewsGroupList read FOnNewGroupsList
                                                  write FOnNewGroupsList;
    property OnNewNewsList: TEventNewNewsList read FOnNewNewsList
               write FOnNewNewsList;
    property Port default IdPORT_NNTP; 
  end;

  type
    EIdNNTPException = class(EIdException);
    EIdNNTPNoOnNewGroupsList = class(EIdNNTPException);
    EIdNNTPNoOnNewNewsList = class(EIdNNTPException);
    EIdNNTPNoOnNewsgroupList = class(EIdNNTPException);
    EIdNNTPStringListNotInitialized = class(EIdNNTPException);

    EIdNNTPConnectionRefused = class (EIdProtocolReplyError);

Procedure ParseXOVER(Aline : String; var AArticleIndex : Cardinal;
  var ASubject,
      AFrom : String;
  var ADate : TDateTime;
  var AMsgId,
      AReferences : String;
  var AByteCount,
      ALineCount : Cardinal;
  var AExtraData : String);

Procedure ParseNewsGroup(ALine : String; var ANewsGroup : String;
            var AHi, ALo : Cardinal;
            var AStatus : String);

implementation

uses
  IdComponent,
  IdResourceStrings,
  SysUtils;

Procedure ParseXOVER(Aline : String; var AArticleIndex : Cardinal;
  var ASubject,
      AFrom : String;
  var ADate : TDateTime;
  var AMsgId,
      AReferences : String;
  var AByteCount,
      ALineCount : Cardinal;
  var AExtraData : String);

begin
  {Strip backspace and tab junk sequences which occur after a tab separator so they don't throw off any code}
  ALine := StringReplace(ALine,#9#8#9,#9,[rfReplaceAll]);
  {Article Index}
  AArticleIndex := StrToCard ( Fetch( ALine, #9 ) );
  {Subject}
  ASubject := Fetch ( ALine, #9 );
  {From}
  AFrom := Fetch ( ALine, #9 );
  {Date}
  ADate := StrInternetToDateTime ( Fetch ( Aline, #9 ) );
  {Message ID}
  AMsgId := Fetch ( Aline, #9 );
  {References}
  AReferences := Fetch( ALine, #9);
  {Byte Count}
  AByteCount := StrToCard(Fetch(ALine,#9));
  {Line Count}
  ALineCount := StrToCard(Fetch(ALine,#9));
  {Extra data}
  AExtraData := ALine;
end;

Procedure ParseNewsGroup(ALine : String; var ANewsGroup : String;
            var AHi, ALo : Cardinal;
            var AStatus : String);
begin
  ANewsgroup := Fetch(ALine, ' ');
  AHi := StrToCard(Fetch(Aline, ' '));
  ALo := StrToCard(Fetch(ALine, ' '));
  AStatus := ALine;
end;

constructor TIdNNTP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Mode := mtReader;
  Port := IdPORT_NNTP;
  SetMode := True;
end;

function TIdNNTP.SendCmd(const AOut: string; const AResponse: Array of SmallInt): SmallInt;
begin
  // NOTE: Responses must be passed as arrays so that the proper inherited SendCmd is called
  // and a stack overflow is not caused.
  Result := inherited SendCmd(AOut, []);
  if (Result = 480) or (Result = 450) then begin
    inherited SendCmd('AuthInfo User ' + UserID, [381]);
    inherited SendCmd('AuthInfo Pass ' + Password, [281]);
    Result := inherited SendCmd(AOut, AResponse);
  end else begin
    Result := CheckResponse(Result, AResponse);
  end;
end;

procedure TIdNNTP.Connect;
begin
  inherited;
  try
    GetResponse([]);
    // Here lets check to see what condition we are in after being greeted by
    // the server. The application utilizing NNTPWinshoe should check the value
    // of GreetingResult to determine if further action is warranted.

    case ResultNo of
      200: GreetingResult := crCanPost;
      201: GreetingResult := crNoPost;
      400: GreetingResult := crTempUnavailable;
      // This should never happen because the server should immediately close
      // the connection but just in case ....
      // Kudzu: Changed this to an exception, otherwise it produces non-standard usage by the
      // users code
      502: raise EIdNNTPConnectionRefused.CreateError(502,RSNNTPConnectionRefused);
    end;
    // here we call Setmode on the value stored in mode to make sure we can
    // use the mode we have selected
    case mode of
    mtStream: begin
        SendCmd('mode stream');
        if ResultNo <> 203 then
          ModeResult := mrNoStream
        else
          ModeResult := mrCanStream;
      end;
    mtReader: begin
         // We should get the same info we got in the greeting
         // result but we set mode to reader anyway since the
         // server may want to do some internal reconfiguration
         // if it knows that a reader has connected
         SendCmd('mode reader');
         if  ResultNo <> 200 then
           ModeResult := mrNoPost
         else
           ModeResult := mrCanPost;
       end;
    end;
  except
    Disconnect;
    Raise;
  end;
end;

procedure TIdNNTP.Disconnect;
begin
  try
    if Connected then
      WriteLn('Quit');
  finally
    inherited;
  end;
end;

{ This procedure gets the overview format as suported by the server }
procedure TIdNNTP.GetOverviewFMT(var AResponse: TStringList);
begin
  SendCmd('list overview.fmt', 215);
  Capture(AResponse);
end;

{ Send the XOVER Command.  XOVER [Range]
  Range can be of the form: Article Number i.e. 1
                            Article Number followed by a dash
                            Article Number followed by a dash and aother number
  Remember to select a group first and to issue a GetOverviewFMT so that you
  can interpret the information sent by the server corectly. }
procedure TIdNNTP.SendXOVER(const AParm : String; var AResponse: TStringList);
begin
  SendCmd('xover ' + AParm, 224);
  Capture(AResponse);
end;

{ Send the XHDR Command.  XHDR Header (Range | Message-ID)
  Range can be of the form: Article Number i.e. 1
                            Article Number followed by a dash
                            Article Number followed by a dash and aother number
  Parm is either the Range or the MessageID of the articles you want. They
  are Mutually Exclusive}
procedure TIdNNTP.SendXHDR(const AHeader: string; const AParam: String; var AResponse: TStringList);
begin
  { This method will send the XHDR command.
  The programmer is responsible for choosing the correct header. Headers
  that should always work as per RFC 1036 are:

      From
      Date
      Newsgroups
      Subject
      Message-ID
      Path

    These Headers may work... They are optional per RFC1036 and new headers can
    be added at any time as server implementation changes

      Reply-To
      Sender
      Followup-To
      Expires
      References
      Control
      Distribution
      Organization
      Keywords
      Summary
      Approved
      Lines
      Xref
    }
  SendCmd('XHDR ' + AHeader + ' ' + AParam, 221);
  Capture(AResponse);
end;

procedure TIdNNTP.SelectGroup(const AGroup: string);
var
  s: string;
begin
  SendCmd('Group ' + AGroup, [211]);
  s := Copy(CmdResult, 5, Maxint);
  FlMsgCount := StrToCard(Fetch(s));
  FlMsgLow := StrToCard(Fetch(s));
  FlMsgHigh := StrToCard(Fetch(s));
end;

function TIdNNTP.Get(const ACmd: string; const AMsgNo: Cardinal; const AMsgID: string;
 AMsg: TidMessage): Boolean;
begin
  Result := SetArticle(ACmd, AMsgNo, AMsgID);
  if Result then begin
    AMsg.Clear;
    if AnsiSameText(ACmd, 'HEAD') then begin
      // Catch Header  only
      if ResultNo in [220, 221] then begin
        ReceiveHeader(AMsg,'.');
      end;
    end
    else
    begin
      // Catch Header
      if ResultNo in [220, 221] then begin
        ReceiveHeader(AMsg,'');
      end;
      // Catch Body
      if ResultNo in [220, 222] then
        ReceiveBody(AMsg);
    end;
  end;
end;


{ This method will send messages via the IHAVE command.
The IHAVE command first sends the message ID and waits for a response from the
server prior to sending the header and body. This command is of no practical
use for NNTP client readers as readers are generally denied the privelege
to execute the IHAVE command. this is a news transport command. So use this
when you are implementing a NNTP server send unit }

procedure TIdNNTP.SendIHAVE(AMsg: TStringList);
var
  i     : Integer;
  MsgID : String;
  Temp  : String;
begin
  // check for a predefined method handler if not execute the default
  if not Assigned(FOnSendIHAVE) then begin
    // Since we are merely forwarding messages we have already received
    // it is assumed that the required header fields and body are already in place
    // If you don't wish to make this assumption utilize the onSendIHAVE event
    // and do your custom verification.

    // We need to get the message ID from the stringlist because it's required
    // that we send it s part of the IHAVE command
    for i := 0 to AMsg.Count - 1 do
      if IndyPos('Message-ID',AMsg.Strings[i]) > 0 then begin
        MsgID := AMsg.Strings[i];
        Temp := Fetch(MsgID,':');
        Break;
      end;
    SendCmd('IHAVE ' + MsgID,335);
    // Now we send the entire article both header and body
    for i := 0 to AMsg.Count - 1 do
        WriteLn(AMsg[i]);
    WriteLn('.');
    Temp := Readln;
  end;
end;

{ This method is simple we are going to send a check command. The check command
sends a message ID to the server and you do not have to wait for a response
from the server before sending the next check command. you should keep track of
the results though since this will dictate which articles you will actually
send the server via the Takethis command. It is not a requirement to send the
Check command prior to Takethis}

procedure TIdNNTP.SendCheck(AMsgID: TStringList;
  var AResponses: TStringList);
var
  i        : Integer;
begin
  // a string list rather than a simple string is used because you should be
  // sending more than one message id at a time. It's too expensive to make a
  // procedure call 20 times as opposed to doing a little work beforehand to fill
  // the sringlist with message-ids. For example you could store a list of
  // message id's in a file and send them later
  // just a thought... You could also write out the values in Responses to file
  // send send those messages later as well since they are the messages that
  // the peer currently would accept but no guarantee it will accept them later.
  if not Assigned(FOnSendCheck) then begin
    for i := 0 to AMsgID.Count - 1 do
      Writeln('CHECK '+ AMsgID.Strings[i]);
    for i := 0 to AMsgID.Count - 1 do begin
      // build a list of message id's to send
      if assigned(AResponses) then
        AResponses.Add(ReadLn)
      else
        raise EIdNNTPStringListNotInitialized.Create(RSNNTPStringListNotInitialized);
    end;
  end;
end;

{ This method is in support of so called streaming NNTP. It works like IHAVE
except you need not wait for a response from the server before you send the
next article. You should go over Responses later to determine how many articles
were actually accepted. you then can adjust the max number of takethis commands
to send t any one time to a particular site}

function TIdNNTP.SendTakeThis(AMsg: TStringList) : String;
var
  i        : Integer;
  MsgID    : String;
  Temp     : String;
begin
  if not Assigned(FOnSendTakeThis) then begin
    // Since we are merely forwarding messages we have already received
    // it is assumed that the required header fields and body are already in place
    // If you don't wish to make this assumption utilize the onSendITakethis event
    // and do your custom verification.

    // we check the value of moderesult if setmode is true. If the condition is
    // satisfied then choose the IHAVE route since we probably can do that
    // quit because we can't send via takethis anyway

    if (Setmode) and (ModeResult = mrNoStream) then begin
      Mode := mtIHAVE;
      // call the IHAVE routine. all subsequent calls to takethis will fail but
      // go out via IHAVE
      SendIHAVE(AMsg);
      Exit;
    end;
    // We need to get the message ID from the stringlist because it's required
    // that we send it s part of the TAKETHIS command

    for i := 0 to AMsg.Count - 1 do
      if IndyPos('Message-ID',AMsg.Strings[i]) > 0 then begin
        MsgID := AMsg.Strings[i];
        Temp := Fetch(MsgID,':');
        Break;
      end;
    try
      Writeln('TAKETHIS ' + MsgID);
      for i := 0 to AMsg.Count - 1 do
        WriteLn(AMsg[i]);
      WriteLn('.');
    finally
      Result := Readln;
    end;
  end;
end;

procedure TIdNNTP.Send(AMsg: TidMessage);
begin
  SendCmd('Post', 340);
  //Header
  with AMsg.ExtraHeaders do begin
    Values['Lines'] := IntToStr(AMsg.Body.Count);
    Values['X-Newsreader'] := NewsAgent;
  end;
  SendMsg(AMsg);
  inherited;
  SendCmd('.', 240);
end;


procedure TIdNNTP.ProcessGroupList(const ACmd: string; const AResponse: integer;
 const AListEvent: TEventNewsgroupList);
var
  s1, sNewsgroup: string;
  lLo, lHi: Cardinal;
  sStatus: string;
  CanContinue: Boolean;
begin
  BeginWork(wmRead,0);
  try
    SendCmd(ACmd, AResponse);
    s1 := ReadLn;
    CanContinue := True;
    while (s1 <> '.') and CanContinue do
    begin
      ParseNewsGroup(s1, sNewsgroup, lHi, lLo, sStatus);
      AListEvent(sNewsgroup, lLo, lHi, sStatus, CanContinue);
      s1 := ReadLn;
    end;
  finally
    EndWork(wmRead);
  end;
end;

procedure TIdNNTP.GetNewsgroupList;
begin
  if not Assigned(FOnNewsgroupList) then
    raise EIdNNTPNoOnNewsgroupList.Create(RSNNTPNoOnNewsgroupList);

  ProcessGroupList('List', 215, FOnNewsgroupList);
end;

procedure TIdNNTP.GetNewGroupsList(const ADate: TDateTime; const AGMT: boolean;
 const ADistributions: string);
begin
  if not Assigned(FOnNewGroupsList) then begin
    raise EIdNNTPNoOnNewGroupsList.Create(RSNNTPNoOnNewGroupsList);
  end;
  ProcessGroupList('Newgroups ' + ConvertDateTimeDist(ADate, AGMT, ADistributions), 231
   , FOnNewGroupsList);
end;

procedure TIdNNTP.GetNewNewsList(const ANewsgroups: string;
const ADate: TDateTime; const AGMT: boolean; ADistributions: string);
var
  s1: string;
  CanContinue: Boolean;
begin
  if not Assigned(FOnNewNewsList) then
    raise EIdNNTPNoOnNewNewsList.Create(RSNNTPNoOnNewNewsList);

  BeginWork(wmRead,0); try
    SendCmd('Newnews ' + ANewsgroups + ' ' + ConvertDateTimeDist(ADate, AGMT, ADistributions), 230);
    s1 := ReadLn;
    CanContinue := True;
    while (s1 <> '.') and CanContinue do
    begin
      FOnNewNewsList(s1, CanContinue);
      s1 := ReadLn;
    end;
  finally
    EndWork(wmRead);
  end;
end;

function TIdNNTP.GetArticle(const AMsgNo: Cardinal; const AMsgID: string;
 AMsg: TidMessage) : Boolean;
begin
  Result := Get('Article', AMsgNo, AMsgID, AMsg);
end;

function TIdNNTP.GetBody(const AMsgNo: Cardinal; const AMsgID: string;
 AMsg: TidMessage) : Boolean;
begin
  Result := Get('Body', AMsgNo, AMsgID, AMsg);
end;

function TIdNNTP.GetHeader(const AMsgNo: Cardinal; const AMsgID: string;
 AMsg: TidMessage) : Boolean;
begin
  Result := Get('Head', AMsgNo, AMsgID, AMsg);
end;

function TIdNNTP.Next: Boolean;
begin
  Result := SetArticle('Next', 0, '');
end;

function TIdNNTP.Previous: Boolean;
begin
  Result := SetArticle('Last', 0, '');
end;

function TIdNNTP.SelectArticle(const AMsgNo: Cardinal): Boolean;
begin
  Result := SetArticle('Stat', AMsgNo, '');
end;

function TIdNNTP.SetArticle(const ACmd: string; const AMsgNo: Cardinal;
 const AMsgID: string) : Boolean;
var
  s: string;
begin
  if AMsgNo >= 1 then
    SendCmd(ACmd + ' ' + IntToStr(AMsgNo))
  else if AMsgID <> '' then
    SendCmd(ACmd + ' <' + AMsgID + '>')
  else // Retrieve / Set currently selected atricle
    SendCmd(ACmd);

  if ResultNo in [220, 221, 222, 223] then begin
    if AMsgID = '' then begin
      s := CmdResult;
      Fetch(s, ' ');
      flMsgNo := StrToCard(Fetch(s, ' '));
      fsMsgID := s;
    end;
    Result := True;
  end else if (ResultNo = 421) or (ResultNo = 422)
   or (ResultNo = 423) or (ResultNo = 430) then begin
    // 421 no next article in this group
    // 422 no previous article in this group
    // 423 no such article number in this group
    // 430 no such article found
    Result := False;
  end else begin
    raise EidResponseError.Create(CmdResult);
  end;
end;

procedure TIdNNTP.SetModeType(const AValue: TModeType);
begin
  fModeType := AValue;
end;

procedure TIdNNTP.setConnectionResult(const AValue: TConnectionResult);
begin
  fConectionResult := AValue;
end;

procedure TIdNNTP.SetModeResult(const AValue: TModeSetResult);
begin
  fModeResult := AValue;
end;

procedure TIdNNTP.GetNewsgroupList(AList: TStrings);
begin
  SendCmd('List', 215);
  Capture(AList);
end;

procedure TIdNNTP.GetNewGroupsList(const ADate: TDateTime; const AGMT: boolean;
 const ADistributions: string; AList: TStrings);
begin
  SendCmd('Newgroups ' + ConvertDateTimeDist(ADate, AGMT, ADistributions), 231);
  Capture(AList);
end;

procedure TIdNNTP.GetNewNewsList(const ANewsgroups: string; const ADate: TDateTime;
 const AGMT: boolean; ADistributions: string; AList: TStrings);
begin
  SendCmd('Newnews ' + ANewsgroups + ' ' + ConvertDateTimeDist(ADate, AGMT, ADistributions), 230);
  Capture(AList);
end;

function TIdNNTP.ConvertDateTimeDist(ADate: TDateTime; AGMT: boolean;
 const ADistributions: string): string;
begin
  Result := FormatDateTime('yymmdd hhnnss', ADate);
  if AGMT then begin
    Result:= Result + ' GMT';
  end;
  if Length(ADistributions) > 0 then begin
    Result := ' <' + ADistributions + '>';
  end;
end;

end.
