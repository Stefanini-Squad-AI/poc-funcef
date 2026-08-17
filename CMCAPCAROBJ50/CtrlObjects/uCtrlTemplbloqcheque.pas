unit uCtrlTemplbloqcheque;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTemplbloqcheque, uSistema, DB, uDataBase,
DbClient, uDbConfigbloquete {$IFDEF VER0505} {$ELSE}, uCMTypes {$ENDIF};

type
  TCtrlTemplbloqcheque = class(TCmControlObject)
  private
    _DbTemplbloqcheque : TDbTemplbloqcheque;
    Fcds   : TClientDataSet;

    _DbConfigbloquete  : TDbConfigbloquete;
    FcdsConfigbloquete : TClientDataSet;
    // Eventos dos ClientDataSet´s
    procedure Setcds(const Value: TClientDataSet);
    procedure SetConfigbloquete(const Value: TClientDataSet);
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer; Override;

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    Property cdsConfigbloquete : TClientDataSet read FcdsConfigbloquete write SetConfigbloquete;
    // Métodos
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //  Informa os Compradore existentes
    Function  ListTemplbloqcheque( CODBLOQCHE : double = 0 ) : OleVariant;
    function GravarTemplbloqcheque  : Boolean;
    function ExcluirTemplbloqcheque  : Boolean;
End;


implementation

{ TCtrlTemplbloqcheque }

constructor TCtrlTemplbloqcheque.Create;
begin
  inherited;
  _DbTemplbloqcheque := TDbTemplbloqcheque.Create(self);
  _DbConfigbloquete  := TDbConfigbloquete.create(self);
end;

destructor TCtrlTemplbloqcheque.Destroy;
begin
  _DbTemplbloqcheque.Free;
  _DbConfigbloquete.Free;
  if isappserver then
  begin
     FCds.free;
     FcdsConfigbloquete.free;
  end;
  inherited;
end;

procedure TCtrlTemplbloqcheque.DoChangeDataBase;
begin
  inherited;
  _DbTemplbloqcheque.DataBaseName := DataBaseName;
  _DbConfigbloquete.DataBaseName  := DataBaseName;
end;

function TCtrlTemplbloqcheque.ListTemplbloqcheque( CODBLOQCHE : double = 0 ) : OleVariant;
var ssql : string;
begin
   ssql := 'select CODBLOQCHE,LAYOUT, FLGIMPCONDENSADO FROM TEMPLBLOQCHEQUE ';
   if CODBLOQCHE <> 0 then
   ssql := SSql + '  where CODBLOQCHE = '+floattostr(CODBLOQCHE);
   Result := GetDataPacket(ssql);
end;

procedure TCtrlTemplbloqcheque.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTemplbloqcheque.GravarTemplbloqcheque: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTemplbloqcheque(cds.Data, cdsConfigbloquete.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        // pai
        Result := ApplyCds(FCds,_DbTemplbloqcheque,[],[]);
        Msg    := _DbTemplbloqcheque.MessageInfo;
        If Not Result Then Raise Exception.create(Msg);

        // filho
        Result := ApplyCds(FcdsConfigbloquete,_DbConfigbloquete,
                     [_DbTemplbloqcheque.Codbloqche],[_DbConfigbloquete.Codbloqche]);
        Msg    := _DbConfigbloquete.MessageInfo;
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

function TCtrlTemplbloqcheque.ExcluirTemplbloqcheque: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTemplbloqcheque(cds.Data, cdsConfigbloquete.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        // filho
        Result := ApplyCds(FcdsConfigbloquete,_DbConfigbloquete,
                     [_DbTemplbloqcheque.Codbloqche],[_DbConfigbloquete.Codbloqche]);
        Msg    := _DbConfigbloquete.MessageInfo;
        If Not Result Then Raise Exception.create(Msg);

        // pai
        Result := ApplyCds(FCds,_DbTemplbloqcheque,[],[]);
        Msg    := _DbTemplbloqcheque.MessageInfo;
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

procedure TCtrlTemplbloqcheque.SetConfigbloquete(
  const Value: TClientDataSet);
begin
  FcdsConfigbloquete := Value;
end;

procedure TCtrlTemplbloqcheque.OnCreateAppServer;
begin
  inherited;
  FCds                := TClientDataSet.Create(nil);
  FcdsConfigbloquete  := TClientDataSet.Create(nil);
end;

end.
