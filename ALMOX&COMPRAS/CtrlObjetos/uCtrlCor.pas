unit uCtrlCor;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbCor,
     sysUtils, dbclient, uSistema,uMidasUtil, uCMTypes;

Type
  TCtrlCor   = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;     
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbCor : TDbCor;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos de Presistencia
    //-------------------------------------------------------------------------
    Function AplicaOperacao : Boolean;
    Function Procurar( CodCor: String ) : OleVariant;
    Function ListCor : OleVariant;

  End;

Implementation

{ TCtrlCor }

function TCtrlCor.AplicaOperacao : Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AplicaOperacaoCor( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds( Fcds,_DbCor,[],[] );
           Msg    := _DbCor.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
           Begin
              Rollback;
              Result := False;
              MessageInfo := E.Message;
           End;
        End;
     End;
end;

constructor TCtrlCor.Create;
begin
  inherited;
  _DbCor := TDbCor.Create(Self);

end;

destructor TCtrlCor.Destroy;
begin
  If IsAppServer Then
    FreeCds([Fcds]);

  _DbCor.Free;

  inherited;
end;

procedure TCtrlCor.DoChangeDataBase;
begin
  inherited;
  _DbCor.DataBaseName := DataBaseName;
end;


Function TCtrlCor.Procurar(CodCor: String) : OleVariant;
Begin
    _dbCor.CodCor.AsString := CodCor;
    Result := GetDataPacket(_DbCor.SSqlSelect);
end;

procedure TCtrlCor.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlCor.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(Nil);
end;

function TCtrlCor.ListCor: OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT CODCOR,DESCCOR FROM COR ORDER BY 2';
   Result := GetDataPacket(SQL); 
end;

end.
