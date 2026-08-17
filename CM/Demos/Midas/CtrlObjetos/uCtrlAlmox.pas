unit uCtrlAlmox;

interface

Uses DB, uDataBase, udbAlmox, uCmControlObject, dbclient, sysutils,uSistema;

Type
  TCtrlAlmox = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
  private
      _dbAlmox  : TdbAlmox;
    FcdsAlmox: TClientDataSet;
    procedure SetcdsAlmox(const Value: TClientDataSet);

  public
      Property  cdsAlmox : TClientDataSet read FcdsAlmox write SetcdsAlmox;

      Constructor Create; Override;
      Destructor  Destroy;Override;

      Function Inserir : Boolean;
      Function Alterar : Boolean;
      Function Deletar(iIdAlmox: Double): Boolean;
  End;

implementation

{ TCtrlAlmox }

function TCtrlAlmox.Alterar: Boolean;
Var
  x : Integer;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Alterar(FcdsAlmox.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           for x := 0  To Pred(_dbAlmox.FieldCount) Do
               _dbAlmox.Fields[x].Value  := FcdsAlmox.Fields.FieldByName(_dbAlmox.Fields[x].ColumName).Value;

           Result := _dbAlmox.Update;

           if Result Then
              Commit
           Else
             Begin
                Rollback;
                MessageInfo := _dbAlmox.MessageInfo;
             End;
        except
           On E:Exception Do
           Begin
              Rollback;
              Result := False;
              MessageInfo := E.Message;
           End;
        End;
     End;
end;

constructor TCtrlAlmox.Create;
begin
  inherited;
  _dbAlmox  := TdbAlmox.Create;
  FcdsAlmox := TClientDataSet.Create(nil);
end;

function TCtrlAlmox.Deletar(iIdAlmox: Double): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Deletar(iIdAlmox);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           _dbAlmox.CODALMOXARIFADO.AsFloat  :=  iIdAlmox;
           Result := _dbAlmox.Delete;

           if Result Then
              Commit
           Else
             Begin
                Rollback;
                MessageInfo := _dbAlmox.MessageInfo;
             End;
        except
           On E:Exception Do
           Begin
              Rollback;
              Result := False;
              MessageInfo := E.Message;
           End;
        End;
     End;
end;

destructor TCtrlAlmox.Destroy;
begin
  inherited;
  _dbAlmox.Free;

  If FcdsAlmox.active Then FcdsAlmox.Close;
  FcdsAlmox.Free;
end;

procedure TCtrlAlmox.DoChangeDataBase;
begin
  inherited;
  _dbAlmox.DataBaseName := DataBaseName;
end;

function TCtrlAlmox.Inserir: Boolean;
Var
  x : Integer;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.Inserir(FcdsAlmox.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           for x := 0  To Pred(_dbAlmox.FieldCount) Do
               _dbAlmox.Fields[x].Value  := FcdsAlmox.Fields.FieldByName(_dbAlmox.Fields[x].ColumName).Value;

           Result := _dbAlmox.Insert;

           if Result Then
              Commit
           Else
             Begin
                Rollback;
                MessageInfo := _dbAlmox.MessageInfo;
             End;
        except
           On E:Exception Do
           Begin
              Rollback;
              Result := False;
              MessageInfo := E.Message;
           End;
        End;
     End;
end;

procedure TCtrlAlmox.SetcdsAlmox(const Value: TClientDataSet);
begin
  FcdsAlmox := Value;
end;

end.

