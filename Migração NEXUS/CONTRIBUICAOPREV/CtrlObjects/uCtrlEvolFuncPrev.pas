// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Bruno Bastos
//  Rotina     : BuscaFuncoes
//  Pendência  : 22599
//  Data       : 20/06/2006
//  Descrição  : Inclusão do novo código de modofuncao. 
// -----------------------------------------------------------------------------

unit uCtrlEvolFuncPrev;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbEvolFuncPrev, uDbHistrubsal;

Type
  TCtrlEvolFuncPrev = class(TCmControlObject)
  private
    FCdsEvolFuncPrev: TCMClientDataSet;
    FDbEvolFuncPrev: TDbEvolFuncPrev;
    FDbHistrubsal: TDbHistrubsal;
    FCdsHIstRubSal: TCMClientDataSet;
    procedure SetCdsEvolFuncPrev(const Value: TCMClientDataSet);
    procedure SetDbEvolFuncPrev(const Value: TDbEvolFuncPrev
    );
    procedure SetDbHistrubsal(const Value: TDbHistrubsal);
    procedure SetCdsHIstRubSal(const Value: TCMClientDataSet);

  protected
    procedure DoChangeDataBase; Override;

  public


    constructor Create;  override;
    destructor  Destroy; override;

    property DbEvolFuncPrev : TDBEvolFuncPrev     read FDBEvolFuncPrev  write SetDBEvolFuncPrev;
    property DbHistrubsal   : TDbHistrubsal       read FDbHistrubsal write SetDbHistrubsal;

    property CdsEvolFuncPrev : TCMClientDataSet   read FCdsEvolFuncPrev write SetCdsEvolFuncPrev;
    property CdsHIstRubSal   : TCMClientDataSet   read FCdsHIstRubSal write SetCdsHIstRubSal;

    function ExisteEvolFuncPrev( sCodEvolFuncPrev : String ) : Boolean;
    function GravaEvolFuncPrev : Boolean;
    function GravaHistRubSal  : Boolean;

    Procedure AtualizaDataFinalCargo( pdtDataInicio: TDateTime;
                                      pcTipoOperacao : Char;
                                      piIdPessjur, piIdPessoa : Integer  );
    Procedure AtualizaOutrosDados;

    function BuscaCargos      ( piIdPessJur, piIdPessoa : Integer ): OleVariant;
    function BuscaFuncoes     ( piIdPessJur, piIdPessoa, piIdPlanoPrev : Integer ): OleVariant;
    function BuscaAdicCompens ( piIdPessJur, piIdPessoa : Integer ): OleVariant;
    function BuscaATS         ( piIdPessJur, piIdPessoa : Integer ): OleVariant;
    function BuscaAdicInsalub ( piIdPessJur, piIdPessoa : Integer ): OleVariant;
    function BuscaAdicNot     ( piIdPessJur, piIdPessoa : Integer ): OleVariant;
    function BuscaAdicPricul  ( piIdPessJur, piIdPessoa : Integer ): OleVariant;
    function BuscaRubSal      ( piIdPessJur, piIdPessoa : Integer ): OleVariant;

    function BuscaDetCalculo  ( piIdPessoa : Integer; psMesReferencia : String ): OleVariant;
  published

end;

implementation

{ TCtrlEvolFuncPrev }

constructor TCtrlEvolFuncPrev.Create;
begin
  inherited;
  FDBEvolFuncPrev  := TDBEvolFuncPrev.Create(Self);
  FDbHistrubsal    := TDbHistrubsal.Create(Self);
  FCdsEvolFuncPrev := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlEvolFuncPrev.Destroy;
begin
  FDBEvolFuncPrev.Free;
  FDbHistrubsal.Free;
  FCdsEvolFuncPrev.Free;
  inherited;
end;

procedure TCtrlEvolFuncPrev.DoChangeDataBase;
begin
  inherited;
  FDBEvolFuncPrev.DataBaseName := Self.DataBaseName;
  FDbHistrubsal.DataBaseName := Self.DataBaseName;
end;


function TCtrlEvolFuncPrev.GravaEvolFuncPrev : Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarEvolFuncPrev( CdsEvolFuncPrev.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsEvolFuncPrev, DBEvolFuncPrev, [], [] );

      Msg := DBEvolFuncPrev.MessageInfo;

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


function TCtrlEvolFuncPrev.GravaHistRubSal: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarEvolFuncPrev( CdsHistRubsal.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsHistRubsal, DbHistRubsal, [], [] );

      Msg := DbHistRubsal.MessageInfo;

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


procedure TCtrlEvolFuncPrev.SetCdsEvolFuncPrev(const Value: TCMClientDataSet);
begin
  FCdsEvolFuncPrev := Value;
end;

procedure TCtrlEvolFuncPrev.SetDBEvolFuncPrev(const Value: TDBEvolFuncPrev);
begin
  FDBEvolFuncPrev := Value;
end;

function TCtrlEvolFuncPrev.ExisteEvolFuncPrev( sCodEvolFuncPrev : String ) : Boolean;
begin
end;


function TCtrlEvolFuncPrev.BuscaCargos( piIdPessJur, piIdPessoa : Integer ): OleVariant;
Var
  sSQL: String;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaCargos;
  end else begin
    sSQL := 'SELECT DISTINCT '+
            '  E.ORIGEM,    E.SEQHISTFUNC, E.FLGSITPART,  E.QTDEMINUTOS, E.PERCADNOT,   '+
            '  E.IDPESSJUR, E.IDPESSOA,    E.IDPESSJURCG, E.IDCARGOEXT,  E.IDPESSJURFG, '+
            '  E.IDFUNCAO,  E.DATAINICIO,  E.DATAFINAL,   E.PERC1AC,     E.PERC2AC,     '+
            '  E.PERCATS,   E.PERCINSALUB, E.PERCPERICUL, E.PERCFUNCAO,  E.MODOFUNCAO,  '+
            '  CE.CODIGO,   CE.TITULO AS CARGO, '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.MODOFUNCAO, ''EF'', ''EFETIVO'',              '+
            '                       ''BC'', ''BOLSA DE CARGO'' ) AS DESCMODO, '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            '  EVOLFUNCPREV E, CARGOEXT CE, CARGOXNIVEL CN, NIVEL N '+
            'WHERE E.IDPESSJUR    = '+ IntToStr( piIdPessJur ) +
            '  AND E.IDPESSOA     = '+ IntToStr( piIdPessoa )  +
            '  AND CE.IDCARGOEXT  = E.IDCARGOEXT   '+
            '  AND CE.IDPESSJUR   = E.IDPESSJUR    '+
            '  AND CN.IDPESSJUR   = CE.IDPESSJUR   '+
            '  AND CN.IDCARGOEXT  = CE.IDCARGOEXT  '+
            '  AND N.IDNIVEL      = CN.IDNIVEL     '+
            '  AND N.IDPESSJUR    = CN.IDPESSJUR   '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';
    Result := GetDataPacket( sSQL );
  end;
end;


function TCtrlEvolFuncPrev.BuscaFuncoes( piIdPessJur, piIdPessoa, piIdPlanoPrev  : Integer ): OleVariant;
Var
  sSQL: String;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaFuncoes;
  end else begin
    sSQL := 'SELECT '+
            '  E.IDPESSJUR,       E.IDPESSOA,       E.SEQHISTFUNC, E.IDPESSJURCG,     E.IDCARGOEXT, '+
            '  E.IDPESSJURFG,     E.IDFUNCAO,       E.DATAINICIO,  E.DATAFINAL,       E.PERC1AC,    '+
            '  E.PERC2AC,         E.PERCATS,        E.PERCINSALUB, E.PERCPERICUL,     E.PERCFUNCAO, '+
            '  E.MODOFUNCAO,      E.ORIGEM,         E.FLGSITPART,  E.QTDEMINUTOS,     E.PERCADNOT,  '+
            '  GF.CODIGO GRUPO,                        '+
            '  F.CODIGO AS CODIGO, F.TITULO AS FUNCAO, '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.MODOFUNCAO, ''EF'', ''EFETIVA'',                '+
            '                       ''AS'', ''ASSEGURADA'',             '+
            '                       ''ES'', ''EVENTUAL/SUBSTITUIÇÃO'',  '+
            '                       ''DP'', ''DESIGNAÇÃO POR PRAZO'',   '+
            '                       ''FA'', ''FACULTATIVA'',            '+
            '                       ''ET'', ''ESTRATÉGICA'',            '+
            '                       ''BF'', ''BOLSA DE FUNÇÃO'',        '+
            '                       ''NE'', ''NÃO EFETIVA'',            '+
            '                       ''NÃO INFORMADO'') AS DESCMODO,     '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            '  EVOLFUNCPREV E,   PARTPREVPLAN PP,  CARGOEXT F,  GRUPOCARGOEXT GCE, '+
            '  GRUPOFUNC GF,     SITPART SIT                                       '+
            'WHERE E.IDPESSJUR       = '+ IntToStr( piIdPessJur )    +
            '  AND E.IDPESSOA        = '+ IntToStr( piIdPessoa )     +
            '  AND PP.IDPLANOPREV(+) = '+ IntToStr( piIdPlanoPrev )  +
            '  AND E.IDPESSJURFG     = F.IDPESSJUR     '+
            '  AND E.IDFUNCAO        = F.IDCARGOEXT    '+
            '  AND GCE.IDCARGOEXT    = E.IDFUNCAO      '+
            '  AND GF.IDGRUPOFUNC    = GCE.IDGRUPOFUNC '+
            '  AND PP.IDPESSOA(+)    = E.IDPESSOA      '+
            '  AND PP.IDPESSJUR(+)   = E.IDPESSJUR     '+
            '  AND SIT.IDSITPART(+)  = PP.IDSITPART    '+
            '  AND E.IDFUNCAO IS NOT NULL              '+
            '  AND E.PERC1AC  IS NULL                  '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';
    Result := GetDataPacket( sSQL );
  end;
end;

function TCtrlEvolFuncPrev.BuscaAdicCompens(piIdPessJur, piIdPessoa : Integer): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaAdicCompens;
  end else begin
    sSQL := 'SELECT '+
            '  E.IDPESSJUR,   E.IDPESSOA, E.SEQHISTFUNC, E.IDPESSJURCG,  E.IDCARGOEXT, '+
            '  E.IDPESSJURFG, E.IDFUNCAO, E.DATAINICIO,  E.DATAFINAL,    E.PERC1AC,    '+
            '  E.PERC2AC,     E.PERCATS,  E.PERCINSALUB, E.PERCPERICUL,  E.PERCFUNCAO, '+
            '  E.MODOFUNCAO,  E.ORIGEM,   E.FLGSITPART,   E.QTDEMINUTOS, E.PERCADNOT,  '+
            '  F.CODIGO,      F.TITULO AS FUNCAO,                                     '+
            '  GF.CODIGO GRUPO,                                                       '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.MODOFUNCAO, ''EF'', ''EFETIVA'',                '+
            '                       ''AS'', ''ASSEGURADA'',             '+
            '                       ''ES'', ''EVENTUAL/SUBSTITUIÇÃO'',  '+
            '                       ''DP'', ''DESIGNAÇÃO POR PRAZO'',   '+
            '                       ''FA'', ''FACULTATIVA'',            '+
            '                       ''BF'', ''BOLSA DE FUNÇÃO'',        '+
            '                       ''ET'', ''ESTRATÉGICA'',            '+
            '                       ''NE'', ''NÃO EFETIVA'',            '+
            '                       ''NÃO INFORMADO'') AS DESCMODO,     '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            ' CARGOEXT F, EVOLFUNCPREV E, GRUPOCARGOEXT GCE, GRUPOFUNC GF ' +
            'WHERE E.IDPESSJUR       = '+ IntToStr( piIdPessJur )    +
            '  AND E.IDPESSOA        = '+ IntToStr( piIdPessoa )     +
            '  AND    E.IDPESSJURFG    = F.IDPESSJUR(+)     '+
            '  AND    E.IDFUNCAO       = F.IDCARGOEXT(+) '+
            '  AND    GCE.IDCARGOEXT(+)   = E.IDFUNCAO '+
            '  AND    GF.IDGRUPOFUNC(+)   = GCE.IDGRUPOFUNC '+
            '  AND    GCE.DATAVIGENCIA = (SELECT MAX(G.DATAVIGENCIA) FROM GRUPOCARGOEXT G '+
            '                             WHERE G.IDPESSJUR = E.IDPESSJUR AND G.IDCARGOEXT = E.IDFUNCAO) '+
            '  AND    E.PERC1AC IS NOT NULL '+
            '  AND    E.PERC1AC > 0 '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';

    Result := GetDataPacket( sSQL );
  end;

end;


function TCtrlEvolFuncPrev.BuscaATS(piIdPessJur, piIdPessoa: Integer): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaATS;
  end else begin
    sSQL := 'SELECT '+
            '  E.IDPESSJUR,   E.IDPESSOA, E.SEQHISTFUNC, E.IDPESSJURCG, E.IDCARGOEXT, '+
            '  E.IDPESSJURFG, E.IDFUNCAO, E.DATAINICIO,  E.DATAFINAL,   E.PERC1AC,    '+
            '  E.PERC2AC,     E.PERCATS,  E.PERCINSALUB, E.PERCPERICUL, E.PERCFUNCAO, '+
            '  E.MODOFUNCAO,  E.ORIGEM,   E.FLGSITPART,  E.QTDEMINUTOS, E.PERCADNOT,  '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            ' EVOLFUNCPREV E ' +
            'WHERE E.IDPESSJUR       = '+ IntToStr( piIdPessJur )    +
            '  AND E.IDPESSOA        = '+ IntToStr( piIdPessoa )     +
            '  AND    PERCATS IS NOT NULL '+
            '  AND    PERCATS > 0         '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';

    Result := GetDataPacket( sSQL );
  end;

end;

function TCtrlEvolFuncPrev.BuscaAdicInsalub(piIdPessJur, piIdPessoa: Integer): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaAdicInsalub;
  end else begin
    sSQL := 'SELECT '+
            '  E.IDPESSJUR,   E.IDPESSOA, E.SEQHISTFUNC, E.IDPESSJURCG, E.IDCARGOEXT, '+
            '  E.IDPESSJURFG, E.IDFUNCAO, E.DATAINICIO,  E.DATAFINAL,   E.PERC1AC,    '+
            '  E.PERC2AC,     E.PERCATS,  E.PERCINSALUB, E.PERCPERICUL, E.PERCFUNCAO, '+
            '  E.MODOFUNCAO,  E.ORIGEM,   E.FLGSITPART,  E.QTDEMINUTOS, E.PERCADNOT,  '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            ' EVOLFUNCPREV E ' +
            'WHERE E.IDPESSJUR       = '+ IntToStr( piIdPessJur )    +
            '  AND E.IDPESSOA        = '+ IntToStr( piIdPessoa )     +
            '  AND    PERCINSALUB IS NOT NULL '+
            '  AND    PERCINSALUB > 0         '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';

    Result := GetDataPacket( sSQL );
  end;

end;


function TCtrlEvolFuncPrev.BuscaAdicNot(piIdPessJur, piIdPessoa: Integer): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaAdicNot;
  end else begin
    sSQL := 'SELECT '+
            '  E.IDPESSJUR,   E.IDPESSOA, E.SEQHISTFUNC, E.IDPESSJURCG, E.IDCARGOEXT, '+
            '  E.IDPESSJURFG, E.IDFUNCAO, E.DATAINICIO,  E.DATAFINAL,   E.PERC1AC,    '+
            '  E.PERC2AC,     E.PERCATS,  E.PERCINSALUB, E.PERCPERICUL, E.PERCFUNCAO, '+
            '  E.MODOFUNCAO,  E.ORIGEM,   E.FLGSITPART,  E.QTDEMINUTOS, E.PERCADNOT,  '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            ' EVOLFUNCPREV E ' +
            'WHERE E.IDPESSJUR       = '+ IntToStr( piIdPessJur )    +
            '  AND E.IDPESSOA        = '+ IntToStr( piIdPessoa )     +
            '  AND  ( ( (PERCADNOT IS NOT NULL) AND (PERCADNOT > 0) )  OR '+
            '         ( (QTDEMINUTOS  IS NOT NULL) AND (QTDEMINUTOS  > 0) )   ) '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';

    Result := GetDataPacket( sSQL );
  end;

end;

function TCtrlEvolFuncPrev.BuscaAdicPricul(piIdPessJur, piIdPessoa: Integer): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaAdicPricul;
  end else begin
    sSQL := 'SELECT '+
            '  E.IDPESSJUR,   E.IDPESSOA, E.SEQHISTFUNC, E.IDPESSJURCG, E.IDCARGOEXT, '+
            '  E.IDPESSJURFG, E.IDFUNCAO, E.DATAINICIO,  E.DATAFINAL,   E.PERC1AC,    '+
            '  E.PERC2AC,     E.PERCATS,  E.PERCINSALUB, E.PERCPERICUL, E.PERCFUNCAO, '+
            '  E.MODOFUNCAO,  E.ORIGEM,   E.FLGSITPART,  E.QTDEMINUTOS, E.PERCADNOT,  '+
            '  DECODE(E.ORIGEM, ''I'', ''Interface'',                 '+
            '                   ''C'', ''Cadastrado'',                '+
            '                   ''E'', ''Evento de Manutenção'',      '+
            '                   ''R'', ''Retroativo'') AS DESCORIGEM, '+
            '  DECODE(E.FLGSITPART, ''AS'', ''Assistido'', '+
            '                       ''AT'', ''Ativo'',     '+
            '                               ''Outros'') AS DESCSITCADASTRADA   '+
            'FROM '+
            ' EVOLFUNCPREV E ' +
            'WHERE E.IDPESSJUR       = '+ IntToStr( piIdPessJur )    +
            '  AND E.IDPESSOA        = '+ IntToStr( piIdPessoa )     +
            '  AND    PERCPERICUL IS NOT NULL '+
            '  AND    PERCPERICUL > 0         '+
            'ORDER BY '+
            '  E.DATAINICIO DESC ';

    Result := GetDataPacket( sSQL );
  end;

end;

function TCtrlEvolFuncPrev.BuscaRubSal(piIdPessJur, piIdPessoa: Integer): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaRubSal;
  end else begin
    sSQL := 'SELECT '+
            ' H.CODPROVDESC,  H.FLGCOMPOEREMTOTAL, H.FLGCOMPOESALBENEF, H.FLGCOMPOESALPART, '+
            ' H.FLGCONCESSAO, H.FLGIRRF,           H.FLGPREVIA,         H.FLGSALBENEFRETRO, '+
            ' H.FLGSRB,       H.FLGSALPARTATUARIA, H.FLGSALPARTRETRO,   H.IDMODULO,         '+
            ' H.IDMOTIVO,     H.IDPATRO,           H.IDPESSJUR,         H.IDPESSOA,         '+
            ' H.IDRUBRICA,    H.IDREGRACALCULO,    H.MES,               H.MESCOBRANCA,      '+
            ' H.REFERENCIA,   H.SEQRUBRICA,        H.VALORPROVENTO,     H.VALORNADIB,       '+
            ' H.TIPOITEMPCS,  H.PERCENTUALNADIB,   H.FLGEQUIPARACAO,   '+
            ' DECODE(H.IDMODULO, 16, ''AdmPREV'', 32, ''CCP'', '+
            '                    21, ''Folha de Pagamento CM'', ''Outros'') AS MODULO, '+
            ' R.DESCRPROVDESC '+

            'FROM '+
            '  RUBRICAXPESS R, HISTRUBSAL H '+
            'WHERE H.IDPESSJUR   = '+ IntToStr( piIdPessJur )    +
            '  AND H.IDPESSOA    = '+ IntToStr( piIdPessoa )     +
            '  AND H.IDPESSJUR   = R.IDPESSOA  '+
            '  AND H.IDRUBRICA   = R.IDRUBRICA '+
            '  AND H.TIPOITEMPCS = 1'+
            '  AND H.FLGEQUIPARACAO = 1       '+
            'ORDER BY '+
            '  H.MES DESC, H.CODPROVDESC DESC ';

    Result := GetDataPacket( sSQL );
  end;

end;


function TCtrlEvolFuncPrev.BuscaDetCalculo(piIdPessoa: Integer;
                                           psMesReferencia: String): OleVariant;
Var
  sSQL: String;
begin

  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.BuscaDetCalculo;
  end else begin
    sSQL := 'SELECT '+
            '  D.IDDETCALCULO, D.DESCRICAO , D.VALOR '+
            'FROM   '+
            '  DETCALCULO D '+
            'WHERE  '+
            '  D.IDPESSOA = '+IntToStr( piIdPessoa )+
            '  AND D.ANOMESREF = '+QuotedStr( psMesReferencia )+
            'ORDER BY '+
            '  D.IDDETCALCULO ';

    Result := GetDataPacket( sSQL );
  end;


end;


procedure TCtrlEvolFuncPrev.AtualizaDataFinalCargo( pdtDataInicio : TDateTime;
                                                    pcTipoOperacao : Char;
                                                    piIdPessjur, piIdPessoa : Integer  );
Var
  sSQL : String;
begin

  If pcTipoOperacao = 'I' Then Begin { Inserindo }

    sSQL := 'UPDATE EVOLFUNCPREV '+
            '  SET DATAFINAL = TO_DATE('''+ DateToStr(pdtDataInicio - 1)+''')'+
            'WHERE IDPESSOA  = '+ IntToStr( piIdPessoa ) +
            '  AND IDPESSJUR = '+ IntToStr( piIdPessJur ) +
            '  AND IDCARGOEXT IN (SELECT IDCARGOEXT FROM EVOLFUNCPREV '+
            '                     WHERE IDPESSOA  = '+ IntToStr( piIdPessjur ) +
            '                       AND IDPESSJUR = '+ IntToStr( piIdPessoa )  +
            '                       AND IDCARGOEXT IS NOT NULL) '+

            '  AND DATAINICIO = (SELECT MAX(DATAINICIO) '+
            '                    FROM EVOLFUNCPREV '+
            '                     WHERE IDPESSOA  = '+ IntToStr( piIdPessjur ) +
            '                       AND IDPESSJUR = '+ IntToStr( piIdPessoa )  +
            '                      AND IDCARGOEXT IS NOT NULL)';

  End Else If pcTipoOperacao = 'E' Then Begin { Editando }

    sSQL := 'UPDATE EVOLFUNCPREV '+
            '  SET DATAFINAL = TO_DATE('''+ DateToStr(pdtDataInicio - 1)+''') '+
            'WHERE IDPESSOA = '+ IntToStr( piIdPessoa ) +
            '  AND SEQHISTFUNC = (SELECT MAX(SEQHISTFUNC) FROM EVOLFUNCPREV '+
            ' 	            WHERE IDPESSOA  = '+ IntToStr( piIdPessoa )  +
            ' 	              AND IDPESSJUR = '+ IntToStr( piIdPessJur ) +
            ' 	              AND IDCARGOEXT IN (SELECT IDCARGOEXT FROM EVOLFUNCPREV '+
            ' 			                 WHERE IDPESSOA  = '+ IntToStr( piIdPessoa )  +
            ' 			                   AND IDPESSJUR = '+ IntToStr( piIdPessJur ) +
            ' 			                   AND IDCARGOEXT IS NOT NULL) '+
            '                       AND SEQHISTFUNC <> (SELECT MAX(SEQHISTFUNC)     FROM EVOLFUNCPREV '+
            ' 		                          WHERE IDPESSOA  = '+ IntToStr( piIdPessoa ) +
            ' 			                    AND IDPESSJUR = '+ IntToStr( piIdPessJur ) +
            ' 			                    AND IDCARGOEXT IS NOT NULL)) ';

    End;

  ExecSQL( sSQL );
end;


procedure TCtrlEvolFuncPrev.AtualizaOutrosDados;
begin
end;



procedure TCtrlEvolFuncPrev.SetDbHistrubsal(const Value: TDbHistrubsal);
begin
  FDbHistrubsal := Value;
end;



procedure TCtrlEvolFuncPrev.SetCdsHIstRubSal(const Value: TCMClientDataSet);
begin
  FCdsHIstRubSal := Value;
end;



end.
