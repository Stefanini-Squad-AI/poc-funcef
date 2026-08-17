unit uCtrlTermoInventario;

interface

Uses DB, uDataBase,Classes, uCmControlObject, dbclient,uCmDbObject,
     sysUtils, uMidasUtil, uCmTypes, uDbTermoInventario;
Type

  TCtrlTermoInventario = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _DbTermoInventario : TDbTermoInventario;
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
     Function GetTermoInventario(IdPessoa : Integer;
                                 Tipo     : String ) : OleVariant;

  End;

implementation

{ TCtrlArtigo }

constructor TCtrlTermoInventario.Create;
begin
  inherited;
  _DbTermoInventario := TDbTermoInventario.Create(Self);
end;

destructor TCtrlTermoInventario.Destroy;
begin
 If IsAppServer Then
    FreeCds( [ Fcds ] );

 _DbTermoInventario.Free;

  inherited;

end;

procedure TCtrlTermoInventario.DoChangeDataBase;
begin
  inherited;
  _DbTermoInventario.DataBaseName := DataBaseName;
end;

function TCtrlTermoInventario.AplicaOperacao: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then
     Begin
        Result := Connection.AppServer.AplicaOperacaoTermoInventario( Fcds.Data );
        If Not Result Then
           MessageInfo := Connection.AppServer.MessageInfo;
     End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds( fcds, _DbTermoInventario, [], [] );
           Msg    := _DbTermoInventario.MessageInfo;
           If Not Result Then Raise Exception.Create( Msg );

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

function TCtrlTermoInventario.GetTermoInventario(IdPessoa: Integer;
  Tipo: String): OleVariant;
begin
    _DbTermoInventario.IdPessoa.AsFloat      := IdPessoa;
    _DbTermoInventario.FlgAbreFecha.AsString := Trim(Tipo);

    Result :=  GetDataPacket( _DbTermoInventario.SSqlSelect );
end;

procedure TCtrlTermoInventario.OnCreateAppServer;
begin
  inherited;
  Fcds := TClientDataSet.Create(nil);

end;

procedure TCtrlTermoInventario.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
