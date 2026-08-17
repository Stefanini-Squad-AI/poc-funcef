unit uCtrlBenefass;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbBenefass, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlBenefass = Class(TCmControlObject)

    private
    FDbBenefass: TDbBenefass;
    FCdsBenefass: TClientDataSet;
    procedure SetDbBenefass(const Value: TDbBenefass);
    procedure SetCdsBenefass(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsBenefass: TClientDataSet read FCdsBenefass write SetCdsBenefass;
      property DbBenefass: TDbBenefass read FDbBenefass write SetDbBenefass;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;

implementation

{ TCtrlBenefass }

function TCtrlBenefass.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsBenefass,DbBenefass);
        StartTransaction;
        Result := DbBenefass.Update;

        If Not Result Then
        Begin
          MessageInfo := DbBenefass.MessageInfo;
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

constructor TCtrlBenefass.Create;
begin
  inherited;
  FDbBenefass := TDbBenefass.Create;
  FCdsBenefass := TClientDataSet.Create(nil);
end;

destructor TCtrlBenefass.Destroy;
begin
  FDbBenefass.Free;
  FCdsBenefass.Free;

  inherited;
end;

procedure TCtrlBenefass.DoChangeDataBase;
begin
  inherited;
  DbBenefass.DataBaseName := DataBaseName;
end;

function TCtrlBenefass.Excluir: Boolean;
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
        Result := DbBenefass.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbBenefass.MessageInfo;
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

function TCtrlBenefass.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsBenefass,DbBenefass);
        StartTransaction;
        Result := DbBenefass.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbBenefass.MessageInfo;
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

procedure TCtrlBenefass.SetCdsBenefass(const Value: TClientDataSet);
begin
  FCdsBenefass := Value;
end;

procedure TCtrlBenefass.SetDbBenefass(const Value: TDbBenefass);
begin
  FDbBenefass := Value;
end;

end.
