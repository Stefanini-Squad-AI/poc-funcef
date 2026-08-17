unit uCtrlAlmox;

interface

Uses DB, uDataBase, udbAlmox, uCmControlObject,Classes,uDbTransfAlmox,
     uDbUsuxAlmox,dbclient, sysutils,uSistema, uMidasUtil, uCMTypes;

Type
  TCtrlAlmox = class(TCmControlObject)

  Protected
     procedure DoChangeDataBase; Override;
     Procedure OnCreateAppServer; Override;
  private
    _dbAlmox       : TdbAlmox;
    _DbTransfAlmox : TDbTransfAlmox;
    _DbUsuxAlmox   : TDbUsuxAlmox;

    FcdsAlmox: TClientDataSet;
    procedure SetcdsAlmox(const Value: TClientDataSet);

  public
    Property  cdsAlmox : TClientDataSet read FcdsAlmox write SetcdsAlmox;
    //
    Constructor Create; Override;
    Destructor  Destroy; Override;
    //
    Function Gravar  : Boolean;

    Function Excluir : Boolean;

    Function Procurar( CodAlmoxarifado : Integer ) : OleVariant;
    {**
       Lista os almoxarifados
    **}
    Function ListAlmox(IdPessoa        : Integer;
                       CodAlmoxarifado : Integer = 0;
                       CodCusteio      : Double = 0 ) : OleVariant;
    {**
       Lista os almoxarifados disponíveis para o usuário
    **}
    Function ListAlmoxxUsuario(IdPessoa       : Integer;
                               Idusuario      : Integer;
                               CodAlmoxOrigem : Integer = 0 ) : OleVariant;
    {**
       Verifica se O almoxarifado de origem pode transferir
       para o de destino
    **}
    Function PodeTransferir( CodAlmoxOrigem  : Integer;
                             CodAlmoxDestino : Integer ) : Boolean;
    {**
       Gera uma lista com os almoxarifados já disponíveis para transferência
    **}
    Function ListAlmoxAtrib( CodAlmoxarifado : Integer ) : OleVariant; OverLoad;
    {**
       Gera uma lista com os almoxarifados já Atribuidos ao usuario
    **}
    Function ListAlmoxAtrib( IdUsuario : Double;
                             IdPessoa  : Integer ) : OleVariant; OverLoad;
    {**
       Gera uma lista com os almoxarifados não disponíveis para transferência
    **}
    Function ListAlmoxNaoAtrib( CodAlmoxarifado,IdPessoa : Integer ) : OleVariant; OverLoad;
   {**
       Gera uma lista com os almoxarifados não Atribuidos para o usuario
    **}
    Function ListAlmoxNaoAtrib( IdUsuario : Double;
                                IdPessoa  : Integer ) : OleVariant; OverLoad;
    {**
       Efetua a gravação da associa dos almoxarifados disponíveis para
       transferência
    **}
    Function AssociaAlmoxTransf : Boolean;
    {**
       Efetua a gravação da atribuição dos almoxarifados disponíveis para
       o determinado usuário
    **}
    Function AtribuirAlmoxarifado : Boolean;

  End;


implementation

{ TCtrlAlmox }

function TCtrlAlmox.Gravar: Boolean;
Var
  Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarAlmox(FcdsAlmox.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(cdsAlmox,_dbAlmox,[],[] );
           Msg    := _dbAlmox.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
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
  _dbAlmox       := TdbAlmox.Create(Self);
  _DbTransfAlmox := TDbTransfAlmox.Create(Self);
  _DbUsuxAlmox   := TDbUsuxAlmox.Create(Self);  
end;

function TCtrlAlmox.Excluir : Boolean;
Var
   Msg : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirAlmox ( FcdsAlmox.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           Result := ApplyCds(cdsAlmox,_dbAlmox,[],[] );
           Msg    := _dbAlmox.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
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
  If IsAppServer Then
     FreeCds([FcdsAlmox]);

  _dbAlmox.Free;
  _DbTransfAlmox.Free;
  _DbUsuxAlmox.Free;

  inherited;
end;

procedure TCtrlAlmox.DoChangeDataBase;
begin
  inherited;
  _dbAlmox.DataBaseName       := DataBaseName;
  _DbTransfAlmox.DataBaseName := DataBaseName;
  _DbUsuxAlmox.DataBaseName   := DataBaseName;
end;

procedure TCtrlAlmox.SetcdsAlmox(const Value: TClientDataSet);
begin
  FcdsAlmox := Value;
end;

procedure TCtrlAlmox.OnCreateAppServer;
begin
  inherited;
  FcdsAlmox := TClientDataSet.Create(nil);
end;

function TCtrlAlmox.ListAlmox( IdPessoa: Integer;CodAlmoxarifado :Integer;
  CodCusteio: Double): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add(' SELECT  CODALMOXARIFADO,');
      SQL.Add('         CODCUSTEIO,     ');
      SQL.Add('         PRINCIPSECUND,  ');
      SQL.Add('         CONTABIL,       ');
      SQL.Add('         CODCENTROCUSTO, ');
      SQL.Add('         IDEMPRESA,      ');
      SQL.Add('         DESCALMOX       ');
      SQL.Add(' FROM ALMOX ');
      SQL.Add(' WHERE (1=1)  ');

      If Codalmoxarifado > 0 Then
         SQL.Add(' AND (CODALMOXARIFADO <> '+IntToStr(Codalmoxarifado)+') ');

      SQL.Add(' AND (IDPESSOA = '+IntToStr(IdPessoa)+')');

      If CodCusteio > 0 Then
         SQL.Add(' AND (CODCUSTEIO = '+FloatToStr(CodCusteio)+') ');

      SQL.Add(' ORDER BY DESCALMOX ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;


end;

function TCtrlAlmox.PodeTransferir(CodAlmoxOrigem,
  CodAlmoxDestino: Integer): Boolean;
Var
  SQL : String;
begin
  SQL := ' SELECT CODALMOXARIFADO ' +
         ' FROM TRANSFALMOX ' +
         ' WHERE (CODALMOXARIFADO = '+ IntToStr(CodAlmoxOrigem ) + ') '+
         '   AND (CODALMOXPERMITE = '+ IntToStr(CodAlmoxDestino) + ') ';

  _cds.Data := GetDataPacket(SQL);
  
  Result := Not _cds.IsEmpty;

end;

function TCtrlAlmox.Procurar(CodAlmoxarifado: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add(' SELECT  CODALMOXARIFADO,');
      SQL.Add('         CODCUSTEIO,     ');
      SQL.Add('         PRINCIPSECUND,  ');
      SQL.Add('         CONTABIL,       ');
      SQL.Add('         CODCENTROCUSTO, ');
      SQL.Add('         IDPESSOA,       ');
      SQL.Add('         IDEMPRESA,      ');
      SQL.Add('         DESCALMOX       ');
      SQL.Add(' FROM ALMOX ');
      SQL.Add(' WHERE (CODALMOXARIFADO = '+IntToStr(Codalmoxarifado)+') ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;
end;

function TCtrlAlmox.ListAlmoxxUsuario(IdPessoa, Idusuario,
  CodAlmoxOrigem: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                   ');
      SQL.Add('     UXA.CODALMOXARIFADO,');
      SQL.Add('     ALM.DESCALMOX,      ');
      SQL.Add('     ALM.PRINCIPSECUND,  ');
      SQL.Add('     ALM.CODCUSTEIO,     ');
      SQL.Add('     ALM.CODCENTROCUSTO  ');
      SQL.Add('FROM                     ');
      SQL.Add('     ALMOX ALM,          ');
      SQL.Add('     USUXALMOX UXA       ');
      SQL.Add('WHERE                    ');
      SQL.Add('       (UXA.IDUSUARIO = '+IntToStr(IdUsuario)+') ');
      SQL.Add('   AND (UXA.IDPESSOA  = '+IntToStr(IdPessoa)+')  ');
      SQL.Add('   AND (UXA.CODALMOXARIFADO <> '+IntToStr(CodAlmoxOrigem)+') ');
      SQL.Add('   AND (UXA.CODALMOXARIFADO = ALM.CODALMOXARIFADO) ');
      SQL.Add('ORDER BY ALM.DESCALMOX ');

      Result := GetDataPacket(SQL.Text);
  Finally
     SQL.Free;
  End;
end;

function TCtrlAlmox.ListAlmoxAtrib(CodAlmoxarifado: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                  ');
      SQL.Add('      T.CODALMOXARIFADO,');
      SQL.Add('      T.CODALMOXPERMITE,');
      SQL.Add('      A.DESCALMOX ');
      SQL.Add('FROM ');
      SQL.Add('     TRANSFALMOX T, ');
      SQL.Add('     ALMOX A ');
      SQL.Add('WHERE ');
      SQL.Add('     (T.CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+') ');
      SQL.Add('  AND(T.CODALMOXPERMITE = A.CODALMOXARIFADO) ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;

end;

function TCtrlAlmox.ListAlmoxNaoAtrib(CodAlmoxarifado,
  IdPessoa: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                  ');
      SQL.Add('     CODALMOXARIFADO, ');
      SQL.Add('     DESCALMOX        ');
      SQL.Add('FROM                  ');
      SQL.Add('     ALMOX            ');
      SQL.Add('WHERE                 ');
      SQL.Add('          ( IDPESSOA =  '+IntToStr(IdPessoa)+' ) ');
      SQL.Add(' AND ( CODALMOXARIFADO NOT  IN (  SELECT CODALMOXPERMITE FROM TRANSFALMOX ');
      SQL.Add('                                  WHERE  CODALMOXARIFADO = '+IntToStr(CodAlmoxarifado)+' ) ) ');
      SQL.Add(' AND (CODALMOXARIFADO <> '+IntToStr(CodAlmoxarifado)+' ) ');
      SQL.Add('ORDER BY  DESCALMOX ');

      Result := GetDataPacket(SQL.Text);

   Finally
      SQL.Free;
   End;
end;

function TCtrlAlmox.AssociaAlmoxTransf: Boolean;
Var
   Msg : String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AssociaAlmoxTransf( cdsAlmox.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

           Result := ApplyCds(cdsAlmox,_DbTransfAlmox,[],[] );
           Msg    := _DbTransfAlmox.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

            Commit;
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

function TCtrlAlmox.ListAlmoxNaoAtrib(IdUsuario: Double;
  IdPessoa: Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT                  ');
      SQL.Add('     CODALMOXARIFADO, ');
      SQL.Add('     DESCALMOX        ');
      SQL.Add('FROM                  ');
      SQL.Add('     ALMOX            ');
      SQL.Add('WHERE                 ');
      SQL.Add('     ( IDPESSOA =  '+IntToStr(IdPessoa)+' ) ');
      SQL.Add(' AND ( CODALMOXARIFADO NOT  IN (  SELECT CODALMOXARIFADO FROM USUXALMOX ');
      SQL.Add('                                  WHERE  IDUSUARIO = '+FloatToStr(IdUsuario)+' ) ) ');
      SQL.Add('ORDER BY  DESCALMOX ');

      Result := GetDataPacket(SQL.Text);

   Finally
      SQL.Free;
   End;
end;

function TCtrlAlmox.ListAlmoxAtrib(idUsuario: Double; IdPessoa : Integer): OleVariant;
Var
   SQL : TStringList;
begin
   SQL := TStringList.Create;
   Try
      SQL.Clear;
      SQL.Add('SELECT ');
      SQL.Add('     UXA.IDUSUARIO,');
      SQL.Add('     UXA.CODALMOXARIFADO,');
      SQL.Add('     UXA.IDPESSOA,');
      SQL.Add('     ALM.DESCALMOX');
      SQL.Add('FROM ');
      SQL.Add('     ALMOX ALM,');
      SQL.Add('     USUXALMOX UXA ');
      SQL.Add('WHERE ');
      SQL.Add('       (UXA.IDUSUARIO = '+FloatToStr(IdUsuario)+') ');
      SQL.Add('   AND (UXA.IDPESSOA  = '+IntToStr(IdPessoa)+') ');
      SQL.Add('   AND (UXA.CODALMOXARIFADO = ALM.CODALMOXARIFADO) ');
      SQL.Add('ORDER BY ALM.DESCALMOX ');

      Result := GetDataPacket(SQL.Text);
   Finally
      SQL.Free;
   End;
end;

function TCtrlAlmox.AtribuirAlmoxarifado: Boolean;
Var
   Msg : String;
begin
   If ConnectionSide = cnsClient Then
      Begin
         Result := Connection.AppServer.AtribuirAlmoxarifado( FcdsAlmox.Data );
         If Not Result Then
            MessageInfo := Connection.AppServer.MessageInfo;
      End
   Else
      Begin
         Try
            StartTransaction;

            Result := ApplyCds(cdsAlmox,_DbUsuxAlmox,[],[] );
            Msg    := _DbUsuxAlmox.MessageInfo;
            If Not Result Then Raise Exception.Create(Msg);

            Commit;
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

end.

