{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlCentroCusto;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uDbCentroCusto, uSistema, uDbTipoRdxCcxConta, uDbContasxcc, uMidasUtil;

Type
  { tccSoSintetica => Somente Sinteticos
    tccSoAnalitica    => Somente Analiticos
    tccAmbos => Todos
  }
  TTipoCentCust = (tccSoSintetica,tccSoAnalitica,tccAmbos);
  { toccCodigo  => Ordernar  por codigo
    toccNome    => Ordernar  por nome
  }
  TTipoOrdemCentCust  = (toccCodigo, toccNome);

  TCtrlCentroCusto = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
    Procedure OnCreateAppServer; Override;
  private
    //-------------------------------------------------------------------------
    // Classes de Persistência
    //-------------------------------------------------------------------------
    _DbCentroCusto: TDbCentroCusto;
    _DbTipoRdxCcxConta: TDbTipoRdxCcxConta;
    _DbContasxcc: TDbContasxcc;
    Fcds: TClientDataSet;
    FcdsAranha: TClientDataSet;
    FcdsContas: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsAranha(const Value: TClientDataSet);
    procedure SetcdsContas(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property cdsAranha: TClientDataSet read FcdsAranha write SetCdsAranha;
    Property cdsContas: TClientDataSet read FcdsContas write SetCdsContas;
    //-------------------------------------------------------------------------
    // Métodos
    //-------------------------------------------------------------------------
    constructor Create;  Override;
    Destructor  Destroy; Override;
    //-------------------------------------------------------------------------
    // Metodos da Regra de Negócio
    //-------------------------------------------------------------------------
    Procedure Procurar( IdEmpresa: Double = 0; IdCentroCusto: String = '' );
    Function  ReplicarCC( IdEmpresa: Double; IdCentroCusto: String;
              IdCentroCustoOrigem: String ): Boolean;
    Function  ReplicarAranha( IdEmpresa: Double; IdCentroCusto: String;
              IdCentroCustoOrigem: String ): Boolean;
    Function  ListaCentroCusto( IdEmpresa: Double = 0; IdCentroCusto: String = '';
                                bativo: Boolean = True; iOrdem: Integer = 0 ): OleVariant;
    function  ListaCCustoUsr( IdEmpresa: Double = 0; IdUsuario: Double = 0; 
                              iOrdem: Integer = 0 ): OleVariant;
    function  ListaAranhaXCC(IdEmpresa: Double; IdCentroCusto: String): OleVariant;
    function  ListaContasXCC(IdEmpresa: Double; IdCentroCusto: String): OleVariant;
    function  ListaCentCustCompleto(idUsuario,idEmpresa,iPlano: Double;
                 sPlaConta : String;
                 TipoCentCust : TTipoCentCust;
                 TipoOrdemCentCust: TTipoOrdemCentCust) : OleVariant;
    Function  Excluir: Boolean;
    Function  Gravar: Boolean;
  End;

implementation
{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlCentroCusto.Create;
begin
  inherited;
  _DbCentroCusto := TDbCentroCusto.Create(Self);
  _DbContasxcc   := TDbContasxcc.Create(Self);
  _DbTipoRdxCcxConta := TDbTipordxccxconta.Create(Self);
end;

destructor TCtrlCentroCusto.Destroy;
begin
  If IsAppServer Then
     FreeCds( [ Fcds, FcdsAranha, FcdsContas ] );

  _DbContasxcc.Free;
  _DbTipoRdxCcxConta.Free;
  _DbCentroCusto.Free;

  inherited;
end;

procedure TCtrlCentroCusto.DoChangeDataBase;
begin
  inherited;
  _DbCentroCusto.DataBaseName := DatabaseName;
  _DbContasxcc.DataBaseName := DatabaseName;
  _DbTipoRdxCcxConta.DataBaseName := DatabaseName;
end;

procedure TCtrlCentroCusto.OnCreateAppServer;
begin
  inherited;
  FCds       := TClientDataSet.Create(nil);
  FCdsContas := TClientDataSet.Create(nil);
  FCdsAranha := TClientDataSet.Create(nil);
end;

function TCtrlCentroCusto.Excluir: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ExcluirCentroCusto( Fcds.Data, fcdsAranha.Data, FcdsContas.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        Result := ApplyCds( fcdsaranha, _DbTipordxccxconta, [], [] );
        Msg    := _DbTipoRdxCcxConta.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Result := ApplyCds( fcdscontas, _DbContasXCC, [], [] );
        Msg    := _DbContasXCC.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Result := ApplyCds( fcds, _DbCentroCusto, [], [] );
        Msg    := _DbCentroCusto.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

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

function TCtrlCentroCusto.Gravar: Boolean;
Var
  Msg: String;
  _CdsAranha, _CdsContas: TClientDataset;
begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.GravarCentroCusto( Fcds.Data, fcdsAranha.Data, FcdsContas.Data );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        _CdsAranha := TClientDataset.Create( nil );
        _CdsContas := TClientDataset.Create( nil );
        _CdsAranha.Data := FCdsAranha.Data;
        _CdsContas.Data := FCdsContas.Data;
        StartTransaction;
        Result := ApplyCds( fcds, _DbCentroCusto, [], [] );
        Msg    := _DbCentroCusto.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Result := ApplyCds( _cdsAranha, _DbTipordxccxconta, [_DbCentroCusto.IdEmpresa, _DbCentroCusto.CodCentroCusto],
                            [_DbTipoRdxCcxConta.IdEmpresa, _DbTipoRdxCcxConta.CodCentroCusto] );
        Msg    := _DbTipoRdxCcxConta.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Result := ApplyCds( _cdsContas, _DbContasXCC, [_DbCentroCusto.IdEmpresa, _DbCentroCusto.CodCentroCusto],
                            [_DbContasXCC.IdEmpresa, _DbContasXCC.CodCentroCusto] );
        Msg    := _DbContasXCC.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

        Commit;
        _CdsAranha.Free;
        _CdsContas.Free;
     Except
        On E:Exception Do
        Begin
           Rollback;
           _CdsAranha.Free;
           _CdsContas.Free;
           Result := False;
           MessageInfo := E.Message;
        End;
     End;
  End;
end;

Function TCtrlCentroCusto.ReplicarCC( IdEmpresa: Double; IdCentroCusto: String;
         IdCentroCustoOrigem: String ): Boolean;
var
  sql, Msg: String;
Begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ReplicarCC( IdEmpresa, IdCentroCusto, IdCentroCustoOrigem );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        sql := 'DELETE FROM CONTASXCC WHERE RTRIM( CODCENTROCUSTO ) = ' + QuotedStr( Trim( IdCentroCusto ) ) +
               ' AND IDEMPRESA = ' + FloatToStr( IdEmpresa );
        Result := ExecSql( Sql );

        sql := 'INSERT INTO CONTASXCC ( PLANO, PLACONTA, IDEMPRESA, IDUSUARIOINCLUSAO, CODCENTROCUSTO ) ' +
               '( SELECT PLANO, PLACONTA, IDEMPRESA, IDUSUARIOINCLUSAO, ' + QuotedStr( Trim( IdCentroCusto ) ) +
                  ' FROM CONTASXCC WHERE RTRIM( CODCENTROCUSTO ) = ' + QuotedStr( Trim( IdCentroCustoOrigem ) ) +
                       ' AND IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' )';
        Result := ( Result And ExecSql( Sql ) );
        Msg    := _DbCentroCusto.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

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
End;

Function TCtrlCentroCusto.ReplicarAranha( IdEmpresa: Double; IdCentroCusto: String;
         IdCentroCustoOrigem: String ): Boolean;
var
  sql, Msg: String;
Begin
  If ConnectionSide = cnsClient Then Begin
     Result := Connection.AppServer.ReplicarAranha( IdEmpresa, IdCentroCusto,
                          IdCentroCustoOrigem );

     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End Else Begin
     Try
        StartTransaction;
        sql := 'DELETE FROM TIPORDXCCXCONTA WHERE RTRIM( CODCENTROCUSTO ) = ' + QuotedStr( IdCentroCusto ) +
               'AND IDEMPRESA = ' + FloatToStr( IdEmpresa );
        Result := ExecSql( Sql );

        sql := 'INSERT INTO TIPORDXCCXCONTA ( IDTIPORDXCCXCONTA, IDEMPRESA, IDPROGRAMA, ' +
                      'PLANO, PLACONTA, IDPESSOA, RECPAG, CODTIPRECDES, CODCENTROCUSTO ) ' +
               '( SELECT SEQTIPORDXCCXCONTA.NEXTVAL, IDEMPRESA, IDPROGRAMA, PLANO, PLACONTA, ' +
                 'IDPESSOA, RECPAG, CODTIPRECDES, ' + QuotedStr( Trim( IdCentroCusto ) ) +
                  ' FROM TIPORDXCCXCONTA WHERE RTRIM( CODCENTROCUSTO ) = ' + QuotedStr( Trim( IdCentroCustoOrigem ) ) +
                       ' AND IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' )';

        Result := ( Result And ExecSql( Sql ) );
        Msg    := _DbCentroCusto.MessageInfo;

        If Not Result Then
           Raise Exception.Create( Msg );

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
End;

function TCtrlCentroCusto.ListaCentroCusto( IdEmpresa: Double; IdCentroCusto: String;
                                            bativo: Boolean; iOrdem: Integer ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.IDEMPRESA, C.CODCENTROCUSTO, C.NOME, C.RESPONSAVEL, ' +
         'P.NOME AS NOMEEMPRESA, C.IDUSUARIOINCLUSAO, Q.NOME AS NOMEUSUARIOINCLUSAO, ' +
         'C.IDUSUARIO, U.NOMEUSUARIO, C.CODREDUZIDO, C.CODCORRESP, C.ATIVO, ' +
         'C.STATUSGRUPOCDC, C.IDPROGRAMA ' +
         'FROM CENTCUST C, PESSOA P, PESSOA Q, PROGRAMA R, USUARIOSISTEMA U ' +
         'WHERE P.IDPESSOA = C.IDEMPRESA ' +
           'AND Q.IDPESSOA = C.IDUSUARIOINCLUSAO ' +
           'AND U.IDUSUARIO(+) = C.IDUSUARIO ' +
           'AND R.IDPROGRAMA(+) = C.IDPROGRAMA ';

  If IdEmpresa <> 0 Then
     Sql := Sql + ' AND C.IDEMPRESA = ' + FloatToStr( IdEmpresa );

  If idCentroCusto <> '' Then
     Sql := Sql + ' AND C.CODCENTROCUSTO = ' + QuotedStr( Trim( IdCentroCusto ) );

  If bativo Then
     Sql := Sql + ' AND ATIVO = ''S''';

  If iOrdem = 0 then
     Sql := Sql + ' ORDER BY C.NOME'
  else
     Sql := Sql + ' ORDER BY C.CODCENTROCUSTO';

  Result := GetDataPacket( Sql );
end;

// Lista centro de custo por usuario
function TCtrlCentroCusto.ListaCCustoUsr( IdEmpresa: Double; IdUsuario: Double;
                                          iOrdem: Integer ): OleVariant;
var
  sql: String;
begin
   Sql := 'SELECT CODCENTROCUSTO, IDEMPRESA, NOME ' +
           'FROM CENTCUST ' +
          'WHERE IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' ' +
            'AND STATUSGRUPOCDC = ''A'' ' +
            // Gleyber - Pendência 14239 - 10/07/2003
            // Alterado para pegar Centros de Custos Ativos
            'AND ATIVO  = ''S'' '+
            //
            'AND ( CODCENTROCUSTO IN ' +
                  '( SELECT CODCENTROCUSTO ' +
                      'FROM USCCUSTO ' +
                     'WHERE IDUSUARIO = ' + FloatToStr( IdUsuario ) + ' ' +
                       'AND IDEMPRESA = ' + FloatToStr( IdEmpresa ) + ' ) ) ';

  Case IOrdem Of
       0: Sql := Sql + 'ORDER BY NOME';
       1: Sql := Sql + 'ORDER BY CODCENTROCUSTO';
  End;

  Result := GetDataPacket( Sql );
end;

function TCtrlCentroCusto.ListaContasXCC( IdEmpresa: Double; IdCentroCusto: String ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT C.PLANO, C.PLACONTA, C.CODCENTROCUSTO, C.IDEMPRESA, C.IDUSUARIOINCLUSAO, P.PLANOME ' +
         'FROM CONTASXCC C, PLANOCONTA P ' +
         'WHERE RTRIM( C.CODCENTROCUSTO ) = ' + QuotedStr( Trim( IdCentroCusto ) ) +
          ' AND C.IDEMPRESA = ' + FloatToStr( IdEmpresa ) +
          ' AND P.PLANO = C.PLANO AND P.PLACONTA = C.PLACONTA';
  Result := GetDataPacket( Sql );
end;

function TCtrlCentroCusto.ListaAranhaXCC( IdEmpresa: Double; IdCentroCusto: String ): OleVariant;
var
  sql: String;
begin
  Sql := 'SELECT T.IDTIPORDXCCXCONTA, T.CODTIPRECDES, T.RECPAG, T.IDPESSOA, ' +
         'T.PLANO, T.PLACONTA, T.CODCENTROCUSTO, T.IDEMPRESA, T.IDPROGRAMA, ' +
         'C.PLANOME, P.DESCPROGRAMA, R.DESCRICAO ' +
         'FROM TIPORDXCCXCONTA T, PLANOCONTA C, PROGRAMA P, TIPORECEBDESEMB R ' +
         'WHERE RTRIM( T.CODCENTROCUSTO ) = ' + QuotedStr( Trim( IdCentroCusto ) ) +
          ' AND T.IDEMPRESA = ' + FloatToStr( IdEmpresa ) +
          ' AND C.PLANO = T.PLANO' +
          ' AND C.PLACONTA = T.PLACONTA' +
          ' AND T.RECPAG = R.RECPAG' +
          ' AND T.IDPESSOA = R.IDPESSOA' +
          ' AND T.CODTIPRECDES = R.CODTIPRECDES' +
          ' AND T.IDPROGRAMA = P.IDPROGRAMA(+)';
  Result := GetDataPacket( Sql );
end;

function TCtrlCentroCusto.ListaCentCustCompleto(idUsuario,idEmpresa,iPlano: Double;
               sPlaConta : String;
               TipoCentCust : TTipoCentCust;
               TipoOrdemCentCust: TTipoOrdemCentCust) : OleVariant;
var
  sSQl : String;
begin
   if (sPlaConta <> '') and (iPlano <> 0) then begin
      sSql := 'SELECT                                        '+
              '   C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC '+
              'FROM                                          '+
              '   CENTCUST C,                                '+
              '   CONTASXCC CC                               '+
              'WHERE (CC.PLANO = '+FloatToStr(iPlano)+')     '+
              '  AND (CC.PLACONTA = '''+Copy(trim(sPlaConta)+'                   ',1,18)+''')'+
              '  AND (CC.IDEMPRESA = '+FloatToStr(IdEmpresa)+')'+
              '  AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))  '+
              '  AND (CC.CODCENTROCUSTO = C.CODCENTROCUSTO)    '+
              '  AND (CC.IDEMPRESA = C.IDEMPRESA)              ';
      Case TipoCentCust of
         tccSoSintetica : sSql := sSql +'  AND (C.STATUSGRUPOCDC = ''S'')  ';
         tccSoAnalitica : sSql := sSql +'  AND (C.STATUSGRUPOCDC = ''A'')  ';
      end;
      Case TipoOrdemCentCust of
         toccCodigo : sSql := sSql +'ORDER BY C.CODCENTROCUSTO ';
         toccNome   : sSql := sSql +'ORDER BY C.NOME           ';
      end;
   end else begin
      sSql := 'SELECT U.CODCENTROCUSTO, U.NOME, U.STATUSGRUPOCDC      '+
              'FROM (                                                 '+
              '   SELECT C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC   '+
              '   FROM CENTCUST C                                     '+
              '   WHERE (C.IDEMPRESA = '+FloatToStr(IdEmpresa)+')     '+
              '     AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))      ';
      Case TipoCentCust of
         tccSoSintetica : sSql := sSql +'  AND (C.STATUSGRUPOCDC = ''S'')  ';
         tccSoAnalitica : sSql := sSql +'  AND (C.STATUSGRUPOCDC = ''A'')  ';
      end;
      sSql := sSql +'     AND (NOT EXISTS (SELECT X.IDUSUARIO FROM USCCUSTO X         '+
                    '                           WHERE (X.IDEMPRESA = C.IDEMPRESA)              '+
                    '                             AND (X.IDPESSOA = '+FloatToStr(IdEmpresa)+') '+
                    '                             AND (X.IDUSUARIO = '+FloatToStr(IdUsuario)+')))'+
                    '   UNION ALL                                                              '+
                    '   SELECT DISTINCT                                                        '+
                    '          C.CODCENTROCUSTO, C.NOME, C.STATUSGRUPOCDC                    '+
                    '   FROM CENTCUST C, USCCUSTO X                      '+
                    '   WHERE (C.IDEMPRESA = '+FloatToStr(IdEmpresa)+')  '+
                    '     AND ((C.ATIVO = ''S'') OR (C.ATIVO IS NULL))   '+
                    '     AND (X.CODCENTROCUSTO = C.CODCENTROCUSTO )     '+
                    '     AND (X.IDPESSOA = '+FloatToStr(IdEmpresa)+')   '+
                    '     AND (X.IDEMPRESA = C.IDEMPRESA)                                        '+
                    '     AND (X.IDUSUARIO = '+FloatToStr(IdUsuario)+')                   ';
      Case TipoCentCust of
         tccSoSintetica : sSql := sSql +'  AND (C.STATUSGRUPOCDC = ''S'')  ';
         tccSoAnalitica : sSql := sSql +'  AND (C.STATUSGRUPOCDC = ''A'')  ';
      end;
      sSql := sSql +') U                        ';
      Case TipoOrdemCentCust of
         toccCodigo : sSql := sSql +'ORDER BY U.CODCENTROCUSTO ';
         toccNome   : sSql := sSql +'ORDER BY U.NOME      ';
      end;
   end;
   Result := GetDataPacket(sSql);
end;

procedure TCtrlCentroCusto.Procurar( IdEmpresa: Double = 0; IdCentroCusto: String = '' );
begin
  If ConnectionSide = cnsClient Then Begin
     Connection.AppServer.ProcurarCentroCusto( IdEmpresa, IdCentroCusto );
  End Else Begin
     _dbCentroCusto.IdEmpresa.AsFloat := IdEmpresa;
     _dbCentroCusto.CodCentroCusto.AsString := IdCentroCusto;
  End;
end;

procedure TCtrlCentroCusto.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlCentroCusto.SetcdsAranha(const Value: TClientDataSet);
begin
  FcdsAranha := Value;
end;

procedure TCtrlCentroCusto.SetcdsContas(const Value: TClientDataSet);
begin
  FcdsContas := Value;
end;

end.

