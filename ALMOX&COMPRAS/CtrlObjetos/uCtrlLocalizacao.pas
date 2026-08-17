unit uCtrlLocalizacao;

interface
Uses DB, uDataBase,Classes, uCmControlObject, dbclient,uCmDbObject,
     sysUtils, uMidasUtil, uCmTypes, uDbSaldo;

Type
  TCtrlLocalizacao = class(TCmControlObject)

  Protected
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _DbSaldo : TDbSaldo;
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
     Function Gravar  : Boolean;
     Function GetLocalizacao( IdPessoa        : Integer;
                              CodAlmoxarifado : Integer;
                              CodArtigo       : String) : OleVariant;

  End;


implementation

{ TCtrlPremiGestEstoque }

constructor TCtrlLocalizacao.Create;
begin
  inherited;
  _DbSaldo := TDbSaldo.Create(Self);
end;

destructor TCtrlLocalizacao.Destroy;
begin
   If IsAppServer Then
      FreeCds( [ Fcds ] );

  _DbSaldo.Free;

  inherited;

end;

procedure TCtrlLocalizacao.DoChangeDataBase;
begin
  inherited;
  _DbSaldo.DataBaseName := DataBaseName;
end;

function TCtrlLocalizacao.GetLocalizacao(IdPessoa,
  CodAlmoxarifado: Integer; CodArtigo: String): OleVariant;
begin
   CodArtigo := Copy(CodArtigo + '                   ',1,14);

   _DbSaldo.IdPessoa.AsInteger        := IdPessoa;
   _DbSaldo.CodAlmoxarifado.AsInteger := CodAlmoxarifado;
   _DbSaldo.CodArtigo.AsString        := CodArtigo;

   Result := GetDataPacket( _DbSaldo.SSqlSelect );
end;

function TCtrlLocalizacao.Gravar: Boolean;
Var
   Msg : String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.GravarPremiGestEstoque( Fcds.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            Result := ApplyCds( fcds, _DbSaldo, [], [] );
            Msg    := _DbSaldo.MessageInfo;
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

procedure TCtrlLocalizacao.OnCreateAppServer;
begin
  inherited;
  Fcds := TClientDataSet.Create(nil);
end;

procedure TCtrlLocalizacao.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
