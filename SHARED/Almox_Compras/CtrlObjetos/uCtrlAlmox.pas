{ --------------------------------------------------------------------------------------------------
Rotina......:
Nº SOL......: 136124
Nº KINTANA..: 812334
Data........: 10/10/2011
Responsável.: Thaise Amaral Martins
Descrição...: Criação de novas funções e procedimentos para validação de datas e bloqueios de usuário.
-------------------------------------------------------------------------------------------------- }


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
    function AtribuirAlmoxarifado : Boolean;

    function VerificaDispRequisicao: Boolean; //Thaise Amaral SOL:136124 KTN:812334
    function DiaUtilProxMes: TDateTime; //Thaise Amaral SOL:136124 KTN:812334
    function UsuarioTemBloqueio(IdUsuario: Integer): Boolean; //Thaise Amaral SOL:136124 KTN:812334
    function TemDiaUtil: Boolean; //Thaise Amaral SOL:136124 KTN:812334
    function RetornaProxDiaUtil(Data: TDateTime): TDateTime; //Thaise Amaral SOL:136124 KTN:812334

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


//Thaise Amaral SOL:136124 KTN:812334
function TCtrlAlmox.VerificaDispRequisicao: Boolean;

  {
  Validação de datas
  ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
  TODAS as datas são trazidas do banco. Se o usuário trocar a data do computador,
  ainda sim, as datas estarão corretas.
  }


  //Trazendo a data atual do banco
  function DataAtual: TDateTime;
  begin
    _Cds.Data:= GetDataPacket('SELECT TRUNC(SYSDATE) DATAATUAL FROM DUAL');
    Result:= _Cds.FieldByName('DATAATUAL').AsDateTime;
  end;

  //Verificando o dia útil informado como parâmetro
  function DiaUtilMensal: Integer;
  begin
    _Cds.Data:= GetDataPacket('SELECT DIAUTILMENSAL FROM PARALMOX');
    Result:= _Cds.FieldByName('DIAUTILMENSAL').AsInteger;
  end;

  //Carregando o primeiro dia do mês para começarmos a contar dele os dias úteis.
  function PrimeiroDiadoMes: TDateTime;
  begin
    _Cds.Data:= GetDataPacket('SELECT TRUNC(SYSDATE,''MONTH'') PRIMEIRODIAMES FROM DUAL');
    Result:= _Cds.FieldByName('PRIMEIRODIAMES').AsDateTime;
  end;

  //Verificando se a data em questão é um feriado. Se for, não será contada como
  //dia útil
  function VerificaFeriado(Data: TDateTime): Boolean;
  var sSql: String;
  begin
    sSql:= 'SELECT DATAFERIADO FROM FERIADOS ' +
           'WHERE DATAFERIADO = ' + QuotedStr(DateToStr(Data)) +
           ' AND IDPAIS =  1 ';


    _Cds.Data:= GetDataPacket(sSql);

    Result:= _Cds.FieldByName('DATAFERIADO').AsDateTime = 0;
  end;

  var sSql: String;
      dPrimeiroDiaMes, dDiaUtil: TDatetime;
      iDiaUtil, iContDias: Integer;
begin
  dPrimeiroDiaMes:= PrimeiroDiadoMes;

  iDiaUtil:= DiaUtilMensal;
  iContDias:= 0;

  while iContDias < iDiaUtil do
  begin
    if (DayOfWeek(dPrimeiroDiaMes) <> 7) and
       (DayOfWeek(dPrimeiroDiaMes) <> 1) and
       (VerificaFeriado(dPrimeiroDiaMes)) then
    begin
      dDiaUtil:= dPrimeiroDiaMes;
      Inc(iContDias);
    end;
    dPrimeiroDiaMes:= dPrimeiroDiaMes + 1;
  end;

  //É um dia útil se a data atual for igual ou MENOR que a data
  //informada no dia útil do mês
  Result:= (DataAtual <= dDiaUtil);
end;


//Thaise Amaral SOL:136124 KTN:812334
function TCtrlAlmox.UsuarioTemBloqueio(IdUsuario: Integer): Boolean;
  var sSql: String;
begin
  _Cds.Data:= GetDataPacket('SELECT FLGDISPALMOX FROM USUARIOSISTEMA ' +
                            'WHERE IDUSUARIO = ' + InttoStr(IdUsuario));
  Result:= (_Cds.FieldByName('FLGDISPALMOX').AsString = 'S') or (Trim(_Cds.FieldByName('FLGDISPALMOX').AsString) = '');
end;

function TCtrlAlmox.DiaUtilProxMes: TDateTime;
begin
  //1) Pulando os fins de semana na data de retorno para informação da próxima data possível para cadastro.
  _Cds.Data:= GetDataPacket(' SELECT DECODE(TO_CHAR((TRUNC(LAST_DAY(SYSDATE)) + 1), ''D''), ' +
                            ' 1, ' +          //Se for igual domingo, pulamos 2 dias.
                            ' (TRUNC(LAST_DAY(SYSDATE)) + 2), ' +
                            ' 7, ' +          //Se for igual a sábado, pulamos + 3 dias
                            ' (TRUNC(LAST_DAY(SYSDATE)) + 3), ' +
                            ' (TRUNC(LAST_DAY(SYSDATE)) + 1)) DIAUTILPROXMES ' + //Senão, retorna a data normal do próximo mês
                            ' FROM DUAL ');

  Result:= RetornaProxDiaUtil(_Cds.FieldByName('DIAUTILPROXMES').AsDateTime);
end;

function TCtrlAlmox.TemDiaUtil: Boolean;
begin
  _Cds.Data:= GetDataPacket('SELECT DECODE(DIAUTILMENSAL, NULL, 0, 0, 0, DIAUTILMENSAL) DIAUTILMENSAL ' +
                            'FROM PARALMOX');

  Result:= _Cds.FieldByName('DIAUTILMENSAL').AsInteger > 0;
end;

//Thaise Amaral SOL:136124 KTN:812334
function TCtrlAlmox.RetornaProxDiaUtil(Data: TDateTime): TDateTime;
  var sSql: String;
      DataSemana: TDateTime;
begin
  //2) Se a data do primeiro dia do mês, for feriado, o dia útil cai para o próximo dia do mês exceto sábado e domingo.
  sSql:= 'SELECT DATAFERIADO FROM FERIADOS ' +
         'WHERE DATAFERIADO = ' + QuotedStr(DateToStr(Data)) +
         ' AND IDPAIS =  1 ';


  _Cds.Data:= GetDataPacket(sSql);
  DataSemana:= _Cds.FieldByName('DATAFERIADO').AsDateTime;

  if DataSemana = 0 then
    Result:= Data
  else
  begin
    if DayOfWeek(DataSemana) = 6 then
        DataSemana:= DataSemana + 1;

    if DayOfWeek(DataSemana) = 1 then
      RetornaProxDiaUtil(DataSemana + 1)
    else
    if DayOfWeek(DataSemana) = 7 then
      RetornaProxDiaUtil(DataSemana + 2)
    else
      RetornaProxDiaUtil(DataSemana + 1);
  end;

end;

end.

