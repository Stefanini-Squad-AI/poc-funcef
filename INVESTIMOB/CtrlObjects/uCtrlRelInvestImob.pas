{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27496
Responsável  : Daniel Simões
Data         : 28/02/2008
Descrição    : Alteração do número de casas decimais do campo 'FATOR' na query
               aberta em tempo de execução na função 'BuscaRelInvestPPatroPart'
               de 4 casas decimais para 10 casas...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27316
Responsável  : Daniel Simões
Data         : 29/01/2008
Descrição    : Ajuste referente à pendência 27187...
--------------------------------------------------------------------------------
Padrão       : 5.10.19
Congelado(s) : 5.10.16 / 5.10.17 / 5.10.18
Pendência    : 27187
Responsável  : Daniel Simões
Data         : 10/01/2008
Descrição    : Implementação de parâmetro na função 'BuscaRelLancObra' ...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit uCtrlRelInvestImob;

interface

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDiasUteis;

type TCtrlRelInvestimob = class(TCMControlObject)

     Private

     Protected

     Public
       function BuscaRelSaldoImovel (const iIdMestre, iIdImovel, iIdPessoa, iIdMoedaCAF, iIdPaisCAF:Integer; const dDataBase:TDateTime) : OLEVariant;
       function BuscaRelReavalia    (const dDataReav:TDateTime; const iIdMoedaCAF, iIdEmpresa : Integer;
                                     const iIdMestre:Integer = -1; const sCodTipImovel:String = '') : OLEVariant;
       function BuscaRelLancObra    (const iIdEmpresa:Integer; const iIdObra:Integer = -1; const dLimite:TDateTime = -1; const bAtiva:Boolean = True) : OLEVariant;

       // Imóveis com bens ativos sem reavaliação
       // Marcos Topini - 11/05/2005 - Pend. 18813
       function BucaRelNaoReavalia(const iAno :Integer = -1): OLEVariant;

       // Marcio Motta - 01/07/2004 - 17089
       function BuscaRelInvestPPatroPart (const iIdEmpresa, iIdMoedaCAF, iIdPaisCAF:integer; const dDataSaldo:TDateTime; const PPatro:integer = -1; const PPlano:integer = -1) : OLEVariant;

     Published

end;

implementation

{ TCtrlRelInvestimob }


function TCtrlRelInvestimob.BuscaRelInvestPPatroPart(const iIdEmpresa, iIdMoedaCAF, iIdPaisCAF: integer; const dDataSaldo: TDateTime;
                                                     const PPatro: integer;     const PPlano: integer): OLEVariant;
var
  sSql, sParamPlanoPatro, sParam, sDataSaldo : string;

begin
  // Define Parâmetros
  sDataSaldo := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataSaldo)) + ',''DD/MM/YYYY'')';

  sParamPlanoPatro := '';
  if PPatro > 0 then
    sParamPlanoPatro := ' AND (PI.IDPATRO = ' + IntToStr(PPatro) + ')';

  if PPlano > 0 then
    if sParamPlanoPatro <> '' then
      sParamPlanoPatro := sParamPlanoPatro +#13+ ' AND (PL.IDPLANOPREV = ' + IntToStr(PPlano) + ')'
    else
      sParamPlanoPatro := ' AND (PL.IDPLANOPREV = ' + IntToStr(PPlano) + ')';

  // Define SQL
  sSql := 'SELECT TP.DESCTIPOIMOVEL,' +#13+
          '       IM.NOME,          ' +#13+
          '       IM.IDIMOVEL,      ' +#13+
          '       FT.IDPATRO,       ' +#13+
          '       FT.NOME_PATRO,    ' +#13+
          '       FT.IDPLANOPREV,   ' +#13+
          '       FT.NOME_PLANO,    ' +#13+
          '       IXP.PERCENTUAL,   ' +#13+
          '                         ' +#13+
          '       ROUND(SUM(SB.SUMVALCTB * NVL(FT.FATOR,1)),2)  AS VALCTB0 ' +#13+
          '                                                                                        '+#13+
          '  FROM /* SELECIONA O SALDO CONTÁBIL DOS BENS */                                        '+#13+
          '       ( SELECT /*+ RULE */                                                             '+#13+
          '                B1.IDBEM,                                                               '+#13+
          '                ( ROUND(SUM(NVL(SB1.VALORG,0)) ,2) + ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -  '+#13+
          '                  ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) - ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) + '+#13+
          '                  ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +     '+#13+
          '                  ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -       '+#13+
          '                  ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -   '+#13+
          '                  ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2)         '+#13+
          '                ) AS SUMVALCTB                                                          '+#13+
          '           FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,                                  '+#13+
          '                BEM B1, GRUPO G1,                                                       '+#13+
          '                (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA                        '+#13+
          '                   FROM SALDOCONTABBEM                       '+#13+
          '                  WHERE DATASLDBEM <= ' + sDataSaldo          +#13+
          '                    AND MOECODIGO = ' + IntToStr(iIdMoedaCAF) +#13+
          '                    AND IDPESSOA  = ' + IntToStr(iIdEmpresa)  +#13+
          '                  GROUP BY IDBEM, IDPESSOA) MAX1             '+#13+
          '          WHERE B1.DATAINICIODEP <= ' + sDataSaldo            +#13+
          '            AND G1.FLGIMOVEL = 1                             '+#13+
          '            AND SB1.MOECODIGO = ' + IntToStr(iIdMoedaCAF)     +#13+
          '            AND SB1.IDPESSOA  = ' + IntToStr(iIdEmpresa)      +#13+
          '            AND SD1.IDSLDCTBBEMXDEP = ' + IntToStr(iIdPaisCAF)+#13+
          '            AND B1.IDPESSOA = ' + IntToStr(iIdEmpresa)        +#13+
          '            AND SB1.IDBEM = MAX1.IDBEM                       '+#13+
          '            AND SB1.IDPESSOA = MAX1.IDPESSOA                 '+#13+
          '            AND SB1.DATASLDBEM = MAX1.DATA                   '+#13+
          '            AND SB1.IDBEM = SD1.IDBEM                        '+#13+
          '            AND SB1.IDPESSOA = SD1.IDPESSOA                  '+#13+
          '            AND SB1.DATASLDBEM = SD1.DATASLDBEM              '+#13+
          '            AND SB1.MOECODIGO = SD1.MOECODIGO                '+#13+
          '            AND SB1.IDBEM = B1.IDBEM                         '+#13+
          '            AND SB1.IDPESSOA = B1.IDPESSOA                   '+#13+
          '            AND SB1.IDGRUPO = G1.IDGRUPO                     '+#13+
          '      GROUP BY B1.IDBEM  ) SB,                               '+#13+
          '                                                             '+#13+
          '       /* SELECIONA OS IMÓVEIS MESTRES */                    '+#13+
          '       (SELECT IDIMOVEL, IMONOME AS NOME                     '+#13+
          '          FROM IMOVEL                                        '+#13+
          '         WHERE IDIMOVELMESTRE IS NULL) IM,                   '+#13+
          '                                                             '+#13+
          '       IMOVEL I, TIPOIMOVEL TP, IMOVELXBEM IXB, BEM B, GRUPO G, IMOVELXPROP IXP, ' +#13+
          '                                                                                 ' +#13+
          '       /* SELECIONA PERCENTUAIS DE PARTICIPAÇÃO PLANO_X_PATRO */                 ' +#13+
          '       (SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV,                          ' +#13+
          '               PE.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,                     ' +#13+
          '               PI.FLGTIPO, PI.PPIPERCENTRATEIO, TT.TOTAL,                        ' +#13+
          '               ROUND(DECODE(PI.FLGTIPO,''P'',(PI.PPIPERCENTRATEIO / 100),        ' +#13+
          '                                       ''C'',(PI.PPIPERCENTRATEIO / TT.TOTAL),   ' +#13+
          '                                        NULL), 10) AS FATOR                      ' +#13+ // Daniel - 27496
          '          FROM PLANOPATROXIMOVEL PI, PESSOA PE, PLANPREVCONTABIL PL,             ' +#13+
          '               (SELECT IDIMOVEL,                                                 ' +#13+
          '                       SUM(PPIPERCENTRATEIO) AS TOTAL                            ' +#13+
          '                  FROM PLANOPATROXIMOVEL                                         ' +#13+
          '                 GROUP BY IDIMOVEL) TT                                           ' +#13+
          '         WHERE PI.IDIMOVEL    = TT.IDIMOVEL                                      ' +#13+
          '           AND PI.IDPATRO     = PE.IDPESSOA                                      ' +#13+
          '           AND PI.IDPLANOPREV = PL.IDPLANOPREV                                   ' +#13+
                      sParamPlanoPatro + ') FT' +#13+
          '                                                                                 ' +#13+
          ' WHERE (B.DATAINICIODEP <= ' + sDataSaldo + ')' +#13+
          '   AND (G.FLGIMOVEL = 1)                                                         ' +#13+
          '   AND (ABS(SB.SUMVALCTB) >= 0.01)          ' +#13+
          '   AND (IXB.IDPESSOA = B.IDPESSOA)          ' +#13+
          '   AND (IXB.IDBEM    = B.IDBEM)             ' +#13+
          '   AND (IXB.IDIMOVEL = I.IDIMOVEL)          ' +#13+
          '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)     ' +#13+
          '   AND (IXB.IDIMOVEL = FT.IDIMOVEL(+))      ' +#13+
          '   AND (B.IDGRUPO = G.IDGRUPO)              ' +#13+
          '   AND (B.IDBEM = SB.IDBEM)                 ' +#13+
          '   AND (I.IDIMOVELMESTRE = IXP.IDIMOVEL(+)) ' +#13+
          '   AND (IXP.IDPROPRIETARIOUH = ' + IntToStr(iIdEmpresa) + ')' +#13+
          '   AND (TP.CODTIPIMOVEL = I.CODTIPIMOVEL)   ' +#13+
          '                                            ' +#13+
          ' GROUP BY TP.DESCTIPOIMOVEL, IM.NOME, IM.IDIMOVEL,                          ' +#13+
          '          FT.IDPATRO, FT.NOME_PATRO, FT.IDPLANOPREV, FT.NOME_PLANO,         ' +#13+
          '          IXP.PERCENTUAL                                                    ' +#13+
          '                                                                            ' +#13+
          'UNION                                                                       ' +#13+
          '                                                                            ' +#13+
          'SELECT TP.DESCTIPOIMOVEL,                                                   ' +#13+
          '       IM.IMONOME AS NOME,                                                  ' +#13+
          '       IM.IDIMOVEL,                                                         ' +#13+
          '       FT.IDPATRO,                                                          ' +#13+
          '       FT.NOME_PATRO,                                                       ' +#13+
          '       FT.IDPLANOPREV,                                                      ' +#13+
          '       FT.NOME_PLANO,                                                       ' +#13+
          '       IXP.PERCENTUAL,                                                      ' +#13+
          '       SUM(L.VALOFI * NVL(FT.FATOR,1)) AS VALCTB0                           ' +#13+
          '                                                                            ' +#13+
          '  FROM CAFOBRALANC L, CAFOBRA O,                                            ' +#13+
          '       GRUPO G, IMOVEL I, TIPOIMOVEL TP, IMOVEL IM, IMOVELXPROP IXP,        ' +#13+
          '                                                                            ' +#13+
          '       /* SELECIONA PERCENTUAIS DE PARTICIPAÇÃO PLANO_X_PATRO */            ' +#13+
          '       (SELECT PI.IDIMOVEL, PI.IDPATRO, PI.IDPLANOPREV,                     ' +#13+
          '               PE.NOME AS NOME_PATRO, PL.NOME AS NOME_PLANO,                ' +#13+
          '               PI.FLGTIPO, PI.PPIPERCENTRATEIO, TT.TOTAL,                   ' +#13+
          '               ROUND(DECODE(PI.FLGTIPO,''P'',(PI.PPIPERCENTRATEIO / 100),     ' +#13+
          '                                       ''C'',(PI.PPIPERCENTRATEIO / TT.TOTAL),' +#13+
          '                                        NULL), 10) AS FATOR                   ' +#13+ // Daniel - 27496
          '         FROM PLANOPATROXIMOVEL PI, PESSOA PE, PLANPREVCONTABIL PL,         ' +#13+
          '              (SELECT IDIMOVEL,                                             ' +#13+
          '                  SUM(PPIPERCENTRATEIO) AS TOTAL                            ' +#13+
          '                 FROM PLANOPATROXIMOVEL                                     ' +#13+
          '              GROUP BY IDIMOVEL) TT                                         ' +#13+
          '        WHERE PI.IDIMOVEL    = TT.IDIMOVEL                                  ' +#13+
          '          AND PI.IDPATRO     = PE.IDPESSOA                                  ' +#13+
          '          AND PI.IDPLANOPREV = PL.IDPLANOPREV                               ' +#13+
                         sParamPlanoPatro + ') FT' +#13+
          '                                                                            ' +#13+
          ' WHERE (L.IDCAFOBRA = O.IDCAFOBRA)                                          ' +#13+
          '   AND (L.IDGRUPO = G.IDGRUPO)                                              ' +#13+
          '   AND (O.IDIMOVEL = I.IDIMOVEL)                                            ' +#13+
          '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)                                     ' +#13+
          '   AND (FT.IDIMOVEL = I.IDIMOVEL(+))                                        ' +#13+
          '   AND (O.DTAENCERRAOBRA IS NULL)                                           ' +#13+
          '   AND (L.DTALANCAMENTO <= ' + sDataSaldo + ')' +#13+
          '   AND (O.IDIMOVEL = IXP.IDIMOVEL(+))                                       ' +#13+
          '   AND (IXP.IDPROPRIETARIOUH = ' + IntToStr(iIdEmpresa) + ')' +#13+
          '   AND (TP.CODTIPIMOVEL = I.CODTIPIMOVEL)                                   ' +#13+
          '                                                                            ' +#13+
          ' GROUP BY TP.DESCTIPOIMOVEL, IM.IMONOME, IM.IDIMOVEL,                       ' +#13+
          '          FT.IDPATRO, FT.NOME_PATRO, FT.IDPLANOPREV, FT.NOME_PLANO,         ' +#13+
          '          IXP.PERCENTUAL                                                    ' +#13+
          '                                                                            ' +#13+
          ' ORDER BY DESCTIPOIMOVEL, NOME, NOME_PATRO, NOME_PLANO                      ' ;

  Result := GetDataPacket( sSql );
end;

function TCtrlRelInvestimob.BuscaRelLancObra(const iIdEmpresa, iIdObra: Integer; const dLimite:TDateTime; const bAtiva:Boolean): OLEVariant;
var sSql, sParam : String;
begin
  // Define Parametros
  sParam  := ' AND LO.IDPESSOA = ' + IntToStr(iIdEmpresa) +#13;
  if iIdObra <> -1 then sParam := sParam + ' AND LO.IDCAFOBRA = ' + IntToStr(iIdObra) +#13;
  if dLimite  >  0 then sParam := sParam + ' AND LO.DTALANCAMENTO <= TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dLimite)) + ',''DD/MM/YYYY'') ' +#13;

  // Daniel - 27187                                                                    Daniel - 27316
  if bAtiva = True then sParam := sParam + ' AND ( O.DTAENCERRAOBRA IS NULL OR O.DTAENCERRAOBRA > TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dLimite)) + ',''DD/MM/YYYY'') )' +#13;

  // Define Sql
  sSql := 'SELECT TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', dLimite)) + ',''DD/MM/YYYY'') AS DATALIMITE, '+#13+
          '       IM.IMONOME || '' - '' || I.IMONOME AS IMOVEL_EXTENSO, '+#13+
          '       I.IDIMOVEL, I.IMOCODIGO, '+#13+
          '       O.DESCCAFOBRA, O.DTAINICIOOBRA, O.DTAENCERRAOBRA, '+#13+
          '       G.CLASSE, G.NOME AS DESC_GRUPO,          '+#13+
          '       LO.DTALANCAMENTO, LO.VALOFI, LO.NUMNOTA, '+#13+
          '       DECODE(LO.DESCLANCOBRA, NULL, P.NOME, LO.DESCLANCOBRA) AS NOME, '+#13+
          '       RTRIM(OBS.OBS) AS OBS '+#13+
          '  FROM CAFOBRALANC LO,       '+#13+
          '       CAFOBRA O,            '+#13+
          '       LANCAMENTOSIMOVEL LI, '+#13+
          '       OBSLANCIMOVEL OBS,    '+#13+
          '       PESSOA P,             '+#13+
          '       GRUPO G,              '+#13+
          '       IMOVEL I, IMOVEL IM   '+#13+
          ' WHERE (LO.IDLANCIMOVEL = LI.IDLANCIMOVEL(+)) '+#13+
          '   AND (LI.IDDOCUMENTO  = OBS.IDDOCUMENTO(+)) '+#13+
          '   AND (LO.IDCAFOBRA = O.IDCAFOBRA)           '+#13+
          '   AND (O.IDIMOVEL = I.IDIMOVEL(+))           '+#13+
          '   AND (I.IDIMOVELMESTRE = IM.IDIMOVEL)       '+#13+
          '   AND (LO.IDGRUPO = G.IDGRUPO(+))            '+#13+
          '   AND (LI.IDFORCLI = P.IDPESSOA(+))          '+#13+ sParam +
          ' ORDER BY IMOVEL_EXTENSO, I.IDIMOVEL, DESC_GRUPO, DTALANCAMENTO ';

  Result := GetDataPacket( sSql );
end;

function TCtrlRelInvestimob.BucaRelNaoReavalia(const iAno: Integer): OLEVariant;
var sParam, sSql : String;
begin
  sParam := '';
  // Define Parametros
  If iAno <> -1 then sParam := ' AND  TO_CHAR(DATAREAVALIACAO, ''YYYY'') = ' + IntToStr(iAno) +#13;

  sSql :=  ' SELECT DISTINCT                                          ' +#13+
           '        I.IDIMOVEL,                                       ' +#13+
           '        I.IMOCODIGO,                                      ' +#13+
           '        IM.IMONOME || '' - '' || I.IMONOME AS DSC_IMOVEL  ' +#13+
           ' FROM IMOVEL I, IMOVEL IM, IMOVELXBEM IXB, BEM B          ' +#13+
           ' WHERE I.IDIMOVELMESTRE =IM.IDIMOVEL                      ' +#13+
           ' AND I.IDIMOVEL = IXB.IDIMOVEL                            ' +#13+
           ' AND IXB.IDBEM = B.IDBEM                                  ' +#13+
           ' AND B.BAIXATOTAL = ''N''                                 ' +#13+
           ' AND I.IDIMOVEL NOT IN ( SELECT DISTINCT IDIMOVEL         ' +#13+
           '                FROM REAVALIAXREAVALIA                    ' +#13+
           '                WHERE 1=1 ' + sParam + ')'                  +#13+
           ' ORDER BY DSC_IMOVEL '                                      +#13;

  Result := GetDataPacket( sSql );

end;


function TCtrlRelInvestimob.BuscaRelReavalia(const dDataReav:TDateTime; const iIdMoedaCAF, iIdEmpresa : Integer;
                                             const iIdMestre : Integer; const sCodTipImovel: String): OLEVariant;
var sParam, sParam2, sParam3, sSql, sDataReav : String;
begin
  // Define Parametros
  if iIdMestre <> -1           then sParam := ' AND I.IDIMOVELMESTRE = ' + IntToStr(iIdMestre) +#13;
  if trim(sCodTipImovel) <> '' then sParam := sParam +  ' AND I.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) +#13;
  sDataReav := ' TO_DATE( ' + QuotedStr(FormatDateTime('DD/MM/YYYY', dDataReav)) + ',''DD/MM/YYYY'') ';

  // Define Sql
  sSql := 'SELECT I.IDIMOVELMESTRE,                 '+#13+
          '       I.IDIMOVEL, ULT.IDBEM,            '+#13+
          '       IM.IMONOME AS NOME_MESTRE,        '+#13+
          '       I.IMONOME  AS NOME_IMOVEL,        '+#13+
          '       DECODE(UG.IDGRUPANT, NULL, I.CODTIPIMOVEL, UG.CODTIPIMOVELANT) AS CODTIPIMOVEL, '+#13+
          '       DECODE(UG.IDGRUPANT, NULL, T.DESCTIPOIMOVEL, T2.DESCTIPOIMOVEL) AS DESCTIPOIMOVEL,'+#13+
          '       I.IMOCODIGO,                      '+#13+
          '       DECODE(ULT.IXBGRUPO, ''A'', ''Ar Condicionado'', '+#13+
          '                            ''L'', ''Inst. Elétrica'',  '+#13+
          '                            ''T'', ''Terreno'',         '+#13+
          '                            ''E'', ''Edificação'',      '+#13+
          '                            ''M'', ''Máq. e Equip'',    '+#13+
          '                            ''O'', ''Móveis e Utens.'', '+#13+
          '                            ''U'', ''Utilitários'',     '+#13+
          '                            ''V'', ''Veículos'',        '+#13+
          '                            ''I'', ''Instalação'' ) AS TIPO_BEM, '+#13+
          '       PEN.DATAREAVALIACAO AS DATA_PEN_REAVAL, '+#13+
          '       PEN.VLRREAVALIA     AS VLR_PEN_REAVAL,  '+#13+
          '       ULT.VIDAUTIL,                           '+#13+
          '       ULT.DATAREAVALIACAO AS DATA_ULT_REAVAL, '+#13+
          '       ULT.VLRREAVALIA     AS VLR_ULT_REAVAL,  '+#13+
          '       SLD.SLD_ANTERIOR    AS VLR_ULT_ANTERIOR,'+#13+
          '       (ULT.VLRREAVALIA - SLD.SLD_ANTERIOR) AS VLR_VAR_SALDO,   '+#13+
          '       (ULT.VLRREAVALIA - PEN.VLRREAVALIA)  AS VLR_VAR_REAV     '+#13+
          '  FROM IMOVEL I, IMOVEL IM, TIPOIMOVEL T, TIPOIMOVEL T2,        '+#13+
          '       ( SELECT RR.IDIMOVEL, RR.IDBEM, IXB.IXBGRUPO,            '+#13+
          '                RR.DATAREAVALIACAO, RR.VLRREAVALIA, RR.VIDAUTIL '+#13+
          '            FROM REAVALIAXREAVALIA RR, IMOVELXBEM IXB           '+#13+
          '           WHERE RR.IDIMOVEL = IXB.IDIMOVEL        '+#13+
          '             AND RR.IDBEM = IXB.IDBEM              '+#13+
          '             AND RR.DATAREAVALIACAO = ' + sDataReav +#13+
          '        ) ULT, '+#13+
          '        ( SELECT IDIMOVEL, IDBEM,     '+#13+
          '                 DATAREAVALIACAO, VLRREAVALIA, VIDAUTIL '+#13+
          '            FROM REAVALIAXREAVALIA RR '+#13+
          '           WHERE DATAREAVALIACAO IN ( SELECT MAX(DATAREAVALIACAO) AS EVIDATA '+#13+
          '                                        FROM REAVALIAXREAVALIA               '+#13+
          '                                       WHERE IDIMOVEL = RR.IDIMOVEL          '+#13+
          '                                         AND DATAREAVALIACAO NOT IN ( SELECT MAX(DATAREAVALIACAO) AS EVIDATA '+#13+
          '                                                                        FROM REAVALIAXREAVALIA               '+#13+
          '                                                                       WHERE IDIMOVEL = RR.IDIMOVEL ) )      '+#13+
          '        ) PEN, '+#13+
          '        ( '+#13+
          '          SELECT SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBEM, SCB.MOECODIGO, '+#13+
          '                 ( SCB.VALORG + SCB.CMBEM + SCB.REAVVALORG + SCB.REAVCMBEM ) AS SLD_ANTERIOR, '+#13+
          '                 SCB.VALORG, SCB.CMBEM,               '+#13+
          '                 SCB.REAVVALORG, SCB.REAVCMBEM,       '+#13+
          '                 SCB.ULTREAVVALORG, SCB.ULTREAVCMBEM, '+#13+
          '                 SCB.IDGRUPO, SCB.IDLOCALIZACAO, SCB.IDRESPONSAVEL '+#13+
          '            FROM SALDOCONTABBEM SCB,                  '+#13+
          '                 (SELECT S.IDBEM, S.IDPESSOA, S.MOECODIGO, MAX(S.DATASLDBEM) AS DATA '+#13+
          '                    FROM SALDOCONTABBEM S, BEM B    '+#13+
          '                   WHERE (S.IDBEM  = B.IDBEM)       '+#13+
          '                     AND (B.IDMODULO = 54)          '+#13+
          '                     AND (S.IDPESSOA  = ' + IntToStr(iIdEmpresa)  + ')  '+#13+
          '                     AND (S.MOECODIGO = ' + IntToStr(iIdMoedaCAF) + ')  '+#13+
          '                     AND (S.DATASLDBEM <= ' + sDataReav + ' )           '+#13+
          '                   GROUP BY S.IDBEM, S.IDPESSOA, S.MOECODIGO) DTAMAX    '+#13+
          '            WHERE (SCB.IDPESSOA  = ' + IntToStr(iIdEmpresa)  + ')       '+#13+
          '              AND (SCB.MOECODIGO = ' + IntToStr(iIdMoedaCAF) + ')       '+#13+
          '              AND (SCB.IDBEM = DTAMAX.IDBEM)         '+#13+
          '              AND (SCB.IDPESSOA = DTAMAX.IDPESSOA)   '+#13+
          '              AND (SCB.MOECODIGO = DTAMAX.MOECODIGO) '+#13+
          '              AND (SCB.DATASLDBEM = DTAMAX.DATA)     '+#13+
          '        ) SLD, '+#13+

          // Marchetti - Pendencia 25390
          '       ( '+#13+
          '        SELECT T.IDIMOVELORIG, H.IDBEM, T.CODTIPIMOVELANT, H.DATAMOVIMENTACAO, DECODE(T.FLGOPERACAO,''B'',-1,H.IDGRUPANT) AS IDGRUPANT, I.CODTIPIMOVEL'+#13+
          '        FROM TRANSFBEMIMOVEL       T,'+#13+
          '             IMOVEL                I,'+#13+
          '             HISTORICOMOVIMENTACAO H,'+#13+
          '             ( SELECT /*+INDEX(H2 XIE1HISTORICOMOVIMENTACAO) */'+#13+
          '                      H2.IDBEM, MAX(H2.IDMOVIMENTACAO) AS MAXIMO'+#13+
          '                 FROM HISTORICOMOVIMENTACAO H2, TRANSFBEMIMOVEL T,'+#13+
          '                      ( SELECT H1.IDBEM, MIN(H1.DATAMOVIMENTACAO) AS ULTTRANSF'+#13+
          '                          FROM TRANSFBEMIMOVEL       T1,'+#13+
          '                               HISTORICOMOVIMENTACAO H1'+#13+
          '                         WHERE T1.IDMOVIMENTACAO   = H1.IDMOVIMENTACAO'+#13+
          '                           AND T1.FLGOPERACAO      IN (''G'',''B'') '+#13+
          '                           AND H1.DATAMOVIMENTACAO >= ' + sDataReav +#13+
          '                         GROUP BY H1.IDBEM'+#13+
          '                      ) UT'+#13+
          '                WHERE H2.IDBEM            = UT.IDBEM'+#13+
          '                  AND H2.DATAMOVIMENTACAO = UT.ULTTRANSF'+#13+
          '                  AND H2.IDMOVIMENTACAO   = T.IDMOVIMENTACAO'+#13+
          '                 AND T.FLGOPERACAO IN (''G'',''B'') '+#13+
          '               GROUP BY H2.IDBEM'+#13+
          '            ) X'+#13+
          '        WHERE T.FLGOPERACAO      IN (''G'',''B'') '+#13+
          '          AND T.IDIMOVELORIG     = I.IDIMOVEL '+#13+
          '          AND T.IDMOVIMENTACAO   = H.IDMOVIMENTACAO '+#13+
          '          AND H.IDBEM            = X.IDBEM '+#13+
          '          AND H.IDMOVIMENTACAO   = X.MAXIMO '+#13+
          '       ) UG '+#13+
          // Fim Marchetti - Pendencia 25390

          ' WHERE I.IDIMOVELMESTRE = IM.IDIMOVEL     '+#13+
          '   AND I.CODTIPIMOVEL   = T.CODTIPIMOVEL  '+#13+
          '   AND I.IDIMOVEL       = ULT.IDIMOVEL    '+#13+
          '   AND ULT.IDBEM        = SLD.IDBEM(+)    '+#13+
          '   AND ULT.IDIMOVEL     = PEN.IDIMOVEL(+) '+#13+

          // Marchetti - Pendencia 25390
          '   AND (SLD.IDBEM = UG.IDBEM(+)) ' + #13 +
          '   AND UG.CODTIPIMOVELANT = T2.CODTIPIMOVEL(+)'+#13;

          if sCodTipImovel <> '' then
          begin
             sSQL := sSQL +
             'AND ( ( (UG.CODTIPIMOVELANT IS NULL AND I.CODTIPIMOVEL = ' + QuotedStr(sCodTipImovel) + ' ) OR ' + #13 +
             '                             (UG.CODTIPIMOVELANT IS NOT NULL AND UG.CODTIPIMOVELANT = ' + QuotedStr(sCodTipImovel) + ') ) )' + #13;
          end;
          // Fim Marchetti - Pendencia 25390

          sSQL := sSQL +
          '   AND ULT.IDBEM        = PEN.IDBEM(+)    '+#13+ sParam +
          '  ORDER BY DESCTIPOIMOVEL, CODTIPIMOVEL, NOME_MESTRE, IDIMOVELMESTRE, '+#13+
          '           NOME_IMOVEL, IDIMOVEL, TIPO_BEM ';

  Result := GetDataPacket( sSql );
end;

function TCtrlRelInvestimob.BuscaRelSaldoImovel(const iIdMestre,iIdImovel,iIdPessoa,iIdMoedaCAF,iIdPaisCAF:Integer; const dDataBase:TDateTime): OLEVariant;
var sSql, sParam1, sParam2, sDataBase : String;
begin
  // Define Parametros
  sParam1 := '';
  sParam2 := '';
  if iIdMestre > 0 then sParam2 := sParam2 + ' AND VW.IDIMOVELMESTRE = ' + IntToStr(iIdMestre);
  if iIdPessoa > 0 then sParam2 := sParam2 + ' AND VW.IDPESSOA = ' + IntToStr(iIdPessoa);
  if iIdImovel > 0 then begin
    sParam1 := sParam1 + ' AND IXB.IDIMOVEL = ' + IntToStr(iIdImovel);
    sParam2 := sParam2 + ' AND VW.IDIMOVEL = '  + IntToStr(iIdImovel);
  end;

  // Define DataBase
  sDataBase := ' TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY',dDataBase)) + ',''DD/MM/YYYY'')';

  // Define Sql
  sSql := 'SELECT VW.NOME_MESTRE, VW.IMOCODIGO,  VW.NOME_IMOVEL,      VW.IMOVEL_EXTENSO, ' +#13+
          '       VW.DESBEM,      VW.IDIMOVEL,   VW.IDIMOVELMESTRE,   VWT.SUMVALCTB      ' +#13+
          'FROM                ' +#13+
          '   VWBEMXIMOVEL VW, ' +#13+
          '   (                ' +#13+
          '    SELECT /*+ RULE */                                                            '+#13+
          '           B1.IDBEM,                                                              '+#13+
          '           (                                                                      '+#13+
          '            ROUND(SUM(NVL(SB1.VALORG,0)) ,2) + ROUND(SUM(NVL(SB1.CMBEM,0)) ,2) -  '+#13+
          '            ROUND(SUM(NVL(SD1.DEPLANC,0)) ,2) - ROUND(SUM(NVL(SD1.CMDEP,0)) ,2) + '+#13+
          '            ROUND(SUM(NVL(SB1.REAVVALORG,0) + NVL(SB1.ULTREAVVALORG,0)) ,2) +     '+#13+
          '            ROUND(SUM(NVL(SB1.REAVCMBEM,0) + NVL(SB1.ULTREAVCMBEM,0)) ,2) -       '+#13+
          '            ROUND(SUM(NVL(SD1.REAVDEPLANC,0) + NVL(SD1.ULTREAVDEPLANC,0)) ,2) -   '+#13+
          '            ROUND(SUM(NVL(SD1.REAVCMDEP,0) + NVL(SD1.ULTREAVCMDEP,0)) ,2)         '+#13+
          '           ) AS SUMVALCTB                                                         '+#13+
          '      FROM SALDOCONTABBEM SB1, SLDCTBBEMXDEP SD1,                                 '+#13+
          '           BEM B1, GRUPO G1, IMOVELXBEM IXB,                                      '+#13+
          '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA                       '+#13+
          '              FROM SALDOCONTABBEM                       '+#13+
          '             WHERE DATASLDBEM <= ' + sDataBase           +#13+
          '               AND MOECODIGO = ' + IntToStr(iIdMoedaCAF) +#13+
          '               AND IDPESSOA  = ' + IntToStr(iIdPessoa)   +#13+
          '             GROUP BY IDBEM, IDPESSOA) MAX1             '+#13+
          '     WHERE B1.DATAINICIODEP <= ' + sDataBase             +#13+
          '       AND G1.FLGIMOVEL = 1                             '+#13+
          '       AND SB1.MOECODIGO = ' + IntToStr(iIdMoedaCAF)     +#13+
          '       AND SB1.IDPESSOA  = ' + IntToStr(iIdPessoa)       +#13+
          '       AND SD1.IDSLDCTBBEMXDEP = ' + IntToStr(iIdPaisCAF)+#13+
          '       AND B1.IDPESSOA = ' + IntToStr(iIdPessoa)         +#13+
          '       AND B1.IDBEM = IXB.IDBEM                         '+#13+
          '       AND SB1.IDBEM = MAX1.IDBEM                       '+#13+
          '       AND SB1.IDPESSOA = MAX1.IDPESSOA                 '+#13+
          '       AND SB1.DATASLDBEM = MAX1.DATA                   '+#13+
          '       AND SB1.IDBEM = SD1.IDBEM                        '+#13+
          '       AND SB1.IDPESSOA = SD1.IDPESSOA                  '+#13+
          '       AND SB1.DATASLDBEM = SD1.DATASLDBEM              '+#13+
          '       AND SB1.MOECODIGO = SD1.MOECODIGO                '+#13+
          '       AND SB1.IDBEM = B1.IDBEM                         '+#13+
          '       AND SB1.IDPESSOA = B1.IDPESSOA                   '+#13+
          '       AND SB1.IDGRUPO = G1.IDGRUPO                     '+#13+ sParam1 +#13+
          '     GROUP BY B1.IDBEM                                  '+#13+
          '     ) VWT                                              '+#13+
          'WHERE ( VW.IDBEM = VWT.IDBEM ) ' +#13+ sParam2 +#13+
          'ORDER BY VW.IMOVEL_EXTENSO, VW.IDIMOVEL, VW.DESBEM ';

  Result := GetDataPacket( sSql );
end;

end.
