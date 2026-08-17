{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 09/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlTermolivro;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTermolivro, Usistema,
     DB, uDataBase, DbClient, DBaseDados, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlTermolivro = Class(TCmControlObject)

    private
    FDbTermolivro: TDbTermolivro;
    FCdsTermolivro: TClientDataSet;
    procedure SetDbTermolivro(const Value: TDbTermolivro);
    procedure SetCdsTermolivro(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsTermolivro: TClientDataSet read FCdsTermolivro write SetCdsTermolivro;
      property DbTermolivro: TDbTermolivro read FDbTermolivro write SetDbTermolivro;

      function InserirTermoLivro: Boolean;
      function AlterarTermoLivro: Boolean;
      function ExcluirTermoLivro: Boolean;

      {verifica se existe o termo especificado}
      function ProcuraTermo(AberturaFechamento, FlgLivro : string; IdEmpresa : longint) : boolean;
      function Sel(sTipo : String; IdEmpresa : longint) : string;
      {Lista o termo especificado}
      function ProcurarTermo(sTipo : String; IdEmpresa : longint; FlgEntradaSaida : string) : OleVariant;

    End;

implementation


{ TCtrlTermolivro }

function TCtrlTermolivro.AlterarTermoLivro: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlterarTermoLivro(CdsTermolivro.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsTermolivro,DbTermolivro);
        StartTransaction;

        Result := ApplyCds(FCdsTermolivro,FDbTermolivro,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbTermolivro.MessageInfo;
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

constructor TCtrlTermolivro.Create;
begin
  inherited;
  FDbTermolivro := TDbTermolivro.Create(Self);
end;

destructor TCtrlTermolivro.Destroy;
begin
  inherited;
  FDbTermolivro.Free;
  if isAppServer then
     Begin
       FCdsTermolivro.Free;

     end;  
end;

procedure TCtrlTermolivro.DoChangeDataBase;
begin
  inherited;
  DbTermolivro.DataBaseName := DataBaseName;
end;

function TCtrlTermolivro.ExcluirTermoLivro: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirTermoLivro(CdsTermolivro.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(FCdsTermolivro,FDbTermolivro,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbTermolivro.MessageInfo;
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

function TCtrlTermolivro.InserirTermoLivro: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserirTermoLivro(CdsTermolivro.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsTermolivro,DbTermolivro);
        StartTransaction;

        Result := ApplyCds(FCdsTermolivro,FDbTermolivro,[],[] );
        If Not Result Then
        Begin
          MessageInfo := DbTermolivro.MessageInfo;
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

procedure TCtrlTermolivro.OnCreateAppServer;
begin
  inherited;
  FCdsTermolivro := TClientDataSet.Create(nil);

end;

function TCtrlTermolivro.ProcurarTermo(sTipo: String;
                                       IdEmpresa: Integer; FlgEntradaSaida : string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * ' +
          '  FROM TERMOLIVRO ' +
          ' WHERE IDPESSOA = '+IntToStr(IdEmpresa)+
          '   AND ABERTFECHAM = '+quotedStr(sTipo)+
          '   AND FLGENTRADASAIDA = '+quotedStr(FlgEntradaSaida);
  Result := GetDataPacket(Ssql);
end;

function TCtrlTermolivro.ProcuraTermo(AberturaFechamento, FlgLivro: string; IdEmpresa : Integer): boolean;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT COUNT(*) AS TOTAL '+
              '  FROM TERMOLIVRO '+
              ' WHERE IDPESSOA = '+intTostr(IdEmpresa)+' '+
              '   AND ABERTFECHAM = '+quotedStr(trim(AberturaFechamento)) +
              '   AND FLGENTRADASAIDA = '+quotedStr(FlgLivro);
      Data := GetDataPacket(Ssql);
      Result := FieldByName('Total').Asinteger > 0;
    end;
end;

function TCtrlTermolivro.Sel(sTipo: String; IdEmpresa : integer) : string;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql := 'SELECT T.IDPESSOA, T.ABERTFECHAM, T.TERTEXTO, '+
              '       T.IDUSUARIOINCLUSAO, T.FLGENTRADASAIDA '+
              '  FROM TERMOLIVRO T '+
              ' WHERE (T.IDPESSOA = '+intTostr(IdEmpresa)+') '+
              '   AND (T.ABERTFECHAM = '+quotedStr(Trim(sTipo))+') ';
      Data := GetDataPacket(Ssql);
      Result := fieldByname('ABERTFECHAM').AsString;
    end;
end;

procedure TCtrlTermolivro.SetCdsTermolivro(const Value: TClientDataSet);
begin
  FCdsTermolivro := Value;
end;

procedure TCtrlTermolivro.SetDbTermolivro(const Value: TDbTermolivro);
begin
  FDbTermolivro := Value;
end;

end.
