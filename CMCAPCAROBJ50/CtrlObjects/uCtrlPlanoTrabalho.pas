unit uCtrlPlanoTrabalho;

interface

Uses
  DB, uDataBase, uCmControlObject, dbclient, sysutils,wwQuery, provider,
  uDbPlanoTrabalhoOrc, uCMTypes;

Type
  TCtrlPlanoTrabalho = class(TCmControlObject)

  Protected
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    _dbPlanoTrabalhoOrc: TdbPlanoTrabalhoOrc;
    FCdsPlanoTrabalho: TClientDataSet;
    procedure SetCdsPlanoTrabalho(const Value: TClientDataSet);
  public
      Constructor Create; Override;
      Destructor  Destroy;Override;

      property CdsPlanoTrabalho: TClientDataSet read FCdsPlanoTrabalho write SetCdsPlanoTrabalho;

      function AplicaOperacaoPlanoTrabalho : Boolean;
      function Procurar(idPlanoTrabalho:Double): OleVariant;

  end;

implementation
//************************************************
Procedure TCtrlPlanoTrabalho.OnCreateAppServer;
Begin
  Inherited;

  FCdsPlanoTrabalho := TClientDataSet.Create(nil);
End;
//************************************************
procedure TCtrlPlanoTrabalho.DoChangeDataBase;
begin
  inherited;
  _dbPlanoTrabalhoOrc.DatabaseName := DataBaseName;
end;

constructor TCtrlPlanoTrabalho.Create;
begin
  inherited;

  _dbPlanoTrabalhoOrc := TdbPlanoTrabalhoOrc.Create( Self );
end;

destructor TCtrlPlanoTrabalho.Destroy;
begin
  inherited;
  _dbPlanoTrabalhoOrc.Free;

  If ( isAppServer ) Then Begin

    FCdsPlanoTrabalho.Free;
  End;
end;

function TCtrlPlanoTrabalho.AplicaOperacaoPlanoTrabalho: Boolean;
begin
   If ConnectionSide = cnsClient then begin
      Result := Connection.AppServer.AplicaOperacaoPlanoTrabalho(FCdsPlanoTrabalho.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End Else Begin
      MessageInfo := '';
      Try
         StartTransaction;
         Result := ApplyCDS(FCdsPlanoTrabalho,_DbPlanoTrabalhoOrc,[],[]);
         If Not Result Then Begin
            MessageInfo := _DbPlanoTrabalhoOrc.MessageInfo;
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


function TCtrlPlanoTrabalho.Procurar(idPlanoTrabalho:Double): OleVariant;
begin
   _DbPlanoTrabalhoOrc.Idplanotrabalho.AsFloat := idPlanoTrabalho;
   Result := GetDataPacket(_DbPlanoTrabalhoOrc.SSqlSelect);
end;

procedure TCtrlPlanoTrabalho.SetCdsPlanoTrabalho(
  const Value: TClientDataSet);
begin
  FCdsPlanoTrabalho := Value;
end;


end.


