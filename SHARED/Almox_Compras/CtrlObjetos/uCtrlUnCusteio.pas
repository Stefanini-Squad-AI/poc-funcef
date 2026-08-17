unit uCtrlUnCusteio;

interface

Uses DB, uDataBase,uCmDbObject, uCmControlObject,uDbUnCusteio,
     sysUtils, dbclient,uSistema,uMidasUtil, uCMTypes;

Type
  TCtrlUnCusteio = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbUnCusteio : TDbUnCusteio;

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
    Function  Gravar : Boolean;
    Function  Excluir : Boolean;
    Function  Procurar( CodCusteio : Double ) : OleVariant;
    Function  ListUnCusteio( IdPessoa : Integer ) : OleVariant; 
  End;

implementation

{ TCtrlUnCusteio }

function TCtrlUnCusteio.Gravar: Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarUnCusteio( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds( Fcds,_DbUnCusteio,[],[] );
           Msg    := _DbUnCusteio.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);
           // Atualiza todos os almoxarifados pretencentes a Unidade de Custeio

           If Not ExecSQL(' UPDATE ALMOX SET CONTABIL = '+QuotedStr(cds.FieldByName('UCCONTABIL').asString)
                          +' WHERE (CODCUSTEIO = '+_DbUnCusteio.CodCusteio.asString +')')
           Then
              Raise Exception.Create( MessageInfo );

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

constructor TCtrlUnCusteio.Create;
begin
  inherited;
  _DbUnCusteio := TDbUnCusteio.Create(Self);
end;

destructor TCtrlUnCusteio.Destroy;
begin
  If IsAppServer Then
     FreeCds([FCds]);

  _DbUnCusteio.Free;
  inherited;
end;

procedure TCtrlUnCusteio.DoChangeDataBase;
begin
  inherited;
  _DbUnCusteio.DataBaseName := DataBaseName;
end;

function TCtrlUnCusteio.Excluir : Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirUnCusteio( Fcds.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds( Fcds,_DbUnCusteio,[],[] );
           Msg    := _DbUnCusteio.MessageInfo;
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

Function TCtrlUnCusteio.Procurar(CodCusteio: Double) : OleVariant;
begin
   _DbUnCusteio.CodCusteio.AsFloat := CodCusteio;

   Result := GetDataPacket(_DbUnCusteio.SSqlSelect);
end;

procedure TCtrlUnCusteio.Setcds(const Value: TClientDataSet);
begin
   Fcds := Value;
end;

procedure TCtrlUnCusteio.OnCreateAppServer;
begin
   inherited;
   FCds := TClientDataSet.Create(nil);
end;

function TCtrlUnCusteio.ListUnCusteio( IdPessoa : Integer ): OleVariant;
Var
   SQL : String;
begin
   SQL := ' SELECT CODCUSTEIO,DESCCUSTEIO,UCCONTABIL,IDPESSOA '+
          ' FROM UNCUSTEI WHERE (IDPESSOA = '+IntToStr(IdPessoa)+')';

   Result := GetDataPacket( SQL );
end;

end.
