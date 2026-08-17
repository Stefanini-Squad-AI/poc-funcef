unit uCtrlTipoMorador;

interface

Uses DB, uCmControlObject, dbclient, sysutils,
     uDbTipoMorador, uMidasUtil,uCMTypes;

Type
  TCtrlTipoMorador = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
  private
    _dbTipoMorador: TdbTipoMorador;
    FCdsTipoMorador: TClientDataSet;
    procedure SetCdsTipoMorador(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsTipoMorador: TClientDataSet read FCdsTipoMorador write SetCdsTipoMorador;

      function AplicaOperacao : Boolean;
      function Procurar(iTipoMorador : Double) : OleVariant;
      function ListaTipoMorador : OleVariant;


  end;

implementation


procedure TCtrlTipoMorador.DoChangeDataBase;
begin
  inherited;
  _dbTipoMorador.DatabaseName := DataBaseName;
end;

constructor TCtrlTipoMorador.Create;
begin
  inherited;
  _dbTipoMorador := TdbTipoMorador.Create(Self);
end;

destructor TCtrlTipoMorador.Destroy;
begin
  inherited;
  _dbTipoMorador.Free;
  if isAppServer then
     FreeCds([FCdsTipoMorador]);
end;

function TCtrlTipoMorador.AplicaOperacao: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoTipoMorador(CdsTipoMorador.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsTipoMorador,_DbTipoMorador,[],[]);
         If Not Result Then
            Raise Exception.Create( _DbTipoMorador.MessageInfo );
         Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := E.Message;
         End;
      End;
   End;
end;

procedure TCtrlTipoMorador.SetCdsTipoMorador(
  const Value: TClientDataSet);
begin
  FCdsTipoMorador := Value;
end;


function TCtrlTipoMorador.Procurar(iTipoMorador : Double) : OleVariant;
begin
  _DbTipoMorador.Idtipomorador.AsFloat := iTipoMorador;
  Result := GetDataPacket(_DbTipoMorador.SSqlSelect);
end;

procedure TCtrlTipoMorador.OnCreateAppServer;
begin
  inherited;
  FCdsTipoMorador := TClientDataSet.Create(nil);
end;

function TCtrlTipoMorador.ListaTipoMorador : OleVariant;
var sSql : String;
begin
   sSql := 'SELECT * FROM TIPOMORADOR ORDER BY DESCTIPOMORADOR';
   Result := GetDataPacket(sSql);
end;

end.


