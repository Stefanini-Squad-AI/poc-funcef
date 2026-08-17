Unit uCtrlLinhasRelatOrc;

Interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils, wwQuery, provider,
  uDbLinhasRelatOrc, uCMTypes;

Type

  TCtrlLinhasRelatOrc = class(TCmControlObject)

  Protected

      Procedure DoChangeDataBase; Override;
      Procedure OnCreateAppServer; Override;
  Private

    _dbLinhasRelatOrc  : TDbLinhasRelatOrc;
    FCdsLinhasRelatOrc : TClientDataSet;

    procedure SetCdsLinhasRelatOrc(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsLinhasRelatOrc : TClientDataSet read FCdsLinhasRelatOrc write SetCdsLinhasRelatOrc;

      function AplicaOperacaoLinhasRelatOrc : Boolean;
      function Procurar( idRelatOrc : Double )       : OleVariant; OverLoad;
      function Procurar( idRelatOrc,
                         idLinhasRelatOrc : Double ) : OleVariant; OverLoad;

  end;

Implementation
//************************************************
Procedure TCtrlLinhasRelatOrc.OnCreateAppServer;
Begin
  Inherited;

  FCdsLinhasRelatOrc := TClientDataSet.Create(nil);
End;
//************************************************
Procedure TCtrlLinhasRelatOrc.DoChangeDataBase;
Begin
  Inherited;

  _dbLinhasRelatOrc.DatabaseName := DataBaseName;
End;
//************************************************
Constructor TCtrlLinhasRelatOrc.Create;
Begin
  Inherited;

  _dbLinhasRelatOrc  := TDbLinhasRelatOrc.Create( Self );
End;
//************************************************
Destructor TCtrlLinhasRelatOrc.Destroy;
Begin
  Inherited;
  _dbLinhasRelatOrc.Free;
  FCdsLinhasRelatOrc.Free;
End;
//************************************************
Function TCtrlLinhasRelatOrc.AplicaOperacaoLinhasRelatOrc: Boolean;
Begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoLinhasRelatOrc( FCdsLinhasRelatOrc.Data );
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS( FCdsLinhasRelatOrc, _DbLinhasRelatOrc, [], []);
         If Not Result Then Begin
            MessageInfo := _DbLinhasRelatOrc.MessageInfo;
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
End;
//************************************************
Function TCtrlLinhasRelatOrc.Procurar( idRelatOrc : Double ) : OleVariant;
Begin
   _DbLinhasRelatOrc.idRelatOrc.AsFloat       := idRelatOrc;

   Result := GetDataPacket( _DbLinhasRelatOrc.SSqlSelect );
End;

//************************************************
Function TCtrlLinhasRelatOrc.Procurar( idRelatOrc,
                                       idLinhasRelatOrc : Double ) : OleVariant;
Begin
   _DbLinhasRelatOrc.idRelatOrc.AsFloat       := idRelatOrc;
   _DbLinhasRelatOrc.idLinhasRelatOrc.AsFloat := idLinhasRelatOrc;

   Result := GetDataPacket( _DbLinhasRelatOrc.SSqlSelect );
End;
//************************************************
Procedure TCtrlLinhasRelatOrc.SetCdsLinhasRelatOrc(
  const Value: TClientDataSet);
Begin

  FCdsLinhasRelatOrc := Value;
End;
//************************************************
End.
