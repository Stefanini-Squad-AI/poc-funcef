{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlCiap;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbCiap, uSistema, DB, uDataBase, DbClient, uCmTypes;

  Type
    TCtrlCiap = Class(TCmControlObject)

    private
    FDbCiap: TDbCiap;
    FCdsCiap: TClientDataSet;
    procedure SetDbCiap(const Value: TDbCiap);
    procedure SetCdsCiap(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsCiap: TClientDataSet read FCdsCiap write SetCdsCiap;
      property DbCiap: TDbCiap read FDbCiap write SetDbCiap;

      function InserirCiap: Boolean;
      function AlteraCiap: Boolean;
      function ExcluirCiap: Boolean;

      {Lista o Ciap especificado}
      function ProcurarCiap(IdCiap : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlCiap }

function TCtrlCiap.AlteraCiap: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlteraCiap(CdsCiap.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsCiap,DbCiap);
        StartTransaction;

        Result := ApplyCds(FCdsCiap,FDbCiap,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbCiap.MessageInfo;
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

constructor TCtrlCiap.Create;
begin
  inherited;
  FDbCiap := TDbCiap.Create(Self);
end;

destructor TCtrlCiap.Destroy;
begin
  inherited;
  FDbCiap.Free;
  if isAppServer then FCdsCiap.Free;
end;

procedure TCtrlCiap.DoChangeDataBase;
begin
  inherited;
  DbCiap.DataBaseName := DataBaseName;
end;

function TCtrlCiap.ExcluirCiap: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirCiap(CdsCiap.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;

        Result := ApplyCds(FCdsCiap,FDbCiap,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbCiap.MessageInfo;
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

function TCtrlCiap.InserirCiap: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserirCiap(CdsCiap.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsCiap,DbCiap);
        StartTransaction;

        Result := ApplyCds(FCdsCiap,FDbCiap,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbCiap.MessageInfo;
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


procedure TCtrlCiap.OnCreateAppServer;
begin
  inherited;
  FCdsCiap := TClientDataSet.Create(nil);
end;

function TCtrlCiap.ProcurarCiap(IdCiap: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * ' +
          '  FROM CIAP ' +
          ' WHERE IDCIAP = '+IdCiap;
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlCiap.SetCdsCiap(const Value: TClientDataSet);
begin
  FCdsCiap := Value;
end;

procedure TCtrlCiap.SetDbCiap(const Value: TDbCiap);
begin
  FDbCiap := Value;
end;

end.
