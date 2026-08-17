unit UctrlGia;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;

Type
    TCtrlGia = Class(TCmControlObject)

    private
    protected

      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;override;
    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      //Pega dados do contabilista responsável
      function ListDadosContabilista(Idpessoa : longInt) : Olevariant;
      //Pega dados do contabilista responsável
      function LisDadosEmpresa(Idpessoa : LongInt) : Olevariant;
      //Pega os lançamentos de entrada
      function ListDadosApuracaoEntrada(IdEmpresa : LongInt;PeriodoIni, PeriodoFim, Tipo : string) : OleVariant;
      function ListResumoApuracao(IdEmpresa : LongInt;PeriodoIni, PeriodoFim, Tipo : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlGia }


procedure TCtrlGia.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlGia.Create;
begin
  inherited;

end;

destructor TCtrlGia.Destroy;
begin
  inherited;

end;

procedure TCtrlGia.DoChangeDataBase;
begin
  inherited;

end;


function TCtrlGia.LisDadosEmpresa(Idpessoa: Integer): Olevariant;
Var
 Ssql : string;
begin
  Ssql := 'SELECT   P.RAZAOSOCIAL, P.NUMDOCUMENTO, D.NUMDOCUMENTO AS INSCEST,'+
          '         REPLACE(REPLACE(REPLACE(T.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, T.DDD '+
          '  FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES, DOCPESSOA D, PARAMLIVRO PR, '+
          '        (SELECT IDENDERECO, Numero, Tipo, MAX(IDTELEFONE) AS IDTELEFONE, DDD '+
          '           FROM TELENDPESS GROUP BY IDENDERECO, NUMERO, TIPO, DDD) T '+
          ' WHERE  (P.IDPESSOA = '+IntToStr(IdPessoa) +') AND '+
          '        (P.IDPESSOA = PR.IDPESSOA) AND '+
          '        (PR.IDPESSOA = D.IDPESSOA) AND '+
          '        (PR.IDINSCEST = D.IDDOCUMENTO) AND '+
          '        (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND '+
          '        (EN.IDCIDADES     = C.IDCIDADES(+)) AND '+
          '        (ES.IDESTADO(+)    = C.IDESTADO) AND '+
          '        (EN.IDPESSOA(+)   = P.IDPESSOA) AND '+
          '        (EN.IDENDERECO = T.IDENDERECO(+))';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGia.ListDadosApuracaoEntrada(IdEmpresa : LongInt;PeriodoIni, PeriodoFim, Tipo : string): OleVariant;
Var
 ssql : string;
begin
  Ssql :=  'SELECT SUBSTR(LD.CODFISCAL,1,4) CODFISCAL, (LD.BASECALCULO * 100) AS BASECALCULO, '+
           '       (LD.VALORIMPOSTO * 100) AS VALORIMPOSTO, (LD.VALORCONTABIL * 100) AS VALORCONTABIL, '+
           '       (LD.VALOROUTROS * 100) AS VALOROUTROS, (LD.VALORISENTO * 100) AS VALORISENTO '+
           '  FROM NFLIVRODETALHE LD, NFLIVRO L '+
           ' WHERE (L.FLGENTRADASAIDA = '+quotedStr(Tipo)+') '+
           '   AND (L.IDPESSOA = '+intTostr(IdEmpresa)+') '+
           '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(PeriodoIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(PeriodoFim)+ ', ''DD/MM/YYYY'')) '+
           '   AND (L.IDNFLIVRO = LD.IDNFLIVRO) '+
           ' ORDER BY CODFISCAL ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlGia.ListDadosContabilista(Idpessoa: Integer): Olevariant;
Var
Ssql : string;
begin
  Ssql := 'SELECT   P.NOME, P.EMAIL, '+
          '         REPLACE(REPLACE(REPLACE(T.NUMERO, ''-''), ''(''), '')'') AS TELEFONE, T.DDD '+
          '  FROM  PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES,  '+
          '        (SELECT IDENDERECO, Numero, Tipo, MAX(IDTELEFONE) AS IDTELEFONE,DDD '+
          '           FROM TELENDPESS GROUP BY IDENDERECO, NUMERO, TIPO, DDD) T '+
          ' WHERE  (P.IDPESSOA = '+IntToStr(IdPessoa) +') AND '+
          '        (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND '+
          '        (EN.IDCIDADES     = C.IDCIDADES(+)) AND '+
          '        (ES.IDESTADO(+)    = C.IDESTADO) AND '+
          '        (EN.IDPESSOA(+)   = P.IDPESSOA) AND '+
          '        (EN.IDENDERECO = T.IDENDERECO(+))';
  Result := GetDataPacket(Ssql);

end;


function TCtrlGia.ListResumoApuracao(IdEmpresa: Integer; PeriodoIni,
                                     PeriodoFim, Tipo: string): OleVariant;
Var
 Ssql : string;
begin
  Ssql :=  'SELECT SUM((LD.VALORIMPOSTO * 100)) AS VALORIMPOSTO, SUM((LD.VLRICMSSUBST * 100)) AS VLRICMSSUBST '+
           '  FROM NFLIVRODETALHE LD, NFLIVRO L '+
           ' WHERE (L.FLGENTRADASAIDA = '+quotedStr(Tipo)+') '+
           '   AND (L.IDPESSOA = '+intTostr(IdEmpresa)+') '+
           '   AND (L.DATAENTRADANF BETWEEN TO_DATE('+quotedStr(PeriodoIni)+', ''DD/MM/YYYY'') AND TO_DATE('+quotedStr(PeriodoFim)+ ', ''DD/MM/YYYY'')) '+
           '   AND (L.IDNFLIVRO = LD.IDNFLIVRO) ';
  Result := GetDataPacket(Ssql);

end;

procedure TCtrlGia.OnCreateAppServer;
begin
  inherited;

end;

end.
