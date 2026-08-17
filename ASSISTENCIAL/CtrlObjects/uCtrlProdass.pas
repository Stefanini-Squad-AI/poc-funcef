unit uCtrlProdass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbProdass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlProdass = Class(TCmControlObject)

    private
    FDbProdass: TDbProdass;
    FCdsProdass: TClientDataSet;
    procedure SetDbProdass(const Value: TDbProdass);
    procedure SetCdsProdass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsProdass: TClientDataSet read FCdsProdass write SetCdsProdass;
      property DbProdass: TDbProdass read FDbProdass write SetDbProdass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;


implementation

{ TCtrlProdass }

function TCtrlProdass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsProdass,DbProdass);
        StartTransaction;
        Result := DbProdass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbProdass.MessageInfo;
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

constructor TCtrlProdass.Create;
begin
  inherited;
  FDbProdass := TDbProdass.Create;
  FCdsProdass := TClientDataSet.Create(nil);
end;

destructor TCtrlProdass.Destroy;
begin
  FDbProdass.Free;
  FCdsProdass.Free;

  inherited;
end;

procedure TCtrlProdass.DoChangeDataBase;
begin
  inherited;
  DbProdass.DataBaseName := DataBaseName;
end;

function TCtrlProdass.Excluir: Boolean;
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
        Result := DbProdass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbProdass.MessageInfo;
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

function TCtrlProdass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsProdass,DbProdass);
        StartTransaction;
        Result := DbProdass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbProdass.MessageInfo;
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

procedure TCtrlProdass.SetCdsProdass(const Value: TClientDataSet);
begin
  FCdsProdass := Value;
end;

procedure TCtrlProdass.SetDbProdass(const Value: TDbProdass);
begin
  FDbProdass := Value;
end;

end.
