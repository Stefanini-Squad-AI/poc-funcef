unit uCtrlTipordcorresp;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipordcorresp, uSistema, DB, uDataBase,
DbClient, uCMTypes ;

type
  TCtrlTipordcorresp = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer; Override;
  private
    _DbTipordcorresp : TDbTipordcorresp;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function  ListTipordcorresp ( IDTIPORDCORRESP : double = 0;
                                  CODTIPRECDES    : string = '';
                                  RECPAG          : string = '';
                                  IDPESSOA        : double  = 0 ) : OleVariant;
    function GravarTipordcorresp: Boolean;
End;


implementation

{ TCtrlTipordcorresp }

function TCtrlTipordcorresp.GravarTipordcorresp: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipordcorresp(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTipordcorresp,[],[]);
        Msg    := _DbTipordcorresp.MessageInfo;

        If Not Result Then Raise Exception.create(Msg);
          Commit;
     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

constructor TCtrlTipordcorresp.Create;
begin
  inherited;
  _DbTipordcorresp := TDbTipordcorresp.Create(self);
end;

destructor TCtrlTipordcorresp.Destroy;
begin
  _DbTipordcorresp.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlTipordcorresp.DoChangeDataBase;
begin
  inherited;
  _DbTipordcorresp.DataBaseName := DataBaseName;
end;

procedure TCtrlTipordcorresp.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTipordcorresp.ListTipordcorresp ( IDTIPORDCORRESP : double = 0;
                                  CODTIPRECDES    : string = '';
                                  RECPAG          : string = '';
                                  IDPESSOA        : double  = 0 ) : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT  ' +
           '    IDTIPORDCORRESP, CODTIPRECDES, RECPAG, IDPESSOA, CODCORRESP ' +
           'FROM  ' +
           '    TIPORDCORRESP where (1=1)';
   if IDTIPORDCORRESP <> 0 then
      ssql := ssql + ' and IDTIPORDCORRESP = ' +floattostr(IDTIPORDCORRESP );
   if CODTIPRECDES <>  '' then
      ssql := ssql + ' and CODTIPRECDES = '''+CODTIPRECDES+'''';
   if RECPAG <> '' then
      ssql := ssql + ' and RECPAG  = '''+RECPAG+'''';
   if IDPESSOA <>  0 then
      ssql := ssql + ' and IDPESSOA = ' +floattostr(IDPESSOA);
   Result := GetDataPacket(ssql);
end;

procedure TCtrlTipordcorresp.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
