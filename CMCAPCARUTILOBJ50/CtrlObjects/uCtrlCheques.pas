unit uCtrlCheques;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbcheques, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505} {$ELSE}, uCMTypes{$ENDIF};

type

  TCtrlcheques = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer;override;
  private
    _Dbcheques : TDbcheques;
    Fcds      : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function Listcheques( IDCheques : double = 0 ): OleVariant;
    Function ListChequesPortadorConta( IDPESSOA, IDCHEQUES, CODPORTADOR,
                           NUNTALAO, NUMCHEQUEINICIAL, NUMCHEQUEFINAL : double ) : OleVariant;
    function Gravarcheques     : Boolean;
End;


implementation

{ TCtrlcheques }

constructor TCtrlcheques.Create;
begin
  inherited;
  _Dbcheques := TDbcheques.Create(self);
end;

destructor TCtrlcheques.Destroy;
begin
  _Dbcheques.Free;
  if isAppServer then
  begin
     FCds.Free;
  end;

  inherited;
end;

procedure TCtrlcheques.DoChangeDataBase;
begin
  inherited;
  _Dbcheques.DataBaseName := DataBaseName;
end;

function TCtrlcheques.Listcheques( IDCheques : double = 0) : OleVariant;
var ssql : string;
begin
   ssql := ' SELECT IDCHEQUES, CODPORTADOR, NUMTALAO, NUMCHEQUEINICIAL, ' +
           '    NUMCHEQUEFINAL , NUMPROXIMOCHEQUE ' +
           ' FROM CHEQUES ' +
           ' WHERE (1=1)   ' ;
   if IDCHEQUES <> 0  then
      ssql := ssql + ' and  IDCHEQUES = '+ floattostr(IDCHEQUES);
   Result := GetDataPacket(ssql);
end;

procedure TCtrlcheques.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlcheques.Gravarcheques: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Gravarcheques(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_Dbcheques,[],[]);
        Msg    := _Dbcheques.MessageInfo;
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

procedure TCtrlcheques.OnCreateAppServer;
begin
  inherited;
  FCds                := TClientDataSet.Create(nil);
end;

function TCtrlcheques.ListChequesPortadorConta ( IDPESSOA, IDCHEQUES, CODPORTADOR,
                                                 NUNTALAO, NUMCHEQUEINICIAL, NUMCHEQUEFINAL : double ): OleVariant;
var ssql : string;
begin
   ssql := ' SELECT C.NUMTALAO, C.NUMCHEQUEINICIAL, C.NUMCHEQUEFINAL '+
           ' FROM CHEQUES C,  PORTADORCONTA PB '+
           ' WHERE '+
           '   (PB.IDPESSOA   = '+floattostr(IDPESSOA)+')    AND '+
           '   (C.IDCHEQUES  <> '+floattostr(IDCHEQUES)+')   AND '+
           '   (C.CODPORTADOR = '+floattostr(CODPORTADOR)+') AND '+
           '   ((C.NUMTALAO   = '+floattostr(NUNTALAO)+')    OR  '+
           '    ((C.NUMCHEQUEINICIAL <= '+floattostr(NUMCHEQUEINICIAL)+
           '      ) AND (C.NUMCHEQUEFINAL >= '+floattostr(NUMCHEQUEINICIAL)+')) OR  '+
           '    ((C.NUMCHEQUEINICIAL <= '+floattostr(NUMCHEQUEFINAL)+
           '      )   AND (C.NUMCHEQUEFINAL >= '+floattostr(NUMCHEQUEFINAL)+'))) AND '+
           '   (C.CODPORTADOR = PB.CODPORTADOR) ';
   Result := GetDataPacket(ssql);
end;

end.
