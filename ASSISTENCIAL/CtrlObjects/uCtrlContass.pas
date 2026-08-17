unit uCtrlContass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbContass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlContass = Class(TCmControlObject)

    private
    FDbContass: TDbContass;
    FCdsContass: TClientDataSet;
    procedure SetDbContass(const Value: TDbContass);
    procedure SetCdsContass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsContass: TClientDataSet read FCdsContass write SetCdsContass;
      property DbContass: TDbContass read FDbContass write SetDbContass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;

implementation

{ TCtrlContass }

function TCtrlContass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsContass,DbContass);
        StartTransaction;
        Result := DbContass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbContass.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

constructor TCtrlContass.Create;
begin
  inherited;
  FDbContass := TDbContass.Create;
  FCdsContass := TClientDataSet.Create(nil);
end;

destructor TCtrlContass.Destroy;
begin
  FDbContass.Free;
  FCdsContass.Free;

  inherited;
end;

procedure TCtrlContass.DoChangeDataBase;
begin
  inherited;
  DbContass.DataBaseName := DataBaseName;
end;

function TCtrlContass.Excluir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Excluir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := DbContass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbContass.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

function TCtrlContass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsContass,DbContass);
        StartTransaction;
        Result := DbContass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbContass.MessageInfo;
          Rollback;
        End
        Else
          Commit;

     Except
       On E:Exception Do
       Begin
          Result := False;
          Rollback;
          MessageInfo := E.Message;
       End;
     End;
   End;
end;

procedure TCtrlContass.SetCdsContass(const Value: TClientDataSet);
begin
  FCdsContass := Value;
end;

procedure TCtrlContass.SetDbContass(const Value: TDbContass);
begin
  FDbContass := Value;
end;

end.
