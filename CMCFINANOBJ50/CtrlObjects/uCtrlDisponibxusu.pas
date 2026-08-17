// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlDisponibxusu;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbDisponibxusu, uSistema,UCmSqlParams;

Type

  TCtrlDisponibxusu = class(TCmControlObject)
  _sql              : TCmSqlParams;
  private
    FCdsUsuBloqueado: TCMClientDataSet;
    FCdsUsuLiberado : TCMClientDataSet;
    FDbDisponibxusu : TDbDisponibxusu;

    procedure SetCdsUsuBloqueado(const Value: TCMClientDataSet);
    procedure SetCdsUsuLiberado (const Value: TCMClientDataSet);
    procedure SetDbDisponibxusu (const Value: TDbDisponibxusu);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbDisponibxusu  : TDbDisponibxusu  read FDbDisponibxusu  write SetDbDisponibxusu;
    property CdsUsuBloqueado : TCMClientDataSet read FCdsUsuBloqueado write SetCdsUsuBloqueado;
    property CdsUsuLiberado  : TCMClientDataSet read FCdsUsuLiberado  write SetCdsUsuLiberado;

    function SelecionaGrupoUsuario : OleVariant;
    function SelecionaUsuBloqueado(iIdGrupo:Integer) : OleVariant;
    function SelecionaUsuLiberado : OleVariant;

    function SelDispSintetica(iIdPessoa : Integer;
                              dDataRef:TDateTime): OleVariant;

    function SelDispAnalitica(iIdPessoa : Integer;
                              dDataRef:TDateTime): OleVariant;

    function GravaDisponibxusu(Cds : TCMClientDataSet) : Boolean;

//    function ExcluiDispFin(Cds,Cds1 : TCMClientDataSet): Boolean;
    function ExcluiDispFin(dDataRef : TDateTime): Boolean;


    function SelecionaRateioDispFinanc(dDataRef : TDateTime) : OleVariant;

    function SelSaldosAnteriores(iIdPessoa : Integer;
                                 dDataRef:TDateTime): OleVariant;

    function SelOperacoesDia(iIdPessoa : Integer;
                             dDataRef:TDateTime): OleVariant;

    function GetSequenceL : LongInt;

    function Sel(iIdPessoa : Integer;
                dDataRef:TDateTime): OleVariant;

    function BloqueiaDispFin(sStatus : string; iIdPessoa : integer; dDataRef : TDateTime): boolean;

  published

end;

implementation

{ TCtrlDisponibxusu }

constructor TCtrlDisponibxusu.Create;
begin
  inherited;
  FDbDisponibxusu      := TDbDisponibxusu.Create(Self);
  FCdsUsuBloqueado     := TCMClientDataSet.Create(Nil);
  FCdsUsuLiberado      := TCMClientDataSet.Create(Nil);

  _sql               := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;
  
end;

destructor TCtrlDisponibxusu.Destroy;
begin
  FDbDisponibxusu.Free;
  FCdsUsuBloqueado.Free;
  FCdsUsuLiberado.Free;
  inherited;
end;

procedure TCtrlDisponibxusu.DoChangeDataBase;
begin
  inherited;
  FDbDisponibxusu.DataBaseName     := Self.DataBaseName;
end;

procedure TCtrlDisponibxusu.SetCdsUsuBloqueado(const Value: TCMClientDataSet);
begin
  FCdsUsuBloqueado := Value;
end;

procedure TCtrlDisponibxusu.SetCdsUsuLiberado(const Value: TCMClientDataSet);
begin
  FCdsUsuLiberado := Value;
end;

procedure TCtrlDisponibxusu.SetDbDisponibxusu(const Value: TDbDisponibxusu);
begin
  FDbDisponibxusu := Value;
end;

function TCtrlDisponibxusu.GravaDisponibxusu(Cds : TCMClientDataSet): Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarDisponibxusu( Cds.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( Cds, DbDisponibxusu, [], [] );

      Msg := DbDisponibxusu.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

//function TCtrlDisponibxusu.ExcluiDispFin(Cds,Cds1 : TCMClientDataSet): Boolean;
function TCtrlDisponibxusu.ExcluiDispFin(dDataRef : TDateTime): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
//       Result:=Connection.AppServer.ExcluiDispFin(Cds.Data,Cds1.Data);
       Result:=Connection.AppServer.ExcluiDispFin(dDataRef);

       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
      Try
         StartTransaction;
         // RATEIODISPFINANC
         _sql.SQL.Clear;
         _sql.SQL.Add(' DELETE FROM RATEIODISPFINANC          ');
         _sql.SQL.Add(' WHERE                                 ');
         _sql.SQL.Add('    IDDISPFINANC IN ( SELECT           ');
         _sql.SQL.Add('                         IDDISPFINANC  ');
         _sql.SQL.Add('                      FROM             ');
         _sql.SQL.Add('                         DISPFINANC    ');
         _sql.SQL.Add('                      WHERE            ');
         _sql.SQL.Add('                         DATADISPFINANC = TO_DATE('+ QuotedStr(DateToStr(dDataRef)) + ',''DD/MM/YYYY'')) ');
         _sql.Prepare;

         if not ExecSQL(_sql.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);

         // DISPFINANC
         _sql.SQL.Clear;
         _sql.SQL.Add(' DELETE FROM DISPFINANC          ');
         _sql.SQL.Add(' WHERE                                 ');
         _sql.SQL.Add('    DATADISPFINANC = TO_DATE('+ QuotedStr(DateToStr(dDataRef)) + ',''DD/MM/YYYY'') ');
         _sql.Prepare;

         if not ExecSQL(_sql.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);

         Commit;
         Result := True;
      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;


{       try
          StartTransaction;
          // RATEIODISPFINANC
          Result:=ApplyCds(Cds1,FDbRateioDispFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbRateioDispFinanc.MessageInfo;
              Rollback;
              Exit;
           end;
          // DISPFINANC
          Result:=ApplyCds(Cds,FDbDispFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbDispFinanc.MessageInfo;
              Rollback;
              Exit;
           end;
          Commit;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;}


    end;
end;

function TCtrlDisponibxusu.SelecionaUsuLiberado : OleVariant;
begin
   Result := GetDataPacket( 'SELECT                             ' +
                            '   USU.IDUSUARIO, USU.NOMEUSUARIO, ' +
                            '   USU.FLGDISPFINANC               ' +
                            'FROM                               ' +
                            '   USUARIOSISTEMA USU              ' +
                            'WHERE                              ' +
                            '   USU.FLGDISPFINANC = ''Y''       ' +
                            'ORDER BY USU.NOMEUSUARIO           ');
end;

function TCtrlDisponibxusu.SelecionaGrupoUsuario : OleVariant;
begin
   Result := GetDataPacket( 'SELECT IDGRUPO,NOMEGRUPO ' +
                            'FROM  GRUPOACESSO        ' +
                            'ORDER BY NOMEGRUPO       ');
end;

function TCtrlDisponibxusu.SelecionaUsuBloqueado(iIdGrupo:Integer) : OleVariant;
var sSql : string;
begin
   sSql := 'SELECT DISTINCT USU.IDUSUARIO, USU.NOMEUSUARIO,USU.FLGDISPFINANC                    ' +
           'FROM  USUARIOSISTEMA USU, GRUPOUSU GUS                            ' +
           'WHERE                                                             ' +
           '   (USU.IDUSUARIO = GUS.IDUSUARIO(+)) AND                         ' +
           '   ((USU.FLGDISPFINANC <> ''Y'')  OR (USU.FLGDISPFINANC IS NULL)) ' ;
   if iIdGrupo <> -1 then
      sSql := sSql + 'AND ((('+IntToStr(iIdGrupo)+' IS NOT NULL) AND (GUS.IDGRUPO = '+IntToStr(iIdGrupo)+')) OR ('+IntToStr(iIdGrupo)+' IS NULL)) ';

   sSql := sSql + 'ORDER BY NOMEUSUARIO ';
   Result := GetDataPacket(sSql);
end;

function TCtrlDisponibxusu.SelecionaRateioDispFinanc(dDataRef : TDateTime): OleVariant;
var sSql : string;
begin
   sSql := 'SELECT                                    '+
           '  IDDISPFINANC,IDPLANO,IDPATRO,VLRRATEIO, '+
           '  CODTIPRECDES, RECPAG, CODCENTRORESPON,  '+
           '  CODCENTROCUSTO,CODTIPODOC, UNIDNEGOC,   '+
           '  IDPESSOA,IDEMPRESA,IDFORCLI             '+
           'FROM RATEIODISPFINANC                     '+
           'WHERE                                     '+
           '   (IDDISPFINANC IN(SELECT IDDISPFINANC   '+
           '                    FROM DISPFINANC       '+
           '                    WHERE                 '+
           '                       (DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')))) ';

   Result := GetDataPacket(sSql);
end;


{function TCtrlDisponibxusu.ExcluiDispFinanc(Cds:TCMClientDataSet): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.ExcluiDispFinanc(Cds.Data);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(Cds,FDbDispFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbDispFinanc.MessageInfo;
              Rollback;
              Exit;
           end;
          Commit;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;}
{
function TCtrlDisponibxusu.GravaDispFinanc(Cds,Cds1 : TCMClientDataSet): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.GravaDispFinanc(Cds.Data,Cds1.Data);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;
          // DISPFINANC
          Result:=ApplyCds(Cds,FDbDispFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbDispFinanc.MessageInfo;
              Rollback;
              Exit;
           end;
          // RATEIODISPFINANC
          Result:=ApplyCds(Cds1,FDbRateioDispFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbRateioDispFinanc.MessageInfo;
              Rollback;
              Exit;
           end;

          Commit;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;
}
function TCtrlDisponibxusu.GetSequenceL : LongInt;
begin
   Result := GetSequence('DISPFINANC');
end;

function TCtrlDisponibxusu.SelSaldosAnteriores(iIdPessoa : Integer;
                                               dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   // Busca os Saldos Anteriores do Movimento Financeiro
   sSql := 'SELECT ''SALDO ANTERIOR'' AS HISTORICO,                          '+
           '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS VALORDISP,   '+
           '   R.IDPLANOPREV,                                                '+
           '   R.IDPATRO                                                     '+
           'FROM MOVIMFINANC M, RATEIOFINANC R                               '+
           'WHERE (M.CODLANCFINANC = R.CODLANCFINANC)                        '+
           '   AND (M.IDPESSOA = '+IntToStr(iIdPessoa)+')                    '+
           '   AND (M.STATUSCONCILIA <> ''C'')                               '+
           '   AND (M.DATALANCFINAN < TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
           'GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA       ';

   Result := GetDataPacket(sSql);
end;

function TCtrlDisponibxusu.SelOperacoesDia(iIdPessoa : Integer;
                               dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   // Busca as Operações do Dia no Movimento Financeiro
   sSql := 'SELECT                 '+
           '   M.CODLANCFINANC, '' '' AS HISTORICO,       '+
           '   M.VALORLANCFINAN AS VALORDISP, R.VALOR, R.CODTIPRECDES,       '+
           '   R.RECPAG, R.CODCENTRORESPON, R.CODCENTROCUSTO, R.CODTIPDOC,   '+
           '   R.IDPLANOPREV, R.IDPATRO, R.UNIDNEGOC                         '+
           'FROM MOVIMFINANC M, RATEIOFINANC R                               '+
           'WHERE (M.CODLANCFINANC = R.CODLANCFINANC)                        '+
           '   AND (M.IDPESSOA = '+IntToStr(iIdPessoa)+')                    '+
           '   AND (M.STATUSCONCILIA <> ''C'')                               '+
           '   AND (M.DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) '+
           'ORDER BY M.CODLANCFINANC                                         ';

   Result := GetDataPacket(sSql);
end;

function TCtrlDisponibxusu.Sel(iIdPessoa : Integer;
                                dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   // Busca as Operações do Dia no Movimento Financeiro
{
DISPFINANC                  RATEIOFINANC
----------                  ------------
X IDDISPFINANC                X IDDISPFINANC
X DATADISPFINANC              X IDPLANO
? IDMODULO                    X IDPATRO
X IDMODULOORIGEM              X VLRRATEIO
? HISTORICO                   ? UNIDNEGOCIO
X VLRDISPFINANC               ? CODTIPRECDES
X TIPO                        X RECPAG
X FLGEXCLUSAO                 ? CODCENTRORESPON
? TIPOREG                     ? CODCENTROCUSTO
X CODDOCUMENTO                ? CODTIPDOC

{TIPOREG := A = SALDO INICIAL
            I = INVESTIMENTO
            O = OUTROS MODULOS
            S = SALDO FINAL
TIPO := B = BLOQUEIO
        L = LANCAMENTOS
}
_sql.sql.clear;
_sql.sql.add('SELECT                                           ');
_sql.sql.add('   U.DATAPROGRAMADA,                             ');
_sql.sql.add('   U.RECPAG,                                     ');
_sql.sql.add('   U.IDFORCLI,                                   ');
_sql.sql.add('   U.CODDOCUMENTO,                               ');
_sql.sql.add('   U.DATAVENCTO,                                 ');
_sql.sql.add('   DECODE(P.NOME,'''',U.NODOCUMENTO,P.NOME ||'' - ''||U.NODOCUMENTO) AS NODOCUMENTO, ');
_sql.sql.add('   U.HISTORICOCOMPL,                             ');
_sql.sql.add('   U.DATALANCTO,                                 ');
_sql.sql.add('   U.IDPLANOPREV,                                ');
_sql.sql.add('   U.IDPATRO,                                    ');
_sql.sql.add('   U.CODTIPRECDES,                               ');
_sql.sql.add('   U.IDPESSOA,                                   ');
_sql.sql.add('   U.CODTIPDOC,                                  ');
_sql.sql.add('   U.INCLUDISP,                                  ');
_sql.sql.add('   U.IDMODULO,                                   ');
_sql.sql.add('   U.SALDO AS VALORDISP,                         ');
_sql.sql.add('   U.BLOQUEIO,                                   ');
_sql.sql.add('   P.RAZAOSOCIAL AS FORNECEDOR,                  ');
_sql.sql.add('   P.NOME AS NOMEFORNECEDOR,                     ');
_sql.sql.add('   P.NUMDOCUMENTO AS CGCCPF,                     ');
_sql.sql.add('   PP.NOME||'' - ''||PT.NOME AS NOMEPLANOPATRO,  ');
_sql.sql.add('   PP.NOME AS NOMEPLANO,                         ');
_sql.sql.add('   PT.NOME AS NOMEPATRO,                         ');
_sql.sql.add('   T.DESCRICAO AS DESCTIPORD,                    ');
_sql.sql.add('   TD.DESCRICAO AS DESCTIPODOC,                  ');
_sql.sql.add('   M.NOMEMODULO                                  ');
_sql.sql.add('FROM                                             ');
_sql.sql.add('   PESSOA P,                                     ');
_sql.sql.add('   PESSOA PT,                                    ');
_sql.sql.add('   TIPORECEBDESEMB T,                            ');
_sql.sql.add('   PLANPREVCONTABIL PP,                          ');
_sql.sql.add('   TIPODOCRECPAG TD,                             ');
_sql.sql.add('   MODULO M,                                     ');
_sql.sql.add('   (                                             ');
_sql.sql.add('    (SELECT                                      ');
_sql.sql.add('        TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') AS DATAPROGRAMADA, ');
_sql.sql.add('        0 AS IDFORCLI,                                                         ');
_sql.sql.add('        0 AS CODDOCUMENTO,                                                     ');
_sql.sql.add('        TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') AS DATAVENCTO,     ');
_sql.sql.add('        '''' AS NODOCUMENTO,                                                   ');
_sql.sql.add('        ''Saldo Inicial'' AS HISTORICOCOMPL,                                   ');
_sql.sql.add('        TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') AS DATALANCTO,     ');
_sql.sql.add('        '''' AS CODTIPRECDES,                                                  ');
_sql.sql.add('        R.IDPLANOPREV,                                                         ');
_sql.sql.add('        R.IDPATRO,                                                             ');
_sql.sql.add('        ''A'' AS RECPAG,                                                       ');
_sql.sql.add('        M.IDPESSOA,                                                            ');
_sql.sql.add('        0 AS CODTIPDOC,                                                        ');
_sql.sql.add('        ''I'' AS INCLUDISP,                                                    ');
_sql.sql.add('        0 AS IDMODULO,                                                         ');
_sql.sql.add('        SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDO,               ');
_sql.sql.add('        '''' AS BLOQUEIO                                                       ');
_sql.sql.add('     FROM                                                                      ');
_sql.sql.add('        MOVIMFINANC M, RATEIOFINANC R                                          ');
_sql.sql.add('     WHERE (M.CODLANCFINANC = R.CODLANCFINANC)                                 ');
_sql.sql.add('        AND (M.IDPESSOA = '+IntToStr(iIdPessoa)+')                             ');
_sql.sql.add('        AND (M.STATUSCONCILIA <> ''C'')                                        ');
_sql.sql.add('        AND (M.DATALANCFINAN <= TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
_sql.sql.add('     GROUP BY R.IDPLANOPREV, R.IDPATRO, M.IDPESSOA                                   ');
_sql.sql.add('    )                                                                                ');
_sql.sql.add('    UNION ALL                                                                        ');
_sql.sql.add('    (SELECT                                                                          ');
_sql.sql.add('        TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') AS DATAPROGRAMADA,       ');
_sql.sql.add('        0 AS IDFORCLI,                                                               ');
_sql.sql.add('        0 AS CODDOCUMENTO,                                                           ');
_sql.sql.add('        TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') AS DATAVENCTO,           ');
_sql.sql.add('        ''Movimento Financeiro''||'' - ''||M.HISTORICO AS NODOCUMENTO,               ');
_sql.sql.add('        '''' AS HISTORICOCOMPL,                                                      ');
_sql.sql.add('        TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') AS DATALANCTO,           ');
_sql.sql.add('        '''' AS CODTIPRECDES,                                                        ');
_sql.sql.add('        R.IDPLANOPREV,                                                               ');
_sql.sql.add('        R.IDPATRO,                                                                   ');
_sql.sql.add('        ''O'' AS RECPAG,                                                             ');
_sql.sql.add('        M.IDPESSOA,                                                                  ');
_sql.sql.add('        0 AS CODTIPDOC,                                                              ');
_sql.sql.add('        ''I'' AS INCLUDISP,                                                          ');
_sql.sql.add('        0 AS IDMODULO,                                                               ');
_sql.sql.add('        DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1) AS SALDO,                     ');
_sql.sql.add('        '''' AS BLOQUEIO                                                             ');
_sql.sql.add('     FROM                                                                            ');
_sql.sql.add('        MOVIMFINANC M, RATEIOFINANC R                                                ');
_sql.sql.add('     WHERE (M.CODLANCFINANC = R.CODLANCFINANC)                                       ');
_sql.sql.add('        AND (M.IDPESSOA = '+IntToStr(iIdPessoa)+')                                   ');
_sql.sql.add('        AND (M.STATUSCONCILIA <> ''C'')                                              ');
_sql.sql.add('        AND (M.DATALANCFINAN = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))  ');
_sql.sql.add('    )                                                                                ');
_sql.sql.add('    UNION ALL                                                                        ');
_sql.sql.add('    (SELECT                                                                          ');
_sql.sql.add('        D.DATAPROGRAMADA,                                                            ');
_sql.sql.add('        D.IDFORCLI,                                                                  ');
_sql.sql.add('        D.CODDOCUMENTO,                                                              ');
_sql.sql.add('        D.DATAVENCTO,                                                                ');
_sql.sql.add('        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                         ');
_sql.sql.add('        (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,           ');
_sql.sql.add('        L.HISTORICOCOMPL,                                                            ');
_sql.sql.add('        L.DATALANCTO,                                                                ');
_sql.sql.add('        R.CODTIPRECDES,                                                              ');
_sql.sql.add('        R.IDPLANOPREV,                                                               ');
_sql.sql.add('        R.IDPATRO,                                                                   ');
_sql.sql.add('        ''O'' AS RECPAG,                                                             ');
_sql.sql.add('        D.IDPESSOA,                                                                  ');
_sql.sql.add('        D.CODTIPDOC,                                                                 ');
_sql.sql.add('        ''I'' AS INCLUDISP,                                                          ');
_sql.sql.add('        D.IDMODULO,                                                                  ');
_sql.sql.add('        SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,                                   ');
_sql.sql.add('        '''' AS BLOQUEIO                                                             ');
_sql.sql.add('     FROM                                                                            ');
_sql.sql.add('        DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,                                   ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.CODDOCUMENTO,                                                          ');
_sql.sql.add('            SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO                  ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, LANCTODOCUM L                                               ');
_sql.sql.add('         WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)                                     ');
_sql.sql.add('            AND (D.OPERACAO IN ('+IntToStr(iIdPessoa)+',''1 ''))                     ');
_sql.sql.add('            AND (D.RECPAG = ''P'')                                                   ');
_sql.sql.add('            AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                               ');
_sql.sql.add('            AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))        ');
_sql.sql.add('         GROUP BY D.CODDOCUMENTO) S                                                  ');
_sql.sql.add('     WHERE                                                                           ');
_sql.sql.add('        (D.CODDOCUMENTO = L.CODDOCUMENTO)                                            ');
_sql.sql.add('        AND (D.OPERACAO = L.OPERACAO)                                                ');
_sql.sql.add('        AND (D.CODDOCUMENTO = R.CODDOCUMENTO)                                        ');
_sql.sql.add('        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                        ');
_sql.sql.add('        AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                                   ');
_sql.sql.add('        AND (D.RECPAG = ''P'')                                                       ');
_sql.sql.add('        AND (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
_sql.sql.add('        AND (NVL(L.VALOR,0) <> 0)                                                    ');
_sql.sql.add('        AND (D.OPERACAO IN ('+IntToStr(iIdPessoa)+',''1 ''))                         ');
_sql.sql.add('        AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))            ');
_sql.sql.add('     GROUP BY                                                                        ');
_sql.sql.add('        D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO,                   ');
_sql.sql.add('        D.DATAPROGRAMADA, L.HISTORICOCOMPL, L.DATALANCTO,R.CODTIPRECDES,             ');
_sql.sql.add('        R.IDPLANOPREV, R.IDPATRO, R.RECPAG, D.IDPESSOA,                              ');
_sql.sql.add('        D.OPERACAO,D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO                           ');
_sql.sql.add('    )                                                                                ');
_sql.sql.add('    UNION ALL                                                                        ');
_sql.sql.add('    (SELECT                                                                          ');
_sql.sql.add('        D.DATAPROGRAMADA,                                                            ');
_sql.sql.add('        D.IDFORCLI,                                                                  ');
_sql.sql.add('        D.CODDOCUMENTO,                                                              ');
_sql.sql.add('        D.DATAVENCTO,                                                                ');
_sql.sql.add('        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                         ');
_sql.sql.add('        (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,           ');
_sql.sql.add('        L.HISTORICOCOMPL,                                                            ');
_sql.sql.add('        L.DATALANCTO,                                                                ');
_sql.sql.add('        R.CODTIPRECDES,                                                              ');
_sql.sql.add('        R.IDPLANOPREV,                                                               ');
_sql.sql.add('        R.IDPATRO,                                                                   ');
_sql.sql.add('        ''O'' AS RECPAG,                                                             ');
_sql.sql.add('        D.IDPESSOA,                                                                  ');
_sql.sql.add('        D.CODTIPDOC,                                                                 ');
_sql.sql.add('        ''I'' AS INCLUDISP,                                                          ');
_sql.sql.add('        D.IDMODULO,                                                                  ');
_sql.sql.add('        SUM(((SS.SALDOTOT*S.SALDODOC)/SS.SALDOTOT)) AS SALDO,                        ');
_sql.sql.add('        '''' AS BLOQUEIO                                                             ');
_sql.sql.add('     FROM                                                                            ');
_sql.sql.add('        DOCUMENTO D, LANCTODOCUM L,                                                  ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.NUMFATURA,                                                             ');
_sql.sql.add('            SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT               ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, LANCTODOCUM L                                               ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        ');
_sql.sql.add('            AND (D.OPERACAO = L.OPERACAO)                                            ');
_sql.sql.add('            AND (D.OPERACAO IN (''1 ''))                                             ');
_sql.sql.add('            AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                               ');
_sql.sql.add('            AND (D.RECPAG = ''P'')                                                   ');
_sql.sql.add('            AND (D.NUMFATURA IS NOT NULL)                                            ');
_sql.sql.add('         GROUP BY D.NUMFATURA) SS,                                                   ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.CODDOCUMENTO,                                                          ');
_sql.sql.add('            SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC               ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, LANCTODOCUM L                                               ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        ');
_sql.sql.add('            AND (D.OPERACAO IN (''3 ''))                                             ');
_sql.sql.add('            AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                               ');
_sql.sql.add('            AND (D.RECPAG = ''P'')                                                   ');
_sql.sql.add('            AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))        ');
_sql.sql.add('         GROUP BY D.CODDOCUMENTO) S,                                                 ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.NUMFATURA,                                                             ');
_sql.sql.add('            R.CODTIPRECDES,                                                          ');
_sql.sql.add('            R.IDPLANOPREV,                                                           ');
_sql.sql.add('            R.IDPATRO,                                                               ');
_sql.sql.add('            R.IDPESSOA,                                                              ');
_sql.sql.add('            R.RECPAG,                                                                ');
_sql.sql.add('            SUM(R.VALOR) AS VALORRAT                                                 ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, RATEIODOCUM R                                               ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = R.CODDOCUMENTO)                                        ');
_sql.sql.add('            AND (D.OPERACAO IN (''1 ''))                                             ');
_sql.sql.add('            AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                               ');
_sql.sql.add('            AND (D.RECPAG = ''P'')                                                   ');
_sql.sql.add('            AND (D.NUMFATURA IS NOT NULL)                                            ');
_sql.sql.add('         GROUP BY                                                                    ');
_sql.sql.add('            R.CODTIPRECDES, R.IDPLANOPREV,R.IDPATRO,                                 ');
_sql.sql.add('            R.IDPESSOA,R.RECPAG,D.NUMFATURA) R                                       ');
_sql.sql.add('     WHERE                                                                           ');
_sql.sql.add('        (D.CODDOCUMENTO = L.CODDOCUMENTO)                                            ');
_sql.sql.add('        AND (D.OPERACAO = L.OPERACAO)                                                ');
_sql.sql.add('        AND (D.NUMFATURA = R.NUMFATURA)                                              ');
_sql.sql.add('        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                        ');
_sql.sql.add('        AND (D.NUMFATURA = SS.NUMFATURA)                                             ');
_sql.sql.add('        AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                                   ');
_sql.sql.add('        AND (D.RECPAG = ''P'')                                                       ');
_sql.sql.add('        AND (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
_sql.sql.add('        AND (NVL(SS.SALDOTOT,0) <> 0 )                                               ');
_sql.sql.add('        AND (D.OPERACAO IN (''3 ''))                                                 ');
_sql.sql.add('        AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))            ');
_sql.sql.add('     GROUP BY                                                                        ');
_sql.sql.add('        D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO,                   ');
_sql.sql.add('        D.DATAPROGRAMADA,                                                            ');
_sql.sql.add('        L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES, R.IDPLANOPREV,               ');
_sql.sql.add('        R.IDPATRO, R.RECPAG, D.IDPESSOA, D.OPERACAO,                                 ');
_sql.sql.add('        D.CODTIPDOC,D.IDMODULO,D.CODDOCUMENTO                                        ');
_sql.sql.add('    )                                                                                ');
_sql.sql.add('    UNION ALL                                                                        ');
_sql.sql.add('    (SELECT                                                                          ');
_sql.sql.add('        D.DATAPROGRAMADA,                                                            ');
_sql.sql.add('        D.IDFORCLI,                                                                  ');
_sql.sql.add('        D.CODDOCUMENTO,                                                              ');
_sql.sql.add('        D.DATAVENCTO,                                                                ');
_sql.sql.add('        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                         ');
_sql.sql.add('        (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,           ');
_sql.sql.add('        L.HISTORICOCOMPL,                                                            ');
_sql.sql.add('        L.DATALANCTO,                                                                ');
_sql.sql.add('        R.CODTIPRECDES,                                                              ');
_sql.sql.add('        R.IDPLANOPREV,                                                               ');
_sql.sql.add('        R.IDPATRO,                                                                   ');
_sql.sql.add('        ''O'' AS RECPAG,                                                             ');
_sql.sql.add('        D.IDPESSOA,                                                                  ');
_sql.sql.add('        D.CODTIPDOC,                                                                 ');
_sql.sql.add('        ''N'' AS INCLUDI,                                                            ');
_sql.sql.add('        D.IDMODULO,                                                                  ');
_sql.sql.add('        SUM(((R.VALOR*S.SALDO)/L.VALOR)) AS SALDO,                                   ');
_sql.sql.add('        '''' AS BLOQUEIO                                                             ');
_sql.sql.add('     FROM                                                                            ');
_sql.sql.add('        DOCUMENTO D, LANCTODOCUM L, RATEIODOCUM R,                                   ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.CODDOCUMENTO,                                                          ');
_sql.sql.add('            SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDO                  ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, LANCTODOCUM L                                               ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        ');
_sql.sql.add('            AND (D.OPERACAO IN ('+IntToStr(iIdPessoa)+',''1 ''))                     ');
_sql.sql.add('            AND (D.RECPAG = ''R'')                                                   ');
_sql.sql.add('            AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                               ');
_sql.sql.add('            AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))        ');
_sql.sql.add('         GROUP BY D.CODDOCUMENTO) S                                                  ');
_sql.sql.add('     WHERE                                                                           ');
_sql.sql.add('        (D.CODDOCUMENTO = L.CODDOCUMENTO)                                            ');
_sql.sql.add('         AND (D.OPERACAO = L.OPERACAO)                                               ');
_sql.sql.add('         AND (D.CODDOCUMENTO = R.CODDOCUMENTO)                                       ');
_sql.sql.add('         AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                       ');
_sql.sql.add('         AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                                  ');
_sql.sql.add('         AND (D.RECPAG = ''R'')                                                      ');
_sql.sql.add('         AND (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
_sql.sql.add('         AND (NVL(L.VALOR,0) <> 0)                                                   ');
_sql.sql.add('         AND (D.OPERACAO IN ('+IntToStr(iIdPessoa)+',''1 ''))                        ');
_sql.sql.add('         AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))           ');
_sql.sql.add('     GROUP BY                                                                        ');
_sql.sql.add('        D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO,                   ');
_sql.sql.add('        D.DATAPROGRAMADA, L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES,            ');
_sql.sql.add('        R.IDPLANOPREV, R.IDPATRO, R.RECPAG, D.IDPESSOA, D.OPERACAO,                  ');
_sql.sql.add('        D.CODTIPDOC, D.IDMODULO,D.CODDOCUMENTO                                       ');
_sql.sql.add('    )                                                                                ');
_sql.sql.add('    UNION ALL                                                                        ');
_sql.sql.add('    (SELECT                                                                          ');
_sql.sql.add('        D.DATAPROGRAMADA,                                                            ');
_sql.sql.add('        D.IDFORCLI,                                                                  ');
_sql.sql.add('        D.CODDOCUMENTO,                                                              ');
_sql.sql.add('        D.DATAVENCTO,                                                                ');
_sql.sql.add('        DECODE(D.COMPLDOCUMENTO,NULL,TO_CHAR(D.NODOCUMENTO),                         ');
_sql.sql.add('        (TO_CHAR(D.NODOCUMENTO)||''/''||D.COMPLDOCUMENTO)) AS NODOCUMENTO,           ');
_sql.sql.add('        L.HISTORICOCOMPL,                                                            ');
_sql.sql.add('        L.DATALANCTO,                                                                ');
_sql.sql.add('        R.CODTIPRECDES,                                                              ');
_sql.sql.add('        R.IDPLANOPREV,                                                               ');
_sql.sql.add('        R.IDPATRO,                                                                   ');
_sql.sql.add('        ''O'' AS RECPAG,                                                             ');
_sql.sql.add('        D.IDPESSOA,                                                                  ');
_sql.sql.add('        D.CODTIPDOC,                                                                 ');
_sql.sql.add('        ''N'' AS INCLUDISP,                                                          ');
_sql.sql.add('        D.IDMODULO,                                                                  ');
_sql.sql.add('        SUM(((SS.SALDOTOT*S.SALDODOC)/SS.SALDOTOT)) AS SALDO,                        ');
_sql.sql.add('        '''' AS BLOQUEIO                                                             ');
_sql.sql.add('     FROM                                                                            ');
_sql.sql.add('        DOCUMENTO D, LANCTODOCUM L,                                                  ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.NUMFATURA,                                                             ');
_sql.sql.add('            SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDOTOT               ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, LANCTODOCUM L                                               ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        ');
_sql.sql.add('             AND (D.OPERACAO = L.OPERACAO)                                           ');
_sql.sql.add('             AND (D.OPERACAO IN (''1 ''))                                            ');
_sql.sql.add('             AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                              ');
_sql.sql.add('             AND (D.RECPAG = ''R'')                                                  ');
_sql.sql.add('             AND (D.NUMFATURA IS NOT NULL)                                           ');
_sql.sql.add('         GROUP BY D.NUMFATURA) SS,                                                   ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.CODDOCUMENTO,                                                          ');
_sql.sql.add('            SUM(DECODE(L.DEBCRE,''D'',L.VALOR,L.VALOR*-1)) AS SALDODOC               ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D,LANCTODOCUM L                                                ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = L.CODDOCUMENTO)                                        ');
_sql.sql.add('             AND (D.OPERACAO IN (''3 ''))                                            ');
_sql.sql.add('             AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                              ');
_sql.sql.add('             AND (D.RECPAG = ''R'')                                                  ');
_sql.sql.add('             AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))       ');
_sql.sql.add('         GROUP BY D.CODDOCUMENTO) S,                                                 ');
_sql.sql.add('        (SELECT                                                                      ');
_sql.sql.add('            D.NUMFATURA,                                                             ');
_sql.sql.add('            R.CODTIPRECDES,                                                          ');
_sql.sql.add('            R.IDPLANOPREV,                                                           ');
_sql.sql.add('            R.IDPATRO,                                                               ');
_sql.sql.add('            R.IDPESSOA,                                                              ');
_sql.sql.add('            R.RECPAG,                                                                ');
_sql.sql.add('            SUM(R.VALOR) AS VALORRAT                                                 ');
_sql.sql.add('         FROM                                                                        ');
_sql.sql.add('            DOCUMENTO D, RATEIODOCUM R                                               ');
_sql.sql.add('         WHERE                                                                       ');
_sql.sql.add('            (D.CODDOCUMENTO = R.CODDOCUMENTO)                                        ');
_sql.sql.add('             AND (D.OPERACAO IN (''1 ''))                                            ');
_sql.sql.add('             AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                              ');
_sql.sql.add('             AND (D.RECPAG = ''R'')                                                  ');
_sql.sql.add('             AND (D.NUMFATURA IS NOT NULL)                                           ');
_sql.sql.add('         GROUP BY                                                                    ');
_sql.sql.add('            R.CODTIPRECDES, R.IDPLANOPREV,R.IDPATRO,                                 ');
_sql.sql.add('            R.IDPESSOA, R.RECPAG, D.NUMFATURA) R                                     ');
_sql.sql.add('     WHERE                                                                           ');
_sql.sql.add('        (D.CODDOCUMENTO = L.CODDOCUMENTO)                                            ');
_sql.sql.add('        AND (D.OPERACAO = L.OPERACAO)                                                ');
_sql.sql.add('        AND (D.NUMFATURA = R.NUMFATURA)                                              ');
_sql.sql.add('        AND (D.CODDOCUMENTO = S.CODDOCUMENTO)                                        ');
_sql.sql.add('        AND (D.NUMFATURA = SS.NUMFATURA)                                             ');
_sql.sql.add('        AND (D.IDPESSOA = '+IntToStr(iIdPessoa)+')                                   ');
_sql.sql.add('        AND (D.RECPAG = ''R'')                                                       ');
_sql.sql.add('        AND (D.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
_sql.sql.add('        AND (NVL(SS.SALDOTOT,0) <> 0 )                                               ');
_sql.sql.add('        AND (D.OPERACAO IN (''3 ''))                                                 ');
_sql.sql.add('        AND ((D.STATUS <> '+IntToStr(iIdPessoa)+') OR (D.STATUS IS NULL))            ');
_sql.sql.add('     GROUP BY                                                                        ');
_sql.sql.add('        D.IDFORCLI, D.DATAVENCTO, D.COMPLDOCUMENTO, D.NODOCUMENTO,                   ');
_sql.sql.add('        D.DATAPROGRAMADA, L.HISTORICOCOMPL, L.DATALANCTO, R.CODTIPRECDES,            ');
_sql.sql.add('        R.IDPLANOPREV, R.IDPATRO, R.RECPAG, D.IDPESSOA, D.OPERACAO,                  ');
_sql.sql.add('        D.CODTIPDOC, D.IDMODULO, D.CODDOCUMENTO                                      ');
_sql.sql.add('    )                                                                                ');
_sql.sql.add('   ) U                                                                               ');
_sql.sql.add('WHERE (U.IDFORCLI = P.IDPESSOA(+))                                                   ');
_sql.sql.add('   AND (U.IDPLANOPREV = PP.IDPLANOPREV(+))                                           ');
_sql.sql.add('   AND (U.IDPATRO = PT.IDPESSOA(+))                                                  ');
_sql.sql.add('   AND (U.CODTIPDOC = TD.CODTIPDOC(+))                                               ');
_sql.sql.add('   AND (U.DATAPROGRAMADA = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY''))      ');
_sql.sql.add('   AND (U.CODTIPRECDES = T.CODTIPRECDES(+))                                          ');
_sql.sql.add('   AND (U.IDPESSOA = T.IDPESSOA(+))                                                  ');
_sql.sql.add('   AND (U.RECPAG = T.RECPAG(+))                                                      ');
_sql.sql.add('   AND (U.IDMODULO = M.IDMODULO(+))                                                  ');
_sql.sql.add('ORDER BY U.IDPESSOA, U.IDPLANOPREV, U.IDPATRO,U.INCLUDISP,U.RECPAG,                  ');
_sql.sql.add('   U.DATAPROGRAMADA, U.CODTIPRECDES,                                                 ');
_sql.sql.add('   P.RAZAOSOCIAL, U.NODOCUMENTO, U.CODDOCUMENTO                                      ');

//_sql.sql.savetofile('c:\teste.txt');
_sql.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\teste.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332

   Result := GetDataPacket(_sql.sql.Text);
end;

function TCtrlDisponibxusu.SelDispSintetica(iIdPessoa : Integer;
                                            dDataRef:TDateTime): OleVariant;
begin
   _sql.sql.clear;
   _sql.sql.add('SELECT                                                              ');
   _sql.sql.add('   DECODE(U2.IDPLANO,-1,''TOTAL GERAL'',PP.NOME||'' - '' ||P.NOME) AS NOMEPLANOPATRO, ');
   _sql.sql.add('   U2.DATADISPFINANC,                                               ');
   _sql.sql.add('   U2.SALDOANT,                                                     ');
   _sql.sql.add('   U2.IDPLANO,                                                     ');
   _sql.sql.add('   U2.IDPATRO,                                                     ');
   _sql.sql.add('   U2.VALORPAG AS DESENBOLSOS,                                      ');
   _sql.sql.add('   U2.VALORREC AS RECEBIMENTOS,                                     ');
   _sql.sql.add('   U2.SALDOATUAL AS SALDODIA                                        ');
   _sql.sql.add('FROM                                                                ');
   _sql.sql.add('   PESSOA P, PLANPREVCONTABIL PP,                                   ');
   _sql.sql.add('   (                                                                ');
   _sql.sql.add('    SELECT                                                          ');
   _sql.sql.add('       U.IDPLANO,U.IDPATRO,U.IDPESSOA,                              ');
   _sql.sql.add('       U.DATADISPFINANC,                                            ');
   _sql.sql.add('       SUM(U.SALDOANT) AS SALDOANT,                                 ');
   _sql.sql.add('       SUM(U.VALORPAG) AS VALORPAG,                                 ');
   _sql.sql.add('       SUM(U.VALORREC) AS VALORREC,                                 ');
   _sql.sql.add('       SUM(U.SALDOANT + U.VALORREC - U.VALORPAG) AS SALDOATUAL      ');
   _sql.sql.add('    FROM                                                            ');
   _sql.sql.add('       (                                                            ');
   _sql.sql.add('        (SELECT                                                     ');
   _sql.sql.add('            RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,    ');
   _sql.sql.add('            SUM(DI.VLRDISPFINANC) AS SALDOANT,                      ');
   _sql.sql.add('            0 AS VALORPAG,                                          ');
   _sql.sql.add('            0 AS VALORREC,                                          ');
   _sql.sql.add('            0 AS SALDOATUAL                                         ');
   _sql.sql.add('         FROM                                                       ');
   _sql.sql.add('            DISPFINANC DI, RATEIODISPFINANC RI                      ');
   _sql.sql.add('         WHERE                                                      ');
   _sql.sql.add('            DI.IDDISPFINANC = RI.IDDISPFINANC                       ');
   _sql.sql.add('            AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
   _sql.sql.add('            AND (RI.IDPESSOA = '+IntToStr(iIdPessoa)+')             ');
   _sql.sql.add('            AND (DI.TIPOREG=''A'')                                  ');
   _sql.sql.add('         GROUP BY                                                   ');
   _sql.sql.add('            RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )   ');
   _sql.sql.add('                                                                    ');
   _sql.sql.add('        UNION ALL                                                   ');
   _sql.sql.add('                                                                    ');
   _sql.sql.add('        (SELECT                                                     ');
   _sql.sql.add('            -1 AS IDPLANO, -1 AS IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,    ');
   _sql.sql.add('            SUM(DI.VLRDISPFINANC) AS SALDOANT,                      ');
   _sql.sql.add('            0 AS VALORPAG,                                          ');
   _sql.sql.add('            0 AS VALORREC,                                          ');
   _sql.sql.add('            0 AS SALDOATUAL                                         ');
   _sql.sql.add('         FROM                                                       ');
   _sql.sql.add('            DISPFINANC DI, RATEIODISPFINANC RI                      ');
   _sql.sql.add('         WHERE                                                      ');
   _sql.sql.add('            DI.IDDISPFINANC = RI.IDDISPFINANC                       ');
   _sql.sql.add('            AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
   _sql.sql.add('            AND (RI.IDPESSOA = '+IntToStr(iIdPessoa)+')             ');
   _sql.sql.add('            AND (DI.TIPOREG=''A'')                                  ');
   _sql.sql.add('         GROUP BY                                                   ');
   _sql.sql.add('            RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )   ');
   _sql.sql.add('                                                                    ');
   _sql.sql.add('        UNION ALL                                                   ');
   _sql.sql.add('                                                                    ');
   _sql.sql.add('        (SELECT                                                     ');
   _sql.sql.add('            RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,    ');
   _sql.sql.add('            0 AS SALDOANT,                                          ');
   _sql.sql.add('            DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,SUM(ABS(DI.VLRDISPFINANC)),0) AS VALORPAG, ');
   _sql.sql.add('            DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,0,SUM(ABS(DI.VLRDISPFINANC))) AS VALORREC, ');
   _sql.sql.add('            0 AS SALDOATUAL                                         ');
   _sql.sql.add('         FROM                                                       ');
   _sql.sql.add('            DISPFINANC DI, RATEIODISPFINANC RI                      ');
   _sql.sql.add('         WHERE                                                      ');
   _sql.sql.add('            DI.IDDISPFINANC = RI.IDDISPFINANC                       ');
   _sql.sql.add('            AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
   _sql.sql.add('            AND (RI.IDPESSOA ='+IntToStr(iIdPessoa)+')              ');
   _sql.sql.add('            AND (DI.TIPOREG <> ''A'')                                  ');
   _sql.sql.add('         GROUP BY                                                   ');
   _sql.sql.add('            RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC)     ');
   _sql.sql.add('                                                                    ');
   _sql.sql.add('        UNION ALL                                                   ');
   _sql.sql.add('                                                                    ');
   _sql.sql.add('        (SELECT                                                     ');
   _sql.sql.add('            -1 AS IDPLANO, -1 AS IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,    ');
   _sql.sql.add('            0 AS SALDOANT,                                          ');
   _sql.sql.add('            DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,SUM(ABS(DI.VLRDISPFINANC)),0) AS VALORPAG, ');
   _sql.sql.add('            DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,0,SUM(ABS(DI.VLRDISPFINANC))) AS VALORREC, ');
   _sql.sql.add('            0 AS SALDOATUAL                                         ');
   _sql.sql.add('         FROM                                                       ');
   _sql.sql.add('            DISPFINANC DI, RATEIODISPFINANC RI                      ');
   _sql.sql.add('         WHERE                                                      ');
   _sql.sql.add('            DI.IDDISPFINANC = RI.IDDISPFINANC                       ');
   _sql.sql.add('            AND (DI.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ');
   _sql.sql.add('            AND (RI.IDPESSOA ='+IntToStr(iIdPessoa)+')              ');
   _sql.sql.add('            AND (DI.TIPOREG <> ''A'')                                  ');
   _sql.sql.add('         GROUP BY                                                   ');
   _sql.sql.add('            RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC)    ');
   _sql.sql.add('       ) U                                                          ');
   _sql.sql.add('    GROUP BY                                                        ');
   _sql.sql.add('       U.IDPLANO,U.IDPATRO,U.IDPESSOA, U.DATADISPFINANC             ');
   _sql.sql.add('   ) U2                                                             ');
   _sql.sql.add('WHERE                                                               ');
   _sql.sql.add('  (U2.IDPATRO = P.IDPESSOA(+))                                      ');
   _sql.sql.add('  AND (U2.IDPLANO = PP.IDPLANOPREV(+))                              ');
   _sql.sql.add('ORDER BY U2.IDPLANO DESC                                            ');

   //_sql.sql.savetofile('c:\SelDispSintetica.txt');
   _sql.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\SelDispSintetica.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
   Result := GetDataPacket(_sql.sql.Text);
end;

function TCtrlDisponibxusu.SelDispAnalitica(iIdPessoa : Integer;
                                            dDataRef:TDateTime): OleVariant;
//var sSql : string;
begin
//   sSql :=
   _sql.sql.clear;
   _sql.sql.add('SELECT                                                         ');
   _sql.sql.add('   U.IDPLANO,                                                  ');
   _sql.sql.add('   U.IDPATRO,                                                  ');
   _sql.sql.add('   U.DATADISPFINANC,                                           ');
   _sql.sql.add('   U.TIPOREG,                                                  ');
   _sql.sql.add('   U.HISTORICO,                                                ');
   _sql.sql.add('   U.VLRDISPFINANC AS VALOR,                                   ');
   _sql.sql.add('   PT.NOME||'' - '' ||P.NOME AS NOMEPLANOPATRO,                ');
   _sql.sql.add('   U.NOMEFORCLI                                                ');
   _sql.sql.add('FROM                                                           ');
   _sql.sql.add('   PESSOA P,                                                   ');
   _sql.sql.add('   PLANPREVCONTABIL PT,                                        ');
   _sql.sql.add('   (                                                           ');
   _sql.sql.add('    SELECT                                                     ');
   _sql.sql.add('       R.IDPLANO,                                              ');
   _sql.sql.add('       R.IDPATRO,                                              ');
   _sql.sql.add('       D.DATADISPFINANC,                                       ');
   _sql.sql.add('       D.TIPOREG,                                              ');
   _sql.sql.add('       D.HISTORICO,                                            ');
   _sql.sql.add('       D.VLRDISPFINANC,                                        ');
   _sql.sql.add('       P.NOME AS NOMEFORCLI                                    ');
   _sql.sql.add('    FROM                                                       ');
   _sql.sql.add('       DISPFINANC D,                                           ');
   _sql.sql.add('       RATEIODISPFINANC R,                                     ');
   _sql.sql.add('       PESSOA P                                                ');
   _sql.sql.add('    WHERE                                                      ');
   _sql.sql.add('       D.IDDISPFINANC = R.IDDISPFINANC                         ');
   _sql.sql.add('       AND R.IDFORCLI = P.IDPESSOA(+)                          ');
   _sql.sql.add('       AND R.IDPESSOA = '+IntToStr(iIdPessoa)+'                ');
   _sql.sql.add('       AND DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('    UNION                                                      ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('    SELECT                                                     ');
   _sql.sql.add('       R.IDPLANO,                                              ');
   _sql.sql.add('       R.IDPATRO,                                              ');
   _sql.sql.add('       D.DATADISPFINANC,                                       ');
   _sql.sql.add('       ''S'' AS TIPOREG,                                       ');
   _sql.sql.add('       ''Saldo Final'' AS HISTORICO,                           ');
   _sql.sql.add('       SUM(D.VLRDISPFINANC) AS VLRDISPFINANC,                  ');
   _sql.sql.add('       '''' AS NOMEFORCLI                                      ');
   _sql.sql.add('    FROM                                                       ');
   _sql.sql.add('       DISPFINANC D,                                           ');
   _sql.sql.add('       RATEIODISPFINANC R                                      ');
   _sql.sql.add('    WHERE                                                      ');
   _sql.sql.add('       D.IDDISPFINANC = R.IDDISPFINANC                         ');
   _sql.sql.add('       AND R.IDPESSOA = '+IntToStr(iIdPessoa)+'                ');
   _sql.sql.add('       AND D.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') ');
   _sql.sql.add('    GROUP BY                                                   ');
   _sql.sql.add('       R.IDPLANO, R.IDPATRO,D.DATADISPFINANC                   ');
   _sql.sql.add('   )U                                                          ');
   _sql.sql.add('WHERE                                                          ');
   _sql.sql.add('   U.IDPATRO = P.IDPESSOA                                      ');
   _sql.sql.add('   AND U.IDPLANO = PT.IDPLANOPREV                              ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('UNION                                                          ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('SELECT                                                         ');
   _sql.sql.add('   -1 AS IDPLANO,                                              ');
   _sql.sql.add('   -1 AS IDPATRO,                                              ');
   _sql.sql.add('   D.DATADISPFINANC,                                           ');
   _sql.sql.add('   D.TIPOREG,                                                  ');
   _sql.sql.add('   D.HISTORICO,                                                ');
   _sql.sql.add('   D.VLRDISPFINANC,                                            ');
   _sql.sql.add('   PT.NOME||'' - '' ||P.NOME AS NOMEPLANOPATRO,                ');
   _sql.sql.add('   '''' AS NOMEFORCLI                                          ');
   _sql.sql.add('FROM                                                           ');
   _sql.sql.add('   DISPFINANC D, PESSOA P,PLANPREVCONTABIL PT,                  ');
   _sql.sql.add('   RATEIODISPFINANC R                                          ');
   _sql.sql.add('WHERE                                                          ');
   _sql.sql.add('   D.IDDISPFINANC = R.IDDISPFINANC                             ');
   _sql.sql.add('   AND R.IDPESSOA = '+IntToStr(iIdPessoa)+'                    ');
   _sql.sql.add('   AND D.TIPOREG <> ''A''                                      ');
   _sql.sql.add('   AND DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') ');
   _sql.sql.add('   AND R.IDPATRO = P.IDPESSOA                                  ');
   _sql.sql.add('   AND R.IDPLANO = PT.IDPLANOPREV                              ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('UNION                                                          ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('SELECT                                                         ');
   _sql.sql.add('   -1 AS IDPLANO,                                              ');
   _sql.sql.add('   -1 AS IDPATRO,                                              ');
   _sql.sql.add('   D.DATADISPFINANC,                                           ');
   _sql.sql.add('   ''A'' AS TIPOREG,                                           ');
   _sql.sql.add('   ''Saldo Inicial'' AS HISTORICO,                             ');
   _sql.sql.add('   SUM(D.VLRDISPFINANC) AS VLRDISPFINANC,                      ');
   _sql.sql.add('   ''TOTAL GERAL'' AS NOMEPLANOPATRO,                                     ');
   _sql.sql.add('   '''' AS NOMEFORCLI                                          ');
   _sql.sql.add('FROM                                                           ');
   _sql.sql.add('   DISPFINANC D,                                               ');
   _sql.sql.add('   RATEIODISPFINANC R                                          ');
   _sql.sql.add('WHERE                                                          ');
   _sql.sql.add('   D.IDDISPFINANC = R.IDDISPFINANC                             ');
   _sql.sql.add('   AND R.IDPESSOA = '+IntToStr(iIdPessoa)+'                    ');
   _sql.sql.add('   AND D.TIPOREG = ''A''                                       ');
   _sql.sql.add('   AND D.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') ');
   _sql.sql.add('GROUP BY                                                       ');
   _sql.sql.add('   D.DATADISPFINANC                                            ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('UNION                                                          ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('SELECT                                                         ');
   _sql.sql.add('   -1 AS IDPLANO,                                              ');
   _sql.sql.add('   -1 AS IDPATRO,                                              ');
   _sql.sql.add('   D.DATADISPFINANC,                                           ');
   _sql.sql.add('   ''S'' AS TIPOREG,                                           ');
   _sql.sql.add('   ''Saldo Final'' AS HISTORICO,                               ');
   _sql.sql.add('   SUM(D.VLRDISPFINANC) AS VLRDISPFINANC,                      ');
   _sql.sql.add('   ''TOTAL GERAL'' AS NOMEPLANOPATRO,                                       ');
   _sql.sql.add('   '''' AS NOMEFORCLI                                            ');
   _sql.sql.add('FROM                                                           ');
   _sql.sql.add('   DISPFINANC D,                                               ');
   _sql.sql.add('   RATEIODISPFINANC R                                          ');
   _sql.sql.add('WHERE                                                          ');
   _sql.sql.add('   D.IDDISPFINANC = R.IDDISPFINANC                             ');
   _sql.sql.add('   AND R.IDPESSOA = '+IntToStr(iIdPessoa)+'                    ');
   _sql.sql.add('   AND D.DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'') ');
   _sql.sql.add('GROUP BY                                                       ');
   _sql.sql.add('   D.DATADISPFINANC                                            ');
   _sql.sql.add('                                                               ');
   _sql.sql.add('ORDER BY IDPLANO,IDPATRO,TIPOREG                               ');

   //_sql.sql.savetofile('c:\SelDispAnalitica.txt');
   _sql.sql.savetofile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\SelDispAnalitica.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
   Result := GetDataPacket(_sql.sql.Text);
end;

function TCtrlDisponibxusu.BloqueiaDispFin(sStatus : string; iIdPessoa : integer; dDataRef : TDateTime): boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.BloqueiaDispFin(sStatus);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      Try
         StartTransaction;
         // DISPFINANC
         _sql.SQL.Clear;
         _sql.SQL.Add(' UPDATE PARAMFINANC SET FLGDISPBLOQ= '+ QuotedStr(sStatus) +', ');
         _sql.SQL.Add(' DATABLOQDISPFINAN = TO_DATE('+ QuotedStr(DateToStr(dDataRef)) + ',''DD/MM/YYYY'')');
         _sql.SQL.Add(' WHERE ');
         _sql.SQL.Add(' IDPESSOA = :IDPESSOA ');
         _sql.Prepare;
         _sql.ParamByName('IDPESSOA').AsInteger := iIdPessoa;

         if not ExecSQL(_sql.SQLChanged,False) Then
            Raise Exception.Create(MessageInfo);

         Commit;
         Result := True;
      except
         on E:Exception do
         begin
            Rollback;
            Result := False;
            MessageInfo := E.Message;
         end;
      end;
   end;
end;


end.



