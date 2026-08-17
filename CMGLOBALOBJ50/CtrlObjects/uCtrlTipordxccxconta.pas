unit uCtrlTipordxccxconta;

{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Inclusão do Grupo Da Contas [ Orçamento ]
-------------------------------------------------------------------------------------------------- }

{
Rotina............: ListTipordxccxconta1, ListTipordxccxcontaCCustoAsso, ListTipordxccxcontaCCustoNaoAsso, ListTipordxccxconta
N. Sol.............: 122623
N. Kintana......: 603580
Data...............: 13/11/2009
Responsável...: Ricardo Alves
Descrição........: Criação e tratamento dos campos patrocinadora financeiro e
  plano previdenciário financeiro.
}

// Rotina    : Divs
// Data      : 06/06/2006
// Descrição : inserir os campos IDPATRO e PLACONTAPASS
// Pendência : 22515

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbTipordxccxconta, DB, uDataBase,
     DbClient, Wwquery, Provider,uString;

type
  TCtrlTipordxccxconta = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    _DbTipordxccxconta: TDbTipordxccxconta;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    constructor Create;  Override;
    Destructor  Destroy; Override;
    Function  ListTipordxccxconta( Idtipordxccxconta: double = 0;
                                   PLANO            : double = 0 ;
                                   IDPROGRAMA       : double = 0 ;
                                   IDPESSOA         : double = 0 ;
                                   IDEMPRESA        : double = 0;
                                   RECPAG           : String = '';
                                   PLACONTA         : String = '';
                                   CODTIPRECDES     : String = '';
                                   CODCENTROCUSTO   : String = '';
                                   IDGRUPOORCAMEN   : Double = 0 // VANDER CAMPOS - SOL: 172384/9603 KINTANA: 1661662
                                   ): OleVariant;


   // Ricardo A. SOL 122623 KTN 603580
   Function  ListTipordxccxconta1( Idtipordxccxconta: double = 0;
                                   PLANO            : double = 0 ;
                                   IDPROGRAMA       : double = 0 ;
                                   IDPESSOA         : double = 0 ;
                                   IDEMPRESA        : double = 0;
                                   IDPLANO          : double = 0 ; // patrocinadora virou plano previdenciário
                                   RECPAG           : String = '';
                                   CODTIPRECDES     : String = ''; // coloquei este parametro, pois esva dando como duplicado mesmo com o tipo de desembolso diferente
                                   CODCENTROCUSTO   : String = '';
                                   IDGRUPOORCAMEN   : Double = 0 // VANDER CAMPOS - SOL: 172384/9603 KINTANA: 1661662
                                    ): OleVariant;

    // Ricardo A. SOL 122623 KTN 603580
    Function ListTipordxccxcontaCCustoAsso(RECPAG      : string;
                                           IDPESSOA    : integer;
                                           CODTIPRECDES: string  = '';
                                           PLANO       : integer = 0;
                                           PLACONTA    : string  = '';
                                           idPrograma  : integer = 0;
                                           // 05/06/2006 22515
                                           PLACONTAPASS: string = '';
                                           idPlanoPrev : integer= 0): OleVariant;

    // Ricardo A. SOL 122623 KTN 603580
    Function ListTipordxccxcontaCCustoNaoAsso(RECPAG      : string;
                                              IDPESSOA    : integer;
                                              CODTIPRECDES: string  = '';
                                              PLANO       : integer = 0;
                                              PLACONTA    : string  = '';
                                              idPrograma  : integer = 0;
                                              idempresa   : integer = 0;
                                              // 05/06/2006 22515
                                              PLACONTAPASS: string = '';
                                              idPlanoPrev : integer= 0): OleVariant;

    Function ListGrupos(IdGrupoOrcamen : Double = 0): OleVariant;


    function GravarTipordxccxconta: Boolean;
    function AplicaAlteracoes( cdsdata: Olevariant ): boolean;
End;

implementation

{ TCtrlTipordxccxconta }

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

function TCtrlTipordxccxconta.GravarTipoRDxCCxConta: Boolean;
var
  Msg: string;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipoRDxCCxConta( cds.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( Cds, _DbTipordxccxconta, [], [] );
        Msg    := _DbTipordxccxconta.MessageInfo;

        If Not Result Then
           Raise Exception.create( Msg );

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
  _DbTipordxccxconta := TDbTipordxccxconta.Create(Self);
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

function TCtrlTipordxccxconta.AplicaAlteracoes( cdsdata: Olevariant ): boolean;
var
  Msg: string;
  cdslocal: TClientDataset;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarTipoRDxCCxConta_Aplica( cdsdata );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     cdslocal := TClientDataset.Create( Nil );

     Try
        cdslocal.data := cdsdata;
        StartTransaction;
        result := ApplyCds( cdslocal, _DbTipordxccxconta, [], [] );
        Msg    := _DbTipordxccxconta.MessageInfo;

        If Not Result Then
           Raise Exception.create( Msg );

        Commit;
        cdslocal.Free;
     Except
        On E:Exception Do
        Begin
           Rollback;
           cdslocal.Free;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

function TCtrlTipordxccxconta.ListTipordxccxconta ( Idtipordxccxconta, PLANO, IDPROGRAMA,
                    IDPESSOA, IDEMPRESA : double; RECPAG, PLACONTA, CODTIPRECDES, CODCENTROCUSTO : String;
                    IDGRUPOORCAMEN : Double) : OleVariant;
var
  ssql: string;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ListTipordxccxconta( Idtipordxccxconta, PLANO, IDPROGRAMA, IDPESSOA,
               IDEMPRESA, RECPAG, PLACONTA, CODTIPRECDES, CODCENTROCUSTO );
     MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     (* VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
        Adicionado apelido aos campos e tabelas..
        Inclusa a tabela GRUPOORCAMEN *)
     ssql := 'SELECT T.IDTIPORDXCCXCONTA, T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, ' +
                    'T.PLANO, T.PLACONTA, T.CODCENTROCUSTO, T.IDEMPRESA, T.IDPROGRAMA, ' +

                    // Ricardo A. SOL 122623 KTN 603580 -
                    // 22515 - inserir IDPATRO e PLACONTAPASS
                    //'IDPATRO, PLACONTAPASS ' +
                    'T.IDPLANOPREV, T.PLACONTAPASS, ' +

                    //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                    ' T.IDGRUPOORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, ' +
                    ' G.NOMEGRUPOORCAMEN||CHR(13)||P.NOMEPLANOORC DESCGRUPOCONTA' +
                    //FIM    - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662


               ' FROM TIPORDXCCXCONTA T, GRUPOORCAMEN G, PLANOORCAMENTARIO P ' +
               ' WHERE T.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN(+) ' +
               '   AND G.IDPLANOORCAMEN = P.IDPLANOORCAMEN(+) ' ;
               //FIM    - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662

     if IDPROGRAMA <> 0  then
        ssql := ssql + ' AND T.IDPROGRAMA = ' + Floattostr( IDPROGRAMA )
     else
        ssql := ssql + ' AND T.IDPROGRAMA IS NULL';

     if Idtipordxccxconta <> 0  then
        ssql := ssql + ' AND T.IDTIPORDXCCXCONTA = ' + Floattostr( Idtipordxccxconta );

     if PLANO <> 0  then
        ssql := ssql + ' AND T.PLANO = ' + Floattostr( plano );

     if IDPESSOA <> 0  then
        ssql := ssql + ' AND T.IDPESSOA = ' + Floattostr( IDPESSOA );

     if IDEMPRESA <> 0  then
        ssql := ssql + ' AND T.IDEMPRESA = ' + Floattostr( IDEMPRESA );

     if trim( RECPAG ) <> '' then
        ssql := ssql + ' AND T.RECPAG = ' + QuotedStr( Trim( RECPAG ) );

     if trim( PLACONTA ) <> '' then
        ssql := ssql + ' AND T.PLACONTA = ' +  QuotedStr( Trim( PLACONTA ) );

     if trim( CODTIPRECDES ) <> '' then
        ssql := ssql + ' AND T.CODTIPRECDES = ' +  QuotedStr( Trim( CODTIPRECDES ) );

     if trim( CODCENTROCUSTO ) <> '' then
        ssql := ssql + ' AND T.CODCENTROCUSTO = ' +  QuotedStr( Trim( CODCENTROCUSTO ) );

     //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
     if IDGRUPOORCAMEN <> 0 Then
        ssql := ssql + ' and T.IDGRUPOORCAMEN = ' + FloatToStr(IDGRUPOORCAMEN);

     Result := GetDataPacket(ssql);
  end;
end;

function TCtrlTipordxccxconta.ListTipordxccxconta1 ( Idtipordxccxconta, PLANO, IDPROGRAMA,
                    IDPESSOA, IDEMPRESA, IDPLANO : double; RECPAG,
                    CODTIPRECDES   : String; //08/08/2006 - coloquei este parametro, pois esva dando como duplicado mesmo com o tipo de desembolso diferente
                    CODCENTROCUSTO : String;
                    IDGRUPOORCAMEN : Double
                    ) : OleVariant;
var
  ssql: string;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ListTipordxccxconta1( Idtipordxccxconta, PLANO, IDPROGRAMA, IDPESSOA,
               IDEMPRESA, RECPAG,  CODCENTROCUSTO, IDPLANO );
     MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     (* VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
        Adicionado apelido aos campos e tabelas..
        Inclusa a tabela GRUPOORCAMEN *)
     ssql := 'SELECT T.IDTIPORDXCCXCONTA, T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, ' +
                    'T.PLANO, T.PLACONTA, T.CODCENTROCUSTO, T.IDEMPRESA, T.IDPROGRAMA, ' +

                    // Ricardo A. SOL 122623 KTN 603580
                    // 22515 - inserir IDPATRO e PLACONTAPASS
                    //'IDPATRO, PLACONTAPASS ' +
                    'T.IDPLANOPREV, T.PLACONTAPASS, ' +

                    //INICIO - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                    ' T.IDGRUPOORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN, ' +
                    ' G.NOMEGRUPOORCAMEN||CHR(13)||P.NOMEPLANOORC DESCGRUPOCONTA' +
                    //FIM    - VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662


               ' FROM TIPORDXCCXCONTA T, GRUPOORCAMEN G, PLANOORCAMENTARIO P ' +
               ' WHERE T.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN(+) ' +
               '   AND G.IDPLANOORCAMEN = P.IDPLANOORCAMEN(+) ' ;

     if IDPROGRAMA <> 0  then
        ssql := ssql + ' AND T.IDPROGRAMA = ' + Floattostr( IDPROGRAMA )
     else
        ssql := ssql + ' AND T.IDPROGRAMA IS NULL';

     // Ricardo A. SOL 122623 KTN 603580
     if IDPLANO <> 0  then
        ssql := ssql + ' AND T.IDPLANOPREV = ' + Floattostr( IDPLANO )
     else
        ssql := ssql + ' AND T.IDPLANOPREV IS NULL';

     if Idtipordxccxconta <> 0  then
        ssql := ssql + ' AND T.IDTIPORDXCCXCONTA = ' + Floattostr( Idtipordxccxconta );

     if PLANO <> 0  then
        ssql := ssql + ' AND T.PLANO = ' + Floattostr( plano );

     if IDPESSOA <> 0  then
        ssql := ssql + ' AND T.IDPESSOA = ' + Floattostr( IDPESSOA );

     if IDEMPRESA <> 0  then
        ssql := ssql + ' AND T.IDEMPRESA = ' + Floattostr( IDEMPRESA );

     if trim( RECPAG ) <> '' then
        ssql := ssql + ' AND T.RECPAG = ' + QuotedStr( Trim( RECPAG ) );

     if trim( CODTIPRECDES ) <> '' then   //08//08/2006 - coloquei este parâmetro, pois estava dando como duplicado mesmo com o tiporecebdesemb diferente do anterior
       ssql := ssql + ' AND T.CODTIPRECDES = ' +  QuotedStr( Trim( CODTIPRECDES ) );

     if trim( CODCENTROCUSTO ) <> '' then
       ssql := ssql + ' AND T.CODCENTROCUSTO = ' +  QuotedStr( Trim( CODCENTROCUSTO ) )
     else
       ssql := ssql + ' AND T.CODCENTROCUSTO  IS NULL ' ;

     //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
     if IDGRUPOORCAMEN <> 0 Then
        ssql := ssql + ' and T.IDGRUPOORCAMEN = ' + FloatToStr(IDGRUPOORCAMEN);

     Result := GetDataPacket(ssql);
  end;
end;

function TCtrlTipordxccxconta.ListTipordxccxcontaCCustoAsso(RECPAG: string;
  IDPESSOA: integer; CODTIPRECDES: string; PLANO: integer; PLACONTA: string;
  idPrograma: integer;
  //  05/06/2006 22515
  // Ricardo A. SOL 122623 KTN 603580
  PLACONTAPASS: string; idPlanoPrev : integer): OleVariant;
var
  ssql: string;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ListTipordxccxcontaCCustoAsso(RECPAG, IDPESSOA,
               CODTIPRECDES, PLANO, PLACONTA, idPrograma, PLACONTAPASS, idPlanoPrev);
     MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     ssql := 'SELECT T.IDTIPORDXCCXCONTA, T.CODCENTROCUSTO, T.CODTIPRECDES, ' +
                    'T.RECPAG, T.IDPESSOA, T.PLANO, T.PLACONTA, T.IDEMPRESA, ' +
                    'T.IDPROGRAMA, C.NOME, C.STATUSGRUPOCDC, C.CODEXTERNO, ' + //  /02/06/2004 adicionei o codexterno

                    // Ricardo A. SOL 122623 KTN 603580
                    //  22515 - inserir IDPATRO e PLACONTAPASS
                    //'T.IDPATRO, T.PLACONTAPASS ' +
                    'T.IDPLANOPREV, T.PLACONTAPASS, ' +

                    //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
                    'T.IDGRUPOORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN ' +


               'FROM TIPORDXCCXCONTA T, CENTCUST C, GRUPOORCAMEN G ' +
              'WHERE T.RECPAG = ' + QuotedStr( RECPAG ) +
               ' AND T.IDPESSOA = ' + Floattostr( IDPESSOA ) +
               ' AND T.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN(+)';

     If idPrograma = 0 Then
        ssql := ssql + ' AND T.IDPROGRAMA IS NULL '
     Else
        ssql := ssql + ' AND T.IDPROGRAMA = ' + IntToStr( idPrograma );

     If Trim( CODTIPRECDES ) <> '' Then
         ssql := ssql + ' AND RTRIM(T.CODTIPRECDES) = ' + QuotedStr( CODTIPRECDES );

     If PLANO <> 0 Then
        ssql := ssql + ' AND RTRIM(T.PLANO) = ' + QuotedStr( inttostr(PLANO) ) ;

     If Trim( PLACONTA ) <> '' Then
        ssql := ssql + ' AND RTRIM(T.PLACONTA) = ' + QuotedStr( PLACONTA );

     //  05/06/2006 22515
     If Trim( PLACONTAPASS ) <> '' Then
        ssql := ssql + ' AND RTRIM(T.PLACONTAPASS) = ' + QuotedStr( PLACONTAPASS );

     If idPlanoPrev <> 0 Then
        ssql := ssql + ' AND RTRIM(T.IDPLANOPREV) = ' + QuotedStr( inttostr(idPlanoPrev) ) ;
     // FIM  05/06/2006 22515

     ssql := ssql + '  AND T.IDPESSOA = C.IDEMPRESA ' +
                    '  AND T.CODCENTROCUSTO = C.CODCENTROCUSTO ' +
                    'ORDER BY C.CODEXTERNO, C.NOME'; //  /02/06/2004 adicionei o codexterno
     Result := GetDataPacket(ssql);
  end;
end;

function TCtrlTipordxccxconta.ListTipordxccxcontaCCustoNaoAsso(
  RECPAG: string; IDPESSOA: integer; CODTIPRECDES : string ; PLANO : integer; PLACONTA : string;
  idPrograma, idempresa : integer;
  // 05/06/2006 22515
  // Ricardo A. SOL 122623 KTN 603580
  PLACONTAPASS: string; idPlanoPrev: integer): OleVariant;
var
  ssql: string;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ListTipordxccxcontaCCustoNaoAsso(RECPAG, IDPESSOA,
                          CODTIPRECDES, PLANO, PLACONTA,idPrograma, idempresa, PLACONTAPASS, idPlanoprev);
     MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     ssql := 'SELECT ( 0 ) AS IDTIPORDXCCXCONTA, ' +
                    'C.CODCENTROCUSTO, ' +
                    '(' + QuotedStr( Espaco( CODTIPRECDES, 15 ) ) + ') AS CODTIPRECDES, ' +
                    '(' + QuotedStr( RecPag ) + ') AS RECPAG, ' +
                    '(' + IntToStr( IdPessoa) + ') AS IDPESSOA, ' +
                    '(' + inttostr( Plano) + ') AS PLANO, ' +
                    '(' + QuotedStr( Espaco( Placonta, 18 ) ) + ') AS PLACONTA, ' +
                    '(' + IntToStr( IdEmpresa ) + ') AS IDEMPRESA, ' +
                    '(' + IntToStr( idPrograma ) + ') AS IDPROGRAMA, ' +
                    'C.NOME, ' +
                    'C.STATUSGRUPOCDC, C.CODEXTERNO, ' + //  /02/06/2004 adicionei o codexterno
                    // 05/06/2006 22515
                    '(' + QuotedStr( Espaco( Placontapass, 18 ) ) + ') AS PLACONTAPASS, ' +

                    // Ricardo A. SOL 122623 KTN 603580
                    '(' + inttostr( idPlanoPrev) + ') AS IDPLANOPREV ' +
                    // FIM 05/06/2006 22515

               'FROM CENTCUST C, (SELECT IDPLANCENTCUST FROM PARAMGLOBAL WHERE IDPESSOA = ' + IntToStr(IdPessoa) + ') P ' +
              'WHERE C.IDEMPRESA = ' + IntToStr( IdEmpresa ) +
              '  AND C.ATIVO = ''S'' ' +
              '  AND C.IDPLANCENTCUST = P.IDPLANCENTCUST ' +
               ' AND NOT EXISTS ( SELECT T.IDTIPORDXCCXCONTA ' +
                                   'FROM TIPORDXCCXCONTA T ' +
                                  'WHERE T.RECPAG = ' + QuotedStr( RecPag ) +
                                   ' AND T.IDPESSOA = ' + IntToStr(IdPessoa);

     if trim(CODTIPRECDES) <> '' then
        ssql := ssql + ' AND RTRIM(T.CODTIPRECDES) = ' + QuotedStr( Trim( CodTipRecDes) );

     if PLANO <> 0 then
        ssql := ssql + ' AND RTRIM(T.PLANO) = ' + QuotedStr( IntToStr( Plano ) );

     if trim(PLACONTA) <> '' then
        ssql := ssql + ' AND RTRIM(T.PLACONTA) = ' + QuotedStr( trim( Placonta ) );

     if idPrograma = 0 then
        ssql := ssql + ' AND T.IDPROGRAMA IS NULL '
     else
        ssql := ssql + ' AND T.IDPROGRAMA = ' + IntToStr(idPrograma);

     // 05/06/2006 22515
     If Trim( PLACONTAPASS ) <> '' Then
        ssql := ssql + ' AND RTRIM(T.PLACONTAPASS) = ' + QuotedStr( PLACONTAPASS );

     // Ricardo A. SOL 122623 KTN 603580
     If idPlanoPrev <> 0 Then
        ssql := ssql + ' AND RTRIM(T.IDPLANOPREV) = ' + QuotedStr( inttostr(idPlanoPrev) ) ;
     // FIM  05/06/2006 22515

     ssql := ssql + '  AND C.IDEMPRESA = T.IDPESSOA ' +
                    '  AND C.CODCENTROCUSTO = T.CODCENTROCUSTO ) ' +

                    'ORDER BY C.CODEXTERNO, C.NOME'; // /02/06/2004 adicionei o codexterno
     Result := GetDataPacket(ssql);
  end;
end;

function TCtrlTipordxccxconta.ListGrupos(IdGrupoOrcamen: Double) : OleVariant;
Var
  sSQL : String;
begin

  sSQL := 'SELECT'
        + '  G.IDGRUPOORCAMEN,'
        + '  G.NOMEGRUPOORCAMEN,'
        + '  G.CODGRUPOORC,'
        + '  G.FLGANALSINT,'
        + '  G.FLGSINALGRUPO,'
        + '  G.FLGRESULTADO,'
        + '  G.IDPLANOORCAMEN,'
        + '  G.IDFORMORCADO'
        + ' FROM GRUPOORCAMEN G ';

  if IdGrupoOrcamen > 0 Then
     sSQL := sSQL + ' WHERE G.IDGRUPOORCAMEN = ' + FloatToStr(IdGrupoOrcamen);

  Result := GetDataPacket(sSQL);

end;

end.


