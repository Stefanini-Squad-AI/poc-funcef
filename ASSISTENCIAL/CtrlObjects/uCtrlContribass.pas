unit uCtrlContribass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbContribass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlContribass = Class(TCmControlObject)

    private
    FDbContribass: TDbContribass;
    FCdsContribass: TClientDataSet;
    procedure SetDbContribass(const Value: TDbContribass);
    procedure SetCdsContribass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsContribass: TClientDataSet read FCdsContribass write SetCdsContribass;
      property DbContribass: TDbContribass read FDbContribass write SetDbContribass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;

implementation

{ TCtrlContribass }

function TCtrlContribass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsContribass,DbContribass);
        StartTransaction;
        Result := DbContribass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbContribass.MessageInfo;
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

constructor TCtrlContribass.Create;
begin
  inherited;
  FDbContribass := TDbContribass.Create;
  FCdsContribass := TClientDataSet.Create(nil);
end;

destructor TCtrlContribass.Destroy;
begin
  FDbContribass.Free;
  FCdsContribass.Free;

  inherited;
end;

procedure TCtrlContribass.DoChangeDataBase;
begin
  inherited;
  DbContribass.DataBaseName := DataBaseName;
end;

function TCtrlContribass.Excluir: Boolean;
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
        Result := DbContribass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbContribass.MessageInfo;
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

function TCtrlContribass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsContribass,DbContribass);
        StartTransaction;
        Result := DbContribass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbContribass.MessageInfo;
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

procedure TCtrlContribass.SetCdsContribass(const Value: TClientDataSet);
begin
  FCdsContribass := Value;
end;

procedure TCtrlContribass.SetDbContribass(const Value: TDbContribass);
begin
  FDbContribass := Value;
end;

end.
