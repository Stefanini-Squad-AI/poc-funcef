unit uCtrlSitPlanoAss;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbSitPlanoAss, uSistema, DB, uDataBase, DbClient;
       
  Type
    TCtrlSitPlanoAss = Class(TCmControlObject)

    private
    FDbSitPlanoAss: TDbSitPlanoAss;
    FCdsSitPlanoAss: TClientDataSet;
    procedure SetDbSitPlanoAss(const Value: TDbSitPlanoAss);
    procedure SetCdsSitPlanoAss(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsSitPlanoAss: TClientDataSet read FCdsSitPlanoAss write SetCdsSitPlanoAss;
      property DbSitPlanoAss: TDbSitPlanoAss read FDbSitPlanoAss write SetDbSitPlanoAss;

      function Inserir: Boolean;
      function Alterar: Boolean;
      function Excluir: Boolean;
    protected

    End;

implementation

{ TCtrlSitPlanoAss }

function TCtrlSitPlanoAss.Alterar: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Alterar;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsSitPlanoAss,DbSitPlanoAss);
        StartTransaction;
        Result := DbSitPlanoAss.Update;

        If Not Result Then
        Begin
          MessageInfo := DbSitPlanoAss.MessageInfo;
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

constructor TCtrlSitPlanoAss.Create;
begin
  inherited;
  FDbSitPlanoAss := TDbSitPlanoAss.Create;
  FCdsSitPlanoAss := TClientDataSet.Create(nil);
end;

destructor TCtrlSitPlanoAss.Destroy;
begin
  FDbSitPlanoAss.Free;
  FCdsSitPlanoAss.Free;

  inherited;
end;

procedure TCtrlSitPlanoAss.DoChangeDataBase;
begin
  inherited;
  DbSitPlanoAss.DataBaseName := DataBaseName;
end;

function TCtrlSitPlanoAss.Excluir: Boolean;
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
        Result := DbSitPlanoAss.Delete;

        If Not Result Then
        Begin
          MessageInfo := DbSitPlanoAss.MessageInfo;
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

function TCtrlSitPlanoAss.Inserir: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.Inserir;
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsSitPlanoAss,DbSitPlanoAss);
        StartTransaction;
        Result := DbSitPlanoAss.Insert;

        If Not Result Then
        Begin
          MessageInfo := DbSitPlanoAss.MessageInfo;
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

procedure TCtrlSitPlanoAss.SetCdsSitPlanoAss(const Value: TClientDataSet);
begin
  FCdsSitPlanoAss := Value;
end;

procedure TCtrlSitPlanoAss.SetDbSitPlanoAss(const Value: TDbSitPlanoAss);
begin
  FDbSitPlanoAss := Value;
end;

end.
