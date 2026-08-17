unit IdNNTPServer;

interface

{
2000-Apr=22 Mark L. Holmes
  Ported to Indy
2000-Mar-27
  Final Version
2000-Jan-13 MTL
  Moved to new Palette Scheme (Winshoes Servers)
Original Author: Ozz Nixon
}
uses
  Classes,
  IdGlobal,
  IdTCPServer;

const
   KnownCommands : Array [1..26] of string =
   {from RFC977 and Extensions}
      ('ARTICLE',
       'BODY',
       'HEAD',
       'STAT',
       'GROUP',
       'LIST',
       'HELP',
       'IHAVE',
       'LAST',
       'NEWGROUPS',
       'NEWNEWS',
       'NEXT',
       'POST',
       'QUIT',
       'SLAVE',
       'AUTHINFO',
       'XOVER',
       'XHDR',
       'DATE',      {returns "111 YYYYMMDDHHNNSS"}
       'LISTGROUP', {returns all the article numbers for specified group}
       'MODE',      {for the MODE command}
       'TAKETHIS',  {streaming nntp}
       'CHECK',     {streaming nntp need this to go with takethis}
       'XTHREAD',   {Useful mainly for the TRN newsreader }
       'XGTITLE',   {legacy support}
       'XPAT'       {Header Pattern matching}
       );

type
  TGetEvent = procedure(AThread: TIdPeerThread) of object;
  TOtherEvent = procedure(AThread: TIdPeerThread;ACommand:String;AParm:String;var AHandled:Boolean) of object;
  TDoByIDEvent = procedure(AThread: TIdPeerThread;AActualID:string) of object;
  TDoByNoEvent = procedure(AThread: TIdPeerThread;AActualNumber:Cardinal) of object;
  TGroupEvent = procedure(AThread: TIdPeerThread;AGroup:string) of object;
  TNewsEvent = procedure(AThread: TIdPeerThread;AParm:String) of object;
  TDataEvent = procedure(AThread: TIdPeerThread;AData:TObject) of object;

  TIdNNTPServer = class(TIdTCPServer)
  protected
    fOnCommandAuthInfo:TOtherEvent;                {authinfo user [data] or authinfo pass [data]}
    fOnCommandArticleID:TDoByIDEvent;              {article <message-id>}
    fOnCommandArticleNO:TDoByNoEvent;              {article 7872}
    fOnCommandBodyID:TDoByIDEvent;                 {body <message-id>}
    fOnCommandBodyNO:TDoByNoEvent;                 {body 7872}
    fOnCommandHeadID:TDoByIDEvent;                 {head <message-id>}
    fOnCommandHeadNO:TDoByNoEvent;                 {head 7872}
    fOnCommandStatID:TDoByIDEvent;                 {stat <message-id>} {useless!}
    fOnCommandStatNO:TDoByNoEvent;                 {stat 7872}
    fOnCommandGroup:TGroupEvent;                   {group net.news}
    fOnCommandList:TNewsEvent;                     {list [optional parm]}
    fOnCommandHelp:TGetEvent;                      {help}
    fOnCommandIHave:TDoByIDEvent;                  {ihave <message-id>}
    fOnCommandLast:TGetEvent;                      {last}
    fOnCommandMode:TNewsEvent;                     {mode reader}
    fOnCommandNewGroups:TNewsEvent;                {newsgroups yymmdd hhmmss [GMT] <distributions>}
    fOnCommandNewNews:TNewsEvent;                  {newnews newsgroups yymmdd hhmmss [GMT] <distributions>}
    fOnCommandNext:TGetEvent;                      {next}
    fOnCommandPost:TGetEvent;                      {post}
    fOnCommandQuit:TGetEvent;                      {quit}
    fOnCommandSlave:TGetEvent;                     {slave}
{not in RFC977}
    fOnCommandXOver:TNewsEvent;                    {xover start#-stop#}
    fOnCommandXHDR:TNewsEvent;                     {xhdr header start#-stop#}
    fOnCommandDate:TGetEvent;                      {date}
    fOnCommandListgroup:TNewsEvent;                {listgroup net.news}
    fOnCommandTakeThis:TDoByIDEvent;               {nntp transport ext}
    fOnCommandCheck:TDoByIDEvent;                  {nntp transport ext}
    fOnCommandXThread:TNewsEvent;                  {XTHREAD support for Tin}
    fOnCommandXGTitle:TNewsEvent;                  {legacy support}
    fOnCommandXPat:TNewsEvent;                     {XPAT}
{other support}
    fOnCommandOther:TOtherEvent;
    //
    function DoExecute(AThread: TIdPeerThread): boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property OnCommandAuthInfo: TOtherEvent read fOnCommandAuthInfo write fOnCommandAuthInfo;
    property OnCommandArticleID: TDoByIDEvent read fOnCommandArticleID write fOnCommandArticleID;
    property OnCommandArticleNo: TDoByNoEvent read fOnCommandArticleNo write fOnCommandArticleNo;
    property OnCommandBodyID: TDoByIDEvent read fOnCommandBodyID write fOnCommandBodyID;
    property OnCommandBodyNo: TDoByNoEvent read fOnCommandBodyNo write fOnCommandBodyNo;
    property OnCommandCheck: TDoByIDEvent read fOnCommandCheck write fOnCommandCheck;
    property OnCommandHeadID: TDoByIDEvent read fOnCommandHeadID write fOnCommandHeadID;
    property OnCommandHeadNo: TDoByNoEvent read fOnCommandHeadNo write fOnCommandHeadNo;
    property OnCommandStatID: TDoByIDEvent read fOnCommandStatID write fOnCommandStatID;
    property OnCommandStatNo: TDoByNoEvent read fOnCommandStatNo write fOnCommandStatNo;
    property OnCommandGroup: TGroupEvent read fOnCommandGroup write fOnCommandGroup;
    property OnCommandList: TNewsEvent read fOnCommandList write fOnCommandList;
    property OnCommandHelp: TGetEvent read fOnCommandHelp write fOnCommandHelp;
    property OnCommandIHave: TDoByIDEvent read fOnCommandIHave write fOnCommandIHave;
    property OnCommandLast: TGetEvent read fOnCommandLast write fOnCommandLast;
    property OnCommandMode: TNewsEvent read fOnCommandMode write fOnCommandMode;
    property OnCommandNewGroups: TNewsEvent read fOnCommandNewGroups write fOnCommandNewGroups;
    property OnCommandNewNews: TNewsEvent read fOnCommandNewNews write fOnCommandNewNews;
    property OnCommandNext: TGetEvent read fOnCommandNext write fOnCommandNext;
    property OnCommandPost: TGetEvent read fOnCommandPost write fOnCommandPost;
    property OnCommandQuit: TGetEvent read fOnCommandQuit write fOnCommandQuit;
    property OnCommandSlave: TGetEvent read fOnCommandSlave write fOnCommandSlave;
    property OnCommandTakeThis : TDoByIDEvent read fOnCommandTakeThis write fOnCommandTakeThis;
    property OnCommandXOver: TNewsEvent read fOnCommandXOver write fOnCommandXOver;
    property OnCommandXHDR: TNewsEvent read fOnCommandXHDR write fOnCommandXHDR;
    property OnCommandDate: TGetEvent read fOnCommandDate write fOnCommandDate;
    property OnCommandListgroup: TNewsEvent read fOnCommandListGroup write fOnCommandListGroup;
    property OnCommandXThread: TNewsEvent read fOnCommandXThread write fOnCommandXThread;
    property OnCommandXGTitle: TNewsEvent read fOnCommandXGTitle write fOnCommandXGTitle;
    property OnCommandXPat: TNewsEvent read fOnCommandXPat write fOnCommandXPat;
    property OnCommandOther: TOtherEvent read fOnCommandOther write fOnCommandOther;
    property DefaultPort default IdPORT_NNTP;
  end;

implementation

uses
  IdTCPConnection,
  IdResourceStrings,
  SysUtils;

constructor TIdNNTPServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DefaultPort := IdPORT_NNTP;
end;

function TIdNNTPServer.DoExecute(AThread: TIdPeerThread): boolean;
var
  i:integer;
  s,sCmd:String;
  WasHandled:Boolean;

  procedure NotHandled(CMD:String);
  begin
    AThread.Connection.Writeln('500 '+Format(RSNNTPServerNotRecognized,[CMD]));
  end;


  function isNumericString(Str: String) : Boolean;
  begin
    if Length(str) = 0 then
      Result := False
    else
      Result := IsNumeric(Str[1]);
  end;

begin
  result := true;

  with AThread.Connection do begin
    while Connected do begin
try
      s:=ReadLn;
except
      exit;
end;
//      Thread.DefaultProcessing:=i<1;
      sCmd := Fetch(s,' ');
      i:=Succ(PosInStrArray(UpperCase(sCmd),KnownCommands));
      Case i of
        1:{article}
          If isNumericString(s) then Begin
            if Assigned(OnCommandArticleNo) then
              OnCommandArticleNo(AThread, StrToCard(S))
            else
              NotHandled(sCmd);
          End
          Else Begin
            if Assigned(OnCommandArticleID) then
              OnCommandArticleID(AThread, S)
            else
              NotHandled(sCmd);
          End;
        2:{body}
          If isNumericString(s) then Begin
            if assigned(OnCommandBodyNo) then
              OnCommandBodyNo(AThread,StrToCard(S))
            Else
              NotHandled(sCmd);
          End
          Else Begin
            if assigned(OnCommandBodyID) then
              OnCommandBodyID(AThread,S)
            Else
              NotHandled(sCmd);
          End;
        3:{head}
          If isNumericString(s) then Begin
            if assigned(OnCommandHeadNo) then
              OnCommandHeadNo(AThread,StrToCard(S))
            Else
              NotHandled(sCmd);
          End
          Else Begin
            if assigned(OnCommandHeadID) then
              OnCommandHeadID(AThread,S)
            Else
              NotHandled(sCmd);
          End;
        4:{stat}
          If isNumericString(s) then Begin
            if assigned(OnCommandStatNo) then
              OnCommandStatNo(AThread,StrToCard(S))
            Else
              NotHandled(sCmd);
          End
          Else Begin
            if assigned(OnCommandStatID) then
              OnCommandStatID(AThread,S)
            Else
              NotHandled(sCmd);
          End;
        5:{group}
          if assigned(OnCommandGroup) then
            OnCommandGroup(AThread,S)
          Else
            NotHandled(sCmd);
        6:{list}
          if assigned(OnCommandList) then
            OnCommandList(AThread,S)
          Else
            NotHandled(sCmd);
        7:{help}
          if assigned(OnCommandHelp) then
            OnCommandHelp(AThread)
          Else
            NotHandled(sCmd);
        8:{ihave}
          if assigned(OnCommandIHave) then
            OnCommandIHave(AThread,S)
          Else
            NotHandled(sCmd);
        9:{last}
          if assigned(OnCommandLast) then
            OnCommandLast(AThread)
          Else
            NotHandled(sCmd);
       10:{newgroups}
          if assigned(OnCommandNewGroups) then
            OnCommandNewGroups(AThread,S)
          Else
            NotHandled(sCmd);
       11:{newsgroups}
          if assigned(OnCommandNewNews) then
            OnCommandNewNews(AThread,S)
          Else
            NotHandled(sCmd);
       12:{next}
          if assigned(OnCommandNext) then
            OnCommandNext(AThread)
          Else
            NotHandled(sCmd);
       13:{post}
          if assigned(OnCommandPost) then
            OnCommandPost(AThread)
          Else
            NotHandled(sCmd);
       14:{quit} begin
          if assigned(OnCommandQuit) then
            OnCommandQuit(AThread)
          else
            AThread.Connection.WriteLn('205 '+RSNNTPServerGoodBye);
          AThread.Connection.Disconnect;
          end;
       15:{slave}
          if assigned(OnCommandSlave) then
            OnCommandSlave(AThread)
          Else
            NotHandled(sCmd);
       16:{authinfo}
          if assigned(OnCommandAuthInfo) then Begin
            sCmd := UpperCase(Fetch(s,' '));
            WasHandled:=False;
            OnCommandAuthInfo(AThread,SCmd,S,WasHandled);
            If Not WasHandled then NotHandled(sCmd);
          End
          Else
            NotHandled(sCmd);
       17:{xover}
          if assigned(OnCommandXOver) then
            OnCommandXOver(AThread,S)
          Else
            NotHandled(sCmd);
       18:{xhdr}
          if assigned(OnCommandXHDR) then
            OnCommandXHDR(AThread,S)
          Else
            NotHandled(sCmd);
       19:{date}
          if assigned(OnCommandDate) then
            OnCommandDate(AThread)
          Else
            NotHandled(sCmd);
       20:{listgroup}
          if assigned(OnCommandListGroup) then
            OnCommandListGroup(AThread,S)
          Else
            NotHandled(sCmd);
       21: {mode}
          if assigned(OnCommandMode) then
             OnCommandMode(AThread,S)
          else
            NotHandled(sCmd);
       22: {takethis}
          if assigned(OnCommandTakeThis) then
            OnCommandTakeThis(AThread,S)
          Else
            NotHandled(sCmd);
       23: {check}
          if assigned(OnCommandCheck) then
            OnCommandCheck(AThread,S)
          Else
            NotHandled(sCmd);
       24: {XThread}
          if assigned(OnCommandXThread) then
            OnCommandXThread(AThread,S)
          Else
            NotHandled(sCmd);
       25: {XGTitle}
          if assigned(OnCommandXGTitle) then
            OnCommandXGTitle(AThread,S)
          Else
            NotHandled(sCmd);
        else begin
          if assigned(OnCommandOther) then Begin
            WasHandled:=False;
            OnCommandOther(AThread,sCmd,S,WasHandled);
            If Not WasHandled then NotHandled(sCmd);
          end
          else
            NotHandled(sCmd);
        end;
      end; {end case}
    end; {while}
  end; {with}
end; {doExecute}

end.