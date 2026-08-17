unit uCtrlNucleoFamass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbNucleoFamass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlNucleoFamass = Class(TCmControlObject)

    private
    FDbNucleoFamass: TDbNucleoFamass;
    FCdsNucleoFamass: TClientDataSet;
    procedure SetDbNucleoFamass(const Value: TDbNucleoFamass);
    procedure SetCdsNucleoFamass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsNucleoFamass: TClientDataSet read FCdsNucleoFamass write SetCdsNucleoFamass;
      property DbNucleoFamass: TDbNucleoFamass read FDbNucleoFamass write SetDbNucleoFamass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;

implementation

{ TCtrlNucleoFamass }

function TCtrlNucleoFamass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsNucleoFamass,DbNucleoFamass);
        StartTransaction;
        Result := DbNucleoFamass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbNucleoFamass.MessageInfo;
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

constructor TCtrlNucleoFamass.Create;
begin
  inherited;
  FDbNucleoFamass := TDbNucleoFamass.Create;
  FCdsNucleoFamass := TClientDataSet.Create(nil);
end;

destructor TCtrlNucleoFamass.Destroy;
begin
  FDbNucleoFamass.Free;
  FCdsNucleoFamass.Free;

  inherited;
end;

procedure TCtrlNucleoFamass.DoChangeDataBase;
begin
  inherited;
  DbNucleoFamass.DataBaseName := DataBaseName;
end;

function TCtrlNucleoFamass.Excluir: Boolean;
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
        Result := DbNucleoFamass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbNucleoFamass.MessageInfo;
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

function TCtrlNucleoFamass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsNucleoFamass,DbNucleoFamass);
        StartTransaction;
        Result := DbNucleoFamass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbNucleoFamass.MessageInfo;
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

procedure TCtrlNucleoFamass.SetCdsNucleoFamass(const Value: TClientDataSet);
begin
  FCdsNucleoFamass := Value;
end;

procedure TCtrlNucleoFamass.SetDbNucleoFamass(const Value: TDbNucleoFamass);
begin
  FDbNucleoFamass := Value;
end;

end.
