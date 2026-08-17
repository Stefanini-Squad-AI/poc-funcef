Unit uCtrlLancamentoOrc;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, uMidasUtil, sysutils,wwQuery, provider,
  uDbLancamentoorc, uCMTypes;

Type
  TCtrlLancamentoorc = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;Override;
  private
    _dbLancamentoorc: TdbLancamentoorc;
    FCdsLancamentoorc: TClientDataSet;
    procedure SetCdsLancamentoorc(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsLancamentoorc: TClientDataSet read FCdsLancamentoorc write SetCdsLancamentoorc;

      function AplicaOperacaoLancamentoOrc : Boolean;
      function Procurar(idlancamentoorc:Double): OleVariant;

  end;

implementation


procedure TCtrlLancamentoorc.DoChangeDataBase;
begin
  inherited;
  _dbLancamentoorc.DatabaseName := DataBaseName;
end;

procedure TCtrlLancamentoorc.OnCreateAppServer;
begin
  inherited;
  FCdsLancamentoorc := TClientDataSet.Create(nil);
end;

constructor TCtrlLancamentoorc.Create;
begin
  inherited;
  _dbLancamentoorc := TdbLancamentoorc.Create(Self);
end;

destructor TCtrlLancamentoorc.Destroy;
begin
  inherited;
  _dbLancamentoorc.Free;
  if isAppServer then begin
    FreeCds([FCdsLancamentoorc]);
  end;
end;

function TCtrlLancamentoOrc.AplicaOperacaoLancamentoOrc: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoLancamentoOrc(FCdsLancamentoorc.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsLancamentoorc,_DbLancamentoorc,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbLancamentoorc.MessageInfo;
            Abort;
         End Else
            Commit;
      Except
         On E:Exception Do Begin
            Result := False;
            Rollback;
            MessageInfo := MessageInfo + E.Message;
         End;
      End;
   End;
end;


function TCtrlLancamentoorc.Procurar(idlancamentoorc:Double): OleVariant;
begin
   _DbLancamentoorc.Idlancamentoorc.AsFloat := idlancamentoorc;
   Result := GetDataPacket(_DbLancamentoorc.SSqlSelect);
end;

procedure TCtrlLancamentoorc.SetCdsLancamentoorc(
  const Value: TClientDataSet);
begin
  FCdsLancamentoorc := Value;
end;


end.


