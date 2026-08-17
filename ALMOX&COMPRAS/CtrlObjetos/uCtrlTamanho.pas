unit uCtrlTamanho;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbTamanho,
     sysUtils, dbclient,uMidasUtil, uSistema, uCMTypes;

Type
  TCtrlTamanho = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
     _DbTamanho : TDbTamanho;

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
    Function AplicaOperacao  : Boolean;
    Function Procurar( CodTamanho: String ) : OleVariant;
    Function ListTamanho : OleVariant;
  End;


implementation

  { TCtrlTamanho }

function TCtrlTamanho.AplicaOperacao: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.AplicaOperacaoTamanho( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds( Fcds,_DbTamanho,[],[]);
           Msg    := _DbTamanho.MessageInfo;
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

constructor TCtrlTamanho.Create;
begin
  inherited;
  _DbTamanho := TDbTamanho.Create(Self);
end;

destructor TCtrlTamanho.Destroy;
begin
  If IsAppServer Then
     FreeCds([Fcds]);

  _DbTamanho.Free;

 inherited;
end;

procedure TCtrlTamanho.DoChangeDataBase;
begin
  inherited;
  _DbTamanho.DataBaseName := DataBaseName;
end;

Function TCtrlTamanho.Procurar(CodTamanho: String) : OleVariant;
begin
   _dbTamanho.CodTamanho.AsString := CodTamanho;
   Result := GetDataPacket(_dbTamanho.SSqlSelect);
end;

procedure TCtrlTamanho.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlTamanho.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

function TCtrlTamanho.ListTamanho: OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT CODTAMANHO,DESCTAMANHO FROM TAMANHO ORDER BY 2';
   Result := GetDataPacket(SQL); 

end;

end.
