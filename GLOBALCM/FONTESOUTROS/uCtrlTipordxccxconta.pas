unit uCtrlTipordxccxconta;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipordxccxconta, uSistema, DB, uDataBase,
DbClient, Wwquery, Provider,uString;

type
  TCtrlTipordxccxconta = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    _DbTipordxccxconta : TDbTipordxccxconta;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function  ListTipordxccxconta ( Idtipordxccxconta : double  = 0;
                                    PLANO             : double = 0 ;
                                    IDPROGRAMA        : double = 0 ;
                                    IDPESSOA          : double = 0 ;
                                    IDEMPRESA         : double = 0;
                                    RECPAG            : String = '';
                                    PLACONTA          : String = '';
                                    CODTIPRECDES      : String = '';
                                    CODCENTROCUSTO    : String = '') : OleVariant;
    Function ListTipordxccxcontaCCustoAsso(RECPAG       : string;
                                           IDPESSOA     : integer;
                                           CODTIPRECDES : string = '';
                                           PLANO        : integer= 0;
                                           PLACONTA     : string = '';
                                           ldPrograma   : integer= 0) : OleVariant;
    Function ListTipordxccxcontaCCustoNaoAsso(RECPAG       : string;
                                              IDPESSOA     : integer;
                                              CODTIPRECDES : string = '';
                                              PLANO        : integer= 0;
                                              PLACONTA     : string = '';
                                              idPrograma   : integer= 0;
                                              idempresa    : integer= 0) : OleVariant;
    function GravarTipordxccxconta: Boolean;
    function AplicaAlteracoes(cds : TclientDataSet): boolean;
End;

implementation

{ TCtrlTipordxccxconta }

Uses uCmTypes;

function TCtrlTipordxccxconta.GravarTipordxccxconta: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipordxccxconta(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTipordxccxconta,[],[]);
        Msg    := _DbTipordxccxconta.MessageInfo;

        If Not Result Then Raise Exception.create(Msg);
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

constructor TCtrlTipordxccxconta.Create;
begin
  inherited;
  _DbTipordxccxconta := TDbTipordxccxconta.Create;
  FCds := TClientDataSet.Create(nil);
end;

destructor TCtrlTipordxccxconta.Destroy;
begin
  _DbTipordxccxconta.Free;
  inherited;
end;

procedure TCtrlTipordxccxconta.DoChangeDataBase;
begin
  inherited;
  _DbTipordxccxconta.DataBaseName := DataBaseName;
end;

procedure TCtrlTipordxccxconta.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTipordxccxconta.AplicaAlteracoes(
  cds: TclientDataSet): boolean;
var Msg : string; 
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipordxccxconta(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
     Try
        StartTransaction;
        result := ApplyCds(cds, _DbTipordxccxconta, [], []);
        Msg    := _DbTipordxccxconta.MessageInfo;

        If Not Result Then Raise Exception.create(Msg);
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

function TCtrlTipordxccxconta.ListTipordxccxconta ( Idtipordxccxconta, PLANO, IDPROGRAMA,
                    IDPESSOA, IDEMPRESA : double; RECPAG, PLACONTA, CODTIPRECDES, CODCENTROCUSTO : String) : OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipordxccxconta ( Idtipordxccxconta, PLANO, IDPROGRAMA, IDPESSOA,
             IDEMPRESA, RECPAG, PLACONTA, CODTIPRECDES, CODCENTROCUSTO);
   MessageInfo := Connection.AppServer.MessageInfo;
End
Else
Begin
   ssql := 'SELECT              '+
           '    IDTIPORDXCCXCONTA, '+
           '    CODTIPRECDES,      '+
           '    RECPAG,            '+
           '    IDPESSOA,          '+
           '    PLANO,             '+
           '    PLACONTA,          '+
           '    CODCENTROCUSTO,    '+
           '    IDEMPRESA,         '+
           '    IDPROGRAMA         '+
           'FROM                   '+
           '    TIPORDXCCXCONTA where (1=1)';
   if Idtipordxccxconta <> 0  then
      ssql := ssql + ' and Idtipordxccxconta = ' + floattostr(Idtipordxccxconta);
   if PLANO <> 0  then
      ssql := ssql + ' and plano = '+floattostr(plano);
   if IDPROGRAMA <> 0  then
      ssql := ssql + ' and IDPROGRAMA = '+floattostr(IDPROGRAMA)
   else
      ssql := ssql + ' and IDPROGRAMA is null ';
   if IDPESSOA <> 0  then
      ssql := ssql + ' and IDPESSOA = '+floattostr(IDPESSOA);
   if IDEMPRESA <> 0  then
      ssql := ssql + ' and IDEMPRESA = '+floattostr(IDEMPRESA);
   if trim(RECPAG) <> '' then
      ssql := ssql + ' and RECPAG = '''+  trim(RECPAG)+ '''';
   if trim(PLACONTA) <> '' then
      ssql := ssql + ' and PLACONTA = '''+  trim(PLACONTA)+ '''';
   if trim(CODTIPRECDES) <> '' then
      ssql := ssql + ' and CODTIPRECDES = '''+  trim(CODTIPRECDES)+ '''';
   if trim(CODCENTROCUSTO) <> '' then
      ssql := ssql + ' and CODCENTROCUSTO = '''+  trim(CODCENTROCUSTO)+ '''';
   Result := GetDataPacket(ssql);
end;
end;

function TCtrlTipordxccxconta.ListTipordxccxcontaCCustoAsso(RECPAG: string;
  IDPESSOA: integer; CODTIPRECDES : string; PLANO : integer; PLACONTA : string;
  ldPrograma: integer): OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipordxccxcontaCCustoAsso(RECPAG, IDPESSOA, CODTIPRECDES, PLANO, PLACONTA, ldPrograma);
   MessageInfo := Connection.AppServer.MessageInfo;
End
Else
Begin
   ssql := 'SELECT                  '+
           '     T.IDTIPORDXCCXCONTA,  '+
           '     T.CODCENTROCUSTO,  '+
           '     T.CODTIPRECDES,  '+
           '     T.RECPAG,        '+
           '     T.IDPESSOA,      '+
           '     T.PLANO,         '+
           '     T.PLACONTA,      '+
           '     T.IDEMPRESA,     '+
           '     T.IDPROGRAMA,    '+
           '     C.NOME,          '+
           '     C.STATUSGRUPOCDC  '+
           'FROM                  '+
           '     TIPORDXCCXCONTA T, CENTCUST C   '+
           'WHERE   '+
           '     T.RECPAG = '''+ RECPAG + ''''+
           '  and T.IDPESSOA = '+floattostr(IDPESSOA);
   if trim(CODTIPRECDES) <> '' then
       ssql := ssql + '  and RTRIM(T.CODTIPRECDES) = '''+CODTIPRECDES +'''';
   if PLANO <> 0 then
      ssql := ssql + '  and RTRIM(T.PLANO) = '''+inttostr(PLANO) +'''';
   if trim(PLACONTA) <> '' then
      ssql := ssql + '  and RTRIM(T.PLACONTA) = '''+PLACONTA +'''';
   if ldPrograma = 0 then
      ssql := ssql + ' and T.IDPROGRAMA IS NULL '
   else
      ssql := ssql + ' and T.IDPROGRAMA = ' + IntToStr(ldPrograma);
   ssql := ssql + '  and T.IDPESSOA            = C.IDEMPRESA   '+
                  '  and T.CODCENTROCUSTO      = C.CODCENTROCUSTO  '+
                  'ORDER BY  '+
                  '     T.CODCENTROCUSTO,  '+
                  '     C.NOME              ';
   Result := GetDataPacket(ssql);
end;
end;

function TCtrlTipordxccxconta.ListTipordxccxcontaCCustoNaoAsso(
  RECPAG: string; IDPESSOA: integer; CODTIPRECDES : string ; PLANO : integer; PLACONTA : string;
  idPrograma, idempresa : integer): OleVariant;
var ssql : string;
begin
If ConnectionSide = cnsClient Then
Begin
   Result := Connection.AppServer.ListTipordxccxcontaCCustoNaoAsso(RECPAG, IDPESSOA, CODTIPRECDES,
                                   PLANO, PLACONTA,idPrograma, idempresa);
   MessageInfo := Connection.AppServer.MessageInfo;
End
Else
Begin
   ssql := ' SELECT ' +
        '   (0) AS IDTIPORDXCCXCONTA, ' +
        '   C.CODCENTROCUSTO, ' +
        '   (''' + Espaco(CODTIPRECDES,15)+ ''') AS CODTIPRECDES, ' +
        '   (''' + RecPag + ''') AS RECPAG, ' +
        '   (' + IntToStr(IdPessoa) + ') AS IDPESSOA, ' +
        '   (' + inttostr(Plano) + ') AS PLANO, ' +
        '   (''' + Espaco(Placonta,18) + ''') AS PLACONTA, ' +
        '   (' + IntToStr(IdEmpresa) + ') AS IDEMPRESA, ' +
        '   (' + IntToStr(idPrograma) + ') AS IDPROGRAMA, ' +
        '   C.NOME, ' +
        '   C.STATUSGRUPOCDC ' +
        ' FROM ' +
        '   CENTCUST C ' +
        ' WHERE ' +
        '   C.IDEMPRESA = ' + IntToStr(IdEmpresa) + ' AND ' +
        '   NOT EXISTS ' +
        '       (SELECT ' +
        '          T.IDTIPORDXCCXCONTA ' +
        '        FROM ' +
        '          TIPORDXCCXCONTA T ' +
        '        WHERE ' +
        '          T.RECPAG = ''' + RecPag + ''' AND ' +
        '          T.IDPESSOA = ' + IntToStr(IdPessoa);
   if trim(CODTIPRECDES) <> '' then
      ssql := ssql + '   and RTRIM(T.CODTIPRECDES) = ''' + trim(CodTipRecDes)+ '''' ;
   if PLANO <> 0 then
      ssql := ssql + '  and RTRIM(T.PLANO) = ''' + IntToStr(Plano) +'''';
   if trim(PLACONTA) <> '' then
      ssql := ssql + '  and RTRIM(T.PLACONTA) = ''' + trim(Placonta) + '''';
   if idPrograma = 0 then
      ssql := ssql + ' and T.IDPROGRAMA IS NULL '
   else
      ssql := ssql + ' and T.IDPROGRAMA = ' + IntToStr(idPrograma);
   ssql := ssql + '  and T.IDPESSOA = C.IDEMPRESA ' +
                  '  and T.CODCENTROCUSTO = C.CODCENTROCUSTO ) ' +
                  ' ORDER BY ' +
                  '   C.CODCENTROCUSTO, ' +
                  '   C.NOME ';
   Result := GetDataPacket(ssql);
end;
end;

end.
