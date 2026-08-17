unit uCtrlTiporecebdesemb;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTiporecebdesemb, uSistema, DB, uDataBase,
DbClient {$IFDEF VER0505} {$ELSE} ,uCMTypes{$ENDIF};

type
  TCtrlTiporecebdesemb = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
     procedure OnCreateAppServer; Override;
  private
    _DbTiporecebdesemb : TDbTiporecebdesemb;
    Fcds   : TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds : TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function ListTiporecebdesemb( RECPAG : string;
                                  IDPESSOA: integer;
                                  ANASINT : string = '';
                                  FLGCALCULAIMPOSTO : string = '';
                                  CODTIPRECDES : string = '') : OleVariant;
    Function ListTipoRecebDesembxTipoCli ( RECPAG : string = '';
                                           IDPESSOA: integer = 0;
                                           IDTIPOCLIENTE : integer = 0): OleVariant;
    Function ListTiporecebDesenbNaoAssoc( RECPAG : STRING = '';
                                          IDPESSOA : integer = 0;
                                          IDTIPOCLIENTE  : integer = 0) : OleVariant;
    Function ListRamoTiporecebDesenbNaoAssoc( RECPAG : STRING = '';
                                              IDPESSOA : integer = 0;
                                              IDRAMOFORNECEDOR  : integer = 0) : OleVariant;
    Function ListTipoRecebDesembxRamoForn ( RECPAG : string = '';
                                           IDPESSOA: integer = 0;
                                           IDRAMOFORNECEDOR : integer = 0): OleVariant;
    Function ListTiporecebDesenbxFornxdesenb( RECPAG : string;
                                              IDPESSOA,
                                              IDPESSOAforn : double;
                                              ANASINT : string) : OleVariant;
    Function ListTiporecebDesenbxRAMOXDESEMB(RECPAG : string;
                                             IDPESSOA,
                                             IDPESSOAFORNXRAMO : double;
                                             ANASINT : string) : OleVariant;
    Function ListTiporecebDesenbxCLIXRECEB(RECPAG : string;
                                           IDPESSOA,
                                           IDPESSOACLIXRECEB : double;
                                           ANASINT : string) : OleVariant;
    function ListTiporecebDesenbxCLIXTIPOCLI(RECPAG : string;
                                             IDPESSOA,
                                             IDPESSOACLIXTIPOCLI : double;
                                             ANASINT : string) : OleVariant;

    Function GravarTipoRecebDesemb: Boolean;
    Function ListParamCap (idpessoa : double) : OleVariant;
End;

implementation

{ TCtrlTiporecebdesemb }

function TCtrlTiporecebdesemb.GravarTipoRecebDesemb: Boolean;
var Msg : string;
begin
   If ConnectionSide = cnsClient Then
   Begin
      Result := Connection.AppServer.GravarTipoRecebDesemb(cds.Data);
      If Not Result Then MessageInfo := Connection.AppServer.MessageInfo;
   End
   Else
   Begin
   Try
        StartTransaction;
        Result := ApplyCds(Cds,_DbTiporecebdesemb,[],[]);
        Msg    := _DbTiporecebdesemb.MessageInfo;

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

constructor TCtrlTiporecebdesemb.Create;
begin
  inherited;
  _DbTiporecebdesemb := TDbTiporecebdesemb.Create(self);
end;

destructor TCtrlTiporecebdesemb.Destroy;
begin
  _DbTiporecebdesemb.Free;
  if isAppServer then FCds.Free;
  inherited;
end;

procedure TCtrlTiporecebdesemb.DoChangeDataBase;
begin
  inherited;
  _DbTiporecebdesemb.DataBaseName := DataBaseName;
end;

function TCtrlTiporecebdesemb.ListTiporecebdesemb( RECPAG : string; IDPESSOA: integer;
        ANASINT, FLGCALCULAIMPOSTO, CODTIPRECDES : string ) : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT '+
           'CODTIPRECDES, '+
           'RECPAG, '+
           'IDPESSOA, '+
           'PLACONTACREDITO, '+
           'PLANO, '+
           'PLACONTA, '+
           'IDUSUARIOINCLUSAO, '+
           'DESCRICAO, '+
           'ANASINT, '+
           'FLGOBRIGARESERVA, '+
           'FLGCALCULAIMPOSTO, '+
           'IDTIPOAVALIACAO, '+
           'FLGINDICARECDES, '+
           'HITCODHIST, '+
           'CODCORRESP, '+
           'CODSUBCONTA, '+
           'CODSUBCONTACRE '+
           '  FROM                               '+
           '    TIPORECEBDESEMB                  '+
           '  WHERE (IDPESSOA = '+floattostr(IDPESSOA)+') '+
           '    and (RECPAG   = '+quotedstr(RECPAG)+') ';
   if trim(ANASINT) <> '' then
      ssql := ssql + '    And (ANASINT  = '''+trim(ANASINT)+''')             ';
   if trim(FLGCALCULAIMPOSTO) <> '' then
      ssql := ssql + '    and (FLGCALCULAIMPOSTO = '''+trim(FLGCALCULAIMPOSTO)+''')        ';
   if trim(CODTIPRECDES) <> '' then
      ssql := ssql + '   and  RTRIM(CODTIPRECDES) = '''+trim(CODTIPRECDES)+'''        ';
   ssql := ssql + '    ORDER BY                           '+
                  '    CODTIPRECDES, DESCRICAO';
   Result := GetDataPacket(ssql);
end;

procedure TCtrlTiporecebdesemb.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

function TCtrlTiporecebdesemb.ListTipoRecebDesembxTipoCli(RECPAG: string;
  IDPESSOA: integer; IDTIPOCLIENTE : integer): OleVariant;
var ssql : string;
begin
   ssql := 'SELECT '+
           '    TX.CODTIPRECDES,TX.RECPAG,TX.IDPESSOA,TR.DESCRICAO,TR.ANASINT, '+
           '    TX.IDTIPOCLIXRECEB, TX.IDTIPOCLIENTE '+
           'FROM '+
           '    TIPORECEBDESEMB TR, '+
           '    TIPOCLIXRECEB  TX '+
           'WHERE '+
           '    TR.RECPAG = '''+RECPAG+''' AND '+
           '    TR.IDPESSOA = '+inttostr(IDPESSOA)+' AND ';
   if IDTIPOCLIENTE <> 0 then
      Ssql := ssql + '    TX.IDTIPOCLIENTE = '+inttostr(IDTIPOCLIENTE)+'  AND ';
   Ssql := ssql + '    TR.CODTIPRECDES = TX.CODTIPRECDES AND '+
           '    TR.RECPAG       = TX.RECPAG AND '+
           '    TR.IDPESSOA     = TX.IDPESSOA '+
           'ORDER BY '+
           '    TR.CODTIPRECDES, TR.ANASINT ';
   Result := GetDataPacket(ssql);
end;

function TCtrlTiporecebdesemb.ListTiporecebDesenbNaoAssoc(RECPAG: STRING;
  IDPESSOA, IDTIPOCLIENTE : integer): OleVariant;
var ssql : string;
begin
   ssql := 'SELECT CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT '+
           'FROM TIPORECEBDESEMB '+
           'WHERE (RECPAG = '''+RECPAG+''') AND '+
           '      (IDPESSOA = '+inttostr(IDPESSOA)+') AND '+
           '      (CODTIPRECDES NOT IN '+
           '        (SELECT CODTIPRECDES '+
           '           FROM TIPOCLIXRECEB '+
           '           WHERE IDTIPOCLIENTE = '+inttostr(IDTIPOCLIENTE)+')) '+
           'ORDER BY CODTIPRECDES, ANASINT ';
   Result := GetDataPacket(ssql);
end;

function TCtrlTiporecebdesemb.ListParamCap(idpessoa: double): OleVariant;
begin
   Result := GetDataPacket('SELECT '+
                        'P.FLGTRDXCCXCONTA, '+
                        'P.FLGTRDXIMPOSTOS '+
                        'FROM '+
                        'PARAMCAP P '+
                        'WHERE '+
                        'P.IDPESSOA = '+FloatToStr(IdPessoa));
end;

function TCtrlTiporecebdesemb.ListTiporecebDesenbxFornxdesenb( RECPAG : String;
                                                               IDPESSOA,
                                                               IDPESSOAforn : double;
                                                               ANASINT : string) : OleVariant;
var ssql : string;
begin
   ssql :='SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
       '   T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO,  '+
       '   T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  '+
       ' FROM TIPORECEBDESEMB T, FORNXDESEMB F ' +
       ' WHERE (T.ANASINT       = '''+ANASINT+''') AND ' +
       '       (T.RECPAG        = '''+RecPag+''') AND  ' +
       '       (T.IDPESSOA      = '+FloattoStr(idpessoa)+ ') AND ' +
       '       (F.IDPESSOA      = '+FloatToStr(IdpessoaForn) + ') AND ' +
       '       (F.RECPAG        = T.RECPAG) AND  ' +
       '       (F.IDEMPRESAPROP = T.IDPESSOA) AND ' +
       '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
       ' ORDER BY T.DESCRICAO';
   Result := GetDataPacket(ssql);
end;

function TCtrlTiporecebdesemb.ListTiporecebDesenbxRAMOXDESEMB(RECPAG : string;
                                                              IDPESSOA,
                                                              IDPESSOAFORNXRAMO : double;
                                                              ANASINT : string) : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
        '  T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, '+
        '  T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO '+
        ' FROM TIPORECEBDESEMB T, RAMOXDESEMB R ' +
        ' WHERE (T.ANASINT          = '''+ANASINT+''') AND ' +
        '       (T.RECPAG           = '''+RecPag+''') AND  ' +
        '       (T.IDPESSOA         = ' + Floattostr(idPESSOA) + ') AND ' +
        '       (R.IDRAMOFORNECEDOR IN (SELECT IDRAMOFORNECEDOR  '+
        '                                FROM FORNXRAMO WHERE IDPESSOA = ' + FloatToStr(IDPESSOAFORNXRAMO) + ')) AND ' +
        '       (R.RECPAG           = T.RECPAG)   AND ' +
        '       (R.IDPESSOA         = T.IDPESSOA) AND ' +
        '       (R.CODTIPRECDES     = T.CODTIPRECDES) ' +
        ' ORDER BY T.DESCRICAO';
   Result := GetDataPacket(ssql);
end;

function TCtrlTiporecebdesemb.ListTiporecebDesenbxCLIXRECEB(RECPAG : string;
                                                            IDPESSOA,
                                                            IDPESSOACLIXRECEB : double;
                                                            ANASINT : string) : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, ' +
        '   T.IDUSUARIOINCLUSAO, T.DESCRICAO, T.ANASINT, T.PLACONTACREDITO, '+
        '   T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO  '+
        ' FROM TIPORECEBDESEMB T, CLIXRECEB F ' +
        ' WHERE (T.ANASINT       = '''+ANASINT+''') AND ' +
        '       (T.RECPAG        = '''+RecPag+''') AND  ' +
        '       (T.IDPESSOA      = '+FloattoStr(idpessoa)+ ') AND ' +
        '       (F.IDPESSOA      = '+FloatToStr(IdpessoaCLIXRECEB) + ') AND ' +
        '       (F.RECPAG        = T.RECPAG) AND  ' +
        '       (F.IDEMPRESA     = T.IDPESSOA) AND ' +
        '       (F.CODTIPRECDES  = T.CODTIPRECDES) ' +
        ' ORDER BY T.DESCRICAO';
   Result := GetDataPacket(ssql);
end;

function TCtrlTiporecebdesemb.ListTiporecebDesenbxCLIXTIPOCLI(RECPAG : string;
                                                            IDPESSOA,
                                                            IDPESSOACLIXTIPOCLI : double;
                                                            ANASINT : string) : OleVariant;
var ssql : string;
begin
   ssql := 'SELECT DISTINCT T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, '+
        '  T.PLANO, T.PLACONTA, T.IDUSUARIOINCLUSAO, T.DESCRICAO, '+
        '  T.ANASINT, T.PLACONTACREDITO, T.FLGOBRIGARESERVA, T.FLGCALCULAIMPOSTO '+
        '  FROM TIPORECEBDESEMB T, TIPOCLIXRECEB TR ' +
        ' WHERE (T.ANASINT     = '''+ANASINT+''') AND ' +
        '  (T.RECPAG           = '''+RecPag+''') AND  ' +
        '  (T.IDPESSOA         = ' + FloattoStr(IdPessoa) + ') AND ' +
        '  (TR.IDTIPOCLIENTE IN (SELECT IDTIPOCLIENTE  '+
        '                          FROM CLIXTIPOCLI WHERE IDPESSOA = ' + FloatToStr(IDPESSOACLIXTIPOCLI) + ')) AND ' +
        '       (TR.RECPAG           = T.RECPAG)   AND ' +
        '       (TR.IDPESSOA         = T.IDPESSOA) AND ' +
        '       (TR.CODTIPRECDES     = T.CODTIPRECDES) ' +
        ' ORDER BY T.DESCRICAO';
   Result := GetDataPacket(ssql);
End;

procedure TCtrlTiporecebdesemb.OnCreateAppServer;
begin
  inherited;
  FCds := TClientDataSet.Create(nil);
end;

function TCtrlTiporecebdesemb.ListRamoTiporecebDesenbNaoAssoc(
  RECPAG: STRING; IDPESSOA, IDRAMOFORNECEDOR: integer): OleVariant;
var ssql : string;
begin
   ssql := 'SELECT CODTIPRECDES,RECPAG,IDPESSOA,DESCRICAO,ANASINT '+
           'FROM TIPORECEBDESEMB '+
           'WHERE (RECPAG = '''+RECPAG+''') AND '+
           '      (IDPESSOA = '+inttostr(IDPESSOA)+') AND '+
           '      (CODTIPRECDES NOT IN '+
           '        (SELECT CODTIPRECDES '+
           '           FROM RAMOXDESEMB '+
           '           WHERE IDRAMOFORNECEDOR = '+inttostr(IDRAMOFORNECEDOR)+')) '+
           'ORDER BY CODTIPRECDES, ANASINT ';
   Result := GetDataPacket(ssql);
end;

function TCtrlTiporecebdesemb.ListTipoRecebDesembxRamoForn(RECPAG: string;
  IDPESSOA, IDRAMOFORNECEDOR: integer): OleVariant;
var ssql : string;
begin
   ssql := 'SELECT RX.CODTIPRECDES,RX.RECPAG,RX.IDPESSOA,TR.DESCRICAO,TR.ANASINT, '+
           '  RX.IDRAMOXDESEMB, RX.IDRAMOFORNECEDOR '+
           ' FROM TIPORECEBDESEMB TR, RAMOXDESEMB RX '+
           ' WHERE TR.RECPAG = '''+RECPAG+''' AND '+
           '       TR.IDPESSOA = '+inttostr(IDPESSOA)+' AND ';
   if IDRAMOFORNECEDOR <> 0 then
      Ssql := ssql + '    RX.IDRAMOFORNECEDOR = '+inttostr(IDRAMOFORNECEDOR)+' AND ';
   Ssql := ssql + '    TR.CODTIPRECDES = RX.CODTIPRECDES AND '+
                  '    TR.RECPAG       = RX.RECPAG AND '+
                  '    TR.IDPESSOA     = RX.IDPESSOA '+
                  ' ORDER BY  TR.CODTIPRECDES, TR.ANASINT ';
   Result := GetDataPacket(ssql);
end;

end.

