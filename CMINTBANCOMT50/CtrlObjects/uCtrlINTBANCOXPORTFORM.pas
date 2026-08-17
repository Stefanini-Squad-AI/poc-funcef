unit uCtrlINTBANCOXPORTFORM;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbINTBANCOXPORTFORM, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505} {$ELSE} , uCMTypes{$ENDIF};

type
  TCtrlINTBANCOXPORTFORM = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _DbINTBANCOXPORTFORM : TDbINTBANCOXPORTFORM;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function ListINTBANCOXPORTFORM( CODPORTFORMA : double = 0) : OleVariant;
    function GravarINTBANCOXPORTFORM : Boolean;
End;


implementation

{ TCtrlINTBANCOXPORTFORM }

function TCtrlINTBANCOXPORTFORM.GravarINTBANCOXPORTFORM: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarINTBANCOXPORTFORM(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbINTBANCOXPORTFORM,[],[]);
        Msg    := _DbINTBANCOXPORTFORM.MessageInfo;

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

constructor TCtrlINTBANCOXPORTFORM.Create;
begin
  inherited;
  _DbINTBANCOXPORTFORM := TDbINTBANCOXPORTFORM.Create(self);
end;

destructor TCtrlINTBANCOXPORTFORM.Destroy;
begin
  _DbINTBANCOXPORTFORM.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlINTBANCOXPORTFORM.DoChangeDataBase;
begin
  inherited;
  _DbINTBANCOXPORTFORM.DataBaseName := DataBaseName;
end;

procedure TCtrlINTBANCOXPORTFORM.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlINTBANCOXPORTFORM.ListINTBANCOXPORTFORM( CODPORTFORMA : double = 0) : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT         '+
           '   VALPARAMINTBANCO,' +
           '   IDPARAMINTBANCO,'   +
           '   CODPORTFORMA  ' +
           'FROM '+
           '  INTBANCOXPORTFORM ';
   if CODPORTFORMA <> 0  then
      ssql := ssql + ' WHERE CODPORTFORMA = ' + floattostr(CODPORTFORMA);
   Result := GetDataPacket(ssql);
end;

procedure TCtrlINTBANCOXPORTFORM.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

end.
