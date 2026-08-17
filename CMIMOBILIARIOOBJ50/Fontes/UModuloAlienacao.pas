unit UModuloAlienacao;

interface
Uses SysUtils, wwQuery;

type TModulo = Class
   private
      FsMascaraReceb      : String;
      FsMascaraDesemb     : String;
      FbIntegraContab     : Boolean;
      FsCentroCusto       : String;
      FbIntegraGestao     : Boolean;
      FbIntegraCAPCAR     : Boolean;
      FiPrograma          : Integer;
      FiMoedaCorrente     : integer;
      FsMoedaCorrente     : String;
      FsPlanoPatro        : String;
      Procedure Limpa;
   public
      property sMascaraDesemb     : String  read FsMascaraDesemb;
      property sMascaraReceb      : String  read FsMascaraReceb;
      property bIntegraContab     : Boolean read FbIntegraContab;
      property bIntegraCAPCAR     : Boolean read FbIntegraCAPCAR;
      property bIntegraGestao     : Boolean read FbIntegraGestao;
      property iPrograma          : Integer read FiPrograma;
      property sCentroCusto       : String  read FsCentroCusto;
      property sMoedaCorrente     : String  read FsMoedaCorrente;
      property iMoedaCorrente     : Integer read FiMoedaCorrente;
      property sPlanoPatro        : String  read FsPlanoPatro;

      Constructor Create;
      Procedure GetParams( idEmpresa : Integer );
   end;

var Modulo : TModulo;

implementation
Uses uDataBase, DBaseDados;

{ TModulo }

procedure TModulo.Limpa;
begin
   FsMascaraReceb      := '';
   FsMascaraDesemb     := '';
   FbIntegraContab     := False;
   FsCentroCusto       := '';
   FbIntegraGestao     := False;
   FbIntegraCAPCAR     := False;
   FiPrograma          := 0;
   FsMoedaCorrente     := '';
   FiMoedaCorrente     := 0;
   FsPlanoPatro        := '';
end;

constructor TModulo.Create;
begin
  inherited;
  Limpa;
end;

procedure TModulo.GetParams(idEmpresa: Integer);
Var
   SQL : String;
begin
   Limpa;
//----------------------------------------------------------------------------------------------------------------
   SQL := ' SELECT MASCARADESEMB FROM PARAMCAP '+
          ' WHERE ( IDPESSOA = '+IntToStr(idEmpresa)+' ) '+
          ' AND   ( RECPAG =''R'' ) ';
   if FazQuery(DtmBaseDados.qry,SQL) then begin
      FsMascaraDesemb := DtmBaseDados.qry.FieldByName('MASCARADESEMB').asString;
   end;
//----------------------------------------------------------------------------------------------------------------
   SQL := ' SELECT MASCARADESEMB FROM PARAMCAP '+
          ' WHERE ( IDPESSOA = '+IntToStr(idEmpresa)+' ) '+
          ' AND   ( RECPAG =''P'' ) ';
   if FazQuery(DtmBaseDados.qry,SQL) then begin
      FsMascaraReceb := DtmBaseDados.qry.FieldByName('MASCARADESEMB').asString;
   end;
//----------------------------------------------------------------------------------------------------------------
   SQL := 'SELECT L.NOME||' + QuotedStr('/') + '||P.NOME AS NOME '+
          '  FROM PARAMGLOBAL G, PLANPREV L, PESSOA P, PATRO PA '+
          ' WHERE G.IDPLANOPREV = L.IDPLANOPREV '+
          '   AND G.IDPATRO = PA.IDPESSOA '+
          '   AND PA.IDPESSOA = P.IDPESSOA ';
   if FazQuery(DtmBaseDados.qry,SQL) then begin
      FsPlanoPatro      := DtmBaseDados.qry.FieldByName('NOME').asString;
   end;
//----------------------------------------------------------------------------------------------------------------
   SQL := ' SELECT FLGINTEGRACAPCAR,FLGINTEGRAGESTAO, ' +
          '        FLGINTEGRACONTAB,IDPROGRAMA,CODCENTROCUSTO ' +
          ' FROM PARAMIMOVEL ' +
          ' WHERE ( IDPESSOA = '+IntToStr(idEmpresa)+ ' ) ';
   if FazQuery(DtmBaseDados.qry,SQL) then begin
      FbIntegraCAPCAR     := DtmBaseDados.qry.FieldByName('FLGINTEGRACAPCAR').asInteger = 1;
      FbIntegraGestao     := DtmBaseDados.qry.FieldByName('FLGINTEGRAGESTAO').asInteger = 1;
      FbIntegraContab     := DtmBaseDados.qry.FieldByName('FLGINTEGRACONTAB').asInteger = 1;
      FiPrograma          := DtmBaseDados.qry.FieldByName('IDPROGRAMA').asInteger;
      FsCentroCusto       := DtmBaseDados.qry.FieldByName('CODCENTROCUSTO').AsString;
   end;
//----------------------------------------------------------------------------------------------------------------
   SQL := 'SELECT PG.USACRESPON, PG.USAABC, PG.CODCENTRORESPON, PG.UNIDNEGOC, ' +
          '       PG.MOEDACORRENTE, PG.IDPATRO, PG.IDPLANOPREV, M.MOESIGLA ' +
          'FROM   PARAMGLOBAL PG, MOEDA M ' +
          'WHERE  ( PG.MOEDACORRENTE = M.MOECODIGO(+) ) ' +
          '  AND  ( IDPESSOA = '+IntToStr(idEmpresa)+' ) ';
   if FazQuery(DtmBaseDados.qry,SQL) then begin
      FsMoedaCorrente  := DtmBaseDados.qry.FieldByName('MOESIGLA').asString;
      FiMoedaCorrente  := DtmBaseDados.qry.FieldByName('MOEDACORRENTE').asInteger;
   end;
end;


end.



