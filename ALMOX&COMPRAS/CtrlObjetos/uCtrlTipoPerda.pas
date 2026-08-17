unit uCtrlTipoPerda;

interface
Uses DB, uDataBase,Classes, uCmControlObject, dbclient,uCmDbObject,
     sysUtils, uMidasUtil, uCmTypes, uDbTipoPerda, DAlmoxarifado;
Type

  TCtrlTipoPerda = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _DbTipoPerda : TDbTipoPerda;
    _DtmAlmox    : TDtmAlmoxarifado;

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
     Function GetTipoPerda(IdTipoPerda : Double) : OleVariant;
     Function ListTipoPerda : OleVariant;
  End;


implementation

{ TCtrlTipoPerda }

constructor TCtrlTipoPerda.Create;
begin
  inherited;
   _DbTipoPerda := TDbTipoPerda.Create(Self);
   _DtmAlmox    := TDtmAlmoxarifado.Create(nil);
end;

destructor TCtrlTipoPerda.Destroy;
begin
   If IsAppServer Then
      FreeCds( [ Fcds ] );

   _DbTipoPerda.Free;
   _DtmAlmox.Free;

   inherited;

end;

procedure TCtrlTipoPerda.DoChangeDataBase;
begin
  inherited;
  _DbTipoPerda.DataBaseName := DataBaseName;
end;

function TCtrlTipoPerda.AplicaOperacao: Boolean;
Var
   Msg : String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AplicaOperacaoTipoPerda(Fcds.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            Result := ApplyCds( fcds, _DbTipoPerda, [], [] );
            Msg    := _DbTipoPerda.MessageInfo;
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

function TCtrlTipoPerda.GetTipoPerda( IdTipoPerda: Double): OleVariant;
begin
   _DbTipoPerda.IdTipoPerda.AsFloat := IdTipoPerda;

   Result := GetDataPacket(_DbTipoPerda.SSqlSelect);
end;

function TCtrlTipoPerda.ListTipoPerda: OleVariant;
begin
   With _DtmAlmox Do
      Begin
         splistTipoPerda.Prepare;

         Result := splistTipoPerda.Data;
      End;
end;

procedure TCtrlTipoPerda.OnCreateAppServer;
begin
  inherited;
  Fcds := TClientDataSet.Create(nil);
end;

procedure TCtrlTipoPerda.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

end.
