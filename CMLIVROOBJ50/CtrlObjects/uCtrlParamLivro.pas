{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 02/02/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlParamLivro;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbParamLivro, uSistema, DB, uDataBase, uDbParamlivroxramo,
     DbClient, {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlParamLivro = Class(TCmControlObject)

    private
    FDbParamLivro: TDbParamLivro;
    DbParamLivroxRamo : TDbParamlivroxramo;
    FCdsParamLivro: TClientDataSet;
    FCdsParamLivroxRamo: TClientDataSet;


    procedure SetDbParamLivro(const Value: TDbParamLivro);
    procedure SetCdsParamLivro(const Value: TClientDataSet);
    procedure SetCdsParamLivroxRamo(const Value: TClientDataSet);

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsParamLivro: TClientDataSet read FCdsParamLivro write SetCdsParamLivro;
      property DbParamLivro: TDbParamLivro read FDbParamLivro write SetDbParamLivro;
      property CdsParamLivroxRamo : TClientDataSet read FCdsParamLivroxRamo write SetCdsParamLivroxRamo;

      function InserirParamLivro: Boolean;
      function AlterarParamLivro: Boolean;
      function ExcluirParamLivro: Boolean;

      {Lista o Código ICMS de entrada e Código IPI de entrada}
      function ListCodICMSIPI(IdPessoa : LongInt) : Olevariant;
      {Lista os parametros do livro para a empresa especificada}
      function ProcurarParamLivro(IdPessoa : string) : OleVariant;
      {Lista todos os tipos de documentos disponíveis - Pertence ao Global}
      function ListTipoDoc : OleVariant;

    protected

    End;

implementation

{ TCtrlParamLivro }

function TCtrlParamLivro.AlterarParamLivro: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.AlterarParamLivro(CdsParamLivro.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsParamLivro,DbParamLivro);
        StartTransaction;

        Result := ApplyCds(FCdsParamLivro,FDbParamLivro,[],[] );

        if Result then
          Result := ApplyCds(FCdsParamLivroxRamo, DbParamLivroxRamo, [], []);

        If Not Result Then
        Begin
          MessageInfo := DbParamLivro.MessageInfo;
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

constructor TCtrlParamLivro.Create;
begin
  inherited;
  FDbParamLivro := TDbParamLivro.Create(Self);
  DbParamLivroxRamo := TDbParamlivroxramo.Create(Self);
end;

destructor TCtrlParamLivro.Destroy;
begin
  FDbParamLivro.Free;
  DbParamLivroxRamo.free;
  if isAppServer then
    Begin
      FCdsParamLivroxRamo.free;
      FCdsParamLivro.Free;
    end;

  inherited;
end;

procedure TCtrlParamLivro.DoChangeDataBase;
begin
  inherited;
  DbParamLivro.DataBaseName := DataBaseName;
  DbParamLivroxRamo.DataBaseName := DataBaseName;
end;

function TCtrlParamLivro.ExcluirParamLivro: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.ExcluirParamLivro(CdsParamLivro.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;

        Result := ApplyCds(FCdsParamLivro,FDbParamLivro,[],[] );

        if Result then
          Result := ApplyCds(FCdsParamLivroxRamo, DbParamLivroxRamo, [], []);

        If Not Result Then
        Begin
          MessageInfo := DbParamLivro.MessageInfo;
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

function TCtrlParamLivro.InserirParamLivro: Boolean;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.InserirParamLivro(CdsParamLivro.data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        CdsToDbObject(CdsParamLivro,DbParamLivro);
        StartTransaction;

        Result := ApplyCds(FCdsParamLivro,FDbParamLivro,[],[] );

        if Result then
          Result := ApplyCds(FCdsParamLivroxRamo, DbParamLivroxRamo, [], []);

        If Not Result Then
        Begin
          MessageInfo := DbParamLivro.MessageInfo;
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

function TCtrlParamLivro.ListCodICMSIPI(IdPessoa: Integer): Olevariant;
Var
   Ssql : string;
begin
  Ssql := 'SELECT CODICMSENTRADA, CODIPIENTRADA '+
          '  FROM PARAMLIVRO '+
          ' WHERE IDPESSOA = '+intTostr(IdPessoa);
  Result := GetDataPacket(Ssql);
end;


function TCtrlParamLivro.ListTipoDoc: OleVariant;
Var
  Ssql : string;
begin
   Ssql := 'SELECT IDDOCUMENTO,NOMEDOCUMENTO FROM '+
           '       TIPODOCPESSOA '+
           ' WHERE ((FISICAJURIDICA = ''A'') OR '+
           '       (FISICAJURIDICA = ''J''))';
   Result := GetDataPacket(Ssql);
end;

procedure TCtrlParamLivro.OnCreateAppServer;
begin
  inherited;
  FCdsParamLivro := TClientDataSet.Create(nil);
  FCdsParamLivroxRamo := TClientDataSet.Create(nil);
end;

function TCtrlParamLivro.ProcurarParamLivro(IdPessoa: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM PARAMLIVRO '+
          ' WHERE IDPESSOA = '+IdPessoa;
  Result := GetDataPacket(Ssql);        
end;

procedure TCtrlParamLivro.SetCdsParamLivro(const Value: TClientDataSet);
begin
  FCdsParamLivro := Value;
end;

procedure TCtrlParamLivro.SetCdsParamLivroxRamo(
  const Value: TClientDataSet);
begin
  FCdsParamLivroxRamo := Value;
end;

procedure TCtrlParamLivro.SetDbParamLivro(const Value: TDbParamLivro);
begin
  FDbParamLivro := Value;
end;

end.
