unit uCtrlHstContribass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbHstContribass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlHstContribass = Class(TCmControlObject)

    private
    FDbHstContribass: TDbHstContribass;
    FCdsHstContribass: TClientDataSet;
    procedure SetDbHstContribass(const Value: TDbHstContribass);
    procedure SetCdsHstContribass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsHstContribass: TClientDataSet read FCdsHstContribass write SetCdsHstContribass;
      property DbHstContribass: TDbHstContribass read FDbHstContribass write SetDbHstContribass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;

implementation

{ TCtrlHstContribass }

function TCtrlHstContribass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsHstContribass,DbHstContribass);
        StartTransaction;
        Result := DbHstContribass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbHstContribass.MessageInfo;
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

constructor TCtrlHstContribass.Create;
begin
  inherited;
  FDbHstContribass := TDbHstContribass.Create;
  FCdsHstContribass := TClientDataSet.Create(nil);
end;

destructor TCtrlHstContribass.Destroy;
begin
  FDbHstContribass.Free;
  FCdsHstContribass.Free;

  inherited;
end;

procedure TCtrlHstContribass.DoChangeDataBase;
begin
  inherited;
  DbHstContribass.DataBaseName := DataBaseName;
end;

function TCtrlHstContribass.Excluir: Boolean;
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
        Result := DbHstContribass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbHstContribass.MessageInfo;
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

function TCtrlHstContribass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsHstContribass,DbHstContribass);
        StartTransaction;
        Result := DbHstContribass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbHstContribass.MessageInfo;
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

procedure TCtrlHstContribass.SetCdsHstContribass(const Value: TClientDataSet);
begin
  FCdsHstContribass := Value;
end;

procedure TCtrlHstContribass.SetDbHstContribass(const Value: TDbHstContribass);
begin
  FDbHstContribass := Value;
end;

end.
